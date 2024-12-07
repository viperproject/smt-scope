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
(declare-fun Tree__data () T@U)
(declare-fun Tree__left () T@U)
(declare-fun Tree__right () T@U)
(declare-fun FieldType (T@T T@T) T@T)
(declare-fun FieldTypeInv0 (T@T) T@T)
(declare-fun FieldTypeInv1 (T@T) T@T)
(declare-fun NormalFieldType () T@T)
(declare-fun RefType () T@T)
(declare-fun |Seq#Length| (T@U) Int)
(declare-fun |Seq#Drop| (T@U Int) T@U)
(declare-fun SeqTypeInv0 (T@T) T@T)
(declare-fun SeqType (T@T) T@T)
(declare-fun succHeap (T@U T@U) Bool)
(declare-fun MapType0Type (T@T) T@T)
(declare-fun succHeapTrans (T@U T@U) Bool)
(declare-fun MapType0TypeInv0 (T@T) T@T)
(declare-fun MapType0Select (T@U T@U T@U) T@U)
(declare-fun MapType0Store (T@U T@U T@U T@U) T@U)
(declare-fun state (T@U T@U) Bool)
(declare-fun MapType1Type (T@T T@T) T@T)
(declare-fun GoodMask (T@U) Bool)
(declare-fun MapType1TypeInv0 (T@T) T@T)
(declare-fun MapType1TypeInv1 (T@T) T@T)
(declare-fun MapType1Select (T@U T@U T@U) T@U)
(declare-fun MapType1Store (T@U T@U T@U T@U) T@U)
(declare-fun Tree__contents (T@U T@U) T@U)
(declare-fun |Tree__contents#triggerStateless| (T@U) T@U)
(declare-fun |Tree__state#trigger| (T@U T@U) Bool)
(declare-fun Tree__state (T@U) T@U)
(declare-fun AssumeFunctionsAbove () Int)
(declare-fun null () T@U)
(declare-fun |Seq#Empty| (T@T) T@U)
(declare-fun |Seq#Append| (T@U T@U) T@U)
(declare-fun |Tree__contents'| (T@U T@U) T@U)
(declare-fun |Seq#Singleton| (T@U) T@U)
(declare-fun PredicateType_Tree__stateType () T@T)
(declare-fun FrameTypeType () T@T)
(declare-fun |Seq#Index| (T@U Int) T@U)
(declare-fun |Seq#Sub| (Int Int) Int)
(declare-fun |Seq#Add| (Int Int) Int)
(declare-fun IdenticalOnKnownLocations (T@U T@U T@U) Bool)
(declare-fun IsPredicateField (T@U) Bool)
(declare-fun PredicateMaskField (T@U) T@U)
(declare-fun HasDirectPerm (T@U T@U T@U) Bool)
(declare-fun IsWandField (T@U) Bool)
(declare-fun WandMaskField (T@U) T@U)
(declare-fun dummyFunction (T@U) Bool)
(declare-fun |Tree__state#everUsed| (T@U) Bool)
(declare-fun |Seq#Update| (T@U Int T@U) T@U)
(declare-fun |Seq#Take| (T@U Int) T@U)
(declare-fun |Seq#Contains| (T@U T@U) Bool)
(declare-fun |Seq#Range| (Int Int) T@U)
(declare-fun |Seq#Skolem| (T@U T@U) Int)
(declare-fun |Tree__state#sm| (T@U) T@U)
(declare-fun dummyHeap () T@U)
(declare-fun ZeroMask () T@U)
(declare-fun InsidePredicate (T@U T@U T@U T@U) Bool)
(declare-fun sumMask (T@U T@U T@U) Bool)
(declare-fun ConditionalFrame (Real T@U) T@U)
(declare-fun EmptyFrame () T@U)
(declare-fun |Tree__contents#frame| (T@U T@U) T@U)
(declare-fun FrameFragment (T@U) T@U)
(declare-fun NoPerm () Real)
(declare-fun |Seq#Equal| (T@U T@U) Bool)
(declare-fun |Seq#ContainsTrigger| (T@U T@U) Bool)
(declare-fun getPredWandId (T@U) Int)
(declare-fun FullPerm () Real)
(declare-fun ZeroPMask () T@U)
(declare-fun |Seq#SkolemDiff| (T@U T@U) Int)
(declare-fun |Tree__contents#trigger| (T@U T@U) Bool)
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
(assert  (and (and (and (and (and (and (and (and (forall ((arg0@@11 T@T) (arg1 T@T) ) (! (= (Ctor (FieldType arg0@@11 arg1)) 6)
 :qid |ctor:FieldType|
)) (forall ((arg0@@12 T@T) (arg1@@0 T@T) ) (! (= (FieldTypeInv0 (FieldType arg0@@12 arg1@@0)) arg0@@12)
 :qid |typeInv:FieldTypeInv0|
 :pattern ( (FieldType arg0@@12 arg1@@0))
))) (forall ((arg0@@13 T@T) (arg1@@1 T@T) ) (! (= (FieldTypeInv1 (FieldType arg0@@13 arg1@@1)) arg1@@1)
 :qid |typeInv:FieldTypeInv1|
 :pattern ( (FieldType arg0@@13 arg1@@1))
))) (= (Ctor NormalFieldType) 7)) (= (type $allocated) (FieldType NormalFieldType boolType))) (= (type Tree__data) (FieldType NormalFieldType intType))) (= (Ctor RefType) 8)) (= (type Tree__left) (FieldType NormalFieldType RefType))) (= (type Tree__right) (FieldType NormalFieldType RefType))))
(assert (distinct $allocated Tree__data Tree__left Tree__right)
)
(assert  (and (and (forall ((arg0@@14 T@T) ) (! (= (Ctor (SeqType arg0@@14)) 9)
 :qid |ctor:SeqType|
)) (forall ((arg0@@15 T@T) ) (! (= (SeqTypeInv0 (SeqType arg0@@15)) arg0@@15)
 :qid |typeInv:SeqTypeInv0|
 :pattern ( (SeqType arg0@@15))
))) (forall ((arg0@@16 T@U) (arg1@@2 Int) ) (! (let ((T (SeqTypeInv0 (type arg0@@16))))
(= (type (|Seq#Drop| arg0@@16 arg1@@2)) (SeqType T)))
 :qid |funType:Seq#Drop|
 :pattern ( (|Seq#Drop| arg0@@16 arg1@@2))
))))
(assert (forall ((s T@U) (n Int) ) (! (let ((T@@0 (SeqTypeInv0 (type s))))
 (=> (= (type s) (SeqType T@@0)) (and (=> (<= 0 n) (and (=> (<= n (|Seq#Length| s)) (= (|Seq#Length| (|Seq#Drop| s n)) (- (|Seq#Length| s) n))) (=> (< (|Seq#Length| s) n) (= (|Seq#Length| (|Seq#Drop| s n)) 0)))) (=> (< n 0) (= (|Seq#Length| (|Seq#Drop| s n)) (|Seq#Length| s))))))
 :qid |stdinbpl.274:18|
 :skolemid |38|
 :pattern ( (|Seq#Length| (|Seq#Drop| s n)))
 :pattern ( (|Seq#Length| s) (|Seq#Drop| s n))
)))
(assert  (and (and (and (and (and (forall ((arg0@@17 T@T) ) (! (= (Ctor (MapType0Type arg0@@17)) 10)
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
)))))
(assert (forall ((Heap0 T@U) (Heap1 T@U) ) (!  (=> (and (and (= (type Heap0) (MapType0Type RefType)) (= (type Heap1) (MapType0Type RefType))) (succHeap Heap0 Heap1)) (succHeapTrans Heap0 Heap1))
 :qid |stdinbpl.88:15|
 :skolemid |11|
 :pattern ( (succHeap Heap0 Heap1))
)))
(assert  (and (and (and (and (and (and (forall ((arg0@@21 T@T) (arg1@@5 T@T) ) (! (= (Ctor (MapType1Type arg0@@21 arg1@@5)) 11)
 :qid |ctor:MapType1Type|
)) (forall ((arg0@@22 T@T) (arg1@@6 T@T) ) (! (= (MapType1TypeInv0 (MapType1Type arg0@@22 arg1@@6)) arg0@@22)
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
)))))
(assert (forall ((Heap T@U) (Mask T@U) ) (!  (=> (and (and (= (type Heap) (MapType0Type RefType)) (= (type Mask) (MapType1Type RefType realType))) (state Heap Mask)) (GoodMask Mask))
 :qid |stdinbpl.124:15|
 :skolemid |15|
 :pattern ( (state Heap Mask))
)))
(assert (forall ((Heap0@@0 T@U) (Heap1@@0 T@U) (Heap2 T@U) ) (!  (=> (and (and (and (= (type Heap0@@0) (MapType0Type RefType)) (= (type Heap1@@0) (MapType0Type RefType))) (= (type Heap2) (MapType0Type RefType))) (and (succHeapTrans Heap0@@0 Heap1@@0) (succHeap Heap1@@0 Heap2))) (succHeapTrans Heap0@@0 Heap2))
 :qid |stdinbpl.93:15|
 :skolemid |12|
 :pattern ( (succHeapTrans Heap0@@0 Heap1@@0) (succHeap Heap1@@0 Heap2))
)))
(assert  (and (and (and (and (and (and (and (and (and (forall ((arg0@@26 T@U) (arg1@@10 T@U) ) (! (= (type (Tree__contents arg0@@26 arg1@@10)) (SeqType intType))
 :qid |funType:Tree__contents|
 :pattern ( (Tree__contents arg0@@26 arg1@@10))
)) (forall ((arg0@@27 T@U) ) (! (= (type (|Tree__contents#triggerStateless| arg0@@27)) (SeqType intType))
 :qid |funType:Tree__contents#triggerStateless|
 :pattern ( (|Tree__contents#triggerStateless| arg0@@27))
))) (= (Ctor PredicateType_Tree__stateType) 12)) (= (Ctor FrameTypeType) 13)) (forall ((arg0@@28 T@U) ) (! (= (type (Tree__state arg0@@28)) (FieldType PredicateType_Tree__stateType FrameTypeType))
 :qid |funType:Tree__state|
 :pattern ( (Tree__state arg0@@28))
))) (= (type null) RefType)) (forall ((T@@1 T@T) ) (! (= (type (|Seq#Empty| T@@1)) (SeqType T@@1))
 :qid |funType:Seq#Empty|
 :pattern ( (|Seq#Empty| T@@1))
))) (forall ((arg0@@29 T@U) (arg1@@11 T@U) ) (! (let ((T@@2 (SeqTypeInv0 (type arg0@@29))))
(= (type (|Seq#Append| arg0@@29 arg1@@11)) (SeqType T@@2)))
 :qid |funType:Seq#Append|
 :pattern ( (|Seq#Append| arg0@@29 arg1@@11))
))) (forall ((arg0@@30 T@U) (arg1@@12 T@U) ) (! (= (type (|Tree__contents'| arg0@@30 arg1@@12)) (SeqType intType))
 :qid |funType:Tree__contents'|
 :pattern ( (|Tree__contents'| arg0@@30 arg1@@12))
))) (forall ((arg0@@31 T@U) ) (! (let ((T@@3 (type arg0@@31)))
(= (type (|Seq#Singleton| arg0@@31)) (SeqType T@@3)))
 :qid |funType:Seq#Singleton|
 :pattern ( (|Seq#Singleton| arg0@@31))
))))
(assert (forall ((Heap@@0 T@U) (Mask@@0 T@U) (t_1 T@U) ) (!  (=> (and (and (and (= (type Heap@@0) (MapType0Type RefType)) (= (type Mask@@0) (MapType1Type RefType realType))) (= (type t_1) RefType)) (and (state Heap@@0 Mask@@0) (< AssumeFunctionsAbove 0))) (= (Tree__contents Heap@@0 t_1) (ite (= t_1 null) (|Seq#Empty| intType) (|Seq#Append| (|Seq#Append| (|Tree__contents'| Heap@@0 (MapType0Select Heap@@0 t_1 Tree__left)) (|Seq#Singleton| (MapType0Select Heap@@0 t_1 Tree__data))) (|Tree__contents'| Heap@@0 (MapType0Select Heap@@0 t_1 Tree__right))))))
 :qid |stdinbpl.571:15|
 :skolemid |60|
 :pattern ( (state Heap@@0 Mask@@0) (Tree__contents Heap@@0 t_1))
 :pattern ( (state Heap@@0 Mask@@0) (|Tree__contents#triggerStateless| t_1) (|Tree__state#trigger| Heap@@0 (Tree__state t_1)) (|Tree__state#trigger| Heap@@0 (Tree__state t_1)))
)))
(assert (forall ((arg0@@32 T@U) (arg1@@13 Int) ) (! (let ((T@@4 (SeqTypeInv0 (type arg0@@32))))
(= (type (|Seq#Index| arg0@@32 arg1@@13)) T@@4))
 :qid |funType:Seq#Index|
 :pattern ( (|Seq#Index| arg0@@32 arg1@@13))
)))
(assert (forall ((s@@0 T@U) (n@@0 Int) (j Int) ) (! (let ((T@@5 (SeqTypeInv0 (type s@@0))))
 (=> (= (type s@@0) (SeqType T@@5)) (=> (and (and (< 0 n@@0) (<= 0 j)) (< j (- (|Seq#Length| s@@0) n@@0))) (and (= (|Seq#Sub| (|Seq#Add| j n@@0) n@@0) j) (= (|Seq#Index| (|Seq#Drop| s@@0 n@@0) j) (|Seq#Index| s@@0 (|Seq#Add| j n@@0)))))))
 :qid |stdinbpl.295:18|
 :skolemid |39|
 :pattern ( (|Seq#Index| (|Seq#Drop| s@@0 n@@0) j))
)))
(assert (forall ((arg0@@33 T@U) ) (! (let ((A (FieldTypeInv0 (type arg0@@33))))
(= (type (PredicateMaskField arg0@@33)) (FieldType A (MapType1Type RefType boolType))))
 :qid |funType:PredicateMaskField|
 :pattern ( (PredicateMaskField arg0@@33))
)))
(assert (forall ((Heap@@1 T@U) (ExhaleHeap T@U) (Mask@@1 T@U) (pm_f T@U) ) (! (let ((C (FieldTypeInv0 (type pm_f))))
 (=> (and (and (and (and (and (= (type Heap@@1) (MapType0Type RefType)) (= (type ExhaleHeap) (MapType0Type RefType))) (= (type Mask@@1) (MapType1Type RefType realType))) (= (type pm_f) (FieldType C FrameTypeType))) (IdenticalOnKnownLocations Heap@@1 ExhaleHeap Mask@@1)) (and (HasDirectPerm Mask@@1 null pm_f) (IsPredicateField pm_f))) (= (MapType0Select Heap@@1 null (PredicateMaskField pm_f)) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))))
 :qid |stdinbpl.47:19|
 :skolemid |2|
 :pattern ( (IdenticalOnKnownLocations Heap@@1 ExhaleHeap Mask@@1) (IsPredicateField pm_f) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))
)))
(assert (forall ((arg0@@34 T@U) ) (! (let ((A@@0 (FieldTypeInv0 (type arg0@@34))))
(= (type (WandMaskField arg0@@34)) (FieldType A@@0 (MapType1Type RefType boolType))))
 :qid |funType:WandMaskField|
 :pattern ( (WandMaskField arg0@@34))
)))
(assert (forall ((Heap@@2 T@U) (ExhaleHeap@@0 T@U) (Mask@@2 T@U) (pm_f@@0 T@U) ) (! (let ((C@@0 (FieldTypeInv0 (type pm_f@@0))))
 (=> (and (and (and (and (and (= (type Heap@@2) (MapType0Type RefType)) (= (type ExhaleHeap@@0) (MapType0Type RefType))) (= (type Mask@@2) (MapType1Type RefType realType))) (= (type pm_f@@0) (FieldType C@@0 FrameTypeType))) (IdenticalOnKnownLocations Heap@@2 ExhaleHeap@@0 Mask@@2)) (and (HasDirectPerm Mask@@2 null pm_f@@0) (IsWandField pm_f@@0))) (= (MapType0Select Heap@@2 null (WandMaskField pm_f@@0)) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))))
 :qid |stdinbpl.60:19|
 :skolemid |5|
 :pattern ( (IdenticalOnKnownLocations Heap@@2 ExhaleHeap@@0 Mask@@2) (IsWandField pm_f@@0) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))
)))
(assert (forall ((diz T@U) ) (!  (=> (= (type diz) RefType) (IsPredicateField (Tree__state diz)))
 :qid |stdinbpl.764:15|
 :skolemid |66|
 :pattern ( (Tree__state diz))
)))
(assert (forall ((Heap@@3 T@U) (t_1@@0 T@U) ) (!  (=> (and (= (type Heap@@3) (MapType0Type RefType)) (= (type t_1@@0) RefType)) (dummyFunction (|Tree__contents#triggerStateless| t_1@@0)))
 :qid |stdinbpl.565:15|
 :skolemid |59|
 :pattern ( (|Tree__contents'| Heap@@3 t_1@@0))
)))
(assert (forall ((Heap@@4 T@U) (diz@@0 T@U) ) (!  (=> (and (= (type Heap@@4) (MapType0Type RefType)) (= (type diz@@0) RefType)) (|Tree__state#everUsed| (Tree__state diz@@0)))
 :qid |stdinbpl.783:15|
 :skolemid |70|
 :pattern ( (|Tree__state#trigger| Heap@@4 (Tree__state diz@@0)))
)))
(assert (forall ((arg0@@35 T@U) (arg1@@14 Int) (arg2@@3 T@U) ) (! (let ((T@@6 (type arg2@@3)))
(= (type (|Seq#Update| arg0@@35 arg1@@14 arg2@@3)) (SeqType T@@6)))
 :qid |funType:Seq#Update|
 :pattern ( (|Seq#Update| arg0@@35 arg1@@14 arg2@@3))
)))
(assert (forall ((s@@1 T@U) (i Int) (v T@U) (n@@1 Int) ) (! (let ((T@@7 (type v)))
 (=> (= (type s@@1) (SeqType T@@7)) (=> (and (<= 0 n@@1) (< n@@1 (|Seq#Length| s@@1))) (and (=> (= i n@@1) (= (|Seq#Index| (|Seq#Update| s@@1 i v) n@@1) v)) (=> (not (= i n@@1)) (= (|Seq#Index| (|Seq#Update| s@@1 i v) n@@1) (|Seq#Index| s@@1 n@@1)))))))
 :qid |stdinbpl.250:18|
 :skolemid |35|
 :pattern ( (|Seq#Index| (|Seq#Update| s@@1 i v) n@@1))
 :pattern ( (|Seq#Index| s@@1 n@@1) (|Seq#Update| s@@1 i v))
)))
(assert (forall ((arg0@@36 T@U) (arg1@@15 Int) ) (! (let ((T@@8 (SeqTypeInv0 (type arg0@@36))))
(= (type (|Seq#Take| arg0@@36 arg1@@15)) (SeqType T@@8)))
 :qid |funType:Seq#Take|
 :pattern ( (|Seq#Take| arg0@@36 arg1@@15))
)))
(assert (forall ((s@@2 T@U) (n@@2 Int) ) (! (let ((T@@9 (SeqTypeInv0 (type s@@2))))
 (=> (= (type s@@2) (SeqType T@@9)) (and (=> (<= 0 n@@2) (and (=> (<= n@@2 (|Seq#Length| s@@2)) (= (|Seq#Length| (|Seq#Take| s@@2 n@@2)) n@@2)) (=> (< (|Seq#Length| s@@2) n@@2) (= (|Seq#Length| (|Seq#Take| s@@2 n@@2)) (|Seq#Length| s@@2))))) (=> (< n@@2 0) (= (|Seq#Length| (|Seq#Take| s@@2 n@@2)) 0)))))
 :qid |stdinbpl.261:18|
 :skolemid |36|
 :pattern ( (|Seq#Length| (|Seq#Take| s@@2 n@@2)))
 :pattern ( (|Seq#Take| s@@2 n@@2) (|Seq#Length| s@@2))
)))
(assert (forall ((arg0@@37 Int) (arg1@@16 Int) ) (! (= (type (|Seq#Range| arg0@@37 arg1@@16)) (SeqType intType))
 :qid |funType:Seq#Range|
 :pattern ( (|Seq#Range| arg0@@37 arg1@@16))
)))
(assert (forall ((q@min Int) (q@max Int) (v@@0 T@U) ) (!  (=> (= (type v@@0) intType) (= (|Seq#Contains| (|Seq#Range| q@min q@max) v@@0)  (and (<= q@min (U_2_int v@@0)) (< (U_2_int v@@0) q@max))))
 :qid |stdinbpl.534:15|
 :skolemid |57|
 :pattern ( (|Seq#Contains| (|Seq#Range| q@min q@max) v@@0))
)))
(assert (forall ((s@@3 T@U) (x@@8 T@U) ) (! (let ((T@@10 (type x@@8)))
 (=> (and (= (type s@@3) (SeqType T@@10)) (|Seq#Contains| s@@3 x@@8)) (and (and (<= 0 (|Seq#Skolem| s@@3 x@@8)) (< (|Seq#Skolem| s@@3 x@@8) (|Seq#Length| s@@3))) (= (|Seq#Index| s@@3 (|Seq#Skolem| s@@3 x@@8)) x@@8))))
 :qid |stdinbpl.392:18|
 :skolemid |47|
 :pattern ( (|Seq#Contains| s@@3 x@@8))
)))
(assert (forall ((Heap@@5 T@U) (ExhaleHeap@@1 T@U) (Mask@@3 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@5) (MapType0Type RefType)) (= (type ExhaleHeap@@1) (MapType0Type RefType))) (= (type Mask@@3) (MapType1Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@5 ExhaleHeap@@1 Mask@@3)) (U_2_bool (MapType0Select Heap@@5 o_1 $allocated))) (U_2_bool (MapType0Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.73:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@5 ExhaleHeap@@1 Mask@@3) (MapType0Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert (forall ((Heap@@6 T@U) (t_1@@1 T@U) ) (!  (=> (and (= (type Heap@@6) (MapType0Type RefType)) (= (type t_1@@1) RefType)) (and (= (Tree__contents Heap@@6 t_1@@1) (|Tree__contents'| Heap@@6 t_1@@1)) (dummyFunction (|Tree__contents#triggerStateless| t_1@@1))))
 :qid |stdinbpl.561:15|
 :skolemid |58|
 :pattern ( (Tree__contents Heap@@6 t_1@@1))
)))
(assert (forall ((s@@4 T@U) (n@@3 Int) ) (! (let ((T@@11 (SeqTypeInv0 (type s@@4))))
 (=> (and (= (type s@@4) (SeqType T@@11)) (<= n@@3 0)) (= (|Seq#Drop| s@@4 n@@3) s@@4)))
 :qid |stdinbpl.376:18|
 :skolemid |45|
 :pattern ( (|Seq#Drop| s@@4 n@@3))
)))
(assert (forall ((i@@0 Int) (j@@0 Int) ) (! (= (|Seq#Sub| i@@0 j@@0) (- i@@0 j@@0))
 :qid |stdinbpl.230:15|
 :skolemid |30|
 :pattern ( (|Seq#Sub| i@@0 j@@0))
)))
(assert (forall ((i@@1 Int) (j@@1 Int) ) (! (= (|Seq#Add| i@@1 j@@1) (+ i@@1 j@@1))
 :qid |stdinbpl.228:15|
 :skolemid |29|
 :pattern ( (|Seq#Add| i@@1 j@@1))
)))
(assert (forall ((x@@9 T@U) (y@@1 T@U) ) (! (let ((T@@12 (type x@@9)))
 (=> (= (type y@@1) T@@12) (= (|Seq#Contains| (|Seq#Singleton| x@@9) y@@1) (= x@@9 y@@1))))
 :qid |stdinbpl.517:18|
 :skolemid |54|
 :pattern ( (|Seq#Contains| (|Seq#Singleton| x@@9) y@@1))
)))
(assert (forall ((s@@5 T@U) (n@@4 Int) (j@@2 Int) ) (! (let ((T@@13 (SeqTypeInv0 (type s@@5))))
 (=> (= (type s@@5) (SeqType T@@13)) (=> (and (and (<= 0 j@@2) (< j@@2 n@@4)) (< j@@2 (|Seq#Length| s@@5))) (= (|Seq#Index| (|Seq#Take| s@@5 n@@4) j@@2) (|Seq#Index| s@@5 j@@2)))))
 :qid |stdinbpl.269:18|
 :skolemid |37|
 :pattern ( (|Seq#Index| (|Seq#Take| s@@5 n@@4) j@@2))
 :pattern ( (|Seq#Index| s@@5 j@@2) (|Seq#Take| s@@5 n@@4))
)))
(assert (forall ((diz@@1 T@U) (diz2 T@U) ) (!  (=> (and (and (= (type diz@@1) RefType) (= (type diz2) RefType)) (= (Tree__state diz@@1) (Tree__state diz2))) (= diz@@1 diz2))
 :qid |stdinbpl.774:15|
 :skolemid |68|
 :pattern ( (Tree__state diz@@1) (Tree__state diz2))
)))
(assert (forall ((arg0@@38 T@U) ) (! (= (type (|Tree__state#sm| arg0@@38)) (FieldType PredicateType_Tree__stateType (MapType1Type RefType boolType)))
 :qid |funType:Tree__state#sm|
 :pattern ( (|Tree__state#sm| arg0@@38))
)))
(assert (forall ((diz@@2 T@U) (diz2@@0 T@U) ) (!  (=> (and (and (= (type diz@@2) RefType) (= (type diz2@@0) RefType)) (= (|Tree__state#sm| diz@@2) (|Tree__state#sm| diz2@@0))) (= diz@@2 diz2@@0))
 :qid |stdinbpl.778:15|
 :skolemid |69|
 :pattern ( (|Tree__state#sm| diz@@2) (|Tree__state#sm| diz2@@0))
)))
(assert (forall ((Heap@@7 T@U) (ExhaleHeap@@2 T@U) (Mask@@4 T@U) (o_1@@0 T@U) (f_2 T@U) ) (! (let ((B@@1 (FieldTypeInv1 (type f_2))))
(let ((A@@1 (FieldTypeInv0 (type f_2))))
 (=> (and (and (and (and (and (and (= (type Heap@@7) (MapType0Type RefType)) (= (type ExhaleHeap@@2) (MapType0Type RefType))) (= (type Mask@@4) (MapType1Type RefType realType))) (= (type o_1@@0) RefType)) (= (type f_2) (FieldType A@@1 B@@1))) (IdenticalOnKnownLocations Heap@@7 ExhaleHeap@@2 Mask@@4)) (HasDirectPerm Mask@@4 o_1@@0 f_2)) (= (MapType0Select Heap@@7 o_1@@0 f_2) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2)))))
 :qid |stdinbpl.42:22|
 :skolemid |1|
 :pattern ( (IdenticalOnKnownLocations Heap@@7 ExhaleHeap@@2 Mask@@4) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2))
)))
(assert (forall ((T@@14 T@T) ) (! (= (|Seq#Length| (|Seq#Empty| T@@14)) 0)
 :skolemid |23|
)))
(assert  (and (= (type dummyHeap) (MapType0Type RefType)) (= (type ZeroMask) (MapType1Type RefType realType))))
(assert (state dummyHeap ZeroMask))
(assert (forall ((p T@U) (v_1 T@U) (w T@U) ) (! (let ((A@@2 (FieldTypeInv0 (type p))))
 (=> (and (and (= (type p) (FieldType A@@2 FrameTypeType)) (= (type v_1) FrameTypeType)) (= (type w) FrameTypeType)) (not (InsidePredicate p v_1 p w))))
 :qid |stdinbpl.173:19|
 :skolemid |21|
 :pattern ( (InsidePredicate p v_1 p w))
)))
(assert (forall ((s0 T@U) (s1 T@U) (n@@5 Int) ) (! (let ((T@@15 (SeqTypeInv0 (type s0))))
 (=> (and (= (type s0) (SeqType T@@15)) (= (type s1) (SeqType T@@15))) (=> (and (and (and (not (= s0 (|Seq#Empty| T@@15))) (not (= s1 (|Seq#Empty| T@@15)))) (<= (|Seq#Length| s0) n@@5)) (< n@@5 (|Seq#Length| (|Seq#Append| s0 s1)))) (and (= (|Seq#Add| (|Seq#Sub| n@@5 (|Seq#Length| s0)) (|Seq#Length| s0)) n@@5) (= (|Seq#Index| (|Seq#Append| s0 s1) n@@5) (|Seq#Index| s1 (|Seq#Sub| n@@5 (|Seq#Length| s0))))))))
 :qid |stdinbpl.241:18|
 :skolemid |32|
 :pattern ( (|Seq#Index| (|Seq#Append| s0 s1) n@@5))
)))
(assert  (not (IsPredicateField Tree__data)))
(assert  (not (IsWandField Tree__data)))
(assert  (not (IsPredicateField Tree__left)))
(assert  (not (IsWandField Tree__left)))
(assert  (not (IsPredicateField Tree__right)))
(assert  (not (IsWandField Tree__right)))
(assert (forall ((Heap@@8 T@U) (ExhaleHeap@@3 T@U) (Mask@@5 T@U) ) (!  (=> (and (and (and (= (type Heap@@8) (MapType0Type RefType)) (= (type ExhaleHeap@@3) (MapType0Type RefType))) (= (type Mask@@5) (MapType1Type RefType realType))) (IdenticalOnKnownLocations Heap@@8 ExhaleHeap@@3 Mask@@5)) (succHeap Heap@@8 ExhaleHeap@@3))
 :qid |stdinbpl.83:15|
 :skolemid |10|
 :pattern ( (IdenticalOnKnownLocations Heap@@8 ExhaleHeap@@3 Mask@@5))
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
(assert  (and (forall ((arg0@@39 Real) (arg1@@17 T@U) ) (! (= (type (ConditionalFrame arg0@@39 arg1@@17)) FrameTypeType)
 :qid |funType:ConditionalFrame|
 :pattern ( (ConditionalFrame arg0@@39 arg1@@17))
)) (= (type EmptyFrame) FrameTypeType)))
(assert (forall ((p@@0 Real) (f_6 T@U) ) (!  (=> (= (type f_6) FrameTypeType) (= (ConditionalFrame p@@0 f_6) (ite (> p@@0 0.0) f_6 EmptyFrame)))
 :qid |stdinbpl.161:15|
 :skolemid |19|
 :pattern ( (ConditionalFrame p@@0 f_6))
)))
(assert (forall ((q@min@@0 Int) (q@max@@0 Int) (j@@3 Int) ) (!  (=> (and (<= 0 j@@3) (< j@@3 (- q@max@@0 q@min@@0))) (= (U_2_int (|Seq#Index| (|Seq#Range| q@min@@0 q@max@@0) j@@3)) (+ q@min@@0 j@@3)))
 :qid |stdinbpl.532:15|
 :skolemid |56|
 :pattern ( (|Seq#Index| (|Seq#Range| q@min@@0 q@max@@0) j@@3))
)))
(assert  (and (forall ((arg0@@40 T@U) (arg1@@18 T@U) ) (! (= (type (|Tree__contents#frame| arg0@@40 arg1@@18)) (SeqType intType))
 :qid |funType:Tree__contents#frame|
 :pattern ( (|Tree__contents#frame| arg0@@40 arg1@@18))
)) (forall ((arg0@@41 T@U) ) (! (= (type (FrameFragment arg0@@41)) FrameTypeType)
 :qid |funType:FrameFragment|
 :pattern ( (FrameFragment arg0@@41))
))))
(assert (forall ((Heap@@9 T@U) (Mask@@6 T@U) (t_1@@2 T@U) ) (!  (=> (and (and (and (= (type Heap@@9) (MapType0Type RefType)) (= (type Mask@@6) (MapType1Type RefType realType))) (= (type t_1@@2) RefType)) (state Heap@@9 Mask@@6)) (= (|Tree__contents'| Heap@@9 t_1@@2) (|Tree__contents#frame| (FrameFragment (ite (not (= t_1@@2 null)) (MapType0Select Heap@@9 null (Tree__state t_1@@2)) EmptyFrame)) t_1@@2)))
 :qid |stdinbpl.578:15|
 :skolemid |61|
 :pattern ( (state Heap@@9 Mask@@6) (|Tree__contents'| Heap@@9 t_1@@2))
 :pattern ( (state Heap@@9 Mask@@6) (|Tree__contents#triggerStateless| t_1@@2) (|Tree__state#trigger| Heap@@9 (Tree__state t_1@@2)) (|Tree__state#trigger| Heap@@9 (Tree__state t_1@@2)))
)))
(assert (forall ((Mask@@7 T@U) (o_2@@0 T@U) (f_4@@0 T@U) ) (! (let ((B@@3 (FieldTypeInv1 (type f_4@@0))))
(let ((A@@4 (FieldTypeInv0 (type f_4@@0))))
 (=> (and (and (= (type Mask@@7) (MapType1Type RefType realType)) (= (type o_2@@0) RefType)) (= (type f_4@@0) (FieldType A@@4 B@@3))) (= (HasDirectPerm Mask@@7 o_2@@0 f_4@@0) (> (U_2_real (MapType1Select Mask@@7 o_2@@0 f_4@@0)) NoPerm)))))
 :qid |stdinbpl.133:22|
 :skolemid |17|
 :pattern ( (HasDirectPerm Mask@@7 o_2@@0 f_4@@0))
)))
(assert (forall ((s0@@0 T@U) (s1@@0 T@U) ) (! (let ((T@@16 (SeqTypeInv0 (type s0@@0))))
 (=> (and (and (= (type s0@@0) (SeqType T@@16)) (= (type s1@@0) (SeqType T@@16))) (and (not (= s0@@0 (|Seq#Empty| T@@16))) (not (= s1@@0 (|Seq#Empty| T@@16))))) (= (|Seq#Length| (|Seq#Append| s0@@0 s1@@0)) (+ (|Seq#Length| s0@@0) (|Seq#Length| s1@@0)))))
 :qid |stdinbpl.210:18|
 :skolemid |26|
 :pattern ( (|Seq#Length| (|Seq#Append| s0@@0 s1@@0)))
)))
(assert (forall ((s@@6 T@U) (t T@U) (n@@6 Int) ) (! (let ((T@@17 (SeqTypeInv0 (type s@@6))))
 (=> (and (and (= (type s@@6) (SeqType T@@17)) (= (type t) (SeqType T@@17))) (and (> n@@6 0) (> n@@6 (|Seq#Length| s@@6)))) (and (= (|Seq#Add| (|Seq#Sub| n@@6 (|Seq#Length| s@@6)) (|Seq#Length| s@@6)) n@@6) (= (|Seq#Drop| (|Seq#Append| s@@6 t) n@@6) (|Seq#Drop| t (|Seq#Sub| n@@6 (|Seq#Length| s@@6)))))))
 :qid |stdinbpl.366:18|
 :skolemid |44|
 :pattern ( (|Seq#Drop| (|Seq#Append| s@@6 t) n@@6))
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
 :qid |stdinbpl.353:18|
 :skolemid |42|
 :pattern ( (|Seq#Take| (|Seq#Append| s@@7 t@@0) n@@7))
)))
(assert (forall ((q@min@@1 Int) (q@max@@1 Int) ) (!  (and (=> (< q@min@@1 q@max@@1) (= (|Seq#Length| (|Seq#Range| q@min@@1 q@max@@1)) (- q@max@@1 q@min@@1))) (=> (<= q@max@@1 q@min@@1) (= (|Seq#Length| (|Seq#Range| q@min@@1 q@max@@1)) 0)))
 :qid |stdinbpl.531:15|
 :skolemid |55|
 :pattern ( (|Seq#Length| (|Seq#Range| q@min@@1 q@max@@1)))
)))
(assert (forall ((a T@U) (b T@U) ) (! (let ((T@@19 (SeqTypeInv0 (type a))))
 (=> (and (and (= (type a) (SeqType T@@19)) (= (type b) (SeqType T@@19))) (|Seq#Equal| a b)) (= a b)))
 :qid |stdinbpl.504:18|
 :skolemid |53|
 :pattern ( (|Seq#Equal| a b))
)))
(assert (forall ((s@@8 T@U) (i@@2 Int) ) (! (let ((T@@20 (SeqTypeInv0 (type s@@8))))
 (=> (= (type s@@8) (SeqType T@@20)) (=> (and (<= 0 i@@2) (< i@@2 (|Seq#Length| s@@8))) (|Seq#ContainsTrigger| s@@8 (|Seq#Index| s@@8 i@@2)))))
 :qid |stdinbpl.397:18|
 :skolemid |49|
 :pattern ( (|Seq#Index| s@@8 i@@2))
)))
(assert (forall ((s0@@1 T@U) (s1@@1 T@U) ) (! (let ((T@@21 (SeqTypeInv0 (type s0@@1))))
 (=> (and (= (type s0@@1) (SeqType T@@21)) (= (type s1@@1) (SeqType T@@21))) (and (=> (= s0@@1 (|Seq#Empty| T@@21)) (= (|Seq#Append| s0@@1 s1@@1) s1@@1)) (=> (= s1@@1 (|Seq#Empty| T@@21)) (= (|Seq#Append| s0@@1 s1@@1) s0@@1)))))
 :qid |stdinbpl.216:18|
 :skolemid |27|
 :pattern ( (|Seq#Append| s0@@1 s1@@1))
)))
(assert (forall ((t@@1 T@U) ) (! (= (|Seq#Index| (|Seq#Singleton| t@@1) 0) t@@1)
 :qid |stdinbpl.220:18|
 :skolemid |28|
 :pattern ( (|Seq#Singleton| t@@1))
)))
(assert (forall ((s@@9 T@U) ) (! (let ((T@@22 (SeqTypeInv0 (type s@@9))))
 (=> (= (type s@@9) (SeqType T@@22)) (<= 0 (|Seq#Length| s@@9))))
 :qid |stdinbpl.199:18|
 :skolemid |22|
 :pattern ( (|Seq#Length| s@@9))
)))
(assert (forall ((s0@@2 T@U) (s1@@2 T@U) ) (! (let ((T@@23 (SeqTypeInv0 (type s0@@2))))
 (=> (and (and (= (type s0@@2) (SeqType T@@23)) (= (type s1@@2) (SeqType T@@23))) (|Seq#Equal| s0@@2 s1@@2)) (and (= (|Seq#Length| s0@@2) (|Seq#Length| s1@@2)) (forall ((j@@4 Int) ) (!  (=> (and (<= 0 j@@4) (< j@@4 (|Seq#Length| s0@@2))) (= (|Seq#Index| s0@@2 j@@4) (|Seq#Index| s1@@2 j@@4)))
 :qid |stdinbpl.494:13|
 :skolemid |50|
 :pattern ( (|Seq#Index| s0@@2 j@@4))
 :pattern ( (|Seq#Index| s1@@2 j@@4))
)))))
 :qid |stdinbpl.491:18|
 :skolemid |51|
 :pattern ( (|Seq#Equal| s0@@2 s1@@2))
)))
(assert (forall ((Heap@@10 T@U) (ExhaleHeap@@4 T@U) (Mask@@8 T@U) (pm_f@@1 T@U) ) (! (let ((C@@1 (FieldTypeInv0 (type pm_f@@1))))
 (=> (and (and (and (and (and (= (type Heap@@10) (MapType0Type RefType)) (= (type ExhaleHeap@@4) (MapType0Type RefType))) (= (type Mask@@8) (MapType1Type RefType realType))) (= (type pm_f@@1) (FieldType C@@1 FrameTypeType))) (IdenticalOnKnownLocations Heap@@10 ExhaleHeap@@4 Mask@@8)) (and (HasDirectPerm Mask@@8 null pm_f@@1) (IsPredicateField pm_f@@1))) (forall ((o2 T@U) (f_2@@0 T@U) ) (! (let ((B@@5 (FieldTypeInv1 (type f_2@@0))))
(let ((A@@6 (FieldTypeInv0 (type f_2@@0))))
 (=> (and (and (= (type o2) RefType) (= (type f_2@@0) (FieldType A@@6 B@@5))) (U_2_bool (MapType1Select (MapType0Select Heap@@10 null (PredicateMaskField pm_f@@1)) o2 f_2@@0))) (= (MapType0Select Heap@@10 o2 f_2@@0) (MapType0Select ExhaleHeap@@4 o2 f_2@@0)))))
 :qid |stdinbpl.54:134|
 :skolemid |3|
 :pattern ( (MapType0Select ExhaleHeap@@4 o2 f_2@@0))
))))
 :qid |stdinbpl.52:19|
 :skolemid |4|
 :pattern ( (IdenticalOnKnownLocations Heap@@10 ExhaleHeap@@4 Mask@@8) (IsPredicateField pm_f@@1))
)))
(assert (forall ((Heap@@11 T@U) (ExhaleHeap@@5 T@U) (Mask@@9 T@U) (pm_f@@2 T@U) ) (! (let ((C@@2 (FieldTypeInv0 (type pm_f@@2))))
 (=> (and (and (and (and (and (= (type Heap@@11) (MapType0Type RefType)) (= (type ExhaleHeap@@5) (MapType0Type RefType))) (= (type Mask@@9) (MapType1Type RefType realType))) (= (type pm_f@@2) (FieldType C@@2 FrameTypeType))) (IdenticalOnKnownLocations Heap@@11 ExhaleHeap@@5 Mask@@9)) (and (HasDirectPerm Mask@@9 null pm_f@@2) (IsWandField pm_f@@2))) (forall ((o2@@0 T@U) (f_2@@1 T@U) ) (! (let ((B@@6 (FieldTypeInv1 (type f_2@@1))))
(let ((A@@7 (FieldTypeInv0 (type f_2@@1))))
 (=> (and (and (= (type o2@@0) RefType) (= (type f_2@@1) (FieldType A@@7 B@@6))) (U_2_bool (MapType1Select (MapType0Select Heap@@11 null (WandMaskField pm_f@@2)) o2@@0 f_2@@1))) (= (MapType0Select Heap@@11 o2@@0 f_2@@1) (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1)))))
 :qid |stdinbpl.67:129|
 :skolemid |6|
 :pattern ( (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1))
))))
 :qid |stdinbpl.65:19|
 :skolemid |7|
 :pattern ( (IdenticalOnKnownLocations Heap@@11 ExhaleHeap@@5 Mask@@9) (IsWandField pm_f@@2))
)))
(assert (forall ((diz@@3 T@U) ) (!  (=> (= (type diz@@3) RefType) (= (getPredWandId (Tree__state diz@@3)) 0))
 :qid |stdinbpl.768:15|
 :skolemid |67|
 :pattern ( (Tree__state diz@@3))
)))
(assert (forall ((t@@2 T@U) ) (! (= (|Seq#Length| (|Seq#Singleton| t@@2)) 1)
 :qid |stdinbpl.207:18|
 :skolemid |25|
 :pattern ( (|Seq#Singleton| t@@2))
)))
(assert (forall ((Mask@@10 T@U) (o_2@@2 T@U) (f_4@@2 T@U) ) (! (let ((B@@7 (FieldTypeInv1 (type f_4@@2))))
(let ((A@@8 (FieldTypeInv0 (type f_4@@2))))
 (=> (and (and (and (= (type Mask@@10) (MapType1Type RefType realType)) (= (type o_2@@2) RefType)) (= (type f_4@@2) (FieldType A@@8 B@@7))) (GoodMask Mask@@10)) (and (>= (U_2_real (MapType1Select Mask@@10 o_2@@2 f_4@@2)) NoPerm) (=> (and (and (GoodMask Mask@@10) (not (IsPredicateField f_4@@2))) (not (IsWandField f_4@@2))) (<= (U_2_real (MapType1Select Mask@@10 o_2@@2 f_4@@2)) FullPerm))))))
 :qid |stdinbpl.128:22|
 :skolemid |16|
 :pattern ( (GoodMask Mask@@10) (MapType1Select Mask@@10 o_2@@2 f_4@@2))
)))
(assert (forall ((o T@U) (f T@U) (Heap@@12 T@U) ) (!  (=> (and (and (and (= (type o) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap@@12) (MapType0Type RefType))) (U_2_bool (MapType0Select Heap@@12 o $allocated))) (U_2_bool (MapType0Select Heap@@12 (MapType0Select Heap@@12 o f) $allocated)))
 :qid |stdinbpl.31:15|
 :skolemid |0|
 :pattern ( (MapType0Select Heap@@12 o f))
)))
(assert (forall ((s@@10 T@U) (t@@3 T@U) (n@@8 Int) ) (! (let ((T@@24 (SeqTypeInv0 (type s@@10))))
 (=> (and (and (= (type s@@10) (SeqType T@@24)) (= (type t@@3) (SeqType T@@24))) (and (< 0 n@@8) (<= n@@8 (|Seq#Length| s@@10)))) (= (|Seq#Take| (|Seq#Append| s@@10 t@@3) n@@8) (|Seq#Take| s@@10 n@@8))))
 :qid |stdinbpl.349:18|
 :skolemid |41|
 :pattern ( (|Seq#Take| (|Seq#Append| s@@10 t@@3) n@@8))
)))
(assert (forall ((s@@11 T@U) (i@@3 Int) (v@@1 T@U) ) (! (let ((T@@25 (type v@@1)))
 (=> (= (type s@@11) (SeqType T@@25)) (=> (and (<= 0 i@@3) (< i@@3 (|Seq#Length| s@@11))) (= (|Seq#Length| (|Seq#Update| s@@11 i@@3 v@@1)) (|Seq#Length| s@@11)))))
 :qid |stdinbpl.248:18|
 :skolemid |34|
 :pattern ( (|Seq#Length| (|Seq#Update| s@@11 i@@3 v@@1)))
 :pattern ( (|Seq#Length| s@@11) (|Seq#Update| s@@11 i@@3 v@@1))
)))
(assert (forall ((diz@@4 T@U) ) (!  (=> (= (type diz@@4) RefType) (= (PredicateMaskField (Tree__state diz@@4)) (|Tree__state#sm| diz@@4)))
 :qid |stdinbpl.760:15|
 :skolemid |65|
 :pattern ( (PredicateMaskField (Tree__state diz@@4)))
)))
(assert (forall ((s@@12 T@U) (t@@4 T@U) (n@@9 Int) ) (! (let ((T@@26 (SeqTypeInv0 (type s@@12))))
 (=> (and (and (= (type s@@12) (SeqType T@@26)) (= (type t@@4) (SeqType T@@26))) (and (< 0 n@@9) (<= n@@9 (|Seq#Length| s@@12)))) (= (|Seq#Drop| (|Seq#Append| s@@12 t@@4) n@@9) (|Seq#Append| (|Seq#Drop| s@@12 n@@9) t@@4))))
 :qid |stdinbpl.362:18|
 :skolemid |43|
 :pattern ( (|Seq#Drop| (|Seq#Append| s@@12 t@@4) n@@9))
)))
(assert (forall ((s@@13 T@U) (n@@10 Int) (i@@4 Int) ) (! (let ((T@@27 (SeqTypeInv0 (type s@@13))))
 (=> (= (type s@@13) (SeqType T@@27)) (=> (and (and (< 0 n@@10) (<= n@@10 i@@4)) (< i@@4 (|Seq#Length| s@@13))) (and (= (|Seq#Add| (|Seq#Sub| i@@4 n@@10) n@@10) i@@4) (= (|Seq#Index| (|Seq#Drop| s@@13 n@@10) (|Seq#Sub| i@@4 n@@10)) (|Seq#Index| s@@13 i@@4))))))
 :qid |stdinbpl.299:18|
 :skolemid |40|
 :pattern ( (|Seq#Drop| s@@13 n@@10) (|Seq#Index| s@@13 i@@4))
)))
(assert (forall ((s0@@3 T@U) (s1@@3 T@U) (n@@11 Int) ) (! (let ((T@@28 (SeqTypeInv0 (type s0@@3))))
 (=> (and (= (type s0@@3) (SeqType T@@28)) (= (type s1@@3) (SeqType T@@28))) (=> (and (and (and (not (= s0@@3 (|Seq#Empty| T@@28))) (not (= s1@@3 (|Seq#Empty| T@@28)))) (<= 0 n@@11)) (< n@@11 (|Seq#Length| s0@@3))) (= (|Seq#Index| (|Seq#Append| s0@@3 s1@@3) n@@11) (|Seq#Index| s0@@3 n@@11)))))
 :qid |stdinbpl.239:18|
 :skolemid |31|
 :pattern ( (|Seq#Index| (|Seq#Append| s0@@3 s1@@3) n@@11))
 :pattern ( (|Seq#Index| s0@@3 n@@11) (|Seq#Append| s0@@3 s1@@3))
)))
(assert (forall ((Heap@@13 T@U) (o@@0 T@U) (f_3 T@U) (v@@2 T@U) ) (! (let ((B@@8 (type v@@2)))
(let ((A@@9 (FieldTypeInv0 (type f_3))))
 (=> (and (and (= (type Heap@@13) (MapType0Type RefType)) (= (type o@@0) RefType)) (= (type f_3) (FieldType A@@9 B@@8))) (succHeap Heap@@13 (MapType0Store Heap@@13 o@@0 f_3 v@@2)))))
 :qid |stdinbpl.78:22|
 :skolemid |9|
 :pattern ( (MapType0Store Heap@@13 o@@0 f_3 v@@2))
)))
(assert (forall ((s0@@4 T@U) (s1@@4 T@U) (m@@7 Int) ) (! (let ((T@@29 (SeqTypeInv0 (type s0@@4))))
 (=> (and (= (type s0@@4) (SeqType T@@29)) (= (type s1@@4) (SeqType T@@29))) (=> (and (and (and (not (= s0@@4 (|Seq#Empty| T@@29))) (not (= s1@@4 (|Seq#Empty| T@@29)))) (<= 0 m@@7)) (< m@@7 (|Seq#Length| s1@@4))) (and (= (|Seq#Sub| (|Seq#Add| m@@7 (|Seq#Length| s0@@4)) (|Seq#Length| s0@@4)) m@@7) (= (|Seq#Index| (|Seq#Append| s0@@4 s1@@4) (|Seq#Add| m@@7 (|Seq#Length| s0@@4))) (|Seq#Index| s1@@4 m@@7))))))
 :qid |stdinbpl.244:18|
 :skolemid |33|
 :pattern ( (|Seq#Index| s1@@4 m@@7) (|Seq#Append| s0@@4 s1@@4))
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
 :qid |stdinbpl.395:18|
 :skolemid |48|
 :pattern ( (|Seq#Contains| s@@14 x@@10) (|Seq#Index| s@@14 i@@5))
)))
(assert (forall ((s0@@5 T@U) (s1@@5 T@U) ) (! (let ((T@@31 (SeqTypeInv0 (type s0@@5))))
 (=> (and (= (type s0@@5) (SeqType T@@31)) (= (type s1@@5) (SeqType T@@31))) (or (or (and (= s0@@5 s1@@5) (|Seq#Equal| s0@@5 s1@@5)) (and (and (not (= s0@@5 s1@@5)) (not (|Seq#Equal| s0@@5 s1@@5))) (not (= (|Seq#Length| s0@@5) (|Seq#Length| s1@@5))))) (and (and (and (and (and (and (not (= s0@@5 s1@@5)) (not (|Seq#Equal| s0@@5 s1@@5))) (= (|Seq#Length| s0@@5) (|Seq#Length| s1@@5))) (= (|Seq#SkolemDiff| s0@@5 s1@@5) (|Seq#SkolemDiff| s1@@5 s0@@5))) (<= 0 (|Seq#SkolemDiff| s0@@5 s1@@5))) (< (|Seq#SkolemDiff| s0@@5 s1@@5) (|Seq#Length| s0@@5))) (not (= (|Seq#Index| s0@@5 (|Seq#SkolemDiff| s0@@5 s1@@5)) (|Seq#Index| s1@@5 (|Seq#SkolemDiff| s0@@5 s1@@5))))))))
 :qid |stdinbpl.499:18|
 :skolemid |52|
 :pattern ( (|Seq#Equal| s0@@5 s1@@5))
)))
(assert (forall ((p@@1 T@U) (v_1@@0 T@U) (q T@U) (w@@0 T@U) (r T@U) (u T@U) ) (! (let ((C@@3 (FieldTypeInv0 (type r))))
(let ((B@@10 (FieldTypeInv0 (type q))))
(let ((A@@11 (FieldTypeInv0 (type p@@1))))
 (=> (and (and (and (and (and (and (= (type p@@1) (FieldType A@@11 FrameTypeType)) (= (type v_1@@0) FrameTypeType)) (= (type q) (FieldType B@@10 FrameTypeType))) (= (type w@@0) FrameTypeType)) (= (type r) (FieldType C@@3 FrameTypeType))) (= (type u) FrameTypeType)) (and (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))) (InsidePredicate p@@1 v_1@@0 r u)))))
 :qid |stdinbpl.168:25|
 :skolemid |20|
 :pattern ( (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))
)))
(assert (forall ((s@@15 T@U) ) (! (let ((T@@32 (SeqTypeInv0 (type s@@15))))
 (=> (and (= (type s@@15) (SeqType T@@32)) (= (|Seq#Length| s@@15) 0)) (= s@@15 (|Seq#Empty| T@@32))))
 :qid |stdinbpl.203:18|
 :skolemid |24|
 :pattern ( (|Seq#Length| s@@15))
)))
(assert (forall ((s@@16 T@U) (n@@12 Int) ) (! (let ((T@@33 (SeqTypeInv0 (type s@@16))))
 (=> (and (= (type s@@16) (SeqType T@@33)) (<= n@@12 0)) (= (|Seq#Take| s@@16 n@@12) (|Seq#Empty| T@@33))))
 :qid |stdinbpl.378:18|
 :skolemid |46|
 :pattern ( (|Seq#Take| s@@16 n@@12))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
(assert (forall ((Heap@@14 T@U) (Mask@@11 T@U) (t_1@@3 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@14) (MapType0Type RefType)) (= (type Mask@@11) (MapType1Type RefType realType))) (= (type t_1@@3) RefType)) (and (state Heap@@14 Mask@@11) (or (< AssumeFunctionsAbove 0) (|Tree__contents#trigger| (FrameFragment (ite (not (= t_1@@3 null)) (MapType0Select Heap@@14 null (Tree__state t_1@@3)) EmptyFrame)) t_1@@3)))) (not (= t_1@@3 null))) (> (|Seq#Length| (|Tree__contents'| Heap@@14 t_1@@3)) 0))
 :qid |stdinbpl.584:15|
 :skolemid |62|
 :pattern ( (state Heap@@14 Mask@@11) (|Tree__contents'| Heap@@14 t_1@@3))
)))
(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun Mask@0 () T@U)
(declare-fun t_1@@4 () T@U)
(declare-fun PostMask@2 () T@U)
(declare-fun PostMask@1 () T@U)
(declare-fun sys__result () T@U)
(declare-fun PostMask@3 () T@U)
(declare-fun PostHeap@0 () T@U)
(declare-fun PostMask@0 () T@U)
(declare-fun ExhaleWellDef0Mask@2 () T@U)
(declare-fun Mask@8 () T@U)
(declare-fun __flatten_1@0 () T@U)
(declare-fun ExhaleWellDef0Mask@3 () T@U)
(declare-fun Heap@1 () T@U)
(declare-fun Heap@@15 () T@U)
(declare-fun AssertMask@1 () T@U)
(declare-fun ExhaleWellDef0Mask@4 () T@U)
(declare-fun ExhaleWellDef0Mask@5 () T@U)
(declare-fun ExhaleWellDef0Mask@0 () T@U)
(declare-fun Mask@19 () T@U)
(declare-fun ExhaleWellDef0Mask@1 () T@U)
(declare-fun Heap@12 () T@U)
(declare-fun AssertMask@0 () T@U)
(declare-fun Heap@10 () T@U)
(declare-fun newPMask@1 () T@U)
(declare-fun Heap@11 () T@U)
(declare-fun Heap@8 () T@U)
(declare-fun newPMask@0 () T@U)
(declare-fun Heap@9 () T@U)
(declare-fun Heap@6 () T@U)
(declare-fun Heap@5 () T@U)
(declare-fun Heap@7 () T@U)
(declare-fun Heap@2 () T@U)
(declare-fun Heap@3 () T@U)
(declare-fun Heap@4 () T@U)
(declare-fun freshVersion@0 () T@U)
(declare-fun Mask@18 () T@U)
(declare-fun CombineFrames (T@U T@U) T@U)
(declare-fun Mask@17 () T@U)
(declare-fun Mask@16 () T@U)
(declare-fun Mask@15 () T@U)
(declare-fun Mask@14 () T@U)
(declare-fun Mask@13 () T@U)
(declare-fun Mask@12 () T@U)
(declare-fun Mask@11 () T@U)
(declare-fun ExhaleHeap@0 () T@U)
(declare-fun __flatten_3@0 () T@U)
(declare-fun arg_t@0 () T@U)
(declare-fun Mask@9 () T@U)
(declare-fun Mask@10 () T@U)
(declare-fun diz@@5 () T@U)
(declare-fun current_thread_id () Int)
(declare-fun Mask@6 () T@U)
(declare-fun Mask@7 () T@U)
(declare-fun Mask@4 () T@U)
(declare-fun Mask@5 () T@U)
(declare-fun Mask@2 () T@U)
(declare-fun Mask@1 () T@U)
(declare-fun Mask@3 () T@U)
(declare-fun Heap@0 () T@U)
(declare-fun newVersion@0 () T@U)
(declare-fun __flatten_1 () T@U)
(declare-fun __flatten_2 () T@U)
(declare-fun __flatten_3 () T@U)
(declare-fun __flatten_4 () T@U)
(declare-fun __flatten_7 () T@U)
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (= (type Heap@12) (MapType0Type RefType)) (= (type t_1@@4) RefType)) (= (type Heap@@15) (MapType0Type RefType))) (= (type ExhaleWellDef0Mask@1) (MapType1Type RefType realType))) (= (type Mask@19) (MapType1Type RefType realType))) (= (type ExhaleWellDef0Mask@0) (MapType1Type RefType realType))) (= (type Mask@0) (MapType1Type RefType realType))) (= (type AssertMask@0) (MapType1Type RefType realType))) (= (type Heap@10) (MapType0Type RefType))) (= (type newPMask@1) (MapType1Type RefType boolType))) (= (type Heap@11) (MapType0Type RefType))) (= (type Heap@8) (MapType0Type RefType))) (= (type newPMask@0) (MapType1Type RefType boolType))) (= (type Heap@9) (MapType0Type RefType))) (= (type Heap@6) (MapType0Type RefType))) (= (type Heap@5) (MapType0Type RefType))) (= (type Heap@7) (MapType0Type RefType))) (= (type Heap@3) (MapType0Type RefType))) (= (type Heap@2) (MapType0Type RefType))) (= (type Heap@4) (MapType0Type RefType))) (= (type freshVersion@0) FrameTypeType)) (= (type Mask@18) (MapType1Type RefType realType))) (forall ((arg0@@42 T@U) (arg1@@19 T@U) ) (! (= (type (CombineFrames arg0@@42 arg1@@19)) FrameTypeType)
 :qid |funType:CombineFrames|
 :pattern ( (CombineFrames arg0@@42 arg1@@19))
))) (= (type Mask@16) (MapType1Type RefType realType))) (= (type Mask@17) (MapType1Type RefType realType))) (= (type Mask@14) (MapType1Type RefType realType))) (= (type Mask@15) (MapType1Type RefType realType))) (= (type Mask@13) (MapType1Type RefType realType))) (= (type Mask@12) (MapType1Type RefType realType))) (= (type Mask@11) (MapType1Type RefType realType))) (= (type ExhaleHeap@0) (MapType0Type RefType))) (= (type __flatten_3@0) RefType)) (= (type Heap@1) (MapType0Type RefType))) (= (type arg_t@0) RefType)) (= (type Mask@10) (MapType1Type RefType realType))) (= (type Mask@9) (MapType1Type RefType realType))) (= (type Mask@8) (MapType1Type RefType realType))) (= (type diz@@5) RefType)) (= (type ExhaleWellDef0Mask@5) (MapType1Type RefType realType))) (= (type ExhaleWellDef0Mask@4) (MapType1Type RefType realType))) (= (type __flatten_1@0) RefType)) (= (type ExhaleWellDef0Mask@3) (MapType1Type RefType realType))) (= (type ExhaleWellDef0Mask@2) (MapType1Type RefType realType))) (= (type AssertMask@1) (MapType1Type RefType realType))) (= (type Mask@7) (MapType1Type RefType realType))) (= (type Mask@6) (MapType1Type RefType realType))) (= (type Mask@5) (MapType1Type RefType realType))) (= (type Mask@4) (MapType1Type RefType realType))) (= (type Mask@2) (MapType1Type RefType realType))) (= (type Mask@1) (MapType1Type RefType realType))) (= (type Mask@3) (MapType1Type RefType realType))) (= (type Heap@0) (MapType0Type RefType))) (= (type newVersion@0) FrameTypeType)) (= (type __flatten_1) RefType)) (= (type __flatten_2) RefType)) (= (type __flatten_3) RefType)) (= (type __flatten_4) RefType)) (= (type __flatten_7) RefType)) (= (type sys__result) RefType)) (= (type PostMask@3) (MapType1Type RefType realType))) (= (type PostMask@1) (MapType1Type RefType realType))) (= (type PostMask@2) (MapType1Type RefType realType))) (= (type PostHeap@0) (MapType0Type RefType))) (= (type PostMask@0) (MapType1Type RefType realType))))
(set-info :boogie-vc-id Tree__del_min)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 134) (let ((anon13_correct true))
(let ((anon98_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 127) 123)) anon13_correct)))
(let ((anon98_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 125) (- 0 126)) (<= FullPerm (U_2_real (MapType1Select Mask@0 null (Tree__state t_1@@4))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@0 null (Tree__state t_1@@4)))) (=> (= (ControlFlow 0 125) 123) anon13_correct))))))
(let ((anon97_Then_correct  (=> (not (= t_1@@4 null)) (and (=> (= (ControlFlow 0 128) 125) anon98_Then_correct) (=> (= (ControlFlow 0 128) 127) anon98_Else_correct)))))
(let ((anon97_Else_correct  (=> (and (= t_1@@4 null) (= (ControlFlow 0 124) 123)) anon13_correct)))
(let ((anon8_correct true))
(let ((anon7_correct  (=> (= PostMask@2 (MapType1Store PostMask@1 null (Tree__state sys__result) (real_2_U (- (U_2_real (MapType1Select PostMask@1 null (Tree__state sys__result))) FullPerm)))) (=> (and (= PostMask@3 PostMask@2) (= (ControlFlow 0 118) 116)) anon8_correct))))
(let ((anon95_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 121) 118)) anon7_correct)))
(let ((anon95_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 119) (- 0 120)) (<= FullPerm (U_2_real (MapType1Select PostMask@1 null (Tree__state sys__result))))) (=> (<= FullPerm (U_2_real (MapType1Select PostMask@1 null (Tree__state sys__result)))) (=> (= (ControlFlow 0 119) 118) anon7_correct))))))
(let ((anon94_Then_correct  (=> (not (= sys__result null)) (and (=> (= (ControlFlow 0 122) 119) anon95_Then_correct) (=> (= (ControlFlow 0 122) 121) anon95_Else_correct)))))
(let ((anon94_Else_correct  (=> (= sys__result null) (=> (and (= PostMask@3 PostMask@1) (= (ControlFlow 0 117) 116)) anon8_correct))))
(let ((anon96_Else_correct true))
(let ((anon3_correct  (=> (and (state PostHeap@0 PostMask@1) (state PostHeap@0 PostMask@1)) (and (and (and (and (=> (= (ControlFlow 0 129) 115) anon96_Else_correct) (=> (= (ControlFlow 0 129) 128) anon97_Then_correct)) (=> (= (ControlFlow 0 129) 124) anon97_Else_correct)) (=> (= (ControlFlow 0 129) 122) anon94_Then_correct)) (=> (= (ControlFlow 0 129) 117) anon94_Else_correct)))))
(let ((anon92_Else_correct  (=> (= sys__result null) (=> (and (= PostMask@1 ZeroMask) (= (ControlFlow 0 131) 129)) anon3_correct))))
(let ((anon92_Then_correct  (=> (not (= sys__result null)) (=> (and (and (= PostMask@0 (MapType1Store ZeroMask null (Tree__state sys__result) (real_2_U (+ (U_2_real (MapType1Select ZeroMask null (Tree__state sys__result))) FullPerm)))) (state PostHeap@0 PostMask@0)) (and (= PostMask@1 PostMask@0) (= (ControlFlow 0 130) 129))) anon3_correct))))
(let ((anon91_Then_correct  (=> (state PostHeap@0 ZeroMask) (and (=> (= (ControlFlow 0 132) 130) anon92_Then_correct) (=> (= (ControlFlow 0 132) 131) anon92_Else_correct)))))
(let ((anon44_correct true))
(let ((anon114_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 88) 84)) anon44_correct)))
(let ((anon114_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 86) (- 0 87)) (<= FullPerm (U_2_real (MapType1Select Mask@0 null (Tree__state t_1@@4))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@0 null (Tree__state t_1@@4)))) (=> (= (ControlFlow 0 86) 84) anon44_correct))))))
(let ((anon113_Then_correct  (=> (not (= t_1@@4 null)) (and (=> (= (ControlFlow 0 89) 86) anon114_Then_correct) (=> (= (ControlFlow 0 89) 88) anon114_Else_correct)))))
(let ((anon113_Else_correct  (=> (and (= t_1@@4 null) (= (ControlFlow 0 85) 84)) anon44_correct)))
(let ((anon39_correct true))
(let ((anon38_correct  (=> (= ExhaleWellDef0Mask@2 (MapType1Store Mask@8 null (Tree__state __flatten_1@0) (real_2_U (- (U_2_real (MapType1Select Mask@8 null (Tree__state __flatten_1@0))) FullPerm)))) (=> (and (= ExhaleWellDef0Mask@3 ExhaleWellDef0Mask@2) (= (ControlFlow 0 79) 77)) anon39_correct))))
(let ((anon111_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 82) 79)) anon38_correct)))
(let ((anon111_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 80) (- 0 81)) (<= FullPerm (U_2_real (MapType1Select Mask@8 null (Tree__state __flatten_1@0))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@8 null (Tree__state __flatten_1@0)))) (=> (= (ControlFlow 0 80) 79) anon38_correct))))))
(let ((anon110_Then_correct  (=> (not (= __flatten_1@0 null)) (and (=> (= (ControlFlow 0 83) 80) anon111_Then_correct) (=> (= (ControlFlow 0 83) 82) anon111_Else_correct)))))
(let ((anon110_Else_correct  (=> (= __flatten_1@0 null) (=> (and (= ExhaleWellDef0Mask@3 Mask@8) (= (ControlFlow 0 78) 77)) anon39_correct))))
(let ((anon112_Else_correct  (=> (= (ControlFlow 0 76) (- 0 75)) (|Seq#Equal| (Tree__contents Heap@1 __flatten_1@0) (|Seq#Drop| (Tree__contents Heap@@15 t_1@@4) 1)))))
(let ((anon33_correct  (=> (= AssertMask@1 (MapType1Store Mask@8 null (Tree__state __flatten_1@0) (real_2_U (- (U_2_real (MapType1Select Mask@8 null (Tree__state __flatten_1@0))) FullPerm)))) (and (and (and (and (=> (= (ControlFlow 0 91) 76) anon112_Else_correct) (=> (= (ControlFlow 0 91) 89) anon113_Then_correct)) (=> (= (ControlFlow 0 91) 85) anon113_Else_correct)) (=> (= (ControlFlow 0 91) 83) anon110_Then_correct)) (=> (= (ControlFlow 0 91) 78) anon110_Else_correct)))))
(let ((anon108_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 94) 91)) anon33_correct)))
(let ((anon108_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 92) (- 0 93)) (<= FullPerm (U_2_real (MapType1Select Mask@8 null (Tree__state __flatten_1@0))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@8 null (Tree__state __flatten_1@0)))) (=> (= (ControlFlow 0 92) 91) anon33_correct))))))
(let ((anon107_Then_correct  (=> (not (= __flatten_1@0 null)) (and (=> (= (ControlFlow 0 95) 92) anon108_Then_correct) (=> (= (ControlFlow 0 95) 94) anon108_Else_correct)))))
(let ((anon107_Else_correct  (=> (= __flatten_1@0 null) (and (and (and (and (=> (= (ControlFlow 0 90) 76) anon112_Else_correct) (=> (= (ControlFlow 0 90) 89) anon113_Then_correct)) (=> (= (ControlFlow 0 90) 85) anon113_Else_correct)) (=> (= (ControlFlow 0 90) 83) anon110_Then_correct)) (=> (= (ControlFlow 0 90) 78) anon110_Else_correct)))))
(let ((anon104_Else_correct  (and (=> (= (ControlFlow 0 96) (- 0 98)) (|Seq#Equal| (Tree__contents Heap@1 (MapType0Select Heap@1 t_1@@4 Tree__left)) (|Seq#Empty| intType))) (=> (|Seq#Equal| (Tree__contents Heap@1 (MapType0Select Heap@1 t_1@@4 Tree__left)) (|Seq#Empty| intType)) (=> (state Heap@1 Mask@8) (and (=> (= (ControlFlow 0 96) (- 0 97)) (HasDirectPerm Mask@8 t_1@@4 Tree__right)) (=> (HasDirectPerm Mask@8 t_1@@4 Tree__right) (=> (= __flatten_1@0 (MapType0Select Heap@1 t_1@@4 Tree__right)) (=> (and (state Heap@1 Mask@8) (state Heap@1 Mask@8)) (and (=> (= (ControlFlow 0 96) 95) anon107_Then_correct) (=> (= (ControlFlow 0 96) 90) anon107_Else_correct)))))))))))
(let ((anon29_correct true))
(let ((anon28_correct  (=> (= ExhaleWellDef0Mask@4 (MapType1Store Mask@8 null (Tree__state (MapType0Select Heap@1 t_1@@4 Tree__left)) (real_2_U (- (U_2_real (MapType1Select Mask@8 null (Tree__state (MapType0Select Heap@1 t_1@@4 Tree__left)))) FullPerm)))) (=> (and (= ExhaleWellDef0Mask@5 ExhaleWellDef0Mask@4) (= (ControlFlow 0 70) 68)) anon29_correct))))
(let ((anon106_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 73) 70)) anon28_correct)))
(let ((anon106_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 71) (- 0 72)) (<= FullPerm (U_2_real (MapType1Select Mask@8 null (Tree__state (MapType0Select Heap@1 t_1@@4 Tree__left)))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@8 null (Tree__state (MapType0Select Heap@1 t_1@@4 Tree__left))))) (=> (= (ControlFlow 0 71) 70) anon28_correct))))))
(let ((anon105_Then_correct  (=> (not (= (MapType0Select Heap@1 t_1@@4 Tree__left) null)) (and (=> (= (ControlFlow 0 74) 71) anon106_Then_correct) (=> (= (ControlFlow 0 74) 73) anon106_Else_correct)))))
(let ((anon105_Else_correct  (=> (= (MapType0Select Heap@1 t_1@@4 Tree__left) null) (=> (and (= ExhaleWellDef0Mask@5 Mask@8) (= (ControlFlow 0 69) 68)) anon29_correct))))
(let ((anon103_Then_correct  (=> (= (MapType0Select Heap@1 t_1@@4 Tree__left) null) (and (=> (= (ControlFlow 0 99) (- 0 100)) (HasDirectPerm Mask@8 t_1@@4 Tree__left)) (=> (HasDirectPerm Mask@8 t_1@@4 Tree__left) (and (and (=> (= (ControlFlow 0 99) 96) anon104_Else_correct) (=> (= (ControlFlow 0 99) 74) anon105_Then_correct)) (=> (= (ControlFlow 0 99) 69) anon105_Else_correct)))))))
(let ((anon84_correct true))
(let ((anon134_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 14) 10)) anon84_correct)))
(let ((anon134_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 12) (- 0 13)) (<= FullPerm (U_2_real (MapType1Select Mask@0 null (Tree__state t_1@@4))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@0 null (Tree__state t_1@@4)))) (=> (= (ControlFlow 0 12) 10) anon84_correct))))))
(let ((anon133_Then_correct  (=> (not (= t_1@@4 null)) (and (=> (= (ControlFlow 0 15) 12) anon134_Then_correct) (=> (= (ControlFlow 0 15) 14) anon134_Else_correct)))))
(let ((anon133_Else_correct  (=> (and (= t_1@@4 null) (= (ControlFlow 0 11) 10)) anon84_correct)))
(let ((anon79_correct true))
(let ((anon78_correct  (=> (= ExhaleWellDef0Mask@0 (MapType1Store Mask@19 null (Tree__state t_1@@4) (real_2_U (- (U_2_real (MapType1Select Mask@19 null (Tree__state t_1@@4))) FullPerm)))) (=> (and (= ExhaleWellDef0Mask@1 ExhaleWellDef0Mask@0) (= (ControlFlow 0 5) 3)) anon79_correct))))
(let ((anon131_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 8) 5)) anon78_correct)))
(let ((anon131_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 6) (- 0 7)) (<= FullPerm (U_2_real (MapType1Select Mask@19 null (Tree__state t_1@@4))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@19 null (Tree__state t_1@@4)))) (=> (= (ControlFlow 0 6) 5) anon78_correct))))))
(let ((anon130_Then_correct  (=> (not (= t_1@@4 null)) (and (=> (= (ControlFlow 0 9) 6) anon131_Then_correct) (=> (= (ControlFlow 0 9) 8) anon131_Else_correct)))))
(let ((anon130_Else_correct  (=> (= t_1@@4 null) (=> (and (= ExhaleWellDef0Mask@1 Mask@19) (= (ControlFlow 0 4) 3)) anon79_correct))))
(let ((anon132_Else_correct  (=> (= (ControlFlow 0 2) (- 0 1)) (|Seq#Equal| (Tree__contents Heap@12 t_1@@4) (|Seq#Drop| (Tree__contents Heap@@15 t_1@@4) 1)))))
(let ((anon73_correct  (=> (= AssertMask@0 (MapType1Store Mask@19 null (Tree__state t_1@@4) (real_2_U (- (U_2_real (MapType1Select Mask@19 null (Tree__state t_1@@4))) FullPerm)))) (and (and (and (and (=> (= (ControlFlow 0 17) 2) anon132_Else_correct) (=> (= (ControlFlow 0 17) 15) anon133_Then_correct)) (=> (= (ControlFlow 0 17) 11) anon133_Else_correct)) (=> (= (ControlFlow 0 17) 9) anon130_Then_correct)) (=> (= (ControlFlow 0 17) 4) anon130_Else_correct)))))
(let ((anon128_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 20) 17)) anon73_correct)))
(let ((anon128_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 18) (- 0 19)) (<= FullPerm (U_2_real (MapType1Select Mask@19 null (Tree__state t_1@@4))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@19 null (Tree__state t_1@@4)))) (=> (= (ControlFlow 0 18) 17) anon73_correct))))))
(let ((anon127_Then_correct  (=> (not (= t_1@@4 null)) (and (=> (= (ControlFlow 0 21) 18) anon128_Then_correct) (=> (= (ControlFlow 0 21) 20) anon128_Else_correct)))))
(let ((anon127_Else_correct  (=> (= t_1@@4 null) (and (and (and (and (=> (= (ControlFlow 0 16) 2) anon132_Else_correct) (=> (= (ControlFlow 0 16) 15) anon133_Then_correct)) (=> (= (ControlFlow 0 16) 11) anon133_Else_correct)) (=> (= (ControlFlow 0 16) 9) anon130_Then_correct)) (=> (= (ControlFlow 0 16) 4) anon130_Else_correct)))))
(let ((anon70_correct  (=> (and (and (state Heap@12 Mask@19) (state Heap@12 Mask@19)) (and (state Heap@12 Mask@19) (state Heap@12 Mask@19))) (and (=> (= (ControlFlow 0 22) 21) anon127_Then_correct) (=> (= (ControlFlow 0 22) 16) anon127_Else_correct)))))
(let ((anon126_Else_correct  (=> (= (MapType0Select Heap@10 t_1@@4 Tree__right) null) (=> (and (= Heap@12 Heap@10) (= (ControlFlow 0 24) 22)) anon70_correct))))
(let ((anon126_Then_correct  (=> (not (= (MapType0Select Heap@10 t_1@@4 Tree__right) null)) (=> (and (and (forall ((o_6 T@U) (f_10 T@U) ) (! (let ((B@@11 (FieldTypeInv1 (type f_10))))
(let ((A@@12 (FieldTypeInv0 (type f_10))))
 (=> (and (and (= (type o_6) RefType) (= (type f_10) (FieldType A@@12 B@@11))) (or (U_2_bool (MapType1Select (MapType0Select Heap@10 null (|Tree__state#sm| t_1@@4)) o_6 f_10)) (U_2_bool (MapType1Select (MapType0Select Heap@10 null (|Tree__state#sm| (MapType0Select Heap@10 t_1@@4 Tree__right))) o_6 f_10)))) (U_2_bool (MapType1Select newPMask@1 o_6 f_10)))))
 :qid |stdinbpl.1241:33|
 :skolemid |72|
 :pattern ( (MapType1Select newPMask@1 o_6 f_10))
)) (= Heap@11 (MapType0Store Heap@10 null (|Tree__state#sm| t_1@@4) newPMask@1))) (and (= Heap@12 Heap@11) (= (ControlFlow 0 23) 22))) anon70_correct))))
(let ((anon125_Else_correct  (=> (and (= (MapType0Select Heap@8 t_1@@4 Tree__left) null) (= Heap@10 Heap@8)) (and (=> (= (ControlFlow 0 26) 23) anon126_Then_correct) (=> (= (ControlFlow 0 26) 24) anon126_Else_correct)))))
(let ((anon125_Then_correct  (=> (and (and (not (= (MapType0Select Heap@8 t_1@@4 Tree__left) null)) (forall ((o_5 T@U) (f_9 T@U) ) (! (let ((B@@12 (FieldTypeInv1 (type f_9))))
(let ((A@@13 (FieldTypeInv0 (type f_9))))
 (=> (and (and (= (type o_5) RefType) (= (type f_9) (FieldType A@@13 B@@12))) (or (U_2_bool (MapType1Select (MapType0Select Heap@8 null (|Tree__state#sm| t_1@@4)) o_5 f_9)) (U_2_bool (MapType1Select (MapType0Select Heap@8 null (|Tree__state#sm| (MapType0Select Heap@8 t_1@@4 Tree__left))) o_5 f_9)))) (U_2_bool (MapType1Select newPMask@0 o_5 f_9)))))
 :qid |stdinbpl.1233:33|
 :skolemid |71|
 :pattern ( (MapType1Select newPMask@0 o_5 f_9))
))) (and (= Heap@9 (MapType0Store Heap@8 null (|Tree__state#sm| t_1@@4) newPMask@0)) (= Heap@10 Heap@9))) (and (=> (= (ControlFlow 0 25) 23) anon126_Then_correct) (=> (= (ControlFlow 0 25) 24) anon126_Else_correct)))))
(let ((anon66_correct  (=> (= Heap@6 (MapType0Store Heap@5 null (|Tree__state#sm| t_1@@4) (MapType1Store (MapType0Select Heap@5 null (|Tree__state#sm| t_1@@4)) t_1@@4 Tree__data (bool_2_U true)))) (=> (and (= Heap@7 (MapType0Store Heap@6 null (|Tree__state#sm| t_1@@4) (MapType1Store (MapType0Select Heap@6 null (|Tree__state#sm| t_1@@4)) t_1@@4 Tree__left (bool_2_U true)))) (= Heap@8 (MapType0Store Heap@7 null (|Tree__state#sm| t_1@@4) (MapType1Store (MapType0Select Heap@7 null (|Tree__state#sm| t_1@@4)) t_1@@4 Tree__right (bool_2_U true))))) (and (=> (= (ControlFlow 0 27) 25) anon125_Then_correct) (=> (= (ControlFlow 0 27) 26) anon125_Else_correct))))))
(let ((anon124_Else_correct  (=> (HasDirectPerm Mask@19 null (Tree__state t_1@@4)) (=> (and (= Heap@5 Heap@2) (= (ControlFlow 0 29) 27)) anon66_correct))))
(let ((anon124_Then_correct  (=> (not (HasDirectPerm Mask@19 null (Tree__state t_1@@4))) (=> (and (and (= Heap@3 (MapType0Store Heap@2 null (|Tree__state#sm| t_1@@4) ZeroPMask)) (= Heap@4 (MapType0Store Heap@3 null (Tree__state t_1@@4) freshVersion@0))) (and (= Heap@5 Heap@4) (= (ControlFlow 0 28) 27))) anon66_correct))))
(let ((anon64_correct  (=> (= Mask@19 (MapType1Store Mask@18 null (Tree__state t_1@@4) (real_2_U (+ (U_2_real (MapType1Select Mask@18 null (Tree__state t_1@@4))) FullPerm)))) (=> (and (and (state Heap@2 Mask@19) (state Heap@2 Mask@19)) (and (|Tree__state#trigger| Heap@2 (Tree__state t_1@@4)) (= (MapType0Select Heap@2 null (Tree__state t_1@@4)) (CombineFrames (FrameFragment (MapType0Select Heap@2 t_1@@4 Tree__data)) (CombineFrames (FrameFragment (MapType0Select Heap@2 t_1@@4 Tree__left)) (CombineFrames (FrameFragment (MapType0Select Heap@2 t_1@@4 Tree__right)) (CombineFrames (FrameFragment (ite (not (= (MapType0Select Heap@2 t_1@@4 Tree__left) null)) (MapType0Select Heap@2 null (Tree__state (MapType0Select Heap@2 t_1@@4 Tree__left))) EmptyFrame)) (FrameFragment (ite (not (= (MapType0Select Heap@2 t_1@@4 Tree__right) null)) (MapType0Select Heap@2 null (Tree__state (MapType0Select Heap@2 t_1@@4 Tree__right))) EmptyFrame))))))))) (and (=> (= (ControlFlow 0 30) 28) anon124_Then_correct) (=> (= (ControlFlow 0 30) 29) anon124_Else_correct))))))
(let ((anon63_correct  (=> (and (and (= Mask@17 (MapType1Store Mask@16 null (Tree__state (MapType0Select Heap@2 t_1@@4 Tree__right)) (real_2_U (- (U_2_real (MapType1Select Mask@16 null (Tree__state (MapType0Select Heap@2 t_1@@4 Tree__right)))) FullPerm)))) (InsidePredicate (Tree__state t_1@@4) (MapType0Select Heap@2 null (Tree__state t_1@@4)) (Tree__state (MapType0Select Heap@2 t_1@@4 Tree__right)) (MapType0Select Heap@2 null (Tree__state (MapType0Select Heap@2 t_1@@4 Tree__right))))) (and (= Mask@18 Mask@17) (= (ControlFlow 0 32) 30))) anon64_correct)))
(let ((anon123_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 35) 32)) anon63_correct)))
(let ((anon123_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 33) (- 0 34)) (<= FullPerm (U_2_real (MapType1Select Mask@16 null (Tree__state (MapType0Select Heap@2 t_1@@4 Tree__right)))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@16 null (Tree__state (MapType0Select Heap@2 t_1@@4 Tree__right))))) (=> (= (ControlFlow 0 33) 32) anon63_correct))))))
(let ((anon122_Then_correct  (=> (not (= (MapType0Select Heap@2 t_1@@4 Tree__right) null)) (and (=> (= (ControlFlow 0 36) 33) anon123_Then_correct) (=> (= (ControlFlow 0 36) 35) anon123_Else_correct)))))
(let ((anon122_Else_correct  (=> (= (MapType0Select Heap@2 t_1@@4 Tree__right) null) (=> (and (= Mask@18 Mask@16) (= (ControlFlow 0 31) 30)) anon64_correct))))
(let ((anon59_correct  (=> (= Mask@15 (MapType1Store Mask@14 null (Tree__state (MapType0Select Heap@2 t_1@@4 Tree__left)) (real_2_U (- (U_2_real (MapType1Select Mask@14 null (Tree__state (MapType0Select Heap@2 t_1@@4 Tree__left)))) FullPerm)))) (=> (and (InsidePredicate (Tree__state t_1@@4) (MapType0Select Heap@2 null (Tree__state t_1@@4)) (Tree__state (MapType0Select Heap@2 t_1@@4 Tree__left)) (MapType0Select Heap@2 null (Tree__state (MapType0Select Heap@2 t_1@@4 Tree__left)))) (= Mask@16 Mask@15)) (and (=> (= (ControlFlow 0 38) 36) anon122_Then_correct) (=> (= (ControlFlow 0 38) 31) anon122_Else_correct))))))
(let ((anon121_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 41) 38)) anon59_correct)))
(let ((anon121_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 39) (- 0 40)) (<= FullPerm (U_2_real (MapType1Select Mask@14 null (Tree__state (MapType0Select Heap@2 t_1@@4 Tree__left)))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@14 null (Tree__state (MapType0Select Heap@2 t_1@@4 Tree__left))))) (=> (= (ControlFlow 0 39) 38) anon59_correct))))))
(let ((anon120_Then_correct  (=> (not (= (MapType0Select Heap@2 t_1@@4 Tree__left) null)) (and (=> (= (ControlFlow 0 42) 39) anon121_Then_correct) (=> (= (ControlFlow 0 42) 41) anon121_Else_correct)))))
(let ((anon120_Else_correct  (=> (and (= (MapType0Select Heap@2 t_1@@4 Tree__left) null) (= Mask@16 Mask@14)) (and (=> (= (ControlFlow 0 37) 36) anon122_Then_correct) (=> (= (ControlFlow 0 37) 31) anon122_Else_correct)))))
(let ((anon56_correct  (=> (= Mask@14 (MapType1Store Mask@13 t_1@@4 Tree__right (real_2_U (- (U_2_real (MapType1Select Mask@13 t_1@@4 Tree__right)) FullPerm)))) (and (=> (= (ControlFlow 0 43) 42) anon120_Then_correct) (=> (= (ControlFlow 0 43) 37) anon120_Else_correct)))))
(let ((anon119_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 46) 43)) anon56_correct)))
(let ((anon119_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 44) (- 0 45)) (<= FullPerm (U_2_real (MapType1Select Mask@13 t_1@@4 Tree__right)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@13 t_1@@4 Tree__right))) (=> (= (ControlFlow 0 44) 43) anon56_correct))))))
(let ((anon54_correct  (=> (= Mask@13 (MapType1Store Mask@12 t_1@@4 Tree__left (real_2_U (- (U_2_real (MapType1Select Mask@12 t_1@@4 Tree__left)) FullPerm)))) (and (=> (= (ControlFlow 0 47) 44) anon119_Then_correct) (=> (= (ControlFlow 0 47) 46) anon119_Else_correct)))))
(let ((anon118_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 50) 47)) anon54_correct)))
(let ((anon118_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 48) (- 0 49)) (<= FullPerm (U_2_real (MapType1Select Mask@12 t_1@@4 Tree__left)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@12 t_1@@4 Tree__left))) (=> (= (ControlFlow 0 48) 47) anon54_correct))))))
(let ((anon52_correct  (=> (= Mask@12 (MapType1Store Mask@11 t_1@@4 Tree__data (real_2_U (- (U_2_real (MapType1Select Mask@11 t_1@@4 Tree__data)) FullPerm)))) (and (=> (= (ControlFlow 0 51) 48) anon118_Then_correct) (=> (= (ControlFlow 0 51) 50) anon118_Else_correct)))))
(let ((anon117_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 54) 51)) anon52_correct)))
(let ((anon117_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 52) (- 0 53)) (<= FullPerm (U_2_real (MapType1Select Mask@11 t_1@@4 Tree__data)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@11 t_1@@4 Tree__data))) (=> (= (ControlFlow 0 52) 51) anon52_correct))))))
(let ((anon50_correct  (=> (state ExhaleHeap@0 Mask@11) (=> (and (|Seq#Equal| (Tree__contents ExhaleHeap@0 __flatten_3@0) (|Seq#Drop| (Tree__contents Heap@1 arg_t@0) 1)) (state ExhaleHeap@0 Mask@11)) (=> (and (and (U_2_bool (MapType0Select ExhaleHeap@0 __flatten_3@0 $allocated)) (state ExhaleHeap@0 Mask@11)) (and (state ExhaleHeap@0 Mask@11) (state ExhaleHeap@0 Mask@11))) (and (=> (= (ControlFlow 0 55) (- 0 56)) (= FullPerm (U_2_real (MapType1Select Mask@11 t_1@@4 Tree__left)))) (=> (= FullPerm (U_2_real (MapType1Select Mask@11 t_1@@4 Tree__left))) (=> (and (= Heap@2 (MapType0Store ExhaleHeap@0 t_1@@4 Tree__left __flatten_3@0)) (state Heap@2 Mask@11)) (and (=> (= (ControlFlow 0 55) 52) anon117_Then_correct) (=> (= (ControlFlow 0 55) 54) anon117_Else_correct))))))))))
(let ((anon116_Else_correct  (=> (= __flatten_3@0 null) (=> (and (= Mask@11 Mask@9) (= (ControlFlow 0 58) 55)) anon50_correct))))
(let ((anon116_Then_correct  (=> (not (= __flatten_3@0 null)) (=> (and (and (= Mask@10 (MapType1Store Mask@9 null (Tree__state __flatten_3@0) (real_2_U (+ (U_2_real (MapType1Select Mask@9 null (Tree__state __flatten_3@0))) FullPerm)))) (state ExhaleHeap@0 Mask@10)) (and (= Mask@11 Mask@10) (= (ControlFlow 0 57) 55))) anon50_correct))))
(let ((anon48_correct  (=> (and (= Mask@9 (MapType1Store Mask@8 null (Tree__state arg_t@0) (real_2_U (- (U_2_real (MapType1Select Mask@8 null (Tree__state arg_t@0))) FullPerm)))) (IdenticalOnKnownLocations Heap@1 ExhaleHeap@0 Mask@9)) (and (=> (= (ControlFlow 0 59) 57) anon116_Then_correct) (=> (= (ControlFlow 0 59) 58) anon116_Else_correct)))))
(let ((anon115_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 62) 59)) anon48_correct)))
(let ((anon115_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 60) (- 0 61)) (<= FullPerm (U_2_real (MapType1Select Mask@8 null (Tree__state arg_t@0))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@8 null (Tree__state arg_t@0)))) (=> (= (ControlFlow 0 60) 59) anon48_correct))))))
(let ((anon103_Else_correct  (=> (not (= (MapType0Select Heap@1 t_1@@4 Tree__left) null)) (and (=> (= (ControlFlow 0 63) (- 0 67)) (HasDirectPerm Mask@8 t_1@@4 Tree__left)) (=> (HasDirectPerm Mask@8 t_1@@4 Tree__left) (=> (= arg_t@0 (MapType0Select Heap@1 t_1@@4 Tree__left)) (and (=> (= (ControlFlow 0 63) (- 0 66)) (not (= diz@@5 null))) (=> (not (= diz@@5 null)) (and (=> (= (ControlFlow 0 63) (- 0 65)) (>= current_thread_id 0)) (=> (>= current_thread_id 0) (and (=> (= (ControlFlow 0 63) (- 0 64)) (not (= arg_t@0 null))) (=> (not (= arg_t@0 null)) (and (=> (= (ControlFlow 0 63) 60) anon115_Then_correct) (=> (= (ControlFlow 0 63) 62) anon115_Else_correct))))))))))))))
(let ((anon23_correct  (=> (and (state Heap@1 Mask@8) (state Heap@1 Mask@8)) (and (=> (= (ControlFlow 0 101) (- 0 102)) (HasDirectPerm Mask@8 t_1@@4 Tree__left)) (=> (HasDirectPerm Mask@8 t_1@@4 Tree__left) (and (=> (= (ControlFlow 0 101) 99) anon103_Then_correct) (=> (= (ControlFlow 0 101) 63) anon103_Else_correct)))))))
(let ((anon102_Else_correct  (=> (= (MapType0Select Heap@1 t_1@@4 Tree__right) null) (=> (and (= Mask@8 Mask@6) (= (ControlFlow 0 104) 101)) anon23_correct))))
(let ((anon102_Then_correct  (=> (and (not (= (MapType0Select Heap@1 t_1@@4 Tree__right) null)) (= Mask@7 (MapType1Store Mask@6 null (Tree__state (MapType0Select Heap@1 t_1@@4 Tree__right)) (real_2_U (+ (U_2_real (MapType1Select Mask@6 null (Tree__state (MapType0Select Heap@1 t_1@@4 Tree__right)))) FullPerm))))) (=> (and (and (InsidePredicate (Tree__state t_1@@4) (MapType0Select Heap@1 null (Tree__state t_1@@4)) (Tree__state (MapType0Select Heap@1 t_1@@4 Tree__right)) (MapType0Select Heap@1 null (Tree__state (MapType0Select Heap@1 t_1@@4 Tree__right)))) (state Heap@1 Mask@7)) (and (= Mask@8 Mask@7) (= (ControlFlow 0 103) 101))) anon23_correct))))
(let ((anon101_Else_correct  (=> (and (= (MapType0Select Heap@1 t_1@@4 Tree__left) null) (= Mask@6 Mask@4)) (and (=> (= (ControlFlow 0 106) 103) anon102_Then_correct) (=> (= (ControlFlow 0 106) 104) anon102_Else_correct)))))
(let ((anon101_Then_correct  (=> (not (= (MapType0Select Heap@1 t_1@@4 Tree__left) null)) (=> (and (and (= Mask@5 (MapType1Store Mask@4 null (Tree__state (MapType0Select Heap@1 t_1@@4 Tree__left)) (real_2_U (+ (U_2_real (MapType1Select Mask@4 null (Tree__state (MapType0Select Heap@1 t_1@@4 Tree__left)))) FullPerm)))) (InsidePredicate (Tree__state t_1@@4) (MapType0Select Heap@1 null (Tree__state t_1@@4)) (Tree__state (MapType0Select Heap@1 t_1@@4 Tree__left)) (MapType0Select Heap@1 null (Tree__state (MapType0Select Heap@1 t_1@@4 Tree__left))))) (and (state Heap@1 Mask@5) (= Mask@6 Mask@5))) (and (=> (= (ControlFlow 0 105) 103) anon102_Then_correct) (=> (= (ControlFlow 0 105) 104) anon102_Else_correct))))))
(let ((anon19_correct  (=> (not (= t_1@@4 null)) (=> (and (and (and (= Mask@2 (MapType1Store Mask@1 t_1@@4 Tree__data (real_2_U (+ (U_2_real (MapType1Select Mask@1 t_1@@4 Tree__data)) FullPerm)))) (state Heap@1 Mask@2)) (and (not (= t_1@@4 null)) (= Mask@3 (MapType1Store Mask@2 t_1@@4 Tree__left (real_2_U (+ (U_2_real (MapType1Select Mask@2 t_1@@4 Tree__left)) FullPerm)))))) (and (and (state Heap@1 Mask@3) (not (= t_1@@4 null))) (and (= Mask@4 (MapType1Store Mask@3 t_1@@4 Tree__right (real_2_U (+ (U_2_real (MapType1Select Mask@3 t_1@@4 Tree__right)) FullPerm)))) (state Heap@1 Mask@4)))) (and (=> (= (ControlFlow 0 107) 105) anon101_Then_correct) (=> (= (ControlFlow 0 107) 106) anon101_Else_correct))))))
(let ((anon100_Else_correct  (=> (HasDirectPerm Mask@1 null (Tree__state t_1@@4)) (=> (and (= Heap@1 Heap@@15) (= (ControlFlow 0 109) 107)) anon19_correct))))
(let ((anon100_Then_correct  (=> (and (and (not (HasDirectPerm Mask@1 null (Tree__state t_1@@4))) (= Heap@0 (MapType0Store Heap@@15 null (Tree__state t_1@@4) newVersion@0))) (and (= Heap@1 Heap@0) (= (ControlFlow 0 108) 107))) anon19_correct)))
(let ((anon17_correct  (=> (= Mask@1 (MapType1Store Mask@0 null (Tree__state t_1@@4) (real_2_U (- (U_2_real (MapType1Select Mask@0 null (Tree__state t_1@@4))) FullPerm)))) (and (=> (= (ControlFlow 0 110) 108) anon100_Then_correct) (=> (= (ControlFlow 0 110) 109) anon100_Else_correct)))))
(let ((anon99_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 113) 110)) anon17_correct)))
(let ((anon99_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 111) (- 0 112)) (<= FullPerm (U_2_real (MapType1Select Mask@0 null (Tree__state t_1@@4))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@0 null (Tree__state t_1@@4)))) (=> (= (ControlFlow 0 111) 110) anon17_correct))))))
(let ((anon91_Else_correct  (=> (U_2_bool (MapType0Select Heap@@15 __flatten_1 $allocated)) (=> (and (U_2_bool (MapType0Select Heap@@15 __flatten_2 $allocated)) (U_2_bool (MapType0Select Heap@@15 __flatten_3 $allocated))) (=> (and (and (U_2_bool (MapType0Select Heap@@15 __flatten_4 $allocated)) (U_2_bool (MapType0Select Heap@@15 __flatten_7 $allocated))) (and (|Tree__state#trigger| Heap@@15 (Tree__state t_1@@4)) (= (MapType0Select Heap@@15 null (Tree__state t_1@@4)) (CombineFrames (FrameFragment (MapType0Select Heap@@15 t_1@@4 Tree__data)) (CombineFrames (FrameFragment (MapType0Select Heap@@15 t_1@@4 Tree__left)) (CombineFrames (FrameFragment (MapType0Select Heap@@15 t_1@@4 Tree__right)) (CombineFrames (FrameFragment (ite (not (= (MapType0Select Heap@@15 t_1@@4 Tree__left) null)) (MapType0Select Heap@@15 null (Tree__state (MapType0Select Heap@@15 t_1@@4 Tree__left))) EmptyFrame)) (FrameFragment (ite (not (= (MapType0Select Heap@@15 t_1@@4 Tree__right) null)) (MapType0Select Heap@@15 null (Tree__state (MapType0Select Heap@@15 t_1@@4 Tree__right))) EmptyFrame))))))))) (and (=> (= (ControlFlow 0 114) 111) anon99_Then_correct) (=> (= (ControlFlow 0 114) 113) anon99_Else_correct)))))))
(let ((anon0_correct  (=> (state Heap@@15 ZeroMask) (=> (and (and (= AssumeFunctionsAbove (- 0 1)) (U_2_bool (MapType0Select Heap@@15 diz@@5 $allocated))) (and (U_2_bool (MapType0Select Heap@@15 t_1@@4 $allocated)) (not (= diz@@5 null)))) (=> (and (and (and (state Heap@@15 ZeroMask) (>= current_thread_id 0)) (and (state Heap@@15 ZeroMask) (not (= t_1@@4 null)))) (and (and (state Heap@@15 ZeroMask) (= Mask@0 (MapType1Store ZeroMask null (Tree__state t_1@@4) (real_2_U (+ (U_2_real (MapType1Select ZeroMask null (Tree__state t_1@@4))) FullPerm))))) (and (state Heap@@15 Mask@0) (state Heap@@15 Mask@0)))) (and (=> (= (ControlFlow 0 133) 132) anon91_Then_correct) (=> (= (ControlFlow 0 133) 114) anon91_Else_correct)))))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 134) 133) anon0_correct)))
PreconditionGeneratedEntry_correct))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
))
(check-sat)
(pop 1)
; Valid
(get-info :rlimit)
