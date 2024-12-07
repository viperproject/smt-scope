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
 :qid |stdinbpl.385:18|
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
 :qid |stdinbpl.406:18|
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
 :qid |stdinbpl.361:18|
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
 :qid |stdinbpl.372:18|
 :skolemid |36|
 :pattern ( (|Seq#Length| (|Seq#Take| s@@2 n@@2)))
 :pattern ( (|Seq#Take| s@@2 n@@2) (|Seq#Length| s@@2))
)))
(assert (forall ((arg0@@31 Int) (arg1@@13 Int) ) (! (= (type (|Seq#Range| arg0@@31 arg1@@13)) (SeqType intType))
 :qid |funType:Seq#Range|
 :pattern ( (|Seq#Range| arg0@@31 arg1@@13))
)))
(assert (forall ((q@min Int) (q@max Int) (v@@0 T@U) ) (!  (=> (= (type v@@0) intType) (= (|Seq#Contains| (|Seq#Range| q@min q@max) v@@0)  (and (<= q@min (U_2_int v@@0)) (< (U_2_int v@@0) q@max))))
 :qid |stdinbpl.645:15|
 :skolemid |57|
 :pattern ( (|Seq#Contains| (|Seq#Range| q@min q@max) v@@0))
)))
(assert (forall ((s@@3 T@U) (x@@8 T@U) ) (! (let ((T@@7 (type x@@8)))
 (=> (and (= (type s@@3) (SeqType T@@7)) (|Seq#Contains| s@@3 x@@8)) (and (and (<= 0 (|Seq#Skolem| s@@3 x@@8)) (< (|Seq#Skolem| s@@3 x@@8) (|Seq#Length| s@@3))) (= (|Seq#Index| s@@3 (|Seq#Skolem| s@@3 x@@8)) x@@8))))
 :qid |stdinbpl.503:18|
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
 :qid |stdinbpl.487:18|
 :skolemid |45|
 :pattern ( (|Seq#Drop| s@@4 n@@3))
)))
(assert (forall ((i@@0 Int) (j@@0 Int) ) (! (= (|Seq#Sub| i@@0 j@@0) (- i@@0 j@@0))
 :qid |stdinbpl.341:15|
 :skolemid |30|
 :pattern ( (|Seq#Sub| i@@0 j@@0))
)))
(assert (forall ((i@@1 Int) (j@@1 Int) ) (! (= (|Seq#Add| i@@1 j@@1) (+ i@@1 j@@1))
 :qid |stdinbpl.339:15|
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
 :qid |stdinbpl.628:18|
 :skolemid |54|
 :pattern ( (|Seq#Contains| (|Seq#Singleton| x@@9) y@@1))
)))
(assert (forall ((s@@5 T@U) (n@@4 Int) (j@@2 Int) ) (! (let ((T@@11 (SeqTypeInv0 (type s@@5))))
 (=> (= (type s@@5) (SeqType T@@11)) (=> (and (and (<= 0 j@@2) (< j@@2 n@@4)) (< j@@2 (|Seq#Length| s@@5))) (= (|Seq#Index| (|Seq#Take| s@@5 n@@4) j@@2) (|Seq#Index| s@@5 j@@2)))))
 :qid |stdinbpl.380:18|
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
 :qid |stdinbpl.284:19|
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
 :qid |stdinbpl.352:18|
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
 :qid |stdinbpl.272:15|
 :skolemid |19|
 :pattern ( (ConditionalFrame p@@0 f_6))
)))
(assert (forall ((q@min@@0 Int) (q@max@@0 Int) (j@@3 Int) ) (!  (=> (and (<= 0 j@@3) (< j@@3 (- q@max@@0 q@min@@0))) (= (U_2_int (|Seq#Index| (|Seq#Range| q@min@@0 q@max@@0) j@@3)) (+ q@min@@0 j@@3)))
 :qid |stdinbpl.643:15|
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
 :qid |stdinbpl.321:18|
 :skolemid |26|
 :pattern ( (|Seq#Length| (|Seq#Append| s0@@0 s1@@0)))
)))
(assert (forall ((s@@6 T@U) (t T@U) (n@@6 Int) ) (! (let ((T@@17 (SeqTypeInv0 (type s@@6))))
 (=> (and (and (= (type s@@6) (SeqType T@@17)) (= (type t) (SeqType T@@17))) (and (> n@@6 0) (> n@@6 (|Seq#Length| s@@6)))) (and (= (|Seq#Add| (|Seq#Sub| n@@6 (|Seq#Length| s@@6)) (|Seq#Length| s@@6)) n@@6) (= (|Seq#Drop| (|Seq#Append| s@@6 t) n@@6) (|Seq#Drop| t (|Seq#Sub| n@@6 (|Seq#Length| s@@6)))))))
 :qid |stdinbpl.477:18|
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
 :qid |stdinbpl.464:18|
 :skolemid |42|
 :pattern ( (|Seq#Take| (|Seq#Append| s@@7 t@@0) n@@7))
)))
(assert (forall ((q@min@@1 Int) (q@max@@1 Int) ) (!  (and (=> (< q@min@@1 q@max@@1) (= (|Seq#Length| (|Seq#Range| q@min@@1 q@max@@1)) (- q@max@@1 q@min@@1))) (=> (<= q@max@@1 q@min@@1) (= (|Seq#Length| (|Seq#Range| q@min@@1 q@max@@1)) 0)))
 :qid |stdinbpl.642:15|
 :skolemid |55|
 :pattern ( (|Seq#Length| (|Seq#Range| q@min@@1 q@max@@1)))
)))
(assert (forall ((a T@U) (b T@U) ) (! (let ((T@@19 (SeqTypeInv0 (type a))))
 (=> (and (and (= (type a) (SeqType T@@19)) (= (type b) (SeqType T@@19))) (|Seq#Equal| a b)) (= a b)))
 :qid |stdinbpl.615:18|
 :skolemid |53|
 :pattern ( (|Seq#Equal| a b))
)))
(assert (forall ((s@@8 T@U) (i@@2 Int) ) (! (let ((T@@20 (SeqTypeInv0 (type s@@8))))
 (=> (= (type s@@8) (SeqType T@@20)) (=> (and (<= 0 i@@2) (< i@@2 (|Seq#Length| s@@8))) (|Seq#ContainsTrigger| s@@8 (|Seq#Index| s@@8 i@@2)))))
 :qid |stdinbpl.508:18|
 :skolemid |49|
 :pattern ( (|Seq#Index| s@@8 i@@2))
)))
(assert (forall ((s0@@1 T@U) (s1@@1 T@U) ) (! (let ((T@@21 (SeqTypeInv0 (type s0@@1))))
 (=> (and (= (type s0@@1) (SeqType T@@21)) (= (type s1@@1) (SeqType T@@21))) (and (=> (= s0@@1 (|Seq#Empty| T@@21)) (= (|Seq#Append| s0@@1 s1@@1) s1@@1)) (=> (= s1@@1 (|Seq#Empty| T@@21)) (= (|Seq#Append| s0@@1 s1@@1) s0@@1)))))
 :qid |stdinbpl.327:18|
 :skolemid |27|
 :pattern ( (|Seq#Append| s0@@1 s1@@1))
)))
(assert (forall ((t@@1 T@U) ) (! (= (|Seq#Index| (|Seq#Singleton| t@@1) 0) t@@1)
 :qid |stdinbpl.331:18|
 :skolemid |28|
 :pattern ( (|Seq#Singleton| t@@1))
)))
(assert (forall ((s@@9 T@U) ) (! (let ((T@@22 (SeqTypeInv0 (type s@@9))))
 (=> (= (type s@@9) (SeqType T@@22)) (<= 0 (|Seq#Length| s@@9))))
 :qid |stdinbpl.310:18|
 :skolemid |22|
 :pattern ( (|Seq#Length| s@@9))
)))
(assert (forall ((s0@@2 T@U) (s1@@2 T@U) ) (! (let ((T@@23 (SeqTypeInv0 (type s0@@2))))
 (=> (and (and (= (type s0@@2) (SeqType T@@23)) (= (type s1@@2) (SeqType T@@23))) (|Seq#Equal| s0@@2 s1@@2)) (and (= (|Seq#Length| s0@@2) (|Seq#Length| s1@@2)) (forall ((j@@4 Int) ) (!  (=> (and (<= 0 j@@4) (< j@@4 (|Seq#Length| s0@@2))) (= (|Seq#Index| s0@@2 j@@4) (|Seq#Index| s1@@2 j@@4)))
 :qid |stdinbpl.605:13|
 :skolemid |50|
 :pattern ( (|Seq#Index| s0@@2 j@@4))
 :pattern ( (|Seq#Index| s1@@2 j@@4))
)))))
 :qid |stdinbpl.602:18|
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
 :qid |stdinbpl.318:18|
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
 :qid |stdinbpl.460:18|
 :skolemid |41|
 :pattern ( (|Seq#Take| (|Seq#Append| s@@10 t@@3) n@@8))
)))
(assert (forall ((s@@11 T@U) (i@@3 Int) (v@@1 T@U) ) (! (let ((T@@25 (type v@@1)))
 (=> (= (type s@@11) (SeqType T@@25)) (=> (and (<= 0 i@@3) (< i@@3 (|Seq#Length| s@@11))) (= (|Seq#Length| (|Seq#Update| s@@11 i@@3 v@@1)) (|Seq#Length| s@@11)))))
 :qid |stdinbpl.359:18|
 :skolemid |34|
 :pattern ( (|Seq#Length| (|Seq#Update| s@@11 i@@3 v@@1)))
 :pattern ( (|Seq#Length| s@@11) (|Seq#Update| s@@11 i@@3 v@@1))
)))
(assert (forall ((s@@12 T@U) (t@@4 T@U) (n@@9 Int) ) (! (let ((T@@26 (SeqTypeInv0 (type s@@12))))
 (=> (and (and (= (type s@@12) (SeqType T@@26)) (= (type t@@4) (SeqType T@@26))) (and (< 0 n@@9) (<= n@@9 (|Seq#Length| s@@12)))) (= (|Seq#Drop| (|Seq#Append| s@@12 t@@4) n@@9) (|Seq#Append| (|Seq#Drop| s@@12 n@@9) t@@4))))
 :qid |stdinbpl.473:18|
 :skolemid |43|
 :pattern ( (|Seq#Drop| (|Seq#Append| s@@12 t@@4) n@@9))
)))
(assert (forall ((s@@13 T@U) (n@@10 Int) (i@@4 Int) ) (! (let ((T@@27 (SeqTypeInv0 (type s@@13))))
 (=> (= (type s@@13) (SeqType T@@27)) (=> (and (and (< 0 n@@10) (<= n@@10 i@@4)) (< i@@4 (|Seq#Length| s@@13))) (and (= (|Seq#Add| (|Seq#Sub| i@@4 n@@10) n@@10) i@@4) (= (|Seq#Index| (|Seq#Drop| s@@13 n@@10) (|Seq#Sub| i@@4 n@@10)) (|Seq#Index| s@@13 i@@4))))))
 :qid |stdinbpl.410:18|
 :skolemid |40|
 :pattern ( (|Seq#Drop| s@@13 n@@10) (|Seq#Index| s@@13 i@@4))
)))
(assert (forall ((s0@@3 T@U) (s1@@3 T@U) (n@@11 Int) ) (! (let ((T@@28 (SeqTypeInv0 (type s0@@3))))
 (=> (and (= (type s0@@3) (SeqType T@@28)) (= (type s1@@3) (SeqType T@@28))) (=> (and (and (and (not (= s0@@3 (|Seq#Empty| T@@28))) (not (= s1@@3 (|Seq#Empty| T@@28)))) (<= 0 n@@11)) (< n@@11 (|Seq#Length| s0@@3))) (= (|Seq#Index| (|Seq#Append| s0@@3 s1@@3) n@@11) (|Seq#Index| s0@@3 n@@11)))))
 :qid |stdinbpl.350:18|
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
 :qid |stdinbpl.355:18|
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
 :qid |stdinbpl.506:18|
 :skolemid |48|
 :pattern ( (|Seq#Contains| s@@14 x@@10) (|Seq#Index| s@@14 i@@5))
)))
(assert (forall ((s0@@5 T@U) (s1@@5 T@U) ) (! (let ((T@@31 (SeqTypeInv0 (type s0@@5))))
 (=> (and (= (type s0@@5) (SeqType T@@31)) (= (type s1@@5) (SeqType T@@31))) (or (or (and (= s0@@5 s1@@5) (|Seq#Equal| s0@@5 s1@@5)) (and (and (not (= s0@@5 s1@@5)) (not (|Seq#Equal| s0@@5 s1@@5))) (not (= (|Seq#Length| s0@@5) (|Seq#Length| s1@@5))))) (and (and (and (and (and (and (not (= s0@@5 s1@@5)) (not (|Seq#Equal| s0@@5 s1@@5))) (= (|Seq#Length| s0@@5) (|Seq#Length| s1@@5))) (= (|Seq#SkolemDiff| s0@@5 s1@@5) (|Seq#SkolemDiff| s1@@5 s0@@5))) (<= 0 (|Seq#SkolemDiff| s0@@5 s1@@5))) (< (|Seq#SkolemDiff| s0@@5 s1@@5) (|Seq#Length| s0@@5))) (not (= (|Seq#Index| s0@@5 (|Seq#SkolemDiff| s0@@5 s1@@5)) (|Seq#Index| s1@@5 (|Seq#SkolemDiff| s0@@5 s1@@5))))))))
 :qid |stdinbpl.610:18|
 :skolemid |52|
 :pattern ( (|Seq#Equal| s0@@5 s1@@5))
)))
(assert (forall ((p@@1 T@U) (v_1@@0 T@U) (q T@U) (w@@0 T@U) (r T@U) (u T@U) ) (! (let ((C@@3 (FieldTypeInv0 (type r))))
(let ((B@@10 (FieldTypeInv0 (type q))))
(let ((A@@11 (FieldTypeInv0 (type p@@1))))
 (=> (and (and (and (and (and (and (= (type p@@1) (FieldType A@@11 FrameTypeType)) (= (type v_1@@0) FrameTypeType)) (= (type q) (FieldType B@@10 FrameTypeType))) (= (type w@@0) FrameTypeType)) (= (type r) (FieldType C@@3 FrameTypeType))) (= (type u) FrameTypeType)) (and (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))) (InsidePredicate p@@1 v_1@@0 r u)))))
 :qid |stdinbpl.279:25|
 :skolemid |20|
 :pattern ( (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))
)))
(assert (forall ((s@@15 T@U) ) (! (let ((T@@32 (SeqTypeInv0 (type s@@15))))
 (=> (and (= (type s@@15) (SeqType T@@32)) (= (|Seq#Length| s@@15) 0)) (= s@@15 (|Seq#Empty| T@@32))))
 :qid |stdinbpl.314:18|
 :skolemid |24|
 :pattern ( (|Seq#Length| s@@15))
)))
(assert (forall ((s@@16 T@U) (n@@12 Int) ) (! (let ((T@@33 (SeqTypeInv0 (type s@@16))))
 (=> (and (= (type s@@16) (SeqType T@@33)) (<= n@@12 0)) (= (|Seq#Take| s@@16 n@@12) (|Seq#Empty| T@@33))))
 :qid |stdinbpl.489:18|
 :skolemid |46|
 :pattern ( (|Seq#Take| s@@16 n@@12))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun start () Int)
(declare-fun end () Int)
(declare-fun i_50 () Int)
(declare-fun QPMask@14 () T@U)
(declare-fun b_2 () T@U)
(declare-fun PostHeap@0 () T@U)
(declare-fun i_49 () Int)
(declare-fun j_15 () Int)
(declare-fun a_2 () T@U)
(declare-fun qpRange21 (T@U) Bool)
(declare-fun invRecv21 (T@U) Int)
(declare-fun PostMask@1 () T@U)
(declare-fun i_48 () Int)
(declare-fun i_47 () Int)
(declare-fun j_13 () Int)
(declare-fun wildcard@2 () Real)
(declare-fun PostMask@0 () T@U)
(declare-fun wildcard@3 () Real)
(declare-fun QPMask@1 () T@U)
(declare-fun Heap@@9 () T@U)
(declare-fun i_52 () Int)
(declare-fun QPMask@12 () T@U)
(declare-fun ExhaleHeap@0 () T@U)
(declare-fun qpRange27 (T@U) Bool)
(declare-fun invRecv27 (T@U) Int)
(declare-fun Mask@5 () T@U)
(declare-fun i_51 () Int)
(declare-fun wildcard@6 () Real)
(declare-fun Mask@4 () T@U)
(declare-fun QPMask@3 () T@U)
(declare-fun wildcard@7 () Real)
(declare-fun N@0 () Int)
(declare-fun I@0 () Int)
(declare-fun J@0 () Int)
(declare-fun middle () Int)
(declare-fun Heap@2 () T@U)
(declare-fun QPMask@5 () T@U)
(declare-fun N@1 () Int)
(declare-fun wildcard@14 () Real)
(declare-fun Mask@12 () T@U)
(declare-fun wildcard@15 () Real)
(declare-fun Mask@13 () T@U)
(declare-fun I@2 () Int)
(declare-fun J@2 () Int)
(declare-fun neverTriggered31 (Int) Bool)
(declare-fun qpRange31 (T@U) Bool)
(declare-fun invRecv31 (T@U) Int)
(declare-fun QPMask@10 () T@U)
(declare-fun neverTriggered32 (Int) Bool)
(declare-fun Heap@1 () T@U)
(declare-fun J@1 () Int)
(declare-fun Heap@0 () T@U)
(declare-fun I@1 () Int)
(declare-fun wildcard@8 () Real)
(declare-fun Mask@6 () T@U)
(declare-fun wildcard@9 () Real)
(declare-fun Mask@7 () T@U)
(declare-fun qpRange29 (T@U) Bool)
(declare-fun invRecv29 (T@U) Int)
(declare-fun QPMask@4 () T@U)
(declare-fun qpRange30 (T@U) Bool)
(declare-fun invRecv30 (T@U) Int)
(declare-fun i_15 () Int)
(declare-fun j_10 () Int)
(declare-fun neverTriggered24 (Int) Bool)
(declare-fun QPMask@8 () T@U)
(declare-fun neverTriggered23 (Int) Bool)
(declare-fun Mask@11 () T@U)
(declare-fun qpRange23 (T@U) Bool)
(declare-fun invRecv23 (T@U) Int)
(declare-fun i_12_1 () Int)
(declare-fun j_8 () Int)
(declare-fun wildcard@10 () Real)
(declare-fun Mask@8 () T@U)
(declare-fun wildcard@11 () Real)
(declare-fun Mask@9 () T@U)
(declare-fun qpRange33 (T@U) Bool)
(declare-fun invRecv33 (T@U) Int)
(declare-fun QPMask@6 () T@U)
(declare-fun qpRange34 (T@U) Bool)
(declare-fun invRecv34 (T@U) Int)
(declare-fun QPMask@7 () T@U)
(declare-fun wildcard@12 () Real)
(declare-fun Mask@10 () T@U)
(declare-fun wildcard@13 () Real)
(declare-fun wildcard@4 () Real)
(declare-fun Mask@2 () T@U)
(declare-fun wildcard@5 () Real)
(declare-fun Mask@3 () T@U)
(declare-fun neverTriggered25 (Int) Bool)
(declare-fun qpRange25 (T@U) Bool)
(declare-fun invRecv25 (T@U) Int)
(declare-fun QPMask@2 () T@U)
(declare-fun neverTriggered26 (Int) Bool)
(declare-fun qpRange26 (T@U) Bool)
(declare-fun invRecv26 (T@U) Int)
(declare-fun qpRange20 (T@U) Bool)
(declare-fun invRecv20 (T@U) Int)
(declare-fun QPMask@0 () T@U)
(declare-fun l_3 () Int)
(declare-fun i_46 () Int)
(declare-fun j_11 () Int)
(declare-fun qpRange19 (T@U) Bool)
(declare-fun invRecv19 (T@U) Int)
(declare-fun Mask@1 () T@U)
(declare-fun k_3 () Int)
(declare-fun i_41 () Int)
(declare-fun j_9 () Int)
(declare-fun wildcard@0 () Real)
(declare-fun Mask@0 () T@U)
(declare-fun wildcard@1 () Real)
(declare-fun wildcard () Real)
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (= (type Mask@1) (MapType1Type RefType realType)) (= (type a_2) RefType)) (= (type Heap@@9) (MapType0Type RefType))) (= (type QPMask@0) (MapType1Type RefType realType))) (= (type b_2) RefType)) (= (type ExhaleHeap@0) (MapType0Type RefType))) (= (type QPMask@8) (MapType1Type RefType realType))) (= (type Mask@11) (MapType1Type RefType realType))) (= (type QPMask@3) (MapType1Type RefType realType))) (= (type Mask@8) (MapType1Type RefType realType))) (= (type Mask@9) (MapType1Type RefType realType))) (= (type QPMask@6) (MapType1Type RefType realType))) (= (type QPMask@7) (MapType1Type RefType realType))) (= (type Mask@10) (MapType1Type RefType realType))) (= (type Heap@2) (MapType0Type RefType))) (= (type QPMask@5) (MapType1Type RefType realType))) (= (type Mask@12) (MapType1Type RefType realType))) (= (type Mask@13) (MapType1Type RefType realType))) (= (type QPMask@10) (MapType1Type RefType realType))) (= (type Heap@0) (MapType0Type RefType))) (= (type Heap@1) (MapType0Type RefType))) (= (type Mask@6) (MapType1Type RefType realType))) (= (type Mask@7) (MapType1Type RefType realType))) (= (type QPMask@4) (MapType1Type RefType realType))) (= (type Mask@5) (MapType1Type RefType realType))) (= (type QPMask@12) (MapType1Type RefType realType))) (= (type Mask@4) (MapType1Type RefType realType))) (= (type QPMask@1) (MapType1Type RefType realType))) (= (type Mask@2) (MapType1Type RefType realType))) (= (type Mask@3) (MapType1Type RefType realType))) (= (type QPMask@2) (MapType1Type RefType realType))) (= (type PostMask@1) (MapType1Type RefType realType))) (= (type PostHeap@0) (MapType0Type RefType))) (= (type QPMask@14) (MapType1Type RefType realType))) (= (type PostMask@0) (MapType1Type RefType realType))) (= (type Mask@0) (MapType1Type RefType realType))))
(set-info :boogie-vc-id merge)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 192) (let ((anon32_correct true))
(let ((anon76_Else_correct  (=> (and (not (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_50))) (= (ControlFlow 0 172) 167)) anon32_correct)))
(let ((anon76_Then_correct  (=> (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_50)) (and (=> (= (ControlFlow 0 168) (- 0 171)) (HasDirectPerm QPMask@14 b_2 array)) (=> (HasDirectPerm QPMask@14 b_2 array) (and (=> (= (ControlFlow 0 168) (- 0 170)) (>= i_50 0)) (=> (>= i_50 0) (and (=> (= (ControlFlow 0 168) (- 0 169)) (< i_50 (|Seq#Length| (MapType0Select PostHeap@0 b_2 array)))) (=> (< i_50 (|Seq#Length| (MapType0Select PostHeap@0 b_2 array))) (=> (= (ControlFlow 0 168) 167) anon32_correct))))))))))
(let ((anon75_Else_correct  (=> (= (ControlFlow 0 166) (- 0 165)) (forall ((i_11 Int) (i_11_1 Int) ) (!  (=> (and (and (and (and (not (= i_11 i_11_1)) (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_11))) (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_11_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| (MapType0Select PostHeap@0 b_2 array) i_11) (|Seq#Index| (MapType0Select PostHeap@0 b_2 array) i_11_1))))
 :qid |stdinbpl.2519:15|
 :skolemid |198|
)))))
(let ((anon73_Else_correct  (=> (and (forall ((i_9 Int) (j_7 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_9)) (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U j_7)) (not (= i_9 j_7)))) (not (= (|Seq#Index| (MapType0Select PostHeap@0 b_2 array) i_9) (|Seq#Index| (MapType0Select PostHeap@0 b_2 array) j_7))))
 :qid |stdinbpl.2499:20|
 :skolemid |197|
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U i_9)) (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U j_7)))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U i_9)) (|Seq#Contains| (|Seq#Range| start end) (int_2_U j_7)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_9)) (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U j_7)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_9)) (|Seq#Contains| (|Seq#Range| start end) (int_2_U j_7)))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U i_9)) (|Seq#Index| (MapType0Select PostHeap@0 b_2 array) j_7))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_9)) (|Seq#Index| (MapType0Select PostHeap@0 b_2 array) j_7))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U j_7)) (|Seq#Index| (MapType0Select PostHeap@0 b_2 array) i_9))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U j_7)) (|Seq#Index| (MapType0Select PostHeap@0 b_2 array) i_9))
 :pattern ( (|Seq#Index| (MapType0Select PostHeap@0 b_2 array) i_9) (|Seq#Index| (MapType0Select PostHeap@0 b_2 array) j_7))
)) (state PostHeap@0 QPMask@14)) (and (and (=> (= (ControlFlow 0 173) 166) anon75_Else_correct) (=> (= (ControlFlow 0 173) 168) anon76_Then_correct)) (=> (= (ControlFlow 0 173) 172) anon76_Else_correct)))))
(let ((anon28_correct true))
(let ((anon74_Else_correct  (=> (and (not (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_49)) (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U j_15)) (not (= i_49 j_15))))) (= (ControlFlow 0 164) 156)) anon28_correct)))
(let ((anon74_Then_correct  (=> (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_49)) (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U j_15)) (not (= i_49 j_15)))) (and (=> (= (ControlFlow 0 157) (- 0 163)) (HasDirectPerm QPMask@14 b_2 array)) (=> (HasDirectPerm QPMask@14 b_2 array) (and (=> (= (ControlFlow 0 157) (- 0 162)) (>= i_49 0)) (=> (>= i_49 0) (and (=> (= (ControlFlow 0 157) (- 0 161)) (< i_49 (|Seq#Length| (MapType0Select PostHeap@0 b_2 array)))) (=> (< i_49 (|Seq#Length| (MapType0Select PostHeap@0 b_2 array))) (and (=> (= (ControlFlow 0 157) (- 0 160)) (HasDirectPerm QPMask@14 b_2 array)) (=> (HasDirectPerm QPMask@14 b_2 array) (and (=> (= (ControlFlow 0 157) (- 0 159)) (>= j_15 0)) (=> (>= j_15 0) (and (=> (= (ControlFlow 0 157) (- 0 158)) (< j_15 (|Seq#Length| (MapType0Select PostHeap@0 b_2 array)))) (=> (< j_15 (|Seq#Length| (MapType0Select PostHeap@0 b_2 array))) (=> (= (ControlFlow 0 157) 156) anon28_correct))))))))))))))))
(let ((anon71_Else_correct  (and (=> (= (ControlFlow 0 174) (- 0 175)) (forall ((i_7 Int) (i_7_1 Int) ) (!  (=> (and (and (and (and (not (= i_7 i_7_1)) (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_7))) (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_7_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| (MapType0Select PostHeap@0 a_2 array) i_7) (|Seq#Index| (MapType0Select PostHeap@0 a_2 array) i_7_1))))
 :qid |stdinbpl.2447:15|
 :skolemid |191|
))) (=> (forall ((i_7@@0 Int) (i_7_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_7@@0 i_7_1@@0)) (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_7@@0))) (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_7_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| (MapType0Select PostHeap@0 a_2 array) i_7@@0) (|Seq#Index| (MapType0Select PostHeap@0 a_2 array) i_7_1@@0))))
 :qid |stdinbpl.2447:15|
 :skolemid |191|
)) (=> (forall ((i_7@@1 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_7@@1)) (< NoPerm FullPerm)) (and (qpRange21 (|Seq#Index| (MapType0Select PostHeap@0 a_2 array) i_7@@1)) (= (invRecv21 (|Seq#Index| (MapType0Select PostHeap@0 a_2 array) i_7@@1)) i_7@@1)))
 :qid |stdinbpl.2453:22|
 :skolemid |192|
 :pattern ( (|Seq#Index| (MapType0Select PostHeap@0 a_2 array) i_7@@1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U i_7@@1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_7@@1)))
 :pattern ( (|Seq#Index| (MapType0Select PostHeap@0 a_2 array) i_7@@1))
)) (=> (and (forall ((o_3 T@U) ) (!  (=> (= (type o_3) RefType) (=> (and (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U (invRecv21 o_3))) (< NoPerm FullPerm)) (qpRange21 o_3)) (= (|Seq#Index| (MapType0Select PostHeap@0 a_2 array) (invRecv21 o_3)) o_3)))
 :qid |stdinbpl.2457:22|
 :skolemid |193|
 :pattern ( (invRecv21 o_3))
)) (forall ((i_7@@2 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_7@@2)) (not (= (|Seq#Index| (MapType0Select PostHeap@0 a_2 array) i_7@@2) null)))
 :qid |stdinbpl.2463:22|
 :skolemid |194|
 :pattern ( (|Seq#Index| (MapType0Select PostHeap@0 a_2 array) i_7@@2))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U i_7@@2)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_7@@2)))
 :pattern ( (|Seq#Index| (MapType0Select PostHeap@0 a_2 array) i_7@@2))
))) (=> (and (and (forall ((o_3@@0 T@U) ) (!  (=> (= (type o_3@@0) RefType) (and (=> (and (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U (invRecv21 o_3@@0))) (< NoPerm FullPerm)) (qpRange21 o_3@@0)) (and (=> (< NoPerm FullPerm) (= (|Seq#Index| (MapType0Select PostHeap@0 a_2 array) (invRecv21 o_3@@0)) o_3@@0)) (= (U_2_real (MapType1Select QPMask@14 o_3@@0 value)) (+ (U_2_real (MapType1Select PostMask@1 o_3@@0 value)) FullPerm)))) (=> (not (and (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U (invRecv21 o_3@@0))) (< NoPerm FullPerm)) (qpRange21 o_3@@0))) (= (U_2_real (MapType1Select QPMask@14 o_3@@0 value)) (U_2_real (MapType1Select PostMask@1 o_3@@0 value))))))
 :qid |stdinbpl.2469:22|
 :skolemid |195|
 :pattern ( (MapType1Select QPMask@14 o_3@@0 value))
)) (forall ((o_3@@1 T@U) (f_5 T@U) ) (! (let ((B@@11 (FieldTypeInv1 (type f_5))))
(let ((A@@12 (FieldTypeInv0 (type f_5))))
 (=> (and (and (= (type o_3@@1) RefType) (= (type f_5) (FieldType A@@12 B@@11))) (not (= f_5 value))) (= (U_2_real (MapType1Select PostMask@1 o_3@@1 f_5)) (U_2_real (MapType1Select QPMask@14 o_3@@1 f_5))))))
 :qid |stdinbpl.2473:29|
 :skolemid |196|
 :pattern ( (MapType1Select PostMask@1 o_3@@1 f_5))
 :pattern ( (MapType1Select QPMask@14 o_3@@1 f_5))
))) (and (state PostHeap@0 QPMask@14) (state PostHeap@0 QPMask@14))) (and (and (=> (= (ControlFlow 0 174) 173) anon73_Else_correct) (=> (= (ControlFlow 0 174) 157) anon74_Then_correct)) (=> (= (ControlFlow 0 174) 164) anon74_Else_correct)))))))))
(let ((anon24_correct true))
(let ((anon72_Else_correct  (=> (and (not (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_48))) (= (ControlFlow 0 155) 150)) anon24_correct)))
(let ((anon72_Then_correct  (=> (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_48)) (and (=> (= (ControlFlow 0 151) (- 0 154)) (HasDirectPerm PostMask@1 a_2 array)) (=> (HasDirectPerm PostMask@1 a_2 array) (and (=> (= (ControlFlow 0 151) (- 0 153)) (>= i_48 0)) (=> (>= i_48 0) (and (=> (= (ControlFlow 0 151) (- 0 152)) (< i_48 (|Seq#Length| (MapType0Select PostHeap@0 a_2 array)))) (=> (< i_48 (|Seq#Length| (MapType0Select PostHeap@0 a_2 array))) (=> (= (ControlFlow 0 151) 150) anon24_correct))))))))))
(let ((anon69_Else_correct  (=> (and (forall ((i_5 Int) (j_5 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_5)) (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U j_5)) (not (= i_5 j_5)))) (not (= (|Seq#Index| (MapType0Select PostHeap@0 a_2 array) i_5) (|Seq#Index| (MapType0Select PostHeap@0 a_2 array) j_5))))
 :qid |stdinbpl.2427:20|
 :skolemid |190|
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U i_5)) (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U j_5)))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U i_5)) (|Seq#Contains| (|Seq#Range| start end) (int_2_U j_5)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_5)) (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U j_5)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_5)) (|Seq#Contains| (|Seq#Range| start end) (int_2_U j_5)))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U i_5)) (|Seq#Index| (MapType0Select PostHeap@0 a_2 array) j_5))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_5)) (|Seq#Index| (MapType0Select PostHeap@0 a_2 array) j_5))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U j_5)) (|Seq#Index| (MapType0Select PostHeap@0 a_2 array) i_5))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U j_5)) (|Seq#Index| (MapType0Select PostHeap@0 a_2 array) i_5))
 :pattern ( (|Seq#Index| (MapType0Select PostHeap@0 a_2 array) i_5) (|Seq#Index| (MapType0Select PostHeap@0 a_2 array) j_5))
)) (state PostHeap@0 PostMask@1)) (and (and (=> (= (ControlFlow 0 176) 174) anon71_Else_correct) (=> (= (ControlFlow 0 176) 151) anon72_Then_correct)) (=> (= (ControlFlow 0 176) 155) anon72_Else_correct)))))
(let ((anon20_correct true))
(let ((anon70_Else_correct  (=> (and (not (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_47)) (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U j_13)) (not (= i_47 j_13))))) (= (ControlFlow 0 149) 141)) anon20_correct)))
(let ((anon70_Then_correct  (=> (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_47)) (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U j_13)) (not (= i_47 j_13)))) (and (=> (= (ControlFlow 0 142) (- 0 148)) (HasDirectPerm PostMask@1 a_2 array)) (=> (HasDirectPerm PostMask@1 a_2 array) (and (=> (= (ControlFlow 0 142) (- 0 147)) (>= i_47 0)) (=> (>= i_47 0) (and (=> (= (ControlFlow 0 142) (- 0 146)) (< i_47 (|Seq#Length| (MapType0Select PostHeap@0 a_2 array)))) (=> (< i_47 (|Seq#Length| (MapType0Select PostHeap@0 a_2 array))) (and (=> (= (ControlFlow 0 142) (- 0 145)) (HasDirectPerm PostMask@1 a_2 array)) (=> (HasDirectPerm PostMask@1 a_2 array) (and (=> (= (ControlFlow 0 142) (- 0 144)) (>= j_13 0)) (=> (>= j_13 0) (and (=> (= (ControlFlow 0 142) (- 0 143)) (< j_13 (|Seq#Length| (MapType0Select PostHeap@0 a_2 array)))) (=> (< j_13 (|Seq#Length| (MapType0Select PostHeap@0 a_2 array))) (=> (= (ControlFlow 0 142) 141) anon20_correct))))))))))))))))
(let ((anon68_Then_correct  (=> (state PostHeap@0 ZeroMask) (=> (and (> wildcard@2 NoPerm) (not (= a_2 null))) (=> (and (and (and (= PostMask@0 (MapType1Store ZeroMask a_2 array (real_2_U (+ (U_2_real (MapType1Select ZeroMask a_2 array)) wildcard@2)))) (state PostHeap@0 PostMask@0)) (and (state PostHeap@0 PostMask@0) (> wildcard@3 NoPerm))) (and (and (not (= b_2 null)) (= PostMask@1 (MapType1Store PostMask@0 b_2 array (real_2_U (+ (U_2_real (MapType1Select PostMask@0 b_2 array)) wildcard@3))))) (and (state PostHeap@0 PostMask@1) (state PostHeap@0 PostMask@1)))) (and (=> (= (ControlFlow 0 177) (- 0 181)) (HasDirectPerm PostMask@1 a_2 array)) (=> (HasDirectPerm PostMask@1 a_2 array) (and (=> (= (ControlFlow 0 177) (- 0 180)) (HasDirectPerm QPMask@1 a_2 array)) (=> (HasDirectPerm QPMask@1 a_2 array) (=> (and (|Seq#Equal| (MapType0Select PostHeap@0 a_2 array) (MapType0Select Heap@@9 a_2 array)) (state PostHeap@0 PostMask@1)) (and (=> (= (ControlFlow 0 177) (- 0 179)) (HasDirectPerm PostMask@1 b_2 array)) (=> (HasDirectPerm PostMask@1 b_2 array) (and (=> (= (ControlFlow 0 177) (- 0 178)) (HasDirectPerm QPMask@1 b_2 array)) (=> (HasDirectPerm QPMask@1 b_2 array) (=> (and (|Seq#Equal| (MapType0Select PostHeap@0 b_2 array) (MapType0Select Heap@@9 b_2 array)) (state PostHeap@0 PostMask@1)) (and (and (=> (= (ControlFlow 0 177) 176) anon69_Else_correct) (=> (= (ControlFlow 0 177) 142) anon70_Then_correct)) (=> (= (ControlFlow 0 177) 149) anon70_Else_correct)))))))))))))))))
(let ((anon42_correct true))
(let ((anon81_Else_correct  (=> (and (not (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_52))) (= (ControlFlow 0 113) 108)) anon42_correct)))
(let ((anon81_Then_correct  (=> (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_52)) (and (=> (= (ControlFlow 0 109) (- 0 112)) (HasDirectPerm QPMask@12 b_2 array)) (=> (HasDirectPerm QPMask@12 b_2 array) (and (=> (= (ControlFlow 0 109) (- 0 111)) (>= i_52 0)) (=> (>= i_52 0) (and (=> (= (ControlFlow 0 109) (- 0 110)) (< i_52 (|Seq#Length| (MapType0Select ExhaleHeap@0 b_2 array)))) (=> (< i_52 (|Seq#Length| (MapType0Select ExhaleHeap@0 b_2 array))) (=> (= (ControlFlow 0 109) 108) anon42_correct))))))))))
(let ((anon80_Else_correct  (=> (= (ControlFlow 0 107) (- 0 106)) (forall ((i_23 Int) (i_23_1 Int) ) (!  (=> (and (and (and (and (not (= i_23 i_23_1)) (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_23))) (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_23_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| (MapType0Select ExhaleHeap@0 b_2 array) i_23) (|Seq#Index| (MapType0Select ExhaleHeap@0 b_2 array) i_23_1))))
 :qid |stdinbpl.2812:19|
 :skolemid |222|
)))))
(let ((anon78_Else_correct  (and (=> (= (ControlFlow 0 114) (- 0 115)) (forall ((i_21 Int) (i_21_1 Int) ) (!  (=> (and (and (and (and (not (= i_21 i_21_1)) (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_21))) (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_21_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| (MapType0Select ExhaleHeap@0 a_2 array) i_21) (|Seq#Index| (MapType0Select ExhaleHeap@0 a_2 array) i_21_1))))
 :qid |stdinbpl.2764:19|
 :skolemid |216|
))) (=> (forall ((i_21@@0 Int) (i_21_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_21@@0 i_21_1@@0)) (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_21@@0))) (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_21_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| (MapType0Select ExhaleHeap@0 a_2 array) i_21@@0) (|Seq#Index| (MapType0Select ExhaleHeap@0 a_2 array) i_21_1@@0))))
 :qid |stdinbpl.2764:19|
 :skolemid |216|
)) (=> (forall ((i_21@@1 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_21@@1)) (< NoPerm FullPerm)) (and (qpRange27 (|Seq#Index| (MapType0Select ExhaleHeap@0 a_2 array) i_21@@1)) (= (invRecv27 (|Seq#Index| (MapType0Select ExhaleHeap@0 a_2 array) i_21@@1)) i_21@@1)))
 :qid |stdinbpl.2770:26|
 :skolemid |217|
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@0 a_2 array) i_21@@1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U i_21@@1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_21@@1)))
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@0 a_2 array) i_21@@1))
)) (=> (and (forall ((o_3@@2 T@U) ) (!  (=> (= (type o_3@@2) RefType) (=> (and (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U (invRecv27 o_3@@2))) (< NoPerm FullPerm)) (qpRange27 o_3@@2)) (= (|Seq#Index| (MapType0Select ExhaleHeap@0 a_2 array) (invRecv27 o_3@@2)) o_3@@2)))
 :qid |stdinbpl.2774:26|
 :skolemid |218|
 :pattern ( (invRecv27 o_3@@2))
)) (forall ((i_21@@2 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_21@@2)) (not (= (|Seq#Index| (MapType0Select ExhaleHeap@0 a_2 array) i_21@@2) null)))
 :qid |stdinbpl.2780:26|
 :skolemid |219|
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@0 a_2 array) i_21@@2))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U i_21@@2)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_21@@2)))
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@0 a_2 array) i_21@@2))
))) (=> (and (and (forall ((o_3@@3 T@U) ) (!  (=> (= (type o_3@@3) RefType) (and (=> (and (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U (invRecv27 o_3@@3))) (< NoPerm FullPerm)) (qpRange27 o_3@@3)) (and (=> (< NoPerm FullPerm) (= (|Seq#Index| (MapType0Select ExhaleHeap@0 a_2 array) (invRecv27 o_3@@3)) o_3@@3)) (= (U_2_real (MapType1Select QPMask@12 o_3@@3 value)) (+ (U_2_real (MapType1Select Mask@5 o_3@@3 value)) FullPerm)))) (=> (not (and (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U (invRecv27 o_3@@3))) (< NoPerm FullPerm)) (qpRange27 o_3@@3))) (= (U_2_real (MapType1Select QPMask@12 o_3@@3 value)) (U_2_real (MapType1Select Mask@5 o_3@@3 value))))))
 :qid |stdinbpl.2786:26|
 :skolemid |220|
 :pattern ( (MapType1Select QPMask@12 o_3@@3 value))
)) (forall ((o_3@@4 T@U) (f_5@@0 T@U) ) (! (let ((B@@12 (FieldTypeInv1 (type f_5@@0))))
(let ((A@@13 (FieldTypeInv0 (type f_5@@0))))
 (=> (and (and (= (type o_3@@4) RefType) (= (type f_5@@0) (FieldType A@@13 B@@12))) (not (= f_5@@0 value))) (= (U_2_real (MapType1Select Mask@5 o_3@@4 f_5@@0)) (U_2_real (MapType1Select QPMask@12 o_3@@4 f_5@@0))))))
 :qid |stdinbpl.2790:33|
 :skolemid |221|
 :pattern ( (MapType1Select Mask@5 o_3@@4 f_5@@0))
 :pattern ( (MapType1Select QPMask@12 o_3@@4 f_5@@0))
))) (and (state ExhaleHeap@0 QPMask@12) (state ExhaleHeap@0 QPMask@12))) (and (and (=> (= (ControlFlow 0 114) 107) anon80_Else_correct) (=> (= (ControlFlow 0 114) 109) anon81_Then_correct)) (=> (= (ControlFlow 0 114) 113) anon81_Else_correct)))))))))
(let ((anon38_correct true))
(let ((anon79_Else_correct  (=> (and (not (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_51))) (= (ControlFlow 0 105) 100)) anon38_correct)))
(let ((anon79_Then_correct  (=> (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_51)) (and (=> (= (ControlFlow 0 101) (- 0 104)) (HasDirectPerm Mask@5 a_2 array)) (=> (HasDirectPerm Mask@5 a_2 array) (and (=> (= (ControlFlow 0 101) (- 0 103)) (>= i_51 0)) (=> (>= i_51 0) (and (=> (= (ControlFlow 0 101) (- 0 102)) (< i_51 (|Seq#Length| (MapType0Select ExhaleHeap@0 a_2 array)))) (=> (< i_51 (|Seq#Length| (MapType0Select ExhaleHeap@0 a_2 array))) (=> (= (ControlFlow 0 101) 100) anon38_correct))))))))))
(let ((anon77_Then_correct  (=> (> wildcard@6 NoPerm) (=> (and (not (= a_2 null)) (= Mask@4 (MapType1Store QPMask@3 a_2 array (real_2_U (+ (U_2_real (MapType1Select QPMask@3 a_2 array)) wildcard@6))))) (=> (and (and (and (state ExhaleHeap@0 Mask@4) (state ExhaleHeap@0 Mask@4)) (and (> wildcard@7 NoPerm) (not (= b_2 null)))) (and (and (= Mask@5 (MapType1Store Mask@4 b_2 array (real_2_U (+ (U_2_real (MapType1Select Mask@4 b_2 array)) wildcard@7)))) (state ExhaleHeap@0 Mask@5)) (and (state ExhaleHeap@0 Mask@5) (<= 0 start)))) (and (=> (= (ControlFlow 0 116) (- 0 123)) (HasDirectPerm Mask@5 a_2 array)) (=> (HasDirectPerm Mask@5 a_2 array) (=> (<= end (|Seq#Length| (MapType0Select ExhaleHeap@0 a_2 array))) (=> (and (state ExhaleHeap@0 Mask@5) (= N@0 (- (+ I@0 J@0) middle))) (=> (and (and (and (<= 0 start) (state ExhaleHeap@0 Mask@5)) (and (<= start I@0) (state ExhaleHeap@0 Mask@5))) (and (and (<= middle J@0) (state ExhaleHeap@0 Mask@5)) (and (<= J@0 end) (state ExhaleHeap@0 Mask@5)))) (and (=> (= (ControlFlow 0 116) (- 0 122)) (HasDirectPerm Mask@5 a_2 array)) (=> (HasDirectPerm Mask@5 a_2 array) (and (=> (= (ControlFlow 0 116) (- 0 121)) (HasDirectPerm Mask@5 b_2 array)) (=> (HasDirectPerm Mask@5 b_2 array) (=> (and (= (|Seq#Length| (MapType0Select ExhaleHeap@0 a_2 array)) (|Seq#Length| (MapType0Select ExhaleHeap@0 b_2 array))) (state ExhaleHeap@0 Mask@5)) (and (=> (= (ControlFlow 0 116) (- 0 120)) (HasDirectPerm Mask@5 a_2 array)) (=> (HasDirectPerm Mask@5 a_2 array) (and (=> (= (ControlFlow 0 116) (- 0 119)) (HasDirectPerm QPMask@1 a_2 array)) (=> (HasDirectPerm QPMask@1 a_2 array) (=> (and (|Seq#Equal| (MapType0Select ExhaleHeap@0 a_2 array) (MapType0Select Heap@@9 a_2 array)) (state ExhaleHeap@0 Mask@5)) (and (=> (= (ControlFlow 0 116) (- 0 118)) (HasDirectPerm Mask@5 b_2 array)) (=> (HasDirectPerm Mask@5 b_2 array) (and (=> (= (ControlFlow 0 116) (- 0 117)) (HasDirectPerm QPMask@1 b_2 array)) (=> (HasDirectPerm QPMask@1 b_2 array) (=> (and (|Seq#Equal| (MapType0Select ExhaleHeap@0 b_2 array) (MapType0Select Heap@@9 b_2 array)) (state ExhaleHeap@0 Mask@5)) (and (and (=> (= (ControlFlow 0 116) 114) anon78_Else_correct) (=> (= (ControlFlow 0 116) 101) anon79_Then_correct)) (=> (= (ControlFlow 0 116) 105) anon79_Else_correct)))))))))))))))))))))))))))
(let ((anon50_correct  (=> (state Heap@2 QPMask@5) (=> (and (= N@1 (+ N@0 1)) (state Heap@2 QPMask@5)) (and (=> (= (ControlFlow 0 53) (- 0 68)) (> (U_2_real (MapType1Select QPMask@5 a_2 array)) NoPerm)) (=> (> (U_2_real (MapType1Select QPMask@5 a_2 array)) NoPerm) (=> (> wildcard@14 NoPerm) (=> (and (< wildcard@14 (U_2_real (MapType1Select QPMask@5 a_2 array))) (= Mask@12 (MapType1Store QPMask@5 a_2 array (real_2_U (- (U_2_real (MapType1Select QPMask@5 a_2 array)) wildcard@14))))) (and (=> (= (ControlFlow 0 53) (- 0 67)) (> (U_2_real (MapType1Select Mask@12 b_2 array)) NoPerm)) (=> (> (U_2_real (MapType1Select Mask@12 b_2 array)) NoPerm) (=> (> wildcard@15 NoPerm) (=> (and (< wildcard@15 (U_2_real (MapType1Select Mask@12 b_2 array))) (= Mask@13 (MapType1Store Mask@12 b_2 array (real_2_U (- (U_2_real (MapType1Select Mask@12 b_2 array)) wildcard@15))))) (and (=> (= (ControlFlow 0 53) (- 0 66)) (<= 0 start)) (=> (<= 0 start) (and (=> (= (ControlFlow 0 53) (- 0 65)) (<= end (|Seq#Length| (MapType0Select Heap@2 a_2 array)))) (=> (<= end (|Seq#Length| (MapType0Select Heap@2 a_2 array))) (and (=> (= (ControlFlow 0 53) (- 0 64)) (= N@1 (- (+ I@2 J@2) middle))) (=> (= N@1 (- (+ I@2 J@2) middle)) (and (=> (= (ControlFlow 0 53) (- 0 63)) (<= 0 start)) (=> (<= 0 start) (and (=> (= (ControlFlow 0 53) (- 0 62)) (<= start I@2)) (=> (<= start I@2) (and (=> (= (ControlFlow 0 53) (- 0 61)) (<= middle J@2)) (=> (<= middle J@2) (and (=> (= (ControlFlow 0 53) (- 0 60)) (<= J@2 end)) (=> (<= J@2 end) (and (=> (= (ControlFlow 0 53) (- 0 59)) (= (|Seq#Length| (MapType0Select Heap@2 a_2 array)) (|Seq#Length| (MapType0Select Heap@2 b_2 array)))) (=> (= (|Seq#Length| (MapType0Select Heap@2 a_2 array)) (|Seq#Length| (MapType0Select Heap@2 b_2 array))) (and (=> (= (ControlFlow 0 53) (- 0 58)) (|Seq#Equal| (MapType0Select Heap@2 a_2 array) (MapType0Select Heap@@9 a_2 array))) (=> (|Seq#Equal| (MapType0Select Heap@2 a_2 array) (MapType0Select Heap@@9 a_2 array)) (and (=> (= (ControlFlow 0 53) (- 0 57)) (|Seq#Equal| (MapType0Select Heap@2 b_2 array) (MapType0Select Heap@@9 b_2 array))) (=> (|Seq#Equal| (MapType0Select Heap@2 b_2 array) (MapType0Select Heap@@9 b_2 array)) (and (=> (= (ControlFlow 0 53) (- 0 56)) (forall ((i_26 Int) (i_26_1 Int) ) (!  (=> (and (and (and (and (not (= i_26 i_26_1)) (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_26))) (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_26_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| (MapType0Select Heap@2 a_2 array) i_26) (|Seq#Index| (MapType0Select Heap@2 a_2 array) i_26_1))))
 :qid |stdinbpl.3076:21|
 :skolemid |240|
 :pattern ( (neverTriggered31 i_26) (neverTriggered31 i_26_1))
))) (=> (forall ((i_26@@0 Int) (i_26_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_26@@0 i_26_1@@0)) (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_26@@0))) (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_26_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| (MapType0Select Heap@2 a_2 array) i_26@@0) (|Seq#Index| (MapType0Select Heap@2 a_2 array) i_26_1@@0))))
 :qid |stdinbpl.3076:21|
 :skolemid |240|
 :pattern ( (neverTriggered31 i_26@@0) (neverTriggered31 i_26_1@@0))
)) (and (=> (= (ControlFlow 0 53) (- 0 55)) (forall ((i_26@@1 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_26@@1)) (>= (U_2_real (MapType1Select Mask@13 (|Seq#Index| (MapType0Select Heap@2 a_2 array) i_26@@1) value)) FullPerm))
 :qid |stdinbpl.3083:21|
 :skolemid |241|
 :pattern ( (|Seq#Index| (MapType0Select Heap@2 a_2 array) i_26@@1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U i_26@@1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_26@@1)))
 :pattern ( (|Seq#Index| (MapType0Select Heap@2 a_2 array) i_26@@1))
))) (=> (forall ((i_26@@2 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_26@@2)) (>= (U_2_real (MapType1Select Mask@13 (|Seq#Index| (MapType0Select Heap@2 a_2 array) i_26@@2) value)) FullPerm))
 :qid |stdinbpl.3083:21|
 :skolemid |241|
 :pattern ( (|Seq#Index| (MapType0Select Heap@2 a_2 array) i_26@@2))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U i_26@@2)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_26@@2)))
 :pattern ( (|Seq#Index| (MapType0Select Heap@2 a_2 array) i_26@@2))
)) (=> (and (and (forall ((i_26@@3 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_26@@3)) (< NoPerm FullPerm)) (and (qpRange31 (|Seq#Index| (MapType0Select Heap@2 a_2 array) i_26@@3)) (= (invRecv31 (|Seq#Index| (MapType0Select Heap@2 a_2 array) i_26@@3)) i_26@@3)))
 :qid |stdinbpl.3089:26|
 :skolemid |242|
 :pattern ( (|Seq#Index| (MapType0Select Heap@2 a_2 array) i_26@@3))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U i_26@@3)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_26@@3)))
 :pattern ( (|Seq#Index| (MapType0Select Heap@2 a_2 array) i_26@@3))
)) (forall ((o_3@@5 T@U) ) (!  (=> (= (type o_3@@5) RefType) (=> (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U (invRecv31 o_3@@5))) (and (< NoPerm FullPerm) (qpRange31 o_3@@5))) (= (|Seq#Index| (MapType0Select Heap@2 a_2 array) (invRecv31 o_3@@5)) o_3@@5)))
 :qid |stdinbpl.3093:26|
 :skolemid |243|
 :pattern ( (invRecv31 o_3@@5))
))) (and (forall ((o_3@@6 T@U) ) (!  (=> (= (type o_3@@6) RefType) (and (=> (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U (invRecv31 o_3@@6))) (and (< NoPerm FullPerm) (qpRange31 o_3@@6))) (and (= (|Seq#Index| (MapType0Select Heap@2 a_2 array) (invRecv31 o_3@@6)) o_3@@6) (= (U_2_real (MapType1Select QPMask@10 o_3@@6 value)) (- (U_2_real (MapType1Select Mask@13 o_3@@6 value)) FullPerm)))) (=> (not (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U (invRecv31 o_3@@6))) (and (< NoPerm FullPerm) (qpRange31 o_3@@6)))) (= (U_2_real (MapType1Select QPMask@10 o_3@@6 value)) (U_2_real (MapType1Select Mask@13 o_3@@6 value))))))
 :qid |stdinbpl.3099:26|
 :skolemid |244|
 :pattern ( (MapType1Select QPMask@10 o_3@@6 value))
)) (forall ((o_3@@7 T@U) (f_5@@1 T@U) ) (! (let ((B@@13 (FieldTypeInv1 (type f_5@@1))))
(let ((A@@14 (FieldTypeInv0 (type f_5@@1))))
 (=> (and (and (= (type o_3@@7) RefType) (= (type f_5@@1) (FieldType A@@14 B@@13))) (not (= f_5@@1 value))) (= (U_2_real (MapType1Select Mask@13 o_3@@7 f_5@@1)) (U_2_real (MapType1Select QPMask@10 o_3@@7 f_5@@1))))))
 :qid |stdinbpl.3105:33|
 :skolemid |245|
 :pattern ( (MapType1Select QPMask@10 o_3@@7 f_5@@1))
)))) (and (=> (= (ControlFlow 0 53) (- 0 54)) (forall ((i_27 Int) (i_27_1 Int) ) (!  (=> (and (and (and (and (not (= i_27 i_27_1)) (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_27))) (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_27_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| (MapType0Select Heap@2 b_2 array) i_27) (|Seq#Index| (MapType0Select Heap@2 b_2 array) i_27_1))))
 :qid |stdinbpl.3117:21|
 :skolemid |246|
 :pattern ( (neverTriggered32 i_27) (neverTriggered32 i_27_1))
))) (=> (forall ((i_27@@0 Int) (i_27_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_27@@0 i_27_1@@0)) (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_27@@0))) (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_27_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| (MapType0Select Heap@2 b_2 array) i_27@@0) (|Seq#Index| (MapType0Select Heap@2 b_2 array) i_27_1@@0))))
 :qid |stdinbpl.3117:21|
 :skolemid |246|
 :pattern ( (neverTriggered32 i_27@@0) (neverTriggered32 i_27_1@@0))
)) (=> (= (ControlFlow 0 53) (- 0 52)) (forall ((i_27@@1 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_27@@1)) (>= (U_2_real (MapType1Select QPMask@10 (|Seq#Index| (MapType0Select Heap@2 b_2 array) i_27@@1) value)) FullPerm))
 :qid |stdinbpl.3124:21|
 :skolemid |247|
 :pattern ( (|Seq#Index| (MapType0Select Heap@2 b_2 array) i_27@@1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U i_27@@1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_27@@1)))
 :pattern ( (|Seq#Index| (MapType0Select Heap@2 b_2 array) i_27@@1))
))))))))))))))))))))))))))))))))))))))))))
(let ((anon84_Else_correct  (=> (not (or (= J@0 end) (< (U_2_int (MapType0Select ExhaleHeap@0 (|Seq#Index| (MapType0Select ExhaleHeap@0 a_2 array) I@0) value)) (U_2_int (MapType0Select ExhaleHeap@0 (|Seq#Index| (MapType0Select ExhaleHeap@0 a_2 array) J@0) value))))) (and (=> (= (ControlFlow 0 78) (- 0 86)) (HasDirectPerm QPMask@5 b_2 array)) (=> (HasDirectPerm QPMask@5 b_2 array) (and (=> (= (ControlFlow 0 78) (- 0 85)) (>= N@0 0)) (=> (>= N@0 0) (and (=> (= (ControlFlow 0 78) (- 0 84)) (< N@0 (|Seq#Length| (MapType0Select ExhaleHeap@0 b_2 array)))) (=> (< N@0 (|Seq#Length| (MapType0Select ExhaleHeap@0 b_2 array))) (and (=> (= (ControlFlow 0 78) (- 0 83)) (HasDirectPerm QPMask@5 a_2 array)) (=> (HasDirectPerm QPMask@5 a_2 array) (and (=> (= (ControlFlow 0 78) (- 0 82)) (>= J@0 0)) (=> (>= J@0 0) (and (=> (= (ControlFlow 0 78) (- 0 81)) (< J@0 (|Seq#Length| (MapType0Select ExhaleHeap@0 a_2 array)))) (=> (< J@0 (|Seq#Length| (MapType0Select ExhaleHeap@0 a_2 array))) (and (=> (= (ControlFlow 0 78) (- 0 80)) (HasDirectPerm QPMask@5 (|Seq#Index| (MapType0Select ExhaleHeap@0 a_2 array) J@0) value)) (=> (HasDirectPerm QPMask@5 (|Seq#Index| (MapType0Select ExhaleHeap@0 a_2 array) J@0) value) (and (=> (= (ControlFlow 0 78) (- 0 79)) (= FullPerm (U_2_real (MapType1Select QPMask@5 (|Seq#Index| (MapType0Select ExhaleHeap@0 b_2 array) N@0) value)))) (=> (= FullPerm (U_2_real (MapType1Select QPMask@5 (|Seq#Index| (MapType0Select ExhaleHeap@0 b_2 array) N@0) value))) (=> (and (and (and (= Heap@1 (MapType0Store ExhaleHeap@0 (|Seq#Index| (MapType0Select ExhaleHeap@0 b_2 array) N@0) value (MapType0Select ExhaleHeap@0 (|Seq#Index| (MapType0Select ExhaleHeap@0 a_2 array) J@0) value))) (state Heap@1 QPMask@5)) (and (= J@1 (+ J@0 1)) (state Heap@1 QPMask@5))) (and (and (= I@2 I@0) (= J@2 J@1)) (and (= Heap@2 Heap@1) (= (ControlFlow 0 78) 53)))) anon50_correct))))))))))))))))))))
(let ((anon84_Then_correct  (=> (or (= J@0 end) (< (U_2_int (MapType0Select ExhaleHeap@0 (|Seq#Index| (MapType0Select ExhaleHeap@0 a_2 array) I@0) value)) (U_2_int (MapType0Select ExhaleHeap@0 (|Seq#Index| (MapType0Select ExhaleHeap@0 a_2 array) J@0) value)))) (and (=> (= (ControlFlow 0 69) (- 0 77)) (HasDirectPerm QPMask@5 b_2 array)) (=> (HasDirectPerm QPMask@5 b_2 array) (and (=> (= (ControlFlow 0 69) (- 0 76)) (>= N@0 0)) (=> (>= N@0 0) (and (=> (= (ControlFlow 0 69) (- 0 75)) (< N@0 (|Seq#Length| (MapType0Select ExhaleHeap@0 b_2 array)))) (=> (< N@0 (|Seq#Length| (MapType0Select ExhaleHeap@0 b_2 array))) (and (=> (= (ControlFlow 0 69) (- 0 74)) (HasDirectPerm QPMask@5 a_2 array)) (=> (HasDirectPerm QPMask@5 a_2 array) (and (=> (= (ControlFlow 0 69) (- 0 73)) (>= I@0 0)) (=> (>= I@0 0) (and (=> (= (ControlFlow 0 69) (- 0 72)) (< I@0 (|Seq#Length| (MapType0Select ExhaleHeap@0 a_2 array)))) (=> (< I@0 (|Seq#Length| (MapType0Select ExhaleHeap@0 a_2 array))) (and (=> (= (ControlFlow 0 69) (- 0 71)) (HasDirectPerm QPMask@5 (|Seq#Index| (MapType0Select ExhaleHeap@0 a_2 array) I@0) value)) (=> (HasDirectPerm QPMask@5 (|Seq#Index| (MapType0Select ExhaleHeap@0 a_2 array) I@0) value) (and (=> (= (ControlFlow 0 69) (- 0 70)) (= FullPerm (U_2_real (MapType1Select QPMask@5 (|Seq#Index| (MapType0Select ExhaleHeap@0 b_2 array) N@0) value)))) (=> (= FullPerm (U_2_real (MapType1Select QPMask@5 (|Seq#Index| (MapType0Select ExhaleHeap@0 b_2 array) N@0) value))) (=> (and (and (and (= Heap@0 (MapType0Store ExhaleHeap@0 (|Seq#Index| (MapType0Select ExhaleHeap@0 b_2 array) N@0) value (MapType0Select ExhaleHeap@0 (|Seq#Index| (MapType0Select ExhaleHeap@0 a_2 array) I@0) value))) (state Heap@0 QPMask@5)) (and (= I@1 (+ I@0 1)) (state Heap@0 QPMask@5))) (and (and (= I@2 I@1) (= J@2 J@0)) (and (= Heap@2 Heap@0) (= (ControlFlow 0 69) 53)))) anon50_correct))))))))))))))))))))
(let ((anon83_Else_correct  (=> (= J@0 end) (and (=> (= (ControlFlow 0 96) 69) anon84_Then_correct) (=> (= (ControlFlow 0 96) 78) anon84_Else_correct)))))
(let ((anon83_Then_correct  (=> (not (= J@0 end)) (and (=> (= (ControlFlow 0 87) (- 0 95)) (HasDirectPerm QPMask@5 a_2 array)) (=> (HasDirectPerm QPMask@5 a_2 array) (and (=> (= (ControlFlow 0 87) (- 0 94)) (>= I@0 0)) (=> (>= I@0 0) (and (=> (= (ControlFlow 0 87) (- 0 93)) (< I@0 (|Seq#Length| (MapType0Select ExhaleHeap@0 a_2 array)))) (=> (< I@0 (|Seq#Length| (MapType0Select ExhaleHeap@0 a_2 array))) (and (=> (= (ControlFlow 0 87) (- 0 92)) (HasDirectPerm QPMask@5 (|Seq#Index| (MapType0Select ExhaleHeap@0 a_2 array) I@0) value)) (=> (HasDirectPerm QPMask@5 (|Seq#Index| (MapType0Select ExhaleHeap@0 a_2 array) I@0) value) (and (=> (= (ControlFlow 0 87) (- 0 91)) (HasDirectPerm QPMask@5 a_2 array)) (=> (HasDirectPerm QPMask@5 a_2 array) (and (=> (= (ControlFlow 0 87) (- 0 90)) (>= J@0 0)) (=> (>= J@0 0) (and (=> (= (ControlFlow 0 87) (- 0 89)) (< J@0 (|Seq#Length| (MapType0Select ExhaleHeap@0 a_2 array)))) (=> (< J@0 (|Seq#Length| (MapType0Select ExhaleHeap@0 a_2 array))) (and (=> (= (ControlFlow 0 87) (- 0 88)) (HasDirectPerm QPMask@5 (|Seq#Index| (MapType0Select ExhaleHeap@0 a_2 array) J@0) value)) (=> (HasDirectPerm QPMask@5 (|Seq#Index| (MapType0Select ExhaleHeap@0 a_2 array) J@0) value) (and (=> (= (ControlFlow 0 87) 69) anon84_Then_correct) (=> (= (ControlFlow 0 87) 78) anon84_Else_correct)))))))))))))))))))))
(let ((anon82_Then_correct  (=> (state ExhaleHeap@0 ZeroMask) (=> (and (> wildcard@8 NoPerm) (not (= a_2 null))) (=> (and (and (and (and (= Mask@6 (MapType1Store ZeroMask a_2 array (real_2_U (+ (U_2_real (MapType1Select ZeroMask a_2 array)) wildcard@8)))) (state ExhaleHeap@0 Mask@6)) (and (> wildcard@9 NoPerm) (not (= b_2 null)))) (and (and (= Mask@7 (MapType1Store Mask@6 b_2 array (real_2_U (+ (U_2_real (MapType1Select Mask@6 b_2 array)) wildcard@9)))) (state ExhaleHeap@0 Mask@7)) (and (<= 0 start) (<= end (|Seq#Length| (MapType0Select ExhaleHeap@0 a_2 array)))))) (and (and (and (= N@0 (- (+ I@0 J@0) middle)) (<= 0 start)) (and (<= start I@0) (<= middle J@0))) (and (and (<= J@0 end) (= (|Seq#Length| (MapType0Select ExhaleHeap@0 a_2 array)) (|Seq#Length| (MapType0Select ExhaleHeap@0 b_2 array)))) (and (|Seq#Equal| (MapType0Select ExhaleHeap@0 a_2 array) (MapType0Select Heap@@9 a_2 array)) (|Seq#Equal| (MapType0Select ExhaleHeap@0 b_2 array) (MapType0Select Heap@@9 b_2 array)))))) (and (=> (= (ControlFlow 0 97) (- 0 99)) (forall ((i_24 Int) (i_24_1 Int) ) (!  (=> (and (and (and (and (not (= i_24 i_24_1)) (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_24))) (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_24_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| (MapType0Select ExhaleHeap@0 a_2 array) i_24) (|Seq#Index| (MapType0Select ExhaleHeap@0 a_2 array) i_24_1))))
 :qid |stdinbpl.2878:19|
 :skolemid |228|
))) (=> (forall ((i_24@@0 Int) (i_24_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_24@@0 i_24_1@@0)) (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_24@@0))) (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_24_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| (MapType0Select ExhaleHeap@0 a_2 array) i_24@@0) (|Seq#Index| (MapType0Select ExhaleHeap@0 a_2 array) i_24_1@@0))))
 :qid |stdinbpl.2878:19|
 :skolemid |228|
)) (=> (and (forall ((i_24@@1 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_24@@1)) (< NoPerm FullPerm)) (and (qpRange29 (|Seq#Index| (MapType0Select ExhaleHeap@0 a_2 array) i_24@@1)) (= (invRecv29 (|Seq#Index| (MapType0Select ExhaleHeap@0 a_2 array) i_24@@1)) i_24@@1)))
 :qid |stdinbpl.2884:26|
 :skolemid |229|
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@0 a_2 array) i_24@@1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U i_24@@1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_24@@1)))
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@0 a_2 array) i_24@@1))
)) (forall ((o_3@@8 T@U) ) (!  (=> (= (type o_3@@8) RefType) (=> (and (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U (invRecv29 o_3@@8))) (< NoPerm FullPerm)) (qpRange29 o_3@@8)) (= (|Seq#Index| (MapType0Select ExhaleHeap@0 a_2 array) (invRecv29 o_3@@8)) o_3@@8)))
 :qid |stdinbpl.2888:26|
 :skolemid |230|
 :pattern ( (invRecv29 o_3@@8))
))) (=> (and (and (forall ((i_24@@2 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_24@@2)) (not (= (|Seq#Index| (MapType0Select ExhaleHeap@0 a_2 array) i_24@@2) null)))
 :qid |stdinbpl.2894:26|
 :skolemid |231|
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@0 a_2 array) i_24@@2))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U i_24@@2)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_24@@2)))
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@0 a_2 array) i_24@@2))
)) (forall ((o_3@@9 T@U) ) (!  (=> (= (type o_3@@9) RefType) (and (=> (and (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U (invRecv29 o_3@@9))) (< NoPerm FullPerm)) (qpRange29 o_3@@9)) (and (=> (< NoPerm FullPerm) (= (|Seq#Index| (MapType0Select ExhaleHeap@0 a_2 array) (invRecv29 o_3@@9)) o_3@@9)) (= (U_2_real (MapType1Select QPMask@4 o_3@@9 value)) (+ (U_2_real (MapType1Select Mask@7 o_3@@9 value)) FullPerm)))) (=> (not (and (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U (invRecv29 o_3@@9))) (< NoPerm FullPerm)) (qpRange29 o_3@@9))) (= (U_2_real (MapType1Select QPMask@4 o_3@@9 value)) (U_2_real (MapType1Select Mask@7 o_3@@9 value))))))
 :qid |stdinbpl.2900:26|
 :skolemid |232|
 :pattern ( (MapType1Select QPMask@4 o_3@@9 value))
))) (and (forall ((o_3@@10 T@U) (f_5@@2 T@U) ) (! (let ((B@@14 (FieldTypeInv1 (type f_5@@2))))
(let ((A@@15 (FieldTypeInv0 (type f_5@@2))))
 (=> (and (and (= (type o_3@@10) RefType) (= (type f_5@@2) (FieldType A@@15 B@@14))) (not (= f_5@@2 value))) (= (U_2_real (MapType1Select Mask@7 o_3@@10 f_5@@2)) (U_2_real (MapType1Select QPMask@4 o_3@@10 f_5@@2))))))
 :qid |stdinbpl.2904:33|
 :skolemid |233|
 :pattern ( (MapType1Select Mask@7 o_3@@10 f_5@@2))
 :pattern ( (MapType1Select QPMask@4 o_3@@10 f_5@@2))
)) (state ExhaleHeap@0 QPMask@4))) (and (=> (= (ControlFlow 0 97) (- 0 98)) (forall ((i_25 Int) (i_25_1 Int) ) (!  (=> (and (and (and (and (not (= i_25 i_25_1)) (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_25))) (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_25_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| (MapType0Select ExhaleHeap@0 b_2 array) i_25) (|Seq#Index| (MapType0Select ExhaleHeap@0 b_2 array) i_25_1))))
 :qid |stdinbpl.2912:19|
 :skolemid |234|
))) (=> (forall ((i_25@@0 Int) (i_25_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_25@@0 i_25_1@@0)) (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_25@@0))) (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_25_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| (MapType0Select ExhaleHeap@0 b_2 array) i_25@@0) (|Seq#Index| (MapType0Select ExhaleHeap@0 b_2 array) i_25_1@@0))))
 :qid |stdinbpl.2912:19|
 :skolemid |234|
)) (=> (forall ((i_25@@1 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_25@@1)) (< NoPerm FullPerm)) (and (qpRange30 (|Seq#Index| (MapType0Select ExhaleHeap@0 b_2 array) i_25@@1)) (= (invRecv30 (|Seq#Index| (MapType0Select ExhaleHeap@0 b_2 array) i_25@@1)) i_25@@1)))
 :qid |stdinbpl.2918:26|
 :skolemid |235|
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@0 b_2 array) i_25@@1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U i_25@@1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_25@@1)))
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@0 b_2 array) i_25@@1))
)) (=> (and (and (and (forall ((o_3@@11 T@U) ) (!  (=> (= (type o_3@@11) RefType) (=> (and (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U (invRecv30 o_3@@11))) (< NoPerm FullPerm)) (qpRange30 o_3@@11)) (= (|Seq#Index| (MapType0Select ExhaleHeap@0 b_2 array) (invRecv30 o_3@@11)) o_3@@11)))
 :qid |stdinbpl.2922:26|
 :skolemid |236|
 :pattern ( (invRecv30 o_3@@11))
)) (forall ((i_25@@2 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_25@@2)) (not (= (|Seq#Index| (MapType0Select ExhaleHeap@0 b_2 array) i_25@@2) null)))
 :qid |stdinbpl.2928:26|
 :skolemid |237|
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@0 b_2 array) i_25@@2))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U i_25@@2)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_25@@2)))
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@0 b_2 array) i_25@@2))
))) (and (forall ((o_3@@12 T@U) ) (!  (=> (= (type o_3@@12) RefType) (and (=> (and (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U (invRecv30 o_3@@12))) (< NoPerm FullPerm)) (qpRange30 o_3@@12)) (and (=> (< NoPerm FullPerm) (= (|Seq#Index| (MapType0Select ExhaleHeap@0 b_2 array) (invRecv30 o_3@@12)) o_3@@12)) (= (U_2_real (MapType1Select QPMask@5 o_3@@12 value)) (+ (U_2_real (MapType1Select QPMask@4 o_3@@12 value)) FullPerm)))) (=> (not (and (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U (invRecv30 o_3@@12))) (< NoPerm FullPerm)) (qpRange30 o_3@@12))) (= (U_2_real (MapType1Select QPMask@5 o_3@@12 value)) (U_2_real (MapType1Select QPMask@4 o_3@@12 value))))))
 :qid |stdinbpl.2934:26|
 :skolemid |238|
 :pattern ( (MapType1Select QPMask@5 o_3@@12 value))
)) (forall ((o_3@@13 T@U) (f_5@@3 T@U) ) (! (let ((B@@15 (FieldTypeInv1 (type f_5@@3))))
(let ((A@@16 (FieldTypeInv0 (type f_5@@3))))
 (=> (and (and (= (type o_3@@13) RefType) (= (type f_5@@3) (FieldType A@@16 B@@15))) (not (= f_5@@3 value))) (= (U_2_real (MapType1Select QPMask@4 o_3@@13 f_5@@3)) (U_2_real (MapType1Select QPMask@5 o_3@@13 f_5@@3))))))
 :qid |stdinbpl.2938:33|
 :skolemid |239|
 :pattern ( (MapType1Select QPMask@4 o_3@@13 f_5@@3))
 :pattern ( (MapType1Select QPMask@5 o_3@@13 f_5@@3))
)))) (and (and (state ExhaleHeap@0 QPMask@5) (state ExhaleHeap@0 QPMask@5)) (and (< N@0 end) (state ExhaleHeap@0 QPMask@5)))) (and (=> (= (ControlFlow 0 97) 87) anon83_Then_correct) (=> (= (ControlFlow 0 97) 96) anon83_Else_correct)))))))))))))))
(let ((anon58_correct true))
(let ((anon88_Else_correct  (=> (and (not (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_15)) (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U j_10)) (not (= i_15 j_10))))) (= (ControlFlow 0 41) 38)) anon58_correct)))
(let ((anon88_Then_correct  (=> (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_15)) (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U j_10)) (not (= i_15 j_10)))) (and (=> (= (ControlFlow 0 39) (- 0 40)) (not (= (|Seq#Index| (MapType0Select ExhaleHeap@0 b_2 array) i_15) (|Seq#Index| (MapType0Select ExhaleHeap@0 b_2 array) j_10)))) (=> (not (= (|Seq#Index| (MapType0Select ExhaleHeap@0 b_2 array) i_15) (|Seq#Index| (MapType0Select ExhaleHeap@0 b_2 array) j_10))) (=> (= (ControlFlow 0 39) 38) anon58_correct))))))
(let ((anon87_Else_correct  (=> (forall ((i_16_1_1 Int) (j_11_1 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_16_1_1)) (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U j_11_1)) (not (= i_16_1_1 j_11_1)))) (not (= (|Seq#Index| (MapType0Select ExhaleHeap@0 b_2 array) i_16_1_1) (|Seq#Index| (MapType0Select ExhaleHeap@0 b_2 array) j_11_1))))
 :qid |stdinbpl.3329:20|
 :skolemid |271|
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U i_16_1_1)) (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U j_11_1)))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U i_16_1_1)) (|Seq#Contains| (|Seq#Range| start end) (int_2_U j_11_1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_16_1_1)) (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U j_11_1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_16_1_1)) (|Seq#Contains| (|Seq#Range| start end) (int_2_U j_11_1)))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U i_16_1_1)) (|Seq#Index| (MapType0Select ExhaleHeap@0 b_2 array) j_11_1))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_16_1_1)) (|Seq#Index| (MapType0Select ExhaleHeap@0 b_2 array) j_11_1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U j_11_1)) (|Seq#Index| (MapType0Select ExhaleHeap@0 b_2 array) i_16_1_1))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U j_11_1)) (|Seq#Index| (MapType0Select ExhaleHeap@0 b_2 array) i_16_1_1))
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@0 b_2 array) i_16_1_1) (|Seq#Index| (MapType0Select ExhaleHeap@0 b_2 array) j_11_1))
)) (and (=> (= (ControlFlow 0 36) (- 0 37)) (forall ((i_17 Int) (i_17_2 Int) ) (!  (=> (and (and (and (and (not (= i_17 i_17_2)) (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_17))) (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_17_2))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| (MapType0Select ExhaleHeap@0 b_2 array) i_17) (|Seq#Index| (MapType0Select ExhaleHeap@0 b_2 array) i_17_2))))
 :qid |stdinbpl.3340:17|
 :skolemid |272|
 :pattern ( (neverTriggered24 i_17) (neverTriggered24 i_17_2))
))) (=> (forall ((i_17@@0 Int) (i_17_2@@0 Int) ) (!  (=> (and (and (and (and (not (= i_17@@0 i_17_2@@0)) (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_17@@0))) (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_17_2@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| (MapType0Select ExhaleHeap@0 b_2 array) i_17@@0) (|Seq#Index| (MapType0Select ExhaleHeap@0 b_2 array) i_17_2@@0))))
 :qid |stdinbpl.3340:17|
 :skolemid |272|
 :pattern ( (neverTriggered24 i_17@@0) (neverTriggered24 i_17_2@@0))
)) (=> (= (ControlFlow 0 36) (- 0 35)) (forall ((i_17@@1 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_17@@1)) (>= (U_2_real (MapType1Select QPMask@8 (|Seq#Index| (MapType0Select ExhaleHeap@0 b_2 array) i_17@@1) value)) FullPerm))
 :qid |stdinbpl.3347:17|
 :skolemid |273|
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@0 b_2 array) i_17@@1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U i_17@@1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_17@@1)))
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@0 b_2 array) i_17@@1))
))))))))
(let ((anon85_Else_correct  (=> (forall ((i_13_1 Int) (j_9_1 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_13_1)) (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U j_9_1)) (not (= i_13_1 j_9_1)))) (not (= (|Seq#Index| (MapType0Select ExhaleHeap@0 a_2 array) i_13_1) (|Seq#Index| (MapType0Select ExhaleHeap@0 a_2 array) j_9_1))))
 :qid |stdinbpl.3277:20|
 :skolemid |264|
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U i_13_1)) (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U j_9_1)))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U i_13_1)) (|Seq#Contains| (|Seq#Range| start end) (int_2_U j_9_1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_13_1)) (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U j_9_1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_13_1)) (|Seq#Contains| (|Seq#Range| start end) (int_2_U j_9_1)))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U i_13_1)) (|Seq#Index| (MapType0Select ExhaleHeap@0 a_2 array) j_9_1))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_13_1)) (|Seq#Index| (MapType0Select ExhaleHeap@0 a_2 array) j_9_1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U j_9_1)) (|Seq#Index| (MapType0Select ExhaleHeap@0 a_2 array) i_13_1))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U j_9_1)) (|Seq#Index| (MapType0Select ExhaleHeap@0 a_2 array) i_13_1))
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@0 a_2 array) i_13_1) (|Seq#Index| (MapType0Select ExhaleHeap@0 a_2 array) j_9_1))
)) (and (=> (= (ControlFlow 0 42) (- 0 44)) (forall ((i_14 Int) (i_14_1 Int) ) (!  (=> (and (and (and (and (not (= i_14 i_14_1)) (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_14))) (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_14_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| (MapType0Select ExhaleHeap@0 a_2 array) i_14) (|Seq#Index| (MapType0Select ExhaleHeap@0 a_2 array) i_14_1))))
 :qid |stdinbpl.3288:17|
 :skolemid |265|
 :pattern ( (neverTriggered23 i_14) (neverTriggered23 i_14_1))
))) (=> (forall ((i_14@@0 Int) (i_14_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_14@@0 i_14_1@@0)) (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_14@@0))) (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_14_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| (MapType0Select ExhaleHeap@0 a_2 array) i_14@@0) (|Seq#Index| (MapType0Select ExhaleHeap@0 a_2 array) i_14_1@@0))))
 :qid |stdinbpl.3288:17|
 :skolemid |265|
 :pattern ( (neverTriggered23 i_14@@0) (neverTriggered23 i_14_1@@0))
)) (and (=> (= (ControlFlow 0 42) (- 0 43)) (forall ((i_14@@1 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_14@@1)) (>= (U_2_real (MapType1Select Mask@11 (|Seq#Index| (MapType0Select ExhaleHeap@0 a_2 array) i_14@@1) value)) FullPerm))
 :qid |stdinbpl.3295:17|
 :skolemid |266|
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@0 a_2 array) i_14@@1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U i_14@@1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_14@@1)))
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@0 a_2 array) i_14@@1))
))) (=> (forall ((i_14@@2 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_14@@2)) (>= (U_2_real (MapType1Select Mask@11 (|Seq#Index| (MapType0Select ExhaleHeap@0 a_2 array) i_14@@2) value)) FullPerm))
 :qid |stdinbpl.3295:17|
 :skolemid |266|
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@0 a_2 array) i_14@@2))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U i_14@@2)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_14@@2)))
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@0 a_2 array) i_14@@2))
)) (=> (and (and (forall ((i_14@@3 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_14@@3)) (< NoPerm FullPerm)) (and (qpRange23 (|Seq#Index| (MapType0Select ExhaleHeap@0 a_2 array) i_14@@3)) (= (invRecv23 (|Seq#Index| (MapType0Select ExhaleHeap@0 a_2 array) i_14@@3)) i_14@@3)))
 :qid |stdinbpl.3301:22|
 :skolemid |267|
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@0 a_2 array) i_14@@3))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U i_14@@3)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_14@@3)))
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@0 a_2 array) i_14@@3))
)) (forall ((o_3@@14 T@U) ) (!  (=> (= (type o_3@@14) RefType) (=> (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U (invRecv23 o_3@@14))) (and (< NoPerm FullPerm) (qpRange23 o_3@@14))) (= (|Seq#Index| (MapType0Select ExhaleHeap@0 a_2 array) (invRecv23 o_3@@14)) o_3@@14)))
 :qid |stdinbpl.3305:22|
 :skolemid |268|
 :pattern ( (invRecv23 o_3@@14))
))) (and (forall ((o_3@@15 T@U) ) (!  (=> (= (type o_3@@15) RefType) (and (=> (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U (invRecv23 o_3@@15))) (and (< NoPerm FullPerm) (qpRange23 o_3@@15))) (and (= (|Seq#Index| (MapType0Select ExhaleHeap@0 a_2 array) (invRecv23 o_3@@15)) o_3@@15) (= (U_2_real (MapType1Select QPMask@8 o_3@@15 value)) (- (U_2_real (MapType1Select Mask@11 o_3@@15 value)) FullPerm)))) (=> (not (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U (invRecv23 o_3@@15))) (and (< NoPerm FullPerm) (qpRange23 o_3@@15)))) (= (U_2_real (MapType1Select QPMask@8 o_3@@15 value)) (U_2_real (MapType1Select Mask@11 o_3@@15 value))))))
 :qid |stdinbpl.3311:22|
 :skolemid |269|
 :pattern ( (MapType1Select QPMask@8 o_3@@15 value))
)) (forall ((o_3@@16 T@U) (f_5@@4 T@U) ) (! (let ((B@@16 (FieldTypeInv1 (type f_5@@4))))
(let ((A@@17 (FieldTypeInv0 (type f_5@@4))))
 (=> (and (and (= (type o_3@@16) RefType) (= (type f_5@@4) (FieldType A@@17 B@@16))) (not (= f_5@@4 value))) (= (U_2_real (MapType1Select Mask@11 o_3@@16 f_5@@4)) (U_2_real (MapType1Select QPMask@8 o_3@@16 f_5@@4))))))
 :qid |stdinbpl.3317:29|
 :skolemid |270|
 :pattern ( (MapType1Select QPMask@8 o_3@@16 f_5@@4))
)))) (and (and (=> (= (ControlFlow 0 42) 36) anon87_Else_correct) (=> (= (ControlFlow 0 42) 39) anon88_Then_correct)) (=> (= (ControlFlow 0 42) 41) anon88_Else_correct))))))))))
(let ((anon54_correct true))
(let ((anon86_Else_correct  (=> (and (not (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_12_1)) (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U j_8)) (not (= i_12_1 j_8))))) (= (ControlFlow 0 34) 31)) anon54_correct)))
(let ((anon86_Then_correct  (=> (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_12_1)) (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U j_8)) (not (= i_12_1 j_8)))) (and (=> (= (ControlFlow 0 32) (- 0 33)) (not (= (|Seq#Index| (MapType0Select ExhaleHeap@0 a_2 array) i_12_1) (|Seq#Index| (MapType0Select ExhaleHeap@0 a_2 array) j_8)))) (=> (not (= (|Seq#Index| (MapType0Select ExhaleHeap@0 a_2 array) i_12_1) (|Seq#Index| (MapType0Select ExhaleHeap@0 a_2 array) j_8))) (=> (= (ControlFlow 0 32) 31) anon54_correct))))))
(let ((anon82_Else_correct  (=> (and (and (not (< N@0 end)) (state ExhaleHeap@0 QPMask@3)) (and (> wildcard@10 NoPerm) (not (= a_2 null)))) (=> (and (and (and (and (= Mask@8 (MapType1Store QPMask@3 a_2 array (real_2_U (+ (U_2_real (MapType1Select QPMask@3 a_2 array)) wildcard@10)))) (state ExhaleHeap@0 Mask@8)) (and (> wildcard@11 NoPerm) (not (= b_2 null)))) (and (and (= Mask@9 (MapType1Store Mask@8 b_2 array (real_2_U (+ (U_2_real (MapType1Select Mask@8 b_2 array)) wildcard@11)))) (state ExhaleHeap@0 Mask@9)) (and (<= 0 start) (<= end (|Seq#Length| (MapType0Select ExhaleHeap@0 a_2 array)))))) (and (and (and (= N@0 (- (+ I@0 J@0) middle)) (<= 0 start)) (and (<= start I@0) (<= middle J@0))) (and (and (<= J@0 end) (= (|Seq#Length| (MapType0Select ExhaleHeap@0 a_2 array)) (|Seq#Length| (MapType0Select ExhaleHeap@0 b_2 array)))) (and (|Seq#Equal| (MapType0Select ExhaleHeap@0 a_2 array) (MapType0Select Heap@@9 a_2 array)) (|Seq#Equal| (MapType0Select ExhaleHeap@0 b_2 array) (MapType0Select Heap@@9 b_2 array)))))) (and (=> (= (ControlFlow 0 45) (- 0 51)) (forall ((i_28 Int) (i_28_1 Int) ) (!  (=> (and (and (and (and (not (= i_28 i_28_1)) (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_28))) (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_28_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| (MapType0Select ExhaleHeap@0 a_2 array) i_28) (|Seq#Index| (MapType0Select ExhaleHeap@0 a_2 array) i_28_1))))
 :qid |stdinbpl.3184:17|
 :skolemid |252|
))) (=> (forall ((i_28@@0 Int) (i_28_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_28@@0 i_28_1@@0)) (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_28@@0))) (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_28_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| (MapType0Select ExhaleHeap@0 a_2 array) i_28@@0) (|Seq#Index| (MapType0Select ExhaleHeap@0 a_2 array) i_28_1@@0))))
 :qid |stdinbpl.3184:17|
 :skolemid |252|
)) (=> (and (forall ((i_28@@1 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_28@@1)) (< NoPerm FullPerm)) (and (qpRange33 (|Seq#Index| (MapType0Select ExhaleHeap@0 a_2 array) i_28@@1)) (= (invRecv33 (|Seq#Index| (MapType0Select ExhaleHeap@0 a_2 array) i_28@@1)) i_28@@1)))
 :qid |stdinbpl.3190:24|
 :skolemid |253|
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@0 a_2 array) i_28@@1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U i_28@@1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_28@@1)))
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@0 a_2 array) i_28@@1))
)) (forall ((o_3@@17 T@U) ) (!  (=> (= (type o_3@@17) RefType) (=> (and (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U (invRecv33 o_3@@17))) (< NoPerm FullPerm)) (qpRange33 o_3@@17)) (= (|Seq#Index| (MapType0Select ExhaleHeap@0 a_2 array) (invRecv33 o_3@@17)) o_3@@17)))
 :qid |stdinbpl.3194:24|
 :skolemid |254|
 :pattern ( (invRecv33 o_3@@17))
))) (=> (and (and (forall ((i_28@@2 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_28@@2)) (not (= (|Seq#Index| (MapType0Select ExhaleHeap@0 a_2 array) i_28@@2) null)))
 :qid |stdinbpl.3200:24|
 :skolemid |255|
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@0 a_2 array) i_28@@2))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U i_28@@2)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_28@@2)))
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@0 a_2 array) i_28@@2))
)) (forall ((o_3@@18 T@U) ) (!  (=> (= (type o_3@@18) RefType) (and (=> (and (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U (invRecv33 o_3@@18))) (< NoPerm FullPerm)) (qpRange33 o_3@@18)) (and (=> (< NoPerm FullPerm) (= (|Seq#Index| (MapType0Select ExhaleHeap@0 a_2 array) (invRecv33 o_3@@18)) o_3@@18)) (= (U_2_real (MapType1Select QPMask@6 o_3@@18 value)) (+ (U_2_real (MapType1Select Mask@9 o_3@@18 value)) FullPerm)))) (=> (not (and (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U (invRecv33 o_3@@18))) (< NoPerm FullPerm)) (qpRange33 o_3@@18))) (= (U_2_real (MapType1Select QPMask@6 o_3@@18 value)) (U_2_real (MapType1Select Mask@9 o_3@@18 value))))))
 :qid |stdinbpl.3206:24|
 :skolemid |256|
 :pattern ( (MapType1Select QPMask@6 o_3@@18 value))
))) (and (forall ((o_3@@19 T@U) (f_5@@5 T@U) ) (! (let ((B@@17 (FieldTypeInv1 (type f_5@@5))))
(let ((A@@18 (FieldTypeInv0 (type f_5@@5))))
 (=> (and (and (= (type o_3@@19) RefType) (= (type f_5@@5) (FieldType A@@18 B@@17))) (not (= f_5@@5 value))) (= (U_2_real (MapType1Select Mask@9 o_3@@19 f_5@@5)) (U_2_real (MapType1Select QPMask@6 o_3@@19 f_5@@5))))))
 :qid |stdinbpl.3210:31|
 :skolemid |257|
 :pattern ( (MapType1Select Mask@9 o_3@@19 f_5@@5))
 :pattern ( (MapType1Select QPMask@6 o_3@@19 f_5@@5))
)) (state ExhaleHeap@0 QPMask@6))) (and (=> (= (ControlFlow 0 45) (- 0 50)) (forall ((i_29 Int) (i_29_1 Int) ) (!  (=> (and (and (and (and (not (= i_29 i_29_1)) (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_29))) (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_29_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| (MapType0Select ExhaleHeap@0 b_2 array) i_29) (|Seq#Index| (MapType0Select ExhaleHeap@0 b_2 array) i_29_1))))
 :qid |stdinbpl.3218:17|
 :skolemid |258|
))) (=> (forall ((i_29@@0 Int) (i_29_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_29@@0 i_29_1@@0)) (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_29@@0))) (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_29_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| (MapType0Select ExhaleHeap@0 b_2 array) i_29@@0) (|Seq#Index| (MapType0Select ExhaleHeap@0 b_2 array) i_29_1@@0))))
 :qid |stdinbpl.3218:17|
 :skolemid |258|
)) (=> (and (and (and (forall ((i_29@@1 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_29@@1)) (< NoPerm FullPerm)) (and (qpRange34 (|Seq#Index| (MapType0Select ExhaleHeap@0 b_2 array) i_29@@1)) (= (invRecv34 (|Seq#Index| (MapType0Select ExhaleHeap@0 b_2 array) i_29@@1)) i_29@@1)))
 :qid |stdinbpl.3224:24|
 :skolemid |259|
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@0 b_2 array) i_29@@1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U i_29@@1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_29@@1)))
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@0 b_2 array) i_29@@1))
)) (forall ((o_3@@20 T@U) ) (!  (=> (= (type o_3@@20) RefType) (=> (and (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U (invRecv34 o_3@@20))) (< NoPerm FullPerm)) (qpRange34 o_3@@20)) (= (|Seq#Index| (MapType0Select ExhaleHeap@0 b_2 array) (invRecv34 o_3@@20)) o_3@@20)))
 :qid |stdinbpl.3228:24|
 :skolemid |260|
 :pattern ( (invRecv34 o_3@@20))
))) (and (forall ((i_29@@2 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_29@@2)) (not (= (|Seq#Index| (MapType0Select ExhaleHeap@0 b_2 array) i_29@@2) null)))
 :qid |stdinbpl.3234:24|
 :skolemid |261|
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@0 b_2 array) i_29@@2))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U i_29@@2)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_29@@2)))
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@0 b_2 array) i_29@@2))
)) (forall ((o_3@@21 T@U) ) (!  (=> (= (type o_3@@21) RefType) (and (=> (and (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U (invRecv34 o_3@@21))) (< NoPerm FullPerm)) (qpRange34 o_3@@21)) (and (=> (< NoPerm FullPerm) (= (|Seq#Index| (MapType0Select ExhaleHeap@0 b_2 array) (invRecv34 o_3@@21)) o_3@@21)) (= (U_2_real (MapType1Select QPMask@7 o_3@@21 value)) (+ (U_2_real (MapType1Select QPMask@6 o_3@@21 value)) FullPerm)))) (=> (not (and (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U (invRecv34 o_3@@21))) (< NoPerm FullPerm)) (qpRange34 o_3@@21))) (= (U_2_real (MapType1Select QPMask@7 o_3@@21 value)) (U_2_real (MapType1Select QPMask@6 o_3@@21 value))))))
 :qid |stdinbpl.3240:24|
 :skolemid |262|
 :pattern ( (MapType1Select QPMask@7 o_3@@21 value))
)))) (and (and (forall ((o_3@@22 T@U) (f_5@@6 T@U) ) (! (let ((B@@18 (FieldTypeInv1 (type f_5@@6))))
(let ((A@@19 (FieldTypeInv0 (type f_5@@6))))
 (=> (and (and (= (type o_3@@22) RefType) (= (type f_5@@6) (FieldType A@@19 B@@18))) (not (= f_5@@6 value))) (= (U_2_real (MapType1Select QPMask@6 o_3@@22 f_5@@6)) (U_2_real (MapType1Select QPMask@7 o_3@@22 f_5@@6))))))
 :qid |stdinbpl.3244:31|
 :skolemid |263|
 :pattern ( (MapType1Select QPMask@6 o_3@@22 f_5@@6))
 :pattern ( (MapType1Select QPMask@7 o_3@@22 f_5@@6))
)) (state ExhaleHeap@0 QPMask@7)) (and (state ExhaleHeap@0 QPMask@7) (state ExhaleHeap@0 QPMask@7)))) (and (=> (= (ControlFlow 0 45) (- 0 49)) (> (U_2_real (MapType1Select QPMask@7 a_2 array)) NoPerm)) (=> (> (U_2_real (MapType1Select QPMask@7 a_2 array)) NoPerm) (=> (> wildcard@12 NoPerm) (=> (and (< wildcard@12 (U_2_real (MapType1Select QPMask@7 a_2 array))) (= Mask@10 (MapType1Store QPMask@7 a_2 array (real_2_U (- (U_2_real (MapType1Select QPMask@7 a_2 array)) wildcard@12))))) (and (=> (= (ControlFlow 0 45) (- 0 48)) (> (U_2_real (MapType1Select Mask@10 b_2 array)) NoPerm)) (=> (> (U_2_real (MapType1Select Mask@10 b_2 array)) NoPerm) (=> (> wildcard@13 NoPerm) (=> (and (< wildcard@13 (U_2_real (MapType1Select Mask@10 b_2 array))) (= Mask@11 (MapType1Store Mask@10 b_2 array (real_2_U (- (U_2_real (MapType1Select Mask@10 b_2 array)) wildcard@13))))) (and (=> (= (ControlFlow 0 45) (- 0 47)) (|Seq#Equal| (MapType0Select ExhaleHeap@0 a_2 array) (MapType0Select Heap@@9 a_2 array))) (=> (|Seq#Equal| (MapType0Select ExhaleHeap@0 a_2 array) (MapType0Select Heap@@9 a_2 array)) (and (=> (= (ControlFlow 0 45) (- 0 46)) (|Seq#Equal| (MapType0Select ExhaleHeap@0 b_2 array) (MapType0Select Heap@@9 b_2 array))) (=> (|Seq#Equal| (MapType0Select ExhaleHeap@0 b_2 array) (MapType0Select Heap@@9 b_2 array)) (and (and (=> (= (ControlFlow 0 45) 42) anon85_Else_correct) (=> (= (ControlFlow 0 45) 32) anon86_Then_correct)) (=> (= (ControlFlow 0 45) 34) anon86_Else_correct)))))))))))))))))))))))))
(let ((anon68_Else_correct  (=> (state Heap@@9 QPMask@1) (=> (and (state Heap@@9 QPMask@1) (state Heap@@9 QPMask@1)) (and (=> (= (ControlFlow 0 124) (- 0 140)) (> (U_2_real (MapType1Select QPMask@1 a_2 array)) NoPerm)) (=> (> (U_2_real (MapType1Select QPMask@1 a_2 array)) NoPerm) (=> (> wildcard@4 NoPerm) (=> (and (< wildcard@4 (U_2_real (MapType1Select QPMask@1 a_2 array))) (= Mask@2 (MapType1Store QPMask@1 a_2 array (real_2_U (- (U_2_real (MapType1Select QPMask@1 a_2 array)) wildcard@4))))) (and (=> (= (ControlFlow 0 124) (- 0 139)) (> (U_2_real (MapType1Select Mask@2 b_2 array)) NoPerm)) (=> (> (U_2_real (MapType1Select Mask@2 b_2 array)) NoPerm) (=> (> wildcard@5 NoPerm) (=> (and (< wildcard@5 (U_2_real (MapType1Select Mask@2 b_2 array))) (= Mask@3 (MapType1Store Mask@2 b_2 array (real_2_U (- (U_2_real (MapType1Select Mask@2 b_2 array)) wildcard@5))))) (and (=> (= (ControlFlow 0 124) (- 0 138)) (<= 0 start)) (=> (<= 0 start) (and (=> (= (ControlFlow 0 124) (- 0 137)) (<= end (|Seq#Length| (MapType0Select Heap@@9 a_2 array)))) (=> (<= end (|Seq#Length| (MapType0Select Heap@@9 a_2 array))) (and (=> (= (ControlFlow 0 124) (- 0 136)) (= start (- (+ start middle) middle))) (=> (= start (- (+ start middle) middle)) (and (=> (= (ControlFlow 0 124) (- 0 135)) (<= 0 start)) (=> (<= 0 start) (and (=> (= (ControlFlow 0 124) (- 0 134)) (<= start start)) (=> (<= start start) (and (=> (= (ControlFlow 0 124) (- 0 133)) (<= middle middle)) (=> (<= middle middle) (and (=> (= (ControlFlow 0 124) (- 0 132)) (<= middle end)) (=> (<= middle end) (and (=> (= (ControlFlow 0 124) (- 0 131)) (= (|Seq#Length| (MapType0Select Heap@@9 a_2 array)) (|Seq#Length| (MapType0Select Heap@@9 b_2 array)))) (=> (= (|Seq#Length| (MapType0Select Heap@@9 a_2 array)) (|Seq#Length| (MapType0Select Heap@@9 b_2 array))) (and (=> (= (ControlFlow 0 124) (- 0 130)) (|Seq#Equal| (MapType0Select Heap@@9 a_2 array) (MapType0Select Heap@@9 a_2 array))) (=> (|Seq#Equal| (MapType0Select Heap@@9 a_2 array) (MapType0Select Heap@@9 a_2 array)) (and (=> (= (ControlFlow 0 124) (- 0 129)) (|Seq#Equal| (MapType0Select Heap@@9 b_2 array) (MapType0Select Heap@@9 b_2 array))) (=> (|Seq#Equal| (MapType0Select Heap@@9 b_2 array) (MapType0Select Heap@@9 b_2 array)) (and (=> (= (ControlFlow 0 124) (- 0 128)) (forall ((i_18 Int) (i_18_1 Int) ) (!  (=> (and (and (and (and (not (= i_18 i_18_1)) (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_18))) (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_18_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| (MapType0Select Heap@@9 a_2 array) i_18) (|Seq#Index| (MapType0Select Heap@@9 a_2 array) i_18_1))))
 :qid |stdinbpl.2612:21|
 :skolemid |204|
 :pattern ( (neverTriggered25 i_18) (neverTriggered25 i_18_1))
))) (=> (forall ((i_18@@0 Int) (i_18_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_18@@0 i_18_1@@0)) (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_18@@0))) (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_18_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| (MapType0Select Heap@@9 a_2 array) i_18@@0) (|Seq#Index| (MapType0Select Heap@@9 a_2 array) i_18_1@@0))))
 :qid |stdinbpl.2612:21|
 :skolemid |204|
 :pattern ( (neverTriggered25 i_18@@0) (neverTriggered25 i_18_1@@0))
)) (and (=> (= (ControlFlow 0 124) (- 0 127)) (forall ((i_18@@1 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_18@@1)) (>= (U_2_real (MapType1Select Mask@3 (|Seq#Index| (MapType0Select Heap@@9 a_2 array) i_18@@1) value)) FullPerm))
 :qid |stdinbpl.2619:21|
 :skolemid |205|
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 a_2 array) i_18@@1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U i_18@@1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_18@@1)))
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 a_2 array) i_18@@1))
))) (=> (forall ((i_18@@2 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_18@@2)) (>= (U_2_real (MapType1Select Mask@3 (|Seq#Index| (MapType0Select Heap@@9 a_2 array) i_18@@2) value)) FullPerm))
 :qid |stdinbpl.2619:21|
 :skolemid |205|
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 a_2 array) i_18@@2))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U i_18@@2)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_18@@2)))
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 a_2 array) i_18@@2))
)) (=> (and (and (forall ((i_18@@3 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_18@@3)) (< NoPerm FullPerm)) (and (qpRange25 (|Seq#Index| (MapType0Select Heap@@9 a_2 array) i_18@@3)) (= (invRecv25 (|Seq#Index| (MapType0Select Heap@@9 a_2 array) i_18@@3)) i_18@@3)))
 :qid |stdinbpl.2625:26|
 :skolemid |206|
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 a_2 array) i_18@@3))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U i_18@@3)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_18@@3)))
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 a_2 array) i_18@@3))
)) (forall ((o_3@@23 T@U) ) (!  (=> (= (type o_3@@23) RefType) (=> (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U (invRecv25 o_3@@23))) (and (< NoPerm FullPerm) (qpRange25 o_3@@23))) (= (|Seq#Index| (MapType0Select Heap@@9 a_2 array) (invRecv25 o_3@@23)) o_3@@23)))
 :qid |stdinbpl.2629:26|
 :skolemid |207|
 :pattern ( (invRecv25 o_3@@23))
))) (and (forall ((o_3@@24 T@U) ) (!  (=> (= (type o_3@@24) RefType) (and (=> (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U (invRecv25 o_3@@24))) (and (< NoPerm FullPerm) (qpRange25 o_3@@24))) (and (= (|Seq#Index| (MapType0Select Heap@@9 a_2 array) (invRecv25 o_3@@24)) o_3@@24) (= (U_2_real (MapType1Select QPMask@2 o_3@@24 value)) (- (U_2_real (MapType1Select Mask@3 o_3@@24 value)) FullPerm)))) (=> (not (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U (invRecv25 o_3@@24))) (and (< NoPerm FullPerm) (qpRange25 o_3@@24)))) (= (U_2_real (MapType1Select QPMask@2 o_3@@24 value)) (U_2_real (MapType1Select Mask@3 o_3@@24 value))))))
 :qid |stdinbpl.2635:26|
 :skolemid |208|
 :pattern ( (MapType1Select QPMask@2 o_3@@24 value))
)) (forall ((o_3@@25 T@U) (f_5@@7 T@U) ) (! (let ((B@@19 (FieldTypeInv1 (type f_5@@7))))
(let ((A@@20 (FieldTypeInv0 (type f_5@@7))))
 (=> (and (and (= (type o_3@@25) RefType) (= (type f_5@@7) (FieldType A@@20 B@@19))) (not (= f_5@@7 value))) (= (U_2_real (MapType1Select Mask@3 o_3@@25 f_5@@7)) (U_2_real (MapType1Select QPMask@2 o_3@@25 f_5@@7))))))
 :qid |stdinbpl.2641:33|
 :skolemid |209|
 :pattern ( (MapType1Select QPMask@2 o_3@@25 f_5@@7))
)))) (and (=> (= (ControlFlow 0 124) (- 0 126)) (forall ((i_19 Int) (i_19_1 Int) ) (!  (=> (and (and (and (and (not (= i_19 i_19_1)) (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_19))) (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_19_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| (MapType0Select Heap@@9 b_2 array) i_19) (|Seq#Index| (MapType0Select Heap@@9 b_2 array) i_19_1))))
 :qid |stdinbpl.2653:21|
 :skolemid |210|
 :pattern ( (neverTriggered26 i_19) (neverTriggered26 i_19_1))
))) (=> (forall ((i_19@@0 Int) (i_19_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_19@@0 i_19_1@@0)) (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_19@@0))) (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_19_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| (MapType0Select Heap@@9 b_2 array) i_19@@0) (|Seq#Index| (MapType0Select Heap@@9 b_2 array) i_19_1@@0))))
 :qid |stdinbpl.2653:21|
 :skolemid |210|
 :pattern ( (neverTriggered26 i_19@@0) (neverTriggered26 i_19_1@@0))
)) (and (=> (= (ControlFlow 0 124) (- 0 125)) (forall ((i_19@@1 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_19@@1)) (>= (U_2_real (MapType1Select QPMask@2 (|Seq#Index| (MapType0Select Heap@@9 b_2 array) i_19@@1) value)) FullPerm))
 :qid |stdinbpl.2660:21|
 :skolemid |211|
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 b_2 array) i_19@@1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U i_19@@1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_19@@1)))
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 b_2 array) i_19@@1))
))) (=> (forall ((i_19@@2 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_19@@2)) (>= (U_2_real (MapType1Select QPMask@2 (|Seq#Index| (MapType0Select Heap@@9 b_2 array) i_19@@2) value)) FullPerm))
 :qid |stdinbpl.2660:21|
 :skolemid |211|
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 b_2 array) i_19@@2))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U i_19@@2)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_19@@2)))
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 b_2 array) i_19@@2))
)) (=> (forall ((i_19@@3 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_19@@3)) (< NoPerm FullPerm)) (and (qpRange26 (|Seq#Index| (MapType0Select Heap@@9 b_2 array) i_19@@3)) (= (invRecv26 (|Seq#Index| (MapType0Select Heap@@9 b_2 array) i_19@@3)) i_19@@3)))
 :qid |stdinbpl.2666:26|
 :skolemid |212|
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 b_2 array) i_19@@3))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U i_19@@3)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_19@@3)))
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 b_2 array) i_19@@3))
)) (=> (and (and (forall ((o_3@@26 T@U) ) (!  (=> (= (type o_3@@26) RefType) (=> (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U (invRecv26 o_3@@26))) (and (< NoPerm FullPerm) (qpRange26 o_3@@26))) (= (|Seq#Index| (MapType0Select Heap@@9 b_2 array) (invRecv26 o_3@@26)) o_3@@26)))
 :qid |stdinbpl.2670:26|
 :skolemid |213|
 :pattern ( (invRecv26 o_3@@26))
)) (forall ((o_3@@27 T@U) ) (!  (=> (= (type o_3@@27) RefType) (and (=> (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U (invRecv26 o_3@@27))) (and (< NoPerm FullPerm) (qpRange26 o_3@@27))) (and (= (|Seq#Index| (MapType0Select Heap@@9 b_2 array) (invRecv26 o_3@@27)) o_3@@27) (= (U_2_real (MapType1Select QPMask@3 o_3@@27 value)) (- (U_2_real (MapType1Select QPMask@2 o_3@@27 value)) FullPerm)))) (=> (not (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U (invRecv26 o_3@@27))) (and (< NoPerm FullPerm) (qpRange26 o_3@@27)))) (= (U_2_real (MapType1Select QPMask@3 o_3@@27 value)) (U_2_real (MapType1Select QPMask@2 o_3@@27 value))))))
 :qid |stdinbpl.2676:26|
 :skolemid |214|
 :pattern ( (MapType1Select QPMask@3 o_3@@27 value))
))) (and (forall ((o_3@@28 T@U) (f_5@@8 T@U) ) (! (let ((B@@20 (FieldTypeInv1 (type f_5@@8))))
(let ((A@@21 (FieldTypeInv0 (type f_5@@8))))
 (=> (and (and (= (type o_3@@28) RefType) (= (type f_5@@8) (FieldType A@@21 B@@20))) (not (= f_5@@8 value))) (= (U_2_real (MapType1Select QPMask@2 o_3@@28 f_5@@8)) (U_2_real (MapType1Select QPMask@3 o_3@@28 f_5@@8))))))
 :qid |stdinbpl.2682:33|
 :skolemid |215|
 :pattern ( (MapType1Select QPMask@3 o_3@@28 f_5@@8))
)) (IdenticalOnKnownLocations Heap@@9 ExhaleHeap@0 QPMask@3))) (and (and (=> (= (ControlFlow 0 124) 116) anon77_Then_correct) (=> (= (ControlFlow 0 124) 97) anon82_Then_correct)) (=> (= (ControlFlow 0 124) 45) anon82_Else_correct)))))))))))))))))))))))))))))))))))))))))))))
(let ((anon66_Else_correct  (and (=> (= (ControlFlow 0 182) (- 0 183)) (forall ((l_1 Int) (l_1_1 Int) ) (!  (=> (and (and (and (and (not (= l_1 l_1_1)) (|Seq#Contains| (|Seq#Range| start end) (int_2_U l_1))) (|Seq#Contains| (|Seq#Range| start end) (int_2_U l_1_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| (MapType0Select Heap@@9 b_2 array) l_1) (|Seq#Index| (MapType0Select Heap@@9 b_2 array) l_1_1))))
 :qid |stdinbpl.2336:15|
 :skolemid |184|
))) (=> (forall ((l_1@@0 Int) (l_1_1@@0 Int) ) (!  (=> (and (and (and (and (not (= l_1@@0 l_1_1@@0)) (|Seq#Contains| (|Seq#Range| start end) (int_2_U l_1@@0))) (|Seq#Contains| (|Seq#Range| start end) (int_2_U l_1_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| (MapType0Select Heap@@9 b_2 array) l_1@@0) (|Seq#Index| (MapType0Select Heap@@9 b_2 array) l_1_1@@0))))
 :qid |stdinbpl.2336:15|
 :skolemid |184|
)) (=> (forall ((l_1@@1 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U l_1@@1)) (< NoPerm FullPerm)) (and (qpRange20 (|Seq#Index| (MapType0Select Heap@@9 b_2 array) l_1@@1)) (= (invRecv20 (|Seq#Index| (MapType0Select Heap@@9 b_2 array) l_1@@1)) l_1@@1)))
 :qid |stdinbpl.2342:22|
 :skolemid |185|
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 b_2 array) l_1@@1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U l_1@@1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U l_1@@1)))
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 b_2 array) l_1@@1))
)) (=> (and (forall ((o_3@@29 T@U) ) (!  (=> (= (type o_3@@29) RefType) (=> (and (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U (invRecv20 o_3@@29))) (< NoPerm FullPerm)) (qpRange20 o_3@@29)) (= (|Seq#Index| (MapType0Select Heap@@9 b_2 array) (invRecv20 o_3@@29)) o_3@@29)))
 :qid |stdinbpl.2346:22|
 :skolemid |186|
 :pattern ( (invRecv20 o_3@@29))
)) (forall ((l_1@@2 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| start end) (int_2_U l_1@@2)) (not (= (|Seq#Index| (MapType0Select Heap@@9 b_2 array) l_1@@2) null)))
 :qid |stdinbpl.2352:22|
 :skolemid |187|
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 b_2 array) l_1@@2))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U l_1@@2)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U l_1@@2)))
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 b_2 array) l_1@@2))
))) (=> (and (and (forall ((o_3@@30 T@U) ) (!  (=> (= (type o_3@@30) RefType) (and (=> (and (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U (invRecv20 o_3@@30))) (< NoPerm FullPerm)) (qpRange20 o_3@@30)) (and (=> (< NoPerm FullPerm) (= (|Seq#Index| (MapType0Select Heap@@9 b_2 array) (invRecv20 o_3@@30)) o_3@@30)) (= (U_2_real (MapType1Select QPMask@1 o_3@@30 value)) (+ (U_2_real (MapType1Select QPMask@0 o_3@@30 value)) FullPerm)))) (=> (not (and (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U (invRecv20 o_3@@30))) (< NoPerm FullPerm)) (qpRange20 o_3@@30))) (= (U_2_real (MapType1Select QPMask@1 o_3@@30 value)) (U_2_real (MapType1Select QPMask@0 o_3@@30 value))))))
 :qid |stdinbpl.2358:22|
 :skolemid |188|
 :pattern ( (MapType1Select QPMask@1 o_3@@30 value))
)) (forall ((o_3@@31 T@U) (f_5@@9 T@U) ) (! (let ((B@@21 (FieldTypeInv1 (type f_5@@9))))
(let ((A@@22 (FieldTypeInv0 (type f_5@@9))))
 (=> (and (and (= (type o_3@@31) RefType) (= (type f_5@@9) (FieldType A@@22 B@@21))) (not (= f_5@@9 value))) (= (U_2_real (MapType1Select QPMask@0 o_3@@31 f_5@@9)) (U_2_real (MapType1Select QPMask@1 o_3@@31 f_5@@9))))))
 :qid |stdinbpl.2362:29|
 :skolemid |189|
 :pattern ( (MapType1Select QPMask@0 o_3@@31 f_5@@9))
 :pattern ( (MapType1Select QPMask@1 o_3@@31 f_5@@9))
))) (and (state Heap@@9 QPMask@1) (state Heap@@9 QPMask@1))) (and (=> (= (ControlFlow 0 182) 177) anon68_Then_correct) (=> (= (ControlFlow 0 182) 124) anon68_Else_correct)))))))))
(let ((anon15_correct true))
(let ((anon67_Else_correct  (=> (and (not (|Seq#Contains| (|Seq#Range| start end) (int_2_U l_3))) (= (ControlFlow 0 30) 25)) anon15_correct)))
(let ((anon67_Then_correct  (=> (|Seq#Contains| (|Seq#Range| start end) (int_2_U l_3)) (and (=> (= (ControlFlow 0 26) (- 0 29)) (HasDirectPerm QPMask@0 b_2 array)) (=> (HasDirectPerm QPMask@0 b_2 array) (and (=> (= (ControlFlow 0 26) (- 0 28)) (>= l_3 0)) (=> (>= l_3 0) (and (=> (= (ControlFlow 0 26) (- 0 27)) (< l_3 (|Seq#Length| (MapType0Select Heap@@9 b_2 array)))) (=> (< l_3 (|Seq#Length| (MapType0Select Heap@@9 b_2 array))) (=> (= (ControlFlow 0 26) 25) anon15_correct))))))))))
(let ((anon64_Else_correct  (=> (and (forall ((i_3 Int) (j_3 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_3)) (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U j_3)) (not (= i_3 j_3)))) (not (= (|Seq#Index| (MapType0Select Heap@@9 b_2 array) i_3) (|Seq#Index| (MapType0Select Heap@@9 b_2 array) j_3))))
 :qid |stdinbpl.2316:20|
 :skolemid |183|
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U i_3)) (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U j_3)))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U i_3)) (|Seq#Contains| (|Seq#Range| start end) (int_2_U j_3)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_3)) (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U j_3)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_3)) (|Seq#Contains| (|Seq#Range| start end) (int_2_U j_3)))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U i_3)) (|Seq#Index| (MapType0Select Heap@@9 b_2 array) j_3))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_3)) (|Seq#Index| (MapType0Select Heap@@9 b_2 array) j_3))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U j_3)) (|Seq#Index| (MapType0Select Heap@@9 b_2 array) i_3))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U j_3)) (|Seq#Index| (MapType0Select Heap@@9 b_2 array) i_3))
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 b_2 array) i_3) (|Seq#Index| (MapType0Select Heap@@9 b_2 array) j_3))
)) (state Heap@@9 QPMask@0)) (and (and (=> (= (ControlFlow 0 184) 182) anon66_Else_correct) (=> (= (ControlFlow 0 184) 26) anon67_Then_correct)) (=> (= (ControlFlow 0 184) 30) anon67_Else_correct)))))
(let ((anon11_correct true))
(let ((anon65_Else_correct  (=> (and (not (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_46)) (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U j_11)) (not (= i_46 j_11))))) (= (ControlFlow 0 24) 16)) anon11_correct)))
(let ((anon65_Then_correct  (=> (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_46)) (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U j_11)) (not (= i_46 j_11)))) (and (=> (= (ControlFlow 0 17) (- 0 23)) (HasDirectPerm QPMask@0 b_2 array)) (=> (HasDirectPerm QPMask@0 b_2 array) (and (=> (= (ControlFlow 0 17) (- 0 22)) (>= i_46 0)) (=> (>= i_46 0) (and (=> (= (ControlFlow 0 17) (- 0 21)) (< i_46 (|Seq#Length| (MapType0Select Heap@@9 b_2 array)))) (=> (< i_46 (|Seq#Length| (MapType0Select Heap@@9 b_2 array))) (and (=> (= (ControlFlow 0 17) (- 0 20)) (HasDirectPerm QPMask@0 b_2 array)) (=> (HasDirectPerm QPMask@0 b_2 array) (and (=> (= (ControlFlow 0 17) (- 0 19)) (>= j_11 0)) (=> (>= j_11 0) (and (=> (= (ControlFlow 0 17) (- 0 18)) (< j_11 (|Seq#Length| (MapType0Select Heap@@9 b_2 array)))) (=> (< j_11 (|Seq#Length| (MapType0Select Heap@@9 b_2 array))) (=> (= (ControlFlow 0 17) 16) anon11_correct))))))))))))))))
(let ((anon62_Else_correct  (and (=> (= (ControlFlow 0 185) (- 0 186)) (forall ((k_1 Int) (k_1_1 Int) ) (!  (=> (and (and (and (and (not (= k_1 k_1_1)) (|Seq#Contains| (|Seq#Range| start end) (int_2_U k_1))) (|Seq#Contains| (|Seq#Range| start end) (int_2_U k_1_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| (MapType0Select Heap@@9 a_2 array) k_1) (|Seq#Index| (MapType0Select Heap@@9 a_2 array) k_1_1))))
 :qid |stdinbpl.2264:15|
 :skolemid |177|
))) (=> (forall ((k_1@@0 Int) (k_1_1@@0 Int) ) (!  (=> (and (and (and (and (not (= k_1@@0 k_1_1@@0)) (|Seq#Contains| (|Seq#Range| start end) (int_2_U k_1@@0))) (|Seq#Contains| (|Seq#Range| start end) (int_2_U k_1_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| (MapType0Select Heap@@9 a_2 array) k_1@@0) (|Seq#Index| (MapType0Select Heap@@9 a_2 array) k_1_1@@0))))
 :qid |stdinbpl.2264:15|
 :skolemid |177|
)) (=> (forall ((k_1@@1 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U k_1@@1)) (< NoPerm FullPerm)) (and (qpRange19 (|Seq#Index| (MapType0Select Heap@@9 a_2 array) k_1@@1)) (= (invRecv19 (|Seq#Index| (MapType0Select Heap@@9 a_2 array) k_1@@1)) k_1@@1)))
 :qid |stdinbpl.2270:22|
 :skolemid |178|
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 a_2 array) k_1@@1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U k_1@@1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U k_1@@1)))
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 a_2 array) k_1@@1))
)) (=> (and (forall ((o_3@@32 T@U) ) (!  (=> (= (type o_3@@32) RefType) (=> (and (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U (invRecv19 o_3@@32))) (< NoPerm FullPerm)) (qpRange19 o_3@@32)) (= (|Seq#Index| (MapType0Select Heap@@9 a_2 array) (invRecv19 o_3@@32)) o_3@@32)))
 :qid |stdinbpl.2274:22|
 :skolemid |179|
 :pattern ( (invRecv19 o_3@@32))
)) (forall ((k_1@@2 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| start end) (int_2_U k_1@@2)) (not (= (|Seq#Index| (MapType0Select Heap@@9 a_2 array) k_1@@2) null)))
 :qid |stdinbpl.2280:22|
 :skolemid |180|
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 a_2 array) k_1@@2))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U k_1@@2)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U k_1@@2)))
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 a_2 array) k_1@@2))
))) (=> (and (and (forall ((o_3@@33 T@U) ) (!  (=> (= (type o_3@@33) RefType) (and (=> (and (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U (invRecv19 o_3@@33))) (< NoPerm FullPerm)) (qpRange19 o_3@@33)) (and (=> (< NoPerm FullPerm) (= (|Seq#Index| (MapType0Select Heap@@9 a_2 array) (invRecv19 o_3@@33)) o_3@@33)) (= (U_2_real (MapType1Select QPMask@0 o_3@@33 value)) (+ (U_2_real (MapType1Select Mask@1 o_3@@33 value)) FullPerm)))) (=> (not (and (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U (invRecv19 o_3@@33))) (< NoPerm FullPerm)) (qpRange19 o_3@@33))) (= (U_2_real (MapType1Select QPMask@0 o_3@@33 value)) (U_2_real (MapType1Select Mask@1 o_3@@33 value))))))
 :qid |stdinbpl.2286:22|
 :skolemid |181|
 :pattern ( (MapType1Select QPMask@0 o_3@@33 value))
)) (forall ((o_3@@34 T@U) (f_5@@10 T@U) ) (! (let ((B@@22 (FieldTypeInv1 (type f_5@@10))))
(let ((A@@23 (FieldTypeInv0 (type f_5@@10))))
 (=> (and (and (= (type o_3@@34) RefType) (= (type f_5@@10) (FieldType A@@23 B@@22))) (not (= f_5@@10 value))) (= (U_2_real (MapType1Select Mask@1 o_3@@34 f_5@@10)) (U_2_real (MapType1Select QPMask@0 o_3@@34 f_5@@10))))))
 :qid |stdinbpl.2290:29|
 :skolemid |182|
 :pattern ( (MapType1Select Mask@1 o_3@@34 f_5@@10))
 :pattern ( (MapType1Select QPMask@0 o_3@@34 f_5@@10))
))) (and (state Heap@@9 QPMask@0) (state Heap@@9 QPMask@0))) (and (and (=> (= (ControlFlow 0 185) 184) anon64_Else_correct) (=> (= (ControlFlow 0 185) 17) anon65_Then_correct)) (=> (= (ControlFlow 0 185) 24) anon65_Else_correct)))))))))
(let ((anon7_correct true))
(let ((anon63_Else_correct  (=> (and (not (|Seq#Contains| (|Seq#Range| start end) (int_2_U k_3))) (= (ControlFlow 0 15) 10)) anon7_correct)))
(let ((anon63_Then_correct  (=> (|Seq#Contains| (|Seq#Range| start end) (int_2_U k_3)) (and (=> (= (ControlFlow 0 11) (- 0 14)) (HasDirectPerm Mask@1 a_2 array)) (=> (HasDirectPerm Mask@1 a_2 array) (and (=> (= (ControlFlow 0 11) (- 0 13)) (>= k_3 0)) (=> (>= k_3 0) (and (=> (= (ControlFlow 0 11) (- 0 12)) (< k_3 (|Seq#Length| (MapType0Select Heap@@9 a_2 array)))) (=> (< k_3 (|Seq#Length| (MapType0Select Heap@@9 a_2 array))) (=> (= (ControlFlow 0 11) 10) anon7_correct))))))))))
(let ((anon60_Else_correct  (=> (and (forall ((i_1 Int) (j_1 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_1)) (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U j_1)) (not (= i_1 j_1)))) (not (= (|Seq#Index| (MapType0Select Heap@@9 a_2 array) i_1) (|Seq#Index| (MapType0Select Heap@@9 a_2 array) j_1))))
 :qid |stdinbpl.2244:20|
 :skolemid |176|
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U i_1)) (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U j_1)))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U i_1)) (|Seq#Contains| (|Seq#Range| start end) (int_2_U j_1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_1)) (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U j_1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_1)) (|Seq#Contains| (|Seq#Range| start end) (int_2_U j_1)))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U i_1)) (|Seq#Index| (MapType0Select Heap@@9 a_2 array) j_1))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_1)) (|Seq#Index| (MapType0Select Heap@@9 a_2 array) j_1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U j_1)) (|Seq#Index| (MapType0Select Heap@@9 a_2 array) i_1))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U j_1)) (|Seq#Index| (MapType0Select Heap@@9 a_2 array) i_1))
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 a_2 array) i_1) (|Seq#Index| (MapType0Select Heap@@9 a_2 array) j_1))
)) (state Heap@@9 Mask@1)) (and (and (=> (= (ControlFlow 0 187) 185) anon62_Else_correct) (=> (= (ControlFlow 0 187) 11) anon63_Then_correct)) (=> (= (ControlFlow 0 187) 15) anon63_Else_correct)))))
(let ((anon3_correct true))
(let ((anon61_Else_correct  (=> (and (not (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_41)) (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U j_9)) (not (= i_41 j_9))))) (= (ControlFlow 0 9) 1)) anon3_correct)))
(let ((anon61_Then_correct  (=> (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_41)) (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U j_9)) (not (= i_41 j_9)))) (and (=> (= (ControlFlow 0 2) (- 0 8)) (HasDirectPerm Mask@1 a_2 array)) (=> (HasDirectPerm Mask@1 a_2 array) (and (=> (= (ControlFlow 0 2) (- 0 7)) (>= i_41 0)) (=> (>= i_41 0) (and (=> (= (ControlFlow 0 2) (- 0 6)) (< i_41 (|Seq#Length| (MapType0Select Heap@@9 a_2 array)))) (=> (< i_41 (|Seq#Length| (MapType0Select Heap@@9 a_2 array))) (and (=> (= (ControlFlow 0 2) (- 0 5)) (HasDirectPerm Mask@1 a_2 array)) (=> (HasDirectPerm Mask@1 a_2 array) (and (=> (= (ControlFlow 0 2) (- 0 4)) (>= j_9 0)) (=> (>= j_9 0) (and (=> (= (ControlFlow 0 2) (- 0 3)) (< j_9 (|Seq#Length| (MapType0Select Heap@@9 a_2 array)))) (=> (< j_9 (|Seq#Length| (MapType0Select Heap@@9 a_2 array))) (=> (= (ControlFlow 0 2) 1) anon3_correct))))))))))))))))
(let ((anon0_correct  (=> (and (state Heap@@9 ZeroMask) (U_2_bool (MapType0Select Heap@@9 a_2 $allocated))) (=> (and (and (U_2_bool (MapType0Select Heap@@9 b_2 $allocated)) (> wildcard@0 NoPerm)) (and (not (= a_2 null)) (= Mask@0 (MapType1Store ZeroMask a_2 array (real_2_U (+ (U_2_real (MapType1Select ZeroMask a_2 array)) wildcard@0)))))) (=> (and (and (and (state Heap@@9 Mask@0) (state Heap@@9 Mask@0)) (and (> wildcard@1 NoPerm) (not (= b_2 null)))) (and (and (= Mask@1 (MapType1Store Mask@0 b_2 array (real_2_U (+ (U_2_real (MapType1Select Mask@0 b_2 array)) wildcard@1)))) (state Heap@@9 Mask@1)) (and (state Heap@@9 Mask@1) (<= 0 start)))) (and (=> (= (ControlFlow 0 188) (- 0 191)) (HasDirectPerm Mask@1 a_2 array)) (=> (HasDirectPerm Mask@1 a_2 array) (=> (<= end (|Seq#Length| (MapType0Select Heap@@9 a_2 array))) (and (=> (= (ControlFlow 0 188) (- 0 190)) (HasDirectPerm Mask@1 b_2 array)) (=> (HasDirectPerm Mask@1 b_2 array) (and (=> (= (ControlFlow 0 188) (- 0 189)) (HasDirectPerm Mask@1 a_2 array)) (=> (HasDirectPerm Mask@1 a_2 array) (=> (and (and (= (|Seq#Length| (MapType0Select Heap@@9 b_2 array)) (|Seq#Length| (MapType0Select Heap@@9 a_2 array))) (< start middle)) (and (< middle end) (state Heap@@9 Mask@1))) (and (and (=> (= (ControlFlow 0 188) 187) anon60_Else_correct) (=> (= (ControlFlow 0 188) 2) anon61_Then_correct)) (=> (= (ControlFlow 0 188) 9) anon61_Else_correct)))))))))))))))
(let ((PreconditionGeneratedEntry_correct  (=> (and (and (> wildcard NoPerm) true) (= (ControlFlow 0 192) 188)) anon0_correct)))
PreconditionGeneratedEntry_correct)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
))
(check-sat)
(pop 1)
; Valid
(get-info :rlimit)
