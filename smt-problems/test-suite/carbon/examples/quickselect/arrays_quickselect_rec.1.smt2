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
(declare-fun val () T@U)
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
(declare-fun |dummy'| (T@U Int) Bool)
(declare-fun dummyFunction (T@U) Bool)
(declare-fun |dummy#triggerStateless| (Int) Bool)
(declare-fun |Seq#Update| (T@U Int T@U) T@U)
(declare-fun |Seq#Take| (T@U Int) T@U)
(declare-fun |Seq#Contains| (T@U T@U) Bool)
(declare-fun |Seq#Range| (Int Int) T@U)
(declare-fun |Seq#Skolem| (T@U T@U) Int)
(declare-fun len (T@U) Int)
(declare-fun IArrayDomainTypeType () T@T)
(declare-fun |Seq#Singleton| (T@U) T@U)
(declare-fun dummy (T@U Int) Bool)
(declare-fun AssumeFunctionsAbove () Int)
(declare-fun |Seq#Empty| (T@T) T@U)
(declare-fun dummyHeap () T@U)
(declare-fun ZeroMask () T@U)
(declare-fun InsidePredicate (T@U T@U T@U T@U) Bool)
(declare-fun |Seq#Append| (T@U T@U) T@U)
(declare-fun sumMask (T@U T@U T@U) Bool)
(declare-fun ConditionalFrame (Real T@U) T@U)
(declare-fun EmptyFrame () T@U)
(declare-fun NoPerm () Real)
(declare-fun loc (T@U Int) T@U)
(declare-fun first (T@U) T@U)
(declare-fun second (T@U) Int)
(declare-fun |Seq#Equal| (T@U T@U) Bool)
(declare-fun |dummy#frame| (T@U Int) Bool)
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
))) (= (Ctor NormalFieldType) 7)) (= (type $allocated) (FieldType NormalFieldType boolType))) (= (type val) (FieldType NormalFieldType intType))))
(assert (distinct $allocated val)
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
 :qid |stdinbpl.352:18|
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
))) (forall ((m T@U) (x0 T@U) (x1 T@U) (val@@0 T@U) ) (! (let ((B@@0 (FieldTypeInv1 (type x1))))
 (=> (= (type val@@0) B@@0) (= (MapType0Select (MapType0Store m x0 x1 val@@0) x0 x1) val@@0)))
 :qid |mapAx0:MapType0Select|
 :weight 0
))) (and (and (forall ((val@@1 T@U) (m@@0 T@U) (x0@@0 T@U) (x1@@0 T@U) (y0 T@U) (y1 T@U) ) (!  (or (= x0@@0 y0) (= (MapType0Select (MapType0Store m@@0 x0@@0 x1@@0 val@@1) y0 y1) (MapType0Select m@@0 y0 y1)))
 :qid |mapAx1:MapType0Select:0|
 :weight 0
)) (forall ((val@@2 T@U) (m@@1 T@U) (x0@@1 T@U) (x1@@1 T@U) (y0@@0 T@U) (y1@@0 T@U) ) (!  (or (= x1@@1 y1@@0) (= (MapType0Select (MapType0Store m@@1 x0@@1 x1@@1 val@@2) y0@@0 y1@@0) (MapType0Select m@@1 y0@@0 y1@@0)))
 :qid |mapAx1:MapType0Select:1|
 :weight 0
))) (forall ((val@@3 T@U) (m@@2 T@U) (x0@@2 T@U) (x1@@2 T@U) (y0@@1 T@U) (y1@@1 T@U) ) (!  (or true (= (MapType0Select (MapType0Store m@@2 x0@@2 x1@@2 val@@3) y0@@1 y1@@1) (MapType0Select m@@2 y0@@1 y1@@1)))
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
))) (forall ((m@@3 T@U) (x0@@3 T@U) (x1@@3 T@U) (val@@4 T@U) ) (! (let ((aVar1@@1 (MapType1TypeInv1 (type m@@3))))
 (=> (= (type val@@4) aVar1@@1) (= (MapType1Select (MapType1Store m@@3 x0@@3 x1@@3 val@@4) x0@@3 x1@@3) val@@4)))
 :qid |mapAx0:MapType1Select|
 :weight 0
))) (and (and (forall ((val@@5 T@U) (m@@4 T@U) (x0@@4 T@U) (x1@@4 T@U) (y0@@2 T@U) (y1@@2 T@U) ) (!  (or (= x0@@4 y0@@2) (= (MapType1Select (MapType1Store m@@4 x0@@4 x1@@4 val@@5) y0@@2 y1@@2) (MapType1Select m@@4 y0@@2 y1@@2)))
 :qid |mapAx1:MapType1Select:0|
 :weight 0
)) (forall ((val@@6 T@U) (m@@5 T@U) (x0@@5 T@U) (x1@@5 T@U) (y0@@3 T@U) (y1@@3 T@U) ) (!  (or (= x1@@5 y1@@3) (= (MapType1Select (MapType1Store m@@5 x0@@5 x1@@5 val@@6) y0@@3 y1@@3) (MapType1Select m@@5 y0@@3 y1@@3)))
 :qid |mapAx1:MapType1Select:1|
 :weight 0
))) (forall ((val@@7 T@U) (m@@6 T@U) (x0@@6 T@U) (x1@@6 T@U) (y0@@4 T@U) (y1@@4 T@U) ) (!  (or true (= (MapType1Select (MapType1Store m@@6 x0@@6 x1@@6 val@@7) y0@@4 y1@@4) (MapType1Select m@@6 y0@@4 y1@@4)))
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
 :qid |stdinbpl.373:18|
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
(assert (forall ((Heap@@2 T@U) (i_2 Int) ) (!  (=> (= (type Heap@@2) (MapType0Type RefType)) (dummyFunction (bool_2_U (|dummy#triggerStateless| i_2))))
 :qid |stdinbpl.668:15|
 :skolemid |61|
 :pattern ( (|dummy'| Heap@@2 i_2))
)))
(assert (forall ((arg0@@29 T@U) (arg1@@11 Int) (arg2@@3 T@U) ) (! (let ((T@@3 (type arg2@@3)))
(= (type (|Seq#Update| arg0@@29 arg1@@11 arg2@@3)) (SeqType T@@3)))
 :qid |funType:Seq#Update|
 :pattern ( (|Seq#Update| arg0@@29 arg1@@11 arg2@@3))
)))
(assert (forall ((s@@1 T@U) (i Int) (v T@U) (n@@1 Int) ) (! (let ((T@@4 (type v)))
 (=> (= (type s@@1) (SeqType T@@4)) (=> (and (<= 0 n@@1) (< n@@1 (|Seq#Length| s@@1))) (and (=> (= i n@@1) (= (|Seq#Index| (|Seq#Update| s@@1 i v) n@@1) v)) (=> (not (= i n@@1)) (= (|Seq#Index| (|Seq#Update| s@@1 i v) n@@1) (|Seq#Index| s@@1 n@@1)))))))
 :qid |stdinbpl.328:18|
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
 :qid |stdinbpl.339:18|
 :skolemid |36|
 :pattern ( (|Seq#Length| (|Seq#Take| s@@2 n@@2)))
 :pattern ( (|Seq#Take| s@@2 n@@2) (|Seq#Length| s@@2))
)))
(assert (forall ((arg0@@31 Int) (arg1@@13 Int) ) (! (= (type (|Seq#Range| arg0@@31 arg1@@13)) (SeqType intType))
 :qid |funType:Seq#Range|
 :pattern ( (|Seq#Range| arg0@@31 arg1@@13))
)))
(assert (forall ((q@min Int) (q@max Int) (v@@0 T@U) ) (!  (=> (= (type v@@0) intType) (= (|Seq#Contains| (|Seq#Range| q@min q@max) v@@0)  (and (<= q@min (U_2_int v@@0)) (< (U_2_int v@@0) q@max))))
 :qid |stdinbpl.612:15|
 :skolemid |57|
 :pattern ( (|Seq#Contains| (|Seq#Range| q@min q@max) v@@0))
)))
(assert (forall ((s@@3 T@U) (x@@8 T@U) ) (! (let ((T@@7 (type x@@8)))
 (=> (and (= (type s@@3) (SeqType T@@7)) (|Seq#Contains| s@@3 x@@8)) (and (and (<= 0 (|Seq#Skolem| s@@3 x@@8)) (< (|Seq#Skolem| s@@3 x@@8) (|Seq#Length| s@@3))) (= (|Seq#Index| s@@3 (|Seq#Skolem| s@@3 x@@8)) x@@8))))
 :qid |stdinbpl.470:18|
 :skolemid |47|
 :pattern ( (|Seq#Contains| s@@3 x@@8))
)))
(assert (forall ((Heap@@3 T@U) (ExhaleHeap@@1 T@U) (Mask@@2 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@3) (MapType0Type RefType)) (= (type ExhaleHeap@@1) (MapType0Type RefType))) (= (type Mask@@2) (MapType1Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@3 ExhaleHeap@@1 Mask@@2)) (U_2_bool (MapType0Select Heap@@3 o_1 $allocated))) (U_2_bool (MapType0Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.73:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@3 ExhaleHeap@@1 Mask@@2) (MapType0Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert (forall ((s@@4 T@U) (n@@3 Int) ) (! (let ((T@@8 (SeqTypeInv0 (type s@@4))))
 (=> (and (= (type s@@4) (SeqType T@@8)) (<= n@@3 0)) (= (|Seq#Drop| s@@4 n@@3) s@@4)))
 :qid |stdinbpl.454:18|
 :skolemid |45|
 :pattern ( (|Seq#Drop| s@@4 n@@3))
)))
(assert (forall ((i@@0 Int) (j@@0 Int) ) (! (= (|Seq#Sub| i@@0 j@@0) (- i@@0 j@@0))
 :qid |stdinbpl.308:15|
 :skolemid |30|
 :pattern ( (|Seq#Sub| i@@0 j@@0))
)))
(assert (forall ((i@@1 Int) (j@@1 Int) ) (! (= (|Seq#Add| i@@1 j@@1) (+ i@@1 j@@1))
 :qid |stdinbpl.306:15|
 :skolemid |29|
 :pattern ( (|Seq#Add| i@@1 j@@1))
)))
(assert (= (Ctor IArrayDomainTypeType) 13))
(assert (forall ((a_3 T@U) ) (!  (=> (= (type a_3) IArrayDomainTypeType) (>= (len a_3) 0))
 :qid |stdinbpl.644:15|
 :skolemid |59|
 :pattern ( (len a_3))
)))
(assert (forall ((arg0@@32 T@U) ) (! (let ((T@@9 (type arg0@@32)))
(= (type (|Seq#Singleton| arg0@@32)) (SeqType T@@9)))
 :qid |funType:Seq#Singleton|
 :pattern ( (|Seq#Singleton| arg0@@32))
)))
(assert (forall ((x@@9 T@U) (y@@1 T@U) ) (! (let ((T@@10 (type x@@9)))
 (=> (= (type y@@1) T@@10) (= (|Seq#Contains| (|Seq#Singleton| x@@9) y@@1) (= x@@9 y@@1))))
 :qid |stdinbpl.595:18|
 :skolemid |54|
 :pattern ( (|Seq#Contains| (|Seq#Singleton| x@@9) y@@1))
)))
(assert (forall ((Heap@@4 T@U) (Mask@@3 T@U) (i_2@@0 Int) ) (!  (=> (and (and (= (type Heap@@4) (MapType0Type RefType)) (= (type Mask@@3) (MapType1Type RefType realType))) (and (state Heap@@4 Mask@@3) (< AssumeFunctionsAbove 0))) (dummy Heap@@4 i_2@@0))
 :qid |stdinbpl.674:15|
 :skolemid |62|
 :pattern ( (state Heap@@4 Mask@@3) (dummy Heap@@4 i_2@@0))
)))
(assert (forall ((s@@5 T@U) (n@@4 Int) (j@@2 Int) ) (! (let ((T@@11 (SeqTypeInv0 (type s@@5))))
 (=> (= (type s@@5) (SeqType T@@11)) (=> (and (and (<= 0 j@@2) (< j@@2 n@@4)) (< j@@2 (|Seq#Length| s@@5))) (= (|Seq#Index| (|Seq#Take| s@@5 n@@4) j@@2) (|Seq#Index| s@@5 j@@2)))))
 :qid |stdinbpl.347:18|
 :skolemid |37|
 :pattern ( (|Seq#Index| (|Seq#Take| s@@5 n@@4) j@@2))
 :pattern ( (|Seq#Index| s@@5 j@@2) (|Seq#Take| s@@5 n@@4))
)))
(assert (forall ((Heap@@5 T@U) (ExhaleHeap@@2 T@U) (Mask@@4 T@U) (o_1@@0 T@U) (f_2 T@U) ) (! (let ((B@@1 (FieldTypeInv1 (type f_2))))
(let ((A@@1 (FieldTypeInv0 (type f_2))))
 (=> (and (and (and (and (and (and (= (type Heap@@5) (MapType0Type RefType)) (= (type ExhaleHeap@@2) (MapType0Type RefType))) (= (type Mask@@4) (MapType1Type RefType realType))) (= (type o_1@@0) RefType)) (= (type f_2) (FieldType A@@1 B@@1))) (IdenticalOnKnownLocations Heap@@5 ExhaleHeap@@2 Mask@@4)) (HasDirectPerm Mask@@4 o_1@@0 f_2)) (= (MapType0Select Heap@@5 o_1@@0 f_2) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2)))))
 :qid |stdinbpl.42:22|
 :skolemid |1|
 :pattern ( (IdenticalOnKnownLocations Heap@@5 ExhaleHeap@@2 Mask@@4) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2))
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
 :qid |stdinbpl.251:19|
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
 :qid |stdinbpl.319:18|
 :skolemid |32|
 :pattern ( (|Seq#Index| (|Seq#Append| s0 s1) n@@5))
)))
(assert  (not (IsPredicateField val)))
(assert  (not (IsWandField val)))
(assert (forall ((Heap@@6 T@U) (ExhaleHeap@@3 T@U) (Mask@@5 T@U) ) (!  (=> (and (and (and (= (type Heap@@6) (MapType0Type RefType)) (= (type ExhaleHeap@@3) (MapType0Type RefType))) (= (type Mask@@5) (MapType1Type RefType realType))) (IdenticalOnKnownLocations Heap@@6 ExhaleHeap@@3 Mask@@5)) (succHeap Heap@@6 ExhaleHeap@@3))
 :qid |stdinbpl.83:15|
 :skolemid |10|
 :pattern ( (IdenticalOnKnownLocations Heap@@6 ExhaleHeap@@3 Mask@@5))
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
 :qid |stdinbpl.239:15|
 :skolemid |19|
 :pattern ( (ConditionalFrame p@@0 f_6))
)))
(assert (forall ((q@min@@0 Int) (q@max@@0 Int) (j@@3 Int) ) (!  (=> (and (<= 0 j@@3) (< j@@3 (- q@max@@0 q@min@@0))) (= (U_2_int (|Seq#Index| (|Seq#Range| q@min@@0 q@max@@0) j@@3)) (+ q@min@@0 j@@3)))
 :qid |stdinbpl.610:15|
 :skolemid |56|
 :pattern ( (|Seq#Index| (|Seq#Range| q@min@@0 q@max@@0) j@@3))
)))
(assert (forall ((Mask@@6 T@U) (o_2@@0 T@U) (f_4@@0 T@U) ) (! (let ((B@@3 (FieldTypeInv1 (type f_4@@0))))
(let ((A@@4 (FieldTypeInv0 (type f_4@@0))))
 (=> (and (and (= (type Mask@@6) (MapType1Type RefType realType)) (= (type o_2@@0) RefType)) (= (type f_4@@0) (FieldType A@@4 B@@3))) (= (HasDirectPerm Mask@@6 o_2@@0 f_4@@0) (> (U_2_real (MapType1Select Mask@@6 o_2@@0 f_4@@0)) NoPerm)))))
 :qid |stdinbpl.133:22|
 :skolemid |17|
 :pattern ( (HasDirectPerm Mask@@6 o_2@@0 f_4@@0))
)))
(assert (forall ((s0@@0 T@U) (s1@@0 T@U) ) (! (let ((T@@16 (SeqTypeInv0 (type s0@@0))))
 (=> (and (and (= (type s0@@0) (SeqType T@@16)) (= (type s1@@0) (SeqType T@@16))) (and (not (= s0@@0 (|Seq#Empty| T@@16))) (not (= s1@@0 (|Seq#Empty| T@@16))))) (= (|Seq#Length| (|Seq#Append| s0@@0 s1@@0)) (+ (|Seq#Length| s0@@0) (|Seq#Length| s1@@0)))))
 :qid |stdinbpl.288:18|
 :skolemid |26|
 :pattern ( (|Seq#Length| (|Seq#Append| s0@@0 s1@@0)))
)))
(assert (forall ((s@@6 T@U) (t T@U) (n@@6 Int) ) (! (let ((T@@17 (SeqTypeInv0 (type s@@6))))
 (=> (and (and (= (type s@@6) (SeqType T@@17)) (= (type t) (SeqType T@@17))) (and (> n@@6 0) (> n@@6 (|Seq#Length| s@@6)))) (and (= (|Seq#Add| (|Seq#Sub| n@@6 (|Seq#Length| s@@6)) (|Seq#Length| s@@6)) n@@6) (= (|Seq#Drop| (|Seq#Append| s@@6 t) n@@6) (|Seq#Drop| t (|Seq#Sub| n@@6 (|Seq#Length| s@@6)))))))
 :qid |stdinbpl.444:18|
 :skolemid |44|
 :pattern ( (|Seq#Drop| (|Seq#Append| s@@6 t) n@@6))
)))
(assert  (and (forall ((arg0@@35 T@U) (arg1@@16 Int) ) (! (= (type (loc arg0@@35 arg1@@16)) RefType)
 :qid |funType:loc|
 :pattern ( (loc arg0@@35 arg1@@16))
)) (forall ((arg0@@36 T@U) ) (! (= (type (first arg0@@36)) IArrayDomainTypeType)
 :qid |funType:first|
 :pattern ( (first arg0@@36))
))))
(assert (forall ((a_3@@0 T@U) (i_2@@1 Int) ) (!  (=> (= (type a_3@@0) IArrayDomainTypeType) (and (= (first (loc a_3@@0 i_2@@1)) a_3@@0) (= (second (loc a_3@@0 i_2@@1)) i_2@@1)))
 :qid |stdinbpl.638:15|
 :skolemid |58|
 :pattern ( (loc a_3@@0 i_2@@1))
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
 :qid |stdinbpl.431:18|
 :skolemid |42|
 :pattern ( (|Seq#Take| (|Seq#Append| s@@7 t@@0) n@@7))
)))
(assert (forall ((q@min@@1 Int) (q@max@@1 Int) ) (!  (and (=> (< q@min@@1 q@max@@1) (= (|Seq#Length| (|Seq#Range| q@min@@1 q@max@@1)) (- q@max@@1 q@min@@1))) (=> (<= q@max@@1 q@min@@1) (= (|Seq#Length| (|Seq#Range| q@min@@1 q@max@@1)) 0)))
 :qid |stdinbpl.609:15|
 :skolemid |55|
 :pattern ( (|Seq#Length| (|Seq#Range| q@min@@1 q@max@@1)))
)))
(assert (forall ((a T@U) (b T@U) ) (! (let ((T@@19 (SeqTypeInv0 (type a))))
 (=> (and (and (= (type a) (SeqType T@@19)) (= (type b) (SeqType T@@19))) (|Seq#Equal| a b)) (= a b)))
 :qid |stdinbpl.582:18|
 :skolemid |53|
 :pattern ( (|Seq#Equal| a b))
)))
(assert (forall ((Heap@@7 T@U) (Mask@@7 T@U) (i_2@@2 Int) ) (!  (=> (and (and (= (type Heap@@7) (MapType0Type RefType)) (= (type Mask@@7) (MapType1Type RefType realType))) (state Heap@@7 Mask@@7)) (= (|dummy'| Heap@@7 i_2@@2) (|dummy#frame| EmptyFrame i_2@@2)))
 :qid |stdinbpl.681:15|
 :skolemid |63|
 :pattern ( (state Heap@@7 Mask@@7) (|dummy'| Heap@@7 i_2@@2))
)))
(assert (forall ((s@@8 T@U) (i@@2 Int) ) (! (let ((T@@20 (SeqTypeInv0 (type s@@8))))
 (=> (= (type s@@8) (SeqType T@@20)) (=> (and (<= 0 i@@2) (< i@@2 (|Seq#Length| s@@8))) (|Seq#ContainsTrigger| s@@8 (|Seq#Index| s@@8 i@@2)))))
 :qid |stdinbpl.475:18|
 :skolemid |49|
 :pattern ( (|Seq#Index| s@@8 i@@2))
)))
(assert (forall ((s0@@1 T@U) (s1@@1 T@U) ) (! (let ((T@@21 (SeqTypeInv0 (type s0@@1))))
 (=> (and (= (type s0@@1) (SeqType T@@21)) (= (type s1@@1) (SeqType T@@21))) (and (=> (= s0@@1 (|Seq#Empty| T@@21)) (= (|Seq#Append| s0@@1 s1@@1) s1@@1)) (=> (= s1@@1 (|Seq#Empty| T@@21)) (= (|Seq#Append| s0@@1 s1@@1) s0@@1)))))
 :qid |stdinbpl.294:18|
 :skolemid |27|
 :pattern ( (|Seq#Append| s0@@1 s1@@1))
)))
(assert (forall ((t@@1 T@U) ) (! (= (|Seq#Index| (|Seq#Singleton| t@@1) 0) t@@1)
 :qid |stdinbpl.298:18|
 :skolemid |28|
 :pattern ( (|Seq#Singleton| t@@1))
)))
(assert (forall ((s@@9 T@U) ) (! (let ((T@@22 (SeqTypeInv0 (type s@@9))))
 (=> (= (type s@@9) (SeqType T@@22)) (<= 0 (|Seq#Length| s@@9))))
 :qid |stdinbpl.277:18|
 :skolemid |22|
 :pattern ( (|Seq#Length| s@@9))
)))
(assert (forall ((Heap@@8 T@U) (i_2@@3 Int) ) (!  (=> (= (type Heap@@8) (MapType0Type RefType)) (and (= (dummy Heap@@8 i_2@@3) (|dummy'| Heap@@8 i_2@@3)) (dummyFunction (bool_2_U (|dummy#triggerStateless| i_2@@3)))))
 :qid |stdinbpl.664:15|
 :skolemid |60|
 :pattern ( (dummy Heap@@8 i_2@@3))
)))
(assert (forall ((s0@@2 T@U) (s1@@2 T@U) ) (! (let ((T@@23 (SeqTypeInv0 (type s0@@2))))
 (=> (and (and (= (type s0@@2) (SeqType T@@23)) (= (type s1@@2) (SeqType T@@23))) (|Seq#Equal| s0@@2 s1@@2)) (and (= (|Seq#Length| s0@@2) (|Seq#Length| s1@@2)) (forall ((j@@4 Int) ) (!  (=> (and (<= 0 j@@4) (< j@@4 (|Seq#Length| s0@@2))) (= (|Seq#Index| s0@@2 j@@4) (|Seq#Index| s1@@2 j@@4)))
 :qid |stdinbpl.572:13|
 :skolemid |50|
 :pattern ( (|Seq#Index| s0@@2 j@@4))
 :pattern ( (|Seq#Index| s1@@2 j@@4))
)))))
 :qid |stdinbpl.569:18|
 :skolemid |51|
 :pattern ( (|Seq#Equal| s0@@2 s1@@2))
)))
(assert (forall ((Heap@@9 T@U) (ExhaleHeap@@4 T@U) (Mask@@8 T@U) (pm_f@@1 T@U) ) (! (let ((C@@1 (FieldTypeInv0 (type pm_f@@1))))
 (=> (and (and (and (and (and (= (type Heap@@9) (MapType0Type RefType)) (= (type ExhaleHeap@@4) (MapType0Type RefType))) (= (type Mask@@8) (MapType1Type RefType realType))) (= (type pm_f@@1) (FieldType C@@1 FrameTypeType))) (IdenticalOnKnownLocations Heap@@9 ExhaleHeap@@4 Mask@@8)) (and (HasDirectPerm Mask@@8 null pm_f@@1) (IsPredicateField pm_f@@1))) (forall ((o2 T@U) (f_2@@0 T@U) ) (! (let ((B@@5 (FieldTypeInv1 (type f_2@@0))))
(let ((A@@6 (FieldTypeInv0 (type f_2@@0))))
 (=> (and (and (= (type o2) RefType) (= (type f_2@@0) (FieldType A@@6 B@@5))) (U_2_bool (MapType1Select (MapType0Select Heap@@9 null (PredicateMaskField pm_f@@1)) o2 f_2@@0))) (= (MapType0Select Heap@@9 o2 f_2@@0) (MapType0Select ExhaleHeap@@4 o2 f_2@@0)))))
 :qid |stdinbpl.54:134|
 :skolemid |3|
 :pattern ( (MapType0Select ExhaleHeap@@4 o2 f_2@@0))
))))
 :qid |stdinbpl.52:19|
 :skolemid |4|
 :pattern ( (IdenticalOnKnownLocations Heap@@9 ExhaleHeap@@4 Mask@@8) (IsPredicateField pm_f@@1))
)))
(assert (forall ((Heap@@10 T@U) (ExhaleHeap@@5 T@U) (Mask@@9 T@U) (pm_f@@2 T@U) ) (! (let ((C@@2 (FieldTypeInv0 (type pm_f@@2))))
 (=> (and (and (and (and (and (= (type Heap@@10) (MapType0Type RefType)) (= (type ExhaleHeap@@5) (MapType0Type RefType))) (= (type Mask@@9) (MapType1Type RefType realType))) (= (type pm_f@@2) (FieldType C@@2 FrameTypeType))) (IdenticalOnKnownLocations Heap@@10 ExhaleHeap@@5 Mask@@9)) (and (HasDirectPerm Mask@@9 null pm_f@@2) (IsWandField pm_f@@2))) (forall ((o2@@0 T@U) (f_2@@1 T@U) ) (! (let ((B@@6 (FieldTypeInv1 (type f_2@@1))))
(let ((A@@7 (FieldTypeInv0 (type f_2@@1))))
 (=> (and (and (= (type o2@@0) RefType) (= (type f_2@@1) (FieldType A@@7 B@@6))) (U_2_bool (MapType1Select (MapType0Select Heap@@10 null (WandMaskField pm_f@@2)) o2@@0 f_2@@1))) (= (MapType0Select Heap@@10 o2@@0 f_2@@1) (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1)))))
 :qid |stdinbpl.67:129|
 :skolemid |6|
 :pattern ( (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1))
))))
 :qid |stdinbpl.65:19|
 :skolemid |7|
 :pattern ( (IdenticalOnKnownLocations Heap@@10 ExhaleHeap@@5 Mask@@9) (IsWandField pm_f@@2))
)))
(assert (forall ((t@@2 T@U) ) (! (= (|Seq#Length| (|Seq#Singleton| t@@2)) 1)
 :qid |stdinbpl.285:18|
 :skolemid |25|
 :pattern ( (|Seq#Singleton| t@@2))
)))
(assert (forall ((Mask@@10 T@U) (o_2@@2 T@U) (f_4@@2 T@U) ) (! (let ((B@@7 (FieldTypeInv1 (type f_4@@2))))
(let ((A@@8 (FieldTypeInv0 (type f_4@@2))))
 (=> (and (and (and (= (type Mask@@10) (MapType1Type RefType realType)) (= (type o_2@@2) RefType)) (= (type f_4@@2) (FieldType A@@8 B@@7))) (GoodMask Mask@@10)) (and (>= (U_2_real (MapType1Select Mask@@10 o_2@@2 f_4@@2)) NoPerm) (=> (and (and (GoodMask Mask@@10) (not (IsPredicateField f_4@@2))) (not (IsWandField f_4@@2))) (<= (U_2_real (MapType1Select Mask@@10 o_2@@2 f_4@@2)) FullPerm))))))
 :qid |stdinbpl.128:22|
 :skolemid |16|
 :pattern ( (GoodMask Mask@@10) (MapType1Select Mask@@10 o_2@@2 f_4@@2))
)))
(assert (forall ((o T@U) (f T@U) (Heap@@11 T@U) ) (!  (=> (and (and (and (= (type o) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap@@11) (MapType0Type RefType))) (U_2_bool (MapType0Select Heap@@11 o $allocated))) (U_2_bool (MapType0Select Heap@@11 (MapType0Select Heap@@11 o f) $allocated)))
 :qid |stdinbpl.31:15|
 :skolemid |0|
 :pattern ( (MapType0Select Heap@@11 o f))
)))
(assert (forall ((s@@10 T@U) (t@@3 T@U) (n@@8 Int) ) (! (let ((T@@24 (SeqTypeInv0 (type s@@10))))
 (=> (and (and (= (type s@@10) (SeqType T@@24)) (= (type t@@3) (SeqType T@@24))) (and (< 0 n@@8) (<= n@@8 (|Seq#Length| s@@10)))) (= (|Seq#Take| (|Seq#Append| s@@10 t@@3) n@@8) (|Seq#Take| s@@10 n@@8))))
 :qid |stdinbpl.427:18|
 :skolemid |41|
 :pattern ( (|Seq#Take| (|Seq#Append| s@@10 t@@3) n@@8))
)))
(assert (forall ((s@@11 T@U) (i@@3 Int) (v@@1 T@U) ) (! (let ((T@@25 (type v@@1)))
 (=> (= (type s@@11) (SeqType T@@25)) (=> (and (<= 0 i@@3) (< i@@3 (|Seq#Length| s@@11))) (= (|Seq#Length| (|Seq#Update| s@@11 i@@3 v@@1)) (|Seq#Length| s@@11)))))
 :qid |stdinbpl.326:18|
 :skolemid |34|
 :pattern ( (|Seq#Length| (|Seq#Update| s@@11 i@@3 v@@1)))
 :pattern ( (|Seq#Length| s@@11) (|Seq#Update| s@@11 i@@3 v@@1))
)))
(assert (forall ((s@@12 T@U) (t@@4 T@U) (n@@9 Int) ) (! (let ((T@@26 (SeqTypeInv0 (type s@@12))))
 (=> (and (and (= (type s@@12) (SeqType T@@26)) (= (type t@@4) (SeqType T@@26))) (and (< 0 n@@9) (<= n@@9 (|Seq#Length| s@@12)))) (= (|Seq#Drop| (|Seq#Append| s@@12 t@@4) n@@9) (|Seq#Append| (|Seq#Drop| s@@12 n@@9) t@@4))))
 :qid |stdinbpl.440:18|
 :skolemid |43|
 :pattern ( (|Seq#Drop| (|Seq#Append| s@@12 t@@4) n@@9))
)))
(assert (forall ((s@@13 T@U) (n@@10 Int) (i@@4 Int) ) (! (let ((T@@27 (SeqTypeInv0 (type s@@13))))
 (=> (= (type s@@13) (SeqType T@@27)) (=> (and (and (< 0 n@@10) (<= n@@10 i@@4)) (< i@@4 (|Seq#Length| s@@13))) (and (= (|Seq#Add| (|Seq#Sub| i@@4 n@@10) n@@10) i@@4) (= (|Seq#Index| (|Seq#Drop| s@@13 n@@10) (|Seq#Sub| i@@4 n@@10)) (|Seq#Index| s@@13 i@@4))))))
 :qid |stdinbpl.377:18|
 :skolemid |40|
 :pattern ( (|Seq#Drop| s@@13 n@@10) (|Seq#Index| s@@13 i@@4))
)))
(assert (forall ((s0@@3 T@U) (s1@@3 T@U) (n@@11 Int) ) (! (let ((T@@28 (SeqTypeInv0 (type s0@@3))))
 (=> (and (= (type s0@@3) (SeqType T@@28)) (= (type s1@@3) (SeqType T@@28))) (=> (and (and (and (not (= s0@@3 (|Seq#Empty| T@@28))) (not (= s1@@3 (|Seq#Empty| T@@28)))) (<= 0 n@@11)) (< n@@11 (|Seq#Length| s0@@3))) (= (|Seq#Index| (|Seq#Append| s0@@3 s1@@3) n@@11) (|Seq#Index| s0@@3 n@@11)))))
 :qid |stdinbpl.317:18|
 :skolemid |31|
 :pattern ( (|Seq#Index| (|Seq#Append| s0@@3 s1@@3) n@@11))
 :pattern ( (|Seq#Index| s0@@3 n@@11) (|Seq#Append| s0@@3 s1@@3))
)))
(assert (forall ((Heap@@12 T@U) (o@@0 T@U) (f_3 T@U) (v@@2 T@U) ) (! (let ((B@@8 (type v@@2)))
(let ((A@@9 (FieldTypeInv0 (type f_3))))
 (=> (and (and (= (type Heap@@12) (MapType0Type RefType)) (= (type o@@0) RefType)) (= (type f_3) (FieldType A@@9 B@@8))) (succHeap Heap@@12 (MapType0Store Heap@@12 o@@0 f_3 v@@2)))))
 :qid |stdinbpl.78:22|
 :skolemid |9|
 :pattern ( (MapType0Store Heap@@12 o@@0 f_3 v@@2))
)))
(assert (forall ((s0@@4 T@U) (s1@@4 T@U) (m@@7 Int) ) (! (let ((T@@29 (SeqTypeInv0 (type s0@@4))))
 (=> (and (= (type s0@@4) (SeqType T@@29)) (= (type s1@@4) (SeqType T@@29))) (=> (and (and (and (not (= s0@@4 (|Seq#Empty| T@@29))) (not (= s1@@4 (|Seq#Empty| T@@29)))) (<= 0 m@@7)) (< m@@7 (|Seq#Length| s1@@4))) (and (= (|Seq#Sub| (|Seq#Add| m@@7 (|Seq#Length| s0@@4)) (|Seq#Length| s0@@4)) m@@7) (= (|Seq#Index| (|Seq#Append| s0@@4 s1@@4) (|Seq#Add| m@@7 (|Seq#Length| s0@@4))) (|Seq#Index| s1@@4 m@@7))))))
 :qid |stdinbpl.322:18|
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
 :qid |stdinbpl.473:18|
 :skolemid |48|
 :pattern ( (|Seq#Contains| s@@14 x@@10) (|Seq#Index| s@@14 i@@5))
)))
(assert (forall ((s0@@5 T@U) (s1@@5 T@U) ) (! (let ((T@@31 (SeqTypeInv0 (type s0@@5))))
 (=> (and (= (type s0@@5) (SeqType T@@31)) (= (type s1@@5) (SeqType T@@31))) (or (or (and (= s0@@5 s1@@5) (|Seq#Equal| s0@@5 s1@@5)) (and (and (not (= s0@@5 s1@@5)) (not (|Seq#Equal| s0@@5 s1@@5))) (not (= (|Seq#Length| s0@@5) (|Seq#Length| s1@@5))))) (and (and (and (and (and (and (not (= s0@@5 s1@@5)) (not (|Seq#Equal| s0@@5 s1@@5))) (= (|Seq#Length| s0@@5) (|Seq#Length| s1@@5))) (= (|Seq#SkolemDiff| s0@@5 s1@@5) (|Seq#SkolemDiff| s1@@5 s0@@5))) (<= 0 (|Seq#SkolemDiff| s0@@5 s1@@5))) (< (|Seq#SkolemDiff| s0@@5 s1@@5) (|Seq#Length| s0@@5))) (not (= (|Seq#Index| s0@@5 (|Seq#SkolemDiff| s0@@5 s1@@5)) (|Seq#Index| s1@@5 (|Seq#SkolemDiff| s0@@5 s1@@5))))))))
 :qid |stdinbpl.577:18|
 :skolemid |52|
 :pattern ( (|Seq#Equal| s0@@5 s1@@5))
)))
(assert (forall ((p@@1 T@U) (v_1@@0 T@U) (q T@U) (w@@0 T@U) (r T@U) (u T@U) ) (! (let ((C@@3 (FieldTypeInv0 (type r))))
(let ((B@@10 (FieldTypeInv0 (type q))))
(let ((A@@11 (FieldTypeInv0 (type p@@1))))
 (=> (and (and (and (and (and (and (= (type p@@1) (FieldType A@@11 FrameTypeType)) (= (type v_1@@0) FrameTypeType)) (= (type q) (FieldType B@@10 FrameTypeType))) (= (type w@@0) FrameTypeType)) (= (type r) (FieldType C@@3 FrameTypeType))) (= (type u) FrameTypeType)) (and (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))) (InsidePredicate p@@1 v_1@@0 r u)))))
 :qid |stdinbpl.246:25|
 :skolemid |20|
 :pattern ( (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))
)))
(assert (forall ((s@@15 T@U) ) (! (let ((T@@32 (SeqTypeInv0 (type s@@15))))
 (=> (and (= (type s@@15) (SeqType T@@32)) (= (|Seq#Length| s@@15) 0)) (= s@@15 (|Seq#Empty| T@@32))))
 :qid |stdinbpl.281:18|
 :skolemid |24|
 :pattern ( (|Seq#Length| s@@15))
)))
(assert (forall ((s@@16 T@U) (n@@12 Int) ) (! (let ((T@@33 (SeqTypeInv0 (type s@@16))))
 (=> (and (= (type s@@16) (SeqType T@@33)) (<= n@@12 0)) (= (|Seq#Take| s@@16 n@@12) (|Seq#Empty| T@@33))))
 :qid |stdinbpl.456:18|
 :skolemid |46|
 :pattern ( (|Seq#Take| s@@16 n@@12))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun left () Int)
(declare-fun i_29 () Int)
(declare-fun right () Int)
(declare-fun QPMask@8 () T@U)
(declare-fun a_3@@1 () T@U)
(declare-fun pw () T@U)
(declare-fun QPMask@0 () T@U)
(declare-fun PostHeap@0 () T@U)
(declare-fun i_27 () Int)
(declare-fun j_1 () Int)
(declare-fun i_24 () Int)
(declare-fun storeIndex () Int)
(declare-fun i_22 () Int)
(declare-fun i_20 () Int)
(declare-fun qpRange10 (T@U) Bool)
(declare-fun invRecv10 (T@U) Int)
(declare-fun n@@13 () Int)
(declare-fun pivotIndex@0 () Int)
(declare-fun i_42 () Int)
(declare-fun pwPar@0 () T@U)
(declare-fun i_40 () Int)
(declare-fun pwRec@0 () T@U)
(declare-fun i_23 () Int)
(declare-fun Heap@2 () T@U)
(declare-fun Heap@@13 () T@U)
(declare-fun pw@2 () T@U)
(declare-fun i_21 () Int)
(declare-fun j_2 () Int)
(declare-fun i_19 () Int)
(declare-fun storeIndex@4 () Int)
(declare-fun i_17_1 () Int)
(declare-fun i_15_1 () Int)
(declare-fun Mask@2 () T@U)
(declare-fun neverTriggered11 (Int) Bool)
(declare-fun qpRange11 (T@U) Bool)
(declare-fun invRecv11 (T@U) Int)
(declare-fun QPMask@7 () T@U)
(declare-fun Heap@1 () T@U)
(declare-fun Mask@1 () T@U)
(declare-fun storeIndex@3 () Int)
(declare-fun pw@1 () T@U)
(declare-fun Heap@0 () T@U)
(declare-fun Mask@0 () T@U)
(declare-fun storeIndex@2 () Int)
(declare-fun ExhaleHeap@1 () T@U)
(declare-fun QPMask@4 () T@U)
(declare-fun storeIndex@0 () Int)
(declare-fun arg_right@0 () Int)
(declare-fun neverTriggered14 (Int) Bool)
(declare-fun QPMask@2 () T@U)
(declare-fun qpRange14 (T@U) Bool)
(declare-fun invRecv14 (T@U) Int)
(declare-fun QPMask@3 () T@U)
(declare-fun ExhaleHeap@0 () T@U)
(declare-fun qpRange15 (T@U) Bool)
(declare-fun invRecv15 (T@U) Int)
(declare-fun pwRec@1 () T@U)
(declare-fun ExhaleHeap@2 () T@U)
(declare-fun QPMask@6 () T@U)
(declare-fun storeIndex@1 () Int)
(declare-fun pw@0 () T@U)
(declare-fun i_53 () Int)
(declare-fun i_51 () Int)
(declare-fun arg_left@0 () Int)
(declare-fun neverTriggered16 (Int) Bool)
(declare-fun qpRange16 (T@U) Bool)
(declare-fun invRecv16 (T@U) Int)
(declare-fun QPMask@5 () T@U)
(declare-fun qpRange17 (T@U) Bool)
(declare-fun invRecv17 (T@U) Int)
(declare-fun pivotIndex () Int)
(declare-fun neverTriggered12 (Int) Bool)
(declare-fun qpRange12 (T@U) Bool)
(declare-fun invRecv12 (T@U) Int)
(declare-fun QPMask@1 () T@U)
(declare-fun qpRange13 (T@U) Bool)
(declare-fun invRecv13 (T@U) Int)
(declare-fun qpRange9 (T@U) Bool)
(declare-fun invRecv9 (T@U) Int)
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (= (type pw) (SeqType intType)) (= (type pwPar@0) (SeqType intType))) (= (type pwRec@1) (SeqType intType))) (= (type Heap@2) (MapType0Type RefType))) (= (type a_3@@1) IArrayDomainTypeType)) (= (type pw@2) (SeqType intType))) (= (type Heap@@13) (MapType0Type RefType))) (= (type Mask@2) (MapType1Type RefType realType))) (= (type QPMask@7) (MapType1Type RefType realType))) (= (type QPMask@0) (MapType1Type RefType realType))) (= (type pw@0) (SeqType intType))) (= (type Heap@1) (MapType0Type RefType))) (= (type Mask@1) (MapType1Type RefType realType))) (= (type pw@1) (SeqType intType))) (= (type ExhaleHeap@0) (MapType0Type RefType))) (= (type QPMask@2) (MapType1Type RefType realType))) (= (type Heap@0) (MapType0Type RefType))) (= (type Mask@0) (MapType1Type RefType realType))) (= (type ExhaleHeap@2) (MapType0Type RefType))) (= (type QPMask@6) (MapType1Type RefType realType))) (= (type QPMask@5) (MapType1Type RefType realType))) (= (type pwRec@0) (SeqType intType))) (= (type ExhaleHeap@1) (MapType0Type RefType))) (= (type QPMask@4) (MapType1Type RefType realType))) (= (type QPMask@3) (MapType1Type RefType realType))) (= (type QPMask@1) (MapType1Type RefType realType))) (= (type QPMask@8) (MapType1Type RefType realType))) (= (type PostHeap@0) (MapType0Type RefType))))
(set-info :boogie-vc-id select_rec)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 158) (let ((anon25_correct true))
(let ((anon90_Else_correct  (=> (and (not (and (<= left i_29) (<= i_29 right))) (= (ControlFlow 0 147) 141)) anon25_correct)))
(let ((anon90_Then_correct  (=> (and (<= left i_29) (<= i_29 right)) (and (=> (= (ControlFlow 0 142) (- 0 146)) (HasDirectPerm QPMask@8 (loc a_3@@1 i_29) val)) (=> (HasDirectPerm QPMask@8 (loc a_3@@1 i_29) val) (and (=> (= (ControlFlow 0 142) (- 0 145)) (>= i_29 0)) (=> (>= i_29 0) (and (=> (= (ControlFlow 0 142) (- 0 144)) (< i_29 (|Seq#Length| pw))) (=> (< i_29 (|Seq#Length| pw)) (and (=> (= (ControlFlow 0 142) (- 0 143)) (HasDirectPerm QPMask@0 (loc a_3@@1 (U_2_int (|Seq#Index| pw i_29))) val)) (=> (HasDirectPerm QPMask@0 (loc a_3@@1 (U_2_int (|Seq#Index| pw i_29))) val) (=> (= (ControlFlow 0 142) 141) anon25_correct))))))))))))
(let ((anon89_Else_correct true))
(let ((anon87_Else_correct  (=> (and (forall ((i_11_1 Int) (j_1_1 Int) ) (!  (=> (and (<= left i_11_1) (and (< i_11_1 j_1_1) (<= j_1_1 right))) (not (= (U_2_int (|Seq#Index| pw i_11_1)) (U_2_int (|Seq#Index| pw j_1_1)))))
 :qid |stdinbpl.2208:20|
 :skolemid |162|
 :pattern ( (|Seq#Index| pw i_11_1) (|Seq#Index| pw j_1_1))
)) (state PostHeap@0 QPMask@8)) (and (and (=> (= (ControlFlow 0 148) 140) anon89_Else_correct) (=> (= (ControlFlow 0 148) 142) anon90_Then_correct)) (=> (= (ControlFlow 0 148) 147) anon90_Else_correct)))))
(let ((anon21_correct true))
(let ((anon88_Else_correct  (=> (and (not (and (<= left i_27) (and (< i_27 j_1) (<= j_1 right)))) (= (ControlFlow 0 139) 133)) anon21_correct)))
(let ((anon88_Then_correct  (=> (and (<= left i_27) (and (< i_27 j_1) (<= j_1 right))) (and (=> (= (ControlFlow 0 134) (- 0 138)) (>= i_27 0)) (=> (>= i_27 0) (and (=> (= (ControlFlow 0 134) (- 0 137)) (< i_27 (|Seq#Length| pw))) (=> (< i_27 (|Seq#Length| pw)) (and (=> (= (ControlFlow 0 134) (- 0 136)) (>= j_1 0)) (=> (>= j_1 0) (and (=> (= (ControlFlow 0 134) (- 0 135)) (< j_1 (|Seq#Length| pw))) (=> (< j_1 (|Seq#Length| pw)) (=> (= (ControlFlow 0 134) 133) anon21_correct))))))))))))
(let ((anon84_Else_correct  (=> (and (forall ((i_9_1 Int) ) (!  (=> (and (<= left i_9_1) (<= i_9_1 right)) (and (<= left (U_2_int (|Seq#Index| pw i_9_1))) (<= (U_2_int (|Seq#Index| pw i_9_1)) right)))
 :qid |stdinbpl.2188:20|
 :skolemid |161|
 :pattern ( (|Seq#Index| pw i_9_1))
)) (state PostHeap@0 QPMask@8)) (and (and (=> (= (ControlFlow 0 149) 148) anon87_Else_correct) (=> (= (ControlFlow 0 149) 134) anon88_Then_correct)) (=> (= (ControlFlow 0 149) 139) anon88_Else_correct)))))
(let ((anon17_correct true))
(let ((anon86_Else_correct  (=> (and (< (U_2_int (|Seq#Index| pw i_24)) left) (= (ControlFlow 0 129) 124)) anon17_correct)))
(let ((anon86_Then_correct  (=> (<= left (U_2_int (|Seq#Index| pw i_24))) (and (=> (= (ControlFlow 0 126) (- 0 128)) (>= i_24 0)) (=> (>= i_24 0) (and (=> (= (ControlFlow 0 126) (- 0 127)) (< i_24 (|Seq#Length| pw))) (=> (< i_24 (|Seq#Length| pw)) (=> (= (ControlFlow 0 126) 124) anon17_correct))))))))
(let ((anon85_Then_correct  (=> (and (<= left i_24) (<= i_24 right)) (and (=> (= (ControlFlow 0 130) (- 0 132)) (>= i_24 0)) (=> (>= i_24 0) (and (=> (= (ControlFlow 0 130) (- 0 131)) (< i_24 (|Seq#Length| pw))) (=> (< i_24 (|Seq#Length| pw)) (and (=> (= (ControlFlow 0 130) 126) anon86_Then_correct) (=> (= (ControlFlow 0 130) 129) anon86_Else_correct)))))))))
(let ((anon85_Else_correct  (=> (and (not (and (<= left i_24) (<= i_24 right))) (= (ControlFlow 0 125) 124)) anon17_correct)))
(let ((anon82_Else_correct  (=> (and (and (forall ((i_7 Int) ) (!  (=> (and (< storeIndex i_7) (<= i_7 right)) (<= (U_2_int (MapType0Select PostHeap@0 (loc a_3@@1 storeIndex) val)) (U_2_int (MapType0Select PostHeap@0 (loc a_3@@1 i_7) val))))
 :qid |stdinbpl.2164:20|
 :skolemid |160|
 :pattern ( (loc a_3@@1 i_7))
)) (state PostHeap@0 QPMask@8)) (and (= (|Seq#Length| pw) (+ right 1)) (state PostHeap@0 QPMask@8))) (and (and (=> (= (ControlFlow 0 150) 149) anon84_Else_correct) (=> (= (ControlFlow 0 150) 130) anon85_Then_correct)) (=> (= (ControlFlow 0 150) 125) anon85_Else_correct)))))
(let ((anon12_correct true))
(let ((anon83_Else_correct  (=> (and (not (and (< storeIndex i_22) (<= i_22 right))) (= (ControlFlow 0 123) 119)) anon12_correct)))
(let ((anon83_Then_correct  (=> (and (< storeIndex i_22) (<= i_22 right)) (and (=> (= (ControlFlow 0 120) (- 0 122)) (HasDirectPerm QPMask@8 (loc a_3@@1 storeIndex) val)) (=> (HasDirectPerm QPMask@8 (loc a_3@@1 storeIndex) val) (and (=> (= (ControlFlow 0 120) (- 0 121)) (HasDirectPerm QPMask@8 (loc a_3@@1 i_22) val)) (=> (HasDirectPerm QPMask@8 (loc a_3@@1 i_22) val) (=> (= (ControlFlow 0 120) 119) anon12_correct))))))))
(let ((anon80_Else_correct  (=> (and (forall ((i_5 Int) ) (!  (=> (and (<= left i_5) (< i_5 storeIndex)) (<= (U_2_int (MapType0Select PostHeap@0 (loc a_3@@1 i_5) val)) (U_2_int (MapType0Select PostHeap@0 (loc a_3@@1 storeIndex) val))))
 :qid |stdinbpl.2148:20|
 :skolemid |159|
 :pattern ( (loc a_3@@1 i_5))
)) (state PostHeap@0 QPMask@8)) (and (and (=> (= (ControlFlow 0 151) 150) anon82_Else_correct) (=> (= (ControlFlow 0 151) 120) anon83_Then_correct)) (=> (= (ControlFlow 0 151) 123) anon83_Else_correct)))))
(let ((anon8_correct true))
(let ((anon81_Else_correct  (=> (and (not (and (<= left i_20) (< i_20 storeIndex))) (= (ControlFlow 0 118) 114)) anon8_correct)))
(let ((anon81_Then_correct  (=> (and (<= left i_20) (< i_20 storeIndex)) (and (=> (= (ControlFlow 0 115) (- 0 117)) (HasDirectPerm QPMask@8 (loc a_3@@1 i_20) val)) (=> (HasDirectPerm QPMask@8 (loc a_3@@1 i_20) val) (and (=> (= (ControlFlow 0 115) (- 0 116)) (HasDirectPerm QPMask@8 (loc a_3@@1 storeIndex) val)) (=> (HasDirectPerm QPMask@8 (loc a_3@@1 storeIndex) val) (=> (= (ControlFlow 0 115) 114) anon8_correct))))))))
(let ((anon79_Else_correct  (and (=> (= (ControlFlow 0 152) (- 0 153)) (forall ((i_3 Int) (i_3_1 Int) ) (!  (=> (and (and (and (and (not (= i_3 i_3_1)) (and (<= left i_3) (<= i_3 right))) (and (<= left i_3_1) (<= i_3_1 right))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (loc a_3@@1 i_3) (loc a_3@@1 i_3_1))))
 :qid |stdinbpl.2102:15|
 :skolemid |153|
))) (=> (forall ((i_3@@0 Int) (i_3_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_3@@0 i_3_1@@0)) (and (<= left i_3@@0) (<= i_3@@0 right))) (and (<= left i_3_1@@0) (<= i_3_1@@0 right))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (loc a_3@@1 i_3@@0) (loc a_3@@1 i_3_1@@0))))
 :qid |stdinbpl.2102:15|
 :skolemid |153|
)) (=> (forall ((i_3@@1 Int) ) (!  (=> (and (and (<= left i_3@@1) (<= i_3@@1 right)) (< NoPerm FullPerm)) (and (qpRange10 (loc a_3@@1 i_3@@1)) (= (invRecv10 (loc a_3@@1 i_3@@1)) i_3@@1)))
 :qid |stdinbpl.2108:22|
 :skolemid |154|
 :pattern ( (loc a_3@@1 i_3@@1))
 :pattern ( (loc a_3@@1 i_3@@1))
)) (=> (and (and (and (forall ((o_3 T@U) ) (!  (=> (= (type o_3) RefType) (=> (and (and (and (<= left (invRecv10 o_3)) (<= (invRecv10 o_3) right)) (< NoPerm FullPerm)) (qpRange10 o_3)) (= (loc a_3@@1 (invRecv10 o_3)) o_3)))
 :qid |stdinbpl.2112:22|
 :skolemid |155|
 :pattern ( (invRecv10 o_3))
)) (forall ((i_3@@2 Int) ) (!  (=> (and (<= left i_3@@2) (<= i_3@@2 right)) (not (= (loc a_3@@1 i_3@@2) null)))
 :qid |stdinbpl.2118:22|
 :skolemid |156|
 :pattern ( (loc a_3@@1 i_3@@2))
 :pattern ( (loc a_3@@1 i_3@@2))
))) (and (forall ((o_3@@0 T@U) ) (!  (=> (= (type o_3@@0) RefType) (and (=> (and (and (and (<= left (invRecv10 o_3@@0)) (<= (invRecv10 o_3@@0) right)) (< NoPerm FullPerm)) (qpRange10 o_3@@0)) (and (=> (< NoPerm FullPerm) (= (loc a_3@@1 (invRecv10 o_3@@0)) o_3@@0)) (= (U_2_real (MapType1Select QPMask@8 o_3@@0 val)) (+ (U_2_real (MapType1Select ZeroMask o_3@@0 val)) FullPerm)))) (=> (not (and (and (and (<= left (invRecv10 o_3@@0)) (<= (invRecv10 o_3@@0) right)) (< NoPerm FullPerm)) (qpRange10 o_3@@0))) (= (U_2_real (MapType1Select QPMask@8 o_3@@0 val)) (U_2_real (MapType1Select ZeroMask o_3@@0 val))))))
 :qid |stdinbpl.2124:22|
 :skolemid |157|
 :pattern ( (MapType1Select QPMask@8 o_3@@0 val))
)) (forall ((o_3@@1 T@U) (f_5 T@U) ) (! (let ((B@@11 (FieldTypeInv1 (type f_5))))
(let ((A@@12 (FieldTypeInv0 (type f_5))))
 (=> (and (and (= (type o_3@@1) RefType) (= (type f_5) (FieldType A@@12 B@@11))) (not (= f_5 val))) (= (U_2_real (MapType1Select ZeroMask o_3@@1 f_5)) (U_2_real (MapType1Select QPMask@8 o_3@@1 f_5))))))
 :qid |stdinbpl.2128:29|
 :skolemid |158|
 :pattern ( (MapType1Select ZeroMask o_3@@1 f_5))
 :pattern ( (MapType1Select QPMask@8 o_3@@1 f_5))
)))) (and (and (state PostHeap@0 QPMask@8) (state PostHeap@0 QPMask@8)) (and (= storeIndex n@@13) (state PostHeap@0 QPMask@8)))) (and (and (=> (= (ControlFlow 0 152) 151) anon80_Else_correct) (=> (= (ControlFlow 0 152) 115) anon81_Then_correct)) (=> (= (ControlFlow 0 152) 118) anon81_Else_correct))))))))
(let ((anon79_Then_correct true))
(let ((anon78_Then_correct  (=> (and (and (state PostHeap@0 ZeroMask) (<= left storeIndex)) (and (<= storeIndex right) (state PostHeap@0 ZeroMask))) (and (=> (= (ControlFlow 0 154) 113) anon79_Then_correct) (=> (= (ControlFlow 0 154) 152) anon79_Else_correct)))))
(let ((anon41_correct true))
(let ((anon98_Else_correct  (=> (and (not (and (<= pivotIndex@0 i_42) (<= i_42 right))) (= (ControlFlow 0 88) 82)) anon41_correct)))
(let ((anon98_Then_correct  (=> (and (<= pivotIndex@0 i_42) (<= i_42 right)) (and (=> (= (ControlFlow 0 83) (- 0 87)) (>= i_42 0)) (=> (>= i_42 0) (and (=> (= (ControlFlow 0 83) (- 0 86)) (< i_42 (|Seq#Length| pw))) (=> (< i_42 (|Seq#Length| pw)) (and (=> (= (ControlFlow 0 83) (- 0 85)) (>= i_42 0)) (=> (>= i_42 0) (and (=> (= (ControlFlow 0 83) (- 0 84)) (< i_42 (|Seq#Length| pwPar@0))) (=> (< i_42 (|Seq#Length| pwPar@0)) (=> (= (ControlFlow 0 83) 82) anon41_correct))))))))))))
(let ((anon37_correct true))
(let ((anon96_Else_correct  (=> (and (not (and (<= left i_40) (<= i_40 (- pivotIndex@0 1)))) (= (ControlFlow 0 80) 72)) anon37_correct)))
(let ((anon96_Then_correct  (=> (and (<= left i_40) (<= i_40 (- pivotIndex@0 1))) (and (=> (= (ControlFlow 0 73) (- 0 79)) (>= i_40 0)) (=> (>= i_40 0) (and (=> (= (ControlFlow 0 73) (- 0 78)) (< i_40 (|Seq#Length| pw))) (=> (< i_40 (|Seq#Length| pw)) (and (=> (= (ControlFlow 0 73) (- 0 77)) (>= i_40 0)) (=> (>= i_40 0) (and (=> (= (ControlFlow 0 73) (- 0 76)) (< i_40 (|Seq#Length| pwRec@0))) (=> (< i_40 (|Seq#Length| pwRec@0)) (and (=> (= (ControlFlow 0 73) (- 0 75)) (>= (U_2_int (|Seq#Index| pwRec@0 i_40)) 0)) (=> (>= (U_2_int (|Seq#Index| pwRec@0 i_40)) 0) (and (=> (= (ControlFlow 0 73) (- 0 74)) (< (U_2_int (|Seq#Index| pwRec@0 i_40)) (|Seq#Length| pwPar@0))) (=> (< (U_2_int (|Seq#Index| pwRec@0 i_40)) (|Seq#Length| pwPar@0)) (=> (= (ControlFlow 0 73) 72) anon37_correct))))))))))))))))
(let ((anon94_Then_correct true))
(let ((anon75_correct true))
(let ((anon113_Else_correct  (=> (and (not (and (<= left i_23) (<= i_23 right))) (= (ControlFlow 0 40) 37)) anon75_correct)))
(let ((anon113_Then_correct  (=> (and (<= left i_23) (<= i_23 right)) (and (=> (= (ControlFlow 0 38) (- 0 39)) (= (U_2_int (MapType0Select Heap@2 (loc a_3@@1 i_23) val)) (U_2_int (MapType0Select Heap@@13 (loc a_3@@1 (U_2_int (|Seq#Index| pw@2 i_23))) val)))) (=> (= (U_2_int (MapType0Select Heap@2 (loc a_3@@1 i_23) val)) (U_2_int (MapType0Select Heap@@13 (loc a_3@@1 (U_2_int (|Seq#Index| pw@2 i_23))) val))) (=> (= (ControlFlow 0 38) 37) anon75_correct))))))
(let ((anon112_Else_correct true))
(let ((anon110_Else_correct  (=> (forall ((i_22_1 Int) (j_3_1 Int) ) (!  (=> (and (<= left i_22_1) (and (< i_22_1 j_3_1) (<= j_3_1 right))) (not (= (U_2_int (|Seq#Index| pw@2 i_22_1)) (U_2_int (|Seq#Index| pw@2 j_3_1)))))
 :qid |stdinbpl.2914:20|
 :skolemid |228|
 :pattern ( (|Seq#Index| pw@2 i_22_1) (|Seq#Index| pw@2 j_3_1))
)) (and (and (=> (= (ControlFlow 0 41) 36) anon112_Else_correct) (=> (= (ControlFlow 0 41) 38) anon113_Then_correct)) (=> (= (ControlFlow 0 41) 40) anon113_Else_correct)))))
(let ((anon71_correct true))
(let ((anon111_Else_correct  (=> (and (not (and (<= left i_21) (and (< i_21 j_2) (<= j_2 right)))) (= (ControlFlow 0 35) 32)) anon71_correct)))
(let ((anon111_Then_correct  (=> (and (<= left i_21) (and (< i_21 j_2) (<= j_2 right))) (and (=> (= (ControlFlow 0 33) (- 0 34)) (not (= (U_2_int (|Seq#Index| pw@2 i_21)) (U_2_int (|Seq#Index| pw@2 j_2))))) (=> (not (= (U_2_int (|Seq#Index| pw@2 i_21)) (U_2_int (|Seq#Index| pw@2 j_2)))) (=> (= (ControlFlow 0 33) 32) anon71_correct))))))
(let ((anon108_Else_correct  (=> (forall ((i_20_1 Int) ) (!  (=> (and (<= left i_20_1) (<= i_20_1 right)) (and (<= left (U_2_int (|Seq#Index| pw@2 i_20_1))) (<= (U_2_int (|Seq#Index| pw@2 i_20_1)) right)))
 :qid |stdinbpl.2903:20|
 :skolemid |227|
 :pattern ( (|Seq#Index| pw@2 i_20_1))
)) (and (and (=> (= (ControlFlow 0 42) 41) anon110_Else_correct) (=> (= (ControlFlow 0 42) 33) anon111_Then_correct)) (=> (= (ControlFlow 0 42) 35) anon111_Else_correct)))))
(let ((anon67_correct true))
(let ((anon109_Else_correct  (=> (and (not (and (<= left i_19) (<= i_19 right))) (= (ControlFlow 0 31) 27)) anon67_correct)))
(let ((anon109_Then_correct  (=> (and (<= left i_19) (<= i_19 right)) (and (=> (= (ControlFlow 0 28) (- 0 30)) (<= left (U_2_int (|Seq#Index| pw@2 i_19)))) (=> (<= left (U_2_int (|Seq#Index| pw@2 i_19))) (and (=> (= (ControlFlow 0 28) (- 0 29)) (<= (U_2_int (|Seq#Index| pw@2 i_19)) right)) (=> (<= (U_2_int (|Seq#Index| pw@2 i_19)) right) (=> (= (ControlFlow 0 28) 27) anon67_correct))))))))
(let ((anon106_Else_correct  (=> (forall ((i_18_1 Int) ) (!  (=> (and (< storeIndex@4 i_18_1) (<= i_18_1 right)) (<= (U_2_int (MapType0Select Heap@2 (loc a_3@@1 storeIndex@4) val)) (U_2_int (MapType0Select Heap@2 (loc a_3@@1 i_18_1) val))))
 :qid |stdinbpl.2888:20|
 :skolemid |226|
 :pattern ( (loc a_3@@1 i_18_1))
)) (and (=> (= (ControlFlow 0 43) (- 0 44)) (= (|Seq#Length| pw@2) (+ right 1))) (=> (= (|Seq#Length| pw@2) (+ right 1)) (and (and (=> (= (ControlFlow 0 43) 42) anon108_Else_correct) (=> (= (ControlFlow 0 43) 28) anon109_Then_correct)) (=> (= (ControlFlow 0 43) 31) anon109_Else_correct)))))))
(let ((anon63_correct true))
(let ((anon107_Else_correct  (=> (and (not (and (< storeIndex@4 i_17_1) (<= i_17_1 right))) (= (ControlFlow 0 26) 23)) anon63_correct)))
(let ((anon107_Then_correct  (=> (and (< storeIndex@4 i_17_1) (<= i_17_1 right)) (and (=> (= (ControlFlow 0 24) (- 0 25)) (<= (U_2_int (MapType0Select Heap@2 (loc a_3@@1 storeIndex@4) val)) (U_2_int (MapType0Select Heap@2 (loc a_3@@1 i_17_1) val)))) (=> (<= (U_2_int (MapType0Select Heap@2 (loc a_3@@1 storeIndex@4) val)) (U_2_int (MapType0Select Heap@2 (loc a_3@@1 i_17_1) val))) (=> (= (ControlFlow 0 24) 23) anon63_correct))))))
(let ((anon104_Else_correct  (=> (forall ((i_16_1 Int) ) (!  (=> (and (<= left i_16_1) (< i_16_1 storeIndex@4)) (<= (U_2_int (MapType0Select Heap@2 (loc a_3@@1 i_16_1) val)) (U_2_int (MapType0Select Heap@2 (loc a_3@@1 storeIndex@4) val))))
 :qid |stdinbpl.2877:20|
 :skolemid |225|
 :pattern ( (loc a_3@@1 i_16_1))
)) (and (and (=> (= (ControlFlow 0 45) 43) anon106_Else_correct) (=> (= (ControlFlow 0 45) 24) anon107_Then_correct)) (=> (= (ControlFlow 0 45) 26) anon107_Else_correct)))))
(let ((anon59_correct true))
(let ((anon105_Else_correct  (=> (and (not (and (<= left i_15_1) (< i_15_1 storeIndex@4))) (= (ControlFlow 0 22) 19)) anon59_correct)))
(let ((anon105_Then_correct  (=> (and (<= left i_15_1) (< i_15_1 storeIndex@4)) (and (=> (= (ControlFlow 0 20) (- 0 21)) (<= (U_2_int (MapType0Select Heap@2 (loc a_3@@1 i_15_1) val)) (U_2_int (MapType0Select Heap@2 (loc a_3@@1 storeIndex@4) val)))) (=> (<= (U_2_int (MapType0Select Heap@2 (loc a_3@@1 i_15_1) val)) (U_2_int (MapType0Select Heap@2 (loc a_3@@1 storeIndex@4) val))) (=> (= (ControlFlow 0 20) 19) anon59_correct))))))
(let ((anon56_correct  (=> (state Heap@2 Mask@2) (and (=> (= (ControlFlow 0 46) (- 0 51)) (<= left storeIndex@4)) (=> (<= left storeIndex@4) (and (=> (= (ControlFlow 0 46) (- 0 50)) (<= storeIndex@4 right)) (=> (<= storeIndex@4 right) (and (=> (= (ControlFlow 0 46) (- 0 49)) (forall ((i_14 Int) (i_14_1 Int) ) (!  (=> (and (and (and (and (not (= i_14 i_14_1)) (and (<= left i_14) (<= i_14 right))) (and (<= left i_14_1) (<= i_14_1 right))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (loc a_3@@1 i_14) (loc a_3@@1 i_14_1))))
 :qid |stdinbpl.2834:17|
 :skolemid |219|
 :pattern ( (neverTriggered11 i_14) (neverTriggered11 i_14_1))
))) (=> (forall ((i_14@@0 Int) (i_14_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_14@@0 i_14_1@@0)) (and (<= left i_14@@0) (<= i_14@@0 right))) (and (<= left i_14_1@@0) (<= i_14_1@@0 right))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (loc a_3@@1 i_14@@0) (loc a_3@@1 i_14_1@@0))))
 :qid |stdinbpl.2834:17|
 :skolemid |219|
 :pattern ( (neverTriggered11 i_14@@0) (neverTriggered11 i_14_1@@0))
)) (and (=> (= (ControlFlow 0 46) (- 0 48)) (forall ((i_14@@1 Int) ) (!  (=> (and (<= left i_14@@1) (<= i_14@@1 right)) (>= (U_2_real (MapType1Select Mask@2 (loc a_3@@1 i_14@@1) val)) FullPerm))
 :qid |stdinbpl.2841:17|
 :skolemid |220|
 :pattern ( (loc a_3@@1 i_14@@1))
 :pattern ( (loc a_3@@1 i_14@@1))
))) (=> (forall ((i_14@@2 Int) ) (!  (=> (and (<= left i_14@@2) (<= i_14@@2 right)) (>= (U_2_real (MapType1Select Mask@2 (loc a_3@@1 i_14@@2) val)) FullPerm))
 :qid |stdinbpl.2841:17|
 :skolemid |220|
 :pattern ( (loc a_3@@1 i_14@@2))
 :pattern ( (loc a_3@@1 i_14@@2))
)) (=> (and (and (forall ((i_14@@3 Int) ) (!  (=> (and (and (<= left i_14@@3) (<= i_14@@3 right)) (< NoPerm FullPerm)) (and (qpRange11 (loc a_3@@1 i_14@@3)) (= (invRecv11 (loc a_3@@1 i_14@@3)) i_14@@3)))
 :qid |stdinbpl.2847:22|
 :skolemid |221|
 :pattern ( (loc a_3@@1 i_14@@3))
 :pattern ( (loc a_3@@1 i_14@@3))
)) (forall ((o_3@@2 T@U) ) (!  (=> (= (type o_3@@2) RefType) (=> (and (and (<= left (invRecv11 o_3@@2)) (<= (invRecv11 o_3@@2) right)) (and (< NoPerm FullPerm) (qpRange11 o_3@@2))) (= (loc a_3@@1 (invRecv11 o_3@@2)) o_3@@2)))
 :qid |stdinbpl.2851:22|
 :skolemid |222|
 :pattern ( (invRecv11 o_3@@2))
))) (and (forall ((o_3@@3 T@U) ) (!  (=> (= (type o_3@@3) RefType) (and (=> (and (and (<= left (invRecv11 o_3@@3)) (<= (invRecv11 o_3@@3) right)) (and (< NoPerm FullPerm) (qpRange11 o_3@@3))) (and (= (loc a_3@@1 (invRecv11 o_3@@3)) o_3@@3) (= (U_2_real (MapType1Select QPMask@7 o_3@@3 val)) (- (U_2_real (MapType1Select Mask@2 o_3@@3 val)) FullPerm)))) (=> (not (and (and (<= left (invRecv11 o_3@@3)) (<= (invRecv11 o_3@@3) right)) (and (< NoPerm FullPerm) (qpRange11 o_3@@3)))) (= (U_2_real (MapType1Select QPMask@7 o_3@@3 val)) (U_2_real (MapType1Select Mask@2 o_3@@3 val))))))
 :qid |stdinbpl.2857:22|
 :skolemid |223|
 :pattern ( (MapType1Select QPMask@7 o_3@@3 val))
)) (forall ((o_3@@4 T@U) (f_5@@0 T@U) ) (! (let ((B@@12 (FieldTypeInv1 (type f_5@@0))))
(let ((A@@13 (FieldTypeInv0 (type f_5@@0))))
 (=> (and (and (= (type o_3@@4) RefType) (= (type f_5@@0) (FieldType A@@13 B@@12))) (not (= f_5@@0 val))) (= (U_2_real (MapType1Select Mask@2 o_3@@4 f_5@@0)) (U_2_real (MapType1Select QPMask@7 o_3@@4 f_5@@0))))))
 :qid |stdinbpl.2863:29|
 :skolemid |224|
 :pattern ( (MapType1Select QPMask@7 o_3@@4 f_5@@0))
)))) (and (=> (= (ControlFlow 0 46) (- 0 47)) (= storeIndex@4 n@@13)) (=> (= storeIndex@4 n@@13) (and (and (=> (= (ControlFlow 0 46) 45) anon104_Else_correct) (=> (= (ControlFlow 0 46) 20) anon105_Then_correct)) (=> (= (ControlFlow 0 46) 22) anon105_Else_correct))))))))))))))))
(let ((anon55_correct  (=> (and (state Heap@1 Mask@1) (= Heap@2 Heap@1)) (=> (and (and (= Mask@2 Mask@1) (= storeIndex@4 storeIndex@3)) (and (= pw@2 pw@1) (= (ControlFlow 0 53) 46))) anon56_correct))))
(let ((anon54_correct  (=> (and (state Heap@0 Mask@0) (= Mask@1 Mask@0)) (=> (and (and (= Heap@1 Heap@0) (= storeIndex@3 storeIndex@2)) (and (= pw@1 pw) (= (ControlFlow 0 55) 53))) anon55_correct))))
(let ((anon97_Else_correct  (=> (forall ((i_42_1 Int) ) (!  (=> (and (<= pivotIndex@0 i_42_1) (<= i_42_1 right)) (= (U_2_int (|Seq#Index| pw i_42_1)) (U_2_int (|Seq#Index| pwPar@0 i_42_1))))
 :qid |stdinbpl.2599:32|
 :skolemid |199|
 :pattern ( (|Seq#Index| pw i_42_1))
 :pattern ( (|Seq#Index| pwPar@0 i_42_1))
)) (=> (and (state ExhaleHeap@1 QPMask@4) (state ExhaleHeap@1 QPMask@4)) (=> (and (and (= Mask@0 QPMask@4) (= Heap@0 ExhaleHeap@1)) (and (= storeIndex@2 storeIndex@0) (= (ControlFlow 0 81) 55))) anon54_correct)))))
(let ((anon95_Else_correct  (=> (forall ((i_40_1 Int) ) (!  (=> (and (<= left i_40_1) (<= i_40_1 (- pivotIndex@0 1))) (= (U_2_int (|Seq#Index| pw i_40_1)) (U_2_int (|Seq#Index| pwPar@0 (U_2_int (|Seq#Index| pwRec@0 i_40_1))))))
 :qid |stdinbpl.2573:32|
 :skolemid |198|
 :pattern ( (|Seq#Index| pw i_40_1))
 :pattern ( (|Seq#Index| pwPar@0 (U_2_int (|Seq#Index| pwRec@0 i_40_1))))
)) (=> (and (state ExhaleHeap@1 QPMask@4) (state ExhaleHeap@1 QPMask@4)) (and (and (=> (= (ControlFlow 0 89) 81) anon97_Else_correct) (=> (= (ControlFlow 0 89) 83) anon98_Then_correct)) (=> (= (ControlFlow 0 89) 88) anon98_Else_correct))))))
(let ((anon94_Else_correct  (and (=> (= (ControlFlow 0 90) (- 0 91)) (dummy ExhaleHeap@1 (U_2_int (|Seq#Index| pwRec@0 storeIndex@0)))) (=> (dummy ExhaleHeap@1 (U_2_int (|Seq#Index| pwRec@0 storeIndex@0))) (=> (and (and (state ExhaleHeap@1 QPMask@4) (= (|Seq#Length| pw) (+ right 1))) (and (state ExhaleHeap@1 QPMask@4) (state ExhaleHeap@1 QPMask@4))) (and (and (=> (= (ControlFlow 0 90) 89) anon95_Else_correct) (=> (= (ControlFlow 0 90) 73) anon96_Then_correct)) (=> (= (ControlFlow 0 90) 80) anon96_Else_correct)))))))
(let ((anon93_Then_correct  (=> (and (< n@@13 pivotIndex@0) (= arg_right@0 (- pivotIndex@0 1))) (and (=> (= (ControlFlow 0 92) (- 0 102)) (<= 0 left)) (=> (<= 0 left) (and (=> (= (ControlFlow 0 92) (- 0 101)) (<= left arg_right@0)) (=> (<= left arg_right@0) (and (=> (= (ControlFlow 0 92) (- 0 100)) (< arg_right@0 (len a_3@@1))) (=> (< arg_right@0 (len a_3@@1)) (and (=> (= (ControlFlow 0 92) (- 0 99)) (<= left n@@13)) (=> (<= left n@@13) (and (=> (= (ControlFlow 0 92) (- 0 98)) (<= n@@13 arg_right@0)) (=> (<= n@@13 arg_right@0) (and (=> (= (ControlFlow 0 92) (- 0 97)) (forall ((i_32 Int) (i_32_1 Int) ) (!  (=> (and (and (and (and (not (= i_32 i_32_1)) (and (<= left i_32) (<= i_32 arg_right@0))) (and (<= left i_32_1) (<= i_32_1 arg_right@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (loc a_3@@1 i_32) (loc a_3@@1 i_32_1))))
 :qid |stdinbpl.2424:31|
 :skolemid |181|
 :pattern ( (neverTriggered14 i_32) (neverTriggered14 i_32_1))
))) (=> (forall ((i_32@@0 Int) (i_32_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_32@@0 i_32_1@@0)) (and (<= left i_32@@0) (<= i_32@@0 arg_right@0))) (and (<= left i_32_1@@0) (<= i_32_1@@0 arg_right@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (loc a_3@@1 i_32@@0) (loc a_3@@1 i_32_1@@0))))
 :qid |stdinbpl.2424:31|
 :skolemid |181|
 :pattern ( (neverTriggered14 i_32@@0) (neverTriggered14 i_32_1@@0))
)) (and (=> (= (ControlFlow 0 92) (- 0 96)) (forall ((i_32@@1 Int) ) (!  (=> (and (<= left i_32@@1) (<= i_32@@1 arg_right@0)) (>= (U_2_real (MapType1Select QPMask@2 (loc a_3@@1 i_32@@1) val)) FullPerm))
 :qid |stdinbpl.2431:31|
 :skolemid |182|
 :pattern ( (loc a_3@@1 i_32@@1))
 :pattern ( (loc a_3@@1 i_32@@1))
))) (=> (forall ((i_32@@2 Int) ) (!  (=> (and (<= left i_32@@2) (<= i_32@@2 arg_right@0)) (>= (U_2_real (MapType1Select QPMask@2 (loc a_3@@1 i_32@@2) val)) FullPerm))
 :qid |stdinbpl.2431:31|
 :skolemid |182|
 :pattern ( (loc a_3@@1 i_32@@2))
 :pattern ( (loc a_3@@1 i_32@@2))
)) (=> (forall ((i_32@@3 Int) ) (!  (=> (and (and (<= left i_32@@3) (<= i_32@@3 arg_right@0)) (< NoPerm FullPerm)) (and (qpRange14 (loc a_3@@1 i_32@@3)) (= (invRecv14 (loc a_3@@1 i_32@@3)) i_32@@3)))
 :qid |stdinbpl.2437:36|
 :skolemid |183|
 :pattern ( (loc a_3@@1 i_32@@3))
 :pattern ( (loc a_3@@1 i_32@@3))
)) (=> (and (forall ((o_3@@5 T@U) ) (!  (=> (= (type o_3@@5) RefType) (=> (and (and (<= left (invRecv14 o_3@@5)) (<= (invRecv14 o_3@@5) arg_right@0)) (and (< NoPerm FullPerm) (qpRange14 o_3@@5))) (= (loc a_3@@1 (invRecv14 o_3@@5)) o_3@@5)))
 :qid |stdinbpl.2441:36|
 :skolemid |184|
 :pattern ( (invRecv14 o_3@@5))
)) (forall ((o_3@@6 T@U) ) (!  (=> (= (type o_3@@6) RefType) (and (=> (and (and (<= left (invRecv14 o_3@@6)) (<= (invRecv14 o_3@@6) arg_right@0)) (and (< NoPerm FullPerm) (qpRange14 o_3@@6))) (and (= (loc a_3@@1 (invRecv14 o_3@@6)) o_3@@6) (= (U_2_real (MapType1Select QPMask@3 o_3@@6 val)) (- (U_2_real (MapType1Select QPMask@2 o_3@@6 val)) FullPerm)))) (=> (not (and (and (<= left (invRecv14 o_3@@6)) (<= (invRecv14 o_3@@6) arg_right@0)) (and (< NoPerm FullPerm) (qpRange14 o_3@@6)))) (= (U_2_real (MapType1Select QPMask@3 o_3@@6 val)) (U_2_real (MapType1Select QPMask@2 o_3@@6 val))))))
 :qid |stdinbpl.2447:36|
 :skolemid |185|
 :pattern ( (MapType1Select QPMask@3 o_3@@6 val))
))) (=> (and (and (forall ((o_3@@7 T@U) (f_5@@1 T@U) ) (! (let ((B@@13 (FieldTypeInv1 (type f_5@@1))))
(let ((A@@14 (FieldTypeInv0 (type f_5@@1))))
 (=> (and (and (= (type o_3@@7) RefType) (= (type f_5@@1) (FieldType A@@14 B@@13))) (not (= f_5@@1 val))) (= (U_2_real (MapType1Select QPMask@2 o_3@@7 f_5@@1)) (U_2_real (MapType1Select QPMask@3 o_3@@7 f_5@@1))))))
 :qid |stdinbpl.2453:43|
 :skolemid |186|
 :pattern ( (MapType1Select QPMask@3 o_3@@7 f_5@@1))
)) (IdenticalOnKnownLocations ExhaleHeap@0 ExhaleHeap@1 QPMask@3)) (and (<= left storeIndex@0) (<= storeIndex@0 arg_right@0))) (and (=> (= (ControlFlow 0 92) (- 0 95)) (forall ((i_33 Int) (i_33_2 Int) ) (!  (=> (and (and (and (and (not (= i_33 i_33_2)) (and (<= left i_33) (<= i_33 arg_right@0))) (and (<= left i_33_2) (<= i_33_2 arg_right@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (loc a_3@@1 i_33) (loc a_3@@1 i_33_2))))
 :qid |stdinbpl.2471:29|
 :skolemid |187|
))) (=> (forall ((i_33@@0 Int) (i_33_2@@0 Int) ) (!  (=> (and (and (and (and (not (= i_33@@0 i_33_2@@0)) (and (<= left i_33@@0) (<= i_33@@0 arg_right@0))) (and (<= left i_33_2@@0) (<= i_33_2@@0 arg_right@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (loc a_3@@1 i_33@@0) (loc a_3@@1 i_33_2@@0))))
 :qid |stdinbpl.2471:29|
 :skolemid |187|
)) (=> (forall ((i_33@@1 Int) ) (!  (=> (and (and (<= left i_33@@1) (<= i_33@@1 arg_right@0)) (< NoPerm FullPerm)) (and (qpRange15 (loc a_3@@1 i_33@@1)) (= (invRecv15 (loc a_3@@1 i_33@@1)) i_33@@1)))
 :qid |stdinbpl.2477:36|
 :skolemid |188|
 :pattern ( (loc a_3@@1 i_33@@1))
 :pattern ( (loc a_3@@1 i_33@@1))
)) (=> (and (forall ((o_3@@8 T@U) ) (!  (=> (= (type o_3@@8) RefType) (=> (and (and (and (<= left (invRecv15 o_3@@8)) (<= (invRecv15 o_3@@8) arg_right@0)) (< NoPerm FullPerm)) (qpRange15 o_3@@8)) (= (loc a_3@@1 (invRecv15 o_3@@8)) o_3@@8)))
 :qid |stdinbpl.2481:36|
 :skolemid |189|
 :pattern ( (invRecv15 o_3@@8))
)) (forall ((i_33@@2 Int) ) (!  (=> (and (<= left i_33@@2) (<= i_33@@2 arg_right@0)) (not (= (loc a_3@@1 i_33@@2) null)))
 :qid |stdinbpl.2487:36|
 :skolemid |190|
 :pattern ( (loc a_3@@1 i_33@@2))
 :pattern ( (loc a_3@@1 i_33@@2))
))) (=> (and (and (forall ((o_3@@9 T@U) ) (!  (=> (= (type o_3@@9) RefType) (and (=> (and (and (and (<= left (invRecv15 o_3@@9)) (<= (invRecv15 o_3@@9) arg_right@0)) (< NoPerm FullPerm)) (qpRange15 o_3@@9)) (and (=> (< NoPerm FullPerm) (= (loc a_3@@1 (invRecv15 o_3@@9)) o_3@@9)) (= (U_2_real (MapType1Select QPMask@4 o_3@@9 val)) (+ (U_2_real (MapType1Select QPMask@3 o_3@@9 val)) FullPerm)))) (=> (not (and (and (and (<= left (invRecv15 o_3@@9)) (<= (invRecv15 o_3@@9) arg_right@0)) (< NoPerm FullPerm)) (qpRange15 o_3@@9))) (= (U_2_real (MapType1Select QPMask@4 o_3@@9 val)) (U_2_real (MapType1Select QPMask@3 o_3@@9 val))))))
 :qid |stdinbpl.2493:36|
 :skolemid |191|
 :pattern ( (MapType1Select QPMask@4 o_3@@9 val))
)) (forall ((o_3@@10 T@U) (f_5@@2 T@U) ) (! (let ((B@@14 (FieldTypeInv1 (type f_5@@2))))
(let ((A@@15 (FieldTypeInv0 (type f_5@@2))))
 (=> (and (and (= (type o_3@@10) RefType) (= (type f_5@@2) (FieldType A@@15 B@@14))) (not (= f_5@@2 val))) (= (U_2_real (MapType1Select QPMask@3 o_3@@10 f_5@@2)) (U_2_real (MapType1Select QPMask@4 o_3@@10 f_5@@2))))))
 :qid |stdinbpl.2497:43|
 :skolemid |192|
 :pattern ( (MapType1Select QPMask@3 o_3@@10 f_5@@2))
 :pattern ( (MapType1Select QPMask@4 o_3@@10 f_5@@2))
))) (and (state ExhaleHeap@1 QPMask@4) (= storeIndex@0 n@@13))) (=> (and (and (and (forall ((i_34 Int) ) (!  (=> (and (<= left i_34) (< i_34 storeIndex@0)) (<= (U_2_int (MapType0Select ExhaleHeap@1 (loc a_3@@1 i_34) val)) (U_2_int (MapType0Select ExhaleHeap@1 (loc a_3@@1 storeIndex@0) val))))
 :qid |stdinbpl.2504:34|
 :skolemid |193|
 :pattern ( (loc a_3@@1 i_34))
)) (forall ((i_35 Int) ) (!  (=> (and (< storeIndex@0 i_35) (<= i_35 arg_right@0)) (<= (U_2_int (MapType0Select ExhaleHeap@1 (loc a_3@@1 storeIndex@0) val)) (U_2_int (MapType0Select ExhaleHeap@1 (loc a_3@@1 i_35) val))))
 :qid |stdinbpl.2508:34|
 :skolemid |194|
 :pattern ( (loc a_3@@1 i_35))
))) (and (= (|Seq#Length| pwRec@0) (+ arg_right@0 1)) (forall ((i_36 Int) ) (!  (=> (and (<= left i_36) (<= i_36 arg_right@0)) (and (<= left (U_2_int (|Seq#Index| pwRec@0 i_36))) (<= (U_2_int (|Seq#Index| pwRec@0 i_36)) arg_right@0)))
 :qid |stdinbpl.2513:34|
 :skolemid |195|
 :pattern ( (|Seq#Index| pwRec@0 i_36))
)))) (and (and (forall ((i_37 Int) (j_4 Int) ) (!  (=> (and (<= left i_37) (and (< i_37 j_4) (<= j_4 arg_right@0))) (not (= (U_2_int (|Seq#Index| pwRec@0 i_37)) (U_2_int (|Seq#Index| pwRec@0 j_4)))))
 :qid |stdinbpl.2517:34|
 :skolemid |196|
 :pattern ( (|Seq#Index| pwRec@0 i_37) (|Seq#Index| pwRec@0 j_4))
)) (forall ((i_38 Int) ) (!  (=> (and (<= left i_38) (<= i_38 arg_right@0)) (= (U_2_int (MapType0Select ExhaleHeap@1 (loc a_3@@1 i_38) val)) (U_2_int (MapType0Select ExhaleHeap@0 (loc a_3@@1 (U_2_int (|Seq#Index| pwRec@0 i_38))) val))))
 :qid |stdinbpl.2521:34|
 :skolemid |197|
 :pattern ( (|Seq#Index| pwRec@0 i_38))
))) (and (state ExhaleHeap@1 QPMask@4) (state ExhaleHeap@1 QPMask@4)))) (and (=> (= (ControlFlow 0 92) (- 0 94)) (>= storeIndex@0 0)) (=> (>= storeIndex@0 0) (and (=> (= (ControlFlow 0 92) (- 0 93)) (< storeIndex@0 (|Seq#Length| pwRec@0))) (=> (< storeIndex@0 (|Seq#Length| pwRec@0)) (and (=> (= (ControlFlow 0 92) 71) anon94_Then_correct) (=> (= (ControlFlow 0 92) 90) anon94_Else_correct))))))))))))))))))))))))))))))))
(let ((anon102_Else_correct  (=> (forall ((i_53_2 Int) ) (!  (=> (and (<= (+ pivotIndex@0 1) i_53_2) (<= i_53_2 right)) (= (U_2_int (|Seq#Index| pw i_53_2)) (U_2_int (|Seq#Index| pwPar@0 (U_2_int (|Seq#Index| pwRec@1 i_53_2))))))
 :qid |stdinbpl.2807:32|
 :skolemid |218|
 :pattern ( (|Seq#Index| pw i_53_2))
 :pattern ( (|Seq#Index| pwPar@0 (U_2_int (|Seq#Index| pwRec@1 i_53_2))))
)) (=> (and (state ExhaleHeap@2 QPMask@6) (state ExhaleHeap@2 QPMask@6)) (=> (and (and (= Mask@0 QPMask@6) (= Heap@0 ExhaleHeap@2)) (and (= storeIndex@2 storeIndex@1) (= (ControlFlow 0 56) 55))) anon54_correct)))))
(let ((anon92_Then_correct  (=> (and (and (and (= n@@13 pivotIndex@0) (state ExhaleHeap@0 QPMask@2)) (and (state ExhaleHeap@0 QPMask@2) (= Mask@1 QPMask@2))) (and (and (= Heap@1 ExhaleHeap@0) (= storeIndex@3 pivotIndex@0)) (and (= pw@1 pwPar@0) (= (ControlFlow 0 54) 53)))) anon55_correct)))
(let ((anon91_Then_correct  (=> (= left right) (=> (and (and (and (state Heap@@13 QPMask@0) (= pw@0 (|Seq#Range| 0 (+ left 1)))) (and (state Heap@@13 QPMask@0) (= Heap@2 Heap@@13))) (and (and (= Mask@2 QPMask@0) (= storeIndex@4 left)) (and (= pw@2 pw@0) (= (ControlFlow 0 52) 46)))) anon56_correct))))
(let ((anon52_correct true))
(let ((anon103_Else_correct  (=> (and (not (and (<= (+ pivotIndex@0 1) i_53) (<= i_53 right))) (= (ControlFlow 0 18) 10)) anon52_correct)))
(let ((anon103_Then_correct  (=> (and (<= (+ pivotIndex@0 1) i_53) (<= i_53 right)) (and (=> (= (ControlFlow 0 11) (- 0 17)) (>= i_53 0)) (=> (>= i_53 0) (and (=> (= (ControlFlow 0 11) (- 0 16)) (< i_53 (|Seq#Length| pw))) (=> (< i_53 (|Seq#Length| pw)) (and (=> (= (ControlFlow 0 11) (- 0 15)) (>= i_53 0)) (=> (>= i_53 0) (and (=> (= (ControlFlow 0 11) (- 0 14)) (< i_53 (|Seq#Length| pwRec@1))) (=> (< i_53 (|Seq#Length| pwRec@1)) (and (=> (= (ControlFlow 0 11) (- 0 13)) (>= (U_2_int (|Seq#Index| pwRec@1 i_53)) 0)) (=> (>= (U_2_int (|Seq#Index| pwRec@1 i_53)) 0) (and (=> (= (ControlFlow 0 11) (- 0 12)) (< (U_2_int (|Seq#Index| pwRec@1 i_53)) (|Seq#Length| pwPar@0))) (=> (< (U_2_int (|Seq#Index| pwRec@1 i_53)) (|Seq#Length| pwPar@0)) (=> (= (ControlFlow 0 11) 10) anon52_correct))))))))))))))))
(let ((anon100_Else_correct  (=> (forall ((i_51_2 Int) ) (!  (=> (and (<= left i_51_2) (<= i_51_2 pivotIndex@0)) (= (U_2_int (|Seq#Index| pw i_51_2)) (U_2_int (|Seq#Index| pwPar@0 i_51_2))))
 :qid |stdinbpl.2777:32|
 :skolemid |217|
 :pattern ( (|Seq#Index| pw i_51_2))
 :pattern ( (|Seq#Index| pwPar@0 i_51_2))
)) (=> (and (state ExhaleHeap@2 QPMask@6) (state ExhaleHeap@2 QPMask@6)) (and (and (=> (= (ControlFlow 0 57) 56) anon102_Else_correct) (=> (= (ControlFlow 0 57) 11) anon103_Then_correct)) (=> (= (ControlFlow 0 57) 18) anon103_Else_correct))))))
(let ((anon48_correct true))
(let ((anon101_Else_correct  (=> (and (not (and (<= left i_51) (<= i_51 pivotIndex@0))) (= (ControlFlow 0 9) 3)) anon48_correct)))
(let ((anon101_Then_correct  (=> (and (<= left i_51) (<= i_51 pivotIndex@0)) (and (=> (= (ControlFlow 0 4) (- 0 8)) (>= i_51 0)) (=> (>= i_51 0) (and (=> (= (ControlFlow 0 4) (- 0 7)) (< i_51 (|Seq#Length| pw))) (=> (< i_51 (|Seq#Length| pw)) (and (=> (= (ControlFlow 0 4) (- 0 6)) (>= i_51 0)) (=> (>= i_51 0) (and (=> (= (ControlFlow 0 4) (- 0 5)) (< i_51 (|Seq#Length| pwPar@0))) (=> (< i_51 (|Seq#Length| pwPar@0)) (=> (= (ControlFlow 0 4) 3) anon48_correct))))))))))))
(let ((anon99_Else_correct  (and (=> (= (ControlFlow 0 58) (- 0 59)) (dummy ExhaleHeap@2 (U_2_int (|Seq#Index| pwRec@1 storeIndex@1)))) (=> (dummy ExhaleHeap@2 (U_2_int (|Seq#Index| pwRec@1 storeIndex@1))) (=> (and (and (state ExhaleHeap@2 QPMask@6) (= (|Seq#Length| pw) (+ right 1))) (and (state ExhaleHeap@2 QPMask@6) (state ExhaleHeap@2 QPMask@6))) (and (and (=> (= (ControlFlow 0 58) 57) anon100_Else_correct) (=> (= (ControlFlow 0 58) 4) anon101_Then_correct)) (=> (= (ControlFlow 0 58) 9) anon101_Else_correct)))))))
(let ((anon99_Then_correct true))
(let ((anon93_Else_correct  (=> (and (<= pivotIndex@0 n@@13) (= arg_left@0 (+ pivotIndex@0 1))) (and (=> (= (ControlFlow 0 60) (- 0 70)) (<= 0 arg_left@0)) (=> (<= 0 arg_left@0) (and (=> (= (ControlFlow 0 60) (- 0 69)) (<= arg_left@0 right)) (=> (<= arg_left@0 right) (and (=> (= (ControlFlow 0 60) (- 0 68)) (< right (len a_3@@1))) (=> (< right (len a_3@@1)) (and (=> (= (ControlFlow 0 60) (- 0 67)) (<= arg_left@0 n@@13)) (=> (<= arg_left@0 n@@13) (and (=> (= (ControlFlow 0 60) (- 0 66)) (<= n@@13 right)) (=> (<= n@@13 right) (and (=> (= (ControlFlow 0 60) (- 0 65)) (forall ((i_43 Int) (i_43_1 Int) ) (!  (=> (and (and (and (and (not (= i_43 i_43_1)) (and (<= arg_left@0 i_43) (<= i_43 right))) (and (<= arg_left@0 i_43_1) (<= i_43_1 right))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (loc a_3@@1 i_43) (loc a_3@@1 i_43_1))))
 :qid |stdinbpl.2632:31|
 :skolemid |200|
 :pattern ( (neverTriggered16 i_43) (neverTriggered16 i_43_1))
))) (=> (forall ((i_43@@0 Int) (i_43_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_43@@0 i_43_1@@0)) (and (<= arg_left@0 i_43@@0) (<= i_43@@0 right))) (and (<= arg_left@0 i_43_1@@0) (<= i_43_1@@0 right))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (loc a_3@@1 i_43@@0) (loc a_3@@1 i_43_1@@0))))
 :qid |stdinbpl.2632:31|
 :skolemid |200|
 :pattern ( (neverTriggered16 i_43@@0) (neverTriggered16 i_43_1@@0))
)) (and (=> (= (ControlFlow 0 60) (- 0 64)) (forall ((i_43@@1 Int) ) (!  (=> (and (<= arg_left@0 i_43@@1) (<= i_43@@1 right)) (>= (U_2_real (MapType1Select QPMask@2 (loc a_3@@1 i_43@@1) val)) FullPerm))
 :qid |stdinbpl.2639:31|
 :skolemid |201|
 :pattern ( (loc a_3@@1 i_43@@1))
 :pattern ( (loc a_3@@1 i_43@@1))
))) (=> (forall ((i_43@@2 Int) ) (!  (=> (and (<= arg_left@0 i_43@@2) (<= i_43@@2 right)) (>= (U_2_real (MapType1Select QPMask@2 (loc a_3@@1 i_43@@2) val)) FullPerm))
 :qid |stdinbpl.2639:31|
 :skolemid |201|
 :pattern ( (loc a_3@@1 i_43@@2))
 :pattern ( (loc a_3@@1 i_43@@2))
)) (=> (forall ((i_43@@3 Int) ) (!  (=> (and (and (<= arg_left@0 i_43@@3) (<= i_43@@3 right)) (< NoPerm FullPerm)) (and (qpRange16 (loc a_3@@1 i_43@@3)) (= (invRecv16 (loc a_3@@1 i_43@@3)) i_43@@3)))
 :qid |stdinbpl.2645:36|
 :skolemid |202|
 :pattern ( (loc a_3@@1 i_43@@3))
 :pattern ( (loc a_3@@1 i_43@@3))
)) (=> (and (forall ((o_3@@11 T@U) ) (!  (=> (= (type o_3@@11) RefType) (=> (and (and (<= arg_left@0 (invRecv16 o_3@@11)) (<= (invRecv16 o_3@@11) right)) (and (< NoPerm FullPerm) (qpRange16 o_3@@11))) (= (loc a_3@@1 (invRecv16 o_3@@11)) o_3@@11)))
 :qid |stdinbpl.2649:36|
 :skolemid |203|
 :pattern ( (invRecv16 o_3@@11))
)) (forall ((o_3@@12 T@U) ) (!  (=> (= (type o_3@@12) RefType) (and (=> (and (and (<= arg_left@0 (invRecv16 o_3@@12)) (<= (invRecv16 o_3@@12) right)) (and (< NoPerm FullPerm) (qpRange16 o_3@@12))) (and (= (loc a_3@@1 (invRecv16 o_3@@12)) o_3@@12) (= (U_2_real (MapType1Select QPMask@5 o_3@@12 val)) (- (U_2_real (MapType1Select QPMask@2 o_3@@12 val)) FullPerm)))) (=> (not (and (and (<= arg_left@0 (invRecv16 o_3@@12)) (<= (invRecv16 o_3@@12) right)) (and (< NoPerm FullPerm) (qpRange16 o_3@@12)))) (= (U_2_real (MapType1Select QPMask@5 o_3@@12 val)) (U_2_real (MapType1Select QPMask@2 o_3@@12 val))))))
 :qid |stdinbpl.2655:36|
 :skolemid |204|
 :pattern ( (MapType1Select QPMask@5 o_3@@12 val))
))) (=> (and (and (forall ((o_3@@13 T@U) (f_5@@3 T@U) ) (! (let ((B@@15 (FieldTypeInv1 (type f_5@@3))))
(let ((A@@16 (FieldTypeInv0 (type f_5@@3))))
 (=> (and (and (= (type o_3@@13) RefType) (= (type f_5@@3) (FieldType A@@16 B@@15))) (not (= f_5@@3 val))) (= (U_2_real (MapType1Select QPMask@2 o_3@@13 f_5@@3)) (U_2_real (MapType1Select QPMask@5 o_3@@13 f_5@@3))))))
 :qid |stdinbpl.2661:43|
 :skolemid |205|
 :pattern ( (MapType1Select QPMask@5 o_3@@13 f_5@@3))
)) (IdenticalOnKnownLocations ExhaleHeap@0 ExhaleHeap@2 QPMask@5)) (and (<= arg_left@0 storeIndex@1) (<= storeIndex@1 right))) (and (=> (= (ControlFlow 0 60) (- 0 63)) (forall ((i_44 Int) (i_44_1 Int) ) (!  (=> (and (and (and (and (not (= i_44 i_44_1)) (and (<= arg_left@0 i_44) (<= i_44 right))) (and (<= arg_left@0 i_44_1) (<= i_44_1 right))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (loc a_3@@1 i_44) (loc a_3@@1 i_44_1))))
 :qid |stdinbpl.2679:29|
 :skolemid |206|
))) (=> (forall ((i_44@@0 Int) (i_44_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_44@@0 i_44_1@@0)) (and (<= arg_left@0 i_44@@0) (<= i_44@@0 right))) (and (<= arg_left@0 i_44_1@@0) (<= i_44_1@@0 right))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (loc a_3@@1 i_44@@0) (loc a_3@@1 i_44_1@@0))))
 :qid |stdinbpl.2679:29|
 :skolemid |206|
)) (=> (forall ((i_44@@1 Int) ) (!  (=> (and (and (<= arg_left@0 i_44@@1) (<= i_44@@1 right)) (< NoPerm FullPerm)) (and (qpRange17 (loc a_3@@1 i_44@@1)) (= (invRecv17 (loc a_3@@1 i_44@@1)) i_44@@1)))
 :qid |stdinbpl.2685:36|
 :skolemid |207|
 :pattern ( (loc a_3@@1 i_44@@1))
 :pattern ( (loc a_3@@1 i_44@@1))
)) (=> (and (forall ((o_3@@14 T@U) ) (!  (=> (= (type o_3@@14) RefType) (=> (and (and (and (<= arg_left@0 (invRecv17 o_3@@14)) (<= (invRecv17 o_3@@14) right)) (< NoPerm FullPerm)) (qpRange17 o_3@@14)) (= (loc a_3@@1 (invRecv17 o_3@@14)) o_3@@14)))
 :qid |stdinbpl.2689:36|
 :skolemid |208|
 :pattern ( (invRecv17 o_3@@14))
)) (forall ((i_44@@2 Int) ) (!  (=> (and (<= arg_left@0 i_44@@2) (<= i_44@@2 right)) (not (= (loc a_3@@1 i_44@@2) null)))
 :qid |stdinbpl.2695:36|
 :skolemid |209|
 :pattern ( (loc a_3@@1 i_44@@2))
 :pattern ( (loc a_3@@1 i_44@@2))
))) (=> (and (and (forall ((o_3@@15 T@U) ) (!  (=> (= (type o_3@@15) RefType) (and (=> (and (and (and (<= arg_left@0 (invRecv17 o_3@@15)) (<= (invRecv17 o_3@@15) right)) (< NoPerm FullPerm)) (qpRange17 o_3@@15)) (and (=> (< NoPerm FullPerm) (= (loc a_3@@1 (invRecv17 o_3@@15)) o_3@@15)) (= (U_2_real (MapType1Select QPMask@6 o_3@@15 val)) (+ (U_2_real (MapType1Select QPMask@5 o_3@@15 val)) FullPerm)))) (=> (not (and (and (and (<= arg_left@0 (invRecv17 o_3@@15)) (<= (invRecv17 o_3@@15) right)) (< NoPerm FullPerm)) (qpRange17 o_3@@15))) (= (U_2_real (MapType1Select QPMask@6 o_3@@15 val)) (U_2_real (MapType1Select QPMask@5 o_3@@15 val))))))
 :qid |stdinbpl.2701:36|
 :skolemid |210|
 :pattern ( (MapType1Select QPMask@6 o_3@@15 val))
)) (forall ((o_3@@16 T@U) (f_5@@4 T@U) ) (! (let ((B@@16 (FieldTypeInv1 (type f_5@@4))))
(let ((A@@17 (FieldTypeInv0 (type f_5@@4))))
 (=> (and (and (= (type o_3@@16) RefType) (= (type f_5@@4) (FieldType A@@17 B@@16))) (not (= f_5@@4 val))) (= (U_2_real (MapType1Select QPMask@5 o_3@@16 f_5@@4)) (U_2_real (MapType1Select QPMask@6 o_3@@16 f_5@@4))))))
 :qid |stdinbpl.2705:43|
 :skolemid |211|
 :pattern ( (MapType1Select QPMask@5 o_3@@16 f_5@@4))
 :pattern ( (MapType1Select QPMask@6 o_3@@16 f_5@@4))
))) (and (state ExhaleHeap@2 QPMask@6) (= storeIndex@1 n@@13))) (=> (and (and (and (forall ((i_45 Int) ) (!  (=> (and (<= arg_left@0 i_45) (< i_45 storeIndex@1)) (<= (U_2_int (MapType0Select ExhaleHeap@2 (loc a_3@@1 i_45) val)) (U_2_int (MapType0Select ExhaleHeap@2 (loc a_3@@1 storeIndex@1) val))))
 :qid |stdinbpl.2712:34|
 :skolemid |212|
 :pattern ( (loc a_3@@1 i_45))
)) (forall ((i_46 Int) ) (!  (=> (and (< storeIndex@1 i_46) (<= i_46 right)) (<= (U_2_int (MapType0Select ExhaleHeap@2 (loc a_3@@1 storeIndex@1) val)) (U_2_int (MapType0Select ExhaleHeap@2 (loc a_3@@1 i_46) val))))
 :qid |stdinbpl.2716:34|
 :skolemid |213|
 :pattern ( (loc a_3@@1 i_46))
))) (and (= (|Seq#Length| pwRec@1) (+ right 1)) (forall ((i_47 Int) ) (!  (=> (and (<= arg_left@0 i_47) (<= i_47 right)) (and (<= arg_left@0 (U_2_int (|Seq#Index| pwRec@1 i_47))) (<= (U_2_int (|Seq#Index| pwRec@1 i_47)) right)))
 :qid |stdinbpl.2721:34|
 :skolemid |214|
 :pattern ( (|Seq#Index| pwRec@1 i_47))
)))) (and (and (forall ((i_48 Int) (j_5 Int) ) (!  (=> (and (<= arg_left@0 i_48) (and (< i_48 j_5) (<= j_5 right))) (not (= (U_2_int (|Seq#Index| pwRec@1 i_48)) (U_2_int (|Seq#Index| pwRec@1 j_5)))))
 :qid |stdinbpl.2725:34|
 :skolemid |215|
 :pattern ( (|Seq#Index| pwRec@1 i_48) (|Seq#Index| pwRec@1 j_5))
)) (forall ((i_49 Int) ) (!  (=> (and (<= arg_left@0 i_49) (<= i_49 right)) (= (U_2_int (MapType0Select ExhaleHeap@2 (loc a_3@@1 i_49) val)) (U_2_int (MapType0Select ExhaleHeap@0 (loc a_3@@1 (U_2_int (|Seq#Index| pwRec@1 i_49))) val))))
 :qid |stdinbpl.2729:34|
 :skolemid |216|
 :pattern ( (|Seq#Index| pwRec@1 i_49))
))) (and (state ExhaleHeap@2 QPMask@6) (state ExhaleHeap@2 QPMask@6)))) (and (=> (= (ControlFlow 0 60) (- 0 62)) (>= storeIndex@1 0)) (=> (>= storeIndex@1 0) (and (=> (= (ControlFlow 0 60) (- 0 61)) (< storeIndex@1 (|Seq#Length| pwRec@1))) (=> (< storeIndex@1 (|Seq#Length| pwRec@1)) (and (=> (= (ControlFlow 0 60) 2) anon99_Then_correct) (=> (= (ControlFlow 0 60) 58) anon99_Else_correct))))))))))))))))))))))))))))))))
(let ((anon92_Else_correct  (=> (not (= n@@13 pivotIndex@0)) (and (=> (= (ControlFlow 0 103) 92) anon93_Then_correct) (=> (= (ControlFlow 0 103) 60) anon93_Else_correct)))))
(let ((anon91_Else_correct  (=> (not (= left right)) (=> (and (and (<= left pivotIndex) (<= pivotIndex right)) (and (state Heap@@13 QPMask@0) (state Heap@@13 QPMask@0))) (and (=> (= (ControlFlow 0 104) (- 0 112)) (<= 0 left)) (=> (<= 0 left) (and (=> (= (ControlFlow 0 104) (- 0 111)) (< left right)) (=> (< left right) (and (=> (= (ControlFlow 0 104) (- 0 110)) (< right (len a_3@@1))) (=> (< right (len a_3@@1)) (and (=> (= (ControlFlow 0 104) (- 0 109)) (<= left pivotIndex)) (=> (<= left pivotIndex) (and (=> (= (ControlFlow 0 104) (- 0 108)) (<= pivotIndex right)) (=> (<= pivotIndex right) (and (=> (= (ControlFlow 0 104) (- 0 107)) (forall ((i_25 Int) (i_25_1 Int) ) (!  (=> (and (and (and (and (not (= i_25 i_25_1)) (and (<= left i_25) (<= i_25 right))) (and (<= left i_25_1) (<= i_25_1 right))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (loc a_3@@1 i_25) (loc a_3@@1 i_25_1))))
 :qid |stdinbpl.2280:23|
 :skolemid |164|
 :pattern ( (neverTriggered12 i_25) (neverTriggered12 i_25_1))
))) (=> (forall ((i_25@@0 Int) (i_25_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_25@@0 i_25_1@@0)) (and (<= left i_25@@0) (<= i_25@@0 right))) (and (<= left i_25_1@@0) (<= i_25_1@@0 right))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (loc a_3@@1 i_25@@0) (loc a_3@@1 i_25_1@@0))))
 :qid |stdinbpl.2280:23|
 :skolemid |164|
 :pattern ( (neverTriggered12 i_25@@0) (neverTriggered12 i_25_1@@0))
)) (and (=> (= (ControlFlow 0 104) (- 0 106)) (forall ((i_25@@1 Int) ) (!  (=> (and (<= left i_25@@1) (<= i_25@@1 right)) (>= (U_2_real (MapType1Select QPMask@0 (loc a_3@@1 i_25@@1) val)) FullPerm))
 :qid |stdinbpl.2287:23|
 :skolemid |165|
 :pattern ( (loc a_3@@1 i_25@@1))
 :pattern ( (loc a_3@@1 i_25@@1))
))) (=> (forall ((i_25@@2 Int) ) (!  (=> (and (<= left i_25@@2) (<= i_25@@2 right)) (>= (U_2_real (MapType1Select QPMask@0 (loc a_3@@1 i_25@@2) val)) FullPerm))
 :qid |stdinbpl.2287:23|
 :skolemid |165|
 :pattern ( (loc a_3@@1 i_25@@2))
 :pattern ( (loc a_3@@1 i_25@@2))
)) (=> (forall ((i_25@@3 Int) ) (!  (=> (and (and (<= left i_25@@3) (<= i_25@@3 right)) (< NoPerm FullPerm)) (and (qpRange12 (loc a_3@@1 i_25@@3)) (= (invRecv12 (loc a_3@@1 i_25@@3)) i_25@@3)))
 :qid |stdinbpl.2293:28|
 :skolemid |166|
 :pattern ( (loc a_3@@1 i_25@@3))
 :pattern ( (loc a_3@@1 i_25@@3))
)) (=> (and (forall ((o_3@@17 T@U) ) (!  (=> (= (type o_3@@17) RefType) (=> (and (and (<= left (invRecv12 o_3@@17)) (<= (invRecv12 o_3@@17) right)) (and (< NoPerm FullPerm) (qpRange12 o_3@@17))) (= (loc a_3@@1 (invRecv12 o_3@@17)) o_3@@17)))
 :qid |stdinbpl.2297:28|
 :skolemid |167|
 :pattern ( (invRecv12 o_3@@17))
)) (forall ((o_3@@18 T@U) ) (!  (=> (= (type o_3@@18) RefType) (and (=> (and (and (<= left (invRecv12 o_3@@18)) (<= (invRecv12 o_3@@18) right)) (and (< NoPerm FullPerm) (qpRange12 o_3@@18))) (and (= (loc a_3@@1 (invRecv12 o_3@@18)) o_3@@18) (= (U_2_real (MapType1Select QPMask@1 o_3@@18 val)) (- (U_2_real (MapType1Select QPMask@0 o_3@@18 val)) FullPerm)))) (=> (not (and (and (<= left (invRecv12 o_3@@18)) (<= (invRecv12 o_3@@18) right)) (and (< NoPerm FullPerm) (qpRange12 o_3@@18)))) (= (U_2_real (MapType1Select QPMask@1 o_3@@18 val)) (U_2_real (MapType1Select QPMask@0 o_3@@18 val))))))
 :qid |stdinbpl.2303:28|
 :skolemid |168|
 :pattern ( (MapType1Select QPMask@1 o_3@@18 val))
))) (=> (and (and (forall ((o_3@@19 T@U) (f_5@@5 T@U) ) (! (let ((B@@17 (FieldTypeInv1 (type f_5@@5))))
(let ((A@@18 (FieldTypeInv0 (type f_5@@5))))
 (=> (and (and (= (type o_3@@19) RefType) (= (type f_5@@5) (FieldType A@@18 B@@17))) (not (= f_5@@5 val))) (= (U_2_real (MapType1Select QPMask@0 o_3@@19 f_5@@5)) (U_2_real (MapType1Select QPMask@1 o_3@@19 f_5@@5))))))
 :qid |stdinbpl.2309:35|
 :skolemid |169|
 :pattern ( (MapType1Select QPMask@1 o_3@@19 f_5@@5))
)) (IdenticalOnKnownLocations Heap@@13 ExhaleHeap@0 QPMask@1)) (and (<= left pivotIndex@0) (<= pivotIndex@0 right))) (and (=> (= (ControlFlow 0 104) (- 0 105)) (forall ((i_26 Int) (i_26_1 Int) ) (!  (=> (and (and (and (and (not (= i_26 i_26_1)) (and (<= left i_26) (<= i_26 right))) (and (<= left i_26_1) (<= i_26_1 right))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (loc a_3@@1 i_26) (loc a_3@@1 i_26_1))))
 :qid |stdinbpl.2327:21|
 :skolemid |170|
))) (=> (forall ((i_26@@0 Int) (i_26_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_26@@0 i_26_1@@0)) (and (<= left i_26@@0) (<= i_26@@0 right))) (and (<= left i_26_1@@0) (<= i_26_1@@0 right))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (loc a_3@@1 i_26@@0) (loc a_3@@1 i_26_1@@0))))
 :qid |stdinbpl.2327:21|
 :skolemid |170|
)) (=> (forall ((i_26@@1 Int) ) (!  (=> (and (and (<= left i_26@@1) (<= i_26@@1 right)) (< NoPerm FullPerm)) (and (qpRange13 (loc a_3@@1 i_26@@1)) (= (invRecv13 (loc a_3@@1 i_26@@1)) i_26@@1)))
 :qid |stdinbpl.2333:28|
 :skolemid |171|
 :pattern ( (loc a_3@@1 i_26@@1))
 :pattern ( (loc a_3@@1 i_26@@1))
)) (=> (and (forall ((o_3@@20 T@U) ) (!  (=> (= (type o_3@@20) RefType) (=> (and (and (and (<= left (invRecv13 o_3@@20)) (<= (invRecv13 o_3@@20) right)) (< NoPerm FullPerm)) (qpRange13 o_3@@20)) (= (loc a_3@@1 (invRecv13 o_3@@20)) o_3@@20)))
 :qid |stdinbpl.2337:28|
 :skolemid |172|
 :pattern ( (invRecv13 o_3@@20))
)) (forall ((i_26@@2 Int) ) (!  (=> (and (<= left i_26@@2) (<= i_26@@2 right)) (not (= (loc a_3@@1 i_26@@2) null)))
 :qid |stdinbpl.2343:28|
 :skolemid |173|
 :pattern ( (loc a_3@@1 i_26@@2))
 :pattern ( (loc a_3@@1 i_26@@2))
))) (=> (and (and (forall ((o_3@@21 T@U) ) (!  (=> (= (type o_3@@21) RefType) (and (=> (and (and (and (<= left (invRecv13 o_3@@21)) (<= (invRecv13 o_3@@21) right)) (< NoPerm FullPerm)) (qpRange13 o_3@@21)) (and (=> (< NoPerm FullPerm) (= (loc a_3@@1 (invRecv13 o_3@@21)) o_3@@21)) (= (U_2_real (MapType1Select QPMask@2 o_3@@21 val)) (+ (U_2_real (MapType1Select QPMask@1 o_3@@21 val)) FullPerm)))) (=> (not (and (and (and (<= left (invRecv13 o_3@@21)) (<= (invRecv13 o_3@@21) right)) (< NoPerm FullPerm)) (qpRange13 o_3@@21))) (= (U_2_real (MapType1Select QPMask@2 o_3@@21 val)) (U_2_real (MapType1Select QPMask@1 o_3@@21 val))))))
 :qid |stdinbpl.2349:28|
 :skolemid |174|
 :pattern ( (MapType1Select QPMask@2 o_3@@21 val))
)) (forall ((o_3@@22 T@U) (f_5@@6 T@U) ) (! (let ((B@@18 (FieldTypeInv1 (type f_5@@6))))
(let ((A@@19 (FieldTypeInv0 (type f_5@@6))))
 (=> (and (and (= (type o_3@@22) RefType) (= (type f_5@@6) (FieldType A@@19 B@@18))) (not (= f_5@@6 val))) (= (U_2_real (MapType1Select QPMask@1 o_3@@22 f_5@@6)) (U_2_real (MapType1Select QPMask@2 o_3@@22 f_5@@6))))))
 :qid |stdinbpl.2353:35|
 :skolemid |175|
 :pattern ( (MapType1Select QPMask@1 o_3@@22 f_5@@6))
 :pattern ( (MapType1Select QPMask@2 o_3@@22 f_5@@6))
))) (and (state ExhaleHeap@0 QPMask@2) (= (U_2_int (MapType0Select ExhaleHeap@0 (loc a_3@@1 pivotIndex@0) val)) (U_2_int (MapType0Select Heap@@13 (loc a_3@@1 pivotIndex) val))))) (=> (and (and (and (forall ((i_27_2 Int) ) (!  (=> (and (<= left i_27_2) (< i_27_2 pivotIndex@0)) (< (U_2_int (MapType0Select ExhaleHeap@0 (loc a_3@@1 i_27_2) val)) (U_2_int (MapType0Select ExhaleHeap@0 (loc a_3@@1 pivotIndex@0) val))))
 :qid |stdinbpl.2360:26|
 :skolemid |176|
 :pattern ( (loc a_3@@1 i_27_2))
)) (forall ((i_28 Int) ) (!  (=> (and (< pivotIndex@0 i_28) (<= i_28 right)) (<= (U_2_int (MapType0Select ExhaleHeap@0 (loc a_3@@1 pivotIndex@0) val)) (U_2_int (MapType0Select ExhaleHeap@0 (loc a_3@@1 i_28) val))))
 :qid |stdinbpl.2364:26|
 :skolemid |177|
 :pattern ( (loc a_3@@1 i_28))
))) (and (= (|Seq#Length| pwPar@0) (+ right 1)) (forall ((i_29_2 Int) ) (!  (=> (and (<= left i_29_2) (<= i_29_2 right)) (and (<= left (U_2_int (|Seq#Index| pwPar@0 i_29_2))) (<= (U_2_int (|Seq#Index| pwPar@0 i_29_2)) right)))
 :qid |stdinbpl.2369:26|
 :skolemid |178|
 :pattern ( (|Seq#Index| pwPar@0 i_29_2))
)))) (and (and (forall ((i_30 Int) (k_3 Int) ) (!  (=> (and (<= left i_30) (and (< i_30 k_3) (<= k_3 right))) (not (= (U_2_int (|Seq#Index| pwPar@0 i_30)) (U_2_int (|Seq#Index| pwPar@0 k_3)))))
 :qid |stdinbpl.2373:26|
 :skolemid |179|
 :pattern ( (|Seq#Index| pwPar@0 i_30) (|Seq#Index| pwPar@0 k_3))
)) (forall ((i_31 Int) ) (!  (=> (and (<= left i_31) (<= i_31 right)) (= (U_2_int (MapType0Select ExhaleHeap@0 (loc a_3@@1 i_31) val)) (U_2_int (MapType0Select Heap@@13 (loc a_3@@1 (U_2_int (|Seq#Index| pwPar@0 i_31))) val))))
 :qid |stdinbpl.2377:26|
 :skolemid |180|
 :pattern ( (|Seq#Index| pwPar@0 i_31))
))) (and (state ExhaleHeap@0 QPMask@2) (state ExhaleHeap@0 QPMask@2)))) (and (=> (= (ControlFlow 0 104) 54) anon92_Then_correct) (=> (= (ControlFlow 0 104) 103) anon92_Else_correct)))))))))))))))))))))))))))))
(let ((anon77_Else_correct  (and (=> (= (ControlFlow 0 155) (- 0 156)) (forall ((i_1 Int) (i_1_1 Int) ) (!  (=> (and (and (and (and (not (= i_1 i_1_1)) (and (<= left i_1) (<= i_1 right))) (and (<= left i_1_1) (<= i_1_1 right))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (loc a_3@@1 i_1) (loc a_3@@1 i_1_1))))
 :qid |stdinbpl.2048:15|
 :skolemid |147|
))) (=> (forall ((i_1@@0 Int) (i_1_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_1@@0 i_1_1@@0)) (and (<= left i_1@@0) (<= i_1@@0 right))) (and (<= left i_1_1@@0) (<= i_1_1@@0 right))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (loc a_3@@1 i_1@@0) (loc a_3@@1 i_1_1@@0))))
 :qid |stdinbpl.2048:15|
 :skolemid |147|
)) (=> (forall ((i_1@@1 Int) ) (!  (=> (and (and (<= left i_1@@1) (<= i_1@@1 right)) (< NoPerm FullPerm)) (and (qpRange9 (loc a_3@@1 i_1@@1)) (= (invRecv9 (loc a_3@@1 i_1@@1)) i_1@@1)))
 :qid |stdinbpl.2054:22|
 :skolemid |148|
 :pattern ( (loc a_3@@1 i_1@@1))
 :pattern ( (loc a_3@@1 i_1@@1))
)) (=> (and (forall ((o_3@@23 T@U) ) (!  (=> (= (type o_3@@23) RefType) (=> (and (and (and (<= left (invRecv9 o_3@@23)) (<= (invRecv9 o_3@@23) right)) (< NoPerm FullPerm)) (qpRange9 o_3@@23)) (= (loc a_3@@1 (invRecv9 o_3@@23)) o_3@@23)))
 :qid |stdinbpl.2058:22|
 :skolemid |149|
 :pattern ( (invRecv9 o_3@@23))
)) (forall ((i_1@@2 Int) ) (!  (=> (and (<= left i_1@@2) (<= i_1@@2 right)) (not (= (loc a_3@@1 i_1@@2) null)))
 :qid |stdinbpl.2064:22|
 :skolemid |150|
 :pattern ( (loc a_3@@1 i_1@@2))
 :pattern ( (loc a_3@@1 i_1@@2))
))) (=> (and (and (forall ((o_3@@24 T@U) ) (!  (=> (= (type o_3@@24) RefType) (and (=> (and (and (and (<= left (invRecv9 o_3@@24)) (<= (invRecv9 o_3@@24) right)) (< NoPerm FullPerm)) (qpRange9 o_3@@24)) (and (=> (< NoPerm FullPerm) (= (loc a_3@@1 (invRecv9 o_3@@24)) o_3@@24)) (= (U_2_real (MapType1Select QPMask@0 o_3@@24 val)) (+ (U_2_real (MapType1Select ZeroMask o_3@@24 val)) FullPerm)))) (=> (not (and (and (and (<= left (invRecv9 o_3@@24)) (<= (invRecv9 o_3@@24) right)) (< NoPerm FullPerm)) (qpRange9 o_3@@24))) (= (U_2_real (MapType1Select QPMask@0 o_3@@24 val)) (U_2_real (MapType1Select ZeroMask o_3@@24 val))))))
 :qid |stdinbpl.2070:22|
 :skolemid |151|
 :pattern ( (MapType1Select QPMask@0 o_3@@24 val))
)) (forall ((o_3@@25 T@U) (f_5@@7 T@U) ) (! (let ((B@@19 (FieldTypeInv1 (type f_5@@7))))
(let ((A@@20 (FieldTypeInv0 (type f_5@@7))))
 (=> (and (and (= (type o_3@@25) RefType) (= (type f_5@@7) (FieldType A@@20 B@@19))) (not (= f_5@@7 val))) (= (U_2_real (MapType1Select ZeroMask o_3@@25 f_5@@7)) (U_2_real (MapType1Select QPMask@0 o_3@@25 f_5@@7))))))
 :qid |stdinbpl.2074:29|
 :skolemid |152|
 :pattern ( (MapType1Select ZeroMask o_3@@25 f_5@@7))
 :pattern ( (MapType1Select QPMask@0 o_3@@25 f_5@@7))
))) (and (state Heap@@13 QPMask@0) (state Heap@@13 QPMask@0))) (and (and (=> (= (ControlFlow 0 155) 154) anon78_Then_correct) (=> (= (ControlFlow 0 155) 52) anon91_Then_correct)) (=> (= (ControlFlow 0 155) 104) anon91_Else_correct)))))))))
(let ((anon77_Then_correct true))
(let ((anon0_correct  (=> (state Heap@@13 ZeroMask) (=> (and (and (and (= AssumeFunctionsAbove (- 0 1)) (<= 0 left)) (and (<= left right) (< right (len a_3@@1)))) (and (and (state Heap@@13 ZeroMask) (<= left n@@13)) (and (<= n@@13 right) (state Heap@@13 ZeroMask)))) (and (=> (= (ControlFlow 0 157) 1) anon77_Then_correct) (=> (= (ControlFlow 0 157) 155) anon77_Else_correct))))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 158) 157) anon0_correct)))
PreconditionGeneratedEntry_correct)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
))
(check-sat)
(pop 1)
; Valid
(get-info :rlimit)
