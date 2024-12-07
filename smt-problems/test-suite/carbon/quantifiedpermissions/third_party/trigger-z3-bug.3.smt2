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
(declare-fun i_5 () Int)
(declare-fun tcount () Int)
(declare-fun PostMask@3 () T@U)
(declare-fun this () T@U)
(declare-fun PostHeap@0 () T@U)
(declare-fun tid () Int)
(declare-fun QPMask@6 () T@U)
(declare-fun PostMask@2 () T@U)
(declare-fun gsize () Int)
(declare-fun qpRange2 (T@U) Bool)
(declare-fun invRecv2 (T@U) Int)
(declare-fun PostMask@1 () T@U)
(declare-fun Mask@2 () T@U)
(declare-fun Heap@@9 () T@U)
(declare-fun i_2 () Int)
(declare-fun ix_2 () Int)
(declare-fun jx_2 () Int)
(declare-fun lid () Int)
(declare-fun gid () Int)
(declare-fun wildcard@2 () Real)
(declare-fun PostMask@0 () T@U)
(declare-fun wildcard@3 () Real)
(declare-fun i_11 () Int)
(declare-fun k@0 () Int)
(declare-fun Mask@50 () T@U)
(declare-fun ExhaleHeap@0 () T@U)
(declare-fun half@0 () Int)
(declare-fun Mask@49 () T@U)
(declare-fun Mask@47 () T@U)
(declare-fun Mask@48 () T@U)
(declare-fun Mask@45 () T@U)
(declare-fun Mask@46 () T@U)
(declare-fun QPMask@5 () T@U)
(declare-fun Mask@44 () T@U)
(declare-fun qpRange5 (T@U) Bool)
(declare-fun invRecv5 (T@U) Int)
(declare-fun Mask@13 () T@U)
(declare-fun i_8 () Int)
(declare-fun ix_4 () Int)
(declare-fun jx_4 () Int)
(declare-fun Mask@11 () T@U)
(declare-fun wildcard@6 () Real)
(declare-fun Mask@12 () T@U)
(declare-fun wildcard@7 () Real)
(declare-fun i_19 () Int)
(declare-fun k@1 () Int)
(declare-fun Heap@3 () T@U)
(declare-fun Mask@43 () T@U)
(declare-fun Mask@42 () T@U)
(declare-fun Mask@41 () T@U)
(declare-fun Mask@40 () T@U)
(declare-fun Mask@39 () T@U)
(declare-fun Mask@38 () T@U)
(declare-fun Mask@37 () T@U)
(declare-fun QPMask@4 () T@U)
(declare-fun dummyFunction (T@U) Bool)
(declare-fun neverTriggered7 (Int) Bool)
(declare-fun Mask@36 () T@U)
(declare-fun qpRange7 (T@U) Bool)
(declare-fun invRecv7 (T@U) Int)
(declare-fun ix_11 () Int)
(declare-fun jx_11 () Int)
(declare-fun Mask@34 () T@U)
(declare-fun wildcard@14 () Real)
(declare-fun Mask@35 () T@U)
(declare-fun wildcard@15 () Real)
(declare-fun offset@0 () Int)
(declare-fun Heap@2 () T@U)
(declare-fun Mask@33 () T@U)
(declare-fun Mask@31 () T@U)
(declare-fun Mask@32 () T@U)
(declare-fun Mask@29 () T@U)
(declare-fun Mask@30 () T@U)
(declare-fun QPMask@2 () T@U)
(declare-fun Mask@28 () T@U)
(declare-fun wildcard@8 () Real)
(declare-fun Mask@14 () T@U)
(declare-fun wildcard@9 () Real)
(declare-fun Mask@15 () T@U)
(declare-fun qpRange6 (T@U) Bool)
(declare-fun invRecv6 (T@U) Int)
(declare-fun i_10 () Int)
(declare-fun Heap@0 () T@U)
(declare-fun ix_6 () Int)
(declare-fun jx_6 () Int)
(declare-fun Mask@24 () T@U)
(declare-fun Mask@23 () T@U)
(declare-fun Mask@25 () T@U)
(declare-fun Heap@1 () T@U)
(declare-fun Mask@21 () T@U)
(declare-fun Mask@22 () T@U)
(declare-fun Mask@19 () T@U)
(declare-fun Mask@20 () T@U)
(declare-fun QPMask@3 () T@U)
(declare-fun Mask@18 () T@U)
(declare-fun wildcard@10 () Real)
(declare-fun Mask@16 () T@U)
(declare-fun wildcard@11 () Real)
(declare-fun Mask@17 () T@U)
(declare-fun qpRange8 (T@U) Bool)
(declare-fun invRecv8 (T@U) Int)
(declare-fun Mask@10 () T@U)
(declare-fun Mask@9 () T@U)
(declare-fun Mask@8 () T@U)
(declare-fun Mask@7 () T@U)
(declare-fun Mask@6 () T@U)
(declare-fun Mask@5 () T@U)
(declare-fun QPMask@1 () T@U)
(declare-fun neverTriggered4 (Int) Bool)
(declare-fun Mask@4 () T@U)
(declare-fun qpRange4 (T@U) Bool)
(declare-fun invRecv4 (T@U) Int)
(declare-fun wildcard@4 () Real)
(declare-fun Mask@3 () T@U)
(declare-fun wildcard@5 () Real)
(declare-fun qpRange1 (T@U) Bool)
(declare-fun invRecv1 (T@U) Int)
(declare-fun QPMask@0 () T@U)
(declare-fun Mask@1 () T@U)
(declare-fun i@@6 () Int)
(declare-fun ix () Int)
(declare-fun jx () Int)
(declare-fun wildcard@0 () Real)
(declare-fun Mask@0 () T@U)
(declare-fun wildcard@1 () Real)
(declare-fun wildcard () Real)
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (= (type Heap@@9) (MapType0Type RefType)) (= (type this) RefType)) (= (type Mask@1) (MapType1Type RefType realType))) (= (type Mask@25) (MapType1Type RefType realType))) (= (type Mask@2) (MapType1Type RefType realType))) (= (type Heap@1) (MapType0Type RefType))) (= (type Heap@0) (MapType0Type RefType))) (= (type ExhaleHeap@0) (MapType0Type RefType))) (= (type Mask@24) (MapType1Type RefType realType))) (= (type Mask@23) (MapType1Type RefType realType))) (= (type Mask@22) (MapType1Type RefType realType))) (= (type Mask@21) (MapType1Type RefType realType))) (= (type QPMask@3) (MapType1Type RefType realType))) (= (type Mask@20) (MapType1Type RefType realType))) (= (type Mask@19) (MapType1Type RefType realType))) (= (type Mask@18) (MapType1Type RefType realType))) (= (type Mask@11) (MapType1Type RefType realType))) (= (type Mask@16) (MapType1Type RefType realType))) (= (type Mask@17) (MapType1Type RefType realType))) (= (type Heap@3) (MapType0Type RefType))) (= (type Mask@43) (MapType1Type RefType realType))) (= (type Mask@42) (MapType1Type RefType realType))) (= (type Mask@40) (MapType1Type RefType realType))) (= (type Mask@41) (MapType1Type RefType realType))) (= (type QPMask@4) (MapType1Type RefType realType))) (= (type Mask@38) (MapType1Type RefType realType))) (= (type Mask@39) (MapType1Type RefType realType))) (= (type Mask@37) (MapType1Type RefType realType))) (= (type Mask@36) (MapType1Type RefType realType))) (= (type Mask@34) (MapType1Type RefType realType))) (= (type Mask@35) (MapType1Type RefType realType))) (= (type Heap@2) (MapType0Type RefType))) (= (type Mask@33) (MapType1Type RefType realType))) (= (type Mask@32) (MapType1Type RefType realType))) (= (type Mask@31) (MapType1Type RefType realType))) (= (type QPMask@2) (MapType1Type RefType realType))) (= (type Mask@30) (MapType1Type RefType realType))) (= (type Mask@29) (MapType1Type RefType realType))) (= (type Mask@28) (MapType1Type RefType realType))) (= (type Mask@14) (MapType1Type RefType realType))) (= (type Mask@15) (MapType1Type RefType realType))) (= (type Mask@13) (MapType1Type RefType realType))) (= (type Mask@50) (MapType1Type RefType realType))) (= (type Mask@49) (MapType1Type RefType realType))) (= (type Mask@47) (MapType1Type RefType realType))) (= (type Mask@48) (MapType1Type RefType realType))) (= (type QPMask@5) (MapType1Type RefType realType))) (= (type Mask@45) (MapType1Type RefType realType))) (= (type Mask@46) (MapType1Type RefType realType))) (= (type Mask@44) (MapType1Type RefType realType))) (= (type Mask@12) (MapType1Type RefType realType))) (= (type Mask@10) (MapType1Type RefType realType))) (= (type Mask@8) (MapType1Type RefType realType))) (= (type Mask@9) (MapType1Type RefType realType))) (= (type QPMask@1) (MapType1Type RefType realType))) (= (type Mask@6) (MapType1Type RefType realType))) (= (type Mask@7) (MapType1Type RefType realType))) (= (type Mask@5) (MapType1Type RefType realType))) (= (type Mask@4) (MapType1Type RefType realType))) (= (type Mask@3) (MapType1Type RefType realType))) (= (type PostHeap@0) (MapType0Type RefType))) (= (type PostMask@1) (MapType1Type RefType realType))) (= (type PostMask@3) (MapType1Type RefType realType))) (= (type QPMask@6) (MapType1Type RefType realType))) (= (type PostMask@2) (MapType1Type RefType realType))) (= (type PostMask@0) (MapType1Type RefType realType))) (= (type QPMask@0) (MapType1Type RefType realType))) (= (type Mask@0) (MapType1Type RefType realType))))
(set-info :boogie-vc-id main_main)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 325) (let ((anon31_correct true))
(let ((anon222_Else_correct  (=> (and (not (and (<= 0 i_5) (< i_5 tcount))) (= (ControlFlow 0 297) 288)) anon31_correct)))
(let ((anon222_Then_correct  (=> (and (<= 0 i_5) (< i_5 tcount)) (and (=> (= (ControlFlow 0 289) (- 0 296)) (HasDirectPerm PostMask@3 this dst)) (=> (HasDirectPerm PostMask@3 this dst) (and (=> (= (ControlFlow 0 289) (- 0 295)) (< 0 (|Seq#Length| (MapType0Select PostHeap@0 this dst)))) (=> (< 0 (|Seq#Length| (MapType0Select PostHeap@0 this dst))) (and (=> (= (ControlFlow 0 289) (- 0 294)) (HasDirectPerm PostMask@3 (|Seq#Index| (MapType0Select PostHeap@0 this dst) 0) Integer_value)) (=> (HasDirectPerm PostMask@3 (|Seq#Index| (MapType0Select PostHeap@0 this dst) 0) Integer_value) (and (=> (= (ControlFlow 0 289) (- 0 293)) (HasDirectPerm PostMask@3 this src)) (=> (HasDirectPerm PostMask@3 this src) (and (=> (= (ControlFlow 0 289) (- 0 292)) (>= i_5 0)) (=> (>= i_5 0) (and (=> (= (ControlFlow 0 289) (- 0 291)) (< i_5 (|Seq#Length| (MapType0Select PostHeap@0 this src)))) (=> (< i_5 (|Seq#Length| (MapType0Select PostHeap@0 this src))) (and (=> (= (ControlFlow 0 289) (- 0 290)) (HasDirectPerm PostMask@3 (|Seq#Index| (MapType0Select PostHeap@0 this src) i_5) Integer_value)) (=> (HasDirectPerm PostMask@3 (|Seq#Index| (MapType0Select PostHeap@0 this src) i_5) Integer_value) (=> (= (ControlFlow 0 289) 288) anon31_correct))))))))))))))))))
(let ((anon33_correct true))
(let ((anon221_Else_correct  (=> (and (forall ((i_5_1 Int) ) (!  (=> (and (<= 0 i_5_1) (< i_5_1 tcount)) (>= (U_2_int (MapType0Select PostHeap@0 (|Seq#Index| (MapType0Select PostHeap@0 this dst) 0) Integer_value)) (U_2_int (MapType0Select PostHeap@0 (|Seq#Index| (MapType0Select PostHeap@0 this src) i_5_1) Integer_value))))
 :qid |stdinbpl.1020:22|
 :skolemid |74|
 :pattern ( (|Seq#Index| (MapType0Select PostHeap@0 this src) i_5_1))
)) (= (ControlFlow 0 287) 285)) anon33_correct)))
(let ((anon220_Then_correct  (=> (= tid 0) (and (and (=> (= (ControlFlow 0 298) 287) anon221_Else_correct) (=> (= (ControlFlow 0 298) 289) anon222_Then_correct)) (=> (= (ControlFlow 0 298) 297) anon222_Else_correct)))))
(let ((anon220_Else_correct  (=> (and (not (= tid 0)) (= (ControlFlow 0 286) 285)) anon33_correct)))
(let ((anon27_correct  (=> (state PostHeap@0 PostMask@3) (and (=> (= (ControlFlow 0 299) 298) anon220_Then_correct) (=> (= (ControlFlow 0 299) 286) anon220_Else_correct)))))
(let ((anon219_Else_correct  (=> (not (= tid 0)) (=> (and (= PostMask@3 QPMask@6) (= (ControlFlow 0 303) 299)) anon27_correct))))
(let ((anon219_Then_correct  (=> (= tid 0) (and (=> (= (ControlFlow 0 300) (- 0 302)) (HasDirectPerm QPMask@6 this dst)) (=> (HasDirectPerm QPMask@6 this dst) (and (=> (= (ControlFlow 0 300) (- 0 301)) (< 0 (|Seq#Length| (MapType0Select PostHeap@0 this dst)))) (=> (< 0 (|Seq#Length| (MapType0Select PostHeap@0 this dst))) (=> (not (= (|Seq#Index| (MapType0Select PostHeap@0 this dst) 0) null)) (=> (and (and (= PostMask@2 (MapType1Store QPMask@6 (|Seq#Index| (MapType0Select PostHeap@0 this dst) 0) Integer_value (real_2_U (+ (U_2_real (MapType1Select QPMask@6 (|Seq#Index| (MapType0Select PostHeap@0 this dst) 0) Integer_value)) FullPerm)))) (state PostHeap@0 PostMask@2)) (and (= PostMask@3 PostMask@2) (= (ControlFlow 0 300) 299))) anon27_correct)))))))))
(let ((anon217_Else_correct  (and (=> (= (ControlFlow 0 304) (- 0 310)) (forall ((i_3 Int) (i_3_1 Int) ) (!  (=> (and (and (and (and (not (= i_3 i_3_1)) (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_3))) (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_3_1))) (< NoPerm (/ (to_real 1) (to_real gsize)))) (< NoPerm (/ (to_real 1) (to_real gsize)))) (not (= (|Seq#Index| (MapType0Select PostHeap@0 this src) i_3) (|Seq#Index| (MapType0Select PostHeap@0 this src) i_3_1))))
 :qid |stdinbpl.930:15|
 :skolemid |67|
))) (=> (forall ((i_3@@0 Int) (i_3_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_3@@0 i_3_1@@0)) (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_3@@0))) (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_3_1@@0))) (< NoPerm (/ (to_real 1) (to_real gsize)))) (< NoPerm (/ (to_real 1) (to_real gsize)))) (not (= (|Seq#Index| (MapType0Select PostHeap@0 this src) i_3@@0) (|Seq#Index| (MapType0Select PostHeap@0 this src) i_3_1@@0))))
 :qid |stdinbpl.930:15|
 :skolemid |67|
)) (=> (and (forall ((i_3@@1 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_3@@1)) (< NoPerm (/ (to_real 1) (to_real gsize)))) (and (qpRange2 (|Seq#Index| (MapType0Select PostHeap@0 this src) i_3@@1)) (= (invRecv2 (|Seq#Index| (MapType0Select PostHeap@0 this src) i_3@@1)) i_3@@1)))
 :qid |stdinbpl.936:22|
 :skolemid |68|
 :pattern ( (|Seq#Index| (MapType0Select PostHeap@0 this src) i_3@@1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 gsize) (int_2_U i_3@@1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_3@@1)))
 :pattern ( (|Seq#Index| (MapType0Select PostHeap@0 this src) i_3@@1))
)) (forall ((o_3 T@U) ) (!  (=> (= (type o_3) RefType) (=> (and (and (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U (invRecv2 o_3))) (< NoPerm (/ (to_real 1) (to_real gsize)))) (qpRange2 o_3)) (= (|Seq#Index| (MapType0Select PostHeap@0 this src) (invRecv2 o_3)) o_3)))
 :qid |stdinbpl.940:22|
 :skolemid |69|
 :pattern ( (invRecv2 o_3))
))) (and (=> (= (ControlFlow 0 304) (- 0 309)) (forall ((i_3@@2 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_3@@2)) (>= (/ (to_real 1) (to_real gsize)) NoPerm))
 :qid |stdinbpl.946:15|
 :skolemid |70|
 :pattern ( (|Seq#Index| (MapType0Select PostHeap@0 this src) i_3@@2))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 gsize) (int_2_U i_3@@2)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_3@@2)))
 :pattern ( (|Seq#Index| (MapType0Select PostHeap@0 this src) i_3@@2))
))) (=> (forall ((i_3@@3 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_3@@3)) (>= (/ (to_real 1) (to_real gsize)) NoPerm))
 :qid |stdinbpl.946:15|
 :skolemid |70|
 :pattern ( (|Seq#Index| (MapType0Select PostHeap@0 this src) i_3@@3))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 gsize) (int_2_U i_3@@3)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_3@@3)))
 :pattern ( (|Seq#Index| (MapType0Select PostHeap@0 this src) i_3@@3))
)) (=> (forall ((i_3@@4 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_3@@4)) (> (/ (to_real 1) (to_real gsize)) NoPerm)) (not (= (|Seq#Index| (MapType0Select PostHeap@0 this src) i_3@@4) null)))
 :qid |stdinbpl.952:22|
 :skolemid |71|
 :pattern ( (|Seq#Index| (MapType0Select PostHeap@0 this src) i_3@@4))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 gsize) (int_2_U i_3@@4)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_3@@4)))
 :pattern ( (|Seq#Index| (MapType0Select PostHeap@0 this src) i_3@@4))
)) (=> (and (and (forall ((o_3@@0 T@U) ) (!  (=> (= (type o_3@@0) RefType) (and (=> (and (and (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U (invRecv2 o_3@@0))) (< NoPerm (/ (to_real 1) (to_real gsize)))) (qpRange2 o_3@@0)) (and (=> (< NoPerm (/ (to_real 1) (to_real gsize))) (= (|Seq#Index| (MapType0Select PostHeap@0 this src) (invRecv2 o_3@@0)) o_3@@0)) (= (U_2_real (MapType1Select QPMask@6 o_3@@0 Integer_value)) (+ (U_2_real (MapType1Select PostMask@1 o_3@@0 Integer_value)) (/ (to_real 1) (to_real gsize)))))) (=> (not (and (and (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U (invRecv2 o_3@@0))) (< NoPerm (/ (to_real 1) (to_real gsize)))) (qpRange2 o_3@@0))) (= (U_2_real (MapType1Select QPMask@6 o_3@@0 Integer_value)) (U_2_real (MapType1Select PostMask@1 o_3@@0 Integer_value))))))
 :qid |stdinbpl.958:22|
 :skolemid |72|
 :pattern ( (MapType1Select QPMask@6 o_3@@0 Integer_value))
)) (forall ((o_3@@1 T@U) (f_5 T@U) ) (! (let ((B@@11 (FieldTypeInv1 (type f_5))))
(let ((A@@12 (FieldTypeInv0 (type f_5))))
 (=> (and (and (= (type o_3@@1) RefType) (= (type f_5) (FieldType A@@12 B@@11))) (not (= f_5 Integer_value))) (= (U_2_real (MapType1Select PostMask@1 o_3@@1 f_5)) (U_2_real (MapType1Select QPMask@6 o_3@@1 f_5))))))
 :qid |stdinbpl.962:29|
 :skolemid |73|
 :pattern ( (MapType1Select PostMask@1 o_3@@1 f_5))
 :pattern ( (MapType1Select QPMask@6 o_3@@1 f_5))
))) (and (state PostHeap@0 QPMask@6) (state PostHeap@0 QPMask@6))) (and (=> (= (ControlFlow 0 304) (- 0 308)) (HasDirectPerm QPMask@6 this src)) (=> (HasDirectPerm QPMask@6 this src) (and (=> (= (ControlFlow 0 304) (- 0 307)) (HasDirectPerm Mask@2 this src)) (=> (HasDirectPerm Mask@2 this src) (=> (and (|Seq#Equal| (MapType0Select PostHeap@0 this src) (MapType0Select Heap@@9 this src)) (state PostHeap@0 QPMask@6)) (and (=> (= (ControlFlow 0 304) (- 0 306)) (HasDirectPerm QPMask@6 this dst)) (=> (HasDirectPerm QPMask@6 this dst) (and (=> (= (ControlFlow 0 304) (- 0 305)) (HasDirectPerm Mask@2 this dst)) (=> (HasDirectPerm Mask@2 this dst) (=> (and (|Seq#Equal| (MapType0Select PostHeap@0 this dst) (MapType0Select Heap@@9 this dst)) (state PostHeap@0 QPMask@6)) (and (=> (= (ControlFlow 0 304) 300) anon219_Then_correct) (=> (= (ControlFlow 0 304) 303) anon219_Else_correct)))))))))))))))))))))
(let ((anon24_correct true))
(let ((anon218_Else_correct  (=> (and (not (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_2))) (= (ControlFlow 0 284) 278)) anon24_correct)))
(let ((anon218_Then_correct  (=> (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_2)) (and (=> (= (ControlFlow 0 279) (- 0 283)) (HasDirectPerm PostMask@1 this src)) (=> (HasDirectPerm PostMask@1 this src) (and (=> (= (ControlFlow 0 279) (- 0 282)) (>= i_2 0)) (=> (>= i_2 0) (and (=> (= (ControlFlow 0 279) (- 0 281)) (< i_2 (|Seq#Length| (MapType0Select PostHeap@0 this src)))) (=> (< i_2 (|Seq#Length| (MapType0Select PostHeap@0 this src))) (and (=> (= (ControlFlow 0 279) (- 0 280)) (not (= gsize 0))) (=> (not (= gsize 0)) (=> (= (ControlFlow 0 279) 278) anon24_correct))))))))))))
(let ((anon212_Else_correct  (=> (and (forall ((ix_3 Int) (jx_3 Int) ) (!  (=> (and (>= ix_3 0) (and (< ix_3 (|Seq#Length| (MapType0Select PostHeap@0 this src))) (and (>= jx_3 0) (and (< jx_3 (|Seq#Length| (MapType0Select PostHeap@0 this src))) (not (= ix_3 jx_3)))))) (not (= (|Seq#Index| (MapType0Select PostHeap@0 this src) ix_3) (|Seq#Index| (MapType0Select PostHeap@0 this src) jx_3))))
 :qid |stdinbpl.908:20|
 :skolemid |66|
 :pattern ( (|Seq#Index| (MapType0Select PostHeap@0 this src) ix_3) (|Seq#Index| (MapType0Select PostHeap@0 this src) jx_3))
)) (state PostHeap@0 PostMask@1)) (and (and (=> (= (ControlFlow 0 311) 304) anon217_Else_correct) (=> (= (ControlFlow 0 311) 279) anon218_Then_correct)) (=> (= (ControlFlow 0 311) 284) anon218_Else_correct)))))
(let ((anon20_correct true))
(let ((anon216_Else_correct  (=> (and (not (and (>= ix_2 0) (and (< ix_2 (|Seq#Length| (MapType0Select PostHeap@0 this src))) (and (>= jx_2 0) (and (< jx_2 (|Seq#Length| (MapType0Select PostHeap@0 this src))) (not (= ix_2 jx_2))))))) (= (ControlFlow 0 269) 261)) anon20_correct)))
(let ((anon216_Then_correct  (=> (and (>= ix_2 0) (and (< ix_2 (|Seq#Length| (MapType0Select PostHeap@0 this src))) (and (>= jx_2 0) (and (< jx_2 (|Seq#Length| (MapType0Select PostHeap@0 this src))) (not (= ix_2 jx_2)))))) (and (=> (= (ControlFlow 0 262) (- 0 268)) (HasDirectPerm PostMask@1 this src)) (=> (HasDirectPerm PostMask@1 this src) (and (=> (= (ControlFlow 0 262) (- 0 267)) (>= ix_2 0)) (=> (>= ix_2 0) (and (=> (= (ControlFlow 0 262) (- 0 266)) (< ix_2 (|Seq#Length| (MapType0Select PostHeap@0 this src)))) (=> (< ix_2 (|Seq#Length| (MapType0Select PostHeap@0 this src))) (and (=> (= (ControlFlow 0 262) (- 0 265)) (HasDirectPerm PostMask@1 this src)) (=> (HasDirectPerm PostMask@1 this src) (and (=> (= (ControlFlow 0 262) (- 0 264)) (>= jx_2 0)) (=> (>= jx_2 0) (and (=> (= (ControlFlow 0 262) (- 0 263)) (< jx_2 (|Seq#Length| (MapType0Select PostHeap@0 this src)))) (=> (< jx_2 (|Seq#Length| (MapType0Select PostHeap@0 this src))) (=> (= (ControlFlow 0 262) 261) anon20_correct))))))))))))))))
(let ((anon215_Else_correct  (=> (> 0 jx_2) (and (=> (= (ControlFlow 0 274) 262) anon216_Then_correct) (=> (= (ControlFlow 0 274) 269) anon216_Else_correct)))))
(let ((anon215_Then_correct  (=> (>= jx_2 0) (and (=> (= (ControlFlow 0 272) (- 0 273)) (HasDirectPerm PostMask@1 this src)) (=> (HasDirectPerm PostMask@1 this src) (and (=> (= (ControlFlow 0 272) 262) anon216_Then_correct) (=> (= (ControlFlow 0 272) 269) anon216_Else_correct)))))))
(let ((anon214_Then_correct  (=> (< ix_2 (|Seq#Length| (MapType0Select PostHeap@0 this src))) (and (=> (= (ControlFlow 0 275) 272) anon215_Then_correct) (=> (= (ControlFlow 0 275) 274) anon215_Else_correct)))))
(let ((anon214_Else_correct  (=> (<= (|Seq#Length| (MapType0Select PostHeap@0 this src)) ix_2) (and (=> (= (ControlFlow 0 271) 262) anon216_Then_correct) (=> (= (ControlFlow 0 271) 269) anon216_Else_correct)))))
(let ((anon213_Then_correct  (=> (>= ix_2 0) (and (=> (= (ControlFlow 0 276) (- 0 277)) (HasDirectPerm PostMask@1 this src)) (=> (HasDirectPerm PostMask@1 this src) (and (=> (= (ControlFlow 0 276) 275) anon214_Then_correct) (=> (= (ControlFlow 0 276) 271) anon214_Else_correct)))))))
(let ((anon213_Else_correct  (=> (> 0 ix_2) (and (=> (= (ControlFlow 0 270) 262) anon216_Then_correct) (=> (= (ControlFlow 0 270) 269) anon216_Else_correct)))))
(let ((anon211_Then_correct  (=> (and (and (and (and (state PostHeap@0 ZeroMask) (<= 0 tid)) (and (state PostHeap@0 ZeroMask) (< tid tcount))) (and (and (state PostHeap@0 ZeroMask) (= tid lid)) (and (state PostHeap@0 ZeroMask) (= tcount gsize)))) (and (and (and (state PostHeap@0 ZeroMask) (= gid 0)) (and (state PostHeap@0 ZeroMask) (> wildcard@2 NoPerm))) (and (and (not (= this null)) (= PostMask@0 (MapType1Store ZeroMask this src (real_2_U (+ (U_2_real (MapType1Select ZeroMask this src)) wildcard@2))))) (and (state PostHeap@0 PostMask@0) (state PostHeap@0 PostMask@0))))) (and (=> (= (ControlFlow 0 312) (- 0 314)) (HasDirectPerm PostMask@0 this src)) (=> (HasDirectPerm PostMask@0 this src) (=> (= (|Seq#Length| (MapType0Select PostHeap@0 this src)) gsize) (=> (and (state PostHeap@0 PostMask@0) (> wildcard@3 NoPerm)) (=> (and (and (not (= this null)) (= PostMask@1 (MapType1Store PostMask@0 this dst (real_2_U (+ (U_2_real (MapType1Select PostMask@0 this dst)) wildcard@3))))) (and (state PostHeap@0 PostMask@1) (state PostHeap@0 PostMask@1))) (and (=> (= (ControlFlow 0 312) (- 0 313)) (HasDirectPerm PostMask@1 this dst)) (=> (HasDirectPerm PostMask@1 this dst) (=> (and (= (|Seq#Length| (MapType0Select PostHeap@0 this dst)) gsize) (state PostHeap@0 PostMask@1)) (=> (and (and (<= 4 gsize) (state PostHeap@0 PostMask@1)) (and (= (mod gsize 4) 0) (state PostHeap@0 PostMask@1))) (and (and (=> (= (ControlFlow 0 312) 311) anon212_Else_correct) (=> (= (ControlFlow 0 312) 276) anon213_Then_correct)) (=> (= (ControlFlow 0 312) 270) anon213_Else_correct))))))))))))))
(let ((anon81_correct true))
(let ((anon249_Else_correct  (=> (and (not (and (<= 0 i_11) (< i_11 k@0))) (= (ControlFlow 0 179) 169)) anon81_correct)))
(let ((anon249_Then_correct  (=> (and (<= 0 i_11) (< i_11 k@0)) (and (=> (= (ControlFlow 0 170) (- 0 178)) (HasDirectPerm Mask@50 this dst)) (=> (HasDirectPerm Mask@50 this dst) (and (=> (= (ControlFlow 0 170) (- 0 177)) (>= tid 0)) (=> (>= tid 0) (and (=> (= (ControlFlow 0 170) (- 0 176)) (< tid (|Seq#Length| (MapType0Select ExhaleHeap@0 this dst)))) (=> (< tid (|Seq#Length| (MapType0Select ExhaleHeap@0 this dst))) (and (=> (= (ControlFlow 0 170) (- 0 175)) (HasDirectPerm Mask@50 (|Seq#Index| (MapType0Select ExhaleHeap@0 this dst) tid) Integer_value)) (=> (HasDirectPerm Mask@50 (|Seq#Index| (MapType0Select ExhaleHeap@0 this dst) tid) Integer_value) (and (=> (= (ControlFlow 0 170) (- 0 174)) (HasDirectPerm Mask@50 this src)) (=> (HasDirectPerm Mask@50 this src) (and (=> (= (ControlFlow 0 170) (- 0 173)) (>= (+ (* tid half@0) i_11) 0)) (=> (>= (+ (* tid half@0) i_11) 0) (and (=> (= (ControlFlow 0 170) (- 0 172)) (< (+ (* tid half@0) i_11) (|Seq#Length| (MapType0Select ExhaleHeap@0 this src)))) (=> (< (+ (* tid half@0) i_11) (|Seq#Length| (MapType0Select ExhaleHeap@0 this src))) (and (=> (= (ControlFlow 0 170) (- 0 171)) (HasDirectPerm Mask@50 (|Seq#Index| (MapType0Select ExhaleHeap@0 this src) (+ (* tid half@0) i_11)) Integer_value)) (=> (HasDirectPerm Mask@50 (|Seq#Index| (MapType0Select ExhaleHeap@0 this src) (+ (* tid half@0) i_11)) Integer_value) (=> (= (ControlFlow 0 170) 169) anon81_correct))))))))))))))))))))
(let ((anon248_Else_correct true))
(let ((anon78_correct  (=> (and (and (state ExhaleHeap@0 Mask@49) (< 0 k@0)) (and (<= k@0 half@0) (state ExhaleHeap@0 Mask@49))) (and (=> (= (ControlFlow 0 180) (- 0 183)) (HasDirectPerm Mask@49 this dst)) (=> (HasDirectPerm Mask@49 this dst) (and (=> (= (ControlFlow 0 180) (- 0 182)) (>= tid 0)) (=> (>= tid 0) (and (=> (= (ControlFlow 0 180) (- 0 181)) (< tid (|Seq#Length| (MapType0Select ExhaleHeap@0 this dst)))) (=> (< tid (|Seq#Length| (MapType0Select ExhaleHeap@0 this dst))) (=> (and (and (not (= (|Seq#Index| (MapType0Select ExhaleHeap@0 this dst) tid) null)) (= Mask@50 (MapType1Store Mask@49 (|Seq#Index| (MapType0Select ExhaleHeap@0 this dst) tid) Integer_value (real_2_U (+ (U_2_real (MapType1Select Mask@49 (|Seq#Index| (MapType0Select ExhaleHeap@0 this dst) tid) Integer_value)) FullPerm))))) (and (state ExhaleHeap@0 Mask@50) (state ExhaleHeap@0 Mask@50))) (and (and (=> (= (ControlFlow 0 180) 168) anon248_Else_correct) (=> (= (ControlFlow 0 180) 170) anon249_Then_correct)) (=> (= (ControlFlow 0 180) 179) anon249_Else_correct))))))))))))
(let ((anon247_Else_correct  (=> (not (= 0 0)) (=> (and (= Mask@49 Mask@47) (= (ControlFlow 0 188) 180)) anon78_correct))))
(let ((anon247_Then_correct  (=> (= 0 0) (and (=> (= (ControlFlow 0 184) (- 0 187)) (HasDirectPerm Mask@47 this dst)) (=> (HasDirectPerm Mask@47 this dst) (and (=> (= (ControlFlow 0 184) (- 0 186)) (>= tid 0)) (=> (>= tid 0) (and (=> (= (ControlFlow 0 184) (- 0 185)) (< tid (|Seq#Length| (MapType0Select ExhaleHeap@0 this dst)))) (=> (< tid (|Seq#Length| (MapType0Select ExhaleHeap@0 this dst))) (=> (not (= (|Seq#Index| (MapType0Select ExhaleHeap@0 this dst) tid) null)) (=> (and (and (= Mask@48 (MapType1Store Mask@47 (|Seq#Index| (MapType0Select ExhaleHeap@0 this dst) tid) Integer_value (real_2_U (+ (U_2_real (MapType1Select Mask@47 (|Seq#Index| (MapType0Select ExhaleHeap@0 this dst) tid) Integer_value)) FullPerm)))) (state ExhaleHeap@0 Mask@48)) (and (= Mask@49 Mask@48) (= (ControlFlow 0 184) 180))) anon78_correct)))))))))))
(let ((anon76_correct  (=> (state ExhaleHeap@0 Mask@47) (and (=> (= (ControlFlow 0 189) 184) anon247_Then_correct) (=> (= (ControlFlow 0 189) 188) anon247_Else_correct)))))
(let ((anon246_Else_correct  (=> (not (= tid 0)) (=> (and (= Mask@47 Mask@45) (= (ControlFlow 0 194) 189)) anon76_correct))))
(let ((anon246_Then_correct  (=> (= tid 0) (and (=> (= (ControlFlow 0 191) (- 0 193)) (HasDirectPerm Mask@45 this dst)) (=> (HasDirectPerm Mask@45 this dst) (and (=> (= (ControlFlow 0 191) (- 0 192)) (< 1 (|Seq#Length| (MapType0Select ExhaleHeap@0 this dst)))) (=> (< 1 (|Seq#Length| (MapType0Select ExhaleHeap@0 this dst))) (=> (not (= (|Seq#Index| (MapType0Select ExhaleHeap@0 this dst) 1) null)) (=> (and (and (= Mask@46 (MapType1Store Mask@45 (|Seq#Index| (MapType0Select ExhaleHeap@0 this dst) 1) Integer_value (real_2_U (+ (U_2_real (MapType1Select Mask@45 (|Seq#Index| (MapType0Select ExhaleHeap@0 this dst) 1) Integer_value)) FullPerm)))) (state ExhaleHeap@0 Mask@46)) (and (= Mask@47 Mask@46) (= (ControlFlow 0 191) 189))) anon76_correct)))))))))
(let ((anon245_Else_correct  (=> (and (not (= tid 0)) (= Mask@45 QPMask@5)) (and (=> (= (ControlFlow 0 198) 191) anon246_Then_correct) (=> (= (ControlFlow 0 198) 194) anon246_Else_correct)))))
(let ((anon245_Then_correct  (=> (= tid 0) (and (=> (= (ControlFlow 0 195) (- 0 197)) (HasDirectPerm QPMask@5 this dst)) (=> (HasDirectPerm QPMask@5 this dst) (and (=> (= (ControlFlow 0 195) (- 0 196)) (< 0 (|Seq#Length| (MapType0Select ExhaleHeap@0 this dst)))) (=> (< 0 (|Seq#Length| (MapType0Select ExhaleHeap@0 this dst))) (=> (and (and (not (= (|Seq#Index| (MapType0Select ExhaleHeap@0 this dst) 0) null)) (= Mask@44 (MapType1Store QPMask@5 (|Seq#Index| (MapType0Select ExhaleHeap@0 this dst) 0) Integer_value (real_2_U (+ (U_2_real (MapType1Select QPMask@5 (|Seq#Index| (MapType0Select ExhaleHeap@0 this dst) 0) Integer_value)) FullPerm))))) (and (state ExhaleHeap@0 Mask@44) (= Mask@45 Mask@44))) (and (=> (= (ControlFlow 0 195) 191) anon246_Then_correct) (=> (= (ControlFlow 0 195) 194) anon246_Else_correct))))))))))
(let ((anon244_Then_correct  (=> (= 0 1) (and (=> (= (ControlFlow 0 199) 195) anon245_Then_correct) (=> (= (ControlFlow 0 199) 198) anon245_Else_correct)))))
(let ((anon244_Else_correct  (=> (not (= 0 1)) (=> (and (= Mask@47 QPMask@5) (= (ControlFlow 0 190) 189)) anon76_correct))))
(let ((anon242_Else_correct  (and (=> (= (ControlFlow 0 200) (- 0 202)) (forall ((i_13 Int) (i_13_1 Int) ) (!  (=> (and (and (and (and (not (= i_13 i_13_1)) (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_13))) (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_13_1))) (< NoPerm (/ (to_real 1) (to_real gsize)))) (< NoPerm (/ (to_real 1) (to_real gsize)))) (not (= (|Seq#Index| (MapType0Select ExhaleHeap@0 this src) i_13) (|Seq#Index| (MapType0Select ExhaleHeap@0 this src) i_13_1))))
 :qid |stdinbpl.1312:23|
 :skolemid |85|
))) (=> (forall ((i_13@@0 Int) (i_13_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_13@@0 i_13_1@@0)) (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_13@@0))) (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_13_1@@0))) (< NoPerm (/ (to_real 1) (to_real gsize)))) (< NoPerm (/ (to_real 1) (to_real gsize)))) (not (= (|Seq#Index| (MapType0Select ExhaleHeap@0 this src) i_13@@0) (|Seq#Index| (MapType0Select ExhaleHeap@0 this src) i_13_1@@0))))
 :qid |stdinbpl.1312:23|
 :skolemid |85|
)) (=> (and (forall ((i_13@@1 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_13@@1)) (< NoPerm (/ (to_real 1) (to_real gsize)))) (and (qpRange5 (|Seq#Index| (MapType0Select ExhaleHeap@0 this src) i_13@@1)) (= (invRecv5 (|Seq#Index| (MapType0Select ExhaleHeap@0 this src) i_13@@1)) i_13@@1)))
 :qid |stdinbpl.1318:30|
 :skolemid |86|
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@0 this src) i_13@@1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 gsize) (int_2_U i_13@@1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_13@@1)))
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@0 this src) i_13@@1))
)) (forall ((o_3@@2 T@U) ) (!  (=> (= (type o_3@@2) RefType) (=> (and (and (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U (invRecv5 o_3@@2))) (< NoPerm (/ (to_real 1) (to_real gsize)))) (qpRange5 o_3@@2)) (= (|Seq#Index| (MapType0Select ExhaleHeap@0 this src) (invRecv5 o_3@@2)) o_3@@2)))
 :qid |stdinbpl.1322:30|
 :skolemid |87|
 :pattern ( (invRecv5 o_3@@2))
))) (and (=> (= (ControlFlow 0 200) (- 0 201)) (forall ((i_13@@2 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_13@@2)) (>= (/ (to_real 1) (to_real gsize)) NoPerm))
 :qid |stdinbpl.1328:23|
 :skolemid |88|
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@0 this src) i_13@@2))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 gsize) (int_2_U i_13@@2)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_13@@2)))
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@0 this src) i_13@@2))
))) (=> (forall ((i_13@@3 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_13@@3)) (>= (/ (to_real 1) (to_real gsize)) NoPerm))
 :qid |stdinbpl.1328:23|
 :skolemid |88|
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@0 this src) i_13@@3))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 gsize) (int_2_U i_13@@3)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_13@@3)))
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@0 this src) i_13@@3))
)) (=> (forall ((i_13@@4 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_13@@4)) (> (/ (to_real 1) (to_real gsize)) NoPerm)) (not (= (|Seq#Index| (MapType0Select ExhaleHeap@0 this src) i_13@@4) null)))
 :qid |stdinbpl.1334:30|
 :skolemid |89|
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@0 this src) i_13@@4))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 gsize) (int_2_U i_13@@4)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_13@@4)))
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@0 this src) i_13@@4))
)) (=> (and (forall ((o_3@@3 T@U) ) (!  (=> (= (type o_3@@3) RefType) (and (=> (and (and (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U (invRecv5 o_3@@3))) (< NoPerm (/ (to_real 1) (to_real gsize)))) (qpRange5 o_3@@3)) (and (=> (< NoPerm (/ (to_real 1) (to_real gsize))) (= (|Seq#Index| (MapType0Select ExhaleHeap@0 this src) (invRecv5 o_3@@3)) o_3@@3)) (= (U_2_real (MapType1Select QPMask@5 o_3@@3 Integer_value)) (+ (U_2_real (MapType1Select Mask@13 o_3@@3 Integer_value)) (/ (to_real 1) (to_real gsize)))))) (=> (not (and (and (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U (invRecv5 o_3@@3))) (< NoPerm (/ (to_real 1) (to_real gsize)))) (qpRange5 o_3@@3))) (= (U_2_real (MapType1Select QPMask@5 o_3@@3 Integer_value)) (U_2_real (MapType1Select Mask@13 o_3@@3 Integer_value))))))
 :qid |stdinbpl.1340:30|
 :skolemid |90|
 :pattern ( (MapType1Select QPMask@5 o_3@@3 Integer_value))
)) (forall ((o_3@@4 T@U) (f_5@@0 T@U) ) (! (let ((B@@12 (FieldTypeInv1 (type f_5@@0))))
(let ((A@@13 (FieldTypeInv0 (type f_5@@0))))
 (=> (and (and (= (type o_3@@4) RefType) (= (type f_5@@0) (FieldType A@@13 B@@12))) (not (= f_5@@0 Integer_value))) (= (U_2_real (MapType1Select Mask@13 o_3@@4 f_5@@0)) (U_2_real (MapType1Select QPMask@5 o_3@@4 f_5@@0))))))
 :qid |stdinbpl.1344:37|
 :skolemid |91|
 :pattern ( (MapType1Select Mask@13 o_3@@4 f_5@@0))
 :pattern ( (MapType1Select QPMask@5 o_3@@4 f_5@@0))
))) (=> (and (and (state ExhaleHeap@0 QPMask@5) (state ExhaleHeap@0 QPMask@5)) (and (= 0 0) (state ExhaleHeap@0 QPMask@5))) (and (=> (= (ControlFlow 0 200) 199) anon244_Then_correct) (=> (= (ControlFlow 0 200) 190) anon244_Else_correct))))))))))))
(let ((anon70_correct true))
(let ((anon243_Else_correct  (=> (and (not (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_8))) (= (ControlFlow 0 167) 161)) anon70_correct)))
(let ((anon243_Then_correct  (=> (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_8)) (and (=> (= (ControlFlow 0 162) (- 0 166)) (HasDirectPerm Mask@13 this src)) (=> (HasDirectPerm Mask@13 this src) (and (=> (= (ControlFlow 0 162) (- 0 165)) (>= i_8 0)) (=> (>= i_8 0) (and (=> (= (ControlFlow 0 162) (- 0 164)) (< i_8 (|Seq#Length| (MapType0Select ExhaleHeap@0 this src)))) (=> (< i_8 (|Seq#Length| (MapType0Select ExhaleHeap@0 this src))) (and (=> (= (ControlFlow 0 162) (- 0 163)) (not (= gsize 0))) (=> (not (= gsize 0)) (=> (= (ControlFlow 0 162) 161) anon70_correct))))))))))))
(let ((anon237_Else_correct  (=> (and (forall ((ix_9 Int) (jx_9 Int) ) (!  (=> (and (>= ix_9 0) (and (< ix_9 (|Seq#Length| (MapType0Select ExhaleHeap@0 this src))) (and (>= jx_9 0) (and (< jx_9 (|Seq#Length| (MapType0Select ExhaleHeap@0 this src))) (not (= ix_9 jx_9)))))) (not (= (|Seq#Index| (MapType0Select ExhaleHeap@0 this src) ix_9) (|Seq#Index| (MapType0Select ExhaleHeap@0 this src) jx_9))))
 :qid |stdinbpl.1290:28|
 :skolemid |84|
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@0 this src) ix_9) (|Seq#Index| (MapType0Select ExhaleHeap@0 this src) jx_9))
)) (state ExhaleHeap@0 Mask@13)) (and (and (=> (= (ControlFlow 0 203) 200) anon242_Else_correct) (=> (= (ControlFlow 0 203) 162) anon243_Then_correct)) (=> (= (ControlFlow 0 203) 167) anon243_Else_correct)))))
(let ((anon66_correct true))
(let ((anon241_Else_correct  (=> (and (not (and (>= ix_4 0) (and (< ix_4 (|Seq#Length| (MapType0Select ExhaleHeap@0 this src))) (and (>= jx_4 0) (and (< jx_4 (|Seq#Length| (MapType0Select ExhaleHeap@0 this src))) (not (= ix_4 jx_4))))))) (= (ControlFlow 0 152) 144)) anon66_correct)))
(let ((anon241_Then_correct  (=> (and (>= ix_4 0) (and (< ix_4 (|Seq#Length| (MapType0Select ExhaleHeap@0 this src))) (and (>= jx_4 0) (and (< jx_4 (|Seq#Length| (MapType0Select ExhaleHeap@0 this src))) (not (= ix_4 jx_4)))))) (and (=> (= (ControlFlow 0 145) (- 0 151)) (HasDirectPerm Mask@13 this src)) (=> (HasDirectPerm Mask@13 this src) (and (=> (= (ControlFlow 0 145) (- 0 150)) (>= ix_4 0)) (=> (>= ix_4 0) (and (=> (= (ControlFlow 0 145) (- 0 149)) (< ix_4 (|Seq#Length| (MapType0Select ExhaleHeap@0 this src)))) (=> (< ix_4 (|Seq#Length| (MapType0Select ExhaleHeap@0 this src))) (and (=> (= (ControlFlow 0 145) (- 0 148)) (HasDirectPerm Mask@13 this src)) (=> (HasDirectPerm Mask@13 this src) (and (=> (= (ControlFlow 0 145) (- 0 147)) (>= jx_4 0)) (=> (>= jx_4 0) (and (=> (= (ControlFlow 0 145) (- 0 146)) (< jx_4 (|Seq#Length| (MapType0Select ExhaleHeap@0 this src)))) (=> (< jx_4 (|Seq#Length| (MapType0Select ExhaleHeap@0 this src))) (=> (= (ControlFlow 0 145) 144) anon66_correct))))))))))))))))
(let ((anon240_Else_correct  (=> (> 0 jx_4) (and (=> (= (ControlFlow 0 157) 145) anon241_Then_correct) (=> (= (ControlFlow 0 157) 152) anon241_Else_correct)))))
(let ((anon240_Then_correct  (=> (>= jx_4 0) (and (=> (= (ControlFlow 0 155) (- 0 156)) (HasDirectPerm Mask@13 this src)) (=> (HasDirectPerm Mask@13 this src) (and (=> (= (ControlFlow 0 155) 145) anon241_Then_correct) (=> (= (ControlFlow 0 155) 152) anon241_Else_correct)))))))
(let ((anon239_Then_correct  (=> (< ix_4 (|Seq#Length| (MapType0Select ExhaleHeap@0 this src))) (and (=> (= (ControlFlow 0 158) 155) anon240_Then_correct) (=> (= (ControlFlow 0 158) 157) anon240_Else_correct)))))
(let ((anon239_Else_correct  (=> (<= (|Seq#Length| (MapType0Select ExhaleHeap@0 this src)) ix_4) (and (=> (= (ControlFlow 0 154) 145) anon241_Then_correct) (=> (= (ControlFlow 0 154) 152) anon241_Else_correct)))))
(let ((anon238_Then_correct  (=> (>= ix_4 0) (and (=> (= (ControlFlow 0 159) (- 0 160)) (HasDirectPerm Mask@13 this src)) (=> (HasDirectPerm Mask@13 this src) (and (=> (= (ControlFlow 0 159) 158) anon239_Then_correct) (=> (= (ControlFlow 0 159) 154) anon239_Else_correct)))))))
(let ((anon238_Else_correct  (=> (> 0 ix_4) (and (=> (= (ControlFlow 0 153) 145) anon241_Then_correct) (=> (= (ControlFlow 0 153) 152) anon241_Else_correct)))))
(let ((anon236_Then_correct  (=> (<= 0 tid) (=> (and (state ExhaleHeap@0 Mask@11) (< tid tcount)) (=> (and (and (state ExhaleHeap@0 Mask@11) (= tid lid)) (and (state ExhaleHeap@0 Mask@11) (= tcount gsize))) (=> (and (and (and (state ExhaleHeap@0 Mask@11) (= gid 0)) (and (state ExhaleHeap@0 Mask@11) (> wildcard@6 NoPerm))) (and (and (not (= this null)) (= Mask@12 (MapType1Store Mask@11 this src (real_2_U (+ (U_2_real (MapType1Select Mask@11 this src)) wildcard@6))))) (and (state ExhaleHeap@0 Mask@12) (state ExhaleHeap@0 Mask@12)))) (and (=> (= (ControlFlow 0 204) (- 0 206)) (HasDirectPerm Mask@12 this src)) (=> (HasDirectPerm Mask@12 this src) (=> (= (|Seq#Length| (MapType0Select ExhaleHeap@0 this src)) gsize) (=> (and (state ExhaleHeap@0 Mask@12) (> wildcard@7 NoPerm)) (=> (and (and (not (= this null)) (= Mask@13 (MapType1Store Mask@12 this dst (real_2_U (+ (U_2_real (MapType1Select Mask@12 this dst)) wildcard@7))))) (and (state ExhaleHeap@0 Mask@13) (state ExhaleHeap@0 Mask@13))) (and (=> (= (ControlFlow 0 204) (- 0 205)) (HasDirectPerm Mask@13 this dst)) (=> (HasDirectPerm Mask@13 this dst) (=> (and (= (|Seq#Length| (MapType0Select ExhaleHeap@0 this dst)) gsize) (state ExhaleHeap@0 Mask@13)) (=> (and (and (<= 4 gsize) (state ExhaleHeap@0 Mask@13)) (and (= (mod gsize 4) 0) (state ExhaleHeap@0 Mask@13))) (and (and (=> (= (ControlFlow 0 204) 203) anon237_Else_correct) (=> (= (ControlFlow 0 204) 159) anon238_Then_correct)) (=> (= (ControlFlow 0 204) 153) anon238_Else_correct)))))))))))))))))
(let ((anon115_correct true))
(let ((anon267_Else_correct  (=> (and (not (and (<= 0 i_19) (< i_19 k@1))) (= (ControlFlow 0 67) 64)) anon115_correct)))
(let ((anon267_Then_correct  (=> (and (<= 0 i_19) (< i_19 k@1)) (and (=> (= (ControlFlow 0 65) (- 0 66)) (>= (U_2_int (MapType0Select Heap@3 (|Seq#Index| (MapType0Select Heap@3 this dst) tid) Integer_value)) (U_2_int (MapType0Select Heap@3 (|Seq#Index| (MapType0Select Heap@3 this src) (+ (* tid half@0) i_19)) Integer_value)))) (=> (>= (U_2_int (MapType0Select Heap@3 (|Seq#Index| (MapType0Select Heap@3 this dst) tid) Integer_value)) (U_2_int (MapType0Select Heap@3 (|Seq#Index| (MapType0Select Heap@3 this src) (+ (* tid half@0) i_19)) Integer_value))) (=> (= (ControlFlow 0 65) 64) anon115_correct))))))
(let ((anon266_Else_correct true))
(let ((anon112_correct  (=> (= Mask@43 (MapType1Store Mask@42 (|Seq#Index| (MapType0Select Heap@3 this dst) tid) Integer_value (real_2_U (- (U_2_real (MapType1Select Mask@42 (|Seq#Index| (MapType0Select Heap@3 this dst) tid) Integer_value)) FullPerm)))) (and (and (=> (= (ControlFlow 0 68) 63) anon266_Else_correct) (=> (= (ControlFlow 0 68) 65) anon267_Then_correct)) (=> (= (ControlFlow 0 68) 67) anon267_Else_correct)))))
(let ((anon265_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 71) 68)) anon112_correct)))
(let ((anon265_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 69) (- 0 70)) (<= FullPerm (U_2_real (MapType1Select Mask@42 (|Seq#Index| (MapType0Select Heap@3 this dst) tid) Integer_value)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@42 (|Seq#Index| (MapType0Select Heap@3 this dst) tid) Integer_value))) (=> (= (ControlFlow 0 69) 68) anon112_correct))))))
(let ((anon110_correct  (and (=> (= (ControlFlow 0 72) (- 0 74)) (< 0 k@1)) (=> (< 0 k@1) (and (=> (= (ControlFlow 0 72) (- 0 73)) (<= k@1 half@0)) (=> (<= k@1 half@0) (and (=> (= (ControlFlow 0 72) 69) anon265_Then_correct) (=> (= (ControlFlow 0 72) 71) anon265_Else_correct))))))))
(let ((anon109_correct  (=> (= Mask@41 (MapType1Store Mask@40 (|Seq#Index| (MapType0Select Heap@3 this dst) tid) Integer_value (real_2_U (- (U_2_real (MapType1Select Mask@40 (|Seq#Index| (MapType0Select Heap@3 this dst) tid) Integer_value)) FullPerm)))) (=> (and (= Mask@42 Mask@41) (= (ControlFlow 0 76) 72)) anon110_correct))))
(let ((anon264_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 79) 76)) anon109_correct)))
(let ((anon264_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 77) (- 0 78)) (<= FullPerm (U_2_real (MapType1Select Mask@40 (|Seq#Index| (MapType0Select Heap@3 this dst) tid) Integer_value)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@40 (|Seq#Index| (MapType0Select Heap@3 this dst) tid) Integer_value))) (=> (= (ControlFlow 0 77) 76) anon109_correct))))))
(let ((anon263_Then_correct  (=> (= 0 0) (and (=> (= (ControlFlow 0 80) 77) anon264_Then_correct) (=> (= (ControlFlow 0 80) 79) anon264_Else_correct)))))
(let ((anon263_Else_correct  (=> (not (= 0 0)) (=> (and (= Mask@42 Mask@40) (= (ControlFlow 0 75) 72)) anon110_correct))))
(let ((anon105_correct  (=> (and (= Mask@39 (MapType1Store Mask@38 (|Seq#Index| (MapType0Select Heap@3 this dst) 1) Integer_value (real_2_U (- (U_2_real (MapType1Select Mask@38 (|Seq#Index| (MapType0Select Heap@3 this dst) 1) Integer_value)) FullPerm)))) (= Mask@40 Mask@39)) (and (=> (= (ControlFlow 0 83) 80) anon263_Then_correct) (=> (= (ControlFlow 0 83) 75) anon263_Else_correct)))))
(let ((anon262_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 86) 83)) anon105_correct)))
(let ((anon262_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 84) (- 0 85)) (<= FullPerm (U_2_real (MapType1Select Mask@38 (|Seq#Index| (MapType0Select Heap@3 this dst) 1) Integer_value)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@38 (|Seq#Index| (MapType0Select Heap@3 this dst) 1) Integer_value))) (=> (= (ControlFlow 0 84) 83) anon105_correct))))))
(let ((anon261_Then_correct  (=> (= tid 0) (and (=> (= (ControlFlow 0 87) 84) anon262_Then_correct) (=> (= (ControlFlow 0 87) 86) anon262_Else_correct)))))
(let ((anon261_Else_correct  (=> (and (not (= tid 0)) (= Mask@40 Mask@38)) (and (=> (= (ControlFlow 0 82) 80) anon263_Then_correct) (=> (= (ControlFlow 0 82) 75) anon263_Else_correct)))))
(let ((anon101_correct  (=> (and (= Mask@37 (MapType1Store QPMask@4 (|Seq#Index| (MapType0Select Heap@3 this dst) 0) Integer_value (real_2_U (- (U_2_real (MapType1Select QPMask@4 (|Seq#Index| (MapType0Select Heap@3 this dst) 0) Integer_value)) FullPerm)))) (= Mask@38 Mask@37)) (and (=> (= (ControlFlow 0 89) 87) anon261_Then_correct) (=> (= (ControlFlow 0 89) 82) anon261_Else_correct)))))
(let ((anon260_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 92) 89)) anon101_correct)))
(let ((anon260_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 90) (- 0 91)) (<= FullPerm (U_2_real (MapType1Select QPMask@4 (|Seq#Index| (MapType0Select Heap@3 this dst) 0) Integer_value)))) (=> (<= FullPerm (U_2_real (MapType1Select QPMask@4 (|Seq#Index| (MapType0Select Heap@3 this dst) 0) Integer_value))) (=> (= (ControlFlow 0 90) 89) anon101_correct))))))
(let ((anon259_Then_correct  (=> (= tid 0) (and (=> (= (ControlFlow 0 93) 90) anon260_Then_correct) (=> (= (ControlFlow 0 93) 92) anon260_Else_correct)))))
(let ((anon259_Else_correct  (=> (and (not (= tid 0)) (= Mask@38 QPMask@4)) (and (=> (= (ControlFlow 0 88) 87) anon261_Then_correct) (=> (= (ControlFlow 0 88) 82) anon261_Else_correct)))))
(let ((anon258_Then_correct  (=> (= 0 1) (and (=> (= (ControlFlow 0 94) 93) anon259_Then_correct) (=> (= (ControlFlow 0 94) 88) anon259_Else_correct)))))
(let ((anon258_Else_correct  (=> (and (not (= 0 1)) (= Mask@40 QPMask@4)) (and (=> (= (ControlFlow 0 81) 80) anon263_Then_correct) (=> (= (ControlFlow 0 81) 75) anon263_Else_correct)))))
(let ((anon256_Else_correct  (=> (forall ((ix_12_1 Int) (jx_12_1 Int) ) (!  (=> (and (>= ix_12_1 0) (and (< ix_12_1 (|Seq#Length| (MapType0Select Heap@3 this src))) (and (>= jx_12_1 0) (and (< jx_12_1 (|Seq#Length| (MapType0Select Heap@3 this src))) (not (= ix_12_1 jx_12_1)))))) (not (= (|Seq#Index| (MapType0Select Heap@3 this src) ix_12_1) (|Seq#Index| (MapType0Select Heap@3 this src) jx_12_1))))
 :qid |stdinbpl.1648:28|
 :skolemid |102|
 :pattern ( (|Seq#Index| (MapType0Select Heap@3 this src) ix_12_1) (|Seq#Index| (MapType0Select Heap@3 this src) jx_12_1))
)) (and (=> (= (ControlFlow 0 95) (- 0 99)) (forall ((i_18 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_18)) (dummyFunction (MapType0Select Heap@3 (|Seq#Index| (MapType0Select Heap@3 this src) i_18) Integer_value))) (>= (/ (to_real 1) (to_real gsize)) NoPerm))
 :qid |stdinbpl.1656:25|
 :skolemid |103|
 :pattern ( (|Seq#Index| (MapType0Select Heap@3 this src) i_18))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 gsize) (int_2_U i_18)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_18)))
 :pattern ( (|Seq#Index| (MapType0Select Heap@3 this src) i_18))
))) (=> (forall ((i_18@@0 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_18@@0)) (dummyFunction (MapType0Select Heap@3 (|Seq#Index| (MapType0Select Heap@3 this src) i_18@@0) Integer_value))) (>= (/ (to_real 1) (to_real gsize)) NoPerm))
 :qid |stdinbpl.1656:25|
 :skolemid |103|
 :pattern ( (|Seq#Index| (MapType0Select Heap@3 this src) i_18@@0))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 gsize) (int_2_U i_18@@0)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_18@@0)))
 :pattern ( (|Seq#Index| (MapType0Select Heap@3 this src) i_18@@0))
)) (and (=> (= (ControlFlow 0 95) (- 0 98)) (forall ((i_18@@1 Int) (i_18_1 Int) ) (!  (=> (and (and (and (and (not (= i_18@@1 i_18_1)) (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_18@@1))) (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_18_1))) (< NoPerm (/ (to_real 1) (to_real gsize)))) (< NoPerm (/ (to_real 1) (to_real gsize)))) (not (= (|Seq#Index| (MapType0Select Heap@3 this src) i_18@@1) (|Seq#Index| (MapType0Select Heap@3 this src) i_18_1))))
 :qid |stdinbpl.1663:25|
 :skolemid |104|
 :pattern ( (neverTriggered7 i_18@@1) (neverTriggered7 i_18_1))
))) (=> (forall ((i_18@@2 Int) (i_18_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_18@@2 i_18_1@@0)) (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_18@@2))) (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_18_1@@0))) (< NoPerm (/ (to_real 1) (to_real gsize)))) (< NoPerm (/ (to_real 1) (to_real gsize)))) (not (= (|Seq#Index| (MapType0Select Heap@3 this src) i_18@@2) (|Seq#Index| (MapType0Select Heap@3 this src) i_18_1@@0))))
 :qid |stdinbpl.1663:25|
 :skolemid |104|
 :pattern ( (neverTriggered7 i_18@@2) (neverTriggered7 i_18_1@@0))
)) (and (=> (= (ControlFlow 0 95) (- 0 97)) (forall ((i_18@@3 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_18@@3)) (>= (U_2_real (MapType1Select Mask@36 (|Seq#Index| (MapType0Select Heap@3 this src) i_18@@3) Integer_value)) (/ (to_real 1) (to_real gsize))))
 :qid |stdinbpl.1670:25|
 :skolemid |105|
 :pattern ( (|Seq#Index| (MapType0Select Heap@3 this src) i_18@@3))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 gsize) (int_2_U i_18@@3)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_18@@3)))
 :pattern ( (|Seq#Index| (MapType0Select Heap@3 this src) i_18@@3))
))) (=> (forall ((i_18@@4 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_18@@4)) (>= (U_2_real (MapType1Select Mask@36 (|Seq#Index| (MapType0Select Heap@3 this src) i_18@@4) Integer_value)) (/ (to_real 1) (to_real gsize))))
 :qid |stdinbpl.1670:25|
 :skolemid |105|
 :pattern ( (|Seq#Index| (MapType0Select Heap@3 this src) i_18@@4))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 gsize) (int_2_U i_18@@4)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_18@@4)))
 :pattern ( (|Seq#Index| (MapType0Select Heap@3 this src) i_18@@4))
)) (=> (and (and (forall ((i_18@@5 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_18@@5)) (< NoPerm (/ (to_real 1) (to_real gsize)))) (and (qpRange7 (|Seq#Index| (MapType0Select Heap@3 this src) i_18@@5)) (= (invRecv7 (|Seq#Index| (MapType0Select Heap@3 this src) i_18@@5)) i_18@@5)))
 :qid |stdinbpl.1676:30|
 :skolemid |106|
 :pattern ( (|Seq#Index| (MapType0Select Heap@3 this src) i_18@@5))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 gsize) (int_2_U i_18@@5)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_18@@5)))
 :pattern ( (|Seq#Index| (MapType0Select Heap@3 this src) i_18@@5))
)) (forall ((o_3@@5 T@U) ) (!  (=> (= (type o_3@@5) RefType) (=> (and (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U (invRecv7 o_3@@5))) (and (< NoPerm (/ (to_real 1) (to_real gsize))) (qpRange7 o_3@@5))) (= (|Seq#Index| (MapType0Select Heap@3 this src) (invRecv7 o_3@@5)) o_3@@5)))
 :qid |stdinbpl.1680:30|
 :skolemid |107|
 :pattern ( (invRecv7 o_3@@5))
))) (and (forall ((o_3@@6 T@U) ) (!  (=> (= (type o_3@@6) RefType) (and (=> (and (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U (invRecv7 o_3@@6))) (and (< NoPerm (/ (to_real 1) (to_real gsize))) (qpRange7 o_3@@6))) (and (= (|Seq#Index| (MapType0Select Heap@3 this src) (invRecv7 o_3@@6)) o_3@@6) (= (U_2_real (MapType1Select QPMask@4 o_3@@6 Integer_value)) (- (U_2_real (MapType1Select Mask@36 o_3@@6 Integer_value)) (/ (to_real 1) (to_real gsize)))))) (=> (not (and (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U (invRecv7 o_3@@6))) (and (< NoPerm (/ (to_real 1) (to_real gsize))) (qpRange7 o_3@@6)))) (= (U_2_real (MapType1Select QPMask@4 o_3@@6 Integer_value)) (U_2_real (MapType1Select Mask@36 o_3@@6 Integer_value))))))
 :qid |stdinbpl.1686:30|
 :skolemid |108|
 :pattern ( (MapType1Select QPMask@4 o_3@@6 Integer_value))
)) (forall ((o_3@@7 T@U) (f_5@@1 T@U) ) (! (let ((B@@13 (FieldTypeInv1 (type f_5@@1))))
(let ((A@@14 (FieldTypeInv0 (type f_5@@1))))
 (=> (and (and (= (type o_3@@7) RefType) (= (type f_5@@1) (FieldType A@@14 B@@13))) (not (= f_5@@1 Integer_value))) (= (U_2_real (MapType1Select Mask@36 o_3@@7 f_5@@1)) (U_2_real (MapType1Select QPMask@4 o_3@@7 f_5@@1))))))
 :qid |stdinbpl.1692:37|
 :skolemid |109|
 :pattern ( (MapType1Select QPMask@4 o_3@@7 f_5@@1))
)))) (and (=> (= (ControlFlow 0 95) (- 0 96)) (= 0 0)) (=> (= 0 0) (and (=> (= (ControlFlow 0 95) 94) anon258_Then_correct) (=> (= (ControlFlow 0 95) 81) anon258_Else_correct))))))))))))))
(let ((anon96_correct true))
(let ((anon257_Else_correct  (=> (and (not (and (>= ix_11 0) (and (< ix_11 (|Seq#Length| (MapType0Select Heap@3 this src))) (and (>= jx_11 0) (and (< jx_11 (|Seq#Length| (MapType0Select Heap@3 this src))) (not (= ix_11 jx_11))))))) (= (ControlFlow 0 62) 59)) anon96_correct)))
(let ((anon257_Then_correct  (=> (and (>= ix_11 0) (and (< ix_11 (|Seq#Length| (MapType0Select Heap@3 this src))) (and (>= jx_11 0) (and (< jx_11 (|Seq#Length| (MapType0Select Heap@3 this src))) (not (= ix_11 jx_11)))))) (and (=> (= (ControlFlow 0 60) (- 0 61)) (not (= (|Seq#Index| (MapType0Select Heap@3 this src) ix_11) (|Seq#Index| (MapType0Select Heap@3 this src) jx_11)))) (=> (not (= (|Seq#Index| (MapType0Select Heap@3 this src) ix_11) (|Seq#Index| (MapType0Select Heap@3 this src) jx_11))) (=> (= (ControlFlow 0 60) 59) anon96_correct))))))
(let ((anon93_correct  (=> (state Heap@3 Mask@34) (=> (and (= k@1 (+ k@0 1)) (state Heap@3 Mask@34)) (and (=> (= (ControlFlow 0 100) (- 0 111)) (<= 0 tid)) (=> (<= 0 tid) (and (=> (= (ControlFlow 0 100) (- 0 110)) (< tid tcount)) (=> (< tid tcount) (and (=> (= (ControlFlow 0 100) (- 0 109)) (= tid lid)) (=> (= tid lid) (and (=> (= (ControlFlow 0 100) (- 0 108)) (= tcount gsize)) (=> (= tcount gsize) (and (=> (= (ControlFlow 0 100) (- 0 107)) (= gid 0)) (=> (= gid 0) (and (=> (= (ControlFlow 0 100) (- 0 106)) (> (U_2_real (MapType1Select Mask@34 this src)) NoPerm)) (=> (> (U_2_real (MapType1Select Mask@34 this src)) NoPerm) (=> (> wildcard@14 NoPerm) (=> (and (< wildcard@14 (U_2_real (MapType1Select Mask@34 this src))) (= Mask@35 (MapType1Store Mask@34 this src (real_2_U (- (U_2_real (MapType1Select Mask@34 this src)) wildcard@14))))) (and (=> (= (ControlFlow 0 100) (- 0 105)) (= (|Seq#Length| (MapType0Select Heap@3 this src)) gsize)) (=> (= (|Seq#Length| (MapType0Select Heap@3 this src)) gsize) (and (=> (= (ControlFlow 0 100) (- 0 104)) (> (U_2_real (MapType1Select Mask@35 this dst)) NoPerm)) (=> (> (U_2_real (MapType1Select Mask@35 this dst)) NoPerm) (=> (> wildcard@15 NoPerm) (=> (and (< wildcard@15 (U_2_real (MapType1Select Mask@35 this dst))) (= Mask@36 (MapType1Store Mask@35 this dst (real_2_U (- (U_2_real (MapType1Select Mask@35 this dst)) wildcard@15))))) (and (=> (= (ControlFlow 0 100) (- 0 103)) (= (|Seq#Length| (MapType0Select Heap@3 this dst)) gsize)) (=> (= (|Seq#Length| (MapType0Select Heap@3 this dst)) gsize) (and (=> (= (ControlFlow 0 100) (- 0 102)) (<= 4 gsize)) (=> (<= 4 gsize) (and (=> (= (ControlFlow 0 100) (- 0 101)) (= (mod gsize 4) 0)) (=> (= (mod gsize 4) 0) (and (and (=> (= (ControlFlow 0 100) 95) anon256_Else_correct) (=> (= (ControlFlow 0 100) 60) anon257_Then_correct)) (=> (= (ControlFlow 0 100) 62) anon257_Else_correct))))))))))))))))))))))))))))))))
(let ((anon255_Else_correct  (=> (<= (U_2_int (MapType0Select ExhaleHeap@0 (|Seq#Index| (MapType0Select ExhaleHeap@0 this src) (+ offset@0 k@0)) Integer_value)) (U_2_int (MapType0Select ExhaleHeap@0 (|Seq#Index| (MapType0Select ExhaleHeap@0 this dst) tid) Integer_value))) (=> (and (= Heap@3 ExhaleHeap@0) (= (ControlFlow 0 121) 100)) anon93_correct))))
(let ((anon255_Then_correct  (=> (< (U_2_int (MapType0Select ExhaleHeap@0 (|Seq#Index| (MapType0Select ExhaleHeap@0 this dst) tid) Integer_value)) (U_2_int (MapType0Select ExhaleHeap@0 (|Seq#Index| (MapType0Select ExhaleHeap@0 this src) (+ offset@0 k@0)) Integer_value))) (and (=> (= (ControlFlow 0 112) (- 0 120)) (HasDirectPerm Mask@34 this dst)) (=> (HasDirectPerm Mask@34 this dst) (and (=> (= (ControlFlow 0 112) (- 0 119)) (>= tid 0)) (=> (>= tid 0) (and (=> (= (ControlFlow 0 112) (- 0 118)) (< tid (|Seq#Length| (MapType0Select ExhaleHeap@0 this dst)))) (=> (< tid (|Seq#Length| (MapType0Select ExhaleHeap@0 this dst))) (and (=> (= (ControlFlow 0 112) (- 0 117)) (HasDirectPerm Mask@34 this src)) (=> (HasDirectPerm Mask@34 this src) (and (=> (= (ControlFlow 0 112) (- 0 116)) (>= (+ offset@0 k@0) 0)) (=> (>= (+ offset@0 k@0) 0) (and (=> (= (ControlFlow 0 112) (- 0 115)) (< (+ offset@0 k@0) (|Seq#Length| (MapType0Select ExhaleHeap@0 this src)))) (=> (< (+ offset@0 k@0) (|Seq#Length| (MapType0Select ExhaleHeap@0 this src))) (and (=> (= (ControlFlow 0 112) (- 0 114)) (HasDirectPerm Mask@34 (|Seq#Index| (MapType0Select ExhaleHeap@0 this src) (+ offset@0 k@0)) Integer_value)) (=> (HasDirectPerm Mask@34 (|Seq#Index| (MapType0Select ExhaleHeap@0 this src) (+ offset@0 k@0)) Integer_value) (and (=> (= (ControlFlow 0 112) (- 0 113)) (= FullPerm (U_2_real (MapType1Select Mask@34 (|Seq#Index| (MapType0Select ExhaleHeap@0 this dst) tid) Integer_value)))) (=> (= FullPerm (U_2_real (MapType1Select Mask@34 (|Seq#Index| (MapType0Select ExhaleHeap@0 this dst) tid) Integer_value))) (=> (and (and (= Heap@2 (MapType0Store ExhaleHeap@0 (|Seq#Index| (MapType0Select ExhaleHeap@0 this dst) tid) Integer_value (MapType0Select ExhaleHeap@0 (|Seq#Index| (MapType0Select ExhaleHeap@0 this src) (+ offset@0 k@0)) Integer_value))) (state Heap@2 Mask@34)) (and (= Heap@3 Heap@2) (= (ControlFlow 0 112) 100))) anon93_correct))))))))))))))))))))
(let ((anon91_correct  (=> (< 0 k@0) (=> (and (and (and (<= k@0 half@0) (not (= (|Seq#Index| (MapType0Select ExhaleHeap@0 this dst) tid) null))) (and (= Mask@34 (MapType1Store Mask@33 (|Seq#Index| (MapType0Select ExhaleHeap@0 this dst) tid) Integer_value (real_2_U (+ (U_2_real (MapType1Select Mask@33 (|Seq#Index| (MapType0Select ExhaleHeap@0 this dst) tid) Integer_value)) FullPerm)))) (state ExhaleHeap@0 Mask@34))) (and (and (forall ((i_17 Int) ) (!  (=> (and (<= 0 i_17) (< i_17 k@0)) (>= (U_2_int (MapType0Select ExhaleHeap@0 (|Seq#Index| (MapType0Select ExhaleHeap@0 this dst) tid) Integer_value)) (U_2_int (MapType0Select ExhaleHeap@0 (|Seq#Index| (MapType0Select ExhaleHeap@0 this src) (+ (* tid half@0) i_17)) Integer_value))))
 :qid |stdinbpl.1540:28|
 :skolemid |101|
)) (state ExhaleHeap@0 Mask@34)) (and (< k@0 half@0) (state ExhaleHeap@0 Mask@34)))) (and (=> (= (ControlFlow 0 122) (- 0 132)) (<= 0 (+ offset@0 k@0))) (=> (<= 0 (+ offset@0 k@0)) (and (=> (= (ControlFlow 0 122) (- 0 131)) (< (+ offset@0 k@0) gsize)) (=> (< (+ offset@0 k@0) gsize) (=> (state ExhaleHeap@0 Mask@34) (and (=> (= (ControlFlow 0 122) (- 0 130)) (HasDirectPerm Mask@34 this dst)) (=> (HasDirectPerm Mask@34 this dst) (and (=> (= (ControlFlow 0 122) (- 0 129)) (>= tid 0)) (=> (>= tid 0) (and (=> (= (ControlFlow 0 122) (- 0 128)) (< tid (|Seq#Length| (MapType0Select ExhaleHeap@0 this dst)))) (=> (< tid (|Seq#Length| (MapType0Select ExhaleHeap@0 this dst))) (and (=> (= (ControlFlow 0 122) (- 0 127)) (HasDirectPerm Mask@34 (|Seq#Index| (MapType0Select ExhaleHeap@0 this dst) tid) Integer_value)) (=> (HasDirectPerm Mask@34 (|Seq#Index| (MapType0Select ExhaleHeap@0 this dst) tid) Integer_value) (and (=> (= (ControlFlow 0 122) (- 0 126)) (HasDirectPerm Mask@34 this src)) (=> (HasDirectPerm Mask@34 this src) (and (=> (= (ControlFlow 0 122) (- 0 125)) (>= (+ offset@0 k@0) 0)) (=> (>= (+ offset@0 k@0) 0) (and (=> (= (ControlFlow 0 122) (- 0 124)) (< (+ offset@0 k@0) (|Seq#Length| (MapType0Select ExhaleHeap@0 this src)))) (=> (< (+ offset@0 k@0) (|Seq#Length| (MapType0Select ExhaleHeap@0 this src))) (and (=> (= (ControlFlow 0 122) (- 0 123)) (HasDirectPerm Mask@34 (|Seq#Index| (MapType0Select ExhaleHeap@0 this src) (+ offset@0 k@0)) Integer_value)) (=> (HasDirectPerm Mask@34 (|Seq#Index| (MapType0Select ExhaleHeap@0 this src) (+ offset@0 k@0)) Integer_value) (and (=> (= (ControlFlow 0 122) 112) anon255_Then_correct) (=> (= (ControlFlow 0 122) 121) anon255_Else_correct)))))))))))))))))))))))))))
(let ((anon254_Else_correct  (=> (not (= 0 0)) (=> (and (= Mask@33 Mask@31) (= (ControlFlow 0 134) 122)) anon91_correct))))
(let ((anon254_Then_correct  (=> (and (= 0 0) (not (= (|Seq#Index| (MapType0Select ExhaleHeap@0 this dst) tid) null))) (=> (and (and (= Mask@32 (MapType1Store Mask@31 (|Seq#Index| (MapType0Select ExhaleHeap@0 this dst) tid) Integer_value (real_2_U (+ (U_2_real (MapType1Select Mask@31 (|Seq#Index| (MapType0Select ExhaleHeap@0 this dst) tid) Integer_value)) FullPerm)))) (state ExhaleHeap@0 Mask@32)) (and (= Mask@33 Mask@32) (= (ControlFlow 0 133) 122))) anon91_correct))))
(let ((anon253_Else_correct  (=> (and (not (= tid 0)) (= Mask@31 Mask@29)) (and (=> (= (ControlFlow 0 137) 133) anon254_Then_correct) (=> (= (ControlFlow 0 137) 134) anon254_Else_correct)))))
(let ((anon253_Then_correct  (=> (= tid 0) (=> (and (and (not (= (|Seq#Index| (MapType0Select ExhaleHeap@0 this dst) 1) null)) (= Mask@30 (MapType1Store Mask@29 (|Seq#Index| (MapType0Select ExhaleHeap@0 this dst) 1) Integer_value (real_2_U (+ (U_2_real (MapType1Select Mask@29 (|Seq#Index| (MapType0Select ExhaleHeap@0 this dst) 1) Integer_value)) FullPerm))))) (and (state ExhaleHeap@0 Mask@30) (= Mask@31 Mask@30))) (and (=> (= (ControlFlow 0 136) 133) anon254_Then_correct) (=> (= (ControlFlow 0 136) 134) anon254_Else_correct))))))
(let ((anon252_Else_correct  (=> (and (not (= tid 0)) (= Mask@29 QPMask@2)) (and (=> (= (ControlFlow 0 139) 136) anon253_Then_correct) (=> (= (ControlFlow 0 139) 137) anon253_Else_correct)))))
(let ((anon252_Then_correct  (=> (= tid 0) (=> (and (and (not (= (|Seq#Index| (MapType0Select ExhaleHeap@0 this dst) 0) null)) (= Mask@28 (MapType1Store QPMask@2 (|Seq#Index| (MapType0Select ExhaleHeap@0 this dst) 0) Integer_value (real_2_U (+ (U_2_real (MapType1Select QPMask@2 (|Seq#Index| (MapType0Select ExhaleHeap@0 this dst) 0) Integer_value)) FullPerm))))) (and (state ExhaleHeap@0 Mask@28) (= Mask@29 Mask@28))) (and (=> (= (ControlFlow 0 138) 136) anon253_Then_correct) (=> (= (ControlFlow 0 138) 137) anon253_Else_correct))))))
(let ((anon251_Then_correct  (=> (= 0 1) (and (=> (= (ControlFlow 0 140) 138) anon252_Then_correct) (=> (= (ControlFlow 0 140) 139) anon252_Else_correct)))))
(let ((anon251_Else_correct  (=> (and (not (= 0 1)) (= Mask@31 QPMask@2)) (and (=> (= (ControlFlow 0 135) 133) anon254_Then_correct) (=> (= (ControlFlow 0 135) 134) anon254_Else_correct)))))
(let ((anon250_Then_correct  (=> (state ExhaleHeap@0 ZeroMask) (=> (and (<= 0 tid) (< tid tcount)) (=> (and (and (and (and (= tid lid) (= tcount gsize)) (and (= gid 0) (> wildcard@8 NoPerm))) (and (and (not (= this null)) (= Mask@14 (MapType1Store ZeroMask this src (real_2_U (+ (U_2_real (MapType1Select ZeroMask this src)) wildcard@8))))) (and (state ExhaleHeap@0 Mask@14) (= (|Seq#Length| (MapType0Select ExhaleHeap@0 this src)) gsize)))) (and (and (and (> wildcard@9 NoPerm) (not (= this null))) (and (= Mask@15 (MapType1Store Mask@14 this dst (real_2_U (+ (U_2_real (MapType1Select Mask@14 this dst)) wildcard@9)))) (state ExhaleHeap@0 Mask@15))) (and (and (= (|Seq#Length| (MapType0Select ExhaleHeap@0 this dst)) gsize) (<= 4 gsize)) (and (= (mod gsize 4) 0) (forall ((ix_10 Int) (jx_10 Int) ) (!  (=> (and (>= ix_10 0) (and (< ix_10 (|Seq#Length| (MapType0Select ExhaleHeap@0 this src))) (and (>= jx_10 0) (and (< jx_10 (|Seq#Length| (MapType0Select ExhaleHeap@0 this src))) (not (= ix_10 jx_10)))))) (not (= (|Seq#Index| (MapType0Select ExhaleHeap@0 this src) ix_10) (|Seq#Index| (MapType0Select ExhaleHeap@0 this src) jx_10))))
 :qid |stdinbpl.1469:28|
 :skolemid |93|
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@0 this src) ix_10) (|Seq#Index| (MapType0Select ExhaleHeap@0 this src) jx_10))
)))))) (and (=> (= (ControlFlow 0 141) (- 0 143)) (forall ((i_16 Int) (i_16_1 Int) ) (!  (=> (and (and (and (and (not (= i_16 i_16_1)) (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_16))) (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_16_1))) (< NoPerm (/ (to_real 1) (to_real gsize)))) (< NoPerm (/ (to_real 1) (to_real gsize)))) (not (= (|Seq#Index| (MapType0Select ExhaleHeap@0 this src) i_16) (|Seq#Index| (MapType0Select ExhaleHeap@0 this src) i_16_1))))
 :qid |stdinbpl.1475:23|
 :skolemid |94|
))) (=> (forall ((i_16@@0 Int) (i_16_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_16@@0 i_16_1@@0)) (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_16@@0))) (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_16_1@@0))) (< NoPerm (/ (to_real 1) (to_real gsize)))) (< NoPerm (/ (to_real 1) (to_real gsize)))) (not (= (|Seq#Index| (MapType0Select ExhaleHeap@0 this src) i_16@@0) (|Seq#Index| (MapType0Select ExhaleHeap@0 this src) i_16_1@@0))))
 :qid |stdinbpl.1475:23|
 :skolemid |94|
)) (=> (and (forall ((i_16@@1 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_16@@1)) (< NoPerm (/ (to_real 1) (to_real gsize)))) (and (qpRange6 (|Seq#Index| (MapType0Select ExhaleHeap@0 this src) i_16@@1)) (= (invRecv6 (|Seq#Index| (MapType0Select ExhaleHeap@0 this src) i_16@@1)) i_16@@1)))
 :qid |stdinbpl.1481:30|
 :skolemid |95|
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@0 this src) i_16@@1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 gsize) (int_2_U i_16@@1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_16@@1)))
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@0 this src) i_16@@1))
)) (forall ((o_3@@8 T@U) ) (!  (=> (= (type o_3@@8) RefType) (=> (and (and (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U (invRecv6 o_3@@8))) (< NoPerm (/ (to_real 1) (to_real gsize)))) (qpRange6 o_3@@8)) (= (|Seq#Index| (MapType0Select ExhaleHeap@0 this src) (invRecv6 o_3@@8)) o_3@@8)))
 :qid |stdinbpl.1485:30|
 :skolemid |96|
 :pattern ( (invRecv6 o_3@@8))
))) (and (=> (= (ControlFlow 0 141) (- 0 142)) (forall ((i_16@@2 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_16@@2)) (>= (/ (to_real 1) (to_real gsize)) NoPerm))
 :qid |stdinbpl.1491:23|
 :skolemid |97|
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@0 this src) i_16@@2))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 gsize) (int_2_U i_16@@2)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_16@@2)))
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@0 this src) i_16@@2))
))) (=> (forall ((i_16@@3 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_16@@3)) (>= (/ (to_real 1) (to_real gsize)) NoPerm))
 :qid |stdinbpl.1491:23|
 :skolemid |97|
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@0 this src) i_16@@3))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 gsize) (int_2_U i_16@@3)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_16@@3)))
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@0 this src) i_16@@3))
)) (=> (forall ((i_16@@4 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_16@@4)) (> (/ (to_real 1) (to_real gsize)) NoPerm)) (not (= (|Seq#Index| (MapType0Select ExhaleHeap@0 this src) i_16@@4) null)))
 :qid |stdinbpl.1497:30|
 :skolemid |98|
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@0 this src) i_16@@4))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 gsize) (int_2_U i_16@@4)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_16@@4)))
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@0 this src) i_16@@4))
)) (=> (and (and (forall ((o_3@@9 T@U) ) (!  (=> (= (type o_3@@9) RefType) (and (=> (and (and (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U (invRecv6 o_3@@9))) (< NoPerm (/ (to_real 1) (to_real gsize)))) (qpRange6 o_3@@9)) (and (=> (< NoPerm (/ (to_real 1) (to_real gsize))) (= (|Seq#Index| (MapType0Select ExhaleHeap@0 this src) (invRecv6 o_3@@9)) o_3@@9)) (= (U_2_real (MapType1Select QPMask@2 o_3@@9 Integer_value)) (+ (U_2_real (MapType1Select Mask@15 o_3@@9 Integer_value)) (/ (to_real 1) (to_real gsize)))))) (=> (not (and (and (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U (invRecv6 o_3@@9))) (< NoPerm (/ (to_real 1) (to_real gsize)))) (qpRange6 o_3@@9))) (= (U_2_real (MapType1Select QPMask@2 o_3@@9 Integer_value)) (U_2_real (MapType1Select Mask@15 o_3@@9 Integer_value))))))
 :qid |stdinbpl.1503:30|
 :skolemid |99|
 :pattern ( (MapType1Select QPMask@2 o_3@@9 Integer_value))
)) (forall ((o_3@@10 T@U) (f_5@@2 T@U) ) (! (let ((B@@14 (FieldTypeInv1 (type f_5@@2))))
(let ((A@@15 (FieldTypeInv0 (type f_5@@2))))
 (=> (and (and (= (type o_3@@10) RefType) (= (type f_5@@2) (FieldType A@@15 B@@14))) (not (= f_5@@2 Integer_value))) (= (U_2_real (MapType1Select Mask@15 o_3@@10 f_5@@2)) (U_2_real (MapType1Select QPMask@2 o_3@@10 f_5@@2))))))
 :qid |stdinbpl.1507:37|
 :skolemid |100|
 :pattern ( (MapType1Select Mask@15 o_3@@10 f_5@@2))
 :pattern ( (MapType1Select QPMask@2 o_3@@10 f_5@@2))
))) (and (state ExhaleHeap@0 QPMask@2) (= 0 0))) (and (=> (= (ControlFlow 0 141) 140) anon251_Then_correct) (=> (= (ControlFlow 0 141) 135) anon251_Else_correct))))))))))))))
(let ((anon57_correct true))
(let ((anon235_Else_correct  (=> (and (not (and (<= 0 i_10) (< i_10 1))) (= (ControlFlow 0 46) 43)) anon57_correct)))
(let ((anon235_Then_correct  (=> (and (<= 0 i_10) (< i_10 1)) (and (=> (= (ControlFlow 0 44) (- 0 45)) (>= (U_2_int (MapType0Select Heap@0 (|Seq#Index| (MapType0Select Heap@0 this dst) tid) Integer_value)) (U_2_int (MapType0Select Heap@0 (|Seq#Index| (MapType0Select Heap@0 this src) (+ (* tid half@0) i_10)) Integer_value)))) (=> (>= (U_2_int (MapType0Select Heap@0 (|Seq#Index| (MapType0Select Heap@0 this dst) tid) Integer_value)) (U_2_int (MapType0Select Heap@0 (|Seq#Index| (MapType0Select Heap@0 this src) (+ (* tid half@0) i_10)) Integer_value))) (=> (= (ControlFlow 0 44) 43) anon57_correct))))))
(let ((anon38_correct true))
(let ((anon225_Else_correct  (=> (and (not (and (>= ix_6 0) (and (< ix_6 (|Seq#Length| (MapType0Select Heap@0 this src))) (and (>= jx_6 0) (and (< jx_6 (|Seq#Length| (MapType0Select Heap@0 this src))) (not (= ix_6 jx_6))))))) (= (ControlFlow 0 42) 39)) anon38_correct)))
(let ((anon225_Then_correct  (=> (and (>= ix_6 0) (and (< ix_6 (|Seq#Length| (MapType0Select Heap@0 this src))) (and (>= jx_6 0) (and (< jx_6 (|Seq#Length| (MapType0Select Heap@0 this src))) (not (= ix_6 jx_6)))))) (and (=> (= (ControlFlow 0 40) (- 0 41)) (not (= (|Seq#Index| (MapType0Select Heap@0 this src) ix_6) (|Seq#Index| (MapType0Select Heap@0 this src) jx_6)))) (=> (not (= (|Seq#Index| (MapType0Select Heap@0 this src) ix_6) (|Seq#Index| (MapType0Select Heap@0 this src) jx_6))) (=> (= (ControlFlow 0 40) 39) anon38_correct))))))
(let ((anon125_correct true))
(let ((anon124_correct  (=> (< 0 k@0) (=> (and (<= k@0 half@0) (not (= (|Seq#Index| (MapType0Select ExhaleHeap@0 this dst) tid) null))) (=> (and (and (and (= Mask@24 (MapType1Store Mask@23 (|Seq#Index| (MapType0Select ExhaleHeap@0 this dst) tid) Integer_value (real_2_U (+ (U_2_real (MapType1Select Mask@23 (|Seq#Index| (MapType0Select ExhaleHeap@0 this dst) tid) Integer_value)) FullPerm)))) (state ExhaleHeap@0 Mask@24)) (and (forall ((i_22 Int) ) (!  (=> (and (<= 0 i_22) (< i_22 k@0)) (>= (U_2_int (MapType0Select ExhaleHeap@0 (|Seq#Index| (MapType0Select ExhaleHeap@0 this dst) tid) Integer_value)) (U_2_int (MapType0Select ExhaleHeap@0 (|Seq#Index| (MapType0Select ExhaleHeap@0 this src) (+ (* tid half@0) i_22)) Integer_value))))
 :qid |stdinbpl.1847:26|
 :skolemid |119|
)) (state ExhaleHeap@0 Mask@24))) (and (and (state ExhaleHeap@0 Mask@24) (= Mask@25 Mask@24)) (and (= Heap@1 ExhaleHeap@0) (= (ControlFlow 0 47) 26)))) anon125_correct)))))
(let ((anon271_Else_correct  (=> (not (= 0 0)) (=> (and (= Mask@23 Mask@21) (= (ControlFlow 0 49) 47)) anon124_correct))))
(let ((anon271_Then_correct  (=> (and (= 0 0) (not (= (|Seq#Index| (MapType0Select ExhaleHeap@0 this dst) tid) null))) (=> (and (and (= Mask@22 (MapType1Store Mask@21 (|Seq#Index| (MapType0Select ExhaleHeap@0 this dst) tid) Integer_value (real_2_U (+ (U_2_real (MapType1Select Mask@21 (|Seq#Index| (MapType0Select ExhaleHeap@0 this dst) tid) Integer_value)) FullPerm)))) (state ExhaleHeap@0 Mask@22)) (and (= Mask@23 Mask@22) (= (ControlFlow 0 48) 47))) anon124_correct))))
(let ((anon270_Else_correct  (=> (and (not (= tid 0)) (= Mask@21 Mask@19)) (and (=> (= (ControlFlow 0 52) 48) anon271_Then_correct) (=> (= (ControlFlow 0 52) 49) anon271_Else_correct)))))
(let ((anon270_Then_correct  (=> (= tid 0) (=> (and (and (not (= (|Seq#Index| (MapType0Select ExhaleHeap@0 this dst) 1) null)) (= Mask@20 (MapType1Store Mask@19 (|Seq#Index| (MapType0Select ExhaleHeap@0 this dst) 1) Integer_value (real_2_U (+ (U_2_real (MapType1Select Mask@19 (|Seq#Index| (MapType0Select ExhaleHeap@0 this dst) 1) Integer_value)) FullPerm))))) (and (state ExhaleHeap@0 Mask@20) (= Mask@21 Mask@20))) (and (=> (= (ControlFlow 0 51) 48) anon271_Then_correct) (=> (= (ControlFlow 0 51) 49) anon271_Else_correct))))))
(let ((anon269_Else_correct  (=> (and (not (= tid 0)) (= Mask@19 QPMask@3)) (and (=> (= (ControlFlow 0 54) 51) anon270_Then_correct) (=> (= (ControlFlow 0 54) 52) anon270_Else_correct)))))
(let ((anon269_Then_correct  (=> (= tid 0) (=> (and (and (not (= (|Seq#Index| (MapType0Select ExhaleHeap@0 this dst) 0) null)) (= Mask@18 (MapType1Store QPMask@3 (|Seq#Index| (MapType0Select ExhaleHeap@0 this dst) 0) Integer_value (real_2_U (+ (U_2_real (MapType1Select QPMask@3 (|Seq#Index| (MapType0Select ExhaleHeap@0 this dst) 0) Integer_value)) FullPerm))))) (and (state ExhaleHeap@0 Mask@18) (= Mask@19 Mask@18))) (and (=> (= (ControlFlow 0 53) 51) anon270_Then_correct) (=> (= (ControlFlow 0 53) 52) anon270_Else_correct))))))
(let ((anon268_Then_correct  (=> (= 0 1) (and (=> (= (ControlFlow 0 55) 53) anon269_Then_correct) (=> (= (ControlFlow 0 55) 54) anon269_Else_correct)))))
(let ((anon268_Else_correct  (=> (and (not (= 0 1)) (= Mask@21 QPMask@3)) (and (=> (= (ControlFlow 0 50) 48) anon271_Then_correct) (=> (= (ControlFlow 0 50) 49) anon271_Else_correct)))))
(let ((anon250_Else_correct  (=> (and (and (not (< k@0 half@0)) (state ExhaleHeap@0 Mask@11)) (and (<= 0 tid) (< tid tcount))) (=> (and (and (and (and (= tid lid) (= tcount gsize)) (and (= gid 0) (> wildcard@10 NoPerm))) (and (and (not (= this null)) (= Mask@16 (MapType1Store Mask@11 this src (real_2_U (+ (U_2_real (MapType1Select Mask@11 this src)) wildcard@10))))) (and (state ExhaleHeap@0 Mask@16) (= (|Seq#Length| (MapType0Select ExhaleHeap@0 this src)) gsize)))) (and (and (and (> wildcard@11 NoPerm) (not (= this null))) (and (= Mask@17 (MapType1Store Mask@16 this dst (real_2_U (+ (U_2_real (MapType1Select Mask@16 this dst)) wildcard@11)))) (state ExhaleHeap@0 Mask@17))) (and (and (= (|Seq#Length| (MapType0Select ExhaleHeap@0 this dst)) gsize) (<= 4 gsize)) (and (= (mod gsize 4) 0) (forall ((ix_13 Int) (jx_13 Int) ) (!  (=> (and (>= ix_13 0) (and (< ix_13 (|Seq#Length| (MapType0Select ExhaleHeap@0 this src))) (and (>= jx_13 0) (and (< jx_13 (|Seq#Length| (MapType0Select ExhaleHeap@0 this src))) (not (= ix_13 jx_13)))))) (not (= (|Seq#Index| (MapType0Select ExhaleHeap@0 this src) ix_13) (|Seq#Index| (MapType0Select ExhaleHeap@0 this src) jx_13))))
 :qid |stdinbpl.1776:26|
 :skolemid |111|
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@0 this src) ix_13) (|Seq#Index| (MapType0Select ExhaleHeap@0 this src) jx_13))
)))))) (and (=> (= (ControlFlow 0 56) (- 0 58)) (forall ((i_21 Int) (i_21_1 Int) ) (!  (=> (and (and (and (and (not (= i_21 i_21_1)) (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_21))) (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_21_1))) (< NoPerm (/ (to_real 1) (to_real gsize)))) (< NoPerm (/ (to_real 1) (to_real gsize)))) (not (= (|Seq#Index| (MapType0Select ExhaleHeap@0 this src) i_21) (|Seq#Index| (MapType0Select ExhaleHeap@0 this src) i_21_1))))
 :qid |stdinbpl.1782:21|
 :skolemid |112|
))) (=> (forall ((i_21@@0 Int) (i_21_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_21@@0 i_21_1@@0)) (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_21@@0))) (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_21_1@@0))) (< NoPerm (/ (to_real 1) (to_real gsize)))) (< NoPerm (/ (to_real 1) (to_real gsize)))) (not (= (|Seq#Index| (MapType0Select ExhaleHeap@0 this src) i_21@@0) (|Seq#Index| (MapType0Select ExhaleHeap@0 this src) i_21_1@@0))))
 :qid |stdinbpl.1782:21|
 :skolemid |112|
)) (=> (and (forall ((i_21@@1 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_21@@1)) (< NoPerm (/ (to_real 1) (to_real gsize)))) (and (qpRange8 (|Seq#Index| (MapType0Select ExhaleHeap@0 this src) i_21@@1)) (= (invRecv8 (|Seq#Index| (MapType0Select ExhaleHeap@0 this src) i_21@@1)) i_21@@1)))
 :qid |stdinbpl.1788:28|
 :skolemid |113|
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@0 this src) i_21@@1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 gsize) (int_2_U i_21@@1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_21@@1)))
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@0 this src) i_21@@1))
)) (forall ((o_3@@11 T@U) ) (!  (=> (= (type o_3@@11) RefType) (=> (and (and (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U (invRecv8 o_3@@11))) (< NoPerm (/ (to_real 1) (to_real gsize)))) (qpRange8 o_3@@11)) (= (|Seq#Index| (MapType0Select ExhaleHeap@0 this src) (invRecv8 o_3@@11)) o_3@@11)))
 :qid |stdinbpl.1792:28|
 :skolemid |114|
 :pattern ( (invRecv8 o_3@@11))
))) (and (=> (= (ControlFlow 0 56) (- 0 57)) (forall ((i_21@@2 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_21@@2)) (>= (/ (to_real 1) (to_real gsize)) NoPerm))
 :qid |stdinbpl.1798:21|
 :skolemid |115|
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@0 this src) i_21@@2))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 gsize) (int_2_U i_21@@2)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_21@@2)))
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@0 this src) i_21@@2))
))) (=> (forall ((i_21@@3 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_21@@3)) (>= (/ (to_real 1) (to_real gsize)) NoPerm))
 :qid |stdinbpl.1798:21|
 :skolemid |115|
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@0 this src) i_21@@3))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 gsize) (int_2_U i_21@@3)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_21@@3)))
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@0 this src) i_21@@3))
)) (=> (forall ((i_21@@4 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_21@@4)) (> (/ (to_real 1) (to_real gsize)) NoPerm)) (not (= (|Seq#Index| (MapType0Select ExhaleHeap@0 this src) i_21@@4) null)))
 :qid |stdinbpl.1804:28|
 :skolemid |116|
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@0 this src) i_21@@4))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 gsize) (int_2_U i_21@@4)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_21@@4)))
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@0 this src) i_21@@4))
)) (=> (and (and (forall ((o_3@@12 T@U) ) (!  (=> (= (type o_3@@12) RefType) (and (=> (and (and (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U (invRecv8 o_3@@12))) (< NoPerm (/ (to_real 1) (to_real gsize)))) (qpRange8 o_3@@12)) (and (=> (< NoPerm (/ (to_real 1) (to_real gsize))) (= (|Seq#Index| (MapType0Select ExhaleHeap@0 this src) (invRecv8 o_3@@12)) o_3@@12)) (= (U_2_real (MapType1Select QPMask@3 o_3@@12 Integer_value)) (+ (U_2_real (MapType1Select Mask@17 o_3@@12 Integer_value)) (/ (to_real 1) (to_real gsize)))))) (=> (not (and (and (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U (invRecv8 o_3@@12))) (< NoPerm (/ (to_real 1) (to_real gsize)))) (qpRange8 o_3@@12))) (= (U_2_real (MapType1Select QPMask@3 o_3@@12 Integer_value)) (U_2_real (MapType1Select Mask@17 o_3@@12 Integer_value))))))
 :qid |stdinbpl.1810:28|
 :skolemid |117|
 :pattern ( (MapType1Select QPMask@3 o_3@@12 Integer_value))
)) (forall ((o_3@@13 T@U) (f_5@@3 T@U) ) (! (let ((B@@15 (FieldTypeInv1 (type f_5@@3))))
(let ((A@@16 (FieldTypeInv0 (type f_5@@3))))
 (=> (and (and (= (type o_3@@13) RefType) (= (type f_5@@3) (FieldType A@@16 B@@15))) (not (= f_5@@3 Integer_value))) (= (U_2_real (MapType1Select Mask@17 o_3@@13 f_5@@3)) (U_2_real (MapType1Select QPMask@3 o_3@@13 f_5@@3))))))
 :qid |stdinbpl.1814:35|
 :skolemid |118|
 :pattern ( (MapType1Select Mask@17 o_3@@13 f_5@@3))
 :pattern ( (MapType1Select QPMask@3 o_3@@13 f_5@@3))
))) (and (state ExhaleHeap@0 QPMask@3) (= 0 0))) (and (=> (= (ControlFlow 0 56) 55) anon268_Then_correct) (=> (= (ControlFlow 0 56) 50) anon268_Else_correct)))))))))))))
(let ((anon234_Else_correct  (=> (and (forall ((i_11_1 Int) ) (!  (=> (and (<= 0 i_11_1) (< i_11_1 1)) (>= (U_2_int (MapType0Select Heap@0 (|Seq#Index| (MapType0Select Heap@0 this dst) tid) Integer_value)) (U_2_int (MapType0Select Heap@0 (|Seq#Index| (MapType0Select Heap@0 this src) (+ (* tid half@0) i_11_1)) Integer_value))))
 :qid |stdinbpl.1209:28|
 :skolemid |83|
)) (IdenticalOnKnownLocations Heap@0 ExhaleHeap@0 Mask@11)) (and (and (=> (= (ControlFlow 0 207) 204) anon236_Then_correct) (=> (= (ControlFlow 0 207) 141) anon250_Then_correct)) (=> (= (ControlFlow 0 207) 56) anon250_Else_correct)))))
(let ((anon54_correct  (=> (= Mask@11 (MapType1Store Mask@10 (|Seq#Index| (MapType0Select Heap@0 this dst) tid) Integer_value (real_2_U (- (U_2_real (MapType1Select Mask@10 (|Seq#Index| (MapType0Select Heap@0 this dst) tid) Integer_value)) FullPerm)))) (and (and (=> (= (ControlFlow 0 208) 207) anon234_Else_correct) (=> (= (ControlFlow 0 208) 44) anon235_Then_correct)) (=> (= (ControlFlow 0 208) 46) anon235_Else_correct)))))
(let ((anon233_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 211) 208)) anon54_correct)))
(let ((anon233_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 209) (- 0 210)) (<= FullPerm (U_2_real (MapType1Select Mask@10 (|Seq#Index| (MapType0Select Heap@0 this dst) tid) Integer_value)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@10 (|Seq#Index| (MapType0Select Heap@0 this dst) tid) Integer_value))) (=> (= (ControlFlow 0 209) 208) anon54_correct))))))
(let ((anon52_correct  (and (=> (= (ControlFlow 0 212) (- 0 214)) (< 0 1)) (=> (< 0 1) (and (=> (= (ControlFlow 0 212) (- 0 213)) (<= 1 half@0)) (=> (<= 1 half@0) (and (=> (= (ControlFlow 0 212) 209) anon233_Then_correct) (=> (= (ControlFlow 0 212) 211) anon233_Else_correct))))))))
(let ((anon51_correct  (=> (= Mask@9 (MapType1Store Mask@8 (|Seq#Index| (MapType0Select Heap@0 this dst) tid) Integer_value (real_2_U (- (U_2_real (MapType1Select Mask@8 (|Seq#Index| (MapType0Select Heap@0 this dst) tid) Integer_value)) FullPerm)))) (=> (and (= Mask@10 Mask@9) (= (ControlFlow 0 216) 212)) anon52_correct))))
(let ((anon232_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 219) 216)) anon51_correct)))
(let ((anon232_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 217) (- 0 218)) (<= FullPerm (U_2_real (MapType1Select Mask@8 (|Seq#Index| (MapType0Select Heap@0 this dst) tid) Integer_value)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@8 (|Seq#Index| (MapType0Select Heap@0 this dst) tid) Integer_value))) (=> (= (ControlFlow 0 217) 216) anon51_correct))))))
(let ((anon231_Then_correct  (=> (= 0 0) (and (=> (= (ControlFlow 0 220) 217) anon232_Then_correct) (=> (= (ControlFlow 0 220) 219) anon232_Else_correct)))))
(let ((anon231_Else_correct  (=> (not (= 0 0)) (=> (and (= Mask@10 Mask@8) (= (ControlFlow 0 215) 212)) anon52_correct))))
(let ((anon47_correct  (=> (and (= Mask@7 (MapType1Store Mask@6 (|Seq#Index| (MapType0Select Heap@0 this dst) 1) Integer_value (real_2_U (- (U_2_real (MapType1Select Mask@6 (|Seq#Index| (MapType0Select Heap@0 this dst) 1) Integer_value)) FullPerm)))) (= Mask@8 Mask@7)) (and (=> (= (ControlFlow 0 223) 220) anon231_Then_correct) (=> (= (ControlFlow 0 223) 215) anon231_Else_correct)))))
(let ((anon230_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 226) 223)) anon47_correct)))
(let ((anon230_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 224) (- 0 225)) (<= FullPerm (U_2_real (MapType1Select Mask@6 (|Seq#Index| (MapType0Select Heap@0 this dst) 1) Integer_value)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@6 (|Seq#Index| (MapType0Select Heap@0 this dst) 1) Integer_value))) (=> (= (ControlFlow 0 224) 223) anon47_correct))))))
(let ((anon229_Then_correct  (=> (= tid 0) (and (=> (= (ControlFlow 0 227) 224) anon230_Then_correct) (=> (= (ControlFlow 0 227) 226) anon230_Else_correct)))))
(let ((anon229_Else_correct  (=> (and (not (= tid 0)) (= Mask@8 Mask@6)) (and (=> (= (ControlFlow 0 222) 220) anon231_Then_correct) (=> (= (ControlFlow 0 222) 215) anon231_Else_correct)))))
(let ((anon43_correct  (=> (and (= Mask@5 (MapType1Store QPMask@1 (|Seq#Index| (MapType0Select Heap@0 this dst) 0) Integer_value (real_2_U (- (U_2_real (MapType1Select QPMask@1 (|Seq#Index| (MapType0Select Heap@0 this dst) 0) Integer_value)) FullPerm)))) (= Mask@6 Mask@5)) (and (=> (= (ControlFlow 0 229) 227) anon229_Then_correct) (=> (= (ControlFlow 0 229) 222) anon229_Else_correct)))))
(let ((anon228_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 232) 229)) anon43_correct)))
(let ((anon228_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 230) (- 0 231)) (<= FullPerm (U_2_real (MapType1Select QPMask@1 (|Seq#Index| (MapType0Select Heap@0 this dst) 0) Integer_value)))) (=> (<= FullPerm (U_2_real (MapType1Select QPMask@1 (|Seq#Index| (MapType0Select Heap@0 this dst) 0) Integer_value))) (=> (= (ControlFlow 0 230) 229) anon43_correct))))))
(let ((anon227_Then_correct  (=> (= tid 0) (and (=> (= (ControlFlow 0 233) 230) anon228_Then_correct) (=> (= (ControlFlow 0 233) 232) anon228_Else_correct)))))
(let ((anon227_Else_correct  (=> (and (not (= tid 0)) (= Mask@6 QPMask@1)) (and (=> (= (ControlFlow 0 228) 227) anon229_Then_correct) (=> (= (ControlFlow 0 228) 222) anon229_Else_correct)))))
(let ((anon226_Then_correct  (=> (= 0 1) (and (=> (= (ControlFlow 0 234) 233) anon227_Then_correct) (=> (= (ControlFlow 0 234) 228) anon227_Else_correct)))))
(let ((anon226_Else_correct  (=> (and (not (= 0 1)) (= Mask@8 QPMask@1)) (and (=> (= (ControlFlow 0 221) 220) anon231_Then_correct) (=> (= (ControlFlow 0 221) 215) anon231_Else_correct)))))
(let ((anon224_Else_correct  (=> (forall ((ix_7_1 Int) (jx_7_1 Int) ) (!  (=> (and (>= ix_7_1 0) (and (< ix_7_1 (|Seq#Length| (MapType0Select Heap@0 this src))) (and (>= jx_7_1 0) (and (< jx_7_1 (|Seq#Length| (MapType0Select Heap@0 this src))) (not (= ix_7_1 jx_7_1)))))) (not (= (|Seq#Index| (MapType0Select Heap@0 this src) ix_7_1) (|Seq#Index| (MapType0Select Heap@0 this src) jx_7_1))))
 :qid |stdinbpl.1115:28|
 :skolemid |75|
 :pattern ( (|Seq#Index| (MapType0Select Heap@0 this src) ix_7_1) (|Seq#Index| (MapType0Select Heap@0 this src) jx_7_1))
)) (and (=> (= (ControlFlow 0 235) (- 0 239)) (forall ((i_9 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_9)) (dummyFunction (MapType0Select Heap@0 (|Seq#Index| (MapType0Select Heap@0 this src) i_9) Integer_value))) (>= (/ (to_real 1) (to_real gsize)) NoPerm))
 :qid |stdinbpl.1123:25|
 :skolemid |76|
 :pattern ( (|Seq#Index| (MapType0Select Heap@0 this src) i_9))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 gsize) (int_2_U i_9)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_9)))
 :pattern ( (|Seq#Index| (MapType0Select Heap@0 this src) i_9))
))) (=> (forall ((i_9@@0 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_9@@0)) (dummyFunction (MapType0Select Heap@0 (|Seq#Index| (MapType0Select Heap@0 this src) i_9@@0) Integer_value))) (>= (/ (to_real 1) (to_real gsize)) NoPerm))
 :qid |stdinbpl.1123:25|
 :skolemid |76|
 :pattern ( (|Seq#Index| (MapType0Select Heap@0 this src) i_9@@0))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 gsize) (int_2_U i_9@@0)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_9@@0)))
 :pattern ( (|Seq#Index| (MapType0Select Heap@0 this src) i_9@@0))
)) (and (=> (= (ControlFlow 0 235) (- 0 238)) (forall ((i_9@@1 Int) (i_9_1 Int) ) (!  (=> (and (and (and (and (not (= i_9@@1 i_9_1)) (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_9@@1))) (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_9_1))) (< NoPerm (/ (to_real 1) (to_real gsize)))) (< NoPerm (/ (to_real 1) (to_real gsize)))) (not (= (|Seq#Index| (MapType0Select Heap@0 this src) i_9@@1) (|Seq#Index| (MapType0Select Heap@0 this src) i_9_1))))
 :qid |stdinbpl.1130:25|
 :skolemid |77|
 :pattern ( (neverTriggered4 i_9@@1) (neverTriggered4 i_9_1))
))) (=> (forall ((i_9@@2 Int) (i_9_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_9@@2 i_9_1@@0)) (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_9@@2))) (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_9_1@@0))) (< NoPerm (/ (to_real 1) (to_real gsize)))) (< NoPerm (/ (to_real 1) (to_real gsize)))) (not (= (|Seq#Index| (MapType0Select Heap@0 this src) i_9@@2) (|Seq#Index| (MapType0Select Heap@0 this src) i_9_1@@0))))
 :qid |stdinbpl.1130:25|
 :skolemid |77|
 :pattern ( (neverTriggered4 i_9@@2) (neverTriggered4 i_9_1@@0))
)) (and (=> (= (ControlFlow 0 235) (- 0 237)) (forall ((i_9@@3 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_9@@3)) (>= (U_2_real (MapType1Select Mask@4 (|Seq#Index| (MapType0Select Heap@0 this src) i_9@@3) Integer_value)) (/ (to_real 1) (to_real gsize))))
 :qid |stdinbpl.1137:25|
 :skolemid |78|
 :pattern ( (|Seq#Index| (MapType0Select Heap@0 this src) i_9@@3))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 gsize) (int_2_U i_9@@3)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_9@@3)))
 :pattern ( (|Seq#Index| (MapType0Select Heap@0 this src) i_9@@3))
))) (=> (forall ((i_9@@4 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_9@@4)) (>= (U_2_real (MapType1Select Mask@4 (|Seq#Index| (MapType0Select Heap@0 this src) i_9@@4) Integer_value)) (/ (to_real 1) (to_real gsize))))
 :qid |stdinbpl.1137:25|
 :skolemid |78|
 :pattern ( (|Seq#Index| (MapType0Select Heap@0 this src) i_9@@4))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 gsize) (int_2_U i_9@@4)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_9@@4)))
 :pattern ( (|Seq#Index| (MapType0Select Heap@0 this src) i_9@@4))
)) (=> (and (and (forall ((i_9@@5 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_9@@5)) (< NoPerm (/ (to_real 1) (to_real gsize)))) (and (qpRange4 (|Seq#Index| (MapType0Select Heap@0 this src) i_9@@5)) (= (invRecv4 (|Seq#Index| (MapType0Select Heap@0 this src) i_9@@5)) i_9@@5)))
 :qid |stdinbpl.1143:30|
 :skolemid |79|
 :pattern ( (|Seq#Index| (MapType0Select Heap@0 this src) i_9@@5))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 gsize) (int_2_U i_9@@5)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_9@@5)))
 :pattern ( (|Seq#Index| (MapType0Select Heap@0 this src) i_9@@5))
)) (forall ((o_3@@14 T@U) ) (!  (=> (= (type o_3@@14) RefType) (=> (and (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U (invRecv4 o_3@@14))) (and (< NoPerm (/ (to_real 1) (to_real gsize))) (qpRange4 o_3@@14))) (= (|Seq#Index| (MapType0Select Heap@0 this src) (invRecv4 o_3@@14)) o_3@@14)))
 :qid |stdinbpl.1147:30|
 :skolemid |80|
 :pattern ( (invRecv4 o_3@@14))
))) (and (forall ((o_3@@15 T@U) ) (!  (=> (= (type o_3@@15) RefType) (and (=> (and (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U (invRecv4 o_3@@15))) (and (< NoPerm (/ (to_real 1) (to_real gsize))) (qpRange4 o_3@@15))) (and (= (|Seq#Index| (MapType0Select Heap@0 this src) (invRecv4 o_3@@15)) o_3@@15) (= (U_2_real (MapType1Select QPMask@1 o_3@@15 Integer_value)) (- (U_2_real (MapType1Select Mask@4 o_3@@15 Integer_value)) (/ (to_real 1) (to_real gsize)))))) (=> (not (and (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U (invRecv4 o_3@@15))) (and (< NoPerm (/ (to_real 1) (to_real gsize))) (qpRange4 o_3@@15)))) (= (U_2_real (MapType1Select QPMask@1 o_3@@15 Integer_value)) (U_2_real (MapType1Select Mask@4 o_3@@15 Integer_value))))))
 :qid |stdinbpl.1153:30|
 :skolemid |81|
 :pattern ( (MapType1Select QPMask@1 o_3@@15 Integer_value))
)) (forall ((o_3@@16 T@U) (f_5@@4 T@U) ) (! (let ((B@@16 (FieldTypeInv1 (type f_5@@4))))
(let ((A@@17 (FieldTypeInv0 (type f_5@@4))))
 (=> (and (and (= (type o_3@@16) RefType) (= (type f_5@@4) (FieldType A@@17 B@@16))) (not (= f_5@@4 Integer_value))) (= (U_2_real (MapType1Select Mask@4 o_3@@16 f_5@@4)) (U_2_real (MapType1Select QPMask@1 o_3@@16 f_5@@4))))))
 :qid |stdinbpl.1159:37|
 :skolemid |82|
 :pattern ( (MapType1Select QPMask@1 o_3@@16 f_5@@4))
)))) (and (=> (= (ControlFlow 0 235) (- 0 236)) (= 0 0)) (=> (= 0 0) (and (=> (= (ControlFlow 0 235) 234) anon226_Then_correct) (=> (= (ControlFlow 0 235) 221) anon226_Else_correct))))))))))))))
(let ((anon223_Then_correct  (=> (< tid 2) (and (=> (= (ControlFlow 0 240) (- 0 259)) (HasDirectPerm Mask@2 this dst)) (=> (HasDirectPerm Mask@2 this dst) (and (=> (= (ControlFlow 0 240) (- 0 258)) (>= tid 0)) (=> (>= tid 0) (and (=> (= (ControlFlow 0 240) (- 0 257)) (< tid (|Seq#Length| (MapType0Select Heap@@9 this dst)))) (=> (< tid (|Seq#Length| (MapType0Select Heap@@9 this dst))) (and (=> (= (ControlFlow 0 240) (- 0 256)) (HasDirectPerm Mask@2 this src)) (=> (HasDirectPerm Mask@2 this src) (and (=> (= (ControlFlow 0 240) (- 0 255)) (>= tid 0)) (=> (>= tid 0) (and (=> (= (ControlFlow 0 240) (- 0 254)) (< tid (|Seq#Length| (MapType0Select Heap@@9 this src)))) (=> (< tid (|Seq#Length| (MapType0Select Heap@@9 this src))) (and (=> (= (ControlFlow 0 240) (- 0 253)) (HasDirectPerm Mask@2 (|Seq#Index| (MapType0Select Heap@@9 this src) tid) Integer_value)) (=> (HasDirectPerm Mask@2 (|Seq#Index| (MapType0Select Heap@@9 this src) tid) Integer_value) (and (=> (= (ControlFlow 0 240) (- 0 252)) (= FullPerm (U_2_real (MapType1Select Mask@2 (|Seq#Index| (MapType0Select Heap@@9 this dst) tid) Integer_value)))) (=> (= FullPerm (U_2_real (MapType1Select Mask@2 (|Seq#Index| (MapType0Select Heap@@9 this dst) tid) Integer_value))) (=> (= Heap@0 (MapType0Store Heap@@9 (|Seq#Index| (MapType0Select Heap@@9 this dst) tid) Integer_value (MapType0Select Heap@@9 (|Seq#Index| (MapType0Select Heap@@9 this src) tid) Integer_value))) (=> (and (state Heap@0 Mask@2) (state Heap@0 Mask@2)) (and (=> (= (ControlFlow 0 240) (- 0 251)) (<= 0 tid)) (=> (<= 0 tid) (and (=> (= (ControlFlow 0 240) (- 0 250)) (< tid tcount)) (=> (< tid tcount) (and (=> (= (ControlFlow 0 240) (- 0 249)) (= tid lid)) (=> (= tid lid) (and (=> (= (ControlFlow 0 240) (- 0 248)) (= tcount gsize)) (=> (= tcount gsize) (and (=> (= (ControlFlow 0 240) (- 0 247)) (= gid 0)) (=> (= gid 0) (and (=> (= (ControlFlow 0 240) (- 0 246)) (> (U_2_real (MapType1Select Mask@2 this src)) NoPerm)) (=> (> (U_2_real (MapType1Select Mask@2 this src)) NoPerm) (=> (> wildcard@4 NoPerm) (=> (and (< wildcard@4 (U_2_real (MapType1Select Mask@2 this src))) (= Mask@3 (MapType1Store Mask@2 this src (real_2_U (- (U_2_real (MapType1Select Mask@2 this src)) wildcard@4))))) (and (=> (= (ControlFlow 0 240) (- 0 245)) (= (|Seq#Length| (MapType0Select Heap@0 this src)) gsize)) (=> (= (|Seq#Length| (MapType0Select Heap@0 this src)) gsize) (and (=> (= (ControlFlow 0 240) (- 0 244)) (> (U_2_real (MapType1Select Mask@3 this dst)) NoPerm)) (=> (> (U_2_real (MapType1Select Mask@3 this dst)) NoPerm) (=> (> wildcard@5 NoPerm) (=> (and (< wildcard@5 (U_2_real (MapType1Select Mask@3 this dst))) (= Mask@4 (MapType1Store Mask@3 this dst (real_2_U (- (U_2_real (MapType1Select Mask@3 this dst)) wildcard@5))))) (and (=> (= (ControlFlow 0 240) (- 0 243)) (= (|Seq#Length| (MapType0Select Heap@0 this dst)) gsize)) (=> (= (|Seq#Length| (MapType0Select Heap@0 this dst)) gsize) (and (=> (= (ControlFlow 0 240) (- 0 242)) (<= 4 gsize)) (=> (<= 4 gsize) (and (=> (= (ControlFlow 0 240) (- 0 241)) (= (mod gsize 4) 0)) (=> (= (mod gsize 4) 0) (and (and (=> (= (ControlFlow 0 240) 235) anon224_Else_correct) (=> (= (ControlFlow 0 240) 40) anon225_Then_correct)) (=> (= (ControlFlow 0 240) 42) anon225_Else_correct)))))))))))))))))))))))))))))))))))))))))))))))))
(let ((anon223_Else_correct  (=> (and (and (<= 2 tid) (= Mask@25 Mask@2)) (and (= Heap@1 Heap@@9) (= (ControlFlow 0 38) 26))) anon125_correct)))
(let ((anon211_Else_correct  (=> (state Heap@@9 Mask@2) (=> (and (and (= half@0 (div gsize 2)) (state Heap@@9 Mask@2)) (and (= offset@0 (ite (= tid 0) 0 half@0)) (state Heap@@9 Mask@2))) (and (=> (= (ControlFlow 0 260) 240) anon223_Then_correct) (=> (= (ControlFlow 0 260) 38) anon223_Else_correct))))))
(let ((anon209_Else_correct  (and (=> (= (ControlFlow 0 315) (- 0 320)) (forall ((i_1 Int) (i_1_1 Int) ) (!  (=> (and (and (and (and (not (= i_1 i_1_1)) (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_1))) (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_1_1))) (< NoPerm (/ (to_real 1) (to_real gsize)))) (< NoPerm (/ (to_real 1) (to_real gsize)))) (not (= (|Seq#Index| (MapType0Select Heap@@9 this src) i_1) (|Seq#Index| (MapType0Select Heap@@9 this src) i_1_1))))
 :qid |stdinbpl.778:15|
 :skolemid |59|
))) (=> (forall ((i_1@@0 Int) (i_1_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_1@@0 i_1_1@@0)) (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_1@@0))) (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_1_1@@0))) (< NoPerm (/ (to_real 1) (to_real gsize)))) (< NoPerm (/ (to_real 1) (to_real gsize)))) (not (= (|Seq#Index| (MapType0Select Heap@@9 this src) i_1@@0) (|Seq#Index| (MapType0Select Heap@@9 this src) i_1_1@@0))))
 :qid |stdinbpl.778:15|
 :skolemid |59|
)) (=> (and (forall ((i_1@@1 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_1@@1)) (< NoPerm (/ (to_real 1) (to_real gsize)))) (and (qpRange1 (|Seq#Index| (MapType0Select Heap@@9 this src) i_1@@1)) (= (invRecv1 (|Seq#Index| (MapType0Select Heap@@9 this src) i_1@@1)) i_1@@1)))
 :qid |stdinbpl.784:22|
 :skolemid |60|
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 this src) i_1@@1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 gsize) (int_2_U i_1@@1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_1@@1)))
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 this src) i_1@@1))
)) (forall ((o_3@@17 T@U) ) (!  (=> (= (type o_3@@17) RefType) (=> (and (and (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U (invRecv1 o_3@@17))) (< NoPerm (/ (to_real 1) (to_real gsize)))) (qpRange1 o_3@@17)) (= (|Seq#Index| (MapType0Select Heap@@9 this src) (invRecv1 o_3@@17)) o_3@@17)))
 :qid |stdinbpl.788:22|
 :skolemid |61|
 :pattern ( (invRecv1 o_3@@17))
))) (and (=> (= (ControlFlow 0 315) (- 0 319)) (forall ((i_1@@2 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_1@@2)) (>= (/ (to_real 1) (to_real gsize)) NoPerm))
 :qid |stdinbpl.794:15|
 :skolemid |62|
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 this src) i_1@@2))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 gsize) (int_2_U i_1@@2)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_1@@2)))
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 this src) i_1@@2))
))) (=> (forall ((i_1@@3 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_1@@3)) (>= (/ (to_real 1) (to_real gsize)) NoPerm))
 :qid |stdinbpl.794:15|
 :skolemid |62|
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 this src) i_1@@3))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 gsize) (int_2_U i_1@@3)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_1@@3)))
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 this src) i_1@@3))
)) (=> (forall ((i_1@@4 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_1@@4)) (> (/ (to_real 1) (to_real gsize)) NoPerm)) (not (= (|Seq#Index| (MapType0Select Heap@@9 this src) i_1@@4) null)))
 :qid |stdinbpl.800:22|
 :skolemid |63|
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 this src) i_1@@4))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 gsize) (int_2_U i_1@@4)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i_1@@4)))
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 this src) i_1@@4))
)) (=> (and (and (forall ((o_3@@18 T@U) ) (!  (=> (= (type o_3@@18) RefType) (and (=> (and (and (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U (invRecv1 o_3@@18))) (< NoPerm (/ (to_real 1) (to_real gsize)))) (qpRange1 o_3@@18)) (and (=> (< NoPerm (/ (to_real 1) (to_real gsize))) (= (|Seq#Index| (MapType0Select Heap@@9 this src) (invRecv1 o_3@@18)) o_3@@18)) (= (U_2_real (MapType1Select QPMask@0 o_3@@18 Integer_value)) (+ (U_2_real (MapType1Select Mask@1 o_3@@18 Integer_value)) (/ (to_real 1) (to_real gsize)))))) (=> (not (and (and (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U (invRecv1 o_3@@18))) (< NoPerm (/ (to_real 1) (to_real gsize)))) (qpRange1 o_3@@18))) (= (U_2_real (MapType1Select QPMask@0 o_3@@18 Integer_value)) (U_2_real (MapType1Select Mask@1 o_3@@18 Integer_value))))))
 :qid |stdinbpl.806:22|
 :skolemid |64|
 :pattern ( (MapType1Select QPMask@0 o_3@@18 Integer_value))
)) (forall ((o_3@@19 T@U) (f_5@@5 T@U) ) (! (let ((B@@17 (FieldTypeInv1 (type f_5@@5))))
(let ((A@@18 (FieldTypeInv0 (type f_5@@5))))
 (=> (and (and (= (type o_3@@19) RefType) (= (type f_5@@5) (FieldType A@@18 B@@17))) (not (= f_5@@5 Integer_value))) (= (U_2_real (MapType1Select Mask@1 o_3@@19 f_5@@5)) (U_2_real (MapType1Select QPMask@0 o_3@@19 f_5@@5))))))
 :qid |stdinbpl.810:29|
 :skolemid |65|
 :pattern ( (MapType1Select Mask@1 o_3@@19 f_5@@5))
 :pattern ( (MapType1Select QPMask@0 o_3@@19 f_5@@5))
))) (and (state Heap@@9 QPMask@0) (state Heap@@9 QPMask@0))) (and (=> (= (ControlFlow 0 315) (- 0 318)) (HasDirectPerm QPMask@0 this dst)) (=> (HasDirectPerm QPMask@0 this dst) (and (=> (= (ControlFlow 0 315) (- 0 317)) (>= tid 0)) (=> (>= tid 0) (and (=> (= (ControlFlow 0 315) (- 0 316)) (< tid (|Seq#Length| (MapType0Select Heap@@9 this dst)))) (=> (< tid (|Seq#Length| (MapType0Select Heap@@9 this dst))) (=> (and (and (not (= (|Seq#Index| (MapType0Select Heap@@9 this dst) tid) null)) (= Mask@2 (MapType1Store QPMask@0 (|Seq#Index| (MapType0Select Heap@@9 this dst) tid) Integer_value (real_2_U (+ (U_2_real (MapType1Select QPMask@0 (|Seq#Index| (MapType0Select Heap@@9 this dst) tid) Integer_value)) FullPerm))))) (and (state Heap@@9 Mask@2) (state Heap@@9 Mask@2))) (and (=> (= (ControlFlow 0 315) 312) anon211_Then_correct) (=> (= (ControlFlow 0 315) 260) anon211_Else_correct))))))))))))))))))
(let ((anon11_correct true))
(let ((anon210_Else_correct  (=> (and (not (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i@@6))) (= (ControlFlow 0 24) 18)) anon11_correct)))
(let ((anon210_Then_correct  (=> (|Seq#Contains| (|Seq#Range| 0 gsize) (int_2_U i@@6)) (and (=> (= (ControlFlow 0 19) (- 0 23)) (HasDirectPerm Mask@1 this src)) (=> (HasDirectPerm Mask@1 this src) (and (=> (= (ControlFlow 0 19) (- 0 22)) (>= i@@6 0)) (=> (>= i@@6 0) (and (=> (= (ControlFlow 0 19) (- 0 21)) (< i@@6 (|Seq#Length| (MapType0Select Heap@@9 this src)))) (=> (< i@@6 (|Seq#Length| (MapType0Select Heap@@9 this src))) (and (=> (= (ControlFlow 0 19) (- 0 20)) (not (= gsize 0))) (=> (not (= gsize 0)) (=> (= (ControlFlow 0 19) 18) anon11_correct))))))))))))
(let ((anon204_Else_correct  (=> (and (forall ((ix_1 Int) (jx_1 Int) ) (!  (=> (and (>= ix_1 0) (and (< ix_1 (|Seq#Length| (MapType0Select Heap@@9 this src))) (and (>= jx_1 0) (and (< jx_1 (|Seq#Length| (MapType0Select Heap@@9 this src))) (not (= ix_1 jx_1)))))) (not (= (|Seq#Index| (MapType0Select Heap@@9 this src) ix_1) (|Seq#Index| (MapType0Select Heap@@9 this src) jx_1))))
 :qid |stdinbpl.756:20|
 :skolemid |58|
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 this src) ix_1) (|Seq#Index| (MapType0Select Heap@@9 this src) jx_1))
)) (state Heap@@9 Mask@1)) (and (and (=> (= (ControlFlow 0 321) 315) anon209_Else_correct) (=> (= (ControlFlow 0 321) 19) anon210_Then_correct)) (=> (= (ControlFlow 0 321) 24) anon210_Else_correct)))))
(let ((anon7_correct true))
(let ((anon208_Else_correct  (=> (and (not (and (>= ix 0) (and (< ix (|Seq#Length| (MapType0Select Heap@@9 this src))) (and (>= jx 0) (and (< jx (|Seq#Length| (MapType0Select Heap@@9 this src))) (not (= ix jx))))))) (= (ControlFlow 0 9) 1)) anon7_correct)))
(let ((anon208_Then_correct  (=> (and (>= ix 0) (and (< ix (|Seq#Length| (MapType0Select Heap@@9 this src))) (and (>= jx 0) (and (< jx (|Seq#Length| (MapType0Select Heap@@9 this src))) (not (= ix jx)))))) (and (=> (= (ControlFlow 0 2) (- 0 8)) (HasDirectPerm Mask@1 this src)) (=> (HasDirectPerm Mask@1 this src) (and (=> (= (ControlFlow 0 2) (- 0 7)) (>= ix 0)) (=> (>= ix 0) (and (=> (= (ControlFlow 0 2) (- 0 6)) (< ix (|Seq#Length| (MapType0Select Heap@@9 this src)))) (=> (< ix (|Seq#Length| (MapType0Select Heap@@9 this src))) (and (=> (= (ControlFlow 0 2) (- 0 5)) (HasDirectPerm Mask@1 this src)) (=> (HasDirectPerm Mask@1 this src) (and (=> (= (ControlFlow 0 2) (- 0 4)) (>= jx 0)) (=> (>= jx 0) (and (=> (= (ControlFlow 0 2) (- 0 3)) (< jx (|Seq#Length| (MapType0Select Heap@@9 this src)))) (=> (< jx (|Seq#Length| (MapType0Select Heap@@9 this src))) (=> (= (ControlFlow 0 2) 1) anon7_correct))))))))))))))))
(let ((anon207_Else_correct  (=> (> 0 jx) (and (=> (= (ControlFlow 0 14) 2) anon208_Then_correct) (=> (= (ControlFlow 0 14) 9) anon208_Else_correct)))))
(let ((anon207_Then_correct  (=> (>= jx 0) (and (=> (= (ControlFlow 0 12) (- 0 13)) (HasDirectPerm Mask@1 this src)) (=> (HasDirectPerm Mask@1 this src) (and (=> (= (ControlFlow 0 12) 2) anon208_Then_correct) (=> (= (ControlFlow 0 12) 9) anon208_Else_correct)))))))
(let ((anon206_Then_correct  (=> (< ix (|Seq#Length| (MapType0Select Heap@@9 this src))) (and (=> (= (ControlFlow 0 15) 12) anon207_Then_correct) (=> (= (ControlFlow 0 15) 14) anon207_Else_correct)))))
(let ((anon206_Else_correct  (=> (<= (|Seq#Length| (MapType0Select Heap@@9 this src)) ix) (and (=> (= (ControlFlow 0 11) 2) anon208_Then_correct) (=> (= (ControlFlow 0 11) 9) anon208_Else_correct)))))
(let ((anon205_Then_correct  (=> (>= ix 0) (and (=> (= (ControlFlow 0 16) (- 0 17)) (HasDirectPerm Mask@1 this src)) (=> (HasDirectPerm Mask@1 this src) (and (=> (= (ControlFlow 0 16) 15) anon206_Then_correct) (=> (= (ControlFlow 0 16) 11) anon206_Else_correct)))))))
(let ((anon205_Else_correct  (=> (> 0 ix) (and (=> (= (ControlFlow 0 10) 2) anon208_Then_correct) (=> (= (ControlFlow 0 10) 9) anon208_Else_correct)))))
(let ((anon0_correct  (=> (state Heap@@9 ZeroMask) (=> (and (and (and (and (U_2_bool (MapType0Select Heap@@9 this $allocated)) (<= 0 tid)) (and (state Heap@@9 ZeroMask) (< tid tcount))) (and (and (state Heap@@9 ZeroMask) (= tid lid)) (and (state Heap@@9 ZeroMask) (= tcount gsize)))) (and (and (and (state Heap@@9 ZeroMask) (= gid 0)) (and (state Heap@@9 ZeroMask) (> wildcard@0 NoPerm))) (and (and (not (= this null)) (= Mask@0 (MapType1Store ZeroMask this src (real_2_U (+ (U_2_real (MapType1Select ZeroMask this src)) wildcard@0))))) (and (state Heap@@9 Mask@0) (state Heap@@9 Mask@0))))) (and (=> (= (ControlFlow 0 322) (- 0 324)) (HasDirectPerm Mask@0 this src)) (=> (HasDirectPerm Mask@0 this src) (=> (= (|Seq#Length| (MapType0Select Heap@@9 this src)) gsize) (=> (and (state Heap@@9 Mask@0) (> wildcard@1 NoPerm)) (=> (and (and (not (= this null)) (= Mask@1 (MapType1Store Mask@0 this dst (real_2_U (+ (U_2_real (MapType1Select Mask@0 this dst)) wildcard@1))))) (and (state Heap@@9 Mask@1) (state Heap@@9 Mask@1))) (and (=> (= (ControlFlow 0 322) (- 0 323)) (HasDirectPerm Mask@1 this dst)) (=> (HasDirectPerm Mask@1 this dst) (=> (and (= (|Seq#Length| (MapType0Select Heap@@9 this dst)) gsize) (state Heap@@9 Mask@1)) (=> (and (and (<= 4 gsize) (state Heap@@9 Mask@1)) (and (= (mod gsize 4) 0) (state Heap@@9 Mask@1))) (and (and (=> (= (ControlFlow 0 322) 321) anon204_Else_correct) (=> (= (ControlFlow 0 322) 16) anon205_Then_correct)) (=> (= (ControlFlow 0 322) 10) anon205_Else_correct)))))))))))))))
(let ((PreconditionGeneratedEntry_correct  (=> (and (and (> wildcard NoPerm) true) (= (ControlFlow 0 325) 322)) anon0_correct)))
PreconditionGeneratedEntry_correct))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
))
(check-sat)
(get-info :reason-unknown)
(assert (not (= (ControlFlow 0 209) (- 210))))
(check-sat)
(pop 1)
; Invalid
(get-info :rlimit)
