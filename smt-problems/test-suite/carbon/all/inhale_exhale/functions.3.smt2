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
(declare-fun x@@8 () T@U)
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
(declare-fun IdenticalOnKnownLocations (T@U T@U T@U) Bool)
(declare-fun IsPredicateField (T@U) Bool)
(declare-fun null () T@U)
(declare-fun PredicateMaskField (T@U) T@U)
(declare-fun FrameTypeType () T@T)
(declare-fun HasDirectPerm (T@U T@U T@U) Bool)
(declare-fun IsWandField (T@U) Bool)
(declare-fun WandMaskField (T@U) T@U)
(declare-fun |inhaleTrue1'| (T@U T@U) Int)
(declare-fun dummyFunction (T@U) Bool)
(declare-fun |inhaleTrue1#triggerStateless| (T@U) Int)
(declare-fun |inhaleTrue2'| (T@U T@U) Int)
(declare-fun |inhaleTrue2#triggerStateless| (T@U) Int)
(declare-fun |inhaleTrue3'| (T@U T@U) Int)
(declare-fun |inhaleTrue3#triggerStateless| (T@U) Int)
(declare-fun |inhaleExpression1'| (T@U T@U) Int)
(declare-fun |inhaleExpression1#triggerStateless| (T@U) Int)
(declare-fun |inhaleExpression2'| (T@U T@U) Int)
(declare-fun |inhaleExpression2#triggerStateless| (T@U) Int)
(declare-fun |inhaleExpression3'| (T@U T@U) Int)
(declare-fun |inhaleExpression3#triggerStateless| (T@U) Int)
(declare-fun |exhaleTrue1'| (T@U T@U) Int)
(declare-fun |exhaleTrue1#triggerStateless| (T@U) Int)
(declare-fun |exhaleTrue2'| (T@U T@U) Int)
(declare-fun |exhaleTrue2#triggerStateless| (T@U) Int)
(declare-fun |exhaleTrue3'| (T@U T@U) Int)
(declare-fun |exhaleTrue3#triggerStateless| (T@U) Int)
(declare-fun |exhaleExpression1WithRequires'| (T@U T@U) Int)
(declare-fun |exhaleExpression1WithRequires#triggerStateless| (T@U) Int)
(declare-fun |exhaleExpression2WithRequires'| (T@U T@U) Int)
(declare-fun |exhaleExpression2WithRequires#triggerStateless| (T@U) Int)
(declare-fun |exhaleExpression3WithRequires'| (T@U T@U) Int)
(declare-fun |exhaleExpression3WithRequires#triggerStateless| (T@U) Int)
(declare-fun AssumeFunctionsAbove () Int)
(declare-fun |inhaleExpression2#trigger| (T@U T@U) Bool)
(declare-fun EmptyFrame () T@U)
(declare-fun |inhaleExpression1#trigger| (T@U T@U) Bool)
(declare-fun |inhaleExpression3#trigger| (T@U T@U) Bool)
(declare-fun exhaleExpression1WithRequires (T@U T@U) Int)
(declare-fun exhaleExpression3WithRequires (T@U T@U) Int)
(declare-fun exhaleExpression2WithRequires (T@U T@U) Int)
(declare-fun inhaleTrue1 (T@U T@U) Int)
(declare-fun inhaleTrue2 (T@U T@U) Int)
(declare-fun inhaleTrue3 (T@U T@U) Int)
(declare-fun inhaleExpression1 (T@U T@U) Int)
(declare-fun inhaleExpression2 (T@U T@U) Int)
(declare-fun inhaleExpression3 (T@U T@U) Int)
(declare-fun exhaleTrue1 (T@U T@U) Int)
(declare-fun exhaleTrue2 (T@U T@U) Int)
(declare-fun exhaleTrue3 (T@U T@U) Int)
(declare-fun dummyHeap () T@U)
(declare-fun ZeroMask () T@U)
(declare-fun InsidePredicate (T@U T@U T@U T@U) Bool)
(declare-fun sumMask (T@U T@U T@U) Bool)
(declare-fun ConditionalFrame (Real T@U) T@U)
(declare-fun NoPerm () Real)
(declare-fun |exhaleTrue2#trigger| (T@U T@U) Bool)
(declare-fun FrameFragment (T@U) T@U)
(declare-fun FullPerm () Real)
(declare-fun |inhaleExpression1#frame| (T@U T@U) Int)
(declare-fun |inhaleExpression2#frame| (T@U T@U) Int)
(declare-fun |inhaleExpression3#frame| (T@U T@U) Int)
(declare-fun |inhaleTrue1#frame| (T@U T@U) Int)
(declare-fun |inhaleTrue2#frame| (T@U T@U) Int)
(declare-fun |inhaleTrue3#frame| (T@U T@U) Int)
(declare-fun |exhaleTrue1#frame| (T@U T@U) Int)
(declare-fun |exhaleTrue2#frame| (T@U T@U) Int)
(declare-fun |exhaleTrue3#frame| (T@U T@U) Int)
(declare-fun |exhaleExpression1WithRequires#frame| (T@U T@U) Int)
(declare-fun |exhaleExpression2WithRequires#frame| (T@U T@U) Int)
(declare-fun |exhaleExpression3WithRequires#frame| (T@U T@U) Int)
(declare-fun ZeroPMask () T@U)
(declare-fun |exhaleTrue1#trigger| (T@U T@U) Bool)
(declare-fun |exhaleTrue3#trigger| (T@U T@U) Bool)
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
))) (= (Ctor NormalFieldType) 7)) (= (type $allocated) (FieldType NormalFieldType boolType))) (= (type x@@8) (FieldType NormalFieldType intType))))
(assert (distinct $allocated x@@8)
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
(assert  (and (and (= (Ctor FrameTypeType) 11) (= (type null) RefType)) (forall ((arg0@@23 T@U) ) (! (let ((A (FieldTypeInv0 (type arg0@@23))))
(= (type (PredicateMaskField arg0@@23)) (FieldType A (MapType1Type RefType boolType))))
 :qid |funType:PredicateMaskField|
 :pattern ( (PredicateMaskField arg0@@23))
))))
(assert (forall ((Heap@@0 T@U) (ExhaleHeap T@U) (Mask@@0 T@U) (pm_f T@U) ) (! (let ((C (FieldTypeInv0 (type pm_f))))
 (=> (and (and (and (and (and (= (type Heap@@0) (MapType0Type RefType)) (= (type ExhaleHeap) (MapType0Type RefType))) (= (type Mask@@0) (MapType1Type RefType realType))) (= (type pm_f) (FieldType C FrameTypeType))) (IdenticalOnKnownLocations Heap@@0 ExhaleHeap Mask@@0)) (and (HasDirectPerm Mask@@0 null pm_f) (IsPredicateField pm_f))) (= (MapType0Select Heap@@0 null (PredicateMaskField pm_f)) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))))
 :qid |stdinbpl.47:19|
 :skolemid |2|
 :pattern ( (IdenticalOnKnownLocations Heap@@0 ExhaleHeap Mask@@0) (IsPredicateField pm_f) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))
)))
(assert (forall ((arg0@@24 T@U) ) (! (let ((A@@0 (FieldTypeInv0 (type arg0@@24))))
(= (type (WandMaskField arg0@@24)) (FieldType A@@0 (MapType1Type RefType boolType))))
 :qid |funType:WandMaskField|
 :pattern ( (WandMaskField arg0@@24))
)))
(assert (forall ((Heap@@1 T@U) (ExhaleHeap@@0 T@U) (Mask@@1 T@U) (pm_f@@0 T@U) ) (! (let ((C@@0 (FieldTypeInv0 (type pm_f@@0))))
 (=> (and (and (and (and (and (= (type Heap@@1) (MapType0Type RefType)) (= (type ExhaleHeap@@0) (MapType0Type RefType))) (= (type Mask@@1) (MapType1Type RefType realType))) (= (type pm_f@@0) (FieldType C@@0 FrameTypeType))) (IdenticalOnKnownLocations Heap@@1 ExhaleHeap@@0 Mask@@1)) (and (HasDirectPerm Mask@@1 null pm_f@@0) (IsWandField pm_f@@0))) (= (MapType0Select Heap@@1 null (WandMaskField pm_f@@0)) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))))
 :qid |stdinbpl.60:19|
 :skolemid |5|
 :pattern ( (IdenticalOnKnownLocations Heap@@1 ExhaleHeap@@0 Mask@@1) (IsWandField pm_f@@0) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))
)))
(assert (forall ((Heap@@2 T@U) (this T@U) ) (!  (=> (and (= (type Heap@@2) (MapType0Type RefType)) (= (type this) RefType)) (dummyFunction (int_2_U (|inhaleTrue1#triggerStateless| this))))
 :qid |stdinbpl.208:15|
 :skolemid |23|
 :pattern ( (|inhaleTrue1'| Heap@@2 this))
)))
(assert (forall ((Heap@@3 T@U) (this@@0 T@U) ) (!  (=> (and (= (type Heap@@3) (MapType0Type RefType)) (= (type this@@0) RefType)) (dummyFunction (int_2_U (|inhaleTrue2#triggerStateless| this@@0))))
 :qid |stdinbpl.279:15|
 :skolemid |27|
 :pattern ( (|inhaleTrue2'| Heap@@3 this@@0))
)))
(assert (forall ((Heap@@4 T@U) (this@@1 T@U) ) (!  (=> (and (= (type Heap@@4) (MapType0Type RefType)) (= (type this@@1) RefType)) (dummyFunction (int_2_U (|inhaleTrue3#triggerStateless| this@@1))))
 :qid |stdinbpl.350:15|
 :skolemid |31|
 :pattern ( (|inhaleTrue3'| Heap@@4 this@@1))
)))
(assert (forall ((Heap@@5 T@U) (this@@2 T@U) ) (!  (=> (and (= (type Heap@@5) (MapType0Type RefType)) (= (type this@@2) RefType)) (dummyFunction (int_2_U (|inhaleExpression1#triggerStateless| this@@2))))
 :qid |stdinbpl.423:15|
 :skolemid |35|
 :pattern ( (|inhaleExpression1'| Heap@@5 this@@2))
)))
(assert (forall ((Heap@@6 T@U) (this@@3 T@U) ) (!  (=> (and (= (type Heap@@6) (MapType0Type RefType)) (= (type this@@3) RefType)) (dummyFunction (int_2_U (|inhaleExpression2#triggerStateless| this@@3))))
 :qid |stdinbpl.514:15|
 :skolemid |40|
 :pattern ( (|inhaleExpression2'| Heap@@6 this@@3))
)))
(assert (forall ((Heap@@7 T@U) (this@@4 T@U) ) (!  (=> (and (= (type Heap@@7) (MapType0Type RefType)) (= (type this@@4) RefType)) (dummyFunction (int_2_U (|inhaleExpression3#triggerStateless| this@@4))))
 :qid |stdinbpl.605:15|
 :skolemid |45|
 :pattern ( (|inhaleExpression3'| Heap@@7 this@@4))
)))
(assert (forall ((Heap@@8 T@U) (this@@5 T@U) ) (!  (=> (and (= (type Heap@@8) (MapType0Type RefType)) (= (type this@@5) RefType)) (dummyFunction (int_2_U (|exhaleTrue1#triggerStateless| this@@5))))
 :qid |stdinbpl.698:15|
 :skolemid |50|
 :pattern ( (|exhaleTrue1'| Heap@@8 this@@5))
)))
(assert (forall ((Heap@@9 T@U) (this@@6 T@U) ) (!  (=> (and (= (type Heap@@9) (MapType0Type RefType)) (= (type this@@6) RefType)) (dummyFunction (int_2_U (|exhaleTrue2#triggerStateless| this@@6))))
 :qid |stdinbpl.781:15|
 :skolemid |55|
 :pattern ( (|exhaleTrue2'| Heap@@9 this@@6))
)))
(assert (forall ((Heap@@10 T@U) (this@@7 T@U) ) (!  (=> (and (= (type Heap@@10) (MapType0Type RefType)) (= (type this@@7) RefType)) (dummyFunction (int_2_U (|exhaleTrue3#triggerStateless| this@@7))))
 :qid |stdinbpl.865:15|
 :skolemid |60|
 :pattern ( (|exhaleTrue3'| Heap@@10 this@@7))
)))
(assert (forall ((Heap@@11 T@U) (this@@8 T@U) ) (!  (=> (and (= (type Heap@@11) (MapType0Type RefType)) (= (type this@@8) RefType)) (dummyFunction (int_2_U (|exhaleExpression1WithRequires#triggerStateless| this@@8))))
 :qid |stdinbpl.954:15|
 :skolemid |66|
 :pattern ( (|exhaleExpression1WithRequires'| Heap@@11 this@@8))
)))
(assert (forall ((Heap@@12 T@U) (this@@9 T@U) ) (!  (=> (and (= (type Heap@@12) (MapType0Type RefType)) (= (type this@@9) RefType)) (dummyFunction (int_2_U (|exhaleExpression2WithRequires#triggerStateless| this@@9))))
 :qid |stdinbpl.1046:15|
 :skolemid |70|
 :pattern ( (|exhaleExpression2WithRequires'| Heap@@12 this@@9))
)))
(assert (forall ((Heap@@13 T@U) (this@@10 T@U) ) (!  (=> (and (= (type Heap@@13) (MapType0Type RefType)) (= (type this@@10) RefType)) (dummyFunction (int_2_U (|exhaleExpression3WithRequires#triggerStateless| this@@10))))
 :qid |stdinbpl.1140:15|
 :skolemid |74|
 :pattern ( (|exhaleExpression3WithRequires'| Heap@@13 this@@10))
)))
(assert (= (type EmptyFrame) FrameTypeType))
(assert (forall ((Heap@@14 T@U) (Mask@@2 T@U) (this@@11 T@U) ) (!  (=> (and (and (and (= (type Heap@@14) (MapType0Type RefType)) (= (type Mask@@2) (MapType1Type RefType realType))) (= (type this@@11) RefType)) (and (state Heap@@14 Mask@@2) (or (< AssumeFunctionsAbove 0) (|inhaleExpression2#trigger| EmptyFrame this@@11)))) (= (|inhaleExpression2'| Heap@@14 this@@11) 1))
 :qid |stdinbpl.533:15|
 :skolemid |43|
 :pattern ( (state Heap@@14 Mask@@2) (|inhaleExpression2'| Heap@@14 this@@11))
)))
(assert (forall ((Heap@@15 T@U) (Mask@@3 T@U) (this@@12 T@U) ) (!  (=> (and (and (and (= (type Heap@@15) (MapType0Type RefType)) (= (type Mask@@3) (MapType1Type RefType realType))) (= (type this@@12) RefType)) (and (state Heap@@15 Mask@@3) (or (< AssumeFunctionsAbove 3) (|inhaleExpression1#trigger| EmptyFrame this@@12)))) (= (|inhaleExpression1'| Heap@@15 this@@12) 1))
 :qid |stdinbpl.442:15|
 :skolemid |38|
 :pattern ( (state Heap@@15 Mask@@3) (|inhaleExpression1'| Heap@@15 this@@12))
)))
(assert (forall ((Heap@@16 T@U) (Mask@@4 T@U) (this@@13 T@U) ) (!  (=> (and (and (and (= (type Heap@@16) (MapType0Type RefType)) (= (type Mask@@4) (MapType1Type RefType realType))) (= (type this@@13) RefType)) (and (state Heap@@16 Mask@@4) (or (< AssumeFunctionsAbove 4) (|inhaleExpression3#trigger| EmptyFrame this@@13)))) (= (|inhaleExpression3'| Heap@@16 this@@13) 1))
 :qid |stdinbpl.624:15|
 :skolemid |48|
 :pattern ( (state Heap@@16 Mask@@4) (|inhaleExpression3'| Heap@@16 this@@13))
)))
(assert (forall ((Heap@@17 T@U) (Mask@@5 T@U) (this@@14 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@17) (MapType0Type RefType)) (= (type Mask@@5) (MapType1Type RefType realType))) (= (type this@@14) RefType)) (and (state Heap@@17 Mask@@5) (< AssumeFunctionsAbove 7))) (= (U_2_int (MapType0Select Heap@@17 this@@14 x@@8)) 1)) (= (exhaleExpression1WithRequires Heap@@17 this@@14) (U_2_int (MapType0Select Heap@@17 this@@14 x@@8))))
 :qid |stdinbpl.960:15|
 :skolemid |67|
 :pattern ( (state Heap@@17 Mask@@5) (exhaleExpression1WithRequires Heap@@17 this@@14))
)))
(assert (forall ((Heap@@18 T@U) (Mask@@6 T@U) (this@@15 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@18) (MapType0Type RefType)) (= (type Mask@@6) (MapType1Type RefType realType))) (= (type this@@15) RefType)) (and (state Heap@@18 Mask@@6) (< AssumeFunctionsAbove 10))) (= (U_2_int (MapType0Select Heap@@18 this@@15 x@@8)) 1)) (= (exhaleExpression3WithRequires Heap@@18 this@@15) (U_2_int (MapType0Select Heap@@18 this@@15 x@@8))))
 :qid |stdinbpl.1146:15|
 :skolemid |75|
 :pattern ( (state Heap@@18 Mask@@6) (exhaleExpression3WithRequires Heap@@18 this@@15))
)))
(assert (forall ((Heap@@19 T@U) (Mask@@7 T@U) (this@@16 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@19) (MapType0Type RefType)) (= (type Mask@@7) (MapType1Type RefType realType))) (= (type this@@16) RefType)) (and (state Heap@@19 Mask@@7) (< AssumeFunctionsAbove 11))) (= (U_2_int (MapType0Select Heap@@19 this@@16 x@@8)) 1)) (= (exhaleExpression2WithRequires Heap@@19 this@@16) (U_2_int (MapType0Select Heap@@19 this@@16 x@@8))))
 :qid |stdinbpl.1052:15|
 :skolemid |71|
 :pattern ( (state Heap@@19 Mask@@7) (exhaleExpression2WithRequires Heap@@19 this@@16))
)))
(assert (forall ((Heap@@20 T@U) (ExhaleHeap@@1 T@U) (Mask@@8 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@20) (MapType0Type RefType)) (= (type ExhaleHeap@@1) (MapType0Type RefType))) (= (type Mask@@8) (MapType1Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@20 ExhaleHeap@@1 Mask@@8)) (U_2_bool (MapType0Select Heap@@20 o_1 $allocated))) (U_2_bool (MapType0Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.73:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@20 ExhaleHeap@@1 Mask@@8) (MapType0Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert (forall ((Heap@@21 T@U) (this@@17 T@U) ) (!  (=> (and (= (type Heap@@21) (MapType0Type RefType)) (= (type this@@17) RefType)) (and (= (inhaleTrue1 Heap@@21 this@@17) (|inhaleTrue1'| Heap@@21 this@@17)) (dummyFunction (int_2_U (|inhaleTrue1#triggerStateless| this@@17)))))
 :qid |stdinbpl.204:15|
 :skolemid |22|
 :pattern ( (inhaleTrue1 Heap@@21 this@@17))
)))
(assert (forall ((Heap@@22 T@U) (this@@18 T@U) ) (!  (=> (and (= (type Heap@@22) (MapType0Type RefType)) (= (type this@@18) RefType)) (and (= (inhaleTrue2 Heap@@22 this@@18) (|inhaleTrue2'| Heap@@22 this@@18)) (dummyFunction (int_2_U (|inhaleTrue2#triggerStateless| this@@18)))))
 :qid |stdinbpl.275:15|
 :skolemid |26|
 :pattern ( (inhaleTrue2 Heap@@22 this@@18))
)))
(assert (forall ((Heap@@23 T@U) (this@@19 T@U) ) (!  (=> (and (= (type Heap@@23) (MapType0Type RefType)) (= (type this@@19) RefType)) (and (= (inhaleTrue3 Heap@@23 this@@19) (|inhaleTrue3'| Heap@@23 this@@19)) (dummyFunction (int_2_U (|inhaleTrue3#triggerStateless| this@@19)))))
 :qid |stdinbpl.346:15|
 :skolemid |30|
 :pattern ( (inhaleTrue3 Heap@@23 this@@19))
)))
(assert (forall ((Heap@@24 T@U) (this@@20 T@U) ) (!  (=> (and (= (type Heap@@24) (MapType0Type RefType)) (= (type this@@20) RefType)) (and (= (inhaleExpression1 Heap@@24 this@@20) (|inhaleExpression1'| Heap@@24 this@@20)) (dummyFunction (int_2_U (|inhaleExpression1#triggerStateless| this@@20)))))
 :qid |stdinbpl.419:15|
 :skolemid |34|
 :pattern ( (inhaleExpression1 Heap@@24 this@@20))
)))
(assert (forall ((Heap@@25 T@U) (this@@21 T@U) ) (!  (=> (and (= (type Heap@@25) (MapType0Type RefType)) (= (type this@@21) RefType)) (and (= (inhaleExpression2 Heap@@25 this@@21) (|inhaleExpression2'| Heap@@25 this@@21)) (dummyFunction (int_2_U (|inhaleExpression2#triggerStateless| this@@21)))))
 :qid |stdinbpl.510:15|
 :skolemid |39|
 :pattern ( (inhaleExpression2 Heap@@25 this@@21))
)))
(assert (forall ((Heap@@26 T@U) (this@@22 T@U) ) (!  (=> (and (= (type Heap@@26) (MapType0Type RefType)) (= (type this@@22) RefType)) (and (= (inhaleExpression3 Heap@@26 this@@22) (|inhaleExpression3'| Heap@@26 this@@22)) (dummyFunction (int_2_U (|inhaleExpression3#triggerStateless| this@@22)))))
 :qid |stdinbpl.601:15|
 :skolemid |44|
 :pattern ( (inhaleExpression3 Heap@@26 this@@22))
)))
(assert (forall ((Heap@@27 T@U) (this@@23 T@U) ) (!  (=> (and (= (type Heap@@27) (MapType0Type RefType)) (= (type this@@23) RefType)) (and (= (exhaleTrue1 Heap@@27 this@@23) (|exhaleTrue1'| Heap@@27 this@@23)) (dummyFunction (int_2_U (|exhaleTrue1#triggerStateless| this@@23)))))
 :qid |stdinbpl.694:15|
 :skolemid |49|
 :pattern ( (exhaleTrue1 Heap@@27 this@@23))
)))
(assert (forall ((Heap@@28 T@U) (this@@24 T@U) ) (!  (=> (and (= (type Heap@@28) (MapType0Type RefType)) (= (type this@@24) RefType)) (and (= (exhaleTrue2 Heap@@28 this@@24) (|exhaleTrue2'| Heap@@28 this@@24)) (dummyFunction (int_2_U (|exhaleTrue2#triggerStateless| this@@24)))))
 :qid |stdinbpl.777:15|
 :skolemid |54|
 :pattern ( (exhaleTrue2 Heap@@28 this@@24))
)))
(assert (forall ((Heap@@29 T@U) (this@@25 T@U) ) (!  (=> (and (= (type Heap@@29) (MapType0Type RefType)) (= (type this@@25) RefType)) (and (= (exhaleTrue3 Heap@@29 this@@25) (|exhaleTrue3'| Heap@@29 this@@25)) (dummyFunction (int_2_U (|exhaleTrue3#triggerStateless| this@@25)))))
 :qid |stdinbpl.861:15|
 :skolemid |59|
 :pattern ( (exhaleTrue3 Heap@@29 this@@25))
)))
(assert (forall ((Heap@@30 T@U) (this@@26 T@U) ) (!  (=> (and (= (type Heap@@30) (MapType0Type RefType)) (= (type this@@26) RefType)) (and (= (exhaleExpression1WithRequires Heap@@30 this@@26) (|exhaleExpression1WithRequires'| Heap@@30 this@@26)) (dummyFunction (int_2_U (|exhaleExpression1WithRequires#triggerStateless| this@@26)))))
 :qid |stdinbpl.950:15|
 :skolemid |65|
 :pattern ( (exhaleExpression1WithRequires Heap@@30 this@@26))
)))
(assert (forall ((Heap@@31 T@U) (this@@27 T@U) ) (!  (=> (and (= (type Heap@@31) (MapType0Type RefType)) (= (type this@@27) RefType)) (and (= (exhaleExpression2WithRequires Heap@@31 this@@27) (|exhaleExpression2WithRequires'| Heap@@31 this@@27)) (dummyFunction (int_2_U (|exhaleExpression2WithRequires#triggerStateless| this@@27)))))
 :qid |stdinbpl.1042:15|
 :skolemid |69|
 :pattern ( (exhaleExpression2WithRequires Heap@@31 this@@27))
)))
(assert (forall ((Heap@@32 T@U) (this@@28 T@U) ) (!  (=> (and (= (type Heap@@32) (MapType0Type RefType)) (= (type this@@28) RefType)) (and (= (exhaleExpression3WithRequires Heap@@32 this@@28) (|exhaleExpression3WithRequires'| Heap@@32 this@@28)) (dummyFunction (int_2_U (|exhaleExpression3WithRequires#triggerStateless| this@@28)))))
 :qid |stdinbpl.1136:15|
 :skolemid |73|
 :pattern ( (exhaleExpression3WithRequires Heap@@32 this@@28))
)))
(assert (forall ((Heap@@33 T@U) (Mask@@9 T@U) (this@@29 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@33) (MapType0Type RefType)) (= (type Mask@@9) (MapType1Type RefType realType))) (= (type this@@29) RefType)) (and (state Heap@@33 Mask@@9) (< AssumeFunctionsAbove 2))) (= (U_2_int (MapType0Select Heap@@33 this@@29 x@@8)) 1)) (= (inhaleTrue1 Heap@@33 this@@29) 0))
 :qid |stdinbpl.214:15|
 :skolemid |24|
 :pattern ( (state Heap@@33 Mask@@9) (inhaleTrue1 Heap@@33 this@@29))
)))
(assert (forall ((Heap@@34 T@U) (Mask@@10 T@U) (this@@30 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@34) (MapType0Type RefType)) (= (type Mask@@10) (MapType1Type RefType realType))) (= (type this@@30) RefType)) (and (state Heap@@34 Mask@@10) (< AssumeFunctionsAbove 5))) (= (U_2_int (MapType0Select Heap@@34 this@@30 x@@8)) 1)) (= (inhaleTrue2 Heap@@34 this@@30) 0))
 :qid |stdinbpl.285:15|
 :skolemid |28|
 :pattern ( (state Heap@@34 Mask@@10) (inhaleTrue2 Heap@@34 this@@30))
)))
(assert (forall ((Heap@@35 T@U) (Mask@@11 T@U) (this@@31 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@35) (MapType0Type RefType)) (= (type Mask@@11) (MapType1Type RefType realType))) (= (type this@@31) RefType)) (and (state Heap@@35 Mask@@11) (< AssumeFunctionsAbove 8))) (= (U_2_int (MapType0Select Heap@@35 this@@31 x@@8)) 1)) (= (inhaleTrue3 Heap@@35 this@@31) 0))
 :qid |stdinbpl.356:15|
 :skolemid |32|
 :pattern ( (state Heap@@35 Mask@@11) (inhaleTrue3 Heap@@35 this@@31))
)))
(assert (forall ((Heap@@36 T@U) (ExhaleHeap@@2 T@U) (Mask@@12 T@U) (o_1@@0 T@U) (f_2 T@U) ) (! (let ((B@@1 (FieldTypeInv1 (type f_2))))
(let ((A@@1 (FieldTypeInv0 (type f_2))))
 (=> (and (and (and (and (and (and (= (type Heap@@36) (MapType0Type RefType)) (= (type ExhaleHeap@@2) (MapType0Type RefType))) (= (type Mask@@12) (MapType1Type RefType realType))) (= (type o_1@@0) RefType)) (= (type f_2) (FieldType A@@1 B@@1))) (IdenticalOnKnownLocations Heap@@36 ExhaleHeap@@2 Mask@@12)) (HasDirectPerm Mask@@12 o_1@@0 f_2)) (= (MapType0Select Heap@@36 o_1@@0 f_2) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2)))))
 :qid |stdinbpl.42:22|
 :skolemid |1|
 :pattern ( (IdenticalOnKnownLocations Heap@@36 ExhaleHeap@@2 Mask@@12) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2))
)))
(assert  (and (= (type dummyHeap) (MapType0Type RefType)) (= (type ZeroMask) (MapType1Type RefType realType))))
(assert (state dummyHeap ZeroMask))
(assert (forall ((p T@U) (v_1 T@U) (w T@U) ) (! (let ((A@@2 (FieldTypeInv0 (type p))))
 (=> (and (and (= (type p) (FieldType A@@2 FrameTypeType)) (= (type v_1) FrameTypeType)) (= (type w) FrameTypeType)) (not (InsidePredicate p v_1 p w))))
 :qid |stdinbpl.184:19|
 :skolemid |21|
 :pattern ( (InsidePredicate p v_1 p w))
)))
(assert  (not (IsPredicateField x@@8)))
(assert  (not (IsWandField x@@8)))
(assert (forall ((Heap@@37 T@U) (ExhaleHeap@@3 T@U) (Mask@@13 T@U) ) (!  (=> (and (and (and (= (type Heap@@37) (MapType0Type RefType)) (= (type ExhaleHeap@@3) (MapType0Type RefType))) (= (type Mask@@13) (MapType1Type RefType realType))) (IdenticalOnKnownLocations Heap@@37 ExhaleHeap@@3 Mask@@13)) (succHeap Heap@@37 ExhaleHeap@@3))
 :qid |stdinbpl.83:15|
 :skolemid |10|
 :pattern ( (IdenticalOnKnownLocations Heap@@37 ExhaleHeap@@3 Mask@@13))
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
(assert (forall ((arg0@@25 Real) (arg1@@9 T@U) ) (! (= (type (ConditionalFrame arg0@@25 arg1@@9)) FrameTypeType)
 :qid |funType:ConditionalFrame|
 :pattern ( (ConditionalFrame arg0@@25 arg1@@9))
)))
(assert (forall ((p@@0 Real) (f_6 T@U) ) (!  (=> (= (type f_6) FrameTypeType) (= (ConditionalFrame p@@0 f_6) (ite (> p@@0 0.0) f_6 EmptyFrame)))
 :qid |stdinbpl.172:15|
 :skolemid |19|
 :pattern ( (ConditionalFrame p@@0 f_6))
)))
(assert (forall ((Mask@@14 T@U) (o_2@@0 T@U) (f_4@@0 T@U) ) (! (let ((B@@3 (FieldTypeInv1 (type f_4@@0))))
(let ((A@@4 (FieldTypeInv0 (type f_4@@0))))
 (=> (and (and (= (type Mask@@14) (MapType1Type RefType realType)) (= (type o_2@@0) RefType)) (= (type f_4@@0) (FieldType A@@4 B@@3))) (= (HasDirectPerm Mask@@14 o_2@@0 f_4@@0) (> (U_2_real (MapType1Select Mask@@14 o_2@@0 f_4@@0)) NoPerm)))))
 :qid |stdinbpl.133:22|
 :skolemid |17|
 :pattern ( (HasDirectPerm Mask@@14 o_2@@0 f_4@@0))
)))
(assert (forall ((o_2@@1 T@U) (f_4@@1 T@U) ) (! (let ((B@@4 (FieldTypeInv1 (type f_4@@1))))
(let ((A@@5 (FieldTypeInv0 (type f_4@@1))))
 (=> (and (= (type o_2@@1) RefType) (= (type f_4@@1) (FieldType A@@5 B@@4))) (= (U_2_real (MapType1Select ZeroMask o_2@@1 f_4@@1)) NoPerm))))
 :qid |stdinbpl.106:22|
 :skolemid |13|
 :pattern ( (MapType1Select ZeroMask o_2@@1 f_4@@1))
)))
(assert (forall ((arg0@@26 T@U) ) (! (= (type (FrameFragment arg0@@26)) FrameTypeType)
 :qid |funType:FrameFragment|
 :pattern ( (FrameFragment arg0@@26))
)))
(assert (forall ((Heap@@38 T@U) (Mask@@15 T@U) (this@@32 T@U) ) (!  (=> (and (and (and (= (type Heap@@38) (MapType0Type RefType)) (= (type Mask@@15) (MapType1Type RefType realType))) (= (type this@@32) RefType)) (and (state Heap@@38 Mask@@15) (or (< AssumeFunctionsAbove 1) (|exhaleTrue2#trigger| (FrameFragment (MapType0Select Heap@@38 this@@32 x@@8)) this@@32)))) (and (not (= this@@32 null)) (= (U_2_int (MapType0Select Heap@@38 this@@32 x@@8)) 1)))
 :qid |stdinbpl.800:15|
 :skolemid |58|
 :pattern ( (state Heap@@38 Mask@@15) (|exhaleTrue2'| Heap@@38 this@@32))
)))
(assert (forall ((Heap@@39 T@U) (ExhaleHeap@@4 T@U) (Mask@@16 T@U) (pm_f@@1 T@U) ) (! (let ((C@@1 (FieldTypeInv0 (type pm_f@@1))))
 (=> (and (and (and (and (and (= (type Heap@@39) (MapType0Type RefType)) (= (type ExhaleHeap@@4) (MapType0Type RefType))) (= (type Mask@@16) (MapType1Type RefType realType))) (= (type pm_f@@1) (FieldType C@@1 FrameTypeType))) (IdenticalOnKnownLocations Heap@@39 ExhaleHeap@@4 Mask@@16)) (and (HasDirectPerm Mask@@16 null pm_f@@1) (IsPredicateField pm_f@@1))) (forall ((o2 T@U) (f_2@@0 T@U) ) (! (let ((B@@5 (FieldTypeInv1 (type f_2@@0))))
(let ((A@@6 (FieldTypeInv0 (type f_2@@0))))
 (=> (and (and (= (type o2) RefType) (= (type f_2@@0) (FieldType A@@6 B@@5))) (U_2_bool (MapType1Select (MapType0Select Heap@@39 null (PredicateMaskField pm_f@@1)) o2 f_2@@0))) (= (MapType0Select Heap@@39 o2 f_2@@0) (MapType0Select ExhaleHeap@@4 o2 f_2@@0)))))
 :qid |stdinbpl.54:134|
 :skolemid |3|
 :pattern ( (MapType0Select ExhaleHeap@@4 o2 f_2@@0))
))))
 :qid |stdinbpl.52:19|
 :skolemid |4|
 :pattern ( (IdenticalOnKnownLocations Heap@@39 ExhaleHeap@@4 Mask@@16) (IsPredicateField pm_f@@1))
)))
(assert (forall ((Heap@@40 T@U) (ExhaleHeap@@5 T@U) (Mask@@17 T@U) (pm_f@@2 T@U) ) (! (let ((C@@2 (FieldTypeInv0 (type pm_f@@2))))
 (=> (and (and (and (and (and (= (type Heap@@40) (MapType0Type RefType)) (= (type ExhaleHeap@@5) (MapType0Type RefType))) (= (type Mask@@17) (MapType1Type RefType realType))) (= (type pm_f@@2) (FieldType C@@2 FrameTypeType))) (IdenticalOnKnownLocations Heap@@40 ExhaleHeap@@5 Mask@@17)) (and (HasDirectPerm Mask@@17 null pm_f@@2) (IsWandField pm_f@@2))) (forall ((o2@@0 T@U) (f_2@@1 T@U) ) (! (let ((B@@6 (FieldTypeInv1 (type f_2@@1))))
(let ((A@@7 (FieldTypeInv0 (type f_2@@1))))
 (=> (and (and (= (type o2@@0) RefType) (= (type f_2@@1) (FieldType A@@7 B@@6))) (U_2_bool (MapType1Select (MapType0Select Heap@@40 null (WandMaskField pm_f@@2)) o2@@0 f_2@@1))) (= (MapType0Select Heap@@40 o2@@0 f_2@@1) (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1)))))
 :qid |stdinbpl.67:129|
 :skolemid |6|
 :pattern ( (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1))
))))
 :qid |stdinbpl.65:19|
 :skolemid |7|
 :pattern ( (IdenticalOnKnownLocations Heap@@40 ExhaleHeap@@5 Mask@@17) (IsWandField pm_f@@2))
)))
(assert (forall ((Mask@@18 T@U) (o_2@@2 T@U) (f_4@@2 T@U) ) (! (let ((B@@7 (FieldTypeInv1 (type f_4@@2))))
(let ((A@@8 (FieldTypeInv0 (type f_4@@2))))
 (=> (and (and (and (= (type Mask@@18) (MapType1Type RefType realType)) (= (type o_2@@2) RefType)) (= (type f_4@@2) (FieldType A@@8 B@@7))) (GoodMask Mask@@18)) (and (>= (U_2_real (MapType1Select Mask@@18 o_2@@2 f_4@@2)) NoPerm) (=> (and (and (GoodMask Mask@@18) (not (IsPredicateField f_4@@2))) (not (IsWandField f_4@@2))) (<= (U_2_real (MapType1Select Mask@@18 o_2@@2 f_4@@2)) FullPerm))))))
 :qid |stdinbpl.128:22|
 :skolemid |16|
 :pattern ( (GoodMask Mask@@18) (MapType1Select Mask@@18 o_2@@2 f_4@@2))
)))
(assert (forall ((Heap@@41 T@U) (Mask@@19 T@U) (this@@33 T@U) ) (!  (=> (and (and (and (= (type Heap@@41) (MapType0Type RefType)) (= (type Mask@@19) (MapType1Type RefType realType))) (= (type this@@33) RefType)) (state Heap@@41 Mask@@19)) (= (|inhaleExpression1'| Heap@@41 this@@33) (|inhaleExpression1#frame| EmptyFrame this@@33)))
 :qid |stdinbpl.436:15|
 :skolemid |37|
 :pattern ( (state Heap@@41 Mask@@19) (|inhaleExpression1'| Heap@@41 this@@33))
)))
(assert (forall ((Heap@@42 T@U) (Mask@@20 T@U) (this@@34 T@U) ) (!  (=> (and (and (and (= (type Heap@@42) (MapType0Type RefType)) (= (type Mask@@20) (MapType1Type RefType realType))) (= (type this@@34) RefType)) (state Heap@@42 Mask@@20)) (= (|inhaleExpression2'| Heap@@42 this@@34) (|inhaleExpression2#frame| EmptyFrame this@@34)))
 :qid |stdinbpl.527:15|
 :skolemid |42|
 :pattern ( (state Heap@@42 Mask@@20) (|inhaleExpression2'| Heap@@42 this@@34))
)))
(assert (forall ((Heap@@43 T@U) (Mask@@21 T@U) (this@@35 T@U) ) (!  (=> (and (and (and (= (type Heap@@43) (MapType0Type RefType)) (= (type Mask@@21) (MapType1Type RefType realType))) (= (type this@@35) RefType)) (state Heap@@43 Mask@@21)) (= (|inhaleExpression3'| Heap@@43 this@@35) (|inhaleExpression3#frame| EmptyFrame this@@35)))
 :qid |stdinbpl.618:15|
 :skolemid |47|
 :pattern ( (state Heap@@43 Mask@@21) (|inhaleExpression3'| Heap@@43 this@@35))
)))
(assert (forall ((Heap@@44 T@U) (Mask@@22 T@U) (this@@36 T@U) ) (!  (=> (and (and (and (= (type Heap@@44) (MapType0Type RefType)) (= (type Mask@@22) (MapType1Type RefType realType))) (= (type this@@36) RefType)) (state Heap@@44 Mask@@22)) (= (|inhaleTrue1'| Heap@@44 this@@36) (|inhaleTrue1#frame| (FrameFragment (MapType0Select Heap@@44 this@@36 x@@8)) this@@36)))
 :qid |stdinbpl.221:15|
 :skolemid |25|
 :pattern ( (state Heap@@44 Mask@@22) (|inhaleTrue1'| Heap@@44 this@@36))
)))
(assert (forall ((Heap@@45 T@U) (Mask@@23 T@U) (this@@37 T@U) ) (!  (=> (and (and (and (= (type Heap@@45) (MapType0Type RefType)) (= (type Mask@@23) (MapType1Type RefType realType))) (= (type this@@37) RefType)) (state Heap@@45 Mask@@23)) (= (|inhaleTrue2'| Heap@@45 this@@37) (|inhaleTrue2#frame| (FrameFragment (MapType0Select Heap@@45 this@@37 x@@8)) this@@37)))
 :qid |stdinbpl.292:15|
 :skolemid |29|
 :pattern ( (state Heap@@45 Mask@@23) (|inhaleTrue2'| Heap@@45 this@@37))
)))
(assert (forall ((Heap@@46 T@U) (Mask@@24 T@U) (this@@38 T@U) ) (!  (=> (and (and (and (= (type Heap@@46) (MapType0Type RefType)) (= (type Mask@@24) (MapType1Type RefType realType))) (= (type this@@38) RefType)) (state Heap@@46 Mask@@24)) (= (|inhaleTrue3'| Heap@@46 this@@38) (|inhaleTrue3#frame| (FrameFragment (MapType0Select Heap@@46 this@@38 x@@8)) this@@38)))
 :qid |stdinbpl.363:15|
 :skolemid |33|
 :pattern ( (state Heap@@46 Mask@@24) (|inhaleTrue3'| Heap@@46 this@@38))
)))
(assert (forall ((Heap@@47 T@U) (Mask@@25 T@U) (this@@39 T@U) ) (!  (=> (and (and (and (= (type Heap@@47) (MapType0Type RefType)) (= (type Mask@@25) (MapType1Type RefType realType))) (= (type this@@39) RefType)) (state Heap@@47 Mask@@25)) (= (|exhaleTrue1'| Heap@@47 this@@39) (|exhaleTrue1#frame| (FrameFragment (MapType0Select Heap@@47 this@@39 x@@8)) this@@39)))
 :qid |stdinbpl.711:15|
 :skolemid |52|
 :pattern ( (state Heap@@47 Mask@@25) (|exhaleTrue1'| Heap@@47 this@@39))
)))
(assert (forall ((Heap@@48 T@U) (Mask@@26 T@U) (this@@40 T@U) ) (!  (=> (and (and (and (= (type Heap@@48) (MapType0Type RefType)) (= (type Mask@@26) (MapType1Type RefType realType))) (= (type this@@40) RefType)) (state Heap@@48 Mask@@26)) (= (|exhaleTrue2'| Heap@@48 this@@40) (|exhaleTrue2#frame| (FrameFragment (MapType0Select Heap@@48 this@@40 x@@8)) this@@40)))
 :qid |stdinbpl.794:15|
 :skolemid |57|
 :pattern ( (state Heap@@48 Mask@@26) (|exhaleTrue2'| Heap@@48 this@@40))
)))
(assert (forall ((Heap@@49 T@U) (Mask@@27 T@U) (this@@41 T@U) ) (!  (=> (and (and (and (= (type Heap@@49) (MapType0Type RefType)) (= (type Mask@@27) (MapType1Type RefType realType))) (= (type this@@41) RefType)) (state Heap@@49 Mask@@27)) (= (|exhaleTrue3'| Heap@@49 this@@41) (|exhaleTrue3#frame| (FrameFragment (MapType0Select Heap@@49 this@@41 x@@8)) this@@41)))
 :qid |stdinbpl.878:15|
 :skolemid |62|
 :pattern ( (state Heap@@49 Mask@@27) (|exhaleTrue3'| Heap@@49 this@@41))
)))
(assert (forall ((Heap@@50 T@U) (Mask@@28 T@U) (this@@42 T@U) ) (!  (=> (and (and (and (= (type Heap@@50) (MapType0Type RefType)) (= (type Mask@@28) (MapType1Type RefType realType))) (= (type this@@42) RefType)) (state Heap@@50 Mask@@28)) (= (|exhaleExpression1WithRequires'| Heap@@50 this@@42) (|exhaleExpression1WithRequires#frame| (FrameFragment (MapType0Select Heap@@50 this@@42 x@@8)) this@@42)))
 :qid |stdinbpl.967:15|
 :skolemid |68|
 :pattern ( (state Heap@@50 Mask@@28) (|exhaleExpression1WithRequires'| Heap@@50 this@@42))
)))
(assert (forall ((Heap@@51 T@U) (Mask@@29 T@U) (this@@43 T@U) ) (!  (=> (and (and (and (= (type Heap@@51) (MapType0Type RefType)) (= (type Mask@@29) (MapType1Type RefType realType))) (= (type this@@43) RefType)) (state Heap@@51 Mask@@29)) (= (|exhaleExpression2WithRequires'| Heap@@51 this@@43) (|exhaleExpression2WithRequires#frame| (FrameFragment (MapType0Select Heap@@51 this@@43 x@@8)) this@@43)))
 :qid |stdinbpl.1059:15|
 :skolemid |72|
 :pattern ( (state Heap@@51 Mask@@29) (|exhaleExpression2WithRequires'| Heap@@51 this@@43))
)))
(assert (forall ((Heap@@52 T@U) (Mask@@30 T@U) (this@@44 T@U) ) (!  (=> (and (and (and (= (type Heap@@52) (MapType0Type RefType)) (= (type Mask@@30) (MapType1Type RefType realType))) (= (type this@@44) RefType)) (state Heap@@52 Mask@@30)) (= (|exhaleExpression3WithRequires'| Heap@@52 this@@44) (|exhaleExpression3WithRequires#frame| (FrameFragment (MapType0Select Heap@@52 this@@44 x@@8)) this@@44)))
 :qid |stdinbpl.1153:15|
 :skolemid |76|
 :pattern ( (state Heap@@52 Mask@@30) (|exhaleExpression3WithRequires'| Heap@@52 this@@44))
)))
(assert (forall ((o T@U) (f T@U) (Heap@@53 T@U) ) (!  (=> (and (and (and (= (type o) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap@@53) (MapType0Type RefType))) (U_2_bool (MapType0Select Heap@@53 o $allocated))) (U_2_bool (MapType0Select Heap@@53 (MapType0Select Heap@@53 o f) $allocated)))
 :qid |stdinbpl.31:15|
 :skolemid |0|
 :pattern ( (MapType0Select Heap@@53 o f))
)))
(assert (forall ((Heap@@54 T@U) (o@@0 T@U) (f_3 T@U) (v T@U) ) (! (let ((B@@8 (type v)))
(let ((A@@9 (FieldTypeInv0 (type f_3))))
 (=> (and (and (= (type Heap@@54) (MapType0Type RefType)) (= (type o@@0) RefType)) (= (type f_3) (FieldType A@@9 B@@8))) (succHeap Heap@@54 (MapType0Store Heap@@54 o@@0 f_3 v)))))
 :qid |stdinbpl.78:22|
 :skolemid |9|
 :pattern ( (MapType0Store Heap@@54 o@@0 f_3 v))
)))
(assert (forall ((Heap@@55 T@U) (Mask@@31 T@U) (this@@45 T@U) ) (!  (=> (and (and (and (= (type Heap@@55) (MapType0Type RefType)) (= (type Mask@@31) (MapType1Type RefType realType))) (= (type this@@45) RefType)) (and (state Heap@@55 Mask@@31) (< AssumeFunctionsAbove 0))) (= (inhaleExpression2 Heap@@55 this@@45) (U_2_int (MapType0Select Heap@@55 this@@45 x@@8))))
 :qid |stdinbpl.520:15|
 :skolemid |41|
 :pattern ( (state Heap@@55 Mask@@31) (inhaleExpression2 Heap@@55 this@@45))
)))
(assert (forall ((Heap@@56 T@U) (Mask@@32 T@U) (this@@46 T@U) ) (!  (=> (and (and (and (= (type Heap@@56) (MapType0Type RefType)) (= (type Mask@@32) (MapType1Type RefType realType))) (= (type this@@46) RefType)) (and (state Heap@@56 Mask@@32) (< AssumeFunctionsAbove 3))) (= (inhaleExpression1 Heap@@56 this@@46) (U_2_int (MapType0Select Heap@@56 this@@46 x@@8))))
 :qid |stdinbpl.429:15|
 :skolemid |36|
 :pattern ( (state Heap@@56 Mask@@32) (inhaleExpression1 Heap@@56 this@@46))
)))
(assert (forall ((Heap@@57 T@U) (Mask@@33 T@U) (this@@47 T@U) ) (!  (=> (and (and (and (= (type Heap@@57) (MapType0Type RefType)) (= (type Mask@@33) (MapType1Type RefType realType))) (= (type this@@47) RefType)) (and (state Heap@@57 Mask@@33) (< AssumeFunctionsAbove 4))) (= (inhaleExpression3 Heap@@57 this@@47) (U_2_int (MapType0Select Heap@@57 this@@47 x@@8))))
 :qid |stdinbpl.611:15|
 :skolemid |46|
 :pattern ( (state Heap@@57 Mask@@33) (inhaleExpression3 Heap@@57 this@@47))
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
 :qid |stdinbpl.179:25|
 :skolemid |20|
 :pattern ( (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))
)))
(assert (forall ((Heap@@58 T@U) (Mask@@34 T@U) (this@@48 T@U) ) (!  (=> (and (and (and (= (type Heap@@58) (MapType0Type RefType)) (= (type Mask@@34) (MapType1Type RefType realType))) (= (type this@@48) RefType)) (and (state Heap@@58 Mask@@34) (< AssumeFunctionsAbove 1))) (= (exhaleTrue2 Heap@@58 this@@48) 0))
 :qid |stdinbpl.787:15|
 :skolemid |56|
 :pattern ( (state Heap@@58 Mask@@34) (exhaleTrue2 Heap@@58 this@@48))
)))
(assert (forall ((Heap@@59 T@U) (Mask@@35 T@U) (this@@49 T@U) ) (!  (=> (and (and (and (= (type Heap@@59) (MapType0Type RefType)) (= (type Mask@@35) (MapType1Type RefType realType))) (= (type this@@49) RefType)) (and (state Heap@@59 Mask@@35) (< AssumeFunctionsAbove 6))) (= (exhaleTrue1 Heap@@59 this@@49) 0))
 :qid |stdinbpl.704:15|
 :skolemid |51|
 :pattern ( (state Heap@@59 Mask@@35) (exhaleTrue1 Heap@@59 this@@49))
)))
(assert (forall ((Heap@@60 T@U) (Mask@@36 T@U) (this@@50 T@U) ) (!  (=> (and (and (and (= (type Heap@@60) (MapType0Type RefType)) (= (type Mask@@36) (MapType1Type RefType realType))) (= (type this@@50) RefType)) (and (state Heap@@60 Mask@@36) (< AssumeFunctionsAbove 9))) (= (exhaleTrue3 Heap@@60 this@@50) 0))
 :qid |stdinbpl.871:15|
 :skolemid |61|
 :pattern ( (state Heap@@60 Mask@@36) (exhaleTrue3 Heap@@60 this@@50))
)))
(assert (forall ((Heap@@61 T@U) (Mask@@37 T@U) (this@@51 T@U) ) (!  (=> (and (and (and (= (type Heap@@61) (MapType0Type RefType)) (= (type Mask@@37) (MapType1Type RefType realType))) (= (type this@@51) RefType)) (and (state Heap@@61 Mask@@37) (or (< AssumeFunctionsAbove 6) (|exhaleTrue1#trigger| (FrameFragment (MapType0Select Heap@@61 this@@51 x@@8)) this@@51)))) (= (U_2_int (MapType0Select Heap@@61 this@@51 x@@8)) 1))
 :qid |stdinbpl.717:15|
 :skolemid |53|
 :pattern ( (state Heap@@61 Mask@@37) (|exhaleTrue1'| Heap@@61 this@@51))
)))
(assert (forall ((Heap@@62 T@U) (Mask@@38 T@U) (this@@52 T@U) ) (!  (=> (and (and (and (= (type Heap@@62) (MapType0Type RefType)) (= (type Mask@@38) (MapType1Type RefType realType))) (= (type this@@52) RefType)) (and (state Heap@@62 Mask@@38) (or (< AssumeFunctionsAbove 9) (|exhaleTrue3#trigger| (FrameFragment (MapType0Select Heap@@62 this@@52 x@@8)) this@@52)))) (= (U_2_int (MapType0Select Heap@@62 this@@52 x@@8)) 1))
 :qid |stdinbpl.888:15|
 :skolemid |64|
 :pattern ( (state Heap@@62 Mask@@38) (|exhaleTrue3'| Heap@@62 this@@52))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
(assert (forall ((Heap@@63 T@U) (Mask@@39 T@U) (this@@53 T@U) ) (!  (=> (and (and (and (= (type Heap@@63) (MapType0Type RefType)) (= (type Mask@@39) (MapType1Type RefType realType))) (= (type this@@53) RefType)) (and (state Heap@@63 Mask@@39) (or (< AssumeFunctionsAbove 9) (|exhaleTrue3#trigger| (FrameFragment (MapType0Select Heap@@63 this@@53 x@@8)) this@@53)))) (not (= this@@53 null)))
 :qid |stdinbpl.884:15|
 :skolemid |63|
 :pattern ( (state Heap@@63 Mask@@39) (|exhaleTrue3'| Heap@@63 this@@53))
)))
(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun this@@54 () T@U)
(declare-fun Mask@0 () T@U)
(declare-fun Heap@@64 () T@U)
(assert  (and (and (= (type this@@54) RefType) (= (type Mask@0) (MapType1Type RefType realType))) (= (type Heap@@64) (MapType0Type RefType))))
(set-info :boogie-vc-id |inhaleTrue2#definedness|)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 5) (let ((anon3_Else_correct true))
(let ((anon3_Then_correct  (=> (and (and (not (= this@@54 null)) (= Mask@0 (MapType1Store ZeroMask this@@54 x@@8 (real_2_U (+ (U_2_real (MapType1Select ZeroMask this@@54 x@@8)) FullPerm))))) (and (state Heap@@64 Mask@0) (= (ControlFlow 0 2) (- 0 1)))) (HasDirectPerm Mask@0 this@@54 x@@8))))
(let ((anon0_correct  (=> (state Heap@@64 ZeroMask) (=> (and (U_2_bool (MapType0Select Heap@@64 this@@54 $allocated)) (= AssumeFunctionsAbove 5)) (and (=> (= (ControlFlow 0 4) 2) anon3_Then_correct) (=> (= (ControlFlow 0 4) 3) anon3_Else_correct))))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 5) 4) anon0_correct)))
PreconditionGeneratedEntry_correct)))))
))
(check-sat)
(pop 1)
; Valid
(get-info :rlimit)
