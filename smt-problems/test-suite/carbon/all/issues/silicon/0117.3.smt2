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
(declare-fun p_1 (T@U) T@U)
(declare-fun PredicateType_pType () T@T)
(declare-fun p1 (T@U) T@U)
(declare-fun PredicateType_p1Type () T@T)
(declare-fun p2 (T@U) T@U)
(declare-fun PredicateType_p2Type () T@T)
(declare-fun |fun'| (T@U T@U) Bool)
(declare-fun dummyFunction (T@U) Bool)
(declare-fun |fun#triggerStateless| (T@U) Bool)
(declare-fun |fun1'| (T@U T@U) Bool)
(declare-fun |fun1#triggerStateless| (T@U) Bool)
(declare-fun |fun2'| (T@U T@U) Bool)
(declare-fun |fun2#triggerStateless| (T@U) Bool)
(declare-fun |p#trigger| (T@U T@U) Bool)
(declare-fun |p#everUsed| (T@U) Bool)
(declare-fun |p1#trigger| (T@U T@U) Bool)
(declare-fun |p1#everUsed| (T@U) Bool)
(declare-fun |p2#trigger| (T@U T@U) Bool)
(declare-fun |p2#everUsed| (T@U) Bool)
(declare-fun $allocated () T@U)
(declare-fun NormalFieldType () T@T)
(declare-fun fun (T@U T@U) Bool)
(declare-fun AssumeFunctionsAbove () Int)
(declare-fun fun2 (T@U T@U) Bool)
(declare-fun fun1 (T@U T@U) Bool)
(declare-fun |p#sm| (T@U) T@U)
(declare-fun |p1#sm| (T@U) T@U)
(declare-fun |p2#sm| (T@U) T@U)
(declare-fun dummyHeap () T@U)
(declare-fun ZeroMask () T@U)
(declare-fun InsidePredicate (T@U T@U T@U T@U) Bool)
(declare-fun sumMask (T@U T@U T@U) Bool)
(declare-fun ConditionalFrame (Real T@U) T@U)
(declare-fun EmptyFrame () T@U)
(declare-fun NoPerm () Real)
(declare-fun |fun#frame| (T@U T@U) Bool)
(declare-fun |fun1#frame| (T@U T@U) Bool)
(declare-fun |fun2#frame| (T@U T@U) Bool)
(declare-fun getPredWandId (T@U) Int)
(declare-fun FullPerm () Real)
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
(assert  (and (= (Ctor PredicateType_pType) 11) (forall ((arg0@@25 T@U) ) (! (= (type (p_1 arg0@@25)) (FieldType PredicateType_pType FrameTypeType))
 :qid |funType:p_1|
 :pattern ( (p_1 arg0@@25))
))))
(assert (forall ((this T@U) ) (!  (=> (= (type this) RefType) (IsPredicateField (p_1 this)))
 :qid |stdinbpl.362:15|
 :skolemid |35|
 :pattern ( (p_1 this))
)))
(assert  (and (= (Ctor PredicateType_p1Type) 12) (forall ((arg0@@26 T@U) ) (! (= (type (p1 arg0@@26)) (FieldType PredicateType_p1Type FrameTypeType))
 :qid |funType:p1|
 :pattern ( (p1 arg0@@26))
))))
(assert (forall ((this@@0 T@U) ) (!  (=> (= (type this@@0) RefType) (IsPredicateField (p1 this@@0)))
 :qid |stdinbpl.415:15|
 :skolemid |41|
 :pattern ( (p1 this@@0))
)))
(assert  (and (= (Ctor PredicateType_p2Type) 13) (forall ((arg0@@27 T@U) ) (! (= (type (p2 arg0@@27)) (FieldType PredicateType_p2Type FrameTypeType))
 :qid |funType:p2|
 :pattern ( (p2 arg0@@27))
))))
(assert (forall ((this@@1 T@U) ) (!  (=> (= (type this@@1) RefType) (IsPredicateField (p2 this@@1)))
 :qid |stdinbpl.468:15|
 :skolemid |47|
 :pattern ( (p2 this@@1))
)))
(assert (forall ((Heap@@2 T@U) (this@@2 T@U) ) (!  (=> (and (= (type Heap@@2) (MapType0Type RefType)) (= (type this@@2) RefType)) (dummyFunction (bool_2_U (|fun#triggerStateless| this@@2))))
 :qid |stdinbpl.191:15|
 :skolemid |23|
 :pattern ( (|fun'| Heap@@2 this@@2))
)))
(assert (forall ((Heap@@3 T@U) (this@@3 T@U) ) (!  (=> (and (= (type Heap@@3) (MapType0Type RefType)) (= (type this@@3) RefType)) (dummyFunction (bool_2_U (|fun1#triggerStateless| this@@3))))
 :qid |stdinbpl.248:15|
 :skolemid |27|
 :pattern ( (|fun1'| Heap@@3 this@@3))
)))
(assert (forall ((Heap@@4 T@U) (this@@4 T@U) ) (!  (=> (and (= (type Heap@@4) (MapType0Type RefType)) (= (type this@@4) RefType)) (dummyFunction (bool_2_U (|fun2#triggerStateless| this@@4))))
 :qid |stdinbpl.305:15|
 :skolemid |31|
 :pattern ( (|fun2'| Heap@@4 this@@4))
)))
(assert (forall ((Heap@@5 T@U) (this@@5 T@U) ) (!  (=> (and (= (type Heap@@5) (MapType0Type RefType)) (= (type this@@5) RefType)) (|p#everUsed| (p_1 this@@5)))
 :qid |stdinbpl.381:15|
 :skolemid |39|
 :pattern ( (|p#trigger| Heap@@5 (p_1 this@@5)))
)))
(assert (forall ((Heap@@6 T@U) (this@@6 T@U) ) (!  (=> (and (= (type Heap@@6) (MapType0Type RefType)) (= (type this@@6) RefType)) (|p1#everUsed| (p1 this@@6)))
 :qid |stdinbpl.434:15|
 :skolemid |45|
 :pattern ( (|p1#trigger| Heap@@6 (p1 this@@6)))
)))
(assert (forall ((Heap@@7 T@U) (this@@7 T@U) ) (!  (=> (and (= (type Heap@@7) (MapType0Type RefType)) (= (type this@@7) RefType)) (|p2#everUsed| (p2 this@@7)))
 :qid |stdinbpl.487:15|
 :skolemid |51|
 :pattern ( (|p2#trigger| Heap@@7 (p2 this@@7)))
)))
(assert  (and (= (Ctor NormalFieldType) 14) (= (type $allocated) (FieldType NormalFieldType boolType))))
(assert (forall ((Heap@@8 T@U) (ExhaleHeap@@1 T@U) (Mask@@2 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@8) (MapType0Type RefType)) (= (type ExhaleHeap@@1) (MapType0Type RefType))) (= (type Mask@@2) (MapType1Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@8 ExhaleHeap@@1 Mask@@2)) (U_2_bool (MapType0Select Heap@@8 o_1 $allocated))) (U_2_bool (MapType0Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.73:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@8 ExhaleHeap@@1 Mask@@2) (MapType0Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert (forall ((Heap@@9 T@U) (Mask@@3 T@U) (this@@8 T@U) ) (!  (=> (and (and (and (= (type Heap@@9) (MapType0Type RefType)) (= (type Mask@@3) (MapType1Type RefType realType))) (= (type this@@8) RefType)) (and (state Heap@@9 Mask@@3) (< AssumeFunctionsAbove 0))) (fun Heap@@9 this@@8))
 :qid |stdinbpl.197:15|
 :skolemid |24|
 :pattern ( (state Heap@@9 Mask@@3) (fun Heap@@9 this@@8))
 :pattern ( (state Heap@@9 Mask@@3) (|fun#triggerStateless| this@@8) (|p#trigger| Heap@@9 (p_1 this@@8)))
)))
(assert (forall ((Heap@@10 T@U) (Mask@@4 T@U) (this@@9 T@U) ) (!  (=> (and (and (and (= (type Heap@@10) (MapType0Type RefType)) (= (type Mask@@4) (MapType1Type RefType realType))) (= (type this@@9) RefType)) (and (state Heap@@10 Mask@@4) (< AssumeFunctionsAbove 1))) (fun2 Heap@@10 this@@9))
 :qid |stdinbpl.311:15|
 :skolemid |32|
 :pattern ( (state Heap@@10 Mask@@4) (fun2 Heap@@10 this@@9))
 :pattern ( (state Heap@@10 Mask@@4) (|fun2#triggerStateless| this@@9) (|p2#trigger| Heap@@10 (p2 this@@9)))
)))
(assert (forall ((Heap@@11 T@U) (Mask@@5 T@U) (this@@10 T@U) ) (!  (=> (and (and (and (= (type Heap@@11) (MapType0Type RefType)) (= (type Mask@@5) (MapType1Type RefType realType))) (= (type this@@10) RefType)) (and (state Heap@@11 Mask@@5) (< AssumeFunctionsAbove 2))) (fun1 Heap@@11 this@@10))
 :qid |stdinbpl.254:15|
 :skolemid |28|
 :pattern ( (state Heap@@11 Mask@@5) (fun1 Heap@@11 this@@10))
 :pattern ( (state Heap@@11 Mask@@5) (|fun1#triggerStateless| this@@10) (|p1#trigger| Heap@@11 (p1 this@@10)))
)))
(assert (forall ((this@@11 T@U) (this2 T@U) ) (!  (=> (and (and (= (type this@@11) RefType) (= (type this2) RefType)) (= (p_1 this@@11) (p_1 this2))) (= this@@11 this2))
 :qid |stdinbpl.372:15|
 :skolemid |37|
 :pattern ( (p_1 this@@11) (p_1 this2))
)))
(assert (forall ((arg0@@28 T@U) ) (! (= (type (|p#sm| arg0@@28)) (FieldType PredicateType_pType (MapType1Type RefType boolType)))
 :qid |funType:p#sm|
 :pattern ( (|p#sm| arg0@@28))
)))
(assert (forall ((this@@12 T@U) (this2@@0 T@U) ) (!  (=> (and (and (= (type this@@12) RefType) (= (type this2@@0) RefType)) (= (|p#sm| this@@12) (|p#sm| this2@@0))) (= this@@12 this2@@0))
 :qid |stdinbpl.376:15|
 :skolemid |38|
 :pattern ( (|p#sm| this@@12) (|p#sm| this2@@0))
)))
(assert (forall ((this@@13 T@U) (this2@@1 T@U) ) (!  (=> (and (and (= (type this@@13) RefType) (= (type this2@@1) RefType)) (= (p1 this@@13) (p1 this2@@1))) (= this@@13 this2@@1))
 :qid |stdinbpl.425:15|
 :skolemid |43|
 :pattern ( (p1 this@@13) (p1 this2@@1))
)))
(assert (forall ((arg0@@29 T@U) ) (! (= (type (|p1#sm| arg0@@29)) (FieldType PredicateType_p1Type (MapType1Type RefType boolType)))
 :qid |funType:p1#sm|
 :pattern ( (|p1#sm| arg0@@29))
)))
(assert (forall ((this@@14 T@U) (this2@@2 T@U) ) (!  (=> (and (and (= (type this@@14) RefType) (= (type this2@@2) RefType)) (= (|p1#sm| this@@14) (|p1#sm| this2@@2))) (= this@@14 this2@@2))
 :qid |stdinbpl.429:15|
 :skolemid |44|
 :pattern ( (|p1#sm| this@@14) (|p1#sm| this2@@2))
)))
(assert (forall ((this@@15 T@U) (this2@@3 T@U) ) (!  (=> (and (and (= (type this@@15) RefType) (= (type this2@@3) RefType)) (= (p2 this@@15) (p2 this2@@3))) (= this@@15 this2@@3))
 :qid |stdinbpl.478:15|
 :skolemid |49|
 :pattern ( (p2 this@@15) (p2 this2@@3))
)))
(assert (forall ((arg0@@30 T@U) ) (! (= (type (|p2#sm| arg0@@30)) (FieldType PredicateType_p2Type (MapType1Type RefType boolType)))
 :qid |funType:p2#sm|
 :pattern ( (|p2#sm| arg0@@30))
)))
(assert (forall ((this@@16 T@U) (this2@@4 T@U) ) (!  (=> (and (and (= (type this@@16) RefType) (= (type this2@@4) RefType)) (= (|p2#sm| this@@16) (|p2#sm| this2@@4))) (= this@@16 this2@@4))
 :qid |stdinbpl.482:15|
 :skolemid |50|
 :pattern ( (|p2#sm| this@@16) (|p2#sm| this2@@4))
)))
(assert (forall ((Heap@@12 T@U) (ExhaleHeap@@2 T@U) (Mask@@6 T@U) (o_1@@0 T@U) (f_2 T@U) ) (! (let ((B@@1 (FieldTypeInv1 (type f_2))))
(let ((A@@1 (FieldTypeInv0 (type f_2))))
 (=> (and (and (and (and (and (and (= (type Heap@@12) (MapType0Type RefType)) (= (type ExhaleHeap@@2) (MapType0Type RefType))) (= (type Mask@@6) (MapType1Type RefType realType))) (= (type o_1@@0) RefType)) (= (type f_2) (FieldType A@@1 B@@1))) (IdenticalOnKnownLocations Heap@@12 ExhaleHeap@@2 Mask@@6)) (HasDirectPerm Mask@@6 o_1@@0 f_2)) (= (MapType0Select Heap@@12 o_1@@0 f_2) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2)))))
 :qid |stdinbpl.42:22|
 :skolemid |1|
 :pattern ( (IdenticalOnKnownLocations Heap@@12 ExhaleHeap@@2 Mask@@6) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2))
)))
(assert  (and (= (type dummyHeap) (MapType0Type RefType)) (= (type ZeroMask) (MapType1Type RefType realType))))
(assert (state dummyHeap ZeroMask))
(assert (forall ((p T@U) (v_1 T@U) (w T@U) ) (! (let ((A@@2 (FieldTypeInv0 (type p))))
 (=> (and (and (= (type p) (FieldType A@@2 FrameTypeType)) (= (type v_1) FrameTypeType)) (= (type w) FrameTypeType)) (not (InsidePredicate p v_1 p w))))
 :qid |stdinbpl.175:19|
 :skolemid |21|
 :pattern ( (InsidePredicate p v_1 p w))
)))
(assert (forall ((Heap@@13 T@U) (ExhaleHeap@@3 T@U) (Mask@@7 T@U) ) (!  (=> (and (and (and (= (type Heap@@13) (MapType0Type RefType)) (= (type ExhaleHeap@@3) (MapType0Type RefType))) (= (type Mask@@7) (MapType1Type RefType realType))) (IdenticalOnKnownLocations Heap@@13 ExhaleHeap@@3 Mask@@7)) (succHeap Heap@@13 ExhaleHeap@@3))
 :qid |stdinbpl.83:15|
 :skolemid |10|
 :pattern ( (IdenticalOnKnownLocations Heap@@13 ExhaleHeap@@3 Mask@@7))
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
(assert  (and (forall ((arg0@@31 Real) (arg1@@9 T@U) ) (! (= (type (ConditionalFrame arg0@@31 arg1@@9)) FrameTypeType)
 :qid |funType:ConditionalFrame|
 :pattern ( (ConditionalFrame arg0@@31 arg1@@9))
)) (= (type EmptyFrame) FrameTypeType)))
(assert (forall ((p@@0 Real) (f_6 T@U) ) (!  (=> (= (type f_6) FrameTypeType) (= (ConditionalFrame p@@0 f_6) (ite (> p@@0 0.0) f_6 EmptyFrame)))
 :qid |stdinbpl.163:15|
 :skolemid |19|
 :pattern ( (ConditionalFrame p@@0 f_6))
)))
(assert (forall ((Mask@@8 T@U) (o_2@@0 T@U) (f_4@@0 T@U) ) (! (let ((B@@3 (FieldTypeInv1 (type f_4@@0))))
(let ((A@@4 (FieldTypeInv0 (type f_4@@0))))
 (=> (and (and (= (type Mask@@8) (MapType1Type RefType realType)) (= (type o_2@@0) RefType)) (= (type f_4@@0) (FieldType A@@4 B@@3))) (= (HasDirectPerm Mask@@8 o_2@@0 f_4@@0) (> (U_2_real (MapType1Select Mask@@8 o_2@@0 f_4@@0)) NoPerm)))))
 :qid |stdinbpl.133:22|
 :skolemid |17|
 :pattern ( (HasDirectPerm Mask@@8 o_2@@0 f_4@@0))
)))
(assert (forall ((o_2@@1 T@U) (f_4@@1 T@U) ) (! (let ((B@@4 (FieldTypeInv1 (type f_4@@1))))
(let ((A@@5 (FieldTypeInv0 (type f_4@@1))))
 (=> (and (= (type o_2@@1) RefType) (= (type f_4@@1) (FieldType A@@5 B@@4))) (= (U_2_real (MapType1Select ZeroMask o_2@@1 f_4@@1)) NoPerm))))
 :qid |stdinbpl.106:22|
 :skolemid |13|
 :pattern ( (MapType1Select ZeroMask o_2@@1 f_4@@1))
)))
(assert (forall ((Heap@@14 T@U) (Mask@@9 T@U) (this@@17 T@U) ) (!  (=> (and (and (and (= (type Heap@@14) (MapType0Type RefType)) (= (type Mask@@9) (MapType1Type RefType realType))) (= (type this@@17) RefType)) (state Heap@@14 Mask@@9)) (= (|fun'| Heap@@14 this@@17) (|fun#frame| (MapType0Select Heap@@14 null (p_1 this@@17)) this@@17)))
 :qid |stdinbpl.204:15|
 :skolemid |25|
 :pattern ( (state Heap@@14 Mask@@9) (|fun'| Heap@@14 this@@17))
)))
(assert (forall ((Heap@@15 T@U) (Mask@@10 T@U) (this@@18 T@U) ) (!  (=> (and (and (and (= (type Heap@@15) (MapType0Type RefType)) (= (type Mask@@10) (MapType1Type RefType realType))) (= (type this@@18) RefType)) (state Heap@@15 Mask@@10)) (= (|fun1'| Heap@@15 this@@18) (|fun1#frame| (MapType0Select Heap@@15 null (p1 this@@18)) this@@18)))
 :qid |stdinbpl.261:15|
 :skolemid |29|
 :pattern ( (state Heap@@15 Mask@@10) (|fun1'| Heap@@15 this@@18))
)))
(assert (forall ((Heap@@16 T@U) (Mask@@11 T@U) (this@@19 T@U) ) (!  (=> (and (and (and (= (type Heap@@16) (MapType0Type RefType)) (= (type Mask@@11) (MapType1Type RefType realType))) (= (type this@@19) RefType)) (state Heap@@16 Mask@@11)) (= (|fun2'| Heap@@16 this@@19) (|fun2#frame| (MapType0Select Heap@@16 null (p2 this@@19)) this@@19)))
 :qid |stdinbpl.318:15|
 :skolemid |33|
 :pattern ( (state Heap@@16 Mask@@11) (|fun2'| Heap@@16 this@@19))
)))
(assert (forall ((Heap@@17 T@U) (this@@20 T@U) ) (!  (=> (and (= (type Heap@@17) (MapType0Type RefType)) (= (type this@@20) RefType)) (and (= (fun Heap@@17 this@@20) (|fun'| Heap@@17 this@@20)) (dummyFunction (bool_2_U (|fun#triggerStateless| this@@20)))))
 :qid |stdinbpl.187:15|
 :skolemid |22|
 :pattern ( (fun Heap@@17 this@@20))
)))
(assert (forall ((Heap@@18 T@U) (this@@21 T@U) ) (!  (=> (and (= (type Heap@@18) (MapType0Type RefType)) (= (type this@@21) RefType)) (and (= (fun1 Heap@@18 this@@21) (|fun1'| Heap@@18 this@@21)) (dummyFunction (bool_2_U (|fun1#triggerStateless| this@@21)))))
 :qid |stdinbpl.244:15|
 :skolemid |26|
 :pattern ( (fun1 Heap@@18 this@@21))
)))
(assert (forall ((Heap@@19 T@U) (this@@22 T@U) ) (!  (=> (and (= (type Heap@@19) (MapType0Type RefType)) (= (type this@@22) RefType)) (and (= (fun2 Heap@@19 this@@22) (|fun2'| Heap@@19 this@@22)) (dummyFunction (bool_2_U (|fun2#triggerStateless| this@@22)))))
 :qid |stdinbpl.301:15|
 :skolemid |30|
 :pattern ( (fun2 Heap@@19 this@@22))
)))
(assert (forall ((Heap@@20 T@U) (ExhaleHeap@@4 T@U) (Mask@@12 T@U) (pm_f@@1 T@U) ) (! (let ((C@@1 (FieldTypeInv0 (type pm_f@@1))))
 (=> (and (and (and (and (and (= (type Heap@@20) (MapType0Type RefType)) (= (type ExhaleHeap@@4) (MapType0Type RefType))) (= (type Mask@@12) (MapType1Type RefType realType))) (= (type pm_f@@1) (FieldType C@@1 FrameTypeType))) (IdenticalOnKnownLocations Heap@@20 ExhaleHeap@@4 Mask@@12)) (and (HasDirectPerm Mask@@12 null pm_f@@1) (IsPredicateField pm_f@@1))) (forall ((o2 T@U) (f_2@@0 T@U) ) (! (let ((B@@5 (FieldTypeInv1 (type f_2@@0))))
(let ((A@@6 (FieldTypeInv0 (type f_2@@0))))
 (=> (and (and (= (type o2) RefType) (= (type f_2@@0) (FieldType A@@6 B@@5))) (U_2_bool (MapType1Select (MapType0Select Heap@@20 null (PredicateMaskField pm_f@@1)) o2 f_2@@0))) (= (MapType0Select Heap@@20 o2 f_2@@0) (MapType0Select ExhaleHeap@@4 o2 f_2@@0)))))
 :qid |stdinbpl.54:134|
 :skolemid |3|
 :pattern ( (MapType0Select ExhaleHeap@@4 o2 f_2@@0))
))))
 :qid |stdinbpl.52:19|
 :skolemid |4|
 :pattern ( (IdenticalOnKnownLocations Heap@@20 ExhaleHeap@@4 Mask@@12) (IsPredicateField pm_f@@1))
)))
(assert (forall ((Heap@@21 T@U) (ExhaleHeap@@5 T@U) (Mask@@13 T@U) (pm_f@@2 T@U) ) (! (let ((C@@2 (FieldTypeInv0 (type pm_f@@2))))
 (=> (and (and (and (and (and (= (type Heap@@21) (MapType0Type RefType)) (= (type ExhaleHeap@@5) (MapType0Type RefType))) (= (type Mask@@13) (MapType1Type RefType realType))) (= (type pm_f@@2) (FieldType C@@2 FrameTypeType))) (IdenticalOnKnownLocations Heap@@21 ExhaleHeap@@5 Mask@@13)) (and (HasDirectPerm Mask@@13 null pm_f@@2) (IsWandField pm_f@@2))) (forall ((o2@@0 T@U) (f_2@@1 T@U) ) (! (let ((B@@6 (FieldTypeInv1 (type f_2@@1))))
(let ((A@@7 (FieldTypeInv0 (type f_2@@1))))
 (=> (and (and (= (type o2@@0) RefType) (= (type f_2@@1) (FieldType A@@7 B@@6))) (U_2_bool (MapType1Select (MapType0Select Heap@@21 null (WandMaskField pm_f@@2)) o2@@0 f_2@@1))) (= (MapType0Select Heap@@21 o2@@0 f_2@@1) (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1)))))
 :qid |stdinbpl.67:129|
 :skolemid |6|
 :pattern ( (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1))
))))
 :qid |stdinbpl.65:19|
 :skolemid |7|
 :pattern ( (IdenticalOnKnownLocations Heap@@21 ExhaleHeap@@5 Mask@@13) (IsWandField pm_f@@2))
)))
(assert (forall ((this@@23 T@U) ) (!  (=> (= (type this@@23) RefType) (= (getPredWandId (p_1 this@@23)) 0))
 :qid |stdinbpl.366:15|
 :skolemid |36|
 :pattern ( (p_1 this@@23))
)))
(assert (forall ((this@@24 T@U) ) (!  (=> (= (type this@@24) RefType) (= (getPredWandId (p1 this@@24)) 1))
 :qid |stdinbpl.419:15|
 :skolemid |42|
 :pattern ( (p1 this@@24))
)))
(assert (forall ((this@@25 T@U) ) (!  (=> (= (type this@@25) RefType) (= (getPredWandId (p2 this@@25)) 2))
 :qid |stdinbpl.472:15|
 :skolemid |48|
 :pattern ( (p2 this@@25))
)))
(assert (forall ((Mask@@14 T@U) (o_2@@2 T@U) (f_4@@2 T@U) ) (! (let ((B@@7 (FieldTypeInv1 (type f_4@@2))))
(let ((A@@8 (FieldTypeInv0 (type f_4@@2))))
 (=> (and (and (and (= (type Mask@@14) (MapType1Type RefType realType)) (= (type o_2@@2) RefType)) (= (type f_4@@2) (FieldType A@@8 B@@7))) (GoodMask Mask@@14)) (and (>= (U_2_real (MapType1Select Mask@@14 o_2@@2 f_4@@2)) NoPerm) (=> (and (and (GoodMask Mask@@14) (not (IsPredicateField f_4@@2))) (not (IsWandField f_4@@2))) (<= (U_2_real (MapType1Select Mask@@14 o_2@@2 f_4@@2)) FullPerm))))))
 :qid |stdinbpl.128:22|
 :skolemid |16|
 :pattern ( (GoodMask Mask@@14) (MapType1Select Mask@@14 o_2@@2 f_4@@2))
)))
(assert (forall ((o T@U) (f T@U) (Heap@@22 T@U) ) (!  (=> (and (and (and (= (type o) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap@@22) (MapType0Type RefType))) (U_2_bool (MapType0Select Heap@@22 o $allocated))) (U_2_bool (MapType0Select Heap@@22 (MapType0Select Heap@@22 o f) $allocated)))
 :qid |stdinbpl.31:15|
 :skolemid |0|
 :pattern ( (MapType0Select Heap@@22 o f))
)))
(assert (forall ((this@@26 T@U) ) (!  (=> (= (type this@@26) RefType) (= (PredicateMaskField (p_1 this@@26)) (|p#sm| this@@26)))
 :qid |stdinbpl.358:15|
 :skolemid |34|
 :pattern ( (PredicateMaskField (p_1 this@@26)))
)))
(assert (forall ((this@@27 T@U) ) (!  (=> (= (type this@@27) RefType) (= (PredicateMaskField (p1 this@@27)) (|p1#sm| this@@27)))
 :qid |stdinbpl.411:15|
 :skolemid |40|
 :pattern ( (PredicateMaskField (p1 this@@27)))
)))
(assert (forall ((this@@28 T@U) ) (!  (=> (= (type this@@28) RefType) (= (PredicateMaskField (p2 this@@28)) (|p2#sm| this@@28)))
 :qid |stdinbpl.464:15|
 :skolemid |46|
 :pattern ( (PredicateMaskField (p2 this@@28)))
)))
(assert (forall ((Heap@@23 T@U) (o@@0 T@U) (f_3 T@U) (v T@U) ) (! (let ((B@@8 (type v)))
(let ((A@@9 (FieldTypeInv0 (type f_3))))
 (=> (and (and (= (type Heap@@23) (MapType0Type RefType)) (= (type o@@0) RefType)) (= (type f_3) (FieldType A@@9 B@@8))) (succHeap Heap@@23 (MapType0Store Heap@@23 o@@0 f_3 v)))))
 :qid |stdinbpl.78:22|
 :skolemid |9|
 :pattern ( (MapType0Store Heap@@23 o@@0 f_3 v))
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
 :qid |stdinbpl.170:25|
 :skolemid |20|
 :pattern ( (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
(push 1)
(declare-fun ControlFlow (Int Int) Int)
(set-info :boogie-vc-id |fun2#definedness|)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 2) true)
))
(check-sat)
(pop 1)
; Valid
(get-info :rlimit)
