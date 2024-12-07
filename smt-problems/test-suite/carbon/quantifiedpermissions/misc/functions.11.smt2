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
(declare-fun f_7 () T@U)
(declare-fun ss () T@U)
(declare-fun FieldType (T@T T@T) T@T)
(declare-fun FieldTypeInv0 (T@T) T@T)
(declare-fun FieldTypeInv1 (T@T) T@T)
(declare-fun NormalFieldType () T@T)
(declare-fun SeqType (T@T) T@T)
(declare-fun SeqTypeInv0 (T@T) T@T)
(declare-fun RefType () T@T)
(declare-fun |Seq#Length| (T@U) Int)
(declare-fun |Seq#Drop| (T@U Int) T@U)
(declare-fun |fun01#condqp1| (T@U T@U) Int)
(declare-fun succHeapTrans (T@U T@U) Bool)
(declare-fun MapType0Type (T@T) T@T)
(declare-fun |sk_fun01#condqp1| (Int Int) Int)
(declare-fun NoPerm () Real)
(declare-fun FullPerm () Real)
(declare-fun MapType0Select (T@U T@U T@U) T@U)
(declare-fun |Seq#Index| (T@U Int) T@U)
(declare-fun MapType0TypeInv0 (T@T) T@T)
(declare-fun MapType0Store (T@U T@U T@U T@U) T@U)
(declare-fun |fun02#condqp2| (T@U T@U) Int)
(declare-fun |sk_fun02#condqp2| (Int Int) Int)
(declare-fun succHeap (T@U T@U) Bool)
(declare-fun state (T@U T@U) Bool)
(declare-fun MapType1Type (T@T T@T) T@T)
(declare-fun GoodMask (T@U) Bool)
(declare-fun MapType1TypeInv0 (T@T) T@T)
(declare-fun MapType1TypeInv1 (T@T) T@T)
(declare-fun MapType1Select (T@U T@U T@U) T@U)
(declare-fun MapType1Store (T@U T@U T@U T@U) T@U)
(declare-fun |fun06'| (T@U T@U Int Int) Int)
(declare-fun dummyFunction (T@U) Bool)
(declare-fun |fun06#triggerStateless| (T@U Int Int) Int)
(declare-fun |fun04'| (T@U T@U Int Int) Int)
(declare-fun |fun04#triggerStateless| (T@U Int Int) Int)
(declare-fun P02 (T@U Int) T@U)
(declare-fun IsPredicateField (T@U) Bool)
(declare-fun PredicateType_P02Type () T@T)
(declare-fun FrameTypeType () T@T)
(declare-fun P01 (T@U Int) T@U)
(declare-fun PredicateType_P01Type () T@T)
(declare-fun |fun03'| (T@U T@U Int) Int)
(declare-fun |fun03#triggerStateless| (T@U Int) Int)
(declare-fun |fun07'| (T@U T@U Int) Int)
(declare-fun |fun07#triggerStateless| (T@U Int) Int)
(declare-fun |fun08'| (T@U T@U Int) Int)
(declare-fun |fun08#triggerStateless| (T@U Int) Int)
(declare-fun |P02#trigger| (T@U T@U) Bool)
(declare-fun |P02#everUsed| (T@U) Bool)
(declare-fun |P01#trigger| (T@U T@U) Bool)
(declare-fun |P01#everUsed| (T@U) Bool)
(declare-fun |Seq#Sub| (Int Int) Int)
(declare-fun |Seq#Add| (Int Int) Int)
(declare-fun IdenticalOnKnownLocations (T@U T@U T@U) Bool)
(declare-fun null () T@U)
(declare-fun PredicateMaskField (T@U) T@U)
(declare-fun HasDirectPerm (T@U T@U T@U) Bool)
(declare-fun IsWandField (T@U) Bool)
(declare-fun WandMaskField (T@U) T@U)
(declare-fun |fun01'| (T@U T@U) Int)
(declare-fun |fun01#triggerStateless| (T@U) Int)
(declare-fun |fun02'| (T@U T@U) Int)
(declare-fun |fun02#triggerStateless| (T@U) Int)
(declare-fun |Seq#Update| (T@U Int T@U) T@U)
(declare-fun |Seq#Take| (T@U Int) T@U)
(declare-fun |fun07#condqp9| (T@U T@U Int) Int)
(declare-fun |sk_fun07#condqp9| (Int Int) Int)
(declare-fun |fun08#condqp10| (T@U T@U Int) Int)
(declare-fun |sk_fun08#condqp10| (Int Int) Int)
(declare-fun |Seq#Contains| (T@U T@U) Bool)
(declare-fun |Seq#Range| (Int Int) T@U)
(declare-fun |Seq#Skolem| (T@U T@U) Int)
(declare-fun fun01 (T@U T@U) Int)
(declare-fun fun02 (T@U T@U) Int)
(declare-fun fun04 (T@U T@U Int Int) Int)
(declare-fun AssumeFunctionsAbove () Int)
(declare-fun |Seq#Singleton| (T@U) T@U)
(declare-fun |P02#sm| (T@U Int) T@U)
(declare-fun |P01#sm| (T@U Int) T@U)
(declare-fun |Seq#Empty| (T@T) T@U)
(declare-fun dummyHeap () T@U)
(declare-fun ZeroMask () T@U)
(declare-fun InsidePredicate (T@U T@U T@U T@U) Bool)
(declare-fun fun03 (T@U T@U Int) Int)
(declare-fun fun08 (T@U T@U Int) Int)
(declare-fun |Seq#Append| (T@U T@U) T@U)
(declare-fun sumMask (T@U T@U T@U) Bool)
(declare-fun |P01#condqp8| (T@U T@U Int) Int)
(declare-fun |sk_P01#condqp8| (Int Int) Int)
(declare-fun ConditionalFrame (Real T@U) T@U)
(declare-fun EmptyFrame () T@U)
(declare-fun fun06 (T@U T@U Int Int) Int)
(declare-fun fun07 (T@U T@U Int) Int)
(declare-fun |fun07#frame| (T@U T@U Int) Int)
(declare-fun FrameFragment (T@U) T@U)
(declare-fun |fun08#frame| (T@U T@U Int) Int)
(declare-fun |fun06#frame| (T@U T@U Int Int) Int)
(declare-fun |fun04#frame| (T@U T@U Int Int) Int)
(declare-fun |P02#condqp6| (T@U T@U Int) Int)
(declare-fun |sk_P02#condqp6| (Int Int) Int)
(declare-fun |Seq#Equal| (T@U T@U) Bool)
(declare-fun |Seq#ContainsTrigger| (T@U T@U) Bool)
(declare-fun getPredWandId (T@U) Int)
(declare-fun |P01#condqp7| (T@U T@U Int) Int)
(declare-fun |sk_P01#condqp7| (Int Int) Int)
(declare-fun |fun07#trigger| (T@U T@U Int) Bool)
(declare-fun |fun01#frame| (T@U T@U) Int)
(declare-fun |fun02#frame| (T@U T@U) Int)
(declare-fun |fun03#condqp4| (T@U T@U Int) Int)
(declare-fun |sk_fun03#condqp4| (Int Int) Int)
(declare-fun ZeroPMask () T@U)
(declare-fun |Seq#SkolemDiff| (T@U T@U) Int)
(declare-fun |fun03#condqp3| (T@U T@U Int) Int)
(declare-fun |sk_fun03#condqp3| (Int Int) Int)
(declare-fun |P02#condqp5| (T@U T@U Int) Int)
(declare-fun |sk_P02#condqp5| (Int Int) Int)
(declare-fun |fun03#frame| (T@U T@U Int) Int)
(declare-fun CombineFrames (T@U T@U) T@U)
(declare-fun |fun08#trigger| (T@U T@U Int) Bool)
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
))) (= (Ctor NormalFieldType) 7)) (= (type $allocated) (FieldType NormalFieldType boolType))) (= (type f_7) (FieldType NormalFieldType intType))) (forall ((arg0@@14 T@T) ) (! (= (Ctor (SeqType arg0@@14)) 8)
 :qid |ctor:SeqType|
))) (forall ((arg0@@15 T@T) ) (! (= (SeqTypeInv0 (SeqType arg0@@15)) arg0@@15)
 :qid |typeInv:SeqTypeInv0|
 :pattern ( (SeqType arg0@@15))
))) (= (Ctor RefType) 9)) (= (type ss) (FieldType NormalFieldType (SeqType RefType)))))
(assert (distinct $allocated f_7 ss)
)
(assert (forall ((arg0@@16 T@U) (arg1@@2 Int) ) (! (let ((T (SeqTypeInv0 (type arg0@@16))))
(= (type (|Seq#Drop| arg0@@16 arg1@@2)) (SeqType T)))
 :qid |funType:Seq#Drop|
 :pattern ( (|Seq#Drop| arg0@@16 arg1@@2))
)))
(assert (forall ((s T@U) (n Int) ) (! (let ((T@@0 (SeqTypeInv0 (type s))))
 (=> (= (type s) (SeqType T@@0)) (and (=> (<= 0 n) (and (=> (<= n (|Seq#Length| s)) (= (|Seq#Length| (|Seq#Drop| s n)) (- (|Seq#Length| s) n))) (=> (< (|Seq#Length| s) n) (= (|Seq#Length| (|Seq#Drop| s n)) 0)))) (=> (< n 0) (= (|Seq#Length| (|Seq#Drop| s n)) (|Seq#Length| s))))))
 :qid |stdinbpl.475:18|
 :skolemid |38|
 :pattern ( (|Seq#Length| (|Seq#Drop| s n)))
 :pattern ( (|Seq#Length| s) (|Seq#Drop| s n))
)))
(assert  (and (and (and (and (and (and (forall ((arg0@@17 T@T) ) (! (= (Ctor (MapType0Type arg0@@17)) 10)
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
)))) (forall ((arg0@@21 T@U) (arg1@@5 Int) ) (! (let ((T@@1 (SeqTypeInv0 (type arg0@@21))))
(= (type (|Seq#Index| arg0@@21 arg1@@5)) T@@1))
 :qid |funType:Seq#Index|
 :pattern ( (|Seq#Index| arg0@@21 arg1@@5))
))))
(assert (forall ((Heap2Heap T@U) (Heap1Heap T@U) (xs T@U) ) (!  (=> (and (and (and (= (type Heap2Heap) (MapType0Type RefType)) (= (type Heap1Heap) (MapType0Type RefType))) (= (type xs) (SeqType RefType))) (and (=  (and (and (<= 0 (|sk_fun01#condqp1| (|fun01#condqp1| Heap2Heap xs) (|fun01#condqp1| Heap1Heap xs))) (< (|sk_fun01#condqp1| (|fun01#condqp1| Heap2Heap xs) (|fun01#condqp1| Heap1Heap xs)) (|Seq#Length| xs))) (< NoPerm FullPerm))  (and (and (<= 0 (|sk_fun01#condqp1| (|fun01#condqp1| Heap2Heap xs) (|fun01#condqp1| Heap1Heap xs))) (< (|sk_fun01#condqp1| (|fun01#condqp1| Heap2Heap xs) (|fun01#condqp1| Heap1Heap xs)) (|Seq#Length| xs))) (< NoPerm FullPerm))) (=> (and (and (<= 0 (|sk_fun01#condqp1| (|fun01#condqp1| Heap2Heap xs) (|fun01#condqp1| Heap1Heap xs))) (< (|sk_fun01#condqp1| (|fun01#condqp1| Heap2Heap xs) (|fun01#condqp1| Heap1Heap xs)) (|Seq#Length| xs))) (< NoPerm FullPerm)) (= (U_2_int (MapType0Select Heap2Heap (|Seq#Index| xs (|sk_fun01#condqp1| (|fun01#condqp1| Heap2Heap xs) (|fun01#condqp1| Heap1Heap xs))) f_7)) (U_2_int (MapType0Select Heap1Heap (|Seq#Index| xs (|sk_fun01#condqp1| (|fun01#condqp1| Heap2Heap xs) (|fun01#condqp1| Heap1Heap xs))) f_7)))))) (= (|fun01#condqp1| Heap2Heap xs) (|fun01#condqp1| Heap1Heap xs)))
 :qid |stdinbpl.789:15|
 :skolemid |63|
 :pattern ( (|fun01#condqp1| Heap2Heap xs) (|fun01#condqp1| Heap1Heap xs) (succHeapTrans Heap2Heap Heap1Heap))
)))
(assert (forall ((Heap2Heap@@0 T@U) (Heap1Heap@@0 T@U) (xs@@0 T@U) ) (!  (=> (and (and (and (= (type Heap2Heap@@0) (MapType0Type RefType)) (= (type Heap1Heap@@0) (MapType0Type RefType))) (= (type xs@@0) (SeqType RefType))) (and (=  (and (and (<= 0 (|sk_fun02#condqp2| (|fun02#condqp2| Heap2Heap@@0 xs@@0) (|fun02#condqp2| Heap1Heap@@0 xs@@0))) (< (|sk_fun02#condqp2| (|fun02#condqp2| Heap2Heap@@0 xs@@0) (|fun02#condqp2| Heap1Heap@@0 xs@@0)) (|Seq#Length| xs@@0))) (< NoPerm FullPerm))  (and (and (<= 0 (|sk_fun02#condqp2| (|fun02#condqp2| Heap2Heap@@0 xs@@0) (|fun02#condqp2| Heap1Heap@@0 xs@@0))) (< (|sk_fun02#condqp2| (|fun02#condqp2| Heap2Heap@@0 xs@@0) (|fun02#condqp2| Heap1Heap@@0 xs@@0)) (|Seq#Length| xs@@0))) (< NoPerm FullPerm))) (=> (and (and (<= 0 (|sk_fun02#condqp2| (|fun02#condqp2| Heap2Heap@@0 xs@@0) (|fun02#condqp2| Heap1Heap@@0 xs@@0))) (< (|sk_fun02#condqp2| (|fun02#condqp2| Heap2Heap@@0 xs@@0) (|fun02#condqp2| Heap1Heap@@0 xs@@0)) (|Seq#Length| xs@@0))) (< NoPerm FullPerm)) (= (U_2_int (MapType0Select Heap2Heap@@0 (|Seq#Index| xs@@0 (|sk_fun02#condqp2| (|fun02#condqp2| Heap2Heap@@0 xs@@0) (|fun02#condqp2| Heap1Heap@@0 xs@@0))) f_7)) (U_2_int (MapType0Select Heap1Heap@@0 (|Seq#Index| xs@@0 (|sk_fun02#condqp2| (|fun02#condqp2| Heap2Heap@@0 xs@@0) (|fun02#condqp2| Heap1Heap@@0 xs@@0))) f_7)))))) (= (|fun02#condqp2| Heap2Heap@@0 xs@@0) (|fun02#condqp2| Heap1Heap@@0 xs@@0)))
 :qid |stdinbpl.933:15|
 :skolemid |76|
 :pattern ( (|fun02#condqp2| Heap2Heap@@0 xs@@0) (|fun02#condqp2| Heap1Heap@@0 xs@@0) (succHeapTrans Heap2Heap@@0 Heap1Heap@@0))
)))
(assert (forall ((Heap0 T@U) (Heap1 T@U) ) (!  (=> (and (and (= (type Heap0) (MapType0Type RefType)) (= (type Heap1) (MapType0Type RefType))) (succHeap Heap0 Heap1)) (succHeapTrans Heap0 Heap1))
 :qid |stdinbpl.88:15|
 :skolemid |11|
 :pattern ( (succHeap Heap0 Heap1))
)))
(assert  (and (and (and (and (and (and (forall ((arg0@@22 T@T) (arg1@@6 T@T) ) (! (= (Ctor (MapType1Type arg0@@22 arg1@@6)) 11)
 :qid |ctor:MapType1Type|
)) (forall ((arg0@@23 T@T) (arg1@@7 T@T) ) (! (= (MapType1TypeInv0 (MapType1Type arg0@@23 arg1@@7)) arg0@@23)
 :qid |typeInv:MapType1TypeInv0|
 :pattern ( (MapType1Type arg0@@23 arg1@@7))
))) (forall ((arg0@@24 T@T) (arg1@@8 T@T) ) (! (= (MapType1TypeInv1 (MapType1Type arg0@@24 arg1@@8)) arg1@@8)
 :qid |typeInv:MapType1TypeInv1|
 :pattern ( (MapType1Type arg0@@24 arg1@@8))
))) (forall ((arg0@@25 T@U) (arg1@@9 T@U) (arg2@@1 T@U) ) (! (let ((aVar1 (MapType1TypeInv1 (type arg0@@25))))
(= (type (MapType1Select arg0@@25 arg1@@9 arg2@@1)) aVar1))
 :qid |funType:MapType1Select|
 :pattern ( (MapType1Select arg0@@25 arg1@@9 arg2@@1))
))) (forall ((arg0@@26 T@U) (arg1@@10 T@U) (arg2@@2 T@U) (arg3@@0 T@U) ) (! (let ((aVar1@@0 (type arg3@@0)))
(let ((aVar0@@0 (type arg1@@10)))
(= (type (MapType1Store arg0@@26 arg1@@10 arg2@@2 arg3@@0)) (MapType1Type aVar0@@0 aVar1@@0))))
 :qid |funType:MapType1Store|
 :pattern ( (MapType1Store arg0@@26 arg1@@10 arg2@@2 arg3@@0))
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
(assert (forall ((Heap@@0 T@U) (xs@@1 T@U) (n@@0 Int) (i Int) ) (!  (=> (and (= (type Heap@@0) (MapType0Type RefType)) (= (type xs@@1) (SeqType RefType))) (dummyFunction (int_2_U (|fun06#triggerStateless| xs@@1 n@@0 i))))
 :qid |stdinbpl.1261:15|
 :skolemid |105|
 :pattern ( (|fun06'| Heap@@0 xs@@1 n@@0 i))
)))
(assert (forall ((Heap@@1 T@U) (x@@8 T@U) (n@@1 Int) (i@@0 Int) ) (!  (=> (and (= (type Heap@@1) (MapType0Type RefType)) (= (type x@@8) RefType)) (dummyFunction (int_2_U (|fun04#triggerStateless| x@@8 n@@1 i@@0))))
 :qid |stdinbpl.1448:15|
 :skolemid |126|
 :pattern ( (|fun04'| Heap@@1 x@@8 n@@1 i@@0))
)))
(assert  (and (and (= (Ctor PredicateType_P02Type) 12) (= (Ctor FrameTypeType) 13)) (forall ((arg0@@27 T@U) (arg1@@11 Int) ) (! (= (type (P02 arg0@@27 arg1@@11)) (FieldType PredicateType_P02Type FrameTypeType))
 :qid |funType:P02|
 :pattern ( (P02 arg0@@27 arg1@@11))
))))
(assert (forall ((xs@@2 T@U) (n@@2 Int) ) (!  (=> (= (type xs@@2) (SeqType RefType)) (IsPredicateField (P02 xs@@2 n@@2)))
 :qid |stdinbpl.2125:15|
 :skolemid |191|
 :pattern ( (P02 xs@@2 n@@2))
)))
(assert  (and (= (Ctor PredicateType_P01Type) 14) (forall ((arg0@@28 T@U) (arg1@@12 Int) ) (! (= (type (P01 arg0@@28 arg1@@12)) (FieldType PredicateType_P01Type FrameTypeType))
 :qid |funType:P01|
 :pattern ( (P01 arg0@@28 arg1@@12))
))))
(assert (forall ((x@@9 T@U) (n@@3 Int) ) (!  (=> (= (type x@@9) RefType) (IsPredicateField (P01 x@@9 n@@3)))
 :qid |stdinbpl.2311:15|
 :skolemid |212|
 :pattern ( (P01 x@@9 n@@3))
)))
(assert (forall ((Heap@@2 T@U) (xs@@3 T@U) (i@@1 Int) ) (!  (=> (and (= (type Heap@@2) (MapType0Type RefType)) (= (type xs@@3) (SeqType RefType))) (dummyFunction (int_2_U (|fun03#triggerStateless| xs@@3 i@@1))))
 :qid |stdinbpl.1055:15|
 :skolemid |85|
 :pattern ( (|fun03'| Heap@@2 xs@@3 i@@1))
)))
(assert (forall ((Heap@@3 T@U) (xs@@4 T@U) (j Int) ) (!  (=> (and (= (type Heap@@3) (MapType0Type RefType)) (= (type xs@@4) (SeqType RefType))) (dummyFunction (int_2_U (|fun07#triggerStateless| xs@@4 j))))
 :qid |stdinbpl.1643:15|
 :skolemid |147|
 :pattern ( (|fun07'| Heap@@3 xs@@4 j))
)))
(assert (forall ((Heap@@4 T@U) (xs@@5 T@U) (i@@2 Int) ) (!  (=> (and (= (type Heap@@4) (MapType0Type RefType)) (= (type xs@@5) (SeqType RefType))) (dummyFunction (int_2_U (|fun08#triggerStateless| xs@@5 i@@2))))
 :qid |stdinbpl.1953:15|
 :skolemid |176|
 :pattern ( (|fun08'| Heap@@4 xs@@5 i@@2))
)))
(assert (forall ((Heap@@5 T@U) (xs@@6 T@U) (n@@4 Int) ) (!  (=> (and (= (type Heap@@5) (MapType0Type RefType)) (= (type xs@@6) (SeqType RefType))) (|P02#everUsed| (P02 xs@@6 n@@4)))
 :qid |stdinbpl.2144:15|
 :skolemid |195|
 :pattern ( (|P02#trigger| Heap@@5 (P02 xs@@6 n@@4)))
)))
(assert (forall ((Heap@@6 T@U) (x@@10 T@U) (n@@5 Int) ) (!  (=> (and (= (type Heap@@6) (MapType0Type RefType)) (= (type x@@10) RefType)) (|P01#everUsed| (P01 x@@10 n@@5)))
 :qid |stdinbpl.2330:15|
 :skolemid |216|
 :pattern ( (|P01#trigger| Heap@@6 (P01 x@@10 n@@5)))
)))
(assert (forall ((s@@0 T@U) (n@@6 Int) (j@@0 Int) ) (! (let ((T@@2 (SeqTypeInv0 (type s@@0))))
 (=> (= (type s@@0) (SeqType T@@2)) (=> (and (and (< 0 n@@6) (<= 0 j@@0)) (< j@@0 (- (|Seq#Length| s@@0) n@@6))) (and (= (|Seq#Sub| (|Seq#Add| j@@0 n@@6) n@@6) j@@0) (= (|Seq#Index| (|Seq#Drop| s@@0 n@@6) j@@0) (|Seq#Index| s@@0 (|Seq#Add| j@@0 n@@6)))))))
 :qid |stdinbpl.496:18|
 :skolemid |39|
 :pattern ( (|Seq#Index| (|Seq#Drop| s@@0 n@@6) j@@0))
)))
(assert  (and (= (type null) RefType) (forall ((arg0@@29 T@U) ) (! (let ((A (FieldTypeInv0 (type arg0@@29))))
(= (type (PredicateMaskField arg0@@29)) (FieldType A (MapType1Type RefType boolType))))
 :qid |funType:PredicateMaskField|
 :pattern ( (PredicateMaskField arg0@@29))
))))
(assert (forall ((Heap@@7 T@U) (ExhaleHeap T@U) (Mask@@0 T@U) (pm_f T@U) ) (! (let ((C (FieldTypeInv0 (type pm_f))))
 (=> (and (and (and (and (and (= (type Heap@@7) (MapType0Type RefType)) (= (type ExhaleHeap) (MapType0Type RefType))) (= (type Mask@@0) (MapType1Type RefType realType))) (= (type pm_f) (FieldType C FrameTypeType))) (IdenticalOnKnownLocations Heap@@7 ExhaleHeap Mask@@0)) (and (HasDirectPerm Mask@@0 null pm_f) (IsPredicateField pm_f))) (= (MapType0Select Heap@@7 null (PredicateMaskField pm_f)) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))))
 :qid |stdinbpl.47:19|
 :skolemid |2|
 :pattern ( (IdenticalOnKnownLocations Heap@@7 ExhaleHeap Mask@@0) (IsPredicateField pm_f) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))
)))
(assert (forall ((arg0@@30 T@U) ) (! (let ((A@@0 (FieldTypeInv0 (type arg0@@30))))
(= (type (WandMaskField arg0@@30)) (FieldType A@@0 (MapType1Type RefType boolType))))
 :qid |funType:WandMaskField|
 :pattern ( (WandMaskField arg0@@30))
)))
(assert (forall ((Heap@@8 T@U) (ExhaleHeap@@0 T@U) (Mask@@1 T@U) (pm_f@@0 T@U) ) (! (let ((C@@0 (FieldTypeInv0 (type pm_f@@0))))
 (=> (and (and (and (and (and (= (type Heap@@8) (MapType0Type RefType)) (= (type ExhaleHeap@@0) (MapType0Type RefType))) (= (type Mask@@1) (MapType1Type RefType realType))) (= (type pm_f@@0) (FieldType C@@0 FrameTypeType))) (IdenticalOnKnownLocations Heap@@8 ExhaleHeap@@0 Mask@@1)) (and (HasDirectPerm Mask@@1 null pm_f@@0) (IsWandField pm_f@@0))) (= (MapType0Select Heap@@8 null (WandMaskField pm_f@@0)) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))))
 :qid |stdinbpl.60:19|
 :skolemid |5|
 :pattern ( (IdenticalOnKnownLocations Heap@@8 ExhaleHeap@@0 Mask@@1) (IsWandField pm_f@@0) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))
)))
(assert (forall ((Heap@@9 T@U) (xs@@7 T@U) ) (!  (=> (and (= (type Heap@@9) (MapType0Type RefType)) (= (type xs@@7) (SeqType RefType))) (dummyFunction (int_2_U (|fun01#triggerStateless| xs@@7))))
 :qid |stdinbpl.763:15|
 :skolemid |59|
 :pattern ( (|fun01'| Heap@@9 xs@@7))
)))
(assert (forall ((Heap@@10 T@U) (xs@@8 T@U) ) (!  (=> (and (= (type Heap@@10) (MapType0Type RefType)) (= (type xs@@8) (SeqType RefType))) (dummyFunction (int_2_U (|fun02#triggerStateless| xs@@8))))
 :qid |stdinbpl.907:15|
 :skolemid |72|
 :pattern ( (|fun02'| Heap@@10 xs@@8))
)))
(assert (forall ((arg0@@31 T@U) (arg1@@13 Int) (arg2@@3 T@U) ) (! (let ((T@@3 (type arg2@@3)))
(= (type (|Seq#Update| arg0@@31 arg1@@13 arg2@@3)) (SeqType T@@3)))
 :qid |funType:Seq#Update|
 :pattern ( (|Seq#Update| arg0@@31 arg1@@13 arg2@@3))
)))
(assert (forall ((s@@1 T@U) (i@@3 Int) (v T@U) (n@@7 Int) ) (! (let ((T@@4 (type v)))
 (=> (= (type s@@1) (SeqType T@@4)) (=> (and (<= 0 n@@7) (< n@@7 (|Seq#Length| s@@1))) (and (=> (= i@@3 n@@7) (= (|Seq#Index| (|Seq#Update| s@@1 i@@3 v) n@@7) v)) (=> (not (= i@@3 n@@7)) (= (|Seq#Index| (|Seq#Update| s@@1 i@@3 v) n@@7) (|Seq#Index| s@@1 n@@7)))))))
 :qid |stdinbpl.451:18|
 :skolemid |35|
 :pattern ( (|Seq#Index| (|Seq#Update| s@@1 i@@3 v) n@@7))
 :pattern ( (|Seq#Index| s@@1 n@@7) (|Seq#Update| s@@1 i@@3 v))
)))
(assert (forall ((arg0@@32 T@U) (arg1@@14 Int) ) (! (let ((T@@5 (SeqTypeInv0 (type arg0@@32))))
(= (type (|Seq#Take| arg0@@32 arg1@@14)) (SeqType T@@5)))
 :qid |funType:Seq#Take|
 :pattern ( (|Seq#Take| arg0@@32 arg1@@14))
)))
(assert (forall ((s@@2 T@U) (n@@8 Int) ) (! (let ((T@@6 (SeqTypeInv0 (type s@@2))))
 (=> (= (type s@@2) (SeqType T@@6)) (and (=> (<= 0 n@@8) (and (=> (<= n@@8 (|Seq#Length| s@@2)) (= (|Seq#Length| (|Seq#Take| s@@2 n@@8)) n@@8)) (=> (< (|Seq#Length| s@@2) n@@8) (= (|Seq#Length| (|Seq#Take| s@@2 n@@8)) (|Seq#Length| s@@2))))) (=> (< n@@8 0) (= (|Seq#Length| (|Seq#Take| s@@2 n@@8)) 0)))))
 :qid |stdinbpl.462:18|
 :skolemid |36|
 :pattern ( (|Seq#Length| (|Seq#Take| s@@2 n@@8)))
 :pattern ( (|Seq#Take| s@@2 n@@8) (|Seq#Length| s@@2))
)))
(assert (forall ((Heap2Heap@@1 T@U) (Heap1Heap@@1 T@U) (xs@@9 T@U) (j@@1 Int) ) (!  (=> (and (and (and (= (type Heap2Heap@@1) (MapType0Type RefType)) (= (type Heap1Heap@@1) (MapType0Type RefType))) (= (type xs@@9) (SeqType RefType))) (and (=  (and (and (<= 0 (|sk_fun07#condqp9| (|fun07#condqp9| Heap2Heap@@1 xs@@9 j@@1) (|fun07#condqp9| Heap1Heap@@1 xs@@9 j@@1))) (< (|sk_fun07#condqp9| (|fun07#condqp9| Heap2Heap@@1 xs@@9 j@@1) (|fun07#condqp9| Heap1Heap@@1 xs@@9 j@@1)) (|Seq#Length| xs@@9))) (< NoPerm FullPerm))  (and (and (<= 0 (|sk_fun07#condqp9| (|fun07#condqp9| Heap2Heap@@1 xs@@9 j@@1) (|fun07#condqp9| Heap1Heap@@1 xs@@9 j@@1))) (< (|sk_fun07#condqp9| (|fun07#condqp9| Heap2Heap@@1 xs@@9 j@@1) (|fun07#condqp9| Heap1Heap@@1 xs@@9 j@@1)) (|Seq#Length| xs@@9))) (< NoPerm FullPerm))) (=> (and (and (<= 0 (|sk_fun07#condqp9| (|fun07#condqp9| Heap2Heap@@1 xs@@9 j@@1) (|fun07#condqp9| Heap1Heap@@1 xs@@9 j@@1))) (< (|sk_fun07#condqp9| (|fun07#condqp9| Heap2Heap@@1 xs@@9 j@@1) (|fun07#condqp9| Heap1Heap@@1 xs@@9 j@@1)) (|Seq#Length| xs@@9))) (< NoPerm FullPerm)) (= (U_2_int (MapType0Select Heap2Heap@@1 (|Seq#Index| xs@@9 (|sk_fun07#condqp9| (|fun07#condqp9| Heap2Heap@@1 xs@@9 j@@1) (|fun07#condqp9| Heap1Heap@@1 xs@@9 j@@1))) f_7)) (U_2_int (MapType0Select Heap1Heap@@1 (|Seq#Index| xs@@9 (|sk_fun07#condqp9| (|fun07#condqp9| Heap2Heap@@1 xs@@9 j@@1) (|fun07#condqp9| Heap1Heap@@1 xs@@9 j@@1))) f_7)))))) (= (|fun07#condqp9| Heap2Heap@@1 xs@@9 j@@1) (|fun07#condqp9| Heap1Heap@@1 xs@@9 j@@1)))
 :qid |stdinbpl.1669:15|
 :skolemid |151|
 :pattern ( (|fun07#condqp9| Heap2Heap@@1 xs@@9 j@@1) (|fun07#condqp9| Heap1Heap@@1 xs@@9 j@@1) (succHeapTrans Heap2Heap@@1 Heap1Heap@@1))
)))
(assert (forall ((Heap2Heap@@2 T@U) (Heap1Heap@@2 T@U) (xs@@10 T@U) (i@@4 Int) ) (!  (=> (and (and (and (= (type Heap2Heap@@2) (MapType0Type RefType)) (= (type Heap1Heap@@2) (MapType0Type RefType))) (= (type xs@@10) (SeqType RefType))) (and (=  (and (and (<= 0 (|sk_fun08#condqp10| (|fun08#condqp10| Heap2Heap@@2 xs@@10 i@@4) (|fun08#condqp10| Heap1Heap@@2 xs@@10 i@@4))) (< (|sk_fun08#condqp10| (|fun08#condqp10| Heap2Heap@@2 xs@@10 i@@4) (|fun08#condqp10| Heap1Heap@@2 xs@@10 i@@4)) (|Seq#Length| xs@@10))) (< NoPerm FullPerm))  (and (and (<= 0 (|sk_fun08#condqp10| (|fun08#condqp10| Heap2Heap@@2 xs@@10 i@@4) (|fun08#condqp10| Heap1Heap@@2 xs@@10 i@@4))) (< (|sk_fun08#condqp10| (|fun08#condqp10| Heap2Heap@@2 xs@@10 i@@4) (|fun08#condqp10| Heap1Heap@@2 xs@@10 i@@4)) (|Seq#Length| xs@@10))) (< NoPerm FullPerm))) (=> (and (and (<= 0 (|sk_fun08#condqp10| (|fun08#condqp10| Heap2Heap@@2 xs@@10 i@@4) (|fun08#condqp10| Heap1Heap@@2 xs@@10 i@@4))) (< (|sk_fun08#condqp10| (|fun08#condqp10| Heap2Heap@@2 xs@@10 i@@4) (|fun08#condqp10| Heap1Heap@@2 xs@@10 i@@4)) (|Seq#Length| xs@@10))) (< NoPerm FullPerm)) (= (U_2_int (MapType0Select Heap2Heap@@2 (|Seq#Index| xs@@10 (|sk_fun08#condqp10| (|fun08#condqp10| Heap2Heap@@2 xs@@10 i@@4) (|fun08#condqp10| Heap1Heap@@2 xs@@10 i@@4))) f_7)) (U_2_int (MapType0Select Heap1Heap@@2 (|Seq#Index| xs@@10 (|sk_fun08#condqp10| (|fun08#condqp10| Heap2Heap@@2 xs@@10 i@@4) (|fun08#condqp10| Heap1Heap@@2 xs@@10 i@@4))) f_7)))))) (= (|fun08#condqp10| Heap2Heap@@2 xs@@10 i@@4) (|fun08#condqp10| Heap1Heap@@2 xs@@10 i@@4)))
 :qid |stdinbpl.1979:15|
 :skolemid |180|
 :pattern ( (|fun08#condqp10| Heap2Heap@@2 xs@@10 i@@4) (|fun08#condqp10| Heap1Heap@@2 xs@@10 i@@4) (succHeapTrans Heap2Heap@@2 Heap1Heap@@2))
)))
(assert (forall ((arg0@@33 Int) (arg1@@15 Int) ) (! (= (type (|Seq#Range| arg0@@33 arg1@@15)) (SeqType intType))
 :qid |funType:Seq#Range|
 :pattern ( (|Seq#Range| arg0@@33 arg1@@15))
)))
(assert (forall ((q@min Int) (q@max Int) (v@@0 T@U) ) (!  (=> (= (type v@@0) intType) (= (|Seq#Contains| (|Seq#Range| q@min q@max) v@@0)  (and (<= q@min (U_2_int v@@0)) (< (U_2_int v@@0) q@max))))
 :qid |stdinbpl.735:15|
 :skolemid |57|
 :pattern ( (|Seq#Contains| (|Seq#Range| q@min q@max) v@@0))
)))
(assert (forall ((s@@3 T@U) (x@@11 T@U) ) (! (let ((T@@7 (type x@@11)))
 (=> (and (= (type s@@3) (SeqType T@@7)) (|Seq#Contains| s@@3 x@@11)) (and (and (<= 0 (|Seq#Skolem| s@@3 x@@11)) (< (|Seq#Skolem| s@@3 x@@11) (|Seq#Length| s@@3))) (= (|Seq#Index| s@@3 (|Seq#Skolem| s@@3 x@@11)) x@@11))))
 :qid |stdinbpl.593:18|
 :skolemid |47|
 :pattern ( (|Seq#Contains| s@@3 x@@11))
)))
(assert (forall ((Heap@@11 T@U) (ExhaleHeap@@1 T@U) (Mask@@2 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@11) (MapType0Type RefType)) (= (type ExhaleHeap@@1) (MapType0Type RefType))) (= (type Mask@@2) (MapType1Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@11 ExhaleHeap@@1 Mask@@2)) (U_2_bool (MapType0Select Heap@@11 o_1 $allocated))) (U_2_bool (MapType0Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.73:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@11 ExhaleHeap@@1 Mask@@2) (MapType0Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert (forall ((Heap@@12 T@U) (xs@@11 T@U) ) (!  (=> (and (= (type Heap@@12) (MapType0Type RefType)) (= (type xs@@11) (SeqType RefType))) (and (= (fun01 Heap@@12 xs@@11) (|fun01'| Heap@@12 xs@@11)) (dummyFunction (int_2_U (|fun01#triggerStateless| xs@@11)))))
 :qid |stdinbpl.759:15|
 :skolemid |58|
 :pattern ( (fun01 Heap@@12 xs@@11))
)))
(assert (forall ((Heap@@13 T@U) (xs@@12 T@U) ) (!  (=> (and (= (type Heap@@13) (MapType0Type RefType)) (= (type xs@@12) (SeqType RefType))) (and (= (fun02 Heap@@13 xs@@12) (|fun02'| Heap@@13 xs@@12)) (dummyFunction (int_2_U (|fun02#triggerStateless| xs@@12)))))
 :qid |stdinbpl.903:15|
 :skolemid |71|
 :pattern ( (fun02 Heap@@13 xs@@12))
)))
(assert (forall ((s@@4 T@U) (n@@9 Int) ) (! (let ((T@@8 (SeqTypeInv0 (type s@@4))))
 (=> (and (= (type s@@4) (SeqType T@@8)) (<= n@@9 0)) (= (|Seq#Drop| s@@4 n@@9) s@@4)))
 :qid |stdinbpl.577:18|
 :skolemid |45|
 :pattern ( (|Seq#Drop| s@@4 n@@9))
)))
(assert (forall ((i@@5 Int) (j@@2 Int) ) (! (= (|Seq#Sub| i@@5 j@@2) (- i@@5 j@@2))
 :qid |stdinbpl.431:15|
 :skolemid |30|
 :pattern ( (|Seq#Sub| i@@5 j@@2))
)))
(assert (forall ((i@@6 Int) (j@@3 Int) ) (! (= (|Seq#Add| i@@6 j@@3) (+ i@@6 j@@3))
 :qid |stdinbpl.429:15|
 :skolemid |29|
 :pattern ( (|Seq#Add| i@@6 j@@3))
)))
(assert (forall ((Heap@@14 T@U) (Mask@@3 T@U) (x@@12 T@U) (n@@10 Int) (i@@7 Int) ) (!  (=> (and (and (and (and (= (type Heap@@14) (MapType0Type RefType)) (= (type Mask@@3) (MapType1Type RefType realType))) (= (type x@@12) RefType)) (and (state Heap@@14 Mask@@3) (< AssumeFunctionsAbove 5))) (and (< 0 i@@7) (< i@@7 n@@10))) (= (fun04 Heap@@14 x@@12 n@@10 i@@7) (U_2_int (MapType0Select Heap@@14 (|Seq#Index| (MapType0Select Heap@@14 x@@12 ss) i@@7) f_7))))
 :qid |stdinbpl.1454:15|
 :skolemid |127|
 :pattern ( (state Heap@@14 Mask@@3) (fun04 Heap@@14 x@@12 n@@10 i@@7))
 :pattern ( (state Heap@@14 Mask@@3) (|fun04#triggerStateless| x@@12 n@@10 i@@7) (|P01#trigger| Heap@@14 (P01 x@@12 n@@10)))
)))
(assert (forall ((arg0@@34 T@U) ) (! (let ((T@@9 (type arg0@@34)))
(= (type (|Seq#Singleton| arg0@@34)) (SeqType T@@9)))
 :qid |funType:Seq#Singleton|
 :pattern ( (|Seq#Singleton| arg0@@34))
)))
(assert (forall ((x@@13 T@U) (y@@1 T@U) ) (! (let ((T@@10 (type x@@13)))
 (=> (= (type y@@1) T@@10) (= (|Seq#Contains| (|Seq#Singleton| x@@13) y@@1) (= x@@13 y@@1))))
 :qid |stdinbpl.718:18|
 :skolemid |54|
 :pattern ( (|Seq#Contains| (|Seq#Singleton| x@@13) y@@1))
)))
(assert (forall ((xs@@13 T@U) (n@@11 Int) (xs2 T@U) (n2 Int) ) (!  (=> (and (and (= (type xs@@13) (SeqType RefType)) (= (type xs2) (SeqType RefType))) (= (P02 xs@@13 n@@11) (P02 xs2 n2))) (and (= xs@@13 xs2) (= n@@11 n2)))
 :qid |stdinbpl.2135:15|
 :skolemid |193|
 :pattern ( (P02 xs@@13 n@@11) (P02 xs2 n2))
)))
(assert (forall ((arg0@@35 T@U) (arg1@@16 Int) ) (! (= (type (|P02#sm| arg0@@35 arg1@@16)) (FieldType PredicateType_P02Type (MapType1Type RefType boolType)))
 :qid |funType:P02#sm|
 :pattern ( (|P02#sm| arg0@@35 arg1@@16))
)))
(assert (forall ((xs@@14 T@U) (n@@12 Int) (xs2@@0 T@U) (n2@@0 Int) ) (!  (=> (and (and (= (type xs@@14) (SeqType RefType)) (= (type xs2@@0) (SeqType RefType))) (= (|P02#sm| xs@@14 n@@12) (|P02#sm| xs2@@0 n2@@0))) (and (= xs@@14 xs2@@0) (= n@@12 n2@@0)))
 :qid |stdinbpl.2139:15|
 :skolemid |194|
 :pattern ( (|P02#sm| xs@@14 n@@12) (|P02#sm| xs2@@0 n2@@0))
)))
(assert (forall ((x@@14 T@U) (n@@13 Int) (x2 T@U) (n2@@1 Int) ) (!  (=> (and (and (= (type x@@14) RefType) (= (type x2) RefType)) (= (P01 x@@14 n@@13) (P01 x2 n2@@1))) (and (= x@@14 x2) (= n@@13 n2@@1)))
 :qid |stdinbpl.2321:15|
 :skolemid |214|
 :pattern ( (P01 x@@14 n@@13) (P01 x2 n2@@1))
)))
(assert (forall ((arg0@@36 T@U) (arg1@@17 Int) ) (! (= (type (|P01#sm| arg0@@36 arg1@@17)) (FieldType PredicateType_P01Type (MapType1Type RefType boolType)))
 :qid |funType:P01#sm|
 :pattern ( (|P01#sm| arg0@@36 arg1@@17))
)))
(assert (forall ((x@@15 T@U) (n@@14 Int) (x2@@0 T@U) (n2@@2 Int) ) (!  (=> (and (and (= (type x@@15) RefType) (= (type x2@@0) RefType)) (= (|P01#sm| x@@15 n@@14) (|P01#sm| x2@@0 n2@@2))) (and (= x@@15 x2@@0) (= n@@14 n2@@2)))
 :qid |stdinbpl.2325:15|
 :skolemid |215|
 :pattern ( (|P01#sm| x@@15 n@@14) (|P01#sm| x2@@0 n2@@2))
)))
(assert (forall ((s@@5 T@U) (n@@15 Int) (j@@4 Int) ) (! (let ((T@@11 (SeqTypeInv0 (type s@@5))))
 (=> (= (type s@@5) (SeqType T@@11)) (=> (and (and (<= 0 j@@4) (< j@@4 n@@15)) (< j@@4 (|Seq#Length| s@@5))) (= (|Seq#Index| (|Seq#Take| s@@5 n@@15) j@@4) (|Seq#Index| s@@5 j@@4)))))
 :qid |stdinbpl.470:18|
 :skolemid |37|
 :pattern ( (|Seq#Index| (|Seq#Take| s@@5 n@@15) j@@4))
 :pattern ( (|Seq#Index| s@@5 j@@4) (|Seq#Take| s@@5 n@@15))
)))
(assert (forall ((Heap@@15 T@U) (ExhaleHeap@@2 T@U) (Mask@@4 T@U) (o_1@@0 T@U) (f_2 T@U) ) (! (let ((B@@1 (FieldTypeInv1 (type f_2))))
(let ((A@@1 (FieldTypeInv0 (type f_2))))
 (=> (and (and (and (and (and (and (= (type Heap@@15) (MapType0Type RefType)) (= (type ExhaleHeap@@2) (MapType0Type RefType))) (= (type Mask@@4) (MapType1Type RefType realType))) (= (type o_1@@0) RefType)) (= (type f_2) (FieldType A@@1 B@@1))) (IdenticalOnKnownLocations Heap@@15 ExhaleHeap@@2 Mask@@4)) (HasDirectPerm Mask@@4 o_1@@0 f_2)) (= (MapType0Select Heap@@15 o_1@@0 f_2) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2)))))
 :qid |stdinbpl.42:22|
 :skolemid |1|
 :pattern ( (IdenticalOnKnownLocations Heap@@15 ExhaleHeap@@2 Mask@@4) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2))
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
 :qid |stdinbpl.374:19|
 :skolemid |21|
 :pattern ( (InsidePredicate p v_1 p w))
)))
(assert (forall ((Heap@@16 T@U) (Mask@@5 T@U) (xs@@15 T@U) (i@@8 Int) ) (!  (=> (and (and (and (and (= (type Heap@@16) (MapType0Type RefType)) (= (type Mask@@5) (MapType1Type RefType realType))) (= (type xs@@15) (SeqType RefType))) (and (state Heap@@16 Mask@@5) (< AssumeFunctionsAbove 1))) (and (and (> (|Seq#Length| xs@@15) 6) (forall ((k Int) (j@@5 Int) ) (!  (=> (and (>= k 0) (and (< k (|Seq#Length| xs@@15)) (and (>= j@@5 0) (and (< j@@5 (|Seq#Length| xs@@15)) (not (= k j@@5)))))) (not (= (|Seq#Index| xs@@15 k) (|Seq#Index| xs@@15 j@@5))))
 :qid |stdinbpl.1063:84|
 :skolemid |86|
 :pattern ( (|Seq#Index| xs@@15 k) (|Seq#Index| xs@@15 j@@5))
))) (and (<= 0 i@@8) (< i@@8 (|Seq#Length| xs@@15))))) (= (fun03 Heap@@16 xs@@15 i@@8) (U_2_int (MapType0Select Heap@@16 (|Seq#Index| xs@@15 i@@8) f_7))))
 :qid |stdinbpl.1061:15|
 :skolemid |87|
 :pattern ( (state Heap@@16 Mask@@5) (fun03 Heap@@16 xs@@15 i@@8))
)))
(assert (forall ((Heap@@17 T@U) (Mask@@6 T@U) (xs@@16 T@U) (i@@9 Int) ) (!  (=> (and (and (and (and (= (type Heap@@17) (MapType0Type RefType)) (= (type Mask@@6) (MapType1Type RefType realType))) (= (type xs@@16) (SeqType RefType))) (and (state Heap@@17 Mask@@6) (< AssumeFunctionsAbove 0))) (and (forall ((k@@0 Int) (j@@6 Int) ) (!  (=> (and (>= k@@0 0) (and (< k@@0 (|Seq#Length| xs@@16)) (and (>= j@@6 0) (and (< j@@6 (|Seq#Length| xs@@16)) (not (= k@@0 j@@6)))))) (not (= (|Seq#Index| xs@@16 k@@0) (|Seq#Index| xs@@16 j@@6))))
 :qid |stdinbpl.1961:61|
 :skolemid |177|
 :pattern ( (|Seq#Index| xs@@16 k@@0) (|Seq#Index| xs@@16 j@@6))
)) (and (<= 0 i@@9) (< i@@9 (|Seq#Length| xs@@16))))) (= (fun08 Heap@@17 xs@@16 i@@9) (+ (U_2_int (MapType0Select Heap@@17 (|Seq#Index| xs@@16 i@@9) f_7)) 1)))
 :qid |stdinbpl.1959:15|
 :skolemid |178|
 :pattern ( (state Heap@@17 Mask@@6) (fun08 Heap@@17 xs@@16 i@@9))
)))
(assert (forall ((arg0@@37 T@U) (arg1@@18 T@U) ) (! (let ((T@@14 (SeqTypeInv0 (type arg0@@37))))
(= (type (|Seq#Append| arg0@@37 arg1@@18)) (SeqType T@@14)))
 :qid |funType:Seq#Append|
 :pattern ( (|Seq#Append| arg0@@37 arg1@@18))
)))
(assert (forall ((s0 T@U) (s1 T@U) (n@@16 Int) ) (! (let ((T@@15 (SeqTypeInv0 (type s0))))
 (=> (and (= (type s0) (SeqType T@@15)) (= (type s1) (SeqType T@@15))) (=> (and (and (and (not (= s0 (|Seq#Empty| T@@15))) (not (= s1 (|Seq#Empty| T@@15)))) (<= (|Seq#Length| s0) n@@16)) (< n@@16 (|Seq#Length| (|Seq#Append| s0 s1)))) (and (= (|Seq#Add| (|Seq#Sub| n@@16 (|Seq#Length| s0)) (|Seq#Length| s0)) n@@16) (= (|Seq#Index| (|Seq#Append| s0 s1) n@@16) (|Seq#Index| s1 (|Seq#Sub| n@@16 (|Seq#Length| s0))))))))
 :qid |stdinbpl.442:18|
 :skolemid |32|
 :pattern ( (|Seq#Index| (|Seq#Append| s0 s1) n@@16))
)))
(assert  (not (IsPredicateField f_7)))
(assert  (not (IsWandField f_7)))
(assert  (not (IsPredicateField ss)))
(assert  (not (IsWandField ss)))
(assert (forall ((Heap@@18 T@U) (ExhaleHeap@@3 T@U) (Mask@@7 T@U) ) (!  (=> (and (and (and (= (type Heap@@18) (MapType0Type RefType)) (= (type ExhaleHeap@@3) (MapType0Type RefType))) (= (type Mask@@7) (MapType1Type RefType realType))) (IdenticalOnKnownLocations Heap@@18 ExhaleHeap@@3 Mask@@7)) (succHeap Heap@@18 ExhaleHeap@@3))
 :qid |stdinbpl.83:15|
 :skolemid |10|
 :pattern ( (IdenticalOnKnownLocations Heap@@18 ExhaleHeap@@3 Mask@@7))
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
(assert (forall ((Heap2Heap@@3 T@U) (Heap1Heap@@3 T@U) (x@@16 T@U) (n@@17 Int) ) (!  (=> (and (and (and (= (type Heap2Heap@@3) (MapType0Type RefType)) (= (type Heap1Heap@@3) (MapType0Type RefType))) (= (type x@@16) RefType)) (and (=  (and (and (<= 3 (|sk_P01#condqp8| (|P01#condqp8| Heap2Heap@@3 x@@16 n@@17) (|P01#condqp8| Heap1Heap@@3 x@@16 n@@17))) (< (|sk_P01#condqp8| (|P01#condqp8| Heap2Heap@@3 x@@16 n@@17) (|P01#condqp8| Heap1Heap@@3 x@@16 n@@17)) n@@17)) (< NoPerm FullPerm))  (and (and (<= 3 (|sk_P01#condqp8| (|P01#condqp8| Heap2Heap@@3 x@@16 n@@17) (|P01#condqp8| Heap1Heap@@3 x@@16 n@@17))) (< (|sk_P01#condqp8| (|P01#condqp8| Heap2Heap@@3 x@@16 n@@17) (|P01#condqp8| Heap1Heap@@3 x@@16 n@@17)) n@@17)) (< NoPerm FullPerm))) (=> (and (and (<= 3 (|sk_P01#condqp8| (|P01#condqp8| Heap2Heap@@3 x@@16 n@@17) (|P01#condqp8| Heap1Heap@@3 x@@16 n@@17))) (< (|sk_P01#condqp8| (|P01#condqp8| Heap2Heap@@3 x@@16 n@@17) (|P01#condqp8| Heap1Heap@@3 x@@16 n@@17)) n@@17)) (< NoPerm FullPerm)) (= (U_2_int (MapType0Select Heap2Heap@@3 (|Seq#Index| (MapType0Select Heap2Heap@@3 x@@16 ss) (|sk_P01#condqp8| (|P01#condqp8| Heap2Heap@@3 x@@16 n@@17) (|P01#condqp8| Heap1Heap@@3 x@@16 n@@17))) f_7)) (U_2_int (MapType0Select Heap1Heap@@3 (|Seq#Index| (MapType0Select Heap1Heap@@3 x@@16 ss) (|sk_P01#condqp8| (|P01#condqp8| Heap2Heap@@3 x@@16 n@@17) (|P01#condqp8| Heap1Heap@@3 x@@16 n@@17))) f_7)))))) (= (|P01#condqp8| Heap2Heap@@3 x@@16 n@@17) (|P01#condqp8| Heap1Heap@@3 x@@16 n@@17)))
 :qid |stdinbpl.2352:15|
 :skolemid |218|
 :pattern ( (|P01#condqp8| Heap2Heap@@3 x@@16 n@@17) (|P01#condqp8| Heap1Heap@@3 x@@16 n@@17) (succHeapTrans Heap2Heap@@3 Heap1Heap@@3))
)))
(assert  (and (forall ((arg0@@38 Real) (arg1@@19 T@U) ) (! (= (type (ConditionalFrame arg0@@38 arg1@@19)) FrameTypeType)
 :qid |funType:ConditionalFrame|
 :pattern ( (ConditionalFrame arg0@@38 arg1@@19))
)) (= (type EmptyFrame) FrameTypeType)))
(assert (forall ((p@@0 Real) (f_6 T@U) ) (!  (=> (= (type f_6) FrameTypeType) (= (ConditionalFrame p@@0 f_6) (ite (> p@@0 0.0) f_6 EmptyFrame)))
 :qid |stdinbpl.362:15|
 :skolemid |19|
 :pattern ( (ConditionalFrame p@@0 f_6))
)))
(assert (forall ((q@min@@0 Int) (q@max@@0 Int) (j@@7 Int) ) (!  (=> (and (<= 0 j@@7) (< j@@7 (- q@max@@0 q@min@@0))) (= (U_2_int (|Seq#Index| (|Seq#Range| q@min@@0 q@max@@0) j@@7)) (+ q@min@@0 j@@7)))
 :qid |stdinbpl.733:15|
 :skolemid |56|
 :pattern ( (|Seq#Index| (|Seq#Range| q@min@@0 q@max@@0) j@@7))
)))
(assert (forall ((Heap@@19 T@U) (Mask@@8 T@U) (xs@@17 T@U) (n@@18 Int) (i@@10 Int) ) (!  (=> (and (and (and (and (= (type Heap@@19) (MapType0Type RefType)) (= (type Mask@@8) (MapType1Type RefType realType))) (= (type xs@@17) (SeqType RefType))) (and (state Heap@@19 Mask@@8) (< AssumeFunctionsAbove 3))) (and (< 0 i@@10) (< i@@10 n@@18))) (= (fun06 Heap@@19 xs@@17 n@@18 i@@10) (U_2_int (MapType0Select Heap@@19 (|Seq#Index| xs@@17 i@@10) f_7))))
 :qid |stdinbpl.1267:15|
 :skolemid |106|
 :pattern ( (state Heap@@19 Mask@@8) (fun06 Heap@@19 xs@@17 n@@18 i@@10))
 :pattern ( (state Heap@@19 Mask@@8) (|fun06#triggerStateless| xs@@17 n@@18 i@@10) (|P02#trigger| Heap@@19 (P02 xs@@17 n@@18)))
)))
(assert (forall ((Mask@@9 T@U) (o_2@@0 T@U) (f_4@@0 T@U) ) (! (let ((B@@3 (FieldTypeInv1 (type f_4@@0))))
(let ((A@@4 (FieldTypeInv0 (type f_4@@0))))
 (=> (and (and (= (type Mask@@9) (MapType1Type RefType realType)) (= (type o_2@@0) RefType)) (= (type f_4@@0) (FieldType A@@4 B@@3))) (= (HasDirectPerm Mask@@9 o_2@@0 f_4@@0) (> (U_2_real (MapType1Select Mask@@9 o_2@@0 f_4@@0)) NoPerm)))))
 :qid |stdinbpl.133:22|
 :skolemid |17|
 :pattern ( (HasDirectPerm Mask@@9 o_2@@0 f_4@@0))
)))
(assert (forall ((s0@@0 T@U) (s1@@0 T@U) ) (! (let ((T@@16 (SeqTypeInv0 (type s0@@0))))
 (=> (and (and (= (type s0@@0) (SeqType T@@16)) (= (type s1@@0) (SeqType T@@16))) (and (not (= s0@@0 (|Seq#Empty| T@@16))) (not (= s1@@0 (|Seq#Empty| T@@16))))) (= (|Seq#Length| (|Seq#Append| s0@@0 s1@@0)) (+ (|Seq#Length| s0@@0) (|Seq#Length| s1@@0)))))
 :qid |stdinbpl.411:18|
 :skolemid |26|
 :pattern ( (|Seq#Length| (|Seq#Append| s0@@0 s1@@0)))
)))
(assert (forall ((s@@6 T@U) (t T@U) (n@@19 Int) ) (! (let ((T@@17 (SeqTypeInv0 (type s@@6))))
 (=> (and (and (= (type s@@6) (SeqType T@@17)) (= (type t) (SeqType T@@17))) (and (> n@@19 0) (> n@@19 (|Seq#Length| s@@6)))) (and (= (|Seq#Add| (|Seq#Sub| n@@19 (|Seq#Length| s@@6)) (|Seq#Length| s@@6)) n@@19) (= (|Seq#Drop| (|Seq#Append| s@@6 t) n@@19) (|Seq#Drop| t (|Seq#Sub| n@@19 (|Seq#Length| s@@6)))))))
 :qid |stdinbpl.567:18|
 :skolemid |44|
 :pattern ( (|Seq#Drop| (|Seq#Append| s@@6 t) n@@19))
)))
(assert (forall ((Heap@@20 T@U) (xs@@18 T@U) (i@@11 Int) ) (!  (=> (and (= (type Heap@@20) (MapType0Type RefType)) (= (type xs@@18) (SeqType RefType))) (and (= (fun03 Heap@@20 xs@@18 i@@11) (|fun03'| Heap@@20 xs@@18 i@@11)) (dummyFunction (int_2_U (|fun03#triggerStateless| xs@@18 i@@11)))))
 :qid |stdinbpl.1051:15|
 :skolemid |84|
 :pattern ( (fun03 Heap@@20 xs@@18 i@@11))
)))
(assert (forall ((Heap@@21 T@U) (xs@@19 T@U) (j@@8 Int) ) (!  (=> (and (= (type Heap@@21) (MapType0Type RefType)) (= (type xs@@19) (SeqType RefType))) (and (= (fun07 Heap@@21 xs@@19 j@@8) (|fun07'| Heap@@21 xs@@19 j@@8)) (dummyFunction (int_2_U (|fun07#triggerStateless| xs@@19 j@@8)))))
 :qid |stdinbpl.1639:15|
 :skolemid |146|
 :pattern ( (fun07 Heap@@21 xs@@19 j@@8))
)))
(assert (forall ((Heap@@22 T@U) (xs@@20 T@U) (i@@12 Int) ) (!  (=> (and (= (type Heap@@22) (MapType0Type RefType)) (= (type xs@@20) (SeqType RefType))) (and (= (fun08 Heap@@22 xs@@20 i@@12) (|fun08'| Heap@@22 xs@@20 i@@12)) (dummyFunction (int_2_U (|fun08#triggerStateless| xs@@20 i@@12)))))
 :qid |stdinbpl.1949:15|
 :skolemid |175|
 :pattern ( (fun08 Heap@@22 xs@@20 i@@12))
)))
(assert (forall ((arg0@@39 T@U) ) (! (= (type (FrameFragment arg0@@39)) FrameTypeType)
 :qid |funType:FrameFragment|
 :pattern ( (FrameFragment arg0@@39))
)))
(assert (forall ((Heap@@23 T@U) (Mask@@10 T@U) (xs@@21 T@U) (j@@9 Int) ) (!  (=> (and (and (and (= (type Heap@@23) (MapType0Type RefType)) (= (type Mask@@10) (MapType1Type RefType realType))) (= (type xs@@21) (SeqType RefType))) (state Heap@@23 Mask@@10)) (= (|fun07'| Heap@@23 xs@@21 j@@9) (|fun07#frame| (FrameFragment (int_2_U (|fun07#condqp9| Heap@@23 xs@@21 j@@9))) xs@@21 j@@9)))
 :qid |stdinbpl.1659:15|
 :skolemid |150|
 :pattern ( (state Heap@@23 Mask@@10) (|fun07'| Heap@@23 xs@@21 j@@9))
)))
(assert (forall ((Heap@@24 T@U) (Mask@@11 T@U) (xs@@22 T@U) (i@@13 Int) ) (!  (=> (and (and (and (= (type Heap@@24) (MapType0Type RefType)) (= (type Mask@@11) (MapType1Type RefType realType))) (= (type xs@@22) (SeqType RefType))) (state Heap@@24 Mask@@11)) (= (|fun08'| Heap@@24 xs@@22 i@@13) (|fun08#frame| (FrameFragment (int_2_U (|fun08#condqp10| Heap@@24 xs@@22 i@@13))) xs@@22 i@@13)))
 :qid |stdinbpl.1969:15|
 :skolemid |179|
 :pattern ( (state Heap@@24 Mask@@11) (|fun08'| Heap@@24 xs@@22 i@@13))
)))
(assert (forall ((o_2@@1 T@U) (f_4@@1 T@U) ) (! (let ((B@@4 (FieldTypeInv1 (type f_4@@1))))
(let ((A@@5 (FieldTypeInv0 (type f_4@@1))))
 (=> (and (= (type o_2@@1) RefType) (= (type f_4@@1) (FieldType A@@5 B@@4))) (= (U_2_real (MapType1Select ZeroMask o_2@@1 f_4@@1)) NoPerm))))
 :qid |stdinbpl.106:22|
 :skolemid |13|
 :pattern ( (MapType1Select ZeroMask o_2@@1 f_4@@1))
)))
(assert (forall ((Heap@@25 T@U) (Mask@@12 T@U) (xs@@23 T@U) (n@@20 Int) (i@@14 Int) ) (!  (=> (and (and (and (= (type Heap@@25) (MapType0Type RefType)) (= (type Mask@@12) (MapType1Type RefType realType))) (= (type xs@@23) (SeqType RefType))) (state Heap@@25 Mask@@12)) (= (|fun06'| Heap@@25 xs@@23 n@@20 i@@14) (|fun06#frame| (MapType0Select Heap@@25 null (P02 xs@@23 n@@20)) xs@@23 n@@20 i@@14)))
 :qid |stdinbpl.1274:15|
 :skolemid |107|
 :pattern ( (state Heap@@25 Mask@@12) (|fun06'| Heap@@25 xs@@23 n@@20 i@@14))
)))
(assert (forall ((Heap@@26 T@U) (Mask@@13 T@U) (x@@17 T@U) (n@@21 Int) (i@@15 Int) ) (!  (=> (and (and (and (= (type Heap@@26) (MapType0Type RefType)) (= (type Mask@@13) (MapType1Type RefType realType))) (= (type x@@17) RefType)) (state Heap@@26 Mask@@13)) (= (|fun04'| Heap@@26 x@@17 n@@21 i@@15) (|fun04#frame| (MapType0Select Heap@@26 null (P01 x@@17 n@@21)) x@@17 n@@21 i@@15)))
 :qid |stdinbpl.1461:15|
 :skolemid |128|
 :pattern ( (state Heap@@26 Mask@@13) (|fun04'| Heap@@26 x@@17 n@@21 i@@15))
)))
(assert (forall ((s@@7 T@U) (t@@0 T@U) (n@@22 Int) ) (! (let ((T@@18 (SeqTypeInv0 (type s@@7))))
 (=> (and (and (= (type s@@7) (SeqType T@@18)) (= (type t@@0) (SeqType T@@18))) (and (> n@@22 0) (> n@@22 (|Seq#Length| s@@7)))) (and (= (|Seq#Add| (|Seq#Sub| n@@22 (|Seq#Length| s@@7)) (|Seq#Length| s@@7)) n@@22) (= (|Seq#Take| (|Seq#Append| s@@7 t@@0) n@@22) (|Seq#Append| s@@7 (|Seq#Take| t@@0 (|Seq#Sub| n@@22 (|Seq#Length| s@@7))))))))
 :qid |stdinbpl.554:18|
 :skolemid |42|
 :pattern ( (|Seq#Take| (|Seq#Append| s@@7 t@@0) n@@22))
)))
(assert (forall ((q@min@@1 Int) (q@max@@1 Int) ) (!  (and (=> (< q@min@@1 q@max@@1) (= (|Seq#Length| (|Seq#Range| q@min@@1 q@max@@1)) (- q@max@@1 q@min@@1))) (=> (<= q@max@@1 q@min@@1) (= (|Seq#Length| (|Seq#Range| q@min@@1 q@max@@1)) 0)))
 :qid |stdinbpl.732:15|
 :skolemid |55|
 :pattern ( (|Seq#Length| (|Seq#Range| q@min@@1 q@max@@1)))
)))
(assert (forall ((Heap2Heap@@4 T@U) (Heap1Heap@@4 T@U) (xs@@24 T@U) (n@@23 Int) ) (!  (=> (and (and (and (= (type Heap2Heap@@4) (MapType0Type RefType)) (= (type Heap1Heap@@4) (MapType0Type RefType))) (= (type xs@@24) (SeqType RefType))) (and (=  (and (and (<= 3 (|sk_P02#condqp6| (|P02#condqp6| Heap2Heap@@4 xs@@24 n@@23) (|P02#condqp6| Heap1Heap@@4 xs@@24 n@@23))) (< (|sk_P02#condqp6| (|P02#condqp6| Heap2Heap@@4 xs@@24 n@@23) (|P02#condqp6| Heap1Heap@@4 xs@@24 n@@23)) n@@23)) (< NoPerm FullPerm))  (and (and (<= 3 (|sk_P02#condqp6| (|P02#condqp6| Heap2Heap@@4 xs@@24 n@@23) (|P02#condqp6| Heap1Heap@@4 xs@@24 n@@23))) (< (|sk_P02#condqp6| (|P02#condqp6| Heap2Heap@@4 xs@@24 n@@23) (|P02#condqp6| Heap1Heap@@4 xs@@24 n@@23)) n@@23)) (< NoPerm FullPerm))) (=> (and (and (<= 3 (|sk_P02#condqp6| (|P02#condqp6| Heap2Heap@@4 xs@@24 n@@23) (|P02#condqp6| Heap1Heap@@4 xs@@24 n@@23))) (< (|sk_P02#condqp6| (|P02#condqp6| Heap2Heap@@4 xs@@24 n@@23) (|P02#condqp6| Heap1Heap@@4 xs@@24 n@@23)) n@@23)) (< NoPerm FullPerm)) (= (U_2_int (MapType0Select Heap2Heap@@4 (|Seq#Index| xs@@24 (|sk_P02#condqp6| (|P02#condqp6| Heap2Heap@@4 xs@@24 n@@23) (|P02#condqp6| Heap1Heap@@4 xs@@24 n@@23))) f_7)) (U_2_int (MapType0Select Heap1Heap@@4 (|Seq#Index| xs@@24 (|sk_P02#condqp6| (|P02#condqp6| Heap2Heap@@4 xs@@24 n@@23) (|P02#condqp6| Heap1Heap@@4 xs@@24 n@@23))) f_7)))))) (= (|P02#condqp6| Heap2Heap@@4 xs@@24 n@@23) (|P02#condqp6| Heap1Heap@@4 xs@@24 n@@23)))
 :qid |stdinbpl.2166:15|
 :skolemid |197|
 :pattern ( (|P02#condqp6| Heap2Heap@@4 xs@@24 n@@23) (|P02#condqp6| Heap1Heap@@4 xs@@24 n@@23) (succHeapTrans Heap2Heap@@4 Heap1Heap@@4))
)))
(assert (forall ((a T@U) (b T@U) ) (! (let ((T@@19 (SeqTypeInv0 (type a))))
 (=> (and (and (= (type a) (SeqType T@@19)) (= (type b) (SeqType T@@19))) (|Seq#Equal| a b)) (= a b)))
 :qid |stdinbpl.705:18|
 :skolemid |53|
 :pattern ( (|Seq#Equal| a b))
)))
(assert (forall ((Heap@@27 T@U) (xs@@25 T@U) (n@@24 Int) (i@@16 Int) ) (!  (=> (and (= (type Heap@@27) (MapType0Type RefType)) (= (type xs@@25) (SeqType RefType))) (and (= (fun06 Heap@@27 xs@@25 n@@24 i@@16) (|fun06'| Heap@@27 xs@@25 n@@24 i@@16)) (dummyFunction (int_2_U (|fun06#triggerStateless| xs@@25 n@@24 i@@16)))))
 :qid |stdinbpl.1257:15|
 :skolemid |104|
 :pattern ( (fun06 Heap@@27 xs@@25 n@@24 i@@16))
)))
(assert (forall ((Heap@@28 T@U) (x@@18 T@U) (n@@25 Int) (i@@17 Int) ) (!  (=> (and (= (type Heap@@28) (MapType0Type RefType)) (= (type x@@18) RefType)) (and (= (fun04 Heap@@28 x@@18 n@@25 i@@17) (|fun04'| Heap@@28 x@@18 n@@25 i@@17)) (dummyFunction (int_2_U (|fun04#triggerStateless| x@@18 n@@25 i@@17)))))
 :qid |stdinbpl.1444:15|
 :skolemid |125|
 :pattern ( (fun04 Heap@@28 x@@18 n@@25 i@@17))
)))
(assert (forall ((s@@8 T@U) (i@@18 Int) ) (! (let ((T@@20 (SeqTypeInv0 (type s@@8))))
 (=> (= (type s@@8) (SeqType T@@20)) (=> (and (<= 0 i@@18) (< i@@18 (|Seq#Length| s@@8))) (|Seq#ContainsTrigger| s@@8 (|Seq#Index| s@@8 i@@18)))))
 :qid |stdinbpl.598:18|
 :skolemid |49|
 :pattern ( (|Seq#Index| s@@8 i@@18))
)))
(assert (forall ((s0@@1 T@U) (s1@@1 T@U) ) (! (let ((T@@21 (SeqTypeInv0 (type s0@@1))))
 (=> (and (= (type s0@@1) (SeqType T@@21)) (= (type s1@@1) (SeqType T@@21))) (and (=> (= s0@@1 (|Seq#Empty| T@@21)) (= (|Seq#Append| s0@@1 s1@@1) s1@@1)) (=> (= s1@@1 (|Seq#Empty| T@@21)) (= (|Seq#Append| s0@@1 s1@@1) s0@@1)))))
 :qid |stdinbpl.417:18|
 :skolemid |27|
 :pattern ( (|Seq#Append| s0@@1 s1@@1))
)))
(assert (forall ((Heap@@29 T@U) (Mask@@14 T@U) (xs@@26 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@29) (MapType0Type RefType)) (= (type Mask@@14) (MapType1Type RefType realType))) (= (type xs@@26) (SeqType RefType))) (and (state Heap@@29 Mask@@14) (< AssumeFunctionsAbove 2))) (and (forall ((i@@19 Int) (j@@10 Int) ) (!  (=> (and (>= i@@19 0) (and (< i@@19 (|Seq#Length| xs@@26)) (and (>= j@@10 0) (and (< j@@10 (|Seq#Length| xs@@26)) (not (= i@@19 j@@10)))))) (not (= (|Seq#Index| xs@@26 i@@19) (|Seq#Index| xs@@26 j@@10))))
 :qid |stdinbpl.915:61|
 :skolemid |73|
 :pattern ( (|Seq#Index| xs@@26 i@@19) (|Seq#Index| xs@@26 j@@10))
)) (> (|Seq#Length| xs@@26) 3))) (= (fun02 Heap@@29 xs@@26) (+ (U_2_int (MapType0Select Heap@@29 (|Seq#Index| xs@@26 0) f_7)) (U_2_int (MapType0Select Heap@@29 (|Seq#Index| xs@@26 1) f_7)))))
 :qid |stdinbpl.913:15|
 :skolemid |74|
 :pattern ( (state Heap@@29 Mask@@14) (fun02 Heap@@29 xs@@26))
)))
(assert (forall ((t@@1 T@U) ) (! (= (|Seq#Index| (|Seq#Singleton| t@@1) 0) t@@1)
 :qid |stdinbpl.421:18|
 :skolemid |28|
 :pattern ( (|Seq#Singleton| t@@1))
)))
(assert (forall ((s@@9 T@U) ) (! (let ((T@@22 (SeqTypeInv0 (type s@@9))))
 (=> (= (type s@@9) (SeqType T@@22)) (<= 0 (|Seq#Length| s@@9))))
 :qid |stdinbpl.400:18|
 :skolemid |22|
 :pattern ( (|Seq#Length| s@@9))
)))
(assert (forall ((Heap@@30 T@U) (Mask@@15 T@U) (xs@@27 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@30) (MapType0Type RefType)) (= (type Mask@@15) (MapType1Type RefType realType))) (= (type xs@@27) (SeqType RefType))) (and (state Heap@@30 Mask@@15) (< AssumeFunctionsAbove 4))) (and (forall ((i@@20 Int) (j@@11 Int) ) (!  (=> (and (>= i@@20 0) (and (< i@@20 (|Seq#Length| xs@@27)) (and (>= j@@11 0) (and (< j@@11 (|Seq#Length| xs@@27)) (not (= i@@20 j@@11)))))) (not (= (|Seq#Index| xs@@27 i@@20) (|Seq#Index| xs@@27 j@@11))))
 :qid |stdinbpl.771:61|
 :skolemid |60|
 :pattern ( (|Seq#Index| xs@@27 i@@20) (|Seq#Index| xs@@27 j@@11))
)) (> (|Seq#Length| xs@@27) 3))) (= (fun01 Heap@@30 xs@@27) (U_2_int (MapType0Select Heap@@30 (|Seq#Index| xs@@27 0) f_7))))
 :qid |stdinbpl.769:15|
 :skolemid |61|
 :pattern ( (state Heap@@30 Mask@@15) (fun01 Heap@@30 xs@@27))
)))
(assert (forall ((xs@@28 T@U) (n@@26 Int) ) (!  (=> (= (type xs@@28) (SeqType RefType)) (= (getPredWandId (P02 xs@@28 n@@26)) 0))
 :qid |stdinbpl.2129:15|
 :skolemid |192|
 :pattern ( (P02 xs@@28 n@@26))
)))
(assert (forall ((x@@19 T@U) (n@@27 Int) ) (!  (=> (= (type x@@19) RefType) (= (getPredWandId (P01 x@@19 n@@27)) 1))
 :qid |stdinbpl.2315:15|
 :skolemid |213|
 :pattern ( (P01 x@@19 n@@27))
)))
(assert (forall ((s0@@2 T@U) (s1@@2 T@U) ) (! (let ((T@@23 (SeqTypeInv0 (type s0@@2))))
 (=> (and (and (= (type s0@@2) (SeqType T@@23)) (= (type s1@@2) (SeqType T@@23))) (|Seq#Equal| s0@@2 s1@@2)) (and (= (|Seq#Length| s0@@2) (|Seq#Length| s1@@2)) (forall ((j@@12 Int) ) (!  (=> (and (<= 0 j@@12) (< j@@12 (|Seq#Length| s0@@2))) (= (|Seq#Index| s0@@2 j@@12) (|Seq#Index| s1@@2 j@@12)))
 :qid |stdinbpl.695:13|
 :skolemid |50|
 :pattern ( (|Seq#Index| s0@@2 j@@12))
 :pattern ( (|Seq#Index| s1@@2 j@@12))
)))))
 :qid |stdinbpl.692:18|
 :skolemid |51|
 :pattern ( (|Seq#Equal| s0@@2 s1@@2))
)))
(assert (forall ((Heap@@31 T@U) (ExhaleHeap@@4 T@U) (Mask@@16 T@U) (pm_f@@1 T@U) ) (! (let ((C@@1 (FieldTypeInv0 (type pm_f@@1))))
 (=> (and (and (and (and (and (= (type Heap@@31) (MapType0Type RefType)) (= (type ExhaleHeap@@4) (MapType0Type RefType))) (= (type Mask@@16) (MapType1Type RefType realType))) (= (type pm_f@@1) (FieldType C@@1 FrameTypeType))) (IdenticalOnKnownLocations Heap@@31 ExhaleHeap@@4 Mask@@16)) (and (HasDirectPerm Mask@@16 null pm_f@@1) (IsPredicateField pm_f@@1))) (forall ((o2 T@U) (f_2@@0 T@U) ) (! (let ((B@@5 (FieldTypeInv1 (type f_2@@0))))
(let ((A@@6 (FieldTypeInv0 (type f_2@@0))))
 (=> (and (and (= (type o2) RefType) (= (type f_2@@0) (FieldType A@@6 B@@5))) (U_2_bool (MapType1Select (MapType0Select Heap@@31 null (PredicateMaskField pm_f@@1)) o2 f_2@@0))) (= (MapType0Select Heap@@31 o2 f_2@@0) (MapType0Select ExhaleHeap@@4 o2 f_2@@0)))))
 :qid |stdinbpl.54:134|
 :skolemid |3|
 :pattern ( (MapType0Select ExhaleHeap@@4 o2 f_2@@0))
))))
 :qid |stdinbpl.52:19|
 :skolemid |4|
 :pattern ( (IdenticalOnKnownLocations Heap@@31 ExhaleHeap@@4 Mask@@16) (IsPredicateField pm_f@@1))
)))
(assert (forall ((Heap@@32 T@U) (ExhaleHeap@@5 T@U) (Mask@@17 T@U) (pm_f@@2 T@U) ) (! (let ((C@@2 (FieldTypeInv0 (type pm_f@@2))))
 (=> (and (and (and (and (and (= (type Heap@@32) (MapType0Type RefType)) (= (type ExhaleHeap@@5) (MapType0Type RefType))) (= (type Mask@@17) (MapType1Type RefType realType))) (= (type pm_f@@2) (FieldType C@@2 FrameTypeType))) (IdenticalOnKnownLocations Heap@@32 ExhaleHeap@@5 Mask@@17)) (and (HasDirectPerm Mask@@17 null pm_f@@2) (IsWandField pm_f@@2))) (forall ((o2@@0 T@U) (f_2@@1 T@U) ) (! (let ((B@@6 (FieldTypeInv1 (type f_2@@1))))
(let ((A@@7 (FieldTypeInv0 (type f_2@@1))))
 (=> (and (and (= (type o2@@0) RefType) (= (type f_2@@1) (FieldType A@@7 B@@6))) (U_2_bool (MapType1Select (MapType0Select Heap@@32 null (WandMaskField pm_f@@2)) o2@@0 f_2@@1))) (= (MapType0Select Heap@@32 o2@@0 f_2@@1) (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1)))))
 :qid |stdinbpl.67:129|
 :skolemid |6|
 :pattern ( (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1))
))))
 :qid |stdinbpl.65:19|
 :skolemid |7|
 :pattern ( (IdenticalOnKnownLocations Heap@@32 ExhaleHeap@@5 Mask@@17) (IsWandField pm_f@@2))
)))
(assert (forall ((t@@2 T@U) ) (! (= (|Seq#Length| (|Seq#Singleton| t@@2)) 1)
 :qid |stdinbpl.408:18|
 :skolemid |25|
 :pattern ( (|Seq#Singleton| t@@2))
)))
(assert (forall ((Mask@@18 T@U) (o_2@@2 T@U) (f_4@@2 T@U) ) (! (let ((B@@7 (FieldTypeInv1 (type f_4@@2))))
(let ((A@@8 (FieldTypeInv0 (type f_4@@2))))
 (=> (and (and (and (= (type Mask@@18) (MapType1Type RefType realType)) (= (type o_2@@2) RefType)) (= (type f_4@@2) (FieldType A@@8 B@@7))) (GoodMask Mask@@18)) (and (>= (U_2_real (MapType1Select Mask@@18 o_2@@2 f_4@@2)) NoPerm) (=> (and (and (GoodMask Mask@@18) (not (IsPredicateField f_4@@2))) (not (IsWandField f_4@@2))) (<= (U_2_real (MapType1Select Mask@@18 o_2@@2 f_4@@2)) FullPerm))))))
 :qid |stdinbpl.128:22|
 :skolemid |16|
 :pattern ( (GoodMask Mask@@18) (MapType1Select Mask@@18 o_2@@2 f_4@@2))
)))
(assert (forall ((o T@U) (f T@U) (Heap@@33 T@U) ) (!  (=> (and (and (and (= (type o) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap@@33) (MapType0Type RefType))) (U_2_bool (MapType0Select Heap@@33 o $allocated))) (U_2_bool (MapType0Select Heap@@33 (MapType0Select Heap@@33 o f) $allocated)))
 :qid |stdinbpl.31:15|
 :skolemid |0|
 :pattern ( (MapType0Select Heap@@33 o f))
)))
(assert (forall ((xs@@29 T@U) (n@@28 Int) ) (!  (=> (= (type xs@@29) (SeqType RefType)) (= (PredicateMaskField (P02 xs@@29 n@@28)) (|P02#sm| xs@@29 n@@28)))
 :qid |stdinbpl.2121:15|
 :skolemid |190|
 :pattern ( (PredicateMaskField (P02 xs@@29 n@@28)))
)))
(assert (forall ((x@@20 T@U) (n@@29 Int) ) (!  (=> (= (type x@@20) RefType) (= (PredicateMaskField (P01 x@@20 n@@29)) (|P01#sm| x@@20 n@@29)))
 :qid |stdinbpl.2307:15|
 :skolemid |211|
 :pattern ( (PredicateMaskField (P01 x@@20 n@@29)))
)))
(assert (forall ((s@@10 T@U) (t@@3 T@U) (n@@30 Int) ) (! (let ((T@@24 (SeqTypeInv0 (type s@@10))))
 (=> (and (and (= (type s@@10) (SeqType T@@24)) (= (type t@@3) (SeqType T@@24))) (and (< 0 n@@30) (<= n@@30 (|Seq#Length| s@@10)))) (= (|Seq#Take| (|Seq#Append| s@@10 t@@3) n@@30) (|Seq#Take| s@@10 n@@30))))
 :qid |stdinbpl.550:18|
 :skolemid |41|
 :pattern ( (|Seq#Take| (|Seq#Append| s@@10 t@@3) n@@30))
)))
(assert (forall ((s@@11 T@U) (i@@21 Int) (v@@1 T@U) ) (! (let ((T@@25 (type v@@1)))
 (=> (= (type s@@11) (SeqType T@@25)) (=> (and (<= 0 i@@21) (< i@@21 (|Seq#Length| s@@11))) (= (|Seq#Length| (|Seq#Update| s@@11 i@@21 v@@1)) (|Seq#Length| s@@11)))))
 :qid |stdinbpl.449:18|
 :skolemid |34|
 :pattern ( (|Seq#Length| (|Seq#Update| s@@11 i@@21 v@@1)))
 :pattern ( (|Seq#Length| s@@11) (|Seq#Update| s@@11 i@@21 v@@1))
)))
(assert (forall ((Heap2Heap@@5 T@U) (Heap1Heap@@5 T@U) (x@@21 T@U) (n@@31 Int) ) (!  (=> (and (and (and (= (type Heap2Heap@@5) (MapType0Type RefType)) (= (type Heap1Heap@@5) (MapType0Type RefType))) (= (type x@@21) RefType)) (and (=  (and (and (<= 0 (|sk_P01#condqp7| (|P01#condqp7| Heap2Heap@@5 x@@21 n@@31) (|P01#condqp7| Heap1Heap@@5 x@@21 n@@31))) (< (|sk_P01#condqp7| (|P01#condqp7| Heap2Heap@@5 x@@21 n@@31) (|P01#condqp7| Heap1Heap@@5 x@@21 n@@31)) 3)) (< NoPerm FullPerm))  (and (and (<= 0 (|sk_P01#condqp7| (|P01#condqp7| Heap2Heap@@5 x@@21 n@@31) (|P01#condqp7| Heap1Heap@@5 x@@21 n@@31))) (< (|sk_P01#condqp7| (|P01#condqp7| Heap2Heap@@5 x@@21 n@@31) (|P01#condqp7| Heap1Heap@@5 x@@21 n@@31)) 3)) (< NoPerm FullPerm))) (=> (and (and (<= 0 (|sk_P01#condqp7| (|P01#condqp7| Heap2Heap@@5 x@@21 n@@31) (|P01#condqp7| Heap1Heap@@5 x@@21 n@@31))) (< (|sk_P01#condqp7| (|P01#condqp7| Heap2Heap@@5 x@@21 n@@31) (|P01#condqp7| Heap1Heap@@5 x@@21 n@@31)) 3)) (< NoPerm FullPerm)) (= (U_2_int (MapType0Select Heap2Heap@@5 (|Seq#Index| (MapType0Select Heap2Heap@@5 x@@21 ss) (|sk_P01#condqp7| (|P01#condqp7| Heap2Heap@@5 x@@21 n@@31) (|P01#condqp7| Heap1Heap@@5 x@@21 n@@31))) f_7)) (U_2_int (MapType0Select Heap1Heap@@5 (|Seq#Index| (MapType0Select Heap1Heap@@5 x@@21 ss) (|sk_P01#condqp7| (|P01#condqp7| Heap2Heap@@5 x@@21 n@@31) (|P01#condqp7| Heap1Heap@@5 x@@21 n@@31))) f_7)))))) (= (|P01#condqp7| Heap2Heap@@5 x@@21 n@@31) (|P01#condqp7| Heap1Heap@@5 x@@21 n@@31)))
 :qid |stdinbpl.2341:15|
 :skolemid |217|
 :pattern ( (|P01#condqp7| Heap2Heap@@5 x@@21 n@@31) (|P01#condqp7| Heap1Heap@@5 x@@21 n@@31) (succHeapTrans Heap2Heap@@5 Heap1Heap@@5))
)))
(assert (forall ((Heap@@34 T@U) (Mask@@19 T@U) (xs@@30 T@U) (j@@13 Int) ) (!  (=> (and (and (and (and (= (type Heap@@34) (MapType0Type RefType)) (= (type Mask@@19) (MapType1Type RefType realType))) (= (type xs@@30) (SeqType RefType))) (and (state Heap@@34 Mask@@19) (or (< AssumeFunctionsAbove 6) (|fun07#trigger| (FrameFragment (int_2_U (|fun07#condqp9| Heap@@34 xs@@30 j@@13))) xs@@30 j@@13)))) (forall ((k_1_1 Int) (i_3 Int) ) (!  (=> (and (>= k_1_1 0) (and (< k_1_1 (|Seq#Length| xs@@30)) (and (>= i_3 0) (and (< i_3 (|Seq#Length| xs@@30)) (not (= k_1_1 i_3)))))) (not (= (|Seq#Index| xs@@30 k_1_1) (|Seq#Index| xs@@30 i_3))))
 :qid |stdinbpl.1677:130|
 :skolemid |152|
 :pattern ( (|Seq#Index| xs@@30 k_1_1) (|Seq#Index| xs@@30 i_3))
))) (>= (|fun07'| Heap@@34 xs@@30 j@@13) 0))
 :qid |stdinbpl.1675:15|
 :skolemid |153|
 :pattern ( (state Heap@@34 Mask@@19) (|fun07'| Heap@@34 xs@@30 j@@13))
)))
(assert (forall ((s@@12 T@U) (t@@4 T@U) (n@@32 Int) ) (! (let ((T@@26 (SeqTypeInv0 (type s@@12))))
 (=> (and (and (= (type s@@12) (SeqType T@@26)) (= (type t@@4) (SeqType T@@26))) (and (< 0 n@@32) (<= n@@32 (|Seq#Length| s@@12)))) (= (|Seq#Drop| (|Seq#Append| s@@12 t@@4) n@@32) (|Seq#Append| (|Seq#Drop| s@@12 n@@32) t@@4))))
 :qid |stdinbpl.563:18|
 :skolemid |43|
 :pattern ( (|Seq#Drop| (|Seq#Append| s@@12 t@@4) n@@32))
)))
(assert (forall ((s@@13 T@U) (n@@33 Int) (i@@22 Int) ) (! (let ((T@@27 (SeqTypeInv0 (type s@@13))))
 (=> (= (type s@@13) (SeqType T@@27)) (=> (and (and (< 0 n@@33) (<= n@@33 i@@22)) (< i@@22 (|Seq#Length| s@@13))) (and (= (|Seq#Add| (|Seq#Sub| i@@22 n@@33) n@@33) i@@22) (= (|Seq#Index| (|Seq#Drop| s@@13 n@@33) (|Seq#Sub| i@@22 n@@33)) (|Seq#Index| s@@13 i@@22))))))
 :qid |stdinbpl.500:18|
 :skolemid |40|
 :pattern ( (|Seq#Drop| s@@13 n@@33) (|Seq#Index| s@@13 i@@22))
)))
(assert (forall ((Heap@@35 T@U) (Mask@@20 T@U) (xs@@31 T@U) ) (!  (=> (and (and (and (= (type Heap@@35) (MapType0Type RefType)) (= (type Mask@@20) (MapType1Type RefType realType))) (= (type xs@@31) (SeqType RefType))) (state Heap@@35 Mask@@20)) (= (|fun01'| Heap@@35 xs@@31) (|fun01#frame| (FrameFragment (int_2_U (|fun01#condqp1| Heap@@35 xs@@31))) xs@@31)))
 :qid |stdinbpl.779:15|
 :skolemid |62|
 :pattern ( (state Heap@@35 Mask@@20) (|fun01'| Heap@@35 xs@@31))
)))
(assert (forall ((Heap@@36 T@U) (Mask@@21 T@U) (xs@@32 T@U) ) (!  (=> (and (and (and (= (type Heap@@36) (MapType0Type RefType)) (= (type Mask@@21) (MapType1Type RefType realType))) (= (type xs@@32) (SeqType RefType))) (state Heap@@36 Mask@@21)) (= (|fun02'| Heap@@36 xs@@32) (|fun02#frame| (FrameFragment (int_2_U (|fun02#condqp2| Heap@@36 xs@@32))) xs@@32)))
 :qid |stdinbpl.923:15|
 :skolemid |75|
 :pattern ( (state Heap@@36 Mask@@21) (|fun02'| Heap@@36 xs@@32))
)))
(assert (forall ((s0@@3 T@U) (s1@@3 T@U) (n@@34 Int) ) (! (let ((T@@28 (SeqTypeInv0 (type s0@@3))))
 (=> (and (= (type s0@@3) (SeqType T@@28)) (= (type s1@@3) (SeqType T@@28))) (=> (and (and (and (not (= s0@@3 (|Seq#Empty| T@@28))) (not (= s1@@3 (|Seq#Empty| T@@28)))) (<= 0 n@@34)) (< n@@34 (|Seq#Length| s0@@3))) (= (|Seq#Index| (|Seq#Append| s0@@3 s1@@3) n@@34) (|Seq#Index| s0@@3 n@@34)))))
 :qid |stdinbpl.440:18|
 :skolemid |31|
 :pattern ( (|Seq#Index| (|Seq#Append| s0@@3 s1@@3) n@@34))
 :pattern ( (|Seq#Index| s0@@3 n@@34) (|Seq#Append| s0@@3 s1@@3))
)))
(assert (forall ((Heap@@37 T@U) (o@@0 T@U) (f_3 T@U) (v@@2 T@U) ) (! (let ((B@@8 (type v@@2)))
(let ((A@@9 (FieldTypeInv0 (type f_3))))
 (=> (and (and (= (type Heap@@37) (MapType0Type RefType)) (= (type o@@0) RefType)) (= (type f_3) (FieldType A@@9 B@@8))) (succHeap Heap@@37 (MapType0Store Heap@@37 o@@0 f_3 v@@2)))))
 :qid |stdinbpl.78:22|
 :skolemid |9|
 :pattern ( (MapType0Store Heap@@37 o@@0 f_3 v@@2))
)))
(assert (forall ((Heap2Heap@@6 T@U) (Heap1Heap@@6 T@U) (xs@@33 T@U) (i@@23 Int) ) (!  (=> (and (and (and (= (type Heap2Heap@@6) (MapType0Type RefType)) (= (type Heap1Heap@@6) (MapType0Type RefType))) (= (type xs@@33) (SeqType RefType))) (and (=  (and (and (<= 3 (|sk_fun03#condqp4| (|fun03#condqp4| Heap2Heap@@6 xs@@33 i@@23) (|fun03#condqp4| Heap1Heap@@6 xs@@33 i@@23))) (< (|sk_fun03#condqp4| (|fun03#condqp4| Heap2Heap@@6 xs@@33 i@@23) (|fun03#condqp4| Heap1Heap@@6 xs@@33 i@@23)) (|Seq#Length| xs@@33))) (< NoPerm FullPerm))  (and (and (<= 3 (|sk_fun03#condqp4| (|fun03#condqp4| Heap2Heap@@6 xs@@33 i@@23) (|fun03#condqp4| Heap1Heap@@6 xs@@33 i@@23))) (< (|sk_fun03#condqp4| (|fun03#condqp4| Heap2Heap@@6 xs@@33 i@@23) (|fun03#condqp4| Heap1Heap@@6 xs@@33 i@@23)) (|Seq#Length| xs@@33))) (< NoPerm FullPerm))) (=> (and (and (<= 3 (|sk_fun03#condqp4| (|fun03#condqp4| Heap2Heap@@6 xs@@33 i@@23) (|fun03#condqp4| Heap1Heap@@6 xs@@33 i@@23))) (< (|sk_fun03#condqp4| (|fun03#condqp4| Heap2Heap@@6 xs@@33 i@@23) (|fun03#condqp4| Heap1Heap@@6 xs@@33 i@@23)) (|Seq#Length| xs@@33))) (< NoPerm FullPerm)) (= (U_2_int (MapType0Select Heap2Heap@@6 (|Seq#Index| xs@@33 (|sk_fun03#condqp4| (|fun03#condqp4| Heap2Heap@@6 xs@@33 i@@23) (|fun03#condqp4| Heap1Heap@@6 xs@@33 i@@23))) f_7)) (U_2_int (MapType0Select Heap1Heap@@6 (|Seq#Index| xs@@33 (|sk_fun03#condqp4| (|fun03#condqp4| Heap2Heap@@6 xs@@33 i@@23) (|fun03#condqp4| Heap1Heap@@6 xs@@33 i@@23))) f_7)))))) (= (|fun03#condqp4| Heap2Heap@@6 xs@@33 i@@23) (|fun03#condqp4| Heap1Heap@@6 xs@@33 i@@23)))
 :qid |stdinbpl.1091:15|
 :skolemid |90|
 :pattern ( (|fun03#condqp4| Heap2Heap@@6 xs@@33 i@@23) (|fun03#condqp4| Heap1Heap@@6 xs@@33 i@@23) (succHeapTrans Heap2Heap@@6 Heap1Heap@@6))
)))
(assert (forall ((s0@@4 T@U) (s1@@4 T@U) (m@@7 Int) ) (! (let ((T@@29 (SeqTypeInv0 (type s0@@4))))
 (=> (and (= (type s0@@4) (SeqType T@@29)) (= (type s1@@4) (SeqType T@@29))) (=> (and (and (and (not (= s0@@4 (|Seq#Empty| T@@29))) (not (= s1@@4 (|Seq#Empty| T@@29)))) (<= 0 m@@7)) (< m@@7 (|Seq#Length| s1@@4))) (and (= (|Seq#Sub| (|Seq#Add| m@@7 (|Seq#Length| s0@@4)) (|Seq#Length| s0@@4)) m@@7) (= (|Seq#Index| (|Seq#Append| s0@@4 s1@@4) (|Seq#Add| m@@7 (|Seq#Length| s0@@4))) (|Seq#Index| s1@@4 m@@7))))))
 :qid |stdinbpl.445:18|
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
(assert (forall ((Heap@@38 T@U) (Mask@@22 T@U) (xs@@34 T@U) (j@@14 Int) ) (!  (=> (and (and (and (and (= (type Heap@@38) (MapType0Type RefType)) (= (type Mask@@22) (MapType1Type RefType realType))) (= (type xs@@34) (SeqType RefType))) (and (state Heap@@38 Mask@@22) (< AssumeFunctionsAbove 6))) (forall ((k@@1 Int) (i@@24 Int) ) (!  (=> (and (>= k@@1 0) (and (< k@@1 (|Seq#Length| xs@@34)) (and (>= i@@24 0) (and (< i@@24 (|Seq#Length| xs@@34)) (not (= k@@1 i@@24)))))) (not (= (|Seq#Index| xs@@34 k@@1) (|Seq#Index| xs@@34 i@@24))))
 :qid |stdinbpl.1651:61|
 :skolemid |148|
 :pattern ( (|Seq#Index| xs@@34 k@@1) (|Seq#Index| xs@@34 i@@24))
))) (= (fun07 Heap@@38 xs@@34 j@@14) (ite (< j@@14 0) (|fun07'| Heap@@38 xs@@34 (+ j@@14 1)) (ite (<= (|Seq#Length| xs@@34) j@@14) (|fun07'| Heap@@38 xs@@34 (- j@@14 1)) (* (U_2_int (MapType0Select Heap@@38 (|Seq#Index| xs@@34 j@@14) f_7)) (U_2_int (MapType0Select Heap@@38 (|Seq#Index| xs@@34 j@@14) f_7)))))))
 :qid |stdinbpl.1649:15|
 :skolemid |149|
 :pattern ( (state Heap@@38 Mask@@22) (fun07 Heap@@38 xs@@34 j@@14))
)))
(assert (forall ((s@@14 T@U) (x@@22 T@U) (i@@25 Int) ) (! (let ((T@@30 (type x@@22)))
 (=> (= (type s@@14) (SeqType T@@30)) (=> (and (and (<= 0 i@@25) (< i@@25 (|Seq#Length| s@@14))) (= (|Seq#Index| s@@14 i@@25) x@@22)) (|Seq#Contains| s@@14 x@@22))))
 :qid |stdinbpl.596:18|
 :skolemid |48|
 :pattern ( (|Seq#Contains| s@@14 x@@22) (|Seq#Index| s@@14 i@@25))
)))
(assert (forall ((s0@@5 T@U) (s1@@5 T@U) ) (! (let ((T@@31 (SeqTypeInv0 (type s0@@5))))
 (=> (and (= (type s0@@5) (SeqType T@@31)) (= (type s1@@5) (SeqType T@@31))) (or (or (and (= s0@@5 s1@@5) (|Seq#Equal| s0@@5 s1@@5)) (and (and (not (= s0@@5 s1@@5)) (not (|Seq#Equal| s0@@5 s1@@5))) (not (= (|Seq#Length| s0@@5) (|Seq#Length| s1@@5))))) (and (and (and (and (and (and (not (= s0@@5 s1@@5)) (not (|Seq#Equal| s0@@5 s1@@5))) (= (|Seq#Length| s0@@5) (|Seq#Length| s1@@5))) (= (|Seq#SkolemDiff| s0@@5 s1@@5) (|Seq#SkolemDiff| s1@@5 s0@@5))) (<= 0 (|Seq#SkolemDiff| s0@@5 s1@@5))) (< (|Seq#SkolemDiff| s0@@5 s1@@5) (|Seq#Length| s0@@5))) (not (= (|Seq#Index| s0@@5 (|Seq#SkolemDiff| s0@@5 s1@@5)) (|Seq#Index| s1@@5 (|Seq#SkolemDiff| s0@@5 s1@@5))))))))
 :qid |stdinbpl.700:18|
 :skolemid |52|
 :pattern ( (|Seq#Equal| s0@@5 s1@@5))
)))
(assert (forall ((p@@1 T@U) (v_1@@0 T@U) (q T@U) (w@@0 T@U) (r T@U) (u T@U) ) (! (let ((C@@3 (FieldTypeInv0 (type r))))
(let ((B@@10 (FieldTypeInv0 (type q))))
(let ((A@@11 (FieldTypeInv0 (type p@@1))))
 (=> (and (and (and (and (and (and (= (type p@@1) (FieldType A@@11 FrameTypeType)) (= (type v_1@@0) FrameTypeType)) (= (type q) (FieldType B@@10 FrameTypeType))) (= (type w@@0) FrameTypeType)) (= (type r) (FieldType C@@3 FrameTypeType))) (= (type u) FrameTypeType)) (and (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))) (InsidePredicate p@@1 v_1@@0 r u)))))
 :qid |stdinbpl.369:25|
 :skolemid |20|
 :pattern ( (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))
)))
(assert (forall ((s@@15 T@U) ) (! (let ((T@@32 (SeqTypeInv0 (type s@@15))))
 (=> (and (= (type s@@15) (SeqType T@@32)) (= (|Seq#Length| s@@15) 0)) (= s@@15 (|Seq#Empty| T@@32))))
 :qid |stdinbpl.404:18|
 :skolemid |24|
 :pattern ( (|Seq#Length| s@@15))
)))
(assert (forall ((s@@16 T@U) (n@@35 Int) ) (! (let ((T@@33 (SeqTypeInv0 (type s@@16))))
 (=> (and (= (type s@@16) (SeqType T@@33)) (<= n@@35 0)) (= (|Seq#Take| s@@16 n@@35) (|Seq#Empty| T@@33))))
 :qid |stdinbpl.579:18|
 :skolemid |46|
 :pattern ( (|Seq#Take| s@@16 n@@35))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
(assert (forall ((Heap2Heap@@7 T@U) (Heap1Heap@@7 T@U) (xs@@35 T@U) (i@@26 Int) ) (!  (=> (and (and (and (= (type Heap2Heap@@7) (MapType0Type RefType)) (= (type Heap1Heap@@7) (MapType0Type RefType))) (= (type xs@@35) (SeqType RefType))) (and (=  (and (and (<= 0 (|sk_fun03#condqp3| (|fun03#condqp3| Heap2Heap@@7 xs@@35 i@@26) (|fun03#condqp3| Heap1Heap@@7 xs@@35 i@@26))) (< (|sk_fun03#condqp3| (|fun03#condqp3| Heap2Heap@@7 xs@@35 i@@26) (|fun03#condqp3| Heap1Heap@@7 xs@@35 i@@26)) 3)) (< NoPerm FullPerm))  (and (and (<= 0 (|sk_fun03#condqp3| (|fun03#condqp3| Heap2Heap@@7 xs@@35 i@@26) (|fun03#condqp3| Heap1Heap@@7 xs@@35 i@@26))) (< (|sk_fun03#condqp3| (|fun03#condqp3| Heap2Heap@@7 xs@@35 i@@26) (|fun03#condqp3| Heap1Heap@@7 xs@@35 i@@26)) 3)) (< NoPerm FullPerm))) (=> (and (and (<= 0 (|sk_fun03#condqp3| (|fun03#condqp3| Heap2Heap@@7 xs@@35 i@@26) (|fun03#condqp3| Heap1Heap@@7 xs@@35 i@@26))) (< (|sk_fun03#condqp3| (|fun03#condqp3| Heap2Heap@@7 xs@@35 i@@26) (|fun03#condqp3| Heap1Heap@@7 xs@@35 i@@26)) 3)) (< NoPerm FullPerm)) (= (U_2_int (MapType0Select Heap2Heap@@7 (|Seq#Index| xs@@35 (|sk_fun03#condqp3| (|fun03#condqp3| Heap2Heap@@7 xs@@35 i@@26) (|fun03#condqp3| Heap1Heap@@7 xs@@35 i@@26))) f_7)) (U_2_int (MapType0Select Heap1Heap@@7 (|Seq#Index| xs@@35 (|sk_fun03#condqp3| (|fun03#condqp3| Heap2Heap@@7 xs@@35 i@@26) (|fun03#condqp3| Heap1Heap@@7 xs@@35 i@@26))) f_7)))))) (= (|fun03#condqp3| Heap2Heap@@7 xs@@35 i@@26) (|fun03#condqp3| Heap1Heap@@7 xs@@35 i@@26)))
 :qid |stdinbpl.1081:15|
 :skolemid |89|
 :pattern ( (|fun03#condqp3| Heap2Heap@@7 xs@@35 i@@26) (|fun03#condqp3| Heap1Heap@@7 xs@@35 i@@26) (succHeapTrans Heap2Heap@@7 Heap1Heap@@7))
)))
(assert (forall ((Heap2Heap@@8 T@U) (Heap1Heap@@8 T@U) (xs@@36 T@U) (n@@36 Int) ) (!  (=> (and (and (and (= (type Heap2Heap@@8) (MapType0Type RefType)) (= (type Heap1Heap@@8) (MapType0Type RefType))) (= (type xs@@36) (SeqType RefType))) (and (=  (and (and (<= 0 (|sk_P02#condqp5| (|P02#condqp5| Heap2Heap@@8 xs@@36 n@@36) (|P02#condqp5| Heap1Heap@@8 xs@@36 n@@36))) (< (|sk_P02#condqp5| (|P02#condqp5| Heap2Heap@@8 xs@@36 n@@36) (|P02#condqp5| Heap1Heap@@8 xs@@36 n@@36)) 3)) (< NoPerm FullPerm))  (and (and (<= 0 (|sk_P02#condqp5| (|P02#condqp5| Heap2Heap@@8 xs@@36 n@@36) (|P02#condqp5| Heap1Heap@@8 xs@@36 n@@36))) (< (|sk_P02#condqp5| (|P02#condqp5| Heap2Heap@@8 xs@@36 n@@36) (|P02#condqp5| Heap1Heap@@8 xs@@36 n@@36)) 3)) (< NoPerm FullPerm))) (=> (and (and (<= 0 (|sk_P02#condqp5| (|P02#condqp5| Heap2Heap@@8 xs@@36 n@@36) (|P02#condqp5| Heap1Heap@@8 xs@@36 n@@36))) (< (|sk_P02#condqp5| (|P02#condqp5| Heap2Heap@@8 xs@@36 n@@36) (|P02#condqp5| Heap1Heap@@8 xs@@36 n@@36)) 3)) (< NoPerm FullPerm)) (= (U_2_int (MapType0Select Heap2Heap@@8 (|Seq#Index| xs@@36 (|sk_P02#condqp5| (|P02#condqp5| Heap2Heap@@8 xs@@36 n@@36) (|P02#condqp5| Heap1Heap@@8 xs@@36 n@@36))) f_7)) (U_2_int (MapType0Select Heap1Heap@@8 (|Seq#Index| xs@@36 (|sk_P02#condqp5| (|P02#condqp5| Heap2Heap@@8 xs@@36 n@@36) (|P02#condqp5| Heap1Heap@@8 xs@@36 n@@36))) f_7)))))) (= (|P02#condqp5| Heap2Heap@@8 xs@@36 n@@36) (|P02#condqp5| Heap1Heap@@8 xs@@36 n@@36)))
 :qid |stdinbpl.2155:15|
 :skolemid |196|
 :pattern ( (|P02#condqp5| Heap2Heap@@8 xs@@36 n@@36) (|P02#condqp5| Heap1Heap@@8 xs@@36 n@@36) (succHeapTrans Heap2Heap@@8 Heap1Heap@@8))
)))
(assert (forall ((arg0@@40 T@U) (arg1@@20 T@U) ) (! (= (type (CombineFrames arg0@@40 arg1@@20)) FrameTypeType)
 :qid |funType:CombineFrames|
 :pattern ( (CombineFrames arg0@@40 arg1@@20))
)))
(assert (forall ((Heap@@39 T@U) (Mask@@23 T@U) (xs@@37 T@U) (i@@27 Int) ) (!  (=> (and (and (and (= (type Heap@@39) (MapType0Type RefType)) (= (type Mask@@23) (MapType1Type RefType realType))) (= (type xs@@37) (SeqType RefType))) (state Heap@@39 Mask@@23)) (= (|fun03'| Heap@@39 xs@@37 i@@27) (|fun03#frame| (CombineFrames (FrameFragment (int_2_U (|fun03#condqp3| Heap@@39 xs@@37 i@@27))) (FrameFragment (int_2_U (|fun03#condqp4| Heap@@39 xs@@37 i@@27)))) xs@@37 i@@27)))
 :qid |stdinbpl.1071:15|
 :skolemid |88|
 :pattern ( (state Heap@@39 Mask@@23) (|fun03'| Heap@@39 xs@@37 i@@27))
)))
(assert (forall ((Heap@@40 T@U) (Mask@@24 T@U) (xs@@38 T@U) (i@@28 Int) ) (!  (=> (and (and (and (and (= (type Heap@@40) (MapType0Type RefType)) (= (type Mask@@24) (MapType1Type RefType realType))) (= (type xs@@38) (SeqType RefType))) (and (state Heap@@40 Mask@@24) (or (< AssumeFunctionsAbove 0) (|fun08#trigger| (FrameFragment (int_2_U (|fun08#condqp10| Heap@@40 xs@@38 i@@28))) xs@@38 i@@28)))) (and (forall ((k_1_1@@0 Int) (j_3 Int) ) (!  (=> (and (>= k_1_1@@0 0) (and (< k_1_1@@0 (|Seq#Length| xs@@38)) (and (>= j_3 0) (and (< j_3 (|Seq#Length| xs@@38)) (not (= k_1_1@@0 j_3)))))) (not (= (|Seq#Index| xs@@38 k_1_1@@0) (|Seq#Index| xs@@38 j_3))))
 :qid |stdinbpl.1987:131|
 :skolemid |181|
 :pattern ( (|Seq#Index| xs@@38 k_1_1@@0) (|Seq#Index| xs@@38 j_3))
)) (and (<= 0 i@@28) (< i@@28 (|Seq#Length| xs@@38))))) (> (|fun08'| Heap@@40 xs@@38 i@@28) (U_2_int (MapType0Select Heap@@40 (|Seq#Index| xs@@38 i@@28) f_7))))
 :qid |stdinbpl.1985:15|
 :skolemid |182|
 :pattern ( (state Heap@@40 Mask@@24) (|fun08'| Heap@@40 xs@@38 i@@28))
)))
(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun j_28 () Int)
(declare-fun n@@37 () Int)
(declare-fun QPMask@0 () T@U)
(declare-fun x@@23 () T@U)
(declare-fun Heap@@41 () T@U)
(declare-fun qpRange15 (T@U) Bool)
(declare-fun invRecv15 (T@U) Int)
(declare-fun Mask@0 () T@U)
(declare-fun j_27 () Int)
(declare-fun k_8 () Int)
(declare-fun j_26 () Int)
(assert  (and (and (and (= (type Heap@@41) (MapType0Type RefType)) (= (type x@@23) RefType)) (= (type Mask@0) (MapType1Type RefType realType))) (= (type QPMask@0) (MapType1Type RefType realType))))
(set-info :boogie-vc-id |P01#definedness|)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 37) (let ((anon15_correct true))
(let ((anon25_Else_correct  (=> (and (not (and (<= 3 j_28) (< j_28 n@@37))) (= (ControlFlow 0 31) 26)) anon15_correct)))
(let ((anon25_Then_correct  (=> (and (<= 3 j_28) (< j_28 n@@37)) (and (=> (= (ControlFlow 0 27) (- 0 30)) (HasDirectPerm QPMask@0 x@@23 ss)) (=> (HasDirectPerm QPMask@0 x@@23 ss) (and (=> (= (ControlFlow 0 27) (- 0 29)) (>= j_28 0)) (=> (>= j_28 0) (and (=> (= (ControlFlow 0 27) (- 0 28)) (< j_28 (|Seq#Length| (MapType0Select Heap@@41 x@@23 ss)))) (=> (< j_28 (|Seq#Length| (MapType0Select Heap@@41 x@@23 ss))) (=> (= (ControlFlow 0 27) 26) anon15_correct))))))))))
(let ((anon24_Else_correct  (=> (= (ControlFlow 0 25) (- 0 24)) (forall ((j_7 Int) (j_7_1 Int) ) (!  (=> (and (and (and (and (not (= j_7 j_7_1)) (and (<= 3 j_7) (< j_7 n@@37))) (and (<= 3 j_7_1) (< j_7_1 n@@37))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| (MapType0Select Heap@@41 x@@23 ss) j_7) (|Seq#Index| (MapType0Select Heap@@41 x@@23 ss) j_7_1))))
 :qid |stdinbpl.2479:15|
 :skolemid |226|
)))))
(let ((anon22_Else_correct  (and (=> (= (ControlFlow 0 32) (- 0 33)) (forall ((j_5 Int) (j_5_1 Int) ) (!  (=> (and (and (and (and (not (= j_5 j_5_1)) (and (<= 0 j_5) (< j_5 3))) (and (<= 0 j_5_1) (< j_5_1 3))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| (MapType0Select Heap@@41 x@@23 ss) j_5) (|Seq#Index| (MapType0Select Heap@@41 x@@23 ss) j_5_1))))
 :qid |stdinbpl.2432:15|
 :skolemid |220|
))) (=> (forall ((j_5@@0 Int) (j_5_1@@0 Int) ) (!  (=> (and (and (and (and (not (= j_5@@0 j_5_1@@0)) (and (<= 0 j_5@@0) (< j_5@@0 3))) (and (<= 0 j_5_1@@0) (< j_5_1@@0 3))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| (MapType0Select Heap@@41 x@@23 ss) j_5@@0) (|Seq#Index| (MapType0Select Heap@@41 x@@23 ss) j_5_1@@0))))
 :qid |stdinbpl.2432:15|
 :skolemid |220|
)) (=> (and (forall ((j_5@@1 Int) ) (!  (=> (and (and (<= 0 j_5@@1) (< j_5@@1 3)) (< NoPerm FullPerm)) (and (qpRange15 (|Seq#Index| (MapType0Select Heap@@41 x@@23 ss) j_5@@1)) (= (invRecv15 (|Seq#Index| (MapType0Select Heap@@41 x@@23 ss) j_5@@1)) j_5@@1)))
 :qid |stdinbpl.2438:22|
 :skolemid |221|
 :pattern ( (|Seq#Index| (MapType0Select Heap@@41 x@@23 ss) j_5@@1))
 :pattern ( (|Seq#Index| (MapType0Select Heap@@41 x@@23 ss) j_5@@1))
)) (forall ((o_3 T@U) ) (!  (=> (= (type o_3) RefType) (=> (and (and (and (<= 0 (invRecv15 o_3)) (< (invRecv15 o_3) 3)) (< NoPerm FullPerm)) (qpRange15 o_3)) (= (|Seq#Index| (MapType0Select Heap@@41 x@@23 ss) (invRecv15 o_3)) o_3)))
 :qid |stdinbpl.2442:22|
 :skolemid |222|
 :pattern ( (invRecv15 o_3))
))) (=> (and (and (forall ((j_5@@2 Int) ) (!  (=> (and (<= 0 j_5@@2) (< j_5@@2 3)) (not (= (|Seq#Index| (MapType0Select Heap@@41 x@@23 ss) j_5@@2) null)))
 :qid |stdinbpl.2448:22|
 :skolemid |223|
 :pattern ( (|Seq#Index| (MapType0Select Heap@@41 x@@23 ss) j_5@@2))
 :pattern ( (|Seq#Index| (MapType0Select Heap@@41 x@@23 ss) j_5@@2))
)) (forall ((o_3@@0 T@U) ) (!  (=> (= (type o_3@@0) RefType) (and (=> (and (and (and (<= 0 (invRecv15 o_3@@0)) (< (invRecv15 o_3@@0) 3)) (< NoPerm FullPerm)) (qpRange15 o_3@@0)) (and (=> (< NoPerm FullPerm) (= (|Seq#Index| (MapType0Select Heap@@41 x@@23 ss) (invRecv15 o_3@@0)) o_3@@0)) (= (U_2_real (MapType1Select QPMask@0 o_3@@0 f_7)) (+ (U_2_real (MapType1Select Mask@0 o_3@@0 f_7)) FullPerm)))) (=> (not (and (and (and (<= 0 (invRecv15 o_3@@0)) (< (invRecv15 o_3@@0) 3)) (< NoPerm FullPerm)) (qpRange15 o_3@@0))) (= (U_2_real (MapType1Select QPMask@0 o_3@@0 f_7)) (U_2_real (MapType1Select Mask@0 o_3@@0 f_7))))))
 :qid |stdinbpl.2454:22|
 :skolemid |224|
 :pattern ( (MapType1Select QPMask@0 o_3@@0 f_7))
))) (and (forall ((o_3@@1 T@U) (f_5 T@U) ) (! (let ((B@@11 (FieldTypeInv1 (type f_5))))
(let ((A@@12 (FieldTypeInv0 (type f_5))))
 (=> (and (and (= (type o_3@@1) RefType) (= (type f_5) (FieldType A@@12 B@@11))) (not (= f_5 f_7))) (= (U_2_real (MapType1Select Mask@0 o_3@@1 f_5)) (U_2_real (MapType1Select QPMask@0 o_3@@1 f_5))))))
 :qid |stdinbpl.2458:29|
 :skolemid |225|
 :pattern ( (MapType1Select Mask@0 o_3@@1 f_5))
 :pattern ( (MapType1Select QPMask@0 o_3@@1 f_5))
)) (state Heap@@41 QPMask@0))) (and (and (=> (= (ControlFlow 0 32) 25) anon24_Else_correct) (=> (= (ControlFlow 0 32) 27) anon25_Then_correct)) (=> (= (ControlFlow 0 32) 31) anon25_Else_correct))))))))
(let ((anon11_correct true))
(let ((anon23_Else_correct  (=> (and (not (and (<= 0 j_27) (< j_27 3))) (= (ControlFlow 0 23) 18)) anon11_correct)))
(let ((anon23_Then_correct  (=> (and (<= 0 j_27) (< j_27 3)) (and (=> (= (ControlFlow 0 19) (- 0 22)) (HasDirectPerm Mask@0 x@@23 ss)) (=> (HasDirectPerm Mask@0 x@@23 ss) (and (=> (= (ControlFlow 0 19) (- 0 21)) (>= j_27 0)) (=> (>= j_27 0) (and (=> (= (ControlFlow 0 19) (- 0 20)) (< j_27 (|Seq#Length| (MapType0Select Heap@@41 x@@23 ss)))) (=> (< j_27 (|Seq#Length| (MapType0Select Heap@@41 x@@23 ss))) (=> (= (ControlFlow 0 19) 18) anon11_correct))))))))))
(let ((anon17_Else_correct  (=> (forall ((k_1_1@@1 Int) (j_3@@0 Int) ) (!  (=> (and (>= k_1_1@@1 0) (and (< k_1_1@@1 (|Seq#Length| (MapType0Select Heap@@41 x@@23 ss))) (and (>= j_3@@0 0) (and (< j_3@@0 (|Seq#Length| (MapType0Select Heap@@41 x@@23 ss))) (not (= k_1_1@@1 j_3@@0)))))) (not (= (|Seq#Index| (MapType0Select Heap@@41 x@@23 ss) k_1_1@@1) (|Seq#Index| (MapType0Select Heap@@41 x@@23 ss) j_3@@0))))
 :qid |stdinbpl.2413:20|
 :skolemid |219|
 :pattern ( (|Seq#Index| (MapType0Select Heap@@41 x@@23 ss) k_1_1@@1) (|Seq#Index| (MapType0Select Heap@@41 x@@23 ss) j_3@@0))
)) (and (and (=> (= (ControlFlow 0 34) 32) anon22_Else_correct) (=> (= (ControlFlow 0 34) 19) anon23_Then_correct)) (=> (= (ControlFlow 0 34) 23) anon23_Else_correct)))))
(let ((anon7_correct true))
(let ((anon21_Else_correct  (=> (and (not (and (>= k_8 0) (and (< k_8 (|Seq#Length| (MapType0Select Heap@@41 x@@23 ss))) (and (>= j_26 0) (and (< j_26 (|Seq#Length| (MapType0Select Heap@@41 x@@23 ss))) (not (= k_8 j_26))))))) (= (ControlFlow 0 9) 1)) anon7_correct)))
(let ((anon21_Then_correct  (=> (and (>= k_8 0) (and (< k_8 (|Seq#Length| (MapType0Select Heap@@41 x@@23 ss))) (and (>= j_26 0) (and (< j_26 (|Seq#Length| (MapType0Select Heap@@41 x@@23 ss))) (not (= k_8 j_26)))))) (and (=> (= (ControlFlow 0 2) (- 0 8)) (HasDirectPerm Mask@0 x@@23 ss)) (=> (HasDirectPerm Mask@0 x@@23 ss) (and (=> (= (ControlFlow 0 2) (- 0 7)) (>= k_8 0)) (=> (>= k_8 0) (and (=> (= (ControlFlow 0 2) (- 0 6)) (< k_8 (|Seq#Length| (MapType0Select Heap@@41 x@@23 ss)))) (=> (< k_8 (|Seq#Length| (MapType0Select Heap@@41 x@@23 ss))) (and (=> (= (ControlFlow 0 2) (- 0 5)) (HasDirectPerm Mask@0 x@@23 ss)) (=> (HasDirectPerm Mask@0 x@@23 ss) (and (=> (= (ControlFlow 0 2) (- 0 4)) (>= j_26 0)) (=> (>= j_26 0) (and (=> (= (ControlFlow 0 2) (- 0 3)) (< j_26 (|Seq#Length| (MapType0Select Heap@@41 x@@23 ss)))) (=> (< j_26 (|Seq#Length| (MapType0Select Heap@@41 x@@23 ss))) (=> (= (ControlFlow 0 2) 1) anon7_correct))))))))))))))))
(let ((anon20_Else_correct  (=> (> 0 j_26) (and (=> (= (ControlFlow 0 14) 2) anon21_Then_correct) (=> (= (ControlFlow 0 14) 9) anon21_Else_correct)))))
(let ((anon20_Then_correct  (=> (>= j_26 0) (and (=> (= (ControlFlow 0 12) (- 0 13)) (HasDirectPerm Mask@0 x@@23 ss)) (=> (HasDirectPerm Mask@0 x@@23 ss) (and (=> (= (ControlFlow 0 12) 2) anon21_Then_correct) (=> (= (ControlFlow 0 12) 9) anon21_Else_correct)))))))
(let ((anon19_Then_correct  (=> (< k_8 (|Seq#Length| (MapType0Select Heap@@41 x@@23 ss))) (and (=> (= (ControlFlow 0 15) 12) anon20_Then_correct) (=> (= (ControlFlow 0 15) 14) anon20_Else_correct)))))
(let ((anon19_Else_correct  (=> (<= (|Seq#Length| (MapType0Select Heap@@41 x@@23 ss)) k_8) (and (=> (= (ControlFlow 0 11) 2) anon21_Then_correct) (=> (= (ControlFlow 0 11) 9) anon21_Else_correct)))))
(let ((anon18_Then_correct  (=> (>= k_8 0) (and (=> (= (ControlFlow 0 16) (- 0 17)) (HasDirectPerm Mask@0 x@@23 ss)) (=> (HasDirectPerm Mask@0 x@@23 ss) (and (=> (= (ControlFlow 0 16) 15) anon19_Then_correct) (=> (= (ControlFlow 0 16) 11) anon19_Else_correct)))))))
(let ((anon18_Else_correct  (=> (> 0 k_8) (and (=> (= (ControlFlow 0 10) 2) anon21_Then_correct) (=> (= (ControlFlow 0 10) 9) anon21_Else_correct)))))
(let ((anon0_correct  (=> (and (state Heap@@41 ZeroMask) (= AssumeFunctionsAbove (- 0 1))) (=> (and (and (U_2_bool (MapType0Select Heap@@41 x@@23 $allocated)) (not (= x@@23 null))) (and (= Mask@0 (MapType1Store ZeroMask x@@23 ss (real_2_U (+ (U_2_real (MapType1Select ZeroMask x@@23 ss)) FullPerm)))) (state Heap@@41 Mask@0))) (and (=> (= (ControlFlow 0 35) (- 0 36)) (HasDirectPerm Mask@0 x@@23 ss)) (=> (HasDirectPerm Mask@0 x@@23 ss) (=> (and (= (|Seq#Length| (MapType0Select Heap@@41 x@@23 ss)) n@@37) (<= 3 n@@37)) (and (and (=> (= (ControlFlow 0 35) 34) anon17_Else_correct) (=> (= (ControlFlow 0 35) 16) anon18_Then_correct)) (=> (= (ControlFlow 0 35) 10) anon18_Else_correct)))))))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 37) 35) anon0_correct)))
PreconditionGeneratedEntry_correct)))))))))))))))))))))
))
(check-sat)
(pop 1)
; Valid
(get-info :rlimit)
(reset)
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
(declare-fun f_7 () T@U)
(declare-fun ss () T@U)
(declare-fun FieldType (T@T T@T) T@T)
(declare-fun FieldTypeInv0 (T@T) T@T)
(declare-fun FieldTypeInv1 (T@T) T@T)
(declare-fun NormalFieldType () T@T)
(declare-fun SeqType (T@T) T@T)
(declare-fun SeqTypeInv0 (T@T) T@T)
(declare-fun RefType () T@T)
(declare-fun |Seq#Length| (T@U) Int)
(declare-fun |Seq#Drop| (T@U Int) T@U)
(declare-fun |fun01#condqp1| (T@U T@U) Int)
(declare-fun succHeapTrans (T@U T@U) Bool)
(declare-fun MapType0Type (T@T) T@T)
(declare-fun |sk_fun01#condqp1| (Int Int) Int)
(declare-fun NoPerm () Real)
(declare-fun FullPerm () Real)
(declare-fun MapType0Select (T@U T@U T@U) T@U)
(declare-fun |Seq#Index| (T@U Int) T@U)
(declare-fun MapType0TypeInv0 (T@T) T@T)
(declare-fun MapType0Store (T@U T@U T@U T@U) T@U)
(declare-fun |fun02#condqp2| (T@U T@U) Int)
(declare-fun |sk_fun02#condqp2| (Int Int) Int)
(declare-fun succHeap (T@U T@U) Bool)
(declare-fun state (T@U T@U) Bool)
(declare-fun MapType1Type (T@T T@T) T@T)
(declare-fun GoodMask (T@U) Bool)
(declare-fun MapType1TypeInv0 (T@T) T@T)
(declare-fun MapType1TypeInv1 (T@T) T@T)
(declare-fun MapType1Select (T@U T@U T@U) T@U)
(declare-fun MapType1Store (T@U T@U T@U T@U) T@U)
(declare-fun |fun06'| (T@U T@U Int Int) Int)
(declare-fun dummyFunction (T@U) Bool)
(declare-fun |fun06#triggerStateless| (T@U Int Int) Int)
(declare-fun |fun04'| (T@U T@U Int Int) Int)
(declare-fun |fun04#triggerStateless| (T@U Int Int) Int)
(declare-fun P02 (T@U Int) T@U)
(declare-fun IsPredicateField (T@U) Bool)
(declare-fun PredicateType_P02Type () T@T)
(declare-fun FrameTypeType () T@T)
(declare-fun P01 (T@U Int) T@U)
(declare-fun PredicateType_P01Type () T@T)
(declare-fun |fun03'| (T@U T@U Int) Int)
(declare-fun |fun03#triggerStateless| (T@U Int) Int)
(declare-fun |fun07'| (T@U T@U Int) Int)
(declare-fun |fun07#triggerStateless| (T@U Int) Int)
(declare-fun |fun08'| (T@U T@U Int) Int)
(declare-fun |fun08#triggerStateless| (T@U Int) Int)
(declare-fun |P02#trigger| (T@U T@U) Bool)
(declare-fun |P02#everUsed| (T@U) Bool)
(declare-fun |P01#trigger| (T@U T@U) Bool)
(declare-fun |P01#everUsed| (T@U) Bool)
(declare-fun |Seq#Sub| (Int Int) Int)
(declare-fun |Seq#Add| (Int Int) Int)
(declare-fun IdenticalOnKnownLocations (T@U T@U T@U) Bool)
(declare-fun null () T@U)
(declare-fun PredicateMaskField (T@U) T@U)
(declare-fun HasDirectPerm (T@U T@U T@U) Bool)
(declare-fun IsWandField (T@U) Bool)
(declare-fun WandMaskField (T@U) T@U)
(declare-fun |fun01'| (T@U T@U) Int)
(declare-fun |fun01#triggerStateless| (T@U) Int)
(declare-fun |fun02'| (T@U T@U) Int)
(declare-fun |fun02#triggerStateless| (T@U) Int)
(declare-fun |Seq#Update| (T@U Int T@U) T@U)
(declare-fun |Seq#Take| (T@U Int) T@U)
(declare-fun |fun07#condqp9| (T@U T@U Int) Int)
(declare-fun |sk_fun07#condqp9| (Int Int) Int)
(declare-fun |fun08#condqp10| (T@U T@U Int) Int)
(declare-fun |sk_fun08#condqp10| (Int Int) Int)
(declare-fun |Seq#Contains| (T@U T@U) Bool)
(declare-fun |Seq#Range| (Int Int) T@U)
(declare-fun |Seq#Skolem| (T@U T@U) Int)
(declare-fun fun01 (T@U T@U) Int)
(declare-fun fun02 (T@U T@U) Int)
(declare-fun fun04 (T@U T@U Int Int) Int)
(declare-fun AssumeFunctionsAbove () Int)
(declare-fun |Seq#Singleton| (T@U) T@U)
(declare-fun |P02#sm| (T@U Int) T@U)
(declare-fun |P01#sm| (T@U Int) T@U)
(declare-fun |Seq#Empty| (T@T) T@U)
(declare-fun dummyHeap () T@U)
(declare-fun ZeroMask () T@U)
(declare-fun InsidePredicate (T@U T@U T@U T@U) Bool)
(declare-fun fun03 (T@U T@U Int) Int)
(declare-fun fun08 (T@U T@U Int) Int)
(declare-fun |Seq#Append| (T@U T@U) T@U)
(declare-fun sumMask (T@U T@U T@U) Bool)
(declare-fun |P01#condqp8| (T@U T@U Int) Int)
(declare-fun |sk_P01#condqp8| (Int Int) Int)
(declare-fun ConditionalFrame (Real T@U) T@U)
(declare-fun EmptyFrame () T@U)
(declare-fun fun06 (T@U T@U Int Int) Int)
(declare-fun fun07 (T@U T@U Int) Int)
(declare-fun |fun07#frame| (T@U T@U Int) Int)
(declare-fun FrameFragment (T@U) T@U)
(declare-fun |fun08#frame| (T@U T@U Int) Int)
(declare-fun |fun06#frame| (T@U T@U Int Int) Int)
(declare-fun |fun04#frame| (T@U T@U Int Int) Int)
(declare-fun |P02#condqp6| (T@U T@U Int) Int)
(declare-fun |sk_P02#condqp6| (Int Int) Int)
(declare-fun |Seq#Equal| (T@U T@U) Bool)
(declare-fun |Seq#ContainsTrigger| (T@U T@U) Bool)
(declare-fun getPredWandId (T@U) Int)
(declare-fun |P01#condqp7| (T@U T@U Int) Int)
(declare-fun |sk_P01#condqp7| (Int Int) Int)
(declare-fun |fun07#trigger| (T@U T@U Int) Bool)
(declare-fun |fun01#frame| (T@U T@U) Int)
(declare-fun |fun02#frame| (T@U T@U) Int)
(declare-fun |fun03#condqp4| (T@U T@U Int) Int)
(declare-fun |sk_fun03#condqp4| (Int Int) Int)
(declare-fun ZeroPMask () T@U)
(declare-fun |Seq#SkolemDiff| (T@U T@U) Int)
(declare-fun |fun03#condqp3| (T@U T@U Int) Int)
(declare-fun |sk_fun03#condqp3| (Int Int) Int)
(declare-fun |P02#condqp5| (T@U T@U Int) Int)
(declare-fun |sk_P02#condqp5| (Int Int) Int)
(declare-fun |fun03#frame| (T@U T@U Int) Int)
(declare-fun CombineFrames (T@U T@U) T@U)
(declare-fun |fun08#trigger| (T@U T@U Int) Bool)
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
))) (= (Ctor NormalFieldType) 7)) (= (type $allocated) (FieldType NormalFieldType boolType))) (= (type f_7) (FieldType NormalFieldType intType))) (forall ((arg0@@14 T@T) ) (! (= (Ctor (SeqType arg0@@14)) 8)
 :qid |ctor:SeqType|
))) (forall ((arg0@@15 T@T) ) (! (= (SeqTypeInv0 (SeqType arg0@@15)) arg0@@15)
 :qid |typeInv:SeqTypeInv0|
 :pattern ( (SeqType arg0@@15))
))) (= (Ctor RefType) 9)) (= (type ss) (FieldType NormalFieldType (SeqType RefType)))))
(assert (distinct $allocated f_7 ss)
)
(assert (forall ((arg0@@16 T@U) (arg1@@2 Int) ) (! (let ((T (SeqTypeInv0 (type arg0@@16))))
(= (type (|Seq#Drop| arg0@@16 arg1@@2)) (SeqType T)))
 :qid |funType:Seq#Drop|
 :pattern ( (|Seq#Drop| arg0@@16 arg1@@2))
)))
(assert (forall ((s T@U) (n Int) ) (! (let ((T@@0 (SeqTypeInv0 (type s))))
 (=> (= (type s) (SeqType T@@0)) (and (=> (<= 0 n) (and (=> (<= n (|Seq#Length| s)) (= (|Seq#Length| (|Seq#Drop| s n)) (- (|Seq#Length| s) n))) (=> (< (|Seq#Length| s) n) (= (|Seq#Length| (|Seq#Drop| s n)) 0)))) (=> (< n 0) (= (|Seq#Length| (|Seq#Drop| s n)) (|Seq#Length| s))))))
 :qid |stdinbpl.475:18|
 :skolemid |38|
 :pattern ( (|Seq#Length| (|Seq#Drop| s n)))
 :pattern ( (|Seq#Length| s) (|Seq#Drop| s n))
)))
(assert  (and (and (and (and (and (and (forall ((arg0@@17 T@T) ) (! (= (Ctor (MapType0Type arg0@@17)) 10)
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
)))) (forall ((arg0@@21 T@U) (arg1@@5 Int) ) (! (let ((T@@1 (SeqTypeInv0 (type arg0@@21))))
(= (type (|Seq#Index| arg0@@21 arg1@@5)) T@@1))
 :qid |funType:Seq#Index|
 :pattern ( (|Seq#Index| arg0@@21 arg1@@5))
))))
(assert (forall ((Heap2Heap T@U) (Heap1Heap T@U) (xs T@U) ) (!  (=> (and (and (and (= (type Heap2Heap) (MapType0Type RefType)) (= (type Heap1Heap) (MapType0Type RefType))) (= (type xs) (SeqType RefType))) (and (=  (and (and (<= 0 (|sk_fun01#condqp1| (|fun01#condqp1| Heap2Heap xs) (|fun01#condqp1| Heap1Heap xs))) (< (|sk_fun01#condqp1| (|fun01#condqp1| Heap2Heap xs) (|fun01#condqp1| Heap1Heap xs)) (|Seq#Length| xs))) (< NoPerm FullPerm))  (and (and (<= 0 (|sk_fun01#condqp1| (|fun01#condqp1| Heap2Heap xs) (|fun01#condqp1| Heap1Heap xs))) (< (|sk_fun01#condqp1| (|fun01#condqp1| Heap2Heap xs) (|fun01#condqp1| Heap1Heap xs)) (|Seq#Length| xs))) (< NoPerm FullPerm))) (=> (and (and (<= 0 (|sk_fun01#condqp1| (|fun01#condqp1| Heap2Heap xs) (|fun01#condqp1| Heap1Heap xs))) (< (|sk_fun01#condqp1| (|fun01#condqp1| Heap2Heap xs) (|fun01#condqp1| Heap1Heap xs)) (|Seq#Length| xs))) (< NoPerm FullPerm)) (= (U_2_int (MapType0Select Heap2Heap (|Seq#Index| xs (|sk_fun01#condqp1| (|fun01#condqp1| Heap2Heap xs) (|fun01#condqp1| Heap1Heap xs))) f_7)) (U_2_int (MapType0Select Heap1Heap (|Seq#Index| xs (|sk_fun01#condqp1| (|fun01#condqp1| Heap2Heap xs) (|fun01#condqp1| Heap1Heap xs))) f_7)))))) (= (|fun01#condqp1| Heap2Heap xs) (|fun01#condqp1| Heap1Heap xs)))
 :qid |stdinbpl.789:15|
 :skolemid |63|
 :pattern ( (|fun01#condqp1| Heap2Heap xs) (|fun01#condqp1| Heap1Heap xs) (succHeapTrans Heap2Heap Heap1Heap))
)))
(assert (forall ((Heap2Heap@@0 T@U) (Heap1Heap@@0 T@U) (xs@@0 T@U) ) (!  (=> (and (and (and (= (type Heap2Heap@@0) (MapType0Type RefType)) (= (type Heap1Heap@@0) (MapType0Type RefType))) (= (type xs@@0) (SeqType RefType))) (and (=  (and (and (<= 0 (|sk_fun02#condqp2| (|fun02#condqp2| Heap2Heap@@0 xs@@0) (|fun02#condqp2| Heap1Heap@@0 xs@@0))) (< (|sk_fun02#condqp2| (|fun02#condqp2| Heap2Heap@@0 xs@@0) (|fun02#condqp2| Heap1Heap@@0 xs@@0)) (|Seq#Length| xs@@0))) (< NoPerm FullPerm))  (and (and (<= 0 (|sk_fun02#condqp2| (|fun02#condqp2| Heap2Heap@@0 xs@@0) (|fun02#condqp2| Heap1Heap@@0 xs@@0))) (< (|sk_fun02#condqp2| (|fun02#condqp2| Heap2Heap@@0 xs@@0) (|fun02#condqp2| Heap1Heap@@0 xs@@0)) (|Seq#Length| xs@@0))) (< NoPerm FullPerm))) (=> (and (and (<= 0 (|sk_fun02#condqp2| (|fun02#condqp2| Heap2Heap@@0 xs@@0) (|fun02#condqp2| Heap1Heap@@0 xs@@0))) (< (|sk_fun02#condqp2| (|fun02#condqp2| Heap2Heap@@0 xs@@0) (|fun02#condqp2| Heap1Heap@@0 xs@@0)) (|Seq#Length| xs@@0))) (< NoPerm FullPerm)) (= (U_2_int (MapType0Select Heap2Heap@@0 (|Seq#Index| xs@@0 (|sk_fun02#condqp2| (|fun02#condqp2| Heap2Heap@@0 xs@@0) (|fun02#condqp2| Heap1Heap@@0 xs@@0))) f_7)) (U_2_int (MapType0Select Heap1Heap@@0 (|Seq#Index| xs@@0 (|sk_fun02#condqp2| (|fun02#condqp2| Heap2Heap@@0 xs@@0) (|fun02#condqp2| Heap1Heap@@0 xs@@0))) f_7)))))) (= (|fun02#condqp2| Heap2Heap@@0 xs@@0) (|fun02#condqp2| Heap1Heap@@0 xs@@0)))
 :qid |stdinbpl.933:15|
 :skolemid |76|
 :pattern ( (|fun02#condqp2| Heap2Heap@@0 xs@@0) (|fun02#condqp2| Heap1Heap@@0 xs@@0) (succHeapTrans Heap2Heap@@0 Heap1Heap@@0))
)))
(assert (forall ((Heap0 T@U) (Heap1 T@U) ) (!  (=> (and (and (= (type Heap0) (MapType0Type RefType)) (= (type Heap1) (MapType0Type RefType))) (succHeap Heap0 Heap1)) (succHeapTrans Heap0 Heap1))
 :qid |stdinbpl.88:15|
 :skolemid |11|
 :pattern ( (succHeap Heap0 Heap1))
)))
(assert  (and (and (and (and (and (and (forall ((arg0@@22 T@T) (arg1@@6 T@T) ) (! (= (Ctor (MapType1Type arg0@@22 arg1@@6)) 11)
 :qid |ctor:MapType1Type|
)) (forall ((arg0@@23 T@T) (arg1@@7 T@T) ) (! (= (MapType1TypeInv0 (MapType1Type arg0@@23 arg1@@7)) arg0@@23)
 :qid |typeInv:MapType1TypeInv0|
 :pattern ( (MapType1Type arg0@@23 arg1@@7))
))) (forall ((arg0@@24 T@T) (arg1@@8 T@T) ) (! (= (MapType1TypeInv1 (MapType1Type arg0@@24 arg1@@8)) arg1@@8)
 :qid |typeInv:MapType1TypeInv1|
 :pattern ( (MapType1Type arg0@@24 arg1@@8))
))) (forall ((arg0@@25 T@U) (arg1@@9 T@U) (arg2@@1 T@U) ) (! (let ((aVar1 (MapType1TypeInv1 (type arg0@@25))))
(= (type (MapType1Select arg0@@25 arg1@@9 arg2@@1)) aVar1))
 :qid |funType:MapType1Select|
 :pattern ( (MapType1Select arg0@@25 arg1@@9 arg2@@1))
))) (forall ((arg0@@26 T@U) (arg1@@10 T@U) (arg2@@2 T@U) (arg3@@0 T@U) ) (! (let ((aVar1@@0 (type arg3@@0)))
(let ((aVar0@@0 (type arg1@@10)))
(= (type (MapType1Store arg0@@26 arg1@@10 arg2@@2 arg3@@0)) (MapType1Type aVar0@@0 aVar1@@0))))
 :qid |funType:MapType1Store|
 :pattern ( (MapType1Store arg0@@26 arg1@@10 arg2@@2 arg3@@0))
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
(assert (forall ((Heap@@0 T@U) (xs@@1 T@U) (n@@0 Int) (i Int) ) (!  (=> (and (= (type Heap@@0) (MapType0Type RefType)) (= (type xs@@1) (SeqType RefType))) (dummyFunction (int_2_U (|fun06#triggerStateless| xs@@1 n@@0 i))))
 :qid |stdinbpl.1261:15|
 :skolemid |105|
 :pattern ( (|fun06'| Heap@@0 xs@@1 n@@0 i))
)))
(assert (forall ((Heap@@1 T@U) (x@@8 T@U) (n@@1 Int) (i@@0 Int) ) (!  (=> (and (= (type Heap@@1) (MapType0Type RefType)) (= (type x@@8) RefType)) (dummyFunction (int_2_U (|fun04#triggerStateless| x@@8 n@@1 i@@0))))
 :qid |stdinbpl.1448:15|
 :skolemid |126|
 :pattern ( (|fun04'| Heap@@1 x@@8 n@@1 i@@0))
)))
(assert  (and (and (= (Ctor PredicateType_P02Type) 12) (= (Ctor FrameTypeType) 13)) (forall ((arg0@@27 T@U) (arg1@@11 Int) ) (! (= (type (P02 arg0@@27 arg1@@11)) (FieldType PredicateType_P02Type FrameTypeType))
 :qid |funType:P02|
 :pattern ( (P02 arg0@@27 arg1@@11))
))))
(assert (forall ((xs@@2 T@U) (n@@2 Int) ) (!  (=> (= (type xs@@2) (SeqType RefType)) (IsPredicateField (P02 xs@@2 n@@2)))
 :qid |stdinbpl.2125:15|
 :skolemid |191|
 :pattern ( (P02 xs@@2 n@@2))
)))
(assert  (and (= (Ctor PredicateType_P01Type) 14) (forall ((arg0@@28 T@U) (arg1@@12 Int) ) (! (= (type (P01 arg0@@28 arg1@@12)) (FieldType PredicateType_P01Type FrameTypeType))
 :qid |funType:P01|
 :pattern ( (P01 arg0@@28 arg1@@12))
))))
(assert (forall ((x@@9 T@U) (n@@3 Int) ) (!  (=> (= (type x@@9) RefType) (IsPredicateField (P01 x@@9 n@@3)))
 :qid |stdinbpl.2311:15|
 :skolemid |212|
 :pattern ( (P01 x@@9 n@@3))
)))
(assert (forall ((Heap@@2 T@U) (xs@@3 T@U) (i@@1 Int) ) (!  (=> (and (= (type Heap@@2) (MapType0Type RefType)) (= (type xs@@3) (SeqType RefType))) (dummyFunction (int_2_U (|fun03#triggerStateless| xs@@3 i@@1))))
 :qid |stdinbpl.1055:15|
 :skolemid |85|
 :pattern ( (|fun03'| Heap@@2 xs@@3 i@@1))
)))
(assert (forall ((Heap@@3 T@U) (xs@@4 T@U) (j Int) ) (!  (=> (and (= (type Heap@@3) (MapType0Type RefType)) (= (type xs@@4) (SeqType RefType))) (dummyFunction (int_2_U (|fun07#triggerStateless| xs@@4 j))))
 :qid |stdinbpl.1643:15|
 :skolemid |147|
 :pattern ( (|fun07'| Heap@@3 xs@@4 j))
)))
(assert (forall ((Heap@@4 T@U) (xs@@5 T@U) (i@@2 Int) ) (!  (=> (and (= (type Heap@@4) (MapType0Type RefType)) (= (type xs@@5) (SeqType RefType))) (dummyFunction (int_2_U (|fun08#triggerStateless| xs@@5 i@@2))))
 :qid |stdinbpl.1953:15|
 :skolemid |176|
 :pattern ( (|fun08'| Heap@@4 xs@@5 i@@2))
)))
(assert (forall ((Heap@@5 T@U) (xs@@6 T@U) (n@@4 Int) ) (!  (=> (and (= (type Heap@@5) (MapType0Type RefType)) (= (type xs@@6) (SeqType RefType))) (|P02#everUsed| (P02 xs@@6 n@@4)))
 :qid |stdinbpl.2144:15|
 :skolemid |195|
 :pattern ( (|P02#trigger| Heap@@5 (P02 xs@@6 n@@4)))
)))
(assert (forall ((Heap@@6 T@U) (x@@10 T@U) (n@@5 Int) ) (!  (=> (and (= (type Heap@@6) (MapType0Type RefType)) (= (type x@@10) RefType)) (|P01#everUsed| (P01 x@@10 n@@5)))
 :qid |stdinbpl.2330:15|
 :skolemid |216|
 :pattern ( (|P01#trigger| Heap@@6 (P01 x@@10 n@@5)))
)))
(assert (forall ((s@@0 T@U) (n@@6 Int) (j@@0 Int) ) (! (let ((T@@2 (SeqTypeInv0 (type s@@0))))
 (=> (= (type s@@0) (SeqType T@@2)) (=> (and (and (< 0 n@@6) (<= 0 j@@0)) (< j@@0 (- (|Seq#Length| s@@0) n@@6))) (and (= (|Seq#Sub| (|Seq#Add| j@@0 n@@6) n@@6) j@@0) (= (|Seq#Index| (|Seq#Drop| s@@0 n@@6) j@@0) (|Seq#Index| s@@0 (|Seq#Add| j@@0 n@@6)))))))
 :qid |stdinbpl.496:18|
 :skolemid |39|
 :pattern ( (|Seq#Index| (|Seq#Drop| s@@0 n@@6) j@@0))
)))
(assert  (and (= (type null) RefType) (forall ((arg0@@29 T@U) ) (! (let ((A (FieldTypeInv0 (type arg0@@29))))
(= (type (PredicateMaskField arg0@@29)) (FieldType A (MapType1Type RefType boolType))))
 :qid |funType:PredicateMaskField|
 :pattern ( (PredicateMaskField arg0@@29))
))))
(assert (forall ((Heap@@7 T@U) (ExhaleHeap T@U) (Mask@@0 T@U) (pm_f T@U) ) (! (let ((C (FieldTypeInv0 (type pm_f))))
 (=> (and (and (and (and (and (= (type Heap@@7) (MapType0Type RefType)) (= (type ExhaleHeap) (MapType0Type RefType))) (= (type Mask@@0) (MapType1Type RefType realType))) (= (type pm_f) (FieldType C FrameTypeType))) (IdenticalOnKnownLocations Heap@@7 ExhaleHeap Mask@@0)) (and (HasDirectPerm Mask@@0 null pm_f) (IsPredicateField pm_f))) (= (MapType0Select Heap@@7 null (PredicateMaskField pm_f)) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))))
 :qid |stdinbpl.47:19|
 :skolemid |2|
 :pattern ( (IdenticalOnKnownLocations Heap@@7 ExhaleHeap Mask@@0) (IsPredicateField pm_f) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))
)))
(assert (forall ((arg0@@30 T@U) ) (! (let ((A@@0 (FieldTypeInv0 (type arg0@@30))))
(= (type (WandMaskField arg0@@30)) (FieldType A@@0 (MapType1Type RefType boolType))))
 :qid |funType:WandMaskField|
 :pattern ( (WandMaskField arg0@@30))
)))
(assert (forall ((Heap@@8 T@U) (ExhaleHeap@@0 T@U) (Mask@@1 T@U) (pm_f@@0 T@U) ) (! (let ((C@@0 (FieldTypeInv0 (type pm_f@@0))))
 (=> (and (and (and (and (and (= (type Heap@@8) (MapType0Type RefType)) (= (type ExhaleHeap@@0) (MapType0Type RefType))) (= (type Mask@@1) (MapType1Type RefType realType))) (= (type pm_f@@0) (FieldType C@@0 FrameTypeType))) (IdenticalOnKnownLocations Heap@@8 ExhaleHeap@@0 Mask@@1)) (and (HasDirectPerm Mask@@1 null pm_f@@0) (IsWandField pm_f@@0))) (= (MapType0Select Heap@@8 null (WandMaskField pm_f@@0)) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))))
 :qid |stdinbpl.60:19|
 :skolemid |5|
 :pattern ( (IdenticalOnKnownLocations Heap@@8 ExhaleHeap@@0 Mask@@1) (IsWandField pm_f@@0) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))
)))
(assert (forall ((Heap@@9 T@U) (xs@@7 T@U) ) (!  (=> (and (= (type Heap@@9) (MapType0Type RefType)) (= (type xs@@7) (SeqType RefType))) (dummyFunction (int_2_U (|fun01#triggerStateless| xs@@7))))
 :qid |stdinbpl.763:15|
 :skolemid |59|
 :pattern ( (|fun01'| Heap@@9 xs@@7))
)))
(assert (forall ((Heap@@10 T@U) (xs@@8 T@U) ) (!  (=> (and (= (type Heap@@10) (MapType0Type RefType)) (= (type xs@@8) (SeqType RefType))) (dummyFunction (int_2_U (|fun02#triggerStateless| xs@@8))))
 :qid |stdinbpl.907:15|
 :skolemid |72|
 :pattern ( (|fun02'| Heap@@10 xs@@8))
)))
(assert (forall ((arg0@@31 T@U) (arg1@@13 Int) (arg2@@3 T@U) ) (! (let ((T@@3 (type arg2@@3)))
(= (type (|Seq#Update| arg0@@31 arg1@@13 arg2@@3)) (SeqType T@@3)))
 :qid |funType:Seq#Update|
 :pattern ( (|Seq#Update| arg0@@31 arg1@@13 arg2@@3))
)))
(assert (forall ((s@@1 T@U) (i@@3 Int) (v T@U) (n@@7 Int) ) (! (let ((T@@4 (type v)))
 (=> (= (type s@@1) (SeqType T@@4)) (=> (and (<= 0 n@@7) (< n@@7 (|Seq#Length| s@@1))) (and (=> (= i@@3 n@@7) (= (|Seq#Index| (|Seq#Update| s@@1 i@@3 v) n@@7) v)) (=> (not (= i@@3 n@@7)) (= (|Seq#Index| (|Seq#Update| s@@1 i@@3 v) n@@7) (|Seq#Index| s@@1 n@@7)))))))
 :qid |stdinbpl.451:18|
 :skolemid |35|
 :pattern ( (|Seq#Index| (|Seq#Update| s@@1 i@@3 v) n@@7))
 :pattern ( (|Seq#Index| s@@1 n@@7) (|Seq#Update| s@@1 i@@3 v))
)))
(assert (forall ((arg0@@32 T@U) (arg1@@14 Int) ) (! (let ((T@@5 (SeqTypeInv0 (type arg0@@32))))
(= (type (|Seq#Take| arg0@@32 arg1@@14)) (SeqType T@@5)))
 :qid |funType:Seq#Take|
 :pattern ( (|Seq#Take| arg0@@32 arg1@@14))
)))
(assert (forall ((s@@2 T@U) (n@@8 Int) ) (! (let ((T@@6 (SeqTypeInv0 (type s@@2))))
 (=> (= (type s@@2) (SeqType T@@6)) (and (=> (<= 0 n@@8) (and (=> (<= n@@8 (|Seq#Length| s@@2)) (= (|Seq#Length| (|Seq#Take| s@@2 n@@8)) n@@8)) (=> (< (|Seq#Length| s@@2) n@@8) (= (|Seq#Length| (|Seq#Take| s@@2 n@@8)) (|Seq#Length| s@@2))))) (=> (< n@@8 0) (= (|Seq#Length| (|Seq#Take| s@@2 n@@8)) 0)))))
 :qid |stdinbpl.462:18|
 :skolemid |36|
 :pattern ( (|Seq#Length| (|Seq#Take| s@@2 n@@8)))
 :pattern ( (|Seq#Take| s@@2 n@@8) (|Seq#Length| s@@2))
)))
(assert (forall ((Heap2Heap@@1 T@U) (Heap1Heap@@1 T@U) (xs@@9 T@U) (j@@1 Int) ) (!  (=> (and (and (and (= (type Heap2Heap@@1) (MapType0Type RefType)) (= (type Heap1Heap@@1) (MapType0Type RefType))) (= (type xs@@9) (SeqType RefType))) (and (=  (and (and (<= 0 (|sk_fun07#condqp9| (|fun07#condqp9| Heap2Heap@@1 xs@@9 j@@1) (|fun07#condqp9| Heap1Heap@@1 xs@@9 j@@1))) (< (|sk_fun07#condqp9| (|fun07#condqp9| Heap2Heap@@1 xs@@9 j@@1) (|fun07#condqp9| Heap1Heap@@1 xs@@9 j@@1)) (|Seq#Length| xs@@9))) (< NoPerm FullPerm))  (and (and (<= 0 (|sk_fun07#condqp9| (|fun07#condqp9| Heap2Heap@@1 xs@@9 j@@1) (|fun07#condqp9| Heap1Heap@@1 xs@@9 j@@1))) (< (|sk_fun07#condqp9| (|fun07#condqp9| Heap2Heap@@1 xs@@9 j@@1) (|fun07#condqp9| Heap1Heap@@1 xs@@9 j@@1)) (|Seq#Length| xs@@9))) (< NoPerm FullPerm))) (=> (and (and (<= 0 (|sk_fun07#condqp9| (|fun07#condqp9| Heap2Heap@@1 xs@@9 j@@1) (|fun07#condqp9| Heap1Heap@@1 xs@@9 j@@1))) (< (|sk_fun07#condqp9| (|fun07#condqp9| Heap2Heap@@1 xs@@9 j@@1) (|fun07#condqp9| Heap1Heap@@1 xs@@9 j@@1)) (|Seq#Length| xs@@9))) (< NoPerm FullPerm)) (= (U_2_int (MapType0Select Heap2Heap@@1 (|Seq#Index| xs@@9 (|sk_fun07#condqp9| (|fun07#condqp9| Heap2Heap@@1 xs@@9 j@@1) (|fun07#condqp9| Heap1Heap@@1 xs@@9 j@@1))) f_7)) (U_2_int (MapType0Select Heap1Heap@@1 (|Seq#Index| xs@@9 (|sk_fun07#condqp9| (|fun07#condqp9| Heap2Heap@@1 xs@@9 j@@1) (|fun07#condqp9| Heap1Heap@@1 xs@@9 j@@1))) f_7)))))) (= (|fun07#condqp9| Heap2Heap@@1 xs@@9 j@@1) (|fun07#condqp9| Heap1Heap@@1 xs@@9 j@@1)))
 :qid |stdinbpl.1669:15|
 :skolemid |151|
 :pattern ( (|fun07#condqp9| Heap2Heap@@1 xs@@9 j@@1) (|fun07#condqp9| Heap1Heap@@1 xs@@9 j@@1) (succHeapTrans Heap2Heap@@1 Heap1Heap@@1))
)))
(assert (forall ((Heap2Heap@@2 T@U) (Heap1Heap@@2 T@U) (xs@@10 T@U) (i@@4 Int) ) (!  (=> (and (and (and (= (type Heap2Heap@@2) (MapType0Type RefType)) (= (type Heap1Heap@@2) (MapType0Type RefType))) (= (type xs@@10) (SeqType RefType))) (and (=  (and (and (<= 0 (|sk_fun08#condqp10| (|fun08#condqp10| Heap2Heap@@2 xs@@10 i@@4) (|fun08#condqp10| Heap1Heap@@2 xs@@10 i@@4))) (< (|sk_fun08#condqp10| (|fun08#condqp10| Heap2Heap@@2 xs@@10 i@@4) (|fun08#condqp10| Heap1Heap@@2 xs@@10 i@@4)) (|Seq#Length| xs@@10))) (< NoPerm FullPerm))  (and (and (<= 0 (|sk_fun08#condqp10| (|fun08#condqp10| Heap2Heap@@2 xs@@10 i@@4) (|fun08#condqp10| Heap1Heap@@2 xs@@10 i@@4))) (< (|sk_fun08#condqp10| (|fun08#condqp10| Heap2Heap@@2 xs@@10 i@@4) (|fun08#condqp10| Heap1Heap@@2 xs@@10 i@@4)) (|Seq#Length| xs@@10))) (< NoPerm FullPerm))) (=> (and (and (<= 0 (|sk_fun08#condqp10| (|fun08#condqp10| Heap2Heap@@2 xs@@10 i@@4) (|fun08#condqp10| Heap1Heap@@2 xs@@10 i@@4))) (< (|sk_fun08#condqp10| (|fun08#condqp10| Heap2Heap@@2 xs@@10 i@@4) (|fun08#condqp10| Heap1Heap@@2 xs@@10 i@@4)) (|Seq#Length| xs@@10))) (< NoPerm FullPerm)) (= (U_2_int (MapType0Select Heap2Heap@@2 (|Seq#Index| xs@@10 (|sk_fun08#condqp10| (|fun08#condqp10| Heap2Heap@@2 xs@@10 i@@4) (|fun08#condqp10| Heap1Heap@@2 xs@@10 i@@4))) f_7)) (U_2_int (MapType0Select Heap1Heap@@2 (|Seq#Index| xs@@10 (|sk_fun08#condqp10| (|fun08#condqp10| Heap2Heap@@2 xs@@10 i@@4) (|fun08#condqp10| Heap1Heap@@2 xs@@10 i@@4))) f_7)))))) (= (|fun08#condqp10| Heap2Heap@@2 xs@@10 i@@4) (|fun08#condqp10| Heap1Heap@@2 xs@@10 i@@4)))
 :qid |stdinbpl.1979:15|
 :skolemid |180|
 :pattern ( (|fun08#condqp10| Heap2Heap@@2 xs@@10 i@@4) (|fun08#condqp10| Heap1Heap@@2 xs@@10 i@@4) (succHeapTrans Heap2Heap@@2 Heap1Heap@@2))
)))
(assert (forall ((arg0@@33 Int) (arg1@@15 Int) ) (! (= (type (|Seq#Range| arg0@@33 arg1@@15)) (SeqType intType))
 :qid |funType:Seq#Range|
 :pattern ( (|Seq#Range| arg0@@33 arg1@@15))
)))
(assert (forall ((q@min Int) (q@max Int) (v@@0 T@U) ) (!  (=> (= (type v@@0) intType) (= (|Seq#Contains| (|Seq#Range| q@min q@max) v@@0)  (and (<= q@min (U_2_int v@@0)) (< (U_2_int v@@0) q@max))))
 :qid |stdinbpl.735:15|
 :skolemid |57|
 :pattern ( (|Seq#Contains| (|Seq#Range| q@min q@max) v@@0))
)))
(assert (forall ((s@@3 T@U) (x@@11 T@U) ) (! (let ((T@@7 (type x@@11)))
 (=> (and (= (type s@@3) (SeqType T@@7)) (|Seq#Contains| s@@3 x@@11)) (and (and (<= 0 (|Seq#Skolem| s@@3 x@@11)) (< (|Seq#Skolem| s@@3 x@@11) (|Seq#Length| s@@3))) (= (|Seq#Index| s@@3 (|Seq#Skolem| s@@3 x@@11)) x@@11))))
 :qid |stdinbpl.593:18|
 :skolemid |47|
 :pattern ( (|Seq#Contains| s@@3 x@@11))
)))
(assert (forall ((Heap@@11 T@U) (ExhaleHeap@@1 T@U) (Mask@@2 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@11) (MapType0Type RefType)) (= (type ExhaleHeap@@1) (MapType0Type RefType))) (= (type Mask@@2) (MapType1Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@11 ExhaleHeap@@1 Mask@@2)) (U_2_bool (MapType0Select Heap@@11 o_1 $allocated))) (U_2_bool (MapType0Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.73:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@11 ExhaleHeap@@1 Mask@@2) (MapType0Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert (forall ((Heap@@12 T@U) (xs@@11 T@U) ) (!  (=> (and (= (type Heap@@12) (MapType0Type RefType)) (= (type xs@@11) (SeqType RefType))) (and (= (fun01 Heap@@12 xs@@11) (|fun01'| Heap@@12 xs@@11)) (dummyFunction (int_2_U (|fun01#triggerStateless| xs@@11)))))
 :qid |stdinbpl.759:15|
 :skolemid |58|
 :pattern ( (fun01 Heap@@12 xs@@11))
)))
(assert (forall ((Heap@@13 T@U) (xs@@12 T@U) ) (!  (=> (and (= (type Heap@@13) (MapType0Type RefType)) (= (type xs@@12) (SeqType RefType))) (and (= (fun02 Heap@@13 xs@@12) (|fun02'| Heap@@13 xs@@12)) (dummyFunction (int_2_U (|fun02#triggerStateless| xs@@12)))))
 :qid |stdinbpl.903:15|
 :skolemid |71|
 :pattern ( (fun02 Heap@@13 xs@@12))
)))
(assert (forall ((s@@4 T@U) (n@@9 Int) ) (! (let ((T@@8 (SeqTypeInv0 (type s@@4))))
 (=> (and (= (type s@@4) (SeqType T@@8)) (<= n@@9 0)) (= (|Seq#Drop| s@@4 n@@9) s@@4)))
 :qid |stdinbpl.577:18|
 :skolemid |45|
 :pattern ( (|Seq#Drop| s@@4 n@@9))
)))
(assert (forall ((i@@5 Int) (j@@2 Int) ) (! (= (|Seq#Sub| i@@5 j@@2) (- i@@5 j@@2))
 :qid |stdinbpl.431:15|
 :skolemid |30|
 :pattern ( (|Seq#Sub| i@@5 j@@2))
)))
(assert (forall ((i@@6 Int) (j@@3 Int) ) (! (= (|Seq#Add| i@@6 j@@3) (+ i@@6 j@@3))
 :qid |stdinbpl.429:15|
 :skolemid |29|
 :pattern ( (|Seq#Add| i@@6 j@@3))
)))
(assert (forall ((Heap@@14 T@U) (Mask@@3 T@U) (x@@12 T@U) (n@@10 Int) (i@@7 Int) ) (!  (=> (and (and (and (and (= (type Heap@@14) (MapType0Type RefType)) (= (type Mask@@3) (MapType1Type RefType realType))) (= (type x@@12) RefType)) (and (state Heap@@14 Mask@@3) (< AssumeFunctionsAbove 5))) (and (< 0 i@@7) (< i@@7 n@@10))) (= (fun04 Heap@@14 x@@12 n@@10 i@@7) (U_2_int (MapType0Select Heap@@14 (|Seq#Index| (MapType0Select Heap@@14 x@@12 ss) i@@7) f_7))))
 :qid |stdinbpl.1454:15|
 :skolemid |127|
 :pattern ( (state Heap@@14 Mask@@3) (fun04 Heap@@14 x@@12 n@@10 i@@7))
 :pattern ( (state Heap@@14 Mask@@3) (|fun04#triggerStateless| x@@12 n@@10 i@@7) (|P01#trigger| Heap@@14 (P01 x@@12 n@@10)))
)))
(assert (forall ((arg0@@34 T@U) ) (! (let ((T@@9 (type arg0@@34)))
(= (type (|Seq#Singleton| arg0@@34)) (SeqType T@@9)))
 :qid |funType:Seq#Singleton|
 :pattern ( (|Seq#Singleton| arg0@@34))
)))
(assert (forall ((x@@13 T@U) (y@@1 T@U) ) (! (let ((T@@10 (type x@@13)))
 (=> (= (type y@@1) T@@10) (= (|Seq#Contains| (|Seq#Singleton| x@@13) y@@1) (= x@@13 y@@1))))
 :qid |stdinbpl.718:18|
 :skolemid |54|
 :pattern ( (|Seq#Contains| (|Seq#Singleton| x@@13) y@@1))
)))
(assert (forall ((xs@@13 T@U) (n@@11 Int) (xs2 T@U) (n2 Int) ) (!  (=> (and (and (= (type xs@@13) (SeqType RefType)) (= (type xs2) (SeqType RefType))) (= (P02 xs@@13 n@@11) (P02 xs2 n2))) (and (= xs@@13 xs2) (= n@@11 n2)))
 :qid |stdinbpl.2135:15|
 :skolemid |193|
 :pattern ( (P02 xs@@13 n@@11) (P02 xs2 n2))
)))
(assert (forall ((arg0@@35 T@U) (arg1@@16 Int) ) (! (= (type (|P02#sm| arg0@@35 arg1@@16)) (FieldType PredicateType_P02Type (MapType1Type RefType boolType)))
 :qid |funType:P02#sm|
 :pattern ( (|P02#sm| arg0@@35 arg1@@16))
)))
(assert (forall ((xs@@14 T@U) (n@@12 Int) (xs2@@0 T@U) (n2@@0 Int) ) (!  (=> (and (and (= (type xs@@14) (SeqType RefType)) (= (type xs2@@0) (SeqType RefType))) (= (|P02#sm| xs@@14 n@@12) (|P02#sm| xs2@@0 n2@@0))) (and (= xs@@14 xs2@@0) (= n@@12 n2@@0)))
 :qid |stdinbpl.2139:15|
 :skolemid |194|
 :pattern ( (|P02#sm| xs@@14 n@@12) (|P02#sm| xs2@@0 n2@@0))
)))
(assert (forall ((x@@14 T@U) (n@@13 Int) (x2 T@U) (n2@@1 Int) ) (!  (=> (and (and (= (type x@@14) RefType) (= (type x2) RefType)) (= (P01 x@@14 n@@13) (P01 x2 n2@@1))) (and (= x@@14 x2) (= n@@13 n2@@1)))
 :qid |stdinbpl.2321:15|
 :skolemid |214|
 :pattern ( (P01 x@@14 n@@13) (P01 x2 n2@@1))
)))
(assert (forall ((arg0@@36 T@U) (arg1@@17 Int) ) (! (= (type (|P01#sm| arg0@@36 arg1@@17)) (FieldType PredicateType_P01Type (MapType1Type RefType boolType)))
 :qid |funType:P01#sm|
 :pattern ( (|P01#sm| arg0@@36 arg1@@17))
)))
(assert (forall ((x@@15 T@U) (n@@14 Int) (x2@@0 T@U) (n2@@2 Int) ) (!  (=> (and (and (= (type x@@15) RefType) (= (type x2@@0) RefType)) (= (|P01#sm| x@@15 n@@14) (|P01#sm| x2@@0 n2@@2))) (and (= x@@15 x2@@0) (= n@@14 n2@@2)))
 :qid |stdinbpl.2325:15|
 :skolemid |215|
 :pattern ( (|P01#sm| x@@15 n@@14) (|P01#sm| x2@@0 n2@@2))
)))
(assert (forall ((s@@5 T@U) (n@@15 Int) (j@@4 Int) ) (! (let ((T@@11 (SeqTypeInv0 (type s@@5))))
 (=> (= (type s@@5) (SeqType T@@11)) (=> (and (and (<= 0 j@@4) (< j@@4 n@@15)) (< j@@4 (|Seq#Length| s@@5))) (= (|Seq#Index| (|Seq#Take| s@@5 n@@15) j@@4) (|Seq#Index| s@@5 j@@4)))))
 :qid |stdinbpl.470:18|
 :skolemid |37|
 :pattern ( (|Seq#Index| (|Seq#Take| s@@5 n@@15) j@@4))
 :pattern ( (|Seq#Index| s@@5 j@@4) (|Seq#Take| s@@5 n@@15))
)))
(assert (forall ((Heap@@15 T@U) (ExhaleHeap@@2 T@U) (Mask@@4 T@U) (o_1@@0 T@U) (f_2 T@U) ) (! (let ((B@@1 (FieldTypeInv1 (type f_2))))
(let ((A@@1 (FieldTypeInv0 (type f_2))))
 (=> (and (and (and (and (and (and (= (type Heap@@15) (MapType0Type RefType)) (= (type ExhaleHeap@@2) (MapType0Type RefType))) (= (type Mask@@4) (MapType1Type RefType realType))) (= (type o_1@@0) RefType)) (= (type f_2) (FieldType A@@1 B@@1))) (IdenticalOnKnownLocations Heap@@15 ExhaleHeap@@2 Mask@@4)) (HasDirectPerm Mask@@4 o_1@@0 f_2)) (= (MapType0Select Heap@@15 o_1@@0 f_2) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2)))))
 :qid |stdinbpl.42:22|
 :skolemid |1|
 :pattern ( (IdenticalOnKnownLocations Heap@@15 ExhaleHeap@@2 Mask@@4) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2))
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
 :qid |stdinbpl.374:19|
 :skolemid |21|
 :pattern ( (InsidePredicate p v_1 p w))
)))
(assert (forall ((Heap@@16 T@U) (Mask@@5 T@U) (xs@@15 T@U) (i@@8 Int) ) (!  (=> (and (and (and (and (= (type Heap@@16) (MapType0Type RefType)) (= (type Mask@@5) (MapType1Type RefType realType))) (= (type xs@@15) (SeqType RefType))) (and (state Heap@@16 Mask@@5) (< AssumeFunctionsAbove 1))) (and (and (> (|Seq#Length| xs@@15) 6) (forall ((k Int) (j@@5 Int) ) (!  (=> (and (>= k 0) (and (< k (|Seq#Length| xs@@15)) (and (>= j@@5 0) (and (< j@@5 (|Seq#Length| xs@@15)) (not (= k j@@5)))))) (not (= (|Seq#Index| xs@@15 k) (|Seq#Index| xs@@15 j@@5))))
 :qid |stdinbpl.1063:84|
 :skolemid |86|
 :pattern ( (|Seq#Index| xs@@15 k) (|Seq#Index| xs@@15 j@@5))
))) (and (<= 0 i@@8) (< i@@8 (|Seq#Length| xs@@15))))) (= (fun03 Heap@@16 xs@@15 i@@8) (U_2_int (MapType0Select Heap@@16 (|Seq#Index| xs@@15 i@@8) f_7))))
 :qid |stdinbpl.1061:15|
 :skolemid |87|
 :pattern ( (state Heap@@16 Mask@@5) (fun03 Heap@@16 xs@@15 i@@8))
)))
(assert (forall ((Heap@@17 T@U) (Mask@@6 T@U) (xs@@16 T@U) (i@@9 Int) ) (!  (=> (and (and (and (and (= (type Heap@@17) (MapType0Type RefType)) (= (type Mask@@6) (MapType1Type RefType realType))) (= (type xs@@16) (SeqType RefType))) (and (state Heap@@17 Mask@@6) (< AssumeFunctionsAbove 0))) (and (forall ((k@@0 Int) (j@@6 Int) ) (!  (=> (and (>= k@@0 0) (and (< k@@0 (|Seq#Length| xs@@16)) (and (>= j@@6 0) (and (< j@@6 (|Seq#Length| xs@@16)) (not (= k@@0 j@@6)))))) (not (= (|Seq#Index| xs@@16 k@@0) (|Seq#Index| xs@@16 j@@6))))
 :qid |stdinbpl.1961:61|
 :skolemid |177|
 :pattern ( (|Seq#Index| xs@@16 k@@0) (|Seq#Index| xs@@16 j@@6))
)) (and (<= 0 i@@9) (< i@@9 (|Seq#Length| xs@@16))))) (= (fun08 Heap@@17 xs@@16 i@@9) (+ (U_2_int (MapType0Select Heap@@17 (|Seq#Index| xs@@16 i@@9) f_7)) 1)))
 :qid |stdinbpl.1959:15|
 :skolemid |178|
 :pattern ( (state Heap@@17 Mask@@6) (fun08 Heap@@17 xs@@16 i@@9))
)))
(assert (forall ((arg0@@37 T@U) (arg1@@18 T@U) ) (! (let ((T@@14 (SeqTypeInv0 (type arg0@@37))))
(= (type (|Seq#Append| arg0@@37 arg1@@18)) (SeqType T@@14)))
 :qid |funType:Seq#Append|
 :pattern ( (|Seq#Append| arg0@@37 arg1@@18))
)))
(assert (forall ((s0 T@U) (s1 T@U) (n@@16 Int) ) (! (let ((T@@15 (SeqTypeInv0 (type s0))))
 (=> (and (= (type s0) (SeqType T@@15)) (= (type s1) (SeqType T@@15))) (=> (and (and (and (not (= s0 (|Seq#Empty| T@@15))) (not (= s1 (|Seq#Empty| T@@15)))) (<= (|Seq#Length| s0) n@@16)) (< n@@16 (|Seq#Length| (|Seq#Append| s0 s1)))) (and (= (|Seq#Add| (|Seq#Sub| n@@16 (|Seq#Length| s0)) (|Seq#Length| s0)) n@@16) (= (|Seq#Index| (|Seq#Append| s0 s1) n@@16) (|Seq#Index| s1 (|Seq#Sub| n@@16 (|Seq#Length| s0))))))))
 :qid |stdinbpl.442:18|
 :skolemid |32|
 :pattern ( (|Seq#Index| (|Seq#Append| s0 s1) n@@16))
)))
(assert  (not (IsPredicateField f_7)))
(assert  (not (IsWandField f_7)))
(assert  (not (IsPredicateField ss)))
(assert  (not (IsWandField ss)))
(assert (forall ((Heap@@18 T@U) (ExhaleHeap@@3 T@U) (Mask@@7 T@U) ) (!  (=> (and (and (and (= (type Heap@@18) (MapType0Type RefType)) (= (type ExhaleHeap@@3) (MapType0Type RefType))) (= (type Mask@@7) (MapType1Type RefType realType))) (IdenticalOnKnownLocations Heap@@18 ExhaleHeap@@3 Mask@@7)) (succHeap Heap@@18 ExhaleHeap@@3))
 :qid |stdinbpl.83:15|
 :skolemid |10|
 :pattern ( (IdenticalOnKnownLocations Heap@@18 ExhaleHeap@@3 Mask@@7))
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
(assert (forall ((Heap2Heap@@3 T@U) (Heap1Heap@@3 T@U) (x@@16 T@U) (n@@17 Int) ) (!  (=> (and (and (and (= (type Heap2Heap@@3) (MapType0Type RefType)) (= (type Heap1Heap@@3) (MapType0Type RefType))) (= (type x@@16) RefType)) (and (=  (and (and (<= 3 (|sk_P01#condqp8| (|P01#condqp8| Heap2Heap@@3 x@@16 n@@17) (|P01#condqp8| Heap1Heap@@3 x@@16 n@@17))) (< (|sk_P01#condqp8| (|P01#condqp8| Heap2Heap@@3 x@@16 n@@17) (|P01#condqp8| Heap1Heap@@3 x@@16 n@@17)) n@@17)) (< NoPerm FullPerm))  (and (and (<= 3 (|sk_P01#condqp8| (|P01#condqp8| Heap2Heap@@3 x@@16 n@@17) (|P01#condqp8| Heap1Heap@@3 x@@16 n@@17))) (< (|sk_P01#condqp8| (|P01#condqp8| Heap2Heap@@3 x@@16 n@@17) (|P01#condqp8| Heap1Heap@@3 x@@16 n@@17)) n@@17)) (< NoPerm FullPerm))) (=> (and (and (<= 3 (|sk_P01#condqp8| (|P01#condqp8| Heap2Heap@@3 x@@16 n@@17) (|P01#condqp8| Heap1Heap@@3 x@@16 n@@17))) (< (|sk_P01#condqp8| (|P01#condqp8| Heap2Heap@@3 x@@16 n@@17) (|P01#condqp8| Heap1Heap@@3 x@@16 n@@17)) n@@17)) (< NoPerm FullPerm)) (= (U_2_int (MapType0Select Heap2Heap@@3 (|Seq#Index| (MapType0Select Heap2Heap@@3 x@@16 ss) (|sk_P01#condqp8| (|P01#condqp8| Heap2Heap@@3 x@@16 n@@17) (|P01#condqp8| Heap1Heap@@3 x@@16 n@@17))) f_7)) (U_2_int (MapType0Select Heap1Heap@@3 (|Seq#Index| (MapType0Select Heap1Heap@@3 x@@16 ss) (|sk_P01#condqp8| (|P01#condqp8| Heap2Heap@@3 x@@16 n@@17) (|P01#condqp8| Heap1Heap@@3 x@@16 n@@17))) f_7)))))) (= (|P01#condqp8| Heap2Heap@@3 x@@16 n@@17) (|P01#condqp8| Heap1Heap@@3 x@@16 n@@17)))
 :qid |stdinbpl.2352:15|
 :skolemid |218|
 :pattern ( (|P01#condqp8| Heap2Heap@@3 x@@16 n@@17) (|P01#condqp8| Heap1Heap@@3 x@@16 n@@17) (succHeapTrans Heap2Heap@@3 Heap1Heap@@3))
)))
(assert  (and (forall ((arg0@@38 Real) (arg1@@19 T@U) ) (! (= (type (ConditionalFrame arg0@@38 arg1@@19)) FrameTypeType)
 :qid |funType:ConditionalFrame|
 :pattern ( (ConditionalFrame arg0@@38 arg1@@19))
)) (= (type EmptyFrame) FrameTypeType)))
(assert (forall ((p@@0 Real) (f_6 T@U) ) (!  (=> (= (type f_6) FrameTypeType) (= (ConditionalFrame p@@0 f_6) (ite (> p@@0 0.0) f_6 EmptyFrame)))
 :qid |stdinbpl.362:15|
 :skolemid |19|
 :pattern ( (ConditionalFrame p@@0 f_6))
)))
(assert (forall ((q@min@@0 Int) (q@max@@0 Int) (j@@7 Int) ) (!  (=> (and (<= 0 j@@7) (< j@@7 (- q@max@@0 q@min@@0))) (= (U_2_int (|Seq#Index| (|Seq#Range| q@min@@0 q@max@@0) j@@7)) (+ q@min@@0 j@@7)))
 :qid |stdinbpl.733:15|
 :skolemid |56|
 :pattern ( (|Seq#Index| (|Seq#Range| q@min@@0 q@max@@0) j@@7))
)))
(assert (forall ((Heap@@19 T@U) (Mask@@8 T@U) (xs@@17 T@U) (n@@18 Int) (i@@10 Int) ) (!  (=> (and (and (and (and (= (type Heap@@19) (MapType0Type RefType)) (= (type Mask@@8) (MapType1Type RefType realType))) (= (type xs@@17) (SeqType RefType))) (and (state Heap@@19 Mask@@8) (< AssumeFunctionsAbove 3))) (and (< 0 i@@10) (< i@@10 n@@18))) (= (fun06 Heap@@19 xs@@17 n@@18 i@@10) (U_2_int (MapType0Select Heap@@19 (|Seq#Index| xs@@17 i@@10) f_7))))
 :qid |stdinbpl.1267:15|
 :skolemid |106|
 :pattern ( (state Heap@@19 Mask@@8) (fun06 Heap@@19 xs@@17 n@@18 i@@10))
 :pattern ( (state Heap@@19 Mask@@8) (|fun06#triggerStateless| xs@@17 n@@18 i@@10) (|P02#trigger| Heap@@19 (P02 xs@@17 n@@18)))
)))
(assert (forall ((Mask@@9 T@U) (o_2@@0 T@U) (f_4@@0 T@U) ) (! (let ((B@@3 (FieldTypeInv1 (type f_4@@0))))
(let ((A@@4 (FieldTypeInv0 (type f_4@@0))))
 (=> (and (and (= (type Mask@@9) (MapType1Type RefType realType)) (= (type o_2@@0) RefType)) (= (type f_4@@0) (FieldType A@@4 B@@3))) (= (HasDirectPerm Mask@@9 o_2@@0 f_4@@0) (> (U_2_real (MapType1Select Mask@@9 o_2@@0 f_4@@0)) NoPerm)))))
 :qid |stdinbpl.133:22|
 :skolemid |17|
 :pattern ( (HasDirectPerm Mask@@9 o_2@@0 f_4@@0))
)))
(assert (forall ((s0@@0 T@U) (s1@@0 T@U) ) (! (let ((T@@16 (SeqTypeInv0 (type s0@@0))))
 (=> (and (and (= (type s0@@0) (SeqType T@@16)) (= (type s1@@0) (SeqType T@@16))) (and (not (= s0@@0 (|Seq#Empty| T@@16))) (not (= s1@@0 (|Seq#Empty| T@@16))))) (= (|Seq#Length| (|Seq#Append| s0@@0 s1@@0)) (+ (|Seq#Length| s0@@0) (|Seq#Length| s1@@0)))))
 :qid |stdinbpl.411:18|
 :skolemid |26|
 :pattern ( (|Seq#Length| (|Seq#Append| s0@@0 s1@@0)))
)))
(assert (forall ((s@@6 T@U) (t T@U) (n@@19 Int) ) (! (let ((T@@17 (SeqTypeInv0 (type s@@6))))
 (=> (and (and (= (type s@@6) (SeqType T@@17)) (= (type t) (SeqType T@@17))) (and (> n@@19 0) (> n@@19 (|Seq#Length| s@@6)))) (and (= (|Seq#Add| (|Seq#Sub| n@@19 (|Seq#Length| s@@6)) (|Seq#Length| s@@6)) n@@19) (= (|Seq#Drop| (|Seq#Append| s@@6 t) n@@19) (|Seq#Drop| t (|Seq#Sub| n@@19 (|Seq#Length| s@@6)))))))
 :qid |stdinbpl.567:18|
 :skolemid |44|
 :pattern ( (|Seq#Drop| (|Seq#Append| s@@6 t) n@@19))
)))
(assert (forall ((Heap@@20 T@U) (xs@@18 T@U) (i@@11 Int) ) (!  (=> (and (= (type Heap@@20) (MapType0Type RefType)) (= (type xs@@18) (SeqType RefType))) (and (= (fun03 Heap@@20 xs@@18 i@@11) (|fun03'| Heap@@20 xs@@18 i@@11)) (dummyFunction (int_2_U (|fun03#triggerStateless| xs@@18 i@@11)))))
 :qid |stdinbpl.1051:15|
 :skolemid |84|
 :pattern ( (fun03 Heap@@20 xs@@18 i@@11))
)))
(assert (forall ((Heap@@21 T@U) (xs@@19 T@U) (j@@8 Int) ) (!  (=> (and (= (type Heap@@21) (MapType0Type RefType)) (= (type xs@@19) (SeqType RefType))) (and (= (fun07 Heap@@21 xs@@19 j@@8) (|fun07'| Heap@@21 xs@@19 j@@8)) (dummyFunction (int_2_U (|fun07#triggerStateless| xs@@19 j@@8)))))
 :qid |stdinbpl.1639:15|
 :skolemid |146|
 :pattern ( (fun07 Heap@@21 xs@@19 j@@8))
)))
(assert (forall ((Heap@@22 T@U) (xs@@20 T@U) (i@@12 Int) ) (!  (=> (and (= (type Heap@@22) (MapType0Type RefType)) (= (type xs@@20) (SeqType RefType))) (and (= (fun08 Heap@@22 xs@@20 i@@12) (|fun08'| Heap@@22 xs@@20 i@@12)) (dummyFunction (int_2_U (|fun08#triggerStateless| xs@@20 i@@12)))))
 :qid |stdinbpl.1949:15|
 :skolemid |175|
 :pattern ( (fun08 Heap@@22 xs@@20 i@@12))
)))
(assert (forall ((arg0@@39 T@U) ) (! (= (type (FrameFragment arg0@@39)) FrameTypeType)
 :qid |funType:FrameFragment|
 :pattern ( (FrameFragment arg0@@39))
)))
(assert (forall ((Heap@@23 T@U) (Mask@@10 T@U) (xs@@21 T@U) (j@@9 Int) ) (!  (=> (and (and (and (= (type Heap@@23) (MapType0Type RefType)) (= (type Mask@@10) (MapType1Type RefType realType))) (= (type xs@@21) (SeqType RefType))) (state Heap@@23 Mask@@10)) (= (|fun07'| Heap@@23 xs@@21 j@@9) (|fun07#frame| (FrameFragment (int_2_U (|fun07#condqp9| Heap@@23 xs@@21 j@@9))) xs@@21 j@@9)))
 :qid |stdinbpl.1659:15|
 :skolemid |150|
 :pattern ( (state Heap@@23 Mask@@10) (|fun07'| Heap@@23 xs@@21 j@@9))
)))
(assert (forall ((Heap@@24 T@U) (Mask@@11 T@U) (xs@@22 T@U) (i@@13 Int) ) (!  (=> (and (and (and (= (type Heap@@24) (MapType0Type RefType)) (= (type Mask@@11) (MapType1Type RefType realType))) (= (type xs@@22) (SeqType RefType))) (state Heap@@24 Mask@@11)) (= (|fun08'| Heap@@24 xs@@22 i@@13) (|fun08#frame| (FrameFragment (int_2_U (|fun08#condqp10| Heap@@24 xs@@22 i@@13))) xs@@22 i@@13)))
 :qid |stdinbpl.1969:15|
 :skolemid |179|
 :pattern ( (state Heap@@24 Mask@@11) (|fun08'| Heap@@24 xs@@22 i@@13))
)))
(assert (forall ((o_2@@1 T@U) (f_4@@1 T@U) ) (! (let ((B@@4 (FieldTypeInv1 (type f_4@@1))))
(let ((A@@5 (FieldTypeInv0 (type f_4@@1))))
 (=> (and (= (type o_2@@1) RefType) (= (type f_4@@1) (FieldType A@@5 B@@4))) (= (U_2_real (MapType1Select ZeroMask o_2@@1 f_4@@1)) NoPerm))))
 :qid |stdinbpl.106:22|
 :skolemid |13|
 :pattern ( (MapType1Select ZeroMask o_2@@1 f_4@@1))
)))
(assert (forall ((Heap@@25 T@U) (Mask@@12 T@U) (xs@@23 T@U) (n@@20 Int) (i@@14 Int) ) (!  (=> (and (and (and (= (type Heap@@25) (MapType0Type RefType)) (= (type Mask@@12) (MapType1Type RefType realType))) (= (type xs@@23) (SeqType RefType))) (state Heap@@25 Mask@@12)) (= (|fun06'| Heap@@25 xs@@23 n@@20 i@@14) (|fun06#frame| (MapType0Select Heap@@25 null (P02 xs@@23 n@@20)) xs@@23 n@@20 i@@14)))
 :qid |stdinbpl.1274:15|
 :skolemid |107|
 :pattern ( (state Heap@@25 Mask@@12) (|fun06'| Heap@@25 xs@@23 n@@20 i@@14))
)))
(assert (forall ((Heap@@26 T@U) (Mask@@13 T@U) (x@@17 T@U) (n@@21 Int) (i@@15 Int) ) (!  (=> (and (and (and (= (type Heap@@26) (MapType0Type RefType)) (= (type Mask@@13) (MapType1Type RefType realType))) (= (type x@@17) RefType)) (state Heap@@26 Mask@@13)) (= (|fun04'| Heap@@26 x@@17 n@@21 i@@15) (|fun04#frame| (MapType0Select Heap@@26 null (P01 x@@17 n@@21)) x@@17 n@@21 i@@15)))
 :qid |stdinbpl.1461:15|
 :skolemid |128|
 :pattern ( (state Heap@@26 Mask@@13) (|fun04'| Heap@@26 x@@17 n@@21 i@@15))
)))
(assert (forall ((s@@7 T@U) (t@@0 T@U) (n@@22 Int) ) (! (let ((T@@18 (SeqTypeInv0 (type s@@7))))
 (=> (and (and (= (type s@@7) (SeqType T@@18)) (= (type t@@0) (SeqType T@@18))) (and (> n@@22 0) (> n@@22 (|Seq#Length| s@@7)))) (and (= (|Seq#Add| (|Seq#Sub| n@@22 (|Seq#Length| s@@7)) (|Seq#Length| s@@7)) n@@22) (= (|Seq#Take| (|Seq#Append| s@@7 t@@0) n@@22) (|Seq#Append| s@@7 (|Seq#Take| t@@0 (|Seq#Sub| n@@22 (|Seq#Length| s@@7))))))))
 :qid |stdinbpl.554:18|
 :skolemid |42|
 :pattern ( (|Seq#Take| (|Seq#Append| s@@7 t@@0) n@@22))
)))
(assert (forall ((q@min@@1 Int) (q@max@@1 Int) ) (!  (and (=> (< q@min@@1 q@max@@1) (= (|Seq#Length| (|Seq#Range| q@min@@1 q@max@@1)) (- q@max@@1 q@min@@1))) (=> (<= q@max@@1 q@min@@1) (= (|Seq#Length| (|Seq#Range| q@min@@1 q@max@@1)) 0)))
 :qid |stdinbpl.732:15|
 :skolemid |55|
 :pattern ( (|Seq#Length| (|Seq#Range| q@min@@1 q@max@@1)))
)))
(assert (forall ((Heap2Heap@@4 T@U) (Heap1Heap@@4 T@U) (xs@@24 T@U) (n@@23 Int) ) (!  (=> (and (and (and (= (type Heap2Heap@@4) (MapType0Type RefType)) (= (type Heap1Heap@@4) (MapType0Type RefType))) (= (type xs@@24) (SeqType RefType))) (and (=  (and (and (<= 3 (|sk_P02#condqp6| (|P02#condqp6| Heap2Heap@@4 xs@@24 n@@23) (|P02#condqp6| Heap1Heap@@4 xs@@24 n@@23))) (< (|sk_P02#condqp6| (|P02#condqp6| Heap2Heap@@4 xs@@24 n@@23) (|P02#condqp6| Heap1Heap@@4 xs@@24 n@@23)) n@@23)) (< NoPerm FullPerm))  (and (and (<= 3 (|sk_P02#condqp6| (|P02#condqp6| Heap2Heap@@4 xs@@24 n@@23) (|P02#condqp6| Heap1Heap@@4 xs@@24 n@@23))) (< (|sk_P02#condqp6| (|P02#condqp6| Heap2Heap@@4 xs@@24 n@@23) (|P02#condqp6| Heap1Heap@@4 xs@@24 n@@23)) n@@23)) (< NoPerm FullPerm))) (=> (and (and (<= 3 (|sk_P02#condqp6| (|P02#condqp6| Heap2Heap@@4 xs@@24 n@@23) (|P02#condqp6| Heap1Heap@@4 xs@@24 n@@23))) (< (|sk_P02#condqp6| (|P02#condqp6| Heap2Heap@@4 xs@@24 n@@23) (|P02#condqp6| Heap1Heap@@4 xs@@24 n@@23)) n@@23)) (< NoPerm FullPerm)) (= (U_2_int (MapType0Select Heap2Heap@@4 (|Seq#Index| xs@@24 (|sk_P02#condqp6| (|P02#condqp6| Heap2Heap@@4 xs@@24 n@@23) (|P02#condqp6| Heap1Heap@@4 xs@@24 n@@23))) f_7)) (U_2_int (MapType0Select Heap1Heap@@4 (|Seq#Index| xs@@24 (|sk_P02#condqp6| (|P02#condqp6| Heap2Heap@@4 xs@@24 n@@23) (|P02#condqp6| Heap1Heap@@4 xs@@24 n@@23))) f_7)))))) (= (|P02#condqp6| Heap2Heap@@4 xs@@24 n@@23) (|P02#condqp6| Heap1Heap@@4 xs@@24 n@@23)))
 :qid |stdinbpl.2166:15|
 :skolemid |197|
 :pattern ( (|P02#condqp6| Heap2Heap@@4 xs@@24 n@@23) (|P02#condqp6| Heap1Heap@@4 xs@@24 n@@23) (succHeapTrans Heap2Heap@@4 Heap1Heap@@4))
)))
(assert (forall ((a T@U) (b T@U) ) (! (let ((T@@19 (SeqTypeInv0 (type a))))
 (=> (and (and (= (type a) (SeqType T@@19)) (= (type b) (SeqType T@@19))) (|Seq#Equal| a b)) (= a b)))
 :qid |stdinbpl.705:18|
 :skolemid |53|
 :pattern ( (|Seq#Equal| a b))
)))
(assert (forall ((Heap@@27 T@U) (xs@@25 T@U) (n@@24 Int) (i@@16 Int) ) (!  (=> (and (= (type Heap@@27) (MapType0Type RefType)) (= (type xs@@25) (SeqType RefType))) (and (= (fun06 Heap@@27 xs@@25 n@@24 i@@16) (|fun06'| Heap@@27 xs@@25 n@@24 i@@16)) (dummyFunction (int_2_U (|fun06#triggerStateless| xs@@25 n@@24 i@@16)))))
 :qid |stdinbpl.1257:15|
 :skolemid |104|
 :pattern ( (fun06 Heap@@27 xs@@25 n@@24 i@@16))
)))
(assert (forall ((Heap@@28 T@U) (x@@18 T@U) (n@@25 Int) (i@@17 Int) ) (!  (=> (and (= (type Heap@@28) (MapType0Type RefType)) (= (type x@@18) RefType)) (and (= (fun04 Heap@@28 x@@18 n@@25 i@@17) (|fun04'| Heap@@28 x@@18 n@@25 i@@17)) (dummyFunction (int_2_U (|fun04#triggerStateless| x@@18 n@@25 i@@17)))))
 :qid |stdinbpl.1444:15|
 :skolemid |125|
 :pattern ( (fun04 Heap@@28 x@@18 n@@25 i@@17))
)))
(assert (forall ((s@@8 T@U) (i@@18 Int) ) (! (let ((T@@20 (SeqTypeInv0 (type s@@8))))
 (=> (= (type s@@8) (SeqType T@@20)) (=> (and (<= 0 i@@18) (< i@@18 (|Seq#Length| s@@8))) (|Seq#ContainsTrigger| s@@8 (|Seq#Index| s@@8 i@@18)))))
 :qid |stdinbpl.598:18|
 :skolemid |49|
 :pattern ( (|Seq#Index| s@@8 i@@18))
)))
(assert (forall ((s0@@1 T@U) (s1@@1 T@U) ) (! (let ((T@@21 (SeqTypeInv0 (type s0@@1))))
 (=> (and (= (type s0@@1) (SeqType T@@21)) (= (type s1@@1) (SeqType T@@21))) (and (=> (= s0@@1 (|Seq#Empty| T@@21)) (= (|Seq#Append| s0@@1 s1@@1) s1@@1)) (=> (= s1@@1 (|Seq#Empty| T@@21)) (= (|Seq#Append| s0@@1 s1@@1) s0@@1)))))
 :qid |stdinbpl.417:18|
 :skolemid |27|
 :pattern ( (|Seq#Append| s0@@1 s1@@1))
)))
(assert (forall ((Heap@@29 T@U) (Mask@@14 T@U) (xs@@26 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@29) (MapType0Type RefType)) (= (type Mask@@14) (MapType1Type RefType realType))) (= (type xs@@26) (SeqType RefType))) (and (state Heap@@29 Mask@@14) (< AssumeFunctionsAbove 2))) (and (forall ((i@@19 Int) (j@@10 Int) ) (!  (=> (and (>= i@@19 0) (and (< i@@19 (|Seq#Length| xs@@26)) (and (>= j@@10 0) (and (< j@@10 (|Seq#Length| xs@@26)) (not (= i@@19 j@@10)))))) (not (= (|Seq#Index| xs@@26 i@@19) (|Seq#Index| xs@@26 j@@10))))
 :qid |stdinbpl.915:61|
 :skolemid |73|
 :pattern ( (|Seq#Index| xs@@26 i@@19) (|Seq#Index| xs@@26 j@@10))
)) (> (|Seq#Length| xs@@26) 3))) (= (fun02 Heap@@29 xs@@26) (+ (U_2_int (MapType0Select Heap@@29 (|Seq#Index| xs@@26 0) f_7)) (U_2_int (MapType0Select Heap@@29 (|Seq#Index| xs@@26 1) f_7)))))
 :qid |stdinbpl.913:15|
 :skolemid |74|
 :pattern ( (state Heap@@29 Mask@@14) (fun02 Heap@@29 xs@@26))
)))
(assert (forall ((t@@1 T@U) ) (! (= (|Seq#Index| (|Seq#Singleton| t@@1) 0) t@@1)
 :qid |stdinbpl.421:18|
 :skolemid |28|
 :pattern ( (|Seq#Singleton| t@@1))
)))
(assert (forall ((s@@9 T@U) ) (! (let ((T@@22 (SeqTypeInv0 (type s@@9))))
 (=> (= (type s@@9) (SeqType T@@22)) (<= 0 (|Seq#Length| s@@9))))
 :qid |stdinbpl.400:18|
 :skolemid |22|
 :pattern ( (|Seq#Length| s@@9))
)))
(assert (forall ((Heap@@30 T@U) (Mask@@15 T@U) (xs@@27 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@30) (MapType0Type RefType)) (= (type Mask@@15) (MapType1Type RefType realType))) (= (type xs@@27) (SeqType RefType))) (and (state Heap@@30 Mask@@15) (< AssumeFunctionsAbove 4))) (and (forall ((i@@20 Int) (j@@11 Int) ) (!  (=> (and (>= i@@20 0) (and (< i@@20 (|Seq#Length| xs@@27)) (and (>= j@@11 0) (and (< j@@11 (|Seq#Length| xs@@27)) (not (= i@@20 j@@11)))))) (not (= (|Seq#Index| xs@@27 i@@20) (|Seq#Index| xs@@27 j@@11))))
 :qid |stdinbpl.771:61|
 :skolemid |60|
 :pattern ( (|Seq#Index| xs@@27 i@@20) (|Seq#Index| xs@@27 j@@11))
)) (> (|Seq#Length| xs@@27) 3))) (= (fun01 Heap@@30 xs@@27) (U_2_int (MapType0Select Heap@@30 (|Seq#Index| xs@@27 0) f_7))))
 :qid |stdinbpl.769:15|
 :skolemid |61|
 :pattern ( (state Heap@@30 Mask@@15) (fun01 Heap@@30 xs@@27))
)))
(assert (forall ((xs@@28 T@U) (n@@26 Int) ) (!  (=> (= (type xs@@28) (SeqType RefType)) (= (getPredWandId (P02 xs@@28 n@@26)) 0))
 :qid |stdinbpl.2129:15|
 :skolemid |192|
 :pattern ( (P02 xs@@28 n@@26))
)))
(assert (forall ((x@@19 T@U) (n@@27 Int) ) (!  (=> (= (type x@@19) RefType) (= (getPredWandId (P01 x@@19 n@@27)) 1))
 :qid |stdinbpl.2315:15|
 :skolemid |213|
 :pattern ( (P01 x@@19 n@@27))
)))
(assert (forall ((s0@@2 T@U) (s1@@2 T@U) ) (! (let ((T@@23 (SeqTypeInv0 (type s0@@2))))
 (=> (and (and (= (type s0@@2) (SeqType T@@23)) (= (type s1@@2) (SeqType T@@23))) (|Seq#Equal| s0@@2 s1@@2)) (and (= (|Seq#Length| s0@@2) (|Seq#Length| s1@@2)) (forall ((j@@12 Int) ) (!  (=> (and (<= 0 j@@12) (< j@@12 (|Seq#Length| s0@@2))) (= (|Seq#Index| s0@@2 j@@12) (|Seq#Index| s1@@2 j@@12)))
 :qid |stdinbpl.695:13|
 :skolemid |50|
 :pattern ( (|Seq#Index| s0@@2 j@@12))
 :pattern ( (|Seq#Index| s1@@2 j@@12))
)))))
 :qid |stdinbpl.692:18|
 :skolemid |51|
 :pattern ( (|Seq#Equal| s0@@2 s1@@2))
)))
(assert (forall ((Heap@@31 T@U) (ExhaleHeap@@4 T@U) (Mask@@16 T@U) (pm_f@@1 T@U) ) (! (let ((C@@1 (FieldTypeInv0 (type pm_f@@1))))
 (=> (and (and (and (and (and (= (type Heap@@31) (MapType0Type RefType)) (= (type ExhaleHeap@@4) (MapType0Type RefType))) (= (type Mask@@16) (MapType1Type RefType realType))) (= (type pm_f@@1) (FieldType C@@1 FrameTypeType))) (IdenticalOnKnownLocations Heap@@31 ExhaleHeap@@4 Mask@@16)) (and (HasDirectPerm Mask@@16 null pm_f@@1) (IsPredicateField pm_f@@1))) (forall ((o2 T@U) (f_2@@0 T@U) ) (! (let ((B@@5 (FieldTypeInv1 (type f_2@@0))))
(let ((A@@6 (FieldTypeInv0 (type f_2@@0))))
 (=> (and (and (= (type o2) RefType) (= (type f_2@@0) (FieldType A@@6 B@@5))) (U_2_bool (MapType1Select (MapType0Select Heap@@31 null (PredicateMaskField pm_f@@1)) o2 f_2@@0))) (= (MapType0Select Heap@@31 o2 f_2@@0) (MapType0Select ExhaleHeap@@4 o2 f_2@@0)))))
 :qid |stdinbpl.54:134|
 :skolemid |3|
 :pattern ( (MapType0Select ExhaleHeap@@4 o2 f_2@@0))
))))
 :qid |stdinbpl.52:19|
 :skolemid |4|
 :pattern ( (IdenticalOnKnownLocations Heap@@31 ExhaleHeap@@4 Mask@@16) (IsPredicateField pm_f@@1))
)))
(assert (forall ((Heap@@32 T@U) (ExhaleHeap@@5 T@U) (Mask@@17 T@U) (pm_f@@2 T@U) ) (! (let ((C@@2 (FieldTypeInv0 (type pm_f@@2))))
 (=> (and (and (and (and (and (= (type Heap@@32) (MapType0Type RefType)) (= (type ExhaleHeap@@5) (MapType0Type RefType))) (= (type Mask@@17) (MapType1Type RefType realType))) (= (type pm_f@@2) (FieldType C@@2 FrameTypeType))) (IdenticalOnKnownLocations Heap@@32 ExhaleHeap@@5 Mask@@17)) (and (HasDirectPerm Mask@@17 null pm_f@@2) (IsWandField pm_f@@2))) (forall ((o2@@0 T@U) (f_2@@1 T@U) ) (! (let ((B@@6 (FieldTypeInv1 (type f_2@@1))))
(let ((A@@7 (FieldTypeInv0 (type f_2@@1))))
 (=> (and (and (= (type o2@@0) RefType) (= (type f_2@@1) (FieldType A@@7 B@@6))) (U_2_bool (MapType1Select (MapType0Select Heap@@32 null (WandMaskField pm_f@@2)) o2@@0 f_2@@1))) (= (MapType0Select Heap@@32 o2@@0 f_2@@1) (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1)))))
 :qid |stdinbpl.67:129|
 :skolemid |6|
 :pattern ( (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1))
))))
 :qid |stdinbpl.65:19|
 :skolemid |7|
 :pattern ( (IdenticalOnKnownLocations Heap@@32 ExhaleHeap@@5 Mask@@17) (IsWandField pm_f@@2))
)))
(assert (forall ((t@@2 T@U) ) (! (= (|Seq#Length| (|Seq#Singleton| t@@2)) 1)
 :qid |stdinbpl.408:18|
 :skolemid |25|
 :pattern ( (|Seq#Singleton| t@@2))
)))
(assert (forall ((Mask@@18 T@U) (o_2@@2 T@U) (f_4@@2 T@U) ) (! (let ((B@@7 (FieldTypeInv1 (type f_4@@2))))
(let ((A@@8 (FieldTypeInv0 (type f_4@@2))))
 (=> (and (and (and (= (type Mask@@18) (MapType1Type RefType realType)) (= (type o_2@@2) RefType)) (= (type f_4@@2) (FieldType A@@8 B@@7))) (GoodMask Mask@@18)) (and (>= (U_2_real (MapType1Select Mask@@18 o_2@@2 f_4@@2)) NoPerm) (=> (and (and (GoodMask Mask@@18) (not (IsPredicateField f_4@@2))) (not (IsWandField f_4@@2))) (<= (U_2_real (MapType1Select Mask@@18 o_2@@2 f_4@@2)) FullPerm))))))
 :qid |stdinbpl.128:22|
 :skolemid |16|
 :pattern ( (GoodMask Mask@@18) (MapType1Select Mask@@18 o_2@@2 f_4@@2))
)))
(assert (forall ((o T@U) (f T@U) (Heap@@33 T@U) ) (!  (=> (and (and (and (= (type o) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap@@33) (MapType0Type RefType))) (U_2_bool (MapType0Select Heap@@33 o $allocated))) (U_2_bool (MapType0Select Heap@@33 (MapType0Select Heap@@33 o f) $allocated)))
 :qid |stdinbpl.31:15|
 :skolemid |0|
 :pattern ( (MapType0Select Heap@@33 o f))
)))
(assert (forall ((xs@@29 T@U) (n@@28 Int) ) (!  (=> (= (type xs@@29) (SeqType RefType)) (= (PredicateMaskField (P02 xs@@29 n@@28)) (|P02#sm| xs@@29 n@@28)))
 :qid |stdinbpl.2121:15|
 :skolemid |190|
 :pattern ( (PredicateMaskField (P02 xs@@29 n@@28)))
)))
(assert (forall ((x@@20 T@U) (n@@29 Int) ) (!  (=> (= (type x@@20) RefType) (= (PredicateMaskField (P01 x@@20 n@@29)) (|P01#sm| x@@20 n@@29)))
 :qid |stdinbpl.2307:15|
 :skolemid |211|
 :pattern ( (PredicateMaskField (P01 x@@20 n@@29)))
)))
(assert (forall ((s@@10 T@U) (t@@3 T@U) (n@@30 Int) ) (! (let ((T@@24 (SeqTypeInv0 (type s@@10))))
 (=> (and (and (= (type s@@10) (SeqType T@@24)) (= (type t@@3) (SeqType T@@24))) (and (< 0 n@@30) (<= n@@30 (|Seq#Length| s@@10)))) (= (|Seq#Take| (|Seq#Append| s@@10 t@@3) n@@30) (|Seq#Take| s@@10 n@@30))))
 :qid |stdinbpl.550:18|
 :skolemid |41|
 :pattern ( (|Seq#Take| (|Seq#Append| s@@10 t@@3) n@@30))
)))
(assert (forall ((s@@11 T@U) (i@@21 Int) (v@@1 T@U) ) (! (let ((T@@25 (type v@@1)))
 (=> (= (type s@@11) (SeqType T@@25)) (=> (and (<= 0 i@@21) (< i@@21 (|Seq#Length| s@@11))) (= (|Seq#Length| (|Seq#Update| s@@11 i@@21 v@@1)) (|Seq#Length| s@@11)))))
 :qid |stdinbpl.449:18|
 :skolemid |34|
 :pattern ( (|Seq#Length| (|Seq#Update| s@@11 i@@21 v@@1)))
 :pattern ( (|Seq#Length| s@@11) (|Seq#Update| s@@11 i@@21 v@@1))
)))
(assert (forall ((Heap2Heap@@5 T@U) (Heap1Heap@@5 T@U) (x@@21 T@U) (n@@31 Int) ) (!  (=> (and (and (and (= (type Heap2Heap@@5) (MapType0Type RefType)) (= (type Heap1Heap@@5) (MapType0Type RefType))) (= (type x@@21) RefType)) (and (=  (and (and (<= 0 (|sk_P01#condqp7| (|P01#condqp7| Heap2Heap@@5 x@@21 n@@31) (|P01#condqp7| Heap1Heap@@5 x@@21 n@@31))) (< (|sk_P01#condqp7| (|P01#condqp7| Heap2Heap@@5 x@@21 n@@31) (|P01#condqp7| Heap1Heap@@5 x@@21 n@@31)) 3)) (< NoPerm FullPerm))  (and (and (<= 0 (|sk_P01#condqp7| (|P01#condqp7| Heap2Heap@@5 x@@21 n@@31) (|P01#condqp7| Heap1Heap@@5 x@@21 n@@31))) (< (|sk_P01#condqp7| (|P01#condqp7| Heap2Heap@@5 x@@21 n@@31) (|P01#condqp7| Heap1Heap@@5 x@@21 n@@31)) 3)) (< NoPerm FullPerm))) (=> (and (and (<= 0 (|sk_P01#condqp7| (|P01#condqp7| Heap2Heap@@5 x@@21 n@@31) (|P01#condqp7| Heap1Heap@@5 x@@21 n@@31))) (< (|sk_P01#condqp7| (|P01#condqp7| Heap2Heap@@5 x@@21 n@@31) (|P01#condqp7| Heap1Heap@@5 x@@21 n@@31)) 3)) (< NoPerm FullPerm)) (= (U_2_int (MapType0Select Heap2Heap@@5 (|Seq#Index| (MapType0Select Heap2Heap@@5 x@@21 ss) (|sk_P01#condqp7| (|P01#condqp7| Heap2Heap@@5 x@@21 n@@31) (|P01#condqp7| Heap1Heap@@5 x@@21 n@@31))) f_7)) (U_2_int (MapType0Select Heap1Heap@@5 (|Seq#Index| (MapType0Select Heap1Heap@@5 x@@21 ss) (|sk_P01#condqp7| (|P01#condqp7| Heap2Heap@@5 x@@21 n@@31) (|P01#condqp7| Heap1Heap@@5 x@@21 n@@31))) f_7)))))) (= (|P01#condqp7| Heap2Heap@@5 x@@21 n@@31) (|P01#condqp7| Heap1Heap@@5 x@@21 n@@31)))
 :qid |stdinbpl.2341:15|
 :skolemid |217|
 :pattern ( (|P01#condqp7| Heap2Heap@@5 x@@21 n@@31) (|P01#condqp7| Heap1Heap@@5 x@@21 n@@31) (succHeapTrans Heap2Heap@@5 Heap1Heap@@5))
)))
(assert (forall ((Heap@@34 T@U) (Mask@@19 T@U) (xs@@30 T@U) (j@@13 Int) ) (!  (=> (and (and (and (and (= (type Heap@@34) (MapType0Type RefType)) (= (type Mask@@19) (MapType1Type RefType realType))) (= (type xs@@30) (SeqType RefType))) (and (state Heap@@34 Mask@@19) (or (< AssumeFunctionsAbove 6) (|fun07#trigger| (FrameFragment (int_2_U (|fun07#condqp9| Heap@@34 xs@@30 j@@13))) xs@@30 j@@13)))) (forall ((k_1_1 Int) (i_3 Int) ) (!  (=> (and (>= k_1_1 0) (and (< k_1_1 (|Seq#Length| xs@@30)) (and (>= i_3 0) (and (< i_3 (|Seq#Length| xs@@30)) (not (= k_1_1 i_3)))))) (not (= (|Seq#Index| xs@@30 k_1_1) (|Seq#Index| xs@@30 i_3))))
 :qid |stdinbpl.1677:130|
 :skolemid |152|
 :pattern ( (|Seq#Index| xs@@30 k_1_1) (|Seq#Index| xs@@30 i_3))
))) (>= (|fun07'| Heap@@34 xs@@30 j@@13) 0))
 :qid |stdinbpl.1675:15|
 :skolemid |153|
 :pattern ( (state Heap@@34 Mask@@19) (|fun07'| Heap@@34 xs@@30 j@@13))
)))
(assert (forall ((s@@12 T@U) (t@@4 T@U) (n@@32 Int) ) (! (let ((T@@26 (SeqTypeInv0 (type s@@12))))
 (=> (and (and (= (type s@@12) (SeqType T@@26)) (= (type t@@4) (SeqType T@@26))) (and (< 0 n@@32) (<= n@@32 (|Seq#Length| s@@12)))) (= (|Seq#Drop| (|Seq#Append| s@@12 t@@4) n@@32) (|Seq#Append| (|Seq#Drop| s@@12 n@@32) t@@4))))
 :qid |stdinbpl.563:18|
 :skolemid |43|
 :pattern ( (|Seq#Drop| (|Seq#Append| s@@12 t@@4) n@@32))
)))
(assert (forall ((s@@13 T@U) (n@@33 Int) (i@@22 Int) ) (! (let ((T@@27 (SeqTypeInv0 (type s@@13))))
 (=> (= (type s@@13) (SeqType T@@27)) (=> (and (and (< 0 n@@33) (<= n@@33 i@@22)) (< i@@22 (|Seq#Length| s@@13))) (and (= (|Seq#Add| (|Seq#Sub| i@@22 n@@33) n@@33) i@@22) (= (|Seq#Index| (|Seq#Drop| s@@13 n@@33) (|Seq#Sub| i@@22 n@@33)) (|Seq#Index| s@@13 i@@22))))))
 :qid |stdinbpl.500:18|
 :skolemid |40|
 :pattern ( (|Seq#Drop| s@@13 n@@33) (|Seq#Index| s@@13 i@@22))
)))
(assert (forall ((Heap@@35 T@U) (Mask@@20 T@U) (xs@@31 T@U) ) (!  (=> (and (and (and (= (type Heap@@35) (MapType0Type RefType)) (= (type Mask@@20) (MapType1Type RefType realType))) (= (type xs@@31) (SeqType RefType))) (state Heap@@35 Mask@@20)) (= (|fun01'| Heap@@35 xs@@31) (|fun01#frame| (FrameFragment (int_2_U (|fun01#condqp1| Heap@@35 xs@@31))) xs@@31)))
 :qid |stdinbpl.779:15|
 :skolemid |62|
 :pattern ( (state Heap@@35 Mask@@20) (|fun01'| Heap@@35 xs@@31))
)))
(assert (forall ((Heap@@36 T@U) (Mask@@21 T@U) (xs@@32 T@U) ) (!  (=> (and (and (and (= (type Heap@@36) (MapType0Type RefType)) (= (type Mask@@21) (MapType1Type RefType realType))) (= (type xs@@32) (SeqType RefType))) (state Heap@@36 Mask@@21)) (= (|fun02'| Heap@@36 xs@@32) (|fun02#frame| (FrameFragment (int_2_U (|fun02#condqp2| Heap@@36 xs@@32))) xs@@32)))
 :qid |stdinbpl.923:15|
 :skolemid |75|
 :pattern ( (state Heap@@36 Mask@@21) (|fun02'| Heap@@36 xs@@32))
)))
(assert (forall ((s0@@3 T@U) (s1@@3 T@U) (n@@34 Int) ) (! (let ((T@@28 (SeqTypeInv0 (type s0@@3))))
 (=> (and (= (type s0@@3) (SeqType T@@28)) (= (type s1@@3) (SeqType T@@28))) (=> (and (and (and (not (= s0@@3 (|Seq#Empty| T@@28))) (not (= s1@@3 (|Seq#Empty| T@@28)))) (<= 0 n@@34)) (< n@@34 (|Seq#Length| s0@@3))) (= (|Seq#Index| (|Seq#Append| s0@@3 s1@@3) n@@34) (|Seq#Index| s0@@3 n@@34)))))
 :qid |stdinbpl.440:18|
 :skolemid |31|
 :pattern ( (|Seq#Index| (|Seq#Append| s0@@3 s1@@3) n@@34))
 :pattern ( (|Seq#Index| s0@@3 n@@34) (|Seq#Append| s0@@3 s1@@3))
)))
(assert (forall ((Heap@@37 T@U) (o@@0 T@U) (f_3 T@U) (v@@2 T@U) ) (! (let ((B@@8 (type v@@2)))
(let ((A@@9 (FieldTypeInv0 (type f_3))))
 (=> (and (and (= (type Heap@@37) (MapType0Type RefType)) (= (type o@@0) RefType)) (= (type f_3) (FieldType A@@9 B@@8))) (succHeap Heap@@37 (MapType0Store Heap@@37 o@@0 f_3 v@@2)))))
 :qid |stdinbpl.78:22|
 :skolemid |9|
 :pattern ( (MapType0Store Heap@@37 o@@0 f_3 v@@2))
)))
(assert (forall ((Heap2Heap@@6 T@U) (Heap1Heap@@6 T@U) (xs@@33 T@U) (i@@23 Int) ) (!  (=> (and (and (and (= (type Heap2Heap@@6) (MapType0Type RefType)) (= (type Heap1Heap@@6) (MapType0Type RefType))) (= (type xs@@33) (SeqType RefType))) (and (=  (and (and (<= 3 (|sk_fun03#condqp4| (|fun03#condqp4| Heap2Heap@@6 xs@@33 i@@23) (|fun03#condqp4| Heap1Heap@@6 xs@@33 i@@23))) (< (|sk_fun03#condqp4| (|fun03#condqp4| Heap2Heap@@6 xs@@33 i@@23) (|fun03#condqp4| Heap1Heap@@6 xs@@33 i@@23)) (|Seq#Length| xs@@33))) (< NoPerm FullPerm))  (and (and (<= 3 (|sk_fun03#condqp4| (|fun03#condqp4| Heap2Heap@@6 xs@@33 i@@23) (|fun03#condqp4| Heap1Heap@@6 xs@@33 i@@23))) (< (|sk_fun03#condqp4| (|fun03#condqp4| Heap2Heap@@6 xs@@33 i@@23) (|fun03#condqp4| Heap1Heap@@6 xs@@33 i@@23)) (|Seq#Length| xs@@33))) (< NoPerm FullPerm))) (=> (and (and (<= 3 (|sk_fun03#condqp4| (|fun03#condqp4| Heap2Heap@@6 xs@@33 i@@23) (|fun03#condqp4| Heap1Heap@@6 xs@@33 i@@23))) (< (|sk_fun03#condqp4| (|fun03#condqp4| Heap2Heap@@6 xs@@33 i@@23) (|fun03#condqp4| Heap1Heap@@6 xs@@33 i@@23)) (|Seq#Length| xs@@33))) (< NoPerm FullPerm)) (= (U_2_int (MapType0Select Heap2Heap@@6 (|Seq#Index| xs@@33 (|sk_fun03#condqp4| (|fun03#condqp4| Heap2Heap@@6 xs@@33 i@@23) (|fun03#condqp4| Heap1Heap@@6 xs@@33 i@@23))) f_7)) (U_2_int (MapType0Select Heap1Heap@@6 (|Seq#Index| xs@@33 (|sk_fun03#condqp4| (|fun03#condqp4| Heap2Heap@@6 xs@@33 i@@23) (|fun03#condqp4| Heap1Heap@@6 xs@@33 i@@23))) f_7)))))) (= (|fun03#condqp4| Heap2Heap@@6 xs@@33 i@@23) (|fun03#condqp4| Heap1Heap@@6 xs@@33 i@@23)))
 :qid |stdinbpl.1091:15|
 :skolemid |90|
 :pattern ( (|fun03#condqp4| Heap2Heap@@6 xs@@33 i@@23) (|fun03#condqp4| Heap1Heap@@6 xs@@33 i@@23) (succHeapTrans Heap2Heap@@6 Heap1Heap@@6))
)))
(assert (forall ((s0@@4 T@U) (s1@@4 T@U) (m@@7 Int) ) (! (let ((T@@29 (SeqTypeInv0 (type s0@@4))))
 (=> (and (= (type s0@@4) (SeqType T@@29)) (= (type s1@@4) (SeqType T@@29))) (=> (and (and (and (not (= s0@@4 (|Seq#Empty| T@@29))) (not (= s1@@4 (|Seq#Empty| T@@29)))) (<= 0 m@@7)) (< m@@7 (|Seq#Length| s1@@4))) (and (= (|Seq#Sub| (|Seq#Add| m@@7 (|Seq#Length| s0@@4)) (|Seq#Length| s0@@4)) m@@7) (= (|Seq#Index| (|Seq#Append| s0@@4 s1@@4) (|Seq#Add| m@@7 (|Seq#Length| s0@@4))) (|Seq#Index| s1@@4 m@@7))))))
 :qid |stdinbpl.445:18|
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
(assert (forall ((Heap@@38 T@U) (Mask@@22 T@U) (xs@@34 T@U) (j@@14 Int) ) (!  (=> (and (and (and (and (= (type Heap@@38) (MapType0Type RefType)) (= (type Mask@@22) (MapType1Type RefType realType))) (= (type xs@@34) (SeqType RefType))) (and (state Heap@@38 Mask@@22) (< AssumeFunctionsAbove 6))) (forall ((k@@1 Int) (i@@24 Int) ) (!  (=> (and (>= k@@1 0) (and (< k@@1 (|Seq#Length| xs@@34)) (and (>= i@@24 0) (and (< i@@24 (|Seq#Length| xs@@34)) (not (= k@@1 i@@24)))))) (not (= (|Seq#Index| xs@@34 k@@1) (|Seq#Index| xs@@34 i@@24))))
 :qid |stdinbpl.1651:61|
 :skolemid |148|
 :pattern ( (|Seq#Index| xs@@34 k@@1) (|Seq#Index| xs@@34 i@@24))
))) (= (fun07 Heap@@38 xs@@34 j@@14) (ite (< j@@14 0) (|fun07'| Heap@@38 xs@@34 (+ j@@14 1)) (ite (<= (|Seq#Length| xs@@34) j@@14) (|fun07'| Heap@@38 xs@@34 (- j@@14 1)) (* (U_2_int (MapType0Select Heap@@38 (|Seq#Index| xs@@34 j@@14) f_7)) (U_2_int (MapType0Select Heap@@38 (|Seq#Index| xs@@34 j@@14) f_7)))))))
 :qid |stdinbpl.1649:15|
 :skolemid |149|
 :pattern ( (state Heap@@38 Mask@@22) (fun07 Heap@@38 xs@@34 j@@14))
)))
(assert (forall ((s@@14 T@U) (x@@22 T@U) (i@@25 Int) ) (! (let ((T@@30 (type x@@22)))
 (=> (= (type s@@14) (SeqType T@@30)) (=> (and (and (<= 0 i@@25) (< i@@25 (|Seq#Length| s@@14))) (= (|Seq#Index| s@@14 i@@25) x@@22)) (|Seq#Contains| s@@14 x@@22))))
 :qid |stdinbpl.596:18|
 :skolemid |48|
 :pattern ( (|Seq#Contains| s@@14 x@@22) (|Seq#Index| s@@14 i@@25))
)))
(assert (forall ((s0@@5 T@U) (s1@@5 T@U) ) (! (let ((T@@31 (SeqTypeInv0 (type s0@@5))))
 (=> (and (= (type s0@@5) (SeqType T@@31)) (= (type s1@@5) (SeqType T@@31))) (or (or (and (= s0@@5 s1@@5) (|Seq#Equal| s0@@5 s1@@5)) (and (and (not (= s0@@5 s1@@5)) (not (|Seq#Equal| s0@@5 s1@@5))) (not (= (|Seq#Length| s0@@5) (|Seq#Length| s1@@5))))) (and (and (and (and (and (and (not (= s0@@5 s1@@5)) (not (|Seq#Equal| s0@@5 s1@@5))) (= (|Seq#Length| s0@@5) (|Seq#Length| s1@@5))) (= (|Seq#SkolemDiff| s0@@5 s1@@5) (|Seq#SkolemDiff| s1@@5 s0@@5))) (<= 0 (|Seq#SkolemDiff| s0@@5 s1@@5))) (< (|Seq#SkolemDiff| s0@@5 s1@@5) (|Seq#Length| s0@@5))) (not (= (|Seq#Index| s0@@5 (|Seq#SkolemDiff| s0@@5 s1@@5)) (|Seq#Index| s1@@5 (|Seq#SkolemDiff| s0@@5 s1@@5))))))))
 :qid |stdinbpl.700:18|
 :skolemid |52|
 :pattern ( (|Seq#Equal| s0@@5 s1@@5))
)))
(assert (forall ((p@@1 T@U) (v_1@@0 T@U) (q T@U) (w@@0 T@U) (r T@U) (u T@U) ) (! (let ((C@@3 (FieldTypeInv0 (type r))))
(let ((B@@10 (FieldTypeInv0 (type q))))
(let ((A@@11 (FieldTypeInv0 (type p@@1))))
 (=> (and (and (and (and (and (and (= (type p@@1) (FieldType A@@11 FrameTypeType)) (= (type v_1@@0) FrameTypeType)) (= (type q) (FieldType B@@10 FrameTypeType))) (= (type w@@0) FrameTypeType)) (= (type r) (FieldType C@@3 FrameTypeType))) (= (type u) FrameTypeType)) (and (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))) (InsidePredicate p@@1 v_1@@0 r u)))))
 :qid |stdinbpl.369:25|
 :skolemid |20|
 :pattern ( (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))
)))
(assert (forall ((s@@15 T@U) ) (! (let ((T@@32 (SeqTypeInv0 (type s@@15))))
 (=> (and (= (type s@@15) (SeqType T@@32)) (= (|Seq#Length| s@@15) 0)) (= s@@15 (|Seq#Empty| T@@32))))
 :qid |stdinbpl.404:18|
 :skolemid |24|
 :pattern ( (|Seq#Length| s@@15))
)))
(assert (forall ((s@@16 T@U) (n@@35 Int) ) (! (let ((T@@33 (SeqTypeInv0 (type s@@16))))
 (=> (and (= (type s@@16) (SeqType T@@33)) (<= n@@35 0)) (= (|Seq#Take| s@@16 n@@35) (|Seq#Empty| T@@33))))
 :qid |stdinbpl.579:18|
 :skolemid |46|
 :pattern ( (|Seq#Take| s@@16 n@@35))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
(assert (forall ((Heap2Heap@@7 T@U) (Heap1Heap@@7 T@U) (xs@@35 T@U) (i@@26 Int) ) (!  (=> (and (and (and (= (type Heap2Heap@@7) (MapType0Type RefType)) (= (type Heap1Heap@@7) (MapType0Type RefType))) (= (type xs@@35) (SeqType RefType))) (and (=  (and (and (<= 0 (|sk_fun03#condqp3| (|fun03#condqp3| Heap2Heap@@7 xs@@35 i@@26) (|fun03#condqp3| Heap1Heap@@7 xs@@35 i@@26))) (< (|sk_fun03#condqp3| (|fun03#condqp3| Heap2Heap@@7 xs@@35 i@@26) (|fun03#condqp3| Heap1Heap@@7 xs@@35 i@@26)) 3)) (< NoPerm FullPerm))  (and (and (<= 0 (|sk_fun03#condqp3| (|fun03#condqp3| Heap2Heap@@7 xs@@35 i@@26) (|fun03#condqp3| Heap1Heap@@7 xs@@35 i@@26))) (< (|sk_fun03#condqp3| (|fun03#condqp3| Heap2Heap@@7 xs@@35 i@@26) (|fun03#condqp3| Heap1Heap@@7 xs@@35 i@@26)) 3)) (< NoPerm FullPerm))) (=> (and (and (<= 0 (|sk_fun03#condqp3| (|fun03#condqp3| Heap2Heap@@7 xs@@35 i@@26) (|fun03#condqp3| Heap1Heap@@7 xs@@35 i@@26))) (< (|sk_fun03#condqp3| (|fun03#condqp3| Heap2Heap@@7 xs@@35 i@@26) (|fun03#condqp3| Heap1Heap@@7 xs@@35 i@@26)) 3)) (< NoPerm FullPerm)) (= (U_2_int (MapType0Select Heap2Heap@@7 (|Seq#Index| xs@@35 (|sk_fun03#condqp3| (|fun03#condqp3| Heap2Heap@@7 xs@@35 i@@26) (|fun03#condqp3| Heap1Heap@@7 xs@@35 i@@26))) f_7)) (U_2_int (MapType0Select Heap1Heap@@7 (|Seq#Index| xs@@35 (|sk_fun03#condqp3| (|fun03#condqp3| Heap2Heap@@7 xs@@35 i@@26) (|fun03#condqp3| Heap1Heap@@7 xs@@35 i@@26))) f_7)))))) (= (|fun03#condqp3| Heap2Heap@@7 xs@@35 i@@26) (|fun03#condqp3| Heap1Heap@@7 xs@@35 i@@26)))
 :qid |stdinbpl.1081:15|
 :skolemid |89|
 :pattern ( (|fun03#condqp3| Heap2Heap@@7 xs@@35 i@@26) (|fun03#condqp3| Heap1Heap@@7 xs@@35 i@@26) (succHeapTrans Heap2Heap@@7 Heap1Heap@@7))
)))
(assert (forall ((Heap2Heap@@8 T@U) (Heap1Heap@@8 T@U) (xs@@36 T@U) (n@@36 Int) ) (!  (=> (and (and (and (= (type Heap2Heap@@8) (MapType0Type RefType)) (= (type Heap1Heap@@8) (MapType0Type RefType))) (= (type xs@@36) (SeqType RefType))) (and (=  (and (and (<= 0 (|sk_P02#condqp5| (|P02#condqp5| Heap2Heap@@8 xs@@36 n@@36) (|P02#condqp5| Heap1Heap@@8 xs@@36 n@@36))) (< (|sk_P02#condqp5| (|P02#condqp5| Heap2Heap@@8 xs@@36 n@@36) (|P02#condqp5| Heap1Heap@@8 xs@@36 n@@36)) 3)) (< NoPerm FullPerm))  (and (and (<= 0 (|sk_P02#condqp5| (|P02#condqp5| Heap2Heap@@8 xs@@36 n@@36) (|P02#condqp5| Heap1Heap@@8 xs@@36 n@@36))) (< (|sk_P02#condqp5| (|P02#condqp5| Heap2Heap@@8 xs@@36 n@@36) (|P02#condqp5| Heap1Heap@@8 xs@@36 n@@36)) 3)) (< NoPerm FullPerm))) (=> (and (and (<= 0 (|sk_P02#condqp5| (|P02#condqp5| Heap2Heap@@8 xs@@36 n@@36) (|P02#condqp5| Heap1Heap@@8 xs@@36 n@@36))) (< (|sk_P02#condqp5| (|P02#condqp5| Heap2Heap@@8 xs@@36 n@@36) (|P02#condqp5| Heap1Heap@@8 xs@@36 n@@36)) 3)) (< NoPerm FullPerm)) (= (U_2_int (MapType0Select Heap2Heap@@8 (|Seq#Index| xs@@36 (|sk_P02#condqp5| (|P02#condqp5| Heap2Heap@@8 xs@@36 n@@36) (|P02#condqp5| Heap1Heap@@8 xs@@36 n@@36))) f_7)) (U_2_int (MapType0Select Heap1Heap@@8 (|Seq#Index| xs@@36 (|sk_P02#condqp5| (|P02#condqp5| Heap2Heap@@8 xs@@36 n@@36) (|P02#condqp5| Heap1Heap@@8 xs@@36 n@@36))) f_7)))))) (= (|P02#condqp5| Heap2Heap@@8 xs@@36 n@@36) (|P02#condqp5| Heap1Heap@@8 xs@@36 n@@36)))
 :qid |stdinbpl.2155:15|
 :skolemid |196|
 :pattern ( (|P02#condqp5| Heap2Heap@@8 xs@@36 n@@36) (|P02#condqp5| Heap1Heap@@8 xs@@36 n@@36) (succHeapTrans Heap2Heap@@8 Heap1Heap@@8))
)))
(assert (forall ((arg0@@40 T@U) (arg1@@20 T@U) ) (! (= (type (CombineFrames arg0@@40 arg1@@20)) FrameTypeType)
 :qid |funType:CombineFrames|
 :pattern ( (CombineFrames arg0@@40 arg1@@20))
)))
(assert (forall ((Heap@@39 T@U) (Mask@@23 T@U) (xs@@37 T@U) (i@@27 Int) ) (!  (=> (and (and (and (= (type Heap@@39) (MapType0Type RefType)) (= (type Mask@@23) (MapType1Type RefType realType))) (= (type xs@@37) (SeqType RefType))) (state Heap@@39 Mask@@23)) (= (|fun03'| Heap@@39 xs@@37 i@@27) (|fun03#frame| (CombineFrames (FrameFragment (int_2_U (|fun03#condqp3| Heap@@39 xs@@37 i@@27))) (FrameFragment (int_2_U (|fun03#condqp4| Heap@@39 xs@@37 i@@27)))) xs@@37 i@@27)))
 :qid |stdinbpl.1071:15|
 :skolemid |88|
 :pattern ( (state Heap@@39 Mask@@23) (|fun03'| Heap@@39 xs@@37 i@@27))
)))
(assert (forall ((Heap@@40 T@U) (Mask@@24 T@U) (xs@@38 T@U) (i@@28 Int) ) (!  (=> (and (and (and (and (= (type Heap@@40) (MapType0Type RefType)) (= (type Mask@@24) (MapType1Type RefType realType))) (= (type xs@@38) (SeqType RefType))) (and (state Heap@@40 Mask@@24) (or (< AssumeFunctionsAbove 0) (|fun08#trigger| (FrameFragment (int_2_U (|fun08#condqp10| Heap@@40 xs@@38 i@@28))) xs@@38 i@@28)))) (and (forall ((k_1_1@@0 Int) (j_3 Int) ) (!  (=> (and (>= k_1_1@@0 0) (and (< k_1_1@@0 (|Seq#Length| xs@@38)) (and (>= j_3 0) (and (< j_3 (|Seq#Length| xs@@38)) (not (= k_1_1@@0 j_3)))))) (not (= (|Seq#Index| xs@@38 k_1_1@@0) (|Seq#Index| xs@@38 j_3))))
 :qid |stdinbpl.1987:131|
 :skolemid |181|
 :pattern ( (|Seq#Index| xs@@38 k_1_1@@0) (|Seq#Index| xs@@38 j_3))
)) (and (<= 0 i@@28) (< i@@28 (|Seq#Length| xs@@38))))) (> (|fun08'| Heap@@40 xs@@38 i@@28) (U_2_int (MapType0Select Heap@@40 (|Seq#Index| xs@@38 i@@28) f_7))))
 :qid |stdinbpl.1985:15|
 :skolemid |182|
 :pattern ( (state Heap@@40 Mask@@24) (|fun08'| Heap@@40 xs@@38 i@@28))
)))
; Valid

(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun k_6 () Int)
(declare-fun xs@@39 () T@U)
(declare-fun i_5_2 () Int)
(declare-fun neverTriggered61 (Int) Bool)
(declare-fun QPMask@0 () T@U)
(declare-fun Heap@@41 () T@U)
(declare-fun k_4 () Int)
(declare-fun j_2 () Int)
(declare-fun neverTriggered60 (Int) Bool)
(declare-fun qpRange60 (T@U) Bool)
(declare-fun invRecv60 (T@U) Int)
(declare-fun QPMask@2 () T@U)
(declare-fun k_2_1 () Int)
(declare-fun i_2_1 () Int)
(declare-fun neverTriggered59 (Int) Bool)
(declare-fun qpRange58 (T@U) Bool)
(declare-fun invRecv58 (T@U) Int)
(declare-fun i_21 () Int)
(declare-fun k_11 () Int)
(declare-fun j_37 () Int)
(assert  (and (and (and (= (type xs@@39) (SeqType RefType)) (= (type QPMask@0) (MapType1Type RefType realType))) (= (type QPMask@2) (MapType1Type RefType realType))) (= (type Heap@@41) (MapType0Type RefType))))
(set-info :boogie-vc-id test07)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 47) (let ((anon24_correct true))
(let ((anon39_Else_correct  (=> (and (not (and (>= k_6 0) (and (< k_6 (|Seq#Length| xs@@39)) (and (>= i_5_2 0) (and (< i_5_2 (|Seq#Length| xs@@39)) (not (= k_6 i_5_2))))))) (= (ControlFlow 0 36) 33)) anon24_correct)))
(let ((anon39_Then_correct  (=> (and (>= k_6 0) (and (< k_6 (|Seq#Length| xs@@39)) (and (>= i_5_2 0) (and (< i_5_2 (|Seq#Length| xs@@39)) (not (= k_6 i_5_2)))))) (and (=> (= (ControlFlow 0 34) (- 0 35)) (not (= (|Seq#Index| xs@@39 k_6) (|Seq#Index| xs@@39 i_5_2)))) (=> (not (= (|Seq#Index| xs@@39 k_6) (|Seq#Index| xs@@39 i_5_2))) (=> (= (ControlFlow 0 34) 33) anon24_correct))))))
(let ((anon38_Else_correct  (=> (forall ((k_7_1 Int) (i_6_1_1 Int) ) (!  (=> (and (>= k_7_1 0) (and (< k_7_1 (|Seq#Length| xs@@39)) (and (>= i_6_1_1 0) (and (< i_6_1_1 (|Seq#Length| xs@@39)) (not (= k_7_1 i_6_1_1)))))) (not (= (|Seq#Index| xs@@39 k_7_1) (|Seq#Index| xs@@39 i_6_1_1))))
 :qid |stdinbpl.5964:24|
 :skolemid |547|
 :pattern ( (|Seq#Index| xs@@39 k_7_1) (|Seq#Index| xs@@39 i_6_1_1))
)) (and (=> (= (ControlFlow 0 31) (- 0 32)) (forall ((i_7 Int) (i_7_1 Int) ) (!  (=> (and (and (and (and (not (= i_7 i_7_1)) (and (<= 0 i_7) (< i_7 (|Seq#Length| xs@@39)))) (and (<= 0 i_7_1) (< i_7_1 (|Seq#Length| xs@@39)))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| xs@@39 i_7) (|Seq#Index| xs@@39 i_7_1))))
 :qid |stdinbpl.5975:21|
 :skolemid |548|
 :pattern ( (neverTriggered61 i_7) (neverTriggered61 i_7_1))
))) (=> (forall ((i_7@@0 Int) (i_7_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_7@@0 i_7_1@@0)) (and (<= 0 i_7@@0) (< i_7@@0 (|Seq#Length| xs@@39)))) (and (<= 0 i_7_1@@0) (< i_7_1@@0 (|Seq#Length| xs@@39)))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| xs@@39 i_7@@0) (|Seq#Index| xs@@39 i_7_1@@0))))
 :qid |stdinbpl.5975:21|
 :skolemid |548|
 :pattern ( (neverTriggered61 i_7@@0) (neverTriggered61 i_7_1@@0))
)) (=> (= (ControlFlow 0 31) (- 0 30)) (forall ((i_7@@1 Int) ) (!  (=> (and (<= 0 i_7@@1) (< i_7@@1 (|Seq#Length| xs@@39))) (>= (U_2_real (MapType1Select QPMask@0 (|Seq#Index| xs@@39 i_7@@1) f_7)) FullPerm))
 :qid |stdinbpl.5982:21|
 :skolemid |549|
 :pattern ( (|Seq#Index| xs@@39 i_7@@1))
 :pattern ( (|Seq#Index| xs@@39 i_7@@1))
))))))))
(let ((anon37_Else_correct  (=> (= (ControlFlow 0 29) (- 0 28)) (> (fun07 Heap@@41 xs@@39 (- 0 10)) 0))))
(let ((anon34_Else_correct  (and (=> (= (ControlFlow 0 37) (- 0 40)) (< 2 (|Seq#Length| xs@@39))) (=> (< 2 (|Seq#Length| xs@@39)) (and (=> (= (ControlFlow 0 37) (- 0 39)) (HasDirectPerm QPMask@0 (|Seq#Index| xs@@39 2) f_7)) (=> (HasDirectPerm QPMask@0 (|Seq#Index| xs@@39 2) f_7) (and (=> (= (ControlFlow 0 37) (- 0 38)) (> (fun08 Heap@@41 xs@@39 2) (U_2_int (MapType0Select Heap@@41 (|Seq#Index| xs@@39 2) f_7)))) (=> (> (fun08 Heap@@41 xs@@39 2) (U_2_int (MapType0Select Heap@@41 (|Seq#Index| xs@@39 2) f_7))) (=> (state Heap@@41 QPMask@0) (and (and (and (=> (= (ControlFlow 0 37) 29) anon37_Else_correct) (=> (= (ControlFlow 0 37) 31) anon38_Else_correct)) (=> (= (ControlFlow 0 37) 34) anon39_Then_correct)) (=> (= (ControlFlow 0 37) 36) anon39_Else_correct)))))))))))
(let ((anon18_correct true))
(let ((anon36_Else_correct  (=> (and (not (and (>= k_4 0) (and (< k_4 (|Seq#Length| xs@@39)) (and (>= j_2 0) (and (< j_2 (|Seq#Length| xs@@39)) (not (= k_4 j_2))))))) (= (ControlFlow 0 27) 24)) anon18_correct)))
(let ((anon36_Then_correct  (=> (and (>= k_4 0) (and (< k_4 (|Seq#Length| xs@@39)) (and (>= j_2 0) (and (< j_2 (|Seq#Length| xs@@39)) (not (= k_4 j_2)))))) (and (=> (= (ControlFlow 0 25) (- 0 26)) (not (= (|Seq#Index| xs@@39 k_4) (|Seq#Index| xs@@39 j_2)))) (=> (not (= (|Seq#Index| xs@@39 k_4) (|Seq#Index| xs@@39 j_2))) (=> (= (ControlFlow 0 25) 24) anon18_correct))))))
(let ((anon35_Else_correct  (=> (forall ((k_5_1 Int) (j_3_1 Int) ) (!  (=> (and (>= k_5_1 0) (and (< k_5_1 (|Seq#Length| xs@@39)) (and (>= j_3_1 0) (and (< j_3_1 (|Seq#Length| xs@@39)) (not (= k_5_1 j_3_1)))))) (not (= (|Seq#Index| xs@@39 k_5_1) (|Seq#Index| xs@@39 j_3_1))))
 :qid |stdinbpl.5886:24|
 :skolemid |540|
 :pattern ( (|Seq#Index| xs@@39 k_5_1) (|Seq#Index| xs@@39 j_3_1))
)) (and (=> (= (ControlFlow 0 21) (- 0 23)) (forall ((j_4 Int) (j_4_2 Int) ) (!  (=> (and (and (and (and (not (= j_4 j_4_2)) (and (<= 0 j_4) (< j_4 (|Seq#Length| xs@@39)))) (and (<= 0 j_4_2) (< j_4_2 (|Seq#Length| xs@@39)))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| xs@@39 j_4) (|Seq#Index| xs@@39 j_4_2))))
 :qid |stdinbpl.5897:21|
 :skolemid |541|
 :pattern ( (neverTriggered60 j_4) (neverTriggered60 j_4_2))
))) (=> (forall ((j_4@@0 Int) (j_4_2@@0 Int) ) (!  (=> (and (and (and (and (not (= j_4@@0 j_4_2@@0)) (and (<= 0 j_4@@0) (< j_4@@0 (|Seq#Length| xs@@39)))) (and (<= 0 j_4_2@@0) (< j_4_2@@0 (|Seq#Length| xs@@39)))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| xs@@39 j_4@@0) (|Seq#Index| xs@@39 j_4_2@@0))))
 :qid |stdinbpl.5897:21|
 :skolemid |541|
 :pattern ( (neverTriggered60 j_4@@0) (neverTriggered60 j_4_2@@0))
)) (and (=> (= (ControlFlow 0 21) (- 0 22)) (forall ((j_4@@1 Int) ) (!  (=> (and (<= 0 j_4@@1) (< j_4@@1 (|Seq#Length| xs@@39))) (>= (U_2_real (MapType1Select QPMask@0 (|Seq#Index| xs@@39 j_4@@1) f_7)) FullPerm))
 :qid |stdinbpl.5904:21|
 :skolemid |542|
 :pattern ( (|Seq#Index| xs@@39 j_4@@1))
 :pattern ( (|Seq#Index| xs@@39 j_4@@1))
))) (=> (forall ((j_4@@2 Int) ) (!  (=> (and (<= 0 j_4@@2) (< j_4@@2 (|Seq#Length| xs@@39))) (>= (U_2_real (MapType1Select QPMask@0 (|Seq#Index| xs@@39 j_4@@2) f_7)) FullPerm))
 :qid |stdinbpl.5904:21|
 :skolemid |542|
 :pattern ( (|Seq#Index| xs@@39 j_4@@2))
 :pattern ( (|Seq#Index| xs@@39 j_4@@2))
)) (=> (forall ((j_4@@3 Int) ) (!  (=> (and (and (<= 0 j_4@@3) (< j_4@@3 (|Seq#Length| xs@@39))) (< NoPerm FullPerm)) (and (qpRange60 (|Seq#Index| xs@@39 j_4@@3)) (= (invRecv60 (|Seq#Index| xs@@39 j_4@@3)) j_4@@3)))
 :qid |stdinbpl.5910:26|
 :skolemid |543|
 :pattern ( (|Seq#Index| xs@@39 j_4@@3))
 :pattern ( (|Seq#Index| xs@@39 j_4@@3))
)) (=> (and (and (forall ((o_3 T@U) ) (!  (=> (= (type o_3) RefType) (=> (and (and (<= 0 (invRecv60 o_3)) (< (invRecv60 o_3) (|Seq#Length| xs@@39))) (and (< NoPerm FullPerm) (qpRange60 o_3))) (= (|Seq#Index| xs@@39 (invRecv60 o_3)) o_3)))
 :qid |stdinbpl.5914:26|
 :skolemid |544|
 :pattern ( (invRecv60 o_3))
)) (forall ((o_3@@0 T@U) ) (!  (=> (= (type o_3@@0) RefType) (and (=> (and (and (<= 0 (invRecv60 o_3@@0)) (< (invRecv60 o_3@@0) (|Seq#Length| xs@@39))) (and (< NoPerm FullPerm) (qpRange60 o_3@@0))) (and (= (|Seq#Index| xs@@39 (invRecv60 o_3@@0)) o_3@@0) (= (U_2_real (MapType1Select QPMask@2 o_3@@0 f_7)) (- (U_2_real (MapType1Select QPMask@0 o_3@@0 f_7)) FullPerm)))) (=> (not (and (and (<= 0 (invRecv60 o_3@@0)) (< (invRecv60 o_3@@0) (|Seq#Length| xs@@39))) (and (< NoPerm FullPerm) (qpRange60 o_3@@0)))) (= (U_2_real (MapType1Select QPMask@2 o_3@@0 f_7)) (U_2_real (MapType1Select QPMask@0 o_3@@0 f_7))))))
 :qid |stdinbpl.5920:26|
 :skolemid |545|
 :pattern ( (MapType1Select QPMask@2 o_3@@0 f_7))
))) (and (forall ((o_3@@1 T@U) (f_5 T@U) ) (! (let ((B@@11 (FieldTypeInv1 (type f_5))))
(let ((A@@12 (FieldTypeInv0 (type f_5))))
 (=> (and (and (= (type o_3@@1) RefType) (= (type f_5) (FieldType A@@12 B@@11))) (not (= f_5 f_7))) (= (U_2_real (MapType1Select QPMask@0 o_3@@1 f_5)) (U_2_real (MapType1Select QPMask@2 o_3@@1 f_5))))))
 :qid |stdinbpl.5926:33|
 :skolemid |546|
 :pattern ( (MapType1Select QPMask@2 o_3@@1 f_5))
)) (= (ControlFlow 0 21) (- 0 20)))) (< 2 (|Seq#Length| xs@@39)))))))))))
(let ((anon31_Else_correct  (and (=> (= (ControlFlow 0 41) (- 0 42)) (>= (fun07 Heap@@41 xs@@39 (- 0 10)) 0)) (=> (>= (fun07 Heap@@41 xs@@39 (- 0 10)) 0) (=> (state Heap@@41 QPMask@0) (and (and (and (=> (= (ControlFlow 0 41) 37) anon34_Else_correct) (=> (= (ControlFlow 0 41) 21) anon35_Else_correct)) (=> (= (ControlFlow 0 41) 25) anon36_Then_correct)) (=> (= (ControlFlow 0 41) 27) anon36_Else_correct)))))))
(let ((anon12_correct true))
(let ((anon33_Else_correct  (=> (and (not (and (>= k_2_1 0) (and (< k_2_1 (|Seq#Length| xs@@39)) (and (>= i_2_1 0) (and (< i_2_1 (|Seq#Length| xs@@39)) (not (= k_2_1 i_2_1))))))) (= (ControlFlow 0 19) 16)) anon12_correct)))
(let ((anon33_Then_correct  (=> (and (>= k_2_1 0) (and (< k_2_1 (|Seq#Length| xs@@39)) (and (>= i_2_1 0) (and (< i_2_1 (|Seq#Length| xs@@39)) (not (= k_2_1 i_2_1)))))) (and (=> (= (ControlFlow 0 17) (- 0 18)) (not (= (|Seq#Index| xs@@39 k_2_1) (|Seq#Index| xs@@39 i_2_1)))) (=> (not (= (|Seq#Index| xs@@39 k_2_1) (|Seq#Index| xs@@39 i_2_1))) (=> (= (ControlFlow 0 17) 16) anon12_correct))))))
(let ((anon32_Else_correct  (=> (forall ((k_3_1 Int) (i_3_1_1 Int) ) (!  (=> (and (>= k_3_1 0) (and (< k_3_1 (|Seq#Length| xs@@39)) (and (>= i_3_1_1 0) (and (< i_3_1_1 (|Seq#Length| xs@@39)) (not (= k_3_1 i_3_1_1)))))) (not (= (|Seq#Index| xs@@39 k_3_1) (|Seq#Index| xs@@39 i_3_1_1))))
 :qid |stdinbpl.5814:24|
 :skolemid |533|
 :pattern ( (|Seq#Index| xs@@39 k_3_1) (|Seq#Index| xs@@39 i_3_1_1))
)) (and (=> (= (ControlFlow 0 14) (- 0 15)) (forall ((i_4 Int) (i_4_1 Int) ) (!  (=> (and (and (and (and (not (= i_4 i_4_1)) (and (<= 0 i_4) (< i_4 (|Seq#Length| xs@@39)))) (and (<= 0 i_4_1) (< i_4_1 (|Seq#Length| xs@@39)))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| xs@@39 i_4) (|Seq#Index| xs@@39 i_4_1))))
 :qid |stdinbpl.5825:21|
 :skolemid |534|
 :pattern ( (neverTriggered59 i_4) (neverTriggered59 i_4_1))
))) (=> (forall ((i_4@@0 Int) (i_4_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_4@@0 i_4_1@@0)) (and (<= 0 i_4@@0) (< i_4@@0 (|Seq#Length| xs@@39)))) (and (<= 0 i_4_1@@0) (< i_4_1@@0 (|Seq#Length| xs@@39)))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| xs@@39 i_4@@0) (|Seq#Index| xs@@39 i_4_1@@0))))
 :qid |stdinbpl.5825:21|
 :skolemid |534|
 :pattern ( (neverTriggered59 i_4@@0) (neverTriggered59 i_4_1@@0))
)) (=> (= (ControlFlow 0 14) (- 0 13)) (forall ((i_4@@1 Int) ) (!  (=> (and (<= 0 i_4@@1) (< i_4@@1 (|Seq#Length| xs@@39))) (>= (U_2_real (MapType1Select QPMask@0 (|Seq#Index| xs@@39 i_4@@1) f_7)) FullPerm))
 :qid |stdinbpl.5832:21|
 :skolemid |535|
 :pattern ( (|Seq#Index| xs@@39 i_4@@1))
 :pattern ( (|Seq#Index| xs@@39 i_4@@1))
))))))))
(let ((anon29_Else_correct  (and (=> (= (ControlFlow 0 43) (- 0 44)) (forall ((i_1 Int) (i_1_2 Int) ) (!  (=> (and (and (and (and (not (= i_1 i_1_2)) (and (<= 0 i_1) (< i_1 (|Seq#Length| xs@@39)))) (and (<= 0 i_1_2) (< i_1_2 (|Seq#Length| xs@@39)))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| xs@@39 i_1) (|Seq#Index| xs@@39 i_1_2))))
 :qid |stdinbpl.5758:15|
 :skolemid |527|
))) (=> (forall ((i_1@@0 Int) (i_1_2@@0 Int) ) (!  (=> (and (and (and (and (not (= i_1@@0 i_1_2@@0)) (and (<= 0 i_1@@0) (< i_1@@0 (|Seq#Length| xs@@39)))) (and (<= 0 i_1_2@@0) (< i_1_2@@0 (|Seq#Length| xs@@39)))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| xs@@39 i_1@@0) (|Seq#Index| xs@@39 i_1_2@@0))))
 :qid |stdinbpl.5758:15|
 :skolemid |527|
)) (=> (forall ((i_1@@1 Int) ) (!  (=> (and (and (<= 0 i_1@@1) (< i_1@@1 (|Seq#Length| xs@@39))) (< NoPerm FullPerm)) (and (qpRange58 (|Seq#Index| xs@@39 i_1@@1)) (= (invRecv58 (|Seq#Index| xs@@39 i_1@@1)) i_1@@1)))
 :qid |stdinbpl.5764:22|
 :skolemid |528|
 :pattern ( (|Seq#Index| xs@@39 i_1@@1))
 :pattern ( (|Seq#Index| xs@@39 i_1@@1))
)) (=> (and (forall ((o_3@@2 T@U) ) (!  (=> (= (type o_3@@2) RefType) (=> (and (and (and (<= 0 (invRecv58 o_3@@2)) (< (invRecv58 o_3@@2) (|Seq#Length| xs@@39))) (< NoPerm FullPerm)) (qpRange58 o_3@@2)) (= (|Seq#Index| xs@@39 (invRecv58 o_3@@2)) o_3@@2)))
 :qid |stdinbpl.5768:22|
 :skolemid |529|
 :pattern ( (invRecv58 o_3@@2))
)) (forall ((i_1@@2 Int) ) (!  (=> (and (<= 0 i_1@@2) (< i_1@@2 (|Seq#Length| xs@@39))) (not (= (|Seq#Index| xs@@39 i_1@@2) null)))
 :qid |stdinbpl.5774:22|
 :skolemid |530|
 :pattern ( (|Seq#Index| xs@@39 i_1@@2))
 :pattern ( (|Seq#Index| xs@@39 i_1@@2))
))) (=> (and (and (and (forall ((o_3@@3 T@U) ) (!  (=> (= (type o_3@@3) RefType) (and (=> (and (and (and (<= 0 (invRecv58 o_3@@3)) (< (invRecv58 o_3@@3) (|Seq#Length| xs@@39))) (< NoPerm FullPerm)) (qpRange58 o_3@@3)) (and (=> (< NoPerm FullPerm) (= (|Seq#Index| xs@@39 (invRecv58 o_3@@3)) o_3@@3)) (= (U_2_real (MapType1Select QPMask@0 o_3@@3 f_7)) (+ (U_2_real (MapType1Select ZeroMask o_3@@3 f_7)) FullPerm)))) (=> (not (and (and (and (<= 0 (invRecv58 o_3@@3)) (< (invRecv58 o_3@@3) (|Seq#Length| xs@@39))) (< NoPerm FullPerm)) (qpRange58 o_3@@3))) (= (U_2_real (MapType1Select QPMask@0 o_3@@3 f_7)) (U_2_real (MapType1Select ZeroMask o_3@@3 f_7))))))
 :qid |stdinbpl.5780:22|
 :skolemid |531|
 :pattern ( (MapType1Select QPMask@0 o_3@@3 f_7))
)) (forall ((o_3@@4 T@U) (f_5@@0 T@U) ) (! (let ((B@@12 (FieldTypeInv1 (type f_5@@0))))
(let ((A@@13 (FieldTypeInv0 (type f_5@@0))))
 (=> (and (and (= (type o_3@@4) RefType) (= (type f_5@@0) (FieldType A@@13 B@@12))) (not (= f_5@@0 f_7))) (= (U_2_real (MapType1Select ZeroMask o_3@@4 f_5@@0)) (U_2_real (MapType1Select QPMask@0 o_3@@4 f_5@@0))))))
 :qid |stdinbpl.5784:29|
 :skolemid |532|
 :pattern ( (MapType1Select ZeroMask o_3@@4 f_5@@0))
 :pattern ( (MapType1Select QPMask@0 o_3@@4 f_5@@0))
))) (and (state Heap@@41 QPMask@0) (state Heap@@41 QPMask@0))) (and (and (state Heap@@41 QPMask@0) (> (|Seq#Length| xs@@39) 3)) (and (state Heap@@41 QPMask@0) (state Heap@@41 QPMask@0)))) (and (and (and (=> (= (ControlFlow 0 43) 41) anon31_Else_correct) (=> (= (ControlFlow 0 43) 14) anon32_Else_correct)) (=> (= (ControlFlow 0 43) 17) anon33_Then_correct)) (=> (= (ControlFlow 0 43) 19) anon33_Else_correct)))))))))
(let ((anon7_correct true))
(let ((anon30_Else_correct  (=> (and (not (and (<= 0 i_21) (< i_21 (|Seq#Length| xs@@39)))) (= (ControlFlow 0 12) 8)) anon7_correct)))
(let ((anon30_Then_correct  (=> (and (<= 0 i_21) (< i_21 (|Seq#Length| xs@@39))) (and (=> (= (ControlFlow 0 9) (- 0 11)) (>= i_21 0)) (=> (>= i_21 0) (and (=> (= (ControlFlow 0 9) (- 0 10)) (< i_21 (|Seq#Length| xs@@39))) (=> (< i_21 (|Seq#Length| xs@@39)) (=> (= (ControlFlow 0 9) 8) anon7_correct))))))))
(let ((anon27_Else_correct  (=> (forall ((k_1_1@@1 Int) (j_1 Int) ) (!  (=> (and (>= k_1_1@@1 0) (and (< k_1_1@@1 (|Seq#Length| xs@@39)) (and (>= j_1 0) (and (< j_1 (|Seq#Length| xs@@39)) (not (= k_1_1@@1 j_1)))))) (not (= (|Seq#Index| xs@@39 k_1_1@@1) (|Seq#Index| xs@@39 j_1))))
 :qid |stdinbpl.5735:20|
 :skolemid |526|
 :pattern ( (|Seq#Index| xs@@39 k_1_1@@1) (|Seq#Index| xs@@39 j_1))
)) (=> (and (state Heap@@41 ZeroMask) (state Heap@@41 ZeroMask)) (and (and (=> (= (ControlFlow 0 45) 43) anon29_Else_correct) (=> (= (ControlFlow 0 45) 9) anon30_Then_correct)) (=> (= (ControlFlow 0 45) 12) anon30_Else_correct))))))
(let ((anon3_correct true))
(let ((anon28_Else_correct  (=> (and (not (and (>= k_11 0) (and (< k_11 (|Seq#Length| xs@@39)) (and (>= j_37 0) (and (< j_37 (|Seq#Length| xs@@39)) (not (= k_11 j_37))))))) (= (ControlFlow 0 7) 1)) anon3_correct)))
(let ((anon28_Then_correct  (=> (and (>= k_11 0) (and (< k_11 (|Seq#Length| xs@@39)) (and (>= j_37 0) (and (< j_37 (|Seq#Length| xs@@39)) (not (= k_11 j_37)))))) (and (=> (= (ControlFlow 0 2) (- 0 6)) (>= k_11 0)) (=> (>= k_11 0) (and (=> (= (ControlFlow 0 2) (- 0 5)) (< k_11 (|Seq#Length| xs@@39))) (=> (< k_11 (|Seq#Length| xs@@39)) (and (=> (= (ControlFlow 0 2) (- 0 4)) (>= j_37 0)) (=> (>= j_37 0) (and (=> (= (ControlFlow 0 2) (- 0 3)) (< j_37 (|Seq#Length| xs@@39))) (=> (< j_37 (|Seq#Length| xs@@39)) (=> (= (ControlFlow 0 2) 1) anon3_correct))))))))))))
(let ((anon0_correct  (=> (and (state Heap@@41 ZeroMask) (= AssumeFunctionsAbove (- 0 1))) (and (and (=> (= (ControlFlow 0 46) 45) anon27_Else_correct) (=> (= (ControlFlow 0 46) 2) anon28_Then_correct)) (=> (= (ControlFlow 0 46) 7) anon28_Else_correct)))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 47) 46) anon0_correct)))
PreconditionGeneratedEntry_correct))))))))))))))))))))))))))
))
(check-sat)
(get-info :reason-unknown)
(assert (not (= (ControlFlow 0 29) (- 28))))
(check-sat)
(pop 1)
; Invalid
(get-info :rlimit)
