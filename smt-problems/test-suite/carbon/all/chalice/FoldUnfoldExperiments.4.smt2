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
(declare-fun y@@1 () T@U)
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
(declare-fun X (T@U) T@U)
(declare-fun PredicateType_XType () T@T)
(declare-fun Y (T@U) T@U)
(declare-fun PredicateType_YType () T@T)
(declare-fun |getX'| (T@U T@U) Int)
(declare-fun dummyFunction (T@U) Bool)
(declare-fun |getX#triggerStateless| (T@U) Int)
(declare-fun |getY'| (T@U T@U) Int)
(declare-fun |getY#triggerStateless| (T@U) Int)
(declare-fun |X#trigger| (T@U T@U) Bool)
(declare-fun |X#everUsed| (T@U) Bool)
(declare-fun |Y#trigger| (T@U T@U) Bool)
(declare-fun |Y#everUsed| (T@U) Bool)
(declare-fun getX (T@U T@U) Int)
(declare-fun getY (T@U T@U) Int)
(declare-fun |X#sm| (T@U) T@U)
(declare-fun |Y#sm| (T@U) T@U)
(declare-fun dummyHeap () T@U)
(declare-fun ZeroMask () T@U)
(declare-fun InsidePredicate (T@U T@U T@U T@U) Bool)
(declare-fun sumMask (T@U T@U T@U) Bool)
(declare-fun ConditionalFrame (Real T@U) T@U)
(declare-fun EmptyFrame () T@U)
(declare-fun NoPerm () Real)
(declare-fun getPredWandId (T@U) Int)
(declare-fun FullPerm () Real)
(declare-fun |getX#frame| (T@U T@U) Int)
(declare-fun |getY#frame| (T@U T@U) Int)
(declare-fun AssumeFunctionsAbove () Int)
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
(assert  (and (and (and (and (and (and (forall ((arg0@@11 T@T) (arg1 T@T) ) (! (= (Ctor (FieldType arg0@@11 arg1)) 6)
 :qid |ctor:FieldType|
)) (forall ((arg0@@12 T@T) (arg1@@0 T@T) ) (! (= (FieldTypeInv0 (FieldType arg0@@12 arg1@@0)) arg0@@12)
 :qid |typeInv:FieldTypeInv0|
 :pattern ( (FieldType arg0@@12 arg1@@0))
))) (forall ((arg0@@13 T@T) (arg1@@1 T@T) ) (! (= (FieldTypeInv1 (FieldType arg0@@13 arg1@@1)) arg1@@1)
 :qid |typeInv:FieldTypeInv1|
 :pattern ( (FieldType arg0@@13 arg1@@1))
))) (= (Ctor NormalFieldType) 7)) (= (type $allocated) (FieldType NormalFieldType boolType))) (= (type x@@8) (FieldType NormalFieldType intType))) (= (type y@@1) (FieldType NormalFieldType intType))))
(assert (distinct $allocated x@@8 y@@1)
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
(assert  (and (= (Ctor PredicateType_XType) 12) (forall ((arg0@@25 T@U) ) (! (= (type (X arg0@@25)) (FieldType PredicateType_XType FrameTypeType))
 :qid |funType:X|
 :pattern ( (X arg0@@25))
))))
(assert (forall ((this T@U) ) (!  (=> (= (type this) RefType) (IsPredicateField (X this)))
 :qid |stdinbpl.377:15|
 :skolemid |31|
 :pattern ( (X this))
)))
(assert  (and (= (Ctor PredicateType_YType) 13) (forall ((arg0@@26 T@U) ) (! (= (type (Y arg0@@26)) (FieldType PredicateType_YType FrameTypeType))
 :qid |funType:Y|
 :pattern ( (Y arg0@@26))
))))
(assert (forall ((this@@0 T@U) ) (!  (=> (= (type this@@0) RefType) (IsPredicateField (Y this@@0)))
 :qid |stdinbpl.431:15|
 :skolemid |37|
 :pattern ( (Y this@@0))
)))
(assert (forall ((Heap@@2 T@U) (this@@1 T@U) ) (!  (=> (and (= (type Heap@@2) (MapType0Type RefType)) (= (type this@@1) RefType)) (dummyFunction (int_2_U (|getX#triggerStateless| this@@1))))
 :qid |stdinbpl.201:15|
 :skolemid |23|
 :pattern ( (|getX'| Heap@@2 this@@1))
)))
(assert (forall ((Heap@@3 T@U) (this@@2 T@U) ) (!  (=> (and (= (type Heap@@3) (MapType0Type RefType)) (= (type this@@2) RefType)) (dummyFunction (int_2_U (|getY#triggerStateless| this@@2))))
 :qid |stdinbpl.289:15|
 :skolemid |27|
 :pattern ( (|getY'| Heap@@3 this@@2))
)))
(assert (forall ((Heap@@4 T@U) (this@@3 T@U) ) (!  (=> (and (= (type Heap@@4) (MapType0Type RefType)) (= (type this@@3) RefType)) (|X#everUsed| (X this@@3)))
 :qid |stdinbpl.396:15|
 :skolemid |35|
 :pattern ( (|X#trigger| Heap@@4 (X this@@3)))
)))
(assert (forall ((Heap@@5 T@U) (this@@4 T@U) ) (!  (=> (and (= (type Heap@@5) (MapType0Type RefType)) (= (type this@@4) RefType)) (|Y#everUsed| (Y this@@4)))
 :qid |stdinbpl.450:15|
 :skolemid |41|
 :pattern ( (|Y#trigger| Heap@@5 (Y this@@4)))
)))
(assert (forall ((Heap@@6 T@U) (ExhaleHeap@@1 T@U) (Mask@@2 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@6) (MapType0Type RefType)) (= (type ExhaleHeap@@1) (MapType0Type RefType))) (= (type Mask@@2) (MapType1Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@6 ExhaleHeap@@1 Mask@@2)) (U_2_bool (MapType0Select Heap@@6 o_1 $allocated))) (U_2_bool (MapType0Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.73:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@6 ExhaleHeap@@1 Mask@@2) (MapType0Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert (forall ((Heap@@7 T@U) (this@@5 T@U) ) (!  (=> (and (= (type Heap@@7) (MapType0Type RefType)) (= (type this@@5) RefType)) (and (= (getX Heap@@7 this@@5) (|getX'| Heap@@7 this@@5)) (dummyFunction (int_2_U (|getX#triggerStateless| this@@5)))))
 :qid |stdinbpl.197:15|
 :skolemid |22|
 :pattern ( (getX Heap@@7 this@@5))
)))
(assert (forall ((Heap@@8 T@U) (this@@6 T@U) ) (!  (=> (and (= (type Heap@@8) (MapType0Type RefType)) (= (type this@@6) RefType)) (and (= (getY Heap@@8 this@@6) (|getY'| Heap@@8 this@@6)) (dummyFunction (int_2_U (|getY#triggerStateless| this@@6)))))
 :qid |stdinbpl.285:15|
 :skolemid |26|
 :pattern ( (getY Heap@@8 this@@6))
)))
(assert (forall ((this@@7 T@U) (this2 T@U) ) (!  (=> (and (and (= (type this@@7) RefType) (= (type this2) RefType)) (= (X this@@7) (X this2))) (= this@@7 this2))
 :qid |stdinbpl.387:15|
 :skolemid |33|
 :pattern ( (X this@@7) (X this2))
)))
(assert (forall ((arg0@@27 T@U) ) (! (= (type (|X#sm| arg0@@27)) (FieldType PredicateType_XType (MapType1Type RefType boolType)))
 :qid |funType:X#sm|
 :pattern ( (|X#sm| arg0@@27))
)))
(assert (forall ((this@@8 T@U) (this2@@0 T@U) ) (!  (=> (and (and (= (type this@@8) RefType) (= (type this2@@0) RefType)) (= (|X#sm| this@@8) (|X#sm| this2@@0))) (= this@@8 this2@@0))
 :qid |stdinbpl.391:15|
 :skolemid |34|
 :pattern ( (|X#sm| this@@8) (|X#sm| this2@@0))
)))
(assert (forall ((this@@9 T@U) (this2@@1 T@U) ) (!  (=> (and (and (= (type this@@9) RefType) (= (type this2@@1) RefType)) (= (Y this@@9) (Y this2@@1))) (= this@@9 this2@@1))
 :qid |stdinbpl.441:15|
 :skolemid |39|
 :pattern ( (Y this@@9) (Y this2@@1))
)))
(assert (forall ((arg0@@28 T@U) ) (! (= (type (|Y#sm| arg0@@28)) (FieldType PredicateType_YType (MapType1Type RefType boolType)))
 :qid |funType:Y#sm|
 :pattern ( (|Y#sm| arg0@@28))
)))
(assert (forall ((this@@10 T@U) (this2@@2 T@U) ) (!  (=> (and (and (= (type this@@10) RefType) (= (type this2@@2) RefType)) (= (|Y#sm| this@@10) (|Y#sm| this2@@2))) (= this@@10 this2@@2))
 :qid |stdinbpl.445:15|
 :skolemid |40|
 :pattern ( (|Y#sm| this@@10) (|Y#sm| this2@@2))
)))
(assert (forall ((Heap@@9 T@U) (ExhaleHeap@@2 T@U) (Mask@@3 T@U) (o_1@@0 T@U) (f_2 T@U) ) (! (let ((B@@1 (FieldTypeInv1 (type f_2))))
(let ((A@@1 (FieldTypeInv0 (type f_2))))
 (=> (and (and (and (and (and (and (= (type Heap@@9) (MapType0Type RefType)) (= (type ExhaleHeap@@2) (MapType0Type RefType))) (= (type Mask@@3) (MapType1Type RefType realType))) (= (type o_1@@0) RefType)) (= (type f_2) (FieldType A@@1 B@@1))) (IdenticalOnKnownLocations Heap@@9 ExhaleHeap@@2 Mask@@3)) (HasDirectPerm Mask@@3 o_1@@0 f_2)) (= (MapType0Select Heap@@9 o_1@@0 f_2) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2)))))
 :qid |stdinbpl.42:22|
 :skolemid |1|
 :pattern ( (IdenticalOnKnownLocations Heap@@9 ExhaleHeap@@2 Mask@@3) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2))
)))
(assert  (and (= (type dummyHeap) (MapType0Type RefType)) (= (type ZeroMask) (MapType1Type RefType realType))))
(assert (state dummyHeap ZeroMask))
(assert (forall ((p T@U) (v_1 T@U) (w T@U) ) (! (let ((A@@2 (FieldTypeInv0 (type p))))
 (=> (and (and (= (type p) (FieldType A@@2 FrameTypeType)) (= (type v_1) FrameTypeType)) (= (type w) FrameTypeType)) (not (InsidePredicate p v_1 p w))))
 :qid |stdinbpl.174:19|
 :skolemid |21|
 :pattern ( (InsidePredicate p v_1 p w))
)))
(assert  (not (IsPredicateField x@@8)))
(assert  (not (IsWandField x@@8)))
(assert  (not (IsPredicateField y@@1)))
(assert  (not (IsWandField y@@1)))
(assert (forall ((Heap@@10 T@U) (ExhaleHeap@@3 T@U) (Mask@@4 T@U) ) (!  (=> (and (and (and (= (type Heap@@10) (MapType0Type RefType)) (= (type ExhaleHeap@@3) (MapType0Type RefType))) (= (type Mask@@4) (MapType1Type RefType realType))) (IdenticalOnKnownLocations Heap@@10 ExhaleHeap@@3 Mask@@4)) (succHeap Heap@@10 ExhaleHeap@@3))
 :qid |stdinbpl.83:15|
 :skolemid |10|
 :pattern ( (IdenticalOnKnownLocations Heap@@10 ExhaleHeap@@3 Mask@@4))
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
(assert  (and (forall ((arg0@@29 Real) (arg1@@9 T@U) ) (! (= (type (ConditionalFrame arg0@@29 arg1@@9)) FrameTypeType)
 :qid |funType:ConditionalFrame|
 :pattern ( (ConditionalFrame arg0@@29 arg1@@9))
)) (= (type EmptyFrame) FrameTypeType)))
(assert (forall ((p@@0 Real) (f_6 T@U) ) (!  (=> (= (type f_6) FrameTypeType) (= (ConditionalFrame p@@0 f_6) (ite (> p@@0 0.0) f_6 EmptyFrame)))
 :qid |stdinbpl.162:15|
 :skolemid |19|
 :pattern ( (ConditionalFrame p@@0 f_6))
)))
(assert (forall ((Mask@@5 T@U) (o_2@@0 T@U) (f_4@@0 T@U) ) (! (let ((B@@3 (FieldTypeInv1 (type f_4@@0))))
(let ((A@@4 (FieldTypeInv0 (type f_4@@0))))
 (=> (and (and (= (type Mask@@5) (MapType1Type RefType realType)) (= (type o_2@@0) RefType)) (= (type f_4@@0) (FieldType A@@4 B@@3))) (= (HasDirectPerm Mask@@5 o_2@@0 f_4@@0) (> (U_2_real (MapType1Select Mask@@5 o_2@@0 f_4@@0)) NoPerm)))))
 :qid |stdinbpl.133:22|
 :skolemid |17|
 :pattern ( (HasDirectPerm Mask@@5 o_2@@0 f_4@@0))
)))
(assert (forall ((o_2@@1 T@U) (f_4@@1 T@U) ) (! (let ((B@@4 (FieldTypeInv1 (type f_4@@1))))
(let ((A@@5 (FieldTypeInv0 (type f_4@@1))))
 (=> (and (= (type o_2@@1) RefType) (= (type f_4@@1) (FieldType A@@5 B@@4))) (= (U_2_real (MapType1Select ZeroMask o_2@@1 f_4@@1)) NoPerm))))
 :qid |stdinbpl.106:22|
 :skolemid |13|
 :pattern ( (MapType1Select ZeroMask o_2@@1 f_4@@1))
)))
(assert (forall ((Heap@@11 T@U) (ExhaleHeap@@4 T@U) (Mask@@6 T@U) (pm_f@@1 T@U) ) (! (let ((C@@1 (FieldTypeInv0 (type pm_f@@1))))
 (=> (and (and (and (and (and (= (type Heap@@11) (MapType0Type RefType)) (= (type ExhaleHeap@@4) (MapType0Type RefType))) (= (type Mask@@6) (MapType1Type RefType realType))) (= (type pm_f@@1) (FieldType C@@1 FrameTypeType))) (IdenticalOnKnownLocations Heap@@11 ExhaleHeap@@4 Mask@@6)) (and (HasDirectPerm Mask@@6 null pm_f@@1) (IsPredicateField pm_f@@1))) (forall ((o2 T@U) (f_2@@0 T@U) ) (! (let ((B@@5 (FieldTypeInv1 (type f_2@@0))))
(let ((A@@6 (FieldTypeInv0 (type f_2@@0))))
 (=> (and (and (= (type o2) RefType) (= (type f_2@@0) (FieldType A@@6 B@@5))) (U_2_bool (MapType1Select (MapType0Select Heap@@11 null (PredicateMaskField pm_f@@1)) o2 f_2@@0))) (= (MapType0Select Heap@@11 o2 f_2@@0) (MapType0Select ExhaleHeap@@4 o2 f_2@@0)))))
 :qid |stdinbpl.54:134|
 :skolemid |3|
 :pattern ( (MapType0Select ExhaleHeap@@4 o2 f_2@@0))
))))
 :qid |stdinbpl.52:19|
 :skolemid |4|
 :pattern ( (IdenticalOnKnownLocations Heap@@11 ExhaleHeap@@4 Mask@@6) (IsPredicateField pm_f@@1))
)))
(assert (forall ((Heap@@12 T@U) (ExhaleHeap@@5 T@U) (Mask@@7 T@U) (pm_f@@2 T@U) ) (! (let ((C@@2 (FieldTypeInv0 (type pm_f@@2))))
 (=> (and (and (and (and (and (= (type Heap@@12) (MapType0Type RefType)) (= (type ExhaleHeap@@5) (MapType0Type RefType))) (= (type Mask@@7) (MapType1Type RefType realType))) (= (type pm_f@@2) (FieldType C@@2 FrameTypeType))) (IdenticalOnKnownLocations Heap@@12 ExhaleHeap@@5 Mask@@7)) (and (HasDirectPerm Mask@@7 null pm_f@@2) (IsWandField pm_f@@2))) (forall ((o2@@0 T@U) (f_2@@1 T@U) ) (! (let ((B@@6 (FieldTypeInv1 (type f_2@@1))))
(let ((A@@7 (FieldTypeInv0 (type f_2@@1))))
 (=> (and (and (= (type o2@@0) RefType) (= (type f_2@@1) (FieldType A@@7 B@@6))) (U_2_bool (MapType1Select (MapType0Select Heap@@12 null (WandMaskField pm_f@@2)) o2@@0 f_2@@1))) (= (MapType0Select Heap@@12 o2@@0 f_2@@1) (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1)))))
 :qid |stdinbpl.67:129|
 :skolemid |6|
 :pattern ( (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1))
))))
 :qid |stdinbpl.65:19|
 :skolemid |7|
 :pattern ( (IdenticalOnKnownLocations Heap@@12 ExhaleHeap@@5 Mask@@7) (IsWandField pm_f@@2))
)))
(assert (forall ((this@@11 T@U) ) (!  (=> (= (type this@@11) RefType) (= (getPredWandId (X this@@11)) 0))
 :qid |stdinbpl.381:15|
 :skolemid |32|
 :pattern ( (X this@@11))
)))
(assert (forall ((this@@12 T@U) ) (!  (=> (= (type this@@12) RefType) (= (getPredWandId (Y this@@12)) 1))
 :qid |stdinbpl.435:15|
 :skolemid |38|
 :pattern ( (Y this@@12))
)))
(assert (forall ((Mask@@8 T@U) (o_2@@2 T@U) (f_4@@2 T@U) ) (! (let ((B@@7 (FieldTypeInv1 (type f_4@@2))))
(let ((A@@8 (FieldTypeInv0 (type f_4@@2))))
 (=> (and (and (and (= (type Mask@@8) (MapType1Type RefType realType)) (= (type o_2@@2) RefType)) (= (type f_4@@2) (FieldType A@@8 B@@7))) (GoodMask Mask@@8)) (and (>= (U_2_real (MapType1Select Mask@@8 o_2@@2 f_4@@2)) NoPerm) (=> (and (and (GoodMask Mask@@8) (not (IsPredicateField f_4@@2))) (not (IsWandField f_4@@2))) (<= (U_2_real (MapType1Select Mask@@8 o_2@@2 f_4@@2)) FullPerm))))))
 :qid |stdinbpl.128:22|
 :skolemid |16|
 :pattern ( (GoodMask Mask@@8) (MapType1Select Mask@@8 o_2@@2 f_4@@2))
)))
(assert (forall ((Heap@@13 T@U) (Mask@@9 T@U) (this@@13 T@U) ) (!  (=> (and (and (and (= (type Heap@@13) (MapType0Type RefType)) (= (type Mask@@9) (MapType1Type RefType realType))) (= (type this@@13) RefType)) (state Heap@@13 Mask@@9)) (= (|getX'| Heap@@13 this@@13) (|getX#frame| (MapType0Select Heap@@13 null (X this@@13)) this@@13)))
 :qid |stdinbpl.214:15|
 :skolemid |25|
 :pattern ( (state Heap@@13 Mask@@9) (|getX'| Heap@@13 this@@13))
)))
(assert (forall ((Heap@@14 T@U) (Mask@@10 T@U) (this@@14 T@U) ) (!  (=> (and (and (and (= (type Heap@@14) (MapType0Type RefType)) (= (type Mask@@10) (MapType1Type RefType realType))) (= (type this@@14) RefType)) (state Heap@@14 Mask@@10)) (= (|getY'| Heap@@14 this@@14) (|getY#frame| (MapType0Select Heap@@14 null (Y this@@14)) this@@14)))
 :qid |stdinbpl.302:15|
 :skolemid |29|
 :pattern ( (state Heap@@14 Mask@@10) (|getY'| Heap@@14 this@@14))
)))
(assert (forall ((o T@U) (f T@U) (Heap@@15 T@U) ) (!  (=> (and (and (and (= (type o) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap@@15) (MapType0Type RefType))) (U_2_bool (MapType0Select Heap@@15 o $allocated))) (U_2_bool (MapType0Select Heap@@15 (MapType0Select Heap@@15 o f) $allocated)))
 :qid |stdinbpl.31:15|
 :skolemid |0|
 :pattern ( (MapType0Select Heap@@15 o f))
)))
(assert (forall ((this@@15 T@U) ) (!  (=> (= (type this@@15) RefType) (= (PredicateMaskField (X this@@15)) (|X#sm| this@@15)))
 :qid |stdinbpl.373:15|
 :skolemid |30|
 :pattern ( (PredicateMaskField (X this@@15)))
)))
(assert (forall ((this@@16 T@U) ) (!  (=> (= (type this@@16) RefType) (= (PredicateMaskField (Y this@@16)) (|Y#sm| this@@16)))
 :qid |stdinbpl.427:15|
 :skolemid |36|
 :pattern ( (PredicateMaskField (Y this@@16)))
)))
(assert (forall ((Heap@@16 T@U) (o@@0 T@U) (f_3 T@U) (v T@U) ) (! (let ((B@@8 (type v)))
(let ((A@@9 (FieldTypeInv0 (type f_3))))
 (=> (and (and (= (type Heap@@16) (MapType0Type RefType)) (= (type o@@0) RefType)) (= (type f_3) (FieldType A@@9 B@@8))) (succHeap Heap@@16 (MapType0Store Heap@@16 o@@0 f_3 v)))))
 :qid |stdinbpl.78:22|
 :skolemid |9|
 :pattern ( (MapType0Store Heap@@16 o@@0 f_3 v))
)))
(assert (forall ((Heap@@17 T@U) (Mask@@11 T@U) (this@@17 T@U) ) (!  (=> (and (and (and (= (type Heap@@17) (MapType0Type RefType)) (= (type Mask@@11) (MapType1Type RefType realType))) (= (type this@@17) RefType)) (and (state Heap@@17 Mask@@11) (< AssumeFunctionsAbove 0))) (= (getX Heap@@17 this@@17) (U_2_int (MapType0Select Heap@@17 this@@17 x@@8))))
 :qid |stdinbpl.207:15|
 :skolemid |24|
 :pattern ( (state Heap@@17 Mask@@11) (getX Heap@@17 this@@17))
 :pattern ( (state Heap@@17 Mask@@11) (|getX#triggerStateless| this@@17) (|X#trigger| Heap@@17 (X this@@17)))
)))
(assert (forall ((Heap@@18 T@U) (Mask@@12 T@U) (this@@18 T@U) ) (!  (=> (and (and (and (= (type Heap@@18) (MapType0Type RefType)) (= (type Mask@@12) (MapType1Type RefType realType))) (= (type this@@18) RefType)) (and (state Heap@@18 Mask@@12) (< AssumeFunctionsAbove 1))) (= (getY Heap@@18 this@@18) (U_2_int (MapType0Select Heap@@18 this@@18 y@@1))))
 :qid |stdinbpl.295:15|
 :skolemid |28|
 :pattern ( (state Heap@@18 Mask@@12) (getY Heap@@18 this@@18))
 :pattern ( (state Heap@@18 Mask@@12) (|getY#triggerStateless| this@@18) (|Y#trigger| Heap@@18 (Y this@@18)))
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
 :qid |stdinbpl.169:25|
 :skolemid |20|
 :pattern ( (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun PostMask@1 () T@U)
(declare-fun this@@19 () T@U)
(declare-fun PostHeap@0 () T@U)
(declare-fun PostMask@0 () T@U)
(declare-fun Mask@11 () T@U)
(declare-fun Mask@10 () T@U)
(declare-fun Heap@11 () T@U)
(declare-fun Mask@9 () T@U)
(declare-fun Mask@8 () T@U)
(declare-fun ExhaleHeap@0 () T@U)
(declare-fun Heap@10 () T@U)
(declare-fun newVersion@0 () T@U)
(declare-fun Mask@7 () T@U)
(declare-fun Mask@6 () T@U)
(declare-fun Mask@5 () T@U)
(declare-fun Heap@9 () T@U)
(declare-fun FrameFragment (T@U) T@U)
(declare-fun Heap@8 () T@U)
(declare-fun Heap@5 () T@U)
(declare-fun Heap@6 () T@U)
(declare-fun Heap@7 () T@U)
(declare-fun freshVersion@1 () T@U)
(declare-fun Mask@4 () T@U)
(declare-fun Mask@3 () T@U)
(declare-fun Heap@4 () T@U)
(declare-fun Heap@1 () T@U)
(declare-fun Heap@2 () T@U)
(declare-fun Heap@3 () T@U)
(declare-fun freshVersion@0 () T@U)
(declare-fun Mask@2 () T@U)
(declare-fun Mask@1 () T@U)
(declare-fun Heap@0 () T@U)
(declare-fun Heap@@19 () T@U)
(declare-fun Mask@0 () T@U)
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (= (type Mask@11) (MapType1Type RefType realType)) (= (type Mask@10) (MapType1Type RefType realType))) (= (type this@@19) RefType)) (= (type Heap@11) (MapType0Type RefType))) (= (type Mask@9) (MapType1Type RefType realType))) (= (type Mask@8) (MapType1Type RefType realType))) (= (type Heap@10) (MapType0Type RefType))) (= (type ExhaleHeap@0) (MapType0Type RefType))) (= (type newVersion@0) FrameTypeType)) (= (type Mask@7) (MapType1Type RefType realType))) (= (type Mask@6) (MapType1Type RefType realType))) (= (type Mask@5) (MapType1Type RefType realType))) (= (type Heap@9) (MapType0Type RefType))) (forall ((arg0@@30 T@U) ) (! (= (type (FrameFragment arg0@@30)) FrameTypeType)
 :qid |funType:FrameFragment|
 :pattern ( (FrameFragment arg0@@30))
))) (= (type Heap@8) (MapType0Type RefType))) (= (type Heap@6) (MapType0Type RefType))) (= (type Heap@5) (MapType0Type RefType))) (= (type Heap@7) (MapType0Type RefType))) (= (type freshVersion@1) FrameTypeType)) (= (type Mask@4) (MapType1Type RefType realType))) (= (type Mask@3) (MapType1Type RefType realType))) (= (type Heap@4) (MapType0Type RefType))) (= (type Heap@2) (MapType0Type RefType))) (= (type Heap@1) (MapType0Type RefType))) (= (type Heap@3) (MapType0Type RefType))) (= (type freshVersion@0) FrameTypeType)) (= (type Mask@2) (MapType1Type RefType realType))) (= (type Mask@1) (MapType1Type RefType realType))) (= (type Heap@0) (MapType0Type RefType))) (= (type Heap@@19) (MapType0Type RefType))) (= (type PostMask@1) (MapType1Type RefType realType))) (= (type PostHeap@0) (MapType0Type RefType))) (= (type PostMask@0) (MapType1Type RefType realType))) (= (type Mask@0) (MapType1Type RefType realType))))
(set-info :boogie-vc-id check)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 47) (let ((anon4_correct true))
(let ((anon27_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 43) 40)) anon4_correct)))
(let ((anon27_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 41) (- 0 42)) (<= FullPerm (U_2_real (MapType1Select PostMask@1 null (X this@@19))))) (=> (<= FullPerm (U_2_real (MapType1Select PostMask@1 null (X this@@19)))) (=> (= (ControlFlow 0 41) 40) anon4_correct))))))
(let ((anon26_Else_correct true))
(let ((anon25_Then_correct  (=> (and (and (state PostHeap@0 ZeroMask) (not (= this@@19 null))) (and (= PostMask@0 (MapType1Store ZeroMask this@@19 y@@1 (real_2_U (+ (U_2_real (MapType1Select ZeroMask this@@19 y@@1)) FullPerm)))) (state PostHeap@0 PostMask@0))) (and (=> (= (ControlFlow 0 44) (- 0 45)) (HasDirectPerm PostMask@0 this@@19 y@@1)) (=> (HasDirectPerm PostMask@0 this@@19 y@@1) (=> (= (U_2_int (MapType0Select PostHeap@0 this@@19 y@@1)) 2) (=> (and (and (state PostHeap@0 PostMask@0) (= PostMask@1 (MapType1Store PostMask@0 null (X this@@19) (real_2_U (+ (U_2_real (MapType1Select PostMask@0 null (X this@@19))) FullPerm))))) (and (state PostHeap@0 PostMask@1) (state PostHeap@0 PostMask@1))) (and (and (=> (= (ControlFlow 0 44) 39) anon26_Else_correct) (=> (= (ControlFlow 0 44) 41) anon27_Then_correct)) (=> (= (ControlFlow 0 44) 43) anon27_Else_correct)))))))))
(let ((anon24_correct  (=> (and (= Mask@11 (MapType1Store Mask@10 null (X this@@19) (real_2_U (- (U_2_real (MapType1Select Mask@10 null (X this@@19))) FullPerm)))) (= (ControlFlow 0 2) (- 0 1))) (= (getX Heap@11 this@@19) 3))))
(let ((anon36_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 5) 2)) anon24_correct)))
(let ((anon36_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 3) (- 0 4)) (<= FullPerm (U_2_real (MapType1Select Mask@10 null (X this@@19))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@10 null (X this@@19)))) (=> (= (ControlFlow 0 3) 2) anon24_correct))))))
(let ((anon22_correct  (=> (= Mask@10 (MapType1Store Mask@9 this@@19 y@@1 (real_2_U (- (U_2_real (MapType1Select Mask@9 this@@19 y@@1)) FullPerm)))) (and (=> (= (ControlFlow 0 6) (- 0 7)) (= (U_2_int (MapType0Select Heap@11 this@@19 y@@1)) 2)) (=> (= (U_2_int (MapType0Select Heap@11 this@@19 y@@1)) 2) (and (=> (= (ControlFlow 0 6) 3) anon36_Then_correct) (=> (= (ControlFlow 0 6) 5) anon36_Else_correct)))))))
(let ((anon35_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 10) 6)) anon22_correct)))
(let ((anon35_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 8) (- 0 9)) (<= FullPerm (U_2_real (MapType1Select Mask@9 this@@19 y@@1)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@9 this@@19 y@@1))) (=> (= (ControlFlow 0 8) 6) anon22_correct))))))
(let ((anon20_correct  (=> (not (= this@@19 null)) (=> (and (and (= Mask@9 (MapType1Store Mask@8 this@@19 y@@1 (real_2_U (+ (U_2_real (MapType1Select Mask@8 this@@19 y@@1)) FullPerm)))) (state Heap@11 Mask@9)) (and (state Heap@11 Mask@9) (state Heap@11 Mask@9))) (and (=> (= (ControlFlow 0 11) 8) anon35_Then_correct) (=> (= (ControlFlow 0 11) 10) anon35_Else_correct))))))
(let ((anon34_Else_correct  (=> (HasDirectPerm Mask@8 null (Y this@@19)) (=> (and (= Heap@11 ExhaleHeap@0) (= (ControlFlow 0 13) 11)) anon20_correct))))
(let ((anon34_Then_correct  (=> (and (and (not (HasDirectPerm Mask@8 null (Y this@@19))) (= Heap@10 (MapType0Store ExhaleHeap@0 null (Y this@@19) newVersion@0))) (and (= Heap@11 Heap@10) (= (ControlFlow 0 12) 11))) anon20_correct)))
(let ((anon18_correct  (=> (= Mask@8 (MapType1Store Mask@7 null (Y this@@19) (real_2_U (- (U_2_real (MapType1Select Mask@7 null (Y this@@19))) FullPerm)))) (and (=> (= (ControlFlow 0 14) 12) anon34_Then_correct) (=> (= (ControlFlow 0 14) 13) anon34_Else_correct)))))
(let ((anon33_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 17) 14)) anon18_correct)))
(let ((anon33_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 15) (- 0 16)) (<= FullPerm (U_2_real (MapType1Select Mask@7 null (Y this@@19))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@7 null (Y this@@19)))) (=> (= (ControlFlow 0 15) 14) anon18_correct))))))
(let ((anon16_correct  (=> (and (= Mask@6 (MapType1Store Mask@5 null (X this@@19) (real_2_U (- (U_2_real (MapType1Select Mask@5 null (X this@@19))) FullPerm)))) (IdenticalOnKnownLocations Heap@9 ExhaleHeap@0 Mask@6)) (=> (and (and (and (= Mask@7 (MapType1Store Mask@6 null (X this@@19) (real_2_U (+ (U_2_real (MapType1Select Mask@6 null (X this@@19))) FullPerm)))) (state ExhaleHeap@0 Mask@7)) (and (state ExhaleHeap@0 Mask@7) (= (getX ExhaleHeap@0 this@@19) 3))) (and (and (state ExhaleHeap@0 Mask@7) (state ExhaleHeap@0 Mask@7)) (and (|Y#trigger| ExhaleHeap@0 (Y this@@19)) (= (MapType0Select ExhaleHeap@0 null (Y this@@19)) (FrameFragment (MapType0Select ExhaleHeap@0 this@@19 y@@1)))))) (and (=> (= (ControlFlow 0 18) 15) anon33_Then_correct) (=> (= (ControlFlow 0 18) 17) anon33_Else_correct))))))
(let ((anon32_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 21) 18)) anon16_correct)))
(let ((anon32_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 19) (- 0 20)) (<= FullPerm (U_2_real (MapType1Select Mask@5 null (X this@@19))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@5 null (X this@@19)))) (=> (= (ControlFlow 0 19) 18) anon16_correct))))))
(let ((anon14_correct  (=> (= Heap@9 (MapType0Store Heap@8 null (|Y#sm| this@@19) (MapType1Store (MapType0Select Heap@8 null (|Y#sm| this@@19)) this@@19 y@@1 (bool_2_U true)))) (=> (and (state Heap@9 Mask@5) (state Heap@9 Mask@5)) (and (=> (= (ControlFlow 0 22) 19) anon32_Then_correct) (=> (= (ControlFlow 0 22) 21) anon32_Else_correct))))))
(let ((anon31_Else_correct  (=> (HasDirectPerm Mask@5 null (Y this@@19)) (=> (and (= Heap@8 Heap@5) (= (ControlFlow 0 24) 22)) anon14_correct))))
(let ((anon31_Then_correct  (=> (not (HasDirectPerm Mask@5 null (Y this@@19))) (=> (and (and (= Heap@6 (MapType0Store Heap@5 null (|Y#sm| this@@19) ZeroPMask)) (= Heap@7 (MapType0Store Heap@6 null (Y this@@19) freshVersion@1))) (and (= Heap@8 Heap@7) (= (ControlFlow 0 23) 22))) anon14_correct))))
(let ((anon12_correct  (=> (and (= Mask@4 (MapType1Store Mask@3 this@@19 y@@1 (real_2_U (- (U_2_real (MapType1Select Mask@3 this@@19 y@@1)) FullPerm)))) (= Mask@5 (MapType1Store Mask@4 null (Y this@@19) (real_2_U (+ (U_2_real (MapType1Select Mask@4 null (Y this@@19))) FullPerm))))) (=> (and (and (state Heap@5 Mask@5) (state Heap@5 Mask@5)) (and (|Y#trigger| Heap@5 (Y this@@19)) (= (MapType0Select Heap@5 null (Y this@@19)) (FrameFragment (MapType0Select Heap@5 this@@19 y@@1))))) (and (=> (= (ControlFlow 0 25) 23) anon31_Then_correct) (=> (= (ControlFlow 0 25) 24) anon31_Else_correct))))))
(let ((anon30_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 28) 25)) anon12_correct)))
(let ((anon30_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 26) (- 0 27)) (<= FullPerm (U_2_real (MapType1Select Mask@3 this@@19 y@@1)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@3 this@@19 y@@1))) (=> (= (ControlFlow 0 26) 25) anon12_correct))))))
(let ((anon10_correct  (=> (= Heap@5 (MapType0Store Heap@4 null (|X#sm| this@@19) (MapType1Store (MapType0Select Heap@4 null (|X#sm| this@@19)) this@@19 x@@8 (bool_2_U true)))) (=> (and (state Heap@5 Mask@3) (state Heap@5 Mask@3)) (and (=> (= (ControlFlow 0 29) 26) anon30_Then_correct) (=> (= (ControlFlow 0 29) 28) anon30_Else_correct))))))
(let ((anon29_Else_correct  (=> (HasDirectPerm Mask@3 null (X this@@19)) (=> (and (= Heap@4 Heap@1) (= (ControlFlow 0 31) 29)) anon10_correct))))
(let ((anon29_Then_correct  (=> (not (HasDirectPerm Mask@3 null (X this@@19))) (=> (and (and (= Heap@2 (MapType0Store Heap@1 null (|X#sm| this@@19) ZeroPMask)) (= Heap@3 (MapType0Store Heap@2 null (X this@@19) freshVersion@0))) (and (= Heap@4 Heap@3) (= (ControlFlow 0 30) 29))) anon10_correct))))
(let ((anon8_correct  (=> (and (= Mask@2 (MapType1Store Mask@1 this@@19 x@@8 (real_2_U (- (U_2_real (MapType1Select Mask@1 this@@19 x@@8)) FullPerm)))) (= Mask@3 (MapType1Store Mask@2 null (X this@@19) (real_2_U (+ (U_2_real (MapType1Select Mask@2 null (X this@@19))) FullPerm))))) (=> (and (and (state Heap@1 Mask@3) (state Heap@1 Mask@3)) (and (|X#trigger| Heap@1 (X this@@19)) (= (MapType0Select Heap@1 null (X this@@19)) (FrameFragment (MapType0Select Heap@1 this@@19 x@@8))))) (and (=> (= (ControlFlow 0 32) 30) anon29_Then_correct) (=> (= (ControlFlow 0 32) 31) anon29_Else_correct))))))
(let ((anon28_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 35) 32)) anon8_correct)))
(let ((anon28_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 33) (- 0 34)) (<= FullPerm (U_2_real (MapType1Select Mask@1 this@@19 x@@8)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@1 this@@19 x@@8))) (=> (= (ControlFlow 0 33) 32) anon8_correct))))))
(let ((anon25_Else_correct  (and (=> (= (ControlFlow 0 36) (- 0 38)) (= FullPerm (U_2_real (MapType1Select Mask@1 this@@19 x@@8)))) (=> (= FullPerm (U_2_real (MapType1Select Mask@1 this@@19 x@@8))) (=> (and (= Heap@0 (MapType0Store Heap@@19 this@@19 x@@8 (int_2_U 1))) (state Heap@0 Mask@1)) (and (=> (= (ControlFlow 0 36) (- 0 37)) (= FullPerm (U_2_real (MapType1Select Mask@1 this@@19 y@@1)))) (=> (= FullPerm (U_2_real (MapType1Select Mask@1 this@@19 y@@1))) (=> (and (= Heap@1 (MapType0Store Heap@0 this@@19 y@@1 (int_2_U 2))) (state Heap@1 Mask@1)) (and (=> (= (ControlFlow 0 36) 33) anon28_Then_correct) (=> (= (ControlFlow 0 36) 35) anon28_Else_correct))))))))))
(let ((anon0_correct  (=> (and (state Heap@@19 ZeroMask) (= AssumeFunctionsAbove (- 0 1))) (=> (and (and (and (U_2_bool (MapType0Select Heap@@19 this@@19 $allocated)) (not (= this@@19 null))) (and (= Mask@0 (MapType1Store ZeroMask this@@19 x@@8 (real_2_U (+ (U_2_real (MapType1Select ZeroMask this@@19 x@@8)) FullPerm)))) (state Heap@@19 Mask@0))) (and (and (not (= this@@19 null)) (= Mask@1 (MapType1Store Mask@0 this@@19 y@@1 (real_2_U (+ (U_2_real (MapType1Select Mask@0 this@@19 y@@1)) FullPerm))))) (and (state Heap@@19 Mask@1) (state Heap@@19 Mask@1)))) (and (=> (= (ControlFlow 0 46) 44) anon25_Then_correct) (=> (= (ControlFlow 0 46) 36) anon25_Else_correct))))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 47) 46) anon0_correct)))
PreconditionGeneratedEntry_correct))))))))))))))))))))))))))))))))))))
))
(check-sat)
(pop 1)
; Valid
(get-info :rlimit)
