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
(declare-fun src () T@U)
(declare-fun dst () T@U)
(declare-fun Integer_value () T@U)
(declare-fun FieldType (T@T T@T) T@T)
(declare-fun FieldTypeInv0 (T@T) T@T)
(declare-fun FieldTypeInv1 (T@T) T@T)
(declare-fun NormalFieldType () T@T)
(declare-fun SeqType (T@T) T@T)
(declare-fun SeqTypeInv0 (T@T) T@T)
(declare-fun RefType () T@T)
(declare-fun |Seq#Length| (T@U) Int)
(declare-fun |Seq#Drop| (T@U Int) T@U)
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
(declare-fun |Seq#Index| (T@U Int) T@U)
(declare-fun |Seq#Sub| (Int Int) Int)
(declare-fun |Seq#Add| (Int Int) Int)
(declare-fun IdenticalOnKnownLocations (T@U T@U T@U) Bool)
(declare-fun IsPredicateField (T@U) Bool)
(declare-fun null () T@U)
(declare-fun PredicateMaskField (T@U) T@U)
(declare-fun FrameTypeType () T@T)
(declare-fun HasDirectPerm (T@U T@U T@U) Bool)
(declare-fun IsWandField (T@U) Bool)
(declare-fun WandMaskField (T@U) T@U)
(declare-fun |Seq#Update| (T@U Int T@U) T@U)
(declare-fun |Seq#Take| (T@U Int) T@U)
(declare-fun |Seq#Contains| (T@U T@U) Bool)
(declare-fun |Seq#Range| (Int Int) T@U)
(declare-fun |Seq#Skolem| (T@U T@U) Int)
(declare-fun |Seq#Singleton| (T@U) T@U)
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
(declare-fun FullPerm () Real)
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
(assert  (and (and (and (and (and (and (and (and (and (and (forall ((arg0@@11 T@T) (arg1 T@T) ) (! (= (Ctor (FieldType arg0@@11 arg1)) 6)
 :qid |ctor:FieldType|
)) (forall ((arg0@@12 T@T) (arg1@@0 T@T) ) (! (= (FieldTypeInv0 (FieldType arg0@@12 arg1@@0)) arg0@@12)
 :qid |typeInv:FieldTypeInv0|
 :pattern ( (FieldType arg0@@12 arg1@@0))
))) (forall ((arg0@@13 T@T) (arg1@@1 T@T) ) (! (= (FieldTypeInv1 (FieldType arg0@@13 arg1@@1)) arg1@@1)
 :qid |typeInv:FieldTypeInv1|
 :pattern ( (FieldType arg0@@13 arg1@@1))
))) (= (Ctor NormalFieldType) 7)) (= (type $allocated) (FieldType NormalFieldType boolType))) (forall ((arg0@@14 T@T) ) (! (= (Ctor (SeqType arg0@@14)) 8)
 :qid |ctor:SeqType|
))) (forall ((arg0@@15 T@T) ) (! (= (SeqTypeInv0 (SeqType arg0@@15)) arg0@@15)
 :qid |typeInv:SeqTypeInv0|
 :pattern ( (SeqType arg0@@15))
))) (= (Ctor RefType) 9)) (= (type src) (FieldType NormalFieldType (SeqType RefType)))) (= (type dst) (FieldType NormalFieldType (SeqType RefType)))) (= (type Integer_value) (FieldType NormalFieldType intType))))
(assert (distinct $allocated src dst Integer_value)
)
(assert (forall ((arg0@@16 T@U) (arg1@@2 Int) ) (! (let ((T (SeqTypeInv0 (type arg0@@16))))
(= (type (|Seq#Drop| arg0@@16 arg1@@2)) (SeqType T)))
 :qid |funType:Seq#Drop|
 :pattern ( (|Seq#Drop| arg0@@16 arg1@@2))
)))
(assert (forall ((s T@U) (n Int) ) (! (let ((T@@0 (SeqTypeInv0 (type s))))
 (=> (= (type s) (SeqType T@@0)) (and (=> (<= 0 n) (and (=> (<= n (|Seq#Length| s)) (= (|Seq#Length| (|Seq#Drop| s n)) (- (|Seq#Length| s) n))) (=> (< (|Seq#Length| s) n) (= (|Seq#Length| (|Seq#Drop| s n)) 0)))) (=> (< n 0) (= (|Seq#Length| (|Seq#Drop| s n)) (|Seq#Length| s))))))
 :qid |stdinbpl.346:18|
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
(assert (forall ((arg0@@26 T@U) (arg1@@10 Int) ) (! (let ((T@@1 (SeqTypeInv0 (type arg0@@26))))
(= (type (|Seq#Index| arg0@@26 arg1@@10)) T@@1))
 :qid |funType:Seq#Index|
 :pattern ( (|Seq#Index| arg0@@26 arg1@@10))
)))
(assert (forall ((s@@0 T@U) (n@@0 Int) (j Int) ) (! (let ((T@@2 (SeqTypeInv0 (type s@@0))))
 (=> (= (type s@@0) (SeqType T@@2)) (=> (and (and (< 0 n@@0) (<= 0 j)) (< j (- (|Seq#Length| s@@0) n@@0))) (and (= (|Seq#Sub| (|Seq#Add| j n@@0) n@@0) j) (= (|Seq#Index| (|Seq#Drop| s@@0 n@@0) j) (|Seq#Index| s@@0 (|Seq#Add| j n@@0)))))))
 :qid |stdinbpl.367:18|
 :skolemid |39|
 :pattern ( (|Seq#Index| (|Seq#Drop| s@@0 n@@0) j))
)))
(assert  (and (and (= (Ctor FrameTypeType) 12) (= (type null) RefType)) (forall ((arg0@@27 T@U) ) (! (let ((A (FieldTypeInv0 (type arg0@@27))))
(= (type (PredicateMaskField arg0@@27)) (FieldType A (MapType1Type RefType boolType))))
 :qid |funType:PredicateMaskField|
 :pattern ( (PredicateMaskField arg0@@27))
))))
(assert (forall ((Heap@@0 T@U) (ExhaleHeap T@U) (Mask@@0 T@U) (pm_f T@U) ) (! (let ((C (FieldTypeInv0 (type pm_f))))
 (=> (and (and (and (and (and (= (type Heap@@0) (MapType0Type RefType)) (= (type ExhaleHeap) (MapType0Type RefType))) (= (type Mask@@0) (MapType1Type RefType realType))) (= (type pm_f) (FieldType C FrameTypeType))) (IdenticalOnKnownLocations Heap@@0 ExhaleHeap Mask@@0)) (and (HasDirectPerm Mask@@0 null pm_f) (IsPredicateField pm_f))) (= (MapType0Select Heap@@0 null (PredicateMaskField pm_f)) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))))
 :qid |stdinbpl.47:19|
 :skolemid |2|
 :pattern ( (IdenticalOnKnownLocations Heap@@0 ExhaleHeap Mask@@0) (IsPredicateField pm_f) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))
)))
(assert (forall ((arg0@@28 T@U) ) (! (let ((A@@0 (FieldTypeInv0 (type arg0@@28))))
(= (type (WandMaskField arg0@@28)) (FieldType A@@0 (MapType1Type RefType boolType))))
 :qid |funType:WandMaskField|
 :pattern ( (WandMaskField arg0@@28))
)))
(assert (forall ((Heap@@1 T@U) (ExhaleHeap@@0 T@U) (Mask@@1 T@U) (pm_f@@0 T@U) ) (! (let ((C@@0 (FieldTypeInv0 (type pm_f@@0))))
 (=> (and (and (and (and (and (= (type Heap@@1) (MapType0Type RefType)) (= (type ExhaleHeap@@0) (MapType0Type RefType))) (= (type Mask@@1) (MapType1Type RefType realType))) (= (type pm_f@@0) (FieldType C@@0 FrameTypeType))) (IdenticalOnKnownLocations Heap@@1 ExhaleHeap@@0 Mask@@1)) (and (HasDirectPerm Mask@@1 null pm_f@@0) (IsWandField pm_f@@0))) (= (MapType0Select Heap@@1 null (WandMaskField pm_f@@0)) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))))
 :qid |stdinbpl.60:19|
 :skolemid |5|
 :pattern ( (IdenticalOnKnownLocations Heap@@1 ExhaleHeap@@0 Mask@@1) (IsWandField pm_f@@0) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))
)))
(assert (forall ((arg0@@29 T@U) (arg1@@11 Int) (arg2@@3 T@U) ) (! (let ((T@@3 (type arg2@@3)))
(= (type (|Seq#Update| arg0@@29 arg1@@11 arg2@@3)) (SeqType T@@3)))
 :qid |funType:Seq#Update|
 :pattern ( (|Seq#Update| arg0@@29 arg1@@11 arg2@@3))
)))
(assert (forall ((s@@1 T@U) (i Int) (v T@U) (n@@1 Int) ) (! (let ((T@@4 (type v)))
 (=> (= (type s@@1) (SeqType T@@4)) (=> (and (<= 0 n@@1) (< n@@1 (|Seq#Length| s@@1))) (and (=> (= i n@@1) (= (|Seq#Index| (|Seq#Update| s@@1 i v) n@@1) v)) (=> (not (= i n@@1)) (= (|Seq#Index| (|Seq#Update| s@@1 i v) n@@1) (|Seq#Index| s@@1 n@@1)))))))
 :qid |stdinbpl.322:18|
 :skolemid |35|
 :pattern ( (|Seq#Index| (|Seq#Update| s@@1 i v) n@@1))
 :pattern ( (|Seq#Index| s@@1 n@@1) (|Seq#Update| s@@1 i v))
)))
(assert (forall ((arg0@@30 T@U) (arg1@@12 Int) ) (! (let ((T@@5 (SeqTypeInv0 (type arg0@@30))))
(= (type (|Seq#Take| arg0@@30 arg1@@12)) (SeqType T@@5)))
 :qid |funType:Seq#Take|
 :pattern ( (|Seq#Take| arg0@@30 arg1@@12))
)))
(assert (forall ((s@@2 T@U) (n@@2 Int) ) (! (let ((T@@6 (SeqTypeInv0 (type s@@2))))
 (=> (= (type s@@2) (SeqType T@@6)) (and (=> (<= 0 n@@2) (and (=> (<= n@@2 (|Seq#Length| s@@2)) (= (|Seq#Length| (|Seq#Take| s@@2 n@@2)) n@@2)) (=> (< (|Seq#Length| s@@2) n@@2) (= (|Seq#Length| (|Seq#Take| s@@2 n@@2)) (|Seq#Length| s@@2))))) (=> (< n@@2 0) (= (|Seq#Length| (|Seq#Take| s@@2 n@@2)) 0)))))
 :qid |stdinbpl.333:18|
 :skolemid |36|
 :pattern ( (|Seq#Length| (|Seq#Take| s@@2 n@@2)))
 :pattern ( (|Seq#Take| s@@2 n@@2) (|Seq#Length| s@@2))
)))
(assert (forall ((arg0@@31 Int) (arg1@@13 Int) ) (! (= (type (|Seq#Range| arg0@@31 arg1@@13)) (SeqType intType))
 :qid |funType:Seq#Range|
 :pattern ( (|Seq#Range| arg0@@31 arg1@@13))
)))
(assert (forall ((q@min Int) (q@max Int) (v@@0 T@U) ) (!  (=> (= (type v@@0) intType) (= (|Seq#Contains| (|Seq#Range| q@min q@max) v@@0)  (and (<= q@min (U_2_int v@@0)) (< (U_2_int v@@0) q@max))))
 :qid |stdinbpl.606:15|
 :skolemid |57|
 :pattern ( (|Seq#Contains| (|Seq#Range| q@min q@max) v@@0))
)))
(assert (forall ((s@@3 T@U) (x@@8 T@U) ) (! (let ((T@@7 (type x@@8)))
 (=> (and (= (type s@@3) (SeqType T@@7)) (|Seq#Contains| s@@3 x@@8)) (and (and (<= 0 (|Seq#Skolem| s@@3 x@@8)) (< (|Seq#Skolem| s@@3 x@@8) (|Seq#Length| s@@3))) (= (|Seq#Index| s@@3 (|Seq#Skolem| s@@3 x@@8)) x@@8))))
 :qid |stdinbpl.464:18|
 :skolemid |47|
 :pattern ( (|Seq#Contains| s@@3 x@@8))
)))
(assert (forall ((Heap@@2 T@U) (ExhaleHeap@@1 T@U) (Mask@@2 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@2) (MapType0Type RefType)) (= (type ExhaleHeap@@1) (MapType0Type RefType))) (= (type Mask@@2) (MapType1Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@2 ExhaleHeap@@1 Mask@@2)) (U_2_bool (MapType0Select Heap@@2 o_1 $allocated))) (U_2_bool (MapType0Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.73:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@2 ExhaleHeap@@1 Mask@@2) (MapType0Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert (forall ((s@@4 T@U) (n@@3 Int) ) (! (let ((T@@8 (SeqTypeInv0 (type s@@4))))
 (=> (and (= (type s@@4) (SeqType T@@8)) (<= n@@3 0)) (= (|Seq#Drop| s@@4 n@@3) s@@4)))
 :qid |stdinbpl.448:18|
 :skolemid |45|
 :pattern ( (|Seq#Drop| s@@4 n@@3))
)))
(assert (forall ((i@@0 Int) (j@@0 Int) ) (! (= (|Seq#Sub| i@@0 j@@0) (- i@@0 j@@0))
 :qid |stdinbpl.302:15|
 :skolemid |30|
 :pattern ( (|Seq#Sub| i@@0 j@@0))
)))
(assert (forall ((i@@1 Int) (j@@1 Int) ) (! (= (|Seq#Add| i@@1 j@@1) (+ i@@1 j@@1))
 :qid |stdinbpl.300:15|
 :skolemid |29|
 :pattern ( (|Seq#Add| i@@1 j@@1))
)))
(assert (forall ((arg0@@32 T@U) ) (! (let ((T@@9 (type arg0@@32)))
(= (type (|Seq#Singleton| arg0@@32)) (SeqType T@@9)))
 :qid |funType:Seq#Singleton|
 :pattern ( (|Seq#Singleton| arg0@@32))
)))
(assert (forall ((x@@9 T@U) (y@@1 T@U) ) (! (let ((T@@10 (type x@@9)))
 (=> (= (type y@@1) T@@10) (= (|Seq#Contains| (|Seq#Singleton| x@@9) y@@1) (= x@@9 y@@1))))
 :qid |stdinbpl.589:18|
 :skolemid |54|
 :pattern ( (|Seq#Contains| (|Seq#Singleton| x@@9) y@@1))
)))
(assert (forall ((s@@5 T@U) (n@@4 Int) (j@@2 Int) ) (! (let ((T@@11 (SeqTypeInv0 (type s@@5))))
 (=> (= (type s@@5) (SeqType T@@11)) (=> (and (and (<= 0 j@@2) (< j@@2 n@@4)) (< j@@2 (|Seq#Length| s@@5))) (= (|Seq#Index| (|Seq#Take| s@@5 n@@4) j@@2) (|Seq#Index| s@@5 j@@2)))))
 :qid |stdinbpl.341:18|
 :skolemid |37|
 :pattern ( (|Seq#Index| (|Seq#Take| s@@5 n@@4) j@@2))
 :pattern ( (|Seq#Index| s@@5 j@@2) (|Seq#Take| s@@5 n@@4))
)))
(assert (forall ((Heap@@3 T@U) (ExhaleHeap@@2 T@U) (Mask@@3 T@U) (o_1@@0 T@U) (f_2 T@U) ) (! (let ((B@@1 (FieldTypeInv1 (type f_2))))
(let ((A@@1 (FieldTypeInv0 (type f_2))))
 (=> (and (and (and (and (and (and (= (type Heap@@3) (MapType0Type RefType)) (= (type ExhaleHeap@@2) (MapType0Type RefType))) (= (type Mask@@3) (MapType1Type RefType realType))) (= (type o_1@@0) RefType)) (= (type f_2) (FieldType A@@1 B@@1))) (IdenticalOnKnownLocations Heap@@3 ExhaleHeap@@2 Mask@@3)) (HasDirectPerm Mask@@3 o_1@@0 f_2)) (= (MapType0Select Heap@@3 o_1@@0 f_2) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2)))))
 :qid |stdinbpl.42:22|
 :skolemid |1|
 :pattern ( (IdenticalOnKnownLocations Heap@@3 ExhaleHeap@@2 Mask@@3) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2))
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
 :qid |stdinbpl.245:19|
 :skolemid |21|
 :pattern ( (InsidePredicate p v_1 p w))
)))
(assert (forall ((arg0@@33 T@U) (arg1@@14 T@U) ) (! (let ((T@@14 (SeqTypeInv0 (type arg0@@33))))
(= (type (|Seq#Append| arg0@@33 arg1@@14)) (SeqType T@@14)))
 :qid |funType:Seq#Append|
 :pattern ( (|Seq#Append| arg0@@33 arg1@@14))
)))
(assert (forall ((s0 T@U) (s1 T@U) (n@@5 Int) ) (! (let ((T@@15 (SeqTypeInv0 (type s0))))
 (=> (and (= (type s0) (SeqType T@@15)) (= (type s1) (SeqType T@@15))) (=> (and (and (and (not (= s0 (|Seq#Empty| T@@15))) (not (= s1 (|Seq#Empty| T@@15)))) (<= (|Seq#Length| s0) n@@5)) (< n@@5 (|Seq#Length| (|Seq#Append| s0 s1)))) (and (= (|Seq#Add| (|Seq#Sub| n@@5 (|Seq#Length| s0)) (|Seq#Length| s0)) n@@5) (= (|Seq#Index| (|Seq#Append| s0 s1) n@@5) (|Seq#Index| s1 (|Seq#Sub| n@@5 (|Seq#Length| s0))))))))
 :qid |stdinbpl.313:18|
 :skolemid |32|
 :pattern ( (|Seq#Index| (|Seq#Append| s0 s1) n@@5))
)))
(assert  (not (IsPredicateField src)))
(assert  (not (IsWandField src)))
(assert  (not (IsPredicateField dst)))
(assert  (not (IsWandField dst)))
(assert  (not (IsPredicateField Integer_value)))
(assert  (not (IsWandField Integer_value)))
(assert (forall ((Heap@@4 T@U) (ExhaleHeap@@3 T@U) (Mask@@4 T@U) ) (!  (=> (and (and (and (= (type Heap@@4) (MapType0Type RefType)) (= (type ExhaleHeap@@3) (MapType0Type RefType))) (= (type Mask@@4) (MapType1Type RefType realType))) (IdenticalOnKnownLocations Heap@@4 ExhaleHeap@@3 Mask@@4)) (succHeap Heap@@4 ExhaleHeap@@3))
 :qid |stdinbpl.83:15|
 :skolemid |10|
 :pattern ( (IdenticalOnKnownLocations Heap@@4 ExhaleHeap@@3 Mask@@4))
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
(assert  (and (forall ((arg0@@34 Real) (arg1@@15 T@U) ) (! (= (type (ConditionalFrame arg0@@34 arg1@@15)) FrameTypeType)
 :qid |funType:ConditionalFrame|
 :pattern ( (ConditionalFrame arg0@@34 arg1@@15))
)) (= (type EmptyFrame) FrameTypeType)))
(assert (forall ((p@@0 Real) (f_6 T@U) ) (!  (=> (= (type f_6) FrameTypeType) (= (ConditionalFrame p@@0 f_6) (ite (> p@@0 0.0) f_6 EmptyFrame)))
 :qid |stdinbpl.233:15|
 :skolemid |19|
 :pattern ( (ConditionalFrame p@@0 f_6))
)))
(assert (forall ((q@min@@0 Int) (q@max@@0 Int) (j@@3 Int) ) (!  (=> (and (<= 0 j@@3) (< j@@3 (- q@max@@0 q@min@@0))) (= (U_2_int (|Seq#Index| (|Seq#Range| q@min@@0 q@max@@0) j@@3)) (+ q@min@@0 j@@3)))
 :qid |stdinbpl.604:15|
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
 :qid |stdinbpl.282:18|
 :skolemid |26|
 :pattern ( (|Seq#Length| (|Seq#Append| s0@@0 s1@@0)))
)))
(assert (forall ((s@@6 T@U) (t T@U) (n@@6 Int) ) (! (let ((T@@17 (SeqTypeInv0 (type s@@6))))
 (=> (and (and (= (type s@@6) (SeqType T@@17)) (= (type t) (SeqType T@@17))) (and (> n@@6 0) (> n@@6 (|Seq#Length| s@@6)))) (and (= (|Seq#Add| (|Seq#Sub| n@@6 (|Seq#Length| s@@6)) (|Seq#Length| s@@6)) n@@6) (= (|Seq#Drop| (|Seq#Append| s@@6 t) n@@6) (|Seq#Drop| t (|Seq#Sub| n@@6 (|Seq#Length| s@@6)))))))
 :qid |stdinbpl.438:18|
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
 :qid |stdinbpl.425:18|
 :skolemid |42|
 :pattern ( (|Seq#Take| (|Seq#Append| s@@7 t@@0) n@@7))
)))
(assert (forall ((q@min@@1 Int) (q@max@@1 Int) ) (!  (and (=> (< q@min@@1 q@max@@1) (= (|Seq#Length| (|Seq#Range| q@min@@1 q@max@@1)) (- q@max@@1 q@min@@1))) (=> (<= q@max@@1 q@min@@1) (= (|Seq#Length| (|Seq#Range| q@min@@1 q@max@@1)) 0)))
 :qid |stdinbpl.603:15|
 :skolemid |55|
 :pattern ( (|Seq#Length| (|Seq#Range| q@min@@1 q@max@@1)))
)))
(assert (forall ((a T@U) (b T@U) ) (! (let ((T@@19 (SeqTypeInv0 (type a))))
 (=> (and (and (= (type a) (SeqType T@@19)) (= (type b) (SeqType T@@19))) (|Seq#Equal| a b)) (= a b)))
 :qid |stdinbpl.576:18|
 :skolemid |53|
 :pattern ( (|Seq#Equal| a b))
)))
(assert (forall ((s@@8 T@U) (i@@2 Int) ) (! (let ((T@@20 (SeqTypeInv0 (type s@@8))))
 (=> (= (type s@@8) (SeqType T@@20)) (=> (and (<= 0 i@@2) (< i@@2 (|Seq#Length| s@@8))) (|Seq#ContainsTrigger| s@@8 (|Seq#Index| s@@8 i@@2)))))
 :qid |stdinbpl.469:18|
 :skolemid |49|
 :pattern ( (|Seq#Index| s@@8 i@@2))
)))
(assert (forall ((s0@@1 T@U) (s1@@1 T@U) ) (! (let ((T@@21 (SeqTypeInv0 (type s0@@1))))
 (=> (and (= (type s0@@1) (SeqType T@@21)) (= (type s1@@1) (SeqType T@@21))) (and (=> (= s0@@1 (|Seq#Empty| T@@21)) (= (|Seq#Append| s0@@1 s1@@1) s1@@1)) (=> (= s1@@1 (|Seq#Empty| T@@21)) (= (|Seq#Append| s0@@1 s1@@1) s0@@1)))))
 :qid |stdinbpl.288:18|
 :skolemid |27|
 :pattern ( (|Seq#Append| s0@@1 s1@@1))
)))
(assert (forall ((t@@1 T@U) ) (! (= (|Seq#Index| (|Seq#Singleton| t@@1) 0) t@@1)
 :qid |stdinbpl.292:18|
 :skolemid |28|
 :pattern ( (|Seq#Singleton| t@@1))
)))
(assert (forall ((s@@9 T@U) ) (! (let ((T@@22 (SeqTypeInv0 (type s@@9))))
 (=> (= (type s@@9) (SeqType T@@22)) (<= 0 (|Seq#Length| s@@9))))
 :qid |stdinbpl.271:18|
 :skolemid |22|
 :pattern ( (|Seq#Length| s@@9))
)))
(assert (forall ((s0@@2 T@U) (s1@@2 T@U) ) (! (let ((T@@23 (SeqTypeInv0 (type s0@@2))))
 (=> (and (and (= (type s0@@2) (SeqType T@@23)) (= (type s1@@2) (SeqType T@@23))) (|Seq#Equal| s0@@2 s1@@2)) (and (= (|Seq#Length| s0@@2) (|Seq#Length| s1@@2)) (forall ((j@@4 Int) ) (!  (=> (and (<= 0 j@@4) (< j@@4 (|Seq#Length| s0@@2))) (= (|Seq#Index| s0@@2 j@@4) (|Seq#Index| s1@@2 j@@4)))
 :qid |stdinbpl.566:13|
 :skolemid |50|
 :pattern ( (|Seq#Index| s0@@2 j@@4))
 :pattern ( (|Seq#Index| s1@@2 j@@4))
)))))
 :qid |stdinbpl.563:18|
 :skolemid |51|
 :pattern ( (|Seq#Equal| s0@@2 s1@@2))
)))
(assert (forall ((Heap@@5 T@U) (ExhaleHeap@@4 T@U) (Mask@@6 T@U) (pm_f@@1 T@U) ) (! (let ((C@@1 (FieldTypeInv0 (type pm_f@@1))))
 (=> (and (and (and (and (and (= (type Heap@@5) (MapType0Type RefType)) (= (type ExhaleHeap@@4) (MapType0Type RefType))) (= (type Mask@@6) (MapType1Type RefType realType))) (= (type pm_f@@1) (FieldType C@@1 FrameTypeType))) (IdenticalOnKnownLocations Heap@@5 ExhaleHeap@@4 Mask@@6)) (and (HasDirectPerm Mask@@6 null pm_f@@1) (IsPredicateField pm_f@@1))) (forall ((o2 T@U) (f_2@@0 T@U) ) (! (let ((B@@5 (FieldTypeInv1 (type f_2@@0))))
(let ((A@@6 (FieldTypeInv0 (type f_2@@0))))
 (=> (and (and (= (type o2) RefType) (= (type f_2@@0) (FieldType A@@6 B@@5))) (U_2_bool (MapType1Select (MapType0Select Heap@@5 null (PredicateMaskField pm_f@@1)) o2 f_2@@0))) (= (MapType0Select Heap@@5 o2 f_2@@0) (MapType0Select ExhaleHeap@@4 o2 f_2@@0)))))
 :qid |stdinbpl.54:134|
 :skolemid |3|
 :pattern ( (MapType0Select ExhaleHeap@@4 o2 f_2@@0))
))))
 :qid |stdinbpl.52:19|
 :skolemid |4|
 :pattern ( (IdenticalOnKnownLocations Heap@@5 ExhaleHeap@@4 Mask@@6) (IsPredicateField pm_f@@1))
)))
(assert (forall ((Heap@@6 T@U) (ExhaleHeap@@5 T@U) (Mask@@7 T@U) (pm_f@@2 T@U) ) (! (let ((C@@2 (FieldTypeInv0 (type pm_f@@2))))
 (=> (and (and (and (and (and (= (type Heap@@6) (MapType0Type RefType)) (= (type ExhaleHeap@@5) (MapType0Type RefType))) (= (type Mask@@7) (MapType1Type RefType realType))) (= (type pm_f@@2) (FieldType C@@2 FrameTypeType))) (IdenticalOnKnownLocations Heap@@6 ExhaleHeap@@5 Mask@@7)) (and (HasDirectPerm Mask@@7 null pm_f@@2) (IsWandField pm_f@@2))) (forall ((o2@@0 T@U) (f_2@@1 T@U) ) (! (let ((B@@6 (FieldTypeInv1 (type f_2@@1))))
(let ((A@@7 (FieldTypeInv0 (type f_2@@1))))
 (=> (and (and (= (type o2@@0) RefType) (= (type f_2@@1) (FieldType A@@7 B@@6))) (U_2_bool (MapType1Select (MapType0Select Heap@@6 null (WandMaskField pm_f@@2)) o2@@0 f_2@@1))) (= (MapType0Select Heap@@6 o2@@0 f_2@@1) (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1)))))
 :qid |stdinbpl.67:129|
 :skolemid |6|
 :pattern ( (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1))
))))
 :qid |stdinbpl.65:19|
 :skolemid |7|
 :pattern ( (IdenticalOnKnownLocations Heap@@6 ExhaleHeap@@5 Mask@@7) (IsWandField pm_f@@2))
)))
(assert (forall ((t@@2 T@U) ) (! (= (|Seq#Length| (|Seq#Singleton| t@@2)) 1)
 :qid |stdinbpl.279:18|
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
(assert (forall ((o T@U) (f T@U) (Heap@@7 T@U) ) (!  (=> (and (and (and (= (type o) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap@@7) (MapType0Type RefType))) (U_2_bool (MapType0Select Heap@@7 o $allocated))) (U_2_bool (MapType0Select Heap@@7 (MapType0Select Heap@@7 o f) $allocated)))
 :qid |stdinbpl.31:15|
 :skolemid |0|
 :pattern ( (MapType0Select Heap@@7 o f))
)))
(assert (forall ((s@@10 T@U) (t@@3 T@U) (n@@8 Int) ) (! (let ((T@@24 (SeqTypeInv0 (type s@@10))))
 (=> (and (and (= (type s@@10) (SeqType T@@24)) (= (type t@@3) (SeqType T@@24))) (and (< 0 n@@8) (<= n@@8 (|Seq#Length| s@@10)))) (= (|Seq#Take| (|Seq#Append| s@@10 t@@3) n@@8) (|Seq#Take| s@@10 n@@8))))
 :qid |stdinbpl.421:18|
 :skolemid |41|
 :pattern ( (|Seq#Take| (|Seq#Append| s@@10 t@@3) n@@8))
)))
(assert (forall ((s@@11 T@U) (i@@3 Int) (v@@1 T@U) ) (! (let ((T@@25 (type v@@1)))
 (=> (= (type s@@11) (SeqType T@@25)) (=> (and (<= 0 i@@3) (< i@@3 (|Seq#Length| s@@11))) (= (|Seq#Length| (|Seq#Update| s@@11 i@@3 v@@1)) (|Seq#Length| s@@11)))))
 :qid |stdinbpl.320:18|
 :skolemid |34|
 :pattern ( (|Seq#Length| (|Seq#Update| s@@11 i@@3 v@@1)))
 :pattern ( (|Seq#Length| s@@11) (|Seq#Update| s@@11 i@@3 v@@1))
)))
(assert (forall ((s@@12 T@U) (t@@4 T@U) (n@@9 Int) ) (! (let ((T@@26 (SeqTypeInv0 (type s@@12))))
 (=> (and (and (= (type s@@12) (SeqType T@@26)) (= (type t@@4) (SeqType T@@26))) (and (< 0 n@@9) (<= n@@9 (|Seq#Length| s@@12)))) (= (|Seq#Drop| (|Seq#Append| s@@12 t@@4) n@@9) (|Seq#Append| (|Seq#Drop| s@@12 n@@9) t@@4))))
 :qid |stdinbpl.434:18|
 :skolemid |43|
 :pattern ( (|Seq#Drop| (|Seq#Append| s@@12 t@@4) n@@9))
)))
(assert (forall ((s@@13 T@U) (n@@10 Int) (i@@4 Int) ) (! (let ((T@@27 (SeqTypeInv0 (type s@@13))))
 (=> (= (type s@@13) (SeqType T@@27)) (=> (and (and (< 0 n@@10) (<= n@@10 i@@4)) (< i@@4 (|Seq#Length| s@@13))) (and (= (|Seq#Add| (|Seq#Sub| i@@4 n@@10) n@@10) i@@4) (= (|Seq#Index| (|Seq#Drop| s@@13 n@@10) (|Seq#Sub| i@@4 n@@10)) (|Seq#Index| s@@13 i@@4))))))
 :qid |stdinbpl.371:18|
 :skolemid |40|
 :pattern ( (|Seq#Drop| s@@13 n@@10) (|Seq#Index| s@@13 i@@4))
)))
(assert (forall ((s0@@3 T@U) (s1@@3 T@U) (n@@11 Int) ) (! (let ((T@@28 (SeqTypeInv0 (type s0@@3))))
 (=> (and (= (type s0@@3) (SeqType T@@28)) (= (type s1@@3) (SeqType T@@28))) (=> (and (and (and (not (= s0@@3 (|Seq#Empty| T@@28))) (not (= s1@@3 (|Seq#Empty| T@@28)))) (<= 0 n@@11)) (< n@@11 (|Seq#Length| s0@@3))) (= (|Seq#Index| (|Seq#Append| s0@@3 s1@@3) n@@11) (|Seq#Index| s0@@3 n@@11)))))
 :qid |stdinbpl.311:18|
 :skolemid |31|
 :pattern ( (|Seq#Index| (|Seq#Append| s0@@3 s1@@3) n@@11))
 :pattern ( (|Seq#Index| s0@@3 n@@11) (|Seq#Append| s0@@3 s1@@3))
)))
(assert (forall ((Heap@@8 T@U) (o@@0 T@U) (f_3 T@U) (v@@2 T@U) ) (! (let ((B@@8 (type v@@2)))
(let ((A@@9 (FieldTypeInv0 (type f_3))))
 (=> (and (and (= (type Heap@@8) (MapType0Type RefType)) (= (type o@@0) RefType)) (= (type f_3) (FieldType A@@9 B@@8))) (succHeap Heap@@8 (MapType0Store Heap@@8 o@@0 f_3 v@@2)))))
 :qid |stdinbpl.78:22|
 :skolemid |9|
 :pattern ( (MapType0Store Heap@@8 o@@0 f_3 v@@2))
)))
(assert (forall ((s0@@4 T@U) (s1@@4 T@U) (m@@7 Int) ) (! (let ((T@@29 (SeqTypeInv0 (type s0@@4))))
 (=> (and (= (type s0@@4) (SeqType T@@29)) (= (type s1@@4) (SeqType T@@29))) (=> (and (and (and (not (= s0@@4 (|Seq#Empty| T@@29))) (not (= s1@@4 (|Seq#Empty| T@@29)))) (<= 0 m@@7)) (< m@@7 (|Seq#Length| s1@@4))) (and (= (|Seq#Sub| (|Seq#Add| m@@7 (|Seq#Length| s0@@4)) (|Seq#Length| s0@@4)) m@@7) (= (|Seq#Index| (|Seq#Append| s0@@4 s1@@4) (|Seq#Add| m@@7 (|Seq#Length| s0@@4))) (|Seq#Index| s1@@4 m@@7))))))
 :qid |stdinbpl.316:18|
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
 :qid |stdinbpl.467:18|
 :skolemid |48|
 :pattern ( (|Seq#Contains| s@@14 x@@10) (|Seq#Index| s@@14 i@@5))
)))
(assert (forall ((s0@@5 T@U) (s1@@5 T@U) ) (! (let ((T@@31 (SeqTypeInv0 (type s0@@5))))
 (=> (and (= (type s0@@5) (SeqType T@@31)) (= (type s1@@5) (SeqType T@@31))) (or (or (and (= s0@@5 s1@@5) (|Seq#Equal| s0@@5 s1@@5)) (and (and (not (= s0@@5 s1@@5)) (not (|Seq#Equal| s0@@5 s1@@5))) (not (= (|Seq#Length| s0@@5) (|Seq#Length| s1@@5))))) (and (and (and (and (and (and (not (= s0@@5 s1@@5)) (not (|Seq#Equal| s0@@5 s1@@5))) (= (|Seq#Length| s0@@5) (|Seq#Length| s1@@5))) (= (|Seq#SkolemDiff| s0@@5 s1@@5) (|Seq#SkolemDiff| s1@@5 s0@@5))) (<= 0 (|Seq#SkolemDiff| s0@@5 s1@@5))) (< (|Seq#SkolemDiff| s0@@5 s1@@5) (|Seq#Length| s0@@5))) (not (= (|Seq#Index| s0@@5 (|Seq#SkolemDiff| s0@@5 s1@@5)) (|Seq#Index| s1@@5 (|Seq#SkolemDiff| s0@@5 s1@@5))))))))
 :qid |stdinbpl.571:18|
 :skolemid |52|
 :pattern ( (|Seq#Equal| s0@@5 s1@@5))
)))
(assert (forall ((p@@1 T@U) (v_1@@0 T@U) (q T@U) (w@@0 T@U) (r T@U) (u T@U) ) (! (let ((C@@3 (FieldTypeInv0 (type r))))
(let ((B@@10 (FieldTypeInv0 (type q))))
(let ((A@@11 (FieldTypeInv0 (type p@@1))))
 (=> (and (and (and (and (and (and (= (type p@@1) (FieldType A@@11 FrameTypeType)) (= (type v_1@@0) FrameTypeType)) (= (type q) (FieldType B@@10 FrameTypeType))) (= (type w@@0) FrameTypeType)) (= (type r) (FieldType C@@3 FrameTypeType))) (= (type u) FrameTypeType)) (and (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))) (InsidePredicate p@@1 v_1@@0 r u)))))
 :qid |stdinbpl.240:25|
 :skolemid |20|
 :pattern ( (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))
)))
(assert (forall ((s@@15 T@U) ) (! (let ((T@@32 (SeqTypeInv0 (type s@@15))))
 (=> (and (= (type s@@15) (SeqType T@@32)) (= (|Seq#Length| s@@15) 0)) (= s@@15 (|Seq#Empty| T@@32))))
 :qid |stdinbpl.275:18|
 :skolemid |24|
 :pattern ( (|Seq#Length| s@@15))
)))
(assert (forall ((s@@16 T@U) (n@@12 Int) ) (! (let ((T@@33 (SeqTypeInv0 (type s@@16))))
 (=> (and (= (type s@@16) (SeqType T@@33)) (<= n@@12 0)) (= (|Seq#Take| s@@16 n@@12) (|Seq#Empty| T@@33))))
 :qid |stdinbpl.450:18|
 :skolemid |46|
 :pattern ( (|Seq#Take| s@@16 n@@12))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun i_40 () Int)
(declare-fun half () Int)
(declare-fun QPMask@1 () T@U)
(declare-fun this () T@U)
(declare-fun Heap@@9 () T@U)
(declare-fun i_41 () Int)
(declare-fun gsize () Int)
(declare-fun i_43 () Int)
(declare-fun PostMask@5 () T@U)
(declare-fun PostHeap@0 () T@U)
(declare-fun i_44 () Int)
(declare-fun tid () Int)
(declare-fun PostMask@3 () T@U)
(declare-fun PostMask@4 () T@U)
(declare-fun QPMask@3 () T@U)
(declare-fun PostMask@2 () T@U)
(declare-fun qpRange20 (T@U) Bool)
(declare-fun invRecv20 (T@U) Int)
(declare-fun PostMask@1 () T@U)
(declare-fun i_42 () Int)
(declare-fun ix_19 () Int)
(declare-fun jx_19 () Int)
(declare-fun tcount () Int)
(declare-fun lid () Int)
(declare-fun gid () Int)
(declare-fun wildcard@2 () Real)
(declare-fun PostMask@0 () T@U)
(declare-fun wildcard@3 () Real)
(declare-fun i_13 () Int)
(declare-fun i_15 () Int)
(declare-fun Mask@6 () T@U)
(declare-fun Mask@5 () T@U)
(declare-fun Mask@7 () T@U)
(declare-fun Mask@4 () T@U)
(declare-fun QPMask@2 () T@U)
(declare-fun dummyFunction (T@U) Bool)
(declare-fun neverTriggered21 (Int) Bool)
(declare-fun Mask@3 () T@U)
(declare-fun qpRange21 (T@U) Bool)
(declare-fun invRecv21 (T@U) Int)
(declare-fun ix_6 () Int)
(declare-fun jx_6 () Int)
(declare-fun wildcard@4 () Real)
(declare-fun Mask@2 () T@U)
(declare-fun wildcard@5 () Real)
(declare-fun qpRange19 (T@U) Bool)
(declare-fun invRecv19 (T@U) Int)
(declare-fun QPMask@0 () T@U)
(declare-fun _x_tid () Int)
(declare-fun ix_18 () Int)
(declare-fun jx_18 () Int)
(declare-fun qpRange18 (T@U) Bool)
(declare-fun invRecv18 (T@U) Int)
(declare-fun Mask@1 () T@U)
(declare-fun i_39 () Int)
(declare-fun ix_17 () Int)
(declare-fun jx_17 () Int)
(declare-fun wildcard@0 () Real)
(declare-fun Mask@0 () T@U)
(declare-fun wildcard@1 () Real)
(declare-fun wildcard () Real)
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (= (type Heap@@9) (MapType0Type RefType)) (= (type this) RefType)) (= (type Mask@1) (MapType1Type RefType realType))) (= (type QPMask@0) (MapType1Type RefType realType))) (= (type Mask@7) (MapType1Type RefType realType))) (= (type Mask@5) (MapType1Type RefType realType))) (= (type Mask@6) (MapType1Type RefType realType))) (= (type QPMask@2) (MapType1Type RefType realType))) (= (type Mask@4) (MapType1Type RefType realType))) (= (type Mask@3) (MapType1Type RefType realType))) (= (type QPMask@1) (MapType1Type RefType realType))) (= (type Mask@2) (MapType1Type RefType realType))) (= (type PostHeap@0) (MapType0Type RefType))) (= (type PostMask@1) (MapType1Type RefType realType))) (= (type PostMask@5) (MapType1Type RefType realType))) (= (type PostMask@3) (MapType1Type RefType realType))) (= (type PostMask@4) (MapType1Type RefType realType))) (= (type QPMask@3) (MapType1Type RefType realType))) (= (type PostMask@2) (MapType1Type RefType realType))) (= (type PostMask@0) (MapType1Type RefType realType))) (= (type Mask@0) (MapType1Type RefType realType))))
(set-info :boogie-vc-id main_post_check_1)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 208) (let ((anon28_correct true))
(let ((anon107_Else_correct  (=> (and (not (and (<= 0 i_40) (< i_40 half))) (= (ControlFlow 0 196) 187)) anon28_correct)))
(let ((anon107_Then_correct  (=> (and (<= 0 i_40) (< i_40 half)) (and (=> (= (ControlFlow 0 188) (- 0 195)) (HasDirectPerm QPMask@1 this dst)) (=> (HasDirectPerm QPMask@1 this dst) (and (=> (= (ControlFlow 0 188) (- 0 194)) (< 0 (|Seq#Length| (MapType0Select Heap@@9 this dst)))) (=> (< 0 (|Seq#Length| (MapType0Select Heap@@9 this dst))) (and (=> (= (ControlFlow 0 188) (- 0 193)) (HasDirectPerm QPMask@1 (|Seq#Index| (MapType0Select Heap@@9 this dst) 0) Integer_value)) (=> (HasDirectPerm QPMask@1 (|Seq#Index| (MapType0Select Heap@@9 this dst) 0) Integer_value) (and (=> (= (ControlFlow 0 188) (- 0 192)) (HasDirectPerm QPMask@1 this src)) (=> (HasDirectPerm QPMask@1 this src) (and (=> (= (ControlFlow 0 188) (- 0 191)) (>= i_40 0)) (=> (>= i_40 0) (and (=> (= (ControlFlow 0 188) (- 0 190)) (< i_40 (|Seq#Length| (MapType0Select Heap@@9 this src)))) (=> (< i_40 (|Seq#Length| (MapType0Select Heap@@9 this src))) (and (=> (= (ControlFlow 0 188) (- 0 189)) (HasDirectPerm QPMask@1 (|Seq#Index| (MapType0Select Heap@@9 this src) i_40) Integer_value)) (=> (HasDirectPerm QPMask@1 (|Seq#Index| (MapType0Select Heap@@9 this src) i_40) Integer_value) (=> (= (ControlFlow 0 188) 187) anon28_correct))))))))))))))))))
(let ((anon34_correct true))
(let ((anon110_Else_correct  (=> (and (not (and (<= half i_41) (< i_41 gsize))) (= (ControlFlow 0 182) 173)) anon34_correct)))
(let ((anon110_Then_correct  (=> (and (<= half i_41) (< i_41 gsize)) (and (=> (= (ControlFlow 0 174) (- 0 181)) (HasDirectPerm QPMask@1 this dst)) (=> (HasDirectPerm QPMask@1 this dst) (and (=> (= (ControlFlow 0 174) (- 0 180)) (< 1 (|Seq#Length| (MapType0Select Heap@@9 this dst)))) (=> (< 1 (|Seq#Length| (MapType0Select Heap@@9 this dst))) (and (=> (= (ControlFlow 0 174) (- 0 179)) (HasDirectPerm QPMask@1 (|Seq#Index| (MapType0Select Heap@@9 this dst) 1) Integer_value)) (=> (HasDirectPerm QPMask@1 (|Seq#Index| (MapType0Select Heap@@9 this dst) 1) Integer_value) (and (=> (= (ControlFlow 0 174) (- 0 178)) (HasDirectPerm QPMask@1 this src)) (=> (HasDirectPerm QPMask@1 this src) (and (=> (= (ControlFlow 0 174) (- 0 177)) (>= i_41 0)) (=> (>= i_41 0) (and (=> (= (ControlFlow 0 174) (- 0 176)) (< i_41 (|Seq#Length| (MapType0Select Heap@@9 this src)))) (=> (< i_41 (|Seq#Length| (MapType0Select Heap@@9 this src))) (and (=> (= (ControlFlow 0 174) (- 0 175)) (HasDirectPerm QPMask@1 (|Seq#Index| (MapType0Select Heap@@9 this src) i_41) Integer_value)) (=> (HasDirectPerm QPMask@1 (|Seq#Index| (MapType0Select Heap@@9 this src) i_41) Integer_value) (=> (= (ControlFlow 0 174) 173) anon34_correct))))))))))))))))))
(let ((anon57_correct true))
(let ((anon123_Else_correct  (=> (and (not (and (<= 0 i_43) (< i_43 half))) (= (ControlFlow 0 147) 138)) anon57_correct)))
(let ((anon123_Then_correct  (=> (and (<= 0 i_43) (< i_43 half)) (and (=> (= (ControlFlow 0 139) (- 0 146)) (HasDirectPerm PostMask@5 this dst)) (=> (HasDirectPerm PostMask@5 this dst) (and (=> (= (ControlFlow 0 139) (- 0 145)) (< 0 (|Seq#Length| (MapType0Select PostHeap@0 this dst)))) (=> (< 0 (|Seq#Length| (MapType0Select PostHeap@0 this dst))) (and (=> (= (ControlFlow 0 139) (- 0 144)) (HasDirectPerm PostMask@5 (|Seq#Index| (MapType0Select PostHeap@0 this dst) 0) Integer_value)) (=> (HasDirectPerm PostMask@5 (|Seq#Index| (MapType0Select PostHeap@0 this dst) 0) Integer_value) (and (=> (= (ControlFlow 0 139) (- 0 143)) (HasDirectPerm PostMask@5 this src)) (=> (HasDirectPerm PostMask@5 this src) (and (=> (= (ControlFlow 0 139) (- 0 142)) (>= i_43 0)) (=> (>= i_43 0) (and (=> (= (ControlFlow 0 139) (- 0 141)) (< i_43 (|Seq#Length| (MapType0Select PostHeap@0 this src)))) (=> (< i_43 (|Seq#Length| (MapType0Select PostHeap@0 this src))) (and (=> (= (ControlFlow 0 139) (- 0 140)) (HasDirectPerm PostMask@5 (|Seq#Index| (MapType0Select PostHeap@0 this src) i_43) Integer_value)) (=> (HasDirectPerm PostMask@5 (|Seq#Index| (MapType0Select PostHeap@0 this src) i_43) Integer_value) (=> (= (ControlFlow 0 139) 138) anon57_correct))))))))))))))))))
(let ((anon63_correct true))
(let ((anon126_Else_correct  (=> (and (not (and (<= half i_44) (< i_44 gsize))) (= (ControlFlow 0 133) 124)) anon63_correct)))
(let ((anon126_Then_correct  (=> (and (<= half i_44) (< i_44 gsize)) (and (=> (= (ControlFlow 0 125) (- 0 132)) (HasDirectPerm PostMask@5 this dst)) (=> (HasDirectPerm PostMask@5 this dst) (and (=> (= (ControlFlow 0 125) (- 0 131)) (< 1 (|Seq#Length| (MapType0Select PostHeap@0 this dst)))) (=> (< 1 (|Seq#Length| (MapType0Select PostHeap@0 this dst))) (and (=> (= (ControlFlow 0 125) (- 0 130)) (HasDirectPerm PostMask@5 (|Seq#Index| (MapType0Select PostHeap@0 this dst) 1) Integer_value)) (=> (HasDirectPerm PostMask@5 (|Seq#Index| (MapType0Select PostHeap@0 this dst) 1) Integer_value) (and (=> (= (ControlFlow 0 125) (- 0 129)) (HasDirectPerm PostMask@5 this src)) (=> (HasDirectPerm PostMask@5 this src) (and (=> (= (ControlFlow 0 125) (- 0 128)) (>= i_44 0)) (=> (>= i_44 0) (and (=> (= (ControlFlow 0 125) (- 0 127)) (< i_44 (|Seq#Length| (MapType0Select PostHeap@0 this src)))) (=> (< i_44 (|Seq#Length| (MapType0Select PostHeap@0 this src))) (and (=> (= (ControlFlow 0 125) (- 0 126)) (HasDirectPerm PostMask@5 (|Seq#Index| (MapType0Select PostHeap@0 this src) i_44) Integer_value)) (=> (HasDirectPerm PostMask@5 (|Seq#Index| (MapType0Select PostHeap@0 this src) i_44) Integer_value) (=> (= (ControlFlow 0 125) 124) anon63_correct))))))))))))))))))
(let ((anon65_correct true))
(let ((anon125_Else_correct  (=> (and (forall ((i_11_2 Int) ) (!  (=> (and (<= half i_11_2) (< i_11_2 gsize)) (>= (U_2_int (MapType0Select PostHeap@0 (|Seq#Index| (MapType0Select PostHeap@0 this dst) 1) Integer_value)) (U_2_int (MapType0Select PostHeap@0 (|Seq#Index| (MapType0Select PostHeap@0 this src) i_11_2) Integer_value))))
 :qid |stdinbpl.4143:22|
 :skolemid |238|
 :pattern ( (|Seq#Index| (MapType0Select PostHeap@0 this src) i_11_2))
)) (= (ControlFlow 0 123) 121)) anon65_correct)))
(let ((anon124_Then_correct  (=> (= tid 0) (and (and (=> (= (ControlFlow 0 134) 123) anon125_Else_correct) (=> (= (ControlFlow 0 134) 125) anon126_Then_correct)) (=> (= (ControlFlow 0 134) 133) anon126_Else_correct)))))
(let ((anon124_Else_correct  (=> (and (not (= tid 0)) (= (ControlFlow 0 122) 121)) anon65_correct)))
(let ((anon59_correct  (=> (state PostHeap@0 PostMask@5) (and (=> (= (ControlFlow 0 135) 134) anon124_Then_correct) (=> (= (ControlFlow 0 135) 122) anon124_Else_correct)))))
(let ((anon122_Else_correct  (=> (and (forall ((i_9 Int) ) (!  (=> (and (<= 0 i_9) (< i_9 half)) (>= (U_2_int (MapType0Select PostHeap@0 (|Seq#Index| (MapType0Select PostHeap@0 this dst) 0) Integer_value)) (U_2_int (MapType0Select PostHeap@0 (|Seq#Index| (MapType0Select PostHeap@0 this src) i_9) Integer_value))))
 :qid |stdinbpl.4115:22|
 :skolemid |237|
 :pattern ( (|Seq#Index| (MapType0Select PostHeap@0 this src) i_9))
)) (= (ControlFlow 0 137) 135)) anon59_correct)))
(let ((anon121_Then_correct  (=> (= tid 0) (and (and (=> (= (ControlFlow 0 148) 137) anon122_Else_correct) (=> (= (ControlFlow 0 148) 139) anon123_Then_correct)) (=> (= (ControlFlow 0 148) 147) anon123_Else_correct)))))
(let ((anon121_Else_correct  (=> (and (not (= tid 0)) (= (ControlFlow 0 136) 135)) anon59_correct)))
(let ((anon53_correct  (=> (state PostHeap@0 PostMask@5) (and (=> (= (ControlFlow 0 149) 148) anon121_Then_correct) (=> (= (ControlFlow 0 149) 136) anon121_Else_correct)))))
(let ((anon120_Else_correct  (=> (not (= tid 0)) (=> (and (= PostMask@5 PostMask@3) (= (ControlFlow 0 153) 149)) anon53_correct))))
(let ((anon120_Then_correct  (=> (= tid 0) (and (=> (= (ControlFlow 0 150) (- 0 152)) (HasDirectPerm PostMask@3 this dst)) (=> (HasDirectPerm PostMask@3 this dst) (and (=> (= (ControlFlow 0 150) (- 0 151)) (< 1 (|Seq#Length| (MapType0Select PostHeap@0 this dst)))) (=> (< 1 (|Seq#Length| (MapType0Select PostHeap@0 this dst))) (=> (not (= (|Seq#Index| (MapType0Select PostHeap@0 this dst) 1) null)) (=> (and (and (= PostMask@4 (MapType1Store PostMask@3 (|Seq#Index| (MapType0Select PostHeap@0 this dst) 1) Integer_value (real_2_U (+ (U_2_real (MapType1Select PostMask@3 (|Seq#Index| (MapType0Select PostHeap@0 this dst) 1) Integer_value)) FullPerm)))) (state PostHeap@0 PostMask@4)) (and (= PostMask@5 PostMask@4) (= (ControlFlow 0 150) 149))) anon53_correct)))))))))
(let ((anon51_correct  (=> (state PostHeap@0 PostMask@3) (and (=> (= (ControlFlow 0 154) 150) anon120_Then_correct) (=> (= (ControlFlow 0 154) 153) anon120_Else_correct)))))
(let ((anon119_Else_correct  (=> (not (= tid 0)) (=> (and (= PostMask@3 QPMask@3) (= (ControlFlow 0 158) 154)) anon51_correct))))
(let ((anon119_Then_correct  (=> (= tid 0) (and (=> (= (ControlFlow 0 155) (- 0 157)) (HasDirectPerm QPMask@3 this dst)) (=> (HasDirectPerm QPMask@3 this dst) (and (=> (= (ControlFlow 0 155) (- 0 156)) (< 0 (|Seq#Length| (MapType0Select PostHeap@0 this dst)))) (=> (< 0 (|Seq#Length| (MapType0Select PostHeap@0 this dst))) (=> (not (= (|Seq#Index| (MapType0Select PostHeap@0 this dst) 0) null)) (=> (and (and (= PostMask@2 (MapType1Store QPMask@3 (|Seq#Index| (MapType0Select PostHeap@0 this dst) 0) Integer_value (real_2_U (+ (U_2_real (MapType1Select QPMask@3 (|Seq#Index| (MapType0Select PostHeap@0 this dst) 0) Integer_value)) FullPerm)))) (state PostHeap@0 PostMask@2)) (and (= PostMask@3 PostMask@2) (= (ControlFlow 0 155) 154))) anon51_correct)))))))))
(let ((anon117_Else_correct  (and (=> (= (ControlFlow 0 159) (- 0 165)) (forall ((i_7 Int) (i_7_1 Int) ) (!  (=> (and (and (and (and (not (= i_7 i_7_1)) (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_7))) (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_7_1))) (< NoPerm (/ (to_real 1) (to_real gsize)))) (< NoPerm (/ (to_real 1) (to_real gsize)))) (not (= (|Seq#Index| (MapType0Select PostHeap@0 this src) i_7) (|Seq#Index| (MapType0Select PostHeap@0 this src) i_7_1))))
 :qid |stdinbpl.4012:15|
 :skolemid |230|
))) (=> (forall ((i_7@@0 Int) (i_7_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_7@@0 i_7_1@@0)) (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_7@@0))) (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_7_1@@0))) (< NoPerm (/ (to_real 1) (to_real gsize)))) (< NoPerm (/ (to_real 1) (to_real gsize)))) (not (= (|Seq#Index| (MapType0Select PostHeap@0 this src) i_7@@0) (|Seq#Index| (MapType0Select PostHeap@0 this src) i_7_1@@0))))
 :qid |stdinbpl.4012:15|
 :skolemid |230|
)) (=> (and (forall ((i_7@@1 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_7@@1)) (< NoPerm (/ (to_real 1) (to_real gsize)))) (and (qpRange20 (|Seq#Index| (MapType0Select PostHeap@0 this src) i_7@@1)) (= (invRecv20 (|Seq#Index| (MapType0Select PostHeap@0 this src) i_7@@1)) i_7@@1)))
 :qid |stdinbpl.4018:22|
 :skolemid |231|
 :pattern ( (|Seq#Index| (MapType0Select PostHeap@0 this src) i_7@@1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 gsize) (int_2_U i_7@@1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_7@@1)))
 :pattern ( (|Seq#Index| (MapType0Select PostHeap@0 this src) i_7@@1))
)) (forall ((o_3 T@U) ) (!  (=> (= (type o_3) RefType) (=> (and (and (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U (invRecv20 o_3))) (< NoPerm (/ (to_real 1) (to_real gsize)))) (qpRange20 o_3)) (= (|Seq#Index| (MapType0Select PostHeap@0 this src) (invRecv20 o_3)) o_3)))
 :qid |stdinbpl.4022:22|
 :skolemid |232|
 :pattern ( (invRecv20 o_3))
))) (and (=> (= (ControlFlow 0 159) (- 0 164)) (forall ((i_7@@2 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_7@@2)) (>= (/ (to_real 1) (to_real gsize)) NoPerm))
 :qid |stdinbpl.4028:15|
 :skolemid |233|
 :pattern ( (|Seq#Index| (MapType0Select PostHeap@0 this src) i_7@@2))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 gsize) (int_2_U i_7@@2)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_7@@2)))
 :pattern ( (|Seq#Index| (MapType0Select PostHeap@0 this src) i_7@@2))
))) (=> (forall ((i_7@@3 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_7@@3)) (>= (/ (to_real 1) (to_real gsize)) NoPerm))
 :qid |stdinbpl.4028:15|
 :skolemid |233|
 :pattern ( (|Seq#Index| (MapType0Select PostHeap@0 this src) i_7@@3))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 gsize) (int_2_U i_7@@3)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_7@@3)))
 :pattern ( (|Seq#Index| (MapType0Select PostHeap@0 this src) i_7@@3))
)) (=> (forall ((i_7@@4 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_7@@4)) (> (/ (to_real 1) (to_real gsize)) NoPerm)) (not (= (|Seq#Index| (MapType0Select PostHeap@0 this src) i_7@@4) null)))
 :qid |stdinbpl.4034:22|
 :skolemid |234|
 :pattern ( (|Seq#Index| (MapType0Select PostHeap@0 this src) i_7@@4))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 gsize) (int_2_U i_7@@4)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_7@@4)))
 :pattern ( (|Seq#Index| (MapType0Select PostHeap@0 this src) i_7@@4))
)) (=> (and (and (forall ((o_3@@0 T@U) ) (!  (=> (= (type o_3@@0) RefType) (and (=> (and (and (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U (invRecv20 o_3@@0))) (< NoPerm (/ (to_real 1) (to_real gsize)))) (qpRange20 o_3@@0)) (and (=> (< NoPerm (/ (to_real 1) (to_real gsize))) (= (|Seq#Index| (MapType0Select PostHeap@0 this src) (invRecv20 o_3@@0)) o_3@@0)) (= (U_2_real (MapType1Select QPMask@3 o_3@@0 Integer_value)) (+ (U_2_real (MapType1Select PostMask@1 o_3@@0 Integer_value)) (/ (to_real 1) (to_real gsize)))))) (=> (not (and (and (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U (invRecv20 o_3@@0))) (< NoPerm (/ (to_real 1) (to_real gsize)))) (qpRange20 o_3@@0))) (= (U_2_real (MapType1Select QPMask@3 o_3@@0 Integer_value)) (U_2_real (MapType1Select PostMask@1 o_3@@0 Integer_value))))))
 :qid |stdinbpl.4040:22|
 :skolemid |235|
 :pattern ( (MapType1Select QPMask@3 o_3@@0 Integer_value))
)) (forall ((o_3@@1 T@U) (f_5 T@U) ) (! (let ((B@@11 (FieldTypeInv1 (type f_5))))
(let ((A@@12 (FieldTypeInv0 (type f_5))))
 (=> (and (and (= (type o_3@@1) RefType) (= (type f_5) (FieldType A@@12 B@@11))) (not (= f_5 Integer_value))) (= (U_2_real (MapType1Select PostMask@1 o_3@@1 f_5)) (U_2_real (MapType1Select QPMask@3 o_3@@1 f_5))))))
 :qid |stdinbpl.4044:29|
 :skolemid |236|
 :pattern ( (MapType1Select PostMask@1 o_3@@1 f_5))
 :pattern ( (MapType1Select QPMask@3 o_3@@1 f_5))
))) (and (state PostHeap@0 QPMask@3) (state PostHeap@0 QPMask@3))) (and (=> (= (ControlFlow 0 159) (- 0 163)) (HasDirectPerm QPMask@3 this src)) (=> (HasDirectPerm QPMask@3 this src) (and (=> (= (ControlFlow 0 159) (- 0 162)) (HasDirectPerm QPMask@1 this src)) (=> (HasDirectPerm QPMask@1 this src) (=> (and (|Seq#Equal| (MapType0Select PostHeap@0 this src) (MapType0Select Heap@@9 this src)) (state PostHeap@0 QPMask@3)) (and (=> (= (ControlFlow 0 159) (- 0 161)) (HasDirectPerm QPMask@3 this dst)) (=> (HasDirectPerm QPMask@3 this dst) (and (=> (= (ControlFlow 0 159) (- 0 160)) (HasDirectPerm QPMask@1 this dst)) (=> (HasDirectPerm QPMask@1 this dst) (=> (and (|Seq#Equal| (MapType0Select PostHeap@0 this dst) (MapType0Select Heap@@9 this dst)) (state PostHeap@0 QPMask@3)) (and (=> (= (ControlFlow 0 159) 155) anon119_Then_correct) (=> (= (ControlFlow 0 159) 158) anon119_Else_correct)))))))))))))))))))))
(let ((anon48_correct true))
(let ((anon118_Else_correct  (=> (and (not (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_42))) (= (ControlFlow 0 120) 114)) anon48_correct)))
(let ((anon118_Then_correct  (=> (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_42)) (and (=> (= (ControlFlow 0 115) (- 0 119)) (HasDirectPerm PostMask@1 this src)) (=> (HasDirectPerm PostMask@1 this src) (and (=> (= (ControlFlow 0 115) (- 0 118)) (>= i_42 0)) (=> (>= i_42 0) (and (=> (= (ControlFlow 0 115) (- 0 117)) (< i_42 (|Seq#Length| (MapType0Select PostHeap@0 this src)))) (=> (< i_42 (|Seq#Length| (MapType0Select PostHeap@0 this src))) (and (=> (= (ControlFlow 0 115) (- 0 116)) (not (= gsize 0))) (=> (not (= gsize 0)) (=> (= (ControlFlow 0 115) 114) anon48_correct))))))))))))
(let ((anon112_Else_correct  (=> (and (forall ((ix_5_2 Int) (jx_5_2 Int) ) (!  (=> (and (>= ix_5_2 0) (and (< ix_5_2 (|Seq#Length| (MapType0Select PostHeap@0 this src))) (and (>= jx_5_2 0) (and (< jx_5_2 (|Seq#Length| (MapType0Select PostHeap@0 this src))) (not (= ix_5_2 jx_5_2)))))) (not (= (|Seq#Index| (MapType0Select PostHeap@0 this src) ix_5_2) (|Seq#Index| (MapType0Select PostHeap@0 this src) jx_5_2))))
 :qid |stdinbpl.3990:20|
 :skolemid |229|
 :pattern ( (|Seq#Index| (MapType0Select PostHeap@0 this src) ix_5_2) (|Seq#Index| (MapType0Select PostHeap@0 this src) jx_5_2))
)) (state PostHeap@0 PostMask@1)) (and (and (=> (= (ControlFlow 0 166) 159) anon117_Else_correct) (=> (= (ControlFlow 0 166) 115) anon118_Then_correct)) (=> (= (ControlFlow 0 166) 120) anon118_Else_correct)))))
(let ((anon44_correct true))
(let ((anon116_Else_correct  (=> (and (not (and (>= ix_19 0) (and (< ix_19 (|Seq#Length| (MapType0Select PostHeap@0 this src))) (and (>= jx_19 0) (and (< jx_19 (|Seq#Length| (MapType0Select PostHeap@0 this src))) (not (= ix_19 jx_19))))))) (= (ControlFlow 0 105) 97)) anon44_correct)))
(let ((anon116_Then_correct  (=> (and (>= ix_19 0) (and (< ix_19 (|Seq#Length| (MapType0Select PostHeap@0 this src))) (and (>= jx_19 0) (and (< jx_19 (|Seq#Length| (MapType0Select PostHeap@0 this src))) (not (= ix_19 jx_19)))))) (and (=> (= (ControlFlow 0 98) (- 0 104)) (HasDirectPerm PostMask@1 this src)) (=> (HasDirectPerm PostMask@1 this src) (and (=> (= (ControlFlow 0 98) (- 0 103)) (>= ix_19 0)) (=> (>= ix_19 0) (and (=> (= (ControlFlow 0 98) (- 0 102)) (< ix_19 (|Seq#Length| (MapType0Select PostHeap@0 this src)))) (=> (< ix_19 (|Seq#Length| (MapType0Select PostHeap@0 this src))) (and (=> (= (ControlFlow 0 98) (- 0 101)) (HasDirectPerm PostMask@1 this src)) (=> (HasDirectPerm PostMask@1 this src) (and (=> (= (ControlFlow 0 98) (- 0 100)) (>= jx_19 0)) (=> (>= jx_19 0) (and (=> (= (ControlFlow 0 98) (- 0 99)) (< jx_19 (|Seq#Length| (MapType0Select PostHeap@0 this src)))) (=> (< jx_19 (|Seq#Length| (MapType0Select PostHeap@0 this src))) (=> (= (ControlFlow 0 98) 97) anon44_correct))))))))))))))))
(let ((anon115_Else_correct  (=> (> 0 jx_19) (and (=> (= (ControlFlow 0 110) 98) anon116_Then_correct) (=> (= (ControlFlow 0 110) 105) anon116_Else_correct)))))
(let ((anon115_Then_correct  (=> (>= jx_19 0) (and (=> (= (ControlFlow 0 108) (- 0 109)) (HasDirectPerm PostMask@1 this src)) (=> (HasDirectPerm PostMask@1 this src) (and (=> (= (ControlFlow 0 108) 98) anon116_Then_correct) (=> (= (ControlFlow 0 108) 105) anon116_Else_correct)))))))
(let ((anon114_Then_correct  (=> (< ix_19 (|Seq#Length| (MapType0Select PostHeap@0 this src))) (and (=> (= (ControlFlow 0 111) 108) anon115_Then_correct) (=> (= (ControlFlow 0 111) 110) anon115_Else_correct)))))
(let ((anon114_Else_correct  (=> (<= (|Seq#Length| (MapType0Select PostHeap@0 this src)) ix_19) (and (=> (= (ControlFlow 0 107) 98) anon116_Then_correct) (=> (= (ControlFlow 0 107) 105) anon116_Else_correct)))))
(let ((anon113_Then_correct  (=> (>= ix_19 0) (and (=> (= (ControlFlow 0 112) (- 0 113)) (HasDirectPerm PostMask@1 this src)) (=> (HasDirectPerm PostMask@1 this src) (and (=> (= (ControlFlow 0 112) 111) anon114_Then_correct) (=> (= (ControlFlow 0 112) 107) anon114_Else_correct)))))))
(let ((anon113_Else_correct  (=> (> 0 ix_19) (and (=> (= (ControlFlow 0 106) 98) anon116_Then_correct) (=> (= (ControlFlow 0 106) 105) anon116_Else_correct)))))
(let ((anon111_Then_correct  (=> (and (and (and (and (state PostHeap@0 ZeroMask) (<= 0 tid)) (and (state PostHeap@0 ZeroMask) (< tid tcount))) (and (and (state PostHeap@0 ZeroMask) (= tid lid)) (and (state PostHeap@0 ZeroMask) (= tcount gsize)))) (and (and (and (state PostHeap@0 ZeroMask) (= gid 0)) (and (state PostHeap@0 ZeroMask) (> wildcard@2 NoPerm))) (and (and (not (= this null)) (= PostMask@0 (MapType1Store ZeroMask this src (real_2_U (+ (U_2_real (MapType1Select ZeroMask this src)) wildcard@2))))) (and (state PostHeap@0 PostMask@0) (state PostHeap@0 PostMask@0))))) (and (=> (= (ControlFlow 0 167) (- 0 169)) (HasDirectPerm PostMask@0 this src)) (=> (HasDirectPerm PostMask@0 this src) (=> (= (|Seq#Length| (MapType0Select PostHeap@0 this src)) gsize) (=> (and (state PostHeap@0 PostMask@0) (> wildcard@3 NoPerm)) (=> (and (and (not (= this null)) (= PostMask@1 (MapType1Store PostMask@0 this dst (real_2_U (+ (U_2_real (MapType1Select PostMask@0 this dst)) wildcard@3))))) (and (state PostHeap@0 PostMask@1) (state PostHeap@0 PostMask@1))) (and (=> (= (ControlFlow 0 167) (- 0 168)) (HasDirectPerm PostMask@1 this dst)) (=> (HasDirectPerm PostMask@1 this dst) (=> (and (= (|Seq#Length| (MapType0Select PostHeap@0 this dst)) gsize) (state PostHeap@0 PostMask@1)) (=> (and (and (<= 4 gsize) (state PostHeap@0 PostMask@1)) (and (= (mod gsize 4) 0) (state PostHeap@0 PostMask@1))) (and (and (=> (= (ControlFlow 0 167) 166) anon112_Else_correct) (=> (= (ControlFlow 0 167) 112) anon113_Then_correct)) (=> (= (ControlFlow 0 167) 106) anon113_Else_correct))))))))))))))
(let ((anon82_correct true))
(let ((anon135_Else_correct  (=> (and (not (and (<= 0 i_13) (< i_13 half))) (= (ControlFlow 0 65) 62)) anon82_correct)))
(let ((anon135_Then_correct  (=> (and (<= 0 i_13) (< i_13 half)) (and (=> (= (ControlFlow 0 63) (- 0 64)) (>= (U_2_int (MapType0Select Heap@@9 (|Seq#Index| (MapType0Select Heap@@9 this dst) 0) Integer_value)) (U_2_int (MapType0Select Heap@@9 (|Seq#Index| (MapType0Select Heap@@9 this src) i_13) Integer_value)))) (=> (>= (U_2_int (MapType0Select Heap@@9 (|Seq#Index| (MapType0Select Heap@@9 this dst) 0) Integer_value)) (U_2_int (MapType0Select Heap@@9 (|Seq#Index| (MapType0Select Heap@@9 this src) i_13) Integer_value))) (=> (= (ControlFlow 0 63) 62) anon82_correct))))))
(let ((anon88_correct true))
(let ((anon138_Else_correct  (=> (and (not (and (<= half i_15) (< i_15 gsize))) (= (ControlFlow 0 58) 55)) anon88_correct)))
(let ((anon138_Then_correct  (=> (and (<= half i_15) (< i_15 gsize)) (and (=> (= (ControlFlow 0 56) (- 0 57)) (>= (U_2_int (MapType0Select Heap@@9 (|Seq#Index| (MapType0Select Heap@@9 this dst) 1) Integer_value)) (U_2_int (MapType0Select Heap@@9 (|Seq#Index| (MapType0Select Heap@@9 this src) i_15) Integer_value)))) (=> (>= (U_2_int (MapType0Select Heap@@9 (|Seq#Index| (MapType0Select Heap@@9 this dst) 1) Integer_value)) (U_2_int (MapType0Select Heap@@9 (|Seq#Index| (MapType0Select Heap@@9 this src) i_15) Integer_value))) (=> (= (ControlFlow 0 56) 55) anon88_correct))))))
(let ((anon90_correct true))
(let ((anon137_Else_correct  (=> (and (forall ((i_16_1_1 Int) ) (!  (=> (and (<= half i_16_1_1) (< i_16_1_1 gsize)) (>= (U_2_int (MapType0Select Heap@@9 (|Seq#Index| (MapType0Select Heap@@9 this dst) 1) Integer_value)) (U_2_int (MapType0Select Heap@@9 (|Seq#Index| (MapType0Select Heap@@9 this src) i_16_1_1) Integer_value))))
 :qid |stdinbpl.4281:22|
 :skolemid |248|
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 this src) i_16_1_1))
)) (= (ControlFlow 0 54) 52)) anon90_correct)))
(let ((anon136_Then_correct  (=> (= tid 0) (and (and (=> (= (ControlFlow 0 59) 54) anon137_Else_correct) (=> (= (ControlFlow 0 59) 56) anon138_Then_correct)) (=> (= (ControlFlow 0 59) 58) anon138_Else_correct)))))
(let ((anon136_Else_correct  (=> (and (not (= tid 0)) (= (ControlFlow 0 53) 52)) anon90_correct)))
(let ((anon134_Else_correct  (=> (forall ((i_14_1 Int) ) (!  (=> (and (<= 0 i_14_1) (< i_14_1 half)) (>= (U_2_int (MapType0Select Heap@@9 (|Seq#Index| (MapType0Select Heap@@9 this dst) 0) Integer_value)) (U_2_int (MapType0Select Heap@@9 (|Seq#Index| (MapType0Select Heap@@9 this src) i_14_1) Integer_value))))
 :qid |stdinbpl.4268:22|
 :skolemid |247|
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 this src) i_14_1))
)) (and (=> (= (ControlFlow 0 61) 59) anon136_Then_correct) (=> (= (ControlFlow 0 61) 53) anon136_Else_correct)))))
(let ((anon133_Then_correct  (=> (= tid 0) (and (and (=> (= (ControlFlow 0 66) 61) anon134_Else_correct) (=> (= (ControlFlow 0 66) 63) anon135_Then_correct)) (=> (= (ControlFlow 0 66) 65) anon135_Else_correct)))))
(let ((anon133_Else_correct  (=> (not (= tid 0)) (and (=> (= (ControlFlow 0 60) 59) anon136_Then_correct) (=> (= (ControlFlow 0 60) 53) anon136_Else_correct)))))
(let ((anon77_correct  (=> (and (= Mask@6 (MapType1Store Mask@5 (|Seq#Index| (MapType0Select Heap@@9 this dst) 1) Integer_value (real_2_U (- (U_2_real (MapType1Select Mask@5 (|Seq#Index| (MapType0Select Heap@@9 this dst) 1) Integer_value)) FullPerm)))) (= Mask@7 Mask@6)) (and (=> (= (ControlFlow 0 68) 66) anon133_Then_correct) (=> (= (ControlFlow 0 68) 60) anon133_Else_correct)))))
(let ((anon132_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 71) 68)) anon77_correct)))
(let ((anon132_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 69) (- 0 70)) (<= FullPerm (U_2_real (MapType1Select Mask@5 (|Seq#Index| (MapType0Select Heap@@9 this dst) 1) Integer_value)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@5 (|Seq#Index| (MapType0Select Heap@@9 this dst) 1) Integer_value))) (=> (= (ControlFlow 0 69) 68) anon77_correct))))))
(let ((anon131_Then_correct  (=> (= tid 0) (and (=> (= (ControlFlow 0 72) 69) anon132_Then_correct) (=> (= (ControlFlow 0 72) 71) anon132_Else_correct)))))
(let ((anon131_Else_correct  (=> (and (not (= tid 0)) (= Mask@7 Mask@5)) (and (=> (= (ControlFlow 0 67) 66) anon133_Then_correct) (=> (= (ControlFlow 0 67) 60) anon133_Else_correct)))))
(let ((anon73_correct  (=> (and (= Mask@4 (MapType1Store QPMask@2 (|Seq#Index| (MapType0Select Heap@@9 this dst) 0) Integer_value (real_2_U (- (U_2_real (MapType1Select QPMask@2 (|Seq#Index| (MapType0Select Heap@@9 this dst) 0) Integer_value)) FullPerm)))) (= Mask@5 Mask@4)) (and (=> (= (ControlFlow 0 74) 72) anon131_Then_correct) (=> (= (ControlFlow 0 74) 67) anon131_Else_correct)))))
(let ((anon130_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 77) 74)) anon73_correct)))
(let ((anon130_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 75) (- 0 76)) (<= FullPerm (U_2_real (MapType1Select QPMask@2 (|Seq#Index| (MapType0Select Heap@@9 this dst) 0) Integer_value)))) (=> (<= FullPerm (U_2_real (MapType1Select QPMask@2 (|Seq#Index| (MapType0Select Heap@@9 this dst) 0) Integer_value))) (=> (= (ControlFlow 0 75) 74) anon73_correct))))))
(let ((anon129_Then_correct  (=> (= tid 0) (and (=> (= (ControlFlow 0 78) 75) anon130_Then_correct) (=> (= (ControlFlow 0 78) 77) anon130_Else_correct)))))
(let ((anon129_Else_correct  (=> (and (not (= tid 0)) (= Mask@5 QPMask@2)) (and (=> (= (ControlFlow 0 73) 72) anon131_Then_correct) (=> (= (ControlFlow 0 73) 67) anon131_Else_correct)))))
(let ((anon127_Else_correct  (=> (forall ((ix_7_1 Int) (jx_7_1 Int) ) (!  (=> (and (>= ix_7_1 0) (and (< ix_7_1 (|Seq#Length| (MapType0Select Heap@@9 this src))) (and (>= jx_7_1 0) (and (< jx_7_1 (|Seq#Length| (MapType0Select Heap@@9 this src))) (not (= ix_7_1 jx_7_1)))))) (not (= (|Seq#Index| (MapType0Select Heap@@9 this src) ix_7_1) (|Seq#Index| (MapType0Select Heap@@9 this src) jx_7_1))))
 :qid |stdinbpl.4191:20|
 :skolemid |239|
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 this src) ix_7_1) (|Seq#Index| (MapType0Select Heap@@9 this src) jx_7_1))
)) (and (=> (= (ControlFlow 0 79) (- 0 84)) (forall ((i_12 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_12)) (dummyFunction (MapType0Select Heap@@9 (|Seq#Index| (MapType0Select Heap@@9 this src) i_12) Integer_value))) (>= (/ (to_real 1) (to_real gsize)) NoPerm))
 :qid |stdinbpl.4199:17|
 :skolemid |240|
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 this src) i_12))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 gsize) (int_2_U i_12)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_12)))
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 this src) i_12))
))) (=> (forall ((i_12@@0 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_12@@0)) (dummyFunction (MapType0Select Heap@@9 (|Seq#Index| (MapType0Select Heap@@9 this src) i_12@@0) Integer_value))) (>= (/ (to_real 1) (to_real gsize)) NoPerm))
 :qid |stdinbpl.4199:17|
 :skolemid |240|
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 this src) i_12@@0))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 gsize) (int_2_U i_12@@0)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_12@@0)))
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 this src) i_12@@0))
)) (and (=> (= (ControlFlow 0 79) (- 0 83)) (forall ((i_12@@1 Int) (i_12_1 Int) ) (!  (=> (and (and (and (and (not (= i_12@@1 i_12_1)) (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_12@@1))) (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_12_1))) (< NoPerm (/ (to_real 1) (to_real gsize)))) (< NoPerm (/ (to_real 1) (to_real gsize)))) (not (= (|Seq#Index| (MapType0Select Heap@@9 this src) i_12@@1) (|Seq#Index| (MapType0Select Heap@@9 this src) i_12_1))))
 :qid |stdinbpl.4206:17|
 :skolemid |241|
 :pattern ( (neverTriggered21 i_12@@1) (neverTriggered21 i_12_1))
))) (=> (forall ((i_12@@2 Int) (i_12_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_12@@2 i_12_1@@0)) (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_12@@2))) (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_12_1@@0))) (< NoPerm (/ (to_real 1) (to_real gsize)))) (< NoPerm (/ (to_real 1) (to_real gsize)))) (not (= (|Seq#Index| (MapType0Select Heap@@9 this src) i_12@@2) (|Seq#Index| (MapType0Select Heap@@9 this src) i_12_1@@0))))
 :qid |stdinbpl.4206:17|
 :skolemid |241|
 :pattern ( (neverTriggered21 i_12@@2) (neverTriggered21 i_12_1@@0))
)) (and (=> (= (ControlFlow 0 79) (- 0 82)) (forall ((i_12@@3 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_12@@3)) (>= (U_2_real (MapType1Select Mask@3 (|Seq#Index| (MapType0Select Heap@@9 this src) i_12@@3) Integer_value)) (/ (to_real 1) (to_real gsize))))
 :qid |stdinbpl.4213:17|
 :skolemid |242|
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 this src) i_12@@3))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 gsize) (int_2_U i_12@@3)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_12@@3)))
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 this src) i_12@@3))
))) (=> (forall ((i_12@@4 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_12@@4)) (>= (U_2_real (MapType1Select Mask@3 (|Seq#Index| (MapType0Select Heap@@9 this src) i_12@@4) Integer_value)) (/ (to_real 1) (to_real gsize))))
 :qid |stdinbpl.4213:17|
 :skolemid |242|
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 this src) i_12@@4))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 gsize) (int_2_U i_12@@4)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_12@@4)))
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 this src) i_12@@4))
)) (=> (and (and (forall ((i_12@@5 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_12@@5)) (< NoPerm (/ (to_real 1) (to_real gsize)))) (and (qpRange21 (|Seq#Index| (MapType0Select Heap@@9 this src) i_12@@5)) (= (invRecv21 (|Seq#Index| (MapType0Select Heap@@9 this src) i_12@@5)) i_12@@5)))
 :qid |stdinbpl.4219:22|
 :skolemid |243|
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 this src) i_12@@5))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 gsize) (int_2_U i_12@@5)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_12@@5)))
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 this src) i_12@@5))
)) (forall ((o_3@@2 T@U) ) (!  (=> (= (type o_3@@2) RefType) (=> (and (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U (invRecv21 o_3@@2))) (and (< NoPerm (/ (to_real 1) (to_real gsize))) (qpRange21 o_3@@2))) (= (|Seq#Index| (MapType0Select Heap@@9 this src) (invRecv21 o_3@@2)) o_3@@2)))
 :qid |stdinbpl.4223:22|
 :skolemid |244|
 :pattern ( (invRecv21 o_3@@2))
))) (and (forall ((o_3@@3 T@U) ) (!  (=> (= (type o_3@@3) RefType) (and (=> (and (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U (invRecv21 o_3@@3))) (and (< NoPerm (/ (to_real 1) (to_real gsize))) (qpRange21 o_3@@3))) (and (= (|Seq#Index| (MapType0Select Heap@@9 this src) (invRecv21 o_3@@3)) o_3@@3) (= (U_2_real (MapType1Select QPMask@2 o_3@@3 Integer_value)) (- (U_2_real (MapType1Select Mask@3 o_3@@3 Integer_value)) (/ (to_real 1) (to_real gsize)))))) (=> (not (and (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U (invRecv21 o_3@@3))) (and (< NoPerm (/ (to_real 1) (to_real gsize))) (qpRange21 o_3@@3)))) (= (U_2_real (MapType1Select QPMask@2 o_3@@3 Integer_value)) (U_2_real (MapType1Select Mask@3 o_3@@3 Integer_value))))))
 :qid |stdinbpl.4229:22|
 :skolemid |245|
 :pattern ( (MapType1Select QPMask@2 o_3@@3 Integer_value))
)) (forall ((o_3@@4 T@U) (f_5@@0 T@U) ) (! (let ((B@@12 (FieldTypeInv1 (type f_5@@0))))
(let ((A@@13 (FieldTypeInv0 (type f_5@@0))))
 (=> (and (and (= (type o_3@@4) RefType) (= (type f_5@@0) (FieldType A@@13 B@@12))) (not (= f_5@@0 Integer_value))) (= (U_2_real (MapType1Select Mask@3 o_3@@4 f_5@@0)) (U_2_real (MapType1Select QPMask@2 o_3@@4 f_5@@0))))))
 :qid |stdinbpl.4235:29|
 :skolemid |246|
 :pattern ( (MapType1Select QPMask@2 o_3@@4 f_5@@0))
)))) (and (=> (= (ControlFlow 0 79) (- 0 81)) (|Seq#Equal| (MapType0Select Heap@@9 this src) (MapType0Select Heap@@9 this src))) (=> (|Seq#Equal| (MapType0Select Heap@@9 this src) (MapType0Select Heap@@9 this src)) (and (=> (= (ControlFlow 0 79) (- 0 80)) (|Seq#Equal| (MapType0Select Heap@@9 this dst) (MapType0Select Heap@@9 this dst))) (=> (|Seq#Equal| (MapType0Select Heap@@9 this dst) (MapType0Select Heap@@9 this dst)) (and (=> (= (ControlFlow 0 79) 78) anon129_Then_correct) (=> (= (ControlFlow 0 79) 73) anon129_Else_correct))))))))))))))))
(let ((anon69_correct true))
(let ((anon128_Else_correct  (=> (and (not (and (>= ix_6 0) (and (< ix_6 (|Seq#Length| (MapType0Select Heap@@9 this src))) (and (>= jx_6 0) (and (< jx_6 (|Seq#Length| (MapType0Select Heap@@9 this src))) (not (= ix_6 jx_6))))))) (= (ControlFlow 0 51) 48)) anon69_correct)))
(let ((anon128_Then_correct  (=> (and (>= ix_6 0) (and (< ix_6 (|Seq#Length| (MapType0Select Heap@@9 this src))) (and (>= jx_6 0) (and (< jx_6 (|Seq#Length| (MapType0Select Heap@@9 this src))) (not (= ix_6 jx_6)))))) (and (=> (= (ControlFlow 0 49) (- 0 50)) (not (= (|Seq#Index| (MapType0Select Heap@@9 this src) ix_6) (|Seq#Index| (MapType0Select Heap@@9 this src) jx_6)))) (=> (not (= (|Seq#Index| (MapType0Select Heap@@9 this src) ix_6) (|Seq#Index| (MapType0Select Heap@@9 this src) jx_6))) (=> (= (ControlFlow 0 49) 48) anon69_correct))))))
(let ((anon111_Else_correct  (and (=> (= (ControlFlow 0 85) (- 0 96)) (<= 0 tid)) (=> (<= 0 tid) (and (=> (= (ControlFlow 0 85) (- 0 95)) (< tid tcount)) (=> (< tid tcount) (and (=> (= (ControlFlow 0 85) (- 0 94)) (= tid lid)) (=> (= tid lid) (and (=> (= (ControlFlow 0 85) (- 0 93)) (= tcount gsize)) (=> (= tcount gsize) (and (=> (= (ControlFlow 0 85) (- 0 92)) (= gid 0)) (=> (= gid 0) (and (=> (= (ControlFlow 0 85) (- 0 91)) (> (U_2_real (MapType1Select QPMask@1 this src)) NoPerm)) (=> (> (U_2_real (MapType1Select QPMask@1 this src)) NoPerm) (=> (> wildcard@4 NoPerm) (=> (and (< wildcard@4 (U_2_real (MapType1Select QPMask@1 this src))) (= Mask@2 (MapType1Store QPMask@1 this src (real_2_U (- (U_2_real (MapType1Select QPMask@1 this src)) wildcard@4))))) (and (=> (= (ControlFlow 0 85) (- 0 90)) (= (|Seq#Length| (MapType0Select Heap@@9 this src)) gsize)) (=> (= (|Seq#Length| (MapType0Select Heap@@9 this src)) gsize) (and (=> (= (ControlFlow 0 85) (- 0 89)) (> (U_2_real (MapType1Select Mask@2 this dst)) NoPerm)) (=> (> (U_2_real (MapType1Select Mask@2 this dst)) NoPerm) (=> (> wildcard@5 NoPerm) (=> (and (< wildcard@5 (U_2_real (MapType1Select Mask@2 this dst))) (= Mask@3 (MapType1Store Mask@2 this dst (real_2_U (- (U_2_real (MapType1Select Mask@2 this dst)) wildcard@5))))) (and (=> (= (ControlFlow 0 85) (- 0 88)) (= (|Seq#Length| (MapType0Select Heap@@9 this dst)) gsize)) (=> (= (|Seq#Length| (MapType0Select Heap@@9 this dst)) gsize) (and (=> (= (ControlFlow 0 85) (- 0 87)) (<= 4 gsize)) (=> (<= 4 gsize) (and (=> (= (ControlFlow 0 85) (- 0 86)) (= (mod gsize 4) 0)) (=> (= (mod gsize 4) 0) (and (and (=> (= (ControlFlow 0 85) 79) anon127_Else_correct) (=> (= (ControlFlow 0 85) 49) anon128_Then_correct)) (=> (= (ControlFlow 0 85) 51) anon128_Else_correct))))))))))))))))))))))))))))))
(let ((anon36_correct  (=> (state Heap@@9 QPMask@1) (and (=> (= (ControlFlow 0 170) 167) anon111_Then_correct) (=> (= (ControlFlow 0 170) 85) anon111_Else_correct)))))
(let ((anon109_Else_correct  (=> (and (forall ((i_5_1 Int) ) (!  (=> (and (<= half i_5_1) (< i_5_1 gsize)) (>= (U_2_int (MapType0Select Heap@@9 (|Seq#Index| (MapType0Select Heap@@9 this dst) 1) Integer_value)) (U_2_int (MapType0Select Heap@@9 (|Seq#Index| (MapType0Select Heap@@9 this src) i_5_1) Integer_value))))
 :qid |stdinbpl.3906:22|
 :skolemid |228|
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 this src) i_5_1))
)) (= (ControlFlow 0 172) 170)) anon36_correct)))
(let ((anon108_Then_correct  (=> (< 1 gsize) (and (and (=> (= (ControlFlow 0 183) 172) anon109_Else_correct) (=> (= (ControlFlow 0 183) 174) anon110_Then_correct)) (=> (= (ControlFlow 0 183) 182) anon110_Else_correct)))))
(let ((anon108_Else_correct  (=> (and (<= gsize 1) (= (ControlFlow 0 171) 170)) anon36_correct)))
(let ((anon30_correct  (=> (state Heap@@9 QPMask@1) (and (=> (= (ControlFlow 0 184) 183) anon108_Then_correct) (=> (= (ControlFlow 0 184) 171) anon108_Else_correct)))))
(let ((anon106_Else_correct  (=> (and (forall ((i_3 Int) ) (!  (=> (and (<= 0 i_3) (< i_3 half)) (>= (U_2_int (MapType0Select Heap@@9 (|Seq#Index| (MapType0Select Heap@@9 this dst) 0) Integer_value)) (U_2_int (MapType0Select Heap@@9 (|Seq#Index| (MapType0Select Heap@@9 this src) i_3) Integer_value))))
 :qid |stdinbpl.3878:22|
 :skolemid |227|
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 this src) i_3))
)) (= (ControlFlow 0 186) 184)) anon30_correct)))
(let ((anon105_Then_correct  (=> (< 0 gsize) (and (and (=> (= (ControlFlow 0 197) 186) anon106_Else_correct) (=> (= (ControlFlow 0 197) 188) anon107_Then_correct)) (=> (= (ControlFlow 0 197) 196) anon107_Else_correct)))))
(let ((anon105_Else_correct  (=> (and (<= gsize 0) (= (ControlFlow 0 185) 184)) anon30_correct)))
(let ((anon103_Else_correct  (and (=> (= (ControlFlow 0 198) (- 0 199)) (forall ((_x_tid_1 Int) (_x_tid_1_1 Int) ) (!  (=> (and (and (and (and (not (= _x_tid_1 _x_tid_1_1)) (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U _x_tid_1))) (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U _x_tid_1_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| (MapType0Select Heap@@9 this dst) _x_tid_1) (|Seq#Index| (MapType0Select Heap@@9 this dst) _x_tid_1_1))))
 :qid |stdinbpl.3821:15|
 :skolemid |221|
))) (=> (forall ((_x_tid_1@@0 Int) (_x_tid_1_1@@0 Int) ) (!  (=> (and (and (and (and (not (= _x_tid_1@@0 _x_tid_1_1@@0)) (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U _x_tid_1@@0))) (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U _x_tid_1_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| (MapType0Select Heap@@9 this dst) _x_tid_1@@0) (|Seq#Index| (MapType0Select Heap@@9 this dst) _x_tid_1_1@@0))))
 :qid |stdinbpl.3821:15|
 :skolemid |221|
)) (=> (forall ((_x_tid_1@@1 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U _x_tid_1@@1)) (< NoPerm FullPerm)) (and (qpRange19 (|Seq#Index| (MapType0Select Heap@@9 this dst) _x_tid_1@@1)) (= (invRecv19 (|Seq#Index| (MapType0Select Heap@@9 this dst) _x_tid_1@@1)) _x_tid_1@@1)))
 :qid |stdinbpl.3827:22|
 :skolemid |222|
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 this dst) _x_tid_1@@1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 gsize) (int_2_U _x_tid_1@@1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U _x_tid_1@@1)))
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 this dst) _x_tid_1@@1))
)) (=> (and (and (and (forall ((o_3@@5 T@U) ) (!  (=> (= (type o_3@@5) RefType) (=> (and (and (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U (invRecv19 o_3@@5))) (< NoPerm FullPerm)) (qpRange19 o_3@@5)) (= (|Seq#Index| (MapType0Select Heap@@9 this dst) (invRecv19 o_3@@5)) o_3@@5)))
 :qid |stdinbpl.3831:22|
 :skolemid |223|
 :pattern ( (invRecv19 o_3@@5))
)) (forall ((_x_tid_1@@2 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U _x_tid_1@@2)) (not (= (|Seq#Index| (MapType0Select Heap@@9 this dst) _x_tid_1@@2) null)))
 :qid |stdinbpl.3837:22|
 :skolemid |224|
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 this dst) _x_tid_1@@2))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 gsize) (int_2_U _x_tid_1@@2)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U _x_tid_1@@2)))
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 this dst) _x_tid_1@@2))
))) (and (forall ((o_3@@6 T@U) ) (!  (=> (= (type o_3@@6) RefType) (and (=> (and (and (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U (invRecv19 o_3@@6))) (< NoPerm FullPerm)) (qpRange19 o_3@@6)) (and (=> (< NoPerm FullPerm) (= (|Seq#Index| (MapType0Select Heap@@9 this dst) (invRecv19 o_3@@6)) o_3@@6)) (= (U_2_real (MapType1Select QPMask@1 o_3@@6 Integer_value)) (+ (U_2_real (MapType1Select QPMask@0 o_3@@6 Integer_value)) FullPerm)))) (=> (not (and (and (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U (invRecv19 o_3@@6))) (< NoPerm FullPerm)) (qpRange19 o_3@@6))) (= (U_2_real (MapType1Select QPMask@1 o_3@@6 Integer_value)) (U_2_real (MapType1Select QPMask@0 o_3@@6 Integer_value))))))
 :qid |stdinbpl.3843:22|
 :skolemid |225|
 :pattern ( (MapType1Select QPMask@1 o_3@@6 Integer_value))
)) (forall ((o_3@@7 T@U) (f_5@@1 T@U) ) (! (let ((B@@13 (FieldTypeInv1 (type f_5@@1))))
(let ((A@@14 (FieldTypeInv0 (type f_5@@1))))
 (=> (and (and (= (type o_3@@7) RefType) (= (type f_5@@1) (FieldType A@@14 B@@13))) (not (= f_5@@1 Integer_value))) (= (U_2_real (MapType1Select QPMask@0 o_3@@7 f_5@@1)) (U_2_real (MapType1Select QPMask@1 o_3@@7 f_5@@1))))))
 :qid |stdinbpl.3847:29|
 :skolemid |226|
 :pattern ( (MapType1Select QPMask@0 o_3@@7 f_5@@1))
 :pattern ( (MapType1Select QPMask@1 o_3@@7 f_5@@1))
)))) (and (and (state Heap@@9 QPMask@1) (state Heap@@9 QPMask@1)) (and (= (+ half half) gsize) (state Heap@@9 QPMask@1)))) (and (=> (= (ControlFlow 0 198) 197) anon105_Then_correct) (=> (= (ControlFlow 0 198) 185) anon105_Else_correct))))))))
(let ((anon23_correct true))
(let ((anon104_Else_correct  (=> (and (not (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U _x_tid))) (= (ControlFlow 0 47) 42)) anon23_correct)))
(let ((anon104_Then_correct  (=> (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U _x_tid)) (and (=> (= (ControlFlow 0 43) (- 0 46)) (HasDirectPerm QPMask@0 this dst)) (=> (HasDirectPerm QPMask@0 this dst) (and (=> (= (ControlFlow 0 43) (- 0 45)) (>= _x_tid 0)) (=> (>= _x_tid 0) (and (=> (= (ControlFlow 0 43) (- 0 44)) (< _x_tid (|Seq#Length| (MapType0Select Heap@@9 this dst)))) (=> (< _x_tid (|Seq#Length| (MapType0Select Heap@@9 this dst))) (=> (= (ControlFlow 0 43) 42) anon23_correct))))))))))
(let ((anon98_Else_correct  (=> (and (forall ((ix_3 Int) (jx_3 Int) ) (!  (=> (and (>= ix_3 0) (and (< ix_3 (|Seq#Length| (MapType0Select Heap@@9 this dst))) (and (>= jx_3 0) (and (< jx_3 (|Seq#Length| (MapType0Select Heap@@9 this dst))) (not (= ix_3 jx_3)))))) (not (= (|Seq#Index| (MapType0Select Heap@@9 this dst) ix_3) (|Seq#Index| (MapType0Select Heap@@9 this dst) jx_3))))
 :qid |stdinbpl.3801:20|
 :skolemid |220|
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 this dst) ix_3) (|Seq#Index| (MapType0Select Heap@@9 this dst) jx_3))
)) (state Heap@@9 QPMask@0)) (and (and (=> (= (ControlFlow 0 200) 198) anon103_Else_correct) (=> (= (ControlFlow 0 200) 43) anon104_Then_correct)) (=> (= (ControlFlow 0 200) 47) anon104_Else_correct)))))
(let ((anon19_correct true))
(let ((anon102_Else_correct  (=> (and (not (and (>= ix_18 0) (and (< ix_18 (|Seq#Length| (MapType0Select Heap@@9 this dst))) (and (>= jx_18 0) (and (< jx_18 (|Seq#Length| (MapType0Select Heap@@9 this dst))) (not (= ix_18 jx_18))))))) (= (ControlFlow 0 33) 25)) anon19_correct)))
(let ((anon102_Then_correct  (=> (and (>= ix_18 0) (and (< ix_18 (|Seq#Length| (MapType0Select Heap@@9 this dst))) (and (>= jx_18 0) (and (< jx_18 (|Seq#Length| (MapType0Select Heap@@9 this dst))) (not (= ix_18 jx_18)))))) (and (=> (= (ControlFlow 0 26) (- 0 32)) (HasDirectPerm QPMask@0 this dst)) (=> (HasDirectPerm QPMask@0 this dst) (and (=> (= (ControlFlow 0 26) (- 0 31)) (>= ix_18 0)) (=> (>= ix_18 0) (and (=> (= (ControlFlow 0 26) (- 0 30)) (< ix_18 (|Seq#Length| (MapType0Select Heap@@9 this dst)))) (=> (< ix_18 (|Seq#Length| (MapType0Select Heap@@9 this dst))) (and (=> (= (ControlFlow 0 26) (- 0 29)) (HasDirectPerm QPMask@0 this dst)) (=> (HasDirectPerm QPMask@0 this dst) (and (=> (= (ControlFlow 0 26) (- 0 28)) (>= jx_18 0)) (=> (>= jx_18 0) (and (=> (= (ControlFlow 0 26) (- 0 27)) (< jx_18 (|Seq#Length| (MapType0Select Heap@@9 this dst)))) (=> (< jx_18 (|Seq#Length| (MapType0Select Heap@@9 this dst))) (=> (= (ControlFlow 0 26) 25) anon19_correct))))))))))))))))
(let ((anon101_Else_correct  (=> (> 0 jx_18) (and (=> (= (ControlFlow 0 38) 26) anon102_Then_correct) (=> (= (ControlFlow 0 38) 33) anon102_Else_correct)))))
(let ((anon101_Then_correct  (=> (>= jx_18 0) (and (=> (= (ControlFlow 0 36) (- 0 37)) (HasDirectPerm QPMask@0 this dst)) (=> (HasDirectPerm QPMask@0 this dst) (and (=> (= (ControlFlow 0 36) 26) anon102_Then_correct) (=> (= (ControlFlow 0 36) 33) anon102_Else_correct)))))))
(let ((anon100_Then_correct  (=> (< ix_18 (|Seq#Length| (MapType0Select Heap@@9 this dst))) (and (=> (= (ControlFlow 0 39) 36) anon101_Then_correct) (=> (= (ControlFlow 0 39) 38) anon101_Else_correct)))))
(let ((anon100_Else_correct  (=> (<= (|Seq#Length| (MapType0Select Heap@@9 this dst)) ix_18) (and (=> (= (ControlFlow 0 35) 26) anon102_Then_correct) (=> (= (ControlFlow 0 35) 33) anon102_Else_correct)))))
(let ((anon99_Then_correct  (=> (>= ix_18 0) (and (=> (= (ControlFlow 0 40) (- 0 41)) (HasDirectPerm QPMask@0 this dst)) (=> (HasDirectPerm QPMask@0 this dst) (and (=> (= (ControlFlow 0 40) 39) anon100_Then_correct) (=> (= (ControlFlow 0 40) 35) anon100_Else_correct)))))))
(let ((anon99_Else_correct  (=> (> 0 ix_18) (and (=> (= (ControlFlow 0 34) 26) anon102_Then_correct) (=> (= (ControlFlow 0 34) 33) anon102_Else_correct)))))
(let ((anon96_Else_correct  (and (=> (= (ControlFlow 0 201) (- 0 203)) (forall ((i_1 Int) (i_1_1 Int) ) (!  (=> (and (and (and (and (not (= i_1 i_1_1)) (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_1))) (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_1_1))) (< NoPerm (/ (to_real 1) (to_real gsize)))) (< NoPerm (/ (to_real 1) (to_real gsize)))) (not (= (|Seq#Index| (MapType0Select Heap@@9 this src) i_1) (|Seq#Index| (MapType0Select Heap@@9 this src) i_1_1))))
 :qid |stdinbpl.3733:15|
 :skolemid |213|
))) (=> (forall ((i_1@@0 Int) (i_1_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_1@@0 i_1_1@@0)) (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_1@@0))) (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_1_1@@0))) (< NoPerm (/ (to_real 1) (to_real gsize)))) (< NoPerm (/ (to_real 1) (to_real gsize)))) (not (= (|Seq#Index| (MapType0Select Heap@@9 this src) i_1@@0) (|Seq#Index| (MapType0Select Heap@@9 this src) i_1_1@@0))))
 :qid |stdinbpl.3733:15|
 :skolemid |213|
)) (=> (and (forall ((i_1@@1 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_1@@1)) (< NoPerm (/ (to_real 1) (to_real gsize)))) (and (qpRange18 (|Seq#Index| (MapType0Select Heap@@9 this src) i_1@@1)) (= (invRecv18 (|Seq#Index| (MapType0Select Heap@@9 this src) i_1@@1)) i_1@@1)))
 :qid |stdinbpl.3739:22|
 :skolemid |214|
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 this src) i_1@@1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 gsize) (int_2_U i_1@@1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_1@@1)))
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 this src) i_1@@1))
)) (forall ((o_3@@8 T@U) ) (!  (=> (= (type o_3@@8) RefType) (=> (and (and (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U (invRecv18 o_3@@8))) (< NoPerm (/ (to_real 1) (to_real gsize)))) (qpRange18 o_3@@8)) (= (|Seq#Index| (MapType0Select Heap@@9 this src) (invRecv18 o_3@@8)) o_3@@8)))
 :qid |stdinbpl.3743:22|
 :skolemid |215|
 :pattern ( (invRecv18 o_3@@8))
))) (and (=> (= (ControlFlow 0 201) (- 0 202)) (forall ((i_1@@2 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_1@@2)) (>= (/ (to_real 1) (to_real gsize)) NoPerm))
 :qid |stdinbpl.3749:15|
 :skolemid |216|
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 this src) i_1@@2))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 gsize) (int_2_U i_1@@2)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_1@@2)))
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 this src) i_1@@2))
))) (=> (forall ((i_1@@3 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_1@@3)) (>= (/ (to_real 1) (to_real gsize)) NoPerm))
 :qid |stdinbpl.3749:15|
 :skolemid |216|
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 this src) i_1@@3))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 gsize) (int_2_U i_1@@3)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_1@@3)))
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 this src) i_1@@3))
)) (=> (forall ((i_1@@4 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_1@@4)) (> (/ (to_real 1) (to_real gsize)) NoPerm)) (not (= (|Seq#Index| (MapType0Select Heap@@9 this src) i_1@@4) null)))
 :qid |stdinbpl.3755:22|
 :skolemid |217|
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 this src) i_1@@4))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 gsize) (int_2_U i_1@@4)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_1@@4)))
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 this src) i_1@@4))
)) (=> (and (and (forall ((o_3@@9 T@U) ) (!  (=> (= (type o_3@@9) RefType) (and (=> (and (and (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U (invRecv18 o_3@@9))) (< NoPerm (/ (to_real 1) (to_real gsize)))) (qpRange18 o_3@@9)) (and (=> (< NoPerm (/ (to_real 1) (to_real gsize))) (= (|Seq#Index| (MapType0Select Heap@@9 this src) (invRecv18 o_3@@9)) o_3@@9)) (= (U_2_real (MapType1Select QPMask@0 o_3@@9 Integer_value)) (+ (U_2_real (MapType1Select Mask@1 o_3@@9 Integer_value)) (/ (to_real 1) (to_real gsize)))))) (=> (not (and (and (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U (invRecv18 o_3@@9))) (< NoPerm (/ (to_real 1) (to_real gsize)))) (qpRange18 o_3@@9))) (= (U_2_real (MapType1Select QPMask@0 o_3@@9 Integer_value)) (U_2_real (MapType1Select Mask@1 o_3@@9 Integer_value))))))
 :qid |stdinbpl.3761:22|
 :skolemid |218|
 :pattern ( (MapType1Select QPMask@0 o_3@@9 Integer_value))
)) (forall ((o_3@@10 T@U) (f_5@@2 T@U) ) (! (let ((B@@14 (FieldTypeInv1 (type f_5@@2))))
(let ((A@@15 (FieldTypeInv0 (type f_5@@2))))
 (=> (and (and (= (type o_3@@10) RefType) (= (type f_5@@2) (FieldType A@@15 B@@14))) (not (= f_5@@2 Integer_value))) (= (U_2_real (MapType1Select Mask@1 o_3@@10 f_5@@2)) (U_2_real (MapType1Select QPMask@0 o_3@@10 f_5@@2))))))
 :qid |stdinbpl.3765:29|
 :skolemid |219|
 :pattern ( (MapType1Select Mask@1 o_3@@10 f_5@@2))
 :pattern ( (MapType1Select QPMask@0 o_3@@10 f_5@@2))
))) (and (state Heap@@9 QPMask@0) (state Heap@@9 QPMask@0))) (and (and (=> (= (ControlFlow 0 201) 200) anon98_Else_correct) (=> (= (ControlFlow 0 201) 40) anon99_Then_correct)) (=> (= (ControlFlow 0 201) 34) anon99_Else_correct)))))))))))
(let ((anon11_correct true))
(let ((anon97_Else_correct  (=> (and (not (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_39))) (= (ControlFlow 0 24) 18)) anon11_correct)))
(let ((anon97_Then_correct  (=> (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_39)) (and (=> (= (ControlFlow 0 19) (- 0 23)) (HasDirectPerm Mask@1 this src)) (=> (HasDirectPerm Mask@1 this src) (and (=> (= (ControlFlow 0 19) (- 0 22)) (>= i_39 0)) (=> (>= i_39 0) (and (=> (= (ControlFlow 0 19) (- 0 21)) (< i_39 (|Seq#Length| (MapType0Select Heap@@9 this src)))) (=> (< i_39 (|Seq#Length| (MapType0Select Heap@@9 this src))) (and (=> (= (ControlFlow 0 19) (- 0 20)) (not (= gsize 0))) (=> (not (= gsize 0)) (=> (= (ControlFlow 0 19) 18) anon11_correct))))))))))))
(let ((anon91_Else_correct  (=> (and (forall ((ix_1 Int) (jx_1 Int) ) (!  (=> (and (>= ix_1 0) (and (< ix_1 (|Seq#Length| (MapType0Select Heap@@9 this src))) (and (>= jx_1 0) (and (< jx_1 (|Seq#Length| (MapType0Select Heap@@9 this src))) (not (= ix_1 jx_1)))))) (not (= (|Seq#Index| (MapType0Select Heap@@9 this src) ix_1) (|Seq#Index| (MapType0Select Heap@@9 this src) jx_1))))
 :qid |stdinbpl.3711:20|
 :skolemid |212|
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 this src) ix_1) (|Seq#Index| (MapType0Select Heap@@9 this src) jx_1))
)) (state Heap@@9 Mask@1)) (and (and (=> (= (ControlFlow 0 204) 201) anon96_Else_correct) (=> (= (ControlFlow 0 204) 19) anon97_Then_correct)) (=> (= (ControlFlow 0 204) 24) anon97_Else_correct)))))
(let ((anon7_correct true))
(let ((anon95_Else_correct  (=> (and (not (and (>= ix_17 0) (and (< ix_17 (|Seq#Length| (MapType0Select Heap@@9 this src))) (and (>= jx_17 0) (and (< jx_17 (|Seq#Length| (MapType0Select Heap@@9 this src))) (not (= ix_17 jx_17))))))) (= (ControlFlow 0 9) 1)) anon7_correct)))
(let ((anon95_Then_correct  (=> (and (>= ix_17 0) (and (< ix_17 (|Seq#Length| (MapType0Select Heap@@9 this src))) (and (>= jx_17 0) (and (< jx_17 (|Seq#Length| (MapType0Select Heap@@9 this src))) (not (= ix_17 jx_17)))))) (and (=> (= (ControlFlow 0 2) (- 0 8)) (HasDirectPerm Mask@1 this src)) (=> (HasDirectPerm Mask@1 this src) (and (=> (= (ControlFlow 0 2) (- 0 7)) (>= ix_17 0)) (=> (>= ix_17 0) (and (=> (= (ControlFlow 0 2) (- 0 6)) (< ix_17 (|Seq#Length| (MapType0Select Heap@@9 this src)))) (=> (< ix_17 (|Seq#Length| (MapType0Select Heap@@9 this src))) (and (=> (= (ControlFlow 0 2) (- 0 5)) (HasDirectPerm Mask@1 this src)) (=> (HasDirectPerm Mask@1 this src) (and (=> (= (ControlFlow 0 2) (- 0 4)) (>= jx_17 0)) (=> (>= jx_17 0) (and (=> (= (ControlFlow 0 2) (- 0 3)) (< jx_17 (|Seq#Length| (MapType0Select Heap@@9 this src)))) (=> (< jx_17 (|Seq#Length| (MapType0Select Heap@@9 this src))) (=> (= (ControlFlow 0 2) 1) anon7_correct))))))))))))))))
(let ((anon94_Else_correct  (=> (> 0 jx_17) (and (=> (= (ControlFlow 0 14) 2) anon95_Then_correct) (=> (= (ControlFlow 0 14) 9) anon95_Else_correct)))))
(let ((anon94_Then_correct  (=> (>= jx_17 0) (and (=> (= (ControlFlow 0 12) (- 0 13)) (HasDirectPerm Mask@1 this src)) (=> (HasDirectPerm Mask@1 this src) (and (=> (= (ControlFlow 0 12) 2) anon95_Then_correct) (=> (= (ControlFlow 0 12) 9) anon95_Else_correct)))))))
(let ((anon93_Then_correct  (=> (< ix_17 (|Seq#Length| (MapType0Select Heap@@9 this src))) (and (=> (= (ControlFlow 0 15) 12) anon94_Then_correct) (=> (= (ControlFlow 0 15) 14) anon94_Else_correct)))))
(let ((anon93_Else_correct  (=> (<= (|Seq#Length| (MapType0Select Heap@@9 this src)) ix_17) (and (=> (= (ControlFlow 0 11) 2) anon95_Then_correct) (=> (= (ControlFlow 0 11) 9) anon95_Else_correct)))))
(let ((anon92_Then_correct  (=> (>= ix_17 0) (and (=> (= (ControlFlow 0 16) (- 0 17)) (HasDirectPerm Mask@1 this src)) (=> (HasDirectPerm Mask@1 this src) (and (=> (= (ControlFlow 0 16) 15) anon93_Then_correct) (=> (= (ControlFlow 0 16) 11) anon93_Else_correct)))))))
(let ((anon92_Else_correct  (=> (> 0 ix_17) (and (=> (= (ControlFlow 0 10) 2) anon95_Then_correct) (=> (= (ControlFlow 0 10) 9) anon95_Else_correct)))))
(let ((anon0_correct  (=> (state Heap@@9 ZeroMask) (=> (and (and (and (and (U_2_bool (MapType0Select Heap@@9 this $allocated)) (<= 0 tid)) (and (state Heap@@9 ZeroMask) (< tid tcount))) (and (and (state Heap@@9 ZeroMask) (= tid lid)) (and (state Heap@@9 ZeroMask) (= tcount gsize)))) (and (and (and (state Heap@@9 ZeroMask) (= gid 0)) (and (state Heap@@9 ZeroMask) (> wildcard@0 NoPerm))) (and (and (not (= this null)) (= Mask@0 (MapType1Store ZeroMask this src (real_2_U (+ (U_2_real (MapType1Select ZeroMask this src)) wildcard@0))))) (and (state Heap@@9 Mask@0) (state Heap@@9 Mask@0))))) (and (=> (= (ControlFlow 0 205) (- 0 207)) (HasDirectPerm Mask@0 this src)) (=> (HasDirectPerm Mask@0 this src) (=> (= (|Seq#Length| (MapType0Select Heap@@9 this src)) gsize) (=> (and (state Heap@@9 Mask@0) (> wildcard@1 NoPerm)) (=> (and (and (not (= this null)) (= Mask@1 (MapType1Store Mask@0 this dst (real_2_U (+ (U_2_real (MapType1Select Mask@0 this dst)) wildcard@1))))) (and (state Heap@@9 Mask@1) (state Heap@@9 Mask@1))) (and (=> (= (ControlFlow 0 205) (- 0 206)) (HasDirectPerm Mask@1 this dst)) (=> (HasDirectPerm Mask@1 this dst) (=> (and (= (|Seq#Length| (MapType0Select Heap@@9 this dst)) gsize) (state Heap@@9 Mask@1)) (=> (and (and (<= 4 gsize) (state Heap@@9 Mask@1)) (and (= (mod gsize 4) 0) (state Heap@@9 Mask@1))) (and (and (=> (= (ControlFlow 0 205) 204) anon91_Else_correct) (=> (= (ControlFlow 0 205) 16) anon92_Then_correct)) (=> (= (ControlFlow 0 205) 10) anon92_Else_correct)))))))))))))))
(let ((PreconditionGeneratedEntry_correct  (=> (and (and (> wildcard NoPerm) true) (= (ControlFlow 0 208) 205)) anon0_correct)))
PreconditionGeneratedEntry_correct))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
))
(check-sat)
(pop 1)
; Valid
(get-info :rlimit)
