from math import exp, log
import array
import numpy as np
import os
import scipy
from numpy import array, random, tile
from pyspark import since
from pyspark.mllib.clustering import KMeansModel
from pyspark.mllib.common import callMLlibFunc
from pyspark.mllib.feature import Normalizer
from pyspark.mllib.linalg import SparseVector, DenseVector, Vectors, Vector
from pyspark.rdd import RDD


def _convert_to_vector(l, shape=4):
    l = np.array(l).reshape(shape)
    l = Vectors.dense(l)
    #print(l,len(l))
    _have_scipy = True
    if isinstance(l, Vector):
        #print(len(l))
        return l
    elif type(l) in (array.array, np.array, np.ndarray, list, tuple, range):
        return DenseVector(l)
    elif _have_scipy and scipy.sparse.issparse(l):
        assert l.shape[1] == 1, "Expected column vector"
        # Make sure the converted csc_matrix has sorted indices.
        csc = l.tocsc()
        if not csc.has_sorted_indices:
            csc.sort_indices()
        return SparseVector(l.shape[0], csc.indices, csc.data)
    else:
        raise TypeError("Cannot convert type %s into Vector" % type(l))

class StreamingKMeansModel(KMeansModel):
    """
    Clustering model which can perform an online update of the centroids.
    The update formula for each centroid is given by
    - c_t+1 = ((c_t * n_t * a) + (x_t * m_t)) / (n_t + m_t)
    - n_t+1 = n_t * a + m_t
    where
    - c_t: Centroid at the n_th iteration.
    - n_t: Number of samples (or) weights associated with the centroid
      at the n_th iteration.
    - x_t: Centroid of the new data closest to c_t.
    - m_t: Number of samples (or) weights of the new data closest to c_t
    - c_t+1: New centroid.
    - n_t+1: New number of weights.
    - a: Decay Factor, which gives the forgetfulness.
    .. versionadded:: 1.5.0
    Parameters
    ----------
    clusterCenters : list of :py:class:`pyspark.mllib.linalg.Vector` or covertible
        Initial cluster centers.
    clusterWeights : :py:class:`pyspark.mllib.linalg.Vector` or covertible
        List of weights assigned to each cluster.
    Notes
    -----
    If a is set to 1, it is the weighted mean of the previous
    and new data. If it set to zero, the old centroids are completely
    forgotten.
    """
    def __init__(self, clusterCenters, clusterWeights):
        super(StreamingKMeansModel, self).__init__(centers=clusterCenters)
        self._clusterWeights = list(clusterWeights)
        self.normalizer = Normalizer()

    @property
    @since('1.5.0')
    def clusterWeights(self):
        """Return the cluster weights."""
        return self._clusterWeights

    @since('1.5.0')
    def update(self, data, decayFactor, timeUnit, shape = 4):
        """Update the centroids, according to data
        """
        if not isinstance(data, RDD):
            raise TypeError("Data should be of an RDD, got %s." % type(data))
        data = data.map(_convert_to_vector)
        decayFactor = float(decayFactor)
        if timeUnit not in ["batches", "points"]:
            raise ValueError(
                "timeUnit should be 'batches' or 'points', got %s." % timeUnit)
        vectorCenters = [_convert_to_vector(center, shape) for center in self.centers]
        updatedModel = callMLlibFunc(
            "updateStreamingKMeansModel", vectorCenters, self._clusterWeights,
            data, decayFactor, timeUnit)
        self.centers = updatedModel[0]
        self._clusterWeights = list(updatedModel[1])
        return self

    @since('1.5.0')
    def save(self, sc, path):
        """
        Save this model to the given path.
        """
        if not os.path.exists(path):
            os.makedirs(path)
        np.save(path+"/weights.npy", list(self._clusterWeights))
        np.save(path+"/centers.npy", list(self.centers))

    @since('1.5.0')
    def remove(self, sc, path):
        """
        Save this model to the given path.
        """
        if os.path.exists(path+"/weights.npy"):
            os.remove(path+"/weights.npy")
        if os.path.exists(path+"/centers.npy"):
            os.remove(path+"/centers.npy")

class StreamingKMeans(object):
    """
    Provides methods to set k, decayFactor, timeUnit to configure the
    KMeans algorithm for fitting and predicting on incoming dstreams.
    More details on how the centroids are updated are provided under the
    docs of StreamingKMeansModel.
    """
    def __init__(self, k=2, decayFactor=1.0, timeUnit="batches"):
        self._k = k
        self._decayFactor = decayFactor
        if timeUnit not in ["batches", "points"]:
            raise ValueError(
                "timeUnit should be 'batches' or 'points', got %s." % timeUnit)
        self._timeUnit = timeUnit
        self._model = None
        self.normalizer = Normalizer()

    def latestModel(self):
        """Return the latest model"""
        return self._model

    def _validate(self, dstream):
        if self._model is None:
            raise ValueError(
                "Initial centers should be set either by setInitialCenters "
                "or setRandomCenters.")
        '''if not isinstance(dstream, DStream):
            raise TypeError(
                "Expected dstream to be of type DStream, "
                "got type %s" % type(dstream))'''

    def setK(self, k):
        """Set number of clusters."""
        self._k = k
        return self

    def setDecayFactor(self, decayFactor):
        """Set decay factor."""
        self._decayFactor = decayFactor
        return self

    def setHalfLife(self, halfLife, timeUnit):
        """
        Set number of batches after which the centroids of that
        particular batch has half the weightage.
        """
        self._timeUnit = timeUnit
        self._decayFactor = exp(log(0.5) / halfLife)
        return self

    def load(self, sc, path):
        self._model = self._model.load(sc, path)
        return self

    def setInitialCenters(self, centers, weights):
        """
        Set initial centers. Should be set before calling trainOn.
        """
        self._model = StreamingKMeansModel(centers, weights)
        return self

    def setRandomCenters(self, dim, weight, seed):
        """
        Set the initial centers to be random samples from
        a gaussian population with constant weights.
        """
        rng = random.RandomState(seed)
        clusterCenters = rng.randn(self._k, dim)
        clusterWeights =  tile(weight * 0.2, int(self._k * 0.1))
        clusterWeights = np.concatenate((clusterWeights, tile(weight * 0.5, int(self._k * 0.3))))
        clusterWeights = np.concatenate((clusterWeights, tile(weight, self._k - int(self._k*0.3) - int(self._k*0.1) )))
        self._model = StreamingKMeansModel(clusterCenters, clusterWeights)
        return self

    def trainOn(self, dstream):
        """Train the model on the incoming dstream."""
        self._validate(dstream)
        self._model.update(dstream.rdd, self._decayFactor, self._timeUnit)

    def predictOn(self, dstream):
        """
        Make predictions on a dstream.
        Returns a transformed dstream object
        """
        labels = dstream.rdd.map(lambda x: x['create_time'])
        features = dstream.drop("create_time").rdd
        features = features.map(_convert_to_vector)
        predictions = labels.zip(self._model.predict(features))
        return predictions

    def save(self, sc, path):
        self._model.save(sc , path+"/"+str(self._k))

    def remove(self, sc, path):
        self._model.remove(sc , path+"/"+str(self._k))



