(set-option :print-success false)
(set-info :smt-lib-version 2.6)
(set-option :smt.AUTO_CONFIG false)
(set-option :smt.PHASE_SELECTION 0)
(set-option :smt.RESTART_STRATEGY 0)
(set-option :smt.RESTART_FACTOR |1.5|)
(set-option :smt.ARITH.RANDOM_INITIAL_VALUE true)
(set-option :smt.CASE_SPLIT 3)
(set-option :smt.DELAY_UNITS true)
(set-option :NNF.SK_HACK true)
(set-option :smt.MBQI false)
(set-option :smt.QI.EAGER_THRESHOLD 100)
(set-option :smt.BV.REFLECT true)
(set-option :smt.qi.max_multi_patterns 1000)
(set-option :smt.mbqi false)
(set-option :model.compact false)
(set-option :model.v2 true)
(set-option :pp.bv_literals false)
; done setting options


(set-info :category "industrial")
(declare-sort |T@U| 0)
(declare-sort |T@T| 0)
(declare-fun real_pow (Real Real) Real)
(declare-fun UOrdering2 (|T@U| |T@U|) Bool)
(declare-fun UOrdering3 (|T@T| |T@U| |T@U|) Bool)
(declare-fun tickleBool (Bool) Bool)
(assert (and (tickleBool true) (tickleBool false)))
(declare-fun U_2_int (T@U) Int)
(declare-fun U_2_bool (T@U) Bool)
(declare-fun Ctor (T@T) Int)
(declare-fun intType () T@T)
(declare-fun realType () T@T)
(declare-fun boolType () T@T)
(declare-fun rmodeType () T@T)
(declare-fun stringType () T@T)
(declare-fun regexType () T@T)
(declare-fun int_2_U (Int) T@U)
(declare-fun type (T@U) T@T)
(declare-fun real_2_U (Real) T@U)
(declare-fun U_2_real (T@U) Real)
(declare-fun bool_2_U (Bool) T@U)
(declare-fun rmode_2_U (RoundingMode) T@U)
(declare-fun U_2_rmode (T@U) RoundingMode)
(declare-fun string_2_U (String) T@U)
(declare-fun U_2_string (T@U) String)
(declare-fun regex_2_U ((RegEx String)) T@U)
(declare-fun U_2_regex (T@U) (RegEx String))
(declare-fun $allocated () T@U)
(declare-fun object () T@U)
(declare-fun list_basic () T@U)
(declare-fun set_basic () T@U)
(declare-fun dict_basic () T@U)
(declare-fun vint () T@U)
(declare-fun float () T@U)
(declare-fun vbool () T@U)
(declare-fun NoneType () T@U)
(declare-fun Exception () T@U)
(declare-fun ConnectionRefusedError () T@U)
(declare-fun traceback () T@U)
(declare-fun str () T@U)
(declare-fun bytes () T@U)
(declare-fun tuple_basic () T@U)
(declare-fun PSeq_basic () T@U)
(declare-fun PSet_basic () T@U)
(declare-fun PMultiset_basic () T@U)
(declare-fun slice () T@U)
(declare-fun range_0 () T@U)
(declare-fun Iterator_basic () T@U)
(declare-fun Thread_0 () T@U)
(declare-fun LevelType () T@U)
(declare-fun vtype () T@U)
(declare-fun Place () T@U)
(declare-fun __prim__Seq_type () T@U)
(declare-fun _val () T@U)
(declare-fun __container () T@U)
(declare-fun __iter_index () T@U)
(declare-fun __previous () T@U)
(declare-fun list_acc () T@U)
(declare-fun set_acc () T@U)
(declare-fun dict_acc () T@U)
(declare-fun Measure$acc () T@U)
(declare-fun MustReleaseBounded () T@U)
(declare-fun MustReleaseUnbounded () T@U)
(declare-fun FieldType (T@T T@T) T@T)
(declare-fun FieldTypeInv0 (T@T) T@T)
(declare-fun FieldTypeInv1 (T@T) T@T)
(declare-fun NormalFieldType () T@T)
(declare-fun PyTypeDomainTypeType () T@T)
(declare-fun RefType () T@T)
(declare-fun SeqType (T@T) T@T)
(declare-fun SeqTypeInv0 (T@T) T@T)
(declare-fun MapType0Type (T@T T@T) T@T)
(declare-fun MapType0TypeInv0 (T@T) T@T)
(declare-fun MapType0TypeInv1 (T@T) T@T)
(declare-fun MapType0Select (T@U T@U) T@U)
(declare-fun MapType0Store (T@U T@U T@U) T@U)
(declare-fun MapType (T@T T@T) T@T)
(declare-fun MapTypeInv0 (T@T) T@T)
(declare-fun MapTypeInv1 (T@T) T@T)
(declare-fun |Map#Values| (T@U) T@U)
(declare-fun |Map#Domain| (T@U) T@U)
(declare-fun |Map#Elements| (T@U) T@U)
(declare-fun |Seq#Length| (T@U) Int)
(declare-fun |Seq#Drop| (T@U Int) T@U)
(declare-fun issubtype (T@U T@U) Bool)
(declare-fun state (T@U T@U) Bool)
(declare-fun |int___gt__'| (T@U Int Int) Bool)
(declare-fun MapType1Type (T@T) T@T)
(declare-fun MapType2Type (T@T T@T) T@T)
(declare-fun |int___gt__#frame| (T@U Int Int) Bool)
(declare-fun EmptyFrame () T@U)
(declare-fun MapType1TypeInv0 (T@T) T@T)
(declare-fun MapType1Select (T@U T@U T@U) T@U)
(declare-fun MapType1Store (T@U T@U T@U T@U) T@U)
(declare-fun MapType2TypeInv0 (T@T) T@T)
(declare-fun MapType2TypeInv1 (T@T) T@T)
(declare-fun MapType2Select (T@U T@U T@U) T@U)
(declare-fun MapType2Store (T@U T@U T@U T@U) T@U)
(declare-fun FrameTypeType () T@T)
(declare-fun succHeap (T@U T@U) Bool)
(declare-fun succHeapTrans (T@U T@U) Bool)
(declare-fun union_type_4 (T@U T@U T@U T@U) T@U)
(declare-fun Low (T@U) Bool)
(declare-fun |MultiSet#Card| (T@U) Int)
(declare-fun |MultiSet#Difference| (T@U T@U) T@U)
(declare-fun MultiSetTypeInv0 (T@T) T@T)
(declare-fun MultiSetType (T@T) T@T)
(declare-fun |MultiSet#Intersection| (T@U T@U) T@U)
(declare-fun |MultiSet#Union| (T@U T@U) T@U)
(declare-fun GoodMask (T@U) Bool)
(declare-fun |MultiSet#Equal| (T@U T@U) Bool)
(declare-fun __toMS (T@U) T@U)
(declare-fun |Seq#Empty| (T@T) T@U)
(declare-fun |MultiSet#Empty| (T@T) T@U)
(declare-fun _get_combined_prefix (T@U) T@U)
(declare-fun _get_combined_name (T@U) T@U)
(declare-fun _NameDomainTypeType () T@T)
(declare-fun _is_combined (T@U) Bool)
(declare-fun _combine (T@U T@U) T@U)
(declare-fun _MaySet (T@U Int) T@U)
(declare-fun IsPredicateField (T@U) Bool)
(declare-fun PredicateType__MaySetType () T@T)
(declare-fun dummyFunction (T@U) Bool)
(declare-fun |int___gt__#triggerStateless| (Int Int) Bool)
(declare-fun |_MaySet#trigger| (T@U T@U) Bool)
(declare-fun |_MaySet#everUsed| (T@U) Bool)
(declare-fun |Math#min| (Int Int) Int)
(declare-fun |Seq#Index| (T@U Int) T@U)
(declare-fun |Seq#Sub| (Int Int) Int)
(declare-fun |Seq#Add| (Int Int) Int)
(declare-fun IdenticalOnKnownLocations (T@U T@U T@U) Bool)
(declare-fun null () T@U)
(declare-fun PredicateMaskField (T@U) T@U)
(declare-fun HasDirectPerm (T@U T@U T@U) Bool)
(declare-fun IsWandField (T@U) Bool)
(declare-fun WandMaskField (T@U) T@U)
(declare-fun |int___unbox__'| (T@U T@U) Int)
(declare-fun AssumeFunctionsAbove () Int)
(declare-fun |int___unbox__#trigger| (T@U T@U) Bool)
(declare-fun typeof (T@U) T@U)
(declare-fun |__prim__bool___box__'| (T@U Bool) T@U)
(declare-fun MustTerminate (T@U) T@U)
(declare-fun PredicateType_MustTerminateType () T@T)
(declare-fun MustInvokeBounded (T@U) T@U)
(declare-fun PredicateType_MustInvokeBoundedType () T@T)
(declare-fun MustInvokeUnbounded (T@U) T@U)
(declare-fun PredicateType_MustInvokeUnboundedType () T@T)
(declare-fun |_isDefined'| (T@U Int) Bool)
(declare-fun |_isDefined#triggerStateless| (Int) Bool)
(declare-fun |__prim__int___box__'| (T@U Int) T@U)
(declare-fun |__prim__int___box__#triggerStateless| (Int) T@U)
(declare-fun |int___unbox__#triggerStateless| (T@U) Int)
(declare-fun |__prim__bool___box__#triggerStateless| (Bool) T@U)
(declare-fun |bool___unbox__'| (T@U T@U) Bool)
(declare-fun |bool___unbox__#triggerStateless| (T@U) Bool)
(declare-fun |Level'| (T@U T@U) Real)
(declare-fun |Level#triggerStateless| (T@U) Real)
(declare-fun |MustTerminate#trigger| (T@U T@U) Bool)
(declare-fun |MustTerminate#everUsed| (T@U) Bool)
(declare-fun |MustInvokeBounded#trigger| (T@U T@U) Bool)
(declare-fun |MustInvokeBounded#everUsed| (T@U) Bool)
(declare-fun |MustInvokeUnbounded#trigger| (T@U T@U) Bool)
(declare-fun |MustInvokeUnbounded#everUsed| (T@U) Bool)
(declare-fun |Seq#Update| (T@U Int T@U) T@U)
(declare-fun |MultiSet#Select| (T@U T@U) Int)
(declare-fun |Set#Union| (T@U T@U) T@U)
(declare-fun |Set#Intersection| (T@U T@U) T@U)
(declare-fun |Seq#Append| (T@U T@U) T@U)
(declare-fun _name_type (T@U) Bool)
(declare-fun |Map#Card| (T@U) Int)
(declare-fun |Map#Build| (T@U T@U T@U) T@U)
(declare-fun |Set#Singleton| (T@U) T@U)
(declare-fun |Seq#Take| (T@U Int) T@U)
(declare-fun _single (Int) T@U)
(declare-fun |__prim__bool___box__#trigger| (T@U Bool) Bool)
(declare-fun union_type_3 (T@U T@U T@U) T@U)
(declare-fun Measure$guard (T@U) Bool)
(declare-fun Measure$create (Bool T@U Int) T@U)
(declare-fun Measure$DomainTypeType () T@T)
(declare-fun |bool___unbox__#trigger| (T@U T@U) Bool)
(declare-fun |Seq#Contains| (T@U T@U) Bool)
(declare-fun |Seq#Range| (Int Int) T@U)
(declare-fun |Set#Card| (T@U) Int)
(declare-fun |Seq#Skolem| (T@U T@U) Int)
(declare-fun IdenticalOnKnownLocationsLiberal (T@U T@U T@U) Bool)
(declare-fun __prim__int___box__ (T@U Int) T@U)
(declare-fun int___unbox__ (T@U T@U) Int)
(declare-fun __prim__bool___box__ (T@U Bool) T@U)
(declare-fun Level (T@U T@U) Real)
(declare-fun dict (T@U T@U) T@U)
(declare-fun extends_ (T@U T@U) Bool)
(declare-fun get_basic (T@U) T@U)
(declare-fun |Math#clip| (Int) Int)
(declare-fun |__prim__int___box__#trigger| (T@U Int) Bool)
(declare-fun |Seq#Singleton| (T@U) T@U)
(declare-fun decreasing (T@U T@U) Bool)
(declare-fun Measure$key (T@U) T@U)
(declare-fun Measure$value (T@U) Int)
(declare-fun |_MaySet#sm| (T@U Int) T@U)
(declare-fun _is_single (T@U) Bool)
(declare-fun |MustTerminate#sm| (T@U) T@U)
(declare-fun |MustInvokeBounded#sm| (T@U) T@U)
(declare-fun |MustInvokeUnbounded#sm| (T@U) T@U)
(declare-fun dummyHeap () T@U)
(declare-fun ZeroMask () T@U)
(declare-fun |MultiSet#UnionOne| (T@U T@U) T@U)
(declare-fun |MultiSet#Disjoint| (T@U T@U) Bool)
(declare-fun InsidePredicate (T@U T@U T@U T@U) Bool)
(declare-fun |MultiSet#Singleton| (T@U) T@U)
(declare-fun |Map#Disjoint| (T@U T@U) Bool)
(declare-fun |Map#Empty| (T@T T@T) T@U)
(declare-fun |Set#Equal| (T@U T@U) Bool)
(declare-fun sumMask (T@U T@U T@U) Bool)
(declare-fun _get_value (T@U) Int)
(declare-fun ConditionalFrame (Real T@U) T@U)
(declare-fun dict_arg (T@U Int) T@U)
(declare-fun NoPerm () Real)
(declare-fun list (T@U) T@U)
(declare-fun list_arg (T@U Int) T@U)
(declare-fun set (T@U) T@U)
(declare-fun set_arg (T@U Int) T@U)
(declare-fun PSeq (T@U) T@U)
(declare-fun PSeq_arg (T@U Int) T@U)
(declare-fun PSet (T@U) T@U)
(declare-fun PSet_arg (T@U Int) T@U)
(declare-fun PMultiset (T@U) T@U)
(declare-fun PMultiset_arg (T@U Int) T@U)
(declare-fun Iterator (T@U) T@U)
(declare-fun Iterator_arg (T@U Int) T@U)
(declare-fun tuple (T@U) T@U)
(declare-fun |Seq#Equal| (T@U T@U) Bool)
(declare-fun union_type_1 (T@U) T@U)
(declare-fun SumHeap (T@U T@U T@U T@U T@U) Bool)
(declare-fun union_type_2 (T@U T@U) T@U)
(declare-fun |Set#Difference| (T@U T@U) T@U)
(declare-fun |Map#Equal| (T@U T@U) Bool)
(declare-fun |Set#UnionOne| (T@U T@U) T@U)
(declare-fun bounded (T@U) Bool)
(declare-fun |_isDefined#frame| (T@U Int) Bool)
(declare-fun |bool___unbox__#frame| (T@U T@U) Bool)
(declare-fun |Seq#ContainsTrigger| (T@U T@U) Bool)
(declare-fun tuple_args (T@U) T@U)
(declare-fun _isDefined (T@U Int) Bool)
(declare-fun bool___unbox__ (T@U T@U) Bool)
(declare-fun getPredWandId (T@U) Int)
(declare-fun seq_ref_index (T@U Int) T@U)
(declare-fun FullPerm () Real)
(declare-fun |__prim__int___box__#frame| (T@U Int) T@U)
(declare-fun |int___unbox__#frame| (T@U T@U) Int)
(declare-fun |__prim__bool___box__#frame| (T@U Bool) T@U)
(declare-fun |Level#frame| (T@U T@U) Real)
(declare-fun seq_ref_length (T@U) Int)
(declare-fun |Set#Empty| (T@T) T@U)
(declare-fun int___gt__ (T@U Int Int) Bool)
(declare-fun |Set#Subset| (T@U T@U) Bool)
(declare-fun isnotsubtype (T@U T@U) Bool)
(declare-fun ZeroPMask () T@U)
(declare-fun |Seq#SkolemDiff| (T@U T@U) Int)
(declare-fun |MultiSet#Subset| (T@U T@U) Bool)
(declare-fun tuple_arg (T@U Int) T@U)
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (= (Ctor intType) 0) (= (Ctor realType) 1)) (= (Ctor boolType) 2)) (= (Ctor rmodeType) 3)) (= (Ctor stringType) 4)) (= (Ctor regexType) 5)) (forall ((arg0 Int) ) (! (= (U_2_int (int_2_U arg0)) arg0)
 :qid |typeInv:U_2_int|
 :pattern ( (int_2_U arg0))
))) (forall ((x T@U) ) (!  (=> (= (type x) intType) (= (int_2_U (U_2_int x)) x))
 :qid |cast:U_2_int|
 :pattern ( (U_2_int x))
))) (forall ((arg0@@0 Int) ) (! (= (type (int_2_U arg0@@0)) intType)
 :qid |funType:int_2_U|
 :pattern ( (int_2_U arg0@@0))
))) (forall ((arg0@@1 Real) ) (! (= (U_2_real (real_2_U arg0@@1)) arg0@@1)
 :qid |typeInv:U_2_real|
 :pattern ( (real_2_U arg0@@1))
))) (forall ((x@@0 T@U) ) (!  (=> (= (type x@@0) realType) (= (real_2_U (U_2_real x@@0)) x@@0))
 :qid |cast:U_2_real|
 :pattern ( (U_2_real x@@0))
))) (forall ((arg0@@2 Real) ) (! (= (type (real_2_U arg0@@2)) realType)
 :qid |funType:real_2_U|
 :pattern ( (real_2_U arg0@@2))
))) (forall ((arg0@@3 Bool) ) (! (= (U_2_bool (bool_2_U arg0@@3)) arg0@@3)
 :qid |typeInv:U_2_bool|
 :pattern ( (bool_2_U arg0@@3))
))) (forall ((x@@1 T@U) ) (!  (=> (= (type x@@1) boolType) (= (bool_2_U (U_2_bool x@@1)) x@@1))
 :qid |cast:U_2_bool|
 :pattern ( (U_2_bool x@@1))
))) (forall ((arg0@@4 Bool) ) (! (= (type (bool_2_U arg0@@4)) boolType)
 :qid |funType:bool_2_U|
 :pattern ( (bool_2_U arg0@@4))
))) (forall ((arg0@@5 RoundingMode) ) (! (= (U_2_rmode (rmode_2_U arg0@@5)) arg0@@5)
 :qid |typeInv:U_2_rmode|
 :pattern ( (rmode_2_U arg0@@5))
))) (forall ((x@@2 T@U) ) (!  (=> (= (type x@@2) rmodeType) (= (rmode_2_U (U_2_rmode x@@2)) x@@2))
 :qid |cast:U_2_rmode|
 :pattern ( (U_2_rmode x@@2))
))) (forall ((arg0@@6 RoundingMode) ) (! (= (type (rmode_2_U arg0@@6)) rmodeType)
 :qid |funType:rmode_2_U|
 :pattern ( (rmode_2_U arg0@@6))
))) (forall ((arg0@@7 String) ) (! (= (U_2_string (string_2_U arg0@@7)) arg0@@7)
 :qid |typeInv:U_2_string|
 :pattern ( (string_2_U arg0@@7))
))) (forall ((x@@3 T@U) ) (!  (=> (= (type x@@3) stringType) (= (string_2_U (U_2_string x@@3)) x@@3))
 :qid |cast:U_2_string|
 :pattern ( (U_2_string x@@3))
))) (forall ((arg0@@8 String) ) (! (= (type (string_2_U arg0@@8)) stringType)
 :qid |funType:string_2_U|
 :pattern ( (string_2_U arg0@@8))
))) (forall ((arg0@@9 (RegEx String)) ) (! (= (U_2_regex (regex_2_U arg0@@9)) arg0@@9)
 :qid |typeInv:U_2_regex|
 :pattern ( (regex_2_U arg0@@9))
))) (forall ((x@@4 T@U) ) (!  (=> (= (type x@@4) regexType) (= (regex_2_U (U_2_regex x@@4)) x@@4))
 :qid |cast:U_2_regex|
 :pattern ( (U_2_regex x@@4))
))) (forall ((arg0@@10 (RegEx String)) ) (! (= (type (regex_2_U arg0@@10)) regexType)
 :qid |funType:regex_2_U|
 :pattern ( (regex_2_U arg0@@10))
))))
(assert (forall ((x@@5 T@U) ) (! (UOrdering2 x@@5 x@@5)
 :qid |bg:subtype-refl|
 :no-pattern (U_2_int x@@5)
 :no-pattern (U_2_bool x@@5)
)))
(assert (forall ((x@@6 T@U) (y T@U) (z T@U) ) (! (let ((alpha (type x@@6)))
 (=> (and (and (= (type y) alpha) (= (type z) alpha)) (and (UOrdering2 x@@6 y) (UOrdering2 y z))) (UOrdering2 x@@6 z)))
 :qid |bg:subtype-trans|
 :pattern ( (UOrdering2 x@@6 y) (UOrdering2 y z))
)))
(assert (forall ((x@@7 T@U) (y@@0 T@U) ) (! (let ((alpha@@0 (type x@@7)))
 (=> (= (type y@@0) alpha@@0) (=> (and (UOrdering2 x@@7 y@@0) (UOrdering2 y@@0 x@@7)) (= x@@7 y@@0))))
 :qid |bg:subtype-antisymm|
 :pattern ( (UOrdering2 x@@7 y@@0) (UOrdering2 y@@0 x@@7))
)))
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (forall ((arg0@@11 T@T) (arg1 T@T) ) (! (= (Ctor (FieldType arg0@@11 arg1)) 6)
 :qid |ctor:FieldType|
)) (forall ((arg0@@12 T@T) (arg1@@0 T@T) ) (! (= (FieldTypeInv0 (FieldType arg0@@12 arg1@@0)) arg0@@12)
 :qid |typeInv:FieldTypeInv0|
 :pattern ( (FieldType arg0@@12 arg1@@0))
))) (forall ((arg0@@13 T@T) (arg1@@1 T@T) ) (! (= (FieldTypeInv1 (FieldType arg0@@13 arg1@@1)) arg1@@1)
 :qid |typeInv:FieldTypeInv1|
 :pattern ( (FieldType arg0@@13 arg1@@1))
))) (= (Ctor NormalFieldType) 7)) (= (type $allocated) (FieldType NormalFieldType boolType))) (= (Ctor PyTypeDomainTypeType) 8)) (= (type object) PyTypeDomainTypeType)) (= (type list_basic) PyTypeDomainTypeType)) (= (type set_basic) PyTypeDomainTypeType)) (= (type dict_basic) PyTypeDomainTypeType)) (= (type vint) PyTypeDomainTypeType)) (= (type float) PyTypeDomainTypeType)) (= (type vbool) PyTypeDomainTypeType)) (= (type NoneType) PyTypeDomainTypeType)) (= (type Exception) PyTypeDomainTypeType)) (= (type ConnectionRefusedError) PyTypeDomainTypeType)) (= (type traceback) PyTypeDomainTypeType)) (= (type str) PyTypeDomainTypeType)) (= (type bytes) PyTypeDomainTypeType)) (= (type tuple_basic) PyTypeDomainTypeType)) (= (type PSeq_basic) PyTypeDomainTypeType)) (= (type PSet_basic) PyTypeDomainTypeType)) (= (type PMultiset_basic) PyTypeDomainTypeType)) (= (type slice) PyTypeDomainTypeType)) (= (type range_0) PyTypeDomainTypeType)) (= (type Iterator_basic) PyTypeDomainTypeType)) (= (type Thread_0) PyTypeDomainTypeType)) (= (type LevelType) PyTypeDomainTypeType)) (= (type vtype) PyTypeDomainTypeType)) (= (type Place) PyTypeDomainTypeType)) (= (type __prim__Seq_type) PyTypeDomainTypeType)) (= (Ctor RefType) 9)) (= (type _val) (FieldType NormalFieldType RefType))) (= (type __container) (FieldType NormalFieldType RefType))) (= (type __iter_index) (FieldType NormalFieldType intType))) (forall ((arg0@@14 T@T) ) (! (= (Ctor (SeqType arg0@@14)) 10)
 :qid |ctor:SeqType|
))) (forall ((arg0@@15 T@T) ) (! (= (SeqTypeInv0 (SeqType arg0@@15)) arg0@@15)
 :qid |typeInv:SeqTypeInv0|
 :pattern ( (SeqType arg0@@15))
))) (= (type __previous) (FieldType NormalFieldType (SeqType RefType)))) (= (type list_acc) (FieldType NormalFieldType (SeqType RefType)))) (forall ((arg0@@16 T@T) (arg1@@2 T@T) ) (! (= (Ctor (MapType0Type arg0@@16 arg1@@2)) 11)
 :qid |ctor:MapType0Type|
))) (forall ((arg0@@17 T@T) (arg1@@3 T@T) ) (! (= (MapType0TypeInv0 (MapType0Type arg0@@17 arg1@@3)) arg0@@17)
 :qid |typeInv:MapType0TypeInv0|
 :pattern ( (MapType0Type arg0@@17 arg1@@3))
))) (forall ((arg0@@18 T@T) (arg1@@4 T@T) ) (! (= (MapType0TypeInv1 (MapType0Type arg0@@18 arg1@@4)) arg1@@4)
 :qid |typeInv:MapType0TypeInv1|
 :pattern ( (MapType0Type arg0@@18 arg1@@4))
))) (forall ((arg0@@19 T@U) (arg1@@5 T@U) ) (! (let ((aVar1 (MapType0TypeInv1 (type arg0@@19))))
(= (type (MapType0Select arg0@@19 arg1@@5)) aVar1))
 :qid |funType:MapType0Select|
 :pattern ( (MapType0Select arg0@@19 arg1@@5))
))) (forall ((arg0@@20 T@U) (arg1@@6 T@U) (arg2 T@U) ) (! (let ((aVar1@@0 (type arg2)))
(let ((aVar0 (type arg1@@6)))
(= (type (MapType0Store arg0@@20 arg1@@6 arg2)) (MapType0Type aVar0 aVar1@@0))))
 :qid |funType:MapType0Store|
 :pattern ( (MapType0Store arg0@@20 arg1@@6 arg2))
))) (forall ((m T@U) (x0 T@U) (val T@U) ) (! (let ((aVar1@@1 (MapType0TypeInv1 (type m))))
 (=> (= (type val) aVar1@@1) (= (MapType0Select (MapType0Store m x0 val) x0) val)))
 :qid |mapAx0:MapType0Select|
 :weight 0
))) (and (forall ((val@@0 T@U) (m@@0 T@U) (x0@@0 T@U) (y0 T@U) ) (!  (or (= x0@@0 y0) (= (MapType0Select (MapType0Store m@@0 x0@@0 val@@0) y0) (MapType0Select m@@0 y0)))
 :qid |mapAx1:MapType0Select:0|
 :weight 0
)) (forall ((val@@1 T@U) (m@@1 T@U) (x0@@1 T@U) (y0@@0 T@U) ) (!  (or true (= (MapType0Select (MapType0Store m@@1 x0@@1 val@@1) y0@@0) (MapType0Select m@@1 y0@@0)))
 :qid |mapAx2:MapType0Select|
 :weight 0
)))) (= (type set_acc) (FieldType NormalFieldType (MapType0Type RefType boolType)))) (forall ((arg0@@21 T@T) (arg1@@7 T@T) ) (! (= (Ctor (MapType arg0@@21 arg1@@7)) 12)
 :qid |ctor:MapType|
))) (forall ((arg0@@22 T@T) (arg1@@8 T@T) ) (! (= (MapTypeInv0 (MapType arg0@@22 arg1@@8)) arg0@@22)
 :qid |typeInv:MapTypeInv0|
 :pattern ( (MapType arg0@@22 arg1@@8))
))) (forall ((arg0@@23 T@T) (arg1@@9 T@T) ) (! (= (MapTypeInv1 (MapType arg0@@23 arg1@@9)) arg1@@9)
 :qid |typeInv:MapTypeInv1|
 :pattern ( (MapType arg0@@23 arg1@@9))
))) (= (type dict_acc) (FieldType NormalFieldType (MapType RefType RefType)))) (= (type Measure$acc) (FieldType NormalFieldType (SeqType RefType)))) (= (type MustReleaseBounded) (FieldType NormalFieldType intType))) (= (type MustReleaseUnbounded) (FieldType NormalFieldType intType))))
(assert (distinct $allocated object list_basic set_basic dict_basic vint float vbool NoneType Exception ConnectionRefusedError traceback str bytes tuple_basic PSeq_basic PSet_basic PMultiset_basic slice range_0 Iterator_basic Thread_0 LevelType vtype Place __prim__Seq_type _val __container __iter_index __previous list_acc set_acc dict_acc Measure$acc MustReleaseBounded MustReleaseUnbounded)
)
(assert  (and (and (forall ((arg0@@24 T@U) ) (! (let ((V (MapTypeInv1 (type arg0@@24))))
(= (type (|Map#Values| arg0@@24)) (MapType0Type V boolType)))
 :qid |funType:Map#Values|
 :pattern ( (|Map#Values| arg0@@24))
)) (forall ((arg0@@25 T@U) ) (! (let ((U (MapTypeInv0 (type arg0@@25))))
(= (type (|Map#Domain| arg0@@25)) (MapType0Type U boolType)))
 :qid |funType:Map#Domain|
 :pattern ( (|Map#Domain| arg0@@25))
))) (forall ((arg0@@26 T@U) ) (! (let ((V@@0 (MapTypeInv1 (type arg0@@26))))
(let ((U@@0 (MapTypeInv0 (type arg0@@26))))
(= (type (|Map#Elements| arg0@@26)) (MapType0Type U@@0 V@@0))))
 :qid |funType:Map#Elements|
 :pattern ( (|Map#Elements| arg0@@26))
))))
(assert (forall ((m@@2 T@U) (v T@U) ) (! (let ((V@@1 (type v)))
(let ((U@@1 (MapTypeInv0 (type m@@2))))
 (=> (and (= (type m@@2) (MapType U@@1 V@@1)) (U_2_bool (MapType0Select (|Map#Values| m@@2) v))) (exists ((u T@U) ) (!  (and (= (type u) U@@1) (and (U_2_bool (MapType0Select (|Map#Domain| m@@2) u)) (= v (MapType0Select (|Map#Elements| m@@2) u))))
 :qid |stdinbpl.827:10|
 :skolemid |132|
 :pattern ( (MapType0Select (|Map#Domain| m@@2) u))
 :pattern ( (MapType0Select (|Map#Elements| m@@2) u))
)))))
 :qid |stdinbpl.825:20|
 :skolemid |133|
 :pattern ( (MapType0Select (|Map#Values| m@@2) v))
)))
(assert (forall ((arg0@@27 T@U) (arg1@@10 Int) ) (! (let ((T (SeqTypeInv0 (type arg0@@27))))
(= (type (|Seq#Drop| arg0@@27 arg1@@10)) (SeqType T)))
 :qid |funType:Seq#Drop|
 :pattern ( (|Seq#Drop| arg0@@27 arg1@@10))
)))
(assert (forall ((s T@U) (n Int) ) (! (let ((T@@0 (SeqTypeInv0 (type s))))
 (=> (= (type s) (SeqType T@@0)) (and (=> (<= 0 n) (and (=> (<= n (|Seq#Length| s)) (= (|Seq#Length| (|Seq#Drop| s n)) (- (|Seq#Length| s) n))) (=> (< (|Seq#Length| s) n) (= (|Seq#Length| (|Seq#Drop| s n)) 0)))) (=> (< n 0) (= (|Seq#Length| (|Seq#Drop| s n)) (|Seq#Length| s))))))
 :qid |stdinbpl.334:18|
 :skolemid |50|
 :pattern ( (|Seq#Length| (|Seq#Drop| s n)))
 :pattern ( (|Seq#Length| s) (|Seq#Drop| s n))
)))
(assert (forall ((type_ T@U) ) (!  (=> (= (type type_) PyTypeDomainTypeType) (issubtype type_ type_))
 :qid |stdinbpl.1061:15|
 :skolemid |152|
 :pattern ( (issubtype type_ type_))
)))
(assert (forall ((type_@@0 T@U) ) (!  (=> (= (type type_@@0) PyTypeDomainTypeType) (issubtype type_@@0 object))
 :qid |stdinbpl.1079:15|
 :skolemid |155|
 :pattern ( (issubtype type_@@0 object))
)))
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (and (and (forall ((arg0@@28 T@T) ) (! (= (Ctor (MapType1Type arg0@@28)) 13)
 :qid |ctor:MapType1Type|
)) (forall ((arg0@@29 T@T) ) (! (= (MapType1TypeInv0 (MapType1Type arg0@@29)) arg0@@29)
 :qid |typeInv:MapType1TypeInv0|
 :pattern ( (MapType1Type arg0@@29))
))) (forall ((arg0@@30 T@U) (arg1@@11 T@U) (arg2@@0 T@U) ) (! (let ((B (FieldTypeInv1 (type arg2@@0))))
(= (type (MapType1Select arg0@@30 arg1@@11 arg2@@0)) B))
 :qid |funType:MapType1Select|
 :pattern ( (MapType1Select arg0@@30 arg1@@11 arg2@@0))
))) (forall ((arg0@@31 T@U) (arg1@@12 T@U) (arg2@@1 T@U) (arg3 T@U) ) (! (let ((aVar0@@0 (type arg1@@12)))
(= (type (MapType1Store arg0@@31 arg1@@12 arg2@@1 arg3)) (MapType1Type aVar0@@0)))
 :qid |funType:MapType1Store|
 :pattern ( (MapType1Store arg0@@31 arg1@@12 arg2@@1 arg3))
))) (forall ((m@@3 T@U) (x0@@2 T@U) (x1 T@U) (val@@2 T@U) ) (! (let ((B@@0 (FieldTypeInv1 (type x1))))
 (=> (= (type val@@2) B@@0) (= (MapType1Select (MapType1Store m@@3 x0@@2 x1 val@@2) x0@@2 x1) val@@2)))
 :qid |mapAx0:MapType1Select|
 :weight 0
))) (and (and (forall ((val@@3 T@U) (m@@4 T@U) (x0@@3 T@U) (x1@@0 T@U) (y0@@1 T@U) (y1 T@U) ) (!  (or (= x0@@3 y0@@1) (= (MapType1Select (MapType1Store m@@4 x0@@3 x1@@0 val@@3) y0@@1 y1) (MapType1Select m@@4 y0@@1 y1)))
 :qid |mapAx1:MapType1Select:0|
 :weight 0
)) (forall ((val@@4 T@U) (m@@5 T@U) (x0@@4 T@U) (x1@@1 T@U) (y0@@2 T@U) (y1@@0 T@U) ) (!  (or (= x1@@1 y1@@0) (= (MapType1Select (MapType1Store m@@5 x0@@4 x1@@1 val@@4) y0@@2 y1@@0) (MapType1Select m@@5 y0@@2 y1@@0)))
 :qid |mapAx1:MapType1Select:1|
 :weight 0
))) (forall ((val@@5 T@U) (m@@6 T@U) (x0@@5 T@U) (x1@@2 T@U) (y0@@3 T@U) (y1@@1 T@U) ) (!  (or true (= (MapType1Select (MapType1Store m@@6 x0@@5 x1@@2 val@@5) y0@@3 y1@@1) (MapType1Select m@@6 y0@@3 y1@@1)))
 :qid |mapAx2:MapType1Select|
 :weight 0
)))) (forall ((arg0@@32 T@T) (arg1@@13 T@T) ) (! (= (Ctor (MapType2Type arg0@@32 arg1@@13)) 14)
 :qid |ctor:MapType2Type|
))) (forall ((arg0@@33 T@T) (arg1@@14 T@T) ) (! (= (MapType2TypeInv0 (MapType2Type arg0@@33 arg1@@14)) arg0@@33)
 :qid |typeInv:MapType2TypeInv0|
 :pattern ( (MapType2Type arg0@@33 arg1@@14))
))) (forall ((arg0@@34 T@T) (arg1@@15 T@T) ) (! (= (MapType2TypeInv1 (MapType2Type arg0@@34 arg1@@15)) arg1@@15)
 :qid |typeInv:MapType2TypeInv1|
 :pattern ( (MapType2Type arg0@@34 arg1@@15))
))) (forall ((arg0@@35 T@U) (arg1@@16 T@U) (arg2@@2 T@U) ) (! (let ((aVar1@@2 (MapType2TypeInv1 (type arg0@@35))))
(= (type (MapType2Select arg0@@35 arg1@@16 arg2@@2)) aVar1@@2))
 :qid |funType:MapType2Select|
 :pattern ( (MapType2Select arg0@@35 arg1@@16 arg2@@2))
))) (forall ((arg0@@36 T@U) (arg1@@17 T@U) (arg2@@3 T@U) (arg3@@0 T@U) ) (! (let ((aVar1@@3 (type arg3@@0)))
(let ((aVar0@@1 (type arg1@@17)))
(= (type (MapType2Store arg0@@36 arg1@@17 arg2@@3 arg3@@0)) (MapType2Type aVar0@@1 aVar1@@3))))
 :qid |funType:MapType2Store|
 :pattern ( (MapType2Store arg0@@36 arg1@@17 arg2@@3 arg3@@0))
))) (forall ((m@@7 T@U) (x0@@6 T@U) (x1@@3 T@U) (val@@6 T@U) ) (! (let ((aVar1@@4 (MapType2TypeInv1 (type m@@7))))
 (=> (= (type val@@6) aVar1@@4) (= (MapType2Select (MapType2Store m@@7 x0@@6 x1@@3 val@@6) x0@@6 x1@@3) val@@6)))
 :qid |mapAx0:MapType2Select|
 :weight 0
))) (and (and (forall ((val@@7 T@U) (m@@8 T@U) (x0@@7 T@U) (x1@@4 T@U) (y0@@4 T@U) (y1@@2 T@U) ) (!  (or (= x0@@7 y0@@4) (= (MapType2Select (MapType2Store m@@8 x0@@7 x1@@4 val@@7) y0@@4 y1@@2) (MapType2Select m@@8 y0@@4 y1@@2)))
 :qid |mapAx1:MapType2Select:0|
 :weight 0
)) (forall ((val@@8 T@U) (m@@9 T@U) (x0@@8 T@U) (x1@@5 T@U) (y0@@5 T@U) (y1@@3 T@U) ) (!  (or (= x1@@5 y1@@3) (= (MapType2Select (MapType2Store m@@9 x0@@8 x1@@5 val@@8) y0@@5 y1@@3) (MapType2Select m@@9 y0@@5 y1@@3)))
 :qid |mapAx1:MapType2Select:1|
 :weight 0
))) (forall ((val@@9 T@U) (m@@10 T@U) (x0@@9 T@U) (x1@@6 T@U) (y0@@6 T@U) (y1@@4 T@U) ) (!  (or true (= (MapType2Select (MapType2Store m@@10 x0@@9 x1@@6 val@@9) y0@@6 y1@@4) (MapType2Select m@@10 y0@@6 y1@@4)))
 :qid |mapAx2:MapType2Select|
 :weight 0
)))) (= (Ctor FrameTypeType) 15)) (= (type EmptyFrame) FrameTypeType)))
(assert (forall ((Heap T@U) (Mask T@U) (self Int) (other Int) ) (!  (=> (and (and (= (type Heap) (MapType1Type RefType)) (= (type Mask) (MapType2Type RefType realType))) (state Heap Mask)) (= (|int___gt__'| Heap self other) (|int___gt__#frame| EmptyFrame self other)))
 :qid |stdinbpl.1939:15|
 :skolemid |234|
 :pattern ( (state Heap Mask) (|int___gt__'| Heap self other))
)))
(assert (forall ((Heap0 T@U) (Heap1 T@U) ) (!  (=> (and (and (= (type Heap0) (MapType1Type RefType)) (= (type Heap1) (MapType1Type RefType))) (succHeap Heap0 Heap1)) (succHeapTrans Heap0 Heap1))
 :qid |stdinbpl.95:15|
 :skolemid |12|
 :pattern ( (succHeap Heap0 Heap1))
)))
(assert (forall ((arg0@@37 T@U) (arg1@@18 T@U) (arg2@@4 T@U) (arg3@@1 T@U) ) (! (= (type (union_type_4 arg0@@37 arg1@@18 arg2@@4 arg3@@1)) PyTypeDomainTypeType)
 :qid |funType:union_type_4|
 :pattern ( (union_type_4 arg0@@37 arg1@@18 arg2@@4 arg3@@1))
)))
(assert (forall ((arg_1_1 T@U) (arg_2_1 T@U) (arg_3_1 T@U) (arg_4_1 T@U) (X T@U) ) (!  (=> (and (and (and (and (= (type arg_1_1) PyTypeDomainTypeType) (= (type arg_2_1) PyTypeDomainTypeType)) (= (type arg_3_1) PyTypeDomainTypeType)) (= (type arg_4_1) PyTypeDomainTypeType)) (= (type X) PyTypeDomainTypeType)) (= (issubtype (union_type_4 arg_1_1 arg_2_1 arg_3_1 arg_4_1) X)  (and (issubtype arg_1_1 X) (and (issubtype arg_2_1 X) (and (issubtype arg_3_1 X) (issubtype arg_4_1 X))))))
 :qid |stdinbpl.1166:15|
 :skolemid |170|
 :pattern ( (issubtype (union_type_4 arg_1_1 arg_2_1 arg_3_1 arg_4_1) X))
)))
(assert (forall ((x_1 T@U) ) (! (Low x_1)
 :qid |stdinbpl.1329:19|
 :skolemid |188|
 :pattern ( (Low x_1))
)))
(assert  (and (and (and (and (forall ((arg0@@38 T@T) ) (! (= (Ctor (MultiSetType arg0@@38)) 16)
 :qid |ctor:MultiSetType|
)) (forall ((arg0@@39 T@T) ) (! (= (MultiSetTypeInv0 (MultiSetType arg0@@39)) arg0@@39)
 :qid |typeInv:MultiSetTypeInv0|
 :pattern ( (MultiSetType arg0@@39))
))) (forall ((arg0@@40 T@U) (arg1@@19 T@U) ) (! (let ((T@@1 (MultiSetTypeInv0 (type arg0@@40))))
(= (type (|MultiSet#Difference| arg0@@40 arg1@@19)) (MultiSetType T@@1)))
 :qid |funType:MultiSet#Difference|
 :pattern ( (|MultiSet#Difference| arg0@@40 arg1@@19))
))) (forall ((arg0@@41 T@U) (arg1@@20 T@U) ) (! (let ((T@@2 (MultiSetTypeInv0 (type arg0@@41))))
(= (type (|MultiSet#Intersection| arg0@@41 arg1@@20)) (MultiSetType T@@2)))
 :qid |funType:MultiSet#Intersection|
 :pattern ( (|MultiSet#Intersection| arg0@@41 arg1@@20))
))) (forall ((arg0@@42 T@U) (arg1@@21 T@U) ) (! (let ((T@@3 (MultiSetTypeInv0 (type arg0@@42))))
(= (type (|MultiSet#Union| arg0@@42 arg1@@21)) (MultiSetType T@@3)))
 :qid |funType:MultiSet#Union|
 :pattern ( (|MultiSet#Union| arg0@@42 arg1@@21))
))))
(assert (forall ((a T@U) (b T@U) ) (! (let ((T@@4 (MultiSetTypeInv0 (type a))))
 (=> (and (= (type a) (MultiSetType T@@4)) (= (type b) (MultiSetType T@@4))) (and (= (+ (+ (|MultiSet#Card| (|MultiSet#Difference| a b)) (|MultiSet#Card| (|MultiSet#Difference| b a))) (* 2 (|MultiSet#Card| (|MultiSet#Intersection| a b)))) (|MultiSet#Card| (|MultiSet#Union| a b))) (= (|MultiSet#Card| (|MultiSet#Difference| a b)) (- (|MultiSet#Card| a) (|MultiSet#Card| (|MultiSet#Intersection| a b)))))))
 :qid |stdinbpl.766:18|
 :skolemid |122|
 :pattern ( (|MultiSet#Card| (|MultiSet#Difference| a b)))
)))
(assert (forall ((Heap@@0 T@U) (Mask@@0 T@U) ) (!  (=> (and (and (= (type Heap@@0) (MapType1Type RefType)) (= (type Mask@@0) (MapType2Type RefType realType))) (state Heap@@0 Mask@@0)) (GoodMask Mask@@0))
 :qid |stdinbpl.181:15|
 :skolemid |27|
 :pattern ( (state Heap@@0 Mask@@0))
)))
(assert (forall ((Heap0@@0 T@U) (Heap1@@0 T@U) (Heap2 T@U) ) (!  (=> (and (and (and (= (type Heap0@@0) (MapType1Type RefType)) (= (type Heap1@@0) (MapType1Type RefType))) (= (type Heap2) (MapType1Type RefType))) (and (succHeapTrans Heap0@@0 Heap1@@0) (succHeap Heap1@@0 Heap2))) (succHeapTrans Heap0@@0 Heap2))
 :qid |stdinbpl.100:15|
 :skolemid |13|
 :pattern ( (succHeapTrans Heap0@@0 Heap1@@0) (succHeap Heap1@@0 Heap2))
)))
(assert  (and (and (forall ((arg0@@43 T@U) ) (! (let ((T$ (SeqTypeInv0 (type arg0@@43))))
(= (type (__toMS arg0@@43)) (MultiSetType T$)))
 :qid |funType:__toMS|
 :pattern ( (__toMS arg0@@43))
)) (forall ((T@@5 T@T) ) (! (= (type (|Seq#Empty| T@@5)) (SeqType T@@5))
 :qid |funType:Seq#Empty|
 :pattern ( (|Seq#Empty| T@@5))
))) (forall ((T@@6 T@T) ) (! (= (type (|MultiSet#Empty| T@@6)) (MultiSetType T@@6))
 :qid |funType:MultiSet#Empty|
 :pattern ( (|MultiSet#Empty| T@@6))
))))
(assert (forall ((T$@@0 T@T) ) (! (|MultiSet#Equal| (__toMS (|Seq#Empty| T$@@0)) (|MultiSet#Empty| T$@@0))
 :skolemid |194|
)))
(assert  (and (and (and (= (Ctor _NameDomainTypeType) 17) (forall ((arg0@@44 T@U) ) (! (= (type (_get_combined_prefix arg0@@44)) _NameDomainTypeType)
 :qid |funType:_get_combined_prefix|
 :pattern ( (_get_combined_prefix arg0@@44))
))) (forall ((arg0@@45 T@U) ) (! (= (type (_get_combined_name arg0@@45)) _NameDomainTypeType)
 :qid |funType:_get_combined_name|
 :pattern ( (_get_combined_name arg0@@45))
))) (forall ((arg0@@46 T@U) (arg1@@22 T@U) ) (! (= (type (_combine arg0@@46 arg1@@22)) _NameDomainTypeType)
 :qid |funType:_combine|
 :pattern ( (_combine arg0@@46 arg1@@22))
))))
(assert (forall ((n_1 T@U) ) (!  (=> (and (= (type n_1) _NameDomainTypeType) (_is_combined n_1)) (= n_1 (_combine (_get_combined_prefix n_1) (_get_combined_name n_1))))
 :qid |stdinbpl.1486:15|
 :skolemid |202|
 :pattern ( (_get_combined_prefix n_1))
 :pattern ( (_get_combined_name n_1))
)))
(assert  (and (= (Ctor PredicateType__MaySetType) 18) (forall ((arg0@@47 T@U) (arg1@@23 Int) ) (! (= (type (_MaySet arg0@@47 arg1@@23)) (FieldType PredicateType__MaySetType FrameTypeType))
 :qid |funType:_MaySet|
 :pattern ( (_MaySet arg0@@47 arg1@@23))
))))
(assert (forall ((rec T@U) (id Int) ) (!  (=> (= (type rec) RefType) (IsPredicateField (_MaySet rec id)))
 :qid |stdinbpl.2121:15|
 :skolemid |257|
 :pattern ( (_MaySet rec id))
)))
(assert (forall ((Heap@@1 T@U) (self@@0 Int) (other@@0 Int) ) (!  (=> (= (type Heap@@1) (MapType1Type RefType)) (dummyFunction (bool_2_U (|int___gt__#triggerStateless| self@@0 other@@0))))
 :qid |stdinbpl.1926:15|
 :skolemid |232|
 :pattern ( (|int___gt__'| Heap@@1 self@@0 other@@0))
)))
(assert (forall ((Heap@@2 T@U) (rec@@0 T@U) (id@@0 Int) ) (!  (=> (and (= (type Heap@@2) (MapType1Type RefType)) (= (type rec@@0) RefType)) (|_MaySet#everUsed| (_MaySet rec@@0 id@@0)))
 :qid |stdinbpl.2140:15|
 :skolemid |261|
 :pattern ( (|_MaySet#trigger| Heap@@2 (_MaySet rec@@0 id@@0)))
)))
(assert (forall ((a@@0 Int) (b@@0 Int) ) (!  (or (= (|Math#min| a@@0 b@@0) a@@0) (= (|Math#min| a@@0 b@@0) b@@0))
 :qid |stdinbpl.697:15|
 :skolemid |101|
 :pattern ( (|Math#min| a@@0 b@@0))
)))
(assert (forall ((arg0@@48 T@U) (arg1@@24 Int) ) (! (let ((T@@7 (SeqTypeInv0 (type arg0@@48))))
(= (type (|Seq#Index| arg0@@48 arg1@@24)) T@@7))
 :qid |funType:Seq#Index|
 :pattern ( (|Seq#Index| arg0@@48 arg1@@24))
)))
(assert (forall ((s@@0 T@U) (n@@0 Int) (j Int) ) (! (let ((T@@8 (SeqTypeInv0 (type s@@0))))
 (=> (= (type s@@0) (SeqType T@@8)) (=> (and (and (< 0 n@@0) (<= 0 j)) (< j (- (|Seq#Length| s@@0) n@@0))) (and (= (|Seq#Sub| (|Seq#Add| j n@@0) n@@0) j) (= (|Seq#Index| (|Seq#Drop| s@@0 n@@0) j) (|Seq#Index| s@@0 (|Seq#Add| j n@@0)))))))
 :qid |stdinbpl.355:18|
 :skolemid |51|
 :pattern ( (|Seq#Index| (|Seq#Drop| s@@0 n@@0) j))
)))
(assert  (and (= (type null) RefType) (forall ((arg0@@49 T@U) ) (! (let ((A (FieldTypeInv0 (type arg0@@49))))
(= (type (PredicateMaskField arg0@@49)) (FieldType A (MapType2Type RefType boolType))))
 :qid |funType:PredicateMaskField|
 :pattern ( (PredicateMaskField arg0@@49))
))))
(assert (forall ((Heap@@3 T@U) (ExhaleHeap T@U) (Mask@@1 T@U) (pm_f T@U) ) (! (let ((C (FieldTypeInv0 (type pm_f))))
 (=> (and (and (and (and (and (= (type Heap@@3) (MapType1Type RefType)) (= (type ExhaleHeap) (MapType1Type RefType))) (= (type Mask@@1) (MapType2Type RefType realType))) (= (type pm_f) (FieldType C FrameTypeType))) (IdenticalOnKnownLocations Heap@@3 ExhaleHeap Mask@@1)) (and (HasDirectPerm Mask@@1 null pm_f) (IsPredicateField pm_f))) (= (MapType1Select Heap@@3 null (PredicateMaskField pm_f)) (MapType1Select ExhaleHeap null (PredicateMaskField pm_f)))))
 :qid |stdinbpl.49:19|
 :skolemid |2|
 :pattern ( (IdenticalOnKnownLocations Heap@@3 ExhaleHeap Mask@@1) (IsPredicateField pm_f) (MapType1Select ExhaleHeap null (PredicateMaskField pm_f)))
)))
(assert (forall ((arg0@@50 T@U) ) (! (let ((A@@0 (FieldTypeInv0 (type arg0@@50))))
(= (type (WandMaskField arg0@@50)) (FieldType A@@0 (MapType2Type RefType boolType))))
 :qid |funType:WandMaskField|
 :pattern ( (WandMaskField arg0@@50))
)))
(assert (forall ((Heap@@4 T@U) (ExhaleHeap@@0 T@U) (Mask@@2 T@U) (pm_f@@0 T@U) ) (! (let ((C@@0 (FieldTypeInv0 (type pm_f@@0))))
 (=> (and (and (and (and (and (= (type Heap@@4) (MapType1Type RefType)) (= (type ExhaleHeap@@0) (MapType1Type RefType))) (= (type Mask@@2) (MapType2Type RefType realType))) (= (type pm_f@@0) (FieldType C@@0 FrameTypeType))) (IdenticalOnKnownLocations Heap@@4 ExhaleHeap@@0 Mask@@2)) (and (HasDirectPerm Mask@@2 null pm_f@@0) (IsWandField pm_f@@0))) (= (MapType1Select Heap@@4 null (WandMaskField pm_f@@0)) (MapType1Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))))
 :qid |stdinbpl.62:19|
 :skolemid |5|
 :pattern ( (IdenticalOnKnownLocations Heap@@4 ExhaleHeap@@0 Mask@@2) (IsWandField pm_f@@0) (MapType1Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))
)))
(assert  (and (forall ((arg0@@51 T@U) ) (! (= (type (typeof arg0@@51)) PyTypeDomainTypeType)
 :qid |funType:typeof|
 :pattern ( (typeof arg0@@51))
)) (forall ((arg0@@52 T@U) (arg1@@25 Bool) ) (! (= (type (|__prim__bool___box__'| arg0@@52 arg1@@25)) RefType)
 :qid |funType:__prim__bool___box__'|
 :pattern ( (|__prim__bool___box__'| arg0@@52 arg1@@25))
))))
(assert (forall ((Heap@@5 T@U) (Mask@@3 T@U) (box T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@5) (MapType1Type RefType)) (= (type Mask@@3) (MapType2Type RefType realType))) (= (type box) RefType)) (and (state Heap@@5 Mask@@3) (or (< AssumeFunctionsAbove 0) (|int___unbox__#trigger| EmptyFrame box)))) (issubtype (typeof box) vint)) (issubtype (typeof box) vbool)) (= (|__prim__bool___box__'| Heap@@5 (not (= (|int___unbox__'| Heap@@5 box) 0))) box))
 :qid |stdinbpl.1714:15|
 :skolemid |220|
 :pattern ( (state Heap@@5 Mask@@3) (|int___unbox__'| Heap@@5 box))
)))
(assert  (and (= (Ctor PredicateType_MustTerminateType) 19) (forall ((arg0@@53 T@U) ) (! (= (type (MustTerminate arg0@@53)) (FieldType PredicateType_MustTerminateType FrameTypeType))
 :qid |funType:MustTerminate|
 :pattern ( (MustTerminate arg0@@53))
))))
(assert (forall ((r_1 T@U) ) (!  (=> (= (type r_1) RefType) (IsPredicateField (MustTerminate r_1)))
 :qid |stdinbpl.2016:15|
 :skolemid |239|
 :pattern ( (MustTerminate r_1))
)))
(assert  (and (= (Ctor PredicateType_MustInvokeBoundedType) 20) (forall ((arg0@@54 T@U) ) (! (= (type (MustInvokeBounded arg0@@54)) (FieldType PredicateType_MustInvokeBoundedType FrameTypeType))
 :qid |funType:MustInvokeBounded|
 :pattern ( (MustInvokeBounded arg0@@54))
))))
(assert (forall ((r_1@@0 T@U) ) (!  (=> (= (type r_1@@0) RefType) (IsPredicateField (MustInvokeBounded r_1@@0)))
 :qid |stdinbpl.2051:15|
 :skolemid |245|
 :pattern ( (MustInvokeBounded r_1@@0))
)))
(assert  (and (= (Ctor PredicateType_MustInvokeUnboundedType) 21) (forall ((arg0@@55 T@U) ) (! (= (type (MustInvokeUnbounded arg0@@55)) (FieldType PredicateType_MustInvokeUnboundedType FrameTypeType))
 :qid |funType:MustInvokeUnbounded|
 :pattern ( (MustInvokeUnbounded arg0@@55))
))))
(assert (forall ((r_1@@1 T@U) ) (!  (=> (= (type r_1@@1) RefType) (IsPredicateField (MustInvokeUnbounded r_1@@1)))
 :qid |stdinbpl.2086:15|
 :skolemid |251|
 :pattern ( (MustInvokeUnbounded r_1@@1))
)))
(assert (forall ((Heap@@6 T@U) (id@@1 Int) ) (!  (=> (= (type Heap@@6) (MapType1Type RefType)) (dummyFunction (bool_2_U (|_isDefined#triggerStateless| id@@1))))
 :qid |stdinbpl.1587:15|
 :skolemid |209|
 :pattern ( (|_isDefined'| Heap@@6 id@@1))
)))
(assert  (and (forall ((arg0@@56 T@U) (arg1@@26 Int) ) (! (= (type (|__prim__int___box__'| arg0@@56 arg1@@26)) RefType)
 :qid |funType:__prim__int___box__'|
 :pattern ( (|__prim__int___box__'| arg0@@56 arg1@@26))
)) (forall ((arg0@@57 Int) ) (! (= (type (|__prim__int___box__#triggerStateless| arg0@@57)) RefType)
 :qid |funType:__prim__int___box__#triggerStateless|
 :pattern ( (|__prim__int___box__#triggerStateless| arg0@@57))
))))
(assert (forall ((Heap@@7 T@U) (prim Int) ) (!  (=> (= (type Heap@@7) (MapType1Type RefType)) (dummyFunction (|__prim__int___box__#triggerStateless| prim)))
 :qid |stdinbpl.1627:15|
 :skolemid |212|
 :pattern ( (|__prim__int___box__'| Heap@@7 prim))
)))
(assert (forall ((Heap@@8 T@U) (box@@0 T@U) ) (!  (=> (and (= (type Heap@@8) (MapType1Type RefType)) (= (type box@@0) RefType)) (dummyFunction (int_2_U (|int___unbox__#triggerStateless| box@@0))))
 :qid |stdinbpl.1697:15|
 :skolemid |217|
 :pattern ( (|int___unbox__'| Heap@@8 box@@0))
)))
(assert (forall ((arg0@@58 Bool) ) (! (= (type (|__prim__bool___box__#triggerStateless| arg0@@58)) RefType)
 :qid |funType:__prim__bool___box__#triggerStateless|
 :pattern ( (|__prim__bool___box__#triggerStateless| arg0@@58))
)))
(assert (forall ((Heap@@9 T@U) (prim@@0 Bool) ) (!  (=> (= (type Heap@@9) (MapType1Type RefType)) (dummyFunction (|__prim__bool___box__#triggerStateless| prim@@0)))
 :qid |stdinbpl.1776:15|
 :skolemid |222|
 :pattern ( (|__prim__bool___box__'| Heap@@9 prim@@0))
)))
(assert (forall ((Heap@@10 T@U) (box@@1 T@U) ) (!  (=> (and (= (type Heap@@10) (MapType1Type RefType)) (= (type box@@1) RefType)) (dummyFunction (bool_2_U (|bool___unbox__#triggerStateless| box@@1))))
 :qid |stdinbpl.1864:15|
 :skolemid |228|
 :pattern ( (|bool___unbox__'| Heap@@10 box@@1))
)))
(assert (forall ((Heap@@11 T@U) (r_1@@2 T@U) ) (!  (=> (and (= (type Heap@@11) (MapType1Type RefType)) (= (type r_1@@2) RefType)) (dummyFunction (real_2_U (|Level#triggerStateless| r_1@@2))))
 :qid |stdinbpl.1975:15|
 :skolemid |236|
 :pattern ( (|Level'| Heap@@11 r_1@@2))
)))
(assert (forall ((Heap@@12 T@U) (r_1@@3 T@U) ) (!  (=> (and (= (type Heap@@12) (MapType1Type RefType)) (= (type r_1@@3) RefType)) (|MustTerminate#everUsed| (MustTerminate r_1@@3)))
 :qid |stdinbpl.2035:15|
 :skolemid |243|
 :pattern ( (|MustTerminate#trigger| Heap@@12 (MustTerminate r_1@@3)))
)))
(assert (forall ((Heap@@13 T@U) (r_1@@4 T@U) ) (!  (=> (and (= (type Heap@@13) (MapType1Type RefType)) (= (type r_1@@4) RefType)) (|MustInvokeBounded#everUsed| (MustInvokeBounded r_1@@4)))
 :qid |stdinbpl.2070:15|
 :skolemid |249|
 :pattern ( (|MustInvokeBounded#trigger| Heap@@13 (MustInvokeBounded r_1@@4)))
)))
(assert (forall ((Heap@@14 T@U) (r_1@@5 T@U) ) (!  (=> (and (= (type Heap@@14) (MapType1Type RefType)) (= (type r_1@@5) RefType)) (|MustInvokeUnbounded#everUsed| (MustInvokeUnbounded r_1@@5)))
 :qid |stdinbpl.2105:15|
 :skolemid |255|
 :pattern ( (|MustInvokeUnbounded#trigger| Heap@@14 (MustInvokeUnbounded r_1@@5)))
)))
(assert (forall ((arg0@@59 T@U) (arg1@@27 Int) (arg2@@5 T@U) ) (! (let ((T@@9 (type arg2@@5)))
(= (type (|Seq#Update| arg0@@59 arg1@@27 arg2@@5)) (SeqType T@@9)))
 :qid |funType:Seq#Update|
 :pattern ( (|Seq#Update| arg0@@59 arg1@@27 arg2@@5))
)))
(assert (forall ((s@@1 T@U) (i Int) (v@@0 T@U) (n@@1 Int) ) (! (let ((T@@10 (type v@@0)))
 (=> (= (type s@@1) (SeqType T@@10)) (=> (and (<= 0 n@@1) (< n@@1 (|Seq#Length| s@@1))) (and (=> (= i n@@1) (= (|Seq#Index| (|Seq#Update| s@@1 i v@@0) n@@1) v@@0)) (=> (not (= i n@@1)) (= (|Seq#Index| (|Seq#Update| s@@1 i v@@0) n@@1) (|Seq#Index| s@@1 n@@1)))))))
 :qid |stdinbpl.310:18|
 :skolemid |47|
 :pattern ( (|Seq#Index| (|Seq#Update| s@@1 i v@@0) n@@1))
 :pattern ( (|Seq#Index| s@@1 n@@1) (|Seq#Update| s@@1 i v@@0))
)))
(assert (forall ((r_1@@6 T@U) ) (!  (=> (= (type r_1@@6) RefType) (= (issubtype (typeof r_1@@6) NoneType) (= r_1@@6 null)))
 :qid |stdinbpl.1073:15|
 :skolemid |154|
 :pattern ( (typeof r_1@@6))
)))
(assert (forall ((a@@1 T@U) (b@@1 T@U) (y@@1 T@U) ) (! (let ((T@@11 (type y@@1)))
 (=> (and (and (= (type a@@1) (MultiSetType T@@11)) (= (type b@@1) (MultiSetType T@@11))) (<= (|MultiSet#Select| a@@1 y@@1) (|MultiSet#Select| b@@1 y@@1))) (= (|MultiSet#Select| (|MultiSet#Difference| a@@1 b@@1) y@@1) 0)))
 :qid |stdinbpl.764:18|
 :skolemid |121|
 :pattern ( (|MultiSet#Difference| a@@1 b@@1) (|MultiSet#Select| b@@1 y@@1) (|MultiSet#Select| a@@1 y@@1))
)))
(assert (forall ((arg0@@60 T@U) (arg1@@28 T@U) ) (! (let ((T@@12 (MapType0TypeInv0 (type arg0@@60))))
(= (type (|Set#Union| arg0@@60 arg1@@28)) (MapType0Type T@@12 boolType)))
 :qid |funType:Set#Union|
 :pattern ( (|Set#Union| arg0@@60 arg1@@28))
)))
(assert (forall ((a@@2 T@U) (b@@2 T@U) ) (! (let ((T@@13 (MapType0TypeInv0 (type a@@2))))
 (=> (and (= (type a@@2) (MapType0Type T@@13 boolType)) (= (type b@@2) (MapType0Type T@@13 boolType))) (= (|Set#Union| (|Set#Union| a@@2 b@@2) b@@2) (|Set#Union| a@@2 b@@2))))
 :qid |stdinbpl.649:18|
 :skolemid |86|
 :pattern ( (|Set#Union| (|Set#Union| a@@2 b@@2) b@@2))
)))
(assert (forall ((arg0@@61 T@U) (arg1@@29 T@U) ) (! (let ((T@@14 (MapType0TypeInv0 (type arg0@@61))))
(= (type (|Set#Intersection| arg0@@61 arg1@@29)) (MapType0Type T@@14 boolType)))
 :qid |funType:Set#Intersection|
 :pattern ( (|Set#Intersection| arg0@@61 arg1@@29))
)))
(assert (forall ((a@@3 T@U) (b@@3 T@U) ) (! (let ((T@@15 (MapType0TypeInv0 (type a@@3))))
 (=> (and (= (type a@@3) (MapType0Type T@@15 boolType)) (= (type b@@3) (MapType0Type T@@15 boolType))) (= (|Set#Intersection| (|Set#Intersection| a@@3 b@@3) b@@3) (|Set#Intersection| a@@3 b@@3))))
 :qid |stdinbpl.653:18|
 :skolemid |88|
 :pattern ( (|Set#Intersection| (|Set#Intersection| a@@3 b@@3) b@@3))
)))
(assert (forall ((a@@4 T@U) (b@@4 T@U) ) (! (let ((T@@16 (MultiSetTypeInv0 (type a@@4))))
 (=> (and (= (type a@@4) (MultiSetType T@@16)) (= (type b@@4) (MultiSetType T@@16))) (= (|MultiSet#Intersection| (|MultiSet#Intersection| a@@4 b@@4) b@@4) (|MultiSet#Intersection| a@@4 b@@4))))
 :qid |stdinbpl.755:18|
 :skolemid |118|
 :pattern ( (|MultiSet#Intersection| (|MultiSet#Intersection| a@@4 b@@4) b@@4))
)))
(assert (forall ((arg0@@62 T@U) (arg1@@30 T@U) ) (! (let ((T@@17 (SeqTypeInv0 (type arg0@@62))))
(= (type (|Seq#Append| arg0@@62 arg1@@30)) (SeqType T@@17)))
 :qid |funType:Seq#Append|
 :pattern ( (|Seq#Append| arg0@@62 arg1@@30))
)))
(assert (forall ((__ss1 T@U) (__ss2 T@U) ) (! (let ((T$@@1 (SeqTypeInv0 (type __ss1))))
 (=> (and (= (type __ss1) (SeqType T$@@1)) (= (type __ss2) (SeqType T$@@1))) (|MultiSet#Equal| (__toMS (|Seq#Append| __ss1 __ss2)) (|MultiSet#Union| (__toMS __ss1) (__toMS __ss2)))))
 :qid |stdinbpl.1419:20|
 :skolemid |196|
 :pattern ( (__toMS (|Seq#Append| __ss1 __ss2)))
)))
(assert (forall ((n1_1 T@U) (n2_1 T@U) ) (!  (=> (and (= (type n1_1) _NameDomainTypeType) (= (type n2_1) _NameDomainTypeType)) (not (_name_type (_combine n1_1 n2_1))))
 :qid |stdinbpl.1492:15|
 :skolemid |203|
 :pattern ( (_combine n1_1 n2_1))
)))
(assert (forall ((arg0@@63 T@U) (arg1@@31 T@U) (arg2@@6 T@U) ) (! (let ((V@@2 (type arg2@@6)))
(let ((U@@2 (type arg1@@31)))
(= (type (|Map#Build| arg0@@63 arg1@@31 arg2@@6)) (MapType U@@2 V@@2))))
 :qid |funType:Map#Build|
 :pattern ( (|Map#Build| arg0@@63 arg1@@31 arg2@@6))
)))
(assert (forall ((m@@11 T@U) (u@@0 T@U) (v@@1 T@U) ) (! (let ((V@@3 (type v@@1)))
(let ((U@@3 (type u@@0)))
 (=> (and (= (type m@@11) (MapType U@@3 V@@3)) (U_2_bool (MapType0Select (|Map#Domain| m@@11) u@@0))) (= (|Map#Card| (|Map#Build| m@@11 u@@0 v@@1)) (|Map#Card| m@@11)))))
 :qid |stdinbpl.864:21|
 :skolemid |141|
 :pattern ( (|Map#Card| (|Map#Build| m@@11 u@@0 v@@1)))
 :pattern ( (|Map#Card| m@@11) (|Map#Build| m@@11 u@@0 v@@1))
)))
(assert (forall ((arg0@@64 T@U) ) (! (let ((T@@18 (type arg0@@64)))
(= (type (|Set#Singleton| arg0@@64)) (MapType0Type T@@18 boolType)))
 :qid |funType:Set#Singleton|
 :pattern ( (|Set#Singleton| arg0@@64))
)))
(assert (forall ((r T@U) (o T@U) ) (! (let ((T@@19 (type r)))
 (=> (= (type o) T@@19) (= (U_2_bool (MapType0Select (|Set#Singleton| r) o)) (= r o))))
 :qid |stdinbpl.618:18|
 :skolemid |75|
 :pattern ( (MapType0Select (|Set#Singleton| r) o))
)))
(assert (forall ((arg0@@65 T@U) (arg1@@32 Int) ) (! (let ((T@@20 (SeqTypeInv0 (type arg0@@65))))
(= (type (|Seq#Take| arg0@@65 arg1@@32)) (SeqType T@@20)))
 :qid |funType:Seq#Take|
 :pattern ( (|Seq#Take| arg0@@65 arg1@@32))
)))
(assert (forall ((s@@2 T@U) (n@@2 Int) ) (! (let ((T@@21 (SeqTypeInv0 (type s@@2))))
 (=> (= (type s@@2) (SeqType T@@21)) (and (=> (<= 0 n@@2) (and (=> (<= n@@2 (|Seq#Length| s@@2)) (= (|Seq#Length| (|Seq#Take| s@@2 n@@2)) n@@2)) (=> (< (|Seq#Length| s@@2) n@@2) (= (|Seq#Length| (|Seq#Take| s@@2 n@@2)) (|Seq#Length| s@@2))))) (=> (< n@@2 0) (= (|Seq#Length| (|Seq#Take| s@@2 n@@2)) 0)))))
 :qid |stdinbpl.321:18|
 :skolemid |48|
 :pattern ( (|Seq#Length| (|Seq#Take| s@@2 n@@2)))
 :pattern ( (|Seq#Take| s@@2 n@@2) (|Seq#Length| s@@2))
)))
(assert (forall ((arg0@@66 Int) ) (! (= (type (_single arg0@@66)) _NameDomainTypeType)
 :qid |funType:_single|
 :pattern ( (_single arg0@@66))
)))
(assert (forall ((i@@0 Int) ) (! (_name_type (_single i@@0))
 :qid |stdinbpl.1474:15|
 :skolemid |200|
 :pattern ( (_single i@@0))
)))
(assert (forall ((Heap@@15 T@U) (Mask@@4 T@U) (prim@@1 Bool) ) (!  (=> (and (and (= (type Heap@@15) (MapType1Type RefType)) (= (type Mask@@4) (MapType2Type RefType realType))) (and (state Heap@@15 Mask@@4) (or (< AssumeFunctionsAbove 0) (|__prim__bool___box__#trigger| EmptyFrame prim@@1)))) (= (|bool___unbox__'| Heap@@15 (|__prim__bool___box__'| Heap@@15 prim@@1)) prim@@1))
 :qid |stdinbpl.1793:15|
 :skolemid |225|
 :pattern ( (state Heap@@15 Mask@@4) (|__prim__bool___box__'| Heap@@15 prim@@1))
)))
(assert (forall ((arg0@@67 T@U) (arg1@@33 T@U) (arg2@@7 T@U) ) (! (= (type (union_type_3 arg0@@67 arg1@@33 arg2@@7)) PyTypeDomainTypeType)
 :qid |funType:union_type_3|
 :pattern ( (union_type_3 arg0@@67 arg1@@33 arg2@@7))
)))
(assert (forall ((arg_1_1@@0 T@U) (arg_2_1@@0 T@U) (arg_3_1@@0 T@U) (X@@0 T@U) ) (!  (=> (and (and (and (= (type arg_1_1@@0) PyTypeDomainTypeType) (= (type arg_2_1@@0) PyTypeDomainTypeType)) (= (type arg_3_1@@0) PyTypeDomainTypeType)) (= (type X@@0) PyTypeDomainTypeType)) (= (issubtype (union_type_3 arg_1_1@@0 arg_2_1@@0 arg_3_1@@0) X@@0)  (and (issubtype arg_1_1@@0 X@@0) (and (issubtype arg_2_1@@0 X@@0) (issubtype arg_3_1@@0 X@@0)))))
 :qid |stdinbpl.1160:15|
 :skolemid |169|
 :pattern ( (issubtype (union_type_3 arg_1_1@@0 arg_2_1@@0 arg_3_1@@0) X@@0))
)))
(assert  (and (= (Ctor Measure$DomainTypeType) 22) (forall ((arg0@@68 Bool) (arg1@@34 T@U) (arg2@@8 Int) ) (! (= (type (Measure$create arg0@@68 arg1@@34 arg2@@8)) Measure$DomainTypeType)
 :qid |funType:Measure$create|
 :pattern ( (Measure$create arg0@@68 arg1@@34 arg2@@8))
))))
(assert (forall ((g Bool) (k T@U) (v_2 Int) ) (!  (=> (= (type k) RefType) (= (Measure$guard (Measure$create g k v_2)) g))
 :qid |stdinbpl.1379:15|
 :skolemid |191|
 :pattern ( (Measure$guard (Measure$create g k v_2)))
)))
(assert (forall ((Heap@@16 T@U) (Mask@@5 T@U) (box@@2 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@16) (MapType1Type RefType)) (= (type Mask@@5) (MapType2Type RefType realType))) (= (type box@@2) RefType)) (and (state Heap@@16 Mask@@5) (or (< AssumeFunctionsAbove 0) (|bool___unbox__#trigger| EmptyFrame box@@2)))) (issubtype (typeof box@@2) vbool)) (= (|__prim__bool___box__'| Heap@@16 (|bool___unbox__'| Heap@@16 box@@2)) box@@2))
 :qid |stdinbpl.1877:15|
 :skolemid |230|
 :pattern ( (state Heap@@16 Mask@@5) (|bool___unbox__'| Heap@@16 box@@2))
)))
(assert (forall ((arg0@@69 Int) (arg1@@35 Int) ) (! (= (type (|Seq#Range| arg0@@69 arg1@@35)) (SeqType intType))
 :qid |funType:Seq#Range|
 :pattern ( (|Seq#Range| arg0@@69 arg1@@35))
)))
(assert (forall ((q@min Int) (q@max Int) (v@@2 T@U) ) (!  (=> (= (type v@@2) intType) (= (|Seq#Contains| (|Seq#Range| q@min q@max) v@@2)  (and (<= q@min (U_2_int v@@2)) (< (U_2_int v@@2) q@max))))
 :qid |stdinbpl.594:15|
 :skolemid |69|
 :pattern ( (|Seq#Contains| (|Seq#Range| q@min q@max) v@@2))
)))
(assert (forall ((a@@5 T@U) (b@@5 T@U) ) (! (let ((T@@22 (MapType0TypeInv0 (type a@@5))))
 (=> (and (= (type a@@5) (MapType0Type T@@22 boolType)) (= (type b@@5) (MapType0Type T@@22 boolType))) (= (+ (|Set#Card| (|Set#Union| a@@5 b@@5)) (|Set#Card| (|Set#Intersection| a@@5 b@@5))) (+ (|Set#Card| a@@5) (|Set#Card| b@@5)))))
 :qid |stdinbpl.657:18|
 :skolemid |90|
 :pattern ( (|Set#Card| (|Set#Union| a@@5 b@@5)))
 :pattern ( (|Set#Card| (|Set#Intersection| a@@5 b@@5)))
)))
(assert (forall ((s@@3 T@U) (x@@8 T@U) ) (! (let ((T@@23 (type x@@8)))
 (=> (and (= (type s@@3) (SeqType T@@23)) (|Seq#Contains| s@@3 x@@8)) (and (and (<= 0 (|Seq#Skolem| s@@3 x@@8)) (< (|Seq#Skolem| s@@3 x@@8) (|Seq#Length| s@@3))) (= (|Seq#Index| s@@3 (|Seq#Skolem| s@@3 x@@8)) x@@8))))
 :qid |stdinbpl.452:18|
 :skolemid |59|
 :pattern ( (|Seq#Contains| s@@3 x@@8))
)))
(assert (forall ((Heap@@17 T@U) (ExhaleHeap@@1 T@U) (Mask@@6 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@17) (MapType1Type RefType)) (= (type ExhaleHeap@@1) (MapType1Type RefType))) (= (type Mask@@6) (MapType2Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@17 ExhaleHeap@@1 Mask@@6)) (U_2_bool (MapType1Select Heap@@17 o_1 $allocated))) (U_2_bool (MapType1Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.75:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@17 ExhaleHeap@@1 Mask@@6) (MapType1Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert (forall ((Heap@@18 T@U) (ExhaleHeap@@2 T@U) (Mask@@7 T@U) (o_2 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@18) (MapType1Type RefType)) (= (type ExhaleHeap@@2) (MapType1Type RefType))) (= (type Mask@@7) (MapType2Type RefType realType))) (= (type o_2) RefType)) (IdenticalOnKnownLocationsLiberal Heap@@18 ExhaleHeap@@2 Mask@@7)) (U_2_bool (MapType1Select Heap@@18 o_2 $allocated))) (U_2_bool (MapType1Select ExhaleHeap@@2 o_2 $allocated)))
 :qid |stdinbpl.142:15|
 :skolemid |23|
 :pattern ( (IdenticalOnKnownLocationsLiberal Heap@@18 ExhaleHeap@@2 Mask@@7) (MapType1Select ExhaleHeap@@2 o_2 $allocated))
)))
(assert (forall ((arg0@@70 T@U) (arg1@@36 Int) ) (! (= (type (__prim__int___box__ arg0@@70 arg1@@36)) RefType)
 :qid |funType:__prim__int___box__|
 :pattern ( (__prim__int___box__ arg0@@70 arg1@@36))
)))
(assert (forall ((Heap@@19 T@U) (prim@@2 Int) ) (!  (=> (= (type Heap@@19) (MapType1Type RefType)) (and (= (__prim__int___box__ Heap@@19 prim@@2) (|__prim__int___box__'| Heap@@19 prim@@2)) (dummyFunction (|__prim__int___box__#triggerStateless| prim@@2))))
 :qid |stdinbpl.1623:15|
 :skolemid |211|
 :pattern ( (__prim__int___box__ Heap@@19 prim@@2))
)))
(assert (forall ((Heap@@20 T@U) (box@@3 T@U) ) (!  (=> (and (= (type Heap@@20) (MapType1Type RefType)) (= (type box@@3) RefType)) (and (= (int___unbox__ Heap@@20 box@@3) (|int___unbox__'| Heap@@20 box@@3)) (dummyFunction (int_2_U (|int___unbox__#triggerStateless| box@@3)))))
 :qid |stdinbpl.1693:15|
 :skolemid |216|
 :pattern ( (int___unbox__ Heap@@20 box@@3))
)))
(assert (forall ((arg0@@71 T@U) (arg1@@37 Bool) ) (! (= (type (__prim__bool___box__ arg0@@71 arg1@@37)) RefType)
 :qid |funType:__prim__bool___box__|
 :pattern ( (__prim__bool___box__ arg0@@71 arg1@@37))
)))
(assert (forall ((Heap@@21 T@U) (prim@@3 Bool) ) (!  (=> (= (type Heap@@21) (MapType1Type RefType)) (and (= (__prim__bool___box__ Heap@@21 prim@@3) (|__prim__bool___box__'| Heap@@21 prim@@3)) (dummyFunction (|__prim__bool___box__#triggerStateless| prim@@3))))
 :qid |stdinbpl.1772:15|
 :skolemid |221|
 :pattern ( (__prim__bool___box__ Heap@@21 prim@@3))
)))
(assert (forall ((Heap@@22 T@U) (r_1@@7 T@U) ) (!  (=> (and (= (type Heap@@22) (MapType1Type RefType)) (= (type r_1@@7) RefType)) (and (= (Level Heap@@22 r_1@@7) (|Level'| Heap@@22 r_1@@7)) (dummyFunction (real_2_U (|Level#triggerStateless| r_1@@7)))))
 :qid |stdinbpl.1971:15|
 :skolemid |235|
 :pattern ( (Level Heap@@22 r_1@@7))
)))
(assert (forall ((s@@4 T@U) (n@@3 Int) ) (! (let ((T@@24 (SeqTypeInv0 (type s@@4))))
 (=> (and (= (type s@@4) (SeqType T@@24)) (<= n@@3 0)) (= (|Seq#Drop| s@@4 n@@3) s@@4)))
 :qid |stdinbpl.436:18|
 :skolemid |57|
 :pattern ( (|Seq#Drop| s@@4 n@@3))
)))
(assert (forall ((i@@1 Int) (j@@0 Int) ) (! (= (|Seq#Sub| i@@1 j@@0) (- i@@1 j@@0))
 :qid |stdinbpl.290:15|
 :skolemid |42|
 :pattern ( (|Seq#Sub| i@@1 j@@0))
)))
(assert (forall ((i@@2 Int) (j@@1 Int) ) (! (= (|Seq#Add| i@@2 j@@1) (+ i@@2 j@@1))
 :qid |stdinbpl.288:15|
 :skolemid |41|
 :pattern ( (|Seq#Add| i@@2 j@@1))
)))
(assert  (and (forall ((arg0@@72 T@U) (arg1@@38 T@U) ) (! (= (type (dict arg0@@72 arg1@@38)) PyTypeDomainTypeType)
 :qid |funType:dict|
 :pattern ( (dict arg0@@72 arg1@@38))
)) (forall ((arg0@@73 T@U) ) (! (= (type (get_basic arg0@@73)) PyTypeDomainTypeType)
 :qid |funType:get_basic|
 :pattern ( (get_basic arg0@@73))
))))
(assert (forall ((var0 T@U) (var1 T@U) ) (!  (=> (and (= (type var0) PyTypeDomainTypeType) (= (type var1) PyTypeDomainTypeType)) (and (extends_ (dict var0 var1) object) (= (get_basic (dict var0 var1)) dict_basic)))
 :qid |stdinbpl.1196:15|
 :skolemid |175|
 :pattern ( (dict var0 var1))
)))
(assert (forall ((a@@6 Int) ) (!  (=> (<= 0 a@@6) (= (|Math#clip| a@@6) a@@6))
 :qid |stdinbpl.700:15|
 :skolemid |102|
 :pattern ( (|Math#clip| a@@6))
)))
(assert (forall ((a@@7 T@U) (b@@6 T@U) (o@@0 T@U) ) (! (let ((T@@25 (type o@@0)))
 (=> (and (= (type a@@7) (MultiSetType T@@25)) (= (type b@@6) (MultiSetType T@@25))) (= (|MultiSet#Select| (|MultiSet#Intersection| a@@7 b@@6) o@@0) (|Math#min| (|MultiSet#Select| a@@7 o@@0) (|MultiSet#Select| b@@6 o@@0)))))
 :qid |stdinbpl.751:18|
 :skolemid |117|
 :pattern ( (|MultiSet#Select| (|MultiSet#Intersection| a@@7 b@@6) o@@0))
)))
(assert (forall ((Heap@@23 T@U) (Mask@@8 T@U) (prim@@4 Int) ) (!  (=> (and (and (= (type Heap@@23) (MapType1Type RefType)) (= (type Mask@@8) (MapType2Type RefType realType))) (and (state Heap@@23 Mask@@8) (or (< AssumeFunctionsAbove 0) (|__prim__int___box__#trigger| EmptyFrame prim@@4)))) (= (|int___unbox__'| Heap@@23 (|__prim__int___box__'| Heap@@23 prim@@4)) prim@@4))
 :qid |stdinbpl.1644:15|
 :skolemid |215|
 :pattern ( (state Heap@@23 Mask@@8) (|__prim__int___box__'| Heap@@23 prim@@4))
)))
(assert (extends_ vint float))
(assert (= (get_basic vint) vint))
(assert (extends_ float object))
(assert (= (get_basic float) float))
(assert (extends_ vbool vint))
(assert (= (get_basic vbool) vbool))
(assert (extends_ NoneType object))
(assert (= (get_basic NoneType) NoneType))
(assert (extends_ Exception object))
(assert (= (get_basic Exception) Exception))
(assert (extends_ ConnectionRefusedError Exception))
(assert (= (get_basic ConnectionRefusedError) ConnectionRefusedError))
(assert (extends_ traceback object))
(assert (= (get_basic traceback) traceback))
(assert (extends_ str object))
(assert (= (get_basic str) str))
(assert (extends_ bytes object))
(assert (= (get_basic bytes) bytes))
(assert (extends_ slice object))
(assert (= (get_basic slice) slice))
(assert (extends_ range_0 object))
(assert (= (get_basic range_0) range_0))
(assert (extends_ Thread_0 object))
(assert (= (get_basic Thread_0) Thread_0))
(assert (extends_ LevelType object))
(assert (= (get_basic LevelType) LevelType))
(assert (extends_ vtype object))
(assert (= (get_basic vtype) vtype))
(assert (extends_ Place object))
(assert (= (get_basic Place) Place))
(assert (extends_ __prim__Seq_type object))
(assert (= (get_basic __prim__Seq_type) __prim__Seq_type))
(assert (forall ((arg0@@74 T@U) ) (! (let ((T@@26 (type arg0@@74)))
(= (type (|Seq#Singleton| arg0@@74)) (SeqType T@@26)))
 :qid |funType:Seq#Singleton|
 :pattern ( (|Seq#Singleton| arg0@@74))
)))
(assert (forall ((x@@9 T@U) (y@@2 T@U) ) (! (let ((T@@27 (type x@@9)))
 (=> (= (type y@@2) T@@27) (= (|Seq#Contains| (|Seq#Singleton| x@@9) y@@2) (= x@@9 y@@2))))
 :qid |stdinbpl.577:18|
 :skolemid |66|
 :pattern ( (|Seq#Contains| (|Seq#Singleton| x@@9) y@@2))
)))
(assert (forall ((int1 T@U) (int2 T@U) ) (!  (=> (and (and (= (type int1) intType) (= (type int2) intType)) (< (U_2_int int1) (U_2_int int2))) (decreasing int1 int2))
 :qid |stdinbpl.1517:15|
 :skolemid |206|
 :pattern ( (decreasing int1 int2))
)))
(assert (forall ((arg0@@75 T@U) ) (! (= (type (Measure$key arg0@@75)) RefType)
 :qid |funType:Measure$key|
 :pattern ( (Measure$key arg0@@75))
)))
(assert (forall ((g@@0 Bool) (k@@0 T@U) (v_2@@0 Int) ) (!  (=> (= (type k@@0) RefType) (= (Measure$key (Measure$create g@@0 k@@0 v_2@@0)) k@@0))
 :qid |stdinbpl.1385:15|
 :skolemid |192|
 :pattern ( (Measure$key (Measure$create g@@0 k@@0 v_2@@0)))
)))
(assert (forall ((g@@1 Bool) (k@@1 T@U) (v_2@@1 Int) ) (!  (=> (= (type k@@1) RefType) (= (Measure$value (Measure$create g@@1 k@@1 v_2@@1)) v_2@@1))
 :qid |stdinbpl.1391:15|
 :skolemid |193|
 :pattern ( (Measure$value (Measure$create g@@1 k@@1 v_2@@1)))
)))
(assert (forall ((rec@@1 T@U) (id@@2 Int) (rec2 T@U) (id2 Int) ) (!  (=> (and (and (= (type rec@@1) RefType) (= (type rec2) RefType)) (= (_MaySet rec@@1 id@@2) (_MaySet rec2 id2))) (and (= rec@@1 rec2) (= id@@2 id2)))
 :qid |stdinbpl.2131:15|
 :skolemid |259|
 :pattern ( (_MaySet rec@@1 id@@2) (_MaySet rec2 id2))
)))
(assert (forall ((arg0@@76 T@U) (arg1@@39 Int) ) (! (= (type (|_MaySet#sm| arg0@@76 arg1@@39)) (FieldType PredicateType__MaySetType (MapType2Type RefType boolType)))
 :qid |funType:_MaySet#sm|
 :pattern ( (|_MaySet#sm| arg0@@76 arg1@@39))
)))
(assert (forall ((rec@@2 T@U) (id@@3 Int) (rec2@@0 T@U) (id2@@0 Int) ) (!  (=> (and (and (= (type rec@@2) RefType) (= (type rec2@@0) RefType)) (= (|_MaySet#sm| rec@@2 id@@3) (|_MaySet#sm| rec2@@0 id2@@0))) (and (= rec@@2 rec2@@0) (= id@@3 id2@@0)))
 :qid |stdinbpl.2135:15|
 :skolemid |260|
 :pattern ( (|_MaySet#sm| rec@@2 id@@3) (|_MaySet#sm| rec2@@0 id2@@0))
)))
(assert (forall ((n_1@@0 T@U) ) (!  (=> (= (type n_1@@0) _NameDomainTypeType) (= (_name_type n_1@@0) (_is_single n_1@@0)))
 :qid |stdinbpl.1498:15|
 :skolemid |204|
 :pattern ( (_name_type n_1@@0))
)))
(assert (forall ((s@@5 T@U) (n@@4 Int) (j@@2 Int) ) (! (let ((T@@28 (SeqTypeInv0 (type s@@5))))
 (=> (= (type s@@5) (SeqType T@@28)) (=> (and (and (<= 0 j@@2) (< j@@2 n@@4)) (< j@@2 (|Seq#Length| s@@5))) (= (|Seq#Index| (|Seq#Take| s@@5 n@@4) j@@2) (|Seq#Index| s@@5 j@@2)))))
 :qid |stdinbpl.329:18|
 :skolemid |49|
 :pattern ( (|Seq#Index| (|Seq#Take| s@@5 n@@4) j@@2))
 :pattern ( (|Seq#Index| s@@5 j@@2) (|Seq#Take| s@@5 n@@4))
)))
(assert (forall ((r_1@@8 T@U) (r2 T@U) ) (!  (=> (and (and (= (type r_1@@8) RefType) (= (type r2) RefType)) (= (MustTerminate r_1@@8) (MustTerminate r2))) (= r_1@@8 r2))
 :qid |stdinbpl.2026:15|
 :skolemid |241|
 :pattern ( (MustTerminate r_1@@8) (MustTerminate r2))
)))
(assert (forall ((arg0@@77 T@U) ) (! (= (type (|MustTerminate#sm| arg0@@77)) (FieldType PredicateType_MustTerminateType (MapType2Type RefType boolType)))
 :qid |funType:MustTerminate#sm|
 :pattern ( (|MustTerminate#sm| arg0@@77))
)))
(assert (forall ((r_1@@9 T@U) (r2@@0 T@U) ) (!  (=> (and (and (= (type r_1@@9) RefType) (= (type r2@@0) RefType)) (= (|MustTerminate#sm| r_1@@9) (|MustTerminate#sm| r2@@0))) (= r_1@@9 r2@@0))
 :qid |stdinbpl.2030:15|
 :skolemid |242|
 :pattern ( (|MustTerminate#sm| r_1@@9) (|MustTerminate#sm| r2@@0))
)))
(assert (forall ((r_1@@10 T@U) (r2@@1 T@U) ) (!  (=> (and (and (= (type r_1@@10) RefType) (= (type r2@@1) RefType)) (= (MustInvokeBounded r_1@@10) (MustInvokeBounded r2@@1))) (= r_1@@10 r2@@1))
 :qid |stdinbpl.2061:15|
 :skolemid |247|
 :pattern ( (MustInvokeBounded r_1@@10) (MustInvokeBounded r2@@1))
)))
(assert (forall ((arg0@@78 T@U) ) (! (= (type (|MustInvokeBounded#sm| arg0@@78)) (FieldType PredicateType_MustInvokeBoundedType (MapType2Type RefType boolType)))
 :qid |funType:MustInvokeBounded#sm|
 :pattern ( (|MustInvokeBounded#sm| arg0@@78))
)))
(assert (forall ((r_1@@11 T@U) (r2@@2 T@U) ) (!  (=> (and (and (= (type r_1@@11) RefType) (= (type r2@@2) RefType)) (= (|MustInvokeBounded#sm| r_1@@11) (|MustInvokeBounded#sm| r2@@2))) (= r_1@@11 r2@@2))
 :qid |stdinbpl.2065:15|
 :skolemid |248|
 :pattern ( (|MustInvokeBounded#sm| r_1@@11) (|MustInvokeBounded#sm| r2@@2))
)))
(assert (forall ((r_1@@12 T@U) (r2@@3 T@U) ) (!  (=> (and (and (= (type r_1@@12) RefType) (= (type r2@@3) RefType)) (= (MustInvokeUnbounded r_1@@12) (MustInvokeUnbounded r2@@3))) (= r_1@@12 r2@@3))
 :qid |stdinbpl.2096:15|
 :skolemid |253|
 :pattern ( (MustInvokeUnbounded r_1@@12) (MustInvokeUnbounded r2@@3))
)))
(assert (forall ((arg0@@79 T@U) ) (! (= (type (|MustInvokeUnbounded#sm| arg0@@79)) (FieldType PredicateType_MustInvokeUnboundedType (MapType2Type RefType boolType)))
 :qid |funType:MustInvokeUnbounded#sm|
 :pattern ( (|MustInvokeUnbounded#sm| arg0@@79))
)))
(assert (forall ((r_1@@13 T@U) (r2@@4 T@U) ) (!  (=> (and (and (= (type r_1@@13) RefType) (= (type r2@@4) RefType)) (= (|MustInvokeUnbounded#sm| r_1@@13) (|MustInvokeUnbounded#sm| r2@@4))) (= r_1@@13 r2@@4))
 :qid |stdinbpl.2100:15|
 :skolemid |254|
 :pattern ( (|MustInvokeUnbounded#sm| r_1@@13) (|MustInvokeUnbounded#sm| r2@@4))
)))
(assert (forall ((m@@12 T@U) (u@@1 T@U) (v@@3 T@U) ) (! (let ((V@@4 (type v@@3)))
(let ((U@@4 (type u@@1)))
 (=> (and (= (type m@@12) (MapType U@@4 V@@4)) (not (U_2_bool (MapType0Select (|Map#Domain| m@@12) u@@1)))) (= (|Map#Card| (|Map#Build| m@@12 u@@1 v@@3)) (+ (|Map#Card| m@@12) 1)))))
 :qid |stdinbpl.867:21|
 :skolemid |142|
 :pattern ( (|Map#Card| (|Map#Build| m@@12 u@@1 v@@3)))
 :pattern ( (|Map#Card| m@@12) (|Map#Build| m@@12 u@@1 v@@3))
)))
(assert (forall ((Heap@@24 T@U) (ExhaleHeap@@3 T@U) (Mask@@9 T@U) (o_1@@0 T@U) (f_2 T@U) ) (! (let ((B@@1 (FieldTypeInv1 (type f_2))))
(let ((A@@1 (FieldTypeInv0 (type f_2))))
 (=> (and (and (and (and (and (and (= (type Heap@@24) (MapType1Type RefType)) (= (type ExhaleHeap@@3) (MapType1Type RefType))) (= (type Mask@@9) (MapType2Type RefType realType))) (= (type o_1@@0) RefType)) (= (type f_2) (FieldType A@@1 B@@1))) (IdenticalOnKnownLocations Heap@@24 ExhaleHeap@@3 Mask@@9)) (HasDirectPerm Mask@@9 o_1@@0 f_2)) (= (MapType1Select Heap@@24 o_1@@0 f_2) (MapType1Select ExhaleHeap@@3 o_1@@0 f_2)))))
 :qid |stdinbpl.44:22|
 :skolemid |1|
 :pattern ( (IdenticalOnKnownLocations Heap@@24 ExhaleHeap@@3 Mask@@9) (MapType1Select ExhaleHeap@@3 o_1@@0 f_2))
)))
(assert (forall ((Heap@@25 T@U) (ExhaleHeap@@4 T@U) (Mask@@10 T@U) (o_2@@0 T@U) (f_4 T@U) ) (! (let ((B@@2 (FieldTypeInv1 (type f_4))))
(let ((A@@2 (FieldTypeInv0 (type f_4))))
 (=> (and (and (and (and (and (and (= (type Heap@@25) (MapType1Type RefType)) (= (type ExhaleHeap@@4) (MapType1Type RefType))) (= (type Mask@@10) (MapType2Type RefType realType))) (= (type o_2@@0) RefType)) (= (type f_4) (FieldType A@@2 B@@2))) (IdenticalOnKnownLocationsLiberal Heap@@25 ExhaleHeap@@4 Mask@@10)) (HasDirectPerm Mask@@10 o_2@@0 f_4)) (= (MapType1Select Heap@@25 o_2@@0 f_4) (MapType1Select ExhaleHeap@@4 o_2@@0 f_4)))))
 :qid |stdinbpl.105:22|
 :skolemid |14|
 :pattern ( (IdenticalOnKnownLocationsLiberal Heap@@25 ExhaleHeap@@4 Mask@@10) (MapType1Select ExhaleHeap@@4 o_2@@0 f_4))
)))
(assert (forall ((T@@29 T@T) ) (! (= (|Seq#Length| (|Seq#Empty| T@@29)) 0)
 :skolemid |35|
)))
(assert  (and (= (type dummyHeap) (MapType1Type RefType)) (= (type ZeroMask) (MapType2Type RefType realType))))
(assert (state dummyHeap ZeroMask))
(assert (forall ((arg0@@80 T@U) (arg1@@40 T@U) ) (! (let ((T@@30 (type arg1@@40)))
(= (type (|MultiSet#UnionOne| arg0@@80 arg1@@40)) (MultiSetType T@@30)))
 :qid |funType:MultiSet#UnionOne|
 :pattern ( (|MultiSet#UnionOne| arg0@@80 arg1@@40))
)))
(assert (forall ((a@@8 T@U) (x@@10 T@U) ) (! (let ((T@@31 (type x@@10)))
 (=> (= (type a@@8) (MultiSetType T@@31)) (= (|MultiSet#Card| (|MultiSet#UnionOne| a@@8 x@@10)) (+ (|MultiSet#Card| a@@8) 1))))
 :qid |stdinbpl.737:18|
 :skolemid |113|
 :pattern ( (|MultiSet#Card| (|MultiSet#UnionOne| a@@8 x@@10)))
 :pattern ( (|MultiSet#UnionOne| a@@8 x@@10) (|MultiSet#Card| a@@8))
)))
(assert (forall ((a@@9 T@U) (b@@7 T@U) ) (! (let ((T@@32 (MultiSetTypeInv0 (type a@@9))))
 (=> (and (= (type a@@9) (MultiSetType T@@32)) (= (type b@@7) (MultiSetType T@@32))) (= (|MultiSet#Disjoint| a@@9 b@@7) (forall ((o@@1 T@U) ) (!  (=> (= (type o@@1) T@@32) (or (= (|MultiSet#Select| a@@9 o@@1) 0) (= (|MultiSet#Select| b@@7 o@@1) 0)))
 :qid |stdinbpl.787:39|
 :skolemid |128|
 :pattern ( (|MultiSet#Select| a@@9 o@@1))
 :pattern ( (|MultiSet#Select| b@@7 o@@1))
)))))
 :qid |stdinbpl.786:18|
 :skolemid |129|
 :pattern ( (|MultiSet#Disjoint| a@@9 b@@7))
)))
(assert (forall ((arg_1_1@@1 T@U) (arg_2_1@@1 T@U) (arg_3_1@@1 T@U) (X@@1 T@U) ) (!  (=> (and (and (and (= (type arg_1_1@@1) PyTypeDomainTypeType) (= (type arg_2_1@@1) PyTypeDomainTypeType)) (= (type arg_3_1@@1) PyTypeDomainTypeType)) (= (type X@@1) PyTypeDomainTypeType)) (= (issubtype X@@1 (union_type_3 arg_1_1@@1 arg_2_1@@1 arg_3_1@@1))  (or (issubtype X@@1 arg_1_1@@1) (or (issubtype X@@1 arg_2_1@@1) (issubtype X@@1 arg_3_1@@1)))))
 :qid |stdinbpl.1136:15|
 :skolemid |165|
 :pattern ( (issubtype X@@1 (union_type_3 arg_1_1@@1 arg_2_1@@1 arg_3_1@@1)))
)))
(assert (forall ((arg_1_1@@2 T@U) (arg_2_1@@2 T@U) (arg_3_1@@2 T@U) (arg_4_1@@0 T@U) (X@@2 T@U) ) (!  (=> (and (and (and (and (= (type arg_1_1@@2) PyTypeDomainTypeType) (= (type arg_2_1@@2) PyTypeDomainTypeType)) (= (type arg_3_1@@2) PyTypeDomainTypeType)) (= (type arg_4_1@@0) PyTypeDomainTypeType)) (= (type X@@2) PyTypeDomainTypeType)) (= (issubtype X@@2 (union_type_4 arg_1_1@@2 arg_2_1@@2 arg_3_1@@2 arg_4_1@@0))  (or (issubtype X@@2 arg_1_1@@2) (or (issubtype X@@2 arg_2_1@@2) (or (issubtype X@@2 arg_3_1@@2) (issubtype X@@2 arg_4_1@@0))))))
 :qid |stdinbpl.1142:15|
 :skolemid |166|
 :pattern ( (issubtype X@@2 (union_type_4 arg_1_1@@2 arg_2_1@@2 arg_3_1@@2 arg_4_1@@0)))
)))
(assert (forall ((p T@U) (v_1 T@U) (w T@U) ) (! (let ((A@@3 (FieldTypeInv0 (type p))))
 (=> (and (and (= (type p) (FieldType A@@3 FrameTypeType)) (= (type v_1) FrameTypeType)) (= (type w) FrameTypeType)) (not (InsidePredicate p v_1 p w))))
 :qid |stdinbpl.233:19|
 :skolemid |33|
 :pattern ( (InsidePredicate p v_1 p w))
)))
(assert (forall ((s0 T@U) (s1 T@U) (n@@5 Int) ) (! (let ((T@@33 (SeqTypeInv0 (type s0))))
 (=> (and (= (type s0) (SeqType T@@33)) (= (type s1) (SeqType T@@33))) (=> (and (and (and (not (= s0 (|Seq#Empty| T@@33))) (not (= s1 (|Seq#Empty| T@@33)))) (<= (|Seq#Length| s0) n@@5)) (< n@@5 (|Seq#Length| (|Seq#Append| s0 s1)))) (and (= (|Seq#Add| (|Seq#Sub| n@@5 (|Seq#Length| s0)) (|Seq#Length| s0)) n@@5) (= (|Seq#Index| (|Seq#Append| s0 s1) n@@5) (|Seq#Index| s1 (|Seq#Sub| n@@5 (|Seq#Length| s0))))))))
 :qid |stdinbpl.301:18|
 :skolemid |44|
 :pattern ( (|Seq#Index| (|Seq#Append| s0 s1) n@@5))
)))
(assert (forall ((arg0@@81 T@U) ) (! (let ((T@@34 (type arg0@@81)))
(= (type (|MultiSet#Singleton| arg0@@81)) (MultiSetType T@@34)))
 :qid |funType:MultiSet#Singleton|
 :pattern ( (|MultiSet#Singleton| arg0@@81))
)))
(assert (forall ((r@@0 T@U) ) (!  (and (= (|MultiSet#Card| (|MultiSet#Singleton| r@@0)) 1) (= (|MultiSet#Select| (|MultiSet#Singleton| r@@0) r@@0) 1))
 :qid |stdinbpl.729:18|
 :skolemid |110|
 :pattern ( (|MultiSet#Singleton| r@@0))
)))
(assert  (not (IsPredicateField _val)))
(assert  (not (IsWandField _val)))
(assert  (not (IsPredicateField __container)))
(assert  (not (IsWandField __container)))
(assert  (not (IsPredicateField __iter_index)))
(assert  (not (IsWandField __iter_index)))
(assert  (not (IsPredicateField __previous)))
(assert  (not (IsWandField __previous)))
(assert  (not (IsPredicateField list_acc)))
(assert  (not (IsWandField list_acc)))
(assert  (not (IsPredicateField set_acc)))
(assert  (not (IsWandField set_acc)))
(assert  (not (IsPredicateField dict_acc)))
(assert  (not (IsWandField dict_acc)))
(assert  (not (IsPredicateField Measure$acc)))
(assert  (not (IsWandField Measure$acc)))
(assert  (not (IsPredicateField MustReleaseBounded)))
(assert  (not (IsWandField MustReleaseBounded)))
(assert  (not (IsPredicateField MustReleaseUnbounded)))
(assert  (not (IsWandField MustReleaseUnbounded)))
(assert (forall ((Heap@@26 T@U) (ExhaleHeap@@5 T@U) (Mask@@11 T@U) ) (!  (=> (and (and (and (= (type Heap@@26) (MapType1Type RefType)) (= (type ExhaleHeap@@5) (MapType1Type RefType))) (= (type Mask@@11) (MapType2Type RefType realType))) (IdenticalOnKnownLocations Heap@@26 ExhaleHeap@@5 Mask@@11)) (succHeap Heap@@26 ExhaleHeap@@5))
 :qid |stdinbpl.85:15|
 :skolemid |10|
 :pattern ( (IdenticalOnKnownLocations Heap@@26 ExhaleHeap@@5 Mask@@11))
)))
(assert (forall ((Heap@@27 T@U) (ExhaleHeap@@6 T@U) (Mask@@12 T@U) ) (!  (=> (and (and (and (= (type Heap@@27) (MapType1Type RefType)) (= (type ExhaleHeap@@6) (MapType1Type RefType))) (= (type Mask@@12) (MapType2Type RefType realType))) (IdenticalOnKnownLocationsLiberal Heap@@27 ExhaleHeap@@6 Mask@@12)) (succHeap Heap@@27 ExhaleHeap@@6))
 :qid |stdinbpl.90:15|
 :skolemid |11|
 :pattern ( (IdenticalOnKnownLocationsLiberal Heap@@27 ExhaleHeap@@6 Mask@@12))
)))
(assert (forall ((__ss1@@0 T@U) ) (! (let ((T$@@2 (SeqTypeInv0 (type __ss1@@0))))
 (=> (= (type __ss1@@0) (SeqType T$@@2)) (= (|MultiSet#Card| (__toMS __ss1@@0)) (|Seq#Length| __ss1@@0))))
 :qid |stdinbpl.1425:20|
 :skolemid |197|
 :pattern ( (__toMS __ss1@@0))
)))
(assert (forall ((m@@13 T@U) (|m'| T@U) ) (! (let ((V@@5 (MapTypeInv1 (type m@@13))))
(let ((U@@5 (MapTypeInv0 (type m@@13))))
 (=> (and (and (= (type m@@13) (MapType U@@5 V@@5)) (= (type |m'|) (MapType U@@5 V@@5))) (|Map#Disjoint| m@@13 |m'|)) (forall ((o@@2 T@U) ) (!  (=> (= (type o@@2) U@@5) (or (not (U_2_bool (MapType0Select (|Map#Domain| m@@13) o@@2))) (not (U_2_bool (MapType0Select (|Map#Domain| |m'|) o@@2)))))
 :qid |stdinbpl.887:37|
 :skolemid |147|
 :pattern ( (MapType0Select (|Map#Domain| m@@13) o@@2))
 :pattern ( (MapType0Select (|Map#Domain| |m'|) o@@2))
)))))
 :qid |stdinbpl.885:21|
 :skolemid |148|
 :pattern ( (|Map#Disjoint| m@@13 |m'|))
)))
(assert (forall ((__t T@U) ) (! (|MultiSet#Equal| (__toMS (|Seq#Singleton| __t)) (|MultiSet#Singleton| __t))
 :qid |stdinbpl.1413:20|
 :skolemid |195|
 :pattern ( (__toMS (|Seq#Singleton| __t)))
)))
(assert (forall ((U@@6 T@T) (V@@6 T@T) ) (! (= (type (|Map#Empty| U@@6 V@@6)) (MapType U@@6 V@@6))
 :qid |funType:Map#Empty|
 :pattern ( (|Map#Empty| U@@6 V@@6))
)))
(assert (forall ((u@@2 T@U) (V@@7 T@T) ) (! (let ((U@@7 (type u@@2)))
 (not (U_2_bool (MapType0Select (|Map#Domain| (|Map#Empty| U@@7 V@@7)) u@@2))))
 :qid |stdinbpl.844:21|
 :skolemid |136|
 :pattern ( (let ((U@@7 (type u@@2)))
(MapType0Select (|Map#Domain| (|Map#Empty| U@@7 V@@7)) u@@2)))
)))
(assert (forall ((a@@10 T@U) (b@@8 T@U) ) (! (let ((T@@35 (MapType0TypeInv0 (type a@@10))))
 (=> (and (= (type a@@10) (MapType0Type T@@35 boolType)) (= (type b@@8) (MapType0Type T@@35 boolType))) (= (|Set#Equal| a@@10 b@@8) (forall ((o@@3 T@U) ) (!  (=> (= (type o@@3) T@@35) (= (U_2_bool (MapType0Select a@@10 o@@3)) (U_2_bool (MapType0Select b@@8 o@@3))))
 :qid |stdinbpl.682:31|
 :skolemid |96|
 :pattern ( (MapType0Select a@@10 o@@3))
 :pattern ( (MapType0Select b@@8 o@@3))
)))))
 :qid |stdinbpl.681:17|
 :skolemid |97|
 :pattern ( (|Set#Equal| a@@10 b@@8))
)))
(assert (forall ((ResultMask T@U) (SummandMask1 T@U) (SummandMask2 T@U) (o_3 T@U) (f_5 T@U) ) (! (let ((B@@3 (FieldTypeInv1 (type f_5))))
(let ((A@@4 (FieldTypeInv0 (type f_5))))
 (=> (and (and (and (and (and (= (type ResultMask) (MapType2Type RefType realType)) (= (type SummandMask1) (MapType2Type RefType realType))) (= (type SummandMask2) (MapType2Type RefType realType))) (= (type o_3) RefType)) (= (type f_5) (FieldType A@@4 B@@3))) (sumMask ResultMask SummandMask1 SummandMask2)) (= (U_2_real (MapType2Select ResultMask o_3 f_5)) (+ (U_2_real (MapType2Select SummandMask1 o_3 f_5)) (U_2_real (MapType2Select SummandMask2 o_3 f_5)))))))
 :qid |stdinbpl.195:22|
 :skolemid |30|
 :pattern ( (sumMask ResultMask SummandMask1 SummandMask2) (MapType2Select ResultMask o_3 f_5))
 :pattern ( (sumMask ResultMask SummandMask1 SummandMask2) (MapType2Select SummandMask1 o_3 f_5))
 :pattern ( (sumMask ResultMask SummandMask1 SummandMask2) (MapType2Select SummandMask2 o_3 f_5))
)))
(assert (forall ((a@@11 T@U) (b@@9 T@U) ) (! (let ((T@@36 (MultiSetTypeInv0 (type a@@11))))
 (=> (and (= (type a@@11) (MultiSetType T@@36)) (= (type b@@9) (MultiSetType T@@36))) (= (|MultiSet#Card| (|MultiSet#Union| a@@11 b@@9)) (+ (|MultiSet#Card| a@@11) (|MultiSet#Card| b@@9)))))
 :qid |stdinbpl.747:18|
 :skolemid |116|
 :pattern ( (|MultiSet#Card| (|MultiSet#Union| a@@11 b@@9)))
 :pattern ( (|MultiSet#Card| a@@11) (|MultiSet#Union| a@@11 b@@9))
 :pattern ( (|MultiSet#Card| b@@9) (|MultiSet#Union| a@@11 b@@9))
)))
(assert (forall ((n_1@@1 T@U) ) (!  (=> (and (= (type n_1@@1) _NameDomainTypeType) (_is_single n_1@@1)) (= n_1@@1 (_single (_get_value n_1@@1))))
 :qid |stdinbpl.1468:15|
 :skolemid |199|
 :pattern ( (_get_value n_1@@1))
)))
(assert (forall ((arg0@@82 Real) (arg1@@41 T@U) ) (! (= (type (ConditionalFrame arg0@@82 arg1@@41)) FrameTypeType)
 :qid |funType:ConditionalFrame|
 :pattern ( (ConditionalFrame arg0@@82 arg1@@41))
)))
(assert (forall ((p@@0 Real) (f_7 T@U) ) (!  (=> (= (type f_7) FrameTypeType) (= (ConditionalFrame p@@0 f_7) (ite (> p@@0 0.0) f_7 EmptyFrame)))
 :qid |stdinbpl.221:15|
 :skolemid |31|
 :pattern ( (ConditionalFrame p@@0 f_7))
)))
(assert (forall ((q@min@@0 Int) (q@max@@0 Int) (j@@3 Int) ) (!  (=> (and (<= 0 j@@3) (< j@@3 (- q@max@@0 q@min@@0))) (= (U_2_int (|Seq#Index| (|Seq#Range| q@min@@0 q@max@@0) j@@3)) (+ q@min@@0 j@@3)))
 :qid |stdinbpl.592:15|
 :skolemid |68|
 :pattern ( (|Seq#Index| (|Seq#Range| q@min@@0 q@max@@0) j@@3))
)))
(assert (forall ((arg0@@83 T@U) (arg1@@42 Int) ) (! (= (type (dict_arg arg0@@83 arg1@@42)) PyTypeDomainTypeType)
 :qid |funType:dict_arg|
 :pattern ( (dict_arg arg0@@83 arg1@@42))
)))
(assert (forall ((Z T@U) (arg0_1 T@U) (arg1_1 T@U) ) (!  (=> (and (and (and (= (type Z) PyTypeDomainTypeType) (= (type arg0_1) PyTypeDomainTypeType)) (= (type arg1_1) PyTypeDomainTypeType)) (issubtype Z (dict arg0_1 arg1_1))) (= (dict_arg Z 0) arg0_1))
 :qid |stdinbpl.1202:15|
 :skolemid |176|
 :pattern ( (dict arg0_1 arg1_1) (dict_arg Z 0))
)))
(assert (forall ((Z@@0 T@U) (arg0_1@@0 T@U) (arg1_1@@0 T@U) ) (!  (=> (and (and (and (= (type Z@@0) PyTypeDomainTypeType) (= (type arg0_1@@0) PyTypeDomainTypeType)) (= (type arg1_1@@0) PyTypeDomainTypeType)) (issubtype Z@@0 (dict arg0_1@@0 arg1_1@@0))) (= (dict_arg Z@@0 1) arg1_1@@0))
 :qid |stdinbpl.1208:15|
 :skolemid |177|
 :pattern ( (dict arg0_1@@0 arg1_1@@0) (dict_arg Z@@0 1))
)))
(assert (forall ((Mask@@13 T@U) (o_3@@0 T@U) (f_5@@0 T@U) ) (! (let ((B@@4 (FieldTypeInv1 (type f_5@@0))))
(let ((A@@5 (FieldTypeInv0 (type f_5@@0))))
 (=> (and (and (= (type Mask@@13) (MapType2Type RefType realType)) (= (type o_3@@0) RefType)) (= (type f_5@@0) (FieldType A@@5 B@@4))) (= (HasDirectPerm Mask@@13 o_3@@0 f_5@@0) (> (U_2_real (MapType2Select Mask@@13 o_3@@0 f_5@@0)) NoPerm)))))
 :qid |stdinbpl.190:22|
 :skolemid |29|
 :pattern ( (HasDirectPerm Mask@@13 o_3@@0 f_5@@0))
)))
(assert (forall ((s0@@0 T@U) (s1@@0 T@U) ) (! (let ((T@@37 (SeqTypeInv0 (type s0@@0))))
 (=> (and (and (= (type s0@@0) (SeqType T@@37)) (= (type s1@@0) (SeqType T@@37))) (and (not (= s0@@0 (|Seq#Empty| T@@37))) (not (= s1@@0 (|Seq#Empty| T@@37))))) (= (|Seq#Length| (|Seq#Append| s0@@0 s1@@0)) (+ (|Seq#Length| s0@@0) (|Seq#Length| s1@@0)))))
 :qid |stdinbpl.270:18|
 :skolemid |38|
 :pattern ( (|Seq#Length| (|Seq#Append| s0@@0 s1@@0)))
)))
(assert  (and (forall ((arg0@@84 T@U) ) (! (= (type (list arg0@@84)) PyTypeDomainTypeType)
 :qid |funType:list|
 :pattern ( (list arg0@@84))
)) (forall ((arg0@@85 T@U) (arg1@@43 Int) ) (! (= (type (list_arg arg0@@85 arg1@@43)) PyTypeDomainTypeType)
 :qid |funType:list_arg|
 :pattern ( (list_arg arg0@@85 arg1@@43))
))))
(assert (forall ((Z@@1 T@U) (arg0_1@@1 T@U) ) (!  (=> (and (and (= (type Z@@1) PyTypeDomainTypeType) (= (type arg0_1@@1) PyTypeDomainTypeType)) (issubtype Z@@1 (list arg0_1@@1))) (= (list_arg Z@@1 0) arg0_1@@1))
 :qid |stdinbpl.1178:15|
 :skolemid |172|
 :pattern ( (list arg0_1@@1) (list_arg Z@@1 0))
)))
(assert  (and (forall ((arg0@@86 T@U) ) (! (= (type (set arg0@@86)) PyTypeDomainTypeType)
 :qid |funType:set|
 :pattern ( (set arg0@@86))
)) (forall ((arg0@@87 T@U) (arg1@@44 Int) ) (! (= (type (set_arg arg0@@87 arg1@@44)) PyTypeDomainTypeType)
 :qid |funType:set_arg|
 :pattern ( (set_arg arg0@@87 arg1@@44))
))))
(assert (forall ((Z@@2 T@U) (arg0_1@@2 T@U) ) (!  (=> (and (and (= (type Z@@2) PyTypeDomainTypeType) (= (type arg0_1@@2) PyTypeDomainTypeType)) (issubtype Z@@2 (set arg0_1@@2))) (= (set_arg Z@@2 0) arg0_1@@2))
 :qid |stdinbpl.1190:15|
 :skolemid |174|
 :pattern ( (set arg0_1@@2) (set_arg Z@@2 0))
)))
(assert  (and (forall ((arg0@@88 T@U) ) (! (= (type (PSeq arg0@@88)) PyTypeDomainTypeType)
 :qid |funType:PSeq|
 :pattern ( (PSeq arg0@@88))
)) (forall ((arg0@@89 T@U) (arg1@@45 Int) ) (! (= (type (PSeq_arg arg0@@89 arg1@@45)) PyTypeDomainTypeType)
 :qid |funType:PSeq_arg|
 :pattern ( (PSeq_arg arg0@@89 arg1@@45))
))))
(assert (forall ((Z@@3 T@U) (arg0_1@@3 T@U) ) (!  (=> (and (and (= (type Z@@3) PyTypeDomainTypeType) (= (type arg0_1@@3) PyTypeDomainTypeType)) (issubtype Z@@3 (PSeq arg0_1@@3))) (= (PSeq_arg Z@@3 0) arg0_1@@3))
 :qid |stdinbpl.1256:15|
 :skolemid |181|
 :pattern ( (PSeq arg0_1@@3) (PSeq_arg Z@@3 0))
)))
(assert  (and (forall ((arg0@@90 T@U) ) (! (= (type (PSet arg0@@90)) PyTypeDomainTypeType)
 :qid |funType:PSet|
 :pattern ( (PSet arg0@@90))
)) (forall ((arg0@@91 T@U) (arg1@@46 Int) ) (! (= (type (PSet_arg arg0@@91 arg1@@46)) PyTypeDomainTypeType)
 :qid |funType:PSet_arg|
 :pattern ( (PSet_arg arg0@@91 arg1@@46))
))))
(assert (forall ((Z@@4 T@U) (arg0_1@@4 T@U) ) (!  (=> (and (and (= (type Z@@4) PyTypeDomainTypeType) (= (type arg0_1@@4) PyTypeDomainTypeType)) (issubtype Z@@4 (PSet arg0_1@@4))) (= (PSet_arg Z@@4 0) arg0_1@@4))
 :qid |stdinbpl.1268:15|
 :skolemid |183|
 :pattern ( (PSet arg0_1@@4) (PSet_arg Z@@4 0))
)))
(assert  (and (forall ((arg0@@92 T@U) ) (! (= (type (PMultiset arg0@@92)) PyTypeDomainTypeType)
 :qid |funType:PMultiset|
 :pattern ( (PMultiset arg0@@92))
)) (forall ((arg0@@93 T@U) (arg1@@47 Int) ) (! (= (type (PMultiset_arg arg0@@93 arg1@@47)) PyTypeDomainTypeType)
 :qid |funType:PMultiset_arg|
 :pattern ( (PMultiset_arg arg0@@93 arg1@@47))
))))
(assert (forall ((Z@@5 T@U) (arg0_1@@5 T@U) ) (!  (=> (and (and (= (type Z@@5) PyTypeDomainTypeType) (= (type arg0_1@@5) PyTypeDomainTypeType)) (issubtype Z@@5 (PMultiset arg0_1@@5))) (= (PMultiset_arg Z@@5 0) arg0_1@@5))
 :qid |stdinbpl.1280:15|
 :skolemid |185|
 :pattern ( (PMultiset arg0_1@@5) (PMultiset_arg Z@@5 0))
)))
(assert  (and (forall ((arg0@@94 T@U) ) (! (= (type (Iterator arg0@@94)) PyTypeDomainTypeType)
 :qid |funType:Iterator|
 :pattern ( (Iterator arg0@@94))
)) (forall ((arg0@@95 T@U) (arg1@@48 Int) ) (! (= (type (Iterator_arg arg0@@95 arg1@@48)) PyTypeDomainTypeType)
 :qid |funType:Iterator_arg|
 :pattern ( (Iterator_arg arg0@@95 arg1@@48))
))))
(assert (forall ((Z@@6 T@U) (arg0_1@@6 T@U) ) (!  (=> (and (and (= (type Z@@6) PyTypeDomainTypeType) (= (type arg0_1@@6) PyTypeDomainTypeType)) (issubtype Z@@6 (Iterator arg0_1@@6))) (= (Iterator_arg Z@@6 0) arg0_1@@6))
 :qid |stdinbpl.1298:15|
 :skolemid |187|
 :pattern ( (Iterator arg0_1@@6) (Iterator_arg Z@@6 0))
)))
(assert (forall ((m@@14 T@U) (u@@3 T@U) ) (! (let ((V@@8 (MapTypeInv1 (type m@@14))))
(let ((U@@8 (type u@@3)))
 (=> (and (= (type m@@14) (MapType U@@8 V@@8)) (U_2_bool (MapType0Select (|Map#Domain| m@@14) u@@3))) (U_2_bool (MapType0Select (|Map#Values| m@@14) (MapType0Select (|Map#Elements| m@@14) u@@3))))))
 :qid |stdinbpl.831:20|
 :skolemid |134|
 :pattern ( (MapType0Select (|Map#Elements| m@@14) u@@3))
)))
(assert (forall ((s@@6 T@U) (t T@U) (n@@6 Int) ) (! (let ((T@@38 (SeqTypeInv0 (type s@@6))))
 (=> (and (and (= (type s@@6) (SeqType T@@38)) (= (type t) (SeqType T@@38))) (and (> n@@6 0) (> n@@6 (|Seq#Length| s@@6)))) (and (= (|Seq#Add| (|Seq#Sub| n@@6 (|Seq#Length| s@@6)) (|Seq#Length| s@@6)) n@@6) (= (|Seq#Drop| (|Seq#Append| s@@6 t) n@@6) (|Seq#Drop| t (|Seq#Sub| n@@6 (|Seq#Length| s@@6)))))))
 :qid |stdinbpl.426:18|
 :skolemid |56|
 :pattern ( (|Seq#Drop| (|Seq#Append| s@@6 t) n@@6))
)))
(assert (forall ((arg0@@96 T@U) ) (! (= (type (tuple arg0@@96)) PyTypeDomainTypeType)
 :qid |funType:tuple|
 :pattern ( (tuple arg0@@96))
)))
(assert (forall ((seq1 T@U) (seq2 T@U) ) (!  (=> (and (and (= (type seq1) (SeqType PyTypeDomainTypeType)) (= (type seq2) (SeqType PyTypeDomainTypeType))) (and (not (|Seq#Equal| seq1 seq2)) (and (= (|Seq#Length| seq1) (|Seq#Length| seq2)) (forall ((i@@3 Int) ) (!  (=> (and (>= i@@3 0) (< i@@3 (|Seq#Length| seq1))) (issubtype (|Seq#Index| seq1 i@@3) (|Seq#Index| seq2 i@@3)))
 :qid |stdinbpl.1117:78|
 :skolemid |161|
 :pattern ( (issubtype (|Seq#Index| seq1 i@@3) (|Seq#Index| seq2 i@@3)))
))))) (issubtype (tuple seq1) (tuple seq2)))
 :qid |stdinbpl.1115:15|
 :skolemid |162|
 :pattern ( (|Seq#Length| seq1) (|Seq#Length| seq2))
 :pattern ( (|Seq#Length| seq1) (tuple seq2))
 :pattern ( (|Seq#Length| seq1) (issubtype (tuple seq1) (tuple seq2)))
 :pattern ( (|Seq#Length| seq2) (|Seq#Length| seq1))
 :pattern ( (|Seq#Length| seq2) (tuple seq1))
 :pattern ( (|Seq#Length| seq2) (issubtype (tuple seq1) (tuple seq2)))
 :pattern ( (issubtype (tuple seq1) (tuple seq2)))
)))
(assert (forall ((n1_1@@0 T@U) (n2_1@@0 T@U) ) (!  (=> (and (= (type n1_1@@0) _NameDomainTypeType) (= (type n2_1@@0) _NameDomainTypeType)) (and (= (_get_combined_prefix (_combine n1_1@@0 n2_1@@0)) n1_1@@0) (= (_get_combined_name (_combine n1_1@@0 n2_1@@0)) n2_1@@0)))
 :qid |stdinbpl.1480:15|
 :skolemid |201|
 :pattern ( (_combine n1_1@@0 n2_1@@0))
)))
(assert (forall ((arg0@@97 T@U) ) (! (= (type (union_type_1 arg0@@97)) PyTypeDomainTypeType)
 :qid |funType:union_type_1|
 :pattern ( (union_type_1 arg0@@97))
)))
(assert (forall ((arg_1_1@@3 T@U) (X@@3 T@U) ) (!  (=> (and (= (type arg_1_1@@3) PyTypeDomainTypeType) (= (type X@@3) PyTypeDomainTypeType)) (= (issubtype (union_type_1 arg_1_1@@3) X@@3) (issubtype arg_1_1@@3 X@@3)))
 :qid |stdinbpl.1148:15|
 :skolemid |167|
 :pattern ( (issubtype (union_type_1 arg_1_1@@3) X@@3))
)))
(assert (forall ((o_3@@1 T@U) (f_5@@1 T@U) ) (! (let ((B@@5 (FieldTypeInv1 (type f_5@@1))))
(let ((A@@6 (FieldTypeInv0 (type f_5@@1))))
 (=> (and (= (type o_3@@1) RefType) (= (type f_5@@1) (FieldType A@@6 B@@5))) (= (U_2_real (MapType2Select ZeroMask o_3@@1 f_5@@1)) NoPerm))))
 :qid |stdinbpl.163:22|
 :skolemid |25|
 :pattern ( (MapType2Select ZeroMask o_3@@1 f_5@@1))
)))
(assert (forall ((a@@12 T@U) (b@@10 T@U) (o@@4 T@U) ) (! (let ((T@@39 (type o@@4)))
 (=> (and (= (type a@@12) (MapType0Type T@@39 boolType)) (= (type b@@10) (MapType0Type T@@39 boolType))) (= (U_2_bool (MapType0Select (|Set#Intersection| a@@12 b@@10) o@@4))  (and (U_2_bool (MapType0Select a@@12 o@@4)) (U_2_bool (MapType0Select b@@10 o@@4))))))
 :qid |stdinbpl.646:18|
 :skolemid |85|
 :pattern ( (MapType0Select (|Set#Intersection| a@@12 b@@10) o@@4))
 :pattern ( (|Set#Intersection| a@@12 b@@10) (MapType0Select a@@12 o@@4))
 :pattern ( (|Set#Intersection| a@@12 b@@10) (MapType0Select b@@10 o@@4))
)))
(assert (forall ((s@@7 T@U) (t@@0 T@U) (n@@7 Int) ) (! (let ((T@@40 (SeqTypeInv0 (type s@@7))))
 (=> (and (and (= (type s@@7) (SeqType T@@40)) (= (type t@@0) (SeqType T@@40))) (and (> n@@7 0) (> n@@7 (|Seq#Length| s@@7)))) (and (= (|Seq#Add| (|Seq#Sub| n@@7 (|Seq#Length| s@@7)) (|Seq#Length| s@@7)) n@@7) (= (|Seq#Take| (|Seq#Append| s@@7 t@@0) n@@7) (|Seq#Append| s@@7 (|Seq#Take| t@@0 (|Seq#Sub| n@@7 (|Seq#Length| s@@7))))))))
 :qid |stdinbpl.413:18|
 :skolemid |54|
 :pattern ( (|Seq#Take| (|Seq#Append| s@@7 t@@0) n@@7))
)))
(assert (forall ((Heap@@28 T@U) (Heap1@@1 T@U) (Mask1 T@U) (Heap2@@0 T@U) (Mask2 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@28) (MapType1Type RefType)) (= (type Heap1@@1) (MapType1Type RefType))) (= (type Mask1) (MapType2Type RefType realType))) (= (type Heap2@@0) (MapType1Type RefType))) (= (type Mask2) (MapType2Type RefType realType))) (= (SumHeap Heap@@28 Heap1@@1 Mask1 Heap2@@0 Mask2)  (and (IdenticalOnKnownLocationsLiberal Heap1@@1 Heap@@28 Mask1) (IdenticalOnKnownLocationsLiberal Heap2@@0 Heap@@28 Mask2))))
 :qid |stdinbpl.150:15|
 :skolemid |24|
 :pattern ( (SumHeap Heap@@28 Heap1@@1 Mask1 Heap2@@0 Mask2))
)))
(assert (forall ((q@min@@1 Int) (q@max@@1 Int) ) (!  (and (=> (< q@min@@1 q@max@@1) (= (|Seq#Length| (|Seq#Range| q@min@@1 q@max@@1)) (- q@max@@1 q@min@@1))) (=> (<= q@max@@1 q@min@@1) (= (|Seq#Length| (|Seq#Range| q@min@@1 q@max@@1)) 0)))
 :qid |stdinbpl.591:15|
 :skolemid |67|
 :pattern ( (|Seq#Length| (|Seq#Range| q@min@@1 q@max@@1)))
)))
(assert (forall ((arg0@@98 T@U) (arg1@@49 T@U) ) (! (= (type (union_type_2 arg0@@98 arg1@@49)) PyTypeDomainTypeType)
 :qid |funType:union_type_2|
 :pattern ( (union_type_2 arg0@@98 arg1@@49))
)))
(assert (forall ((arg_1_1@@4 T@U) (arg_2_1@@3 T@U) (X@@4 T@U) ) (!  (=> (and (and (= (type arg_1_1@@4) PyTypeDomainTypeType) (= (type arg_2_1@@3) PyTypeDomainTypeType)) (= (type X@@4) PyTypeDomainTypeType)) (= (issubtype (union_type_2 arg_1_1@@4 arg_2_1@@3) X@@4)  (and (issubtype arg_1_1@@4 X@@4) (issubtype arg_2_1@@3 X@@4))))
 :qid |stdinbpl.1154:15|
 :skolemid |168|
 :pattern ( (issubtype (union_type_2 arg_1_1@@4 arg_2_1@@3) X@@4))
)))
(assert (forall ((arg0@@99 T@U) (arg1@@50 T@U) ) (! (let ((T@@41 (MapType0TypeInv0 (type arg0@@99))))
(= (type (|Set#Difference| arg0@@99 arg1@@50)) (MapType0Type T@@41 boolType)))
 :qid |funType:Set#Difference|
 :pattern ( (|Set#Difference| arg0@@99 arg1@@50))
)))
(assert (forall ((a@@13 T@U) (b@@11 T@U) (o@@5 T@U) ) (! (let ((T@@42 (type o@@5)))
 (=> (and (= (type a@@13) (MapType0Type T@@42 boolType)) (= (type b@@11) (MapType0Type T@@42 boolType))) (= (U_2_bool (MapType0Select (|Set#Difference| a@@13 b@@11) o@@5))  (and (U_2_bool (MapType0Select a@@13 o@@5)) (not (U_2_bool (MapType0Select b@@11 o@@5)))))))
 :qid |stdinbpl.661:18|
 :skolemid |91|
 :pattern ( (MapType0Select (|Set#Difference| a@@13 b@@11) o@@5))
 :pattern ( (|Set#Difference| a@@13 b@@11) (MapType0Select a@@13 o@@5))
)))
(assert (forall ((m@@15 T@U) (u@@4 T@U) ) (! (let ((V@@9 (MapTypeInv1 (type m@@15))))
(let ((U@@9 (type u@@4)))
 (=> (and (= (type m@@15) (MapType U@@9 V@@9)) (U_2_bool (MapType0Select (|Map#Domain| m@@15) u@@4))) (> (|Set#Card| (|Map#Values| m@@15)) 0))))
 :qid |stdinbpl.837:20|
 :skolemid |135|
 :pattern ( (MapType0Select (|Map#Domain| m@@15) u@@4))
 :pattern ( (MapType0Select (|Map#Elements| m@@15) u@@4))
)))
(assert (forall ((a@@14 T@U) (b@@12 T@U) ) (! (let ((T@@43 (SeqTypeInv0 (type a@@14))))
 (=> (and (and (= (type a@@14) (SeqType T@@43)) (= (type b@@12) (SeqType T@@43))) (|Seq#Equal| a@@14 b@@12)) (= a@@14 b@@12)))
 :qid |stdinbpl.564:18|
 :skolemid |65|
 :pattern ( (|Seq#Equal| a@@14 b@@12))
)))
(assert (forall ((a@@15 T@U) (b@@13 T@U) ) (! (let ((T@@44 (MapType0TypeInv0 (type a@@15))))
 (=> (and (and (= (type a@@15) (MapType0Type T@@44 boolType)) (= (type b@@13) (MapType0Type T@@44 boolType))) (|Set#Equal| a@@15 b@@13)) (= a@@15 b@@13)))
 :qid |stdinbpl.683:17|
 :skolemid |98|
 :pattern ( (|Set#Equal| a@@15 b@@13))
)))
(assert (forall ((a@@16 T@U) (b@@14 T@U) ) (! (let ((T@@45 (MultiSetTypeInv0 (type a@@16))))
 (=> (and (and (= (type a@@16) (MultiSetType T@@45)) (= (type b@@14) (MultiSetType T@@45))) (|MultiSet#Equal| a@@16 b@@14)) (= a@@16 b@@14)))
 :qid |stdinbpl.782:17|
 :skolemid |127|
 :pattern ( (|MultiSet#Equal| a@@16 b@@14))
)))
(assert (forall ((m@@16 T@U) (|m'@@0| T@U) ) (! (let ((V@@10 (MapTypeInv1 (type m@@16))))
(let ((U@@10 (MapTypeInv0 (type m@@16))))
 (=> (and (and (= (type m@@16) (MapType U@@10 V@@10)) (= (type |m'@@0|) (MapType U@@10 V@@10))) (|Map#Equal| m@@16 |m'@@0|)) (= m@@16 |m'@@0|))))
 :qid |stdinbpl.879:21|
 :skolemid |146|
 :pattern ( (|Map#Equal| m@@16 |m'@@0|))
)))
(assert (forall ((arg0@@100 T@U) (arg1@@51 T@U) ) (! (let ((T@@46 (type arg1@@51)))
(= (type (|Set#UnionOne| arg0@@100 arg1@@51)) (MapType0Type T@@46 boolType)))
 :qid |funType:Set#UnionOne|
 :pattern ( (|Set#UnionOne| arg0@@100 arg1@@51))
)))
(assert (forall ((a@@17 T@U) (x@@11 T@U) (y@@3 T@U) ) (! (let ((T@@47 (type x@@11)))
 (=> (and (and (= (type a@@17) (MapType0Type T@@47 boolType)) (= (type y@@3) T@@47)) (U_2_bool (MapType0Select a@@17 y@@3))) (U_2_bool (MapType0Select (|Set#UnionOne| a@@17 x@@11) y@@3))))
 :qid |stdinbpl.626:18|
 :skolemid |79|
 :pattern ( (|Set#UnionOne| a@@17 x@@11) (MapType0Select a@@17 y@@3))
)))
(assert (forall ((a@@18 T@U) (b@@15 T@U) (y@@4 T@U) ) (! (let ((T@@48 (type y@@4)))
 (=> (and (and (= (type a@@18) (MapType0Type T@@48 boolType)) (= (type b@@15) (MapType0Type T@@48 boolType))) (U_2_bool (MapType0Select a@@18 y@@4))) (U_2_bool (MapType0Select (|Set#Union| a@@18 b@@15) y@@4))))
 :qid |stdinbpl.636:18|
 :skolemid |83|
 :pattern ( (|Set#Union| a@@18 b@@15) (MapType0Select a@@18 y@@4))
)))
(assert (forall ((a@@19 T@U) (b@@16 T@U) (y@@5 T@U) ) (! (let ((T@@49 (type y@@5)))
 (=> (and (and (= (type a@@19) (MapType0Type T@@49 boolType)) (= (type b@@16) (MapType0Type T@@49 boolType))) (U_2_bool (MapType0Select b@@16 y@@5))) (U_2_bool (MapType0Select (|Set#Union| a@@19 b@@16) y@@5))))
 :qid |stdinbpl.638:18|
 :skolemid |84|
 :pattern ( (|Set#Union| a@@19 b@@16) (MapType0Select b@@16 y@@5))
)))
(assert (forall ((int1@@0 T@U) ) (!  (=> (and (= (type int1@@0) intType) (>= (U_2_int int1@@0) 0)) (bounded int1@@0))
 :qid |stdinbpl.1523:15|
 :skolemid |207|
 :pattern ( (bounded int1@@0))
)))
(assert (forall ((sub_1 T@U) (sub2 T@U) ) (!  (=> (and (and (= (type sub_1) PyTypeDomainTypeType) (= (type sub2) PyTypeDomainTypeType)) (extends_ sub_1 sub2)) (issubtype sub_1 sub2))
 :qid |stdinbpl.1067:15|
 :skolemid |153|
 :pattern ( (extends_ sub_1 sub2))
)))
(assert (forall ((ms T@U) (x@@12 T@U) ) (! (let ((T@@50 (type x@@12)))
 (=> (= (type ms) (MultiSetType T@@50)) (>= (|MultiSet#Select| ms x@@12) 0)))
 :qid |stdinbpl.713:18|
 :skolemid |104|
 :pattern ( (|MultiSet#Select| ms x@@12))
)))
(assert (forall ((a@@20 T@U) (x@@13 T@U) (o@@6 T@U) ) (! (let ((T@@51 (type x@@13)))
 (=> (and (= (type a@@20) (MapType0Type T@@51 boolType)) (= (type o@@6) T@@51)) (= (U_2_bool (MapType0Select (|Set#UnionOne| a@@20 x@@13) o@@6))  (or (= o@@6 x@@13) (U_2_bool (MapType0Select a@@20 o@@6))))))
 :qid |stdinbpl.622:18|
 :skolemid |77|
 :pattern ( (MapType0Select (|Set#UnionOne| a@@20 x@@13) o@@6))
)))
(assert (forall ((a@@21 T@U) (b@@17 T@U) (y@@6 T@U) ) (! (let ((T@@52 (type y@@6)))
 (=> (and (and (= (type a@@21) (MapType0Type T@@52 boolType)) (= (type b@@17) (MapType0Type T@@52 boolType))) (U_2_bool (MapType0Select b@@17 y@@6))) (not (U_2_bool (MapType0Select (|Set#Difference| a@@21 b@@17) y@@6)))))
 :qid |stdinbpl.663:18|
 :skolemid |92|
 :pattern ( (|Set#Difference| a@@21 b@@17) (MapType0Select b@@17 y@@6))
)))
(assert (forall ((Heap@@29 T@U) (Mask@@14 T@U) (id@@4 Int) ) (!  (=> (and (and (= (type Heap@@29) (MapType1Type RefType)) (= (type Mask@@14) (MapType2Type RefType realType))) (state Heap@@29 Mask@@14)) (= (|_isDefined'| Heap@@29 id@@4) (|_isDefined#frame| EmptyFrame id@@4)))
 :qid |stdinbpl.1594:15|
 :skolemid |210|
 :pattern ( (state Heap@@29 Mask@@14) (|_isDefined'| Heap@@29 id@@4))
)))
(assert (forall ((Heap@@30 T@U) (Mask@@15 T@U) (box@@4 T@U) ) (!  (=> (and (and (and (= (type Heap@@30) (MapType1Type RefType)) (= (type Mask@@15) (MapType2Type RefType realType))) (= (type box@@4) RefType)) (state Heap@@30 Mask@@15)) (= (|bool___unbox__'| Heap@@30 box@@4) (|bool___unbox__#frame| EmptyFrame box@@4)))
 :qid |stdinbpl.1871:15|
 :skolemid |229|
 :pattern ( (state Heap@@30 Mask@@15) (|bool___unbox__'| Heap@@30 box@@4))
)))
(assert (forall ((m@@17 T@U) (|m'@@1| T@U) ) (! (let ((V@@11 (MapTypeInv1 (type m@@17))))
(let ((U@@11 (MapTypeInv0 (type m@@17))))
 (=> (and (and (= (type m@@17) (MapType U@@11 V@@11)) (= (type |m'@@1|) (MapType U@@11 V@@11))) (and (forall ((u@@5 T@U) ) (!  (=> (= (type u@@5) U@@11) (= (U_2_bool (MapType0Select (|Map#Domain| m@@17) u@@5)) (U_2_bool (MapType0Select (|Map#Domain| |m'@@1|) u@@5))))
 :qid |stdinbpl.876:12|
 :skolemid |143|
 :no-pattern (type u@@5)
 :no-pattern (U_2_int u@@5)
 :no-pattern (U_2_bool u@@5)
)) (forall ((u@@6 T@U) ) (!  (=> (and (= (type u@@6) U@@11) (U_2_bool (MapType0Select (|Map#Domain| m@@17) u@@6))) (= (MapType0Select (|Map#Elements| m@@17) u@@6) (MapType0Select (|Map#Elements| |m'@@1|) u@@6)))
 :qid |stdinbpl.877:14|
 :skolemid |144|
 :no-pattern (type u@@6)
 :no-pattern (U_2_int u@@6)
 :no-pattern (U_2_bool u@@6)
)))) (|Map#Equal| m@@17 |m'@@1|))))
 :qid |stdinbpl.874:21|
 :skolemid |145|
 :pattern ( (|Map#Equal| m@@17 |m'@@1|))
)))
(assert (forall ((s@@8 T@U) (i@@4 Int) ) (! (let ((T@@53 (SeqTypeInv0 (type s@@8))))
 (=> (= (type s@@8) (SeqType T@@53)) (=> (and (<= 0 i@@4) (< i@@4 (|Seq#Length| s@@8))) (|Seq#ContainsTrigger| s@@8 (|Seq#Index| s@@8 i@@4)))))
 :qid |stdinbpl.457:18|
 :skolemid |61|
 :pattern ( (|Seq#Index| s@@8 i@@4))
)))
(assert (forall ((a@@22 T@U) (b@@18 T@U) ) (! (let ((T@@54 (MapType0TypeInv0 (type a@@22))))
 (=> (and (= (type a@@22) (MapType0Type T@@54 boolType)) (= (type b@@18) (MapType0Type T@@54 boolType))) (and (= (+ (+ (|Set#Card| (|Set#Difference| a@@22 b@@18)) (|Set#Card| (|Set#Difference| b@@18 a@@22))) (|Set#Card| (|Set#Intersection| a@@22 b@@18))) (|Set#Card| (|Set#Union| a@@22 b@@18))) (= (|Set#Card| (|Set#Difference| a@@22 b@@18)) (- (|Set#Card| a@@22) (|Set#Card| (|Set#Intersection| a@@22 b@@18)))))))
 :qid |stdinbpl.665:18|
 :skolemid |93|
 :pattern ( (|Set#Card| (|Set#Difference| a@@22 b@@18)))
)))
(assert (forall ((s0@@1 T@U) (s1@@1 T@U) ) (! (let ((T@@55 (SeqTypeInv0 (type s0@@1))))
 (=> (and (= (type s0@@1) (SeqType T@@55)) (= (type s1@@1) (SeqType T@@55))) (and (=> (= s0@@1 (|Seq#Empty| T@@55)) (= (|Seq#Append| s0@@1 s1@@1) s1@@1)) (=> (= s1@@1 (|Seq#Empty| T@@55)) (= (|Seq#Append| s0@@1 s1@@1) s0@@1)))))
 :qid |stdinbpl.276:18|
 :skolemid |39|
 :pattern ( (|Seq#Append| s0@@1 s1@@1))
)))
(assert (forall ((t@@1 T@U) ) (! (= (|Seq#Index| (|Seq#Singleton| t@@1) 0) t@@1)
 :qid |stdinbpl.280:18|
 :skolemid |40|
 :pattern ( (|Seq#Singleton| t@@1))
)))
(assert (forall ((arg0@@101 T@U) ) (! (= (type (tuple_args arg0@@101)) (SeqType PyTypeDomainTypeType))
 :qid |funType:tuple_args|
 :pattern ( (tuple_args arg0@@101))
)))
(assert (forall ((seq T@U) (Z@@7 T@U) ) (!  (=> (and (and (= (type seq) (SeqType PyTypeDomainTypeType)) (= (type Z@@7) PyTypeDomainTypeType)) (issubtype Z@@7 (tuple seq))) (= (|Seq#Length| (tuple_args Z@@7)) (|Seq#Length| seq)))
 :qid |stdinbpl.1109:15|
 :skolemid |160|
 :pattern ( (issubtype Z@@7 (tuple seq)))
)))
(assert (forall ((s@@9 T@U) ) (! (let ((T@@56 (SeqTypeInv0 (type s@@9))))
 (=> (= (type s@@9) (SeqType T@@56)) (<= 0 (|Seq#Length| s@@9))))
 :qid |stdinbpl.259:18|
 :skolemid |34|
 :pattern ( (|Seq#Length| s@@9))
)))
(assert (forall ((s@@10 T@U) ) (! (let ((T@@57 (MapType0TypeInv0 (type s@@10))))
 (=> (= (type s@@10) (MapType0Type T@@57 boolType)) (<= 0 (|Set#Card| s@@10))))
 :qid |stdinbpl.608:18|
 :skolemid |70|
 :pattern ( (|Set#Card| s@@10))
)))
(assert (forall ((s@@11 T@U) ) (! (let ((T@@58 (MultiSetTypeInv0 (type s@@11))))
 (=> (= (type s@@11) (MultiSetType T@@58)) (<= 0 (|MultiSet#Card| s@@11))))
 :qid |stdinbpl.716:18|
 :skolemid |105|
 :pattern ( (|MultiSet#Card| s@@11))
)))
(assert (forall ((m@@18 T@U) ) (! (let ((V@@12 (MapTypeInv1 (type m@@18))))
(let ((U@@12 (MapTypeInv0 (type m@@18))))
 (=> (= (type m@@18) (MapType U@@12 V@@12)) (<= 0 (|Map#Card| m@@18)))))
 :qid |stdinbpl.806:20|
 :skolemid |130|
 :pattern ( (|Map#Card| m@@18))
)))
(assert (forall ((Heap@@31 T@U) (id@@5 Int) ) (!  (=> (= (type Heap@@31) (MapType1Type RefType)) (and (= (_isDefined Heap@@31 id@@5) (|_isDefined'| Heap@@31 id@@5)) (dummyFunction (bool_2_U (|_isDefined#triggerStateless| id@@5)))))
 :qid |stdinbpl.1583:15|
 :skolemid |208|
 :pattern ( (_isDefined Heap@@31 id@@5))
)))
(assert (forall ((Heap@@32 T@U) (box@@5 T@U) ) (!  (=> (and (= (type Heap@@32) (MapType1Type RefType)) (= (type box@@5) RefType)) (and (= (bool___unbox__ Heap@@32 box@@5) (|bool___unbox__'| Heap@@32 box@@5)) (dummyFunction (bool_2_U (|bool___unbox__#triggerStateless| box@@5)))))
 :qid |stdinbpl.1860:15|
 :skolemid |227|
 :pattern ( (bool___unbox__ Heap@@32 box@@5))
)))
(assert (forall ((Heap@@33 T@U) (Mask@@16 T@U) (prim@@5 Bool) ) (!  (=> (and (and (= (type Heap@@33) (MapType1Type RefType)) (= (type Mask@@16) (MapType2Type RefType realType))) (and (state Heap@@33 Mask@@16) (or (< AssumeFunctionsAbove 0) (|__prim__bool___box__#trigger| EmptyFrame prim@@5)))) (= (|int___unbox__'| Heap@@33 (|__prim__bool___box__'| Heap@@33 prim@@5)) (ite prim@@5 1 0)))
 :qid |stdinbpl.1797:15|
 :skolemid |226|
 :pattern ( (state Heap@@33 Mask@@16) (|__prim__bool___box__'| Heap@@33 prim@@5))
)))
(assert (forall ((o@@7 T@U) ) (! (let ((T@@59 (type o@@7)))
(= (|MultiSet#Select| (|MultiSet#Empty| T@@59) o@@7) 0))
 :qid |stdinbpl.721:18|
 :skolemid |106|
 :pattern ( (let ((T@@59 (type o@@7)))
(|MultiSet#Select| (|MultiSet#Empty| T@@59) o@@7)))
)))
(assert (forall ((rec@@3 T@U) (id@@6 Int) ) (!  (=> (= (type rec@@3) RefType) (= (getPredWandId (_MaySet rec@@3 id@@6)) 3))
 :qid |stdinbpl.2125:15|
 :skolemid |258|
 :pattern ( (_MaySet rec@@3 id@@6))
)))
(assert (forall ((a@@23 T@U) (x@@14 T@U) ) (! (let ((T@@60 (type x@@14)))
 (=> (= (type a@@23) (MapType0Type T@@60 boolType)) (U_2_bool (MapType0Select (|Set#UnionOne| a@@23 x@@14) x@@14))))
 :qid |stdinbpl.624:18|
 :skolemid |78|
 :pattern ( (|Set#UnionOne| a@@23 x@@14))
)))
(assert (forall ((s0@@2 T@U) (s1@@2 T@U) ) (! (let ((T@@61 (SeqTypeInv0 (type s0@@2))))
 (=> (and (and (= (type s0@@2) (SeqType T@@61)) (= (type s1@@2) (SeqType T@@61))) (|Seq#Equal| s0@@2 s1@@2)) (and (= (|Seq#Length| s0@@2) (|Seq#Length| s1@@2)) (forall ((j@@4 Int) ) (!  (=> (and (<= 0 j@@4) (< j@@4 (|Seq#Length| s0@@2))) (= (|Seq#Index| s0@@2 j@@4) (|Seq#Index| s1@@2 j@@4)))
 :qid |stdinbpl.554:13|
 :skolemid |62|
 :pattern ( (|Seq#Index| s0@@2 j@@4))
 :pattern ( (|Seq#Index| s1@@2 j@@4))
)))))
 :qid |stdinbpl.551:18|
 :skolemid |63|
 :pattern ( (|Seq#Equal| s0@@2 s1@@2))
)))
(assert (forall ((Heap@@34 T@U) (Mask@@17 T@U) (box@@6 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@34) (MapType1Type RefType)) (= (type Mask@@17) (MapType2Type RefType realType))) (= (type box@@6) RefType)) (and (state Heap@@34 Mask@@17) (or (< AssumeFunctionsAbove 0) (|int___unbox__#trigger| EmptyFrame box@@6)))) (issubtype (typeof box@@6) vint)) (not (issubtype (typeof box@@6) vbool))) (= (|__prim__int___box__'| Heap@@34 (|int___unbox__'| Heap@@34 box@@6)) box@@6))
 :qid |stdinbpl.1710:15|
 :skolemid |219|
 :pattern ( (state Heap@@34 Mask@@17) (|int___unbox__'| Heap@@34 box@@6))
)))
(assert (forall ((Heap@@35 T@U) (ExhaleHeap@@7 T@U) (Mask@@18 T@U) (pm_f@@1 T@U) ) (! (let ((C@@1 (FieldTypeInv0 (type pm_f@@1))))
 (=> (and (and (and (and (and (= (type Heap@@35) (MapType1Type RefType)) (= (type ExhaleHeap@@7) (MapType1Type RefType))) (= (type Mask@@18) (MapType2Type RefType realType))) (= (type pm_f@@1) (FieldType C@@1 FrameTypeType))) (IdenticalOnKnownLocations Heap@@35 ExhaleHeap@@7 Mask@@18)) (and (HasDirectPerm Mask@@18 null pm_f@@1) (IsPredicateField pm_f@@1))) (forall ((o2 T@U) (f_2@@0 T@U) ) (! (let ((B@@6 (FieldTypeInv1 (type f_2@@0))))
(let ((A@@7 (FieldTypeInv0 (type f_2@@0))))
 (=> (and (and (= (type o2) RefType) (= (type f_2@@0) (FieldType A@@7 B@@6))) (U_2_bool (MapType2Select (MapType1Select Heap@@35 null (PredicateMaskField pm_f@@1)) o2 f_2@@0))) (= (MapType1Select Heap@@35 o2 f_2@@0) (MapType1Select ExhaleHeap@@7 o2 f_2@@0)))))
 :qid |stdinbpl.56:134|
 :skolemid |3|
 :pattern ( (MapType1Select ExhaleHeap@@7 o2 f_2@@0))
))))
 :qid |stdinbpl.54:19|
 :skolemid |4|
 :pattern ( (IdenticalOnKnownLocations Heap@@35 ExhaleHeap@@7 Mask@@18) (IsPredicateField pm_f@@1))
)))
(assert (forall ((Heap@@36 T@U) (ExhaleHeap@@8 T@U) (Mask@@19 T@U) (pm_f@@2 T@U) ) (! (let ((C@@2 (FieldTypeInv0 (type pm_f@@2))))
 (=> (and (and (and (and (and (= (type Heap@@36) (MapType1Type RefType)) (= (type ExhaleHeap@@8) (MapType1Type RefType))) (= (type Mask@@19) (MapType2Type RefType realType))) (= (type pm_f@@2) (FieldType C@@2 FrameTypeType))) (IdenticalOnKnownLocations Heap@@36 ExhaleHeap@@8 Mask@@19)) (and (HasDirectPerm Mask@@19 null pm_f@@2) (IsWandField pm_f@@2))) (forall ((o2@@0 T@U) (f_2@@1 T@U) ) (! (let ((B@@7 (FieldTypeInv1 (type f_2@@1))))
(let ((A@@8 (FieldTypeInv0 (type f_2@@1))))
 (=> (and (and (= (type o2@@0) RefType) (= (type f_2@@1) (FieldType A@@8 B@@7))) (U_2_bool (MapType2Select (MapType1Select Heap@@36 null (WandMaskField pm_f@@2)) o2@@0 f_2@@1))) (= (MapType1Select Heap@@36 o2@@0 f_2@@1) (MapType1Select ExhaleHeap@@8 o2@@0 f_2@@1)))))
 :qid |stdinbpl.69:129|
 :skolemid |6|
 :pattern ( (MapType1Select ExhaleHeap@@8 o2@@0 f_2@@1))
))))
 :qid |stdinbpl.67:19|
 :skolemid |7|
 :pattern ( (IdenticalOnKnownLocations Heap@@36 ExhaleHeap@@8 Mask@@19) (IsWandField pm_f@@2))
)))
(assert (forall ((Heap@@37 T@U) (ExhaleHeap@@9 T@U) (Mask@@20 T@U) (pm_f_1 T@U) ) (! (let ((C@@3 (FieldTypeInv0 (type pm_f_1))))
 (=> (and (and (and (and (and (= (type Heap@@37) (MapType1Type RefType)) (= (type ExhaleHeap@@9) (MapType1Type RefType))) (= (type Mask@@20) (MapType2Type RefType realType))) (= (type pm_f_1) (FieldType C@@3 FrameTypeType))) (IdenticalOnKnownLocationsLiberal Heap@@37 ExhaleHeap@@9 Mask@@20)) (and (HasDirectPerm Mask@@20 null pm_f_1) (IsPredicateField pm_f_1))) (forall ((o2_1 T@U) (f_4@@0 T@U) ) (! (let ((B@@8 (FieldTypeInv1 (type f_4@@0))))
(let ((A@@9 (FieldTypeInv0 (type f_4@@0))))
 (=> (and (and (= (type o2_1) RefType) (= (type f_4@@0) (FieldType A@@9 B@@8))) (U_2_bool (MapType2Select (MapType1Select Heap@@37 null (PredicateMaskField pm_f_1)) o2_1 f_4@@0))) (= (MapType1Select Heap@@37 o2_1 f_4@@0) (MapType1Select ExhaleHeap@@9 o2_1 f_4@@0)))))
 :qid |stdinbpl.120:145|
 :skolemid |17|
 :pattern ( (MapType1Select ExhaleHeap@@9 o2_1 f_4@@0))
))))
 :qid |stdinbpl.118:19|
 :skolemid |18|
 :pattern ( (IdenticalOnKnownLocationsLiberal Heap@@37 ExhaleHeap@@9 Mask@@20) (IsPredicateField pm_f_1))
)))
(assert (forall ((Heap@@38 T@U) (ExhaleHeap@@10 T@U) (Mask@@21 T@U) (pm_f_1@@0 T@U) ) (! (let ((C@@4 (FieldTypeInv0 (type pm_f_1@@0))))
 (=> (and (and (and (and (and (= (type Heap@@38) (MapType1Type RefType)) (= (type ExhaleHeap@@10) (MapType1Type RefType))) (= (type Mask@@21) (MapType2Type RefType realType))) (= (type pm_f_1@@0) (FieldType C@@4 FrameTypeType))) (IdenticalOnKnownLocationsLiberal Heap@@38 ExhaleHeap@@10 Mask@@21)) (and (HasDirectPerm Mask@@21 null pm_f_1@@0) (IsWandField pm_f_1@@0))) (forall ((o2_1@@0 T@U) (f_4@@1 T@U) ) (! (let ((B@@9 (FieldTypeInv1 (type f_4@@1))))
(let ((A@@10 (FieldTypeInv0 (type f_4@@1))))
 (=> (and (and (= (type o2_1@@0) RefType) (= (type f_4@@1) (FieldType A@@10 B@@9))) (U_2_bool (MapType2Select (MapType1Select Heap@@38 null (WandMaskField pm_f_1@@0)) o2_1@@0 f_4@@1))) (= (MapType1Select Heap@@38 o2_1@@0 f_4@@1) (MapType1Select ExhaleHeap@@10 o2_1@@0 f_4@@1)))))
 :qid |stdinbpl.136:140|
 :skolemid |21|
 :pattern ( (MapType1Select ExhaleHeap@@10 o2_1@@0 f_4@@1))
))))
 :qid |stdinbpl.134:19|
 :skolemid |22|
 :pattern ( (IdenticalOnKnownLocationsLiberal Heap@@38 ExhaleHeap@@10 Mask@@21) (IsWandField pm_f_1@@0))
)))
(assert (forall ((a@@24 T@U) (x@@15 T@U) ) (! (let ((T@@62 (type x@@15)))
 (=> (and (= (type a@@24) (MapType0Type T@@62 boolType)) (U_2_bool (MapType0Select a@@24 x@@15))) (= (|Set#Card| (|Set#UnionOne| a@@24 x@@15)) (|Set#Card| a@@24))))
 :qid |stdinbpl.628:18|
 :skolemid |80|
 :pattern ( (|Set#Card| (|Set#UnionOne| a@@24 x@@15)))
)))
(assert (forall ((arg0@@102 T@U) (arg1@@52 Int) ) (! (= (type (seq_ref_index arg0@@102 arg1@@52)) RefType)
 :qid |funType:seq_ref_index|
 :pattern ( (seq_ref_index arg0@@102 arg1@@52))
)))
(assert (forall ((___s_1 T@U) (___i Int) ) (!  (=> (= (type ___s_1) (SeqType RefType)) (= (|Seq#Index| ___s_1 ___i) (seq_ref_index ___s_1 ___i)))
 :qid |stdinbpl.1354:15|
 :skolemid |190|
 :pattern ( (|Seq#Index| ___s_1 ___i))
)))
(assert (forall ((a@@25 T@U) (x@@16 T@U) ) (! (let ((T@@63 (type x@@16)))
 (=> (= (type a@@25) (MultiSetType T@@63)) (and (> (|MultiSet#Select| (|MultiSet#UnionOne| a@@25 x@@16) x@@16) 0) (> (|MultiSet#Card| (|MultiSet#UnionOne| a@@25 x@@16)) 0))))
 :qid |stdinbpl.740:18|
 :skolemid |114|
 :pattern ( (|MultiSet#UnionOne| a@@25 x@@16))
)))
(assert (forall ((r_1@@14 T@U) ) (!  (=> (= (type r_1@@14) RefType) (= (getPredWandId (MustTerminate r_1@@14)) 0))
 :qid |stdinbpl.2020:15|
 :skolemid |240|
 :pattern ( (MustTerminate r_1@@14))
)))
(assert (forall ((r_1@@15 T@U) ) (!  (=> (= (type r_1@@15) RefType) (= (getPredWandId (MustInvokeBounded r_1@@15)) 1))
 :qid |stdinbpl.2055:15|
 :skolemid |246|
 :pattern ( (MustInvokeBounded r_1@@15))
)))
(assert (forall ((r_1@@16 T@U) ) (!  (=> (= (type r_1@@16) RefType) (= (getPredWandId (MustInvokeUnbounded r_1@@16)) 2))
 :qid |stdinbpl.2090:15|
 :skolemid |252|
 :pattern ( (MustInvokeUnbounded r_1@@16))
)))
(assert (forall ((t@@2 T@U) ) (! (= (|Seq#Length| (|Seq#Singleton| t@@2)) 1)
 :qid |stdinbpl.267:18|
 :skolemid |37|
 :pattern ( (|Seq#Singleton| t@@2))
)))
(assert (forall ((r@@1 T@U) ) (! (= (|Set#Card| (|Set#Singleton| r@@1)) 1)
 :qid |stdinbpl.619:18|
 :skolemid |76|
 :pattern ( (|Set#Card| (|Set#Singleton| r@@1)))
)))
(assert (forall ((Mask@@22 T@U) (o_3@@2 T@U) (f_5@@2 T@U) ) (! (let ((B@@10 (FieldTypeInv1 (type f_5@@2))))
(let ((A@@11 (FieldTypeInv0 (type f_5@@2))))
 (=> (and (and (and (= (type Mask@@22) (MapType2Type RefType realType)) (= (type o_3@@2) RefType)) (= (type f_5@@2) (FieldType A@@11 B@@10))) (GoodMask Mask@@22)) (and (>= (U_2_real (MapType2Select Mask@@22 o_3@@2 f_5@@2)) NoPerm) (=> (and (and (GoodMask Mask@@22) (not (IsPredicateField f_5@@2))) (not (IsWandField f_5@@2))) (<= (U_2_real (MapType2Select Mask@@22 o_3@@2 f_5@@2)) FullPerm))))))
 :qid |stdinbpl.185:22|
 :skolemid |28|
 :pattern ( (GoodMask Mask@@22) (MapType2Select Mask@@22 o_3@@2 f_5@@2))
)))
(assert (forall ((r@@2 T@U) ) (! (U_2_bool (MapType0Select (|Set#Singleton| r@@2) r@@2))
 :qid |stdinbpl.617:18|
 :skolemid |74|
 :pattern ( (|Set#Singleton| r@@2))
)))
(assert (forall ((arg0@@103 T@U) (arg1@@53 Int) ) (! (= (type (|__prim__int___box__#frame| arg0@@103 arg1@@53)) RefType)
 :qid |funType:__prim__int___box__#frame|
 :pattern ( (|__prim__int___box__#frame| arg0@@103 arg1@@53))
)))
(assert (forall ((Heap@@39 T@U) (Mask@@23 T@U) (prim@@6 Int) ) (!  (=> (and (and (= (type Heap@@39) (MapType1Type RefType)) (= (type Mask@@23) (MapType2Type RefType realType))) (state Heap@@39 Mask@@23)) (= (|__prim__int___box__'| Heap@@39 prim@@6) (|__prim__int___box__#frame| EmptyFrame prim@@6)))
 :qid |stdinbpl.1634:15|
 :skolemid |213|
 :pattern ( (state Heap@@39 Mask@@23) (|__prim__int___box__'| Heap@@39 prim@@6))
)))
(assert (forall ((Heap@@40 T@U) (Mask@@24 T@U) (box@@7 T@U) ) (!  (=> (and (and (and (= (type Heap@@40) (MapType1Type RefType)) (= (type Mask@@24) (MapType2Type RefType realType))) (= (type box@@7) RefType)) (state Heap@@40 Mask@@24)) (= (|int___unbox__'| Heap@@40 box@@7) (|int___unbox__#frame| EmptyFrame box@@7)))
 :qid |stdinbpl.1704:15|
 :skolemid |218|
 :pattern ( (state Heap@@40 Mask@@24) (|int___unbox__'| Heap@@40 box@@7))
)))
(assert (forall ((arg0@@104 T@U) (arg1@@54 Bool) ) (! (= (type (|__prim__bool___box__#frame| arg0@@104 arg1@@54)) RefType)
 :qid |funType:__prim__bool___box__#frame|
 :pattern ( (|__prim__bool___box__#frame| arg0@@104 arg1@@54))
)))
(assert (forall ((Heap@@41 T@U) (Mask@@25 T@U) (prim@@7 Bool) ) (!  (=> (and (and (= (type Heap@@41) (MapType1Type RefType)) (= (type Mask@@25) (MapType2Type RefType realType))) (state Heap@@41 Mask@@25)) (= (|__prim__bool___box__'| Heap@@41 prim@@7) (|__prim__bool___box__#frame| EmptyFrame prim@@7)))
 :qid |stdinbpl.1783:15|
 :skolemid |223|
 :pattern ( (state Heap@@41 Mask@@25) (|__prim__bool___box__'| Heap@@41 prim@@7))
)))
(assert (forall ((Heap@@42 T@U) (Mask@@26 T@U) (r_1@@17 T@U) ) (!  (=> (and (and (and (= (type Heap@@42) (MapType1Type RefType)) (= (type Mask@@26) (MapType2Type RefType realType))) (= (type r_1@@17) RefType)) (state Heap@@42 Mask@@26)) (= (|Level'| Heap@@42 r_1@@17) (|Level#frame| EmptyFrame r_1@@17)))
 :qid |stdinbpl.1982:15|
 :skolemid |237|
 :pattern ( (state Heap@@42 Mask@@26) (|Level'| Heap@@42 r_1@@17))
)))
(assert (forall ((m@@19 T@U) ) (! (let ((V@@13 (MapTypeInv1 (type m@@19))))
(let ((U@@13 (MapTypeInv0 (type m@@19))))
 (=> (= (type m@@19) (MapType U@@13 V@@13)) (and (and (= (= (|Map#Card| m@@19) 0) (= m@@19 (|Map#Empty| U@@13 V@@13))) (=> (not (= (|Map#Card| m@@19) 0)) (exists ((x@@17 T@U) ) (!  (and (= (type x@@17) U@@13) (U_2_bool (MapType0Select (|Map#Domain| m@@19) x@@17)))
 :qid |stdinbpl.850:32|
 :skolemid |137|
 :no-pattern (type x@@17)
 :no-pattern (U_2_int x@@17)
 :no-pattern (U_2_bool x@@17)
)))) (forall ((x@@18 T@U) ) (!  (=> (and (= (type x@@18) U@@13) (U_2_bool (MapType0Select (|Map#Domain| m@@19) x@@18))) (not (= (|Map#Card| m@@19) 0)))
 :qid |stdinbpl.851:11|
 :skolemid |138|
 :pattern ( (MapType0Select (|Map#Domain| m@@19) x@@18))
))))))
 :qid |stdinbpl.848:21|
 :skolemid |139|
 :pattern ( (|Map#Card| m@@19))
)))
(assert (forall ((a@@26 T@U) (b@@19 T@U) ) (! (let ((T@@64 (MapType0TypeInv0 (type a@@26))))
 (=> (and (= (type a@@26) (MapType0Type T@@64 boolType)) (= (type b@@19) (MapType0Type T@@64 boolType))) (= (|Set#Union| a@@26 (|Set#Union| a@@26 b@@19)) (|Set#Union| a@@26 b@@19))))
 :qid |stdinbpl.651:18|
 :skolemid |87|
 :pattern ( (|Set#Union| a@@26 (|Set#Union| a@@26 b@@19)))
)))
(assert (forall ((a@@27 T@U) (b@@20 T@U) ) (! (let ((T@@65 (MapType0TypeInv0 (type a@@27))))
 (=> (and (= (type a@@27) (MapType0Type T@@65 boolType)) (= (type b@@20) (MapType0Type T@@65 boolType))) (= (|Set#Intersection| a@@27 (|Set#Intersection| a@@27 b@@20)) (|Set#Intersection| a@@27 b@@20))))
 :qid |stdinbpl.655:18|
 :skolemid |89|
 :pattern ( (|Set#Intersection| a@@27 (|Set#Intersection| a@@27 b@@20)))
)))
(assert (forall ((a@@28 T@U) (b@@21 T@U) ) (! (let ((T@@66 (MultiSetTypeInv0 (type a@@28))))
 (=> (and (= (type a@@28) (MultiSetType T@@66)) (= (type b@@21) (MultiSetType T@@66))) (= (|MultiSet#Intersection| a@@28 (|MultiSet#Intersection| a@@28 b@@21)) (|MultiSet#Intersection| a@@28 b@@21))))
 :qid |stdinbpl.757:18|
 :skolemid |119|
 :pattern ( (|MultiSet#Intersection| a@@28 (|MultiSet#Intersection| a@@28 b@@21)))
)))
(assert (forall ((s@@12 T@U) ) (! (let ((T@@67 (MultiSetTypeInv0 (type s@@12))))
 (=> (= (type s@@12) (MultiSetType T@@67)) (and (= (= (|MultiSet#Card| s@@12) 0) (= s@@12 (|MultiSet#Empty| T@@67))) (=> (not (= (|MultiSet#Card| s@@12) 0)) (exists ((x@@19 T@U) ) (!  (and (= (type x@@19) T@@67) (< 0 (|MultiSet#Select| s@@12 x@@19)))
 :qid |stdinbpl.724:38|
 :skolemid |107|
 :no-pattern (type x@@19)
 :no-pattern (U_2_int x@@19)
 :no-pattern (U_2_bool x@@19)
))))))
 :qid |stdinbpl.722:18|
 :skolemid |108|
 :pattern ( (|MultiSet#Card| s@@12))
)))
(assert (forall ((r@@3 T@U) (o@@8 T@U) ) (! (let ((T@@68 (type r@@3)))
 (=> (= (type o@@8) T@@68) (and (= (= (|MultiSet#Select| (|MultiSet#Singleton| r@@3) o@@8) 1) (= r@@3 o@@8)) (= (= (|MultiSet#Select| (|MultiSet#Singleton| r@@3) o@@8) 0) (not (= r@@3 o@@8))))))
 :qid |stdinbpl.727:18|
 :skolemid |109|
 :pattern ( (|MultiSet#Select| (|MultiSet#Singleton| r@@3) o@@8))
)))
(assert (forall ((o@@9 T@U) (f T@U) (Heap@@43 T@U) ) (!  (=> (and (and (and (= (type o@@9) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap@@43) (MapType1Type RefType))) (U_2_bool (MapType1Select Heap@@43 o@@9 $allocated))) (U_2_bool (MapType1Select Heap@@43 (MapType1Select Heap@@43 o@@9 f) $allocated)))
 :qid |stdinbpl.31:15|
 :skolemid |0|
 :pattern ( (MapType1Select Heap@@43 o@@9 f))
)))
(assert (forall ((m@@20 T@U) (u@@7 T@U) (|u'| T@U) (v@@4 T@U) ) (! (let ((V@@14 (type v@@4)))
(let ((U@@14 (type u@@7)))
 (=> (and (= (type m@@20) (MapType U@@14 V@@14)) (= (type |u'|) U@@14)) (and (=> (= |u'| u@@7) (and (U_2_bool (MapType0Select (|Map#Domain| (|Map#Build| m@@20 u@@7 v@@4)) |u'|)) (= (MapType0Select (|Map#Elements| (|Map#Build| m@@20 u@@7 v@@4)) |u'|) v@@4))) (=> (not (= |u'| u@@7)) (and (= (U_2_bool (MapType0Select (|Map#Domain| (|Map#Build| m@@20 u@@7 v@@4)) |u'|)) (U_2_bool (MapType0Select (|Map#Domain| m@@20) |u'|))) (= (MapType0Select (|Map#Elements| (|Map#Build| m@@20 u@@7 v@@4)) |u'|) (MapType0Select (|Map#Elements| m@@20) |u'|))))))))
 :qid |stdinbpl.857:21|
 :skolemid |140|
 :pattern ( (MapType0Select (|Map#Domain| (|Map#Build| m@@20 u@@7 v@@4)) |u'|))
 :pattern ( (MapType0Select (|Map#Domain| m@@20) |u'|) (|Map#Build| m@@20 u@@7 v@@4))
 :pattern ( (MapType0Select (|Map#Elements| (|Map#Build| m@@20 u@@7 v@@4)) |u'|))
)))
(assert (forall ((rec@@4 T@U) (id@@7 Int) ) (!  (=> (= (type rec@@4) RefType) (= (PredicateMaskField (_MaySet rec@@4 id@@7)) (|_MaySet#sm| rec@@4 id@@7)))
 :qid |stdinbpl.2117:15|
 :skolemid |256|
 :pattern ( (PredicateMaskField (_MaySet rec@@4 id@@7)))
)))
(assert (forall ((a@@29 T@U) (b@@22 T@U) (o@@10 T@U) ) (! (let ((T@@69 (type o@@10)))
 (=> (and (= (type a@@29) (MultiSetType T@@69)) (= (type b@@22) (MultiSetType T@@69))) (= (|MultiSet#Select| (|MultiSet#Union| a@@29 b@@22) o@@10) (+ (|MultiSet#Select| a@@29 o@@10) (|MultiSet#Select| b@@22 o@@10)))))
 :qid |stdinbpl.745:18|
 :skolemid |115|
 :pattern ( (|MultiSet#Select| (|MultiSet#Union| a@@29 b@@22) o@@10))
 :pattern ( (|MultiSet#Union| a@@29 b@@22) (|MultiSet#Select| a@@29 o@@10) (|MultiSet#Select| b@@22 o@@10))
)))
(assert (forall ((___s_1@@0 T@U) ) (!  (=> (= (type ___s_1@@0) (SeqType RefType)) (= (|Seq#Length| ___s_1@@0) (seq_ref_length ___s_1@@0)))
 :qid |stdinbpl.1348:15|
 :skolemid |189|
 :pattern ( (|Seq#Length| ___s_1@@0))
)))
(assert (forall ((s@@13 T@U) (t@@3 T@U) (n@@8 Int) ) (! (let ((T@@70 (SeqTypeInv0 (type s@@13))))
 (=> (and (and (= (type s@@13) (SeqType T@@70)) (= (type t@@3) (SeqType T@@70))) (and (< 0 n@@8) (<= n@@8 (|Seq#Length| s@@13)))) (= (|Seq#Take| (|Seq#Append| s@@13 t@@3) n@@8) (|Seq#Take| s@@13 n@@8))))
 :qid |stdinbpl.409:18|
 :skolemid |53|
 :pattern ( (|Seq#Take| (|Seq#Append| s@@13 t@@3) n@@8))
)))
(assert (forall ((T@@71 T@T) ) (! (= (type (|Set#Empty| T@@71)) (MapType0Type T@@71 boolType))
 :qid |funType:Set#Empty|
 :pattern ( (|Set#Empty| T@@71))
)))
(assert (forall ((o@@11 T@U) ) (! (let ((T@@72 (type o@@11)))
 (not (U_2_bool (MapType0Select (|Set#Empty| T@@72) o@@11))))
 :qid |stdinbpl.611:18|
 :skolemid |71|
 :pattern ( (let ((T@@72 (type o@@11)))
(MapType0Select (|Set#Empty| T@@72) o@@11)))
)))
(assert (forall ((s@@14 T@U) (i@@5 Int) (v@@5 T@U) ) (! (let ((T@@73 (type v@@5)))
 (=> (= (type s@@14) (SeqType T@@73)) (=> (and (<= 0 i@@5) (< i@@5 (|Seq#Length| s@@14))) (= (|Seq#Length| (|Seq#Update| s@@14 i@@5 v@@5)) (|Seq#Length| s@@14)))))
 :qid |stdinbpl.308:18|
 :skolemid |46|
 :pattern ( (|Seq#Length| (|Seq#Update| s@@14 i@@5 v@@5)))
 :pattern ( (|Seq#Length| s@@14) (|Seq#Update| s@@14 i@@5 v@@5))
)))
(assert (forall ((Heap@@44 T@U) (Mask@@27 T@U) (self@@1 Int) (other@@1 Int) ) (!  (=> (and (and (= (type Heap@@44) (MapType1Type RefType)) (= (type Mask@@27) (MapType2Type RefType realType))) (and (state Heap@@44 Mask@@27) (< AssumeFunctionsAbove 2))) (= (int___gt__ Heap@@44 self@@1 other@@1) (> self@@1 other@@1)))
 :qid |stdinbpl.1932:15|
 :skolemid |233|
 :pattern ( (state Heap@@44 Mask@@27) (int___gt__ Heap@@44 self@@1 other@@1))
)))
(assert (forall ((r_1@@18 T@U) ) (!  (=> (= (type r_1@@18) RefType) (= (PredicateMaskField (MustTerminate r_1@@18)) (|MustTerminate#sm| r_1@@18)))
 :qid |stdinbpl.2012:15|
 :skolemid |238|
 :pattern ( (PredicateMaskField (MustTerminate r_1@@18)))
)))
(assert (forall ((r_1@@19 T@U) ) (!  (=> (= (type r_1@@19) RefType) (= (PredicateMaskField (MustInvokeBounded r_1@@19)) (|MustInvokeBounded#sm| r_1@@19)))
 :qid |stdinbpl.2047:15|
 :skolemid |244|
 :pattern ( (PredicateMaskField (MustInvokeBounded r_1@@19)))
)))
(assert (forall ((r_1@@20 T@U) ) (!  (=> (= (type r_1@@20) RefType) (= (PredicateMaskField (MustInvokeUnbounded r_1@@20)) (|MustInvokeUnbounded#sm| r_1@@20)))
 :qid |stdinbpl.2082:15|
 :skolemid |250|
 :pattern ( (PredicateMaskField (MustInvokeUnbounded r_1@@20)))
)))
(assert (forall ((r@@4 T@U) ) (! (let ((T@@74 (type r@@4)))
(= (|MultiSet#Singleton| r@@4) (|MultiSet#UnionOne| (|MultiSet#Empty| T@@74) r@@4)))
 :qid |stdinbpl.730:18|
 :skolemid |111|
 :pattern ( (|MultiSet#Singleton| r@@4))
)))
(assert (forall ((m@@21 T@U) ) (! (let ((V@@15 (MapTypeInv1 (type m@@21))))
(let ((U@@15 (MapTypeInv0 (type m@@21))))
 (=> (= (type m@@21) (MapType U@@15 V@@15)) (= (|Set#Card| (|Map#Domain| m@@21)) (|Map#Card| m@@21)))))
 :qid |stdinbpl.813:20|
 :skolemid |131|
 :pattern ( (|Set#Card| (|Map#Domain| m@@21)))
 :pattern ( (|Map#Card| m@@21))
)))
(assert (forall ((s@@15 T@U) (t@@4 T@U) (n@@9 Int) ) (! (let ((T@@75 (SeqTypeInv0 (type s@@15))))
 (=> (and (and (= (type s@@15) (SeqType T@@75)) (= (type t@@4) (SeqType T@@75))) (and (< 0 n@@9) (<= n@@9 (|Seq#Length| s@@15)))) (= (|Seq#Drop| (|Seq#Append| s@@15 t@@4) n@@9) (|Seq#Append| (|Seq#Drop| s@@15 n@@9) t@@4))))
 :qid |stdinbpl.422:18|
 :skolemid |55|
 :pattern ( (|Seq#Drop| (|Seq#Append| s@@15 t@@4) n@@9))
)))
(assert (forall ((a@@30 Int) (b@@23 Int) ) (! (= (<= a@@30 b@@23) (= (|Math#min| a@@30 b@@23) a@@30))
 :qid |stdinbpl.695:15|
 :skolemid |99|
 :pattern ( (|Math#min| a@@30 b@@23))
)))
(assert (forall ((a@@31 Int) (b@@24 Int) ) (! (= (<= b@@24 a@@31) (= (|Math#min| a@@31 b@@24) b@@24))
 :qid |stdinbpl.696:15|
 :skolemid |100|
 :pattern ( (|Math#min| a@@31 b@@24))
)))
(assert (forall ((s@@16 T@U) (n@@10 Int) (i@@6 Int) ) (! (let ((T@@76 (SeqTypeInv0 (type s@@16))))
 (=> (= (type s@@16) (SeqType T@@76)) (=> (and (and (< 0 n@@10) (<= n@@10 i@@6)) (< i@@6 (|Seq#Length| s@@16))) (and (= (|Seq#Add| (|Seq#Sub| i@@6 n@@10) n@@10) i@@6) (= (|Seq#Index| (|Seq#Drop| s@@16 n@@10) (|Seq#Sub| i@@6 n@@10)) (|Seq#Index| s@@16 i@@6))))))
 :qid |stdinbpl.359:18|
 :skolemid |52|
 :pattern ( (|Seq#Drop| s@@16 n@@10) (|Seq#Index| s@@16 i@@6))
)))
(assert (forall ((s@@17 T@U) ) (! (let ((T@@77 (MapType0TypeInv0 (type s@@17))))
 (=> (= (type s@@17) (MapType0Type T@@77 boolType)) (and (= (= (|Set#Card| s@@17) 0) (= s@@17 (|Set#Empty| T@@77))) (=> (not (= (|Set#Card| s@@17) 0)) (exists ((x@@20 T@U) ) (!  (and (= (type x@@20) T@@77) (U_2_bool (MapType0Select s@@17 x@@20)))
 :qid |stdinbpl.614:33|
 :skolemid |72|
 :no-pattern (type x@@20)
 :no-pattern (U_2_int x@@20)
 :no-pattern (U_2_bool x@@20)
))))))
 :qid |stdinbpl.612:18|
 :skolemid |73|
 :pattern ( (|Set#Card| s@@17))
)))
(assert (forall ((s0@@3 T@U) (s1@@3 T@U) (n@@11 Int) ) (! (let ((T@@78 (SeqTypeInv0 (type s0@@3))))
 (=> (and (= (type s0@@3) (SeqType T@@78)) (= (type s1@@3) (SeqType T@@78))) (=> (and (and (and (not (= s0@@3 (|Seq#Empty| T@@78))) (not (= s1@@3 (|Seq#Empty| T@@78)))) (<= 0 n@@11)) (< n@@11 (|Seq#Length| s0@@3))) (= (|Seq#Index| (|Seq#Append| s0@@3 s1@@3) n@@11) (|Seq#Index| s0@@3 n@@11)))))
 :qid |stdinbpl.299:18|
 :skolemid |43|
 :pattern ( (|Seq#Index| (|Seq#Append| s0@@3 s1@@3) n@@11))
 :pattern ( (|Seq#Index| s0@@3 n@@11) (|Seq#Append| s0@@3 s1@@3))
)))
(assert (forall ((Heap@@45 T@U) (o@@12 T@U) (f_3 T@U) (v@@6 T@U) ) (! (let ((B@@11 (type v@@6)))
(let ((A@@12 (FieldTypeInv0 (type f_3))))
 (=> (and (and (= (type Heap@@45) (MapType1Type RefType)) (= (type o@@12) RefType)) (= (type f_3) (FieldType A@@12 B@@11))) (succHeap Heap@@45 (MapType1Store Heap@@45 o@@12 f_3 v@@6)))))
 :qid |stdinbpl.80:22|
 :skolemid |9|
 :pattern ( (MapType1Store Heap@@45 o@@12 f_3 v@@6))
)))
(assert (forall ((a@@32 T@U) (b@@25 T@U) ) (! (let ((T@@79 (MapType0TypeInv0 (type a@@32))))
 (=> (and (= (type a@@32) (MapType0Type T@@79 boolType)) (= (type b@@25) (MapType0Type T@@79 boolType))) (= (|Set#Subset| a@@32 b@@25) (forall ((o@@13 T@U) ) (!  (=> (and (= (type o@@13) T@@79) (U_2_bool (MapType0Select a@@32 o@@13))) (U_2_bool (MapType0Select b@@25 o@@13)))
 :qid |stdinbpl.674:32|
 :skolemid |94|
 :pattern ( (MapType0Select a@@32 o@@13))
 :pattern ( (MapType0Select b@@25 o@@13))
)))))
 :qid |stdinbpl.673:17|
 :skolemid |95|
 :pattern ( (|Set#Subset| a@@32 b@@25))
)))
(assert (forall ((Heap@@46 T@U) (Mask@@28 T@U) (prim@@8 Int) ) (!  (=> (and (and (= (type Heap@@46) (MapType1Type RefType)) (= (type Mask@@28) (MapType2Type RefType realType))) (and (state Heap@@46 Mask@@28) (or (< AssumeFunctionsAbove 0) (|__prim__int___box__#trigger| EmptyFrame prim@@8)))) (= (typeof (|__prim__int___box__'| Heap@@46 prim@@8)) vint))
 :qid |stdinbpl.1640:15|
 :skolemid |214|
 :pattern ( (state Heap@@46 Mask@@28) (|__prim__int___box__'| Heap@@46 prim@@8))
)))
(assert (forall ((Heap@@47 T@U) (Mask@@29 T@U) (prim@@9 Bool) ) (!  (=> (and (and (= (type Heap@@47) (MapType1Type RefType)) (= (type Mask@@29) (MapType2Type RefType realType))) (and (state Heap@@47 Mask@@29) (or (< AssumeFunctionsAbove 0) (|__prim__bool___box__#trigger| EmptyFrame prim@@9)))) (= (typeof (|__prim__bool___box__'| Heap@@47 prim@@9)) vbool))
 :qid |stdinbpl.1789:15|
 :skolemid |224|
 :pattern ( (state Heap@@47 Mask@@29) (|__prim__bool___box__'| Heap@@47 prim@@9))
)))
(assert (forall ((s0@@4 T@U) (s1@@4 T@U) (m@@22 Int) ) (! (let ((T@@80 (SeqTypeInv0 (type s0@@4))))
 (=> (and (= (type s0@@4) (SeqType T@@80)) (= (type s1@@4) (SeqType T@@80))) (=> (and (and (and (not (= s0@@4 (|Seq#Empty| T@@80))) (not (= s1@@4 (|Seq#Empty| T@@80)))) (<= 0 m@@22)) (< m@@22 (|Seq#Length| s1@@4))) (and (= (|Seq#Sub| (|Seq#Add| m@@22 (|Seq#Length| s0@@4)) (|Seq#Length| s0@@4)) m@@22) (= (|Seq#Index| (|Seq#Append| s0@@4 s1@@4) (|Seq#Add| m@@22 (|Seq#Length| s0@@4))) (|Seq#Index| s1@@4 m@@22))))))
 :qid |stdinbpl.304:18|
 :skolemid |45|
 :pattern ( (|Seq#Index| s1@@4 m@@22) (|Seq#Append| s0@@4 s1@@4))
)))
(assert (forall ((sub_1@@0 T@U) (sub2@@0 T@U) (super_1 T@U) ) (!  (=> (and (and (and (= (type sub_1@@0) PyTypeDomainTypeType) (= (type sub2@@0) PyTypeDomainTypeType)) (= (type super_1) PyTypeDomainTypeType)) (and (extends_ sub_1@@0 super_1) (and (extends_ sub2@@0 super_1) (not (= sub_1@@0 sub2@@0))))) (and (isnotsubtype sub_1@@0 sub2@@0) (isnotsubtype sub2@@0 sub_1@@0)))
 :qid |stdinbpl.1085:15|
 :skolemid |156|
 :pattern ( (extends_ sub_1@@0 super_1) (extends_ sub2@@0 super_1))
)))
(assert (forall ((a@@33 T@U) (x@@21 T@U) ) (! (let ((T@@81 (type x@@21)))
 (=> (and (= (type a@@33) (MapType0Type T@@81 boolType)) (not (U_2_bool (MapType0Select a@@33 x@@21)))) (= (|Set#Card| (|Set#UnionOne| a@@33 x@@21)) (+ (|Set#Card| a@@33) 1))))
 :qid |stdinbpl.630:18|
 :skolemid |81|
 :pattern ( (|Set#Card| (|Set#UnionOne| a@@33 x@@21)))
)))
(assert (forall ((a@@34 T@U) (b@@26 T@U) (o@@14 T@U) ) (! (let ((T@@82 (type o@@14)))
 (=> (and (= (type a@@34) (MultiSetType T@@82)) (= (type b@@26) (MultiSetType T@@82))) (= (|MultiSet#Select| (|MultiSet#Difference| a@@34 b@@26) o@@14) (|Math#clip| (- (|MultiSet#Select| a@@34 o@@14) (|MultiSet#Select| b@@26 o@@14))))))
 :qid |stdinbpl.762:18|
 :skolemid |120|
 :pattern ( (|MultiSet#Select| (|MultiSet#Difference| a@@34 b@@26) o@@14))
)))
(assert (forall ((n_1@@2 T@U) ) (!  (=> (= (type n_1@@2) _NameDomainTypeType) (=  (not (_name_type n_1@@2)) (_is_combined n_1@@2)))
 :qid |stdinbpl.1504:15|
 :skolemid |205|
 :pattern ( (_name_type n_1@@2))
)))
(assert (forall ((var0@@0 T@U) ) (!  (=> (= (type var0@@0) PyTypeDomainTypeType) (and (extends_ (list var0@@0) object) (= (get_basic (list var0@@0)) list_basic)))
 :qid |stdinbpl.1172:15|
 :skolemid |171|
 :pattern ( (list var0@@0))
)))
(assert (forall ((var0@@1 T@U) ) (!  (=> (= (type var0@@1) PyTypeDomainTypeType) (and (extends_ (set var0@@1) object) (= (get_basic (set var0@@1)) set_basic)))
 :qid |stdinbpl.1184:15|
 :skolemid |173|
 :pattern ( (set var0@@1))
)))
(assert (forall ((var0@@2 T@U) ) (!  (=> (= (type var0@@2) PyTypeDomainTypeType) (and (extends_ (PSeq var0@@2) object) (= (get_basic (PSeq var0@@2)) PSeq_basic)))
 :qid |stdinbpl.1250:15|
 :skolemid |180|
 :pattern ( (PSeq var0@@2))
)))
(assert (forall ((var0@@3 T@U) ) (!  (=> (= (type var0@@3) PyTypeDomainTypeType) (and (extends_ (PSet var0@@3) object) (= (get_basic (PSet var0@@3)) PSet_basic)))
 :qid |stdinbpl.1262:15|
 :skolemid |182|
 :pattern ( (PSet var0@@3))
)))
(assert (forall ((var0@@4 T@U) ) (!  (=> (= (type var0@@4) PyTypeDomainTypeType) (and (extends_ (PMultiset var0@@4) object) (= (get_basic (PMultiset var0@@4)) PMultiset_basic)))
 :qid |stdinbpl.1274:15|
 :skolemid |184|
 :pattern ( (PMultiset var0@@4))
)))
(assert (forall ((var0@@5 T@U) ) (!  (=> (= (type var0@@5) PyTypeDomainTypeType) (and (extends_ (Iterator var0@@5) object) (= (get_basic (Iterator var0@@5)) Iterator_basic)))
 :qid |stdinbpl.1292:15|
 :skolemid |186|
 :pattern ( (Iterator var0@@5))
)))
(assert (= (type ZeroPMask) (MapType2Type RefType boolType)))
(assert (forall ((o_3@@3 T@U) (f_5@@3 T@U) ) (! (let ((B@@12 (FieldTypeInv1 (type f_5@@3))))
(let ((A@@13 (FieldTypeInv0 (type f_5@@3))))
 (=> (and (= (type o_3@@3) RefType) (= (type f_5@@3) (FieldType A@@13 B@@12))) (not (U_2_bool (MapType2Select ZeroPMask o_3@@3 f_5@@3))))))
 :qid |stdinbpl.169:22|
 :skolemid |26|
 :pattern ( (MapType2Select ZeroPMask o_3@@3 f_5@@3))
)))
(assert (forall ((arg_1_1@@5 T@U) (X@@5 T@U) ) (!  (=> (and (= (type arg_1_1@@5) PyTypeDomainTypeType) (= (type X@@5) PyTypeDomainTypeType)) (= (issubtype X@@5 (union_type_1 arg_1_1@@5)) (issubtype X@@5 arg_1_1@@5)))
 :qid |stdinbpl.1124:15|
 :skolemid |163|
 :pattern ( (issubtype X@@5 (union_type_1 arg_1_1@@5)))
)))
(assert (forall ((s@@18 T@U) (x@@22 T@U) (i@@7 Int) ) (! (let ((T@@83 (type x@@22)))
 (=> (= (type s@@18) (SeqType T@@83)) (=> (and (and (<= 0 i@@7) (< i@@7 (|Seq#Length| s@@18))) (= (|Seq#Index| s@@18 i@@7) x@@22)) (|Seq#Contains| s@@18 x@@22))))
 :qid |stdinbpl.455:18|
 :skolemid |60|
 :pattern ( (|Seq#Contains| s@@18 x@@22) (|Seq#Index| s@@18 i@@7))
)))
(assert (forall ((s0@@5 T@U) (s1@@5 T@U) ) (! (let ((T@@84 (SeqTypeInv0 (type s0@@5))))
 (=> (and (= (type s0@@5) (SeqType T@@84)) (= (type s1@@5) (SeqType T@@84))) (or (or (and (= s0@@5 s1@@5) (|Seq#Equal| s0@@5 s1@@5)) (and (and (not (= s0@@5 s1@@5)) (not (|Seq#Equal| s0@@5 s1@@5))) (not (= (|Seq#Length| s0@@5) (|Seq#Length| s1@@5))))) (and (and (and (and (and (and (not (= s0@@5 s1@@5)) (not (|Seq#Equal| s0@@5 s1@@5))) (= (|Seq#Length| s0@@5) (|Seq#Length| s1@@5))) (= (|Seq#SkolemDiff| s0@@5 s1@@5) (|Seq#SkolemDiff| s1@@5 s0@@5))) (<= 0 (|Seq#SkolemDiff| s0@@5 s1@@5))) (< (|Seq#SkolemDiff| s0@@5 s1@@5) (|Seq#Length| s0@@5))) (not (= (|Seq#Index| s0@@5 (|Seq#SkolemDiff| s0@@5 s1@@5)) (|Seq#Index| s1@@5 (|Seq#SkolemDiff| s0@@5 s1@@5))))))))
 :qid |stdinbpl.559:18|
 :skolemid |64|
 :pattern ( (|Seq#Equal| s0@@5 s1@@5))
)))
(assert (forall ((p@@1 T@U) (v_1@@0 T@U) (q T@U) (w@@0 T@U) (r@@5 T@U) (u@@8 T@U) ) (! (let ((C@@5 (FieldTypeInv0 (type r@@5))))
(let ((B@@13 (FieldTypeInv0 (type q))))
(let ((A@@14 (FieldTypeInv0 (type p@@1))))
 (=> (and (and (and (and (and (and (= (type p@@1) (FieldType A@@14 FrameTypeType)) (= (type v_1@@0) FrameTypeType)) (= (type q) (FieldType B@@13 FrameTypeType))) (= (type w@@0) FrameTypeType)) (= (type r@@5) (FieldType C@@5 FrameTypeType))) (= (type u@@8) FrameTypeType)) (and (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r@@5 u@@8))) (InsidePredicate p@@1 v_1@@0 r@@5 u@@8)))))
 :qid |stdinbpl.228:25|
 :skolemid |32|
 :pattern ( (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r@@5 u@@8))
)))
(assert (forall ((i@@8 Int) ) (! (= (_get_value (_single i@@8)) i@@8)
 :qid |stdinbpl.1462:15|
 :skolemid |198|
 :pattern ( (_single i@@8))
)))
(assert (forall ((Heap@@48 T@U) (ExhaleHeap@@11 T@U) (Mask@@30 T@U) (pm_f_1@@1 T@U) ) (! (let ((C@@6 (FieldTypeInv0 (type pm_f_1@@1))))
 (=> (and (and (and (and (and (= (type Heap@@48) (MapType1Type RefType)) (= (type ExhaleHeap@@11) (MapType1Type RefType))) (= (type Mask@@30) (MapType2Type RefType realType))) (= (type pm_f_1@@1) (FieldType C@@6 FrameTypeType))) (IdenticalOnKnownLocationsLiberal Heap@@48 ExhaleHeap@@11 Mask@@30)) (and (HasDirectPerm Mask@@30 null pm_f_1@@1) (IsPredicateField pm_f_1@@1))) (forall ((o2_1@@1 T@U) (f_4@@2 T@U) ) (! (let ((B@@14 (FieldTypeInv1 (type f_4@@2))))
(let ((A@@15 (FieldTypeInv0 (type f_4@@2))))
 (=> (and (and (= (type o2_1@@1) RefType) (= (type f_4@@2) (FieldType A@@15 B@@14))) (U_2_bool (MapType2Select (MapType1Select Heap@@48 null (PredicateMaskField pm_f_1@@1)) o2_1@@1 f_4@@2))) (U_2_bool (MapType2Select (MapType1Select ExhaleHeap@@11 null (PredicateMaskField pm_f_1@@1)) o2_1@@1 f_4@@2)))))
 :qid |stdinbpl.112:145|
 :skolemid |15|
 :pattern ( (MapType2Select (MapType1Select ExhaleHeap@@11 null (PredicateMaskField pm_f_1@@1)) o2_1@@1 f_4@@2))
))))
 :qid |stdinbpl.110:19|
 :skolemid |16|
 :pattern ( (IdenticalOnKnownLocationsLiberal Heap@@48 ExhaleHeap@@11 Mask@@30) (IsPredicateField pm_f_1@@1) (MapType1Select ExhaleHeap@@11 null (PredicateMaskField pm_f_1@@1)))
)))
(assert (forall ((Heap@@49 T@U) (ExhaleHeap@@12 T@U) (Mask@@31 T@U) (pm_f_1@@2 T@U) ) (! (let ((C@@7 (FieldTypeInv0 (type pm_f_1@@2))))
 (=> (and (and (and (and (and (= (type Heap@@49) (MapType1Type RefType)) (= (type ExhaleHeap@@12) (MapType1Type RefType))) (= (type Mask@@31) (MapType2Type RefType realType))) (= (type pm_f_1@@2) (FieldType C@@7 FrameTypeType))) (IdenticalOnKnownLocationsLiberal Heap@@49 ExhaleHeap@@12 Mask@@31)) (and (HasDirectPerm Mask@@31 null pm_f_1@@2) (IsWandField pm_f_1@@2))) (forall ((o2_1@@2 T@U) (f_4@@3 T@U) ) (! (let ((B@@15 (FieldTypeInv1 (type f_4@@3))))
(let ((A@@16 (FieldTypeInv0 (type f_4@@3))))
 (=> (and (and (= (type o2_1@@2) RefType) (= (type f_4@@3) (FieldType A@@16 B@@15))) (U_2_bool (MapType2Select (MapType1Select Heap@@49 null (WandMaskField pm_f_1@@2)) o2_1@@2 f_4@@3))) (U_2_bool (MapType2Select (MapType1Select ExhaleHeap@@12 null (WandMaskField pm_f_1@@2)) o2_1@@2 f_4@@3)))))
 :qid |stdinbpl.128:140|
 :skolemid |19|
 :pattern ( (MapType2Select (MapType1Select ExhaleHeap@@12 null (WandMaskField pm_f_1@@2)) o2_1@@2 f_4@@3))
))))
 :qid |stdinbpl.126:19|
 :skolemid |20|
 :pattern ( (IdenticalOnKnownLocationsLiberal Heap@@49 ExhaleHeap@@12 Mask@@31) (IsWandField pm_f_1@@2) (MapType1Select ExhaleHeap@@12 null (WandMaskField pm_f_1@@2)))
)))
(assert (forall ((a@@35 Int) ) (!  (=> (< a@@35 0) (= (|Math#clip| a@@35) 0))
 :qid |stdinbpl.701:15|
 :skolemid |103|
 :pattern ( (|Math#clip| a@@35))
)))
(assert (forall ((args_1 T@U) ) (!  (=> (= (type args_1) (SeqType PyTypeDomainTypeType)) (and (=> (forall ((e T@U) ) (!  (=> (and (= (type e) PyTypeDomainTypeType) (|Seq#Contains| args_1 e)) (= e object))
 :qid |stdinbpl.1243:12|
 :skolemid |178|
 :pattern ( (|Seq#ContainsTrigger| args_1 e))
 :pattern ( (|Seq#Contains| args_1 e))
)) (extends_ (tuple args_1) object)) (= (get_basic (tuple args_1)) tuple_basic)))
 :qid |stdinbpl.1241:15|
 :skolemid |179|
 :pattern ( (tuple args_1))
)))
(assert (forall ((arg_1_1@@6 T@U) (arg_2_1@@4 T@U) (X@@6 T@U) ) (!  (=> (and (and (= (type arg_1_1@@6) PyTypeDomainTypeType) (= (type arg_2_1@@4) PyTypeDomainTypeType)) (= (type X@@6) PyTypeDomainTypeType)) (= (issubtype X@@6 (union_type_2 arg_1_1@@6 arg_2_1@@4))  (or (issubtype X@@6 arg_1_1@@6) (issubtype X@@6 arg_2_1@@4))))
 :qid |stdinbpl.1130:15|
 :skolemid |164|
 :pattern ( (issubtype X@@6 (union_type_2 arg_1_1@@6 arg_2_1@@4)))
)))
(assert (forall ((sub_1@@1 T@U) (super_1@@0 T@U) ) (!  (=> (and (and (= (type sub_1@@1) PyTypeDomainTypeType) (= (type super_1@@0) PyTypeDomainTypeType)) (and (issubtype sub_1@@1 super_1@@0) (not (= sub_1@@1 super_1@@0)))) (not (issubtype super_1@@0 sub_1@@1)))
 :qid |stdinbpl.1091:15|
 :skolemid |157|
 :pattern ( (issubtype sub_1@@1 super_1@@0))
 :pattern ( (issubtype super_1@@0 sub_1@@1))
)))
(assert (forall ((s@@19 T@U) ) (! (let ((T@@85 (SeqTypeInv0 (type s@@19))))
 (=> (and (= (type s@@19) (SeqType T@@85)) (= (|Seq#Length| s@@19) 0)) (= s@@19 (|Seq#Empty| T@@85))))
 :qid |stdinbpl.263:18|
 :skolemid |36|
 :pattern ( (|Seq#Length| s@@19))
)))
(assert (forall ((s@@20 T@U) (n@@12 Int) ) (! (let ((T@@86 (SeqTypeInv0 (type s@@20))))
 (=> (and (= (type s@@20) (SeqType T@@86)) (<= n@@12 0)) (= (|Seq#Take| s@@20 n@@12) (|Seq#Empty| T@@86))))
 :qid |stdinbpl.438:18|
 :skolemid |58|
 :pattern ( (|Seq#Take| s@@20 n@@12))
)))
(assert (forall ((sub_1@@2 T@U) (middle T@U) (super_1@@1 T@U) ) (!  (=> (and (and (and (= (type sub_1@@2) PyTypeDomainTypeType) (= (type middle) PyTypeDomainTypeType)) (= (type super_1@@1) PyTypeDomainTypeType)) (and (issubtype sub_1@@2 middle) (issubtype middle super_1@@1))) (issubtype sub_1@@2 super_1@@1))
 :qid |stdinbpl.1055:15|
 :skolemid |151|
 :pattern ( (issubtype sub_1@@2 middle) (issubtype middle super_1@@1))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
(assert (forall ((sub_1@@3 T@U) (middle@@0 T@U) (super_1@@2 T@U) ) (!  (=> (and (and (and (= (type sub_1@@3) PyTypeDomainTypeType) (= (type middle@@0) PyTypeDomainTypeType)) (= (type super_1@@2) PyTypeDomainTypeType)) (and (issubtype sub_1@@3 middle@@0) (isnotsubtype middle@@0 super_1@@2))) (not (issubtype sub_1@@3 super_1@@2)))
 :qid |stdinbpl.1097:15|
 :skolemid |158|
 :pattern ( (issubtype sub_1@@3 middle@@0) (isnotsubtype middle@@0 super_1@@2))
)))
(assert (forall ((a@@36 T@U) (x@@23 T@U) (o@@15 T@U) ) (! (let ((T@@87 (type x@@23)))
 (=> (and (= (type a@@36) (MultiSetType T@@87)) (= (type o@@15) T@@87)) (= (|MultiSet#Select| (|MultiSet#UnionOne| a@@36 x@@23) o@@15) (ite (= x@@23 o@@15) (+ (|MultiSet#Select| a@@36 o@@15) 1) (|MultiSet#Select| a@@36 o@@15)))))
 :qid |stdinbpl.734:18|
 :skolemid |112|
 :pattern ( (|MultiSet#Select| (|MultiSet#UnionOne| a@@36 x@@23) o@@15))
 :pattern ( (|MultiSet#UnionOne| a@@36 x@@23) (|MultiSet#Select| a@@36 o@@15))
)))
(assert (forall ((a@@37 T@U) (b@@27 T@U) ) (! (let ((T@@88 (MultiSetTypeInv0 (type a@@37))))
 (=> (and (= (type a@@37) (MultiSetType T@@88)) (= (type b@@27) (MultiSetType T@@88))) (= (|MultiSet#Equal| a@@37 b@@27) (forall ((o@@16 T@U) ) (!  (=> (= (type o@@16) T@@88) (= (|MultiSet#Select| a@@37 o@@16) (|MultiSet#Select| b@@27 o@@16)))
 :qid |stdinbpl.780:36|
 :skolemid |125|
 :pattern ( (|MultiSet#Select| a@@37 o@@16))
 :pattern ( (|MultiSet#Select| b@@27 o@@16))
)))))
 :qid |stdinbpl.779:17|
 :skolemid |126|
 :pattern ( (|MultiSet#Equal| a@@37 b@@27))
)))
(assert (forall ((a@@38 T@U) (b@@28 T@U) ) (! (let ((T@@89 (MultiSetTypeInv0 (type a@@38))))
 (=> (and (= (type a@@38) (MultiSetType T@@89)) (= (type b@@28) (MultiSetType T@@89))) (= (|MultiSet#Subset| a@@38 b@@28) (forall ((o@@17 T@U) ) (!  (=> (= (type o@@17) T@@89) (<= (|MultiSet#Select| a@@38 o@@17) (|MultiSet#Select| b@@28 o@@17)))
 :qid |stdinbpl.776:37|
 :skolemid |123|
 :pattern ( (|MultiSet#Select| a@@38 o@@17))
 :pattern ( (|MultiSet#Select| b@@28 o@@17))
)))))
 :qid |stdinbpl.775:17|
 :skolemid |124|
 :pattern ( (|MultiSet#Subset| a@@38 b@@28))
)))
(assert (forall ((a@@39 T@U) (b@@29 T@U) (o@@18 T@U) ) (! (let ((T@@90 (type o@@18)))
 (=> (and (= (type a@@39) (MapType0Type T@@90 boolType)) (= (type b@@29) (MapType0Type T@@90 boolType))) (= (U_2_bool (MapType0Select (|Set#Union| a@@39 b@@29) o@@18))  (or (U_2_bool (MapType0Select a@@39 o@@18)) (U_2_bool (MapType0Select b@@29 o@@18))))))
 :qid |stdinbpl.634:18|
 :skolemid |82|
 :pattern ( (MapType0Select (|Set#Union| a@@39 b@@29) o@@18))
)))
(assert (forall ((arg0@@105 T@U) (arg1@@55 Int) ) (! (= (type (tuple_arg arg0@@105 arg1@@55)) PyTypeDomainTypeType)
 :qid |funType:tuple_arg|
 :pattern ( (tuple_arg arg0@@105 arg1@@55))
)))
(assert (forall ((seq@@0 T@U) (i@@9 Int) (Z@@8 T@U) ) (!  (=> (and (and (= (type seq@@0) (SeqType PyTypeDomainTypeType)) (= (type Z@@8) PyTypeDomainTypeType)) (issubtype Z@@8 (tuple seq@@0))) (issubtype (tuple_arg Z@@8 i@@9) (|Seq#Index| seq@@0 i@@9)))
 :qid |stdinbpl.1103:15|
 :skolemid |159|
 :pattern ( (tuple seq@@0) (tuple_arg Z@@8 i@@9))
)))
(assert (forall ((Heap@@50 T@U) (self@@2 Int) (other@@2 Int) ) (!  (=> (= (type Heap@@50) (MapType1Type RefType)) (and (= (int___gt__ Heap@@50 self@@2 other@@2) (|int___gt__'| Heap@@50 self@@2 other@@2)) (dummyFunction (bool_2_U (|int___gt__#triggerStateless| self@@2 other@@2)))))
 :qid |stdinbpl.1922:15|
 :skolemid |231|
 :pattern ( (int___gt__ Heap@@50 self@@2 other@@2))
)))
(assert (forall ((m@@23 T@U) (|m'@@2| T@U) ) (! (let ((V@@16 (MapTypeInv1 (type m@@23))))
(let ((U@@16 (MapTypeInv0 (type m@@23))))
 (=> (and (and (= (type m@@23) (MapType U@@16 V@@16)) (= (type |m'@@2|) (MapType U@@16 V@@16))) (not (|Map#Disjoint| m@@23 |m'@@2|))) (exists ((o@@19 T@U) ) (!  (and (= (type o@@19) U@@16) (and (U_2_bool (MapType0Select (|Map#Domain| m@@23) o@@19)) (U_2_bool (MapType0Select (|Map#Domain| |m'@@2|) o@@19))))
 :qid |stdinbpl.890:38|
 :skolemid |149|
 :pattern ( (MapType0Select (|Map#Domain| m@@23) o@@19))
 :pattern ( (MapType0Select (|Map#Domain| |m'@@2|) o@@19))
)))))
 :qid |stdinbpl.888:21|
 :skolemid |150|
 :pattern ( (|Map#Disjoint| m@@23 |m'@@2|))
)))
(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun Result () T@U)
(declare-fun Heap@@51 () T@U)
(assert  (and (= (type Result) RefType) (= (type Heap@@51) (MapType1Type RefType))))
(set-info :boogie-vc-id |__prim__int___box__#definedness|)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 5) (let ((anon3_Else_correct true))
(let ((anon3_Then_correct  (=> (= (ControlFlow 0 2) (- 0 1)) (issubtype (typeof Result) vint))))
(let ((anon0_correct  (=> (state Heap@@51 ZeroMask) (=> (and (and (= AssumeFunctionsAbove 0) (= (typeof Result) vint)) (and (state Heap@@51 ZeroMask) (state Heap@@51 ZeroMask))) (and (=> (= (ControlFlow 0 4) 2) anon3_Then_correct) (=> (= (ControlFlow 0 4) 3) anon3_Else_correct))))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 5) 4) anon0_correct)))
PreconditionGeneratedEntry_correct)))))
))
(check-sat)
(pop 1)
; Valid
(get-info :rlimit)
