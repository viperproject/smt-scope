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
(declare-fun i_12 () Int)
(declare-fun right () Int)
(declare-fun QPMask@7 () T@U)
(declare-fun a_3@@1 () T@U)
(declare-fun pw () T@U)
(declare-fun QPMask@0 () T@U)
(declare-fun PostHeap@0 () T@U)
(declare-fun i_11 () Int)
(declare-fun k () Int)
(declare-fun i_10 () Int)
(declare-fun storeIndex () Int)
(declare-fun i_9 () Int)
(declare-fun i_4 () Int)
(declare-fun qpRange2 (T@U) Bool)
(declare-fun invRecv2 (T@U) Int)
(declare-fun pivotIndex () Int)
(declare-fun Heap@@13 () T@U)
(declare-fun i$0_1 () Int)
(declare-fun QPMask@6 () T@U)
(declare-fun pw@2 () T@U)
(declare-fun ExhaleHeap@1 () T@U)
(declare-fun i_18 () Int)
(declare-fun k_2 () Int)
(declare-fun i_17 () Int)
(declare-fun storeIndex@0 () Int)
(declare-fun j@0 () Int)
(declare-fun pivotValue@0 () Int)
(declare-fun i_16 () Int)
(declare-fun i_15 () Int)
(declare-fun qpRange5 (T@U) Bool)
(declare-fun invRecv5 (T@U) Int)
(declare-fun QPMask@1 () T@U)
(declare-fun i$0_5 () Int)
(declare-fun Heap@0 () T@U)
(declare-fun pw@5 () T@U)
(declare-fun i_56 () Int)
(declare-fun k_9 () Int)
(declare-fun i_54 () Int)
(declare-fun storeIndex@2 () Int)
(declare-fun j@1 () Int)
(declare-fun i_52 () Int)
(declare-fun i_50 () Int)
(declare-fun Mask@18 () T@U)
(declare-fun neverTriggered7 (Int) Bool)
(declare-fun qpRange7 (T@U) Bool)
(declare-fun invRecv7 (T@U) Int)
(declare-fun QPMask@5 () T@U)
(declare-fun ExhaleHeap@4 () T@U)
(declare-fun Mask@17 () T@U)
(declare-fun pw@4 () T@U)
(declare-fun storeIndex@1 () Int)
(declare-fun Mask@15 () T@U)
(declare-fun Mask@16 () T@U)
(declare-fun Mask@14 () T@U)
(declare-fun Mask@13 () T@U)
(declare-fun Mask@12 () T@U)
(declare-fun QPMask@2 () T@U)
(declare-fun qpRange6 (T@U) Bool)
(declare-fun invRecv6 (T@U) Int)
(declare-fun i_23 () Int)
(declare-fun ExhaleHeap@2 () T@U)
(declare-fun pw@3 () T@U)
(declare-fun i_21 () Int)
(declare-fun k_2_1 () Int)
(declare-fun i_19 () Int)
(declare-fun i_17_1 () Int)
(declare-fun i_15_1 () Int)
(declare-fun Mask@11 () T@U)
(declare-fun neverTriggered3 (Int) Bool)
(declare-fun qpRange3 (T@U) Bool)
(declare-fun invRecv3 (T@U) Int)
(declare-fun QPMask@4 () T@U)
(declare-fun Mask@9 () T@U)
(declare-fun Mask@10 () T@U)
(declare-fun Mask@8 () T@U)
(declare-fun Mask@7 () T@U)
(declare-fun Mask@6 () T@U)
(declare-fun QPMask@3 () T@U)
(declare-fun qpRange8 (T@U) Bool)
(declare-fun invRecv8 (T@U) Int)
(declare-fun pw@1 () T@U)
(declare-fun ExhaleHeap@0 () T@U)
(declare-fun i$0 () Int)
(declare-fun i_32 () Int)
(declare-fun k_4 () Int)
(declare-fun i_30 () Int)
(declare-fun i_28 () Int)
(declare-fun i_26 () Int)
(declare-fun Mask@5 () T@U)
(declare-fun pw@0 () T@U)
(declare-fun neverTriggered4 (Int) Bool)
(declare-fun qpRange4 (T@U) Bool)
(declare-fun invRecv4 (T@U) Int)
(declare-fun Mask@3 () T@U)
(declare-fun Mask@4 () T@U)
(declare-fun Mask@2 () T@U)
(declare-fun Mask@1 () T@U)
(declare-fun Mask@0 () T@U)
(declare-fun qpRange1 (T@U) Bool)
(declare-fun invRecv1 (T@U) Int)
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (= (type ExhaleHeap@0) (MapType0Type RefType)) (= (type a_3@@1) IArrayDomainTypeType)) (= (type pw@1) (SeqType intType))) (= (type Heap@@13) (MapType0Type RefType))) (= (type ExhaleHeap@2) (MapType0Type RefType))) (= (type pw@3) (SeqType intType))) (= (type ExhaleHeap@1) (MapType0Type RefType))) (= (type Mask@11) (MapType1Type RefType realType))) (= (type pw@2) (SeqType intType))) (= (type QPMask@4) (MapType1Type RefType realType))) (= (type Mask@10) (MapType1Type RefType realType))) (= (type Mask@9) (MapType1Type RefType realType))) (= (type Mask@8) (MapType1Type RefType realType))) (= (type Mask@6) (MapType1Type RefType realType))) (= (type Mask@7) (MapType1Type RefType realType))) (= (type QPMask@3) (MapType1Type RefType realType))) (= (type QPMask@1) (MapType1Type RefType realType))) (= (type Heap@0) (MapType0Type RefType))) (= (type pw@5) (SeqType intType))) (= (type Mask@18) (MapType1Type RefType realType))) (= (type QPMask@5) (MapType1Type RefType realType))) (= (type QPMask@2) (MapType1Type RefType realType))) (= (type ExhaleHeap@4) (MapType0Type RefType))) (= (type Mask@17) (MapType1Type RefType realType))) (= (type pw@4) (SeqType intType))) (= (type Mask@16) (MapType1Type RefType realType))) (= (type Mask@15) (MapType1Type RefType realType))) (= (type Mask@14) (MapType1Type RefType realType))) (= (type Mask@12) (MapType1Type RefType realType))) (= (type Mask@13) (MapType1Type RefType realType))) (= (type QPMask@6) (MapType1Type RefType realType))) (= (type QPMask@0) (MapType1Type RefType realType))) (= (type Mask@5) (MapType1Type RefType realType))) (= (type pw@0) (SeqType intType))) (= (type Mask@4) (MapType1Type RefType realType))) (= (type Mask@3) (MapType1Type RefType realType))) (= (type Mask@2) (MapType1Type RefType realType))) (= (type Mask@0) (MapType1Type RefType realType))) (= (type Mask@1) (MapType1Type RefType realType))) (= (type QPMask@7) (MapType1Type RefType realType))) (= (type pw) (SeqType intType))) (= (type PostHeap@0) (MapType0Type RefType))))
(set-info :boogie-vc-id partition)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 266) (let ((anon25_correct true))
(let ((anon154_Else_correct  (=> (and (not (and (<= left i_12) (<= i_12 right))) (= (ControlFlow 0 253) 247)) anon25_correct)))
(let ((anon154_Then_correct  (=> (and (<= left i_12) (<= i_12 right)) (and (=> (= (ControlFlow 0 248) (- 0 252)) (HasDirectPerm QPMask@7 (loc a_3@@1 i_12) val)) (=> (HasDirectPerm QPMask@7 (loc a_3@@1 i_12) val) (and (=> (= (ControlFlow 0 248) (- 0 251)) (>= i_12 0)) (=> (>= i_12 0) (and (=> (= (ControlFlow 0 248) (- 0 250)) (< i_12 (|Seq#Length| pw))) (=> (< i_12 (|Seq#Length| pw)) (and (=> (= (ControlFlow 0 248) (- 0 249)) (HasDirectPerm QPMask@0 (loc a_3@@1 (U_2_int (|Seq#Index| pw i_12))) val)) (=> (HasDirectPerm QPMask@0 (loc a_3@@1 (U_2_int (|Seq#Index| pw i_12))) val) (=> (= (ControlFlow 0 248) 247) anon25_correct))))))))))))
(let ((anon153_Else_correct true))
(let ((anon151_Else_correct  (=> (and (forall ((i_11_1 Int) (k_1 Int) ) (!  (=> (and (<= left i_11_1) (and (< i_11_1 k_1) (<= k_1 right))) (not (= (U_2_int (|Seq#Index| pw i_11_1)) (U_2_int (|Seq#Index| pw k_1)))))
 :qid |stdinbpl.1080:20|
 :skolemid |79|
 :pattern ( (|Seq#Index| pw i_11_1) (|Seq#Index| pw k_1))
)) (state PostHeap@0 QPMask@7)) (and (and (=> (= (ControlFlow 0 254) 246) anon153_Else_correct) (=> (= (ControlFlow 0 254) 248) anon154_Then_correct)) (=> (= (ControlFlow 0 254) 253) anon154_Else_correct)))))
(let ((anon21_correct true))
(let ((anon152_Else_correct  (=> (and (not (and (<= left i_11) (and (< i_11 k) (<= k right)))) (= (ControlFlow 0 245) 239)) anon21_correct)))
(let ((anon152_Then_correct  (=> (and (<= left i_11) (and (< i_11 k) (<= k right))) (and (=> (= (ControlFlow 0 240) (- 0 244)) (>= i_11 0)) (=> (>= i_11 0) (and (=> (= (ControlFlow 0 240) (- 0 243)) (< i_11 (|Seq#Length| pw))) (=> (< i_11 (|Seq#Length| pw)) (and (=> (= (ControlFlow 0 240) (- 0 242)) (>= k 0)) (=> (>= k 0) (and (=> (= (ControlFlow 0 240) (- 0 241)) (< k (|Seq#Length| pw))) (=> (< k (|Seq#Length| pw)) (=> (= (ControlFlow 0 240) 239) anon21_correct))))))))))))
(let ((anon148_Else_correct  (=> (and (forall ((i_9_1 Int) ) (!  (=> (and (<= left i_9_1) (<= i_9_1 right)) (and (<= left (U_2_int (|Seq#Index| pw i_9_1))) (<= (U_2_int (|Seq#Index| pw i_9_1)) right)))
 :qid |stdinbpl.1060:20|
 :skolemid |78|
 :pattern ( (|Seq#Index| pw i_9_1))
)) (state PostHeap@0 QPMask@7)) (and (and (=> (= (ControlFlow 0 255) 254) anon151_Else_correct) (=> (= (ControlFlow 0 255) 240) anon152_Then_correct)) (=> (= (ControlFlow 0 255) 245) anon152_Else_correct)))))
(let ((anon17_correct true))
(let ((anon150_Else_correct  (=> (and (< (U_2_int (|Seq#Index| pw i_10)) left) (= (ControlFlow 0 235) 230)) anon17_correct)))
(let ((anon150_Then_correct  (=> (<= left (U_2_int (|Seq#Index| pw i_10))) (and (=> (= (ControlFlow 0 232) (- 0 234)) (>= i_10 0)) (=> (>= i_10 0) (and (=> (= (ControlFlow 0 232) (- 0 233)) (< i_10 (|Seq#Length| pw))) (=> (< i_10 (|Seq#Length| pw)) (=> (= (ControlFlow 0 232) 230) anon17_correct))))))))
(let ((anon149_Then_correct  (=> (and (<= left i_10) (<= i_10 right)) (and (=> (= (ControlFlow 0 236) (- 0 238)) (>= i_10 0)) (=> (>= i_10 0) (and (=> (= (ControlFlow 0 236) (- 0 237)) (< i_10 (|Seq#Length| pw))) (=> (< i_10 (|Seq#Length| pw)) (and (=> (= (ControlFlow 0 236) 232) anon150_Then_correct) (=> (= (ControlFlow 0 236) 235) anon150_Else_correct)))))))))
(let ((anon149_Else_correct  (=> (and (not (and (<= left i_10) (<= i_10 right))) (= (ControlFlow 0 231) 230)) anon17_correct)))
(let ((anon146_Else_correct  (=> (and (and (forall ((i_7 Int) ) (!  (=> (and (< storeIndex i_7) (<= i_7 right)) (<= (U_2_int (MapType0Select PostHeap@0 (loc a_3@@1 storeIndex) val)) (U_2_int (MapType0Select PostHeap@0 (loc a_3@@1 i_7) val))))
 :qid |stdinbpl.1036:20|
 :skolemid |77|
 :pattern ( (loc a_3@@1 i_7))
)) (state PostHeap@0 QPMask@7)) (and (= (|Seq#Length| pw) (+ right 1)) (state PostHeap@0 QPMask@7))) (and (and (=> (= (ControlFlow 0 256) 255) anon148_Else_correct) (=> (= (ControlFlow 0 256) 236) anon149_Then_correct)) (=> (= (ControlFlow 0 256) 231) anon149_Else_correct)))))
(let ((anon12_correct true))
(let ((anon147_Else_correct  (=> (and (not (and (< storeIndex i_9) (<= i_9 right))) (= (ControlFlow 0 229) 225)) anon12_correct)))
(let ((anon147_Then_correct  (=> (and (< storeIndex i_9) (<= i_9 right)) (and (=> (= (ControlFlow 0 226) (- 0 228)) (HasDirectPerm QPMask@7 (loc a_3@@1 storeIndex) val)) (=> (HasDirectPerm QPMask@7 (loc a_3@@1 storeIndex) val) (and (=> (= (ControlFlow 0 226) (- 0 227)) (HasDirectPerm QPMask@7 (loc a_3@@1 i_9) val)) (=> (HasDirectPerm QPMask@7 (loc a_3@@1 i_9) val) (=> (= (ControlFlow 0 226) 225) anon12_correct))))))))
(let ((anon144_Else_correct  (=> (and (forall ((i_5 Int) ) (!  (=> (and (<= left i_5) (< i_5 storeIndex)) (< (U_2_int (MapType0Select PostHeap@0 (loc a_3@@1 i_5) val)) (U_2_int (MapType0Select PostHeap@0 (loc a_3@@1 storeIndex) val))))
 :qid |stdinbpl.1020:20|
 :skolemid |76|
 :pattern ( (loc a_3@@1 i_5))
)) (state PostHeap@0 QPMask@7)) (and (and (=> (= (ControlFlow 0 257) 256) anon146_Else_correct) (=> (= (ControlFlow 0 257) 226) anon147_Then_correct)) (=> (= (ControlFlow 0 257) 229) anon147_Else_correct)))))
(let ((anon8_correct true))
(let ((anon145_Else_correct  (=> (and (not (and (<= left i_4) (< i_4 storeIndex))) (= (ControlFlow 0 224) 220)) anon8_correct)))
(let ((anon145_Then_correct  (=> (and (<= left i_4) (< i_4 storeIndex)) (and (=> (= (ControlFlow 0 221) (- 0 223)) (HasDirectPerm QPMask@7 (loc a_3@@1 i_4) val)) (=> (HasDirectPerm QPMask@7 (loc a_3@@1 i_4) val) (and (=> (= (ControlFlow 0 221) (- 0 222)) (HasDirectPerm QPMask@7 (loc a_3@@1 storeIndex) val)) (=> (HasDirectPerm QPMask@7 (loc a_3@@1 storeIndex) val) (=> (= (ControlFlow 0 221) 220) anon8_correct))))))))
(let ((anon143_Else_correct  (and (=> (= (ControlFlow 0 258) (- 0 261)) (forall ((i_3 Int) (i_3_1 Int) ) (!  (=> (and (and (and (and (not (= i_3 i_3_1)) (and (<= left i_3) (<= i_3 right))) (and (<= left i_3_1) (<= i_3_1 right))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (loc a_3@@1 i_3) (loc a_3@@1 i_3_1))))
 :qid |stdinbpl.968:15|
 :skolemid |70|
))) (=> (forall ((i_3@@0 Int) (i_3_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_3@@0 i_3_1@@0)) (and (<= left i_3@@0) (<= i_3@@0 right))) (and (<= left i_3_1@@0) (<= i_3_1@@0 right))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (loc a_3@@1 i_3@@0) (loc a_3@@1 i_3_1@@0))))
 :qid |stdinbpl.968:15|
 :skolemid |70|
)) (=> (forall ((i_3@@1 Int) ) (!  (=> (and (and (<= left i_3@@1) (<= i_3@@1 right)) (< NoPerm FullPerm)) (and (qpRange2 (loc a_3@@1 i_3@@1)) (= (invRecv2 (loc a_3@@1 i_3@@1)) i_3@@1)))
 :qid |stdinbpl.974:22|
 :skolemid |71|
 :pattern ( (loc a_3@@1 i_3@@1))
 :pattern ( (loc a_3@@1 i_3@@1))
)) (=> (and (forall ((o_3 T@U) ) (!  (=> (= (type o_3) RefType) (=> (and (and (and (<= left (invRecv2 o_3)) (<= (invRecv2 o_3) right)) (< NoPerm FullPerm)) (qpRange2 o_3)) (= (loc a_3@@1 (invRecv2 o_3)) o_3)))
 :qid |stdinbpl.978:22|
 :skolemid |72|
 :pattern ( (invRecv2 o_3))
)) (forall ((i_3@@2 Int) ) (!  (=> (and (<= left i_3@@2) (<= i_3@@2 right)) (not (= (loc a_3@@1 i_3@@2) null)))
 :qid |stdinbpl.984:22|
 :skolemid |73|
 :pattern ( (loc a_3@@1 i_3@@2))
 :pattern ( (loc a_3@@1 i_3@@2))
))) (=> (and (and (forall ((o_3@@0 T@U) ) (!  (=> (= (type o_3@@0) RefType) (and (=> (and (and (and (<= left (invRecv2 o_3@@0)) (<= (invRecv2 o_3@@0) right)) (< NoPerm FullPerm)) (qpRange2 o_3@@0)) (and (=> (< NoPerm FullPerm) (= (loc a_3@@1 (invRecv2 o_3@@0)) o_3@@0)) (= (U_2_real (MapType1Select QPMask@7 o_3@@0 val)) (+ (U_2_real (MapType1Select ZeroMask o_3@@0 val)) FullPerm)))) (=> (not (and (and (and (<= left (invRecv2 o_3@@0)) (<= (invRecv2 o_3@@0) right)) (< NoPerm FullPerm)) (qpRange2 o_3@@0))) (= (U_2_real (MapType1Select QPMask@7 o_3@@0 val)) (U_2_real (MapType1Select ZeroMask o_3@@0 val))))))
 :qid |stdinbpl.990:22|
 :skolemid |74|
 :pattern ( (MapType1Select QPMask@7 o_3@@0 val))
)) (forall ((o_3@@1 T@U) (f_5 T@U) ) (! (let ((B@@11 (FieldTypeInv1 (type f_5))))
(let ((A@@12 (FieldTypeInv0 (type f_5))))
 (=> (and (and (= (type o_3@@1) RefType) (= (type f_5) (FieldType A@@12 B@@11))) (not (= f_5 val))) (= (U_2_real (MapType1Select ZeroMask o_3@@1 f_5)) (U_2_real (MapType1Select QPMask@7 o_3@@1 f_5))))))
 :qid |stdinbpl.994:29|
 :skolemid |75|
 :pattern ( (MapType1Select ZeroMask o_3@@1 f_5))
 :pattern ( (MapType1Select QPMask@7 o_3@@1 f_5))
))) (and (state PostHeap@0 QPMask@7) (state PostHeap@0 QPMask@7))) (and (=> (= (ControlFlow 0 258) (- 0 260)) (HasDirectPerm QPMask@7 (loc a_3@@1 storeIndex) val)) (=> (HasDirectPerm QPMask@7 (loc a_3@@1 storeIndex) val) (and (=> (= (ControlFlow 0 258) (- 0 259)) (HasDirectPerm QPMask@0 (loc a_3@@1 pivotIndex) val)) (=> (HasDirectPerm QPMask@0 (loc a_3@@1 pivotIndex) val) (=> (and (= (U_2_int (MapType0Select PostHeap@0 (loc a_3@@1 storeIndex) val)) (U_2_int (MapType0Select Heap@@13 (loc a_3@@1 pivotIndex) val))) (state PostHeap@0 QPMask@7)) (and (and (=> (= (ControlFlow 0 258) 257) anon144_Else_correct) (=> (= (ControlFlow 0 258) 221) anon145_Then_correct)) (=> (= (ControlFlow 0 258) 224) anon145_Else_correct))))))))))))))
(let ((anon143_Then_correct true))
(let ((anon142_Then_correct  (=> (and (and (state PostHeap@0 ZeroMask) (<= left storeIndex)) (and (<= storeIndex right) (state PostHeap@0 ZeroMask))) (and (=> (= (ControlFlow 0 262) 219) anon143_Then_correct) (=> (= (ControlFlow 0 262) 258) anon143_Else_correct)))))
(let ((anon78_correct true))
(let ((anon181_Else_correct  (=> (and (not (and (<= left i$0_1) (<= i$0_1 right))) (= (ControlFlow 0 173) 167)) anon78_correct)))
(let ((anon181_Then_correct  (=> (and (<= left i$0_1) (<= i$0_1 right)) (and (=> (= (ControlFlow 0 168) (- 0 172)) (HasDirectPerm QPMask@6 (loc a_3@@1 i$0_1) val)) (=> (HasDirectPerm QPMask@6 (loc a_3@@1 i$0_1) val) (and (=> (= (ControlFlow 0 168) (- 0 171)) (>= i$0_1 0)) (=> (>= i$0_1 0) (and (=> (= (ControlFlow 0 168) (- 0 170)) (< i$0_1 (|Seq#Length| pw@2))) (=> (< i$0_1 (|Seq#Length| pw@2)) (and (=> (= (ControlFlow 0 168) (- 0 169)) (HasDirectPerm QPMask@0 (loc a_3@@1 (U_2_int (|Seq#Index| pw@2 i$0_1))) val)) (=> (HasDirectPerm QPMask@0 (loc a_3@@1 (U_2_int (|Seq#Index| pw@2 i$0_1))) val) (=> (= (ControlFlow 0 168) 167) anon78_correct))))))))))))
(let ((anon180_Else_correct true))
(let ((anon178_Else_correct  (=> (and (forall ((i_43 Int) (k_7 Int) ) (!  (=> (and (<= left i_43) (and (< i_43 k_7) (<= k_7 right))) (not (= (U_2_int (|Seq#Index| pw@2 i_43)) (U_2_int (|Seq#Index| pw@2 k_7)))))
 :qid |stdinbpl.1439:24|
 :skolemid |101|
 :pattern ( (|Seq#Index| pw@2 i_43) (|Seq#Index| pw@2 k_7))
)) (state ExhaleHeap@1 QPMask@6)) (and (and (=> (= (ControlFlow 0 174) 166) anon180_Else_correct) (=> (= (ControlFlow 0 174) 168) anon181_Then_correct)) (=> (= (ControlFlow 0 174) 173) anon181_Else_correct)))))
(let ((anon74_correct true))
(let ((anon179_Else_correct  (=> (and (not (and (<= left i_18) (and (< i_18 k_2) (<= k_2 right)))) (= (ControlFlow 0 165) 159)) anon74_correct)))
(let ((anon179_Then_correct  (=> (and (<= left i_18) (and (< i_18 k_2) (<= k_2 right))) (and (=> (= (ControlFlow 0 160) (- 0 164)) (>= i_18 0)) (=> (>= i_18 0) (and (=> (= (ControlFlow 0 160) (- 0 163)) (< i_18 (|Seq#Length| pw@2))) (=> (< i_18 (|Seq#Length| pw@2)) (and (=> (= (ControlFlow 0 160) (- 0 162)) (>= k_2 0)) (=> (>= k_2 0) (and (=> (= (ControlFlow 0 160) (- 0 161)) (< k_2 (|Seq#Length| pw@2))) (=> (< k_2 (|Seq#Length| pw@2)) (=> (= (ControlFlow 0 160) 159) anon74_correct))))))))))))
(let ((anon175_Else_correct  (=> (and (forall ((i_41 Int) ) (!  (=> (and (<= left i_41) (<= i_41 right)) (and (<= left (U_2_int (|Seq#Index| pw@2 i_41))) (<= (U_2_int (|Seq#Index| pw@2 i_41)) right)))
 :qid |stdinbpl.1419:24|
 :skolemid |100|
 :pattern ( (|Seq#Index| pw@2 i_41))
)) (state ExhaleHeap@1 QPMask@6)) (and (and (=> (= (ControlFlow 0 175) 174) anon178_Else_correct) (=> (= (ControlFlow 0 175) 160) anon179_Then_correct)) (=> (= (ControlFlow 0 175) 165) anon179_Else_correct)))))
(let ((anon70_correct true))
(let ((anon177_Else_correct  (=> (and (< (U_2_int (|Seq#Index| pw@2 i_17)) left) (= (ControlFlow 0 155) 150)) anon70_correct)))
(let ((anon177_Then_correct  (=> (<= left (U_2_int (|Seq#Index| pw@2 i_17))) (and (=> (= (ControlFlow 0 152) (- 0 154)) (>= i_17 0)) (=> (>= i_17 0) (and (=> (= (ControlFlow 0 152) (- 0 153)) (< i_17 (|Seq#Length| pw@2))) (=> (< i_17 (|Seq#Length| pw@2)) (=> (= (ControlFlow 0 152) 150) anon70_correct))))))))
(let ((anon176_Then_correct  (=> (and (<= left i_17) (<= i_17 right)) (and (=> (= (ControlFlow 0 156) (- 0 158)) (>= i_17 0)) (=> (>= i_17 0) (and (=> (= (ControlFlow 0 156) (- 0 157)) (< i_17 (|Seq#Length| pw@2))) (=> (< i_17 (|Seq#Length| pw@2)) (and (=> (= (ControlFlow 0 156) 152) anon177_Then_correct) (=> (= (ControlFlow 0 156) 155) anon177_Else_correct)))))))))
(let ((anon176_Else_correct  (=> (and (not (and (<= left i_17) (<= i_17 right))) (= (ControlFlow 0 151) 150)) anon70_correct)))
(let ((anon173_Else_correct  (=> (and (and (forall ((i_39 Int) ) (!  (=> (and (<= storeIndex@0 i_39) (< i_39 j@0)) (<= pivotValue@0 (U_2_int (MapType0Select ExhaleHeap@1 (loc a_3@@1 i_39) val))))
 :qid |stdinbpl.1395:24|
 :skolemid |99|
 :pattern ( (loc a_3@@1 i_39))
)) (state ExhaleHeap@1 QPMask@6)) (and (= (|Seq#Length| pw@2) (+ right 1)) (state ExhaleHeap@1 QPMask@6))) (and (and (=> (= (ControlFlow 0 176) 175) anon175_Else_correct) (=> (= (ControlFlow 0 176) 156) anon176_Then_correct)) (=> (= (ControlFlow 0 176) 151) anon176_Else_correct)))))
(let ((anon65_correct true))
(let ((anon174_Else_correct  (=> (and (not (and (<= storeIndex@0 i_16) (< i_16 j@0))) (= (ControlFlow 0 149) 146)) anon65_correct)))
(let ((anon174_Then_correct  (=> (and (<= storeIndex@0 i_16) (< i_16 j@0)) (and (=> (= (ControlFlow 0 147) (- 0 148)) (HasDirectPerm QPMask@6 (loc a_3@@1 i_16) val)) (=> (HasDirectPerm QPMask@6 (loc a_3@@1 i_16) val) (=> (= (ControlFlow 0 147) 146) anon65_correct))))))
(let ((anon171_Else_correct  (=> (and (forall ((i_37 Int) ) (!  (=> (and (<= left i_37) (< i_37 storeIndex@0)) (< (U_2_int (MapType0Select ExhaleHeap@1 (loc a_3@@1 i_37) val)) pivotValue@0))
 :qid |stdinbpl.1381:24|
 :skolemid |98|
 :pattern ( (loc a_3@@1 i_37))
)) (state ExhaleHeap@1 QPMask@6)) (and (and (=> (= (ControlFlow 0 177) 176) anon173_Else_correct) (=> (= (ControlFlow 0 177) 147) anon174_Then_correct)) (=> (= (ControlFlow 0 177) 149) anon174_Else_correct)))))
(let ((anon61_correct true))
(let ((anon172_Else_correct  (=> (and (not (and (<= left i_15) (< i_15 storeIndex@0))) (= (ControlFlow 0 145) 142)) anon61_correct)))
(let ((anon172_Then_correct  (=> (and (<= left i_15) (< i_15 storeIndex@0)) (and (=> (= (ControlFlow 0 143) (- 0 144)) (HasDirectPerm QPMask@6 (loc a_3@@1 i_15) val)) (=> (HasDirectPerm QPMask@6 (loc a_3@@1 i_15) val) (=> (= (ControlFlow 0 143) 142) anon61_correct))))))
(let ((anon170_Else_correct  (and (=> (= (ControlFlow 0 178) (- 0 180)) (forall ((i_35 Int) (i_35_1 Int) ) (!  (=> (and (and (and (and (not (= i_35 i_35_1)) (and (<= left i_35) (<= i_35 right))) (and (<= left i_35_1) (<= i_35_1 right))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (loc a_3@@1 i_35) (loc a_3@@1 i_35_1))))
 :qid |stdinbpl.1333:19|
 :skolemid |92|
))) (=> (forall ((i_35@@0 Int) (i_35_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_35@@0 i_35_1@@0)) (and (<= left i_35@@0) (<= i_35@@0 right))) (and (<= left i_35_1@@0) (<= i_35_1@@0 right))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (loc a_3@@1 i_35@@0) (loc a_3@@1 i_35_1@@0))))
 :qid |stdinbpl.1333:19|
 :skolemid |92|
)) (=> (forall ((i_35@@1 Int) ) (!  (=> (and (and (<= left i_35@@1) (<= i_35@@1 right)) (< NoPerm FullPerm)) (and (qpRange5 (loc a_3@@1 i_35@@1)) (= (invRecv5 (loc a_3@@1 i_35@@1)) i_35@@1)))
 :qid |stdinbpl.1339:26|
 :skolemid |93|
 :pattern ( (loc a_3@@1 i_35@@1))
 :pattern ( (loc a_3@@1 i_35@@1))
)) (=> (and (forall ((o_3@@2 T@U) ) (!  (=> (= (type o_3@@2) RefType) (=> (and (and (and (<= left (invRecv5 o_3@@2)) (<= (invRecv5 o_3@@2) right)) (< NoPerm FullPerm)) (qpRange5 o_3@@2)) (= (loc a_3@@1 (invRecv5 o_3@@2)) o_3@@2)))
 :qid |stdinbpl.1343:26|
 :skolemid |94|
 :pattern ( (invRecv5 o_3@@2))
)) (forall ((i_35@@2 Int) ) (!  (=> (and (<= left i_35@@2) (<= i_35@@2 right)) (not (= (loc a_3@@1 i_35@@2) null)))
 :qid |stdinbpl.1349:26|
 :skolemid |95|
 :pattern ( (loc a_3@@1 i_35@@2))
 :pattern ( (loc a_3@@1 i_35@@2))
))) (=> (and (and (forall ((o_3@@3 T@U) ) (!  (=> (= (type o_3@@3) RefType) (and (=> (and (and (and (<= left (invRecv5 o_3@@3)) (<= (invRecv5 o_3@@3) right)) (< NoPerm FullPerm)) (qpRange5 o_3@@3)) (and (=> (< NoPerm FullPerm) (= (loc a_3@@1 (invRecv5 o_3@@3)) o_3@@3)) (= (U_2_real (MapType1Select QPMask@6 o_3@@3 val)) (+ (U_2_real (MapType1Select QPMask@1 o_3@@3 val)) FullPerm)))) (=> (not (and (and (and (<= left (invRecv5 o_3@@3)) (<= (invRecv5 o_3@@3) right)) (< NoPerm FullPerm)) (qpRange5 o_3@@3))) (= (U_2_real (MapType1Select QPMask@6 o_3@@3 val)) (U_2_real (MapType1Select QPMask@1 o_3@@3 val))))))
 :qid |stdinbpl.1355:26|
 :skolemid |96|
 :pattern ( (MapType1Select QPMask@6 o_3@@3 val))
)) (forall ((o_3@@4 T@U) (f_5@@0 T@U) ) (! (let ((B@@12 (FieldTypeInv1 (type f_5@@0))))
(let ((A@@13 (FieldTypeInv0 (type f_5@@0))))
 (=> (and (and (= (type o_3@@4) RefType) (= (type f_5@@0) (FieldType A@@13 B@@12))) (not (= f_5@@0 val))) (= (U_2_real (MapType1Select QPMask@1 o_3@@4 f_5@@0)) (U_2_real (MapType1Select QPMask@6 o_3@@4 f_5@@0))))))
 :qid |stdinbpl.1359:33|
 :skolemid |97|
 :pattern ( (MapType1Select QPMask@1 o_3@@4 f_5@@0))
 :pattern ( (MapType1Select QPMask@6 o_3@@4 f_5@@0))
))) (and (state ExhaleHeap@1 QPMask@6) (state ExhaleHeap@1 QPMask@6))) (and (=> (= (ControlFlow 0 178) (- 0 179)) (HasDirectPerm QPMask@6 (loc a_3@@1 right) val)) (=> (HasDirectPerm QPMask@6 (loc a_3@@1 right) val) (=> (and (= (U_2_int (MapType0Select ExhaleHeap@1 (loc a_3@@1 right) val)) pivotValue@0) (state ExhaleHeap@1 QPMask@6)) (and (and (=> (= (ControlFlow 0 178) 177) anon171_Else_correct) (=> (= (ControlFlow 0 178) 143) anon172_Then_correct)) (=> (= (ControlFlow 0 178) 145) anon172_Else_correct))))))))))))
(let ((anon170_Then_correct true))
(let ((anon169_Then_correct  (=> (and (<= left j@0) (<= j@0 right)) (=> (and (and (state ExhaleHeap@1 QPMask@1) (<= left storeIndex@0)) (and (<= storeIndex@0 j@0) (state ExhaleHeap@1 QPMask@1))) (and (=> (= (ControlFlow 0 181) 141) anon170_Then_correct) (=> (= (ControlFlow 0 181) 178) anon170_Else_correct))))))
(let ((anon110_correct true))
(let ((anon197_Else_correct  (=> (and (not (and (<= left i$0_5) (<= i$0_5 right))) (= (ControlFlow 0 100) 97)) anon110_correct)))
(let ((anon197_Then_correct  (=> (and (<= left i$0_5) (<= i$0_5 right)) (and (=> (= (ControlFlow 0 98) (- 0 99)) (= (U_2_int (MapType0Select Heap@0 (loc a_3@@1 i$0_5) val)) (U_2_int (MapType0Select Heap@@13 (loc a_3@@1 (U_2_int (|Seq#Index| pw@5 i$0_5))) val)))) (=> (= (U_2_int (MapType0Select Heap@0 (loc a_3@@1 i$0_5) val)) (U_2_int (MapType0Select Heap@@13 (loc a_3@@1 (U_2_int (|Seq#Index| pw@5 i$0_5))) val))) (=> (= (ControlFlow 0 98) 97) anon110_correct))))))
(let ((anon196_Else_correct true))
(let ((anon194_Else_correct  (=> (forall ((i_57_1 Int) (k_10_1 Int) ) (!  (=> (and (<= left i_57_1) (and (< i_57_1 k_10_1) (<= k_10_1 right))) (not (= (U_2_int (|Seq#Index| pw@5 i_57_1)) (U_2_int (|Seq#Index| pw@5 k_10_1)))))
 :qid |stdinbpl.1720:24|
 :skolemid |123|
 :pattern ( (|Seq#Index| pw@5 i_57_1) (|Seq#Index| pw@5 k_10_1))
)) (and (and (=> (= (ControlFlow 0 101) 96) anon196_Else_correct) (=> (= (ControlFlow 0 101) 98) anon197_Then_correct)) (=> (= (ControlFlow 0 101) 100) anon197_Else_correct)))))
(let ((anon106_correct true))
(let ((anon195_Else_correct  (=> (and (not (and (<= left i_56) (and (< i_56 k_9) (<= k_9 right)))) (= (ControlFlow 0 95) 92)) anon106_correct)))
(let ((anon195_Then_correct  (=> (and (<= left i_56) (and (< i_56 k_9) (<= k_9 right))) (and (=> (= (ControlFlow 0 93) (- 0 94)) (not (= (U_2_int (|Seq#Index| pw@5 i_56)) (U_2_int (|Seq#Index| pw@5 k_9))))) (=> (not (= (U_2_int (|Seq#Index| pw@5 i_56)) (U_2_int (|Seq#Index| pw@5 k_9)))) (=> (= (ControlFlow 0 93) 92) anon106_correct))))))
(let ((anon192_Else_correct  (=> (forall ((i_55_1 Int) ) (!  (=> (and (<= left i_55_1) (<= i_55_1 right)) (and (<= left (U_2_int (|Seq#Index| pw@5 i_55_1))) (<= (U_2_int (|Seq#Index| pw@5 i_55_1)) right)))
 :qid |stdinbpl.1709:24|
 :skolemid |122|
 :pattern ( (|Seq#Index| pw@5 i_55_1))
)) (and (and (=> (= (ControlFlow 0 102) 101) anon194_Else_correct) (=> (= (ControlFlow 0 102) 93) anon195_Then_correct)) (=> (= (ControlFlow 0 102) 95) anon195_Else_correct)))))
(let ((anon102_correct true))
(let ((anon193_Else_correct  (=> (and (not (and (<= left i_54) (<= i_54 right))) (= (ControlFlow 0 91) 87)) anon102_correct)))
(let ((anon193_Then_correct  (=> (and (<= left i_54) (<= i_54 right)) (and (=> (= (ControlFlow 0 88) (- 0 90)) (<= left (U_2_int (|Seq#Index| pw@5 i_54)))) (=> (<= left (U_2_int (|Seq#Index| pw@5 i_54))) (and (=> (= (ControlFlow 0 88) (- 0 89)) (<= (U_2_int (|Seq#Index| pw@5 i_54)) right)) (=> (<= (U_2_int (|Seq#Index| pw@5 i_54)) right) (=> (= (ControlFlow 0 88) 87) anon102_correct))))))))
(let ((anon190_Else_correct  (=> (forall ((i_53_1 Int) ) (!  (=> (and (<= storeIndex@2 i_53_1) (< i_53_1 j@1)) (<= pivotValue@0 (U_2_int (MapType0Select Heap@0 (loc a_3@@1 i_53_1) val))))
 :qid |stdinbpl.1694:24|
 :skolemid |121|
 :pattern ( (loc a_3@@1 i_53_1))
)) (and (=> (= (ControlFlow 0 103) (- 0 104)) (= (|Seq#Length| pw@5) (+ right 1))) (=> (= (|Seq#Length| pw@5) (+ right 1)) (and (and (=> (= (ControlFlow 0 103) 102) anon192_Else_correct) (=> (= (ControlFlow 0 103) 88) anon193_Then_correct)) (=> (= (ControlFlow 0 103) 91) anon193_Else_correct)))))))
(let ((anon98_correct true))
(let ((anon191_Else_correct  (=> (and (not (and (<= storeIndex@2 i_52) (< i_52 j@1))) (= (ControlFlow 0 86) 83)) anon98_correct)))
(let ((anon191_Then_correct  (=> (and (<= storeIndex@2 i_52) (< i_52 j@1)) (and (=> (= (ControlFlow 0 84) (- 0 85)) (<= pivotValue@0 (U_2_int (MapType0Select Heap@0 (loc a_3@@1 i_52) val)))) (=> (<= pivotValue@0 (U_2_int (MapType0Select Heap@0 (loc a_3@@1 i_52) val))) (=> (= (ControlFlow 0 84) 83) anon98_correct))))))
(let ((anon188_Else_correct  (=> (forall ((i_51_1 Int) ) (!  (=> (and (<= left i_51_1) (< i_51_1 storeIndex@2)) (< (U_2_int (MapType0Select Heap@0 (loc a_3@@1 i_51_1) val)) pivotValue@0))
 :qid |stdinbpl.1683:24|
 :skolemid |120|
 :pattern ( (loc a_3@@1 i_51_1))
)) (and (and (=> (= (ControlFlow 0 105) 103) anon190_Else_correct) (=> (= (ControlFlow 0 105) 84) anon191_Then_correct)) (=> (= (ControlFlow 0 105) 86) anon191_Else_correct)))))
(let ((anon94_correct true))
(let ((anon189_Else_correct  (=> (and (not (and (<= left i_50) (< i_50 storeIndex@2))) (= (ControlFlow 0 82) 79)) anon94_correct)))
(let ((anon189_Then_correct  (=> (and (<= left i_50) (< i_50 storeIndex@2)) (and (=> (= (ControlFlow 0 80) (- 0 81)) (< (U_2_int (MapType0Select Heap@0 (loc a_3@@1 i_50) val)) pivotValue@0)) (=> (< (U_2_int (MapType0Select Heap@0 (loc a_3@@1 i_50) val)) pivotValue@0) (=> (= (ControlFlow 0 80) 79) anon94_correct))))))
(let ((anon91_correct  (=> (state Heap@0 Mask@18) (=> (and (= j@1 (+ j@0 1)) (state Heap@0 Mask@18)) (and (=> (= (ControlFlow 0 106) (- 0 113)) (<= left j@1)) (=> (<= left j@1) (and (=> (= (ControlFlow 0 106) (- 0 112)) (<= j@1 right)) (=> (<= j@1 right) (and (=> (= (ControlFlow 0 106) (- 0 111)) (<= left storeIndex@2)) (=> (<= left storeIndex@2) (and (=> (= (ControlFlow 0 106) (- 0 110)) (<= storeIndex@2 j@1)) (=> (<= storeIndex@2 j@1) (and (=> (= (ControlFlow 0 106) (- 0 109)) (forall ((i_49 Int) (i_49_1 Int) ) (!  (=> (and (and (and (and (not (= i_49 i_49_1)) (and (<= left i_49) (<= i_49 right))) (and (<= left i_49_1) (<= i_49_1 right))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (loc a_3@@1 i_49) (loc a_3@@1 i_49_1))))
 :qid |stdinbpl.1640:21|
 :skolemid |114|
 :pattern ( (neverTriggered7 i_49) (neverTriggered7 i_49_1))
))) (=> (forall ((i_49@@0 Int) (i_49_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_49@@0 i_49_1@@0)) (and (<= left i_49@@0) (<= i_49@@0 right))) (and (<= left i_49_1@@0) (<= i_49_1@@0 right))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (loc a_3@@1 i_49@@0) (loc a_3@@1 i_49_1@@0))))
 :qid |stdinbpl.1640:21|
 :skolemid |114|
 :pattern ( (neverTriggered7 i_49@@0) (neverTriggered7 i_49_1@@0))
)) (and (=> (= (ControlFlow 0 106) (- 0 108)) (forall ((i_49@@1 Int) ) (!  (=> (and (<= left i_49@@1) (<= i_49@@1 right)) (>= (U_2_real (MapType1Select Mask@18 (loc a_3@@1 i_49@@1) val)) FullPerm))
 :qid |stdinbpl.1647:21|
 :skolemid |115|
 :pattern ( (loc a_3@@1 i_49@@1))
 :pattern ( (loc a_3@@1 i_49@@1))
))) (=> (forall ((i_49@@2 Int) ) (!  (=> (and (<= left i_49@@2) (<= i_49@@2 right)) (>= (U_2_real (MapType1Select Mask@18 (loc a_3@@1 i_49@@2) val)) FullPerm))
 :qid |stdinbpl.1647:21|
 :skolemid |115|
 :pattern ( (loc a_3@@1 i_49@@2))
 :pattern ( (loc a_3@@1 i_49@@2))
)) (=> (and (and (forall ((i_49@@3 Int) ) (!  (=> (and (and (<= left i_49@@3) (<= i_49@@3 right)) (< NoPerm FullPerm)) (and (qpRange7 (loc a_3@@1 i_49@@3)) (= (invRecv7 (loc a_3@@1 i_49@@3)) i_49@@3)))
 :qid |stdinbpl.1653:26|
 :skolemid |116|
 :pattern ( (loc a_3@@1 i_49@@3))
 :pattern ( (loc a_3@@1 i_49@@3))
)) (forall ((o_3@@5 T@U) ) (!  (=> (= (type o_3@@5) RefType) (=> (and (and (<= left (invRecv7 o_3@@5)) (<= (invRecv7 o_3@@5) right)) (and (< NoPerm FullPerm) (qpRange7 o_3@@5))) (= (loc a_3@@1 (invRecv7 o_3@@5)) o_3@@5)))
 :qid |stdinbpl.1657:26|
 :skolemid |117|
 :pattern ( (invRecv7 o_3@@5))
))) (and (forall ((o_3@@6 T@U) ) (!  (=> (= (type o_3@@6) RefType) (and (=> (and (and (<= left (invRecv7 o_3@@6)) (<= (invRecv7 o_3@@6) right)) (and (< NoPerm FullPerm) (qpRange7 o_3@@6))) (and (= (loc a_3@@1 (invRecv7 o_3@@6)) o_3@@6) (= (U_2_real (MapType1Select QPMask@5 o_3@@6 val)) (- (U_2_real (MapType1Select Mask@18 o_3@@6 val)) FullPerm)))) (=> (not (and (and (<= left (invRecv7 o_3@@6)) (<= (invRecv7 o_3@@6) right)) (and (< NoPerm FullPerm) (qpRange7 o_3@@6)))) (= (U_2_real (MapType1Select QPMask@5 o_3@@6 val)) (U_2_real (MapType1Select Mask@18 o_3@@6 val))))))
 :qid |stdinbpl.1663:26|
 :skolemid |118|
 :pattern ( (MapType1Select QPMask@5 o_3@@6 val))
)) (forall ((o_3@@7 T@U) (f_5@@1 T@U) ) (! (let ((B@@13 (FieldTypeInv1 (type f_5@@1))))
(let ((A@@14 (FieldTypeInv0 (type f_5@@1))))
 (=> (and (and (= (type o_3@@7) RefType) (= (type f_5@@1) (FieldType A@@14 B@@13))) (not (= f_5@@1 val))) (= (U_2_real (MapType1Select Mask@18 o_3@@7 f_5@@1)) (U_2_real (MapType1Select QPMask@5 o_3@@7 f_5@@1))))))
 :qid |stdinbpl.1669:33|
 :skolemid |119|
 :pattern ( (MapType1Select QPMask@5 o_3@@7 f_5@@1))
)))) (and (=> (= (ControlFlow 0 106) (- 0 107)) (= (U_2_int (MapType0Select Heap@0 (loc a_3@@1 right) val)) pivotValue@0)) (=> (= (U_2_int (MapType0Select Heap@0 (loc a_3@@1 right) val)) pivotValue@0) (and (and (=> (= (ControlFlow 0 106) 105) anon188_Else_correct) (=> (= (ControlFlow 0 106) 80) anon189_Then_correct)) (=> (= (ControlFlow 0 106) 82) anon189_Else_correct)))))))))))))))))))))
(let ((anon90_correct  (=> (and (and (= (U_2_int (MapType0Select ExhaleHeap@4 (loc a_3@@1 j@0) val)) (U_2_int (MapType0Select ExhaleHeap@1 (loc a_3@@1 storeIndex@0) val))) (= (U_2_int (MapType0Select ExhaleHeap@4 (loc a_3@@1 storeIndex@0) val)) (U_2_int (MapType0Select ExhaleHeap@1 (loc a_3@@1 j@0) val)))) (and (state ExhaleHeap@4 Mask@17) (state ExhaleHeap@4 Mask@17))) (and (=> (= (ControlFlow 0 115) (- 0 119)) (>= j@0 0)) (=> (>= j@0 0) (and (=> (= (ControlFlow 0 115) (- 0 118)) (< j@0 (|Seq#Length| pw@2))) (=> (< j@0 (|Seq#Length| pw@2)) (and (=> (= (ControlFlow 0 115) (- 0 117)) (>= storeIndex@0 0)) (=> (>= storeIndex@0 0) (and (=> (= (ControlFlow 0 115) (- 0 116)) (< storeIndex@0 (|Seq#Length| pw@2))) (=> (< storeIndex@0 (|Seq#Length| pw@2)) (=> (= pw@4 (|Seq#Append| (|Seq#Take| (|Seq#Append| (|Seq#Take| pw@2 storeIndex@0) (|Seq#Append| (|Seq#Singleton| (|Seq#Index| pw@2 j@0)) (|Seq#Drop| pw@2 (+ storeIndex@0 1)))) j@0) (|Seq#Append| (|Seq#Singleton| (|Seq#Index| pw@2 storeIndex@0)) (|Seq#Drop| (|Seq#Append| (|Seq#Take| pw@2 storeIndex@0) (|Seq#Append| (|Seq#Singleton| (|Seq#Index| pw@2 j@0)) (|Seq#Drop| pw@2 (+ storeIndex@0 1)))) (+ j@0 1))))) (=> (and (and (and (state ExhaleHeap@4 Mask@17) (= storeIndex@1 (+ storeIndex@0 1))) (and (state ExhaleHeap@4 Mask@17) (= pw@5 pw@4))) (and (and (= storeIndex@2 storeIndex@1) (= Heap@0 ExhaleHeap@4)) (and (= Mask@18 Mask@17) (= (ControlFlow 0 115) 106)))) anon91_correct)))))))))))))
(let ((anon187_Else_correct  (=> (= j@0 storeIndex@0) (=> (and (= Mask@17 Mask@15) (= (ControlFlow 0 121) 115)) anon90_correct))))
(let ((anon187_Then_correct  (=> (and (not (= j@0 storeIndex@0)) (not (= (loc a_3@@1 storeIndex@0) null))) (=> (and (and (= Mask@16 (MapType1Store Mask@15 (loc a_3@@1 storeIndex@0) val (real_2_U (+ (U_2_real (MapType1Select Mask@15 (loc a_3@@1 storeIndex@0) val)) FullPerm)))) (state ExhaleHeap@4 Mask@16)) (and (= Mask@17 Mask@16) (= (ControlFlow 0 120) 115))) anon90_correct))))
(let ((anon88_correct  (=> (and (and (IdenticalOnKnownLocations ExhaleHeap@1 ExhaleHeap@4 Mask@14) (not (= (loc a_3@@1 j@0) null))) (and (= Mask@15 (MapType1Store Mask@14 (loc a_3@@1 j@0) val (real_2_U (+ (U_2_real (MapType1Select Mask@14 (loc a_3@@1 j@0) val)) FullPerm)))) (state ExhaleHeap@4 Mask@15))) (and (=> (= (ControlFlow 0 122) 120) anon187_Then_correct) (=> (= (ControlFlow 0 122) 121) anon187_Else_correct)))))
(let ((anon87_correct  (=> (= Mask@13 (MapType1Store Mask@12 (loc a_3@@1 storeIndex@0) val (real_2_U (- (U_2_real (MapType1Select Mask@12 (loc a_3@@1 storeIndex@0) val)) FullPerm)))) (=> (and (= Mask@14 Mask@13) (= (ControlFlow 0 124) 122)) anon88_correct))))
(let ((anon186_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 127) 124)) anon87_correct)))
(let ((anon186_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 125) (- 0 126)) (<= FullPerm (U_2_real (MapType1Select Mask@12 (loc a_3@@1 storeIndex@0) val)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@12 (loc a_3@@1 storeIndex@0) val))) (=> (= (ControlFlow 0 125) 124) anon87_correct))))))
(let ((anon185_Then_correct  (=> (not (= j@0 storeIndex@0)) (and (=> (= (ControlFlow 0 128) 125) anon186_Then_correct) (=> (= (ControlFlow 0 128) 127) anon186_Else_correct)))))
(let ((anon185_Else_correct  (=> (= j@0 storeIndex@0) (=> (and (= Mask@14 Mask@12) (= (ControlFlow 0 123) 122)) anon88_correct))))
(let ((anon84_correct  (=> (= Mask@12 (MapType1Store QPMask@2 (loc a_3@@1 j@0) val (real_2_U (- (U_2_real (MapType1Select QPMask@2 (loc a_3@@1 j@0) val)) FullPerm)))) (and (=> (= (ControlFlow 0 129) 128) anon185_Then_correct) (=> (= (ControlFlow 0 129) 123) anon185_Else_correct)))))
(let ((anon184_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 132) 129)) anon84_correct)))
(let ((anon184_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 130) (- 0 131)) (<= FullPerm (U_2_real (MapType1Select QPMask@2 (loc a_3@@1 j@0) val)))) (=> (<= FullPerm (U_2_real (MapType1Select QPMask@2 (loc a_3@@1 j@0) val))) (=> (= (ControlFlow 0 130) 129) anon84_correct))))))
(let ((anon183_Then_correct  (=> (< (U_2_int (MapType0Select ExhaleHeap@1 (loc a_3@@1 j@0) val)) pivotValue@0) (and (=> (= (ControlFlow 0 133) (- 0 137)) (<= 0 j@0)) (=> (<= 0 j@0) (and (=> (= (ControlFlow 0 133) (- 0 136)) (< j@0 (len a_3@@1))) (=> (< j@0 (len a_3@@1)) (and (=> (= (ControlFlow 0 133) (- 0 135)) (<= 0 storeIndex@0)) (=> (<= 0 storeIndex@0) (and (=> (= (ControlFlow 0 133) (- 0 134)) (< storeIndex@0 (len a_3@@1))) (=> (< storeIndex@0 (len a_3@@1)) (and (=> (= (ControlFlow 0 133) 130) anon184_Then_correct) (=> (= (ControlFlow 0 133) 132) anon184_Else_correct)))))))))))))
(let ((anon183_Else_correct  (=> (and (<= pivotValue@0 (U_2_int (MapType0Select ExhaleHeap@1 (loc a_3@@1 j@0) val))) (= pw@5 pw@2)) (=> (and (and (= storeIndex@2 storeIndex@0) (= Heap@0 ExhaleHeap@1)) (and (= Mask@18 QPMask@2) (= (ControlFlow 0 114) 106))) anon91_correct))))
(let ((anon182_Then_correct  (=> (state ExhaleHeap@1 ZeroMask) (=> (and (and (<= left j@0) (<= j@0 right)) (and (<= left storeIndex@0) (<= storeIndex@0 j@0))) (and (=> (= (ControlFlow 0 138) (- 0 140)) (forall ((i_44 Int) (i_44_1 Int) ) (!  (=> (and (and (and (and (not (= i_44 i_44_1)) (and (<= left i_44) (<= i_44 right))) (and (<= left i_44_1) (<= i_44_1 right))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (loc a_3@@1 i_44) (loc a_3@@1 i_44_1))))
 :qid |stdinbpl.1481:19|
 :skolemid |103|
))) (=> (forall ((i_44@@0 Int) (i_44_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_44@@0 i_44_1@@0)) (and (<= left i_44@@0) (<= i_44@@0 right))) (and (<= left i_44_1@@0) (<= i_44_1@@0 right))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (loc a_3@@1 i_44@@0) (loc a_3@@1 i_44_1@@0))))
 :qid |stdinbpl.1481:19|
 :skolemid |103|
)) (=> (and (and (and (and (forall ((i_44@@1 Int) ) (!  (=> (and (and (<= left i_44@@1) (<= i_44@@1 right)) (< NoPerm FullPerm)) (and (qpRange6 (loc a_3@@1 i_44@@1)) (= (invRecv6 (loc a_3@@1 i_44@@1)) i_44@@1)))
 :qid |stdinbpl.1487:26|
 :skolemid |104|
 :pattern ( (loc a_3@@1 i_44@@1))
 :pattern ( (loc a_3@@1 i_44@@1))
)) (forall ((o_3@@8 T@U) ) (!  (=> (= (type o_3@@8) RefType) (=> (and (and (and (<= left (invRecv6 o_3@@8)) (<= (invRecv6 o_3@@8) right)) (< NoPerm FullPerm)) (qpRange6 o_3@@8)) (= (loc a_3@@1 (invRecv6 o_3@@8)) o_3@@8)))
 :qid |stdinbpl.1491:26|
 :skolemid |105|
 :pattern ( (invRecv6 o_3@@8))
))) (and (forall ((i_44@@2 Int) ) (!  (=> (and (<= left i_44@@2) (<= i_44@@2 right)) (not (= (loc a_3@@1 i_44@@2) null)))
 :qid |stdinbpl.1497:26|
 :skolemid |106|
 :pattern ( (loc a_3@@1 i_44@@2))
 :pattern ( (loc a_3@@1 i_44@@2))
)) (forall ((o_3@@9 T@U) ) (!  (=> (= (type o_3@@9) RefType) (and (=> (and (and (and (<= left (invRecv6 o_3@@9)) (<= (invRecv6 o_3@@9) right)) (< NoPerm FullPerm)) (qpRange6 o_3@@9)) (and (=> (< NoPerm FullPerm) (= (loc a_3@@1 (invRecv6 o_3@@9)) o_3@@9)) (= (U_2_real (MapType1Select QPMask@2 o_3@@9 val)) (+ (U_2_real (MapType1Select ZeroMask o_3@@9 val)) FullPerm)))) (=> (not (and (and (and (<= left (invRecv6 o_3@@9)) (<= (invRecv6 o_3@@9) right)) (< NoPerm FullPerm)) (qpRange6 o_3@@9))) (= (U_2_real (MapType1Select QPMask@2 o_3@@9 val)) (U_2_real (MapType1Select ZeroMask o_3@@9 val))))))
 :qid |stdinbpl.1503:26|
 :skolemid |107|
 :pattern ( (MapType1Select QPMask@2 o_3@@9 val))
)))) (and (and (forall ((o_3@@10 T@U) (f_5@@2 T@U) ) (! (let ((B@@14 (FieldTypeInv1 (type f_5@@2))))
(let ((A@@15 (FieldTypeInv0 (type f_5@@2))))
 (=> (and (and (= (type o_3@@10) RefType) (= (type f_5@@2) (FieldType A@@15 B@@14))) (not (= f_5@@2 val))) (= (U_2_real (MapType1Select ZeroMask o_3@@10 f_5@@2)) (U_2_real (MapType1Select QPMask@2 o_3@@10 f_5@@2))))))
 :qid |stdinbpl.1507:33|
 :skolemid |108|
 :pattern ( (MapType1Select ZeroMask o_3@@10 f_5@@2))
 :pattern ( (MapType1Select QPMask@2 o_3@@10 f_5@@2))
)) (state ExhaleHeap@1 QPMask@2)) (and (= (U_2_int (MapType0Select ExhaleHeap@1 (loc a_3@@1 right) val)) pivotValue@0) (forall ((i_45 Int) ) (!  (=> (and (<= left i_45) (< i_45 storeIndex@0)) (< (U_2_int (MapType0Select ExhaleHeap@1 (loc a_3@@1 i_45) val)) pivotValue@0))
 :qid |stdinbpl.1514:24|
 :skolemid |109|
 :pattern ( (loc a_3@@1 i_45))
))))) (and (and (and (forall ((i_46 Int) ) (!  (=> (and (<= storeIndex@0 i_46) (< i_46 j@0)) (<= pivotValue@0 (U_2_int (MapType0Select ExhaleHeap@1 (loc a_3@@1 i_46) val))))
 :qid |stdinbpl.1518:24|
 :skolemid |110|
 :pattern ( (loc a_3@@1 i_46))
)) (= (|Seq#Length| pw@2) (+ right 1))) (and (forall ((i_47 Int) ) (!  (=> (and (<= left i_47) (<= i_47 right)) (and (<= left (U_2_int (|Seq#Index| pw@2 i_47))) (<= (U_2_int (|Seq#Index| pw@2 i_47)) right)))
 :qid |stdinbpl.1523:24|
 :skolemid |111|
 :pattern ( (|Seq#Index| pw@2 i_47))
)) (forall ((i_48 Int) (k_8 Int) ) (!  (=> (and (<= left i_48) (and (< i_48 k_8) (<= k_8 right))) (not (= (U_2_int (|Seq#Index| pw@2 i_48)) (U_2_int (|Seq#Index| pw@2 k_8)))))
 :qid |stdinbpl.1527:24|
 :skolemid |112|
 :pattern ( (|Seq#Index| pw@2 i_48) (|Seq#Index| pw@2 k_8))
)))) (and (and (forall ((i$0_4 Int) ) (!  (=> (and (<= left i$0_4) (<= i$0_4 right)) (= (U_2_int (MapType0Select ExhaleHeap@1 (loc a_3@@1 i$0_4) val)) (U_2_int (MapType0Select Heap@@13 (loc a_3@@1 (U_2_int (|Seq#Index| pw@2 i$0_4))) val))))
 :qid |stdinbpl.1531:24|
 :skolemid |113|
 :pattern ( (|Seq#Index| pw@2 i$0_4))
)) (state ExhaleHeap@1 QPMask@2)) (and (< j@0 right) (state ExhaleHeap@1 QPMask@2))))) (and (=> (= (ControlFlow 0 138) (- 0 139)) (HasDirectPerm QPMask@2 (loc a_3@@1 j@0) val)) (=> (HasDirectPerm QPMask@2 (loc a_3@@1 j@0) val) (and (=> (= (ControlFlow 0 138) 133) anon183_Then_correct) (=> (= (ControlFlow 0 138) 114) anon183_Else_correct)))))))))))
(let ((anon139_correct true))
(let ((anon211_Else_correct  (=> (and (not (and (<= left i_23) (<= i_23 right))) (= (ControlFlow 0 44) 41)) anon139_correct)))
(let ((anon211_Then_correct  (=> (and (<= left i_23) (<= i_23 right)) (and (=> (= (ControlFlow 0 42) (- 0 43)) (= (U_2_int (MapType0Select ExhaleHeap@2 (loc a_3@@1 i_23) val)) (U_2_int (MapType0Select Heap@@13 (loc a_3@@1 (U_2_int (|Seq#Index| pw@3 i_23))) val)))) (=> (= (U_2_int (MapType0Select ExhaleHeap@2 (loc a_3@@1 i_23) val)) (U_2_int (MapType0Select Heap@@13 (loc a_3@@1 (U_2_int (|Seq#Index| pw@3 i_23))) val))) (=> (= (ControlFlow 0 42) 41) anon139_correct))))))
(let ((anon210_Else_correct true))
(let ((anon208_Else_correct  (=> (forall ((i_22_1 Int) (k_3_1 Int) ) (!  (=> (and (<= left i_22_1) (and (< i_22_1 k_3_1) (<= k_3_1 right))) (not (= (U_2_int (|Seq#Index| pw@3 i_22_1)) (U_2_int (|Seq#Index| pw@3 k_3_1)))))
 :qid |stdinbpl.1967:20|
 :skolemid |145|
 :pattern ( (|Seq#Index| pw@3 i_22_1) (|Seq#Index| pw@3 k_3_1))
)) (and (and (=> (= (ControlFlow 0 45) 40) anon210_Else_correct) (=> (= (ControlFlow 0 45) 42) anon211_Then_correct)) (=> (= (ControlFlow 0 45) 44) anon211_Else_correct)))))
(let ((anon135_correct true))
(let ((anon209_Else_correct  (=> (and (not (and (<= left i_21) (and (< i_21 k_2_1) (<= k_2_1 right)))) (= (ControlFlow 0 39) 36)) anon135_correct)))
(let ((anon209_Then_correct  (=> (and (<= left i_21) (and (< i_21 k_2_1) (<= k_2_1 right))) (and (=> (= (ControlFlow 0 37) (- 0 38)) (not (= (U_2_int (|Seq#Index| pw@3 i_21)) (U_2_int (|Seq#Index| pw@3 k_2_1))))) (=> (not (= (U_2_int (|Seq#Index| pw@3 i_21)) (U_2_int (|Seq#Index| pw@3 k_2_1)))) (=> (= (ControlFlow 0 37) 36) anon135_correct))))))
(let ((anon206_Else_correct  (=> (forall ((i_20_1 Int) ) (!  (=> (and (<= left i_20_1) (<= i_20_1 right)) (and (<= left (U_2_int (|Seq#Index| pw@3 i_20_1))) (<= (U_2_int (|Seq#Index| pw@3 i_20_1)) right)))
 :qid |stdinbpl.1956:20|
 :skolemid |144|
 :pattern ( (|Seq#Index| pw@3 i_20_1))
)) (and (and (=> (= (ControlFlow 0 46) 45) anon208_Else_correct) (=> (= (ControlFlow 0 46) 37) anon209_Then_correct)) (=> (= (ControlFlow 0 46) 39) anon209_Else_correct)))))
(let ((anon131_correct true))
(let ((anon207_Else_correct  (=> (and (not (and (<= left i_19) (<= i_19 right))) (= (ControlFlow 0 35) 31)) anon131_correct)))
(let ((anon207_Then_correct  (=> (and (<= left i_19) (<= i_19 right)) (and (=> (= (ControlFlow 0 32) (- 0 34)) (<= left (U_2_int (|Seq#Index| pw@3 i_19)))) (=> (<= left (U_2_int (|Seq#Index| pw@3 i_19))) (and (=> (= (ControlFlow 0 32) (- 0 33)) (<= (U_2_int (|Seq#Index| pw@3 i_19)) right)) (=> (<= (U_2_int (|Seq#Index| pw@3 i_19)) right) (=> (= (ControlFlow 0 32) 31) anon131_correct))))))))
(let ((anon204_Else_correct  (=> (forall ((i_18_1 Int) ) (!  (=> (and (< storeIndex@0 i_18_1) (<= i_18_1 right)) (<= (U_2_int (MapType0Select ExhaleHeap@2 (loc a_3@@1 storeIndex@0) val)) (U_2_int (MapType0Select ExhaleHeap@2 (loc a_3@@1 i_18_1) val))))
 :qid |stdinbpl.1941:20|
 :skolemid |143|
 :pattern ( (loc a_3@@1 i_18_1))
)) (and (=> (= (ControlFlow 0 47) (- 0 48)) (= (|Seq#Length| pw@3) (+ right 1))) (=> (= (|Seq#Length| pw@3) (+ right 1)) (and (and (=> (= (ControlFlow 0 47) 46) anon206_Else_correct) (=> (= (ControlFlow 0 47) 32) anon207_Then_correct)) (=> (= (ControlFlow 0 47) 35) anon207_Else_correct)))))))
(let ((anon127_correct true))
(let ((anon205_Else_correct  (=> (and (not (and (< storeIndex@0 i_17_1) (<= i_17_1 right))) (= (ControlFlow 0 30) 27)) anon127_correct)))
(let ((anon205_Then_correct  (=> (and (< storeIndex@0 i_17_1) (<= i_17_1 right)) (and (=> (= (ControlFlow 0 28) (- 0 29)) (<= (U_2_int (MapType0Select ExhaleHeap@2 (loc a_3@@1 storeIndex@0) val)) (U_2_int (MapType0Select ExhaleHeap@2 (loc a_3@@1 i_17_1) val)))) (=> (<= (U_2_int (MapType0Select ExhaleHeap@2 (loc a_3@@1 storeIndex@0) val)) (U_2_int (MapType0Select ExhaleHeap@2 (loc a_3@@1 i_17_1) val))) (=> (= (ControlFlow 0 28) 27) anon127_correct))))))
(let ((anon202_Else_correct  (=> (forall ((i_16_1 Int) ) (!  (=> (and (<= left i_16_1) (< i_16_1 storeIndex@0)) (< (U_2_int (MapType0Select ExhaleHeap@2 (loc a_3@@1 i_16_1) val)) (U_2_int (MapType0Select ExhaleHeap@2 (loc a_3@@1 storeIndex@0) val))))
 :qid |stdinbpl.1930:20|
 :skolemid |142|
 :pattern ( (loc a_3@@1 i_16_1))
)) (and (and (=> (= (ControlFlow 0 49) 47) anon204_Else_correct) (=> (= (ControlFlow 0 49) 28) anon205_Then_correct)) (=> (= (ControlFlow 0 49) 30) anon205_Else_correct)))))
(let ((anon123_correct true))
(let ((anon203_Else_correct  (=> (and (not (and (<= left i_15_1) (< i_15_1 storeIndex@0))) (= (ControlFlow 0 26) 23)) anon123_correct)))
(let ((anon203_Then_correct  (=> (and (<= left i_15_1) (< i_15_1 storeIndex@0)) (and (=> (= (ControlFlow 0 24) (- 0 25)) (< (U_2_int (MapType0Select ExhaleHeap@2 (loc a_3@@1 i_15_1) val)) (U_2_int (MapType0Select ExhaleHeap@2 (loc a_3@@1 storeIndex@0) val)))) (=> (< (U_2_int (MapType0Select ExhaleHeap@2 (loc a_3@@1 i_15_1) val)) (U_2_int (MapType0Select ExhaleHeap@2 (loc a_3@@1 storeIndex@0) val))) (=> (= (ControlFlow 0 24) 23) anon123_correct))))))
(let ((anon120_correct  (=> (and (and (= (U_2_int (MapType0Select ExhaleHeap@2 (loc a_3@@1 right) val)) (U_2_int (MapType0Select ExhaleHeap@1 (loc a_3@@1 storeIndex@0) val))) (= (U_2_int (MapType0Select ExhaleHeap@2 (loc a_3@@1 storeIndex@0) val)) (U_2_int (MapType0Select ExhaleHeap@1 (loc a_3@@1 right) val)))) (and (state ExhaleHeap@2 Mask@11) (state ExhaleHeap@2 Mask@11))) (and (=> (= (ControlFlow 0 50) (- 0 59)) (>= right 0)) (=> (>= right 0) (and (=> (= (ControlFlow 0 50) (- 0 58)) (< right (|Seq#Length| pw@2))) (=> (< right (|Seq#Length| pw@2)) (and (=> (= (ControlFlow 0 50) (- 0 57)) (>= storeIndex@0 0)) (=> (>= storeIndex@0 0) (and (=> (= (ControlFlow 0 50) (- 0 56)) (< storeIndex@0 (|Seq#Length| pw@2))) (=> (< storeIndex@0 (|Seq#Length| pw@2)) (=> (and (= pw@3 (|Seq#Append| (|Seq#Take| (|Seq#Append| (|Seq#Take| pw@2 storeIndex@0) (|Seq#Append| (|Seq#Singleton| (|Seq#Index| pw@2 right)) (|Seq#Drop| pw@2 (+ storeIndex@0 1)))) right) (|Seq#Append| (|Seq#Singleton| (|Seq#Index| pw@2 storeIndex@0)) (|Seq#Drop| (|Seq#Append| (|Seq#Take| pw@2 storeIndex@0) (|Seq#Append| (|Seq#Singleton| (|Seq#Index| pw@2 right)) (|Seq#Drop| pw@2 (+ storeIndex@0 1)))) (+ right 1))))) (state ExhaleHeap@2 Mask@11)) (and (=> (= (ControlFlow 0 50) (- 0 55)) (<= left storeIndex@0)) (=> (<= left storeIndex@0) (and (=> (= (ControlFlow 0 50) (- 0 54)) (<= storeIndex@0 right)) (=> (<= storeIndex@0 right) (and (=> (= (ControlFlow 0 50) (- 0 53)) (forall ((i_14 Int) (i_14_1 Int) ) (!  (=> (and (and (and (and (not (= i_14 i_14_1)) (and (<= left i_14) (<= i_14 right))) (and (<= left i_14_1) (<= i_14_1 right))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (loc a_3@@1 i_14) (loc a_3@@1 i_14_1))))
 :qid |stdinbpl.1887:17|
 :skolemid |136|
 :pattern ( (neverTriggered3 i_14) (neverTriggered3 i_14_1))
))) (=> (forall ((i_14@@0 Int) (i_14_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_14@@0 i_14_1@@0)) (and (<= left i_14@@0) (<= i_14@@0 right))) (and (<= left i_14_1@@0) (<= i_14_1@@0 right))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (loc a_3@@1 i_14@@0) (loc a_3@@1 i_14_1@@0))))
 :qid |stdinbpl.1887:17|
 :skolemid |136|
 :pattern ( (neverTriggered3 i_14@@0) (neverTriggered3 i_14_1@@0))
)) (and (=> (= (ControlFlow 0 50) (- 0 52)) (forall ((i_14@@1 Int) ) (!  (=> (and (<= left i_14@@1) (<= i_14@@1 right)) (>= (U_2_real (MapType1Select Mask@11 (loc a_3@@1 i_14@@1) val)) FullPerm))
 :qid |stdinbpl.1894:17|
 :skolemid |137|
 :pattern ( (loc a_3@@1 i_14@@1))
 :pattern ( (loc a_3@@1 i_14@@1))
))) (=> (forall ((i_14@@2 Int) ) (!  (=> (and (<= left i_14@@2) (<= i_14@@2 right)) (>= (U_2_real (MapType1Select Mask@11 (loc a_3@@1 i_14@@2) val)) FullPerm))
 :qid |stdinbpl.1894:17|
 :skolemid |137|
 :pattern ( (loc a_3@@1 i_14@@2))
 :pattern ( (loc a_3@@1 i_14@@2))
)) (=> (and (and (forall ((i_14@@3 Int) ) (!  (=> (and (and (<= left i_14@@3) (<= i_14@@3 right)) (< NoPerm FullPerm)) (and (qpRange3 (loc a_3@@1 i_14@@3)) (= (invRecv3 (loc a_3@@1 i_14@@3)) i_14@@3)))
 :qid |stdinbpl.1900:22|
 :skolemid |138|
 :pattern ( (loc a_3@@1 i_14@@3))
 :pattern ( (loc a_3@@1 i_14@@3))
)) (forall ((o_3@@11 T@U) ) (!  (=> (= (type o_3@@11) RefType) (=> (and (and (<= left (invRecv3 o_3@@11)) (<= (invRecv3 o_3@@11) right)) (and (< NoPerm FullPerm) (qpRange3 o_3@@11))) (= (loc a_3@@1 (invRecv3 o_3@@11)) o_3@@11)))
 :qid |stdinbpl.1904:22|
 :skolemid |139|
 :pattern ( (invRecv3 o_3@@11))
))) (and (forall ((o_3@@12 T@U) ) (!  (=> (= (type o_3@@12) RefType) (and (=> (and (and (<= left (invRecv3 o_3@@12)) (<= (invRecv3 o_3@@12) right)) (and (< NoPerm FullPerm) (qpRange3 o_3@@12))) (and (= (loc a_3@@1 (invRecv3 o_3@@12)) o_3@@12) (= (U_2_real (MapType1Select QPMask@4 o_3@@12 val)) (- (U_2_real (MapType1Select Mask@11 o_3@@12 val)) FullPerm)))) (=> (not (and (and (<= left (invRecv3 o_3@@12)) (<= (invRecv3 o_3@@12) right)) (and (< NoPerm FullPerm) (qpRange3 o_3@@12)))) (= (U_2_real (MapType1Select QPMask@4 o_3@@12 val)) (U_2_real (MapType1Select Mask@11 o_3@@12 val))))))
 :qid |stdinbpl.1910:22|
 :skolemid |140|
 :pattern ( (MapType1Select QPMask@4 o_3@@12 val))
)) (forall ((o_3@@13 T@U) (f_5@@3 T@U) ) (! (let ((B@@15 (FieldTypeInv1 (type f_5@@3))))
(let ((A@@16 (FieldTypeInv0 (type f_5@@3))))
 (=> (and (and (= (type o_3@@13) RefType) (= (type f_5@@3) (FieldType A@@16 B@@15))) (not (= f_5@@3 val))) (= (U_2_real (MapType1Select Mask@11 o_3@@13 f_5@@3)) (U_2_real (MapType1Select QPMask@4 o_3@@13 f_5@@3))))))
 :qid |stdinbpl.1916:29|
 :skolemid |141|
 :pattern ( (MapType1Select QPMask@4 o_3@@13 f_5@@3))
)))) (and (=> (= (ControlFlow 0 50) (- 0 51)) (= (U_2_int (MapType0Select ExhaleHeap@2 (loc a_3@@1 storeIndex@0) val)) (U_2_int (MapType0Select Heap@@13 (loc a_3@@1 pivotIndex) val)))) (=> (= (U_2_int (MapType0Select ExhaleHeap@2 (loc a_3@@1 storeIndex@0) val)) (U_2_int (MapType0Select Heap@@13 (loc a_3@@1 pivotIndex) val))) (and (and (=> (= (ControlFlow 0 50) 49) anon202_Else_correct) (=> (= (ControlFlow 0 50) 24) anon203_Then_correct)) (=> (= (ControlFlow 0 50) 26) anon203_Else_correct)))))))))))))))))))))))))
(let ((anon201_Else_correct  (=> (= right storeIndex@0) (=> (and (= Mask@11 Mask@9) (= (ControlFlow 0 61) 50)) anon120_correct))))
(let ((anon201_Then_correct  (=> (and (not (= right storeIndex@0)) (not (= (loc a_3@@1 storeIndex@0) null))) (=> (and (and (= Mask@10 (MapType1Store Mask@9 (loc a_3@@1 storeIndex@0) val (real_2_U (+ (U_2_real (MapType1Select Mask@9 (loc a_3@@1 storeIndex@0) val)) FullPerm)))) (state ExhaleHeap@2 Mask@10)) (and (= Mask@11 Mask@10) (= (ControlFlow 0 60) 50))) anon120_correct))))
(let ((anon118_correct  (=> (and (and (IdenticalOnKnownLocations ExhaleHeap@1 ExhaleHeap@2 Mask@8) (not (= (loc a_3@@1 right) null))) (and (= Mask@9 (MapType1Store Mask@8 (loc a_3@@1 right) val (real_2_U (+ (U_2_real (MapType1Select Mask@8 (loc a_3@@1 right) val)) FullPerm)))) (state ExhaleHeap@2 Mask@9))) (and (=> (= (ControlFlow 0 62) 60) anon201_Then_correct) (=> (= (ControlFlow 0 62) 61) anon201_Else_correct)))))
(let ((anon117_correct  (=> (= Mask@7 (MapType1Store Mask@6 (loc a_3@@1 storeIndex@0) val (real_2_U (- (U_2_real (MapType1Select Mask@6 (loc a_3@@1 storeIndex@0) val)) FullPerm)))) (=> (and (= Mask@8 Mask@7) (= (ControlFlow 0 64) 62)) anon118_correct))))
(let ((anon200_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 67) 64)) anon117_correct)))
(let ((anon200_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 65) (- 0 66)) (<= FullPerm (U_2_real (MapType1Select Mask@6 (loc a_3@@1 storeIndex@0) val)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@6 (loc a_3@@1 storeIndex@0) val))) (=> (= (ControlFlow 0 65) 64) anon117_correct))))))
(let ((anon199_Then_correct  (=> (not (= right storeIndex@0)) (and (=> (= (ControlFlow 0 68) 65) anon200_Then_correct) (=> (= (ControlFlow 0 68) 67) anon200_Else_correct)))))
(let ((anon199_Else_correct  (=> (= right storeIndex@0) (=> (and (= Mask@8 Mask@6) (= (ControlFlow 0 63) 62)) anon118_correct))))
(let ((anon114_correct  (=> (= Mask@6 (MapType1Store QPMask@3 (loc a_3@@1 right) val (real_2_U (- (U_2_real (MapType1Select QPMask@3 (loc a_3@@1 right) val)) FullPerm)))) (and (=> (= (ControlFlow 0 69) 68) anon199_Then_correct) (=> (= (ControlFlow 0 69) 63) anon199_Else_correct)))))
(let ((anon198_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 72) 69)) anon114_correct)))
(let ((anon198_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 70) (- 0 71)) (<= FullPerm (U_2_real (MapType1Select QPMask@3 (loc a_3@@1 right) val)))) (=> (<= FullPerm (U_2_real (MapType1Select QPMask@3 (loc a_3@@1 right) val))) (=> (= (ControlFlow 0 70) 69) anon114_correct))))))
(let ((anon182_Else_correct  (=> (and (not (< j@0 right)) (state ExhaleHeap@1 QPMask@1)) (=> (and (and (<= left j@0) (<= j@0 right)) (and (<= left storeIndex@0) (<= storeIndex@0 j@0))) (and (=> (= (ControlFlow 0 73) (- 0 78)) (forall ((i_58 Int) (i_58_1 Int) ) (!  (=> (and (and (and (and (not (= i_58 i_58_1)) (and (<= left i_58) (<= i_58 right))) (and (<= left i_58_1) (<= i_58_1 right))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (loc a_3@@1 i_58) (loc a_3@@1 i_58_1))))
 :qid |stdinbpl.1752:17|
 :skolemid |125|
))) (=> (forall ((i_58@@0 Int) (i_58_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_58@@0 i_58_1@@0)) (and (<= left i_58@@0) (<= i_58@@0 right))) (and (<= left i_58_1@@0) (<= i_58_1@@0 right))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (loc a_3@@1 i_58@@0) (loc a_3@@1 i_58_1@@0))))
 :qid |stdinbpl.1752:17|
 :skolemid |125|
)) (=> (forall ((i_58@@1 Int) ) (!  (=> (and (and (<= left i_58@@1) (<= i_58@@1 right)) (< NoPerm FullPerm)) (and (qpRange8 (loc a_3@@1 i_58@@1)) (= (invRecv8 (loc a_3@@1 i_58@@1)) i_58@@1)))
 :qid |stdinbpl.1758:24|
 :skolemid |126|
 :pattern ( (loc a_3@@1 i_58@@1))
 :pattern ( (loc a_3@@1 i_58@@1))
)) (=> (and (forall ((o_3@@14 T@U) ) (!  (=> (= (type o_3@@14) RefType) (=> (and (and (and (<= left (invRecv8 o_3@@14)) (<= (invRecv8 o_3@@14) right)) (< NoPerm FullPerm)) (qpRange8 o_3@@14)) (= (loc a_3@@1 (invRecv8 o_3@@14)) o_3@@14)))
 :qid |stdinbpl.1762:24|
 :skolemid |127|
 :pattern ( (invRecv8 o_3@@14))
)) (forall ((i_58@@2 Int) ) (!  (=> (and (<= left i_58@@2) (<= i_58@@2 right)) (not (= (loc a_3@@1 i_58@@2) null)))
 :qid |stdinbpl.1768:24|
 :skolemid |128|
 :pattern ( (loc a_3@@1 i_58@@2))
 :pattern ( (loc a_3@@1 i_58@@2))
))) (=> (and (and (forall ((o_3@@15 T@U) ) (!  (=> (= (type o_3@@15) RefType) (and (=> (and (and (and (<= left (invRecv8 o_3@@15)) (<= (invRecv8 o_3@@15) right)) (< NoPerm FullPerm)) (qpRange8 o_3@@15)) (and (=> (< NoPerm FullPerm) (= (loc a_3@@1 (invRecv8 o_3@@15)) o_3@@15)) (= (U_2_real (MapType1Select QPMask@3 o_3@@15 val)) (+ (U_2_real (MapType1Select QPMask@1 o_3@@15 val)) FullPerm)))) (=> (not (and (and (and (<= left (invRecv8 o_3@@15)) (<= (invRecv8 o_3@@15) right)) (< NoPerm FullPerm)) (qpRange8 o_3@@15))) (= (U_2_real (MapType1Select QPMask@3 o_3@@15 val)) (U_2_real (MapType1Select QPMask@1 o_3@@15 val))))))
 :qid |stdinbpl.1774:24|
 :skolemid |129|
 :pattern ( (MapType1Select QPMask@3 o_3@@15 val))
)) (forall ((o_3@@16 T@U) (f_5@@4 T@U) ) (! (let ((B@@16 (FieldTypeInv1 (type f_5@@4))))
(let ((A@@17 (FieldTypeInv0 (type f_5@@4))))
 (=> (and (and (= (type o_3@@16) RefType) (= (type f_5@@4) (FieldType A@@17 B@@16))) (not (= f_5@@4 val))) (= (U_2_real (MapType1Select QPMask@1 o_3@@16 f_5@@4)) (U_2_real (MapType1Select QPMask@3 o_3@@16 f_5@@4))))))
 :qid |stdinbpl.1778:31|
 :skolemid |130|
 :pattern ( (MapType1Select QPMask@1 o_3@@16 f_5@@4))
 :pattern ( (MapType1Select QPMask@3 o_3@@16 f_5@@4))
))) (and (state ExhaleHeap@1 QPMask@3) (= (U_2_int (MapType0Select ExhaleHeap@1 (loc a_3@@1 right) val)) pivotValue@0))) (=> (and (and (and (forall ((i_59 Int) ) (!  (=> (and (<= left i_59) (< i_59 storeIndex@0)) (< (U_2_int (MapType0Select ExhaleHeap@1 (loc a_3@@1 i_59) val)) pivotValue@0))
 :qid |stdinbpl.1785:22|
 :skolemid |131|
 :pattern ( (loc a_3@@1 i_59))
)) (forall ((i_60 Int) ) (!  (=> (and (<= storeIndex@0 i_60) (< i_60 j@0)) (<= pivotValue@0 (U_2_int (MapType0Select ExhaleHeap@1 (loc a_3@@1 i_60) val))))
 :qid |stdinbpl.1789:22|
 :skolemid |132|
 :pattern ( (loc a_3@@1 i_60))
))) (and (= (|Seq#Length| pw@2) (+ right 1)) (forall ((i_61 Int) ) (!  (=> (and (<= left i_61) (<= i_61 right)) (and (<= left (U_2_int (|Seq#Index| pw@2 i_61))) (<= (U_2_int (|Seq#Index| pw@2 i_61)) right)))
 :qid |stdinbpl.1794:22|
 :skolemid |133|
 :pattern ( (|Seq#Index| pw@2 i_61))
)))) (and (and (forall ((i_62 Int) (k_11 Int) ) (!  (=> (and (<= left i_62) (and (< i_62 k_11) (<= k_11 right))) (not (= (U_2_int (|Seq#Index| pw@2 i_62)) (U_2_int (|Seq#Index| pw@2 k_11)))))
 :qid |stdinbpl.1798:22|
 :skolemid |134|
 :pattern ( (|Seq#Index| pw@2 i_62) (|Seq#Index| pw@2 k_11))
)) (forall ((i$0_7 Int) ) (!  (=> (and (<= left i$0_7) (<= i$0_7 right)) (= (U_2_int (MapType0Select ExhaleHeap@1 (loc a_3@@1 i$0_7) val)) (U_2_int (MapType0Select Heap@@13 (loc a_3@@1 (U_2_int (|Seq#Index| pw@2 i$0_7))) val))))
 :qid |stdinbpl.1802:22|
 :skolemid |135|
 :pattern ( (|Seq#Index| pw@2 i$0_7))
))) (and (state ExhaleHeap@1 QPMask@3) (state ExhaleHeap@1 QPMask@3)))) (and (=> (= (ControlFlow 0 73) (- 0 77)) (<= 0 right)) (=> (<= 0 right) (and (=> (= (ControlFlow 0 73) (- 0 76)) (< right (len a_3@@1))) (=> (< right (len a_3@@1)) (and (=> (= (ControlFlow 0 73) (- 0 75)) (<= 0 storeIndex@0)) (=> (<= 0 storeIndex@0) (and (=> (= (ControlFlow 0 73) (- 0 74)) (< storeIndex@0 (len a_3@@1))) (=> (< storeIndex@0 (len a_3@@1)) (and (=> (= (ControlFlow 0 73) 70) anon198_Then_correct) (=> (= (ControlFlow 0 73) 72) anon198_Else_correct))))))))))))))))))))
(let ((anon167_Else_correct  (=> (and (forall ((i$0_1_1 Int) ) (!  (=> (and (<= left i$0_1_1) (<= i$0_1_1 right)) (= (U_2_int (MapType0Select ExhaleHeap@0 (loc a_3@@1 i$0_1_1) val)) (U_2_int (MapType0Select Heap@@13 (loc a_3@@1 (U_2_int (|Seq#Index| pw@1 i$0_1_1))) val))))
 :qid |stdinbpl.1306:24|
 :skolemid |91|
 :pattern ( (|Seq#Index| pw@1 i$0_1_1))
)) (IdenticalOnKnownLocations ExhaleHeap@0 ExhaleHeap@1 QPMask@1)) (and (and (=> (= (ControlFlow 0 182) 181) anon169_Then_correct) (=> (= (ControlFlow 0 182) 138) anon182_Then_correct)) (=> (= (ControlFlow 0 182) 73) anon182_Else_correct)))))
(let ((anon54_correct true))
(let ((anon168_Else_correct  (=> (and (not (and (<= left i$0) (<= i$0 right))) (= (ControlFlow 0 22) 19)) anon54_correct)))
(let ((anon168_Then_correct  (=> (and (<= left i$0) (<= i$0 right)) (and (=> (= (ControlFlow 0 20) (- 0 21)) (= (U_2_int (MapType0Select ExhaleHeap@0 (loc a_3@@1 i$0) val)) (U_2_int (MapType0Select Heap@@13 (loc a_3@@1 (U_2_int (|Seq#Index| pw@1 i$0))) val)))) (=> (= (U_2_int (MapType0Select ExhaleHeap@0 (loc a_3@@1 i$0) val)) (U_2_int (MapType0Select Heap@@13 (loc a_3@@1 (U_2_int (|Seq#Index| pw@1 i$0))) val))) (=> (= (ControlFlow 0 20) 19) anon54_correct))))))
(let ((anon165_Else_correct  (=> (forall ((i_33_1 Int) (k_5_1 Int) ) (!  (=> (and (<= left i_33_1) (and (< i_33_1 k_5_1) (<= k_5_1 right))) (not (= (U_2_int (|Seq#Index| pw@1 i_33_1)) (U_2_int (|Seq#Index| pw@1 k_5_1)))))
 :qid |stdinbpl.1295:24|
 :skolemid |90|
 :pattern ( (|Seq#Index| pw@1 i_33_1) (|Seq#Index| pw@1 k_5_1))
)) (and (and (=> (= (ControlFlow 0 183) 182) anon167_Else_correct) (=> (= (ControlFlow 0 183) 20) anon168_Then_correct)) (=> (= (ControlFlow 0 183) 22) anon168_Else_correct)))))
(let ((anon50_correct true))
(let ((anon166_Else_correct  (=> (and (not (and (<= left i_32) (and (< i_32 k_4) (<= k_4 right)))) (= (ControlFlow 0 18) 15)) anon50_correct)))
(let ((anon166_Then_correct  (=> (and (<= left i_32) (and (< i_32 k_4) (<= k_4 right))) (and (=> (= (ControlFlow 0 16) (- 0 17)) (not (= (U_2_int (|Seq#Index| pw@1 i_32)) (U_2_int (|Seq#Index| pw@1 k_4))))) (=> (not (= (U_2_int (|Seq#Index| pw@1 i_32)) (U_2_int (|Seq#Index| pw@1 k_4)))) (=> (= (ControlFlow 0 16) 15) anon50_correct))))))
(let ((anon163_Else_correct  (=> (forall ((i_31_1 Int) ) (!  (=> (and (<= left i_31_1) (<= i_31_1 right)) (and (<= left (U_2_int (|Seq#Index| pw@1 i_31_1))) (<= (U_2_int (|Seq#Index| pw@1 i_31_1)) right)))
 :qid |stdinbpl.1284:24|
 :skolemid |89|
 :pattern ( (|Seq#Index| pw@1 i_31_1))
)) (and (and (=> (= (ControlFlow 0 184) 183) anon165_Else_correct) (=> (= (ControlFlow 0 184) 16) anon166_Then_correct)) (=> (= (ControlFlow 0 184) 18) anon166_Else_correct)))))
(let ((anon46_correct true))
(let ((anon164_Else_correct  (=> (and (not (and (<= left i_30) (<= i_30 right))) (= (ControlFlow 0 14) 10)) anon46_correct)))
(let ((anon164_Then_correct  (=> (and (<= left i_30) (<= i_30 right)) (and (=> (= (ControlFlow 0 11) (- 0 13)) (<= left (U_2_int (|Seq#Index| pw@1 i_30)))) (=> (<= left (U_2_int (|Seq#Index| pw@1 i_30))) (and (=> (= (ControlFlow 0 11) (- 0 12)) (<= (U_2_int (|Seq#Index| pw@1 i_30)) right)) (=> (<= (U_2_int (|Seq#Index| pw@1 i_30)) right) (=> (= (ControlFlow 0 11) 10) anon46_correct))))))))
(let ((anon161_Else_correct  (=> (forall ((i_29_1 Int) ) (!  (=> (and (<= left i_29_1) (< i_29_1 left)) (<= pivotValue@0 (U_2_int (MapType0Select ExhaleHeap@0 (loc a_3@@1 i_29_1) val))))
 :qid |stdinbpl.1269:24|
 :skolemid |88|
 :pattern ( (loc a_3@@1 i_29_1))
)) (and (=> (= (ControlFlow 0 185) (- 0 186)) (= (|Seq#Length| pw@1) (+ right 1))) (=> (= (|Seq#Length| pw@1) (+ right 1)) (and (and (=> (= (ControlFlow 0 185) 184) anon163_Else_correct) (=> (= (ControlFlow 0 185) 11) anon164_Then_correct)) (=> (= (ControlFlow 0 185) 14) anon164_Else_correct)))))))
(let ((anon42_correct true))
(let ((anon162_Else_correct  (=> (and (not (and (<= left i_28) (< i_28 left))) (= (ControlFlow 0 9) 6)) anon42_correct)))
(let ((anon162_Then_correct  (=> (and (<= left i_28) (< i_28 left)) (and (=> (= (ControlFlow 0 7) (- 0 8)) (<= pivotValue@0 (U_2_int (MapType0Select ExhaleHeap@0 (loc a_3@@1 i_28) val)))) (=> (<= pivotValue@0 (U_2_int (MapType0Select ExhaleHeap@0 (loc a_3@@1 i_28) val))) (=> (= (ControlFlow 0 7) 6) anon42_correct))))))
(let ((anon159_Else_correct  (=> (forall ((i_27_1 Int) ) (!  (=> (and (<= left i_27_1) (< i_27_1 left)) (< (U_2_int (MapType0Select ExhaleHeap@0 (loc a_3@@1 i_27_1) val)) pivotValue@0))
 :qid |stdinbpl.1258:24|
 :skolemid |87|
 :pattern ( (loc a_3@@1 i_27_1))
)) (and (and (=> (= (ControlFlow 0 187) 185) anon161_Else_correct) (=> (= (ControlFlow 0 187) 7) anon162_Then_correct)) (=> (= (ControlFlow 0 187) 9) anon162_Else_correct)))))
(let ((anon38_correct true))
(let ((anon160_Else_correct  (=> (and (not (and (<= left i_26) (< i_26 left))) (= (ControlFlow 0 5) 2)) anon38_correct)))
(let ((anon160_Then_correct  (=> (and (<= left i_26) (< i_26 left)) (and (=> (= (ControlFlow 0 3) (- 0 4)) (< (U_2_int (MapType0Select ExhaleHeap@0 (loc a_3@@1 i_26) val)) pivotValue@0)) (=> (< (U_2_int (MapType0Select ExhaleHeap@0 (loc a_3@@1 i_26) val)) pivotValue@0) (=> (= (ControlFlow 0 3) 2) anon38_correct))))))
(let ((anon35_correct  (=> (and (and (= (U_2_int (MapType0Select ExhaleHeap@0 (loc a_3@@1 pivotIndex) val)) (U_2_int (MapType0Select Heap@@13 (loc a_3@@1 right) val))) (= (U_2_int (MapType0Select ExhaleHeap@0 (loc a_3@@1 right) val)) (U_2_int (MapType0Select Heap@@13 (loc a_3@@1 pivotIndex) val)))) (and (state ExhaleHeap@0 Mask@5) (state ExhaleHeap@0 Mask@5))) (and (=> (= (ControlFlow 0 188) (- 0 199)) (>= right 0)) (=> (>= right 0) (and (=> (= (ControlFlow 0 188) (- 0 198)) (< right (|Seq#Length| pw@0))) (=> (< right (|Seq#Length| pw@0)) (and (=> (= (ControlFlow 0 188) (- 0 197)) (>= pivotIndex 0)) (=> (>= pivotIndex 0) (and (=> (= (ControlFlow 0 188) (- 0 196)) (< pivotIndex (|Seq#Length| pw@0))) (=> (< pivotIndex (|Seq#Length| pw@0)) (=> (and (and (= pw@1 (|Seq#Append| (|Seq#Take| (|Seq#Append| (|Seq#Take| pw@0 pivotIndex) (|Seq#Append| (|Seq#Singleton| (|Seq#Index| pw@0 right)) (|Seq#Drop| pw@0 (+ pivotIndex 1)))) right) (|Seq#Append| (|Seq#Singleton| (|Seq#Index| pw@0 pivotIndex)) (|Seq#Drop| (|Seq#Append| (|Seq#Take| pw@0 pivotIndex) (|Seq#Append| (|Seq#Singleton| (|Seq#Index| pw@0 right)) (|Seq#Drop| pw@0 (+ pivotIndex 1)))) (+ right 1))))) (state ExhaleHeap@0 Mask@5)) (and (state ExhaleHeap@0 Mask@5) (state ExhaleHeap@0 Mask@5))) (and (=> (= (ControlFlow 0 188) (- 0 195)) (<= left left)) (=> (<= left left) (and (=> (= (ControlFlow 0 188) (- 0 194)) (<= left right)) (=> (<= left right) (and (=> (= (ControlFlow 0 188) (- 0 193)) (<= left left)) (=> (<= left left) (and (=> (= (ControlFlow 0 188) (- 0 192)) (<= left left)) (=> (<= left left) (and (=> (= (ControlFlow 0 188) (- 0 191)) (forall ((i_25 Int) (i_25_1 Int) ) (!  (=> (and (and (and (and (not (= i_25 i_25_1)) (and (<= left i_25) (<= i_25 right))) (and (<= left i_25_1) (<= i_25_1 right))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (loc a_3@@1 i_25) (loc a_3@@1 i_25_1))))
 :qid |stdinbpl.1215:21|
 :skolemid |81|
 :pattern ( (neverTriggered4 i_25) (neverTriggered4 i_25_1))
))) (=> (forall ((i_25@@0 Int) (i_25_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_25@@0 i_25_1@@0)) (and (<= left i_25@@0) (<= i_25@@0 right))) (and (<= left i_25_1@@0) (<= i_25_1@@0 right))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (loc a_3@@1 i_25@@0) (loc a_3@@1 i_25_1@@0))))
 :qid |stdinbpl.1215:21|
 :skolemid |81|
 :pattern ( (neverTriggered4 i_25@@0) (neverTriggered4 i_25_1@@0))
)) (and (=> (= (ControlFlow 0 188) (- 0 190)) (forall ((i_25@@1 Int) ) (!  (=> (and (<= left i_25@@1) (<= i_25@@1 right)) (>= (U_2_real (MapType1Select Mask@5 (loc a_3@@1 i_25@@1) val)) FullPerm))
 :qid |stdinbpl.1222:21|
 :skolemid |82|
 :pattern ( (loc a_3@@1 i_25@@1))
 :pattern ( (loc a_3@@1 i_25@@1))
))) (=> (forall ((i_25@@2 Int) ) (!  (=> (and (<= left i_25@@2) (<= i_25@@2 right)) (>= (U_2_real (MapType1Select Mask@5 (loc a_3@@1 i_25@@2) val)) FullPerm))
 :qid |stdinbpl.1222:21|
 :skolemid |82|
 :pattern ( (loc a_3@@1 i_25@@2))
 :pattern ( (loc a_3@@1 i_25@@2))
)) (=> (and (and (forall ((i_25@@3 Int) ) (!  (=> (and (and (<= left i_25@@3) (<= i_25@@3 right)) (< NoPerm FullPerm)) (and (qpRange4 (loc a_3@@1 i_25@@3)) (= (invRecv4 (loc a_3@@1 i_25@@3)) i_25@@3)))
 :qid |stdinbpl.1228:26|
 :skolemid |83|
 :pattern ( (loc a_3@@1 i_25@@3))
 :pattern ( (loc a_3@@1 i_25@@3))
)) (forall ((o_3@@17 T@U) ) (!  (=> (= (type o_3@@17) RefType) (=> (and (and (<= left (invRecv4 o_3@@17)) (<= (invRecv4 o_3@@17) right)) (and (< NoPerm FullPerm) (qpRange4 o_3@@17))) (= (loc a_3@@1 (invRecv4 o_3@@17)) o_3@@17)))
 :qid |stdinbpl.1232:26|
 :skolemid |84|
 :pattern ( (invRecv4 o_3@@17))
))) (and (forall ((o_3@@18 T@U) ) (!  (=> (= (type o_3@@18) RefType) (and (=> (and (and (<= left (invRecv4 o_3@@18)) (<= (invRecv4 o_3@@18) right)) (and (< NoPerm FullPerm) (qpRange4 o_3@@18))) (and (= (loc a_3@@1 (invRecv4 o_3@@18)) o_3@@18) (= (U_2_real (MapType1Select QPMask@1 o_3@@18 val)) (- (U_2_real (MapType1Select Mask@5 o_3@@18 val)) FullPerm)))) (=> (not (and (and (<= left (invRecv4 o_3@@18)) (<= (invRecv4 o_3@@18) right)) (and (< NoPerm FullPerm) (qpRange4 o_3@@18)))) (= (U_2_real (MapType1Select QPMask@1 o_3@@18 val)) (U_2_real (MapType1Select Mask@5 o_3@@18 val))))))
 :qid |stdinbpl.1238:26|
 :skolemid |85|
 :pattern ( (MapType1Select QPMask@1 o_3@@18 val))
)) (forall ((o_3@@19 T@U) (f_5@@5 T@U) ) (! (let ((B@@17 (FieldTypeInv1 (type f_5@@5))))
(let ((A@@18 (FieldTypeInv0 (type f_5@@5))))
 (=> (and (and (= (type o_3@@19) RefType) (= (type f_5@@5) (FieldType A@@18 B@@17))) (not (= f_5@@5 val))) (= (U_2_real (MapType1Select Mask@5 o_3@@19 f_5@@5)) (U_2_real (MapType1Select QPMask@1 o_3@@19 f_5@@5))))))
 :qid |stdinbpl.1244:33|
 :skolemid |86|
 :pattern ( (MapType1Select QPMask@1 o_3@@19 f_5@@5))
)))) (and (=> (= (ControlFlow 0 188) (- 0 189)) (= (U_2_int (MapType0Select ExhaleHeap@0 (loc a_3@@1 right) val)) pivotValue@0)) (=> (= (U_2_int (MapType0Select ExhaleHeap@0 (loc a_3@@1 right) val)) pivotValue@0) (and (and (=> (= (ControlFlow 0 188) 187) anon159_Else_correct) (=> (= (ControlFlow 0 188) 3) anon160_Then_correct)) (=> (= (ControlFlow 0 188) 5) anon160_Else_correct)))))))))))))))))))))))))))))
(let ((anon158_Else_correct  (=> (= pivotIndex right) (=> (and (= Mask@5 Mask@3) (= (ControlFlow 0 201) 188)) anon35_correct))))
(let ((anon158_Then_correct  (=> (and (not (= pivotIndex right)) (not (= (loc a_3@@1 right) null))) (=> (and (and (= Mask@4 (MapType1Store Mask@3 (loc a_3@@1 right) val (real_2_U (+ (U_2_real (MapType1Select Mask@3 (loc a_3@@1 right) val)) FullPerm)))) (state ExhaleHeap@0 Mask@4)) (and (= Mask@5 Mask@4) (= (ControlFlow 0 200) 188))) anon35_correct))))
(let ((anon33_correct  (=> (and (and (IdenticalOnKnownLocations Heap@@13 ExhaleHeap@0 Mask@2) (not (= (loc a_3@@1 pivotIndex) null))) (and (= Mask@3 (MapType1Store Mask@2 (loc a_3@@1 pivotIndex) val (real_2_U (+ (U_2_real (MapType1Select Mask@2 (loc a_3@@1 pivotIndex) val)) FullPerm)))) (state ExhaleHeap@0 Mask@3))) (and (=> (= (ControlFlow 0 202) 200) anon158_Then_correct) (=> (= (ControlFlow 0 202) 201) anon158_Else_correct)))))
(let ((anon32_correct  (=> (= Mask@1 (MapType1Store Mask@0 (loc a_3@@1 right) val (real_2_U (- (U_2_real (MapType1Select Mask@0 (loc a_3@@1 right) val)) FullPerm)))) (=> (and (= Mask@2 Mask@1) (= (ControlFlow 0 204) 202)) anon33_correct))))
(let ((anon157_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 207) 204)) anon32_correct)))
(let ((anon157_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 205) (- 0 206)) (<= FullPerm (U_2_real (MapType1Select Mask@0 (loc a_3@@1 right) val)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@0 (loc a_3@@1 right) val))) (=> (= (ControlFlow 0 205) 204) anon32_correct))))))
(let ((anon156_Then_correct  (=> (not (= pivotIndex right)) (and (=> (= (ControlFlow 0 208) 205) anon157_Then_correct) (=> (= (ControlFlow 0 208) 207) anon157_Else_correct)))))
(let ((anon156_Else_correct  (=> (= pivotIndex right) (=> (and (= Mask@2 Mask@0) (= (ControlFlow 0 203) 202)) anon33_correct))))
(let ((anon29_correct  (=> (= Mask@0 (MapType1Store QPMask@0 (loc a_3@@1 pivotIndex) val (real_2_U (- (U_2_real (MapType1Select QPMask@0 (loc a_3@@1 pivotIndex) val)) FullPerm)))) (and (=> (= (ControlFlow 0 209) 208) anon156_Then_correct) (=> (= (ControlFlow 0 209) 203) anon156_Else_correct)))))
(let ((anon155_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 212) 209)) anon29_correct)))
(let ((anon155_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 210) (- 0 211)) (<= FullPerm (U_2_real (MapType1Select QPMask@0 (loc a_3@@1 pivotIndex) val)))) (=> (<= FullPerm (U_2_real (MapType1Select QPMask@0 (loc a_3@@1 pivotIndex) val))) (=> (= (ControlFlow 0 210) 209) anon29_correct))))))
(let ((anon142_Else_correct  (and (=> (= (ControlFlow 0 213) (- 0 218)) (HasDirectPerm QPMask@0 (loc a_3@@1 pivotIndex) val)) (=> (HasDirectPerm QPMask@0 (loc a_3@@1 pivotIndex) val) (=> (and (and (= pivotValue@0 (U_2_int (MapType0Select Heap@@13 (loc a_3@@1 pivotIndex) val))) (state Heap@@13 QPMask@0)) (and (= pw@0 (|Seq#Range| 0 (+ right 1))) (state Heap@@13 QPMask@0))) (and (=> (= (ControlFlow 0 213) (- 0 217)) (<= 0 pivotIndex)) (=> (<= 0 pivotIndex) (and (=> (= (ControlFlow 0 213) (- 0 216)) (< pivotIndex (len a_3@@1))) (=> (< pivotIndex (len a_3@@1)) (and (=> (= (ControlFlow 0 213) (- 0 215)) (<= 0 right)) (=> (<= 0 right) (and (=> (= (ControlFlow 0 213) (- 0 214)) (< right (len a_3@@1))) (=> (< right (len a_3@@1)) (and (=> (= (ControlFlow 0 213) 210) anon155_Then_correct) (=> (= (ControlFlow 0 213) 212) anon155_Else_correct)))))))))))))))
(let ((anon141_Else_correct  (and (=> (= (ControlFlow 0 263) (- 0 264)) (forall ((i_1 Int) (i_1_1 Int) ) (!  (=> (and (and (and (and (not (= i_1 i_1_1)) (and (<= left i_1) (<= i_1 right))) (and (<= left i_1_1) (<= i_1_1 right))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (loc a_3@@1 i_1) (loc a_3@@1 i_1_1))))
 :qid |stdinbpl.914:15|
 :skolemid |64|
))) (=> (forall ((i_1@@0 Int) (i_1_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_1@@0 i_1_1@@0)) (and (<= left i_1@@0) (<= i_1@@0 right))) (and (<= left i_1_1@@0) (<= i_1_1@@0 right))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (loc a_3@@1 i_1@@0) (loc a_3@@1 i_1_1@@0))))
 :qid |stdinbpl.914:15|
 :skolemid |64|
)) (=> (forall ((i_1@@1 Int) ) (!  (=> (and (and (<= left i_1@@1) (<= i_1@@1 right)) (< NoPerm FullPerm)) (and (qpRange1 (loc a_3@@1 i_1@@1)) (= (invRecv1 (loc a_3@@1 i_1@@1)) i_1@@1)))
 :qid |stdinbpl.920:22|
 :skolemid |65|
 :pattern ( (loc a_3@@1 i_1@@1))
 :pattern ( (loc a_3@@1 i_1@@1))
)) (=> (and (forall ((o_3@@20 T@U) ) (!  (=> (= (type o_3@@20) RefType) (=> (and (and (and (<= left (invRecv1 o_3@@20)) (<= (invRecv1 o_3@@20) right)) (< NoPerm FullPerm)) (qpRange1 o_3@@20)) (= (loc a_3@@1 (invRecv1 o_3@@20)) o_3@@20)))
 :qid |stdinbpl.924:22|
 :skolemid |66|
 :pattern ( (invRecv1 o_3@@20))
)) (forall ((i_1@@2 Int) ) (!  (=> (and (<= left i_1@@2) (<= i_1@@2 right)) (not (= (loc a_3@@1 i_1@@2) null)))
 :qid |stdinbpl.930:22|
 :skolemid |67|
 :pattern ( (loc a_3@@1 i_1@@2))
 :pattern ( (loc a_3@@1 i_1@@2))
))) (=> (and (and (forall ((o_3@@21 T@U) ) (!  (=> (= (type o_3@@21) RefType) (and (=> (and (and (and (<= left (invRecv1 o_3@@21)) (<= (invRecv1 o_3@@21) right)) (< NoPerm FullPerm)) (qpRange1 o_3@@21)) (and (=> (< NoPerm FullPerm) (= (loc a_3@@1 (invRecv1 o_3@@21)) o_3@@21)) (= (U_2_real (MapType1Select QPMask@0 o_3@@21 val)) (+ (U_2_real (MapType1Select ZeroMask o_3@@21 val)) FullPerm)))) (=> (not (and (and (and (<= left (invRecv1 o_3@@21)) (<= (invRecv1 o_3@@21) right)) (< NoPerm FullPerm)) (qpRange1 o_3@@21))) (= (U_2_real (MapType1Select QPMask@0 o_3@@21 val)) (U_2_real (MapType1Select ZeroMask o_3@@21 val))))))
 :qid |stdinbpl.936:22|
 :skolemid |68|
 :pattern ( (MapType1Select QPMask@0 o_3@@21 val))
)) (forall ((o_3@@22 T@U) (f_5@@6 T@U) ) (! (let ((B@@18 (FieldTypeInv1 (type f_5@@6))))
(let ((A@@19 (FieldTypeInv0 (type f_5@@6))))
 (=> (and (and (= (type o_3@@22) RefType) (= (type f_5@@6) (FieldType A@@19 B@@18))) (not (= f_5@@6 val))) (= (U_2_real (MapType1Select ZeroMask o_3@@22 f_5@@6)) (U_2_real (MapType1Select QPMask@0 o_3@@22 f_5@@6))))))
 :qid |stdinbpl.940:29|
 :skolemid |69|
 :pattern ( (MapType1Select ZeroMask o_3@@22 f_5@@6))
 :pattern ( (MapType1Select QPMask@0 o_3@@22 f_5@@6))
))) (and (state Heap@@13 QPMask@0) (state Heap@@13 QPMask@0))) (and (=> (= (ControlFlow 0 263) 262) anon142_Then_correct) (=> (= (ControlFlow 0 263) 213) anon142_Else_correct)))))))))
(let ((anon141_Then_correct true))
(let ((anon0_correct  (=> (state Heap@@13 ZeroMask) (=> (and (and (and (= AssumeFunctionsAbove (- 0 1)) (<= 0 left)) (and (< left right) (< right (len a_3@@1)))) (and (and (state Heap@@13 ZeroMask) (<= left pivotIndex)) (and (<= pivotIndex right) (state Heap@@13 ZeroMask)))) (and (=> (= (ControlFlow 0 265) 1) anon141_Then_correct) (=> (= (ControlFlow 0 265) 263) anon141_Else_correct))))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 266) 265) anon0_correct)))
PreconditionGeneratedEntry_correct)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
))
(check-sat)
(pop 1)
; Valid
(get-info :rlimit)
