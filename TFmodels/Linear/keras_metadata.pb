
�root"_tf_keras_sequential*�{"name": "Linear", "trainable": true, "expects_training_arg": true, "dtype": "float32", "batch_input_shape": null, "must_restore_from_config": false, "class_name": "Sequential", "config": {"name": "Linear", "layers": [{"class_name": "InputLayer", "config": {"batch_input_shape": {"class_name": "__tuple__", "items": [null, null, 51]}, "dtype": "float32", "sparse": false, "ragged": false, "name": "lambda_input"}}, {"class_name": "Lambda", "config": {"name": "lambda", "trainable": true, "dtype": "float32", "function": {"class_name": "__tuple__", "items": ["4wEAAAAAAAAAAAAAAAEAAAAFAAAAUwAAAHMaAAAAfABkAGQAhQJkAWQAhQJkAGQAhQJmAxkAUwCp\nAk7p/////6kAqQHaAXhyAwAAAHIDAAAA+lUvVXNlcnMvbW90aS9QeWNoYXJtUHJvamVjdHMvUkRC\nTVNfV29ya2xvYWRfRm9yZWNhc3Rlci9mb3JlY2FzdGVyL3RlbnNvcmZsb3doYW5kbGVyLnB52gg8\nbGFtYmRhPpcAAADzAAAAAA==\n", null, null]}, "function_type": "lambda", "module": "forecaster.tensorflowhandler", "output_shape": null, "output_shape_type": "raw", "output_shape_module": null, "arguments": {}}}, {"class_name": "Dense", "config": {"name": "dense", "trainable": true, "dtype": "float32", "units": 153, "activation": "linear", "use_bias": true, "kernel_initializer": {"class_name": "Zeros", "config": {}}, "bias_initializer": {"class_name": "Zeros", "config": {}}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}}, {"class_name": "Reshape", "config": {"name": "reshape", "trainable": true, "dtype": "float32", "target_shape": {"class_name": "__tuple__", "items": [3, 51]}}}]}, "shared_object_id": 6, "build_input_shape": {"class_name": "TensorShape", "items": [null, null, 51]}, "is_graph_network": true, "save_spec": {"class_name": "TypeSpec", "type_spec": "tf.TensorSpec", "serialized": [{"class_name": "TensorShape", "items": [null, null, 51]}, "float32", "lambda_input"]}, "keras_version": "2.5.0", "backend": "tensorflow", "model_config": {"class_name": "Sequential", "config": {"name": "Linear", "layers": [{"class_name": "InputLayer", "config": {"batch_input_shape": {"class_name": "__tuple__", "items": [null, null, 51]}, "dtype": "float32", "sparse": false, "ragged": false, "name": "lambda_input"}, "shared_object_id": 0}, {"class_name": "Lambda", "config": {"name": "lambda", "trainable": true, "dtype": "float32", "function": {"class_name": "__tuple__", "items": ["4wEAAAAAAAAAAAAAAAEAAAAFAAAAUwAAAHMaAAAAfABkAGQAhQJkAWQAhQJkAGQAhQJmAxkAUwCp\nAk7p/////6kAqQHaAXhyAwAAAHIDAAAA+lUvVXNlcnMvbW90aS9QeWNoYXJtUHJvamVjdHMvUkRC\nTVNfV29ya2xvYWRfRm9yZWNhc3Rlci9mb3JlY2FzdGVyL3RlbnNvcmZsb3doYW5kbGVyLnB52gg8\nbGFtYmRhPpcAAADzAAAAAA==\n", null, null]}, "function_type": "lambda", "module": "forecaster.tensorflowhandler", "output_shape": null, "output_shape_type": "raw", "output_shape_module": null, "arguments": {}}, "shared_object_id": 1}, {"class_name": "Dense", "config": {"name": "dense", "trainable": true, "dtype": "float32", "units": 153, "activation": "linear", "use_bias": true, "kernel_initializer": {"class_name": "Zeros", "config": {}, "shared_object_id": 2}, "bias_initializer": {"class_name": "Zeros", "config": {}, "shared_object_id": 3}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "shared_object_id": 4}, {"class_name": "Reshape", "config": {"name": "reshape", "trainable": true, "dtype": "float32", "target_shape": {"class_name": "__tuple__", "items": [3, 51]}}, "shared_object_id": 5}]}}, "training_config": {"loss": {"class_name": "MeanSquaredError", "config": {"reduction": "auto", "name": "mean_squared_error"}, "shared_object_id": 7}, "metrics": [[{"class_name": "MeanAbsoluteError", "config": {"name": "mean_absolute_error", "dtype": "float32"}, "shared_object_id": 8}]], "weighted_metrics": null, "loss_weights": null, "optimizer_config": {"class_name": "Adam", "config": {"name": "Adam", "learning_rate": 0.009999999776482582, "decay": 0.0, "beta_1": 0.8999999761581421, "beta_2": 0.9990000128746033, "epsilon": 1e-07, "amsgrad": false}}}}2
�root.layer-0"_tf_keras_layer*�{"name": "lambda", "trainable": true, "expects_training_arg": true, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "class_name": "Lambda", "config": {"name": "lambda", "trainable": true, "dtype": "float32", "function": {"class_name": "__tuple__", "items": ["4wEAAAAAAAAAAAAAAAEAAAAFAAAAUwAAAHMaAAAAfABkAGQAhQJkAWQAhQJkAGQAhQJmAxkAUwCp\nAk7p/////6kAqQHaAXhyAwAAAHIDAAAA+lUvVXNlcnMvbW90aS9QeWNoYXJtUHJvamVjdHMvUkRC\nTVNfV29ya2xvYWRfRm9yZWNhc3Rlci9mb3JlY2FzdGVyL3RlbnNvcmZsb3doYW5kbGVyLnB52gg8\nbGFtYmRhPpcAAADzAAAAAA==\n", null, null]}, "function_type": "lambda", "module": "forecaster.tensorflowhandler", "output_shape": null, "output_shape_type": "raw", "output_shape_module": null, "arguments": {}}, "shared_object_id": 1}2
�root.layer_with_weights-0"_tf_keras_layer*�{"name": "dense", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "class_name": "Dense", "config": {"name": "dense", "trainable": true, "dtype": "float32", "units": 153, "activation": "linear", "use_bias": true, "kernel_initializer": {"class_name": "Zeros", "config": {}, "shared_object_id": 2}, "bias_initializer": {"class_name": "Zeros", "config": {}, "shared_object_id": 3}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "shared_object_id": 4, "input_spec": {"class_name": "InputSpec", "config": {"dtype": null, "shape": null, "ndim": null, "max_ndim": null, "min_ndim": 2, "axes": {"-1": 51}}, "shared_object_id": 9}, "build_input_shape": {"class_name": "TensorShape", "items": [null, null, 51]}}2
�root.layer-2"_tf_keras_layer*�{"name": "reshape", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "class_name": "Reshape", "config": {"name": "reshape", "trainable": true, "dtype": "float32", "target_shape": {"class_name": "__tuple__", "items": [3, 51]}}, "shared_object_id": 5}2
�1root.keras_api.metrics.0"_tf_keras_metric*�{"class_name": "Mean", "name": "loss", "dtype": "float32", "config": {"name": "loss", "dtype": "float32"}, "shared_object_id": 10}2
�2root.keras_api.metrics.1"_tf_keras_metric*�{"class_name": "MeanAbsoluteError", "name": "mean_absolute_error", "dtype": "float32", "config": {"name": "mean_absolute_error", "dtype": "float32"}, "shared_object_id": 8}2