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
(declare-fun elem () T@U)
(declare-fun next () T@U)
(declare-fun elem2 () T@U)
(declare-fun next2 () T@U)
(declare-fun FieldType (T@T T@T) T@T)
(declare-fun FieldTypeInv0 (T@T) T@T)
(declare-fun FieldTypeInv1 (T@T) T@T)
(declare-fun NormalFieldType () T@T)
(declare-fun RefType () T@T)
(declare-fun |foo#condqp1| (T@U T@U) Int)
(declare-fun succHeapTrans (T@U T@U) Bool)
(declare-fun MapType0Type (T@T) T@T)
(declare-fun SeqType (T@T) T@T)
(declare-fun |sk_foo#condqp1| (Int Int) Int)
(declare-fun |Seq#Length| (T@U) Int)
(declare-fun NoPerm () Real)
(declare-fun FullPerm () Real)
(declare-fun MapType0Select (T@U T@U T@U) T@U)
(declare-fun null () T@U)
(declare-fun P (T@U) T@U)
(declare-fun |Seq#Index| (T@U Int) T@U)
(declare-fun MapType0TypeInv0 (T@T) T@T)
(declare-fun MapType0Store (T@U T@U T@U T@U) T@U)
(declare-fun SeqTypeInv0 (T@T) T@T)
(declare-fun PredicateType_PType () T@T)
(declare-fun FrameTypeType () T@T)
(declare-fun |Seq#Drop| (T@U Int) T@U)
(declare-fun state (T@U T@U) Bool)
(declare-fun |someFun'| (T@U T@U) Int)
(declare-fun MapType1Type (T@T T@T) T@T)
(declare-fun |someFun#frame| (T@U T@U) Int)
(declare-fun CombineFrames (T@U T@U) T@U)
(declare-fun list (T@U) T@U)
(declare-fun FrameFragment (T@U) T@U)
(declare-fun |someFun#condqp2| (T@U T@U) Int)
(declare-fun otherList (T@U) T@U)
(declare-fun MapType1TypeInv0 (T@T) T@T)
(declare-fun MapType1TypeInv1 (T@T) T@T)
(declare-fun MapType1Select (T@U T@U T@U) T@U)
(declare-fun MapType1Store (T@U T@U T@U T@U) T@U)
(declare-fun PredicateType_listType () T@T)
(declare-fun PredicateType_otherListType () T@T)
(declare-fun succHeap (T@U T@U) Bool)
(declare-fun GoodMask (T@U) Bool)
(declare-fun |listLength'| (T@U T@U T@U Int) Int)
(declare-fun dummyFunction (T@U) Bool)
(declare-fun |listLength#triggerStateless| (T@U T@U Int) Int)
(declare-fun someList (T@U Int) T@U)
(declare-fun IsPredicateField (T@U) Bool)
(declare-fun PredicateType_someListType () T@T)
(declare-fun |someList#trigger| (T@U T@U) Bool)
(declare-fun |someList#everUsed| (T@U) Bool)
(declare-fun |Seq#Sub| (Int Int) Int)
(declare-fun |Seq#Add| (Int Int) Int)
(declare-fun IdenticalOnKnownLocations (T@U T@U T@U) Bool)
(declare-fun PredicateMaskField (T@U) T@U)
(declare-fun HasDirectPerm (T@U T@U T@U) Bool)
(declare-fun IsWandField (T@U) Bool)
(declare-fun WandMaskField (T@U) T@U)
(declare-fun foo (T@U T@U) Bool)
(declare-fun AssumeFunctionsAbove () Int)
(declare-fun list2 (T@U) T@U)
(declare-fun PredicateType_list2Type () T@T)
(declare-fun |foo'| (T@U T@U) Bool)
(declare-fun |foo#triggerStateless| (T@U) Bool)
(declare-fun |someFun#triggerStateless| (T@U) Int)
(declare-fun |P#trigger| (T@U T@U) Bool)
(declare-fun |P#everUsed| (T@U) Bool)
(declare-fun |otherList#trigger| (T@U T@U) Bool)
(declare-fun |otherList#everUsed| (T@U) Bool)
(declare-fun |list#trigger| (T@U T@U) Bool)
(declare-fun |list#everUsed| (T@U) Bool)
(declare-fun |list2#trigger| (T@U T@U) Bool)
(declare-fun |list2#everUsed| (T@U) Bool)
(declare-fun |Seq#Update| (T@U Int T@U) T@U)
(declare-fun |Seq#Take| (T@U Int) T@U)
(declare-fun |Seq#Contains| (T@U T@U) Bool)
(declare-fun |Seq#Range| (Int Int) T@U)
(declare-fun |Seq#Skolem| (T@U T@U) Int)
(declare-fun someFun (T@U T@U) Int)
(declare-fun |Seq#Singleton| (T@U) T@U)
(declare-fun |someList#sm| (T@U Int) T@U)
(declare-fun |P#sm| (T@U) T@U)
(declare-fun |otherList#sm| (T@U) T@U)
(declare-fun |list#sm| (T@U) T@U)
(declare-fun |list2#sm| (T@U) T@U)
(declare-fun |sk_someFun#condqp2| (Int Int) Int)
(declare-fun |Seq#Empty| (T@T) T@U)
(declare-fun dummyHeap () T@U)
(declare-fun ZeroMask () T@U)
(declare-fun InsidePredicate (T@U T@U T@U T@U) Bool)
(declare-fun |Seq#Append| (T@U T@U) T@U)
(declare-fun |listLength#frame| (T@U T@U T@U Int) Int)
(declare-fun sumMask (T@U T@U T@U) Bool)
(declare-fun ConditionalFrame (Real T@U) T@U)
(declare-fun EmptyFrame () T@U)
(declare-fun |listLength#trigger| (T@U T@U T@U Int) Bool)
(declare-fun |Seq#Equal| (T@U T@U) Bool)
(declare-fun listLength (T@U T@U T@U Int) Int)
(declare-fun |Seq#ContainsTrigger| (T@U T@U) Bool)
(declare-fun getPredWandId (T@U) Int)
(declare-fun |foo#frame| (T@U T@U) Bool)
(declare-fun ZeroPMask () T@U)
(declare-fun |Seq#SkolemDiff| (T@U T@U) Int)
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
(assert  (and (and (and (and (and (and (and (and (and (forall ((arg0@@11 T@T) (arg1 T@T) ) (! (= (Ctor (FieldType arg0@@11 arg1)) 6)
 :qid |ctor:FieldType|
)) (forall ((arg0@@12 T@T) (arg1@@0 T@T) ) (! (= (FieldTypeInv0 (FieldType arg0@@12 arg1@@0)) arg0@@12)
 :qid |typeInv:FieldTypeInv0|
 :pattern ( (FieldType arg0@@12 arg1@@0))
))) (forall ((arg0@@13 T@T) (arg1@@1 T@T) ) (! (= (FieldTypeInv1 (FieldType arg0@@13 arg1@@1)) arg1@@1)
 :qid |typeInv:FieldTypeInv1|
 :pattern ( (FieldType arg0@@13 arg1@@1))
))) (= (Ctor NormalFieldType) 7)) (= (type $allocated) (FieldType NormalFieldType boolType))) (= (type elem) (FieldType NormalFieldType intType))) (= (Ctor RefType) 8)) (= (type next) (FieldType NormalFieldType RefType))) (= (type elem2) (FieldType NormalFieldType intType))) (= (type next2) (FieldType NormalFieldType RefType))))
(assert (distinct $allocated elem next elem2 next2)
)
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (forall ((arg0@@14 T@T) ) (! (= (Ctor (MapType0Type arg0@@14)) 9)
 :qid |ctor:MapType0Type|
)) (forall ((arg0@@15 T@T) ) (! (= (MapType0TypeInv0 (MapType0Type arg0@@15)) arg0@@15)
 :qid |typeInv:MapType0TypeInv0|
 :pattern ( (MapType0Type arg0@@15))
))) (forall ((arg0@@16 T@U) (arg1@@2 T@U) (arg2 T@U) ) (! (let ((B (FieldTypeInv1 (type arg2))))
(= (type (MapType0Select arg0@@16 arg1@@2 arg2)) B))
 :qid |funType:MapType0Select|
 :pattern ( (MapType0Select arg0@@16 arg1@@2 arg2))
))) (forall ((arg0@@17 T@U) (arg1@@3 T@U) (arg2@@0 T@U) (arg3 T@U) ) (! (let ((aVar0 (type arg1@@3)))
(= (type (MapType0Store arg0@@17 arg1@@3 arg2@@0 arg3)) (MapType0Type aVar0)))
 :qid |funType:MapType0Store|
 :pattern ( (MapType0Store arg0@@17 arg1@@3 arg2@@0 arg3))
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
)))) (forall ((arg0@@18 T@T) ) (! (= (Ctor (SeqType arg0@@18)) 10)
 :qid |ctor:SeqType|
))) (forall ((arg0@@19 T@T) ) (! (= (SeqTypeInv0 (SeqType arg0@@19)) arg0@@19)
 :qid |typeInv:SeqTypeInv0|
 :pattern ( (SeqType arg0@@19))
))) (= (type null) RefType)) (= (Ctor PredicateType_PType) 11)) (= (Ctor FrameTypeType) 12)) (forall ((arg0@@20 T@U) ) (! (= (type (P arg0@@20)) (FieldType PredicateType_PType FrameTypeType))
 :qid |funType:P|
 :pattern ( (P arg0@@20))
))) (forall ((arg0@@21 T@U) (arg1@@4 Int) ) (! (let ((T (SeqTypeInv0 (type arg0@@21))))
(= (type (|Seq#Index| arg0@@21 arg1@@4)) T))
 :qid |funType:Seq#Index|
 :pattern ( (|Seq#Index| arg0@@21 arg1@@4))
))))
(assert (forall ((Heap2Heap T@U) (Heap1Heap T@U) (s T@U) ) (!  (=> (and (and (and (= (type Heap2Heap) (MapType0Type RefType)) (= (type Heap1Heap) (MapType0Type RefType))) (= (type s) (SeqType RefType))) (and (=  (and (and (<= 0 (|sk_foo#condqp1| (|foo#condqp1| Heap2Heap s) (|foo#condqp1| Heap1Heap s))) (< (|sk_foo#condqp1| (|foo#condqp1| Heap2Heap s) (|foo#condqp1| Heap1Heap s)) (|Seq#Length| s))) (< NoPerm FullPerm))  (and (and (<= 0 (|sk_foo#condqp1| (|foo#condqp1| Heap2Heap s) (|foo#condqp1| Heap1Heap s))) (< (|sk_foo#condqp1| (|foo#condqp1| Heap2Heap s) (|foo#condqp1| Heap1Heap s)) (|Seq#Length| s))) (< NoPerm FullPerm))) (=> (and (and (<= 0 (|sk_foo#condqp1| (|foo#condqp1| Heap2Heap s) (|foo#condqp1| Heap1Heap s))) (< (|sk_foo#condqp1| (|foo#condqp1| Heap2Heap s) (|foo#condqp1| Heap1Heap s)) (|Seq#Length| s))) (< NoPerm FullPerm)) (= (MapType0Select Heap2Heap null (P (|Seq#Index| s (|sk_foo#condqp1| (|foo#condqp1| Heap2Heap s) (|foo#condqp1| Heap1Heap s))))) (MapType0Select Heap1Heap null (P (|Seq#Index| s (|sk_foo#condqp1| (|foo#condqp1| Heap2Heap s) (|foo#condqp1| Heap1Heap s))))))))) (= (|foo#condqp1| Heap2Heap s) (|foo#condqp1| Heap1Heap s)))
 :qid |stdinbpl.620:15|
 :skolemid |63|
 :pattern ( (|foo#condqp1| Heap2Heap s) (|foo#condqp1| Heap1Heap s) (succHeapTrans Heap2Heap Heap1Heap))
)))
(assert (forall ((arg0@@22 T@U) (arg1@@5 Int) ) (! (let ((T@@0 (SeqTypeInv0 (type arg0@@22))))
(= (type (|Seq#Drop| arg0@@22 arg1@@5)) (SeqType T@@0)))
 :qid |funType:Seq#Drop|
 :pattern ( (|Seq#Drop| arg0@@22 arg1@@5))
)))
(assert (forall ((s@@0 T@U) (n Int) ) (! (let ((T@@1 (SeqTypeInv0 (type s@@0))))
 (=> (= (type s@@0) (SeqType T@@1)) (and (=> (<= 0 n) (and (=> (<= n (|Seq#Length| s@@0)) (= (|Seq#Length| (|Seq#Drop| s@@0 n)) (- (|Seq#Length| s@@0) n))) (=> (< (|Seq#Length| s@@0) n) (= (|Seq#Length| (|Seq#Drop| s@@0 n)) 0)))) (=> (< n 0) (= (|Seq#Length| (|Seq#Drop| s@@0 n)) (|Seq#Length| s@@0))))))
 :qid |stdinbpl.300:18|
 :skolemid |38|
 :pattern ( (|Seq#Length| (|Seq#Drop| s@@0 n)))
 :pattern ( (|Seq#Length| s@@0) (|Seq#Drop| s@@0 n))
)))
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (forall ((arg0@@23 T@T) (arg1@@6 T@T) ) (! (= (Ctor (MapType1Type arg0@@23 arg1@@6)) 13)
 :qid |ctor:MapType1Type|
)) (forall ((arg0@@24 T@T) (arg1@@7 T@T) ) (! (= (MapType1TypeInv0 (MapType1Type arg0@@24 arg1@@7)) arg0@@24)
 :qid |typeInv:MapType1TypeInv0|
 :pattern ( (MapType1Type arg0@@24 arg1@@7))
))) (forall ((arg0@@25 T@T) (arg1@@8 T@T) ) (! (= (MapType1TypeInv1 (MapType1Type arg0@@25 arg1@@8)) arg1@@8)
 :qid |typeInv:MapType1TypeInv1|
 :pattern ( (MapType1Type arg0@@25 arg1@@8))
))) (forall ((arg0@@26 T@U) (arg1@@9 T@U) (arg2@@1 T@U) ) (! (let ((aVar1 (MapType1TypeInv1 (type arg0@@26))))
(= (type (MapType1Select arg0@@26 arg1@@9 arg2@@1)) aVar1))
 :qid |funType:MapType1Select|
 :pattern ( (MapType1Select arg0@@26 arg1@@9 arg2@@1))
))) (forall ((arg0@@27 T@U) (arg1@@10 T@U) (arg2@@2 T@U) (arg3@@0 T@U) ) (! (let ((aVar1@@0 (type arg3@@0)))
(let ((aVar0@@0 (type arg1@@10)))
(= (type (MapType1Store arg0@@27 arg1@@10 arg2@@2 arg3@@0)) (MapType1Type aVar0@@0 aVar1@@0))))
 :qid |funType:MapType1Store|
 :pattern ( (MapType1Store arg0@@27 arg1@@10 arg2@@2 arg3@@0))
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
)))) (forall ((arg0@@28 T@U) (arg1@@11 T@U) ) (! (= (type (CombineFrames arg0@@28 arg1@@11)) FrameTypeType)
 :qid |funType:CombineFrames|
 :pattern ( (CombineFrames arg0@@28 arg1@@11))
))) (= (Ctor PredicateType_listType) 14)) (forall ((arg0@@29 T@U) ) (! (= (type (list arg0@@29)) (FieldType PredicateType_listType FrameTypeType))
 :qid |funType:list|
 :pattern ( (list arg0@@29))
))) (forall ((arg0@@30 T@U) ) (! (= (type (FrameFragment arg0@@30)) FrameTypeType)
 :qid |funType:FrameFragment|
 :pattern ( (FrameFragment arg0@@30))
))) (= (Ctor PredicateType_otherListType) 15)) (forall ((arg0@@31 T@U) ) (! (= (type (otherList arg0@@31)) (FieldType PredicateType_otherListType FrameTypeType))
 :qid |funType:otherList|
 :pattern ( (otherList arg0@@31))
))))
(assert (forall ((Heap T@U) (Mask T@U) (l T@U) ) (!  (=> (and (and (and (= (type Heap) (MapType0Type RefType)) (= (type Mask) (MapType1Type RefType realType))) (= (type l) RefType)) (state Heap Mask)) (= (|someFun'| Heap l) (|someFun#frame| (CombineFrames (MapType0Select Heap null (list l)) (CombineFrames (FrameFragment (MapType0Select Heap l elem)) (CombineFrames (FrameFragment (int_2_U (|someFun#condqp2| Heap l))) (MapType0Select Heap null (otherList l))))) l)))
 :qid |stdinbpl.743:15|
 :skolemid |74|
 :pattern ( (state Heap Mask) (|someFun'| Heap l))
)))
(assert (forall ((Heap0 T@U) (Heap1 T@U) ) (!  (=> (and (and (= (type Heap0) (MapType0Type RefType)) (= (type Heap1) (MapType0Type RefType))) (succHeap Heap0 Heap1)) (succHeapTrans Heap0 Heap1))
 :qid |stdinbpl.88:15|
 :skolemid |11|
 :pattern ( (succHeap Heap0 Heap1))
)))
(assert (forall ((Heap@@0 T@U) (Mask@@0 T@U) ) (!  (=> (and (and (= (type Heap@@0) (MapType0Type RefType)) (= (type Mask@@0) (MapType1Type RefType realType))) (state Heap@@0 Mask@@0)) (GoodMask Mask@@0))
 :qid |stdinbpl.124:15|
 :skolemid |15|
 :pattern ( (state Heap@@0 Mask@@0))
)))
(assert (forall ((Heap0@@0 T@U) (Heap1@@0 T@U) (Heap2 T@U) ) (!  (=> (and (and (and (= (type Heap0@@0) (MapType0Type RefType)) (= (type Heap1@@0) (MapType0Type RefType))) (= (type Heap2) (MapType0Type RefType))) (and (succHeapTrans Heap0@@0 Heap1@@0) (succHeap Heap1@@0 Heap2))) (succHeapTrans Heap0@@0 Heap2))
 :qid |stdinbpl.93:15|
 :skolemid |12|
 :pattern ( (succHeapTrans Heap0@@0 Heap1@@0) (succHeap Heap1@@0 Heap2))
)))
(assert (forall ((Heap@@1 T@U) (l1 T@U) (l2 T@U) (k Int) ) (!  (=> (and (and (= (type Heap@@1) (MapType0Type RefType)) (= (type l1) RefType)) (= (type l2) RefType)) (dummyFunction (int_2_U (|listLength#triggerStateless| l1 l2 k))))
 :qid |stdinbpl.852:15|
 :skolemid |83|
 :pattern ( (|listLength'| Heap@@1 l1 l2 k))
)))
(assert  (and (= (Ctor PredicateType_someListType) 16) (forall ((arg0@@32 T@U) (arg1@@12 Int) ) (! (= (type (someList arg0@@32 arg1@@12)) (FieldType PredicateType_someListType FrameTypeType))
 :qid |funType:someList|
 :pattern ( (someList arg0@@32 arg1@@12))
))))
(assert (forall ((this T@U) (i Int) ) (!  (=> (= (type this) RefType) (IsPredicateField (someList this i)))
 :qid |stdinbpl.1207:15|
 :skolemid |99|
 :pattern ( (someList this i))
)))
(assert (forall ((Heap@@2 T@U) (this@@0 T@U) (i@@0 Int) ) (!  (=> (and (= (type Heap@@2) (MapType0Type RefType)) (= (type this@@0) RefType)) (|someList#everUsed| (someList this@@0 i@@0)))
 :qid |stdinbpl.1226:15|
 :skolemid |103|
 :pattern ( (|someList#trigger| Heap@@2 (someList this@@0 i@@0)))
)))
(assert (forall ((s@@1 T@U) (n@@0 Int) (j Int) ) (! (let ((T@@2 (SeqTypeInv0 (type s@@1))))
 (=> (= (type s@@1) (SeqType T@@2)) (=> (and (and (< 0 n@@0) (<= 0 j)) (< j (- (|Seq#Length| s@@1) n@@0))) (and (= (|Seq#Sub| (|Seq#Add| j n@@0) n@@0) j) (= (|Seq#Index| (|Seq#Drop| s@@1 n@@0) j) (|Seq#Index| s@@1 (|Seq#Add| j n@@0)))))))
 :qid |stdinbpl.321:18|
 :skolemid |39|
 :pattern ( (|Seq#Index| (|Seq#Drop| s@@1 n@@0) j))
)))
(assert (forall ((arg0@@33 T@U) ) (! (let ((A (FieldTypeInv0 (type arg0@@33))))
(= (type (PredicateMaskField arg0@@33)) (FieldType A (MapType1Type RefType boolType))))
 :qid |funType:PredicateMaskField|
 :pattern ( (PredicateMaskField arg0@@33))
)))
(assert (forall ((Heap@@3 T@U) (ExhaleHeap T@U) (Mask@@1 T@U) (pm_f T@U) ) (! (let ((C (FieldTypeInv0 (type pm_f))))
 (=> (and (and (and (and (and (= (type Heap@@3) (MapType0Type RefType)) (= (type ExhaleHeap) (MapType0Type RefType))) (= (type Mask@@1) (MapType1Type RefType realType))) (= (type pm_f) (FieldType C FrameTypeType))) (IdenticalOnKnownLocations Heap@@3 ExhaleHeap Mask@@1)) (and (HasDirectPerm Mask@@1 null pm_f) (IsPredicateField pm_f))) (= (MapType0Select Heap@@3 null (PredicateMaskField pm_f)) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))))
 :qid |stdinbpl.47:19|
 :skolemid |2|
 :pattern ( (IdenticalOnKnownLocations Heap@@3 ExhaleHeap Mask@@1) (IsPredicateField pm_f) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))
)))
(assert (forall ((arg0@@34 T@U) ) (! (let ((A@@0 (FieldTypeInv0 (type arg0@@34))))
(= (type (WandMaskField arg0@@34)) (FieldType A@@0 (MapType1Type RefType boolType))))
 :qid |funType:WandMaskField|
 :pattern ( (WandMaskField arg0@@34))
)))
(assert (forall ((Heap@@4 T@U) (ExhaleHeap@@0 T@U) (Mask@@2 T@U) (pm_f@@0 T@U) ) (! (let ((C@@0 (FieldTypeInv0 (type pm_f@@0))))
 (=> (and (and (and (and (and (= (type Heap@@4) (MapType0Type RefType)) (= (type ExhaleHeap@@0) (MapType0Type RefType))) (= (type Mask@@2) (MapType1Type RefType realType))) (= (type pm_f@@0) (FieldType C@@0 FrameTypeType))) (IdenticalOnKnownLocations Heap@@4 ExhaleHeap@@0 Mask@@2)) (and (HasDirectPerm Mask@@2 null pm_f@@0) (IsWandField pm_f@@0))) (= (MapType0Select Heap@@4 null (WandMaskField pm_f@@0)) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))))
 :qid |stdinbpl.60:19|
 :skolemid |5|
 :pattern ( (IdenticalOnKnownLocations Heap@@4 ExhaleHeap@@0 Mask@@2) (IsWandField pm_f@@0) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))
)))
(assert (forall ((Heap@@5 T@U) (Mask@@3 T@U) (s@@2 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@5) (MapType0Type RefType)) (= (type Mask@@3) (MapType1Type RefType realType))) (= (type s@@2) (SeqType RefType))) (and (state Heap@@5 Mask@@3) (< AssumeFunctionsAbove 0))) (forall ((i@@1 Int) (j@@0 Int) ) (!  (=> (and (>= i@@1 0) (and (< i@@1 (|Seq#Length| s@@2)) (and (>= j@@0 0) (and (< j@@0 (|Seq#Length| s@@2)) (not (= i@@1 j@@0)))))) (not (= (|Seq#Index| s@@2 i@@1) (|Seq#Index| s@@2 j@@0))))
 :qid |stdinbpl.602:61|
 :skolemid |60|
 :pattern ( (|Seq#Index| s@@2 i@@1) (|Seq#Index| s@@2 j@@0))
))) (foo Heap@@5 s@@2))
 :qid |stdinbpl.600:15|
 :skolemid |61|
 :pattern ( (state Heap@@5 Mask@@3) (foo Heap@@5 s@@2))
)))
(assert (forall ((self T@U) ) (!  (=> (= (type self) RefType) (IsPredicateField (P self)))
 :qid |stdinbpl.1172:15|
 :skolemid |93|
 :pattern ( (P self))
)))
(assert (forall ((this@@1 T@U) ) (!  (=> (= (type this@@1) RefType) (IsPredicateField (otherList this@@1)))
 :qid |stdinbpl.1256:15|
 :skolemid |105|
 :pattern ( (otherList this@@1))
)))
(assert (forall ((this@@2 T@U) ) (!  (=> (= (type this@@2) RefType) (IsPredicateField (list this@@2)))
 :qid |stdinbpl.1291:15|
 :skolemid |111|
 :pattern ( (list this@@2))
)))
(assert  (and (= (Ctor PredicateType_list2Type) 17) (forall ((arg0@@35 T@U) ) (! (= (type (list2 arg0@@35)) (FieldType PredicateType_list2Type FrameTypeType))
 :qid |funType:list2|
 :pattern ( (list2 arg0@@35))
))))
(assert (forall ((this@@3 T@U) ) (!  (=> (= (type this@@3) RefType) (IsPredicateField (list2 this@@3)))
 :qid |stdinbpl.1362:15|
 :skolemid |117|
 :pattern ( (list2 this@@3))
)))
(assert (forall ((Heap@@6 T@U) (s@@3 T@U) ) (!  (=> (and (= (type Heap@@6) (MapType0Type RefType)) (= (type s@@3) (SeqType RefType))) (dummyFunction (bool_2_U (|foo#triggerStateless| s@@3))))
 :qid |stdinbpl.594:15|
 :skolemid |59|
 :pattern ( (|foo'| Heap@@6 s@@3))
)))
(assert (forall ((Heap@@7 T@U) (l@@0 T@U) ) (!  (=> (and (= (type Heap@@7) (MapType0Type RefType)) (= (type l@@0) RefType)) (dummyFunction (int_2_U (|someFun#triggerStateless| l@@0))))
 :qid |stdinbpl.730:15|
 :skolemid |72|
 :pattern ( (|someFun'| Heap@@7 l@@0))
)))
(assert (forall ((Heap@@8 T@U) (self@@0 T@U) ) (!  (=> (and (= (type Heap@@8) (MapType0Type RefType)) (= (type self@@0) RefType)) (|P#everUsed| (P self@@0)))
 :qid |stdinbpl.1191:15|
 :skolemid |97|
 :pattern ( (|P#trigger| Heap@@8 (P self@@0)))
)))
(assert (forall ((Heap@@9 T@U) (this@@4 T@U) ) (!  (=> (and (= (type Heap@@9) (MapType0Type RefType)) (= (type this@@4) RefType)) (|otherList#everUsed| (otherList this@@4)))
 :qid |stdinbpl.1275:15|
 :skolemid |109|
 :pattern ( (|otherList#trigger| Heap@@9 (otherList this@@4)))
)))
(assert (forall ((Heap@@10 T@U) (this@@5 T@U) ) (!  (=> (and (= (type Heap@@10) (MapType0Type RefType)) (= (type this@@5) RefType)) (|list#everUsed| (list this@@5)))
 :qid |stdinbpl.1310:15|
 :skolemid |115|
 :pattern ( (|list#trigger| Heap@@10 (list this@@5)))
)))
(assert (forall ((Heap@@11 T@U) (this@@6 T@U) ) (!  (=> (and (= (type Heap@@11) (MapType0Type RefType)) (= (type this@@6) RefType)) (|list2#everUsed| (list2 this@@6)))
 :qid |stdinbpl.1381:15|
 :skolemid |121|
 :pattern ( (|list2#trigger| Heap@@11 (list2 this@@6)))
)))
(assert (forall ((arg0@@36 T@U) (arg1@@13 Int) (arg2@@3 T@U) ) (! (let ((T@@3 (type arg2@@3)))
(= (type (|Seq#Update| arg0@@36 arg1@@13 arg2@@3)) (SeqType T@@3)))
 :qid |funType:Seq#Update|
 :pattern ( (|Seq#Update| arg0@@36 arg1@@13 arg2@@3))
)))
(assert (forall ((s@@4 T@U) (i@@2 Int) (v T@U) (n@@1 Int) ) (! (let ((T@@4 (type v)))
 (=> (= (type s@@4) (SeqType T@@4)) (=> (and (<= 0 n@@1) (< n@@1 (|Seq#Length| s@@4))) (and (=> (= i@@2 n@@1) (= (|Seq#Index| (|Seq#Update| s@@4 i@@2 v) n@@1) v)) (=> (not (= i@@2 n@@1)) (= (|Seq#Index| (|Seq#Update| s@@4 i@@2 v) n@@1) (|Seq#Index| s@@4 n@@1)))))))
 :qid |stdinbpl.276:18|
 :skolemid |35|
 :pattern ( (|Seq#Index| (|Seq#Update| s@@4 i@@2 v) n@@1))
 :pattern ( (|Seq#Index| s@@4 n@@1) (|Seq#Update| s@@4 i@@2 v))
)))
(assert (forall ((arg0@@37 T@U) (arg1@@14 Int) ) (! (let ((T@@5 (SeqTypeInv0 (type arg0@@37))))
(= (type (|Seq#Take| arg0@@37 arg1@@14)) (SeqType T@@5)))
 :qid |funType:Seq#Take|
 :pattern ( (|Seq#Take| arg0@@37 arg1@@14))
)))
(assert (forall ((s@@5 T@U) (n@@2 Int) ) (! (let ((T@@6 (SeqTypeInv0 (type s@@5))))
 (=> (= (type s@@5) (SeqType T@@6)) (and (=> (<= 0 n@@2) (and (=> (<= n@@2 (|Seq#Length| s@@5)) (= (|Seq#Length| (|Seq#Take| s@@5 n@@2)) n@@2)) (=> (< (|Seq#Length| s@@5) n@@2) (= (|Seq#Length| (|Seq#Take| s@@5 n@@2)) (|Seq#Length| s@@5))))) (=> (< n@@2 0) (= (|Seq#Length| (|Seq#Take| s@@5 n@@2)) 0)))))
 :qid |stdinbpl.287:18|
 :skolemid |36|
 :pattern ( (|Seq#Length| (|Seq#Take| s@@5 n@@2)))
 :pattern ( (|Seq#Take| s@@5 n@@2) (|Seq#Length| s@@5))
)))
(assert (forall ((arg0@@38 Int) (arg1@@15 Int) ) (! (= (type (|Seq#Range| arg0@@38 arg1@@15)) (SeqType intType))
 :qid |funType:Seq#Range|
 :pattern ( (|Seq#Range| arg0@@38 arg1@@15))
)))
(assert (forall ((q@min Int) (q@max Int) (v@@0 T@U) ) (!  (=> (= (type v@@0) intType) (= (|Seq#Contains| (|Seq#Range| q@min q@max) v@@0)  (and (<= q@min (U_2_int v@@0)) (< (U_2_int v@@0) q@max))))
 :qid |stdinbpl.560:15|
 :skolemid |57|
 :pattern ( (|Seq#Contains| (|Seq#Range| q@min q@max) v@@0))
)))
(assert (forall ((s@@6 T@U) (x@@8 T@U) ) (! (let ((T@@7 (type x@@8)))
 (=> (and (= (type s@@6) (SeqType T@@7)) (|Seq#Contains| s@@6 x@@8)) (and (and (<= 0 (|Seq#Skolem| s@@6 x@@8)) (< (|Seq#Skolem| s@@6 x@@8) (|Seq#Length| s@@6))) (= (|Seq#Index| s@@6 (|Seq#Skolem| s@@6 x@@8)) x@@8))))
 :qid |stdinbpl.418:18|
 :skolemid |47|
 :pattern ( (|Seq#Contains| s@@6 x@@8))
)))
(assert (forall ((Heap@@12 T@U) (ExhaleHeap@@1 T@U) (Mask@@4 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@12) (MapType0Type RefType)) (= (type ExhaleHeap@@1) (MapType0Type RefType))) (= (type Mask@@4) (MapType1Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@12 ExhaleHeap@@1 Mask@@4)) (U_2_bool (MapType0Select Heap@@12 o_1 $allocated))) (U_2_bool (MapType0Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.73:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@12 ExhaleHeap@@1 Mask@@4) (MapType0Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert (forall ((Heap@@13 T@U) (l@@1 T@U) ) (!  (=> (and (= (type Heap@@13) (MapType0Type RefType)) (= (type l@@1) RefType)) (and (= (someFun Heap@@13 l@@1) (|someFun'| Heap@@13 l@@1)) (dummyFunction (int_2_U (|someFun#triggerStateless| l@@1)))))
 :qid |stdinbpl.726:15|
 :skolemid |71|
 :pattern ( (someFun Heap@@13 l@@1))
)))
(assert (forall ((s@@7 T@U) (n@@3 Int) ) (! (let ((T@@8 (SeqTypeInv0 (type s@@7))))
 (=> (and (= (type s@@7) (SeqType T@@8)) (<= n@@3 0)) (= (|Seq#Drop| s@@7 n@@3) s@@7)))
 :qid |stdinbpl.402:18|
 :skolemid |45|
 :pattern ( (|Seq#Drop| s@@7 n@@3))
)))
(assert (forall ((i@@3 Int) (j@@1 Int) ) (! (= (|Seq#Sub| i@@3 j@@1) (- i@@3 j@@1))
 :qid |stdinbpl.256:15|
 :skolemid |30|
 :pattern ( (|Seq#Sub| i@@3 j@@1))
)))
(assert (forall ((i@@4 Int) (j@@2 Int) ) (! (= (|Seq#Add| i@@4 j@@2) (+ i@@4 j@@2))
 :qid |stdinbpl.254:15|
 :skolemid |29|
 :pattern ( (|Seq#Add| i@@4 j@@2))
)))
(assert (forall ((arg0@@39 T@U) ) (! (let ((T@@9 (type arg0@@39)))
(= (type (|Seq#Singleton| arg0@@39)) (SeqType T@@9)))
 :qid |funType:Seq#Singleton|
 :pattern ( (|Seq#Singleton| arg0@@39))
)))
(assert (forall ((x@@9 T@U) (y@@1 T@U) ) (! (let ((T@@10 (type x@@9)))
 (=> (= (type y@@1) T@@10) (= (|Seq#Contains| (|Seq#Singleton| x@@9) y@@1) (= x@@9 y@@1))))
 :qid |stdinbpl.543:18|
 :skolemid |54|
 :pattern ( (|Seq#Contains| (|Seq#Singleton| x@@9) y@@1))
)))
(assert (forall ((this@@7 T@U) (i@@5 Int) (this2 T@U) (i2 Int) ) (!  (=> (and (and (= (type this@@7) RefType) (= (type this2) RefType)) (= (someList this@@7 i@@5) (someList this2 i2))) (and (= this@@7 this2) (= i@@5 i2)))
 :qid |stdinbpl.1217:15|
 :skolemid |101|
 :pattern ( (someList this@@7 i@@5) (someList this2 i2))
)))
(assert (forall ((arg0@@40 T@U) (arg1@@16 Int) ) (! (= (type (|someList#sm| arg0@@40 arg1@@16)) (FieldType PredicateType_someListType (MapType1Type RefType boolType)))
 :qid |funType:someList#sm|
 :pattern ( (|someList#sm| arg0@@40 arg1@@16))
)))
(assert (forall ((this@@8 T@U) (i@@6 Int) (this2@@0 T@U) (i2@@0 Int) ) (!  (=> (and (and (= (type this@@8) RefType) (= (type this2@@0) RefType)) (= (|someList#sm| this@@8 i@@6) (|someList#sm| this2@@0 i2@@0))) (and (= this@@8 this2@@0) (= i@@6 i2@@0)))
 :qid |stdinbpl.1221:15|
 :skolemid |102|
 :pattern ( (|someList#sm| this@@8 i@@6) (|someList#sm| this2@@0 i2@@0))
)))
(assert (forall ((s@@8 T@U) (n@@4 Int) (j@@3 Int) ) (! (let ((T@@11 (SeqTypeInv0 (type s@@8))))
 (=> (= (type s@@8) (SeqType T@@11)) (=> (and (and (<= 0 j@@3) (< j@@3 n@@4)) (< j@@3 (|Seq#Length| s@@8))) (= (|Seq#Index| (|Seq#Take| s@@8 n@@4) j@@3) (|Seq#Index| s@@8 j@@3)))))
 :qid |stdinbpl.295:18|
 :skolemid |37|
 :pattern ( (|Seq#Index| (|Seq#Take| s@@8 n@@4) j@@3))
 :pattern ( (|Seq#Index| s@@8 j@@3) (|Seq#Take| s@@8 n@@4))
)))
(assert (forall ((self@@1 T@U) (self2 T@U) ) (!  (=> (and (and (= (type self@@1) RefType) (= (type self2) RefType)) (= (P self@@1) (P self2))) (= self@@1 self2))
 :qid |stdinbpl.1182:15|
 :skolemid |95|
 :pattern ( (P self@@1) (P self2))
)))
(assert (forall ((arg0@@41 T@U) ) (! (= (type (|P#sm| arg0@@41)) (FieldType PredicateType_PType (MapType1Type RefType boolType)))
 :qid |funType:P#sm|
 :pattern ( (|P#sm| arg0@@41))
)))
(assert (forall ((self@@2 T@U) (self2@@0 T@U) ) (!  (=> (and (and (= (type self@@2) RefType) (= (type self2@@0) RefType)) (= (|P#sm| self@@2) (|P#sm| self2@@0))) (= self@@2 self2@@0))
 :qid |stdinbpl.1186:15|
 :skolemid |96|
 :pattern ( (|P#sm| self@@2) (|P#sm| self2@@0))
)))
(assert (forall ((this@@9 T@U) (this2@@1 T@U) ) (!  (=> (and (and (= (type this@@9) RefType) (= (type this2@@1) RefType)) (= (otherList this@@9) (otherList this2@@1))) (= this@@9 this2@@1))
 :qid |stdinbpl.1266:15|
 :skolemid |107|
 :pattern ( (otherList this@@9) (otherList this2@@1))
)))
(assert (forall ((arg0@@42 T@U) ) (! (= (type (|otherList#sm| arg0@@42)) (FieldType PredicateType_otherListType (MapType1Type RefType boolType)))
 :qid |funType:otherList#sm|
 :pattern ( (|otherList#sm| arg0@@42))
)))
(assert (forall ((this@@10 T@U) (this2@@2 T@U) ) (!  (=> (and (and (= (type this@@10) RefType) (= (type this2@@2) RefType)) (= (|otherList#sm| this@@10) (|otherList#sm| this2@@2))) (= this@@10 this2@@2))
 :qid |stdinbpl.1270:15|
 :skolemid |108|
 :pattern ( (|otherList#sm| this@@10) (|otherList#sm| this2@@2))
)))
(assert (forall ((this@@11 T@U) (this2@@3 T@U) ) (!  (=> (and (and (= (type this@@11) RefType) (= (type this2@@3) RefType)) (= (list this@@11) (list this2@@3))) (= this@@11 this2@@3))
 :qid |stdinbpl.1301:15|
 :skolemid |113|
 :pattern ( (list this@@11) (list this2@@3))
)))
(assert (forall ((arg0@@43 T@U) ) (! (= (type (|list#sm| arg0@@43)) (FieldType PredicateType_listType (MapType1Type RefType boolType)))
 :qid |funType:list#sm|
 :pattern ( (|list#sm| arg0@@43))
)))
(assert (forall ((this@@12 T@U) (this2@@4 T@U) ) (!  (=> (and (and (= (type this@@12) RefType) (= (type this2@@4) RefType)) (= (|list#sm| this@@12) (|list#sm| this2@@4))) (= this@@12 this2@@4))
 :qid |stdinbpl.1305:15|
 :skolemid |114|
 :pattern ( (|list#sm| this@@12) (|list#sm| this2@@4))
)))
(assert (forall ((this@@13 T@U) (this2@@5 T@U) ) (!  (=> (and (and (= (type this@@13) RefType) (= (type this2@@5) RefType)) (= (list2 this@@13) (list2 this2@@5))) (= this@@13 this2@@5))
 :qid |stdinbpl.1372:15|
 :skolemid |119|
 :pattern ( (list2 this@@13) (list2 this2@@5))
)))
(assert (forall ((arg0@@44 T@U) ) (! (= (type (|list2#sm| arg0@@44)) (FieldType PredicateType_list2Type (MapType1Type RefType boolType)))
 :qid |funType:list2#sm|
 :pattern ( (|list2#sm| arg0@@44))
)))
(assert (forall ((this@@14 T@U) (this2@@6 T@U) ) (!  (=> (and (and (= (type this@@14) RefType) (= (type this2@@6) RefType)) (= (|list2#sm| this@@14) (|list2#sm| this2@@6))) (= this@@14 this2@@6))
 :qid |stdinbpl.1376:15|
 :skolemid |120|
 :pattern ( (|list2#sm| this@@14) (|list2#sm| this2@@6))
)))
(assert (forall ((Heap2Heap@@0 T@U) (Heap1Heap@@0 T@U) (l@@2 T@U) ) (!  (=> (and (and (and (= (type Heap2Heap@@0) (MapType0Type RefType)) (= (type Heap1Heap@@0) (MapType0Type RefType))) (= (type l@@2) RefType)) (and (= (< NoPerm FullPerm) (< NoPerm FullPerm)) (=> (< NoPerm FullPerm) (= (MapType0Select Heap2Heap@@0 null (someList l@@2 (|sk_someFun#condqp2| (|someFun#condqp2| Heap2Heap@@0 l@@2) (|someFun#condqp2| Heap1Heap@@0 l@@2)))) (MapType0Select Heap1Heap@@0 null (someList l@@2 (|sk_someFun#condqp2| (|someFun#condqp2| Heap2Heap@@0 l@@2) (|someFun#condqp2| Heap1Heap@@0 l@@2)))))))) (= (|someFun#condqp2| Heap2Heap@@0 l@@2) (|someFun#condqp2| Heap1Heap@@0 l@@2)))
 :qid |stdinbpl.753:15|
 :skolemid |75|
 :pattern ( (|someFun#condqp2| Heap2Heap@@0 l@@2) (|someFun#condqp2| Heap1Heap@@0 l@@2) (succHeapTrans Heap2Heap@@0 Heap1Heap@@0))
)))
(assert (forall ((Heap@@14 T@U) (ExhaleHeap@@2 T@U) (Mask@@5 T@U) (o_1@@0 T@U) (f_2 T@U) ) (! (let ((B@@1 (FieldTypeInv1 (type f_2))))
(let ((A@@1 (FieldTypeInv0 (type f_2))))
 (=> (and (and (and (and (and (and (= (type Heap@@14) (MapType0Type RefType)) (= (type ExhaleHeap@@2) (MapType0Type RefType))) (= (type Mask@@5) (MapType1Type RefType realType))) (= (type o_1@@0) RefType)) (= (type f_2) (FieldType A@@1 B@@1))) (IdenticalOnKnownLocations Heap@@14 ExhaleHeap@@2 Mask@@5)) (HasDirectPerm Mask@@5 o_1@@0 f_2)) (= (MapType0Select Heap@@14 o_1@@0 f_2) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2)))))
 :qid |stdinbpl.42:22|
 :skolemid |1|
 :pattern ( (IdenticalOnKnownLocations Heap@@14 ExhaleHeap@@2 Mask@@5) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2))
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
(assert (forall ((p T@U) (v_1 T@U) (w T@U) ) (! (let ((A@@2 (FieldTypeInv0 (type p))))
 (=> (and (and (= (type p) (FieldType A@@2 FrameTypeType)) (= (type v_1) FrameTypeType)) (= (type w) FrameTypeType)) (not (InsidePredicate p v_1 p w))))
 :qid |stdinbpl.199:19|
 :skolemid |21|
 :pattern ( (InsidePredicate p v_1 p w))
)))
(assert (forall ((arg0@@45 T@U) (arg1@@17 T@U) ) (! (let ((T@@14 (SeqTypeInv0 (type arg0@@45))))
(= (type (|Seq#Append| arg0@@45 arg1@@17)) (SeqType T@@14)))
 :qid |funType:Seq#Append|
 :pattern ( (|Seq#Append| arg0@@45 arg1@@17))
)))
(assert (forall ((s0 T@U) (s1 T@U) (n@@5 Int) ) (! (let ((T@@15 (SeqTypeInv0 (type s0))))
 (=> (and (= (type s0) (SeqType T@@15)) (= (type s1) (SeqType T@@15))) (=> (and (and (and (not (= s0 (|Seq#Empty| T@@15))) (not (= s1 (|Seq#Empty| T@@15)))) (<= (|Seq#Length| s0) n@@5)) (< n@@5 (|Seq#Length| (|Seq#Append| s0 s1)))) (and (= (|Seq#Add| (|Seq#Sub| n@@5 (|Seq#Length| s0)) (|Seq#Length| s0)) n@@5) (= (|Seq#Index| (|Seq#Append| s0 s1) n@@5) (|Seq#Index| s1 (|Seq#Sub| n@@5 (|Seq#Length| s0))))))))
 :qid |stdinbpl.267:18|
 :skolemid |32|
 :pattern ( (|Seq#Index| (|Seq#Append| s0 s1) n@@5))
)))
(assert  (not (IsPredicateField elem)))
(assert  (not (IsWandField elem)))
(assert  (not (IsPredicateField next)))
(assert  (not (IsWandField next)))
(assert  (not (IsPredicateField elem2)))
(assert  (not (IsWandField elem2)))
(assert  (not (IsPredicateField next2)))
(assert  (not (IsWandField next2)))
(assert (forall ((Heap@@15 T@U) (ExhaleHeap@@3 T@U) (Mask@@6 T@U) ) (!  (=> (and (and (and (= (type Heap@@15) (MapType0Type RefType)) (= (type ExhaleHeap@@3) (MapType0Type RefType))) (= (type Mask@@6) (MapType1Type RefType realType))) (IdenticalOnKnownLocations Heap@@15 ExhaleHeap@@3 Mask@@6)) (succHeap Heap@@15 ExhaleHeap@@3))
 :qid |stdinbpl.83:15|
 :skolemid |10|
 :pattern ( (IdenticalOnKnownLocations Heap@@15 ExhaleHeap@@3 Mask@@6))
)))
(assert (forall ((Heap@@16 T@U) (Mask@@7 T@U) (l1@@0 T@U) (l2@@0 T@U) (k@@0 Int) ) (!  (=> (and (and (and (and (= (type Heap@@16) (MapType0Type RefType)) (= (type Mask@@7) (MapType1Type RefType realType))) (= (type l1@@0) RefType)) (= (type l2@@0) RefType)) (state Heap@@16 Mask@@7)) (= (|listLength'| Heap@@16 l1@@0 l2@@0 k@@0) (|listLength#frame| (CombineFrames (MapType0Select Heap@@16 null (list l1@@0)) (MapType0Select Heap@@16 null (list2 l2@@0))) l1@@0 l2@@0 k@@0)))
 :qid |stdinbpl.865:15|
 :skolemid |85|
 :pattern ( (state Heap@@16 Mask@@7) (|listLength'| Heap@@16 l1@@0 l2@@0 k@@0))
 :pattern ( (state Heap@@16 Mask@@7) (|listLength#triggerStateless| l1@@0 l2@@0 k@@0) (|list2#trigger| Heap@@16 (list2 l2@@0)) (|list#trigger| Heap@@16 (list l1@@0)))
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
(assert (forall ((Heap@@17 T@U) (Mask@@8 T@U) (l@@3 T@U) ) (!  (=> (and (and (and (= (type Heap@@17) (MapType0Type RefType)) (= (type Mask@@8) (MapType1Type RefType realType))) (= (type l@@3) RefType)) (and (state Heap@@17 Mask@@8) (< AssumeFunctionsAbove 2))) (= (someFun Heap@@17 l@@3) (+ 1 (U_2_int (MapType0Select Heap@@17 l@@3 elem)))))
 :qid |stdinbpl.736:15|
 :skolemid |73|
 :pattern ( (state Heap@@17 Mask@@8) (someFun Heap@@17 l@@3))
 :pattern ( (state Heap@@17 Mask@@8) (|someFun#triggerStateless| l@@3) (|list#trigger| Heap@@17 (list l@@3)) (|otherList#trigger| Heap@@17 (otherList l@@3)))
)))
(assert  (and (forall ((arg0@@46 Real) (arg1@@18 T@U) ) (! (= (type (ConditionalFrame arg0@@46 arg1@@18)) FrameTypeType)
 :qid |funType:ConditionalFrame|
 :pattern ( (ConditionalFrame arg0@@46 arg1@@18))
)) (= (type EmptyFrame) FrameTypeType)))
(assert (forall ((p@@0 Real) (f_6 T@U) ) (!  (=> (= (type f_6) FrameTypeType) (= (ConditionalFrame p@@0 f_6) (ite (> p@@0 0.0) f_6 EmptyFrame)))
 :qid |stdinbpl.187:15|
 :skolemid |19|
 :pattern ( (ConditionalFrame p@@0 f_6))
)))
(assert (forall ((q@min@@0 Int) (q@max@@0 Int) (j@@4 Int) ) (!  (=> (and (<= 0 j@@4) (< j@@4 (- q@max@@0 q@min@@0))) (= (U_2_int (|Seq#Index| (|Seq#Range| q@min@@0 q@max@@0) j@@4)) (+ q@min@@0 j@@4)))
 :qid |stdinbpl.558:15|
 :skolemid |56|
 :pattern ( (|Seq#Index| (|Seq#Range| q@min@@0 q@max@@0) j@@4))
)))
(assert (forall ((Heap@@18 T@U) (Mask@@9 T@U) (l1@@1 T@U) (l2@@1 T@U) (k@@1 Int) ) (!  (=> (and (and (and (and (= (type Heap@@18) (MapType0Type RefType)) (= (type Mask@@9) (MapType1Type RefType realType))) (= (type l1@@1) RefType)) (= (type l2@@1) RefType)) (and (state Heap@@18 Mask@@9) (or (< AssumeFunctionsAbove 1) (|listLength#trigger| (CombineFrames (MapType0Select Heap@@18 null (list l1@@1)) (MapType0Select Heap@@18 null (list2 l2@@1))) l1@@1 l2@@1 k@@1)))) (> (|listLength'| Heap@@18 l1@@1 l2@@1 k@@1) 0))
 :qid |stdinbpl.871:15|
 :skolemid |86|
 :pattern ( (state Heap@@18 Mask@@9) (|listLength'| Heap@@18 l1@@1 l2@@1 k@@1))
)))
(assert (forall ((Mask@@10 T@U) (o_2@@0 T@U) (f_4@@0 T@U) ) (! (let ((B@@3 (FieldTypeInv1 (type f_4@@0))))
(let ((A@@4 (FieldTypeInv0 (type f_4@@0))))
 (=> (and (and (= (type Mask@@10) (MapType1Type RefType realType)) (= (type o_2@@0) RefType)) (= (type f_4@@0) (FieldType A@@4 B@@3))) (= (HasDirectPerm Mask@@10 o_2@@0 f_4@@0) (> (U_2_real (MapType1Select Mask@@10 o_2@@0 f_4@@0)) NoPerm)))))
 :qid |stdinbpl.133:22|
 :skolemid |17|
 :pattern ( (HasDirectPerm Mask@@10 o_2@@0 f_4@@0))
)))
(assert (forall ((s0@@0 T@U) (s1@@0 T@U) ) (! (let ((T@@16 (SeqTypeInv0 (type s0@@0))))
 (=> (and (and (= (type s0@@0) (SeqType T@@16)) (= (type s1@@0) (SeqType T@@16))) (and (not (= s0@@0 (|Seq#Empty| T@@16))) (not (= s1@@0 (|Seq#Empty| T@@16))))) (= (|Seq#Length| (|Seq#Append| s0@@0 s1@@0)) (+ (|Seq#Length| s0@@0) (|Seq#Length| s1@@0)))))
 :qid |stdinbpl.236:18|
 :skolemid |26|
 :pattern ( (|Seq#Length| (|Seq#Append| s0@@0 s1@@0)))
)))
(assert (forall ((s@@9 T@U) (t T@U) (n@@6 Int) ) (! (let ((T@@17 (SeqTypeInv0 (type s@@9))))
 (=> (and (and (= (type s@@9) (SeqType T@@17)) (= (type t) (SeqType T@@17))) (and (> n@@6 0) (> n@@6 (|Seq#Length| s@@9)))) (and (= (|Seq#Add| (|Seq#Sub| n@@6 (|Seq#Length| s@@9)) (|Seq#Length| s@@9)) n@@6) (= (|Seq#Drop| (|Seq#Append| s@@9 t) n@@6) (|Seq#Drop| t (|Seq#Sub| n@@6 (|Seq#Length| s@@9)))))))
 :qid |stdinbpl.392:18|
 :skolemid |44|
 :pattern ( (|Seq#Drop| (|Seq#Append| s@@9 t) n@@6))
)))
(assert (forall ((o_2@@1 T@U) (f_4@@1 T@U) ) (! (let ((B@@4 (FieldTypeInv1 (type f_4@@1))))
(let ((A@@5 (FieldTypeInv0 (type f_4@@1))))
 (=> (and (= (type o_2@@1) RefType) (= (type f_4@@1) (FieldType A@@5 B@@4))) (= (U_2_real (MapType1Select ZeroMask o_2@@1 f_4@@1)) NoPerm))))
 :qid |stdinbpl.106:22|
 :skolemid |13|
 :pattern ( (MapType1Select ZeroMask o_2@@1 f_4@@1))
)))
(assert (forall ((s@@10 T@U) (t@@0 T@U) (n@@7 Int) ) (! (let ((T@@18 (SeqTypeInv0 (type s@@10))))
 (=> (and (and (= (type s@@10) (SeqType T@@18)) (= (type t@@0) (SeqType T@@18))) (and (> n@@7 0) (> n@@7 (|Seq#Length| s@@10)))) (and (= (|Seq#Add| (|Seq#Sub| n@@7 (|Seq#Length| s@@10)) (|Seq#Length| s@@10)) n@@7) (= (|Seq#Take| (|Seq#Append| s@@10 t@@0) n@@7) (|Seq#Append| s@@10 (|Seq#Take| t@@0 (|Seq#Sub| n@@7 (|Seq#Length| s@@10))))))))
 :qid |stdinbpl.379:18|
 :skolemid |42|
 :pattern ( (|Seq#Take| (|Seq#Append| s@@10 t@@0) n@@7))
)))
(assert (forall ((q@min@@1 Int) (q@max@@1 Int) ) (!  (and (=> (< q@min@@1 q@max@@1) (= (|Seq#Length| (|Seq#Range| q@min@@1 q@max@@1)) (- q@max@@1 q@min@@1))) (=> (<= q@max@@1 q@min@@1) (= (|Seq#Length| (|Seq#Range| q@min@@1 q@max@@1)) 0)))
 :qid |stdinbpl.557:15|
 :skolemid |55|
 :pattern ( (|Seq#Length| (|Seq#Range| q@min@@1 q@max@@1)))
)))
(assert (forall ((a T@U) (b T@U) ) (! (let ((T@@19 (SeqTypeInv0 (type a))))
 (=> (and (and (= (type a) (SeqType T@@19)) (= (type b) (SeqType T@@19))) (|Seq#Equal| a b)) (= a b)))
 :qid |stdinbpl.530:18|
 :skolemid |53|
 :pattern ( (|Seq#Equal| a b))
)))
(assert (forall ((Heap@@19 T@U) (l1@@2 T@U) (l2@@2 T@U) (k@@2 Int) ) (!  (=> (and (and (= (type Heap@@19) (MapType0Type RefType)) (= (type l1@@2) RefType)) (= (type l2@@2) RefType)) (and (= (listLength Heap@@19 l1@@2 l2@@2 k@@2) (|listLength'| Heap@@19 l1@@2 l2@@2 k@@2)) (dummyFunction (int_2_U (|listLength#triggerStateless| l1@@2 l2@@2 k@@2)))))
 :qid |stdinbpl.848:15|
 :skolemid |82|
 :pattern ( (listLength Heap@@19 l1@@2 l2@@2 k@@2))
)))
(assert (forall ((s@@11 T@U) (i@@7 Int) ) (! (let ((T@@20 (SeqTypeInv0 (type s@@11))))
 (=> (= (type s@@11) (SeqType T@@20)) (=> (and (<= 0 i@@7) (< i@@7 (|Seq#Length| s@@11))) (|Seq#ContainsTrigger| s@@11 (|Seq#Index| s@@11 i@@7)))))
 :qid |stdinbpl.423:18|
 :skolemid |49|
 :pattern ( (|Seq#Index| s@@11 i@@7))
)))
(assert (forall ((s0@@1 T@U) (s1@@1 T@U) ) (! (let ((T@@21 (SeqTypeInv0 (type s0@@1))))
 (=> (and (= (type s0@@1) (SeqType T@@21)) (= (type s1@@1) (SeqType T@@21))) (and (=> (= s0@@1 (|Seq#Empty| T@@21)) (= (|Seq#Append| s0@@1 s1@@1) s1@@1)) (=> (= s1@@1 (|Seq#Empty| T@@21)) (= (|Seq#Append| s0@@1 s1@@1) s0@@1)))))
 :qid |stdinbpl.242:18|
 :skolemid |27|
 :pattern ( (|Seq#Append| s0@@1 s1@@1))
)))
(assert (forall ((t@@1 T@U) ) (! (= (|Seq#Index| (|Seq#Singleton| t@@1) 0) t@@1)
 :qid |stdinbpl.246:18|
 :skolemid |28|
 :pattern ( (|Seq#Singleton| t@@1))
)))
(assert (forall ((s@@12 T@U) ) (! (let ((T@@22 (SeqTypeInv0 (type s@@12))))
 (=> (= (type s@@12) (SeqType T@@22)) (<= 0 (|Seq#Length| s@@12))))
 :qid |stdinbpl.225:18|
 :skolemid |22|
 :pattern ( (|Seq#Length| s@@12))
)))
(assert (forall ((Heap@@20 T@U) (s@@13 T@U) ) (!  (=> (and (= (type Heap@@20) (MapType0Type RefType)) (= (type s@@13) (SeqType RefType))) (and (= (foo Heap@@20 s@@13) (|foo'| Heap@@20 s@@13)) (dummyFunction (bool_2_U (|foo#triggerStateless| s@@13)))))
 :qid |stdinbpl.590:15|
 :skolemid |58|
 :pattern ( (foo Heap@@20 s@@13))
)))
(assert (forall ((this@@15 T@U) (i@@8 Int) ) (!  (=> (= (type this@@15) RefType) (= (getPredWandId (someList this@@15 i@@8)) 1))
 :qid |stdinbpl.1211:15|
 :skolemid |100|
 :pattern ( (someList this@@15 i@@8))
)))
(assert (forall ((s0@@2 T@U) (s1@@2 T@U) ) (! (let ((T@@23 (SeqTypeInv0 (type s0@@2))))
 (=> (and (and (= (type s0@@2) (SeqType T@@23)) (= (type s1@@2) (SeqType T@@23))) (|Seq#Equal| s0@@2 s1@@2)) (and (= (|Seq#Length| s0@@2) (|Seq#Length| s1@@2)) (forall ((j@@5 Int) ) (!  (=> (and (<= 0 j@@5) (< j@@5 (|Seq#Length| s0@@2))) (= (|Seq#Index| s0@@2 j@@5) (|Seq#Index| s1@@2 j@@5)))
 :qid |stdinbpl.520:13|
 :skolemid |50|
 :pattern ( (|Seq#Index| s0@@2 j@@5))
 :pattern ( (|Seq#Index| s1@@2 j@@5))
)))))
 :qid |stdinbpl.517:18|
 :skolemid |51|
 :pattern ( (|Seq#Equal| s0@@2 s1@@2))
)))
(assert (forall ((Heap@@21 T@U) (ExhaleHeap@@4 T@U) (Mask@@11 T@U) (pm_f@@1 T@U) ) (! (let ((C@@1 (FieldTypeInv0 (type pm_f@@1))))
 (=> (and (and (and (and (and (= (type Heap@@21) (MapType0Type RefType)) (= (type ExhaleHeap@@4) (MapType0Type RefType))) (= (type Mask@@11) (MapType1Type RefType realType))) (= (type pm_f@@1) (FieldType C@@1 FrameTypeType))) (IdenticalOnKnownLocations Heap@@21 ExhaleHeap@@4 Mask@@11)) (and (HasDirectPerm Mask@@11 null pm_f@@1) (IsPredicateField pm_f@@1))) (forall ((o2 T@U) (f_2@@0 T@U) ) (! (let ((B@@5 (FieldTypeInv1 (type f_2@@0))))
(let ((A@@6 (FieldTypeInv0 (type f_2@@0))))
 (=> (and (and (= (type o2) RefType) (= (type f_2@@0) (FieldType A@@6 B@@5))) (U_2_bool (MapType1Select (MapType0Select Heap@@21 null (PredicateMaskField pm_f@@1)) o2 f_2@@0))) (= (MapType0Select Heap@@21 o2 f_2@@0) (MapType0Select ExhaleHeap@@4 o2 f_2@@0)))))
 :qid |stdinbpl.54:134|
 :skolemid |3|
 :pattern ( (MapType0Select ExhaleHeap@@4 o2 f_2@@0))
))))
 :qid |stdinbpl.52:19|
 :skolemid |4|
 :pattern ( (IdenticalOnKnownLocations Heap@@21 ExhaleHeap@@4 Mask@@11) (IsPredicateField pm_f@@1))
)))
(assert (forall ((Heap@@22 T@U) (ExhaleHeap@@5 T@U) (Mask@@12 T@U) (pm_f@@2 T@U) ) (! (let ((C@@2 (FieldTypeInv0 (type pm_f@@2))))
 (=> (and (and (and (and (and (= (type Heap@@22) (MapType0Type RefType)) (= (type ExhaleHeap@@5) (MapType0Type RefType))) (= (type Mask@@12) (MapType1Type RefType realType))) (= (type pm_f@@2) (FieldType C@@2 FrameTypeType))) (IdenticalOnKnownLocations Heap@@22 ExhaleHeap@@5 Mask@@12)) (and (HasDirectPerm Mask@@12 null pm_f@@2) (IsWandField pm_f@@2))) (forall ((o2@@0 T@U) (f_2@@1 T@U) ) (! (let ((B@@6 (FieldTypeInv1 (type f_2@@1))))
(let ((A@@7 (FieldTypeInv0 (type f_2@@1))))
 (=> (and (and (= (type o2@@0) RefType) (= (type f_2@@1) (FieldType A@@7 B@@6))) (U_2_bool (MapType1Select (MapType0Select Heap@@22 null (WandMaskField pm_f@@2)) o2@@0 f_2@@1))) (= (MapType0Select Heap@@22 o2@@0 f_2@@1) (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1)))))
 :qid |stdinbpl.67:129|
 :skolemid |6|
 :pattern ( (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1))
))))
 :qid |stdinbpl.65:19|
 :skolemid |7|
 :pattern ( (IdenticalOnKnownLocations Heap@@22 ExhaleHeap@@5 Mask@@12) (IsWandField pm_f@@2))
)))
(assert (forall ((self@@3 T@U) ) (!  (=> (= (type self@@3) RefType) (= (getPredWandId (P self@@3)) 0))
 :qid |stdinbpl.1176:15|
 :skolemid |94|
 :pattern ( (P self@@3))
)))
(assert (forall ((this@@16 T@U) ) (!  (=> (= (type this@@16) RefType) (= (getPredWandId (otherList this@@16)) 2))
 :qid |stdinbpl.1260:15|
 :skolemid |106|
 :pattern ( (otherList this@@16))
)))
(assert (forall ((this@@17 T@U) ) (!  (=> (= (type this@@17) RefType) (= (getPredWandId (list this@@17)) 3))
 :qid |stdinbpl.1295:15|
 :skolemid |112|
 :pattern ( (list this@@17))
)))
(assert (forall ((this@@18 T@U) ) (!  (=> (= (type this@@18) RefType) (= (getPredWandId (list2 this@@18)) 4))
 :qid |stdinbpl.1366:15|
 :skolemid |118|
 :pattern ( (list2 this@@18))
)))
(assert (forall ((t@@2 T@U) ) (! (= (|Seq#Length| (|Seq#Singleton| t@@2)) 1)
 :qid |stdinbpl.233:18|
 :skolemid |25|
 :pattern ( (|Seq#Singleton| t@@2))
)))
(assert (forall ((Mask@@13 T@U) (o_2@@2 T@U) (f_4@@2 T@U) ) (! (let ((B@@7 (FieldTypeInv1 (type f_4@@2))))
(let ((A@@8 (FieldTypeInv0 (type f_4@@2))))
 (=> (and (and (and (= (type Mask@@13) (MapType1Type RefType realType)) (= (type o_2@@2) RefType)) (= (type f_4@@2) (FieldType A@@8 B@@7))) (GoodMask Mask@@13)) (and (>= (U_2_real (MapType1Select Mask@@13 o_2@@2 f_4@@2)) NoPerm) (=> (and (and (GoodMask Mask@@13) (not (IsPredicateField f_4@@2))) (not (IsWandField f_4@@2))) (<= (U_2_real (MapType1Select Mask@@13 o_2@@2 f_4@@2)) FullPerm))))))
 :qid |stdinbpl.128:22|
 :skolemid |16|
 :pattern ( (GoodMask Mask@@13) (MapType1Select Mask@@13 o_2@@2 f_4@@2))
)))
(assert (forall ((Heap@@23 T@U) (Mask@@14 T@U) (s@@14 T@U) ) (!  (=> (and (and (and (= (type Heap@@23) (MapType0Type RefType)) (= (type Mask@@14) (MapType1Type RefType realType))) (= (type s@@14) (SeqType RefType))) (state Heap@@23 Mask@@14)) (= (|foo'| Heap@@23 s@@14) (|foo#frame| (FrameFragment (int_2_U (|foo#condqp1| Heap@@23 s@@14))) s@@14)))
 :qid |stdinbpl.610:15|
 :skolemid |62|
 :pattern ( (state Heap@@23 Mask@@14) (|foo'| Heap@@23 s@@14))
)))
(assert (forall ((o T@U) (f T@U) (Heap@@24 T@U) ) (!  (=> (and (and (and (= (type o) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap@@24) (MapType0Type RefType))) (U_2_bool (MapType0Select Heap@@24 o $allocated))) (U_2_bool (MapType0Select Heap@@24 (MapType0Select Heap@@24 o f) $allocated)))
 :qid |stdinbpl.31:15|
 :skolemid |0|
 :pattern ( (MapType0Select Heap@@24 o f))
)))
(assert (forall ((this@@19 T@U) (i@@9 Int) ) (!  (=> (= (type this@@19) RefType) (= (PredicateMaskField (someList this@@19 i@@9)) (|someList#sm| this@@19 i@@9)))
 :qid |stdinbpl.1203:15|
 :skolemid |98|
 :pattern ( (PredicateMaskField (someList this@@19 i@@9)))
)))
(assert (forall ((s@@15 T@U) (t@@3 T@U) (n@@8 Int) ) (! (let ((T@@24 (SeqTypeInv0 (type s@@15))))
 (=> (and (and (= (type s@@15) (SeqType T@@24)) (= (type t@@3) (SeqType T@@24))) (and (< 0 n@@8) (<= n@@8 (|Seq#Length| s@@15)))) (= (|Seq#Take| (|Seq#Append| s@@15 t@@3) n@@8) (|Seq#Take| s@@15 n@@8))))
 :qid |stdinbpl.375:18|
 :skolemid |41|
 :pattern ( (|Seq#Take| (|Seq#Append| s@@15 t@@3) n@@8))
)))
(assert (forall ((s@@16 T@U) (i@@10 Int) (v@@1 T@U) ) (! (let ((T@@25 (type v@@1)))
 (=> (= (type s@@16) (SeqType T@@25)) (=> (and (<= 0 i@@10) (< i@@10 (|Seq#Length| s@@16))) (= (|Seq#Length| (|Seq#Update| s@@16 i@@10 v@@1)) (|Seq#Length| s@@16)))))
 :qid |stdinbpl.274:18|
 :skolemid |34|
 :pattern ( (|Seq#Length| (|Seq#Update| s@@16 i@@10 v@@1)))
 :pattern ( (|Seq#Length| s@@16) (|Seq#Update| s@@16 i@@10 v@@1))
)))
(assert (forall ((self@@4 T@U) ) (!  (=> (= (type self@@4) RefType) (= (PredicateMaskField (P self@@4)) (|P#sm| self@@4)))
 :qid |stdinbpl.1168:15|
 :skolemid |92|
 :pattern ( (PredicateMaskField (P self@@4)))
)))
(assert (forall ((this@@20 T@U) ) (!  (=> (= (type this@@20) RefType) (= (PredicateMaskField (otherList this@@20)) (|otherList#sm| this@@20)))
 :qid |stdinbpl.1252:15|
 :skolemid |104|
 :pattern ( (PredicateMaskField (otherList this@@20)))
)))
(assert (forall ((this@@21 T@U) ) (!  (=> (= (type this@@21) RefType) (= (PredicateMaskField (list this@@21)) (|list#sm| this@@21)))
 :qid |stdinbpl.1287:15|
 :skolemid |110|
 :pattern ( (PredicateMaskField (list this@@21)))
)))
(assert (forall ((this@@22 T@U) ) (!  (=> (= (type this@@22) RefType) (= (PredicateMaskField (list2 this@@22)) (|list2#sm| this@@22)))
 :qid |stdinbpl.1358:15|
 :skolemid |116|
 :pattern ( (PredicateMaskField (list2 this@@22)))
)))
(assert (forall ((s@@17 T@U) (t@@4 T@U) (n@@9 Int) ) (! (let ((T@@26 (SeqTypeInv0 (type s@@17))))
 (=> (and (and (= (type s@@17) (SeqType T@@26)) (= (type t@@4) (SeqType T@@26))) (and (< 0 n@@9) (<= n@@9 (|Seq#Length| s@@17)))) (= (|Seq#Drop| (|Seq#Append| s@@17 t@@4) n@@9) (|Seq#Append| (|Seq#Drop| s@@17 n@@9) t@@4))))
 :qid |stdinbpl.388:18|
 :skolemid |43|
 :pattern ( (|Seq#Drop| (|Seq#Append| s@@17 t@@4) n@@9))
)))
(assert (forall ((s@@18 T@U) (n@@10 Int) (i@@11 Int) ) (! (let ((T@@27 (SeqTypeInv0 (type s@@18))))
 (=> (= (type s@@18) (SeqType T@@27)) (=> (and (and (< 0 n@@10) (<= n@@10 i@@11)) (< i@@11 (|Seq#Length| s@@18))) (and (= (|Seq#Add| (|Seq#Sub| i@@11 n@@10) n@@10) i@@11) (= (|Seq#Index| (|Seq#Drop| s@@18 n@@10) (|Seq#Sub| i@@11 n@@10)) (|Seq#Index| s@@18 i@@11))))))
 :qid |stdinbpl.325:18|
 :skolemid |40|
 :pattern ( (|Seq#Drop| s@@18 n@@10) (|Seq#Index| s@@18 i@@11))
)))
(assert (forall ((Heap@@25 T@U) (Mask@@15 T@U) (l1@@3 T@U) (l2@@3 T@U) (k@@3 Int) ) (!  (=> (and (and (and (and (= (type Heap@@25) (MapType0Type RefType)) (= (type Mask@@15) (MapType1Type RefType realType))) (= (type l1@@3) RefType)) (= (type l2@@3) RefType)) (and (state Heap@@25 Mask@@15) (< AssumeFunctionsAbove 1))) (= (listLength Heap@@25 l1@@3 l2@@3 k@@3) (+ (+ (ite (= (MapType0Select Heap@@25 l1@@3 next) null) 1 (+ 1 (|listLength'| Heap@@25 (MapType0Select Heap@@25 l1@@3 next) l2@@3 k@@3))) (|listLength'| Heap@@25 l1@@3 l2@@3 (- k@@3 1))) (ite (= (MapType0Select Heap@@25 l2@@3 next2) null) 1 (+ 1 (|listLength'| Heap@@25 l1@@3 (MapType0Select Heap@@25 l2@@3 next2) k@@3))))))
 :qid |stdinbpl.858:15|
 :skolemid |84|
 :pattern ( (state Heap@@25 Mask@@15) (listLength Heap@@25 l1@@3 l2@@3 k@@3))
 :pattern ( (state Heap@@25 Mask@@15) (|listLength#triggerStateless| l1@@3 l2@@3 k@@3) (|list2#trigger| Heap@@25 (list2 l2@@3)) (|list#trigger| Heap@@25 (list l1@@3)))
)))
(assert (forall ((s0@@3 T@U) (s1@@3 T@U) (n@@11 Int) ) (! (let ((T@@28 (SeqTypeInv0 (type s0@@3))))
 (=> (and (= (type s0@@3) (SeqType T@@28)) (= (type s1@@3) (SeqType T@@28))) (=> (and (and (and (not (= s0@@3 (|Seq#Empty| T@@28))) (not (= s1@@3 (|Seq#Empty| T@@28)))) (<= 0 n@@11)) (< n@@11 (|Seq#Length| s0@@3))) (= (|Seq#Index| (|Seq#Append| s0@@3 s1@@3) n@@11) (|Seq#Index| s0@@3 n@@11)))))
 :qid |stdinbpl.265:18|
 :skolemid |31|
 :pattern ( (|Seq#Index| (|Seq#Append| s0@@3 s1@@3) n@@11))
 :pattern ( (|Seq#Index| s0@@3 n@@11) (|Seq#Append| s0@@3 s1@@3))
)))
(assert (forall ((Heap@@26 T@U) (o@@0 T@U) (f_3 T@U) (v@@2 T@U) ) (! (let ((B@@8 (type v@@2)))
(let ((A@@9 (FieldTypeInv0 (type f_3))))
 (=> (and (and (= (type Heap@@26) (MapType0Type RefType)) (= (type o@@0) RefType)) (= (type f_3) (FieldType A@@9 B@@8))) (succHeap Heap@@26 (MapType0Store Heap@@26 o@@0 f_3 v@@2)))))
 :qid |stdinbpl.78:22|
 :skolemid |9|
 :pattern ( (MapType0Store Heap@@26 o@@0 f_3 v@@2))
)))
(assert (forall ((s0@@4 T@U) (s1@@4 T@U) (m@@7 Int) ) (! (let ((T@@29 (SeqTypeInv0 (type s0@@4))))
 (=> (and (= (type s0@@4) (SeqType T@@29)) (= (type s1@@4) (SeqType T@@29))) (=> (and (and (and (not (= s0@@4 (|Seq#Empty| T@@29))) (not (= s1@@4 (|Seq#Empty| T@@29)))) (<= 0 m@@7)) (< m@@7 (|Seq#Length| s1@@4))) (and (= (|Seq#Sub| (|Seq#Add| m@@7 (|Seq#Length| s0@@4)) (|Seq#Length| s0@@4)) m@@7) (= (|Seq#Index| (|Seq#Append| s0@@4 s1@@4) (|Seq#Add| m@@7 (|Seq#Length| s0@@4))) (|Seq#Index| s1@@4 m@@7))))))
 :qid |stdinbpl.270:18|
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
(assert (forall ((s@@19 T@U) (x@@10 T@U) (i@@12 Int) ) (! (let ((T@@30 (type x@@10)))
 (=> (= (type s@@19) (SeqType T@@30)) (=> (and (and (<= 0 i@@12) (< i@@12 (|Seq#Length| s@@19))) (= (|Seq#Index| s@@19 i@@12) x@@10)) (|Seq#Contains| s@@19 x@@10))))
 :qid |stdinbpl.421:18|
 :skolemid |48|
 :pattern ( (|Seq#Contains| s@@19 x@@10) (|Seq#Index| s@@19 i@@12))
)))
(assert (forall ((s0@@5 T@U) (s1@@5 T@U) ) (! (let ((T@@31 (SeqTypeInv0 (type s0@@5))))
 (=> (and (= (type s0@@5) (SeqType T@@31)) (= (type s1@@5) (SeqType T@@31))) (or (or (and (= s0@@5 s1@@5) (|Seq#Equal| s0@@5 s1@@5)) (and (and (not (= s0@@5 s1@@5)) (not (|Seq#Equal| s0@@5 s1@@5))) (not (= (|Seq#Length| s0@@5) (|Seq#Length| s1@@5))))) (and (and (and (and (and (and (not (= s0@@5 s1@@5)) (not (|Seq#Equal| s0@@5 s1@@5))) (= (|Seq#Length| s0@@5) (|Seq#Length| s1@@5))) (= (|Seq#SkolemDiff| s0@@5 s1@@5) (|Seq#SkolemDiff| s1@@5 s0@@5))) (<= 0 (|Seq#SkolemDiff| s0@@5 s1@@5))) (< (|Seq#SkolemDiff| s0@@5 s1@@5) (|Seq#Length| s0@@5))) (not (= (|Seq#Index| s0@@5 (|Seq#SkolemDiff| s0@@5 s1@@5)) (|Seq#Index| s1@@5 (|Seq#SkolemDiff| s0@@5 s1@@5))))))))
 :qid |stdinbpl.525:18|
 :skolemid |52|
 :pattern ( (|Seq#Equal| s0@@5 s1@@5))
)))
(assert (forall ((p@@1 T@U) (v_1@@0 T@U) (q T@U) (w@@0 T@U) (r T@U) (u T@U) ) (! (let ((C@@3 (FieldTypeInv0 (type r))))
(let ((B@@10 (FieldTypeInv0 (type q))))
(let ((A@@11 (FieldTypeInv0 (type p@@1))))
 (=> (and (and (and (and (and (and (= (type p@@1) (FieldType A@@11 FrameTypeType)) (= (type v_1@@0) FrameTypeType)) (= (type q) (FieldType B@@10 FrameTypeType))) (= (type w@@0) FrameTypeType)) (= (type r) (FieldType C@@3 FrameTypeType))) (= (type u) FrameTypeType)) (and (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))) (InsidePredicate p@@1 v_1@@0 r u)))))
 :qid |stdinbpl.194:25|
 :skolemid |20|
 :pattern ( (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))
)))
(assert (forall ((s@@20 T@U) ) (! (let ((T@@32 (SeqTypeInv0 (type s@@20))))
 (=> (and (= (type s@@20) (SeqType T@@32)) (= (|Seq#Length| s@@20) 0)) (= s@@20 (|Seq#Empty| T@@32))))
 :qid |stdinbpl.229:18|
 :skolemid |24|
 :pattern ( (|Seq#Length| s@@20))
)))
(assert (forall ((s@@21 T@U) (n@@12 Int) ) (! (let ((T@@33 (SeqTypeInv0 (type s@@21))))
 (=> (and (= (type s@@21) (SeqType T@@33)) (<= n@@12 0)) (= (|Seq#Take| s@@21 n@@12) (|Seq#Empty| T@@33))))
 :qid |stdinbpl.404:18|
 :skolemid |46|
 :pattern ( (|Seq#Take| s@@21 n@@12))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun i_5_2 () Int)
(declare-fun s@@22 () T@U)
(declare-fun j_2_1 () Int)
(declare-fun neverTriggered4 (Int) Bool)
(declare-fun Heap@@27 () T@U)
(declare-fun QPMask@0 () T@U)
(declare-fun neverTriggered3 (Int) Bool)
(declare-fun invRecv3 (T@U) Int)
(declare-fun qpRange3 (T@U) Bool)
(declare-fun i_9 () Int)
(declare-fun i_5 () Int)
(declare-fun j_2 () Int)
(assert  (and (and (= (type s@@22) (SeqType RefType)) (= (type Heap@@27) (MapType0Type RefType))) (= (type QPMask@0) (MapType1Type RefType realType))))
(set-info :boogie-vc-id clientFoo)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 25) (let ((anon12_correct true))
(let ((anon21_Else_correct  (=> (and (not (and (>= i_5_2 0) (and (< i_5_2 (|Seq#Length| s@@22)) (and (>= j_2_1 0) (and (< j_2_1 (|Seq#Length| s@@22)) (not (= i_5_2 j_2_1))))))) (= (ControlFlow 0 20) 17)) anon12_correct)))
(let ((anon21_Then_correct  (=> (and (>= i_5_2 0) (and (< i_5_2 (|Seq#Length| s@@22)) (and (>= j_2_1 0) (and (< j_2_1 (|Seq#Length| s@@22)) (not (= i_5_2 j_2_1)))))) (and (=> (= (ControlFlow 0 18) (- 0 19)) (not (= (|Seq#Index| s@@22 i_5_2) (|Seq#Index| s@@22 j_2_1)))) (=> (not (= (|Seq#Index| s@@22 i_5_2) (|Seq#Index| s@@22 j_2_1))) (=> (= (ControlFlow 0 18) 17) anon12_correct))))))
(let ((anon20_Else_correct  (=> (forall ((i_6_1 Int) (j_3_1 Int) ) (!  (=> (and (>= i_6_1 0) (and (< i_6_1 (|Seq#Length| s@@22)) (and (>= j_3_1 0) (and (< j_3_1 (|Seq#Length| s@@22)) (not (= i_6_1 j_3_1)))))) (not (= (|Seq#Index| s@@22 i_6_1) (|Seq#Index| s@@22 j_3_1))))
 :qid |stdinbpl.1545:24|
 :skolemid |129|
 :pattern ( (|Seq#Index| s@@22 i_6_1) (|Seq#Index| s@@22 j_3_1))
)) (and (=> (= (ControlFlow 0 15) (- 0 16)) (forall ((i_7 Int) (i_7_1 Int) ) (!  (=> (and (and (and (and (not (= i_7 i_7_1)) (and (<= 0 i_7) (< i_7 (|Seq#Length| s@@22)))) (and (<= 0 i_7_1) (< i_7_1 (|Seq#Length| s@@22)))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| s@@22 i_7) (|Seq#Index| s@@22 i_7_1))))
 :qid |stdinbpl.1556:21|
 :skolemid |130|
 :pattern ( (neverTriggered4 i_7) (neverTriggered4 i_7_1))
))) (=> (forall ((i_7@@0 Int) (i_7_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_7@@0 i_7_1@@0)) (and (<= 0 i_7@@0) (< i_7@@0 (|Seq#Length| s@@22)))) (and (<= 0 i_7_1@@0) (< i_7_1@@0 (|Seq#Length| s@@22)))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| s@@22 i_7@@0) (|Seq#Index| s@@22 i_7_1@@0))))
 :qid |stdinbpl.1556:21|
 :skolemid |130|
 :pattern ( (neverTriggered4 i_7@@0) (neverTriggered4 i_7_1@@0))
)) (=> (= (ControlFlow 0 15) (- 0 14)) (forall ((i_7@@1 Int) ) (!  (=> (and (<= 0 i_7@@1) (< i_7@@1 (|Seq#Length| s@@22))) (>= (U_2_real (MapType1Select QPMask@0 null (P (|Seq#Index| s@@22 i_7@@1)))) FullPerm))
 :qid |stdinbpl.1563:21|
 :skolemid |131|
 :pattern ( (MapType0Select Heap@@27 null (P (|Seq#Index| s@@22 i_7@@1))))
 :pattern ( (MapType1Select QPMask@0 null (P (|Seq#Index| s@@22 i_7@@1))))
 :pattern ( (|Seq#Index| s@@22 i_7@@1))
))))))))
(let ((anon19_Else_correct true))
(let ((anon17_Else_correct  (and (=> (= (ControlFlow 0 21) (- 0 22)) (forall ((i_3 Int) (i_3_1 Int) ) (!  (=> (and (and (and (and (not (= i_3 i_3_1)) (and (<= 0 i_3) (< i_3 (|Seq#Length| s@@22)))) (and (<= 0 i_3_1) (< i_3_1 (|Seq#Length| s@@22)))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| s@@22 i_3) (|Seq#Index| s@@22 i_3_1))))
 :qid |stdinbpl.1495:17|
 :skolemid |123|
 :pattern ( (neverTriggered3 i_3) (neverTriggered3 i_3_1))
))) (=> (forall ((i_3@@0 Int) (i_3_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_3@@0 i_3_1@@0)) (and (<= 0 i_3@@0) (< i_3@@0 (|Seq#Length| s@@22)))) (and (<= 0 i_3_1@@0) (< i_3_1@@0 (|Seq#Length| s@@22)))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| s@@22 i_3@@0) (|Seq#Index| s@@22 i_3_1@@0))))
 :qid |stdinbpl.1495:17|
 :skolemid |123|
 :pattern ( (neverTriggered3 i_3@@0) (neverTriggered3 i_3_1@@0))
)) (=> (forall ((i_3@@1 Int) ) (!  (=> (and (and (<= 0 i_3@@1) (< i_3@@1 (|Seq#Length| s@@22))) (< NoPerm FullPerm)) (and (= (invRecv3 (|Seq#Index| s@@22 i_3@@1)) i_3@@1) (qpRange3 (|Seq#Index| s@@22 i_3@@1))))
 :qid |stdinbpl.1501:22|
 :skolemid |124|
 :pattern ( (MapType0Select Heap@@27 null (P (|Seq#Index| s@@22 i_3@@1))))
 :pattern ( (MapType1Select ZeroMask null (P (|Seq#Index| s@@22 i_3@@1))))
 :pattern ( (|Seq#Index| s@@22 i_3@@1))
)) (=> (and (and (and (forall ((self@@5 T@U) ) (!  (=> (= (type self@@5) RefType) (=> (and (and (and (<= 0 (invRecv3 self@@5)) (< (invRecv3 self@@5) (|Seq#Length| s@@22))) (< NoPerm FullPerm)) (qpRange3 self@@5)) (= (|Seq#Index| s@@22 (invRecv3 self@@5)) self@@5)))
 :qid |stdinbpl.1505:22|
 :skolemid |125|
 :pattern ( (invRecv3 self@@5))
)) (forall ((self@@6 T@U) ) (!  (=> (= (type self@@6) RefType) (=> (and (and (and (<= 0 (invRecv3 self@@6)) (< (invRecv3 self@@6) (|Seq#Length| s@@22))) (< NoPerm FullPerm)) (qpRange3 self@@6)) (and (=> (< NoPerm FullPerm) (= (|Seq#Index| s@@22 (invRecv3 self@@6)) self@@6)) (= (U_2_real (MapType1Select QPMask@0 null (P self@@6))) (+ (U_2_real (MapType1Select ZeroMask null (P self@@6))) FullPerm)))))
 :qid |stdinbpl.1511:22|
 :skolemid |126|
 :pattern ( (MapType1Select QPMask@0 null (P self@@6)))
))) (and (forall ((o_3 T@U) (f_5 T@U) ) (! (let ((B@@11 (FieldTypeInv1 (type f_5))))
(let ((A@@12 (FieldTypeInv0 (type f_5))))
 (=> (and (and (= (type o_3) RefType) (= (type f_5) (FieldType A@@12 B@@11))) (or (or (not (= o_3 null)) (not (IsPredicateField f_5))) (not (= (getPredWandId f_5) 0)))) (= (U_2_real (MapType1Select ZeroMask o_3 f_5)) (U_2_real (MapType1Select QPMask@0 o_3 f_5))))))
 :qid |stdinbpl.1517:29|
 :skolemid |127|
 :pattern ( (MapType1Select ZeroMask o_3 f_5))
 :pattern ( (MapType1Select QPMask@0 o_3 f_5))
)) (forall ((self@@7 T@U) ) (!  (=> (and (= (type self@@7) RefType) (not (and (and (and (<= 0 (invRecv3 self@@7)) (< (invRecv3 self@@7) (|Seq#Length| s@@22))) (< NoPerm FullPerm)) (qpRange3 self@@7)))) (= (U_2_real (MapType1Select QPMask@0 null (P self@@7))) (U_2_real (MapType1Select ZeroMask null (P self@@7)))))
 :qid |stdinbpl.1521:22|
 :skolemid |128|
 :pattern ( (MapType1Select QPMask@0 null (P self@@7)))
)))) (and (and (state Heap@@27 QPMask@0) (state Heap@@27 QPMask@0)) (and (state Heap@@27 QPMask@0) (state Heap@@27 QPMask@0)))) (and (and (and (=> (= (ControlFlow 0 21) 13) anon19_Else_correct) (=> (= (ControlFlow 0 21) 15) anon20_Else_correct)) (=> (= (ControlFlow 0 21) 18) anon21_Then_correct)) (=> (= (ControlFlow 0 21) 20) anon21_Else_correct))))))))
(let ((anon7_correct true))
(let ((anon18_Else_correct  (=> (and (not (and (<= 0 i_9) (< i_9 (|Seq#Length| s@@22)))) (= (ControlFlow 0 12) 8)) anon7_correct)))
(let ((anon18_Then_correct  (=> (and (<= 0 i_9) (< i_9 (|Seq#Length| s@@22))) (and (=> (= (ControlFlow 0 9) (- 0 11)) (>= i_9 0)) (=> (>= i_9 0) (and (=> (= (ControlFlow 0 9) (- 0 10)) (< i_9 (|Seq#Length| s@@22))) (=> (< i_9 (|Seq#Length| s@@22)) (=> (= (ControlFlow 0 9) 8) anon7_correct))))))))
(let ((anon15_Else_correct  (=> (forall ((i_1_1 Int) (j_1_1 Int) ) (!  (=> (and (>= i_1_1 0) (and (< i_1_1 (|Seq#Length| s@@22)) (and (>= j_1_1 0) (and (< j_1_1 (|Seq#Length| s@@22)) (not (= i_1_1 j_1_1)))))) (not (= (|Seq#Index| s@@22 i_1_1) (|Seq#Index| s@@22 j_1_1))))
 :qid |stdinbpl.1470:20|
 :skolemid |122|
 :pattern ( (|Seq#Index| s@@22 i_1_1) (|Seq#Index| s@@22 j_1_1))
)) (=> (and (state Heap@@27 ZeroMask) (state Heap@@27 ZeroMask)) (and (and (=> (= (ControlFlow 0 23) 21) anon17_Else_correct) (=> (= (ControlFlow 0 23) 9) anon18_Then_correct)) (=> (= (ControlFlow 0 23) 12) anon18_Else_correct))))))
(let ((anon3_correct true))
(let ((anon16_Else_correct  (=> (and (not (and (>= i_5 0) (and (< i_5 (|Seq#Length| s@@22)) (and (>= j_2 0) (and (< j_2 (|Seq#Length| s@@22)) (not (= i_5 j_2))))))) (= (ControlFlow 0 7) 1)) anon3_correct)))
(let ((anon16_Then_correct  (=> (and (>= i_5 0) (and (< i_5 (|Seq#Length| s@@22)) (and (>= j_2 0) (and (< j_2 (|Seq#Length| s@@22)) (not (= i_5 j_2)))))) (and (=> (= (ControlFlow 0 2) (- 0 6)) (>= i_5 0)) (=> (>= i_5 0) (and (=> (= (ControlFlow 0 2) (- 0 5)) (< i_5 (|Seq#Length| s@@22))) (=> (< i_5 (|Seq#Length| s@@22)) (and (=> (= (ControlFlow 0 2) (- 0 4)) (>= j_2 0)) (=> (>= j_2 0) (and (=> (= (ControlFlow 0 2) (- 0 3)) (< j_2 (|Seq#Length| s@@22))) (=> (< j_2 (|Seq#Length| s@@22)) (=> (= (ControlFlow 0 2) 1) anon3_correct))))))))))))
(let ((anon0_correct  (=> (and (state Heap@@27 ZeroMask) (= AssumeFunctionsAbove (- 0 1))) (and (and (=> (= (ControlFlow 0 24) 23) anon15_Else_correct) (=> (= (ControlFlow 0 24) 2) anon16_Then_correct)) (=> (= (ControlFlow 0 24) 7) anon16_Else_correct)))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 25) 24) anon0_correct)))
PreconditionGeneratedEntry_correct))))))))))))))))
))
(check-sat)
(pop 1)
; Valid
(get-info :rlimit)
