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
(declare-fun value () T@U)
(declare-fun array () T@U)
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
(assert  (and (and (and (and (and (and (and (and (and (forall ((arg0@@11 T@T) (arg1 T@T) ) (! (= (Ctor (FieldType arg0@@11 arg1)) 6)
 :qid |ctor:FieldType|
)) (forall ((arg0@@12 T@T) (arg1@@0 T@T) ) (! (= (FieldTypeInv0 (FieldType arg0@@12 arg1@@0)) arg0@@12)
 :qid |typeInv:FieldTypeInv0|
 :pattern ( (FieldType arg0@@12 arg1@@0))
))) (forall ((arg0@@13 T@T) (arg1@@1 T@T) ) (! (= (FieldTypeInv1 (FieldType arg0@@13 arg1@@1)) arg1@@1)
 :qid |typeInv:FieldTypeInv1|
 :pattern ( (FieldType arg0@@13 arg1@@1))
))) (= (Ctor NormalFieldType) 7)) (= (type $allocated) (FieldType NormalFieldType boolType))) (= (type value) (FieldType NormalFieldType intType))) (forall ((arg0@@14 T@T) ) (! (= (Ctor (SeqType arg0@@14)) 8)
 :qid |ctor:SeqType|
))) (forall ((arg0@@15 T@T) ) (! (= (SeqTypeInv0 (SeqType arg0@@15)) arg0@@15)
 :qid |typeInv:SeqTypeInv0|
 :pattern ( (SeqType arg0@@15))
))) (= (Ctor RefType) 9)) (= (type array) (FieldType NormalFieldType (SeqType RefType)))))
(assert (distinct $allocated value array)
)
(assert (forall ((arg0@@16 T@U) (arg1@@2 Int) ) (! (let ((T (SeqTypeInv0 (type arg0@@16))))
(= (type (|Seq#Drop| arg0@@16 arg1@@2)) (SeqType T)))
 :qid |funType:Seq#Drop|
 :pattern ( (|Seq#Drop| arg0@@16 arg1@@2))
)))
(assert (forall ((s T@U) (n Int) ) (! (let ((T@@0 (SeqTypeInv0 (type s))))
 (=> (= (type s) (SeqType T@@0)) (and (=> (<= 0 n) (and (=> (<= n (|Seq#Length| s)) (= (|Seq#Length| (|Seq#Drop| s n)) (- (|Seq#Length| s) n))) (=> (< (|Seq#Length| s) n) (= (|Seq#Length| (|Seq#Drop| s n)) 0)))) (=> (< n 0) (= (|Seq#Length| (|Seq#Drop| s n)) (|Seq#Length| s))))))
 :qid |stdinbpl.304:18|
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
 :qid |stdinbpl.325:18|
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
 :qid |stdinbpl.280:18|
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
 :qid |stdinbpl.291:18|
 :skolemid |36|
 :pattern ( (|Seq#Length| (|Seq#Take| s@@2 n@@2)))
 :pattern ( (|Seq#Take| s@@2 n@@2) (|Seq#Length| s@@2))
)))
(assert (forall ((arg0@@31 Int) (arg1@@13 Int) ) (! (= (type (|Seq#Range| arg0@@31 arg1@@13)) (SeqType intType))
 :qid |funType:Seq#Range|
 :pattern ( (|Seq#Range| arg0@@31 arg1@@13))
)))
(assert (forall ((q@min Int) (q@max Int) (v@@0 T@U) ) (!  (=> (= (type v@@0) intType) (= (|Seq#Contains| (|Seq#Range| q@min q@max) v@@0)  (and (<= q@min (U_2_int v@@0)) (< (U_2_int v@@0) q@max))))
 :qid |stdinbpl.564:15|
 :skolemid |57|
 :pattern ( (|Seq#Contains| (|Seq#Range| q@min q@max) v@@0))
)))
(assert (forall ((s@@3 T@U) (x@@8 T@U) ) (! (let ((T@@7 (type x@@8)))
 (=> (and (= (type s@@3) (SeqType T@@7)) (|Seq#Contains| s@@3 x@@8)) (and (and (<= 0 (|Seq#Skolem| s@@3 x@@8)) (< (|Seq#Skolem| s@@3 x@@8) (|Seq#Length| s@@3))) (= (|Seq#Index| s@@3 (|Seq#Skolem| s@@3 x@@8)) x@@8))))
 :qid |stdinbpl.422:18|
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
 :qid |stdinbpl.406:18|
 :skolemid |45|
 :pattern ( (|Seq#Drop| s@@4 n@@3))
)))
(assert (forall ((i@@0 Int) (j@@0 Int) ) (! (= (|Seq#Sub| i@@0 j@@0) (- i@@0 j@@0))
 :qid |stdinbpl.260:15|
 :skolemid |30|
 :pattern ( (|Seq#Sub| i@@0 j@@0))
)))
(assert (forall ((i@@1 Int) (j@@1 Int) ) (! (= (|Seq#Add| i@@1 j@@1) (+ i@@1 j@@1))
 :qid |stdinbpl.258:15|
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
 :qid |stdinbpl.547:18|
 :skolemid |54|
 :pattern ( (|Seq#Contains| (|Seq#Singleton| x@@9) y@@1))
)))
(assert (forall ((s@@5 T@U) (n@@4 Int) (j@@2 Int) ) (! (let ((T@@11 (SeqTypeInv0 (type s@@5))))
 (=> (= (type s@@5) (SeqType T@@11)) (=> (and (and (<= 0 j@@2) (< j@@2 n@@4)) (< j@@2 (|Seq#Length| s@@5))) (= (|Seq#Index| (|Seq#Take| s@@5 n@@4) j@@2) (|Seq#Index| s@@5 j@@2)))))
 :qid |stdinbpl.299:18|
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
 :qid |stdinbpl.203:19|
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
 :qid |stdinbpl.271:18|
 :skolemid |32|
 :pattern ( (|Seq#Index| (|Seq#Append| s0 s1) n@@5))
)))
(assert  (not (IsPredicateField value)))
(assert  (not (IsWandField value)))
(assert  (not (IsPredicateField array)))
(assert  (not (IsWandField array)))
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
 :qid |stdinbpl.191:15|
 :skolemid |19|
 :pattern ( (ConditionalFrame p@@0 f_6))
)))
(assert (forall ((q@min@@0 Int) (q@max@@0 Int) (j@@3 Int) ) (!  (=> (and (<= 0 j@@3) (< j@@3 (- q@max@@0 q@min@@0))) (= (U_2_int (|Seq#Index| (|Seq#Range| q@min@@0 q@max@@0) j@@3)) (+ q@min@@0 j@@3)))
 :qid |stdinbpl.562:15|
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
 :qid |stdinbpl.240:18|
 :skolemid |26|
 :pattern ( (|Seq#Length| (|Seq#Append| s0@@0 s1@@0)))
)))
(assert (forall ((s@@6 T@U) (t T@U) (n@@6 Int) ) (! (let ((T@@17 (SeqTypeInv0 (type s@@6))))
 (=> (and (and (= (type s@@6) (SeqType T@@17)) (= (type t) (SeqType T@@17))) (and (> n@@6 0) (> n@@6 (|Seq#Length| s@@6)))) (and (= (|Seq#Add| (|Seq#Sub| n@@6 (|Seq#Length| s@@6)) (|Seq#Length| s@@6)) n@@6) (= (|Seq#Drop| (|Seq#Append| s@@6 t) n@@6) (|Seq#Drop| t (|Seq#Sub| n@@6 (|Seq#Length| s@@6)))))))
 :qid |stdinbpl.396:18|
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
 :qid |stdinbpl.383:18|
 :skolemid |42|
 :pattern ( (|Seq#Take| (|Seq#Append| s@@7 t@@0) n@@7))
)))
(assert (forall ((q@min@@1 Int) (q@max@@1 Int) ) (!  (and (=> (< q@min@@1 q@max@@1) (= (|Seq#Length| (|Seq#Range| q@min@@1 q@max@@1)) (- q@max@@1 q@min@@1))) (=> (<= q@max@@1 q@min@@1) (= (|Seq#Length| (|Seq#Range| q@min@@1 q@max@@1)) 0)))
 :qid |stdinbpl.561:15|
 :skolemid |55|
 :pattern ( (|Seq#Length| (|Seq#Range| q@min@@1 q@max@@1)))
)))
(assert (forall ((a T@U) (b T@U) ) (! (let ((T@@19 (SeqTypeInv0 (type a))))
 (=> (and (and (= (type a) (SeqType T@@19)) (= (type b) (SeqType T@@19))) (|Seq#Equal| a b)) (= a b)))
 :qid |stdinbpl.534:18|
 :skolemid |53|
 :pattern ( (|Seq#Equal| a b))
)))
(assert (forall ((s@@8 T@U) (i@@2 Int) ) (! (let ((T@@20 (SeqTypeInv0 (type s@@8))))
 (=> (= (type s@@8) (SeqType T@@20)) (=> (and (<= 0 i@@2) (< i@@2 (|Seq#Length| s@@8))) (|Seq#ContainsTrigger| s@@8 (|Seq#Index| s@@8 i@@2)))))
 :qid |stdinbpl.427:18|
 :skolemid |49|
 :pattern ( (|Seq#Index| s@@8 i@@2))
)))
(assert (forall ((s0@@1 T@U) (s1@@1 T@U) ) (! (let ((T@@21 (SeqTypeInv0 (type s0@@1))))
 (=> (and (= (type s0@@1) (SeqType T@@21)) (= (type s1@@1) (SeqType T@@21))) (and (=> (= s0@@1 (|Seq#Empty| T@@21)) (= (|Seq#Append| s0@@1 s1@@1) s1@@1)) (=> (= s1@@1 (|Seq#Empty| T@@21)) (= (|Seq#Append| s0@@1 s1@@1) s0@@1)))))
 :qid |stdinbpl.246:18|
 :skolemid |27|
 :pattern ( (|Seq#Append| s0@@1 s1@@1))
)))
(assert (forall ((t@@1 T@U) ) (! (= (|Seq#Index| (|Seq#Singleton| t@@1) 0) t@@1)
 :qid |stdinbpl.250:18|
 :skolemid |28|
 :pattern ( (|Seq#Singleton| t@@1))
)))
(assert (forall ((s@@9 T@U) ) (! (let ((T@@22 (SeqTypeInv0 (type s@@9))))
 (=> (= (type s@@9) (SeqType T@@22)) (<= 0 (|Seq#Length| s@@9))))
 :qid |stdinbpl.229:18|
 :skolemid |22|
 :pattern ( (|Seq#Length| s@@9))
)))
(assert (forall ((s0@@2 T@U) (s1@@2 T@U) ) (! (let ((T@@23 (SeqTypeInv0 (type s0@@2))))
 (=> (and (and (= (type s0@@2) (SeqType T@@23)) (= (type s1@@2) (SeqType T@@23))) (|Seq#Equal| s0@@2 s1@@2)) (and (= (|Seq#Length| s0@@2) (|Seq#Length| s1@@2)) (forall ((j@@4 Int) ) (!  (=> (and (<= 0 j@@4) (< j@@4 (|Seq#Length| s0@@2))) (= (|Seq#Index| s0@@2 j@@4) (|Seq#Index| s1@@2 j@@4)))
 :qid |stdinbpl.524:13|
 :skolemid |50|
 :pattern ( (|Seq#Index| s0@@2 j@@4))
 :pattern ( (|Seq#Index| s1@@2 j@@4))
)))))
 :qid |stdinbpl.521:18|
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
 :qid |stdinbpl.237:18|
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
 :qid |stdinbpl.379:18|
 :skolemid |41|
 :pattern ( (|Seq#Take| (|Seq#Append| s@@10 t@@3) n@@8))
)))
(assert (forall ((s@@11 T@U) (i@@3 Int) (v@@1 T@U) ) (! (let ((T@@25 (type v@@1)))
 (=> (= (type s@@11) (SeqType T@@25)) (=> (and (<= 0 i@@3) (< i@@3 (|Seq#Length| s@@11))) (= (|Seq#Length| (|Seq#Update| s@@11 i@@3 v@@1)) (|Seq#Length| s@@11)))))
 :qid |stdinbpl.278:18|
 :skolemid |34|
 :pattern ( (|Seq#Length| (|Seq#Update| s@@11 i@@3 v@@1)))
 :pattern ( (|Seq#Length| s@@11) (|Seq#Update| s@@11 i@@3 v@@1))
)))
(assert (forall ((s@@12 T@U) (t@@4 T@U) (n@@9 Int) ) (! (let ((T@@26 (SeqTypeInv0 (type s@@12))))
 (=> (and (and (= (type s@@12) (SeqType T@@26)) (= (type t@@4) (SeqType T@@26))) (and (< 0 n@@9) (<= n@@9 (|Seq#Length| s@@12)))) (= (|Seq#Drop| (|Seq#Append| s@@12 t@@4) n@@9) (|Seq#Append| (|Seq#Drop| s@@12 n@@9) t@@4))))
 :qid |stdinbpl.392:18|
 :skolemid |43|
 :pattern ( (|Seq#Drop| (|Seq#Append| s@@12 t@@4) n@@9))
)))
(assert (forall ((s@@13 T@U) (n@@10 Int) (i@@4 Int) ) (! (let ((T@@27 (SeqTypeInv0 (type s@@13))))
 (=> (= (type s@@13) (SeqType T@@27)) (=> (and (and (< 0 n@@10) (<= n@@10 i@@4)) (< i@@4 (|Seq#Length| s@@13))) (and (= (|Seq#Add| (|Seq#Sub| i@@4 n@@10) n@@10) i@@4) (= (|Seq#Index| (|Seq#Drop| s@@13 n@@10) (|Seq#Sub| i@@4 n@@10)) (|Seq#Index| s@@13 i@@4))))))
 :qid |stdinbpl.329:18|
 :skolemid |40|
 :pattern ( (|Seq#Drop| s@@13 n@@10) (|Seq#Index| s@@13 i@@4))
)))
(assert (forall ((s0@@3 T@U) (s1@@3 T@U) (n@@11 Int) ) (! (let ((T@@28 (SeqTypeInv0 (type s0@@3))))
 (=> (and (= (type s0@@3) (SeqType T@@28)) (= (type s1@@3) (SeqType T@@28))) (=> (and (and (and (not (= s0@@3 (|Seq#Empty| T@@28))) (not (= s1@@3 (|Seq#Empty| T@@28)))) (<= 0 n@@11)) (< n@@11 (|Seq#Length| s0@@3))) (= (|Seq#Index| (|Seq#Append| s0@@3 s1@@3) n@@11) (|Seq#Index| s0@@3 n@@11)))))
 :qid |stdinbpl.269:18|
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
 :qid |stdinbpl.274:18|
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
 :qid |stdinbpl.425:18|
 :skolemid |48|
 :pattern ( (|Seq#Contains| s@@14 x@@10) (|Seq#Index| s@@14 i@@5))
)))
(assert (forall ((s0@@5 T@U) (s1@@5 T@U) ) (! (let ((T@@31 (SeqTypeInv0 (type s0@@5))))
 (=> (and (= (type s0@@5) (SeqType T@@31)) (= (type s1@@5) (SeqType T@@31))) (or (or (and (= s0@@5 s1@@5) (|Seq#Equal| s0@@5 s1@@5)) (and (and (not (= s0@@5 s1@@5)) (not (|Seq#Equal| s0@@5 s1@@5))) (not (= (|Seq#Length| s0@@5) (|Seq#Length| s1@@5))))) (and (and (and (and (and (and (not (= s0@@5 s1@@5)) (not (|Seq#Equal| s0@@5 s1@@5))) (= (|Seq#Length| s0@@5) (|Seq#Length| s1@@5))) (= (|Seq#SkolemDiff| s0@@5 s1@@5) (|Seq#SkolemDiff| s1@@5 s0@@5))) (<= 0 (|Seq#SkolemDiff| s0@@5 s1@@5))) (< (|Seq#SkolemDiff| s0@@5 s1@@5) (|Seq#Length| s0@@5))) (not (= (|Seq#Index| s0@@5 (|Seq#SkolemDiff| s0@@5 s1@@5)) (|Seq#Index| s1@@5 (|Seq#SkolemDiff| s0@@5 s1@@5))))))))
 :qid |stdinbpl.529:18|
 :skolemid |52|
 :pattern ( (|Seq#Equal| s0@@5 s1@@5))
)))
(assert (forall ((p@@1 T@U) (v_1@@0 T@U) (q T@U) (w@@0 T@U) (r T@U) (u T@U) ) (! (let ((C@@3 (FieldTypeInv0 (type r))))
(let ((B@@10 (FieldTypeInv0 (type q))))
(let ((A@@11 (FieldTypeInv0 (type p@@1))))
 (=> (and (and (and (and (and (and (= (type p@@1) (FieldType A@@11 FrameTypeType)) (= (type v_1@@0) FrameTypeType)) (= (type q) (FieldType B@@10 FrameTypeType))) (= (type w@@0) FrameTypeType)) (= (type r) (FieldType C@@3 FrameTypeType))) (= (type u) FrameTypeType)) (and (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))) (InsidePredicate p@@1 v_1@@0 r u)))))
 :qid |stdinbpl.198:25|
 :skolemid |20|
 :pattern ( (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))
)))
(assert (forall ((s@@15 T@U) ) (! (let ((T@@32 (SeqTypeInv0 (type s@@15))))
 (=> (and (= (type s@@15) (SeqType T@@32)) (= (|Seq#Length| s@@15) 0)) (= s@@15 (|Seq#Empty| T@@32))))
 :qid |stdinbpl.233:18|
 :skolemid |24|
 :pattern ( (|Seq#Length| s@@15))
)))
(assert (forall ((s@@16 T@U) (n@@12 Int) ) (! (let ((T@@33 (SeqTypeInv0 (type s@@16))))
 (=> (and (= (type s@@16) (SeqType T@@33)) (<= n@@12 0)) (= (|Seq#Take| s@@16 n@@12) (|Seq#Empty| T@@33))))
 :qid |stdinbpl.408:18|
 :skolemid |46|
 :pattern ( (|Seq#Take| s@@16 n@@12))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun start () Int)
(declare-fun end () Int)
(declare-fun l () Int)
(declare-fun QPMask@6 () T@U)
(declare-fun a_2 () T@U)
(declare-fun PostHeap@0 () T@U)
(declare-fun kperm () Real)
(declare-fun qpRange2 (T@U) Bool)
(declare-fun invRecv2 (T@U) Int)
(declare-fun PostMask@0 () T@U)
(declare-fun pos () Int)
(declare-fun mx () Int)
(declare-fun i_6 () Int)
(declare-fun i_4 () Int)
(declare-fun j_2 () Int)
(declare-fun wildcard@1 () Real)
(declare-fun middle@0 () Int)
(declare-fun l2 () Int)
(declare-fun QPMask@4 () T@U)
(declare-fun ExhaleHeap@3 () T@U)
(declare-fun i5 () Int)
(declare-fun Mask@4 () T@U)
(declare-fun l1 () Int)
(declare-fun QPMask@3 () T@U)
(declare-fun i3 () Int)
(declare-fun Mask@3 () T@U)
(declare-fun i2 () Int)
(declare-fun Mask@2 () T@U)
(declare-fun ExhaleHeap@2 () T@U)
(declare-fun i1 () Int)
(declare-fun Mask@1 () T@U)
(declare-fun ExhaleHeap@0 () T@U)
(declare-fun l_2 () Int)
(declare-fun Heap@0 () T@U)
(declare-fun mx@2 () Int)
(declare-fun dummyFunction (T@U) Bool)
(declare-fun neverTriggered3 (Int) Bool)
(declare-fun Mask@6 () T@U)
(declare-fun qpRange3 (T@U) Bool)
(declare-fun invRecv3 (T@U) Int)
(declare-fun QPMask@5 () T@U)
(declare-fun pos@1 () Int)
(declare-fun i_8 () Int)
(declare-fun j_4 () Int)
(declare-fun Heap@@9 () T@U)
(declare-fun Mask@5 () T@U)
(declare-fun wildcard@6 () Real)
(declare-fun i6_1 () Int)
(declare-fun i6 () Int)
(declare-fun QPMask@0 () T@U)
(declare-fun mx@1 () Int)
(declare-fun pos@0 () Int)
(declare-fun ml () Int)
(declare-fun posr () Int)
(declare-fun posl () Int)
(declare-fun mr () Int)
(declare-fun qpRange7 (T@U) Bool)
(declare-fun invRecv7 (T@U) Int)
(declare-fun wildcard@5 () Real)
(declare-fun qpRange6 (T@U) Bool)
(declare-fun invRecv6 (T@U) Int)
(declare-fun neverTriggered5 (Int) Bool)
(declare-fun qpRange5 (T@U) Bool)
(declare-fun invRecv5 (T@U) Int)
(declare-fun QPMask@2 () T@U)
(declare-fun wildcard@4 () Real)
(declare-fun neverTriggered4 (Int) Bool)
(declare-fun qpRange4 (T@U) Bool)
(declare-fun invRecv4 (T@U) Int)
(declare-fun QPMask@1 () T@U)
(declare-fun ExhaleHeap@1 () T@U)
(declare-fun wildcard@3 () Real)
(declare-fun wildcard@2 () Real)
(declare-fun mx@0 () Int)
(declare-fun qpRange1 (T@U) Bool)
(declare-fun invRecv1 (T@U) Int)
(declare-fun Mask@0 () T@U)
(declare-fun i_2 () Int)
(declare-fun i@@6 () Int)
(declare-fun j@@5 () Int)
(declare-fun wildcard@0 () Real)
(declare-fun wildcard () Real)
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (= (type Mask@0) (MapType1Type RefType realType)) (= (type a_2) RefType)) (= (type Heap@@9) (MapType0Type RefType))) (= (type Mask@5) (MapType1Type RefType realType))) (= (type Heap@0) (MapType0Type RefType))) (= (type QPMask@0) (MapType1Type RefType realType))) (= (type Mask@6) (MapType1Type RefType realType))) (= (type QPMask@5) (MapType1Type RefType realType))) (= (type Mask@1) (MapType1Type RefType realType))) (= (type ExhaleHeap@0) (MapType0Type RefType))) (= (type Mask@2) (MapType1Type RefType realType))) (= (type ExhaleHeap@2) (MapType0Type RefType))) (= (type Mask@3) (MapType1Type RefType realType))) (= (type ExhaleHeap@3) (MapType0Type RefType))) (= (type QPMask@3) (MapType1Type RefType realType))) (= (type Mask@4) (MapType1Type RefType realType))) (= (type QPMask@4) (MapType1Type RefType realType))) (= (type QPMask@2) (MapType1Type RefType realType))) (= (type QPMask@1) (MapType1Type RefType realType))) (= (type ExhaleHeap@1) (MapType0Type RefType))) (= (type PostMask@0) (MapType1Type RefType realType))) (= (type PostHeap@0) (MapType0Type RefType))) (= (type QPMask@6) (MapType1Type RefType realType))))
(set-info :boogie-vc-id parallel_max)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 184) (let ((anon20_correct true))
(let ((anon79_Else_correct  (=> (and (not (|Seq#Contains| (|Seq#Range| start end) (int_2_U l))) (= (ControlFlow 0 166) 160)) anon20_correct)))
(let ((anon79_Then_correct  (=> (|Seq#Contains| (|Seq#Range| start end) (int_2_U l)) (and (=> (= (ControlFlow 0 161) (- 0 165)) (HasDirectPerm QPMask@6 a_2 array)) (=> (HasDirectPerm QPMask@6 a_2 array) (and (=> (= (ControlFlow 0 161) (- 0 164)) (>= l 0)) (=> (>= l 0) (and (=> (= (ControlFlow 0 161) (- 0 163)) (< l (|Seq#Length| (MapType0Select PostHeap@0 a_2 array)))) (=> (< l (|Seq#Length| (MapType0Select PostHeap@0 a_2 array))) (and (=> (= (ControlFlow 0 161) (- 0 162)) (HasDirectPerm QPMask@6 (|Seq#Index| (MapType0Select PostHeap@0 a_2 array) l) value)) (=> (HasDirectPerm QPMask@6 (|Seq#Index| (MapType0Select PostHeap@0 a_2 array) l) value) (=> (= (ControlFlow 0 161) 160) anon20_correct))))))))))))
(let ((anon78_Else_correct true))
(let ((anon76_Else_correct  (and (=> (= (ControlFlow 0 167) (- 0 173)) (forall ((i_7 Int) (i_7_1 Int) ) (!  (=> (and (and (and (and (not (= i_7 i_7_1)) (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_7))) (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_7_1))) (< NoPerm kperm)) (< NoPerm kperm)) (not (= (|Seq#Index| (MapType0Select PostHeap@0 a_2 array) i_7) (|Seq#Index| (MapType0Select PostHeap@0 a_2 array) i_7_1))))
 :qid |stdinbpl.797:15|
 :skolemid |67|
))) (=> (forall ((i_7@@0 Int) (i_7_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_7@@0 i_7_1@@0)) (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_7@@0))) (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_7_1@@0))) (< NoPerm kperm)) (< NoPerm kperm)) (not (= (|Seq#Index| (MapType0Select PostHeap@0 a_2 array) i_7@@0) (|Seq#Index| (MapType0Select PostHeap@0 a_2 array) i_7_1@@0))))
 :qid |stdinbpl.797:15|
 :skolemid |67|
)) (=> (and (forall ((i_7@@1 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_7@@1)) (< NoPerm kperm)) (and (qpRange2 (|Seq#Index| (MapType0Select PostHeap@0 a_2 array) i_7@@1)) (= (invRecv2 (|Seq#Index| (MapType0Select PostHeap@0 a_2 array) i_7@@1)) i_7@@1)))
 :qid |stdinbpl.803:22|
 :skolemid |68|
 :pattern ( (|Seq#Index| (MapType0Select PostHeap@0 a_2 array) i_7@@1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U i_7@@1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_7@@1)))
 :pattern ( (|Seq#Index| (MapType0Select PostHeap@0 a_2 array) i_7@@1))
)) (forall ((o_3 T@U) ) (!  (=> (= (type o_3) RefType) (=> (and (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U (invRecv2 o_3))) (< NoPerm kperm)) (qpRange2 o_3)) (= (|Seq#Index| (MapType0Select PostHeap@0 a_2 array) (invRecv2 o_3)) o_3)))
 :qid |stdinbpl.807:22|
 :skolemid |69|
 :pattern ( (invRecv2 o_3))
))) (and (=> (= (ControlFlow 0 167) (- 0 172)) (forall ((i_7@@2 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_7@@2)) (>= kperm NoPerm))
 :qid |stdinbpl.813:15|
 :skolemid |70|
 :pattern ( (|Seq#Index| (MapType0Select PostHeap@0 a_2 array) i_7@@2))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U i_7@@2)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_7@@2)))
 :pattern ( (|Seq#Index| (MapType0Select PostHeap@0 a_2 array) i_7@@2))
))) (=> (forall ((i_7@@3 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_7@@3)) (>= kperm NoPerm))
 :qid |stdinbpl.813:15|
 :skolemid |70|
 :pattern ( (|Seq#Index| (MapType0Select PostHeap@0 a_2 array) i_7@@3))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U i_7@@3)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_7@@3)))
 :pattern ( (|Seq#Index| (MapType0Select PostHeap@0 a_2 array) i_7@@3))
)) (=> (and (and (and (forall ((i_7@@4 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_7@@4)) (> kperm NoPerm)) (not (= (|Seq#Index| (MapType0Select PostHeap@0 a_2 array) i_7@@4) null)))
 :qid |stdinbpl.819:22|
 :skolemid |71|
 :pattern ( (|Seq#Index| (MapType0Select PostHeap@0 a_2 array) i_7@@4))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U i_7@@4)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_7@@4)))
 :pattern ( (|Seq#Index| (MapType0Select PostHeap@0 a_2 array) i_7@@4))
)) (forall ((o_3@@0 T@U) ) (!  (=> (= (type o_3@@0) RefType) (and (=> (and (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U (invRecv2 o_3@@0))) (< NoPerm kperm)) (qpRange2 o_3@@0)) (and (=> (< NoPerm kperm) (= (|Seq#Index| (MapType0Select PostHeap@0 a_2 array) (invRecv2 o_3@@0)) o_3@@0)) (= (U_2_real (MapType1Select QPMask@6 o_3@@0 value)) (+ (U_2_real (MapType1Select PostMask@0 o_3@@0 value)) kperm)))) (=> (not (and (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U (invRecv2 o_3@@0))) (< NoPerm kperm)) (qpRange2 o_3@@0))) (= (U_2_real (MapType1Select QPMask@6 o_3@@0 value)) (U_2_real (MapType1Select PostMask@0 o_3@@0 value))))))
 :qid |stdinbpl.825:22|
 :skolemid |72|
 :pattern ( (MapType1Select QPMask@6 o_3@@0 value))
))) (and (forall ((o_3@@1 T@U) (f_5 T@U) ) (! (let ((B@@11 (FieldTypeInv1 (type f_5))))
(let ((A@@12 (FieldTypeInv0 (type f_5))))
 (=> (and (and (= (type o_3@@1) RefType) (= (type f_5) (FieldType A@@12 B@@11))) (not (= f_5 value))) (= (U_2_real (MapType1Select PostMask@0 o_3@@1 f_5)) (U_2_real (MapType1Select QPMask@6 o_3@@1 f_5))))))
 :qid |stdinbpl.829:29|
 :skolemid |73|
 :pattern ( (MapType1Select PostMask@0 o_3@@1 f_5))
 :pattern ( (MapType1Select QPMask@6 o_3@@1 f_5))
)) (state PostHeap@0 QPMask@6))) (and (and (state PostHeap@0 QPMask@6) (<= start pos)) (and (< pos end) (state PostHeap@0 QPMask@6)))) (and (=> (= (ControlFlow 0 167) (- 0 171)) (HasDirectPerm QPMask@6 a_2 array)) (=> (HasDirectPerm QPMask@6 a_2 array) (and (=> (= (ControlFlow 0 167) (- 0 170)) (>= pos 0)) (=> (>= pos 0) (and (=> (= (ControlFlow 0 167) (- 0 169)) (< pos (|Seq#Length| (MapType0Select PostHeap@0 a_2 array)))) (=> (< pos (|Seq#Length| (MapType0Select PostHeap@0 a_2 array))) (and (=> (= (ControlFlow 0 167) (- 0 168)) (HasDirectPerm QPMask@6 (|Seq#Index| (MapType0Select PostHeap@0 a_2 array) pos) value)) (=> (HasDirectPerm QPMask@6 (|Seq#Index| (MapType0Select PostHeap@0 a_2 array) pos) value) (=> (and (= (U_2_int (MapType0Select PostHeap@0 (|Seq#Index| (MapType0Select PostHeap@0 a_2 array) pos) value)) mx) (state PostHeap@0 QPMask@6)) (and (and (=> (= (ControlFlow 0 167) 159) anon78_Else_correct) (=> (= (ControlFlow 0 167) 161) anon79_Then_correct)) (=> (= (ControlFlow 0 167) 166) anon79_Else_correct)))))))))))))))))))
(let ((anon16_correct true))
(let ((anon77_Else_correct  (=> (and (not (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_6))) (= (ControlFlow 0 158) 153)) anon16_correct)))
(let ((anon77_Then_correct  (=> (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_6)) (and (=> (= (ControlFlow 0 154) (- 0 157)) (HasDirectPerm PostMask@0 a_2 array)) (=> (HasDirectPerm PostMask@0 a_2 array) (and (=> (= (ControlFlow 0 154) (- 0 156)) (>= i_6 0)) (=> (>= i_6 0) (and (=> (= (ControlFlow 0 154) (- 0 155)) (< i_6 (|Seq#Length| (MapType0Select PostHeap@0 a_2 array)))) (=> (< i_6 (|Seq#Length| (MapType0Select PostHeap@0 a_2 array))) (=> (= (ControlFlow 0 154) 153) anon16_correct))))))))))
(let ((anon74_Else_correct  (=> (and (forall ((i_5 Int) (j_3 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_5)) (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U j_3)) (not (= i_5 j_3)))) (not (= (|Seq#Index| (MapType0Select PostHeap@0 a_2 array) i_5) (|Seq#Index| (MapType0Select PostHeap@0 a_2 array) j_3))))
 :qid |stdinbpl.777:20|
 :skolemid |66|
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U i_5)) (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U j_3)))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U i_5)) (|Seq#Contains| (|Seq#Range| start end) (int_2_U j_3)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_5)) (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U j_3)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_5)) (|Seq#Contains| (|Seq#Range| start end) (int_2_U j_3)))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U i_5)) (|Seq#Index| (MapType0Select PostHeap@0 a_2 array) j_3))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_5)) (|Seq#Index| (MapType0Select PostHeap@0 a_2 array) j_3))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U j_3)) (|Seq#Index| (MapType0Select PostHeap@0 a_2 array) i_5))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U j_3)) (|Seq#Index| (MapType0Select PostHeap@0 a_2 array) i_5))
 :pattern ( (|Seq#Index| (MapType0Select PostHeap@0 a_2 array) i_5) (|Seq#Index| (MapType0Select PostHeap@0 a_2 array) j_3))
)) (state PostHeap@0 PostMask@0)) (and (and (=> (= (ControlFlow 0 174) 167) anon76_Else_correct) (=> (= (ControlFlow 0 174) 154) anon77_Then_correct)) (=> (= (ControlFlow 0 174) 158) anon77_Else_correct)))))
(let ((anon12_correct true))
(let ((anon75_Else_correct  (=> (and (not (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_4)) (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U j_2)) (not (= i_4 j_2))))) (= (ControlFlow 0 152) 144)) anon12_correct)))
(let ((anon75_Then_correct  (=> (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_4)) (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U j_2)) (not (= i_4 j_2)))) (and (=> (= (ControlFlow 0 145) (- 0 151)) (HasDirectPerm PostMask@0 a_2 array)) (=> (HasDirectPerm PostMask@0 a_2 array) (and (=> (= (ControlFlow 0 145) (- 0 150)) (>= i_4 0)) (=> (>= i_4 0) (and (=> (= (ControlFlow 0 145) (- 0 149)) (< i_4 (|Seq#Length| (MapType0Select PostHeap@0 a_2 array)))) (=> (< i_4 (|Seq#Length| (MapType0Select PostHeap@0 a_2 array))) (and (=> (= (ControlFlow 0 145) (- 0 148)) (HasDirectPerm PostMask@0 a_2 array)) (=> (HasDirectPerm PostMask@0 a_2 array) (and (=> (= (ControlFlow 0 145) (- 0 147)) (>= j_2 0)) (=> (>= j_2 0) (and (=> (= (ControlFlow 0 145) (- 0 146)) (< j_2 (|Seq#Length| (MapType0Select PostHeap@0 a_2 array)))) (=> (< j_2 (|Seq#Length| (MapType0Select PostHeap@0 a_2 array))) (=> (= (ControlFlow 0 145) 144) anon12_correct))))))))))))))))
(let ((anon73_Then_correct  (=> (and (state PostHeap@0 ZeroMask) (> wildcard@1 NoPerm)) (=> (and (and (not (= a_2 null)) (= PostMask@0 (MapType1Store ZeroMask a_2 array (real_2_U (+ (U_2_real (MapType1Select ZeroMask a_2 array)) wildcard@1))))) (and (state PostHeap@0 PostMask@0) (state PostHeap@0 PostMask@0))) (and (=> (= (ControlFlow 0 175) (- 0 176)) (HasDirectPerm PostMask@0 a_2 array)) (=> (HasDirectPerm PostMask@0 a_2 array) (=> (and (< end (|Seq#Length| (MapType0Select PostHeap@0 a_2 array))) (state PostHeap@0 PostMask@0)) (and (and (=> (= (ControlFlow 0 175) 174) anon74_Else_correct) (=> (= (ControlFlow 0 175) 145) anon75_Then_correct)) (=> (= (ControlFlow 0 175) 152) anon75_Else_correct)))))))))
(let ((anon46_correct true))
(let ((anon92_Else_correct  (=> (and (not (|Seq#Contains| (|Seq#Range| middle@0 end) (int_2_U l2))) (= (ControlFlow 0 93) 87)) anon46_correct)))
(let ((anon92_Then_correct  (=> (|Seq#Contains| (|Seq#Range| middle@0 end) (int_2_U l2)) (and (=> (= (ControlFlow 0 88) (- 0 92)) (HasDirectPerm QPMask@4 a_2 array)) (=> (HasDirectPerm QPMask@4 a_2 array) (and (=> (= (ControlFlow 0 88) (- 0 91)) (>= l2 0)) (=> (>= l2 0) (and (=> (= (ControlFlow 0 88) (- 0 90)) (< l2 (|Seq#Length| (MapType0Select ExhaleHeap@3 a_2 array)))) (=> (< l2 (|Seq#Length| (MapType0Select ExhaleHeap@3 a_2 array))) (and (=> (= (ControlFlow 0 88) (- 0 89)) (HasDirectPerm QPMask@4 (|Seq#Index| (MapType0Select ExhaleHeap@3 a_2 array) l2) value)) (=> (HasDirectPerm QPMask@4 (|Seq#Index| (MapType0Select ExhaleHeap@3 a_2 array) l2) value) (=> (= (ControlFlow 0 88) 87) anon46_correct))))))))))))
(let ((anon42_correct true))
(let ((anon90_Else_correct  (=> (and (not (|Seq#Contains| (|Seq#Range| middle@0 end) (int_2_U i5))) (= (ControlFlow 0 86) 81)) anon42_correct)))
(let ((anon90_Then_correct  (=> (|Seq#Contains| (|Seq#Range| middle@0 end) (int_2_U i5)) (and (=> (= (ControlFlow 0 82) (- 0 85)) (HasDirectPerm Mask@4 a_2 array)) (=> (HasDirectPerm Mask@4 a_2 array) (and (=> (= (ControlFlow 0 82) (- 0 84)) (>= i5 0)) (=> (>= i5 0) (and (=> (= (ControlFlow 0 82) (- 0 83)) (< i5 (|Seq#Length| (MapType0Select ExhaleHeap@3 a_2 array)))) (=> (< i5 (|Seq#Length| (MapType0Select ExhaleHeap@3 a_2 array))) (=> (= (ControlFlow 0 82) 81) anon42_correct))))))))))
(let ((anon38_correct true))
(let ((anon88_Else_correct  (=> (and (not (|Seq#Contains| (|Seq#Range| start middle@0) (int_2_U l1))) (= (ControlFlow 0 80) 74)) anon38_correct)))
(let ((anon88_Then_correct  (=> (|Seq#Contains| (|Seq#Range| start middle@0) (int_2_U l1)) (and (=> (= (ControlFlow 0 75) (- 0 79)) (HasDirectPerm QPMask@3 a_2 array)) (=> (HasDirectPerm QPMask@3 a_2 array) (and (=> (= (ControlFlow 0 75) (- 0 78)) (>= l1 0)) (=> (>= l1 0) (and (=> (= (ControlFlow 0 75) (- 0 77)) (< l1 (|Seq#Length| (MapType0Select ExhaleHeap@3 a_2 array)))) (=> (< l1 (|Seq#Length| (MapType0Select ExhaleHeap@3 a_2 array))) (and (=> (= (ControlFlow 0 75) (- 0 76)) (HasDirectPerm QPMask@3 (|Seq#Index| (MapType0Select ExhaleHeap@3 a_2 array) l1) value)) (=> (HasDirectPerm QPMask@3 (|Seq#Index| (MapType0Select ExhaleHeap@3 a_2 array) l1) value) (=> (= (ControlFlow 0 75) 74) anon38_correct))))))))))))
(let ((anon34_correct true))
(let ((anon86_Else_correct  (=> (and (not (|Seq#Contains| (|Seq#Range| start middle@0) (int_2_U i3))) (= (ControlFlow 0 73) 68)) anon34_correct)))
(let ((anon86_Then_correct  (=> (|Seq#Contains| (|Seq#Range| start middle@0) (int_2_U i3)) (and (=> (= (ControlFlow 0 69) (- 0 72)) (HasDirectPerm Mask@3 a_2 array)) (=> (HasDirectPerm Mask@3 a_2 array) (and (=> (= (ControlFlow 0 69) (- 0 71)) (>= i3 0)) (=> (>= i3 0) (and (=> (= (ControlFlow 0 69) (- 0 70)) (< i3 (|Seq#Length| (MapType0Select ExhaleHeap@3 a_2 array)))) (=> (< i3 (|Seq#Length| (MapType0Select ExhaleHeap@3 a_2 array))) (=> (= (ControlFlow 0 69) 68) anon34_correct))))))))))
(let ((anon30_correct true))
(let ((anon84_Else_correct  (=> (and (not (|Seq#Contains| (|Seq#Range| middle@0 end) (int_2_U i2))) (= (ControlFlow 0 67) 62)) anon30_correct)))
(let ((anon84_Then_correct  (=> (|Seq#Contains| (|Seq#Range| middle@0 end) (int_2_U i2)) (and (=> (= (ControlFlow 0 63) (- 0 66)) (HasDirectPerm Mask@2 a_2 array)) (=> (HasDirectPerm Mask@2 a_2 array) (and (=> (= (ControlFlow 0 63) (- 0 65)) (>= i2 0)) (=> (>= i2 0) (and (=> (= (ControlFlow 0 63) (- 0 64)) (< i2 (|Seq#Length| (MapType0Select ExhaleHeap@2 a_2 array)))) (=> (< i2 (|Seq#Length| (MapType0Select ExhaleHeap@2 a_2 array))) (=> (= (ControlFlow 0 63) 62) anon30_correct))))))))))
(let ((anon26_correct true))
(let ((anon82_Else_correct  (=> (and (not (|Seq#Contains| (|Seq#Range| start middle@0) (int_2_U i1))) (= (ControlFlow 0 61) 56)) anon26_correct)))
(let ((anon82_Then_correct  (=> (|Seq#Contains| (|Seq#Range| start middle@0) (int_2_U i1)) (and (=> (= (ControlFlow 0 57) (- 0 60)) (HasDirectPerm Mask@1 a_2 array)) (=> (HasDirectPerm Mask@1 a_2 array) (and (=> (= (ControlFlow 0 57) (- 0 59)) (>= i1 0)) (=> (>= i1 0) (and (=> (= (ControlFlow 0 57) (- 0 58)) (< i1 (|Seq#Length| (MapType0Select ExhaleHeap@0 a_2 array)))) (=> (< i1 (|Seq#Length| (MapType0Select ExhaleHeap@0 a_2 array))) (=> (= (ControlFlow 0 57) 56) anon26_correct))))))))))
(let ((anon67_correct true))
(let ((anon101_Else_correct  (=> (and (not (|Seq#Contains| (|Seq#Range| start end) (int_2_U l_2))) (= (ControlFlow 0 39) 36)) anon67_correct)))
(let ((anon101_Then_correct  (=> (|Seq#Contains| (|Seq#Range| start end) (int_2_U l_2)) (and (=> (= (ControlFlow 0 37) (- 0 38)) (<= (U_2_int (MapType0Select Heap@0 (|Seq#Index| (MapType0Select Heap@0 a_2 array) l_2) value)) mx@2)) (=> (<= (U_2_int (MapType0Select Heap@0 (|Seq#Index| (MapType0Select Heap@0 a_2 array) l_2) value)) mx@2) (=> (= (ControlFlow 0 37) 36) anon67_correct))))))
(let ((anon100_Else_correct true))
(let ((anon98_Else_correct  (=> (forall ((i_9_1 Int) (j_5_1 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_9_1)) (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U j_5_1)) (not (= i_9_1 j_5_1)))) (not (= (|Seq#Index| (MapType0Select Heap@0 a_2 array) i_9_1) (|Seq#Index| (MapType0Select Heap@0 a_2 array) j_5_1))))
 :qid |stdinbpl.1482:20|
 :skolemid |106|
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U i_9_1)) (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U j_5_1)))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U i_9_1)) (|Seq#Contains| (|Seq#Range| start end) (int_2_U j_5_1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_9_1)) (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U j_5_1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_9_1)) (|Seq#Contains| (|Seq#Range| start end) (int_2_U j_5_1)))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U i_9_1)) (|Seq#Index| (MapType0Select Heap@0 a_2 array) j_5_1))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_9_1)) (|Seq#Index| (MapType0Select Heap@0 a_2 array) j_5_1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U j_5_1)) (|Seq#Index| (MapType0Select Heap@0 a_2 array) i_9_1))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U j_5_1)) (|Seq#Index| (MapType0Select Heap@0 a_2 array) i_9_1))
 :pattern ( (|Seq#Index| (MapType0Select Heap@0 a_2 array) i_9_1) (|Seq#Index| (MapType0Select Heap@0 a_2 array) j_5_1))
)) (and (=> (= (ControlFlow 0 40) (- 0 46)) (forall ((i_10 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_10)) (dummyFunction (MapType0Select Heap@0 (|Seq#Index| (MapType0Select Heap@0 a_2 array) i_10) value))) (>= kperm NoPerm))
 :qid |stdinbpl.1490:17|
 :skolemid |107|
 :pattern ( (|Seq#Index| (MapType0Select Heap@0 a_2 array) i_10))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U i_10)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_10)))
 :pattern ( (|Seq#Index| (MapType0Select Heap@0 a_2 array) i_10))
))) (=> (forall ((i_10@@0 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_10@@0)) (dummyFunction (MapType0Select Heap@0 (|Seq#Index| (MapType0Select Heap@0 a_2 array) i_10@@0) value))) (>= kperm NoPerm))
 :qid |stdinbpl.1490:17|
 :skolemid |107|
 :pattern ( (|Seq#Index| (MapType0Select Heap@0 a_2 array) i_10@@0))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U i_10@@0)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_10@@0)))
 :pattern ( (|Seq#Index| (MapType0Select Heap@0 a_2 array) i_10@@0))
)) (and (=> (= (ControlFlow 0 40) (- 0 45)) (forall ((i_10@@1 Int) (i_10_1 Int) ) (!  (=> (and (and (and (and (not (= i_10@@1 i_10_1)) (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_10@@1))) (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_10_1))) (< NoPerm kperm)) (< NoPerm kperm)) (not (= (|Seq#Index| (MapType0Select Heap@0 a_2 array) i_10@@1) (|Seq#Index| (MapType0Select Heap@0 a_2 array) i_10_1))))
 :qid |stdinbpl.1497:17|
 :skolemid |108|
 :pattern ( (neverTriggered3 i_10@@1) (neverTriggered3 i_10_1))
))) (=> (forall ((i_10@@2 Int) (i_10_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_10@@2 i_10_1@@0)) (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_10@@2))) (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_10_1@@0))) (< NoPerm kperm)) (< NoPerm kperm)) (not (= (|Seq#Index| (MapType0Select Heap@0 a_2 array) i_10@@2) (|Seq#Index| (MapType0Select Heap@0 a_2 array) i_10_1@@0))))
 :qid |stdinbpl.1497:17|
 :skolemid |108|
 :pattern ( (neverTriggered3 i_10@@2) (neverTriggered3 i_10_1@@0))
)) (and (=> (= (ControlFlow 0 40) (- 0 44)) (forall ((i_10@@3 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_10@@3)) (>= (U_2_real (MapType1Select Mask@6 (|Seq#Index| (MapType0Select Heap@0 a_2 array) i_10@@3) value)) kperm))
 :qid |stdinbpl.1504:17|
 :skolemid |109|
 :pattern ( (|Seq#Index| (MapType0Select Heap@0 a_2 array) i_10@@3))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U i_10@@3)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_10@@3)))
 :pattern ( (|Seq#Index| (MapType0Select Heap@0 a_2 array) i_10@@3))
))) (=> (forall ((i_10@@4 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_10@@4)) (>= (U_2_real (MapType1Select Mask@6 (|Seq#Index| (MapType0Select Heap@0 a_2 array) i_10@@4) value)) kperm))
 :qid |stdinbpl.1504:17|
 :skolemid |109|
 :pattern ( (|Seq#Index| (MapType0Select Heap@0 a_2 array) i_10@@4))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U i_10@@4)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_10@@4)))
 :pattern ( (|Seq#Index| (MapType0Select Heap@0 a_2 array) i_10@@4))
)) (=> (and (and (forall ((i_10@@5 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_10@@5)) (< NoPerm kperm)) (and (qpRange3 (|Seq#Index| (MapType0Select Heap@0 a_2 array) i_10@@5)) (= (invRecv3 (|Seq#Index| (MapType0Select Heap@0 a_2 array) i_10@@5)) i_10@@5)))
 :qid |stdinbpl.1510:22|
 :skolemid |110|
 :pattern ( (|Seq#Index| (MapType0Select Heap@0 a_2 array) i_10@@5))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U i_10@@5)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_10@@5)))
 :pattern ( (|Seq#Index| (MapType0Select Heap@0 a_2 array) i_10@@5))
)) (forall ((o_3@@2 T@U) ) (!  (=> (= (type o_3@@2) RefType) (=> (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U (invRecv3 o_3@@2))) (and (< NoPerm kperm) (qpRange3 o_3@@2))) (= (|Seq#Index| (MapType0Select Heap@0 a_2 array) (invRecv3 o_3@@2)) o_3@@2)))
 :qid |stdinbpl.1514:22|
 :skolemid |111|
 :pattern ( (invRecv3 o_3@@2))
))) (and (forall ((o_3@@3 T@U) ) (!  (=> (= (type o_3@@3) RefType) (and (=> (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U (invRecv3 o_3@@3))) (and (< NoPerm kperm) (qpRange3 o_3@@3))) (and (= (|Seq#Index| (MapType0Select Heap@0 a_2 array) (invRecv3 o_3@@3)) o_3@@3) (= (U_2_real (MapType1Select QPMask@5 o_3@@3 value)) (- (U_2_real (MapType1Select Mask@6 o_3@@3 value)) kperm)))) (=> (not (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U (invRecv3 o_3@@3))) (and (< NoPerm kperm) (qpRange3 o_3@@3)))) (= (U_2_real (MapType1Select QPMask@5 o_3@@3 value)) (U_2_real (MapType1Select Mask@6 o_3@@3 value))))))
 :qid |stdinbpl.1520:22|
 :skolemid |112|
 :pattern ( (MapType1Select QPMask@5 o_3@@3 value))
)) (forall ((o_3@@4 T@U) (f_5@@0 T@U) ) (! (let ((B@@12 (FieldTypeInv1 (type f_5@@0))))
(let ((A@@13 (FieldTypeInv0 (type f_5@@0))))
 (=> (and (and (= (type o_3@@4) RefType) (= (type f_5@@0) (FieldType A@@13 B@@12))) (not (= f_5@@0 value))) (= (U_2_real (MapType1Select Mask@6 o_3@@4 f_5@@0)) (U_2_real (MapType1Select QPMask@5 o_3@@4 f_5@@0))))))
 :qid |stdinbpl.1526:29|
 :skolemid |113|
 :pattern ( (MapType1Select QPMask@5 o_3@@4 f_5@@0))
)))) (and (=> (= (ControlFlow 0 40) (- 0 43)) (<= start pos@1)) (=> (<= start pos@1) (and (=> (= (ControlFlow 0 40) (- 0 42)) (< pos@1 end)) (=> (< pos@1 end) (and (=> (= (ControlFlow 0 40) (- 0 41)) (= (U_2_int (MapType0Select Heap@0 (|Seq#Index| (MapType0Select Heap@0 a_2 array) pos@1) value)) mx@2)) (=> (= (U_2_int (MapType0Select Heap@0 (|Seq#Index| (MapType0Select Heap@0 a_2 array) pos@1) value)) mx@2) (and (and (=> (= (ControlFlow 0 40) 35) anon100_Else_correct) (=> (= (ControlFlow 0 40) 37) anon101_Then_correct)) (=> (= (ControlFlow 0 40) 39) anon101_Else_correct))))))))))))))))))
(let ((anon63_correct true))
(let ((anon99_Else_correct  (=> (and (not (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_8)) (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U j_4)) (not (= i_8 j_4))))) (= (ControlFlow 0 34) 31)) anon63_correct)))
(let ((anon99_Then_correct  (=> (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_8)) (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U j_4)) (not (= i_8 j_4)))) (and (=> (= (ControlFlow 0 32) (- 0 33)) (not (= (|Seq#Index| (MapType0Select Heap@0 a_2 array) i_8) (|Seq#Index| (MapType0Select Heap@0 a_2 array) j_4)))) (=> (not (= (|Seq#Index| (MapType0Select Heap@0 a_2 array) i_8) (|Seq#Index| (MapType0Select Heap@0 a_2 array) j_4))) (=> (= (ControlFlow 0 32) 31) anon63_correct))))))
(let ((anon96_Else_correct  (=> (and (forall ((i6_2_1 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| start end) (int_2_U i6_2_1)) (= (U_2_int (MapType0Select Heap@0 (|Seq#Index| (MapType0Select Heap@0 a_2 array) i6_2_1) value)) (U_2_int (MapType0Select Heap@@9 (|Seq#Index| (MapType0Select Heap@@9 a_2 array) i6_2_1) value))))
 :qid |stdinbpl.1459:20|
 :skolemid |105|
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U i6_2_1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U i6_2_1)))
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 a_2 array) i6_2_1))
)) (state Heap@0 Mask@5)) (and (=> (= (ControlFlow 0 47) (- 0 49)) (> (U_2_real (MapType1Select Mask@5 a_2 array)) NoPerm)) (=> (> (U_2_real (MapType1Select Mask@5 a_2 array)) NoPerm) (=> (> wildcard@6 NoPerm) (=> (and (< wildcard@6 (U_2_real (MapType1Select Mask@5 a_2 array))) (= Mask@6 (MapType1Store Mask@5 a_2 array (real_2_U (- (U_2_real (MapType1Select Mask@5 a_2 array)) wildcard@6))))) (and (=> (= (ControlFlow 0 47) (- 0 48)) (< end (|Seq#Length| (MapType0Select Heap@0 a_2 array)))) (=> (< end (|Seq#Length| (MapType0Select Heap@0 a_2 array))) (and (and (=> (= (ControlFlow 0 47) 40) anon98_Else_correct) (=> (= (ControlFlow 0 47) 32) anon99_Then_correct)) (=> (= (ControlFlow 0 47) 34) anon99_Else_correct)))))))))))
(let ((anon59_correct true))
(let ((anon97_Else_correct  (=> (and (not (|Seq#Contains| (|Seq#Range| start end) (int_2_U i6_1))) (= (ControlFlow 0 30) 27)) anon59_correct)))
(let ((anon97_Then_correct  (=> (|Seq#Contains| (|Seq#Range| start end) (int_2_U i6_1)) (and (=> (= (ControlFlow 0 28) (- 0 29)) (= (U_2_int (MapType0Select Heap@0 (|Seq#Index| (MapType0Select Heap@0 a_2 array) i6_1) value)) (U_2_int (MapType0Select Heap@@9 (|Seq#Index| (MapType0Select Heap@@9 a_2 array) i6_1) value)))) (=> (= (U_2_int (MapType0Select Heap@0 (|Seq#Index| (MapType0Select Heap@0 a_2 array) i6_1) value)) (U_2_int (MapType0Select Heap@@9 (|Seq#Index| (MapType0Select Heap@@9 a_2 array) i6_1) value))) (=> (= (ControlFlow 0 28) 27) anon59_correct))))))
(let ((anon55_correct true))
(let ((anon95_Else_correct  (=> (and (not (|Seq#Contains| (|Seq#Range| start end) (int_2_U i6))) (= (ControlFlow 0 26) 16)) anon55_correct)))
(let ((anon95_Then_correct  (=> (|Seq#Contains| (|Seq#Range| start end) (int_2_U i6)) (and (=> (= (ControlFlow 0 17) (- 0 25)) (HasDirectPerm Mask@5 a_2 array)) (=> (HasDirectPerm Mask@5 a_2 array) (and (=> (= (ControlFlow 0 17) (- 0 24)) (>= i6 0)) (=> (>= i6 0) (and (=> (= (ControlFlow 0 17) (- 0 23)) (< i6 (|Seq#Length| (MapType0Select Heap@0 a_2 array)))) (=> (< i6 (|Seq#Length| (MapType0Select Heap@0 a_2 array))) (and (=> (= (ControlFlow 0 17) (- 0 22)) (HasDirectPerm Mask@5 (|Seq#Index| (MapType0Select Heap@0 a_2 array) i6) value)) (=> (HasDirectPerm Mask@5 (|Seq#Index| (MapType0Select Heap@0 a_2 array) i6) value) (and (=> (= (ControlFlow 0 17) (- 0 21)) (HasDirectPerm QPMask@0 a_2 array)) (=> (HasDirectPerm QPMask@0 a_2 array) (and (=> (= (ControlFlow 0 17) (- 0 20)) (>= i6 0)) (=> (>= i6 0) (and (=> (= (ControlFlow 0 17) (- 0 19)) (< i6 (|Seq#Length| (MapType0Select Heap@@9 a_2 array)))) (=> (< i6 (|Seq#Length| (MapType0Select Heap@@9 a_2 array))) (and (=> (= (ControlFlow 0 17) (- 0 18)) (HasDirectPerm QPMask@0 (|Seq#Index| (MapType0Select Heap@@9 a_2 array) i6) value)) (=> (HasDirectPerm QPMask@0 (|Seq#Index| (MapType0Select Heap@@9 a_2 array) i6) value) (=> (= (ControlFlow 0 17) 16) anon55_correct))))))))))))))))))))
(let ((anon52_correct  (=> (state Heap@0 Mask@5) (and (and (and (and (=> (= (ControlFlow 0 50) 47) anon96_Else_correct) (=> (= (ControlFlow 0 50) 28) anon97_Then_correct)) (=> (= (ControlFlow 0 50) 30) anon97_Else_correct)) (=> (= (ControlFlow 0 50) 17) anon95_Then_correct)) (=> (= (ControlFlow 0 50) 26) anon95_Else_correct)))))
(let ((anon50_correct  (=> (and (state ExhaleHeap@3 QPMask@4) (= Mask@5 QPMask@4)) (=> (and (and (= Heap@0 ExhaleHeap@3) (= mx@2 mx@1)) (and (= pos@1 pos@0) (= (ControlFlow 0 94) 50))) anon52_correct))))
(let ((anon93_Else_correct  (=> (and (and (not (= mx@1 ml)) (state ExhaleHeap@3 QPMask@4)) (and (= pos@0 posr) (= (ControlFlow 0 96) 94))) anon50_correct)))
(let ((anon93_Then_correct  (=> (and (and (= mx@1 ml) (state ExhaleHeap@3 QPMask@4)) (and (= pos@0 posl) (= (ControlFlow 0 95) 94))) anon50_correct)))
(let ((anon91_Else_correct  (=> (forall ((l2_1 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| middle@0 end) (int_2_U l2_1)) (<= (U_2_int (MapType0Select ExhaleHeap@3 (|Seq#Index| (MapType0Select ExhaleHeap@3 a_2 array) l2_1) value)) mr))
 :qid |stdinbpl.1377:24|
 :skolemid |104|
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| middle@0 end) (int_2_U l2_1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| middle@0 end) (int_2_U l2_1)))
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@3 a_2 array) l2_1))
)) (=> (and (and (state ExhaleHeap@3 QPMask@4) (state ExhaleHeap@3 QPMask@4)) (and (= mx@1 (ite (> ml mr) ml mr)) (state ExhaleHeap@3 QPMask@4))) (and (=> (= (ControlFlow 0 97) 95) anon93_Then_correct) (=> (= (ControlFlow 0 97) 96) anon93_Else_correct))))))
(let ((anon89_Else_correct  (and (=> (= (ControlFlow 0 98) (- 0 104)) (forall ((i5_1 Int) (i5_1_1 Int) ) (!  (=> (and (and (and (and (not (= i5_1 i5_1_1)) (|Seq#Contains| (|Seq#Range| middle@0 end) (int_2_U i5_1))) (|Seq#Contains| (|Seq#Range| middle@0 end) (int_2_U i5_1_1))) (< NoPerm (* (/ (to_real 1) (to_real 2)) kperm))) (< NoPerm (* (/ (to_real 1) (to_real 2)) kperm))) (not (= (|Seq#Index| (MapType0Select ExhaleHeap@3 a_2 array) i5_1) (|Seq#Index| (MapType0Select ExhaleHeap@3 a_2 array) i5_1_1))))
 :qid |stdinbpl.1296:19|
 :skolemid |97|
))) (=> (forall ((i5_1@@0 Int) (i5_1_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i5_1@@0 i5_1_1@@0)) (|Seq#Contains| (|Seq#Range| middle@0 end) (int_2_U i5_1@@0))) (|Seq#Contains| (|Seq#Range| middle@0 end) (int_2_U i5_1_1@@0))) (< NoPerm (* (/ (to_real 1) (to_real 2)) kperm))) (< NoPerm (* (/ (to_real 1) (to_real 2)) kperm))) (not (= (|Seq#Index| (MapType0Select ExhaleHeap@3 a_2 array) i5_1@@0) (|Seq#Index| (MapType0Select ExhaleHeap@3 a_2 array) i5_1_1@@0))))
 :qid |stdinbpl.1296:19|
 :skolemid |97|
)) (=> (and (forall ((i5_1@@1 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| middle@0 end) (int_2_U i5_1@@1)) (< NoPerm (* (/ (to_real 1) (to_real 2)) kperm))) (and (qpRange7 (|Seq#Index| (MapType0Select ExhaleHeap@3 a_2 array) i5_1@@1)) (= (invRecv7 (|Seq#Index| (MapType0Select ExhaleHeap@3 a_2 array) i5_1@@1)) i5_1@@1)))
 :qid |stdinbpl.1302:26|
 :skolemid |98|
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@3 a_2 array) i5_1@@1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| middle@0 end) (int_2_U i5_1@@1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| middle@0 end) (int_2_U i5_1@@1)))
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@3 a_2 array) i5_1@@1))
)) (forall ((o_3@@5 T@U) ) (!  (=> (= (type o_3@@5) RefType) (=> (and (and (|Seq#Contains| (|Seq#Range| middle@0 end) (int_2_U (invRecv7 o_3@@5))) (< NoPerm (* (/ (to_real 1) (to_real 2)) kperm))) (qpRange7 o_3@@5)) (= (|Seq#Index| (MapType0Select ExhaleHeap@3 a_2 array) (invRecv7 o_3@@5)) o_3@@5)))
 :qid |stdinbpl.1306:26|
 :skolemid |99|
 :pattern ( (invRecv7 o_3@@5))
))) (and (=> (= (ControlFlow 0 98) (- 0 103)) (forall ((i5_1@@2 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| middle@0 end) (int_2_U i5_1@@2)) (>= (* (/ (to_real 1) (to_real 2)) kperm) NoPerm))
 :qid |stdinbpl.1312:19|
 :skolemid |100|
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@3 a_2 array) i5_1@@2))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| middle@0 end) (int_2_U i5_1@@2)))
 :pattern ( (|Seq#Contains| (|Seq#Range| middle@0 end) (int_2_U i5_1@@2)))
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@3 a_2 array) i5_1@@2))
))) (=> (forall ((i5_1@@3 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| middle@0 end) (int_2_U i5_1@@3)) (>= (* (/ (to_real 1) (to_real 2)) kperm) NoPerm))
 :qid |stdinbpl.1312:19|
 :skolemid |100|
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@3 a_2 array) i5_1@@3))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| middle@0 end) (int_2_U i5_1@@3)))
 :pattern ( (|Seq#Contains| (|Seq#Range| middle@0 end) (int_2_U i5_1@@3)))
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@3 a_2 array) i5_1@@3))
)) (=> (and (forall ((i5_1@@4 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| middle@0 end) (int_2_U i5_1@@4)) (> (* (/ (to_real 1) (to_real 2)) kperm) NoPerm)) (not (= (|Seq#Index| (MapType0Select ExhaleHeap@3 a_2 array) i5_1@@4) null)))
 :qid |stdinbpl.1318:26|
 :skolemid |101|
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@3 a_2 array) i5_1@@4))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| middle@0 end) (int_2_U i5_1@@4)))
 :pattern ( (|Seq#Contains| (|Seq#Range| middle@0 end) (int_2_U i5_1@@4)))
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@3 a_2 array) i5_1@@4))
)) (forall ((o_3@@6 T@U) ) (!  (=> (= (type o_3@@6) RefType) (and (=> (and (and (|Seq#Contains| (|Seq#Range| middle@0 end) (int_2_U (invRecv7 o_3@@6))) (< NoPerm (* (/ (to_real 1) (to_real 2)) kperm))) (qpRange7 o_3@@6)) (and (=> (< NoPerm (* (/ (to_real 1) (to_real 2)) kperm)) (= (|Seq#Index| (MapType0Select ExhaleHeap@3 a_2 array) (invRecv7 o_3@@6)) o_3@@6)) (= (U_2_real (MapType1Select QPMask@4 o_3@@6 value)) (+ (U_2_real (MapType1Select Mask@4 o_3@@6 value)) (* (/ (to_real 1) (to_real 2)) kperm))))) (=> (not (and (and (|Seq#Contains| (|Seq#Range| middle@0 end) (int_2_U (invRecv7 o_3@@6))) (< NoPerm (* (/ (to_real 1) (to_real 2)) kperm))) (qpRange7 o_3@@6))) (= (U_2_real (MapType1Select QPMask@4 o_3@@6 value)) (U_2_real (MapType1Select Mask@4 o_3@@6 value))))))
 :qid |stdinbpl.1324:26|
 :skolemid |102|
 :pattern ( (MapType1Select QPMask@4 o_3@@6 value))
))) (=> (and (and (and (forall ((o_3@@7 T@U) (f_5@@1 T@U) ) (! (let ((B@@13 (FieldTypeInv1 (type f_5@@1))))
(let ((A@@14 (FieldTypeInv0 (type f_5@@1))))
 (=> (and (and (= (type o_3@@7) RefType) (= (type f_5@@1) (FieldType A@@14 B@@13))) (not (= f_5@@1 value))) (= (U_2_real (MapType1Select Mask@4 o_3@@7 f_5@@1)) (U_2_real (MapType1Select QPMask@4 o_3@@7 f_5@@1))))))
 :qid |stdinbpl.1328:33|
 :skolemid |103|
 :pattern ( (MapType1Select Mask@4 o_3@@7 f_5@@1))
 :pattern ( (MapType1Select QPMask@4 o_3@@7 f_5@@1))
)) (state ExhaleHeap@3 QPMask@4)) (and (state ExhaleHeap@3 QPMask@4) (state ExhaleHeap@3 QPMask@4))) (and (and (<= middle@0 posr) (< posr end)) (and (state ExhaleHeap@3 QPMask@4) (state ExhaleHeap@3 QPMask@4)))) (and (=> (= (ControlFlow 0 98) (- 0 102)) (HasDirectPerm QPMask@4 a_2 array)) (=> (HasDirectPerm QPMask@4 a_2 array) (and (=> (= (ControlFlow 0 98) (- 0 101)) (>= posr 0)) (=> (>= posr 0) (and (=> (= (ControlFlow 0 98) (- 0 100)) (< posr (|Seq#Length| (MapType0Select ExhaleHeap@3 a_2 array)))) (=> (< posr (|Seq#Length| (MapType0Select ExhaleHeap@3 a_2 array))) (and (=> (= (ControlFlow 0 98) (- 0 99)) (HasDirectPerm QPMask@4 (|Seq#Index| (MapType0Select ExhaleHeap@3 a_2 array) posr) value)) (=> (HasDirectPerm QPMask@4 (|Seq#Index| (MapType0Select ExhaleHeap@3 a_2 array) posr) value) (=> (= (U_2_int (MapType0Select ExhaleHeap@3 (|Seq#Index| (MapType0Select ExhaleHeap@3 a_2 array) posr) value)) mr) (=> (and (state ExhaleHeap@3 QPMask@4) (state ExhaleHeap@3 QPMask@4)) (and (and (=> (= (ControlFlow 0 98) 97) anon91_Else_correct) (=> (= (ControlFlow 0 98) 88) anon92_Then_correct)) (=> (= (ControlFlow 0 98) 93) anon92_Else_correct)))))))))))))))))))))
(let ((anon87_Else_correct  (=> (forall ((l1_1 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| start middle@0) (int_2_U l1_1)) (<= (U_2_int (MapType0Select ExhaleHeap@3 (|Seq#Index| (MapType0Select ExhaleHeap@3 a_2 array) l1_1) value)) ml))
 :qid |stdinbpl.1252:24|
 :skolemid |96|
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start middle@0) (int_2_U l1_1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start middle@0) (int_2_U l1_1)))
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@3 a_2 array) l1_1))
)) (=> (and (and (and (state ExhaleHeap@3 QPMask@3) (state ExhaleHeap@3 QPMask@3)) (and (> wildcard@5 NoPerm) (not (= a_2 null)))) (and (and (= Mask@4 (MapType1Store QPMask@3 a_2 array (real_2_U (+ (U_2_real (MapType1Select QPMask@3 a_2 array)) wildcard@5)))) (state ExhaleHeap@3 Mask@4)) (and (state ExhaleHeap@3 Mask@4) (state ExhaleHeap@3 Mask@4)))) (and (=> (= (ControlFlow 0 105) (- 0 106)) (HasDirectPerm Mask@4 a_2 array)) (=> (HasDirectPerm Mask@4 a_2 array) (=> (< middle@0 (|Seq#Length| (MapType0Select ExhaleHeap@3 a_2 array))) (=> (and (state ExhaleHeap@3 Mask@4) (state ExhaleHeap@3 Mask@4)) (and (and (=> (= (ControlFlow 0 105) 98) anon89_Else_correct) (=> (= (ControlFlow 0 105) 82) anon90_Then_correct)) (=> (= (ControlFlow 0 105) 86) anon90_Else_correct))))))))))
(let ((anon85_Else_correct  (and (=> (= (ControlFlow 0 107) (- 0 113)) (forall ((i3_1 Int) (i3_1_1 Int) ) (!  (=> (and (and (and (and (not (= i3_1 i3_1_1)) (|Seq#Contains| (|Seq#Range| start middle@0) (int_2_U i3_1))) (|Seq#Contains| (|Seq#Range| start middle@0) (int_2_U i3_1_1))) (< NoPerm (* (/ (to_real 1) (to_real 2)) kperm))) (< NoPerm (* (/ (to_real 1) (to_real 2)) kperm))) (not (= (|Seq#Index| (MapType0Select ExhaleHeap@3 a_2 array) i3_1) (|Seq#Index| (MapType0Select ExhaleHeap@3 a_2 array) i3_1_1))))
 :qid |stdinbpl.1171:19|
 :skolemid |89|
))) (=> (forall ((i3_1@@0 Int) (i3_1_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i3_1@@0 i3_1_1@@0)) (|Seq#Contains| (|Seq#Range| start middle@0) (int_2_U i3_1@@0))) (|Seq#Contains| (|Seq#Range| start middle@0) (int_2_U i3_1_1@@0))) (< NoPerm (* (/ (to_real 1) (to_real 2)) kperm))) (< NoPerm (* (/ (to_real 1) (to_real 2)) kperm))) (not (= (|Seq#Index| (MapType0Select ExhaleHeap@3 a_2 array) i3_1@@0) (|Seq#Index| (MapType0Select ExhaleHeap@3 a_2 array) i3_1_1@@0))))
 :qid |stdinbpl.1171:19|
 :skolemid |89|
)) (=> (and (forall ((i3_1@@1 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| start middle@0) (int_2_U i3_1@@1)) (< NoPerm (* (/ (to_real 1) (to_real 2)) kperm))) (and (qpRange6 (|Seq#Index| (MapType0Select ExhaleHeap@3 a_2 array) i3_1@@1)) (= (invRecv6 (|Seq#Index| (MapType0Select ExhaleHeap@3 a_2 array) i3_1@@1)) i3_1@@1)))
 :qid |stdinbpl.1177:26|
 :skolemid |90|
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@3 a_2 array) i3_1@@1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start middle@0) (int_2_U i3_1@@1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start middle@0) (int_2_U i3_1@@1)))
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@3 a_2 array) i3_1@@1))
)) (forall ((o_3@@8 T@U) ) (!  (=> (= (type o_3@@8) RefType) (=> (and (and (|Seq#Contains| (|Seq#Range| start middle@0) (int_2_U (invRecv6 o_3@@8))) (< NoPerm (* (/ (to_real 1) (to_real 2)) kperm))) (qpRange6 o_3@@8)) (= (|Seq#Index| (MapType0Select ExhaleHeap@3 a_2 array) (invRecv6 o_3@@8)) o_3@@8)))
 :qid |stdinbpl.1181:26|
 :skolemid |91|
 :pattern ( (invRecv6 o_3@@8))
))) (and (=> (= (ControlFlow 0 107) (- 0 112)) (forall ((i3_1@@2 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| start middle@0) (int_2_U i3_1@@2)) (>= (* (/ (to_real 1) (to_real 2)) kperm) NoPerm))
 :qid |stdinbpl.1187:19|
 :skolemid |92|
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@3 a_2 array) i3_1@@2))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start middle@0) (int_2_U i3_1@@2)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start middle@0) (int_2_U i3_1@@2)))
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@3 a_2 array) i3_1@@2))
))) (=> (forall ((i3_1@@3 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| start middle@0) (int_2_U i3_1@@3)) (>= (* (/ (to_real 1) (to_real 2)) kperm) NoPerm))
 :qid |stdinbpl.1187:19|
 :skolemid |92|
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@3 a_2 array) i3_1@@3))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start middle@0) (int_2_U i3_1@@3)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start middle@0) (int_2_U i3_1@@3)))
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@3 a_2 array) i3_1@@3))
)) (=> (and (forall ((i3_1@@4 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| start middle@0) (int_2_U i3_1@@4)) (> (* (/ (to_real 1) (to_real 2)) kperm) NoPerm)) (not (= (|Seq#Index| (MapType0Select ExhaleHeap@3 a_2 array) i3_1@@4) null)))
 :qid |stdinbpl.1193:26|
 :skolemid |93|
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@3 a_2 array) i3_1@@4))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start middle@0) (int_2_U i3_1@@4)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start middle@0) (int_2_U i3_1@@4)))
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@3 a_2 array) i3_1@@4))
)) (forall ((o_3@@9 T@U) ) (!  (=> (= (type o_3@@9) RefType) (and (=> (and (and (|Seq#Contains| (|Seq#Range| start middle@0) (int_2_U (invRecv6 o_3@@9))) (< NoPerm (* (/ (to_real 1) (to_real 2)) kperm))) (qpRange6 o_3@@9)) (and (=> (< NoPerm (* (/ (to_real 1) (to_real 2)) kperm)) (= (|Seq#Index| (MapType0Select ExhaleHeap@3 a_2 array) (invRecv6 o_3@@9)) o_3@@9)) (= (U_2_real (MapType1Select QPMask@3 o_3@@9 value)) (+ (U_2_real (MapType1Select Mask@3 o_3@@9 value)) (* (/ (to_real 1) (to_real 2)) kperm))))) (=> (not (and (and (|Seq#Contains| (|Seq#Range| start middle@0) (int_2_U (invRecv6 o_3@@9))) (< NoPerm (* (/ (to_real 1) (to_real 2)) kperm))) (qpRange6 o_3@@9))) (= (U_2_real (MapType1Select QPMask@3 o_3@@9 value)) (U_2_real (MapType1Select Mask@3 o_3@@9 value))))))
 :qid |stdinbpl.1199:26|
 :skolemid |94|
 :pattern ( (MapType1Select QPMask@3 o_3@@9 value))
))) (=> (and (and (and (forall ((o_3@@10 T@U) (f_5@@2 T@U) ) (! (let ((B@@14 (FieldTypeInv1 (type f_5@@2))))
(let ((A@@15 (FieldTypeInv0 (type f_5@@2))))
 (=> (and (and (= (type o_3@@10) RefType) (= (type f_5@@2) (FieldType A@@15 B@@14))) (not (= f_5@@2 value))) (= (U_2_real (MapType1Select Mask@3 o_3@@10 f_5@@2)) (U_2_real (MapType1Select QPMask@3 o_3@@10 f_5@@2))))))
 :qid |stdinbpl.1203:33|
 :skolemid |95|
 :pattern ( (MapType1Select Mask@3 o_3@@10 f_5@@2))
 :pattern ( (MapType1Select QPMask@3 o_3@@10 f_5@@2))
)) (state ExhaleHeap@3 QPMask@3)) (and (state ExhaleHeap@3 QPMask@3) (state ExhaleHeap@3 QPMask@3))) (and (and (<= start posl) (< posl middle@0)) (and (state ExhaleHeap@3 QPMask@3) (state ExhaleHeap@3 QPMask@3)))) (and (=> (= (ControlFlow 0 107) (- 0 111)) (HasDirectPerm QPMask@3 a_2 array)) (=> (HasDirectPerm QPMask@3 a_2 array) (and (=> (= (ControlFlow 0 107) (- 0 110)) (>= posl 0)) (=> (>= posl 0) (and (=> (= (ControlFlow 0 107) (- 0 109)) (< posl (|Seq#Length| (MapType0Select ExhaleHeap@3 a_2 array)))) (=> (< posl (|Seq#Length| (MapType0Select ExhaleHeap@3 a_2 array))) (and (=> (= (ControlFlow 0 107) (- 0 108)) (HasDirectPerm QPMask@3 (|Seq#Index| (MapType0Select ExhaleHeap@3 a_2 array) posl) value)) (=> (HasDirectPerm QPMask@3 (|Seq#Index| (MapType0Select ExhaleHeap@3 a_2 array) posl) value) (=> (= (U_2_int (MapType0Select ExhaleHeap@3 (|Seq#Index| (MapType0Select ExhaleHeap@3 a_2 array) posl) value)) ml) (=> (and (state ExhaleHeap@3 QPMask@3) (state ExhaleHeap@3 QPMask@3)) (and (and (=> (= (ControlFlow 0 107) 105) anon87_Else_correct) (=> (= (ControlFlow 0 107) 75) anon88_Then_correct)) (=> (= (ControlFlow 0 107) 80) anon88_Else_correct)))))))))))))))))))))
(let ((anon83_Else_correct  (and (=> (= (ControlFlow 0 114) (- 0 122)) (forall ((i2_1 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| middle@0 end) (int_2_U i2_1)) (dummyFunction (MapType0Select ExhaleHeap@2 (|Seq#Index| (MapType0Select ExhaleHeap@2 a_2 array) i2_1) value))) (>= (* (/ (to_real 1) (to_real 2)) kperm) NoPerm))
 :qid |stdinbpl.1067:21|
 :skolemid |82|
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@2 a_2 array) i2_1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| middle@0 end) (int_2_U i2_1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| middle@0 end) (int_2_U i2_1)))
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@2 a_2 array) i2_1))
))) (=> (forall ((i2_1@@0 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| middle@0 end) (int_2_U i2_1@@0)) (dummyFunction (MapType0Select ExhaleHeap@2 (|Seq#Index| (MapType0Select ExhaleHeap@2 a_2 array) i2_1@@0) value))) (>= (* (/ (to_real 1) (to_real 2)) kperm) NoPerm))
 :qid |stdinbpl.1067:21|
 :skolemid |82|
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@2 a_2 array) i2_1@@0))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| middle@0 end) (int_2_U i2_1@@0)))
 :pattern ( (|Seq#Contains| (|Seq#Range| middle@0 end) (int_2_U i2_1@@0)))
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@2 a_2 array) i2_1@@0))
)) (and (=> (= (ControlFlow 0 114) (- 0 121)) (forall ((i2_1@@1 Int) (i2_1_1 Int) ) (!  (=> (and (and (and (and (not (= i2_1@@1 i2_1_1)) (|Seq#Contains| (|Seq#Range| middle@0 end) (int_2_U i2_1@@1))) (|Seq#Contains| (|Seq#Range| middle@0 end) (int_2_U i2_1_1))) (< NoPerm (* (/ (to_real 1) (to_real 2)) kperm))) (< NoPerm (* (/ (to_real 1) (to_real 2)) kperm))) (not (= (|Seq#Index| (MapType0Select ExhaleHeap@2 a_2 array) i2_1@@1) (|Seq#Index| (MapType0Select ExhaleHeap@2 a_2 array) i2_1_1))))
 :qid |stdinbpl.1074:21|
 :skolemid |83|
 :pattern ( (neverTriggered5 i2_1@@1) (neverTriggered5 i2_1_1))
))) (=> (forall ((i2_1@@2 Int) (i2_1_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i2_1@@2 i2_1_1@@0)) (|Seq#Contains| (|Seq#Range| middle@0 end) (int_2_U i2_1@@2))) (|Seq#Contains| (|Seq#Range| middle@0 end) (int_2_U i2_1_1@@0))) (< NoPerm (* (/ (to_real 1) (to_real 2)) kperm))) (< NoPerm (* (/ (to_real 1) (to_real 2)) kperm))) (not (= (|Seq#Index| (MapType0Select ExhaleHeap@2 a_2 array) i2_1@@2) (|Seq#Index| (MapType0Select ExhaleHeap@2 a_2 array) i2_1_1@@0))))
 :qid |stdinbpl.1074:21|
 :skolemid |83|
 :pattern ( (neverTriggered5 i2_1@@2) (neverTriggered5 i2_1_1@@0))
)) (and (=> (= (ControlFlow 0 114) (- 0 120)) (forall ((i2_1@@3 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| middle@0 end) (int_2_U i2_1@@3)) (>= (U_2_real (MapType1Select Mask@2 (|Seq#Index| (MapType0Select ExhaleHeap@2 a_2 array) i2_1@@3) value)) (* (/ (to_real 1) (to_real 2)) kperm)))
 :qid |stdinbpl.1081:21|
 :skolemid |84|
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@2 a_2 array) i2_1@@3))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| middle@0 end) (int_2_U i2_1@@3)))
 :pattern ( (|Seq#Contains| (|Seq#Range| middle@0 end) (int_2_U i2_1@@3)))
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@2 a_2 array) i2_1@@3))
))) (=> (forall ((i2_1@@4 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| middle@0 end) (int_2_U i2_1@@4)) (>= (U_2_real (MapType1Select Mask@2 (|Seq#Index| (MapType0Select ExhaleHeap@2 a_2 array) i2_1@@4) value)) (* (/ (to_real 1) (to_real 2)) kperm)))
 :qid |stdinbpl.1081:21|
 :skolemid |84|
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@2 a_2 array) i2_1@@4))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| middle@0 end) (int_2_U i2_1@@4)))
 :pattern ( (|Seq#Contains| (|Seq#Range| middle@0 end) (int_2_U i2_1@@4)))
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@2 a_2 array) i2_1@@4))
)) (=> (and (forall ((i2_1@@5 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| middle@0 end) (int_2_U i2_1@@5)) (< NoPerm (* (/ (to_real 1) (to_real 2)) kperm))) (and (qpRange5 (|Seq#Index| (MapType0Select ExhaleHeap@2 a_2 array) i2_1@@5)) (= (invRecv5 (|Seq#Index| (MapType0Select ExhaleHeap@2 a_2 array) i2_1@@5)) i2_1@@5)))
 :qid |stdinbpl.1087:26|
 :skolemid |85|
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@2 a_2 array) i2_1@@5))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| middle@0 end) (int_2_U i2_1@@5)))
 :pattern ( (|Seq#Contains| (|Seq#Range| middle@0 end) (int_2_U i2_1@@5)))
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@2 a_2 array) i2_1@@5))
)) (forall ((o_3@@11 T@U) ) (!  (=> (= (type o_3@@11) RefType) (=> (and (|Seq#Contains| (|Seq#Range| middle@0 end) (int_2_U (invRecv5 o_3@@11))) (and (< NoPerm (* (/ (to_real 1) (to_real 2)) kperm)) (qpRange5 o_3@@11))) (= (|Seq#Index| (MapType0Select ExhaleHeap@2 a_2 array) (invRecv5 o_3@@11)) o_3@@11)))
 :qid |stdinbpl.1091:26|
 :skolemid |86|
 :pattern ( (invRecv5 o_3@@11))
))) (=> (and (and (forall ((o_3@@12 T@U) ) (!  (=> (= (type o_3@@12) RefType) (and (=> (and (|Seq#Contains| (|Seq#Range| middle@0 end) (int_2_U (invRecv5 o_3@@12))) (and (< NoPerm (* (/ (to_real 1) (to_real 2)) kperm)) (qpRange5 o_3@@12))) (and (= (|Seq#Index| (MapType0Select ExhaleHeap@2 a_2 array) (invRecv5 o_3@@12)) o_3@@12) (= (U_2_real (MapType1Select QPMask@2 o_3@@12 value)) (- (U_2_real (MapType1Select Mask@2 o_3@@12 value)) (* (/ (to_real 1) (to_real 2)) kperm))))) (=> (not (and (|Seq#Contains| (|Seq#Range| middle@0 end) (int_2_U (invRecv5 o_3@@12))) (and (< NoPerm (* (/ (to_real 1) (to_real 2)) kperm)) (qpRange5 o_3@@12)))) (= (U_2_real (MapType1Select QPMask@2 o_3@@12 value)) (U_2_real (MapType1Select Mask@2 o_3@@12 value))))))
 :qid |stdinbpl.1097:26|
 :skolemid |87|
 :pattern ( (MapType1Select QPMask@2 o_3@@12 value))
)) (forall ((o_3@@13 T@U) (f_5@@3 T@U) ) (! (let ((B@@15 (FieldTypeInv1 (type f_5@@3))))
(let ((A@@16 (FieldTypeInv0 (type f_5@@3))))
 (=> (and (and (= (type o_3@@13) RefType) (= (type f_5@@3) (FieldType A@@16 B@@15))) (not (= f_5@@3 value))) (= (U_2_real (MapType1Select Mask@2 o_3@@13 f_5@@3)) (U_2_real (MapType1Select QPMask@2 o_3@@13 f_5@@3))))))
 :qid |stdinbpl.1103:33|
 :skolemid |88|
 :pattern ( (MapType1Select QPMask@2 o_3@@13 f_5@@3))
))) (and (IdenticalOnKnownLocations ExhaleHeap@2 ExhaleHeap@3 QPMask@2) (state ExhaleHeap@3 QPMask@2))) (and (=> (= (ControlFlow 0 114) (- 0 119)) (HasDirectPerm QPMask@2 a_2 array)) (=> (HasDirectPerm QPMask@2 a_2 array) (and (=> (= (ControlFlow 0 114) (- 0 118)) (>= (|Seq#Length| (MapType0Select ExhaleHeap@3 a_2 array)) 1)) (=> (>= (|Seq#Length| (MapType0Select ExhaleHeap@3 a_2 array)) 1) (=> (state ExhaleHeap@3 QPMask@2) (and (=> (= (ControlFlow 0 114) (- 0 117)) (< NoPerm (* (/ (to_real 1) (to_real 2)) kperm))) (=> (< NoPerm (* (/ (to_real 1) (to_real 2)) kperm)) (and (=> (= (ControlFlow 0 114) (- 0 116)) (< (* (/ (to_real 1) (to_real 2)) kperm) FullPerm)) (=> (< (* (/ (to_real 1) (to_real 2)) kperm) FullPerm) (=> (state ExhaleHeap@3 QPMask@2) (=> (and (> wildcard@4 NoPerm) (not (= a_2 null))) (=> (and (and (= Mask@3 (MapType1Store QPMask@2 a_2 array (real_2_U (+ (U_2_real (MapType1Select QPMask@2 a_2 array)) wildcard@4)))) (state ExhaleHeap@3 Mask@3)) (and (state ExhaleHeap@3 Mask@3) (state ExhaleHeap@3 Mask@3))) (and (=> (= (ControlFlow 0 114) (- 0 115)) (HasDirectPerm Mask@3 a_2 array)) (=> (HasDirectPerm Mask@3 a_2 array) (=> (< middle@0 (|Seq#Length| (MapType0Select ExhaleHeap@3 a_2 array))) (=> (and (state ExhaleHeap@3 Mask@3) (state ExhaleHeap@3 Mask@3)) (and (and (=> (= (ControlFlow 0 114) 107) anon85_Else_correct) (=> (= (ControlFlow 0 114) 69) anon86_Then_correct)) (=> (= (ControlFlow 0 114) 73) anon86_Else_correct))))))))))))))))))))))))))))
(let ((anon81_Else_correct  (and (=> (= (ControlFlow 0 123) (- 0 136)) (forall ((i1_1 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| start middle@0) (int_2_U i1_1)) (dummyFunction (MapType0Select ExhaleHeap@0 (|Seq#Index| (MapType0Select ExhaleHeap@0 a_2 array) i1_1) value))) (>= (* (/ (to_real 1) (to_real 2)) kperm) NoPerm))
 :qid |stdinbpl.941:21|
 :skolemid |75|
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@0 a_2 array) i1_1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start middle@0) (int_2_U i1_1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start middle@0) (int_2_U i1_1)))
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@0 a_2 array) i1_1))
))) (=> (forall ((i1_1@@0 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| start middle@0) (int_2_U i1_1@@0)) (dummyFunction (MapType0Select ExhaleHeap@0 (|Seq#Index| (MapType0Select ExhaleHeap@0 a_2 array) i1_1@@0) value))) (>= (* (/ (to_real 1) (to_real 2)) kperm) NoPerm))
 :qid |stdinbpl.941:21|
 :skolemid |75|
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@0 a_2 array) i1_1@@0))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start middle@0) (int_2_U i1_1@@0)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start middle@0) (int_2_U i1_1@@0)))
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@0 a_2 array) i1_1@@0))
)) (and (=> (= (ControlFlow 0 123) (- 0 135)) (forall ((i1_1@@1 Int) (i1_1_1 Int) ) (!  (=> (and (and (and (and (not (= i1_1@@1 i1_1_1)) (|Seq#Contains| (|Seq#Range| start middle@0) (int_2_U i1_1@@1))) (|Seq#Contains| (|Seq#Range| start middle@0) (int_2_U i1_1_1))) (< NoPerm (* (/ (to_real 1) (to_real 2)) kperm))) (< NoPerm (* (/ (to_real 1) (to_real 2)) kperm))) (not (= (|Seq#Index| (MapType0Select ExhaleHeap@0 a_2 array) i1_1@@1) (|Seq#Index| (MapType0Select ExhaleHeap@0 a_2 array) i1_1_1))))
 :qid |stdinbpl.948:21|
 :skolemid |76|
 :pattern ( (neverTriggered4 i1_1@@1) (neverTriggered4 i1_1_1))
))) (=> (forall ((i1_1@@2 Int) (i1_1_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i1_1@@2 i1_1_1@@0)) (|Seq#Contains| (|Seq#Range| start middle@0) (int_2_U i1_1@@2))) (|Seq#Contains| (|Seq#Range| start middle@0) (int_2_U i1_1_1@@0))) (< NoPerm (* (/ (to_real 1) (to_real 2)) kperm))) (< NoPerm (* (/ (to_real 1) (to_real 2)) kperm))) (not (= (|Seq#Index| (MapType0Select ExhaleHeap@0 a_2 array) i1_1@@2) (|Seq#Index| (MapType0Select ExhaleHeap@0 a_2 array) i1_1_1@@0))))
 :qid |stdinbpl.948:21|
 :skolemid |76|
 :pattern ( (neverTriggered4 i1_1@@2) (neverTriggered4 i1_1_1@@0))
)) (and (=> (= (ControlFlow 0 123) (- 0 134)) (forall ((i1_1@@3 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| start middle@0) (int_2_U i1_1@@3)) (>= (U_2_real (MapType1Select Mask@1 (|Seq#Index| (MapType0Select ExhaleHeap@0 a_2 array) i1_1@@3) value)) (* (/ (to_real 1) (to_real 2)) kperm)))
 :qid |stdinbpl.955:21|
 :skolemid |77|
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@0 a_2 array) i1_1@@3))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start middle@0) (int_2_U i1_1@@3)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start middle@0) (int_2_U i1_1@@3)))
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@0 a_2 array) i1_1@@3))
))) (=> (forall ((i1_1@@4 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| start middle@0) (int_2_U i1_1@@4)) (>= (U_2_real (MapType1Select Mask@1 (|Seq#Index| (MapType0Select ExhaleHeap@0 a_2 array) i1_1@@4) value)) (* (/ (to_real 1) (to_real 2)) kperm)))
 :qid |stdinbpl.955:21|
 :skolemid |77|
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@0 a_2 array) i1_1@@4))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start middle@0) (int_2_U i1_1@@4)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start middle@0) (int_2_U i1_1@@4)))
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@0 a_2 array) i1_1@@4))
)) (=> (and (forall ((i1_1@@5 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| start middle@0) (int_2_U i1_1@@5)) (< NoPerm (* (/ (to_real 1) (to_real 2)) kperm))) (and (qpRange4 (|Seq#Index| (MapType0Select ExhaleHeap@0 a_2 array) i1_1@@5)) (= (invRecv4 (|Seq#Index| (MapType0Select ExhaleHeap@0 a_2 array) i1_1@@5)) i1_1@@5)))
 :qid |stdinbpl.961:26|
 :skolemid |78|
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@0 a_2 array) i1_1@@5))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start middle@0) (int_2_U i1_1@@5)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start middle@0) (int_2_U i1_1@@5)))
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@0 a_2 array) i1_1@@5))
)) (forall ((o_3@@14 T@U) ) (!  (=> (= (type o_3@@14) RefType) (=> (and (|Seq#Contains| (|Seq#Range| start middle@0) (int_2_U (invRecv4 o_3@@14))) (and (< NoPerm (* (/ (to_real 1) (to_real 2)) kperm)) (qpRange4 o_3@@14))) (= (|Seq#Index| (MapType0Select ExhaleHeap@0 a_2 array) (invRecv4 o_3@@14)) o_3@@14)))
 :qid |stdinbpl.965:26|
 :skolemid |79|
 :pattern ( (invRecv4 o_3@@14))
))) (=> (and (and (forall ((o_3@@15 T@U) ) (!  (=> (= (type o_3@@15) RefType) (and (=> (and (|Seq#Contains| (|Seq#Range| start middle@0) (int_2_U (invRecv4 o_3@@15))) (and (< NoPerm (* (/ (to_real 1) (to_real 2)) kperm)) (qpRange4 o_3@@15))) (and (= (|Seq#Index| (MapType0Select ExhaleHeap@0 a_2 array) (invRecv4 o_3@@15)) o_3@@15) (= (U_2_real (MapType1Select QPMask@1 o_3@@15 value)) (- (U_2_real (MapType1Select Mask@1 o_3@@15 value)) (* (/ (to_real 1) (to_real 2)) kperm))))) (=> (not (and (|Seq#Contains| (|Seq#Range| start middle@0) (int_2_U (invRecv4 o_3@@15))) (and (< NoPerm (* (/ (to_real 1) (to_real 2)) kperm)) (qpRange4 o_3@@15)))) (= (U_2_real (MapType1Select QPMask@1 o_3@@15 value)) (U_2_real (MapType1Select Mask@1 o_3@@15 value))))))
 :qid |stdinbpl.971:26|
 :skolemid |80|
 :pattern ( (MapType1Select QPMask@1 o_3@@15 value))
)) (forall ((o_3@@16 T@U) (f_5@@4 T@U) ) (! (let ((B@@16 (FieldTypeInv1 (type f_5@@4))))
(let ((A@@17 (FieldTypeInv0 (type f_5@@4))))
 (=> (and (and (= (type o_3@@16) RefType) (= (type f_5@@4) (FieldType A@@17 B@@16))) (not (= f_5@@4 value))) (= (U_2_real (MapType1Select Mask@1 o_3@@16 f_5@@4)) (U_2_real (MapType1Select QPMask@1 o_3@@16 f_5@@4))))))
 :qid |stdinbpl.977:33|
 :skolemid |81|
 :pattern ( (MapType1Select QPMask@1 o_3@@16 f_5@@4))
))) (and (IdenticalOnKnownLocations ExhaleHeap@0 ExhaleHeap@1 QPMask@1) (state ExhaleHeap@1 QPMask@1))) (and (=> (= (ControlFlow 0 123) (- 0 133)) (HasDirectPerm QPMask@1 a_2 array)) (=> (HasDirectPerm QPMask@1 a_2 array) (and (=> (= (ControlFlow 0 123) (- 0 132)) (>= (|Seq#Length| (MapType0Select ExhaleHeap@1 a_2 array)) 1)) (=> (>= (|Seq#Length| (MapType0Select ExhaleHeap@1 a_2 array)) 1) (=> (state ExhaleHeap@1 QPMask@1) (and (=> (= (ControlFlow 0 123) (- 0 131)) (< NoPerm (* (/ (to_real 1) (to_real 2)) kperm))) (=> (< NoPerm (* (/ (to_real 1) (to_real 2)) kperm)) (and (=> (= (ControlFlow 0 123) (- 0 130)) (< (* (/ (to_real 1) (to_real 2)) kperm) FullPerm)) (=> (< (* (/ (to_real 1) (to_real 2)) kperm) FullPerm) (=> (state ExhaleHeap@1 QPMask@1) (and (=> (= (ControlFlow 0 123) (- 0 129)) (not (= a_2 null))) (=> (not (= a_2 null)) (=> (state ExhaleHeap@1 QPMask@1) (and (=> (= (ControlFlow 0 123) (- 0 128)) (> (U_2_real (MapType1Select QPMask@1 a_2 array)) NoPerm)) (=> (> (U_2_real (MapType1Select QPMask@1 a_2 array)) NoPerm) (=> (> wildcard@3 NoPerm) (=> (and (and (< wildcard@3 (U_2_real (MapType1Select QPMask@1 a_2 array))) (= Mask@2 (MapType1Store QPMask@1 a_2 array (real_2_U (- (U_2_real (MapType1Select QPMask@1 a_2 array)) wildcard@3))))) (and (IdenticalOnKnownLocations ExhaleHeap@1 ExhaleHeap@2 Mask@2) (state ExhaleHeap@2 Mask@2))) (and (=> (= (ControlFlow 0 123) (- 0 127)) (<= 0 middle@0)) (=> (<= 0 middle@0) (and (=> (= (ControlFlow 0 123) (- 0 126)) (< middle@0 end)) (=> (< middle@0 end) (and (=> (= (ControlFlow 0 123) (- 0 125)) (HasDirectPerm Mask@2 a_2 array)) (=> (HasDirectPerm Mask@2 a_2 array) (and (=> (= (ControlFlow 0 123) (- 0 124)) (< end (|Seq#Length| (MapType0Select ExhaleHeap@2 a_2 array)))) (=> (< end (|Seq#Length| (MapType0Select ExhaleHeap@2 a_2 array))) (=> (state ExhaleHeap@2 Mask@2) (and (and (=> (= (ControlFlow 0 123) 114) anon83_Else_correct) (=> (= (ControlFlow 0 123) 63) anon84_Then_correct)) (=> (= (ControlFlow 0 123) 67) anon84_Else_correct))))))))))))))))))))))))))))))))))))))
(let ((anon80_Then_correct  (=> (> (- end start) 1) (=> (and (= middle@0 (+ start (div (- end start) 2))) (state Heap@@9 QPMask@0)) (and (=> (= (ControlFlow 0 137) (- 0 143)) (not (= a_2 null))) (=> (not (= a_2 null)) (=> (state Heap@@9 QPMask@0) (and (=> (= (ControlFlow 0 137) (- 0 142)) (> (U_2_real (MapType1Select QPMask@0 a_2 array)) NoPerm)) (=> (> (U_2_real (MapType1Select QPMask@0 a_2 array)) NoPerm) (=> (> wildcard@2 NoPerm) (=> (and (and (< wildcard@2 (U_2_real (MapType1Select QPMask@0 a_2 array))) (= Mask@1 (MapType1Store QPMask@0 a_2 array (real_2_U (- (U_2_real (MapType1Select QPMask@0 a_2 array)) wildcard@2))))) (and (IdenticalOnKnownLocations Heap@@9 ExhaleHeap@0 Mask@1) (state ExhaleHeap@0 Mask@1))) (and (=> (= (ControlFlow 0 137) (- 0 141)) (<= 0 start)) (=> (<= 0 start) (and (=> (= (ControlFlow 0 137) (- 0 140)) (< start middle@0)) (=> (< start middle@0) (and (=> (= (ControlFlow 0 137) (- 0 139)) (HasDirectPerm Mask@1 a_2 array)) (=> (HasDirectPerm Mask@1 a_2 array) (and (=> (= (ControlFlow 0 137) (- 0 138)) (< middle@0 (|Seq#Length| (MapType0Select ExhaleHeap@0 a_2 array)))) (=> (< middle@0 (|Seq#Length| (MapType0Select ExhaleHeap@0 a_2 array))) (=> (state ExhaleHeap@0 Mask@1) (and (and (=> (= (ControlFlow 0 137) 123) anon81_Else_correct) (=> (= (ControlFlow 0 137) 57) anon82_Then_correct)) (=> (= (ControlFlow 0 137) 61) anon82_Else_correct))))))))))))))))))))))
(let ((anon80_Else_correct  (=> (>= 1 (- end start)) (and (=> (= (ControlFlow 0 51) (- 0 55)) (HasDirectPerm QPMask@0 a_2 array)) (=> (HasDirectPerm QPMask@0 a_2 array) (and (=> (= (ControlFlow 0 51) (- 0 54)) (>= start 0)) (=> (>= start 0) (and (=> (= (ControlFlow 0 51) (- 0 53)) (< start (|Seq#Length| (MapType0Select Heap@@9 a_2 array)))) (=> (< start (|Seq#Length| (MapType0Select Heap@@9 a_2 array))) (and (=> (= (ControlFlow 0 51) (- 0 52)) (HasDirectPerm QPMask@0 (|Seq#Index| (MapType0Select Heap@@9 a_2 array) start) value)) (=> (HasDirectPerm QPMask@0 (|Seq#Index| (MapType0Select Heap@@9 a_2 array) start) value) (=> (and (and (and (= mx@0 (U_2_int (MapType0Select Heap@@9 (|Seq#Index| (MapType0Select Heap@@9 a_2 array) start) value))) (state Heap@@9 QPMask@0)) (and (state Heap@@9 QPMask@0) (= Mask@5 QPMask@0))) (and (and (= Heap@0 Heap@@9) (= mx@2 mx@0)) (and (= pos@1 start) (= (ControlFlow 0 51) 50)))) anon52_correct))))))))))))
(let ((anon71_Else_correct  (and (=> (= (ControlFlow 0 177) (- 0 180)) (forall ((i_3 Int) (i_3_1 Int) ) (!  (=> (and (and (and (and (not (= i_3 i_3_1)) (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_3))) (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_3_1))) (< NoPerm kperm)) (< NoPerm kperm)) (not (= (|Seq#Index| (MapType0Select Heap@@9 a_2 array) i_3) (|Seq#Index| (MapType0Select Heap@@9 a_2 array) i_3_1))))
 :qid |stdinbpl.687:15|
 :skolemid |59|
))) (=> (forall ((i_3@@0 Int) (i_3_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_3@@0 i_3_1@@0)) (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_3@@0))) (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_3_1@@0))) (< NoPerm kperm)) (< NoPerm kperm)) (not (= (|Seq#Index| (MapType0Select Heap@@9 a_2 array) i_3@@0) (|Seq#Index| (MapType0Select Heap@@9 a_2 array) i_3_1@@0))))
 :qid |stdinbpl.687:15|
 :skolemid |59|
)) (=> (and (forall ((i_3@@1 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_3@@1)) (< NoPerm kperm)) (and (qpRange1 (|Seq#Index| (MapType0Select Heap@@9 a_2 array) i_3@@1)) (= (invRecv1 (|Seq#Index| (MapType0Select Heap@@9 a_2 array) i_3@@1)) i_3@@1)))
 :qid |stdinbpl.693:22|
 :skolemid |60|
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 a_2 array) i_3@@1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U i_3@@1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_3@@1)))
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 a_2 array) i_3@@1))
)) (forall ((o_3@@17 T@U) ) (!  (=> (= (type o_3@@17) RefType) (=> (and (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U (invRecv1 o_3@@17))) (< NoPerm kperm)) (qpRange1 o_3@@17)) (= (|Seq#Index| (MapType0Select Heap@@9 a_2 array) (invRecv1 o_3@@17)) o_3@@17)))
 :qid |stdinbpl.697:22|
 :skolemid |61|
 :pattern ( (invRecv1 o_3@@17))
))) (and (=> (= (ControlFlow 0 177) (- 0 179)) (forall ((i_3@@2 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_3@@2)) (>= kperm NoPerm))
 :qid |stdinbpl.703:15|
 :skolemid |62|
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 a_2 array) i_3@@2))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U i_3@@2)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_3@@2)))
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 a_2 array) i_3@@2))
))) (=> (forall ((i_3@@3 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_3@@3)) (>= kperm NoPerm))
 :qid |stdinbpl.703:15|
 :skolemid |62|
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 a_2 array) i_3@@3))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U i_3@@3)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_3@@3)))
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 a_2 array) i_3@@3))
)) (=> (forall ((i_3@@4 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_3@@4)) (> kperm NoPerm)) (not (= (|Seq#Index| (MapType0Select Heap@@9 a_2 array) i_3@@4) null)))
 :qid |stdinbpl.709:22|
 :skolemid |63|
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 a_2 array) i_3@@4))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U i_3@@4)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_3@@4)))
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 a_2 array) i_3@@4))
)) (=> (and (and (forall ((o_3@@18 T@U) ) (!  (=> (= (type o_3@@18) RefType) (and (=> (and (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U (invRecv1 o_3@@18))) (< NoPerm kperm)) (qpRange1 o_3@@18)) (and (=> (< NoPerm kperm) (= (|Seq#Index| (MapType0Select Heap@@9 a_2 array) (invRecv1 o_3@@18)) o_3@@18)) (= (U_2_real (MapType1Select QPMask@0 o_3@@18 value)) (+ (U_2_real (MapType1Select Mask@0 o_3@@18 value)) kperm)))) (=> (not (and (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U (invRecv1 o_3@@18))) (< NoPerm kperm)) (qpRange1 o_3@@18))) (= (U_2_real (MapType1Select QPMask@0 o_3@@18 value)) (U_2_real (MapType1Select Mask@0 o_3@@18 value))))))
 :qid |stdinbpl.715:22|
 :skolemid |64|
 :pattern ( (MapType1Select QPMask@0 o_3@@18 value))
)) (forall ((o_3@@19 T@U) (f_5@@5 T@U) ) (! (let ((B@@17 (FieldTypeInv1 (type f_5@@5))))
(let ((A@@18 (FieldTypeInv0 (type f_5@@5))))
 (=> (and (and (= (type o_3@@19) RefType) (= (type f_5@@5) (FieldType A@@18 B@@17))) (not (= f_5@@5 value))) (= (U_2_real (MapType1Select Mask@0 o_3@@19 f_5@@5)) (U_2_real (MapType1Select QPMask@0 o_3@@19 f_5@@5))))))
 :qid |stdinbpl.719:29|
 :skolemid |65|
 :pattern ( (MapType1Select Mask@0 o_3@@19 f_5@@5))
 :pattern ( (MapType1Select QPMask@0 o_3@@19 f_5@@5))
))) (and (state Heap@@9 QPMask@0) (state Heap@@9 QPMask@0))) (and (=> (= (ControlFlow 0 177) (- 0 178)) (HasDirectPerm QPMask@0 a_2 array)) (=> (HasDirectPerm QPMask@0 a_2 array) (=> (>= (|Seq#Length| (MapType0Select Heap@@9 a_2 array)) 1) (=> (and (and (state Heap@@9 QPMask@0) (< NoPerm kperm)) (and (< kperm FullPerm) (state Heap@@9 QPMask@0))) (and (and (=> (= (ControlFlow 0 177) 175) anon73_Then_correct) (=> (= (ControlFlow 0 177) 137) anon80_Then_correct)) (=> (= (ControlFlow 0 177) 51) anon80_Else_correct)))))))))))))))
(let ((anon7_correct true))
(let ((anon72_Else_correct  (=> (and (not (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_2))) (= (ControlFlow 0 15) 10)) anon7_correct)))
(let ((anon72_Then_correct  (=> (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_2)) (and (=> (= (ControlFlow 0 11) (- 0 14)) (HasDirectPerm Mask@0 a_2 array)) (=> (HasDirectPerm Mask@0 a_2 array) (and (=> (= (ControlFlow 0 11) (- 0 13)) (>= i_2 0)) (=> (>= i_2 0) (and (=> (= (ControlFlow 0 11) (- 0 12)) (< i_2 (|Seq#Length| (MapType0Select Heap@@9 a_2 array)))) (=> (< i_2 (|Seq#Length| (MapType0Select Heap@@9 a_2 array))) (=> (= (ControlFlow 0 11) 10) anon7_correct))))))))))
(let ((anon69_Else_correct  (=> (and (forall ((i_1 Int) (j_1 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_1)) (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U j_1)) (not (= i_1 j_1)))) (not (= (|Seq#Index| (MapType0Select Heap@@9 a_2 array) i_1) (|Seq#Index| (MapType0Select Heap@@9 a_2 array) j_1))))
 :qid |stdinbpl.667:20|
 :skolemid |58|
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U i_1)) (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U j_1)))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U i_1)) (|Seq#Contains| (|Seq#Range| start end) (int_2_U j_1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_1)) (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U j_1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_1)) (|Seq#Contains| (|Seq#Range| start end) (int_2_U j_1)))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U i_1)) (|Seq#Index| (MapType0Select Heap@@9 a_2 array) j_1))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_1)) (|Seq#Index| (MapType0Select Heap@@9 a_2 array) j_1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U j_1)) (|Seq#Index| (MapType0Select Heap@@9 a_2 array) i_1))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U j_1)) (|Seq#Index| (MapType0Select Heap@@9 a_2 array) i_1))
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 a_2 array) i_1) (|Seq#Index| (MapType0Select Heap@@9 a_2 array) j_1))
)) (state Heap@@9 Mask@0)) (and (and (=> (= (ControlFlow 0 181) 177) anon71_Else_correct) (=> (= (ControlFlow 0 181) 11) anon72_Then_correct)) (=> (= (ControlFlow 0 181) 15) anon72_Else_correct)))))
(let ((anon3_correct true))
(let ((anon70_Else_correct  (=> (and (not (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U i@@6)) (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U j@@5)) (not (= i@@6 j@@5))))) (= (ControlFlow 0 9) 1)) anon3_correct)))
(let ((anon70_Then_correct  (=> (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U i@@6)) (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U j@@5)) (not (= i@@6 j@@5)))) (and (=> (= (ControlFlow 0 2) (- 0 8)) (HasDirectPerm Mask@0 a_2 array)) (=> (HasDirectPerm Mask@0 a_2 array) (and (=> (= (ControlFlow 0 2) (- 0 7)) (>= i@@6 0)) (=> (>= i@@6 0) (and (=> (= (ControlFlow 0 2) (- 0 6)) (< i@@6 (|Seq#Length| (MapType0Select Heap@@9 a_2 array)))) (=> (< i@@6 (|Seq#Length| (MapType0Select Heap@@9 a_2 array))) (and (=> (= (ControlFlow 0 2) (- 0 5)) (HasDirectPerm Mask@0 a_2 array)) (=> (HasDirectPerm Mask@0 a_2 array) (and (=> (= (ControlFlow 0 2) (- 0 4)) (>= j@@5 0)) (=> (>= j@@5 0) (and (=> (= (ControlFlow 0 2) (- 0 3)) (< j@@5 (|Seq#Length| (MapType0Select Heap@@9 a_2 array)))) (=> (< j@@5 (|Seq#Length| (MapType0Select Heap@@9 a_2 array))) (=> (= (ControlFlow 0 2) 1) anon3_correct))))))))))))))))
(let ((anon0_correct  (=> (state Heap@@9 ZeroMask) (=> (and (U_2_bool (MapType0Select Heap@@9 a_2 $allocated)) (not (= a_2 null))) (=> (and (and (and (state Heap@@9 ZeroMask) (> wildcard@0 NoPerm)) (and (not (= a_2 null)) (= Mask@0 (MapType1Store ZeroMask a_2 array (real_2_U (+ (U_2_real (MapType1Select ZeroMask a_2 array)) wildcard@0)))))) (and (and (state Heap@@9 Mask@0) (state Heap@@9 Mask@0)) (and (<= 0 start) (< start end)))) (and (=> (= (ControlFlow 0 182) (- 0 183)) (HasDirectPerm Mask@0 a_2 array)) (=> (HasDirectPerm Mask@0 a_2 array) (=> (and (and (< end (|Seq#Length| (MapType0Select Heap@@9 a_2 array))) (state Heap@@9 Mask@0)) (and (<= NoPerm kperm) (state Heap@@9 Mask@0))) (and (and (=> (= (ControlFlow 0 182) 181) anon69_Else_correct) (=> (= (ControlFlow 0 182) 2) anon70_Then_correct)) (=> (= (ControlFlow 0 182) 9) anon70_Else_correct))))))))))
(let ((PreconditionGeneratedEntry_correct  (=> (and (and (> wildcard NoPerm) true) (= (ControlFlow 0 184) 182)) anon0_correct)))
PreconditionGeneratedEntry_correct)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
))
(check-sat)
(pop 1)
; Valid
(get-info :rlimit)
