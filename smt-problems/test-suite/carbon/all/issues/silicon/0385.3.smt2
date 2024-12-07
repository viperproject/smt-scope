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
(declare-fun flag () T@U)
(declare-fun FieldType (T@T T@T) T@T)
(declare-fun FieldTypeInv0 (T@T) T@T)
(declare-fun FieldTypeInv1 (T@T) T@T)
(declare-fun NormalFieldType () T@T)
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
(declare-fun |foo_1_1'| (T@U T@U T@U) Bool)
(declare-fun dummyFunction (T@U) Bool)
(declare-fun |foo_1_1#triggerStateless| (T@U T@U) Bool)
(declare-fun |foo_1_2'| (T@U T@U T@U) Bool)
(declare-fun |foo_1_2#triggerStateless| (T@U T@U) Bool)
(declare-fun |foo_2_1'| (T@U T@U T@U) Bool)
(declare-fun |foo_2_1#triggerStateless| (T@U T@U) Bool)
(declare-fun |foo_2_2'| (T@U T@U T@U) Bool)
(declare-fun |foo_2_2#triggerStateless| (T@U T@U) Bool)
(declare-fun IdenticalOnKnownLocations (T@U T@U T@U) Bool)
(declare-fun IsPredicateField (T@U) Bool)
(declare-fun null () T@U)
(declare-fun PredicateMaskField (T@U) T@U)
(declare-fun FrameTypeType () T@T)
(declare-fun HasDirectPerm (T@U T@U T@U) Bool)
(declare-fun IsWandField (T@U) Bool)
(declare-fun WandMaskField (T@U) T@U)
(declare-fun |foo_2_1#frame| (T@U T@U T@U) Bool)
(declare-fun FrameFragment (T@U) T@U)
(declare-fun guard (T@U) Bool)
(declare-fun CombineFrames (T@U T@U) T@U)
(declare-fun |foo_2_2#frame| (T@U T@U T@U) Bool)
(declare-fun |foo_1_1#frame| (T@U T@U T@U) Bool)
(declare-fun EmptyFrame () T@U)
(declare-fun |foo_1_2#frame| (T@U T@U T@U) Bool)
(declare-fun dummyHeap () T@U)
(declare-fun ZeroMask () T@U)
(declare-fun InsidePredicate (T@U T@U T@U T@U) Bool)
(declare-fun sumMask (T@U T@U T@U) Bool)
(declare-fun ConditionalFrame (Real T@U) T@U)
(declare-fun NoPerm () Real)
(declare-fun FullPerm () Real)
(declare-fun foo_2_2 (T@U T@U T@U) Bool)
(declare-fun AssumeFunctionsAbove () Int)
(declare-fun foo_1_2 (T@U T@U T@U) Bool)
(declare-fun foo_1_1 (T@U T@U T@U) Bool)
(declare-fun foo_2_1 (T@U T@U T@U) Bool)
(declare-fun ZeroPMask () T@U)
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
))) (= (Ctor NormalFieldType) 7)) (= (type $allocated) (FieldType NormalFieldType boolType))) (= (type flag) (FieldType NormalFieldType boolType))))
(assert (distinct $allocated flag)
)
(assert  (and (and (and (and (and (and (forall ((arg0@@14 T@T) ) (! (= (Ctor (MapType0Type arg0@@14)) 8)
 :qid |ctor:MapType0Type|
)) (forall ((arg0@@15 T@T) ) (! (= (MapType0TypeInv0 (MapType0Type arg0@@15)) arg0@@15)
 :qid |typeInv:MapType0TypeInv0|
 :pattern ( (MapType0Type arg0@@15))
))) (forall ((arg0@@16 T@U) (arg1@@2 T@U) (arg2 T@U) ) (! (let ((B (FieldTypeInv1 (type arg2))))
(= (type (MapType0Select arg0@@16 arg1@@2 arg2)) B))
 :qid |funType:MapType0Select|
 :pattern ( (MapType0Select arg0@@16 arg1@@2 arg2))
))) (forall ((arg0@@17 T@U) (arg1@@3 T@U) (arg2@@0 T@U) (arg3 T@U) ) (! (let ((aVar0 (type arg1@@3)))
(= (type (MapType0Store arg0@@17 arg1@@3 arg2@@0 arg3)) (MapType0Type aVar0)))
 :qid |funType:MapType0Store|
 :pattern ( (MapType0Store arg0@@17 arg1@@3 arg2@@0 arg3))
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
)))) (= (Ctor RefType) 9)))
(assert (forall ((Heap0 T@U) (Heap1 T@U) ) (!  (=> (and (and (= (type Heap0) (MapType0Type RefType)) (= (type Heap1) (MapType0Type RefType))) (succHeap Heap0 Heap1)) (succHeapTrans Heap0 Heap1))
 :qid |stdinbpl.88:15|
 :skolemid |11|
 :pattern ( (succHeap Heap0 Heap1))
)))
(assert  (and (and (and (and (and (and (forall ((arg0@@18 T@T) (arg1@@4 T@T) ) (! (= (Ctor (MapType1Type arg0@@18 arg1@@4)) 10)
 :qid |ctor:MapType1Type|
)) (forall ((arg0@@19 T@T) (arg1@@5 T@T) ) (! (= (MapType1TypeInv0 (MapType1Type arg0@@19 arg1@@5)) arg0@@19)
 :qid |typeInv:MapType1TypeInv0|
 :pattern ( (MapType1Type arg0@@19 arg1@@5))
))) (forall ((arg0@@20 T@T) (arg1@@6 T@T) ) (! (= (MapType1TypeInv1 (MapType1Type arg0@@20 arg1@@6)) arg1@@6)
 :qid |typeInv:MapType1TypeInv1|
 :pattern ( (MapType1Type arg0@@20 arg1@@6))
))) (forall ((arg0@@21 T@U) (arg1@@7 T@U) (arg2@@1 T@U) ) (! (let ((aVar1 (MapType1TypeInv1 (type arg0@@21))))
(= (type (MapType1Select arg0@@21 arg1@@7 arg2@@1)) aVar1))
 :qid |funType:MapType1Select|
 :pattern ( (MapType1Select arg0@@21 arg1@@7 arg2@@1))
))) (forall ((arg0@@22 T@U) (arg1@@8 T@U) (arg2@@2 T@U) (arg3@@0 T@U) ) (! (let ((aVar1@@0 (type arg3@@0)))
(let ((aVar0@@0 (type arg1@@8)))
(= (type (MapType1Store arg0@@22 arg1@@8 arg2@@2 arg3@@0)) (MapType1Type aVar0@@0 aVar1@@0))))
 :qid |funType:MapType1Store|
 :pattern ( (MapType1Store arg0@@22 arg1@@8 arg2@@2 arg3@@0))
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
(assert (forall ((Heap@@0 T@U) (y@@1 T@U) (x@@8 T@U) ) (!  (=> (and (and (= (type Heap@@0) (MapType0Type RefType)) (= (type y@@1) RefType)) (= (type x@@8) RefType)) (dummyFunction (bool_2_U (|foo_1_1#triggerStateless| y@@1 x@@8))))
 :qid |stdinbpl.210:15|
 :skolemid |23|
 :pattern ( (|foo_1_1'| Heap@@0 y@@1 x@@8))
)))
(assert (forall ((Heap@@1 T@U) (y@@2 T@U) (x@@9 T@U) ) (!  (=> (and (and (= (type Heap@@1) (MapType0Type RefType)) (= (type y@@2) RefType)) (= (type x@@9) RefType)) (dummyFunction (bool_2_U (|foo_1_2#triggerStateless| y@@2 x@@9))))
 :qid |stdinbpl.284:15|
 :skolemid |27|
 :pattern ( (|foo_1_2'| Heap@@1 y@@2 x@@9))
)))
(assert (forall ((Heap@@2 T@U) (y@@3 T@U) (x@@10 T@U) ) (!  (=> (and (and (= (type Heap@@2) (MapType0Type RefType)) (= (type y@@3) RefType)) (= (type x@@10) RefType)) (dummyFunction (bool_2_U (|foo_2_1#triggerStateless| y@@3 x@@10))))
 :qid |stdinbpl.358:15|
 :skolemid |31|
 :pattern ( (|foo_2_1'| Heap@@2 y@@3 x@@10))
)))
(assert (forall ((Heap@@3 T@U) (y@@4 T@U) (x@@11 T@U) ) (!  (=> (and (and (= (type Heap@@3) (MapType0Type RefType)) (= (type y@@4) RefType)) (= (type x@@11) RefType)) (dummyFunction (bool_2_U (|foo_2_2#triggerStateless| y@@4 x@@11))))
 :qid |stdinbpl.436:15|
 :skolemid |35|
 :pattern ( (|foo_2_2'| Heap@@3 y@@4 x@@11))
)))
(assert  (and (and (= (Ctor FrameTypeType) 11) (= (type null) RefType)) (forall ((arg0@@23 T@U) ) (! (let ((A (FieldTypeInv0 (type arg0@@23))))
(= (type (PredicateMaskField arg0@@23)) (FieldType A (MapType1Type RefType boolType))))
 :qid |funType:PredicateMaskField|
 :pattern ( (PredicateMaskField arg0@@23))
))))
(assert (forall ((Heap@@4 T@U) (ExhaleHeap T@U) (Mask@@0 T@U) (pm_f T@U) ) (! (let ((C (FieldTypeInv0 (type pm_f))))
 (=> (and (and (and (and (and (= (type Heap@@4) (MapType0Type RefType)) (= (type ExhaleHeap) (MapType0Type RefType))) (= (type Mask@@0) (MapType1Type RefType realType))) (= (type pm_f) (FieldType C FrameTypeType))) (IdenticalOnKnownLocations Heap@@4 ExhaleHeap Mask@@0)) (and (HasDirectPerm Mask@@0 null pm_f) (IsPredicateField pm_f))) (= (MapType0Select Heap@@4 null (PredicateMaskField pm_f)) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))))
 :qid |stdinbpl.47:19|
 :skolemid |2|
 :pattern ( (IdenticalOnKnownLocations Heap@@4 ExhaleHeap Mask@@0) (IsPredicateField pm_f) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))
)))
(assert (forall ((arg0@@24 T@U) ) (! (let ((A@@0 (FieldTypeInv0 (type arg0@@24))))
(= (type (WandMaskField arg0@@24)) (FieldType A@@0 (MapType1Type RefType boolType))))
 :qid |funType:WandMaskField|
 :pattern ( (WandMaskField arg0@@24))
)))
(assert (forall ((Heap@@5 T@U) (ExhaleHeap@@0 T@U) (Mask@@1 T@U) (pm_f@@0 T@U) ) (! (let ((C@@0 (FieldTypeInv0 (type pm_f@@0))))
 (=> (and (and (and (and (and (= (type Heap@@5) (MapType0Type RefType)) (= (type ExhaleHeap@@0) (MapType0Type RefType))) (= (type Mask@@1) (MapType1Type RefType realType))) (= (type pm_f@@0) (FieldType C@@0 FrameTypeType))) (IdenticalOnKnownLocations Heap@@5 ExhaleHeap@@0 Mask@@1)) (and (HasDirectPerm Mask@@1 null pm_f@@0) (IsWandField pm_f@@0))) (= (MapType0Select Heap@@5 null (WandMaskField pm_f@@0)) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))))
 :qid |stdinbpl.60:19|
 :skolemid |5|
 :pattern ( (IdenticalOnKnownLocations Heap@@5 ExhaleHeap@@0 Mask@@1) (IsWandField pm_f@@0) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))
)))
(assert  (and (forall ((arg0@@25 T@U) ) (! (= (type (FrameFragment arg0@@25)) FrameTypeType)
 :qid |funType:FrameFragment|
 :pattern ( (FrameFragment arg0@@25))
)) (forall ((arg0@@26 T@U) (arg1@@9 T@U) ) (! (= (type (CombineFrames arg0@@26 arg1@@9)) FrameTypeType)
 :qid |funType:CombineFrames|
 :pattern ( (CombineFrames arg0@@26 arg1@@9))
))))
(assert (forall ((Heap@@6 T@U) (Mask@@2 T@U) (y@@5 T@U) (x@@12 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@6) (MapType0Type RefType)) (= (type Mask@@2) (MapType1Type RefType realType))) (= (type y@@5) RefType)) (= (type x@@12) RefType)) (state Heap@@6 Mask@@2)) (= (|foo_2_1'| Heap@@6 y@@5 x@@12) (|foo_2_1#frame| (FrameFragment (ite (guard y@@5) (CombineFrames (FrameFragment (MapType0Select Heap@@6 x@@12 flag)) (FrameFragment (MapType0Select Heap@@6 y@@5 flag))) (FrameFragment (MapType0Select Heap@@6 x@@12 flag)))) y@@5 x@@12)))
 :qid |stdinbpl.371:15|
 :skolemid |33|
 :pattern ( (state Heap@@6 Mask@@2) (|foo_2_1'| Heap@@6 y@@5 x@@12))
)))
(assert (forall ((Heap@@7 T@U) (Mask@@3 T@U) (y@@6 T@U) (x@@13 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@7) (MapType0Type RefType)) (= (type Mask@@3) (MapType1Type RefType realType))) (= (type y@@6) RefType)) (= (type x@@13) RefType)) (state Heap@@7 Mask@@3)) (= (|foo_2_2'| Heap@@7 y@@6 x@@13) (|foo_2_2#frame| (FrameFragment (ite (guard y@@6) (CombineFrames (FrameFragment (MapType0Select Heap@@7 x@@13 flag)) (FrameFragment (MapType0Select Heap@@7 y@@6 flag))) (FrameFragment (MapType0Select Heap@@7 x@@13 flag)))) y@@6 x@@13)))
 :qid |stdinbpl.449:15|
 :skolemid |37|
 :pattern ( (state Heap@@7 Mask@@3) (|foo_2_2'| Heap@@7 y@@6 x@@13))
)))
(assert (= (type EmptyFrame) FrameTypeType))
(assert (forall ((Heap@@8 T@U) (Mask@@4 T@U) (y@@7 T@U) (x@@14 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@8) (MapType0Type RefType)) (= (type Mask@@4) (MapType1Type RefType realType))) (= (type y@@7) RefType)) (= (type x@@14) RefType)) (state Heap@@8 Mask@@4)) (= (|foo_1_1'| Heap@@8 y@@7 x@@14) (|foo_1_1#frame| (CombineFrames (FrameFragment (MapType0Select Heap@@8 x@@14 flag)) (FrameFragment (ite (guard y@@7) (FrameFragment (MapType0Select Heap@@8 y@@7 flag)) EmptyFrame))) y@@7 x@@14)))
 :qid |stdinbpl.223:15|
 :skolemid |25|
 :pattern ( (state Heap@@8 Mask@@4) (|foo_1_1'| Heap@@8 y@@7 x@@14))
)))
(assert (forall ((Heap@@9 T@U) (Mask@@5 T@U) (y@@8 T@U) (x@@15 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@9) (MapType0Type RefType)) (= (type Mask@@5) (MapType1Type RefType realType))) (= (type y@@8) RefType)) (= (type x@@15) RefType)) (state Heap@@9 Mask@@5)) (= (|foo_1_2'| Heap@@9 y@@8 x@@15) (|foo_1_2#frame| (CombineFrames (FrameFragment (MapType0Select Heap@@9 x@@15 flag)) (FrameFragment (ite (guard y@@8) (FrameFragment (MapType0Select Heap@@9 y@@8 flag)) EmptyFrame))) y@@8 x@@15)))
 :qid |stdinbpl.297:15|
 :skolemid |29|
 :pattern ( (state Heap@@9 Mask@@5) (|foo_1_2'| Heap@@9 y@@8 x@@15))
)))
(assert (forall ((Heap@@10 T@U) (ExhaleHeap@@1 T@U) (Mask@@6 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@10) (MapType0Type RefType)) (= (type ExhaleHeap@@1) (MapType0Type RefType))) (= (type Mask@@6) (MapType1Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@10 ExhaleHeap@@1 Mask@@6)) (U_2_bool (MapType0Select Heap@@10 o_1 $allocated))) (U_2_bool (MapType0Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.73:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@10 ExhaleHeap@@1 Mask@@6) (MapType0Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert (forall ((Heap@@11 T@U) (ExhaleHeap@@2 T@U) (Mask@@7 T@U) (o_1@@0 T@U) (f_2 T@U) ) (! (let ((B@@1 (FieldTypeInv1 (type f_2))))
(let ((A@@1 (FieldTypeInv0 (type f_2))))
 (=> (and (and (and (and (and (and (= (type Heap@@11) (MapType0Type RefType)) (= (type ExhaleHeap@@2) (MapType0Type RefType))) (= (type Mask@@7) (MapType1Type RefType realType))) (= (type o_1@@0) RefType)) (= (type f_2) (FieldType A@@1 B@@1))) (IdenticalOnKnownLocations Heap@@11 ExhaleHeap@@2 Mask@@7)) (HasDirectPerm Mask@@7 o_1@@0 f_2)) (= (MapType0Select Heap@@11 o_1@@0 f_2) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2)))))
 :qid |stdinbpl.42:22|
 :skolemid |1|
 :pattern ( (IdenticalOnKnownLocations Heap@@11 ExhaleHeap@@2 Mask@@7) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2))
)))
(assert  (and (= (type dummyHeap) (MapType0Type RefType)) (= (type ZeroMask) (MapType1Type RefType realType))))
(assert (state dummyHeap ZeroMask))
(assert (forall ((p T@U) (v_1 T@U) (w T@U) ) (! (let ((A@@2 (FieldTypeInv0 (type p))))
 (=> (and (and (= (type p) (FieldType A@@2 FrameTypeType)) (= (type v_1) FrameTypeType)) (= (type w) FrameTypeType)) (not (InsidePredicate p v_1 p w))))
 :qid |stdinbpl.176:19|
 :skolemid |21|
 :pattern ( (InsidePredicate p v_1 p w))
)))
(assert  (not (IsPredicateField flag)))
(assert  (not (IsWandField flag)))
(assert (forall ((Heap@@12 T@U) (ExhaleHeap@@3 T@U) (Mask@@8 T@U) ) (!  (=> (and (and (and (= (type Heap@@12) (MapType0Type RefType)) (= (type ExhaleHeap@@3) (MapType0Type RefType))) (= (type Mask@@8) (MapType1Type RefType realType))) (IdenticalOnKnownLocations Heap@@12 ExhaleHeap@@3 Mask@@8)) (succHeap Heap@@12 ExhaleHeap@@3))
 :qid |stdinbpl.83:15|
 :skolemid |10|
 :pattern ( (IdenticalOnKnownLocations Heap@@12 ExhaleHeap@@3 Mask@@8))
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
(assert (forall ((arg0@@27 Real) (arg1@@10 T@U) ) (! (= (type (ConditionalFrame arg0@@27 arg1@@10)) FrameTypeType)
 :qid |funType:ConditionalFrame|
 :pattern ( (ConditionalFrame arg0@@27 arg1@@10))
)))
(assert (forall ((p@@0 Real) (f_6 T@U) ) (!  (=> (= (type f_6) FrameTypeType) (= (ConditionalFrame p@@0 f_6) (ite (> p@@0 0.0) f_6 EmptyFrame)))
 :qid |stdinbpl.164:15|
 :skolemid |19|
 :pattern ( (ConditionalFrame p@@0 f_6))
)))
(assert (forall ((Mask@@9 T@U) (o_2@@0 T@U) (f_4@@0 T@U) ) (! (let ((B@@3 (FieldTypeInv1 (type f_4@@0))))
(let ((A@@4 (FieldTypeInv0 (type f_4@@0))))
 (=> (and (and (= (type Mask@@9) (MapType1Type RefType realType)) (= (type o_2@@0) RefType)) (= (type f_4@@0) (FieldType A@@4 B@@3))) (= (HasDirectPerm Mask@@9 o_2@@0 f_4@@0) (> (U_2_real (MapType1Select Mask@@9 o_2@@0 f_4@@0)) NoPerm)))))
 :qid |stdinbpl.133:22|
 :skolemid |17|
 :pattern ( (HasDirectPerm Mask@@9 o_2@@0 f_4@@0))
)))
(assert (forall ((o_2@@1 T@U) (f_4@@1 T@U) ) (! (let ((B@@4 (FieldTypeInv1 (type f_4@@1))))
(let ((A@@5 (FieldTypeInv0 (type f_4@@1))))
 (=> (and (= (type o_2@@1) RefType) (= (type f_4@@1) (FieldType A@@5 B@@4))) (= (U_2_real (MapType1Select ZeroMask o_2@@1 f_4@@1)) NoPerm))))
 :qid |stdinbpl.106:22|
 :skolemid |13|
 :pattern ( (MapType1Select ZeroMask o_2@@1 f_4@@1))
)))
(assert (forall ((Heap@@13 T@U) (ExhaleHeap@@4 T@U) (Mask@@10 T@U) (pm_f@@1 T@U) ) (! (let ((C@@1 (FieldTypeInv0 (type pm_f@@1))))
 (=> (and (and (and (and (and (= (type Heap@@13) (MapType0Type RefType)) (= (type ExhaleHeap@@4) (MapType0Type RefType))) (= (type Mask@@10) (MapType1Type RefType realType))) (= (type pm_f@@1) (FieldType C@@1 FrameTypeType))) (IdenticalOnKnownLocations Heap@@13 ExhaleHeap@@4 Mask@@10)) (and (HasDirectPerm Mask@@10 null pm_f@@1) (IsPredicateField pm_f@@1))) (forall ((o2 T@U) (f_2@@0 T@U) ) (! (let ((B@@5 (FieldTypeInv1 (type f_2@@0))))
(let ((A@@6 (FieldTypeInv0 (type f_2@@0))))
 (=> (and (and (= (type o2) RefType) (= (type f_2@@0) (FieldType A@@6 B@@5))) (U_2_bool (MapType1Select (MapType0Select Heap@@13 null (PredicateMaskField pm_f@@1)) o2 f_2@@0))) (= (MapType0Select Heap@@13 o2 f_2@@0) (MapType0Select ExhaleHeap@@4 o2 f_2@@0)))))
 :qid |stdinbpl.54:134|
 :skolemid |3|
 :pattern ( (MapType0Select ExhaleHeap@@4 o2 f_2@@0))
))))
 :qid |stdinbpl.52:19|
 :skolemid |4|
 :pattern ( (IdenticalOnKnownLocations Heap@@13 ExhaleHeap@@4 Mask@@10) (IsPredicateField pm_f@@1))
)))
(assert (forall ((Heap@@14 T@U) (ExhaleHeap@@5 T@U) (Mask@@11 T@U) (pm_f@@2 T@U) ) (! (let ((C@@2 (FieldTypeInv0 (type pm_f@@2))))
 (=> (and (and (and (and (and (= (type Heap@@14) (MapType0Type RefType)) (= (type ExhaleHeap@@5) (MapType0Type RefType))) (= (type Mask@@11) (MapType1Type RefType realType))) (= (type pm_f@@2) (FieldType C@@2 FrameTypeType))) (IdenticalOnKnownLocations Heap@@14 ExhaleHeap@@5 Mask@@11)) (and (HasDirectPerm Mask@@11 null pm_f@@2) (IsWandField pm_f@@2))) (forall ((o2@@0 T@U) (f_2@@1 T@U) ) (! (let ((B@@6 (FieldTypeInv1 (type f_2@@1))))
(let ((A@@7 (FieldTypeInv0 (type f_2@@1))))
 (=> (and (and (= (type o2@@0) RefType) (= (type f_2@@1) (FieldType A@@7 B@@6))) (U_2_bool (MapType1Select (MapType0Select Heap@@14 null (WandMaskField pm_f@@2)) o2@@0 f_2@@1))) (= (MapType0Select Heap@@14 o2@@0 f_2@@1) (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1)))))
 :qid |stdinbpl.67:129|
 :skolemid |6|
 :pattern ( (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1))
))))
 :qid |stdinbpl.65:19|
 :skolemid |7|
 :pattern ( (IdenticalOnKnownLocations Heap@@14 ExhaleHeap@@5 Mask@@11) (IsWandField pm_f@@2))
)))
(assert (forall ((Mask@@12 T@U) (o_2@@2 T@U) (f_4@@2 T@U) ) (! (let ((B@@7 (FieldTypeInv1 (type f_4@@2))))
(let ((A@@8 (FieldTypeInv0 (type f_4@@2))))
 (=> (and (and (and (= (type Mask@@12) (MapType1Type RefType realType)) (= (type o_2@@2) RefType)) (= (type f_4@@2) (FieldType A@@8 B@@7))) (GoodMask Mask@@12)) (and (>= (U_2_real (MapType1Select Mask@@12 o_2@@2 f_4@@2)) NoPerm) (=> (and (and (GoodMask Mask@@12) (not (IsPredicateField f_4@@2))) (not (IsWandField f_4@@2))) (<= (U_2_real (MapType1Select Mask@@12 o_2@@2 f_4@@2)) FullPerm))))))
 :qid |stdinbpl.128:22|
 :skolemid |16|
 :pattern ( (GoodMask Mask@@12) (MapType1Select Mask@@12 o_2@@2 f_4@@2))
)))
(assert (forall ((o T@U) (f T@U) (Heap@@15 T@U) ) (!  (=> (and (and (and (= (type o) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap@@15) (MapType0Type RefType))) (U_2_bool (MapType0Select Heap@@15 o $allocated))) (U_2_bool (MapType0Select Heap@@15 (MapType0Select Heap@@15 o f) $allocated)))
 :qid |stdinbpl.31:15|
 :skolemid |0|
 :pattern ( (MapType0Select Heap@@15 o f))
)))
(assert (forall ((Heap@@16 T@U) (Mask@@13 T@U) (y@@9 T@U) (x@@16 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@16) (MapType0Type RefType)) (= (type Mask@@13) (MapType1Type RefType realType))) (= (type y@@9) RefType)) (= (type x@@16) RefType)) (and (state Heap@@16 Mask@@13) (< AssumeFunctionsAbove 0))) (= (foo_2_2 Heap@@16 y@@9 x@@16)  (=> (guard y@@9) (U_2_bool (MapType0Select Heap@@16 y@@9 flag)))))
 :qid |stdinbpl.442:15|
 :skolemid |36|
 :pattern ( (state Heap@@16 Mask@@13) (foo_2_2 Heap@@16 y@@9 x@@16))
)))
(assert (forall ((Heap@@17 T@U) (Mask@@14 T@U) (y@@10 T@U) (x@@17 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@17) (MapType0Type RefType)) (= (type Mask@@14) (MapType1Type RefType realType))) (= (type y@@10) RefType)) (= (type x@@17) RefType)) (and (state Heap@@17 Mask@@14) (< AssumeFunctionsAbove 2))) (= (foo_1_2 Heap@@17 y@@10 x@@17)  (=> (guard y@@10) (U_2_bool (MapType0Select Heap@@17 y@@10 flag)))))
 :qid |stdinbpl.290:15|
 :skolemid |28|
 :pattern ( (state Heap@@17 Mask@@14) (foo_1_2 Heap@@17 y@@10 x@@17))
)))
(assert (forall ((Heap@@18 T@U) (Mask@@15 T@U) (y@@11 T@U) (x@@18 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@18) (MapType0Type RefType)) (= (type Mask@@15) (MapType1Type RefType realType))) (= (type y@@11) RefType)) (= (type x@@18) RefType)) (and (state Heap@@18 Mask@@15) (< AssumeFunctionsAbove 1))) (= (foo_1_1 Heap@@18 y@@11 x@@18)  (or (not (guard y@@11)) (U_2_bool (MapType0Select Heap@@18 y@@11 flag)))))
 :qid |stdinbpl.216:15|
 :skolemid |24|
 :pattern ( (state Heap@@18 Mask@@15) (foo_1_1 Heap@@18 y@@11 x@@18))
)))
(assert (forall ((Heap@@19 T@U) (Mask@@16 T@U) (y@@12 T@U) (x@@19 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@19) (MapType0Type RefType)) (= (type Mask@@16) (MapType1Type RefType realType))) (= (type y@@12) RefType)) (= (type x@@19) RefType)) (and (state Heap@@19 Mask@@16) (< AssumeFunctionsAbove 3))) (= (foo_2_1 Heap@@19 y@@12 x@@19)  (or (not (guard y@@12)) (U_2_bool (MapType0Select Heap@@19 y@@12 flag)))))
 :qid |stdinbpl.364:15|
 :skolemid |32|
 :pattern ( (state Heap@@19 Mask@@16) (foo_2_1 Heap@@19 y@@12 x@@19))
)))
(assert (forall ((Heap@@20 T@U) (o@@0 T@U) (f_3 T@U) (v T@U) ) (! (let ((B@@8 (type v)))
(let ((A@@9 (FieldTypeInv0 (type f_3))))
 (=> (and (and (= (type Heap@@20) (MapType0Type RefType)) (= (type o@@0) RefType)) (= (type f_3) (FieldType A@@9 B@@8))) (succHeap Heap@@20 (MapType0Store Heap@@20 o@@0 f_3 v)))))
 :qid |stdinbpl.78:22|
 :skolemid |9|
 :pattern ( (MapType0Store Heap@@20 o@@0 f_3 v))
)))
(assert (= (type ZeroPMask) (MapType1Type RefType boolType)))
(assert (forall ((o_2@@3 T@U) (f_4@@3 T@U) ) (! (let ((B@@9 (FieldTypeInv1 (type f_4@@3))))
(let ((A@@10 (FieldTypeInv0 (type f_4@@3))))
 (=> (and (= (type o_2@@3) RefType) (= (type f_4@@3) (FieldType A@@10 B@@9))) (not (U_2_bool (MapType1Select ZeroPMask o_2@@3 f_4@@3))))))
 :qid |stdinbpl.112:22|
 :skolemid |14|
 :pattern ( (MapType1Select ZeroPMask o_2@@3 f_4@@3))
)))
(assert (forall ((p@@1 T@U) (v_1@@0 T@U) (q T@U) (w@@0 T@U) (r T@U) (u T@U) ) (! (let ((C@@3 (FieldTypeInv0 (type r))))
(let ((B@@10 (FieldTypeInv0 (type q))))
(let ((A@@11 (FieldTypeInv0 (type p@@1))))
 (=> (and (and (and (and (and (and (= (type p@@1) (FieldType A@@11 FrameTypeType)) (= (type v_1@@0) FrameTypeType)) (= (type q) (FieldType B@@10 FrameTypeType))) (= (type w@@0) FrameTypeType)) (= (type r) (FieldType C@@3 FrameTypeType))) (= (type u) FrameTypeType)) (and (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))) (InsidePredicate p@@1 v_1@@0 r u)))))
 :qid |stdinbpl.171:25|
 :skolemid |20|
 :pattern ( (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
(assert (forall ((Heap@@21 T@U) (y@@13 T@U) (x@@20 T@U) ) (!  (=> (and (and (= (type Heap@@21) (MapType0Type RefType)) (= (type y@@13) RefType)) (= (type x@@20) RefType)) (and (= (foo_1_1 Heap@@21 y@@13 x@@20) (|foo_1_1'| Heap@@21 y@@13 x@@20)) (dummyFunction (bool_2_U (|foo_1_1#triggerStateless| y@@13 x@@20)))))
 :qid |stdinbpl.206:15|
 :skolemid |22|
 :pattern ( (foo_1_1 Heap@@21 y@@13 x@@20))
)))
(assert (forall ((Heap@@22 T@U) (y@@14 T@U) (x@@21 T@U) ) (!  (=> (and (and (= (type Heap@@22) (MapType0Type RefType)) (= (type y@@14) RefType)) (= (type x@@21) RefType)) (and (= (foo_1_2 Heap@@22 y@@14 x@@21) (|foo_1_2'| Heap@@22 y@@14 x@@21)) (dummyFunction (bool_2_U (|foo_1_2#triggerStateless| y@@14 x@@21)))))
 :qid |stdinbpl.280:15|
 :skolemid |26|
 :pattern ( (foo_1_2 Heap@@22 y@@14 x@@21))
)))
(assert (forall ((Heap@@23 T@U) (y@@15 T@U) (x@@22 T@U) ) (!  (=> (and (and (= (type Heap@@23) (MapType0Type RefType)) (= (type y@@15) RefType)) (= (type x@@22) RefType)) (and (= (foo_2_1 Heap@@23 y@@15 x@@22) (|foo_2_1'| Heap@@23 y@@15 x@@22)) (dummyFunction (bool_2_U (|foo_2_1#triggerStateless| y@@15 x@@22)))))
 :qid |stdinbpl.354:15|
 :skolemid |30|
 :pattern ( (foo_2_1 Heap@@23 y@@15 x@@22))
)))
(assert (forall ((Heap@@24 T@U) (y@@16 T@U) (x@@23 T@U) ) (!  (=> (and (and (= (type Heap@@24) (MapType0Type RefType)) (= (type y@@16) RefType)) (= (type x@@23) RefType)) (and (= (foo_2_2 Heap@@24 y@@16 x@@23) (|foo_2_2'| Heap@@24 y@@16 x@@23)) (dummyFunction (bool_2_U (|foo_2_2#triggerStateless| y@@16 x@@23)))))
 :qid |stdinbpl.432:15|
 :skolemid |34|
 :pattern ( (foo_2_2 Heap@@24 y@@16 x@@23))
)))
(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun ExhaleWellDef0Mask@2 () T@U)
(declare-fun ExhaleWellDef0Mask@1 () T@U)
(declare-fun s () T@U)
(declare-fun ExhaleWellDef0Mask@3 () T@U)
(declare-fun Mask@1 () T@U)
(declare-fun r_1 () T@U)
(declare-fun ExhaleWellDef0Mask@0 () T@U)
(declare-fun Heap@@25 () T@U)
(declare-fun ExhaleWellDef0Mask@6 () T@U)
(declare-fun ExhaleWellDef0Mask@5 () T@U)
(declare-fun ExhaleWellDef0Mask@7 () T@U)
(declare-fun ExhaleWellDef0Mask@4 () T@U)
(declare-fun ExhaleWellDef0Mask@9 () T@U)
(declare-fun ExhaleWellDef0Mask@8 () T@U)
(declare-fun ExhaleWellDef0Mask@10 () T@U)
(declare-fun ExhaleWellDef0Mask@12 () T@U)
(declare-fun ExhaleWellDef0Mask@11 () T@U)
(declare-fun ExhaleWellDef0Mask@13 () T@U)
(declare-fun Mask@0 () T@U)
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (= (type s) RefType) (= (type ExhaleWellDef0Mask@13) (MapType1Type RefType realType))) (= (type ExhaleWellDef0Mask@11) (MapType1Type RefType realType))) (= (type ExhaleWellDef0Mask@12) (MapType1Type RefType realType))) (= (type Mask@1) (MapType1Type RefType realType))) (= (type r_1) RefType)) (= (type ExhaleWellDef0Mask@10) (MapType1Type RefType realType))) (= (type ExhaleWellDef0Mask@8) (MapType1Type RefType realType))) (= (type ExhaleWellDef0Mask@9) (MapType1Type RefType realType))) (= (type ExhaleWellDef0Mask@4) (MapType1Type RefType realType))) (= (type ExhaleWellDef0Mask@7) (MapType1Type RefType realType))) (= (type ExhaleWellDef0Mask@6) (MapType1Type RefType realType))) (= (type ExhaleWellDef0Mask@5) (MapType1Type RefType realType))) (= (type Heap@@25) (MapType0Type RefType))) (= (type ExhaleWellDef0Mask@0) (MapType1Type RefType realType))) (= (type ExhaleWellDef0Mask@3) (MapType1Type RefType realType))) (= (type ExhaleWellDef0Mask@2) (MapType1Type RefType realType))) (= (type ExhaleWellDef0Mask@1) (MapType1Type RefType realType))) (= (type Mask@0) (MapType1Type RefType realType))))
(set-info :boogie-vc-id testA)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 63) (let ((anon37_correct true))
(let ((anon33_correct  (=> (= ExhaleWellDef0Mask@2 (MapType1Store ExhaleWellDef0Mask@1 s flag (real_2_U (- (U_2_real (MapType1Select ExhaleWellDef0Mask@1 s flag)) FullPerm)))) (=> (and (= ExhaleWellDef0Mask@3 ExhaleWellDef0Mask@2) (= (ControlFlow 0 46) 40)) anon37_correct))))
(let ((anon55_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 49) 46)) anon33_correct)))
(let ((anon55_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 47) (- 0 48)) (<= FullPerm (U_2_real (MapType1Select ExhaleWellDef0Mask@1 s flag)))) (=> (<= FullPerm (U_2_real (MapType1Select ExhaleWellDef0Mask@1 s flag))) (=> (= (ControlFlow 0 47) 46) anon33_correct))))))
(let ((anon31_correct  (=> (= ExhaleWellDef0Mask@1 (MapType1Store Mask@1 r_1 flag (real_2_U (- (U_2_real (MapType1Select Mask@1 r_1 flag)) FullPerm)))) (and (=> (= (ControlFlow 0 50) 47) anon55_Then_correct) (=> (= (ControlFlow 0 50) 49) anon55_Else_correct)))))
(let ((anon54_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 53) 50)) anon31_correct)))
(let ((anon54_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 51) (- 0 52)) (<= FullPerm (U_2_real (MapType1Select Mask@1 r_1 flag)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@1 r_1 flag))) (=> (= (ControlFlow 0 51) 50) anon31_correct))))))
(let ((anon53_Then_correct  (=> (guard s) (and (=> (= (ControlFlow 0 54) 51) anon54_Then_correct) (=> (= (ControlFlow 0 54) 53) anon54_Else_correct)))))
(let ((anon36_correct  (=> (= ExhaleWellDef0Mask@0 (MapType1Store Mask@1 r_1 flag (real_2_U (- (U_2_real (MapType1Select Mask@1 r_1 flag)) FullPerm)))) (=> (and (= ExhaleWellDef0Mask@3 ExhaleWellDef0Mask@0) (= (ControlFlow 0 41) 40)) anon37_correct))))
(let ((anon56_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 44) 41)) anon36_correct)))
(let ((anon56_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 42) (- 0 43)) (<= FullPerm (U_2_real (MapType1Select Mask@1 r_1 flag)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@1 r_1 flag))) (=> (= (ControlFlow 0 42) 41) anon36_correct))))))
(let ((anon53_Else_correct  (=> (not (guard s)) (and (=> (= (ControlFlow 0 45) 42) anon56_Then_correct) (=> (= (ControlFlow 0 45) 44) anon56_Else_correct)))))
(let ((anon52_Else_correct  (=> (= (ControlFlow 0 39) (- 0 38)) (foo_2_2 Heap@@25 s r_1))))
(let ((anon47_Else_correct  (and (=> (= (ControlFlow 0 55) (- 0 56)) (foo_2_1 Heap@@25 s r_1)) (=> (foo_2_1 Heap@@25 s r_1) (=> (state Heap@@25 Mask@1) (and (and (=> (= (ControlFlow 0 55) 39) anon52_Else_correct) (=> (= (ControlFlow 0 55) 54) anon53_Then_correct)) (=> (= (ControlFlow 0 55) 45) anon53_Else_correct)))))))
(let ((anon26_correct true))
(let ((anon22_correct  (=> (= ExhaleWellDef0Mask@6 (MapType1Store ExhaleWellDef0Mask@5 s flag (real_2_U (- (U_2_real (MapType1Select ExhaleWellDef0Mask@5 s flag)) FullPerm)))) (=> (and (= ExhaleWellDef0Mask@7 ExhaleWellDef0Mask@6) (= (ControlFlow 0 29) 23)) anon26_correct))))
(let ((anon50_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 32) 29)) anon22_correct)))
(let ((anon50_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 30) (- 0 31)) (<= FullPerm (U_2_real (MapType1Select ExhaleWellDef0Mask@5 s flag)))) (=> (<= FullPerm (U_2_real (MapType1Select ExhaleWellDef0Mask@5 s flag))) (=> (= (ControlFlow 0 30) 29) anon22_correct))))))
(let ((anon20_correct  (=> (= ExhaleWellDef0Mask@5 (MapType1Store Mask@1 r_1 flag (real_2_U (- (U_2_real (MapType1Select Mask@1 r_1 flag)) FullPerm)))) (and (=> (= (ControlFlow 0 33) 30) anon50_Then_correct) (=> (= (ControlFlow 0 33) 32) anon50_Else_correct)))))
(let ((anon49_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 36) 33)) anon20_correct)))
(let ((anon49_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 34) (- 0 35)) (<= FullPerm (U_2_real (MapType1Select Mask@1 r_1 flag)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@1 r_1 flag))) (=> (= (ControlFlow 0 34) 33) anon20_correct))))))
(let ((anon48_Then_correct  (=> (guard s) (and (=> (= (ControlFlow 0 37) 34) anon49_Then_correct) (=> (= (ControlFlow 0 37) 36) anon49_Else_correct)))))
(let ((anon25_correct  (=> (= ExhaleWellDef0Mask@4 (MapType1Store Mask@1 r_1 flag (real_2_U (- (U_2_real (MapType1Select Mask@1 r_1 flag)) FullPerm)))) (=> (and (= ExhaleWellDef0Mask@7 ExhaleWellDef0Mask@4) (= (ControlFlow 0 24) 23)) anon26_correct))))
(let ((anon51_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 27) 24)) anon25_correct)))
(let ((anon51_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 25) (- 0 26)) (<= FullPerm (U_2_real (MapType1Select Mask@1 r_1 flag)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@1 r_1 flag))) (=> (= (ControlFlow 0 25) 24) anon25_correct))))))
(let ((anon48_Else_correct  (=> (not (guard s)) (and (=> (= (ControlFlow 0 28) 25) anon51_Then_correct) (=> (= (ControlFlow 0 28) 27) anon51_Else_correct)))))
(let ((anon43_Else_correct  (and (=> (= (ControlFlow 0 57) (- 0 58)) (foo_1_2 Heap@@25 s r_1)) (=> (foo_1_2 Heap@@25 s r_1) (=> (state Heap@@25 Mask@1) (and (and (=> (= (ControlFlow 0 57) 55) anon47_Else_correct) (=> (= (ControlFlow 0 57) 37) anon48_Then_correct)) (=> (= (ControlFlow 0 57) 28) anon48_Else_correct)))))))
(let ((anon15_correct true))
(let ((anon14_correct  (=> (= ExhaleWellDef0Mask@9 (MapType1Store ExhaleWellDef0Mask@8 s flag (real_2_U (- (U_2_real (MapType1Select ExhaleWellDef0Mask@8 s flag)) FullPerm)))) (=> (and (= ExhaleWellDef0Mask@10 ExhaleWellDef0Mask@9) (= (ControlFlow 0 14) 12)) anon15_correct))))
(let ((anon46_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 17) 14)) anon14_correct)))
(let ((anon46_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 15) (- 0 16)) (<= FullPerm (U_2_real (MapType1Select ExhaleWellDef0Mask@8 s flag)))) (=> (<= FullPerm (U_2_real (MapType1Select ExhaleWellDef0Mask@8 s flag))) (=> (= (ControlFlow 0 15) 14) anon14_correct))))))
(let ((anon45_Then_correct  (=> (guard s) (and (=> (= (ControlFlow 0 18) 15) anon46_Then_correct) (=> (= (ControlFlow 0 18) 17) anon46_Else_correct)))))
(let ((anon45_Else_correct  (=> (not (guard s)) (=> (and (= ExhaleWellDef0Mask@10 ExhaleWellDef0Mask@8) (= (ControlFlow 0 13) 12)) anon15_correct))))
(let ((anon11_correct  (=> (= ExhaleWellDef0Mask@8 (MapType1Store Mask@1 r_1 flag (real_2_U (- (U_2_real (MapType1Select Mask@1 r_1 flag)) FullPerm)))) (and (=> (= (ControlFlow 0 19) 18) anon45_Then_correct) (=> (= (ControlFlow 0 19) 13) anon45_Else_correct)))))
(let ((anon44_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 22) 19)) anon11_correct)))
(let ((anon44_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 20) (- 0 21)) (<= FullPerm (U_2_real (MapType1Select Mask@1 r_1 flag)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@1 r_1 flag))) (=> (= (ControlFlow 0 20) 19) anon11_correct))))))
(let ((anon39_Else_correct  (and (=> (= (ControlFlow 0 59) (- 0 60)) (foo_1_1 Heap@@25 s r_1)) (=> (foo_1_1 Heap@@25 s r_1) (=> (state Heap@@25 Mask@1) (and (and (=> (= (ControlFlow 0 59) 57) anon43_Else_correct) (=> (= (ControlFlow 0 59) 20) anon44_Then_correct)) (=> (= (ControlFlow 0 59) 22) anon44_Else_correct)))))))
(let ((anon7_correct true))
(let ((anon6_correct  (=> (= ExhaleWellDef0Mask@12 (MapType1Store ExhaleWellDef0Mask@11 s flag (real_2_U (- (U_2_real (MapType1Select ExhaleWellDef0Mask@11 s flag)) FullPerm)))) (=> (and (= ExhaleWellDef0Mask@13 ExhaleWellDef0Mask@12) (= (ControlFlow 0 3) 1)) anon7_correct))))
(let ((anon42_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 6) 3)) anon6_correct)))
(let ((anon42_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 4) (- 0 5)) (<= FullPerm (U_2_real (MapType1Select ExhaleWellDef0Mask@11 s flag)))) (=> (<= FullPerm (U_2_real (MapType1Select ExhaleWellDef0Mask@11 s flag))) (=> (= (ControlFlow 0 4) 3) anon6_correct))))))
(let ((anon41_Then_correct  (=> (guard s) (and (=> (= (ControlFlow 0 7) 4) anon42_Then_correct) (=> (= (ControlFlow 0 7) 6) anon42_Else_correct)))))
(let ((anon41_Else_correct  (=> (not (guard s)) (=> (and (= ExhaleWellDef0Mask@13 ExhaleWellDef0Mask@11) (= (ControlFlow 0 2) 1)) anon7_correct))))
(let ((anon3_correct  (=> (= ExhaleWellDef0Mask@11 (MapType1Store Mask@1 r_1 flag (real_2_U (- (U_2_real (MapType1Select Mask@1 r_1 flag)) FullPerm)))) (and (=> (= (ControlFlow 0 8) 7) anon41_Then_correct) (=> (= (ControlFlow 0 8) 2) anon41_Else_correct)))))
(let ((anon40_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 11) 8)) anon3_correct)))
(let ((anon40_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 9) (- 0 10)) (<= FullPerm (U_2_real (MapType1Select Mask@1 r_1 flag)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@1 r_1 flag))) (=> (= (ControlFlow 0 9) 8) anon3_correct))))))
(let ((anon0_correct  (=> (and (and (state Heap@@25 ZeroMask) (= AssumeFunctionsAbove (- 0 1))) (and (U_2_bool (MapType0Select Heap@@25 s $allocated)) (U_2_bool (MapType0Select Heap@@25 r_1 $allocated)))) (=> (and (and (and (not (= r_1 null)) (= Mask@0 (MapType1Store ZeroMask r_1 flag (real_2_U (+ (U_2_real (MapType1Select ZeroMask r_1 flag)) FullPerm))))) (and (state Heap@@25 Mask@0) (state Heap@@25 Mask@0))) (and (and (not (= s null)) (= Mask@1 (MapType1Store Mask@0 s flag (real_2_U (+ (U_2_real (MapType1Select Mask@0 s flag)) FullPerm))))) (and (state Heap@@25 Mask@1) (state Heap@@25 Mask@1)))) (and (=> (= (ControlFlow 0 61) (- 0 62)) (HasDirectPerm Mask@1 s flag)) (=> (HasDirectPerm Mask@1 s flag) (=> (and (U_2_bool (MapType0Select Heap@@25 s flag)) (state Heap@@25 Mask@1)) (and (and (=> (= (ControlFlow 0 61) 59) anon39_Else_correct) (=> (= (ControlFlow 0 61) 9) anon40_Then_correct)) (=> (= (ControlFlow 0 61) 11) anon40_Else_correct)))))))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 63) 61) anon0_correct)))
PreconditionGeneratedEntry_correct)))))))))))))))))))))))))))))))))))))))))))))))))
))
(check-sat)
(pop 1)
; Valid
(get-info :rlimit)
