??
??
D
AddV2
x"T
y"T
z"T"
Ttype:
2	??
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
8
Const
output"dtype"
valuetensor"
dtypetype
^
Fill
dims"
index_type

value"T
output"T"	
Ttype"

index_typetype0:
2	
.
Identity

input"T
output"T"	
Ttype
:
Less
x"T
y"T
z
"
Ttype:
2	
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
?
Mul
x"T
y"T
z"T"
Ttype:
2	?
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
@
ReadVariableOp
resource
value"dtype"
dtypetype?
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
0
Sigmoid
x"T
y"T"
Ttype:

2
[
Split
	split_dim

value"T
output"T*	num_split"
	num_splitint(0"	
Ttype
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
-
Tanh
x"T
y"T"
Ttype:

2
?
TensorListFromTensor
tensor"element_dtype
element_shape"
shape_type
output_handle"
element_dtypetype"

shape_typetype:
2	
?
TensorListReserve
element_shape"
shape_type
num_elements

handle"
element_dtypetype"

shape_typetype:
2	
?
TensorListStack
input_handle
element_shape
tensor"element_dtype"
element_dtypetype" 
num_elementsint?????????
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
 ?
?
While

input2T
output2T"
T
list(type)("
condfunc"
bodyfunc" 
output_shapeslist(shape)
 "
parallel_iterationsint
?"serve*	2.5.0-rc32v2.5.0-rc2-14-gfcdf65934708??
?
AR_LSTM/rnn/lstm_cell/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:	3?*-
shared_nameAR_LSTM/rnn/lstm_cell/kernel
?
0AR_LSTM/rnn/lstm_cell/kernel/Read/ReadVariableOpReadVariableOpAR_LSTM/rnn/lstm_cell/kernel*
_output_shapes
:	3?*
dtype0
?
&AR_LSTM/rnn/lstm_cell/recurrent_kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:	 ?*7
shared_name(&AR_LSTM/rnn/lstm_cell/recurrent_kernel
?
:AR_LSTM/rnn/lstm_cell/recurrent_kernel/Read/ReadVariableOpReadVariableOp&AR_LSTM/rnn/lstm_cell/recurrent_kernel*
_output_shapes
:	 ?*
dtype0
?
AR_LSTM/rnn/lstm_cell/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:?*+
shared_nameAR_LSTM/rnn/lstm_cell/bias
?
.AR_LSTM/rnn/lstm_cell/bias/Read/ReadVariableOpReadVariableOpAR_LSTM/rnn/lstm_cell/bias*
_output_shapes	
:?*
dtype0
?
AR_LSTM/dense_1/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape
: 3*'
shared_nameAR_LSTM/dense_1/kernel
?
*AR_LSTM/dense_1/kernel/Read/ReadVariableOpReadVariableOpAR_LSTM/dense_1/kernel*
_output_shapes

: 3*
dtype0
?
AR_LSTM/dense_1/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:3*%
shared_nameAR_LSTM/dense_1/bias
y
(AR_LSTM/dense_1/bias/Read/ReadVariableOpReadVariableOpAR_LSTM/dense_1/bias*
_output_shapes
:3*
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
#Adam/AR_LSTM/rnn/lstm_cell/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:	3?*4
shared_name%#Adam/AR_LSTM/rnn/lstm_cell/kernel/m
?
7Adam/AR_LSTM/rnn/lstm_cell/kernel/m/Read/ReadVariableOpReadVariableOp#Adam/AR_LSTM/rnn/lstm_cell/kernel/m*
_output_shapes
:	3?*
dtype0
?
-Adam/AR_LSTM/rnn/lstm_cell/recurrent_kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:	 ?*>
shared_name/-Adam/AR_LSTM/rnn/lstm_cell/recurrent_kernel/m
?
AAdam/AR_LSTM/rnn/lstm_cell/recurrent_kernel/m/Read/ReadVariableOpReadVariableOp-Adam/AR_LSTM/rnn/lstm_cell/recurrent_kernel/m*
_output_shapes
:	 ?*
dtype0
?
!Adam/AR_LSTM/rnn/lstm_cell/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:?*2
shared_name#!Adam/AR_LSTM/rnn/lstm_cell/bias/m
?
5Adam/AR_LSTM/rnn/lstm_cell/bias/m/Read/ReadVariableOpReadVariableOp!Adam/AR_LSTM/rnn/lstm_cell/bias/m*
_output_shapes	
:?*
dtype0
?
Adam/AR_LSTM/dense_1/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape
: 3*.
shared_nameAdam/AR_LSTM/dense_1/kernel/m
?
1Adam/AR_LSTM/dense_1/kernel/m/Read/ReadVariableOpReadVariableOpAdam/AR_LSTM/dense_1/kernel/m*
_output_shapes

: 3*
dtype0
?
Adam/AR_LSTM/dense_1/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:3*,
shared_nameAdam/AR_LSTM/dense_1/bias/m
?
/Adam/AR_LSTM/dense_1/bias/m/Read/ReadVariableOpReadVariableOpAdam/AR_LSTM/dense_1/bias/m*
_output_shapes
:3*
dtype0
?
#Adam/AR_LSTM/rnn/lstm_cell/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:	3?*4
shared_name%#Adam/AR_LSTM/rnn/lstm_cell/kernel/v
?
7Adam/AR_LSTM/rnn/lstm_cell/kernel/v/Read/ReadVariableOpReadVariableOp#Adam/AR_LSTM/rnn/lstm_cell/kernel/v*
_output_shapes
:	3?*
dtype0
?
-Adam/AR_LSTM/rnn/lstm_cell/recurrent_kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:	 ?*>
shared_name/-Adam/AR_LSTM/rnn/lstm_cell/recurrent_kernel/v
?
AAdam/AR_LSTM/rnn/lstm_cell/recurrent_kernel/v/Read/ReadVariableOpReadVariableOp-Adam/AR_LSTM/rnn/lstm_cell/recurrent_kernel/v*
_output_shapes
:	 ?*
dtype0
?
!Adam/AR_LSTM/rnn/lstm_cell/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:?*2
shared_name#!Adam/AR_LSTM/rnn/lstm_cell/bias/v
?
5Adam/AR_LSTM/rnn/lstm_cell/bias/v/Read/ReadVariableOpReadVariableOp!Adam/AR_LSTM/rnn/lstm_cell/bias/v*
_output_shapes	
:?*
dtype0
?
Adam/AR_LSTM/dense_1/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape
: 3*.
shared_nameAdam/AR_LSTM/dense_1/kernel/v
?
1Adam/AR_LSTM/dense_1/kernel/v/Read/ReadVariableOpReadVariableOpAdam/AR_LSTM/dense_1/kernel/v*
_output_shapes

: 3*
dtype0
?
Adam/AR_LSTM/dense_1/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:3*,
shared_nameAdam/AR_LSTM/dense_1/bias/v
?
/Adam/AR_LSTM/dense_1/bias/v/Read/ReadVariableOpReadVariableOpAdam/AR_LSTM/dense_1/bias/v*
_output_shapes
:3*
dtype0

NoOpNoOp
?"
ConstConst"/device:CPU:0*
_output_shapes
: *
dtype0*?"
value?"B?" B?"
?
	lstm_cell
lstm_rnn
	dense
	optimizer
regularization_losses
trainable_variables
	variables
	keras_api
	
signatures
?


state_size

kernel
recurrent_kernel
bias
regularization_losses
trainable_variables
	variables
	keras_api
l
cell

state_spec
regularization_losses
trainable_variables
	variables
	keras_api
h

kernel
bias
regularization_losses
trainable_variables
	variables
	keras_api
?
iter

beta_1

beta_2
	 decay
!learning_ratemBmCmDmEmFvGvHvIvJvK
 
#
0
1
2
3
4
#
0
1
2
3
4
?
regularization_losses
"layer_metrics
trainable_variables
#layer_regularization_losses
$metrics

%layers
&non_trainable_variables
	variables
 
 
][
VARIABLE_VALUEAR_LSTM/rnn/lstm_cell/kernel+lstm_cell/kernel/.ATTRIBUTES/VARIABLE_VALUE
qo
VARIABLE_VALUE&AR_LSTM/rnn/lstm_cell/recurrent_kernel5lstm_cell/recurrent_kernel/.ATTRIBUTES/VARIABLE_VALUE
YW
VARIABLE_VALUEAR_LSTM/rnn/lstm_cell/bias)lstm_cell/bias/.ATTRIBUTES/VARIABLE_VALUE
 

0
1
2

0
1
2
?
regularization_losses
'layer_metrics
trainable_variables
(layer_regularization_losses
)metrics

*layers
+non_trainable_variables
	variables
 
 

0
1
2

0
1
2
?
regularization_losses
,layer_metrics

-states
trainable_variables
.layer_regularization_losses
/metrics

0layers
1non_trainable_variables
	variables
SQ
VARIABLE_VALUEAR_LSTM/dense_1/kernel'dense/kernel/.ATTRIBUTES/VARIABLE_VALUE
OM
VARIABLE_VALUEAR_LSTM/dense_1/bias%dense/bias/.ATTRIBUTES/VARIABLE_VALUE
 

0
1

0
1
?
regularization_losses
2layer_metrics
trainable_variables
3layer_regularization_losses
4metrics

5layers
6non_trainable_variables
	variables
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
70
81

0
1
2
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

0
 
 
 
 
 
 
4
	9total
	:count
;	variables
<	keras_api
D
	=total
	>count
?
_fn_kwargs
@	variables
A	keras_api
OM
VARIABLE_VALUEtotal4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUE
OM
VARIABLE_VALUEcount4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUE

90
:1

;	variables
QO
VARIABLE_VALUEtotal_14keras_api/metrics/1/total/.ATTRIBUTES/VARIABLE_VALUE
QO
VARIABLE_VALUEcount_14keras_api/metrics/1/count/.ATTRIBUTES/VARIABLE_VALUE
 

=0
>1

@	variables
?~
VARIABLE_VALUE#Adam/AR_LSTM/rnn/lstm_cell/kernel/mGlstm_cell/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
??
VARIABLE_VALUE-Adam/AR_LSTM/rnn/lstm_cell/recurrent_kernel/mQlstm_cell/recurrent_kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
|z
VARIABLE_VALUE!Adam/AR_LSTM/rnn/lstm_cell/bias/mElstm_cell/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
vt
VARIABLE_VALUEAdam/AR_LSTM/dense_1/kernel/mCdense/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
rp
VARIABLE_VALUEAdam/AR_LSTM/dense_1/bias/mAdense/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
?~
VARIABLE_VALUE#Adam/AR_LSTM/rnn/lstm_cell/kernel/vGlstm_cell/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
??
VARIABLE_VALUE-Adam/AR_LSTM/rnn/lstm_cell/recurrent_kernel/vQlstm_cell/recurrent_kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
|z
VARIABLE_VALUE!Adam/AR_LSTM/rnn/lstm_cell/bias/vElstm_cell/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
vt
VARIABLE_VALUEAdam/AR_LSTM/dense_1/kernel/vCdense/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
rp
VARIABLE_VALUEAdam/AR_LSTM/dense_1/bias/vAdense/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
?
serving_default_input_1Placeholder*4
_output_shapes"
 :??????????????????3*
dtype0*)
shape :??????????????????3
?
StatefulPartitionedCallStatefulPartitionedCallserving_default_input_1AR_LSTM/rnn/lstm_cell/kernel&AR_LSTM/rnn/lstm_cell/recurrent_kernelAR_LSTM/rnn/lstm_cell/biasAR_LSTM/dense_1/kernelAR_LSTM/dense_1/bias*
Tin

2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:?????????3*'
_read_only_resource_inputs	
*-
config_proto

CPU

GPU 2J 8? *+
f&R$
"__inference_signature_wrapper_8878
O
saver_filenamePlaceholder*
_output_shapes
: *
dtype0*
shape: 
?

StatefulPartitionedCall_1StatefulPartitionedCallsaver_filename0AR_LSTM/rnn/lstm_cell/kernel/Read/ReadVariableOp:AR_LSTM/rnn/lstm_cell/recurrent_kernel/Read/ReadVariableOp.AR_LSTM/rnn/lstm_cell/bias/Read/ReadVariableOp*AR_LSTM/dense_1/kernel/Read/ReadVariableOp(AR_LSTM/dense_1/bias/Read/ReadVariableOpAdam/iter/Read/ReadVariableOpAdam/beta_1/Read/ReadVariableOpAdam/beta_2/Read/ReadVariableOpAdam/decay/Read/ReadVariableOp&Adam/learning_rate/Read/ReadVariableOptotal/Read/ReadVariableOpcount/Read/ReadVariableOptotal_1/Read/ReadVariableOpcount_1/Read/ReadVariableOp7Adam/AR_LSTM/rnn/lstm_cell/kernel/m/Read/ReadVariableOpAAdam/AR_LSTM/rnn/lstm_cell/recurrent_kernel/m/Read/ReadVariableOp5Adam/AR_LSTM/rnn/lstm_cell/bias/m/Read/ReadVariableOp1Adam/AR_LSTM/dense_1/kernel/m/Read/ReadVariableOp/Adam/AR_LSTM/dense_1/bias/m/Read/ReadVariableOp7Adam/AR_LSTM/rnn/lstm_cell/kernel/v/Read/ReadVariableOpAAdam/AR_LSTM/rnn/lstm_cell/recurrent_kernel/v/Read/ReadVariableOp5Adam/AR_LSTM/rnn/lstm_cell/bias/v/Read/ReadVariableOp1Adam/AR_LSTM/dense_1/kernel/v/Read/ReadVariableOp/Adam/AR_LSTM/dense_1/bias/v/Read/ReadVariableOpConst*%
Tin
2	*
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
__inference__traced_save_10304
?
StatefulPartitionedCall_2StatefulPartitionedCallsaver_filenameAR_LSTM/rnn/lstm_cell/kernel&AR_LSTM/rnn/lstm_cell/recurrent_kernelAR_LSTM/rnn/lstm_cell/biasAR_LSTM/dense_1/kernelAR_LSTM/dense_1/bias	Adam/iterAdam/beta_1Adam/beta_2
Adam/decayAdam/learning_ratetotalcounttotal_1count_1#Adam/AR_LSTM/rnn/lstm_cell/kernel/m-Adam/AR_LSTM/rnn/lstm_cell/recurrent_kernel/m!Adam/AR_LSTM/rnn/lstm_cell/bias/mAdam/AR_LSTM/dense_1/kernel/mAdam/AR_LSTM/dense_1/bias/m#Adam/AR_LSTM/rnn/lstm_cell/kernel/v-Adam/AR_LSTM/rnn/lstm_cell/recurrent_kernel/v!Adam/AR_LSTM/rnn/lstm_cell/bias/vAdam/AR_LSTM/dense_1/kernel/vAdam/AR_LSTM/dense_1/bias/v*$
Tin
2*
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
!__inference__traced_restore_10386??
?
?
C__inference_lstm_cell_layer_call_and_return_conditional_losses_7669

inputs

states
states_11
matmul_readvariableop_resource:	3?3
 matmul_1_readvariableop_resource:	 ?.
biasadd_readvariableop_resource:	?
identity

identity_1

identity_2??BiasAdd/ReadVariableOp?MatMul/ReadVariableOp?MatMul_1/ReadVariableOp?
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	3?*
dtype02
MatMul/ReadVariableOpt
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????2
MatMul?
MatMul_1/ReadVariableOpReadVariableOp matmul_1_readvariableop_resource*
_output_shapes
:	 ?*
dtype02
MatMul_1/ReadVariableOpz
MatMul_1MatMulstatesMatMul_1/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????2

MatMul_1l
addAddV2MatMul:product:0MatMul_1:product:0*
T0*(
_output_shapes
:??????????2
add?
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
:?*
dtype02
BiasAdd/ReadVariableOpy
BiasAddBiasAddadd:z:0BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????2	
BiasAddd
split/split_dimConst*
_output_shapes
: *
dtype0*
value	B :2
split/split_dim?
splitSplitsplit/split_dim:output:0BiasAdd:output:0*
T0*`
_output_shapesN
L:????????? :????????? :????????? :????????? *
	num_split2
split_
SigmoidSigmoidsplit:output:0*
T0*'
_output_shapes
:????????? 2	
Sigmoidc
	Sigmoid_1Sigmoidsplit:output:1*
T0*'
_output_shapes
:????????? 2
	Sigmoid_1\
mulMulSigmoid_1:y:0states_1*
T0*'
_output_shapes
:????????? 2
mulV
TanhTanhsplit:output:2*
T0*'
_output_shapes
:????????? 2
Tanh^
mul_1MulSigmoid:y:0Tanh:y:0*
T0*'
_output_shapes
:????????? 2
mul_1]
add_1AddV2mul:z:0	mul_1:z:0*
T0*'
_output_shapes
:????????? 2
add_1c
	Sigmoid_2Sigmoidsplit:output:3*
T0*'
_output_shapes
:????????? 2
	Sigmoid_2U
Tanh_1Tanh	add_1:z:0*
T0*'
_output_shapes
:????????? 2
Tanh_1b
mul_2MulSigmoid_2:y:0
Tanh_1:y:0*
T0*'
_output_shapes
:????????? 2
mul_2?
IdentityIdentity	mul_2:z:0^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp^MatMul_1/ReadVariableOp*
T0*'
_output_shapes
:????????? 2

Identity?

Identity_1Identity	mul_2:z:0^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp^MatMul_1/ReadVariableOp*
T0*'
_output_shapes
:????????? 2

Identity_1?

Identity_2Identity	add_1:z:0^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp^MatMul_1/ReadVariableOp*
T0*'
_output_shapes
:????????? 2

Identity_2"
identityIdentity:output:0"!

identity_1Identity_1:output:0"!

identity_2Identity_2:output:0*(
_construction_contextkEagerRuntime*R
_input_shapesA
?:?????????3:????????? :????????? : : : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp22
MatMul_1/ReadVariableOpMatMul_1/ReadVariableOp:O K
'
_output_shapes
:?????????3
 
_user_specified_nameinputs:OK
'
_output_shapes
:????????? 
 
_user_specified_namestates:OK
'
_output_shapes
:????????? 
 
_user_specified_namestates
?
?
C__inference_lstm_cell_layer_call_and_return_conditional_losses_8528

inputs

states
states_11
matmul_readvariableop_resource:	3?3
 matmul_1_readvariableop_resource:	 ?.
biasadd_readvariableop_resource:	?
identity

identity_1

identity_2??BiasAdd/ReadVariableOp?MatMul/ReadVariableOp?MatMul_1/ReadVariableOp?
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	3?*
dtype02
MatMul/ReadVariableOpt
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????2
MatMul?
MatMul_1/ReadVariableOpReadVariableOp matmul_1_readvariableop_resource*
_output_shapes
:	 ?*
dtype02
MatMul_1/ReadVariableOpz
MatMul_1MatMulstatesMatMul_1/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????2

MatMul_1l
addAddV2MatMul:product:0MatMul_1:product:0*
T0*(
_output_shapes
:??????????2
add?
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
:?*
dtype02
BiasAdd/ReadVariableOpy
BiasAddBiasAddadd:z:0BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????2	
BiasAddd
split/split_dimConst*
_output_shapes
: *
dtype0*
value	B :2
split/split_dim?
splitSplitsplit/split_dim:output:0BiasAdd:output:0*
T0*`
_output_shapesN
L:????????? :????????? :????????? :????????? *
	num_split2
split_
SigmoidSigmoidsplit:output:0*
T0*'
_output_shapes
:????????? 2	
Sigmoidc
	Sigmoid_1Sigmoidsplit:output:1*
T0*'
_output_shapes
:????????? 2
	Sigmoid_1\
mulMulSigmoid_1:y:0states_1*
T0*'
_output_shapes
:????????? 2
mulV
TanhTanhsplit:output:2*
T0*'
_output_shapes
:????????? 2
Tanh^
mul_1MulSigmoid:y:0Tanh:y:0*
T0*'
_output_shapes
:????????? 2
mul_1]
add_1AddV2mul:z:0	mul_1:z:0*
T0*'
_output_shapes
:????????? 2
add_1c
	Sigmoid_2Sigmoidsplit:output:3*
T0*'
_output_shapes
:????????? 2
	Sigmoid_2U
Tanh_1Tanh	add_1:z:0*
T0*'
_output_shapes
:????????? 2
Tanh_1b
mul_2MulSigmoid_2:y:0
Tanh_1:y:0*
T0*'
_output_shapes
:????????? 2
mul_2?
IdentityIdentity	mul_2:z:0^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp^MatMul_1/ReadVariableOp*
T0*'
_output_shapes
:????????? 2

Identity?

Identity_1Identity	mul_2:z:0^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp^MatMul_1/ReadVariableOp*
T0*'
_output_shapes
:????????? 2

Identity_1?

Identity_2Identity	add_1:z:0^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp^MatMul_1/ReadVariableOp*
T0*'
_output_shapes
:????????? 2

Identity_2"
identityIdentity:output:0"!

identity_1Identity_1:output:0"!

identity_2Identity_2:output:0*(
_construction_contextkEagerRuntime*R
_input_shapesA
?:?????????3:????????? :????????? : : : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp22
MatMul_1/ReadVariableOpMatMul_1/ReadVariableOp:O K
'
_output_shapes
:?????????3
 
_user_specified_nameinputs:OK
'
_output_shapes
:????????? 
 
_user_specified_namestates:OK
'
_output_shapes
:????????? 
 
_user_specified_namestates
?F
?	
rnn_while_body_9184$
 rnn_while_rnn_while_loop_counter*
&rnn_while_rnn_while_maximum_iterations
rnn_while_placeholder
rnn_while_placeholder_1
rnn_while_placeholder_2
rnn_while_placeholder_3#
rnn_while_rnn_strided_slice_1_0_
[rnn_while_tensorarrayv2read_tensorlistgetitem_rnn_tensorarrayunstack_tensorlistfromtensor_0G
4rnn_while_lstm_cell_matmul_readvariableop_resource_0:	3?I
6rnn_while_lstm_cell_matmul_1_readvariableop_resource_0:	 ?D
5rnn_while_lstm_cell_biasadd_readvariableop_resource_0:	?
rnn_while_identity
rnn_while_identity_1
rnn_while_identity_2
rnn_while_identity_3
rnn_while_identity_4
rnn_while_identity_5!
rnn_while_rnn_strided_slice_1]
Yrnn_while_tensorarrayv2read_tensorlistgetitem_rnn_tensorarrayunstack_tensorlistfromtensorE
2rnn_while_lstm_cell_matmul_readvariableop_resource:	3?G
4rnn_while_lstm_cell_matmul_1_readvariableop_resource:	 ?B
3rnn_while_lstm_cell_biasadd_readvariableop_resource:	???*rnn/while/lstm_cell/BiasAdd/ReadVariableOp?)rnn/while/lstm_cell/MatMul/ReadVariableOp?+rnn/while/lstm_cell/MatMul_1/ReadVariableOp?
;rnn/while/TensorArrayV2Read/TensorListGetItem/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????3   2=
;rnn/while/TensorArrayV2Read/TensorListGetItem/element_shape?
-rnn/while/TensorArrayV2Read/TensorListGetItemTensorListGetItem[rnn_while_tensorarrayv2read_tensorlistgetitem_rnn_tensorarrayunstack_tensorlistfromtensor_0rnn_while_placeholderDrnn/while/TensorArrayV2Read/TensorListGetItem/element_shape:output:0*'
_output_shapes
:?????????3*
element_dtype02/
-rnn/while/TensorArrayV2Read/TensorListGetItem?
)rnn/while/lstm_cell/MatMul/ReadVariableOpReadVariableOp4rnn_while_lstm_cell_matmul_readvariableop_resource_0*
_output_shapes
:	3?*
dtype02+
)rnn/while/lstm_cell/MatMul/ReadVariableOp?
rnn/while/lstm_cell/MatMulMatMul4rnn/while/TensorArrayV2Read/TensorListGetItem:item:01rnn/while/lstm_cell/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????2
rnn/while/lstm_cell/MatMul?
+rnn/while/lstm_cell/MatMul_1/ReadVariableOpReadVariableOp6rnn_while_lstm_cell_matmul_1_readvariableop_resource_0*
_output_shapes
:	 ?*
dtype02-
+rnn/while/lstm_cell/MatMul_1/ReadVariableOp?
rnn/while/lstm_cell/MatMul_1MatMulrnn_while_placeholder_23rnn/while/lstm_cell/MatMul_1/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????2
rnn/while/lstm_cell/MatMul_1?
rnn/while/lstm_cell/addAddV2$rnn/while/lstm_cell/MatMul:product:0&rnn/while/lstm_cell/MatMul_1:product:0*
T0*(
_output_shapes
:??????????2
rnn/while/lstm_cell/add?
*rnn/while/lstm_cell/BiasAdd/ReadVariableOpReadVariableOp5rnn_while_lstm_cell_biasadd_readvariableop_resource_0*
_output_shapes	
:?*
dtype02,
*rnn/while/lstm_cell/BiasAdd/ReadVariableOp?
rnn/while/lstm_cell/BiasAddBiasAddrnn/while/lstm_cell/add:z:02rnn/while/lstm_cell/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????2
rnn/while/lstm_cell/BiasAdd?
#rnn/while/lstm_cell/split/split_dimConst*
_output_shapes
: *
dtype0*
value	B :2%
#rnn/while/lstm_cell/split/split_dim?
rnn/while/lstm_cell/splitSplit,rnn/while/lstm_cell/split/split_dim:output:0$rnn/while/lstm_cell/BiasAdd:output:0*
T0*`
_output_shapesN
L:????????? :????????? :????????? :????????? *
	num_split2
rnn/while/lstm_cell/split?
rnn/while/lstm_cell/SigmoidSigmoid"rnn/while/lstm_cell/split:output:0*
T0*'
_output_shapes
:????????? 2
rnn/while/lstm_cell/Sigmoid?
rnn/while/lstm_cell/Sigmoid_1Sigmoid"rnn/while/lstm_cell/split:output:1*
T0*'
_output_shapes
:????????? 2
rnn/while/lstm_cell/Sigmoid_1?
rnn/while/lstm_cell/mulMul!rnn/while/lstm_cell/Sigmoid_1:y:0rnn_while_placeholder_3*
T0*'
_output_shapes
:????????? 2
rnn/while/lstm_cell/mul?
rnn/while/lstm_cell/TanhTanh"rnn/while/lstm_cell/split:output:2*
T0*'
_output_shapes
:????????? 2
rnn/while/lstm_cell/Tanh?
rnn/while/lstm_cell/mul_1Mulrnn/while/lstm_cell/Sigmoid:y:0rnn/while/lstm_cell/Tanh:y:0*
T0*'
_output_shapes
:????????? 2
rnn/while/lstm_cell/mul_1?
rnn/while/lstm_cell/add_1AddV2rnn/while/lstm_cell/mul:z:0rnn/while/lstm_cell/mul_1:z:0*
T0*'
_output_shapes
:????????? 2
rnn/while/lstm_cell/add_1?
rnn/while/lstm_cell/Sigmoid_2Sigmoid"rnn/while/lstm_cell/split:output:3*
T0*'
_output_shapes
:????????? 2
rnn/while/lstm_cell/Sigmoid_2?
rnn/while/lstm_cell/Tanh_1Tanhrnn/while/lstm_cell/add_1:z:0*
T0*'
_output_shapes
:????????? 2
rnn/while/lstm_cell/Tanh_1?
rnn/while/lstm_cell/mul_2Mul!rnn/while/lstm_cell/Sigmoid_2:y:0rnn/while/lstm_cell/Tanh_1:y:0*
T0*'
_output_shapes
:????????? 2
rnn/while/lstm_cell/mul_2?
.rnn/while/TensorArrayV2Write/TensorListSetItemTensorListSetItemrnn_while_placeholder_1rnn_while_placeholderrnn/while/lstm_cell/mul_2:z:0*
_output_shapes
: *
element_dtype020
.rnn/while/TensorArrayV2Write/TensorListSetItemd
rnn/while/add/yConst*
_output_shapes
: *
dtype0*
value	B :2
rnn/while/add/yy
rnn/while/addAddV2rnn_while_placeholderrnn/while/add/y:output:0*
T0*
_output_shapes
: 2
rnn/while/addh
rnn/while/add_1/yConst*
_output_shapes
: *
dtype0*
value	B :2
rnn/while/add_1/y?
rnn/while/add_1AddV2 rnn_while_rnn_while_loop_counterrnn/while/add_1/y:output:0*
T0*
_output_shapes
: 2
rnn/while/add_1?
rnn/while/IdentityIdentityrnn/while/add_1:z:0+^rnn/while/lstm_cell/BiasAdd/ReadVariableOp*^rnn/while/lstm_cell/MatMul/ReadVariableOp,^rnn/while/lstm_cell/MatMul_1/ReadVariableOp*
T0*
_output_shapes
: 2
rnn/while/Identity?
rnn/while/Identity_1Identity&rnn_while_rnn_while_maximum_iterations+^rnn/while/lstm_cell/BiasAdd/ReadVariableOp*^rnn/while/lstm_cell/MatMul/ReadVariableOp,^rnn/while/lstm_cell/MatMul_1/ReadVariableOp*
T0*
_output_shapes
: 2
rnn/while/Identity_1?
rnn/while/Identity_2Identityrnn/while/add:z:0+^rnn/while/lstm_cell/BiasAdd/ReadVariableOp*^rnn/while/lstm_cell/MatMul/ReadVariableOp,^rnn/while/lstm_cell/MatMul_1/ReadVariableOp*
T0*
_output_shapes
: 2
rnn/while/Identity_2?
rnn/while/Identity_3Identity>rnn/while/TensorArrayV2Write/TensorListSetItem:output_handle:0+^rnn/while/lstm_cell/BiasAdd/ReadVariableOp*^rnn/while/lstm_cell/MatMul/ReadVariableOp,^rnn/while/lstm_cell/MatMul_1/ReadVariableOp*
T0*
_output_shapes
: 2
rnn/while/Identity_3?
rnn/while/Identity_4Identityrnn/while/lstm_cell/mul_2:z:0+^rnn/while/lstm_cell/BiasAdd/ReadVariableOp*^rnn/while/lstm_cell/MatMul/ReadVariableOp,^rnn/while/lstm_cell/MatMul_1/ReadVariableOp*
T0*'
_output_shapes
:????????? 2
rnn/while/Identity_4?
rnn/while/Identity_5Identityrnn/while/lstm_cell/add_1:z:0+^rnn/while/lstm_cell/BiasAdd/ReadVariableOp*^rnn/while/lstm_cell/MatMul/ReadVariableOp,^rnn/while/lstm_cell/MatMul_1/ReadVariableOp*
T0*'
_output_shapes
:????????? 2
rnn/while/Identity_5"1
rnn_while_identityrnn/while/Identity:output:0"5
rnn_while_identity_1rnn/while/Identity_1:output:0"5
rnn_while_identity_2rnn/while/Identity_2:output:0"5
rnn_while_identity_3rnn/while/Identity_3:output:0"5
rnn_while_identity_4rnn/while/Identity_4:output:0"5
rnn_while_identity_5rnn/while/Identity_5:output:0"l
3rnn_while_lstm_cell_biasadd_readvariableop_resource5rnn_while_lstm_cell_biasadd_readvariableop_resource_0"n
4rnn_while_lstm_cell_matmul_1_readvariableop_resource6rnn_while_lstm_cell_matmul_1_readvariableop_resource_0"j
2rnn_while_lstm_cell_matmul_readvariableop_resource4rnn_while_lstm_cell_matmul_readvariableop_resource_0"@
rnn_while_rnn_strided_slice_1rnn_while_rnn_strided_slice_1_0"?
Yrnn_while_tensorarrayv2read_tensorlistgetitem_rnn_tensorarrayunstack_tensorlistfromtensor[rnn_while_tensorarrayv2read_tensorlistgetitem_rnn_tensorarrayunstack_tensorlistfromtensor_0*(
_construction_contextkEagerRuntime*K
_input_shapes:
8: : : : :????????? :????????? : : : : : 2X
*rnn/while/lstm_cell/BiasAdd/ReadVariableOp*rnn/while/lstm_cell/BiasAdd/ReadVariableOp2V
)rnn/while/lstm_cell/MatMul/ReadVariableOp)rnn/while/lstm_cell/MatMul/ReadVariableOp2Z
+rnn/while/lstm_cell/MatMul_1/ReadVariableOp+rnn/while/lstm_cell/MatMul_1/ReadVariableOp: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :-)
'
_output_shapes
:????????? :-)
'
_output_shapes
:????????? :

_output_shapes
: :

_output_shapes
: 
?
?
(__inference_lstm_cell_layer_call_fn_9377

inputs
states_0
states_1
unknown:	3?
	unknown_0:	 ?
	unknown_1:	?
identity

identity_1

identity_2??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsstates_0states_1unknown	unknown_0	unknown_1*
Tin

2*
Tout
2*
_collective_manager_ids
 *M
_output_shapes;
9:????????? :????????? :????????? *%
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *L
fGRE
C__inference_lstm_cell_layer_call_and_return_conditional_losses_84292
StatefulPartitionedCall?
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*'
_output_shapes
:????????? 2

Identity?

Identity_1Identity StatefulPartitionedCall:output:1^StatefulPartitionedCall*
T0*'
_output_shapes
:????????? 2

Identity_1?

Identity_2Identity StatefulPartitionedCall:output:2^StatefulPartitionedCall*
T0*'
_output_shapes
:????????? 2

Identity_2"
identityIdentity:output:0"!

identity_1Identity_1:output:0"!

identity_2Identity_2:output:0*(
_construction_contextkEagerRuntime*R
_input_shapesA
?:?????????3:????????? :????????? : : : 22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:?????????3
 
_user_specified_nameinputs:QM
'
_output_shapes
:????????? 
"
_user_specified_name
states/0:QM
'
_output_shapes
:????????? 
"
_user_specified_name
states/1
?
?
(__inference_lstm_cell_layer_call_fn_9394

inputs
states_0
states_1
unknown:	3?
	unknown_0:	 ?
	unknown_1:	?
identity

identity_1

identity_2??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsstates_0states_1unknown	unknown_0	unknown_1*
Tin

2*
Tout
2*
_collective_manager_ids
 *M
_output_shapes;
9:????????? :????????? :????????? *%
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *L
fGRE
C__inference_lstm_cell_layer_call_and_return_conditional_losses_85282
StatefulPartitionedCall?
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*'
_output_shapes
:????????? 2

Identity?

Identity_1Identity StatefulPartitionedCall:output:1^StatefulPartitionedCall*
T0*'
_output_shapes
:????????? 2

Identity_1?

Identity_2Identity StatefulPartitionedCall:output:2^StatefulPartitionedCall*
T0*'
_output_shapes
:????????? 2

Identity_2"
identityIdentity:output:0"!

identity_1Identity_1:output:0"!

identity_2Identity_2:output:0*(
_construction_contextkEagerRuntime*R
_input_shapesA
?:?????????3:????????? :????????? : : : 22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:?????????3
 
_user_specified_nameinputs:QM
'
_output_shapes
:????????? 
"
_user_specified_name
states/0:QM
'
_output_shapes
:????????? 
"
_user_specified_name
states/1
?
?
while_cond_9800
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_placeholder_2
while_placeholder_3
while_less_strided_slice_12
.while_while_cond_9800___redundant_placeholder02
.while_while_cond_9800___redundant_placeholder12
.while_while_cond_9800___redundant_placeholder22
.while_while_cond_9800___redundant_placeholder3
while_identity
p

while/LessLesswhile_placeholderwhile_less_strided_slice_1*
T0*
_output_shapes
: 2

while/Less]
while/IdentityIdentitywhile/Less:z:0*
T0
*
_output_shapes
: 2
while/Identity")
while_identitywhile/Identity:output:0*(
_construction_contextkEagerRuntime*S
_input_shapesB
@: : : : :????????? :????????? : ::::: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :-)
'
_output_shapes
:????????? :-)
'
_output_shapes
:????????? :

_output_shapes
: :

_output_shapes
:
?\
?
>__inference_rnn_layer_call_and_return_conditional_losses_10038

inputs;
(lstm_cell_matmul_readvariableop_resource:	3?=
*lstm_cell_matmul_1_readvariableop_resource:	 ?8
)lstm_cell_biasadd_readvariableop_resource:	?
identity

identity_1

identity_2?? lstm_cell/BiasAdd/ReadVariableOp?lstm_cell/MatMul/ReadVariableOp?!lstm_cell/MatMul_1/ReadVariableOp?whileD
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
strided_slice\
zeros/mul/yConst*
_output_shapes
: *
dtype0*
value	B : 2
zeros/mul/yl
	zeros/mulMulstrided_slice:output:0zeros/mul/y:output:0*
T0*
_output_shapes
: 2
	zeros/mul_
zeros/Less/yConst*
_output_shapes
: *
dtype0*
value
B :?2
zeros/Less/yg

zeros/LessLesszeros/mul:z:0zeros/Less/y:output:0*
T0*
_output_shapes
: 2

zeros/Lessb
zeros/packed/1Const*
_output_shapes
: *
dtype0*
value	B : 2
zeros/packed/1?
zeros/packedPackstrided_slice:output:0zeros/packed/1:output:0*
N*
T0*
_output_shapes
:2
zeros/packed_
zeros/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    2
zeros/Constu
zerosFillzeros/packed:output:0zeros/Const:output:0*
T0*'
_output_shapes
:????????? 2
zeros`
zeros_1/mul/yConst*
_output_shapes
: *
dtype0*
value	B : 2
zeros_1/mul/yr
zeros_1/mulMulstrided_slice:output:0zeros_1/mul/y:output:0*
T0*
_output_shapes
: 2
zeros_1/mulc
zeros_1/Less/yConst*
_output_shapes
: *
dtype0*
value
B :?2
zeros_1/Less/yo
zeros_1/LessLesszeros_1/mul:z:0zeros_1/Less/y:output:0*
T0*
_output_shapes
: 2
zeros_1/Lessf
zeros_1/packed/1Const*
_output_shapes
: *
dtype0*
value	B : 2
zeros_1/packed/1?
zeros_1/packedPackstrided_slice:output:0zeros_1/packed/1:output:0*
N*
T0*
_output_shapes
:2
zeros_1/packedc
zeros_1/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    2
zeros_1/Const}
zeros_1Fillzeros_1/packed:output:0zeros_1/Const:output:0*
T0*'
_output_shapes
:????????? 2	
zeros_1u
transpose/permConst*
_output_shapes
:*
dtype0*!
valueB"          2
transpose/perm?
	transpose	Transposeinputstranspose/perm:output:0*
T0*4
_output_shapes"
 :??????????????????32
	transposeO
Shape_1Shapetranspose:y:0*
T0*
_output_shapes
:2	
Shape_1x
strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice_1/stack|
strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_1/stack_1|
strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_1/stack_2?
strided_slice_1StridedSliceShape_1:output:0strided_slice_1/stack:output:0 strided_slice_1/stack_1:output:0 strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
strided_slice_1?
TensorArrayV2/element_shapeConst*
_output_shapes
: *
dtype0*
valueB :
?????????2
TensorArrayV2/element_shape?
TensorArrayV2TensorListReserve$TensorArrayV2/element_shape:output:0strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type02
TensorArrayV2?
5TensorArrayUnstack/TensorListFromTensor/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????3   27
5TensorArrayUnstack/TensorListFromTensor/element_shape?
'TensorArrayUnstack/TensorListFromTensorTensorListFromTensortranspose:y:0>TensorArrayUnstack/TensorListFromTensor/element_shape:output:0*
_output_shapes
: *
element_dtype0*

shape_type02)
'TensorArrayUnstack/TensorListFromTensorx
strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice_2/stack|
strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_2/stack_1|
strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_2/stack_2?
strided_slice_2StridedSlicetranspose:y:0strided_slice_2/stack:output:0 strided_slice_2/stack_1:output:0 strided_slice_2/stack_2:output:0*
Index0*
T0*'
_output_shapes
:?????????3*
shrink_axis_mask2
strided_slice_2?
lstm_cell/MatMul/ReadVariableOpReadVariableOp(lstm_cell_matmul_readvariableop_resource*
_output_shapes
:	3?*
dtype02!
lstm_cell/MatMul/ReadVariableOp?
lstm_cell/MatMulMatMulstrided_slice_2:output:0'lstm_cell/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????2
lstm_cell/MatMul?
!lstm_cell/MatMul_1/ReadVariableOpReadVariableOp*lstm_cell_matmul_1_readvariableop_resource*
_output_shapes
:	 ?*
dtype02#
!lstm_cell/MatMul_1/ReadVariableOp?
lstm_cell/MatMul_1MatMulzeros:output:0)lstm_cell/MatMul_1/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????2
lstm_cell/MatMul_1?
lstm_cell/addAddV2lstm_cell/MatMul:product:0lstm_cell/MatMul_1:product:0*
T0*(
_output_shapes
:??????????2
lstm_cell/add?
 lstm_cell/BiasAdd/ReadVariableOpReadVariableOp)lstm_cell_biasadd_readvariableop_resource*
_output_shapes	
:?*
dtype02"
 lstm_cell/BiasAdd/ReadVariableOp?
lstm_cell/BiasAddBiasAddlstm_cell/add:z:0(lstm_cell/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????2
lstm_cell/BiasAddx
lstm_cell/split/split_dimConst*
_output_shapes
: *
dtype0*
value	B :2
lstm_cell/split/split_dim?
lstm_cell/splitSplit"lstm_cell/split/split_dim:output:0lstm_cell/BiasAdd:output:0*
T0*`
_output_shapesN
L:????????? :????????? :????????? :????????? *
	num_split2
lstm_cell/split}
lstm_cell/SigmoidSigmoidlstm_cell/split:output:0*
T0*'
_output_shapes
:????????? 2
lstm_cell/Sigmoid?
lstm_cell/Sigmoid_1Sigmoidlstm_cell/split:output:1*
T0*'
_output_shapes
:????????? 2
lstm_cell/Sigmoid_1?
lstm_cell/mulMullstm_cell/Sigmoid_1:y:0zeros_1:output:0*
T0*'
_output_shapes
:????????? 2
lstm_cell/mult
lstm_cell/TanhTanhlstm_cell/split:output:2*
T0*'
_output_shapes
:????????? 2
lstm_cell/Tanh?
lstm_cell/mul_1Mullstm_cell/Sigmoid:y:0lstm_cell/Tanh:y:0*
T0*'
_output_shapes
:????????? 2
lstm_cell/mul_1?
lstm_cell/add_1AddV2lstm_cell/mul:z:0lstm_cell/mul_1:z:0*
T0*'
_output_shapes
:????????? 2
lstm_cell/add_1?
lstm_cell/Sigmoid_2Sigmoidlstm_cell/split:output:3*
T0*'
_output_shapes
:????????? 2
lstm_cell/Sigmoid_2s
lstm_cell/Tanh_1Tanhlstm_cell/add_1:z:0*
T0*'
_output_shapes
:????????? 2
lstm_cell/Tanh_1?
lstm_cell/mul_2Mullstm_cell/Sigmoid_2:y:0lstm_cell/Tanh_1:y:0*
T0*'
_output_shapes
:????????? 2
lstm_cell/mul_2?
TensorArrayV2_1/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????    2
TensorArrayV2_1/element_shape?
TensorArrayV2_1TensorListReserve&TensorArrayV2_1/element_shape:output:0strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type02
TensorArrayV2_1N
timeConst*
_output_shapes
: *
dtype0*
value	B : 2
time
while/maximum_iterationsConst*
_output_shapes
: *
dtype0*
valueB :
?????????2
while/maximum_iterationsj
while/loop_counterConst*
_output_shapes
: *
dtype0*
value	B : 2
while/loop_counter?
whileWhilewhile/loop_counter:output:0!while/maximum_iterations:output:0time:output:0TensorArrayV2_1:handle:0zeros:output:0zeros_1:output:0strided_slice_1:output:07TensorArrayUnstack/TensorListFromTensor:output_handle:0(lstm_cell_matmul_readvariableop_resource*lstm_cell_matmul_1_readvariableop_resource)lstm_cell_biasadd_readvariableop_resource*
T
2*
_lower_using_switch_merge(*
_num_original_outputs*L
_output_shapes:
8: : : : :????????? :????????? : : : : : *%
_read_only_resource_inputs
	
*
bodyR
while_body_9953*
condR
while_cond_9952*K
output_shapes:
8: : : : :????????? :????????? : : : : : *
parallel_iterations 2
while?
0TensorArrayV2Stack/TensorListStack/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????    22
0TensorArrayV2Stack/TensorListStack/element_shape?
"TensorArrayV2Stack/TensorListStackTensorListStackwhile:output:39TensorArrayV2Stack/TensorListStack/element_shape:output:0*4
_output_shapes"
 :?????????????????? *
element_dtype02$
"TensorArrayV2Stack/TensorListStack?
strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB:
?????????2
strided_slice_3/stack|
strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice_3/stack_1|
strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_3/stack_2?
strided_slice_3StridedSlice+TensorArrayV2Stack/TensorListStack:tensor:0strided_slice_3/stack:output:0 strided_slice_3/stack_1:output:0 strided_slice_3/stack_2:output:0*
Index0*
T0*'
_output_shapes
:????????? *
shrink_axis_mask2
strided_slice_3y
transpose_1/permConst*
_output_shapes
:*
dtype0*!
valueB"          2
transpose_1/perm?
transpose_1	Transpose+TensorArrayV2Stack/TensorListStack:tensor:0transpose_1/perm:output:0*
T0*4
_output_shapes"
 :?????????????????? 2
transpose_1?
IdentityIdentitystrided_slice_3:output:0!^lstm_cell/BiasAdd/ReadVariableOp ^lstm_cell/MatMul/ReadVariableOp"^lstm_cell/MatMul_1/ReadVariableOp^while*
T0*'
_output_shapes
:????????? 2

Identity?

Identity_1Identitywhile:output:4!^lstm_cell/BiasAdd/ReadVariableOp ^lstm_cell/MatMul/ReadVariableOp"^lstm_cell/MatMul_1/ReadVariableOp^while*
T0*'
_output_shapes
:????????? 2

Identity_1?

Identity_2Identitywhile:output:5!^lstm_cell/BiasAdd/ReadVariableOp ^lstm_cell/MatMul/ReadVariableOp"^lstm_cell/MatMul_1/ReadVariableOp^while*
T0*'
_output_shapes
:????????? 2

Identity_2"
identityIdentity:output:0"!

identity_1Identity_1:output:0"!

identity_2Identity_2:output:0*(
_construction_contextkEagerRuntime*9
_input_shapes(
&:??????????????????3: : : 2D
 lstm_cell/BiasAdd/ReadVariableOp lstm_cell/BiasAdd/ReadVariableOp2B
lstm_cell/MatMul/ReadVariableOplstm_cell/MatMul/ReadVariableOp2F
!lstm_cell/MatMul_1/ReadVariableOp!lstm_cell/MatMul_1/ReadVariableOp2
whilewhile:\ X
4
_output_shapes"
 :??????????????????3
 
_user_specified_nameinputs
?
?
while_cond_8301
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_placeholder_2
while_placeholder_3
while_less_strided_slice_12
.while_while_cond_8301___redundant_placeholder02
.while_while_cond_8301___redundant_placeholder12
.while_while_cond_8301___redundant_placeholder22
.while_while_cond_8301___redundant_placeholder3
while_identity
p

while/LessLesswhile_placeholderwhile_less_strided_slice_1*
T0*
_output_shapes
: 2

while/Less]
while/IdentityIdentitywhile/Less:z:0*
T0
*
_output_shapes
: 2
while/Identity")
while_identitywhile/Identity:output:0*(
_construction_contextkEagerRuntime*S
_input_shapesB
@: : : : :????????? :????????? : ::::: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :-)
'
_output_shapes
:????????? :-)
'
_output_shapes
:????????? :

_output_shapes
: :

_output_shapes
:
?@
?
while_body_9649
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_placeholder_2
while_placeholder_3
while_strided_slice_1_0W
Swhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0C
0while_lstm_cell_matmul_readvariableop_resource_0:	3?E
2while_lstm_cell_matmul_1_readvariableop_resource_0:	 ?@
1while_lstm_cell_biasadd_readvariableop_resource_0:	?
while_identity
while_identity_1
while_identity_2
while_identity_3
while_identity_4
while_identity_5
while_strided_slice_1U
Qwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensorA
.while_lstm_cell_matmul_readvariableop_resource:	3?C
0while_lstm_cell_matmul_1_readvariableop_resource:	 ?>
/while_lstm_cell_biasadd_readvariableop_resource:	???&while/lstm_cell/BiasAdd/ReadVariableOp?%while/lstm_cell/MatMul/ReadVariableOp?'while/lstm_cell/MatMul_1/ReadVariableOp?
7while/TensorArrayV2Read/TensorListGetItem/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????3   29
7while/TensorArrayV2Read/TensorListGetItem/element_shape?
)while/TensorArrayV2Read/TensorListGetItemTensorListGetItemSwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0while_placeholder@while/TensorArrayV2Read/TensorListGetItem/element_shape:output:0*'
_output_shapes
:?????????3*
element_dtype02+
)while/TensorArrayV2Read/TensorListGetItem?
%while/lstm_cell/MatMul/ReadVariableOpReadVariableOp0while_lstm_cell_matmul_readvariableop_resource_0*
_output_shapes
:	3?*
dtype02'
%while/lstm_cell/MatMul/ReadVariableOp?
while/lstm_cell/MatMulMatMul0while/TensorArrayV2Read/TensorListGetItem:item:0-while/lstm_cell/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????2
while/lstm_cell/MatMul?
'while/lstm_cell/MatMul_1/ReadVariableOpReadVariableOp2while_lstm_cell_matmul_1_readvariableop_resource_0*
_output_shapes
:	 ?*
dtype02)
'while/lstm_cell/MatMul_1/ReadVariableOp?
while/lstm_cell/MatMul_1MatMulwhile_placeholder_2/while/lstm_cell/MatMul_1/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????2
while/lstm_cell/MatMul_1?
while/lstm_cell/addAddV2 while/lstm_cell/MatMul:product:0"while/lstm_cell/MatMul_1:product:0*
T0*(
_output_shapes
:??????????2
while/lstm_cell/add?
&while/lstm_cell/BiasAdd/ReadVariableOpReadVariableOp1while_lstm_cell_biasadd_readvariableop_resource_0*
_output_shapes	
:?*
dtype02(
&while/lstm_cell/BiasAdd/ReadVariableOp?
while/lstm_cell/BiasAddBiasAddwhile/lstm_cell/add:z:0.while/lstm_cell/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????2
while/lstm_cell/BiasAdd?
while/lstm_cell/split/split_dimConst*
_output_shapes
: *
dtype0*
value	B :2!
while/lstm_cell/split/split_dim?
while/lstm_cell/splitSplit(while/lstm_cell/split/split_dim:output:0 while/lstm_cell/BiasAdd:output:0*
T0*`
_output_shapesN
L:????????? :????????? :????????? :????????? *
	num_split2
while/lstm_cell/split?
while/lstm_cell/SigmoidSigmoidwhile/lstm_cell/split:output:0*
T0*'
_output_shapes
:????????? 2
while/lstm_cell/Sigmoid?
while/lstm_cell/Sigmoid_1Sigmoidwhile/lstm_cell/split:output:1*
T0*'
_output_shapes
:????????? 2
while/lstm_cell/Sigmoid_1?
while/lstm_cell/mulMulwhile/lstm_cell/Sigmoid_1:y:0while_placeholder_3*
T0*'
_output_shapes
:????????? 2
while/lstm_cell/mul?
while/lstm_cell/TanhTanhwhile/lstm_cell/split:output:2*
T0*'
_output_shapes
:????????? 2
while/lstm_cell/Tanh?
while/lstm_cell/mul_1Mulwhile/lstm_cell/Sigmoid:y:0while/lstm_cell/Tanh:y:0*
T0*'
_output_shapes
:????????? 2
while/lstm_cell/mul_1?
while/lstm_cell/add_1AddV2while/lstm_cell/mul:z:0while/lstm_cell/mul_1:z:0*
T0*'
_output_shapes
:????????? 2
while/lstm_cell/add_1?
while/lstm_cell/Sigmoid_2Sigmoidwhile/lstm_cell/split:output:3*
T0*'
_output_shapes
:????????? 2
while/lstm_cell/Sigmoid_2?
while/lstm_cell/Tanh_1Tanhwhile/lstm_cell/add_1:z:0*
T0*'
_output_shapes
:????????? 2
while/lstm_cell/Tanh_1?
while/lstm_cell/mul_2Mulwhile/lstm_cell/Sigmoid_2:y:0while/lstm_cell/Tanh_1:y:0*
T0*'
_output_shapes
:????????? 2
while/lstm_cell/mul_2?
*while/TensorArrayV2Write/TensorListSetItemTensorListSetItemwhile_placeholder_1while_placeholderwhile/lstm_cell/mul_2:z:0*
_output_shapes
: *
element_dtype02,
*while/TensorArrayV2Write/TensorListSetItem\
while/add/yConst*
_output_shapes
: *
dtype0*
value	B :2
while/add/yi
	while/addAddV2while_placeholderwhile/add/y:output:0*
T0*
_output_shapes
: 2
	while/add`
while/add_1/yConst*
_output_shapes
: *
dtype0*
value	B :2
while/add_1/yv
while/add_1AddV2while_while_loop_counterwhile/add_1/y:output:0*
T0*
_output_shapes
: 2
while/add_1?
while/IdentityIdentitywhile/add_1:z:0'^while/lstm_cell/BiasAdd/ReadVariableOp&^while/lstm_cell/MatMul/ReadVariableOp(^while/lstm_cell/MatMul_1/ReadVariableOp*
T0*
_output_shapes
: 2
while/Identity?
while/Identity_1Identitywhile_while_maximum_iterations'^while/lstm_cell/BiasAdd/ReadVariableOp&^while/lstm_cell/MatMul/ReadVariableOp(^while/lstm_cell/MatMul_1/ReadVariableOp*
T0*
_output_shapes
: 2
while/Identity_1?
while/Identity_2Identitywhile/add:z:0'^while/lstm_cell/BiasAdd/ReadVariableOp&^while/lstm_cell/MatMul/ReadVariableOp(^while/lstm_cell/MatMul_1/ReadVariableOp*
T0*
_output_shapes
: 2
while/Identity_2?
while/Identity_3Identity:while/TensorArrayV2Write/TensorListSetItem:output_handle:0'^while/lstm_cell/BiasAdd/ReadVariableOp&^while/lstm_cell/MatMul/ReadVariableOp(^while/lstm_cell/MatMul_1/ReadVariableOp*
T0*
_output_shapes
: 2
while/Identity_3?
while/Identity_4Identitywhile/lstm_cell/mul_2:z:0'^while/lstm_cell/BiasAdd/ReadVariableOp&^while/lstm_cell/MatMul/ReadVariableOp(^while/lstm_cell/MatMul_1/ReadVariableOp*
T0*'
_output_shapes
:????????? 2
while/Identity_4?
while/Identity_5Identitywhile/lstm_cell/add_1:z:0'^while/lstm_cell/BiasAdd/ReadVariableOp&^while/lstm_cell/MatMul/ReadVariableOp(^while/lstm_cell/MatMul_1/ReadVariableOp*
T0*'
_output_shapes
:????????? 2
while/Identity_5")
while_identitywhile/Identity:output:0"-
while_identity_1while/Identity_1:output:0"-
while_identity_2while/Identity_2:output:0"-
while_identity_3while/Identity_3:output:0"-
while_identity_4while/Identity_4:output:0"-
while_identity_5while/Identity_5:output:0"d
/while_lstm_cell_biasadd_readvariableop_resource1while_lstm_cell_biasadd_readvariableop_resource_0"f
0while_lstm_cell_matmul_1_readvariableop_resource2while_lstm_cell_matmul_1_readvariableop_resource_0"b
.while_lstm_cell_matmul_readvariableop_resource0while_lstm_cell_matmul_readvariableop_resource_0"0
while_strided_slice_1while_strided_slice_1_0"?
Qwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensorSwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0*(
_construction_contextkEagerRuntime*K
_input_shapes:
8: : : : :????????? :????????? : : : : : 2P
&while/lstm_cell/BiasAdd/ReadVariableOp&while/lstm_cell/BiasAdd/ReadVariableOp2N
%while/lstm_cell/MatMul/ReadVariableOp%while/lstm_cell/MatMul/ReadVariableOp2R
'while/lstm_cell/MatMul_1/ReadVariableOp'while/lstm_cell/MatMul_1/ReadVariableOp: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :-)
'
_output_shapes
:????????? :-)
'
_output_shapes
:????????? :

_output_shapes
: :

_output_shapes
: 
?%
?
while_body_8610
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_placeholder_2
while_placeholder_3
while_strided_slice_1_0W
Swhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0)
while_lstm_cell_8634_0:	3?)
while_lstm_cell_8636_0:	 ?%
while_lstm_cell_8638_0:	?
while_identity
while_identity_1
while_identity_2
while_identity_3
while_identity_4
while_identity_5
while_strided_slice_1U
Qwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor'
while_lstm_cell_8634:	3?'
while_lstm_cell_8636:	 ?#
while_lstm_cell_8638:	???'while/lstm_cell/StatefulPartitionedCall?
7while/TensorArrayV2Read/TensorListGetItem/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????3   29
7while/TensorArrayV2Read/TensorListGetItem/element_shape?
)while/TensorArrayV2Read/TensorListGetItemTensorListGetItemSwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0while_placeholder@while/TensorArrayV2Read/TensorListGetItem/element_shape:output:0*'
_output_shapes
:?????????3*
element_dtype02+
)while/TensorArrayV2Read/TensorListGetItem?
'while/lstm_cell/StatefulPartitionedCallStatefulPartitionedCall0while/TensorArrayV2Read/TensorListGetItem:item:0while_placeholder_2while_placeholder_3while_lstm_cell_8634_0while_lstm_cell_8636_0while_lstm_cell_8638_0*
Tin

2*
Tout
2*
_collective_manager_ids
 *M
_output_shapes;
9:????????? :????????? :????????? *%
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *L
fGRE
C__inference_lstm_cell_layer_call_and_return_conditional_losses_78202)
'while/lstm_cell/StatefulPartitionedCall?
*while/TensorArrayV2Write/TensorListSetItemTensorListSetItemwhile_placeholder_1while_placeholder0while/lstm_cell/StatefulPartitionedCall:output:0*
_output_shapes
: *
element_dtype02,
*while/TensorArrayV2Write/TensorListSetItem\
while/add/yConst*
_output_shapes
: *
dtype0*
value	B :2
while/add/yi
	while/addAddV2while_placeholderwhile/add/y:output:0*
T0*
_output_shapes
: 2
	while/add`
while/add_1/yConst*
_output_shapes
: *
dtype0*
value	B :2
while/add_1/yv
while/add_1AddV2while_while_loop_counterwhile/add_1/y:output:0*
T0*
_output_shapes
: 2
while/add_1?
while/IdentityIdentitywhile/add_1:z:0(^while/lstm_cell/StatefulPartitionedCall*
T0*
_output_shapes
: 2
while/Identity?
while/Identity_1Identitywhile_while_maximum_iterations(^while/lstm_cell/StatefulPartitionedCall*
T0*
_output_shapes
: 2
while/Identity_1?
while/Identity_2Identitywhile/add:z:0(^while/lstm_cell/StatefulPartitionedCall*
T0*
_output_shapes
: 2
while/Identity_2?
while/Identity_3Identity:while/TensorArrayV2Write/TensorListSetItem:output_handle:0(^while/lstm_cell/StatefulPartitionedCall*
T0*
_output_shapes
: 2
while/Identity_3?
while/Identity_4Identity0while/lstm_cell/StatefulPartitionedCall:output:1(^while/lstm_cell/StatefulPartitionedCall*
T0*'
_output_shapes
:????????? 2
while/Identity_4?
while/Identity_5Identity0while/lstm_cell/StatefulPartitionedCall:output:2(^while/lstm_cell/StatefulPartitionedCall*
T0*'
_output_shapes
:????????? 2
while/Identity_5")
while_identitywhile/Identity:output:0"-
while_identity_1while/Identity_1:output:0"-
while_identity_2while/Identity_2:output:0"-
while_identity_3while/Identity_3:output:0"-
while_identity_4while/Identity_4:output:0"-
while_identity_5while/Identity_5:output:0".
while_lstm_cell_8634while_lstm_cell_8634_0".
while_lstm_cell_8636while_lstm_cell_8636_0".
while_lstm_cell_8638while_lstm_cell_8638_0"0
while_strided_slice_1while_strided_slice_1_0"?
Qwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensorSwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0*(
_construction_contextkEagerRuntime*K
_input_shapes:
8: : : : :????????? :????????? : : : : : 2R
'while/lstm_cell/StatefulPartitionedCall'while/lstm_cell/StatefulPartitionedCall: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :-)
'
_output_shapes
:????????? :-)
'
_output_shapes
:????????? :

_output_shapes
: :

_output_shapes
: 
?%
?
while_body_7683
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_placeholder_2
while_placeholder_3
while_strided_slice_1_0W
Swhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0)
while_lstm_cell_7707_0:	3?)
while_lstm_cell_7709_0:	 ?%
while_lstm_cell_7711_0:	?
while_identity
while_identity_1
while_identity_2
while_identity_3
while_identity_4
while_identity_5
while_strided_slice_1U
Qwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor'
while_lstm_cell_7707:	3?'
while_lstm_cell_7709:	 ?#
while_lstm_cell_7711:	???'while/lstm_cell/StatefulPartitionedCall?
7while/TensorArrayV2Read/TensorListGetItem/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????3   29
7while/TensorArrayV2Read/TensorListGetItem/element_shape?
)while/TensorArrayV2Read/TensorListGetItemTensorListGetItemSwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0while_placeholder@while/TensorArrayV2Read/TensorListGetItem/element_shape:output:0*'
_output_shapes
:?????????3*
element_dtype02+
)while/TensorArrayV2Read/TensorListGetItem?
'while/lstm_cell/StatefulPartitionedCallStatefulPartitionedCall0while/TensorArrayV2Read/TensorListGetItem:item:0while_placeholder_2while_placeholder_3while_lstm_cell_7707_0while_lstm_cell_7709_0while_lstm_cell_7711_0*
Tin

2*
Tout
2*
_collective_manager_ids
 *M
_output_shapes;
9:????????? :????????? :????????? *%
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *L
fGRE
C__inference_lstm_cell_layer_call_and_return_conditional_losses_76692)
'while/lstm_cell/StatefulPartitionedCall?
*while/TensorArrayV2Write/TensorListSetItemTensorListSetItemwhile_placeholder_1while_placeholder0while/lstm_cell/StatefulPartitionedCall:output:0*
_output_shapes
: *
element_dtype02,
*while/TensorArrayV2Write/TensorListSetItem\
while/add/yConst*
_output_shapes
: *
dtype0*
value	B :2
while/add/yi
	while/addAddV2while_placeholderwhile/add/y:output:0*
T0*
_output_shapes
: 2
	while/add`
while/add_1/yConst*
_output_shapes
: *
dtype0*
value	B :2
while/add_1/yv
while/add_1AddV2while_while_loop_counterwhile/add_1/y:output:0*
T0*
_output_shapes
: 2
while/add_1?
while/IdentityIdentitywhile/add_1:z:0(^while/lstm_cell/StatefulPartitionedCall*
T0*
_output_shapes
: 2
while/Identity?
while/Identity_1Identitywhile_while_maximum_iterations(^while/lstm_cell/StatefulPartitionedCall*
T0*
_output_shapes
: 2
while/Identity_1?
while/Identity_2Identitywhile/add:z:0(^while/lstm_cell/StatefulPartitionedCall*
T0*
_output_shapes
: 2
while/Identity_2?
while/Identity_3Identity:while/TensorArrayV2Write/TensorListSetItem:output_handle:0(^while/lstm_cell/StatefulPartitionedCall*
T0*
_output_shapes
: 2
while/Identity_3?
while/Identity_4Identity0while/lstm_cell/StatefulPartitionedCall:output:1(^while/lstm_cell/StatefulPartitionedCall*
T0*'
_output_shapes
:????????? 2
while/Identity_4?
while/Identity_5Identity0while/lstm_cell/StatefulPartitionedCall:output:2(^while/lstm_cell/StatefulPartitionedCall*
T0*'
_output_shapes
:????????? 2
while/Identity_5")
while_identitywhile/Identity:output:0"-
while_identity_1while/Identity_1:output:0"-
while_identity_2while/Identity_2:output:0"-
while_identity_3while/Identity_3:output:0"-
while_identity_4while/Identity_4:output:0"-
while_identity_5while/Identity_5:output:0".
while_lstm_cell_7707while_lstm_cell_7707_0".
while_lstm_cell_7709while_lstm_cell_7709_0".
while_lstm_cell_7711while_lstm_cell_7711_0"0
while_strided_slice_1while_strided_slice_1_0"?
Qwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensorSwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0*(
_construction_contextkEagerRuntime*K
_input_shapes:
8: : : : :????????? :????????? : : : : : 2R
'while/lstm_cell/StatefulPartitionedCall'while/lstm_cell/StatefulPartitionedCall: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :-)
'
_output_shapes
:????????? :-)
'
_output_shapes
:????????? :

_output_shapes
: :

_output_shapes
: 
?@
?
while_body_10105
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_placeholder_2
while_placeholder_3
while_strided_slice_1_0W
Swhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0C
0while_lstm_cell_matmul_readvariableop_resource_0:	3?E
2while_lstm_cell_matmul_1_readvariableop_resource_0:	 ?@
1while_lstm_cell_biasadd_readvariableop_resource_0:	?
while_identity
while_identity_1
while_identity_2
while_identity_3
while_identity_4
while_identity_5
while_strided_slice_1U
Qwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensorA
.while_lstm_cell_matmul_readvariableop_resource:	3?C
0while_lstm_cell_matmul_1_readvariableop_resource:	 ?>
/while_lstm_cell_biasadd_readvariableop_resource:	???&while/lstm_cell/BiasAdd/ReadVariableOp?%while/lstm_cell/MatMul/ReadVariableOp?'while/lstm_cell/MatMul_1/ReadVariableOp?
7while/TensorArrayV2Read/TensorListGetItem/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????3   29
7while/TensorArrayV2Read/TensorListGetItem/element_shape?
)while/TensorArrayV2Read/TensorListGetItemTensorListGetItemSwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0while_placeholder@while/TensorArrayV2Read/TensorListGetItem/element_shape:output:0*'
_output_shapes
:?????????3*
element_dtype02+
)while/TensorArrayV2Read/TensorListGetItem?
%while/lstm_cell/MatMul/ReadVariableOpReadVariableOp0while_lstm_cell_matmul_readvariableop_resource_0*
_output_shapes
:	3?*
dtype02'
%while/lstm_cell/MatMul/ReadVariableOp?
while/lstm_cell/MatMulMatMul0while/TensorArrayV2Read/TensorListGetItem:item:0-while/lstm_cell/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????2
while/lstm_cell/MatMul?
'while/lstm_cell/MatMul_1/ReadVariableOpReadVariableOp2while_lstm_cell_matmul_1_readvariableop_resource_0*
_output_shapes
:	 ?*
dtype02)
'while/lstm_cell/MatMul_1/ReadVariableOp?
while/lstm_cell/MatMul_1MatMulwhile_placeholder_2/while/lstm_cell/MatMul_1/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????2
while/lstm_cell/MatMul_1?
while/lstm_cell/addAddV2 while/lstm_cell/MatMul:product:0"while/lstm_cell/MatMul_1:product:0*
T0*(
_output_shapes
:??????????2
while/lstm_cell/add?
&while/lstm_cell/BiasAdd/ReadVariableOpReadVariableOp1while_lstm_cell_biasadd_readvariableop_resource_0*
_output_shapes	
:?*
dtype02(
&while/lstm_cell/BiasAdd/ReadVariableOp?
while/lstm_cell/BiasAddBiasAddwhile/lstm_cell/add:z:0.while/lstm_cell/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????2
while/lstm_cell/BiasAdd?
while/lstm_cell/split/split_dimConst*
_output_shapes
: *
dtype0*
value	B :2!
while/lstm_cell/split/split_dim?
while/lstm_cell/splitSplit(while/lstm_cell/split/split_dim:output:0 while/lstm_cell/BiasAdd:output:0*
T0*`
_output_shapesN
L:????????? :????????? :????????? :????????? *
	num_split2
while/lstm_cell/split?
while/lstm_cell/SigmoidSigmoidwhile/lstm_cell/split:output:0*
T0*'
_output_shapes
:????????? 2
while/lstm_cell/Sigmoid?
while/lstm_cell/Sigmoid_1Sigmoidwhile/lstm_cell/split:output:1*
T0*'
_output_shapes
:????????? 2
while/lstm_cell/Sigmoid_1?
while/lstm_cell/mulMulwhile/lstm_cell/Sigmoid_1:y:0while_placeholder_3*
T0*'
_output_shapes
:????????? 2
while/lstm_cell/mul?
while/lstm_cell/TanhTanhwhile/lstm_cell/split:output:2*
T0*'
_output_shapes
:????????? 2
while/lstm_cell/Tanh?
while/lstm_cell/mul_1Mulwhile/lstm_cell/Sigmoid:y:0while/lstm_cell/Tanh:y:0*
T0*'
_output_shapes
:????????? 2
while/lstm_cell/mul_1?
while/lstm_cell/add_1AddV2while/lstm_cell/mul:z:0while/lstm_cell/mul_1:z:0*
T0*'
_output_shapes
:????????? 2
while/lstm_cell/add_1?
while/lstm_cell/Sigmoid_2Sigmoidwhile/lstm_cell/split:output:3*
T0*'
_output_shapes
:????????? 2
while/lstm_cell/Sigmoid_2?
while/lstm_cell/Tanh_1Tanhwhile/lstm_cell/add_1:z:0*
T0*'
_output_shapes
:????????? 2
while/lstm_cell/Tanh_1?
while/lstm_cell/mul_2Mulwhile/lstm_cell/Sigmoid_2:y:0while/lstm_cell/Tanh_1:y:0*
T0*'
_output_shapes
:????????? 2
while/lstm_cell/mul_2?
*while/TensorArrayV2Write/TensorListSetItemTensorListSetItemwhile_placeholder_1while_placeholderwhile/lstm_cell/mul_2:z:0*
_output_shapes
: *
element_dtype02,
*while/TensorArrayV2Write/TensorListSetItem\
while/add/yConst*
_output_shapes
: *
dtype0*
value	B :2
while/add/yi
	while/addAddV2while_placeholderwhile/add/y:output:0*
T0*
_output_shapes
: 2
	while/add`
while/add_1/yConst*
_output_shapes
: *
dtype0*
value	B :2
while/add_1/yv
while/add_1AddV2while_while_loop_counterwhile/add_1/y:output:0*
T0*
_output_shapes
: 2
while/add_1?
while/IdentityIdentitywhile/add_1:z:0'^while/lstm_cell/BiasAdd/ReadVariableOp&^while/lstm_cell/MatMul/ReadVariableOp(^while/lstm_cell/MatMul_1/ReadVariableOp*
T0*
_output_shapes
: 2
while/Identity?
while/Identity_1Identitywhile_while_maximum_iterations'^while/lstm_cell/BiasAdd/ReadVariableOp&^while/lstm_cell/MatMul/ReadVariableOp(^while/lstm_cell/MatMul_1/ReadVariableOp*
T0*
_output_shapes
: 2
while/Identity_1?
while/Identity_2Identitywhile/add:z:0'^while/lstm_cell/BiasAdd/ReadVariableOp&^while/lstm_cell/MatMul/ReadVariableOp(^while/lstm_cell/MatMul_1/ReadVariableOp*
T0*
_output_shapes
: 2
while/Identity_2?
while/Identity_3Identity:while/TensorArrayV2Write/TensorListSetItem:output_handle:0'^while/lstm_cell/BiasAdd/ReadVariableOp&^while/lstm_cell/MatMul/ReadVariableOp(^while/lstm_cell/MatMul_1/ReadVariableOp*
T0*
_output_shapes
: 2
while/Identity_3?
while/Identity_4Identitywhile/lstm_cell/mul_2:z:0'^while/lstm_cell/BiasAdd/ReadVariableOp&^while/lstm_cell/MatMul/ReadVariableOp(^while/lstm_cell/MatMul_1/ReadVariableOp*
T0*'
_output_shapes
:????????? 2
while/Identity_4?
while/Identity_5Identitywhile/lstm_cell/add_1:z:0'^while/lstm_cell/BiasAdd/ReadVariableOp&^while/lstm_cell/MatMul/ReadVariableOp(^while/lstm_cell/MatMul_1/ReadVariableOp*
T0*'
_output_shapes
:????????? 2
while/Identity_5")
while_identitywhile/Identity:output:0"-
while_identity_1while/Identity_1:output:0"-
while_identity_2while/Identity_2:output:0"-
while_identity_3while/Identity_3:output:0"-
while_identity_4while/Identity_4:output:0"-
while_identity_5while/Identity_5:output:0"d
/while_lstm_cell_biasadd_readvariableop_resource1while_lstm_cell_biasadd_readvariableop_resource_0"f
0while_lstm_cell_matmul_1_readvariableop_resource2while_lstm_cell_matmul_1_readvariableop_resource_0"b
.while_lstm_cell_matmul_readvariableop_resource0while_lstm_cell_matmul_readvariableop_resource_0"0
while_strided_slice_1while_strided_slice_1_0"?
Qwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensorSwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0*(
_construction_contextkEagerRuntime*K
_input_shapes:
8: : : : :????????? :????????? : : : : : 2P
&while/lstm_cell/BiasAdd/ReadVariableOp&while/lstm_cell/BiasAdd/ReadVariableOp2N
%while/lstm_cell/MatMul/ReadVariableOp%while/lstm_cell/MatMul/ReadVariableOp2R
'while/lstm_cell/MatMul_1/ReadVariableOp'while/lstm_cell/MatMul_1/ReadVariableOp: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :-)
'
_output_shapes
:????????? :-)
'
_output_shapes
:????????? :

_output_shapes
: :

_output_shapes
: 
?@
?
while_body_9953
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_placeholder_2
while_placeholder_3
while_strided_slice_1_0W
Swhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0C
0while_lstm_cell_matmul_readvariableop_resource_0:	3?E
2while_lstm_cell_matmul_1_readvariableop_resource_0:	 ?@
1while_lstm_cell_biasadd_readvariableop_resource_0:	?
while_identity
while_identity_1
while_identity_2
while_identity_3
while_identity_4
while_identity_5
while_strided_slice_1U
Qwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensorA
.while_lstm_cell_matmul_readvariableop_resource:	3?C
0while_lstm_cell_matmul_1_readvariableop_resource:	 ?>
/while_lstm_cell_biasadd_readvariableop_resource:	???&while/lstm_cell/BiasAdd/ReadVariableOp?%while/lstm_cell/MatMul/ReadVariableOp?'while/lstm_cell/MatMul_1/ReadVariableOp?
7while/TensorArrayV2Read/TensorListGetItem/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????3   29
7while/TensorArrayV2Read/TensorListGetItem/element_shape?
)while/TensorArrayV2Read/TensorListGetItemTensorListGetItemSwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0while_placeholder@while/TensorArrayV2Read/TensorListGetItem/element_shape:output:0*'
_output_shapes
:?????????3*
element_dtype02+
)while/TensorArrayV2Read/TensorListGetItem?
%while/lstm_cell/MatMul/ReadVariableOpReadVariableOp0while_lstm_cell_matmul_readvariableop_resource_0*
_output_shapes
:	3?*
dtype02'
%while/lstm_cell/MatMul/ReadVariableOp?
while/lstm_cell/MatMulMatMul0while/TensorArrayV2Read/TensorListGetItem:item:0-while/lstm_cell/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????2
while/lstm_cell/MatMul?
'while/lstm_cell/MatMul_1/ReadVariableOpReadVariableOp2while_lstm_cell_matmul_1_readvariableop_resource_0*
_output_shapes
:	 ?*
dtype02)
'while/lstm_cell/MatMul_1/ReadVariableOp?
while/lstm_cell/MatMul_1MatMulwhile_placeholder_2/while/lstm_cell/MatMul_1/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????2
while/lstm_cell/MatMul_1?
while/lstm_cell/addAddV2 while/lstm_cell/MatMul:product:0"while/lstm_cell/MatMul_1:product:0*
T0*(
_output_shapes
:??????????2
while/lstm_cell/add?
&while/lstm_cell/BiasAdd/ReadVariableOpReadVariableOp1while_lstm_cell_biasadd_readvariableop_resource_0*
_output_shapes	
:?*
dtype02(
&while/lstm_cell/BiasAdd/ReadVariableOp?
while/lstm_cell/BiasAddBiasAddwhile/lstm_cell/add:z:0.while/lstm_cell/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????2
while/lstm_cell/BiasAdd?
while/lstm_cell/split/split_dimConst*
_output_shapes
: *
dtype0*
value	B :2!
while/lstm_cell/split/split_dim?
while/lstm_cell/splitSplit(while/lstm_cell/split/split_dim:output:0 while/lstm_cell/BiasAdd:output:0*
T0*`
_output_shapesN
L:????????? :????????? :????????? :????????? *
	num_split2
while/lstm_cell/split?
while/lstm_cell/SigmoidSigmoidwhile/lstm_cell/split:output:0*
T0*'
_output_shapes
:????????? 2
while/lstm_cell/Sigmoid?
while/lstm_cell/Sigmoid_1Sigmoidwhile/lstm_cell/split:output:1*
T0*'
_output_shapes
:????????? 2
while/lstm_cell/Sigmoid_1?
while/lstm_cell/mulMulwhile/lstm_cell/Sigmoid_1:y:0while_placeholder_3*
T0*'
_output_shapes
:????????? 2
while/lstm_cell/mul?
while/lstm_cell/TanhTanhwhile/lstm_cell/split:output:2*
T0*'
_output_shapes
:????????? 2
while/lstm_cell/Tanh?
while/lstm_cell/mul_1Mulwhile/lstm_cell/Sigmoid:y:0while/lstm_cell/Tanh:y:0*
T0*'
_output_shapes
:????????? 2
while/lstm_cell/mul_1?
while/lstm_cell/add_1AddV2while/lstm_cell/mul:z:0while/lstm_cell/mul_1:z:0*
T0*'
_output_shapes
:????????? 2
while/lstm_cell/add_1?
while/lstm_cell/Sigmoid_2Sigmoidwhile/lstm_cell/split:output:3*
T0*'
_output_shapes
:????????? 2
while/lstm_cell/Sigmoid_2?
while/lstm_cell/Tanh_1Tanhwhile/lstm_cell/add_1:z:0*
T0*'
_output_shapes
:????????? 2
while/lstm_cell/Tanh_1?
while/lstm_cell/mul_2Mulwhile/lstm_cell/Sigmoid_2:y:0while/lstm_cell/Tanh_1:y:0*
T0*'
_output_shapes
:????????? 2
while/lstm_cell/mul_2?
*while/TensorArrayV2Write/TensorListSetItemTensorListSetItemwhile_placeholder_1while_placeholderwhile/lstm_cell/mul_2:z:0*
_output_shapes
: *
element_dtype02,
*while/TensorArrayV2Write/TensorListSetItem\
while/add/yConst*
_output_shapes
: *
dtype0*
value	B :2
while/add/yi
	while/addAddV2while_placeholderwhile/add/y:output:0*
T0*
_output_shapes
: 2
	while/add`
while/add_1/yConst*
_output_shapes
: *
dtype0*
value	B :2
while/add_1/yv
while/add_1AddV2while_while_loop_counterwhile/add_1/y:output:0*
T0*
_output_shapes
: 2
while/add_1?
while/IdentityIdentitywhile/add_1:z:0'^while/lstm_cell/BiasAdd/ReadVariableOp&^while/lstm_cell/MatMul/ReadVariableOp(^while/lstm_cell/MatMul_1/ReadVariableOp*
T0*
_output_shapes
: 2
while/Identity?
while/Identity_1Identitywhile_while_maximum_iterations'^while/lstm_cell/BiasAdd/ReadVariableOp&^while/lstm_cell/MatMul/ReadVariableOp(^while/lstm_cell/MatMul_1/ReadVariableOp*
T0*
_output_shapes
: 2
while/Identity_1?
while/Identity_2Identitywhile/add:z:0'^while/lstm_cell/BiasAdd/ReadVariableOp&^while/lstm_cell/MatMul/ReadVariableOp(^while/lstm_cell/MatMul_1/ReadVariableOp*
T0*
_output_shapes
: 2
while/Identity_2?
while/Identity_3Identity:while/TensorArrayV2Write/TensorListSetItem:output_handle:0'^while/lstm_cell/BiasAdd/ReadVariableOp&^while/lstm_cell/MatMul/ReadVariableOp(^while/lstm_cell/MatMul_1/ReadVariableOp*
T0*
_output_shapes
: 2
while/Identity_3?
while/Identity_4Identitywhile/lstm_cell/mul_2:z:0'^while/lstm_cell/BiasAdd/ReadVariableOp&^while/lstm_cell/MatMul/ReadVariableOp(^while/lstm_cell/MatMul_1/ReadVariableOp*
T0*'
_output_shapes
:????????? 2
while/Identity_4?
while/Identity_5Identitywhile/lstm_cell/add_1:z:0'^while/lstm_cell/BiasAdd/ReadVariableOp&^while/lstm_cell/MatMul/ReadVariableOp(^while/lstm_cell/MatMul_1/ReadVariableOp*
T0*'
_output_shapes
:????????? 2
while/Identity_5")
while_identitywhile/Identity:output:0"-
while_identity_1while/Identity_1:output:0"-
while_identity_2while/Identity_2:output:0"-
while_identity_3while/Identity_3:output:0"-
while_identity_4while/Identity_4:output:0"-
while_identity_5while/Identity_5:output:0"d
/while_lstm_cell_biasadd_readvariableop_resource1while_lstm_cell_biasadd_readvariableop_resource_0"f
0while_lstm_cell_matmul_1_readvariableop_resource2while_lstm_cell_matmul_1_readvariableop_resource_0"b
.while_lstm_cell_matmul_readvariableop_resource0while_lstm_cell_matmul_readvariableop_resource_0"0
while_strided_slice_1while_strided_slice_1_0"?
Qwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensorSwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0*(
_construction_contextkEagerRuntime*K
_input_shapes:
8: : : : :????????? :????????? : : : : : 2P
&while/lstm_cell/BiasAdd/ReadVariableOp&while/lstm_cell/BiasAdd/ReadVariableOp2N
%while/lstm_cell/MatMul/ReadVariableOp%while/lstm_cell/MatMul/ReadVariableOp2R
'while/lstm_cell/MatMul_1/ReadVariableOp'while/lstm_cell/MatMul_1/ReadVariableOp: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :-)
'
_output_shapes
:????????? :-)
'
_output_shapes
:????????? :

_output_shapes
: :

_output_shapes
: 
?\
?
=__inference_rnn_layer_call_and_return_conditional_losses_9734
inputs_0;
(lstm_cell_matmul_readvariableop_resource:	3?=
*lstm_cell_matmul_1_readvariableop_resource:	 ?8
)lstm_cell_biasadd_readvariableop_resource:	?
identity

identity_1

identity_2?? lstm_cell/BiasAdd/ReadVariableOp?lstm_cell/MatMul/ReadVariableOp?!lstm_cell/MatMul_1/ReadVariableOp?whileF
ShapeShapeinputs_0*
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
strided_slice\
zeros/mul/yConst*
_output_shapes
: *
dtype0*
value	B : 2
zeros/mul/yl
	zeros/mulMulstrided_slice:output:0zeros/mul/y:output:0*
T0*
_output_shapes
: 2
	zeros/mul_
zeros/Less/yConst*
_output_shapes
: *
dtype0*
value
B :?2
zeros/Less/yg

zeros/LessLesszeros/mul:z:0zeros/Less/y:output:0*
T0*
_output_shapes
: 2

zeros/Lessb
zeros/packed/1Const*
_output_shapes
: *
dtype0*
value	B : 2
zeros/packed/1?
zeros/packedPackstrided_slice:output:0zeros/packed/1:output:0*
N*
T0*
_output_shapes
:2
zeros/packed_
zeros/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    2
zeros/Constu
zerosFillzeros/packed:output:0zeros/Const:output:0*
T0*'
_output_shapes
:????????? 2
zeros`
zeros_1/mul/yConst*
_output_shapes
: *
dtype0*
value	B : 2
zeros_1/mul/yr
zeros_1/mulMulstrided_slice:output:0zeros_1/mul/y:output:0*
T0*
_output_shapes
: 2
zeros_1/mulc
zeros_1/Less/yConst*
_output_shapes
: *
dtype0*
value
B :?2
zeros_1/Less/yo
zeros_1/LessLesszeros_1/mul:z:0zeros_1/Less/y:output:0*
T0*
_output_shapes
: 2
zeros_1/Lessf
zeros_1/packed/1Const*
_output_shapes
: *
dtype0*
value	B : 2
zeros_1/packed/1?
zeros_1/packedPackstrided_slice:output:0zeros_1/packed/1:output:0*
N*
T0*
_output_shapes
:2
zeros_1/packedc
zeros_1/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    2
zeros_1/Const}
zeros_1Fillzeros_1/packed:output:0zeros_1/Const:output:0*
T0*'
_output_shapes
:????????? 2	
zeros_1u
transpose/permConst*
_output_shapes
:*
dtype0*!
valueB"          2
transpose/perm?
	transpose	Transposeinputs_0transpose/perm:output:0*
T0*4
_output_shapes"
 :??????????????????32
	transposeO
Shape_1Shapetranspose:y:0*
T0*
_output_shapes
:2	
Shape_1x
strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice_1/stack|
strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_1/stack_1|
strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_1/stack_2?
strided_slice_1StridedSliceShape_1:output:0strided_slice_1/stack:output:0 strided_slice_1/stack_1:output:0 strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
strided_slice_1?
TensorArrayV2/element_shapeConst*
_output_shapes
: *
dtype0*
valueB :
?????????2
TensorArrayV2/element_shape?
TensorArrayV2TensorListReserve$TensorArrayV2/element_shape:output:0strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type02
TensorArrayV2?
5TensorArrayUnstack/TensorListFromTensor/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????3   27
5TensorArrayUnstack/TensorListFromTensor/element_shape?
'TensorArrayUnstack/TensorListFromTensorTensorListFromTensortranspose:y:0>TensorArrayUnstack/TensorListFromTensor/element_shape:output:0*
_output_shapes
: *
element_dtype0*

shape_type02)
'TensorArrayUnstack/TensorListFromTensorx
strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice_2/stack|
strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_2/stack_1|
strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_2/stack_2?
strided_slice_2StridedSlicetranspose:y:0strided_slice_2/stack:output:0 strided_slice_2/stack_1:output:0 strided_slice_2/stack_2:output:0*
Index0*
T0*'
_output_shapes
:?????????3*
shrink_axis_mask2
strided_slice_2?
lstm_cell/MatMul/ReadVariableOpReadVariableOp(lstm_cell_matmul_readvariableop_resource*
_output_shapes
:	3?*
dtype02!
lstm_cell/MatMul/ReadVariableOp?
lstm_cell/MatMulMatMulstrided_slice_2:output:0'lstm_cell/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????2
lstm_cell/MatMul?
!lstm_cell/MatMul_1/ReadVariableOpReadVariableOp*lstm_cell_matmul_1_readvariableop_resource*
_output_shapes
:	 ?*
dtype02#
!lstm_cell/MatMul_1/ReadVariableOp?
lstm_cell/MatMul_1MatMulzeros:output:0)lstm_cell/MatMul_1/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????2
lstm_cell/MatMul_1?
lstm_cell/addAddV2lstm_cell/MatMul:product:0lstm_cell/MatMul_1:product:0*
T0*(
_output_shapes
:??????????2
lstm_cell/add?
 lstm_cell/BiasAdd/ReadVariableOpReadVariableOp)lstm_cell_biasadd_readvariableop_resource*
_output_shapes	
:?*
dtype02"
 lstm_cell/BiasAdd/ReadVariableOp?
lstm_cell/BiasAddBiasAddlstm_cell/add:z:0(lstm_cell/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????2
lstm_cell/BiasAddx
lstm_cell/split/split_dimConst*
_output_shapes
: *
dtype0*
value	B :2
lstm_cell/split/split_dim?
lstm_cell/splitSplit"lstm_cell/split/split_dim:output:0lstm_cell/BiasAdd:output:0*
T0*`
_output_shapesN
L:????????? :????????? :????????? :????????? *
	num_split2
lstm_cell/split}
lstm_cell/SigmoidSigmoidlstm_cell/split:output:0*
T0*'
_output_shapes
:????????? 2
lstm_cell/Sigmoid?
lstm_cell/Sigmoid_1Sigmoidlstm_cell/split:output:1*
T0*'
_output_shapes
:????????? 2
lstm_cell/Sigmoid_1?
lstm_cell/mulMullstm_cell/Sigmoid_1:y:0zeros_1:output:0*
T0*'
_output_shapes
:????????? 2
lstm_cell/mult
lstm_cell/TanhTanhlstm_cell/split:output:2*
T0*'
_output_shapes
:????????? 2
lstm_cell/Tanh?
lstm_cell/mul_1Mullstm_cell/Sigmoid:y:0lstm_cell/Tanh:y:0*
T0*'
_output_shapes
:????????? 2
lstm_cell/mul_1?
lstm_cell/add_1AddV2lstm_cell/mul:z:0lstm_cell/mul_1:z:0*
T0*'
_output_shapes
:????????? 2
lstm_cell/add_1?
lstm_cell/Sigmoid_2Sigmoidlstm_cell/split:output:3*
T0*'
_output_shapes
:????????? 2
lstm_cell/Sigmoid_2s
lstm_cell/Tanh_1Tanhlstm_cell/add_1:z:0*
T0*'
_output_shapes
:????????? 2
lstm_cell/Tanh_1?
lstm_cell/mul_2Mullstm_cell/Sigmoid_2:y:0lstm_cell/Tanh_1:y:0*
T0*'
_output_shapes
:????????? 2
lstm_cell/mul_2?
TensorArrayV2_1/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????    2
TensorArrayV2_1/element_shape?
TensorArrayV2_1TensorListReserve&TensorArrayV2_1/element_shape:output:0strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type02
TensorArrayV2_1N
timeConst*
_output_shapes
: *
dtype0*
value	B : 2
time
while/maximum_iterationsConst*
_output_shapes
: *
dtype0*
valueB :
?????????2
while/maximum_iterationsj
while/loop_counterConst*
_output_shapes
: *
dtype0*
value	B : 2
while/loop_counter?
whileWhilewhile/loop_counter:output:0!while/maximum_iterations:output:0time:output:0TensorArrayV2_1:handle:0zeros:output:0zeros_1:output:0strided_slice_1:output:07TensorArrayUnstack/TensorListFromTensor:output_handle:0(lstm_cell_matmul_readvariableop_resource*lstm_cell_matmul_1_readvariableop_resource)lstm_cell_biasadd_readvariableop_resource*
T
2*
_lower_using_switch_merge(*
_num_original_outputs*L
_output_shapes:
8: : : : :????????? :????????? : : : : : *%
_read_only_resource_inputs
	
*
bodyR
while_body_9649*
condR
while_cond_9648*K
output_shapes:
8: : : : :????????? :????????? : : : : : *
parallel_iterations 2
while?
0TensorArrayV2Stack/TensorListStack/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????    22
0TensorArrayV2Stack/TensorListStack/element_shape?
"TensorArrayV2Stack/TensorListStackTensorListStackwhile:output:39TensorArrayV2Stack/TensorListStack/element_shape:output:0*4
_output_shapes"
 :?????????????????? *
element_dtype02$
"TensorArrayV2Stack/TensorListStack?
strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB:
?????????2
strided_slice_3/stack|
strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice_3/stack_1|
strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_3/stack_2?
strided_slice_3StridedSlice+TensorArrayV2Stack/TensorListStack:tensor:0strided_slice_3/stack:output:0 strided_slice_3/stack_1:output:0 strided_slice_3/stack_2:output:0*
Index0*
T0*'
_output_shapes
:????????? *
shrink_axis_mask2
strided_slice_3y
transpose_1/permConst*
_output_shapes
:*
dtype0*!
valueB"          2
transpose_1/perm?
transpose_1	Transpose+TensorArrayV2Stack/TensorListStack:tensor:0transpose_1/perm:output:0*
T0*4
_output_shapes"
 :?????????????????? 2
transpose_1?
IdentityIdentitystrided_slice_3:output:0!^lstm_cell/BiasAdd/ReadVariableOp ^lstm_cell/MatMul/ReadVariableOp"^lstm_cell/MatMul_1/ReadVariableOp^while*
T0*'
_output_shapes
:????????? 2

Identity?

Identity_1Identitywhile:output:4!^lstm_cell/BiasAdd/ReadVariableOp ^lstm_cell/MatMul/ReadVariableOp"^lstm_cell/MatMul_1/ReadVariableOp^while*
T0*'
_output_shapes
:????????? 2

Identity_1?

Identity_2Identitywhile:output:5!^lstm_cell/BiasAdd/ReadVariableOp ^lstm_cell/MatMul/ReadVariableOp"^lstm_cell/MatMul_1/ReadVariableOp^while*
T0*'
_output_shapes
:????????? 2

Identity_2"
identityIdentity:output:0"!

identity_1Identity_1:output:0"!

identity_2Identity_2:output:0*(
_construction_contextkEagerRuntime*9
_input_shapes(
&:??????????????????3: : : 2D
 lstm_cell/BiasAdd/ReadVariableOp lstm_cell/BiasAdd/ReadVariableOp2B
lstm_cell/MatMul/ReadVariableOplstm_cell/MatMul/ReadVariableOp2F
!lstm_cell/MatMul_1/ReadVariableOp!lstm_cell/MatMul_1/ReadVariableOp2
whilewhile:^ Z
4
_output_shapes"
 :??????????????????3
"
_user_specified_name
inputs/0
?
?
"__inference_rnn_layer_call_fn_9567

inputs
unknown:	3?
	unknown_0:	 ?
	unknown_1:	?
identity

identity_1

identity_2??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1*
Tin
2*
Tout
2*
_collective_manager_ids
 *M
_output_shapes;
9:????????? :????????? :????????? *%
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *F
fAR?
=__inference_rnn_layer_call_and_return_conditional_losses_83722
StatefulPartitionedCall?
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*'
_output_shapes
:????????? 2

Identity?

Identity_1Identity StatefulPartitionedCall:output:1^StatefulPartitionedCall*
T0*'
_output_shapes
:????????? 2

Identity_1?

Identity_2Identity StatefulPartitionedCall:output:2^StatefulPartitionedCall*
T0*'
_output_shapes
:????????? 2

Identity_2"
identityIdentity:output:0"!

identity_1Identity_1:output:0"!

identity_2Identity_2:output:0*(
_construction_contextkEagerRuntime*9
_input_shapes(
&:??????????????????3: : : 22
StatefulPartitionedCallStatefulPartitionedCall:\ X
4
_output_shapes"
 :??????????????????3
 
_user_specified_nameinputs
?G
?
=__inference_rnn_layer_call_and_return_conditional_losses_8372

inputs!
lstm_cell_8289:	3?!
lstm_cell_8291:	 ?
lstm_cell_8293:	?
identity

identity_1

identity_2??!lstm_cell/StatefulPartitionedCall?whileD
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
strided_slice\
zeros/mul/yConst*
_output_shapes
: *
dtype0*
value	B : 2
zeros/mul/yl
	zeros/mulMulstrided_slice:output:0zeros/mul/y:output:0*
T0*
_output_shapes
: 2
	zeros/mul_
zeros/Less/yConst*
_output_shapes
: *
dtype0*
value
B :?2
zeros/Less/yg

zeros/LessLesszeros/mul:z:0zeros/Less/y:output:0*
T0*
_output_shapes
: 2

zeros/Lessb
zeros/packed/1Const*
_output_shapes
: *
dtype0*
value	B : 2
zeros/packed/1?
zeros/packedPackstrided_slice:output:0zeros/packed/1:output:0*
N*
T0*
_output_shapes
:2
zeros/packed_
zeros/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    2
zeros/Constu
zerosFillzeros/packed:output:0zeros/Const:output:0*
T0*'
_output_shapes
:????????? 2
zeros`
zeros_1/mul/yConst*
_output_shapes
: *
dtype0*
value	B : 2
zeros_1/mul/yr
zeros_1/mulMulstrided_slice:output:0zeros_1/mul/y:output:0*
T0*
_output_shapes
: 2
zeros_1/mulc
zeros_1/Less/yConst*
_output_shapes
: *
dtype0*
value
B :?2
zeros_1/Less/yo
zeros_1/LessLesszeros_1/mul:z:0zeros_1/Less/y:output:0*
T0*
_output_shapes
: 2
zeros_1/Lessf
zeros_1/packed/1Const*
_output_shapes
: *
dtype0*
value	B : 2
zeros_1/packed/1?
zeros_1/packedPackstrided_slice:output:0zeros_1/packed/1:output:0*
N*
T0*
_output_shapes
:2
zeros_1/packedc
zeros_1/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    2
zeros_1/Const}
zeros_1Fillzeros_1/packed:output:0zeros_1/Const:output:0*
T0*'
_output_shapes
:????????? 2	
zeros_1u
transpose/permConst*
_output_shapes
:*
dtype0*!
valueB"          2
transpose/perm?
	transpose	Transposeinputstranspose/perm:output:0*
T0*4
_output_shapes"
 :??????????????????32
	transposeO
Shape_1Shapetranspose:y:0*
T0*
_output_shapes
:2	
Shape_1x
strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice_1/stack|
strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_1/stack_1|
strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_1/stack_2?
strided_slice_1StridedSliceShape_1:output:0strided_slice_1/stack:output:0 strided_slice_1/stack_1:output:0 strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
strided_slice_1?
TensorArrayV2/element_shapeConst*
_output_shapes
: *
dtype0*
valueB :
?????????2
TensorArrayV2/element_shape?
TensorArrayV2TensorListReserve$TensorArrayV2/element_shape:output:0strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type02
TensorArrayV2?
5TensorArrayUnstack/TensorListFromTensor/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????3   27
5TensorArrayUnstack/TensorListFromTensor/element_shape?
'TensorArrayUnstack/TensorListFromTensorTensorListFromTensortranspose:y:0>TensorArrayUnstack/TensorListFromTensor/element_shape:output:0*
_output_shapes
: *
element_dtype0*

shape_type02)
'TensorArrayUnstack/TensorListFromTensorx
strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice_2/stack|
strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_2/stack_1|
strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_2/stack_2?
strided_slice_2StridedSlicetranspose:y:0strided_slice_2/stack:output:0 strided_slice_2/stack_1:output:0 strided_slice_2/stack_2:output:0*
Index0*
T0*'
_output_shapes
:?????????3*
shrink_axis_mask2
strided_slice_2?
!lstm_cell/StatefulPartitionedCallStatefulPartitionedCallstrided_slice_2:output:0zeros:output:0zeros_1:output:0lstm_cell_8289lstm_cell_8291lstm_cell_8293*
Tin

2*
Tout
2*
_collective_manager_ids
 *M
_output_shapes;
9:????????? :????????? :????????? *%
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *L
fGRE
C__inference_lstm_cell_layer_call_and_return_conditional_losses_76692#
!lstm_cell/StatefulPartitionedCall?
TensorArrayV2_1/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????    2
TensorArrayV2_1/element_shape?
TensorArrayV2_1TensorListReserve&TensorArrayV2_1/element_shape:output:0strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type02
TensorArrayV2_1N
timeConst*
_output_shapes
: *
dtype0*
value	B : 2
time
while/maximum_iterationsConst*
_output_shapes
: *
dtype0*
valueB :
?????????2
while/maximum_iterationsj
while/loop_counterConst*
_output_shapes
: *
dtype0*
value	B : 2
while/loop_counter?
whileWhilewhile/loop_counter:output:0!while/maximum_iterations:output:0time:output:0TensorArrayV2_1:handle:0zeros:output:0zeros_1:output:0strided_slice_1:output:07TensorArrayUnstack/TensorListFromTensor:output_handle:0lstm_cell_8289lstm_cell_8291lstm_cell_8293*
T
2*
_lower_using_switch_merge(*
_num_original_outputs*L
_output_shapes:
8: : : : :????????? :????????? : : : : : *%
_read_only_resource_inputs
	
*
bodyR
while_body_8302*
condR
while_cond_8301*K
output_shapes:
8: : : : :????????? :????????? : : : : : *
parallel_iterations 2
while?
0TensorArrayV2Stack/TensorListStack/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????    22
0TensorArrayV2Stack/TensorListStack/element_shape?
"TensorArrayV2Stack/TensorListStackTensorListStackwhile:output:39TensorArrayV2Stack/TensorListStack/element_shape:output:0*4
_output_shapes"
 :?????????????????? *
element_dtype02$
"TensorArrayV2Stack/TensorListStack?
strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB:
?????????2
strided_slice_3/stack|
strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice_3/stack_1|
strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_3/stack_2?
strided_slice_3StridedSlice+TensorArrayV2Stack/TensorListStack:tensor:0strided_slice_3/stack:output:0 strided_slice_3/stack_1:output:0 strided_slice_3/stack_2:output:0*
Index0*
T0*'
_output_shapes
:????????? *
shrink_axis_mask2
strided_slice_3y
transpose_1/permConst*
_output_shapes
:*
dtype0*!
valueB"          2
transpose_1/perm?
transpose_1	Transpose+TensorArrayV2Stack/TensorListStack:tensor:0transpose_1/perm:output:0*
T0*4
_output_shapes"
 :?????????????????? 2
transpose_1?
IdentityIdentitystrided_slice_3:output:0"^lstm_cell/StatefulPartitionedCall^while*
T0*'
_output_shapes
:????????? 2

Identity?

Identity_1Identitywhile:output:4"^lstm_cell/StatefulPartitionedCall^while*
T0*'
_output_shapes
:????????? 2

Identity_1?

Identity_2Identitywhile:output:5"^lstm_cell/StatefulPartitionedCall^while*
T0*'
_output_shapes
:????????? 2

Identity_2"
identityIdentity:output:0"!

identity_1Identity_1:output:0"!

identity_2Identity_2:output:0*(
_construction_contextkEagerRuntime*9
_input_shapes(
&:??????????????????3: : : 2F
!lstm_cell/StatefulPartitionedCall!lstm_cell/StatefulPartitionedCall2
whilewhile:\ X
4
_output_shapes"
 :??????????????????3
 
_user_specified_nameinputs
?
?
C__inference_lstm_cell_layer_call_and_return_conditional_losses_9522

inputs
states_0
states_11
matmul_readvariableop_resource:	3?3
 matmul_1_readvariableop_resource:	 ?.
biasadd_readvariableop_resource:	?
identity

identity_1

identity_2??BiasAdd/ReadVariableOp?MatMul/ReadVariableOp?MatMul_1/ReadVariableOp?
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	3?*
dtype02
MatMul/ReadVariableOpt
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????2
MatMul?
MatMul_1/ReadVariableOpReadVariableOp matmul_1_readvariableop_resource*
_output_shapes
:	 ?*
dtype02
MatMul_1/ReadVariableOp|
MatMul_1MatMulstates_0MatMul_1/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????2

MatMul_1l
addAddV2MatMul:product:0MatMul_1:product:0*
T0*(
_output_shapes
:??????????2
add?
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
:?*
dtype02
BiasAdd/ReadVariableOpy
BiasAddBiasAddadd:z:0BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????2	
BiasAddd
split/split_dimConst*
_output_shapes
: *
dtype0*
value	B :2
split/split_dim?
splitSplitsplit/split_dim:output:0BiasAdd:output:0*
T0*`
_output_shapesN
L:????????? :????????? :????????? :????????? *
	num_split2
split_
SigmoidSigmoidsplit:output:0*
T0*'
_output_shapes
:????????? 2	
Sigmoidc
	Sigmoid_1Sigmoidsplit:output:1*
T0*'
_output_shapes
:????????? 2
	Sigmoid_1\
mulMulSigmoid_1:y:0states_1*
T0*'
_output_shapes
:????????? 2
mulV
TanhTanhsplit:output:2*
T0*'
_output_shapes
:????????? 2
Tanh^
mul_1MulSigmoid:y:0Tanh:y:0*
T0*'
_output_shapes
:????????? 2
mul_1]
add_1AddV2mul:z:0	mul_1:z:0*
T0*'
_output_shapes
:????????? 2
add_1c
	Sigmoid_2Sigmoidsplit:output:3*
T0*'
_output_shapes
:????????? 2
	Sigmoid_2U
Tanh_1Tanh	add_1:z:0*
T0*'
_output_shapes
:????????? 2
Tanh_1b
mul_2MulSigmoid_2:y:0
Tanh_1:y:0*
T0*'
_output_shapes
:????????? 2
mul_2?
IdentityIdentity	mul_2:z:0^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp^MatMul_1/ReadVariableOp*
T0*'
_output_shapes
:????????? 2

Identity?

Identity_1Identity	mul_2:z:0^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp^MatMul_1/ReadVariableOp*
T0*'
_output_shapes
:????????? 2

Identity_1?

Identity_2Identity	add_1:z:0^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp^MatMul_1/ReadVariableOp*
T0*'
_output_shapes
:????????? 2

Identity_2"
identityIdentity:output:0"!

identity_1Identity_1:output:0"!

identity_2Identity_2:output:0*(
_construction_contextkEagerRuntime*R
_input_shapesA
?:?????????3:????????? :????????? : : : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp22
MatMul_1/ReadVariableOpMatMul_1/ReadVariableOp:O K
'
_output_shapes
:?????????3
 
_user_specified_nameinputs:QM
'
_output_shapes
:????????? 
"
_user_specified_name
states/0:QM
'
_output_shapes
:????????? 
"
_user_specified_name
states/1
?
?
"__inference_rnn_layer_call_fn_9582

inputs
unknown:	3?
	unknown_0:	 ?
	unknown_1:	?
identity

identity_1

identity_2??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1*
Tin
2*
Tout
2*
_collective_manager_ids
 *M
_output_shapes;
9:????????? :????????? :????????? *%
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *F
fAR?
=__inference_rnn_layer_call_and_return_conditional_losses_86802
StatefulPartitionedCall?
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*'
_output_shapes
:????????? 2

Identity?

Identity_1Identity StatefulPartitionedCall:output:1^StatefulPartitionedCall*
T0*'
_output_shapes
:????????? 2

Identity_1?

Identity_2Identity StatefulPartitionedCall:output:2^StatefulPartitionedCall*
T0*'
_output_shapes
:????????? 2

Identity_2"
identityIdentity:output:0"!

identity_1Identity_1:output:0"!

identity_2Identity_2:output:0*(
_construction_contextkEagerRuntime*9
_input_shapes(
&:??????????????????3: : : 22
StatefulPartitionedCallStatefulPartitionedCall:\ X
4
_output_shapes"
 :??????????????????3
 
_user_specified_nameinputs
?
?
while_cond_7682
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_placeholder_2
while_placeholder_3
while_less_strided_slice_12
.while_while_cond_7682___redundant_placeholder02
.while_while_cond_7682___redundant_placeholder12
.while_while_cond_7682___redundant_placeholder22
.while_while_cond_7682___redundant_placeholder3
while_identity
p

while/LessLesswhile_placeholderwhile_less_strided_slice_1*
T0*
_output_shapes
: 2

while/Less]
while/IdentityIdentitywhile/Less:z:0*
T0
*
_output_shapes
: 2
while/Identity")
while_identitywhile/Identity:output:0*(
_construction_contextkEagerRuntime*S
_input_shapesB
@: : : : :????????? :????????? : ::::: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :-)
'
_output_shapes
:????????? :-)
'
_output_shapes
:????????? :

_output_shapes
: :

_output_shapes
:
?	
?
A__inference_dense_1_layer_call_and_return_conditional_losses_8392

inputs0
matmul_readvariableop_resource: 3-
biasadd_readvariableop_resource:3
identity??BiasAdd/ReadVariableOp?MatMul/ReadVariableOp?
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

: 3*
dtype02
MatMul/ReadVariableOps
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????32
MatMul?
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:3*
dtype02
BiasAdd/ReadVariableOp?
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????32	
BiasAdd?
IdentityIdentityBiasAdd:output:0^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*
T0*'
_output_shapes
:?????????32

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:????????? : : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:O K
'
_output_shapes
:????????? 
 
_user_specified_nameinputs
?
?
while_cond_8609
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_placeholder_2
while_placeholder_3
while_less_strided_slice_12
.while_while_cond_8609___redundant_placeholder02
.while_while_cond_8609___redundant_placeholder12
.while_while_cond_8609___redundant_placeholder22
.while_while_cond_8609___redundant_placeholder3
while_identity
p

while/LessLesswhile_placeholderwhile_less_strided_slice_1*
T0*
_output_shapes
: 2

while/Less]
while/IdentityIdentitywhile/Less:z:0*
T0
*
_output_shapes
: 2
while/Identity")
while_identitywhile/Identity:output:0*(
_construction_contextkEagerRuntime*S
_input_shapesB
@: : : : :????????? :????????? : ::::: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :-)
'
_output_shapes
:????????? :-)
'
_output_shapes
:????????? :

_output_shapes
: :

_output_shapes
:
?
?
&__inference_AR_LSTM_layer_call_fn_8893

inputs
unknown:	3?
	unknown_0:	 ?
	unknown_1:	?
	unknown_2: 3
	unknown_3:3
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2	unknown_3*
Tin

2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:?????????3*'
_read_only_resource_inputs	
*-
config_proto

CPU

GPU 2J 8? *J
fERC
A__inference_AR_LSTM_layer_call_and_return_conditional_losses_84522
StatefulPartitionedCall?
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*+
_output_shapes
:?????????32

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*=
_input_shapes,
*:??????????????????3: : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:\ X
4
_output_shapes"
 :??????????????????3
 
_user_specified_nameinputs
?
?
(__inference_lstm_cell_layer_call_fn_9343

inputs
states_0
states_1
unknown:	3?
	unknown_0:	 ?
	unknown_1:	?
identity

identity_1

identity_2??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsstates_0states_1unknown	unknown_0	unknown_1*
Tin

2*
Tout
2*
_collective_manager_ids
 *M
_output_shapes;
9:????????? :????????? :????????? *%
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *L
fGRE
C__inference_lstm_cell_layer_call_and_return_conditional_losses_76692
StatefulPartitionedCall?
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*'
_output_shapes
:????????? 2

Identity?

Identity_1Identity StatefulPartitionedCall:output:1^StatefulPartitionedCall*
T0*'
_output_shapes
:????????? 2

Identity_1?

Identity_2Identity StatefulPartitionedCall:output:2^StatefulPartitionedCall*
T0*'
_output_shapes
:????????? 2

Identity_2"
identityIdentity:output:0"!

identity_1Identity_1:output:0"!

identity_2Identity_2:output:0*(
_construction_contextkEagerRuntime*R
_input_shapesA
?:?????????3:????????? :????????? : : : 22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:?????????3
 
_user_specified_nameinputs:QM
'
_output_shapes
:????????? 
"
_user_specified_name
states/0:QM
'
_output_shapes
:????????? 
"
_user_specified_name
states/1
?G
?
=__inference_rnn_layer_call_and_return_conditional_losses_7753

inputs!
lstm_cell_7670:	3?!
lstm_cell_7672:	 ?
lstm_cell_7674:	?
identity

identity_1

identity_2??!lstm_cell/StatefulPartitionedCall?whileD
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
strided_slice\
zeros/mul/yConst*
_output_shapes
: *
dtype0*
value	B : 2
zeros/mul/yl
	zeros/mulMulstrided_slice:output:0zeros/mul/y:output:0*
T0*
_output_shapes
: 2
	zeros/mul_
zeros/Less/yConst*
_output_shapes
: *
dtype0*
value
B :?2
zeros/Less/yg

zeros/LessLesszeros/mul:z:0zeros/Less/y:output:0*
T0*
_output_shapes
: 2

zeros/Lessb
zeros/packed/1Const*
_output_shapes
: *
dtype0*
value	B : 2
zeros/packed/1?
zeros/packedPackstrided_slice:output:0zeros/packed/1:output:0*
N*
T0*
_output_shapes
:2
zeros/packed_
zeros/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    2
zeros/Constu
zerosFillzeros/packed:output:0zeros/Const:output:0*
T0*'
_output_shapes
:????????? 2
zeros`
zeros_1/mul/yConst*
_output_shapes
: *
dtype0*
value	B : 2
zeros_1/mul/yr
zeros_1/mulMulstrided_slice:output:0zeros_1/mul/y:output:0*
T0*
_output_shapes
: 2
zeros_1/mulc
zeros_1/Less/yConst*
_output_shapes
: *
dtype0*
value
B :?2
zeros_1/Less/yo
zeros_1/LessLesszeros_1/mul:z:0zeros_1/Less/y:output:0*
T0*
_output_shapes
: 2
zeros_1/Lessf
zeros_1/packed/1Const*
_output_shapes
: *
dtype0*
value	B : 2
zeros_1/packed/1?
zeros_1/packedPackstrided_slice:output:0zeros_1/packed/1:output:0*
N*
T0*
_output_shapes
:2
zeros_1/packedc
zeros_1/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    2
zeros_1/Const}
zeros_1Fillzeros_1/packed:output:0zeros_1/Const:output:0*
T0*'
_output_shapes
:????????? 2	
zeros_1u
transpose/permConst*
_output_shapes
:*
dtype0*!
valueB"          2
transpose/perm?
	transpose	Transposeinputstranspose/perm:output:0*
T0*4
_output_shapes"
 :??????????????????32
	transposeO
Shape_1Shapetranspose:y:0*
T0*
_output_shapes
:2	
Shape_1x
strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice_1/stack|
strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_1/stack_1|
strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_1/stack_2?
strided_slice_1StridedSliceShape_1:output:0strided_slice_1/stack:output:0 strided_slice_1/stack_1:output:0 strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
strided_slice_1?
TensorArrayV2/element_shapeConst*
_output_shapes
: *
dtype0*
valueB :
?????????2
TensorArrayV2/element_shape?
TensorArrayV2TensorListReserve$TensorArrayV2/element_shape:output:0strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type02
TensorArrayV2?
5TensorArrayUnstack/TensorListFromTensor/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????3   27
5TensorArrayUnstack/TensorListFromTensor/element_shape?
'TensorArrayUnstack/TensorListFromTensorTensorListFromTensortranspose:y:0>TensorArrayUnstack/TensorListFromTensor/element_shape:output:0*
_output_shapes
: *
element_dtype0*

shape_type02)
'TensorArrayUnstack/TensorListFromTensorx
strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice_2/stack|
strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_2/stack_1|
strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_2/stack_2?
strided_slice_2StridedSlicetranspose:y:0strided_slice_2/stack:output:0 strided_slice_2/stack_1:output:0 strided_slice_2/stack_2:output:0*
Index0*
T0*'
_output_shapes
:?????????3*
shrink_axis_mask2
strided_slice_2?
!lstm_cell/StatefulPartitionedCallStatefulPartitionedCallstrided_slice_2:output:0zeros:output:0zeros_1:output:0lstm_cell_7670lstm_cell_7672lstm_cell_7674*
Tin

2*
Tout
2*
_collective_manager_ids
 *M
_output_shapes;
9:????????? :????????? :????????? *%
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *L
fGRE
C__inference_lstm_cell_layer_call_and_return_conditional_losses_76692#
!lstm_cell/StatefulPartitionedCall?
TensorArrayV2_1/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????    2
TensorArrayV2_1/element_shape?
TensorArrayV2_1TensorListReserve&TensorArrayV2_1/element_shape:output:0strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type02
TensorArrayV2_1N
timeConst*
_output_shapes
: *
dtype0*
value	B : 2
time
while/maximum_iterationsConst*
_output_shapes
: *
dtype0*
valueB :
?????????2
while/maximum_iterationsj
while/loop_counterConst*
_output_shapes
: *
dtype0*
value	B : 2
while/loop_counter?
whileWhilewhile/loop_counter:output:0!while/maximum_iterations:output:0time:output:0TensorArrayV2_1:handle:0zeros:output:0zeros_1:output:0strided_slice_1:output:07TensorArrayUnstack/TensorListFromTensor:output_handle:0lstm_cell_7670lstm_cell_7672lstm_cell_7674*
T
2*
_lower_using_switch_merge(*
_num_original_outputs*L
_output_shapes:
8: : : : :????????? :????????? : : : : : *%
_read_only_resource_inputs
	
*
bodyR
while_body_7683*
condR
while_cond_7682*K
output_shapes:
8: : : : :????????? :????????? : : : : : *
parallel_iterations 2
while?
0TensorArrayV2Stack/TensorListStack/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????    22
0TensorArrayV2Stack/TensorListStack/element_shape?
"TensorArrayV2Stack/TensorListStackTensorListStackwhile:output:39TensorArrayV2Stack/TensorListStack/element_shape:output:0*4
_output_shapes"
 :?????????????????? *
element_dtype02$
"TensorArrayV2Stack/TensorListStack?
strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB:
?????????2
strided_slice_3/stack|
strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice_3/stack_1|
strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_3/stack_2?
strided_slice_3StridedSlice+TensorArrayV2Stack/TensorListStack:tensor:0strided_slice_3/stack:output:0 strided_slice_3/stack_1:output:0 strided_slice_3/stack_2:output:0*
Index0*
T0*'
_output_shapes
:????????? *
shrink_axis_mask2
strided_slice_3y
transpose_1/permConst*
_output_shapes
:*
dtype0*!
valueB"          2
transpose_1/perm?
transpose_1	Transpose+TensorArrayV2Stack/TensorListStack:tensor:0transpose_1/perm:output:0*
T0*4
_output_shapes"
 :?????????????????? 2
transpose_1?
IdentityIdentitystrided_slice_3:output:0"^lstm_cell/StatefulPartitionedCall^while*
T0*'
_output_shapes
:????????? 2

Identity?

Identity_1Identitywhile:output:4"^lstm_cell/StatefulPartitionedCall^while*
T0*'
_output_shapes
:????????? 2

Identity_1?

Identity_2Identitywhile:output:5"^lstm_cell/StatefulPartitionedCall^while*
T0*'
_output_shapes
:????????? 2

Identity_2"
identityIdentity:output:0"!

identity_1Identity_1:output:0"!

identity_2Identity_2:output:0*(
_construction_contextkEagerRuntime*9
_input_shapes(
&:??????????????????3: : : 2F
!lstm_cell/StatefulPartitionedCall!lstm_cell/StatefulPartitionedCall2
whilewhile:\ X
4
_output_shapes"
 :??????????????????3
 
_user_specified_nameinputs
?%
?
while_body_8302
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_placeholder_2
while_placeholder_3
while_strided_slice_1_0W
Swhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0)
while_lstm_cell_8326_0:	3?)
while_lstm_cell_8328_0:	 ?%
while_lstm_cell_8330_0:	?
while_identity
while_identity_1
while_identity_2
while_identity_3
while_identity_4
while_identity_5
while_strided_slice_1U
Qwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor'
while_lstm_cell_8326:	3?'
while_lstm_cell_8328:	 ?#
while_lstm_cell_8330:	???'while/lstm_cell/StatefulPartitionedCall?
7while/TensorArrayV2Read/TensorListGetItem/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????3   29
7while/TensorArrayV2Read/TensorListGetItem/element_shape?
)while/TensorArrayV2Read/TensorListGetItemTensorListGetItemSwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0while_placeholder@while/TensorArrayV2Read/TensorListGetItem/element_shape:output:0*'
_output_shapes
:?????????3*
element_dtype02+
)while/TensorArrayV2Read/TensorListGetItem?
'while/lstm_cell/StatefulPartitionedCallStatefulPartitionedCall0while/TensorArrayV2Read/TensorListGetItem:item:0while_placeholder_2while_placeholder_3while_lstm_cell_8326_0while_lstm_cell_8328_0while_lstm_cell_8330_0*
Tin

2*
Tout
2*
_collective_manager_ids
 *M
_output_shapes;
9:????????? :????????? :????????? *%
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *L
fGRE
C__inference_lstm_cell_layer_call_and_return_conditional_losses_76692)
'while/lstm_cell/StatefulPartitionedCall?
*while/TensorArrayV2Write/TensorListSetItemTensorListSetItemwhile_placeholder_1while_placeholder0while/lstm_cell/StatefulPartitionedCall:output:0*
_output_shapes
: *
element_dtype02,
*while/TensorArrayV2Write/TensorListSetItem\
while/add/yConst*
_output_shapes
: *
dtype0*
value	B :2
while/add/yi
	while/addAddV2while_placeholderwhile/add/y:output:0*
T0*
_output_shapes
: 2
	while/add`
while/add_1/yConst*
_output_shapes
: *
dtype0*
value	B :2
while/add_1/yv
while/add_1AddV2while_while_loop_counterwhile/add_1/y:output:0*
T0*
_output_shapes
: 2
while/add_1?
while/IdentityIdentitywhile/add_1:z:0(^while/lstm_cell/StatefulPartitionedCall*
T0*
_output_shapes
: 2
while/Identity?
while/Identity_1Identitywhile_while_maximum_iterations(^while/lstm_cell/StatefulPartitionedCall*
T0*
_output_shapes
: 2
while/Identity_1?
while/Identity_2Identitywhile/add:z:0(^while/lstm_cell/StatefulPartitionedCall*
T0*
_output_shapes
: 2
while/Identity_2?
while/Identity_3Identity:while/TensorArrayV2Write/TensorListSetItem:output_handle:0(^while/lstm_cell/StatefulPartitionedCall*
T0*
_output_shapes
: 2
while/Identity_3?
while/Identity_4Identity0while/lstm_cell/StatefulPartitionedCall:output:1(^while/lstm_cell/StatefulPartitionedCall*
T0*'
_output_shapes
:????????? 2
while/Identity_4?
while/Identity_5Identity0while/lstm_cell/StatefulPartitionedCall:output:2(^while/lstm_cell/StatefulPartitionedCall*
T0*'
_output_shapes
:????????? 2
while/Identity_5")
while_identitywhile/Identity:output:0"-
while_identity_1while/Identity_1:output:0"-
while_identity_2while/Identity_2:output:0"-
while_identity_3while/Identity_3:output:0"-
while_identity_4while/Identity_4:output:0"-
while_identity_5while/Identity_5:output:0".
while_lstm_cell_8326while_lstm_cell_8326_0".
while_lstm_cell_8328while_lstm_cell_8328_0".
while_lstm_cell_8330while_lstm_cell_8330_0"0
while_strided_slice_1while_strided_slice_1_0"?
Qwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensorSwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0*(
_construction_contextkEagerRuntime*K
_input_shapes:
8: : : : :????????? :????????? : : : : : 2R
'while/lstm_cell/StatefulPartitionedCall'while/lstm_cell/StatefulPartitionedCall: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :-)
'
_output_shapes
:????????? :-)
'
_output_shapes
:????????? :

_output_shapes
: :

_output_shapes
: 
?	
?
rnn_while_cond_9183$
 rnn_while_rnn_while_loop_counter*
&rnn_while_rnn_while_maximum_iterations
rnn_while_placeholder
rnn_while_placeholder_1
rnn_while_placeholder_2
rnn_while_placeholder_3&
"rnn_while_less_rnn_strided_slice_1:
6rnn_while_rnn_while_cond_9183___redundant_placeholder0:
6rnn_while_rnn_while_cond_9183___redundant_placeholder1:
6rnn_while_rnn_while_cond_9183___redundant_placeholder2:
6rnn_while_rnn_while_cond_9183___redundant_placeholder3
rnn_while_identity
?
rnn/while/LessLessrnn_while_placeholder"rnn_while_less_rnn_strided_slice_1*
T0*
_output_shapes
: 2
rnn/while/Lessi
rnn/while/IdentityIdentityrnn/while/Less:z:0*
T0
*
_output_shapes
: 2
rnn/while/Identity"1
rnn_while_identityrnn/while/Identity:output:0*(
_construction_contextkEagerRuntime*S
_input_shapesB
@: : : : :????????? :????????? : ::::: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :-)
'
_output_shapes
:????????? :-)
'
_output_shapes
:????????? :

_output_shapes
: :

_output_shapes
:
?
?
(__inference_lstm_cell_layer_call_fn_9360

inputs
states_0
states_1
unknown:	3?
	unknown_0:	 ?
	unknown_1:	?
identity

identity_1

identity_2??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsstates_0states_1unknown	unknown_0	unknown_1*
Tin

2*
Tout
2*
_collective_manager_ids
 *M
_output_shapes;
9:????????? :????????? :????????? *%
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *L
fGRE
C__inference_lstm_cell_layer_call_and_return_conditional_losses_78202
StatefulPartitionedCall?
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*'
_output_shapes
:????????? 2

Identity?

Identity_1Identity StatefulPartitionedCall:output:1^StatefulPartitionedCall*
T0*'
_output_shapes
:????????? 2

Identity_1?

Identity_2Identity StatefulPartitionedCall:output:2^StatefulPartitionedCall*
T0*'
_output_shapes
:????????? 2

Identity_2"
identityIdentity:output:0"!

identity_1Identity_1:output:0"!

identity_2Identity_2:output:0*(
_construction_contextkEagerRuntime*R
_input_shapesA
?:?????????3:????????? :????????? : : : 22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:?????????3
 
_user_specified_nameinputs:QM
'
_output_shapes
:????????? 
"
_user_specified_name
states/0:QM
'
_output_shapes
:????????? 
"
_user_specified_name
states/1
?
?
while_cond_7901
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_placeholder_2
while_placeholder_3
while_less_strided_slice_12
.while_while_cond_7901___redundant_placeholder02
.while_while_cond_7901___redundant_placeholder12
.while_while_cond_7901___redundant_placeholder22
.while_while_cond_7901___redundant_placeholder3
while_identity
p

while/LessLesswhile_placeholderwhile_less_strided_slice_1*
T0*
_output_shapes
: 2

while/Less]
while/IdentityIdentitywhile/Less:z:0*
T0
*
_output_shapes
: 2
while/Identity")
while_identitywhile/Identity:output:0*(
_construction_contextkEagerRuntime*S
_input_shapesB
@: : : : :????????? :????????? : ::::: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :-)
'
_output_shapes
:????????? :-)
'
_output_shapes
:????????? :

_output_shapes
: :

_output_shapes
:
?
?
"__inference_signature_wrapper_8878
input_1
unknown:	3?
	unknown_0:	 ?
	unknown_1:	?
	unknown_2: 3
	unknown_3:3
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinput_1unknown	unknown_0	unknown_1	unknown_2	unknown_3*
Tin

2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:?????????3*'
_read_only_resource_inputs	
*-
config_proto

CPU

GPU 2J 8? *(
f#R!
__inference__wrapped_model_75942
StatefulPartitionedCall?
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*+
_output_shapes
:?????????32

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*=
_input_shapes,
*:??????????????????3: : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:] Y
4
_output_shapes"
 :??????????????????3
!
_user_specified_name	input_1
?
?
&__inference_AR_LSTM_layer_call_fn_8908

inputs
unknown:	3?
	unknown_0:	 ?
	unknown_1:	?
	unknown_2: 3
	unknown_3:3
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2	unknown_3*
Tin

2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:?????????3*'
_read_only_resource_inputs	
*-
config_proto

CPU

GPU 2J 8? *J
fERC
A__inference_AR_LSTM_layer_call_and_return_conditional_losses_87492
StatefulPartitionedCall?
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*+
_output_shapes
:?????????32

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*=
_input_shapes,
*:??????????????????3: : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:\ X
4
_output_shapes"
 :??????????????????3
 
_user_specified_nameinputs
??
?
A__inference_AR_LSTM_layer_call_and_return_conditional_losses_9117

inputs?
,rnn_lstm_cell_matmul_readvariableop_resource:	3?A
.rnn_lstm_cell_matmul_1_readvariableop_resource:	 ?<
-rnn_lstm_cell_biasadd_readvariableop_resource:	?8
&dense_1_matmul_readvariableop_resource: 35
'dense_1_biasadd_readvariableop_resource:3
identity??dense_1/BiasAdd/ReadVariableOp? dense_1/BiasAdd_1/ReadVariableOp? dense_1/BiasAdd_2/ReadVariableOp?dense_1/MatMul/ReadVariableOp?dense_1/MatMul_1/ReadVariableOp?dense_1/MatMul_2/ReadVariableOp? lstm_cell/BiasAdd/ReadVariableOp?"lstm_cell/BiasAdd_1/ReadVariableOp?lstm_cell/MatMul/ReadVariableOp?!lstm_cell/MatMul_1/ReadVariableOp?!lstm_cell/MatMul_2/ReadVariableOp?!lstm_cell/MatMul_3/ReadVariableOp?$rnn/lstm_cell/BiasAdd/ReadVariableOp?#rnn/lstm_cell/MatMul/ReadVariableOp?%rnn/lstm_cell/MatMul_1/ReadVariableOp?	rnn/whileL
	rnn/ShapeShapeinputs*
T0*
_output_shapes
:2
	rnn/Shape|
rnn/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
rnn/strided_slice/stack?
rnn/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
rnn/strided_slice/stack_1?
rnn/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
rnn/strided_slice/stack_2?
rnn/strided_sliceStridedSlicernn/Shape:output:0 rnn/strided_slice/stack:output:0"rnn/strided_slice/stack_1:output:0"rnn/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
rnn/strided_sliced
rnn/zeros/mul/yConst*
_output_shapes
: *
dtype0*
value	B : 2
rnn/zeros/mul/y|
rnn/zeros/mulMulrnn/strided_slice:output:0rnn/zeros/mul/y:output:0*
T0*
_output_shapes
: 2
rnn/zeros/mulg
rnn/zeros/Less/yConst*
_output_shapes
: *
dtype0*
value
B :?2
rnn/zeros/Less/yw
rnn/zeros/LessLessrnn/zeros/mul:z:0rnn/zeros/Less/y:output:0*
T0*
_output_shapes
: 2
rnn/zeros/Lessj
rnn/zeros/packed/1Const*
_output_shapes
: *
dtype0*
value	B : 2
rnn/zeros/packed/1?
rnn/zeros/packedPackrnn/strided_slice:output:0rnn/zeros/packed/1:output:0*
N*
T0*
_output_shapes
:2
rnn/zeros/packedg
rnn/zeros/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    2
rnn/zeros/Const?
	rnn/zerosFillrnn/zeros/packed:output:0rnn/zeros/Const:output:0*
T0*'
_output_shapes
:????????? 2
	rnn/zerosh
rnn/zeros_1/mul/yConst*
_output_shapes
: *
dtype0*
value	B : 2
rnn/zeros_1/mul/y?
rnn/zeros_1/mulMulrnn/strided_slice:output:0rnn/zeros_1/mul/y:output:0*
T0*
_output_shapes
: 2
rnn/zeros_1/mulk
rnn/zeros_1/Less/yConst*
_output_shapes
: *
dtype0*
value
B :?2
rnn/zeros_1/Less/y
rnn/zeros_1/LessLessrnn/zeros_1/mul:z:0rnn/zeros_1/Less/y:output:0*
T0*
_output_shapes
: 2
rnn/zeros_1/Lessn
rnn/zeros_1/packed/1Const*
_output_shapes
: *
dtype0*
value	B : 2
rnn/zeros_1/packed/1?
rnn/zeros_1/packedPackrnn/strided_slice:output:0rnn/zeros_1/packed/1:output:0*
N*
T0*
_output_shapes
:2
rnn/zeros_1/packedk
rnn/zeros_1/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    2
rnn/zeros_1/Const?
rnn/zeros_1Fillrnn/zeros_1/packed:output:0rnn/zeros_1/Const:output:0*
T0*'
_output_shapes
:????????? 2
rnn/zeros_1}
rnn/transpose/permConst*
_output_shapes
:*
dtype0*!
valueB"          2
rnn/transpose/perm?
rnn/transpose	Transposeinputsrnn/transpose/perm:output:0*
T0*4
_output_shapes"
 :??????????????????32
rnn/transpose[
rnn/Shape_1Shapernn/transpose:y:0*
T0*
_output_shapes
:2
rnn/Shape_1?
rnn/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
rnn/strided_slice_1/stack?
rnn/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
rnn/strided_slice_1/stack_1?
rnn/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
rnn/strided_slice_1/stack_2?
rnn/strided_slice_1StridedSlicernn/Shape_1:output:0"rnn/strided_slice_1/stack:output:0$rnn/strided_slice_1/stack_1:output:0$rnn/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
rnn/strided_slice_1?
rnn/TensorArrayV2/element_shapeConst*
_output_shapes
: *
dtype0*
valueB :
?????????2!
rnn/TensorArrayV2/element_shape?
rnn/TensorArrayV2TensorListReserve(rnn/TensorArrayV2/element_shape:output:0rnn/strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type02
rnn/TensorArrayV2?
9rnn/TensorArrayUnstack/TensorListFromTensor/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????3   2;
9rnn/TensorArrayUnstack/TensorListFromTensor/element_shape?
+rnn/TensorArrayUnstack/TensorListFromTensorTensorListFromTensorrnn/transpose:y:0Brnn/TensorArrayUnstack/TensorListFromTensor/element_shape:output:0*
_output_shapes
: *
element_dtype0*

shape_type02-
+rnn/TensorArrayUnstack/TensorListFromTensor?
rnn/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
rnn/strided_slice_2/stack?
rnn/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
rnn/strided_slice_2/stack_1?
rnn/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
rnn/strided_slice_2/stack_2?
rnn/strided_slice_2StridedSlicernn/transpose:y:0"rnn/strided_slice_2/stack:output:0$rnn/strided_slice_2/stack_1:output:0$rnn/strided_slice_2/stack_2:output:0*
Index0*
T0*'
_output_shapes
:?????????3*
shrink_axis_mask2
rnn/strided_slice_2?
#rnn/lstm_cell/MatMul/ReadVariableOpReadVariableOp,rnn_lstm_cell_matmul_readvariableop_resource*
_output_shapes
:	3?*
dtype02%
#rnn/lstm_cell/MatMul/ReadVariableOp?
rnn/lstm_cell/MatMulMatMulrnn/strided_slice_2:output:0+rnn/lstm_cell/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????2
rnn/lstm_cell/MatMul?
%rnn/lstm_cell/MatMul_1/ReadVariableOpReadVariableOp.rnn_lstm_cell_matmul_1_readvariableop_resource*
_output_shapes
:	 ?*
dtype02'
%rnn/lstm_cell/MatMul_1/ReadVariableOp?
rnn/lstm_cell/MatMul_1MatMulrnn/zeros:output:0-rnn/lstm_cell/MatMul_1/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????2
rnn/lstm_cell/MatMul_1?
rnn/lstm_cell/addAddV2rnn/lstm_cell/MatMul:product:0 rnn/lstm_cell/MatMul_1:product:0*
T0*(
_output_shapes
:??????????2
rnn/lstm_cell/add?
$rnn/lstm_cell/BiasAdd/ReadVariableOpReadVariableOp-rnn_lstm_cell_biasadd_readvariableop_resource*
_output_shapes	
:?*
dtype02&
$rnn/lstm_cell/BiasAdd/ReadVariableOp?
rnn/lstm_cell/BiasAddBiasAddrnn/lstm_cell/add:z:0,rnn/lstm_cell/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????2
rnn/lstm_cell/BiasAdd?
rnn/lstm_cell/split/split_dimConst*
_output_shapes
: *
dtype0*
value	B :2
rnn/lstm_cell/split/split_dim?
rnn/lstm_cell/splitSplit&rnn/lstm_cell/split/split_dim:output:0rnn/lstm_cell/BiasAdd:output:0*
T0*`
_output_shapesN
L:????????? :????????? :????????? :????????? *
	num_split2
rnn/lstm_cell/split?
rnn/lstm_cell/SigmoidSigmoidrnn/lstm_cell/split:output:0*
T0*'
_output_shapes
:????????? 2
rnn/lstm_cell/Sigmoid?
rnn/lstm_cell/Sigmoid_1Sigmoidrnn/lstm_cell/split:output:1*
T0*'
_output_shapes
:????????? 2
rnn/lstm_cell/Sigmoid_1?
rnn/lstm_cell/mulMulrnn/lstm_cell/Sigmoid_1:y:0rnn/zeros_1:output:0*
T0*'
_output_shapes
:????????? 2
rnn/lstm_cell/mul?
rnn/lstm_cell/TanhTanhrnn/lstm_cell/split:output:2*
T0*'
_output_shapes
:????????? 2
rnn/lstm_cell/Tanh?
rnn/lstm_cell/mul_1Mulrnn/lstm_cell/Sigmoid:y:0rnn/lstm_cell/Tanh:y:0*
T0*'
_output_shapes
:????????? 2
rnn/lstm_cell/mul_1?
rnn/lstm_cell/add_1AddV2rnn/lstm_cell/mul:z:0rnn/lstm_cell/mul_1:z:0*
T0*'
_output_shapes
:????????? 2
rnn/lstm_cell/add_1?
rnn/lstm_cell/Sigmoid_2Sigmoidrnn/lstm_cell/split:output:3*
T0*'
_output_shapes
:????????? 2
rnn/lstm_cell/Sigmoid_2
rnn/lstm_cell/Tanh_1Tanhrnn/lstm_cell/add_1:z:0*
T0*'
_output_shapes
:????????? 2
rnn/lstm_cell/Tanh_1?
rnn/lstm_cell/mul_2Mulrnn/lstm_cell/Sigmoid_2:y:0rnn/lstm_cell/Tanh_1:y:0*
T0*'
_output_shapes
:????????? 2
rnn/lstm_cell/mul_2?
!rnn/TensorArrayV2_1/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????    2#
!rnn/TensorArrayV2_1/element_shape?
rnn/TensorArrayV2_1TensorListReserve*rnn/TensorArrayV2_1/element_shape:output:0rnn/strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type02
rnn/TensorArrayV2_1V
rnn/timeConst*
_output_shapes
: *
dtype0*
value	B : 2

rnn/time?
rnn/while/maximum_iterationsConst*
_output_shapes
: *
dtype0*
valueB :
?????????2
rnn/while/maximum_iterationsr
rnn/while/loop_counterConst*
_output_shapes
: *
dtype0*
value	B : 2
rnn/while/loop_counter?
	rnn/whileWhilernn/while/loop_counter:output:0%rnn/while/maximum_iterations:output:0rnn/time:output:0rnn/TensorArrayV2_1:handle:0rnn/zeros:output:0rnn/zeros_1:output:0rnn/strided_slice_1:output:0;rnn/TensorArrayUnstack/TensorListFromTensor:output_handle:0,rnn_lstm_cell_matmul_readvariableop_resource.rnn_lstm_cell_matmul_1_readvariableop_resource-rnn_lstm_cell_biasadd_readvariableop_resource*
T
2*
_lower_using_switch_merge(*
_num_original_outputs*L
_output_shapes:
8: : : : :????????? :????????? : : : : : *%
_read_only_resource_inputs
	
*
bodyR
rnn_while_body_8975*
condR
rnn_while_cond_8974*K
output_shapes:
8: : : : :????????? :????????? : : : : : *
parallel_iterations 2
	rnn/while?
4rnn/TensorArrayV2Stack/TensorListStack/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????    26
4rnn/TensorArrayV2Stack/TensorListStack/element_shape?
&rnn/TensorArrayV2Stack/TensorListStackTensorListStackrnn/while:output:3=rnn/TensorArrayV2Stack/TensorListStack/element_shape:output:0*4
_output_shapes"
 :?????????????????? *
element_dtype02(
&rnn/TensorArrayV2Stack/TensorListStack?
rnn/strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB:
?????????2
rnn/strided_slice_3/stack?
rnn/strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 2
rnn/strided_slice_3/stack_1?
rnn/strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
rnn/strided_slice_3/stack_2?
rnn/strided_slice_3StridedSlice/rnn/TensorArrayV2Stack/TensorListStack:tensor:0"rnn/strided_slice_3/stack:output:0$rnn/strided_slice_3/stack_1:output:0$rnn/strided_slice_3/stack_2:output:0*
Index0*
T0*'
_output_shapes
:????????? *
shrink_axis_mask2
rnn/strided_slice_3?
rnn/transpose_1/permConst*
_output_shapes
:*
dtype0*!
valueB"          2
rnn/transpose_1/perm?
rnn/transpose_1	Transpose/rnn/TensorArrayV2Stack/TensorListStack:tensor:0rnn/transpose_1/perm:output:0*
T0*4
_output_shapes"
 :?????????????????? 2
rnn/transpose_1?
dense_1/MatMul/ReadVariableOpReadVariableOp&dense_1_matmul_readvariableop_resource*
_output_shapes

: 3*
dtype02
dense_1/MatMul/ReadVariableOp?
dense_1/MatMulMatMulrnn/strided_slice_3:output:0%dense_1/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????32
dense_1/MatMul?
dense_1/BiasAdd/ReadVariableOpReadVariableOp'dense_1_biasadd_readvariableop_resource*
_output_shapes
:3*
dtype02 
dense_1/BiasAdd/ReadVariableOp?
dense_1/BiasAddBiasAdddense_1/MatMul:product:0&dense_1/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????32
dense_1/BiasAdd?
lstm_cell/MatMul/ReadVariableOpReadVariableOp,rnn_lstm_cell_matmul_readvariableop_resource*
_output_shapes
:	3?*
dtype02!
lstm_cell/MatMul/ReadVariableOp?
lstm_cell/MatMulMatMuldense_1/BiasAdd:output:0'lstm_cell/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????2
lstm_cell/MatMul?
!lstm_cell/MatMul_1/ReadVariableOpReadVariableOp.rnn_lstm_cell_matmul_1_readvariableop_resource*
_output_shapes
:	 ?*
dtype02#
!lstm_cell/MatMul_1/ReadVariableOp?
lstm_cell/MatMul_1MatMulrnn/while:output:4)lstm_cell/MatMul_1/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????2
lstm_cell/MatMul_1?
lstm_cell/addAddV2lstm_cell/MatMul:product:0lstm_cell/MatMul_1:product:0*
T0*(
_output_shapes
:??????????2
lstm_cell/add?
 lstm_cell/BiasAdd/ReadVariableOpReadVariableOp-rnn_lstm_cell_biasadd_readvariableop_resource*
_output_shapes	
:?*
dtype02"
 lstm_cell/BiasAdd/ReadVariableOp?
lstm_cell/BiasAddBiasAddlstm_cell/add:z:0(lstm_cell/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????2
lstm_cell/BiasAddx
lstm_cell/split/split_dimConst*
_output_shapes
: *
dtype0*
value	B :2
lstm_cell/split/split_dim?
lstm_cell/splitSplit"lstm_cell/split/split_dim:output:0lstm_cell/BiasAdd:output:0*
T0*`
_output_shapesN
L:????????? :????????? :????????? :????????? *
	num_split2
lstm_cell/split}
lstm_cell/SigmoidSigmoidlstm_cell/split:output:0*
T0*'
_output_shapes
:????????? 2
lstm_cell/Sigmoid?
lstm_cell/Sigmoid_1Sigmoidlstm_cell/split:output:1*
T0*'
_output_shapes
:????????? 2
lstm_cell/Sigmoid_1?
lstm_cell/mulMullstm_cell/Sigmoid_1:y:0rnn/while:output:5*
T0*'
_output_shapes
:????????? 2
lstm_cell/mult
lstm_cell/TanhTanhlstm_cell/split:output:2*
T0*'
_output_shapes
:????????? 2
lstm_cell/Tanh?
lstm_cell/mul_1Mullstm_cell/Sigmoid:y:0lstm_cell/Tanh:y:0*
T0*'
_output_shapes
:????????? 2
lstm_cell/mul_1?
lstm_cell/add_1AddV2lstm_cell/mul:z:0lstm_cell/mul_1:z:0*
T0*'
_output_shapes
:????????? 2
lstm_cell/add_1?
lstm_cell/Sigmoid_2Sigmoidlstm_cell/split:output:3*
T0*'
_output_shapes
:????????? 2
lstm_cell/Sigmoid_2s
lstm_cell/Tanh_1Tanhlstm_cell/add_1:z:0*
T0*'
_output_shapes
:????????? 2
lstm_cell/Tanh_1?
lstm_cell/mul_2Mullstm_cell/Sigmoid_2:y:0lstm_cell/Tanh_1:y:0*
T0*'
_output_shapes
:????????? 2
lstm_cell/mul_2?
dense_1/MatMul_1/ReadVariableOpReadVariableOp&dense_1_matmul_readvariableop_resource*
_output_shapes

: 3*
dtype02!
dense_1/MatMul_1/ReadVariableOp?
dense_1/MatMul_1MatMullstm_cell/mul_2:z:0'dense_1/MatMul_1/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????32
dense_1/MatMul_1?
 dense_1/BiasAdd_1/ReadVariableOpReadVariableOp'dense_1_biasadd_readvariableop_resource*
_output_shapes
:3*
dtype02"
 dense_1/BiasAdd_1/ReadVariableOp?
dense_1/BiasAdd_1BiasAdddense_1/MatMul_1:product:0(dense_1/BiasAdd_1/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????32
dense_1/BiasAdd_1?
!lstm_cell/MatMul_2/ReadVariableOpReadVariableOp,rnn_lstm_cell_matmul_readvariableop_resource*
_output_shapes
:	3?*
dtype02#
!lstm_cell/MatMul_2/ReadVariableOp?
lstm_cell/MatMul_2MatMuldense_1/BiasAdd_1:output:0)lstm_cell/MatMul_2/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????2
lstm_cell/MatMul_2?
!lstm_cell/MatMul_3/ReadVariableOpReadVariableOp.rnn_lstm_cell_matmul_1_readvariableop_resource*
_output_shapes
:	 ?*
dtype02#
!lstm_cell/MatMul_3/ReadVariableOp?
lstm_cell/MatMul_3MatMullstm_cell/mul_2:z:0)lstm_cell/MatMul_3/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????2
lstm_cell/MatMul_3?
lstm_cell/add_2AddV2lstm_cell/MatMul_2:product:0lstm_cell/MatMul_3:product:0*
T0*(
_output_shapes
:??????????2
lstm_cell/add_2?
"lstm_cell/BiasAdd_1/ReadVariableOpReadVariableOp-rnn_lstm_cell_biasadd_readvariableop_resource*
_output_shapes	
:?*
dtype02$
"lstm_cell/BiasAdd_1/ReadVariableOp?
lstm_cell/BiasAdd_1BiasAddlstm_cell/add_2:z:0*lstm_cell/BiasAdd_1/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????2
lstm_cell/BiasAdd_1|
lstm_cell/split_1/split_dimConst*
_output_shapes
: *
dtype0*
value	B :2
lstm_cell/split_1/split_dim?
lstm_cell/split_1Split$lstm_cell/split_1/split_dim:output:0lstm_cell/BiasAdd_1:output:0*
T0*`
_output_shapesN
L:????????? :????????? :????????? :????????? *
	num_split2
lstm_cell/split_1?
lstm_cell/Sigmoid_3Sigmoidlstm_cell/split_1:output:0*
T0*'
_output_shapes
:????????? 2
lstm_cell/Sigmoid_3?
lstm_cell/Sigmoid_4Sigmoidlstm_cell/split_1:output:1*
T0*'
_output_shapes
:????????? 2
lstm_cell/Sigmoid_4?
lstm_cell/mul_3Mullstm_cell/Sigmoid_4:y:0lstm_cell/add_1:z:0*
T0*'
_output_shapes
:????????? 2
lstm_cell/mul_3z
lstm_cell/Tanh_2Tanhlstm_cell/split_1:output:2*
T0*'
_output_shapes
:????????? 2
lstm_cell/Tanh_2?
lstm_cell/mul_4Mullstm_cell/Sigmoid_3:y:0lstm_cell/Tanh_2:y:0*
T0*'
_output_shapes
:????????? 2
lstm_cell/mul_4?
lstm_cell/add_3AddV2lstm_cell/mul_3:z:0lstm_cell/mul_4:z:0*
T0*'
_output_shapes
:????????? 2
lstm_cell/add_3?
lstm_cell/Sigmoid_5Sigmoidlstm_cell/split_1:output:3*
T0*'
_output_shapes
:????????? 2
lstm_cell/Sigmoid_5s
lstm_cell/Tanh_3Tanhlstm_cell/add_3:z:0*
T0*'
_output_shapes
:????????? 2
lstm_cell/Tanh_3?
lstm_cell/mul_5Mullstm_cell/Sigmoid_5:y:0lstm_cell/Tanh_3:y:0*
T0*'
_output_shapes
:????????? 2
lstm_cell/mul_5?
dense_1/MatMul_2/ReadVariableOpReadVariableOp&dense_1_matmul_readvariableop_resource*
_output_shapes

: 3*
dtype02!
dense_1/MatMul_2/ReadVariableOp?
dense_1/MatMul_2MatMullstm_cell/mul_5:z:0'dense_1/MatMul_2/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????32
dense_1/MatMul_2?
 dense_1/BiasAdd_2/ReadVariableOpReadVariableOp'dense_1_biasadd_readvariableop_resource*
_output_shapes
:3*
dtype02"
 dense_1/BiasAdd_2/ReadVariableOp?
dense_1/BiasAdd_2BiasAdddense_1/MatMul_2:product:0(dense_1/BiasAdd_2/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????32
dense_1/BiasAdd_2?
stackPackdense_1/BiasAdd:output:0dense_1/BiasAdd_1:output:0dense_1/BiasAdd_2:output:0*
N*
T0*+
_output_shapes
:?????????32
stacku
transpose/permConst*
_output_shapes
:*
dtype0*!
valueB"          2
transpose/perm?
	transpose	Transposestack:output:0transpose/perm:output:0*
T0*+
_output_shapes
:?????????32
	transpose?
IdentityIdentitytranspose:y:0^dense_1/BiasAdd/ReadVariableOp!^dense_1/BiasAdd_1/ReadVariableOp!^dense_1/BiasAdd_2/ReadVariableOp^dense_1/MatMul/ReadVariableOp ^dense_1/MatMul_1/ReadVariableOp ^dense_1/MatMul_2/ReadVariableOp!^lstm_cell/BiasAdd/ReadVariableOp#^lstm_cell/BiasAdd_1/ReadVariableOp ^lstm_cell/MatMul/ReadVariableOp"^lstm_cell/MatMul_1/ReadVariableOp"^lstm_cell/MatMul_2/ReadVariableOp"^lstm_cell/MatMul_3/ReadVariableOp%^rnn/lstm_cell/BiasAdd/ReadVariableOp$^rnn/lstm_cell/MatMul/ReadVariableOp&^rnn/lstm_cell/MatMul_1/ReadVariableOp
^rnn/while*
T0*+
_output_shapes
:?????????32

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*=
_input_shapes,
*:??????????????????3: : : : : 2@
dense_1/BiasAdd/ReadVariableOpdense_1/BiasAdd/ReadVariableOp2D
 dense_1/BiasAdd_1/ReadVariableOp dense_1/BiasAdd_1/ReadVariableOp2D
 dense_1/BiasAdd_2/ReadVariableOp dense_1/BiasAdd_2/ReadVariableOp2>
dense_1/MatMul/ReadVariableOpdense_1/MatMul/ReadVariableOp2B
dense_1/MatMul_1/ReadVariableOpdense_1/MatMul_1/ReadVariableOp2B
dense_1/MatMul_2/ReadVariableOpdense_1/MatMul_2/ReadVariableOp2D
 lstm_cell/BiasAdd/ReadVariableOp lstm_cell/BiasAdd/ReadVariableOp2H
"lstm_cell/BiasAdd_1/ReadVariableOp"lstm_cell/BiasAdd_1/ReadVariableOp2B
lstm_cell/MatMul/ReadVariableOplstm_cell/MatMul/ReadVariableOp2F
!lstm_cell/MatMul_1/ReadVariableOp!lstm_cell/MatMul_1/ReadVariableOp2F
!lstm_cell/MatMul_2/ReadVariableOp!lstm_cell/MatMul_2/ReadVariableOp2F
!lstm_cell/MatMul_3/ReadVariableOp!lstm_cell/MatMul_3/ReadVariableOp2L
$rnn/lstm_cell/BiasAdd/ReadVariableOp$rnn/lstm_cell/BiasAdd/ReadVariableOp2J
#rnn/lstm_cell/MatMul/ReadVariableOp#rnn/lstm_cell/MatMul/ReadVariableOp2N
%rnn/lstm_cell/MatMul_1/ReadVariableOp%rnn/lstm_cell/MatMul_1/ReadVariableOp2
	rnn/while	rnn/while:\ X
4
_output_shapes"
 :??????????????????3
 
_user_specified_nameinputs
?G
?
=__inference_rnn_layer_call_and_return_conditional_losses_7972

inputs!
lstm_cell_7889:	3?!
lstm_cell_7891:	 ?
lstm_cell_7893:	?
identity

identity_1

identity_2??!lstm_cell/StatefulPartitionedCall?whileD
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
strided_slice\
zeros/mul/yConst*
_output_shapes
: *
dtype0*
value	B : 2
zeros/mul/yl
	zeros/mulMulstrided_slice:output:0zeros/mul/y:output:0*
T0*
_output_shapes
: 2
	zeros/mul_
zeros/Less/yConst*
_output_shapes
: *
dtype0*
value
B :?2
zeros/Less/yg

zeros/LessLesszeros/mul:z:0zeros/Less/y:output:0*
T0*
_output_shapes
: 2

zeros/Lessb
zeros/packed/1Const*
_output_shapes
: *
dtype0*
value	B : 2
zeros/packed/1?
zeros/packedPackstrided_slice:output:0zeros/packed/1:output:0*
N*
T0*
_output_shapes
:2
zeros/packed_
zeros/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    2
zeros/Constu
zerosFillzeros/packed:output:0zeros/Const:output:0*
T0*'
_output_shapes
:????????? 2
zeros`
zeros_1/mul/yConst*
_output_shapes
: *
dtype0*
value	B : 2
zeros_1/mul/yr
zeros_1/mulMulstrided_slice:output:0zeros_1/mul/y:output:0*
T0*
_output_shapes
: 2
zeros_1/mulc
zeros_1/Less/yConst*
_output_shapes
: *
dtype0*
value
B :?2
zeros_1/Less/yo
zeros_1/LessLesszeros_1/mul:z:0zeros_1/Less/y:output:0*
T0*
_output_shapes
: 2
zeros_1/Lessf
zeros_1/packed/1Const*
_output_shapes
: *
dtype0*
value	B : 2
zeros_1/packed/1?
zeros_1/packedPackstrided_slice:output:0zeros_1/packed/1:output:0*
N*
T0*
_output_shapes
:2
zeros_1/packedc
zeros_1/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    2
zeros_1/Const}
zeros_1Fillzeros_1/packed:output:0zeros_1/Const:output:0*
T0*'
_output_shapes
:????????? 2	
zeros_1u
transpose/permConst*
_output_shapes
:*
dtype0*!
valueB"          2
transpose/perm?
	transpose	Transposeinputstranspose/perm:output:0*
T0*4
_output_shapes"
 :??????????????????32
	transposeO
Shape_1Shapetranspose:y:0*
T0*
_output_shapes
:2	
Shape_1x
strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice_1/stack|
strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_1/stack_1|
strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_1/stack_2?
strided_slice_1StridedSliceShape_1:output:0strided_slice_1/stack:output:0 strided_slice_1/stack_1:output:0 strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
strided_slice_1?
TensorArrayV2/element_shapeConst*
_output_shapes
: *
dtype0*
valueB :
?????????2
TensorArrayV2/element_shape?
TensorArrayV2TensorListReserve$TensorArrayV2/element_shape:output:0strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type02
TensorArrayV2?
5TensorArrayUnstack/TensorListFromTensor/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????3   27
5TensorArrayUnstack/TensorListFromTensor/element_shape?
'TensorArrayUnstack/TensorListFromTensorTensorListFromTensortranspose:y:0>TensorArrayUnstack/TensorListFromTensor/element_shape:output:0*
_output_shapes
: *
element_dtype0*

shape_type02)
'TensorArrayUnstack/TensorListFromTensorx
strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice_2/stack|
strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_2/stack_1|
strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_2/stack_2?
strided_slice_2StridedSlicetranspose:y:0strided_slice_2/stack:output:0 strided_slice_2/stack_1:output:0 strided_slice_2/stack_2:output:0*
Index0*
T0*'
_output_shapes
:?????????3*
shrink_axis_mask2
strided_slice_2?
!lstm_cell/StatefulPartitionedCallStatefulPartitionedCallstrided_slice_2:output:0zeros:output:0zeros_1:output:0lstm_cell_7889lstm_cell_7891lstm_cell_7893*
Tin

2*
Tout
2*
_collective_manager_ids
 *M
_output_shapes;
9:????????? :????????? :????????? *%
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *L
fGRE
C__inference_lstm_cell_layer_call_and_return_conditional_losses_78202#
!lstm_cell/StatefulPartitionedCall?
TensorArrayV2_1/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????    2
TensorArrayV2_1/element_shape?
TensorArrayV2_1TensorListReserve&TensorArrayV2_1/element_shape:output:0strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type02
TensorArrayV2_1N
timeConst*
_output_shapes
: *
dtype0*
value	B : 2
time
while/maximum_iterationsConst*
_output_shapes
: *
dtype0*
valueB :
?????????2
while/maximum_iterationsj
while/loop_counterConst*
_output_shapes
: *
dtype0*
value	B : 2
while/loop_counter?
whileWhilewhile/loop_counter:output:0!while/maximum_iterations:output:0time:output:0TensorArrayV2_1:handle:0zeros:output:0zeros_1:output:0strided_slice_1:output:07TensorArrayUnstack/TensorListFromTensor:output_handle:0lstm_cell_7889lstm_cell_7891lstm_cell_7893*
T
2*
_lower_using_switch_merge(*
_num_original_outputs*L
_output_shapes:
8: : : : :????????? :????????? : : : : : *%
_read_only_resource_inputs
	
*
bodyR
while_body_7902*
condR
while_cond_7901*K
output_shapes:
8: : : : :????????? :????????? : : : : : *
parallel_iterations 2
while?
0TensorArrayV2Stack/TensorListStack/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????    22
0TensorArrayV2Stack/TensorListStack/element_shape?
"TensorArrayV2Stack/TensorListStackTensorListStackwhile:output:39TensorArrayV2Stack/TensorListStack/element_shape:output:0*4
_output_shapes"
 :?????????????????? *
element_dtype02$
"TensorArrayV2Stack/TensorListStack?
strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB:
?????????2
strided_slice_3/stack|
strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice_3/stack_1|
strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_3/stack_2?
strided_slice_3StridedSlice+TensorArrayV2Stack/TensorListStack:tensor:0strided_slice_3/stack:output:0 strided_slice_3/stack_1:output:0 strided_slice_3/stack_2:output:0*
Index0*
T0*'
_output_shapes
:????????? *
shrink_axis_mask2
strided_slice_3y
transpose_1/permConst*
_output_shapes
:*
dtype0*!
valueB"          2
transpose_1/perm?
transpose_1	Transpose+TensorArrayV2Stack/TensorListStack:tensor:0transpose_1/perm:output:0*
T0*4
_output_shapes"
 :?????????????????? 2
transpose_1?
IdentityIdentitystrided_slice_3:output:0"^lstm_cell/StatefulPartitionedCall^while*
T0*'
_output_shapes
:????????? 2

Identity?

Identity_1Identitywhile:output:4"^lstm_cell/StatefulPartitionedCall^while*
T0*'
_output_shapes
:????????? 2

Identity_1?

Identity_2Identitywhile:output:5"^lstm_cell/StatefulPartitionedCall^while*
T0*'
_output_shapes
:????????? 2

Identity_2"
identityIdentity:output:0"!

identity_1Identity_1:output:0"!

identity_2Identity_2:output:0*(
_construction_contextkEagerRuntime*9
_input_shapes(
&:??????????????????3: : : 2F
!lstm_cell/StatefulPartitionedCall!lstm_cell/StatefulPartitionedCall2
whilewhile:\ X
4
_output_shapes"
 :??????????????????3
 
_user_specified_nameinputs
?
?
while_cond_10104
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_placeholder_2
while_placeholder_3
while_less_strided_slice_13
/while_while_cond_10104___redundant_placeholder03
/while_while_cond_10104___redundant_placeholder13
/while_while_cond_10104___redundant_placeholder23
/while_while_cond_10104___redundant_placeholder3
while_identity
p

while/LessLesswhile_placeholderwhile_less_strided_slice_1*
T0*
_output_shapes
: 2

while/Less]
while/IdentityIdentitywhile/Less:z:0*
T0
*
_output_shapes
: 2
while/Identity")
while_identitywhile/Identity:output:0*(
_construction_contextkEagerRuntime*S
_input_shapesB
@: : : : :????????? :????????? : ::::: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :-)
'
_output_shapes
:????????? :-)
'
_output_shapes
:????????? :

_output_shapes
: :

_output_shapes
:
?\
?
=__inference_rnn_layer_call_and_return_conditional_losses_9886
inputs_0;
(lstm_cell_matmul_readvariableop_resource:	3?=
*lstm_cell_matmul_1_readvariableop_resource:	 ?8
)lstm_cell_biasadd_readvariableop_resource:	?
identity

identity_1

identity_2?? lstm_cell/BiasAdd/ReadVariableOp?lstm_cell/MatMul/ReadVariableOp?!lstm_cell/MatMul_1/ReadVariableOp?whileF
ShapeShapeinputs_0*
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
strided_slice\
zeros/mul/yConst*
_output_shapes
: *
dtype0*
value	B : 2
zeros/mul/yl
	zeros/mulMulstrided_slice:output:0zeros/mul/y:output:0*
T0*
_output_shapes
: 2
	zeros/mul_
zeros/Less/yConst*
_output_shapes
: *
dtype0*
value
B :?2
zeros/Less/yg

zeros/LessLesszeros/mul:z:0zeros/Less/y:output:0*
T0*
_output_shapes
: 2

zeros/Lessb
zeros/packed/1Const*
_output_shapes
: *
dtype0*
value	B : 2
zeros/packed/1?
zeros/packedPackstrided_slice:output:0zeros/packed/1:output:0*
N*
T0*
_output_shapes
:2
zeros/packed_
zeros/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    2
zeros/Constu
zerosFillzeros/packed:output:0zeros/Const:output:0*
T0*'
_output_shapes
:????????? 2
zeros`
zeros_1/mul/yConst*
_output_shapes
: *
dtype0*
value	B : 2
zeros_1/mul/yr
zeros_1/mulMulstrided_slice:output:0zeros_1/mul/y:output:0*
T0*
_output_shapes
: 2
zeros_1/mulc
zeros_1/Less/yConst*
_output_shapes
: *
dtype0*
value
B :?2
zeros_1/Less/yo
zeros_1/LessLesszeros_1/mul:z:0zeros_1/Less/y:output:0*
T0*
_output_shapes
: 2
zeros_1/Lessf
zeros_1/packed/1Const*
_output_shapes
: *
dtype0*
value	B : 2
zeros_1/packed/1?
zeros_1/packedPackstrided_slice:output:0zeros_1/packed/1:output:0*
N*
T0*
_output_shapes
:2
zeros_1/packedc
zeros_1/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    2
zeros_1/Const}
zeros_1Fillzeros_1/packed:output:0zeros_1/Const:output:0*
T0*'
_output_shapes
:????????? 2	
zeros_1u
transpose/permConst*
_output_shapes
:*
dtype0*!
valueB"          2
transpose/perm?
	transpose	Transposeinputs_0transpose/perm:output:0*
T0*4
_output_shapes"
 :??????????????????32
	transposeO
Shape_1Shapetranspose:y:0*
T0*
_output_shapes
:2	
Shape_1x
strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice_1/stack|
strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_1/stack_1|
strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_1/stack_2?
strided_slice_1StridedSliceShape_1:output:0strided_slice_1/stack:output:0 strided_slice_1/stack_1:output:0 strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
strided_slice_1?
TensorArrayV2/element_shapeConst*
_output_shapes
: *
dtype0*
valueB :
?????????2
TensorArrayV2/element_shape?
TensorArrayV2TensorListReserve$TensorArrayV2/element_shape:output:0strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type02
TensorArrayV2?
5TensorArrayUnstack/TensorListFromTensor/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????3   27
5TensorArrayUnstack/TensorListFromTensor/element_shape?
'TensorArrayUnstack/TensorListFromTensorTensorListFromTensortranspose:y:0>TensorArrayUnstack/TensorListFromTensor/element_shape:output:0*
_output_shapes
: *
element_dtype0*

shape_type02)
'TensorArrayUnstack/TensorListFromTensorx
strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice_2/stack|
strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_2/stack_1|
strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_2/stack_2?
strided_slice_2StridedSlicetranspose:y:0strided_slice_2/stack:output:0 strided_slice_2/stack_1:output:0 strided_slice_2/stack_2:output:0*
Index0*
T0*'
_output_shapes
:?????????3*
shrink_axis_mask2
strided_slice_2?
lstm_cell/MatMul/ReadVariableOpReadVariableOp(lstm_cell_matmul_readvariableop_resource*
_output_shapes
:	3?*
dtype02!
lstm_cell/MatMul/ReadVariableOp?
lstm_cell/MatMulMatMulstrided_slice_2:output:0'lstm_cell/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????2
lstm_cell/MatMul?
!lstm_cell/MatMul_1/ReadVariableOpReadVariableOp*lstm_cell_matmul_1_readvariableop_resource*
_output_shapes
:	 ?*
dtype02#
!lstm_cell/MatMul_1/ReadVariableOp?
lstm_cell/MatMul_1MatMulzeros:output:0)lstm_cell/MatMul_1/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????2
lstm_cell/MatMul_1?
lstm_cell/addAddV2lstm_cell/MatMul:product:0lstm_cell/MatMul_1:product:0*
T0*(
_output_shapes
:??????????2
lstm_cell/add?
 lstm_cell/BiasAdd/ReadVariableOpReadVariableOp)lstm_cell_biasadd_readvariableop_resource*
_output_shapes	
:?*
dtype02"
 lstm_cell/BiasAdd/ReadVariableOp?
lstm_cell/BiasAddBiasAddlstm_cell/add:z:0(lstm_cell/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????2
lstm_cell/BiasAddx
lstm_cell/split/split_dimConst*
_output_shapes
: *
dtype0*
value	B :2
lstm_cell/split/split_dim?
lstm_cell/splitSplit"lstm_cell/split/split_dim:output:0lstm_cell/BiasAdd:output:0*
T0*`
_output_shapesN
L:????????? :????????? :????????? :????????? *
	num_split2
lstm_cell/split}
lstm_cell/SigmoidSigmoidlstm_cell/split:output:0*
T0*'
_output_shapes
:????????? 2
lstm_cell/Sigmoid?
lstm_cell/Sigmoid_1Sigmoidlstm_cell/split:output:1*
T0*'
_output_shapes
:????????? 2
lstm_cell/Sigmoid_1?
lstm_cell/mulMullstm_cell/Sigmoid_1:y:0zeros_1:output:0*
T0*'
_output_shapes
:????????? 2
lstm_cell/mult
lstm_cell/TanhTanhlstm_cell/split:output:2*
T0*'
_output_shapes
:????????? 2
lstm_cell/Tanh?
lstm_cell/mul_1Mullstm_cell/Sigmoid:y:0lstm_cell/Tanh:y:0*
T0*'
_output_shapes
:????????? 2
lstm_cell/mul_1?
lstm_cell/add_1AddV2lstm_cell/mul:z:0lstm_cell/mul_1:z:0*
T0*'
_output_shapes
:????????? 2
lstm_cell/add_1?
lstm_cell/Sigmoid_2Sigmoidlstm_cell/split:output:3*
T0*'
_output_shapes
:????????? 2
lstm_cell/Sigmoid_2s
lstm_cell/Tanh_1Tanhlstm_cell/add_1:z:0*
T0*'
_output_shapes
:????????? 2
lstm_cell/Tanh_1?
lstm_cell/mul_2Mullstm_cell/Sigmoid_2:y:0lstm_cell/Tanh_1:y:0*
T0*'
_output_shapes
:????????? 2
lstm_cell/mul_2?
TensorArrayV2_1/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????    2
TensorArrayV2_1/element_shape?
TensorArrayV2_1TensorListReserve&TensorArrayV2_1/element_shape:output:0strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type02
TensorArrayV2_1N
timeConst*
_output_shapes
: *
dtype0*
value	B : 2
time
while/maximum_iterationsConst*
_output_shapes
: *
dtype0*
valueB :
?????????2
while/maximum_iterationsj
while/loop_counterConst*
_output_shapes
: *
dtype0*
value	B : 2
while/loop_counter?
whileWhilewhile/loop_counter:output:0!while/maximum_iterations:output:0time:output:0TensorArrayV2_1:handle:0zeros:output:0zeros_1:output:0strided_slice_1:output:07TensorArrayUnstack/TensorListFromTensor:output_handle:0(lstm_cell_matmul_readvariableop_resource*lstm_cell_matmul_1_readvariableop_resource)lstm_cell_biasadd_readvariableop_resource*
T
2*
_lower_using_switch_merge(*
_num_original_outputs*L
_output_shapes:
8: : : : :????????? :????????? : : : : : *%
_read_only_resource_inputs
	
*
bodyR
while_body_9801*
condR
while_cond_9800*K
output_shapes:
8: : : : :????????? :????????? : : : : : *
parallel_iterations 2
while?
0TensorArrayV2Stack/TensorListStack/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????    22
0TensorArrayV2Stack/TensorListStack/element_shape?
"TensorArrayV2Stack/TensorListStackTensorListStackwhile:output:39TensorArrayV2Stack/TensorListStack/element_shape:output:0*4
_output_shapes"
 :?????????????????? *
element_dtype02$
"TensorArrayV2Stack/TensorListStack?
strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB:
?????????2
strided_slice_3/stack|
strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice_3/stack_1|
strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_3/stack_2?
strided_slice_3StridedSlice+TensorArrayV2Stack/TensorListStack:tensor:0strided_slice_3/stack:output:0 strided_slice_3/stack_1:output:0 strided_slice_3/stack_2:output:0*
Index0*
T0*'
_output_shapes
:????????? *
shrink_axis_mask2
strided_slice_3y
transpose_1/permConst*
_output_shapes
:*
dtype0*!
valueB"          2
transpose_1/perm?
transpose_1	Transpose+TensorArrayV2Stack/TensorListStack:tensor:0transpose_1/perm:output:0*
T0*4
_output_shapes"
 :?????????????????? 2
transpose_1?
IdentityIdentitystrided_slice_3:output:0!^lstm_cell/BiasAdd/ReadVariableOp ^lstm_cell/MatMul/ReadVariableOp"^lstm_cell/MatMul_1/ReadVariableOp^while*
T0*'
_output_shapes
:????????? 2

Identity?

Identity_1Identitywhile:output:4!^lstm_cell/BiasAdd/ReadVariableOp ^lstm_cell/MatMul/ReadVariableOp"^lstm_cell/MatMul_1/ReadVariableOp^while*
T0*'
_output_shapes
:????????? 2

Identity_1?

Identity_2Identitywhile:output:5!^lstm_cell/BiasAdd/ReadVariableOp ^lstm_cell/MatMul/ReadVariableOp"^lstm_cell/MatMul_1/ReadVariableOp^while*
T0*'
_output_shapes
:????????? 2

Identity_2"
identityIdentity:output:0"!

identity_1Identity_1:output:0"!

identity_2Identity_2:output:0*(
_construction_contextkEagerRuntime*9
_input_shapes(
&:??????????????????3: : : 2D
 lstm_cell/BiasAdd/ReadVariableOp lstm_cell/BiasAdd/ReadVariableOp2B
lstm_cell/MatMul/ReadVariableOplstm_cell/MatMul/ReadVariableOp2F
!lstm_cell/MatMul_1/ReadVariableOp!lstm_cell/MatMul_1/ReadVariableOp2
whilewhile:^ Z
4
_output_shapes"
 :??????????????????3
"
_user_specified_name
inputs/0
?
?
&__inference_AR_LSTM_layer_call_fn_8777
input_1
unknown:	3?
	unknown_0:	 ?
	unknown_1:	?
	unknown_2: 3
	unknown_3:3
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinput_1unknown	unknown_0	unknown_1	unknown_2	unknown_3*
Tin

2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:?????????3*'
_read_only_resource_inputs	
*-
config_proto

CPU

GPU 2J 8? *J
fERC
A__inference_AR_LSTM_layer_call_and_return_conditional_losses_87492
StatefulPartitionedCall?
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*+
_output_shapes
:?????????32

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*=
_input_shapes,
*:??????????????????3: : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:] Y
4
_output_shapes"
 :??????????????????3
!
_user_specified_name	input_1
??
?
A__inference_AR_LSTM_layer_call_and_return_conditional_losses_9326

inputs?
,rnn_lstm_cell_matmul_readvariableop_resource:	3?A
.rnn_lstm_cell_matmul_1_readvariableop_resource:	 ?<
-rnn_lstm_cell_biasadd_readvariableop_resource:	?8
&dense_1_matmul_readvariableop_resource: 35
'dense_1_biasadd_readvariableop_resource:3
identity??dense_1/BiasAdd/ReadVariableOp? dense_1/BiasAdd_1/ReadVariableOp? dense_1/BiasAdd_2/ReadVariableOp?dense_1/MatMul/ReadVariableOp?dense_1/MatMul_1/ReadVariableOp?dense_1/MatMul_2/ReadVariableOp? lstm_cell/BiasAdd/ReadVariableOp?"lstm_cell/BiasAdd_1/ReadVariableOp?lstm_cell/MatMul/ReadVariableOp?!lstm_cell/MatMul_1/ReadVariableOp?!lstm_cell/MatMul_2/ReadVariableOp?!lstm_cell/MatMul_3/ReadVariableOp?$rnn/lstm_cell/BiasAdd/ReadVariableOp?#rnn/lstm_cell/MatMul/ReadVariableOp?%rnn/lstm_cell/MatMul_1/ReadVariableOp?	rnn/whileL
	rnn/ShapeShapeinputs*
T0*
_output_shapes
:2
	rnn/Shape|
rnn/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
rnn/strided_slice/stack?
rnn/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
rnn/strided_slice/stack_1?
rnn/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
rnn/strided_slice/stack_2?
rnn/strided_sliceStridedSlicernn/Shape:output:0 rnn/strided_slice/stack:output:0"rnn/strided_slice/stack_1:output:0"rnn/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
rnn/strided_sliced
rnn/zeros/mul/yConst*
_output_shapes
: *
dtype0*
value	B : 2
rnn/zeros/mul/y|
rnn/zeros/mulMulrnn/strided_slice:output:0rnn/zeros/mul/y:output:0*
T0*
_output_shapes
: 2
rnn/zeros/mulg
rnn/zeros/Less/yConst*
_output_shapes
: *
dtype0*
value
B :?2
rnn/zeros/Less/yw
rnn/zeros/LessLessrnn/zeros/mul:z:0rnn/zeros/Less/y:output:0*
T0*
_output_shapes
: 2
rnn/zeros/Lessj
rnn/zeros/packed/1Const*
_output_shapes
: *
dtype0*
value	B : 2
rnn/zeros/packed/1?
rnn/zeros/packedPackrnn/strided_slice:output:0rnn/zeros/packed/1:output:0*
N*
T0*
_output_shapes
:2
rnn/zeros/packedg
rnn/zeros/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    2
rnn/zeros/Const?
	rnn/zerosFillrnn/zeros/packed:output:0rnn/zeros/Const:output:0*
T0*'
_output_shapes
:????????? 2
	rnn/zerosh
rnn/zeros_1/mul/yConst*
_output_shapes
: *
dtype0*
value	B : 2
rnn/zeros_1/mul/y?
rnn/zeros_1/mulMulrnn/strided_slice:output:0rnn/zeros_1/mul/y:output:0*
T0*
_output_shapes
: 2
rnn/zeros_1/mulk
rnn/zeros_1/Less/yConst*
_output_shapes
: *
dtype0*
value
B :?2
rnn/zeros_1/Less/y
rnn/zeros_1/LessLessrnn/zeros_1/mul:z:0rnn/zeros_1/Less/y:output:0*
T0*
_output_shapes
: 2
rnn/zeros_1/Lessn
rnn/zeros_1/packed/1Const*
_output_shapes
: *
dtype0*
value	B : 2
rnn/zeros_1/packed/1?
rnn/zeros_1/packedPackrnn/strided_slice:output:0rnn/zeros_1/packed/1:output:0*
N*
T0*
_output_shapes
:2
rnn/zeros_1/packedk
rnn/zeros_1/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    2
rnn/zeros_1/Const?
rnn/zeros_1Fillrnn/zeros_1/packed:output:0rnn/zeros_1/Const:output:0*
T0*'
_output_shapes
:????????? 2
rnn/zeros_1}
rnn/transpose/permConst*
_output_shapes
:*
dtype0*!
valueB"          2
rnn/transpose/perm?
rnn/transpose	Transposeinputsrnn/transpose/perm:output:0*
T0*4
_output_shapes"
 :??????????????????32
rnn/transpose[
rnn/Shape_1Shapernn/transpose:y:0*
T0*
_output_shapes
:2
rnn/Shape_1?
rnn/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
rnn/strided_slice_1/stack?
rnn/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
rnn/strided_slice_1/stack_1?
rnn/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
rnn/strided_slice_1/stack_2?
rnn/strided_slice_1StridedSlicernn/Shape_1:output:0"rnn/strided_slice_1/stack:output:0$rnn/strided_slice_1/stack_1:output:0$rnn/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
rnn/strided_slice_1?
rnn/TensorArrayV2/element_shapeConst*
_output_shapes
: *
dtype0*
valueB :
?????????2!
rnn/TensorArrayV2/element_shape?
rnn/TensorArrayV2TensorListReserve(rnn/TensorArrayV2/element_shape:output:0rnn/strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type02
rnn/TensorArrayV2?
9rnn/TensorArrayUnstack/TensorListFromTensor/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????3   2;
9rnn/TensorArrayUnstack/TensorListFromTensor/element_shape?
+rnn/TensorArrayUnstack/TensorListFromTensorTensorListFromTensorrnn/transpose:y:0Brnn/TensorArrayUnstack/TensorListFromTensor/element_shape:output:0*
_output_shapes
: *
element_dtype0*

shape_type02-
+rnn/TensorArrayUnstack/TensorListFromTensor?
rnn/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
rnn/strided_slice_2/stack?
rnn/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
rnn/strided_slice_2/stack_1?
rnn/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
rnn/strided_slice_2/stack_2?
rnn/strided_slice_2StridedSlicernn/transpose:y:0"rnn/strided_slice_2/stack:output:0$rnn/strided_slice_2/stack_1:output:0$rnn/strided_slice_2/stack_2:output:0*
Index0*
T0*'
_output_shapes
:?????????3*
shrink_axis_mask2
rnn/strided_slice_2?
#rnn/lstm_cell/MatMul/ReadVariableOpReadVariableOp,rnn_lstm_cell_matmul_readvariableop_resource*
_output_shapes
:	3?*
dtype02%
#rnn/lstm_cell/MatMul/ReadVariableOp?
rnn/lstm_cell/MatMulMatMulrnn/strided_slice_2:output:0+rnn/lstm_cell/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????2
rnn/lstm_cell/MatMul?
%rnn/lstm_cell/MatMul_1/ReadVariableOpReadVariableOp.rnn_lstm_cell_matmul_1_readvariableop_resource*
_output_shapes
:	 ?*
dtype02'
%rnn/lstm_cell/MatMul_1/ReadVariableOp?
rnn/lstm_cell/MatMul_1MatMulrnn/zeros:output:0-rnn/lstm_cell/MatMul_1/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????2
rnn/lstm_cell/MatMul_1?
rnn/lstm_cell/addAddV2rnn/lstm_cell/MatMul:product:0 rnn/lstm_cell/MatMul_1:product:0*
T0*(
_output_shapes
:??????????2
rnn/lstm_cell/add?
$rnn/lstm_cell/BiasAdd/ReadVariableOpReadVariableOp-rnn_lstm_cell_biasadd_readvariableop_resource*
_output_shapes	
:?*
dtype02&
$rnn/lstm_cell/BiasAdd/ReadVariableOp?
rnn/lstm_cell/BiasAddBiasAddrnn/lstm_cell/add:z:0,rnn/lstm_cell/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????2
rnn/lstm_cell/BiasAdd?
rnn/lstm_cell/split/split_dimConst*
_output_shapes
: *
dtype0*
value	B :2
rnn/lstm_cell/split/split_dim?
rnn/lstm_cell/splitSplit&rnn/lstm_cell/split/split_dim:output:0rnn/lstm_cell/BiasAdd:output:0*
T0*`
_output_shapesN
L:????????? :????????? :????????? :????????? *
	num_split2
rnn/lstm_cell/split?
rnn/lstm_cell/SigmoidSigmoidrnn/lstm_cell/split:output:0*
T0*'
_output_shapes
:????????? 2
rnn/lstm_cell/Sigmoid?
rnn/lstm_cell/Sigmoid_1Sigmoidrnn/lstm_cell/split:output:1*
T0*'
_output_shapes
:????????? 2
rnn/lstm_cell/Sigmoid_1?
rnn/lstm_cell/mulMulrnn/lstm_cell/Sigmoid_1:y:0rnn/zeros_1:output:0*
T0*'
_output_shapes
:????????? 2
rnn/lstm_cell/mul?
rnn/lstm_cell/TanhTanhrnn/lstm_cell/split:output:2*
T0*'
_output_shapes
:????????? 2
rnn/lstm_cell/Tanh?
rnn/lstm_cell/mul_1Mulrnn/lstm_cell/Sigmoid:y:0rnn/lstm_cell/Tanh:y:0*
T0*'
_output_shapes
:????????? 2
rnn/lstm_cell/mul_1?
rnn/lstm_cell/add_1AddV2rnn/lstm_cell/mul:z:0rnn/lstm_cell/mul_1:z:0*
T0*'
_output_shapes
:????????? 2
rnn/lstm_cell/add_1?
rnn/lstm_cell/Sigmoid_2Sigmoidrnn/lstm_cell/split:output:3*
T0*'
_output_shapes
:????????? 2
rnn/lstm_cell/Sigmoid_2
rnn/lstm_cell/Tanh_1Tanhrnn/lstm_cell/add_1:z:0*
T0*'
_output_shapes
:????????? 2
rnn/lstm_cell/Tanh_1?
rnn/lstm_cell/mul_2Mulrnn/lstm_cell/Sigmoid_2:y:0rnn/lstm_cell/Tanh_1:y:0*
T0*'
_output_shapes
:????????? 2
rnn/lstm_cell/mul_2?
!rnn/TensorArrayV2_1/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????    2#
!rnn/TensorArrayV2_1/element_shape?
rnn/TensorArrayV2_1TensorListReserve*rnn/TensorArrayV2_1/element_shape:output:0rnn/strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type02
rnn/TensorArrayV2_1V
rnn/timeConst*
_output_shapes
: *
dtype0*
value	B : 2

rnn/time?
rnn/while/maximum_iterationsConst*
_output_shapes
: *
dtype0*
valueB :
?????????2
rnn/while/maximum_iterationsr
rnn/while/loop_counterConst*
_output_shapes
: *
dtype0*
value	B : 2
rnn/while/loop_counter?
	rnn/whileWhilernn/while/loop_counter:output:0%rnn/while/maximum_iterations:output:0rnn/time:output:0rnn/TensorArrayV2_1:handle:0rnn/zeros:output:0rnn/zeros_1:output:0rnn/strided_slice_1:output:0;rnn/TensorArrayUnstack/TensorListFromTensor:output_handle:0,rnn_lstm_cell_matmul_readvariableop_resource.rnn_lstm_cell_matmul_1_readvariableop_resource-rnn_lstm_cell_biasadd_readvariableop_resource*
T
2*
_lower_using_switch_merge(*
_num_original_outputs*L
_output_shapes:
8: : : : :????????? :????????? : : : : : *%
_read_only_resource_inputs
	
*
bodyR
rnn_while_body_9184*
condR
rnn_while_cond_9183*K
output_shapes:
8: : : : :????????? :????????? : : : : : *
parallel_iterations 2
	rnn/while?
4rnn/TensorArrayV2Stack/TensorListStack/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????    26
4rnn/TensorArrayV2Stack/TensorListStack/element_shape?
&rnn/TensorArrayV2Stack/TensorListStackTensorListStackrnn/while:output:3=rnn/TensorArrayV2Stack/TensorListStack/element_shape:output:0*4
_output_shapes"
 :?????????????????? *
element_dtype02(
&rnn/TensorArrayV2Stack/TensorListStack?
rnn/strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB:
?????????2
rnn/strided_slice_3/stack?
rnn/strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 2
rnn/strided_slice_3/stack_1?
rnn/strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
rnn/strided_slice_3/stack_2?
rnn/strided_slice_3StridedSlice/rnn/TensorArrayV2Stack/TensorListStack:tensor:0"rnn/strided_slice_3/stack:output:0$rnn/strided_slice_3/stack_1:output:0$rnn/strided_slice_3/stack_2:output:0*
Index0*
T0*'
_output_shapes
:????????? *
shrink_axis_mask2
rnn/strided_slice_3?
rnn/transpose_1/permConst*
_output_shapes
:*
dtype0*!
valueB"          2
rnn/transpose_1/perm?
rnn/transpose_1	Transpose/rnn/TensorArrayV2Stack/TensorListStack:tensor:0rnn/transpose_1/perm:output:0*
T0*4
_output_shapes"
 :?????????????????? 2
rnn/transpose_1?
dense_1/MatMul/ReadVariableOpReadVariableOp&dense_1_matmul_readvariableop_resource*
_output_shapes

: 3*
dtype02
dense_1/MatMul/ReadVariableOp?
dense_1/MatMulMatMulrnn/strided_slice_3:output:0%dense_1/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????32
dense_1/MatMul?
dense_1/BiasAdd/ReadVariableOpReadVariableOp'dense_1_biasadd_readvariableop_resource*
_output_shapes
:3*
dtype02 
dense_1/BiasAdd/ReadVariableOp?
dense_1/BiasAddBiasAdddense_1/MatMul:product:0&dense_1/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????32
dense_1/BiasAdd?
lstm_cell/MatMul/ReadVariableOpReadVariableOp,rnn_lstm_cell_matmul_readvariableop_resource*
_output_shapes
:	3?*
dtype02!
lstm_cell/MatMul/ReadVariableOp?
lstm_cell/MatMulMatMuldense_1/BiasAdd:output:0'lstm_cell/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????2
lstm_cell/MatMul?
!lstm_cell/MatMul_1/ReadVariableOpReadVariableOp.rnn_lstm_cell_matmul_1_readvariableop_resource*
_output_shapes
:	 ?*
dtype02#
!lstm_cell/MatMul_1/ReadVariableOp?
lstm_cell/MatMul_1MatMulrnn/while:output:4)lstm_cell/MatMul_1/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????2
lstm_cell/MatMul_1?
lstm_cell/addAddV2lstm_cell/MatMul:product:0lstm_cell/MatMul_1:product:0*
T0*(
_output_shapes
:??????????2
lstm_cell/add?
 lstm_cell/BiasAdd/ReadVariableOpReadVariableOp-rnn_lstm_cell_biasadd_readvariableop_resource*
_output_shapes	
:?*
dtype02"
 lstm_cell/BiasAdd/ReadVariableOp?
lstm_cell/BiasAddBiasAddlstm_cell/add:z:0(lstm_cell/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????2
lstm_cell/BiasAddx
lstm_cell/split/split_dimConst*
_output_shapes
: *
dtype0*
value	B :2
lstm_cell/split/split_dim?
lstm_cell/splitSplit"lstm_cell/split/split_dim:output:0lstm_cell/BiasAdd:output:0*
T0*`
_output_shapesN
L:????????? :????????? :????????? :????????? *
	num_split2
lstm_cell/split}
lstm_cell/SigmoidSigmoidlstm_cell/split:output:0*
T0*'
_output_shapes
:????????? 2
lstm_cell/Sigmoid?
lstm_cell/Sigmoid_1Sigmoidlstm_cell/split:output:1*
T0*'
_output_shapes
:????????? 2
lstm_cell/Sigmoid_1?
lstm_cell/mulMullstm_cell/Sigmoid_1:y:0rnn/while:output:5*
T0*'
_output_shapes
:????????? 2
lstm_cell/mult
lstm_cell/TanhTanhlstm_cell/split:output:2*
T0*'
_output_shapes
:????????? 2
lstm_cell/Tanh?
lstm_cell/mul_1Mullstm_cell/Sigmoid:y:0lstm_cell/Tanh:y:0*
T0*'
_output_shapes
:????????? 2
lstm_cell/mul_1?
lstm_cell/add_1AddV2lstm_cell/mul:z:0lstm_cell/mul_1:z:0*
T0*'
_output_shapes
:????????? 2
lstm_cell/add_1?
lstm_cell/Sigmoid_2Sigmoidlstm_cell/split:output:3*
T0*'
_output_shapes
:????????? 2
lstm_cell/Sigmoid_2s
lstm_cell/Tanh_1Tanhlstm_cell/add_1:z:0*
T0*'
_output_shapes
:????????? 2
lstm_cell/Tanh_1?
lstm_cell/mul_2Mullstm_cell/Sigmoid_2:y:0lstm_cell/Tanh_1:y:0*
T0*'
_output_shapes
:????????? 2
lstm_cell/mul_2?
dense_1/MatMul_1/ReadVariableOpReadVariableOp&dense_1_matmul_readvariableop_resource*
_output_shapes

: 3*
dtype02!
dense_1/MatMul_1/ReadVariableOp?
dense_1/MatMul_1MatMullstm_cell/mul_2:z:0'dense_1/MatMul_1/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????32
dense_1/MatMul_1?
 dense_1/BiasAdd_1/ReadVariableOpReadVariableOp'dense_1_biasadd_readvariableop_resource*
_output_shapes
:3*
dtype02"
 dense_1/BiasAdd_1/ReadVariableOp?
dense_1/BiasAdd_1BiasAdddense_1/MatMul_1:product:0(dense_1/BiasAdd_1/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????32
dense_1/BiasAdd_1?
!lstm_cell/MatMul_2/ReadVariableOpReadVariableOp,rnn_lstm_cell_matmul_readvariableop_resource*
_output_shapes
:	3?*
dtype02#
!lstm_cell/MatMul_2/ReadVariableOp?
lstm_cell/MatMul_2MatMuldense_1/BiasAdd_1:output:0)lstm_cell/MatMul_2/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????2
lstm_cell/MatMul_2?
!lstm_cell/MatMul_3/ReadVariableOpReadVariableOp.rnn_lstm_cell_matmul_1_readvariableop_resource*
_output_shapes
:	 ?*
dtype02#
!lstm_cell/MatMul_3/ReadVariableOp?
lstm_cell/MatMul_3MatMullstm_cell/mul_2:z:0)lstm_cell/MatMul_3/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????2
lstm_cell/MatMul_3?
lstm_cell/add_2AddV2lstm_cell/MatMul_2:product:0lstm_cell/MatMul_3:product:0*
T0*(
_output_shapes
:??????????2
lstm_cell/add_2?
"lstm_cell/BiasAdd_1/ReadVariableOpReadVariableOp-rnn_lstm_cell_biasadd_readvariableop_resource*
_output_shapes	
:?*
dtype02$
"lstm_cell/BiasAdd_1/ReadVariableOp?
lstm_cell/BiasAdd_1BiasAddlstm_cell/add_2:z:0*lstm_cell/BiasAdd_1/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????2
lstm_cell/BiasAdd_1|
lstm_cell/split_1/split_dimConst*
_output_shapes
: *
dtype0*
value	B :2
lstm_cell/split_1/split_dim?
lstm_cell/split_1Split$lstm_cell/split_1/split_dim:output:0lstm_cell/BiasAdd_1:output:0*
T0*`
_output_shapesN
L:????????? :????????? :????????? :????????? *
	num_split2
lstm_cell/split_1?
lstm_cell/Sigmoid_3Sigmoidlstm_cell/split_1:output:0*
T0*'
_output_shapes
:????????? 2
lstm_cell/Sigmoid_3?
lstm_cell/Sigmoid_4Sigmoidlstm_cell/split_1:output:1*
T0*'
_output_shapes
:????????? 2
lstm_cell/Sigmoid_4?
lstm_cell/mul_3Mullstm_cell/Sigmoid_4:y:0lstm_cell/add_1:z:0*
T0*'
_output_shapes
:????????? 2
lstm_cell/mul_3z
lstm_cell/Tanh_2Tanhlstm_cell/split_1:output:2*
T0*'
_output_shapes
:????????? 2
lstm_cell/Tanh_2?
lstm_cell/mul_4Mullstm_cell/Sigmoid_3:y:0lstm_cell/Tanh_2:y:0*
T0*'
_output_shapes
:????????? 2
lstm_cell/mul_4?
lstm_cell/add_3AddV2lstm_cell/mul_3:z:0lstm_cell/mul_4:z:0*
T0*'
_output_shapes
:????????? 2
lstm_cell/add_3?
lstm_cell/Sigmoid_5Sigmoidlstm_cell/split_1:output:3*
T0*'
_output_shapes
:????????? 2
lstm_cell/Sigmoid_5s
lstm_cell/Tanh_3Tanhlstm_cell/add_3:z:0*
T0*'
_output_shapes
:????????? 2
lstm_cell/Tanh_3?
lstm_cell/mul_5Mullstm_cell/Sigmoid_5:y:0lstm_cell/Tanh_3:y:0*
T0*'
_output_shapes
:????????? 2
lstm_cell/mul_5?
dense_1/MatMul_2/ReadVariableOpReadVariableOp&dense_1_matmul_readvariableop_resource*
_output_shapes

: 3*
dtype02!
dense_1/MatMul_2/ReadVariableOp?
dense_1/MatMul_2MatMullstm_cell/mul_5:z:0'dense_1/MatMul_2/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????32
dense_1/MatMul_2?
 dense_1/BiasAdd_2/ReadVariableOpReadVariableOp'dense_1_biasadd_readvariableop_resource*
_output_shapes
:3*
dtype02"
 dense_1/BiasAdd_2/ReadVariableOp?
dense_1/BiasAdd_2BiasAdddense_1/MatMul_2:product:0(dense_1/BiasAdd_2/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????32
dense_1/BiasAdd_2?
stackPackdense_1/BiasAdd:output:0dense_1/BiasAdd_1:output:0dense_1/BiasAdd_2:output:0*
N*
T0*+
_output_shapes
:?????????32
stacku
transpose/permConst*
_output_shapes
:*
dtype0*!
valueB"          2
transpose/perm?
	transpose	Transposestack:output:0transpose/perm:output:0*
T0*+
_output_shapes
:?????????32
	transpose?
IdentityIdentitytranspose:y:0^dense_1/BiasAdd/ReadVariableOp!^dense_1/BiasAdd_1/ReadVariableOp!^dense_1/BiasAdd_2/ReadVariableOp^dense_1/MatMul/ReadVariableOp ^dense_1/MatMul_1/ReadVariableOp ^dense_1/MatMul_2/ReadVariableOp!^lstm_cell/BiasAdd/ReadVariableOp#^lstm_cell/BiasAdd_1/ReadVariableOp ^lstm_cell/MatMul/ReadVariableOp"^lstm_cell/MatMul_1/ReadVariableOp"^lstm_cell/MatMul_2/ReadVariableOp"^lstm_cell/MatMul_3/ReadVariableOp%^rnn/lstm_cell/BiasAdd/ReadVariableOp$^rnn/lstm_cell/MatMul/ReadVariableOp&^rnn/lstm_cell/MatMul_1/ReadVariableOp
^rnn/while*
T0*+
_output_shapes
:?????????32

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*=
_input_shapes,
*:??????????????????3: : : : : 2@
dense_1/BiasAdd/ReadVariableOpdense_1/BiasAdd/ReadVariableOp2D
 dense_1/BiasAdd_1/ReadVariableOp dense_1/BiasAdd_1/ReadVariableOp2D
 dense_1/BiasAdd_2/ReadVariableOp dense_1/BiasAdd_2/ReadVariableOp2>
dense_1/MatMul/ReadVariableOpdense_1/MatMul/ReadVariableOp2B
dense_1/MatMul_1/ReadVariableOpdense_1/MatMul_1/ReadVariableOp2B
dense_1/MatMul_2/ReadVariableOpdense_1/MatMul_2/ReadVariableOp2D
 lstm_cell/BiasAdd/ReadVariableOp lstm_cell/BiasAdd/ReadVariableOp2H
"lstm_cell/BiasAdd_1/ReadVariableOp"lstm_cell/BiasAdd_1/ReadVariableOp2B
lstm_cell/MatMul/ReadVariableOplstm_cell/MatMul/ReadVariableOp2F
!lstm_cell/MatMul_1/ReadVariableOp!lstm_cell/MatMul_1/ReadVariableOp2F
!lstm_cell/MatMul_2/ReadVariableOp!lstm_cell/MatMul_2/ReadVariableOp2F
!lstm_cell/MatMul_3/ReadVariableOp!lstm_cell/MatMul_3/ReadVariableOp2L
$rnn/lstm_cell/BiasAdd/ReadVariableOp$rnn/lstm_cell/BiasAdd/ReadVariableOp2J
#rnn/lstm_cell/MatMul/ReadVariableOp#rnn/lstm_cell/MatMul/ReadVariableOp2N
%rnn/lstm_cell/MatMul_1/ReadVariableOp%rnn/lstm_cell/MatMul_1/ReadVariableOp2
	rnn/while	rnn/while:\ X
4
_output_shapes"
 :??????????????????3
 
_user_specified_nameinputs
??
?
__inference__wrapped_model_7594
input_1G
4ar_lstm_rnn_lstm_cell_matmul_readvariableop_resource:	3?I
6ar_lstm_rnn_lstm_cell_matmul_1_readvariableop_resource:	 ?D
5ar_lstm_rnn_lstm_cell_biasadd_readvariableop_resource:	?@
.ar_lstm_dense_1_matmul_readvariableop_resource: 3=
/ar_lstm_dense_1_biasadd_readvariableop_resource:3
identity??&AR_LSTM/dense_1/BiasAdd/ReadVariableOp?(AR_LSTM/dense_1/BiasAdd_1/ReadVariableOp?(AR_LSTM/dense_1/BiasAdd_2/ReadVariableOp?%AR_LSTM/dense_1/MatMul/ReadVariableOp?'AR_LSTM/dense_1/MatMul_1/ReadVariableOp?'AR_LSTM/dense_1/MatMul_2/ReadVariableOp?(AR_LSTM/lstm_cell/BiasAdd/ReadVariableOp?*AR_LSTM/lstm_cell/BiasAdd_1/ReadVariableOp?'AR_LSTM/lstm_cell/MatMul/ReadVariableOp?)AR_LSTM/lstm_cell/MatMul_1/ReadVariableOp?)AR_LSTM/lstm_cell/MatMul_2/ReadVariableOp?)AR_LSTM/lstm_cell/MatMul_3/ReadVariableOp?,AR_LSTM/rnn/lstm_cell/BiasAdd/ReadVariableOp?+AR_LSTM/rnn/lstm_cell/MatMul/ReadVariableOp?-AR_LSTM/rnn/lstm_cell/MatMul_1/ReadVariableOp?AR_LSTM/rnn/while]
AR_LSTM/rnn/ShapeShapeinput_1*
T0*
_output_shapes
:2
AR_LSTM/rnn/Shape?
AR_LSTM/rnn/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2!
AR_LSTM/rnn/strided_slice/stack?
!AR_LSTM/rnn/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2#
!AR_LSTM/rnn/strided_slice/stack_1?
!AR_LSTM/rnn/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2#
!AR_LSTM/rnn/strided_slice/stack_2?
AR_LSTM/rnn/strided_sliceStridedSliceAR_LSTM/rnn/Shape:output:0(AR_LSTM/rnn/strided_slice/stack:output:0*AR_LSTM/rnn/strided_slice/stack_1:output:0*AR_LSTM/rnn/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
AR_LSTM/rnn/strided_slicet
AR_LSTM/rnn/zeros/mul/yConst*
_output_shapes
: *
dtype0*
value	B : 2
AR_LSTM/rnn/zeros/mul/y?
AR_LSTM/rnn/zeros/mulMul"AR_LSTM/rnn/strided_slice:output:0 AR_LSTM/rnn/zeros/mul/y:output:0*
T0*
_output_shapes
: 2
AR_LSTM/rnn/zeros/mulw
AR_LSTM/rnn/zeros/Less/yConst*
_output_shapes
: *
dtype0*
value
B :?2
AR_LSTM/rnn/zeros/Less/y?
AR_LSTM/rnn/zeros/LessLessAR_LSTM/rnn/zeros/mul:z:0!AR_LSTM/rnn/zeros/Less/y:output:0*
T0*
_output_shapes
: 2
AR_LSTM/rnn/zeros/Lessz
AR_LSTM/rnn/zeros/packed/1Const*
_output_shapes
: *
dtype0*
value	B : 2
AR_LSTM/rnn/zeros/packed/1?
AR_LSTM/rnn/zeros/packedPack"AR_LSTM/rnn/strided_slice:output:0#AR_LSTM/rnn/zeros/packed/1:output:0*
N*
T0*
_output_shapes
:2
AR_LSTM/rnn/zeros/packedw
AR_LSTM/rnn/zeros/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    2
AR_LSTM/rnn/zeros/Const?
AR_LSTM/rnn/zerosFill!AR_LSTM/rnn/zeros/packed:output:0 AR_LSTM/rnn/zeros/Const:output:0*
T0*'
_output_shapes
:????????? 2
AR_LSTM/rnn/zerosx
AR_LSTM/rnn/zeros_1/mul/yConst*
_output_shapes
: *
dtype0*
value	B : 2
AR_LSTM/rnn/zeros_1/mul/y?
AR_LSTM/rnn/zeros_1/mulMul"AR_LSTM/rnn/strided_slice:output:0"AR_LSTM/rnn/zeros_1/mul/y:output:0*
T0*
_output_shapes
: 2
AR_LSTM/rnn/zeros_1/mul{
AR_LSTM/rnn/zeros_1/Less/yConst*
_output_shapes
: *
dtype0*
value
B :?2
AR_LSTM/rnn/zeros_1/Less/y?
AR_LSTM/rnn/zeros_1/LessLessAR_LSTM/rnn/zeros_1/mul:z:0#AR_LSTM/rnn/zeros_1/Less/y:output:0*
T0*
_output_shapes
: 2
AR_LSTM/rnn/zeros_1/Less~
AR_LSTM/rnn/zeros_1/packed/1Const*
_output_shapes
: *
dtype0*
value	B : 2
AR_LSTM/rnn/zeros_1/packed/1?
AR_LSTM/rnn/zeros_1/packedPack"AR_LSTM/rnn/strided_slice:output:0%AR_LSTM/rnn/zeros_1/packed/1:output:0*
N*
T0*
_output_shapes
:2
AR_LSTM/rnn/zeros_1/packed{
AR_LSTM/rnn/zeros_1/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    2
AR_LSTM/rnn/zeros_1/Const?
AR_LSTM/rnn/zeros_1Fill#AR_LSTM/rnn/zeros_1/packed:output:0"AR_LSTM/rnn/zeros_1/Const:output:0*
T0*'
_output_shapes
:????????? 2
AR_LSTM/rnn/zeros_1?
AR_LSTM/rnn/transpose/permConst*
_output_shapes
:*
dtype0*!
valueB"          2
AR_LSTM/rnn/transpose/perm?
AR_LSTM/rnn/transpose	Transposeinput_1#AR_LSTM/rnn/transpose/perm:output:0*
T0*4
_output_shapes"
 :??????????????????32
AR_LSTM/rnn/transposes
AR_LSTM/rnn/Shape_1ShapeAR_LSTM/rnn/transpose:y:0*
T0*
_output_shapes
:2
AR_LSTM/rnn/Shape_1?
!AR_LSTM/rnn/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 2#
!AR_LSTM/rnn/strided_slice_1/stack?
#AR_LSTM/rnn/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2%
#AR_LSTM/rnn/strided_slice_1/stack_1?
#AR_LSTM/rnn/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2%
#AR_LSTM/rnn/strided_slice_1/stack_2?
AR_LSTM/rnn/strided_slice_1StridedSliceAR_LSTM/rnn/Shape_1:output:0*AR_LSTM/rnn/strided_slice_1/stack:output:0,AR_LSTM/rnn/strided_slice_1/stack_1:output:0,AR_LSTM/rnn/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
AR_LSTM/rnn/strided_slice_1?
'AR_LSTM/rnn/TensorArrayV2/element_shapeConst*
_output_shapes
: *
dtype0*
valueB :
?????????2)
'AR_LSTM/rnn/TensorArrayV2/element_shape?
AR_LSTM/rnn/TensorArrayV2TensorListReserve0AR_LSTM/rnn/TensorArrayV2/element_shape:output:0$AR_LSTM/rnn/strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type02
AR_LSTM/rnn/TensorArrayV2?
AAR_LSTM/rnn/TensorArrayUnstack/TensorListFromTensor/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????3   2C
AAR_LSTM/rnn/TensorArrayUnstack/TensorListFromTensor/element_shape?
3AR_LSTM/rnn/TensorArrayUnstack/TensorListFromTensorTensorListFromTensorAR_LSTM/rnn/transpose:y:0JAR_LSTM/rnn/TensorArrayUnstack/TensorListFromTensor/element_shape:output:0*
_output_shapes
: *
element_dtype0*

shape_type025
3AR_LSTM/rnn/TensorArrayUnstack/TensorListFromTensor?
!AR_LSTM/rnn/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: 2#
!AR_LSTM/rnn/strided_slice_2/stack?
#AR_LSTM/rnn/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2%
#AR_LSTM/rnn/strided_slice_2/stack_1?
#AR_LSTM/rnn/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2%
#AR_LSTM/rnn/strided_slice_2/stack_2?
AR_LSTM/rnn/strided_slice_2StridedSliceAR_LSTM/rnn/transpose:y:0*AR_LSTM/rnn/strided_slice_2/stack:output:0,AR_LSTM/rnn/strided_slice_2/stack_1:output:0,AR_LSTM/rnn/strided_slice_2/stack_2:output:0*
Index0*
T0*'
_output_shapes
:?????????3*
shrink_axis_mask2
AR_LSTM/rnn/strided_slice_2?
+AR_LSTM/rnn/lstm_cell/MatMul/ReadVariableOpReadVariableOp4ar_lstm_rnn_lstm_cell_matmul_readvariableop_resource*
_output_shapes
:	3?*
dtype02-
+AR_LSTM/rnn/lstm_cell/MatMul/ReadVariableOp?
AR_LSTM/rnn/lstm_cell/MatMulMatMul$AR_LSTM/rnn/strided_slice_2:output:03AR_LSTM/rnn/lstm_cell/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????2
AR_LSTM/rnn/lstm_cell/MatMul?
-AR_LSTM/rnn/lstm_cell/MatMul_1/ReadVariableOpReadVariableOp6ar_lstm_rnn_lstm_cell_matmul_1_readvariableop_resource*
_output_shapes
:	 ?*
dtype02/
-AR_LSTM/rnn/lstm_cell/MatMul_1/ReadVariableOp?
AR_LSTM/rnn/lstm_cell/MatMul_1MatMulAR_LSTM/rnn/zeros:output:05AR_LSTM/rnn/lstm_cell/MatMul_1/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????2 
AR_LSTM/rnn/lstm_cell/MatMul_1?
AR_LSTM/rnn/lstm_cell/addAddV2&AR_LSTM/rnn/lstm_cell/MatMul:product:0(AR_LSTM/rnn/lstm_cell/MatMul_1:product:0*
T0*(
_output_shapes
:??????????2
AR_LSTM/rnn/lstm_cell/add?
,AR_LSTM/rnn/lstm_cell/BiasAdd/ReadVariableOpReadVariableOp5ar_lstm_rnn_lstm_cell_biasadd_readvariableop_resource*
_output_shapes	
:?*
dtype02.
,AR_LSTM/rnn/lstm_cell/BiasAdd/ReadVariableOp?
AR_LSTM/rnn/lstm_cell/BiasAddBiasAddAR_LSTM/rnn/lstm_cell/add:z:04AR_LSTM/rnn/lstm_cell/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????2
AR_LSTM/rnn/lstm_cell/BiasAdd?
%AR_LSTM/rnn/lstm_cell/split/split_dimConst*
_output_shapes
: *
dtype0*
value	B :2'
%AR_LSTM/rnn/lstm_cell/split/split_dim?
AR_LSTM/rnn/lstm_cell/splitSplit.AR_LSTM/rnn/lstm_cell/split/split_dim:output:0&AR_LSTM/rnn/lstm_cell/BiasAdd:output:0*
T0*`
_output_shapesN
L:????????? :????????? :????????? :????????? *
	num_split2
AR_LSTM/rnn/lstm_cell/split?
AR_LSTM/rnn/lstm_cell/SigmoidSigmoid$AR_LSTM/rnn/lstm_cell/split:output:0*
T0*'
_output_shapes
:????????? 2
AR_LSTM/rnn/lstm_cell/Sigmoid?
AR_LSTM/rnn/lstm_cell/Sigmoid_1Sigmoid$AR_LSTM/rnn/lstm_cell/split:output:1*
T0*'
_output_shapes
:????????? 2!
AR_LSTM/rnn/lstm_cell/Sigmoid_1?
AR_LSTM/rnn/lstm_cell/mulMul#AR_LSTM/rnn/lstm_cell/Sigmoid_1:y:0AR_LSTM/rnn/zeros_1:output:0*
T0*'
_output_shapes
:????????? 2
AR_LSTM/rnn/lstm_cell/mul?
AR_LSTM/rnn/lstm_cell/TanhTanh$AR_LSTM/rnn/lstm_cell/split:output:2*
T0*'
_output_shapes
:????????? 2
AR_LSTM/rnn/lstm_cell/Tanh?
AR_LSTM/rnn/lstm_cell/mul_1Mul!AR_LSTM/rnn/lstm_cell/Sigmoid:y:0AR_LSTM/rnn/lstm_cell/Tanh:y:0*
T0*'
_output_shapes
:????????? 2
AR_LSTM/rnn/lstm_cell/mul_1?
AR_LSTM/rnn/lstm_cell/add_1AddV2AR_LSTM/rnn/lstm_cell/mul:z:0AR_LSTM/rnn/lstm_cell/mul_1:z:0*
T0*'
_output_shapes
:????????? 2
AR_LSTM/rnn/lstm_cell/add_1?
AR_LSTM/rnn/lstm_cell/Sigmoid_2Sigmoid$AR_LSTM/rnn/lstm_cell/split:output:3*
T0*'
_output_shapes
:????????? 2!
AR_LSTM/rnn/lstm_cell/Sigmoid_2?
AR_LSTM/rnn/lstm_cell/Tanh_1TanhAR_LSTM/rnn/lstm_cell/add_1:z:0*
T0*'
_output_shapes
:????????? 2
AR_LSTM/rnn/lstm_cell/Tanh_1?
AR_LSTM/rnn/lstm_cell/mul_2Mul#AR_LSTM/rnn/lstm_cell/Sigmoid_2:y:0 AR_LSTM/rnn/lstm_cell/Tanh_1:y:0*
T0*'
_output_shapes
:????????? 2
AR_LSTM/rnn/lstm_cell/mul_2?
)AR_LSTM/rnn/TensorArrayV2_1/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????    2+
)AR_LSTM/rnn/TensorArrayV2_1/element_shape?
AR_LSTM/rnn/TensorArrayV2_1TensorListReserve2AR_LSTM/rnn/TensorArrayV2_1/element_shape:output:0$AR_LSTM/rnn/strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type02
AR_LSTM/rnn/TensorArrayV2_1f
AR_LSTM/rnn/timeConst*
_output_shapes
: *
dtype0*
value	B : 2
AR_LSTM/rnn/time?
$AR_LSTM/rnn/while/maximum_iterationsConst*
_output_shapes
: *
dtype0*
valueB :
?????????2&
$AR_LSTM/rnn/while/maximum_iterations?
AR_LSTM/rnn/while/loop_counterConst*
_output_shapes
: *
dtype0*
value	B : 2 
AR_LSTM/rnn/while/loop_counter?
AR_LSTM/rnn/whileWhile'AR_LSTM/rnn/while/loop_counter:output:0-AR_LSTM/rnn/while/maximum_iterations:output:0AR_LSTM/rnn/time:output:0$AR_LSTM/rnn/TensorArrayV2_1:handle:0AR_LSTM/rnn/zeros:output:0AR_LSTM/rnn/zeros_1:output:0$AR_LSTM/rnn/strided_slice_1:output:0CAR_LSTM/rnn/TensorArrayUnstack/TensorListFromTensor:output_handle:04ar_lstm_rnn_lstm_cell_matmul_readvariableop_resource6ar_lstm_rnn_lstm_cell_matmul_1_readvariableop_resource5ar_lstm_rnn_lstm_cell_biasadd_readvariableop_resource*
T
2*
_lower_using_switch_merge(*
_num_original_outputs*L
_output_shapes:
8: : : : :????????? :????????? : : : : : *%
_read_only_resource_inputs
	
*'
bodyR
AR_LSTM_rnn_while_body_7452*'
condR
AR_LSTM_rnn_while_cond_7451*K
output_shapes:
8: : : : :????????? :????????? : : : : : *
parallel_iterations 2
AR_LSTM/rnn/while?
<AR_LSTM/rnn/TensorArrayV2Stack/TensorListStack/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????    2>
<AR_LSTM/rnn/TensorArrayV2Stack/TensorListStack/element_shape?
.AR_LSTM/rnn/TensorArrayV2Stack/TensorListStackTensorListStackAR_LSTM/rnn/while:output:3EAR_LSTM/rnn/TensorArrayV2Stack/TensorListStack/element_shape:output:0*4
_output_shapes"
 :?????????????????? *
element_dtype020
.AR_LSTM/rnn/TensorArrayV2Stack/TensorListStack?
!AR_LSTM/rnn/strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB:
?????????2#
!AR_LSTM/rnn/strided_slice_3/stack?
#AR_LSTM/rnn/strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 2%
#AR_LSTM/rnn/strided_slice_3/stack_1?
#AR_LSTM/rnn/strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2%
#AR_LSTM/rnn/strided_slice_3/stack_2?
AR_LSTM/rnn/strided_slice_3StridedSlice7AR_LSTM/rnn/TensorArrayV2Stack/TensorListStack:tensor:0*AR_LSTM/rnn/strided_slice_3/stack:output:0,AR_LSTM/rnn/strided_slice_3/stack_1:output:0,AR_LSTM/rnn/strided_slice_3/stack_2:output:0*
Index0*
T0*'
_output_shapes
:????????? *
shrink_axis_mask2
AR_LSTM/rnn/strided_slice_3?
AR_LSTM/rnn/transpose_1/permConst*
_output_shapes
:*
dtype0*!
valueB"          2
AR_LSTM/rnn/transpose_1/perm?
AR_LSTM/rnn/transpose_1	Transpose7AR_LSTM/rnn/TensorArrayV2Stack/TensorListStack:tensor:0%AR_LSTM/rnn/transpose_1/perm:output:0*
T0*4
_output_shapes"
 :?????????????????? 2
AR_LSTM/rnn/transpose_1?
%AR_LSTM/dense_1/MatMul/ReadVariableOpReadVariableOp.ar_lstm_dense_1_matmul_readvariableop_resource*
_output_shapes

: 3*
dtype02'
%AR_LSTM/dense_1/MatMul/ReadVariableOp?
AR_LSTM/dense_1/MatMulMatMul$AR_LSTM/rnn/strided_slice_3:output:0-AR_LSTM/dense_1/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????32
AR_LSTM/dense_1/MatMul?
&AR_LSTM/dense_1/BiasAdd/ReadVariableOpReadVariableOp/ar_lstm_dense_1_biasadd_readvariableop_resource*
_output_shapes
:3*
dtype02(
&AR_LSTM/dense_1/BiasAdd/ReadVariableOp?
AR_LSTM/dense_1/BiasAddBiasAdd AR_LSTM/dense_1/MatMul:product:0.AR_LSTM/dense_1/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????32
AR_LSTM/dense_1/BiasAdd?
'AR_LSTM/lstm_cell/MatMul/ReadVariableOpReadVariableOp4ar_lstm_rnn_lstm_cell_matmul_readvariableop_resource*
_output_shapes
:	3?*
dtype02)
'AR_LSTM/lstm_cell/MatMul/ReadVariableOp?
AR_LSTM/lstm_cell/MatMulMatMul AR_LSTM/dense_1/BiasAdd:output:0/AR_LSTM/lstm_cell/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????2
AR_LSTM/lstm_cell/MatMul?
)AR_LSTM/lstm_cell/MatMul_1/ReadVariableOpReadVariableOp6ar_lstm_rnn_lstm_cell_matmul_1_readvariableop_resource*
_output_shapes
:	 ?*
dtype02+
)AR_LSTM/lstm_cell/MatMul_1/ReadVariableOp?
AR_LSTM/lstm_cell/MatMul_1MatMulAR_LSTM/rnn/while:output:41AR_LSTM/lstm_cell/MatMul_1/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????2
AR_LSTM/lstm_cell/MatMul_1?
AR_LSTM/lstm_cell/addAddV2"AR_LSTM/lstm_cell/MatMul:product:0$AR_LSTM/lstm_cell/MatMul_1:product:0*
T0*(
_output_shapes
:??????????2
AR_LSTM/lstm_cell/add?
(AR_LSTM/lstm_cell/BiasAdd/ReadVariableOpReadVariableOp5ar_lstm_rnn_lstm_cell_biasadd_readvariableop_resource*
_output_shapes	
:?*
dtype02*
(AR_LSTM/lstm_cell/BiasAdd/ReadVariableOp?
AR_LSTM/lstm_cell/BiasAddBiasAddAR_LSTM/lstm_cell/add:z:00AR_LSTM/lstm_cell/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????2
AR_LSTM/lstm_cell/BiasAdd?
!AR_LSTM/lstm_cell/split/split_dimConst*
_output_shapes
: *
dtype0*
value	B :2#
!AR_LSTM/lstm_cell/split/split_dim?
AR_LSTM/lstm_cell/splitSplit*AR_LSTM/lstm_cell/split/split_dim:output:0"AR_LSTM/lstm_cell/BiasAdd:output:0*
T0*`
_output_shapesN
L:????????? :????????? :????????? :????????? *
	num_split2
AR_LSTM/lstm_cell/split?
AR_LSTM/lstm_cell/SigmoidSigmoid AR_LSTM/lstm_cell/split:output:0*
T0*'
_output_shapes
:????????? 2
AR_LSTM/lstm_cell/Sigmoid?
AR_LSTM/lstm_cell/Sigmoid_1Sigmoid AR_LSTM/lstm_cell/split:output:1*
T0*'
_output_shapes
:????????? 2
AR_LSTM/lstm_cell/Sigmoid_1?
AR_LSTM/lstm_cell/mulMulAR_LSTM/lstm_cell/Sigmoid_1:y:0AR_LSTM/rnn/while:output:5*
T0*'
_output_shapes
:????????? 2
AR_LSTM/lstm_cell/mul?
AR_LSTM/lstm_cell/TanhTanh AR_LSTM/lstm_cell/split:output:2*
T0*'
_output_shapes
:????????? 2
AR_LSTM/lstm_cell/Tanh?
AR_LSTM/lstm_cell/mul_1MulAR_LSTM/lstm_cell/Sigmoid:y:0AR_LSTM/lstm_cell/Tanh:y:0*
T0*'
_output_shapes
:????????? 2
AR_LSTM/lstm_cell/mul_1?
AR_LSTM/lstm_cell/add_1AddV2AR_LSTM/lstm_cell/mul:z:0AR_LSTM/lstm_cell/mul_1:z:0*
T0*'
_output_shapes
:????????? 2
AR_LSTM/lstm_cell/add_1?
AR_LSTM/lstm_cell/Sigmoid_2Sigmoid AR_LSTM/lstm_cell/split:output:3*
T0*'
_output_shapes
:????????? 2
AR_LSTM/lstm_cell/Sigmoid_2?
AR_LSTM/lstm_cell/Tanh_1TanhAR_LSTM/lstm_cell/add_1:z:0*
T0*'
_output_shapes
:????????? 2
AR_LSTM/lstm_cell/Tanh_1?
AR_LSTM/lstm_cell/mul_2MulAR_LSTM/lstm_cell/Sigmoid_2:y:0AR_LSTM/lstm_cell/Tanh_1:y:0*
T0*'
_output_shapes
:????????? 2
AR_LSTM/lstm_cell/mul_2?
'AR_LSTM/dense_1/MatMul_1/ReadVariableOpReadVariableOp.ar_lstm_dense_1_matmul_readvariableop_resource*
_output_shapes

: 3*
dtype02)
'AR_LSTM/dense_1/MatMul_1/ReadVariableOp?
AR_LSTM/dense_1/MatMul_1MatMulAR_LSTM/lstm_cell/mul_2:z:0/AR_LSTM/dense_1/MatMul_1/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????32
AR_LSTM/dense_1/MatMul_1?
(AR_LSTM/dense_1/BiasAdd_1/ReadVariableOpReadVariableOp/ar_lstm_dense_1_biasadd_readvariableop_resource*
_output_shapes
:3*
dtype02*
(AR_LSTM/dense_1/BiasAdd_1/ReadVariableOp?
AR_LSTM/dense_1/BiasAdd_1BiasAdd"AR_LSTM/dense_1/MatMul_1:product:00AR_LSTM/dense_1/BiasAdd_1/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????32
AR_LSTM/dense_1/BiasAdd_1?
)AR_LSTM/lstm_cell/MatMul_2/ReadVariableOpReadVariableOp4ar_lstm_rnn_lstm_cell_matmul_readvariableop_resource*
_output_shapes
:	3?*
dtype02+
)AR_LSTM/lstm_cell/MatMul_2/ReadVariableOp?
AR_LSTM/lstm_cell/MatMul_2MatMul"AR_LSTM/dense_1/BiasAdd_1:output:01AR_LSTM/lstm_cell/MatMul_2/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????2
AR_LSTM/lstm_cell/MatMul_2?
)AR_LSTM/lstm_cell/MatMul_3/ReadVariableOpReadVariableOp6ar_lstm_rnn_lstm_cell_matmul_1_readvariableop_resource*
_output_shapes
:	 ?*
dtype02+
)AR_LSTM/lstm_cell/MatMul_3/ReadVariableOp?
AR_LSTM/lstm_cell/MatMul_3MatMulAR_LSTM/lstm_cell/mul_2:z:01AR_LSTM/lstm_cell/MatMul_3/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????2
AR_LSTM/lstm_cell/MatMul_3?
AR_LSTM/lstm_cell/add_2AddV2$AR_LSTM/lstm_cell/MatMul_2:product:0$AR_LSTM/lstm_cell/MatMul_3:product:0*
T0*(
_output_shapes
:??????????2
AR_LSTM/lstm_cell/add_2?
*AR_LSTM/lstm_cell/BiasAdd_1/ReadVariableOpReadVariableOp5ar_lstm_rnn_lstm_cell_biasadd_readvariableop_resource*
_output_shapes	
:?*
dtype02,
*AR_LSTM/lstm_cell/BiasAdd_1/ReadVariableOp?
AR_LSTM/lstm_cell/BiasAdd_1BiasAddAR_LSTM/lstm_cell/add_2:z:02AR_LSTM/lstm_cell/BiasAdd_1/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????2
AR_LSTM/lstm_cell/BiasAdd_1?
#AR_LSTM/lstm_cell/split_1/split_dimConst*
_output_shapes
: *
dtype0*
value	B :2%
#AR_LSTM/lstm_cell/split_1/split_dim?
AR_LSTM/lstm_cell/split_1Split,AR_LSTM/lstm_cell/split_1/split_dim:output:0$AR_LSTM/lstm_cell/BiasAdd_1:output:0*
T0*`
_output_shapesN
L:????????? :????????? :????????? :????????? *
	num_split2
AR_LSTM/lstm_cell/split_1?
AR_LSTM/lstm_cell/Sigmoid_3Sigmoid"AR_LSTM/lstm_cell/split_1:output:0*
T0*'
_output_shapes
:????????? 2
AR_LSTM/lstm_cell/Sigmoid_3?
AR_LSTM/lstm_cell/Sigmoid_4Sigmoid"AR_LSTM/lstm_cell/split_1:output:1*
T0*'
_output_shapes
:????????? 2
AR_LSTM/lstm_cell/Sigmoid_4?
AR_LSTM/lstm_cell/mul_3MulAR_LSTM/lstm_cell/Sigmoid_4:y:0AR_LSTM/lstm_cell/add_1:z:0*
T0*'
_output_shapes
:????????? 2
AR_LSTM/lstm_cell/mul_3?
AR_LSTM/lstm_cell/Tanh_2Tanh"AR_LSTM/lstm_cell/split_1:output:2*
T0*'
_output_shapes
:????????? 2
AR_LSTM/lstm_cell/Tanh_2?
AR_LSTM/lstm_cell/mul_4MulAR_LSTM/lstm_cell/Sigmoid_3:y:0AR_LSTM/lstm_cell/Tanh_2:y:0*
T0*'
_output_shapes
:????????? 2
AR_LSTM/lstm_cell/mul_4?
AR_LSTM/lstm_cell/add_3AddV2AR_LSTM/lstm_cell/mul_3:z:0AR_LSTM/lstm_cell/mul_4:z:0*
T0*'
_output_shapes
:????????? 2
AR_LSTM/lstm_cell/add_3?
AR_LSTM/lstm_cell/Sigmoid_5Sigmoid"AR_LSTM/lstm_cell/split_1:output:3*
T0*'
_output_shapes
:????????? 2
AR_LSTM/lstm_cell/Sigmoid_5?
AR_LSTM/lstm_cell/Tanh_3TanhAR_LSTM/lstm_cell/add_3:z:0*
T0*'
_output_shapes
:????????? 2
AR_LSTM/lstm_cell/Tanh_3?
AR_LSTM/lstm_cell/mul_5MulAR_LSTM/lstm_cell/Sigmoid_5:y:0AR_LSTM/lstm_cell/Tanh_3:y:0*
T0*'
_output_shapes
:????????? 2
AR_LSTM/lstm_cell/mul_5?
'AR_LSTM/dense_1/MatMul_2/ReadVariableOpReadVariableOp.ar_lstm_dense_1_matmul_readvariableop_resource*
_output_shapes

: 3*
dtype02)
'AR_LSTM/dense_1/MatMul_2/ReadVariableOp?
AR_LSTM/dense_1/MatMul_2MatMulAR_LSTM/lstm_cell/mul_5:z:0/AR_LSTM/dense_1/MatMul_2/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????32
AR_LSTM/dense_1/MatMul_2?
(AR_LSTM/dense_1/BiasAdd_2/ReadVariableOpReadVariableOp/ar_lstm_dense_1_biasadd_readvariableop_resource*
_output_shapes
:3*
dtype02*
(AR_LSTM/dense_1/BiasAdd_2/ReadVariableOp?
AR_LSTM/dense_1/BiasAdd_2BiasAdd"AR_LSTM/dense_1/MatMul_2:product:00AR_LSTM/dense_1/BiasAdd_2/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????32
AR_LSTM/dense_1/BiasAdd_2?
AR_LSTM/stackPack AR_LSTM/dense_1/BiasAdd:output:0"AR_LSTM/dense_1/BiasAdd_1:output:0"AR_LSTM/dense_1/BiasAdd_2:output:0*
N*
T0*+
_output_shapes
:?????????32
AR_LSTM/stack?
AR_LSTM/transpose/permConst*
_output_shapes
:*
dtype0*!
valueB"          2
AR_LSTM/transpose/perm?
AR_LSTM/transpose	TransposeAR_LSTM/stack:output:0AR_LSTM/transpose/perm:output:0*
T0*+
_output_shapes
:?????????32
AR_LSTM/transpose?
IdentityIdentityAR_LSTM/transpose:y:0'^AR_LSTM/dense_1/BiasAdd/ReadVariableOp)^AR_LSTM/dense_1/BiasAdd_1/ReadVariableOp)^AR_LSTM/dense_1/BiasAdd_2/ReadVariableOp&^AR_LSTM/dense_1/MatMul/ReadVariableOp(^AR_LSTM/dense_1/MatMul_1/ReadVariableOp(^AR_LSTM/dense_1/MatMul_2/ReadVariableOp)^AR_LSTM/lstm_cell/BiasAdd/ReadVariableOp+^AR_LSTM/lstm_cell/BiasAdd_1/ReadVariableOp(^AR_LSTM/lstm_cell/MatMul/ReadVariableOp*^AR_LSTM/lstm_cell/MatMul_1/ReadVariableOp*^AR_LSTM/lstm_cell/MatMul_2/ReadVariableOp*^AR_LSTM/lstm_cell/MatMul_3/ReadVariableOp-^AR_LSTM/rnn/lstm_cell/BiasAdd/ReadVariableOp,^AR_LSTM/rnn/lstm_cell/MatMul/ReadVariableOp.^AR_LSTM/rnn/lstm_cell/MatMul_1/ReadVariableOp^AR_LSTM/rnn/while*
T0*+
_output_shapes
:?????????32

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*=
_input_shapes,
*:??????????????????3: : : : : 2P
&AR_LSTM/dense_1/BiasAdd/ReadVariableOp&AR_LSTM/dense_1/BiasAdd/ReadVariableOp2T
(AR_LSTM/dense_1/BiasAdd_1/ReadVariableOp(AR_LSTM/dense_1/BiasAdd_1/ReadVariableOp2T
(AR_LSTM/dense_1/BiasAdd_2/ReadVariableOp(AR_LSTM/dense_1/BiasAdd_2/ReadVariableOp2N
%AR_LSTM/dense_1/MatMul/ReadVariableOp%AR_LSTM/dense_1/MatMul/ReadVariableOp2R
'AR_LSTM/dense_1/MatMul_1/ReadVariableOp'AR_LSTM/dense_1/MatMul_1/ReadVariableOp2R
'AR_LSTM/dense_1/MatMul_2/ReadVariableOp'AR_LSTM/dense_1/MatMul_2/ReadVariableOp2T
(AR_LSTM/lstm_cell/BiasAdd/ReadVariableOp(AR_LSTM/lstm_cell/BiasAdd/ReadVariableOp2X
*AR_LSTM/lstm_cell/BiasAdd_1/ReadVariableOp*AR_LSTM/lstm_cell/BiasAdd_1/ReadVariableOp2R
'AR_LSTM/lstm_cell/MatMul/ReadVariableOp'AR_LSTM/lstm_cell/MatMul/ReadVariableOp2V
)AR_LSTM/lstm_cell/MatMul_1/ReadVariableOp)AR_LSTM/lstm_cell/MatMul_1/ReadVariableOp2V
)AR_LSTM/lstm_cell/MatMul_2/ReadVariableOp)AR_LSTM/lstm_cell/MatMul_2/ReadVariableOp2V
)AR_LSTM/lstm_cell/MatMul_3/ReadVariableOp)AR_LSTM/lstm_cell/MatMul_3/ReadVariableOp2\
,AR_LSTM/rnn/lstm_cell/BiasAdd/ReadVariableOp,AR_LSTM/rnn/lstm_cell/BiasAdd/ReadVariableOp2Z
+AR_LSTM/rnn/lstm_cell/MatMul/ReadVariableOp+AR_LSTM/rnn/lstm_cell/MatMul/ReadVariableOp2^
-AR_LSTM/rnn/lstm_cell/MatMul_1/ReadVariableOp-AR_LSTM/rnn/lstm_cell/MatMul_1/ReadVariableOp2&
AR_LSTM/rnn/whileAR_LSTM/rnn/while:] Y
4
_output_shapes"
 :??????????????????3
!
_user_specified_name	input_1
?
?
C__inference_lstm_cell_layer_call_and_return_conditional_losses_9458

inputs
states_0
states_11
matmul_readvariableop_resource:	3?3
 matmul_1_readvariableop_resource:	 ?.
biasadd_readvariableop_resource:	?
identity

identity_1

identity_2??BiasAdd/ReadVariableOp?MatMul/ReadVariableOp?MatMul_1/ReadVariableOp?
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	3?*
dtype02
MatMul/ReadVariableOpt
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????2
MatMul?
MatMul_1/ReadVariableOpReadVariableOp matmul_1_readvariableop_resource*
_output_shapes
:	 ?*
dtype02
MatMul_1/ReadVariableOp|
MatMul_1MatMulstates_0MatMul_1/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????2

MatMul_1l
addAddV2MatMul:product:0MatMul_1:product:0*
T0*(
_output_shapes
:??????????2
add?
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
:?*
dtype02
BiasAdd/ReadVariableOpy
BiasAddBiasAddadd:z:0BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????2	
BiasAddd
split/split_dimConst*
_output_shapes
: *
dtype0*
value	B :2
split/split_dim?
splitSplitsplit/split_dim:output:0BiasAdd:output:0*
T0*`
_output_shapesN
L:????????? :????????? :????????? :????????? *
	num_split2
split_
SigmoidSigmoidsplit:output:0*
T0*'
_output_shapes
:????????? 2	
Sigmoidc
	Sigmoid_1Sigmoidsplit:output:1*
T0*'
_output_shapes
:????????? 2
	Sigmoid_1\
mulMulSigmoid_1:y:0states_1*
T0*'
_output_shapes
:????????? 2
mulV
TanhTanhsplit:output:2*
T0*'
_output_shapes
:????????? 2
Tanh^
mul_1MulSigmoid:y:0Tanh:y:0*
T0*'
_output_shapes
:????????? 2
mul_1]
add_1AddV2mul:z:0	mul_1:z:0*
T0*'
_output_shapes
:????????? 2
add_1c
	Sigmoid_2Sigmoidsplit:output:3*
T0*'
_output_shapes
:????????? 2
	Sigmoid_2U
Tanh_1Tanh	add_1:z:0*
T0*'
_output_shapes
:????????? 2
Tanh_1b
mul_2MulSigmoid_2:y:0
Tanh_1:y:0*
T0*'
_output_shapes
:????????? 2
mul_2?
IdentityIdentity	mul_2:z:0^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp^MatMul_1/ReadVariableOp*
T0*'
_output_shapes
:????????? 2

Identity?

Identity_1Identity	mul_2:z:0^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp^MatMul_1/ReadVariableOp*
T0*'
_output_shapes
:????????? 2

Identity_1?

Identity_2Identity	add_1:z:0^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp^MatMul_1/ReadVariableOp*
T0*'
_output_shapes
:????????? 2

Identity_2"
identityIdentity:output:0"!

identity_1Identity_1:output:0"!

identity_2Identity_2:output:0*(
_construction_contextkEagerRuntime*R
_input_shapesA
?:?????????3:????????? :????????? : : : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp22
MatMul_1/ReadVariableOpMatMul_1/ReadVariableOp:O K
'
_output_shapes
:?????????3
 
_user_specified_nameinputs:QM
'
_output_shapes
:????????? 
"
_user_specified_name
states/0:QM
'
_output_shapes
:????????? 
"
_user_specified_name
states/1
?%
?
A__inference_AR_LSTM_layer_call_and_return_conditional_losses_8816
input_1
rnn_8780:	3?
rnn_8782:	 ?
rnn_8784:	?
dense_1_8789: 3
dense_1_8791:3
identity??dense_1/StatefulPartitionedCall?!dense_1/StatefulPartitionedCall_1?!dense_1/StatefulPartitionedCall_2?!lstm_cell/StatefulPartitionedCall?#lstm_cell/StatefulPartitionedCall_1?rnn/StatefulPartitionedCall?
rnn/StatefulPartitionedCallStatefulPartitionedCallinput_1rnn_8780rnn_8782rnn_8784*
Tin
2*
Tout
2*
_collective_manager_ids
 *M
_output_shapes;
9:????????? :????????? :????????? *%
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *F
fAR?
=__inference_rnn_layer_call_and_return_conditional_losses_83722
rnn/StatefulPartitionedCall?
dense_1/StatefulPartitionedCallStatefulPartitionedCall$rnn/StatefulPartitionedCall:output:0dense_1_8789dense_1_8791*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????3*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *J
fERC
A__inference_dense_1_layer_call_and_return_conditional_losses_83922!
dense_1/StatefulPartitionedCall?
!lstm_cell/StatefulPartitionedCallStatefulPartitionedCall(dense_1/StatefulPartitionedCall:output:0$rnn/StatefulPartitionedCall:output:1$rnn/StatefulPartitionedCall:output:2rnn_8780rnn_8782rnn_8784*
Tin

2*
Tout
2*
_collective_manager_ids
 *M
_output_shapes;
9:????????? :????????? :????????? *%
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *L
fGRE
C__inference_lstm_cell_layer_call_and_return_conditional_losses_84292#
!lstm_cell/StatefulPartitionedCall?
!dense_1/StatefulPartitionedCall_1StatefulPartitionedCall*lstm_cell/StatefulPartitionedCall:output:0dense_1_8789dense_1_8791*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????3*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *J
fERC
A__inference_dense_1_layer_call_and_return_conditional_losses_83922#
!dense_1/StatefulPartitionedCall_1?
#lstm_cell/StatefulPartitionedCall_1StatefulPartitionedCall*dense_1/StatefulPartitionedCall_1:output:0*lstm_cell/StatefulPartitionedCall:output:1*lstm_cell/StatefulPartitionedCall:output:2rnn_8780rnn_8782rnn_8784*
Tin

2*
Tout
2*
_collective_manager_ids
 *M
_output_shapes;
9:????????? :????????? :????????? *%
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *L
fGRE
C__inference_lstm_cell_layer_call_and_return_conditional_losses_84292%
#lstm_cell/StatefulPartitionedCall_1?
!dense_1/StatefulPartitionedCall_2StatefulPartitionedCall,lstm_cell/StatefulPartitionedCall_1:output:0dense_1_8789dense_1_8791*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????3*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *J
fERC
A__inference_dense_1_layer_call_and_return_conditional_losses_83922#
!dense_1/StatefulPartitionedCall_2?
stackPack(dense_1/StatefulPartitionedCall:output:0*dense_1/StatefulPartitionedCall_1:output:0*dense_1/StatefulPartitionedCall_2:output:0*
N*
T0*+
_output_shapes
:?????????32
stacku
transpose/permConst*
_output_shapes
:*
dtype0*!
valueB"          2
transpose/perm?
	transpose	Transposestack:output:0transpose/perm:output:0*
T0*+
_output_shapes
:?????????32
	transpose?
IdentityIdentitytranspose:y:0 ^dense_1/StatefulPartitionedCall"^dense_1/StatefulPartitionedCall_1"^dense_1/StatefulPartitionedCall_2"^lstm_cell/StatefulPartitionedCall$^lstm_cell/StatefulPartitionedCall_1^rnn/StatefulPartitionedCall*
T0*+
_output_shapes
:?????????32

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*=
_input_shapes,
*:??????????????????3: : : : : 2B
dense_1/StatefulPartitionedCalldense_1/StatefulPartitionedCall2F
!dense_1/StatefulPartitionedCall_1!dense_1/StatefulPartitionedCall_12F
!dense_1/StatefulPartitionedCall_2!dense_1/StatefulPartitionedCall_22F
!lstm_cell/StatefulPartitionedCall!lstm_cell/StatefulPartitionedCall2J
#lstm_cell/StatefulPartitionedCall_1#lstm_cell/StatefulPartitionedCall_12:
rnn/StatefulPartitionedCallrnn/StatefulPartitionedCall:] Y
4
_output_shapes"
 :??????????????????3
!
_user_specified_name	input_1
?
?
"__inference_rnn_layer_call_fn_9537
inputs_0
unknown:	3?
	unknown_0:	 ?
	unknown_1:	?
identity

identity_1

identity_2??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputs_0unknown	unknown_0	unknown_1*
Tin
2*
Tout
2*
_collective_manager_ids
 *M
_output_shapes;
9:????????? :????????? :????????? *%
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *F
fAR?
=__inference_rnn_layer_call_and_return_conditional_losses_77532
StatefulPartitionedCall?
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*'
_output_shapes
:????????? 2

Identity?

Identity_1Identity StatefulPartitionedCall:output:1^StatefulPartitionedCall*
T0*'
_output_shapes
:????????? 2

Identity_1?

Identity_2Identity StatefulPartitionedCall:output:2^StatefulPartitionedCall*
T0*'
_output_shapes
:????????? 2

Identity_2"
identityIdentity:output:0"!

identity_1Identity_1:output:0"!

identity_2Identity_2:output:0*(
_construction_contextkEagerRuntime*9
_input_shapes(
&:??????????????????3: : : 22
StatefulPartitionedCallStatefulPartitionedCall:^ Z
4
_output_shapes"
 :??????????????????3
"
_user_specified_name
inputs/0
?@
?
while_body_9801
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_placeholder_2
while_placeholder_3
while_strided_slice_1_0W
Swhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0C
0while_lstm_cell_matmul_readvariableop_resource_0:	3?E
2while_lstm_cell_matmul_1_readvariableop_resource_0:	 ?@
1while_lstm_cell_biasadd_readvariableop_resource_0:	?
while_identity
while_identity_1
while_identity_2
while_identity_3
while_identity_4
while_identity_5
while_strided_slice_1U
Qwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensorA
.while_lstm_cell_matmul_readvariableop_resource:	3?C
0while_lstm_cell_matmul_1_readvariableop_resource:	 ?>
/while_lstm_cell_biasadd_readvariableop_resource:	???&while/lstm_cell/BiasAdd/ReadVariableOp?%while/lstm_cell/MatMul/ReadVariableOp?'while/lstm_cell/MatMul_1/ReadVariableOp?
7while/TensorArrayV2Read/TensorListGetItem/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????3   29
7while/TensorArrayV2Read/TensorListGetItem/element_shape?
)while/TensorArrayV2Read/TensorListGetItemTensorListGetItemSwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0while_placeholder@while/TensorArrayV2Read/TensorListGetItem/element_shape:output:0*'
_output_shapes
:?????????3*
element_dtype02+
)while/TensorArrayV2Read/TensorListGetItem?
%while/lstm_cell/MatMul/ReadVariableOpReadVariableOp0while_lstm_cell_matmul_readvariableop_resource_0*
_output_shapes
:	3?*
dtype02'
%while/lstm_cell/MatMul/ReadVariableOp?
while/lstm_cell/MatMulMatMul0while/TensorArrayV2Read/TensorListGetItem:item:0-while/lstm_cell/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????2
while/lstm_cell/MatMul?
'while/lstm_cell/MatMul_1/ReadVariableOpReadVariableOp2while_lstm_cell_matmul_1_readvariableop_resource_0*
_output_shapes
:	 ?*
dtype02)
'while/lstm_cell/MatMul_1/ReadVariableOp?
while/lstm_cell/MatMul_1MatMulwhile_placeholder_2/while/lstm_cell/MatMul_1/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????2
while/lstm_cell/MatMul_1?
while/lstm_cell/addAddV2 while/lstm_cell/MatMul:product:0"while/lstm_cell/MatMul_1:product:0*
T0*(
_output_shapes
:??????????2
while/lstm_cell/add?
&while/lstm_cell/BiasAdd/ReadVariableOpReadVariableOp1while_lstm_cell_biasadd_readvariableop_resource_0*
_output_shapes	
:?*
dtype02(
&while/lstm_cell/BiasAdd/ReadVariableOp?
while/lstm_cell/BiasAddBiasAddwhile/lstm_cell/add:z:0.while/lstm_cell/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????2
while/lstm_cell/BiasAdd?
while/lstm_cell/split/split_dimConst*
_output_shapes
: *
dtype0*
value	B :2!
while/lstm_cell/split/split_dim?
while/lstm_cell/splitSplit(while/lstm_cell/split/split_dim:output:0 while/lstm_cell/BiasAdd:output:0*
T0*`
_output_shapesN
L:????????? :????????? :????????? :????????? *
	num_split2
while/lstm_cell/split?
while/lstm_cell/SigmoidSigmoidwhile/lstm_cell/split:output:0*
T0*'
_output_shapes
:????????? 2
while/lstm_cell/Sigmoid?
while/lstm_cell/Sigmoid_1Sigmoidwhile/lstm_cell/split:output:1*
T0*'
_output_shapes
:????????? 2
while/lstm_cell/Sigmoid_1?
while/lstm_cell/mulMulwhile/lstm_cell/Sigmoid_1:y:0while_placeholder_3*
T0*'
_output_shapes
:????????? 2
while/lstm_cell/mul?
while/lstm_cell/TanhTanhwhile/lstm_cell/split:output:2*
T0*'
_output_shapes
:????????? 2
while/lstm_cell/Tanh?
while/lstm_cell/mul_1Mulwhile/lstm_cell/Sigmoid:y:0while/lstm_cell/Tanh:y:0*
T0*'
_output_shapes
:????????? 2
while/lstm_cell/mul_1?
while/lstm_cell/add_1AddV2while/lstm_cell/mul:z:0while/lstm_cell/mul_1:z:0*
T0*'
_output_shapes
:????????? 2
while/lstm_cell/add_1?
while/lstm_cell/Sigmoid_2Sigmoidwhile/lstm_cell/split:output:3*
T0*'
_output_shapes
:????????? 2
while/lstm_cell/Sigmoid_2?
while/lstm_cell/Tanh_1Tanhwhile/lstm_cell/add_1:z:0*
T0*'
_output_shapes
:????????? 2
while/lstm_cell/Tanh_1?
while/lstm_cell/mul_2Mulwhile/lstm_cell/Sigmoid_2:y:0while/lstm_cell/Tanh_1:y:0*
T0*'
_output_shapes
:????????? 2
while/lstm_cell/mul_2?
*while/TensorArrayV2Write/TensorListSetItemTensorListSetItemwhile_placeholder_1while_placeholderwhile/lstm_cell/mul_2:z:0*
_output_shapes
: *
element_dtype02,
*while/TensorArrayV2Write/TensorListSetItem\
while/add/yConst*
_output_shapes
: *
dtype0*
value	B :2
while/add/yi
	while/addAddV2while_placeholderwhile/add/y:output:0*
T0*
_output_shapes
: 2
	while/add`
while/add_1/yConst*
_output_shapes
: *
dtype0*
value	B :2
while/add_1/yv
while/add_1AddV2while_while_loop_counterwhile/add_1/y:output:0*
T0*
_output_shapes
: 2
while/add_1?
while/IdentityIdentitywhile/add_1:z:0'^while/lstm_cell/BiasAdd/ReadVariableOp&^while/lstm_cell/MatMul/ReadVariableOp(^while/lstm_cell/MatMul_1/ReadVariableOp*
T0*
_output_shapes
: 2
while/Identity?
while/Identity_1Identitywhile_while_maximum_iterations'^while/lstm_cell/BiasAdd/ReadVariableOp&^while/lstm_cell/MatMul/ReadVariableOp(^while/lstm_cell/MatMul_1/ReadVariableOp*
T0*
_output_shapes
: 2
while/Identity_1?
while/Identity_2Identitywhile/add:z:0'^while/lstm_cell/BiasAdd/ReadVariableOp&^while/lstm_cell/MatMul/ReadVariableOp(^while/lstm_cell/MatMul_1/ReadVariableOp*
T0*
_output_shapes
: 2
while/Identity_2?
while/Identity_3Identity:while/TensorArrayV2Write/TensorListSetItem:output_handle:0'^while/lstm_cell/BiasAdd/ReadVariableOp&^while/lstm_cell/MatMul/ReadVariableOp(^while/lstm_cell/MatMul_1/ReadVariableOp*
T0*
_output_shapes
: 2
while/Identity_3?
while/Identity_4Identitywhile/lstm_cell/mul_2:z:0'^while/lstm_cell/BiasAdd/ReadVariableOp&^while/lstm_cell/MatMul/ReadVariableOp(^while/lstm_cell/MatMul_1/ReadVariableOp*
T0*'
_output_shapes
:????????? 2
while/Identity_4?
while/Identity_5Identitywhile/lstm_cell/add_1:z:0'^while/lstm_cell/BiasAdd/ReadVariableOp&^while/lstm_cell/MatMul/ReadVariableOp(^while/lstm_cell/MatMul_1/ReadVariableOp*
T0*'
_output_shapes
:????????? 2
while/Identity_5")
while_identitywhile/Identity:output:0"-
while_identity_1while/Identity_1:output:0"-
while_identity_2while/Identity_2:output:0"-
while_identity_3while/Identity_3:output:0"-
while_identity_4while/Identity_4:output:0"-
while_identity_5while/Identity_5:output:0"d
/while_lstm_cell_biasadd_readvariableop_resource1while_lstm_cell_biasadd_readvariableop_resource_0"f
0while_lstm_cell_matmul_1_readvariableop_resource2while_lstm_cell_matmul_1_readvariableop_resource_0"b
.while_lstm_cell_matmul_readvariableop_resource0while_lstm_cell_matmul_readvariableop_resource_0"0
while_strided_slice_1while_strided_slice_1_0"?
Qwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensorSwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0*(
_construction_contextkEagerRuntime*K
_input_shapes:
8: : : : :????????? :????????? : : : : : 2P
&while/lstm_cell/BiasAdd/ReadVariableOp&while/lstm_cell/BiasAdd/ReadVariableOp2N
%while/lstm_cell/MatMul/ReadVariableOp%while/lstm_cell/MatMul/ReadVariableOp2R
'while/lstm_cell/MatMul_1/ReadVariableOp'while/lstm_cell/MatMul_1/ReadVariableOp: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :-)
'
_output_shapes
:????????? :-)
'
_output_shapes
:????????? :

_output_shapes
: :

_output_shapes
: 
?:
?
__inference__traced_save_10304
file_prefix;
7savev2_ar_lstm_rnn_lstm_cell_kernel_read_readvariableopE
Asavev2_ar_lstm_rnn_lstm_cell_recurrent_kernel_read_readvariableop9
5savev2_ar_lstm_rnn_lstm_cell_bias_read_readvariableop5
1savev2_ar_lstm_dense_1_kernel_read_readvariableop3
/savev2_ar_lstm_dense_1_bias_read_readvariableop(
$savev2_adam_iter_read_readvariableop	*
&savev2_adam_beta_1_read_readvariableop*
&savev2_adam_beta_2_read_readvariableop)
%savev2_adam_decay_read_readvariableop1
-savev2_adam_learning_rate_read_readvariableop$
 savev2_total_read_readvariableop$
 savev2_count_read_readvariableop&
"savev2_total_1_read_readvariableop&
"savev2_count_1_read_readvariableopB
>savev2_adam_ar_lstm_rnn_lstm_cell_kernel_m_read_readvariableopL
Hsavev2_adam_ar_lstm_rnn_lstm_cell_recurrent_kernel_m_read_readvariableop@
<savev2_adam_ar_lstm_rnn_lstm_cell_bias_m_read_readvariableop<
8savev2_adam_ar_lstm_dense_1_kernel_m_read_readvariableop:
6savev2_adam_ar_lstm_dense_1_bias_m_read_readvariableopB
>savev2_adam_ar_lstm_rnn_lstm_cell_kernel_v_read_readvariableopL
Hsavev2_adam_ar_lstm_rnn_lstm_cell_recurrent_kernel_v_read_readvariableop@
<savev2_adam_ar_lstm_rnn_lstm_cell_bias_v_read_readvariableop<
8savev2_adam_ar_lstm_dense_1_kernel_v_read_readvariableop:
6savev2_adam_ar_lstm_dense_1_bias_v_read_readvariableop
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
:*
dtype0*?
value?B?B+lstm_cell/kernel/.ATTRIBUTES/VARIABLE_VALUEB5lstm_cell/recurrent_kernel/.ATTRIBUTES/VARIABLE_VALUEB)lstm_cell/bias/.ATTRIBUTES/VARIABLE_VALUEB'dense/kernel/.ATTRIBUTES/VARIABLE_VALUEB%dense/bias/.ATTRIBUTES/VARIABLE_VALUEB)optimizer/iter/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_1/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_2/.ATTRIBUTES/VARIABLE_VALUEB*optimizer/decay/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/learning_rate/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/count/.ATTRIBUTES/VARIABLE_VALUEBGlstm_cell/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBQlstm_cell/recurrent_kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBElstm_cell/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCdense/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBAdense/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBGlstm_cell/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBQlstm_cell/recurrent_kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBElstm_cell/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCdense/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBAdense/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPH2
SaveV2/tensor_names?
SaveV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:*
dtype0*E
value<B:B B B B B B B B B B B B B B B B B B B B B B B B B 2
SaveV2/shape_and_slices?
SaveV2SaveV2ShardedFilename:filename:0SaveV2/tensor_names:output:0 SaveV2/shape_and_slices:output:07savev2_ar_lstm_rnn_lstm_cell_kernel_read_readvariableopAsavev2_ar_lstm_rnn_lstm_cell_recurrent_kernel_read_readvariableop5savev2_ar_lstm_rnn_lstm_cell_bias_read_readvariableop1savev2_ar_lstm_dense_1_kernel_read_readvariableop/savev2_ar_lstm_dense_1_bias_read_readvariableop$savev2_adam_iter_read_readvariableop&savev2_adam_beta_1_read_readvariableop&savev2_adam_beta_2_read_readvariableop%savev2_adam_decay_read_readvariableop-savev2_adam_learning_rate_read_readvariableop savev2_total_read_readvariableop savev2_count_read_readvariableop"savev2_total_1_read_readvariableop"savev2_count_1_read_readvariableop>savev2_adam_ar_lstm_rnn_lstm_cell_kernel_m_read_readvariableopHsavev2_adam_ar_lstm_rnn_lstm_cell_recurrent_kernel_m_read_readvariableop<savev2_adam_ar_lstm_rnn_lstm_cell_bias_m_read_readvariableop8savev2_adam_ar_lstm_dense_1_kernel_m_read_readvariableop6savev2_adam_ar_lstm_dense_1_bias_m_read_readvariableop>savev2_adam_ar_lstm_rnn_lstm_cell_kernel_v_read_readvariableopHsavev2_adam_ar_lstm_rnn_lstm_cell_recurrent_kernel_v_read_readvariableop<savev2_adam_ar_lstm_rnn_lstm_cell_bias_v_read_readvariableop8savev2_adam_ar_lstm_dense_1_kernel_v_read_readvariableop6savev2_adam_ar_lstm_dense_1_bias_v_read_readvariableopsavev2_const"/device:CPU:0*
_output_shapes
 *'
dtypes
2	2
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
?: :	3?:	 ?:?: 3:3: : : : : : : : : :	3?:	 ?:?: 3:3:	3?:	 ?:?: 3:3: 2(
MergeV2CheckpointsMergeV2Checkpoints:C ?

_output_shapes
: 
%
_user_specified_namefile_prefix:%!

_output_shapes
:	3?:%!

_output_shapes
:	 ?:!

_output_shapes	
:?:$ 

_output_shapes

: 3: 

_output_shapes
:3:
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
: :

_output_shapes
: :%!

_output_shapes
:	3?:%!

_output_shapes
:	 ?:!

_output_shapes	
:?:$ 

_output_shapes

: 3: 

_output_shapes
:3:%!

_output_shapes
:	3?:%!

_output_shapes
:	 ?:!

_output_shapes	
:?:$ 

_output_shapes

: 3: 

_output_shapes
:3:

_output_shapes
: 
?%
?
while_body_7902
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_placeholder_2
while_placeholder_3
while_strided_slice_1_0W
Swhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0)
while_lstm_cell_7926_0:	3?)
while_lstm_cell_7928_0:	 ?%
while_lstm_cell_7930_0:	?
while_identity
while_identity_1
while_identity_2
while_identity_3
while_identity_4
while_identity_5
while_strided_slice_1U
Qwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor'
while_lstm_cell_7926:	3?'
while_lstm_cell_7928:	 ?#
while_lstm_cell_7930:	???'while/lstm_cell/StatefulPartitionedCall?
7while/TensorArrayV2Read/TensorListGetItem/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????3   29
7while/TensorArrayV2Read/TensorListGetItem/element_shape?
)while/TensorArrayV2Read/TensorListGetItemTensorListGetItemSwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0while_placeholder@while/TensorArrayV2Read/TensorListGetItem/element_shape:output:0*'
_output_shapes
:?????????3*
element_dtype02+
)while/TensorArrayV2Read/TensorListGetItem?
'while/lstm_cell/StatefulPartitionedCallStatefulPartitionedCall0while/TensorArrayV2Read/TensorListGetItem:item:0while_placeholder_2while_placeholder_3while_lstm_cell_7926_0while_lstm_cell_7928_0while_lstm_cell_7930_0*
Tin

2*
Tout
2*
_collective_manager_ids
 *M
_output_shapes;
9:????????? :????????? :????????? *%
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *L
fGRE
C__inference_lstm_cell_layer_call_and_return_conditional_losses_78202)
'while/lstm_cell/StatefulPartitionedCall?
*while/TensorArrayV2Write/TensorListSetItemTensorListSetItemwhile_placeholder_1while_placeholder0while/lstm_cell/StatefulPartitionedCall:output:0*
_output_shapes
: *
element_dtype02,
*while/TensorArrayV2Write/TensorListSetItem\
while/add/yConst*
_output_shapes
: *
dtype0*
value	B :2
while/add/yi
	while/addAddV2while_placeholderwhile/add/y:output:0*
T0*
_output_shapes
: 2
	while/add`
while/add_1/yConst*
_output_shapes
: *
dtype0*
value	B :2
while/add_1/yv
while/add_1AddV2while_while_loop_counterwhile/add_1/y:output:0*
T0*
_output_shapes
: 2
while/add_1?
while/IdentityIdentitywhile/add_1:z:0(^while/lstm_cell/StatefulPartitionedCall*
T0*
_output_shapes
: 2
while/Identity?
while/Identity_1Identitywhile_while_maximum_iterations(^while/lstm_cell/StatefulPartitionedCall*
T0*
_output_shapes
: 2
while/Identity_1?
while/Identity_2Identitywhile/add:z:0(^while/lstm_cell/StatefulPartitionedCall*
T0*
_output_shapes
: 2
while/Identity_2?
while/Identity_3Identity:while/TensorArrayV2Write/TensorListSetItem:output_handle:0(^while/lstm_cell/StatefulPartitionedCall*
T0*
_output_shapes
: 2
while/Identity_3?
while/Identity_4Identity0while/lstm_cell/StatefulPartitionedCall:output:1(^while/lstm_cell/StatefulPartitionedCall*
T0*'
_output_shapes
:????????? 2
while/Identity_4?
while/Identity_5Identity0while/lstm_cell/StatefulPartitionedCall:output:2(^while/lstm_cell/StatefulPartitionedCall*
T0*'
_output_shapes
:????????? 2
while/Identity_5")
while_identitywhile/Identity:output:0"-
while_identity_1while/Identity_1:output:0"-
while_identity_2while/Identity_2:output:0"-
while_identity_3while/Identity_3:output:0"-
while_identity_4while/Identity_4:output:0"-
while_identity_5while/Identity_5:output:0".
while_lstm_cell_7926while_lstm_cell_7926_0".
while_lstm_cell_7928while_lstm_cell_7928_0".
while_lstm_cell_7930while_lstm_cell_7930_0"0
while_strided_slice_1while_strided_slice_1_0"?
Qwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensorSwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0*(
_construction_contextkEagerRuntime*K
_input_shapes:
8: : : : :????????? :????????? : : : : : 2R
'while/lstm_cell/StatefulPartitionedCall'while/lstm_cell/StatefulPartitionedCall: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :-)
'
_output_shapes
:????????? :-)
'
_output_shapes
:????????? :

_output_shapes
: :

_output_shapes
: 
?G
?
=__inference_rnn_layer_call_and_return_conditional_losses_8680

inputs!
lstm_cell_8597:	3?!
lstm_cell_8599:	 ?
lstm_cell_8601:	?
identity

identity_1

identity_2??!lstm_cell/StatefulPartitionedCall?whileD
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
strided_slice\
zeros/mul/yConst*
_output_shapes
: *
dtype0*
value	B : 2
zeros/mul/yl
	zeros/mulMulstrided_slice:output:0zeros/mul/y:output:0*
T0*
_output_shapes
: 2
	zeros/mul_
zeros/Less/yConst*
_output_shapes
: *
dtype0*
value
B :?2
zeros/Less/yg

zeros/LessLesszeros/mul:z:0zeros/Less/y:output:0*
T0*
_output_shapes
: 2

zeros/Lessb
zeros/packed/1Const*
_output_shapes
: *
dtype0*
value	B : 2
zeros/packed/1?
zeros/packedPackstrided_slice:output:0zeros/packed/1:output:0*
N*
T0*
_output_shapes
:2
zeros/packed_
zeros/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    2
zeros/Constu
zerosFillzeros/packed:output:0zeros/Const:output:0*
T0*'
_output_shapes
:????????? 2
zeros`
zeros_1/mul/yConst*
_output_shapes
: *
dtype0*
value	B : 2
zeros_1/mul/yr
zeros_1/mulMulstrided_slice:output:0zeros_1/mul/y:output:0*
T0*
_output_shapes
: 2
zeros_1/mulc
zeros_1/Less/yConst*
_output_shapes
: *
dtype0*
value
B :?2
zeros_1/Less/yo
zeros_1/LessLesszeros_1/mul:z:0zeros_1/Less/y:output:0*
T0*
_output_shapes
: 2
zeros_1/Lessf
zeros_1/packed/1Const*
_output_shapes
: *
dtype0*
value	B : 2
zeros_1/packed/1?
zeros_1/packedPackstrided_slice:output:0zeros_1/packed/1:output:0*
N*
T0*
_output_shapes
:2
zeros_1/packedc
zeros_1/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    2
zeros_1/Const}
zeros_1Fillzeros_1/packed:output:0zeros_1/Const:output:0*
T0*'
_output_shapes
:????????? 2	
zeros_1u
transpose/permConst*
_output_shapes
:*
dtype0*!
valueB"          2
transpose/perm?
	transpose	Transposeinputstranspose/perm:output:0*
T0*4
_output_shapes"
 :??????????????????32
	transposeO
Shape_1Shapetranspose:y:0*
T0*
_output_shapes
:2	
Shape_1x
strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice_1/stack|
strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_1/stack_1|
strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_1/stack_2?
strided_slice_1StridedSliceShape_1:output:0strided_slice_1/stack:output:0 strided_slice_1/stack_1:output:0 strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
strided_slice_1?
TensorArrayV2/element_shapeConst*
_output_shapes
: *
dtype0*
valueB :
?????????2
TensorArrayV2/element_shape?
TensorArrayV2TensorListReserve$TensorArrayV2/element_shape:output:0strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type02
TensorArrayV2?
5TensorArrayUnstack/TensorListFromTensor/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????3   27
5TensorArrayUnstack/TensorListFromTensor/element_shape?
'TensorArrayUnstack/TensorListFromTensorTensorListFromTensortranspose:y:0>TensorArrayUnstack/TensorListFromTensor/element_shape:output:0*
_output_shapes
: *
element_dtype0*

shape_type02)
'TensorArrayUnstack/TensorListFromTensorx
strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice_2/stack|
strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_2/stack_1|
strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_2/stack_2?
strided_slice_2StridedSlicetranspose:y:0strided_slice_2/stack:output:0 strided_slice_2/stack_1:output:0 strided_slice_2/stack_2:output:0*
Index0*
T0*'
_output_shapes
:?????????3*
shrink_axis_mask2
strided_slice_2?
!lstm_cell/StatefulPartitionedCallStatefulPartitionedCallstrided_slice_2:output:0zeros:output:0zeros_1:output:0lstm_cell_8597lstm_cell_8599lstm_cell_8601*
Tin

2*
Tout
2*
_collective_manager_ids
 *M
_output_shapes;
9:????????? :????????? :????????? *%
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *L
fGRE
C__inference_lstm_cell_layer_call_and_return_conditional_losses_78202#
!lstm_cell/StatefulPartitionedCall?
TensorArrayV2_1/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????    2
TensorArrayV2_1/element_shape?
TensorArrayV2_1TensorListReserve&TensorArrayV2_1/element_shape:output:0strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type02
TensorArrayV2_1N
timeConst*
_output_shapes
: *
dtype0*
value	B : 2
time
while/maximum_iterationsConst*
_output_shapes
: *
dtype0*
valueB :
?????????2
while/maximum_iterationsj
while/loop_counterConst*
_output_shapes
: *
dtype0*
value	B : 2
while/loop_counter?
whileWhilewhile/loop_counter:output:0!while/maximum_iterations:output:0time:output:0TensorArrayV2_1:handle:0zeros:output:0zeros_1:output:0strided_slice_1:output:07TensorArrayUnstack/TensorListFromTensor:output_handle:0lstm_cell_8597lstm_cell_8599lstm_cell_8601*
T
2*
_lower_using_switch_merge(*
_num_original_outputs*L
_output_shapes:
8: : : : :????????? :????????? : : : : : *%
_read_only_resource_inputs
	
*
bodyR
while_body_8610*
condR
while_cond_8609*K
output_shapes:
8: : : : :????????? :????????? : : : : : *
parallel_iterations 2
while?
0TensorArrayV2Stack/TensorListStack/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????    22
0TensorArrayV2Stack/TensorListStack/element_shape?
"TensorArrayV2Stack/TensorListStackTensorListStackwhile:output:39TensorArrayV2Stack/TensorListStack/element_shape:output:0*4
_output_shapes"
 :?????????????????? *
element_dtype02$
"TensorArrayV2Stack/TensorListStack?
strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB:
?????????2
strided_slice_3/stack|
strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice_3/stack_1|
strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_3/stack_2?
strided_slice_3StridedSlice+TensorArrayV2Stack/TensorListStack:tensor:0strided_slice_3/stack:output:0 strided_slice_3/stack_1:output:0 strided_slice_3/stack_2:output:0*
Index0*
T0*'
_output_shapes
:????????? *
shrink_axis_mask2
strided_slice_3y
transpose_1/permConst*
_output_shapes
:*
dtype0*!
valueB"          2
transpose_1/perm?
transpose_1	Transpose+TensorArrayV2Stack/TensorListStack:tensor:0transpose_1/perm:output:0*
T0*4
_output_shapes"
 :?????????????????? 2
transpose_1?
IdentityIdentitystrided_slice_3:output:0"^lstm_cell/StatefulPartitionedCall^while*
T0*'
_output_shapes
:????????? 2

Identity?

Identity_1Identitywhile:output:4"^lstm_cell/StatefulPartitionedCall^while*
T0*'
_output_shapes
:????????? 2

Identity_1?

Identity_2Identitywhile:output:5"^lstm_cell/StatefulPartitionedCall^while*
T0*'
_output_shapes
:????????? 2

Identity_2"
identityIdentity:output:0"!

identity_1Identity_1:output:0"!

identity_2Identity_2:output:0*(
_construction_contextkEagerRuntime*9
_input_shapes(
&:??????????????????3: : : 2F
!lstm_cell/StatefulPartitionedCall!lstm_cell/StatefulPartitionedCall2
whilewhile:\ X
4
_output_shapes"
 :??????????????????3
 
_user_specified_nameinputs
?
?
'__inference_dense_1_layer_call_fn_10199

inputs
unknown: 3
	unknown_0:3
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????3*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *J
fERC
A__inference_dense_1_layer_call_and_return_conditional_losses_83922
StatefulPartitionedCall?
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*'
_output_shapes
:?????????32

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:????????? : : 22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:????????? 
 
_user_specified_nameinputs
?%
?
A__inference_AR_LSTM_layer_call_and_return_conditional_losses_8452

inputs
rnn_8373:	3?
rnn_8375:	 ?
rnn_8377:	?
dense_1_8393: 3
dense_1_8395:3
identity??dense_1/StatefulPartitionedCall?!dense_1/StatefulPartitionedCall_1?!dense_1/StatefulPartitionedCall_2?!lstm_cell/StatefulPartitionedCall?#lstm_cell/StatefulPartitionedCall_1?rnn/StatefulPartitionedCall?
rnn/StatefulPartitionedCallStatefulPartitionedCallinputsrnn_8373rnn_8375rnn_8377*
Tin
2*
Tout
2*
_collective_manager_ids
 *M
_output_shapes;
9:????????? :????????? :????????? *%
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *F
fAR?
=__inference_rnn_layer_call_and_return_conditional_losses_83722
rnn/StatefulPartitionedCall?
dense_1/StatefulPartitionedCallStatefulPartitionedCall$rnn/StatefulPartitionedCall:output:0dense_1_8393dense_1_8395*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????3*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *J
fERC
A__inference_dense_1_layer_call_and_return_conditional_losses_83922!
dense_1/StatefulPartitionedCall?
!lstm_cell/StatefulPartitionedCallStatefulPartitionedCall(dense_1/StatefulPartitionedCall:output:0$rnn/StatefulPartitionedCall:output:1$rnn/StatefulPartitionedCall:output:2rnn_8373rnn_8375rnn_8377*
Tin

2*
Tout
2*
_collective_manager_ids
 *M
_output_shapes;
9:????????? :????????? :????????? *%
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *L
fGRE
C__inference_lstm_cell_layer_call_and_return_conditional_losses_84292#
!lstm_cell/StatefulPartitionedCall?
!dense_1/StatefulPartitionedCall_1StatefulPartitionedCall*lstm_cell/StatefulPartitionedCall:output:0dense_1_8393dense_1_8395*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????3*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *J
fERC
A__inference_dense_1_layer_call_and_return_conditional_losses_83922#
!dense_1/StatefulPartitionedCall_1?
#lstm_cell/StatefulPartitionedCall_1StatefulPartitionedCall*dense_1/StatefulPartitionedCall_1:output:0*lstm_cell/StatefulPartitionedCall:output:1*lstm_cell/StatefulPartitionedCall:output:2rnn_8373rnn_8375rnn_8377*
Tin

2*
Tout
2*
_collective_manager_ids
 *M
_output_shapes;
9:????????? :????????? :????????? *%
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *L
fGRE
C__inference_lstm_cell_layer_call_and_return_conditional_losses_84292%
#lstm_cell/StatefulPartitionedCall_1?
!dense_1/StatefulPartitionedCall_2StatefulPartitionedCall,lstm_cell/StatefulPartitionedCall_1:output:0dense_1_8393dense_1_8395*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????3*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *J
fERC
A__inference_dense_1_layer_call_and_return_conditional_losses_83922#
!dense_1/StatefulPartitionedCall_2?
stackPack(dense_1/StatefulPartitionedCall:output:0*dense_1/StatefulPartitionedCall_1:output:0*dense_1/StatefulPartitionedCall_2:output:0*
N*
T0*+
_output_shapes
:?????????32
stacku
transpose/permConst*
_output_shapes
:*
dtype0*!
valueB"          2
transpose/perm?
	transpose	Transposestack:output:0transpose/perm:output:0*
T0*+
_output_shapes
:?????????32
	transpose?
IdentityIdentitytranspose:y:0 ^dense_1/StatefulPartitionedCall"^dense_1/StatefulPartitionedCall_1"^dense_1/StatefulPartitionedCall_2"^lstm_cell/StatefulPartitionedCall$^lstm_cell/StatefulPartitionedCall_1^rnn/StatefulPartitionedCall*
T0*+
_output_shapes
:?????????32

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*=
_input_shapes,
*:??????????????????3: : : : : 2B
dense_1/StatefulPartitionedCalldense_1/StatefulPartitionedCall2F
!dense_1/StatefulPartitionedCall_1!dense_1/StatefulPartitionedCall_12F
!dense_1/StatefulPartitionedCall_2!dense_1/StatefulPartitionedCall_22F
!lstm_cell/StatefulPartitionedCall!lstm_cell/StatefulPartitionedCall2J
#lstm_cell/StatefulPartitionedCall_1#lstm_cell/StatefulPartitionedCall_12:
rnn/StatefulPartitionedCallrnn/StatefulPartitionedCall:\ X
4
_output_shapes"
 :??????????????????3
 
_user_specified_nameinputs
?	
?
rnn_while_cond_8974$
 rnn_while_rnn_while_loop_counter*
&rnn_while_rnn_while_maximum_iterations
rnn_while_placeholder
rnn_while_placeholder_1
rnn_while_placeholder_2
rnn_while_placeholder_3&
"rnn_while_less_rnn_strided_slice_1:
6rnn_while_rnn_while_cond_8974___redundant_placeholder0:
6rnn_while_rnn_while_cond_8974___redundant_placeholder1:
6rnn_while_rnn_while_cond_8974___redundant_placeholder2:
6rnn_while_rnn_while_cond_8974___redundant_placeholder3
rnn_while_identity
?
rnn/while/LessLessrnn_while_placeholder"rnn_while_less_rnn_strided_slice_1*
T0*
_output_shapes
: 2
rnn/while/Lessi
rnn/while/IdentityIdentityrnn/while/Less:z:0*
T0
*
_output_shapes
: 2
rnn/while/Identity"1
rnn_while_identityrnn/while/Identity:output:0*(
_construction_contextkEagerRuntime*S
_input_shapesB
@: : : : :????????? :????????? : ::::: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :-)
'
_output_shapes
:????????? :-)
'
_output_shapes
:????????? :

_output_shapes
: :

_output_shapes
:
?
?
C__inference_lstm_cell_layer_call_and_return_conditional_losses_9426

inputs
states_0
states_11
matmul_readvariableop_resource:	3?3
 matmul_1_readvariableop_resource:	 ?.
biasadd_readvariableop_resource:	?
identity

identity_1

identity_2??BiasAdd/ReadVariableOp?MatMul/ReadVariableOp?MatMul_1/ReadVariableOp?
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	3?*
dtype02
MatMul/ReadVariableOpt
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????2
MatMul?
MatMul_1/ReadVariableOpReadVariableOp matmul_1_readvariableop_resource*
_output_shapes
:	 ?*
dtype02
MatMul_1/ReadVariableOp|
MatMul_1MatMulstates_0MatMul_1/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????2

MatMul_1l
addAddV2MatMul:product:0MatMul_1:product:0*
T0*(
_output_shapes
:??????????2
add?
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
:?*
dtype02
BiasAdd/ReadVariableOpy
BiasAddBiasAddadd:z:0BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????2	
BiasAddd
split/split_dimConst*
_output_shapes
: *
dtype0*
value	B :2
split/split_dim?
splitSplitsplit/split_dim:output:0BiasAdd:output:0*
T0*`
_output_shapesN
L:????????? :????????? :????????? :????????? *
	num_split2
split_
SigmoidSigmoidsplit:output:0*
T0*'
_output_shapes
:????????? 2	
Sigmoidc
	Sigmoid_1Sigmoidsplit:output:1*
T0*'
_output_shapes
:????????? 2
	Sigmoid_1\
mulMulSigmoid_1:y:0states_1*
T0*'
_output_shapes
:????????? 2
mulV
TanhTanhsplit:output:2*
T0*'
_output_shapes
:????????? 2
Tanh^
mul_1MulSigmoid:y:0Tanh:y:0*
T0*'
_output_shapes
:????????? 2
mul_1]
add_1AddV2mul:z:0	mul_1:z:0*
T0*'
_output_shapes
:????????? 2
add_1c
	Sigmoid_2Sigmoidsplit:output:3*
T0*'
_output_shapes
:????????? 2
	Sigmoid_2U
Tanh_1Tanh	add_1:z:0*
T0*'
_output_shapes
:????????? 2
Tanh_1b
mul_2MulSigmoid_2:y:0
Tanh_1:y:0*
T0*'
_output_shapes
:????????? 2
mul_2?
IdentityIdentity	mul_2:z:0^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp^MatMul_1/ReadVariableOp*
T0*'
_output_shapes
:????????? 2

Identity?

Identity_1Identity	mul_2:z:0^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp^MatMul_1/ReadVariableOp*
T0*'
_output_shapes
:????????? 2

Identity_1?

Identity_2Identity	add_1:z:0^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp^MatMul_1/ReadVariableOp*
T0*'
_output_shapes
:????????? 2

Identity_2"
identityIdentity:output:0"!

identity_1Identity_1:output:0"!

identity_2Identity_2:output:0*(
_construction_contextkEagerRuntime*R
_input_shapesA
?:?????????3:????????? :????????? : : : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp22
MatMul_1/ReadVariableOpMatMul_1/ReadVariableOp:O K
'
_output_shapes
:?????????3
 
_user_specified_nameinputs:QM
'
_output_shapes
:????????? 
"
_user_specified_name
states/0:QM
'
_output_shapes
:????????? 
"
_user_specified_name
states/1
?
?
C__inference_lstm_cell_layer_call_and_return_conditional_losses_9490

inputs
states_0
states_11
matmul_readvariableop_resource:	3?3
 matmul_1_readvariableop_resource:	 ?.
biasadd_readvariableop_resource:	?
identity

identity_1

identity_2??BiasAdd/ReadVariableOp?MatMul/ReadVariableOp?MatMul_1/ReadVariableOp?
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	3?*
dtype02
MatMul/ReadVariableOpt
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????2
MatMul?
MatMul_1/ReadVariableOpReadVariableOp matmul_1_readvariableop_resource*
_output_shapes
:	 ?*
dtype02
MatMul_1/ReadVariableOp|
MatMul_1MatMulstates_0MatMul_1/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????2

MatMul_1l
addAddV2MatMul:product:0MatMul_1:product:0*
T0*(
_output_shapes
:??????????2
add?
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
:?*
dtype02
BiasAdd/ReadVariableOpy
BiasAddBiasAddadd:z:0BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????2	
BiasAddd
split/split_dimConst*
_output_shapes
: *
dtype0*
value	B :2
split/split_dim?
splitSplitsplit/split_dim:output:0BiasAdd:output:0*
T0*`
_output_shapesN
L:????????? :????????? :????????? :????????? *
	num_split2
split_
SigmoidSigmoidsplit:output:0*
T0*'
_output_shapes
:????????? 2	
Sigmoidc
	Sigmoid_1Sigmoidsplit:output:1*
T0*'
_output_shapes
:????????? 2
	Sigmoid_1\
mulMulSigmoid_1:y:0states_1*
T0*'
_output_shapes
:????????? 2
mulV
TanhTanhsplit:output:2*
T0*'
_output_shapes
:????????? 2
Tanh^
mul_1MulSigmoid:y:0Tanh:y:0*
T0*'
_output_shapes
:????????? 2
mul_1]
add_1AddV2mul:z:0	mul_1:z:0*
T0*'
_output_shapes
:????????? 2
add_1c
	Sigmoid_2Sigmoidsplit:output:3*
T0*'
_output_shapes
:????????? 2
	Sigmoid_2U
Tanh_1Tanh	add_1:z:0*
T0*'
_output_shapes
:????????? 2
Tanh_1b
mul_2MulSigmoid_2:y:0
Tanh_1:y:0*
T0*'
_output_shapes
:????????? 2
mul_2?
IdentityIdentity	mul_2:z:0^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp^MatMul_1/ReadVariableOp*
T0*'
_output_shapes
:????????? 2

Identity?

Identity_1Identity	mul_2:z:0^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp^MatMul_1/ReadVariableOp*
T0*'
_output_shapes
:????????? 2

Identity_1?

Identity_2Identity	add_1:z:0^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp^MatMul_1/ReadVariableOp*
T0*'
_output_shapes
:????????? 2

Identity_2"
identityIdentity:output:0"!

identity_1Identity_1:output:0"!

identity_2Identity_2:output:0*(
_construction_contextkEagerRuntime*R
_input_shapesA
?:?????????3:????????? :????????? : : : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp22
MatMul_1/ReadVariableOpMatMul_1/ReadVariableOp:O K
'
_output_shapes
:?????????3
 
_user_specified_nameinputs:QM
'
_output_shapes
:????????? 
"
_user_specified_name
states/0:QM
'
_output_shapes
:????????? 
"
_user_specified_name
states/1
?
?
"__inference_rnn_layer_call_fn_9552
inputs_0
unknown:	3?
	unknown_0:	 ?
	unknown_1:	?
identity

identity_1

identity_2??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputs_0unknown	unknown_0	unknown_1*
Tin
2*
Tout
2*
_collective_manager_ids
 *M
_output_shapes;
9:????????? :????????? :????????? *%
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *F
fAR?
=__inference_rnn_layer_call_and_return_conditional_losses_79722
StatefulPartitionedCall?
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*'
_output_shapes
:????????? 2

Identity?

Identity_1Identity StatefulPartitionedCall:output:1^StatefulPartitionedCall*
T0*'
_output_shapes
:????????? 2

Identity_1?

Identity_2Identity StatefulPartitionedCall:output:2^StatefulPartitionedCall*
T0*'
_output_shapes
:????????? 2

Identity_2"
identityIdentity:output:0"!

identity_1Identity_1:output:0"!

identity_2Identity_2:output:0*(
_construction_contextkEagerRuntime*9
_input_shapes(
&:??????????????????3: : : 22
StatefulPartitionedCallStatefulPartitionedCall:^ Z
4
_output_shapes"
 :??????????????????3
"
_user_specified_name
inputs/0
?R
?
AR_LSTM_rnn_while_body_74524
0ar_lstm_rnn_while_ar_lstm_rnn_while_loop_counter:
6ar_lstm_rnn_while_ar_lstm_rnn_while_maximum_iterations!
ar_lstm_rnn_while_placeholder#
ar_lstm_rnn_while_placeholder_1#
ar_lstm_rnn_while_placeholder_2#
ar_lstm_rnn_while_placeholder_33
/ar_lstm_rnn_while_ar_lstm_rnn_strided_slice_1_0o
kar_lstm_rnn_while_tensorarrayv2read_tensorlistgetitem_ar_lstm_rnn_tensorarrayunstack_tensorlistfromtensor_0O
<ar_lstm_rnn_while_lstm_cell_matmul_readvariableop_resource_0:	3?Q
>ar_lstm_rnn_while_lstm_cell_matmul_1_readvariableop_resource_0:	 ?L
=ar_lstm_rnn_while_lstm_cell_biasadd_readvariableop_resource_0:	?
ar_lstm_rnn_while_identity 
ar_lstm_rnn_while_identity_1 
ar_lstm_rnn_while_identity_2 
ar_lstm_rnn_while_identity_3 
ar_lstm_rnn_while_identity_4 
ar_lstm_rnn_while_identity_51
-ar_lstm_rnn_while_ar_lstm_rnn_strided_slice_1m
iar_lstm_rnn_while_tensorarrayv2read_tensorlistgetitem_ar_lstm_rnn_tensorarrayunstack_tensorlistfromtensorM
:ar_lstm_rnn_while_lstm_cell_matmul_readvariableop_resource:	3?O
<ar_lstm_rnn_while_lstm_cell_matmul_1_readvariableop_resource:	 ?J
;ar_lstm_rnn_while_lstm_cell_biasadd_readvariableop_resource:	???2AR_LSTM/rnn/while/lstm_cell/BiasAdd/ReadVariableOp?1AR_LSTM/rnn/while/lstm_cell/MatMul/ReadVariableOp?3AR_LSTM/rnn/while/lstm_cell/MatMul_1/ReadVariableOp?
CAR_LSTM/rnn/while/TensorArrayV2Read/TensorListGetItem/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????3   2E
CAR_LSTM/rnn/while/TensorArrayV2Read/TensorListGetItem/element_shape?
5AR_LSTM/rnn/while/TensorArrayV2Read/TensorListGetItemTensorListGetItemkar_lstm_rnn_while_tensorarrayv2read_tensorlistgetitem_ar_lstm_rnn_tensorarrayunstack_tensorlistfromtensor_0ar_lstm_rnn_while_placeholderLAR_LSTM/rnn/while/TensorArrayV2Read/TensorListGetItem/element_shape:output:0*'
_output_shapes
:?????????3*
element_dtype027
5AR_LSTM/rnn/while/TensorArrayV2Read/TensorListGetItem?
1AR_LSTM/rnn/while/lstm_cell/MatMul/ReadVariableOpReadVariableOp<ar_lstm_rnn_while_lstm_cell_matmul_readvariableop_resource_0*
_output_shapes
:	3?*
dtype023
1AR_LSTM/rnn/while/lstm_cell/MatMul/ReadVariableOp?
"AR_LSTM/rnn/while/lstm_cell/MatMulMatMul<AR_LSTM/rnn/while/TensorArrayV2Read/TensorListGetItem:item:09AR_LSTM/rnn/while/lstm_cell/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????2$
"AR_LSTM/rnn/while/lstm_cell/MatMul?
3AR_LSTM/rnn/while/lstm_cell/MatMul_1/ReadVariableOpReadVariableOp>ar_lstm_rnn_while_lstm_cell_matmul_1_readvariableop_resource_0*
_output_shapes
:	 ?*
dtype025
3AR_LSTM/rnn/while/lstm_cell/MatMul_1/ReadVariableOp?
$AR_LSTM/rnn/while/lstm_cell/MatMul_1MatMular_lstm_rnn_while_placeholder_2;AR_LSTM/rnn/while/lstm_cell/MatMul_1/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????2&
$AR_LSTM/rnn/while/lstm_cell/MatMul_1?
AR_LSTM/rnn/while/lstm_cell/addAddV2,AR_LSTM/rnn/while/lstm_cell/MatMul:product:0.AR_LSTM/rnn/while/lstm_cell/MatMul_1:product:0*
T0*(
_output_shapes
:??????????2!
AR_LSTM/rnn/while/lstm_cell/add?
2AR_LSTM/rnn/while/lstm_cell/BiasAdd/ReadVariableOpReadVariableOp=ar_lstm_rnn_while_lstm_cell_biasadd_readvariableop_resource_0*
_output_shapes	
:?*
dtype024
2AR_LSTM/rnn/while/lstm_cell/BiasAdd/ReadVariableOp?
#AR_LSTM/rnn/while/lstm_cell/BiasAddBiasAdd#AR_LSTM/rnn/while/lstm_cell/add:z:0:AR_LSTM/rnn/while/lstm_cell/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????2%
#AR_LSTM/rnn/while/lstm_cell/BiasAdd?
+AR_LSTM/rnn/while/lstm_cell/split/split_dimConst*
_output_shapes
: *
dtype0*
value	B :2-
+AR_LSTM/rnn/while/lstm_cell/split/split_dim?
!AR_LSTM/rnn/while/lstm_cell/splitSplit4AR_LSTM/rnn/while/lstm_cell/split/split_dim:output:0,AR_LSTM/rnn/while/lstm_cell/BiasAdd:output:0*
T0*`
_output_shapesN
L:????????? :????????? :????????? :????????? *
	num_split2#
!AR_LSTM/rnn/while/lstm_cell/split?
#AR_LSTM/rnn/while/lstm_cell/SigmoidSigmoid*AR_LSTM/rnn/while/lstm_cell/split:output:0*
T0*'
_output_shapes
:????????? 2%
#AR_LSTM/rnn/while/lstm_cell/Sigmoid?
%AR_LSTM/rnn/while/lstm_cell/Sigmoid_1Sigmoid*AR_LSTM/rnn/while/lstm_cell/split:output:1*
T0*'
_output_shapes
:????????? 2'
%AR_LSTM/rnn/while/lstm_cell/Sigmoid_1?
AR_LSTM/rnn/while/lstm_cell/mulMul)AR_LSTM/rnn/while/lstm_cell/Sigmoid_1:y:0ar_lstm_rnn_while_placeholder_3*
T0*'
_output_shapes
:????????? 2!
AR_LSTM/rnn/while/lstm_cell/mul?
 AR_LSTM/rnn/while/lstm_cell/TanhTanh*AR_LSTM/rnn/while/lstm_cell/split:output:2*
T0*'
_output_shapes
:????????? 2"
 AR_LSTM/rnn/while/lstm_cell/Tanh?
!AR_LSTM/rnn/while/lstm_cell/mul_1Mul'AR_LSTM/rnn/while/lstm_cell/Sigmoid:y:0$AR_LSTM/rnn/while/lstm_cell/Tanh:y:0*
T0*'
_output_shapes
:????????? 2#
!AR_LSTM/rnn/while/lstm_cell/mul_1?
!AR_LSTM/rnn/while/lstm_cell/add_1AddV2#AR_LSTM/rnn/while/lstm_cell/mul:z:0%AR_LSTM/rnn/while/lstm_cell/mul_1:z:0*
T0*'
_output_shapes
:????????? 2#
!AR_LSTM/rnn/while/lstm_cell/add_1?
%AR_LSTM/rnn/while/lstm_cell/Sigmoid_2Sigmoid*AR_LSTM/rnn/while/lstm_cell/split:output:3*
T0*'
_output_shapes
:????????? 2'
%AR_LSTM/rnn/while/lstm_cell/Sigmoid_2?
"AR_LSTM/rnn/while/lstm_cell/Tanh_1Tanh%AR_LSTM/rnn/while/lstm_cell/add_1:z:0*
T0*'
_output_shapes
:????????? 2$
"AR_LSTM/rnn/while/lstm_cell/Tanh_1?
!AR_LSTM/rnn/while/lstm_cell/mul_2Mul)AR_LSTM/rnn/while/lstm_cell/Sigmoid_2:y:0&AR_LSTM/rnn/while/lstm_cell/Tanh_1:y:0*
T0*'
_output_shapes
:????????? 2#
!AR_LSTM/rnn/while/lstm_cell/mul_2?
6AR_LSTM/rnn/while/TensorArrayV2Write/TensorListSetItemTensorListSetItemar_lstm_rnn_while_placeholder_1ar_lstm_rnn_while_placeholder%AR_LSTM/rnn/while/lstm_cell/mul_2:z:0*
_output_shapes
: *
element_dtype028
6AR_LSTM/rnn/while/TensorArrayV2Write/TensorListSetItemt
AR_LSTM/rnn/while/add/yConst*
_output_shapes
: *
dtype0*
value	B :2
AR_LSTM/rnn/while/add/y?
AR_LSTM/rnn/while/addAddV2ar_lstm_rnn_while_placeholder AR_LSTM/rnn/while/add/y:output:0*
T0*
_output_shapes
: 2
AR_LSTM/rnn/while/addx
AR_LSTM/rnn/while/add_1/yConst*
_output_shapes
: *
dtype0*
value	B :2
AR_LSTM/rnn/while/add_1/y?
AR_LSTM/rnn/while/add_1AddV20ar_lstm_rnn_while_ar_lstm_rnn_while_loop_counter"AR_LSTM/rnn/while/add_1/y:output:0*
T0*
_output_shapes
: 2
AR_LSTM/rnn/while/add_1?
AR_LSTM/rnn/while/IdentityIdentityAR_LSTM/rnn/while/add_1:z:03^AR_LSTM/rnn/while/lstm_cell/BiasAdd/ReadVariableOp2^AR_LSTM/rnn/while/lstm_cell/MatMul/ReadVariableOp4^AR_LSTM/rnn/while/lstm_cell/MatMul_1/ReadVariableOp*
T0*
_output_shapes
: 2
AR_LSTM/rnn/while/Identity?
AR_LSTM/rnn/while/Identity_1Identity6ar_lstm_rnn_while_ar_lstm_rnn_while_maximum_iterations3^AR_LSTM/rnn/while/lstm_cell/BiasAdd/ReadVariableOp2^AR_LSTM/rnn/while/lstm_cell/MatMul/ReadVariableOp4^AR_LSTM/rnn/while/lstm_cell/MatMul_1/ReadVariableOp*
T0*
_output_shapes
: 2
AR_LSTM/rnn/while/Identity_1?
AR_LSTM/rnn/while/Identity_2IdentityAR_LSTM/rnn/while/add:z:03^AR_LSTM/rnn/while/lstm_cell/BiasAdd/ReadVariableOp2^AR_LSTM/rnn/while/lstm_cell/MatMul/ReadVariableOp4^AR_LSTM/rnn/while/lstm_cell/MatMul_1/ReadVariableOp*
T0*
_output_shapes
: 2
AR_LSTM/rnn/while/Identity_2?
AR_LSTM/rnn/while/Identity_3IdentityFAR_LSTM/rnn/while/TensorArrayV2Write/TensorListSetItem:output_handle:03^AR_LSTM/rnn/while/lstm_cell/BiasAdd/ReadVariableOp2^AR_LSTM/rnn/while/lstm_cell/MatMul/ReadVariableOp4^AR_LSTM/rnn/while/lstm_cell/MatMul_1/ReadVariableOp*
T0*
_output_shapes
: 2
AR_LSTM/rnn/while/Identity_3?
AR_LSTM/rnn/while/Identity_4Identity%AR_LSTM/rnn/while/lstm_cell/mul_2:z:03^AR_LSTM/rnn/while/lstm_cell/BiasAdd/ReadVariableOp2^AR_LSTM/rnn/while/lstm_cell/MatMul/ReadVariableOp4^AR_LSTM/rnn/while/lstm_cell/MatMul_1/ReadVariableOp*
T0*'
_output_shapes
:????????? 2
AR_LSTM/rnn/while/Identity_4?
AR_LSTM/rnn/while/Identity_5Identity%AR_LSTM/rnn/while/lstm_cell/add_1:z:03^AR_LSTM/rnn/while/lstm_cell/BiasAdd/ReadVariableOp2^AR_LSTM/rnn/while/lstm_cell/MatMul/ReadVariableOp4^AR_LSTM/rnn/while/lstm_cell/MatMul_1/ReadVariableOp*
T0*'
_output_shapes
:????????? 2
AR_LSTM/rnn/while/Identity_5"`
-ar_lstm_rnn_while_ar_lstm_rnn_strided_slice_1/ar_lstm_rnn_while_ar_lstm_rnn_strided_slice_1_0"A
ar_lstm_rnn_while_identity#AR_LSTM/rnn/while/Identity:output:0"E
ar_lstm_rnn_while_identity_1%AR_LSTM/rnn/while/Identity_1:output:0"E
ar_lstm_rnn_while_identity_2%AR_LSTM/rnn/while/Identity_2:output:0"E
ar_lstm_rnn_while_identity_3%AR_LSTM/rnn/while/Identity_3:output:0"E
ar_lstm_rnn_while_identity_4%AR_LSTM/rnn/while/Identity_4:output:0"E
ar_lstm_rnn_while_identity_5%AR_LSTM/rnn/while/Identity_5:output:0"|
;ar_lstm_rnn_while_lstm_cell_biasadd_readvariableop_resource=ar_lstm_rnn_while_lstm_cell_biasadd_readvariableop_resource_0"~
<ar_lstm_rnn_while_lstm_cell_matmul_1_readvariableop_resource>ar_lstm_rnn_while_lstm_cell_matmul_1_readvariableop_resource_0"z
:ar_lstm_rnn_while_lstm_cell_matmul_readvariableop_resource<ar_lstm_rnn_while_lstm_cell_matmul_readvariableop_resource_0"?
iar_lstm_rnn_while_tensorarrayv2read_tensorlistgetitem_ar_lstm_rnn_tensorarrayunstack_tensorlistfromtensorkar_lstm_rnn_while_tensorarrayv2read_tensorlistgetitem_ar_lstm_rnn_tensorarrayunstack_tensorlistfromtensor_0*(
_construction_contextkEagerRuntime*K
_input_shapes:
8: : : : :????????? :????????? : : : : : 2h
2AR_LSTM/rnn/while/lstm_cell/BiasAdd/ReadVariableOp2AR_LSTM/rnn/while/lstm_cell/BiasAdd/ReadVariableOp2f
1AR_LSTM/rnn/while/lstm_cell/MatMul/ReadVariableOp1AR_LSTM/rnn/while/lstm_cell/MatMul/ReadVariableOp2j
3AR_LSTM/rnn/while/lstm_cell/MatMul_1/ReadVariableOp3AR_LSTM/rnn/while/lstm_cell/MatMul_1/ReadVariableOp: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :-)
'
_output_shapes
:????????? :-)
'
_output_shapes
:????????? :

_output_shapes
: :

_output_shapes
: 
?
?
C__inference_lstm_cell_layer_call_and_return_conditional_losses_7820

inputs

states
states_11
matmul_readvariableop_resource:	3?3
 matmul_1_readvariableop_resource:	 ?.
biasadd_readvariableop_resource:	?
identity

identity_1

identity_2??BiasAdd/ReadVariableOp?MatMul/ReadVariableOp?MatMul_1/ReadVariableOp?
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	3?*
dtype02
MatMul/ReadVariableOpt
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????2
MatMul?
MatMul_1/ReadVariableOpReadVariableOp matmul_1_readvariableop_resource*
_output_shapes
:	 ?*
dtype02
MatMul_1/ReadVariableOpz
MatMul_1MatMulstatesMatMul_1/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????2

MatMul_1l
addAddV2MatMul:product:0MatMul_1:product:0*
T0*(
_output_shapes
:??????????2
add?
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
:?*
dtype02
BiasAdd/ReadVariableOpy
BiasAddBiasAddadd:z:0BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????2	
BiasAddd
split/split_dimConst*
_output_shapes
: *
dtype0*
value	B :2
split/split_dim?
splitSplitsplit/split_dim:output:0BiasAdd:output:0*
T0*`
_output_shapesN
L:????????? :????????? :????????? :????????? *
	num_split2
split_
SigmoidSigmoidsplit:output:0*
T0*'
_output_shapes
:????????? 2	
Sigmoidc
	Sigmoid_1Sigmoidsplit:output:1*
T0*'
_output_shapes
:????????? 2
	Sigmoid_1\
mulMulSigmoid_1:y:0states_1*
T0*'
_output_shapes
:????????? 2
mulV
TanhTanhsplit:output:2*
T0*'
_output_shapes
:????????? 2
Tanh^
mul_1MulSigmoid:y:0Tanh:y:0*
T0*'
_output_shapes
:????????? 2
mul_1]
add_1AddV2mul:z:0	mul_1:z:0*
T0*'
_output_shapes
:????????? 2
add_1c
	Sigmoid_2Sigmoidsplit:output:3*
T0*'
_output_shapes
:????????? 2
	Sigmoid_2U
Tanh_1Tanh	add_1:z:0*
T0*'
_output_shapes
:????????? 2
Tanh_1b
mul_2MulSigmoid_2:y:0
Tanh_1:y:0*
T0*'
_output_shapes
:????????? 2
mul_2?
IdentityIdentity	mul_2:z:0^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp^MatMul_1/ReadVariableOp*
T0*'
_output_shapes
:????????? 2

Identity?

Identity_1Identity	mul_2:z:0^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp^MatMul_1/ReadVariableOp*
T0*'
_output_shapes
:????????? 2

Identity_1?

Identity_2Identity	add_1:z:0^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp^MatMul_1/ReadVariableOp*
T0*'
_output_shapes
:????????? 2

Identity_2"
identityIdentity:output:0"!

identity_1Identity_1:output:0"!

identity_2Identity_2:output:0*(
_construction_contextkEagerRuntime*R
_input_shapesA
?:?????????3:????????? :????????? : : : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp22
MatMul_1/ReadVariableOpMatMul_1/ReadVariableOp:O K
'
_output_shapes
:?????????3
 
_user_specified_nameinputs:OK
'
_output_shapes
:????????? 
 
_user_specified_namestates:OK
'
_output_shapes
:????????? 
 
_user_specified_namestates
?\
?
>__inference_rnn_layer_call_and_return_conditional_losses_10190

inputs;
(lstm_cell_matmul_readvariableop_resource:	3?=
*lstm_cell_matmul_1_readvariableop_resource:	 ?8
)lstm_cell_biasadd_readvariableop_resource:	?
identity

identity_1

identity_2?? lstm_cell/BiasAdd/ReadVariableOp?lstm_cell/MatMul/ReadVariableOp?!lstm_cell/MatMul_1/ReadVariableOp?whileD
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
strided_slice\
zeros/mul/yConst*
_output_shapes
: *
dtype0*
value	B : 2
zeros/mul/yl
	zeros/mulMulstrided_slice:output:0zeros/mul/y:output:0*
T0*
_output_shapes
: 2
	zeros/mul_
zeros/Less/yConst*
_output_shapes
: *
dtype0*
value
B :?2
zeros/Less/yg

zeros/LessLesszeros/mul:z:0zeros/Less/y:output:0*
T0*
_output_shapes
: 2

zeros/Lessb
zeros/packed/1Const*
_output_shapes
: *
dtype0*
value	B : 2
zeros/packed/1?
zeros/packedPackstrided_slice:output:0zeros/packed/1:output:0*
N*
T0*
_output_shapes
:2
zeros/packed_
zeros/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    2
zeros/Constu
zerosFillzeros/packed:output:0zeros/Const:output:0*
T0*'
_output_shapes
:????????? 2
zeros`
zeros_1/mul/yConst*
_output_shapes
: *
dtype0*
value	B : 2
zeros_1/mul/yr
zeros_1/mulMulstrided_slice:output:0zeros_1/mul/y:output:0*
T0*
_output_shapes
: 2
zeros_1/mulc
zeros_1/Less/yConst*
_output_shapes
: *
dtype0*
value
B :?2
zeros_1/Less/yo
zeros_1/LessLesszeros_1/mul:z:0zeros_1/Less/y:output:0*
T0*
_output_shapes
: 2
zeros_1/Lessf
zeros_1/packed/1Const*
_output_shapes
: *
dtype0*
value	B : 2
zeros_1/packed/1?
zeros_1/packedPackstrided_slice:output:0zeros_1/packed/1:output:0*
N*
T0*
_output_shapes
:2
zeros_1/packedc
zeros_1/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    2
zeros_1/Const}
zeros_1Fillzeros_1/packed:output:0zeros_1/Const:output:0*
T0*'
_output_shapes
:????????? 2	
zeros_1u
transpose/permConst*
_output_shapes
:*
dtype0*!
valueB"          2
transpose/perm?
	transpose	Transposeinputstranspose/perm:output:0*
T0*4
_output_shapes"
 :??????????????????32
	transposeO
Shape_1Shapetranspose:y:0*
T0*
_output_shapes
:2	
Shape_1x
strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice_1/stack|
strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_1/stack_1|
strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_1/stack_2?
strided_slice_1StridedSliceShape_1:output:0strided_slice_1/stack:output:0 strided_slice_1/stack_1:output:0 strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
strided_slice_1?
TensorArrayV2/element_shapeConst*
_output_shapes
: *
dtype0*
valueB :
?????????2
TensorArrayV2/element_shape?
TensorArrayV2TensorListReserve$TensorArrayV2/element_shape:output:0strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type02
TensorArrayV2?
5TensorArrayUnstack/TensorListFromTensor/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????3   27
5TensorArrayUnstack/TensorListFromTensor/element_shape?
'TensorArrayUnstack/TensorListFromTensorTensorListFromTensortranspose:y:0>TensorArrayUnstack/TensorListFromTensor/element_shape:output:0*
_output_shapes
: *
element_dtype0*

shape_type02)
'TensorArrayUnstack/TensorListFromTensorx
strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice_2/stack|
strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_2/stack_1|
strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_2/stack_2?
strided_slice_2StridedSlicetranspose:y:0strided_slice_2/stack:output:0 strided_slice_2/stack_1:output:0 strided_slice_2/stack_2:output:0*
Index0*
T0*'
_output_shapes
:?????????3*
shrink_axis_mask2
strided_slice_2?
lstm_cell/MatMul/ReadVariableOpReadVariableOp(lstm_cell_matmul_readvariableop_resource*
_output_shapes
:	3?*
dtype02!
lstm_cell/MatMul/ReadVariableOp?
lstm_cell/MatMulMatMulstrided_slice_2:output:0'lstm_cell/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????2
lstm_cell/MatMul?
!lstm_cell/MatMul_1/ReadVariableOpReadVariableOp*lstm_cell_matmul_1_readvariableop_resource*
_output_shapes
:	 ?*
dtype02#
!lstm_cell/MatMul_1/ReadVariableOp?
lstm_cell/MatMul_1MatMulzeros:output:0)lstm_cell/MatMul_1/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????2
lstm_cell/MatMul_1?
lstm_cell/addAddV2lstm_cell/MatMul:product:0lstm_cell/MatMul_1:product:0*
T0*(
_output_shapes
:??????????2
lstm_cell/add?
 lstm_cell/BiasAdd/ReadVariableOpReadVariableOp)lstm_cell_biasadd_readvariableop_resource*
_output_shapes	
:?*
dtype02"
 lstm_cell/BiasAdd/ReadVariableOp?
lstm_cell/BiasAddBiasAddlstm_cell/add:z:0(lstm_cell/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????2
lstm_cell/BiasAddx
lstm_cell/split/split_dimConst*
_output_shapes
: *
dtype0*
value	B :2
lstm_cell/split/split_dim?
lstm_cell/splitSplit"lstm_cell/split/split_dim:output:0lstm_cell/BiasAdd:output:0*
T0*`
_output_shapesN
L:????????? :????????? :????????? :????????? *
	num_split2
lstm_cell/split}
lstm_cell/SigmoidSigmoidlstm_cell/split:output:0*
T0*'
_output_shapes
:????????? 2
lstm_cell/Sigmoid?
lstm_cell/Sigmoid_1Sigmoidlstm_cell/split:output:1*
T0*'
_output_shapes
:????????? 2
lstm_cell/Sigmoid_1?
lstm_cell/mulMullstm_cell/Sigmoid_1:y:0zeros_1:output:0*
T0*'
_output_shapes
:????????? 2
lstm_cell/mult
lstm_cell/TanhTanhlstm_cell/split:output:2*
T0*'
_output_shapes
:????????? 2
lstm_cell/Tanh?
lstm_cell/mul_1Mullstm_cell/Sigmoid:y:0lstm_cell/Tanh:y:0*
T0*'
_output_shapes
:????????? 2
lstm_cell/mul_1?
lstm_cell/add_1AddV2lstm_cell/mul:z:0lstm_cell/mul_1:z:0*
T0*'
_output_shapes
:????????? 2
lstm_cell/add_1?
lstm_cell/Sigmoid_2Sigmoidlstm_cell/split:output:3*
T0*'
_output_shapes
:????????? 2
lstm_cell/Sigmoid_2s
lstm_cell/Tanh_1Tanhlstm_cell/add_1:z:0*
T0*'
_output_shapes
:????????? 2
lstm_cell/Tanh_1?
lstm_cell/mul_2Mullstm_cell/Sigmoid_2:y:0lstm_cell/Tanh_1:y:0*
T0*'
_output_shapes
:????????? 2
lstm_cell/mul_2?
TensorArrayV2_1/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????    2
TensorArrayV2_1/element_shape?
TensorArrayV2_1TensorListReserve&TensorArrayV2_1/element_shape:output:0strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type02
TensorArrayV2_1N
timeConst*
_output_shapes
: *
dtype0*
value	B : 2
time
while/maximum_iterationsConst*
_output_shapes
: *
dtype0*
valueB :
?????????2
while/maximum_iterationsj
while/loop_counterConst*
_output_shapes
: *
dtype0*
value	B : 2
while/loop_counter?
whileWhilewhile/loop_counter:output:0!while/maximum_iterations:output:0time:output:0TensorArrayV2_1:handle:0zeros:output:0zeros_1:output:0strided_slice_1:output:07TensorArrayUnstack/TensorListFromTensor:output_handle:0(lstm_cell_matmul_readvariableop_resource*lstm_cell_matmul_1_readvariableop_resource)lstm_cell_biasadd_readvariableop_resource*
T
2*
_lower_using_switch_merge(*
_num_original_outputs*L
_output_shapes:
8: : : : :????????? :????????? : : : : : *%
_read_only_resource_inputs
	
*
bodyR
while_body_10105*
condR
while_cond_10104*K
output_shapes:
8: : : : :????????? :????????? : : : : : *
parallel_iterations 2
while?
0TensorArrayV2Stack/TensorListStack/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????    22
0TensorArrayV2Stack/TensorListStack/element_shape?
"TensorArrayV2Stack/TensorListStackTensorListStackwhile:output:39TensorArrayV2Stack/TensorListStack/element_shape:output:0*4
_output_shapes"
 :?????????????????? *
element_dtype02$
"TensorArrayV2Stack/TensorListStack?
strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB:
?????????2
strided_slice_3/stack|
strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice_3/stack_1|
strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_3/stack_2?
strided_slice_3StridedSlice+TensorArrayV2Stack/TensorListStack:tensor:0strided_slice_3/stack:output:0 strided_slice_3/stack_1:output:0 strided_slice_3/stack_2:output:0*
Index0*
T0*'
_output_shapes
:????????? *
shrink_axis_mask2
strided_slice_3y
transpose_1/permConst*
_output_shapes
:*
dtype0*!
valueB"          2
transpose_1/perm?
transpose_1	Transpose+TensorArrayV2Stack/TensorListStack:tensor:0transpose_1/perm:output:0*
T0*4
_output_shapes"
 :?????????????????? 2
transpose_1?
IdentityIdentitystrided_slice_3:output:0!^lstm_cell/BiasAdd/ReadVariableOp ^lstm_cell/MatMul/ReadVariableOp"^lstm_cell/MatMul_1/ReadVariableOp^while*
T0*'
_output_shapes
:????????? 2

Identity?

Identity_1Identitywhile:output:4!^lstm_cell/BiasAdd/ReadVariableOp ^lstm_cell/MatMul/ReadVariableOp"^lstm_cell/MatMul_1/ReadVariableOp^while*
T0*'
_output_shapes
:????????? 2

Identity_1?

Identity_2Identitywhile:output:5!^lstm_cell/BiasAdd/ReadVariableOp ^lstm_cell/MatMul/ReadVariableOp"^lstm_cell/MatMul_1/ReadVariableOp^while*
T0*'
_output_shapes
:????????? 2

Identity_2"
identityIdentity:output:0"!

identity_1Identity_1:output:0"!

identity_2Identity_2:output:0*(
_construction_contextkEagerRuntime*9
_input_shapes(
&:??????????????????3: : : 2D
 lstm_cell/BiasAdd/ReadVariableOp lstm_cell/BiasAdd/ReadVariableOp2B
lstm_cell/MatMul/ReadVariableOplstm_cell/MatMul/ReadVariableOp2F
!lstm_cell/MatMul_1/ReadVariableOp!lstm_cell/MatMul_1/ReadVariableOp2
whilewhile:\ X
4
_output_shapes"
 :??????????????????3
 
_user_specified_nameinputs
?
?
while_cond_9952
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_placeholder_2
while_placeholder_3
while_less_strided_slice_12
.while_while_cond_9952___redundant_placeholder02
.while_while_cond_9952___redundant_placeholder12
.while_while_cond_9952___redundant_placeholder22
.while_while_cond_9952___redundant_placeholder3
while_identity
p

while/LessLesswhile_placeholderwhile_less_strided_slice_1*
T0*
_output_shapes
: 2

while/Less]
while/IdentityIdentitywhile/Less:z:0*
T0
*
_output_shapes
: 2
while/Identity")
while_identitywhile/Identity:output:0*(
_construction_contextkEagerRuntime*S
_input_shapesB
@: : : : :????????? :????????? : ::::: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :-)
'
_output_shapes
:????????? :-)
'
_output_shapes
:????????? :

_output_shapes
: :

_output_shapes
:
?
?
C__inference_lstm_cell_layer_call_and_return_conditional_losses_8429

inputs

states
states_11
matmul_readvariableop_resource:	3?3
 matmul_1_readvariableop_resource:	 ?.
biasadd_readvariableop_resource:	?
identity

identity_1

identity_2??BiasAdd/ReadVariableOp?MatMul/ReadVariableOp?MatMul_1/ReadVariableOp?
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	3?*
dtype02
MatMul/ReadVariableOpt
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????2
MatMul?
MatMul_1/ReadVariableOpReadVariableOp matmul_1_readvariableop_resource*
_output_shapes
:	 ?*
dtype02
MatMul_1/ReadVariableOpz
MatMul_1MatMulstatesMatMul_1/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????2

MatMul_1l
addAddV2MatMul:product:0MatMul_1:product:0*
T0*(
_output_shapes
:??????????2
add?
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
:?*
dtype02
BiasAdd/ReadVariableOpy
BiasAddBiasAddadd:z:0BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????2	
BiasAddd
split/split_dimConst*
_output_shapes
: *
dtype0*
value	B :2
split/split_dim?
splitSplitsplit/split_dim:output:0BiasAdd:output:0*
T0*`
_output_shapesN
L:????????? :????????? :????????? :????????? *
	num_split2
split_
SigmoidSigmoidsplit:output:0*
T0*'
_output_shapes
:????????? 2	
Sigmoidc
	Sigmoid_1Sigmoidsplit:output:1*
T0*'
_output_shapes
:????????? 2
	Sigmoid_1\
mulMulSigmoid_1:y:0states_1*
T0*'
_output_shapes
:????????? 2
mulV
TanhTanhsplit:output:2*
T0*'
_output_shapes
:????????? 2
Tanh^
mul_1MulSigmoid:y:0Tanh:y:0*
T0*'
_output_shapes
:????????? 2
mul_1]
add_1AddV2mul:z:0	mul_1:z:0*
T0*'
_output_shapes
:????????? 2
add_1c
	Sigmoid_2Sigmoidsplit:output:3*
T0*'
_output_shapes
:????????? 2
	Sigmoid_2U
Tanh_1Tanh	add_1:z:0*
T0*'
_output_shapes
:????????? 2
Tanh_1b
mul_2MulSigmoid_2:y:0
Tanh_1:y:0*
T0*'
_output_shapes
:????????? 2
mul_2?
IdentityIdentity	mul_2:z:0^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp^MatMul_1/ReadVariableOp*
T0*'
_output_shapes
:????????? 2

Identity?

Identity_1Identity	mul_2:z:0^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp^MatMul_1/ReadVariableOp*
T0*'
_output_shapes
:????????? 2

Identity_1?

Identity_2Identity	add_1:z:0^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp^MatMul_1/ReadVariableOp*
T0*'
_output_shapes
:????????? 2

Identity_2"
identityIdentity:output:0"!

identity_1Identity_1:output:0"!

identity_2Identity_2:output:0*(
_construction_contextkEagerRuntime*R
_input_shapesA
?:?????????3:????????? :????????? : : : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp22
MatMul_1/ReadVariableOpMatMul_1/ReadVariableOp:O K
'
_output_shapes
:?????????3
 
_user_specified_nameinputs:OK
'
_output_shapes
:????????? 
 
_user_specified_namestates:OK
'
_output_shapes
:????????? 
 
_user_specified_namestates
?
?
while_cond_9648
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_placeholder_2
while_placeholder_3
while_less_strided_slice_12
.while_while_cond_9648___redundant_placeholder02
.while_while_cond_9648___redundant_placeholder12
.while_while_cond_9648___redundant_placeholder22
.while_while_cond_9648___redundant_placeholder3
while_identity
p

while/LessLesswhile_placeholderwhile_less_strided_slice_1*
T0*
_output_shapes
: 2

while/Less]
while/IdentityIdentitywhile/Less:z:0*
T0
*
_output_shapes
: 2
while/Identity")
while_identitywhile/Identity:output:0*(
_construction_contextkEagerRuntime*S
_input_shapesB
@: : : : :????????? :????????? : ::::: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :-)
'
_output_shapes
:????????? :-)
'
_output_shapes
:????????? :

_output_shapes
: :

_output_shapes
:
?	
?
B__inference_dense_1_layer_call_and_return_conditional_losses_10209

inputs0
matmul_readvariableop_resource: 3-
biasadd_readvariableop_resource:3
identity??BiasAdd/ReadVariableOp?MatMul/ReadVariableOp?
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

: 3*
dtype02
MatMul/ReadVariableOps
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????32
MatMul?
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:3*
dtype02
BiasAdd/ReadVariableOp?
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????32	
BiasAdd?
IdentityIdentityBiasAdd:output:0^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*
T0*'
_output_shapes
:?????????32

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:????????? : : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:O K
'
_output_shapes
:????????? 
 
_user_specified_nameinputs
?i
?
!__inference__traced_restore_10386
file_prefix@
-assignvariableop_ar_lstm_rnn_lstm_cell_kernel:	3?L
9assignvariableop_1_ar_lstm_rnn_lstm_cell_recurrent_kernel:	 ?<
-assignvariableop_2_ar_lstm_rnn_lstm_cell_bias:	?;
)assignvariableop_3_ar_lstm_dense_1_kernel: 35
'assignvariableop_4_ar_lstm_dense_1_bias:3&
assignvariableop_5_adam_iter:	 (
assignvariableop_6_adam_beta_1: (
assignvariableop_7_adam_beta_2: '
assignvariableop_8_adam_decay: /
%assignvariableop_9_adam_learning_rate: #
assignvariableop_10_total: #
assignvariableop_11_count: %
assignvariableop_12_total_1: %
assignvariableop_13_count_1: J
7assignvariableop_14_adam_ar_lstm_rnn_lstm_cell_kernel_m:	3?T
Aassignvariableop_15_adam_ar_lstm_rnn_lstm_cell_recurrent_kernel_m:	 ?D
5assignvariableop_16_adam_ar_lstm_rnn_lstm_cell_bias_m:	?C
1assignvariableop_17_adam_ar_lstm_dense_1_kernel_m: 3=
/assignvariableop_18_adam_ar_lstm_dense_1_bias_m:3J
7assignvariableop_19_adam_ar_lstm_rnn_lstm_cell_kernel_v:	3?T
Aassignvariableop_20_adam_ar_lstm_rnn_lstm_cell_recurrent_kernel_v:	 ?D
5assignvariableop_21_adam_ar_lstm_rnn_lstm_cell_bias_v:	?C
1assignvariableop_22_adam_ar_lstm_dense_1_kernel_v: 3=
/assignvariableop_23_adam_ar_lstm_dense_1_bias_v:3
identity_25??AssignVariableOp?AssignVariableOp_1?AssignVariableOp_10?AssignVariableOp_11?AssignVariableOp_12?AssignVariableOp_13?AssignVariableOp_14?AssignVariableOp_15?AssignVariableOp_16?AssignVariableOp_17?AssignVariableOp_18?AssignVariableOp_19?AssignVariableOp_2?AssignVariableOp_20?AssignVariableOp_21?AssignVariableOp_22?AssignVariableOp_23?AssignVariableOp_3?AssignVariableOp_4?AssignVariableOp_5?AssignVariableOp_6?AssignVariableOp_7?AssignVariableOp_8?AssignVariableOp_9?
RestoreV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:*
dtype0*?
value?B?B+lstm_cell/kernel/.ATTRIBUTES/VARIABLE_VALUEB5lstm_cell/recurrent_kernel/.ATTRIBUTES/VARIABLE_VALUEB)lstm_cell/bias/.ATTRIBUTES/VARIABLE_VALUEB'dense/kernel/.ATTRIBUTES/VARIABLE_VALUEB%dense/bias/.ATTRIBUTES/VARIABLE_VALUEB)optimizer/iter/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_1/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_2/.ATTRIBUTES/VARIABLE_VALUEB*optimizer/decay/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/learning_rate/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/count/.ATTRIBUTES/VARIABLE_VALUEBGlstm_cell/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBQlstm_cell/recurrent_kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBElstm_cell/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCdense/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBAdense/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBGlstm_cell/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBQlstm_cell/recurrent_kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBElstm_cell/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCdense/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBAdense/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPH2
RestoreV2/tensor_names?
RestoreV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:*
dtype0*E
value<B:B B B B B B B B B B B B B B B B B B B B B B B B B 2
RestoreV2/shape_and_slices?
	RestoreV2	RestoreV2file_prefixRestoreV2/tensor_names:output:0#RestoreV2/shape_and_slices:output:0"/device:CPU:0*x
_output_shapesf
d:::::::::::::::::::::::::*'
dtypes
2	2
	RestoreV2g
IdentityIdentityRestoreV2:tensors:0"/device:CPU:0*
T0*
_output_shapes
:2

Identity?
AssignVariableOpAssignVariableOp-assignvariableop_ar_lstm_rnn_lstm_cell_kernelIdentity:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOpk

Identity_1IdentityRestoreV2:tensors:1"/device:CPU:0*
T0*
_output_shapes
:2

Identity_1?
AssignVariableOp_1AssignVariableOp9assignvariableop_1_ar_lstm_rnn_lstm_cell_recurrent_kernelIdentity_1:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_1k

Identity_2IdentityRestoreV2:tensors:2"/device:CPU:0*
T0*
_output_shapes
:2

Identity_2?
AssignVariableOp_2AssignVariableOp-assignvariableop_2_ar_lstm_rnn_lstm_cell_biasIdentity_2:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_2k

Identity_3IdentityRestoreV2:tensors:3"/device:CPU:0*
T0*
_output_shapes
:2

Identity_3?
AssignVariableOp_3AssignVariableOp)assignvariableop_3_ar_lstm_dense_1_kernelIdentity_3:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_3k

Identity_4IdentityRestoreV2:tensors:4"/device:CPU:0*
T0*
_output_shapes
:2

Identity_4?
AssignVariableOp_4AssignVariableOp'assignvariableop_4_ar_lstm_dense_1_biasIdentity_4:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_4k

Identity_5IdentityRestoreV2:tensors:5"/device:CPU:0*
T0	*
_output_shapes
:2

Identity_5?
AssignVariableOp_5AssignVariableOpassignvariableop_5_adam_iterIdentity_5:output:0"/device:CPU:0*
_output_shapes
 *
dtype0	2
AssignVariableOp_5k

Identity_6IdentityRestoreV2:tensors:6"/device:CPU:0*
T0*
_output_shapes
:2

Identity_6?
AssignVariableOp_6AssignVariableOpassignvariableop_6_adam_beta_1Identity_6:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_6k

Identity_7IdentityRestoreV2:tensors:7"/device:CPU:0*
T0*
_output_shapes
:2

Identity_7?
AssignVariableOp_7AssignVariableOpassignvariableop_7_adam_beta_2Identity_7:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_7k

Identity_8IdentityRestoreV2:tensors:8"/device:CPU:0*
T0*
_output_shapes
:2

Identity_8?
AssignVariableOp_8AssignVariableOpassignvariableop_8_adam_decayIdentity_8:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_8k

Identity_9IdentityRestoreV2:tensors:9"/device:CPU:0*
T0*
_output_shapes
:2

Identity_9?
AssignVariableOp_9AssignVariableOp%assignvariableop_9_adam_learning_rateIdentity_9:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_9n
Identity_10IdentityRestoreV2:tensors:10"/device:CPU:0*
T0*
_output_shapes
:2
Identity_10?
AssignVariableOp_10AssignVariableOpassignvariableop_10_totalIdentity_10:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_10n
Identity_11IdentityRestoreV2:tensors:11"/device:CPU:0*
T0*
_output_shapes
:2
Identity_11?
AssignVariableOp_11AssignVariableOpassignvariableop_11_countIdentity_11:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_11n
Identity_12IdentityRestoreV2:tensors:12"/device:CPU:0*
T0*
_output_shapes
:2
Identity_12?
AssignVariableOp_12AssignVariableOpassignvariableop_12_total_1Identity_12:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_12n
Identity_13IdentityRestoreV2:tensors:13"/device:CPU:0*
T0*
_output_shapes
:2
Identity_13?
AssignVariableOp_13AssignVariableOpassignvariableop_13_count_1Identity_13:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_13n
Identity_14IdentityRestoreV2:tensors:14"/device:CPU:0*
T0*
_output_shapes
:2
Identity_14?
AssignVariableOp_14AssignVariableOp7assignvariableop_14_adam_ar_lstm_rnn_lstm_cell_kernel_mIdentity_14:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_14n
Identity_15IdentityRestoreV2:tensors:15"/device:CPU:0*
T0*
_output_shapes
:2
Identity_15?
AssignVariableOp_15AssignVariableOpAassignvariableop_15_adam_ar_lstm_rnn_lstm_cell_recurrent_kernel_mIdentity_15:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_15n
Identity_16IdentityRestoreV2:tensors:16"/device:CPU:0*
T0*
_output_shapes
:2
Identity_16?
AssignVariableOp_16AssignVariableOp5assignvariableop_16_adam_ar_lstm_rnn_lstm_cell_bias_mIdentity_16:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_16n
Identity_17IdentityRestoreV2:tensors:17"/device:CPU:0*
T0*
_output_shapes
:2
Identity_17?
AssignVariableOp_17AssignVariableOp1assignvariableop_17_adam_ar_lstm_dense_1_kernel_mIdentity_17:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_17n
Identity_18IdentityRestoreV2:tensors:18"/device:CPU:0*
T0*
_output_shapes
:2
Identity_18?
AssignVariableOp_18AssignVariableOp/assignvariableop_18_adam_ar_lstm_dense_1_bias_mIdentity_18:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_18n
Identity_19IdentityRestoreV2:tensors:19"/device:CPU:0*
T0*
_output_shapes
:2
Identity_19?
AssignVariableOp_19AssignVariableOp7assignvariableop_19_adam_ar_lstm_rnn_lstm_cell_kernel_vIdentity_19:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_19n
Identity_20IdentityRestoreV2:tensors:20"/device:CPU:0*
T0*
_output_shapes
:2
Identity_20?
AssignVariableOp_20AssignVariableOpAassignvariableop_20_adam_ar_lstm_rnn_lstm_cell_recurrent_kernel_vIdentity_20:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_20n
Identity_21IdentityRestoreV2:tensors:21"/device:CPU:0*
T0*
_output_shapes
:2
Identity_21?
AssignVariableOp_21AssignVariableOp5assignvariableop_21_adam_ar_lstm_rnn_lstm_cell_bias_vIdentity_21:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_21n
Identity_22IdentityRestoreV2:tensors:22"/device:CPU:0*
T0*
_output_shapes
:2
Identity_22?
AssignVariableOp_22AssignVariableOp1assignvariableop_22_adam_ar_lstm_dense_1_kernel_vIdentity_22:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_22n
Identity_23IdentityRestoreV2:tensors:23"/device:CPU:0*
T0*
_output_shapes
:2
Identity_23?
AssignVariableOp_23AssignVariableOp/assignvariableop_23_adam_ar_lstm_dense_1_bias_vIdentity_23:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_239
NoOpNoOp"/device:CPU:0*
_output_shapes
 2
NoOp?
Identity_24Identityfile_prefix^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_10^AssignVariableOp_11^AssignVariableOp_12^AssignVariableOp_13^AssignVariableOp_14^AssignVariableOp_15^AssignVariableOp_16^AssignVariableOp_17^AssignVariableOp_18^AssignVariableOp_19^AssignVariableOp_2^AssignVariableOp_20^AssignVariableOp_21^AssignVariableOp_22^AssignVariableOp_23^AssignVariableOp_3^AssignVariableOp_4^AssignVariableOp_5^AssignVariableOp_6^AssignVariableOp_7^AssignVariableOp_8^AssignVariableOp_9^NoOp"/device:CPU:0*
T0*
_output_shapes
: 2
Identity_24?
Identity_25IdentityIdentity_24:output:0^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_10^AssignVariableOp_11^AssignVariableOp_12^AssignVariableOp_13^AssignVariableOp_14^AssignVariableOp_15^AssignVariableOp_16^AssignVariableOp_17^AssignVariableOp_18^AssignVariableOp_19^AssignVariableOp_2^AssignVariableOp_20^AssignVariableOp_21^AssignVariableOp_22^AssignVariableOp_23^AssignVariableOp_3^AssignVariableOp_4^AssignVariableOp_5^AssignVariableOp_6^AssignVariableOp_7^AssignVariableOp_8^AssignVariableOp_9*
T0*
_output_shapes
: 2
Identity_25"#
identity_25Identity_25:output:0*E
_input_shapes4
2: : : : : : : : : : : : : : : : : : : : : : : : : 2$
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
AssignVariableOp_20AssignVariableOp_202*
AssignVariableOp_21AssignVariableOp_212*
AssignVariableOp_22AssignVariableOp_222*
AssignVariableOp_23AssignVariableOp_232(
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
?
?
&__inference_AR_LSTM_layer_call_fn_8465
input_1
unknown:	3?
	unknown_0:	 ?
	unknown_1:	?
	unknown_2: 3
	unknown_3:3
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinput_1unknown	unknown_0	unknown_1	unknown_2	unknown_3*
Tin

2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:?????????3*'
_read_only_resource_inputs	
*-
config_proto

CPU

GPU 2J 8? *J
fERC
A__inference_AR_LSTM_layer_call_and_return_conditional_losses_84522
StatefulPartitionedCall?
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*+
_output_shapes
:?????????32

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*=
_input_shapes,
*:??????????????????3: : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:] Y
4
_output_shapes"
 :??????????????????3
!
_user_specified_name	input_1
?
?
AR_LSTM_rnn_while_cond_74514
0ar_lstm_rnn_while_ar_lstm_rnn_while_loop_counter:
6ar_lstm_rnn_while_ar_lstm_rnn_while_maximum_iterations!
ar_lstm_rnn_while_placeholder#
ar_lstm_rnn_while_placeholder_1#
ar_lstm_rnn_while_placeholder_2#
ar_lstm_rnn_while_placeholder_36
2ar_lstm_rnn_while_less_ar_lstm_rnn_strided_slice_1J
Far_lstm_rnn_while_ar_lstm_rnn_while_cond_7451___redundant_placeholder0J
Far_lstm_rnn_while_ar_lstm_rnn_while_cond_7451___redundant_placeholder1J
Far_lstm_rnn_while_ar_lstm_rnn_while_cond_7451___redundant_placeholder2J
Far_lstm_rnn_while_ar_lstm_rnn_while_cond_7451___redundant_placeholder3
ar_lstm_rnn_while_identity
?
AR_LSTM/rnn/while/LessLessar_lstm_rnn_while_placeholder2ar_lstm_rnn_while_less_ar_lstm_rnn_strided_slice_1*
T0*
_output_shapes
: 2
AR_LSTM/rnn/while/Less?
AR_LSTM/rnn/while/IdentityIdentityAR_LSTM/rnn/while/Less:z:0*
T0
*
_output_shapes
: 2
AR_LSTM/rnn/while/Identity"A
ar_lstm_rnn_while_identity#AR_LSTM/rnn/while/Identity:output:0*(
_construction_contextkEagerRuntime*S
_input_shapesB
@: : : : :????????? :????????? : ::::: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :-)
'
_output_shapes
:????????? :-)
'
_output_shapes
:????????? :

_output_shapes
: :

_output_shapes
:
?%
?
A__inference_AR_LSTM_layer_call_and_return_conditional_losses_8749

inputs
rnn_8713:	3?
rnn_8715:	 ?
rnn_8717:	?
dense_1_8722: 3
dense_1_8724:3
identity??dense_1/StatefulPartitionedCall?!dense_1/StatefulPartitionedCall_1?!dense_1/StatefulPartitionedCall_2?!lstm_cell/StatefulPartitionedCall?#lstm_cell/StatefulPartitionedCall_1?rnn/StatefulPartitionedCall?
rnn/StatefulPartitionedCallStatefulPartitionedCallinputsrnn_8713rnn_8715rnn_8717*
Tin
2*
Tout
2*
_collective_manager_ids
 *M
_output_shapes;
9:????????? :????????? :????????? *%
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *F
fAR?
=__inference_rnn_layer_call_and_return_conditional_losses_86802
rnn/StatefulPartitionedCall?
dense_1/StatefulPartitionedCallStatefulPartitionedCall$rnn/StatefulPartitionedCall:output:0dense_1_8722dense_1_8724*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????3*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *J
fERC
A__inference_dense_1_layer_call_and_return_conditional_losses_83922!
dense_1/StatefulPartitionedCall?
!lstm_cell/StatefulPartitionedCallStatefulPartitionedCall(dense_1/StatefulPartitionedCall:output:0$rnn/StatefulPartitionedCall:output:1$rnn/StatefulPartitionedCall:output:2rnn_8713rnn_8715rnn_8717*
Tin

2*
Tout
2*
_collective_manager_ids
 *M
_output_shapes;
9:????????? :????????? :????????? *%
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *L
fGRE
C__inference_lstm_cell_layer_call_and_return_conditional_losses_85282#
!lstm_cell/StatefulPartitionedCall?
!dense_1/StatefulPartitionedCall_1StatefulPartitionedCall*lstm_cell/StatefulPartitionedCall:output:0dense_1_8722dense_1_8724*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????3*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *J
fERC
A__inference_dense_1_layer_call_and_return_conditional_losses_83922#
!dense_1/StatefulPartitionedCall_1?
#lstm_cell/StatefulPartitionedCall_1StatefulPartitionedCall*dense_1/StatefulPartitionedCall_1:output:0*lstm_cell/StatefulPartitionedCall:output:1*lstm_cell/StatefulPartitionedCall:output:2rnn_8713rnn_8715rnn_8717*
Tin

2*
Tout
2*
_collective_manager_ids
 *M
_output_shapes;
9:????????? :????????? :????????? *%
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *L
fGRE
C__inference_lstm_cell_layer_call_and_return_conditional_losses_85282%
#lstm_cell/StatefulPartitionedCall_1?
!dense_1/StatefulPartitionedCall_2StatefulPartitionedCall,lstm_cell/StatefulPartitionedCall_1:output:0dense_1_8722dense_1_8724*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????3*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *J
fERC
A__inference_dense_1_layer_call_and_return_conditional_losses_83922#
!dense_1/StatefulPartitionedCall_2?
stackPack(dense_1/StatefulPartitionedCall:output:0*dense_1/StatefulPartitionedCall_1:output:0*dense_1/StatefulPartitionedCall_2:output:0*
N*
T0*+
_output_shapes
:?????????32
stacku
transpose/permConst*
_output_shapes
:*
dtype0*!
valueB"          2
transpose/perm?
	transpose	Transposestack:output:0transpose/perm:output:0*
T0*+
_output_shapes
:?????????32
	transpose?
IdentityIdentitytranspose:y:0 ^dense_1/StatefulPartitionedCall"^dense_1/StatefulPartitionedCall_1"^dense_1/StatefulPartitionedCall_2"^lstm_cell/StatefulPartitionedCall$^lstm_cell/StatefulPartitionedCall_1^rnn/StatefulPartitionedCall*
T0*+
_output_shapes
:?????????32

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*=
_input_shapes,
*:??????????????????3: : : : : 2B
dense_1/StatefulPartitionedCalldense_1/StatefulPartitionedCall2F
!dense_1/StatefulPartitionedCall_1!dense_1/StatefulPartitionedCall_12F
!dense_1/StatefulPartitionedCall_2!dense_1/StatefulPartitionedCall_22F
!lstm_cell/StatefulPartitionedCall!lstm_cell/StatefulPartitionedCall2J
#lstm_cell/StatefulPartitionedCall_1#lstm_cell/StatefulPartitionedCall_12:
rnn/StatefulPartitionedCallrnn/StatefulPartitionedCall:\ X
4
_output_shapes"
 :??????????????????3
 
_user_specified_nameinputs
?%
?
A__inference_AR_LSTM_layer_call_and_return_conditional_losses_8855
input_1
rnn_8819:	3?
rnn_8821:	 ?
rnn_8823:	?
dense_1_8828: 3
dense_1_8830:3
identity??dense_1/StatefulPartitionedCall?!dense_1/StatefulPartitionedCall_1?!dense_1/StatefulPartitionedCall_2?!lstm_cell/StatefulPartitionedCall?#lstm_cell/StatefulPartitionedCall_1?rnn/StatefulPartitionedCall?
rnn/StatefulPartitionedCallStatefulPartitionedCallinput_1rnn_8819rnn_8821rnn_8823*
Tin
2*
Tout
2*
_collective_manager_ids
 *M
_output_shapes;
9:????????? :????????? :????????? *%
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *F
fAR?
=__inference_rnn_layer_call_and_return_conditional_losses_86802
rnn/StatefulPartitionedCall?
dense_1/StatefulPartitionedCallStatefulPartitionedCall$rnn/StatefulPartitionedCall:output:0dense_1_8828dense_1_8830*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????3*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *J
fERC
A__inference_dense_1_layer_call_and_return_conditional_losses_83922!
dense_1/StatefulPartitionedCall?
!lstm_cell/StatefulPartitionedCallStatefulPartitionedCall(dense_1/StatefulPartitionedCall:output:0$rnn/StatefulPartitionedCall:output:1$rnn/StatefulPartitionedCall:output:2rnn_8819rnn_8821rnn_8823*
Tin

2*
Tout
2*
_collective_manager_ids
 *M
_output_shapes;
9:????????? :????????? :????????? *%
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *L
fGRE
C__inference_lstm_cell_layer_call_and_return_conditional_losses_85282#
!lstm_cell/StatefulPartitionedCall?
!dense_1/StatefulPartitionedCall_1StatefulPartitionedCall*lstm_cell/StatefulPartitionedCall:output:0dense_1_8828dense_1_8830*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????3*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *J
fERC
A__inference_dense_1_layer_call_and_return_conditional_losses_83922#
!dense_1/StatefulPartitionedCall_1?
#lstm_cell/StatefulPartitionedCall_1StatefulPartitionedCall*dense_1/StatefulPartitionedCall_1:output:0*lstm_cell/StatefulPartitionedCall:output:1*lstm_cell/StatefulPartitionedCall:output:2rnn_8819rnn_8821rnn_8823*
Tin

2*
Tout
2*
_collective_manager_ids
 *M
_output_shapes;
9:????????? :????????? :????????? *%
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *L
fGRE
C__inference_lstm_cell_layer_call_and_return_conditional_losses_85282%
#lstm_cell/StatefulPartitionedCall_1?
!dense_1/StatefulPartitionedCall_2StatefulPartitionedCall,lstm_cell/StatefulPartitionedCall_1:output:0dense_1_8828dense_1_8830*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????3*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *J
fERC
A__inference_dense_1_layer_call_and_return_conditional_losses_83922#
!dense_1/StatefulPartitionedCall_2?
stackPack(dense_1/StatefulPartitionedCall:output:0*dense_1/StatefulPartitionedCall_1:output:0*dense_1/StatefulPartitionedCall_2:output:0*
N*
T0*+
_output_shapes
:?????????32
stacku
transpose/permConst*
_output_shapes
:*
dtype0*!
valueB"          2
transpose/perm?
	transpose	Transposestack:output:0transpose/perm:output:0*
T0*+
_output_shapes
:?????????32
	transpose?
IdentityIdentitytranspose:y:0 ^dense_1/StatefulPartitionedCall"^dense_1/StatefulPartitionedCall_1"^dense_1/StatefulPartitionedCall_2"^lstm_cell/StatefulPartitionedCall$^lstm_cell/StatefulPartitionedCall_1^rnn/StatefulPartitionedCall*
T0*+
_output_shapes
:?????????32

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*=
_input_shapes,
*:??????????????????3: : : : : 2B
dense_1/StatefulPartitionedCalldense_1/StatefulPartitionedCall2F
!dense_1/StatefulPartitionedCall_1!dense_1/StatefulPartitionedCall_12F
!dense_1/StatefulPartitionedCall_2!dense_1/StatefulPartitionedCall_22F
!lstm_cell/StatefulPartitionedCall!lstm_cell/StatefulPartitionedCall2J
#lstm_cell/StatefulPartitionedCall_1#lstm_cell/StatefulPartitionedCall_12:
rnn/StatefulPartitionedCallrnn/StatefulPartitionedCall:] Y
4
_output_shapes"
 :??????????????????3
!
_user_specified_name	input_1
?F
?	
rnn_while_body_8975$
 rnn_while_rnn_while_loop_counter*
&rnn_while_rnn_while_maximum_iterations
rnn_while_placeholder
rnn_while_placeholder_1
rnn_while_placeholder_2
rnn_while_placeholder_3#
rnn_while_rnn_strided_slice_1_0_
[rnn_while_tensorarrayv2read_tensorlistgetitem_rnn_tensorarrayunstack_tensorlistfromtensor_0G
4rnn_while_lstm_cell_matmul_readvariableop_resource_0:	3?I
6rnn_while_lstm_cell_matmul_1_readvariableop_resource_0:	 ?D
5rnn_while_lstm_cell_biasadd_readvariableop_resource_0:	?
rnn_while_identity
rnn_while_identity_1
rnn_while_identity_2
rnn_while_identity_3
rnn_while_identity_4
rnn_while_identity_5!
rnn_while_rnn_strided_slice_1]
Yrnn_while_tensorarrayv2read_tensorlistgetitem_rnn_tensorarrayunstack_tensorlistfromtensorE
2rnn_while_lstm_cell_matmul_readvariableop_resource:	3?G
4rnn_while_lstm_cell_matmul_1_readvariableop_resource:	 ?B
3rnn_while_lstm_cell_biasadd_readvariableop_resource:	???*rnn/while/lstm_cell/BiasAdd/ReadVariableOp?)rnn/while/lstm_cell/MatMul/ReadVariableOp?+rnn/while/lstm_cell/MatMul_1/ReadVariableOp?
;rnn/while/TensorArrayV2Read/TensorListGetItem/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????3   2=
;rnn/while/TensorArrayV2Read/TensorListGetItem/element_shape?
-rnn/while/TensorArrayV2Read/TensorListGetItemTensorListGetItem[rnn_while_tensorarrayv2read_tensorlistgetitem_rnn_tensorarrayunstack_tensorlistfromtensor_0rnn_while_placeholderDrnn/while/TensorArrayV2Read/TensorListGetItem/element_shape:output:0*'
_output_shapes
:?????????3*
element_dtype02/
-rnn/while/TensorArrayV2Read/TensorListGetItem?
)rnn/while/lstm_cell/MatMul/ReadVariableOpReadVariableOp4rnn_while_lstm_cell_matmul_readvariableop_resource_0*
_output_shapes
:	3?*
dtype02+
)rnn/while/lstm_cell/MatMul/ReadVariableOp?
rnn/while/lstm_cell/MatMulMatMul4rnn/while/TensorArrayV2Read/TensorListGetItem:item:01rnn/while/lstm_cell/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????2
rnn/while/lstm_cell/MatMul?
+rnn/while/lstm_cell/MatMul_1/ReadVariableOpReadVariableOp6rnn_while_lstm_cell_matmul_1_readvariableop_resource_0*
_output_shapes
:	 ?*
dtype02-
+rnn/while/lstm_cell/MatMul_1/ReadVariableOp?
rnn/while/lstm_cell/MatMul_1MatMulrnn_while_placeholder_23rnn/while/lstm_cell/MatMul_1/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????2
rnn/while/lstm_cell/MatMul_1?
rnn/while/lstm_cell/addAddV2$rnn/while/lstm_cell/MatMul:product:0&rnn/while/lstm_cell/MatMul_1:product:0*
T0*(
_output_shapes
:??????????2
rnn/while/lstm_cell/add?
*rnn/while/lstm_cell/BiasAdd/ReadVariableOpReadVariableOp5rnn_while_lstm_cell_biasadd_readvariableop_resource_0*
_output_shapes	
:?*
dtype02,
*rnn/while/lstm_cell/BiasAdd/ReadVariableOp?
rnn/while/lstm_cell/BiasAddBiasAddrnn/while/lstm_cell/add:z:02rnn/while/lstm_cell/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????2
rnn/while/lstm_cell/BiasAdd?
#rnn/while/lstm_cell/split/split_dimConst*
_output_shapes
: *
dtype0*
value	B :2%
#rnn/while/lstm_cell/split/split_dim?
rnn/while/lstm_cell/splitSplit,rnn/while/lstm_cell/split/split_dim:output:0$rnn/while/lstm_cell/BiasAdd:output:0*
T0*`
_output_shapesN
L:????????? :????????? :????????? :????????? *
	num_split2
rnn/while/lstm_cell/split?
rnn/while/lstm_cell/SigmoidSigmoid"rnn/while/lstm_cell/split:output:0*
T0*'
_output_shapes
:????????? 2
rnn/while/lstm_cell/Sigmoid?
rnn/while/lstm_cell/Sigmoid_1Sigmoid"rnn/while/lstm_cell/split:output:1*
T0*'
_output_shapes
:????????? 2
rnn/while/lstm_cell/Sigmoid_1?
rnn/while/lstm_cell/mulMul!rnn/while/lstm_cell/Sigmoid_1:y:0rnn_while_placeholder_3*
T0*'
_output_shapes
:????????? 2
rnn/while/lstm_cell/mul?
rnn/while/lstm_cell/TanhTanh"rnn/while/lstm_cell/split:output:2*
T0*'
_output_shapes
:????????? 2
rnn/while/lstm_cell/Tanh?
rnn/while/lstm_cell/mul_1Mulrnn/while/lstm_cell/Sigmoid:y:0rnn/while/lstm_cell/Tanh:y:0*
T0*'
_output_shapes
:????????? 2
rnn/while/lstm_cell/mul_1?
rnn/while/lstm_cell/add_1AddV2rnn/while/lstm_cell/mul:z:0rnn/while/lstm_cell/mul_1:z:0*
T0*'
_output_shapes
:????????? 2
rnn/while/lstm_cell/add_1?
rnn/while/lstm_cell/Sigmoid_2Sigmoid"rnn/while/lstm_cell/split:output:3*
T0*'
_output_shapes
:????????? 2
rnn/while/lstm_cell/Sigmoid_2?
rnn/while/lstm_cell/Tanh_1Tanhrnn/while/lstm_cell/add_1:z:0*
T0*'
_output_shapes
:????????? 2
rnn/while/lstm_cell/Tanh_1?
rnn/while/lstm_cell/mul_2Mul!rnn/while/lstm_cell/Sigmoid_2:y:0rnn/while/lstm_cell/Tanh_1:y:0*
T0*'
_output_shapes
:????????? 2
rnn/while/lstm_cell/mul_2?
.rnn/while/TensorArrayV2Write/TensorListSetItemTensorListSetItemrnn_while_placeholder_1rnn_while_placeholderrnn/while/lstm_cell/mul_2:z:0*
_output_shapes
: *
element_dtype020
.rnn/while/TensorArrayV2Write/TensorListSetItemd
rnn/while/add/yConst*
_output_shapes
: *
dtype0*
value	B :2
rnn/while/add/yy
rnn/while/addAddV2rnn_while_placeholderrnn/while/add/y:output:0*
T0*
_output_shapes
: 2
rnn/while/addh
rnn/while/add_1/yConst*
_output_shapes
: *
dtype0*
value	B :2
rnn/while/add_1/y?
rnn/while/add_1AddV2 rnn_while_rnn_while_loop_counterrnn/while/add_1/y:output:0*
T0*
_output_shapes
: 2
rnn/while/add_1?
rnn/while/IdentityIdentityrnn/while/add_1:z:0+^rnn/while/lstm_cell/BiasAdd/ReadVariableOp*^rnn/while/lstm_cell/MatMul/ReadVariableOp,^rnn/while/lstm_cell/MatMul_1/ReadVariableOp*
T0*
_output_shapes
: 2
rnn/while/Identity?
rnn/while/Identity_1Identity&rnn_while_rnn_while_maximum_iterations+^rnn/while/lstm_cell/BiasAdd/ReadVariableOp*^rnn/while/lstm_cell/MatMul/ReadVariableOp,^rnn/while/lstm_cell/MatMul_1/ReadVariableOp*
T0*
_output_shapes
: 2
rnn/while/Identity_1?
rnn/while/Identity_2Identityrnn/while/add:z:0+^rnn/while/lstm_cell/BiasAdd/ReadVariableOp*^rnn/while/lstm_cell/MatMul/ReadVariableOp,^rnn/while/lstm_cell/MatMul_1/ReadVariableOp*
T0*
_output_shapes
: 2
rnn/while/Identity_2?
rnn/while/Identity_3Identity>rnn/while/TensorArrayV2Write/TensorListSetItem:output_handle:0+^rnn/while/lstm_cell/BiasAdd/ReadVariableOp*^rnn/while/lstm_cell/MatMul/ReadVariableOp,^rnn/while/lstm_cell/MatMul_1/ReadVariableOp*
T0*
_output_shapes
: 2
rnn/while/Identity_3?
rnn/while/Identity_4Identityrnn/while/lstm_cell/mul_2:z:0+^rnn/while/lstm_cell/BiasAdd/ReadVariableOp*^rnn/while/lstm_cell/MatMul/ReadVariableOp,^rnn/while/lstm_cell/MatMul_1/ReadVariableOp*
T0*'
_output_shapes
:????????? 2
rnn/while/Identity_4?
rnn/while/Identity_5Identityrnn/while/lstm_cell/add_1:z:0+^rnn/while/lstm_cell/BiasAdd/ReadVariableOp*^rnn/while/lstm_cell/MatMul/ReadVariableOp,^rnn/while/lstm_cell/MatMul_1/ReadVariableOp*
T0*'
_output_shapes
:????????? 2
rnn/while/Identity_5"1
rnn_while_identityrnn/while/Identity:output:0"5
rnn_while_identity_1rnn/while/Identity_1:output:0"5
rnn_while_identity_2rnn/while/Identity_2:output:0"5
rnn_while_identity_3rnn/while/Identity_3:output:0"5
rnn_while_identity_4rnn/while/Identity_4:output:0"5
rnn_while_identity_5rnn/while/Identity_5:output:0"l
3rnn_while_lstm_cell_biasadd_readvariableop_resource5rnn_while_lstm_cell_biasadd_readvariableop_resource_0"n
4rnn_while_lstm_cell_matmul_1_readvariableop_resource6rnn_while_lstm_cell_matmul_1_readvariableop_resource_0"j
2rnn_while_lstm_cell_matmul_readvariableop_resource4rnn_while_lstm_cell_matmul_readvariableop_resource_0"@
rnn_while_rnn_strided_slice_1rnn_while_rnn_strided_slice_1_0"?
Yrnn_while_tensorarrayv2read_tensorlistgetitem_rnn_tensorarrayunstack_tensorlistfromtensor[rnn_while_tensorarrayv2read_tensorlistgetitem_rnn_tensorarrayunstack_tensorlistfromtensor_0*(
_construction_contextkEagerRuntime*K
_input_shapes:
8: : : : :????????? :????????? : : : : : 2X
*rnn/while/lstm_cell/BiasAdd/ReadVariableOp*rnn/while/lstm_cell/BiasAdd/ReadVariableOp2V
)rnn/while/lstm_cell/MatMul/ReadVariableOp)rnn/while/lstm_cell/MatMul/ReadVariableOp2Z
+rnn/while/lstm_cell/MatMul_1/ReadVariableOp+rnn/while/lstm_cell/MatMul_1/ReadVariableOp: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :-)
'
_output_shapes
:????????? :-)
'
_output_shapes
:????????? :

_output_shapes
: :

_output_shapes
: "?L
saver_filename:0StatefulPartitionedCall_1:0StatefulPartitionedCall_28"
saved_model_main_op

NoOp*>
__saved_model_init_op%#
__saved_model_init_op

NoOp*?
serving_default?
H
input_1=
serving_default_input_1:0??????????????????3@
output_14
StatefulPartitionedCall:0?????????3tensorflow/serving/predict:??
?

	lstm_cell
lstm_rnn
	dense
	optimizer
regularization_losses
trainable_variables
	variables
	keras_api
	
signatures
L_default_save_signature
M__call__
*N&call_and_return_all_conditional_losses"?
_tf_keras_model?{"name": "AR_LSTM", "trainable": true, "expects_training_arg": true, "dtype": "float32", "batch_input_shape": null, "must_restore_from_config": false, "class_name": "FeedBack", "config": {"layer was saved without config": true}, "is_graph_network": false, "save_spec": {"class_name": "TypeSpec", "type_spec": "tf.TensorSpec", "serialized": [{"class_name": "TensorShape", "items": [null, null, 51]}, "float32", "input_1"]}, "keras_version": "2.5.0", "backend": "tensorflow", "model_config": {"class_name": "FeedBack"}, "training_config": {"loss": {"class_name": "MeanSquaredError", "config": {"reduction": "auto", "name": "mean_squared_error"}, "shared_object_id": 0}, "metrics": [[{"class_name": "MeanAbsoluteError", "config": {"name": "mean_absolute_error", "dtype": "float32"}, "shared_object_id": 1}]], "weighted_metrics": null, "loss_weights": null, "optimizer_config": {"class_name": "Adam", "config": {"name": "Adam", "learning_rate": 0.009999999776482582, "decay": 0.0, "beta_1": 0.8999999761581421, "beta_2": 0.9990000128746033, "epsilon": 1e-07, "amsgrad": false}}}}
?	


state_size

kernel
recurrent_kernel
bias
regularization_losses
trainable_variables
	variables
	keras_api
O__call__
*P&call_and_return_all_conditional_losses"?
_tf_keras_layer?{"name": "lstm_cell", "trainable": true, "expects_training_arg": true, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "class_name": "LSTMCell", "config": {"name": "lstm_cell", "trainable": true, "dtype": "float32", "units": 32, "activation": "tanh", "recurrent_activation": "sigmoid", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}, "shared_object_id": 2}, "recurrent_initializer": {"class_name": "Orthogonal", "config": {"gain": 1.0, "seed": null}, "shared_object_id": 3}, "bias_initializer": {"class_name": "Zeros", "config": {}, "shared_object_id": 4}, "unit_forget_bias": true, "kernel_regularizer": null, "recurrent_regularizer": null, "bias_regularizer": null, "kernel_constraint": null, "recurrent_constraint": null, "bias_constraint": null, "dropout": 0.0, "recurrent_dropout": 0.0, "implementation": 2}, "shared_object_id": 5}
?
cell

state_spec
regularization_losses
trainable_variables
	variables
	keras_api
Q__call__
*R&call_and_return_all_conditional_losses"?
_tf_keras_rnn_layer?{"name": "rnn", "trainable": true, "expects_training_arg": true, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "class_name": "RNN", "config": {"name": "rnn", "trainable": true, "dtype": "float32", "return_sequences": false, "return_state": true, "go_backwards": false, "stateful": false, "unroll": false, "time_major": false, "cell": {"class_name": "LSTMCell", "config": {"name": "lstm_cell", "trainable": true, "dtype": "float32", "units": 32, "activation": "tanh", "recurrent_activation": "sigmoid", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}, "shared_object_id": 2}, "recurrent_initializer": {"class_name": "Orthogonal", "config": {"gain": 1.0, "seed": null}, "shared_object_id": 3}, "bias_initializer": {"class_name": "Zeros", "config": {}, "shared_object_id": 4}, "unit_forget_bias": true, "kernel_regularizer": null, "recurrent_regularizer": null, "bias_regularizer": null, "kernel_constraint": null, "recurrent_constraint": null, "bias_constraint": null, "dropout": 0.0, "recurrent_dropout": 0.0, "implementation": 2}, "shared_object_id": 5}}, "shared_object_id": 6, "input_spec": [{"class_name": "InputSpec", "config": {"dtype": null, "shape": {"class_name": "__tuple__", "items": [null, null, 51]}, "ndim": 3, "max_ndim": null, "min_ndim": null, "axes": {}}, "shared_object_id": 7}], "build_input_shape": {"class_name": "TensorShape", "items": [null, null, 51]}}
?

kernel
bias
regularization_losses
trainable_variables
	variables
	keras_api
S__call__
*T&call_and_return_all_conditional_losses"?
_tf_keras_layer?{"name": "dense_1", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "class_name": "Dense", "config": {"name": "dense_1", "trainable": true, "dtype": "float32", "units": 51, "activation": "linear", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}, "shared_object_id": 8}, "bias_initializer": {"class_name": "Zeros", "config": {}, "shared_object_id": 9}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "shared_object_id": 10, "input_spec": {"class_name": "InputSpec", "config": {"dtype": null, "shape": null, "ndim": null, "max_ndim": null, "min_ndim": 2, "axes": {"-1": 32}}, "shared_object_id": 11}, "build_input_shape": {"class_name": "TensorShape", "items": [null, 32]}}
?
iter

beta_1

beta_2
	 decay
!learning_ratemBmCmDmEmFvGvHvIvJvK"
	optimizer
 "
trackable_list_wrapper
C
0
1
2
3
4"
trackable_list_wrapper
C
0
1
2
3
4"
trackable_list_wrapper
?
regularization_losses
"layer_metrics
trainable_variables
#layer_regularization_losses
$metrics

%layers
&non_trainable_variables
	variables
M__call__
L_default_save_signature
*N&call_and_return_all_conditional_losses
&N"call_and_return_conditional_losses"
_generic_user_object
,
Userving_default"
signature_map
 "
trackable_list_wrapper
/:-	3?2AR_LSTM/rnn/lstm_cell/kernel
9:7	 ?2&AR_LSTM/rnn/lstm_cell/recurrent_kernel
):'?2AR_LSTM/rnn/lstm_cell/bias
 "
trackable_list_wrapper
5
0
1
2"
trackable_list_wrapper
5
0
1
2"
trackable_list_wrapper
?
regularization_losses
'layer_metrics
trainable_variables
(layer_regularization_losses
)metrics

*layers
+non_trainable_variables
	variables
O__call__
*P&call_and_return_all_conditional_losses
&P"call_and_return_conditional_losses"
_generic_user_object
 "
trackable_list_wrapper
 "
trackable_list_wrapper
5
0
1
2"
trackable_list_wrapper
5
0
1
2"
trackable_list_wrapper
?
regularization_losses
,layer_metrics

-states
trainable_variables
.layer_regularization_losses
/metrics

0layers
1non_trainable_variables
	variables
Q__call__
*R&call_and_return_all_conditional_losses
&R"call_and_return_conditional_losses"
_generic_user_object
(:& 32AR_LSTM/dense_1/kernel
": 32AR_LSTM/dense_1/bias
 "
trackable_list_wrapper
.
0
1"
trackable_list_wrapper
.
0
1"
trackable_list_wrapper
?
regularization_losses
2layer_metrics
trainable_variables
3layer_regularization_losses
4metrics

5layers
6non_trainable_variables
	variables
S__call__
*T&call_and_return_all_conditional_losses
&T"call_and_return_conditional_losses"
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
70
81"
trackable_list_wrapper
5
0
1
2"
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
'
0"
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
	9total
	:count
;	variables
<	keras_api"?
_tf_keras_metric?{"class_name": "Mean", "name": "loss", "dtype": "float32", "config": {"name": "loss", "dtype": "float32"}, "shared_object_id": 12}
?
	=total
	>count
?
_fn_kwargs
@	variables
A	keras_api"?
_tf_keras_metric?{"class_name": "MeanAbsoluteError", "name": "mean_absolute_error", "dtype": "float32", "config": {"name": "mean_absolute_error", "dtype": "float32"}, "shared_object_id": 1}
:  (2total
:  (2count
.
90
:1"
trackable_list_wrapper
-
;	variables"
_generic_user_object
:  (2total
:  (2count
 "
trackable_dict_wrapper
.
=0
>1"
trackable_list_wrapper
-
@	variables"
_generic_user_object
4:2	3?2#Adam/AR_LSTM/rnn/lstm_cell/kernel/m
>:<	 ?2-Adam/AR_LSTM/rnn/lstm_cell/recurrent_kernel/m
.:,?2!Adam/AR_LSTM/rnn/lstm_cell/bias/m
-:+ 32Adam/AR_LSTM/dense_1/kernel/m
':%32Adam/AR_LSTM/dense_1/bias/m
4:2	3?2#Adam/AR_LSTM/rnn/lstm_cell/kernel/v
>:<	 ?2-Adam/AR_LSTM/rnn/lstm_cell/recurrent_kernel/v
.:,?2!Adam/AR_LSTM/rnn/lstm_cell/bias/v
-:+ 32Adam/AR_LSTM/dense_1/kernel/v
':%32Adam/AR_LSTM/dense_1/bias/v
?2?
__inference__wrapped_model_7594?
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
annotations? *3?0
.?+
input_1??????????????????3
?2?
&__inference_AR_LSTM_layer_call_fn_8465
&__inference_AR_LSTM_layer_call_fn_8893
&__inference_AR_LSTM_layer_call_fn_8908
&__inference_AR_LSTM_layer_call_fn_8777?
???
FullArgSpec)
args!?
jself
jinputs

jtraining
varargs
 
varkw
 
defaults?
p 

kwonlyargs? 
kwonlydefaults? 
annotations? *
 
?2?
A__inference_AR_LSTM_layer_call_and_return_conditional_losses_9117
A__inference_AR_LSTM_layer_call_and_return_conditional_losses_9326
A__inference_AR_LSTM_layer_call_and_return_conditional_losses_8816
A__inference_AR_LSTM_layer_call_and_return_conditional_losses_8855?
???
FullArgSpec)
args!?
jself
jinputs

jtraining
varargs
 
varkw
 
defaults?
p 

kwonlyargs? 
kwonlydefaults? 
annotations? *
 
?2?
(__inference_lstm_cell_layer_call_fn_9343
(__inference_lstm_cell_layer_call_fn_9360
(__inference_lstm_cell_layer_call_fn_9377
(__inference_lstm_cell_layer_call_fn_9394?
???
FullArgSpec3
args+?(
jself
jinputs
jstates

jtraining
varargs
 
varkw
 
defaults?
p 

kwonlyargs? 
kwonlydefaults? 
annotations? *
 
?2?
C__inference_lstm_cell_layer_call_and_return_conditional_losses_9426
C__inference_lstm_cell_layer_call_and_return_conditional_losses_9458
C__inference_lstm_cell_layer_call_and_return_conditional_losses_9490
C__inference_lstm_cell_layer_call_and_return_conditional_losses_9522?
???
FullArgSpec3
args+?(
jself
jinputs
jstates

jtraining
varargs
 
varkw
 
defaults?
p 

kwonlyargs? 
kwonlydefaults? 
annotations? *
 
?2?
"__inference_rnn_layer_call_fn_9537
"__inference_rnn_layer_call_fn_9552
"__inference_rnn_layer_call_fn_9567
"__inference_rnn_layer_call_fn_9582?
???
FullArgSpecO
argsG?D
jself
jinputs
jmask

jtraining
jinitial_state
j	constants
varargs
 
varkw
 
defaults?

 
p 

 

 

kwonlyargs? 
kwonlydefaults? 
annotations? *
 
?2?
=__inference_rnn_layer_call_and_return_conditional_losses_9734
=__inference_rnn_layer_call_and_return_conditional_losses_9886
>__inference_rnn_layer_call_and_return_conditional_losses_10038
>__inference_rnn_layer_call_and_return_conditional_losses_10190?
???
FullArgSpecO
argsG?D
jself
jinputs
jmask

jtraining
jinitial_state
j	constants
varargs
 
varkw
 
defaults?

 
p 

 

 

kwonlyargs? 
kwonlydefaults? 
annotations? *
 
?2?
'__inference_dense_1_layer_call_fn_10199?
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
B__inference_dense_1_layer_call_and_return_conditional_losses_10209?
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
"__inference_signature_wrapper_8878input_1"?
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
A__inference_AR_LSTM_layer_call_and_return_conditional_losses_8816uA?>
7?4
.?+
input_1??????????????????3
p 
? ")?&
?
0?????????3
? ?
A__inference_AR_LSTM_layer_call_and_return_conditional_losses_8855uA?>
7?4
.?+
input_1??????????????????3
p
? ")?&
?
0?????????3
? ?
A__inference_AR_LSTM_layer_call_and_return_conditional_losses_9117t@?=
6?3
-?*
inputs??????????????????3
p 
? ")?&
?
0?????????3
? ?
A__inference_AR_LSTM_layer_call_and_return_conditional_losses_9326t@?=
6?3
-?*
inputs??????????????????3
p
? ")?&
?
0?????????3
? ?
&__inference_AR_LSTM_layer_call_fn_8465hA?>
7?4
.?+
input_1??????????????????3
p 
? "??????????3?
&__inference_AR_LSTM_layer_call_fn_8777hA?>
7?4
.?+
input_1??????????????????3
p
? "??????????3?
&__inference_AR_LSTM_layer_call_fn_8893g@?=
6?3
-?*
inputs??????????????????3
p 
? "??????????3?
&__inference_AR_LSTM_layer_call_fn_8908g@?=
6?3
-?*
inputs??????????????????3
p
? "??????????3?
__inference__wrapped_model_7594=?:
3?0
.?+
input_1??????????????????3
? "7?4
2
output_1&?#
output_1?????????3?
B__inference_dense_1_layer_call_and_return_conditional_losses_10209\/?,
%?"
 ?
inputs????????? 
? "%?"
?
0?????????3
? z
'__inference_dense_1_layer_call_fn_10199O/?,
%?"
 ?
inputs????????? 
? "??????????3?
C__inference_lstm_cell_layer_call_and_return_conditional_losses_9426???}
v?s
 ?
inputs?????????3
K?H
"?
states/0????????? 
"?
states/1????????? 
p 
? "s?p
i?f
?
0/0????????? 
E?B
?
0/1/0????????? 
?
0/1/1????????? 
? ?
C__inference_lstm_cell_layer_call_and_return_conditional_losses_9458???}
v?s
 ?
inputs?????????3
K?H
"?
states/0????????? 
"?
states/1????????? 
p
? "s?p
i?f
?
0/0????????? 
E?B
?
0/1/0????????? 
?
0/1/1????????? 
? ?
C__inference_lstm_cell_layer_call_and_return_conditional_losses_9490???}
v?s
 ?
inputs?????????3
K?H
"?
states/0????????? 
"?
states/1????????? 
p 
? "s?p
i?f
?
0/0????????? 
E?B
?
0/1/0????????? 
?
0/1/1????????? 
? ?
C__inference_lstm_cell_layer_call_and_return_conditional_losses_9522???}
v?s
 ?
inputs?????????3
K?H
"?
states/0????????? 
"?
states/1????????? 
p
? "s?p
i?f
?
0/0????????? 
E?B
?
0/1/0????????? 
?
0/1/1????????? 
? ?
(__inference_lstm_cell_layer_call_fn_9343???}
v?s
 ?
inputs?????????3
K?H
"?
states/0????????? 
"?
states/1????????? 
p 
? "c?`
?
0????????? 
A?>
?
1/0????????? 
?
1/1????????? ?
(__inference_lstm_cell_layer_call_fn_9360???}
v?s
 ?
inputs?????????3
K?H
"?
states/0????????? 
"?
states/1????????? 
p
? "c?`
?
0????????? 
A?>
?
1/0????????? 
?
1/1????????? ?
(__inference_lstm_cell_layer_call_fn_9377???}
v?s
 ?
inputs?????????3
K?H
"?
states/0????????? 
"?
states/1????????? 
p 
? "c?`
?
0????????? 
A?>
?
1/0????????? 
?
1/1????????? ?
(__inference_lstm_cell_layer_call_fn_9394???}
v?s
 ?
inputs?????????3
K?H
"?
states/0????????? 
"?
states/1????????? 
p
? "c?`
?
0????????? 
A?>
?
1/0????????? 
?
1/1????????? ?
>__inference_rnn_layer_call_and_return_conditional_losses_10038?L?I
B??
-?*
inputs??????????????????3

 
p 

 

 
? "j?g
`?]
?
0/0????????? 
?
0/1????????? 
?
0/2????????? 
? ?
>__inference_rnn_layer_call_and_return_conditional_losses_10190?L?I
B??
-?*
inputs??????????????????3

 
p

 

 
? "j?g
`?]
?
0/0????????? 
?
0/1????????? 
?
0/2????????? 
? ?
=__inference_rnn_layer_call_and_return_conditional_losses_9734?S?P
I?F
4?1
/?,
inputs/0??????????????????3

 
p 

 

 
? "j?g
`?]
?
0/0????????? 
?
0/1????????? 
?
0/2????????? 
? ?
=__inference_rnn_layer_call_and_return_conditional_losses_9886?S?P
I?F
4?1
/?,
inputs/0??????????????????3

 
p

 

 
? "j?g
`?]
?
0/0????????? 
?
0/1????????? 
?
0/2????????? 
? ?
"__inference_rnn_layer_call_fn_9537?S?P
I?F
4?1
/?,
inputs/0??????????????????3

 
p 

 

 
? "Z?W
?
0????????? 
?
1????????? 
?
2????????? ?
"__inference_rnn_layer_call_fn_9552?S?P
I?F
4?1
/?,
inputs/0??????????????????3

 
p

 

 
? "Z?W
?
0????????? 
?
1????????? 
?
2????????? ?
"__inference_rnn_layer_call_fn_9567?L?I
B??
-?*
inputs??????????????????3

 
p 

 

 
? "Z?W
?
0????????? 
?
1????????? 
?
2????????? ?
"__inference_rnn_layer_call_fn_9582?L?I
B??
-?*
inputs??????????????????3

 
p

 

 
? "Z?W
?
0????????? 
?
1????????? 
?
2????????? ?
"__inference_signature_wrapper_8878?H?E
? 
>?;
9
input_1.?+
input_1??????????????????3"7?4
2
output_1&?#
output_1?????????3