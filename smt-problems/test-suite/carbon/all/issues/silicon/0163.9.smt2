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
(declare-fun postInhale (T@U T@U) T@U)
(declare-fun MapType1Type (T@T T@T) T@T)
(declare-fun AssumeFunctionsAbove () Int)
(declare-fun otherRef (T@U) T@U)
(declare-fun MapType1TypeInv0 (T@T) T@T)
(declare-fun MapType1TypeInv1 (T@T) T@T)
(declare-fun MapType1Select (T@U T@U T@U) T@U)
(declare-fun MapType1Store (T@U T@U T@U T@U) T@U)
(declare-fun GoodMask (T@U) Bool)
(declare-fun IdenticalOnKnownLocations (T@U T@U T@U) Bool)
(declare-fun IsPredicateField (T@U) Bool)
(declare-fun null () T@U)
(declare-fun PredicateMaskField (T@U) T@U)
(declare-fun FrameTypeType () T@T)
(declare-fun HasDirectPerm (T@U T@U T@U) Bool)
(declare-fun IsWandField (T@U) Bool)
(declare-fun WandMaskField (T@U) T@U)
(declare-fun |inhaleTrue'| (T@U T@U) Int)
(declare-fun dummyFunction (T@U) Bool)
(declare-fun |inhaleTrue#triggerStateless| (T@U) Int)
(declare-fun |onlyWorksWithInhale'| (T@U Int) Int)
(declare-fun |onlyWorksWithInhale#triggerStateless| (Int) Int)
(declare-fun |onlyWorksWithPreExhale'| (T@U Int) Int)
(declare-fun |onlyWorksWithPreExhale#triggerStateless| (Int) Int)
(declare-fun |onlyWorksWithInhale2'| (T@U Int) Int)
(declare-fun |onlyWorksWithInhale2#triggerStateless| (Int) Int)
(declare-fun |onlyWorksWithPreExhale2'| (T@U Int) Int)
(declare-fun |onlyWorksWithPreExhale2#triggerStateless| (Int) Int)
(declare-fun |helper'| (T@U T@U) Int)
(declare-fun |helper#triggerStateless| (T@U) Int)
(declare-fun |postInhale'| (T@U T@U) T@U)
(declare-fun |postInhale#triggerStateless| (T@U) T@U)
(declare-fun |main'| (T@U T@U) T@U)
(declare-fun |main#triggerStateless| (T@U) T@U)
(declare-fun |main2'| (T@U Int) Int)
(declare-fun |main2#triggerStateless| (Int) Int)
(declare-fun |main2#trigger| (T@U Int) Bool)
(declare-fun EmptyFrame () T@U)
(declare-fun |onlyWorksWithInhale#trigger| (T@U Int) Bool)
(declare-fun onlyWorksWithInhale2 (T@U Int) Int)
(declare-fun inhaleTrue (T@U T@U) Int)
(declare-fun onlyWorksWithInhale (T@U Int) Int)
(declare-fun onlyWorksWithPreExhale (T@U Int) Int)
(declare-fun onlyWorksWithPreExhale2 (T@U Int) Int)
(declare-fun helper (T@U T@U) Int)
(declare-fun main (T@U T@U) T@U)
(declare-fun main2 (T@U Int) Int)
(declare-fun |main#trigger| (T@U T@U) Bool)
(declare-fun |postInhale#trigger| (T@U T@U) Bool)
(declare-fun dummyHeap () T@U)
(declare-fun ZeroMask () T@U)
(declare-fun InsidePredicate (T@U T@U T@U T@U) Bool)
(declare-fun |onlyWorksWithInhale2#trigger| (T@U Int) Bool)
(declare-fun sumMask (T@U T@U T@U) Bool)
(declare-fun ConditionalFrame (Real T@U) T@U)
(declare-fun |otherRef'| (T@U) T@U)
(declare-fun |otherRef#triggerStateless| () T@U)
(declare-fun NoPerm () Real)
(declare-fun FullPerm () Real)
(declare-fun |inhaleTrue#frame| (T@U T@U) Int)
(declare-fun |onlyWorksWithInhale#frame| (T@U Int) Int)
(declare-fun |onlyWorksWithPreExhale#frame| (T@U Int) Int)
(declare-fun |onlyWorksWithInhale2#frame| (T@U Int) Int)
(declare-fun |onlyWorksWithPreExhale2#frame| (T@U Int) Int)
(declare-fun |helper#frame| (T@U T@U) Int)
(declare-fun |postInhale#frame| (T@U T@U) T@U)
(declare-fun |main#frame| (T@U T@U) T@U)
(declare-fun |main2#frame| (T@U Int) Int)
(declare-fun |otherRef#frame| (T@U) T@U)
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
(assert  (and (and (and (and (and (and (and (and (forall ((arg0@@18 T@T) (arg1@@4 T@T) ) (! (= (Ctor (MapType1Type arg0@@18 arg1@@4)) 10)
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
)))) (forall ((arg0@@23 T@U) (arg1@@9 T@U) ) (! (= (type (postInhale arg0@@23 arg1@@9)) RefType)
 :qid |funType:postInhale|
 :pattern ( (postInhale arg0@@23 arg1@@9))
))) (forall ((arg0@@24 T@U) ) (! (= (type (otherRef arg0@@24)) RefType)
 :qid |funType:otherRef|
 :pattern ( (otherRef arg0@@24))
))))
(assert (forall ((Heap T@U) (Mask T@U) (r_1 T@U) ) (!  (=> (and (and (and (= (type Heap) (MapType0Type RefType)) (= (type Mask) (MapType1Type RefType realType))) (= (type r_1) RefType)) (and (state Heap Mask) (< AssumeFunctionsAbove 7))) (= (postInhale Heap r_1) (otherRef Heap)))
 :qid |stdinbpl.630:15|
 :skolemid |52|
 :pattern ( (state Heap Mask) (postInhale Heap r_1))
)))
(assert (forall ((Heap@@0 T@U) (Mask@@0 T@U) ) (!  (=> (and (and (= (type Heap@@0) (MapType0Type RefType)) (= (type Mask@@0) (MapType1Type RefType realType))) (state Heap@@0 Mask@@0)) (GoodMask Mask@@0))
 :qid |stdinbpl.124:15|
 :skolemid |15|
 :pattern ( (state Heap@@0 Mask@@0))
)))
(assert (forall ((Heap0@@0 T@U) (Heap1@@0 T@U) (Heap2 T@U) ) (!  (=> (and (and (and (= (type Heap0@@0) (MapType0Type RefType)) (= (type Heap1@@0) (MapType0Type RefType))) (= (type Heap2) (MapType0Type RefType))) (and (succHeapTrans Heap0@@0 Heap1@@0) (succHeap Heap1@@0 Heap2))) (succHeapTrans Heap0@@0 Heap2))
 :qid |stdinbpl.93:15|
 :skolemid |12|
 :pattern ( (succHeapTrans Heap0@@0 Heap1@@0) (succHeap Heap1@@0 Heap2))
)))
(assert  (and (and (= (Ctor FrameTypeType) 11) (= (type null) RefType)) (forall ((arg0@@25 T@U) ) (! (let ((A (FieldTypeInv0 (type arg0@@25))))
(= (type (PredicateMaskField arg0@@25)) (FieldType A (MapType1Type RefType boolType))))
 :qid |funType:PredicateMaskField|
 :pattern ( (PredicateMaskField arg0@@25))
))))
(assert (forall ((Heap@@1 T@U) (ExhaleHeap T@U) (Mask@@1 T@U) (pm_f T@U) ) (! (let ((C (FieldTypeInv0 (type pm_f))))
 (=> (and (and (and (and (and (= (type Heap@@1) (MapType0Type RefType)) (= (type ExhaleHeap) (MapType0Type RefType))) (= (type Mask@@1) (MapType1Type RefType realType))) (= (type pm_f) (FieldType C FrameTypeType))) (IdenticalOnKnownLocations Heap@@1 ExhaleHeap Mask@@1)) (and (HasDirectPerm Mask@@1 null pm_f) (IsPredicateField pm_f))) (= (MapType0Select Heap@@1 null (PredicateMaskField pm_f)) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))))
 :qid |stdinbpl.47:19|
 :skolemid |2|
 :pattern ( (IdenticalOnKnownLocations Heap@@1 ExhaleHeap Mask@@1) (IsPredicateField pm_f) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))
)))
(assert (forall ((arg0@@26 T@U) ) (! (let ((A@@0 (FieldTypeInv0 (type arg0@@26))))
(= (type (WandMaskField arg0@@26)) (FieldType A@@0 (MapType1Type RefType boolType))))
 :qid |funType:WandMaskField|
 :pattern ( (WandMaskField arg0@@26))
)))
(assert (forall ((Heap@@2 T@U) (ExhaleHeap@@0 T@U) (Mask@@2 T@U) (pm_f@@0 T@U) ) (! (let ((C@@0 (FieldTypeInv0 (type pm_f@@0))))
 (=> (and (and (and (and (and (= (type Heap@@2) (MapType0Type RefType)) (= (type ExhaleHeap@@0) (MapType0Type RefType))) (= (type Mask@@2) (MapType1Type RefType realType))) (= (type pm_f@@0) (FieldType C@@0 FrameTypeType))) (IdenticalOnKnownLocations Heap@@2 ExhaleHeap@@0 Mask@@2)) (and (HasDirectPerm Mask@@2 null pm_f@@0) (IsWandField pm_f@@0))) (= (MapType0Select Heap@@2 null (WandMaskField pm_f@@0)) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))))
 :qid |stdinbpl.60:19|
 :skolemid |5|
 :pattern ( (IdenticalOnKnownLocations Heap@@2 ExhaleHeap@@0 Mask@@2) (IsWandField pm_f@@0) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))
)))
(assert (forall ((Heap@@3 T@U) (this T@U) ) (!  (=> (and (= (type Heap@@3) (MapType0Type RefType)) (= (type this) RefType)) (dummyFunction (int_2_U (|inhaleTrue#triggerStateless| this))))
 :qid |stdinbpl.206:15|
 :skolemid |23|
 :pattern ( (|inhaleTrue'| Heap@@3 this))
)))
(assert (forall ((Heap@@4 T@U) (i Int) ) (!  (=> (= (type Heap@@4) (MapType0Type RefType)) (dummyFunction (int_2_U (|onlyWorksWithInhale#triggerStateless| i))))
 :qid |stdinbpl.267:15|
 :skolemid |27|
 :pattern ( (|onlyWorksWithInhale'| Heap@@4 i))
)))
(assert (forall ((Heap@@5 T@U) (i2 Int) ) (!  (=> (= (type Heap@@5) (MapType0Type RefType)) (dummyFunction (int_2_U (|onlyWorksWithPreExhale#triggerStateless| i2))))
 :qid |stdinbpl.342:15|
 :skolemid |32|
 :pattern ( (|onlyWorksWithPreExhale'| Heap@@5 i2))
)))
(assert (forall ((Heap@@6 T@U) (i@@0 Int) ) (!  (=> (= (type Heap@@6) (MapType0Type RefType)) (dummyFunction (int_2_U (|onlyWorksWithInhale2#triggerStateless| i@@0))))
 :qid |stdinbpl.404:15|
 :skolemid |36|
 :pattern ( (|onlyWorksWithInhale2'| Heap@@6 i@@0))
)))
(assert (forall ((Heap@@7 T@U) (i2@@0 Int) ) (!  (=> (= (type Heap@@7) (MapType0Type RefType)) (dummyFunction (int_2_U (|onlyWorksWithPreExhale2#triggerStateless| i2@@0))))
 :qid |stdinbpl.479:15|
 :skolemid |41|
 :pattern ( (|onlyWorksWithPreExhale2'| Heap@@7 i2@@0))
)))
(assert (forall ((Heap@@8 T@U) (r_1@@0 T@U) ) (!  (=> (and (= (type Heap@@8) (MapType0Type RefType)) (= (type r_1@@0) RefType)) (dummyFunction (int_2_U (|helper#triggerStateless| r_1@@0))))
 :qid |stdinbpl.543:15|
 :skolemid |45|
 :pattern ( (|helper'| Heap@@8 r_1@@0))
)))
(assert  (and (forall ((arg0@@27 T@U) (arg1@@10 T@U) ) (! (= (type (|postInhale'| arg0@@27 arg1@@10)) RefType)
 :qid |funType:postInhale'|
 :pattern ( (|postInhale'| arg0@@27 arg1@@10))
)) (forall ((arg0@@28 T@U) ) (! (= (type (|postInhale#triggerStateless| arg0@@28)) RefType)
 :qid |funType:postInhale#triggerStateless|
 :pattern ( (|postInhale#triggerStateless| arg0@@28))
))))
(assert (forall ((Heap@@9 T@U) (r_1@@1 T@U) ) (!  (=> (and (= (type Heap@@9) (MapType0Type RefType)) (= (type r_1@@1) RefType)) (dummyFunction (|postInhale#triggerStateless| r_1@@1)))
 :qid |stdinbpl.624:15|
 :skolemid |51|
 :pattern ( (|postInhale'| Heap@@9 r_1@@1))
)))
(assert  (and (forall ((arg0@@29 T@U) (arg1@@11 T@U) ) (! (= (type (|main'| arg0@@29 arg1@@11)) RefType)
 :qid |funType:main'|
 :pattern ( (|main'| arg0@@29 arg1@@11))
)) (forall ((arg0@@30 T@U) ) (! (= (type (|main#triggerStateless| arg0@@30)) RefType)
 :qid |funType:main#triggerStateless|
 :pattern ( (|main#triggerStateless| arg0@@30))
))))
(assert (forall ((Heap@@10 T@U) (r2 T@U) ) (!  (=> (and (= (type Heap@@10) (MapType0Type RefType)) (= (type r2) RefType)) (dummyFunction (|main#triggerStateless| r2)))
 :qid |stdinbpl.710:15|
 :skolemid |56|
 :pattern ( (|main'| Heap@@10 r2))
)))
(assert (forall ((Heap@@11 T@U) (i3 Int) ) (!  (=> (= (type Heap@@11) (MapType0Type RefType)) (dummyFunction (int_2_U (|main2#triggerStateless| i3))))
 :qid |stdinbpl.788:15|
 :skolemid |61|
 :pattern ( (|main2'| Heap@@11 i3))
)))
(assert (= (type EmptyFrame) FrameTypeType))
(assert (forall ((Heap@@12 T@U) (Mask@@3 T@U) (i3@@0 Int) ) (!  (=> (and (and (= (type Heap@@12) (MapType0Type RefType)) (= (type Mask@@3) (MapType1Type RefType realType))) (and (state Heap@@12 Mask@@3) (or (< AssumeFunctionsAbove 0) (|main2#trigger| EmptyFrame i3@@0)))) (> (|main2'| Heap@@12 i3@@0) 17))
 :qid |stdinbpl.807:15|
 :skolemid |64|
 :pattern ( (state Heap@@12 Mask@@3) (|main2'| Heap@@12 i3@@0))
)))
(assert (forall ((Heap@@13 T@U) (Mask@@4 T@U) (i@@1 Int) ) (!  (=> (and (and (= (type Heap@@13) (MapType0Type RefType)) (= (type Mask@@4) (MapType1Type RefType realType))) (and (state Heap@@13 Mask@@4) (or (< AssumeFunctionsAbove 6) (|onlyWorksWithInhale#trigger| EmptyFrame i@@1)))) (> (|onlyWorksWithInhale'| Heap@@13 i@@1) 17))
 :qid |stdinbpl.286:15|
 :skolemid |30|
 :pattern ( (state Heap@@13 Mask@@4) (|onlyWorksWithInhale'| Heap@@13 i@@1))
)))
(assert (forall ((Heap@@14 T@U) (Mask@@5 T@U) (i@@2 Int) ) (!  (=> (and (and (and (= (type Heap@@14) (MapType0Type RefType)) (= (type Mask@@5) (MapType1Type RefType realType))) (and (state Heap@@14 Mask@@5) (< AssumeFunctionsAbove 5))) (> i@@2 17)) (= (onlyWorksWithInhale2 Heap@@14 i@@2) i@@2))
 :qid |stdinbpl.410:15|
 :skolemid |37|
 :pattern ( (state Heap@@14 Mask@@5) (onlyWorksWithInhale2 Heap@@14 i@@2))
)))
(assert (forall ((Heap@@15 T@U) (ExhaleHeap@@1 T@U) (Mask@@6 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@15) (MapType0Type RefType)) (= (type ExhaleHeap@@1) (MapType0Type RefType))) (= (type Mask@@6) (MapType1Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@15 ExhaleHeap@@1 Mask@@6)) (U_2_bool (MapType0Select Heap@@15 o_1 $allocated))) (U_2_bool (MapType0Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.73:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@15 ExhaleHeap@@1 Mask@@6) (MapType0Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert (forall ((Heap@@16 T@U) (this@@0 T@U) ) (!  (=> (and (= (type Heap@@16) (MapType0Type RefType)) (= (type this@@0) RefType)) (and (= (inhaleTrue Heap@@16 this@@0) (|inhaleTrue'| Heap@@16 this@@0)) (dummyFunction (int_2_U (|inhaleTrue#triggerStateless| this@@0)))))
 :qid |stdinbpl.202:15|
 :skolemid |22|
 :pattern ( (inhaleTrue Heap@@16 this@@0))
)))
(assert (forall ((Heap@@17 T@U) (i@@3 Int) ) (!  (=> (= (type Heap@@17) (MapType0Type RefType)) (and (= (onlyWorksWithInhale Heap@@17 i@@3) (|onlyWorksWithInhale'| Heap@@17 i@@3)) (dummyFunction (int_2_U (|onlyWorksWithInhale#triggerStateless| i@@3)))))
 :qid |stdinbpl.263:15|
 :skolemid |26|
 :pattern ( (onlyWorksWithInhale Heap@@17 i@@3))
)))
(assert (forall ((Heap@@18 T@U) (i2@@1 Int) ) (!  (=> (= (type Heap@@18) (MapType0Type RefType)) (and (= (onlyWorksWithPreExhale Heap@@18 i2@@1) (|onlyWorksWithPreExhale'| Heap@@18 i2@@1)) (dummyFunction (int_2_U (|onlyWorksWithPreExhale#triggerStateless| i2@@1)))))
 :qid |stdinbpl.338:15|
 :skolemid |31|
 :pattern ( (onlyWorksWithPreExhale Heap@@18 i2@@1))
)))
(assert (forall ((Heap@@19 T@U) (i@@4 Int) ) (!  (=> (= (type Heap@@19) (MapType0Type RefType)) (and (= (onlyWorksWithInhale2 Heap@@19 i@@4) (|onlyWorksWithInhale2'| Heap@@19 i@@4)) (dummyFunction (int_2_U (|onlyWorksWithInhale2#triggerStateless| i@@4)))))
 :qid |stdinbpl.400:15|
 :skolemid |35|
 :pattern ( (onlyWorksWithInhale2 Heap@@19 i@@4))
)))
(assert (forall ((Heap@@20 T@U) (i2@@2 Int) ) (!  (=> (= (type Heap@@20) (MapType0Type RefType)) (and (= (onlyWorksWithPreExhale2 Heap@@20 i2@@2) (|onlyWorksWithPreExhale2'| Heap@@20 i2@@2)) (dummyFunction (int_2_U (|onlyWorksWithPreExhale2#triggerStateless| i2@@2)))))
 :qid |stdinbpl.475:15|
 :skolemid |40|
 :pattern ( (onlyWorksWithPreExhale2 Heap@@20 i2@@2))
)))
(assert (forall ((Heap@@21 T@U) (r_1@@2 T@U) ) (!  (=> (and (= (type Heap@@21) (MapType0Type RefType)) (= (type r_1@@2) RefType)) (and (= (helper Heap@@21 r_1@@2) (|helper'| Heap@@21 r_1@@2)) (dummyFunction (int_2_U (|helper#triggerStateless| r_1@@2)))))
 :qid |stdinbpl.539:15|
 :skolemid |44|
 :pattern ( (helper Heap@@21 r_1@@2))
)))
(assert (forall ((Heap@@22 T@U) (r_1@@3 T@U) ) (!  (=> (and (= (type Heap@@22) (MapType0Type RefType)) (= (type r_1@@3) RefType)) (and (= (postInhale Heap@@22 r_1@@3) (|postInhale'| Heap@@22 r_1@@3)) (dummyFunction (|postInhale#triggerStateless| r_1@@3))))
 :qid |stdinbpl.620:15|
 :skolemid |50|
 :pattern ( (postInhale Heap@@22 r_1@@3))
)))
(assert (forall ((arg0@@31 T@U) (arg1@@12 T@U) ) (! (= (type (main arg0@@31 arg1@@12)) RefType)
 :qid |funType:main|
 :pattern ( (main arg0@@31 arg1@@12))
)))
(assert (forall ((Heap@@23 T@U) (r2@@0 T@U) ) (!  (=> (and (= (type Heap@@23) (MapType0Type RefType)) (= (type r2@@0) RefType)) (and (= (main Heap@@23 r2@@0) (|main'| Heap@@23 r2@@0)) (dummyFunction (|main#triggerStateless| r2@@0))))
 :qid |stdinbpl.706:15|
 :skolemid |55|
 :pattern ( (main Heap@@23 r2@@0))
)))
(assert (forall ((Heap@@24 T@U) (i3@@1 Int) ) (!  (=> (= (type Heap@@24) (MapType0Type RefType)) (and (= (main2 Heap@@24 i3@@1) (|main2'| Heap@@24 i3@@1)) (dummyFunction (int_2_U (|main2#triggerStateless| i3@@1)))))
 :qid |stdinbpl.784:15|
 :skolemid |60|
 :pattern ( (main2 Heap@@24 i3@@1))
)))
(assert (forall ((Heap@@25 T@U) (Mask@@7 T@U) (r2@@1 T@U) ) (!  (=> (and (and (and (= (type Heap@@25) (MapType0Type RefType)) (= (type Mask@@7) (MapType1Type RefType realType))) (= (type r2@@1) RefType)) (and (state Heap@@25 Mask@@7) (or (< AssumeFunctionsAbove 4) (|main#trigger| EmptyFrame r2@@1)))) (= (helper Heap@@25 (|main'| Heap@@25 r2@@1)) 2))
 :qid |stdinbpl.729:15|
 :skolemid |59|
 :pattern ( (state Heap@@25 Mask@@7) (|main'| Heap@@25 r2@@1))
)))
(assert (forall ((Heap@@26 T@U) (Mask@@8 T@U) (r_1@@4 T@U) ) (!  (=> (and (and (and (= (type Heap@@26) (MapType0Type RefType)) (= (type Mask@@8) (MapType1Type RefType realType))) (= (type r_1@@4) RefType)) (and (state Heap@@26 Mask@@8) (or (< AssumeFunctionsAbove 7) (|postInhale#trigger| EmptyFrame r_1@@4)))) (= (helper Heap@@26 (|postInhale'| Heap@@26 r_1@@4)) 2))
 :qid |stdinbpl.643:15|
 :skolemid |54|
 :pattern ( (state Heap@@26 Mask@@8) (|postInhale'| Heap@@26 r_1@@4))
)))
(assert (forall ((Heap@@27 T@U) (ExhaleHeap@@2 T@U) (Mask@@9 T@U) (o_1@@0 T@U) (f_2 T@U) ) (! (let ((B@@1 (FieldTypeInv1 (type f_2))))
(let ((A@@1 (FieldTypeInv0 (type f_2))))
 (=> (and (and (and (and (and (and (= (type Heap@@27) (MapType0Type RefType)) (= (type ExhaleHeap@@2) (MapType0Type RefType))) (= (type Mask@@9) (MapType1Type RefType realType))) (= (type o_1@@0) RefType)) (= (type f_2) (FieldType A@@1 B@@1))) (IdenticalOnKnownLocations Heap@@27 ExhaleHeap@@2 Mask@@9)) (HasDirectPerm Mask@@9 o_1@@0 f_2)) (= (MapType0Select Heap@@27 o_1@@0 f_2) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2)))))
 :qid |stdinbpl.42:22|
 :skolemid |1|
 :pattern ( (IdenticalOnKnownLocations Heap@@27 ExhaleHeap@@2 Mask@@9) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2))
)))
(assert  (and (= (type dummyHeap) (MapType0Type RefType)) (= (type ZeroMask) (MapType1Type RefType realType))))
(assert (state dummyHeap ZeroMask))
(assert (forall ((p T@U) (v_1 T@U) (w T@U) ) (! (let ((A@@2 (FieldTypeInv0 (type p))))
 (=> (and (and (= (type p) (FieldType A@@2 FrameTypeType)) (= (type v_1) FrameTypeType)) (= (type w) FrameTypeType)) (not (InsidePredicate p v_1 p w))))
 :qid |stdinbpl.182:19|
 :skolemid |21|
 :pattern ( (InsidePredicate p v_1 p w))
)))
(assert (forall ((Heap@@28 T@U) (Mask@@10 T@U) (i@@5 Int) ) (!  (=> (and (and (and (= (type Heap@@28) (MapType0Type RefType)) (= (type Mask@@10) (MapType1Type RefType realType))) (and (state Heap@@28 Mask@@10) (or (< AssumeFunctionsAbove 5) (|onlyWorksWithInhale2#trigger| EmptyFrame i@@5)))) (> i@@5 17)) (> (|onlyWorksWithInhale2'| Heap@@28 i@@5) 17))
 :qid |stdinbpl.423:15|
 :skolemid |39|
 :pattern ( (state Heap@@28 Mask@@10) (|onlyWorksWithInhale2'| Heap@@28 i@@5))
)))
(assert  (not (IsPredicateField x@@8)))
(assert  (not (IsWandField x@@8)))
(assert (forall ((Heap@@29 T@U) (ExhaleHeap@@3 T@U) (Mask@@11 T@U) ) (!  (=> (and (and (and (= (type Heap@@29) (MapType0Type RefType)) (= (type ExhaleHeap@@3) (MapType0Type RefType))) (= (type Mask@@11) (MapType1Type RefType realType))) (IdenticalOnKnownLocations Heap@@29 ExhaleHeap@@3 Mask@@11)) (succHeap Heap@@29 ExhaleHeap@@3))
 :qid |stdinbpl.83:15|
 :skolemid |10|
 :pattern ( (IdenticalOnKnownLocations Heap@@29 ExhaleHeap@@3 Mask@@11))
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
(assert (forall ((arg0@@32 Real) (arg1@@13 T@U) ) (! (= (type (ConditionalFrame arg0@@32 arg1@@13)) FrameTypeType)
 :qid |funType:ConditionalFrame|
 :pattern ( (ConditionalFrame arg0@@32 arg1@@13))
)))
(assert (forall ((p@@0 Real) (f_6 T@U) ) (!  (=> (= (type f_6) FrameTypeType) (= (ConditionalFrame p@@0 f_6) (ite (> p@@0 0.0) f_6 EmptyFrame)))
 :qid |stdinbpl.170:15|
 :skolemid |19|
 :pattern ( (ConditionalFrame p@@0 f_6))
)))
(assert  (and (forall ((arg0@@33 T@U) ) (! (= (type (|otherRef'| arg0@@33)) RefType)
 :qid |funType:otherRef'|
 :pattern ( (|otherRef'| arg0@@33))
)) (= (type |otherRef#triggerStateless|) RefType)))
(assert (forall ((Heap@@30 T@U) ) (!  (=> (= (type Heap@@30) (MapType0Type RefType)) (and (= (otherRef Heap@@30) (|otherRef'| Heap@@30)) (dummyFunction |otherRef#triggerStateless|)))
 :qid |stdinbpl.580:15|
 :skolemid |47|
 :pattern ( (otherRef Heap@@30))
)))
(assert (forall ((Mask@@12 T@U) (o_2@@0 T@U) (f_4@@0 T@U) ) (! (let ((B@@3 (FieldTypeInv1 (type f_4@@0))))
(let ((A@@4 (FieldTypeInv0 (type f_4@@0))))
 (=> (and (and (= (type Mask@@12) (MapType1Type RefType realType)) (= (type o_2@@0) RefType)) (= (type f_4@@0) (FieldType A@@4 B@@3))) (= (HasDirectPerm Mask@@12 o_2@@0 f_4@@0) (> (U_2_real (MapType1Select Mask@@12 o_2@@0 f_4@@0)) NoPerm)))))
 :qid |stdinbpl.133:22|
 :skolemid |17|
 :pattern ( (HasDirectPerm Mask@@12 o_2@@0 f_4@@0))
)))
(assert (forall ((o_2@@1 T@U) (f_4@@1 T@U) ) (! (let ((B@@4 (FieldTypeInv1 (type f_4@@1))))
(let ((A@@5 (FieldTypeInv0 (type f_4@@1))))
 (=> (and (= (type o_2@@1) RefType) (= (type f_4@@1) (FieldType A@@5 B@@4))) (= (U_2_real (MapType1Select ZeroMask o_2@@1 f_4@@1)) NoPerm))))
 :qid |stdinbpl.106:22|
 :skolemid |13|
 :pattern ( (MapType1Select ZeroMask o_2@@1 f_4@@1))
)))
(assert (forall ((Heap@@31 T@U) (ExhaleHeap@@4 T@U) (Mask@@13 T@U) (pm_f@@1 T@U) ) (! (let ((C@@1 (FieldTypeInv0 (type pm_f@@1))))
 (=> (and (and (and (and (and (= (type Heap@@31) (MapType0Type RefType)) (= (type ExhaleHeap@@4) (MapType0Type RefType))) (= (type Mask@@13) (MapType1Type RefType realType))) (= (type pm_f@@1) (FieldType C@@1 FrameTypeType))) (IdenticalOnKnownLocations Heap@@31 ExhaleHeap@@4 Mask@@13)) (and (HasDirectPerm Mask@@13 null pm_f@@1) (IsPredicateField pm_f@@1))) (forall ((o2 T@U) (f_2@@0 T@U) ) (! (let ((B@@5 (FieldTypeInv1 (type f_2@@0))))
(let ((A@@6 (FieldTypeInv0 (type f_2@@0))))
 (=> (and (and (= (type o2) RefType) (= (type f_2@@0) (FieldType A@@6 B@@5))) (U_2_bool (MapType1Select (MapType0Select Heap@@31 null (PredicateMaskField pm_f@@1)) o2 f_2@@0))) (= (MapType0Select Heap@@31 o2 f_2@@0) (MapType0Select ExhaleHeap@@4 o2 f_2@@0)))))
 :qid |stdinbpl.54:134|
 :skolemid |3|
 :pattern ( (MapType0Select ExhaleHeap@@4 o2 f_2@@0))
))))
 :qid |stdinbpl.52:19|
 :skolemid |4|
 :pattern ( (IdenticalOnKnownLocations Heap@@31 ExhaleHeap@@4 Mask@@13) (IsPredicateField pm_f@@1))
)))
(assert (forall ((Heap@@32 T@U) (ExhaleHeap@@5 T@U) (Mask@@14 T@U) (pm_f@@2 T@U) ) (! (let ((C@@2 (FieldTypeInv0 (type pm_f@@2))))
 (=> (and (and (and (and (and (= (type Heap@@32) (MapType0Type RefType)) (= (type ExhaleHeap@@5) (MapType0Type RefType))) (= (type Mask@@14) (MapType1Type RefType realType))) (= (type pm_f@@2) (FieldType C@@2 FrameTypeType))) (IdenticalOnKnownLocations Heap@@32 ExhaleHeap@@5 Mask@@14)) (and (HasDirectPerm Mask@@14 null pm_f@@2) (IsWandField pm_f@@2))) (forall ((o2@@0 T@U) (f_2@@1 T@U) ) (! (let ((B@@6 (FieldTypeInv1 (type f_2@@1))))
(let ((A@@7 (FieldTypeInv0 (type f_2@@1))))
 (=> (and (and (= (type o2@@0) RefType) (= (type f_2@@1) (FieldType A@@7 B@@6))) (U_2_bool (MapType1Select (MapType0Select Heap@@32 null (WandMaskField pm_f@@2)) o2@@0 f_2@@1))) (= (MapType0Select Heap@@32 o2@@0 f_2@@1) (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1)))))
 :qid |stdinbpl.67:129|
 :skolemid |6|
 :pattern ( (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1))
))))
 :qid |stdinbpl.65:19|
 :skolemid |7|
 :pattern ( (IdenticalOnKnownLocations Heap@@32 ExhaleHeap@@5 Mask@@14) (IsWandField pm_f@@2))
)))
(assert (forall ((Mask@@15 T@U) (o_2@@2 T@U) (f_4@@2 T@U) ) (! (let ((B@@7 (FieldTypeInv1 (type f_4@@2))))
(let ((A@@8 (FieldTypeInv0 (type f_4@@2))))
 (=> (and (and (and (= (type Mask@@15) (MapType1Type RefType realType)) (= (type o_2@@2) RefType)) (= (type f_4@@2) (FieldType A@@8 B@@7))) (GoodMask Mask@@15)) (and (>= (U_2_real (MapType1Select Mask@@15 o_2@@2 f_4@@2)) NoPerm) (=> (and (and (GoodMask Mask@@15) (not (IsPredicateField f_4@@2))) (not (IsWandField f_4@@2))) (<= (U_2_real (MapType1Select Mask@@15 o_2@@2 f_4@@2)) FullPerm))))))
 :qid |stdinbpl.128:22|
 :skolemid |16|
 :pattern ( (GoodMask Mask@@15) (MapType1Select Mask@@15 o_2@@2 f_4@@2))
)))
(assert (forall ((Heap@@33 T@U) (Mask@@16 T@U) (this@@1 T@U) ) (!  (=> (and (and (and (= (type Heap@@33) (MapType0Type RefType)) (= (type Mask@@16) (MapType1Type RefType realType))) (= (type this@@1) RefType)) (state Heap@@33 Mask@@16)) (= (|inhaleTrue'| Heap@@33 this@@1) (|inhaleTrue#frame| EmptyFrame this@@1)))
 :qid |stdinbpl.219:15|
 :skolemid |25|
 :pattern ( (state Heap@@33 Mask@@16) (|inhaleTrue'| Heap@@33 this@@1))
)))
(assert (forall ((Heap@@34 T@U) (Mask@@17 T@U) (i@@6 Int) ) (!  (=> (and (and (= (type Heap@@34) (MapType0Type RefType)) (= (type Mask@@17) (MapType1Type RefType realType))) (state Heap@@34 Mask@@17)) (= (|onlyWorksWithInhale'| Heap@@34 i@@6) (|onlyWorksWithInhale#frame| EmptyFrame i@@6)))
 :qid |stdinbpl.280:15|
 :skolemid |29|
 :pattern ( (state Heap@@34 Mask@@17) (|onlyWorksWithInhale'| Heap@@34 i@@6))
)))
(assert (forall ((Heap@@35 T@U) (Mask@@18 T@U) (i2@@3 Int) ) (!  (=> (and (and (= (type Heap@@35) (MapType0Type RefType)) (= (type Mask@@18) (MapType1Type RefType realType))) (state Heap@@35 Mask@@18)) (= (|onlyWorksWithPreExhale'| Heap@@35 i2@@3) (|onlyWorksWithPreExhale#frame| EmptyFrame i2@@3)))
 :qid |stdinbpl.355:15|
 :skolemid |34|
 :pattern ( (state Heap@@35 Mask@@18) (|onlyWorksWithPreExhale'| Heap@@35 i2@@3))
)))
(assert (forall ((Heap@@36 T@U) (Mask@@19 T@U) (i@@7 Int) ) (!  (=> (and (and (= (type Heap@@36) (MapType0Type RefType)) (= (type Mask@@19) (MapType1Type RefType realType))) (state Heap@@36 Mask@@19)) (= (|onlyWorksWithInhale2'| Heap@@36 i@@7) (|onlyWorksWithInhale2#frame| EmptyFrame i@@7)))
 :qid |stdinbpl.417:15|
 :skolemid |38|
 :pattern ( (state Heap@@36 Mask@@19) (|onlyWorksWithInhale2'| Heap@@36 i@@7))
)))
(assert (forall ((Heap@@37 T@U) (Mask@@20 T@U) (i2@@4 Int) ) (!  (=> (and (and (= (type Heap@@37) (MapType0Type RefType)) (= (type Mask@@20) (MapType1Type RefType realType))) (state Heap@@37 Mask@@20)) (= (|onlyWorksWithPreExhale2'| Heap@@37 i2@@4) (|onlyWorksWithPreExhale2#frame| EmptyFrame i2@@4)))
 :qid |stdinbpl.492:15|
 :skolemid |43|
 :pattern ( (state Heap@@37 Mask@@20) (|onlyWorksWithPreExhale2'| Heap@@37 i2@@4))
)))
(assert (forall ((Heap@@38 T@U) (Mask@@21 T@U) (r_1@@5 T@U) ) (!  (=> (and (and (and (= (type Heap@@38) (MapType0Type RefType)) (= (type Mask@@21) (MapType1Type RefType realType))) (= (type r_1@@5) RefType)) (state Heap@@38 Mask@@21)) (= (|helper'| Heap@@38 r_1@@5) (|helper#frame| EmptyFrame r_1@@5)))
 :qid |stdinbpl.550:15|
 :skolemid |46|
 :pattern ( (state Heap@@38 Mask@@21) (|helper'| Heap@@38 r_1@@5))
)))
(assert (forall ((arg0@@34 T@U) (arg1@@14 T@U) ) (! (= (type (|postInhale#frame| arg0@@34 arg1@@14)) RefType)
 :qid |funType:postInhale#frame|
 :pattern ( (|postInhale#frame| arg0@@34 arg1@@14))
)))
(assert (forall ((Heap@@39 T@U) (Mask@@22 T@U) (r_1@@6 T@U) ) (!  (=> (and (and (and (= (type Heap@@39) (MapType0Type RefType)) (= (type Mask@@22) (MapType1Type RefType realType))) (= (type r_1@@6) RefType)) (state Heap@@39 Mask@@22)) (= (|postInhale'| Heap@@39 r_1@@6) (|postInhale#frame| EmptyFrame r_1@@6)))
 :qid |stdinbpl.637:15|
 :skolemid |53|
 :pattern ( (state Heap@@39 Mask@@22) (|postInhale'| Heap@@39 r_1@@6))
)))
(assert (forall ((arg0@@35 T@U) (arg1@@15 T@U) ) (! (= (type (|main#frame| arg0@@35 arg1@@15)) RefType)
 :qid |funType:main#frame|
 :pattern ( (|main#frame| arg0@@35 arg1@@15))
)))
(assert (forall ((Heap@@40 T@U) (Mask@@23 T@U) (r2@@2 T@U) ) (!  (=> (and (and (and (= (type Heap@@40) (MapType0Type RefType)) (= (type Mask@@23) (MapType1Type RefType realType))) (= (type r2@@2) RefType)) (state Heap@@40 Mask@@23)) (= (|main'| Heap@@40 r2@@2) (|main#frame| EmptyFrame r2@@2)))
 :qid |stdinbpl.723:15|
 :skolemid |58|
 :pattern ( (state Heap@@40 Mask@@23) (|main'| Heap@@40 r2@@2))
)))
(assert (forall ((Heap@@41 T@U) (Mask@@24 T@U) (i3@@2 Int) ) (!  (=> (and (and (= (type Heap@@41) (MapType0Type RefType)) (= (type Mask@@24) (MapType1Type RefType realType))) (state Heap@@41 Mask@@24)) (= (|main2'| Heap@@41 i3@@2) (|main2#frame| EmptyFrame i3@@2)))
 :qid |stdinbpl.801:15|
 :skolemid |63|
 :pattern ( (state Heap@@41 Mask@@24) (|main2'| Heap@@41 i3@@2))
)))
(assert (forall ((Heap@@42 T@U) ) (!  (=> (= (type Heap@@42) (MapType0Type RefType)) (dummyFunction |otherRef#triggerStateless|))
 :qid |stdinbpl.584:15|
 :skolemid |48|
 :pattern ( (|otherRef'| Heap@@42))
)))
(assert (forall ((o T@U) (f T@U) (Heap@@43 T@U) ) (!  (=> (and (and (and (= (type o) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap@@43) (MapType0Type RefType))) (U_2_bool (MapType0Select Heap@@43 o $allocated))) (U_2_bool (MapType0Select Heap@@43 (MapType0Select Heap@@43 o f) $allocated)))
 :qid |stdinbpl.31:15|
 :skolemid |0|
 :pattern ( (MapType0Select Heap@@43 o f))
)))
(assert (forall ((arg0@@36 T@U) ) (! (= (type (|otherRef#frame| arg0@@36)) RefType)
 :qid |funType:otherRef#frame|
 :pattern ( (|otherRef#frame| arg0@@36))
)))
(assert (forall ((Heap@@44 T@U) (Mask@@25 T@U) ) (!  (=> (and (and (= (type Heap@@44) (MapType0Type RefType)) (= (type Mask@@25) (MapType1Type RefType realType))) (state Heap@@44 Mask@@25)) (= (|otherRef'| Heap@@44) (|otherRef#frame| EmptyFrame)))
 :qid |stdinbpl.591:15|
 :skolemid |49|
 :pattern ( (state Heap@@44 Mask@@25) (|otherRef'| Heap@@44))
)))
(assert (forall ((Heap@@45 T@U) (o@@0 T@U) (f_3 T@U) (v T@U) ) (! (let ((B@@8 (type v)))
(let ((A@@9 (FieldTypeInv0 (type f_3))))
 (=> (and (and (= (type Heap@@45) (MapType0Type RefType)) (= (type o@@0) RefType)) (= (type f_3) (FieldType A@@9 B@@8))) (succHeap Heap@@45 (MapType0Store Heap@@45 o@@0 f_3 v)))))
 :qid |stdinbpl.78:22|
 :skolemid |9|
 :pattern ( (MapType0Store Heap@@45 o@@0 f_3 v))
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
 :qid |stdinbpl.177:25|
 :skolemid |20|
 :pattern ( (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))
)))
(assert (forall ((Heap@@46 T@U) (Mask@@26 T@U) (this@@2 T@U) ) (!  (=> (and (and (and (= (type Heap@@46) (MapType0Type RefType)) (= (type Mask@@26) (MapType1Type RefType realType))) (= (type this@@2) RefType)) (and (state Heap@@46 Mask@@26) (< AssumeFunctionsAbove 3))) (= (inhaleTrue Heap@@46 this@@2) 0))
 :qid |stdinbpl.212:15|
 :skolemid |24|
 :pattern ( (state Heap@@46 Mask@@26) (inhaleTrue Heap@@46 this@@2))
)))
(assert (forall ((Heap@@47 T@U) (Mask@@27 T@U) (i@@8 Int) ) (!  (=> (and (and (= (type Heap@@47) (MapType0Type RefType)) (= (type Mask@@27) (MapType1Type RefType realType))) (and (state Heap@@47 Mask@@27) (< AssumeFunctionsAbove 6))) (= (onlyWorksWithInhale Heap@@47 i@@8) i@@8))
 :qid |stdinbpl.273:15|
 :skolemid |28|
 :pattern ( (state Heap@@47 Mask@@27) (onlyWorksWithInhale Heap@@47 i@@8))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
(assert (forall ((Heap@@48 T@U) (Mask@@28 T@U) (i3@@3 Int) ) (!  (=> (and (and (= (type Heap@@48) (MapType0Type RefType)) (= (type Mask@@28) (MapType1Type RefType realType))) (and (state Heap@@48 Mask@@28) (< AssumeFunctionsAbove 0))) (= (main2 Heap@@48 i3@@3) (onlyWorksWithInhale Heap@@48 i3@@3)))
 :qid |stdinbpl.794:15|
 :skolemid |62|
 :pattern ( (state Heap@@48 Mask@@28) (main2 Heap@@48 i3@@3))
)))
(assert (forall ((Heap@@49 T@U) (Mask@@29 T@U) (i2@@5 Int) ) (!  (=> (and (and (= (type Heap@@49) (MapType0Type RefType)) (= (type Mask@@29) (MapType1Type RefType realType))) (and (state Heap@@49 Mask@@29) (< AssumeFunctionsAbove 1))) (= (onlyWorksWithPreExhale2 Heap@@49 i2@@5) (onlyWorksWithInhale2 Heap@@49 i2@@5)))
 :qid |stdinbpl.485:15|
 :skolemid |42|
 :pattern ( (state Heap@@49 Mask@@29) (onlyWorksWithPreExhale2 Heap@@49 i2@@5))
)))
(assert (forall ((Heap@@50 T@U) (Mask@@30 T@U) (i2@@6 Int) ) (!  (=> (and (and (= (type Heap@@50) (MapType0Type RefType)) (= (type Mask@@30) (MapType1Type RefType realType))) (and (state Heap@@50 Mask@@30) (< AssumeFunctionsAbove 2))) (= (onlyWorksWithPreExhale Heap@@50 i2@@6) (onlyWorksWithInhale Heap@@50 i2@@6)))
 :qid |stdinbpl.348:15|
 :skolemid |33|
 :pattern ( (state Heap@@50 Mask@@30) (onlyWorksWithPreExhale Heap@@50 i2@@6))
)))
(assert (forall ((Heap@@51 T@U) (Mask@@31 T@U) (r2@@3 T@U) ) (!  (=> (and (and (and (= (type Heap@@51) (MapType0Type RefType)) (= (type Mask@@31) (MapType1Type RefType realType))) (= (type r2@@3) RefType)) (and (state Heap@@51 Mask@@31) (< AssumeFunctionsAbove 4))) (= (main Heap@@51 r2@@3) (postInhale Heap@@51 r2@@3)))
 :qid |stdinbpl.716:15|
 :skolemid |57|
 :pattern ( (state Heap@@51 Mask@@31) (main Heap@@51 r2@@3))
)))
(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun Heap@@52 () T@U)
(declare-fun i@@9 () Int)
(assert (= (type Heap@@52) (MapType0Type RefType)))
(set-info :boogie-vc-id |onlyWorksWithInhale2#definedness|)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 5) (let ((anon3_Else_correct  (=> (and (state Heap@@52 ZeroMask) (= (ControlFlow 0 3) (- 0 2))) (> i@@9 17))))
(let ((anon3_Then_correct true))
(let ((anon0_correct  (=> (and (state Heap@@52 ZeroMask) (= AssumeFunctionsAbove 5)) (and (=> (= (ControlFlow 0 4) 1) anon3_Then_correct) (=> (= (ControlFlow 0 4) 3) anon3_Else_correct)))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 5) 4) anon0_correct)))
PreconditionGeneratedEntry_correct)))))
))
(check-sat)
(get-info :reason-unknown)
(assert (not (= (ControlFlow 0 3) (- 2))))
(check-sat)
(pop 1)
; Invalid
(get-info :rlimit)
