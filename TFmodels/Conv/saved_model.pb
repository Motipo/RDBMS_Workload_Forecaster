??
??
B
AssignVariableOp
resource
value"dtype"
dtypetype?
~
BiasAdd

value"T	
bias"T
output"T" 
Ttype:
2	"-
data_formatstringNHWC:
NHWCNCHW
h
ConcatV2
values"T*N
axis"Tidx
output"T"
Nint(0"	
Ttype"
Tidxtype0:
2	
8
Const
output"dtype"
valuetensor"
dtypetype
?
Conv2D

input"T
filter"T
output"T"
Ttype:	
2"
strides	list(int)"
use_cudnn_on_gpubool(",
paddingstring:
SAMEVALIDEXPLICIT""
explicit_paddings	list(int)
 "-
data_formatstringNHWC:
NHWCNCHW" 
	dilations	list(int)

W

ExpandDims

input"T
dim"Tdim
output"T"	
Ttype"
Tdimtype0:
2	
?
GatherV2
params"Tparams
indices"Tindices
axis"Taxis
output"Tparams"

batch_dimsint "
Tparamstype"
Tindicestype:
2	"
Taxistype:
2	
.
Identity

input"T
output"T"	
Ttype
q
MatMul
a"T
b"T
product"T"
transpose_abool( "
transpose_bbool( "
Ttype:

2	
e
MergeV2Checkpoints
checkpoint_prefixes
destination_prefix"
delete_old_dirsbool(?

NoOp
M
Pack
values"T*N
output"T"
Nint(0"	
Ttype"
axisint 
C
Placeholder
output"dtype"
dtypetype"
shapeshape:
?
Prod

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( " 
Ttype:
2	"
Tidxtype0:
2	
@
ReadVariableOp
resource
value"dtype"
dtypetype?
E
Relu
features"T
activations"T"
Ttype:
2	
[
Reshape
tensor"T
shape"Tshape
output"T"	
Ttype"
Tshapetype0:
2	
o
	RestoreV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0?
l
SaveV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0?
?
Select
	condition

t"T
e"T
output"T"	
Ttype
P
Shape

input"T
output"out_type"	
Ttype"
out_typetype0:
2	
H
ShardedFilename
basename	
shard

num_shards
filename
N
Squeeze

input"T
output"T"	
Ttype"
squeeze_dims	list(int)
 (
?
StatefulPartitionedCall
args2Tin
output2Tout"
Tin
list(type)("
Tout
list(type)("	
ffunc"
configstring "
config_protostring "
executor_typestring ?
@
StaticRegexFullMatch	
input

output
"
patternstring
?
StridedSlice

input"T
begin"Index
end"Index
strides"Index
output"T"	
Ttype"
Indextype:
2	"

begin_maskint "
end_maskint "
ellipsis_maskint "
new_axis_maskint "
shrink_axis_maskint 
N

StringJoin
inputs*N

output"
Nint(0"
	separatorstring 
P
	Transpose
x"T
perm"Tperm
y"T"	
Ttype"
Tpermtype0:
2	
?
VarHandleOp
resource"
	containerstring "
shared_namestring "
dtypetype"
shapeshape"#
allowed_deviceslist(string)
 ?"serve*	2.5.0-rc32v2.5.0-rc2-14-gfcdf65934708??
{
conv1d/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:3?*
shared_nameconv1d/kernel
t
!conv1d/kernel/Read/ReadVariableOpReadVariableOpconv1d/kernel*#
_output_shapes
:3?*
dtype0
o
conv1d/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:?*
shared_nameconv1d/bias
h
conv1d/bias/Read/ReadVariableOpReadVariableOpconv1d/bias*
_output_shapes	
:?*
dtype0
z
dense_4/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:
??*
shared_namedense_4/kernel
s
"dense_4/kernel/Read/ReadVariableOpReadVariableOpdense_4/kernel* 
_output_shapes
:
??*
dtype0
q
dense_4/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:?*
shared_namedense_4/bias
j
 dense_4/bias/Read/ReadVariableOpReadVariableOpdense_4/bias*
_output_shapes	
:?*
dtype0
f
	Adam/iterVarHandleOp*
_output_shapes
: *
dtype0	*
shape: *
shared_name	Adam/iter
_
Adam/iter/Read/ReadVariableOpReadVariableOp	Adam/iter*
_output_shapes
: *
dtype0	
j
Adam/beta_1VarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_nameAdam/beta_1
c
Adam/beta_1/Read/ReadVariableOpReadVariableOpAdam/beta_1*
_output_shapes
: *
dtype0
j
Adam/beta_2VarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_nameAdam/beta_2
c
Adam/beta_2/Read/ReadVariableOpReadVariableOpAdam/beta_2*
_output_shapes
: *
dtype0
h

Adam/decayVarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_name
Adam/decay
a
Adam/decay/Read/ReadVariableOpReadVariableOp
Adam/decay*
_output_shapes
: *
dtype0
x
Adam/learning_rateVarHandleOp*
_output_shapes
: *
dtype0*
shape: *#
shared_nameAdam/learning_rate
q
&Adam/learning_rate/Read/ReadVariableOpReadVariableOpAdam/learning_rate*
_output_shapes
: *
dtype0
^
totalVarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_nametotal
W
total/Read/ReadVariableOpReadVariableOptotal*
_output_shapes
: *
dtype0
^
countVarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_namecount
W
count/Read/ReadVariableOpReadVariableOpcount*
_output_shapes
: *
dtype0
b
total_1VarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_name	total_1
[
total_1/Read/ReadVariableOpReadVariableOptotal_1*
_output_shapes
: *
dtype0
b
count_1VarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_name	count_1
[
count_1/Read/ReadVariableOpReadVariableOpcount_1*
_output_shapes
: *
dtype0
?
Adam/conv1d/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:3?*%
shared_nameAdam/conv1d/kernel/m
?
(Adam/conv1d/kernel/m/Read/ReadVariableOpReadVariableOpAdam/conv1d/kernel/m*#
_output_shapes
:3?*
dtype0
}
Adam/conv1d/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:?*#
shared_nameAdam/conv1d/bias/m
v
&Adam/conv1d/bias/m/Read/ReadVariableOpReadVariableOpAdam/conv1d/bias/m*
_output_shapes	
:?*
dtype0
?
Adam/dense_4/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:
??*&
shared_nameAdam/dense_4/kernel/m
?
)Adam/dense_4/kernel/m/Read/ReadVariableOpReadVariableOpAdam/dense_4/kernel/m* 
_output_shapes
:
??*
dtype0

Adam/dense_4/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:?*$
shared_nameAdam/dense_4/bias/m
x
'Adam/dense_4/bias/m/Read/ReadVariableOpReadVariableOpAdam/dense_4/bias/m*
_output_shapes	
:?*
dtype0
?
Adam/conv1d/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:3?*%
shared_nameAdam/conv1d/kernel/v
?
(Adam/conv1d/kernel/v/Read/ReadVariableOpReadVariableOpAdam/conv1d/kernel/v*#
_output_shapes
:3?*
dtype0
}
Adam/conv1d/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:?*#
shared_nameAdam/conv1d/bias/v
v
&Adam/conv1d/bias/v/Read/ReadVariableOpReadVariableOpAdam/conv1d/bias/v*
_output_shapes	
:?*
dtype0
?
Adam/dense_4/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:
??*&
shared_nameAdam/dense_4/kernel/v
?
)Adam/dense_4/kernel/v/Read/ReadVariableOpReadVariableOpAdam/dense_4/kernel/v* 
_output_shapes
:
??*
dtype0

Adam/dense_4/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:?*$
shared_nameAdam/dense_4/bias/v
x
'Adam/dense_4/bias/v/Read/ReadVariableOpReadVariableOpAdam/dense_4/bias/v*
_output_shapes	
:?*
dtype0

NoOpNoOp
? 
ConstConst"/device:CPU:0*
_output_shapes
: *
dtype0*? 
value? B?  B? 
?
layer-0
layer_with_weights-0
layer-1
layer_with_weights-1
layer-2
layer-3
	optimizer
regularization_losses
trainable_variables
	variables
		keras_api


signatures
R
regularization_losses
trainable_variables
	variables
	keras_api
h

kernel
bias
regularization_losses
trainable_variables
	variables
	keras_api
h

kernel
bias
regularization_losses
trainable_variables
	variables
	keras_api
R
regularization_losses
trainable_variables
	variables
	keras_api
?
iter

 beta_1

!beta_2
	"decay
#learning_ratemHmImJmKvLvMvNvO
 

0
1
2
3

0
1
2
3
?
regularization_losses
$layer_metrics
trainable_variables
%layer_regularization_losses
&metrics

'layers
(non_trainable_variables
	variables
 
 
 
 
?
regularization_losses
)layer_metrics
trainable_variables
*layer_regularization_losses
+metrics

,layers
-non_trainable_variables
	variables
YW
VARIABLE_VALUEconv1d/kernel6layer_with_weights-0/kernel/.ATTRIBUTES/VARIABLE_VALUE
US
VARIABLE_VALUEconv1d/bias4layer_with_weights-0/bias/.ATTRIBUTES/VARIABLE_VALUE
 

0
1

0
1
?
regularization_losses
.layer_metrics
trainable_variables
/layer_regularization_losses
0metrics

1layers
2non_trainable_variables
	variables
ZX
VARIABLE_VALUEdense_4/kernel6layer_with_weights-1/kernel/.ATTRIBUTES/VARIABLE_VALUE
VT
VARIABLE_VALUEdense_4/bias4layer_with_weights-1/bias/.ATTRIBUTES/VARIABLE_VALUE
 

0
1

0
1
?
regularization_losses
3layer_metrics
trainable_variables
4layer_regularization_losses
5metrics

6layers
7non_trainable_variables
	variables
 
 
 
?
regularization_losses
8layer_metrics
trainable_variables
9layer_regularization_losses
:metrics

;layers
<non_trainable_variables
	variables
HF
VARIABLE_VALUE	Adam/iter)optimizer/iter/.ATTRIBUTES/VARIABLE_VALUE
LJ
VARIABLE_VALUEAdam/beta_1+optimizer/beta_1/.ATTRIBUTES/VARIABLE_VALUE
LJ
VARIABLE_VALUEAdam/beta_2+optimizer/beta_2/.ATTRIBUTES/VARIABLE_VALUE
JH
VARIABLE_VALUE
Adam/decay*optimizer/decay/.ATTRIBUTES/VARIABLE_VALUE
ZX
VARIABLE_VALUEAdam/learning_rate2optimizer/learning_rate/.ATTRIBUTES/VARIABLE_VALUE
 
 

=0
>1

0
1
2
3
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
4
	?total
	@count
A	variables
B	keras_api
D
	Ctotal
	Dcount
E
_fn_kwargs
F	variables
G	keras_api
OM
VARIABLE_VALUEtotal4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUE
OM
VARIABLE_VALUEcount4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUE

?0
@1

A	variables
QO
VARIABLE_VALUEtotal_14keras_api/metrics/1/total/.ATTRIBUTES/VARIABLE_VALUE
QO
VARIABLE_VALUEcount_14keras_api/metrics/1/count/.ATTRIBUTES/VARIABLE_VALUE
 

C0
D1

F	variables
|z
VARIABLE_VALUEAdam/conv1d/kernel/mRlayer_with_weights-0/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
xv
VARIABLE_VALUEAdam/conv1d/bias/mPlayer_with_weights-0/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
}{
VARIABLE_VALUEAdam/dense_4/kernel/mRlayer_with_weights-1/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
yw
VARIABLE_VALUEAdam/dense_4/bias/mPlayer_with_weights-1/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
|z
VARIABLE_VALUEAdam/conv1d/kernel/vRlayer_with_weights-0/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
xv
VARIABLE_VALUEAdam/conv1d/bias/vPlayer_with_weights-0/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
}{
VARIABLE_VALUEAdam/dense_4/kernel/vRlayer_with_weights-1/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
yw
VARIABLE_VALUEAdam/dense_4/bias/vPlayer_with_weights-1/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
?
serving_default_lambda_2_inputPlaceholder*4
_output_shapes"
 :??????????????????3*
dtype0*)
shape :??????????????????3
?
StatefulPartitionedCallStatefulPartitionedCallserving_default_lambda_2_inputconv1d/kernelconv1d/biasdense_4/kerneldense_4/bias*
Tin	
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:?????????3*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *,
f'R%
#__inference_signature_wrapper_15164
O
saver_filenamePlaceholder*
_output_shapes
: *
dtype0*
shape: 
?
StatefulPartitionedCall_1StatefulPartitionedCallsaver_filename!conv1d/kernel/Read/ReadVariableOpconv1d/bias/Read/ReadVariableOp"dense_4/kernel/Read/ReadVariableOp dense_4/bias/Read/ReadVariableOpAdam/iter/Read/ReadVariableOpAdam/beta_1/Read/ReadVariableOpAdam/beta_2/Read/ReadVariableOpAdam/decay/Read/ReadVariableOp&Adam/learning_rate/Read/ReadVariableOptotal/Read/ReadVariableOpcount/Read/ReadVariableOptotal_1/Read/ReadVariableOpcount_1/Read/ReadVariableOp(Adam/conv1d/kernel/m/Read/ReadVariableOp&Adam/conv1d/bias/m/Read/ReadVariableOp)Adam/dense_4/kernel/m/Read/ReadVariableOp'Adam/dense_4/bias/m/Read/ReadVariableOp(Adam/conv1d/kernel/v/Read/ReadVariableOp&Adam/conv1d/bias/v/Read/ReadVariableOp)Adam/dense_4/kernel/v/Read/ReadVariableOp'Adam/dense_4/bias/v/Read/ReadVariableOpConst*"
Tin
2	*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *'
f"R 
__inference__traced_save_15494
?
StatefulPartitionedCall_2StatefulPartitionedCallsaver_filenameconv1d/kernelconv1d/biasdense_4/kerneldense_4/bias	Adam/iterAdam/beta_1Adam/beta_2
Adam/decayAdam/learning_ratetotalcounttotal_1count_1Adam/conv1d/kernel/mAdam/conv1d/bias/mAdam/dense_4/kernel/mAdam/dense_4/bias/mAdam/conv1d/kernel/vAdam/conv1d/bias/vAdam/dense_4/kernel/vAdam/dense_4/bias/v*!
Tin
2*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? **
f%R#
!__inference__traced_restore_15567??
?
`
D__inference_reshape_2_layer_call_and_return_conditional_losses_14997

inputs
identityD
ShapeShapeinputs*
T0*
_output_shapes
:2
Shapet
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice/stackx
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice/stack_1x
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice/stack_2?
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
strided_sliced
Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2
Reshape/shape/1d
Reshape/shape/2Const*
_output_shapes
: *
dtype0*
value	B :32
Reshape/shape/2?
Reshape/shapePackstrided_slice:output:0Reshape/shape/1:output:0Reshape/shape/2:output:0*
N*
T0*
_output_shapes
:2
Reshape/shapes
ReshapeReshapeinputsReshape/shape:output:0*
T0*+
_output_shapes
:?????????32	
Reshapeh
IdentityIdentityReshape:output:0*
T0*+
_output_shapes
:?????????32

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*4
_input_shapes#
!:???????????????????:] Y
5
_output_shapes#
!:???????????????????
 
_user_specified_nameinputs
?
_
C__inference_lambda_2_layer_call_and_return_conditional_losses_15053

inputs
identity
strided_slice/stackConst*
_output_shapes
:*
dtype0*!
valueB"    ????    2
strided_slice/stack?
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*!
valueB"            2
strided_slice/stack_1?
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*!
valueB"         2
strided_slice/stack_2?
strided_sliceStridedSliceinputsstrided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*4
_output_shapes"
 :??????????????????3*

begin_mask*
end_mask2
strided_slicew
IdentityIdentitystrided_slice:output:0*
T0*4
_output_shapes"
 :??????????????????32

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*3
_input_shapes"
 :??????????????????3:\ X
4
_output_shapes"
 :??????????????????3
 
_user_specified_nameinputs
?
?
?__inference_Conv_layer_call_and_return_conditional_losses_15127
lambda_2_input#
conv1d_15115:3?
conv1d_15117:	?!
dense_4_15120:
??
dense_4_15122:	?
identity??conv1d/StatefulPartitionedCall?dense_4/StatefulPartitionedCall?
lambda_2/PartitionedCallPartitionedCalllambda_2_input*
Tin
2*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :??????????????????3* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *L
fGRE
C__inference_lambda_2_layer_call_and_return_conditional_losses_149242
lambda_2/PartitionedCall?
conv1d/StatefulPartitionedCallStatefulPartitionedCall!lambda_2/PartitionedCall:output:0conv1d_15115conv1d_15117*
Tin
2*
Tout
2*
_collective_manager_ids
 *5
_output_shapes#
!:???????????????????*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *J
fERC
A__inference_conv1d_layer_call_and_return_conditional_losses_149422 
conv1d/StatefulPartitionedCall?
dense_4/StatefulPartitionedCallStatefulPartitionedCall'conv1d/StatefulPartitionedCall:output:0dense_4_15120dense_4_15122*
Tin
2*
Tout
2*
_collective_manager_ids
 *5
_output_shapes#
!:???????????????????*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *K
fFRD
B__inference_dense_4_layer_call_and_return_conditional_losses_149782!
dense_4/StatefulPartitionedCall?
reshape_2/PartitionedCallPartitionedCall(dense_4/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:?????????3* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *M
fHRF
D__inference_reshape_2_layer_call_and_return_conditional_losses_149972
reshape_2/PartitionedCall?
IdentityIdentity"reshape_2/PartitionedCall:output:0^conv1d/StatefulPartitionedCall ^dense_4/StatefulPartitionedCall*
T0*+
_output_shapes
:?????????32

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*;
_input_shapes*
(:??????????????????3: : : : 2@
conv1d/StatefulPartitionedCallconv1d/StatefulPartitionedCall2B
dense_4/StatefulPartitionedCalldense_4/StatefulPartitionedCall:d `
4
_output_shapes"
 :??????????????????3
(
_user_specified_namelambda_2_input
?
D
(__inference_lambda_2_layer_call_fn_15310

inputs
identity?
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :??????????????????3* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *L
fGRE
C__inference_lambda_2_layer_call_and_return_conditional_losses_150532
PartitionedCally
IdentityIdentityPartitionedCall:output:0*
T0*4
_output_shapes"
 :??????????????????32

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*3
_input_shapes"
 :??????????????????3:\ X
4
_output_shapes"
 :??????????????????3
 
_user_specified_nameinputs
?3
?
__inference__traced_save_15494
file_prefix,
(savev2_conv1d_kernel_read_readvariableop*
&savev2_conv1d_bias_read_readvariableop-
)savev2_dense_4_kernel_read_readvariableop+
'savev2_dense_4_bias_read_readvariableop(
$savev2_adam_iter_read_readvariableop	*
&savev2_adam_beta_1_read_readvariableop*
&savev2_adam_beta_2_read_readvariableop)
%savev2_adam_decay_read_readvariableop1
-savev2_adam_learning_rate_read_readvariableop$
 savev2_total_read_readvariableop$
 savev2_count_read_readvariableop&
"savev2_total_1_read_readvariableop&
"savev2_count_1_read_readvariableop3
/savev2_adam_conv1d_kernel_m_read_readvariableop1
-savev2_adam_conv1d_bias_m_read_readvariableop4
0savev2_adam_dense_4_kernel_m_read_readvariableop2
.savev2_adam_dense_4_bias_m_read_readvariableop3
/savev2_adam_conv1d_kernel_v_read_readvariableop1
-savev2_adam_conv1d_bias_v_read_readvariableop4
0savev2_adam_dense_4_kernel_v_read_readvariableop2
.savev2_adam_dense_4_bias_v_read_readvariableop
savev2_const

identity_1??MergeV2Checkpoints?
StaticRegexFullMatchStaticRegexFullMatchfile_prefix"/device:CPU:**
_output_shapes
: *
pattern
^s3://.*2
StaticRegexFullMatchc
ConstConst"/device:CPU:**
_output_shapes
: *
dtype0*
valueB B.part2
Constl
Const_1Const"/device:CPU:**
_output_shapes
: *
dtype0*
valueB B
_temp/part2	
Const_1?
SelectSelectStaticRegexFullMatch:output:0Const:output:0Const_1:output:0"/device:CPU:**
T0*
_output_shapes
: 2
Selectt

StringJoin
StringJoinfile_prefixSelect:output:0"/device:CPU:**
N*
_output_shapes
: 2

StringJoinZ

num_shardsConst*
_output_shapes
: *
dtype0*
value	B :2

num_shards
ShardedFilename/shardConst"/device:CPU:0*
_output_shapes
: *
dtype0*
value	B : 2
ShardedFilename/shard?
ShardedFilenameShardedFilenameStringJoin:output:0ShardedFilename/shard:output:0num_shards:output:0"/device:CPU:0*
_output_shapes
: 2
ShardedFilename?
SaveV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:*
dtype0*?

value?
B?
B6layer_with_weights-0/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-0/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-1/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-1/bias/.ATTRIBUTES/VARIABLE_VALUEB)optimizer/iter/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_1/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_2/.ATTRIBUTES/VARIABLE_VALUEB*optimizer/decay/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/learning_rate/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/count/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-0/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-0/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-1/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-1/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-0/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-0/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-1/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-1/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPH2
SaveV2/tensor_names?
SaveV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:*
dtype0*?
value6B4B B B B B B B B B B B B B B B B B B B B B B 2
SaveV2/shape_and_slices?
SaveV2SaveV2ShardedFilename:filename:0SaveV2/tensor_names:output:0 SaveV2/shape_and_slices:output:0(savev2_conv1d_kernel_read_readvariableop&savev2_conv1d_bias_read_readvariableop)savev2_dense_4_kernel_read_readvariableop'savev2_dense_4_bias_read_readvariableop$savev2_adam_iter_read_readvariableop&savev2_adam_beta_1_read_readvariableop&savev2_adam_beta_2_read_readvariableop%savev2_adam_decay_read_readvariableop-savev2_adam_learning_rate_read_readvariableop savev2_total_read_readvariableop savev2_count_read_readvariableop"savev2_total_1_read_readvariableop"savev2_count_1_read_readvariableop/savev2_adam_conv1d_kernel_m_read_readvariableop-savev2_adam_conv1d_bias_m_read_readvariableop0savev2_adam_dense_4_kernel_m_read_readvariableop.savev2_adam_dense_4_bias_m_read_readvariableop/savev2_adam_conv1d_kernel_v_read_readvariableop-savev2_adam_conv1d_bias_v_read_readvariableop0savev2_adam_dense_4_kernel_v_read_readvariableop.savev2_adam_dense_4_bias_v_read_readvariableopsavev2_const"/device:CPU:0*
_output_shapes
 *$
dtypes
2	2
SaveV2?
&MergeV2Checkpoints/checkpoint_prefixesPackShardedFilename:filename:0^SaveV2"/device:CPU:0*
N*
T0*
_output_shapes
:2(
&MergeV2Checkpoints/checkpoint_prefixes?
MergeV2CheckpointsMergeV2Checkpoints/MergeV2Checkpoints/checkpoint_prefixes:output:0file_prefix"/device:CPU:0*
_output_shapes
 2
MergeV2Checkpointsr
IdentityIdentityfile_prefix^MergeV2Checkpoints"/device:CPU:0*
T0*
_output_shapes
: 2

Identitym

Identity_1IdentityIdentity:output:0^MergeV2Checkpoints*
T0*
_output_shapes
: 2

Identity_1"!

identity_1Identity_1:output:0*?
_input_shapes?
?: :3?:?:
??:?: : : : : : : : : :3?:?:
??:?:3?:?:
??:?: 2(
MergeV2CheckpointsMergeV2Checkpoints:C ?

_output_shapes
: 
%
_user_specified_namefile_prefix:)%
#
_output_shapes
:3?:!

_output_shapes	
:?:&"
 
_output_shapes
:
??:!

_output_shapes	
:?:

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :	

_output_shapes
: :


_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :)%
#
_output_shapes
:3?:!

_output_shapes	
:?:&"
 
_output_shapes
:
??:!

_output_shapes	
:?:)%
#
_output_shapes
:3?:!

_output_shapes	
:?:&"
 
_output_shapes
:
??:!

_output_shapes	
:?:

_output_shapes
: 
?
?
A__inference_conv1d_layer_call_and_return_conditional_losses_14942

inputsB
+conv1d_expanddims_1_readvariableop_resource:3?.
biasadd_readvariableop_resource:	?
identity??BiasAdd/ReadVariableOp?"conv1d/ExpandDims_1/ReadVariableOpy
conv1d/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
valueB :
?????????2
conv1d/ExpandDims/dim?
conv1d/ExpandDims
ExpandDimsinputsconv1d/ExpandDims/dim:output:0*
T0*8
_output_shapes&
$:"??????????????????32
conv1d/ExpandDims?
"conv1d/ExpandDims_1/ReadVariableOpReadVariableOp+conv1d_expanddims_1_readvariableop_resource*#
_output_shapes
:3?*
dtype02$
"conv1d/ExpandDims_1/ReadVariableOpt
conv1d/ExpandDims_1/dimConst*
_output_shapes
: *
dtype0*
value	B : 2
conv1d/ExpandDims_1/dim?
conv1d/ExpandDims_1
ExpandDims*conv1d/ExpandDims_1/ReadVariableOp:value:0 conv1d/ExpandDims_1/dim:output:0*
T0*'
_output_shapes
:3?2
conv1d/ExpandDims_1?
conv1dConv2Dconv1d/ExpandDims:output:0conv1d/ExpandDims_1:output:0*
T0*9
_output_shapes'
%:#???????????????????*
paddingVALID*
strides
2
conv1d?
conv1d/SqueezeSqueezeconv1d:output:0*
T0*5
_output_shapes#
!:???????????????????*
squeeze_dims

?????????2
conv1d/Squeeze?
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
:?*
dtype02
BiasAdd/ReadVariableOp?
BiasAddBiasAddconv1d/Squeeze:output:0BiasAdd/ReadVariableOp:value:0*
T0*5
_output_shapes#
!:???????????????????2	
BiasAddf
ReluReluBiasAdd:output:0*
T0*5
_output_shapes#
!:???????????????????2
Relu?
IdentityIdentityRelu:activations:0^BiasAdd/ReadVariableOp#^conv1d/ExpandDims_1/ReadVariableOp*
T0*5
_output_shapes#
!:???????????????????2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*7
_input_shapes&
$:??????????????????3: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2H
"conv1d/ExpandDims_1/ReadVariableOp"conv1d/ExpandDims_1/ReadVariableOp:\ X
4
_output_shapes"
 :??????????????????3
 
_user_specified_nameinputs
? 
?
B__inference_dense_4_layer_call_and_return_conditional_losses_14978

inputs5
!tensordot_readvariableop_resource:
??.
biasadd_readvariableop_resource:	?
identity??BiasAdd/ReadVariableOp?Tensordot/ReadVariableOp?
Tensordot/ReadVariableOpReadVariableOp!tensordot_readvariableop_resource* 
_output_shapes
:
??*
dtype02
Tensordot/ReadVariableOpj
Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:2
Tensordot/axesq
Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       2
Tensordot/freeX
Tensordot/ShapeShapeinputs*
T0*
_output_shapes
:2
Tensordot/Shapet
Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : 2
Tensordot/GatherV2/axis?
Tensordot/GatherV2GatherV2Tensordot/Shape:output:0Tensordot/free:output:0 Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:2
Tensordot/GatherV2x
Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : 2
Tensordot/GatherV2_1/axis?
Tensordot/GatherV2_1GatherV2Tensordot/Shape:output:0Tensordot/axes:output:0"Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:2
Tensordot/GatherV2_1l
Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: 2
Tensordot/Const?
Tensordot/ProdProdTensordot/GatherV2:output:0Tensordot/Const:output:0*
T0*
_output_shapes
: 2
Tensordot/Prodp
Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: 2
Tensordot/Const_1?
Tensordot/Prod_1ProdTensordot/GatherV2_1:output:0Tensordot/Const_1:output:0*
T0*
_output_shapes
: 2
Tensordot/Prod_1p
Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : 2
Tensordot/concat/axis?
Tensordot/concatConcatV2Tensordot/free:output:0Tensordot/axes:output:0Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:2
Tensordot/concat?
Tensordot/stackPackTensordot/Prod:output:0Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:2
Tensordot/stack?
Tensordot/transpose	TransposeinputsTensordot/concat:output:0*
T0*5
_output_shapes#
!:???????????????????2
Tensordot/transpose?
Tensordot/ReshapeReshapeTensordot/transpose:y:0Tensordot/stack:output:0*
T0*0
_output_shapes
:??????????????????2
Tensordot/Reshape?
Tensordot/MatMulMatMulTensordot/Reshape:output:0 Tensordot/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????2
Tensordot/MatMulq
Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:?2
Tensordot/Const_2t
Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : 2
Tensordot/concat_1/axis?
Tensordot/concat_1ConcatV2Tensordot/GatherV2:output:0Tensordot/Const_2:output:0 Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:2
Tensordot/concat_1?
	TensordotReshapeTensordot/MatMul:product:0Tensordot/concat_1:output:0*
T0*5
_output_shapes#
!:???????????????????2
	Tensordot?
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
:?*
dtype02
BiasAdd/ReadVariableOp?
BiasAddBiasAddTensordot:output:0BiasAdd/ReadVariableOp:value:0*
T0*5
_output_shapes#
!:???????????????????2	
BiasAdd?
IdentityIdentityBiasAdd:output:0^BiasAdd/ReadVariableOp^Tensordot/ReadVariableOp*
T0*5
_output_shapes#
!:???????????????????2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*8
_input_shapes'
%:???????????????????: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp24
Tensordot/ReadVariableOpTensordot/ReadVariableOp:] Y
5
_output_shapes#
!:???????????????????
 
_user_specified_nameinputs
?
_
C__inference_lambda_2_layer_call_and_return_conditional_losses_15318

inputs
identity
strided_slice/stackConst*
_output_shapes
:*
dtype0*!
valueB"    ????    2
strided_slice/stack?
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*!
valueB"            2
strided_slice/stack_1?
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*!
valueB"         2
strided_slice/stack_2?
strided_sliceStridedSliceinputsstrided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*4
_output_shapes"
 :??????????????????3*

begin_mask*
end_mask2
strided_slicew
IdentityIdentitystrided_slice:output:0*
T0*4
_output_shapes"
 :??????????????????32

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*3
_input_shapes"
 :??????????????????3:\ X
4
_output_shapes"
 :??????????????????3
 
_user_specified_nameinputs
?
?
&__inference_conv1d_layer_call_fn_15335

inputs
unknown:3?
	unknown_0:	?
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *5
_output_shapes#
!:???????????????????*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *J
fERC
A__inference_conv1d_layer_call_and_return_conditional_losses_149422
StatefulPartitionedCall?
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*5
_output_shapes#
!:???????????????????2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*7
_input_shapes&
$:??????????????????3: : 22
StatefulPartitionedCallStatefulPartitionedCall:\ X
4
_output_shapes"
 :??????????????????3
 
_user_specified_nameinputs
?
?
$__inference_Conv_layer_call_fn_15111
lambda_2_input
unknown:3?
	unknown_0:	?
	unknown_1:
??
	unknown_2:	?
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCalllambda_2_inputunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:?????????3*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *H
fCRA
?__inference_Conv_layer_call_and_return_conditional_losses_150872
StatefulPartitionedCall?
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*+
_output_shapes
:?????????32

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*;
_input_shapes*
(:??????????????????3: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:d `
4
_output_shapes"
 :??????????????????3
(
_user_specified_namelambda_2_input
?H
?
?__inference_Conv_layer_call_and_return_conditional_losses_15300

inputsI
2conv1d_conv1d_expanddims_1_readvariableop_resource:3?5
&conv1d_biasadd_readvariableop_resource:	?=
)dense_4_tensordot_readvariableop_resource:
??6
'dense_4_biasadd_readvariableop_resource:	?
identity??conv1d/BiasAdd/ReadVariableOp?)conv1d/conv1d/ExpandDims_1/ReadVariableOp?dense_4/BiasAdd/ReadVariableOp? dense_4/Tensordot/ReadVariableOp?
lambda_2/strided_slice/stackConst*
_output_shapes
:*
dtype0*!
valueB"    ????    2
lambda_2/strided_slice/stack?
lambda_2/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*!
valueB"            2 
lambda_2/strided_slice/stack_1?
lambda_2/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*!
valueB"         2 
lambda_2/strided_slice/stack_2?
lambda_2/strided_sliceStridedSliceinputs%lambda_2/strided_slice/stack:output:0'lambda_2/strided_slice/stack_1:output:0'lambda_2/strided_slice/stack_2:output:0*
Index0*
T0*4
_output_shapes"
 :??????????????????3*

begin_mask*
end_mask2
lambda_2/strided_slice?
conv1d/conv1d/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
valueB :
?????????2
conv1d/conv1d/ExpandDims/dim?
conv1d/conv1d/ExpandDims
ExpandDimslambda_2/strided_slice:output:0%conv1d/conv1d/ExpandDims/dim:output:0*
T0*8
_output_shapes&
$:"??????????????????32
conv1d/conv1d/ExpandDims?
)conv1d/conv1d/ExpandDims_1/ReadVariableOpReadVariableOp2conv1d_conv1d_expanddims_1_readvariableop_resource*#
_output_shapes
:3?*
dtype02+
)conv1d/conv1d/ExpandDims_1/ReadVariableOp?
conv1d/conv1d/ExpandDims_1/dimConst*
_output_shapes
: *
dtype0*
value	B : 2 
conv1d/conv1d/ExpandDims_1/dim?
conv1d/conv1d/ExpandDims_1
ExpandDims1conv1d/conv1d/ExpandDims_1/ReadVariableOp:value:0'conv1d/conv1d/ExpandDims_1/dim:output:0*
T0*'
_output_shapes
:3?2
conv1d/conv1d/ExpandDims_1?
conv1d/conv1dConv2D!conv1d/conv1d/ExpandDims:output:0#conv1d/conv1d/ExpandDims_1:output:0*
T0*9
_output_shapes'
%:#???????????????????*
paddingVALID*
strides
2
conv1d/conv1d?
conv1d/conv1d/SqueezeSqueezeconv1d/conv1d:output:0*
T0*5
_output_shapes#
!:???????????????????*
squeeze_dims

?????????2
conv1d/conv1d/Squeeze?
conv1d/BiasAdd/ReadVariableOpReadVariableOp&conv1d_biasadd_readvariableop_resource*
_output_shapes	
:?*
dtype02
conv1d/BiasAdd/ReadVariableOp?
conv1d/BiasAddBiasAddconv1d/conv1d/Squeeze:output:0%conv1d/BiasAdd/ReadVariableOp:value:0*
T0*5
_output_shapes#
!:???????????????????2
conv1d/BiasAdd{
conv1d/ReluReluconv1d/BiasAdd:output:0*
T0*5
_output_shapes#
!:???????????????????2
conv1d/Relu?
 dense_4/Tensordot/ReadVariableOpReadVariableOp)dense_4_tensordot_readvariableop_resource* 
_output_shapes
:
??*
dtype02"
 dense_4/Tensordot/ReadVariableOpz
dense_4/Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:2
dense_4/Tensordot/axes?
dense_4/Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       2
dense_4/Tensordot/free{
dense_4/Tensordot/ShapeShapeconv1d/Relu:activations:0*
T0*
_output_shapes
:2
dense_4/Tensordot/Shape?
dense_4/Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : 2!
dense_4/Tensordot/GatherV2/axis?
dense_4/Tensordot/GatherV2GatherV2 dense_4/Tensordot/Shape:output:0dense_4/Tensordot/free:output:0(dense_4/Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:2
dense_4/Tensordot/GatherV2?
!dense_4/Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : 2#
!dense_4/Tensordot/GatherV2_1/axis?
dense_4/Tensordot/GatherV2_1GatherV2 dense_4/Tensordot/Shape:output:0dense_4/Tensordot/axes:output:0*dense_4/Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:2
dense_4/Tensordot/GatherV2_1|
dense_4/Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: 2
dense_4/Tensordot/Const?
dense_4/Tensordot/ProdProd#dense_4/Tensordot/GatherV2:output:0 dense_4/Tensordot/Const:output:0*
T0*
_output_shapes
: 2
dense_4/Tensordot/Prod?
dense_4/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: 2
dense_4/Tensordot/Const_1?
dense_4/Tensordot/Prod_1Prod%dense_4/Tensordot/GatherV2_1:output:0"dense_4/Tensordot/Const_1:output:0*
T0*
_output_shapes
: 2
dense_4/Tensordot/Prod_1?
dense_4/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : 2
dense_4/Tensordot/concat/axis?
dense_4/Tensordot/concatConcatV2dense_4/Tensordot/free:output:0dense_4/Tensordot/axes:output:0&dense_4/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:2
dense_4/Tensordot/concat?
dense_4/Tensordot/stackPackdense_4/Tensordot/Prod:output:0!dense_4/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:2
dense_4/Tensordot/stack?
dense_4/Tensordot/transpose	Transposeconv1d/Relu:activations:0!dense_4/Tensordot/concat:output:0*
T0*5
_output_shapes#
!:???????????????????2
dense_4/Tensordot/transpose?
dense_4/Tensordot/ReshapeReshapedense_4/Tensordot/transpose:y:0 dense_4/Tensordot/stack:output:0*
T0*0
_output_shapes
:??????????????????2
dense_4/Tensordot/Reshape?
dense_4/Tensordot/MatMulMatMul"dense_4/Tensordot/Reshape:output:0(dense_4/Tensordot/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????2
dense_4/Tensordot/MatMul?
dense_4/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:?2
dense_4/Tensordot/Const_2?
dense_4/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : 2!
dense_4/Tensordot/concat_1/axis?
dense_4/Tensordot/concat_1ConcatV2#dense_4/Tensordot/GatherV2:output:0"dense_4/Tensordot/Const_2:output:0(dense_4/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:2
dense_4/Tensordot/concat_1?
dense_4/TensordotReshape"dense_4/Tensordot/MatMul:product:0#dense_4/Tensordot/concat_1:output:0*
T0*5
_output_shapes#
!:???????????????????2
dense_4/Tensordot?
dense_4/BiasAdd/ReadVariableOpReadVariableOp'dense_4_biasadd_readvariableop_resource*
_output_shapes	
:?*
dtype02 
dense_4/BiasAdd/ReadVariableOp?
dense_4/BiasAddBiasAdddense_4/Tensordot:output:0&dense_4/BiasAdd/ReadVariableOp:value:0*
T0*5
_output_shapes#
!:???????????????????2
dense_4/BiasAddj
reshape_2/ShapeShapedense_4/BiasAdd:output:0*
T0*
_output_shapes
:2
reshape_2/Shape?
reshape_2/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
reshape_2/strided_slice/stack?
reshape_2/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2!
reshape_2/strided_slice/stack_1?
reshape_2/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2!
reshape_2/strided_slice/stack_2?
reshape_2/strided_sliceStridedSlicereshape_2/Shape:output:0&reshape_2/strided_slice/stack:output:0(reshape_2/strided_slice/stack_1:output:0(reshape_2/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
reshape_2/strided_slicex
reshape_2/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2
reshape_2/Reshape/shape/1x
reshape_2/Reshape/shape/2Const*
_output_shapes
: *
dtype0*
value	B :32
reshape_2/Reshape/shape/2?
reshape_2/Reshape/shapePack reshape_2/strided_slice:output:0"reshape_2/Reshape/shape/1:output:0"reshape_2/Reshape/shape/2:output:0*
N*
T0*
_output_shapes
:2
reshape_2/Reshape/shape?
reshape_2/ReshapeReshapedense_4/BiasAdd:output:0 reshape_2/Reshape/shape:output:0*
T0*+
_output_shapes
:?????????32
reshape_2/Reshape?
IdentityIdentityreshape_2/Reshape:output:0^conv1d/BiasAdd/ReadVariableOp*^conv1d/conv1d/ExpandDims_1/ReadVariableOp^dense_4/BiasAdd/ReadVariableOp!^dense_4/Tensordot/ReadVariableOp*
T0*+
_output_shapes
:?????????32

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*;
_input_shapes*
(:??????????????????3: : : : 2>
conv1d/BiasAdd/ReadVariableOpconv1d/BiasAdd/ReadVariableOp2V
)conv1d/conv1d/ExpandDims_1/ReadVariableOp)conv1d/conv1d/ExpandDims_1/ReadVariableOp2@
dense_4/BiasAdd/ReadVariableOpdense_4/BiasAdd/ReadVariableOp2D
 dense_4/Tensordot/ReadVariableOp dense_4/Tensordot/ReadVariableOp:\ X
4
_output_shapes"
 :??????????????????3
 
_user_specified_nameinputs
?
_
C__inference_lambda_2_layer_call_and_return_conditional_losses_14924

inputs
identity
strided_slice/stackConst*
_output_shapes
:*
dtype0*!
valueB"    ????    2
strided_slice/stack?
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*!
valueB"            2
strided_slice/stack_1?
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*!
valueB"         2
strided_slice/stack_2?
strided_sliceStridedSliceinputsstrided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*4
_output_shapes"
 :??????????????????3*

begin_mask*
end_mask2
strided_slicew
IdentityIdentitystrided_slice:output:0*
T0*4
_output_shapes"
 :??????????????????32

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*3
_input_shapes"
 :??????????????????3:\ X
4
_output_shapes"
 :??????????????????3
 
_user_specified_nameinputs
?
?
$__inference_Conv_layer_call_fn_15177

inputs
unknown:3?
	unknown_0:	?
	unknown_1:
??
	unknown_2:	?
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:?????????3*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *H
fCRA
?__inference_Conv_layer_call_and_return_conditional_losses_150002
StatefulPartitionedCall?
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*+
_output_shapes
:?????????32

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*;
_input_shapes*
(:??????????????????3: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:\ X
4
_output_shapes"
 :??????????????????3
 
_user_specified_nameinputs
?
E
)__inference_reshape_2_layer_call_fn_15395

inputs
identity?
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:?????????3* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *M
fHRF
D__inference_reshape_2_layer_call_and_return_conditional_losses_149972
PartitionedCallp
IdentityIdentityPartitionedCall:output:0*
T0*+
_output_shapes
:?????????32

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*4
_input_shapes#
!:???????????????????:] Y
5
_output_shapes#
!:???????????????????
 
_user_specified_nameinputs
?
?
?__inference_Conv_layer_call_and_return_conditional_losses_15000

inputs#
conv1d_14943:3?
conv1d_14945:	?!
dense_4_14979:
??
dense_4_14981:	?
identity??conv1d/StatefulPartitionedCall?dense_4/StatefulPartitionedCall?
lambda_2/PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :??????????????????3* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *L
fGRE
C__inference_lambda_2_layer_call_and_return_conditional_losses_149242
lambda_2/PartitionedCall?
conv1d/StatefulPartitionedCallStatefulPartitionedCall!lambda_2/PartitionedCall:output:0conv1d_14943conv1d_14945*
Tin
2*
Tout
2*
_collective_manager_ids
 *5
_output_shapes#
!:???????????????????*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *J
fERC
A__inference_conv1d_layer_call_and_return_conditional_losses_149422 
conv1d/StatefulPartitionedCall?
dense_4/StatefulPartitionedCallStatefulPartitionedCall'conv1d/StatefulPartitionedCall:output:0dense_4_14979dense_4_14981*
Tin
2*
Tout
2*
_collective_manager_ids
 *5
_output_shapes#
!:???????????????????*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *K
fFRD
B__inference_dense_4_layer_call_and_return_conditional_losses_149782!
dense_4/StatefulPartitionedCall?
reshape_2/PartitionedCallPartitionedCall(dense_4/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:?????????3* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *M
fHRF
D__inference_reshape_2_layer_call_and_return_conditional_losses_149972
reshape_2/PartitionedCall?
IdentityIdentity"reshape_2/PartitionedCall:output:0^conv1d/StatefulPartitionedCall ^dense_4/StatefulPartitionedCall*
T0*+
_output_shapes
:?????????32

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*;
_input_shapes*
(:??????????????????3: : : : 2@
conv1d/StatefulPartitionedCallconv1d/StatefulPartitionedCall2B
dense_4/StatefulPartitionedCalldense_4/StatefulPartitionedCall:\ X
4
_output_shapes"
 :??????????????????3
 
_user_specified_nameinputs
?
?
?__inference_Conv_layer_call_and_return_conditional_losses_15143
lambda_2_input#
conv1d_15131:3?
conv1d_15133:	?!
dense_4_15136:
??
dense_4_15138:	?
identity??conv1d/StatefulPartitionedCall?dense_4/StatefulPartitionedCall?
lambda_2/PartitionedCallPartitionedCalllambda_2_input*
Tin
2*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :??????????????????3* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *L
fGRE
C__inference_lambda_2_layer_call_and_return_conditional_losses_150532
lambda_2/PartitionedCall?
conv1d/StatefulPartitionedCallStatefulPartitionedCall!lambda_2/PartitionedCall:output:0conv1d_15131conv1d_15133*
Tin
2*
Tout
2*
_collective_manager_ids
 *5
_output_shapes#
!:???????????????????*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *J
fERC
A__inference_conv1d_layer_call_and_return_conditional_losses_149422 
conv1d/StatefulPartitionedCall?
dense_4/StatefulPartitionedCallStatefulPartitionedCall'conv1d/StatefulPartitionedCall:output:0dense_4_15136dense_4_15138*
Tin
2*
Tout
2*
_collective_manager_ids
 *5
_output_shapes#
!:???????????????????*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *K
fFRD
B__inference_dense_4_layer_call_and_return_conditional_losses_149782!
dense_4/StatefulPartitionedCall?
reshape_2/PartitionedCallPartitionedCall(dense_4/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:?????????3* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *M
fHRF
D__inference_reshape_2_layer_call_and_return_conditional_losses_149972
reshape_2/PartitionedCall?
IdentityIdentity"reshape_2/PartitionedCall:output:0^conv1d/StatefulPartitionedCall ^dense_4/StatefulPartitionedCall*
T0*+
_output_shapes
:?????????32

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*;
_input_shapes*
(:??????????????????3: : : : 2@
conv1d/StatefulPartitionedCallconv1d/StatefulPartitionedCall2B
dense_4/StatefulPartitionedCalldense_4/StatefulPartitionedCall:d `
4
_output_shapes"
 :??????????????????3
(
_user_specified_namelambda_2_input
?
?
$__inference_Conv_layer_call_fn_15011
lambda_2_input
unknown:3?
	unknown_0:	?
	unknown_1:
??
	unknown_2:	?
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCalllambda_2_inputunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:?????????3*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *H
fCRA
?__inference_Conv_layer_call_and_return_conditional_losses_150002
StatefulPartitionedCall?
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*+
_output_shapes
:?????????32

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*;
_input_shapes*
(:??????????????????3: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:d `
4
_output_shapes"
 :??????????????????3
(
_user_specified_namelambda_2_input
?
D
(__inference_lambda_2_layer_call_fn_15305

inputs
identity?
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :??????????????????3* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *L
fGRE
C__inference_lambda_2_layer_call_and_return_conditional_losses_149242
PartitionedCally
IdentityIdentityPartitionedCall:output:0*
T0*4
_output_shapes"
 :??????????????????32

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*3
_input_shapes"
 :??????????????????3:\ X
4
_output_shapes"
 :??????????????????3
 
_user_specified_nameinputs
?
?
'__inference_dense_4_layer_call_fn_15360

inputs
unknown:
??
	unknown_0:	?
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *5
_output_shapes#
!:???????????????????*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *K
fFRD
B__inference_dense_4_layer_call_and_return_conditional_losses_149782
StatefulPartitionedCall?
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*5
_output_shapes#
!:???????????????????2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*8
_input_shapes'
%:???????????????????: : 22
StatefulPartitionedCallStatefulPartitionedCall:] Y
5
_output_shapes#
!:???????????????????
 
_user_specified_nameinputs
?
?
$__inference_Conv_layer_call_fn_15190

inputs
unknown:3?
	unknown_0:	?
	unknown_1:
??
	unknown_2:	?
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:?????????3*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *H
fCRA
?__inference_Conv_layer_call_and_return_conditional_losses_150872
StatefulPartitionedCall?
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*+
_output_shapes
:?????????32

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*;
_input_shapes*
(:??????????????????3: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:\ X
4
_output_shapes"
 :??????????????????3
 
_user_specified_nameinputs
? 
?
B__inference_dense_4_layer_call_and_return_conditional_losses_15390

inputs5
!tensordot_readvariableop_resource:
??.
biasadd_readvariableop_resource:	?
identity??BiasAdd/ReadVariableOp?Tensordot/ReadVariableOp?
Tensordot/ReadVariableOpReadVariableOp!tensordot_readvariableop_resource* 
_output_shapes
:
??*
dtype02
Tensordot/ReadVariableOpj
Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:2
Tensordot/axesq
Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       2
Tensordot/freeX
Tensordot/ShapeShapeinputs*
T0*
_output_shapes
:2
Tensordot/Shapet
Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : 2
Tensordot/GatherV2/axis?
Tensordot/GatherV2GatherV2Tensordot/Shape:output:0Tensordot/free:output:0 Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:2
Tensordot/GatherV2x
Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : 2
Tensordot/GatherV2_1/axis?
Tensordot/GatherV2_1GatherV2Tensordot/Shape:output:0Tensordot/axes:output:0"Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:2
Tensordot/GatherV2_1l
Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: 2
Tensordot/Const?
Tensordot/ProdProdTensordot/GatherV2:output:0Tensordot/Const:output:0*
T0*
_output_shapes
: 2
Tensordot/Prodp
Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: 2
Tensordot/Const_1?
Tensordot/Prod_1ProdTensordot/GatherV2_1:output:0Tensordot/Const_1:output:0*
T0*
_output_shapes
: 2
Tensordot/Prod_1p
Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : 2
Tensordot/concat/axis?
Tensordot/concatConcatV2Tensordot/free:output:0Tensordot/axes:output:0Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:2
Tensordot/concat?
Tensordot/stackPackTensordot/Prod:output:0Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:2
Tensordot/stack?
Tensordot/transpose	TransposeinputsTensordot/concat:output:0*
T0*5
_output_shapes#
!:???????????????????2
Tensordot/transpose?
Tensordot/ReshapeReshapeTensordot/transpose:y:0Tensordot/stack:output:0*
T0*0
_output_shapes
:??????????????????2
Tensordot/Reshape?
Tensordot/MatMulMatMulTensordot/Reshape:output:0 Tensordot/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????2
Tensordot/MatMulq
Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:?2
Tensordot/Const_2t
Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : 2
Tensordot/concat_1/axis?
Tensordot/concat_1ConcatV2Tensordot/GatherV2:output:0Tensordot/Const_2:output:0 Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:2
Tensordot/concat_1?
	TensordotReshapeTensordot/MatMul:product:0Tensordot/concat_1:output:0*
T0*5
_output_shapes#
!:???????????????????2
	Tensordot?
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
:?*
dtype02
BiasAdd/ReadVariableOp?
BiasAddBiasAddTensordot:output:0BiasAdd/ReadVariableOp:value:0*
T0*5
_output_shapes#
!:???????????????????2	
BiasAdd?
IdentityIdentityBiasAdd:output:0^BiasAdd/ReadVariableOp^Tensordot/ReadVariableOp*
T0*5
_output_shapes#
!:???????????????????2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*8
_input_shapes'
%:???????????????????: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp24
Tensordot/ReadVariableOpTensordot/ReadVariableOp:] Y
5
_output_shapes#
!:???????????????????
 
_user_specified_nameinputs
?O
?
 __inference__wrapped_model_14909
lambda_2_inputN
7conv_conv1d_conv1d_expanddims_1_readvariableop_resource:3?:
+conv_conv1d_biasadd_readvariableop_resource:	?B
.conv_dense_4_tensordot_readvariableop_resource:
??;
,conv_dense_4_biasadd_readvariableop_resource:	?
identity??"Conv/conv1d/BiasAdd/ReadVariableOp?.Conv/conv1d/conv1d/ExpandDims_1/ReadVariableOp?#Conv/dense_4/BiasAdd/ReadVariableOp?%Conv/dense_4/Tensordot/ReadVariableOp?
!Conv/lambda_2/strided_slice/stackConst*
_output_shapes
:*
dtype0*!
valueB"    ????    2#
!Conv/lambda_2/strided_slice/stack?
#Conv/lambda_2/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*!
valueB"            2%
#Conv/lambda_2/strided_slice/stack_1?
#Conv/lambda_2/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*!
valueB"         2%
#Conv/lambda_2/strided_slice/stack_2?
Conv/lambda_2/strided_sliceStridedSlicelambda_2_input*Conv/lambda_2/strided_slice/stack:output:0,Conv/lambda_2/strided_slice/stack_1:output:0,Conv/lambda_2/strided_slice/stack_2:output:0*
Index0*
T0*4
_output_shapes"
 :??????????????????3*

begin_mask*
end_mask2
Conv/lambda_2/strided_slice?
!Conv/conv1d/conv1d/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
valueB :
?????????2#
!Conv/conv1d/conv1d/ExpandDims/dim?
Conv/conv1d/conv1d/ExpandDims
ExpandDims$Conv/lambda_2/strided_slice:output:0*Conv/conv1d/conv1d/ExpandDims/dim:output:0*
T0*8
_output_shapes&
$:"??????????????????32
Conv/conv1d/conv1d/ExpandDims?
.Conv/conv1d/conv1d/ExpandDims_1/ReadVariableOpReadVariableOp7conv_conv1d_conv1d_expanddims_1_readvariableop_resource*#
_output_shapes
:3?*
dtype020
.Conv/conv1d/conv1d/ExpandDims_1/ReadVariableOp?
#Conv/conv1d/conv1d/ExpandDims_1/dimConst*
_output_shapes
: *
dtype0*
value	B : 2%
#Conv/conv1d/conv1d/ExpandDims_1/dim?
Conv/conv1d/conv1d/ExpandDims_1
ExpandDims6Conv/conv1d/conv1d/ExpandDims_1/ReadVariableOp:value:0,Conv/conv1d/conv1d/ExpandDims_1/dim:output:0*
T0*'
_output_shapes
:3?2!
Conv/conv1d/conv1d/ExpandDims_1?
Conv/conv1d/conv1dConv2D&Conv/conv1d/conv1d/ExpandDims:output:0(Conv/conv1d/conv1d/ExpandDims_1:output:0*
T0*9
_output_shapes'
%:#???????????????????*
paddingVALID*
strides
2
Conv/conv1d/conv1d?
Conv/conv1d/conv1d/SqueezeSqueezeConv/conv1d/conv1d:output:0*
T0*5
_output_shapes#
!:???????????????????*
squeeze_dims

?????????2
Conv/conv1d/conv1d/Squeeze?
"Conv/conv1d/BiasAdd/ReadVariableOpReadVariableOp+conv_conv1d_biasadd_readvariableop_resource*
_output_shapes	
:?*
dtype02$
"Conv/conv1d/BiasAdd/ReadVariableOp?
Conv/conv1d/BiasAddBiasAdd#Conv/conv1d/conv1d/Squeeze:output:0*Conv/conv1d/BiasAdd/ReadVariableOp:value:0*
T0*5
_output_shapes#
!:???????????????????2
Conv/conv1d/BiasAdd?
Conv/conv1d/ReluReluConv/conv1d/BiasAdd:output:0*
T0*5
_output_shapes#
!:???????????????????2
Conv/conv1d/Relu?
%Conv/dense_4/Tensordot/ReadVariableOpReadVariableOp.conv_dense_4_tensordot_readvariableop_resource* 
_output_shapes
:
??*
dtype02'
%Conv/dense_4/Tensordot/ReadVariableOp?
Conv/dense_4/Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:2
Conv/dense_4/Tensordot/axes?
Conv/dense_4/Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       2
Conv/dense_4/Tensordot/free?
Conv/dense_4/Tensordot/ShapeShapeConv/conv1d/Relu:activations:0*
T0*
_output_shapes
:2
Conv/dense_4/Tensordot/Shape?
$Conv/dense_4/Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : 2&
$Conv/dense_4/Tensordot/GatherV2/axis?
Conv/dense_4/Tensordot/GatherV2GatherV2%Conv/dense_4/Tensordot/Shape:output:0$Conv/dense_4/Tensordot/free:output:0-Conv/dense_4/Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:2!
Conv/dense_4/Tensordot/GatherV2?
&Conv/dense_4/Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : 2(
&Conv/dense_4/Tensordot/GatherV2_1/axis?
!Conv/dense_4/Tensordot/GatherV2_1GatherV2%Conv/dense_4/Tensordot/Shape:output:0$Conv/dense_4/Tensordot/axes:output:0/Conv/dense_4/Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:2#
!Conv/dense_4/Tensordot/GatherV2_1?
Conv/dense_4/Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: 2
Conv/dense_4/Tensordot/Const?
Conv/dense_4/Tensordot/ProdProd(Conv/dense_4/Tensordot/GatherV2:output:0%Conv/dense_4/Tensordot/Const:output:0*
T0*
_output_shapes
: 2
Conv/dense_4/Tensordot/Prod?
Conv/dense_4/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: 2 
Conv/dense_4/Tensordot/Const_1?
Conv/dense_4/Tensordot/Prod_1Prod*Conv/dense_4/Tensordot/GatherV2_1:output:0'Conv/dense_4/Tensordot/Const_1:output:0*
T0*
_output_shapes
: 2
Conv/dense_4/Tensordot/Prod_1?
"Conv/dense_4/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : 2$
"Conv/dense_4/Tensordot/concat/axis?
Conv/dense_4/Tensordot/concatConcatV2$Conv/dense_4/Tensordot/free:output:0$Conv/dense_4/Tensordot/axes:output:0+Conv/dense_4/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:2
Conv/dense_4/Tensordot/concat?
Conv/dense_4/Tensordot/stackPack$Conv/dense_4/Tensordot/Prod:output:0&Conv/dense_4/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:2
Conv/dense_4/Tensordot/stack?
 Conv/dense_4/Tensordot/transpose	TransposeConv/conv1d/Relu:activations:0&Conv/dense_4/Tensordot/concat:output:0*
T0*5
_output_shapes#
!:???????????????????2"
 Conv/dense_4/Tensordot/transpose?
Conv/dense_4/Tensordot/ReshapeReshape$Conv/dense_4/Tensordot/transpose:y:0%Conv/dense_4/Tensordot/stack:output:0*
T0*0
_output_shapes
:??????????????????2 
Conv/dense_4/Tensordot/Reshape?
Conv/dense_4/Tensordot/MatMulMatMul'Conv/dense_4/Tensordot/Reshape:output:0-Conv/dense_4/Tensordot/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????2
Conv/dense_4/Tensordot/MatMul?
Conv/dense_4/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:?2 
Conv/dense_4/Tensordot/Const_2?
$Conv/dense_4/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : 2&
$Conv/dense_4/Tensordot/concat_1/axis?
Conv/dense_4/Tensordot/concat_1ConcatV2(Conv/dense_4/Tensordot/GatherV2:output:0'Conv/dense_4/Tensordot/Const_2:output:0-Conv/dense_4/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:2!
Conv/dense_4/Tensordot/concat_1?
Conv/dense_4/TensordotReshape'Conv/dense_4/Tensordot/MatMul:product:0(Conv/dense_4/Tensordot/concat_1:output:0*
T0*5
_output_shapes#
!:???????????????????2
Conv/dense_4/Tensordot?
#Conv/dense_4/BiasAdd/ReadVariableOpReadVariableOp,conv_dense_4_biasadd_readvariableop_resource*
_output_shapes	
:?*
dtype02%
#Conv/dense_4/BiasAdd/ReadVariableOp?
Conv/dense_4/BiasAddBiasAddConv/dense_4/Tensordot:output:0+Conv/dense_4/BiasAdd/ReadVariableOp:value:0*
T0*5
_output_shapes#
!:???????????????????2
Conv/dense_4/BiasAddy
Conv/reshape_2/ShapeShapeConv/dense_4/BiasAdd:output:0*
T0*
_output_shapes
:2
Conv/reshape_2/Shape?
"Conv/reshape_2/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2$
"Conv/reshape_2/strided_slice/stack?
$Conv/reshape_2/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2&
$Conv/reshape_2/strided_slice/stack_1?
$Conv/reshape_2/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2&
$Conv/reshape_2/strided_slice/stack_2?
Conv/reshape_2/strided_sliceStridedSliceConv/reshape_2/Shape:output:0+Conv/reshape_2/strided_slice/stack:output:0-Conv/reshape_2/strided_slice/stack_1:output:0-Conv/reshape_2/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
Conv/reshape_2/strided_slice?
Conv/reshape_2/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2 
Conv/reshape_2/Reshape/shape/1?
Conv/reshape_2/Reshape/shape/2Const*
_output_shapes
: *
dtype0*
value	B :32 
Conv/reshape_2/Reshape/shape/2?
Conv/reshape_2/Reshape/shapePack%Conv/reshape_2/strided_slice:output:0'Conv/reshape_2/Reshape/shape/1:output:0'Conv/reshape_2/Reshape/shape/2:output:0*
N*
T0*
_output_shapes
:2
Conv/reshape_2/Reshape/shape?
Conv/reshape_2/ReshapeReshapeConv/dense_4/BiasAdd:output:0%Conv/reshape_2/Reshape/shape:output:0*
T0*+
_output_shapes
:?????????32
Conv/reshape_2/Reshape?
IdentityIdentityConv/reshape_2/Reshape:output:0#^Conv/conv1d/BiasAdd/ReadVariableOp/^Conv/conv1d/conv1d/ExpandDims_1/ReadVariableOp$^Conv/dense_4/BiasAdd/ReadVariableOp&^Conv/dense_4/Tensordot/ReadVariableOp*
T0*+
_output_shapes
:?????????32

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*;
_input_shapes*
(:??????????????????3: : : : 2H
"Conv/conv1d/BiasAdd/ReadVariableOp"Conv/conv1d/BiasAdd/ReadVariableOp2`
.Conv/conv1d/conv1d/ExpandDims_1/ReadVariableOp.Conv/conv1d/conv1d/ExpandDims_1/ReadVariableOp2J
#Conv/dense_4/BiasAdd/ReadVariableOp#Conv/dense_4/BiasAdd/ReadVariableOp2N
%Conv/dense_4/Tensordot/ReadVariableOp%Conv/dense_4/Tensordot/ReadVariableOp:d `
4
_output_shapes"
 :??????????????????3
(
_user_specified_namelambda_2_input
?
?
#__inference_signature_wrapper_15164
lambda_2_input
unknown:3?
	unknown_0:	?
	unknown_1:
??
	unknown_2:	?
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCalllambda_2_inputunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:?????????3*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *)
f$R"
 __inference__wrapped_model_149092
StatefulPartitionedCall?
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*+
_output_shapes
:?????????32

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*;
_input_shapes*
(:??????????????????3: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:d `
4
_output_shapes"
 :??????????????????3
(
_user_specified_namelambda_2_input
?
_
C__inference_lambda_2_layer_call_and_return_conditional_losses_15326

inputs
identity
strided_slice/stackConst*
_output_shapes
:*
dtype0*!
valueB"    ????    2
strided_slice/stack?
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*!
valueB"            2
strided_slice/stack_1?
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*!
valueB"         2
strided_slice/stack_2?
strided_sliceStridedSliceinputsstrided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*4
_output_shapes"
 :??????????????????3*

begin_mask*
end_mask2
strided_slicew
IdentityIdentitystrided_slice:output:0*
T0*4
_output_shapes"
 :??????????????????32

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*3
_input_shapes"
 :??????????????????3:\ X
4
_output_shapes"
 :??????????????????3
 
_user_specified_nameinputs
?
`
D__inference_reshape_2_layer_call_and_return_conditional_losses_15408

inputs
identityD
ShapeShapeinputs*
T0*
_output_shapes
:2
Shapet
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice/stackx
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice/stack_1x
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice/stack_2?
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
strided_sliced
Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2
Reshape/shape/1d
Reshape/shape/2Const*
_output_shapes
: *
dtype0*
value	B :32
Reshape/shape/2?
Reshape/shapePackstrided_slice:output:0Reshape/shape/1:output:0Reshape/shape/2:output:0*
N*
T0*
_output_shapes
:2
Reshape/shapes
ReshapeReshapeinputsReshape/shape:output:0*
T0*+
_output_shapes
:?????????32	
Reshapeh
IdentityIdentityReshape:output:0*
T0*+
_output_shapes
:?????????32

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*4
_input_shapes#
!:???????????????????:] Y
5
_output_shapes#
!:???????????????????
 
_user_specified_nameinputs
?[
?
!__inference__traced_restore_15567
file_prefix5
assignvariableop_conv1d_kernel:3?-
assignvariableop_1_conv1d_bias:	?5
!assignvariableop_2_dense_4_kernel:
??.
assignvariableop_3_dense_4_bias:	?&
assignvariableop_4_adam_iter:	 (
assignvariableop_5_adam_beta_1: (
assignvariableop_6_adam_beta_2: '
assignvariableop_7_adam_decay: /
%assignvariableop_8_adam_learning_rate: "
assignvariableop_9_total: #
assignvariableop_10_count: %
assignvariableop_11_total_1: %
assignvariableop_12_count_1: ?
(assignvariableop_13_adam_conv1d_kernel_m:3?5
&assignvariableop_14_adam_conv1d_bias_m:	?=
)assignvariableop_15_adam_dense_4_kernel_m:
??6
'assignvariableop_16_adam_dense_4_bias_m:	??
(assignvariableop_17_adam_conv1d_kernel_v:3?5
&assignvariableop_18_adam_conv1d_bias_v:	?=
)assignvariableop_19_adam_dense_4_kernel_v:
??6
'assignvariableop_20_adam_dense_4_bias_v:	?
identity_22??AssignVariableOp?AssignVariableOp_1?AssignVariableOp_10?AssignVariableOp_11?AssignVariableOp_12?AssignVariableOp_13?AssignVariableOp_14?AssignVariableOp_15?AssignVariableOp_16?AssignVariableOp_17?AssignVariableOp_18?AssignVariableOp_19?AssignVariableOp_2?AssignVariableOp_20?AssignVariableOp_3?AssignVariableOp_4?AssignVariableOp_5?AssignVariableOp_6?AssignVariableOp_7?AssignVariableOp_8?AssignVariableOp_9?
RestoreV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:*
dtype0*?

value?
B?
B6layer_with_weights-0/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-0/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-1/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-1/bias/.ATTRIBUTES/VARIABLE_VALUEB)optimizer/iter/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_1/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_2/.ATTRIBUTES/VARIABLE_VALUEB*optimizer/decay/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/learning_rate/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/count/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-0/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-0/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-1/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-1/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-0/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-0/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-1/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-1/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPH2
RestoreV2/tensor_names?
RestoreV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:*
dtype0*?
value6B4B B B B B B B B B B B B B B B B B B B B B B 2
RestoreV2/shape_and_slices?
	RestoreV2	RestoreV2file_prefixRestoreV2/tensor_names:output:0#RestoreV2/shape_and_slices:output:0"/device:CPU:0*l
_output_shapesZ
X::::::::::::::::::::::*$
dtypes
2	2
	RestoreV2g
IdentityIdentityRestoreV2:tensors:0"/device:CPU:0*
T0*
_output_shapes
:2

Identity?
AssignVariableOpAssignVariableOpassignvariableop_conv1d_kernelIdentity:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOpk

Identity_1IdentityRestoreV2:tensors:1"/device:CPU:0*
T0*
_output_shapes
:2

Identity_1?
AssignVariableOp_1AssignVariableOpassignvariableop_1_conv1d_biasIdentity_1:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_1k

Identity_2IdentityRestoreV2:tensors:2"/device:CPU:0*
T0*
_output_shapes
:2

Identity_2?
AssignVariableOp_2AssignVariableOp!assignvariableop_2_dense_4_kernelIdentity_2:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_2k

Identity_3IdentityRestoreV2:tensors:3"/device:CPU:0*
T0*
_output_shapes
:2

Identity_3?
AssignVariableOp_3AssignVariableOpassignvariableop_3_dense_4_biasIdentity_3:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_3k

Identity_4IdentityRestoreV2:tensors:4"/device:CPU:0*
T0	*
_output_shapes
:2

Identity_4?
AssignVariableOp_4AssignVariableOpassignvariableop_4_adam_iterIdentity_4:output:0"/device:CPU:0*
_output_shapes
 *
dtype0	2
AssignVariableOp_4k

Identity_5IdentityRestoreV2:tensors:5"/device:CPU:0*
T0*
_output_shapes
:2

Identity_5?
AssignVariableOp_5AssignVariableOpassignvariableop_5_adam_beta_1Identity_5:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_5k

Identity_6IdentityRestoreV2:tensors:6"/device:CPU:0*
T0*
_output_shapes
:2

Identity_6?
AssignVariableOp_6AssignVariableOpassignvariableop_6_adam_beta_2Identity_6:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_6k

Identity_7IdentityRestoreV2:tensors:7"/device:CPU:0*
T0*
_output_shapes
:2

Identity_7?
AssignVariableOp_7AssignVariableOpassignvariableop_7_adam_decayIdentity_7:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_7k

Identity_8IdentityRestoreV2:tensors:8"/device:CPU:0*
T0*
_output_shapes
:2

Identity_8?
AssignVariableOp_8AssignVariableOp%assignvariableop_8_adam_learning_rateIdentity_8:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_8k

Identity_9IdentityRestoreV2:tensors:9"/device:CPU:0*
T0*
_output_shapes
:2

Identity_9?
AssignVariableOp_9AssignVariableOpassignvariableop_9_totalIdentity_9:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_9n
Identity_10IdentityRestoreV2:tensors:10"/device:CPU:0*
T0*
_output_shapes
:2
Identity_10?
AssignVariableOp_10AssignVariableOpassignvariableop_10_countIdentity_10:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_10n
Identity_11IdentityRestoreV2:tensors:11"/device:CPU:0*
T0*
_output_shapes
:2
Identity_11?
AssignVariableOp_11AssignVariableOpassignvariableop_11_total_1Identity_11:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_11n
Identity_12IdentityRestoreV2:tensors:12"/device:CPU:0*
T0*
_output_shapes
:2
Identity_12?
AssignVariableOp_12AssignVariableOpassignvariableop_12_count_1Identity_12:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_12n
Identity_13IdentityRestoreV2:tensors:13"/device:CPU:0*
T0*
_output_shapes
:2
Identity_13?
AssignVariableOp_13AssignVariableOp(assignvariableop_13_adam_conv1d_kernel_mIdentity_13:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_13n
Identity_14IdentityRestoreV2:tensors:14"/device:CPU:0*
T0*
_output_shapes
:2
Identity_14?
AssignVariableOp_14AssignVariableOp&assignvariableop_14_adam_conv1d_bias_mIdentity_14:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_14n
Identity_15IdentityRestoreV2:tensors:15"/device:CPU:0*
T0*
_output_shapes
:2
Identity_15?
AssignVariableOp_15AssignVariableOp)assignvariableop_15_adam_dense_4_kernel_mIdentity_15:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_15n
Identity_16IdentityRestoreV2:tensors:16"/device:CPU:0*
T0*
_output_shapes
:2
Identity_16?
AssignVariableOp_16AssignVariableOp'assignvariableop_16_adam_dense_4_bias_mIdentity_16:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_16n
Identity_17IdentityRestoreV2:tensors:17"/device:CPU:0*
T0*
_output_shapes
:2
Identity_17?
AssignVariableOp_17AssignVariableOp(assignvariableop_17_adam_conv1d_kernel_vIdentity_17:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_17n
Identity_18IdentityRestoreV2:tensors:18"/device:CPU:0*
T0*
_output_shapes
:2
Identity_18?
AssignVariableOp_18AssignVariableOp&assignvariableop_18_adam_conv1d_bias_vIdentity_18:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_18n
Identity_19IdentityRestoreV2:tensors:19"/device:CPU:0*
T0*
_output_shapes
:2
Identity_19?
AssignVariableOp_19AssignVariableOp)assignvariableop_19_adam_dense_4_kernel_vIdentity_19:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_19n
Identity_20IdentityRestoreV2:tensors:20"/device:CPU:0*
T0*
_output_shapes
:2
Identity_20?
AssignVariableOp_20AssignVariableOp'assignvariableop_20_adam_dense_4_bias_vIdentity_20:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_209
NoOpNoOp"/device:CPU:0*
_output_shapes
 2
NoOp?
Identity_21Identityfile_prefix^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_10^AssignVariableOp_11^AssignVariableOp_12^AssignVariableOp_13^AssignVariableOp_14^AssignVariableOp_15^AssignVariableOp_16^AssignVariableOp_17^AssignVariableOp_18^AssignVariableOp_19^AssignVariableOp_2^AssignVariableOp_20^AssignVariableOp_3^AssignVariableOp_4^AssignVariableOp_5^AssignVariableOp_6^AssignVariableOp_7^AssignVariableOp_8^AssignVariableOp_9^NoOp"/device:CPU:0*
T0*
_output_shapes
: 2
Identity_21?
Identity_22IdentityIdentity_21:output:0^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_10^AssignVariableOp_11^AssignVariableOp_12^AssignVariableOp_13^AssignVariableOp_14^AssignVariableOp_15^AssignVariableOp_16^AssignVariableOp_17^AssignVariableOp_18^AssignVariableOp_19^AssignVariableOp_2^AssignVariableOp_20^AssignVariableOp_3^AssignVariableOp_4^AssignVariableOp_5^AssignVariableOp_6^AssignVariableOp_7^AssignVariableOp_8^AssignVariableOp_9*
T0*
_output_shapes
: 2
Identity_22"#
identity_22Identity_22:output:0*?
_input_shapes.
,: : : : : : : : : : : : : : : : : : : : : : 2$
AssignVariableOpAssignVariableOp2(
AssignVariableOp_1AssignVariableOp_12*
AssignVariableOp_10AssignVariableOp_102*
AssignVariableOp_11AssignVariableOp_112*
AssignVariableOp_12AssignVariableOp_122*
AssignVariableOp_13AssignVariableOp_132*
AssignVariableOp_14AssignVariableOp_142*
AssignVariableOp_15AssignVariableOp_152*
AssignVariableOp_16AssignVariableOp_162*
AssignVariableOp_17AssignVariableOp_172*
AssignVariableOp_18AssignVariableOp_182*
AssignVariableOp_19AssignVariableOp_192(
AssignVariableOp_2AssignVariableOp_22*
AssignVariableOp_20AssignVariableOp_202(
AssignVariableOp_3AssignVariableOp_32(
AssignVariableOp_4AssignVariableOp_42(
AssignVariableOp_5AssignVariableOp_52(
AssignVariableOp_6AssignVariableOp_62(
AssignVariableOp_7AssignVariableOp_72(
AssignVariableOp_8AssignVariableOp_82(
AssignVariableOp_9AssignVariableOp_9:C ?

_output_shapes
: 
%
_user_specified_namefile_prefix
?H
?
?__inference_Conv_layer_call_and_return_conditional_losses_15245

inputsI
2conv1d_conv1d_expanddims_1_readvariableop_resource:3?5
&conv1d_biasadd_readvariableop_resource:	?=
)dense_4_tensordot_readvariableop_resource:
??6
'dense_4_biasadd_readvariableop_resource:	?
identity??conv1d/BiasAdd/ReadVariableOp?)conv1d/conv1d/ExpandDims_1/ReadVariableOp?dense_4/BiasAdd/ReadVariableOp? dense_4/Tensordot/ReadVariableOp?
lambda_2/strided_slice/stackConst*
_output_shapes
:*
dtype0*!
valueB"    ????    2
lambda_2/strided_slice/stack?
lambda_2/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*!
valueB"            2 
lambda_2/strided_slice/stack_1?
lambda_2/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*!
valueB"         2 
lambda_2/strided_slice/stack_2?
lambda_2/strided_sliceStridedSliceinputs%lambda_2/strided_slice/stack:output:0'lambda_2/strided_slice/stack_1:output:0'lambda_2/strided_slice/stack_2:output:0*
Index0*
T0*4
_output_shapes"
 :??????????????????3*

begin_mask*
end_mask2
lambda_2/strided_slice?
conv1d/conv1d/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
valueB :
?????????2
conv1d/conv1d/ExpandDims/dim?
conv1d/conv1d/ExpandDims
ExpandDimslambda_2/strided_slice:output:0%conv1d/conv1d/ExpandDims/dim:output:0*
T0*8
_output_shapes&
$:"??????????????????32
conv1d/conv1d/ExpandDims?
)conv1d/conv1d/ExpandDims_1/ReadVariableOpReadVariableOp2conv1d_conv1d_expanddims_1_readvariableop_resource*#
_output_shapes
:3?*
dtype02+
)conv1d/conv1d/ExpandDims_1/ReadVariableOp?
conv1d/conv1d/ExpandDims_1/dimConst*
_output_shapes
: *
dtype0*
value	B : 2 
conv1d/conv1d/ExpandDims_1/dim?
conv1d/conv1d/ExpandDims_1
ExpandDims1conv1d/conv1d/ExpandDims_1/ReadVariableOp:value:0'conv1d/conv1d/ExpandDims_1/dim:output:0*
T0*'
_output_shapes
:3?2
conv1d/conv1d/ExpandDims_1?
conv1d/conv1dConv2D!conv1d/conv1d/ExpandDims:output:0#conv1d/conv1d/ExpandDims_1:output:0*
T0*9
_output_shapes'
%:#???????????????????*
paddingVALID*
strides
2
conv1d/conv1d?
conv1d/conv1d/SqueezeSqueezeconv1d/conv1d:output:0*
T0*5
_output_shapes#
!:???????????????????*
squeeze_dims

?????????2
conv1d/conv1d/Squeeze?
conv1d/BiasAdd/ReadVariableOpReadVariableOp&conv1d_biasadd_readvariableop_resource*
_output_shapes	
:?*
dtype02
conv1d/BiasAdd/ReadVariableOp?
conv1d/BiasAddBiasAddconv1d/conv1d/Squeeze:output:0%conv1d/BiasAdd/ReadVariableOp:value:0*
T0*5
_output_shapes#
!:???????????????????2
conv1d/BiasAdd{
conv1d/ReluReluconv1d/BiasAdd:output:0*
T0*5
_output_shapes#
!:???????????????????2
conv1d/Relu?
 dense_4/Tensordot/ReadVariableOpReadVariableOp)dense_4_tensordot_readvariableop_resource* 
_output_shapes
:
??*
dtype02"
 dense_4/Tensordot/ReadVariableOpz
dense_4/Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:2
dense_4/Tensordot/axes?
dense_4/Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       2
dense_4/Tensordot/free{
dense_4/Tensordot/ShapeShapeconv1d/Relu:activations:0*
T0*
_output_shapes
:2
dense_4/Tensordot/Shape?
dense_4/Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : 2!
dense_4/Tensordot/GatherV2/axis?
dense_4/Tensordot/GatherV2GatherV2 dense_4/Tensordot/Shape:output:0dense_4/Tensordot/free:output:0(dense_4/Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:2
dense_4/Tensordot/GatherV2?
!dense_4/Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : 2#
!dense_4/Tensordot/GatherV2_1/axis?
dense_4/Tensordot/GatherV2_1GatherV2 dense_4/Tensordot/Shape:output:0dense_4/Tensordot/axes:output:0*dense_4/Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:2
dense_4/Tensordot/GatherV2_1|
dense_4/Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: 2
dense_4/Tensordot/Const?
dense_4/Tensordot/ProdProd#dense_4/Tensordot/GatherV2:output:0 dense_4/Tensordot/Const:output:0*
T0*
_output_shapes
: 2
dense_4/Tensordot/Prod?
dense_4/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: 2
dense_4/Tensordot/Const_1?
dense_4/Tensordot/Prod_1Prod%dense_4/Tensordot/GatherV2_1:output:0"dense_4/Tensordot/Const_1:output:0*
T0*
_output_shapes
: 2
dense_4/Tensordot/Prod_1?
dense_4/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : 2
dense_4/Tensordot/concat/axis?
dense_4/Tensordot/concatConcatV2dense_4/Tensordot/free:output:0dense_4/Tensordot/axes:output:0&dense_4/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:2
dense_4/Tensordot/concat?
dense_4/Tensordot/stackPackdense_4/Tensordot/Prod:output:0!dense_4/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:2
dense_4/Tensordot/stack?
dense_4/Tensordot/transpose	Transposeconv1d/Relu:activations:0!dense_4/Tensordot/concat:output:0*
T0*5
_output_shapes#
!:???????????????????2
dense_4/Tensordot/transpose?
dense_4/Tensordot/ReshapeReshapedense_4/Tensordot/transpose:y:0 dense_4/Tensordot/stack:output:0*
T0*0
_output_shapes
:??????????????????2
dense_4/Tensordot/Reshape?
dense_4/Tensordot/MatMulMatMul"dense_4/Tensordot/Reshape:output:0(dense_4/Tensordot/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????2
dense_4/Tensordot/MatMul?
dense_4/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:?2
dense_4/Tensordot/Const_2?
dense_4/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : 2!
dense_4/Tensordot/concat_1/axis?
dense_4/Tensordot/concat_1ConcatV2#dense_4/Tensordot/GatherV2:output:0"dense_4/Tensordot/Const_2:output:0(dense_4/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:2
dense_4/Tensordot/concat_1?
dense_4/TensordotReshape"dense_4/Tensordot/MatMul:product:0#dense_4/Tensordot/concat_1:output:0*
T0*5
_output_shapes#
!:???????????????????2
dense_4/Tensordot?
dense_4/BiasAdd/ReadVariableOpReadVariableOp'dense_4_biasadd_readvariableop_resource*
_output_shapes	
:?*
dtype02 
dense_4/BiasAdd/ReadVariableOp?
dense_4/BiasAddBiasAdddense_4/Tensordot:output:0&dense_4/BiasAdd/ReadVariableOp:value:0*
T0*5
_output_shapes#
!:???????????????????2
dense_4/BiasAddj
reshape_2/ShapeShapedense_4/BiasAdd:output:0*
T0*
_output_shapes
:2
reshape_2/Shape?
reshape_2/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
reshape_2/strided_slice/stack?
reshape_2/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2!
reshape_2/strided_slice/stack_1?
reshape_2/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2!
reshape_2/strided_slice/stack_2?
reshape_2/strided_sliceStridedSlicereshape_2/Shape:output:0&reshape_2/strided_slice/stack:output:0(reshape_2/strided_slice/stack_1:output:0(reshape_2/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
reshape_2/strided_slicex
reshape_2/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2
reshape_2/Reshape/shape/1x
reshape_2/Reshape/shape/2Const*
_output_shapes
: *
dtype0*
value	B :32
reshape_2/Reshape/shape/2?
reshape_2/Reshape/shapePack reshape_2/strided_slice:output:0"reshape_2/Reshape/shape/1:output:0"reshape_2/Reshape/shape/2:output:0*
N*
T0*
_output_shapes
:2
reshape_2/Reshape/shape?
reshape_2/ReshapeReshapedense_4/BiasAdd:output:0 reshape_2/Reshape/shape:output:0*
T0*+
_output_shapes
:?????????32
reshape_2/Reshape?
IdentityIdentityreshape_2/Reshape:output:0^conv1d/BiasAdd/ReadVariableOp*^conv1d/conv1d/ExpandDims_1/ReadVariableOp^dense_4/BiasAdd/ReadVariableOp!^dense_4/Tensordot/ReadVariableOp*
T0*+
_output_shapes
:?????????32

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*;
_input_shapes*
(:??????????????????3: : : : 2>
conv1d/BiasAdd/ReadVariableOpconv1d/BiasAdd/ReadVariableOp2V
)conv1d/conv1d/ExpandDims_1/ReadVariableOp)conv1d/conv1d/ExpandDims_1/ReadVariableOp2@
dense_4/BiasAdd/ReadVariableOpdense_4/BiasAdd/ReadVariableOp2D
 dense_4/Tensordot/ReadVariableOp dense_4/Tensordot/ReadVariableOp:\ X
4
_output_shapes"
 :??????????????????3
 
_user_specified_nameinputs
?
?
A__inference_conv1d_layer_call_and_return_conditional_losses_15351

inputsB
+conv1d_expanddims_1_readvariableop_resource:3?.
biasadd_readvariableop_resource:	?
identity??BiasAdd/ReadVariableOp?"conv1d/ExpandDims_1/ReadVariableOpy
conv1d/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
valueB :
?????????2
conv1d/ExpandDims/dim?
conv1d/ExpandDims
ExpandDimsinputsconv1d/ExpandDims/dim:output:0*
T0*8
_output_shapes&
$:"??????????????????32
conv1d/ExpandDims?
"conv1d/ExpandDims_1/ReadVariableOpReadVariableOp+conv1d_expanddims_1_readvariableop_resource*#
_output_shapes
:3?*
dtype02$
"conv1d/ExpandDims_1/ReadVariableOpt
conv1d/ExpandDims_1/dimConst*
_output_shapes
: *
dtype0*
value	B : 2
conv1d/ExpandDims_1/dim?
conv1d/ExpandDims_1
ExpandDims*conv1d/ExpandDims_1/ReadVariableOp:value:0 conv1d/ExpandDims_1/dim:output:0*
T0*'
_output_shapes
:3?2
conv1d/ExpandDims_1?
conv1dConv2Dconv1d/ExpandDims:output:0conv1d/ExpandDims_1:output:0*
T0*9
_output_shapes'
%:#???????????????????*
paddingVALID*
strides
2
conv1d?
conv1d/SqueezeSqueezeconv1d:output:0*
T0*5
_output_shapes#
!:???????????????????*
squeeze_dims

?????????2
conv1d/Squeeze?
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
:?*
dtype02
BiasAdd/ReadVariableOp?
BiasAddBiasAddconv1d/Squeeze:output:0BiasAdd/ReadVariableOp:value:0*
T0*5
_output_shapes#
!:???????????????????2	
BiasAddf
ReluReluBiasAdd:output:0*
T0*5
_output_shapes#
!:???????????????????2
Relu?
IdentityIdentityRelu:activations:0^BiasAdd/ReadVariableOp#^conv1d/ExpandDims_1/ReadVariableOp*
T0*5
_output_shapes#
!:???????????????????2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*7
_input_shapes&
$:??????????????????3: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2H
"conv1d/ExpandDims_1/ReadVariableOp"conv1d/ExpandDims_1/ReadVariableOp:\ X
4
_output_shapes"
 :??????????????????3
 
_user_specified_nameinputs
?
?
?__inference_Conv_layer_call_and_return_conditional_losses_15087

inputs#
conv1d_15075:3?
conv1d_15077:	?!
dense_4_15080:
??
dense_4_15082:	?
identity??conv1d/StatefulPartitionedCall?dense_4/StatefulPartitionedCall?
lambda_2/PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :??????????????????3* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *L
fGRE
C__inference_lambda_2_layer_call_and_return_conditional_losses_150532
lambda_2/PartitionedCall?
conv1d/StatefulPartitionedCallStatefulPartitionedCall!lambda_2/PartitionedCall:output:0conv1d_15075conv1d_15077*
Tin
2*
Tout
2*
_collective_manager_ids
 *5
_output_shapes#
!:???????????????????*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *J
fERC
A__inference_conv1d_layer_call_and_return_conditional_losses_149422 
conv1d/StatefulPartitionedCall?
dense_4/StatefulPartitionedCallStatefulPartitionedCall'conv1d/StatefulPartitionedCall:output:0dense_4_15080dense_4_15082*
Tin
2*
Tout
2*
_collective_manager_ids
 *5
_output_shapes#
!:???????????????????*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *K
fFRD
B__inference_dense_4_layer_call_and_return_conditional_losses_149782!
dense_4/StatefulPartitionedCall?
reshape_2/PartitionedCallPartitionedCall(dense_4/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:?????????3* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *M
fHRF
D__inference_reshape_2_layer_call_and_return_conditional_losses_149972
reshape_2/PartitionedCall?
IdentityIdentity"reshape_2/PartitionedCall:output:0^conv1d/StatefulPartitionedCall ^dense_4/StatefulPartitionedCall*
T0*+
_output_shapes
:?????????32

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*;
_input_shapes*
(:??????????????????3: : : : 2@
conv1d/StatefulPartitionedCallconv1d/StatefulPartitionedCall2B
dense_4/StatefulPartitionedCalldense_4/StatefulPartitionedCall:\ X
4
_output_shapes"
 :??????????????????3
 
_user_specified_nameinputs"?L
saver_filename:0StatefulPartitionedCall_1:0StatefulPartitionedCall_28"
saved_model_main_op

NoOp*>
__saved_model_init_op%#
__saved_model_init_op

NoOp*?
serving_default?
V
lambda_2_inputD
 serving_default_lambda_2_input:0??????????????????3A
	reshape_24
StatefulPartitionedCall:0?????????3tensorflow/serving/predict:ȥ
?.
layer-0
layer_with_weights-0
layer-1
layer_with_weights-1
layer-2
layer-3
	optimizer
regularization_losses
trainable_variables
	variables
		keras_api


signatures
P_default_save_signature
Q__call__
*R&call_and_return_all_conditional_losses"?+
_tf_keras_sequential?+{"name": "Conv", "trainable": true, "expects_training_arg": true, "dtype": "float32", "batch_input_shape": null, "must_restore_from_config": false, "class_name": "Sequential", "config": {"name": "Conv", "layers": [{"class_name": "InputLayer", "config": {"batch_input_shape": {"class_name": "__tuple__", "items": [null, null, 51]}, "dtype": "float32", "sparse": false, "ragged": false, "name": "lambda_2_input"}}, {"class_name": "Lambda", "config": {"name": "lambda_2", "trainable": true, "dtype": "float32", "function": {"class_name": "__tuple__", "items": ["4wEAAAAAAAAAAAAAAAEAAAAFAAAAEwAAAHMcAAAAfABkAGQAhQKIAAsAZACFAmQAZACFAmYDGQBT\nAKkBTqkAqQHaAXipAVoKQ09OVl9XSURUSHICAAAA+lUvVXNlcnMvbW90aS9QeWNoYXJtUHJvamVj\ndHMvUkRCTVNfV29ya2xvYWRfRm9yZWNhc3Rlci9mb3JlY2FzdGVyL3RlbnNvcmZsb3doYW5kbGVy\nLnB52gg8bGFtYmRhPsMAAADzAAAAAA==\n", null, {"class_name": "__tuple__", "items": [3]}]}, "function_type": "lambda", "module": "forecaster.tensorflowhandler", "output_shape": null, "output_shape_type": "raw", "output_shape_module": null, "arguments": {}}}, {"class_name": "Conv1D", "config": {"name": "conv1d", "trainable": true, "dtype": "float32", "filters": 256, "kernel_size": {"class_name": "__tuple__", "items": [3]}, "strides": {"class_name": "__tuple__", "items": [1]}, "padding": "valid", "data_format": "channels_last", "dilation_rate": {"class_name": "__tuple__", "items": [1]}, "groups": 1, "activation": "relu", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}}, "bias_initializer": {"class_name": "Zeros", "config": {}}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}}, {"class_name": "Dense", "config": {"name": "dense_4", "trainable": true, "dtype": "float32", "units": 153, "activation": "linear", "use_bias": true, "kernel_initializer": {"class_name": "Zeros", "config": {}}, "bias_initializer": {"class_name": "Zeros", "config": {}}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}}, {"class_name": "Reshape", "config": {"name": "reshape_2", "trainable": true, "dtype": "float32", "target_shape": {"class_name": "__tuple__", "items": [3, 51]}}}]}, "shared_object_id": 9, "build_input_shape": {"class_name": "TensorShape", "items": [null, null, 51]}, "is_graph_network": true, "save_spec": {"class_name": "TypeSpec", "type_spec": "tf.TensorSpec", "serialized": [{"class_name": "TensorShape", "items": [null, null, 51]}, "float32", "lambda_2_input"]}, "keras_version": "2.5.0", "backend": "tensorflow", "model_config": {"class_name": "Sequential", "config": {"name": "Conv", "layers": [{"class_name": "InputLayer", "config": {"batch_input_shape": {"class_name": "__tuple__", "items": [null, null, 51]}, "dtype": "float32", "sparse": false, "ragged": false, "name": "lambda_2_input"}, "shared_object_id": 0}, {"class_name": "Lambda", "config": {"name": "lambda_2", "trainable": true, "dtype": "float32", "function": {"class_name": "__tuple__", "items": ["4wEAAAAAAAAAAAAAAAEAAAAFAAAAEwAAAHMcAAAAfABkAGQAhQKIAAsAZACFAmQAZACFAmYDGQBT\nAKkBTqkAqQHaAXipAVoKQ09OVl9XSURUSHICAAAA+lUvVXNlcnMvbW90aS9QeWNoYXJtUHJvamVj\ndHMvUkRCTVNfV29ya2xvYWRfRm9yZWNhc3Rlci9mb3JlY2FzdGVyL3RlbnNvcmZsb3doYW5kbGVy\nLnB52gg8bGFtYmRhPsMAAADzAAAAAA==\n", null, {"class_name": "__tuple__", "items": [3]}]}, "function_type": "lambda", "module": "forecaster.tensorflowhandler", "output_shape": null, "output_shape_type": "raw", "output_shape_module": null, "arguments": {}}, "shared_object_id": 1}, {"class_name": "Conv1D", "config": {"name": "conv1d", "trainable": true, "dtype": "float32", "filters": 256, "kernel_size": {"class_name": "__tuple__", "items": [3]}, "strides": {"class_name": "__tuple__", "items": [1]}, "padding": "valid", "data_format": "channels_last", "dilation_rate": {"class_name": "__tuple__", "items": [1]}, "groups": 1, "activation": "relu", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}, "shared_object_id": 2}, "bias_initializer": {"class_name": "Zeros", "config": {}, "shared_object_id": 3}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "shared_object_id": 4}, {"class_name": "Dense", "config": {"name": "dense_4", "trainable": true, "dtype": "float32", "units": 153, "activation": "linear", "use_bias": true, "kernel_initializer": {"class_name": "Zeros", "config": {}, "shared_object_id": 5}, "bias_initializer": {"class_name": "Zeros", "config": {}, "shared_object_id": 6}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "shared_object_id": 7}, {"class_name": "Reshape", "config": {"name": "reshape_2", "trainable": true, "dtype": "float32", "target_shape": {"class_name": "__tuple__", "items": [3, 51]}}, "shared_object_id": 8}]}}, "training_config": {"loss": {"class_name": "MeanSquaredError", "config": {"reduction": "auto", "name": "mean_squared_error"}, "shared_object_id": 10}, "metrics": [[{"class_name": "MeanAbsoluteError", "config": {"name": "mean_absolute_error", "dtype": "float32"}, "shared_object_id": 11}]], "weighted_metrics": null, "loss_weights": null, "optimizer_config": {"class_name": "Adam", "config": {"name": "Adam", "learning_rate": 0.009999999776482582, "decay": 0.0, "beta_1": 0.8999999761581421, "beta_2": 0.9990000128746033, "epsilon": 1e-07, "amsgrad": false}}}}
?
regularization_losses
trainable_variables
	variables
	keras_api
S__call__
*T&call_and_return_all_conditional_losses"?
_tf_keras_layer?{"name": "lambda_2", "trainable": true, "expects_training_arg": true, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "class_name": "Lambda", "config": {"name": "lambda_2", "trainable": true, "dtype": "float32", "function": {"class_name": "__tuple__", "items": ["4wEAAAAAAAAAAAAAAAEAAAAFAAAAEwAAAHMcAAAAfABkAGQAhQKIAAsAZACFAmQAZACFAmYDGQBT\nAKkBTqkAqQHaAXipAVoKQ09OVl9XSURUSHICAAAA+lUvVXNlcnMvbW90aS9QeWNoYXJtUHJvamVj\ndHMvUkRCTVNfV29ya2xvYWRfRm9yZWNhc3Rlci9mb3JlY2FzdGVyL3RlbnNvcmZsb3doYW5kbGVy\nLnB52gg8bGFtYmRhPsMAAADzAAAAAA==\n", null, {"class_name": "__tuple__", "items": [3]}]}, "function_type": "lambda", "module": "forecaster.tensorflowhandler", "output_shape": null, "output_shape_type": "raw", "output_shape_module": null, "arguments": {}}, "shared_object_id": 1}
?


kernel
bias
regularization_losses
trainable_variables
	variables
	keras_api
U__call__
*V&call_and_return_all_conditional_losses"?	
_tf_keras_layer?	{"name": "conv1d", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "class_name": "Conv1D", "config": {"name": "conv1d", "trainable": true, "dtype": "float32", "filters": 256, "kernel_size": {"class_name": "__tuple__", "items": [3]}, "strides": {"class_name": "__tuple__", "items": [1]}, "padding": "valid", "data_format": "channels_last", "dilation_rate": {"class_name": "__tuple__", "items": [1]}, "groups": 1, "activation": "relu", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}, "shared_object_id": 2}, "bias_initializer": {"class_name": "Zeros", "config": {}, "shared_object_id": 3}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "shared_object_id": 4, "input_spec": {"class_name": "InputSpec", "config": {"dtype": null, "shape": null, "ndim": null, "max_ndim": null, "min_ndim": 3, "axes": {"-1": 51}}, "shared_object_id": 12}, "build_input_shape": {"class_name": "TensorShape", "items": [null, null, 51]}}
?

kernel
bias
regularization_losses
trainable_variables
	variables
	keras_api
W__call__
*X&call_and_return_all_conditional_losses"?
_tf_keras_layer?{"name": "dense_4", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "class_name": "Dense", "config": {"name": "dense_4", "trainable": true, "dtype": "float32", "units": 153, "activation": "linear", "use_bias": true, "kernel_initializer": {"class_name": "Zeros", "config": {}, "shared_object_id": 5}, "bias_initializer": {"class_name": "Zeros", "config": {}, "shared_object_id": 6}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "shared_object_id": 7, "input_spec": {"class_name": "InputSpec", "config": {"dtype": null, "shape": null, "ndim": null, "max_ndim": null, "min_ndim": 2, "axes": {"-1": 256}}, "shared_object_id": 13}, "build_input_shape": {"class_name": "TensorShape", "items": [null, null, 256]}}
?
regularization_losses
trainable_variables
	variables
	keras_api
Y__call__
*Z&call_and_return_all_conditional_losses"?
_tf_keras_layer?{"name": "reshape_2", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "class_name": "Reshape", "config": {"name": "reshape_2", "trainable": true, "dtype": "float32", "target_shape": {"class_name": "__tuple__", "items": [3, 51]}}, "shared_object_id": 8}
?
iter

 beta_1

!beta_2
	"decay
#learning_ratemHmImJmKvLvMvNvO"
	optimizer
 "
trackable_list_wrapper
<
0
1
2
3"
trackable_list_wrapper
<
0
1
2
3"
trackable_list_wrapper
?
regularization_losses
$layer_metrics
trainable_variables
%layer_regularization_losses
&metrics

'layers
(non_trainable_variables
	variables
Q__call__
P_default_save_signature
*R&call_and_return_all_conditional_losses
&R"call_and_return_conditional_losses"
_generic_user_object
,
[serving_default"
signature_map
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
?
regularization_losses
)layer_metrics
trainable_variables
*layer_regularization_losses
+metrics

,layers
-non_trainable_variables
	variables
S__call__
*T&call_and_return_all_conditional_losses
&T"call_and_return_conditional_losses"
_generic_user_object
$:"3?2conv1d/kernel
:?2conv1d/bias
 "
trackable_list_wrapper
.
0
1"
trackable_list_wrapper
.
0
1"
trackable_list_wrapper
?
regularization_losses
.layer_metrics
trainable_variables
/layer_regularization_losses
0metrics

1layers
2non_trainable_variables
	variables
U__call__
*V&call_and_return_all_conditional_losses
&V"call_and_return_conditional_losses"
_generic_user_object
": 
??2dense_4/kernel
:?2dense_4/bias
 "
trackable_list_wrapper
.
0
1"
trackable_list_wrapper
.
0
1"
trackable_list_wrapper
?
regularization_losses
3layer_metrics
trainable_variables
4layer_regularization_losses
5metrics

6layers
7non_trainable_variables
	variables
W__call__
*X&call_and_return_all_conditional_losses
&X"call_and_return_conditional_losses"
_generic_user_object
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
?
regularization_losses
8layer_metrics
trainable_variables
9layer_regularization_losses
:metrics

;layers
<non_trainable_variables
	variables
Y__call__
*Z&call_and_return_all_conditional_losses
&Z"call_and_return_conditional_losses"
_generic_user_object
:	 (2	Adam/iter
: (2Adam/beta_1
: (2Adam/beta_2
: (2
Adam/decay
: (2Adam/learning_rate
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
.
=0
>1"
trackable_list_wrapper
<
0
1
2
3"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
?
	?total
	@count
A	variables
B	keras_api"?
_tf_keras_metric?{"class_name": "Mean", "name": "loss", "dtype": "float32", "config": {"name": "loss", "dtype": "float32"}, "shared_object_id": 14}
?
	Ctotal
	Dcount
E
_fn_kwargs
F	variables
G	keras_api"?
_tf_keras_metric?{"class_name": "MeanAbsoluteError", "name": "mean_absolute_error", "dtype": "float32", "config": {"name": "mean_absolute_error", "dtype": "float32"}, "shared_object_id": 11}
:  (2total
:  (2count
.
?0
@1"
trackable_list_wrapper
-
A	variables"
_generic_user_object
:  (2total
:  (2count
 "
trackable_dict_wrapper
.
C0
D1"
trackable_list_wrapper
-
F	variables"
_generic_user_object
):'3?2Adam/conv1d/kernel/m
:?2Adam/conv1d/bias/m
':%
??2Adam/dense_4/kernel/m
 :?2Adam/dense_4/bias/m
):'3?2Adam/conv1d/kernel/v
:?2Adam/conv1d/bias/v
':%
??2Adam/dense_4/kernel/v
 :?2Adam/dense_4/bias/v
?2?
 __inference__wrapped_model_14909?
???
FullArgSpec
args? 
varargsjargs
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *:?7
5?2
lambda_2_input??????????????????3
?2?
$__inference_Conv_layer_call_fn_15011
$__inference_Conv_layer_call_fn_15177
$__inference_Conv_layer_call_fn_15190
$__inference_Conv_layer_call_fn_15111?
???
FullArgSpec1
args)?&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults?
p 

 

kwonlyargs? 
kwonlydefaults? 
annotations? *
 
?2?
?__inference_Conv_layer_call_and_return_conditional_losses_15245
?__inference_Conv_layer_call_and_return_conditional_losses_15300
?__inference_Conv_layer_call_and_return_conditional_losses_15127
?__inference_Conv_layer_call_and_return_conditional_losses_15143?
???
FullArgSpec1
args)?&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults?
p 

 

kwonlyargs? 
kwonlydefaults? 
annotations? *
 
?2?
(__inference_lambda_2_layer_call_fn_15305
(__inference_lambda_2_layer_call_fn_15310?
???
FullArgSpec1
args)?&
jself
jinputs
jmask

jtraining
varargs
 
varkw
 
defaults?

 
p 

kwonlyargs? 
kwonlydefaults? 
annotations? *
 
?2?
C__inference_lambda_2_layer_call_and_return_conditional_losses_15318
C__inference_lambda_2_layer_call_and_return_conditional_losses_15326?
???
FullArgSpec1
args)?&
jself
jinputs
jmask

jtraining
varargs
 
varkw
 
defaults?

 
p 

kwonlyargs? 
kwonlydefaults? 
annotations? *
 
?2?
&__inference_conv1d_layer_call_fn_15335?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
A__inference_conv1d_layer_call_and_return_conditional_losses_15351?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
'__inference_dense_4_layer_call_fn_15360?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
B__inference_dense_4_layer_call_and_return_conditional_losses_15390?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
)__inference_reshape_2_layer_call_fn_15395?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
D__inference_reshape_2_layer_call_and_return_conditional_losses_15408?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?B?
#__inference_signature_wrapper_15164lambda_2_input"?
???
FullArgSpec
args? 
varargs
 
varkwjkwargs
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 ?
?__inference_Conv_layer_call_and_return_conditional_losses_15127L?I
B??
5?2
lambda_2_input??????????????????3
p 

 
? ")?&
?
0?????????3
? ?
?__inference_Conv_layer_call_and_return_conditional_losses_15143L?I
B??
5?2
lambda_2_input??????????????????3
p

 
? ")?&
?
0?????????3
? ?
?__inference_Conv_layer_call_and_return_conditional_losses_15245wD?A
:?7
-?*
inputs??????????????????3
p 

 
? ")?&
?
0?????????3
? ?
?__inference_Conv_layer_call_and_return_conditional_losses_15300wD?A
:?7
-?*
inputs??????????????????3
p

 
? ")?&
?
0?????????3
? ?
$__inference_Conv_layer_call_fn_15011rL?I
B??
5?2
lambda_2_input??????????????????3
p 

 
? "??????????3?
$__inference_Conv_layer_call_fn_15111rL?I
B??
5?2
lambda_2_input??????????????????3
p

 
? "??????????3?
$__inference_Conv_layer_call_fn_15177jD?A
:?7
-?*
inputs??????????????????3
p 

 
? "??????????3?
$__inference_Conv_layer_call_fn_15190jD?A
:?7
-?*
inputs??????????????????3
p

 
? "??????????3?
 __inference__wrapped_model_14909?D?A
:?7
5?2
lambda_2_input??????????????????3
? "9?6
4
	reshape_2'?$
	reshape_2?????????3?
A__inference_conv1d_layer_call_and_return_conditional_losses_15351w<?9
2?/
-?*
inputs??????????????????3
? "3?0
)?&
0???????????????????
? ?
&__inference_conv1d_layer_call_fn_15335j<?9
2?/
-?*
inputs??????????????????3
? "&?#????????????????????
B__inference_dense_4_layer_call_and_return_conditional_losses_15390x=?:
3?0
.?+
inputs???????????????????
? "3?0
)?&
0???????????????????
? ?
'__inference_dense_4_layer_call_fn_15360k=?:
3?0
.?+
inputs???????????????????
? "&?#????????????????????
C__inference_lambda_2_layer_call_and_return_conditional_losses_15318zD?A
:?7
-?*
inputs??????????????????3

 
p 
? "2?/
(?%
0??????????????????3
? ?
C__inference_lambda_2_layer_call_and_return_conditional_losses_15326zD?A
:?7
-?*
inputs??????????????????3

 
p
? "2?/
(?%
0??????????????????3
? ?
(__inference_lambda_2_layer_call_fn_15305mD?A
:?7
-?*
inputs??????????????????3

 
p 
? "%?"??????????????????3?
(__inference_lambda_2_layer_call_fn_15310mD?A
:?7
-?*
inputs??????????????????3

 
p
? "%?"??????????????????3?
D__inference_reshape_2_layer_call_and_return_conditional_losses_15408j=?:
3?0
.?+
inputs???????????????????
? ")?&
?
0?????????3
? ?
)__inference_reshape_2_layer_call_fn_15395]=?:
3?0
.?+
inputs???????????????????
? "??????????3?
#__inference_signature_wrapper_15164?V?S
? 
L?I
G
lambda_2_input5?2
lambda_2_input??????????????????3"9?6
4
	reshape_2'?$
	reshape_2?????????3