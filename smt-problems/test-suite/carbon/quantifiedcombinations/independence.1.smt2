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
(declare-fun g () T@U)
(declare-fun FieldType (T@T T@T) T@T)
(declare-fun FieldTypeInv0 (T@T) T@T)
(declare-fun FieldTypeInv1 (T@T) T@T)
(declare-fun NormalFieldType () T@T)
(declare-fun |Seq#Length| (T@U) Int)
(declare-fun |Seq#Drop| (T@U Int) T@U)
(declare-fun SeqTypeInv0 (T@T) T@T)
(declare-fun SeqType (T@T) T@T)
(declare-fun succHeap (T@U T@U) Bool)
(declare-fun MapType0Type (T@T) T@T)
(declare-fun RefType () T@T)
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
(declare-fun p2 (T@U Int) T@U)
(declare-fun IsPredicateField (T@U) Bool)
(declare-fun PredicateType_p2Type () T@T)
(declare-fun FrameTypeType () T@T)
(declare-fun |p2#trigger| (T@U T@U) Bool)
(declare-fun |p2#everUsed| (T@U) Bool)
(declare-fun |Seq#Index| (T@U Int) T@U)
(declare-fun |Seq#Sub| (Int Int) Int)
(declare-fun |Seq#Add| (Int Int) Int)
(declare-fun IdenticalOnKnownLocations (T@U T@U T@U) Bool)
(declare-fun null () T@U)
(declare-fun PredicateMaskField (T@U) T@U)
(declare-fun HasDirectPerm (T@U T@U T@U) Bool)
(declare-fun IsWandField (T@U) Bool)
(declare-fun WandMaskField (T@U) T@U)
(declare-fun p1 (T@U) T@U)
(declare-fun PredicateType_p1Type () T@T)
(declare-fun |p1#trigger| (T@U T@U) Bool)
(declare-fun |p1#everUsed| (T@U) Bool)
(declare-fun |Seq#Update| (T@U Int T@U) T@U)
(declare-fun |Seq#Take| (T@U Int) T@U)
(declare-fun |Seq#Contains| (T@U T@U) Bool)
(declare-fun |Seq#Range| (Int Int) T@U)
(declare-fun |Seq#Skolem| (T@U T@U) Int)
(declare-fun |Seq#Singleton| (T@U) T@U)
(declare-fun |p2#sm| (T@U Int) T@U)
(declare-fun |p1#sm| (T@U) T@U)
(declare-fun |Seq#Empty| (T@T) T@U)
(declare-fun dummyHeap () T@U)
(declare-fun ZeroMask () T@U)
(declare-fun InsidePredicate (T@U T@U T@U T@U) Bool)
(declare-fun |Seq#Append| (T@U T@U) T@U)
(declare-fun sumMask (T@U T@U T@U) Bool)
(declare-fun ConditionalFrame (Real T@U) T@U)
(declare-fun EmptyFrame () T@U)
(declare-fun NoPerm () Real)
(declare-fun |Seq#Equal| (T@U T@U) Bool)
(declare-fun |Seq#ContainsTrigger| (T@U T@U) Bool)
(declare-fun getPredWandId (T@U) Int)
(declare-fun wand (T@U Real Bool T@U Real T@U Int) T@U)
(declare-fun WandType_wandType () T@T)
(declare-fun FullPerm () Real)
(declare-fun |wand#ft| (T@U Real Bool T@U Real T@U Int) T@U)
(declare-fun |wand#sm| (T@U Real Bool T@U Real T@U Int) T@U)
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
(assert  (and (and (and (and (and (and (forall ((arg0@@11 T@T) (arg1 T@T) ) (! (= (Ctor (FieldType arg0@@11 arg1)) 6)
 :qid |ctor:FieldType|
)) (forall ((arg0@@12 T@T) (arg1@@0 T@T) ) (! (= (FieldTypeInv0 (FieldType arg0@@12 arg1@@0)) arg0@@12)
 :qid |typeInv:FieldTypeInv0|
 :pattern ( (FieldType arg0@@12 arg1@@0))
))) (forall ((arg0@@13 T@T) (arg1@@1 T@T) ) (! (= (FieldTypeInv1 (FieldType arg0@@13 arg1@@1)) arg1@@1)
 :qid |typeInv:FieldTypeInv1|
 :pattern ( (FieldType arg0@@13 arg1@@1))
))) (= (Ctor NormalFieldType) 7)) (= (type $allocated) (FieldType NormalFieldType boolType))) (= (type f_7) (FieldType NormalFieldType intType))) (= (type g) (FieldType NormalFieldType intType))))
(assert (distinct $allocated f_7 g)
)
(assert  (and (and (forall ((arg0@@14 T@T) ) (! (= (Ctor (SeqType arg0@@14)) 8)
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
 :qid |stdinbpl.343:18|
 :skolemid |38|
 :pattern ( (|Seq#Length| (|Seq#Drop| s n)))
 :pattern ( (|Seq#Length| s) (|Seq#Drop| s n))
)))
(assert  (and (and (and (and (and (and (forall ((arg0@@17 T@T) ) (! (= (Ctor (MapType0Type arg0@@17)) 9)
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
)))) (= (Ctor RefType) 10)))
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
(assert  (and (and (= (Ctor PredicateType_p2Type) 12) (= (Ctor FrameTypeType) 13)) (forall ((arg0@@26 T@U) (arg1@@10 Int) ) (! (= (type (p2 arg0@@26 arg1@@10)) (FieldType PredicateType_p2Type FrameTypeType))
 :qid |funType:p2|
 :pattern ( (p2 arg0@@26 arg1@@10))
))))
(assert (forall ((a_1 T@U) (b_1 Int) ) (!  (=> (= (type a_1) RefType) (IsPredicateField (p2 a_1 b_1)))
 :qid |stdinbpl.721:15|
 :skolemid |72|
 :pattern ( (p2 a_1 b_1))
)))
(assert (forall ((Heap@@0 T@U) (a_1@@0 T@U) (b_1@@0 Int) ) (!  (=> (and (= (type Heap@@0) (MapType0Type RefType)) (= (type a_1@@0) RefType)) (|p2#everUsed| (p2 a_1@@0 b_1@@0)))
 :qid |stdinbpl.740:15|
 :skolemid |76|
 :pattern ( (|p2#trigger| Heap@@0 (p2 a_1@@0 b_1@@0)))
)))
(assert (forall ((arg0@@27 T@U) (arg1@@11 Int) ) (! (let ((T@@1 (SeqTypeInv0 (type arg0@@27))))
(= (type (|Seq#Index| arg0@@27 arg1@@11)) T@@1))
 :qid |funType:Seq#Index|
 :pattern ( (|Seq#Index| arg0@@27 arg1@@11))
)))
(assert (forall ((s@@0 T@U) (n@@0 Int) (j Int) ) (! (let ((T@@2 (SeqTypeInv0 (type s@@0))))
 (=> (= (type s@@0) (SeqType T@@2)) (=> (and (and (< 0 n@@0) (<= 0 j)) (< j (- (|Seq#Length| s@@0) n@@0))) (and (= (|Seq#Sub| (|Seq#Add| j n@@0) n@@0) j) (= (|Seq#Index| (|Seq#Drop| s@@0 n@@0) j) (|Seq#Index| s@@0 (|Seq#Add| j n@@0)))))))
 :qid |stdinbpl.364:18|
 :skolemid |39|
 :pattern ( (|Seq#Index| (|Seq#Drop| s@@0 n@@0) j))
)))
(assert  (and (= (type null) RefType) (forall ((arg0@@28 T@U) ) (! (let ((A (FieldTypeInv0 (type arg0@@28))))
(= (type (PredicateMaskField arg0@@28)) (FieldType A (MapType1Type RefType boolType))))
 :qid |funType:PredicateMaskField|
 :pattern ( (PredicateMaskField arg0@@28))
))))
(assert (forall ((Heap@@1 T@U) (ExhaleHeap T@U) (Mask@@0 T@U) (pm_f T@U) ) (! (let ((C (FieldTypeInv0 (type pm_f))))
 (=> (and (and (and (and (and (= (type Heap@@1) (MapType0Type RefType)) (= (type ExhaleHeap) (MapType0Type RefType))) (= (type Mask@@0) (MapType1Type RefType realType))) (= (type pm_f) (FieldType C FrameTypeType))) (IdenticalOnKnownLocations Heap@@1 ExhaleHeap Mask@@0)) (and (HasDirectPerm Mask@@0 null pm_f) (IsPredicateField pm_f))) (= (MapType0Select Heap@@1 null (PredicateMaskField pm_f)) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))))
 :qid |stdinbpl.47:19|
 :skolemid |2|
 :pattern ( (IdenticalOnKnownLocations Heap@@1 ExhaleHeap Mask@@0) (IsPredicateField pm_f) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))
)))
(assert (forall ((arg0@@29 T@U) ) (! (let ((A@@0 (FieldTypeInv0 (type arg0@@29))))
(= (type (WandMaskField arg0@@29)) (FieldType A@@0 (MapType1Type RefType boolType))))
 :qid |funType:WandMaskField|
 :pattern ( (WandMaskField arg0@@29))
)))
(assert (forall ((Heap@@2 T@U) (ExhaleHeap@@0 T@U) (Mask@@1 T@U) (pm_f@@0 T@U) ) (! (let ((C@@0 (FieldTypeInv0 (type pm_f@@0))))
 (=> (and (and (and (and (and (= (type Heap@@2) (MapType0Type RefType)) (= (type ExhaleHeap@@0) (MapType0Type RefType))) (= (type Mask@@1) (MapType1Type RefType realType))) (= (type pm_f@@0) (FieldType C@@0 FrameTypeType))) (IdenticalOnKnownLocations Heap@@2 ExhaleHeap@@0 Mask@@1)) (and (HasDirectPerm Mask@@1 null pm_f@@0) (IsWandField pm_f@@0))) (= (MapType0Select Heap@@2 null (WandMaskField pm_f@@0)) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))))
 :qid |stdinbpl.60:19|
 :skolemid |5|
 :pattern ( (IdenticalOnKnownLocations Heap@@2 ExhaleHeap@@0 Mask@@1) (IsWandField pm_f@@0) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))
)))
(assert  (and (= (Ctor PredicateType_p1Type) 14) (forall ((arg0@@30 T@U) ) (! (= (type (p1 arg0@@30)) (FieldType PredicateType_p1Type FrameTypeType))
 :qid |funType:p1|
 :pattern ( (p1 arg0@@30))
))))
(assert (forall ((a_1@@1 T@U) ) (!  (=> (= (type a_1@@1) RefType) (IsPredicateField (p1 a_1@@1)))
 :qid |stdinbpl.668:15|
 :skolemid |66|
 :pattern ( (p1 a_1@@1))
)))
(assert (forall ((Heap@@3 T@U) (a_1@@2 T@U) ) (!  (=> (and (= (type Heap@@3) (MapType0Type RefType)) (= (type a_1@@2) RefType)) (|p1#everUsed| (p1 a_1@@2)))
 :qid |stdinbpl.687:15|
 :skolemid |70|
 :pattern ( (|p1#trigger| Heap@@3 (p1 a_1@@2)))
)))
(assert (forall ((arg0@@31 T@U) (arg1@@12 Int) (arg2@@3 T@U) ) (! (let ((T@@3 (type arg2@@3)))
(= (type (|Seq#Update| arg0@@31 arg1@@12 arg2@@3)) (SeqType T@@3)))
 :qid |funType:Seq#Update|
 :pattern ( (|Seq#Update| arg0@@31 arg1@@12 arg2@@3))
)))
(assert (forall ((s@@1 T@U) (i Int) (v T@U) (n@@1 Int) ) (! (let ((T@@4 (type v)))
 (=> (= (type s@@1) (SeqType T@@4)) (=> (and (<= 0 n@@1) (< n@@1 (|Seq#Length| s@@1))) (and (=> (= i n@@1) (= (|Seq#Index| (|Seq#Update| s@@1 i v) n@@1) v)) (=> (not (= i n@@1)) (= (|Seq#Index| (|Seq#Update| s@@1 i v) n@@1) (|Seq#Index| s@@1 n@@1)))))))
 :qid |stdinbpl.319:18|
 :skolemid |35|
 :pattern ( (|Seq#Index| (|Seq#Update| s@@1 i v) n@@1))
 :pattern ( (|Seq#Index| s@@1 n@@1) (|Seq#Update| s@@1 i v))
)))
(assert (forall ((arg0@@32 T@U) (arg1@@13 Int) ) (! (let ((T@@5 (SeqTypeInv0 (type arg0@@32))))
(= (type (|Seq#Take| arg0@@32 arg1@@13)) (SeqType T@@5)))
 :qid |funType:Seq#Take|
 :pattern ( (|Seq#Take| arg0@@32 arg1@@13))
)))
(assert (forall ((s@@2 T@U) (n@@2 Int) ) (! (let ((T@@6 (SeqTypeInv0 (type s@@2))))
 (=> (= (type s@@2) (SeqType T@@6)) (and (=> (<= 0 n@@2) (and (=> (<= n@@2 (|Seq#Length| s@@2)) (= (|Seq#Length| (|Seq#Take| s@@2 n@@2)) n@@2)) (=> (< (|Seq#Length| s@@2) n@@2) (= (|Seq#Length| (|Seq#Take| s@@2 n@@2)) (|Seq#Length| s@@2))))) (=> (< n@@2 0) (= (|Seq#Length| (|Seq#Take| s@@2 n@@2)) 0)))))
 :qid |stdinbpl.330:18|
 :skolemid |36|
 :pattern ( (|Seq#Length| (|Seq#Take| s@@2 n@@2)))
 :pattern ( (|Seq#Take| s@@2 n@@2) (|Seq#Length| s@@2))
)))
(assert (forall ((arg0@@33 Int) (arg1@@14 Int) ) (! (= (type (|Seq#Range| arg0@@33 arg1@@14)) (SeqType intType))
 :qid |funType:Seq#Range|
 :pattern ( (|Seq#Range| arg0@@33 arg1@@14))
)))
(assert (forall ((q@min Int) (q@max Int) (v@@0 T@U) ) (!  (=> (= (type v@@0) intType) (= (|Seq#Contains| (|Seq#Range| q@min q@max) v@@0)  (and (<= q@min (U_2_int v@@0)) (< (U_2_int v@@0) q@max))))
 :qid |stdinbpl.603:15|
 :skolemid |57|
 :pattern ( (|Seq#Contains| (|Seq#Range| q@min q@max) v@@0))
)))
(assert (forall ((s@@3 T@U) (x@@8 T@U) ) (! (let ((T@@7 (type x@@8)))
 (=> (and (= (type s@@3) (SeqType T@@7)) (|Seq#Contains| s@@3 x@@8)) (and (and (<= 0 (|Seq#Skolem| s@@3 x@@8)) (< (|Seq#Skolem| s@@3 x@@8) (|Seq#Length| s@@3))) (= (|Seq#Index| s@@3 (|Seq#Skolem| s@@3 x@@8)) x@@8))))
 :qid |stdinbpl.461:18|
 :skolemid |47|
 :pattern ( (|Seq#Contains| s@@3 x@@8))
)))
(assert (forall ((Heap@@4 T@U) (ExhaleHeap@@1 T@U) (Mask@@2 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@4) (MapType0Type RefType)) (= (type ExhaleHeap@@1) (MapType0Type RefType))) (= (type Mask@@2) (MapType1Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@4 ExhaleHeap@@1 Mask@@2)) (U_2_bool (MapType0Select Heap@@4 o_1 $allocated))) (U_2_bool (MapType0Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.73:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@4 ExhaleHeap@@1 Mask@@2) (MapType0Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert (forall ((s@@4 T@U) (n@@3 Int) ) (! (let ((T@@8 (SeqTypeInv0 (type s@@4))))
 (=> (and (= (type s@@4) (SeqType T@@8)) (<= n@@3 0)) (= (|Seq#Drop| s@@4 n@@3) s@@4)))
 :qid |stdinbpl.445:18|
 :skolemid |45|
 :pattern ( (|Seq#Drop| s@@4 n@@3))
)))
(assert (forall ((i@@0 Int) (j@@0 Int) ) (! (= (|Seq#Sub| i@@0 j@@0) (- i@@0 j@@0))
 :qid |stdinbpl.299:15|
 :skolemid |30|
 :pattern ( (|Seq#Sub| i@@0 j@@0))
)))
(assert (forall ((i@@1 Int) (j@@1 Int) ) (! (= (|Seq#Add| i@@1 j@@1) (+ i@@1 j@@1))
 :qid |stdinbpl.297:15|
 :skolemid |29|
 :pattern ( (|Seq#Add| i@@1 j@@1))
)))
(assert (forall ((arg0@@34 T@U) ) (! (let ((T@@9 (type arg0@@34)))
(= (type (|Seq#Singleton| arg0@@34)) (SeqType T@@9)))
 :qid |funType:Seq#Singleton|
 :pattern ( (|Seq#Singleton| arg0@@34))
)))
(assert (forall ((x@@9 T@U) (y@@1 T@U) ) (! (let ((T@@10 (type x@@9)))
 (=> (= (type y@@1) T@@10) (= (|Seq#Contains| (|Seq#Singleton| x@@9) y@@1) (= x@@9 y@@1))))
 :qid |stdinbpl.586:18|
 :skolemid |54|
 :pattern ( (|Seq#Contains| (|Seq#Singleton| x@@9) y@@1))
)))
(assert (forall ((a_1@@3 T@U) (b_1@@1 Int) (a2 T@U) (b2 Int) ) (!  (=> (and (and (= (type a_1@@3) RefType) (= (type a2) RefType)) (= (p2 a_1@@3 b_1@@1) (p2 a2 b2))) (and (= a_1@@3 a2) (= b_1@@1 b2)))
 :qid |stdinbpl.731:15|
 :skolemid |74|
 :pattern ( (p2 a_1@@3 b_1@@1) (p2 a2 b2))
)))
(assert (forall ((arg0@@35 T@U) (arg1@@15 Int) ) (! (= (type (|p2#sm| arg0@@35 arg1@@15)) (FieldType PredicateType_p2Type (MapType1Type RefType boolType)))
 :qid |funType:p2#sm|
 :pattern ( (|p2#sm| arg0@@35 arg1@@15))
)))
(assert (forall ((a_1@@4 T@U) (b_1@@2 Int) (a2@@0 T@U) (b2@@0 Int) ) (!  (=> (and (and (= (type a_1@@4) RefType) (= (type a2@@0) RefType)) (= (|p2#sm| a_1@@4 b_1@@2) (|p2#sm| a2@@0 b2@@0))) (and (= a_1@@4 a2@@0) (= b_1@@2 b2@@0)))
 :qid |stdinbpl.735:15|
 :skolemid |75|
 :pattern ( (|p2#sm| a_1@@4 b_1@@2) (|p2#sm| a2@@0 b2@@0))
)))
(assert (forall ((s@@5 T@U) (n@@4 Int) (j@@2 Int) ) (! (let ((T@@11 (SeqTypeInv0 (type s@@5))))
 (=> (= (type s@@5) (SeqType T@@11)) (=> (and (and (<= 0 j@@2) (< j@@2 n@@4)) (< j@@2 (|Seq#Length| s@@5))) (= (|Seq#Index| (|Seq#Take| s@@5 n@@4) j@@2) (|Seq#Index| s@@5 j@@2)))))
 :qid |stdinbpl.338:18|
 :skolemid |37|
 :pattern ( (|Seq#Index| (|Seq#Take| s@@5 n@@4) j@@2))
 :pattern ( (|Seq#Index| s@@5 j@@2) (|Seq#Take| s@@5 n@@4))
)))
(assert (forall ((a_1@@5 T@U) (a2@@1 T@U) ) (!  (=> (and (and (= (type a_1@@5) RefType) (= (type a2@@1) RefType)) (= (p1 a_1@@5) (p1 a2@@1))) (= a_1@@5 a2@@1))
 :qid |stdinbpl.678:15|
 :skolemid |68|
 :pattern ( (p1 a_1@@5) (p1 a2@@1))
)))
(assert (forall ((arg0@@36 T@U) ) (! (= (type (|p1#sm| arg0@@36)) (FieldType PredicateType_p1Type (MapType1Type RefType boolType)))
 :qid |funType:p1#sm|
 :pattern ( (|p1#sm| arg0@@36))
)))
(assert (forall ((a_1@@6 T@U) (a2@@2 T@U) ) (!  (=> (and (and (= (type a_1@@6) RefType) (= (type a2@@2) RefType)) (= (|p1#sm| a_1@@6) (|p1#sm| a2@@2))) (= a_1@@6 a2@@2))
 :qid |stdinbpl.682:15|
 :skolemid |69|
 :pattern ( (|p1#sm| a_1@@6) (|p1#sm| a2@@2))
)))
(assert (forall ((Heap@@5 T@U) (ExhaleHeap@@2 T@U) (Mask@@3 T@U) (o_1@@0 T@U) (f_2 T@U) ) (! (let ((B@@1 (FieldTypeInv1 (type f_2))))
(let ((A@@1 (FieldTypeInv0 (type f_2))))
 (=> (and (and (and (and (and (and (= (type Heap@@5) (MapType0Type RefType)) (= (type ExhaleHeap@@2) (MapType0Type RefType))) (= (type Mask@@3) (MapType1Type RefType realType))) (= (type o_1@@0) RefType)) (= (type f_2) (FieldType A@@1 B@@1))) (IdenticalOnKnownLocations Heap@@5 ExhaleHeap@@2 Mask@@3)) (HasDirectPerm Mask@@3 o_1@@0 f_2)) (= (MapType0Select Heap@@5 o_1@@0 f_2) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2)))))
 :qid |stdinbpl.42:22|
 :skolemid |1|
 :pattern ( (IdenticalOnKnownLocations Heap@@5 ExhaleHeap@@2 Mask@@3) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2))
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
 :qid |stdinbpl.242:19|
 :skolemid |21|
 :pattern ( (InsidePredicate p v_1 p w))
)))
(assert (forall ((arg0@@37 T@U) (arg1@@16 T@U) ) (! (let ((T@@14 (SeqTypeInv0 (type arg0@@37))))
(= (type (|Seq#Append| arg0@@37 arg1@@16)) (SeqType T@@14)))
 :qid |funType:Seq#Append|
 :pattern ( (|Seq#Append| arg0@@37 arg1@@16))
)))
(assert (forall ((s0 T@U) (s1 T@U) (n@@5 Int) ) (! (let ((T@@15 (SeqTypeInv0 (type s0))))
 (=> (and (= (type s0) (SeqType T@@15)) (= (type s1) (SeqType T@@15))) (=> (and (and (and (not (= s0 (|Seq#Empty| T@@15))) (not (= s1 (|Seq#Empty| T@@15)))) (<= (|Seq#Length| s0) n@@5)) (< n@@5 (|Seq#Length| (|Seq#Append| s0 s1)))) (and (= (|Seq#Add| (|Seq#Sub| n@@5 (|Seq#Length| s0)) (|Seq#Length| s0)) n@@5) (= (|Seq#Index| (|Seq#Append| s0 s1) n@@5) (|Seq#Index| s1 (|Seq#Sub| n@@5 (|Seq#Length| s0))))))))
 :qid |stdinbpl.310:18|
 :skolemid |32|
 :pattern ( (|Seq#Index| (|Seq#Append| s0 s1) n@@5))
)))
(assert  (not (IsPredicateField f_7)))
(assert  (not (IsWandField f_7)))
(assert  (not (IsPredicateField g)))
(assert  (not (IsWandField g)))
(assert (forall ((Heap@@6 T@U) (ExhaleHeap@@3 T@U) (Mask@@4 T@U) ) (!  (=> (and (and (and (= (type Heap@@6) (MapType0Type RefType)) (= (type ExhaleHeap@@3) (MapType0Type RefType))) (= (type Mask@@4) (MapType1Type RefType realType))) (IdenticalOnKnownLocations Heap@@6 ExhaleHeap@@3 Mask@@4)) (succHeap Heap@@6 ExhaleHeap@@3))
 :qid |stdinbpl.83:15|
 :skolemid |10|
 :pattern ( (IdenticalOnKnownLocations Heap@@6 ExhaleHeap@@3 Mask@@4))
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
(assert  (and (forall ((arg0@@38 Real) (arg1@@17 T@U) ) (! (= (type (ConditionalFrame arg0@@38 arg1@@17)) FrameTypeType)
 :qid |funType:ConditionalFrame|
 :pattern ( (ConditionalFrame arg0@@38 arg1@@17))
)) (= (type EmptyFrame) FrameTypeType)))
(assert (forall ((p@@0 Real) (f_6 T@U) ) (!  (=> (= (type f_6) FrameTypeType) (= (ConditionalFrame p@@0 f_6) (ite (> p@@0 0.0) f_6 EmptyFrame)))
 :qid |stdinbpl.230:15|
 :skolemid |19|
 :pattern ( (ConditionalFrame p@@0 f_6))
)))
(assert (forall ((q@min@@0 Int) (q@max@@0 Int) (j@@3 Int) ) (!  (=> (and (<= 0 j@@3) (< j@@3 (- q@max@@0 q@min@@0))) (= (U_2_int (|Seq#Index| (|Seq#Range| q@min@@0 q@max@@0) j@@3)) (+ q@min@@0 j@@3)))
 :qid |stdinbpl.601:15|
 :skolemid |56|
 :pattern ( (|Seq#Index| (|Seq#Range| q@min@@0 q@max@@0) j@@3))
)))
(assert (forall ((Mask@@5 T@U) (o_2@@0 T@U) (f_4@@0 T@U) ) (! (let ((B@@3 (FieldTypeInv1 (type f_4@@0))))
(let ((A@@4 (FieldTypeInv0 (type f_4@@0))))
 (=> (and (and (= (type Mask@@5) (MapType1Type RefType realType)) (= (type o_2@@0) RefType)) (= (type f_4@@0) (FieldType A@@4 B@@3))) (= (HasDirectPerm Mask@@5 o_2@@0 f_4@@0) (> (U_2_real (MapType1Select Mask@@5 o_2@@0 f_4@@0)) NoPerm)))))
 :qid |stdinbpl.133:22|
 :skolemid |17|
 :pattern ( (HasDirectPerm Mask@@5 o_2@@0 f_4@@0))
)))
(assert (forall ((s0@@0 T@U) (s1@@0 T@U) ) (! (let ((T@@16 (SeqTypeInv0 (type s0@@0))))
 (=> (and (and (= (type s0@@0) (SeqType T@@16)) (= (type s1@@0) (SeqType T@@16))) (and (not (= s0@@0 (|Seq#Empty| T@@16))) (not (= s1@@0 (|Seq#Empty| T@@16))))) (= (|Seq#Length| (|Seq#Append| s0@@0 s1@@0)) (+ (|Seq#Length| s0@@0) (|Seq#Length| s1@@0)))))
 :qid |stdinbpl.279:18|
 :skolemid |26|
 :pattern ( (|Seq#Length| (|Seq#Append| s0@@0 s1@@0)))
)))
(assert (forall ((s@@6 T@U) (t T@U) (n@@6 Int) ) (! (let ((T@@17 (SeqTypeInv0 (type s@@6))))
 (=> (and (and (= (type s@@6) (SeqType T@@17)) (= (type t) (SeqType T@@17))) (and (> n@@6 0) (> n@@6 (|Seq#Length| s@@6)))) (and (= (|Seq#Add| (|Seq#Sub| n@@6 (|Seq#Length| s@@6)) (|Seq#Length| s@@6)) n@@6) (= (|Seq#Drop| (|Seq#Append| s@@6 t) n@@6) (|Seq#Drop| t (|Seq#Sub| n@@6 (|Seq#Length| s@@6)))))))
 :qid |stdinbpl.435:18|
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
 :qid |stdinbpl.422:18|
 :skolemid |42|
 :pattern ( (|Seq#Take| (|Seq#Append| s@@7 t@@0) n@@7))
)))
(assert (forall ((q@min@@1 Int) (q@max@@1 Int) ) (!  (and (=> (< q@min@@1 q@max@@1) (= (|Seq#Length| (|Seq#Range| q@min@@1 q@max@@1)) (- q@max@@1 q@min@@1))) (=> (<= q@max@@1 q@min@@1) (= (|Seq#Length| (|Seq#Range| q@min@@1 q@max@@1)) 0)))
 :qid |stdinbpl.600:15|
 :skolemid |55|
 :pattern ( (|Seq#Length| (|Seq#Range| q@min@@1 q@max@@1)))
)))
(assert (forall ((a T@U) (b T@U) ) (! (let ((T@@19 (SeqTypeInv0 (type a))))
 (=> (and (and (= (type a) (SeqType T@@19)) (= (type b) (SeqType T@@19))) (|Seq#Equal| a b)) (= a b)))
 :qid |stdinbpl.573:18|
 :skolemid |53|
 :pattern ( (|Seq#Equal| a b))
)))
(assert (forall ((s@@8 T@U) (i@@2 Int) ) (! (let ((T@@20 (SeqTypeInv0 (type s@@8))))
 (=> (= (type s@@8) (SeqType T@@20)) (=> (and (<= 0 i@@2) (< i@@2 (|Seq#Length| s@@8))) (|Seq#ContainsTrigger| s@@8 (|Seq#Index| s@@8 i@@2)))))
 :qid |stdinbpl.466:18|
 :skolemid |49|
 :pattern ( (|Seq#Index| s@@8 i@@2))
)))
(assert (forall ((s0@@1 T@U) (s1@@1 T@U) ) (! (let ((T@@21 (SeqTypeInv0 (type s0@@1))))
 (=> (and (= (type s0@@1) (SeqType T@@21)) (= (type s1@@1) (SeqType T@@21))) (and (=> (= s0@@1 (|Seq#Empty| T@@21)) (= (|Seq#Append| s0@@1 s1@@1) s1@@1)) (=> (= s1@@1 (|Seq#Empty| T@@21)) (= (|Seq#Append| s0@@1 s1@@1) s0@@1)))))
 :qid |stdinbpl.285:18|
 :skolemid |27|
 :pattern ( (|Seq#Append| s0@@1 s1@@1))
)))
(assert (forall ((t@@1 T@U) ) (! (= (|Seq#Index| (|Seq#Singleton| t@@1) 0) t@@1)
 :qid |stdinbpl.289:18|
 :skolemid |28|
 :pattern ( (|Seq#Singleton| t@@1))
)))
(assert (forall ((s@@9 T@U) ) (! (let ((T@@22 (SeqTypeInv0 (type s@@9))))
 (=> (= (type s@@9) (SeqType T@@22)) (<= 0 (|Seq#Length| s@@9))))
 :qid |stdinbpl.268:18|
 :skolemid |22|
 :pattern ( (|Seq#Length| s@@9))
)))
(assert (forall ((a_1@@7 T@U) (b_1@@3 Int) ) (!  (=> (= (type a_1@@7) RefType) (= (getPredWandId (p2 a_1@@7 b_1@@3)) 1))
 :qid |stdinbpl.725:15|
 :skolemid |73|
 :pattern ( (p2 a_1@@7 b_1@@3))
)))
(assert  (and (= (Ctor WandType_wandType) 15) (forall ((arg0@@39 T@U) (arg1@@18 Real) (arg2@@4 Bool) (arg3@@1 T@U) (arg4 Real) (arg5 T@U) (arg6 Int) ) (! (= (type (wand arg0@@39 arg1@@18 arg2@@4 arg3@@1 arg4 arg5 arg6)) (FieldType WandType_wandType intType))
 :qid |funType:wand|
 :pattern ( (wand arg0@@39 arg1@@18 arg2@@4 arg3@@1 arg4 arg5 arg6))
))))
(assert (forall ((arg1@@19 T@U) (arg2@@5 Real) (arg3@@2 Bool) (arg4@@0 T@U) (arg5@@0 Real) (arg6@@0 T@U) (arg7 Int) (arg1_2 T@U) (arg2_2 Real) (arg3_2 Bool) (arg4_2 T@U) (arg5_2 Real) (arg6_2 T@U) (arg7_2 Int) ) (!  (=> (and (and (and (and (and (and (= (type arg1@@19) RefType) (= (type arg4@@0) RefType)) (= (type arg6@@0) RefType)) (= (type arg1_2) RefType)) (= (type arg4_2) RefType)) (= (type arg6_2) RefType)) (= (wand arg1@@19 arg2@@5 arg3@@2 arg4@@0 arg5@@0 arg6@@0 arg7) (wand arg1_2 arg2_2 arg3_2 arg4_2 arg5_2 arg6_2 arg7_2))) (and (= arg1@@19 arg1_2) (and (= arg2@@5 arg2_2) (and (= arg3@@2 arg3_2) (and (= arg4@@0 arg4_2) (and (= arg5@@0 arg5_2) (and (= arg6@@0 arg6_2) (= arg7 arg7_2))))))))
 :qid |stdinbpl.641:15|
 :skolemid |64|
 :pattern ( (wand arg1@@19 arg2@@5 arg3@@2 arg4@@0 arg5@@0 arg6@@0 arg7) (wand arg1_2 arg2_2 arg3_2 arg4_2 arg5_2 arg6_2 arg7_2))
)))
(assert (forall ((s0@@2 T@U) (s1@@2 T@U) ) (! (let ((T@@23 (SeqTypeInv0 (type s0@@2))))
 (=> (and (and (= (type s0@@2) (SeqType T@@23)) (= (type s1@@2) (SeqType T@@23))) (|Seq#Equal| s0@@2 s1@@2)) (and (= (|Seq#Length| s0@@2) (|Seq#Length| s1@@2)) (forall ((j@@4 Int) ) (!  (=> (and (<= 0 j@@4) (< j@@4 (|Seq#Length| s0@@2))) (= (|Seq#Index| s0@@2 j@@4) (|Seq#Index| s1@@2 j@@4)))
 :qid |stdinbpl.563:13|
 :skolemid |50|
 :pattern ( (|Seq#Index| s0@@2 j@@4))
 :pattern ( (|Seq#Index| s1@@2 j@@4))
)))))
 :qid |stdinbpl.560:18|
 :skolemid |51|
 :pattern ( (|Seq#Equal| s0@@2 s1@@2))
)))
(assert (forall ((Heap@@7 T@U) (ExhaleHeap@@4 T@U) (Mask@@6 T@U) (pm_f@@1 T@U) ) (! (let ((C@@1 (FieldTypeInv0 (type pm_f@@1))))
 (=> (and (and (and (and (and (= (type Heap@@7) (MapType0Type RefType)) (= (type ExhaleHeap@@4) (MapType0Type RefType))) (= (type Mask@@6) (MapType1Type RefType realType))) (= (type pm_f@@1) (FieldType C@@1 FrameTypeType))) (IdenticalOnKnownLocations Heap@@7 ExhaleHeap@@4 Mask@@6)) (and (HasDirectPerm Mask@@6 null pm_f@@1) (IsPredicateField pm_f@@1))) (forall ((o2 T@U) (f_2@@0 T@U) ) (! (let ((B@@5 (FieldTypeInv1 (type f_2@@0))))
(let ((A@@6 (FieldTypeInv0 (type f_2@@0))))
 (=> (and (and (= (type o2) RefType) (= (type f_2@@0) (FieldType A@@6 B@@5))) (U_2_bool (MapType1Select (MapType0Select Heap@@7 null (PredicateMaskField pm_f@@1)) o2 f_2@@0))) (= (MapType0Select Heap@@7 o2 f_2@@0) (MapType0Select ExhaleHeap@@4 o2 f_2@@0)))))
 :qid |stdinbpl.54:134|
 :skolemid |3|
 :pattern ( (MapType0Select ExhaleHeap@@4 o2 f_2@@0))
))))
 :qid |stdinbpl.52:19|
 :skolemid |4|
 :pattern ( (IdenticalOnKnownLocations Heap@@7 ExhaleHeap@@4 Mask@@6) (IsPredicateField pm_f@@1))
)))
(assert (forall ((Heap@@8 T@U) (ExhaleHeap@@5 T@U) (Mask@@7 T@U) (pm_f@@2 T@U) ) (! (let ((C@@2 (FieldTypeInv0 (type pm_f@@2))))
 (=> (and (and (and (and (and (= (type Heap@@8) (MapType0Type RefType)) (= (type ExhaleHeap@@5) (MapType0Type RefType))) (= (type Mask@@7) (MapType1Type RefType realType))) (= (type pm_f@@2) (FieldType C@@2 FrameTypeType))) (IdenticalOnKnownLocations Heap@@8 ExhaleHeap@@5 Mask@@7)) (and (HasDirectPerm Mask@@7 null pm_f@@2) (IsWandField pm_f@@2))) (forall ((o2@@0 T@U) (f_2@@1 T@U) ) (! (let ((B@@6 (FieldTypeInv1 (type f_2@@1))))
(let ((A@@7 (FieldTypeInv0 (type f_2@@1))))
 (=> (and (and (= (type o2@@0) RefType) (= (type f_2@@1) (FieldType A@@7 B@@6))) (U_2_bool (MapType1Select (MapType0Select Heap@@8 null (WandMaskField pm_f@@2)) o2@@0 f_2@@1))) (= (MapType0Select Heap@@8 o2@@0 f_2@@1) (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1)))))
 :qid |stdinbpl.67:129|
 :skolemid |6|
 :pattern ( (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1))
))))
 :qid |stdinbpl.65:19|
 :skolemid |7|
 :pattern ( (IdenticalOnKnownLocations Heap@@8 ExhaleHeap@@5 Mask@@7) (IsWandField pm_f@@2))
)))
(assert (forall ((a_1@@8 T@U) ) (!  (=> (= (type a_1@@8) RefType) (= (getPredWandId (p1 a_1@@8)) 0))
 :qid |stdinbpl.672:15|
 :skolemid |67|
 :pattern ( (p1 a_1@@8))
)))
(assert (forall ((t@@2 T@U) ) (! (= (|Seq#Length| (|Seq#Singleton| t@@2)) 1)
 :qid |stdinbpl.276:18|
 :skolemid |25|
 :pattern ( (|Seq#Singleton| t@@2))
)))
(assert (forall ((Mask@@8 T@U) (o_2@@2 T@U) (f_4@@2 T@U) ) (! (let ((B@@7 (FieldTypeInv1 (type f_4@@2))))
(let ((A@@8 (FieldTypeInv0 (type f_4@@2))))
 (=> (and (and (and (= (type Mask@@8) (MapType1Type RefType realType)) (= (type o_2@@2) RefType)) (= (type f_4@@2) (FieldType A@@8 B@@7))) (GoodMask Mask@@8)) (and (>= (U_2_real (MapType1Select Mask@@8 o_2@@2 f_4@@2)) NoPerm) (=> (and (and (GoodMask Mask@@8) (not (IsPredicateField f_4@@2))) (not (IsWandField f_4@@2))) (<= (U_2_real (MapType1Select Mask@@8 o_2@@2 f_4@@2)) FullPerm))))))
 :qid |stdinbpl.128:22|
 :skolemid |16|
 :pattern ( (GoodMask Mask@@8) (MapType1Select Mask@@8 o_2@@2 f_4@@2))
)))
(assert (forall ((o T@U) (f T@U) (Heap@@9 T@U) ) (!  (=> (and (and (and (= (type o) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap@@9) (MapType0Type RefType))) (U_2_bool (MapType0Select Heap@@9 o $allocated))) (U_2_bool (MapType0Select Heap@@9 (MapType0Select Heap@@9 o f) $allocated)))
 :qid |stdinbpl.31:15|
 :skolemid |0|
 :pattern ( (MapType0Select Heap@@9 o f))
)))
(assert (forall ((a_1@@9 T@U) (b_1@@4 Int) ) (!  (=> (= (type a_1@@9) RefType) (= (PredicateMaskField (p2 a_1@@9 b_1@@4)) (|p2#sm| a_1@@9 b_1@@4)))
 :qid |stdinbpl.717:15|
 :skolemid |71|
 :pattern ( (PredicateMaskField (p2 a_1@@9 b_1@@4)))
)))
(assert (forall ((s@@10 T@U) (t@@3 T@U) (n@@8 Int) ) (! (let ((T@@24 (SeqTypeInv0 (type s@@10))))
 (=> (and (and (= (type s@@10) (SeqType T@@24)) (= (type t@@3) (SeqType T@@24))) (and (< 0 n@@8) (<= n@@8 (|Seq#Length| s@@10)))) (= (|Seq#Take| (|Seq#Append| s@@10 t@@3) n@@8) (|Seq#Take| s@@10 n@@8))))
 :qid |stdinbpl.418:18|
 :skolemid |41|
 :pattern ( (|Seq#Take| (|Seq#Append| s@@10 t@@3) n@@8))
)))
(assert (forall ((s@@11 T@U) (i@@3 Int) (v@@1 T@U) ) (! (let ((T@@25 (type v@@1)))
 (=> (= (type s@@11) (SeqType T@@25)) (=> (and (<= 0 i@@3) (< i@@3 (|Seq#Length| s@@11))) (= (|Seq#Length| (|Seq#Update| s@@11 i@@3 v@@1)) (|Seq#Length| s@@11)))))
 :qid |stdinbpl.317:18|
 :skolemid |34|
 :pattern ( (|Seq#Length| (|Seq#Update| s@@11 i@@3 v@@1)))
 :pattern ( (|Seq#Length| s@@11) (|Seq#Update| s@@11 i@@3 v@@1))
)))
(assert (forall ((a_1@@10 T@U) ) (!  (=> (= (type a_1@@10) RefType) (= (PredicateMaskField (p1 a_1@@10)) (|p1#sm| a_1@@10)))
 :qid |stdinbpl.664:15|
 :skolemid |65|
 :pattern ( (PredicateMaskField (p1 a_1@@10)))
)))
(assert (forall ((s@@12 T@U) (t@@4 T@U) (n@@9 Int) ) (! (let ((T@@26 (SeqTypeInv0 (type s@@12))))
 (=> (and (and (= (type s@@12) (SeqType T@@26)) (= (type t@@4) (SeqType T@@26))) (and (< 0 n@@9) (<= n@@9 (|Seq#Length| s@@12)))) (= (|Seq#Drop| (|Seq#Append| s@@12 t@@4) n@@9) (|Seq#Append| (|Seq#Drop| s@@12 n@@9) t@@4))))
 :qid |stdinbpl.431:18|
 :skolemid |43|
 :pattern ( (|Seq#Drop| (|Seq#Append| s@@12 t@@4) n@@9))
)))
(assert (forall ((s@@13 T@U) (n@@10 Int) (i@@4 Int) ) (! (let ((T@@27 (SeqTypeInv0 (type s@@13))))
 (=> (= (type s@@13) (SeqType T@@27)) (=> (and (and (< 0 n@@10) (<= n@@10 i@@4)) (< i@@4 (|Seq#Length| s@@13))) (and (= (|Seq#Add| (|Seq#Sub| i@@4 n@@10) n@@10) i@@4) (= (|Seq#Index| (|Seq#Drop| s@@13 n@@10) (|Seq#Sub| i@@4 n@@10)) (|Seq#Index| s@@13 i@@4))))))
 :qid |stdinbpl.368:18|
 :skolemid |40|
 :pattern ( (|Seq#Drop| s@@13 n@@10) (|Seq#Index| s@@13 i@@4))
)))
(assert (forall ((s0@@3 T@U) (s1@@3 T@U) (n@@11 Int) ) (! (let ((T@@28 (SeqTypeInv0 (type s0@@3))))
 (=> (and (= (type s0@@3) (SeqType T@@28)) (= (type s1@@3) (SeqType T@@28))) (=> (and (and (and (not (= s0@@3 (|Seq#Empty| T@@28))) (not (= s1@@3 (|Seq#Empty| T@@28)))) (<= 0 n@@11)) (< n@@11 (|Seq#Length| s0@@3))) (= (|Seq#Index| (|Seq#Append| s0@@3 s1@@3) n@@11) (|Seq#Index| s0@@3 n@@11)))))
 :qid |stdinbpl.308:18|
 :skolemid |31|
 :pattern ( (|Seq#Index| (|Seq#Append| s0@@3 s1@@3) n@@11))
 :pattern ( (|Seq#Index| s0@@3 n@@11) (|Seq#Append| s0@@3 s1@@3))
)))
(assert (forall ((Heap@@10 T@U) (o@@0 T@U) (f_3 T@U) (v@@2 T@U) ) (! (let ((B@@8 (type v@@2)))
(let ((A@@9 (FieldTypeInv0 (type f_3))))
 (=> (and (and (= (type Heap@@10) (MapType0Type RefType)) (= (type o@@0) RefType)) (= (type f_3) (FieldType A@@9 B@@8))) (succHeap Heap@@10 (MapType0Store Heap@@10 o@@0 f_3 v@@2)))))
 :qid |stdinbpl.78:22|
 :skolemid |9|
 :pattern ( (MapType0Store Heap@@10 o@@0 f_3 v@@2))
)))
(assert  (and (forall ((arg0@@40 T@U) (arg1@@20 Real) (arg2@@6 Bool) (arg3@@3 T@U) (arg4@@1 Real) (arg5@@1 T@U) (arg6@@1 Int) ) (! (= (type (|wand#ft| arg0@@40 arg1@@20 arg2@@6 arg3@@3 arg4@@1 arg5@@1 arg6@@1)) (FieldType WandType_wandType FrameTypeType))
 :qid |funType:wand#ft|
 :pattern ( (|wand#ft| arg0@@40 arg1@@20 arg2@@6 arg3@@3 arg4@@1 arg5@@1 arg6@@1))
)) (forall ((arg0@@41 T@U) (arg1@@21 Real) (arg2@@7 Bool) (arg3@@4 T@U) (arg4@@2 Real) (arg5@@2 T@U) (arg6@@2 Int) ) (! (= (type (|wand#sm| arg0@@41 arg1@@21 arg2@@7 arg3@@4 arg4@@2 arg5@@2 arg6@@2)) (FieldType WandType_wandType (MapType1Type RefType boolType)))
 :qid |funType:wand#sm|
 :pattern ( (|wand#sm| arg0@@41 arg1@@21 arg2@@7 arg3@@4 arg4@@2 arg5@@2 arg6@@2))
))))
(assert (forall ((arg1@@22 T@U) (arg2@@8 Real) (arg3@@5 Bool) (arg4@@3 T@U) (arg5@@3 Real) (arg6@@3 T@U) (arg7@@0 Int) ) (!  (=> (and (and (= (type arg1@@22) RefType) (= (type arg4@@3) RefType)) (= (type arg6@@3) RefType)) (= (|wand#sm| arg1@@22 arg2@@8 arg3@@5 arg4@@3 arg5@@3 arg6@@3 arg7@@0) (WandMaskField (|wand#ft| arg1@@22 arg2@@8 arg3@@5 arg4@@3 arg5@@3 arg6@@3 arg7@@0))))
 :qid |stdinbpl.633:15|
 :skolemid |62|
 :pattern ( (WandMaskField (|wand#ft| arg1@@22 arg2@@8 arg3@@5 arg4@@3 arg5@@3 arg6@@3 arg7@@0)))
)))
(assert (forall ((s0@@4 T@U) (s1@@4 T@U) (m@@7 Int) ) (! (let ((T@@29 (SeqTypeInv0 (type s0@@4))))
 (=> (and (= (type s0@@4) (SeqType T@@29)) (= (type s1@@4) (SeqType T@@29))) (=> (and (and (and (not (= s0@@4 (|Seq#Empty| T@@29))) (not (= s1@@4 (|Seq#Empty| T@@29)))) (<= 0 m@@7)) (< m@@7 (|Seq#Length| s1@@4))) (and (= (|Seq#Sub| (|Seq#Add| m@@7 (|Seq#Length| s0@@4)) (|Seq#Length| s0@@4)) m@@7) (= (|Seq#Index| (|Seq#Append| s0@@4 s1@@4) (|Seq#Add| m@@7 (|Seq#Length| s0@@4))) (|Seq#Index| s1@@4 m@@7))))))
 :qid |stdinbpl.313:18|
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
 :qid |stdinbpl.464:18|
 :skolemid |48|
 :pattern ( (|Seq#Contains| s@@14 x@@10) (|Seq#Index| s@@14 i@@5))
)))
(assert (forall ((s0@@5 T@U) (s1@@5 T@U) ) (! (let ((T@@31 (SeqTypeInv0 (type s0@@5))))
 (=> (and (= (type s0@@5) (SeqType T@@31)) (= (type s1@@5) (SeqType T@@31))) (or (or (and (= s0@@5 s1@@5) (|Seq#Equal| s0@@5 s1@@5)) (and (and (not (= s0@@5 s1@@5)) (not (|Seq#Equal| s0@@5 s1@@5))) (not (= (|Seq#Length| s0@@5) (|Seq#Length| s1@@5))))) (and (and (and (and (and (and (not (= s0@@5 s1@@5)) (not (|Seq#Equal| s0@@5 s1@@5))) (= (|Seq#Length| s0@@5) (|Seq#Length| s1@@5))) (= (|Seq#SkolemDiff| s0@@5 s1@@5) (|Seq#SkolemDiff| s1@@5 s0@@5))) (<= 0 (|Seq#SkolemDiff| s0@@5 s1@@5))) (< (|Seq#SkolemDiff| s0@@5 s1@@5) (|Seq#Length| s0@@5))) (not (= (|Seq#Index| s0@@5 (|Seq#SkolemDiff| s0@@5 s1@@5)) (|Seq#Index| s1@@5 (|Seq#SkolemDiff| s0@@5 s1@@5))))))))
 :qid |stdinbpl.568:18|
 :skolemid |52|
 :pattern ( (|Seq#Equal| s0@@5 s1@@5))
)))
(assert (forall ((p@@1 T@U) (v_1@@0 T@U) (q T@U) (w@@0 T@U) (r T@U) (u T@U) ) (! (let ((C@@3 (FieldTypeInv0 (type r))))
(let ((B@@10 (FieldTypeInv0 (type q))))
(let ((A@@11 (FieldTypeInv0 (type p@@1))))
 (=> (and (and (and (and (and (and (= (type p@@1) (FieldType A@@11 FrameTypeType)) (= (type v_1@@0) FrameTypeType)) (= (type q) (FieldType B@@10 FrameTypeType))) (= (type w@@0) FrameTypeType)) (= (type r) (FieldType C@@3 FrameTypeType))) (= (type u) FrameTypeType)) (and (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))) (InsidePredicate p@@1 v_1@@0 r u)))))
 :qid |stdinbpl.237:25|
 :skolemid |20|
 :pattern ( (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))
)))
(assert (forall ((arg1@@23 T@U) (arg2@@9 Real) (arg3@@6 Bool) (arg4@@4 T@U) (arg5@@4 Real) (arg6@@4 T@U) (arg7@@1 Int) ) (!  (=> (and (and (= (type arg1@@23) RefType) (= (type arg4@@4) RefType)) (= (type arg6@@4) RefType)) (IsWandField (wand arg1@@23 arg2@@9 arg3@@6 arg4@@4 arg5@@4 arg6@@4 arg7@@1)))
 :qid |stdinbpl.617:15|
 :skolemid |58|
 :pattern ( (wand arg1@@23 arg2@@9 arg3@@6 arg4@@4 arg5@@4 arg6@@4 arg7@@1))
)))
(assert (forall ((arg1@@24 T@U) (arg2@@10 Real) (arg3@@7 Bool) (arg4@@5 T@U) (arg5@@5 Real) (arg6@@5 T@U) (arg7@@2 Int) ) (!  (=> (and (and (= (type arg1@@24) RefType) (= (type arg4@@5) RefType)) (= (type arg6@@5) RefType)) (IsWandField (|wand#ft| arg1@@24 arg2@@10 arg3@@7 arg4@@5 arg5@@5 arg6@@5 arg7@@2)))
 :qid |stdinbpl.621:15|
 :skolemid |59|
 :pattern ( (|wand#ft| arg1@@24 arg2@@10 arg3@@7 arg4@@5 arg5@@5 arg6@@5 arg7@@2))
)))
(assert (forall ((arg1@@25 T@U) (arg2@@11 Real) (arg3@@8 Bool) (arg4@@6 T@U) (arg5@@6 Real) (arg6@@6 T@U) (arg7@@3 Int) ) (!  (=> (and (and (= (type arg1@@25) RefType) (= (type arg4@@6) RefType)) (= (type arg6@@6) RefType)) (not (IsPredicateField (wand arg1@@25 arg2@@11 arg3@@8 arg4@@6 arg5@@6 arg6@@6 arg7@@3))))
 :qid |stdinbpl.625:15|
 :skolemid |60|
 :pattern ( (wand arg1@@25 arg2@@11 arg3@@8 arg4@@6 arg5@@6 arg6@@6 arg7@@3))
)))
(assert (forall ((arg1@@26 T@U) (arg2@@12 Real) (arg3@@9 Bool) (arg4@@7 T@U) (arg5@@7 Real) (arg6@@7 T@U) (arg7@@4 Int) ) (!  (=> (and (and (= (type arg1@@26) RefType) (= (type arg4@@7) RefType)) (= (type arg6@@7) RefType)) (not (IsPredicateField (|wand#ft| arg1@@26 arg2@@12 arg3@@9 arg4@@7 arg5@@7 arg6@@7 arg7@@4))))
 :qid |stdinbpl.629:15|
 :skolemid |61|
 :pattern ( (|wand#ft| arg1@@26 arg2@@12 arg3@@9 arg4@@7 arg5@@7 arg6@@7 arg7@@4))
)))
(assert (forall ((s@@15 T@U) ) (! (let ((T@@32 (SeqTypeInv0 (type s@@15))))
 (=> (and (= (type s@@15) (SeqType T@@32)) (= (|Seq#Length| s@@15) 0)) (= s@@15 (|Seq#Empty| T@@32))))
 :qid |stdinbpl.272:18|
 :skolemid |24|
 :pattern ( (|Seq#Length| s@@15))
)))
(assert (forall ((s@@16 T@U) (n@@12 Int) ) (! (let ((T@@33 (SeqTypeInv0 (type s@@16))))
 (=> (and (= (type s@@16) (SeqType T@@33)) (<= n@@12 0)) (= (|Seq#Take| s@@16 n@@12) (|Seq#Empty| T@@33))))
 :qid |stdinbpl.447:18|
 :skolemid |46|
 :pattern ( (|Seq#Take| s@@16 n@@12))
)))
(assert (forall ((arg1@@27 T@U) (arg2@@13 Real) (arg3@@10 Bool) (arg4@@8 T@U) (arg5@@8 Real) (arg6@@8 T@U) (arg7@@5 Int) ) (!  (=> (and (and (= (type arg1@@27) RefType) (= (type arg4@@8) RefType)) (= (type arg6@@8) RefType)) (= (getPredWandId (wand arg1@@27 arg2@@13 arg3@@10 arg4@@8 arg5@@8 arg6@@8 arg7@@5)) 2))
 :qid |stdinbpl.637:15|
 :skolemid |63|
 :pattern ( (wand arg1@@27 arg2@@13 arg3@@10 arg4@@8 arg5@@8 arg6@@8 arg7@@5))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun Mask@8 () T@U)
(declare-fun r_1 () T@U)
(declare-fun i@@6 () Int)
(declare-fun Heap@11 () T@U)
(declare-fun Heap@10 () T@U)
(declare-fun Heap@7 () T@U)
(declare-fun Heap@8 () T@U)
(declare-fun Heap@9 () T@U)
(declare-fun freshVersion@1 () T@U)
(declare-fun Mask@7 () T@U)
(declare-fun Mask@6 () T@U)
(declare-fun FrameFragment (T@U) T@U)
(declare-fun Mask@5 () T@U)
(declare-fun ExhaleHeap@0 () T@U)
(declare-fun Heap@6 () T@U)
(declare-fun newVersion@1 () T@U)
(declare-fun QPMask@3 () T@U)
(declare-fun xs () T@U)
(declare-fun Heap@5 () T@U)
(declare-fun x_12 () T@U)
(declare-fun x_5 () T@U)
(declare-fun Mask@4 () T@U)
(declare-fun neverTriggered8 (T@U) Bool)
(declare-fun QPMask@2 () T@U)
(declare-fun qpRange8 (T@U) Bool)
(declare-fun invRecv8 (T@U) T@U)
(declare-fun neverTriggered7 (T@U) Bool)
(declare-fun invRecv7 (T@U Int) T@U)
(declare-fun qpRange7 (T@U Int) Bool)
(declare-fun Heap@4 () T@U)
(declare-fun Heap@1 () T@U)
(declare-fun Heap@2 () T@U)
(declare-fun Heap@3 () T@U)
(declare-fun freshVersion@0 () T@U)
(declare-fun Mask@3 () T@U)
(declare-fun Mask@2 () T@U)
(declare-fun Mask@1 () T@U)
(declare-fun Heap@@11 () T@U)
(declare-fun Heap@0 () T@U)
(declare-fun newVersion@0 () T@U)
(declare-fun QPMask@1 () T@U)
(declare-fun x_3 () T@U)
(declare-fun qpRange6 (T@U) Bool)
(declare-fun invRecv6 (T@U) T@U)
(declare-fun QPMask@0 () T@U)
(declare-fun neverTriggered5 (T@U) Bool)
(declare-fun Mask@0 () T@U)
(declare-fun invRecv5 (T@U Int) T@U)
(declare-fun qpRange5 (T@U Int) Bool)
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (= (type xs) (SeqType RefType)) (= (type x_3) RefType)) (= (type QPMask@1) (MapType1Type RefType realType))) (= (type x_5) RefType)) (= (type Mask@4) (MapType1Type RefType realType))) (= (type x_12) RefType)) (= (type Heap@5) (MapType0Type RefType))) (= (type Mask@8) (MapType1Type RefType realType))) (= (type r_1) RefType)) (= (type Heap@11) (MapType0Type RefType))) (= (type Heap@10) (MapType0Type RefType))) (= (type Heap@8) (MapType0Type RefType))) (= (type Heap@7) (MapType0Type RefType))) (= (type Heap@9) (MapType0Type RefType))) (= (type freshVersion@1) FrameTypeType)) (= (type Mask@7) (MapType1Type RefType realType))) (= (type Mask@6) (MapType1Type RefType realType))) (forall ((arg0@@42 T@U) ) (! (= (type (FrameFragment arg0@@42)) FrameTypeType)
 :qid |funType:FrameFragment|
 :pattern ( (FrameFragment arg0@@42))
))) (= (type Mask@5) (MapType1Type RefType realType))) (= (type Heap@6) (MapType0Type RefType))) (= (type ExhaleHeap@0) (MapType0Type RefType))) (= (type newVersion@1) FrameTypeType)) (= (type QPMask@3) (MapType1Type RefType realType))) (= (type QPMask@2) (MapType1Type RefType realType))) (forall ((arg0@@43 T@U) ) (! (= (type (invRecv8 arg0@@43)) RefType)
 :qid |funType:invRecv8|
 :pattern ( (invRecv8 arg0@@43))
))) (forall ((arg0@@44 T@U) (arg1@@28 Int) ) (! (= (type (invRecv7 arg0@@44 arg1@@28)) RefType)
 :qid |funType:invRecv7|
 :pattern ( (invRecv7 arg0@@44 arg1@@28))
))) (= (type Heap@4) (MapType0Type RefType))) (= (type Heap@2) (MapType0Type RefType))) (= (type Heap@1) (MapType0Type RefType))) (= (type Heap@3) (MapType0Type RefType))) (= (type freshVersion@0) FrameTypeType)) (= (type Mask@3) (MapType1Type RefType realType))) (= (type Mask@2) (MapType1Type RefType realType))) (= (type Mask@1) (MapType1Type RefType realType))) (= (type Heap@0) (MapType0Type RefType))) (= (type Heap@@11) (MapType0Type RefType))) (= (type newVersion@0) FrameTypeType)) (forall ((arg0@@45 T@U) ) (! (= (type (invRecv6 arg0@@45)) RefType)
 :qid |funType:invRecv6|
 :pattern ( (invRecv6 arg0@@45))
))) (= (type QPMask@0) (MapType1Type RefType realType))) (= (type Mask@0) (MapType1Type RefType realType))) (forall ((arg0@@46 T@U) (arg1@@29 Int) ) (! (= (type (invRecv5 arg0@@46 arg1@@29)) RefType)
 :qid |funType:invRecv5|
 :pattern ( (invRecv5 arg0@@46 arg1@@29))
))))
(set-info :boogie-vc-id m2)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 63) (let ((anon40_correct true))
(let ((anon60_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 21) 18)) anon40_correct)))
(let ((anon60_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 19) (- 0 20)) (<= FullPerm (U_2_real (MapType1Select Mask@8 null (p2 r_1 i@@6))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@8 null (p2 r_1 i@@6)))) (=> (= (ControlFlow 0 19) 18) anon40_correct))))))
(let ((anon38_correct  (=> (= Heap@11 (MapType0Store Heap@10 null (|p2#sm| r_1 i@@6) (MapType1Store (MapType0Select Heap@10 null (|p2#sm| r_1 i@@6)) r_1 g (bool_2_U true)))) (=> (and (state Heap@11 Mask@8) (state Heap@11 Mask@8)) (and (=> (= (ControlFlow 0 22) 19) anon60_Then_correct) (=> (= (ControlFlow 0 22) 21) anon60_Else_correct))))))
(let ((anon59_Else_correct  (=> (HasDirectPerm Mask@8 null (p2 r_1 i@@6)) (=> (and (= Heap@10 Heap@7) (= (ControlFlow 0 24) 22)) anon38_correct))))
(let ((anon59_Then_correct  (=> (not (HasDirectPerm Mask@8 null (p2 r_1 i@@6))) (=> (and (and (= Heap@8 (MapType0Store Heap@7 null (|p2#sm| r_1 i@@6) ZeroPMask)) (= Heap@9 (MapType0Store Heap@8 null (p2 r_1 i@@6) freshVersion@1))) (and (= Heap@10 Heap@9) (= (ControlFlow 0 23) 22))) anon38_correct))))
(let ((anon36_correct  (=> (and (= Mask@7 (MapType1Store Mask@6 r_1 g (real_2_U (- (U_2_real (MapType1Select Mask@6 r_1 g)) FullPerm)))) (= Mask@8 (MapType1Store Mask@7 null (p2 r_1 i@@6) (real_2_U (+ (U_2_real (MapType1Select Mask@7 null (p2 r_1 i@@6))) FullPerm))))) (=> (and (and (state Heap@7 Mask@8) (state Heap@7 Mask@8)) (and (|p2#trigger| Heap@7 (p2 r_1 i@@6)) (= (MapType0Select Heap@7 null (p2 r_1 i@@6)) (FrameFragment (MapType0Select Heap@7 r_1 g))))) (and (=> (= (ControlFlow 0 25) 23) anon59_Then_correct) (=> (= (ControlFlow 0 25) 24) anon59_Else_correct))))))
(let ((anon58_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 28) 25)) anon36_correct)))
(let ((anon58_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 26) (- 0 27)) (<= FullPerm (U_2_real (MapType1Select Mask@6 r_1 g)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@6 r_1 g))) (=> (= (ControlFlow 0 26) 25) anon36_correct))))))
(let ((anon34_correct  (=> (not (= r_1 null)) (=> (and (and (= Mask@6 (MapType1Store Mask@5 r_1 g (real_2_U (+ (U_2_real (MapType1Select Mask@5 r_1 g)) FullPerm)))) (state Heap@7 Mask@6)) (and (state Heap@7 Mask@6) (state Heap@7 Mask@6))) (and (=> (= (ControlFlow 0 29) 26) anon58_Then_correct) (=> (= (ControlFlow 0 29) 28) anon58_Else_correct))))))
(let ((anon57_Else_correct  (=> (HasDirectPerm Mask@5 null (p2 r_1 i@@6)) (=> (and (= Heap@7 ExhaleHeap@0) (= (ControlFlow 0 31) 29)) anon34_correct))))
(let ((anon57_Then_correct  (=> (and (and (not (HasDirectPerm Mask@5 null (p2 r_1 i@@6))) (= Heap@6 (MapType0Store ExhaleHeap@0 null (p2 r_1 i@@6) newVersion@1))) (and (= Heap@7 Heap@6) (= (ControlFlow 0 30) 29))) anon34_correct)))
(let ((anon32_correct  (=> (= Mask@5 (MapType1Store QPMask@3 null (p2 r_1 i@@6) (real_2_U (- (U_2_real (MapType1Select QPMask@3 null (p2 r_1 i@@6))) FullPerm)))) (and (=> (= (ControlFlow 0 32) 30) anon57_Then_correct) (=> (= (ControlFlow 0 32) 31) anon57_Else_correct)))))
(let ((anon56_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 35) 32)) anon32_correct)))
(let ((anon56_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 33) (- 0 34)) (<= FullPerm (U_2_real (MapType1Select QPMask@3 null (p2 r_1 i@@6))))) (=> (<= FullPerm (U_2_real (MapType1Select QPMask@3 null (p2 r_1 i@@6)))) (=> (= (ControlFlow 0 33) 32) anon32_correct))))))
(let ((anon54_Else_correct  (=> (forall ((x_13_1 T@U) ) (!  (=> (= (type x_13_1) RefType) (=> (and (|Seq#Contains| xs x_13_1) (> i@@6 0)) (> (U_2_int (MapType0Select Heap@5 x_13_1 f_7)) 0)))
 :qid |stdinbpl.1358:20|
 :skolemid |130|
 :pattern ( (|Seq#ContainsTrigger| xs x_13_1))
 :pattern ( (|Seq#Contains| xs x_13_1))
)) (=> (and (and (IdenticalOnKnownLocations Heap@5 ExhaleHeap@0 QPMask@3) (state ExhaleHeap@0 QPMask@3)) (and (|p2#trigger| ExhaleHeap@0 (p2 r_1 i@@6)) (= (MapType0Select ExhaleHeap@0 null (p2 r_1 i@@6)) (FrameFragment (MapType0Select ExhaleHeap@0 r_1 g))))) (and (=> (= (ControlFlow 0 36) 33) anon56_Then_correct) (=> (= (ControlFlow 0 36) 35) anon56_Else_correct))))))
(let ((anon29_correct true))
(let ((anon55_Else_correct  (=> (and (not (and (|Seq#Contains| xs x_12) (> i@@6 0))) (= (ControlFlow 0 17) 14)) anon29_correct)))
(let ((anon55_Then_correct  (=> (and (|Seq#Contains| xs x_12) (> i@@6 0)) (and (=> (= (ControlFlow 0 15) (- 0 16)) (> (U_2_int (MapType0Select Heap@5 x_12 f_7)) 0)) (=> (> (U_2_int (MapType0Select Heap@5 x_12 f_7)) 0) (=> (= (ControlFlow 0 15) 14) anon29_correct))))))
(let ((anon25_correct true))
(let ((anon53_Else_correct  (=> (and (not (and (|Seq#Contains| xs x_5) (> i@@6 0))) (= (ControlFlow 0 13) 10)) anon25_correct)))
(let ((anon53_Then_correct  (=> (and (|Seq#Contains| xs x_5) (> i@@6 0)) (and (=> (= (ControlFlow 0 11) (- 0 12)) (HasDirectPerm Mask@4 x_5 f_7)) (=> (HasDirectPerm Mask@4 x_5 f_7) (=> (= (ControlFlow 0 11) 10) anon25_correct))))))
(let ((anon51_Else_correct  (and (=> (= (ControlFlow 0 37) (- 0 39)) (forall ((x_10 T@U) (x_10_1 T@U) ) (!  (=> (and (= (type x_10) RefType) (= (type x_10_1) RefType)) (=> (and (and (and (and (not (= x_10 x_10_1)) (and (|Seq#Contains| xs x_10) (> i@@6 0))) (and (|Seq#Contains| xs x_10_1) (> i@@6 0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= x_10 x_10_1))))
 :qid |stdinbpl.1308:17|
 :skolemid |124|
 :pattern ( (neverTriggered8 x_10) (neverTriggered8 x_10_1))
))) (=> (forall ((x_10@@0 T@U) (x_10_1@@0 T@U) ) (!  (=> (and (= (type x_10@@0) RefType) (= (type x_10_1@@0) RefType)) (=> (and (and (and (and (not (= x_10@@0 x_10_1@@0)) (and (|Seq#Contains| xs x_10@@0) (> i@@6 0))) (and (|Seq#Contains| xs x_10_1@@0) (> i@@6 0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= x_10@@0 x_10_1@@0))))
 :qid |stdinbpl.1308:17|
 :skolemid |124|
 :pattern ( (neverTriggered8 x_10@@0) (neverTriggered8 x_10_1@@0))
)) (and (=> (= (ControlFlow 0 37) (- 0 38)) (forall ((x_10@@1 T@U) ) (!  (=> (= (type x_10@@1) RefType) (=> (and (|Seq#Contains| xs x_10@@1) (> i@@6 0)) (>= (U_2_real (MapType1Select QPMask@2 x_10@@1 f_7)) FullPerm)))
 :qid |stdinbpl.1315:17|
 :skolemid |125|
 :pattern ( (MapType0Select Heap@5 x_10@@1 f_7))
 :pattern ( (MapType1Select QPMask@3 x_10@@1 f_7))
 :pattern ( (|Seq#ContainsTrigger| xs x_10@@1))
 :pattern ( (|Seq#Contains| xs x_10@@1))
))) (=> (forall ((x_10@@2 T@U) ) (!  (=> (= (type x_10@@2) RefType) (=> (and (|Seq#Contains| xs x_10@@2) (> i@@6 0)) (>= (U_2_real (MapType1Select QPMask@2 x_10@@2 f_7)) FullPerm)))
 :qid |stdinbpl.1315:17|
 :skolemid |125|
 :pattern ( (MapType0Select Heap@5 x_10@@2 f_7))
 :pattern ( (MapType1Select QPMask@3 x_10@@2 f_7))
 :pattern ( (|Seq#ContainsTrigger| xs x_10@@2))
 :pattern ( (|Seq#Contains| xs x_10@@2))
)) (=> (and (and (forall ((x_10@@3 T@U) ) (!  (=> (= (type x_10@@3) RefType) (=> (and (and (|Seq#Contains| xs x_10@@3) (> i@@6 0)) (< NoPerm FullPerm)) (and (qpRange8 x_10@@3) (= (invRecv8 x_10@@3) x_10@@3))))
 :qid |stdinbpl.1321:22|
 :skolemid |126|
 :pattern ( (MapType0Select Heap@5 x_10@@3 f_7))
 :pattern ( (MapType1Select QPMask@3 x_10@@3 f_7))
 :pattern ( (|Seq#ContainsTrigger| xs x_10@@3))
 :pattern ( (|Seq#Contains| xs x_10@@3))
)) (forall ((o_3 T@U) ) (!  (=> (= (type o_3) RefType) (=> (and (and (|Seq#Contains| xs (invRecv8 o_3)) (> i@@6 0)) (and (< NoPerm FullPerm) (qpRange8 o_3))) (= (invRecv8 o_3) o_3)))
 :qid |stdinbpl.1325:22|
 :skolemid |127|
 :pattern ( (invRecv8 o_3))
))) (and (forall ((o_3@@0 T@U) ) (!  (=> (= (type o_3@@0) RefType) (and (=> (and (and (|Seq#Contains| xs (invRecv8 o_3@@0)) (> i@@6 0)) (and (< NoPerm FullPerm) (qpRange8 o_3@@0))) (and (= (invRecv8 o_3@@0) o_3@@0) (= (U_2_real (MapType1Select QPMask@3 o_3@@0 f_7)) (- (U_2_real (MapType1Select QPMask@2 o_3@@0 f_7)) FullPerm)))) (=> (not (and (and (|Seq#Contains| xs (invRecv8 o_3@@0)) (> i@@6 0)) (and (< NoPerm FullPerm) (qpRange8 o_3@@0)))) (= (U_2_real (MapType1Select QPMask@3 o_3@@0 f_7)) (U_2_real (MapType1Select QPMask@2 o_3@@0 f_7))))))
 :qid |stdinbpl.1331:22|
 :skolemid |128|
 :pattern ( (MapType1Select QPMask@3 o_3@@0 f_7))
)) (forall ((o_3@@1 T@U) (f_5 T@U) ) (! (let ((B@@11 (FieldTypeInv1 (type f_5))))
(let ((A@@12 (FieldTypeInv0 (type f_5))))
 (=> (and (and (= (type o_3@@1) RefType) (= (type f_5) (FieldType A@@12 B@@11))) (not (= f_5 f_7))) (= (U_2_real (MapType1Select QPMask@2 o_3@@1 f_5)) (U_2_real (MapType1Select QPMask@3 o_3@@1 f_5))))))
 :qid |stdinbpl.1337:29|
 :skolemid |129|
 :pattern ( (MapType1Select QPMask@3 o_3@@1 f_5))
)))) (and (and (and (and (=> (= (ControlFlow 0 37) 36) anon54_Else_correct) (=> (= (ControlFlow 0 37) 15) anon55_Then_correct)) (=> (= (ControlFlow 0 37) 17) anon55_Else_correct)) (=> (= (ControlFlow 0 37) 11) anon53_Then_correct)) (=> (= (ControlFlow 0 37) 13) anon53_Else_correct)))))))))
(let ((anon51_Then_correct true))
(let ((anon50_Else_correct  (and (=> (= (ControlFlow 0 40) (- 0 42)) (forall ((x_8 T@U) (x_8_1 T@U) ) (!  (=> (and (= (type x_8) RefType) (= (type x_8_1) RefType)) (=> (and (and (and (and (not (= x_8 x_8_1)) (|Seq#Contains| xs x_8)) (|Seq#Contains| xs x_8_1)) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (or (not (= x_8 x_8_1)) (not (= i@@6 i@@6)))))
 :qid |stdinbpl.1258:17|
 :skolemid |117|
 :pattern ( (neverTriggered7 x_8) (neverTriggered7 x_8_1))
))) (=> (forall ((x_8@@0 T@U) (x_8_1@@0 T@U) ) (!  (=> (and (= (type x_8@@0) RefType) (= (type x_8_1@@0) RefType)) (=> (and (and (and (and (not (= x_8@@0 x_8_1@@0)) (|Seq#Contains| xs x_8@@0)) (|Seq#Contains| xs x_8_1@@0)) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (or (not (= x_8@@0 x_8_1@@0)) (not (= i@@6 i@@6)))))
 :qid |stdinbpl.1258:17|
 :skolemid |117|
 :pattern ( (neverTriggered7 x_8@@0) (neverTriggered7 x_8_1@@0))
)) (and (=> (= (ControlFlow 0 40) (- 0 41)) (forall ((x_8@@1 T@U) ) (!  (=> (and (= (type x_8@@1) RefType) (|Seq#Contains| xs x_8@@1)) (>= (U_2_real (MapType1Select Mask@4 null (p2 x_8@@1 i@@6))) FullPerm))
 :qid |stdinbpl.1265:17|
 :skolemid |118|
 :pattern ( (MapType0Select Heap@5 null (p2 x_8@@1 i@@6)))
 :pattern ( (MapType1Select Mask@4 null (p2 x_8@@1 i@@6)))
 :pattern ( (|Seq#ContainsTrigger| xs x_8@@1))
 :pattern ( (|Seq#Contains| xs x_8@@1))
))) (=> (forall ((x_8@@2 T@U) ) (!  (=> (and (= (type x_8@@2) RefType) (|Seq#Contains| xs x_8@@2)) (>= (U_2_real (MapType1Select Mask@4 null (p2 x_8@@2 i@@6))) FullPerm))
 :qid |stdinbpl.1265:17|
 :skolemid |118|
 :pattern ( (MapType0Select Heap@5 null (p2 x_8@@2 i@@6)))
 :pattern ( (MapType1Select Mask@4 null (p2 x_8@@2 i@@6)))
 :pattern ( (|Seq#ContainsTrigger| xs x_8@@2))
 :pattern ( (|Seq#Contains| xs x_8@@2))
)) (=> (forall ((x_8@@3 T@U) ) (!  (=> (= (type x_8@@3) RefType) (=> (and (|Seq#Contains| xs x_8@@3) (< NoPerm FullPerm)) (and (= (invRecv7 x_8@@3 i@@6) x_8@@3) (qpRange7 x_8@@3 i@@6))))
 :qid |stdinbpl.1271:22|
 :skolemid |119|
 :pattern ( (MapType0Select Heap@5 null (p2 x_8@@3 i@@6)))
 :pattern ( (MapType1Select Mask@4 null (p2 x_8@@3 i@@6)))
 :pattern ( (|Seq#ContainsTrigger| xs x_8@@3))
 :pattern ( (|Seq#Contains| xs x_8@@3))
)) (=> (and (and (forall ((a_1_1 T@U) (b_1_1 Int) ) (!  (=> (= (type a_1_1) RefType) (=> (and (and (|Seq#Contains| xs (invRecv7 a_1_1 b_1_1)) (< NoPerm FullPerm)) (qpRange7 a_1_1 b_1_1)) (and (= (invRecv7 a_1_1 b_1_1) a_1_1) (= i@@6 b_1_1))))
 :qid |stdinbpl.1275:22|
 :skolemid |120|
 :pattern ( (invRecv7 a_1_1 b_1_1))
)) (forall ((a_1_1@@0 T@U) (b_1_1@@0 Int) ) (!  (=> (= (type a_1_1@@0) RefType) (=> (and (and (|Seq#Contains| xs (invRecv7 a_1_1@@0 b_1_1@@0)) (< NoPerm FullPerm)) (qpRange7 a_1_1@@0 b_1_1@@0)) (and (and (= (invRecv7 a_1_1@@0 b_1_1@@0) a_1_1@@0) (= i@@6 b_1_1@@0)) (= (U_2_real (MapType1Select QPMask@2 null (p2 a_1_1@@0 b_1_1@@0))) (- (U_2_real (MapType1Select Mask@4 null (p2 a_1_1@@0 b_1_1@@0))) FullPerm)))))
 :qid |stdinbpl.1281:22|
 :skolemid |121|
 :pattern ( (MapType1Select QPMask@2 null (p2 a_1_1@@0 b_1_1@@0)))
))) (and (forall ((a_1_1@@1 T@U) (b_1_1@@1 Int) ) (!  (=> (and (= (type a_1_1@@1) RefType) (not (and (and (|Seq#Contains| xs (invRecv7 a_1_1@@1 b_1_1@@1)) (< NoPerm FullPerm)) (qpRange7 a_1_1@@1 b_1_1@@1)))) (= (U_2_real (MapType1Select QPMask@2 null (p2 a_1_1@@1 b_1_1@@1))) (U_2_real (MapType1Select Mask@4 null (p2 a_1_1@@1 b_1_1@@1)))))
 :qid |stdinbpl.1285:22|
 :skolemid |122|
 :pattern ( (MapType1Select QPMask@2 null (p2 a_1_1@@1 b_1_1@@1)))
)) (forall ((o_3@@2 T@U) (f_5@@0 T@U) ) (! (let ((B@@12 (FieldTypeInv1 (type f_5@@0))))
(let ((A@@13 (FieldTypeInv0 (type f_5@@0))))
 (=> (and (and (= (type o_3@@2) RefType) (= (type f_5@@0) (FieldType A@@13 B@@12))) (or (or (not (= o_3@@2 null)) (not (IsPredicateField f_5@@0))) (not (= (getPredWandId f_5@@0) 1)))) (= (U_2_real (MapType1Select Mask@4 o_3@@2 f_5@@0)) (U_2_real (MapType1Select QPMask@2 o_3@@2 f_5@@0))))))
 :qid |stdinbpl.1291:29|
 :skolemid |123|
 :pattern ( (MapType1Select Mask@4 o_3@@2 f_5@@0))
 :pattern ( (MapType1Select QPMask@2 o_3@@2 f_5@@0))
)))) (and (=> (= (ControlFlow 0 40) 9) anon51_Then_correct) (=> (= (ControlFlow 0 40) 37) anon51_Else_correct))))))))))
(let ((anon50_Then_correct true))
(let ((anon18_correct  (=> (= Heap@5 (MapType0Store Heap@4 null (|p2#sm| r_1 i@@6) (MapType1Store (MapType0Select Heap@4 null (|p2#sm| r_1 i@@6)) r_1 g (bool_2_U true)))) (=> (and (state Heap@5 Mask@4) (state Heap@5 Mask@4)) (and (=> (= (ControlFlow 0 43) 8) anon50_Then_correct) (=> (= (ControlFlow 0 43) 40) anon50_Else_correct))))))
(let ((anon49_Else_correct  (=> (HasDirectPerm Mask@4 null (p2 r_1 i@@6)) (=> (and (= Heap@4 Heap@1) (= (ControlFlow 0 45) 43)) anon18_correct))))
(let ((anon49_Then_correct  (=> (not (HasDirectPerm Mask@4 null (p2 r_1 i@@6))) (=> (and (and (= Heap@2 (MapType0Store Heap@1 null (|p2#sm| r_1 i@@6) ZeroPMask)) (= Heap@3 (MapType0Store Heap@2 null (p2 r_1 i@@6) freshVersion@0))) (and (= Heap@4 Heap@3) (= (ControlFlow 0 44) 43))) anon18_correct))))
(let ((anon16_correct  (=> (and (= Mask@3 (MapType1Store Mask@2 r_1 g (real_2_U (- (U_2_real (MapType1Select Mask@2 r_1 g)) FullPerm)))) (= Mask@4 (MapType1Store Mask@3 null (p2 r_1 i@@6) (real_2_U (+ (U_2_real (MapType1Select Mask@3 null (p2 r_1 i@@6))) FullPerm))))) (=> (and (and (state Heap@1 Mask@4) (state Heap@1 Mask@4)) (and (|p2#trigger| Heap@1 (p2 r_1 i@@6)) (= (MapType0Select Heap@1 null (p2 r_1 i@@6)) (FrameFragment (MapType0Select Heap@1 r_1 g))))) (and (=> (= (ControlFlow 0 46) 44) anon49_Then_correct) (=> (= (ControlFlow 0 46) 45) anon49_Else_correct))))))
(let ((anon48_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 49) 46)) anon16_correct)))
(let ((anon48_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 47) (- 0 48)) (<= FullPerm (U_2_real (MapType1Select Mask@2 r_1 g)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@2 r_1 g))) (=> (= (ControlFlow 0 47) 46) anon16_correct))))))
(let ((anon14_correct  (=> (not (= r_1 null)) (=> (and (and (= Mask@2 (MapType1Store Mask@1 r_1 g (real_2_U (+ (U_2_real (MapType1Select Mask@1 r_1 g)) FullPerm)))) (state Heap@1 Mask@2)) (and (state Heap@1 Mask@2) (state Heap@1 Mask@2))) (and (=> (= (ControlFlow 0 50) 47) anon48_Then_correct) (=> (= (ControlFlow 0 50) 49) anon48_Else_correct))))))
(let ((anon47_Else_correct  (=> (HasDirectPerm Mask@1 null (p2 r_1 i@@6)) (=> (and (= Heap@1 Heap@@11) (= (ControlFlow 0 52) 50)) anon14_correct))))
(let ((anon47_Then_correct  (=> (and (and (not (HasDirectPerm Mask@1 null (p2 r_1 i@@6))) (= Heap@0 (MapType0Store Heap@@11 null (p2 r_1 i@@6) newVersion@0))) (and (= Heap@1 Heap@0) (= (ControlFlow 0 51) 50))) anon14_correct)))
(let ((anon12_correct  (=> (= Mask@1 (MapType1Store QPMask@1 null (p2 r_1 i@@6) (real_2_U (- (U_2_real (MapType1Select QPMask@1 null (p2 r_1 i@@6))) FullPerm)))) (and (=> (= (ControlFlow 0 53) 51) anon47_Then_correct) (=> (= (ControlFlow 0 53) 52) anon47_Else_correct)))))
(let ((anon46_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 56) 53)) anon12_correct)))
(let ((anon46_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 54) (- 0 55)) (<= FullPerm (U_2_real (MapType1Select QPMask@1 null (p2 r_1 i@@6))))) (=> (<= FullPerm (U_2_real (MapType1Select QPMask@1 null (p2 r_1 i@@6)))) (=> (= (ControlFlow 0 54) 53) anon12_correct))))))
(let ((anon44_Else_correct  (=> (forall ((x_6 T@U) ) (!  (=> (= (type x_6) RefType) (=> (and (|Seq#Contains| xs x_6) (> i@@6 0)) (> (U_2_int (MapType0Select Heap@@11 x_6 f_7)) 0)))
 :qid |stdinbpl.1186:20|
 :skolemid |116|
 :pattern ( (|Seq#ContainsTrigger| xs x_6))
 :pattern ( (|Seq#Contains| xs x_6))
)) (=> (and (and (state Heap@@11 QPMask@1) (state Heap@@11 QPMask@1)) (and (|p2#trigger| Heap@@11 (p2 r_1 i@@6)) (= (MapType0Select Heap@@11 null (p2 r_1 i@@6)) (FrameFragment (MapType0Select Heap@@11 r_1 g))))) (and (=> (= (ControlFlow 0 57) 54) anon46_Then_correct) (=> (= (ControlFlow 0 57) 56) anon46_Else_correct))))))
(let ((anon9_correct true))
(let ((anon45_Else_correct  (=> (and (not (and (|Seq#Contains| xs x_3) (> i@@6 0))) (= (ControlFlow 0 7) 4)) anon9_correct)))
(let ((anon45_Then_correct  (=> (and (|Seq#Contains| xs x_3) (> i@@6 0)) (and (=> (= (ControlFlow 0 5) (- 0 6)) (HasDirectPerm QPMask@1 x_3 f_7)) (=> (HasDirectPerm QPMask@1 x_3 f_7) (=> (= (ControlFlow 0 5) 4) anon9_correct))))))
(let ((anon43_Else_correct  (and (=> (= (ControlFlow 0 58) (- 0 59)) (forall ((x_4 T@U) (x_4_1 T@U) ) (!  (=> (and (= (type x_4) RefType) (= (type x_4_1) RefType)) (=> (and (and (and (and (not (= x_4 x_4_1)) (and (|Seq#Contains| xs x_4) (> i@@6 0))) (and (|Seq#Contains| xs x_4_1) (> i@@6 0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= x_4 x_4_1))))
 :qid |stdinbpl.1145:15|
 :skolemid |110|
 :no-pattern (type x_4)
 :no-pattern (type x_4_1)
 :no-pattern (U_2_int x_4)
 :no-pattern (U_2_bool x_4)
 :no-pattern (U_2_int x_4_1)
 :no-pattern (U_2_bool x_4_1)
))) (=> (forall ((x_4@@0 T@U) (x_4_1@@0 T@U) ) (!  (=> (and (= (type x_4@@0) RefType) (= (type x_4_1@@0) RefType)) (=> (and (and (and (and (not (= x_4@@0 x_4_1@@0)) (and (|Seq#Contains| xs x_4@@0) (> i@@6 0))) (and (|Seq#Contains| xs x_4_1@@0) (> i@@6 0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= x_4@@0 x_4_1@@0))))
 :qid |stdinbpl.1145:15|
 :skolemid |110|
 :no-pattern (type x_4@@0)
 :no-pattern (type x_4_1@@0)
 :no-pattern (U_2_int x_4@@0)
 :no-pattern (U_2_bool x_4@@0)
 :no-pattern (U_2_int x_4_1@@0)
 :no-pattern (U_2_bool x_4_1@@0)
)) (=> (and (forall ((x_4@@1 T@U) ) (!  (=> (= (type x_4@@1) RefType) (=> (and (and (|Seq#Contains| xs x_4@@1) (> i@@6 0)) (< NoPerm FullPerm)) (and (qpRange6 x_4@@1) (= (invRecv6 x_4@@1) x_4@@1))))
 :qid |stdinbpl.1151:22|
 :skolemid |111|
 :pattern ( (MapType0Select Heap@@11 x_4@@1 f_7))
 :pattern ( (MapType1Select QPMask@1 x_4@@1 f_7))
 :pattern ( (|Seq#ContainsTrigger| xs x_4@@1))
 :pattern ( (|Seq#Contains| xs x_4@@1))
)) (forall ((o_3@@3 T@U) ) (!  (=> (= (type o_3@@3) RefType) (=> (and (and (and (|Seq#Contains| xs (invRecv6 o_3@@3)) (> i@@6 0)) (< NoPerm FullPerm)) (qpRange6 o_3@@3)) (= (invRecv6 o_3@@3) o_3@@3)))
 :qid |stdinbpl.1155:22|
 :skolemid |112|
 :pattern ( (invRecv6 o_3@@3))
))) (=> (and (and (forall ((x_4@@2 T@U) ) (!  (=> (= (type x_4@@2) RefType) (=> (and (|Seq#Contains| xs x_4@@2) (> i@@6 0)) (not (= x_4@@2 null))))
 :qid |stdinbpl.1161:22|
 :skolemid |113|
 :pattern ( (MapType0Select Heap@@11 x_4@@2 f_7))
 :pattern ( (MapType1Select QPMask@1 x_4@@2 f_7))
 :pattern ( (|Seq#ContainsTrigger| xs x_4@@2))
 :pattern ( (|Seq#Contains| xs x_4@@2))
)) (forall ((o_3@@4 T@U) ) (!  (=> (= (type o_3@@4) RefType) (and (=> (and (and (and (|Seq#Contains| xs (invRecv6 o_3@@4)) (> i@@6 0)) (< NoPerm FullPerm)) (qpRange6 o_3@@4)) (and (=> (< NoPerm FullPerm) (= (invRecv6 o_3@@4) o_3@@4)) (= (U_2_real (MapType1Select QPMask@1 o_3@@4 f_7)) (+ (U_2_real (MapType1Select QPMask@0 o_3@@4 f_7)) FullPerm)))) (=> (not (and (and (and (|Seq#Contains| xs (invRecv6 o_3@@4)) (> i@@6 0)) (< NoPerm FullPerm)) (qpRange6 o_3@@4))) (= (U_2_real (MapType1Select QPMask@1 o_3@@4 f_7)) (U_2_real (MapType1Select QPMask@0 o_3@@4 f_7))))))
 :qid |stdinbpl.1167:22|
 :skolemid |114|
 :pattern ( (MapType1Select QPMask@1 o_3@@4 f_7))
))) (and (forall ((o_3@@5 T@U) (f_5@@1 T@U) ) (! (let ((B@@13 (FieldTypeInv1 (type f_5@@1))))
(let ((A@@14 (FieldTypeInv0 (type f_5@@1))))
 (=> (and (and (= (type o_3@@5) RefType) (= (type f_5@@1) (FieldType A@@14 B@@13))) (not (= f_5@@1 f_7))) (= (U_2_real (MapType1Select QPMask@0 o_3@@5 f_5@@1)) (U_2_real (MapType1Select QPMask@1 o_3@@5 f_5@@1))))))
 :qid |stdinbpl.1171:29|
 :skolemid |115|
 :pattern ( (MapType1Select QPMask@0 o_3@@5 f_5@@1))
 :pattern ( (MapType1Select QPMask@1 o_3@@5 f_5@@1))
)) (state Heap@@11 QPMask@1))) (and (and (=> (= (ControlFlow 0 58) 57) anon44_Else_correct) (=> (= (ControlFlow 0 58) 5) anon45_Then_correct)) (=> (= (ControlFlow 0 58) 7) anon45_Else_correct))))))))
(let ((anon43_Then_correct true))
(let ((anon42_Else_correct  (and (=> (= (ControlFlow 0 60) (- 0 61)) (forall ((x_1 T@U) (x_1_1 T@U) ) (!  (=> (and (= (type x_1) RefType) (= (type x_1_1) RefType)) (=> (and (and (and (and (not (= x_1 x_1_1)) (|Seq#Contains| xs x_1)) (|Seq#Contains| xs x_1_1)) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (or (not (= x_1 x_1_1)) (not (= i@@6 i@@6)))))
 :qid |stdinbpl.1106:17|
 :skolemid |104|
 :pattern ( (neverTriggered5 x_1) (neverTriggered5 x_1_1))
))) (=> (forall ((x_1@@0 T@U) (x_1_1@@0 T@U) ) (!  (=> (and (= (type x_1@@0) RefType) (= (type x_1_1@@0) RefType)) (=> (and (and (and (and (not (= x_1@@0 x_1_1@@0)) (|Seq#Contains| xs x_1@@0)) (|Seq#Contains| xs x_1_1@@0)) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (or (not (= x_1@@0 x_1_1@@0)) (not (= i@@6 i@@6)))))
 :qid |stdinbpl.1106:17|
 :skolemid |104|
 :pattern ( (neverTriggered5 x_1@@0) (neverTriggered5 x_1_1@@0))
)) (=> (and (forall ((x_1@@1 T@U) ) (!  (=> (= (type x_1@@1) RefType) (=> (and (|Seq#Contains| xs x_1@@1) (< NoPerm FullPerm)) (and (= (invRecv5 x_1@@1 i@@6) x_1@@1) (qpRange5 x_1@@1 i@@6))))
 :qid |stdinbpl.1112:22|
 :skolemid |105|
 :pattern ( (MapType0Select Heap@@11 null (p2 x_1@@1 i@@6)))
 :pattern ( (MapType1Select Mask@0 null (p2 x_1@@1 i@@6)))
 :pattern ( (|Seq#ContainsTrigger| xs x_1@@1))
 :pattern ( (|Seq#Contains| xs x_1@@1))
)) (forall ((a_1@@11 T@U) (b_1@@5 Int) ) (!  (=> (= (type a_1@@11) RefType) (=> (and (and (|Seq#Contains| xs (invRecv5 a_1@@11 b_1@@5)) (< NoPerm FullPerm)) (qpRange5 a_1@@11 b_1@@5)) (and (= (invRecv5 a_1@@11 b_1@@5) a_1@@11) (= i@@6 b_1@@5))))
 :qid |stdinbpl.1116:22|
 :skolemid |106|
 :pattern ( (invRecv5 a_1@@11 b_1@@5))
))) (=> (and (and (forall ((a_1@@12 T@U) (b_1@@6 Int) ) (!  (=> (= (type a_1@@12) RefType) (=> (and (and (|Seq#Contains| xs (invRecv5 a_1@@12 b_1@@6)) (< NoPerm FullPerm)) (qpRange5 a_1@@12 b_1@@6)) (and (=> (< NoPerm FullPerm) (and (= (invRecv5 a_1@@12 b_1@@6) a_1@@12) (= i@@6 b_1@@6))) (= (U_2_real (MapType1Select QPMask@0 null (p2 a_1@@12 b_1@@6))) (+ (U_2_real (MapType1Select Mask@0 null (p2 a_1@@12 b_1@@6))) FullPerm)))))
 :qid |stdinbpl.1122:22|
 :skolemid |107|
 :pattern ( (MapType1Select QPMask@0 null (p2 a_1@@12 b_1@@6)))
)) (forall ((o_3@@6 T@U) (f_5@@2 T@U) ) (! (let ((B@@14 (FieldTypeInv1 (type f_5@@2))))
(let ((A@@15 (FieldTypeInv0 (type f_5@@2))))
 (=> (and (and (= (type o_3@@6) RefType) (= (type f_5@@2) (FieldType A@@15 B@@14))) (or (or (not (= o_3@@6 null)) (not (IsPredicateField f_5@@2))) (not (= (getPredWandId f_5@@2) 1)))) (= (U_2_real (MapType1Select Mask@0 o_3@@6 f_5@@2)) (U_2_real (MapType1Select QPMask@0 o_3@@6 f_5@@2))))))
 :qid |stdinbpl.1128:29|
 :skolemid |108|
 :pattern ( (MapType1Select Mask@0 o_3@@6 f_5@@2))
 :pattern ( (MapType1Select QPMask@0 o_3@@6 f_5@@2))
))) (and (forall ((a_1@@13 T@U) (b_1@@7 Int) ) (!  (=> (and (= (type a_1@@13) RefType) (not (and (and (|Seq#Contains| xs (invRecv5 a_1@@13 b_1@@7)) (< NoPerm FullPerm)) (qpRange5 a_1@@13 b_1@@7)))) (= (U_2_real (MapType1Select QPMask@0 null (p2 a_1@@13 b_1@@7))) (U_2_real (MapType1Select Mask@0 null (p2 a_1@@13 b_1@@7)))))
 :qid |stdinbpl.1132:22|
 :skolemid |109|
 :pattern ( (MapType1Select QPMask@0 null (p2 a_1@@13 b_1@@7)))
)) (state Heap@@11 QPMask@0))) (and (=> (= (ControlFlow 0 60) 3) anon43_Then_correct) (=> (= (ControlFlow 0 60) 58) anon43_Else_correct))))))))
(let ((anon42_Then_correct true))
(let ((anon41_Then_correct true))
(let ((anon0_correct  (=> (state Heap@@11 ZeroMask) (=> (and (U_2_bool (MapType0Select Heap@@11 r_1 $allocated)) (not (|Seq#Contains| xs r_1))) (=> (and (and (state Heap@@11 ZeroMask) (= Mask@0 (MapType1Store ZeroMask null (p2 r_1 i@@6) (real_2_U (+ (U_2_real (MapType1Select ZeroMask null (p2 r_1 i@@6))) FullPerm))))) (and (state Heap@@11 Mask@0) (state Heap@@11 Mask@0))) (and (and (=> (= (ControlFlow 0 62) 1) anon41_Then_correct) (=> (= (ControlFlow 0 62) 2) anon42_Then_correct)) (=> (= (ControlFlow 0 62) 60) anon42_Else_correct)))))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 63) 62) anon0_correct)))
PreconditionGeneratedEntry_correct))))))))))))))))))))))))))))))))))))))))))))))))))
))
(check-sat)
(pop 1)
; Valid
(get-info :rlimit)
