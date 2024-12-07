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
(declare-fun __prim__perm () T@U)
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
(declare-fun Node () T@U)
(declare-fun list_acc () T@U)
(declare-fun Node_function_name () T@U)
(declare-fun Node_children () T@U)
(declare-fun FieldType (T@T T@T) T@T)
(declare-fun FieldTypeInv0 (T@T) T@T)
(declare-fun FieldTypeInv1 (T@T) T@T)
(declare-fun NormalFieldType () T@T)
(declare-fun PyTypeDomainTypeType () T@T)
(declare-fun SeqType (T@T) T@T)
(declare-fun SeqTypeInv0 (T@T) T@T)
(declare-fun RefType () T@T)
(declare-fun |Seq#Length| (T@U) Int)
(declare-fun |Seq#Drop| (T@U Int) T@U)
(declare-fun issubtype (T@U T@U) Bool)
(declare-fun state (T@U T@U) Bool)
(declare-fun |int___ge__'| (T@U Int Int) Bool)
(declare-fun MapType0Type (T@T) T@T)
(declare-fun MapType1Type (T@T T@T) T@T)
(declare-fun |int___ge__#frame| (T@U Int Int) Bool)
(declare-fun EmptyFrame () T@U)
(declare-fun MapType0TypeInv0 (T@T) T@T)
(declare-fun MapType0Select (T@U T@U T@U) T@U)
(declare-fun MapType0Store (T@U T@U T@U T@U) T@U)
(declare-fun MapType1TypeInv0 (T@T) T@T)
(declare-fun MapType1TypeInv1 (T@T) T@T)
(declare-fun MapType1Select (T@U T@U T@U) T@U)
(declare-fun MapType1Store (T@U T@U T@U T@U) T@U)
(declare-fun FrameTypeType () T@T)
(declare-fun |int___lt__'| (T@U Int Int) Bool)
(declare-fun |int___lt__#frame| (T@U Int Int) Bool)
(declare-fun succHeap (T@U T@U) Bool)
(declare-fun succHeapTrans (T@U T@U) Bool)
(declare-fun GoodMask (T@U) Bool)
(declare-fun dummyFunction (T@U) Bool)
(declare-fun |int___ge__#triggerStateless| (Int Int) Bool)
(declare-fun |int___lt__#triggerStateless| (Int Int) Bool)
(declare-fun |list___getitem__'| (T@U T@U T@U) T@U)
(declare-fun |list___getitem__#triggerStateless| (T@U T@U) T@U)
(declare-fun |Seq#Index| (T@U Int) T@U)
(declare-fun |Seq#Sub| (Int Int) Int)
(declare-fun |Seq#Add| (Int Int) Int)
(declare-fun IdenticalOnKnownLocations (T@U T@U T@U) Bool)
(declare-fun IsPredicateField (T@U) Bool)
(declare-fun null () T@U)
(declare-fun PredicateMaskField (T@U) T@U)
(declare-fun HasDirectPerm (T@U T@U T@U) Bool)
(declare-fun IsWandField (T@U) Bool)
(declare-fun WandMaskField (T@U) T@U)
(declare-fun |__prim__int___box__'| (T@U Int) T@U)
(declare-fun |__prim__int___box__#triggerStateless| (Int) T@U)
(declare-fun |int___unbox__'| (T@U T@U) Int)
(declare-fun |int___unbox__#triggerStateless| (T@U) Int)
(declare-fun |list___len__'| (T@U T@U) Int)
(declare-fun |list___len__#triggerStateless| (T@U) Int)
(declare-fun |Seq#Update| (T@U Int T@U) T@U)
(declare-fun |Seq#Take| (T@U Int) T@U)
(declare-fun |Seq#Contains| (T@U T@U) Bool)
(declare-fun |Seq#Range| (Int Int) T@U)
(declare-fun |Seq#Skolem| (T@U T@U) Int)
(declare-fun __prim__int___box__ (T@U Int) T@U)
(declare-fun int___unbox__ (T@U T@U) Int)
(declare-fun list___len__ (T@U T@U) Int)
(declare-fun AssumeFunctionsAbove () Int)
(declare-fun |__prim__int___box__#trigger| (T@U Int) Bool)
(declare-fun extends_ (T@U T@U) Bool)
(declare-fun get_basic (T@U) T@U)
(declare-fun |Seq#Singleton| (T@U) T@U)
(declare-fun |Seq#Empty| (T@T) T@U)
(declare-fun dummyHeap () T@U)
(declare-fun ZeroMask () T@U)
(declare-fun InsidePredicate (T@U T@U T@U T@U) Bool)
(declare-fun |Seq#Append| (T@U T@U) T@U)
(declare-fun sumMask (T@U T@U T@U) Bool)
(declare-fun ConditionalFrame (Real T@U) T@U)
(declare-fun NoPerm () Real)
(declare-fun list___getitem__ (T@U T@U T@U) T@U)
(declare-fun |Seq#Equal| (T@U T@U) Bool)
(declare-fun |Seq#ContainsTrigger| (T@U T@U) Bool)
(declare-fun |int___unbox__#trigger| (T@U T@U) Bool)
(declare-fun typeof (T@U) T@U)
(declare-fun FullPerm () Real)
(declare-fun |__prim__int___box__#frame| (T@U Int) T@U)
(declare-fun |int___unbox__#frame| (T@U T@U) Int)
(declare-fun |list___len__#frame| (T@U T@U) Int)
(declare-fun FrameFragment (T@U) T@U)
(declare-fun |list___getitem__#frame| (T@U T@U T@U) T@U)
(declare-fun CombineFrames (T@U T@U) T@U)
(declare-fun int___lt__ (T@U Int Int) Bool)
(declare-fun isnotsubtype (T@U T@U) Bool)
(declare-fun list (T@U) T@U)
(declare-fun ZeroPMask () T@U)
(declare-fun |Seq#SkolemDiff| (T@U T@U) Int)
(declare-fun int___ge__ (T@U Int Int) Bool)
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
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (forall ((arg0@@11 T@T) (arg1 T@T) ) (! (= (Ctor (FieldType arg0@@11 arg1)) 6)
 :qid |ctor:FieldType|
)) (forall ((arg0@@12 T@T) (arg1@@0 T@T) ) (! (= (FieldTypeInv0 (FieldType arg0@@12 arg1@@0)) arg0@@12)
 :qid |typeInv:FieldTypeInv0|
 :pattern ( (FieldType arg0@@12 arg1@@0))
))) (forall ((arg0@@13 T@T) (arg1@@1 T@T) ) (! (= (FieldTypeInv1 (FieldType arg0@@13 arg1@@1)) arg1@@1)
 :qid |typeInv:FieldTypeInv1|
 :pattern ( (FieldType arg0@@13 arg1@@1))
))) (= (Ctor NormalFieldType) 7)) (= (type $allocated) (FieldType NormalFieldType boolType))) (= (Ctor PyTypeDomainTypeType) 8)) (= (type object) PyTypeDomainTypeType)) (= (type list_basic) PyTypeDomainTypeType)) (= (type set_basic) PyTypeDomainTypeType)) (= (type dict_basic) PyTypeDomainTypeType)) (= (type vint) PyTypeDomainTypeType)) (= (type float) PyTypeDomainTypeType)) (= (type vbool) PyTypeDomainTypeType)) (= (type NoneType) PyTypeDomainTypeType)) (= (type Exception) PyTypeDomainTypeType)) (= (type ConnectionRefusedError) PyTypeDomainTypeType)) (= (type traceback) PyTypeDomainTypeType)) (= (type str) PyTypeDomainTypeType)) (= (type bytes) PyTypeDomainTypeType)) (= (type __prim__perm) PyTypeDomainTypeType)) (= (type PSeq_basic) PyTypeDomainTypeType)) (= (type PSet_basic) PyTypeDomainTypeType)) (= (type PMultiset_basic) PyTypeDomainTypeType)) (= (type slice) PyTypeDomainTypeType)) (= (type range_0) PyTypeDomainTypeType)) (= (type Iterator_basic) PyTypeDomainTypeType)) (= (type Thread_0) PyTypeDomainTypeType)) (= (type LevelType) PyTypeDomainTypeType)) (= (type vtype) PyTypeDomainTypeType)) (= (type Place) PyTypeDomainTypeType)) (= (type __prim__Seq_type) PyTypeDomainTypeType)) (= (type Node) PyTypeDomainTypeType)) (forall ((arg0@@14 T@T) ) (! (= (Ctor (SeqType arg0@@14)) 9)
 :qid |ctor:SeqType|
))) (forall ((arg0@@15 T@T) ) (! (= (SeqTypeInv0 (SeqType arg0@@15)) arg0@@15)
 :qid |typeInv:SeqTypeInv0|
 :pattern ( (SeqType arg0@@15))
))) (= (Ctor RefType) 10)) (= (type list_acc) (FieldType NormalFieldType (SeqType RefType)))) (= (type Node_function_name) (FieldType NormalFieldType RefType))) (= (type Node_children) (FieldType NormalFieldType RefType))))
(assert (distinct $allocated object list_basic set_basic dict_basic vint float vbool NoneType Exception ConnectionRefusedError traceback str bytes __prim__perm PSeq_basic PSet_basic PMultiset_basic slice range_0 Iterator_basic Thread_0 LevelType vtype Place __prim__Seq_type Node list_acc Node_function_name Node_children)
)
(assert (forall ((arg0@@16 T@U) (arg1@@2 Int) ) (! (let ((T (SeqTypeInv0 (type arg0@@16))))
(= (type (|Seq#Drop| arg0@@16 arg1@@2)) (SeqType T)))
 :qid |funType:Seq#Drop|
 :pattern ( (|Seq#Drop| arg0@@16 arg1@@2))
)))
(assert (forall ((s T@U) (n Int) ) (! (let ((T@@0 (SeqTypeInv0 (type s))))
 (=> (= (type s) (SeqType T@@0)) (and (=> (<= 0 n) (and (=> (<= n (|Seq#Length| s)) (= (|Seq#Length| (|Seq#Drop| s n)) (- (|Seq#Length| s) n))) (=> (< (|Seq#Length| s) n) (= (|Seq#Length| (|Seq#Drop| s n)) 0)))) (=> (< n 0) (= (|Seq#Length| (|Seq#Drop| s n)) (|Seq#Length| s))))))
 :qid |stdinbpl.293:18|
 :skolemid |38|
 :pattern ( (|Seq#Length| (|Seq#Drop| s n)))
 :pattern ( (|Seq#Length| s) (|Seq#Drop| s n))
)))
(assert (forall ((type_ T@U) ) (!  (=> (= (type type_) PyTypeDomainTypeType) (issubtype type_ type_))
 :qid |stdinbpl.717:15|
 :skolemid |59|
 :pattern ( (issubtype type_ type_))
)))
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (and (and (forall ((arg0@@17 T@T) ) (! (= (Ctor (MapType0Type arg0@@17)) 11)
 :qid |ctor:MapType0Type|
)) (forall ((arg0@@18 T@T) ) (! (= (MapType0TypeInv0 (MapType0Type arg0@@18)) arg0@@18)
 :qid |typeInv:MapType0TypeInv0|
 :pattern ( (MapType0Type arg0@@18))
))) (forall ((arg0@@19 T@U) (arg1@@3 T@U) (arg2 T@U) ) (! (let ((B (FieldTypeInv1 (type arg2))))
(= (type (MapType0Select arg0@@19 arg1@@3 arg2)) B))
 :qid |funType:MapType0Select|
 :pattern ( (MapType0Select arg0@@19 arg1@@3 arg2))
))) (forall ((arg0@@20 T@U) (arg1@@4 T@U) (arg2@@0 T@U) (arg3 T@U) ) (! (let ((aVar0 (type arg1@@4)))
(= (type (MapType0Store arg0@@20 arg1@@4 arg2@@0 arg3)) (MapType0Type aVar0)))
 :qid |funType:MapType0Store|
 :pattern ( (MapType0Store arg0@@20 arg1@@4 arg2@@0 arg3))
))) (forall ((m T@U) (x0 T@U) (x1 T@U) (val T@U) ) (! (let ((B@@0 (FieldTypeInv1 (type x1))))
 (=> (= (type val) B@@0) (= (MapType0Select (MapType0Store m x0 x1 val) x0 x1) val)))
 :qid |mapAx0:MapType0Select|
 :weight 0
))) (and (and (forall ((val@@0 T@U) (m@@0 T@U) (x0@@0 T@U) (x1@@0 T@U) (y0 T@U) (y1 T@U) ) (!  (or (= x0@@0 y0) (= (MapType0Select (MapType0Store m@@0 x0@@0 x1@@0 val@@0) y0 y1) (MapType0Select m@@0 y0 y1)))
 :qid |mapAx1:MapType0Select:0|
 :weight 0
)) (forall ((val@@1 T@U) (m@@1 T@U) (x0@@1 T@U) (x1@@1 T@U) (y0@@0 T@U) (y1@@0 T@U) ) (!  (or (= x1@@1 y1@@0) (= (MapType0Select (MapType0Store m@@1 x0@@1 x1@@1 val@@1) y0@@0 y1@@0) (MapType0Select m@@1 y0@@0 y1@@0)))
 :qid |mapAx1:MapType0Select:1|
 :weight 0
))) (forall ((val@@2 T@U) (m@@2 T@U) (x0@@2 T@U) (x1@@2 T@U) (y0@@1 T@U) (y1@@1 T@U) ) (!  (or true (= (MapType0Select (MapType0Store m@@2 x0@@2 x1@@2 val@@2) y0@@1 y1@@1) (MapType0Select m@@2 y0@@1 y1@@1)))
 :qid |mapAx2:MapType0Select|
 :weight 0
)))) (forall ((arg0@@21 T@T) (arg1@@5 T@T) ) (! (= (Ctor (MapType1Type arg0@@21 arg1@@5)) 12)
 :qid |ctor:MapType1Type|
))) (forall ((arg0@@22 T@T) (arg1@@6 T@T) ) (! (= (MapType1TypeInv0 (MapType1Type arg0@@22 arg1@@6)) arg0@@22)
 :qid |typeInv:MapType1TypeInv0|
 :pattern ( (MapType1Type arg0@@22 arg1@@6))
))) (forall ((arg0@@23 T@T) (arg1@@7 T@T) ) (! (= (MapType1TypeInv1 (MapType1Type arg0@@23 arg1@@7)) arg1@@7)
 :qid |typeInv:MapType1TypeInv1|
 :pattern ( (MapType1Type arg0@@23 arg1@@7))
))) (forall ((arg0@@24 T@U) (arg1@@8 T@U) (arg2@@1 T@U) ) (! (let ((aVar1 (MapType1TypeInv1 (type arg0@@24))))
(= (type (MapType1Select arg0@@24 arg1@@8 arg2@@1)) aVar1))
 :qid |funType:MapType1Select|
 :pattern ( (MapType1Select arg0@@24 arg1@@8 arg2@@1))
))) (forall ((arg0@@25 T@U) (arg1@@9 T@U) (arg2@@2 T@U) (arg3@@0 T@U) ) (! (let ((aVar1@@0 (type arg3@@0)))
(let ((aVar0@@0 (type arg1@@9)))
(= (type (MapType1Store arg0@@25 arg1@@9 arg2@@2 arg3@@0)) (MapType1Type aVar0@@0 aVar1@@0))))
 :qid |funType:MapType1Store|
 :pattern ( (MapType1Store arg0@@25 arg1@@9 arg2@@2 arg3@@0))
))) (forall ((m@@3 T@U) (x0@@3 T@U) (x1@@3 T@U) (val@@3 T@U) ) (! (let ((aVar1@@1 (MapType1TypeInv1 (type m@@3))))
 (=> (= (type val@@3) aVar1@@1) (= (MapType1Select (MapType1Store m@@3 x0@@3 x1@@3 val@@3) x0@@3 x1@@3) val@@3)))
 :qid |mapAx0:MapType1Select|
 :weight 0
))) (and (and (forall ((val@@4 T@U) (m@@4 T@U) (x0@@4 T@U) (x1@@4 T@U) (y0@@2 T@U) (y1@@2 T@U) ) (!  (or (= x0@@4 y0@@2) (= (MapType1Select (MapType1Store m@@4 x0@@4 x1@@4 val@@4) y0@@2 y1@@2) (MapType1Select m@@4 y0@@2 y1@@2)))
 :qid |mapAx1:MapType1Select:0|
 :weight 0
)) (forall ((val@@5 T@U) (m@@5 T@U) (x0@@5 T@U) (x1@@5 T@U) (y0@@3 T@U) (y1@@3 T@U) ) (!  (or (= x1@@5 y1@@3) (= (MapType1Select (MapType1Store m@@5 x0@@5 x1@@5 val@@5) y0@@3 y1@@3) (MapType1Select m@@5 y0@@3 y1@@3)))
 :qid |mapAx1:MapType1Select:1|
 :weight 0
))) (forall ((val@@6 T@U) (m@@6 T@U) (x0@@6 T@U) (x1@@6 T@U) (y0@@4 T@U) (y1@@4 T@U) ) (!  (or true (= (MapType1Select (MapType1Store m@@6 x0@@6 x1@@6 val@@6) y0@@4 y1@@4) (MapType1Select m@@6 y0@@4 y1@@4)))
 :qid |mapAx2:MapType1Select|
 :weight 0
)))) (= (Ctor FrameTypeType) 13)) (= (type EmptyFrame) FrameTypeType)))
(assert (forall ((Heap T@U) (Mask T@U) (self Int) (other Int) ) (!  (=> (and (and (= (type Heap) (MapType0Type RefType)) (= (type Mask) (MapType1Type RefType realType))) (state Heap Mask)) (= (|int___ge__'| Heap self other) (|int___ge__#frame| EmptyFrame self other)))
 :qid |stdinbpl.927:15|
 :skolemid |76|
 :pattern ( (state Heap Mask) (|int___ge__'| Heap self other))
)))
(assert (forall ((Heap@@0 T@U) (Mask@@0 T@U) (self@@0 Int) (other@@0 Int) ) (!  (=> (and (and (= (type Heap@@0) (MapType0Type RefType)) (= (type Mask@@0) (MapType1Type RefType realType))) (state Heap@@0 Mask@@0)) (= (|int___lt__'| Heap@@0 self@@0 other@@0) (|int___lt__#frame| EmptyFrame self@@0 other@@0)))
 :qid |stdinbpl.976:15|
 :skolemid |80|
 :pattern ( (state Heap@@0 Mask@@0) (|int___lt__'| Heap@@0 self@@0 other@@0))
)))
(assert (forall ((Heap0 T@U) (Heap1 T@U) ) (!  (=> (and (and (= (type Heap0) (MapType0Type RefType)) (= (type Heap1) (MapType0Type RefType))) (succHeap Heap0 Heap1)) (succHeapTrans Heap0 Heap1))
 :qid |stdinbpl.88:15|
 :skolemid |11|
 :pattern ( (succHeap Heap0 Heap1))
)))
(assert (forall ((Heap@@1 T@U) (Mask@@1 T@U) ) (!  (=> (and (and (= (type Heap@@1) (MapType0Type RefType)) (= (type Mask@@1) (MapType1Type RefType realType))) (state Heap@@1 Mask@@1)) (GoodMask Mask@@1))
 :qid |stdinbpl.124:15|
 :skolemid |15|
 :pattern ( (state Heap@@1 Mask@@1))
)))
(assert (forall ((Heap0@@0 T@U) (Heap1@@0 T@U) (Heap2 T@U) ) (!  (=> (and (and (and (= (type Heap0@@0) (MapType0Type RefType)) (= (type Heap1@@0) (MapType0Type RefType))) (= (type Heap2) (MapType0Type RefType))) (and (succHeapTrans Heap0@@0 Heap1@@0) (succHeap Heap1@@0 Heap2))) (succHeapTrans Heap0@@0 Heap2))
 :qid |stdinbpl.93:15|
 :skolemid |12|
 :pattern ( (succHeapTrans Heap0@@0 Heap1@@0) (succHeap Heap1@@0 Heap2))
)))
(assert (forall ((Heap@@2 T@U) (self@@1 Int) (other@@1 Int) ) (!  (=> (= (type Heap@@2) (MapType0Type RefType)) (dummyFunction (bool_2_U (|int___ge__#triggerStateless| self@@1 other@@1))))
 :qid |stdinbpl.914:15|
 :skolemid |74|
 :pattern ( (|int___ge__'| Heap@@2 self@@1 other@@1))
)))
(assert (forall ((Heap@@3 T@U) (self@@2 Int) (other@@2 Int) ) (!  (=> (= (type Heap@@3) (MapType0Type RefType)) (dummyFunction (bool_2_U (|int___lt__#triggerStateless| self@@2 other@@2))))
 :qid |stdinbpl.963:15|
 :skolemid |78|
 :pattern ( (|int___lt__'| Heap@@3 self@@2 other@@2))
)))
(assert  (and (forall ((arg0@@26 T@U) (arg1@@10 T@U) (arg2@@3 T@U) ) (! (= (type (|list___getitem__'| arg0@@26 arg1@@10 arg2@@3)) RefType)
 :qid |funType:list___getitem__'|
 :pattern ( (|list___getitem__'| arg0@@26 arg1@@10 arg2@@3))
)) (forall ((arg0@@27 T@U) (arg1@@11 T@U) ) (! (= (type (|list___getitem__#triggerStateless| arg0@@27 arg1@@11)) RefType)
 :qid |funType:list___getitem__#triggerStateless|
 :pattern ( (|list___getitem__#triggerStateless| arg0@@27 arg1@@11))
))))
(assert (forall ((Heap@@4 T@U) (self@@3 T@U) (key T@U) ) (!  (=> (and (and (= (type Heap@@4) (MapType0Type RefType)) (= (type self@@3) RefType)) (= (type key) RefType)) (dummyFunction (|list___getitem__#triggerStateless| self@@3 key)))
 :qid |stdinbpl.1078:15|
 :skolemid |86|
 :pattern ( (|list___getitem__'| Heap@@4 self@@3 key))
)))
(assert (forall ((arg0@@28 T@U) (arg1@@12 Int) ) (! (let ((T@@1 (SeqTypeInv0 (type arg0@@28))))
(= (type (|Seq#Index| arg0@@28 arg1@@12)) T@@1))
 :qid |funType:Seq#Index|
 :pattern ( (|Seq#Index| arg0@@28 arg1@@12))
)))
(assert (forall ((s@@0 T@U) (n@@0 Int) (j Int) ) (! (let ((T@@2 (SeqTypeInv0 (type s@@0))))
 (=> (= (type s@@0) (SeqType T@@2)) (=> (and (and (< 0 n@@0) (<= 0 j)) (< j (- (|Seq#Length| s@@0) n@@0))) (and (= (|Seq#Sub| (|Seq#Add| j n@@0) n@@0) j) (= (|Seq#Index| (|Seq#Drop| s@@0 n@@0) j) (|Seq#Index| s@@0 (|Seq#Add| j n@@0)))))))
 :qid |stdinbpl.314:18|
 :skolemid |39|
 :pattern ( (|Seq#Index| (|Seq#Drop| s@@0 n@@0) j))
)))
(assert  (and (= (type null) RefType) (forall ((arg0@@29 T@U) ) (! (let ((A (FieldTypeInv0 (type arg0@@29))))
(= (type (PredicateMaskField arg0@@29)) (FieldType A (MapType1Type RefType boolType))))
 :qid |funType:PredicateMaskField|
 :pattern ( (PredicateMaskField arg0@@29))
))))
(assert (forall ((Heap@@5 T@U) (ExhaleHeap T@U) (Mask@@2 T@U) (pm_f T@U) ) (! (let ((C (FieldTypeInv0 (type pm_f))))
 (=> (and (and (and (and (and (= (type Heap@@5) (MapType0Type RefType)) (= (type ExhaleHeap) (MapType0Type RefType))) (= (type Mask@@2) (MapType1Type RefType realType))) (= (type pm_f) (FieldType C FrameTypeType))) (IdenticalOnKnownLocations Heap@@5 ExhaleHeap Mask@@2)) (and (HasDirectPerm Mask@@2 null pm_f) (IsPredicateField pm_f))) (= (MapType0Select Heap@@5 null (PredicateMaskField pm_f)) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))))
 :qid |stdinbpl.47:19|
 :skolemid |2|
 :pattern ( (IdenticalOnKnownLocations Heap@@5 ExhaleHeap Mask@@2) (IsPredicateField pm_f) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))
)))
(assert (forall ((arg0@@30 T@U) ) (! (let ((A@@0 (FieldTypeInv0 (type arg0@@30))))
(= (type (WandMaskField arg0@@30)) (FieldType A@@0 (MapType1Type RefType boolType))))
 :qid |funType:WandMaskField|
 :pattern ( (WandMaskField arg0@@30))
)))
(assert (forall ((Heap@@6 T@U) (ExhaleHeap@@0 T@U) (Mask@@3 T@U) (pm_f@@0 T@U) ) (! (let ((C@@0 (FieldTypeInv0 (type pm_f@@0))))
 (=> (and (and (and (and (and (= (type Heap@@6) (MapType0Type RefType)) (= (type ExhaleHeap@@0) (MapType0Type RefType))) (= (type Mask@@3) (MapType1Type RefType realType))) (= (type pm_f@@0) (FieldType C@@0 FrameTypeType))) (IdenticalOnKnownLocations Heap@@6 ExhaleHeap@@0 Mask@@3)) (and (HasDirectPerm Mask@@3 null pm_f@@0) (IsWandField pm_f@@0))) (= (MapType0Select Heap@@6 null (WandMaskField pm_f@@0)) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))))
 :qid |stdinbpl.60:19|
 :skolemid |5|
 :pattern ( (IdenticalOnKnownLocations Heap@@6 ExhaleHeap@@0 Mask@@3) (IsWandField pm_f@@0) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))
)))
(assert  (and (forall ((arg0@@31 T@U) (arg1@@13 Int) ) (! (= (type (|__prim__int___box__'| arg0@@31 arg1@@13)) RefType)
 :qid |funType:__prim__int___box__'|
 :pattern ( (|__prim__int___box__'| arg0@@31 arg1@@13))
)) (forall ((arg0@@32 Int) ) (! (= (type (|__prim__int___box__#triggerStateless| arg0@@32)) RefType)
 :qid |funType:__prim__int___box__#triggerStateless|
 :pattern ( (|__prim__int___box__#triggerStateless| arg0@@32))
))))
(assert (forall ((Heap@@7 T@U) (prim Int) ) (!  (=> (= (type Heap@@7) (MapType0Type RefType)) (dummyFunction (|__prim__int___box__#triggerStateless| prim)))
 :qid |stdinbpl.780:15|
 :skolemid |65|
 :pattern ( (|__prim__int___box__'| Heap@@7 prim))
)))
(assert (forall ((Heap@@8 T@U) (box T@U) ) (!  (=> (and (= (type Heap@@8) (MapType0Type RefType)) (= (type box) RefType)) (dummyFunction (int_2_U (|int___unbox__#triggerStateless| box))))
 :qid |stdinbpl.850:15|
 :skolemid |70|
 :pattern ( (|int___unbox__'| Heap@@8 box))
)))
(assert (forall ((Heap@@9 T@U) (self@@4 T@U) ) (!  (=> (and (= (type Heap@@9) (MapType0Type RefType)) (= (type self@@4) RefType)) (dummyFunction (int_2_U (|list___len__#triggerStateless| self@@4))))
 :qid |stdinbpl.1012:15|
 :skolemid |82|
 :pattern ( (|list___len__'| Heap@@9 self@@4))
)))
(assert (forall ((arg0@@33 T@U) (arg1@@14 Int) (arg2@@4 T@U) ) (! (let ((T@@3 (type arg2@@4)))
(= (type (|Seq#Update| arg0@@33 arg1@@14 arg2@@4)) (SeqType T@@3)))
 :qid |funType:Seq#Update|
 :pattern ( (|Seq#Update| arg0@@33 arg1@@14 arg2@@4))
)))
(assert (forall ((s@@1 T@U) (i Int) (v T@U) (n@@1 Int) ) (! (let ((T@@4 (type v)))
 (=> (= (type s@@1) (SeqType T@@4)) (=> (and (<= 0 n@@1) (< n@@1 (|Seq#Length| s@@1))) (and (=> (= i n@@1) (= (|Seq#Index| (|Seq#Update| s@@1 i v) n@@1) v)) (=> (not (= i n@@1)) (= (|Seq#Index| (|Seq#Update| s@@1 i v) n@@1) (|Seq#Index| s@@1 n@@1)))))))
 :qid |stdinbpl.269:18|
 :skolemid |35|
 :pattern ( (|Seq#Index| (|Seq#Update| s@@1 i v) n@@1))
 :pattern ( (|Seq#Index| s@@1 n@@1) (|Seq#Update| s@@1 i v))
)))
(assert (forall ((arg0@@34 T@U) (arg1@@15 Int) ) (! (let ((T@@5 (SeqTypeInv0 (type arg0@@34))))
(= (type (|Seq#Take| arg0@@34 arg1@@15)) (SeqType T@@5)))
 :qid |funType:Seq#Take|
 :pattern ( (|Seq#Take| arg0@@34 arg1@@15))
)))
(assert (forall ((s@@2 T@U) (n@@2 Int) ) (! (let ((T@@6 (SeqTypeInv0 (type s@@2))))
 (=> (= (type s@@2) (SeqType T@@6)) (and (=> (<= 0 n@@2) (and (=> (<= n@@2 (|Seq#Length| s@@2)) (= (|Seq#Length| (|Seq#Take| s@@2 n@@2)) n@@2)) (=> (< (|Seq#Length| s@@2) n@@2) (= (|Seq#Length| (|Seq#Take| s@@2 n@@2)) (|Seq#Length| s@@2))))) (=> (< n@@2 0) (= (|Seq#Length| (|Seq#Take| s@@2 n@@2)) 0)))))
 :qid |stdinbpl.280:18|
 :skolemid |36|
 :pattern ( (|Seq#Length| (|Seq#Take| s@@2 n@@2)))
 :pattern ( (|Seq#Take| s@@2 n@@2) (|Seq#Length| s@@2))
)))
(assert (forall ((arg0@@35 Int) (arg1@@16 Int) ) (! (= (type (|Seq#Range| arg0@@35 arg1@@16)) (SeqType intType))
 :qid |funType:Seq#Range|
 :pattern ( (|Seq#Range| arg0@@35 arg1@@16))
)))
(assert (forall ((q@min Int) (q@max Int) (v@@0 T@U) ) (!  (=> (= (type v@@0) intType) (= (|Seq#Contains| (|Seq#Range| q@min q@max) v@@0)  (and (<= q@min (U_2_int v@@0)) (< (U_2_int v@@0) q@max))))
 :qid |stdinbpl.553:15|
 :skolemid |57|
 :pattern ( (|Seq#Contains| (|Seq#Range| q@min q@max) v@@0))
)))
(assert (forall ((s@@3 T@U) (x@@8 T@U) ) (! (let ((T@@7 (type x@@8)))
 (=> (and (= (type s@@3) (SeqType T@@7)) (|Seq#Contains| s@@3 x@@8)) (and (and (<= 0 (|Seq#Skolem| s@@3 x@@8)) (< (|Seq#Skolem| s@@3 x@@8) (|Seq#Length| s@@3))) (= (|Seq#Index| s@@3 (|Seq#Skolem| s@@3 x@@8)) x@@8))))
 :qid |stdinbpl.411:18|
 :skolemid |47|
 :pattern ( (|Seq#Contains| s@@3 x@@8))
)))
(assert (forall ((Heap@@10 T@U) (ExhaleHeap@@1 T@U) (Mask@@4 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@10) (MapType0Type RefType)) (= (type ExhaleHeap@@1) (MapType0Type RefType))) (= (type Mask@@4) (MapType1Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@10 ExhaleHeap@@1 Mask@@4)) (U_2_bool (MapType0Select Heap@@10 o_1 $allocated))) (U_2_bool (MapType0Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.73:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@10 ExhaleHeap@@1 Mask@@4) (MapType0Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert (forall ((arg0@@36 T@U) (arg1@@17 Int) ) (! (= (type (__prim__int___box__ arg0@@36 arg1@@17)) RefType)
 :qid |funType:__prim__int___box__|
 :pattern ( (__prim__int___box__ arg0@@36 arg1@@17))
)))
(assert (forall ((Heap@@11 T@U) (prim@@0 Int) ) (!  (=> (= (type Heap@@11) (MapType0Type RefType)) (and (= (__prim__int___box__ Heap@@11 prim@@0) (|__prim__int___box__'| Heap@@11 prim@@0)) (dummyFunction (|__prim__int___box__#triggerStateless| prim@@0))))
 :qid |stdinbpl.776:15|
 :skolemid |64|
 :pattern ( (__prim__int___box__ Heap@@11 prim@@0))
)))
(assert (forall ((Heap@@12 T@U) (box@@0 T@U) ) (!  (=> (and (= (type Heap@@12) (MapType0Type RefType)) (= (type box@@0) RefType)) (and (= (int___unbox__ Heap@@12 box@@0) (|int___unbox__'| Heap@@12 box@@0)) (dummyFunction (int_2_U (|int___unbox__#triggerStateless| box@@0)))))
 :qid |stdinbpl.846:15|
 :skolemid |69|
 :pattern ( (int___unbox__ Heap@@12 box@@0))
)))
(assert (forall ((Heap@@13 T@U) (self@@5 T@U) ) (!  (=> (and (= (type Heap@@13) (MapType0Type RefType)) (= (type self@@5) RefType)) (and (= (list___len__ Heap@@13 self@@5) (|list___len__'| Heap@@13 self@@5)) (dummyFunction (int_2_U (|list___len__#triggerStateless| self@@5)))))
 :qid |stdinbpl.1008:15|
 :skolemid |81|
 :pattern ( (list___len__ Heap@@13 self@@5))
)))
(assert (forall ((s@@4 T@U) (n@@3 Int) ) (! (let ((T@@8 (SeqTypeInv0 (type s@@4))))
 (=> (and (= (type s@@4) (SeqType T@@8)) (<= n@@3 0)) (= (|Seq#Drop| s@@4 n@@3) s@@4)))
 :qid |stdinbpl.395:18|
 :skolemid |45|
 :pattern ( (|Seq#Drop| s@@4 n@@3))
)))
(assert (forall ((i@@0 Int) (j@@0 Int) ) (! (= (|Seq#Sub| i@@0 j@@0) (- i@@0 j@@0))
 :qid |stdinbpl.249:15|
 :skolemid |30|
 :pattern ( (|Seq#Sub| i@@0 j@@0))
)))
(assert (forall ((i@@1 Int) (j@@1 Int) ) (! (= (|Seq#Add| i@@1 j@@1) (+ i@@1 j@@1))
 :qid |stdinbpl.247:15|
 :skolemid |29|
 :pattern ( (|Seq#Add| i@@1 j@@1))
)))
(assert (forall ((Heap@@14 T@U) (Mask@@5 T@U) (prim@@1 Int) ) (!  (=> (and (and (= (type Heap@@14) (MapType0Type RefType)) (= (type Mask@@5) (MapType1Type RefType realType))) (and (state Heap@@14 Mask@@5) (or (< AssumeFunctionsAbove 4) (|__prim__int___box__#trigger| EmptyFrame prim@@1)))) (= (|int___unbox__'| Heap@@14 (|__prim__int___box__'| Heap@@14 prim@@1)) prim@@1))
 :qid |stdinbpl.797:15|
 :skolemid |68|
 :pattern ( (state Heap@@14 Mask@@5) (|__prim__int___box__'| Heap@@14 prim@@1))
)))
(assert (extends_ vint float))
(assert (forall ((arg0@@37 T@U) ) (! (= (type (get_basic arg0@@37)) PyTypeDomainTypeType)
 :qid |funType:get_basic|
 :pattern ( (get_basic arg0@@37))
)))
(assert (= (get_basic vint) vint))
(assert (extends_ float object))
(assert (= (get_basic float) float))
(assert (forall ((arg0@@38 T@U) ) (! (let ((T@@9 (type arg0@@38)))
(= (type (|Seq#Singleton| arg0@@38)) (SeqType T@@9)))
 :qid |funType:Seq#Singleton|
 :pattern ( (|Seq#Singleton| arg0@@38))
)))
(assert (forall ((x@@9 T@U) (y@@1 T@U) ) (! (let ((T@@10 (type x@@9)))
 (=> (= (type y@@1) T@@10) (= (|Seq#Contains| (|Seq#Singleton| x@@9) y@@1) (= x@@9 y@@1))))
 :qid |stdinbpl.536:18|
 :skolemid |54|
 :pattern ( (|Seq#Contains| (|Seq#Singleton| x@@9) y@@1))
)))
(assert (forall ((s@@5 T@U) (n@@4 Int) (j@@2 Int) ) (! (let ((T@@11 (SeqTypeInv0 (type s@@5))))
 (=> (= (type s@@5) (SeqType T@@11)) (=> (and (and (<= 0 j@@2) (< j@@2 n@@4)) (< j@@2 (|Seq#Length| s@@5))) (= (|Seq#Index| (|Seq#Take| s@@5 n@@4) j@@2) (|Seq#Index| s@@5 j@@2)))))
 :qid |stdinbpl.288:18|
 :skolemid |37|
 :pattern ( (|Seq#Index| (|Seq#Take| s@@5 n@@4) j@@2))
 :pattern ( (|Seq#Index| s@@5 j@@2) (|Seq#Take| s@@5 n@@4))
)))
(assert (forall ((Heap@@15 T@U) (ExhaleHeap@@2 T@U) (Mask@@6 T@U) (o_1@@0 T@U) (f_2 T@U) ) (! (let ((B@@1 (FieldTypeInv1 (type f_2))))
(let ((A@@1 (FieldTypeInv0 (type f_2))))
 (=> (and (and (and (and (and (and (= (type Heap@@15) (MapType0Type RefType)) (= (type ExhaleHeap@@2) (MapType0Type RefType))) (= (type Mask@@6) (MapType1Type RefType realType))) (= (type o_1@@0) RefType)) (= (type f_2) (FieldType A@@1 B@@1))) (IdenticalOnKnownLocations Heap@@15 ExhaleHeap@@2 Mask@@6)) (HasDirectPerm Mask@@6 o_1@@0 f_2)) (= (MapType0Select Heap@@15 o_1@@0 f_2) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2)))))
 :qid |stdinbpl.42:22|
 :skolemid |1|
 :pattern ( (IdenticalOnKnownLocations Heap@@15 ExhaleHeap@@2 Mask@@6) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2))
)))
(assert (forall ((T@@12 T@T) ) (! (= (type (|Seq#Empty| T@@12)) (SeqType T@@12))
 :qid |funType:Seq#Empty|
 :pattern ( (|Seq#Empty| T@@12))
)))
(assert (forall ((T@@13 T@T) ) (! (= (|Seq#Length| (|Seq#Empty| T@@13)) 0)
 :skolemid |23|
)))
(assert  (and (= (type dummyHeap) (MapType0Type RefType)) (= (type ZeroMask) (MapType1Type RefType realType))))
(assert (state dummyHeap ZeroMask))
(assert (extends_ vbool vint))
(assert (forall ((p T@U) (v_1 T@U) (w T@U) ) (! (let ((A@@2 (FieldTypeInv0 (type p))))
 (=> (and (and (= (type p) (FieldType A@@2 FrameTypeType)) (= (type v_1) FrameTypeType)) (= (type w) FrameTypeType)) (not (InsidePredicate p v_1 p w))))
 :qid |stdinbpl.192:19|
 :skolemid |21|
 :pattern ( (InsidePredicate p v_1 p w))
)))
(assert (forall ((arg0@@39 T@U) (arg1@@18 T@U) ) (! (let ((T@@14 (SeqTypeInv0 (type arg0@@39))))
(= (type (|Seq#Append| arg0@@39 arg1@@18)) (SeqType T@@14)))
 :qid |funType:Seq#Append|
 :pattern ( (|Seq#Append| arg0@@39 arg1@@18))
)))
(assert (forall ((s0 T@U) (s1 T@U) (n@@5 Int) ) (! (let ((T@@15 (SeqTypeInv0 (type s0))))
 (=> (and (= (type s0) (SeqType T@@15)) (= (type s1) (SeqType T@@15))) (=> (and (and (and (not (= s0 (|Seq#Empty| T@@15))) (not (= s1 (|Seq#Empty| T@@15)))) (<= (|Seq#Length| s0) n@@5)) (< n@@5 (|Seq#Length| (|Seq#Append| s0 s1)))) (and (= (|Seq#Add| (|Seq#Sub| n@@5 (|Seq#Length| s0)) (|Seq#Length| s0)) n@@5) (= (|Seq#Index| (|Seq#Append| s0 s1) n@@5) (|Seq#Index| s1 (|Seq#Sub| n@@5 (|Seq#Length| s0))))))))
 :qid |stdinbpl.260:18|
 :skolemid |32|
 :pattern ( (|Seq#Index| (|Seq#Append| s0 s1) n@@5))
)))
(assert  (not (IsPredicateField list_acc)))
(assert  (not (IsWandField list_acc)))
(assert  (not (IsPredicateField Node_function_name)))
(assert  (not (IsWandField Node_function_name)))
(assert  (not (IsPredicateField Node_children)))
(assert  (not (IsWandField Node_children)))
(assert (forall ((Heap@@16 T@U) (ExhaleHeap@@3 T@U) (Mask@@7 T@U) ) (!  (=> (and (and (and (= (type Heap@@16) (MapType0Type RefType)) (= (type ExhaleHeap@@3) (MapType0Type RefType))) (= (type Mask@@7) (MapType1Type RefType realType))) (IdenticalOnKnownLocations Heap@@16 ExhaleHeap@@3 Mask@@7)) (succHeap Heap@@16 ExhaleHeap@@3))
 :qid |stdinbpl.83:15|
 :skolemid |10|
 :pattern ( (IdenticalOnKnownLocations Heap@@16 ExhaleHeap@@3 Mask@@7))
)))
(assert (forall ((ResultMask T@U) (SummandMask1 T@U) (SummandMask2 T@U) (o_2 T@U) (f_4 T@U) ) (! (let ((B@@2 (FieldTypeInv1 (type f_4))))
(let ((A@@3 (FieldTypeInv0 (type f_4))))
 (=> (and (and (and (and (and (= (type ResultMask) (MapType1Type RefType realType)) (= (type SummandMask1) (MapType1Type RefType realType))) (= (type SummandMask2) (MapType1Type RefType realType))) (= (type o_2) RefType)) (= (type f_4) (FieldType A@@3 B@@2))) (sumMask ResultMask SummandMask1 SummandMask2)) (= (U_2_real (MapType1Select ResultMask o_2 f_4)) (+ (U_2_real (MapType1Select SummandMask1 o_2 f_4)) (U_2_real (MapType1Select SummandMask2 o_2 f_4)))))))
 :qid |stdinbpl.138:22|
 :skolemid |18|
 :pattern ( (sumMask ResultMask SummandMask1 SummandMask2) (MapType1Select ResultMask o_2 f_4))
 :pattern ( (sumMask ResultMask SummandMask1 SummandMask2) (MapType1Select SummandMask1 o_2 f_4))
 :pattern ( (sumMask ResultMask SummandMask1 SummandMask2) (MapType1Select SummandMask2 o_2 f_4))
)))
(assert (forall ((arg0@@40 Real) (arg1@@19 T@U) ) (! (= (type (ConditionalFrame arg0@@40 arg1@@19)) FrameTypeType)
 :qid |funType:ConditionalFrame|
 :pattern ( (ConditionalFrame arg0@@40 arg1@@19))
)))
(assert (forall ((p@@0 Real) (f_6 T@U) ) (!  (=> (= (type f_6) FrameTypeType) (= (ConditionalFrame p@@0 f_6) (ite (> p@@0 0.0) f_6 EmptyFrame)))
 :qid |stdinbpl.180:15|
 :skolemid |19|
 :pattern ( (ConditionalFrame p@@0 f_6))
)))
(assert (forall ((q@min@@0 Int) (q@max@@0 Int) (j@@3 Int) ) (!  (=> (and (<= 0 j@@3) (< j@@3 (- q@max@@0 q@min@@0))) (= (U_2_int (|Seq#Index| (|Seq#Range| q@min@@0 q@max@@0) j@@3)) (+ q@min@@0 j@@3)))
 :qid |stdinbpl.551:15|
 :skolemid |56|
 :pattern ( (|Seq#Index| (|Seq#Range| q@min@@0 q@max@@0) j@@3))
)))
(assert (forall ((Mask@@8 T@U) (o_2@@0 T@U) (f_4@@0 T@U) ) (! (let ((B@@3 (FieldTypeInv1 (type f_4@@0))))
(let ((A@@4 (FieldTypeInv0 (type f_4@@0))))
 (=> (and (and (= (type Mask@@8) (MapType1Type RefType realType)) (= (type o_2@@0) RefType)) (= (type f_4@@0) (FieldType A@@4 B@@3))) (= (HasDirectPerm Mask@@8 o_2@@0 f_4@@0) (> (U_2_real (MapType1Select Mask@@8 o_2@@0 f_4@@0)) NoPerm)))))
 :qid |stdinbpl.133:22|
 :skolemid |17|
 :pattern ( (HasDirectPerm Mask@@8 o_2@@0 f_4@@0))
)))
(assert (forall ((s0@@0 T@U) (s1@@0 T@U) ) (! (let ((T@@16 (SeqTypeInv0 (type s0@@0))))
 (=> (and (and (= (type s0@@0) (SeqType T@@16)) (= (type s1@@0) (SeqType T@@16))) (and (not (= s0@@0 (|Seq#Empty| T@@16))) (not (= s1@@0 (|Seq#Empty| T@@16))))) (= (|Seq#Length| (|Seq#Append| s0@@0 s1@@0)) (+ (|Seq#Length| s0@@0) (|Seq#Length| s1@@0)))))
 :qid |stdinbpl.229:18|
 :skolemid |26|
 :pattern ( (|Seq#Length| (|Seq#Append| s0@@0 s1@@0)))
)))
(assert (forall ((s@@6 T@U) (t T@U) (n@@6 Int) ) (! (let ((T@@17 (SeqTypeInv0 (type s@@6))))
 (=> (and (and (= (type s@@6) (SeqType T@@17)) (= (type t) (SeqType T@@17))) (and (> n@@6 0) (> n@@6 (|Seq#Length| s@@6)))) (and (= (|Seq#Add| (|Seq#Sub| n@@6 (|Seq#Length| s@@6)) (|Seq#Length| s@@6)) n@@6) (= (|Seq#Drop| (|Seq#Append| s@@6 t) n@@6) (|Seq#Drop| t (|Seq#Sub| n@@6 (|Seq#Length| s@@6)))))))
 :qid |stdinbpl.385:18|
 :skolemid |44|
 :pattern ( (|Seq#Drop| (|Seq#Append| s@@6 t) n@@6))
)))
(assert (forall ((arg0@@41 T@U) (arg1@@20 T@U) (arg2@@5 T@U) ) (! (= (type (list___getitem__ arg0@@41 arg1@@20 arg2@@5)) RefType)
 :qid |funType:list___getitem__|
 :pattern ( (list___getitem__ arg0@@41 arg1@@20 arg2@@5))
)))
(assert (forall ((Heap@@17 T@U) (self@@6 T@U) (key@@0 T@U) ) (!  (=> (and (and (= (type Heap@@17) (MapType0Type RefType)) (= (type self@@6) RefType)) (= (type key@@0) RefType)) (and (= (list___getitem__ Heap@@17 self@@6 key@@0) (|list___getitem__'| Heap@@17 self@@6 key@@0)) (dummyFunction (|list___getitem__#triggerStateless| self@@6 key@@0))))
 :qid |stdinbpl.1074:15|
 :skolemid |85|
 :pattern ( (list___getitem__ Heap@@17 self@@6 key@@0))
)))
(assert (forall ((o_2@@1 T@U) (f_4@@1 T@U) ) (! (let ((B@@4 (FieldTypeInv1 (type f_4@@1))))
(let ((A@@5 (FieldTypeInv0 (type f_4@@1))))
 (=> (and (= (type o_2@@1) RefType) (= (type f_4@@1) (FieldType A@@5 B@@4))) (= (U_2_real (MapType1Select ZeroMask o_2@@1 f_4@@1)) NoPerm))))
 :qid |stdinbpl.106:22|
 :skolemid |13|
 :pattern ( (MapType1Select ZeroMask o_2@@1 f_4@@1))
)))
(assert (forall ((s@@7 T@U) (t@@0 T@U) (n@@7 Int) ) (! (let ((T@@18 (SeqTypeInv0 (type s@@7))))
 (=> (and (and (= (type s@@7) (SeqType T@@18)) (= (type t@@0) (SeqType T@@18))) (and (> n@@7 0) (> n@@7 (|Seq#Length| s@@7)))) (and (= (|Seq#Add| (|Seq#Sub| n@@7 (|Seq#Length| s@@7)) (|Seq#Length| s@@7)) n@@7) (= (|Seq#Take| (|Seq#Append| s@@7 t@@0) n@@7) (|Seq#Append| s@@7 (|Seq#Take| t@@0 (|Seq#Sub| n@@7 (|Seq#Length| s@@7))))))))
 :qid |stdinbpl.372:18|
 :skolemid |42|
 :pattern ( (|Seq#Take| (|Seq#Append| s@@7 t@@0) n@@7))
)))
(assert (forall ((q@min@@1 Int) (q@max@@1 Int) ) (!  (and (=> (< q@min@@1 q@max@@1) (= (|Seq#Length| (|Seq#Range| q@min@@1 q@max@@1)) (- q@max@@1 q@min@@1))) (=> (<= q@max@@1 q@min@@1) (= (|Seq#Length| (|Seq#Range| q@min@@1 q@max@@1)) 0)))
 :qid |stdinbpl.550:15|
 :skolemid |55|
 :pattern ( (|Seq#Length| (|Seq#Range| q@min@@1 q@max@@1)))
)))
(assert (forall ((a T@U) (b T@U) ) (! (let ((T@@19 (SeqTypeInv0 (type a))))
 (=> (and (and (= (type a) (SeqType T@@19)) (= (type b) (SeqType T@@19))) (|Seq#Equal| a b)) (= a b)))
 :qid |stdinbpl.523:18|
 :skolemid |53|
 :pattern ( (|Seq#Equal| a b))
)))
(assert (forall ((sub_1 T@U) (sub2 T@U) ) (!  (=> (and (and (= (type sub_1) PyTypeDomainTypeType) (= (type sub2) PyTypeDomainTypeType)) (extends_ sub_1 sub2)) (issubtype sub_1 sub2))
 :qid |stdinbpl.723:15|
 :skolemid |60|
 :pattern ( (extends_ sub_1 sub2))
)))
(assert (forall ((s@@8 T@U) (i@@2 Int) ) (! (let ((T@@20 (SeqTypeInv0 (type s@@8))))
 (=> (= (type s@@8) (SeqType T@@20)) (=> (and (<= 0 i@@2) (< i@@2 (|Seq#Length| s@@8))) (|Seq#ContainsTrigger| s@@8 (|Seq#Index| s@@8 i@@2)))))
 :qid |stdinbpl.416:18|
 :skolemid |49|
 :pattern ( (|Seq#Index| s@@8 i@@2))
)))
(assert (forall ((s0@@1 T@U) (s1@@1 T@U) ) (! (let ((T@@21 (SeqTypeInv0 (type s0@@1))))
 (=> (and (= (type s0@@1) (SeqType T@@21)) (= (type s1@@1) (SeqType T@@21))) (and (=> (= s0@@1 (|Seq#Empty| T@@21)) (= (|Seq#Append| s0@@1 s1@@1) s1@@1)) (=> (= s1@@1 (|Seq#Empty| T@@21)) (= (|Seq#Append| s0@@1 s1@@1) s0@@1)))))
 :qid |stdinbpl.235:18|
 :skolemid |27|
 :pattern ( (|Seq#Append| s0@@1 s1@@1))
)))
(assert (forall ((t@@1 T@U) ) (! (= (|Seq#Index| (|Seq#Singleton| t@@1) 0) t@@1)
 :qid |stdinbpl.239:18|
 :skolemid |28|
 :pattern ( (|Seq#Singleton| t@@1))
)))
(assert (forall ((s@@9 T@U) ) (! (let ((T@@22 (SeqTypeInv0 (type s@@9))))
 (=> (= (type s@@9) (SeqType T@@22)) (<= 0 (|Seq#Length| s@@9))))
 :qid |stdinbpl.218:18|
 :skolemid |22|
 :pattern ( (|Seq#Length| s@@9))
)))
(assert (forall ((s0@@2 T@U) (s1@@2 T@U) ) (! (let ((T@@23 (SeqTypeInv0 (type s0@@2))))
 (=> (and (and (= (type s0@@2) (SeqType T@@23)) (= (type s1@@2) (SeqType T@@23))) (|Seq#Equal| s0@@2 s1@@2)) (and (= (|Seq#Length| s0@@2) (|Seq#Length| s1@@2)) (forall ((j@@4 Int) ) (!  (=> (and (<= 0 j@@4) (< j@@4 (|Seq#Length| s0@@2))) (= (|Seq#Index| s0@@2 j@@4) (|Seq#Index| s1@@2 j@@4)))
 :qid |stdinbpl.513:13|
 :skolemid |50|
 :pattern ( (|Seq#Index| s0@@2 j@@4))
 :pattern ( (|Seq#Index| s1@@2 j@@4))
)))))
 :qid |stdinbpl.510:18|
 :skolemid |51|
 :pattern ( (|Seq#Equal| s0@@2 s1@@2))
)))
(assert (forall ((arg0@@42 T@U) ) (! (= (type (typeof arg0@@42)) PyTypeDomainTypeType)
 :qid |funType:typeof|
 :pattern ( (typeof arg0@@42))
)))
(assert (forall ((Heap@@18 T@U) (Mask@@9 T@U) (box@@1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@18) (MapType0Type RefType)) (= (type Mask@@9) (MapType1Type RefType realType))) (= (type box@@1) RefType)) (and (state Heap@@18 Mask@@9) (or (< AssumeFunctionsAbove 4) (|int___unbox__#trigger| EmptyFrame box@@1)))) (issubtype (typeof box@@1) vint)) (not (issubtype (typeof box@@1) vbool))) (= (|__prim__int___box__'| Heap@@18 (|int___unbox__'| Heap@@18 box@@1)) box@@1))
 :qid |stdinbpl.863:15|
 :skolemid |72|
 :pattern ( (state Heap@@18 Mask@@9) (|int___unbox__'| Heap@@18 box@@1))
)))
(assert (forall ((Heap@@19 T@U) (ExhaleHeap@@4 T@U) (Mask@@10 T@U) (pm_f@@1 T@U) ) (! (let ((C@@1 (FieldTypeInv0 (type pm_f@@1))))
 (=> (and (and (and (and (and (= (type Heap@@19) (MapType0Type RefType)) (= (type ExhaleHeap@@4) (MapType0Type RefType))) (= (type Mask@@10) (MapType1Type RefType realType))) (= (type pm_f@@1) (FieldType C@@1 FrameTypeType))) (IdenticalOnKnownLocations Heap@@19 ExhaleHeap@@4 Mask@@10)) (and (HasDirectPerm Mask@@10 null pm_f@@1) (IsPredicateField pm_f@@1))) (forall ((o2 T@U) (f_2@@0 T@U) ) (! (let ((B@@5 (FieldTypeInv1 (type f_2@@0))))
(let ((A@@6 (FieldTypeInv0 (type f_2@@0))))
 (=> (and (and (= (type o2) RefType) (= (type f_2@@0) (FieldType A@@6 B@@5))) (U_2_bool (MapType1Select (MapType0Select Heap@@19 null (PredicateMaskField pm_f@@1)) o2 f_2@@0))) (= (MapType0Select Heap@@19 o2 f_2@@0) (MapType0Select ExhaleHeap@@4 o2 f_2@@0)))))
 :qid |stdinbpl.54:134|
 :skolemid |3|
 :pattern ( (MapType0Select ExhaleHeap@@4 o2 f_2@@0))
))))
 :qid |stdinbpl.52:19|
 :skolemid |4|
 :pattern ( (IdenticalOnKnownLocations Heap@@19 ExhaleHeap@@4 Mask@@10) (IsPredicateField pm_f@@1))
)))
(assert (forall ((Heap@@20 T@U) (ExhaleHeap@@5 T@U) (Mask@@11 T@U) (pm_f@@2 T@U) ) (! (let ((C@@2 (FieldTypeInv0 (type pm_f@@2))))
 (=> (and (and (and (and (and (= (type Heap@@20) (MapType0Type RefType)) (= (type ExhaleHeap@@5) (MapType0Type RefType))) (= (type Mask@@11) (MapType1Type RefType realType))) (= (type pm_f@@2) (FieldType C@@2 FrameTypeType))) (IdenticalOnKnownLocations Heap@@20 ExhaleHeap@@5 Mask@@11)) (and (HasDirectPerm Mask@@11 null pm_f@@2) (IsWandField pm_f@@2))) (forall ((o2@@0 T@U) (f_2@@1 T@U) ) (! (let ((B@@6 (FieldTypeInv1 (type f_2@@1))))
(let ((A@@7 (FieldTypeInv0 (type f_2@@1))))
 (=> (and (and (= (type o2@@0) RefType) (= (type f_2@@1) (FieldType A@@7 B@@6))) (U_2_bool (MapType1Select (MapType0Select Heap@@20 null (WandMaskField pm_f@@2)) o2@@0 f_2@@1))) (= (MapType0Select Heap@@20 o2@@0 f_2@@1) (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1)))))
 :qid |stdinbpl.67:129|
 :skolemid |6|
 :pattern ( (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1))
))))
 :qid |stdinbpl.65:19|
 :skolemid |7|
 :pattern ( (IdenticalOnKnownLocations Heap@@20 ExhaleHeap@@5 Mask@@11) (IsWandField pm_f@@2))
)))
(assert (forall ((t@@2 T@U) ) (! (= (|Seq#Length| (|Seq#Singleton| t@@2)) 1)
 :qid |stdinbpl.226:18|
 :skolemid |25|
 :pattern ( (|Seq#Singleton| t@@2))
)))
(assert (forall ((Mask@@12 T@U) (o_2@@2 T@U) (f_4@@2 T@U) ) (! (let ((B@@7 (FieldTypeInv1 (type f_4@@2))))
(let ((A@@8 (FieldTypeInv0 (type f_4@@2))))
 (=> (and (and (and (= (type Mask@@12) (MapType1Type RefType realType)) (= (type o_2@@2) RefType)) (= (type f_4@@2) (FieldType A@@8 B@@7))) (GoodMask Mask@@12)) (and (>= (U_2_real (MapType1Select Mask@@12 o_2@@2 f_4@@2)) NoPerm) (=> (and (and (GoodMask Mask@@12) (not (IsPredicateField f_4@@2))) (not (IsWandField f_4@@2))) (<= (U_2_real (MapType1Select Mask@@12 o_2@@2 f_4@@2)) FullPerm))))))
 :qid |stdinbpl.128:22|
 :skolemid |16|
 :pattern ( (GoodMask Mask@@12) (MapType1Select Mask@@12 o_2@@2 f_4@@2))
)))
(assert (forall ((arg0@@43 T@U) (arg1@@21 Int) ) (! (= (type (|__prim__int___box__#frame| arg0@@43 arg1@@21)) RefType)
 :qid |funType:__prim__int___box__#frame|
 :pattern ( (|__prim__int___box__#frame| arg0@@43 arg1@@21))
)))
(assert (forall ((Heap@@21 T@U) (Mask@@13 T@U) (prim@@2 Int) ) (!  (=> (and (and (= (type Heap@@21) (MapType0Type RefType)) (= (type Mask@@13) (MapType1Type RefType realType))) (state Heap@@21 Mask@@13)) (= (|__prim__int___box__'| Heap@@21 prim@@2) (|__prim__int___box__#frame| EmptyFrame prim@@2)))
 :qid |stdinbpl.787:15|
 :skolemid |66|
 :pattern ( (state Heap@@21 Mask@@13) (|__prim__int___box__'| Heap@@21 prim@@2))
)))
(assert (forall ((Heap@@22 T@U) (Mask@@14 T@U) (box@@2 T@U) ) (!  (=> (and (and (and (= (type Heap@@22) (MapType0Type RefType)) (= (type Mask@@14) (MapType1Type RefType realType))) (= (type box@@2) RefType)) (state Heap@@22 Mask@@14)) (= (|int___unbox__'| Heap@@22 box@@2) (|int___unbox__#frame| EmptyFrame box@@2)))
 :qid |stdinbpl.857:15|
 :skolemid |71|
 :pattern ( (state Heap@@22 Mask@@14) (|int___unbox__'| Heap@@22 box@@2))
)))
(assert (forall ((arg0@@44 T@U) ) (! (= (type (FrameFragment arg0@@44)) FrameTypeType)
 :qid |funType:FrameFragment|
 :pattern ( (FrameFragment arg0@@44))
)))
(assert (forall ((Heap@@23 T@U) (Mask@@15 T@U) (self@@7 T@U) ) (!  (=> (and (and (and (= (type Heap@@23) (MapType0Type RefType)) (= (type Mask@@15) (MapType1Type RefType realType))) (= (type self@@7) RefType)) (state Heap@@23 Mask@@15)) (= (|list___len__'| Heap@@23 self@@7) (|list___len__#frame| (FrameFragment (MapType0Select Heap@@23 self@@7 list_acc)) self@@7)))
 :qid |stdinbpl.1025:15|
 :skolemid |84|
 :pattern ( (state Heap@@23 Mask@@15) (|list___len__'| Heap@@23 self@@7))
)))
(assert (forall ((o T@U) (f T@U) (Heap@@24 T@U) ) (!  (=> (and (and (and (= (type o) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap@@24) (MapType0Type RefType))) (U_2_bool (MapType0Select Heap@@24 o $allocated))) (U_2_bool (MapType0Select Heap@@24 (MapType0Select Heap@@24 o f) $allocated)))
 :qid |stdinbpl.31:15|
 :skolemid |0|
 :pattern ( (MapType0Select Heap@@24 o f))
)))
(assert (forall ((s@@10 T@U) (t@@3 T@U) (n@@8 Int) ) (! (let ((T@@24 (SeqTypeInv0 (type s@@10))))
 (=> (and (and (= (type s@@10) (SeqType T@@24)) (= (type t@@3) (SeqType T@@24))) (and (< 0 n@@8) (<= n@@8 (|Seq#Length| s@@10)))) (= (|Seq#Take| (|Seq#Append| s@@10 t@@3) n@@8) (|Seq#Take| s@@10 n@@8))))
 :qid |stdinbpl.368:18|
 :skolemid |41|
 :pattern ( (|Seq#Take| (|Seq#Append| s@@10 t@@3) n@@8))
)))
(assert (forall ((s@@11 T@U) (i@@3 Int) (v@@1 T@U) ) (! (let ((T@@25 (type v@@1)))
 (=> (= (type s@@11) (SeqType T@@25)) (=> (and (<= 0 i@@3) (< i@@3 (|Seq#Length| s@@11))) (= (|Seq#Length| (|Seq#Update| s@@11 i@@3 v@@1)) (|Seq#Length| s@@11)))))
 :qid |stdinbpl.267:18|
 :skolemid |34|
 :pattern ( (|Seq#Length| (|Seq#Update| s@@11 i@@3 v@@1)))
 :pattern ( (|Seq#Length| s@@11) (|Seq#Update| s@@11 i@@3 v@@1))
)))
(assert  (and (forall ((arg0@@45 T@U) (arg1@@22 T@U) (arg2@@6 T@U) ) (! (= (type (|list___getitem__#frame| arg0@@45 arg1@@22 arg2@@6)) RefType)
 :qid |funType:list___getitem__#frame|
 :pattern ( (|list___getitem__#frame| arg0@@45 arg1@@22 arg2@@6))
)) (forall ((arg0@@46 T@U) (arg1@@23 T@U) ) (! (= (type (CombineFrames arg0@@46 arg1@@23)) FrameTypeType)
 :qid |funType:CombineFrames|
 :pattern ( (CombineFrames arg0@@46 arg1@@23))
))))
(assert (forall ((Heap@@25 T@U) (Mask@@16 T@U) (self@@8 T@U) (key@@1 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@25) (MapType0Type RefType)) (= (type Mask@@16) (MapType1Type RefType realType))) (= (type self@@8) RefType)) (= (type key@@1) RefType)) (state Heap@@25 Mask@@16)) (= (|list___getitem__'| Heap@@25 self@@8 key@@1) (|list___getitem__#frame| (CombineFrames (FrameFragment (MapType0Select Heap@@25 self@@8 list_acc)) (CombineFrames (FrameFragment (ite (< (int___unbox__ Heap@@25 key@@1) 0) EmptyFrame EmptyFrame)) (FrameFragment (ite (>= (int___unbox__ Heap@@25 key@@1) 0) EmptyFrame EmptyFrame)))) self@@8 key@@1)))
 :qid |stdinbpl.1085:15|
 :skolemid |87|
 :pattern ( (state Heap@@25 Mask@@16) (|list___getitem__'| Heap@@25 self@@8 key@@1))
)))
(assert (forall ((Heap@@26 T@U) (Mask@@17 T@U) (self@@9 Int) (other@@3 Int) ) (!  (=> (and (and (= (type Heap@@26) (MapType0Type RefType)) (= (type Mask@@17) (MapType1Type RefType realType))) (and (state Heap@@26 Mask@@17) (< AssumeFunctionsAbove 2))) (= (int___lt__ Heap@@26 self@@9 other@@3) (< self@@9 other@@3)))
 :qid |stdinbpl.969:15|
 :skolemid |79|
 :pattern ( (state Heap@@26 Mask@@17) (int___lt__ Heap@@26 self@@9 other@@3))
)))
(assert (forall ((s@@12 T@U) (t@@4 T@U) (n@@9 Int) ) (! (let ((T@@26 (SeqTypeInv0 (type s@@12))))
 (=> (and (and (= (type s@@12) (SeqType T@@26)) (= (type t@@4) (SeqType T@@26))) (and (< 0 n@@9) (<= n@@9 (|Seq#Length| s@@12)))) (= (|Seq#Drop| (|Seq#Append| s@@12 t@@4) n@@9) (|Seq#Append| (|Seq#Drop| s@@12 n@@9) t@@4))))
 :qid |stdinbpl.381:18|
 :skolemid |43|
 :pattern ( (|Seq#Drop| (|Seq#Append| s@@12 t@@4) n@@9))
)))
(assert (forall ((s@@13 T@U) (n@@10 Int) (i@@4 Int) ) (! (let ((T@@27 (SeqTypeInv0 (type s@@13))))
 (=> (= (type s@@13) (SeqType T@@27)) (=> (and (and (< 0 n@@10) (<= n@@10 i@@4)) (< i@@4 (|Seq#Length| s@@13))) (and (= (|Seq#Add| (|Seq#Sub| i@@4 n@@10) n@@10) i@@4) (= (|Seq#Index| (|Seq#Drop| s@@13 n@@10) (|Seq#Sub| i@@4 n@@10)) (|Seq#Index| s@@13 i@@4))))))
 :qid |stdinbpl.318:18|
 :skolemid |40|
 :pattern ( (|Seq#Drop| s@@13 n@@10) (|Seq#Index| s@@13 i@@4))
)))
(assert (forall ((s0@@3 T@U) (s1@@3 T@U) (n@@11 Int) ) (! (let ((T@@28 (SeqTypeInv0 (type s0@@3))))
 (=> (and (= (type s0@@3) (SeqType T@@28)) (= (type s1@@3) (SeqType T@@28))) (=> (and (and (and (not (= s0@@3 (|Seq#Empty| T@@28))) (not (= s1@@3 (|Seq#Empty| T@@28)))) (<= 0 n@@11)) (< n@@11 (|Seq#Length| s0@@3))) (= (|Seq#Index| (|Seq#Append| s0@@3 s1@@3) n@@11) (|Seq#Index| s0@@3 n@@11)))))
 :qid |stdinbpl.258:18|
 :skolemid |31|
 :pattern ( (|Seq#Index| (|Seq#Append| s0@@3 s1@@3) n@@11))
 :pattern ( (|Seq#Index| s0@@3 n@@11) (|Seq#Append| s0@@3 s1@@3))
)))
(assert (forall ((Heap@@27 T@U) (o@@0 T@U) (f_3 T@U) (v@@2 T@U) ) (! (let ((B@@8 (type v@@2)))
(let ((A@@9 (FieldTypeInv0 (type f_3))))
 (=> (and (and (= (type Heap@@27) (MapType0Type RefType)) (= (type o@@0) RefType)) (= (type f_3) (FieldType A@@9 B@@8))) (succHeap Heap@@27 (MapType0Store Heap@@27 o@@0 f_3 v@@2)))))
 :qid |stdinbpl.78:22|
 :skolemid |9|
 :pattern ( (MapType0Store Heap@@27 o@@0 f_3 v@@2))
)))
(assert (forall ((Heap@@28 T@U) (Mask@@18 T@U) (prim@@3 Int) ) (!  (=> (and (and (= (type Heap@@28) (MapType0Type RefType)) (= (type Mask@@18) (MapType1Type RefType realType))) (and (state Heap@@28 Mask@@18) (or (< AssumeFunctionsAbove 4) (|__prim__int___box__#trigger| EmptyFrame prim@@3)))) (= (typeof (|__prim__int___box__'| Heap@@28 prim@@3)) vint))
 :qid |stdinbpl.793:15|
 :skolemid |67|
 :pattern ( (state Heap@@28 Mask@@18) (|__prim__int___box__'| Heap@@28 prim@@3))
)))
(assert (forall ((s0@@4 T@U) (s1@@4 T@U) (m@@7 Int) ) (! (let ((T@@29 (SeqTypeInv0 (type s0@@4))))
 (=> (and (= (type s0@@4) (SeqType T@@29)) (= (type s1@@4) (SeqType T@@29))) (=> (and (and (and (not (= s0@@4 (|Seq#Empty| T@@29))) (not (= s1@@4 (|Seq#Empty| T@@29)))) (<= 0 m@@7)) (< m@@7 (|Seq#Length| s1@@4))) (and (= (|Seq#Sub| (|Seq#Add| m@@7 (|Seq#Length| s0@@4)) (|Seq#Length| s0@@4)) m@@7) (= (|Seq#Index| (|Seq#Append| s0@@4 s1@@4) (|Seq#Add| m@@7 (|Seq#Length| s0@@4))) (|Seq#Index| s1@@4 m@@7))))))
 :qid |stdinbpl.263:18|
 :skolemid |33|
 :pattern ( (|Seq#Index| s1@@4 m@@7) (|Seq#Append| s0@@4 s1@@4))
)))
(assert (forall ((sub_1@@0 T@U) (sub2@@0 T@U) (super_1 T@U) ) (!  (=> (and (and (and (= (type sub_1@@0) PyTypeDomainTypeType) (= (type sub2@@0) PyTypeDomainTypeType)) (= (type super_1) PyTypeDomainTypeType)) (and (extends_ sub_1@@0 super_1) (and (extends_ sub2@@0 super_1) (not (= sub_1@@0 sub2@@0))))) (and (isnotsubtype sub_1@@0 sub2@@0) (isnotsubtype sub2@@0 sub_1@@0)))
 :qid |stdinbpl.729:15|
 :skolemid |61|
 :pattern ( (extends_ sub_1@@0 super_1) (extends_ sub2@@0 super_1))
)))
(assert (forall ((arg0@@47 T@U) ) (! (= (type (list arg0@@47)) PyTypeDomainTypeType)
 :qid |funType:list|
 :pattern ( (list arg0@@47))
)))
(assert (forall ((var0 T@U) ) (!  (=> (= (type var0) PyTypeDomainTypeType) (and (extends_ (list var0) object) (= (get_basic (list var0)) list_basic)))
 :qid |stdinbpl.741:15|
 :skolemid |63|
 :pattern ( (list var0))
)))
(assert (= (type ZeroPMask) (MapType1Type RefType boolType)))
(assert (forall ((o_2@@3 T@U) (f_4@@3 T@U) ) (! (let ((B@@9 (FieldTypeInv1 (type f_4@@3))))
(let ((A@@10 (FieldTypeInv0 (type f_4@@3))))
 (=> (and (= (type o_2@@3) RefType) (= (type f_4@@3) (FieldType A@@10 B@@9))) (not (U_2_bool (MapType1Select ZeroPMask o_2@@3 f_4@@3))))))
 :qid |stdinbpl.112:22|
 :skolemid |14|
 :pattern ( (MapType1Select ZeroPMask o_2@@3 f_4@@3))
)))
(assert (forall ((s@@14 T@U) (x@@10 T@U) (i@@5 Int) ) (! (let ((T@@30 (type x@@10)))
 (=> (= (type s@@14) (SeqType T@@30)) (=> (and (and (<= 0 i@@5) (< i@@5 (|Seq#Length| s@@14))) (= (|Seq#Index| s@@14 i@@5) x@@10)) (|Seq#Contains| s@@14 x@@10))))
 :qid |stdinbpl.414:18|
 :skolemid |48|
 :pattern ( (|Seq#Contains| s@@14 x@@10) (|Seq#Index| s@@14 i@@5))
)))
(assert (forall ((s0@@5 T@U) (s1@@5 T@U) ) (! (let ((T@@31 (SeqTypeInv0 (type s0@@5))))
 (=> (and (= (type s0@@5) (SeqType T@@31)) (= (type s1@@5) (SeqType T@@31))) (or (or (and (= s0@@5 s1@@5) (|Seq#Equal| s0@@5 s1@@5)) (and (and (not (= s0@@5 s1@@5)) (not (|Seq#Equal| s0@@5 s1@@5))) (not (= (|Seq#Length| s0@@5) (|Seq#Length| s1@@5))))) (and (and (and (and (and (and (not (= s0@@5 s1@@5)) (not (|Seq#Equal| s0@@5 s1@@5))) (= (|Seq#Length| s0@@5) (|Seq#Length| s1@@5))) (= (|Seq#SkolemDiff| s0@@5 s1@@5) (|Seq#SkolemDiff| s1@@5 s0@@5))) (<= 0 (|Seq#SkolemDiff| s0@@5 s1@@5))) (< (|Seq#SkolemDiff| s0@@5 s1@@5) (|Seq#Length| s0@@5))) (not (= (|Seq#Index| s0@@5 (|Seq#SkolemDiff| s0@@5 s1@@5)) (|Seq#Index| s1@@5 (|Seq#SkolemDiff| s0@@5 s1@@5))))))))
 :qid |stdinbpl.518:18|
 :skolemid |52|
 :pattern ( (|Seq#Equal| s0@@5 s1@@5))
)))
(assert (forall ((Heap@@29 T@U) (Mask@@19 T@U) (self@@10 Int) (other@@4 Int) ) (!  (=> (and (and (= (type Heap@@29) (MapType0Type RefType)) (= (type Mask@@19) (MapType1Type RefType realType))) (and (state Heap@@29 Mask@@19) (< AssumeFunctionsAbove 0))) (= (int___ge__ Heap@@29 self@@10 other@@4) (>= self@@10 other@@4)))
 :qid |stdinbpl.920:15|
 :skolemid |75|
 :pattern ( (state Heap@@29 Mask@@19) (int___ge__ Heap@@29 self@@10 other@@4))
)))
(assert (forall ((p@@1 T@U) (v_1@@0 T@U) (q T@U) (w@@0 T@U) (r T@U) (u T@U) ) (! (let ((C@@3 (FieldTypeInv0 (type r))))
(let ((B@@10 (FieldTypeInv0 (type q))))
(let ((A@@11 (FieldTypeInv0 (type p@@1))))
 (=> (and (and (and (and (and (and (= (type p@@1) (FieldType A@@11 FrameTypeType)) (= (type v_1@@0) FrameTypeType)) (= (type q) (FieldType B@@10 FrameTypeType))) (= (type w@@0) FrameTypeType)) (= (type r) (FieldType C@@3 FrameTypeType))) (= (type u) FrameTypeType)) (and (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))) (InsidePredicate p@@1 v_1@@0 r u)))))
 :qid |stdinbpl.187:25|
 :skolemid |20|
 :pattern ( (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))
)))
(assert (forall ((s@@15 T@U) ) (! (let ((T@@32 (SeqTypeInv0 (type s@@15))))
 (=> (and (= (type s@@15) (SeqType T@@32)) (= (|Seq#Length| s@@15) 0)) (= s@@15 (|Seq#Empty| T@@32))))
 :qid |stdinbpl.222:18|
 :skolemid |24|
 :pattern ( (|Seq#Length| s@@15))
)))
(assert (forall ((s@@16 T@U) (n@@12 Int) ) (! (let ((T@@33 (SeqTypeInv0 (type s@@16))))
 (=> (and (= (type s@@16) (SeqType T@@33)) (<= n@@12 0)) (= (|Seq#Take| s@@16 n@@12) (|Seq#Empty| T@@33))))
 :qid |stdinbpl.397:18|
 :skolemid |46|
 :pattern ( (|Seq#Take| s@@16 n@@12))
)))
(assert (forall ((sub_1@@1 T@U) (middle T@U) (super_1@@0 T@U) ) (!  (=> (and (and (and (= (type sub_1@@1) PyTypeDomainTypeType) (= (type middle) PyTypeDomainTypeType)) (= (type super_1@@0) PyTypeDomainTypeType)) (and (issubtype sub_1@@1 middle) (issubtype middle super_1@@0))) (issubtype sub_1@@1 super_1@@0))
 :qid |stdinbpl.711:15|
 :skolemid |58|
 :pattern ( (issubtype sub_1@@1 middle) (issubtype middle super_1@@0))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
(assert (forall ((sub_1@@2 T@U) (middle@@0 T@U) (super_1@@1 T@U) ) (!  (=> (and (and (and (= (type sub_1@@2) PyTypeDomainTypeType) (= (type middle@@0) PyTypeDomainTypeType)) (= (type super_1@@1) PyTypeDomainTypeType)) (and (issubtype sub_1@@2 middle@@0) (isnotsubtype middle@@0 super_1@@1))) (not (issubtype sub_1@@2 super_1@@1)))
 :qid |stdinbpl.735:15|
 :skolemid |62|
 :pattern ( (issubtype sub_1@@2 middle@@0) (isnotsubtype middle@@0 super_1@@1))
)))
(assert (forall ((Heap@@30 T@U) (Mask@@20 T@U) (self@@11 T@U) ) (!  (=> (and (and (and (= (type Heap@@30) (MapType0Type RefType)) (= (type Mask@@20) (MapType1Type RefType realType))) (= (type self@@11) RefType)) (and (state Heap@@30 Mask@@20) (< AssumeFunctionsAbove 3))) (= (list___len__ Heap@@30 self@@11) (|Seq#Length| (MapType0Select Heap@@30 self@@11 list_acc))))
 :qid |stdinbpl.1018:15|
 :skolemid |83|
 :pattern ( (state Heap@@30 Mask@@20) (list___len__ Heap@@30 self@@11))
)))
(assert (forall ((Heap@@31 T@U) (self@@12 Int) (other@@5 Int) ) (!  (=> (= (type Heap@@31) (MapType0Type RefType)) (and (= (int___ge__ Heap@@31 self@@12 other@@5) (|int___ge__'| Heap@@31 self@@12 other@@5)) (dummyFunction (bool_2_U (|int___ge__#triggerStateless| self@@12 other@@5)))))
 :qid |stdinbpl.910:15|
 :skolemid |73|
 :pattern ( (int___ge__ Heap@@31 self@@12 other@@5))
)))
(assert (forall ((Heap@@32 T@U) (self@@13 Int) (other@@6 Int) ) (!  (=> (= (type Heap@@32) (MapType0Type RefType)) (and (= (int___lt__ Heap@@32 self@@13 other@@6) (|int___lt__'| Heap@@32 self@@13 other@@6)) (dummyFunction (bool_2_U (|int___lt__#triggerStateless| self@@13 other@@6)))))
 :qid |stdinbpl.959:15|
 :skolemid |77|
 :pattern ( (int___lt__ Heap@@32 self@@13 other@@6))
)))
(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun Mask@1 () T@U)
(declare-fun Heap@@33 () T@U)
(declare-fun marked_execution_tree () T@U)
(declare-fun iii () T@U)
(declare-fun wildcard@1 () Real)
(declare-fun Mask@3 () T@U)
(declare-fun Mask@0 () T@U)
(declare-fun wildcard () Real)
(assert  (and (and (and (and (and (= (type Heap@@33) (MapType0Type RefType)) (= (type marked_execution_tree) RefType)) (= (type iii) RefType)) (= (type Mask@1) (MapType1Type RefType realType))) (= (type Mask@3) (MapType1Type RefType realType))) (= (type Mask@0) (MapType1Type RefType realType))))
(set-info :boogie-vc-id mcan_node_be_compressed)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 28) (let ((anon25_Then_correct true))
(let ((anon24_Then_correct  (=> (= (ControlFlow 0 19) (- 0 18)) (> (U_2_real (MapType1Select Mask@1 (MapType0Select Heap@@33 marked_execution_tree Node_children) list_acc)) NoPerm))))
(let ((anon23_Then_correct  (=> (= (ControlFlow 0 17) (- 0 16)) (issubtype (typeof iii) vint))))
(let ((anon21_Then_correct true))
(let ((anon20_Then_correct  (=> (= (ControlFlow 0 13) (- 0 12)) (issubtype (typeof iii) vint))))
(let ((anon27_Then_correct  (and (=> (= (ControlFlow 0 6) (- 0 8)) (issubtype (typeof iii) vint)) (=> (issubtype (typeof iii) vint) (and (=> (= (ControlFlow 0 6) (- 0 7)) (> (U_2_real (MapType1Select Mask@1 (MapType0Select Heap@@33 marked_execution_tree Node_children) list_acc)) NoPerm)) (=> (> (U_2_real (MapType1Select Mask@1 (MapType0Select Heap@@33 marked_execution_tree Node_children) list_acc)) NoPerm) (=> (and (and (> wildcard@1 NoPerm) (< wildcard@1 (U_2_real (MapType1Select Mask@1 (MapType0Select Heap@@33 marked_execution_tree Node_children) list_acc)))) (and (= Mask@3 (MapType1Store Mask@1 (MapType0Select Heap@@33 marked_execution_tree Node_children) list_acc (real_2_U (- (U_2_real (MapType1Select Mask@1 (MapType0Select Heap@@33 marked_execution_tree Node_children) list_acc)) wildcard@1)))) (= (ControlFlow 0 6) (- 0 5)))) (and (=> (< (int___unbox__ Heap@@33 iii) 0) (>= (int___unbox__ Heap@@33 iii) (- 0 (list___len__ Heap@@33 (MapType0Select Heap@@33 marked_execution_tree Node_children))))) (=> (>= (int___unbox__ Heap@@33 iii) 0) (< (int___unbox__ Heap@@33 iii) (list___len__ Heap@@33 (MapType0Select Heap@@33 marked_execution_tree Node_children))))))))))))
(let ((anon16_correct true))
(let ((anon26_Then_correct  (=> (and (= (typeof iii) vint) (and (int___ge__ Heap@@33 (int___unbox__ Heap@@33 iii) 0) (int___lt__ Heap@@33 (int___unbox__ Heap@@33 iii) (list___len__ Heap@@33 (MapType0Select Heap@@33 marked_execution_tree Node_children))))) (and (=> (= (ControlFlow 0 9) (- 0 10)) (HasDirectPerm Mask@1 marked_execution_tree Node_children)) (=> (HasDirectPerm Mask@1 marked_execution_tree Node_children) (and (=> (= (ControlFlow 0 9) 6) anon27_Then_correct) (=> (= (ControlFlow 0 9) 3) anon16_correct)))))))
(let ((anon26_Else_correct  (=> (and (not (and (= (typeof iii) vint) (and (int___ge__ Heap@@33 (int___unbox__ Heap@@33 iii) 0) (int___lt__ Heap@@33 (int___unbox__ Heap@@33 iii) (list___len__ Heap@@33 (MapType0Select Heap@@33 marked_execution_tree Node_children)))))) (= (ControlFlow 0 4) 3)) anon16_correct)))
(let ((anon23_Else_correct  (and (=> (= (ControlFlow 0 21) (- 0 22)) (HasDirectPerm Mask@1 marked_execution_tree Node_children)) (=> (HasDirectPerm Mask@1 marked_execution_tree Node_children) (and (and (and (=> (= (ControlFlow 0 21) 19) anon24_Then_correct) (=> (= (ControlFlow 0 21) 20) anon25_Then_correct)) (=> (= (ControlFlow 0 21) 9) anon26_Then_correct)) (=> (= (ControlFlow 0 21) 4) anon26_Else_correct))))))
(let ((anon22_Then_correct  (=> (int___ge__ Heap@@33 (int___unbox__ Heap@@33 iii) 0) (and (=> (= (ControlFlow 0 23) 17) anon23_Then_correct) (=> (= (ControlFlow 0 23) 21) anon23_Else_correct)))))
(let ((anon22_Else_correct  (=> (not (int___ge__ Heap@@33 (int___unbox__ Heap@@33 iii) 0)) (and (=> (= (ControlFlow 0 15) 9) anon26_Then_correct) (=> (= (ControlFlow 0 15) 4) anon26_Else_correct)))))
(let ((anon19_Then_correct  (=> (= (typeof iii) vint) (and (and (and (=> (= (ControlFlow 0 24) 13) anon20_Then_correct) (=> (= (ControlFlow 0 24) 14) anon21_Then_correct)) (=> (= (ControlFlow 0 24) 23) anon22_Then_correct)) (=> (= (ControlFlow 0 24) 15) anon22_Else_correct)))))
(let ((anon19_Else_correct  (=> (not (= (typeof iii) vint)) (and (=> (= (ControlFlow 0 11) 9) anon26_Then_correct) (=> (= (ControlFlow 0 11) 4) anon26_Else_correct)))))
(let ((anon18_Else_correct  (=> (= (ControlFlow 0 2) (- 0 1)) (forall ((iii_1 T@U) (iii_1_1 T@U) ) (!  (=> (and (= (type iii_1) RefType) (= (type iii_1_1) RefType)) (=> (and (and (and (and (not (= iii_1 iii_1_1)) (and (= (typeof iii_1) vint) (and (int___ge__ Heap@@33 (int___unbox__ Heap@@33 iii_1) 0) (int___lt__ Heap@@33 (int___unbox__ Heap@@33 iii_1) (list___len__ Heap@@33 (MapType0Select Heap@@33 marked_execution_tree Node_children)))))) (and (= (typeof iii_1_1) vint) (and (int___ge__ Heap@@33 (int___unbox__ Heap@@33 iii_1_1) 0) (int___lt__ Heap@@33 (int___unbox__ Heap@@33 iii_1_1) (list___len__ Heap@@33 (MapType0Select Heap@@33 marked_execution_tree Node_children)))))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (list___getitem__ Heap@@33 (MapType0Select Heap@@33 marked_execution_tree Node_children) iii_1) (list___getitem__ Heap@@33 (MapType0Select Heap@@33 marked_execution_tree Node_children) iii_1_1)))))
 :qid |stdinbpl.1347:15|
 :skolemid |88|
 :no-pattern (type iii_1)
 :no-pattern (type iii_1_1)
 :no-pattern (U_2_int iii_1)
 :no-pattern (U_2_bool iii_1)
 :no-pattern (U_2_int iii_1_1)
 :no-pattern (U_2_bool iii_1_1)
)))))
(let ((anon0_correct  (=> (and (state Heap@@33 ZeroMask) (= AssumeFunctionsAbove (- 0 1))) (=> (and (and (U_2_bool (MapType0Select Heap@@33 marked_execution_tree $allocated)) (not (= marked_execution_tree null))) (and (= Mask@0 (MapType1Store ZeroMask marked_execution_tree Node_children (real_2_U (+ (U_2_real (MapType1Select ZeroMask marked_execution_tree Node_children)) FullPerm)))) (state Heap@@33 Mask@0))) (and (=> (= (ControlFlow 0 25) (- 0 27)) (HasDirectPerm Mask@0 marked_execution_tree Node_children)) (=> (HasDirectPerm Mask@0 marked_execution_tree Node_children) (=> (issubtype (typeof (MapType0Select Heap@@33 marked_execution_tree Node_children)) (list Node)) (=> (and (state Heap@@33 Mask@0) (state Heap@@33 Mask@0)) (and (=> (= (ControlFlow 0 25) (- 0 26)) (HasDirectPerm Mask@0 marked_execution_tree Node_children)) (=> (HasDirectPerm Mask@0 marked_execution_tree Node_children) (=> (and (not (= (MapType0Select Heap@@33 marked_execution_tree Node_children) null)) (= Mask@1 (MapType1Store Mask@0 (MapType0Select Heap@@33 marked_execution_tree Node_children) list_acc (real_2_U (+ (U_2_real (MapType1Select Mask@0 (MapType0Select Heap@@33 marked_execution_tree Node_children) list_acc)) FullPerm))))) (=> (and (and (state Heap@@33 Mask@1) (state Heap@@33 Mask@1)) (and (state Heap@@33 Mask@1) (state Heap@@33 Mask@1))) (and (and (=> (= (ControlFlow 0 25) 2) anon18_Else_correct) (=> (= (ControlFlow 0 25) 24) anon19_Then_correct)) (=> (= (ControlFlow 0 25) 11) anon19_Else_correct))))))))))))))
(let ((PreconditionGeneratedEntry_correct  (=> (and (and (> wildcard NoPerm) true) (= (ControlFlow 0 28) 25)) anon0_correct)))
PreconditionGeneratedEntry_correct))))))))))))))))))
))
(check-sat)
(get-info :reason-unknown)
(assert (not (= (ControlFlow 0 2) (- 1))))
(check-sat)
(pop 1)
; Invalid
(get-info :rlimit)
