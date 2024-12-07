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
))) (= (Ctor NormalFieldType) 7)) (= (type $allocated) (FieldType NormalFieldType boolType))) (= (type f_7) (FieldType NormalFieldType intType))))
(assert (distinct $allocated f_7)
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
 :qid |stdinbpl.388:18|
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
 :qid |stdinbpl.409:18|
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
 :qid |stdinbpl.364:18|
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
 :qid |stdinbpl.375:18|
 :skolemid |36|
 :pattern ( (|Seq#Length| (|Seq#Take| s@@2 n@@2)))
 :pattern ( (|Seq#Take| s@@2 n@@2) (|Seq#Length| s@@2))
)))
(assert (forall ((arg0@@31 Int) (arg1@@13 Int) ) (! (= (type (|Seq#Range| arg0@@31 arg1@@13)) (SeqType intType))
 :qid |funType:Seq#Range|
 :pattern ( (|Seq#Range| arg0@@31 arg1@@13))
)))
(assert (forall ((q@min Int) (q@max Int) (v@@0 T@U) ) (!  (=> (= (type v@@0) intType) (= (|Seq#Contains| (|Seq#Range| q@min q@max) v@@0)  (and (<= q@min (U_2_int v@@0)) (< (U_2_int v@@0) q@max))))
 :qid |stdinbpl.648:15|
 :skolemid |57|
 :pattern ( (|Seq#Contains| (|Seq#Range| q@min q@max) v@@0))
)))
(assert (forall ((s@@3 T@U) (x@@8 T@U) ) (! (let ((T@@7 (type x@@8)))
 (=> (and (= (type s@@3) (SeqType T@@7)) (|Seq#Contains| s@@3 x@@8)) (and (and (<= 0 (|Seq#Skolem| s@@3 x@@8)) (< (|Seq#Skolem| s@@3 x@@8) (|Seq#Length| s@@3))) (= (|Seq#Index| s@@3 (|Seq#Skolem| s@@3 x@@8)) x@@8))))
 :qid |stdinbpl.506:18|
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
 :qid |stdinbpl.490:18|
 :skolemid |45|
 :pattern ( (|Seq#Drop| s@@4 n@@3))
)))
(assert (forall ((i@@0 Int) (j@@0 Int) ) (! (= (|Seq#Sub| i@@0 j@@0) (- i@@0 j@@0))
 :qid |stdinbpl.344:15|
 :skolemid |30|
 :pattern ( (|Seq#Sub| i@@0 j@@0))
)))
(assert (forall ((i@@1 Int) (j@@1 Int) ) (! (= (|Seq#Add| i@@1 j@@1) (+ i@@1 j@@1))
 :qid |stdinbpl.342:15|
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
 :qid |stdinbpl.631:18|
 :skolemid |54|
 :pattern ( (|Seq#Contains| (|Seq#Singleton| x@@9) y@@1))
)))
(assert (forall ((s@@5 T@U) (n@@4 Int) (j@@2 Int) ) (! (let ((T@@11 (SeqTypeInv0 (type s@@5))))
 (=> (= (type s@@5) (SeqType T@@11)) (=> (and (and (<= 0 j@@2) (< j@@2 n@@4)) (< j@@2 (|Seq#Length| s@@5))) (= (|Seq#Index| (|Seq#Take| s@@5 n@@4) j@@2) (|Seq#Index| s@@5 j@@2)))))
 :qid |stdinbpl.383:18|
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
 :qid |stdinbpl.287:19|
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
 :qid |stdinbpl.355:18|
 :skolemid |32|
 :pattern ( (|Seq#Index| (|Seq#Append| s0 s1) n@@5))
)))
(assert  (not (IsPredicateField f_7)))
(assert  (not (IsWandField f_7)))
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
 :qid |stdinbpl.275:15|
 :skolemid |19|
 :pattern ( (ConditionalFrame p@@0 f_6))
)))
(assert (forall ((q@min@@0 Int) (q@max@@0 Int) (j@@3 Int) ) (!  (=> (and (<= 0 j@@3) (< j@@3 (- q@max@@0 q@min@@0))) (= (U_2_int (|Seq#Index| (|Seq#Range| q@min@@0 q@max@@0) j@@3)) (+ q@min@@0 j@@3)))
 :qid |stdinbpl.646:15|
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
 :qid |stdinbpl.324:18|
 :skolemid |26|
 :pattern ( (|Seq#Length| (|Seq#Append| s0@@0 s1@@0)))
)))
(assert (forall ((s@@6 T@U) (t T@U) (n@@6 Int) ) (! (let ((T@@17 (SeqTypeInv0 (type s@@6))))
 (=> (and (and (= (type s@@6) (SeqType T@@17)) (= (type t) (SeqType T@@17))) (and (> n@@6 0) (> n@@6 (|Seq#Length| s@@6)))) (and (= (|Seq#Add| (|Seq#Sub| n@@6 (|Seq#Length| s@@6)) (|Seq#Length| s@@6)) n@@6) (= (|Seq#Drop| (|Seq#Append| s@@6 t) n@@6) (|Seq#Drop| t (|Seq#Sub| n@@6 (|Seq#Length| s@@6)))))))
 :qid |stdinbpl.480:18|
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
 :qid |stdinbpl.467:18|
 :skolemid |42|
 :pattern ( (|Seq#Take| (|Seq#Append| s@@7 t@@0) n@@7))
)))
(assert (forall ((q@min@@1 Int) (q@max@@1 Int) ) (!  (and (=> (< q@min@@1 q@max@@1) (= (|Seq#Length| (|Seq#Range| q@min@@1 q@max@@1)) (- q@max@@1 q@min@@1))) (=> (<= q@max@@1 q@min@@1) (= (|Seq#Length| (|Seq#Range| q@min@@1 q@max@@1)) 0)))
 :qid |stdinbpl.645:15|
 :skolemid |55|
 :pattern ( (|Seq#Length| (|Seq#Range| q@min@@1 q@max@@1)))
)))
(assert (forall ((a T@U) (b T@U) ) (! (let ((T@@19 (SeqTypeInv0 (type a))))
 (=> (and (and (= (type a) (SeqType T@@19)) (= (type b) (SeqType T@@19))) (|Seq#Equal| a b)) (= a b)))
 :qid |stdinbpl.618:18|
 :skolemid |53|
 :pattern ( (|Seq#Equal| a b))
)))
(assert (forall ((s@@8 T@U) (i@@2 Int) ) (! (let ((T@@20 (SeqTypeInv0 (type s@@8))))
 (=> (= (type s@@8) (SeqType T@@20)) (=> (and (<= 0 i@@2) (< i@@2 (|Seq#Length| s@@8))) (|Seq#ContainsTrigger| s@@8 (|Seq#Index| s@@8 i@@2)))))
 :qid |stdinbpl.511:18|
 :skolemid |49|
 :pattern ( (|Seq#Index| s@@8 i@@2))
)))
(assert (forall ((s0@@1 T@U) (s1@@1 T@U) ) (! (let ((T@@21 (SeqTypeInv0 (type s0@@1))))
 (=> (and (= (type s0@@1) (SeqType T@@21)) (= (type s1@@1) (SeqType T@@21))) (and (=> (= s0@@1 (|Seq#Empty| T@@21)) (= (|Seq#Append| s0@@1 s1@@1) s1@@1)) (=> (= s1@@1 (|Seq#Empty| T@@21)) (= (|Seq#Append| s0@@1 s1@@1) s0@@1)))))
 :qid |stdinbpl.330:18|
 :skolemid |27|
 :pattern ( (|Seq#Append| s0@@1 s1@@1))
)))
(assert (forall ((t@@1 T@U) ) (! (= (|Seq#Index| (|Seq#Singleton| t@@1) 0) t@@1)
 :qid |stdinbpl.334:18|
 :skolemid |28|
 :pattern ( (|Seq#Singleton| t@@1))
)))
(assert (forall ((s@@9 T@U) ) (! (let ((T@@22 (SeqTypeInv0 (type s@@9))))
 (=> (= (type s@@9) (SeqType T@@22)) (<= 0 (|Seq#Length| s@@9))))
 :qid |stdinbpl.313:18|
 :skolemid |22|
 :pattern ( (|Seq#Length| s@@9))
)))
(assert (forall ((s0@@2 T@U) (s1@@2 T@U) ) (! (let ((T@@23 (SeqTypeInv0 (type s0@@2))))
 (=> (and (and (= (type s0@@2) (SeqType T@@23)) (= (type s1@@2) (SeqType T@@23))) (|Seq#Equal| s0@@2 s1@@2)) (and (= (|Seq#Length| s0@@2) (|Seq#Length| s1@@2)) (forall ((j@@4 Int) ) (!  (=> (and (<= 0 j@@4) (< j@@4 (|Seq#Length| s0@@2))) (= (|Seq#Index| s0@@2 j@@4) (|Seq#Index| s1@@2 j@@4)))
 :qid |stdinbpl.608:13|
 :skolemid |50|
 :pattern ( (|Seq#Index| s0@@2 j@@4))
 :pattern ( (|Seq#Index| s1@@2 j@@4))
)))))
 :qid |stdinbpl.605:18|
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
 :qid |stdinbpl.321:18|
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
 :qid |stdinbpl.463:18|
 :skolemid |41|
 :pattern ( (|Seq#Take| (|Seq#Append| s@@10 t@@3) n@@8))
)))
(assert (forall ((s@@11 T@U) (i@@3 Int) (v@@1 T@U) ) (! (let ((T@@25 (type v@@1)))
 (=> (= (type s@@11) (SeqType T@@25)) (=> (and (<= 0 i@@3) (< i@@3 (|Seq#Length| s@@11))) (= (|Seq#Length| (|Seq#Update| s@@11 i@@3 v@@1)) (|Seq#Length| s@@11)))))
 :qid |stdinbpl.362:18|
 :skolemid |34|
 :pattern ( (|Seq#Length| (|Seq#Update| s@@11 i@@3 v@@1)))
 :pattern ( (|Seq#Length| s@@11) (|Seq#Update| s@@11 i@@3 v@@1))
)))
(assert (forall ((s@@12 T@U) (t@@4 T@U) (n@@9 Int) ) (! (let ((T@@26 (SeqTypeInv0 (type s@@12))))
 (=> (and (and (= (type s@@12) (SeqType T@@26)) (= (type t@@4) (SeqType T@@26))) (and (< 0 n@@9) (<= n@@9 (|Seq#Length| s@@12)))) (= (|Seq#Drop| (|Seq#Append| s@@12 t@@4) n@@9) (|Seq#Append| (|Seq#Drop| s@@12 n@@9) t@@4))))
 :qid |stdinbpl.476:18|
 :skolemid |43|
 :pattern ( (|Seq#Drop| (|Seq#Append| s@@12 t@@4) n@@9))
)))
(assert (forall ((s@@13 T@U) (n@@10 Int) (i@@4 Int) ) (! (let ((T@@27 (SeqTypeInv0 (type s@@13))))
 (=> (= (type s@@13) (SeqType T@@27)) (=> (and (and (< 0 n@@10) (<= n@@10 i@@4)) (< i@@4 (|Seq#Length| s@@13))) (and (= (|Seq#Add| (|Seq#Sub| i@@4 n@@10) n@@10) i@@4) (= (|Seq#Index| (|Seq#Drop| s@@13 n@@10) (|Seq#Sub| i@@4 n@@10)) (|Seq#Index| s@@13 i@@4))))))
 :qid |stdinbpl.413:18|
 :skolemid |40|
 :pattern ( (|Seq#Drop| s@@13 n@@10) (|Seq#Index| s@@13 i@@4))
)))
(assert (forall ((s0@@3 T@U) (s1@@3 T@U) (n@@11 Int) ) (! (let ((T@@28 (SeqTypeInv0 (type s0@@3))))
 (=> (and (= (type s0@@3) (SeqType T@@28)) (= (type s1@@3) (SeqType T@@28))) (=> (and (and (and (not (= s0@@3 (|Seq#Empty| T@@28))) (not (= s1@@3 (|Seq#Empty| T@@28)))) (<= 0 n@@11)) (< n@@11 (|Seq#Length| s0@@3))) (= (|Seq#Index| (|Seq#Append| s0@@3 s1@@3) n@@11) (|Seq#Index| s0@@3 n@@11)))))
 :qid |stdinbpl.353:18|
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
 :qid |stdinbpl.358:18|
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
 :qid |stdinbpl.509:18|
 :skolemid |48|
 :pattern ( (|Seq#Contains| s@@14 x@@10) (|Seq#Index| s@@14 i@@5))
)))
(assert (forall ((s0@@5 T@U) (s1@@5 T@U) ) (! (let ((T@@31 (SeqTypeInv0 (type s0@@5))))
 (=> (and (= (type s0@@5) (SeqType T@@31)) (= (type s1@@5) (SeqType T@@31))) (or (or (and (= s0@@5 s1@@5) (|Seq#Equal| s0@@5 s1@@5)) (and (and (not (= s0@@5 s1@@5)) (not (|Seq#Equal| s0@@5 s1@@5))) (not (= (|Seq#Length| s0@@5) (|Seq#Length| s1@@5))))) (and (and (and (and (and (and (not (= s0@@5 s1@@5)) (not (|Seq#Equal| s0@@5 s1@@5))) (= (|Seq#Length| s0@@5) (|Seq#Length| s1@@5))) (= (|Seq#SkolemDiff| s0@@5 s1@@5) (|Seq#SkolemDiff| s1@@5 s0@@5))) (<= 0 (|Seq#SkolemDiff| s0@@5 s1@@5))) (< (|Seq#SkolemDiff| s0@@5 s1@@5) (|Seq#Length| s0@@5))) (not (= (|Seq#Index| s0@@5 (|Seq#SkolemDiff| s0@@5 s1@@5)) (|Seq#Index| s1@@5 (|Seq#SkolemDiff| s0@@5 s1@@5))))))))
 :qid |stdinbpl.613:18|
 :skolemid |52|
 :pattern ( (|Seq#Equal| s0@@5 s1@@5))
)))
(assert (forall ((p@@1 T@U) (v_1@@0 T@U) (q T@U) (w@@0 T@U) (r T@U) (u T@U) ) (! (let ((C@@3 (FieldTypeInv0 (type r))))
(let ((B@@10 (FieldTypeInv0 (type q))))
(let ((A@@11 (FieldTypeInv0 (type p@@1))))
 (=> (and (and (and (and (and (and (= (type p@@1) (FieldType A@@11 FrameTypeType)) (= (type v_1@@0) FrameTypeType)) (= (type q) (FieldType B@@10 FrameTypeType))) (= (type w@@0) FrameTypeType)) (= (type r) (FieldType C@@3 FrameTypeType))) (= (type u) FrameTypeType)) (and (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))) (InsidePredicate p@@1 v_1@@0 r u)))))
 :qid |stdinbpl.282:25|
 :skolemid |20|
 :pattern ( (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))
)))
(assert (forall ((s@@15 T@U) ) (! (let ((T@@32 (SeqTypeInv0 (type s@@15))))
 (=> (and (= (type s@@15) (SeqType T@@32)) (= (|Seq#Length| s@@15) 0)) (= s@@15 (|Seq#Empty| T@@32))))
 :qid |stdinbpl.317:18|
 :skolemid |24|
 :pattern ( (|Seq#Length| s@@15))
)))
(assert (forall ((s@@16 T@U) (n@@12 Int) ) (! (let ((T@@33 (SeqTypeInv0 (type s@@16))))
 (=> (and (= (type s@@16) (SeqType T@@33)) (<= n@@12 0)) (= (|Seq#Take| s@@16 n@@12) (|Seq#Empty| T@@33))))
 :qid |stdinbpl.492:18|
 :skolemid |46|
 :pattern ( (|Seq#Take| s@@16 n@@12))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun xs2 () T@U)
(declare-fun i_52 () Int)
(declare-fun j_27 () Int)
(declare-fun dummyFunction (T@U) Bool)
(declare-fun ExhaleHeap@11 () T@U)
(declare-fun arg_p_12@0 () Real)
(declare-fun neverTriggered35 (Int) Bool)
(declare-fun QPMask@24 () T@U)
(declare-fun xs3 () T@U)
(declare-fun ExhaleHeap@10 () T@U)
(declare-fun arg_p_11@0 () Real)
(declare-fun neverTriggered34 (Int) Bool)
(declare-fun QPMask@23 () T@U)
(declare-fun qpRange34 (T@U) Bool)
(declare-fun invRecv34 (T@U) Int)
(declare-fun i_49 () Int)
(declare-fun j_25 () Int)
(declare-fun xs1 () T@U)
(declare-fun ExhaleHeap@9 () T@U)
(declare-fun arg_p_10@0 () Real)
(declare-fun neverTriggered33 (Int) Bool)
(declare-fun QPMask@22 () T@U)
(declare-fun qpRange33 (T@U) Bool)
(declare-fun invRecv33 (T@U) Int)
(declare-fun i_46 () Int)
(declare-fun j_23 () Int)
(declare-fun ExhaleHeap@8 () T@U)
(declare-fun arg_p_9@0 () Real)
(declare-fun neverTriggered30 (Int) Bool)
(declare-fun QPMask@19 () T@U)
(declare-fun qpRange30 (T@U) Bool)
(declare-fun invRecv30 (T@U) Int)
(declare-fun QPMask@20 () T@U)
(declare-fun arg_q_4@0 () Real)
(declare-fun qpRange31 (T@U) Bool)
(declare-fun invRecv31 (T@U) Int)
(declare-fun QPMask@21 () T@U)
(declare-fun qpRange32 (T@U) Bool)
(declare-fun invRecv32 (T@U) Int)
(declare-fun i_41 () Int)
(declare-fun j_21 () Int)
(declare-fun ExhaleHeap@7 () T@U)
(declare-fun arg_p_8@0 () Real)
(declare-fun neverTriggered29 (Int) Bool)
(declare-fun QPMask@18 () T@U)
(declare-fun qpRange29 (T@U) Bool)
(declare-fun invRecv29 (T@U) Int)
(declare-fun i_38 () Int)
(declare-fun j_19 () Int)
(declare-fun ExhaleHeap@6 () T@U)
(declare-fun arg_p_7@0 () Real)
(declare-fun neverTriggered28 (Int) Bool)
(declare-fun QPMask@17 () T@U)
(declare-fun qpRange28 (T@U) Bool)
(declare-fun invRecv28 (T@U) Int)
(declare-fun i_35 () Int)
(declare-fun j_17 () Int)
(declare-fun ExhaleHeap@5 () T@U)
(declare-fun arg_p_6@0 () Real)
(declare-fun neverTriggered25 (Int) Bool)
(declare-fun QPMask@14 () T@U)
(declare-fun qpRange25 (T@U) Bool)
(declare-fun invRecv25 (T@U) Int)
(declare-fun QPMask@15 () T@U)
(declare-fun arg_q_3@0 () Real)
(declare-fun qpRange26 (T@U) Bool)
(declare-fun invRecv26 (T@U) Int)
(declare-fun QPMask@16 () T@U)
(declare-fun qpRange27 (T@U) Bool)
(declare-fun invRecv27 (T@U) Int)
(declare-fun i_30 () Int)
(declare-fun j_15 () Int)
(declare-fun ExhaleHeap@4 () T@U)
(declare-fun arg_p_5@0 () Real)
(declare-fun neverTriggered24 (Int) Bool)
(declare-fun QPMask@13 () T@U)
(declare-fun qpRange24 (T@U) Bool)
(declare-fun invRecv24 (T@U) Int)
(declare-fun i_27 () Int)
(declare-fun j_13 () Int)
(declare-fun ExhaleHeap@3 () T@U)
(declare-fun arg_p_4@0 () Real)
(declare-fun neverTriggered23 (Int) Bool)
(declare-fun QPMask@12 () T@U)
(declare-fun qpRange23 (T@U) Bool)
(declare-fun invRecv23 (T@U) Int)
(declare-fun i_24_1 () Int)
(declare-fun j_11 () Int)
(declare-fun ExhaleHeap@2 () T@U)
(declare-fun arg_p_3@0 () Real)
(declare-fun neverTriggered22 (Int) Bool)
(declare-fun QPMask@11 () T@U)
(declare-fun qpRange22 (T@U) Bool)
(declare-fun invRecv22 (T@U) Int)
(declare-fun i_21_1 () Int)
(declare-fun j_9 () Int)
(declare-fun ExhaleHeap@1 () T@U)
(declare-fun neverTriggered19 (Int) Bool)
(declare-fun QPMask@8 () T@U)
(declare-fun qpRange19 (T@U) Bool)
(declare-fun invRecv19 (T@U) Int)
(declare-fun QPMask@9 () T@U)
(declare-fun arg_q_2@0 () Real)
(declare-fun qpRange20 (T@U) Bool)
(declare-fun invRecv20 (T@U) Int)
(declare-fun QPMask@10 () T@U)
(declare-fun qpRange21 (T@U) Bool)
(declare-fun invRecv21 (T@U) Int)
(declare-fun i_16_1 () Int)
(declare-fun j_7 () Int)
(declare-fun ExhaleHeap@0 () T@U)
(declare-fun arg_p_1@0 () Real)
(declare-fun neverTriggered16 (Int) Bool)
(declare-fun QPMask@5 () T@U)
(declare-fun qpRange16 (T@U) Bool)
(declare-fun invRecv16 (T@U) Int)
(declare-fun QPMask@6 () T@U)
(declare-fun arg_q_1@0 () Real)
(declare-fun qpRange17 (T@U) Bool)
(declare-fun invRecv17 (T@U) Int)
(declare-fun QPMask@7 () T@U)
(declare-fun qpRange18 (T@U) Bool)
(declare-fun invRecv18 (T@U) Int)
(declare-fun i_11_1 () Int)
(declare-fun j_5 () Int)
(declare-fun Heap@@9 () T@U)
(declare-fun neverTriggered13 (Int) Bool)
(declare-fun QPMask@2 () T@U)
(declare-fun qpRange13 (T@U) Bool)
(declare-fun invRecv13 (T@U) Int)
(declare-fun QPMask@3 () T@U)
(declare-fun arg_q@0 () Real)
(declare-fun qpRange14 (T@U) Bool)
(declare-fun invRecv14 (T@U) Int)
(declare-fun QPMask@4 () T@U)
(declare-fun qpRange15 (T@U) Bool)
(declare-fun invRecv15 (T@U) Int)
(declare-fun i_6 () Int)
(declare-fun j_3_2 () Int)
(declare-fun qpRange10 (T@U) Bool)
(declare-fun invRecv10 (T@U) Int)
(declare-fun QPMask@0 () T@U)
(declare-fun qpRange11 (T@U) Bool)
(declare-fun invRecv11 (T@U) Int)
(declare-fun QPMask@1 () T@U)
(declare-fun qpRange12 (T@U) Bool)
(declare-fun invRecv12 (T@U) Int)
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (= (type xs1) (SeqType RefType)) (= (type xs2) (SeqType RefType))) (= (type xs3) (SeqType RefType))) (= (type ExhaleHeap@11) (MapType0Type RefType))) (= (type QPMask@24) (MapType1Type RefType realType))) (= (type ExhaleHeap@10) (MapType0Type RefType))) (= (type QPMask@23) (MapType1Type RefType realType))) (= (type ExhaleHeap@9) (MapType0Type RefType))) (= (type QPMask@22) (MapType1Type RefType realType))) (= (type ExhaleHeap@8) (MapType0Type RefType))) (= (type QPMask@19) (MapType1Type RefType realType))) (= (type QPMask@20) (MapType1Type RefType realType))) (= (type QPMask@21) (MapType1Type RefType realType))) (= (type ExhaleHeap@7) (MapType0Type RefType))) (= (type QPMask@18) (MapType1Type RefType realType))) (= (type ExhaleHeap@6) (MapType0Type RefType))) (= (type QPMask@17) (MapType1Type RefType realType))) (= (type ExhaleHeap@5) (MapType0Type RefType))) (= (type QPMask@14) (MapType1Type RefType realType))) (= (type QPMask@15) (MapType1Type RefType realType))) (= (type QPMask@16) (MapType1Type RefType realType))) (= (type ExhaleHeap@4) (MapType0Type RefType))) (= (type QPMask@13) (MapType1Type RefType realType))) (= (type ExhaleHeap@3) (MapType0Type RefType))) (= (type QPMask@12) (MapType1Type RefType realType))) (= (type ExhaleHeap@2) (MapType0Type RefType))) (= (type QPMask@11) (MapType1Type RefType realType))) (= (type ExhaleHeap@1) (MapType0Type RefType))) (= (type QPMask@8) (MapType1Type RefType realType))) (= (type QPMask@9) (MapType1Type RefType realType))) (= (type QPMask@10) (MapType1Type RefType realType))) (= (type ExhaleHeap@0) (MapType0Type RefType))) (= (type QPMask@5) (MapType1Type RefType realType))) (= (type QPMask@6) (MapType1Type RefType realType))) (= (type QPMask@7) (MapType1Type RefType realType))) (= (type Heap@@9) (MapType0Type RefType))) (= (type QPMask@2) (MapType1Type RefType realType))) (= (type QPMask@3) (MapType1Type RefType realType))) (= (type QPMask@4) (MapType1Type RefType realType))) (= (type QPMask@0) (MapType1Type RefType realType))) (= (type QPMask@1) (MapType1Type RefType realType))))
(set-info :boogie-vc-id test01)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 147) (let ((anon51_correct true))
(let ((anon78_Else_correct  (=> (and (not (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_52)) (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U j_27)) (not (= i_52 j_27))))) (= (ControlFlow 0 56) 53)) anon51_correct)))
(let ((anon78_Then_correct  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_52)) (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U j_27)) (not (= i_52 j_27)))) (and (=> (= (ControlFlow 0 54) (- 0 55)) (not (= (|Seq#Index| xs2 i_52) (|Seq#Index| xs2 j_27)))) (=> (not (= (|Seq#Index| xs2 i_52) (|Seq#Index| xs2 j_27))) (=> (= (ControlFlow 0 54) 53) anon51_correct))))))
(let ((anon77_Else_correct  (=> (forall ((i_53_1 Int) (j_28_1 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_53_1)) (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U j_28_1)) (not (= i_53_1 j_28_1)))) (not (= (|Seq#Index| xs2 i_53_1) (|Seq#Index| xs2 j_28_1))))
 :qid |stdinbpl.2875:22|
 :skolemid |310|
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_53_1)) (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U j_28_1)))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_53_1)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U j_28_1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_53_1)) (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U j_28_1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_53_1)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U j_28_1)))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_53_1)) (|Seq#Index| xs2 j_28_1))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_53_1)) (|Seq#Index| xs2 j_28_1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U j_28_1)) (|Seq#Index| xs2 i_53_1))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U j_28_1)) (|Seq#Index| xs2 i_53_1))
 :pattern ( (|Seq#Index| xs2 i_53_1) (|Seq#Index| xs2 j_28_1))
)) (and (=> (= (ControlFlow 0 50) (- 0 52)) (forall ((i_54 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_54)) (dummyFunction (MapType0Select ExhaleHeap@11 (|Seq#Index| xs2 i_54) f_7))) (>= arg_p_12@0 NoPerm))
 :qid |stdinbpl.2883:19|
 :skolemid |311|
 :pattern ( (|Seq#Index| xs2 i_54))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_54)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_54)))
 :pattern ( (|Seq#Index| xs2 i_54))
))) (=> (forall ((i_54@@0 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_54@@0)) (dummyFunction (MapType0Select ExhaleHeap@11 (|Seq#Index| xs2 i_54@@0) f_7))) (>= arg_p_12@0 NoPerm))
 :qid |stdinbpl.2883:19|
 :skolemid |311|
 :pattern ( (|Seq#Index| xs2 i_54@@0))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_54@@0)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_54@@0)))
 :pattern ( (|Seq#Index| xs2 i_54@@0))
)) (and (=> (= (ControlFlow 0 50) (- 0 51)) (forall ((i_54@@1 Int) (i_54_1 Int) ) (!  (=> (and (and (and (and (not (= i_54@@1 i_54_1)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_54@@1))) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_54_1))) (< NoPerm arg_p_12@0)) (< NoPerm arg_p_12@0)) (not (= (|Seq#Index| xs2 i_54@@1) (|Seq#Index| xs2 i_54_1))))
 :qid |stdinbpl.2890:19|
 :skolemid |312|
 :pattern ( (neverTriggered35 i_54@@1) (neverTriggered35 i_54_1))
))) (=> (forall ((i_54@@2 Int) (i_54_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_54@@2 i_54_1@@0)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_54@@2))) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_54_1@@0))) (< NoPerm arg_p_12@0)) (< NoPerm arg_p_12@0)) (not (= (|Seq#Index| xs2 i_54@@2) (|Seq#Index| xs2 i_54_1@@0))))
 :qid |stdinbpl.2890:19|
 :skolemid |312|
 :pattern ( (neverTriggered35 i_54@@2) (neverTriggered35 i_54_1@@0))
)) (=> (= (ControlFlow 0 50) (- 0 49)) (forall ((i_54@@3 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_54@@3)) (>= (U_2_real (MapType1Select QPMask@24 (|Seq#Index| xs2 i_54@@3) f_7)) arg_p_12@0))
 :qid |stdinbpl.2897:19|
 :skolemid |313|
 :pattern ( (|Seq#Index| xs2 i_54@@3))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_54@@3)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_54@@3)))
 :pattern ( (|Seq#Index| xs2 i_54@@3))
))))))))))
(let ((anon75_Else_correct  (=> (forall ((i_50_1 Int) (j_26_1 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_50_1)) (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U j_26_1)) (not (= i_50_1 j_26_1)))) (not (= (|Seq#Index| xs3 i_50_1) (|Seq#Index| xs3 j_26_1))))
 :qid |stdinbpl.2800:22|
 :skolemid |302|
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_50_1)) (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U j_26_1)))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_50_1)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U j_26_1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_50_1)) (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U j_26_1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_50_1)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U j_26_1)))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_50_1)) (|Seq#Index| xs3 j_26_1))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_50_1)) (|Seq#Index| xs3 j_26_1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U j_26_1)) (|Seq#Index| xs3 i_50_1))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U j_26_1)) (|Seq#Index| xs3 i_50_1))
 :pattern ( (|Seq#Index| xs3 i_50_1) (|Seq#Index| xs3 j_26_1))
)) (and (=> (= (ControlFlow 0 57) (- 0 61)) (forall ((i_51 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_51)) (dummyFunction (MapType0Select ExhaleHeap@10 (|Seq#Index| xs3 i_51) f_7))) (>= arg_p_11@0 NoPerm))
 :qid |stdinbpl.2808:19|
 :skolemid |303|
 :pattern ( (|Seq#Index| xs3 i_51))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_51)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_51)))
 :pattern ( (|Seq#Index| xs3 i_51))
))) (=> (forall ((i_51@@0 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_51@@0)) (dummyFunction (MapType0Select ExhaleHeap@10 (|Seq#Index| xs3 i_51@@0) f_7))) (>= arg_p_11@0 NoPerm))
 :qid |stdinbpl.2808:19|
 :skolemid |303|
 :pattern ( (|Seq#Index| xs3 i_51@@0))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_51@@0)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_51@@0)))
 :pattern ( (|Seq#Index| xs3 i_51@@0))
)) (and (=> (= (ControlFlow 0 57) (- 0 60)) (forall ((i_51@@1 Int) (i_51_1 Int) ) (!  (=> (and (and (and (and (not (= i_51@@1 i_51_1)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_51@@1))) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_51_1))) (< NoPerm arg_p_11@0)) (< NoPerm arg_p_11@0)) (not (= (|Seq#Index| xs3 i_51@@1) (|Seq#Index| xs3 i_51_1))))
 :qid |stdinbpl.2815:19|
 :skolemid |304|
 :pattern ( (neverTriggered34 i_51@@1) (neverTriggered34 i_51_1))
))) (=> (forall ((i_51@@2 Int) (i_51_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_51@@2 i_51_1@@0)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_51@@2))) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_51_1@@0))) (< NoPerm arg_p_11@0)) (< NoPerm arg_p_11@0)) (not (= (|Seq#Index| xs3 i_51@@2) (|Seq#Index| xs3 i_51_1@@0))))
 :qid |stdinbpl.2815:19|
 :skolemid |304|
 :pattern ( (neverTriggered34 i_51@@2) (neverTriggered34 i_51_1@@0))
)) (and (=> (= (ControlFlow 0 57) (- 0 59)) (forall ((i_51@@3 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_51@@3)) (>= (U_2_real (MapType1Select QPMask@23 (|Seq#Index| xs3 i_51@@3) f_7)) arg_p_11@0))
 :qid |stdinbpl.2822:19|
 :skolemid |305|
 :pattern ( (|Seq#Index| xs3 i_51@@3))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_51@@3)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_51@@3)))
 :pattern ( (|Seq#Index| xs3 i_51@@3))
))) (=> (forall ((i_51@@4 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_51@@4)) (>= (U_2_real (MapType1Select QPMask@23 (|Seq#Index| xs3 i_51@@4) f_7)) arg_p_11@0))
 :qid |stdinbpl.2822:19|
 :skolemid |305|
 :pattern ( (|Seq#Index| xs3 i_51@@4))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_51@@4)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_51@@4)))
 :pattern ( (|Seq#Index| xs3 i_51@@4))
)) (=> (and (and (and (forall ((i_51@@5 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_51@@5)) (< NoPerm arg_p_11@0)) (and (qpRange34 (|Seq#Index| xs3 i_51@@5)) (= (invRecv34 (|Seq#Index| xs3 i_51@@5)) i_51@@5)))
 :qid |stdinbpl.2828:24|
 :skolemid |306|
 :pattern ( (|Seq#Index| xs3 i_51@@5))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_51@@5)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_51@@5)))
 :pattern ( (|Seq#Index| xs3 i_51@@5))
)) (forall ((o_3 T@U) ) (!  (=> (= (type o_3) RefType) (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U (invRecv34 o_3))) (and (< NoPerm arg_p_11@0) (qpRange34 o_3))) (= (|Seq#Index| xs3 (invRecv34 o_3)) o_3)))
 :qid |stdinbpl.2832:24|
 :skolemid |307|
 :pattern ( (invRecv34 o_3))
))) (and (forall ((o_3@@0 T@U) ) (!  (=> (= (type o_3@@0) RefType) (and (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U (invRecv34 o_3@@0))) (and (< NoPerm arg_p_11@0) (qpRange34 o_3@@0))) (and (= (|Seq#Index| xs3 (invRecv34 o_3@@0)) o_3@@0) (= (U_2_real (MapType1Select QPMask@24 o_3@@0 f_7)) (- (U_2_real (MapType1Select QPMask@23 o_3@@0 f_7)) arg_p_11@0)))) (=> (not (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U (invRecv34 o_3@@0))) (and (< NoPerm arg_p_11@0) (qpRange34 o_3@@0)))) (= (U_2_real (MapType1Select QPMask@24 o_3@@0 f_7)) (U_2_real (MapType1Select QPMask@23 o_3@@0 f_7))))))
 :qid |stdinbpl.2838:24|
 :skolemid |308|
 :pattern ( (MapType1Select QPMask@24 o_3@@0 f_7))
)) (forall ((o_3@@1 T@U) (f_5 T@U) ) (! (let ((B@@11 (FieldTypeInv1 (type f_5))))
(let ((A@@12 (FieldTypeInv0 (type f_5))))
 (=> (and (and (= (type o_3@@1) RefType) (= (type f_5) (FieldType A@@12 B@@11))) (not (= f_5 f_7))) (= (U_2_real (MapType1Select QPMask@23 o_3@@1 f_5)) (U_2_real (MapType1Select QPMask@24 o_3@@1 f_5))))))
 :qid |stdinbpl.2844:31|
 :skolemid |309|
 :pattern ( (MapType1Select QPMask@24 o_3@@1 f_5))
)))) (and (and (IdenticalOnKnownLocations ExhaleHeap@10 ExhaleHeap@11 QPMask@24) (state ExhaleHeap@11 QPMask@24)) (and (state ExhaleHeap@11 QPMask@24) (= arg_p_12@0 (/ (to_real 1) (to_real 2)))))) (and (=> (= (ControlFlow 0 57) (- 0 58)) (<= NoPerm arg_p_12@0)) (=> (<= NoPerm arg_p_12@0) (and (and (=> (= (ControlFlow 0 57) 50) anon77_Else_correct) (=> (= (ControlFlow 0 57) 54) anon78_Then_correct)) (=> (= (ControlFlow 0 57) 56) anon78_Else_correct))))))))))))))
(let ((anon47_correct true))
(let ((anon76_Else_correct  (=> (and (not (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_49)) (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U j_25)) (not (= i_49 j_25))))) (= (ControlFlow 0 48) 45)) anon47_correct)))
(let ((anon76_Then_correct  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_49)) (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U j_25)) (not (= i_49 j_25)))) (and (=> (= (ControlFlow 0 46) (- 0 47)) (not (= (|Seq#Index| xs3 i_49) (|Seq#Index| xs3 j_25)))) (=> (not (= (|Seq#Index| xs3 i_49) (|Seq#Index| xs3 j_25))) (=> (= (ControlFlow 0 46) 45) anon47_correct))))))
(let ((anon73_Else_correct  (=> (forall ((i_47_1 Int) (j_24_1 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_47_1)) (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U j_24_1)) (not (= i_47_1 j_24_1)))) (not (= (|Seq#Index| xs1 i_47_1) (|Seq#Index| xs1 j_24_1))))
 :qid |stdinbpl.2725:22|
 :skolemid |294|
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_47_1)) (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U j_24_1)))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_47_1)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U j_24_1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_47_1)) (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U j_24_1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_47_1)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U j_24_1)))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_47_1)) (|Seq#Index| xs1 j_24_1))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_47_1)) (|Seq#Index| xs1 j_24_1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U j_24_1)) (|Seq#Index| xs1 i_47_1))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U j_24_1)) (|Seq#Index| xs1 i_47_1))
 :pattern ( (|Seq#Index| xs1 i_47_1) (|Seq#Index| xs1 j_24_1))
)) (and (=> (= (ControlFlow 0 62) (- 0 66)) (forall ((i_48 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_48)) (dummyFunction (MapType0Select ExhaleHeap@9 (|Seq#Index| xs1 i_48) f_7))) (>= arg_p_10@0 NoPerm))
 :qid |stdinbpl.2733:19|
 :skolemid |295|
 :pattern ( (|Seq#Index| xs1 i_48))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_48)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_48)))
 :pattern ( (|Seq#Index| xs1 i_48))
))) (=> (forall ((i_48@@0 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_48@@0)) (dummyFunction (MapType0Select ExhaleHeap@9 (|Seq#Index| xs1 i_48@@0) f_7))) (>= arg_p_10@0 NoPerm))
 :qid |stdinbpl.2733:19|
 :skolemid |295|
 :pattern ( (|Seq#Index| xs1 i_48@@0))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_48@@0)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_48@@0)))
 :pattern ( (|Seq#Index| xs1 i_48@@0))
)) (and (=> (= (ControlFlow 0 62) (- 0 65)) (forall ((i_48@@1 Int) (i_48_1 Int) ) (!  (=> (and (and (and (and (not (= i_48@@1 i_48_1)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_48@@1))) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_48_1))) (< NoPerm arg_p_10@0)) (< NoPerm arg_p_10@0)) (not (= (|Seq#Index| xs1 i_48@@1) (|Seq#Index| xs1 i_48_1))))
 :qid |stdinbpl.2740:19|
 :skolemid |296|
 :pattern ( (neverTriggered33 i_48@@1) (neverTriggered33 i_48_1))
))) (=> (forall ((i_48@@2 Int) (i_48_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_48@@2 i_48_1@@0)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_48@@2))) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_48_1@@0))) (< NoPerm arg_p_10@0)) (< NoPerm arg_p_10@0)) (not (= (|Seq#Index| xs1 i_48@@2) (|Seq#Index| xs1 i_48_1@@0))))
 :qid |stdinbpl.2740:19|
 :skolemid |296|
 :pattern ( (neverTriggered33 i_48@@2) (neverTriggered33 i_48_1@@0))
)) (and (=> (= (ControlFlow 0 62) (- 0 64)) (forall ((i_48@@3 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_48@@3)) (>= (U_2_real (MapType1Select QPMask@22 (|Seq#Index| xs1 i_48@@3) f_7)) arg_p_10@0))
 :qid |stdinbpl.2747:19|
 :skolemid |297|
 :pattern ( (|Seq#Index| xs1 i_48@@3))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_48@@3)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_48@@3)))
 :pattern ( (|Seq#Index| xs1 i_48@@3))
))) (=> (forall ((i_48@@4 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_48@@4)) (>= (U_2_real (MapType1Select QPMask@22 (|Seq#Index| xs1 i_48@@4) f_7)) arg_p_10@0))
 :qid |stdinbpl.2747:19|
 :skolemid |297|
 :pattern ( (|Seq#Index| xs1 i_48@@4))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_48@@4)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_48@@4)))
 :pattern ( (|Seq#Index| xs1 i_48@@4))
)) (=> (and (and (and (forall ((i_48@@5 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_48@@5)) (< NoPerm arg_p_10@0)) (and (qpRange33 (|Seq#Index| xs1 i_48@@5)) (= (invRecv33 (|Seq#Index| xs1 i_48@@5)) i_48@@5)))
 :qid |stdinbpl.2753:24|
 :skolemid |298|
 :pattern ( (|Seq#Index| xs1 i_48@@5))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_48@@5)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_48@@5)))
 :pattern ( (|Seq#Index| xs1 i_48@@5))
)) (forall ((o_3@@2 T@U) ) (!  (=> (= (type o_3@@2) RefType) (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U (invRecv33 o_3@@2))) (and (< NoPerm arg_p_10@0) (qpRange33 o_3@@2))) (= (|Seq#Index| xs1 (invRecv33 o_3@@2)) o_3@@2)))
 :qid |stdinbpl.2757:24|
 :skolemid |299|
 :pattern ( (invRecv33 o_3@@2))
))) (and (forall ((o_3@@3 T@U) ) (!  (=> (= (type o_3@@3) RefType) (and (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U (invRecv33 o_3@@3))) (and (< NoPerm arg_p_10@0) (qpRange33 o_3@@3))) (and (= (|Seq#Index| xs1 (invRecv33 o_3@@3)) o_3@@3) (= (U_2_real (MapType1Select QPMask@23 o_3@@3 f_7)) (- (U_2_real (MapType1Select QPMask@22 o_3@@3 f_7)) arg_p_10@0)))) (=> (not (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U (invRecv33 o_3@@3))) (and (< NoPerm arg_p_10@0) (qpRange33 o_3@@3)))) (= (U_2_real (MapType1Select QPMask@23 o_3@@3 f_7)) (U_2_real (MapType1Select QPMask@22 o_3@@3 f_7))))))
 :qid |stdinbpl.2763:24|
 :skolemid |300|
 :pattern ( (MapType1Select QPMask@23 o_3@@3 f_7))
)) (forall ((o_3@@4 T@U) (f_5@@0 T@U) ) (! (let ((B@@12 (FieldTypeInv1 (type f_5@@0))))
(let ((A@@13 (FieldTypeInv0 (type f_5@@0))))
 (=> (and (and (= (type o_3@@4) RefType) (= (type f_5@@0) (FieldType A@@13 B@@12))) (not (= f_5@@0 f_7))) (= (U_2_real (MapType1Select QPMask@22 o_3@@4 f_5@@0)) (U_2_real (MapType1Select QPMask@23 o_3@@4 f_5@@0))))))
 :qid |stdinbpl.2769:31|
 :skolemid |301|
 :pattern ( (MapType1Select QPMask@23 o_3@@4 f_5@@0))
)))) (and (and (IdenticalOnKnownLocations ExhaleHeap@9 ExhaleHeap@10 QPMask@23) (state ExhaleHeap@10 QPMask@23)) (and (state ExhaleHeap@10 QPMask@23) (= arg_p_11@0 (/ (to_real 1) (to_real 3)))))) (and (=> (= (ControlFlow 0 62) (- 0 63)) (<= NoPerm arg_p_11@0)) (=> (<= NoPerm arg_p_11@0) (and (and (=> (= (ControlFlow 0 62) 57) anon75_Else_correct) (=> (= (ControlFlow 0 62) 46) anon76_Then_correct)) (=> (= (ControlFlow 0 62) 48) anon76_Else_correct))))))))))))))
(let ((anon43_correct true))
(let ((anon74_Else_correct  (=> (and (not (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_46)) (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U j_23)) (not (= i_46 j_23))))) (= (ControlFlow 0 44) 41)) anon43_correct)))
(let ((anon74_Then_correct  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_46)) (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U j_23)) (not (= i_46 j_23)))) (and (=> (= (ControlFlow 0 42) (- 0 43)) (not (= (|Seq#Index| xs1 i_46) (|Seq#Index| xs1 j_23)))) (=> (not (= (|Seq#Index| xs1 i_46) (|Seq#Index| xs1 j_23))) (=> (= (ControlFlow 0 42) 41) anon43_correct))))))
(let ((anon71_Else_correct  (=> (forall ((i_42_1 Int) (j_22_1 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_42_1)) (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U j_22_1)) (not (= i_42_1 j_22_1)))) (not (= (|Seq#Index| xs2 i_42_1) (|Seq#Index| xs2 j_22_1))))
 :qid |stdinbpl.2570:22|
 :skolemid |272|
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_42_1)) (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U j_22_1)))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_42_1)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U j_22_1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_42_1)) (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U j_22_1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_42_1)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U j_22_1)))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_42_1)) (|Seq#Index| xs2 j_22_1))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_42_1)) (|Seq#Index| xs2 j_22_1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U j_22_1)) (|Seq#Index| xs2 i_42_1))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U j_22_1)) (|Seq#Index| xs2 i_42_1))
 :pattern ( (|Seq#Index| xs2 i_42_1) (|Seq#Index| xs2 j_22_1))
)) (and (=> (= (ControlFlow 0 67) (- 0 75)) (forall ((i_43 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_43)) (dummyFunction (MapType0Select ExhaleHeap@8 (|Seq#Index| xs2 i_43) f_7))) (>= arg_p_9@0 NoPerm))
 :qid |stdinbpl.2578:19|
 :skolemid |273|
 :pattern ( (|Seq#Index| xs2 i_43))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_43)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_43)))
 :pattern ( (|Seq#Index| xs2 i_43))
))) (=> (forall ((i_43@@0 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_43@@0)) (dummyFunction (MapType0Select ExhaleHeap@8 (|Seq#Index| xs2 i_43@@0) f_7))) (>= arg_p_9@0 NoPerm))
 :qid |stdinbpl.2578:19|
 :skolemid |273|
 :pattern ( (|Seq#Index| xs2 i_43@@0))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_43@@0)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_43@@0)))
 :pattern ( (|Seq#Index| xs2 i_43@@0))
)) (and (=> (= (ControlFlow 0 67) (- 0 74)) (forall ((i_43@@1 Int) (i_43_1 Int) ) (!  (=> (and (and (and (and (not (= i_43@@1 i_43_1)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_43@@1))) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_43_1))) (< NoPerm arg_p_9@0)) (< NoPerm arg_p_9@0)) (not (= (|Seq#Index| xs2 i_43@@1) (|Seq#Index| xs2 i_43_1))))
 :qid |stdinbpl.2585:19|
 :skolemid |274|
 :pattern ( (neverTriggered30 i_43@@1) (neverTriggered30 i_43_1))
))) (=> (forall ((i_43@@2 Int) (i_43_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_43@@2 i_43_1@@0)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_43@@2))) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_43_1@@0))) (< NoPerm arg_p_9@0)) (< NoPerm arg_p_9@0)) (not (= (|Seq#Index| xs2 i_43@@2) (|Seq#Index| xs2 i_43_1@@0))))
 :qid |stdinbpl.2585:19|
 :skolemid |274|
 :pattern ( (neverTriggered30 i_43@@2) (neverTriggered30 i_43_1@@0))
)) (and (=> (= (ControlFlow 0 67) (- 0 73)) (forall ((i_43@@3 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_43@@3)) (>= (U_2_real (MapType1Select QPMask@19 (|Seq#Index| xs2 i_43@@3) f_7)) arg_p_9@0))
 :qid |stdinbpl.2592:19|
 :skolemid |275|
 :pattern ( (|Seq#Index| xs2 i_43@@3))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_43@@3)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_43@@3)))
 :pattern ( (|Seq#Index| xs2 i_43@@3))
))) (=> (forall ((i_43@@4 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_43@@4)) (>= (U_2_real (MapType1Select QPMask@19 (|Seq#Index| xs2 i_43@@4) f_7)) arg_p_9@0))
 :qid |stdinbpl.2592:19|
 :skolemid |275|
 :pattern ( (|Seq#Index| xs2 i_43@@4))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_43@@4)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_43@@4)))
 :pattern ( (|Seq#Index| xs2 i_43@@4))
)) (=> (forall ((i_43@@5 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_43@@5)) (< NoPerm arg_p_9@0)) (and (qpRange30 (|Seq#Index| xs2 i_43@@5)) (= (invRecv30 (|Seq#Index| xs2 i_43@@5)) i_43@@5)))
 :qid |stdinbpl.2598:24|
 :skolemid |276|
 :pattern ( (|Seq#Index| xs2 i_43@@5))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_43@@5)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_43@@5)))
 :pattern ( (|Seq#Index| xs2 i_43@@5))
)) (=> (and (and (forall ((o_3@@5 T@U) ) (!  (=> (= (type o_3@@5) RefType) (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U (invRecv30 o_3@@5))) (and (< NoPerm arg_p_9@0) (qpRange30 o_3@@5))) (= (|Seq#Index| xs2 (invRecv30 o_3@@5)) o_3@@5)))
 :qid |stdinbpl.2602:24|
 :skolemid |277|
 :pattern ( (invRecv30 o_3@@5))
)) (forall ((o_3@@6 T@U) ) (!  (=> (= (type o_3@@6) RefType) (and (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U (invRecv30 o_3@@6))) (and (< NoPerm arg_p_9@0) (qpRange30 o_3@@6))) (and (= (|Seq#Index| xs2 (invRecv30 o_3@@6)) o_3@@6) (= (U_2_real (MapType1Select QPMask@20 o_3@@6 f_7)) (- (U_2_real (MapType1Select QPMask@19 o_3@@6 f_7)) arg_p_9@0)))) (=> (not (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U (invRecv30 o_3@@6))) (and (< NoPerm arg_p_9@0) (qpRange30 o_3@@6)))) (= (U_2_real (MapType1Select QPMask@20 o_3@@6 f_7)) (U_2_real (MapType1Select QPMask@19 o_3@@6 f_7))))))
 :qid |stdinbpl.2608:24|
 :skolemid |278|
 :pattern ( (MapType1Select QPMask@20 o_3@@6 f_7))
))) (and (forall ((o_3@@7 T@U) (f_5@@1 T@U) ) (! (let ((B@@13 (FieldTypeInv1 (type f_5@@1))))
(let ((A@@14 (FieldTypeInv0 (type f_5@@1))))
 (=> (and (and (= (type o_3@@7) RefType) (= (type f_5@@1) (FieldType A@@14 B@@13))) (not (= f_5@@1 f_7))) (= (U_2_real (MapType1Select QPMask@19 o_3@@7 f_5@@1)) (U_2_real (MapType1Select QPMask@20 o_3@@7 f_5@@1))))))
 :qid |stdinbpl.2614:31|
 :skolemid |279|
 :pattern ( (MapType1Select QPMask@20 o_3@@7 f_5@@1))
)) (IdenticalOnKnownLocations ExhaleHeap@8 ExhaleHeap@9 QPMask@20))) (and (=> (= (ControlFlow 0 67) (- 0 72)) (forall ((i_44 Int) (i_44_1 Int) ) (!  (=> (and (and (and (and (not (= i_44 i_44_1)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_44))) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_44_1))) (< NoPerm arg_q_4@0)) (< NoPerm arg_q_4@0)) (not (= (|Seq#Index| xs2 i_44) (|Seq#Index| xs2 i_44_1))))
 :qid |stdinbpl.2627:17|
 :skolemid |280|
))) (=> (forall ((i_44@@0 Int) (i_44_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_44@@0 i_44_1@@0)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_44@@0))) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_44_1@@0))) (< NoPerm arg_q_4@0)) (< NoPerm arg_q_4@0)) (not (= (|Seq#Index| xs2 i_44@@0) (|Seq#Index| xs2 i_44_1@@0))))
 :qid |stdinbpl.2627:17|
 :skolemid |280|
)) (=> (and (forall ((i_44@@1 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_44@@1)) (< NoPerm arg_q_4@0)) (and (qpRange31 (|Seq#Index| xs2 i_44@@1)) (= (invRecv31 (|Seq#Index| xs2 i_44@@1)) i_44@@1)))
 :qid |stdinbpl.2633:24|
 :skolemid |281|
 :pattern ( (|Seq#Index| xs2 i_44@@1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_44@@1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_44@@1)))
 :pattern ( (|Seq#Index| xs2 i_44@@1))
)) (forall ((o_3@@8 T@U) ) (!  (=> (= (type o_3@@8) RefType) (=> (and (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U (invRecv31 o_3@@8))) (< NoPerm arg_q_4@0)) (qpRange31 o_3@@8)) (= (|Seq#Index| xs2 (invRecv31 o_3@@8)) o_3@@8)))
 :qid |stdinbpl.2637:24|
 :skolemid |282|
 :pattern ( (invRecv31 o_3@@8))
))) (and (=> (= (ControlFlow 0 67) (- 0 71)) (forall ((i_44@@2 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_44@@2)) (>= arg_q_4@0 NoPerm))
 :qid |stdinbpl.2643:17|
 :skolemid |283|
 :pattern ( (|Seq#Index| xs2 i_44@@2))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_44@@2)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_44@@2)))
 :pattern ( (|Seq#Index| xs2 i_44@@2))
))) (=> (forall ((i_44@@3 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_44@@3)) (>= arg_q_4@0 NoPerm))
 :qid |stdinbpl.2643:17|
 :skolemid |283|
 :pattern ( (|Seq#Index| xs2 i_44@@3))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_44@@3)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_44@@3)))
 :pattern ( (|Seq#Index| xs2 i_44@@3))
)) (=> (and (and (forall ((i_44@@4 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_44@@4)) (> arg_q_4@0 NoPerm)) (not (= (|Seq#Index| xs2 i_44@@4) null)))
 :qid |stdinbpl.2649:24|
 :skolemid |284|
 :pattern ( (|Seq#Index| xs2 i_44@@4))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_44@@4)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_44@@4)))
 :pattern ( (|Seq#Index| xs2 i_44@@4))
)) (forall ((o_3@@9 T@U) ) (!  (=> (= (type o_3@@9) RefType) (and (=> (and (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U (invRecv31 o_3@@9))) (< NoPerm arg_q_4@0)) (qpRange31 o_3@@9)) (and (=> (< NoPerm arg_q_4@0) (= (|Seq#Index| xs2 (invRecv31 o_3@@9)) o_3@@9)) (= (U_2_real (MapType1Select QPMask@21 o_3@@9 f_7)) (+ (U_2_real (MapType1Select QPMask@20 o_3@@9 f_7)) arg_q_4@0)))) (=> (not (and (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U (invRecv31 o_3@@9))) (< NoPerm arg_q_4@0)) (qpRange31 o_3@@9))) (= (U_2_real (MapType1Select QPMask@21 o_3@@9 f_7)) (U_2_real (MapType1Select QPMask@20 o_3@@9 f_7))))))
 :qid |stdinbpl.2655:24|
 :skolemid |285|
 :pattern ( (MapType1Select QPMask@21 o_3@@9 f_7))
))) (and (forall ((o_3@@10 T@U) (f_5@@2 T@U) ) (! (let ((B@@14 (FieldTypeInv1 (type f_5@@2))))
(let ((A@@15 (FieldTypeInv0 (type f_5@@2))))
 (=> (and (and (= (type o_3@@10) RefType) (= (type f_5@@2) (FieldType A@@15 B@@14))) (not (= f_5@@2 f_7))) (= (U_2_real (MapType1Select QPMask@20 o_3@@10 f_5@@2)) (U_2_real (MapType1Select QPMask@21 o_3@@10 f_5@@2))))))
 :qid |stdinbpl.2659:31|
 :skolemid |286|
 :pattern ( (MapType1Select QPMask@20 o_3@@10 f_5@@2))
 :pattern ( (MapType1Select QPMask@21 o_3@@10 f_5@@2))
)) (state ExhaleHeap@9 QPMask@21))) (and (=> (= (ControlFlow 0 67) (- 0 70)) (forall ((i_45 Int) (i_45_1 Int) ) (!  (=> (and (and (and (and (not (= i_45 i_45_1)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_45))) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_45_1))) (< NoPerm arg_q_4@0)) (< NoPerm arg_q_4@0)) (not (= (|Seq#Index| xs2 i_45) (|Seq#Index| xs2 i_45_1))))
 :qid |stdinbpl.2667:17|
 :skolemid |287|
))) (=> (forall ((i_45@@0 Int) (i_45_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_45@@0 i_45_1@@0)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_45@@0))) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_45_1@@0))) (< NoPerm arg_q_4@0)) (< NoPerm arg_q_4@0)) (not (= (|Seq#Index| xs2 i_45@@0) (|Seq#Index| xs2 i_45_1@@0))))
 :qid |stdinbpl.2667:17|
 :skolemid |287|
)) (=> (and (forall ((i_45@@1 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_45@@1)) (< NoPerm arg_q_4@0)) (and (qpRange32 (|Seq#Index| xs2 i_45@@1)) (= (invRecv32 (|Seq#Index| xs2 i_45@@1)) i_45@@1)))
 :qid |stdinbpl.2673:24|
 :skolemid |288|
 :pattern ( (|Seq#Index| xs2 i_45@@1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_45@@1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_45@@1)))
 :pattern ( (|Seq#Index| xs2 i_45@@1))
)) (forall ((o_3@@11 T@U) ) (!  (=> (= (type o_3@@11) RefType) (=> (and (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U (invRecv32 o_3@@11))) (< NoPerm arg_q_4@0)) (qpRange32 o_3@@11)) (= (|Seq#Index| xs2 (invRecv32 o_3@@11)) o_3@@11)))
 :qid |stdinbpl.2677:24|
 :skolemid |289|
 :pattern ( (invRecv32 o_3@@11))
))) (and (=> (= (ControlFlow 0 67) (- 0 69)) (forall ((i_45@@2 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_45@@2)) (>= arg_q_4@0 NoPerm))
 :qid |stdinbpl.2683:17|
 :skolemid |290|
 :pattern ( (|Seq#Index| xs2 i_45@@2))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_45@@2)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_45@@2)))
 :pattern ( (|Seq#Index| xs2 i_45@@2))
))) (=> (forall ((i_45@@3 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_45@@3)) (>= arg_q_4@0 NoPerm))
 :qid |stdinbpl.2683:17|
 :skolemid |290|
 :pattern ( (|Seq#Index| xs2 i_45@@3))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_45@@3)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_45@@3)))
 :pattern ( (|Seq#Index| xs2 i_45@@3))
)) (=> (forall ((i_45@@4 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_45@@4)) (> arg_q_4@0 NoPerm)) (not (= (|Seq#Index| xs2 i_45@@4) null)))
 :qid |stdinbpl.2689:24|
 :skolemid |291|
 :pattern ( (|Seq#Index| xs2 i_45@@4))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_45@@4)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_45@@4)))
 :pattern ( (|Seq#Index| xs2 i_45@@4))
)) (=> (and (forall ((o_3@@12 T@U) ) (!  (=> (= (type o_3@@12) RefType) (and (=> (and (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U (invRecv32 o_3@@12))) (< NoPerm arg_q_4@0)) (qpRange32 o_3@@12)) (and (=> (< NoPerm arg_q_4@0) (= (|Seq#Index| xs2 (invRecv32 o_3@@12)) o_3@@12)) (= (U_2_real (MapType1Select QPMask@22 o_3@@12 f_7)) (+ (U_2_real (MapType1Select QPMask@21 o_3@@12 f_7)) arg_q_4@0)))) (=> (not (and (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U (invRecv32 o_3@@12))) (< NoPerm arg_q_4@0)) (qpRange32 o_3@@12))) (= (U_2_real (MapType1Select QPMask@22 o_3@@12 f_7)) (U_2_real (MapType1Select QPMask@21 o_3@@12 f_7))))))
 :qid |stdinbpl.2695:24|
 :skolemid |292|
 :pattern ( (MapType1Select QPMask@22 o_3@@12 f_7))
)) (forall ((o_3@@13 T@U) (f_5@@3 T@U) ) (! (let ((B@@15 (FieldTypeInv1 (type f_5@@3))))
(let ((A@@16 (FieldTypeInv0 (type f_5@@3))))
 (=> (and (and (= (type o_3@@13) RefType) (= (type f_5@@3) (FieldType A@@16 B@@15))) (not (= f_5@@3 f_7))) (= (U_2_real (MapType1Select QPMask@21 o_3@@13 f_5@@3)) (U_2_real (MapType1Select QPMask@22 o_3@@13 f_5@@3))))))
 :qid |stdinbpl.2699:31|
 :skolemid |293|
 :pattern ( (MapType1Select QPMask@21 o_3@@13 f_5@@3))
 :pattern ( (MapType1Select QPMask@22 o_3@@13 f_5@@3))
))) (=> (and (and (state ExhaleHeap@9 QPMask@22) (state ExhaleHeap@9 QPMask@22)) (and (state ExhaleHeap@9 QPMask@22) (= arg_p_10@0 (/ (to_real 1) (to_real 4))))) (and (=> (= (ControlFlow 0 67) (- 0 68)) (<= NoPerm arg_p_10@0)) (=> (<= NoPerm arg_p_10@0) (and (and (=> (= (ControlFlow 0 67) 62) anon73_Else_correct) (=> (= (ControlFlow 0 67) 42) anon74_Then_correct)) (=> (= (ControlFlow 0 67) 44) anon74_Else_correct)))))))))))))))))))))))))))))
(let ((anon39_correct true))
(let ((anon72_Else_correct  (=> (and (not (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_41)) (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U j_21)) (not (= i_41 j_21))))) (= (ControlFlow 0 40) 37)) anon39_correct)))
(let ((anon72_Then_correct  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_41)) (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U j_21)) (not (= i_41 j_21)))) (and (=> (= (ControlFlow 0 38) (- 0 39)) (not (= (|Seq#Index| xs2 i_41) (|Seq#Index| xs2 j_21)))) (=> (not (= (|Seq#Index| xs2 i_41) (|Seq#Index| xs2 j_21))) (=> (= (ControlFlow 0 38) 37) anon39_correct))))))
(let ((anon69_Else_correct  (=> (forall ((i_39_1 Int) (j_20_1 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_39_1)) (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U j_20_1)) (not (= i_39_1 j_20_1)))) (not (= (|Seq#Index| xs3 i_39_1) (|Seq#Index| xs3 j_20_1))))
 :qid |stdinbpl.2492:22|
 :skolemid |264|
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_39_1)) (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U j_20_1)))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_39_1)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U j_20_1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_39_1)) (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U j_20_1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_39_1)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U j_20_1)))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_39_1)) (|Seq#Index| xs3 j_20_1))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_39_1)) (|Seq#Index| xs3 j_20_1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U j_20_1)) (|Seq#Index| xs3 i_39_1))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U j_20_1)) (|Seq#Index| xs3 i_39_1))
 :pattern ( (|Seq#Index| xs3 i_39_1) (|Seq#Index| xs3 j_20_1))
)) (and (=> (= (ControlFlow 0 76) (- 0 81)) (forall ((i_40 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_40)) (dummyFunction (MapType0Select ExhaleHeap@7 (|Seq#Index| xs3 i_40) f_7))) (>= arg_p_8@0 NoPerm))
 :qid |stdinbpl.2500:19|
 :skolemid |265|
 :pattern ( (|Seq#Index| xs3 i_40))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_40)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_40)))
 :pattern ( (|Seq#Index| xs3 i_40))
))) (=> (forall ((i_40@@0 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_40@@0)) (dummyFunction (MapType0Select ExhaleHeap@7 (|Seq#Index| xs3 i_40@@0) f_7))) (>= arg_p_8@0 NoPerm))
 :qid |stdinbpl.2500:19|
 :skolemid |265|
 :pattern ( (|Seq#Index| xs3 i_40@@0))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_40@@0)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_40@@0)))
 :pattern ( (|Seq#Index| xs3 i_40@@0))
)) (and (=> (= (ControlFlow 0 76) (- 0 80)) (forall ((i_40@@1 Int) (i_40_1 Int) ) (!  (=> (and (and (and (and (not (= i_40@@1 i_40_1)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_40@@1))) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_40_1))) (< NoPerm arg_p_8@0)) (< NoPerm arg_p_8@0)) (not (= (|Seq#Index| xs3 i_40@@1) (|Seq#Index| xs3 i_40_1))))
 :qid |stdinbpl.2507:19|
 :skolemid |266|
 :pattern ( (neverTriggered29 i_40@@1) (neverTriggered29 i_40_1))
))) (=> (forall ((i_40@@2 Int) (i_40_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_40@@2 i_40_1@@0)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_40@@2))) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_40_1@@0))) (< NoPerm arg_p_8@0)) (< NoPerm arg_p_8@0)) (not (= (|Seq#Index| xs3 i_40@@2) (|Seq#Index| xs3 i_40_1@@0))))
 :qid |stdinbpl.2507:19|
 :skolemid |266|
 :pattern ( (neverTriggered29 i_40@@2) (neverTriggered29 i_40_1@@0))
)) (and (=> (= (ControlFlow 0 76) (- 0 79)) (forall ((i_40@@3 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_40@@3)) (>= (U_2_real (MapType1Select QPMask@18 (|Seq#Index| xs3 i_40@@3) f_7)) arg_p_8@0))
 :qid |stdinbpl.2514:19|
 :skolemid |267|
 :pattern ( (|Seq#Index| xs3 i_40@@3))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_40@@3)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_40@@3)))
 :pattern ( (|Seq#Index| xs3 i_40@@3))
))) (=> (forall ((i_40@@4 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_40@@4)) (>= (U_2_real (MapType1Select QPMask@18 (|Seq#Index| xs3 i_40@@4) f_7)) arg_p_8@0))
 :qid |stdinbpl.2514:19|
 :skolemid |267|
 :pattern ( (|Seq#Index| xs3 i_40@@4))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_40@@4)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_40@@4)))
 :pattern ( (|Seq#Index| xs3 i_40@@4))
)) (=> (forall ((i_40@@5 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_40@@5)) (< NoPerm arg_p_8@0)) (and (qpRange29 (|Seq#Index| xs3 i_40@@5)) (= (invRecv29 (|Seq#Index| xs3 i_40@@5)) i_40@@5)))
 :qid |stdinbpl.2520:24|
 :skolemid |268|
 :pattern ( (|Seq#Index| xs3 i_40@@5))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_40@@5)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_40@@5)))
 :pattern ( (|Seq#Index| xs3 i_40@@5))
)) (=> (and (and (and (forall ((o_3@@14 T@U) ) (!  (=> (= (type o_3@@14) RefType) (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U (invRecv29 o_3@@14))) (and (< NoPerm arg_p_8@0) (qpRange29 o_3@@14))) (= (|Seq#Index| xs3 (invRecv29 o_3@@14)) o_3@@14)))
 :qid |stdinbpl.2524:24|
 :skolemid |269|
 :pattern ( (invRecv29 o_3@@14))
)) (forall ((o_3@@15 T@U) ) (!  (=> (= (type o_3@@15) RefType) (and (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U (invRecv29 o_3@@15))) (and (< NoPerm arg_p_8@0) (qpRange29 o_3@@15))) (and (= (|Seq#Index| xs3 (invRecv29 o_3@@15)) o_3@@15) (= (U_2_real (MapType1Select QPMask@19 o_3@@15 f_7)) (- (U_2_real (MapType1Select QPMask@18 o_3@@15 f_7)) arg_p_8@0)))) (=> (not (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U (invRecv29 o_3@@15))) (and (< NoPerm arg_p_8@0) (qpRange29 o_3@@15)))) (= (U_2_real (MapType1Select QPMask@19 o_3@@15 f_7)) (U_2_real (MapType1Select QPMask@18 o_3@@15 f_7))))))
 :qid |stdinbpl.2530:24|
 :skolemid |270|
 :pattern ( (MapType1Select QPMask@19 o_3@@15 f_7))
))) (and (forall ((o_3@@16 T@U) (f_5@@4 T@U) ) (! (let ((B@@16 (FieldTypeInv1 (type f_5@@4))))
(let ((A@@17 (FieldTypeInv0 (type f_5@@4))))
 (=> (and (and (= (type o_3@@16) RefType) (= (type f_5@@4) (FieldType A@@17 B@@16))) (not (= f_5@@4 f_7))) (= (U_2_real (MapType1Select QPMask@18 o_3@@16 f_5@@4)) (U_2_real (MapType1Select QPMask@19 o_3@@16 f_5@@4))))))
 :qid |stdinbpl.2536:31|
 :skolemid |271|
 :pattern ( (MapType1Select QPMask@19 o_3@@16 f_5@@4))
)) (IdenticalOnKnownLocations ExhaleHeap@7 ExhaleHeap@8 QPMask@19))) (and (and (state ExhaleHeap@8 QPMask@19) (state ExhaleHeap@8 QPMask@19)) (and (= arg_p_9@0 (/ (to_real 1) (to_real 2))) (= arg_q_4@0 (/ (to_real 1) (to_real 4)))))) (and (=> (= (ControlFlow 0 76) (- 0 78)) (= arg_p_9@0 (* (to_real 2) arg_q_4@0))) (=> (= arg_p_9@0 (* (to_real 2) arg_q_4@0)) (and (=> (= (ControlFlow 0 76) (- 0 77)) (<= NoPerm arg_p_9@0)) (=> (<= NoPerm arg_p_9@0) (and (and (=> (= (ControlFlow 0 76) 67) anon71_Else_correct) (=> (= (ControlFlow 0 76) 38) anon72_Then_correct)) (=> (= (ControlFlow 0 76) 40) anon72_Else_correct)))))))))))))))))
(let ((anon35_correct true))
(let ((anon70_Else_correct  (=> (and (not (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_38)) (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U j_19)) (not (= i_38 j_19))))) (= (ControlFlow 0 36) 33)) anon35_correct)))
(let ((anon70_Then_correct  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_38)) (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U j_19)) (not (= i_38 j_19)))) (and (=> (= (ControlFlow 0 34) (- 0 35)) (not (= (|Seq#Index| xs3 i_38) (|Seq#Index| xs3 j_19)))) (=> (not (= (|Seq#Index| xs3 i_38) (|Seq#Index| xs3 j_19))) (=> (= (ControlFlow 0 34) 33) anon35_correct))))))
(let ((anon67_Else_correct  (=> (forall ((i_36_1 Int) (j_18_1 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_36_1)) (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U j_18_1)) (not (= i_36_1 j_18_1)))) (not (= (|Seq#Index| xs1 i_36_1) (|Seq#Index| xs1 j_18_1))))
 :qid |stdinbpl.2417:22|
 :skolemid |256|
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_36_1)) (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U j_18_1)))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_36_1)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U j_18_1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_36_1)) (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U j_18_1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_36_1)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U j_18_1)))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_36_1)) (|Seq#Index| xs1 j_18_1))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_36_1)) (|Seq#Index| xs1 j_18_1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U j_18_1)) (|Seq#Index| xs1 i_36_1))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U j_18_1)) (|Seq#Index| xs1 i_36_1))
 :pattern ( (|Seq#Index| xs1 i_36_1) (|Seq#Index| xs1 j_18_1))
)) (and (=> (= (ControlFlow 0 82) (- 0 86)) (forall ((i_37 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_37)) (dummyFunction (MapType0Select ExhaleHeap@6 (|Seq#Index| xs1 i_37) f_7))) (>= arg_p_7@0 NoPerm))
 :qid |stdinbpl.2425:19|
 :skolemid |257|
 :pattern ( (|Seq#Index| xs1 i_37))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_37)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_37)))
 :pattern ( (|Seq#Index| xs1 i_37))
))) (=> (forall ((i_37@@0 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_37@@0)) (dummyFunction (MapType0Select ExhaleHeap@6 (|Seq#Index| xs1 i_37@@0) f_7))) (>= arg_p_7@0 NoPerm))
 :qid |stdinbpl.2425:19|
 :skolemid |257|
 :pattern ( (|Seq#Index| xs1 i_37@@0))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_37@@0)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_37@@0)))
 :pattern ( (|Seq#Index| xs1 i_37@@0))
)) (and (=> (= (ControlFlow 0 82) (- 0 85)) (forall ((i_37@@1 Int) (i_37_1 Int) ) (!  (=> (and (and (and (and (not (= i_37@@1 i_37_1)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_37@@1))) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_37_1))) (< NoPerm arg_p_7@0)) (< NoPerm arg_p_7@0)) (not (= (|Seq#Index| xs1 i_37@@1) (|Seq#Index| xs1 i_37_1))))
 :qid |stdinbpl.2432:19|
 :skolemid |258|
 :pattern ( (neverTriggered28 i_37@@1) (neverTriggered28 i_37_1))
))) (=> (forall ((i_37@@2 Int) (i_37_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_37@@2 i_37_1@@0)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_37@@2))) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_37_1@@0))) (< NoPerm arg_p_7@0)) (< NoPerm arg_p_7@0)) (not (= (|Seq#Index| xs1 i_37@@2) (|Seq#Index| xs1 i_37_1@@0))))
 :qid |stdinbpl.2432:19|
 :skolemid |258|
 :pattern ( (neverTriggered28 i_37@@2) (neverTriggered28 i_37_1@@0))
)) (and (=> (= (ControlFlow 0 82) (- 0 84)) (forall ((i_37@@3 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_37@@3)) (>= (U_2_real (MapType1Select QPMask@17 (|Seq#Index| xs1 i_37@@3) f_7)) arg_p_7@0))
 :qid |stdinbpl.2439:19|
 :skolemid |259|
 :pattern ( (|Seq#Index| xs1 i_37@@3))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_37@@3)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_37@@3)))
 :pattern ( (|Seq#Index| xs1 i_37@@3))
))) (=> (forall ((i_37@@4 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_37@@4)) (>= (U_2_real (MapType1Select QPMask@17 (|Seq#Index| xs1 i_37@@4) f_7)) arg_p_7@0))
 :qid |stdinbpl.2439:19|
 :skolemid |259|
 :pattern ( (|Seq#Index| xs1 i_37@@4))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_37@@4)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_37@@4)))
 :pattern ( (|Seq#Index| xs1 i_37@@4))
)) (=> (and (and (and (forall ((i_37@@5 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_37@@5)) (< NoPerm arg_p_7@0)) (and (qpRange28 (|Seq#Index| xs1 i_37@@5)) (= (invRecv28 (|Seq#Index| xs1 i_37@@5)) i_37@@5)))
 :qid |stdinbpl.2445:24|
 :skolemid |260|
 :pattern ( (|Seq#Index| xs1 i_37@@5))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_37@@5)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_37@@5)))
 :pattern ( (|Seq#Index| xs1 i_37@@5))
)) (forall ((o_3@@17 T@U) ) (!  (=> (= (type o_3@@17) RefType) (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U (invRecv28 o_3@@17))) (and (< NoPerm arg_p_7@0) (qpRange28 o_3@@17))) (= (|Seq#Index| xs1 (invRecv28 o_3@@17)) o_3@@17)))
 :qid |stdinbpl.2449:24|
 :skolemid |261|
 :pattern ( (invRecv28 o_3@@17))
))) (and (forall ((o_3@@18 T@U) ) (!  (=> (= (type o_3@@18) RefType) (and (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U (invRecv28 o_3@@18))) (and (< NoPerm arg_p_7@0) (qpRange28 o_3@@18))) (and (= (|Seq#Index| xs1 (invRecv28 o_3@@18)) o_3@@18) (= (U_2_real (MapType1Select QPMask@18 o_3@@18 f_7)) (- (U_2_real (MapType1Select QPMask@17 o_3@@18 f_7)) arg_p_7@0)))) (=> (not (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U (invRecv28 o_3@@18))) (and (< NoPerm arg_p_7@0) (qpRange28 o_3@@18)))) (= (U_2_real (MapType1Select QPMask@18 o_3@@18 f_7)) (U_2_real (MapType1Select QPMask@17 o_3@@18 f_7))))))
 :qid |stdinbpl.2455:24|
 :skolemid |262|
 :pattern ( (MapType1Select QPMask@18 o_3@@18 f_7))
)) (forall ((o_3@@19 T@U) (f_5@@5 T@U) ) (! (let ((B@@17 (FieldTypeInv1 (type f_5@@5))))
(let ((A@@18 (FieldTypeInv0 (type f_5@@5))))
 (=> (and (and (= (type o_3@@19) RefType) (= (type f_5@@5) (FieldType A@@18 B@@17))) (not (= f_5@@5 f_7))) (= (U_2_real (MapType1Select QPMask@17 o_3@@19 f_5@@5)) (U_2_real (MapType1Select QPMask@18 o_3@@19 f_5@@5))))))
 :qid |stdinbpl.2461:31|
 :skolemid |263|
 :pattern ( (MapType1Select QPMask@18 o_3@@19 f_5@@5))
)))) (and (and (IdenticalOnKnownLocations ExhaleHeap@6 ExhaleHeap@7 QPMask@18) (state ExhaleHeap@7 QPMask@18)) (and (state ExhaleHeap@7 QPMask@18) (= arg_p_8@0 (/ (to_real 1) (to_real 3)))))) (and (=> (= (ControlFlow 0 82) (- 0 83)) (<= NoPerm arg_p_8@0)) (=> (<= NoPerm arg_p_8@0) (and (and (=> (= (ControlFlow 0 82) 76) anon69_Else_correct) (=> (= (ControlFlow 0 82) 34) anon70_Then_correct)) (=> (= (ControlFlow 0 82) 36) anon70_Else_correct))))))))))))))
(let ((anon31_correct true))
(let ((anon68_Else_correct  (=> (and (not (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_35)) (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U j_17)) (not (= i_35 j_17))))) (= (ControlFlow 0 32) 29)) anon31_correct)))
(let ((anon68_Then_correct  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_35)) (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U j_17)) (not (= i_35 j_17)))) (and (=> (= (ControlFlow 0 30) (- 0 31)) (not (= (|Seq#Index| xs1 i_35) (|Seq#Index| xs1 j_17)))) (=> (not (= (|Seq#Index| xs1 i_35) (|Seq#Index| xs1 j_17))) (=> (= (ControlFlow 0 30) 29) anon31_correct))))))
(let ((anon65_Else_correct  (=> (forall ((i_31_1 Int) (j_16_1 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_31_1)) (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U j_16_1)) (not (= i_31_1 j_16_1)))) (not (= (|Seq#Index| xs1 i_31_1) (|Seq#Index| xs1 j_16_1))))
 :qid |stdinbpl.2262:22|
 :skolemid |234|
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_31_1)) (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U j_16_1)))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_31_1)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U j_16_1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_31_1)) (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U j_16_1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_31_1)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U j_16_1)))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_31_1)) (|Seq#Index| xs1 j_16_1))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_31_1)) (|Seq#Index| xs1 j_16_1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U j_16_1)) (|Seq#Index| xs1 i_31_1))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U j_16_1)) (|Seq#Index| xs1 i_31_1))
 :pattern ( (|Seq#Index| xs1 i_31_1) (|Seq#Index| xs1 j_16_1))
)) (and (=> (= (ControlFlow 0 87) (- 0 95)) (forall ((i_32 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_32)) (dummyFunction (MapType0Select ExhaleHeap@5 (|Seq#Index| xs1 i_32) f_7))) (>= arg_p_6@0 NoPerm))
 :qid |stdinbpl.2270:19|
 :skolemid |235|
 :pattern ( (|Seq#Index| xs1 i_32))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_32)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_32)))
 :pattern ( (|Seq#Index| xs1 i_32))
))) (=> (forall ((i_32@@0 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_32@@0)) (dummyFunction (MapType0Select ExhaleHeap@5 (|Seq#Index| xs1 i_32@@0) f_7))) (>= arg_p_6@0 NoPerm))
 :qid |stdinbpl.2270:19|
 :skolemid |235|
 :pattern ( (|Seq#Index| xs1 i_32@@0))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_32@@0)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_32@@0)))
 :pattern ( (|Seq#Index| xs1 i_32@@0))
)) (and (=> (= (ControlFlow 0 87) (- 0 94)) (forall ((i_32@@1 Int) (i_32_1 Int) ) (!  (=> (and (and (and (and (not (= i_32@@1 i_32_1)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_32@@1))) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_32_1))) (< NoPerm arg_p_6@0)) (< NoPerm arg_p_6@0)) (not (= (|Seq#Index| xs1 i_32@@1) (|Seq#Index| xs1 i_32_1))))
 :qid |stdinbpl.2277:19|
 :skolemid |236|
 :pattern ( (neverTriggered25 i_32@@1) (neverTriggered25 i_32_1))
))) (=> (forall ((i_32@@2 Int) (i_32_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_32@@2 i_32_1@@0)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_32@@2))) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_32_1@@0))) (< NoPerm arg_p_6@0)) (< NoPerm arg_p_6@0)) (not (= (|Seq#Index| xs1 i_32@@2) (|Seq#Index| xs1 i_32_1@@0))))
 :qid |stdinbpl.2277:19|
 :skolemid |236|
 :pattern ( (neverTriggered25 i_32@@2) (neverTriggered25 i_32_1@@0))
)) (and (=> (= (ControlFlow 0 87) (- 0 93)) (forall ((i_32@@3 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_32@@3)) (>= (U_2_real (MapType1Select QPMask@14 (|Seq#Index| xs1 i_32@@3) f_7)) arg_p_6@0))
 :qid |stdinbpl.2284:19|
 :skolemid |237|
 :pattern ( (|Seq#Index| xs1 i_32@@3))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_32@@3)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_32@@3)))
 :pattern ( (|Seq#Index| xs1 i_32@@3))
))) (=> (forall ((i_32@@4 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_32@@4)) (>= (U_2_real (MapType1Select QPMask@14 (|Seq#Index| xs1 i_32@@4) f_7)) arg_p_6@0))
 :qid |stdinbpl.2284:19|
 :skolemid |237|
 :pattern ( (|Seq#Index| xs1 i_32@@4))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_32@@4)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_32@@4)))
 :pattern ( (|Seq#Index| xs1 i_32@@4))
)) (=> (forall ((i_32@@5 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_32@@5)) (< NoPerm arg_p_6@0)) (and (qpRange25 (|Seq#Index| xs1 i_32@@5)) (= (invRecv25 (|Seq#Index| xs1 i_32@@5)) i_32@@5)))
 :qid |stdinbpl.2290:24|
 :skolemid |238|
 :pattern ( (|Seq#Index| xs1 i_32@@5))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_32@@5)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_32@@5)))
 :pattern ( (|Seq#Index| xs1 i_32@@5))
)) (=> (and (and (forall ((o_3@@20 T@U) ) (!  (=> (= (type o_3@@20) RefType) (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U (invRecv25 o_3@@20))) (and (< NoPerm arg_p_6@0) (qpRange25 o_3@@20))) (= (|Seq#Index| xs1 (invRecv25 o_3@@20)) o_3@@20)))
 :qid |stdinbpl.2294:24|
 :skolemid |239|
 :pattern ( (invRecv25 o_3@@20))
)) (forall ((o_3@@21 T@U) ) (!  (=> (= (type o_3@@21) RefType) (and (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U (invRecv25 o_3@@21))) (and (< NoPerm arg_p_6@0) (qpRange25 o_3@@21))) (and (= (|Seq#Index| xs1 (invRecv25 o_3@@21)) o_3@@21) (= (U_2_real (MapType1Select QPMask@15 o_3@@21 f_7)) (- (U_2_real (MapType1Select QPMask@14 o_3@@21 f_7)) arg_p_6@0)))) (=> (not (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U (invRecv25 o_3@@21))) (and (< NoPerm arg_p_6@0) (qpRange25 o_3@@21)))) (= (U_2_real (MapType1Select QPMask@15 o_3@@21 f_7)) (U_2_real (MapType1Select QPMask@14 o_3@@21 f_7))))))
 :qid |stdinbpl.2300:24|
 :skolemid |240|
 :pattern ( (MapType1Select QPMask@15 o_3@@21 f_7))
))) (and (forall ((o_3@@22 T@U) (f_5@@6 T@U) ) (! (let ((B@@18 (FieldTypeInv1 (type f_5@@6))))
(let ((A@@19 (FieldTypeInv0 (type f_5@@6))))
 (=> (and (and (= (type o_3@@22) RefType) (= (type f_5@@6) (FieldType A@@19 B@@18))) (not (= f_5@@6 f_7))) (= (U_2_real (MapType1Select QPMask@14 o_3@@22 f_5@@6)) (U_2_real (MapType1Select QPMask@15 o_3@@22 f_5@@6))))))
 :qid |stdinbpl.2306:31|
 :skolemid |241|
 :pattern ( (MapType1Select QPMask@15 o_3@@22 f_5@@6))
)) (IdenticalOnKnownLocations ExhaleHeap@5 ExhaleHeap@6 QPMask@15))) (and (=> (= (ControlFlow 0 87) (- 0 92)) (forall ((i_33 Int) (i_33_1 Int) ) (!  (=> (and (and (and (and (not (= i_33 i_33_1)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_33))) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_33_1))) (< NoPerm arg_q_3@0)) (< NoPerm arg_q_3@0)) (not (= (|Seq#Index| xs1 i_33) (|Seq#Index| xs1 i_33_1))))
 :qid |stdinbpl.2319:17|
 :skolemid |242|
))) (=> (forall ((i_33@@0 Int) (i_33_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_33@@0 i_33_1@@0)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_33@@0))) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_33_1@@0))) (< NoPerm arg_q_3@0)) (< NoPerm arg_q_3@0)) (not (= (|Seq#Index| xs1 i_33@@0) (|Seq#Index| xs1 i_33_1@@0))))
 :qid |stdinbpl.2319:17|
 :skolemid |242|
)) (=> (and (forall ((i_33@@1 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_33@@1)) (< NoPerm arg_q_3@0)) (and (qpRange26 (|Seq#Index| xs1 i_33@@1)) (= (invRecv26 (|Seq#Index| xs1 i_33@@1)) i_33@@1)))
 :qid |stdinbpl.2325:24|
 :skolemid |243|
 :pattern ( (|Seq#Index| xs1 i_33@@1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_33@@1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_33@@1)))
 :pattern ( (|Seq#Index| xs1 i_33@@1))
)) (forall ((o_3@@23 T@U) ) (!  (=> (= (type o_3@@23) RefType) (=> (and (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U (invRecv26 o_3@@23))) (< NoPerm arg_q_3@0)) (qpRange26 o_3@@23)) (= (|Seq#Index| xs1 (invRecv26 o_3@@23)) o_3@@23)))
 :qid |stdinbpl.2329:24|
 :skolemid |244|
 :pattern ( (invRecv26 o_3@@23))
))) (and (=> (= (ControlFlow 0 87) (- 0 91)) (forall ((i_33@@2 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_33@@2)) (>= arg_q_3@0 NoPerm))
 :qid |stdinbpl.2335:17|
 :skolemid |245|
 :pattern ( (|Seq#Index| xs1 i_33@@2))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_33@@2)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_33@@2)))
 :pattern ( (|Seq#Index| xs1 i_33@@2))
))) (=> (forall ((i_33@@3 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_33@@3)) (>= arg_q_3@0 NoPerm))
 :qid |stdinbpl.2335:17|
 :skolemid |245|
 :pattern ( (|Seq#Index| xs1 i_33@@3))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_33@@3)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_33@@3)))
 :pattern ( (|Seq#Index| xs1 i_33@@3))
)) (=> (and (and (forall ((i_33@@4 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_33@@4)) (> arg_q_3@0 NoPerm)) (not (= (|Seq#Index| xs1 i_33@@4) null)))
 :qid |stdinbpl.2341:24|
 :skolemid |246|
 :pattern ( (|Seq#Index| xs1 i_33@@4))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_33@@4)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_33@@4)))
 :pattern ( (|Seq#Index| xs1 i_33@@4))
)) (forall ((o_3@@24 T@U) ) (!  (=> (= (type o_3@@24) RefType) (and (=> (and (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U (invRecv26 o_3@@24))) (< NoPerm arg_q_3@0)) (qpRange26 o_3@@24)) (and (=> (< NoPerm arg_q_3@0) (= (|Seq#Index| xs1 (invRecv26 o_3@@24)) o_3@@24)) (= (U_2_real (MapType1Select QPMask@16 o_3@@24 f_7)) (+ (U_2_real (MapType1Select QPMask@15 o_3@@24 f_7)) arg_q_3@0)))) (=> (not (and (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U (invRecv26 o_3@@24))) (< NoPerm arg_q_3@0)) (qpRange26 o_3@@24))) (= (U_2_real (MapType1Select QPMask@16 o_3@@24 f_7)) (U_2_real (MapType1Select QPMask@15 o_3@@24 f_7))))))
 :qid |stdinbpl.2347:24|
 :skolemid |247|
 :pattern ( (MapType1Select QPMask@16 o_3@@24 f_7))
))) (and (forall ((o_3@@25 T@U) (f_5@@7 T@U) ) (! (let ((B@@19 (FieldTypeInv1 (type f_5@@7))))
(let ((A@@20 (FieldTypeInv0 (type f_5@@7))))
 (=> (and (and (= (type o_3@@25) RefType) (= (type f_5@@7) (FieldType A@@20 B@@19))) (not (= f_5@@7 f_7))) (= (U_2_real (MapType1Select QPMask@15 o_3@@25 f_5@@7)) (U_2_real (MapType1Select QPMask@16 o_3@@25 f_5@@7))))))
 :qid |stdinbpl.2351:31|
 :skolemid |248|
 :pattern ( (MapType1Select QPMask@15 o_3@@25 f_5@@7))
 :pattern ( (MapType1Select QPMask@16 o_3@@25 f_5@@7))
)) (state ExhaleHeap@6 QPMask@16))) (and (=> (= (ControlFlow 0 87) (- 0 90)) (forall ((i_34 Int) (i_34_1 Int) ) (!  (=> (and (and (and (and (not (= i_34 i_34_1)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_34))) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_34_1))) (< NoPerm arg_q_3@0)) (< NoPerm arg_q_3@0)) (not (= (|Seq#Index| xs1 i_34) (|Seq#Index| xs1 i_34_1))))
 :qid |stdinbpl.2359:17|
 :skolemid |249|
))) (=> (forall ((i_34@@0 Int) (i_34_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_34@@0 i_34_1@@0)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_34@@0))) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_34_1@@0))) (< NoPerm arg_q_3@0)) (< NoPerm arg_q_3@0)) (not (= (|Seq#Index| xs1 i_34@@0) (|Seq#Index| xs1 i_34_1@@0))))
 :qid |stdinbpl.2359:17|
 :skolemid |249|
)) (=> (and (forall ((i_34@@1 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_34@@1)) (< NoPerm arg_q_3@0)) (and (qpRange27 (|Seq#Index| xs1 i_34@@1)) (= (invRecv27 (|Seq#Index| xs1 i_34@@1)) i_34@@1)))
 :qid |stdinbpl.2365:24|
 :skolemid |250|
 :pattern ( (|Seq#Index| xs1 i_34@@1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_34@@1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_34@@1)))
 :pattern ( (|Seq#Index| xs1 i_34@@1))
)) (forall ((o_3@@26 T@U) ) (!  (=> (= (type o_3@@26) RefType) (=> (and (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U (invRecv27 o_3@@26))) (< NoPerm arg_q_3@0)) (qpRange27 o_3@@26)) (= (|Seq#Index| xs1 (invRecv27 o_3@@26)) o_3@@26)))
 :qid |stdinbpl.2369:24|
 :skolemid |251|
 :pattern ( (invRecv27 o_3@@26))
))) (and (=> (= (ControlFlow 0 87) (- 0 89)) (forall ((i_34@@2 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_34@@2)) (>= arg_q_3@0 NoPerm))
 :qid |stdinbpl.2375:17|
 :skolemid |252|
 :pattern ( (|Seq#Index| xs1 i_34@@2))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_34@@2)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_34@@2)))
 :pattern ( (|Seq#Index| xs1 i_34@@2))
))) (=> (forall ((i_34@@3 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_34@@3)) (>= arg_q_3@0 NoPerm))
 :qid |stdinbpl.2375:17|
 :skolemid |252|
 :pattern ( (|Seq#Index| xs1 i_34@@3))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_34@@3)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_34@@3)))
 :pattern ( (|Seq#Index| xs1 i_34@@3))
)) (=> (forall ((i_34@@4 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_34@@4)) (> arg_q_3@0 NoPerm)) (not (= (|Seq#Index| xs1 i_34@@4) null)))
 :qid |stdinbpl.2381:24|
 :skolemid |253|
 :pattern ( (|Seq#Index| xs1 i_34@@4))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_34@@4)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_34@@4)))
 :pattern ( (|Seq#Index| xs1 i_34@@4))
)) (=> (and (forall ((o_3@@27 T@U) ) (!  (=> (= (type o_3@@27) RefType) (and (=> (and (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U (invRecv27 o_3@@27))) (< NoPerm arg_q_3@0)) (qpRange27 o_3@@27)) (and (=> (< NoPerm arg_q_3@0) (= (|Seq#Index| xs1 (invRecv27 o_3@@27)) o_3@@27)) (= (U_2_real (MapType1Select QPMask@17 o_3@@27 f_7)) (+ (U_2_real (MapType1Select QPMask@16 o_3@@27 f_7)) arg_q_3@0)))) (=> (not (and (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U (invRecv27 o_3@@27))) (< NoPerm arg_q_3@0)) (qpRange27 o_3@@27))) (= (U_2_real (MapType1Select QPMask@17 o_3@@27 f_7)) (U_2_real (MapType1Select QPMask@16 o_3@@27 f_7))))))
 :qid |stdinbpl.2387:24|
 :skolemid |254|
 :pattern ( (MapType1Select QPMask@17 o_3@@27 f_7))
)) (forall ((o_3@@28 T@U) (f_5@@8 T@U) ) (! (let ((B@@20 (FieldTypeInv1 (type f_5@@8))))
(let ((A@@21 (FieldTypeInv0 (type f_5@@8))))
 (=> (and (and (= (type o_3@@28) RefType) (= (type f_5@@8) (FieldType A@@21 B@@20))) (not (= f_5@@8 f_7))) (= (U_2_real (MapType1Select QPMask@16 o_3@@28 f_5@@8)) (U_2_real (MapType1Select QPMask@17 o_3@@28 f_5@@8))))))
 :qid |stdinbpl.2391:31|
 :skolemid |255|
 :pattern ( (MapType1Select QPMask@16 o_3@@28 f_5@@8))
 :pattern ( (MapType1Select QPMask@17 o_3@@28 f_5@@8))
))) (=> (and (and (state ExhaleHeap@6 QPMask@17) (state ExhaleHeap@6 QPMask@17)) (and (state ExhaleHeap@6 QPMask@17) (= arg_p_7@0 (/ (to_real 1) (to_real 4))))) (and (=> (= (ControlFlow 0 87) (- 0 88)) (<= NoPerm arg_p_7@0)) (=> (<= NoPerm arg_p_7@0) (and (and (=> (= (ControlFlow 0 87) 82) anon67_Else_correct) (=> (= (ControlFlow 0 87) 30) anon68_Then_correct)) (=> (= (ControlFlow 0 87) 32) anon68_Else_correct)))))))))))))))))))))))))))))
(let ((anon27_correct true))
(let ((anon66_Else_correct  (=> (and (not (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_30)) (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U j_15)) (not (= i_30 j_15))))) (= (ControlFlow 0 28) 25)) anon27_correct)))
(let ((anon66_Then_correct  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_30)) (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U j_15)) (not (= i_30 j_15)))) (and (=> (= (ControlFlow 0 26) (- 0 27)) (not (= (|Seq#Index| xs1 i_30) (|Seq#Index| xs1 j_15)))) (=> (not (= (|Seq#Index| xs1 i_30) (|Seq#Index| xs1 j_15))) (=> (= (ControlFlow 0 26) 25) anon27_correct))))))
(let ((anon63_Else_correct  (=> (forall ((i_28_1 Int) (j_14_1 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_28_1)) (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U j_14_1)) (not (= i_28_1 j_14_1)))) (not (= (|Seq#Index| xs3 i_28_1) (|Seq#Index| xs3 j_14_1))))
 :qid |stdinbpl.2184:22|
 :skolemid |226|
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_28_1)) (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U j_14_1)))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_28_1)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U j_14_1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_28_1)) (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U j_14_1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_28_1)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U j_14_1)))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_28_1)) (|Seq#Index| xs3 j_14_1))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_28_1)) (|Seq#Index| xs3 j_14_1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U j_14_1)) (|Seq#Index| xs3 i_28_1))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U j_14_1)) (|Seq#Index| xs3 i_28_1))
 :pattern ( (|Seq#Index| xs3 i_28_1) (|Seq#Index| xs3 j_14_1))
)) (and (=> (= (ControlFlow 0 96) (- 0 101)) (forall ((i_29 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_29)) (dummyFunction (MapType0Select ExhaleHeap@4 (|Seq#Index| xs3 i_29) f_7))) (>= arg_p_5@0 NoPerm))
 :qid |stdinbpl.2192:19|
 :skolemid |227|
 :pattern ( (|Seq#Index| xs3 i_29))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_29)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_29)))
 :pattern ( (|Seq#Index| xs3 i_29))
))) (=> (forall ((i_29@@0 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_29@@0)) (dummyFunction (MapType0Select ExhaleHeap@4 (|Seq#Index| xs3 i_29@@0) f_7))) (>= arg_p_5@0 NoPerm))
 :qid |stdinbpl.2192:19|
 :skolemid |227|
 :pattern ( (|Seq#Index| xs3 i_29@@0))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_29@@0)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_29@@0)))
 :pattern ( (|Seq#Index| xs3 i_29@@0))
)) (and (=> (= (ControlFlow 0 96) (- 0 100)) (forall ((i_29@@1 Int) (i_29_1 Int) ) (!  (=> (and (and (and (and (not (= i_29@@1 i_29_1)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_29@@1))) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_29_1))) (< NoPerm arg_p_5@0)) (< NoPerm arg_p_5@0)) (not (= (|Seq#Index| xs3 i_29@@1) (|Seq#Index| xs3 i_29_1))))
 :qid |stdinbpl.2199:19|
 :skolemid |228|
 :pattern ( (neverTriggered24 i_29@@1) (neverTriggered24 i_29_1))
))) (=> (forall ((i_29@@2 Int) (i_29_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_29@@2 i_29_1@@0)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_29@@2))) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_29_1@@0))) (< NoPerm arg_p_5@0)) (< NoPerm arg_p_5@0)) (not (= (|Seq#Index| xs3 i_29@@2) (|Seq#Index| xs3 i_29_1@@0))))
 :qid |stdinbpl.2199:19|
 :skolemid |228|
 :pattern ( (neverTriggered24 i_29@@2) (neverTriggered24 i_29_1@@0))
)) (and (=> (= (ControlFlow 0 96) (- 0 99)) (forall ((i_29@@3 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_29@@3)) (>= (U_2_real (MapType1Select QPMask@13 (|Seq#Index| xs3 i_29@@3) f_7)) arg_p_5@0))
 :qid |stdinbpl.2206:19|
 :skolemid |229|
 :pattern ( (|Seq#Index| xs3 i_29@@3))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_29@@3)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_29@@3)))
 :pattern ( (|Seq#Index| xs3 i_29@@3))
))) (=> (forall ((i_29@@4 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_29@@4)) (>= (U_2_real (MapType1Select QPMask@13 (|Seq#Index| xs3 i_29@@4) f_7)) arg_p_5@0))
 :qid |stdinbpl.2206:19|
 :skolemid |229|
 :pattern ( (|Seq#Index| xs3 i_29@@4))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_29@@4)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_29@@4)))
 :pattern ( (|Seq#Index| xs3 i_29@@4))
)) (=> (forall ((i_29@@5 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_29@@5)) (< NoPerm arg_p_5@0)) (and (qpRange24 (|Seq#Index| xs3 i_29@@5)) (= (invRecv24 (|Seq#Index| xs3 i_29@@5)) i_29@@5)))
 :qid |stdinbpl.2212:24|
 :skolemid |230|
 :pattern ( (|Seq#Index| xs3 i_29@@5))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_29@@5)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_29@@5)))
 :pattern ( (|Seq#Index| xs3 i_29@@5))
)) (=> (and (and (and (forall ((o_3@@29 T@U) ) (!  (=> (= (type o_3@@29) RefType) (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U (invRecv24 o_3@@29))) (and (< NoPerm arg_p_5@0) (qpRange24 o_3@@29))) (= (|Seq#Index| xs3 (invRecv24 o_3@@29)) o_3@@29)))
 :qid |stdinbpl.2216:24|
 :skolemid |231|
 :pattern ( (invRecv24 o_3@@29))
)) (forall ((o_3@@30 T@U) ) (!  (=> (= (type o_3@@30) RefType) (and (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U (invRecv24 o_3@@30))) (and (< NoPerm arg_p_5@0) (qpRange24 o_3@@30))) (and (= (|Seq#Index| xs3 (invRecv24 o_3@@30)) o_3@@30) (= (U_2_real (MapType1Select QPMask@14 o_3@@30 f_7)) (- (U_2_real (MapType1Select QPMask@13 o_3@@30 f_7)) arg_p_5@0)))) (=> (not (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U (invRecv24 o_3@@30))) (and (< NoPerm arg_p_5@0) (qpRange24 o_3@@30)))) (= (U_2_real (MapType1Select QPMask@14 o_3@@30 f_7)) (U_2_real (MapType1Select QPMask@13 o_3@@30 f_7))))))
 :qid |stdinbpl.2222:24|
 :skolemid |232|
 :pattern ( (MapType1Select QPMask@14 o_3@@30 f_7))
))) (and (forall ((o_3@@31 T@U) (f_5@@9 T@U) ) (! (let ((B@@21 (FieldTypeInv1 (type f_5@@9))))
(let ((A@@22 (FieldTypeInv0 (type f_5@@9))))
 (=> (and (and (= (type o_3@@31) RefType) (= (type f_5@@9) (FieldType A@@22 B@@21))) (not (= f_5@@9 f_7))) (= (U_2_real (MapType1Select QPMask@13 o_3@@31 f_5@@9)) (U_2_real (MapType1Select QPMask@14 o_3@@31 f_5@@9))))))
 :qid |stdinbpl.2228:31|
 :skolemid |233|
 :pattern ( (MapType1Select QPMask@14 o_3@@31 f_5@@9))
)) (IdenticalOnKnownLocations ExhaleHeap@4 ExhaleHeap@5 QPMask@14))) (and (and (state ExhaleHeap@5 QPMask@14) (state ExhaleHeap@5 QPMask@14)) (and (= arg_p_6@0 (/ (to_real 1) (to_real 2))) (= arg_q_3@0 (/ (to_real 1) (to_real 4)))))) (and (=> (= (ControlFlow 0 96) (- 0 98)) (= arg_p_6@0 (* (to_real 2) arg_q_3@0))) (=> (= arg_p_6@0 (* (to_real 2) arg_q_3@0)) (and (=> (= (ControlFlow 0 96) (- 0 97)) (<= NoPerm arg_p_6@0)) (=> (<= NoPerm arg_p_6@0) (and (and (=> (= (ControlFlow 0 96) 87) anon65_Else_correct) (=> (= (ControlFlow 0 96) 26) anon66_Then_correct)) (=> (= (ControlFlow 0 96) 28) anon66_Else_correct)))))))))))))))))
(let ((anon23_correct true))
(let ((anon64_Else_correct  (=> (and (not (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_27)) (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U j_13)) (not (= i_27 j_13))))) (= (ControlFlow 0 24) 21)) anon23_correct)))
(let ((anon64_Then_correct  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_27)) (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U j_13)) (not (= i_27 j_13)))) (and (=> (= (ControlFlow 0 22) (- 0 23)) (not (= (|Seq#Index| xs3 i_27) (|Seq#Index| xs3 j_13)))) (=> (not (= (|Seq#Index| xs3 i_27) (|Seq#Index| xs3 j_13))) (=> (= (ControlFlow 0 22) 21) anon23_correct))))))
(let ((anon61_Else_correct  (=> (forall ((i_25_1 Int) (j_12_1 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_25_1)) (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U j_12_1)) (not (= i_25_1 j_12_1)))) (not (= (|Seq#Index| xs2 i_25_1) (|Seq#Index| xs2 j_12_1))))
 :qid |stdinbpl.2109:22|
 :skolemid |218|
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_25_1)) (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U j_12_1)))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_25_1)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U j_12_1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_25_1)) (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U j_12_1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_25_1)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U j_12_1)))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_25_1)) (|Seq#Index| xs2 j_12_1))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_25_1)) (|Seq#Index| xs2 j_12_1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U j_12_1)) (|Seq#Index| xs2 i_25_1))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U j_12_1)) (|Seq#Index| xs2 i_25_1))
 :pattern ( (|Seq#Index| xs2 i_25_1) (|Seq#Index| xs2 j_12_1))
)) (and (=> (= (ControlFlow 0 102) (- 0 106)) (forall ((i_26 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_26)) (dummyFunction (MapType0Select ExhaleHeap@3 (|Seq#Index| xs2 i_26) f_7))) (>= arg_p_4@0 NoPerm))
 :qid |stdinbpl.2117:19|
 :skolemid |219|
 :pattern ( (|Seq#Index| xs2 i_26))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_26)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_26)))
 :pattern ( (|Seq#Index| xs2 i_26))
))) (=> (forall ((i_26@@0 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_26@@0)) (dummyFunction (MapType0Select ExhaleHeap@3 (|Seq#Index| xs2 i_26@@0) f_7))) (>= arg_p_4@0 NoPerm))
 :qid |stdinbpl.2117:19|
 :skolemid |219|
 :pattern ( (|Seq#Index| xs2 i_26@@0))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_26@@0)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_26@@0)))
 :pattern ( (|Seq#Index| xs2 i_26@@0))
)) (and (=> (= (ControlFlow 0 102) (- 0 105)) (forall ((i_26@@1 Int) (i_26_1 Int) ) (!  (=> (and (and (and (and (not (= i_26@@1 i_26_1)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_26@@1))) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_26_1))) (< NoPerm arg_p_4@0)) (< NoPerm arg_p_4@0)) (not (= (|Seq#Index| xs2 i_26@@1) (|Seq#Index| xs2 i_26_1))))
 :qid |stdinbpl.2124:19|
 :skolemid |220|
 :pattern ( (neverTriggered23 i_26@@1) (neverTriggered23 i_26_1))
))) (=> (forall ((i_26@@2 Int) (i_26_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_26@@2 i_26_1@@0)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_26@@2))) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_26_1@@0))) (< NoPerm arg_p_4@0)) (< NoPerm arg_p_4@0)) (not (= (|Seq#Index| xs2 i_26@@2) (|Seq#Index| xs2 i_26_1@@0))))
 :qid |stdinbpl.2124:19|
 :skolemid |220|
 :pattern ( (neverTriggered23 i_26@@2) (neverTriggered23 i_26_1@@0))
)) (and (=> (= (ControlFlow 0 102) (- 0 104)) (forall ((i_26@@3 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_26@@3)) (>= (U_2_real (MapType1Select QPMask@12 (|Seq#Index| xs2 i_26@@3) f_7)) arg_p_4@0))
 :qid |stdinbpl.2131:19|
 :skolemid |221|
 :pattern ( (|Seq#Index| xs2 i_26@@3))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_26@@3)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_26@@3)))
 :pattern ( (|Seq#Index| xs2 i_26@@3))
))) (=> (forall ((i_26@@4 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_26@@4)) (>= (U_2_real (MapType1Select QPMask@12 (|Seq#Index| xs2 i_26@@4) f_7)) arg_p_4@0))
 :qid |stdinbpl.2131:19|
 :skolemid |221|
 :pattern ( (|Seq#Index| xs2 i_26@@4))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_26@@4)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_26@@4)))
 :pattern ( (|Seq#Index| xs2 i_26@@4))
)) (=> (and (and (and (forall ((i_26@@5 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_26@@5)) (< NoPerm arg_p_4@0)) (and (qpRange23 (|Seq#Index| xs2 i_26@@5)) (= (invRecv23 (|Seq#Index| xs2 i_26@@5)) i_26@@5)))
 :qid |stdinbpl.2137:24|
 :skolemid |222|
 :pattern ( (|Seq#Index| xs2 i_26@@5))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_26@@5)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_26@@5)))
 :pattern ( (|Seq#Index| xs2 i_26@@5))
)) (forall ((o_3@@32 T@U) ) (!  (=> (= (type o_3@@32) RefType) (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U (invRecv23 o_3@@32))) (and (< NoPerm arg_p_4@0) (qpRange23 o_3@@32))) (= (|Seq#Index| xs2 (invRecv23 o_3@@32)) o_3@@32)))
 :qid |stdinbpl.2141:24|
 :skolemid |223|
 :pattern ( (invRecv23 o_3@@32))
))) (and (forall ((o_3@@33 T@U) ) (!  (=> (= (type o_3@@33) RefType) (and (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U (invRecv23 o_3@@33))) (and (< NoPerm arg_p_4@0) (qpRange23 o_3@@33))) (and (= (|Seq#Index| xs2 (invRecv23 o_3@@33)) o_3@@33) (= (U_2_real (MapType1Select QPMask@13 o_3@@33 f_7)) (- (U_2_real (MapType1Select QPMask@12 o_3@@33 f_7)) arg_p_4@0)))) (=> (not (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U (invRecv23 o_3@@33))) (and (< NoPerm arg_p_4@0) (qpRange23 o_3@@33)))) (= (U_2_real (MapType1Select QPMask@13 o_3@@33 f_7)) (U_2_real (MapType1Select QPMask@12 o_3@@33 f_7))))))
 :qid |stdinbpl.2147:24|
 :skolemid |224|
 :pattern ( (MapType1Select QPMask@13 o_3@@33 f_7))
)) (forall ((o_3@@34 T@U) (f_5@@10 T@U) ) (! (let ((B@@22 (FieldTypeInv1 (type f_5@@10))))
(let ((A@@23 (FieldTypeInv0 (type f_5@@10))))
 (=> (and (and (= (type o_3@@34) RefType) (= (type f_5@@10) (FieldType A@@23 B@@22))) (not (= f_5@@10 f_7))) (= (U_2_real (MapType1Select QPMask@12 o_3@@34 f_5@@10)) (U_2_real (MapType1Select QPMask@13 o_3@@34 f_5@@10))))))
 :qid |stdinbpl.2153:31|
 :skolemid |225|
 :pattern ( (MapType1Select QPMask@13 o_3@@34 f_5@@10))
)))) (and (and (IdenticalOnKnownLocations ExhaleHeap@3 ExhaleHeap@4 QPMask@13) (state ExhaleHeap@4 QPMask@13)) (and (state ExhaleHeap@4 QPMask@13) (= arg_p_5@0 (/ (to_real 1) (to_real 3)))))) (and (=> (= (ControlFlow 0 102) (- 0 103)) (<= NoPerm arg_p_5@0)) (=> (<= NoPerm arg_p_5@0) (and (and (=> (= (ControlFlow 0 102) 96) anon63_Else_correct) (=> (= (ControlFlow 0 102) 22) anon64_Then_correct)) (=> (= (ControlFlow 0 102) 24) anon64_Else_correct))))))))))))))
(let ((anon19_correct true))
(let ((anon62_Else_correct  (=> (and (not (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_24_1)) (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U j_11)) (not (= i_24_1 j_11))))) (= (ControlFlow 0 20) 17)) anon19_correct)))
(let ((anon62_Then_correct  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_24_1)) (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U j_11)) (not (= i_24_1 j_11)))) (and (=> (= (ControlFlow 0 18) (- 0 19)) (not (= (|Seq#Index| xs2 i_24_1) (|Seq#Index| xs2 j_11)))) (=> (not (= (|Seq#Index| xs2 i_24_1) (|Seq#Index| xs2 j_11))) (=> (= (ControlFlow 0 18) 17) anon19_correct))))))
(let ((anon59_Else_correct  (=> (forall ((i_22_1 Int) (j_10_1 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_22_1)) (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U j_10_1)) (not (= i_22_1 j_10_1)))) (not (= (|Seq#Index| xs1 i_22_1) (|Seq#Index| xs1 j_10_1))))
 :qid |stdinbpl.2034:22|
 :skolemid |210|
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_22_1)) (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U j_10_1)))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_22_1)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U j_10_1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_22_1)) (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U j_10_1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_22_1)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U j_10_1)))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_22_1)) (|Seq#Index| xs1 j_10_1))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_22_1)) (|Seq#Index| xs1 j_10_1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U j_10_1)) (|Seq#Index| xs1 i_22_1))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U j_10_1)) (|Seq#Index| xs1 i_22_1))
 :pattern ( (|Seq#Index| xs1 i_22_1) (|Seq#Index| xs1 j_10_1))
)) (and (=> (= (ControlFlow 0 107) (- 0 111)) (forall ((i_23 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_23)) (dummyFunction (MapType0Select ExhaleHeap@2 (|Seq#Index| xs1 i_23) f_7))) (>= arg_p_3@0 NoPerm))
 :qid |stdinbpl.2042:19|
 :skolemid |211|
 :pattern ( (|Seq#Index| xs1 i_23))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_23)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_23)))
 :pattern ( (|Seq#Index| xs1 i_23))
))) (=> (forall ((i_23@@0 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_23@@0)) (dummyFunction (MapType0Select ExhaleHeap@2 (|Seq#Index| xs1 i_23@@0) f_7))) (>= arg_p_3@0 NoPerm))
 :qid |stdinbpl.2042:19|
 :skolemid |211|
 :pattern ( (|Seq#Index| xs1 i_23@@0))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_23@@0)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_23@@0)))
 :pattern ( (|Seq#Index| xs1 i_23@@0))
)) (and (=> (= (ControlFlow 0 107) (- 0 110)) (forall ((i_23@@1 Int) (i_23_1 Int) ) (!  (=> (and (and (and (and (not (= i_23@@1 i_23_1)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_23@@1))) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_23_1))) (< NoPerm arg_p_3@0)) (< NoPerm arg_p_3@0)) (not (= (|Seq#Index| xs1 i_23@@1) (|Seq#Index| xs1 i_23_1))))
 :qid |stdinbpl.2049:19|
 :skolemid |212|
 :pattern ( (neverTriggered22 i_23@@1) (neverTriggered22 i_23_1))
))) (=> (forall ((i_23@@2 Int) (i_23_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_23@@2 i_23_1@@0)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_23@@2))) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_23_1@@0))) (< NoPerm arg_p_3@0)) (< NoPerm arg_p_3@0)) (not (= (|Seq#Index| xs1 i_23@@2) (|Seq#Index| xs1 i_23_1@@0))))
 :qid |stdinbpl.2049:19|
 :skolemid |212|
 :pattern ( (neverTriggered22 i_23@@2) (neverTriggered22 i_23_1@@0))
)) (and (=> (= (ControlFlow 0 107) (- 0 109)) (forall ((i_23@@3 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_23@@3)) (>= (U_2_real (MapType1Select QPMask@11 (|Seq#Index| xs1 i_23@@3) f_7)) arg_p_3@0))
 :qid |stdinbpl.2056:19|
 :skolemid |213|
 :pattern ( (|Seq#Index| xs1 i_23@@3))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_23@@3)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_23@@3)))
 :pattern ( (|Seq#Index| xs1 i_23@@3))
))) (=> (forall ((i_23@@4 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_23@@4)) (>= (U_2_real (MapType1Select QPMask@11 (|Seq#Index| xs1 i_23@@4) f_7)) arg_p_3@0))
 :qid |stdinbpl.2056:19|
 :skolemid |213|
 :pattern ( (|Seq#Index| xs1 i_23@@4))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_23@@4)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_23@@4)))
 :pattern ( (|Seq#Index| xs1 i_23@@4))
)) (=> (and (and (and (forall ((i_23@@5 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_23@@5)) (< NoPerm arg_p_3@0)) (and (qpRange22 (|Seq#Index| xs1 i_23@@5)) (= (invRecv22 (|Seq#Index| xs1 i_23@@5)) i_23@@5)))
 :qid |stdinbpl.2062:24|
 :skolemid |214|
 :pattern ( (|Seq#Index| xs1 i_23@@5))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_23@@5)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_23@@5)))
 :pattern ( (|Seq#Index| xs1 i_23@@5))
)) (forall ((o_3@@35 T@U) ) (!  (=> (= (type o_3@@35) RefType) (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U (invRecv22 o_3@@35))) (and (< NoPerm arg_p_3@0) (qpRange22 o_3@@35))) (= (|Seq#Index| xs1 (invRecv22 o_3@@35)) o_3@@35)))
 :qid |stdinbpl.2066:24|
 :skolemid |215|
 :pattern ( (invRecv22 o_3@@35))
))) (and (forall ((o_3@@36 T@U) ) (!  (=> (= (type o_3@@36) RefType) (and (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U (invRecv22 o_3@@36))) (and (< NoPerm arg_p_3@0) (qpRange22 o_3@@36))) (and (= (|Seq#Index| xs1 (invRecv22 o_3@@36)) o_3@@36) (= (U_2_real (MapType1Select QPMask@12 o_3@@36 f_7)) (- (U_2_real (MapType1Select QPMask@11 o_3@@36 f_7)) arg_p_3@0)))) (=> (not (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U (invRecv22 o_3@@36))) (and (< NoPerm arg_p_3@0) (qpRange22 o_3@@36)))) (= (U_2_real (MapType1Select QPMask@12 o_3@@36 f_7)) (U_2_real (MapType1Select QPMask@11 o_3@@36 f_7))))))
 :qid |stdinbpl.2072:24|
 :skolemid |216|
 :pattern ( (MapType1Select QPMask@12 o_3@@36 f_7))
)) (forall ((o_3@@37 T@U) (f_5@@11 T@U) ) (! (let ((B@@23 (FieldTypeInv1 (type f_5@@11))))
(let ((A@@24 (FieldTypeInv0 (type f_5@@11))))
 (=> (and (and (= (type o_3@@37) RefType) (= (type f_5@@11) (FieldType A@@24 B@@23))) (not (= f_5@@11 f_7))) (= (U_2_real (MapType1Select QPMask@11 o_3@@37 f_5@@11)) (U_2_real (MapType1Select QPMask@12 o_3@@37 f_5@@11))))))
 :qid |stdinbpl.2078:31|
 :skolemid |217|
 :pattern ( (MapType1Select QPMask@12 o_3@@37 f_5@@11))
)))) (and (and (IdenticalOnKnownLocations ExhaleHeap@2 ExhaleHeap@3 QPMask@12) (state ExhaleHeap@3 QPMask@12)) (and (state ExhaleHeap@3 QPMask@12) (= arg_p_4@0 (/ (to_real 1) (to_real 2)))))) (and (=> (= (ControlFlow 0 107) (- 0 108)) (<= NoPerm arg_p_4@0)) (=> (<= NoPerm arg_p_4@0) (and (and (=> (= (ControlFlow 0 107) 102) anon61_Else_correct) (=> (= (ControlFlow 0 107) 18) anon62_Then_correct)) (=> (= (ControlFlow 0 107) 20) anon62_Else_correct))))))))))))))
(let ((anon15_correct true))
(let ((anon60_Else_correct  (=> (and (not (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_21_1)) (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U j_9)) (not (= i_21_1 j_9))))) (= (ControlFlow 0 16) 13)) anon15_correct)))
(let ((anon60_Then_correct  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_21_1)) (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U j_9)) (not (= i_21_1 j_9)))) (and (=> (= (ControlFlow 0 14) (- 0 15)) (not (= (|Seq#Index| xs1 i_21_1) (|Seq#Index| xs1 j_9)))) (=> (not (= (|Seq#Index| xs1 i_21_1) (|Seq#Index| xs1 j_9))) (=> (= (ControlFlow 0 14) 13) anon15_correct))))))
(let ((anon57_Else_correct  (=> (forall ((i_17_1 Int) (j_8_1 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_17_1)) (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U j_8_1)) (not (= i_17_1 j_8_1)))) (not (= (|Seq#Index| xs3 i_17_1) (|Seq#Index| xs3 j_8_1))))
 :qid |stdinbpl.1879:22|
 :skolemid |188|
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_17_1)) (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U j_8_1)))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_17_1)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U j_8_1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_17_1)) (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U j_8_1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_17_1)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U j_8_1)))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_17_1)) (|Seq#Index| xs3 j_8_1))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_17_1)) (|Seq#Index| xs3 j_8_1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U j_8_1)) (|Seq#Index| xs3 i_17_1))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U j_8_1)) (|Seq#Index| xs3 i_17_1))
 :pattern ( (|Seq#Index| xs3 i_17_1) (|Seq#Index| xs3 j_8_1))
)) (and (=> (= (ControlFlow 0 112) (- 0 120)) (forall ((i_18 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_18)) (dummyFunction (MapType0Select ExhaleHeap@1 (|Seq#Index| xs3 i_18) f_7))) (>= FullPerm NoPerm))
 :qid |stdinbpl.1887:19|
 :skolemid |189|
 :pattern ( (|Seq#Index| xs3 i_18))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_18)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_18)))
 :pattern ( (|Seq#Index| xs3 i_18))
))) (=> (forall ((i_18@@0 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_18@@0)) (dummyFunction (MapType0Select ExhaleHeap@1 (|Seq#Index| xs3 i_18@@0) f_7))) (>= FullPerm NoPerm))
 :qid |stdinbpl.1887:19|
 :skolemid |189|
 :pattern ( (|Seq#Index| xs3 i_18@@0))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_18@@0)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_18@@0)))
 :pattern ( (|Seq#Index| xs3 i_18@@0))
)) (and (=> (= (ControlFlow 0 112) (- 0 119)) (forall ((i_18@@1 Int) (i_18_1 Int) ) (!  (=> (and (and (and (and (not (= i_18@@1 i_18_1)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_18@@1))) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_18_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| xs3 i_18@@1) (|Seq#Index| xs3 i_18_1))))
 :qid |stdinbpl.1894:19|
 :skolemid |190|
 :pattern ( (neverTriggered19 i_18@@1) (neverTriggered19 i_18_1))
))) (=> (forall ((i_18@@2 Int) (i_18_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_18@@2 i_18_1@@0)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_18@@2))) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_18_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| xs3 i_18@@2) (|Seq#Index| xs3 i_18_1@@0))))
 :qid |stdinbpl.1894:19|
 :skolemid |190|
 :pattern ( (neverTriggered19 i_18@@2) (neverTriggered19 i_18_1@@0))
)) (and (=> (= (ControlFlow 0 112) (- 0 118)) (forall ((i_18@@3 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_18@@3)) (>= (U_2_real (MapType1Select QPMask@8 (|Seq#Index| xs3 i_18@@3) f_7)) FullPerm))
 :qid |stdinbpl.1901:19|
 :skolemid |191|
 :pattern ( (|Seq#Index| xs3 i_18@@3))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_18@@3)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_18@@3)))
 :pattern ( (|Seq#Index| xs3 i_18@@3))
))) (=> (forall ((i_18@@4 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_18@@4)) (>= (U_2_real (MapType1Select QPMask@8 (|Seq#Index| xs3 i_18@@4) f_7)) FullPerm))
 :qid |stdinbpl.1901:19|
 :skolemid |191|
 :pattern ( (|Seq#Index| xs3 i_18@@4))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_18@@4)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_18@@4)))
 :pattern ( (|Seq#Index| xs3 i_18@@4))
)) (=> (forall ((i_18@@5 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_18@@5)) (< NoPerm FullPerm)) (and (qpRange19 (|Seq#Index| xs3 i_18@@5)) (= (invRecv19 (|Seq#Index| xs3 i_18@@5)) i_18@@5)))
 :qid |stdinbpl.1907:24|
 :skolemid |192|
 :pattern ( (|Seq#Index| xs3 i_18@@5))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_18@@5)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_18@@5)))
 :pattern ( (|Seq#Index| xs3 i_18@@5))
)) (=> (and (and (forall ((o_3@@38 T@U) ) (!  (=> (= (type o_3@@38) RefType) (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U (invRecv19 o_3@@38))) (and (< NoPerm FullPerm) (qpRange19 o_3@@38))) (= (|Seq#Index| xs3 (invRecv19 o_3@@38)) o_3@@38)))
 :qid |stdinbpl.1911:24|
 :skolemid |193|
 :pattern ( (invRecv19 o_3@@38))
)) (forall ((o_3@@39 T@U) ) (!  (=> (= (type o_3@@39) RefType) (and (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U (invRecv19 o_3@@39))) (and (< NoPerm FullPerm) (qpRange19 o_3@@39))) (and (= (|Seq#Index| xs3 (invRecv19 o_3@@39)) o_3@@39) (= (U_2_real (MapType1Select QPMask@9 o_3@@39 f_7)) (- (U_2_real (MapType1Select QPMask@8 o_3@@39 f_7)) FullPerm)))) (=> (not (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U (invRecv19 o_3@@39))) (and (< NoPerm FullPerm) (qpRange19 o_3@@39)))) (= (U_2_real (MapType1Select QPMask@9 o_3@@39 f_7)) (U_2_real (MapType1Select QPMask@8 o_3@@39 f_7))))))
 :qid |stdinbpl.1917:24|
 :skolemid |194|
 :pattern ( (MapType1Select QPMask@9 o_3@@39 f_7))
))) (and (forall ((o_3@@40 T@U) (f_5@@12 T@U) ) (! (let ((B@@24 (FieldTypeInv1 (type f_5@@12))))
(let ((A@@25 (FieldTypeInv0 (type f_5@@12))))
 (=> (and (and (= (type o_3@@40) RefType) (= (type f_5@@12) (FieldType A@@25 B@@24))) (not (= f_5@@12 f_7))) (= (U_2_real (MapType1Select QPMask@8 o_3@@40 f_5@@12)) (U_2_real (MapType1Select QPMask@9 o_3@@40 f_5@@12))))))
 :qid |stdinbpl.1923:31|
 :skolemid |195|
 :pattern ( (MapType1Select QPMask@9 o_3@@40 f_5@@12))
)) (IdenticalOnKnownLocations ExhaleHeap@1 ExhaleHeap@2 QPMask@9))) (and (=> (= (ControlFlow 0 112) (- 0 117)) (forall ((i_19 Int) (i_19_1 Int) ) (!  (=> (and (and (and (and (not (= i_19 i_19_1)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_19))) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_19_1))) (< NoPerm arg_q_2@0)) (< NoPerm arg_q_2@0)) (not (= (|Seq#Index| xs3 i_19) (|Seq#Index| xs3 i_19_1))))
 :qid |stdinbpl.1936:17|
 :skolemid |196|
))) (=> (forall ((i_19@@0 Int) (i_19_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_19@@0 i_19_1@@0)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_19@@0))) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_19_1@@0))) (< NoPerm arg_q_2@0)) (< NoPerm arg_q_2@0)) (not (= (|Seq#Index| xs3 i_19@@0) (|Seq#Index| xs3 i_19_1@@0))))
 :qid |stdinbpl.1936:17|
 :skolemid |196|
)) (=> (and (forall ((i_19@@1 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_19@@1)) (< NoPerm arg_q_2@0)) (and (qpRange20 (|Seq#Index| xs3 i_19@@1)) (= (invRecv20 (|Seq#Index| xs3 i_19@@1)) i_19@@1)))
 :qid |stdinbpl.1942:24|
 :skolemid |197|
 :pattern ( (|Seq#Index| xs3 i_19@@1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_19@@1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_19@@1)))
 :pattern ( (|Seq#Index| xs3 i_19@@1))
)) (forall ((o_3@@41 T@U) ) (!  (=> (= (type o_3@@41) RefType) (=> (and (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U (invRecv20 o_3@@41))) (< NoPerm arg_q_2@0)) (qpRange20 o_3@@41)) (= (|Seq#Index| xs3 (invRecv20 o_3@@41)) o_3@@41)))
 :qid |stdinbpl.1946:24|
 :skolemid |198|
 :pattern ( (invRecv20 o_3@@41))
))) (and (=> (= (ControlFlow 0 112) (- 0 116)) (forall ((i_19@@2 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_19@@2)) (>= arg_q_2@0 NoPerm))
 :qid |stdinbpl.1952:17|
 :skolemid |199|
 :pattern ( (|Seq#Index| xs3 i_19@@2))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_19@@2)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_19@@2)))
 :pattern ( (|Seq#Index| xs3 i_19@@2))
))) (=> (forall ((i_19@@3 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_19@@3)) (>= arg_q_2@0 NoPerm))
 :qid |stdinbpl.1952:17|
 :skolemid |199|
 :pattern ( (|Seq#Index| xs3 i_19@@3))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_19@@3)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_19@@3)))
 :pattern ( (|Seq#Index| xs3 i_19@@3))
)) (=> (and (and (forall ((i_19@@4 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_19@@4)) (> arg_q_2@0 NoPerm)) (not (= (|Seq#Index| xs3 i_19@@4) null)))
 :qid |stdinbpl.1958:24|
 :skolemid |200|
 :pattern ( (|Seq#Index| xs3 i_19@@4))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_19@@4)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_19@@4)))
 :pattern ( (|Seq#Index| xs3 i_19@@4))
)) (forall ((o_3@@42 T@U) ) (!  (=> (= (type o_3@@42) RefType) (and (=> (and (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U (invRecv20 o_3@@42))) (< NoPerm arg_q_2@0)) (qpRange20 o_3@@42)) (and (=> (< NoPerm arg_q_2@0) (= (|Seq#Index| xs3 (invRecv20 o_3@@42)) o_3@@42)) (= (U_2_real (MapType1Select QPMask@10 o_3@@42 f_7)) (+ (U_2_real (MapType1Select QPMask@9 o_3@@42 f_7)) arg_q_2@0)))) (=> (not (and (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U (invRecv20 o_3@@42))) (< NoPerm arg_q_2@0)) (qpRange20 o_3@@42))) (= (U_2_real (MapType1Select QPMask@10 o_3@@42 f_7)) (U_2_real (MapType1Select QPMask@9 o_3@@42 f_7))))))
 :qid |stdinbpl.1964:24|
 :skolemid |201|
 :pattern ( (MapType1Select QPMask@10 o_3@@42 f_7))
))) (and (forall ((o_3@@43 T@U) (f_5@@13 T@U) ) (! (let ((B@@25 (FieldTypeInv1 (type f_5@@13))))
(let ((A@@26 (FieldTypeInv0 (type f_5@@13))))
 (=> (and (and (= (type o_3@@43) RefType) (= (type f_5@@13) (FieldType A@@26 B@@25))) (not (= f_5@@13 f_7))) (= (U_2_real (MapType1Select QPMask@9 o_3@@43 f_5@@13)) (U_2_real (MapType1Select QPMask@10 o_3@@43 f_5@@13))))))
 :qid |stdinbpl.1968:31|
 :skolemid |202|
 :pattern ( (MapType1Select QPMask@9 o_3@@43 f_5@@13))
 :pattern ( (MapType1Select QPMask@10 o_3@@43 f_5@@13))
)) (state ExhaleHeap@2 QPMask@10))) (and (=> (= (ControlFlow 0 112) (- 0 115)) (forall ((i_20 Int) (i_20_1 Int) ) (!  (=> (and (and (and (and (not (= i_20 i_20_1)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_20))) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_20_1))) (< NoPerm arg_q_2@0)) (< NoPerm arg_q_2@0)) (not (= (|Seq#Index| xs3 i_20) (|Seq#Index| xs3 i_20_1))))
 :qid |stdinbpl.1976:17|
 :skolemid |203|
))) (=> (forall ((i_20@@0 Int) (i_20_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_20@@0 i_20_1@@0)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_20@@0))) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_20_1@@0))) (< NoPerm arg_q_2@0)) (< NoPerm arg_q_2@0)) (not (= (|Seq#Index| xs3 i_20@@0) (|Seq#Index| xs3 i_20_1@@0))))
 :qid |stdinbpl.1976:17|
 :skolemid |203|
)) (=> (and (forall ((i_20@@1 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_20@@1)) (< NoPerm arg_q_2@0)) (and (qpRange21 (|Seq#Index| xs3 i_20@@1)) (= (invRecv21 (|Seq#Index| xs3 i_20@@1)) i_20@@1)))
 :qid |stdinbpl.1982:24|
 :skolemid |204|
 :pattern ( (|Seq#Index| xs3 i_20@@1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_20@@1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_20@@1)))
 :pattern ( (|Seq#Index| xs3 i_20@@1))
)) (forall ((o_3@@44 T@U) ) (!  (=> (= (type o_3@@44) RefType) (=> (and (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U (invRecv21 o_3@@44))) (< NoPerm arg_q_2@0)) (qpRange21 o_3@@44)) (= (|Seq#Index| xs3 (invRecv21 o_3@@44)) o_3@@44)))
 :qid |stdinbpl.1986:24|
 :skolemid |205|
 :pattern ( (invRecv21 o_3@@44))
))) (and (=> (= (ControlFlow 0 112) (- 0 114)) (forall ((i_20@@2 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_20@@2)) (>= arg_q_2@0 NoPerm))
 :qid |stdinbpl.1992:17|
 :skolemid |206|
 :pattern ( (|Seq#Index| xs3 i_20@@2))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_20@@2)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_20@@2)))
 :pattern ( (|Seq#Index| xs3 i_20@@2))
))) (=> (forall ((i_20@@3 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_20@@3)) (>= arg_q_2@0 NoPerm))
 :qid |stdinbpl.1992:17|
 :skolemid |206|
 :pattern ( (|Seq#Index| xs3 i_20@@3))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_20@@3)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_20@@3)))
 :pattern ( (|Seq#Index| xs3 i_20@@3))
)) (=> (forall ((i_20@@4 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_20@@4)) (> arg_q_2@0 NoPerm)) (not (= (|Seq#Index| xs3 i_20@@4) null)))
 :qid |stdinbpl.1998:24|
 :skolemid |207|
 :pattern ( (|Seq#Index| xs3 i_20@@4))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_20@@4)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_20@@4)))
 :pattern ( (|Seq#Index| xs3 i_20@@4))
)) (=> (and (forall ((o_3@@45 T@U) ) (!  (=> (= (type o_3@@45) RefType) (and (=> (and (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U (invRecv21 o_3@@45))) (< NoPerm arg_q_2@0)) (qpRange21 o_3@@45)) (and (=> (< NoPerm arg_q_2@0) (= (|Seq#Index| xs3 (invRecv21 o_3@@45)) o_3@@45)) (= (U_2_real (MapType1Select QPMask@11 o_3@@45 f_7)) (+ (U_2_real (MapType1Select QPMask@10 o_3@@45 f_7)) arg_q_2@0)))) (=> (not (and (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U (invRecv21 o_3@@45))) (< NoPerm arg_q_2@0)) (qpRange21 o_3@@45))) (= (U_2_real (MapType1Select QPMask@11 o_3@@45 f_7)) (U_2_real (MapType1Select QPMask@10 o_3@@45 f_7))))))
 :qid |stdinbpl.2004:24|
 :skolemid |208|
 :pattern ( (MapType1Select QPMask@11 o_3@@45 f_7))
)) (forall ((o_3@@46 T@U) (f_5@@14 T@U) ) (! (let ((B@@26 (FieldTypeInv1 (type f_5@@14))))
(let ((A@@27 (FieldTypeInv0 (type f_5@@14))))
 (=> (and (and (= (type o_3@@46) RefType) (= (type f_5@@14) (FieldType A@@27 B@@26))) (not (= f_5@@14 f_7))) (= (U_2_real (MapType1Select QPMask@10 o_3@@46 f_5@@14)) (U_2_real (MapType1Select QPMask@11 o_3@@46 f_5@@14))))))
 :qid |stdinbpl.2008:31|
 :skolemid |209|
 :pattern ( (MapType1Select QPMask@10 o_3@@46 f_5@@14))
 :pattern ( (MapType1Select QPMask@11 o_3@@46 f_5@@14))
))) (=> (and (and (state ExhaleHeap@2 QPMask@11) (state ExhaleHeap@2 QPMask@11)) (and (state ExhaleHeap@2 QPMask@11) (= arg_p_3@0 (/ (to_real 1) (to_real 2))))) (and (=> (= (ControlFlow 0 112) (- 0 113)) (<= NoPerm arg_p_3@0)) (=> (<= NoPerm arg_p_3@0) (and (and (=> (= (ControlFlow 0 112) 107) anon59_Else_correct) (=> (= (ControlFlow 0 112) 14) anon60_Then_correct)) (=> (= (ControlFlow 0 112) 16) anon60_Else_correct)))))))))))))))))))))))))))))
(let ((anon11_correct true))
(let ((anon58_Else_correct  (=> (and (not (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_16_1)) (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U j_7)) (not (= i_16_1 j_7))))) (= (ControlFlow 0 12) 9)) anon11_correct)))
(let ((anon58_Then_correct  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_16_1)) (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U j_7)) (not (= i_16_1 j_7)))) (and (=> (= (ControlFlow 0 10) (- 0 11)) (not (= (|Seq#Index| xs3 i_16_1) (|Seq#Index| xs3 j_7)))) (=> (not (= (|Seq#Index| xs3 i_16_1) (|Seq#Index| xs3 j_7))) (=> (= (ControlFlow 0 10) 9) anon11_correct))))))
(let ((anon55_Else_correct  (=> (forall ((i_12_1 Int) (j_6_1 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_12_1)) (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U j_6_1)) (not (= i_12_1 j_6_1)))) (not (= (|Seq#Index| xs2 i_12_1) (|Seq#Index| xs2 j_6_1))))
 :qid |stdinbpl.1721:22|
 :skolemid |166|
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_12_1)) (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U j_6_1)))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_12_1)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U j_6_1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_12_1)) (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U j_6_1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_12_1)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U j_6_1)))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_12_1)) (|Seq#Index| xs2 j_6_1))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_12_1)) (|Seq#Index| xs2 j_6_1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U j_6_1)) (|Seq#Index| xs2 i_12_1))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U j_6_1)) (|Seq#Index| xs2 i_12_1))
 :pattern ( (|Seq#Index| xs2 i_12_1) (|Seq#Index| xs2 j_6_1))
)) (and (=> (= (ControlFlow 0 121) (- 0 130)) (forall ((i_13 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_13)) (dummyFunction (MapType0Select ExhaleHeap@0 (|Seq#Index| xs2 i_13) f_7))) (>= arg_p_1@0 NoPerm))
 :qid |stdinbpl.1729:19|
 :skolemid |167|
 :pattern ( (|Seq#Index| xs2 i_13))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_13)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_13)))
 :pattern ( (|Seq#Index| xs2 i_13))
))) (=> (forall ((i_13@@0 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_13@@0)) (dummyFunction (MapType0Select ExhaleHeap@0 (|Seq#Index| xs2 i_13@@0) f_7))) (>= arg_p_1@0 NoPerm))
 :qid |stdinbpl.1729:19|
 :skolemid |167|
 :pattern ( (|Seq#Index| xs2 i_13@@0))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_13@@0)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_13@@0)))
 :pattern ( (|Seq#Index| xs2 i_13@@0))
)) (and (=> (= (ControlFlow 0 121) (- 0 129)) (forall ((i_13@@1 Int) (i_13_1 Int) ) (!  (=> (and (and (and (and (not (= i_13@@1 i_13_1)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_13@@1))) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_13_1))) (< NoPerm arg_p_1@0)) (< NoPerm arg_p_1@0)) (not (= (|Seq#Index| xs2 i_13@@1) (|Seq#Index| xs2 i_13_1))))
 :qid |stdinbpl.1736:19|
 :skolemid |168|
 :pattern ( (neverTriggered16 i_13@@1) (neverTriggered16 i_13_1))
))) (=> (forall ((i_13@@2 Int) (i_13_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_13@@2 i_13_1@@0)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_13@@2))) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_13_1@@0))) (< NoPerm arg_p_1@0)) (< NoPerm arg_p_1@0)) (not (= (|Seq#Index| xs2 i_13@@2) (|Seq#Index| xs2 i_13_1@@0))))
 :qid |stdinbpl.1736:19|
 :skolemid |168|
 :pattern ( (neverTriggered16 i_13@@2) (neverTriggered16 i_13_1@@0))
)) (and (=> (= (ControlFlow 0 121) (- 0 128)) (forall ((i_13@@3 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_13@@3)) (>= (U_2_real (MapType1Select QPMask@5 (|Seq#Index| xs2 i_13@@3) f_7)) arg_p_1@0))
 :qid |stdinbpl.1743:19|
 :skolemid |169|
 :pattern ( (|Seq#Index| xs2 i_13@@3))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_13@@3)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_13@@3)))
 :pattern ( (|Seq#Index| xs2 i_13@@3))
))) (=> (forall ((i_13@@4 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_13@@4)) (>= (U_2_real (MapType1Select QPMask@5 (|Seq#Index| xs2 i_13@@4) f_7)) arg_p_1@0))
 :qid |stdinbpl.1743:19|
 :skolemid |169|
 :pattern ( (|Seq#Index| xs2 i_13@@4))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_13@@4)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_13@@4)))
 :pattern ( (|Seq#Index| xs2 i_13@@4))
)) (=> (forall ((i_13@@5 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_13@@5)) (< NoPerm arg_p_1@0)) (and (qpRange16 (|Seq#Index| xs2 i_13@@5)) (= (invRecv16 (|Seq#Index| xs2 i_13@@5)) i_13@@5)))
 :qid |stdinbpl.1749:24|
 :skolemid |170|
 :pattern ( (|Seq#Index| xs2 i_13@@5))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_13@@5)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_13@@5)))
 :pattern ( (|Seq#Index| xs2 i_13@@5))
)) (=> (and (and (forall ((o_3@@47 T@U) ) (!  (=> (= (type o_3@@47) RefType) (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U (invRecv16 o_3@@47))) (and (< NoPerm arg_p_1@0) (qpRange16 o_3@@47))) (= (|Seq#Index| xs2 (invRecv16 o_3@@47)) o_3@@47)))
 :qid |stdinbpl.1753:24|
 :skolemid |171|
 :pattern ( (invRecv16 o_3@@47))
)) (forall ((o_3@@48 T@U) ) (!  (=> (= (type o_3@@48) RefType) (and (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U (invRecv16 o_3@@48))) (and (< NoPerm arg_p_1@0) (qpRange16 o_3@@48))) (and (= (|Seq#Index| xs2 (invRecv16 o_3@@48)) o_3@@48) (= (U_2_real (MapType1Select QPMask@6 o_3@@48 f_7)) (- (U_2_real (MapType1Select QPMask@5 o_3@@48 f_7)) arg_p_1@0)))) (=> (not (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U (invRecv16 o_3@@48))) (and (< NoPerm arg_p_1@0) (qpRange16 o_3@@48)))) (= (U_2_real (MapType1Select QPMask@6 o_3@@48 f_7)) (U_2_real (MapType1Select QPMask@5 o_3@@48 f_7))))))
 :qid |stdinbpl.1759:24|
 :skolemid |172|
 :pattern ( (MapType1Select QPMask@6 o_3@@48 f_7))
))) (and (forall ((o_3@@49 T@U) (f_5@@15 T@U) ) (! (let ((B@@27 (FieldTypeInv1 (type f_5@@15))))
(let ((A@@28 (FieldTypeInv0 (type f_5@@15))))
 (=> (and (and (= (type o_3@@49) RefType) (= (type f_5@@15) (FieldType A@@28 B@@27))) (not (= f_5@@15 f_7))) (= (U_2_real (MapType1Select QPMask@5 o_3@@49 f_5@@15)) (U_2_real (MapType1Select QPMask@6 o_3@@49 f_5@@15))))))
 :qid |stdinbpl.1765:31|
 :skolemid |173|
 :pattern ( (MapType1Select QPMask@6 o_3@@49 f_5@@15))
)) (IdenticalOnKnownLocations ExhaleHeap@0 ExhaleHeap@1 QPMask@6))) (and (=> (= (ControlFlow 0 121) (- 0 127)) (forall ((i_14 Int) (i_14_1 Int) ) (!  (=> (and (and (and (and (not (= i_14 i_14_1)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_14))) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_14_1))) (< NoPerm arg_q_1@0)) (< NoPerm arg_q_1@0)) (not (= (|Seq#Index| xs2 i_14) (|Seq#Index| xs2 i_14_1))))
 :qid |stdinbpl.1778:17|
 :skolemid |174|
))) (=> (forall ((i_14@@0 Int) (i_14_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_14@@0 i_14_1@@0)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_14@@0))) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_14_1@@0))) (< NoPerm arg_q_1@0)) (< NoPerm arg_q_1@0)) (not (= (|Seq#Index| xs2 i_14@@0) (|Seq#Index| xs2 i_14_1@@0))))
 :qid |stdinbpl.1778:17|
 :skolemid |174|
)) (=> (and (forall ((i_14@@1 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_14@@1)) (< NoPerm arg_q_1@0)) (and (qpRange17 (|Seq#Index| xs2 i_14@@1)) (= (invRecv17 (|Seq#Index| xs2 i_14@@1)) i_14@@1)))
 :qid |stdinbpl.1784:24|
 :skolemid |175|
 :pattern ( (|Seq#Index| xs2 i_14@@1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_14@@1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_14@@1)))
 :pattern ( (|Seq#Index| xs2 i_14@@1))
)) (forall ((o_3@@50 T@U) ) (!  (=> (= (type o_3@@50) RefType) (=> (and (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U (invRecv17 o_3@@50))) (< NoPerm arg_q_1@0)) (qpRange17 o_3@@50)) (= (|Seq#Index| xs2 (invRecv17 o_3@@50)) o_3@@50)))
 :qid |stdinbpl.1788:24|
 :skolemid |176|
 :pattern ( (invRecv17 o_3@@50))
))) (and (=> (= (ControlFlow 0 121) (- 0 126)) (forall ((i_14@@2 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_14@@2)) (>= arg_q_1@0 NoPerm))
 :qid |stdinbpl.1794:17|
 :skolemid |177|
 :pattern ( (|Seq#Index| xs2 i_14@@2))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_14@@2)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_14@@2)))
 :pattern ( (|Seq#Index| xs2 i_14@@2))
))) (=> (forall ((i_14@@3 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_14@@3)) (>= arg_q_1@0 NoPerm))
 :qid |stdinbpl.1794:17|
 :skolemid |177|
 :pattern ( (|Seq#Index| xs2 i_14@@3))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_14@@3)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_14@@3)))
 :pattern ( (|Seq#Index| xs2 i_14@@3))
)) (=> (and (and (forall ((i_14@@4 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_14@@4)) (> arg_q_1@0 NoPerm)) (not (= (|Seq#Index| xs2 i_14@@4) null)))
 :qid |stdinbpl.1800:24|
 :skolemid |178|
 :pattern ( (|Seq#Index| xs2 i_14@@4))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_14@@4)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_14@@4)))
 :pattern ( (|Seq#Index| xs2 i_14@@4))
)) (forall ((o_3@@51 T@U) ) (!  (=> (= (type o_3@@51) RefType) (and (=> (and (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U (invRecv17 o_3@@51))) (< NoPerm arg_q_1@0)) (qpRange17 o_3@@51)) (and (=> (< NoPerm arg_q_1@0) (= (|Seq#Index| xs2 (invRecv17 o_3@@51)) o_3@@51)) (= (U_2_real (MapType1Select QPMask@7 o_3@@51 f_7)) (+ (U_2_real (MapType1Select QPMask@6 o_3@@51 f_7)) arg_q_1@0)))) (=> (not (and (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U (invRecv17 o_3@@51))) (< NoPerm arg_q_1@0)) (qpRange17 o_3@@51))) (= (U_2_real (MapType1Select QPMask@7 o_3@@51 f_7)) (U_2_real (MapType1Select QPMask@6 o_3@@51 f_7))))))
 :qid |stdinbpl.1806:24|
 :skolemid |179|
 :pattern ( (MapType1Select QPMask@7 o_3@@51 f_7))
))) (and (forall ((o_3@@52 T@U) (f_5@@16 T@U) ) (! (let ((B@@28 (FieldTypeInv1 (type f_5@@16))))
(let ((A@@29 (FieldTypeInv0 (type f_5@@16))))
 (=> (and (and (= (type o_3@@52) RefType) (= (type f_5@@16) (FieldType A@@29 B@@28))) (not (= f_5@@16 f_7))) (= (U_2_real (MapType1Select QPMask@6 o_3@@52 f_5@@16)) (U_2_real (MapType1Select QPMask@7 o_3@@52 f_5@@16))))))
 :qid |stdinbpl.1810:31|
 :skolemid |180|
 :pattern ( (MapType1Select QPMask@6 o_3@@52 f_5@@16))
 :pattern ( (MapType1Select QPMask@7 o_3@@52 f_5@@16))
)) (state ExhaleHeap@1 QPMask@7))) (and (=> (= (ControlFlow 0 121) (- 0 125)) (forall ((i_15 Int) (i_15_1 Int) ) (!  (=> (and (and (and (and (not (= i_15 i_15_1)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_15))) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_15_1))) (< NoPerm arg_q_1@0)) (< NoPerm arg_q_1@0)) (not (= (|Seq#Index| xs2 i_15) (|Seq#Index| xs2 i_15_1))))
 :qid |stdinbpl.1818:17|
 :skolemid |181|
))) (=> (forall ((i_15@@0 Int) (i_15_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_15@@0 i_15_1@@0)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_15@@0))) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_15_1@@0))) (< NoPerm arg_q_1@0)) (< NoPerm arg_q_1@0)) (not (= (|Seq#Index| xs2 i_15@@0) (|Seq#Index| xs2 i_15_1@@0))))
 :qid |stdinbpl.1818:17|
 :skolemid |181|
)) (=> (and (forall ((i_15@@1 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_15@@1)) (< NoPerm arg_q_1@0)) (and (qpRange18 (|Seq#Index| xs2 i_15@@1)) (= (invRecv18 (|Seq#Index| xs2 i_15@@1)) i_15@@1)))
 :qid |stdinbpl.1824:24|
 :skolemid |182|
 :pattern ( (|Seq#Index| xs2 i_15@@1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_15@@1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_15@@1)))
 :pattern ( (|Seq#Index| xs2 i_15@@1))
)) (forall ((o_3@@53 T@U) ) (!  (=> (= (type o_3@@53) RefType) (=> (and (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U (invRecv18 o_3@@53))) (< NoPerm arg_q_1@0)) (qpRange18 o_3@@53)) (= (|Seq#Index| xs2 (invRecv18 o_3@@53)) o_3@@53)))
 :qid |stdinbpl.1828:24|
 :skolemid |183|
 :pattern ( (invRecv18 o_3@@53))
))) (and (=> (= (ControlFlow 0 121) (- 0 124)) (forall ((i_15@@2 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_15@@2)) (>= arg_q_1@0 NoPerm))
 :qid |stdinbpl.1834:17|
 :skolemid |184|
 :pattern ( (|Seq#Index| xs2 i_15@@2))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_15@@2)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_15@@2)))
 :pattern ( (|Seq#Index| xs2 i_15@@2))
))) (=> (forall ((i_15@@3 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_15@@3)) (>= arg_q_1@0 NoPerm))
 :qid |stdinbpl.1834:17|
 :skolemid |184|
 :pattern ( (|Seq#Index| xs2 i_15@@3))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_15@@3)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_15@@3)))
 :pattern ( (|Seq#Index| xs2 i_15@@3))
)) (=> (forall ((i_15@@4 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_15@@4)) (> arg_q_1@0 NoPerm)) (not (= (|Seq#Index| xs2 i_15@@4) null)))
 :qid |stdinbpl.1840:24|
 :skolemid |185|
 :pattern ( (|Seq#Index| xs2 i_15@@4))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_15@@4)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_15@@4)))
 :pattern ( (|Seq#Index| xs2 i_15@@4))
)) (=> (and (forall ((o_3@@54 T@U) ) (!  (=> (= (type o_3@@54) RefType) (and (=> (and (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U (invRecv18 o_3@@54))) (< NoPerm arg_q_1@0)) (qpRange18 o_3@@54)) (and (=> (< NoPerm arg_q_1@0) (= (|Seq#Index| xs2 (invRecv18 o_3@@54)) o_3@@54)) (= (U_2_real (MapType1Select QPMask@8 o_3@@54 f_7)) (+ (U_2_real (MapType1Select QPMask@7 o_3@@54 f_7)) arg_q_1@0)))) (=> (not (and (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U (invRecv18 o_3@@54))) (< NoPerm arg_q_1@0)) (qpRange18 o_3@@54))) (= (U_2_real (MapType1Select QPMask@8 o_3@@54 f_7)) (U_2_real (MapType1Select QPMask@7 o_3@@54 f_7))))))
 :qid |stdinbpl.1846:24|
 :skolemid |186|
 :pattern ( (MapType1Select QPMask@8 o_3@@54 f_7))
)) (forall ((o_3@@55 T@U) (f_5@@17 T@U) ) (! (let ((B@@29 (FieldTypeInv1 (type f_5@@17))))
(let ((A@@30 (FieldTypeInv0 (type f_5@@17))))
 (=> (and (and (= (type o_3@@55) RefType) (= (type f_5@@17) (FieldType A@@30 B@@29))) (not (= f_5@@17 f_7))) (= (U_2_real (MapType1Select QPMask@7 o_3@@55 f_5@@17)) (U_2_real (MapType1Select QPMask@8 o_3@@55 f_5@@17))))))
 :qid |stdinbpl.1850:31|
 :skolemid |187|
 :pattern ( (MapType1Select QPMask@7 o_3@@55 f_5@@17))
 :pattern ( (MapType1Select QPMask@8 o_3@@55 f_5@@17))
))) (=> (and (and (state ExhaleHeap@1 QPMask@8) (state ExhaleHeap@1 QPMask@8)) (and (state ExhaleHeap@1 QPMask@8) (= arg_q_2@0 (/ (to_real 1) (to_real 2))))) (and (=> (= (ControlFlow 0 121) (- 0 123)) (= FullPerm (* (to_real 2) arg_q_2@0))) (=> (= FullPerm (* (to_real 2) arg_q_2@0)) (and (=> (= (ControlFlow 0 121) (- 0 122)) (<= NoPerm FullPerm)) (=> (<= NoPerm FullPerm) (and (and (=> (= (ControlFlow 0 121) 112) anon57_Else_correct) (=> (= (ControlFlow 0 121) 10) anon58_Then_correct)) (=> (= (ControlFlow 0 121) 12) anon58_Else_correct)))))))))))))))))))))))))))))))
(let ((anon7_correct true))
(let ((anon56_Else_correct  (=> (and (not (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_11_1)) (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U j_5)) (not (= i_11_1 j_5))))) (= (ControlFlow 0 8) 5)) anon7_correct)))
(let ((anon56_Then_correct  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_11_1)) (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U j_5)) (not (= i_11_1 j_5)))) (and (=> (= (ControlFlow 0 6) (- 0 7)) (not (= (|Seq#Index| xs2 i_11_1) (|Seq#Index| xs2 j_5)))) (=> (not (= (|Seq#Index| xs2 i_11_1) (|Seq#Index| xs2 j_5))) (=> (= (ControlFlow 0 6) 5) anon7_correct))))))
(let ((anon53_Else_correct  (=> (forall ((i_7_1_1 Int) (j_4_1 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_7_1_1)) (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U j_4_1)) (not (= i_7_1_1 j_4_1)))) (not (= (|Seq#Index| xs1 i_7_1_1) (|Seq#Index| xs1 j_4_1))))
 :qid |stdinbpl.1563:22|
 :skolemid |144|
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_7_1_1)) (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U j_4_1)))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_7_1_1)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U j_4_1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_7_1_1)) (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U j_4_1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_7_1_1)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U j_4_1)))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_7_1_1)) (|Seq#Index| xs1 j_4_1))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_7_1_1)) (|Seq#Index| xs1 j_4_1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U j_4_1)) (|Seq#Index| xs1 i_7_1_1))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U j_4_1)) (|Seq#Index| xs1 i_7_1_1))
 :pattern ( (|Seq#Index| xs1 i_7_1_1) (|Seq#Index| xs1 j_4_1))
)) (and (=> (= (ControlFlow 0 131) (- 0 140)) (forall ((i_8 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_8)) (dummyFunction (MapType0Select Heap@@9 (|Seq#Index| xs1 i_8) f_7))) (>= FullPerm NoPerm))
 :qid |stdinbpl.1571:19|
 :skolemid |145|
 :pattern ( (|Seq#Index| xs1 i_8))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_8)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_8)))
 :pattern ( (|Seq#Index| xs1 i_8))
))) (=> (forall ((i_8@@0 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_8@@0)) (dummyFunction (MapType0Select Heap@@9 (|Seq#Index| xs1 i_8@@0) f_7))) (>= FullPerm NoPerm))
 :qid |stdinbpl.1571:19|
 :skolemid |145|
 :pattern ( (|Seq#Index| xs1 i_8@@0))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_8@@0)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_8@@0)))
 :pattern ( (|Seq#Index| xs1 i_8@@0))
)) (and (=> (= (ControlFlow 0 131) (- 0 139)) (forall ((i_8@@1 Int) (i_8_1 Int) ) (!  (=> (and (and (and (and (not (= i_8@@1 i_8_1)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_8@@1))) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_8_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| xs1 i_8@@1) (|Seq#Index| xs1 i_8_1))))
 :qid |stdinbpl.1578:19|
 :skolemid |146|
 :pattern ( (neverTriggered13 i_8@@1) (neverTriggered13 i_8_1))
))) (=> (forall ((i_8@@2 Int) (i_8_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_8@@2 i_8_1@@0)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_8@@2))) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_8_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| xs1 i_8@@2) (|Seq#Index| xs1 i_8_1@@0))))
 :qid |stdinbpl.1578:19|
 :skolemid |146|
 :pattern ( (neverTriggered13 i_8@@2) (neverTriggered13 i_8_1@@0))
)) (and (=> (= (ControlFlow 0 131) (- 0 138)) (forall ((i_8@@3 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_8@@3)) (>= (U_2_real (MapType1Select QPMask@2 (|Seq#Index| xs1 i_8@@3) f_7)) FullPerm))
 :qid |stdinbpl.1585:19|
 :skolemid |147|
 :pattern ( (|Seq#Index| xs1 i_8@@3))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_8@@3)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_8@@3)))
 :pattern ( (|Seq#Index| xs1 i_8@@3))
))) (=> (forall ((i_8@@4 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_8@@4)) (>= (U_2_real (MapType1Select QPMask@2 (|Seq#Index| xs1 i_8@@4) f_7)) FullPerm))
 :qid |stdinbpl.1585:19|
 :skolemid |147|
 :pattern ( (|Seq#Index| xs1 i_8@@4))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_8@@4)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_8@@4)))
 :pattern ( (|Seq#Index| xs1 i_8@@4))
)) (=> (forall ((i_8@@5 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_8@@5)) (< NoPerm FullPerm)) (and (qpRange13 (|Seq#Index| xs1 i_8@@5)) (= (invRecv13 (|Seq#Index| xs1 i_8@@5)) i_8@@5)))
 :qid |stdinbpl.1591:24|
 :skolemid |148|
 :pattern ( (|Seq#Index| xs1 i_8@@5))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_8@@5)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_8@@5)))
 :pattern ( (|Seq#Index| xs1 i_8@@5))
)) (=> (and (and (forall ((o_3@@56 T@U) ) (!  (=> (= (type o_3@@56) RefType) (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U (invRecv13 o_3@@56))) (and (< NoPerm FullPerm) (qpRange13 o_3@@56))) (= (|Seq#Index| xs1 (invRecv13 o_3@@56)) o_3@@56)))
 :qid |stdinbpl.1595:24|
 :skolemid |149|
 :pattern ( (invRecv13 o_3@@56))
)) (forall ((o_3@@57 T@U) ) (!  (=> (= (type o_3@@57) RefType) (and (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U (invRecv13 o_3@@57))) (and (< NoPerm FullPerm) (qpRange13 o_3@@57))) (and (= (|Seq#Index| xs1 (invRecv13 o_3@@57)) o_3@@57) (= (U_2_real (MapType1Select QPMask@3 o_3@@57 f_7)) (- (U_2_real (MapType1Select QPMask@2 o_3@@57 f_7)) FullPerm)))) (=> (not (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U (invRecv13 o_3@@57))) (and (< NoPerm FullPerm) (qpRange13 o_3@@57)))) (= (U_2_real (MapType1Select QPMask@3 o_3@@57 f_7)) (U_2_real (MapType1Select QPMask@2 o_3@@57 f_7))))))
 :qid |stdinbpl.1601:24|
 :skolemid |150|
 :pattern ( (MapType1Select QPMask@3 o_3@@57 f_7))
))) (and (forall ((o_3@@58 T@U) (f_5@@18 T@U) ) (! (let ((B@@30 (FieldTypeInv1 (type f_5@@18))))
(let ((A@@31 (FieldTypeInv0 (type f_5@@18))))
 (=> (and (and (= (type o_3@@58) RefType) (= (type f_5@@18) (FieldType A@@31 B@@30))) (not (= f_5@@18 f_7))) (= (U_2_real (MapType1Select QPMask@2 o_3@@58 f_5@@18)) (U_2_real (MapType1Select QPMask@3 o_3@@58 f_5@@18))))))
 :qid |stdinbpl.1607:31|
 :skolemid |151|
 :pattern ( (MapType1Select QPMask@3 o_3@@58 f_5@@18))
)) (IdenticalOnKnownLocations Heap@@9 ExhaleHeap@0 QPMask@3))) (and (=> (= (ControlFlow 0 131) (- 0 137)) (forall ((i_9 Int) (i_9_1 Int) ) (!  (=> (and (and (and (and (not (= i_9 i_9_1)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_9))) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_9_1))) (< NoPerm arg_q@0)) (< NoPerm arg_q@0)) (not (= (|Seq#Index| xs1 i_9) (|Seq#Index| xs1 i_9_1))))
 :qid |stdinbpl.1620:17|
 :skolemid |152|
))) (=> (forall ((i_9@@0 Int) (i_9_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_9@@0 i_9_1@@0)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_9@@0))) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_9_1@@0))) (< NoPerm arg_q@0)) (< NoPerm arg_q@0)) (not (= (|Seq#Index| xs1 i_9@@0) (|Seq#Index| xs1 i_9_1@@0))))
 :qid |stdinbpl.1620:17|
 :skolemid |152|
)) (=> (and (forall ((i_9@@1 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_9@@1)) (< NoPerm arg_q@0)) (and (qpRange14 (|Seq#Index| xs1 i_9@@1)) (= (invRecv14 (|Seq#Index| xs1 i_9@@1)) i_9@@1)))
 :qid |stdinbpl.1626:24|
 :skolemid |153|
 :pattern ( (|Seq#Index| xs1 i_9@@1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_9@@1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_9@@1)))
 :pattern ( (|Seq#Index| xs1 i_9@@1))
)) (forall ((o_3@@59 T@U) ) (!  (=> (= (type o_3@@59) RefType) (=> (and (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U (invRecv14 o_3@@59))) (< NoPerm arg_q@0)) (qpRange14 o_3@@59)) (= (|Seq#Index| xs1 (invRecv14 o_3@@59)) o_3@@59)))
 :qid |stdinbpl.1630:24|
 :skolemid |154|
 :pattern ( (invRecv14 o_3@@59))
))) (and (=> (= (ControlFlow 0 131) (- 0 136)) (forall ((i_9@@2 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_9@@2)) (>= arg_q@0 NoPerm))
 :qid |stdinbpl.1636:17|
 :skolemid |155|
 :pattern ( (|Seq#Index| xs1 i_9@@2))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_9@@2)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_9@@2)))
 :pattern ( (|Seq#Index| xs1 i_9@@2))
))) (=> (forall ((i_9@@3 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_9@@3)) (>= arg_q@0 NoPerm))
 :qid |stdinbpl.1636:17|
 :skolemid |155|
 :pattern ( (|Seq#Index| xs1 i_9@@3))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_9@@3)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_9@@3)))
 :pattern ( (|Seq#Index| xs1 i_9@@3))
)) (=> (and (and (forall ((i_9@@4 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_9@@4)) (> arg_q@0 NoPerm)) (not (= (|Seq#Index| xs1 i_9@@4) null)))
 :qid |stdinbpl.1642:24|
 :skolemid |156|
 :pattern ( (|Seq#Index| xs1 i_9@@4))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_9@@4)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_9@@4)))
 :pattern ( (|Seq#Index| xs1 i_9@@4))
)) (forall ((o_3@@60 T@U) ) (!  (=> (= (type o_3@@60) RefType) (and (=> (and (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U (invRecv14 o_3@@60))) (< NoPerm arg_q@0)) (qpRange14 o_3@@60)) (and (=> (< NoPerm arg_q@0) (= (|Seq#Index| xs1 (invRecv14 o_3@@60)) o_3@@60)) (= (U_2_real (MapType1Select QPMask@4 o_3@@60 f_7)) (+ (U_2_real (MapType1Select QPMask@3 o_3@@60 f_7)) arg_q@0)))) (=> (not (and (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U (invRecv14 o_3@@60))) (< NoPerm arg_q@0)) (qpRange14 o_3@@60))) (= (U_2_real (MapType1Select QPMask@4 o_3@@60 f_7)) (U_2_real (MapType1Select QPMask@3 o_3@@60 f_7))))))
 :qid |stdinbpl.1648:24|
 :skolemid |157|
 :pattern ( (MapType1Select QPMask@4 o_3@@60 f_7))
))) (and (forall ((o_3@@61 T@U) (f_5@@19 T@U) ) (! (let ((B@@31 (FieldTypeInv1 (type f_5@@19))))
(let ((A@@32 (FieldTypeInv0 (type f_5@@19))))
 (=> (and (and (= (type o_3@@61) RefType) (= (type f_5@@19) (FieldType A@@32 B@@31))) (not (= f_5@@19 f_7))) (= (U_2_real (MapType1Select QPMask@3 o_3@@61 f_5@@19)) (U_2_real (MapType1Select QPMask@4 o_3@@61 f_5@@19))))))
 :qid |stdinbpl.1652:31|
 :skolemid |158|
 :pattern ( (MapType1Select QPMask@3 o_3@@61 f_5@@19))
 :pattern ( (MapType1Select QPMask@4 o_3@@61 f_5@@19))
)) (state ExhaleHeap@0 QPMask@4))) (and (=> (= (ControlFlow 0 131) (- 0 135)) (forall ((i_10 Int) (i_10_1 Int) ) (!  (=> (and (and (and (and (not (= i_10 i_10_1)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_10))) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_10_1))) (< NoPerm arg_q@0)) (< NoPerm arg_q@0)) (not (= (|Seq#Index| xs1 i_10) (|Seq#Index| xs1 i_10_1))))
 :qid |stdinbpl.1660:17|
 :skolemid |159|
))) (=> (forall ((i_10@@0 Int) (i_10_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_10@@0 i_10_1@@0)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_10@@0))) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_10_1@@0))) (< NoPerm arg_q@0)) (< NoPerm arg_q@0)) (not (= (|Seq#Index| xs1 i_10@@0) (|Seq#Index| xs1 i_10_1@@0))))
 :qid |stdinbpl.1660:17|
 :skolemid |159|
)) (=> (and (forall ((i_10@@1 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_10@@1)) (< NoPerm arg_q@0)) (and (qpRange15 (|Seq#Index| xs1 i_10@@1)) (= (invRecv15 (|Seq#Index| xs1 i_10@@1)) i_10@@1)))
 :qid |stdinbpl.1666:24|
 :skolemid |160|
 :pattern ( (|Seq#Index| xs1 i_10@@1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_10@@1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_10@@1)))
 :pattern ( (|Seq#Index| xs1 i_10@@1))
)) (forall ((o_3@@62 T@U) ) (!  (=> (= (type o_3@@62) RefType) (=> (and (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U (invRecv15 o_3@@62))) (< NoPerm arg_q@0)) (qpRange15 o_3@@62)) (= (|Seq#Index| xs1 (invRecv15 o_3@@62)) o_3@@62)))
 :qid |stdinbpl.1670:24|
 :skolemid |161|
 :pattern ( (invRecv15 o_3@@62))
))) (and (=> (= (ControlFlow 0 131) (- 0 134)) (forall ((i_10@@2 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_10@@2)) (>= arg_q@0 NoPerm))
 :qid |stdinbpl.1676:17|
 :skolemid |162|
 :pattern ( (|Seq#Index| xs1 i_10@@2))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_10@@2)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_10@@2)))
 :pattern ( (|Seq#Index| xs1 i_10@@2))
))) (=> (forall ((i_10@@3 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_10@@3)) (>= arg_q@0 NoPerm))
 :qid |stdinbpl.1676:17|
 :skolemid |162|
 :pattern ( (|Seq#Index| xs1 i_10@@3))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_10@@3)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_10@@3)))
 :pattern ( (|Seq#Index| xs1 i_10@@3))
)) (=> (and (and (and (forall ((i_10@@4 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_10@@4)) (> arg_q@0 NoPerm)) (not (= (|Seq#Index| xs1 i_10@@4) null)))
 :qid |stdinbpl.1682:24|
 :skolemid |163|
 :pattern ( (|Seq#Index| xs1 i_10@@4))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_10@@4)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_10@@4)))
 :pattern ( (|Seq#Index| xs1 i_10@@4))
)) (forall ((o_3@@63 T@U) ) (!  (=> (= (type o_3@@63) RefType) (and (=> (and (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U (invRecv15 o_3@@63))) (< NoPerm arg_q@0)) (qpRange15 o_3@@63)) (and (=> (< NoPerm arg_q@0) (= (|Seq#Index| xs1 (invRecv15 o_3@@63)) o_3@@63)) (= (U_2_real (MapType1Select QPMask@5 o_3@@63 f_7)) (+ (U_2_real (MapType1Select QPMask@4 o_3@@63 f_7)) arg_q@0)))) (=> (not (and (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U (invRecv15 o_3@@63))) (< NoPerm arg_q@0)) (qpRange15 o_3@@63))) (= (U_2_real (MapType1Select QPMask@5 o_3@@63 f_7)) (U_2_real (MapType1Select QPMask@4 o_3@@63 f_7))))))
 :qid |stdinbpl.1688:24|
 :skolemid |164|
 :pattern ( (MapType1Select QPMask@5 o_3@@63 f_7))
))) (and (forall ((o_3@@64 T@U) (f_5@@20 T@U) ) (! (let ((B@@32 (FieldTypeInv1 (type f_5@@20))))
(let ((A@@33 (FieldTypeInv0 (type f_5@@20))))
 (=> (and (and (= (type o_3@@64) RefType) (= (type f_5@@20) (FieldType A@@33 B@@32))) (not (= f_5@@20 f_7))) (= (U_2_real (MapType1Select QPMask@4 o_3@@64 f_5@@20)) (U_2_real (MapType1Select QPMask@5 o_3@@64 f_5@@20))))))
 :qid |stdinbpl.1692:31|
 :skolemid |165|
 :pattern ( (MapType1Select QPMask@4 o_3@@64 f_5@@20))
 :pattern ( (MapType1Select QPMask@5 o_3@@64 f_5@@20))
)) (state ExhaleHeap@0 QPMask@5))) (and (and (state ExhaleHeap@0 QPMask@5) (state ExhaleHeap@0 QPMask@5)) (and (= arg_p_1@0 (/ (to_real 1) (to_real 2))) (= arg_q_1@0 (/ (to_real 1) (to_real 4)))))) (and (=> (= (ControlFlow 0 131) (- 0 133)) (= arg_p_1@0 (* (to_real 2) arg_q_1@0))) (=> (= arg_p_1@0 (* (to_real 2) arg_q_1@0)) (and (=> (= (ControlFlow 0 131) (- 0 132)) (<= NoPerm arg_p_1@0)) (=> (<= NoPerm arg_p_1@0) (and (and (=> (= (ControlFlow 0 131) 121) anon55_Else_correct) (=> (= (ControlFlow 0 131) 6) anon56_Then_correct)) (=> (= (ControlFlow 0 131) 8) anon56_Else_correct)))))))))))))))))))))))))))))
(let ((anon3_correct true))
(let ((anon54_Else_correct  (=> (and (not (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_6)) (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U j_3_2)) (not (= i_6 j_3_2))))) (= (ControlFlow 0 4) 1)) anon3_correct)))
(let ((anon54_Then_correct  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_6)) (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U j_3_2)) (not (= i_6 j_3_2)))) (and (=> (= (ControlFlow 0 2) (- 0 3)) (not (= (|Seq#Index| xs1 i_6) (|Seq#Index| xs1 j_3_2)))) (=> (not (= (|Seq#Index| xs1 i_6) (|Seq#Index| xs1 j_3_2))) (=> (= (ControlFlow 0 2) 1) anon3_correct))))))
(let ((anon0_correct  (=> (and (state Heap@@9 ZeroMask) (forall ((i_25 Int) (j_6 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_25)) (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U j_6)) (not (= i_25 j_6)))) (not (= (|Seq#Index| xs1 i_25) (|Seq#Index| xs1 j_6))))
 :qid |stdinbpl.1410:22|
 :skolemid |123|
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_25)) (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U j_6)))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_25)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U j_6)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_25)) (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U j_6)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_25)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U j_6)))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_25)) (|Seq#Index| xs1 j_6))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_25)) (|Seq#Index| xs1 j_6))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U j_6)) (|Seq#Index| xs1 i_25))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U j_6)) (|Seq#Index| xs1 i_25))
 :pattern ( (|Seq#Index| xs1 i_25) (|Seq#Index| xs1 j_6))
))) (and (=> (= (ControlFlow 0 141) (- 0 146)) (forall ((i_1 Int) (i_1_1 Int) ) (!  (=> (and (and (and (and (not (= i_1 i_1_1)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_1))) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_1_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| xs1 i_1) (|Seq#Index| xs1 i_1_1))))
 :qid |stdinbpl.1416:17|
 :skolemid |124|
))) (=> (forall ((i_1@@0 Int) (i_1_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_1@@0 i_1_1@@0)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_1@@0))) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_1_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| xs1 i_1@@0) (|Seq#Index| xs1 i_1_1@@0))))
 :qid |stdinbpl.1416:17|
 :skolemid |124|
)) (=> (forall ((i_1@@1 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_1@@1)) (< NoPerm FullPerm)) (and (qpRange10 (|Seq#Index| xs1 i_1@@1)) (= (invRecv10 (|Seq#Index| xs1 i_1@@1)) i_1@@1)))
 :qid |stdinbpl.1422:24|
 :skolemid |125|
 :pattern ( (|Seq#Index| xs1 i_1@@1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_1@@1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_1@@1)))
 :pattern ( (|Seq#Index| xs1 i_1@@1))
)) (=> (and (and (and (forall ((o_3@@65 T@U) ) (!  (=> (= (type o_3@@65) RefType) (=> (and (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U (invRecv10 o_3@@65))) (< NoPerm FullPerm)) (qpRange10 o_3@@65)) (= (|Seq#Index| xs1 (invRecv10 o_3@@65)) o_3@@65)))
 :qid |stdinbpl.1426:24|
 :skolemid |126|
 :pattern ( (invRecv10 o_3@@65))
)) (forall ((i_1@@2 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_1@@2)) (not (= (|Seq#Index| xs1 i_1@@2) null)))
 :qid |stdinbpl.1432:24|
 :skolemid |127|
 :pattern ( (|Seq#Index| xs1 i_1@@2))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_1@@2)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U i_1@@2)))
 :pattern ( (|Seq#Index| xs1 i_1@@2))
))) (and (forall ((o_3@@66 T@U) ) (!  (=> (= (type o_3@@66) RefType) (and (=> (and (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U (invRecv10 o_3@@66))) (< NoPerm FullPerm)) (qpRange10 o_3@@66)) (and (=> (< NoPerm FullPerm) (= (|Seq#Index| xs1 (invRecv10 o_3@@66)) o_3@@66)) (= (U_2_real (MapType1Select QPMask@0 o_3@@66 f_7)) (+ (U_2_real (MapType1Select ZeroMask o_3@@66 f_7)) FullPerm)))) (=> (not (and (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs1)) (int_2_U (invRecv10 o_3@@66))) (< NoPerm FullPerm)) (qpRange10 o_3@@66))) (= (U_2_real (MapType1Select QPMask@0 o_3@@66 f_7)) (U_2_real (MapType1Select ZeroMask o_3@@66 f_7))))))
 :qid |stdinbpl.1438:24|
 :skolemid |128|
 :pattern ( (MapType1Select QPMask@0 o_3@@66 f_7))
)) (forall ((o_3@@67 T@U) (f_5@@21 T@U) ) (! (let ((B@@33 (FieldTypeInv1 (type f_5@@21))))
(let ((A@@34 (FieldTypeInv0 (type f_5@@21))))
 (=> (and (and (= (type o_3@@67) RefType) (= (type f_5@@21) (FieldType A@@34 B@@33))) (not (= f_5@@21 f_7))) (= (U_2_real (MapType1Select ZeroMask o_3@@67 f_5@@21)) (U_2_real (MapType1Select QPMask@0 o_3@@67 f_5@@21))))))
 :qid |stdinbpl.1442:31|
 :skolemid |129|
 :pattern ( (MapType1Select ZeroMask o_3@@67 f_5@@21))
 :pattern ( (MapType1Select QPMask@0 o_3@@67 f_5@@21))
)))) (and (and (state Heap@@9 QPMask@0) (state Heap@@9 QPMask@0)) (and (state Heap@@9 QPMask@0) (forall ((i_2_1 Int) (j_1 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_2_1)) (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U j_1)) (not (= i_2_1 j_1)))) (not (= (|Seq#Index| xs2 i_2_1) (|Seq#Index| xs2 j_1))))
 :qid |stdinbpl.1456:22|
 :skolemid |130|
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_2_1)) (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U j_1)))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_2_1)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U j_1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_2_1)) (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U j_1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_2_1)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U j_1)))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_2_1)) (|Seq#Index| xs2 j_1))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_2_1)) (|Seq#Index| xs2 j_1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U j_1)) (|Seq#Index| xs2 i_2_1))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U j_1)) (|Seq#Index| xs2 i_2_1))
 :pattern ( (|Seq#Index| xs2 i_2_1) (|Seq#Index| xs2 j_1))
))))) (and (=> (= (ControlFlow 0 141) (- 0 145)) (forall ((i_3 Int) (i_3_1 Int) ) (!  (=> (and (and (and (and (not (= i_3 i_3_1)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_3))) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_3_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| xs2 i_3) (|Seq#Index| xs2 i_3_1))))
 :qid |stdinbpl.1462:17|
 :skolemid |131|
))) (=> (forall ((i_3@@0 Int) (i_3_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_3@@0 i_3_1@@0)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_3@@0))) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_3_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| xs2 i_3@@0) (|Seq#Index| xs2 i_3_1@@0))))
 :qid |stdinbpl.1462:17|
 :skolemid |131|
)) (=> (forall ((i_3@@1 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_3@@1)) (< NoPerm FullPerm)) (and (qpRange11 (|Seq#Index| xs2 i_3@@1)) (= (invRecv11 (|Seq#Index| xs2 i_3@@1)) i_3@@1)))
 :qid |stdinbpl.1468:24|
 :skolemid |132|
 :pattern ( (|Seq#Index| xs2 i_3@@1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_3@@1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_3@@1)))
 :pattern ( (|Seq#Index| xs2 i_3@@1))
)) (=> (and (and (and (forall ((o_3@@68 T@U) ) (!  (=> (= (type o_3@@68) RefType) (=> (and (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U (invRecv11 o_3@@68))) (< NoPerm FullPerm)) (qpRange11 o_3@@68)) (= (|Seq#Index| xs2 (invRecv11 o_3@@68)) o_3@@68)))
 :qid |stdinbpl.1472:24|
 :skolemid |133|
 :pattern ( (invRecv11 o_3@@68))
)) (forall ((i_3@@2 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_3@@2)) (not (= (|Seq#Index| xs2 i_3@@2) null)))
 :qid |stdinbpl.1478:24|
 :skolemid |134|
 :pattern ( (|Seq#Index| xs2 i_3@@2))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_3@@2)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U i_3@@2)))
 :pattern ( (|Seq#Index| xs2 i_3@@2))
))) (and (forall ((o_3@@69 T@U) ) (!  (=> (= (type o_3@@69) RefType) (and (=> (and (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U (invRecv11 o_3@@69))) (< NoPerm FullPerm)) (qpRange11 o_3@@69)) (and (=> (< NoPerm FullPerm) (= (|Seq#Index| xs2 (invRecv11 o_3@@69)) o_3@@69)) (= (U_2_real (MapType1Select QPMask@1 o_3@@69 f_7)) (+ (U_2_real (MapType1Select QPMask@0 o_3@@69 f_7)) FullPerm)))) (=> (not (and (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs2)) (int_2_U (invRecv11 o_3@@69))) (< NoPerm FullPerm)) (qpRange11 o_3@@69))) (= (U_2_real (MapType1Select QPMask@1 o_3@@69 f_7)) (U_2_real (MapType1Select QPMask@0 o_3@@69 f_7))))))
 :qid |stdinbpl.1484:24|
 :skolemid |135|
 :pattern ( (MapType1Select QPMask@1 o_3@@69 f_7))
)) (forall ((o_3@@70 T@U) (f_5@@22 T@U) ) (! (let ((B@@34 (FieldTypeInv1 (type f_5@@22))))
(let ((A@@35 (FieldTypeInv0 (type f_5@@22))))
 (=> (and (and (= (type o_3@@70) RefType) (= (type f_5@@22) (FieldType A@@35 B@@34))) (not (= f_5@@22 f_7))) (= (U_2_real (MapType1Select QPMask@0 o_3@@70 f_5@@22)) (U_2_real (MapType1Select QPMask@1 o_3@@70 f_5@@22))))))
 :qid |stdinbpl.1488:31|
 :skolemid |136|
 :pattern ( (MapType1Select QPMask@0 o_3@@70 f_5@@22))
 :pattern ( (MapType1Select QPMask@1 o_3@@70 f_5@@22))
)))) (and (and (state Heap@@9 QPMask@1) (state Heap@@9 QPMask@1)) (and (state Heap@@9 QPMask@1) (forall ((i_4_1 Int) (j_2_1 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_4_1)) (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U j_2_1)) (not (= i_4_1 j_2_1)))) (not (= (|Seq#Index| xs3 i_4_1) (|Seq#Index| xs3 j_2_1))))
 :qid |stdinbpl.1502:22|
 :skolemid |137|
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_4_1)) (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U j_2_1)))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_4_1)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U j_2_1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_4_1)) (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U j_2_1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_4_1)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U j_2_1)))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_4_1)) (|Seq#Index| xs3 j_2_1))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_4_1)) (|Seq#Index| xs3 j_2_1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U j_2_1)) (|Seq#Index| xs3 i_4_1))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U j_2_1)) (|Seq#Index| xs3 i_4_1))
 :pattern ( (|Seq#Index| xs3 i_4_1) (|Seq#Index| xs3 j_2_1))
))))) (and (=> (= (ControlFlow 0 141) (- 0 144)) (forall ((i_5 Int) (i_5_2 Int) ) (!  (=> (and (and (and (and (not (= i_5 i_5_2)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_5))) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_5_2))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| xs3 i_5) (|Seq#Index| xs3 i_5_2))))
 :qid |stdinbpl.1508:17|
 :skolemid |138|
))) (=> (forall ((i_5@@0 Int) (i_5_2@@0 Int) ) (!  (=> (and (and (and (and (not (= i_5@@0 i_5_2@@0)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_5@@0))) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_5_2@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| xs3 i_5@@0) (|Seq#Index| xs3 i_5_2@@0))))
 :qid |stdinbpl.1508:17|
 :skolemid |138|
)) (=> (forall ((i_5@@1 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_5@@1)) (< NoPerm FullPerm)) (and (qpRange12 (|Seq#Index| xs3 i_5@@1)) (= (invRecv12 (|Seq#Index| xs3 i_5@@1)) i_5@@1)))
 :qid |stdinbpl.1514:24|
 :skolemid |139|
 :pattern ( (|Seq#Index| xs3 i_5@@1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_5@@1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_5@@1)))
 :pattern ( (|Seq#Index| xs3 i_5@@1))
)) (=> (and (and (and (forall ((o_3@@71 T@U) ) (!  (=> (= (type o_3@@71) RefType) (=> (and (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U (invRecv12 o_3@@71))) (< NoPerm FullPerm)) (qpRange12 o_3@@71)) (= (|Seq#Index| xs3 (invRecv12 o_3@@71)) o_3@@71)))
 :qid |stdinbpl.1518:24|
 :skolemid |140|
 :pattern ( (invRecv12 o_3@@71))
)) (forall ((i_5@@2 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_5@@2)) (not (= (|Seq#Index| xs3 i_5@@2) null)))
 :qid |stdinbpl.1524:24|
 :skolemid |141|
 :pattern ( (|Seq#Index| xs3 i_5@@2))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_5@@2)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U i_5@@2)))
 :pattern ( (|Seq#Index| xs3 i_5@@2))
))) (and (forall ((o_3@@72 T@U) ) (!  (=> (= (type o_3@@72) RefType) (and (=> (and (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U (invRecv12 o_3@@72))) (< NoPerm FullPerm)) (qpRange12 o_3@@72)) (and (=> (< NoPerm FullPerm) (= (|Seq#Index| xs3 (invRecv12 o_3@@72)) o_3@@72)) (= (U_2_real (MapType1Select QPMask@2 o_3@@72 f_7)) (+ (U_2_real (MapType1Select QPMask@1 o_3@@72 f_7)) FullPerm)))) (=> (not (and (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| xs3)) (int_2_U (invRecv12 o_3@@72))) (< NoPerm FullPerm)) (qpRange12 o_3@@72))) (= (U_2_real (MapType1Select QPMask@2 o_3@@72 f_7)) (U_2_real (MapType1Select QPMask@1 o_3@@72 f_7))))))
 :qid |stdinbpl.1530:24|
 :skolemid |142|
 :pattern ( (MapType1Select QPMask@2 o_3@@72 f_7))
)) (forall ((o_3@@73 T@U) (f_5@@23 T@U) ) (! (let ((B@@35 (FieldTypeInv1 (type f_5@@23))))
(let ((A@@36 (FieldTypeInv0 (type f_5@@23))))
 (=> (and (and (= (type o_3@@73) RefType) (= (type f_5@@23) (FieldType A@@36 B@@35))) (not (= f_5@@23 f_7))) (= (U_2_real (MapType1Select QPMask@1 o_3@@73 f_5@@23)) (U_2_real (MapType1Select QPMask@2 o_3@@73 f_5@@23))))))
 :qid |stdinbpl.1534:31|
 :skolemid |143|
 :pattern ( (MapType1Select QPMask@1 o_3@@73 f_5@@23))
 :pattern ( (MapType1Select QPMask@2 o_3@@73 f_5@@23))
)))) (and (and (state Heap@@9 QPMask@2) (state Heap@@9 QPMask@2)) (and (state Heap@@9 QPMask@2) (= arg_q@0 (/ (to_real 1) (to_real 2)))))) (and (=> (= (ControlFlow 0 141) (- 0 143)) (= FullPerm (* (to_real 2) arg_q@0))) (=> (= FullPerm (* (to_real 2) arg_q@0)) (and (=> (= (ControlFlow 0 141) (- 0 142)) (<= NoPerm FullPerm)) (=> (<= NoPerm FullPerm) (and (and (=> (= (ControlFlow 0 141) 131) anon53_Else_correct) (=> (= (ControlFlow 0 141) 2) anon54_Then_correct)) (=> (= (ControlFlow 0 141) 4) anon54_Else_correct)))))))))))))))))))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 147) 141) anon0_correct)))
PreconditionGeneratedEntry_correct)))))))))))))))))))))))))))))))))))))))))))))))))))))))
))
(check-sat)
(pop 1)
; Valid
(get-info :rlimit)
