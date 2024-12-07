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
(declare-fun Exercise4__Integer_value () T@U)
(declare-fun Ref__Integer_value () T@U)
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
(assert  (and (and (and (and (and (and (forall ((arg0@@11 T@T) (arg1 T@T) ) (! (= (Ctor (FieldType arg0@@11 arg1)) 6)
 :qid |ctor:FieldType|
)) (forall ((arg0@@12 T@T) (arg1@@0 T@T) ) (! (= (FieldTypeInv0 (FieldType arg0@@12 arg1@@0)) arg0@@12)
 :qid |typeInv:FieldTypeInv0|
 :pattern ( (FieldType arg0@@12 arg1@@0))
))) (forall ((arg0@@13 T@T) (arg1@@1 T@T) ) (! (= (FieldTypeInv1 (FieldType arg0@@13 arg1@@1)) arg1@@1)
 :qid |typeInv:FieldTypeInv1|
 :pattern ( (FieldType arg0@@13 arg1@@1))
))) (= (Ctor NormalFieldType) 7)) (= (type $allocated) (FieldType NormalFieldType boolType))) (= (type Exercise4__Integer_value) (FieldType NormalFieldType intType))) (= (type Ref__Integer_value) (FieldType NormalFieldType intType))))
(assert (distinct $allocated Exercise4__Integer_value Ref__Integer_value)
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
 :qid |stdinbpl.355:18|
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
 :qid |stdinbpl.376:18|
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
 :qid |stdinbpl.331:18|
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
 :qid |stdinbpl.342:18|
 :skolemid |36|
 :pattern ( (|Seq#Length| (|Seq#Take| s@@2 n@@2)))
 :pattern ( (|Seq#Take| s@@2 n@@2) (|Seq#Length| s@@2))
)))
(assert (forall ((arg0@@31 Int) (arg1@@13 Int) ) (! (= (type (|Seq#Range| arg0@@31 arg1@@13)) (SeqType intType))
 :qid |funType:Seq#Range|
 :pattern ( (|Seq#Range| arg0@@31 arg1@@13))
)))
(assert (forall ((q@min Int) (q@max Int) (v@@0 T@U) ) (!  (=> (= (type v@@0) intType) (= (|Seq#Contains| (|Seq#Range| q@min q@max) v@@0)  (and (<= q@min (U_2_int v@@0)) (< (U_2_int v@@0) q@max))))
 :qid |stdinbpl.615:15|
 :skolemid |57|
 :pattern ( (|Seq#Contains| (|Seq#Range| q@min q@max) v@@0))
)))
(assert (forall ((s@@3 T@U) (x@@8 T@U) ) (! (let ((T@@7 (type x@@8)))
 (=> (and (= (type s@@3) (SeqType T@@7)) (|Seq#Contains| s@@3 x@@8)) (and (and (<= 0 (|Seq#Skolem| s@@3 x@@8)) (< (|Seq#Skolem| s@@3 x@@8) (|Seq#Length| s@@3))) (= (|Seq#Index| s@@3 (|Seq#Skolem| s@@3 x@@8)) x@@8))))
 :qid |stdinbpl.473:18|
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
 :qid |stdinbpl.457:18|
 :skolemid |45|
 :pattern ( (|Seq#Drop| s@@4 n@@3))
)))
(assert (forall ((i@@0 Int) (j@@0 Int) ) (! (= (|Seq#Sub| i@@0 j@@0) (- i@@0 j@@0))
 :qid |stdinbpl.311:15|
 :skolemid |30|
 :pattern ( (|Seq#Sub| i@@0 j@@0))
)))
(assert (forall ((i@@1 Int) (j@@1 Int) ) (! (= (|Seq#Add| i@@1 j@@1) (+ i@@1 j@@1))
 :qid |stdinbpl.309:15|
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
 :qid |stdinbpl.598:18|
 :skolemid |54|
 :pattern ( (|Seq#Contains| (|Seq#Singleton| x@@9) y@@1))
)))
(assert (forall ((s@@5 T@U) (n@@4 Int) (j@@2 Int) ) (! (let ((T@@11 (SeqTypeInv0 (type s@@5))))
 (=> (= (type s@@5) (SeqType T@@11)) (=> (and (and (<= 0 j@@2) (< j@@2 n@@4)) (< j@@2 (|Seq#Length| s@@5))) (= (|Seq#Index| (|Seq#Take| s@@5 n@@4) j@@2) (|Seq#Index| s@@5 j@@2)))))
 :qid |stdinbpl.350:18|
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
 :qid |stdinbpl.254:19|
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
 :qid |stdinbpl.322:18|
 :skolemid |32|
 :pattern ( (|Seq#Index| (|Seq#Append| s0 s1) n@@5))
)))
(assert  (not (IsPredicateField Exercise4__Integer_value)))
(assert  (not (IsWandField Exercise4__Integer_value)))
(assert  (not (IsPredicateField Ref__Integer_value)))
(assert  (not (IsWandField Ref__Integer_value)))
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
 :qid |stdinbpl.242:15|
 :skolemid |19|
 :pattern ( (ConditionalFrame p@@0 f_6))
)))
(assert (forall ((q@min@@0 Int) (q@max@@0 Int) (j@@3 Int) ) (!  (=> (and (<= 0 j@@3) (< j@@3 (- q@max@@0 q@min@@0))) (= (U_2_int (|Seq#Index| (|Seq#Range| q@min@@0 q@max@@0) j@@3)) (+ q@min@@0 j@@3)))
 :qid |stdinbpl.613:15|
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
 :qid |stdinbpl.291:18|
 :skolemid |26|
 :pattern ( (|Seq#Length| (|Seq#Append| s0@@0 s1@@0)))
)))
(assert (forall ((s@@6 T@U) (t T@U) (n@@6 Int) ) (! (let ((T@@17 (SeqTypeInv0 (type s@@6))))
 (=> (and (and (= (type s@@6) (SeqType T@@17)) (= (type t) (SeqType T@@17))) (and (> n@@6 0) (> n@@6 (|Seq#Length| s@@6)))) (and (= (|Seq#Add| (|Seq#Sub| n@@6 (|Seq#Length| s@@6)) (|Seq#Length| s@@6)) n@@6) (= (|Seq#Drop| (|Seq#Append| s@@6 t) n@@6) (|Seq#Drop| t (|Seq#Sub| n@@6 (|Seq#Length| s@@6)))))))
 :qid |stdinbpl.447:18|
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
 :qid |stdinbpl.434:18|
 :skolemid |42|
 :pattern ( (|Seq#Take| (|Seq#Append| s@@7 t@@0) n@@7))
)))
(assert (forall ((q@min@@1 Int) (q@max@@1 Int) ) (!  (and (=> (< q@min@@1 q@max@@1) (= (|Seq#Length| (|Seq#Range| q@min@@1 q@max@@1)) (- q@max@@1 q@min@@1))) (=> (<= q@max@@1 q@min@@1) (= (|Seq#Length| (|Seq#Range| q@min@@1 q@max@@1)) 0)))
 :qid |stdinbpl.612:15|
 :skolemid |55|
 :pattern ( (|Seq#Length| (|Seq#Range| q@min@@1 q@max@@1)))
)))
(assert (forall ((a T@U) (b T@U) ) (! (let ((T@@19 (SeqTypeInv0 (type a))))
 (=> (and (and (= (type a) (SeqType T@@19)) (= (type b) (SeqType T@@19))) (|Seq#Equal| a b)) (= a b)))
 :qid |stdinbpl.585:18|
 :skolemid |53|
 :pattern ( (|Seq#Equal| a b))
)))
(assert (forall ((s@@8 T@U) (i@@2 Int) ) (! (let ((T@@20 (SeqTypeInv0 (type s@@8))))
 (=> (= (type s@@8) (SeqType T@@20)) (=> (and (<= 0 i@@2) (< i@@2 (|Seq#Length| s@@8))) (|Seq#ContainsTrigger| s@@8 (|Seq#Index| s@@8 i@@2)))))
 :qid |stdinbpl.478:18|
 :skolemid |49|
 :pattern ( (|Seq#Index| s@@8 i@@2))
)))
(assert (forall ((s0@@1 T@U) (s1@@1 T@U) ) (! (let ((T@@21 (SeqTypeInv0 (type s0@@1))))
 (=> (and (= (type s0@@1) (SeqType T@@21)) (= (type s1@@1) (SeqType T@@21))) (and (=> (= s0@@1 (|Seq#Empty| T@@21)) (= (|Seq#Append| s0@@1 s1@@1) s1@@1)) (=> (= s1@@1 (|Seq#Empty| T@@21)) (= (|Seq#Append| s0@@1 s1@@1) s0@@1)))))
 :qid |stdinbpl.297:18|
 :skolemid |27|
 :pattern ( (|Seq#Append| s0@@1 s1@@1))
)))
(assert (forall ((t@@1 T@U) ) (! (= (|Seq#Index| (|Seq#Singleton| t@@1) 0) t@@1)
 :qid |stdinbpl.301:18|
 :skolemid |28|
 :pattern ( (|Seq#Singleton| t@@1))
)))
(assert (forall ((s@@9 T@U) ) (! (let ((T@@22 (SeqTypeInv0 (type s@@9))))
 (=> (= (type s@@9) (SeqType T@@22)) (<= 0 (|Seq#Length| s@@9))))
 :qid |stdinbpl.280:18|
 :skolemid |22|
 :pattern ( (|Seq#Length| s@@9))
)))
(assert (forall ((s0@@2 T@U) (s1@@2 T@U) ) (! (let ((T@@23 (SeqTypeInv0 (type s0@@2))))
 (=> (and (and (= (type s0@@2) (SeqType T@@23)) (= (type s1@@2) (SeqType T@@23))) (|Seq#Equal| s0@@2 s1@@2)) (and (= (|Seq#Length| s0@@2) (|Seq#Length| s1@@2)) (forall ((j@@4 Int) ) (!  (=> (and (<= 0 j@@4) (< j@@4 (|Seq#Length| s0@@2))) (= (|Seq#Index| s0@@2 j@@4) (|Seq#Index| s1@@2 j@@4)))
 :qid |stdinbpl.575:13|
 :skolemid |50|
 :pattern ( (|Seq#Index| s0@@2 j@@4))
 :pattern ( (|Seq#Index| s1@@2 j@@4))
)))))
 :qid |stdinbpl.572:18|
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
 :qid |stdinbpl.288:18|
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
 :qid |stdinbpl.430:18|
 :skolemid |41|
 :pattern ( (|Seq#Take| (|Seq#Append| s@@10 t@@3) n@@8))
)))
(assert (forall ((s@@11 T@U) (i@@3 Int) (v@@1 T@U) ) (! (let ((T@@25 (type v@@1)))
 (=> (= (type s@@11) (SeqType T@@25)) (=> (and (<= 0 i@@3) (< i@@3 (|Seq#Length| s@@11))) (= (|Seq#Length| (|Seq#Update| s@@11 i@@3 v@@1)) (|Seq#Length| s@@11)))))
 :qid |stdinbpl.329:18|
 :skolemid |34|
 :pattern ( (|Seq#Length| (|Seq#Update| s@@11 i@@3 v@@1)))
 :pattern ( (|Seq#Length| s@@11) (|Seq#Update| s@@11 i@@3 v@@1))
)))
(assert (forall ((s@@12 T@U) (t@@4 T@U) (n@@9 Int) ) (! (let ((T@@26 (SeqTypeInv0 (type s@@12))))
 (=> (and (and (= (type s@@12) (SeqType T@@26)) (= (type t@@4) (SeqType T@@26))) (and (< 0 n@@9) (<= n@@9 (|Seq#Length| s@@12)))) (= (|Seq#Drop| (|Seq#Append| s@@12 t@@4) n@@9) (|Seq#Append| (|Seq#Drop| s@@12 n@@9) t@@4))))
 :qid |stdinbpl.443:18|
 :skolemid |43|
 :pattern ( (|Seq#Drop| (|Seq#Append| s@@12 t@@4) n@@9))
)))
(assert (forall ((s@@13 T@U) (n@@10 Int) (i@@4 Int) ) (! (let ((T@@27 (SeqTypeInv0 (type s@@13))))
 (=> (= (type s@@13) (SeqType T@@27)) (=> (and (and (< 0 n@@10) (<= n@@10 i@@4)) (< i@@4 (|Seq#Length| s@@13))) (and (= (|Seq#Add| (|Seq#Sub| i@@4 n@@10) n@@10) i@@4) (= (|Seq#Index| (|Seq#Drop| s@@13 n@@10) (|Seq#Sub| i@@4 n@@10)) (|Seq#Index| s@@13 i@@4))))))
 :qid |stdinbpl.380:18|
 :skolemid |40|
 :pattern ( (|Seq#Drop| s@@13 n@@10) (|Seq#Index| s@@13 i@@4))
)))
(assert (forall ((s0@@3 T@U) (s1@@3 T@U) (n@@11 Int) ) (! (let ((T@@28 (SeqTypeInv0 (type s0@@3))))
 (=> (and (= (type s0@@3) (SeqType T@@28)) (= (type s1@@3) (SeqType T@@28))) (=> (and (and (and (not (= s0@@3 (|Seq#Empty| T@@28))) (not (= s1@@3 (|Seq#Empty| T@@28)))) (<= 0 n@@11)) (< n@@11 (|Seq#Length| s0@@3))) (= (|Seq#Index| (|Seq#Append| s0@@3 s1@@3) n@@11) (|Seq#Index| s0@@3 n@@11)))))
 :qid |stdinbpl.320:18|
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
 :qid |stdinbpl.325:18|
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
 :qid |stdinbpl.476:18|
 :skolemid |48|
 :pattern ( (|Seq#Contains| s@@14 x@@10) (|Seq#Index| s@@14 i@@5))
)))
(assert (forall ((s0@@5 T@U) (s1@@5 T@U) ) (! (let ((T@@31 (SeqTypeInv0 (type s0@@5))))
 (=> (and (= (type s0@@5) (SeqType T@@31)) (= (type s1@@5) (SeqType T@@31))) (or (or (and (= s0@@5 s1@@5) (|Seq#Equal| s0@@5 s1@@5)) (and (and (not (= s0@@5 s1@@5)) (not (|Seq#Equal| s0@@5 s1@@5))) (not (= (|Seq#Length| s0@@5) (|Seq#Length| s1@@5))))) (and (and (and (and (and (and (not (= s0@@5 s1@@5)) (not (|Seq#Equal| s0@@5 s1@@5))) (= (|Seq#Length| s0@@5) (|Seq#Length| s1@@5))) (= (|Seq#SkolemDiff| s0@@5 s1@@5) (|Seq#SkolemDiff| s1@@5 s0@@5))) (<= 0 (|Seq#SkolemDiff| s0@@5 s1@@5))) (< (|Seq#SkolemDiff| s0@@5 s1@@5) (|Seq#Length| s0@@5))) (not (= (|Seq#Index| s0@@5 (|Seq#SkolemDiff| s0@@5 s1@@5)) (|Seq#Index| s1@@5 (|Seq#SkolemDiff| s0@@5 s1@@5))))))))
 :qid |stdinbpl.580:18|
 :skolemid |52|
 :pattern ( (|Seq#Equal| s0@@5 s1@@5))
)))
(assert (forall ((p@@1 T@U) (v_1@@0 T@U) (q T@U) (w@@0 T@U) (r T@U) (u T@U) ) (! (let ((C@@3 (FieldTypeInv0 (type r))))
(let ((B@@10 (FieldTypeInv0 (type q))))
(let ((A@@11 (FieldTypeInv0 (type p@@1))))
 (=> (and (and (and (and (and (and (= (type p@@1) (FieldType A@@11 FrameTypeType)) (= (type v_1@@0) FrameTypeType)) (= (type q) (FieldType B@@10 FrameTypeType))) (= (type w@@0) FrameTypeType)) (= (type r) (FieldType C@@3 FrameTypeType))) (= (type u) FrameTypeType)) (and (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))) (InsidePredicate p@@1 v_1@@0 r u)))))
 :qid |stdinbpl.249:25|
 :skolemid |20|
 :pattern ( (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))
)))
(assert (forall ((s@@15 T@U) ) (! (let ((T@@32 (SeqTypeInv0 (type s@@15))))
 (=> (and (= (type s@@15) (SeqType T@@32)) (= (|Seq#Length| s@@15) 0)) (= s@@15 (|Seq#Empty| T@@32))))
 :qid |stdinbpl.284:18|
 :skolemid |24|
 :pattern ( (|Seq#Length| s@@15))
)))
(assert (forall ((s@@16 T@U) (n@@12 Int) ) (! (let ((T@@33 (SeqTypeInv0 (type s@@16))))
 (=> (and (= (type s@@16) (SeqType T@@33)) (<= n@@12 0)) (= (|Seq#Take| s@@16 n@@12) (|Seq#Empty| T@@33))))
 :qid |stdinbpl.459:18|
 :skolemid |46|
 :pattern ( (|Seq#Take| s@@16 n@@12))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun i_24 () Int)
(declare-fun res () T@U)
(declare-fun QPMask@23 () T@U)
(declare-fun a_2 () T@U)
(declare-fun b_2 () T@U)
(declare-fun PostHeap@0 () T@U)
(declare-fun i_22 () Int)
(declare-fun i_20 () Int)
(declare-fun i_18 () Int)
(declare-fun qpRange6 (T@U) Bool)
(declare-fun invRecv6 (T@U) Int)
(declare-fun QPMask@22 () T@U)
(declare-fun i_16 () Int)
(declare-fun qpRange5 (T@U) Bool)
(declare-fun invRecv5 (T@U) Int)
(declare-fun QPMask@21 () T@U)
(declare-fun i_14 () Int)
(declare-fun qpRange4 (T@U) Bool)
(declare-fun invRecv4 (T@U) Int)
(declare-fun i_12 () Int)
(declare-fun k@0 () Int)
(declare-fun i_35 () Int)
(declare-fun QPMask@20 () T@U)
(declare-fun ExhaleHeap@0 () T@U)
(declare-fun i_34 () Int)
(declare-fun i_33 () Int)
(declare-fun i_32 () Int)
(declare-fun qpRange15 (T@U) Bool)
(declare-fun invRecv15 (T@U) Int)
(declare-fun QPMask@19 () T@U)
(declare-fun i_31 () Int)
(declare-fun qpRange14 (T@U) Bool)
(declare-fun invRecv14 (T@U) Int)
(declare-fun QPMask@18 () T@U)
(declare-fun i_30 () Int)
(declare-fun qpRange13 (T@U) Bool)
(declare-fun invRecv13 (T@U) Int)
(declare-fun QPMask@5 () T@U)
(declare-fun i_29 () Int)
(declare-fun __flatten_10@1 () Int)
(declare-fun i_78 () Int)
(declare-fun Heap@1 () T@U)
(declare-fun i_76 () Int)
(declare-fun i_74 () Int)
(declare-fun i_72 () Int)
(declare-fun qpRange16 (T@U) Bool)
(declare-fun invRecv16 (T@U) Int)
(declare-fun QPMask@6 () T@U)
(declare-fun qpRange17 (T@U) Bool)
(declare-fun invRecv17 (T@U) Int)
(declare-fun QPMask@7 () T@U)
(declare-fun qpRange18 (T@U) Bool)
(declare-fun invRecv18 (T@U) Int)
(declare-fun QPMask@8 () T@U)
(declare-fun __flatten_5@1 () T@U)
(declare-fun __flatten_4@1 () Int)
(declare-fun __flatten_6@1 () T@U)
(declare-fun Heap@0 () T@U)
(declare-fun __flatten_8@1 () T@U)
(declare-fun __flatten_7@1 () Int)
(declare-fun __flatten_9@1 () T@U)
(declare-fun neverTriggered19 (Int) Bool)
(declare-fun qpRange19 (T@U) Bool)
(declare-fun invRecv19 (T@U) Int)
(declare-fun QPMask@9 () T@U)
(declare-fun neverTriggered20 (Int) Bool)
(declare-fun qpRange20 (T@U) Bool)
(declare-fun invRecv20 (T@U) Int)
(declare-fun QPMask@10 () T@U)
(declare-fun neverTriggered21 (Int) Bool)
(declare-fun qpRange21 (T@U) Bool)
(declare-fun invRecv21 (T@U) Int)
(declare-fun QPMask@11 () T@U)
(declare-fun i_35_1 () Int)
(declare-fun i_33_1 () Int)
(declare-fun i_31_1 () Int)
(declare-fun i_29_1 () Int)
(declare-fun QPMask@14 () T@U)
(declare-fun neverTriggered7 (Int) Bool)
(declare-fun qpRange7 (T@U) Bool)
(declare-fun invRecv7 (T@U) Int)
(declare-fun QPMask@15 () T@U)
(declare-fun neverTriggered8 (Int) Bool)
(declare-fun qpRange8 (T@U) Bool)
(declare-fun invRecv8 (T@U) Int)
(declare-fun QPMask@16 () T@U)
(declare-fun neverTriggered9 (Int) Bool)
(declare-fun qpRange9 (T@U) Bool)
(declare-fun invRecv9 (T@U) Int)
(declare-fun QPMask@17 () T@U)
(declare-fun i_97 () Int)
(declare-fun i_45 () Int)
(declare-fun i_94 () Int)
(declare-fun i_43 () Int)
(declare-fun i_91 () Int)
(declare-fun i_41 () Int)
(declare-fun i_88 () Int)
(declare-fun i_36 () Int)
(declare-fun qpRange22 (T@U) Bool)
(declare-fun invRecv22 (T@U) Int)
(declare-fun QPMask@12 () T@U)
(declare-fun qpRange23 (T@U) Bool)
(declare-fun invRecv23 (T@U) Int)
(declare-fun QPMask@13 () T@U)
(declare-fun qpRange24 (T@U) Bool)
(declare-fun invRecv24 (T@U) Int)
(declare-fun Heap@@9 () T@U)
(declare-fun __flatten_9@0 () T@U)
(declare-fun __flatten_8@0 () T@U)
(declare-fun __flatten_6@0 () T@U)
(declare-fun __flatten_5@0 () T@U)
(declare-fun i_46 () Int)
(declare-fun i_44 () Int)
(declare-fun i_42 () Int)
(declare-fun i_40 () Int)
(declare-fun __flatten_5 () T@U)
(declare-fun __flatten_6 () T@U)
(declare-fun __flatten_8 () T@U)
(declare-fun __flatten_9 () T@U)
(declare-fun QPMask@2 () T@U)
(declare-fun neverTriggered10 (Int) Bool)
(declare-fun qpRange10 (T@U) Bool)
(declare-fun invRecv10 (T@U) Int)
(declare-fun QPMask@3 () T@U)
(declare-fun neverTriggered11 (Int) Bool)
(declare-fun qpRange11 (T@U) Bool)
(declare-fun invRecv11 (T@U) Int)
(declare-fun QPMask@4 () T@U)
(declare-fun neverTriggered12 (Int) Bool)
(declare-fun qpRange12 (T@U) Bool)
(declare-fun invRecv12 (T@U) Int)
(declare-fun qpRange3 (T@U) Bool)
(declare-fun invRecv3 (T@U) Int)
(declare-fun QPMask@1 () T@U)
(declare-fun i_10 () Int)
(declare-fun i_8 () Int)
(declare-fun j_4 () Int)
(declare-fun qpRange2 (T@U) Bool)
(declare-fun invRecv2 (T@U) Int)
(declare-fun QPMask@0 () T@U)
(declare-fun i_6 () Int)
(declare-fun i_4 () Int)
(declare-fun j_2 () Int)
(declare-fun qpRange1 (T@U) Bool)
(declare-fun invRecv1 (T@U) Int)
(declare-fun i_2 () Int)
(declare-fun i@@6 () Int)
(declare-fun j@@5 () Int)
(declare-fun diz () T@U)
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (= (type a_2) (SeqType RefType)) (= (type b_2) (SeqType RefType))) (= (type res) (SeqType RefType))) (= (type Heap@@9) (MapType0Type RefType))) (= (type QPMask@14) (MapType1Type RefType realType))) (= (type ExhaleHeap@0) (MapType0Type RefType))) (= (type QPMask@15) (MapType1Type RefType realType))) (= (type QPMask@16) (MapType1Type RefType realType))) (= (type QPMask@17) (MapType1Type RefType realType))) (= (type QPMask@5) (MapType1Type RefType realType))) (= (type QPMask@12) (MapType1Type RefType realType))) (= (type QPMask@13) (MapType1Type RefType realType))) (= (type Heap@1) (MapType0Type RefType))) (= (type QPMask@6) (MapType1Type RefType realType))) (= (type QPMask@7) (MapType1Type RefType realType))) (= (type QPMask@8) (MapType1Type RefType realType))) (= (type __flatten_5@1) RefType)) (= (type __flatten_6@1) RefType)) (= (type Heap@0) (MapType0Type RefType))) (= (type __flatten_8@1) RefType)) (= (type __flatten_9@1) RefType)) (= (type QPMask@9) (MapType1Type RefType realType))) (= (type QPMask@10) (MapType1Type RefType realType))) (= (type QPMask@11) (MapType1Type RefType realType))) (= (type QPMask@20) (MapType1Type RefType realType))) (= (type QPMask@19) (MapType1Type RefType realType))) (= (type QPMask@18) (MapType1Type RefType realType))) (= (type __flatten_9@0) RefType)) (= (type __flatten_8@0) RefType)) (= (type __flatten_6@0) RefType)) (= (type __flatten_5@0) RefType)) (= (type __flatten_5) RefType)) (= (type __flatten_6) RefType)) (= (type __flatten_8) RefType)) (= (type __flatten_9) RefType)) (= (type QPMask@2) (MapType1Type RefType realType))) (= (type QPMask@3) (MapType1Type RefType realType))) (= (type QPMask@4) (MapType1Type RefType realType))) (= (type QPMask@23) (MapType1Type RefType realType))) (= (type PostHeap@0) (MapType0Type RefType))) (= (type QPMask@22) (MapType1Type RefType realType))) (= (type QPMask@21) (MapType1Type RefType realType))) (= (type QPMask@1) (MapType1Type RefType realType))) (= (type QPMask@0) (MapType1Type RefType realType))) (= (type diz) RefType)))
(set-info :boogie-vc-id Exercise4__zip)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 341) (let ((anon52_correct true))
(let ((anon193_Else_correct  (=> (and (not (and (<= 0 i_24) (and (= (mod i_24 2) 0) (< i_24 (|Seq#Length| res))))) (= (ControlFlow 0 320) 312)) anon52_correct)))
(let ((anon193_Then_correct  (=> (and (<= 0 i_24) (and (= (mod i_24 2) 0) (< i_24 (|Seq#Length| res)))) (and (=> (= (ControlFlow 0 313) (- 0 319)) (>= i_24 0)) (=> (>= i_24 0) (and (=> (= (ControlFlow 0 313) (- 0 318)) (< i_24 (|Seq#Length| res))) (=> (< i_24 (|Seq#Length| res)) (and (=> (= (ControlFlow 0 313) (- 0 317)) (HasDirectPerm QPMask@23 (|Seq#Index| res i_24) Ref__Integer_value)) (=> (HasDirectPerm QPMask@23 (|Seq#Index| res i_24) Ref__Integer_value) (and (=> (= (ControlFlow 0 313) (- 0 316)) (>= (div i_24 2) 0)) (=> (>= (div i_24 2) 0) (and (=> (= (ControlFlow 0 313) (- 0 315)) (< (div i_24 2) (|Seq#Length| a_2))) (=> (< (div i_24 2) (|Seq#Length| a_2)) (and (=> (= (ControlFlow 0 313) (- 0 314)) (HasDirectPerm QPMask@23 (|Seq#Index| a_2 (div i_24 2)) Ref__Integer_value)) (=> (HasDirectPerm QPMask@23 (|Seq#Index| a_2 (div i_24 2)) Ref__Integer_value) (=> (= (ControlFlow 0 313) 312) anon52_correct))))))))))))))))
(let ((anon192_Else_correct true))
(let ((anon190_Else_correct  (=> (and (forall ((i_23 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U i_23)) (= (U_2_int (MapType0Select PostHeap@0 (|Seq#Index| res (+ (* 2 i_23) 1)) Ref__Integer_value)) (U_2_int (MapType0Select PostHeap@0 (|Seq#Index| b_2 i_23) Ref__Integer_value))))
 :qid |stdinbpl.1138:20|
 :skolemid |99|
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U i_23)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U i_23)))
 :pattern ( (|Seq#Index| b_2 i_23))
)) (state PostHeap@0 QPMask@23)) (and (and (=> (= (ControlFlow 0 321) 311) anon192_Else_correct) (=> (= (ControlFlow 0 321) 313) anon193_Then_correct)) (=> (= (ControlFlow 0 321) 320) anon193_Else_correct)))))
(let ((anon48_correct true))
(let ((anon191_Else_correct  (=> (and (not (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U i_22))) (= (ControlFlow 0 310) 302)) anon48_correct)))
(let ((anon191_Then_correct  (=> (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U i_22)) (and (=> (= (ControlFlow 0 303) (- 0 309)) (>= (+ (* 2 i_22) 1) 0)) (=> (>= (+ (* 2 i_22) 1) 0) (and (=> (= (ControlFlow 0 303) (- 0 308)) (< (+ (* 2 i_22) 1) (|Seq#Length| res))) (=> (< (+ (* 2 i_22) 1) (|Seq#Length| res)) (and (=> (= (ControlFlow 0 303) (- 0 307)) (HasDirectPerm QPMask@23 (|Seq#Index| res (+ (* 2 i_22) 1)) Ref__Integer_value)) (=> (HasDirectPerm QPMask@23 (|Seq#Index| res (+ (* 2 i_22) 1)) Ref__Integer_value) (and (=> (= (ControlFlow 0 303) (- 0 306)) (>= i_22 0)) (=> (>= i_22 0) (and (=> (= (ControlFlow 0 303) (- 0 305)) (< i_22 (|Seq#Length| b_2))) (=> (< i_22 (|Seq#Length| b_2)) (and (=> (= (ControlFlow 0 303) (- 0 304)) (HasDirectPerm QPMask@23 (|Seq#Index| b_2 i_22) Ref__Integer_value)) (=> (HasDirectPerm QPMask@23 (|Seq#Index| b_2 i_22) Ref__Integer_value) (=> (= (ControlFlow 0 303) 302) anon48_correct))))))))))))))))
(let ((anon188_Else_correct  (=> (and (forall ((i_21 Int) ) (!  (=> (and (<= 0 i_21) (and (= (mod i_21 2) 1) (< i_21 (|Seq#Length| res)))) (= (U_2_int (MapType0Select PostHeap@0 (|Seq#Index| res i_21) Ref__Integer_value)) (U_2_int (MapType0Select PostHeap@0 (|Seq#Index| b_2 (div i_21 2)) Ref__Integer_value))))
 :qid |stdinbpl.1114:20|
 :skolemid |98|
 :pattern ( (|Seq#Index| res i_21))
)) (state PostHeap@0 QPMask@23)) (and (and (=> (= (ControlFlow 0 322) 321) anon190_Else_correct) (=> (= (ControlFlow 0 322) 303) anon191_Then_correct)) (=> (= (ControlFlow 0 322) 310) anon191_Else_correct)))))
(let ((anon44_correct true))
(let ((anon189_Else_correct  (=> (and (not (and (<= 0 i_20) (and (= (mod i_20 2) 1) (< i_20 (|Seq#Length| res))))) (= (ControlFlow 0 301) 293)) anon44_correct)))
(let ((anon189_Then_correct  (=> (and (<= 0 i_20) (and (= (mod i_20 2) 1) (< i_20 (|Seq#Length| res)))) (and (=> (= (ControlFlow 0 294) (- 0 300)) (>= i_20 0)) (=> (>= i_20 0) (and (=> (= (ControlFlow 0 294) (- 0 299)) (< i_20 (|Seq#Length| res))) (=> (< i_20 (|Seq#Length| res)) (and (=> (= (ControlFlow 0 294) (- 0 298)) (HasDirectPerm QPMask@23 (|Seq#Index| res i_20) Ref__Integer_value)) (=> (HasDirectPerm QPMask@23 (|Seq#Index| res i_20) Ref__Integer_value) (and (=> (= (ControlFlow 0 294) (- 0 297)) (>= (div i_20 2) 0)) (=> (>= (div i_20 2) 0) (and (=> (= (ControlFlow 0 294) (- 0 296)) (< (div i_20 2) (|Seq#Length| b_2))) (=> (< (div i_20 2) (|Seq#Length| b_2)) (and (=> (= (ControlFlow 0 294) (- 0 295)) (HasDirectPerm QPMask@23 (|Seq#Index| b_2 (div i_20 2)) Ref__Integer_value)) (=> (HasDirectPerm QPMask@23 (|Seq#Index| b_2 (div i_20 2)) Ref__Integer_value) (=> (= (ControlFlow 0 294) 293) anon44_correct))))))))))))))))
(let ((anon186_Else_correct  (=> (and (forall ((i_19 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U i_19)) (= (U_2_int (MapType0Select PostHeap@0 (|Seq#Index| res (* 2 i_19)) Ref__Integer_value)) (U_2_int (MapType0Select PostHeap@0 (|Seq#Index| a_2 i_19) Ref__Integer_value))))
 :qid |stdinbpl.1090:20|
 :skolemid |97|
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U i_19)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U i_19)))
 :pattern ( (|Seq#Index| a_2 i_19))
)) (state PostHeap@0 QPMask@23)) (and (and (=> (= (ControlFlow 0 323) 322) anon188_Else_correct) (=> (= (ControlFlow 0 323) 294) anon189_Then_correct)) (=> (= (ControlFlow 0 323) 301) anon189_Else_correct)))))
(let ((anon40_correct true))
(let ((anon187_Else_correct  (=> (and (not (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U i_18))) (= (ControlFlow 0 292) 284)) anon40_correct)))
(let ((anon187_Then_correct  (=> (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U i_18)) (and (=> (= (ControlFlow 0 285) (- 0 291)) (>= (* 2 i_18) 0)) (=> (>= (* 2 i_18) 0) (and (=> (= (ControlFlow 0 285) (- 0 290)) (< (* 2 i_18) (|Seq#Length| res))) (=> (< (* 2 i_18) (|Seq#Length| res)) (and (=> (= (ControlFlow 0 285) (- 0 289)) (HasDirectPerm QPMask@23 (|Seq#Index| res (* 2 i_18)) Ref__Integer_value)) (=> (HasDirectPerm QPMask@23 (|Seq#Index| res (* 2 i_18)) Ref__Integer_value) (and (=> (= (ControlFlow 0 285) (- 0 288)) (>= i_18 0)) (=> (>= i_18 0) (and (=> (= (ControlFlow 0 285) (- 0 287)) (< i_18 (|Seq#Length| a_2))) (=> (< i_18 (|Seq#Length| a_2)) (and (=> (= (ControlFlow 0 285) (- 0 286)) (HasDirectPerm QPMask@23 (|Seq#Index| a_2 i_18) Ref__Integer_value)) (=> (HasDirectPerm QPMask@23 (|Seq#Index| a_2 i_18) Ref__Integer_value) (=> (= (ControlFlow 0 285) 284) anon40_correct))))))))))))))))
(let ((anon184_Else_correct  (and (=> (= (ControlFlow 0 324) (- 0 325)) (forall ((i_17 Int) (i_17_1 Int) ) (!  (=> (and (and (and (and (not (= i_17 i_17_1)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U i_17))) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U i_17_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| res i_17) (|Seq#Index| res i_17_1))))
 :qid |stdinbpl.1038:15|
 :skolemid |91|
))) (=> (forall ((i_17@@0 Int) (i_17_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_17@@0 i_17_1@@0)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U i_17@@0))) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U i_17_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| res i_17@@0) (|Seq#Index| res i_17_1@@0))))
 :qid |stdinbpl.1038:15|
 :skolemid |91|
)) (=> (forall ((i_17@@1 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U i_17@@1)) (< NoPerm FullPerm)) (and (qpRange6 (|Seq#Index| res i_17@@1)) (= (invRecv6 (|Seq#Index| res i_17@@1)) i_17@@1)))
 :qid |stdinbpl.1044:22|
 :skolemid |92|
 :pattern ( (|Seq#Index| res i_17@@1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U i_17@@1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U i_17@@1)))
 :pattern ( (|Seq#Index| res i_17@@1))
)) (=> (and (forall ((o_3 T@U) ) (!  (=> (= (type o_3) RefType) (=> (and (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U (invRecv6 o_3))) (< NoPerm FullPerm)) (qpRange6 o_3)) (= (|Seq#Index| res (invRecv6 o_3)) o_3)))
 :qid |stdinbpl.1048:22|
 :skolemid |93|
 :pattern ( (invRecv6 o_3))
)) (forall ((i_17@@2 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U i_17@@2)) (not (= (|Seq#Index| res i_17@@2) null)))
 :qid |stdinbpl.1054:22|
 :skolemid |94|
 :pattern ( (|Seq#Index| res i_17@@2))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U i_17@@2)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U i_17@@2)))
 :pattern ( (|Seq#Index| res i_17@@2))
))) (=> (and (and (forall ((o_3@@0 T@U) ) (!  (=> (= (type o_3@@0) RefType) (and (=> (and (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U (invRecv6 o_3@@0))) (< NoPerm FullPerm)) (qpRange6 o_3@@0)) (and (=> (< NoPerm FullPerm) (= (|Seq#Index| res (invRecv6 o_3@@0)) o_3@@0)) (= (U_2_real (MapType1Select QPMask@23 o_3@@0 Ref__Integer_value)) (+ (U_2_real (MapType1Select QPMask@22 o_3@@0 Ref__Integer_value)) FullPerm)))) (=> (not (and (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U (invRecv6 o_3@@0))) (< NoPerm FullPerm)) (qpRange6 o_3@@0))) (= (U_2_real (MapType1Select QPMask@23 o_3@@0 Ref__Integer_value)) (U_2_real (MapType1Select QPMask@22 o_3@@0 Ref__Integer_value))))))
 :qid |stdinbpl.1060:22|
 :skolemid |95|
 :pattern ( (MapType1Select QPMask@23 o_3@@0 Ref__Integer_value))
)) (forall ((o_3@@1 T@U) (f_5 T@U) ) (! (let ((B@@11 (FieldTypeInv1 (type f_5))))
(let ((A@@12 (FieldTypeInv0 (type f_5))))
 (=> (and (and (= (type o_3@@1) RefType) (= (type f_5) (FieldType A@@12 B@@11))) (not (= f_5 Ref__Integer_value))) (= (U_2_real (MapType1Select QPMask@22 o_3@@1 f_5)) (U_2_real (MapType1Select QPMask@23 o_3@@1 f_5))))))
 :qid |stdinbpl.1064:29|
 :skolemid |96|
 :pattern ( (MapType1Select QPMask@22 o_3@@1 f_5))
 :pattern ( (MapType1Select QPMask@23 o_3@@1 f_5))
))) (and (state PostHeap@0 QPMask@23) (state PostHeap@0 QPMask@23))) (and (and (=> (= (ControlFlow 0 324) 323) anon186_Else_correct) (=> (= (ControlFlow 0 324) 285) anon187_Then_correct)) (=> (= (ControlFlow 0 324) 292) anon187_Else_correct)))))))))
(let ((anon36_correct true))
(let ((anon185_Else_correct  (=> (and (not (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U i_16))) (= (ControlFlow 0 283) 279)) anon36_correct)))
(let ((anon185_Then_correct  (=> (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U i_16)) (and (=> (= (ControlFlow 0 280) (- 0 282)) (>= i_16 0)) (=> (>= i_16 0) (and (=> (= (ControlFlow 0 280) (- 0 281)) (< i_16 (|Seq#Length| res))) (=> (< i_16 (|Seq#Length| res)) (=> (= (ControlFlow 0 280) 279) anon36_correct))))))))
(let ((anon182_Else_correct  (and (=> (= (ControlFlow 0 326) (- 0 327)) (forall ((i_15 Int) (i_15_1 Int) ) (!  (=> (and (and (and (and (not (= i_15 i_15_1)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U i_15))) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U i_15_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| b_2 i_15) (|Seq#Index| b_2 i_15_1))))
 :qid |stdinbpl.992:15|
 :skolemid |85|
))) (=> (forall ((i_15@@0 Int) (i_15_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_15@@0 i_15_1@@0)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U i_15@@0))) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U i_15_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| b_2 i_15@@0) (|Seq#Index| b_2 i_15_1@@0))))
 :qid |stdinbpl.992:15|
 :skolemid |85|
)) (=> (forall ((i_15@@1 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U i_15@@1)) (< NoPerm FullPerm)) (and (qpRange5 (|Seq#Index| b_2 i_15@@1)) (= (invRecv5 (|Seq#Index| b_2 i_15@@1)) i_15@@1)))
 :qid |stdinbpl.998:22|
 :skolemid |86|
 :pattern ( (|Seq#Index| b_2 i_15@@1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U i_15@@1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U i_15@@1)))
 :pattern ( (|Seq#Index| b_2 i_15@@1))
)) (=> (and (forall ((o_3@@2 T@U) ) (!  (=> (= (type o_3@@2) RefType) (=> (and (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U (invRecv5 o_3@@2))) (< NoPerm FullPerm)) (qpRange5 o_3@@2)) (= (|Seq#Index| b_2 (invRecv5 o_3@@2)) o_3@@2)))
 :qid |stdinbpl.1002:22|
 :skolemid |87|
 :pattern ( (invRecv5 o_3@@2))
)) (forall ((i_15@@2 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U i_15@@2)) (not (= (|Seq#Index| b_2 i_15@@2) null)))
 :qid |stdinbpl.1008:22|
 :skolemid |88|
 :pattern ( (|Seq#Index| b_2 i_15@@2))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U i_15@@2)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U i_15@@2)))
 :pattern ( (|Seq#Index| b_2 i_15@@2))
))) (=> (and (and (forall ((o_3@@3 T@U) ) (!  (=> (= (type o_3@@3) RefType) (and (=> (and (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U (invRecv5 o_3@@3))) (< NoPerm FullPerm)) (qpRange5 o_3@@3)) (and (=> (< NoPerm FullPerm) (= (|Seq#Index| b_2 (invRecv5 o_3@@3)) o_3@@3)) (= (U_2_real (MapType1Select QPMask@22 o_3@@3 Ref__Integer_value)) (+ (U_2_real (MapType1Select QPMask@21 o_3@@3 Ref__Integer_value)) FullPerm)))) (=> (not (and (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U (invRecv5 o_3@@3))) (< NoPerm FullPerm)) (qpRange5 o_3@@3))) (= (U_2_real (MapType1Select QPMask@22 o_3@@3 Ref__Integer_value)) (U_2_real (MapType1Select QPMask@21 o_3@@3 Ref__Integer_value))))))
 :qid |stdinbpl.1014:22|
 :skolemid |89|
 :pattern ( (MapType1Select QPMask@22 o_3@@3 Ref__Integer_value))
)) (forall ((o_3@@4 T@U) (f_5@@0 T@U) ) (! (let ((B@@12 (FieldTypeInv1 (type f_5@@0))))
(let ((A@@13 (FieldTypeInv0 (type f_5@@0))))
 (=> (and (and (= (type o_3@@4) RefType) (= (type f_5@@0) (FieldType A@@13 B@@12))) (not (= f_5@@0 Ref__Integer_value))) (= (U_2_real (MapType1Select QPMask@21 o_3@@4 f_5@@0)) (U_2_real (MapType1Select QPMask@22 o_3@@4 f_5@@0))))))
 :qid |stdinbpl.1018:29|
 :skolemid |90|
 :pattern ( (MapType1Select QPMask@21 o_3@@4 f_5@@0))
 :pattern ( (MapType1Select QPMask@22 o_3@@4 f_5@@0))
))) (and (state PostHeap@0 QPMask@22) (state PostHeap@0 QPMask@22))) (and (and (=> (= (ControlFlow 0 326) 324) anon184_Else_correct) (=> (= (ControlFlow 0 326) 280) anon185_Then_correct)) (=> (= (ControlFlow 0 326) 283) anon185_Else_correct)))))))))
(let ((anon32_correct true))
(let ((anon183_Else_correct  (=> (and (not (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U i_14))) (= (ControlFlow 0 278) 274)) anon32_correct)))
(let ((anon183_Then_correct  (=> (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U i_14)) (and (=> (= (ControlFlow 0 275) (- 0 277)) (>= i_14 0)) (=> (>= i_14 0) (and (=> (= (ControlFlow 0 275) (- 0 276)) (< i_14 (|Seq#Length| b_2))) (=> (< i_14 (|Seq#Length| b_2)) (=> (= (ControlFlow 0 275) 274) anon32_correct))))))))
(let ((anon180_Else_correct  (and (=> (= (ControlFlow 0 328) (- 0 329)) (forall ((i_13 Int) (i_13_1 Int) ) (!  (=> (and (and (and (and (not (= i_13 i_13_1)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U i_13))) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U i_13_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| a_2 i_13) (|Seq#Index| a_2 i_13_1))))
 :qid |stdinbpl.946:15|
 :skolemid |79|
))) (=> (forall ((i_13@@0 Int) (i_13_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_13@@0 i_13_1@@0)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U i_13@@0))) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U i_13_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| a_2 i_13@@0) (|Seq#Index| a_2 i_13_1@@0))))
 :qid |stdinbpl.946:15|
 :skolemid |79|
)) (=> (forall ((i_13@@1 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U i_13@@1)) (< NoPerm FullPerm)) (and (qpRange4 (|Seq#Index| a_2 i_13@@1)) (= (invRecv4 (|Seq#Index| a_2 i_13@@1)) i_13@@1)))
 :qid |stdinbpl.952:22|
 :skolemid |80|
 :pattern ( (|Seq#Index| a_2 i_13@@1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U i_13@@1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U i_13@@1)))
 :pattern ( (|Seq#Index| a_2 i_13@@1))
)) (=> (and (forall ((o_3@@5 T@U) ) (!  (=> (= (type o_3@@5) RefType) (=> (and (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U (invRecv4 o_3@@5))) (< NoPerm FullPerm)) (qpRange4 o_3@@5)) (= (|Seq#Index| a_2 (invRecv4 o_3@@5)) o_3@@5)))
 :qid |stdinbpl.956:22|
 :skolemid |81|
 :pattern ( (invRecv4 o_3@@5))
)) (forall ((i_13@@2 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U i_13@@2)) (not (= (|Seq#Index| a_2 i_13@@2) null)))
 :qid |stdinbpl.962:22|
 :skolemid |82|
 :pattern ( (|Seq#Index| a_2 i_13@@2))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U i_13@@2)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U i_13@@2)))
 :pattern ( (|Seq#Index| a_2 i_13@@2))
))) (=> (and (and (forall ((o_3@@6 T@U) ) (!  (=> (= (type o_3@@6) RefType) (and (=> (and (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U (invRecv4 o_3@@6))) (< NoPerm FullPerm)) (qpRange4 o_3@@6)) (and (=> (< NoPerm FullPerm) (= (|Seq#Index| a_2 (invRecv4 o_3@@6)) o_3@@6)) (= (U_2_real (MapType1Select QPMask@21 o_3@@6 Ref__Integer_value)) (+ (U_2_real (MapType1Select ZeroMask o_3@@6 Ref__Integer_value)) FullPerm)))) (=> (not (and (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U (invRecv4 o_3@@6))) (< NoPerm FullPerm)) (qpRange4 o_3@@6))) (= (U_2_real (MapType1Select QPMask@21 o_3@@6 Ref__Integer_value)) (U_2_real (MapType1Select ZeroMask o_3@@6 Ref__Integer_value))))))
 :qid |stdinbpl.968:22|
 :skolemid |83|
 :pattern ( (MapType1Select QPMask@21 o_3@@6 Ref__Integer_value))
)) (forall ((o_3@@7 T@U) (f_5@@1 T@U) ) (! (let ((B@@13 (FieldTypeInv1 (type f_5@@1))))
(let ((A@@14 (FieldTypeInv0 (type f_5@@1))))
 (=> (and (and (= (type o_3@@7) RefType) (= (type f_5@@1) (FieldType A@@14 B@@13))) (not (= f_5@@1 Ref__Integer_value))) (= (U_2_real (MapType1Select ZeroMask o_3@@7 f_5@@1)) (U_2_real (MapType1Select QPMask@21 o_3@@7 f_5@@1))))))
 :qid |stdinbpl.972:29|
 :skolemid |84|
 :pattern ( (MapType1Select ZeroMask o_3@@7 f_5@@1))
 :pattern ( (MapType1Select QPMask@21 o_3@@7 f_5@@1))
))) (and (state PostHeap@0 QPMask@21) (state PostHeap@0 QPMask@21))) (and (and (=> (= (ControlFlow 0 328) 326) anon182_Else_correct) (=> (= (ControlFlow 0 328) 275) anon183_Then_correct)) (=> (= (ControlFlow 0 328) 278) anon183_Else_correct)))))))))
(let ((anon28_correct true))
(let ((anon181_Else_correct  (=> (and (not (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U i_12))) (= (ControlFlow 0 273) 269)) anon28_correct)))
(let ((anon181_Then_correct  (=> (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U i_12)) (and (=> (= (ControlFlow 0 270) (- 0 272)) (>= i_12 0)) (=> (>= i_12 0) (and (=> (= (ControlFlow 0 270) (- 0 271)) (< i_12 (|Seq#Length| a_2))) (=> (< i_12 (|Seq#Length| a_2)) (=> (= (ControlFlow 0 270) 269) anon28_correct))))))))
(let ((anon179_Then_correct  (=> (state PostHeap@0 ZeroMask) (=> (and (= (|Seq#Length| res) (* 2 (|Seq#Length| a_2))) (state PostHeap@0 ZeroMask)) (=> (and (and (= (|Seq#Length| a_2) (|Seq#Length| b_2)) (state PostHeap@0 ZeroMask)) (and (= (|Seq#Length| res) (* 2 (|Seq#Length| b_2))) (state PostHeap@0 ZeroMask))) (and (and (=> (= (ControlFlow 0 330) 328) anon180_Else_correct) (=> (= (ControlFlow 0 330) 270) anon181_Then_correct)) (=> (= (ControlFlow 0 330) 273) anon181_Else_correct)))))))
(let ((anon98_correct true))
(let ((anon216_Else_correct  (=> (and (not (|Seq#Contains| (|Seq#Range| 0 (div k@0 2)) (int_2_U i_35))) (= (ControlFlow 0 242) 234)) anon98_correct)))
(let ((anon216_Then_correct  (=> (|Seq#Contains| (|Seq#Range| 0 (div k@0 2)) (int_2_U i_35)) (and (=> (= (ControlFlow 0 235) (- 0 241)) (>= (+ (* 2 i_35) 1) 0)) (=> (>= (+ (* 2 i_35) 1) 0) (and (=> (= (ControlFlow 0 235) (- 0 240)) (< (+ (* 2 i_35) 1) (|Seq#Length| res))) (=> (< (+ (* 2 i_35) 1) (|Seq#Length| res)) (and (=> (= (ControlFlow 0 235) (- 0 239)) (HasDirectPerm QPMask@20 (|Seq#Index| res (+ (* 2 i_35) 1)) Ref__Integer_value)) (=> (HasDirectPerm QPMask@20 (|Seq#Index| res (+ (* 2 i_35) 1)) Ref__Integer_value) (and (=> (= (ControlFlow 0 235) (- 0 238)) (>= i_35 0)) (=> (>= i_35 0) (and (=> (= (ControlFlow 0 235) (- 0 237)) (< i_35 (|Seq#Length| b_2))) (=> (< i_35 (|Seq#Length| b_2)) (and (=> (= (ControlFlow 0 235) (- 0 236)) (HasDirectPerm QPMask@20 (|Seq#Index| b_2 i_35) Ref__Integer_value)) (=> (HasDirectPerm QPMask@20 (|Seq#Index| b_2 i_35) Ref__Integer_value) (=> (= (ControlFlow 0 235) 234) anon98_correct))))))))))))))))
(let ((anon215_Else_correct true))
(let ((anon213_Else_correct  (=> (and (forall ((i_59 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 (div k@0 2)) (int_2_U i_59)) (= (U_2_int (MapType0Select ExhaleHeap@0 (|Seq#Index| res (* 2 i_59)) Ref__Integer_value)) (U_2_int (MapType0Select ExhaleHeap@0 (|Seq#Index| a_2 i_59) Ref__Integer_value))))
 :qid |stdinbpl.1594:24|
 :skolemid |143|
 :pattern ( (|Seq#Index| a_2 i_59))
)) (state ExhaleHeap@0 QPMask@20)) (and (and (=> (= (ControlFlow 0 243) 233) anon215_Else_correct) (=> (= (ControlFlow 0 243) 235) anon216_Then_correct)) (=> (= (ControlFlow 0 243) 242) anon216_Else_correct)))))
(let ((anon94_correct true))
(let ((anon214_Else_correct  (=> (and (not (|Seq#Contains| (|Seq#Range| 0 (div k@0 2)) (int_2_U i_34))) (= (ControlFlow 0 232) 224)) anon94_correct)))
(let ((anon214_Then_correct  (=> (|Seq#Contains| (|Seq#Range| 0 (div k@0 2)) (int_2_U i_34)) (and (=> (= (ControlFlow 0 225) (- 0 231)) (>= (* 2 i_34) 0)) (=> (>= (* 2 i_34) 0) (and (=> (= (ControlFlow 0 225) (- 0 230)) (< (* 2 i_34) (|Seq#Length| res))) (=> (< (* 2 i_34) (|Seq#Length| res)) (and (=> (= (ControlFlow 0 225) (- 0 229)) (HasDirectPerm QPMask@20 (|Seq#Index| res (* 2 i_34)) Ref__Integer_value)) (=> (HasDirectPerm QPMask@20 (|Seq#Index| res (* 2 i_34)) Ref__Integer_value) (and (=> (= (ControlFlow 0 225) (- 0 228)) (>= i_34 0)) (=> (>= i_34 0) (and (=> (= (ControlFlow 0 225) (- 0 227)) (< i_34 (|Seq#Length| a_2))) (=> (< i_34 (|Seq#Length| a_2)) (and (=> (= (ControlFlow 0 225) (- 0 226)) (HasDirectPerm QPMask@20 (|Seq#Index| a_2 i_34) Ref__Integer_value)) (=> (HasDirectPerm QPMask@20 (|Seq#Index| a_2 i_34) Ref__Integer_value) (=> (= (ControlFlow 0 225) 224) anon94_correct))))))))))))))))
(let ((anon211_Else_correct  (=> (and (forall ((i_57 Int) ) (!  (=> (and (<= 0 i_57) (and (= (mod i_57 2) 1) (< i_57 k@0))) (= (U_2_int (MapType0Select ExhaleHeap@0 (|Seq#Index| res i_57) Ref__Integer_value)) (U_2_int (MapType0Select ExhaleHeap@0 (|Seq#Index| b_2 (div i_57 2)) Ref__Integer_value))))
 :qid |stdinbpl.1570:24|
 :skolemid |142|
 :pattern ( (|Seq#Index| res i_57))
)) (state ExhaleHeap@0 QPMask@20)) (and (and (=> (= (ControlFlow 0 244) 243) anon213_Else_correct) (=> (= (ControlFlow 0 244) 225) anon214_Then_correct)) (=> (= (ControlFlow 0 244) 232) anon214_Else_correct)))))
(let ((anon90_correct true))
(let ((anon212_Else_correct  (=> (and (not (and (<= 0 i_33) (and (= (mod i_33 2) 1) (< i_33 k@0)))) (= (ControlFlow 0 223) 215)) anon90_correct)))
(let ((anon212_Then_correct  (=> (and (<= 0 i_33) (and (= (mod i_33 2) 1) (< i_33 k@0))) (and (=> (= (ControlFlow 0 216) (- 0 222)) (>= i_33 0)) (=> (>= i_33 0) (and (=> (= (ControlFlow 0 216) (- 0 221)) (< i_33 (|Seq#Length| res))) (=> (< i_33 (|Seq#Length| res)) (and (=> (= (ControlFlow 0 216) (- 0 220)) (HasDirectPerm QPMask@20 (|Seq#Index| res i_33) Ref__Integer_value)) (=> (HasDirectPerm QPMask@20 (|Seq#Index| res i_33) Ref__Integer_value) (and (=> (= (ControlFlow 0 216) (- 0 219)) (>= (div i_33 2) 0)) (=> (>= (div i_33 2) 0) (and (=> (= (ControlFlow 0 216) (- 0 218)) (< (div i_33 2) (|Seq#Length| b_2))) (=> (< (div i_33 2) (|Seq#Length| b_2)) (and (=> (= (ControlFlow 0 216) (- 0 217)) (HasDirectPerm QPMask@20 (|Seq#Index| b_2 (div i_33 2)) Ref__Integer_value)) (=> (HasDirectPerm QPMask@20 (|Seq#Index| b_2 (div i_33 2)) Ref__Integer_value) (=> (= (ControlFlow 0 216) 215) anon90_correct))))))))))))))))
(let ((anon209_Else_correct  (=> (and (forall ((i_55 Int) ) (!  (=> (and (<= 0 i_55) (and (= (mod i_55 2) 0) (< i_55 k@0))) (= (U_2_int (MapType0Select ExhaleHeap@0 (|Seq#Index| res i_55) Ref__Integer_value)) (U_2_int (MapType0Select ExhaleHeap@0 (|Seq#Index| a_2 (div i_55 2)) Ref__Integer_value))))
 :qid |stdinbpl.1546:24|
 :skolemid |141|
 :pattern ( (|Seq#Index| res i_55))
)) (state ExhaleHeap@0 QPMask@20)) (and (and (=> (= (ControlFlow 0 245) 244) anon211_Else_correct) (=> (= (ControlFlow 0 245) 216) anon212_Then_correct)) (=> (= (ControlFlow 0 245) 223) anon212_Else_correct)))))
(let ((anon86_correct true))
(let ((anon210_Else_correct  (=> (and (not (and (<= 0 i_32) (and (= (mod i_32 2) 0) (< i_32 k@0)))) (= (ControlFlow 0 214) 206)) anon86_correct)))
(let ((anon210_Then_correct  (=> (and (<= 0 i_32) (and (= (mod i_32 2) 0) (< i_32 k@0))) (and (=> (= (ControlFlow 0 207) (- 0 213)) (>= i_32 0)) (=> (>= i_32 0) (and (=> (= (ControlFlow 0 207) (- 0 212)) (< i_32 (|Seq#Length| res))) (=> (< i_32 (|Seq#Length| res)) (and (=> (= (ControlFlow 0 207) (- 0 211)) (HasDirectPerm QPMask@20 (|Seq#Index| res i_32) Ref__Integer_value)) (=> (HasDirectPerm QPMask@20 (|Seq#Index| res i_32) Ref__Integer_value) (and (=> (= (ControlFlow 0 207) (- 0 210)) (>= (div i_32 2) 0)) (=> (>= (div i_32 2) 0) (and (=> (= (ControlFlow 0 207) (- 0 209)) (< (div i_32 2) (|Seq#Length| a_2))) (=> (< (div i_32 2) (|Seq#Length| a_2)) (and (=> (= (ControlFlow 0 207) (- 0 208)) (HasDirectPerm QPMask@20 (|Seq#Index| a_2 (div i_32 2)) Ref__Integer_value)) (=> (HasDirectPerm QPMask@20 (|Seq#Index| a_2 (div i_32 2)) Ref__Integer_value) (=> (= (ControlFlow 0 207) 206) anon86_correct))))))))))))))))
(let ((anon207_Else_correct  (and (=> (= (ControlFlow 0 246) (- 0 247)) (forall ((i_53 Int) (i_53_1 Int) ) (!  (=> (and (and (and (and (not (= i_53 i_53_1)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U i_53))) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U i_53_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| res i_53) (|Seq#Index| res i_53_1))))
 :qid |stdinbpl.1494:19|
 :skolemid |135|
))) (=> (forall ((i_53@@0 Int) (i_53_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_53@@0 i_53_1@@0)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U i_53@@0))) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U i_53_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| res i_53@@0) (|Seq#Index| res i_53_1@@0))))
 :qid |stdinbpl.1494:19|
 :skolemid |135|
)) (=> (forall ((i_53@@1 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U i_53@@1)) (< NoPerm FullPerm)) (and (qpRange15 (|Seq#Index| res i_53@@1)) (= (invRecv15 (|Seq#Index| res i_53@@1)) i_53@@1)))
 :qid |stdinbpl.1500:26|
 :skolemid |136|
 :pattern ( (|Seq#Index| res i_53@@1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U i_53@@1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U i_53@@1)))
 :pattern ( (|Seq#Index| res i_53@@1))
)) (=> (and (forall ((o_3@@8 T@U) ) (!  (=> (= (type o_3@@8) RefType) (=> (and (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U (invRecv15 o_3@@8))) (< NoPerm FullPerm)) (qpRange15 o_3@@8)) (= (|Seq#Index| res (invRecv15 o_3@@8)) o_3@@8)))
 :qid |stdinbpl.1504:26|
 :skolemid |137|
 :pattern ( (invRecv15 o_3@@8))
)) (forall ((i_53@@2 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U i_53@@2)) (not (= (|Seq#Index| res i_53@@2) null)))
 :qid |stdinbpl.1510:26|
 :skolemid |138|
 :pattern ( (|Seq#Index| res i_53@@2))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U i_53@@2)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U i_53@@2)))
 :pattern ( (|Seq#Index| res i_53@@2))
))) (=> (and (and (forall ((o_3@@9 T@U) ) (!  (=> (= (type o_3@@9) RefType) (and (=> (and (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U (invRecv15 o_3@@9))) (< NoPerm FullPerm)) (qpRange15 o_3@@9)) (and (=> (< NoPerm FullPerm) (= (|Seq#Index| res (invRecv15 o_3@@9)) o_3@@9)) (= (U_2_real (MapType1Select QPMask@20 o_3@@9 Ref__Integer_value)) (+ (U_2_real (MapType1Select QPMask@19 o_3@@9 Ref__Integer_value)) FullPerm)))) (=> (not (and (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U (invRecv15 o_3@@9))) (< NoPerm FullPerm)) (qpRange15 o_3@@9))) (= (U_2_real (MapType1Select QPMask@20 o_3@@9 Ref__Integer_value)) (U_2_real (MapType1Select QPMask@19 o_3@@9 Ref__Integer_value))))))
 :qid |stdinbpl.1516:26|
 :skolemid |139|
 :pattern ( (MapType1Select QPMask@20 o_3@@9 Ref__Integer_value))
)) (forall ((o_3@@10 T@U) (f_5@@2 T@U) ) (! (let ((B@@14 (FieldTypeInv1 (type f_5@@2))))
(let ((A@@15 (FieldTypeInv0 (type f_5@@2))))
 (=> (and (and (= (type o_3@@10) RefType) (= (type f_5@@2) (FieldType A@@15 B@@14))) (not (= f_5@@2 Ref__Integer_value))) (= (U_2_real (MapType1Select QPMask@19 o_3@@10 f_5@@2)) (U_2_real (MapType1Select QPMask@20 o_3@@10 f_5@@2))))))
 :qid |stdinbpl.1520:33|
 :skolemid |140|
 :pattern ( (MapType1Select QPMask@19 o_3@@10 f_5@@2))
 :pattern ( (MapType1Select QPMask@20 o_3@@10 f_5@@2))
))) (and (state ExhaleHeap@0 QPMask@20) (state ExhaleHeap@0 QPMask@20))) (and (and (=> (= (ControlFlow 0 246) 245) anon209_Else_correct) (=> (= (ControlFlow 0 246) 207) anon210_Then_correct)) (=> (= (ControlFlow 0 246) 214) anon210_Else_correct)))))))))
(let ((anon82_correct true))
(let ((anon208_Else_correct  (=> (and (not (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U i_31))) (= (ControlFlow 0 205) 201)) anon82_correct)))
(let ((anon208_Then_correct  (=> (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U i_31)) (and (=> (= (ControlFlow 0 202) (- 0 204)) (>= i_31 0)) (=> (>= i_31 0) (and (=> (= (ControlFlow 0 202) (- 0 203)) (< i_31 (|Seq#Length| res))) (=> (< i_31 (|Seq#Length| res)) (=> (= (ControlFlow 0 202) 201) anon82_correct))))))))
(let ((anon205_Else_correct  (and (=> (= (ControlFlow 0 248) (- 0 249)) (forall ((i_51 Int) (i_51_1 Int) ) (!  (=> (and (and (and (and (not (= i_51 i_51_1)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U i_51))) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U i_51_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| b_2 i_51) (|Seq#Index| b_2 i_51_1))))
 :qid |stdinbpl.1448:19|
 :skolemid |129|
))) (=> (forall ((i_51@@0 Int) (i_51_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_51@@0 i_51_1@@0)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U i_51@@0))) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U i_51_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| b_2 i_51@@0) (|Seq#Index| b_2 i_51_1@@0))))
 :qid |stdinbpl.1448:19|
 :skolemid |129|
)) (=> (forall ((i_51@@1 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U i_51@@1)) (< NoPerm FullPerm)) (and (qpRange14 (|Seq#Index| b_2 i_51@@1)) (= (invRecv14 (|Seq#Index| b_2 i_51@@1)) i_51@@1)))
 :qid |stdinbpl.1454:26|
 :skolemid |130|
 :pattern ( (|Seq#Index| b_2 i_51@@1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U i_51@@1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U i_51@@1)))
 :pattern ( (|Seq#Index| b_2 i_51@@1))
)) (=> (and (forall ((o_3@@11 T@U) ) (!  (=> (= (type o_3@@11) RefType) (=> (and (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U (invRecv14 o_3@@11))) (< NoPerm FullPerm)) (qpRange14 o_3@@11)) (= (|Seq#Index| b_2 (invRecv14 o_3@@11)) o_3@@11)))
 :qid |stdinbpl.1458:26|
 :skolemid |131|
 :pattern ( (invRecv14 o_3@@11))
)) (forall ((i_51@@2 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U i_51@@2)) (not (= (|Seq#Index| b_2 i_51@@2) null)))
 :qid |stdinbpl.1464:26|
 :skolemid |132|
 :pattern ( (|Seq#Index| b_2 i_51@@2))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U i_51@@2)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U i_51@@2)))
 :pattern ( (|Seq#Index| b_2 i_51@@2))
))) (=> (and (and (forall ((o_3@@12 T@U) ) (!  (=> (= (type o_3@@12) RefType) (and (=> (and (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U (invRecv14 o_3@@12))) (< NoPerm FullPerm)) (qpRange14 o_3@@12)) (and (=> (< NoPerm FullPerm) (= (|Seq#Index| b_2 (invRecv14 o_3@@12)) o_3@@12)) (= (U_2_real (MapType1Select QPMask@19 o_3@@12 Ref__Integer_value)) (+ (U_2_real (MapType1Select QPMask@18 o_3@@12 Ref__Integer_value)) FullPerm)))) (=> (not (and (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U (invRecv14 o_3@@12))) (< NoPerm FullPerm)) (qpRange14 o_3@@12))) (= (U_2_real (MapType1Select QPMask@19 o_3@@12 Ref__Integer_value)) (U_2_real (MapType1Select QPMask@18 o_3@@12 Ref__Integer_value))))))
 :qid |stdinbpl.1470:26|
 :skolemid |133|
 :pattern ( (MapType1Select QPMask@19 o_3@@12 Ref__Integer_value))
)) (forall ((o_3@@13 T@U) (f_5@@3 T@U) ) (! (let ((B@@15 (FieldTypeInv1 (type f_5@@3))))
(let ((A@@16 (FieldTypeInv0 (type f_5@@3))))
 (=> (and (and (= (type o_3@@13) RefType) (= (type f_5@@3) (FieldType A@@16 B@@15))) (not (= f_5@@3 Ref__Integer_value))) (= (U_2_real (MapType1Select QPMask@18 o_3@@13 f_5@@3)) (U_2_real (MapType1Select QPMask@19 o_3@@13 f_5@@3))))))
 :qid |stdinbpl.1474:33|
 :skolemid |134|
 :pattern ( (MapType1Select QPMask@18 o_3@@13 f_5@@3))
 :pattern ( (MapType1Select QPMask@19 o_3@@13 f_5@@3))
))) (and (state ExhaleHeap@0 QPMask@19) (state ExhaleHeap@0 QPMask@19))) (and (and (=> (= (ControlFlow 0 248) 246) anon207_Else_correct) (=> (= (ControlFlow 0 248) 202) anon208_Then_correct)) (=> (= (ControlFlow 0 248) 205) anon208_Else_correct)))))))))
(let ((anon78_correct true))
(let ((anon206_Else_correct  (=> (and (not (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U i_30))) (= (ControlFlow 0 200) 196)) anon78_correct)))
(let ((anon206_Then_correct  (=> (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U i_30)) (and (=> (= (ControlFlow 0 197) (- 0 199)) (>= i_30 0)) (=> (>= i_30 0) (and (=> (= (ControlFlow 0 197) (- 0 198)) (< i_30 (|Seq#Length| b_2))) (=> (< i_30 (|Seq#Length| b_2)) (=> (= (ControlFlow 0 197) 196) anon78_correct))))))))
(let ((anon203_Else_correct  (and (=> (= (ControlFlow 0 250) (- 0 251)) (forall ((i_49 Int) (i_49_1 Int) ) (!  (=> (and (and (and (and (not (= i_49 i_49_1)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U i_49))) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U i_49_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| a_2 i_49) (|Seq#Index| a_2 i_49_1))))
 :qid |stdinbpl.1402:19|
 :skolemid |123|
))) (=> (forall ((i_49@@0 Int) (i_49_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_49@@0 i_49_1@@0)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U i_49@@0))) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U i_49_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| a_2 i_49@@0) (|Seq#Index| a_2 i_49_1@@0))))
 :qid |stdinbpl.1402:19|
 :skolemid |123|
)) (=> (forall ((i_49@@1 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U i_49@@1)) (< NoPerm FullPerm)) (and (qpRange13 (|Seq#Index| a_2 i_49@@1)) (= (invRecv13 (|Seq#Index| a_2 i_49@@1)) i_49@@1)))
 :qid |stdinbpl.1408:26|
 :skolemid |124|
 :pattern ( (|Seq#Index| a_2 i_49@@1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U i_49@@1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U i_49@@1)))
 :pattern ( (|Seq#Index| a_2 i_49@@1))
)) (=> (and (forall ((o_3@@14 T@U) ) (!  (=> (= (type o_3@@14) RefType) (=> (and (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U (invRecv13 o_3@@14))) (< NoPerm FullPerm)) (qpRange13 o_3@@14)) (= (|Seq#Index| a_2 (invRecv13 o_3@@14)) o_3@@14)))
 :qid |stdinbpl.1412:26|
 :skolemid |125|
 :pattern ( (invRecv13 o_3@@14))
)) (forall ((i_49@@2 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U i_49@@2)) (not (= (|Seq#Index| a_2 i_49@@2) null)))
 :qid |stdinbpl.1418:26|
 :skolemid |126|
 :pattern ( (|Seq#Index| a_2 i_49@@2))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U i_49@@2)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U i_49@@2)))
 :pattern ( (|Seq#Index| a_2 i_49@@2))
))) (=> (and (and (forall ((o_3@@15 T@U) ) (!  (=> (= (type o_3@@15) RefType) (and (=> (and (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U (invRecv13 o_3@@15))) (< NoPerm FullPerm)) (qpRange13 o_3@@15)) (and (=> (< NoPerm FullPerm) (= (|Seq#Index| a_2 (invRecv13 o_3@@15)) o_3@@15)) (= (U_2_real (MapType1Select QPMask@18 o_3@@15 Ref__Integer_value)) (+ (U_2_real (MapType1Select QPMask@5 o_3@@15 Ref__Integer_value)) FullPerm)))) (=> (not (and (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U (invRecv13 o_3@@15))) (< NoPerm FullPerm)) (qpRange13 o_3@@15))) (= (U_2_real (MapType1Select QPMask@18 o_3@@15 Ref__Integer_value)) (U_2_real (MapType1Select QPMask@5 o_3@@15 Ref__Integer_value))))))
 :qid |stdinbpl.1424:26|
 :skolemid |127|
 :pattern ( (MapType1Select QPMask@18 o_3@@15 Ref__Integer_value))
)) (forall ((o_3@@16 T@U) (f_5@@4 T@U) ) (! (let ((B@@16 (FieldTypeInv1 (type f_5@@4))))
(let ((A@@17 (FieldTypeInv0 (type f_5@@4))))
 (=> (and (and (= (type o_3@@16) RefType) (= (type f_5@@4) (FieldType A@@17 B@@16))) (not (= f_5@@4 Ref__Integer_value))) (= (U_2_real (MapType1Select QPMask@5 o_3@@16 f_5@@4)) (U_2_real (MapType1Select QPMask@18 o_3@@16 f_5@@4))))))
 :qid |stdinbpl.1428:33|
 :skolemid |128|
 :pattern ( (MapType1Select QPMask@5 o_3@@16 f_5@@4))
 :pattern ( (MapType1Select QPMask@18 o_3@@16 f_5@@4))
))) (and (state ExhaleHeap@0 QPMask@18) (state ExhaleHeap@0 QPMask@18))) (and (and (=> (= (ControlFlow 0 250) 248) anon205_Else_correct) (=> (= (ControlFlow 0 250) 197) anon206_Then_correct)) (=> (= (ControlFlow 0 250) 200) anon206_Else_correct)))))))))
(let ((anon74_correct true))
(let ((anon204_Else_correct  (=> (and (not (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U i_29))) (= (ControlFlow 0 195) 191)) anon74_correct)))
(let ((anon204_Then_correct  (=> (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U i_29)) (and (=> (= (ControlFlow 0 192) (- 0 194)) (>= i_29 0)) (=> (>= i_29 0) (and (=> (= (ControlFlow 0 192) (- 0 193)) (< i_29 (|Seq#Length| a_2))) (=> (< i_29 (|Seq#Length| a_2)) (=> (= (ControlFlow 0 192) 191) anon74_correct))))))))
(let ((anon202_Then_correct  (=> (and (<= 0 k@0) (state ExhaleHeap@0 QPMask@5)) (=> (and (and (and (= (mod k@0 2) 0) (state ExhaleHeap@0 QPMask@5)) (and (<= k@0 (|Seq#Length| res)) (state ExhaleHeap@0 QPMask@5))) (and (and (= (|Seq#Length| a_2) (|Seq#Length| b_2)) (state ExhaleHeap@0 QPMask@5)) (and (= (|Seq#Length| res) (* 2 (|Seq#Length| a_2))) (state ExhaleHeap@0 QPMask@5)))) (and (and (=> (= (ControlFlow 0 252) 250) anon203_Else_correct) (=> (= (ControlFlow 0 252) 192) anon204_Then_correct)) (=> (= (ControlFlow 0 252) 195) anon204_Else_correct))))))
(let ((anon116_correct true))
(let ((anon225_Else_correct  (=> (and (not (|Seq#Contains| (|Seq#Range| 0 (div __flatten_10@1 2)) (int_2_U i_78))) (= (ControlFlow 0 160) 157)) anon116_correct)))
(let ((anon225_Then_correct  (=> (|Seq#Contains| (|Seq#Range| 0 (div __flatten_10@1 2)) (int_2_U i_78)) (and (=> (= (ControlFlow 0 158) (- 0 159)) (= (U_2_int (MapType0Select Heap@1 (|Seq#Index| res (+ (* 2 i_78) 1)) Ref__Integer_value)) (U_2_int (MapType0Select Heap@1 (|Seq#Index| b_2 i_78) Ref__Integer_value)))) (=> (= (U_2_int (MapType0Select Heap@1 (|Seq#Index| res (+ (* 2 i_78) 1)) Ref__Integer_value)) (U_2_int (MapType0Select Heap@1 (|Seq#Index| b_2 i_78) Ref__Integer_value))) (=> (= (ControlFlow 0 158) 157) anon116_correct))))))
(let ((anon224_Else_correct true))
(let ((anon222_Else_correct  (=> (forall ((i_77_1 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 (div __flatten_10@1 2)) (int_2_U i_77_1)) (= (U_2_int (MapType0Select Heap@1 (|Seq#Index| res (* 2 i_77_1)) Ref__Integer_value)) (U_2_int (MapType0Select Heap@1 (|Seq#Index| a_2 i_77_1) Ref__Integer_value))))
 :qid |stdinbpl.2016:24|
 :skolemid |187|
 :pattern ( (|Seq#Index| a_2 i_77_1))
)) (and (and (=> (= (ControlFlow 0 161) 156) anon224_Else_correct) (=> (= (ControlFlow 0 161) 158) anon225_Then_correct)) (=> (= (ControlFlow 0 161) 160) anon225_Else_correct)))))
(let ((anon112_correct true))
(let ((anon223_Else_correct  (=> (and (not (|Seq#Contains| (|Seq#Range| 0 (div __flatten_10@1 2)) (int_2_U i_76))) (= (ControlFlow 0 155) 152)) anon112_correct)))
(let ((anon223_Then_correct  (=> (|Seq#Contains| (|Seq#Range| 0 (div __flatten_10@1 2)) (int_2_U i_76)) (and (=> (= (ControlFlow 0 153) (- 0 154)) (= (U_2_int (MapType0Select Heap@1 (|Seq#Index| res (* 2 i_76)) Ref__Integer_value)) (U_2_int (MapType0Select Heap@1 (|Seq#Index| a_2 i_76) Ref__Integer_value)))) (=> (= (U_2_int (MapType0Select Heap@1 (|Seq#Index| res (* 2 i_76)) Ref__Integer_value)) (U_2_int (MapType0Select Heap@1 (|Seq#Index| a_2 i_76) Ref__Integer_value))) (=> (= (ControlFlow 0 153) 152) anon112_correct))))))
(let ((anon220_Else_correct  (=> (forall ((i_75_1 Int) ) (!  (=> (and (<= 0 i_75_1) (and (= (mod i_75_1 2) 1) (< i_75_1 __flatten_10@1))) (= (U_2_int (MapType0Select Heap@1 (|Seq#Index| res i_75_1) Ref__Integer_value)) (U_2_int (MapType0Select Heap@1 (|Seq#Index| b_2 (div i_75_1 2)) Ref__Integer_value))))
 :qid |stdinbpl.2005:24|
 :skolemid |186|
 :pattern ( (|Seq#Index| res i_75_1))
)) (and (and (=> (= (ControlFlow 0 162) 161) anon222_Else_correct) (=> (= (ControlFlow 0 162) 153) anon223_Then_correct)) (=> (= (ControlFlow 0 162) 155) anon223_Else_correct)))))
(let ((anon108_correct true))
(let ((anon221_Else_correct  (=> (and (not (and (<= 0 i_74) (and (= (mod i_74 2) 1) (< i_74 __flatten_10@1)))) (= (ControlFlow 0 151) 148)) anon108_correct)))
(let ((anon221_Then_correct  (=> (and (<= 0 i_74) (and (= (mod i_74 2) 1) (< i_74 __flatten_10@1))) (and (=> (= (ControlFlow 0 149) (- 0 150)) (= (U_2_int (MapType0Select Heap@1 (|Seq#Index| res i_74) Ref__Integer_value)) (U_2_int (MapType0Select Heap@1 (|Seq#Index| b_2 (div i_74 2)) Ref__Integer_value)))) (=> (= (U_2_int (MapType0Select Heap@1 (|Seq#Index| res i_74) Ref__Integer_value)) (U_2_int (MapType0Select Heap@1 (|Seq#Index| b_2 (div i_74 2)) Ref__Integer_value))) (=> (= (ControlFlow 0 149) 148) anon108_correct))))))
(let ((anon218_Else_correct  (=> (forall ((i_73_1 Int) ) (!  (=> (and (<= 0 i_73_1) (and (= (mod i_73_1 2) 0) (< i_73_1 __flatten_10@1))) (= (U_2_int (MapType0Select Heap@1 (|Seq#Index| res i_73_1) Ref__Integer_value)) (U_2_int (MapType0Select Heap@1 (|Seq#Index| a_2 (div i_73_1 2)) Ref__Integer_value))))
 :qid |stdinbpl.1994:24|
 :skolemid |185|
 :pattern ( (|Seq#Index| res i_73_1))
)) (and (and (=> (= (ControlFlow 0 163) 162) anon220_Else_correct) (=> (= (ControlFlow 0 163) 149) anon221_Then_correct)) (=> (= (ControlFlow 0 163) 151) anon221_Else_correct)))))
(let ((anon104_correct true))
(let ((anon219_Else_correct  (=> (and (not (and (<= 0 i_72) (and (= (mod i_72 2) 0) (< i_72 __flatten_10@1)))) (= (ControlFlow 0 147) 144)) anon104_correct)))
(let ((anon219_Then_correct  (=> (and (<= 0 i_72) (and (= (mod i_72 2) 0) (< i_72 __flatten_10@1))) (and (=> (= (ControlFlow 0 145) (- 0 146)) (= (U_2_int (MapType0Select Heap@1 (|Seq#Index| res i_72) Ref__Integer_value)) (U_2_int (MapType0Select Heap@1 (|Seq#Index| a_2 (div i_72 2)) Ref__Integer_value)))) (=> (= (U_2_int (MapType0Select Heap@1 (|Seq#Index| res i_72) Ref__Integer_value)) (U_2_int (MapType0Select Heap@1 (|Seq#Index| a_2 (div i_72 2)) Ref__Integer_value))) (=> (= (ControlFlow 0 145) 144) anon104_correct))))))
(let ((anon217_Then_correct  (=> (and (state ExhaleHeap@0 ZeroMask) (<= 0 k@0)) (=> (and (and (= (mod k@0 2) 0) (<= k@0 (|Seq#Length| res))) (and (= (|Seq#Length| a_2) (|Seq#Length| b_2)) (= (|Seq#Length| res) (* 2 (|Seq#Length| a_2))))) (and (=> (= (ControlFlow 0 164) (- 0 190)) (forall ((i_62 Int) (i_62_1 Int) ) (!  (=> (and (and (and (and (not (= i_62 i_62_1)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U i_62))) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U i_62_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| a_2 i_62) (|Seq#Index| a_2 i_62_1))))
 :qid |stdinbpl.1641:19|
 :skolemid |145|
))) (=> (forall ((i_62@@0 Int) (i_62_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_62@@0 i_62_1@@0)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U i_62@@0))) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U i_62_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| a_2 i_62@@0) (|Seq#Index| a_2 i_62_1@@0))))
 :qid |stdinbpl.1641:19|
 :skolemid |145|
)) (=> (and (forall ((i_62@@1 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U i_62@@1)) (< NoPerm FullPerm)) (and (qpRange16 (|Seq#Index| a_2 i_62@@1)) (= (invRecv16 (|Seq#Index| a_2 i_62@@1)) i_62@@1)))
 :qid |stdinbpl.1647:26|
 :skolemid |146|
 :pattern ( (|Seq#Index| a_2 i_62@@1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U i_62@@1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U i_62@@1)))
 :pattern ( (|Seq#Index| a_2 i_62@@1))
)) (forall ((o_3@@17 T@U) ) (!  (=> (= (type o_3@@17) RefType) (=> (and (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U (invRecv16 o_3@@17))) (< NoPerm FullPerm)) (qpRange16 o_3@@17)) (= (|Seq#Index| a_2 (invRecv16 o_3@@17)) o_3@@17)))
 :qid |stdinbpl.1651:26|
 :skolemid |147|
 :pattern ( (invRecv16 o_3@@17))
))) (=> (and (and (forall ((i_62@@2 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U i_62@@2)) (not (= (|Seq#Index| a_2 i_62@@2) null)))
 :qid |stdinbpl.1657:26|
 :skolemid |148|
 :pattern ( (|Seq#Index| a_2 i_62@@2))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U i_62@@2)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U i_62@@2)))
 :pattern ( (|Seq#Index| a_2 i_62@@2))
)) (forall ((o_3@@18 T@U) ) (!  (=> (= (type o_3@@18) RefType) (and (=> (and (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U (invRecv16 o_3@@18))) (< NoPerm FullPerm)) (qpRange16 o_3@@18)) (and (=> (< NoPerm FullPerm) (= (|Seq#Index| a_2 (invRecv16 o_3@@18)) o_3@@18)) (= (U_2_real (MapType1Select QPMask@6 o_3@@18 Ref__Integer_value)) (+ (U_2_real (MapType1Select ZeroMask o_3@@18 Ref__Integer_value)) FullPerm)))) (=> (not (and (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U (invRecv16 o_3@@18))) (< NoPerm FullPerm)) (qpRange16 o_3@@18))) (= (U_2_real (MapType1Select QPMask@6 o_3@@18 Ref__Integer_value)) (U_2_real (MapType1Select ZeroMask o_3@@18 Ref__Integer_value))))))
 :qid |stdinbpl.1663:26|
 :skolemid |149|
 :pattern ( (MapType1Select QPMask@6 o_3@@18 Ref__Integer_value))
))) (and (forall ((o_3@@19 T@U) (f_5@@5 T@U) ) (! (let ((B@@17 (FieldTypeInv1 (type f_5@@5))))
(let ((A@@18 (FieldTypeInv0 (type f_5@@5))))
 (=> (and (and (= (type o_3@@19) RefType) (= (type f_5@@5) (FieldType A@@18 B@@17))) (not (= f_5@@5 Ref__Integer_value))) (= (U_2_real (MapType1Select ZeroMask o_3@@19 f_5@@5)) (U_2_real (MapType1Select QPMask@6 o_3@@19 f_5@@5))))))
 :qid |stdinbpl.1667:33|
 :skolemid |150|
 :pattern ( (MapType1Select ZeroMask o_3@@19 f_5@@5))
 :pattern ( (MapType1Select QPMask@6 o_3@@19 f_5@@5))
)) (state ExhaleHeap@0 QPMask@6))) (and (=> (= (ControlFlow 0 164) (- 0 189)) (forall ((i_63 Int) (i_63_1 Int) ) (!  (=> (and (and (and (and (not (= i_63 i_63_1)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U i_63))) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U i_63_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| b_2 i_63) (|Seq#Index| b_2 i_63_1))))
 :qid |stdinbpl.1675:19|
 :skolemid |151|
))) (=> (forall ((i_63@@0 Int) (i_63_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_63@@0 i_63_1@@0)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U i_63@@0))) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U i_63_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| b_2 i_63@@0) (|Seq#Index| b_2 i_63_1@@0))))
 :qid |stdinbpl.1675:19|
 :skolemid |151|
)) (=> (and (forall ((i_63@@1 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U i_63@@1)) (< NoPerm FullPerm)) (and (qpRange17 (|Seq#Index| b_2 i_63@@1)) (= (invRecv17 (|Seq#Index| b_2 i_63@@1)) i_63@@1)))
 :qid |stdinbpl.1681:26|
 :skolemid |152|
 :pattern ( (|Seq#Index| b_2 i_63@@1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U i_63@@1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U i_63@@1)))
 :pattern ( (|Seq#Index| b_2 i_63@@1))
)) (forall ((o_3@@20 T@U) ) (!  (=> (= (type o_3@@20) RefType) (=> (and (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U (invRecv17 o_3@@20))) (< NoPerm FullPerm)) (qpRange17 o_3@@20)) (= (|Seq#Index| b_2 (invRecv17 o_3@@20)) o_3@@20)))
 :qid |stdinbpl.1685:26|
 :skolemid |153|
 :pattern ( (invRecv17 o_3@@20))
))) (=> (and (and (forall ((i_63@@2 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U i_63@@2)) (not (= (|Seq#Index| b_2 i_63@@2) null)))
 :qid |stdinbpl.1691:26|
 :skolemid |154|
 :pattern ( (|Seq#Index| b_2 i_63@@2))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U i_63@@2)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U i_63@@2)))
 :pattern ( (|Seq#Index| b_2 i_63@@2))
)) (forall ((o_3@@21 T@U) ) (!  (=> (= (type o_3@@21) RefType) (and (=> (and (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U (invRecv17 o_3@@21))) (< NoPerm FullPerm)) (qpRange17 o_3@@21)) (and (=> (< NoPerm FullPerm) (= (|Seq#Index| b_2 (invRecv17 o_3@@21)) o_3@@21)) (= (U_2_real (MapType1Select QPMask@7 o_3@@21 Ref__Integer_value)) (+ (U_2_real (MapType1Select QPMask@6 o_3@@21 Ref__Integer_value)) FullPerm)))) (=> (not (and (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U (invRecv17 o_3@@21))) (< NoPerm FullPerm)) (qpRange17 o_3@@21))) (= (U_2_real (MapType1Select QPMask@7 o_3@@21 Ref__Integer_value)) (U_2_real (MapType1Select QPMask@6 o_3@@21 Ref__Integer_value))))))
 :qid |stdinbpl.1697:26|
 :skolemid |155|
 :pattern ( (MapType1Select QPMask@7 o_3@@21 Ref__Integer_value))
))) (and (forall ((o_3@@22 T@U) (f_5@@6 T@U) ) (! (let ((B@@18 (FieldTypeInv1 (type f_5@@6))))
(let ((A@@19 (FieldTypeInv0 (type f_5@@6))))
 (=> (and (and (= (type o_3@@22) RefType) (= (type f_5@@6) (FieldType A@@19 B@@18))) (not (= f_5@@6 Ref__Integer_value))) (= (U_2_real (MapType1Select QPMask@6 o_3@@22 f_5@@6)) (U_2_real (MapType1Select QPMask@7 o_3@@22 f_5@@6))))))
 :qid |stdinbpl.1701:33|
 :skolemid |156|
 :pattern ( (MapType1Select QPMask@6 o_3@@22 f_5@@6))
 :pattern ( (MapType1Select QPMask@7 o_3@@22 f_5@@6))
)) (state ExhaleHeap@0 QPMask@7))) (and (=> (= (ControlFlow 0 164) (- 0 188)) (forall ((i_64 Int) (i_64_1 Int) ) (!  (=> (and (and (and (and (not (= i_64 i_64_1)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U i_64))) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U i_64_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| res i_64) (|Seq#Index| res i_64_1))))
 :qid |stdinbpl.1709:19|
 :skolemid |157|
))) (=> (forall ((i_64@@0 Int) (i_64_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_64@@0 i_64_1@@0)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U i_64@@0))) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U i_64_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| res i_64@@0) (|Seq#Index| res i_64_1@@0))))
 :qid |stdinbpl.1709:19|
 :skolemid |157|
)) (=> (forall ((i_64@@1 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U i_64@@1)) (< NoPerm FullPerm)) (and (qpRange18 (|Seq#Index| res i_64@@1)) (= (invRecv18 (|Seq#Index| res i_64@@1)) i_64@@1)))
 :qid |stdinbpl.1715:26|
 :skolemid |158|
 :pattern ( (|Seq#Index| res i_64@@1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U i_64@@1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U i_64@@1)))
 :pattern ( (|Seq#Index| res i_64@@1))
)) (=> (and (and (forall ((o_3@@23 T@U) ) (!  (=> (= (type o_3@@23) RefType) (=> (and (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U (invRecv18 o_3@@23))) (< NoPerm FullPerm)) (qpRange18 o_3@@23)) (= (|Seq#Index| res (invRecv18 o_3@@23)) o_3@@23)))
 :qid |stdinbpl.1719:26|
 :skolemid |159|
 :pattern ( (invRecv18 o_3@@23))
)) (forall ((i_64@@2 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U i_64@@2)) (not (= (|Seq#Index| res i_64@@2) null)))
 :qid |stdinbpl.1725:26|
 :skolemid |160|
 :pattern ( (|Seq#Index| res i_64@@2))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U i_64@@2)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U i_64@@2)))
 :pattern ( (|Seq#Index| res i_64@@2))
))) (and (forall ((o_3@@24 T@U) ) (!  (=> (= (type o_3@@24) RefType) (and (=> (and (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U (invRecv18 o_3@@24))) (< NoPerm FullPerm)) (qpRange18 o_3@@24)) (and (=> (< NoPerm FullPerm) (= (|Seq#Index| res (invRecv18 o_3@@24)) o_3@@24)) (= (U_2_real (MapType1Select QPMask@8 o_3@@24 Ref__Integer_value)) (+ (U_2_real (MapType1Select QPMask@7 o_3@@24 Ref__Integer_value)) FullPerm)))) (=> (not (and (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U (invRecv18 o_3@@24))) (< NoPerm FullPerm)) (qpRange18 o_3@@24))) (= (U_2_real (MapType1Select QPMask@8 o_3@@24 Ref__Integer_value)) (U_2_real (MapType1Select QPMask@7 o_3@@24 Ref__Integer_value))))))
 :qid |stdinbpl.1731:26|
 :skolemid |161|
 :pattern ( (MapType1Select QPMask@8 o_3@@24 Ref__Integer_value))
)) (forall ((o_3@@25 T@U) (f_5@@7 T@U) ) (! (let ((B@@19 (FieldTypeInv1 (type f_5@@7))))
(let ((A@@20 (FieldTypeInv0 (type f_5@@7))))
 (=> (and (and (= (type o_3@@25) RefType) (= (type f_5@@7) (FieldType A@@20 B@@19))) (not (= f_5@@7 Ref__Integer_value))) (= (U_2_real (MapType1Select QPMask@7 o_3@@25 f_5@@7)) (U_2_real (MapType1Select QPMask@8 o_3@@25 f_5@@7))))))
 :qid |stdinbpl.1735:33|
 :skolemid |162|
 :pattern ( (MapType1Select QPMask@7 o_3@@25 f_5@@7))
 :pattern ( (MapType1Select QPMask@8 o_3@@25 f_5@@7))
)))) (=> (and (and (and (state ExhaleHeap@0 QPMask@8) (forall ((i_65 Int) ) (!  (=> (and (<= 0 i_65) (and (= (mod i_65 2) 0) (< i_65 k@0))) (= (U_2_int (MapType0Select ExhaleHeap@0 (|Seq#Index| res i_65) Ref__Integer_value)) (U_2_int (MapType0Select ExhaleHeap@0 (|Seq#Index| a_2 (div i_65 2)) Ref__Integer_value))))
 :qid |stdinbpl.1741:24|
 :skolemid |163|
 :pattern ( (|Seq#Index| res i_65))
))) (and (forall ((i_66 Int) ) (!  (=> (and (<= 0 i_66) (and (= (mod i_66 2) 1) (< i_66 k@0))) (= (U_2_int (MapType0Select ExhaleHeap@0 (|Seq#Index| res i_66) Ref__Integer_value)) (U_2_int (MapType0Select ExhaleHeap@0 (|Seq#Index| b_2 (div i_66 2)) Ref__Integer_value))))
 :qid |stdinbpl.1745:24|
 :skolemid |164|
 :pattern ( (|Seq#Index| res i_66))
)) (forall ((i_67 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 (div k@0 2)) (int_2_U i_67)) (= (U_2_int (MapType0Select ExhaleHeap@0 (|Seq#Index| res (* 2 i_67)) Ref__Integer_value)) (U_2_int (MapType0Select ExhaleHeap@0 (|Seq#Index| a_2 i_67) Ref__Integer_value))))
 :qid |stdinbpl.1749:24|
 :skolemid |165|
 :pattern ( (|Seq#Index| a_2 i_67))
)))) (and (and (forall ((i_68 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 (div k@0 2)) (int_2_U i_68)) (= (U_2_int (MapType0Select ExhaleHeap@0 (|Seq#Index| res (+ (* 2 i_68) 1)) Ref__Integer_value)) (U_2_int (MapType0Select ExhaleHeap@0 (|Seq#Index| b_2 i_68) Ref__Integer_value))))
 :qid |stdinbpl.1753:24|
 :skolemid |166|
 :pattern ( (|Seq#Index| b_2 i_68))
)) (state ExhaleHeap@0 QPMask@8)) (and (< k@0 (|Seq#Length| res)) (state ExhaleHeap@0 QPMask@8)))) (and (=> (= (ControlFlow 0 164) (- 0 187)) (>= (div k@0 2) 0)) (=> (>= (div k@0 2) 0) (and (=> (= (ControlFlow 0 164) (- 0 186)) (< (div k@0 2) (|Seq#Length| a_2))) (=> (< (div k@0 2) (|Seq#Length| a_2)) (=> (and (= __flatten_5@1 (|Seq#Index| a_2 (div k@0 2))) (state ExhaleHeap@0 QPMask@8)) (and (=> (= (ControlFlow 0 164) (- 0 185)) (HasDirectPerm QPMask@8 __flatten_5@1 Ref__Integer_value)) (=> (HasDirectPerm QPMask@8 __flatten_5@1 Ref__Integer_value) (=> (= __flatten_4@1 (U_2_int (MapType0Select ExhaleHeap@0 __flatten_5@1 Ref__Integer_value))) (=> (and (state ExhaleHeap@0 QPMask@8) (state ExhaleHeap@0 QPMask@8)) (and (=> (= (ControlFlow 0 164) (- 0 184)) (>= k@0 0)) (=> (>= k@0 0) (and (=> (= (ControlFlow 0 164) (- 0 183)) (< k@0 (|Seq#Length| res))) (=> (< k@0 (|Seq#Length| res)) (=> (and (= __flatten_6@1 (|Seq#Index| res k@0)) (state ExhaleHeap@0 QPMask@8)) (and (=> (= (ControlFlow 0 164) (- 0 182)) (= FullPerm (U_2_real (MapType1Select QPMask@8 __flatten_6@1 Ref__Integer_value)))) (=> (= FullPerm (U_2_real (MapType1Select QPMask@8 __flatten_6@1 Ref__Integer_value))) (=> (and (= Heap@0 (MapType0Store ExhaleHeap@0 __flatten_6@1 Ref__Integer_value (int_2_U __flatten_4@1))) (state Heap@0 QPMask@8)) (and (=> (= (ControlFlow 0 164) (- 0 181)) (>= (div k@0 2) 0)) (=> (>= (div k@0 2) 0) (and (=> (= (ControlFlow 0 164) (- 0 180)) (< (div k@0 2) (|Seq#Length| b_2))) (=> (< (div k@0 2) (|Seq#Length| b_2)) (=> (and (= __flatten_8@1 (|Seq#Index| b_2 (div k@0 2))) (state Heap@0 QPMask@8)) (and (=> (= (ControlFlow 0 164) (- 0 179)) (HasDirectPerm QPMask@8 __flatten_8@1 Ref__Integer_value)) (=> (HasDirectPerm QPMask@8 __flatten_8@1 Ref__Integer_value) (=> (= __flatten_7@1 (U_2_int (MapType0Select Heap@0 __flatten_8@1 Ref__Integer_value))) (=> (and (state Heap@0 QPMask@8) (state Heap@0 QPMask@8)) (and (=> (= (ControlFlow 0 164) (- 0 178)) (>= (+ k@0 1) 0)) (=> (>= (+ k@0 1) 0) (and (=> (= (ControlFlow 0 164) (- 0 177)) (< (+ k@0 1) (|Seq#Length| res))) (=> (< (+ k@0 1) (|Seq#Length| res)) (=> (and (= __flatten_9@1 (|Seq#Index| res (+ k@0 1))) (state Heap@0 QPMask@8)) (and (=> (= (ControlFlow 0 164) (- 0 176)) (= FullPerm (U_2_real (MapType1Select QPMask@8 __flatten_9@1 Ref__Integer_value)))) (=> (= FullPerm (U_2_real (MapType1Select QPMask@8 __flatten_9@1 Ref__Integer_value))) (=> (and (= Heap@1 (MapType0Store Heap@0 __flatten_9@1 Ref__Integer_value (int_2_U __flatten_7@1))) (state Heap@1 QPMask@8)) (=> (and (and (= __flatten_10@1 (+ k@0 2)) (state Heap@1 QPMask@8)) (and (state Heap@1 QPMask@8) (state Heap@1 QPMask@8))) (and (=> (= (ControlFlow 0 164) (- 0 175)) (<= 0 __flatten_10@1)) (=> (<= 0 __flatten_10@1) (and (=> (= (ControlFlow 0 164) (- 0 174)) (= (mod __flatten_10@1 2) 0)) (=> (= (mod __flatten_10@1 2) 0) (and (=> (= (ControlFlow 0 164) (- 0 173)) (<= __flatten_10@1 (|Seq#Length| res))) (=> (<= __flatten_10@1 (|Seq#Length| res)) (and (=> (= (ControlFlow 0 164) (- 0 172)) (= (|Seq#Length| a_2) (|Seq#Length| b_2))) (=> (= (|Seq#Length| a_2) (|Seq#Length| b_2)) (and (=> (= (ControlFlow 0 164) (- 0 171)) (= (|Seq#Length| res) (* 2 (|Seq#Length| a_2)))) (=> (= (|Seq#Length| res) (* 2 (|Seq#Length| a_2))) (and (=> (= (ControlFlow 0 164) (- 0 170)) (forall ((i_69 Int) (i_69_1 Int) ) (!  (=> (and (and (and (and (not (= i_69 i_69_1)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U i_69))) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U i_69_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| a_2 i_69) (|Seq#Index| a_2 i_69_1))))
 :qid |stdinbpl.1871:21|
 :skolemid |167|
 :pattern ( (neverTriggered19 i_69) (neverTriggered19 i_69_1))
))) (=> (forall ((i_69@@0 Int) (i_69_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_69@@0 i_69_1@@0)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U i_69@@0))) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U i_69_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| a_2 i_69@@0) (|Seq#Index| a_2 i_69_1@@0))))
 :qid |stdinbpl.1871:21|
 :skolemid |167|
 :pattern ( (neverTriggered19 i_69@@0) (neverTriggered19 i_69_1@@0))
)) (and (=> (= (ControlFlow 0 164) (- 0 169)) (forall ((i_69@@1 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U i_69@@1)) (>= (U_2_real (MapType1Select QPMask@8 (|Seq#Index| a_2 i_69@@1) Ref__Integer_value)) FullPerm))
 :qid |stdinbpl.1878:21|
 :skolemid |168|
 :pattern ( (|Seq#Index| a_2 i_69@@1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U i_69@@1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U i_69@@1)))
 :pattern ( (|Seq#Index| a_2 i_69@@1))
))) (=> (forall ((i_69@@2 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U i_69@@2)) (>= (U_2_real (MapType1Select QPMask@8 (|Seq#Index| a_2 i_69@@2) Ref__Integer_value)) FullPerm))
 :qid |stdinbpl.1878:21|
 :skolemid |168|
 :pattern ( (|Seq#Index| a_2 i_69@@2))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U i_69@@2)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U i_69@@2)))
 :pattern ( (|Seq#Index| a_2 i_69@@2))
)) (=> (and (and (forall ((i_69@@3 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U i_69@@3)) (< NoPerm FullPerm)) (and (qpRange19 (|Seq#Index| a_2 i_69@@3)) (= (invRecv19 (|Seq#Index| a_2 i_69@@3)) i_69@@3)))
 :qid |stdinbpl.1884:26|
 :skolemid |169|
 :pattern ( (|Seq#Index| a_2 i_69@@3))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U i_69@@3)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U i_69@@3)))
 :pattern ( (|Seq#Index| a_2 i_69@@3))
)) (forall ((o_3@@26 T@U) ) (!  (=> (= (type o_3@@26) RefType) (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U (invRecv19 o_3@@26))) (and (< NoPerm FullPerm) (qpRange19 o_3@@26))) (= (|Seq#Index| a_2 (invRecv19 o_3@@26)) o_3@@26)))
 :qid |stdinbpl.1888:26|
 :skolemid |170|
 :pattern ( (invRecv19 o_3@@26))
))) (and (forall ((o_3@@27 T@U) ) (!  (=> (= (type o_3@@27) RefType) (and (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U (invRecv19 o_3@@27))) (and (< NoPerm FullPerm) (qpRange19 o_3@@27))) (and (= (|Seq#Index| a_2 (invRecv19 o_3@@27)) o_3@@27) (= (U_2_real (MapType1Select QPMask@9 o_3@@27 Ref__Integer_value)) (- (U_2_real (MapType1Select QPMask@8 o_3@@27 Ref__Integer_value)) FullPerm)))) (=> (not (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U (invRecv19 o_3@@27))) (and (< NoPerm FullPerm) (qpRange19 o_3@@27)))) (= (U_2_real (MapType1Select QPMask@9 o_3@@27 Ref__Integer_value)) (U_2_real (MapType1Select QPMask@8 o_3@@27 Ref__Integer_value))))))
 :qid |stdinbpl.1894:26|
 :skolemid |171|
 :pattern ( (MapType1Select QPMask@9 o_3@@27 Ref__Integer_value))
)) (forall ((o_3@@28 T@U) (f_5@@8 T@U) ) (! (let ((B@@20 (FieldTypeInv1 (type f_5@@8))))
(let ((A@@21 (FieldTypeInv0 (type f_5@@8))))
 (=> (and (and (= (type o_3@@28) RefType) (= (type f_5@@8) (FieldType A@@21 B@@20))) (not (= f_5@@8 Ref__Integer_value))) (= (U_2_real (MapType1Select QPMask@8 o_3@@28 f_5@@8)) (U_2_real (MapType1Select QPMask@9 o_3@@28 f_5@@8))))))
 :qid |stdinbpl.1900:33|
 :skolemid |172|
 :pattern ( (MapType1Select QPMask@9 o_3@@28 f_5@@8))
)))) (and (=> (= (ControlFlow 0 164) (- 0 168)) (forall ((i_70 Int) (i_70_1 Int) ) (!  (=> (and (and (and (and (not (= i_70 i_70_1)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U i_70))) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U i_70_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| b_2 i_70) (|Seq#Index| b_2 i_70_1))))
 :qid |stdinbpl.1912:21|
 :skolemid |173|
 :pattern ( (neverTriggered20 i_70) (neverTriggered20 i_70_1))
))) (=> (forall ((i_70@@0 Int) (i_70_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_70@@0 i_70_1@@0)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U i_70@@0))) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U i_70_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| b_2 i_70@@0) (|Seq#Index| b_2 i_70_1@@0))))
 :qid |stdinbpl.1912:21|
 :skolemid |173|
 :pattern ( (neverTriggered20 i_70@@0) (neverTriggered20 i_70_1@@0))
)) (and (=> (= (ControlFlow 0 164) (- 0 167)) (forall ((i_70@@1 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U i_70@@1)) (>= (U_2_real (MapType1Select QPMask@9 (|Seq#Index| b_2 i_70@@1) Ref__Integer_value)) FullPerm))
 :qid |stdinbpl.1919:21|
 :skolemid |174|
 :pattern ( (|Seq#Index| b_2 i_70@@1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U i_70@@1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U i_70@@1)))
 :pattern ( (|Seq#Index| b_2 i_70@@1))
))) (=> (forall ((i_70@@2 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U i_70@@2)) (>= (U_2_real (MapType1Select QPMask@9 (|Seq#Index| b_2 i_70@@2) Ref__Integer_value)) FullPerm))
 :qid |stdinbpl.1919:21|
 :skolemid |174|
 :pattern ( (|Seq#Index| b_2 i_70@@2))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U i_70@@2)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U i_70@@2)))
 :pattern ( (|Seq#Index| b_2 i_70@@2))
)) (=> (and (and (forall ((i_70@@3 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U i_70@@3)) (< NoPerm FullPerm)) (and (qpRange20 (|Seq#Index| b_2 i_70@@3)) (= (invRecv20 (|Seq#Index| b_2 i_70@@3)) i_70@@3)))
 :qid |stdinbpl.1925:26|
 :skolemid |175|
 :pattern ( (|Seq#Index| b_2 i_70@@3))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U i_70@@3)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U i_70@@3)))
 :pattern ( (|Seq#Index| b_2 i_70@@3))
)) (forall ((o_3@@29 T@U) ) (!  (=> (= (type o_3@@29) RefType) (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U (invRecv20 o_3@@29))) (and (< NoPerm FullPerm) (qpRange20 o_3@@29))) (= (|Seq#Index| b_2 (invRecv20 o_3@@29)) o_3@@29)))
 :qid |stdinbpl.1929:26|
 :skolemid |176|
 :pattern ( (invRecv20 o_3@@29))
))) (and (forall ((o_3@@30 T@U) ) (!  (=> (= (type o_3@@30) RefType) (and (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U (invRecv20 o_3@@30))) (and (< NoPerm FullPerm) (qpRange20 o_3@@30))) (and (= (|Seq#Index| b_2 (invRecv20 o_3@@30)) o_3@@30) (= (U_2_real (MapType1Select QPMask@10 o_3@@30 Ref__Integer_value)) (- (U_2_real (MapType1Select QPMask@9 o_3@@30 Ref__Integer_value)) FullPerm)))) (=> (not (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U (invRecv20 o_3@@30))) (and (< NoPerm FullPerm) (qpRange20 o_3@@30)))) (= (U_2_real (MapType1Select QPMask@10 o_3@@30 Ref__Integer_value)) (U_2_real (MapType1Select QPMask@9 o_3@@30 Ref__Integer_value))))))
 :qid |stdinbpl.1935:26|
 :skolemid |177|
 :pattern ( (MapType1Select QPMask@10 o_3@@30 Ref__Integer_value))
)) (forall ((o_3@@31 T@U) (f_5@@9 T@U) ) (! (let ((B@@21 (FieldTypeInv1 (type f_5@@9))))
(let ((A@@22 (FieldTypeInv0 (type f_5@@9))))
 (=> (and (and (= (type o_3@@31) RefType) (= (type f_5@@9) (FieldType A@@22 B@@21))) (not (= f_5@@9 Ref__Integer_value))) (= (U_2_real (MapType1Select QPMask@9 o_3@@31 f_5@@9)) (U_2_real (MapType1Select QPMask@10 o_3@@31 f_5@@9))))))
 :qid |stdinbpl.1941:33|
 :skolemid |178|
 :pattern ( (MapType1Select QPMask@10 o_3@@31 f_5@@9))
)))) (and (=> (= (ControlFlow 0 164) (- 0 166)) (forall ((i_71 Int) (i_71_1 Int) ) (!  (=> (and (and (and (and (not (= i_71 i_71_1)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U i_71))) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U i_71_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| res i_71) (|Seq#Index| res i_71_1))))
 :qid |stdinbpl.1953:21|
 :skolemid |179|
 :pattern ( (neverTriggered21 i_71) (neverTriggered21 i_71_1))
))) (=> (forall ((i_71@@0 Int) (i_71_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_71@@0 i_71_1@@0)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U i_71@@0))) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U i_71_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| res i_71@@0) (|Seq#Index| res i_71_1@@0))))
 :qid |stdinbpl.1953:21|
 :skolemid |179|
 :pattern ( (neverTriggered21 i_71@@0) (neverTriggered21 i_71_1@@0))
)) (and (=> (= (ControlFlow 0 164) (- 0 165)) (forall ((i_71@@1 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U i_71@@1)) (>= (U_2_real (MapType1Select QPMask@10 (|Seq#Index| res i_71@@1) Ref__Integer_value)) FullPerm))
 :qid |stdinbpl.1960:21|
 :skolemid |180|
 :pattern ( (|Seq#Index| res i_71@@1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U i_71@@1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U i_71@@1)))
 :pattern ( (|Seq#Index| res i_71@@1))
))) (=> (forall ((i_71@@2 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U i_71@@2)) (>= (U_2_real (MapType1Select QPMask@10 (|Seq#Index| res i_71@@2) Ref__Integer_value)) FullPerm))
 :qid |stdinbpl.1960:21|
 :skolemid |180|
 :pattern ( (|Seq#Index| res i_71@@2))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U i_71@@2)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U i_71@@2)))
 :pattern ( (|Seq#Index| res i_71@@2))
)) (=> (and (and (forall ((i_71@@3 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U i_71@@3)) (< NoPerm FullPerm)) (and (qpRange21 (|Seq#Index| res i_71@@3)) (= (invRecv21 (|Seq#Index| res i_71@@3)) i_71@@3)))
 :qid |stdinbpl.1966:26|
 :skolemid |181|
 :pattern ( (|Seq#Index| res i_71@@3))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U i_71@@3)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U i_71@@3)))
 :pattern ( (|Seq#Index| res i_71@@3))
)) (forall ((o_3@@32 T@U) ) (!  (=> (= (type o_3@@32) RefType) (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U (invRecv21 o_3@@32))) (and (< NoPerm FullPerm) (qpRange21 o_3@@32))) (= (|Seq#Index| res (invRecv21 o_3@@32)) o_3@@32)))
 :qid |stdinbpl.1970:26|
 :skolemid |182|
 :pattern ( (invRecv21 o_3@@32))
))) (and (forall ((o_3@@33 T@U) ) (!  (=> (= (type o_3@@33) RefType) (and (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U (invRecv21 o_3@@33))) (and (< NoPerm FullPerm) (qpRange21 o_3@@33))) (and (= (|Seq#Index| res (invRecv21 o_3@@33)) o_3@@33) (= (U_2_real (MapType1Select QPMask@11 o_3@@33 Ref__Integer_value)) (- (U_2_real (MapType1Select QPMask@10 o_3@@33 Ref__Integer_value)) FullPerm)))) (=> (not (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U (invRecv21 o_3@@33))) (and (< NoPerm FullPerm) (qpRange21 o_3@@33)))) (= (U_2_real (MapType1Select QPMask@11 o_3@@33 Ref__Integer_value)) (U_2_real (MapType1Select QPMask@10 o_3@@33 Ref__Integer_value))))))
 :qid |stdinbpl.1976:26|
 :skolemid |183|
 :pattern ( (MapType1Select QPMask@11 o_3@@33 Ref__Integer_value))
)) (forall ((o_3@@34 T@U) (f_5@@10 T@U) ) (! (let ((B@@22 (FieldTypeInv1 (type f_5@@10))))
(let ((A@@23 (FieldTypeInv0 (type f_5@@10))))
 (=> (and (and (= (type o_3@@34) RefType) (= (type f_5@@10) (FieldType A@@23 B@@22))) (not (= f_5@@10 Ref__Integer_value))) (= (U_2_real (MapType1Select QPMask@10 o_3@@34 f_5@@10)) (U_2_real (MapType1Select QPMask@11 o_3@@34 f_5@@10))))))
 :qid |stdinbpl.1982:33|
 :skolemid |184|
 :pattern ( (MapType1Select QPMask@11 o_3@@34 f_5@@10))
)))) (and (and (=> (= (ControlFlow 0 164) 163) anon218_Else_correct) (=> (= (ControlFlow 0 164) 145) anon219_Then_correct)) (=> (= (ControlFlow 0 164) 147) anon219_Else_correct)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
(let ((anon165_correct true))
(let ((anon249_Else_correct  (=> (and (not (and (<= 0 i_35_1) (and (= (mod i_35_1 2) 0) (< i_35_1 (|Seq#Length| res))))) (= (ControlFlow 0 121) 118)) anon165_correct)))
(let ((anon249_Then_correct  (=> (and (<= 0 i_35_1) (and (= (mod i_35_1 2) 0) (< i_35_1 (|Seq#Length| res)))) (and (=> (= (ControlFlow 0 119) (- 0 120)) (= (U_2_int (MapType0Select ExhaleHeap@0 (|Seq#Index| res i_35_1) Ref__Integer_value)) (U_2_int (MapType0Select ExhaleHeap@0 (|Seq#Index| a_2 (div i_35_1 2)) Ref__Integer_value)))) (=> (= (U_2_int (MapType0Select ExhaleHeap@0 (|Seq#Index| res i_35_1) Ref__Integer_value)) (U_2_int (MapType0Select ExhaleHeap@0 (|Seq#Index| a_2 (div i_35_1 2)) Ref__Integer_value))) (=> (= (ControlFlow 0 119) 118) anon165_correct))))))
(let ((anon248_Else_correct true))
(let ((anon246_Else_correct  (=> (forall ((i_34_1 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U i_34_1)) (= (U_2_int (MapType0Select ExhaleHeap@0 (|Seq#Index| res (+ (* 2 i_34_1) 1)) Ref__Integer_value)) (U_2_int (MapType0Select ExhaleHeap@0 (|Seq#Index| b_2 i_34_1) Ref__Integer_value))))
 :qid |stdinbpl.2495:20|
 :skolemid |235|
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U i_34_1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U i_34_1)))
 :pattern ( (|Seq#Index| b_2 i_34_1))
)) (and (and (=> (= (ControlFlow 0 122) 117) anon248_Else_correct) (=> (= (ControlFlow 0 122) 119) anon249_Then_correct)) (=> (= (ControlFlow 0 122) 121) anon249_Else_correct)))))
(let ((anon161_correct true))
(let ((anon247_Else_correct  (=> (and (not (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U i_33_1))) (= (ControlFlow 0 116) 113)) anon161_correct)))
(let ((anon247_Then_correct  (=> (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U i_33_1)) (and (=> (= (ControlFlow 0 114) (- 0 115)) (= (U_2_int (MapType0Select ExhaleHeap@0 (|Seq#Index| res (+ (* 2 i_33_1) 1)) Ref__Integer_value)) (U_2_int (MapType0Select ExhaleHeap@0 (|Seq#Index| b_2 i_33_1) Ref__Integer_value)))) (=> (= (U_2_int (MapType0Select ExhaleHeap@0 (|Seq#Index| res (+ (* 2 i_33_1) 1)) Ref__Integer_value)) (U_2_int (MapType0Select ExhaleHeap@0 (|Seq#Index| b_2 i_33_1) Ref__Integer_value))) (=> (= (ControlFlow 0 114) 113) anon161_correct))))))
(let ((anon244_Else_correct  (=> (forall ((i_32_1 Int) ) (!  (=> (and (<= 0 i_32_1) (and (= (mod i_32_1 2) 1) (< i_32_1 (|Seq#Length| res)))) (= (U_2_int (MapType0Select ExhaleHeap@0 (|Seq#Index| res i_32_1) Ref__Integer_value)) (U_2_int (MapType0Select ExhaleHeap@0 (|Seq#Index| b_2 (div i_32_1 2)) Ref__Integer_value))))
 :qid |stdinbpl.2484:20|
 :skolemid |234|
 :pattern ( (|Seq#Index| res i_32_1))
)) (and (and (=> (= (ControlFlow 0 123) 122) anon246_Else_correct) (=> (= (ControlFlow 0 123) 114) anon247_Then_correct)) (=> (= (ControlFlow 0 123) 116) anon247_Else_correct)))))
(let ((anon157_correct true))
(let ((anon245_Else_correct  (=> (and (not (and (<= 0 i_31_1) (and (= (mod i_31_1 2) 1) (< i_31_1 (|Seq#Length| res))))) (= (ControlFlow 0 112) 109)) anon157_correct)))
(let ((anon245_Then_correct  (=> (and (<= 0 i_31_1) (and (= (mod i_31_1 2) 1) (< i_31_1 (|Seq#Length| res)))) (and (=> (= (ControlFlow 0 110) (- 0 111)) (= (U_2_int (MapType0Select ExhaleHeap@0 (|Seq#Index| res i_31_1) Ref__Integer_value)) (U_2_int (MapType0Select ExhaleHeap@0 (|Seq#Index| b_2 (div i_31_1 2)) Ref__Integer_value)))) (=> (= (U_2_int (MapType0Select ExhaleHeap@0 (|Seq#Index| res i_31_1) Ref__Integer_value)) (U_2_int (MapType0Select ExhaleHeap@0 (|Seq#Index| b_2 (div i_31_1 2)) Ref__Integer_value))) (=> (= (ControlFlow 0 110) 109) anon157_correct))))))
(let ((anon242_Else_correct  (=> (forall ((i_30_1 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U i_30_1)) (= (U_2_int (MapType0Select ExhaleHeap@0 (|Seq#Index| res (* 2 i_30_1)) Ref__Integer_value)) (U_2_int (MapType0Select ExhaleHeap@0 (|Seq#Index| a_2 i_30_1) Ref__Integer_value))))
 :qid |stdinbpl.2473:20|
 :skolemid |233|
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U i_30_1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U i_30_1)))
 :pattern ( (|Seq#Index| a_2 i_30_1))
)) (and (and (=> (= (ControlFlow 0 124) 123) anon244_Else_correct) (=> (= (ControlFlow 0 124) 110) anon245_Then_correct)) (=> (= (ControlFlow 0 124) 112) anon245_Else_correct)))))
(let ((anon153_correct true))
(let ((anon243_Else_correct  (=> (and (not (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U i_29_1))) (= (ControlFlow 0 108) 105)) anon153_correct)))
(let ((anon243_Then_correct  (=> (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U i_29_1)) (and (=> (= (ControlFlow 0 106) (- 0 107)) (= (U_2_int (MapType0Select ExhaleHeap@0 (|Seq#Index| res (* 2 i_29_1)) Ref__Integer_value)) (U_2_int (MapType0Select ExhaleHeap@0 (|Seq#Index| a_2 i_29_1) Ref__Integer_value)))) (=> (= (U_2_int (MapType0Select ExhaleHeap@0 (|Seq#Index| res (* 2 i_29_1)) Ref__Integer_value)) (U_2_int (MapType0Select ExhaleHeap@0 (|Seq#Index| a_2 i_29_1) Ref__Integer_value))) (=> (= (ControlFlow 0 106) 105) anon153_correct))))))
(let ((anon240_Else_correct  (=> (and (forall ((i_98_1 Int) ) (!  (=> (and (<= 0 i_98_1) (and (= (mod i_98_1 2) 0) (< i_98_1 (|Seq#Length| res)))) (= (U_2_int (MapType0Select ExhaleHeap@0 (|Seq#Index| res i_98_1) Ref__Integer_value)) (U_2_int (MapType0Select ExhaleHeap@0 (|Seq#Index| a_2 (div i_98_1 2)) Ref__Integer_value))))
 :qid |stdinbpl.2328:20|
 :skolemid |214|
 :pattern ( (|Seq#Index| res i_98_1))
)) (state ExhaleHeap@0 QPMask@14)) (and (=> (= (ControlFlow 0 125) (- 0 134)) (= (|Seq#Length| res) (* 2 (|Seq#Length| a_2)))) (=> (= (|Seq#Length| res) (* 2 (|Seq#Length| a_2))) (and (=> (= (ControlFlow 0 125) (- 0 133)) (= (|Seq#Length| a_2) (|Seq#Length| b_2))) (=> (= (|Seq#Length| a_2) (|Seq#Length| b_2)) (and (=> (= (ControlFlow 0 125) (- 0 132)) (= (|Seq#Length| res) (* 2 (|Seq#Length| b_2)))) (=> (= (|Seq#Length| res) (* 2 (|Seq#Length| b_2))) (and (=> (= (ControlFlow 0 125) (- 0 131)) (forall ((i_26 Int) (i_26_1 Int) ) (!  (=> (and (and (and (and (not (= i_26 i_26_1)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U i_26))) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U i_26_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| a_2 i_26) (|Seq#Index| a_2 i_26_1))))
 :qid |stdinbpl.2350:17|
 :skolemid |215|
 :pattern ( (neverTriggered7 i_26) (neverTriggered7 i_26_1))
))) (=> (forall ((i_26@@0 Int) (i_26_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_26@@0 i_26_1@@0)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U i_26@@0))) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U i_26_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| a_2 i_26@@0) (|Seq#Index| a_2 i_26_1@@0))))
 :qid |stdinbpl.2350:17|
 :skolemid |215|
 :pattern ( (neverTriggered7 i_26@@0) (neverTriggered7 i_26_1@@0))
)) (and (=> (= (ControlFlow 0 125) (- 0 130)) (forall ((i_26@@1 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U i_26@@1)) (>= (U_2_real (MapType1Select QPMask@14 (|Seq#Index| a_2 i_26@@1) Ref__Integer_value)) FullPerm))
 :qid |stdinbpl.2357:17|
 :skolemid |216|
 :pattern ( (|Seq#Index| a_2 i_26@@1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U i_26@@1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U i_26@@1)))
 :pattern ( (|Seq#Index| a_2 i_26@@1))
))) (=> (forall ((i_26@@2 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U i_26@@2)) (>= (U_2_real (MapType1Select QPMask@14 (|Seq#Index| a_2 i_26@@2) Ref__Integer_value)) FullPerm))
 :qid |stdinbpl.2357:17|
 :skolemid |216|
 :pattern ( (|Seq#Index| a_2 i_26@@2))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U i_26@@2)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U i_26@@2)))
 :pattern ( (|Seq#Index| a_2 i_26@@2))
)) (=> (and (and (forall ((i_26@@3 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U i_26@@3)) (< NoPerm FullPerm)) (and (qpRange7 (|Seq#Index| a_2 i_26@@3)) (= (invRecv7 (|Seq#Index| a_2 i_26@@3)) i_26@@3)))
 :qid |stdinbpl.2363:22|
 :skolemid |217|
 :pattern ( (|Seq#Index| a_2 i_26@@3))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U i_26@@3)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U i_26@@3)))
 :pattern ( (|Seq#Index| a_2 i_26@@3))
)) (forall ((o_3@@35 T@U) ) (!  (=> (= (type o_3@@35) RefType) (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U (invRecv7 o_3@@35))) (and (< NoPerm FullPerm) (qpRange7 o_3@@35))) (= (|Seq#Index| a_2 (invRecv7 o_3@@35)) o_3@@35)))
 :qid |stdinbpl.2367:22|
 :skolemid |218|
 :pattern ( (invRecv7 o_3@@35))
))) (and (forall ((o_3@@36 T@U) ) (!  (=> (= (type o_3@@36) RefType) (and (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U (invRecv7 o_3@@36))) (and (< NoPerm FullPerm) (qpRange7 o_3@@36))) (and (= (|Seq#Index| a_2 (invRecv7 o_3@@36)) o_3@@36) (= (U_2_real (MapType1Select QPMask@15 o_3@@36 Ref__Integer_value)) (- (U_2_real (MapType1Select QPMask@14 o_3@@36 Ref__Integer_value)) FullPerm)))) (=> (not (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U (invRecv7 o_3@@36))) (and (< NoPerm FullPerm) (qpRange7 o_3@@36)))) (= (U_2_real (MapType1Select QPMask@15 o_3@@36 Ref__Integer_value)) (U_2_real (MapType1Select QPMask@14 o_3@@36 Ref__Integer_value))))))
 :qid |stdinbpl.2373:22|
 :skolemid |219|
 :pattern ( (MapType1Select QPMask@15 o_3@@36 Ref__Integer_value))
)) (forall ((o_3@@37 T@U) (f_5@@11 T@U) ) (! (let ((B@@23 (FieldTypeInv1 (type f_5@@11))))
(let ((A@@24 (FieldTypeInv0 (type f_5@@11))))
 (=> (and (and (= (type o_3@@37) RefType) (= (type f_5@@11) (FieldType A@@24 B@@23))) (not (= f_5@@11 Ref__Integer_value))) (= (U_2_real (MapType1Select QPMask@14 o_3@@37 f_5@@11)) (U_2_real (MapType1Select QPMask@15 o_3@@37 f_5@@11))))))
 :qid |stdinbpl.2379:29|
 :skolemid |220|
 :pattern ( (MapType1Select QPMask@15 o_3@@37 f_5@@11))
)))) (and (=> (= (ControlFlow 0 125) (- 0 129)) (forall ((i_27 Int) (i_27_1 Int) ) (!  (=> (and (and (and (and (not (= i_27 i_27_1)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U i_27))) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U i_27_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| b_2 i_27) (|Seq#Index| b_2 i_27_1))))
 :qid |stdinbpl.2391:17|
 :skolemid |221|
 :pattern ( (neverTriggered8 i_27) (neverTriggered8 i_27_1))
))) (=> (forall ((i_27@@0 Int) (i_27_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_27@@0 i_27_1@@0)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U i_27@@0))) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U i_27_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| b_2 i_27@@0) (|Seq#Index| b_2 i_27_1@@0))))
 :qid |stdinbpl.2391:17|
 :skolemid |221|
 :pattern ( (neverTriggered8 i_27@@0) (neverTriggered8 i_27_1@@0))
)) (and (=> (= (ControlFlow 0 125) (- 0 128)) (forall ((i_27@@1 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U i_27@@1)) (>= (U_2_real (MapType1Select QPMask@15 (|Seq#Index| b_2 i_27@@1) Ref__Integer_value)) FullPerm))
 :qid |stdinbpl.2398:17|
 :skolemid |222|
 :pattern ( (|Seq#Index| b_2 i_27@@1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U i_27@@1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U i_27@@1)))
 :pattern ( (|Seq#Index| b_2 i_27@@1))
))) (=> (forall ((i_27@@2 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U i_27@@2)) (>= (U_2_real (MapType1Select QPMask@15 (|Seq#Index| b_2 i_27@@2) Ref__Integer_value)) FullPerm))
 :qid |stdinbpl.2398:17|
 :skolemid |222|
 :pattern ( (|Seq#Index| b_2 i_27@@2))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U i_27@@2)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U i_27@@2)))
 :pattern ( (|Seq#Index| b_2 i_27@@2))
)) (=> (and (and (forall ((i_27@@3 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U i_27@@3)) (< NoPerm FullPerm)) (and (qpRange8 (|Seq#Index| b_2 i_27@@3)) (= (invRecv8 (|Seq#Index| b_2 i_27@@3)) i_27@@3)))
 :qid |stdinbpl.2404:22|
 :skolemid |223|
 :pattern ( (|Seq#Index| b_2 i_27@@3))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U i_27@@3)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U i_27@@3)))
 :pattern ( (|Seq#Index| b_2 i_27@@3))
)) (forall ((o_3@@38 T@U) ) (!  (=> (= (type o_3@@38) RefType) (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U (invRecv8 o_3@@38))) (and (< NoPerm FullPerm) (qpRange8 o_3@@38))) (= (|Seq#Index| b_2 (invRecv8 o_3@@38)) o_3@@38)))
 :qid |stdinbpl.2408:22|
 :skolemid |224|
 :pattern ( (invRecv8 o_3@@38))
))) (and (forall ((o_3@@39 T@U) ) (!  (=> (= (type o_3@@39) RefType) (and (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U (invRecv8 o_3@@39))) (and (< NoPerm FullPerm) (qpRange8 o_3@@39))) (and (= (|Seq#Index| b_2 (invRecv8 o_3@@39)) o_3@@39) (= (U_2_real (MapType1Select QPMask@16 o_3@@39 Ref__Integer_value)) (- (U_2_real (MapType1Select QPMask@15 o_3@@39 Ref__Integer_value)) FullPerm)))) (=> (not (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U (invRecv8 o_3@@39))) (and (< NoPerm FullPerm) (qpRange8 o_3@@39)))) (= (U_2_real (MapType1Select QPMask@16 o_3@@39 Ref__Integer_value)) (U_2_real (MapType1Select QPMask@15 o_3@@39 Ref__Integer_value))))))
 :qid |stdinbpl.2414:22|
 :skolemid |225|
 :pattern ( (MapType1Select QPMask@16 o_3@@39 Ref__Integer_value))
)) (forall ((o_3@@40 T@U) (f_5@@12 T@U) ) (! (let ((B@@24 (FieldTypeInv1 (type f_5@@12))))
(let ((A@@25 (FieldTypeInv0 (type f_5@@12))))
 (=> (and (and (= (type o_3@@40) RefType) (= (type f_5@@12) (FieldType A@@25 B@@24))) (not (= f_5@@12 Ref__Integer_value))) (= (U_2_real (MapType1Select QPMask@15 o_3@@40 f_5@@12)) (U_2_real (MapType1Select QPMask@16 o_3@@40 f_5@@12))))))
 :qid |stdinbpl.2420:29|
 :skolemid |226|
 :pattern ( (MapType1Select QPMask@16 o_3@@40 f_5@@12))
)))) (and (=> (= (ControlFlow 0 125) (- 0 127)) (forall ((i_28 Int) (i_28_1 Int) ) (!  (=> (and (and (and (and (not (= i_28 i_28_1)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U i_28))) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U i_28_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| res i_28) (|Seq#Index| res i_28_1))))
 :qid |stdinbpl.2432:17|
 :skolemid |227|
 :pattern ( (neverTriggered9 i_28) (neverTriggered9 i_28_1))
))) (=> (forall ((i_28@@0 Int) (i_28_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_28@@0 i_28_1@@0)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U i_28@@0))) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U i_28_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| res i_28@@0) (|Seq#Index| res i_28_1@@0))))
 :qid |stdinbpl.2432:17|
 :skolemid |227|
 :pattern ( (neverTriggered9 i_28@@0) (neverTriggered9 i_28_1@@0))
)) (and (=> (= (ControlFlow 0 125) (- 0 126)) (forall ((i_28@@1 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U i_28@@1)) (>= (U_2_real (MapType1Select QPMask@16 (|Seq#Index| res i_28@@1) Ref__Integer_value)) FullPerm))
 :qid |stdinbpl.2439:17|
 :skolemid |228|
 :pattern ( (|Seq#Index| res i_28@@1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U i_28@@1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U i_28@@1)))
 :pattern ( (|Seq#Index| res i_28@@1))
))) (=> (forall ((i_28@@2 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U i_28@@2)) (>= (U_2_real (MapType1Select QPMask@16 (|Seq#Index| res i_28@@2) Ref__Integer_value)) FullPerm))
 :qid |stdinbpl.2439:17|
 :skolemid |228|
 :pattern ( (|Seq#Index| res i_28@@2))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U i_28@@2)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U i_28@@2)))
 :pattern ( (|Seq#Index| res i_28@@2))
)) (=> (and (and (forall ((i_28@@3 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U i_28@@3)) (< NoPerm FullPerm)) (and (qpRange9 (|Seq#Index| res i_28@@3)) (= (invRecv9 (|Seq#Index| res i_28@@3)) i_28@@3)))
 :qid |stdinbpl.2445:22|
 :skolemid |229|
 :pattern ( (|Seq#Index| res i_28@@3))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U i_28@@3)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U i_28@@3)))
 :pattern ( (|Seq#Index| res i_28@@3))
)) (forall ((o_3@@41 T@U) ) (!  (=> (= (type o_3@@41) RefType) (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U (invRecv9 o_3@@41))) (and (< NoPerm FullPerm) (qpRange9 o_3@@41))) (= (|Seq#Index| res (invRecv9 o_3@@41)) o_3@@41)))
 :qid |stdinbpl.2449:22|
 :skolemid |230|
 :pattern ( (invRecv9 o_3@@41))
))) (and (forall ((o_3@@42 T@U) ) (!  (=> (= (type o_3@@42) RefType) (and (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U (invRecv9 o_3@@42))) (and (< NoPerm FullPerm) (qpRange9 o_3@@42))) (and (= (|Seq#Index| res (invRecv9 o_3@@42)) o_3@@42) (= (U_2_real (MapType1Select QPMask@17 o_3@@42 Ref__Integer_value)) (- (U_2_real (MapType1Select QPMask@16 o_3@@42 Ref__Integer_value)) FullPerm)))) (=> (not (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U (invRecv9 o_3@@42))) (and (< NoPerm FullPerm) (qpRange9 o_3@@42)))) (= (U_2_real (MapType1Select QPMask@17 o_3@@42 Ref__Integer_value)) (U_2_real (MapType1Select QPMask@16 o_3@@42 Ref__Integer_value))))))
 :qid |stdinbpl.2455:22|
 :skolemid |231|
 :pattern ( (MapType1Select QPMask@17 o_3@@42 Ref__Integer_value))
)) (forall ((o_3@@43 T@U) (f_5@@13 T@U) ) (! (let ((B@@25 (FieldTypeInv1 (type f_5@@13))))
(let ((A@@26 (FieldTypeInv0 (type f_5@@13))))
 (=> (and (and (= (type o_3@@43) RefType) (= (type f_5@@13) (FieldType A@@26 B@@25))) (not (= f_5@@13 Ref__Integer_value))) (= (U_2_real (MapType1Select QPMask@16 o_3@@43 f_5@@13)) (U_2_real (MapType1Select QPMask@17 o_3@@43 f_5@@13))))))
 :qid |stdinbpl.2461:29|
 :skolemid |232|
 :pattern ( (MapType1Select QPMask@17 o_3@@43 f_5@@13))
)))) (and (and (=> (= (ControlFlow 0 125) 124) anon242_Else_correct) (=> (= (ControlFlow 0 125) 106) anon243_Then_correct)) (=> (= (ControlFlow 0 125) 108) anon243_Else_correct))))))))))))))))))))))))))
(let ((anon149_correct true))
(let ((anon241_Else_correct  (=> (and (not (and (<= 0 i_97) (and (= (mod i_97 2) 0) (< i_97 (|Seq#Length| res))))) (= (ControlFlow 0 104) 101)) anon149_correct)))
(let ((anon241_Then_correct  (=> (and (<= 0 i_97) (and (= (mod i_97 2) 0) (< i_97 (|Seq#Length| res)))) (and (=> (= (ControlFlow 0 102) (- 0 103)) (= (U_2_int (MapType0Select ExhaleHeap@0 (|Seq#Index| res i_97) Ref__Integer_value)) (U_2_int (MapType0Select ExhaleHeap@0 (|Seq#Index| a_2 (div i_97 2)) Ref__Integer_value)))) (=> (= (U_2_int (MapType0Select ExhaleHeap@0 (|Seq#Index| res i_97) Ref__Integer_value)) (U_2_int (MapType0Select ExhaleHeap@0 (|Seq#Index| a_2 (div i_97 2)) Ref__Integer_value))) (=> (= (ControlFlow 0 102) 101) anon149_correct))))))
(let ((anon145_correct true))
(let ((anon239_Else_correct  (=> (and (not (and (<= 0 i_45) (and (= (mod i_45 2) 0) (< i_45 (|Seq#Length| res))))) (= (ControlFlow 0 100) 92)) anon145_correct)))
(let ((anon239_Then_correct  (=> (and (<= 0 i_45) (and (= (mod i_45 2) 0) (< i_45 (|Seq#Length| res)))) (and (=> (= (ControlFlow 0 93) (- 0 99)) (>= i_45 0)) (=> (>= i_45 0) (and (=> (= (ControlFlow 0 93) (- 0 98)) (< i_45 (|Seq#Length| res))) (=> (< i_45 (|Seq#Length| res)) (and (=> (= (ControlFlow 0 93) (- 0 97)) (HasDirectPerm QPMask@14 (|Seq#Index| res i_45) Ref__Integer_value)) (=> (HasDirectPerm QPMask@14 (|Seq#Index| res i_45) Ref__Integer_value) (and (=> (= (ControlFlow 0 93) (- 0 96)) (>= (div i_45 2) 0)) (=> (>= (div i_45 2) 0) (and (=> (= (ControlFlow 0 93) (- 0 95)) (< (div i_45 2) (|Seq#Length| a_2))) (=> (< (div i_45 2) (|Seq#Length| a_2)) (and (=> (= (ControlFlow 0 93) (- 0 94)) (HasDirectPerm QPMask@14 (|Seq#Index| a_2 (div i_45 2)) Ref__Integer_value)) (=> (HasDirectPerm QPMask@14 (|Seq#Index| a_2 (div i_45 2)) Ref__Integer_value) (=> (= (ControlFlow 0 93) 92) anon145_correct))))))))))))))))
(let ((anon236_Else_correct  (=> (and (forall ((i_95_1 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 (div (|Seq#Length| res) 2)) (int_2_U i_95_1)) (= (U_2_int (MapType0Select ExhaleHeap@0 (|Seq#Index| res (+ (* 2 i_95_1) 1)) Ref__Integer_value)) (U_2_int (MapType0Select ExhaleHeap@0 (|Seq#Index| b_2 i_95_1) Ref__Integer_value))))
 :qid |stdinbpl.2290:20|
 :skolemid |213|
 :pattern ( (|Seq#Index| b_2 i_95_1))
)) (state ExhaleHeap@0 QPMask@14)) (and (and (and (and (=> (= (ControlFlow 0 135) 125) anon240_Else_correct) (=> (= (ControlFlow 0 135) 102) anon241_Then_correct)) (=> (= (ControlFlow 0 135) 104) anon241_Else_correct)) (=> (= (ControlFlow 0 135) 93) anon239_Then_correct)) (=> (= (ControlFlow 0 135) 100) anon239_Else_correct)))))
(let ((anon141_correct true))
(let ((anon237_Else_correct  (=> (and (not (|Seq#Contains| (|Seq#Range| 0 (div (|Seq#Length| res) 2)) (int_2_U i_94))) (= (ControlFlow 0 91) 88)) anon141_correct)))
(let ((anon237_Then_correct  (=> (|Seq#Contains| (|Seq#Range| 0 (div (|Seq#Length| res) 2)) (int_2_U i_94)) (and (=> (= (ControlFlow 0 89) (- 0 90)) (= (U_2_int (MapType0Select ExhaleHeap@0 (|Seq#Index| res (+ (* 2 i_94) 1)) Ref__Integer_value)) (U_2_int (MapType0Select ExhaleHeap@0 (|Seq#Index| b_2 i_94) Ref__Integer_value)))) (=> (= (U_2_int (MapType0Select ExhaleHeap@0 (|Seq#Index| res (+ (* 2 i_94) 1)) Ref__Integer_value)) (U_2_int (MapType0Select ExhaleHeap@0 (|Seq#Index| b_2 i_94) Ref__Integer_value))) (=> (= (ControlFlow 0 89) 88) anon141_correct))))))
(let ((anon137_correct true))
(let ((anon235_Else_correct  (=> (and (not (|Seq#Contains| (|Seq#Range| 0 (div (|Seq#Length| res) 2)) (int_2_U i_43))) (= (ControlFlow 0 87) 79)) anon137_correct)))
(let ((anon235_Then_correct  (=> (|Seq#Contains| (|Seq#Range| 0 (div (|Seq#Length| res) 2)) (int_2_U i_43)) (and (=> (= (ControlFlow 0 80) (- 0 86)) (>= (+ (* 2 i_43) 1) 0)) (=> (>= (+ (* 2 i_43) 1) 0) (and (=> (= (ControlFlow 0 80) (- 0 85)) (< (+ (* 2 i_43) 1) (|Seq#Length| res))) (=> (< (+ (* 2 i_43) 1) (|Seq#Length| res)) (and (=> (= (ControlFlow 0 80) (- 0 84)) (HasDirectPerm QPMask@14 (|Seq#Index| res (+ (* 2 i_43) 1)) Ref__Integer_value)) (=> (HasDirectPerm QPMask@14 (|Seq#Index| res (+ (* 2 i_43) 1)) Ref__Integer_value) (and (=> (= (ControlFlow 0 80) (- 0 83)) (>= i_43 0)) (=> (>= i_43 0) (and (=> (= (ControlFlow 0 80) (- 0 82)) (< i_43 (|Seq#Length| b_2))) (=> (< i_43 (|Seq#Length| b_2)) (and (=> (= (ControlFlow 0 80) (- 0 81)) (HasDirectPerm QPMask@14 (|Seq#Index| b_2 i_43) Ref__Integer_value)) (=> (HasDirectPerm QPMask@14 (|Seq#Index| b_2 i_43) Ref__Integer_value) (=> (= (ControlFlow 0 80) 79) anon137_correct))))))))))))))))
(let ((anon232_Else_correct  (=> (and (forall ((i_92_1 Int) ) (!  (=> (and (<= 0 i_92_1) (and (= (mod i_92_1 2) 1) (< i_92_1 (|Seq#Length| res)))) (= (U_2_int (MapType0Select ExhaleHeap@0 (|Seq#Index| res i_92_1) Ref__Integer_value)) (U_2_int (MapType0Select ExhaleHeap@0 (|Seq#Index| b_2 (div i_92_1 2)) Ref__Integer_value))))
 :qid |stdinbpl.2252:20|
 :skolemid |212|
 :pattern ( (|Seq#Index| res i_92_1))
)) (state ExhaleHeap@0 QPMask@14)) (and (and (and (and (=> (= (ControlFlow 0 136) 135) anon236_Else_correct) (=> (= (ControlFlow 0 136) 89) anon237_Then_correct)) (=> (= (ControlFlow 0 136) 91) anon237_Else_correct)) (=> (= (ControlFlow 0 136) 80) anon235_Then_correct)) (=> (= (ControlFlow 0 136) 87) anon235_Else_correct)))))
(let ((anon133_correct true))
(let ((anon233_Else_correct  (=> (and (not (and (<= 0 i_91) (and (= (mod i_91 2) 1) (< i_91 (|Seq#Length| res))))) (= (ControlFlow 0 78) 75)) anon133_correct)))
(let ((anon233_Then_correct  (=> (and (<= 0 i_91) (and (= (mod i_91 2) 1) (< i_91 (|Seq#Length| res)))) (and (=> (= (ControlFlow 0 76) (- 0 77)) (= (U_2_int (MapType0Select ExhaleHeap@0 (|Seq#Index| res i_91) Ref__Integer_value)) (U_2_int (MapType0Select ExhaleHeap@0 (|Seq#Index| b_2 (div i_91 2)) Ref__Integer_value)))) (=> (= (U_2_int (MapType0Select ExhaleHeap@0 (|Seq#Index| res i_91) Ref__Integer_value)) (U_2_int (MapType0Select ExhaleHeap@0 (|Seq#Index| b_2 (div i_91 2)) Ref__Integer_value))) (=> (= (ControlFlow 0 76) 75) anon133_correct))))))
(let ((anon129_correct true))
(let ((anon231_Else_correct  (=> (and (not (and (<= 0 i_41) (and (= (mod i_41 2) 1) (< i_41 (|Seq#Length| res))))) (= (ControlFlow 0 74) 66)) anon129_correct)))
(let ((anon231_Then_correct  (=> (and (<= 0 i_41) (and (= (mod i_41 2) 1) (< i_41 (|Seq#Length| res)))) (and (=> (= (ControlFlow 0 67) (- 0 73)) (>= i_41 0)) (=> (>= i_41 0) (and (=> (= (ControlFlow 0 67) (- 0 72)) (< i_41 (|Seq#Length| res))) (=> (< i_41 (|Seq#Length| res)) (and (=> (= (ControlFlow 0 67) (- 0 71)) (HasDirectPerm QPMask@14 (|Seq#Index| res i_41) Ref__Integer_value)) (=> (HasDirectPerm QPMask@14 (|Seq#Index| res i_41) Ref__Integer_value) (and (=> (= (ControlFlow 0 67) (- 0 70)) (>= (div i_41 2) 0)) (=> (>= (div i_41 2) 0) (and (=> (= (ControlFlow 0 67) (- 0 69)) (< (div i_41 2) (|Seq#Length| b_2))) (=> (< (div i_41 2) (|Seq#Length| b_2)) (and (=> (= (ControlFlow 0 67) (- 0 68)) (HasDirectPerm QPMask@14 (|Seq#Index| b_2 (div i_41 2)) Ref__Integer_value)) (=> (HasDirectPerm QPMask@14 (|Seq#Index| b_2 (div i_41 2)) Ref__Integer_value) (=> (= (ControlFlow 0 67) 66) anon129_correct))))))))))))))))
(let ((anon228_Else_correct  (=> (and (forall ((i_89_1 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 (div (|Seq#Length| res) 2)) (int_2_U i_89_1)) (= (U_2_int (MapType0Select ExhaleHeap@0 (|Seq#Index| res (* 2 i_89_1)) Ref__Integer_value)) (U_2_int (MapType0Select ExhaleHeap@0 (|Seq#Index| a_2 i_89_1) Ref__Integer_value))))
 :qid |stdinbpl.2214:20|
 :skolemid |211|
 :pattern ( (|Seq#Index| a_2 i_89_1))
)) (state ExhaleHeap@0 QPMask@14)) (and (and (and (and (=> (= (ControlFlow 0 137) 136) anon232_Else_correct) (=> (= (ControlFlow 0 137) 76) anon233_Then_correct)) (=> (= (ControlFlow 0 137) 78) anon233_Else_correct)) (=> (= (ControlFlow 0 137) 67) anon231_Then_correct)) (=> (= (ControlFlow 0 137) 74) anon231_Else_correct)))))
(let ((anon125_correct true))
(let ((anon229_Else_correct  (=> (and (not (|Seq#Contains| (|Seq#Range| 0 (div (|Seq#Length| res) 2)) (int_2_U i_88))) (= (ControlFlow 0 65) 62)) anon125_correct)))
(let ((anon229_Then_correct  (=> (|Seq#Contains| (|Seq#Range| 0 (div (|Seq#Length| res) 2)) (int_2_U i_88)) (and (=> (= (ControlFlow 0 63) (- 0 64)) (= (U_2_int (MapType0Select ExhaleHeap@0 (|Seq#Index| res (* 2 i_88)) Ref__Integer_value)) (U_2_int (MapType0Select ExhaleHeap@0 (|Seq#Index| a_2 i_88) Ref__Integer_value)))) (=> (= (U_2_int (MapType0Select ExhaleHeap@0 (|Seq#Index| res (* 2 i_88)) Ref__Integer_value)) (U_2_int (MapType0Select ExhaleHeap@0 (|Seq#Index| a_2 i_88) Ref__Integer_value))) (=> (= (ControlFlow 0 63) 62) anon125_correct))))))
(let ((anon121_correct true))
(let ((anon227_Else_correct  (=> (and (not (|Seq#Contains| (|Seq#Range| 0 (div (|Seq#Length| res) 2)) (int_2_U i_36))) (= (ControlFlow 0 61) 53)) anon121_correct)))
(let ((anon227_Then_correct  (=> (|Seq#Contains| (|Seq#Range| 0 (div (|Seq#Length| res) 2)) (int_2_U i_36)) (and (=> (= (ControlFlow 0 54) (- 0 60)) (>= (* 2 i_36) 0)) (=> (>= (* 2 i_36) 0) (and (=> (= (ControlFlow 0 54) (- 0 59)) (< (* 2 i_36) (|Seq#Length| res))) (=> (< (* 2 i_36) (|Seq#Length| res)) (and (=> (= (ControlFlow 0 54) (- 0 58)) (HasDirectPerm QPMask@14 (|Seq#Index| res (* 2 i_36)) Ref__Integer_value)) (=> (HasDirectPerm QPMask@14 (|Seq#Index| res (* 2 i_36)) Ref__Integer_value) (and (=> (= (ControlFlow 0 54) (- 0 57)) (>= i_36 0)) (=> (>= i_36 0) (and (=> (= (ControlFlow 0 54) (- 0 56)) (< i_36 (|Seq#Length| a_2))) (=> (< i_36 (|Seq#Length| a_2)) (and (=> (= (ControlFlow 0 54) (- 0 55)) (HasDirectPerm QPMask@14 (|Seq#Index| a_2 i_36) Ref__Integer_value)) (=> (HasDirectPerm QPMask@14 (|Seq#Index| a_2 i_36) Ref__Integer_value) (=> (= (ControlFlow 0 54) 53) anon121_correct))))))))))))))))
(let ((anon217_Else_correct  (=> (not (< k@0 (|Seq#Length| res))) (=> (and (state ExhaleHeap@0 QPMask@5) (<= 0 k@0)) (=> (and (and (= (mod k@0 2) 0) (<= k@0 (|Seq#Length| res))) (and (= (|Seq#Length| a_2) (|Seq#Length| b_2)) (= (|Seq#Length| res) (* 2 (|Seq#Length| a_2))))) (and (=> (= (ControlFlow 0 138) (- 0 143)) (forall ((i_80 Int) (i_80_1 Int) ) (!  (=> (and (and (and (and (not (= i_80 i_80_1)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U i_80))) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U i_80_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| a_2 i_80) (|Seq#Index| a_2 i_80_1))))
 :qid |stdinbpl.2049:17|
 :skolemid |189|
))) (=> (forall ((i_80@@0 Int) (i_80_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_80@@0 i_80_1@@0)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U i_80@@0))) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U i_80_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| a_2 i_80@@0) (|Seq#Index| a_2 i_80_1@@0))))
 :qid |stdinbpl.2049:17|
 :skolemid |189|
)) (=> (and (forall ((i_80@@1 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U i_80@@1)) (< NoPerm FullPerm)) (and (qpRange22 (|Seq#Index| a_2 i_80@@1)) (= (invRecv22 (|Seq#Index| a_2 i_80@@1)) i_80@@1)))
 :qid |stdinbpl.2055:24|
 :skolemid |190|
 :pattern ( (|Seq#Index| a_2 i_80@@1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U i_80@@1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U i_80@@1)))
 :pattern ( (|Seq#Index| a_2 i_80@@1))
)) (forall ((o_3@@44 T@U) ) (!  (=> (= (type o_3@@44) RefType) (=> (and (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U (invRecv22 o_3@@44))) (< NoPerm FullPerm)) (qpRange22 o_3@@44)) (= (|Seq#Index| a_2 (invRecv22 o_3@@44)) o_3@@44)))
 :qid |stdinbpl.2059:24|
 :skolemid |191|
 :pattern ( (invRecv22 o_3@@44))
))) (=> (and (and (forall ((i_80@@2 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U i_80@@2)) (not (= (|Seq#Index| a_2 i_80@@2) null)))
 :qid |stdinbpl.2065:24|
 :skolemid |192|
 :pattern ( (|Seq#Index| a_2 i_80@@2))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U i_80@@2)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U i_80@@2)))
 :pattern ( (|Seq#Index| a_2 i_80@@2))
)) (forall ((o_3@@45 T@U) ) (!  (=> (= (type o_3@@45) RefType) (and (=> (and (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U (invRecv22 o_3@@45))) (< NoPerm FullPerm)) (qpRange22 o_3@@45)) (and (=> (< NoPerm FullPerm) (= (|Seq#Index| a_2 (invRecv22 o_3@@45)) o_3@@45)) (= (U_2_real (MapType1Select QPMask@12 o_3@@45 Ref__Integer_value)) (+ (U_2_real (MapType1Select QPMask@5 o_3@@45 Ref__Integer_value)) FullPerm)))) (=> (not (and (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U (invRecv22 o_3@@45))) (< NoPerm FullPerm)) (qpRange22 o_3@@45))) (= (U_2_real (MapType1Select QPMask@12 o_3@@45 Ref__Integer_value)) (U_2_real (MapType1Select QPMask@5 o_3@@45 Ref__Integer_value))))))
 :qid |stdinbpl.2071:24|
 :skolemid |193|
 :pattern ( (MapType1Select QPMask@12 o_3@@45 Ref__Integer_value))
))) (and (forall ((o_3@@46 T@U) (f_5@@14 T@U) ) (! (let ((B@@26 (FieldTypeInv1 (type f_5@@14))))
(let ((A@@27 (FieldTypeInv0 (type f_5@@14))))
 (=> (and (and (= (type o_3@@46) RefType) (= (type f_5@@14) (FieldType A@@27 B@@26))) (not (= f_5@@14 Ref__Integer_value))) (= (U_2_real (MapType1Select QPMask@5 o_3@@46 f_5@@14)) (U_2_real (MapType1Select QPMask@12 o_3@@46 f_5@@14))))))
 :qid |stdinbpl.2075:31|
 :skolemid |194|
 :pattern ( (MapType1Select QPMask@5 o_3@@46 f_5@@14))
 :pattern ( (MapType1Select QPMask@12 o_3@@46 f_5@@14))
)) (state ExhaleHeap@0 QPMask@12))) (and (=> (= (ControlFlow 0 138) (- 0 142)) (forall ((i_81 Int) (i_81_1 Int) ) (!  (=> (and (and (and (and (not (= i_81 i_81_1)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U i_81))) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U i_81_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| b_2 i_81) (|Seq#Index| b_2 i_81_1))))
 :qid |stdinbpl.2083:17|
 :skolemid |195|
))) (=> (forall ((i_81@@0 Int) (i_81_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_81@@0 i_81_1@@0)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U i_81@@0))) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U i_81_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| b_2 i_81@@0) (|Seq#Index| b_2 i_81_1@@0))))
 :qid |stdinbpl.2083:17|
 :skolemid |195|
)) (=> (and (forall ((i_81@@1 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U i_81@@1)) (< NoPerm FullPerm)) (and (qpRange23 (|Seq#Index| b_2 i_81@@1)) (= (invRecv23 (|Seq#Index| b_2 i_81@@1)) i_81@@1)))
 :qid |stdinbpl.2089:24|
 :skolemid |196|
 :pattern ( (|Seq#Index| b_2 i_81@@1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U i_81@@1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U i_81@@1)))
 :pattern ( (|Seq#Index| b_2 i_81@@1))
)) (forall ((o_3@@47 T@U) ) (!  (=> (= (type o_3@@47) RefType) (=> (and (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U (invRecv23 o_3@@47))) (< NoPerm FullPerm)) (qpRange23 o_3@@47)) (= (|Seq#Index| b_2 (invRecv23 o_3@@47)) o_3@@47)))
 :qid |stdinbpl.2093:24|
 :skolemid |197|
 :pattern ( (invRecv23 o_3@@47))
))) (=> (and (and (forall ((i_81@@2 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U i_81@@2)) (not (= (|Seq#Index| b_2 i_81@@2) null)))
 :qid |stdinbpl.2099:24|
 :skolemid |198|
 :pattern ( (|Seq#Index| b_2 i_81@@2))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U i_81@@2)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U i_81@@2)))
 :pattern ( (|Seq#Index| b_2 i_81@@2))
)) (forall ((o_3@@48 T@U) ) (!  (=> (= (type o_3@@48) RefType) (and (=> (and (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U (invRecv23 o_3@@48))) (< NoPerm FullPerm)) (qpRange23 o_3@@48)) (and (=> (< NoPerm FullPerm) (= (|Seq#Index| b_2 (invRecv23 o_3@@48)) o_3@@48)) (= (U_2_real (MapType1Select QPMask@13 o_3@@48 Ref__Integer_value)) (+ (U_2_real (MapType1Select QPMask@12 o_3@@48 Ref__Integer_value)) FullPerm)))) (=> (not (and (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U (invRecv23 o_3@@48))) (< NoPerm FullPerm)) (qpRange23 o_3@@48))) (= (U_2_real (MapType1Select QPMask@13 o_3@@48 Ref__Integer_value)) (U_2_real (MapType1Select QPMask@12 o_3@@48 Ref__Integer_value))))))
 :qid |stdinbpl.2105:24|
 :skolemid |199|
 :pattern ( (MapType1Select QPMask@13 o_3@@48 Ref__Integer_value))
))) (and (forall ((o_3@@49 T@U) (f_5@@15 T@U) ) (! (let ((B@@27 (FieldTypeInv1 (type f_5@@15))))
(let ((A@@28 (FieldTypeInv0 (type f_5@@15))))
 (=> (and (and (= (type o_3@@49) RefType) (= (type f_5@@15) (FieldType A@@28 B@@27))) (not (= f_5@@15 Ref__Integer_value))) (= (U_2_real (MapType1Select QPMask@12 o_3@@49 f_5@@15)) (U_2_real (MapType1Select QPMask@13 o_3@@49 f_5@@15))))))
 :qid |stdinbpl.2109:31|
 :skolemid |200|
 :pattern ( (MapType1Select QPMask@12 o_3@@49 f_5@@15))
 :pattern ( (MapType1Select QPMask@13 o_3@@49 f_5@@15))
)) (state ExhaleHeap@0 QPMask@13))) (and (=> (= (ControlFlow 0 138) (- 0 141)) (forall ((i_82 Int) (i_82_1 Int) ) (!  (=> (and (and (and (and (not (= i_82 i_82_1)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U i_82))) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U i_82_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| res i_82) (|Seq#Index| res i_82_1))))
 :qid |stdinbpl.2117:17|
 :skolemid |201|
))) (=> (forall ((i_82@@0 Int) (i_82_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_82@@0 i_82_1@@0)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U i_82@@0))) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U i_82_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| res i_82@@0) (|Seq#Index| res i_82_1@@0))))
 :qid |stdinbpl.2117:17|
 :skolemid |201|
)) (=> (and (and (forall ((i_82@@1 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U i_82@@1)) (< NoPerm FullPerm)) (and (qpRange24 (|Seq#Index| res i_82@@1)) (= (invRecv24 (|Seq#Index| res i_82@@1)) i_82@@1)))
 :qid |stdinbpl.2123:24|
 :skolemid |202|
 :pattern ( (|Seq#Index| res i_82@@1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U i_82@@1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U i_82@@1)))
 :pattern ( (|Seq#Index| res i_82@@1))
)) (forall ((o_3@@50 T@U) ) (!  (=> (= (type o_3@@50) RefType) (=> (and (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U (invRecv24 o_3@@50))) (< NoPerm FullPerm)) (qpRange24 o_3@@50)) (= (|Seq#Index| res (invRecv24 o_3@@50)) o_3@@50)))
 :qid |stdinbpl.2127:24|
 :skolemid |203|
 :pattern ( (invRecv24 o_3@@50))
))) (and (forall ((i_82@@2 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U i_82@@2)) (not (= (|Seq#Index| res i_82@@2) null)))
 :qid |stdinbpl.2133:24|
 :skolemid |204|
 :pattern ( (|Seq#Index| res i_82@@2))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U i_82@@2)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U i_82@@2)))
 :pattern ( (|Seq#Index| res i_82@@2))
)) (forall ((o_3@@51 T@U) ) (!  (=> (= (type o_3@@51) RefType) (and (=> (and (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U (invRecv24 o_3@@51))) (< NoPerm FullPerm)) (qpRange24 o_3@@51)) (and (=> (< NoPerm FullPerm) (= (|Seq#Index| res (invRecv24 o_3@@51)) o_3@@51)) (= (U_2_real (MapType1Select QPMask@14 o_3@@51 Ref__Integer_value)) (+ (U_2_real (MapType1Select QPMask@13 o_3@@51 Ref__Integer_value)) FullPerm)))) (=> (not (and (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U (invRecv24 o_3@@51))) (< NoPerm FullPerm)) (qpRange24 o_3@@51))) (= (U_2_real (MapType1Select QPMask@14 o_3@@51 Ref__Integer_value)) (U_2_real (MapType1Select QPMask@13 o_3@@51 Ref__Integer_value))))))
 :qid |stdinbpl.2139:24|
 :skolemid |205|
 :pattern ( (MapType1Select QPMask@14 o_3@@51 Ref__Integer_value))
)))) (=> (and (and (and (forall ((o_3@@52 T@U) (f_5@@16 T@U) ) (! (let ((B@@28 (FieldTypeInv1 (type f_5@@16))))
(let ((A@@29 (FieldTypeInv0 (type f_5@@16))))
 (=> (and (and (= (type o_3@@52) RefType) (= (type f_5@@16) (FieldType A@@29 B@@28))) (not (= f_5@@16 Ref__Integer_value))) (= (U_2_real (MapType1Select QPMask@13 o_3@@52 f_5@@16)) (U_2_real (MapType1Select QPMask@14 o_3@@52 f_5@@16))))))
 :qid |stdinbpl.2143:31|
 :skolemid |206|
 :pattern ( (MapType1Select QPMask@13 o_3@@52 f_5@@16))
 :pattern ( (MapType1Select QPMask@14 o_3@@52 f_5@@16))
)) (state ExhaleHeap@0 QPMask@14)) (and (forall ((i_83 Int) ) (!  (=> (and (<= 0 i_83) (and (= (mod i_83 2) 0) (< i_83 k@0))) (= (U_2_int (MapType0Select ExhaleHeap@0 (|Seq#Index| res i_83) Ref__Integer_value)) (U_2_int (MapType0Select ExhaleHeap@0 (|Seq#Index| a_2 (div i_83 2)) Ref__Integer_value))))
 :qid |stdinbpl.2149:22|
 :skolemid |207|
 :pattern ( (|Seq#Index| res i_83))
)) (forall ((i_84 Int) ) (!  (=> (and (<= 0 i_84) (and (= (mod i_84 2) 1) (< i_84 k@0))) (= (U_2_int (MapType0Select ExhaleHeap@0 (|Seq#Index| res i_84) Ref__Integer_value)) (U_2_int (MapType0Select ExhaleHeap@0 (|Seq#Index| b_2 (div i_84 2)) Ref__Integer_value))))
 :qid |stdinbpl.2153:22|
 :skolemid |208|
 :pattern ( (|Seq#Index| res i_84))
)))) (and (and (forall ((i_85 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 (div k@0 2)) (int_2_U i_85)) (= (U_2_int (MapType0Select ExhaleHeap@0 (|Seq#Index| res (* 2 i_85)) Ref__Integer_value)) (U_2_int (MapType0Select ExhaleHeap@0 (|Seq#Index| a_2 i_85) Ref__Integer_value))))
 :qid |stdinbpl.2157:22|
 :skolemid |209|
 :pattern ( (|Seq#Index| a_2 i_85))
)) (forall ((i_86 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 (div k@0 2)) (int_2_U i_86)) (= (U_2_int (MapType0Select ExhaleHeap@0 (|Seq#Index| res (+ (* 2 i_86) 1)) Ref__Integer_value)) (U_2_int (MapType0Select ExhaleHeap@0 (|Seq#Index| b_2 i_86) Ref__Integer_value))))
 :qid |stdinbpl.2161:22|
 :skolemid |210|
 :pattern ( (|Seq#Index| b_2 i_86))
))) (and (state ExhaleHeap@0 QPMask@14) (state ExhaleHeap@0 QPMask@14)))) (and (=> (= (ControlFlow 0 138) (- 0 140)) (= k@0 (|Seq#Length| res))) (=> (= k@0 (|Seq#Length| res)) (=> (state ExhaleHeap@0 QPMask@14) (and (=> (= (ControlFlow 0 138) (- 0 139)) (= (div (|Seq#Length| res) 2) (div k@0 2))) (=> (= (div (|Seq#Length| res) 2) (div k@0 2)) (=> (state ExhaleHeap@0 QPMask@14) (and (and (and (and (=> (= (ControlFlow 0 138) 137) anon228_Else_correct) (=> (= (ControlFlow 0 138) 63) anon229_Then_correct)) (=> (= (ControlFlow 0 138) 65) anon229_Else_correct)) (=> (= (ControlFlow 0 138) 54) anon227_Then_correct)) (=> (= (ControlFlow 0 138) 61) anon227_Else_correct)))))))))))))))))))))))))
(let ((anon200_Else_correct  (=> (and (forall ((i_47_1 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 (div 0 2)) (int_2_U i_47_1)) (= (U_2_int (MapType0Select Heap@@9 (|Seq#Index| res (+ (* 2 i_47_1) 1)) Ref__Integer_value)) (U_2_int (MapType0Select Heap@@9 (|Seq#Index| b_2 i_47_1) Ref__Integer_value))))
 :qid |stdinbpl.1361:24|
 :skolemid |122|
 :pattern ( (|Seq#Index| b_2 i_47_1))
)) (IdenticalOnKnownLocations Heap@@9 ExhaleHeap@0 QPMask@5)) (=> (and (and (U_2_bool (MapType0Select ExhaleHeap@0 __flatten_9@0 $allocated)) (U_2_bool (MapType0Select ExhaleHeap@0 __flatten_8@0 $allocated))) (and (U_2_bool (MapType0Select ExhaleHeap@0 __flatten_6@0 $allocated)) (U_2_bool (MapType0Select ExhaleHeap@0 __flatten_5@0 $allocated)))) (and (and (=> (= (ControlFlow 0 253) 252) anon202_Then_correct) (=> (= (ControlFlow 0 253) 164) anon217_Then_correct)) (=> (= (ControlFlow 0 253) 138) anon217_Else_correct))))))
(let ((anon69_correct true))
(let ((anon201_Else_correct  (=> (and (not (|Seq#Contains| (|Seq#Range| 0 (div 0 2)) (int_2_U i_46))) (= (ControlFlow 0 52) 49)) anon69_correct)))
(let ((anon201_Then_correct  (=> (|Seq#Contains| (|Seq#Range| 0 (div 0 2)) (int_2_U i_46)) (and (=> (= (ControlFlow 0 50) (- 0 51)) (= (U_2_int (MapType0Select Heap@@9 (|Seq#Index| res (+ (* 2 i_46) 1)) Ref__Integer_value)) (U_2_int (MapType0Select Heap@@9 (|Seq#Index| b_2 i_46) Ref__Integer_value)))) (=> (= (U_2_int (MapType0Select Heap@@9 (|Seq#Index| res (+ (* 2 i_46) 1)) Ref__Integer_value)) (U_2_int (MapType0Select Heap@@9 (|Seq#Index| b_2 i_46) Ref__Integer_value))) (=> (= (ControlFlow 0 50) 49) anon69_correct))))))
(let ((anon198_Else_correct  (=> (forall ((i_45_1 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 (div 0 2)) (int_2_U i_45_1)) (= (U_2_int (MapType0Select Heap@@9 (|Seq#Index| res (* 2 i_45_1)) Ref__Integer_value)) (U_2_int (MapType0Select Heap@@9 (|Seq#Index| a_2 i_45_1) Ref__Integer_value))))
 :qid |stdinbpl.1350:24|
 :skolemid |121|
 :pattern ( (|Seq#Index| a_2 i_45_1))
)) (and (and (=> (= (ControlFlow 0 254) 253) anon200_Else_correct) (=> (= (ControlFlow 0 254) 50) anon201_Then_correct)) (=> (= (ControlFlow 0 254) 52) anon201_Else_correct)))))
(let ((anon65_correct true))
(let ((anon199_Else_correct  (=> (and (not (|Seq#Contains| (|Seq#Range| 0 (div 0 2)) (int_2_U i_44))) (= (ControlFlow 0 48) 45)) anon65_correct)))
(let ((anon199_Then_correct  (=> (|Seq#Contains| (|Seq#Range| 0 (div 0 2)) (int_2_U i_44)) (and (=> (= (ControlFlow 0 46) (- 0 47)) (= (U_2_int (MapType0Select Heap@@9 (|Seq#Index| res (* 2 i_44)) Ref__Integer_value)) (U_2_int (MapType0Select Heap@@9 (|Seq#Index| a_2 i_44) Ref__Integer_value)))) (=> (= (U_2_int (MapType0Select Heap@@9 (|Seq#Index| res (* 2 i_44)) Ref__Integer_value)) (U_2_int (MapType0Select Heap@@9 (|Seq#Index| a_2 i_44) Ref__Integer_value))) (=> (= (ControlFlow 0 46) 45) anon65_correct))))))
(let ((anon196_Else_correct  (=> (forall ((i_43_1 Int) ) (!  (=> (and (<= 0 i_43_1) (and (= (mod i_43_1 2) 1) (< i_43_1 0))) (= (U_2_int (MapType0Select Heap@@9 (|Seq#Index| res i_43_1) Ref__Integer_value)) (U_2_int (MapType0Select Heap@@9 (|Seq#Index| b_2 (div i_43_1 2)) Ref__Integer_value))))
 :qid |stdinbpl.1339:24|
 :skolemid |120|
 :pattern ( (|Seq#Index| res i_43_1))
)) (and (and (=> (= (ControlFlow 0 255) 254) anon198_Else_correct) (=> (= (ControlFlow 0 255) 46) anon199_Then_correct)) (=> (= (ControlFlow 0 255) 48) anon199_Else_correct)))))
(let ((anon61_correct true))
(let ((anon197_Else_correct  (=> (and (not (and (<= 0 i_42) (and (= (mod i_42 2) 1) (< i_42 0)))) (= (ControlFlow 0 44) 41)) anon61_correct)))
(let ((anon197_Then_correct  (=> (and (<= 0 i_42) (and (= (mod i_42 2) 1) (< i_42 0))) (and (=> (= (ControlFlow 0 42) (- 0 43)) (= (U_2_int (MapType0Select Heap@@9 (|Seq#Index| res i_42) Ref__Integer_value)) (U_2_int (MapType0Select Heap@@9 (|Seq#Index| b_2 (div i_42 2)) Ref__Integer_value)))) (=> (= (U_2_int (MapType0Select Heap@@9 (|Seq#Index| res i_42) Ref__Integer_value)) (U_2_int (MapType0Select Heap@@9 (|Seq#Index| b_2 (div i_42 2)) Ref__Integer_value))) (=> (= (ControlFlow 0 42) 41) anon61_correct))))))
(let ((anon194_Else_correct  (=> (forall ((i_41_1 Int) ) (!  (=> (and (<= 0 i_41_1) (and (= (mod i_41_1 2) 0) (< i_41_1 0))) (= (U_2_int (MapType0Select Heap@@9 (|Seq#Index| res i_41_1) Ref__Integer_value)) (U_2_int (MapType0Select Heap@@9 (|Seq#Index| a_2 (div i_41_1 2)) Ref__Integer_value))))
 :qid |stdinbpl.1328:24|
 :skolemid |119|
 :pattern ( (|Seq#Index| res i_41_1))
)) (and (and (=> (= (ControlFlow 0 256) 255) anon196_Else_correct) (=> (= (ControlFlow 0 256) 42) anon197_Then_correct)) (=> (= (ControlFlow 0 256) 44) anon197_Else_correct)))))
(let ((anon57_correct true))
(let ((anon195_Else_correct  (=> (and (not (and (<= 0 i_40) (and (= (mod i_40 2) 0) (< i_40 0)))) (= (ControlFlow 0 40) 37)) anon57_correct)))
(let ((anon195_Then_correct  (=> (and (<= 0 i_40) (and (= (mod i_40 2) 0) (< i_40 0))) (and (=> (= (ControlFlow 0 38) (- 0 39)) (= (U_2_int (MapType0Select Heap@@9 (|Seq#Index| res i_40) Ref__Integer_value)) (U_2_int (MapType0Select Heap@@9 (|Seq#Index| a_2 (div i_40 2)) Ref__Integer_value)))) (=> (= (U_2_int (MapType0Select Heap@@9 (|Seq#Index| res i_40) Ref__Integer_value)) (U_2_int (MapType0Select Heap@@9 (|Seq#Index| a_2 (div i_40 2)) Ref__Integer_value))) (=> (= (ControlFlow 0 38) 37) anon57_correct))))))
(let ((anon179_Else_correct  (=> (U_2_bool (MapType0Select Heap@@9 __flatten_5 $allocated)) (=> (and (and (U_2_bool (MapType0Select Heap@@9 __flatten_6 $allocated)) (U_2_bool (MapType0Select Heap@@9 __flatten_8 $allocated))) (and (U_2_bool (MapType0Select Heap@@9 __flatten_9 $allocated)) (state Heap@@9 QPMask@2))) (and (=> (= (ControlFlow 0 257) (- 0 268)) (<= 0 0)) (=> (<= 0 0) (and (=> (= (ControlFlow 0 257) (- 0 267)) (= (mod 0 2) 0)) (=> (= (mod 0 2) 0) (and (=> (= (ControlFlow 0 257) (- 0 266)) (<= 0 (|Seq#Length| res))) (=> (<= 0 (|Seq#Length| res)) (and (=> (= (ControlFlow 0 257) (- 0 265)) (= (|Seq#Length| a_2) (|Seq#Length| b_2))) (=> (= (|Seq#Length| a_2) (|Seq#Length| b_2)) (and (=> (= (ControlFlow 0 257) (- 0 264)) (= (|Seq#Length| res) (* 2 (|Seq#Length| a_2)))) (=> (= (|Seq#Length| res) (* 2 (|Seq#Length| a_2))) (and (=> (= (ControlFlow 0 257) (- 0 263)) (forall ((i_37 Int) (i_37_1 Int) ) (!  (=> (and (and (and (and (not (= i_37 i_37_1)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U i_37))) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U i_37_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| a_2 i_37) (|Seq#Index| a_2 i_37_1))))
 :qid |stdinbpl.1205:21|
 :skolemid |101|
 :pattern ( (neverTriggered10 i_37) (neverTriggered10 i_37_1))
))) (=> (forall ((i_37@@0 Int) (i_37_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_37@@0 i_37_1@@0)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U i_37@@0))) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U i_37_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| a_2 i_37@@0) (|Seq#Index| a_2 i_37_1@@0))))
 :qid |stdinbpl.1205:21|
 :skolemid |101|
 :pattern ( (neverTriggered10 i_37@@0) (neverTriggered10 i_37_1@@0))
)) (and (=> (= (ControlFlow 0 257) (- 0 262)) (forall ((i_37@@1 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U i_37@@1)) (>= (U_2_real (MapType1Select QPMask@2 (|Seq#Index| a_2 i_37@@1) Ref__Integer_value)) FullPerm))
 :qid |stdinbpl.1212:21|
 :skolemid |102|
 :pattern ( (|Seq#Index| a_2 i_37@@1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U i_37@@1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U i_37@@1)))
 :pattern ( (|Seq#Index| a_2 i_37@@1))
))) (=> (forall ((i_37@@2 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U i_37@@2)) (>= (U_2_real (MapType1Select QPMask@2 (|Seq#Index| a_2 i_37@@2) Ref__Integer_value)) FullPerm))
 :qid |stdinbpl.1212:21|
 :skolemid |102|
 :pattern ( (|Seq#Index| a_2 i_37@@2))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U i_37@@2)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U i_37@@2)))
 :pattern ( (|Seq#Index| a_2 i_37@@2))
)) (=> (and (and (forall ((i_37@@3 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U i_37@@3)) (< NoPerm FullPerm)) (and (qpRange10 (|Seq#Index| a_2 i_37@@3)) (= (invRecv10 (|Seq#Index| a_2 i_37@@3)) i_37@@3)))
 :qid |stdinbpl.1218:26|
 :skolemid |103|
 :pattern ( (|Seq#Index| a_2 i_37@@3))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U i_37@@3)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U i_37@@3)))
 :pattern ( (|Seq#Index| a_2 i_37@@3))
)) (forall ((o_3@@53 T@U) ) (!  (=> (= (type o_3@@53) RefType) (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U (invRecv10 o_3@@53))) (and (< NoPerm FullPerm) (qpRange10 o_3@@53))) (= (|Seq#Index| a_2 (invRecv10 o_3@@53)) o_3@@53)))
 :qid |stdinbpl.1222:26|
 :skolemid |104|
 :pattern ( (invRecv10 o_3@@53))
))) (and (forall ((o_3@@54 T@U) ) (!  (=> (= (type o_3@@54) RefType) (and (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U (invRecv10 o_3@@54))) (and (< NoPerm FullPerm) (qpRange10 o_3@@54))) (and (= (|Seq#Index| a_2 (invRecv10 o_3@@54)) o_3@@54) (= (U_2_real (MapType1Select QPMask@3 o_3@@54 Ref__Integer_value)) (- (U_2_real (MapType1Select QPMask@2 o_3@@54 Ref__Integer_value)) FullPerm)))) (=> (not (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U (invRecv10 o_3@@54))) (and (< NoPerm FullPerm) (qpRange10 o_3@@54)))) (= (U_2_real (MapType1Select QPMask@3 o_3@@54 Ref__Integer_value)) (U_2_real (MapType1Select QPMask@2 o_3@@54 Ref__Integer_value))))))
 :qid |stdinbpl.1228:26|
 :skolemid |105|
 :pattern ( (MapType1Select QPMask@3 o_3@@54 Ref__Integer_value))
)) (forall ((o_3@@55 T@U) (f_5@@17 T@U) ) (! (let ((B@@29 (FieldTypeInv1 (type f_5@@17))))
(let ((A@@30 (FieldTypeInv0 (type f_5@@17))))
 (=> (and (and (= (type o_3@@55) RefType) (= (type f_5@@17) (FieldType A@@30 B@@29))) (not (= f_5@@17 Ref__Integer_value))) (= (U_2_real (MapType1Select QPMask@2 o_3@@55 f_5@@17)) (U_2_real (MapType1Select QPMask@3 o_3@@55 f_5@@17))))))
 :qid |stdinbpl.1234:33|
 :skolemid |106|
 :pattern ( (MapType1Select QPMask@3 o_3@@55 f_5@@17))
)))) (and (=> (= (ControlFlow 0 257) (- 0 261)) (forall ((i_38 Int) (i_38_1 Int) ) (!  (=> (and (and (and (and (not (= i_38 i_38_1)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U i_38))) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U i_38_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| b_2 i_38) (|Seq#Index| b_2 i_38_1))))
 :qid |stdinbpl.1246:21|
 :skolemid |107|
 :pattern ( (neverTriggered11 i_38) (neverTriggered11 i_38_1))
))) (=> (forall ((i_38@@0 Int) (i_38_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_38@@0 i_38_1@@0)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U i_38@@0))) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U i_38_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| b_2 i_38@@0) (|Seq#Index| b_2 i_38_1@@0))))
 :qid |stdinbpl.1246:21|
 :skolemid |107|
 :pattern ( (neverTriggered11 i_38@@0) (neverTriggered11 i_38_1@@0))
)) (and (=> (= (ControlFlow 0 257) (- 0 260)) (forall ((i_38@@1 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U i_38@@1)) (>= (U_2_real (MapType1Select QPMask@3 (|Seq#Index| b_2 i_38@@1) Ref__Integer_value)) FullPerm))
 :qid |stdinbpl.1253:21|
 :skolemid |108|
 :pattern ( (|Seq#Index| b_2 i_38@@1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U i_38@@1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U i_38@@1)))
 :pattern ( (|Seq#Index| b_2 i_38@@1))
))) (=> (forall ((i_38@@2 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U i_38@@2)) (>= (U_2_real (MapType1Select QPMask@3 (|Seq#Index| b_2 i_38@@2) Ref__Integer_value)) FullPerm))
 :qid |stdinbpl.1253:21|
 :skolemid |108|
 :pattern ( (|Seq#Index| b_2 i_38@@2))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U i_38@@2)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U i_38@@2)))
 :pattern ( (|Seq#Index| b_2 i_38@@2))
)) (=> (and (and (forall ((i_38@@3 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U i_38@@3)) (< NoPerm FullPerm)) (and (qpRange11 (|Seq#Index| b_2 i_38@@3)) (= (invRecv11 (|Seq#Index| b_2 i_38@@3)) i_38@@3)))
 :qid |stdinbpl.1259:26|
 :skolemid |109|
 :pattern ( (|Seq#Index| b_2 i_38@@3))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U i_38@@3)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U i_38@@3)))
 :pattern ( (|Seq#Index| b_2 i_38@@3))
)) (forall ((o_3@@56 T@U) ) (!  (=> (= (type o_3@@56) RefType) (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U (invRecv11 o_3@@56))) (and (< NoPerm FullPerm) (qpRange11 o_3@@56))) (= (|Seq#Index| b_2 (invRecv11 o_3@@56)) o_3@@56)))
 :qid |stdinbpl.1263:26|
 :skolemid |110|
 :pattern ( (invRecv11 o_3@@56))
))) (and (forall ((o_3@@57 T@U) ) (!  (=> (= (type o_3@@57) RefType) (and (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U (invRecv11 o_3@@57))) (and (< NoPerm FullPerm) (qpRange11 o_3@@57))) (and (= (|Seq#Index| b_2 (invRecv11 o_3@@57)) o_3@@57) (= (U_2_real (MapType1Select QPMask@4 o_3@@57 Ref__Integer_value)) (- (U_2_real (MapType1Select QPMask@3 o_3@@57 Ref__Integer_value)) FullPerm)))) (=> (not (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U (invRecv11 o_3@@57))) (and (< NoPerm FullPerm) (qpRange11 o_3@@57)))) (= (U_2_real (MapType1Select QPMask@4 o_3@@57 Ref__Integer_value)) (U_2_real (MapType1Select QPMask@3 o_3@@57 Ref__Integer_value))))))
 :qid |stdinbpl.1269:26|
 :skolemid |111|
 :pattern ( (MapType1Select QPMask@4 o_3@@57 Ref__Integer_value))
)) (forall ((o_3@@58 T@U) (f_5@@18 T@U) ) (! (let ((B@@30 (FieldTypeInv1 (type f_5@@18))))
(let ((A@@31 (FieldTypeInv0 (type f_5@@18))))
 (=> (and (and (= (type o_3@@58) RefType) (= (type f_5@@18) (FieldType A@@31 B@@30))) (not (= f_5@@18 Ref__Integer_value))) (= (U_2_real (MapType1Select QPMask@3 o_3@@58 f_5@@18)) (U_2_real (MapType1Select QPMask@4 o_3@@58 f_5@@18))))))
 :qid |stdinbpl.1275:33|
 :skolemid |112|
 :pattern ( (MapType1Select QPMask@4 o_3@@58 f_5@@18))
)))) (and (=> (= (ControlFlow 0 257) (- 0 259)) (forall ((i_39 Int) (i_39_1 Int) ) (!  (=> (and (and (and (and (not (= i_39 i_39_1)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U i_39))) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U i_39_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| res i_39) (|Seq#Index| res i_39_1))))
 :qid |stdinbpl.1287:21|
 :skolemid |113|
 :pattern ( (neverTriggered12 i_39) (neverTriggered12 i_39_1))
))) (=> (forall ((i_39@@0 Int) (i_39_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_39@@0 i_39_1@@0)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U i_39@@0))) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U i_39_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| res i_39@@0) (|Seq#Index| res i_39_1@@0))))
 :qid |stdinbpl.1287:21|
 :skolemid |113|
 :pattern ( (neverTriggered12 i_39@@0) (neverTriggered12 i_39_1@@0))
)) (and (=> (= (ControlFlow 0 257) (- 0 258)) (forall ((i_39@@1 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U i_39@@1)) (>= (U_2_real (MapType1Select QPMask@4 (|Seq#Index| res i_39@@1) Ref__Integer_value)) FullPerm))
 :qid |stdinbpl.1294:21|
 :skolemid |114|
 :pattern ( (|Seq#Index| res i_39@@1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U i_39@@1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U i_39@@1)))
 :pattern ( (|Seq#Index| res i_39@@1))
))) (=> (forall ((i_39@@2 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U i_39@@2)) (>= (U_2_real (MapType1Select QPMask@4 (|Seq#Index| res i_39@@2) Ref__Integer_value)) FullPerm))
 :qid |stdinbpl.1294:21|
 :skolemid |114|
 :pattern ( (|Seq#Index| res i_39@@2))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U i_39@@2)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U i_39@@2)))
 :pattern ( (|Seq#Index| res i_39@@2))
)) (=> (and (and (forall ((i_39@@3 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U i_39@@3)) (< NoPerm FullPerm)) (and (qpRange12 (|Seq#Index| res i_39@@3)) (= (invRecv12 (|Seq#Index| res i_39@@3)) i_39@@3)))
 :qid |stdinbpl.1300:26|
 :skolemid |115|
 :pattern ( (|Seq#Index| res i_39@@3))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U i_39@@3)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U i_39@@3)))
 :pattern ( (|Seq#Index| res i_39@@3))
)) (forall ((o_3@@59 T@U) ) (!  (=> (= (type o_3@@59) RefType) (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U (invRecv12 o_3@@59))) (and (< NoPerm FullPerm) (qpRange12 o_3@@59))) (= (|Seq#Index| res (invRecv12 o_3@@59)) o_3@@59)))
 :qid |stdinbpl.1304:26|
 :skolemid |116|
 :pattern ( (invRecv12 o_3@@59))
))) (and (forall ((o_3@@60 T@U) ) (!  (=> (= (type o_3@@60) RefType) (and (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U (invRecv12 o_3@@60))) (and (< NoPerm FullPerm) (qpRange12 o_3@@60))) (and (= (|Seq#Index| res (invRecv12 o_3@@60)) o_3@@60) (= (U_2_real (MapType1Select QPMask@5 o_3@@60 Ref__Integer_value)) (- (U_2_real (MapType1Select QPMask@4 o_3@@60 Ref__Integer_value)) FullPerm)))) (=> (not (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U (invRecv12 o_3@@60))) (and (< NoPerm FullPerm) (qpRange12 o_3@@60)))) (= (U_2_real (MapType1Select QPMask@5 o_3@@60 Ref__Integer_value)) (U_2_real (MapType1Select QPMask@4 o_3@@60 Ref__Integer_value))))))
 :qid |stdinbpl.1310:26|
 :skolemid |117|
 :pattern ( (MapType1Select QPMask@5 o_3@@60 Ref__Integer_value))
)) (forall ((o_3@@61 T@U) (f_5@@19 T@U) ) (! (let ((B@@31 (FieldTypeInv1 (type f_5@@19))))
(let ((A@@32 (FieldTypeInv0 (type f_5@@19))))
 (=> (and (and (= (type o_3@@61) RefType) (= (type f_5@@19) (FieldType A@@32 B@@31))) (not (= f_5@@19 Ref__Integer_value))) (= (U_2_real (MapType1Select QPMask@4 o_3@@61 f_5@@19)) (U_2_real (MapType1Select QPMask@5 o_3@@61 f_5@@19))))))
 :qid |stdinbpl.1316:33|
 :skolemid |118|
 :pattern ( (MapType1Select QPMask@5 o_3@@61 f_5@@19))
)))) (and (and (=> (= (ControlFlow 0 257) 256) anon194_Else_correct) (=> (= (ControlFlow 0 257) 38) anon195_Then_correct)) (=> (= (ControlFlow 0 257) 40) anon195_Else_correct)))))))))))))))))))))))))))))))
(let ((anon177_Else_correct  (and (=> (= (ControlFlow 0 331) (- 0 332)) (forall ((i_11 Int) (i_11_1 Int) ) (!  (=> (and (and (and (and (not (= i_11 i_11_1)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U i_11))) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U i_11_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| res i_11) (|Seq#Index| res i_11_1))))
 :qid |stdinbpl.883:15|
 :skolemid |73|
))) (=> (forall ((i_11@@0 Int) (i_11_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_11@@0 i_11_1@@0)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U i_11@@0))) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U i_11_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| res i_11@@0) (|Seq#Index| res i_11_1@@0))))
 :qid |stdinbpl.883:15|
 :skolemid |73|
)) (=> (forall ((i_11@@1 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U i_11@@1)) (< NoPerm FullPerm)) (and (qpRange3 (|Seq#Index| res i_11@@1)) (= (invRecv3 (|Seq#Index| res i_11@@1)) i_11@@1)))
 :qid |stdinbpl.889:22|
 :skolemid |74|
 :pattern ( (|Seq#Index| res i_11@@1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U i_11@@1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U i_11@@1)))
 :pattern ( (|Seq#Index| res i_11@@1))
)) (=> (and (forall ((o_3@@62 T@U) ) (!  (=> (= (type o_3@@62) RefType) (=> (and (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U (invRecv3 o_3@@62))) (< NoPerm FullPerm)) (qpRange3 o_3@@62)) (= (|Seq#Index| res (invRecv3 o_3@@62)) o_3@@62)))
 :qid |stdinbpl.893:22|
 :skolemid |75|
 :pattern ( (invRecv3 o_3@@62))
)) (forall ((i_11@@2 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U i_11@@2)) (not (= (|Seq#Index| res i_11@@2) null)))
 :qid |stdinbpl.899:22|
 :skolemid |76|
 :pattern ( (|Seq#Index| res i_11@@2))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U i_11@@2)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U i_11@@2)))
 :pattern ( (|Seq#Index| res i_11@@2))
))) (=> (and (and (forall ((o_3@@63 T@U) ) (!  (=> (= (type o_3@@63) RefType) (and (=> (and (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U (invRecv3 o_3@@63))) (< NoPerm FullPerm)) (qpRange3 o_3@@63)) (and (=> (< NoPerm FullPerm) (= (|Seq#Index| res (invRecv3 o_3@@63)) o_3@@63)) (= (U_2_real (MapType1Select QPMask@2 o_3@@63 Ref__Integer_value)) (+ (U_2_real (MapType1Select QPMask@1 o_3@@63 Ref__Integer_value)) FullPerm)))) (=> (not (and (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U (invRecv3 o_3@@63))) (< NoPerm FullPerm)) (qpRange3 o_3@@63))) (= (U_2_real (MapType1Select QPMask@2 o_3@@63 Ref__Integer_value)) (U_2_real (MapType1Select QPMask@1 o_3@@63 Ref__Integer_value))))))
 :qid |stdinbpl.905:22|
 :skolemid |77|
 :pattern ( (MapType1Select QPMask@2 o_3@@63 Ref__Integer_value))
)) (forall ((o_3@@64 T@U) (f_5@@20 T@U) ) (! (let ((B@@32 (FieldTypeInv1 (type f_5@@20))))
(let ((A@@33 (FieldTypeInv0 (type f_5@@20))))
 (=> (and (and (= (type o_3@@64) RefType) (= (type f_5@@20) (FieldType A@@33 B@@32))) (not (= f_5@@20 Ref__Integer_value))) (= (U_2_real (MapType1Select QPMask@1 o_3@@64 f_5@@20)) (U_2_real (MapType1Select QPMask@2 o_3@@64 f_5@@20))))))
 :qid |stdinbpl.909:29|
 :skolemid |78|
 :pattern ( (MapType1Select QPMask@1 o_3@@64 f_5@@20))
 :pattern ( (MapType1Select QPMask@2 o_3@@64 f_5@@20))
))) (and (state Heap@@9 QPMask@2) (state Heap@@9 QPMask@2))) (and (=> (= (ControlFlow 0 331) 330) anon179_Then_correct) (=> (= (ControlFlow 0 331) 257) anon179_Else_correct)))))))))
(let ((anon23_correct true))
(let ((anon178_Else_correct  (=> (and (not (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U i_10))) (= (ControlFlow 0 36) 32)) anon23_correct)))
(let ((anon178_Then_correct  (=> (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| res)) (int_2_U i_10)) (and (=> (= (ControlFlow 0 33) (- 0 35)) (>= i_10 0)) (=> (>= i_10 0) (and (=> (= (ControlFlow 0 33) (- 0 34)) (< i_10 (|Seq#Length| res))) (=> (< i_10 (|Seq#Length| res)) (=> (= (ControlFlow 0 33) 32) anon23_correct))))))))
(let ((anon175_Else_correct  (=> (and (forall ((i_9 Int) (j_5 Int) ) (!  (=> (and (<= 0 i_9) (and (< i_9 (|Seq#Length| res)) (and (<= 0 j_5) (and (< j_5 (|Seq#Length| res)) (not (= i_9 j_5)))))) (not (= (|Seq#Index| res i_9) (|Seq#Index| res j_5))))
 :qid |stdinbpl.865:20|
 :skolemid |72|
 :pattern ( (|Seq#Index| res i_9) (|Seq#Index| res j_5))
)) (state Heap@@9 QPMask@1)) (and (and (=> (= (ControlFlow 0 333) 331) anon177_Else_correct) (=> (= (ControlFlow 0 333) 33) anon178_Then_correct)) (=> (= (ControlFlow 0 333) 36) anon178_Else_correct)))))
(let ((anon19_correct true))
(let ((anon176_Else_correct  (=> (and (not (and (<= 0 i_8) (and (< i_8 (|Seq#Length| res)) (and (<= 0 j_4) (and (< j_4 (|Seq#Length| res)) (not (= i_8 j_4))))))) (= (ControlFlow 0 31) 25)) anon19_correct)))
(let ((anon176_Then_correct  (=> (and (<= 0 i_8) (and (< i_8 (|Seq#Length| res)) (and (<= 0 j_4) (and (< j_4 (|Seq#Length| res)) (not (= i_8 j_4)))))) (and (=> (= (ControlFlow 0 26) (- 0 30)) (>= i_8 0)) (=> (>= i_8 0) (and (=> (= (ControlFlow 0 26) (- 0 29)) (< i_8 (|Seq#Length| res))) (=> (< i_8 (|Seq#Length| res)) (and (=> (= (ControlFlow 0 26) (- 0 28)) (>= j_4 0)) (=> (>= j_4 0) (and (=> (= (ControlFlow 0 26) (- 0 27)) (< j_4 (|Seq#Length| res))) (=> (< j_4 (|Seq#Length| res)) (=> (= (ControlFlow 0 26) 25) anon19_correct))))))))))))
(let ((anon173_Else_correct  (and (=> (= (ControlFlow 0 334) (- 0 335)) (forall ((i_7 Int) (i_7_1 Int) ) (!  (=> (and (and (and (and (not (= i_7 i_7_1)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U i_7))) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U i_7_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| b_2 i_7) (|Seq#Index| b_2 i_7_1))))
 :qid |stdinbpl.817:15|
 :skolemid |66|
))) (=> (forall ((i_7@@0 Int) (i_7_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_7@@0 i_7_1@@0)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U i_7@@0))) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U i_7_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| b_2 i_7@@0) (|Seq#Index| b_2 i_7_1@@0))))
 :qid |stdinbpl.817:15|
 :skolemid |66|
)) (=> (forall ((i_7@@1 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U i_7@@1)) (< NoPerm FullPerm)) (and (qpRange2 (|Seq#Index| b_2 i_7@@1)) (= (invRecv2 (|Seq#Index| b_2 i_7@@1)) i_7@@1)))
 :qid |stdinbpl.823:22|
 :skolemid |67|
 :pattern ( (|Seq#Index| b_2 i_7@@1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U i_7@@1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U i_7@@1)))
 :pattern ( (|Seq#Index| b_2 i_7@@1))
)) (=> (and (forall ((o_3@@65 T@U) ) (!  (=> (= (type o_3@@65) RefType) (=> (and (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U (invRecv2 o_3@@65))) (< NoPerm FullPerm)) (qpRange2 o_3@@65)) (= (|Seq#Index| b_2 (invRecv2 o_3@@65)) o_3@@65)))
 :qid |stdinbpl.827:22|
 :skolemid |68|
 :pattern ( (invRecv2 o_3@@65))
)) (forall ((i_7@@2 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U i_7@@2)) (not (= (|Seq#Index| b_2 i_7@@2) null)))
 :qid |stdinbpl.833:22|
 :skolemid |69|
 :pattern ( (|Seq#Index| b_2 i_7@@2))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U i_7@@2)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U i_7@@2)))
 :pattern ( (|Seq#Index| b_2 i_7@@2))
))) (=> (and (and (forall ((o_3@@66 T@U) ) (!  (=> (= (type o_3@@66) RefType) (and (=> (and (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U (invRecv2 o_3@@66))) (< NoPerm FullPerm)) (qpRange2 o_3@@66)) (and (=> (< NoPerm FullPerm) (= (|Seq#Index| b_2 (invRecv2 o_3@@66)) o_3@@66)) (= (U_2_real (MapType1Select QPMask@1 o_3@@66 Ref__Integer_value)) (+ (U_2_real (MapType1Select QPMask@0 o_3@@66 Ref__Integer_value)) FullPerm)))) (=> (not (and (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U (invRecv2 o_3@@66))) (< NoPerm FullPerm)) (qpRange2 o_3@@66))) (= (U_2_real (MapType1Select QPMask@1 o_3@@66 Ref__Integer_value)) (U_2_real (MapType1Select QPMask@0 o_3@@66 Ref__Integer_value))))))
 :qid |stdinbpl.839:22|
 :skolemid |70|
 :pattern ( (MapType1Select QPMask@1 o_3@@66 Ref__Integer_value))
)) (forall ((o_3@@67 T@U) (f_5@@21 T@U) ) (! (let ((B@@33 (FieldTypeInv1 (type f_5@@21))))
(let ((A@@34 (FieldTypeInv0 (type f_5@@21))))
 (=> (and (and (= (type o_3@@67) RefType) (= (type f_5@@21) (FieldType A@@34 B@@33))) (not (= f_5@@21 Ref__Integer_value))) (= (U_2_real (MapType1Select QPMask@0 o_3@@67 f_5@@21)) (U_2_real (MapType1Select QPMask@1 o_3@@67 f_5@@21))))))
 :qid |stdinbpl.843:29|
 :skolemid |71|
 :pattern ( (MapType1Select QPMask@0 o_3@@67 f_5@@21))
 :pattern ( (MapType1Select QPMask@1 o_3@@67 f_5@@21))
))) (and (state Heap@@9 QPMask@1) (state Heap@@9 QPMask@1))) (and (and (=> (= (ControlFlow 0 334) 333) anon175_Else_correct) (=> (= (ControlFlow 0 334) 26) anon176_Then_correct)) (=> (= (ControlFlow 0 334) 31) anon176_Else_correct)))))))))
(let ((anon15_correct true))
(let ((anon174_Else_correct  (=> (and (not (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U i_6))) (= (ControlFlow 0 24) 20)) anon15_correct)))
(let ((anon174_Then_correct  (=> (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| b_2)) (int_2_U i_6)) (and (=> (= (ControlFlow 0 21) (- 0 23)) (>= i_6 0)) (=> (>= i_6 0) (and (=> (= (ControlFlow 0 21) (- 0 22)) (< i_6 (|Seq#Length| b_2))) (=> (< i_6 (|Seq#Length| b_2)) (=> (= (ControlFlow 0 21) 20) anon15_correct))))))))
(let ((anon171_Else_correct  (=> (and (forall ((i_5 Int) (j_3 Int) ) (!  (=> (and (<= 0 i_5) (and (< i_5 (|Seq#Length| b_2)) (and (<= 0 j_3) (and (< j_3 (|Seq#Length| b_2)) (not (= i_5 j_3)))))) (not (= (|Seq#Index| b_2 i_5) (|Seq#Index| b_2 j_3))))
 :qid |stdinbpl.799:20|
 :skolemid |65|
 :pattern ( (|Seq#Index| b_2 i_5) (|Seq#Index| b_2 j_3))
)) (state Heap@@9 QPMask@0)) (and (and (=> (= (ControlFlow 0 336) 334) anon173_Else_correct) (=> (= (ControlFlow 0 336) 21) anon174_Then_correct)) (=> (= (ControlFlow 0 336) 24) anon174_Else_correct)))))
(let ((anon11_correct true))
(let ((anon172_Else_correct  (=> (and (not (and (<= 0 i_4) (and (< i_4 (|Seq#Length| b_2)) (and (<= 0 j_2) (and (< j_2 (|Seq#Length| b_2)) (not (= i_4 j_2))))))) (= (ControlFlow 0 19) 13)) anon11_correct)))
(let ((anon172_Then_correct  (=> (and (<= 0 i_4) (and (< i_4 (|Seq#Length| b_2)) (and (<= 0 j_2) (and (< j_2 (|Seq#Length| b_2)) (not (= i_4 j_2)))))) (and (=> (= (ControlFlow 0 14) (- 0 18)) (>= i_4 0)) (=> (>= i_4 0) (and (=> (= (ControlFlow 0 14) (- 0 17)) (< i_4 (|Seq#Length| b_2))) (=> (< i_4 (|Seq#Length| b_2)) (and (=> (= (ControlFlow 0 14) (- 0 16)) (>= j_2 0)) (=> (>= j_2 0) (and (=> (= (ControlFlow 0 14) (- 0 15)) (< j_2 (|Seq#Length| b_2))) (=> (< j_2 (|Seq#Length| b_2)) (=> (= (ControlFlow 0 14) 13) anon11_correct))))))))))))
(let ((anon169_Else_correct  (and (=> (= (ControlFlow 0 337) (- 0 338)) (forall ((i_3 Int) (i_3_1 Int) ) (!  (=> (and (and (and (and (not (= i_3 i_3_1)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U i_3))) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U i_3_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| a_2 i_3) (|Seq#Index| a_2 i_3_1))))
 :qid |stdinbpl.751:15|
 :skolemid |59|
))) (=> (forall ((i_3@@0 Int) (i_3_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_3@@0 i_3_1@@0)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U i_3@@0))) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U i_3_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| a_2 i_3@@0) (|Seq#Index| a_2 i_3_1@@0))))
 :qid |stdinbpl.751:15|
 :skolemid |59|
)) (=> (forall ((i_3@@1 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U i_3@@1)) (< NoPerm FullPerm)) (and (qpRange1 (|Seq#Index| a_2 i_3@@1)) (= (invRecv1 (|Seq#Index| a_2 i_3@@1)) i_3@@1)))
 :qid |stdinbpl.757:22|
 :skolemid |60|
 :pattern ( (|Seq#Index| a_2 i_3@@1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U i_3@@1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U i_3@@1)))
 :pattern ( (|Seq#Index| a_2 i_3@@1))
)) (=> (and (forall ((o_3@@68 T@U) ) (!  (=> (= (type o_3@@68) RefType) (=> (and (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U (invRecv1 o_3@@68))) (< NoPerm FullPerm)) (qpRange1 o_3@@68)) (= (|Seq#Index| a_2 (invRecv1 o_3@@68)) o_3@@68)))
 :qid |stdinbpl.761:22|
 :skolemid |61|
 :pattern ( (invRecv1 o_3@@68))
)) (forall ((i_3@@2 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U i_3@@2)) (not (= (|Seq#Index| a_2 i_3@@2) null)))
 :qid |stdinbpl.767:22|
 :skolemid |62|
 :pattern ( (|Seq#Index| a_2 i_3@@2))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U i_3@@2)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U i_3@@2)))
 :pattern ( (|Seq#Index| a_2 i_3@@2))
))) (=> (and (and (forall ((o_3@@69 T@U) ) (!  (=> (= (type o_3@@69) RefType) (and (=> (and (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U (invRecv1 o_3@@69))) (< NoPerm FullPerm)) (qpRange1 o_3@@69)) (and (=> (< NoPerm FullPerm) (= (|Seq#Index| a_2 (invRecv1 o_3@@69)) o_3@@69)) (= (U_2_real (MapType1Select QPMask@0 o_3@@69 Ref__Integer_value)) (+ (U_2_real (MapType1Select ZeroMask o_3@@69 Ref__Integer_value)) FullPerm)))) (=> (not (and (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U (invRecv1 o_3@@69))) (< NoPerm FullPerm)) (qpRange1 o_3@@69))) (= (U_2_real (MapType1Select QPMask@0 o_3@@69 Ref__Integer_value)) (U_2_real (MapType1Select ZeroMask o_3@@69 Ref__Integer_value))))))
 :qid |stdinbpl.773:22|
 :skolemid |63|
 :pattern ( (MapType1Select QPMask@0 o_3@@69 Ref__Integer_value))
)) (forall ((o_3@@70 T@U) (f_5@@22 T@U) ) (! (let ((B@@34 (FieldTypeInv1 (type f_5@@22))))
(let ((A@@35 (FieldTypeInv0 (type f_5@@22))))
 (=> (and (and (= (type o_3@@70) RefType) (= (type f_5@@22) (FieldType A@@35 B@@34))) (not (= f_5@@22 Ref__Integer_value))) (= (U_2_real (MapType1Select ZeroMask o_3@@70 f_5@@22)) (U_2_real (MapType1Select QPMask@0 o_3@@70 f_5@@22))))))
 :qid |stdinbpl.777:29|
 :skolemid |64|
 :pattern ( (MapType1Select ZeroMask o_3@@70 f_5@@22))
 :pattern ( (MapType1Select QPMask@0 o_3@@70 f_5@@22))
))) (and (state Heap@@9 QPMask@0) (state Heap@@9 QPMask@0))) (and (and (=> (= (ControlFlow 0 337) 336) anon171_Else_correct) (=> (= (ControlFlow 0 337) 14) anon172_Then_correct)) (=> (= (ControlFlow 0 337) 19) anon172_Else_correct)))))))))
(let ((anon7_correct true))
(let ((anon170_Else_correct  (=> (and (not (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U i_2))) (= (ControlFlow 0 12) 8)) anon7_correct)))
(let ((anon170_Then_correct  (=> (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| a_2)) (int_2_U i_2)) (and (=> (= (ControlFlow 0 9) (- 0 11)) (>= i_2 0)) (=> (>= i_2 0) (and (=> (= (ControlFlow 0 9) (- 0 10)) (< i_2 (|Seq#Length| a_2))) (=> (< i_2 (|Seq#Length| a_2)) (=> (= (ControlFlow 0 9) 8) anon7_correct))))))))
(let ((anon167_Else_correct  (=> (and (forall ((i_1 Int) (j_1 Int) ) (!  (=> (and (<= 0 i_1) (and (< i_1 (|Seq#Length| a_2)) (and (<= 0 j_1) (and (< j_1 (|Seq#Length| a_2)) (not (= i_1 j_1)))))) (not (= (|Seq#Index| a_2 i_1) (|Seq#Index| a_2 j_1))))
 :qid |stdinbpl.733:20|
 :skolemid |58|
 :pattern ( (|Seq#Index| a_2 i_1) (|Seq#Index| a_2 j_1))
)) (state Heap@@9 ZeroMask)) (and (and (=> (= (ControlFlow 0 339) 337) anon169_Else_correct) (=> (= (ControlFlow 0 339) 9) anon170_Then_correct)) (=> (= (ControlFlow 0 339) 12) anon170_Else_correct)))))
(let ((anon3_correct true))
(let ((anon168_Else_correct  (=> (and (not (and (<= 0 i@@6) (and (< i@@6 (|Seq#Length| a_2)) (and (<= 0 j@@5) (and (< j@@5 (|Seq#Length| a_2)) (not (= i@@6 j@@5))))))) (= (ControlFlow 0 7) 1)) anon3_correct)))
(let ((anon168_Then_correct  (=> (and (<= 0 i@@6) (and (< i@@6 (|Seq#Length| a_2)) (and (<= 0 j@@5) (and (< j@@5 (|Seq#Length| a_2)) (not (= i@@6 j@@5)))))) (and (=> (= (ControlFlow 0 2) (- 0 6)) (>= i@@6 0)) (=> (>= i@@6 0) (and (=> (= (ControlFlow 0 2) (- 0 5)) (< i@@6 (|Seq#Length| a_2))) (=> (< i@@6 (|Seq#Length| a_2)) (and (=> (= (ControlFlow 0 2) (- 0 4)) (>= j@@5 0)) (=> (>= j@@5 0) (and (=> (= (ControlFlow 0 2) (- 0 3)) (< j@@5 (|Seq#Length| a_2))) (=> (< j@@5 (|Seq#Length| a_2)) (=> (= (ControlFlow 0 2) 1) anon3_correct))))))))))))
(let ((anon0_correct  (=> (and (and (and (state Heap@@9 ZeroMask) (U_2_bool (MapType0Select Heap@@9 diz $allocated))) (and (not (= diz null)) (state Heap@@9 ZeroMask))) (and (and (= (|Seq#Length| a_2) (|Seq#Length| b_2)) (state Heap@@9 ZeroMask)) (and (= (|Seq#Length| res) (* 2 (|Seq#Length| a_2))) (state Heap@@9 ZeroMask)))) (and (and (=> (= (ControlFlow 0 340) 339) anon167_Else_correct) (=> (= (ControlFlow 0 340) 2) anon168_Then_correct)) (=> (= (ControlFlow 0 340) 7) anon168_Else_correct)))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 341) 340) anon0_correct)))
PreconditionGeneratedEntry_correct))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
))
(check-sat)
