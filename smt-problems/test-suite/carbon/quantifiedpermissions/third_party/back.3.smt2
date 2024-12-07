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
(declare-fun Integer_value () T@U)
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
(assert  (and (and (and (and (and (forall ((arg0@@11 T@T) (arg1 T@T) ) (! (= (Ctor (FieldType arg0@@11 arg1)) 6)
 :qid |ctor:FieldType|
)) (forall ((arg0@@12 T@T) (arg1@@0 T@T) ) (! (= (FieldTypeInv0 (FieldType arg0@@12 arg1@@0)) arg0@@12)
 :qid |typeInv:FieldTypeInv0|
 :pattern ( (FieldType arg0@@12 arg1@@0))
))) (forall ((arg0@@13 T@T) (arg1@@1 T@T) ) (! (= (FieldTypeInv1 (FieldType arg0@@13 arg1@@1)) arg1@@1)
 :qid |typeInv:FieldTypeInv1|
 :pattern ( (FieldType arg0@@13 arg1@@1))
))) (= (Ctor NormalFieldType) 7)) (= (type $allocated) (FieldType NormalFieldType boolType))) (= (type Integer_value) (FieldType NormalFieldType intType))))
(assert (distinct $allocated Integer_value)
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
 :qid |stdinbpl.361:18|
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
(assert (forall ((arg0@@26 T@U) (arg1@@10 Int) ) (! (let ((T@@1 (SeqTypeInv0 (type arg0@@26))))
(= (type (|Seq#Index| arg0@@26 arg1@@10)) T@@1))
 :qid |funType:Seq#Index|
 :pattern ( (|Seq#Index| arg0@@26 arg1@@10))
)))
(assert (forall ((s@@0 T@U) (n@@0 Int) (j Int) ) (! (let ((T@@2 (SeqTypeInv0 (type s@@0))))
 (=> (= (type s@@0) (SeqType T@@2)) (=> (and (and (< 0 n@@0) (<= 0 j)) (< j (- (|Seq#Length| s@@0) n@@0))) (and (= (|Seq#Sub| (|Seq#Add| j n@@0) n@@0) j) (= (|Seq#Index| (|Seq#Drop| s@@0 n@@0) j) (|Seq#Index| s@@0 (|Seq#Add| j n@@0)))))))
 :qid |stdinbpl.382:18|
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
 :qid |stdinbpl.337:18|
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
 :qid |stdinbpl.348:18|
 :skolemid |36|
 :pattern ( (|Seq#Length| (|Seq#Take| s@@2 n@@2)))
 :pattern ( (|Seq#Take| s@@2 n@@2) (|Seq#Length| s@@2))
)))
(assert (forall ((arg0@@31 Int) (arg1@@13 Int) ) (! (= (type (|Seq#Range| arg0@@31 arg1@@13)) (SeqType intType))
 :qid |funType:Seq#Range|
 :pattern ( (|Seq#Range| arg0@@31 arg1@@13))
)))
(assert (forall ((q@min Int) (q@max Int) (v@@0 T@U) ) (!  (=> (= (type v@@0) intType) (= (|Seq#Contains| (|Seq#Range| q@min q@max) v@@0)  (and (<= q@min (U_2_int v@@0)) (< (U_2_int v@@0) q@max))))
 :qid |stdinbpl.621:15|
 :skolemid |57|
 :pattern ( (|Seq#Contains| (|Seq#Range| q@min q@max) v@@0))
)))
(assert (forall ((s@@3 T@U) (x@@8 T@U) ) (! (let ((T@@7 (type x@@8)))
 (=> (and (= (type s@@3) (SeqType T@@7)) (|Seq#Contains| s@@3 x@@8)) (and (and (<= 0 (|Seq#Skolem| s@@3 x@@8)) (< (|Seq#Skolem| s@@3 x@@8) (|Seq#Length| s@@3))) (= (|Seq#Index| s@@3 (|Seq#Skolem| s@@3 x@@8)) x@@8))))
 :qid |stdinbpl.479:18|
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
 :qid |stdinbpl.463:18|
 :skolemid |45|
 :pattern ( (|Seq#Drop| s@@4 n@@3))
)))
(assert (forall ((i@@0 Int) (j@@0 Int) ) (! (= (|Seq#Sub| i@@0 j@@0) (- i@@0 j@@0))
 :qid |stdinbpl.317:15|
 :skolemid |30|
 :pattern ( (|Seq#Sub| i@@0 j@@0))
)))
(assert (forall ((i@@1 Int) (j@@1 Int) ) (! (= (|Seq#Add| i@@1 j@@1) (+ i@@1 j@@1))
 :qid |stdinbpl.315:15|
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
 :qid |stdinbpl.604:18|
 :skolemid |54|
 :pattern ( (|Seq#Contains| (|Seq#Singleton| x@@9) y@@1))
)))
(assert (forall ((s@@5 T@U) (n@@4 Int) (j@@2 Int) ) (! (let ((T@@11 (SeqTypeInv0 (type s@@5))))
 (=> (= (type s@@5) (SeqType T@@11)) (=> (and (and (<= 0 j@@2) (< j@@2 n@@4)) (< j@@2 (|Seq#Length| s@@5))) (= (|Seq#Index| (|Seq#Take| s@@5 n@@4) j@@2) (|Seq#Index| s@@5 j@@2)))))
 :qid |stdinbpl.356:18|
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
 :qid |stdinbpl.260:19|
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
 :qid |stdinbpl.328:18|
 :skolemid |32|
 :pattern ( (|Seq#Index| (|Seq#Append| s0 s1) n@@5))
)))
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
 :qid |stdinbpl.248:15|
 :skolemid |19|
 :pattern ( (ConditionalFrame p@@0 f_6))
)))
(assert (forall ((q@min@@0 Int) (q@max@@0 Int) (j@@3 Int) ) (!  (=> (and (<= 0 j@@3) (< j@@3 (- q@max@@0 q@min@@0))) (= (U_2_int (|Seq#Index| (|Seq#Range| q@min@@0 q@max@@0) j@@3)) (+ q@min@@0 j@@3)))
 :qid |stdinbpl.619:15|
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
 :qid |stdinbpl.297:18|
 :skolemid |26|
 :pattern ( (|Seq#Length| (|Seq#Append| s0@@0 s1@@0)))
)))
(assert (forall ((s@@6 T@U) (t T@U) (n@@6 Int) ) (! (let ((T@@17 (SeqTypeInv0 (type s@@6))))
 (=> (and (and (= (type s@@6) (SeqType T@@17)) (= (type t) (SeqType T@@17))) (and (> n@@6 0) (> n@@6 (|Seq#Length| s@@6)))) (and (= (|Seq#Add| (|Seq#Sub| n@@6 (|Seq#Length| s@@6)) (|Seq#Length| s@@6)) n@@6) (= (|Seq#Drop| (|Seq#Append| s@@6 t) n@@6) (|Seq#Drop| t (|Seq#Sub| n@@6 (|Seq#Length| s@@6)))))))
 :qid |stdinbpl.453:18|
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
 :qid |stdinbpl.440:18|
 :skolemid |42|
 :pattern ( (|Seq#Take| (|Seq#Append| s@@7 t@@0) n@@7))
)))
(assert (forall ((q@min@@1 Int) (q@max@@1 Int) ) (!  (and (=> (< q@min@@1 q@max@@1) (= (|Seq#Length| (|Seq#Range| q@min@@1 q@max@@1)) (- q@max@@1 q@min@@1))) (=> (<= q@max@@1 q@min@@1) (= (|Seq#Length| (|Seq#Range| q@min@@1 q@max@@1)) 0)))
 :qid |stdinbpl.618:15|
 :skolemid |55|
 :pattern ( (|Seq#Length| (|Seq#Range| q@min@@1 q@max@@1)))
)))
(assert (forall ((a T@U) (b T@U) ) (! (let ((T@@19 (SeqTypeInv0 (type a))))
 (=> (and (and (= (type a) (SeqType T@@19)) (= (type b) (SeqType T@@19))) (|Seq#Equal| a b)) (= a b)))
 :qid |stdinbpl.591:18|
 :skolemid |53|
 :pattern ( (|Seq#Equal| a b))
)))
(assert (forall ((s@@8 T@U) (i@@2 Int) ) (! (let ((T@@20 (SeqTypeInv0 (type s@@8))))
 (=> (= (type s@@8) (SeqType T@@20)) (=> (and (<= 0 i@@2) (< i@@2 (|Seq#Length| s@@8))) (|Seq#ContainsTrigger| s@@8 (|Seq#Index| s@@8 i@@2)))))
 :qid |stdinbpl.484:18|
 :skolemid |49|
 :pattern ( (|Seq#Index| s@@8 i@@2))
)))
(assert (forall ((s0@@1 T@U) (s1@@1 T@U) ) (! (let ((T@@21 (SeqTypeInv0 (type s0@@1))))
 (=> (and (= (type s0@@1) (SeqType T@@21)) (= (type s1@@1) (SeqType T@@21))) (and (=> (= s0@@1 (|Seq#Empty| T@@21)) (= (|Seq#Append| s0@@1 s1@@1) s1@@1)) (=> (= s1@@1 (|Seq#Empty| T@@21)) (= (|Seq#Append| s0@@1 s1@@1) s0@@1)))))
 :qid |stdinbpl.303:18|
 :skolemid |27|
 :pattern ( (|Seq#Append| s0@@1 s1@@1))
)))
(assert (forall ((t@@1 T@U) ) (! (= (|Seq#Index| (|Seq#Singleton| t@@1) 0) t@@1)
 :qid |stdinbpl.307:18|
 :skolemid |28|
 :pattern ( (|Seq#Singleton| t@@1))
)))
(assert (forall ((s@@9 T@U) ) (! (let ((T@@22 (SeqTypeInv0 (type s@@9))))
 (=> (= (type s@@9) (SeqType T@@22)) (<= 0 (|Seq#Length| s@@9))))
 :qid |stdinbpl.286:18|
 :skolemid |22|
 :pattern ( (|Seq#Length| s@@9))
)))
(assert (forall ((s0@@2 T@U) (s1@@2 T@U) ) (! (let ((T@@23 (SeqTypeInv0 (type s0@@2))))
 (=> (and (and (= (type s0@@2) (SeqType T@@23)) (= (type s1@@2) (SeqType T@@23))) (|Seq#Equal| s0@@2 s1@@2)) (and (= (|Seq#Length| s0@@2) (|Seq#Length| s1@@2)) (forall ((j@@4 Int) ) (!  (=> (and (<= 0 j@@4) (< j@@4 (|Seq#Length| s0@@2))) (= (|Seq#Index| s0@@2 j@@4) (|Seq#Index| s1@@2 j@@4)))
 :qid |stdinbpl.581:13|
 :skolemid |50|
 :pattern ( (|Seq#Index| s0@@2 j@@4))
 :pattern ( (|Seq#Index| s1@@2 j@@4))
)))))
 :qid |stdinbpl.578:18|
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
 :qid |stdinbpl.294:18|
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
 :qid |stdinbpl.436:18|
 :skolemid |41|
 :pattern ( (|Seq#Take| (|Seq#Append| s@@10 t@@3) n@@8))
)))
(assert (forall ((s@@11 T@U) (i@@3 Int) (v@@1 T@U) ) (! (let ((T@@25 (type v@@1)))
 (=> (= (type s@@11) (SeqType T@@25)) (=> (and (<= 0 i@@3) (< i@@3 (|Seq#Length| s@@11))) (= (|Seq#Length| (|Seq#Update| s@@11 i@@3 v@@1)) (|Seq#Length| s@@11)))))
 :qid |stdinbpl.335:18|
 :skolemid |34|
 :pattern ( (|Seq#Length| (|Seq#Update| s@@11 i@@3 v@@1)))
 :pattern ( (|Seq#Length| s@@11) (|Seq#Update| s@@11 i@@3 v@@1))
)))
(assert (forall ((s@@12 T@U) (t@@4 T@U) (n@@9 Int) ) (! (let ((T@@26 (SeqTypeInv0 (type s@@12))))
 (=> (and (and (= (type s@@12) (SeqType T@@26)) (= (type t@@4) (SeqType T@@26))) (and (< 0 n@@9) (<= n@@9 (|Seq#Length| s@@12)))) (= (|Seq#Drop| (|Seq#Append| s@@12 t@@4) n@@9) (|Seq#Append| (|Seq#Drop| s@@12 n@@9) t@@4))))
 :qid |stdinbpl.449:18|
 :skolemid |43|
 :pattern ( (|Seq#Drop| (|Seq#Append| s@@12 t@@4) n@@9))
)))
(assert (forall ((s@@13 T@U) (n@@10 Int) (i@@4 Int) ) (! (let ((T@@27 (SeqTypeInv0 (type s@@13))))
 (=> (= (type s@@13) (SeqType T@@27)) (=> (and (and (< 0 n@@10) (<= n@@10 i@@4)) (< i@@4 (|Seq#Length| s@@13))) (and (= (|Seq#Add| (|Seq#Sub| i@@4 n@@10) n@@10) i@@4) (= (|Seq#Index| (|Seq#Drop| s@@13 n@@10) (|Seq#Sub| i@@4 n@@10)) (|Seq#Index| s@@13 i@@4))))))
 :qid |stdinbpl.386:18|
 :skolemid |40|
 :pattern ( (|Seq#Drop| s@@13 n@@10) (|Seq#Index| s@@13 i@@4))
)))
(assert (forall ((s0@@3 T@U) (s1@@3 T@U) (n@@11 Int) ) (! (let ((T@@28 (SeqTypeInv0 (type s0@@3))))
 (=> (and (= (type s0@@3) (SeqType T@@28)) (= (type s1@@3) (SeqType T@@28))) (=> (and (and (and (not (= s0@@3 (|Seq#Empty| T@@28))) (not (= s1@@3 (|Seq#Empty| T@@28)))) (<= 0 n@@11)) (< n@@11 (|Seq#Length| s0@@3))) (= (|Seq#Index| (|Seq#Append| s0@@3 s1@@3) n@@11) (|Seq#Index| s0@@3 n@@11)))))
 :qid |stdinbpl.326:18|
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
 :qid |stdinbpl.331:18|
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
 :qid |stdinbpl.482:18|
 :skolemid |48|
 :pattern ( (|Seq#Contains| s@@14 x@@10) (|Seq#Index| s@@14 i@@5))
)))
(assert (forall ((s0@@5 T@U) (s1@@5 T@U) ) (! (let ((T@@31 (SeqTypeInv0 (type s0@@5))))
 (=> (and (= (type s0@@5) (SeqType T@@31)) (= (type s1@@5) (SeqType T@@31))) (or (or (and (= s0@@5 s1@@5) (|Seq#Equal| s0@@5 s1@@5)) (and (and (not (= s0@@5 s1@@5)) (not (|Seq#Equal| s0@@5 s1@@5))) (not (= (|Seq#Length| s0@@5) (|Seq#Length| s1@@5))))) (and (and (and (and (and (and (not (= s0@@5 s1@@5)) (not (|Seq#Equal| s0@@5 s1@@5))) (= (|Seq#Length| s0@@5) (|Seq#Length| s1@@5))) (= (|Seq#SkolemDiff| s0@@5 s1@@5) (|Seq#SkolemDiff| s1@@5 s0@@5))) (<= 0 (|Seq#SkolemDiff| s0@@5 s1@@5))) (< (|Seq#SkolemDiff| s0@@5 s1@@5) (|Seq#Length| s0@@5))) (not (= (|Seq#Index| s0@@5 (|Seq#SkolemDiff| s0@@5 s1@@5)) (|Seq#Index| s1@@5 (|Seq#SkolemDiff| s0@@5 s1@@5))))))))
 :qid |stdinbpl.586:18|
 :skolemid |52|
 :pattern ( (|Seq#Equal| s0@@5 s1@@5))
)))
(assert (forall ((p@@1 T@U) (v_1@@0 T@U) (q T@U) (w@@0 T@U) (r T@U) (u T@U) ) (! (let ((C@@3 (FieldTypeInv0 (type r))))
(let ((B@@10 (FieldTypeInv0 (type q))))
(let ((A@@11 (FieldTypeInv0 (type p@@1))))
 (=> (and (and (and (and (and (and (= (type p@@1) (FieldType A@@11 FrameTypeType)) (= (type v_1@@0) FrameTypeType)) (= (type q) (FieldType B@@10 FrameTypeType))) (= (type w@@0) FrameTypeType)) (= (type r) (FieldType C@@3 FrameTypeType))) (= (type u) FrameTypeType)) (and (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))) (InsidePredicate p@@1 v_1@@0 r u)))))
 :qid |stdinbpl.255:25|
 :skolemid |20|
 :pattern ( (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))
)))
(assert (forall ((s@@15 T@U) ) (! (let ((T@@32 (SeqTypeInv0 (type s@@15))))
 (=> (and (= (type s@@15) (SeqType T@@32)) (= (|Seq#Length| s@@15) 0)) (= s@@15 (|Seq#Empty| T@@32))))
 :qid |stdinbpl.290:18|
 :skolemid |24|
 :pattern ( (|Seq#Length| s@@15))
)))
(assert (forall ((s@@16 T@U) (n@@12 Int) ) (! (let ((T@@33 (SeqTypeInv0 (type s@@16))))
 (=> (and (= (type s@@16) (SeqType T@@33)) (<= n@@12 0)) (= (|Seq#Take| s@@16 n@@12) (|Seq#Empty| T@@33))))
 :qid |stdinbpl.465:18|
 :skolemid |46|
 :pattern ( (|Seq#Take| s@@16 n@@12))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun len () Int)
(declare-fun i_40 () Int)
(declare-fun cr () T@U)
(declare-fun br () T@U)
(declare-fun qpRange15 (T@U) Bool)
(declare-fun invRecv15 (T@U) Int)
(declare-fun QPMask@14 () T@U)
(declare-fun QPMask@13 () T@U)
(declare-fun PostHeap@0 () T@U)
(declare-fun i_39 () Int)
(declare-fun ar () T@U)
(declare-fun qpRange14 (T@U) Bool)
(declare-fun invRecv14 (T@U) Int)
(declare-fun i_38 () Int)
(declare-fun i_28_1 () Int)
(declare-fun j_10 () Int)
(declare-fun neverTriggered23 (Int) Bool)
(declare-fun QPMask@5 () T@U)
(declare-fun qpRange23 (T@U) Bool)
(declare-fun invRecv23 (T@U) Int)
(declare-fun QPMask@6 () T@U)
(declare-fun Heap@@9 () T@U)
(declare-fun ExhaleHeap@0 () T@U)
(declare-fun qpRange24 (T@U) Bool)
(declare-fun invRecv24 (T@U) Int)
(declare-fun QPMask@7 () T@U)
(declare-fun qpRange25 (T@U) Bool)
(declare-fun invRecv25 (T@U) Int)
(declare-fun QPMask@8 () T@U)
(declare-fun qpRange26 (T@U) Bool)
(declare-fun invRecv26 (T@U) Int)
(declare-fun QPMask@9 () T@U)
(declare-fun neverTriggered17 (Int) Bool)
(declare-fun qpRange17 (T@U) Bool)
(declare-fun invRecv17 (T@U) Int)
(declare-fun QPMask@10 () T@U)
(declare-fun dummyFunction (T@U) Bool)
(declare-fun neverTriggered18 (Int) Bool)
(declare-fun qpRange18 (T@U) Bool)
(declare-fun invRecv18 (T@U) Int)
(declare-fun QPMask@11 () T@U)
(declare-fun neverTriggered19 (Int) Bool)
(declare-fun neverTriggered22 (Int) Bool)
(declare-fun QPMask@4 () T@U)
(declare-fun qpRange22 (T@U) Bool)
(declare-fun invRecv22 (T@U) Int)
(declare-fun i_25_1 () Int)
(declare-fun j_8_1 () Int)
(declare-fun Mask@0 () T@U)
(declare-fun QPMask@3 () T@U)
(declare-fun perm@0 () Real)
(declare-fun neverTriggered21 (Int) Bool)
(declare-fun qpRange21 (T@U) Bool)
(declare-fun invRecv21 (T@U) Int)
(declare-fun neverTriggered20 (Int) Bool)
(declare-fun QPMask@2 () T@U)
(declare-fun qpRange20 (T@U) Bool)
(declare-fun invRecv20 (T@U) Int)
(declare-fun i_21 () Int)
(declare-fun j_6_1 () Int)
(declare-fun qpRange13 (T@U) Bool)
(declare-fun invRecv13 (T@U) Int)
(declare-fun QPMask@1 () T@U)
(declare-fun i_37 () Int)
(declare-fun i_36 () Int)
(declare-fun j_8 () Int)
(declare-fun qpRange12 (T@U) Bool)
(declare-fun invRecv12 (T@U) Int)
(declare-fun QPMask@0 () T@U)
(declare-fun i_35 () Int)
(declare-fun i_34 () Int)
(declare-fun j_7 () Int)
(declare-fun qpRange11 (T@U) Bool)
(declare-fun invRecv11 (T@U) Int)
(declare-fun i_29 () Int)
(declare-fun i_28 () Int)
(declare-fun j_6 () Int)
(declare-fun this () T@U)
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (= (type ar) (SeqType RefType)) (= (type br) (SeqType RefType))) (= (type cr) (SeqType RefType))) (= (type QPMask@5) (MapType1Type RefType realType))) (= (type QPMask@6) (MapType1Type RefType realType))) (= (type Heap@@9) (MapType0Type RefType))) (= (type ExhaleHeap@0) (MapType0Type RefType))) (= (type QPMask@7) (MapType1Type RefType realType))) (= (type QPMask@8) (MapType1Type RefType realType))) (= (type QPMask@9) (MapType1Type RefType realType))) (= (type QPMask@10) (MapType1Type RefType realType))) (= (type QPMask@11) (MapType1Type RefType realType))) (= (type QPMask@4) (MapType1Type RefType realType))) (= (type Mask@0) (MapType1Type RefType realType))) (= (type QPMask@3) (MapType1Type RefType realType))) (= (type QPMask@2) (MapType1Type RefType realType))) (= (type QPMask@14) (MapType1Type RefType realType))) (= (type QPMask@13) (MapType1Type RefType realType))) (= (type PostHeap@0) (MapType0Type RefType))) (= (type QPMask@1) (MapType1Type RefType realType))) (= (type QPMask@0) (MapType1Type RefType realType))) (= (type this) RefType)))
(set-info :boogie-vc-id zero_array)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 124) (let ((anon36_correct true))
(let ((anon71_Else_correct  (=> (and (not (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_40))) (= (ControlFlow 0 106) 102)) anon36_correct)))
(let ((anon71_Then_correct  (=> (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_40)) (and (=> (= (ControlFlow 0 103) (- 0 105)) (>= i_40 0)) (=> (>= i_40 0) (and (=> (= (ControlFlow 0 103) (- 0 104)) (< i_40 (|Seq#Length| cr))) (=> (< i_40 (|Seq#Length| cr)) (=> (= (ControlFlow 0 103) 102) anon36_correct))))))))
(let ((anon70_Else_correct  (=> (= (ControlFlow 0 101) (- 0 100)) (forall ((i_17 Int) (i_17_1 Int) ) (!  (=> (and (and (and (and (not (= i_17 i_17_1)) (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_17))) (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_17_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| cr i_17) (|Seq#Index| cr i_17_1))))
 :qid |stdinbpl.2074:15|
 :skolemid |161|
)))))
(let ((anon68_Else_correct  (and (=> (= (ControlFlow 0 107) (- 0 109)) (forall ((i_15 Int) (i_15_1 Int) ) (!  (=> (and (and (and (and (not (= i_15 i_15_1)) (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_15))) (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_15_1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= (|Seq#Index| br i_15) (|Seq#Index| br i_15_1))))
 :qid |stdinbpl.2020:15|
 :skolemid |154|
))) (=> (forall ((i_15@@0 Int) (i_15_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_15@@0 i_15_1@@0)) (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_15@@0))) (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_15_1@@0))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= (|Seq#Index| br i_15@@0) (|Seq#Index| br i_15_1@@0))))
 :qid |stdinbpl.2020:15|
 :skolemid |154|
)) (=> (and (forall ((i_15@@1 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_15@@1)) (< NoPerm (/ (to_real 1) (to_real 2)))) (and (qpRange15 (|Seq#Index| br i_15@@1)) (= (invRecv15 (|Seq#Index| br i_15@@1)) i_15@@1)))
 :qid |stdinbpl.2026:22|
 :skolemid |155|
 :pattern ( (|Seq#Index| br i_15@@1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 len) (int_2_U i_15@@1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_15@@1)))
 :pattern ( (|Seq#Index| br i_15@@1))
)) (forall ((o_3 T@U) ) (!  (=> (= (type o_3) RefType) (=> (and (and (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U (invRecv15 o_3))) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange15 o_3)) (= (|Seq#Index| br (invRecv15 o_3)) o_3)))
 :qid |stdinbpl.2030:22|
 :skolemid |156|
 :pattern ( (invRecv15 o_3))
))) (and (=> (= (ControlFlow 0 107) (- 0 108)) (forall ((i_15@@2 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_15@@2)) (>= (/ (to_real 1) (to_real 2)) NoPerm))
 :qid |stdinbpl.2036:15|
 :skolemid |157|
 :pattern ( (|Seq#Index| br i_15@@2))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 len) (int_2_U i_15@@2)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_15@@2)))
 :pattern ( (|Seq#Index| br i_15@@2))
))) (=> (forall ((i_15@@3 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_15@@3)) (>= (/ (to_real 1) (to_real 2)) NoPerm))
 :qid |stdinbpl.2036:15|
 :skolemid |157|
 :pattern ( (|Seq#Index| br i_15@@3))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 len) (int_2_U i_15@@3)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_15@@3)))
 :pattern ( (|Seq#Index| br i_15@@3))
)) (=> (forall ((i_15@@4 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_15@@4)) (> (/ (to_real 1) (to_real 2)) NoPerm)) (not (= (|Seq#Index| br i_15@@4) null)))
 :qid |stdinbpl.2042:22|
 :skolemid |158|
 :pattern ( (|Seq#Index| br i_15@@4))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 len) (int_2_U i_15@@4)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_15@@4)))
 :pattern ( (|Seq#Index| br i_15@@4))
)) (=> (and (forall ((o_3@@0 T@U) ) (!  (=> (= (type o_3@@0) RefType) (and (=> (and (and (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U (invRecv15 o_3@@0))) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange15 o_3@@0)) (and (=> (< NoPerm (/ (to_real 1) (to_real 2))) (= (|Seq#Index| br (invRecv15 o_3@@0)) o_3@@0)) (= (U_2_real (MapType1Select QPMask@14 o_3@@0 Integer_value)) (+ (U_2_real (MapType1Select QPMask@13 o_3@@0 Integer_value)) (/ (to_real 1) (to_real 2)))))) (=> (not (and (and (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U (invRecv15 o_3@@0))) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange15 o_3@@0))) (= (U_2_real (MapType1Select QPMask@14 o_3@@0 Integer_value)) (U_2_real (MapType1Select QPMask@13 o_3@@0 Integer_value))))))
 :qid |stdinbpl.2048:22|
 :skolemid |159|
 :pattern ( (MapType1Select QPMask@14 o_3@@0 Integer_value))
)) (forall ((o_3@@1 T@U) (f_5 T@U) ) (! (let ((B@@11 (FieldTypeInv1 (type f_5))))
(let ((A@@12 (FieldTypeInv0 (type f_5))))
 (=> (and (and (= (type o_3@@1) RefType) (= (type f_5) (FieldType A@@12 B@@11))) (not (= f_5 Integer_value))) (= (U_2_real (MapType1Select QPMask@13 o_3@@1 f_5)) (U_2_real (MapType1Select QPMask@14 o_3@@1 f_5))))))
 :qid |stdinbpl.2052:29|
 :skolemid |160|
 :pattern ( (MapType1Select QPMask@13 o_3@@1 f_5))
 :pattern ( (MapType1Select QPMask@14 o_3@@1 f_5))
))) (=> (and (and (state PostHeap@0 QPMask@14) (state PostHeap@0 QPMask@14)) (and (= (|Seq#Length| cr) len) (state PostHeap@0 QPMask@14))) (and (and (=> (= (ControlFlow 0 107) 101) anon70_Else_correct) (=> (= (ControlFlow 0 107) 103) anon71_Then_correct)) (=> (= (ControlFlow 0 107) 106) anon71_Else_correct))))))))))))
(let ((anon32_correct true))
(let ((anon69_Else_correct  (=> (and (not (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_39))) (= (ControlFlow 0 99) 95)) anon32_correct)))
(let ((anon69_Then_correct  (=> (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_39)) (and (=> (= (ControlFlow 0 96) (- 0 98)) (>= i_39 0)) (=> (>= i_39 0) (and (=> (= (ControlFlow 0 96) (- 0 97)) (< i_39 (|Seq#Length| br))) (=> (< i_39 (|Seq#Length| br)) (=> (= (ControlFlow 0 96) 95) anon32_correct))))))))
(let ((anon66_Else_correct  (and (=> (= (ControlFlow 0 110) (- 0 111)) (forall ((i_13 Int) (i_13_1 Int) ) (!  (=> (and (and (and (and (not (= i_13 i_13_1)) (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_13))) (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_13_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| ar i_13) (|Seq#Index| ar i_13_1))))
 :qid |stdinbpl.1972:15|
 :skolemid |148|
))) (=> (forall ((i_13@@0 Int) (i_13_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_13@@0 i_13_1@@0)) (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_13@@0))) (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_13_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| ar i_13@@0) (|Seq#Index| ar i_13_1@@0))))
 :qid |stdinbpl.1972:15|
 :skolemid |148|
)) (=> (forall ((i_13@@1 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_13@@1)) (< NoPerm FullPerm)) (and (qpRange14 (|Seq#Index| ar i_13@@1)) (= (invRecv14 (|Seq#Index| ar i_13@@1)) i_13@@1)))
 :qid |stdinbpl.1978:22|
 :skolemid |149|
 :pattern ( (|Seq#Index| ar i_13@@1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 len) (int_2_U i_13@@1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_13@@1)))
 :pattern ( (|Seq#Index| ar i_13@@1))
)) (=> (and (and (and (forall ((o_3@@2 T@U) ) (!  (=> (= (type o_3@@2) RefType) (=> (and (and (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U (invRecv14 o_3@@2))) (< NoPerm FullPerm)) (qpRange14 o_3@@2)) (= (|Seq#Index| ar (invRecv14 o_3@@2)) o_3@@2)))
 :qid |stdinbpl.1982:22|
 :skolemid |150|
 :pattern ( (invRecv14 o_3@@2))
)) (forall ((i_13@@2 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_13@@2)) (not (= (|Seq#Index| ar i_13@@2) null)))
 :qid |stdinbpl.1988:22|
 :skolemid |151|
 :pattern ( (|Seq#Index| ar i_13@@2))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 len) (int_2_U i_13@@2)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_13@@2)))
 :pattern ( (|Seq#Index| ar i_13@@2))
))) (and (forall ((o_3@@3 T@U) ) (!  (=> (= (type o_3@@3) RefType) (and (=> (and (and (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U (invRecv14 o_3@@3))) (< NoPerm FullPerm)) (qpRange14 o_3@@3)) (and (=> (< NoPerm FullPerm) (= (|Seq#Index| ar (invRecv14 o_3@@3)) o_3@@3)) (= (U_2_real (MapType1Select QPMask@13 o_3@@3 Integer_value)) (+ (U_2_real (MapType1Select ZeroMask o_3@@3 Integer_value)) FullPerm)))) (=> (not (and (and (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U (invRecv14 o_3@@3))) (< NoPerm FullPerm)) (qpRange14 o_3@@3))) (= (U_2_real (MapType1Select QPMask@13 o_3@@3 Integer_value)) (U_2_real (MapType1Select ZeroMask o_3@@3 Integer_value))))))
 :qid |stdinbpl.1994:22|
 :skolemid |152|
 :pattern ( (MapType1Select QPMask@13 o_3@@3 Integer_value))
)) (forall ((o_3@@4 T@U) (f_5@@0 T@U) ) (! (let ((B@@12 (FieldTypeInv1 (type f_5@@0))))
(let ((A@@13 (FieldTypeInv0 (type f_5@@0))))
 (=> (and (and (= (type o_3@@4) RefType) (= (type f_5@@0) (FieldType A@@13 B@@12))) (not (= f_5@@0 Integer_value))) (= (U_2_real (MapType1Select ZeroMask o_3@@4 f_5@@0)) (U_2_real (MapType1Select QPMask@13 o_3@@4 f_5@@0))))))
 :qid |stdinbpl.1998:29|
 :skolemid |153|
 :pattern ( (MapType1Select ZeroMask o_3@@4 f_5@@0))
 :pattern ( (MapType1Select QPMask@13 o_3@@4 f_5@@0))
)))) (and (and (state PostHeap@0 QPMask@13) (state PostHeap@0 QPMask@13)) (and (= (|Seq#Length| br) len) (state PostHeap@0 QPMask@13)))) (and (and (=> (= (ControlFlow 0 110) 107) anon68_Else_correct) (=> (= (ControlFlow 0 110) 96) anon69_Then_correct)) (=> (= (ControlFlow 0 110) 99) anon69_Else_correct))))))))
(let ((anon28_correct true))
(let ((anon67_Else_correct  (=> (and (not (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_38))) (= (ControlFlow 0 94) 90)) anon28_correct)))
(let ((anon67_Then_correct  (=> (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_38)) (and (=> (= (ControlFlow 0 91) (- 0 93)) (>= i_38 0)) (=> (>= i_38 0) (and (=> (= (ControlFlow 0 91) (- 0 92)) (< i_38 (|Seq#Length| ar))) (=> (< i_38 (|Seq#Length| ar)) (=> (= (ControlFlow 0 91) 90) anon28_correct))))))))
(let ((anon65_Then_correct  (=> (state PostHeap@0 ZeroMask) (=> (and (= (|Seq#Length| ar) len) (state PostHeap@0 ZeroMask)) (and (and (=> (= (ControlFlow 0 112) 110) anon66_Else_correct) (=> (= (ControlFlow 0 112) 91) anon67_Then_correct)) (=> (= (ControlFlow 0 112) 94) anon67_Else_correct))))))
(let ((anon51_correct true))
(let ((anon78_Else_correct  (=> (and (not (and (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_28_1)) (and (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U j_10)) (not (= i_28_1 j_10))))) (= (ControlFlow 0 65) 62)) anon51_correct)))
(let ((anon78_Then_correct  (=> (and (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_28_1)) (and (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U j_10)) (not (= i_28_1 j_10)))) (and (=> (= (ControlFlow 0 63) (- 0 64)) (not (= (|Seq#Index| cr i_28_1) (|Seq#Index| cr j_10)))) (=> (not (= (|Seq#Index| cr i_28_1) (|Seq#Index| cr j_10))) (=> (= (ControlFlow 0 63) 62) anon51_correct))))))
(let ((anon77_Else_correct  (=> (forall ((i_29_1 Int) (j_11_1 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_29_1)) (and (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U j_11_1)) (not (= i_29_1 j_11_1)))) (not (= (|Seq#Index| cr i_29_1) (|Seq#Index| cr j_11_1))))
 :qid |stdinbpl.2324:22|
 :skolemid |190|
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 len) (int_2_U i_29_1)) (|Seq#ContainsTrigger| (|Seq#Range| 0 len) (int_2_U j_11_1)))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 len) (int_2_U i_29_1)) (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U j_11_1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_29_1)) (|Seq#ContainsTrigger| (|Seq#Range| 0 len) (int_2_U j_11_1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_29_1)) (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U j_11_1)))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 len) (int_2_U i_29_1)) (|Seq#Index| cr j_11_1))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_29_1)) (|Seq#Index| cr j_11_1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 len) (int_2_U j_11_1)) (|Seq#Index| cr i_29_1))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U j_11_1)) (|Seq#Index| cr i_29_1))
 :pattern ( (|Seq#Index| cr i_29_1) (|Seq#Index| cr j_11_1))
)) (and (=> (= (ControlFlow 0 46) (- 0 61)) (forall ((i_30 Int) (i_30_1 Int) ) (!  (=> (and (and (and (and (not (= i_30 i_30_1)) (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_30))) (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_30_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| cr i_30) (|Seq#Index| cr i_30_1))))
 :qid |stdinbpl.2335:19|
 :skolemid |191|
 :pattern ( (neverTriggered23 i_30) (neverTriggered23 i_30_1))
))) (=> (forall ((i_30@@0 Int) (i_30_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_30@@0 i_30_1@@0)) (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_30@@0))) (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_30_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| cr i_30@@0) (|Seq#Index| cr i_30_1@@0))))
 :qid |stdinbpl.2335:19|
 :skolemid |191|
 :pattern ( (neverTriggered23 i_30@@0) (neverTriggered23 i_30_1@@0))
)) (and (=> (= (ControlFlow 0 46) (- 0 60)) (forall ((i_30@@1 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_30@@1)) (>= (U_2_real (MapType1Select QPMask@5 (|Seq#Index| cr i_30@@1) Integer_value)) FullPerm))
 :qid |stdinbpl.2342:19|
 :skolemid |192|
 :pattern ( (|Seq#Index| cr i_30@@1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 len) (int_2_U i_30@@1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_30@@1)))
 :pattern ( (|Seq#Index| cr i_30@@1))
))) (=> (forall ((i_30@@2 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_30@@2)) (>= (U_2_real (MapType1Select QPMask@5 (|Seq#Index| cr i_30@@2) Integer_value)) FullPerm))
 :qid |stdinbpl.2342:19|
 :skolemid |192|
 :pattern ( (|Seq#Index| cr i_30@@2))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 len) (int_2_U i_30@@2)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_30@@2)))
 :pattern ( (|Seq#Index| cr i_30@@2))
)) (=> (and (forall ((i_30@@3 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_30@@3)) (< NoPerm FullPerm)) (and (qpRange23 (|Seq#Index| cr i_30@@3)) (= (invRecv23 (|Seq#Index| cr i_30@@3)) i_30@@3)))
 :qid |stdinbpl.2348:24|
 :skolemid |193|
 :pattern ( (|Seq#Index| cr i_30@@3))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 len) (int_2_U i_30@@3)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_30@@3)))
 :pattern ( (|Seq#Index| cr i_30@@3))
)) (forall ((o_3@@5 T@U) ) (!  (=> (= (type o_3@@5) RefType) (=> (and (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U (invRecv23 o_3@@5))) (and (< NoPerm FullPerm) (qpRange23 o_3@@5))) (= (|Seq#Index| cr (invRecv23 o_3@@5)) o_3@@5)))
 :qid |stdinbpl.2352:24|
 :skolemid |194|
 :pattern ( (invRecv23 o_3@@5))
))) (=> (and (and (forall ((o_3@@6 T@U) ) (!  (=> (= (type o_3@@6) RefType) (and (=> (and (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U (invRecv23 o_3@@6))) (and (< NoPerm FullPerm) (qpRange23 o_3@@6))) (and (= (|Seq#Index| cr (invRecv23 o_3@@6)) o_3@@6) (= (U_2_real (MapType1Select QPMask@6 o_3@@6 Integer_value)) (- (U_2_real (MapType1Select QPMask@5 o_3@@6 Integer_value)) FullPerm)))) (=> (not (and (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U (invRecv23 o_3@@6))) (and (< NoPerm FullPerm) (qpRange23 o_3@@6)))) (= (U_2_real (MapType1Select QPMask@6 o_3@@6 Integer_value)) (U_2_real (MapType1Select QPMask@5 o_3@@6 Integer_value))))))
 :qid |stdinbpl.2358:24|
 :skolemid |195|
 :pattern ( (MapType1Select QPMask@6 o_3@@6 Integer_value))
)) (forall ((o_3@@7 T@U) (f_5@@1 T@U) ) (! (let ((B@@13 (FieldTypeInv1 (type f_5@@1))))
(let ((A@@14 (FieldTypeInv0 (type f_5@@1))))
 (=> (and (and (= (type o_3@@7) RefType) (= (type f_5@@1) (FieldType A@@14 B@@13))) (not (= f_5@@1 Integer_value))) (= (U_2_real (MapType1Select QPMask@5 o_3@@7 f_5@@1)) (U_2_real (MapType1Select QPMask@6 o_3@@7 f_5@@1))))))
 :qid |stdinbpl.2364:31|
 :skolemid |196|
 :pattern ( (MapType1Select QPMask@6 o_3@@7 f_5@@1))
))) (and (IdenticalOnKnownLocations Heap@@9 ExhaleHeap@0 QPMask@6) (= (|Seq#Length| ar) len))) (and (=> (= (ControlFlow 0 46) (- 0 59)) (forall ((i_31 Int) (i_31_1 Int) ) (!  (=> (and (and (and (and (not (= i_31 i_31_1)) (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_31))) (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_31_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| ar i_31) (|Seq#Index| ar i_31_1))))
 :qid |stdinbpl.2378:17|
 :skolemid |197|
))) (=> (forall ((i_31@@0 Int) (i_31_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_31@@0 i_31_1@@0)) (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_31@@0))) (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_31_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| ar i_31@@0) (|Seq#Index| ar i_31_1@@0))))
 :qid |stdinbpl.2378:17|
 :skolemid |197|
)) (=> (forall ((i_31@@1 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_31@@1)) (< NoPerm FullPerm)) (and (qpRange24 (|Seq#Index| ar i_31@@1)) (= (invRecv24 (|Seq#Index| ar i_31@@1)) i_31@@1)))
 :qid |stdinbpl.2384:24|
 :skolemid |198|
 :pattern ( (|Seq#Index| ar i_31@@1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 len) (int_2_U i_31@@1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_31@@1)))
 :pattern ( (|Seq#Index| ar i_31@@1))
)) (=> (and (forall ((o_3@@8 T@U) ) (!  (=> (= (type o_3@@8) RefType) (=> (and (and (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U (invRecv24 o_3@@8))) (< NoPerm FullPerm)) (qpRange24 o_3@@8)) (= (|Seq#Index| ar (invRecv24 o_3@@8)) o_3@@8)))
 :qid |stdinbpl.2388:24|
 :skolemid |199|
 :pattern ( (invRecv24 o_3@@8))
)) (forall ((i_31@@2 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_31@@2)) (not (= (|Seq#Index| ar i_31@@2) null)))
 :qid |stdinbpl.2394:24|
 :skolemid |200|
 :pattern ( (|Seq#Index| ar i_31@@2))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 len) (int_2_U i_31@@2)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_31@@2)))
 :pattern ( (|Seq#Index| ar i_31@@2))
))) (=> (and (and (forall ((o_3@@9 T@U) ) (!  (=> (= (type o_3@@9) RefType) (and (=> (and (and (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U (invRecv24 o_3@@9))) (< NoPerm FullPerm)) (qpRange24 o_3@@9)) (and (=> (< NoPerm FullPerm) (= (|Seq#Index| ar (invRecv24 o_3@@9)) o_3@@9)) (= (U_2_real (MapType1Select QPMask@7 o_3@@9 Integer_value)) (+ (U_2_real (MapType1Select QPMask@6 o_3@@9 Integer_value)) FullPerm)))) (=> (not (and (and (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U (invRecv24 o_3@@9))) (< NoPerm FullPerm)) (qpRange24 o_3@@9))) (= (U_2_real (MapType1Select QPMask@7 o_3@@9 Integer_value)) (U_2_real (MapType1Select QPMask@6 o_3@@9 Integer_value))))))
 :qid |stdinbpl.2400:24|
 :skolemid |201|
 :pattern ( (MapType1Select QPMask@7 o_3@@9 Integer_value))
)) (forall ((o_3@@10 T@U) (f_5@@2 T@U) ) (! (let ((B@@14 (FieldTypeInv1 (type f_5@@2))))
(let ((A@@15 (FieldTypeInv0 (type f_5@@2))))
 (=> (and (and (= (type o_3@@10) RefType) (= (type f_5@@2) (FieldType A@@15 B@@14))) (not (= f_5@@2 Integer_value))) (= (U_2_real (MapType1Select QPMask@6 o_3@@10 f_5@@2)) (U_2_real (MapType1Select QPMask@7 o_3@@10 f_5@@2))))))
 :qid |stdinbpl.2404:31|
 :skolemid |202|
 :pattern ( (MapType1Select QPMask@6 o_3@@10 f_5@@2))
 :pattern ( (MapType1Select QPMask@7 o_3@@10 f_5@@2))
))) (and (state ExhaleHeap@0 QPMask@7) (= (|Seq#Length| br) len))) (and (=> (= (ControlFlow 0 46) (- 0 58)) (forall ((i_32 Int) (i_32_1 Int) ) (!  (=> (and (and (and (and (not (= i_32 i_32_1)) (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_32))) (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_32_1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= (|Seq#Index| br i_32) (|Seq#Index| br i_32_1))))
 :qid |stdinbpl.2413:17|
 :skolemid |203|
))) (=> (forall ((i_32@@0 Int) (i_32_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_32@@0 i_32_1@@0)) (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_32@@0))) (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_32_1@@0))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= (|Seq#Index| br i_32@@0) (|Seq#Index| br i_32_1@@0))))
 :qid |stdinbpl.2413:17|
 :skolemid |203|
)) (=> (and (forall ((i_32@@1 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_32@@1)) (< NoPerm (/ (to_real 1) (to_real 2)))) (and (qpRange25 (|Seq#Index| br i_32@@1)) (= (invRecv25 (|Seq#Index| br i_32@@1)) i_32@@1)))
 :qid |stdinbpl.2419:24|
 :skolemid |204|
 :pattern ( (|Seq#Index| br i_32@@1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 len) (int_2_U i_32@@1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_32@@1)))
 :pattern ( (|Seq#Index| br i_32@@1))
)) (forall ((o_3@@11 T@U) ) (!  (=> (= (type o_3@@11) RefType) (=> (and (and (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U (invRecv25 o_3@@11))) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange25 o_3@@11)) (= (|Seq#Index| br (invRecv25 o_3@@11)) o_3@@11)))
 :qid |stdinbpl.2423:24|
 :skolemid |205|
 :pattern ( (invRecv25 o_3@@11))
))) (and (=> (= (ControlFlow 0 46) (- 0 57)) (forall ((i_32@@2 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_32@@2)) (>= (/ (to_real 1) (to_real 2)) NoPerm))
 :qid |stdinbpl.2429:17|
 :skolemid |206|
 :pattern ( (|Seq#Index| br i_32@@2))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 len) (int_2_U i_32@@2)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_32@@2)))
 :pattern ( (|Seq#Index| br i_32@@2))
))) (=> (forall ((i_32@@3 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_32@@3)) (>= (/ (to_real 1) (to_real 2)) NoPerm))
 :qid |stdinbpl.2429:17|
 :skolemid |206|
 :pattern ( (|Seq#Index| br i_32@@3))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 len) (int_2_U i_32@@3)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_32@@3)))
 :pattern ( (|Seq#Index| br i_32@@3))
)) (=> (forall ((i_32@@4 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_32@@4)) (> (/ (to_real 1) (to_real 2)) NoPerm)) (not (= (|Seq#Index| br i_32@@4) null)))
 :qid |stdinbpl.2435:24|
 :skolemid |207|
 :pattern ( (|Seq#Index| br i_32@@4))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 len) (int_2_U i_32@@4)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_32@@4)))
 :pattern ( (|Seq#Index| br i_32@@4))
)) (=> (and (and (forall ((o_3@@12 T@U) ) (!  (=> (= (type o_3@@12) RefType) (and (=> (and (and (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U (invRecv25 o_3@@12))) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange25 o_3@@12)) (and (=> (< NoPerm (/ (to_real 1) (to_real 2))) (= (|Seq#Index| br (invRecv25 o_3@@12)) o_3@@12)) (= (U_2_real (MapType1Select QPMask@8 o_3@@12 Integer_value)) (+ (U_2_real (MapType1Select QPMask@7 o_3@@12 Integer_value)) (/ (to_real 1) (to_real 2)))))) (=> (not (and (and (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U (invRecv25 o_3@@12))) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange25 o_3@@12))) (= (U_2_real (MapType1Select QPMask@8 o_3@@12 Integer_value)) (U_2_real (MapType1Select QPMask@7 o_3@@12 Integer_value))))))
 :qid |stdinbpl.2441:24|
 :skolemid |208|
 :pattern ( (MapType1Select QPMask@8 o_3@@12 Integer_value))
)) (forall ((o_3@@13 T@U) (f_5@@3 T@U) ) (! (let ((B@@15 (FieldTypeInv1 (type f_5@@3))))
(let ((A@@16 (FieldTypeInv0 (type f_5@@3))))
 (=> (and (and (= (type o_3@@13) RefType) (= (type f_5@@3) (FieldType A@@16 B@@15))) (not (= f_5@@3 Integer_value))) (= (U_2_real (MapType1Select QPMask@7 o_3@@13 f_5@@3)) (U_2_real (MapType1Select QPMask@8 o_3@@13 f_5@@3))))))
 :qid |stdinbpl.2445:31|
 :skolemid |209|
 :pattern ( (MapType1Select QPMask@7 o_3@@13 f_5@@3))
 :pattern ( (MapType1Select QPMask@8 o_3@@13 f_5@@3))
))) (and (state ExhaleHeap@0 QPMask@8) (= (|Seq#Length| cr) len))) (and (=> (= (ControlFlow 0 46) (- 0 56)) (forall ((i_33 Int) (i_33_1 Int) ) (!  (=> (and (and (and (and (not (= i_33 i_33_1)) (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_33))) (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_33_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| cr i_33) (|Seq#Index| cr i_33_1))))
 :qid |stdinbpl.2454:17|
 :skolemid |210|
))) (=> (forall ((i_33@@0 Int) (i_33_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_33@@0 i_33_1@@0)) (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_33@@0))) (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_33_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| cr i_33@@0) (|Seq#Index| cr i_33_1@@0))))
 :qid |stdinbpl.2454:17|
 :skolemid |210|
)) (=> (and (and (and (forall ((i_33@@1 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_33@@1)) (< NoPerm FullPerm)) (and (qpRange26 (|Seq#Index| cr i_33@@1)) (= (invRecv26 (|Seq#Index| cr i_33@@1)) i_33@@1)))
 :qid |stdinbpl.2460:24|
 :skolemid |211|
 :pattern ( (|Seq#Index| cr i_33@@1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 len) (int_2_U i_33@@1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_33@@1)))
 :pattern ( (|Seq#Index| cr i_33@@1))
)) (forall ((o_3@@14 T@U) ) (!  (=> (= (type o_3@@14) RefType) (=> (and (and (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U (invRecv26 o_3@@14))) (< NoPerm FullPerm)) (qpRange26 o_3@@14)) (= (|Seq#Index| cr (invRecv26 o_3@@14)) o_3@@14)))
 :qid |stdinbpl.2464:24|
 :skolemid |212|
 :pattern ( (invRecv26 o_3@@14))
))) (and (forall ((i_33@@2 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_33@@2)) (not (= (|Seq#Index| cr i_33@@2) null)))
 :qid |stdinbpl.2470:24|
 :skolemid |213|
 :pattern ( (|Seq#Index| cr i_33@@2))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 len) (int_2_U i_33@@2)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_33@@2)))
 :pattern ( (|Seq#Index| cr i_33@@2))
)) (forall ((o_3@@15 T@U) ) (!  (=> (= (type o_3@@15) RefType) (and (=> (and (and (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U (invRecv26 o_3@@15))) (< NoPerm FullPerm)) (qpRange26 o_3@@15)) (and (=> (< NoPerm FullPerm) (= (|Seq#Index| cr (invRecv26 o_3@@15)) o_3@@15)) (= (U_2_real (MapType1Select QPMask@9 o_3@@15 Integer_value)) (+ (U_2_real (MapType1Select QPMask@8 o_3@@15 Integer_value)) FullPerm)))) (=> (not (and (and (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U (invRecv26 o_3@@15))) (< NoPerm FullPerm)) (qpRange26 o_3@@15))) (= (U_2_real (MapType1Select QPMask@9 o_3@@15 Integer_value)) (U_2_real (MapType1Select QPMask@8 o_3@@15 Integer_value))))))
 :qid |stdinbpl.2476:24|
 :skolemid |214|
 :pattern ( (MapType1Select QPMask@9 o_3@@15 Integer_value))
)))) (and (and (forall ((o_3@@16 T@U) (f_5@@4 T@U) ) (! (let ((B@@16 (FieldTypeInv1 (type f_5@@4))))
(let ((A@@17 (FieldTypeInv0 (type f_5@@4))))
 (=> (and (and (= (type o_3@@16) RefType) (= (type f_5@@4) (FieldType A@@17 B@@16))) (not (= f_5@@4 Integer_value))) (= (U_2_real (MapType1Select QPMask@8 o_3@@16 f_5@@4)) (U_2_real (MapType1Select QPMask@9 o_3@@16 f_5@@4))))))
 :qid |stdinbpl.2480:31|
 :skolemid |215|
 :pattern ( (MapType1Select QPMask@8 o_3@@16 f_5@@4))
 :pattern ( (MapType1Select QPMask@9 o_3@@16 f_5@@4))
)) (state ExhaleHeap@0 QPMask@9)) (and (state ExhaleHeap@0 QPMask@9) (state ExhaleHeap@0 QPMask@9)))) (and (=> (= (ControlFlow 0 46) (- 0 55)) (= (|Seq#Length| ar) len)) (=> (= (|Seq#Length| ar) len) (and (=> (= (ControlFlow 0 46) (- 0 54)) (forall ((i_18 Int) (i_18_1 Int) ) (!  (=> (and (and (and (and (not (= i_18 i_18_1)) (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_18))) (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_18_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| ar i_18) (|Seq#Index| ar i_18_1))))
 :qid |stdinbpl.2501:17|
 :skolemid |216|
 :pattern ( (neverTriggered17 i_18) (neverTriggered17 i_18_1))
))) (=> (forall ((i_18@@0 Int) (i_18_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_18@@0 i_18_1@@0)) (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_18@@0))) (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_18_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| ar i_18@@0) (|Seq#Index| ar i_18_1@@0))))
 :qid |stdinbpl.2501:17|
 :skolemid |216|
 :pattern ( (neverTriggered17 i_18@@0) (neverTriggered17 i_18_1@@0))
)) (and (=> (= (ControlFlow 0 46) (- 0 53)) (forall ((i_18@@1 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_18@@1)) (>= (U_2_real (MapType1Select QPMask@9 (|Seq#Index| ar i_18@@1) Integer_value)) FullPerm))
 :qid |stdinbpl.2508:17|
 :skolemid |217|
 :pattern ( (|Seq#Index| ar i_18@@1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 len) (int_2_U i_18@@1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_18@@1)))
 :pattern ( (|Seq#Index| ar i_18@@1))
))) (=> (forall ((i_18@@2 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_18@@2)) (>= (U_2_real (MapType1Select QPMask@9 (|Seq#Index| ar i_18@@2) Integer_value)) FullPerm))
 :qid |stdinbpl.2508:17|
 :skolemid |217|
 :pattern ( (|Seq#Index| ar i_18@@2))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 len) (int_2_U i_18@@2)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_18@@2)))
 :pattern ( (|Seq#Index| ar i_18@@2))
)) (=> (and (and (forall ((i_18@@3 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_18@@3)) (< NoPerm FullPerm)) (and (qpRange17 (|Seq#Index| ar i_18@@3)) (= (invRecv17 (|Seq#Index| ar i_18@@3)) i_18@@3)))
 :qid |stdinbpl.2514:22|
 :skolemid |218|
 :pattern ( (|Seq#Index| ar i_18@@3))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 len) (int_2_U i_18@@3)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_18@@3)))
 :pattern ( (|Seq#Index| ar i_18@@3))
)) (forall ((o_3@@17 T@U) ) (!  (=> (= (type o_3@@17) RefType) (=> (and (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U (invRecv17 o_3@@17))) (and (< NoPerm FullPerm) (qpRange17 o_3@@17))) (= (|Seq#Index| ar (invRecv17 o_3@@17)) o_3@@17)))
 :qid |stdinbpl.2518:22|
 :skolemid |219|
 :pattern ( (invRecv17 o_3@@17))
))) (and (forall ((o_3@@18 T@U) ) (!  (=> (= (type o_3@@18) RefType) (and (=> (and (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U (invRecv17 o_3@@18))) (and (< NoPerm FullPerm) (qpRange17 o_3@@18))) (and (= (|Seq#Index| ar (invRecv17 o_3@@18)) o_3@@18) (= (U_2_real (MapType1Select QPMask@10 o_3@@18 Integer_value)) (- (U_2_real (MapType1Select QPMask@9 o_3@@18 Integer_value)) FullPerm)))) (=> (not (and (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U (invRecv17 o_3@@18))) (and (< NoPerm FullPerm) (qpRange17 o_3@@18)))) (= (U_2_real (MapType1Select QPMask@10 o_3@@18 Integer_value)) (U_2_real (MapType1Select QPMask@9 o_3@@18 Integer_value))))))
 :qid |stdinbpl.2524:22|
 :skolemid |220|
 :pattern ( (MapType1Select QPMask@10 o_3@@18 Integer_value))
)) (forall ((o_3@@19 T@U) (f_5@@5 T@U) ) (! (let ((B@@17 (FieldTypeInv1 (type f_5@@5))))
(let ((A@@18 (FieldTypeInv0 (type f_5@@5))))
 (=> (and (and (= (type o_3@@19) RefType) (= (type f_5@@5) (FieldType A@@18 B@@17))) (not (= f_5@@5 Integer_value))) (= (U_2_real (MapType1Select QPMask@9 o_3@@19 f_5@@5)) (U_2_real (MapType1Select QPMask@10 o_3@@19 f_5@@5))))))
 :qid |stdinbpl.2530:29|
 :skolemid |221|
 :pattern ( (MapType1Select QPMask@10 o_3@@19 f_5@@5))
)))) (and (=> (= (ControlFlow 0 46) (- 0 52)) (= (|Seq#Length| br) len)) (=> (= (|Seq#Length| br) len) (and (=> (= (ControlFlow 0 46) (- 0 51)) (forall ((i_19 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_19)) (dummyFunction (MapType0Select ExhaleHeap@0 (|Seq#Index| br i_19) Integer_value))) (>= (/ (to_real 1) (to_real 2)) NoPerm))
 :qid |stdinbpl.2541:17|
 :skolemid |222|
 :pattern ( (|Seq#Index| br i_19))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 len) (int_2_U i_19)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_19)))
 :pattern ( (|Seq#Index| br i_19))
))) (=> (forall ((i_19@@0 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_19@@0)) (dummyFunction (MapType0Select ExhaleHeap@0 (|Seq#Index| br i_19@@0) Integer_value))) (>= (/ (to_real 1) (to_real 2)) NoPerm))
 :qid |stdinbpl.2541:17|
 :skolemid |222|
 :pattern ( (|Seq#Index| br i_19@@0))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 len) (int_2_U i_19@@0)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_19@@0)))
 :pattern ( (|Seq#Index| br i_19@@0))
)) (and (=> (= (ControlFlow 0 46) (- 0 50)) (forall ((i_19@@1 Int) (i_19_1 Int) ) (!  (=> (and (and (and (and (not (= i_19@@1 i_19_1)) (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_19@@1))) (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_19_1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= (|Seq#Index| br i_19@@1) (|Seq#Index| br i_19_1))))
 :qid |stdinbpl.2548:17|
 :skolemid |223|
 :pattern ( (neverTriggered18 i_19@@1) (neverTriggered18 i_19_1))
))) (=> (forall ((i_19@@2 Int) (i_19_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_19@@2 i_19_1@@0)) (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_19@@2))) (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_19_1@@0))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= (|Seq#Index| br i_19@@2) (|Seq#Index| br i_19_1@@0))))
 :qid |stdinbpl.2548:17|
 :skolemid |223|
 :pattern ( (neverTriggered18 i_19@@2) (neverTriggered18 i_19_1@@0))
)) (and (=> (= (ControlFlow 0 46) (- 0 49)) (forall ((i_19@@3 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_19@@3)) (>= (U_2_real (MapType1Select QPMask@10 (|Seq#Index| br i_19@@3) Integer_value)) (/ (to_real 1) (to_real 2))))
 :qid |stdinbpl.2555:17|
 :skolemid |224|
 :pattern ( (|Seq#Index| br i_19@@3))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 len) (int_2_U i_19@@3)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_19@@3)))
 :pattern ( (|Seq#Index| br i_19@@3))
))) (=> (forall ((i_19@@4 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_19@@4)) (>= (U_2_real (MapType1Select QPMask@10 (|Seq#Index| br i_19@@4) Integer_value)) (/ (to_real 1) (to_real 2))))
 :qid |stdinbpl.2555:17|
 :skolemid |224|
 :pattern ( (|Seq#Index| br i_19@@4))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 len) (int_2_U i_19@@4)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_19@@4)))
 :pattern ( (|Seq#Index| br i_19@@4))
)) (=> (and (and (forall ((i_19@@5 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_19@@5)) (< NoPerm (/ (to_real 1) (to_real 2)))) (and (qpRange18 (|Seq#Index| br i_19@@5)) (= (invRecv18 (|Seq#Index| br i_19@@5)) i_19@@5)))
 :qid |stdinbpl.2561:22|
 :skolemid |225|
 :pattern ( (|Seq#Index| br i_19@@5))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 len) (int_2_U i_19@@5)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_19@@5)))
 :pattern ( (|Seq#Index| br i_19@@5))
)) (forall ((o_3@@20 T@U) ) (!  (=> (= (type o_3@@20) RefType) (=> (and (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U (invRecv18 o_3@@20))) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange18 o_3@@20))) (= (|Seq#Index| br (invRecv18 o_3@@20)) o_3@@20)))
 :qid |stdinbpl.2565:22|
 :skolemid |226|
 :pattern ( (invRecv18 o_3@@20))
))) (and (forall ((o_3@@21 T@U) ) (!  (=> (= (type o_3@@21) RefType) (and (=> (and (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U (invRecv18 o_3@@21))) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange18 o_3@@21))) (and (= (|Seq#Index| br (invRecv18 o_3@@21)) o_3@@21) (= (U_2_real (MapType1Select QPMask@11 o_3@@21 Integer_value)) (- (U_2_real (MapType1Select QPMask@10 o_3@@21 Integer_value)) (/ (to_real 1) (to_real 2)))))) (=> (not (and (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U (invRecv18 o_3@@21))) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange18 o_3@@21)))) (= (U_2_real (MapType1Select QPMask@11 o_3@@21 Integer_value)) (U_2_real (MapType1Select QPMask@10 o_3@@21 Integer_value))))))
 :qid |stdinbpl.2571:22|
 :skolemid |227|
 :pattern ( (MapType1Select QPMask@11 o_3@@21 Integer_value))
)) (forall ((o_3@@22 T@U) (f_5@@6 T@U) ) (! (let ((B@@18 (FieldTypeInv1 (type f_5@@6))))
(let ((A@@19 (FieldTypeInv0 (type f_5@@6))))
 (=> (and (and (= (type o_3@@22) RefType) (= (type f_5@@6) (FieldType A@@19 B@@18))) (not (= f_5@@6 Integer_value))) (= (U_2_real (MapType1Select QPMask@10 o_3@@22 f_5@@6)) (U_2_real (MapType1Select QPMask@11 o_3@@22 f_5@@6))))))
 :qid |stdinbpl.2577:29|
 :skolemid |228|
 :pattern ( (MapType1Select QPMask@11 o_3@@22 f_5@@6))
)))) (and (=> (= (ControlFlow 0 46) (- 0 48)) (= (|Seq#Length| cr) len)) (=> (= (|Seq#Length| cr) len) (and (=> (= (ControlFlow 0 46) (- 0 47)) (forall ((i_20 Int) (i_20_1 Int) ) (!  (=> (and (and (and (and (not (= i_20 i_20_1)) (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_20))) (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_20_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| cr i_20) (|Seq#Index| cr i_20_1))))
 :qid |stdinbpl.2591:17|
 :skolemid |229|
 :pattern ( (neverTriggered19 i_20) (neverTriggered19 i_20_1))
))) (=> (forall ((i_20@@0 Int) (i_20_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_20@@0 i_20_1@@0)) (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_20@@0))) (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_20_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| cr i_20@@0) (|Seq#Index| cr i_20_1@@0))))
 :qid |stdinbpl.2591:17|
 :skolemid |229|
 :pattern ( (neverTriggered19 i_20@@0) (neverTriggered19 i_20_1@@0))
)) (=> (= (ControlFlow 0 46) (- 0 45)) (forall ((i_20@@1 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_20@@1)) (>= (U_2_real (MapType1Select QPMask@11 (|Seq#Index| cr i_20@@1) Integer_value)) FullPerm))
 :qid |stdinbpl.2598:17|
 :skolemid |230|
 :pattern ( (|Seq#Index| cr i_20@@1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 len) (int_2_U i_20@@1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_20@@1)))
 :pattern ( (|Seq#Index| cr i_20@@1))
)))))))))))))))))))))))))))))))))))))))))))))))
(let ((anon75_Else_correct  (=> (forall ((i_26_1 Int) (j_9_1 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_26_1)) (and (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U j_9_1)) (not (= i_26_1 j_9_1)))) (not (= (|Seq#Index| br i_26_1) (|Seq#Index| br j_9_1))))
 :qid |stdinbpl.2266:22|
 :skolemid |182|
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 len) (int_2_U i_26_1)) (|Seq#ContainsTrigger| (|Seq#Range| 0 len) (int_2_U j_9_1)))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 len) (int_2_U i_26_1)) (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U j_9_1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_26_1)) (|Seq#ContainsTrigger| (|Seq#Range| 0 len) (int_2_U j_9_1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_26_1)) (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U j_9_1)))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 len) (int_2_U i_26_1)) (|Seq#Index| br j_9_1))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_26_1)) (|Seq#Index| br j_9_1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 len) (int_2_U j_9_1)) (|Seq#Index| br i_26_1))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U j_9_1)) (|Seq#Index| br i_26_1))
 :pattern ( (|Seq#Index| br i_26_1) (|Seq#Index| br j_9_1))
)) (and (=> (= (ControlFlow 0 66) (- 0 70)) (forall ((i_27 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_27)) (dummyFunction (MapType0Select Heap@@9 (|Seq#Index| br i_27) Integer_value))) (>= (/ (to_real 1) (to_real 2)) NoPerm))
 :qid |stdinbpl.2274:19|
 :skolemid |183|
 :pattern ( (|Seq#Index| br i_27))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 len) (int_2_U i_27)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_27)))
 :pattern ( (|Seq#Index| br i_27))
))) (=> (forall ((i_27@@0 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_27@@0)) (dummyFunction (MapType0Select Heap@@9 (|Seq#Index| br i_27@@0) Integer_value))) (>= (/ (to_real 1) (to_real 2)) NoPerm))
 :qid |stdinbpl.2274:19|
 :skolemid |183|
 :pattern ( (|Seq#Index| br i_27@@0))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 len) (int_2_U i_27@@0)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_27@@0)))
 :pattern ( (|Seq#Index| br i_27@@0))
)) (and (=> (= (ControlFlow 0 66) (- 0 69)) (forall ((i_27@@1 Int) (i_27_1 Int) ) (!  (=> (and (and (and (and (not (= i_27@@1 i_27_1)) (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_27@@1))) (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_27_1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= (|Seq#Index| br i_27@@1) (|Seq#Index| br i_27_1))))
 :qid |stdinbpl.2281:19|
 :skolemid |184|
 :pattern ( (neverTriggered22 i_27@@1) (neverTriggered22 i_27_1))
))) (=> (forall ((i_27@@2 Int) (i_27_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_27@@2 i_27_1@@0)) (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_27@@2))) (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_27_1@@0))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= (|Seq#Index| br i_27@@2) (|Seq#Index| br i_27_1@@0))))
 :qid |stdinbpl.2281:19|
 :skolemid |184|
 :pattern ( (neverTriggered22 i_27@@2) (neverTriggered22 i_27_1@@0))
)) (and (=> (= (ControlFlow 0 66) (- 0 68)) (forall ((i_27@@3 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_27@@3)) (>= (U_2_real (MapType1Select QPMask@4 (|Seq#Index| br i_27@@3) Integer_value)) (/ (to_real 1) (to_real 2))))
 :qid |stdinbpl.2288:19|
 :skolemid |185|
 :pattern ( (|Seq#Index| br i_27@@3))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 len) (int_2_U i_27@@3)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_27@@3)))
 :pattern ( (|Seq#Index| br i_27@@3))
))) (=> (forall ((i_27@@4 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_27@@4)) (>= (U_2_real (MapType1Select QPMask@4 (|Seq#Index| br i_27@@4) Integer_value)) (/ (to_real 1) (to_real 2))))
 :qid |stdinbpl.2288:19|
 :skolemid |185|
 :pattern ( (|Seq#Index| br i_27@@4))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 len) (int_2_U i_27@@4)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_27@@4)))
 :pattern ( (|Seq#Index| br i_27@@4))
)) (=> (and (and (forall ((i_27@@5 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_27@@5)) (< NoPerm (/ (to_real 1) (to_real 2)))) (and (qpRange22 (|Seq#Index| br i_27@@5)) (= (invRecv22 (|Seq#Index| br i_27@@5)) i_27@@5)))
 :qid |stdinbpl.2294:24|
 :skolemid |186|
 :pattern ( (|Seq#Index| br i_27@@5))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 len) (int_2_U i_27@@5)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_27@@5)))
 :pattern ( (|Seq#Index| br i_27@@5))
)) (forall ((o_3@@23 T@U) ) (!  (=> (= (type o_3@@23) RefType) (=> (and (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U (invRecv22 o_3@@23))) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange22 o_3@@23))) (= (|Seq#Index| br (invRecv22 o_3@@23)) o_3@@23)))
 :qid |stdinbpl.2298:24|
 :skolemid |187|
 :pattern ( (invRecv22 o_3@@23))
))) (and (forall ((o_3@@24 T@U) ) (!  (=> (= (type o_3@@24) RefType) (and (=> (and (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U (invRecv22 o_3@@24))) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange22 o_3@@24))) (and (= (|Seq#Index| br (invRecv22 o_3@@24)) o_3@@24) (= (U_2_real (MapType1Select QPMask@5 o_3@@24 Integer_value)) (- (U_2_real (MapType1Select QPMask@4 o_3@@24 Integer_value)) (/ (to_real 1) (to_real 2)))))) (=> (not (and (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U (invRecv22 o_3@@24))) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange22 o_3@@24)))) (= (U_2_real (MapType1Select QPMask@5 o_3@@24 Integer_value)) (U_2_real (MapType1Select QPMask@4 o_3@@24 Integer_value))))))
 :qid |stdinbpl.2304:24|
 :skolemid |188|
 :pattern ( (MapType1Select QPMask@5 o_3@@24 Integer_value))
)) (forall ((o_3@@25 T@U) (f_5@@7 T@U) ) (! (let ((B@@19 (FieldTypeInv1 (type f_5@@7))))
(let ((A@@20 (FieldTypeInv0 (type f_5@@7))))
 (=> (and (and (= (type o_3@@25) RefType) (= (type f_5@@7) (FieldType A@@20 B@@19))) (not (= f_5@@7 Integer_value))) (= (U_2_real (MapType1Select QPMask@4 o_3@@25 f_5@@7)) (U_2_real (MapType1Select QPMask@5 o_3@@25 f_5@@7))))))
 :qid |stdinbpl.2310:31|
 :skolemid |189|
 :pattern ( (MapType1Select QPMask@5 o_3@@25 f_5@@7))
)))) (and (=> (= (ControlFlow 0 66) (- 0 67)) (= (|Seq#Length| cr) len)) (=> (= (|Seq#Length| cr) len) (and (and (=> (= (ControlFlow 0 66) 46) anon77_Else_correct) (=> (= (ControlFlow 0 66) 63) anon78_Then_correct)) (=> (= (ControlFlow 0 66) 65) anon78_Else_correct))))))))))))))
(let ((anon47_correct true))
(let ((anon76_Else_correct  (=> (and (not (and (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_25_1)) (and (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U j_8_1)) (not (= i_25_1 j_8_1))))) (= (ControlFlow 0 44) 41)) anon47_correct)))
(let ((anon76_Then_correct  (=> (and (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_25_1)) (and (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U j_8_1)) (not (= i_25_1 j_8_1)))) (and (=> (= (ControlFlow 0 42) (- 0 43)) (not (= (|Seq#Index| br i_25_1) (|Seq#Index| br j_8_1)))) (=> (not (= (|Seq#Index| br i_25_1) (|Seq#Index| br j_8_1))) (=> (= (ControlFlow 0 42) 41) anon47_correct))))))
(let ((anon44_correct  (=> (= Mask@0 (MapType1Store QPMask@3 (|Seq#Index| ar 0) Integer_value (real_2_U (- (U_2_real (MapType1Select QPMask@3 (|Seq#Index| ar 0) Integer_value)) perm@0)))) (and (=> (= (ControlFlow 0 71) (- 0 75)) (forall ((i_24 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 1 (+ (- (|Seq#Length| ar) 1) 1)) (int_2_U i_24)) (dummyFunction (MapType0Select Heap@@9 (|Seq#Index| ar i_24) Integer_value))) (>= (/ (to_real 1) (to_real 2)) NoPerm))
 :qid |stdinbpl.2216:19|
 :skolemid |175|
 :pattern ( (|Seq#Index| ar i_24))
 :pattern ( (|Seq#Index| ar i_24))
))) (=> (forall ((i_24@@0 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 1 (+ (- (|Seq#Length| ar) 1) 1)) (int_2_U i_24@@0)) (dummyFunction (MapType0Select Heap@@9 (|Seq#Index| ar i_24@@0) Integer_value))) (>= (/ (to_real 1) (to_real 2)) NoPerm))
 :qid |stdinbpl.2216:19|
 :skolemid |175|
 :pattern ( (|Seq#Index| ar i_24@@0))
 :pattern ( (|Seq#Index| ar i_24@@0))
)) (and (=> (= (ControlFlow 0 71) (- 0 74)) (forall ((i_24@@1 Int) (i_24_1 Int) ) (!  (=> (and (and (and (and (not (= i_24@@1 i_24_1)) (|Seq#Contains| (|Seq#Range| 1 (+ (- (|Seq#Length| ar) 1) 1)) (int_2_U i_24@@1))) (|Seq#Contains| (|Seq#Range| 1 (+ (- (|Seq#Length| ar) 1) 1)) (int_2_U i_24_1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= (|Seq#Index| ar i_24@@1) (|Seq#Index| ar i_24_1))))
 :qid |stdinbpl.2223:19|
 :skolemid |176|
 :pattern ( (neverTriggered21 i_24@@1) (neverTriggered21 i_24_1))
))) (=> (forall ((i_24@@2 Int) (i_24_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_24@@2 i_24_1@@0)) (|Seq#Contains| (|Seq#Range| 1 (+ (- (|Seq#Length| ar) 1) 1)) (int_2_U i_24@@2))) (|Seq#Contains| (|Seq#Range| 1 (+ (- (|Seq#Length| ar) 1) 1)) (int_2_U i_24_1@@0))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= (|Seq#Index| ar i_24@@2) (|Seq#Index| ar i_24_1@@0))))
 :qid |stdinbpl.2223:19|
 :skolemid |176|
 :pattern ( (neverTriggered21 i_24@@2) (neverTriggered21 i_24_1@@0))
)) (and (=> (= (ControlFlow 0 71) (- 0 73)) (forall ((i_24@@3 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 1 (+ (- (|Seq#Length| ar) 1) 1)) (int_2_U i_24@@3)) (>= (U_2_real (MapType1Select Mask@0 (|Seq#Index| ar i_24@@3) Integer_value)) (/ (to_real 1) (to_real 2))))
 :qid |stdinbpl.2230:19|
 :skolemid |177|
 :pattern ( (|Seq#Index| ar i_24@@3))
 :pattern ( (|Seq#Index| ar i_24@@3))
))) (=> (forall ((i_24@@4 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 1 (+ (- (|Seq#Length| ar) 1) 1)) (int_2_U i_24@@4)) (>= (U_2_real (MapType1Select Mask@0 (|Seq#Index| ar i_24@@4) Integer_value)) (/ (to_real 1) (to_real 2))))
 :qid |stdinbpl.2230:19|
 :skolemid |177|
 :pattern ( (|Seq#Index| ar i_24@@4))
 :pattern ( (|Seq#Index| ar i_24@@4))
)) (=> (and (and (forall ((i_24@@5 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 1 (+ (- (|Seq#Length| ar) 1) 1)) (int_2_U i_24@@5)) (< NoPerm (/ (to_real 1) (to_real 2)))) (and (qpRange21 (|Seq#Index| ar i_24@@5)) (= (invRecv21 (|Seq#Index| ar i_24@@5)) i_24@@5)))
 :qid |stdinbpl.2236:24|
 :skolemid |178|
 :pattern ( (|Seq#Index| ar i_24@@5))
 :pattern ( (|Seq#Index| ar i_24@@5))
)) (forall ((o_3@@26 T@U) ) (!  (=> (= (type o_3@@26) RefType) (=> (and (|Seq#Contains| (|Seq#Range| 1 (+ (- (|Seq#Length| ar) 1) 1)) (int_2_U (invRecv21 o_3@@26))) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange21 o_3@@26))) (= (|Seq#Index| ar (invRecv21 o_3@@26)) o_3@@26)))
 :qid |stdinbpl.2240:24|
 :skolemid |179|
 :pattern ( (invRecv21 o_3@@26))
))) (and (forall ((o_3@@27 T@U) ) (!  (=> (= (type o_3@@27) RefType) (and (=> (and (|Seq#Contains| (|Seq#Range| 1 (+ (- (|Seq#Length| ar) 1) 1)) (int_2_U (invRecv21 o_3@@27))) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange21 o_3@@27))) (and (= (|Seq#Index| ar (invRecv21 o_3@@27)) o_3@@27) (= (U_2_real (MapType1Select QPMask@4 o_3@@27 Integer_value)) (- (U_2_real (MapType1Select Mask@0 o_3@@27 Integer_value)) (/ (to_real 1) (to_real 2)))))) (=> (not (and (|Seq#Contains| (|Seq#Range| 1 (+ (- (|Seq#Length| ar) 1) 1)) (int_2_U (invRecv21 o_3@@27))) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange21 o_3@@27)))) (= (U_2_real (MapType1Select QPMask@4 o_3@@27 Integer_value)) (U_2_real (MapType1Select Mask@0 o_3@@27 Integer_value))))))
 :qid |stdinbpl.2246:24|
 :skolemid |180|
 :pattern ( (MapType1Select QPMask@4 o_3@@27 Integer_value))
)) (forall ((o_3@@28 T@U) (f_5@@8 T@U) ) (! (let ((B@@20 (FieldTypeInv1 (type f_5@@8))))
(let ((A@@21 (FieldTypeInv0 (type f_5@@8))))
 (=> (and (and (= (type o_3@@28) RefType) (= (type f_5@@8) (FieldType A@@21 B@@20))) (not (= f_5@@8 Integer_value))) (= (U_2_real (MapType1Select Mask@0 o_3@@28 f_5@@8)) (U_2_real (MapType1Select QPMask@4 o_3@@28 f_5@@8))))))
 :qid |stdinbpl.2252:31|
 :skolemid |181|
 :pattern ( (MapType1Select QPMask@4 o_3@@28 f_5@@8))
)))) (and (=> (= (ControlFlow 0 71) (- 0 72)) (= (|Seq#Length| br) len)) (=> (= (|Seq#Length| br) len) (and (and (=> (= (ControlFlow 0 71) 66) anon75_Else_correct) (=> (= (ControlFlow 0 71) 42) anon76_Then_correct)) (=> (= (ControlFlow 0 71) 44) anon76_Else_correct))))))))))))))
(let ((anon74_Else_correct  (=> (and (= perm@0 NoPerm) (= (ControlFlow 0 78) 71)) anon44_correct)))
(let ((anon74_Then_correct  (=> (not (= perm@0 NoPerm)) (and (=> (= (ControlFlow 0 76) (- 0 77)) (<= perm@0 (U_2_real (MapType1Select QPMask@3 (|Seq#Index| ar 0) Integer_value)))) (=> (<= perm@0 (U_2_real (MapType1Select QPMask@3 (|Seq#Index| ar 0) Integer_value))) (=> (= (ControlFlow 0 76) 71) anon44_correct))))))
(let ((anon72_Else_correct  (=> (forall ((i_22_1_1 Int) (j_7_1 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_22_1_1)) (and (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U j_7_1)) (not (= i_22_1_1 j_7_1)))) (not (= (|Seq#Index| ar i_22_1_1) (|Seq#Index| ar j_7_1))))
 :qid |stdinbpl.2155:22|
 :skolemid |167|
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 len) (int_2_U i_22_1_1)) (|Seq#ContainsTrigger| (|Seq#Range| 0 len) (int_2_U j_7_1)))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 len) (int_2_U i_22_1_1)) (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U j_7_1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_22_1_1)) (|Seq#ContainsTrigger| (|Seq#Range| 0 len) (int_2_U j_7_1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_22_1_1)) (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U j_7_1)))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 len) (int_2_U i_22_1_1)) (|Seq#Index| ar j_7_1))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_22_1_1)) (|Seq#Index| ar j_7_1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 len) (int_2_U j_7_1)) (|Seq#Index| ar i_22_1_1))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U j_7_1)) (|Seq#Index| ar i_22_1_1))
 :pattern ( (|Seq#Index| ar i_22_1_1) (|Seq#Index| ar j_7_1))
)) (and (=> (= (ControlFlow 0 79) (- 0 83)) (forall ((i_23 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_23)) (dummyFunction (MapType0Select Heap@@9 (|Seq#Index| ar i_23) Integer_value))) (>= (/ (to_real 1) (to_real 2)) NoPerm))
 :qid |stdinbpl.2163:19|
 :skolemid |168|
 :pattern ( (|Seq#Index| ar i_23))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 len) (int_2_U i_23)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_23)))
 :pattern ( (|Seq#Index| ar i_23))
))) (=> (forall ((i_23@@0 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_23@@0)) (dummyFunction (MapType0Select Heap@@9 (|Seq#Index| ar i_23@@0) Integer_value))) (>= (/ (to_real 1) (to_real 2)) NoPerm))
 :qid |stdinbpl.2163:19|
 :skolemid |168|
 :pattern ( (|Seq#Index| ar i_23@@0))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 len) (int_2_U i_23@@0)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_23@@0)))
 :pattern ( (|Seq#Index| ar i_23@@0))
)) (and (=> (= (ControlFlow 0 79) (- 0 82)) (forall ((i_23@@1 Int) (i_23_1 Int) ) (!  (=> (and (and (and (and (not (= i_23@@1 i_23_1)) (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_23@@1))) (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_23_1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= (|Seq#Index| ar i_23@@1) (|Seq#Index| ar i_23_1))))
 :qid |stdinbpl.2170:19|
 :skolemid |169|
 :pattern ( (neverTriggered20 i_23@@1) (neverTriggered20 i_23_1))
))) (=> (forall ((i_23@@2 Int) (i_23_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_23@@2 i_23_1@@0)) (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_23@@2))) (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_23_1@@0))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= (|Seq#Index| ar i_23@@2) (|Seq#Index| ar i_23_1@@0))))
 :qid |stdinbpl.2170:19|
 :skolemid |169|
 :pattern ( (neverTriggered20 i_23@@2) (neverTriggered20 i_23_1@@0))
)) (and (=> (= (ControlFlow 0 79) (- 0 81)) (forall ((i_23@@3 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_23@@3)) (>= (U_2_real (MapType1Select QPMask@2 (|Seq#Index| ar i_23@@3) Integer_value)) (/ (to_real 1) (to_real 2))))
 :qid |stdinbpl.2177:19|
 :skolemid |170|
 :pattern ( (|Seq#Index| ar i_23@@3))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 len) (int_2_U i_23@@3)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_23@@3)))
 :pattern ( (|Seq#Index| ar i_23@@3))
))) (=> (forall ((i_23@@4 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_23@@4)) (>= (U_2_real (MapType1Select QPMask@2 (|Seq#Index| ar i_23@@4) Integer_value)) (/ (to_real 1) (to_real 2))))
 :qid |stdinbpl.2177:19|
 :skolemid |170|
 :pattern ( (|Seq#Index| ar i_23@@4))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 len) (int_2_U i_23@@4)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_23@@4)))
 :pattern ( (|Seq#Index| ar i_23@@4))
)) (=> (forall ((i_23@@5 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_23@@5)) (< NoPerm (/ (to_real 1) (to_real 2)))) (and (qpRange20 (|Seq#Index| ar i_23@@5)) (= (invRecv20 (|Seq#Index| ar i_23@@5)) i_23@@5)))
 :qid |stdinbpl.2183:24|
 :skolemid |171|
 :pattern ( (|Seq#Index| ar i_23@@5))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 len) (int_2_U i_23@@5)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_23@@5)))
 :pattern ( (|Seq#Index| ar i_23@@5))
)) (=> (and (and (forall ((o_3@@29 T@U) ) (!  (=> (= (type o_3@@29) RefType) (=> (and (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U (invRecv20 o_3@@29))) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange20 o_3@@29))) (= (|Seq#Index| ar (invRecv20 o_3@@29)) o_3@@29)))
 :qid |stdinbpl.2187:24|
 :skolemid |172|
 :pattern ( (invRecv20 o_3@@29))
)) (forall ((o_3@@30 T@U) ) (!  (=> (= (type o_3@@30) RefType) (and (=> (and (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U (invRecv20 o_3@@30))) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange20 o_3@@30))) (and (= (|Seq#Index| ar (invRecv20 o_3@@30)) o_3@@30) (= (U_2_real (MapType1Select QPMask@3 o_3@@30 Integer_value)) (- (U_2_real (MapType1Select QPMask@2 o_3@@30 Integer_value)) (/ (to_real 1) (to_real 2)))))) (=> (not (and (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U (invRecv20 o_3@@30))) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange20 o_3@@30)))) (= (U_2_real (MapType1Select QPMask@3 o_3@@30 Integer_value)) (U_2_real (MapType1Select QPMask@2 o_3@@30 Integer_value))))))
 :qid |stdinbpl.2193:24|
 :skolemid |173|
 :pattern ( (MapType1Select QPMask@3 o_3@@30 Integer_value))
))) (and (forall ((o_3@@31 T@U) (f_5@@9 T@U) ) (! (let ((B@@21 (FieldTypeInv1 (type f_5@@9))))
(let ((A@@22 (FieldTypeInv0 (type f_5@@9))))
 (=> (and (and (= (type o_3@@31) RefType) (= (type f_5@@9) (FieldType A@@22 B@@21))) (not (= f_5@@9 Integer_value))) (= (U_2_real (MapType1Select QPMask@2 o_3@@31 f_5@@9)) (U_2_real (MapType1Select QPMask@3 o_3@@31 f_5@@9))))))
 :qid |stdinbpl.2199:31|
 :skolemid |174|
 :pattern ( (MapType1Select QPMask@3 o_3@@31 f_5@@9))
)) (= perm@0 (/ (to_real 1) (to_real 2))))) (and (=> (= (ControlFlow 0 79) (- 0 80)) (>= perm@0 NoPerm)) (=> (>= perm@0 NoPerm) (and (=> (= (ControlFlow 0 79) 76) anon74_Then_correct) (=> (= (ControlFlow 0 79) 78) anon74_Else_correct)))))))))))))))
(let ((anon41_correct true))
(let ((anon73_Else_correct  (=> (and (not (and (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_21)) (and (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U j_6_1)) (not (= i_21 j_6_1))))) (= (ControlFlow 0 40) 37)) anon41_correct)))
(let ((anon73_Then_correct  (=> (and (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_21)) (and (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U j_6_1)) (not (= i_21 j_6_1)))) (and (=> (= (ControlFlow 0 38) (- 0 39)) (not (= (|Seq#Index| ar i_21) (|Seq#Index| ar j_6_1)))) (=> (not (= (|Seq#Index| ar i_21) (|Seq#Index| ar j_6_1))) (=> (= (ControlFlow 0 38) 37) anon41_correct))))))
(let ((anon65_Else_correct  (and (=> (= (ControlFlow 0 84) (- 0 89)) (= (|Seq#Length| ar) len)) (=> (= (|Seq#Length| ar) len) (=> (state Heap@@9 QPMask@2) (and (=> (= (ControlFlow 0 84) (- 0 88)) (= (|Seq#Length| br) len)) (=> (= (|Seq#Length| br) len) (=> (state Heap@@9 QPMask@2) (and (=> (= (ControlFlow 0 84) (- 0 87)) (= (|Seq#Length| cr) len)) (=> (= (|Seq#Length| cr) len) (=> (and (and (state Heap@@9 QPMask@2) (< 0 len)) (and (state Heap@@9 QPMask@2) (state Heap@@9 QPMask@2))) (and (=> (= (ControlFlow 0 84) (- 0 86)) (< 0 len)) (=> (< 0 len) (and (=> (= (ControlFlow 0 84) (- 0 85)) (= (|Seq#Length| ar) len)) (=> (= (|Seq#Length| ar) len) (and (and (=> (= (ControlFlow 0 84) 79) anon72_Else_correct) (=> (= (ControlFlow 0 84) 38) anon73_Then_correct)) (=> (= (ControlFlow 0 84) 40) anon73_Else_correct)))))))))))))))))
(let ((anon63_Else_correct  (and (=> (= (ControlFlow 0 113) (- 0 114)) (forall ((i_11 Int) (i_11_1 Int) ) (!  (=> (and (and (and (and (not (= i_11 i_11_1)) (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_11))) (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_11_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| cr i_11) (|Seq#Index| cr i_11_1))))
 :qid |stdinbpl.1913:15|
 :skolemid |142|
))) (=> (forall ((i_11@@0 Int) (i_11_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_11@@0 i_11_1@@0)) (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_11@@0))) (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_11_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| cr i_11@@0) (|Seq#Index| cr i_11_1@@0))))
 :qid |stdinbpl.1913:15|
 :skolemid |142|
)) (=> (forall ((i_11@@1 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_11@@1)) (< NoPerm FullPerm)) (and (qpRange13 (|Seq#Index| cr i_11@@1)) (= (invRecv13 (|Seq#Index| cr i_11@@1)) i_11@@1)))
 :qid |stdinbpl.1919:22|
 :skolemid |143|
 :pattern ( (|Seq#Index| cr i_11@@1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 len) (int_2_U i_11@@1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_11@@1)))
 :pattern ( (|Seq#Index| cr i_11@@1))
)) (=> (and (forall ((o_3@@32 T@U) ) (!  (=> (= (type o_3@@32) RefType) (=> (and (and (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U (invRecv13 o_3@@32))) (< NoPerm FullPerm)) (qpRange13 o_3@@32)) (= (|Seq#Index| cr (invRecv13 o_3@@32)) o_3@@32)))
 :qid |stdinbpl.1923:22|
 :skolemid |144|
 :pattern ( (invRecv13 o_3@@32))
)) (forall ((i_11@@2 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_11@@2)) (not (= (|Seq#Index| cr i_11@@2) null)))
 :qid |stdinbpl.1929:22|
 :skolemid |145|
 :pattern ( (|Seq#Index| cr i_11@@2))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 len) (int_2_U i_11@@2)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_11@@2)))
 :pattern ( (|Seq#Index| cr i_11@@2))
))) (=> (and (and (forall ((o_3@@33 T@U) ) (!  (=> (= (type o_3@@33) RefType) (and (=> (and (and (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U (invRecv13 o_3@@33))) (< NoPerm FullPerm)) (qpRange13 o_3@@33)) (and (=> (< NoPerm FullPerm) (= (|Seq#Index| cr (invRecv13 o_3@@33)) o_3@@33)) (= (U_2_real (MapType1Select QPMask@2 o_3@@33 Integer_value)) (+ (U_2_real (MapType1Select QPMask@1 o_3@@33 Integer_value)) FullPerm)))) (=> (not (and (and (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U (invRecv13 o_3@@33))) (< NoPerm FullPerm)) (qpRange13 o_3@@33))) (= (U_2_real (MapType1Select QPMask@2 o_3@@33 Integer_value)) (U_2_real (MapType1Select QPMask@1 o_3@@33 Integer_value))))))
 :qid |stdinbpl.1935:22|
 :skolemid |146|
 :pattern ( (MapType1Select QPMask@2 o_3@@33 Integer_value))
)) (forall ((o_3@@34 T@U) (f_5@@10 T@U) ) (! (let ((B@@22 (FieldTypeInv1 (type f_5@@10))))
(let ((A@@23 (FieldTypeInv0 (type f_5@@10))))
 (=> (and (and (= (type o_3@@34) RefType) (= (type f_5@@10) (FieldType A@@23 B@@22))) (not (= f_5@@10 Integer_value))) (= (U_2_real (MapType1Select QPMask@1 o_3@@34 f_5@@10)) (U_2_real (MapType1Select QPMask@2 o_3@@34 f_5@@10))))))
 :qid |stdinbpl.1939:29|
 :skolemid |147|
 :pattern ( (MapType1Select QPMask@1 o_3@@34 f_5@@10))
 :pattern ( (MapType1Select QPMask@2 o_3@@34 f_5@@10))
))) (and (state Heap@@9 QPMask@2) (state Heap@@9 QPMask@2))) (and (=> (= (ControlFlow 0 113) 112) anon65_Then_correct) (=> (= (ControlFlow 0 113) 84) anon65_Else_correct)))))))))
(let ((anon23_correct true))
(let ((anon64_Else_correct  (=> (and (not (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_37))) (= (ControlFlow 0 36) 32)) anon23_correct)))
(let ((anon64_Then_correct  (=> (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_37)) (and (=> (= (ControlFlow 0 33) (- 0 35)) (>= i_37 0)) (=> (>= i_37 0) (and (=> (= (ControlFlow 0 33) (- 0 34)) (< i_37 (|Seq#Length| cr))) (=> (< i_37 (|Seq#Length| cr)) (=> (= (ControlFlow 0 33) 32) anon23_correct))))))))
(let ((anon61_Else_correct  (=> (and (forall ((i_9 Int) (j_5 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_9)) (and (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U j_5)) (not (= i_9 j_5)))) (not (= (|Seq#Index| cr i_9) (|Seq#Index| cr j_5))))
 :qid |stdinbpl.1895:20|
 :skolemid |141|
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 len) (int_2_U i_9)) (|Seq#ContainsTrigger| (|Seq#Range| 0 len) (int_2_U j_5)))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 len) (int_2_U i_9)) (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U j_5)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_9)) (|Seq#ContainsTrigger| (|Seq#Range| 0 len) (int_2_U j_5)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_9)) (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U j_5)))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 len) (int_2_U i_9)) (|Seq#Index| cr j_5))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_9)) (|Seq#Index| cr j_5))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 len) (int_2_U j_5)) (|Seq#Index| cr i_9))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U j_5)) (|Seq#Index| cr i_9))
 :pattern ( (|Seq#Index| cr i_9) (|Seq#Index| cr j_5))
)) (state Heap@@9 QPMask@1)) (and (and (=> (= (ControlFlow 0 115) 113) anon63_Else_correct) (=> (= (ControlFlow 0 115) 33) anon64_Then_correct)) (=> (= (ControlFlow 0 115) 36) anon64_Else_correct)))))
(let ((anon19_correct true))
(let ((anon62_Else_correct  (=> (and (not (and (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_36)) (and (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U j_8)) (not (= i_36 j_8))))) (= (ControlFlow 0 31) 25)) anon19_correct)))
(let ((anon62_Then_correct  (=> (and (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_36)) (and (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U j_8)) (not (= i_36 j_8)))) (and (=> (= (ControlFlow 0 26) (- 0 30)) (>= i_36 0)) (=> (>= i_36 0) (and (=> (= (ControlFlow 0 26) (- 0 29)) (< i_36 (|Seq#Length| cr))) (=> (< i_36 (|Seq#Length| cr)) (and (=> (= (ControlFlow 0 26) (- 0 28)) (>= j_8 0)) (=> (>= j_8 0) (and (=> (= (ControlFlow 0 26) (- 0 27)) (< j_8 (|Seq#Length| cr))) (=> (< j_8 (|Seq#Length| cr)) (=> (= (ControlFlow 0 26) 25) anon19_correct))))))))))))
(let ((anon59_Else_correct  (and (=> (= (ControlFlow 0 116) (- 0 118)) (forall ((i_7 Int) (i_7_1 Int) ) (!  (=> (and (and (and (and (not (= i_7 i_7_1)) (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_7))) (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_7_1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= (|Seq#Index| br i_7) (|Seq#Index| br i_7_1))))
 :qid |stdinbpl.1839:15|
 :skolemid |134|
))) (=> (forall ((i_7@@0 Int) (i_7_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_7@@0 i_7_1@@0)) (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_7@@0))) (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_7_1@@0))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= (|Seq#Index| br i_7@@0) (|Seq#Index| br i_7_1@@0))))
 :qid |stdinbpl.1839:15|
 :skolemid |134|
)) (=> (and (forall ((i_7@@1 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_7@@1)) (< NoPerm (/ (to_real 1) (to_real 2)))) (and (qpRange12 (|Seq#Index| br i_7@@1)) (= (invRecv12 (|Seq#Index| br i_7@@1)) i_7@@1)))
 :qid |stdinbpl.1845:22|
 :skolemid |135|
 :pattern ( (|Seq#Index| br i_7@@1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 len) (int_2_U i_7@@1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_7@@1)))
 :pattern ( (|Seq#Index| br i_7@@1))
)) (forall ((o_3@@35 T@U) ) (!  (=> (= (type o_3@@35) RefType) (=> (and (and (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U (invRecv12 o_3@@35))) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange12 o_3@@35)) (= (|Seq#Index| br (invRecv12 o_3@@35)) o_3@@35)))
 :qid |stdinbpl.1849:22|
 :skolemid |136|
 :pattern ( (invRecv12 o_3@@35))
))) (and (=> (= (ControlFlow 0 116) (- 0 117)) (forall ((i_7@@2 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_7@@2)) (>= (/ (to_real 1) (to_real 2)) NoPerm))
 :qid |stdinbpl.1855:15|
 :skolemid |137|
 :pattern ( (|Seq#Index| br i_7@@2))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 len) (int_2_U i_7@@2)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_7@@2)))
 :pattern ( (|Seq#Index| br i_7@@2))
))) (=> (forall ((i_7@@3 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_7@@3)) (>= (/ (to_real 1) (to_real 2)) NoPerm))
 :qid |stdinbpl.1855:15|
 :skolemid |137|
 :pattern ( (|Seq#Index| br i_7@@3))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 len) (int_2_U i_7@@3)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_7@@3)))
 :pattern ( (|Seq#Index| br i_7@@3))
)) (=> (forall ((i_7@@4 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_7@@4)) (> (/ (to_real 1) (to_real 2)) NoPerm)) (not (= (|Seq#Index| br i_7@@4) null)))
 :qid |stdinbpl.1861:22|
 :skolemid |138|
 :pattern ( (|Seq#Index| br i_7@@4))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 len) (int_2_U i_7@@4)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_7@@4)))
 :pattern ( (|Seq#Index| br i_7@@4))
)) (=> (and (forall ((o_3@@36 T@U) ) (!  (=> (= (type o_3@@36) RefType) (and (=> (and (and (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U (invRecv12 o_3@@36))) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange12 o_3@@36)) (and (=> (< NoPerm (/ (to_real 1) (to_real 2))) (= (|Seq#Index| br (invRecv12 o_3@@36)) o_3@@36)) (= (U_2_real (MapType1Select QPMask@1 o_3@@36 Integer_value)) (+ (U_2_real (MapType1Select QPMask@0 o_3@@36 Integer_value)) (/ (to_real 1) (to_real 2)))))) (=> (not (and (and (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U (invRecv12 o_3@@36))) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange12 o_3@@36))) (= (U_2_real (MapType1Select QPMask@1 o_3@@36 Integer_value)) (U_2_real (MapType1Select QPMask@0 o_3@@36 Integer_value))))))
 :qid |stdinbpl.1867:22|
 :skolemid |139|
 :pattern ( (MapType1Select QPMask@1 o_3@@36 Integer_value))
)) (forall ((o_3@@37 T@U) (f_5@@11 T@U) ) (! (let ((B@@23 (FieldTypeInv1 (type f_5@@11))))
(let ((A@@24 (FieldTypeInv0 (type f_5@@11))))
 (=> (and (and (= (type o_3@@37) RefType) (= (type f_5@@11) (FieldType A@@24 B@@23))) (not (= f_5@@11 Integer_value))) (= (U_2_real (MapType1Select QPMask@0 o_3@@37 f_5@@11)) (U_2_real (MapType1Select QPMask@1 o_3@@37 f_5@@11))))))
 :qid |stdinbpl.1871:29|
 :skolemid |140|
 :pattern ( (MapType1Select QPMask@0 o_3@@37 f_5@@11))
 :pattern ( (MapType1Select QPMask@1 o_3@@37 f_5@@11))
))) (=> (and (and (state Heap@@9 QPMask@1) (state Heap@@9 QPMask@1)) (and (= (|Seq#Length| cr) len) (state Heap@@9 QPMask@1))) (and (and (=> (= (ControlFlow 0 116) 115) anon61_Else_correct) (=> (= (ControlFlow 0 116) 26) anon62_Then_correct)) (=> (= (ControlFlow 0 116) 31) anon62_Else_correct))))))))))))
(let ((anon15_correct true))
(let ((anon60_Else_correct  (=> (and (not (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_35))) (= (ControlFlow 0 24) 20)) anon15_correct)))
(let ((anon60_Then_correct  (=> (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_35)) (and (=> (= (ControlFlow 0 21) (- 0 23)) (>= i_35 0)) (=> (>= i_35 0) (and (=> (= (ControlFlow 0 21) (- 0 22)) (< i_35 (|Seq#Length| br))) (=> (< i_35 (|Seq#Length| br)) (=> (= (ControlFlow 0 21) 20) anon15_correct))))))))
(let ((anon57_Else_correct  (=> (and (forall ((i_5 Int) (j_3 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_5)) (and (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U j_3)) (not (= i_5 j_3)))) (not (= (|Seq#Index| br i_5) (|Seq#Index| br j_3))))
 :qid |stdinbpl.1821:20|
 :skolemid |133|
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 len) (int_2_U i_5)) (|Seq#ContainsTrigger| (|Seq#Range| 0 len) (int_2_U j_3)))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 len) (int_2_U i_5)) (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U j_3)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_5)) (|Seq#ContainsTrigger| (|Seq#Range| 0 len) (int_2_U j_3)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_5)) (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U j_3)))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 len) (int_2_U i_5)) (|Seq#Index| br j_3))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_5)) (|Seq#Index| br j_3))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 len) (int_2_U j_3)) (|Seq#Index| br i_5))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U j_3)) (|Seq#Index| br i_5))
 :pattern ( (|Seq#Index| br i_5) (|Seq#Index| br j_3))
)) (state Heap@@9 QPMask@0)) (and (and (=> (= (ControlFlow 0 119) 116) anon59_Else_correct) (=> (= (ControlFlow 0 119) 21) anon60_Then_correct)) (=> (= (ControlFlow 0 119) 24) anon60_Else_correct)))))
(let ((anon11_correct true))
(let ((anon58_Else_correct  (=> (and (not (and (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_34)) (and (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U j_7)) (not (= i_34 j_7))))) (= (ControlFlow 0 19) 13)) anon11_correct)))
(let ((anon58_Then_correct  (=> (and (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_34)) (and (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U j_7)) (not (= i_34 j_7)))) (and (=> (= (ControlFlow 0 14) (- 0 18)) (>= i_34 0)) (=> (>= i_34 0) (and (=> (= (ControlFlow 0 14) (- 0 17)) (< i_34 (|Seq#Length| br))) (=> (< i_34 (|Seq#Length| br)) (and (=> (= (ControlFlow 0 14) (- 0 16)) (>= j_7 0)) (=> (>= j_7 0) (and (=> (= (ControlFlow 0 14) (- 0 15)) (< j_7 (|Seq#Length| br))) (=> (< j_7 (|Seq#Length| br)) (=> (= (ControlFlow 0 14) 13) anon11_correct))))))))))))
(let ((anon55_Else_correct  (and (=> (= (ControlFlow 0 120) (- 0 121)) (forall ((i_3 Int) (i_3_1 Int) ) (!  (=> (and (and (and (and (not (= i_3 i_3_1)) (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_3))) (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_3_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| ar i_3) (|Seq#Index| ar i_3_1))))
 :qid |stdinbpl.1771:15|
 :skolemid |127|
))) (=> (forall ((i_3@@0 Int) (i_3_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_3@@0 i_3_1@@0)) (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_3@@0))) (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_3_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| ar i_3@@0) (|Seq#Index| ar i_3_1@@0))))
 :qid |stdinbpl.1771:15|
 :skolemid |127|
)) (=> (forall ((i_3@@1 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_3@@1)) (< NoPerm FullPerm)) (and (qpRange11 (|Seq#Index| ar i_3@@1)) (= (invRecv11 (|Seq#Index| ar i_3@@1)) i_3@@1)))
 :qid |stdinbpl.1777:22|
 :skolemid |128|
 :pattern ( (|Seq#Index| ar i_3@@1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 len) (int_2_U i_3@@1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_3@@1)))
 :pattern ( (|Seq#Index| ar i_3@@1))
)) (=> (and (and (and (forall ((o_3@@38 T@U) ) (!  (=> (= (type o_3@@38) RefType) (=> (and (and (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U (invRecv11 o_3@@38))) (< NoPerm FullPerm)) (qpRange11 o_3@@38)) (= (|Seq#Index| ar (invRecv11 o_3@@38)) o_3@@38)))
 :qid |stdinbpl.1781:22|
 :skolemid |129|
 :pattern ( (invRecv11 o_3@@38))
)) (forall ((i_3@@2 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_3@@2)) (not (= (|Seq#Index| ar i_3@@2) null)))
 :qid |stdinbpl.1787:22|
 :skolemid |130|
 :pattern ( (|Seq#Index| ar i_3@@2))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 len) (int_2_U i_3@@2)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_3@@2)))
 :pattern ( (|Seq#Index| ar i_3@@2))
))) (and (forall ((o_3@@39 T@U) ) (!  (=> (= (type o_3@@39) RefType) (and (=> (and (and (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U (invRecv11 o_3@@39))) (< NoPerm FullPerm)) (qpRange11 o_3@@39)) (and (=> (< NoPerm FullPerm) (= (|Seq#Index| ar (invRecv11 o_3@@39)) o_3@@39)) (= (U_2_real (MapType1Select QPMask@0 o_3@@39 Integer_value)) (+ (U_2_real (MapType1Select ZeroMask o_3@@39 Integer_value)) FullPerm)))) (=> (not (and (and (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U (invRecv11 o_3@@39))) (< NoPerm FullPerm)) (qpRange11 o_3@@39))) (= (U_2_real (MapType1Select QPMask@0 o_3@@39 Integer_value)) (U_2_real (MapType1Select ZeroMask o_3@@39 Integer_value))))))
 :qid |stdinbpl.1793:22|
 :skolemid |131|
 :pattern ( (MapType1Select QPMask@0 o_3@@39 Integer_value))
)) (forall ((o_3@@40 T@U) (f_5@@12 T@U) ) (! (let ((B@@24 (FieldTypeInv1 (type f_5@@12))))
(let ((A@@25 (FieldTypeInv0 (type f_5@@12))))
 (=> (and (and (= (type o_3@@40) RefType) (= (type f_5@@12) (FieldType A@@25 B@@24))) (not (= f_5@@12 Integer_value))) (= (U_2_real (MapType1Select ZeroMask o_3@@40 f_5@@12)) (U_2_real (MapType1Select QPMask@0 o_3@@40 f_5@@12))))))
 :qid |stdinbpl.1797:29|
 :skolemid |132|
 :pattern ( (MapType1Select ZeroMask o_3@@40 f_5@@12))
 :pattern ( (MapType1Select QPMask@0 o_3@@40 f_5@@12))
)))) (and (and (state Heap@@9 QPMask@0) (state Heap@@9 QPMask@0)) (and (= (|Seq#Length| br) len) (state Heap@@9 QPMask@0)))) (and (and (=> (= (ControlFlow 0 120) 119) anon57_Else_correct) (=> (= (ControlFlow 0 120) 14) anon58_Then_correct)) (=> (= (ControlFlow 0 120) 19) anon58_Else_correct))))))))
(let ((anon7_correct true))
(let ((anon56_Else_correct  (=> (and (not (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_29))) (= (ControlFlow 0 12) 8)) anon7_correct)))
(let ((anon56_Then_correct  (=> (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_29)) (and (=> (= (ControlFlow 0 9) (- 0 11)) (>= i_29 0)) (=> (>= i_29 0) (and (=> (= (ControlFlow 0 9) (- 0 10)) (< i_29 (|Seq#Length| ar))) (=> (< i_29 (|Seq#Length| ar)) (=> (= (ControlFlow 0 9) 8) anon7_correct))))))))
(let ((anon53_Else_correct  (=> (and (forall ((i_1 Int) (j_1 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_1)) (and (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U j_1)) (not (= i_1 j_1)))) (not (= (|Seq#Index| ar i_1) (|Seq#Index| ar j_1))))
 :qid |stdinbpl.1753:20|
 :skolemid |126|
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 len) (int_2_U i_1)) (|Seq#ContainsTrigger| (|Seq#Range| 0 len) (int_2_U j_1)))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 len) (int_2_U i_1)) (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U j_1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_1)) (|Seq#ContainsTrigger| (|Seq#Range| 0 len) (int_2_U j_1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_1)) (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U j_1)))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 len) (int_2_U i_1)) (|Seq#Index| ar j_1))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_1)) (|Seq#Index| ar j_1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 len) (int_2_U j_1)) (|Seq#Index| ar i_1))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U j_1)) (|Seq#Index| ar i_1))
 :pattern ( (|Seq#Index| ar i_1) (|Seq#Index| ar j_1))
)) (state Heap@@9 ZeroMask)) (and (and (=> (= (ControlFlow 0 122) 120) anon55_Else_correct) (=> (= (ControlFlow 0 122) 9) anon56_Then_correct)) (=> (= (ControlFlow 0 122) 12) anon56_Else_correct)))))
(let ((anon3_correct true))
(let ((anon54_Else_correct  (=> (and (not (and (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_28)) (and (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U j_6)) (not (= i_28 j_6))))) (= (ControlFlow 0 7) 1)) anon3_correct)))
(let ((anon54_Then_correct  (=> (and (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U i_28)) (and (|Seq#Contains| (|Seq#Range| 0 len) (int_2_U j_6)) (not (= i_28 j_6)))) (and (=> (= (ControlFlow 0 2) (- 0 6)) (>= i_28 0)) (=> (>= i_28 0) (and (=> (= (ControlFlow 0 2) (- 0 5)) (< i_28 (|Seq#Length| ar))) (=> (< i_28 (|Seq#Length| ar)) (and (=> (= (ControlFlow 0 2) (- 0 4)) (>= j_6 0)) (=> (>= j_6 0) (and (=> (= (ControlFlow 0 2) (- 0 3)) (< j_6 (|Seq#Length| ar))) (=> (< j_6 (|Seq#Length| ar)) (=> (= (ControlFlow 0 2) 1) anon3_correct))))))))))))
(let ((anon0_correct  (=> (and (and (state Heap@@9 ZeroMask) (U_2_bool (MapType0Select Heap@@9 this $allocated))) (and (= (|Seq#Length| ar) len) (state Heap@@9 ZeroMask))) (and (and (=> (= (ControlFlow 0 123) 122) anon53_Else_correct) (=> (= (ControlFlow 0 123) 2) anon54_Then_correct)) (=> (= (ControlFlow 0 123) 7) anon54_Else_correct)))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 124) 123) anon0_correct)))
PreconditionGeneratedEntry_correct))))))))))))))))))))))))))))))))))))))))))))))))))))))))
))
(check-sat)
(pop 1)
; Valid
(get-info :rlimit)
