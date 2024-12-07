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
 :qid |stdinbpl.367:18|
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
 :qid |stdinbpl.388:18|
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
 :qid |stdinbpl.343:18|
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
 :qid |stdinbpl.354:18|
 :skolemid |36|
 :pattern ( (|Seq#Length| (|Seq#Take| s@@2 n@@2)))
 :pattern ( (|Seq#Take| s@@2 n@@2) (|Seq#Length| s@@2))
)))
(assert (forall ((arg0@@31 Int) (arg1@@13 Int) ) (! (= (type (|Seq#Range| arg0@@31 arg1@@13)) (SeqType intType))
 :qid |funType:Seq#Range|
 :pattern ( (|Seq#Range| arg0@@31 arg1@@13))
)))
(assert (forall ((q@min Int) (q@max Int) (v@@0 T@U) ) (!  (=> (= (type v@@0) intType) (= (|Seq#Contains| (|Seq#Range| q@min q@max) v@@0)  (and (<= q@min (U_2_int v@@0)) (< (U_2_int v@@0) q@max))))
 :qid |stdinbpl.627:15|
 :skolemid |57|
 :pattern ( (|Seq#Contains| (|Seq#Range| q@min q@max) v@@0))
)))
(assert (forall ((s@@3 T@U) (x@@8 T@U) ) (! (let ((T@@7 (type x@@8)))
 (=> (and (= (type s@@3) (SeqType T@@7)) (|Seq#Contains| s@@3 x@@8)) (and (and (<= 0 (|Seq#Skolem| s@@3 x@@8)) (< (|Seq#Skolem| s@@3 x@@8) (|Seq#Length| s@@3))) (= (|Seq#Index| s@@3 (|Seq#Skolem| s@@3 x@@8)) x@@8))))
 :qid |stdinbpl.485:18|
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
 :qid |stdinbpl.469:18|
 :skolemid |45|
 :pattern ( (|Seq#Drop| s@@4 n@@3))
)))
(assert (forall ((i@@0 Int) (j@@0 Int) ) (! (= (|Seq#Sub| i@@0 j@@0) (- i@@0 j@@0))
 :qid |stdinbpl.323:15|
 :skolemid |30|
 :pattern ( (|Seq#Sub| i@@0 j@@0))
)))
(assert (forall ((i@@1 Int) (j@@1 Int) ) (! (= (|Seq#Add| i@@1 j@@1) (+ i@@1 j@@1))
 :qid |stdinbpl.321:15|
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
 :qid |stdinbpl.610:18|
 :skolemid |54|
 :pattern ( (|Seq#Contains| (|Seq#Singleton| x@@9) y@@1))
)))
(assert (forall ((s@@5 T@U) (n@@4 Int) (j@@2 Int) ) (! (let ((T@@11 (SeqTypeInv0 (type s@@5))))
 (=> (= (type s@@5) (SeqType T@@11)) (=> (and (and (<= 0 j@@2) (< j@@2 n@@4)) (< j@@2 (|Seq#Length| s@@5))) (= (|Seq#Index| (|Seq#Take| s@@5 n@@4) j@@2) (|Seq#Index| s@@5 j@@2)))))
 :qid |stdinbpl.362:18|
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
 :qid |stdinbpl.266:19|
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
 :qid |stdinbpl.334:18|
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
 :qid |stdinbpl.254:15|
 :skolemid |19|
 :pattern ( (ConditionalFrame p@@0 f_6))
)))
(assert (forall ((q@min@@0 Int) (q@max@@0 Int) (j@@3 Int) ) (!  (=> (and (<= 0 j@@3) (< j@@3 (- q@max@@0 q@min@@0))) (= (U_2_int (|Seq#Index| (|Seq#Range| q@min@@0 q@max@@0) j@@3)) (+ q@min@@0 j@@3)))
 :qid |stdinbpl.625:15|
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
 :qid |stdinbpl.303:18|
 :skolemid |26|
 :pattern ( (|Seq#Length| (|Seq#Append| s0@@0 s1@@0)))
)))
(assert (forall ((s@@6 T@U) (t T@U) (n@@6 Int) ) (! (let ((T@@17 (SeqTypeInv0 (type s@@6))))
 (=> (and (and (= (type s@@6) (SeqType T@@17)) (= (type t) (SeqType T@@17))) (and (> n@@6 0) (> n@@6 (|Seq#Length| s@@6)))) (and (= (|Seq#Add| (|Seq#Sub| n@@6 (|Seq#Length| s@@6)) (|Seq#Length| s@@6)) n@@6) (= (|Seq#Drop| (|Seq#Append| s@@6 t) n@@6) (|Seq#Drop| t (|Seq#Sub| n@@6 (|Seq#Length| s@@6)))))))
 :qid |stdinbpl.459:18|
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
 :qid |stdinbpl.446:18|
 :skolemid |42|
 :pattern ( (|Seq#Take| (|Seq#Append| s@@7 t@@0) n@@7))
)))
(assert (forall ((q@min@@1 Int) (q@max@@1 Int) ) (!  (and (=> (< q@min@@1 q@max@@1) (= (|Seq#Length| (|Seq#Range| q@min@@1 q@max@@1)) (- q@max@@1 q@min@@1))) (=> (<= q@max@@1 q@min@@1) (= (|Seq#Length| (|Seq#Range| q@min@@1 q@max@@1)) 0)))
 :qid |stdinbpl.624:15|
 :skolemid |55|
 :pattern ( (|Seq#Length| (|Seq#Range| q@min@@1 q@max@@1)))
)))
(assert (forall ((a T@U) (b T@U) ) (! (let ((T@@19 (SeqTypeInv0 (type a))))
 (=> (and (and (= (type a) (SeqType T@@19)) (= (type b) (SeqType T@@19))) (|Seq#Equal| a b)) (= a b)))
 :qid |stdinbpl.597:18|
 :skolemid |53|
 :pattern ( (|Seq#Equal| a b))
)))
(assert (forall ((s@@8 T@U) (i@@2 Int) ) (! (let ((T@@20 (SeqTypeInv0 (type s@@8))))
 (=> (= (type s@@8) (SeqType T@@20)) (=> (and (<= 0 i@@2) (< i@@2 (|Seq#Length| s@@8))) (|Seq#ContainsTrigger| s@@8 (|Seq#Index| s@@8 i@@2)))))
 :qid |stdinbpl.490:18|
 :skolemid |49|
 :pattern ( (|Seq#Index| s@@8 i@@2))
)))
(assert (forall ((s0@@1 T@U) (s1@@1 T@U) ) (! (let ((T@@21 (SeqTypeInv0 (type s0@@1))))
 (=> (and (= (type s0@@1) (SeqType T@@21)) (= (type s1@@1) (SeqType T@@21))) (and (=> (= s0@@1 (|Seq#Empty| T@@21)) (= (|Seq#Append| s0@@1 s1@@1) s1@@1)) (=> (= s1@@1 (|Seq#Empty| T@@21)) (= (|Seq#Append| s0@@1 s1@@1) s0@@1)))))
 :qid |stdinbpl.309:18|
 :skolemid |27|
 :pattern ( (|Seq#Append| s0@@1 s1@@1))
)))
(assert (forall ((t@@1 T@U) ) (! (= (|Seq#Index| (|Seq#Singleton| t@@1) 0) t@@1)
 :qid |stdinbpl.313:18|
 :skolemid |28|
 :pattern ( (|Seq#Singleton| t@@1))
)))
(assert (forall ((s@@9 T@U) ) (! (let ((T@@22 (SeqTypeInv0 (type s@@9))))
 (=> (= (type s@@9) (SeqType T@@22)) (<= 0 (|Seq#Length| s@@9))))
 :qid |stdinbpl.292:18|
 :skolemid |22|
 :pattern ( (|Seq#Length| s@@9))
)))
(assert (forall ((s0@@2 T@U) (s1@@2 T@U) ) (! (let ((T@@23 (SeqTypeInv0 (type s0@@2))))
 (=> (and (and (= (type s0@@2) (SeqType T@@23)) (= (type s1@@2) (SeqType T@@23))) (|Seq#Equal| s0@@2 s1@@2)) (and (= (|Seq#Length| s0@@2) (|Seq#Length| s1@@2)) (forall ((j@@4 Int) ) (!  (=> (and (<= 0 j@@4) (< j@@4 (|Seq#Length| s0@@2))) (= (|Seq#Index| s0@@2 j@@4) (|Seq#Index| s1@@2 j@@4)))
 :qid |stdinbpl.587:13|
 :skolemid |50|
 :pattern ( (|Seq#Index| s0@@2 j@@4))
 :pattern ( (|Seq#Index| s1@@2 j@@4))
)))))
 :qid |stdinbpl.584:18|
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
 :qid |stdinbpl.300:18|
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
 :qid |stdinbpl.442:18|
 :skolemid |41|
 :pattern ( (|Seq#Take| (|Seq#Append| s@@10 t@@3) n@@8))
)))
(assert (forall ((s@@11 T@U) (i@@3 Int) (v@@1 T@U) ) (! (let ((T@@25 (type v@@1)))
 (=> (= (type s@@11) (SeqType T@@25)) (=> (and (<= 0 i@@3) (< i@@3 (|Seq#Length| s@@11))) (= (|Seq#Length| (|Seq#Update| s@@11 i@@3 v@@1)) (|Seq#Length| s@@11)))))
 :qid |stdinbpl.341:18|
 :skolemid |34|
 :pattern ( (|Seq#Length| (|Seq#Update| s@@11 i@@3 v@@1)))
 :pattern ( (|Seq#Length| s@@11) (|Seq#Update| s@@11 i@@3 v@@1))
)))
(assert (forall ((s@@12 T@U) (t@@4 T@U) (n@@9 Int) ) (! (let ((T@@26 (SeqTypeInv0 (type s@@12))))
 (=> (and (and (= (type s@@12) (SeqType T@@26)) (= (type t@@4) (SeqType T@@26))) (and (< 0 n@@9) (<= n@@9 (|Seq#Length| s@@12)))) (= (|Seq#Drop| (|Seq#Append| s@@12 t@@4) n@@9) (|Seq#Append| (|Seq#Drop| s@@12 n@@9) t@@4))))
 :qid |stdinbpl.455:18|
 :skolemid |43|
 :pattern ( (|Seq#Drop| (|Seq#Append| s@@12 t@@4) n@@9))
)))
(assert (forall ((s@@13 T@U) (n@@10 Int) (i@@4 Int) ) (! (let ((T@@27 (SeqTypeInv0 (type s@@13))))
 (=> (= (type s@@13) (SeqType T@@27)) (=> (and (and (< 0 n@@10) (<= n@@10 i@@4)) (< i@@4 (|Seq#Length| s@@13))) (and (= (|Seq#Add| (|Seq#Sub| i@@4 n@@10) n@@10) i@@4) (= (|Seq#Index| (|Seq#Drop| s@@13 n@@10) (|Seq#Sub| i@@4 n@@10)) (|Seq#Index| s@@13 i@@4))))))
 :qid |stdinbpl.392:18|
 :skolemid |40|
 :pattern ( (|Seq#Drop| s@@13 n@@10) (|Seq#Index| s@@13 i@@4))
)))
(assert (forall ((s0@@3 T@U) (s1@@3 T@U) (n@@11 Int) ) (! (let ((T@@28 (SeqTypeInv0 (type s0@@3))))
 (=> (and (= (type s0@@3) (SeqType T@@28)) (= (type s1@@3) (SeqType T@@28))) (=> (and (and (and (not (= s0@@3 (|Seq#Empty| T@@28))) (not (= s1@@3 (|Seq#Empty| T@@28)))) (<= 0 n@@11)) (< n@@11 (|Seq#Length| s0@@3))) (= (|Seq#Index| (|Seq#Append| s0@@3 s1@@3) n@@11) (|Seq#Index| s0@@3 n@@11)))))
 :qid |stdinbpl.332:18|
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
 :qid |stdinbpl.337:18|
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
 :qid |stdinbpl.488:18|
 :skolemid |48|
 :pattern ( (|Seq#Contains| s@@14 x@@10) (|Seq#Index| s@@14 i@@5))
)))
(assert (forall ((s0@@5 T@U) (s1@@5 T@U) ) (! (let ((T@@31 (SeqTypeInv0 (type s0@@5))))
 (=> (and (= (type s0@@5) (SeqType T@@31)) (= (type s1@@5) (SeqType T@@31))) (or (or (and (= s0@@5 s1@@5) (|Seq#Equal| s0@@5 s1@@5)) (and (and (not (= s0@@5 s1@@5)) (not (|Seq#Equal| s0@@5 s1@@5))) (not (= (|Seq#Length| s0@@5) (|Seq#Length| s1@@5))))) (and (and (and (and (and (and (not (= s0@@5 s1@@5)) (not (|Seq#Equal| s0@@5 s1@@5))) (= (|Seq#Length| s0@@5) (|Seq#Length| s1@@5))) (= (|Seq#SkolemDiff| s0@@5 s1@@5) (|Seq#SkolemDiff| s1@@5 s0@@5))) (<= 0 (|Seq#SkolemDiff| s0@@5 s1@@5))) (< (|Seq#SkolemDiff| s0@@5 s1@@5) (|Seq#Length| s0@@5))) (not (= (|Seq#Index| s0@@5 (|Seq#SkolemDiff| s0@@5 s1@@5)) (|Seq#Index| s1@@5 (|Seq#SkolemDiff| s0@@5 s1@@5))))))))
 :qid |stdinbpl.592:18|
 :skolemid |52|
 :pattern ( (|Seq#Equal| s0@@5 s1@@5))
)))
(assert (forall ((p@@1 T@U) (v_1@@0 T@U) (q T@U) (w@@0 T@U) (r T@U) (u T@U) ) (! (let ((C@@3 (FieldTypeInv0 (type r))))
(let ((B@@10 (FieldTypeInv0 (type q))))
(let ((A@@11 (FieldTypeInv0 (type p@@1))))
 (=> (and (and (and (and (and (and (= (type p@@1) (FieldType A@@11 FrameTypeType)) (= (type v_1@@0) FrameTypeType)) (= (type q) (FieldType B@@10 FrameTypeType))) (= (type w@@0) FrameTypeType)) (= (type r) (FieldType C@@3 FrameTypeType))) (= (type u) FrameTypeType)) (and (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))) (InsidePredicate p@@1 v_1@@0 r u)))))
 :qid |stdinbpl.261:25|
 :skolemid |20|
 :pattern ( (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))
)))
(assert (forall ((s@@15 T@U) ) (! (let ((T@@32 (SeqTypeInv0 (type s@@15))))
 (=> (and (= (type s@@15) (SeqType T@@32)) (= (|Seq#Length| s@@15) 0)) (= s@@15 (|Seq#Empty| T@@32))))
 :qid |stdinbpl.296:18|
 :skolemid |24|
 :pattern ( (|Seq#Length| s@@15))
)))
(assert (forall ((s@@16 T@U) (n@@12 Int) ) (! (let ((T@@33 (SeqTypeInv0 (type s@@16))))
 (=> (and (= (type s@@16) (SeqType T@@33)) (<= n@@12 0)) (= (|Seq#Take| s@@16 n@@12) (|Seq#Empty| T@@33))))
 :qid |stdinbpl.471:18|
 :skolemid |46|
 :pattern ( (|Seq#Take| s@@16 n@@12))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun i_24 () Int)
(declare-fun S () T@U)
(declare-fun QPMask@6 () T@U)
(declare-fun PostHeap@0 () T@U)
(declare-fun x@@11 () Int)
(declare-fun index () Int)
(declare-fun p_1 () Real)
(declare-fun qpRange9 (T@U) Bool)
(declare-fun invRecv9 (T@U) Int)
(declare-fun i_21 () Int)
(declare-fun i_16 () Int)
(declare-fun j_6 () Int)
(declare-fun arg_S@0 () T@U)
(declare-fun Heap@@9 () T@U)
(declare-fun i_13 () Int)
(declare-fun j_4 () Int)
(declare-fun i_11 () Int)
(declare-fun Heap@2 () T@U)
(declare-fun index@7 () Int)
(declare-fun Mask@2 () T@U)
(declare-fun dummyFunction (T@U) Bool)
(declare-fun neverTriggered10 (Int) Bool)
(declare-fun qpRange10 (T@U) Bool)
(declare-fun invRecv10 (T@U) Int)
(declare-fun QPMask@5 () T@U)
(declare-fun Heap@1 () T@U)
(declare-fun Mask@1 () T@U)
(declare-fun index@6 () Int)
(declare-fun Heap@0 () T@U)
(declare-fun Mask@0 () T@U)
(declare-fun index@5 () Int)
(declare-fun ExhaleHeap@1 () T@U)
(declare-fun QPMask@4 () T@U)
(declare-fun index@4 () Int)
(declare-fun QPMask@3 () T@U)
(declare-fun arg_p@0 () Real)
(declare-fun qpRange12 (T@U) Bool)
(declare-fun invRecv12 (T@U) Int)
(declare-fun neverTriggered11 (Int) Bool)
(declare-fun QPMask@0 () T@U)
(declare-fun qpRange11 (T@U) Bool)
(declare-fun invRecv11 (T@U) Int)
(declare-fun k () Int)
(declare-fun ExhaleHeap@0 () T@U)
(declare-fun QPMask@2 () T@U)
(declare-fun index@3 () Int)
(declare-fun index@2 () Int)
(declare-fun arg_S_1@0 () T@U)
(declare-fun QPMask@1 () T@U)
(declare-fun arg_p_1@0 () Real)
(declare-fun qpRange14 (T@U) Bool)
(declare-fun invRecv14 (T@U) Int)
(declare-fun index@1 () Int)
(declare-fun index@0 () Int)
(declare-fun i_23 () Int)
(declare-fun j_10 () Int)
(declare-fun neverTriggered13 (Int) Bool)
(declare-fun qpRange13 (T@U) Bool)
(declare-fun invRecv13 (T@U) Int)
(declare-fun i_20 () Int)
(declare-fun j_8 () Int)
(declare-fun i_17 () Int)
(declare-fun j_5 () Int)
(declare-fun qpRange8 (T@U) Bool)
(declare-fun invRecv8 (T@U) Int)
(declare-fun i_14 () Int)
(declare-fun i_12 () Int)
(declare-fun j_3 () Int)
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (= (type S) (SeqType RefType)) (= (type QPMask@0) (MapType1Type RefType realType))) (= (type arg_S_1@0) (SeqType RefType))) (= (type Heap@@9) (MapType0Type RefType))) (= (type Heap@2) (MapType0Type RefType))) (= (type Mask@2) (MapType1Type RefType realType))) (= (type QPMask@5) (MapType1Type RefType realType))) (= (type Heap@1) (MapType0Type RefType))) (= (type Mask@1) (MapType1Type RefType realType))) (= (type Heap@0) (MapType0Type RefType))) (= (type Mask@0) (MapType1Type RefType realType))) (= (type ExhaleHeap@0) (MapType0Type RefType))) (= (type QPMask@2) (MapType1Type RefType realType))) (= (type QPMask@1) (MapType1Type RefType realType))) (= (type arg_S@0) (SeqType RefType))) (= (type ExhaleHeap@1) (MapType0Type RefType))) (= (type QPMask@4) (MapType1Type RefType realType))) (= (type QPMask@3) (MapType1Type RefType realType))) (= (type PostHeap@0) (MapType0Type RefType))) (= (type QPMask@6) (MapType1Type RefType realType))))
(set-info :boogie-vc-id bfind_fixed_ineq)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 127) (let ((anon23_correct true))
(let ((anon80_Else_correct  (=> (and (not (and (<= 0 i_24) (< i_24 (|Seq#Length| S)))) (= (ControlFlow 0 109) 104)) anon23_correct)))
(let ((anon80_Then_correct  (=> (and (<= 0 i_24) (< i_24 (|Seq#Length| S))) (and (=> (= (ControlFlow 0 105) (- 0 108)) (>= i_24 0)) (=> (>= i_24 0) (and (=> (= (ControlFlow 0 105) (- 0 107)) (< i_24 (|Seq#Length| S))) (=> (< i_24 (|Seq#Length| S)) (and (=> (= (ControlFlow 0 105) (- 0 106)) (HasDirectPerm QPMask@6 (|Seq#Index| S i_24) f_7)) (=> (HasDirectPerm QPMask@6 (|Seq#Index| S i_24) f_7) (=> (= (ControlFlow 0 105) 104) anon23_correct))))))))))
(let ((anon25_correct true))
(let ((anon79_Else_correct  (=> (and (forall ((i_9 Int) ) (!  (=> (and (<= 0 i_9) (< i_9 (|Seq#Length| S))) (not (= (U_2_int (MapType0Select PostHeap@0 (|Seq#Index| S i_9) f_7)) x@@11)))
 :qid |stdinbpl.1516:22|
 :skolemid |133|
 :pattern ( (|Seq#Index| S i_9))
)) (= (ControlFlow 0 103) 101)) anon25_correct)))
(let ((anon78_Then_correct  (=> (= index (- 0 1)) (and (and (=> (= (ControlFlow 0 110) 103) anon79_Else_correct) (=> (= (ControlFlow 0 110) 105) anon80_Then_correct)) (=> (= (ControlFlow 0 110) 109) anon80_Else_correct)))))
(let ((anon78_Else_correct  (=> (and (not (= index (- 0 1))) (= (ControlFlow 0 102) 101)) anon25_correct)))
(let ((anon19_correct  (=> (state PostHeap@0 QPMask@6) (and (=> (= (ControlFlow 0 111) 110) anon78_Then_correct) (=> (= (ControlFlow 0 111) 102) anon78_Else_correct)))))
(let ((anon77_Else_correct  (=> (and (not (and (<= 0 index) (< index (|Seq#Length| S)))) (= (ControlFlow 0 116) 111)) anon19_correct)))
(let ((anon77_Then_correct  (=> (and (<= 0 index) (< index (|Seq#Length| S))) (and (=> (= (ControlFlow 0 112) (- 0 115)) (>= index 0)) (=> (>= index 0) (and (=> (= (ControlFlow 0 112) (- 0 114)) (< index (|Seq#Length| S))) (=> (< index (|Seq#Length| S)) (and (=> (= (ControlFlow 0 112) (- 0 113)) (HasDirectPerm QPMask@6 (|Seq#Index| S index) f_7)) (=> (HasDirectPerm QPMask@6 (|Seq#Index| S index) f_7) (=> (and (= (U_2_int (MapType0Select PostHeap@0 (|Seq#Index| S index) f_7)) x@@11) (= (ControlFlow 0 112) 111)) anon19_correct))))))))))
(let ((anon75_Else_correct  (and (=> (= (ControlFlow 0 117) (- 0 119)) (forall ((i_7 Int) (i_7_1 Int) ) (!  (=> (and (and (and (and (not (= i_7 i_7_1)) (and (<= 0 i_7) (< i_7 (|Seq#Length| S)))) (and (<= 0 i_7_1) (< i_7_1 (|Seq#Length| S)))) (< NoPerm p_1)) (< NoPerm p_1)) (not (= (|Seq#Index| S i_7) (|Seq#Index| S i_7_1))))
 :qid |stdinbpl.1448:15|
 :skolemid |126|
))) (=> (forall ((i_7@@0 Int) (i_7_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_7@@0 i_7_1@@0)) (and (<= 0 i_7@@0) (< i_7@@0 (|Seq#Length| S)))) (and (<= 0 i_7_1@@0) (< i_7_1@@0 (|Seq#Length| S)))) (< NoPerm p_1)) (< NoPerm p_1)) (not (= (|Seq#Index| S i_7@@0) (|Seq#Index| S i_7_1@@0))))
 :qid |stdinbpl.1448:15|
 :skolemid |126|
)) (=> (and (forall ((i_7@@1 Int) ) (!  (=> (and (and (<= 0 i_7@@1) (< i_7@@1 (|Seq#Length| S))) (< NoPerm p_1)) (and (qpRange9 (|Seq#Index| S i_7@@1)) (= (invRecv9 (|Seq#Index| S i_7@@1)) i_7@@1)))
 :qid |stdinbpl.1454:22|
 :skolemid |127|
 :pattern ( (|Seq#Index| S i_7@@1))
 :pattern ( (|Seq#Index| S i_7@@1))
)) (forall ((o_3 T@U) ) (!  (=> (= (type o_3) RefType) (=> (and (and (and (<= 0 (invRecv9 o_3)) (< (invRecv9 o_3) (|Seq#Length| S))) (< NoPerm p_1)) (qpRange9 o_3)) (= (|Seq#Index| S (invRecv9 o_3)) o_3)))
 :qid |stdinbpl.1458:22|
 :skolemid |128|
 :pattern ( (invRecv9 o_3))
))) (and (=> (= (ControlFlow 0 117) (- 0 118)) (forall ((i_7@@2 Int) ) (!  (=> (and (<= 0 i_7@@2) (< i_7@@2 (|Seq#Length| S))) (>= p_1 NoPerm))
 :qid |stdinbpl.1464:15|
 :skolemid |129|
 :pattern ( (|Seq#Index| S i_7@@2))
 :pattern ( (|Seq#Index| S i_7@@2))
))) (=> (forall ((i_7@@3 Int) ) (!  (=> (and (<= 0 i_7@@3) (< i_7@@3 (|Seq#Length| S))) (>= p_1 NoPerm))
 :qid |stdinbpl.1464:15|
 :skolemid |129|
 :pattern ( (|Seq#Index| S i_7@@3))
 :pattern ( (|Seq#Index| S i_7@@3))
)) (=> (and (and (and (forall ((i_7@@4 Int) ) (!  (=> (and (and (<= 0 i_7@@4) (< i_7@@4 (|Seq#Length| S))) (> p_1 NoPerm)) (not (= (|Seq#Index| S i_7@@4) null)))
 :qid |stdinbpl.1470:22|
 :skolemid |130|
 :pattern ( (|Seq#Index| S i_7@@4))
 :pattern ( (|Seq#Index| S i_7@@4))
)) (forall ((o_3@@0 T@U) ) (!  (=> (= (type o_3@@0) RefType) (and (=> (and (and (and (<= 0 (invRecv9 o_3@@0)) (< (invRecv9 o_3@@0) (|Seq#Length| S))) (< NoPerm p_1)) (qpRange9 o_3@@0)) (and (=> (< NoPerm p_1) (= (|Seq#Index| S (invRecv9 o_3@@0)) o_3@@0)) (= (U_2_real (MapType1Select QPMask@6 o_3@@0 f_7)) (+ (U_2_real (MapType1Select ZeroMask o_3@@0 f_7)) p_1)))) (=> (not (and (and (and (<= 0 (invRecv9 o_3@@0)) (< (invRecv9 o_3@@0) (|Seq#Length| S))) (< NoPerm p_1)) (qpRange9 o_3@@0))) (= (U_2_real (MapType1Select QPMask@6 o_3@@0 f_7)) (U_2_real (MapType1Select ZeroMask o_3@@0 f_7))))))
 :qid |stdinbpl.1476:22|
 :skolemid |131|
 :pattern ( (MapType1Select QPMask@6 o_3@@0 f_7))
))) (and (forall ((o_3@@1 T@U) (f_5 T@U) ) (! (let ((B@@11 (FieldTypeInv1 (type f_5))))
(let ((A@@12 (FieldTypeInv0 (type f_5))))
 (=> (and (and (= (type o_3@@1) RefType) (= (type f_5) (FieldType A@@12 B@@11))) (not (= f_5 f_7))) (= (U_2_real (MapType1Select ZeroMask o_3@@1 f_5)) (U_2_real (MapType1Select QPMask@6 o_3@@1 f_5))))))
 :qid |stdinbpl.1480:29|
 :skolemid |132|
 :pattern ( (MapType1Select ZeroMask o_3@@1 f_5))
 :pattern ( (MapType1Select QPMask@6 o_3@@1 f_5))
)) (state PostHeap@0 QPMask@6))) (and (and (state PostHeap@0 QPMask@6) (<= (- 0 1) index)) (and (< index (|Seq#Length| S)) (state PostHeap@0 QPMask@6)))) (and (=> (= (ControlFlow 0 117) 112) anon77_Then_correct) (=> (= (ControlFlow 0 117) 116) anon77_Else_correct))))))))))
(let ((anon16_correct true))
(let ((anon76_Else_correct  (=> (and (not (and (<= 0 i_21) (< i_21 (|Seq#Length| S)))) (= (ControlFlow 0 100) 96)) anon16_correct)))
(let ((anon76_Then_correct  (=> (and (<= 0 i_21) (< i_21 (|Seq#Length| S))) (and (=> (= (ControlFlow 0 97) (- 0 99)) (>= i_21 0)) (=> (>= i_21 0) (and (=> (= (ControlFlow 0 97) (- 0 98)) (< i_21 (|Seq#Length| S))) (=> (< i_21 (|Seq#Length| S)) (=> (= (ControlFlow 0 97) 96) anon16_correct))))))))
(let ((anon74_Then_correct  (=> (state PostHeap@0 ZeroMask) (and (and (=> (= (ControlFlow 0 120) 117) anon75_Else_correct) (=> (= (ControlFlow 0 120) 97) anon76_Then_correct)) (=> (= (ControlFlow 0 120) 100) anon76_Else_correct)))))
(let ((anon38_correct true))
(let ((anon87_Else_correct  (=> (and (not (and (<= 0 i_16) (and (< i_16 j_6) (< j_6 (|Seq#Length| arg_S@0))))) (= (ControlFlow 0 75) 72)) anon38_correct)))
(let ((anon87_Then_correct  (=> (and (<= 0 i_16) (and (< i_16 j_6) (< j_6 (|Seq#Length| arg_S@0)))) (and (=> (= (ControlFlow 0 73) (- 0 74)) (< (U_2_int (MapType0Select Heap@@9 (|Seq#Index| arg_S@0 i_16) f_7)) (U_2_int (MapType0Select Heap@@9 (|Seq#Index| arg_S@0 j_6) f_7)))) (=> (< (U_2_int (MapType0Select Heap@@9 (|Seq#Index| arg_S@0 i_16) f_7)) (U_2_int (MapType0Select Heap@@9 (|Seq#Index| arg_S@0 j_6) f_7))) (=> (= (ControlFlow 0 73) 72) anon38_correct))))))
(let ((anon34_correct true))
(let ((anon85_Else_correct  (=> (and (not (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| arg_S@0)) (int_2_U i_13)) (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| arg_S@0)) (int_2_U j_4)) (not (= i_13 j_4))))) (= (ControlFlow 0 71) 68)) anon34_correct)))
(let ((anon85_Then_correct  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| arg_S@0)) (int_2_U i_13)) (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| arg_S@0)) (int_2_U j_4)) (not (= i_13 j_4)))) (and (=> (= (ControlFlow 0 69) (- 0 70)) (not (= (|Seq#Index| arg_S@0 i_13) (|Seq#Index| arg_S@0 j_4)))) (=> (not (= (|Seq#Index| arg_S@0 i_13) (|Seq#Index| arg_S@0 j_4))) (=> (= (ControlFlow 0 69) 68) anon34_correct))))))
(let ((anon65_correct true))
(let ((anon99_Else_correct  (=> (and (not (and (<= 0 i_11) (< i_11 (|Seq#Length| S)))) (= (ControlFlow 0 36) 33)) anon65_correct)))
(let ((anon99_Then_correct  (=> (and (<= 0 i_11) (< i_11 (|Seq#Length| S))) (and (=> (= (ControlFlow 0 34) (- 0 35)) (not (= (U_2_int (MapType0Select Heap@2 (|Seq#Index| S i_11) f_7)) x@@11))) (=> (not (= (U_2_int (MapType0Select Heap@2 (|Seq#Index| S i_11) f_7)) x@@11)) (=> (= (ControlFlow 0 34) 33) anon65_correct))))))
(let ((anon67_correct true))
(let ((anon98_Else_correct  (=> (and (forall ((i_12_1 Int) ) (!  (=> (and (<= 0 i_12_1) (< i_12_1 (|Seq#Length| S))) (not (= (U_2_int (MapType0Select Heap@2 (|Seq#Index| S i_12_1) f_7)) x@@11)))
 :qid |stdinbpl.1926:22|
 :skolemid |175|
 :pattern ( (|Seq#Index| S i_12_1))
)) (= (ControlFlow 0 32) 30)) anon67_correct)))
(let ((anon97_Then_correct  (=> (= index@7 (- 0 1)) (and (and (=> (= (ControlFlow 0 37) 32) anon98_Else_correct) (=> (= (ControlFlow 0 37) 34) anon99_Then_correct)) (=> (= (ControlFlow 0 37) 36) anon99_Else_correct)))))
(let ((anon97_Else_correct  (=> (and (not (= index@7 (- 0 1))) (= (ControlFlow 0 31) 30)) anon67_correct)))
(let ((anon96_Else_correct  (=> (not (and (<= 0 index@7) (< index@7 (|Seq#Length| S)))) (and (=> (= (ControlFlow 0 40) 37) anon97_Then_correct) (=> (= (ControlFlow 0 40) 31) anon97_Else_correct)))))
(let ((anon96_Then_correct  (=> (and (<= 0 index@7) (< index@7 (|Seq#Length| S))) (and (=> (= (ControlFlow 0 38) (- 0 39)) (= (U_2_int (MapType0Select Heap@2 (|Seq#Index| S index@7) f_7)) x@@11)) (=> (= (U_2_int (MapType0Select Heap@2 (|Seq#Index| S index@7) f_7)) x@@11) (and (=> (= (ControlFlow 0 38) 37) anon97_Then_correct) (=> (= (ControlFlow 0 38) 31) anon97_Else_correct)))))))
(let ((anon59_correct  (=> (state Heap@2 Mask@2) (and (=> (= (ControlFlow 0 41) (- 0 46)) (forall ((i_10 Int) ) (!  (=> (and (and (<= 0 i_10) (< i_10 (|Seq#Length| S))) (dummyFunction (MapType0Select Heap@2 (|Seq#Index| S i_10) f_7))) (>= p_1 NoPerm))
 :qid |stdinbpl.1869:17|
 :skolemid |168|
 :pattern ( (|Seq#Index| S i_10))
 :pattern ( (|Seq#Index| S i_10))
))) (=> (forall ((i_10@@0 Int) ) (!  (=> (and (and (<= 0 i_10@@0) (< i_10@@0 (|Seq#Length| S))) (dummyFunction (MapType0Select Heap@2 (|Seq#Index| S i_10@@0) f_7))) (>= p_1 NoPerm))
 :qid |stdinbpl.1869:17|
 :skolemid |168|
 :pattern ( (|Seq#Index| S i_10@@0))
 :pattern ( (|Seq#Index| S i_10@@0))
)) (and (=> (= (ControlFlow 0 41) (- 0 45)) (forall ((i_10@@1 Int) (i_10_1 Int) ) (!  (=> (and (and (and (and (not (= i_10@@1 i_10_1)) (and (<= 0 i_10@@1) (< i_10@@1 (|Seq#Length| S)))) (and (<= 0 i_10_1) (< i_10_1 (|Seq#Length| S)))) (< NoPerm p_1)) (< NoPerm p_1)) (not (= (|Seq#Index| S i_10@@1) (|Seq#Index| S i_10_1))))
 :qid |stdinbpl.1876:17|
 :skolemid |169|
 :pattern ( (neverTriggered10 i_10@@1) (neverTriggered10 i_10_1))
))) (=> (forall ((i_10@@2 Int) (i_10_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_10@@2 i_10_1@@0)) (and (<= 0 i_10@@2) (< i_10@@2 (|Seq#Length| S)))) (and (<= 0 i_10_1@@0) (< i_10_1@@0 (|Seq#Length| S)))) (< NoPerm p_1)) (< NoPerm p_1)) (not (= (|Seq#Index| S i_10@@2) (|Seq#Index| S i_10_1@@0))))
 :qid |stdinbpl.1876:17|
 :skolemid |169|
 :pattern ( (neverTriggered10 i_10@@2) (neverTriggered10 i_10_1@@0))
)) (and (=> (= (ControlFlow 0 41) (- 0 44)) (forall ((i_10@@3 Int) ) (!  (=> (and (<= 0 i_10@@3) (< i_10@@3 (|Seq#Length| S))) (>= (U_2_real (MapType1Select Mask@2 (|Seq#Index| S i_10@@3) f_7)) p_1))
 :qid |stdinbpl.1883:17|
 :skolemid |170|
 :pattern ( (|Seq#Index| S i_10@@3))
 :pattern ( (|Seq#Index| S i_10@@3))
))) (=> (forall ((i_10@@4 Int) ) (!  (=> (and (<= 0 i_10@@4) (< i_10@@4 (|Seq#Length| S))) (>= (U_2_real (MapType1Select Mask@2 (|Seq#Index| S i_10@@4) f_7)) p_1))
 :qid |stdinbpl.1883:17|
 :skolemid |170|
 :pattern ( (|Seq#Index| S i_10@@4))
 :pattern ( (|Seq#Index| S i_10@@4))
)) (=> (and (and (forall ((i_10@@5 Int) ) (!  (=> (and (and (<= 0 i_10@@5) (< i_10@@5 (|Seq#Length| S))) (< NoPerm p_1)) (and (qpRange10 (|Seq#Index| S i_10@@5)) (= (invRecv10 (|Seq#Index| S i_10@@5)) i_10@@5)))
 :qid |stdinbpl.1889:22|
 :skolemid |171|
 :pattern ( (|Seq#Index| S i_10@@5))
 :pattern ( (|Seq#Index| S i_10@@5))
)) (forall ((o_3@@2 T@U) ) (!  (=> (= (type o_3@@2) RefType) (=> (and (and (<= 0 (invRecv10 o_3@@2)) (< (invRecv10 o_3@@2) (|Seq#Length| S))) (and (< NoPerm p_1) (qpRange10 o_3@@2))) (= (|Seq#Index| S (invRecv10 o_3@@2)) o_3@@2)))
 :qid |stdinbpl.1893:22|
 :skolemid |172|
 :pattern ( (invRecv10 o_3@@2))
))) (and (forall ((o_3@@3 T@U) ) (!  (=> (= (type o_3@@3) RefType) (and (=> (and (and (<= 0 (invRecv10 o_3@@3)) (< (invRecv10 o_3@@3) (|Seq#Length| S))) (and (< NoPerm p_1) (qpRange10 o_3@@3))) (and (= (|Seq#Index| S (invRecv10 o_3@@3)) o_3@@3) (= (U_2_real (MapType1Select QPMask@5 o_3@@3 f_7)) (- (U_2_real (MapType1Select Mask@2 o_3@@3 f_7)) p_1)))) (=> (not (and (and (<= 0 (invRecv10 o_3@@3)) (< (invRecv10 o_3@@3) (|Seq#Length| S))) (and (< NoPerm p_1) (qpRange10 o_3@@3)))) (= (U_2_real (MapType1Select QPMask@5 o_3@@3 f_7)) (U_2_real (MapType1Select Mask@2 o_3@@3 f_7))))))
 :qid |stdinbpl.1899:22|
 :skolemid |173|
 :pattern ( (MapType1Select QPMask@5 o_3@@3 f_7))
)) (forall ((o_3@@4 T@U) (f_5@@0 T@U) ) (! (let ((B@@12 (FieldTypeInv1 (type f_5@@0))))
(let ((A@@13 (FieldTypeInv0 (type f_5@@0))))
 (=> (and (and (= (type o_3@@4) RefType) (= (type f_5@@0) (FieldType A@@13 B@@12))) (not (= f_5@@0 f_7))) (= (U_2_real (MapType1Select Mask@2 o_3@@4 f_5@@0)) (U_2_real (MapType1Select QPMask@5 o_3@@4 f_5@@0))))))
 :qid |stdinbpl.1905:29|
 :skolemid |174|
 :pattern ( (MapType1Select QPMask@5 o_3@@4 f_5@@0))
)))) (and (=> (= (ControlFlow 0 41) (- 0 43)) (<= (- 0 1) index@7)) (=> (<= (- 0 1) index@7) (and (=> (= (ControlFlow 0 41) (- 0 42)) (< index@7 (|Seq#Length| S))) (=> (< index@7 (|Seq#Length| S)) (and (=> (= (ControlFlow 0 41) 38) anon96_Then_correct) (=> (= (ControlFlow 0 41) 40) anon96_Else_correct))))))))))))))))
(let ((anon58_correct  (=> (state Heap@1 Mask@1) (=> (and (and (= Heap@2 Heap@1) (= Mask@2 Mask@1)) (and (= index@7 index@6) (= (ControlFlow 0 48) 41))) anon59_correct))))
(let ((anon57_correct  (=> (state Heap@0 Mask@0) (=> (and (and (= Heap@1 Heap@0) (= Mask@1 Mask@0)) (and (= index@6 index@5) (= (ControlFlow 0 52) 48))) anon58_correct))))
(let ((anon43_correct  (=> (and (state ExhaleHeap@1 QPMask@4) (state ExhaleHeap@1 QPMask@4)) (=> (and (and (= Mask@0 QPMask@4) (= Heap@0 ExhaleHeap@1)) (and (= index@5 index@4) (= (ControlFlow 0 76) 52))) anon57_correct))))
(let ((anon89_Else_correct  (=> (and (not (= index@4 (- 0 1))) (= (ControlFlow 0 78) 76)) anon43_correct)))
(let ((anon89_Then_correct  (=> (= index@4 (- 0 1)) (=> (and (forall ((i_19 Int) ) (!  (=> (and (<= 0 i_19) (< i_19 (|Seq#Length| arg_S@0))) (not (= (U_2_int (MapType0Select ExhaleHeap@1 (|Seq#Index| arg_S@0 i_19) f_7)) x@@11)))
 :qid |stdinbpl.1700:36|
 :skolemid |150|
 :pattern ( (|Seq#Index| arg_S@0 i_19))
)) (= (ControlFlow 0 77) 76)) anon43_correct))))
(let ((anon88_Else_correct  (=> (not (and (<= 0 index@4) (< index@4 (|Seq#Length| arg_S@0)))) (and (=> (= (ControlFlow 0 80) 77) anon89_Then_correct) (=> (= (ControlFlow 0 80) 78) anon89_Else_correct)))))
(let ((anon88_Then_correct  (=> (and (and (<= 0 index@4) (< index@4 (|Seq#Length| arg_S@0))) (= (U_2_int (MapType0Select ExhaleHeap@1 (|Seq#Index| arg_S@0 index@4) f_7)) x@@11)) (and (=> (= (ControlFlow 0 79) 77) anon89_Then_correct) (=> (= (ControlFlow 0 79) 78) anon89_Else_correct)))))
(let ((anon86_Else_correct  (=> (and (forall ((i_17_1 Int) (j_7_1 Int) ) (!  (=> (and (<= 0 i_17_1) (and (< i_17_1 j_7_1) (< j_7_1 (|Seq#Length| arg_S@0)))) (< (U_2_int (MapType0Select Heap@@9 (|Seq#Index| arg_S@0 i_17_1) f_7)) (U_2_int (MapType0Select Heap@@9 (|Seq#Index| arg_S@0 j_7_1) f_7))))
 :qid |stdinbpl.1641:34|
 :skolemid |142|
 :pattern ( (|Seq#Index| arg_S@0 i_17_1) (|Seq#Index| arg_S@0 j_7_1))
)) (IdenticalOnKnownLocations Heap@@9 ExhaleHeap@1 QPMask@3)) (and (=> (= (ControlFlow 0 81) (- 0 83)) (forall ((i_18 Int) (i_18_1 Int) ) (!  (=> (and (and (and (and (not (= i_18 i_18_1)) (and (<= 0 i_18) (< i_18 (|Seq#Length| arg_S@0)))) (and (<= 0 i_18_1) (< i_18_1 (|Seq#Length| arg_S@0)))) (< NoPerm arg_p@0)) (< NoPerm arg_p@0)) (not (= (|Seq#Index| arg_S@0 i_18) (|Seq#Index| arg_S@0 i_18_1))))
 :qid |stdinbpl.1656:29|
 :skolemid |143|
))) (=> (forall ((i_18@@0 Int) (i_18_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_18@@0 i_18_1@@0)) (and (<= 0 i_18@@0) (< i_18@@0 (|Seq#Length| arg_S@0)))) (and (<= 0 i_18_1@@0) (< i_18_1@@0 (|Seq#Length| arg_S@0)))) (< NoPerm arg_p@0)) (< NoPerm arg_p@0)) (not (= (|Seq#Index| arg_S@0 i_18@@0) (|Seq#Index| arg_S@0 i_18_1@@0))))
 :qid |stdinbpl.1656:29|
 :skolemid |143|
)) (=> (and (forall ((i_18@@1 Int) ) (!  (=> (and (and (<= 0 i_18@@1) (< i_18@@1 (|Seq#Length| arg_S@0))) (< NoPerm arg_p@0)) (and (qpRange12 (|Seq#Index| arg_S@0 i_18@@1)) (= (invRecv12 (|Seq#Index| arg_S@0 i_18@@1)) i_18@@1)))
 :qid |stdinbpl.1662:36|
 :skolemid |144|
 :pattern ( (|Seq#Index| arg_S@0 i_18@@1))
 :pattern ( (|Seq#Index| arg_S@0 i_18@@1))
)) (forall ((o_3@@5 T@U) ) (!  (=> (= (type o_3@@5) RefType) (=> (and (and (and (<= 0 (invRecv12 o_3@@5)) (< (invRecv12 o_3@@5) (|Seq#Length| arg_S@0))) (< NoPerm arg_p@0)) (qpRange12 o_3@@5)) (= (|Seq#Index| arg_S@0 (invRecv12 o_3@@5)) o_3@@5)))
 :qid |stdinbpl.1666:36|
 :skolemid |145|
 :pattern ( (invRecv12 o_3@@5))
))) (and (=> (= (ControlFlow 0 81) (- 0 82)) (forall ((i_18@@2 Int) ) (!  (=> (and (<= 0 i_18@@2) (< i_18@@2 (|Seq#Length| arg_S@0))) (>= arg_p@0 NoPerm))
 :qid |stdinbpl.1672:29|
 :skolemid |146|
 :pattern ( (|Seq#Index| arg_S@0 i_18@@2))
 :pattern ( (|Seq#Index| arg_S@0 i_18@@2))
))) (=> (forall ((i_18@@3 Int) ) (!  (=> (and (<= 0 i_18@@3) (< i_18@@3 (|Seq#Length| arg_S@0))) (>= arg_p@0 NoPerm))
 :qid |stdinbpl.1672:29|
 :skolemid |146|
 :pattern ( (|Seq#Index| arg_S@0 i_18@@3))
 :pattern ( (|Seq#Index| arg_S@0 i_18@@3))
)) (=> (and (forall ((i_18@@4 Int) ) (!  (=> (and (and (<= 0 i_18@@4) (< i_18@@4 (|Seq#Length| arg_S@0))) (> arg_p@0 NoPerm)) (not (= (|Seq#Index| arg_S@0 i_18@@4) null)))
 :qid |stdinbpl.1678:36|
 :skolemid |147|
 :pattern ( (|Seq#Index| arg_S@0 i_18@@4))
 :pattern ( (|Seq#Index| arg_S@0 i_18@@4))
)) (forall ((o_3@@6 T@U) ) (!  (=> (= (type o_3@@6) RefType) (and (=> (and (and (and (<= 0 (invRecv12 o_3@@6)) (< (invRecv12 o_3@@6) (|Seq#Length| arg_S@0))) (< NoPerm arg_p@0)) (qpRange12 o_3@@6)) (and (=> (< NoPerm arg_p@0) (= (|Seq#Index| arg_S@0 (invRecv12 o_3@@6)) o_3@@6)) (= (U_2_real (MapType1Select QPMask@4 o_3@@6 f_7)) (+ (U_2_real (MapType1Select QPMask@3 o_3@@6 f_7)) arg_p@0)))) (=> (not (and (and (and (<= 0 (invRecv12 o_3@@6)) (< (invRecv12 o_3@@6) (|Seq#Length| arg_S@0))) (< NoPerm arg_p@0)) (qpRange12 o_3@@6))) (= (U_2_real (MapType1Select QPMask@4 o_3@@6 f_7)) (U_2_real (MapType1Select QPMask@3 o_3@@6 f_7))))))
 :qid |stdinbpl.1684:36|
 :skolemid |148|
 :pattern ( (MapType1Select QPMask@4 o_3@@6 f_7))
))) (=> (and (and (forall ((o_3@@7 T@U) (f_5@@1 T@U) ) (! (let ((B@@13 (FieldTypeInv1 (type f_5@@1))))
(let ((A@@14 (FieldTypeInv0 (type f_5@@1))))
 (=> (and (and (= (type o_3@@7) RefType) (= (type f_5@@1) (FieldType A@@14 B@@13))) (not (= f_5@@1 f_7))) (= (U_2_real (MapType1Select QPMask@3 o_3@@7 f_5@@1)) (U_2_real (MapType1Select QPMask@4 o_3@@7 f_5@@1))))))
 :qid |stdinbpl.1688:43|
 :skolemid |149|
 :pattern ( (MapType1Select QPMask@3 o_3@@7 f_5@@1))
 :pattern ( (MapType1Select QPMask@4 o_3@@7 f_5@@1))
)) (state ExhaleHeap@1 QPMask@4)) (and (<= (- 0 1) index@4) (< index@4 (|Seq#Length| arg_S@0)))) (and (=> (= (ControlFlow 0 81) 79) anon88_Then_correct) (=> (= (ControlFlow 0 81) 80) anon88_Else_correct))))))))))))
(let ((anon84_Else_correct  (=> (forall ((i_14_1 Int) (j_5_1 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| arg_S@0)) (int_2_U i_14_1)) (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| arg_S@0)) (int_2_U j_5_1)) (not (= i_14_1 j_5_1)))) (not (= (|Seq#Index| arg_S@0 i_14_1) (|Seq#Index| arg_S@0 j_5_1))))
 :qid |stdinbpl.1585:34|
 :skolemid |134|
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| arg_S@0)) (int_2_U i_14_1)) (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| arg_S@0)) (int_2_U j_5_1)))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| arg_S@0)) (int_2_U i_14_1)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| arg_S@0)) (int_2_U j_5_1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| arg_S@0)) (int_2_U i_14_1)) (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| arg_S@0)) (int_2_U j_5_1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| arg_S@0)) (int_2_U i_14_1)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| arg_S@0)) (int_2_U j_5_1)))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| arg_S@0)) (int_2_U i_14_1)) (|Seq#Index| arg_S@0 j_5_1))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| arg_S@0)) (int_2_U i_14_1)) (|Seq#Index| arg_S@0 j_5_1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| arg_S@0)) (int_2_U j_5_1)) (|Seq#Index| arg_S@0 i_14_1))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| arg_S@0)) (int_2_U j_5_1)) (|Seq#Index| arg_S@0 i_14_1))
 :pattern ( (|Seq#Index| arg_S@0 i_14_1) (|Seq#Index| arg_S@0 j_5_1))
)) (and (=> (= (ControlFlow 0 84) (- 0 87)) (forall ((i_15 Int) ) (!  (=> (and (and (<= 0 i_15) (< i_15 (|Seq#Length| arg_S@0))) (dummyFunction (MapType0Select Heap@@9 (|Seq#Index| arg_S@0 i_15) f_7))) (>= arg_p@0 NoPerm))
 :qid |stdinbpl.1593:31|
 :skolemid |135|
 :pattern ( (|Seq#Index| arg_S@0 i_15))
 :pattern ( (|Seq#Index| arg_S@0 i_15))
))) (=> (forall ((i_15@@0 Int) ) (!  (=> (and (and (<= 0 i_15@@0) (< i_15@@0 (|Seq#Length| arg_S@0))) (dummyFunction (MapType0Select Heap@@9 (|Seq#Index| arg_S@0 i_15@@0) f_7))) (>= arg_p@0 NoPerm))
 :qid |stdinbpl.1593:31|
 :skolemid |135|
 :pattern ( (|Seq#Index| arg_S@0 i_15@@0))
 :pattern ( (|Seq#Index| arg_S@0 i_15@@0))
)) (and (=> (= (ControlFlow 0 84) (- 0 86)) (forall ((i_15@@1 Int) (i_15_1 Int) ) (!  (=> (and (and (and (and (not (= i_15@@1 i_15_1)) (and (<= 0 i_15@@1) (< i_15@@1 (|Seq#Length| arg_S@0)))) (and (<= 0 i_15_1) (< i_15_1 (|Seq#Length| arg_S@0)))) (< NoPerm arg_p@0)) (< NoPerm arg_p@0)) (not (= (|Seq#Index| arg_S@0 i_15@@1) (|Seq#Index| arg_S@0 i_15_1))))
 :qid |stdinbpl.1600:31|
 :skolemid |136|
 :pattern ( (neverTriggered11 i_15@@1) (neverTriggered11 i_15_1))
))) (=> (forall ((i_15@@2 Int) (i_15_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_15@@2 i_15_1@@0)) (and (<= 0 i_15@@2) (< i_15@@2 (|Seq#Length| arg_S@0)))) (and (<= 0 i_15_1@@0) (< i_15_1@@0 (|Seq#Length| arg_S@0)))) (< NoPerm arg_p@0)) (< NoPerm arg_p@0)) (not (= (|Seq#Index| arg_S@0 i_15@@2) (|Seq#Index| arg_S@0 i_15_1@@0))))
 :qid |stdinbpl.1600:31|
 :skolemid |136|
 :pattern ( (neverTriggered11 i_15@@2) (neverTriggered11 i_15_1@@0))
)) (and (=> (= (ControlFlow 0 84) (- 0 85)) (forall ((i_15@@3 Int) ) (!  (=> (and (<= 0 i_15@@3) (< i_15@@3 (|Seq#Length| arg_S@0))) (>= (U_2_real (MapType1Select QPMask@0 (|Seq#Index| arg_S@0 i_15@@3) f_7)) arg_p@0))
 :qid |stdinbpl.1607:31|
 :skolemid |137|
 :pattern ( (|Seq#Index| arg_S@0 i_15@@3))
 :pattern ( (|Seq#Index| arg_S@0 i_15@@3))
))) (=> (forall ((i_15@@4 Int) ) (!  (=> (and (<= 0 i_15@@4) (< i_15@@4 (|Seq#Length| arg_S@0))) (>= (U_2_real (MapType1Select QPMask@0 (|Seq#Index| arg_S@0 i_15@@4) f_7)) arg_p@0))
 :qid |stdinbpl.1607:31|
 :skolemid |137|
 :pattern ( (|Seq#Index| arg_S@0 i_15@@4))
 :pattern ( (|Seq#Index| arg_S@0 i_15@@4))
)) (=> (and (and (forall ((i_15@@5 Int) ) (!  (=> (and (and (<= 0 i_15@@5) (< i_15@@5 (|Seq#Length| arg_S@0))) (< NoPerm arg_p@0)) (and (qpRange11 (|Seq#Index| arg_S@0 i_15@@5)) (= (invRecv11 (|Seq#Index| arg_S@0 i_15@@5)) i_15@@5)))
 :qid |stdinbpl.1613:36|
 :skolemid |138|
 :pattern ( (|Seq#Index| arg_S@0 i_15@@5))
 :pattern ( (|Seq#Index| arg_S@0 i_15@@5))
)) (forall ((o_3@@8 T@U) ) (!  (=> (= (type o_3@@8) RefType) (=> (and (and (<= 0 (invRecv11 o_3@@8)) (< (invRecv11 o_3@@8) (|Seq#Length| arg_S@0))) (and (< NoPerm arg_p@0) (qpRange11 o_3@@8))) (= (|Seq#Index| arg_S@0 (invRecv11 o_3@@8)) o_3@@8)))
 :qid |stdinbpl.1617:36|
 :skolemid |139|
 :pattern ( (invRecv11 o_3@@8))
))) (and (forall ((o_3@@9 T@U) ) (!  (=> (= (type o_3@@9) RefType) (and (=> (and (and (<= 0 (invRecv11 o_3@@9)) (< (invRecv11 o_3@@9) (|Seq#Length| arg_S@0))) (and (< NoPerm arg_p@0) (qpRange11 o_3@@9))) (and (= (|Seq#Index| arg_S@0 (invRecv11 o_3@@9)) o_3@@9) (= (U_2_real (MapType1Select QPMask@3 o_3@@9 f_7)) (- (U_2_real (MapType1Select QPMask@0 o_3@@9 f_7)) arg_p@0)))) (=> (not (and (and (<= 0 (invRecv11 o_3@@9)) (< (invRecv11 o_3@@9) (|Seq#Length| arg_S@0))) (and (< NoPerm arg_p@0) (qpRange11 o_3@@9)))) (= (U_2_real (MapType1Select QPMask@3 o_3@@9 f_7)) (U_2_real (MapType1Select QPMask@0 o_3@@9 f_7))))))
 :qid |stdinbpl.1623:36|
 :skolemid |140|
 :pattern ( (MapType1Select QPMask@3 o_3@@9 f_7))
)) (forall ((o_3@@10 T@U) (f_5@@2 T@U) ) (! (let ((B@@14 (FieldTypeInv1 (type f_5@@2))))
(let ((A@@15 (FieldTypeInv0 (type f_5@@2))))
 (=> (and (and (= (type o_3@@10) RefType) (= (type f_5@@2) (FieldType A@@15 B@@14))) (not (= f_5@@2 f_7))) (= (U_2_real (MapType1Select QPMask@0 o_3@@10 f_5@@2)) (U_2_real (MapType1Select QPMask@3 o_3@@10 f_5@@2))))))
 :qid |stdinbpl.1629:43|
 :skolemid |141|
 :pattern ( (MapType1Select QPMask@3 o_3@@10 f_5@@2))
)))) (and (and (=> (= (ControlFlow 0 84) 81) anon86_Else_correct) (=> (= (ControlFlow 0 84) 73) anon87_Then_correct)) (=> (= (ControlFlow 0 84) 75) anon87_Else_correct))))))))))))
(let ((anon83_Then_correct  (=> (< x@@11 (U_2_int (MapType0Select Heap@@9 (|Seq#Index| S k) f_7))) (=> (and (= arg_S@0 (|Seq#Drop| (|Seq#Take| S k) 0)) (= arg_p@0 (/ p_1 (to_real 2)))) (and (=> (= (ControlFlow 0 88) (- 0 90)) (< NoPerm arg_p@0)) (=> (< NoPerm arg_p@0) (and (=> (= (ControlFlow 0 88) (- 0 89)) (< arg_p@0 FullPerm)) (=> (< arg_p@0 FullPerm) (and (and (=> (= (ControlFlow 0 88) 84) anon84_Else_correct) (=> (= (ControlFlow 0 88) 69) anon85_Then_correct)) (=> (= (ControlFlow 0 88) 71) anon85_Else_correct))))))))))
(let ((anon56_correct  (=> (and (and (and (state ExhaleHeap@0 QPMask@2) (state ExhaleHeap@0 QPMask@2)) (and (= index@3 (+ index@2 (ite (= index@2 (- 0 1)) 0 k))) (state ExhaleHeap@0 QPMask@2))) (and (and (= Mask@0 QPMask@2) (= Heap@0 ExhaleHeap@0)) (and (= index@5 index@3) (= (ControlFlow 0 53) 52)))) anon57_correct)))
(let ((anon95_Else_correct  (=> (and (not (= index@2 (- 0 1))) (= (ControlFlow 0 55) 53)) anon56_correct)))
(let ((anon95_Then_correct  (=> (= index@2 (- 0 1)) (=> (and (forall ((i_26 Int) ) (!  (=> (and (<= 0 i_26) (< i_26 (|Seq#Length| arg_S_1@0))) (not (= (U_2_int (MapType0Select ExhaleHeap@0 (|Seq#Index| arg_S_1@0 i_26) f_7)) x@@11)))
 :qid |stdinbpl.1844:36|
 :skolemid |167|
 :pattern ( (|Seq#Index| arg_S_1@0 i_26))
)) (= (ControlFlow 0 54) 53)) anon56_correct))))
(let ((anon94_Else_correct  (=> (not (and (<= 0 index@2) (< index@2 (|Seq#Length| arg_S_1@0)))) (and (=> (= (ControlFlow 0 57) 54) anon95_Then_correct) (=> (= (ControlFlow 0 57) 55) anon95_Else_correct)))))
(let ((anon94_Then_correct  (=> (and (and (<= 0 index@2) (< index@2 (|Seq#Length| arg_S_1@0))) (= (U_2_int (MapType0Select ExhaleHeap@0 (|Seq#Index| arg_S_1@0 index@2) f_7)) x@@11)) (and (=> (= (ControlFlow 0 56) 54) anon95_Then_correct) (=> (= (ControlFlow 0 56) 55) anon95_Else_correct)))))
(let ((anon92_Else_correct  (=> (and (forall ((i_24_1 Int) (j_11_1 Int) ) (!  (=> (and (<= 0 i_24_1) (and (< i_24_1 j_11_1) (< j_11_1 (|Seq#Length| arg_S_1@0)))) (< (U_2_int (MapType0Select Heap@@9 (|Seq#Index| arg_S_1@0 i_24_1) f_7)) (U_2_int (MapType0Select Heap@@9 (|Seq#Index| arg_S_1@0 j_11_1) f_7))))
 :qid |stdinbpl.1785:34|
 :skolemid |159|
 :pattern ( (|Seq#Index| arg_S_1@0 i_24_1) (|Seq#Index| arg_S_1@0 j_11_1))
)) (IdenticalOnKnownLocations Heap@@9 ExhaleHeap@0 QPMask@1)) (and (=> (= (ControlFlow 0 58) (- 0 60)) (forall ((i_25 Int) (i_25_1 Int) ) (!  (=> (and (and (and (and (not (= i_25 i_25_1)) (and (<= 0 i_25) (< i_25 (|Seq#Length| arg_S_1@0)))) (and (<= 0 i_25_1) (< i_25_1 (|Seq#Length| arg_S_1@0)))) (< NoPerm arg_p_1@0)) (< NoPerm arg_p_1@0)) (not (= (|Seq#Index| arg_S_1@0 i_25) (|Seq#Index| arg_S_1@0 i_25_1))))
 :qid |stdinbpl.1800:29|
 :skolemid |160|
))) (=> (forall ((i_25@@0 Int) (i_25_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_25@@0 i_25_1@@0)) (and (<= 0 i_25@@0) (< i_25@@0 (|Seq#Length| arg_S_1@0)))) (and (<= 0 i_25_1@@0) (< i_25_1@@0 (|Seq#Length| arg_S_1@0)))) (< NoPerm arg_p_1@0)) (< NoPerm arg_p_1@0)) (not (= (|Seq#Index| arg_S_1@0 i_25@@0) (|Seq#Index| arg_S_1@0 i_25_1@@0))))
 :qid |stdinbpl.1800:29|
 :skolemid |160|
)) (=> (and (forall ((i_25@@1 Int) ) (!  (=> (and (and (<= 0 i_25@@1) (< i_25@@1 (|Seq#Length| arg_S_1@0))) (< NoPerm arg_p_1@0)) (and (qpRange14 (|Seq#Index| arg_S_1@0 i_25@@1)) (= (invRecv14 (|Seq#Index| arg_S_1@0 i_25@@1)) i_25@@1)))
 :qid |stdinbpl.1806:36|
 :skolemid |161|
 :pattern ( (|Seq#Index| arg_S_1@0 i_25@@1))
 :pattern ( (|Seq#Index| arg_S_1@0 i_25@@1))
)) (forall ((o_3@@11 T@U) ) (!  (=> (= (type o_3@@11) RefType) (=> (and (and (and (<= 0 (invRecv14 o_3@@11)) (< (invRecv14 o_3@@11) (|Seq#Length| arg_S_1@0))) (< NoPerm arg_p_1@0)) (qpRange14 o_3@@11)) (= (|Seq#Index| arg_S_1@0 (invRecv14 o_3@@11)) o_3@@11)))
 :qid |stdinbpl.1810:36|
 :skolemid |162|
 :pattern ( (invRecv14 o_3@@11))
))) (and (=> (= (ControlFlow 0 58) (- 0 59)) (forall ((i_25@@2 Int) ) (!  (=> (and (<= 0 i_25@@2) (< i_25@@2 (|Seq#Length| arg_S_1@0))) (>= arg_p_1@0 NoPerm))
 :qid |stdinbpl.1816:29|
 :skolemid |163|
 :pattern ( (|Seq#Index| arg_S_1@0 i_25@@2))
 :pattern ( (|Seq#Index| arg_S_1@0 i_25@@2))
))) (=> (forall ((i_25@@3 Int) ) (!  (=> (and (<= 0 i_25@@3) (< i_25@@3 (|Seq#Length| arg_S_1@0))) (>= arg_p_1@0 NoPerm))
 :qid |stdinbpl.1816:29|
 :skolemid |163|
 :pattern ( (|Seq#Index| arg_S_1@0 i_25@@3))
 :pattern ( (|Seq#Index| arg_S_1@0 i_25@@3))
)) (=> (and (forall ((i_25@@4 Int) ) (!  (=> (and (and (<= 0 i_25@@4) (< i_25@@4 (|Seq#Length| arg_S_1@0))) (> arg_p_1@0 NoPerm)) (not (= (|Seq#Index| arg_S_1@0 i_25@@4) null)))
 :qid |stdinbpl.1822:36|
 :skolemid |164|
 :pattern ( (|Seq#Index| arg_S_1@0 i_25@@4))
 :pattern ( (|Seq#Index| arg_S_1@0 i_25@@4))
)) (forall ((o_3@@12 T@U) ) (!  (=> (= (type o_3@@12) RefType) (and (=> (and (and (and (<= 0 (invRecv14 o_3@@12)) (< (invRecv14 o_3@@12) (|Seq#Length| arg_S_1@0))) (< NoPerm arg_p_1@0)) (qpRange14 o_3@@12)) (and (=> (< NoPerm arg_p_1@0) (= (|Seq#Index| arg_S_1@0 (invRecv14 o_3@@12)) o_3@@12)) (= (U_2_real (MapType1Select QPMask@2 o_3@@12 f_7)) (+ (U_2_real (MapType1Select QPMask@1 o_3@@12 f_7)) arg_p_1@0)))) (=> (not (and (and (and (<= 0 (invRecv14 o_3@@12)) (< (invRecv14 o_3@@12) (|Seq#Length| arg_S_1@0))) (< NoPerm arg_p_1@0)) (qpRange14 o_3@@12))) (= (U_2_real (MapType1Select QPMask@2 o_3@@12 f_7)) (U_2_real (MapType1Select QPMask@1 o_3@@12 f_7))))))
 :qid |stdinbpl.1828:36|
 :skolemid |165|
 :pattern ( (MapType1Select QPMask@2 o_3@@12 f_7))
))) (=> (and (and (forall ((o_3@@13 T@U) (f_5@@3 T@U) ) (! (let ((B@@15 (FieldTypeInv1 (type f_5@@3))))
(let ((A@@16 (FieldTypeInv0 (type f_5@@3))))
 (=> (and (and (= (type o_3@@13) RefType) (= (type f_5@@3) (FieldType A@@16 B@@15))) (not (= f_5@@3 f_7))) (= (U_2_real (MapType1Select QPMask@1 o_3@@13 f_5@@3)) (U_2_real (MapType1Select QPMask@2 o_3@@13 f_5@@3))))))
 :qid |stdinbpl.1832:43|
 :skolemid |166|
 :pattern ( (MapType1Select QPMask@1 o_3@@13 f_5@@3))
 :pattern ( (MapType1Select QPMask@2 o_3@@13 f_5@@3))
)) (state ExhaleHeap@0 QPMask@2)) (and (<= (- 0 1) index@2) (< index@2 (|Seq#Length| arg_S_1@0)))) (and (=> (= (ControlFlow 0 58) 56) anon94_Then_correct) (=> (= (ControlFlow 0 58) 57) anon94_Else_correct))))))))))))
(let ((anon82_Then_correct  (=> (= (|Seq#Length| S) 1) (and (=> (= (ControlFlow 0 49) (- 0 51)) (< 0 (|Seq#Length| S))) (=> (< 0 (|Seq#Length| S)) (and (=> (= (ControlFlow 0 49) (- 0 50)) (HasDirectPerm QPMask@0 (|Seq#Index| S 0) f_7)) (=> (HasDirectPerm QPMask@0 (|Seq#Index| S 0) f_7) (=> (and (= index@1 (ite (= x@@11 (U_2_int (MapType0Select Heap@@9 (|Seq#Index| S 0) f_7))) 0 (- 0 1))) (state Heap@@9 QPMask@0)) (=> (and (and (= Heap@1 Heap@@9) (= Mask@1 QPMask@0)) (and (= index@6 index@1) (= (ControlFlow 0 49) 48))) anon58_correct)))))))))
(let ((anon81_Then_correct  (=> (= (|Seq#Length| S) 0) (=> (and (= index@0 (- 0 1)) (state Heap@@9 QPMask@0)) (=> (and (and (= Heap@2 Heap@@9) (= Mask@2 QPMask@0)) (and (= index@7 index@0) (= (ControlFlow 0 47) 41))) anon59_correct)))))
(let ((anon51_correct true))
(let ((anon93_Else_correct  (=> (and (not (and (<= 0 i_23) (and (< i_23 j_10) (< j_10 (|Seq#Length| arg_S_1@0))))) (= (ControlFlow 0 29) 26)) anon51_correct)))
(let ((anon93_Then_correct  (=> (and (<= 0 i_23) (and (< i_23 j_10) (< j_10 (|Seq#Length| arg_S_1@0)))) (and (=> (= (ControlFlow 0 27) (- 0 28)) (< (U_2_int (MapType0Select Heap@@9 (|Seq#Index| arg_S_1@0 i_23) f_7)) (U_2_int (MapType0Select Heap@@9 (|Seq#Index| arg_S_1@0 j_10) f_7)))) (=> (< (U_2_int (MapType0Select Heap@@9 (|Seq#Index| arg_S_1@0 i_23) f_7)) (U_2_int (MapType0Select Heap@@9 (|Seq#Index| arg_S_1@0 j_10) f_7))) (=> (= (ControlFlow 0 27) 26) anon51_correct))))))
(let ((anon90_Else_correct  (=> (forall ((i_21_1 Int) (j_9_1 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| arg_S_1@0)) (int_2_U i_21_1)) (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| arg_S_1@0)) (int_2_U j_9_1)) (not (= i_21_1 j_9_1)))) (not (= (|Seq#Index| arg_S_1@0 i_21_1) (|Seq#Index| arg_S_1@0 j_9_1))))
 :qid |stdinbpl.1729:34|
 :skolemid |151|
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| arg_S_1@0)) (int_2_U i_21_1)) (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| arg_S_1@0)) (int_2_U j_9_1)))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| arg_S_1@0)) (int_2_U i_21_1)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| arg_S_1@0)) (int_2_U j_9_1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| arg_S_1@0)) (int_2_U i_21_1)) (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| arg_S_1@0)) (int_2_U j_9_1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| arg_S_1@0)) (int_2_U i_21_1)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| arg_S_1@0)) (int_2_U j_9_1)))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| arg_S_1@0)) (int_2_U i_21_1)) (|Seq#Index| arg_S_1@0 j_9_1))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| arg_S_1@0)) (int_2_U i_21_1)) (|Seq#Index| arg_S_1@0 j_9_1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| arg_S_1@0)) (int_2_U j_9_1)) (|Seq#Index| arg_S_1@0 i_21_1))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| arg_S_1@0)) (int_2_U j_9_1)) (|Seq#Index| arg_S_1@0 i_21_1))
 :pattern ( (|Seq#Index| arg_S_1@0 i_21_1) (|Seq#Index| arg_S_1@0 j_9_1))
)) (and (=> (= (ControlFlow 0 61) (- 0 64)) (forall ((i_22 Int) ) (!  (=> (and (and (<= 0 i_22) (< i_22 (|Seq#Length| arg_S_1@0))) (dummyFunction (MapType0Select Heap@@9 (|Seq#Index| arg_S_1@0 i_22) f_7))) (>= arg_p_1@0 NoPerm))
 :qid |stdinbpl.1737:31|
 :skolemid |152|
 :pattern ( (|Seq#Index| arg_S_1@0 i_22))
 :pattern ( (|Seq#Index| arg_S_1@0 i_22))
))) (=> (forall ((i_22@@0 Int) ) (!  (=> (and (and (<= 0 i_22@@0) (< i_22@@0 (|Seq#Length| arg_S_1@0))) (dummyFunction (MapType0Select Heap@@9 (|Seq#Index| arg_S_1@0 i_22@@0) f_7))) (>= arg_p_1@0 NoPerm))
 :qid |stdinbpl.1737:31|
 :skolemid |152|
 :pattern ( (|Seq#Index| arg_S_1@0 i_22@@0))
 :pattern ( (|Seq#Index| arg_S_1@0 i_22@@0))
)) (and (=> (= (ControlFlow 0 61) (- 0 63)) (forall ((i_22@@1 Int) (i_22_1 Int) ) (!  (=> (and (and (and (and (not (= i_22@@1 i_22_1)) (and (<= 0 i_22@@1) (< i_22@@1 (|Seq#Length| arg_S_1@0)))) (and (<= 0 i_22_1) (< i_22_1 (|Seq#Length| arg_S_1@0)))) (< NoPerm arg_p_1@0)) (< NoPerm arg_p_1@0)) (not (= (|Seq#Index| arg_S_1@0 i_22@@1) (|Seq#Index| arg_S_1@0 i_22_1))))
 :qid |stdinbpl.1744:31|
 :skolemid |153|
 :pattern ( (neverTriggered13 i_22@@1) (neverTriggered13 i_22_1))
))) (=> (forall ((i_22@@2 Int) (i_22_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_22@@2 i_22_1@@0)) (and (<= 0 i_22@@2) (< i_22@@2 (|Seq#Length| arg_S_1@0)))) (and (<= 0 i_22_1@@0) (< i_22_1@@0 (|Seq#Length| arg_S_1@0)))) (< NoPerm arg_p_1@0)) (< NoPerm arg_p_1@0)) (not (= (|Seq#Index| arg_S_1@0 i_22@@2) (|Seq#Index| arg_S_1@0 i_22_1@@0))))
 :qid |stdinbpl.1744:31|
 :skolemid |153|
 :pattern ( (neverTriggered13 i_22@@2) (neverTriggered13 i_22_1@@0))
)) (and (=> (= (ControlFlow 0 61) (- 0 62)) (forall ((i_22@@3 Int) ) (!  (=> (and (<= 0 i_22@@3) (< i_22@@3 (|Seq#Length| arg_S_1@0))) (>= (U_2_real (MapType1Select QPMask@0 (|Seq#Index| arg_S_1@0 i_22@@3) f_7)) arg_p_1@0))
 :qid |stdinbpl.1751:31|
 :skolemid |154|
 :pattern ( (|Seq#Index| arg_S_1@0 i_22@@3))
 :pattern ( (|Seq#Index| arg_S_1@0 i_22@@3))
))) (=> (forall ((i_22@@4 Int) ) (!  (=> (and (<= 0 i_22@@4) (< i_22@@4 (|Seq#Length| arg_S_1@0))) (>= (U_2_real (MapType1Select QPMask@0 (|Seq#Index| arg_S_1@0 i_22@@4) f_7)) arg_p_1@0))
 :qid |stdinbpl.1751:31|
 :skolemid |154|
 :pattern ( (|Seq#Index| arg_S_1@0 i_22@@4))
 :pattern ( (|Seq#Index| arg_S_1@0 i_22@@4))
)) (=> (and (and (forall ((i_22@@5 Int) ) (!  (=> (and (and (<= 0 i_22@@5) (< i_22@@5 (|Seq#Length| arg_S_1@0))) (< NoPerm arg_p_1@0)) (and (qpRange13 (|Seq#Index| arg_S_1@0 i_22@@5)) (= (invRecv13 (|Seq#Index| arg_S_1@0 i_22@@5)) i_22@@5)))
 :qid |stdinbpl.1757:36|
 :skolemid |155|
 :pattern ( (|Seq#Index| arg_S_1@0 i_22@@5))
 :pattern ( (|Seq#Index| arg_S_1@0 i_22@@5))
)) (forall ((o_3@@14 T@U) ) (!  (=> (= (type o_3@@14) RefType) (=> (and (and (<= 0 (invRecv13 o_3@@14)) (< (invRecv13 o_3@@14) (|Seq#Length| arg_S_1@0))) (and (< NoPerm arg_p_1@0) (qpRange13 o_3@@14))) (= (|Seq#Index| arg_S_1@0 (invRecv13 o_3@@14)) o_3@@14)))
 :qid |stdinbpl.1761:36|
 :skolemid |156|
 :pattern ( (invRecv13 o_3@@14))
))) (and (forall ((o_3@@15 T@U) ) (!  (=> (= (type o_3@@15) RefType) (and (=> (and (and (<= 0 (invRecv13 o_3@@15)) (< (invRecv13 o_3@@15) (|Seq#Length| arg_S_1@0))) (and (< NoPerm arg_p_1@0) (qpRange13 o_3@@15))) (and (= (|Seq#Index| arg_S_1@0 (invRecv13 o_3@@15)) o_3@@15) (= (U_2_real (MapType1Select QPMask@1 o_3@@15 f_7)) (- (U_2_real (MapType1Select QPMask@0 o_3@@15 f_7)) arg_p_1@0)))) (=> (not (and (and (<= 0 (invRecv13 o_3@@15)) (< (invRecv13 o_3@@15) (|Seq#Length| arg_S_1@0))) (and (< NoPerm arg_p_1@0) (qpRange13 o_3@@15)))) (= (U_2_real (MapType1Select QPMask@1 o_3@@15 f_7)) (U_2_real (MapType1Select QPMask@0 o_3@@15 f_7))))))
 :qid |stdinbpl.1767:36|
 :skolemid |157|
 :pattern ( (MapType1Select QPMask@1 o_3@@15 f_7))
)) (forall ((o_3@@16 T@U) (f_5@@4 T@U) ) (! (let ((B@@16 (FieldTypeInv1 (type f_5@@4))))
(let ((A@@17 (FieldTypeInv0 (type f_5@@4))))
 (=> (and (and (= (type o_3@@16) RefType) (= (type f_5@@4) (FieldType A@@17 B@@16))) (not (= f_5@@4 f_7))) (= (U_2_real (MapType1Select QPMask@0 o_3@@16 f_5@@4)) (U_2_real (MapType1Select QPMask@1 o_3@@16 f_5@@4))))))
 :qid |stdinbpl.1773:43|
 :skolemid |158|
 :pattern ( (MapType1Select QPMask@1 o_3@@16 f_5@@4))
)))) (and (and (=> (= (ControlFlow 0 61) 58) anon92_Else_correct) (=> (= (ControlFlow 0 61) 27) anon93_Then_correct)) (=> (= (ControlFlow 0 61) 29) anon93_Else_correct))))))))))))
(let ((anon47_correct true))
(let ((anon91_Else_correct  (=> (and (not (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| arg_S_1@0)) (int_2_U i_20)) (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| arg_S_1@0)) (int_2_U j_8)) (not (= i_20 j_8))))) (= (ControlFlow 0 25) 22)) anon47_correct)))
(let ((anon91_Then_correct  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| arg_S_1@0)) (int_2_U i_20)) (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| arg_S_1@0)) (int_2_U j_8)) (not (= i_20 j_8)))) (and (=> (= (ControlFlow 0 23) (- 0 24)) (not (= (|Seq#Index| arg_S_1@0 i_20) (|Seq#Index| arg_S_1@0 j_8)))) (=> (not (= (|Seq#Index| arg_S_1@0 i_20) (|Seq#Index| arg_S_1@0 j_8))) (=> (= (ControlFlow 0 23) 22) anon47_correct))))))
(let ((anon83_Else_correct  (=> (<= (U_2_int (MapType0Select Heap@@9 (|Seq#Index| S k) f_7)) x@@11) (=> (and (= arg_S_1@0 (|Seq#Drop| (|Seq#Take| S (|Seq#Length| S)) k)) (= arg_p_1@0 (/ p_1 (to_real 2)))) (and (=> (= (ControlFlow 0 65) (- 0 67)) (< NoPerm arg_p_1@0)) (=> (< NoPerm arg_p_1@0) (and (=> (= (ControlFlow 0 65) (- 0 66)) (< arg_p_1@0 FullPerm)) (=> (< arg_p_1@0 FullPerm) (and (and (=> (= (ControlFlow 0 65) 61) anon90_Else_correct) (=> (= (ControlFlow 0 65) 23) anon91_Then_correct)) (=> (= (ControlFlow 0 65) 25) anon91_Else_correct))))))))))
(let ((anon82_Else_correct  (=> (not (= (|Seq#Length| S) 1)) (=> (and (and (< 0 k) (< k (- (|Seq#Length| S) 1))) (and (state Heap@@9 QPMask@0) (state Heap@@9 QPMask@0))) (and (=> (= (ControlFlow 0 91) (- 0 94)) (>= k 0)) (=> (>= k 0) (and (=> (= (ControlFlow 0 91) (- 0 93)) (< k (|Seq#Length| S))) (=> (< k (|Seq#Length| S)) (and (=> (= (ControlFlow 0 91) (- 0 92)) (HasDirectPerm QPMask@0 (|Seq#Index| S k) f_7)) (=> (HasDirectPerm QPMask@0 (|Seq#Index| S k) f_7) (and (=> (= (ControlFlow 0 91) 88) anon83_Then_correct) (=> (= (ControlFlow 0 91) 65) anon83_Else_correct))))))))))))
(let ((anon81_Else_correct  (=> (not (= (|Seq#Length| S) 0)) (and (=> (= (ControlFlow 0 95) 49) anon82_Then_correct) (=> (= (ControlFlow 0 95) 91) anon82_Else_correct)))))
(let ((anon72_Else_correct  (=> (and (forall ((i_5 Int) (j_3_2 Int) ) (!  (=> (and (<= 0 i_5) (and (< i_5 j_3_2) (< j_3_2 (|Seq#Length| S)))) (< (U_2_int (MapType0Select Heap@@9 (|Seq#Index| S i_5) f_7)) (U_2_int (MapType0Select Heap@@9 (|Seq#Index| S j_3_2) f_7))))
 :qid |stdinbpl.1419:20|
 :skolemid |125|
 :pattern ( (|Seq#Index| S i_5) (|Seq#Index| S j_3_2))
)) (state Heap@@9 QPMask@0)) (and (and (=> (= (ControlFlow 0 121) 120) anon74_Then_correct) (=> (= (ControlFlow 0 121) 47) anon81_Then_correct)) (=> (= (ControlFlow 0 121) 95) anon81_Else_correct)))))
(let ((anon11_correct true))
(let ((anon73_Else_correct  (=> (and (not (and (<= 0 i_17) (and (< i_17 j_5) (< j_5 (|Seq#Length| S))))) (= (ControlFlow 0 21) 13)) anon11_correct)))
(let ((anon73_Then_correct  (=> (and (<= 0 i_17) (and (< i_17 j_5) (< j_5 (|Seq#Length| S)))) (and (=> (= (ControlFlow 0 14) (- 0 20)) (>= i_17 0)) (=> (>= i_17 0) (and (=> (= (ControlFlow 0 14) (- 0 19)) (< i_17 (|Seq#Length| S))) (=> (< i_17 (|Seq#Length| S)) (and (=> (= (ControlFlow 0 14) (- 0 18)) (HasDirectPerm QPMask@0 (|Seq#Index| S i_17) f_7)) (=> (HasDirectPerm QPMask@0 (|Seq#Index| S i_17) f_7) (and (=> (= (ControlFlow 0 14) (- 0 17)) (>= j_5 0)) (=> (>= j_5 0) (and (=> (= (ControlFlow 0 14) (- 0 16)) (< j_5 (|Seq#Length| S))) (=> (< j_5 (|Seq#Length| S)) (and (=> (= (ControlFlow 0 14) (- 0 15)) (HasDirectPerm QPMask@0 (|Seq#Index| S j_5) f_7)) (=> (HasDirectPerm QPMask@0 (|Seq#Index| S j_5) f_7) (=> (= (ControlFlow 0 14) 13) anon11_correct))))))))))))))))
(let ((anon70_Else_correct  (and (=> (= (ControlFlow 0 122) (- 0 124)) (forall ((i_3 Int) (i_3_1 Int) ) (!  (=> (and (and (and (and (not (= i_3 i_3_1)) (and (<= 0 i_3) (< i_3 (|Seq#Length| S)))) (and (<= 0 i_3_1) (< i_3_1 (|Seq#Length| S)))) (< NoPerm p_1)) (< NoPerm p_1)) (not (= (|Seq#Index| S i_3) (|Seq#Index| S i_3_1))))
 :qid |stdinbpl.1361:15|
 :skolemid |118|
))) (=> (forall ((i_3@@0 Int) (i_3_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_3@@0 i_3_1@@0)) (and (<= 0 i_3@@0) (< i_3@@0 (|Seq#Length| S)))) (and (<= 0 i_3_1@@0) (< i_3_1@@0 (|Seq#Length| S)))) (< NoPerm p_1)) (< NoPerm p_1)) (not (= (|Seq#Index| S i_3@@0) (|Seq#Index| S i_3_1@@0))))
 :qid |stdinbpl.1361:15|
 :skolemid |118|
)) (=> (and (forall ((i_3@@1 Int) ) (!  (=> (and (and (<= 0 i_3@@1) (< i_3@@1 (|Seq#Length| S))) (< NoPerm p_1)) (and (qpRange8 (|Seq#Index| S i_3@@1)) (= (invRecv8 (|Seq#Index| S i_3@@1)) i_3@@1)))
 :qid |stdinbpl.1367:22|
 :skolemid |119|
 :pattern ( (|Seq#Index| S i_3@@1))
 :pattern ( (|Seq#Index| S i_3@@1))
)) (forall ((o_3@@17 T@U) ) (!  (=> (= (type o_3@@17) RefType) (=> (and (and (and (<= 0 (invRecv8 o_3@@17)) (< (invRecv8 o_3@@17) (|Seq#Length| S))) (< NoPerm p_1)) (qpRange8 o_3@@17)) (= (|Seq#Index| S (invRecv8 o_3@@17)) o_3@@17)))
 :qid |stdinbpl.1371:22|
 :skolemid |120|
 :pattern ( (invRecv8 o_3@@17))
))) (and (=> (= (ControlFlow 0 122) (- 0 123)) (forall ((i_3@@2 Int) ) (!  (=> (and (<= 0 i_3@@2) (< i_3@@2 (|Seq#Length| S))) (>= p_1 NoPerm))
 :qid |stdinbpl.1377:15|
 :skolemid |121|
 :pattern ( (|Seq#Index| S i_3@@2))
 :pattern ( (|Seq#Index| S i_3@@2))
))) (=> (forall ((i_3@@3 Int) ) (!  (=> (and (<= 0 i_3@@3) (< i_3@@3 (|Seq#Length| S))) (>= p_1 NoPerm))
 :qid |stdinbpl.1377:15|
 :skolemid |121|
 :pattern ( (|Seq#Index| S i_3@@3))
 :pattern ( (|Seq#Index| S i_3@@3))
)) (=> (forall ((i_3@@4 Int) ) (!  (=> (and (and (<= 0 i_3@@4) (< i_3@@4 (|Seq#Length| S))) (> p_1 NoPerm)) (not (= (|Seq#Index| S i_3@@4) null)))
 :qid |stdinbpl.1383:22|
 :skolemid |122|
 :pattern ( (|Seq#Index| S i_3@@4))
 :pattern ( (|Seq#Index| S i_3@@4))
)) (=> (and (and (forall ((o_3@@18 T@U) ) (!  (=> (= (type o_3@@18) RefType) (and (=> (and (and (and (<= 0 (invRecv8 o_3@@18)) (< (invRecv8 o_3@@18) (|Seq#Length| S))) (< NoPerm p_1)) (qpRange8 o_3@@18)) (and (=> (< NoPerm p_1) (= (|Seq#Index| S (invRecv8 o_3@@18)) o_3@@18)) (= (U_2_real (MapType1Select QPMask@0 o_3@@18 f_7)) (+ (U_2_real (MapType1Select ZeroMask o_3@@18 f_7)) p_1)))) (=> (not (and (and (and (<= 0 (invRecv8 o_3@@18)) (< (invRecv8 o_3@@18) (|Seq#Length| S))) (< NoPerm p_1)) (qpRange8 o_3@@18))) (= (U_2_real (MapType1Select QPMask@0 o_3@@18 f_7)) (U_2_real (MapType1Select ZeroMask o_3@@18 f_7))))))
 :qid |stdinbpl.1389:22|
 :skolemid |123|
 :pattern ( (MapType1Select QPMask@0 o_3@@18 f_7))
)) (forall ((o_3@@19 T@U) (f_5@@5 T@U) ) (! (let ((B@@17 (FieldTypeInv1 (type f_5@@5))))
(let ((A@@18 (FieldTypeInv0 (type f_5@@5))))
 (=> (and (and (= (type o_3@@19) RefType) (= (type f_5@@5) (FieldType A@@18 B@@17))) (not (= f_5@@5 f_7))) (= (U_2_real (MapType1Select ZeroMask o_3@@19 f_5@@5)) (U_2_real (MapType1Select QPMask@0 o_3@@19 f_5@@5))))))
 :qid |stdinbpl.1393:29|
 :skolemid |124|
 :pattern ( (MapType1Select ZeroMask o_3@@19 f_5@@5))
 :pattern ( (MapType1Select QPMask@0 o_3@@19 f_5@@5))
))) (and (state Heap@@9 QPMask@0) (state Heap@@9 QPMask@0))) (and (and (=> (= (ControlFlow 0 122) 121) anon72_Else_correct) (=> (= (ControlFlow 0 122) 14) anon73_Then_correct)) (=> (= (ControlFlow 0 122) 21) anon73_Else_correct)))))))))))
(let ((anon7_correct true))
(let ((anon71_Else_correct  (=> (and (not (and (<= 0 i_14) (< i_14 (|Seq#Length| S)))) (= (ControlFlow 0 12) 8)) anon7_correct)))
(let ((anon71_Then_correct  (=> (and (<= 0 i_14) (< i_14 (|Seq#Length| S))) (and (=> (= (ControlFlow 0 9) (- 0 11)) (>= i_14 0)) (=> (>= i_14 0) (and (=> (= (ControlFlow 0 9) (- 0 10)) (< i_14 (|Seq#Length| S))) (=> (< i_14 (|Seq#Length| S)) (=> (= (ControlFlow 0 9) 8) anon7_correct))))))))
(let ((anon68_Else_correct  (=> (and (forall ((i_1 Int) (j_1 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| S)) (int_2_U i_1)) (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| S)) (int_2_U j_1)) (not (= i_1 j_1)))) (not (= (|Seq#Index| S i_1) (|Seq#Index| S j_1))))
 :qid |stdinbpl.1343:20|
 :skolemid |117|
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| S)) (int_2_U i_1)) (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| S)) (int_2_U j_1)))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| S)) (int_2_U i_1)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| S)) (int_2_U j_1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| S)) (int_2_U i_1)) (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| S)) (int_2_U j_1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| S)) (int_2_U i_1)) (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| S)) (int_2_U j_1)))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| S)) (int_2_U i_1)) (|Seq#Index| S j_1))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| S)) (int_2_U i_1)) (|Seq#Index| S j_1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| 0 (|Seq#Length| S)) (int_2_U j_1)) (|Seq#Index| S i_1))
 :pattern ( (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| S)) (int_2_U j_1)) (|Seq#Index| S i_1))
 :pattern ( (|Seq#Index| S i_1) (|Seq#Index| S j_1))
)) (state Heap@@9 ZeroMask)) (and (and (=> (= (ControlFlow 0 125) 122) anon70_Else_correct) (=> (= (ControlFlow 0 125) 9) anon71_Then_correct)) (=> (= (ControlFlow 0 125) 12) anon71_Else_correct)))))
(let ((anon3_correct true))
(let ((anon69_Else_correct  (=> (and (not (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| S)) (int_2_U i_12)) (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| S)) (int_2_U j_3)) (not (= i_12 j_3))))) (= (ControlFlow 0 7) 1)) anon3_correct)))
(let ((anon69_Then_correct  (=> (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| S)) (int_2_U i_12)) (and (|Seq#Contains| (|Seq#Range| 0 (|Seq#Length| S)) (int_2_U j_3)) (not (= i_12 j_3)))) (and (=> (= (ControlFlow 0 2) (- 0 6)) (>= i_12 0)) (=> (>= i_12 0) (and (=> (= (ControlFlow 0 2) (- 0 5)) (< i_12 (|Seq#Length| S))) (=> (< i_12 (|Seq#Length| S)) (and (=> (= (ControlFlow 0 2) (- 0 4)) (>= j_3 0)) (=> (>= j_3 0) (and (=> (= (ControlFlow 0 2) (- 0 3)) (< j_3 (|Seq#Length| S))) (=> (< j_3 (|Seq#Length| S)) (=> (= (ControlFlow 0 2) 1) anon3_correct))))))))))))
(let ((anon0_correct  (=> (and (and (state Heap@@9 ZeroMask) (< NoPerm p_1)) (and (< p_1 FullPerm) (state Heap@@9 ZeroMask))) (and (and (=> (= (ControlFlow 0 126) 125) anon68_Else_correct) (=> (= (ControlFlow 0 126) 2) anon69_Then_correct)) (=> (= (ControlFlow 0 126) 7) anon69_Else_correct)))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 127) 126) anon0_correct)))
PreconditionGeneratedEntry_correct))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
))
(check-sat)
(pop 1)
; Valid
(get-info :rlimit)
