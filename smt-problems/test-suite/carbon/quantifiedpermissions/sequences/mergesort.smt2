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
(declare-fun i_16 () Int)
(declare-fun QPMask@16 () T@U)
(declare-fun b_2 () T@U)
(declare-fun PostHeap@0 () T@U)
(declare-fun qpRange4 (T@U) Bool)
(declare-fun invRecv4 (T@U) Int)
(declare-fun QPMask@17 () T@U)
(declare-fun a_2 () T@U)
(declare-fun QPMask@1 () T@U)
(declare-fun Heap@@9 () T@U)
(declare-fun i_12 () Int)
(declare-fun j_6 () Int)
(declare-fun qpRange3 (T@U) Bool)
(declare-fun invRecv3 (T@U) Int)
(declare-fun PostMask@1 () T@U)
(declare-fun i_10 () Int)
(declare-fun i_8 () Int)
(declare-fun j_4 () Int)
(declare-fun wildcard@2 () Real)
(declare-fun PostMask@0 () T@U)
(declare-fun wildcard@3 () Real)
(declare-fun i_40 () Int)
(declare-fun j_14 () Int)
(declare-fun ExhaleHeap@7 () T@U)
(declare-fun i_38_1 () Int)
(declare-fun j_12 () Int)
(declare-fun middle@0 () Int)
(declare-fun i_39 () Int)
(declare-fun QPMask@8 () T@U)
(declare-fun i_38 () Int)
(declare-fun Mask@9 () T@U)
(declare-fun i_36 () Int)
(declare-fun QPMask@6 () T@U)
(declare-fun i_34 () Int)
(declare-fun Mask@7 () T@U)
(declare-fun i_32 () Int)
(declare-fun QPMask@4 () T@U)
(declare-fun ExhaleHeap@6 () T@U)
(declare-fun i_30 () Int)
(declare-fun Mask@5 () T@U)
(declare-fun ExhaleHeap@5 () T@U)
(declare-fun i_22 () Int)
(declare-fun QPMask@2 () T@U)
(declare-fun ExhaleHeap@2 () T@U)
(declare-fun i_20 () Int)
(declare-fun Mask@3 () T@U)
(declare-fun ExhaleHeap@1 () T@U)
(declare-fun i_19 () Int)
(declare-fun j_10 () Int)
(declare-fun Heap@0 () T@U)
(declare-fun neverTriggered6 (Int) Bool)
(declare-fun QPMask@14 () T@U)
(declare-fun qpRange6 (T@U) Bool)
(declare-fun invRecv6 (T@U) Int)
(declare-fun QPMask@15 () T@U)
(declare-fun neverTriggered5 (Int) Bool)
(declare-fun Mask@16 () T@U)
(declare-fun qpRange5 (T@U) Bool)
(declare-fun invRecv5 (T@U) Int)
(declare-fun i_16_1 () Int)
(declare-fun j_8 () Int)
(declare-fun Mask@14 () T@U)
(declare-fun wildcard@16 () Real)
(declare-fun Mask@15 () T@U)
(declare-fun wildcard@17 () Real)
(declare-fun neverTriggered16 (Int) Bool)
(declare-fun QPMask@10 () T@U)
(declare-fun qpRange16 (T@U) Bool)
(declare-fun invRecv16 (T@U) Int)
(declare-fun QPMask@11 () T@U)
(declare-fun ExhaleHeap@8 () T@U)
(declare-fun wildcard@14 () Real)
(declare-fun Mask@12 () T@U)
(declare-fun wildcard@15 () Real)
(declare-fun Mask@13 () T@U)
(declare-fun qpRange17 (T@U) Bool)
(declare-fun invRecv17 (T@U) Int)
(declare-fun QPMask@12 () T@U)
(declare-fun qpRange18 (T@U) Bool)
(declare-fun invRecv18 (T@U) Int)
(declare-fun QPMask@13 () T@U)
(declare-fun neverTriggered15 (Int) Bool)
(declare-fun Mask@11 () T@U)
(declare-fun qpRange15 (T@U) Bool)
(declare-fun invRecv15 (T@U) Int)
(declare-fun qpRange14 (T@U) Bool)
(declare-fun invRecv14 (T@U) Int)
(declare-fun QPMask@9 () T@U)
(declare-fun t2A@0 () T@U)
(declare-fun t2B@0 () T@U)
(declare-fun wildcard@12 () Real)
(declare-fun Mask@10 () T@U)
(declare-fun wildcard@13 () Real)
(declare-fun qpRange13 (T@U) Bool)
(declare-fun invRecv13 (T@U) Int)
(declare-fun qpRange12 (T@U) Bool)
(declare-fun invRecv12 (T@U) Int)
(declare-fun QPMask@7 () T@U)
(declare-fun t1A@0 () T@U)
(declare-fun t1B@0 () T@U)
(declare-fun wildcard@10 () Real)
(declare-fun Mask@8 () T@U)
(declare-fun wildcard@11 () Real)
(declare-fun qpRange11 (T@U) Bool)
(declare-fun invRecv11 (T@U) Int)
(declare-fun neverTriggered10 (Int) Bool)
(declare-fun qpRange10 (T@U) Bool)
(declare-fun invRecv10 (T@U) Int)
(declare-fun QPMask@5 () T@U)
(declare-fun wildcard@8 () Real)
(declare-fun Mask@6 () T@U)
(declare-fun wildcard@9 () Real)
(declare-fun neverTriggered9 (Int) Bool)
(declare-fun qpRange9 (T@U) Bool)
(declare-fun invRecv9 (T@U) Int)
(declare-fun neverTriggered8 (Int) Bool)
(declare-fun qpRange8 (T@U) Bool)
(declare-fun invRecv8 (T@U) Int)
(declare-fun QPMask@3 () T@U)
(declare-fun ExhaleHeap@3 () T@U)
(declare-fun wildcard@6 () Real)
(declare-fun Mask@4 () T@U)
(declare-fun ExhaleHeap@4 () T@U)
(declare-fun wildcard@7 () Real)
(declare-fun neverTriggered7 (Int) Bool)
(declare-fun qpRange7 (T@U) Bool)
(declare-fun invRecv7 (T@U) Int)
(declare-fun wildcard@4 () Real)
(declare-fun Mask@2 () T@U)
(declare-fun ExhaleHeap@0 () T@U)
(declare-fun wildcard@5 () Real)
(declare-fun qpRange2 (T@U) Bool)
(declare-fun invRecv2 (T@U) Int)
(declare-fun QPMask@0 () T@U)
(declare-fun i_6 () Int)
(declare-fun i_4 () Int)
(declare-fun j_2 () Int)
(declare-fun qpRange1 (T@U) Bool)
(declare-fun invRecv1 (T@U) Int)
(declare-fun Mask@1 () T@U)
(declare-fun i_2 () Int)
(declare-fun i@@6 () Int)
(declare-fun j@@5 () Int)
(declare-fun wildcard@0 () Real)
(declare-fun Mask@0 () T@U)
(declare-fun wildcard@1 () Real)
(declare-fun wildcard () Real)
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (= (type Mask@1) (MapType1Type RefType realType)) (= (type a_2) RefType)) (= (type Heap@@9) (MapType0Type RefType))) (= (type QPMask@0) (MapType1Type RefType realType))) (= (type b_2) RefType)) (= (type Heap@0) (MapType0Type RefType))) (= (type QPMask@14) (MapType1Type RefType realType))) (= (type QPMask@15) (MapType1Type RefType realType))) (= (type Mask@16) (MapType1Type RefType realType))) (= (type Mask@14) (MapType1Type RefType realType))) (= (type Mask@15) (MapType1Type RefType realType))) (= (type QPMask@1) (MapType1Type RefType realType))) (= (type Mask@3) (MapType1Type RefType realType))) (= (type ExhaleHeap@1) (MapType0Type RefType))) (= (type QPMask@2) (MapType1Type RefType realType))) (= (type ExhaleHeap@2) (MapType0Type RefType))) (= (type Mask@5) (MapType1Type RefType realType))) (= (type ExhaleHeap@5) (MapType0Type RefType))) (= (type QPMask@4) (MapType1Type RefType realType))) (= (type ExhaleHeap@6) (MapType0Type RefType))) (= (type Mask@7) (MapType1Type RefType realType))) (= (type ExhaleHeap@7) (MapType0Type RefType))) (= (type QPMask@6) (MapType1Type RefType realType))) (= (type Mask@9) (MapType1Type RefType realType))) (= (type QPMask@8) (MapType1Type RefType realType))) (= (type QPMask@10) (MapType1Type RefType realType))) (= (type QPMask@11) (MapType1Type RefType realType))) (= (type ExhaleHeap@8) (MapType0Type RefType))) (= (type Mask@12) (MapType1Type RefType realType))) (= (type Mask@13) (MapType1Type RefType realType))) (= (type QPMask@12) (MapType1Type RefType realType))) (= (type QPMask@13) (MapType1Type RefType realType))) (= (type Mask@11) (MapType1Type RefType realType))) (= (type QPMask@9) (MapType1Type RefType realType))) (= (type t2A@0) (SeqType RefType))) (= (type t2B@0) (SeqType RefType))) (= (type Mask@10) (MapType1Type RefType realType))) (= (type QPMask@7) (MapType1Type RefType realType))) (= (type t1A@0) (SeqType RefType))) (= (type t1B@0) (SeqType RefType))) (= (type Mask@8) (MapType1Type RefType realType))) (= (type QPMask@5) (MapType1Type RefType realType))) (= (type Mask@6) (MapType1Type RefType realType))) (= (type QPMask@3) (MapType1Type RefType realType))) (= (type ExhaleHeap@3) (MapType0Type RefType))) (= (type Mask@4) (MapType1Type RefType realType))) (= (type ExhaleHeap@4) (MapType0Type RefType))) (= (type Mask@2) (MapType1Type RefType realType))) (= (type ExhaleHeap@0) (MapType0Type RefType))) (= (type PostMask@1) (MapType1Type RefType realType))) (= (type PostHeap@0) (MapType0Type RefType))) (= (type QPMask@16) (MapType1Type RefType realType))) (= (type QPMask@17) (MapType1Type RefType realType))) (= (type PostMask@0) (MapType1Type RefType realType))) (= (type Mask@0) (MapType1Type RefType realType))))
(set-info :boogie-vc-id parallel_mergesort)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 224) (let ((anon32_correct true))
(let ((anon101_Else_correct  (=> (and (not (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_16))) (= (ControlFlow 0 205) 200)) anon32_correct)))
(let ((anon101_Then_correct  (=> (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_16)) (and (=> (= (ControlFlow 0 201) (- 0 204)) (HasDirectPerm QPMask@16 b_2 array)) (=> (HasDirectPerm QPMask@16 b_2 array) (and (=> (= (ControlFlow 0 201) (- 0 203)) (>= i_16 0)) (=> (>= i_16 0) (and (=> (= (ControlFlow 0 201) (- 0 202)) (< i_16 (|Seq#Length| (MapType0Select PostHeap@0 b_2 array)))) (=> (< i_16 (|Seq#Length| (MapType0Select PostHeap@0 b_2 array))) (=> (= (ControlFlow 0 201) 200) anon32_correct))))))))))
(let ((anon100_Else_correct  (and (=> (= (ControlFlow 0 195) (- 0 199)) (forall ((i_15 Int) (i_15_1 Int) ) (!  (=> (and (and (and (and (not (= i_15 i_15_1)) (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_15))) (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_15_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| (MapType0Select PostHeap@0 b_2 array) i_15) (|Seq#Index| (MapType0Select PostHeap@0 b_2 array) i_15_1))))
 :qid |stdinbpl.1042:15|
 :skolemid |80|
))) (=> (forall ((i_15@@0 Int) (i_15_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_15@@0 i_15_1@@0)) (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_15@@0))) (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_15_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| (MapType0Select PostHeap@0 b_2 array) i_15@@0) (|Seq#Index| (MapType0Select PostHeap@0 b_2 array) i_15_1@@0))))
 :qid |stdinbpl.1042:15|
 :skolemid |80|
)) (=> (forall ((i_15@@1 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_15@@1)) (< NoPerm FullPerm)) (and (qpRange4 (|Seq#Index| (MapType0Select PostHeap@0 b_2 array) i_15@@1)) (= (invRecv4 (|Seq#Index| (MapType0Select PostHeap@0 b_2 array) i_15@@1)) i_15@@1)))
 :qid |stdinbpl.1048:22|
 :skolemid |81|
 :pattern ( (|Seq#Index| (MapType0Select PostHeap@0 b_2 array) i_15@@1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U i_15@@1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_15@@1)))
 :pattern ( (|Seq#Index| (MapType0Select PostHeap@0 b_2 array) i_15@@1))
)) (=> (and (forall ((o_3 T@U) ) (!  (=> (= (type o_3) RefType) (=> (and (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U (invRecv4 o_3))) (< NoPerm FullPerm)) (qpRange4 o_3)) (= (|Seq#Index| (MapType0Select PostHeap@0 b_2 array) (invRecv4 o_3)) o_3)))
 :qid |stdinbpl.1052:22|
 :skolemid |82|
 :pattern ( (invRecv4 o_3))
)) (forall ((i_15@@2 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_15@@2)) (not (= (|Seq#Index| (MapType0Select PostHeap@0 b_2 array) i_15@@2) null)))
 :qid |stdinbpl.1058:22|
 :skolemid |83|
 :pattern ( (|Seq#Index| (MapType0Select PostHeap@0 b_2 array) i_15@@2))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U i_15@@2)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_15@@2)))
 :pattern ( (|Seq#Index| (MapType0Select PostHeap@0 b_2 array) i_15@@2))
))) (=> (and (and (forall ((o_3@@0 T@U) ) (!  (=> (= (type o_3@@0) RefType) (and (=> (and (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U (invRecv4 o_3@@0))) (< NoPerm FullPerm)) (qpRange4 o_3@@0)) (and (=> (< NoPerm FullPerm) (= (|Seq#Index| (MapType0Select PostHeap@0 b_2 array) (invRecv4 o_3@@0)) o_3@@0)) (= (U_2_real (MapType1Select QPMask@17 o_3@@0 value)) (+ (U_2_real (MapType1Select QPMask@16 o_3@@0 value)) FullPerm)))) (=> (not (and (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U (invRecv4 o_3@@0))) (< NoPerm FullPerm)) (qpRange4 o_3@@0))) (= (U_2_real (MapType1Select QPMask@17 o_3@@0 value)) (U_2_real (MapType1Select QPMask@16 o_3@@0 value))))))
 :qid |stdinbpl.1064:22|
 :skolemid |84|
 :pattern ( (MapType1Select QPMask@17 o_3@@0 value))
)) (forall ((o_3@@1 T@U) (f_5 T@U) ) (! (let ((B@@11 (FieldTypeInv1 (type f_5))))
(let ((A@@12 (FieldTypeInv0 (type f_5))))
 (=> (and (and (= (type o_3@@1) RefType) (= (type f_5) (FieldType A@@12 B@@11))) (not (= f_5 value))) (= (U_2_real (MapType1Select QPMask@16 o_3@@1 f_5)) (U_2_real (MapType1Select QPMask@17 o_3@@1 f_5))))))
 :qid |stdinbpl.1068:29|
 :skolemid |85|
 :pattern ( (MapType1Select QPMask@16 o_3@@1 f_5))
 :pattern ( (MapType1Select QPMask@17 o_3@@1 f_5))
))) (and (state PostHeap@0 QPMask@17) (state PostHeap@0 QPMask@17))) (and (=> (= (ControlFlow 0 195) (- 0 198)) (HasDirectPerm QPMask@17 a_2 array)) (=> (HasDirectPerm QPMask@17 a_2 array) (and (=> (= (ControlFlow 0 195) (- 0 197)) (HasDirectPerm QPMask@1 a_2 array)) (=> (HasDirectPerm QPMask@1 a_2 array) (=> (and (|Seq#Equal| (MapType0Select PostHeap@0 a_2 array) (MapType0Select Heap@@9 a_2 array)) (state PostHeap@0 QPMask@17)) (and (=> (= (ControlFlow 0 195) (- 0 196)) (HasDirectPerm QPMask@17 b_2 array)) (=> (HasDirectPerm QPMask@17 b_2 array) (=> (= (ControlFlow 0 195) (- 0 194)) (HasDirectPerm QPMask@1 b_2 array))))))))))))))))
(let ((anon98_Else_correct  (=> (and (forall ((i_13 Int) (j_7 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_13)) (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U j_7)) (not (= i_13 j_7)))) (not (= (|Seq#Index| (MapType0Select PostHeap@0 b_2 array) i_13) (|Seq#Index| (MapType0Select PostHeap@0 b_2 array) j_7))))
 :qid |stdinbpl.1022:20|
 :skolemid |79|
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U i_13)) (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U j_7)))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U i_13)) (|Seq#Contains| (|Seq#Range| start end) (int_2_U j_7)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_13)) (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U j_7)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_13)) (|Seq#Contains| (|Seq#Range| start end) (int_2_U j_7)))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U i_13)) (|Seq#Index| (MapType0Select PostHeap@0 b_2 array) j_7))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_13)) (|Seq#Index| (MapType0Select PostHeap@0 b_2 array) j_7))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U j_7)) (|Seq#Index| (MapType0Select PostHeap@0 b_2 array) i_13))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U j_7)) (|Seq#Index| (MapType0Select PostHeap@0 b_2 array) i_13))
 :pattern ( (|Seq#Index| (MapType0Select PostHeap@0 b_2 array) i_13) (|Seq#Index| (MapType0Select PostHeap@0 b_2 array) j_7))
)) (state PostHeap@0 QPMask@16)) (and (and (=> (= (ControlFlow 0 206) 195) anon100_Else_correct) (=> (= (ControlFlow 0 206) 201) anon101_Then_correct)) (=> (= (ControlFlow 0 206) 205) anon101_Else_correct)))))
(let ((anon28_correct true))
(let ((anon99_Else_correct  (=> (and (not (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_12)) (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U j_6)) (not (= i_12 j_6))))) (= (ControlFlow 0 193) 185)) anon28_correct)))
(let ((anon99_Then_correct  (=> (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_12)) (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U j_6)) (not (= i_12 j_6)))) (and (=> (= (ControlFlow 0 186) (- 0 192)) (HasDirectPerm QPMask@16 b_2 array)) (=> (HasDirectPerm QPMask@16 b_2 array) (and (=> (= (ControlFlow 0 186) (- 0 191)) (>= i_12 0)) (=> (>= i_12 0) (and (=> (= (ControlFlow 0 186) (- 0 190)) (< i_12 (|Seq#Length| (MapType0Select PostHeap@0 b_2 array)))) (=> (< i_12 (|Seq#Length| (MapType0Select PostHeap@0 b_2 array))) (and (=> (= (ControlFlow 0 186) (- 0 189)) (HasDirectPerm QPMask@16 b_2 array)) (=> (HasDirectPerm QPMask@16 b_2 array) (and (=> (= (ControlFlow 0 186) (- 0 188)) (>= j_6 0)) (=> (>= j_6 0) (and (=> (= (ControlFlow 0 186) (- 0 187)) (< j_6 (|Seq#Length| (MapType0Select PostHeap@0 b_2 array)))) (=> (< j_6 (|Seq#Length| (MapType0Select PostHeap@0 b_2 array))) (=> (= (ControlFlow 0 186) 185) anon28_correct))))))))))))))))
(let ((anon96_Else_correct  (and (=> (= (ControlFlow 0 207) (- 0 208)) (forall ((i_11 Int) (i_11_1 Int) ) (!  (=> (and (and (and (and (not (= i_11 i_11_1)) (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_11))) (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_11_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| (MapType0Select PostHeap@0 a_2 array) i_11) (|Seq#Index| (MapType0Select PostHeap@0 a_2 array) i_11_1))))
 :qid |stdinbpl.970:15|
 :skolemid |73|
))) (=> (forall ((i_11@@0 Int) (i_11_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_11@@0 i_11_1@@0)) (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_11@@0))) (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_11_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| (MapType0Select PostHeap@0 a_2 array) i_11@@0) (|Seq#Index| (MapType0Select PostHeap@0 a_2 array) i_11_1@@0))))
 :qid |stdinbpl.970:15|
 :skolemid |73|
)) (=> (forall ((i_11@@1 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_11@@1)) (< NoPerm FullPerm)) (and (qpRange3 (|Seq#Index| (MapType0Select PostHeap@0 a_2 array) i_11@@1)) (= (invRecv3 (|Seq#Index| (MapType0Select PostHeap@0 a_2 array) i_11@@1)) i_11@@1)))
 :qid |stdinbpl.976:22|
 :skolemid |74|
 :pattern ( (|Seq#Index| (MapType0Select PostHeap@0 a_2 array) i_11@@1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U i_11@@1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_11@@1)))
 :pattern ( (|Seq#Index| (MapType0Select PostHeap@0 a_2 array) i_11@@1))
)) (=> (and (forall ((o_3@@2 T@U) ) (!  (=> (= (type o_3@@2) RefType) (=> (and (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U (invRecv3 o_3@@2))) (< NoPerm FullPerm)) (qpRange3 o_3@@2)) (= (|Seq#Index| (MapType0Select PostHeap@0 a_2 array) (invRecv3 o_3@@2)) o_3@@2)))
 :qid |stdinbpl.980:22|
 :skolemid |75|
 :pattern ( (invRecv3 o_3@@2))
)) (forall ((i_11@@2 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_11@@2)) (not (= (|Seq#Index| (MapType0Select PostHeap@0 a_2 array) i_11@@2) null)))
 :qid |stdinbpl.986:22|
 :skolemid |76|
 :pattern ( (|Seq#Index| (MapType0Select PostHeap@0 a_2 array) i_11@@2))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U i_11@@2)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_11@@2)))
 :pattern ( (|Seq#Index| (MapType0Select PostHeap@0 a_2 array) i_11@@2))
))) (=> (and (and (forall ((o_3@@3 T@U) ) (!  (=> (= (type o_3@@3) RefType) (and (=> (and (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U (invRecv3 o_3@@3))) (< NoPerm FullPerm)) (qpRange3 o_3@@3)) (and (=> (< NoPerm FullPerm) (= (|Seq#Index| (MapType0Select PostHeap@0 a_2 array) (invRecv3 o_3@@3)) o_3@@3)) (= (U_2_real (MapType1Select QPMask@16 o_3@@3 value)) (+ (U_2_real (MapType1Select PostMask@1 o_3@@3 value)) FullPerm)))) (=> (not (and (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U (invRecv3 o_3@@3))) (< NoPerm FullPerm)) (qpRange3 o_3@@3))) (= (U_2_real (MapType1Select QPMask@16 o_3@@3 value)) (U_2_real (MapType1Select PostMask@1 o_3@@3 value))))))
 :qid |stdinbpl.992:22|
 :skolemid |77|
 :pattern ( (MapType1Select QPMask@16 o_3@@3 value))
)) (forall ((o_3@@4 T@U) (f_5@@0 T@U) ) (! (let ((B@@12 (FieldTypeInv1 (type f_5@@0))))
(let ((A@@13 (FieldTypeInv0 (type f_5@@0))))
 (=> (and (and (= (type o_3@@4) RefType) (= (type f_5@@0) (FieldType A@@13 B@@12))) (not (= f_5@@0 value))) (= (U_2_real (MapType1Select PostMask@1 o_3@@4 f_5@@0)) (U_2_real (MapType1Select QPMask@16 o_3@@4 f_5@@0))))))
 :qid |stdinbpl.996:29|
 :skolemid |78|
 :pattern ( (MapType1Select PostMask@1 o_3@@4 f_5@@0))
 :pattern ( (MapType1Select QPMask@16 o_3@@4 f_5@@0))
))) (and (state PostHeap@0 QPMask@16) (state PostHeap@0 QPMask@16))) (and (and (=> (= (ControlFlow 0 207) 206) anon98_Else_correct) (=> (= (ControlFlow 0 207) 186) anon99_Then_correct)) (=> (= (ControlFlow 0 207) 193) anon99_Else_correct)))))))))
(let ((anon24_correct true))
(let ((anon97_Else_correct  (=> (and (not (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_10))) (= (ControlFlow 0 184) 179)) anon24_correct)))
(let ((anon97_Then_correct  (=> (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_10)) (and (=> (= (ControlFlow 0 180) (- 0 183)) (HasDirectPerm PostMask@1 a_2 array)) (=> (HasDirectPerm PostMask@1 a_2 array) (and (=> (= (ControlFlow 0 180) (- 0 182)) (>= i_10 0)) (=> (>= i_10 0) (and (=> (= (ControlFlow 0 180) (- 0 181)) (< i_10 (|Seq#Length| (MapType0Select PostHeap@0 a_2 array)))) (=> (< i_10 (|Seq#Length| (MapType0Select PostHeap@0 a_2 array))) (=> (= (ControlFlow 0 180) 179) anon24_correct))))))))))
(let ((anon94_Else_correct  (=> (and (forall ((i_9 Int) (j_5 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_9)) (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U j_5)) (not (= i_9 j_5)))) (not (= (|Seq#Index| (MapType0Select PostHeap@0 a_2 array) i_9) (|Seq#Index| (MapType0Select PostHeap@0 a_2 array) j_5))))
 :qid |stdinbpl.950:20|
 :skolemid |72|
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U i_9)) (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U j_5)))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U i_9)) (|Seq#Contains| (|Seq#Range| start end) (int_2_U j_5)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_9)) (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U j_5)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_9)) (|Seq#Contains| (|Seq#Range| start end) (int_2_U j_5)))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U i_9)) (|Seq#Index| (MapType0Select PostHeap@0 a_2 array) j_5))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_9)) (|Seq#Index| (MapType0Select PostHeap@0 a_2 array) j_5))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U j_5)) (|Seq#Index| (MapType0Select PostHeap@0 a_2 array) i_9))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U j_5)) (|Seq#Index| (MapType0Select PostHeap@0 a_2 array) i_9))
 :pattern ( (|Seq#Index| (MapType0Select PostHeap@0 a_2 array) i_9) (|Seq#Index| (MapType0Select PostHeap@0 a_2 array) j_5))
)) (state PostHeap@0 PostMask@1)) (and (and (=> (= (ControlFlow 0 209) 207) anon96_Else_correct) (=> (= (ControlFlow 0 209) 180) anon97_Then_correct)) (=> (= (ControlFlow 0 209) 184) anon97_Else_correct)))))
(let ((anon20_correct true))
(let ((anon95_Else_correct  (=> (and (not (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_8)) (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U j_4)) (not (= i_8 j_4))))) (= (ControlFlow 0 178) 170)) anon20_correct)))
(let ((anon95_Then_correct  (=> (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_8)) (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U j_4)) (not (= i_8 j_4)))) (and (=> (= (ControlFlow 0 171) (- 0 177)) (HasDirectPerm PostMask@1 a_2 array)) (=> (HasDirectPerm PostMask@1 a_2 array) (and (=> (= (ControlFlow 0 171) (- 0 176)) (>= i_8 0)) (=> (>= i_8 0) (and (=> (= (ControlFlow 0 171) (- 0 175)) (< i_8 (|Seq#Length| (MapType0Select PostHeap@0 a_2 array)))) (=> (< i_8 (|Seq#Length| (MapType0Select PostHeap@0 a_2 array))) (and (=> (= (ControlFlow 0 171) (- 0 174)) (HasDirectPerm PostMask@1 a_2 array)) (=> (HasDirectPerm PostMask@1 a_2 array) (and (=> (= (ControlFlow 0 171) (- 0 173)) (>= j_4 0)) (=> (>= j_4 0) (and (=> (= (ControlFlow 0 171) (- 0 172)) (< j_4 (|Seq#Length| (MapType0Select PostHeap@0 a_2 array)))) (=> (< j_4 (|Seq#Length| (MapType0Select PostHeap@0 a_2 array))) (=> (= (ControlFlow 0 171) 170) anon20_correct))))))))))))))))
(let ((anon93_Then_correct  (=> (and (and (state PostHeap@0 ZeroMask) (> wildcard@2 NoPerm)) (and (not (= a_2 null)) (= PostMask@0 (MapType1Store ZeroMask a_2 array (real_2_U (+ (U_2_real (MapType1Select ZeroMask a_2 array)) wildcard@2)))))) (=> (and (and (and (state PostHeap@0 PostMask@0) (state PostHeap@0 PostMask@0)) (and (> wildcard@3 NoPerm) (not (= b_2 null)))) (and (and (= PostMask@1 (MapType1Store PostMask@0 b_2 array (real_2_U (+ (U_2_real (MapType1Select PostMask@0 b_2 array)) wildcard@3)))) (state PostHeap@0 PostMask@1)) (and (state PostHeap@0 PostMask@1) (>= start 0)))) (and (=> (= (ControlFlow 0 210) (- 0 213)) (HasDirectPerm PostMask@1 a_2 array)) (=> (HasDirectPerm PostMask@1 a_2 array) (=> (<= end (|Seq#Length| (MapType0Select PostHeap@0 a_2 array))) (and (=> (= (ControlFlow 0 210) (- 0 212)) (HasDirectPerm PostMask@1 a_2 array)) (=> (HasDirectPerm PostMask@1 a_2 array) (and (=> (= (ControlFlow 0 210) (- 0 211)) (HasDirectPerm PostMask@1 b_2 array)) (=> (HasDirectPerm PostMask@1 b_2 array) (=> (and (= (|Seq#Length| (MapType0Select PostHeap@0 a_2 array)) (|Seq#Length| (MapType0Select PostHeap@0 b_2 array))) (state PostHeap@0 PostMask@1)) (and (and (=> (= (ControlFlow 0 210) 209) anon94_Else_correct) (=> (= (ControlFlow 0 210) 171) anon95_Then_correct)) (=> (= (ControlFlow 0 210) 178) anon95_Else_correct))))))))))))))
(let ((anon74_correct true))
(let ((anon122_Else_correct  (=> (and (not (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_40)) (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U j_14)) (not (= i_40 j_14))))) (= (ControlFlow 0 114) 111)) anon74_correct)))
(let ((anon122_Then_correct  (=> (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_40)) (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U j_14)) (not (= i_40 j_14)))) (and (=> (= (ControlFlow 0 112) (- 0 113)) (not (= (|Seq#Index| (MapType0Select ExhaleHeap@7 b_2 array) i_40) (|Seq#Index| (MapType0Select ExhaleHeap@7 b_2 array) j_14)))) (=> (not (= (|Seq#Index| (MapType0Select ExhaleHeap@7 b_2 array) i_40) (|Seq#Index| (MapType0Select ExhaleHeap@7 b_2 array) j_14))) (=> (= (ControlFlow 0 112) 111) anon74_correct))))))
(let ((anon70_correct true))
(let ((anon120_Else_correct  (=> (and (not (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_38_1)) (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U j_12)) (not (= i_38_1 j_12))))) (= (ControlFlow 0 105) 102)) anon70_correct)))
(let ((anon120_Then_correct  (=> (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_38_1)) (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U j_12)) (not (= i_38_1 j_12)))) (and (=> (= (ControlFlow 0 103) (- 0 104)) (not (= (|Seq#Index| (MapType0Select ExhaleHeap@7 a_2 array) i_38_1) (|Seq#Index| (MapType0Select ExhaleHeap@7 a_2 array) j_12)))) (=> (not (= (|Seq#Index| (MapType0Select ExhaleHeap@7 a_2 array) i_38_1) (|Seq#Index| (MapType0Select ExhaleHeap@7 a_2 array) j_12))) (=> (= (ControlFlow 0 103) 102) anon70_correct))))))
(let ((anon66_correct true))
(let ((anon118_Else_correct  (=> (and (not (|Seq#Contains| (|Seq#Range| middle@0 end) (int_2_U i_39))) (= (ControlFlow 0 101) 96)) anon66_correct)))
(let ((anon118_Then_correct  (=> (|Seq#Contains| (|Seq#Range| middle@0 end) (int_2_U i_39)) (and (=> (= (ControlFlow 0 97) (- 0 100)) (HasDirectPerm QPMask@8 b_2 array)) (=> (HasDirectPerm QPMask@8 b_2 array) (and (=> (= (ControlFlow 0 97) (- 0 99)) (>= i_39 0)) (=> (>= i_39 0) (and (=> (= (ControlFlow 0 97) (- 0 98)) (< i_39 (|Seq#Length| (MapType0Select ExhaleHeap@7 b_2 array)))) (=> (< i_39 (|Seq#Length| (MapType0Select ExhaleHeap@7 b_2 array))) (=> (= (ControlFlow 0 97) 96) anon66_correct))))))))))
(let ((anon62_correct true))
(let ((anon116_Else_correct  (=> (and (not (|Seq#Contains| (|Seq#Range| middle@0 end) (int_2_U i_38))) (= (ControlFlow 0 95) 90)) anon62_correct)))
(let ((anon116_Then_correct  (=> (|Seq#Contains| (|Seq#Range| middle@0 end) (int_2_U i_38)) (and (=> (= (ControlFlow 0 91) (- 0 94)) (HasDirectPerm Mask@9 a_2 array)) (=> (HasDirectPerm Mask@9 a_2 array) (and (=> (= (ControlFlow 0 91) (- 0 93)) (>= i_38 0)) (=> (>= i_38 0) (and (=> (= (ControlFlow 0 91) (- 0 92)) (< i_38 (|Seq#Length| (MapType0Select ExhaleHeap@7 a_2 array)))) (=> (< i_38 (|Seq#Length| (MapType0Select ExhaleHeap@7 a_2 array))) (=> (= (ControlFlow 0 91) 90) anon62_correct))))))))))
(let ((anon58_correct true))
(let ((anon114_Else_correct  (=> (and (not (|Seq#Contains| (|Seq#Range| start middle@0) (int_2_U i_36))) (= (ControlFlow 0 89) 84)) anon58_correct)))
(let ((anon114_Then_correct  (=> (|Seq#Contains| (|Seq#Range| start middle@0) (int_2_U i_36)) (and (=> (= (ControlFlow 0 85) (- 0 88)) (HasDirectPerm QPMask@6 b_2 array)) (=> (HasDirectPerm QPMask@6 b_2 array) (and (=> (= (ControlFlow 0 85) (- 0 87)) (>= i_36 0)) (=> (>= i_36 0) (and (=> (= (ControlFlow 0 85) (- 0 86)) (< i_36 (|Seq#Length| (MapType0Select ExhaleHeap@7 b_2 array)))) (=> (< i_36 (|Seq#Length| (MapType0Select ExhaleHeap@7 b_2 array))) (=> (= (ControlFlow 0 85) 84) anon58_correct))))))))))
(let ((anon54_correct true))
(let ((anon112_Else_correct  (=> (and (not (|Seq#Contains| (|Seq#Range| start middle@0) (int_2_U i_34))) (= (ControlFlow 0 83) 78)) anon54_correct)))
(let ((anon112_Then_correct  (=> (|Seq#Contains| (|Seq#Range| start middle@0) (int_2_U i_34)) (and (=> (= (ControlFlow 0 79) (- 0 82)) (HasDirectPerm Mask@7 a_2 array)) (=> (HasDirectPerm Mask@7 a_2 array) (and (=> (= (ControlFlow 0 79) (- 0 81)) (>= i_34 0)) (=> (>= i_34 0) (and (=> (= (ControlFlow 0 79) (- 0 80)) (< i_34 (|Seq#Length| (MapType0Select ExhaleHeap@7 a_2 array)))) (=> (< i_34 (|Seq#Length| (MapType0Select ExhaleHeap@7 a_2 array))) (=> (= (ControlFlow 0 79) 78) anon54_correct))))))))))
(let ((anon50_correct true))
(let ((anon110_Else_correct  (=> (and (not (|Seq#Contains| (|Seq#Range| middle@0 end) (int_2_U i_32))) (= (ControlFlow 0 77) 72)) anon50_correct)))
(let ((anon110_Then_correct  (=> (|Seq#Contains| (|Seq#Range| middle@0 end) (int_2_U i_32)) (and (=> (= (ControlFlow 0 73) (- 0 76)) (HasDirectPerm QPMask@4 b_2 array)) (=> (HasDirectPerm QPMask@4 b_2 array) (and (=> (= (ControlFlow 0 73) (- 0 75)) (>= i_32 0)) (=> (>= i_32 0) (and (=> (= (ControlFlow 0 73) (- 0 74)) (< i_32 (|Seq#Length| (MapType0Select ExhaleHeap@6 b_2 array)))) (=> (< i_32 (|Seq#Length| (MapType0Select ExhaleHeap@6 b_2 array))) (=> (= (ControlFlow 0 73) 72) anon50_correct))))))))))
(let ((anon46_correct true))
(let ((anon108_Else_correct  (=> (and (not (|Seq#Contains| (|Seq#Range| middle@0 end) (int_2_U i_30))) (= (ControlFlow 0 71) 66)) anon46_correct)))
(let ((anon108_Then_correct  (=> (|Seq#Contains| (|Seq#Range| middle@0 end) (int_2_U i_30)) (and (=> (= (ControlFlow 0 67) (- 0 70)) (HasDirectPerm Mask@5 a_2 array)) (=> (HasDirectPerm Mask@5 a_2 array) (and (=> (= (ControlFlow 0 67) (- 0 69)) (>= i_30 0)) (=> (>= i_30 0) (and (=> (= (ControlFlow 0 67) (- 0 68)) (< i_30 (|Seq#Length| (MapType0Select ExhaleHeap@5 a_2 array)))) (=> (< i_30 (|Seq#Length| (MapType0Select ExhaleHeap@5 a_2 array))) (=> (= (ControlFlow 0 67) 66) anon46_correct))))))))))
(let ((anon42_correct true))
(let ((anon106_Else_correct  (=> (and (not (|Seq#Contains| (|Seq#Range| start middle@0) (int_2_U i_22))) (= (ControlFlow 0 65) 60)) anon42_correct)))
(let ((anon106_Then_correct  (=> (|Seq#Contains| (|Seq#Range| start middle@0) (int_2_U i_22)) (and (=> (= (ControlFlow 0 61) (- 0 64)) (HasDirectPerm QPMask@2 b_2 array)) (=> (HasDirectPerm QPMask@2 b_2 array) (and (=> (= (ControlFlow 0 61) (- 0 63)) (>= i_22 0)) (=> (>= i_22 0) (and (=> (= (ControlFlow 0 61) (- 0 62)) (< i_22 (|Seq#Length| (MapType0Select ExhaleHeap@2 b_2 array)))) (=> (< i_22 (|Seq#Length| (MapType0Select ExhaleHeap@2 b_2 array))) (=> (= (ControlFlow 0 61) 60) anon42_correct))))))))))
(let ((anon38_correct true))
(let ((anon104_Else_correct  (=> (and (not (|Seq#Contains| (|Seq#Range| start middle@0) (int_2_U i_20))) (= (ControlFlow 0 59) 54)) anon38_correct)))
(let ((anon104_Then_correct  (=> (|Seq#Contains| (|Seq#Range| start middle@0) (int_2_U i_20)) (and (=> (= (ControlFlow 0 55) (- 0 58)) (HasDirectPerm Mask@3 a_2 array)) (=> (HasDirectPerm Mask@3 a_2 array) (and (=> (= (ControlFlow 0 55) (- 0 57)) (>= i_20 0)) (=> (>= i_20 0) (and (=> (= (ControlFlow 0 55) (- 0 56)) (< i_20 (|Seq#Length| (MapType0Select ExhaleHeap@1 a_2 array)))) (=> (< i_20 (|Seq#Length| (MapType0Select ExhaleHeap@1 a_2 array))) (=> (= (ControlFlow 0 55) 54) anon38_correct))))))))))
(let ((anon83_correct true))
(let ((anon126_Else_correct  (=> (and (not (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_19)) (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U j_10)) (not (= i_19 j_10))))) (= (ControlFlow 0 43) 40)) anon83_correct)))
(let ((anon126_Then_correct  (=> (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_19)) (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U j_10)) (not (= i_19 j_10)))) (and (=> (= (ControlFlow 0 41) (- 0 42)) (not (= (|Seq#Index| (MapType0Select Heap@0 b_2 array) i_19) (|Seq#Index| (MapType0Select Heap@0 b_2 array) j_10)))) (=> (not (= (|Seq#Index| (MapType0Select Heap@0 b_2 array) i_19) (|Seq#Index| (MapType0Select Heap@0 b_2 array) j_10))) (=> (= (ControlFlow 0 41) 40) anon83_correct))))))
(let ((anon125_Else_correct  (=> (forall ((i_20_1 Int) (j_11_1 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_20_1)) (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U j_11_1)) (not (= i_20_1 j_11_1)))) (not (= (|Seq#Index| (MapType0Select Heap@0 b_2 array) i_20_1) (|Seq#Index| (MapType0Select Heap@0 b_2 array) j_11_1))))
 :qid |stdinbpl.2092:20|
 :skolemid |169|
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U i_20_1)) (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U j_11_1)))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U i_20_1)) (|Seq#Contains| (|Seq#Range| start end) (int_2_U j_11_1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_20_1)) (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U j_11_1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_20_1)) (|Seq#Contains| (|Seq#Range| start end) (int_2_U j_11_1)))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U i_20_1)) (|Seq#Index| (MapType0Select Heap@0 b_2 array) j_11_1))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_20_1)) (|Seq#Index| (MapType0Select Heap@0 b_2 array) j_11_1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U j_11_1)) (|Seq#Index| (MapType0Select Heap@0 b_2 array) i_20_1))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U j_11_1)) (|Seq#Index| (MapType0Select Heap@0 b_2 array) i_20_1))
 :pattern ( (|Seq#Index| (MapType0Select Heap@0 b_2 array) i_20_1) (|Seq#Index| (MapType0Select Heap@0 b_2 array) j_11_1))
)) (and (=> (= (ControlFlow 0 36) (- 0 39)) (forall ((i_21 Int) (i_21_1 Int) ) (!  (=> (and (and (and (and (not (= i_21 i_21_1)) (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_21))) (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_21_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| (MapType0Select Heap@0 b_2 array) i_21) (|Seq#Index| (MapType0Select Heap@0 b_2 array) i_21_1))))
 :qid |stdinbpl.2103:17|
 :skolemid |170|
 :pattern ( (neverTriggered6 i_21) (neverTriggered6 i_21_1))
))) (=> (forall ((i_21@@0 Int) (i_21_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_21@@0 i_21_1@@0)) (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_21@@0))) (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_21_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| (MapType0Select Heap@0 b_2 array) i_21@@0) (|Seq#Index| (MapType0Select Heap@0 b_2 array) i_21_1@@0))))
 :qid |stdinbpl.2103:17|
 :skolemid |170|
 :pattern ( (neverTriggered6 i_21@@0) (neverTriggered6 i_21_1@@0))
)) (and (=> (= (ControlFlow 0 36) (- 0 38)) (forall ((i_21@@1 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_21@@1)) (>= (U_2_real (MapType1Select QPMask@14 (|Seq#Index| (MapType0Select Heap@0 b_2 array) i_21@@1) value)) FullPerm))
 :qid |stdinbpl.2110:17|
 :skolemid |171|
 :pattern ( (|Seq#Index| (MapType0Select Heap@0 b_2 array) i_21@@1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U i_21@@1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_21@@1)))
 :pattern ( (|Seq#Index| (MapType0Select Heap@0 b_2 array) i_21@@1))
))) (=> (forall ((i_21@@2 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_21@@2)) (>= (U_2_real (MapType1Select QPMask@14 (|Seq#Index| (MapType0Select Heap@0 b_2 array) i_21@@2) value)) FullPerm))
 :qid |stdinbpl.2110:17|
 :skolemid |171|
 :pattern ( (|Seq#Index| (MapType0Select Heap@0 b_2 array) i_21@@2))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U i_21@@2)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_21@@2)))
 :pattern ( (|Seq#Index| (MapType0Select Heap@0 b_2 array) i_21@@2))
)) (=> (and (and (forall ((i_21@@3 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_21@@3)) (< NoPerm FullPerm)) (and (qpRange6 (|Seq#Index| (MapType0Select Heap@0 b_2 array) i_21@@3)) (= (invRecv6 (|Seq#Index| (MapType0Select Heap@0 b_2 array) i_21@@3)) i_21@@3)))
 :qid |stdinbpl.2116:22|
 :skolemid |172|
 :pattern ( (|Seq#Index| (MapType0Select Heap@0 b_2 array) i_21@@3))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U i_21@@3)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_21@@3)))
 :pattern ( (|Seq#Index| (MapType0Select Heap@0 b_2 array) i_21@@3))
)) (forall ((o_3@@5 T@U) ) (!  (=> (= (type o_3@@5) RefType) (=> (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U (invRecv6 o_3@@5))) (and (< NoPerm FullPerm) (qpRange6 o_3@@5))) (= (|Seq#Index| (MapType0Select Heap@0 b_2 array) (invRecv6 o_3@@5)) o_3@@5)))
 :qid |stdinbpl.2120:22|
 :skolemid |173|
 :pattern ( (invRecv6 o_3@@5))
))) (and (forall ((o_3@@6 T@U) ) (!  (=> (= (type o_3@@6) RefType) (and (=> (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U (invRecv6 o_3@@6))) (and (< NoPerm FullPerm) (qpRange6 o_3@@6))) (and (= (|Seq#Index| (MapType0Select Heap@0 b_2 array) (invRecv6 o_3@@6)) o_3@@6) (= (U_2_real (MapType1Select QPMask@15 o_3@@6 value)) (- (U_2_real (MapType1Select QPMask@14 o_3@@6 value)) FullPerm)))) (=> (not (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U (invRecv6 o_3@@6))) (and (< NoPerm FullPerm) (qpRange6 o_3@@6)))) (= (U_2_real (MapType1Select QPMask@15 o_3@@6 value)) (U_2_real (MapType1Select QPMask@14 o_3@@6 value))))))
 :qid |stdinbpl.2126:22|
 :skolemid |174|
 :pattern ( (MapType1Select QPMask@15 o_3@@6 value))
)) (forall ((o_3@@7 T@U) (f_5@@1 T@U) ) (! (let ((B@@13 (FieldTypeInv1 (type f_5@@1))))
(let ((A@@14 (FieldTypeInv0 (type f_5@@1))))
 (=> (and (and (= (type o_3@@7) RefType) (= (type f_5@@1) (FieldType A@@14 B@@13))) (not (= f_5@@1 value))) (= (U_2_real (MapType1Select QPMask@14 o_3@@7 f_5@@1)) (U_2_real (MapType1Select QPMask@15 o_3@@7 f_5@@1))))))
 :qid |stdinbpl.2132:29|
 :skolemid |175|
 :pattern ( (MapType1Select QPMask@15 o_3@@7 f_5@@1))
)))) (and (=> (= (ControlFlow 0 36) (- 0 37)) (|Seq#Equal| (MapType0Select Heap@0 a_2 array) (MapType0Select Heap@@9 a_2 array))) (=> (|Seq#Equal| (MapType0Select Heap@0 a_2 array) (MapType0Select Heap@@9 a_2 array)) (=> (= (ControlFlow 0 36) (- 0 35)) (|Seq#Equal| (MapType0Select Heap@0 b_2 array) (MapType0Select Heap@@9 b_2 array)))))))))))))
(let ((anon123_Else_correct  (=> (forall ((i_17_1 Int) (j_9_1 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_17_1)) (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U j_9_1)) (not (= i_17_1 j_9_1)))) (not (= (|Seq#Index| (MapType0Select Heap@0 a_2 array) i_17_1) (|Seq#Index| (MapType0Select Heap@0 a_2 array) j_9_1))))
 :qid |stdinbpl.2040:20|
 :skolemid |162|
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U i_17_1)) (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U j_9_1)))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U i_17_1)) (|Seq#Contains| (|Seq#Range| start end) (int_2_U j_9_1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_17_1)) (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U j_9_1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_17_1)) (|Seq#Contains| (|Seq#Range| start end) (int_2_U j_9_1)))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U i_17_1)) (|Seq#Index| (MapType0Select Heap@0 a_2 array) j_9_1))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_17_1)) (|Seq#Index| (MapType0Select Heap@0 a_2 array) j_9_1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U j_9_1)) (|Seq#Index| (MapType0Select Heap@0 a_2 array) i_17_1))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U j_9_1)) (|Seq#Index| (MapType0Select Heap@0 a_2 array) i_17_1))
 :pattern ( (|Seq#Index| (MapType0Select Heap@0 a_2 array) i_17_1) (|Seq#Index| (MapType0Select Heap@0 a_2 array) j_9_1))
)) (and (=> (= (ControlFlow 0 44) (- 0 46)) (forall ((i_18 Int) (i_18_1 Int) ) (!  (=> (and (and (and (and (not (= i_18 i_18_1)) (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_18))) (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_18_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| (MapType0Select Heap@0 a_2 array) i_18) (|Seq#Index| (MapType0Select Heap@0 a_2 array) i_18_1))))
 :qid |stdinbpl.2051:17|
 :skolemid |163|
 :pattern ( (neverTriggered5 i_18) (neverTriggered5 i_18_1))
))) (=> (forall ((i_18@@0 Int) (i_18_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_18@@0 i_18_1@@0)) (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_18@@0))) (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_18_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| (MapType0Select Heap@0 a_2 array) i_18@@0) (|Seq#Index| (MapType0Select Heap@0 a_2 array) i_18_1@@0))))
 :qid |stdinbpl.2051:17|
 :skolemid |163|
 :pattern ( (neverTriggered5 i_18@@0) (neverTriggered5 i_18_1@@0))
)) (and (=> (= (ControlFlow 0 44) (- 0 45)) (forall ((i_18@@1 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_18@@1)) (>= (U_2_real (MapType1Select Mask@16 (|Seq#Index| (MapType0Select Heap@0 a_2 array) i_18@@1) value)) FullPerm))
 :qid |stdinbpl.2058:17|
 :skolemid |164|
 :pattern ( (|Seq#Index| (MapType0Select Heap@0 a_2 array) i_18@@1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U i_18@@1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_18@@1)))
 :pattern ( (|Seq#Index| (MapType0Select Heap@0 a_2 array) i_18@@1))
))) (=> (forall ((i_18@@2 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_18@@2)) (>= (U_2_real (MapType1Select Mask@16 (|Seq#Index| (MapType0Select Heap@0 a_2 array) i_18@@2) value)) FullPerm))
 :qid |stdinbpl.2058:17|
 :skolemid |164|
 :pattern ( (|Seq#Index| (MapType0Select Heap@0 a_2 array) i_18@@2))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U i_18@@2)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_18@@2)))
 :pattern ( (|Seq#Index| (MapType0Select Heap@0 a_2 array) i_18@@2))
)) (=> (and (and (forall ((i_18@@3 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_18@@3)) (< NoPerm FullPerm)) (and (qpRange5 (|Seq#Index| (MapType0Select Heap@0 a_2 array) i_18@@3)) (= (invRecv5 (|Seq#Index| (MapType0Select Heap@0 a_2 array) i_18@@3)) i_18@@3)))
 :qid |stdinbpl.2064:22|
 :skolemid |165|
 :pattern ( (|Seq#Index| (MapType0Select Heap@0 a_2 array) i_18@@3))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U i_18@@3)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_18@@3)))
 :pattern ( (|Seq#Index| (MapType0Select Heap@0 a_2 array) i_18@@3))
)) (forall ((o_3@@8 T@U) ) (!  (=> (= (type o_3@@8) RefType) (=> (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U (invRecv5 o_3@@8))) (and (< NoPerm FullPerm) (qpRange5 o_3@@8))) (= (|Seq#Index| (MapType0Select Heap@0 a_2 array) (invRecv5 o_3@@8)) o_3@@8)))
 :qid |stdinbpl.2068:22|
 :skolemid |166|
 :pattern ( (invRecv5 o_3@@8))
))) (and (forall ((o_3@@9 T@U) ) (!  (=> (= (type o_3@@9) RefType) (and (=> (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U (invRecv5 o_3@@9))) (and (< NoPerm FullPerm) (qpRange5 o_3@@9))) (and (= (|Seq#Index| (MapType0Select Heap@0 a_2 array) (invRecv5 o_3@@9)) o_3@@9) (= (U_2_real (MapType1Select QPMask@14 o_3@@9 value)) (- (U_2_real (MapType1Select Mask@16 o_3@@9 value)) FullPerm)))) (=> (not (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U (invRecv5 o_3@@9))) (and (< NoPerm FullPerm) (qpRange5 o_3@@9)))) (= (U_2_real (MapType1Select QPMask@14 o_3@@9 value)) (U_2_real (MapType1Select Mask@16 o_3@@9 value))))))
 :qid |stdinbpl.2074:22|
 :skolemid |167|
 :pattern ( (MapType1Select QPMask@14 o_3@@9 value))
)) (forall ((o_3@@10 T@U) (f_5@@2 T@U) ) (! (let ((B@@14 (FieldTypeInv1 (type f_5@@2))))
(let ((A@@15 (FieldTypeInv0 (type f_5@@2))))
 (=> (and (and (= (type o_3@@10) RefType) (= (type f_5@@2) (FieldType A@@15 B@@14))) (not (= f_5@@2 value))) (= (U_2_real (MapType1Select Mask@16 o_3@@10 f_5@@2)) (U_2_real (MapType1Select QPMask@14 o_3@@10 f_5@@2))))))
 :qid |stdinbpl.2080:29|
 :skolemid |168|
 :pattern ( (MapType1Select QPMask@14 o_3@@10 f_5@@2))
)))) (and (and (=> (= (ControlFlow 0 44) 36) anon125_Else_correct) (=> (= (ControlFlow 0 44) 41) anon126_Then_correct)) (=> (= (ControlFlow 0 44) 43) anon126_Else_correct))))))))))
(let ((anon79_correct true))
(let ((anon124_Else_correct  (=> (and (not (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_16_1)) (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U j_8)) (not (= i_16_1 j_8))))) (= (ControlFlow 0 34) 31)) anon79_correct)))
(let ((anon124_Then_correct  (=> (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_16_1)) (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U j_8)) (not (= i_16_1 j_8)))) (and (=> (= (ControlFlow 0 32) (- 0 33)) (not (= (|Seq#Index| (MapType0Select Heap@0 a_2 array) i_16_1) (|Seq#Index| (MapType0Select Heap@0 a_2 array) j_8)))) (=> (not (= (|Seq#Index| (MapType0Select Heap@0 a_2 array) i_16_1) (|Seq#Index| (MapType0Select Heap@0 a_2 array) j_8))) (=> (= (ControlFlow 0 32) 31) anon79_correct))))))
(let ((anon76_correct  (=> (state Heap@0 Mask@14) (and (=> (= (ControlFlow 0 47) (- 0 52)) (> (U_2_real (MapType1Select Mask@14 a_2 array)) NoPerm)) (=> (> (U_2_real (MapType1Select Mask@14 a_2 array)) NoPerm) (=> (> wildcard@16 NoPerm) (=> (and (< wildcard@16 (U_2_real (MapType1Select Mask@14 a_2 array))) (= Mask@15 (MapType1Store Mask@14 a_2 array (real_2_U (- (U_2_real (MapType1Select Mask@14 a_2 array)) wildcard@16))))) (and (=> (= (ControlFlow 0 47) (- 0 51)) (> (U_2_real (MapType1Select Mask@15 b_2 array)) NoPerm)) (=> (> (U_2_real (MapType1Select Mask@15 b_2 array)) NoPerm) (=> (> wildcard@17 NoPerm) (=> (and (< wildcard@17 (U_2_real (MapType1Select Mask@15 b_2 array))) (= Mask@16 (MapType1Store Mask@15 b_2 array (real_2_U (- (U_2_real (MapType1Select Mask@15 b_2 array)) wildcard@17))))) (and (=> (= (ControlFlow 0 47) (- 0 50)) (>= start 0)) (=> (>= start 0) (and (=> (= (ControlFlow 0 47) (- 0 49)) (<= end (|Seq#Length| (MapType0Select Heap@0 a_2 array)))) (=> (<= end (|Seq#Length| (MapType0Select Heap@0 a_2 array))) (and (=> (= (ControlFlow 0 47) (- 0 48)) (= (|Seq#Length| (MapType0Select Heap@0 a_2 array)) (|Seq#Length| (MapType0Select Heap@0 b_2 array)))) (=> (= (|Seq#Length| (MapType0Select Heap@0 a_2 array)) (|Seq#Length| (MapType0Select Heap@0 b_2 array))) (and (and (=> (= (ControlFlow 0 47) 44) anon123_Else_correct) (=> (= (ControlFlow 0 47) 32) anon124_Then_correct)) (=> (= (ControlFlow 0 47) 34) anon124_Else_correct)))))))))))))))))))
(let ((anon121_Else_correct  (=> (forall ((i_41_1 Int) (j_15_1 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_41_1)) (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U j_15_1)) (not (= i_41_1 j_15_1)))) (not (= (|Seq#Index| (MapType0Select ExhaleHeap@7 b_2 array) i_41_1) (|Seq#Index| (MapType0Select ExhaleHeap@7 b_2 array) j_15_1))))
 :qid |stdinbpl.1870:26|
 :skolemid |141|
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U i_41_1)) (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U j_15_1)))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U i_41_1)) (|Seq#Contains| (|Seq#Range| start end) (int_2_U j_15_1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_41_1)) (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U j_15_1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_41_1)) (|Seq#Contains| (|Seq#Range| start end) (int_2_U j_15_1)))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U i_41_1)) (|Seq#Index| (MapType0Select ExhaleHeap@7 b_2 array) j_15_1))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_41_1)) (|Seq#Index| (MapType0Select ExhaleHeap@7 b_2 array) j_15_1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U j_15_1)) (|Seq#Index| (MapType0Select ExhaleHeap@7 b_2 array) i_41_1))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U j_15_1)) (|Seq#Index| (MapType0Select ExhaleHeap@7 b_2 array) i_41_1))
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@7 b_2 array) i_41_1) (|Seq#Index| (MapType0Select ExhaleHeap@7 b_2 array) j_15_1))
)) (and (=> (= (ControlFlow 0 106) (- 0 110)) (forall ((l Int) (l_2 Int) ) (!  (=> (and (and (and (and (not (= l l_2)) (|Seq#Contains| (|Seq#Range| start end) (int_2_U l))) (|Seq#Contains| (|Seq#Range| start end) (int_2_U l_2))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| (MapType0Select ExhaleHeap@7 b_2 array) l) (|Seq#Index| (MapType0Select ExhaleHeap@7 b_2 array) l_2))))
 :qid |stdinbpl.1881:23|
 :skolemid |142|
 :pattern ( (neverTriggered16 l) (neverTriggered16 l_2))
))) (=> (forall ((l@@0 Int) (l_2@@0 Int) ) (!  (=> (and (and (and (and (not (= l@@0 l_2@@0)) (|Seq#Contains| (|Seq#Range| start end) (int_2_U l@@0))) (|Seq#Contains| (|Seq#Range| start end) (int_2_U l_2@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| (MapType0Select ExhaleHeap@7 b_2 array) l@@0) (|Seq#Index| (MapType0Select ExhaleHeap@7 b_2 array) l_2@@0))))
 :qid |stdinbpl.1881:23|
 :skolemid |142|
 :pattern ( (neverTriggered16 l@@0) (neverTriggered16 l_2@@0))
)) (and (=> (= (ControlFlow 0 106) (- 0 109)) (forall ((l@@1 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| start end) (int_2_U l@@1)) (>= (U_2_real (MapType1Select QPMask@10 (|Seq#Index| (MapType0Select ExhaleHeap@7 b_2 array) l@@1) value)) FullPerm))
 :qid |stdinbpl.1888:23|
 :skolemid |143|
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@7 b_2 array) l@@1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U l@@1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U l@@1)))
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@7 b_2 array) l@@1))
))) (=> (forall ((l@@2 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| start end) (int_2_U l@@2)) (>= (U_2_real (MapType1Select QPMask@10 (|Seq#Index| (MapType0Select ExhaleHeap@7 b_2 array) l@@2) value)) FullPerm))
 :qid |stdinbpl.1888:23|
 :skolemid |143|
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@7 b_2 array) l@@2))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U l@@2)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U l@@2)))
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@7 b_2 array) l@@2))
)) (=> (and (and (and (and (forall ((l@@3 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U l@@3)) (< NoPerm FullPerm)) (and (qpRange16 (|Seq#Index| (MapType0Select ExhaleHeap@7 b_2 array) l@@3)) (= (invRecv16 (|Seq#Index| (MapType0Select ExhaleHeap@7 b_2 array) l@@3)) l@@3)))
 :qid |stdinbpl.1894:28|
 :skolemid |144|
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@7 b_2 array) l@@3))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U l@@3)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U l@@3)))
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@7 b_2 array) l@@3))
)) (forall ((o_3@@11 T@U) ) (!  (=> (= (type o_3@@11) RefType) (=> (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U (invRecv16 o_3@@11))) (and (< NoPerm FullPerm) (qpRange16 o_3@@11))) (= (|Seq#Index| (MapType0Select ExhaleHeap@7 b_2 array) (invRecv16 o_3@@11)) o_3@@11)))
 :qid |stdinbpl.1898:28|
 :skolemid |145|
 :pattern ( (invRecv16 o_3@@11))
))) (and (forall ((o_3@@12 T@U) ) (!  (=> (= (type o_3@@12) RefType) (and (=> (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U (invRecv16 o_3@@12))) (and (< NoPerm FullPerm) (qpRange16 o_3@@12))) (and (= (|Seq#Index| (MapType0Select ExhaleHeap@7 b_2 array) (invRecv16 o_3@@12)) o_3@@12) (= (U_2_real (MapType1Select QPMask@11 o_3@@12 value)) (- (U_2_real (MapType1Select QPMask@10 o_3@@12 value)) FullPerm)))) (=> (not (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U (invRecv16 o_3@@12))) (and (< NoPerm FullPerm) (qpRange16 o_3@@12)))) (= (U_2_real (MapType1Select QPMask@11 o_3@@12 value)) (U_2_real (MapType1Select QPMask@10 o_3@@12 value))))))
 :qid |stdinbpl.1904:28|
 :skolemid |146|
 :pattern ( (MapType1Select QPMask@11 o_3@@12 value))
)) (forall ((o_3@@13 T@U) (f_5@@3 T@U) ) (! (let ((B@@15 (FieldTypeInv1 (type f_5@@3))))
(let ((A@@16 (FieldTypeInv0 (type f_5@@3))))
 (=> (and (and (= (type o_3@@13) RefType) (= (type f_5@@3) (FieldType A@@16 B@@15))) (not (= f_5@@3 value))) (= (U_2_real (MapType1Select QPMask@10 o_3@@13 f_5@@3)) (U_2_real (MapType1Select QPMask@11 o_3@@13 f_5@@3))))))
 :qid |stdinbpl.1910:35|
 :skolemid |147|
 :pattern ( (MapType1Select QPMask@11 o_3@@13 f_5@@3))
)))) (and (and (IdenticalOnKnownLocations ExhaleHeap@7 ExhaleHeap@8 QPMask@11) (> wildcard@14 NoPerm)) (and (not (= a_2 null)) (= Mask@12 (MapType1Store QPMask@11 a_2 array (real_2_U (+ (U_2_real (MapType1Select QPMask@11 a_2 array)) wildcard@14))))))) (and (and (and (state ExhaleHeap@8 Mask@12) (> wildcard@15 NoPerm)) (and (not (= b_2 null)) (= Mask@13 (MapType1Store Mask@12 b_2 array (real_2_U (+ (U_2_real (MapType1Select Mask@12 b_2 array)) wildcard@15)))))) (and (and (state ExhaleHeap@8 Mask@13) (|Seq#Equal| (MapType0Select ExhaleHeap@8 a_2 array) (MapType0Select ExhaleHeap@7 a_2 array))) (and (|Seq#Equal| (MapType0Select ExhaleHeap@8 b_2 array) (MapType0Select ExhaleHeap@7 b_2 array)) (forall ((i_42 Int) (j_16 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_42)) (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U j_16)) (not (= i_42 j_16)))) (not (= (|Seq#Index| (MapType0Select ExhaleHeap@8 a_2 array) i_42) (|Seq#Index| (MapType0Select ExhaleHeap@8 a_2 array) j_16))))
 :qid |stdinbpl.1933:26|
 :skolemid |148|
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U i_42)) (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U j_16)))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U i_42)) (|Seq#Contains| (|Seq#Range| start end) (int_2_U j_16)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_42)) (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U j_16)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_42)) (|Seq#Contains| (|Seq#Range| start end) (int_2_U j_16)))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U i_42)) (|Seq#Index| (MapType0Select ExhaleHeap@8 a_2 array) j_16))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_42)) (|Seq#Index| (MapType0Select ExhaleHeap@8 a_2 array) j_16))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U j_16)) (|Seq#Index| (MapType0Select ExhaleHeap@8 a_2 array) i_42))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U j_16)) (|Seq#Index| (MapType0Select ExhaleHeap@8 a_2 array) i_42))
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@8 a_2 array) i_42) (|Seq#Index| (MapType0Select ExhaleHeap@8 a_2 array) j_16))
)))))) (and (=> (= (ControlFlow 0 106) (- 0 108)) (forall ((i_43 Int) (i_43_1 Int) ) (!  (=> (and (and (and (and (not (= i_43 i_43_1)) (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_43))) (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_43_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| (MapType0Select ExhaleHeap@8 a_2 array) i_43) (|Seq#Index| (MapType0Select ExhaleHeap@8 a_2 array) i_43_1))))
 :qid |stdinbpl.1939:21|
 :skolemid |149|
))) (=> (forall ((i_43@@0 Int) (i_43_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_43@@0 i_43_1@@0)) (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_43@@0))) (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_43_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| (MapType0Select ExhaleHeap@8 a_2 array) i_43@@0) (|Seq#Index| (MapType0Select ExhaleHeap@8 a_2 array) i_43_1@@0))))
 :qid |stdinbpl.1939:21|
 :skolemid |149|
)) (=> (forall ((i_43@@1 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_43@@1)) (< NoPerm FullPerm)) (and (qpRange17 (|Seq#Index| (MapType0Select ExhaleHeap@8 a_2 array) i_43@@1)) (= (invRecv17 (|Seq#Index| (MapType0Select ExhaleHeap@8 a_2 array) i_43@@1)) i_43@@1)))
 :qid |stdinbpl.1945:28|
 :skolemid |150|
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@8 a_2 array) i_43@@1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U i_43@@1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_43@@1)))
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@8 a_2 array) i_43@@1))
)) (=> (and (forall ((o_3@@14 T@U) ) (!  (=> (= (type o_3@@14) RefType) (=> (and (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U (invRecv17 o_3@@14))) (< NoPerm FullPerm)) (qpRange17 o_3@@14)) (= (|Seq#Index| (MapType0Select ExhaleHeap@8 a_2 array) (invRecv17 o_3@@14)) o_3@@14)))
 :qid |stdinbpl.1949:28|
 :skolemid |151|
 :pattern ( (invRecv17 o_3@@14))
)) (forall ((i_43@@2 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_43@@2)) (not (= (|Seq#Index| (MapType0Select ExhaleHeap@8 a_2 array) i_43@@2) null)))
 :qid |stdinbpl.1955:28|
 :skolemid |152|
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@8 a_2 array) i_43@@2))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U i_43@@2)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_43@@2)))
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@8 a_2 array) i_43@@2))
))) (=> (and (and (forall ((o_3@@15 T@U) ) (!  (=> (= (type o_3@@15) RefType) (and (=> (and (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U (invRecv17 o_3@@15))) (< NoPerm FullPerm)) (qpRange17 o_3@@15)) (and (=> (< NoPerm FullPerm) (= (|Seq#Index| (MapType0Select ExhaleHeap@8 a_2 array) (invRecv17 o_3@@15)) o_3@@15)) (= (U_2_real (MapType1Select QPMask@12 o_3@@15 value)) (+ (U_2_real (MapType1Select Mask@13 o_3@@15 value)) FullPerm)))) (=> (not (and (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U (invRecv17 o_3@@15))) (< NoPerm FullPerm)) (qpRange17 o_3@@15))) (= (U_2_real (MapType1Select QPMask@12 o_3@@15 value)) (U_2_real (MapType1Select Mask@13 o_3@@15 value))))))
 :qid |stdinbpl.1961:28|
 :skolemid |153|
 :pattern ( (MapType1Select QPMask@12 o_3@@15 value))
)) (forall ((o_3@@16 T@U) (f_5@@4 T@U) ) (! (let ((B@@16 (FieldTypeInv1 (type f_5@@4))))
(let ((A@@17 (FieldTypeInv0 (type f_5@@4))))
 (=> (and (and (= (type o_3@@16) RefType) (= (type f_5@@4) (FieldType A@@17 B@@16))) (not (= f_5@@4 value))) (= (U_2_real (MapType1Select Mask@13 o_3@@16 f_5@@4)) (U_2_real (MapType1Select QPMask@12 o_3@@16 f_5@@4))))))
 :qid |stdinbpl.1965:35|
 :skolemid |154|
 :pattern ( (MapType1Select Mask@13 o_3@@16 f_5@@4))
 :pattern ( (MapType1Select QPMask@12 o_3@@16 f_5@@4))
))) (and (state ExhaleHeap@8 QPMask@12) (forall ((i_44 Int) (j_17 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_44)) (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U j_17)) (not (= i_44 j_17)))) (not (= (|Seq#Index| (MapType0Select ExhaleHeap@8 b_2 array) i_44) (|Seq#Index| (MapType0Select ExhaleHeap@8 b_2 array) j_17))))
 :qid |stdinbpl.1971:26|
 :skolemid |155|
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U i_44)) (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U j_17)))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U i_44)) (|Seq#Contains| (|Seq#Range| start end) (int_2_U j_17)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_44)) (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U j_17)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_44)) (|Seq#Contains| (|Seq#Range| start end) (int_2_U j_17)))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U i_44)) (|Seq#Index| (MapType0Select ExhaleHeap@8 b_2 array) j_17))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_44)) (|Seq#Index| (MapType0Select ExhaleHeap@8 b_2 array) j_17))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U j_17)) (|Seq#Index| (MapType0Select ExhaleHeap@8 b_2 array) i_44))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U j_17)) (|Seq#Index| (MapType0Select ExhaleHeap@8 b_2 array) i_44))
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@8 b_2 array) i_44) (|Seq#Index| (MapType0Select ExhaleHeap@8 b_2 array) j_17))
)))) (and (=> (= (ControlFlow 0 106) (- 0 107)) (forall ((i_45 Int) (i_45_1 Int) ) (!  (=> (and (and (and (and (not (= i_45 i_45_1)) (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_45))) (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_45_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| (MapType0Select ExhaleHeap@8 b_2 array) i_45) (|Seq#Index| (MapType0Select ExhaleHeap@8 b_2 array) i_45_1))))
 :qid |stdinbpl.1977:21|
 :skolemid |156|
))) (=> (forall ((i_45@@0 Int) (i_45_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_45@@0 i_45_1@@0)) (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_45@@0))) (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_45_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| (MapType0Select ExhaleHeap@8 b_2 array) i_45@@0) (|Seq#Index| (MapType0Select ExhaleHeap@8 b_2 array) i_45_1@@0))))
 :qid |stdinbpl.1977:21|
 :skolemid |156|
)) (=> (forall ((i_45@@1 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_45@@1)) (< NoPerm FullPerm)) (and (qpRange18 (|Seq#Index| (MapType0Select ExhaleHeap@8 b_2 array) i_45@@1)) (= (invRecv18 (|Seq#Index| (MapType0Select ExhaleHeap@8 b_2 array) i_45@@1)) i_45@@1)))
 :qid |stdinbpl.1983:28|
 :skolemid |157|
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@8 b_2 array) i_45@@1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U i_45@@1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_45@@1)))
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@8 b_2 array) i_45@@1))
)) (=> (and (forall ((o_3@@17 T@U) ) (!  (=> (= (type o_3@@17) RefType) (=> (and (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U (invRecv18 o_3@@17))) (< NoPerm FullPerm)) (qpRange18 o_3@@17)) (= (|Seq#Index| (MapType0Select ExhaleHeap@8 b_2 array) (invRecv18 o_3@@17)) o_3@@17)))
 :qid |stdinbpl.1987:28|
 :skolemid |158|
 :pattern ( (invRecv18 o_3@@17))
)) (forall ((i_45@@2 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_45@@2)) (not (= (|Seq#Index| (MapType0Select ExhaleHeap@8 b_2 array) i_45@@2) null)))
 :qid |stdinbpl.1993:28|
 :skolemid |159|
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@8 b_2 array) i_45@@2))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U i_45@@2)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_45@@2)))
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@8 b_2 array) i_45@@2))
))) (=> (and (and (and (forall ((o_3@@18 T@U) ) (!  (=> (= (type o_3@@18) RefType) (and (=> (and (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U (invRecv18 o_3@@18))) (< NoPerm FullPerm)) (qpRange18 o_3@@18)) (and (=> (< NoPerm FullPerm) (= (|Seq#Index| (MapType0Select ExhaleHeap@8 b_2 array) (invRecv18 o_3@@18)) o_3@@18)) (= (U_2_real (MapType1Select QPMask@13 o_3@@18 value)) (+ (U_2_real (MapType1Select QPMask@12 o_3@@18 value)) FullPerm)))) (=> (not (and (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U (invRecv18 o_3@@18))) (< NoPerm FullPerm)) (qpRange18 o_3@@18))) (= (U_2_real (MapType1Select QPMask@13 o_3@@18 value)) (U_2_real (MapType1Select QPMask@12 o_3@@18 value))))))
 :qid |stdinbpl.1999:28|
 :skolemid |160|
 :pattern ( (MapType1Select QPMask@13 o_3@@18 value))
)) (forall ((o_3@@19 T@U) (f_5@@5 T@U) ) (! (let ((B@@17 (FieldTypeInv1 (type f_5@@5))))
(let ((A@@18 (FieldTypeInv0 (type f_5@@5))))
 (=> (and (and (= (type o_3@@19) RefType) (= (type f_5@@5) (FieldType A@@18 B@@17))) (not (= f_5@@5 value))) (= (U_2_real (MapType1Select QPMask@12 o_3@@19 f_5@@5)) (U_2_real (MapType1Select QPMask@13 o_3@@19 f_5@@5))))))
 :qid |stdinbpl.2003:35|
 :skolemid |161|
 :pattern ( (MapType1Select QPMask@12 o_3@@19 f_5@@5))
 :pattern ( (MapType1Select QPMask@13 o_3@@19 f_5@@5))
))) (and (state ExhaleHeap@8 QPMask@13) (state ExhaleHeap@8 QPMask@13))) (and (and (state ExhaleHeap@8 QPMask@13) (= Mask@14 QPMask@13)) (and (= Heap@0 ExhaleHeap@8) (= (ControlFlow 0 106) 47)))) anon76_correct))))))))))))))))))
(let ((anon119_Else_correct  (=> (forall ((i_39_1 Int) (j_13_1 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_39_1)) (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U j_13_1)) (not (= i_39_1 j_13_1)))) (not (= (|Seq#Index| (MapType0Select ExhaleHeap@7 a_2 array) i_39_1) (|Seq#Index| (MapType0Select ExhaleHeap@7 a_2 array) j_13_1))))
 :qid |stdinbpl.1818:26|
 :skolemid |134|
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U i_39_1)) (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U j_13_1)))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U i_39_1)) (|Seq#Contains| (|Seq#Range| start end) (int_2_U j_13_1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_39_1)) (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U j_13_1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_39_1)) (|Seq#Contains| (|Seq#Range| start end) (int_2_U j_13_1)))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U i_39_1)) (|Seq#Index| (MapType0Select ExhaleHeap@7 a_2 array) j_13_1))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_39_1)) (|Seq#Index| (MapType0Select ExhaleHeap@7 a_2 array) j_13_1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U j_13_1)) (|Seq#Index| (MapType0Select ExhaleHeap@7 a_2 array) i_39_1))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U j_13_1)) (|Seq#Index| (MapType0Select ExhaleHeap@7 a_2 array) i_39_1))
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@7 a_2 array) i_39_1) (|Seq#Index| (MapType0Select ExhaleHeap@7 a_2 array) j_13_1))
)) (and (=> (= (ControlFlow 0 115) (- 0 117)) (forall ((k Int) (k_2 Int) ) (!  (=> (and (and (and (and (not (= k k_2)) (|Seq#Contains| (|Seq#Range| start end) (int_2_U k))) (|Seq#Contains| (|Seq#Range| start end) (int_2_U k_2))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| (MapType0Select ExhaleHeap@7 a_2 array) k) (|Seq#Index| (MapType0Select ExhaleHeap@7 a_2 array) k_2))))
 :qid |stdinbpl.1829:23|
 :skolemid |135|
 :pattern ( (neverTriggered15 k) (neverTriggered15 k_2))
))) (=> (forall ((k@@0 Int) (k_2@@0 Int) ) (!  (=> (and (and (and (and (not (= k@@0 k_2@@0)) (|Seq#Contains| (|Seq#Range| start end) (int_2_U k@@0))) (|Seq#Contains| (|Seq#Range| start end) (int_2_U k_2@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| (MapType0Select ExhaleHeap@7 a_2 array) k@@0) (|Seq#Index| (MapType0Select ExhaleHeap@7 a_2 array) k_2@@0))))
 :qid |stdinbpl.1829:23|
 :skolemid |135|
 :pattern ( (neverTriggered15 k@@0) (neverTriggered15 k_2@@0))
)) (and (=> (= (ControlFlow 0 115) (- 0 116)) (forall ((k@@1 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| start end) (int_2_U k@@1)) (>= (U_2_real (MapType1Select Mask@11 (|Seq#Index| (MapType0Select ExhaleHeap@7 a_2 array) k@@1) value)) FullPerm))
 :qid |stdinbpl.1836:23|
 :skolemid |136|
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@7 a_2 array) k@@1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U k@@1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U k@@1)))
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@7 a_2 array) k@@1))
))) (=> (forall ((k@@2 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| start end) (int_2_U k@@2)) (>= (U_2_real (MapType1Select Mask@11 (|Seq#Index| (MapType0Select ExhaleHeap@7 a_2 array) k@@2) value)) FullPerm))
 :qid |stdinbpl.1836:23|
 :skolemid |136|
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@7 a_2 array) k@@2))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U k@@2)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U k@@2)))
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@7 a_2 array) k@@2))
)) (=> (and (and (forall ((k@@3 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U k@@3)) (< NoPerm FullPerm)) (and (qpRange15 (|Seq#Index| (MapType0Select ExhaleHeap@7 a_2 array) k@@3)) (= (invRecv15 (|Seq#Index| (MapType0Select ExhaleHeap@7 a_2 array) k@@3)) k@@3)))
 :qid |stdinbpl.1842:28|
 :skolemid |137|
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@7 a_2 array) k@@3))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U k@@3)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U k@@3)))
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@7 a_2 array) k@@3))
)) (forall ((o_3@@20 T@U) ) (!  (=> (= (type o_3@@20) RefType) (=> (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U (invRecv15 o_3@@20))) (and (< NoPerm FullPerm) (qpRange15 o_3@@20))) (= (|Seq#Index| (MapType0Select ExhaleHeap@7 a_2 array) (invRecv15 o_3@@20)) o_3@@20)))
 :qid |stdinbpl.1846:28|
 :skolemid |138|
 :pattern ( (invRecv15 o_3@@20))
))) (and (forall ((o_3@@21 T@U) ) (!  (=> (= (type o_3@@21) RefType) (and (=> (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U (invRecv15 o_3@@21))) (and (< NoPerm FullPerm) (qpRange15 o_3@@21))) (and (= (|Seq#Index| (MapType0Select ExhaleHeap@7 a_2 array) (invRecv15 o_3@@21)) o_3@@21) (= (U_2_real (MapType1Select QPMask@10 o_3@@21 value)) (- (U_2_real (MapType1Select Mask@11 o_3@@21 value)) FullPerm)))) (=> (not (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U (invRecv15 o_3@@21))) (and (< NoPerm FullPerm) (qpRange15 o_3@@21)))) (= (U_2_real (MapType1Select QPMask@10 o_3@@21 value)) (U_2_real (MapType1Select Mask@11 o_3@@21 value))))))
 :qid |stdinbpl.1852:28|
 :skolemid |139|
 :pattern ( (MapType1Select QPMask@10 o_3@@21 value))
)) (forall ((o_3@@22 T@U) (f_5@@6 T@U) ) (! (let ((B@@18 (FieldTypeInv1 (type f_5@@6))))
(let ((A@@19 (FieldTypeInv0 (type f_5@@6))))
 (=> (and (and (= (type o_3@@22) RefType) (= (type f_5@@6) (FieldType A@@19 B@@18))) (not (= f_5@@6 value))) (= (U_2_real (MapType1Select Mask@11 o_3@@22 f_5@@6)) (U_2_real (MapType1Select QPMask@10 o_3@@22 f_5@@6))))))
 :qid |stdinbpl.1858:35|
 :skolemid |140|
 :pattern ( (MapType1Select QPMask@10 o_3@@22 f_5@@6))
)))) (and (and (=> (= (ControlFlow 0 115) 106) anon121_Else_correct) (=> (= (ControlFlow 0 115) 112) anon122_Then_correct)) (=> (= (ControlFlow 0 115) 114) anon122_Else_correct))))))))))
(let ((anon117_Else_correct  (and (=> (= (ControlFlow 0 118) (- 0 128)) (forall ((i_37 Int) (i_37_1 Int) ) (!  (=> (and (and (and (and (not (= i_37 i_37_1)) (|Seq#Contains| (|Seq#Range| middle@0 end) (int_2_U i_37))) (|Seq#Contains| (|Seq#Range| middle@0 end) (int_2_U i_37_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| (MapType0Select ExhaleHeap@7 b_2 array) i_37) (|Seq#Index| (MapType0Select ExhaleHeap@7 b_2 array) i_37_1))))
 :qid |stdinbpl.1731:19|
 :skolemid |128|
))) (=> (forall ((i_37@@0 Int) (i_37_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_37@@0 i_37_1@@0)) (|Seq#Contains| (|Seq#Range| middle@0 end) (int_2_U i_37@@0))) (|Seq#Contains| (|Seq#Range| middle@0 end) (int_2_U i_37_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| (MapType0Select ExhaleHeap@7 b_2 array) i_37@@0) (|Seq#Index| (MapType0Select ExhaleHeap@7 b_2 array) i_37_1@@0))))
 :qid |stdinbpl.1731:19|
 :skolemid |128|
)) (=> (and (and (and (forall ((i_37@@1 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| middle@0 end) (int_2_U i_37@@1)) (< NoPerm FullPerm)) (and (qpRange14 (|Seq#Index| (MapType0Select ExhaleHeap@7 b_2 array) i_37@@1)) (= (invRecv14 (|Seq#Index| (MapType0Select ExhaleHeap@7 b_2 array) i_37@@1)) i_37@@1)))
 :qid |stdinbpl.1737:26|
 :skolemid |129|
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@7 b_2 array) i_37@@1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| middle@0 end) (int_2_U i_37@@1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| middle@0 end) (int_2_U i_37@@1)))
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@7 b_2 array) i_37@@1))
)) (forall ((o_3@@23 T@U) ) (!  (=> (= (type o_3@@23) RefType) (=> (and (and (|Seq#Contains| (|Seq#Range| middle@0 end) (int_2_U (invRecv14 o_3@@23))) (< NoPerm FullPerm)) (qpRange14 o_3@@23)) (= (|Seq#Index| (MapType0Select ExhaleHeap@7 b_2 array) (invRecv14 o_3@@23)) o_3@@23)))
 :qid |stdinbpl.1741:26|
 :skolemid |130|
 :pattern ( (invRecv14 o_3@@23))
))) (and (forall ((i_37@@2 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| middle@0 end) (int_2_U i_37@@2)) (not (= (|Seq#Index| (MapType0Select ExhaleHeap@7 b_2 array) i_37@@2) null)))
 :qid |stdinbpl.1747:26|
 :skolemid |131|
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@7 b_2 array) i_37@@2))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| middle@0 end) (int_2_U i_37@@2)))
 :pattern ( (|Seq#Contains| (|Seq#Range| middle@0 end) (int_2_U i_37@@2)))
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@7 b_2 array) i_37@@2))
)) (forall ((o_3@@24 T@U) ) (!  (=> (= (type o_3@@24) RefType) (and (=> (and (and (|Seq#Contains| (|Seq#Range| middle@0 end) (int_2_U (invRecv14 o_3@@24))) (< NoPerm FullPerm)) (qpRange14 o_3@@24)) (and (=> (< NoPerm FullPerm) (= (|Seq#Index| (MapType0Select ExhaleHeap@7 b_2 array) (invRecv14 o_3@@24)) o_3@@24)) (= (U_2_real (MapType1Select QPMask@9 o_3@@24 value)) (+ (U_2_real (MapType1Select QPMask@8 o_3@@24 value)) FullPerm)))) (=> (not (and (and (|Seq#Contains| (|Seq#Range| middle@0 end) (int_2_U (invRecv14 o_3@@24))) (< NoPerm FullPerm)) (qpRange14 o_3@@24))) (= (U_2_real (MapType1Select QPMask@9 o_3@@24 value)) (U_2_real (MapType1Select QPMask@8 o_3@@24 value))))))
 :qid |stdinbpl.1753:26|
 :skolemid |132|
 :pattern ( (MapType1Select QPMask@9 o_3@@24 value))
)))) (and (and (forall ((o_3@@25 T@U) (f_5@@7 T@U) ) (! (let ((B@@19 (FieldTypeInv1 (type f_5@@7))))
(let ((A@@20 (FieldTypeInv0 (type f_5@@7))))
 (=> (and (and (= (type o_3@@25) RefType) (= (type f_5@@7) (FieldType A@@20 B@@19))) (not (= f_5@@7 value))) (= (U_2_real (MapType1Select QPMask@8 o_3@@25 f_5@@7)) (U_2_real (MapType1Select QPMask@9 o_3@@25 f_5@@7))))))
 :qid |stdinbpl.1757:33|
 :skolemid |133|
 :pattern ( (MapType1Select QPMask@8 o_3@@25 f_5@@7))
 :pattern ( (MapType1Select QPMask@9 o_3@@25 f_5@@7))
)) (state ExhaleHeap@7 QPMask@9)) (and (state ExhaleHeap@7 QPMask@9) (state ExhaleHeap@7 QPMask@9)))) (and (=> (= (ControlFlow 0 118) (- 0 127)) (HasDirectPerm QPMask@9 a_2 array)) (=> (HasDirectPerm QPMask@9 a_2 array) (=> (|Seq#Equal| (MapType0Select ExhaleHeap@7 a_2 array) t2A@0) (=> (and (state ExhaleHeap@7 QPMask@9) (state ExhaleHeap@7 QPMask@9)) (and (=> (= (ControlFlow 0 118) (- 0 126)) (HasDirectPerm QPMask@9 b_2 array)) (=> (HasDirectPerm QPMask@9 b_2 array) (=> (|Seq#Equal| (MapType0Select ExhaleHeap@7 b_2 array) t2B@0) (=> (and (state ExhaleHeap@7 QPMask@9) (state ExhaleHeap@7 QPMask@9)) (and (=> (= (ControlFlow 0 118) (- 0 125)) (> (U_2_real (MapType1Select QPMask@9 a_2 array)) NoPerm)) (=> (> (U_2_real (MapType1Select QPMask@9 a_2 array)) NoPerm) (=> (> wildcard@12 NoPerm) (=> (and (< wildcard@12 (U_2_real (MapType1Select QPMask@9 a_2 array))) (= Mask@10 (MapType1Store QPMask@9 a_2 array (real_2_U (- (U_2_real (MapType1Select QPMask@9 a_2 array)) wildcard@12))))) (and (=> (= (ControlFlow 0 118) (- 0 124)) (> (U_2_real (MapType1Select Mask@10 b_2 array)) NoPerm)) (=> (> (U_2_real (MapType1Select Mask@10 b_2 array)) NoPerm) (=> (> wildcard@13 NoPerm) (=> (and (< wildcard@13 (U_2_real (MapType1Select Mask@10 b_2 array))) (= Mask@11 (MapType1Store Mask@10 b_2 array (real_2_U (- (U_2_real (MapType1Select Mask@10 b_2 array)) wildcard@13))))) (and (=> (= (ControlFlow 0 118) (- 0 123)) (<= 0 start)) (=> (<= 0 start) (and (=> (= (ControlFlow 0 118) (- 0 122)) (<= end (|Seq#Length| (MapType0Select ExhaleHeap@7 a_2 array)))) (=> (<= end (|Seq#Length| (MapType0Select ExhaleHeap@7 a_2 array))) (and (=> (= (ControlFlow 0 118) (- 0 121)) (= (|Seq#Length| (MapType0Select ExhaleHeap@7 b_2 array)) (|Seq#Length| (MapType0Select ExhaleHeap@7 a_2 array)))) (=> (= (|Seq#Length| (MapType0Select ExhaleHeap@7 b_2 array)) (|Seq#Length| (MapType0Select ExhaleHeap@7 a_2 array))) (and (=> (= (ControlFlow 0 118) (- 0 120)) (< start middle@0)) (=> (< start middle@0) (and (=> (= (ControlFlow 0 118) (- 0 119)) (< middle@0 end)) (=> (< middle@0 end) (and (and (=> (= (ControlFlow 0 118) 115) anon119_Else_correct) (=> (= (ControlFlow 0 118) 103) anon120_Then_correct)) (=> (= (ControlFlow 0 118) 105) anon120_Else_correct)))))))))))))))))))))))))))))))))
(let ((anon115_Else_correct  (and (=> (= (ControlFlow 0 129) (- 0 130)) (forall ((i_35 Int) (i_35_1 Int) ) (!  (=> (and (and (and (and (not (= i_35 i_35_1)) (|Seq#Contains| (|Seq#Range| middle@0 end) (int_2_U i_35))) (|Seq#Contains| (|Seq#Range| middle@0 end) (int_2_U i_35_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| (MapType0Select ExhaleHeap@7 a_2 array) i_35) (|Seq#Index| (MapType0Select ExhaleHeap@7 a_2 array) i_35_1))))
 :qid |stdinbpl.1677:19|
 :skolemid |122|
))) (=> (forall ((i_35@@0 Int) (i_35_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_35@@0 i_35_1@@0)) (|Seq#Contains| (|Seq#Range| middle@0 end) (int_2_U i_35@@0))) (|Seq#Contains| (|Seq#Range| middle@0 end) (int_2_U i_35_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| (MapType0Select ExhaleHeap@7 a_2 array) i_35@@0) (|Seq#Index| (MapType0Select ExhaleHeap@7 a_2 array) i_35_1@@0))))
 :qid |stdinbpl.1677:19|
 :skolemid |122|
)) (=> (and (and (and (forall ((i_35@@1 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| middle@0 end) (int_2_U i_35@@1)) (< NoPerm FullPerm)) (and (qpRange13 (|Seq#Index| (MapType0Select ExhaleHeap@7 a_2 array) i_35@@1)) (= (invRecv13 (|Seq#Index| (MapType0Select ExhaleHeap@7 a_2 array) i_35@@1)) i_35@@1)))
 :qid |stdinbpl.1683:26|
 :skolemid |123|
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@7 a_2 array) i_35@@1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| middle@0 end) (int_2_U i_35@@1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| middle@0 end) (int_2_U i_35@@1)))
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@7 a_2 array) i_35@@1))
)) (forall ((o_3@@26 T@U) ) (!  (=> (= (type o_3@@26) RefType) (=> (and (and (|Seq#Contains| (|Seq#Range| middle@0 end) (int_2_U (invRecv13 o_3@@26))) (< NoPerm FullPerm)) (qpRange13 o_3@@26)) (= (|Seq#Index| (MapType0Select ExhaleHeap@7 a_2 array) (invRecv13 o_3@@26)) o_3@@26)))
 :qid |stdinbpl.1687:26|
 :skolemid |124|
 :pattern ( (invRecv13 o_3@@26))
))) (and (forall ((i_35@@2 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| middle@0 end) (int_2_U i_35@@2)) (not (= (|Seq#Index| (MapType0Select ExhaleHeap@7 a_2 array) i_35@@2) null)))
 :qid |stdinbpl.1693:26|
 :skolemid |125|
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@7 a_2 array) i_35@@2))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| middle@0 end) (int_2_U i_35@@2)))
 :pattern ( (|Seq#Contains| (|Seq#Range| middle@0 end) (int_2_U i_35@@2)))
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@7 a_2 array) i_35@@2))
)) (forall ((o_3@@27 T@U) ) (!  (=> (= (type o_3@@27) RefType) (and (=> (and (and (|Seq#Contains| (|Seq#Range| middle@0 end) (int_2_U (invRecv13 o_3@@27))) (< NoPerm FullPerm)) (qpRange13 o_3@@27)) (and (=> (< NoPerm FullPerm) (= (|Seq#Index| (MapType0Select ExhaleHeap@7 a_2 array) (invRecv13 o_3@@27)) o_3@@27)) (= (U_2_real (MapType1Select QPMask@8 o_3@@27 value)) (+ (U_2_real (MapType1Select Mask@9 o_3@@27 value)) FullPerm)))) (=> (not (and (and (|Seq#Contains| (|Seq#Range| middle@0 end) (int_2_U (invRecv13 o_3@@27))) (< NoPerm FullPerm)) (qpRange13 o_3@@27))) (= (U_2_real (MapType1Select QPMask@8 o_3@@27 value)) (U_2_real (MapType1Select Mask@9 o_3@@27 value))))))
 :qid |stdinbpl.1699:26|
 :skolemid |126|
 :pattern ( (MapType1Select QPMask@8 o_3@@27 value))
)))) (and (and (forall ((o_3@@28 T@U) (f_5@@8 T@U) ) (! (let ((B@@20 (FieldTypeInv1 (type f_5@@8))))
(let ((A@@21 (FieldTypeInv0 (type f_5@@8))))
 (=> (and (and (= (type o_3@@28) RefType) (= (type f_5@@8) (FieldType A@@21 B@@20))) (not (= f_5@@8 value))) (= (U_2_real (MapType1Select Mask@9 o_3@@28 f_5@@8)) (U_2_real (MapType1Select QPMask@8 o_3@@28 f_5@@8))))))
 :qid |stdinbpl.1703:33|
 :skolemid |127|
 :pattern ( (MapType1Select Mask@9 o_3@@28 f_5@@8))
 :pattern ( (MapType1Select QPMask@8 o_3@@28 f_5@@8))
)) (state ExhaleHeap@7 QPMask@8)) (and (state ExhaleHeap@7 QPMask@8) (state ExhaleHeap@7 QPMask@8)))) (and (and (=> (= (ControlFlow 0 129) 118) anon117_Else_correct) (=> (= (ControlFlow 0 129) 97) anon118_Then_correct)) (=> (= (ControlFlow 0 129) 101) anon118_Else_correct)))))))
(let ((anon113_Else_correct  (and (=> (= (ControlFlow 0 131) (- 0 134)) (forall ((i_33 Int) (i_33_1 Int) ) (!  (=> (and (and (and (and (not (= i_33 i_33_1)) (|Seq#Contains| (|Seq#Range| start middle@0) (int_2_U i_33))) (|Seq#Contains| (|Seq#Range| start middle@0) (int_2_U i_33_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| (MapType0Select ExhaleHeap@7 b_2 array) i_33) (|Seq#Index| (MapType0Select ExhaleHeap@7 b_2 array) i_33_1))))
 :qid |stdinbpl.1587:19|
 :skolemid |116|
))) (=> (forall ((i_33@@0 Int) (i_33_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_33@@0 i_33_1@@0)) (|Seq#Contains| (|Seq#Range| start middle@0) (int_2_U i_33@@0))) (|Seq#Contains| (|Seq#Range| start middle@0) (int_2_U i_33_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| (MapType0Select ExhaleHeap@7 b_2 array) i_33@@0) (|Seq#Index| (MapType0Select ExhaleHeap@7 b_2 array) i_33_1@@0))))
 :qid |stdinbpl.1587:19|
 :skolemid |116|
)) (=> (and (and (and (forall ((i_33@@1 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| start middle@0) (int_2_U i_33@@1)) (< NoPerm FullPerm)) (and (qpRange12 (|Seq#Index| (MapType0Select ExhaleHeap@7 b_2 array) i_33@@1)) (= (invRecv12 (|Seq#Index| (MapType0Select ExhaleHeap@7 b_2 array) i_33@@1)) i_33@@1)))
 :qid |stdinbpl.1593:26|
 :skolemid |117|
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@7 b_2 array) i_33@@1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start middle@0) (int_2_U i_33@@1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start middle@0) (int_2_U i_33@@1)))
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@7 b_2 array) i_33@@1))
)) (forall ((o_3@@29 T@U) ) (!  (=> (= (type o_3@@29) RefType) (=> (and (and (|Seq#Contains| (|Seq#Range| start middle@0) (int_2_U (invRecv12 o_3@@29))) (< NoPerm FullPerm)) (qpRange12 o_3@@29)) (= (|Seq#Index| (MapType0Select ExhaleHeap@7 b_2 array) (invRecv12 o_3@@29)) o_3@@29)))
 :qid |stdinbpl.1597:26|
 :skolemid |118|
 :pattern ( (invRecv12 o_3@@29))
))) (and (forall ((i_33@@2 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| start middle@0) (int_2_U i_33@@2)) (not (= (|Seq#Index| (MapType0Select ExhaleHeap@7 b_2 array) i_33@@2) null)))
 :qid |stdinbpl.1603:26|
 :skolemid |119|
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@7 b_2 array) i_33@@2))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start middle@0) (int_2_U i_33@@2)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start middle@0) (int_2_U i_33@@2)))
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@7 b_2 array) i_33@@2))
)) (forall ((o_3@@30 T@U) ) (!  (=> (= (type o_3@@30) RefType) (and (=> (and (and (|Seq#Contains| (|Seq#Range| start middle@0) (int_2_U (invRecv12 o_3@@30))) (< NoPerm FullPerm)) (qpRange12 o_3@@30)) (and (=> (< NoPerm FullPerm) (= (|Seq#Index| (MapType0Select ExhaleHeap@7 b_2 array) (invRecv12 o_3@@30)) o_3@@30)) (= (U_2_real (MapType1Select QPMask@7 o_3@@30 value)) (+ (U_2_real (MapType1Select QPMask@6 o_3@@30 value)) FullPerm)))) (=> (not (and (and (|Seq#Contains| (|Seq#Range| start middle@0) (int_2_U (invRecv12 o_3@@30))) (< NoPerm FullPerm)) (qpRange12 o_3@@30))) (= (U_2_real (MapType1Select QPMask@7 o_3@@30 value)) (U_2_real (MapType1Select QPMask@6 o_3@@30 value))))))
 :qid |stdinbpl.1609:26|
 :skolemid |120|
 :pattern ( (MapType1Select QPMask@7 o_3@@30 value))
)))) (and (and (forall ((o_3@@31 T@U) (f_5@@9 T@U) ) (! (let ((B@@21 (FieldTypeInv1 (type f_5@@9))))
(let ((A@@22 (FieldTypeInv0 (type f_5@@9))))
 (=> (and (and (= (type o_3@@31) RefType) (= (type f_5@@9) (FieldType A@@22 B@@21))) (not (= f_5@@9 value))) (= (U_2_real (MapType1Select QPMask@6 o_3@@31 f_5@@9)) (U_2_real (MapType1Select QPMask@7 o_3@@31 f_5@@9))))))
 :qid |stdinbpl.1613:33|
 :skolemid |121|
 :pattern ( (MapType1Select QPMask@6 o_3@@31 f_5@@9))
 :pattern ( (MapType1Select QPMask@7 o_3@@31 f_5@@9))
)) (state ExhaleHeap@7 QPMask@7)) (and (state ExhaleHeap@7 QPMask@7) (state ExhaleHeap@7 QPMask@7)))) (and (=> (= (ControlFlow 0 131) (- 0 133)) (HasDirectPerm QPMask@7 a_2 array)) (=> (HasDirectPerm QPMask@7 a_2 array) (=> (|Seq#Equal| (MapType0Select ExhaleHeap@7 a_2 array) t1A@0) (=> (and (state ExhaleHeap@7 QPMask@7) (state ExhaleHeap@7 QPMask@7)) (and (=> (= (ControlFlow 0 131) (- 0 132)) (HasDirectPerm QPMask@7 b_2 array)) (=> (HasDirectPerm QPMask@7 b_2 array) (=> (|Seq#Equal| (MapType0Select ExhaleHeap@7 b_2 array) t1B@0) (=> (and (state ExhaleHeap@7 QPMask@7) (state ExhaleHeap@7 QPMask@7)) (=> (and (and (> wildcard@10 NoPerm) (not (= a_2 null))) (and (= Mask@8 (MapType1Store QPMask@7 a_2 array (real_2_U (+ (U_2_real (MapType1Select QPMask@7 a_2 array)) wildcard@10)))) (state ExhaleHeap@7 Mask@8))) (=> (and (and (and (state ExhaleHeap@7 Mask@8) (state ExhaleHeap@7 Mask@8)) (and (> wildcard@11 NoPerm) (not (= b_2 null)))) (and (and (= Mask@9 (MapType1Store Mask@8 b_2 array (real_2_U (+ (U_2_real (MapType1Select Mask@8 b_2 array)) wildcard@11)))) (state ExhaleHeap@7 Mask@9)) (and (state ExhaleHeap@7 Mask@9) (state ExhaleHeap@7 Mask@9)))) (and (and (=> (= (ControlFlow 0 131) 129) anon115_Else_correct) (=> (= (ControlFlow 0 131) 91) anon116_Then_correct)) (=> (= (ControlFlow 0 131) 95) anon116_Else_correct)))))))))))))))))
(let ((anon111_Else_correct  (and (=> (= (ControlFlow 0 135) (- 0 136)) (forall ((i_31 Int) (i_31_1 Int) ) (!  (=> (and (and (and (and (not (= i_31 i_31_1)) (|Seq#Contains| (|Seq#Range| start middle@0) (int_2_U i_31))) (|Seq#Contains| (|Seq#Range| start middle@0) (int_2_U i_31_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| (MapType0Select ExhaleHeap@7 a_2 array) i_31) (|Seq#Index| (MapType0Select ExhaleHeap@7 a_2 array) i_31_1))))
 :qid |stdinbpl.1533:19|
 :skolemid |110|
))) (=> (forall ((i_31@@0 Int) (i_31_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_31@@0 i_31_1@@0)) (|Seq#Contains| (|Seq#Range| start middle@0) (int_2_U i_31@@0))) (|Seq#Contains| (|Seq#Range| start middle@0) (int_2_U i_31_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| (MapType0Select ExhaleHeap@7 a_2 array) i_31@@0) (|Seq#Index| (MapType0Select ExhaleHeap@7 a_2 array) i_31_1@@0))))
 :qid |stdinbpl.1533:19|
 :skolemid |110|
)) (=> (and (and (and (forall ((i_31@@1 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| start middle@0) (int_2_U i_31@@1)) (< NoPerm FullPerm)) (and (qpRange11 (|Seq#Index| (MapType0Select ExhaleHeap@7 a_2 array) i_31@@1)) (= (invRecv11 (|Seq#Index| (MapType0Select ExhaleHeap@7 a_2 array) i_31@@1)) i_31@@1)))
 :qid |stdinbpl.1539:26|
 :skolemid |111|
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@7 a_2 array) i_31@@1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start middle@0) (int_2_U i_31@@1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start middle@0) (int_2_U i_31@@1)))
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@7 a_2 array) i_31@@1))
)) (forall ((o_3@@32 T@U) ) (!  (=> (= (type o_3@@32) RefType) (=> (and (and (|Seq#Contains| (|Seq#Range| start middle@0) (int_2_U (invRecv11 o_3@@32))) (< NoPerm FullPerm)) (qpRange11 o_3@@32)) (= (|Seq#Index| (MapType0Select ExhaleHeap@7 a_2 array) (invRecv11 o_3@@32)) o_3@@32)))
 :qid |stdinbpl.1543:26|
 :skolemid |112|
 :pattern ( (invRecv11 o_3@@32))
))) (and (forall ((i_31@@2 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| start middle@0) (int_2_U i_31@@2)) (not (= (|Seq#Index| (MapType0Select ExhaleHeap@7 a_2 array) i_31@@2) null)))
 :qid |stdinbpl.1549:26|
 :skolemid |113|
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@7 a_2 array) i_31@@2))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start middle@0) (int_2_U i_31@@2)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start middle@0) (int_2_U i_31@@2)))
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@7 a_2 array) i_31@@2))
)) (forall ((o_3@@33 T@U) ) (!  (=> (= (type o_3@@33) RefType) (and (=> (and (and (|Seq#Contains| (|Seq#Range| start middle@0) (int_2_U (invRecv11 o_3@@33))) (< NoPerm FullPerm)) (qpRange11 o_3@@33)) (and (=> (< NoPerm FullPerm) (= (|Seq#Index| (MapType0Select ExhaleHeap@7 a_2 array) (invRecv11 o_3@@33)) o_3@@33)) (= (U_2_real (MapType1Select QPMask@6 o_3@@33 value)) (+ (U_2_real (MapType1Select Mask@7 o_3@@33 value)) FullPerm)))) (=> (not (and (and (|Seq#Contains| (|Seq#Range| start middle@0) (int_2_U (invRecv11 o_3@@33))) (< NoPerm FullPerm)) (qpRange11 o_3@@33))) (= (U_2_real (MapType1Select QPMask@6 o_3@@33 value)) (U_2_real (MapType1Select Mask@7 o_3@@33 value))))))
 :qid |stdinbpl.1555:26|
 :skolemid |114|
 :pattern ( (MapType1Select QPMask@6 o_3@@33 value))
)))) (and (and (forall ((o_3@@34 T@U) (f_5@@10 T@U) ) (! (let ((B@@22 (FieldTypeInv1 (type f_5@@10))))
(let ((A@@23 (FieldTypeInv0 (type f_5@@10))))
 (=> (and (and (= (type o_3@@34) RefType) (= (type f_5@@10) (FieldType A@@23 B@@22))) (not (= f_5@@10 value))) (= (U_2_real (MapType1Select Mask@7 o_3@@34 f_5@@10)) (U_2_real (MapType1Select QPMask@6 o_3@@34 f_5@@10))))))
 :qid |stdinbpl.1559:33|
 :skolemid |115|
 :pattern ( (MapType1Select Mask@7 o_3@@34 f_5@@10))
 :pattern ( (MapType1Select QPMask@6 o_3@@34 f_5@@10))
)) (state ExhaleHeap@7 QPMask@6)) (and (state ExhaleHeap@7 QPMask@6) (state ExhaleHeap@7 QPMask@6)))) (and (and (=> (= (ControlFlow 0 135) 131) anon113_Else_correct) (=> (= (ControlFlow 0 135) 85) anon114_Then_correct)) (=> (= (ControlFlow 0 135) 89) anon114_Else_correct)))))))
(let ((anon109_Else_correct  (and (=> (= (ControlFlow 0 137) (- 0 139)) (forall ((i_29 Int) (i_29_1 Int) ) (!  (=> (and (and (and (and (not (= i_29 i_29_1)) (|Seq#Contains| (|Seq#Range| middle@0 end) (int_2_U i_29))) (|Seq#Contains| (|Seq#Range| middle@0 end) (int_2_U i_29_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| (MapType0Select ExhaleHeap@6 b_2 array) i_29) (|Seq#Index| (MapType0Select ExhaleHeap@6 b_2 array) i_29_1))))
 :qid |stdinbpl.1456:21|
 :skolemid |104|
 :pattern ( (neverTriggered10 i_29) (neverTriggered10 i_29_1))
))) (=> (forall ((i_29@@0 Int) (i_29_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_29@@0 i_29_1@@0)) (|Seq#Contains| (|Seq#Range| middle@0 end) (int_2_U i_29@@0))) (|Seq#Contains| (|Seq#Range| middle@0 end) (int_2_U i_29_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| (MapType0Select ExhaleHeap@6 b_2 array) i_29@@0) (|Seq#Index| (MapType0Select ExhaleHeap@6 b_2 array) i_29_1@@0))))
 :qid |stdinbpl.1456:21|
 :skolemid |104|
 :pattern ( (neverTriggered10 i_29@@0) (neverTriggered10 i_29_1@@0))
)) (and (=> (= (ControlFlow 0 137) (- 0 138)) (forall ((i_29@@1 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| middle@0 end) (int_2_U i_29@@1)) (>= (U_2_real (MapType1Select QPMask@4 (|Seq#Index| (MapType0Select ExhaleHeap@6 b_2 array) i_29@@1) value)) FullPerm))
 :qid |stdinbpl.1463:21|
 :skolemid |105|
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@6 b_2 array) i_29@@1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| middle@0 end) (int_2_U i_29@@1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| middle@0 end) (int_2_U i_29@@1)))
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@6 b_2 array) i_29@@1))
))) (=> (forall ((i_29@@2 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| middle@0 end) (int_2_U i_29@@2)) (>= (U_2_real (MapType1Select QPMask@4 (|Seq#Index| (MapType0Select ExhaleHeap@6 b_2 array) i_29@@2) value)) FullPerm))
 :qid |stdinbpl.1463:21|
 :skolemid |105|
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@6 b_2 array) i_29@@2))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| middle@0 end) (int_2_U i_29@@2)))
 :pattern ( (|Seq#Contains| (|Seq#Range| middle@0 end) (int_2_U i_29@@2)))
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@6 b_2 array) i_29@@2))
)) (=> (and (forall ((i_29@@3 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| middle@0 end) (int_2_U i_29@@3)) (< NoPerm FullPerm)) (and (qpRange10 (|Seq#Index| (MapType0Select ExhaleHeap@6 b_2 array) i_29@@3)) (= (invRecv10 (|Seq#Index| (MapType0Select ExhaleHeap@6 b_2 array) i_29@@3)) i_29@@3)))
 :qid |stdinbpl.1469:26|
 :skolemid |106|
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@6 b_2 array) i_29@@3))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| middle@0 end) (int_2_U i_29@@3)))
 :pattern ( (|Seq#Contains| (|Seq#Range| middle@0 end) (int_2_U i_29@@3)))
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@6 b_2 array) i_29@@3))
)) (forall ((o_3@@35 T@U) ) (!  (=> (= (type o_3@@35) RefType) (=> (and (|Seq#Contains| (|Seq#Range| middle@0 end) (int_2_U (invRecv10 o_3@@35))) (and (< NoPerm FullPerm) (qpRange10 o_3@@35))) (= (|Seq#Index| (MapType0Select ExhaleHeap@6 b_2 array) (invRecv10 o_3@@35)) o_3@@35)))
 :qid |stdinbpl.1473:26|
 :skolemid |107|
 :pattern ( (invRecv10 o_3@@35))
))) (=> (and (and (and (and (forall ((o_3@@36 T@U) ) (!  (=> (= (type o_3@@36) RefType) (and (=> (and (|Seq#Contains| (|Seq#Range| middle@0 end) (int_2_U (invRecv10 o_3@@36))) (and (< NoPerm FullPerm) (qpRange10 o_3@@36))) (and (= (|Seq#Index| (MapType0Select ExhaleHeap@6 b_2 array) (invRecv10 o_3@@36)) o_3@@36) (= (U_2_real (MapType1Select QPMask@5 o_3@@36 value)) (- (U_2_real (MapType1Select QPMask@4 o_3@@36 value)) FullPerm)))) (=> (not (and (|Seq#Contains| (|Seq#Range| middle@0 end) (int_2_U (invRecv10 o_3@@36))) (and (< NoPerm FullPerm) (qpRange10 o_3@@36)))) (= (U_2_real (MapType1Select QPMask@5 o_3@@36 value)) (U_2_real (MapType1Select QPMask@4 o_3@@36 value))))))
 :qid |stdinbpl.1479:26|
 :skolemid |108|
 :pattern ( (MapType1Select QPMask@5 o_3@@36 value))
)) (forall ((o_3@@37 T@U) (f_5@@11 T@U) ) (! (let ((B@@23 (FieldTypeInv1 (type f_5@@11))))
(let ((A@@24 (FieldTypeInv0 (type f_5@@11))))
 (=> (and (and (= (type o_3@@37) RefType) (= (type f_5@@11) (FieldType A@@24 B@@23))) (not (= f_5@@11 value))) (= (U_2_real (MapType1Select QPMask@4 o_3@@37 f_5@@11)) (U_2_real (MapType1Select QPMask@5 o_3@@37 f_5@@11))))))
 :qid |stdinbpl.1485:33|
 :skolemid |109|
 :pattern ( (MapType1Select QPMask@5 o_3@@37 f_5@@11))
))) (and (IdenticalOnKnownLocations ExhaleHeap@6 ExhaleHeap@7 QPMask@5) (state ExhaleHeap@7 QPMask@5))) (and (and (> wildcard@8 NoPerm) (not (= a_2 null))) (and (= Mask@6 (MapType1Store QPMask@5 a_2 array (real_2_U (+ (U_2_real (MapType1Select QPMask@5 a_2 array)) wildcard@8)))) (state ExhaleHeap@7 Mask@6)))) (and (and (and (state ExhaleHeap@7 Mask@6) (state ExhaleHeap@7 Mask@6)) (and (> wildcard@9 NoPerm) (not (= b_2 null)))) (and (and (= Mask@7 (MapType1Store Mask@6 b_2 array (real_2_U (+ (U_2_real (MapType1Select Mask@6 b_2 array)) wildcard@9)))) (state ExhaleHeap@7 Mask@7)) (and (state ExhaleHeap@7 Mask@7) (state ExhaleHeap@7 Mask@7))))) (and (and (=> (= (ControlFlow 0 137) 135) anon111_Else_correct) (=> (= (ControlFlow 0 137) 79) anon112_Then_correct)) (=> (= (ControlFlow 0 137) 83) anon112_Else_correct))))))))))
(let ((anon107_Else_correct  (and (=> (= (ControlFlow 0 140) (- 0 142)) (forall ((i_27 Int) (i_27_1 Int) ) (!  (=> (and (and (and (and (not (= i_27 i_27_1)) (|Seq#Contains| (|Seq#Range| middle@0 end) (int_2_U i_27))) (|Seq#Contains| (|Seq#Range| middle@0 end) (int_2_U i_27_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| (MapType0Select ExhaleHeap@5 a_2 array) i_27) (|Seq#Index| (MapType0Select ExhaleHeap@5 a_2 array) i_27_1))))
 :qid |stdinbpl.1390:21|
 :skolemid |98|
 :pattern ( (neverTriggered9 i_27) (neverTriggered9 i_27_1))
))) (=> (forall ((i_27@@0 Int) (i_27_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_27@@0 i_27_1@@0)) (|Seq#Contains| (|Seq#Range| middle@0 end) (int_2_U i_27@@0))) (|Seq#Contains| (|Seq#Range| middle@0 end) (int_2_U i_27_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| (MapType0Select ExhaleHeap@5 a_2 array) i_27@@0) (|Seq#Index| (MapType0Select ExhaleHeap@5 a_2 array) i_27_1@@0))))
 :qid |stdinbpl.1390:21|
 :skolemid |98|
 :pattern ( (neverTriggered9 i_27@@0) (neverTriggered9 i_27_1@@0))
)) (and (=> (= (ControlFlow 0 140) (- 0 141)) (forall ((i_27@@1 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| middle@0 end) (int_2_U i_27@@1)) (>= (U_2_real (MapType1Select Mask@5 (|Seq#Index| (MapType0Select ExhaleHeap@5 a_2 array) i_27@@1) value)) FullPerm))
 :qid |stdinbpl.1397:21|
 :skolemid |99|
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@5 a_2 array) i_27@@1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| middle@0 end) (int_2_U i_27@@1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| middle@0 end) (int_2_U i_27@@1)))
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@5 a_2 array) i_27@@1))
))) (=> (forall ((i_27@@2 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| middle@0 end) (int_2_U i_27@@2)) (>= (U_2_real (MapType1Select Mask@5 (|Seq#Index| (MapType0Select ExhaleHeap@5 a_2 array) i_27@@2) value)) FullPerm))
 :qid |stdinbpl.1397:21|
 :skolemid |99|
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@5 a_2 array) i_27@@2))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| middle@0 end) (int_2_U i_27@@2)))
 :pattern ( (|Seq#Contains| (|Seq#Range| middle@0 end) (int_2_U i_27@@2)))
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@5 a_2 array) i_27@@2))
)) (=> (and (forall ((i_27@@3 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| middle@0 end) (int_2_U i_27@@3)) (< NoPerm FullPerm)) (and (qpRange9 (|Seq#Index| (MapType0Select ExhaleHeap@5 a_2 array) i_27@@3)) (= (invRecv9 (|Seq#Index| (MapType0Select ExhaleHeap@5 a_2 array) i_27@@3)) i_27@@3)))
 :qid |stdinbpl.1403:26|
 :skolemid |100|
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@5 a_2 array) i_27@@3))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| middle@0 end) (int_2_U i_27@@3)))
 :pattern ( (|Seq#Contains| (|Seq#Range| middle@0 end) (int_2_U i_27@@3)))
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@5 a_2 array) i_27@@3))
)) (forall ((o_3@@38 T@U) ) (!  (=> (= (type o_3@@38) RefType) (=> (and (|Seq#Contains| (|Seq#Range| middle@0 end) (int_2_U (invRecv9 o_3@@38))) (and (< NoPerm FullPerm) (qpRange9 o_3@@38))) (= (|Seq#Index| (MapType0Select ExhaleHeap@5 a_2 array) (invRecv9 o_3@@38)) o_3@@38)))
 :qid |stdinbpl.1407:26|
 :skolemid |101|
 :pattern ( (invRecv9 o_3@@38))
))) (=> (and (and (forall ((o_3@@39 T@U) ) (!  (=> (= (type o_3@@39) RefType) (and (=> (and (|Seq#Contains| (|Seq#Range| middle@0 end) (int_2_U (invRecv9 o_3@@39))) (and (< NoPerm FullPerm) (qpRange9 o_3@@39))) (and (= (|Seq#Index| (MapType0Select ExhaleHeap@5 a_2 array) (invRecv9 o_3@@39)) o_3@@39) (= (U_2_real (MapType1Select QPMask@4 o_3@@39 value)) (- (U_2_real (MapType1Select Mask@5 o_3@@39 value)) FullPerm)))) (=> (not (and (|Seq#Contains| (|Seq#Range| middle@0 end) (int_2_U (invRecv9 o_3@@39))) (and (< NoPerm FullPerm) (qpRange9 o_3@@39)))) (= (U_2_real (MapType1Select QPMask@4 o_3@@39 value)) (U_2_real (MapType1Select Mask@5 o_3@@39 value))))))
 :qid |stdinbpl.1413:26|
 :skolemid |102|
 :pattern ( (MapType1Select QPMask@4 o_3@@39 value))
)) (forall ((o_3@@40 T@U) (f_5@@12 T@U) ) (! (let ((B@@24 (FieldTypeInv1 (type f_5@@12))))
(let ((A@@25 (FieldTypeInv0 (type f_5@@12))))
 (=> (and (and (= (type o_3@@40) RefType) (= (type f_5@@12) (FieldType A@@25 B@@24))) (not (= f_5@@12 value))) (= (U_2_real (MapType1Select Mask@5 o_3@@40 f_5@@12)) (U_2_real (MapType1Select QPMask@4 o_3@@40 f_5@@12))))))
 :qid |stdinbpl.1419:33|
 :skolemid |103|
 :pattern ( (MapType1Select QPMask@4 o_3@@40 f_5@@12))
))) (and (IdenticalOnKnownLocations ExhaleHeap@5 ExhaleHeap@6 QPMask@4) (state ExhaleHeap@6 QPMask@4))) (and (and (=> (= (ControlFlow 0 140) 137) anon109_Else_correct) (=> (= (ControlFlow 0 140) 73) anon110_Then_correct)) (=> (= (ControlFlow 0 140) 77) anon110_Else_correct))))))))))
(let ((anon105_Else_correct  (and (=> (= (ControlFlow 0 143) (- 0 155)) (forall ((i_25 Int) (i_25_1 Int) ) (!  (=> (and (and (and (and (not (= i_25 i_25_1)) (|Seq#Contains| (|Seq#Range| start middle@0) (int_2_U i_25))) (|Seq#Contains| (|Seq#Range| start middle@0) (int_2_U i_25_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| (MapType0Select ExhaleHeap@2 b_2 array) i_25) (|Seq#Index| (MapType0Select ExhaleHeap@2 b_2 array) i_25_1))))
 :qid |stdinbpl.1259:21|
 :skolemid |92|
 :pattern ( (neverTriggered8 i_25) (neverTriggered8 i_25_1))
))) (=> (forall ((i_25@@0 Int) (i_25_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_25@@0 i_25_1@@0)) (|Seq#Contains| (|Seq#Range| start middle@0) (int_2_U i_25@@0))) (|Seq#Contains| (|Seq#Range| start middle@0) (int_2_U i_25_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| (MapType0Select ExhaleHeap@2 b_2 array) i_25@@0) (|Seq#Index| (MapType0Select ExhaleHeap@2 b_2 array) i_25_1@@0))))
 :qid |stdinbpl.1259:21|
 :skolemid |92|
 :pattern ( (neverTriggered8 i_25@@0) (neverTriggered8 i_25_1@@0))
)) (and (=> (= (ControlFlow 0 143) (- 0 154)) (forall ((i_25@@1 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| start middle@0) (int_2_U i_25@@1)) (>= (U_2_real (MapType1Select QPMask@2 (|Seq#Index| (MapType0Select ExhaleHeap@2 b_2 array) i_25@@1) value)) FullPerm))
 :qid |stdinbpl.1266:21|
 :skolemid |93|
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@2 b_2 array) i_25@@1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start middle@0) (int_2_U i_25@@1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start middle@0) (int_2_U i_25@@1)))
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@2 b_2 array) i_25@@1))
))) (=> (forall ((i_25@@2 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| start middle@0) (int_2_U i_25@@2)) (>= (U_2_real (MapType1Select QPMask@2 (|Seq#Index| (MapType0Select ExhaleHeap@2 b_2 array) i_25@@2) value)) FullPerm))
 :qid |stdinbpl.1266:21|
 :skolemid |93|
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@2 b_2 array) i_25@@2))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start middle@0) (int_2_U i_25@@2)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start middle@0) (int_2_U i_25@@2)))
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@2 b_2 array) i_25@@2))
)) (=> (and (forall ((i_25@@3 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| start middle@0) (int_2_U i_25@@3)) (< NoPerm FullPerm)) (and (qpRange8 (|Seq#Index| (MapType0Select ExhaleHeap@2 b_2 array) i_25@@3)) (= (invRecv8 (|Seq#Index| (MapType0Select ExhaleHeap@2 b_2 array) i_25@@3)) i_25@@3)))
 :qid |stdinbpl.1272:26|
 :skolemid |94|
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@2 b_2 array) i_25@@3))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start middle@0) (int_2_U i_25@@3)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start middle@0) (int_2_U i_25@@3)))
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@2 b_2 array) i_25@@3))
)) (forall ((o_3@@41 T@U) ) (!  (=> (= (type o_3@@41) RefType) (=> (and (|Seq#Contains| (|Seq#Range| start middle@0) (int_2_U (invRecv8 o_3@@41))) (and (< NoPerm FullPerm) (qpRange8 o_3@@41))) (= (|Seq#Index| (MapType0Select ExhaleHeap@2 b_2 array) (invRecv8 o_3@@41)) o_3@@41)))
 :qid |stdinbpl.1276:26|
 :skolemid |95|
 :pattern ( (invRecv8 o_3@@41))
))) (=> (and (and (forall ((o_3@@42 T@U) ) (!  (=> (= (type o_3@@42) RefType) (and (=> (and (|Seq#Contains| (|Seq#Range| start middle@0) (int_2_U (invRecv8 o_3@@42))) (and (< NoPerm FullPerm) (qpRange8 o_3@@42))) (and (= (|Seq#Index| (MapType0Select ExhaleHeap@2 b_2 array) (invRecv8 o_3@@42)) o_3@@42) (= (U_2_real (MapType1Select QPMask@3 o_3@@42 value)) (- (U_2_real (MapType1Select QPMask@2 o_3@@42 value)) FullPerm)))) (=> (not (and (|Seq#Contains| (|Seq#Range| start middle@0) (int_2_U (invRecv8 o_3@@42))) (and (< NoPerm FullPerm) (qpRange8 o_3@@42)))) (= (U_2_real (MapType1Select QPMask@3 o_3@@42 value)) (U_2_real (MapType1Select QPMask@2 o_3@@42 value))))))
 :qid |stdinbpl.1282:26|
 :skolemid |96|
 :pattern ( (MapType1Select QPMask@3 o_3@@42 value))
)) (forall ((o_3@@43 T@U) (f_5@@13 T@U) ) (! (let ((B@@25 (FieldTypeInv1 (type f_5@@13))))
(let ((A@@26 (FieldTypeInv0 (type f_5@@13))))
 (=> (and (and (= (type o_3@@43) RefType) (= (type f_5@@13) (FieldType A@@26 B@@25))) (not (= f_5@@13 value))) (= (U_2_real (MapType1Select QPMask@2 o_3@@43 f_5@@13)) (U_2_real (MapType1Select QPMask@3 o_3@@43 f_5@@13))))))
 :qid |stdinbpl.1288:33|
 :skolemid |97|
 :pattern ( (MapType1Select QPMask@3 o_3@@43 f_5@@13))
))) (and (IdenticalOnKnownLocations ExhaleHeap@2 ExhaleHeap@3 QPMask@3) (state ExhaleHeap@3 QPMask@3))) (and (=> (= (ControlFlow 0 143) (- 0 153)) (HasDirectPerm QPMask@3 a_2 array)) (=> (HasDirectPerm QPMask@3 a_2 array) (=> (and (= t2A@0 (MapType0Select ExhaleHeap@3 a_2 array)) (state ExhaleHeap@3 QPMask@3)) (and (=> (= (ControlFlow 0 143) (- 0 152)) (HasDirectPerm QPMask@3 b_2 array)) (=> (HasDirectPerm QPMask@3 b_2 array) (=> (and (= t2B@0 (MapType0Select ExhaleHeap@3 b_2 array)) (state ExhaleHeap@3 QPMask@3)) (and (=> (= (ControlFlow 0 143) (- 0 151)) (> (U_2_real (MapType1Select QPMask@3 a_2 array)) NoPerm)) (=> (> (U_2_real (MapType1Select QPMask@3 a_2 array)) NoPerm) (=> (> wildcard@6 NoPerm) (=> (and (and (< wildcard@6 (U_2_real (MapType1Select QPMask@3 a_2 array))) (= Mask@4 (MapType1Store QPMask@3 a_2 array (real_2_U (- (U_2_real (MapType1Select QPMask@3 a_2 array)) wildcard@6))))) (and (IdenticalOnKnownLocations ExhaleHeap@3 ExhaleHeap@4 Mask@4) (state ExhaleHeap@4 Mask@4))) (and (=> (= (ControlFlow 0 143) (- 0 150)) (> (U_2_real (MapType1Select Mask@4 b_2 array)) NoPerm)) (=> (> (U_2_real (MapType1Select Mask@4 b_2 array)) NoPerm) (=> (> wildcard@7 NoPerm) (=> (and (and (< wildcard@7 (U_2_real (MapType1Select Mask@4 b_2 array))) (= Mask@5 (MapType1Store Mask@4 b_2 array (real_2_U (- (U_2_real (MapType1Select Mask@4 b_2 array)) wildcard@7))))) (and (IdenticalOnKnownLocations ExhaleHeap@4 ExhaleHeap@5 Mask@5) (state ExhaleHeap@5 Mask@5))) (and (=> (= (ControlFlow 0 143) (- 0 149)) (>= middle@0 0)) (=> (>= middle@0 0) (and (=> (= (ControlFlow 0 143) (- 0 148)) (HasDirectPerm Mask@5 a_2 array)) (=> (HasDirectPerm Mask@5 a_2 array) (and (=> (= (ControlFlow 0 143) (- 0 147)) (<= end (|Seq#Length| (MapType0Select ExhaleHeap@5 a_2 array)))) (=> (<= end (|Seq#Length| (MapType0Select ExhaleHeap@5 a_2 array))) (and (=> (= (ControlFlow 0 143) (- 0 146)) (HasDirectPerm Mask@5 a_2 array)) (=> (HasDirectPerm Mask@5 a_2 array) (and (=> (= (ControlFlow 0 143) (- 0 145)) (HasDirectPerm Mask@5 b_2 array)) (=> (HasDirectPerm Mask@5 b_2 array) (and (=> (= (ControlFlow 0 143) (- 0 144)) (= (|Seq#Length| (MapType0Select ExhaleHeap@5 a_2 array)) (|Seq#Length| (MapType0Select ExhaleHeap@5 b_2 array)))) (=> (= (|Seq#Length| (MapType0Select ExhaleHeap@5 a_2 array)) (|Seq#Length| (MapType0Select ExhaleHeap@5 b_2 array))) (=> (state ExhaleHeap@5 Mask@5) (and (and (=> (= (ControlFlow 0 143) 140) anon107_Else_correct) (=> (= (ControlFlow 0 143) 67) anon108_Then_correct)) (=> (= (ControlFlow 0 143) 71) anon108_Else_correct)))))))))))))))))))))))))))))))))))))
(let ((anon103_Else_correct  (and (=> (= (ControlFlow 0 156) (- 0 158)) (forall ((i_23 Int) (i_23_1 Int) ) (!  (=> (and (and (and (and (not (= i_23 i_23_1)) (|Seq#Contains| (|Seq#Range| start middle@0) (int_2_U i_23))) (|Seq#Contains| (|Seq#Range| start middle@0) (int_2_U i_23_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| (MapType0Select ExhaleHeap@1 a_2 array) i_23) (|Seq#Index| (MapType0Select ExhaleHeap@1 a_2 array) i_23_1))))
 :qid |stdinbpl.1193:21|
 :skolemid |86|
 :pattern ( (neverTriggered7 i_23) (neverTriggered7 i_23_1))
))) (=> (forall ((i_23@@0 Int) (i_23_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_23@@0 i_23_1@@0)) (|Seq#Contains| (|Seq#Range| start middle@0) (int_2_U i_23@@0))) (|Seq#Contains| (|Seq#Range| start middle@0) (int_2_U i_23_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| (MapType0Select ExhaleHeap@1 a_2 array) i_23@@0) (|Seq#Index| (MapType0Select ExhaleHeap@1 a_2 array) i_23_1@@0))))
 :qid |stdinbpl.1193:21|
 :skolemid |86|
 :pattern ( (neverTriggered7 i_23@@0) (neverTriggered7 i_23_1@@0))
)) (and (=> (= (ControlFlow 0 156) (- 0 157)) (forall ((i_23@@1 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| start middle@0) (int_2_U i_23@@1)) (>= (U_2_real (MapType1Select Mask@3 (|Seq#Index| (MapType0Select ExhaleHeap@1 a_2 array) i_23@@1) value)) FullPerm))
 :qid |stdinbpl.1200:21|
 :skolemid |87|
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@1 a_2 array) i_23@@1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start middle@0) (int_2_U i_23@@1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start middle@0) (int_2_U i_23@@1)))
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@1 a_2 array) i_23@@1))
))) (=> (forall ((i_23@@2 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| start middle@0) (int_2_U i_23@@2)) (>= (U_2_real (MapType1Select Mask@3 (|Seq#Index| (MapType0Select ExhaleHeap@1 a_2 array) i_23@@2) value)) FullPerm))
 :qid |stdinbpl.1200:21|
 :skolemid |87|
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@1 a_2 array) i_23@@2))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start middle@0) (int_2_U i_23@@2)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start middle@0) (int_2_U i_23@@2)))
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@1 a_2 array) i_23@@2))
)) (=> (and (forall ((i_23@@3 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| start middle@0) (int_2_U i_23@@3)) (< NoPerm FullPerm)) (and (qpRange7 (|Seq#Index| (MapType0Select ExhaleHeap@1 a_2 array) i_23@@3)) (= (invRecv7 (|Seq#Index| (MapType0Select ExhaleHeap@1 a_2 array) i_23@@3)) i_23@@3)))
 :qid |stdinbpl.1206:26|
 :skolemid |88|
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@1 a_2 array) i_23@@3))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start middle@0) (int_2_U i_23@@3)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start middle@0) (int_2_U i_23@@3)))
 :pattern ( (|Seq#Index| (MapType0Select ExhaleHeap@1 a_2 array) i_23@@3))
)) (forall ((o_3@@44 T@U) ) (!  (=> (= (type o_3@@44) RefType) (=> (and (|Seq#Contains| (|Seq#Range| start middle@0) (int_2_U (invRecv7 o_3@@44))) (and (< NoPerm FullPerm) (qpRange7 o_3@@44))) (= (|Seq#Index| (MapType0Select ExhaleHeap@1 a_2 array) (invRecv7 o_3@@44)) o_3@@44)))
 :qid |stdinbpl.1210:26|
 :skolemid |89|
 :pattern ( (invRecv7 o_3@@44))
))) (=> (and (and (forall ((o_3@@45 T@U) ) (!  (=> (= (type o_3@@45) RefType) (and (=> (and (|Seq#Contains| (|Seq#Range| start middle@0) (int_2_U (invRecv7 o_3@@45))) (and (< NoPerm FullPerm) (qpRange7 o_3@@45))) (and (= (|Seq#Index| (MapType0Select ExhaleHeap@1 a_2 array) (invRecv7 o_3@@45)) o_3@@45) (= (U_2_real (MapType1Select QPMask@2 o_3@@45 value)) (- (U_2_real (MapType1Select Mask@3 o_3@@45 value)) FullPerm)))) (=> (not (and (|Seq#Contains| (|Seq#Range| start middle@0) (int_2_U (invRecv7 o_3@@45))) (and (< NoPerm FullPerm) (qpRange7 o_3@@45)))) (= (U_2_real (MapType1Select QPMask@2 o_3@@45 value)) (U_2_real (MapType1Select Mask@3 o_3@@45 value))))))
 :qid |stdinbpl.1216:26|
 :skolemid |90|
 :pattern ( (MapType1Select QPMask@2 o_3@@45 value))
)) (forall ((o_3@@46 T@U) (f_5@@14 T@U) ) (! (let ((B@@26 (FieldTypeInv1 (type f_5@@14))))
(let ((A@@27 (FieldTypeInv0 (type f_5@@14))))
 (=> (and (and (= (type o_3@@46) RefType) (= (type f_5@@14) (FieldType A@@27 B@@26))) (not (= f_5@@14 value))) (= (U_2_real (MapType1Select Mask@3 o_3@@46 f_5@@14)) (U_2_real (MapType1Select QPMask@2 o_3@@46 f_5@@14))))))
 :qid |stdinbpl.1222:33|
 :skolemid |91|
 :pattern ( (MapType1Select QPMask@2 o_3@@46 f_5@@14))
))) (and (IdenticalOnKnownLocations ExhaleHeap@1 ExhaleHeap@2 QPMask@2) (state ExhaleHeap@2 QPMask@2))) (and (and (=> (= (ControlFlow 0 156) 143) anon105_Else_correct) (=> (= (ControlFlow 0 156) 61) anon106_Then_correct)) (=> (= (ControlFlow 0 156) 65) anon106_Else_correct))))))))))
(let ((anon102_Then_correct  (=> (> (- end start) 1) (=> (and (= middle@0 (+ start (div (- end start) 2))) (state Heap@@9 QPMask@1)) (and (=> (= (ControlFlow 0 159) (- 0 169)) (HasDirectPerm QPMask@1 a_2 array)) (=> (HasDirectPerm QPMask@1 a_2 array) (=> (and (= t1A@0 (MapType0Select Heap@@9 a_2 array)) (state Heap@@9 QPMask@1)) (and (=> (= (ControlFlow 0 159) (- 0 168)) (HasDirectPerm QPMask@1 b_2 array)) (=> (HasDirectPerm QPMask@1 b_2 array) (=> (and (= t1B@0 (MapType0Select Heap@@9 b_2 array)) (state Heap@@9 QPMask@1)) (and (=> (= (ControlFlow 0 159) (- 0 167)) (> (U_2_real (MapType1Select QPMask@1 a_2 array)) NoPerm)) (=> (> (U_2_real (MapType1Select QPMask@1 a_2 array)) NoPerm) (=> (> wildcard@4 NoPerm) (=> (and (and (< wildcard@4 (U_2_real (MapType1Select QPMask@1 a_2 array))) (= Mask@2 (MapType1Store QPMask@1 a_2 array (real_2_U (- (U_2_real (MapType1Select QPMask@1 a_2 array)) wildcard@4))))) (and (IdenticalOnKnownLocations Heap@@9 ExhaleHeap@0 Mask@2) (state ExhaleHeap@0 Mask@2))) (and (=> (= (ControlFlow 0 159) (- 0 166)) (> (U_2_real (MapType1Select Mask@2 b_2 array)) NoPerm)) (=> (> (U_2_real (MapType1Select Mask@2 b_2 array)) NoPerm) (=> (> wildcard@5 NoPerm) (=> (and (and (< wildcard@5 (U_2_real (MapType1Select Mask@2 b_2 array))) (= Mask@3 (MapType1Store Mask@2 b_2 array (real_2_U (- (U_2_real (MapType1Select Mask@2 b_2 array)) wildcard@5))))) (and (IdenticalOnKnownLocations ExhaleHeap@0 ExhaleHeap@1 Mask@3) (state ExhaleHeap@1 Mask@3))) (and (=> (= (ControlFlow 0 159) (- 0 165)) (>= start 0)) (=> (>= start 0) (and (=> (= (ControlFlow 0 159) (- 0 164)) (HasDirectPerm Mask@3 a_2 array)) (=> (HasDirectPerm Mask@3 a_2 array) (and (=> (= (ControlFlow 0 159) (- 0 163)) (<= middle@0 (|Seq#Length| (MapType0Select ExhaleHeap@1 a_2 array)))) (=> (<= middle@0 (|Seq#Length| (MapType0Select ExhaleHeap@1 a_2 array))) (and (=> (= (ControlFlow 0 159) (- 0 162)) (HasDirectPerm Mask@3 a_2 array)) (=> (HasDirectPerm Mask@3 a_2 array) (and (=> (= (ControlFlow 0 159) (- 0 161)) (HasDirectPerm Mask@3 b_2 array)) (=> (HasDirectPerm Mask@3 b_2 array) (and (=> (= (ControlFlow 0 159) (- 0 160)) (= (|Seq#Length| (MapType0Select ExhaleHeap@1 a_2 array)) (|Seq#Length| (MapType0Select ExhaleHeap@1 b_2 array)))) (=> (= (|Seq#Length| (MapType0Select ExhaleHeap@1 a_2 array)) (|Seq#Length| (MapType0Select ExhaleHeap@1 b_2 array))) (=> (state ExhaleHeap@1 Mask@3) (and (and (=> (= (ControlFlow 0 159) 156) anon103_Else_correct) (=> (= (ControlFlow 0 159) 55) anon104_Then_correct)) (=> (= (ControlFlow 0 159) 59) anon104_Else_correct)))))))))))))))))))))))))))))))))
(let ((anon102_Else_correct  (=> (and (and (>= 1 (- end start)) (= Mask@14 QPMask@1)) (and (= Heap@0 Heap@@9) (= (ControlFlow 0 53) 47))) anon76_correct)))
(let ((anon91_Else_correct  (and (=> (= (ControlFlow 0 214) (- 0 215)) (forall ((i_7 Int) (i_7_1 Int) ) (!  (=> (and (and (and (and (not (= i_7 i_7_1)) (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_7))) (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_7_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| (MapType0Select Heap@@9 b_2 array) i_7) (|Seq#Index| (MapType0Select Heap@@9 b_2 array) i_7_1))))
 :qid |stdinbpl.861:15|
 :skolemid |66|
))) (=> (forall ((i_7@@0 Int) (i_7_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_7@@0 i_7_1@@0)) (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_7@@0))) (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_7_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| (MapType0Select Heap@@9 b_2 array) i_7@@0) (|Seq#Index| (MapType0Select Heap@@9 b_2 array) i_7_1@@0))))
 :qid |stdinbpl.861:15|
 :skolemid |66|
)) (=> (forall ((i_7@@1 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_7@@1)) (< NoPerm FullPerm)) (and (qpRange2 (|Seq#Index| (MapType0Select Heap@@9 b_2 array) i_7@@1)) (= (invRecv2 (|Seq#Index| (MapType0Select Heap@@9 b_2 array) i_7@@1)) i_7@@1)))
 :qid |stdinbpl.867:22|
 :skolemid |67|
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 b_2 array) i_7@@1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U i_7@@1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_7@@1)))
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 b_2 array) i_7@@1))
)) (=> (and (forall ((o_3@@47 T@U) ) (!  (=> (= (type o_3@@47) RefType) (=> (and (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U (invRecv2 o_3@@47))) (< NoPerm FullPerm)) (qpRange2 o_3@@47)) (= (|Seq#Index| (MapType0Select Heap@@9 b_2 array) (invRecv2 o_3@@47)) o_3@@47)))
 :qid |stdinbpl.871:22|
 :skolemid |68|
 :pattern ( (invRecv2 o_3@@47))
)) (forall ((i_7@@2 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_7@@2)) (not (= (|Seq#Index| (MapType0Select Heap@@9 b_2 array) i_7@@2) null)))
 :qid |stdinbpl.877:22|
 :skolemid |69|
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 b_2 array) i_7@@2))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U i_7@@2)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_7@@2)))
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 b_2 array) i_7@@2))
))) (=> (and (and (forall ((o_3@@48 T@U) ) (!  (=> (= (type o_3@@48) RefType) (and (=> (and (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U (invRecv2 o_3@@48))) (< NoPerm FullPerm)) (qpRange2 o_3@@48)) (and (=> (< NoPerm FullPerm) (= (|Seq#Index| (MapType0Select Heap@@9 b_2 array) (invRecv2 o_3@@48)) o_3@@48)) (= (U_2_real (MapType1Select QPMask@1 o_3@@48 value)) (+ (U_2_real (MapType1Select QPMask@0 o_3@@48 value)) FullPerm)))) (=> (not (and (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U (invRecv2 o_3@@48))) (< NoPerm FullPerm)) (qpRange2 o_3@@48))) (= (U_2_real (MapType1Select QPMask@1 o_3@@48 value)) (U_2_real (MapType1Select QPMask@0 o_3@@48 value))))))
 :qid |stdinbpl.883:22|
 :skolemid |70|
 :pattern ( (MapType1Select QPMask@1 o_3@@48 value))
)) (forall ((o_3@@49 T@U) (f_5@@15 T@U) ) (! (let ((B@@27 (FieldTypeInv1 (type f_5@@15))))
(let ((A@@28 (FieldTypeInv0 (type f_5@@15))))
 (=> (and (and (= (type o_3@@49) RefType) (= (type f_5@@15) (FieldType A@@28 B@@27))) (not (= f_5@@15 value))) (= (U_2_real (MapType1Select QPMask@0 o_3@@49 f_5@@15)) (U_2_real (MapType1Select QPMask@1 o_3@@49 f_5@@15))))))
 :qid |stdinbpl.887:29|
 :skolemid |71|
 :pattern ( (MapType1Select QPMask@0 o_3@@49 f_5@@15))
 :pattern ( (MapType1Select QPMask@1 o_3@@49 f_5@@15))
))) (and (state Heap@@9 QPMask@1) (state Heap@@9 QPMask@1))) (and (and (=> (= (ControlFlow 0 214) 210) anon93_Then_correct) (=> (= (ControlFlow 0 214) 159) anon102_Then_correct)) (=> (= (ControlFlow 0 214) 53) anon102_Else_correct)))))))))
(let ((anon15_correct true))
(let ((anon92_Else_correct  (=> (and (not (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_6))) (= (ControlFlow 0 30) 25)) anon15_correct)))
(let ((anon92_Then_correct  (=> (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_6)) (and (=> (= (ControlFlow 0 26) (- 0 29)) (HasDirectPerm QPMask@0 b_2 array)) (=> (HasDirectPerm QPMask@0 b_2 array) (and (=> (= (ControlFlow 0 26) (- 0 28)) (>= i_6 0)) (=> (>= i_6 0) (and (=> (= (ControlFlow 0 26) (- 0 27)) (< i_6 (|Seq#Length| (MapType0Select Heap@@9 b_2 array)))) (=> (< i_6 (|Seq#Length| (MapType0Select Heap@@9 b_2 array))) (=> (= (ControlFlow 0 26) 25) anon15_correct))))))))))
(let ((anon89_Else_correct  (=> (and (forall ((i_5 Int) (j_3 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_5)) (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U j_3)) (not (= i_5 j_3)))) (not (= (|Seq#Index| (MapType0Select Heap@@9 b_2 array) i_5) (|Seq#Index| (MapType0Select Heap@@9 b_2 array) j_3))))
 :qid |stdinbpl.841:20|
 :skolemid |65|
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U i_5)) (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U j_3)))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U i_5)) (|Seq#Contains| (|Seq#Range| start end) (int_2_U j_3)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_5)) (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U j_3)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_5)) (|Seq#Contains| (|Seq#Range| start end) (int_2_U j_3)))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U i_5)) (|Seq#Index| (MapType0Select Heap@@9 b_2 array) j_3))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_5)) (|Seq#Index| (MapType0Select Heap@@9 b_2 array) j_3))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U j_3)) (|Seq#Index| (MapType0Select Heap@@9 b_2 array) i_5))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U j_3)) (|Seq#Index| (MapType0Select Heap@@9 b_2 array) i_5))
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 b_2 array) i_5) (|Seq#Index| (MapType0Select Heap@@9 b_2 array) j_3))
)) (state Heap@@9 QPMask@0)) (and (and (=> (= (ControlFlow 0 216) 214) anon91_Else_correct) (=> (= (ControlFlow 0 216) 26) anon92_Then_correct)) (=> (= (ControlFlow 0 216) 30) anon92_Else_correct)))))
(let ((anon11_correct true))
(let ((anon90_Else_correct  (=> (and (not (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_4)) (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U j_2)) (not (= i_4 j_2))))) (= (ControlFlow 0 24) 16)) anon11_correct)))
(let ((anon90_Then_correct  (=> (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_4)) (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U j_2)) (not (= i_4 j_2)))) (and (=> (= (ControlFlow 0 17) (- 0 23)) (HasDirectPerm QPMask@0 b_2 array)) (=> (HasDirectPerm QPMask@0 b_2 array) (and (=> (= (ControlFlow 0 17) (- 0 22)) (>= i_4 0)) (=> (>= i_4 0) (and (=> (= (ControlFlow 0 17) (- 0 21)) (< i_4 (|Seq#Length| (MapType0Select Heap@@9 b_2 array)))) (=> (< i_4 (|Seq#Length| (MapType0Select Heap@@9 b_2 array))) (and (=> (= (ControlFlow 0 17) (- 0 20)) (HasDirectPerm QPMask@0 b_2 array)) (=> (HasDirectPerm QPMask@0 b_2 array) (and (=> (= (ControlFlow 0 17) (- 0 19)) (>= j_2 0)) (=> (>= j_2 0) (and (=> (= (ControlFlow 0 17) (- 0 18)) (< j_2 (|Seq#Length| (MapType0Select Heap@@9 b_2 array)))) (=> (< j_2 (|Seq#Length| (MapType0Select Heap@@9 b_2 array))) (=> (= (ControlFlow 0 17) 16) anon11_correct))))))))))))))))
(let ((anon87_Else_correct  (and (=> (= (ControlFlow 0 217) (- 0 218)) (forall ((i_3 Int) (i_3_1 Int) ) (!  (=> (and (and (and (and (not (= i_3 i_3_1)) (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_3))) (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_3_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| (MapType0Select Heap@@9 a_2 array) i_3) (|Seq#Index| (MapType0Select Heap@@9 a_2 array) i_3_1))))
 :qid |stdinbpl.789:15|
 :skolemid |59|
))) (=> (forall ((i_3@@0 Int) (i_3_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_3@@0 i_3_1@@0)) (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_3@@0))) (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_3_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (|Seq#Index| (MapType0Select Heap@@9 a_2 array) i_3@@0) (|Seq#Index| (MapType0Select Heap@@9 a_2 array) i_3_1@@0))))
 :qid |stdinbpl.789:15|
 :skolemid |59|
)) (=> (forall ((i_3@@1 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_3@@1)) (< NoPerm FullPerm)) (and (qpRange1 (|Seq#Index| (MapType0Select Heap@@9 a_2 array) i_3@@1)) (= (invRecv1 (|Seq#Index| (MapType0Select Heap@@9 a_2 array) i_3@@1)) i_3@@1)))
 :qid |stdinbpl.795:22|
 :skolemid |60|
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 a_2 array) i_3@@1))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U i_3@@1)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_3@@1)))
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 a_2 array) i_3@@1))
)) (=> (and (forall ((o_3@@50 T@U) ) (!  (=> (= (type o_3@@50) RefType) (=> (and (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U (invRecv1 o_3@@50))) (< NoPerm FullPerm)) (qpRange1 o_3@@50)) (= (|Seq#Index| (MapType0Select Heap@@9 a_2 array) (invRecv1 o_3@@50)) o_3@@50)))
 :qid |stdinbpl.799:22|
 :skolemid |61|
 :pattern ( (invRecv1 o_3@@50))
)) (forall ((i_3@@2 Int) ) (!  (=> (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_3@@2)) (not (= (|Seq#Index| (MapType0Select Heap@@9 a_2 array) i_3@@2) null)))
 :qid |stdinbpl.805:22|
 :skolemid |62|
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 a_2 array) i_3@@2))
 :pattern ( (|Seq#ContainsTrigger| (|Seq#Range| start end) (int_2_U i_3@@2)))
 :pattern ( (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_3@@2)))
 :pattern ( (|Seq#Index| (MapType0Select Heap@@9 a_2 array) i_3@@2))
))) (=> (and (and (forall ((o_3@@51 T@U) ) (!  (=> (= (type o_3@@51) RefType) (and (=> (and (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U (invRecv1 o_3@@51))) (< NoPerm FullPerm)) (qpRange1 o_3@@51)) (and (=> (< NoPerm FullPerm) (= (|Seq#Index| (MapType0Select Heap@@9 a_2 array) (invRecv1 o_3@@51)) o_3@@51)) (= (U_2_real (MapType1Select QPMask@0 o_3@@51 value)) (+ (U_2_real (MapType1Select Mask@1 o_3@@51 value)) FullPerm)))) (=> (not (and (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U (invRecv1 o_3@@51))) (< NoPerm FullPerm)) (qpRange1 o_3@@51))) (= (U_2_real (MapType1Select QPMask@0 o_3@@51 value)) (U_2_real (MapType1Select Mask@1 o_3@@51 value))))))
 :qid |stdinbpl.811:22|
 :skolemid |63|
 :pattern ( (MapType1Select QPMask@0 o_3@@51 value))
)) (forall ((o_3@@52 T@U) (f_5@@16 T@U) ) (! (let ((B@@28 (FieldTypeInv1 (type f_5@@16))))
(let ((A@@29 (FieldTypeInv0 (type f_5@@16))))
 (=> (and (and (= (type o_3@@52) RefType) (= (type f_5@@16) (FieldType A@@29 B@@28))) (not (= f_5@@16 value))) (= (U_2_real (MapType1Select Mask@1 o_3@@52 f_5@@16)) (U_2_real (MapType1Select QPMask@0 o_3@@52 f_5@@16))))))
 :qid |stdinbpl.815:29|
 :skolemid |64|
 :pattern ( (MapType1Select Mask@1 o_3@@52 f_5@@16))
 :pattern ( (MapType1Select QPMask@0 o_3@@52 f_5@@16))
))) (and (state Heap@@9 QPMask@0) (state Heap@@9 QPMask@0))) (and (and (=> (= (ControlFlow 0 217) 216) anon89_Else_correct) (=> (= (ControlFlow 0 217) 17) anon90_Then_correct)) (=> (= (ControlFlow 0 217) 24) anon90_Else_correct)))))))))
(let ((anon7_correct true))
(let ((anon88_Else_correct  (=> (and (not (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_2))) (= (ControlFlow 0 15) 10)) anon7_correct)))
(let ((anon88_Then_correct  (=> (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_2)) (and (=> (= (ControlFlow 0 11) (- 0 14)) (HasDirectPerm Mask@1 a_2 array)) (=> (HasDirectPerm Mask@1 a_2 array) (and (=> (= (ControlFlow 0 11) (- 0 13)) (>= i_2 0)) (=> (>= i_2 0) (and (=> (= (ControlFlow 0 11) (- 0 12)) (< i_2 (|Seq#Length| (MapType0Select Heap@@9 a_2 array)))) (=> (< i_2 (|Seq#Length| (MapType0Select Heap@@9 a_2 array))) (=> (= (ControlFlow 0 11) 10) anon7_correct))))))))))
(let ((anon85_Else_correct  (=> (and (forall ((i_1 Int) (j_1 Int) ) (!  (=> (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U i_1)) (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U j_1)) (not (= i_1 j_1)))) (not (= (|Seq#Index| (MapType0Select Heap@@9 a_2 array) i_1) (|Seq#Index| (MapType0Select Heap@@9 a_2 array) j_1))))
 :qid |stdinbpl.769:20|
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
)) (state Heap@@9 Mask@1)) (and (and (=> (= (ControlFlow 0 219) 217) anon87_Else_correct) (=> (= (ControlFlow 0 219) 11) anon88_Then_correct)) (=> (= (ControlFlow 0 219) 15) anon88_Else_correct)))))
(let ((anon3_correct true))
(let ((anon86_Else_correct  (=> (and (not (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U i@@6)) (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U j@@5)) (not (= i@@6 j@@5))))) (= (ControlFlow 0 9) 1)) anon3_correct)))
(let ((anon86_Then_correct  (=> (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U i@@6)) (and (|Seq#Contains| (|Seq#Range| start end) (int_2_U j@@5)) (not (= i@@6 j@@5)))) (and (=> (= (ControlFlow 0 2) (- 0 8)) (HasDirectPerm Mask@1 a_2 array)) (=> (HasDirectPerm Mask@1 a_2 array) (and (=> (= (ControlFlow 0 2) (- 0 7)) (>= i@@6 0)) (=> (>= i@@6 0) (and (=> (= (ControlFlow 0 2) (- 0 6)) (< i@@6 (|Seq#Length| (MapType0Select Heap@@9 a_2 array)))) (=> (< i@@6 (|Seq#Length| (MapType0Select Heap@@9 a_2 array))) (and (=> (= (ControlFlow 0 2) (- 0 5)) (HasDirectPerm Mask@1 a_2 array)) (=> (HasDirectPerm Mask@1 a_2 array) (and (=> (= (ControlFlow 0 2) (- 0 4)) (>= j@@5 0)) (=> (>= j@@5 0) (and (=> (= (ControlFlow 0 2) (- 0 3)) (< j@@5 (|Seq#Length| (MapType0Select Heap@@9 a_2 array)))) (=> (< j@@5 (|Seq#Length| (MapType0Select Heap@@9 a_2 array))) (=> (= (ControlFlow 0 2) 1) anon3_correct))))))))))))))))
(let ((anon0_correct  (=> (and (state Heap@@9 ZeroMask) (U_2_bool (MapType0Select Heap@@9 a_2 $allocated))) (=> (and (and (U_2_bool (MapType0Select Heap@@9 b_2 $allocated)) (> wildcard@0 NoPerm)) (and (not (= a_2 null)) (= Mask@0 (MapType1Store ZeroMask a_2 array (real_2_U (+ (U_2_real (MapType1Select ZeroMask a_2 array)) wildcard@0)))))) (=> (and (and (and (state Heap@@9 Mask@0) (state Heap@@9 Mask@0)) (and (> wildcard@1 NoPerm) (not (= b_2 null)))) (and (and (= Mask@1 (MapType1Store Mask@0 b_2 array (real_2_U (+ (U_2_real (MapType1Select Mask@0 b_2 array)) wildcard@1)))) (state Heap@@9 Mask@1)) (and (state Heap@@9 Mask@1) (>= start 0)))) (and (=> (= (ControlFlow 0 220) (- 0 223)) (HasDirectPerm Mask@1 a_2 array)) (=> (HasDirectPerm Mask@1 a_2 array) (=> (<= end (|Seq#Length| (MapType0Select Heap@@9 a_2 array))) (and (=> (= (ControlFlow 0 220) (- 0 222)) (HasDirectPerm Mask@1 a_2 array)) (=> (HasDirectPerm Mask@1 a_2 array) (and (=> (= (ControlFlow 0 220) (- 0 221)) (HasDirectPerm Mask@1 b_2 array)) (=> (HasDirectPerm Mask@1 b_2 array) (=> (and (= (|Seq#Length| (MapType0Select Heap@@9 a_2 array)) (|Seq#Length| (MapType0Select Heap@@9 b_2 array))) (state Heap@@9 Mask@1)) (and (and (=> (= (ControlFlow 0 220) 219) anon85_Else_correct) (=> (= (ControlFlow 0 220) 2) anon86_Then_correct)) (=> (= (ControlFlow 0 220) 9) anon86_Else_correct)))))))))))))))
(let ((PreconditionGeneratedEntry_correct  (=> (and (and (> wildcard NoPerm) true) (= (ControlFlow 0 224) 220)) anon0_correct)))
PreconditionGeneratedEntry_correct)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
))
(check-sat)
(pop 1)
; Valid
(get-info :rlimit)
