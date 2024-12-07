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
(declare-fun succHeap (T@U T@U) Bool)
(declare-fun MapType0Type (T@T) T@T)
(declare-fun RefType () T@T)
(declare-fun succHeapTrans (T@U T@U) Bool)
(declare-fun MapType0TypeInv0 (T@T) T@T)
(declare-fun FieldType (T@T T@T) T@T)
(declare-fun FieldTypeInv0 (T@T) T@T)
(declare-fun FieldTypeInv1 (T@T) T@T)
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
(declare-fun |fun11'| (T@U Int) Int)
(declare-fun dummyFunction (T@U) Bool)
(declare-fun |fun11#triggerStateless| (Int) Int)
(declare-fun |fun12'| (T@U Int) Int)
(declare-fun |fun12#triggerStateless| (Int) Int)
(declare-fun |fun13'| (T@U Int) Int)
(declare-fun |fun13#triggerStateless| (Int) Int)
(declare-fun |fun14'| (T@U Int) Int)
(declare-fun |fun14#triggerStateless| (Int) Int)
(declare-fun |fun15'| (T@U Int) Int)
(declare-fun |fun15#triggerStateless| (Int) Int)
(declare-fun |fun16'| (T@U Int) Int)
(declare-fun |fun16#triggerStateless| (Int) Int)
(declare-fun |fun17'| (T@U Int) Int)
(declare-fun |fun17#triggerStateless| (Int) Int)
(declare-fun |fun18'| (T@U Int) Int)
(declare-fun |fun18#triggerStateless| (Int) Int)
(declare-fun $allocated () T@U)
(declare-fun NormalFieldType () T@T)
(declare-fun fun11 (T@U Int) Int)
(declare-fun fun12 (T@U Int) Int)
(declare-fun fun13 (T@U Int) Int)
(declare-fun fun14 (T@U Int) Int)
(declare-fun fun15 (T@U Int) Int)
(declare-fun fun16 (T@U Int) Int)
(declare-fun fun17 (T@U Int) Int)
(declare-fun fun18 (T@U Int) Int)
(declare-fun |fun02'| (T@U) Int)
(declare-fun AssumeFunctionsAbove () Int)
(declare-fun |fun02#trigger| (T@U) Bool)
(declare-fun EmptyFrame () T@U)
(declare-fun |fun03'| (T@U) Int)
(declare-fun |fun03#trigger| (T@U) Bool)
(declare-fun |fun01'| (T@U) Int)
(declare-fun |fun01#trigger| (T@U) Bool)
(declare-fun |fun04'| (T@U) Int)
(declare-fun |fun04#trigger| (T@U) Bool)
(declare-fun dummyHeap () T@U)
(declare-fun ZeroMask () T@U)
(declare-fun InsidePredicate (T@U T@U T@U T@U) Bool)
(declare-fun |fun05'| (T@U) Int)
(declare-fun |fun05#trigger| (T@U) Bool)
(declare-fun |fun06'| (T@U) Int)
(declare-fun |fun06#trigger| (T@U) Bool)
(declare-fun sumMask (T@U T@U T@U) Bool)
(declare-fun ConditionalFrame (Real T@U) T@U)
(declare-fun fun01 (T@U) Int)
(declare-fun |fun01#triggerStateless| () Int)
(declare-fun fun02 (T@U) Int)
(declare-fun |fun02#triggerStateless| () Int)
(declare-fun fun03 (T@U) Int)
(declare-fun |fun03#triggerStateless| () Int)
(declare-fun fun04 (T@U) Int)
(declare-fun |fun04#triggerStateless| () Int)
(declare-fun fun05 (T@U) Int)
(declare-fun |fun05#triggerStateless| () Int)
(declare-fun fun06 (T@U) Int)
(declare-fun |fun06#triggerStateless| () Int)
(declare-fun fun07 (T@U) Int)
(declare-fun |fun07'| (T@U) Int)
(declare-fun |fun07#triggerStateless| () Int)
(declare-fun fun08 (T@U) Int)
(declare-fun |fun08'| (T@U) Int)
(declare-fun |fun08#triggerStateless| () Int)
(declare-fun NoPerm () Real)
(declare-fun FullPerm () Real)
(declare-fun |fun11#frame| (T@U Int) Int)
(declare-fun |fun12#frame| (T@U Int) Int)
(declare-fun |fun13#frame| (T@U Int) Int)
(declare-fun |fun14#frame| (T@U Int) Int)
(declare-fun |fun15#frame| (T@U Int) Int)
(declare-fun |fun16#frame| (T@U Int) Int)
(declare-fun |fun17#frame| (T@U Int) Int)
(declare-fun |fun18#frame| (T@U Int) Int)
(declare-fun |fun01#frame| (T@U) Int)
(declare-fun |fun02#frame| (T@U) Int)
(declare-fun |fun03#frame| (T@U) Int)
(declare-fun |fun04#frame| (T@U) Int)
(declare-fun |fun05#frame| (T@U) Int)
(declare-fun |fun06#frame| (T@U) Int)
(declare-fun |fun07#frame| (T@U) Int)
(declare-fun |fun08#frame| (T@U) Int)
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
(assert  (and (and (and (and (and (and (and (and (and (forall ((arg0@@11 T@T) ) (! (= (Ctor (MapType0Type arg0@@11)) 6)
 :qid |ctor:MapType0Type|
)) (forall ((arg0@@12 T@T) ) (! (= (MapType0TypeInv0 (MapType0Type arg0@@12)) arg0@@12)
 :qid |typeInv:MapType0TypeInv0|
 :pattern ( (MapType0Type arg0@@12))
))) (forall ((arg0@@13 T@T) (arg1 T@T) ) (! (= (Ctor (FieldType arg0@@13 arg1)) 7)
 :qid |ctor:FieldType|
))) (forall ((arg0@@14 T@T) (arg1@@0 T@T) ) (! (= (FieldTypeInv0 (FieldType arg0@@14 arg1@@0)) arg0@@14)
 :qid |typeInv:FieldTypeInv0|
 :pattern ( (FieldType arg0@@14 arg1@@0))
))) (forall ((arg0@@15 T@T) (arg1@@1 T@T) ) (! (= (FieldTypeInv1 (FieldType arg0@@15 arg1@@1)) arg1@@1)
 :qid |typeInv:FieldTypeInv1|
 :pattern ( (FieldType arg0@@15 arg1@@1))
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
)))) (= (Ctor RefType) 8)))
(assert (forall ((Heap0 T@U) (Heap1 T@U) ) (!  (=> (and (and (= (type Heap0) (MapType0Type RefType)) (= (type Heap1) (MapType0Type RefType))) (succHeap Heap0 Heap1)) (succHeapTrans Heap0 Heap1))
 :qid |stdinbpl.88:15|
 :skolemid |11|
 :pattern ( (succHeap Heap0 Heap1))
)))
(assert  (and (and (and (and (and (and (forall ((arg0@@18 T@T) (arg1@@4 T@T) ) (! (= (Ctor (MapType1Type arg0@@18 arg1@@4)) 9)
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
(assert  (and (and (= (Ctor FrameTypeType) 10) (= (type null) RefType)) (forall ((arg0@@23 T@U) ) (! (let ((A (FieldTypeInv0 (type arg0@@23))))
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
(assert (forall ((Heap@@2 T@U) (x@@8 Int) ) (!  (=> (= (type Heap@@2) (MapType0Type RefType)) (dummyFunction (int_2_U (|fun11#triggerStateless| x@@8))))
 :qid |stdinbpl.791:15|
 :skolemid |61|
 :pattern ( (|fun11'| Heap@@2 x@@8))
)))
(assert (forall ((Heap@@3 T@U) (x@@9 Int) ) (!  (=> (= (type Heap@@3) (MapType0Type RefType)) (dummyFunction (int_2_U (|fun12#triggerStateless| x@@9))))
 :qid |stdinbpl.841:15|
 :skolemid |64|
 :pattern ( (|fun12'| Heap@@3 x@@9))
)))
(assert (forall ((Heap@@4 T@U) (x@@10 Int) ) (!  (=> (= (type Heap@@4) (MapType0Type RefType)) (dummyFunction (int_2_U (|fun13#triggerStateless| x@@10))))
 :qid |stdinbpl.900:15|
 :skolemid |68|
 :pattern ( (|fun13'| Heap@@4 x@@10))
)))
(assert (forall ((Heap@@5 T@U) (x@@11 Int) ) (!  (=> (= (type Heap@@5) (MapType0Type RefType)) (dummyFunction (int_2_U (|fun14#triggerStateless| x@@11))))
 :qid |stdinbpl.964:15|
 :skolemid |71|
 :pattern ( (|fun14'| Heap@@5 x@@11))
)))
(assert (forall ((Heap@@6 T@U) (x@@12 Int) ) (!  (=> (= (type Heap@@6) (MapType0Type RefType)) (dummyFunction (int_2_U (|fun15#triggerStateless| x@@12))))
 :qid |stdinbpl.1037:15|
 :skolemid |75|
 :pattern ( (|fun15'| Heap@@6 x@@12))
)))
(assert (forall ((Heap@@7 T@U) (x@@13 Int) ) (!  (=> (= (type Heap@@7) (MapType0Type RefType)) (dummyFunction (int_2_U (|fun16#triggerStateless| x@@13))))
 :qid |stdinbpl.1101:15|
 :skolemid |78|
 :pattern ( (|fun16'| Heap@@7 x@@13))
)))
(assert (forall ((Heap@@8 T@U) (x@@14 Int) ) (!  (=> (= (type Heap@@8) (MapType0Type RefType)) (dummyFunction (int_2_U (|fun17#triggerStateless| x@@14))))
 :qid |stdinbpl.1174:15|
 :skolemid |82|
 :pattern ( (|fun17'| Heap@@8 x@@14))
)))
(assert (forall ((Heap@@9 T@U) (x@@15 Int) ) (!  (=> (= (type Heap@@9) (MapType0Type RefType)) (dummyFunction (int_2_U (|fun18#triggerStateless| x@@15))))
 :qid |stdinbpl.1233:15|
 :skolemid |85|
 :pattern ( (|fun18'| Heap@@9 x@@15))
)))
(assert  (and (= (Ctor NormalFieldType) 11) (= (type $allocated) (FieldType NormalFieldType boolType))))
(assert (forall ((Heap@@10 T@U) (ExhaleHeap@@1 T@U) (Mask@@2 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@10) (MapType0Type RefType)) (= (type ExhaleHeap@@1) (MapType0Type RefType))) (= (type Mask@@2) (MapType1Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@10 ExhaleHeap@@1 Mask@@2)) (U_2_bool (MapType0Select Heap@@10 o_1 $allocated))) (U_2_bool (MapType0Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.73:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@10 ExhaleHeap@@1 Mask@@2) (MapType0Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert (forall ((Heap@@11 T@U) (x@@16 Int) ) (!  (=> (= (type Heap@@11) (MapType0Type RefType)) (and (= (fun11 Heap@@11 x@@16) (|fun11'| Heap@@11 x@@16)) (dummyFunction (int_2_U (|fun11#triggerStateless| x@@16)))))
 :qid |stdinbpl.787:15|
 :skolemid |60|
 :pattern ( (fun11 Heap@@11 x@@16))
)))
(assert (forall ((Heap@@12 T@U) (x@@17 Int) ) (!  (=> (= (type Heap@@12) (MapType0Type RefType)) (and (= (fun12 Heap@@12 x@@17) (|fun12'| Heap@@12 x@@17)) (dummyFunction (int_2_U (|fun12#triggerStateless| x@@17)))))
 :qid |stdinbpl.837:15|
 :skolemid |63|
 :pattern ( (fun12 Heap@@12 x@@17))
)))
(assert (forall ((Heap@@13 T@U) (x@@18 Int) ) (!  (=> (= (type Heap@@13) (MapType0Type RefType)) (and (= (fun13 Heap@@13 x@@18) (|fun13'| Heap@@13 x@@18)) (dummyFunction (int_2_U (|fun13#triggerStateless| x@@18)))))
 :qid |stdinbpl.896:15|
 :skolemid |67|
 :pattern ( (fun13 Heap@@13 x@@18))
)))
(assert (forall ((Heap@@14 T@U) (x@@19 Int) ) (!  (=> (= (type Heap@@14) (MapType0Type RefType)) (and (= (fun14 Heap@@14 x@@19) (|fun14'| Heap@@14 x@@19)) (dummyFunction (int_2_U (|fun14#triggerStateless| x@@19)))))
 :qid |stdinbpl.960:15|
 :skolemid |70|
 :pattern ( (fun14 Heap@@14 x@@19))
)))
(assert (forall ((Heap@@15 T@U) (x@@20 Int) ) (!  (=> (= (type Heap@@15) (MapType0Type RefType)) (and (= (fun15 Heap@@15 x@@20) (|fun15'| Heap@@15 x@@20)) (dummyFunction (int_2_U (|fun15#triggerStateless| x@@20)))))
 :qid |stdinbpl.1033:15|
 :skolemid |74|
 :pattern ( (fun15 Heap@@15 x@@20))
)))
(assert (forall ((Heap@@16 T@U) (x@@21 Int) ) (!  (=> (= (type Heap@@16) (MapType0Type RefType)) (and (= (fun16 Heap@@16 x@@21) (|fun16'| Heap@@16 x@@21)) (dummyFunction (int_2_U (|fun16#triggerStateless| x@@21)))))
 :qid |stdinbpl.1097:15|
 :skolemid |77|
 :pattern ( (fun16 Heap@@16 x@@21))
)))
(assert (forall ((Heap@@17 T@U) (x@@22 Int) ) (!  (=> (= (type Heap@@17) (MapType0Type RefType)) (and (= (fun17 Heap@@17 x@@22) (|fun17'| Heap@@17 x@@22)) (dummyFunction (int_2_U (|fun17#triggerStateless| x@@22)))))
 :qid |stdinbpl.1170:15|
 :skolemid |81|
 :pattern ( (fun17 Heap@@17 x@@22))
)))
(assert (forall ((Heap@@18 T@U) (x@@23 Int) ) (!  (=> (= (type Heap@@18) (MapType0Type RefType)) (and (= (fun18 Heap@@18 x@@23) (|fun18'| Heap@@18 x@@23)) (dummyFunction (int_2_U (|fun18#triggerStateless| x@@23)))))
 :qid |stdinbpl.1229:15|
 :skolemid |84|
 :pattern ( (fun18 Heap@@18 x@@23))
)))
(assert (= (type EmptyFrame) FrameTypeType))
(assert (forall ((Heap@@19 T@U) (Mask@@3 T@U) ) (!  (=> (and (and (= (type Heap@@19) (MapType0Type RefType)) (= (type Mask@@3) (MapType1Type RefType realType))) (and (state Heap@@19 Mask@@3) (or (< AssumeFunctionsAbove 3) (|fun02#trigger| EmptyFrame)))) (not (= (|fun02'| Heap@@19) 0)))
 :qid |stdinbpl.283:15|
 :skolemid |31|
 :pattern ( (state Heap@@19 Mask@@3) (|fun02'| Heap@@19))
)))
(assert (forall ((Heap@@20 T@U) (Mask@@4 T@U) ) (!  (=> (and (and (= (type Heap@@20) (MapType0Type RefType)) (= (type Mask@@4) (MapType1Type RefType realType))) (and (state Heap@@20 Mask@@4) (or (< AssumeFunctionsAbove 10) (|fun03#trigger| EmptyFrame)))) (not (= (|fun03'| Heap@@20) 0)))
 :qid |stdinbpl.350:15|
 :skolemid |36|
 :pattern ( (state Heap@@20 Mask@@4) (|fun03'| Heap@@20))
)))
(assert (forall ((Heap@@21 T@U) (Mask@@5 T@U) ) (!  (=> (and (and (= (type Heap@@21) (MapType0Type RefType)) (= (type Mask@@5) (MapType1Type RefType realType))) (and (state Heap@@21 Mask@@5) (or (< AssumeFunctionsAbove 14) (|fun01#trigger| EmptyFrame)))) (not (= (|fun01'| Heap@@21) 0)))
 :qid |stdinbpl.217:15|
 :skolemid |25|
 :pattern ( (state Heap@@21 Mask@@5) (|fun01'| Heap@@21))
)))
(assert (forall ((Heap@@22 T@U) (Mask@@6 T@U) ) (!  (=> (and (and (= (type Heap@@22) (MapType0Type RefType)) (= (type Mask@@6) (MapType1Type RefType realType))) (and (state Heap@@22 Mask@@6) (or (< AssumeFunctionsAbove 15) (|fun04#trigger| EmptyFrame)))) (not (= (|fun04'| Heap@@22) 0)))
 :qid |stdinbpl.430:15|
 :skolemid |42|
 :pattern ( (state Heap@@22 Mask@@6) (|fun04'| Heap@@22))
)))
(assert (forall ((Heap@@23 T@U) (ExhaleHeap@@2 T@U) (Mask@@7 T@U) (o_1@@0 T@U) (f_2 T@U) ) (! (let ((B@@1 (FieldTypeInv1 (type f_2))))
(let ((A@@1 (FieldTypeInv0 (type f_2))))
 (=> (and (and (and (and (and (and (= (type Heap@@23) (MapType0Type RefType)) (= (type ExhaleHeap@@2) (MapType0Type RefType))) (= (type Mask@@7) (MapType1Type RefType realType))) (= (type o_1@@0) RefType)) (= (type f_2) (FieldType A@@1 B@@1))) (IdenticalOnKnownLocations Heap@@23 ExhaleHeap@@2 Mask@@7)) (HasDirectPerm Mask@@7 o_1@@0 f_2)) (= (MapType0Select Heap@@23 o_1@@0 f_2) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2)))))
 :qid |stdinbpl.42:22|
 :skolemid |1|
 :pattern ( (IdenticalOnKnownLocations Heap@@23 ExhaleHeap@@2 Mask@@7) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2))
)))
(assert  (and (= (type dummyHeap) (MapType0Type RefType)) (= (type ZeroMask) (MapType1Type RefType realType))))
(assert (state dummyHeap ZeroMask))
(assert (forall ((p T@U) (v_1 T@U) (w T@U) ) (! (let ((A@@2 (FieldTypeInv0 (type p))))
 (=> (and (and (= (type p) (FieldType A@@2 FrameTypeType)) (= (type v_1) FrameTypeType)) (= (type w) FrameTypeType)) (not (InsidePredicate p v_1 p w))))
 :qid |stdinbpl.188:19|
 :skolemid |21|
 :pattern ( (InsidePredicate p v_1 p w))
)))
(assert (forall ((Heap@@24 T@U) (ExhaleHeap@@3 T@U) (Mask@@8 T@U) ) (!  (=> (and (and (and (= (type Heap@@24) (MapType0Type RefType)) (= (type ExhaleHeap@@3) (MapType0Type RefType))) (= (type Mask@@8) (MapType1Type RefType realType))) (IdenticalOnKnownLocations Heap@@24 ExhaleHeap@@3 Mask@@8)) (succHeap Heap@@24 ExhaleHeap@@3))
 :qid |stdinbpl.83:15|
 :skolemid |10|
 :pattern ( (IdenticalOnKnownLocations Heap@@24 ExhaleHeap@@3 Mask@@8))
)))
(assert (forall ((Heap@@25 T@U) (Mask@@9 T@U) ) (!  (=> (and (and (= (type Heap@@25) (MapType0Type RefType)) (= (type Mask@@9) (MapType1Type RefType realType))) (and (state Heap@@25 Mask@@9) (or (< AssumeFunctionsAbove 3) (|fun02#trigger| EmptyFrame)))) (not (= (div 1 (|fun02'| Heap@@25)) 2)))
 :qid |stdinbpl.287:15|
 :skolemid |32|
 :pattern ( (state Heap@@25 Mask@@9) (|fun02'| Heap@@25))
)))
(assert (forall ((Heap@@26 T@U) (Mask@@10 T@U) ) (!  (=> (and (and (= (type Heap@@26) (MapType0Type RefType)) (= (type Mask@@10) (MapType1Type RefType realType))) (and (state Heap@@26 Mask@@10) (or (< AssumeFunctionsAbove 4) (|fun05#trigger| EmptyFrame)))) (not (= (div 1 (|fun05'| Heap@@26)) 2)))
 :qid |stdinbpl.511:15|
 :skolemid |47|
 :pattern ( (state Heap@@26 Mask@@10) (|fun05'| Heap@@26))
)))
(assert (forall ((Heap@@27 T@U) (Mask@@11 T@U) ) (!  (=> (and (and (= (type Heap@@27) (MapType0Type RefType)) (= (type Mask@@11) (MapType1Type RefType realType))) (and (state Heap@@27 Mask@@11) (or (< AssumeFunctionsAbove 10) (|fun03#trigger| EmptyFrame)))) (not (= (div 1 (|fun03'| Heap@@27)) 2)))
 :qid |stdinbpl.354:15|
 :skolemid |37|
 :pattern ( (state Heap@@27 Mask@@11) (|fun03'| Heap@@27))
)))
(assert (forall ((Heap@@28 T@U) (Mask@@12 T@U) ) (!  (=> (and (and (= (type Heap@@28) (MapType0Type RefType)) (= (type Mask@@12) (MapType1Type RefType realType))) (and (state Heap@@28 Mask@@12) (or (< AssumeFunctionsAbove 11) (|fun06#trigger| EmptyFrame)))) (not (= (div 1 (|fun06'| Heap@@28)) 2)))
 :qid |stdinbpl.588:15|
 :skolemid |52|
 :pattern ( (state Heap@@28 Mask@@12) (|fun06'| Heap@@28))
)))
(assert (forall ((Heap@@29 T@U) (Mask@@13 T@U) ) (!  (=> (and (and (= (type Heap@@29) (MapType0Type RefType)) (= (type Mask@@13) (MapType1Type RefType realType))) (and (state Heap@@29 Mask@@13) (or (< AssumeFunctionsAbove 14) (|fun01#trigger| EmptyFrame)))) (not (= (div 1 (|fun01'| Heap@@29)) 2)))
 :qid |stdinbpl.221:15|
 :skolemid |26|
 :pattern ( (state Heap@@29 Mask@@13) (|fun01'| Heap@@29))
)))
(assert (forall ((Heap@@30 T@U) (Mask@@14 T@U) ) (!  (=> (and (and (= (type Heap@@30) (MapType0Type RefType)) (= (type Mask@@14) (MapType1Type RefType realType))) (and (state Heap@@30 Mask@@14) (or (< AssumeFunctionsAbove 15) (|fun04#trigger| EmptyFrame)))) (not (= (div 1 (|fun04'| Heap@@30)) 2)))
 :qid |stdinbpl.434:15|
 :skolemid |43|
 :pattern ( (state Heap@@30 Mask@@14) (|fun04'| Heap@@30))
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
 :qid |stdinbpl.176:15|
 :skolemid |19|
 :pattern ( (ConditionalFrame p@@0 f_6))
)))
(assert (forall ((Heap@@31 T@U) ) (!  (=> (= (type Heap@@31) (MapType0Type RefType)) (and (= (fun01 Heap@@31) (|fun01'| Heap@@31)) (dummyFunction (int_2_U |fun01#triggerStateless|))))
 :qid |stdinbpl.200:15|
 :skolemid |22|
 :pattern ( (fun01 Heap@@31))
)))
(assert (forall ((Heap@@32 T@U) ) (!  (=> (= (type Heap@@32) (MapType0Type RefType)) (and (= (fun02 Heap@@32) (|fun02'| Heap@@32)) (dummyFunction (int_2_U |fun02#triggerStateless|))))
 :qid |stdinbpl.260:15|
 :skolemid |27|
 :pattern ( (fun02 Heap@@32))
)))
(assert (forall ((Heap@@33 T@U) ) (!  (=> (= (type Heap@@33) (MapType0Type RefType)) (and (= (fun03 Heap@@33) (|fun03'| Heap@@33)) (dummyFunction (int_2_U |fun03#triggerStateless|))))
 :qid |stdinbpl.333:15|
 :skolemid |33|
 :pattern ( (fun03 Heap@@33))
)))
(assert (forall ((Heap@@34 T@U) ) (!  (=> (= (type Heap@@34) (MapType0Type RefType)) (and (= (fun04 Heap@@34) (|fun04'| Heap@@34)) (dummyFunction (int_2_U |fun04#triggerStateless|))))
 :qid |stdinbpl.407:15|
 :skolemid |38|
 :pattern ( (fun04 Heap@@34))
)))
(assert (forall ((Heap@@35 T@U) ) (!  (=> (= (type Heap@@35) (MapType0Type RefType)) (and (= (fun05 Heap@@35) (|fun05'| Heap@@35)) (dummyFunction (int_2_U |fun05#triggerStateless|))))
 :qid |stdinbpl.493:15|
 :skolemid |44|
 :pattern ( (fun05 Heap@@35))
)))
(assert (forall ((Heap@@36 T@U) ) (!  (=> (= (type Heap@@36) (MapType0Type RefType)) (and (= (fun06 Heap@@36) (|fun06'| Heap@@36)) (dummyFunction (int_2_U |fun06#triggerStateless|))))
 :qid |stdinbpl.564:15|
 :skolemid |48|
 :pattern ( (fun06 Heap@@36))
)))
(assert (forall ((Heap@@37 T@U) ) (!  (=> (= (type Heap@@37) (MapType0Type RefType)) (and (= (fun07 Heap@@37) (|fun07'| Heap@@37)) (dummyFunction (int_2_U |fun07#triggerStateless|))))
 :qid |stdinbpl.648:15|
 :skolemid |53|
 :pattern ( (fun07 Heap@@37))
)))
(assert (forall ((Heap@@38 T@U) ) (!  (=> (= (type Heap@@38) (MapType0Type RefType)) (and (= (fun08 Heap@@38) (|fun08'| Heap@@38)) (dummyFunction (int_2_U |fun08#triggerStateless|))))
 :qid |stdinbpl.711:15|
 :skolemid |56|
 :pattern ( (fun08 Heap@@38))
)))
(assert (forall ((Mask@@15 T@U) (o_2@@0 T@U) (f_4@@0 T@U) ) (! (let ((B@@3 (FieldTypeInv1 (type f_4@@0))))
(let ((A@@4 (FieldTypeInv0 (type f_4@@0))))
 (=> (and (and (= (type Mask@@15) (MapType1Type RefType realType)) (= (type o_2@@0) RefType)) (= (type f_4@@0) (FieldType A@@4 B@@3))) (= (HasDirectPerm Mask@@15 o_2@@0 f_4@@0) (> (U_2_real (MapType1Select Mask@@15 o_2@@0 f_4@@0)) NoPerm)))))
 :qid |stdinbpl.133:22|
 :skolemid |17|
 :pattern ( (HasDirectPerm Mask@@15 o_2@@0 f_4@@0))
)))
(assert (forall ((o_2@@1 T@U) (f_4@@1 T@U) ) (! (let ((B@@4 (FieldTypeInv1 (type f_4@@1))))
(let ((A@@5 (FieldTypeInv0 (type f_4@@1))))
 (=> (and (= (type o_2@@1) RefType) (= (type f_4@@1) (FieldType A@@5 B@@4))) (= (U_2_real (MapType1Select ZeroMask o_2@@1 f_4@@1)) NoPerm))))
 :qid |stdinbpl.106:22|
 :skolemid |13|
 :pattern ( (MapType1Select ZeroMask o_2@@1 f_4@@1))
)))
(assert (forall ((Heap@@39 T@U) (Mask@@16 T@U) (x@@24 Int) ) (!  (=> (and (and (and (= (type Heap@@39) (MapType0Type RefType)) (= (type Mask@@16) (MapType1Type RefType realType))) (and (state Heap@@39 Mask@@16) (< AssumeFunctionsAbove 0))) (not (= (div 1 x@@24) 2))) (= (fun14 Heap@@39 x@@24) 1))
 :qid |stdinbpl.970:15|
 :skolemid |72|
 :pattern ( (state Heap@@39 Mask@@16) (fun14 Heap@@39 x@@24))
)))
(assert (forall ((Heap@@40 T@U) (ExhaleHeap@@4 T@U) (Mask@@17 T@U) (pm_f@@1 T@U) ) (! (let ((C@@1 (FieldTypeInv0 (type pm_f@@1))))
 (=> (and (and (and (and (and (= (type Heap@@40) (MapType0Type RefType)) (= (type ExhaleHeap@@4) (MapType0Type RefType))) (= (type Mask@@17) (MapType1Type RefType realType))) (= (type pm_f@@1) (FieldType C@@1 FrameTypeType))) (IdenticalOnKnownLocations Heap@@40 ExhaleHeap@@4 Mask@@17)) (and (HasDirectPerm Mask@@17 null pm_f@@1) (IsPredicateField pm_f@@1))) (forall ((o2 T@U) (f_2@@0 T@U) ) (! (let ((B@@5 (FieldTypeInv1 (type f_2@@0))))
(let ((A@@6 (FieldTypeInv0 (type f_2@@0))))
 (=> (and (and (= (type o2) RefType) (= (type f_2@@0) (FieldType A@@6 B@@5))) (U_2_bool (MapType1Select (MapType0Select Heap@@40 null (PredicateMaskField pm_f@@1)) o2 f_2@@0))) (= (MapType0Select Heap@@40 o2 f_2@@0) (MapType0Select ExhaleHeap@@4 o2 f_2@@0)))))
 :qid |stdinbpl.54:134|
 :skolemid |3|
 :pattern ( (MapType0Select ExhaleHeap@@4 o2 f_2@@0))
))))
 :qid |stdinbpl.52:19|
 :skolemid |4|
 :pattern ( (IdenticalOnKnownLocations Heap@@40 ExhaleHeap@@4 Mask@@17) (IsPredicateField pm_f@@1))
)))
(assert (forall ((Heap@@41 T@U) (ExhaleHeap@@5 T@U) (Mask@@18 T@U) (pm_f@@2 T@U) ) (! (let ((C@@2 (FieldTypeInv0 (type pm_f@@2))))
 (=> (and (and (and (and (and (= (type Heap@@41) (MapType0Type RefType)) (= (type ExhaleHeap@@5) (MapType0Type RefType))) (= (type Mask@@18) (MapType1Type RefType realType))) (= (type pm_f@@2) (FieldType C@@2 FrameTypeType))) (IdenticalOnKnownLocations Heap@@41 ExhaleHeap@@5 Mask@@18)) (and (HasDirectPerm Mask@@18 null pm_f@@2) (IsWandField pm_f@@2))) (forall ((o2@@0 T@U) (f_2@@1 T@U) ) (! (let ((B@@6 (FieldTypeInv1 (type f_2@@1))))
(let ((A@@7 (FieldTypeInv0 (type f_2@@1))))
 (=> (and (and (= (type o2@@0) RefType) (= (type f_2@@1) (FieldType A@@7 B@@6))) (U_2_bool (MapType1Select (MapType0Select Heap@@41 null (WandMaskField pm_f@@2)) o2@@0 f_2@@1))) (= (MapType0Select Heap@@41 o2@@0 f_2@@1) (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1)))))
 :qid |stdinbpl.67:129|
 :skolemid |6|
 :pattern ( (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1))
))))
 :qid |stdinbpl.65:19|
 :skolemid |7|
 :pattern ( (IdenticalOnKnownLocations Heap@@41 ExhaleHeap@@5 Mask@@18) (IsWandField pm_f@@2))
)))
(assert (forall ((Mask@@19 T@U) (o_2@@2 T@U) (f_4@@2 T@U) ) (! (let ((B@@7 (FieldTypeInv1 (type f_4@@2))))
(let ((A@@8 (FieldTypeInv0 (type f_4@@2))))
 (=> (and (and (and (= (type Mask@@19) (MapType1Type RefType realType)) (= (type o_2@@2) RefType)) (= (type f_4@@2) (FieldType A@@8 B@@7))) (GoodMask Mask@@19)) (and (>= (U_2_real (MapType1Select Mask@@19 o_2@@2 f_4@@2)) NoPerm) (=> (and (and (GoodMask Mask@@19) (not (IsPredicateField f_4@@2))) (not (IsWandField f_4@@2))) (<= (U_2_real (MapType1Select Mask@@19 o_2@@2 f_4@@2)) FullPerm))))))
 :qid |stdinbpl.128:22|
 :skolemid |16|
 :pattern ( (GoodMask Mask@@19) (MapType1Select Mask@@19 o_2@@2 f_4@@2))
)))
(assert (forall ((Heap@@42 T@U) (Mask@@20 T@U) (x@@25 Int) ) (!  (=> (and (and (= (type Heap@@42) (MapType0Type RefType)) (= (type Mask@@20) (MapType1Type RefType realType))) (state Heap@@42 Mask@@20)) (= (|fun11'| Heap@@42 x@@25) (|fun11#frame| EmptyFrame x@@25)))
 :qid |stdinbpl.798:15|
 :skolemid |62|
 :pattern ( (state Heap@@42 Mask@@20) (|fun11'| Heap@@42 x@@25))
)))
(assert (forall ((Heap@@43 T@U) (Mask@@21 T@U) (x@@26 Int) ) (!  (=> (and (and (= (type Heap@@43) (MapType0Type RefType)) (= (type Mask@@21) (MapType1Type RefType realType))) (state Heap@@43 Mask@@21)) (= (|fun12'| Heap@@43 x@@26) (|fun12#frame| EmptyFrame x@@26)))
 :qid |stdinbpl.854:15|
 :skolemid |66|
 :pattern ( (state Heap@@43 Mask@@21) (|fun12'| Heap@@43 x@@26))
)))
(assert (forall ((Heap@@44 T@U) (Mask@@22 T@U) (x@@27 Int) ) (!  (=> (and (and (= (type Heap@@44) (MapType0Type RefType)) (= (type Mask@@22) (MapType1Type RefType realType))) (state Heap@@44 Mask@@22)) (= (|fun13'| Heap@@44 x@@27) (|fun13#frame| EmptyFrame x@@27)))
 :qid |stdinbpl.907:15|
 :skolemid |69|
 :pattern ( (state Heap@@44 Mask@@22) (|fun13'| Heap@@44 x@@27))
)))
(assert (forall ((Heap@@45 T@U) (Mask@@23 T@U) (x@@28 Int) ) (!  (=> (and (and (= (type Heap@@45) (MapType0Type RefType)) (= (type Mask@@23) (MapType1Type RefType realType))) (state Heap@@45 Mask@@23)) (= (|fun14'| Heap@@45 x@@28) (|fun14#frame| EmptyFrame x@@28)))
 :qid |stdinbpl.977:15|
 :skolemid |73|
 :pattern ( (state Heap@@45 Mask@@23) (|fun14'| Heap@@45 x@@28))
)))
(assert (forall ((Heap@@46 T@U) (Mask@@24 T@U) (x@@29 Int) ) (!  (=> (and (and (= (type Heap@@46) (MapType0Type RefType)) (= (type Mask@@24) (MapType1Type RefType realType))) (state Heap@@46 Mask@@24)) (= (|fun15'| Heap@@46 x@@29) (|fun15#frame| EmptyFrame x@@29)))
 :qid |stdinbpl.1044:15|
 :skolemid |76|
 :pattern ( (state Heap@@46 Mask@@24) (|fun15'| Heap@@46 x@@29))
)))
(assert (forall ((Heap@@47 T@U) (Mask@@25 T@U) (x@@30 Int) ) (!  (=> (and (and (= (type Heap@@47) (MapType0Type RefType)) (= (type Mask@@25) (MapType1Type RefType realType))) (state Heap@@47 Mask@@25)) (= (|fun16'| Heap@@47 x@@30) (|fun16#frame| EmptyFrame x@@30)))
 :qid |stdinbpl.1114:15|
 :skolemid |80|
 :pattern ( (state Heap@@47 Mask@@25) (|fun16'| Heap@@47 x@@30))
)))
(assert (forall ((Heap@@48 T@U) (Mask@@26 T@U) (x@@31 Int) ) (!  (=> (and (and (= (type Heap@@48) (MapType0Type RefType)) (= (type Mask@@26) (MapType1Type RefType realType))) (state Heap@@48 Mask@@26)) (= (|fun17'| Heap@@48 x@@31) (|fun17#frame| EmptyFrame x@@31)))
 :qid |stdinbpl.1181:15|
 :skolemid |83|
 :pattern ( (state Heap@@48 Mask@@26) (|fun17'| Heap@@48 x@@31))
)))
(assert (forall ((Heap@@49 T@U) (Mask@@27 T@U) (x@@32 Int) ) (!  (=> (and (and (= (type Heap@@49) (MapType0Type RefType)) (= (type Mask@@27) (MapType1Type RefType realType))) (state Heap@@49 Mask@@27)) (= (|fun18'| Heap@@49 x@@32) (|fun18#frame| EmptyFrame x@@32)))
 :qid |stdinbpl.1246:15|
 :skolemid |87|
 :pattern ( (state Heap@@49 Mask@@27) (|fun18'| Heap@@49 x@@32))
)))
(assert (forall ((Heap@@50 T@U) ) (!  (=> (= (type Heap@@50) (MapType0Type RefType)) (dummyFunction (int_2_U |fun01#triggerStateless|)))
 :qid |stdinbpl.204:15|
 :skolemid |23|
 :pattern ( (|fun01'| Heap@@50))
)))
(assert (forall ((Heap@@51 T@U) ) (!  (=> (= (type Heap@@51) (MapType0Type RefType)) (dummyFunction (int_2_U |fun02#triggerStateless|)))
 :qid |stdinbpl.264:15|
 :skolemid |28|
 :pattern ( (|fun02'| Heap@@51))
)))
(assert (forall ((Heap@@52 T@U) ) (!  (=> (= (type Heap@@52) (MapType0Type RefType)) (dummyFunction (int_2_U |fun03#triggerStateless|)))
 :qid |stdinbpl.337:15|
 :skolemid |34|
 :pattern ( (|fun03'| Heap@@52))
)))
(assert (forall ((Heap@@53 T@U) ) (!  (=> (= (type Heap@@53) (MapType0Type RefType)) (dummyFunction (int_2_U |fun04#triggerStateless|)))
 :qid |stdinbpl.411:15|
 :skolemid |39|
 :pattern ( (|fun04'| Heap@@53))
)))
(assert (forall ((Heap@@54 T@U) ) (!  (=> (= (type Heap@@54) (MapType0Type RefType)) (dummyFunction (int_2_U |fun05#triggerStateless|)))
 :qid |stdinbpl.497:15|
 :skolemid |45|
 :pattern ( (|fun05'| Heap@@54))
)))
(assert (forall ((Heap@@55 T@U) ) (!  (=> (= (type Heap@@55) (MapType0Type RefType)) (dummyFunction (int_2_U |fun06#triggerStateless|)))
 :qid |stdinbpl.568:15|
 :skolemid |49|
 :pattern ( (|fun06'| Heap@@55))
)))
(assert (forall ((Heap@@56 T@U) ) (!  (=> (= (type Heap@@56) (MapType0Type RefType)) (dummyFunction (int_2_U |fun07#triggerStateless|)))
 :qid |stdinbpl.652:15|
 :skolemid |54|
 :pattern ( (|fun07'| Heap@@56))
)))
(assert (forall ((Heap@@57 T@U) ) (!  (=> (= (type Heap@@57) (MapType0Type RefType)) (dummyFunction (int_2_U |fun08#triggerStateless|)))
 :qid |stdinbpl.715:15|
 :skolemid |57|
 :pattern ( (|fun08'| Heap@@57))
)))
(assert (forall ((o T@U) (f T@U) (Heap@@58 T@U) ) (!  (=> (and (and (and (= (type o) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap@@58) (MapType0Type RefType))) (U_2_bool (MapType0Select Heap@@58 o $allocated))) (U_2_bool (MapType0Select Heap@@58 (MapType0Select Heap@@58 o f) $allocated)))
 :qid |stdinbpl.31:15|
 :skolemid |0|
 :pattern ( (MapType0Select Heap@@58 o f))
)))
(assert (forall ((Heap@@59 T@U) (Mask@@28 T@U) ) (!  (=> (and (and (= (type Heap@@59) (MapType0Type RefType)) (= (type Mask@@28) (MapType1Type RefType realType))) (state Heap@@59 Mask@@28)) (= (|fun01'| Heap@@59) (|fun01#frame| EmptyFrame)))
 :qid |stdinbpl.211:15|
 :skolemid |24|
 :pattern ( (state Heap@@59 Mask@@28) (|fun01'| Heap@@59))
)))
(assert (forall ((Heap@@60 T@U) (Mask@@29 T@U) ) (!  (=> (and (and (= (type Heap@@60) (MapType0Type RefType)) (= (type Mask@@29) (MapType1Type RefType realType))) (state Heap@@60 Mask@@29)) (= (|fun02'| Heap@@60) (|fun02#frame| EmptyFrame)))
 :qid |stdinbpl.277:15|
 :skolemid |30|
 :pattern ( (state Heap@@60 Mask@@29) (|fun02'| Heap@@60))
)))
(assert (forall ((Heap@@61 T@U) (Mask@@30 T@U) ) (!  (=> (and (and (= (type Heap@@61) (MapType0Type RefType)) (= (type Mask@@30) (MapType1Type RefType realType))) (state Heap@@61 Mask@@30)) (= (|fun03'| Heap@@61) (|fun03#frame| EmptyFrame)))
 :qid |stdinbpl.344:15|
 :skolemid |35|
 :pattern ( (state Heap@@61 Mask@@30) (|fun03'| Heap@@61))
)))
(assert (forall ((Heap@@62 T@U) (Mask@@31 T@U) ) (!  (=> (and (and (= (type Heap@@62) (MapType0Type RefType)) (= (type Mask@@31) (MapType1Type RefType realType))) (state Heap@@62 Mask@@31)) (= (|fun04'| Heap@@62) (|fun04#frame| EmptyFrame)))
 :qid |stdinbpl.424:15|
 :skolemid |41|
 :pattern ( (state Heap@@62 Mask@@31) (|fun04'| Heap@@62))
)))
(assert (forall ((Heap@@63 T@U) (Mask@@32 T@U) ) (!  (=> (and (and (= (type Heap@@63) (MapType0Type RefType)) (= (type Mask@@32) (MapType1Type RefType realType))) (state Heap@@63 Mask@@32)) (= (|fun05'| Heap@@63) (|fun05#frame| EmptyFrame)))
 :qid |stdinbpl.504:15|
 :skolemid |46|
 :pattern ( (state Heap@@63 Mask@@32) (|fun05'| Heap@@63))
)))
(assert (forall ((Heap@@64 T@U) (Mask@@33 T@U) ) (!  (=> (and (and (= (type Heap@@64) (MapType0Type RefType)) (= (type Mask@@33) (MapType1Type RefType realType))) (state Heap@@64 Mask@@33)) (= (|fun06'| Heap@@64) (|fun06#frame| EmptyFrame)))
 :qid |stdinbpl.581:15|
 :skolemid |51|
 :pattern ( (state Heap@@64 Mask@@33) (|fun06'| Heap@@64))
)))
(assert (forall ((Heap@@65 T@U) (Mask@@34 T@U) ) (!  (=> (and (and (= (type Heap@@65) (MapType0Type RefType)) (= (type Mask@@34) (MapType1Type RefType realType))) (state Heap@@65 Mask@@34)) (= (|fun07'| Heap@@65) (|fun07#frame| EmptyFrame)))
 :qid |stdinbpl.659:15|
 :skolemid |55|
 :pattern ( (state Heap@@65 Mask@@34) (|fun07'| Heap@@65))
)))
(assert (forall ((Heap@@66 T@U) (Mask@@35 T@U) ) (!  (=> (and (and (= (type Heap@@66) (MapType0Type RefType)) (= (type Mask@@35) (MapType1Type RefType realType))) (state Heap@@66 Mask@@35)) (= (|fun08'| Heap@@66) (|fun08#frame| EmptyFrame)))
 :qid |stdinbpl.728:15|
 :skolemid |59|
 :pattern ( (state Heap@@66 Mask@@35) (|fun08'| Heap@@66))
)))
(assert (forall ((Heap@@67 T@U) (o@@0 T@U) (f_3 T@U) (v T@U) ) (! (let ((B@@8 (type v)))
(let ((A@@9 (FieldTypeInv0 (type f_3))))
 (=> (and (and (= (type Heap@@67) (MapType0Type RefType)) (= (type o@@0) RefType)) (= (type f_3) (FieldType A@@9 B@@8))) (succHeap Heap@@67 (MapType0Store Heap@@67 o@@0 f_3 v)))))
 :qid |stdinbpl.78:22|
 :skolemid |9|
 :pattern ( (MapType0Store Heap@@67 o@@0 f_3 v))
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
 :qid |stdinbpl.183:25|
 :skolemid |20|
 :pattern ( (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))
)))
(assert (forall ((Heap@@68 T@U) (Mask@@36 T@U) (x@@33 Int) ) (!  (=> (and (and (and (= (type Heap@@68) (MapType0Type RefType)) (= (type Mask@@36) (MapType1Type RefType realType))) (and (state Heap@@68 Mask@@36) (< AssumeFunctionsAbove 1))) (and (not (= x@@33 0)) (not (= (div 1 x@@33) 2)))) (= (fun16 Heap@@68 x@@33) 1))
 :qid |stdinbpl.1107:15|
 :skolemid |79|
 :pattern ( (state Heap@@68 Mask@@36) (fun16 Heap@@68 x@@33))
)))
(assert (forall ((Heap@@69 T@U) (Mask@@37 T@U) (x@@34 Int) ) (!  (=> (and (and (and (= (type Heap@@69) (MapType0Type RefType)) (= (type Mask@@37) (MapType1Type RefType realType))) (and (state Heap@@69 Mask@@37) (< AssumeFunctionsAbove 6))) (and (not (= x@@34 0)) (not (= (div 1 x@@34) 2)))) (= (fun18 Heap@@69 x@@34) 1))
 :qid |stdinbpl.1239:15|
 :skolemid |86|
 :pattern ( (state Heap@@69 Mask@@37) (fun18 Heap@@69 x@@34))
)))
(assert (forall ((Heap@@70 T@U) (Mask@@38 T@U) (x@@35 Int) ) (!  (=> (and (and (and (= (type Heap@@70) (MapType0Type RefType)) (= (type Mask@@38) (MapType1Type RefType realType))) (and (state Heap@@70 Mask@@38) (< AssumeFunctionsAbove 8))) (and (not (= x@@35 0)) (not (= (div 1 x@@35) 2)))) (= (fun12 Heap@@70 x@@35) 1))
 :qid |stdinbpl.847:15|
 :skolemid |65|
 :pattern ( (state Heap@@70 Mask@@38) (fun12 Heap@@70 x@@35))
)))
(assert (forall ((Heap@@71 T@U) (Mask@@39 T@U) ) (!  (=> (and (and (= (type Heap@@71) (MapType0Type RefType)) (= (type Mask@@39) (MapType1Type RefType realType))) (and (state Heap@@71 Mask@@39) (< AssumeFunctionsAbove 2))) (= (fun08 Heap@@71) 1))
 :qid |stdinbpl.721:15|
 :skolemid |58|
 :pattern ( (state Heap@@71 Mask@@39) (fun08 Heap@@71))
)))
(assert (forall ((Heap@@72 T@U) (Mask@@40 T@U) ) (!  (=> (and (and (= (type Heap@@72) (MapType0Type RefType)) (= (type Mask@@40) (MapType1Type RefType realType))) (and (state Heap@@72 Mask@@40) (< AssumeFunctionsAbove 3))) (= (fun02 Heap@@72) 1))
 :qid |stdinbpl.270:15|
 :skolemid |29|
 :pattern ( (state Heap@@72 Mask@@40) (fun02 Heap@@72))
)))
(assert (forall ((Heap@@73 T@U) (Mask@@41 T@U) ) (!  (=> (and (and (= (type Heap@@73) (MapType0Type RefType)) (= (type Mask@@41) (MapType1Type RefType realType))) (and (state Heap@@73 Mask@@41) (< AssumeFunctionsAbove 11))) (= (fun06 Heap@@73) 1))
 :qid |stdinbpl.574:15|
 :skolemid |50|
 :pattern ( (state Heap@@73 Mask@@41) (fun06 Heap@@73))
)))
(assert (forall ((Heap@@74 T@U) (Mask@@42 T@U) ) (!  (=> (and (and (= (type Heap@@74) (MapType0Type RefType)) (= (type Mask@@42) (MapType1Type RefType realType))) (and (state Heap@@74 Mask@@42) (< AssumeFunctionsAbove 15))) (= (fun04 Heap@@74) 1))
 :qid |stdinbpl.417:15|
 :skolemid |40|
 :pattern ( (state Heap@@74 Mask@@42) (fun04 Heap@@74))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun Heap@@75 () T@U)
(declare-fun Result () Int)
(assert (= (type Heap@@75) (MapType0Type RefType)))
(set-info :boogie-vc-id |fun03#definedness|)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 6) (let ((anon3_Else_correct  (=> (and (state Heap@@75 ZeroMask) (= (ControlFlow 0 4) (- 0 3))) (not (= Result 0)))))
(let ((anon3_Then_correct  (=> (not (= Result 0)) (=> (and (state Heap@@75 ZeroMask) (= (ControlFlow 0 2) (- 0 1))) (not (= Result 0))))))
(let ((anon0_correct  (=> (and (state Heap@@75 ZeroMask) (= AssumeFunctionsAbove 10)) (and (=> (= (ControlFlow 0 5) 2) anon3_Then_correct) (=> (= (ControlFlow 0 5) 4) anon3_Else_correct)))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 6) 5) anon0_correct)))
PreconditionGeneratedEntry_correct)))))
))
(check-sat)
(get-info :reason-unknown)
(assert (not (= (ControlFlow 0 4) (- 3))))
(check-sat)
(pop 1)
; Invalid
(get-info :rlimit)
(reset)
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
(declare-fun succHeap (T@U T@U) Bool)
(declare-fun MapType0Type (T@T) T@T)
(declare-fun RefType () T@T)
(declare-fun succHeapTrans (T@U T@U) Bool)
(declare-fun MapType0TypeInv0 (T@T) T@T)
(declare-fun FieldType (T@T T@T) T@T)
(declare-fun FieldTypeInv0 (T@T) T@T)
(declare-fun FieldTypeInv1 (T@T) T@T)
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
(declare-fun |fun11'| (T@U Int) Int)
(declare-fun dummyFunction (T@U) Bool)
(declare-fun |fun11#triggerStateless| (Int) Int)
(declare-fun |fun12'| (T@U Int) Int)
(declare-fun |fun12#triggerStateless| (Int) Int)
(declare-fun |fun13'| (T@U Int) Int)
(declare-fun |fun13#triggerStateless| (Int) Int)
(declare-fun |fun14'| (T@U Int) Int)
(declare-fun |fun14#triggerStateless| (Int) Int)
(declare-fun |fun15'| (T@U Int) Int)
(declare-fun |fun15#triggerStateless| (Int) Int)
(declare-fun |fun16'| (T@U Int) Int)
(declare-fun |fun16#triggerStateless| (Int) Int)
(declare-fun |fun17'| (T@U Int) Int)
(declare-fun |fun17#triggerStateless| (Int) Int)
(declare-fun |fun18'| (T@U Int) Int)
(declare-fun |fun18#triggerStateless| (Int) Int)
(declare-fun $allocated () T@U)
(declare-fun NormalFieldType () T@T)
(declare-fun fun11 (T@U Int) Int)
(declare-fun fun12 (T@U Int) Int)
(declare-fun fun13 (T@U Int) Int)
(declare-fun fun14 (T@U Int) Int)
(declare-fun fun15 (T@U Int) Int)
(declare-fun fun16 (T@U Int) Int)
(declare-fun fun17 (T@U Int) Int)
(declare-fun fun18 (T@U Int) Int)
(declare-fun |fun02'| (T@U) Int)
(declare-fun AssumeFunctionsAbove () Int)
(declare-fun |fun02#trigger| (T@U) Bool)
(declare-fun EmptyFrame () T@U)
(declare-fun |fun03'| (T@U) Int)
(declare-fun |fun03#trigger| (T@U) Bool)
(declare-fun |fun01'| (T@U) Int)
(declare-fun |fun01#trigger| (T@U) Bool)
(declare-fun |fun04'| (T@U) Int)
(declare-fun |fun04#trigger| (T@U) Bool)
(declare-fun dummyHeap () T@U)
(declare-fun ZeroMask () T@U)
(declare-fun InsidePredicate (T@U T@U T@U T@U) Bool)
(declare-fun |fun05'| (T@U) Int)
(declare-fun |fun05#trigger| (T@U) Bool)
(declare-fun |fun06'| (T@U) Int)
(declare-fun |fun06#trigger| (T@U) Bool)
(declare-fun sumMask (T@U T@U T@U) Bool)
(declare-fun ConditionalFrame (Real T@U) T@U)
(declare-fun fun01 (T@U) Int)
(declare-fun |fun01#triggerStateless| () Int)
(declare-fun fun02 (T@U) Int)
(declare-fun |fun02#triggerStateless| () Int)
(declare-fun fun03 (T@U) Int)
(declare-fun |fun03#triggerStateless| () Int)
(declare-fun fun04 (T@U) Int)
(declare-fun |fun04#triggerStateless| () Int)
(declare-fun fun05 (T@U) Int)
(declare-fun |fun05#triggerStateless| () Int)
(declare-fun fun06 (T@U) Int)
(declare-fun |fun06#triggerStateless| () Int)
(declare-fun fun07 (T@U) Int)
(declare-fun |fun07'| (T@U) Int)
(declare-fun |fun07#triggerStateless| () Int)
(declare-fun fun08 (T@U) Int)
(declare-fun |fun08'| (T@U) Int)
(declare-fun |fun08#triggerStateless| () Int)
(declare-fun NoPerm () Real)
(declare-fun FullPerm () Real)
(declare-fun |fun11#frame| (T@U Int) Int)
(declare-fun |fun12#frame| (T@U Int) Int)
(declare-fun |fun13#frame| (T@U Int) Int)
(declare-fun |fun14#frame| (T@U Int) Int)
(declare-fun |fun15#frame| (T@U Int) Int)
(declare-fun |fun16#frame| (T@U Int) Int)
(declare-fun |fun17#frame| (T@U Int) Int)
(declare-fun |fun18#frame| (T@U Int) Int)
(declare-fun |fun01#frame| (T@U) Int)
(declare-fun |fun02#frame| (T@U) Int)
(declare-fun |fun03#frame| (T@U) Int)
(declare-fun |fun04#frame| (T@U) Int)
(declare-fun |fun05#frame| (T@U) Int)
(declare-fun |fun06#frame| (T@U) Int)
(declare-fun |fun07#frame| (T@U) Int)
(declare-fun |fun08#frame| (T@U) Int)
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
(assert  (and (and (and (and (and (and (and (and (and (forall ((arg0@@11 T@T) ) (! (= (Ctor (MapType0Type arg0@@11)) 6)
 :qid |ctor:MapType0Type|
)) (forall ((arg0@@12 T@T) ) (! (= (MapType0TypeInv0 (MapType0Type arg0@@12)) arg0@@12)
 :qid |typeInv:MapType0TypeInv0|
 :pattern ( (MapType0Type arg0@@12))
))) (forall ((arg0@@13 T@T) (arg1 T@T) ) (! (= (Ctor (FieldType arg0@@13 arg1)) 7)
 :qid |ctor:FieldType|
))) (forall ((arg0@@14 T@T) (arg1@@0 T@T) ) (! (= (FieldTypeInv0 (FieldType arg0@@14 arg1@@0)) arg0@@14)
 :qid |typeInv:FieldTypeInv0|
 :pattern ( (FieldType arg0@@14 arg1@@0))
))) (forall ((arg0@@15 T@T) (arg1@@1 T@T) ) (! (= (FieldTypeInv1 (FieldType arg0@@15 arg1@@1)) arg1@@1)
 :qid |typeInv:FieldTypeInv1|
 :pattern ( (FieldType arg0@@15 arg1@@1))
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
)))) (= (Ctor RefType) 8)))
(assert (forall ((Heap0 T@U) (Heap1 T@U) ) (!  (=> (and (and (= (type Heap0) (MapType0Type RefType)) (= (type Heap1) (MapType0Type RefType))) (succHeap Heap0 Heap1)) (succHeapTrans Heap0 Heap1))
 :qid |stdinbpl.88:15|
 :skolemid |11|
 :pattern ( (succHeap Heap0 Heap1))
)))
(assert  (and (and (and (and (and (and (forall ((arg0@@18 T@T) (arg1@@4 T@T) ) (! (= (Ctor (MapType1Type arg0@@18 arg1@@4)) 9)
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
(assert  (and (and (= (Ctor FrameTypeType) 10) (= (type null) RefType)) (forall ((arg0@@23 T@U) ) (! (let ((A (FieldTypeInv0 (type arg0@@23))))
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
(assert (forall ((Heap@@2 T@U) (x@@8 Int) ) (!  (=> (= (type Heap@@2) (MapType0Type RefType)) (dummyFunction (int_2_U (|fun11#triggerStateless| x@@8))))
 :qid |stdinbpl.791:15|
 :skolemid |61|
 :pattern ( (|fun11'| Heap@@2 x@@8))
)))
(assert (forall ((Heap@@3 T@U) (x@@9 Int) ) (!  (=> (= (type Heap@@3) (MapType0Type RefType)) (dummyFunction (int_2_U (|fun12#triggerStateless| x@@9))))
 :qid |stdinbpl.841:15|
 :skolemid |64|
 :pattern ( (|fun12'| Heap@@3 x@@9))
)))
(assert (forall ((Heap@@4 T@U) (x@@10 Int) ) (!  (=> (= (type Heap@@4) (MapType0Type RefType)) (dummyFunction (int_2_U (|fun13#triggerStateless| x@@10))))
 :qid |stdinbpl.900:15|
 :skolemid |68|
 :pattern ( (|fun13'| Heap@@4 x@@10))
)))
(assert (forall ((Heap@@5 T@U) (x@@11 Int) ) (!  (=> (= (type Heap@@5) (MapType0Type RefType)) (dummyFunction (int_2_U (|fun14#triggerStateless| x@@11))))
 :qid |stdinbpl.964:15|
 :skolemid |71|
 :pattern ( (|fun14'| Heap@@5 x@@11))
)))
(assert (forall ((Heap@@6 T@U) (x@@12 Int) ) (!  (=> (= (type Heap@@6) (MapType0Type RefType)) (dummyFunction (int_2_U (|fun15#triggerStateless| x@@12))))
 :qid |stdinbpl.1037:15|
 :skolemid |75|
 :pattern ( (|fun15'| Heap@@6 x@@12))
)))
(assert (forall ((Heap@@7 T@U) (x@@13 Int) ) (!  (=> (= (type Heap@@7) (MapType0Type RefType)) (dummyFunction (int_2_U (|fun16#triggerStateless| x@@13))))
 :qid |stdinbpl.1101:15|
 :skolemid |78|
 :pattern ( (|fun16'| Heap@@7 x@@13))
)))
(assert (forall ((Heap@@8 T@U) (x@@14 Int) ) (!  (=> (= (type Heap@@8) (MapType0Type RefType)) (dummyFunction (int_2_U (|fun17#triggerStateless| x@@14))))
 :qid |stdinbpl.1174:15|
 :skolemid |82|
 :pattern ( (|fun17'| Heap@@8 x@@14))
)))
(assert (forall ((Heap@@9 T@U) (x@@15 Int) ) (!  (=> (= (type Heap@@9) (MapType0Type RefType)) (dummyFunction (int_2_U (|fun18#triggerStateless| x@@15))))
 :qid |stdinbpl.1233:15|
 :skolemid |85|
 :pattern ( (|fun18'| Heap@@9 x@@15))
)))
(assert  (and (= (Ctor NormalFieldType) 11) (= (type $allocated) (FieldType NormalFieldType boolType))))
(assert (forall ((Heap@@10 T@U) (ExhaleHeap@@1 T@U) (Mask@@2 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@10) (MapType0Type RefType)) (= (type ExhaleHeap@@1) (MapType0Type RefType))) (= (type Mask@@2) (MapType1Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@10 ExhaleHeap@@1 Mask@@2)) (U_2_bool (MapType0Select Heap@@10 o_1 $allocated))) (U_2_bool (MapType0Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.73:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@10 ExhaleHeap@@1 Mask@@2) (MapType0Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert (forall ((Heap@@11 T@U) (x@@16 Int) ) (!  (=> (= (type Heap@@11) (MapType0Type RefType)) (and (= (fun11 Heap@@11 x@@16) (|fun11'| Heap@@11 x@@16)) (dummyFunction (int_2_U (|fun11#triggerStateless| x@@16)))))
 :qid |stdinbpl.787:15|
 :skolemid |60|
 :pattern ( (fun11 Heap@@11 x@@16))
)))
(assert (forall ((Heap@@12 T@U) (x@@17 Int) ) (!  (=> (= (type Heap@@12) (MapType0Type RefType)) (and (= (fun12 Heap@@12 x@@17) (|fun12'| Heap@@12 x@@17)) (dummyFunction (int_2_U (|fun12#triggerStateless| x@@17)))))
 :qid |stdinbpl.837:15|
 :skolemid |63|
 :pattern ( (fun12 Heap@@12 x@@17))
)))
(assert (forall ((Heap@@13 T@U) (x@@18 Int) ) (!  (=> (= (type Heap@@13) (MapType0Type RefType)) (and (= (fun13 Heap@@13 x@@18) (|fun13'| Heap@@13 x@@18)) (dummyFunction (int_2_U (|fun13#triggerStateless| x@@18)))))
 :qid |stdinbpl.896:15|
 :skolemid |67|
 :pattern ( (fun13 Heap@@13 x@@18))
)))
(assert (forall ((Heap@@14 T@U) (x@@19 Int) ) (!  (=> (= (type Heap@@14) (MapType0Type RefType)) (and (= (fun14 Heap@@14 x@@19) (|fun14'| Heap@@14 x@@19)) (dummyFunction (int_2_U (|fun14#triggerStateless| x@@19)))))
 :qid |stdinbpl.960:15|
 :skolemid |70|
 :pattern ( (fun14 Heap@@14 x@@19))
)))
(assert (forall ((Heap@@15 T@U) (x@@20 Int) ) (!  (=> (= (type Heap@@15) (MapType0Type RefType)) (and (= (fun15 Heap@@15 x@@20) (|fun15'| Heap@@15 x@@20)) (dummyFunction (int_2_U (|fun15#triggerStateless| x@@20)))))
 :qid |stdinbpl.1033:15|
 :skolemid |74|
 :pattern ( (fun15 Heap@@15 x@@20))
)))
(assert (forall ((Heap@@16 T@U) (x@@21 Int) ) (!  (=> (= (type Heap@@16) (MapType0Type RefType)) (and (= (fun16 Heap@@16 x@@21) (|fun16'| Heap@@16 x@@21)) (dummyFunction (int_2_U (|fun16#triggerStateless| x@@21)))))
 :qid |stdinbpl.1097:15|
 :skolemid |77|
 :pattern ( (fun16 Heap@@16 x@@21))
)))
(assert (forall ((Heap@@17 T@U) (x@@22 Int) ) (!  (=> (= (type Heap@@17) (MapType0Type RefType)) (and (= (fun17 Heap@@17 x@@22) (|fun17'| Heap@@17 x@@22)) (dummyFunction (int_2_U (|fun17#triggerStateless| x@@22)))))
 :qid |stdinbpl.1170:15|
 :skolemid |81|
 :pattern ( (fun17 Heap@@17 x@@22))
)))
(assert (forall ((Heap@@18 T@U) (x@@23 Int) ) (!  (=> (= (type Heap@@18) (MapType0Type RefType)) (and (= (fun18 Heap@@18 x@@23) (|fun18'| Heap@@18 x@@23)) (dummyFunction (int_2_U (|fun18#triggerStateless| x@@23)))))
 :qid |stdinbpl.1229:15|
 :skolemid |84|
 :pattern ( (fun18 Heap@@18 x@@23))
)))
(assert (= (type EmptyFrame) FrameTypeType))
(assert (forall ((Heap@@19 T@U) (Mask@@3 T@U) ) (!  (=> (and (and (= (type Heap@@19) (MapType0Type RefType)) (= (type Mask@@3) (MapType1Type RefType realType))) (and (state Heap@@19 Mask@@3) (or (< AssumeFunctionsAbove 3) (|fun02#trigger| EmptyFrame)))) (not (= (|fun02'| Heap@@19) 0)))
 :qid |stdinbpl.283:15|
 :skolemid |31|
 :pattern ( (state Heap@@19 Mask@@3) (|fun02'| Heap@@19))
)))
(assert (forall ((Heap@@20 T@U) (Mask@@4 T@U) ) (!  (=> (and (and (= (type Heap@@20) (MapType0Type RefType)) (= (type Mask@@4) (MapType1Type RefType realType))) (and (state Heap@@20 Mask@@4) (or (< AssumeFunctionsAbove 10) (|fun03#trigger| EmptyFrame)))) (not (= (|fun03'| Heap@@20) 0)))
 :qid |stdinbpl.350:15|
 :skolemid |36|
 :pattern ( (state Heap@@20 Mask@@4) (|fun03'| Heap@@20))
)))
(assert (forall ((Heap@@21 T@U) (Mask@@5 T@U) ) (!  (=> (and (and (= (type Heap@@21) (MapType0Type RefType)) (= (type Mask@@5) (MapType1Type RefType realType))) (and (state Heap@@21 Mask@@5) (or (< AssumeFunctionsAbove 14) (|fun01#trigger| EmptyFrame)))) (not (= (|fun01'| Heap@@21) 0)))
 :qid |stdinbpl.217:15|
 :skolemid |25|
 :pattern ( (state Heap@@21 Mask@@5) (|fun01'| Heap@@21))
)))
(assert (forall ((Heap@@22 T@U) (Mask@@6 T@U) ) (!  (=> (and (and (= (type Heap@@22) (MapType0Type RefType)) (= (type Mask@@6) (MapType1Type RefType realType))) (and (state Heap@@22 Mask@@6) (or (< AssumeFunctionsAbove 15) (|fun04#trigger| EmptyFrame)))) (not (= (|fun04'| Heap@@22) 0)))
 :qid |stdinbpl.430:15|
 :skolemid |42|
 :pattern ( (state Heap@@22 Mask@@6) (|fun04'| Heap@@22))
)))
(assert (forall ((Heap@@23 T@U) (ExhaleHeap@@2 T@U) (Mask@@7 T@U) (o_1@@0 T@U) (f_2 T@U) ) (! (let ((B@@1 (FieldTypeInv1 (type f_2))))
(let ((A@@1 (FieldTypeInv0 (type f_2))))
 (=> (and (and (and (and (and (and (= (type Heap@@23) (MapType0Type RefType)) (= (type ExhaleHeap@@2) (MapType0Type RefType))) (= (type Mask@@7) (MapType1Type RefType realType))) (= (type o_1@@0) RefType)) (= (type f_2) (FieldType A@@1 B@@1))) (IdenticalOnKnownLocations Heap@@23 ExhaleHeap@@2 Mask@@7)) (HasDirectPerm Mask@@7 o_1@@0 f_2)) (= (MapType0Select Heap@@23 o_1@@0 f_2) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2)))))
 :qid |stdinbpl.42:22|
 :skolemid |1|
 :pattern ( (IdenticalOnKnownLocations Heap@@23 ExhaleHeap@@2 Mask@@7) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2))
)))
(assert  (and (= (type dummyHeap) (MapType0Type RefType)) (= (type ZeroMask) (MapType1Type RefType realType))))
(assert (state dummyHeap ZeroMask))
(assert (forall ((p T@U) (v_1 T@U) (w T@U) ) (! (let ((A@@2 (FieldTypeInv0 (type p))))
 (=> (and (and (= (type p) (FieldType A@@2 FrameTypeType)) (= (type v_1) FrameTypeType)) (= (type w) FrameTypeType)) (not (InsidePredicate p v_1 p w))))
 :qid |stdinbpl.188:19|
 :skolemid |21|
 :pattern ( (InsidePredicate p v_1 p w))
)))
(assert (forall ((Heap@@24 T@U) (ExhaleHeap@@3 T@U) (Mask@@8 T@U) ) (!  (=> (and (and (and (= (type Heap@@24) (MapType0Type RefType)) (= (type ExhaleHeap@@3) (MapType0Type RefType))) (= (type Mask@@8) (MapType1Type RefType realType))) (IdenticalOnKnownLocations Heap@@24 ExhaleHeap@@3 Mask@@8)) (succHeap Heap@@24 ExhaleHeap@@3))
 :qid |stdinbpl.83:15|
 :skolemid |10|
 :pattern ( (IdenticalOnKnownLocations Heap@@24 ExhaleHeap@@3 Mask@@8))
)))
(assert (forall ((Heap@@25 T@U) (Mask@@9 T@U) ) (!  (=> (and (and (= (type Heap@@25) (MapType0Type RefType)) (= (type Mask@@9) (MapType1Type RefType realType))) (and (state Heap@@25 Mask@@9) (or (< AssumeFunctionsAbove 3) (|fun02#trigger| EmptyFrame)))) (not (= (div 1 (|fun02'| Heap@@25)) 2)))
 :qid |stdinbpl.287:15|
 :skolemid |32|
 :pattern ( (state Heap@@25 Mask@@9) (|fun02'| Heap@@25))
)))
(assert (forall ((Heap@@26 T@U) (Mask@@10 T@U) ) (!  (=> (and (and (= (type Heap@@26) (MapType0Type RefType)) (= (type Mask@@10) (MapType1Type RefType realType))) (and (state Heap@@26 Mask@@10) (or (< AssumeFunctionsAbove 4) (|fun05#trigger| EmptyFrame)))) (not (= (div 1 (|fun05'| Heap@@26)) 2)))
 :qid |stdinbpl.511:15|
 :skolemid |47|
 :pattern ( (state Heap@@26 Mask@@10) (|fun05'| Heap@@26))
)))
(assert (forall ((Heap@@27 T@U) (Mask@@11 T@U) ) (!  (=> (and (and (= (type Heap@@27) (MapType0Type RefType)) (= (type Mask@@11) (MapType1Type RefType realType))) (and (state Heap@@27 Mask@@11) (or (< AssumeFunctionsAbove 10) (|fun03#trigger| EmptyFrame)))) (not (= (div 1 (|fun03'| Heap@@27)) 2)))
 :qid |stdinbpl.354:15|
 :skolemid |37|
 :pattern ( (state Heap@@27 Mask@@11) (|fun03'| Heap@@27))
)))
(assert (forall ((Heap@@28 T@U) (Mask@@12 T@U) ) (!  (=> (and (and (= (type Heap@@28) (MapType0Type RefType)) (= (type Mask@@12) (MapType1Type RefType realType))) (and (state Heap@@28 Mask@@12) (or (< AssumeFunctionsAbove 11) (|fun06#trigger| EmptyFrame)))) (not (= (div 1 (|fun06'| Heap@@28)) 2)))
 :qid |stdinbpl.588:15|
 :skolemid |52|
 :pattern ( (state Heap@@28 Mask@@12) (|fun06'| Heap@@28))
)))
(assert (forall ((Heap@@29 T@U) (Mask@@13 T@U) ) (!  (=> (and (and (= (type Heap@@29) (MapType0Type RefType)) (= (type Mask@@13) (MapType1Type RefType realType))) (and (state Heap@@29 Mask@@13) (or (< AssumeFunctionsAbove 14) (|fun01#trigger| EmptyFrame)))) (not (= (div 1 (|fun01'| Heap@@29)) 2)))
 :qid |stdinbpl.221:15|
 :skolemid |26|
 :pattern ( (state Heap@@29 Mask@@13) (|fun01'| Heap@@29))
)))
(assert (forall ((Heap@@30 T@U) (Mask@@14 T@U) ) (!  (=> (and (and (= (type Heap@@30) (MapType0Type RefType)) (= (type Mask@@14) (MapType1Type RefType realType))) (and (state Heap@@30 Mask@@14) (or (< AssumeFunctionsAbove 15) (|fun04#trigger| EmptyFrame)))) (not (= (div 1 (|fun04'| Heap@@30)) 2)))
 :qid |stdinbpl.434:15|
 :skolemid |43|
 :pattern ( (state Heap@@30 Mask@@14) (|fun04'| Heap@@30))
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
 :qid |stdinbpl.176:15|
 :skolemid |19|
 :pattern ( (ConditionalFrame p@@0 f_6))
)))
(assert (forall ((Heap@@31 T@U) ) (!  (=> (= (type Heap@@31) (MapType0Type RefType)) (and (= (fun01 Heap@@31) (|fun01'| Heap@@31)) (dummyFunction (int_2_U |fun01#triggerStateless|))))
 :qid |stdinbpl.200:15|
 :skolemid |22|
 :pattern ( (fun01 Heap@@31))
)))
(assert (forall ((Heap@@32 T@U) ) (!  (=> (= (type Heap@@32) (MapType0Type RefType)) (and (= (fun02 Heap@@32) (|fun02'| Heap@@32)) (dummyFunction (int_2_U |fun02#triggerStateless|))))
 :qid |stdinbpl.260:15|
 :skolemid |27|
 :pattern ( (fun02 Heap@@32))
)))
(assert (forall ((Heap@@33 T@U) ) (!  (=> (= (type Heap@@33) (MapType0Type RefType)) (and (= (fun03 Heap@@33) (|fun03'| Heap@@33)) (dummyFunction (int_2_U |fun03#triggerStateless|))))
 :qid |stdinbpl.333:15|
 :skolemid |33|
 :pattern ( (fun03 Heap@@33))
)))
(assert (forall ((Heap@@34 T@U) ) (!  (=> (= (type Heap@@34) (MapType0Type RefType)) (and (= (fun04 Heap@@34) (|fun04'| Heap@@34)) (dummyFunction (int_2_U |fun04#triggerStateless|))))
 :qid |stdinbpl.407:15|
 :skolemid |38|
 :pattern ( (fun04 Heap@@34))
)))
(assert (forall ((Heap@@35 T@U) ) (!  (=> (= (type Heap@@35) (MapType0Type RefType)) (and (= (fun05 Heap@@35) (|fun05'| Heap@@35)) (dummyFunction (int_2_U |fun05#triggerStateless|))))
 :qid |stdinbpl.493:15|
 :skolemid |44|
 :pattern ( (fun05 Heap@@35))
)))
(assert (forall ((Heap@@36 T@U) ) (!  (=> (= (type Heap@@36) (MapType0Type RefType)) (and (= (fun06 Heap@@36) (|fun06'| Heap@@36)) (dummyFunction (int_2_U |fun06#triggerStateless|))))
 :qid |stdinbpl.564:15|
 :skolemid |48|
 :pattern ( (fun06 Heap@@36))
)))
(assert (forall ((Heap@@37 T@U) ) (!  (=> (= (type Heap@@37) (MapType0Type RefType)) (and (= (fun07 Heap@@37) (|fun07'| Heap@@37)) (dummyFunction (int_2_U |fun07#triggerStateless|))))
 :qid |stdinbpl.648:15|
 :skolemid |53|
 :pattern ( (fun07 Heap@@37))
)))
(assert (forall ((Heap@@38 T@U) ) (!  (=> (= (type Heap@@38) (MapType0Type RefType)) (and (= (fun08 Heap@@38) (|fun08'| Heap@@38)) (dummyFunction (int_2_U |fun08#triggerStateless|))))
 :qid |stdinbpl.711:15|
 :skolemid |56|
 :pattern ( (fun08 Heap@@38))
)))
(assert (forall ((Mask@@15 T@U) (o_2@@0 T@U) (f_4@@0 T@U) ) (! (let ((B@@3 (FieldTypeInv1 (type f_4@@0))))
(let ((A@@4 (FieldTypeInv0 (type f_4@@0))))
 (=> (and (and (= (type Mask@@15) (MapType1Type RefType realType)) (= (type o_2@@0) RefType)) (= (type f_4@@0) (FieldType A@@4 B@@3))) (= (HasDirectPerm Mask@@15 o_2@@0 f_4@@0) (> (U_2_real (MapType1Select Mask@@15 o_2@@0 f_4@@0)) NoPerm)))))
 :qid |stdinbpl.133:22|
 :skolemid |17|
 :pattern ( (HasDirectPerm Mask@@15 o_2@@0 f_4@@0))
)))
(assert (forall ((o_2@@1 T@U) (f_4@@1 T@U) ) (! (let ((B@@4 (FieldTypeInv1 (type f_4@@1))))
(let ((A@@5 (FieldTypeInv0 (type f_4@@1))))
 (=> (and (= (type o_2@@1) RefType) (= (type f_4@@1) (FieldType A@@5 B@@4))) (= (U_2_real (MapType1Select ZeroMask o_2@@1 f_4@@1)) NoPerm))))
 :qid |stdinbpl.106:22|
 :skolemid |13|
 :pattern ( (MapType1Select ZeroMask o_2@@1 f_4@@1))
)))
(assert (forall ((Heap@@39 T@U) (Mask@@16 T@U) (x@@24 Int) ) (!  (=> (and (and (and (= (type Heap@@39) (MapType0Type RefType)) (= (type Mask@@16) (MapType1Type RefType realType))) (and (state Heap@@39 Mask@@16) (< AssumeFunctionsAbove 0))) (not (= (div 1 x@@24) 2))) (= (fun14 Heap@@39 x@@24) 1))
 :qid |stdinbpl.970:15|
 :skolemid |72|
 :pattern ( (state Heap@@39 Mask@@16) (fun14 Heap@@39 x@@24))
)))
(assert (forall ((Heap@@40 T@U) (ExhaleHeap@@4 T@U) (Mask@@17 T@U) (pm_f@@1 T@U) ) (! (let ((C@@1 (FieldTypeInv0 (type pm_f@@1))))
 (=> (and (and (and (and (and (= (type Heap@@40) (MapType0Type RefType)) (= (type ExhaleHeap@@4) (MapType0Type RefType))) (= (type Mask@@17) (MapType1Type RefType realType))) (= (type pm_f@@1) (FieldType C@@1 FrameTypeType))) (IdenticalOnKnownLocations Heap@@40 ExhaleHeap@@4 Mask@@17)) (and (HasDirectPerm Mask@@17 null pm_f@@1) (IsPredicateField pm_f@@1))) (forall ((o2 T@U) (f_2@@0 T@U) ) (! (let ((B@@5 (FieldTypeInv1 (type f_2@@0))))
(let ((A@@6 (FieldTypeInv0 (type f_2@@0))))
 (=> (and (and (= (type o2) RefType) (= (type f_2@@0) (FieldType A@@6 B@@5))) (U_2_bool (MapType1Select (MapType0Select Heap@@40 null (PredicateMaskField pm_f@@1)) o2 f_2@@0))) (= (MapType0Select Heap@@40 o2 f_2@@0) (MapType0Select ExhaleHeap@@4 o2 f_2@@0)))))
 :qid |stdinbpl.54:134|
 :skolemid |3|
 :pattern ( (MapType0Select ExhaleHeap@@4 o2 f_2@@0))
))))
 :qid |stdinbpl.52:19|
 :skolemid |4|
 :pattern ( (IdenticalOnKnownLocations Heap@@40 ExhaleHeap@@4 Mask@@17) (IsPredicateField pm_f@@1))
)))
(assert (forall ((Heap@@41 T@U) (ExhaleHeap@@5 T@U) (Mask@@18 T@U) (pm_f@@2 T@U) ) (! (let ((C@@2 (FieldTypeInv0 (type pm_f@@2))))
 (=> (and (and (and (and (and (= (type Heap@@41) (MapType0Type RefType)) (= (type ExhaleHeap@@5) (MapType0Type RefType))) (= (type Mask@@18) (MapType1Type RefType realType))) (= (type pm_f@@2) (FieldType C@@2 FrameTypeType))) (IdenticalOnKnownLocations Heap@@41 ExhaleHeap@@5 Mask@@18)) (and (HasDirectPerm Mask@@18 null pm_f@@2) (IsWandField pm_f@@2))) (forall ((o2@@0 T@U) (f_2@@1 T@U) ) (! (let ((B@@6 (FieldTypeInv1 (type f_2@@1))))
(let ((A@@7 (FieldTypeInv0 (type f_2@@1))))
 (=> (and (and (= (type o2@@0) RefType) (= (type f_2@@1) (FieldType A@@7 B@@6))) (U_2_bool (MapType1Select (MapType0Select Heap@@41 null (WandMaskField pm_f@@2)) o2@@0 f_2@@1))) (= (MapType0Select Heap@@41 o2@@0 f_2@@1) (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1)))))
 :qid |stdinbpl.67:129|
 :skolemid |6|
 :pattern ( (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1))
))))
 :qid |stdinbpl.65:19|
 :skolemid |7|
 :pattern ( (IdenticalOnKnownLocations Heap@@41 ExhaleHeap@@5 Mask@@18) (IsWandField pm_f@@2))
)))
(assert (forall ((Mask@@19 T@U) (o_2@@2 T@U) (f_4@@2 T@U) ) (! (let ((B@@7 (FieldTypeInv1 (type f_4@@2))))
(let ((A@@8 (FieldTypeInv0 (type f_4@@2))))
 (=> (and (and (and (= (type Mask@@19) (MapType1Type RefType realType)) (= (type o_2@@2) RefType)) (= (type f_4@@2) (FieldType A@@8 B@@7))) (GoodMask Mask@@19)) (and (>= (U_2_real (MapType1Select Mask@@19 o_2@@2 f_4@@2)) NoPerm) (=> (and (and (GoodMask Mask@@19) (not (IsPredicateField f_4@@2))) (not (IsWandField f_4@@2))) (<= (U_2_real (MapType1Select Mask@@19 o_2@@2 f_4@@2)) FullPerm))))))
 :qid |stdinbpl.128:22|
 :skolemid |16|
 :pattern ( (GoodMask Mask@@19) (MapType1Select Mask@@19 o_2@@2 f_4@@2))
)))
(assert (forall ((Heap@@42 T@U) (Mask@@20 T@U) (x@@25 Int) ) (!  (=> (and (and (= (type Heap@@42) (MapType0Type RefType)) (= (type Mask@@20) (MapType1Type RefType realType))) (state Heap@@42 Mask@@20)) (= (|fun11'| Heap@@42 x@@25) (|fun11#frame| EmptyFrame x@@25)))
 :qid |stdinbpl.798:15|
 :skolemid |62|
 :pattern ( (state Heap@@42 Mask@@20) (|fun11'| Heap@@42 x@@25))
)))
(assert (forall ((Heap@@43 T@U) (Mask@@21 T@U) (x@@26 Int) ) (!  (=> (and (and (= (type Heap@@43) (MapType0Type RefType)) (= (type Mask@@21) (MapType1Type RefType realType))) (state Heap@@43 Mask@@21)) (= (|fun12'| Heap@@43 x@@26) (|fun12#frame| EmptyFrame x@@26)))
 :qid |stdinbpl.854:15|
 :skolemid |66|
 :pattern ( (state Heap@@43 Mask@@21) (|fun12'| Heap@@43 x@@26))
)))
(assert (forall ((Heap@@44 T@U) (Mask@@22 T@U) (x@@27 Int) ) (!  (=> (and (and (= (type Heap@@44) (MapType0Type RefType)) (= (type Mask@@22) (MapType1Type RefType realType))) (state Heap@@44 Mask@@22)) (= (|fun13'| Heap@@44 x@@27) (|fun13#frame| EmptyFrame x@@27)))
 :qid |stdinbpl.907:15|
 :skolemid |69|
 :pattern ( (state Heap@@44 Mask@@22) (|fun13'| Heap@@44 x@@27))
)))
(assert (forall ((Heap@@45 T@U) (Mask@@23 T@U) (x@@28 Int) ) (!  (=> (and (and (= (type Heap@@45) (MapType0Type RefType)) (= (type Mask@@23) (MapType1Type RefType realType))) (state Heap@@45 Mask@@23)) (= (|fun14'| Heap@@45 x@@28) (|fun14#frame| EmptyFrame x@@28)))
 :qid |stdinbpl.977:15|
 :skolemid |73|
 :pattern ( (state Heap@@45 Mask@@23) (|fun14'| Heap@@45 x@@28))
)))
(assert (forall ((Heap@@46 T@U) (Mask@@24 T@U) (x@@29 Int) ) (!  (=> (and (and (= (type Heap@@46) (MapType0Type RefType)) (= (type Mask@@24) (MapType1Type RefType realType))) (state Heap@@46 Mask@@24)) (= (|fun15'| Heap@@46 x@@29) (|fun15#frame| EmptyFrame x@@29)))
 :qid |stdinbpl.1044:15|
 :skolemid |76|
 :pattern ( (state Heap@@46 Mask@@24) (|fun15'| Heap@@46 x@@29))
)))
(assert (forall ((Heap@@47 T@U) (Mask@@25 T@U) (x@@30 Int) ) (!  (=> (and (and (= (type Heap@@47) (MapType0Type RefType)) (= (type Mask@@25) (MapType1Type RefType realType))) (state Heap@@47 Mask@@25)) (= (|fun16'| Heap@@47 x@@30) (|fun16#frame| EmptyFrame x@@30)))
 :qid |stdinbpl.1114:15|
 :skolemid |80|
 :pattern ( (state Heap@@47 Mask@@25) (|fun16'| Heap@@47 x@@30))
)))
(assert (forall ((Heap@@48 T@U) (Mask@@26 T@U) (x@@31 Int) ) (!  (=> (and (and (= (type Heap@@48) (MapType0Type RefType)) (= (type Mask@@26) (MapType1Type RefType realType))) (state Heap@@48 Mask@@26)) (= (|fun17'| Heap@@48 x@@31) (|fun17#frame| EmptyFrame x@@31)))
 :qid |stdinbpl.1181:15|
 :skolemid |83|
 :pattern ( (state Heap@@48 Mask@@26) (|fun17'| Heap@@48 x@@31))
)))
(assert (forall ((Heap@@49 T@U) (Mask@@27 T@U) (x@@32 Int) ) (!  (=> (and (and (= (type Heap@@49) (MapType0Type RefType)) (= (type Mask@@27) (MapType1Type RefType realType))) (state Heap@@49 Mask@@27)) (= (|fun18'| Heap@@49 x@@32) (|fun18#frame| EmptyFrame x@@32)))
 :qid |stdinbpl.1246:15|
 :skolemid |87|
 :pattern ( (state Heap@@49 Mask@@27) (|fun18'| Heap@@49 x@@32))
)))
(assert (forall ((Heap@@50 T@U) ) (!  (=> (= (type Heap@@50) (MapType0Type RefType)) (dummyFunction (int_2_U |fun01#triggerStateless|)))
 :qid |stdinbpl.204:15|
 :skolemid |23|
 :pattern ( (|fun01'| Heap@@50))
)))
(assert (forall ((Heap@@51 T@U) ) (!  (=> (= (type Heap@@51) (MapType0Type RefType)) (dummyFunction (int_2_U |fun02#triggerStateless|)))
 :qid |stdinbpl.264:15|
 :skolemid |28|
 :pattern ( (|fun02'| Heap@@51))
)))
(assert (forall ((Heap@@52 T@U) ) (!  (=> (= (type Heap@@52) (MapType0Type RefType)) (dummyFunction (int_2_U |fun03#triggerStateless|)))
 :qid |stdinbpl.337:15|
 :skolemid |34|
 :pattern ( (|fun03'| Heap@@52))
)))
(assert (forall ((Heap@@53 T@U) ) (!  (=> (= (type Heap@@53) (MapType0Type RefType)) (dummyFunction (int_2_U |fun04#triggerStateless|)))
 :qid |stdinbpl.411:15|
 :skolemid |39|
 :pattern ( (|fun04'| Heap@@53))
)))
(assert (forall ((Heap@@54 T@U) ) (!  (=> (= (type Heap@@54) (MapType0Type RefType)) (dummyFunction (int_2_U |fun05#triggerStateless|)))
 :qid |stdinbpl.497:15|
 :skolemid |45|
 :pattern ( (|fun05'| Heap@@54))
)))
(assert (forall ((Heap@@55 T@U) ) (!  (=> (= (type Heap@@55) (MapType0Type RefType)) (dummyFunction (int_2_U |fun06#triggerStateless|)))
 :qid |stdinbpl.568:15|
 :skolemid |49|
 :pattern ( (|fun06'| Heap@@55))
)))
(assert (forall ((Heap@@56 T@U) ) (!  (=> (= (type Heap@@56) (MapType0Type RefType)) (dummyFunction (int_2_U |fun07#triggerStateless|)))
 :qid |stdinbpl.652:15|
 :skolemid |54|
 :pattern ( (|fun07'| Heap@@56))
)))
(assert (forall ((Heap@@57 T@U) ) (!  (=> (= (type Heap@@57) (MapType0Type RefType)) (dummyFunction (int_2_U |fun08#triggerStateless|)))
 :qid |stdinbpl.715:15|
 :skolemid |57|
 :pattern ( (|fun08'| Heap@@57))
)))
(assert (forall ((o T@U) (f T@U) (Heap@@58 T@U) ) (!  (=> (and (and (and (= (type o) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap@@58) (MapType0Type RefType))) (U_2_bool (MapType0Select Heap@@58 o $allocated))) (U_2_bool (MapType0Select Heap@@58 (MapType0Select Heap@@58 o f) $allocated)))
 :qid |stdinbpl.31:15|
 :skolemid |0|
 :pattern ( (MapType0Select Heap@@58 o f))
)))
(assert (forall ((Heap@@59 T@U) (Mask@@28 T@U) ) (!  (=> (and (and (= (type Heap@@59) (MapType0Type RefType)) (= (type Mask@@28) (MapType1Type RefType realType))) (state Heap@@59 Mask@@28)) (= (|fun01'| Heap@@59) (|fun01#frame| EmptyFrame)))
 :qid |stdinbpl.211:15|
 :skolemid |24|
 :pattern ( (state Heap@@59 Mask@@28) (|fun01'| Heap@@59))
)))
(assert (forall ((Heap@@60 T@U) (Mask@@29 T@U) ) (!  (=> (and (and (= (type Heap@@60) (MapType0Type RefType)) (= (type Mask@@29) (MapType1Type RefType realType))) (state Heap@@60 Mask@@29)) (= (|fun02'| Heap@@60) (|fun02#frame| EmptyFrame)))
 :qid |stdinbpl.277:15|
 :skolemid |30|
 :pattern ( (state Heap@@60 Mask@@29) (|fun02'| Heap@@60))
)))
(assert (forall ((Heap@@61 T@U) (Mask@@30 T@U) ) (!  (=> (and (and (= (type Heap@@61) (MapType0Type RefType)) (= (type Mask@@30) (MapType1Type RefType realType))) (state Heap@@61 Mask@@30)) (= (|fun03'| Heap@@61) (|fun03#frame| EmptyFrame)))
 :qid |stdinbpl.344:15|
 :skolemid |35|
 :pattern ( (state Heap@@61 Mask@@30) (|fun03'| Heap@@61))
)))
(assert (forall ((Heap@@62 T@U) (Mask@@31 T@U) ) (!  (=> (and (and (= (type Heap@@62) (MapType0Type RefType)) (= (type Mask@@31) (MapType1Type RefType realType))) (state Heap@@62 Mask@@31)) (= (|fun04'| Heap@@62) (|fun04#frame| EmptyFrame)))
 :qid |stdinbpl.424:15|
 :skolemid |41|
 :pattern ( (state Heap@@62 Mask@@31) (|fun04'| Heap@@62))
)))
(assert (forall ((Heap@@63 T@U) (Mask@@32 T@U) ) (!  (=> (and (and (= (type Heap@@63) (MapType0Type RefType)) (= (type Mask@@32) (MapType1Type RefType realType))) (state Heap@@63 Mask@@32)) (= (|fun05'| Heap@@63) (|fun05#frame| EmptyFrame)))
 :qid |stdinbpl.504:15|
 :skolemid |46|
 :pattern ( (state Heap@@63 Mask@@32) (|fun05'| Heap@@63))
)))
(assert (forall ((Heap@@64 T@U) (Mask@@33 T@U) ) (!  (=> (and (and (= (type Heap@@64) (MapType0Type RefType)) (= (type Mask@@33) (MapType1Type RefType realType))) (state Heap@@64 Mask@@33)) (= (|fun06'| Heap@@64) (|fun06#frame| EmptyFrame)))
 :qid |stdinbpl.581:15|
 :skolemid |51|
 :pattern ( (state Heap@@64 Mask@@33) (|fun06'| Heap@@64))
)))
(assert (forall ((Heap@@65 T@U) (Mask@@34 T@U) ) (!  (=> (and (and (= (type Heap@@65) (MapType0Type RefType)) (= (type Mask@@34) (MapType1Type RefType realType))) (state Heap@@65 Mask@@34)) (= (|fun07'| Heap@@65) (|fun07#frame| EmptyFrame)))
 :qid |stdinbpl.659:15|
 :skolemid |55|
 :pattern ( (state Heap@@65 Mask@@34) (|fun07'| Heap@@65))
)))
(assert (forall ((Heap@@66 T@U) (Mask@@35 T@U) ) (!  (=> (and (and (= (type Heap@@66) (MapType0Type RefType)) (= (type Mask@@35) (MapType1Type RefType realType))) (state Heap@@66 Mask@@35)) (= (|fun08'| Heap@@66) (|fun08#frame| EmptyFrame)))
 :qid |stdinbpl.728:15|
 :skolemid |59|
 :pattern ( (state Heap@@66 Mask@@35) (|fun08'| Heap@@66))
)))
(assert (forall ((Heap@@67 T@U) (o@@0 T@U) (f_3 T@U) (v T@U) ) (! (let ((B@@8 (type v)))
(let ((A@@9 (FieldTypeInv0 (type f_3))))
 (=> (and (and (= (type Heap@@67) (MapType0Type RefType)) (= (type o@@0) RefType)) (= (type f_3) (FieldType A@@9 B@@8))) (succHeap Heap@@67 (MapType0Store Heap@@67 o@@0 f_3 v)))))
 :qid |stdinbpl.78:22|
 :skolemid |9|
 :pattern ( (MapType0Store Heap@@67 o@@0 f_3 v))
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
 :qid |stdinbpl.183:25|
 :skolemid |20|
 :pattern ( (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))
)))
(assert (forall ((Heap@@68 T@U) (Mask@@36 T@U) (x@@33 Int) ) (!  (=> (and (and (and (= (type Heap@@68) (MapType0Type RefType)) (= (type Mask@@36) (MapType1Type RefType realType))) (and (state Heap@@68 Mask@@36) (< AssumeFunctionsAbove 1))) (and (not (= x@@33 0)) (not (= (div 1 x@@33) 2)))) (= (fun16 Heap@@68 x@@33) 1))
 :qid |stdinbpl.1107:15|
 :skolemid |79|
 :pattern ( (state Heap@@68 Mask@@36) (fun16 Heap@@68 x@@33))
)))
(assert (forall ((Heap@@69 T@U) (Mask@@37 T@U) (x@@34 Int) ) (!  (=> (and (and (and (= (type Heap@@69) (MapType0Type RefType)) (= (type Mask@@37) (MapType1Type RefType realType))) (and (state Heap@@69 Mask@@37) (< AssumeFunctionsAbove 6))) (and (not (= x@@34 0)) (not (= (div 1 x@@34) 2)))) (= (fun18 Heap@@69 x@@34) 1))
 :qid |stdinbpl.1239:15|
 :skolemid |86|
 :pattern ( (state Heap@@69 Mask@@37) (fun18 Heap@@69 x@@34))
)))
(assert (forall ((Heap@@70 T@U) (Mask@@38 T@U) (x@@35 Int) ) (!  (=> (and (and (and (= (type Heap@@70) (MapType0Type RefType)) (= (type Mask@@38) (MapType1Type RefType realType))) (and (state Heap@@70 Mask@@38) (< AssumeFunctionsAbove 8))) (and (not (= x@@35 0)) (not (= (div 1 x@@35) 2)))) (= (fun12 Heap@@70 x@@35) 1))
 :qid |stdinbpl.847:15|
 :skolemid |65|
 :pattern ( (state Heap@@70 Mask@@38) (fun12 Heap@@70 x@@35))
)))
(assert (forall ((Heap@@71 T@U) (Mask@@39 T@U) ) (!  (=> (and (and (= (type Heap@@71) (MapType0Type RefType)) (= (type Mask@@39) (MapType1Type RefType realType))) (and (state Heap@@71 Mask@@39) (< AssumeFunctionsAbove 2))) (= (fun08 Heap@@71) 1))
 :qid |stdinbpl.721:15|
 :skolemid |58|
 :pattern ( (state Heap@@71 Mask@@39) (fun08 Heap@@71))
)))
(assert (forall ((Heap@@72 T@U) (Mask@@40 T@U) ) (!  (=> (and (and (= (type Heap@@72) (MapType0Type RefType)) (= (type Mask@@40) (MapType1Type RefType realType))) (and (state Heap@@72 Mask@@40) (< AssumeFunctionsAbove 3))) (= (fun02 Heap@@72) 1))
 :qid |stdinbpl.270:15|
 :skolemid |29|
 :pattern ( (state Heap@@72 Mask@@40) (fun02 Heap@@72))
)))
(assert (forall ((Heap@@73 T@U) (Mask@@41 T@U) ) (!  (=> (and (and (= (type Heap@@73) (MapType0Type RefType)) (= (type Mask@@41) (MapType1Type RefType realType))) (and (state Heap@@73 Mask@@41) (< AssumeFunctionsAbove 11))) (= (fun06 Heap@@73) 1))
 :qid |stdinbpl.574:15|
 :skolemid |50|
 :pattern ( (state Heap@@73 Mask@@41) (fun06 Heap@@73))
)))
(assert (forall ((Heap@@74 T@U) (Mask@@42 T@U) ) (!  (=> (and (and (= (type Heap@@74) (MapType0Type RefType)) (= (type Mask@@42) (MapType1Type RefType realType))) (and (state Heap@@74 Mask@@42) (< AssumeFunctionsAbove 15))) (= (fun04 Heap@@74) 1))
 :qid |stdinbpl.417:15|
 :skolemid |40|
 :pattern ( (state Heap@@74 Mask@@42) (fun04 Heap@@74))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
; Invalid

(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun Heap@@75 () T@U)
(declare-fun x@@36 () Int)
(assert (= (type Heap@@75) (MapType0Type RefType)))
(set-info :boogie-vc-id |fun16#definedness|)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 6) (let ((anon3_Else_correct  (=> (and (state Heap@@75 ZeroMask) (= (ControlFlow 0 4) (- 0 3))) (not (= x@@36 0)))))
(let ((anon3_Then_correct  (=> (not (= x@@36 0)) (=> (and (state Heap@@75 ZeroMask) (= (ControlFlow 0 2) (- 0 1))) (not (= x@@36 0))))))
(let ((anon0_correct  (=> (and (state Heap@@75 ZeroMask) (= AssumeFunctionsAbove 1)) (and (=> (= (ControlFlow 0 5) 2) anon3_Then_correct) (=> (= (ControlFlow 0 5) 4) anon3_Else_correct)))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 6) 5) anon0_correct)))
PreconditionGeneratedEntry_correct)))))
))
(check-sat)
(get-info :reason-unknown)
(assert (not (= (ControlFlow 0 4) (- 3))))
(check-sat)
(pop 1)
; Invalid
(get-info :rlimit)
