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
(declare-fun next () T@U)
(declare-fun value () T@U)
(declare-fun FieldType (T@T T@T) T@T)
(declare-fun FieldTypeInv0 (T@T) T@T)
(declare-fun FieldTypeInv1 (T@T) T@T)
(declare-fun NormalFieldType () T@T)
(declare-fun RefType () T@T)
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
(declare-fun IdenticalOnKnownLocations (T@U T@U T@U) Bool)
(declare-fun IsPredicateField (T@U) Bool)
(declare-fun null () T@U)
(declare-fun PredicateMaskField (T@U) T@U)
(declare-fun FrameTypeType () T@T)
(declare-fun HasDirectPerm (T@U T@U T@U) Bool)
(declare-fun IsWandField (T@U) Bool)
(declare-fun WandMaskField (T@U) T@U)
(declare-fun valid (T@U) T@U)
(declare-fun PredicateType_validType () T@T)
(declare-fun p_1 (T@U) T@U)
(declare-fun PredicateType_pType () T@T)
(declare-fun q_1 (T@U) T@U)
(declare-fun PredicateType_qType () T@T)
(declare-fun |getNext'| (T@U T@U) T@U)
(declare-fun dummyFunction (T@U) Bool)
(declare-fun |getNext#triggerStateless| (T@U) T@U)
(declare-fun |valid#trigger| (T@U T@U) Bool)
(declare-fun |valid#everUsed| (T@U) Bool)
(declare-fun |p#trigger| (T@U T@U) Bool)
(declare-fun |p#everUsed| (T@U) Bool)
(declare-fun |q#trigger| (T@U T@U) Bool)
(declare-fun |q#everUsed| (T@U) Bool)
(declare-fun getNext (T@U T@U) T@U)
(declare-fun |valid#sm| (T@U) T@U)
(declare-fun |p#sm| (T@U) T@U)
(declare-fun |q#sm| (T@U) T@U)
(declare-fun dummyHeap () T@U)
(declare-fun ZeroMask () T@U)
(declare-fun InsidePredicate (T@U T@U T@U T@U) Bool)
(declare-fun sumMask (T@U T@U T@U) Bool)
(declare-fun ConditionalFrame (Real T@U) T@U)
(declare-fun EmptyFrame () T@U)
(declare-fun NoPerm () Real)
(declare-fun getPredWandId (T@U) Int)
(declare-fun FullPerm () Real)
(declare-fun |getNext#frame| (T@U T@U) T@U)
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
(assert  (and (and (and (and (and (and (and (forall ((arg0@@11 T@T) (arg1 T@T) ) (! (= (Ctor (FieldType arg0@@11 arg1)) 6)
 :qid |ctor:FieldType|
)) (forall ((arg0@@12 T@T) (arg1@@0 T@T) ) (! (= (FieldTypeInv0 (FieldType arg0@@12 arg1@@0)) arg0@@12)
 :qid |typeInv:FieldTypeInv0|
 :pattern ( (FieldType arg0@@12 arg1@@0))
))) (forall ((arg0@@13 T@T) (arg1@@1 T@T) ) (! (= (FieldTypeInv1 (FieldType arg0@@13 arg1@@1)) arg1@@1)
 :qid |typeInv:FieldTypeInv1|
 :pattern ( (FieldType arg0@@13 arg1@@1))
))) (= (Ctor NormalFieldType) 7)) (= (type $allocated) (FieldType NormalFieldType boolType))) (= (Ctor RefType) 8)) (= (type next) (FieldType NormalFieldType RefType))) (= (type value) (FieldType NormalFieldType intType))))
(assert (distinct $allocated next value)
)
(assert  (and (and (and (and (and (forall ((arg0@@14 T@T) ) (! (= (Ctor (MapType0Type arg0@@14)) 9)
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
)))))
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
(assert  (and (= (Ctor PredicateType_validType) 12) (forall ((arg0@@25 T@U) ) (! (= (type (valid arg0@@25)) (FieldType PredicateType_validType FrameTypeType))
 :qid |funType:valid|
 :pattern ( (valid arg0@@25))
))))
(assert (forall ((this T@U) ) (!  (=> (= (type this) RefType) (IsPredicateField (valid this)))
 :qid |stdinbpl.314:15|
 :skolemid |28|
 :pattern ( (valid this))
)))
(assert  (and (= (Ctor PredicateType_pType) 13) (forall ((arg0@@26 T@U) ) (! (= (type (p_1 arg0@@26)) (FieldType PredicateType_pType FrameTypeType))
 :qid |funType:p_1|
 :pattern ( (p_1 arg0@@26))
))))
(assert (forall ((this@@0 T@U) ) (!  (=> (= (type this@@0) RefType) (IsPredicateField (p_1 this@@0)))
 :qid |stdinbpl.389:15|
 :skolemid |34|
 :pattern ( (p_1 this@@0))
)))
(assert  (and (= (Ctor PredicateType_qType) 14) (forall ((arg0@@27 T@U) ) (! (= (type (q_1 arg0@@27)) (FieldType PredicateType_qType FrameTypeType))
 :qid |funType:q_1|
 :pattern ( (q_1 arg0@@27))
))))
(assert (forall ((this@@1 T@U) ) (!  (=> (= (type this@@1) RefType) (IsPredicateField (q_1 this@@1)))
 :qid |stdinbpl.464:15|
 :skolemid |40|
 :pattern ( (q_1 this@@1))
)))
(assert  (and (forall ((arg0@@28 T@U) (arg1@@9 T@U) ) (! (= (type (|getNext'| arg0@@28 arg1@@9)) RefType)
 :qid |funType:getNext'|
 :pattern ( (|getNext'| arg0@@28 arg1@@9))
)) (forall ((arg0@@29 T@U) ) (! (= (type (|getNext#triggerStateless| arg0@@29)) RefType)
 :qid |funType:getNext#triggerStateless|
 :pattern ( (|getNext#triggerStateless| arg0@@29))
))))
(assert (forall ((Heap@@2 T@U) (this@@2 T@U) ) (!  (=> (and (= (type Heap@@2) (MapType0Type RefType)) (= (type this@@2) RefType)) (dummyFunction (|getNext#triggerStateless| this@@2)))
 :qid |stdinbpl.200:15|
 :skolemid |23|
 :pattern ( (|getNext'| Heap@@2 this@@2))
)))
(assert (forall ((Heap@@3 T@U) (this@@3 T@U) ) (!  (=> (and (= (type Heap@@3) (MapType0Type RefType)) (= (type this@@3) RefType)) (|valid#everUsed| (valid this@@3)))
 :qid |stdinbpl.333:15|
 :skolemid |32|
 :pattern ( (|valid#trigger| Heap@@3 (valid this@@3)))
)))
(assert (forall ((Heap@@4 T@U) (this@@4 T@U) ) (!  (=> (and (= (type Heap@@4) (MapType0Type RefType)) (= (type this@@4) RefType)) (|p#everUsed| (p_1 this@@4)))
 :qid |stdinbpl.408:15|
 :skolemid |38|
 :pattern ( (|p#trigger| Heap@@4 (p_1 this@@4)))
)))
(assert (forall ((Heap@@5 T@U) (this@@5 T@U) ) (!  (=> (and (= (type Heap@@5) (MapType0Type RefType)) (= (type this@@5) RefType)) (|q#everUsed| (q_1 this@@5)))
 :qid |stdinbpl.483:15|
 :skolemid |44|
 :pattern ( (|q#trigger| Heap@@5 (q_1 this@@5)))
)))
(assert (forall ((Heap@@6 T@U) (ExhaleHeap@@1 T@U) (Mask@@2 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@6) (MapType0Type RefType)) (= (type ExhaleHeap@@1) (MapType0Type RefType))) (= (type Mask@@2) (MapType1Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@6 ExhaleHeap@@1 Mask@@2)) (U_2_bool (MapType0Select Heap@@6 o_1 $allocated))) (U_2_bool (MapType0Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.73:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@6 ExhaleHeap@@1 Mask@@2) (MapType0Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert (forall ((arg0@@30 T@U) (arg1@@10 T@U) ) (! (= (type (getNext arg0@@30 arg1@@10)) RefType)
 :qid |funType:getNext|
 :pattern ( (getNext arg0@@30 arg1@@10))
)))
(assert (forall ((Heap@@7 T@U) (this@@6 T@U) ) (!  (=> (and (= (type Heap@@7) (MapType0Type RefType)) (= (type this@@6) RefType)) (and (= (getNext Heap@@7 this@@6) (|getNext'| Heap@@7 this@@6)) (dummyFunction (|getNext#triggerStateless| this@@6))))
 :qid |stdinbpl.196:15|
 :skolemid |22|
 :pattern ( (getNext Heap@@7 this@@6))
)))
(assert (forall ((this@@7 T@U) (this2 T@U) ) (!  (=> (and (and (= (type this@@7) RefType) (= (type this2) RefType)) (= (valid this@@7) (valid this2))) (= this@@7 this2))
 :qid |stdinbpl.324:15|
 :skolemid |30|
 :pattern ( (valid this@@7) (valid this2))
)))
(assert (forall ((arg0@@31 T@U) ) (! (= (type (|valid#sm| arg0@@31)) (FieldType PredicateType_validType (MapType1Type RefType boolType)))
 :qid |funType:valid#sm|
 :pattern ( (|valid#sm| arg0@@31))
)))
(assert (forall ((this@@8 T@U) (this2@@0 T@U) ) (!  (=> (and (and (= (type this@@8) RefType) (= (type this2@@0) RefType)) (= (|valid#sm| this@@8) (|valid#sm| this2@@0))) (= this@@8 this2@@0))
 :qid |stdinbpl.328:15|
 :skolemid |31|
 :pattern ( (|valid#sm| this@@8) (|valid#sm| this2@@0))
)))
(assert (forall ((this@@9 T@U) (this2@@1 T@U) ) (!  (=> (and (and (= (type this@@9) RefType) (= (type this2@@1) RefType)) (= (p_1 this@@9) (p_1 this2@@1))) (= this@@9 this2@@1))
 :qid |stdinbpl.399:15|
 :skolemid |36|
 :pattern ( (p_1 this@@9) (p_1 this2@@1))
)))
(assert (forall ((arg0@@32 T@U) ) (! (= (type (|p#sm| arg0@@32)) (FieldType PredicateType_pType (MapType1Type RefType boolType)))
 :qid |funType:p#sm|
 :pattern ( (|p#sm| arg0@@32))
)))
(assert (forall ((this@@10 T@U) (this2@@2 T@U) ) (!  (=> (and (and (= (type this@@10) RefType) (= (type this2@@2) RefType)) (= (|p#sm| this@@10) (|p#sm| this2@@2))) (= this@@10 this2@@2))
 :qid |stdinbpl.403:15|
 :skolemid |37|
 :pattern ( (|p#sm| this@@10) (|p#sm| this2@@2))
)))
(assert (forall ((this@@11 T@U) (this2@@3 T@U) ) (!  (=> (and (and (= (type this@@11) RefType) (= (type this2@@3) RefType)) (= (q_1 this@@11) (q_1 this2@@3))) (= this@@11 this2@@3))
 :qid |stdinbpl.474:15|
 :skolemid |42|
 :pattern ( (q_1 this@@11) (q_1 this2@@3))
)))
(assert (forall ((arg0@@33 T@U) ) (! (= (type (|q#sm| arg0@@33)) (FieldType PredicateType_qType (MapType1Type RefType boolType)))
 :qid |funType:q#sm|
 :pattern ( (|q#sm| arg0@@33))
)))
(assert (forall ((this@@12 T@U) (this2@@4 T@U) ) (!  (=> (and (and (= (type this@@12) RefType) (= (type this2@@4) RefType)) (= (|q#sm| this@@12) (|q#sm| this2@@4))) (= this@@12 this2@@4))
 :qid |stdinbpl.478:15|
 :skolemid |43|
 :pattern ( (|q#sm| this@@12) (|q#sm| this2@@4))
)))
(assert (forall ((Heap@@8 T@U) (ExhaleHeap@@2 T@U) (Mask@@3 T@U) (o_1@@0 T@U) (f_2 T@U) ) (! (let ((B@@1 (FieldTypeInv1 (type f_2))))
(let ((A@@1 (FieldTypeInv0 (type f_2))))
 (=> (and (and (and (and (and (and (= (type Heap@@8) (MapType0Type RefType)) (= (type ExhaleHeap@@2) (MapType0Type RefType))) (= (type Mask@@3) (MapType1Type RefType realType))) (= (type o_1@@0) RefType)) (= (type f_2) (FieldType A@@1 B@@1))) (IdenticalOnKnownLocations Heap@@8 ExhaleHeap@@2 Mask@@3)) (HasDirectPerm Mask@@3 o_1@@0 f_2)) (= (MapType0Select Heap@@8 o_1@@0 f_2) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2)))))
 :qid |stdinbpl.42:22|
 :skolemid |1|
 :pattern ( (IdenticalOnKnownLocations Heap@@8 ExhaleHeap@@2 Mask@@3) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2))
)))
(assert  (and (= (type dummyHeap) (MapType0Type RefType)) (= (type ZeroMask) (MapType1Type RefType realType))))
(assert (state dummyHeap ZeroMask))
(assert (forall ((p T@U) (v_1 T@U) (w T@U) ) (! (let ((A@@2 (FieldTypeInv0 (type p))))
 (=> (and (and (= (type p) (FieldType A@@2 FrameTypeType)) (= (type v_1) FrameTypeType)) (= (type w) FrameTypeType)) (not (InsidePredicate p v_1 p w))))
 :qid |stdinbpl.173:19|
 :skolemid |21|
 :pattern ( (InsidePredicate p v_1 p w))
)))
(assert  (not (IsPredicateField next)))
(assert  (not (IsWandField next)))
(assert  (not (IsPredicateField value)))
(assert  (not (IsWandField value)))
(assert (forall ((Heap@@9 T@U) (ExhaleHeap@@3 T@U) (Mask@@4 T@U) ) (!  (=> (and (and (and (= (type Heap@@9) (MapType0Type RefType)) (= (type ExhaleHeap@@3) (MapType0Type RefType))) (= (type Mask@@4) (MapType1Type RefType realType))) (IdenticalOnKnownLocations Heap@@9 ExhaleHeap@@3 Mask@@4)) (succHeap Heap@@9 ExhaleHeap@@3))
 :qid |stdinbpl.83:15|
 :skolemid |10|
 :pattern ( (IdenticalOnKnownLocations Heap@@9 ExhaleHeap@@3 Mask@@4))
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
(assert  (and (forall ((arg0@@34 Real) (arg1@@11 T@U) ) (! (= (type (ConditionalFrame arg0@@34 arg1@@11)) FrameTypeType)
 :qid |funType:ConditionalFrame|
 :pattern ( (ConditionalFrame arg0@@34 arg1@@11))
)) (= (type EmptyFrame) FrameTypeType)))
(assert (forall ((p@@0 Real) (f_6 T@U) ) (!  (=> (= (type f_6) FrameTypeType) (= (ConditionalFrame p@@0 f_6) (ite (> p@@0 0.0) f_6 EmptyFrame)))
 :qid |stdinbpl.161:15|
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
(assert (forall ((Heap@@10 T@U) (ExhaleHeap@@4 T@U) (Mask@@6 T@U) (pm_f@@1 T@U) ) (! (let ((C@@1 (FieldTypeInv0 (type pm_f@@1))))
 (=> (and (and (and (and (and (= (type Heap@@10) (MapType0Type RefType)) (= (type ExhaleHeap@@4) (MapType0Type RefType))) (= (type Mask@@6) (MapType1Type RefType realType))) (= (type pm_f@@1) (FieldType C@@1 FrameTypeType))) (IdenticalOnKnownLocations Heap@@10 ExhaleHeap@@4 Mask@@6)) (and (HasDirectPerm Mask@@6 null pm_f@@1) (IsPredicateField pm_f@@1))) (forall ((o2 T@U) (f_2@@0 T@U) ) (! (let ((B@@5 (FieldTypeInv1 (type f_2@@0))))
(let ((A@@6 (FieldTypeInv0 (type f_2@@0))))
 (=> (and (and (= (type o2) RefType) (= (type f_2@@0) (FieldType A@@6 B@@5))) (U_2_bool (MapType1Select (MapType0Select Heap@@10 null (PredicateMaskField pm_f@@1)) o2 f_2@@0))) (= (MapType0Select Heap@@10 o2 f_2@@0) (MapType0Select ExhaleHeap@@4 o2 f_2@@0)))))
 :qid |stdinbpl.54:134|
 :skolemid |3|
 :pattern ( (MapType0Select ExhaleHeap@@4 o2 f_2@@0))
))))
 :qid |stdinbpl.52:19|
 :skolemid |4|
 :pattern ( (IdenticalOnKnownLocations Heap@@10 ExhaleHeap@@4 Mask@@6) (IsPredicateField pm_f@@1))
)))
(assert (forall ((Heap@@11 T@U) (ExhaleHeap@@5 T@U) (Mask@@7 T@U) (pm_f@@2 T@U) ) (! (let ((C@@2 (FieldTypeInv0 (type pm_f@@2))))
 (=> (and (and (and (and (and (= (type Heap@@11) (MapType0Type RefType)) (= (type ExhaleHeap@@5) (MapType0Type RefType))) (= (type Mask@@7) (MapType1Type RefType realType))) (= (type pm_f@@2) (FieldType C@@2 FrameTypeType))) (IdenticalOnKnownLocations Heap@@11 ExhaleHeap@@5 Mask@@7)) (and (HasDirectPerm Mask@@7 null pm_f@@2) (IsWandField pm_f@@2))) (forall ((o2@@0 T@U) (f_2@@1 T@U) ) (! (let ((B@@6 (FieldTypeInv1 (type f_2@@1))))
(let ((A@@7 (FieldTypeInv0 (type f_2@@1))))
 (=> (and (and (= (type o2@@0) RefType) (= (type f_2@@1) (FieldType A@@7 B@@6))) (U_2_bool (MapType1Select (MapType0Select Heap@@11 null (WandMaskField pm_f@@2)) o2@@0 f_2@@1))) (= (MapType0Select Heap@@11 o2@@0 f_2@@1) (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1)))))
 :qid |stdinbpl.67:129|
 :skolemid |6|
 :pattern ( (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1))
))))
 :qid |stdinbpl.65:19|
 :skolemid |7|
 :pattern ( (IdenticalOnKnownLocations Heap@@11 ExhaleHeap@@5 Mask@@7) (IsWandField pm_f@@2))
)))
(assert (forall ((this@@13 T@U) ) (!  (=> (= (type this@@13) RefType) (= (getPredWandId (valid this@@13)) 0))
 :qid |stdinbpl.318:15|
 :skolemid |29|
 :pattern ( (valid this@@13))
)))
(assert (forall ((this@@14 T@U) ) (!  (=> (= (type this@@14) RefType) (= (getPredWandId (p_1 this@@14)) 1))
 :qid |stdinbpl.393:15|
 :skolemid |35|
 :pattern ( (p_1 this@@14))
)))
(assert (forall ((this@@15 T@U) ) (!  (=> (= (type this@@15) RefType) (= (getPredWandId (q_1 this@@15)) 2))
 :qid |stdinbpl.468:15|
 :skolemid |41|
 :pattern ( (q_1 this@@15))
)))
(assert (forall ((Mask@@8 T@U) (o_2@@2 T@U) (f_4@@2 T@U) ) (! (let ((B@@7 (FieldTypeInv1 (type f_4@@2))))
(let ((A@@8 (FieldTypeInv0 (type f_4@@2))))
 (=> (and (and (and (= (type Mask@@8) (MapType1Type RefType realType)) (= (type o_2@@2) RefType)) (= (type f_4@@2) (FieldType A@@8 B@@7))) (GoodMask Mask@@8)) (and (>= (U_2_real (MapType1Select Mask@@8 o_2@@2 f_4@@2)) NoPerm) (=> (and (and (GoodMask Mask@@8) (not (IsPredicateField f_4@@2))) (not (IsWandField f_4@@2))) (<= (U_2_real (MapType1Select Mask@@8 o_2@@2 f_4@@2)) FullPerm))))))
 :qid |stdinbpl.128:22|
 :skolemid |16|
 :pattern ( (GoodMask Mask@@8) (MapType1Select Mask@@8 o_2@@2 f_4@@2))
)))
(assert (forall ((arg0@@35 T@U) (arg1@@12 T@U) ) (! (= (type (|getNext#frame| arg0@@35 arg1@@12)) RefType)
 :qid |funType:getNext#frame|
 :pattern ( (|getNext#frame| arg0@@35 arg1@@12))
)))
(assert (forall ((Heap@@12 T@U) (Mask@@9 T@U) (this@@16 T@U) ) (!  (=> (and (and (and (= (type Heap@@12) (MapType0Type RefType)) (= (type Mask@@9) (MapType1Type RefType realType))) (= (type this@@16) RefType)) (state Heap@@12 Mask@@9)) (= (|getNext'| Heap@@12 this@@16) (|getNext#frame| (MapType0Select Heap@@12 null (valid this@@16)) this@@16)))
 :qid |stdinbpl.213:15|
 :skolemid |25|
 :pattern ( (state Heap@@12 Mask@@9) (|getNext'| Heap@@12 this@@16))
)))
(assert (forall ((o T@U) (f T@U) (Heap@@13 T@U) ) (!  (=> (and (and (and (= (type o) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap@@13) (MapType0Type RefType))) (U_2_bool (MapType0Select Heap@@13 o $allocated))) (U_2_bool (MapType0Select Heap@@13 (MapType0Select Heap@@13 o f) $allocated)))
 :qid |stdinbpl.31:15|
 :skolemid |0|
 :pattern ( (MapType0Select Heap@@13 o f))
)))
(assert (forall ((this@@17 T@U) ) (!  (=> (= (type this@@17) RefType) (= (PredicateMaskField (valid this@@17)) (|valid#sm| this@@17)))
 :qid |stdinbpl.310:15|
 :skolemid |27|
 :pattern ( (PredicateMaskField (valid this@@17)))
)))
(assert (forall ((this@@18 T@U) ) (!  (=> (= (type this@@18) RefType) (= (PredicateMaskField (p_1 this@@18)) (|p#sm| this@@18)))
 :qid |stdinbpl.385:15|
 :skolemid |33|
 :pattern ( (PredicateMaskField (p_1 this@@18)))
)))
(assert (forall ((this@@19 T@U) ) (!  (=> (= (type this@@19) RefType) (= (PredicateMaskField (q_1 this@@19)) (|q#sm| this@@19)))
 :qid |stdinbpl.460:15|
 :skolemid |39|
 :pattern ( (PredicateMaskField (q_1 this@@19)))
)))
(assert (forall ((Heap@@14 T@U) (o@@0 T@U) (f_3 T@U) (v T@U) ) (! (let ((B@@8 (type v)))
(let ((A@@9 (FieldTypeInv0 (type f_3))))
 (=> (and (and (= (type Heap@@14) (MapType0Type RefType)) (= (type o@@0) RefType)) (= (type f_3) (FieldType A@@9 B@@8))) (succHeap Heap@@14 (MapType0Store Heap@@14 o@@0 f_3 v)))))
 :qid |stdinbpl.78:22|
 :skolemid |9|
 :pattern ( (MapType0Store Heap@@14 o@@0 f_3 v))
)))
(assert (forall ((Heap@@15 T@U) (Mask@@10 T@U) (this@@20 T@U) ) (!  (=> (and (and (and (= (type Heap@@15) (MapType0Type RefType)) (= (type Mask@@10) (MapType1Type RefType realType))) (= (type this@@20) RefType)) (and (state Heap@@15 Mask@@10) (< AssumeFunctionsAbove 0))) (= (getNext Heap@@15 this@@20) (MapType0Select Heap@@15 this@@20 next)))
 :qid |stdinbpl.206:15|
 :skolemid |24|
 :pattern ( (state Heap@@15 Mask@@10) (getNext Heap@@15 this@@20))
 :pattern ( (state Heap@@15 Mask@@10) (|getNext#triggerStateless| this@@20) (|valid#trigger| Heap@@15 (valid this@@20)))
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
 :qid |stdinbpl.168:25|
 :skolemid |20|
 :pattern ( (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun Heap@87 () T@U)
(declare-fun Mask@0 () T@U)
(declare-fun Heap@88 () T@U)
(declare-fun Heap@85 () T@U)
(declare-fun this@@21 () T@U)
(declare-fun newPMask@21 () T@U)
(declare-fun Heap@86 () T@U)
(declare-fun Heap@83 () T@U)
(declare-fun Heap@84 () T@U)
(declare-fun Heap@81 () T@U)
(declare-fun newPMask@20 () T@U)
(declare-fun Heap@82 () T@U)
(declare-fun Heap@79 () T@U)
(declare-fun Heap@80 () T@U)
(declare-fun Heap@77 () T@U)
(declare-fun newPMask@19 () T@U)
(declare-fun Heap@78 () T@U)
(declare-fun Heap@75 () T@U)
(declare-fun Heap@76 () T@U)
(declare-fun Heap@73 () T@U)
(declare-fun newPMask@18 () T@U)
(declare-fun Heap@74 () T@U)
(declare-fun Heap@71 () T@U)
(declare-fun Heap@72 () T@U)
(declare-fun Heap@69 () T@U)
(declare-fun newPMask@17 () T@U)
(declare-fun Heap@70 () T@U)
(declare-fun Heap@67 () T@U)
(declare-fun Heap@68 () T@U)
(declare-fun Heap@65 () T@U)
(declare-fun newPMask@16 () T@U)
(declare-fun Heap@66 () T@U)
(declare-fun Heap@63 () T@U)
(declare-fun Heap@64 () T@U)
(declare-fun Heap@61 () T@U)
(declare-fun newPMask@15 () T@U)
(declare-fun Heap@62 () T@U)
(declare-fun Heap@59 () T@U)
(declare-fun Unfolding1Mask@9 () T@U)
(declare-fun Heap@60 () T@U)
(declare-fun Unfolding1Mask@7 () T@U)
(declare-fun wildcard@26 () Real)
(declare-fun Unfolding1Mask@8 () T@U)
(declare-fun UnfoldingMask@24 () T@U)
(declare-fun CombineFrames (T@U T@U) T@U)
(declare-fun FrameFragment (T@U) T@U)
(declare-fun wildcard@23 () Real)
(declare-fun Unfolding1Mask@5 () T@U)
(declare-fun wildcard@24 () Real)
(declare-fun Unfolding1Mask@6 () T@U)
(declare-fun wildcard@25 () Real)
(declare-fun UnfoldingMask@22 () T@U)
(declare-fun wildcard@22 () Real)
(declare-fun UnfoldingMask@23 () T@U)
(declare-fun wildcard@19 () Real)
(declare-fun UnfoldingMask@20 () T@U)
(declare-fun wildcard@20 () Real)
(declare-fun UnfoldingMask@21 () T@U)
(declare-fun wildcard@21 () Real)
(declare-fun Heap@57 () T@U)
(declare-fun newPMask@14 () T@U)
(declare-fun Heap@58 () T@U)
(declare-fun Heap@55 () T@U)
(declare-fun Heap@56 () T@U)
(declare-fun Heap@53 () T@U)
(declare-fun newPMask@13 () T@U)
(declare-fun Heap@54 () T@U)
(declare-fun Heap@51 () T@U)
(declare-fun Heap@52 () T@U)
(declare-fun Heap@49 () T@U)
(declare-fun newPMask@12 () T@U)
(declare-fun Heap@50 () T@U)
(declare-fun Heap@47 () T@U)
(declare-fun Heap@48 () T@U)
(declare-fun Heap@45 () T@U)
(declare-fun newPMask@11 () T@U)
(declare-fun Heap@46 () T@U)
(declare-fun Heap@43 () T@U)
(declare-fun Heap@44 () T@U)
(declare-fun Heap@41 () T@U)
(declare-fun newPMask@10 () T@U)
(declare-fun Heap@42 () T@U)
(declare-fun Heap@39 () T@U)
(declare-fun Heap@40 () T@U)
(declare-fun Heap@37 () T@U)
(declare-fun newPMask@9 () T@U)
(declare-fun Heap@38 () T@U)
(declare-fun Heap@35 () T@U)
(declare-fun Heap@36 () T@U)
(declare-fun Heap@33 () T@U)
(declare-fun newPMask@8 () T@U)
(declare-fun Heap@34 () T@U)
(declare-fun Heap@31 () T@U)
(declare-fun Heap@32 () T@U)
(declare-fun Heap@29 () T@U)
(declare-fun newPMask@7 () T@U)
(declare-fun Heap@30 () T@U)
(declare-fun Heap@27 () T@U)
(declare-fun Heap@28 () T@U)
(declare-fun Heap@25 () T@U)
(declare-fun newPMask@6 () T@U)
(declare-fun Heap@26 () T@U)
(declare-fun Heap@19 () T@U)
(declare-fun Unfolding1Mask@4 () T@U)
(declare-fun Heap@23 () T@U)
(declare-fun Heap@24 () T@U)
(declare-fun Unfolding1Mask@2 () T@U)
(declare-fun wildcard@18 () Real)
(declare-fun Unfolding1Mask@3 () T@U)
(declare-fun UnfoldingMask@19 () T@U)
(declare-fun wildcard@15 () Real)
(declare-fun Unfolding1Mask@0 () T@U)
(declare-fun wildcard@16 () Real)
(declare-fun Unfolding1Mask@1 () T@U)
(declare-fun wildcard@17 () Real)
(declare-fun UnfoldingMask@17 () T@U)
(declare-fun wildcard@14 () Real)
(declare-fun UnfoldingMask@18 () T@U)
(declare-fun wildcard@11 () Real)
(declare-fun UnfoldingMask@15 () T@U)
(declare-fun wildcard@12 () Real)
(declare-fun UnfoldingMask@16 () T@U)
(declare-fun wildcard@13 () Real)
(declare-fun Heap@21 () T@U)
(declare-fun newPMask@5 () T@U)
(declare-fun Heap@22 () T@U)
(declare-fun UnfoldingMask@14 () T@U)
(declare-fun Heap@20 () T@U)
(declare-fun UnfoldingMask@12 () T@U)
(declare-fun wildcard@10 () Real)
(declare-fun UnfoldingMask@13 () T@U)
(declare-fun wildcard@7 () Real)
(declare-fun UnfoldingMask@10 () T@U)
(declare-fun wildcard@8 () Real)
(declare-fun UnfoldingMask@11 () T@U)
(declare-fun wildcard@9 () Real)
(declare-fun Heap@17 () T@U)
(declare-fun newPMask@4 () T@U)
(declare-fun Heap@18 () T@U)
(declare-fun Heap@15 () T@U)
(declare-fun Heap@16 () T@U)
(declare-fun Heap@13 () T@U)
(declare-fun newPMask@3 () T@U)
(declare-fun Heap@14 () T@U)
(declare-fun Heap@11 () T@U)
(declare-fun UnfoldingMask@9 () T@U)
(declare-fun Heap@12 () T@U)
(declare-fun UnfoldingMask@7 () T@U)
(declare-fun wildcard@6 () Real)
(declare-fun UnfoldingMask@8 () T@U)
(declare-fun wildcard@3 () Real)
(declare-fun UnfoldingMask@5 () T@U)
(declare-fun wildcard@4 () Real)
(declare-fun UnfoldingMask@6 () T@U)
(declare-fun wildcard@5 () Real)
(declare-fun Heap@9 () T@U)
(declare-fun newPMask@2 () T@U)
(declare-fun Heap@10 () T@U)
(declare-fun Heap@7 () T@U)
(declare-fun Heap@8 () T@U)
(declare-fun Heap@5 () T@U)
(declare-fun newPMask@1 () T@U)
(declare-fun Heap@6 () T@U)
(declare-fun Heap@3 () T@U)
(declare-fun Heap@4 () T@U)
(declare-fun Heap@1 () T@U)
(declare-fun newPMask@0 () T@U)
(declare-fun Heap@2 () T@U)
(declare-fun Heap@@16 () T@U)
(declare-fun UnfoldingMask@4 () T@U)
(declare-fun Heap@0 () T@U)
(declare-fun UnfoldingMask@2 () T@U)
(declare-fun wildcard@2 () Real)
(declare-fun UnfoldingMask@3 () T@U)
(declare-fun UnfoldingMask@0 () T@U)
(declare-fun wildcard@0 () Real)
(declare-fun UnfoldingMask@1 () T@U)
(declare-fun wildcard@1 () Real)
(declare-fun wildcard () Real)
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (= (type Heap@19) (MapType0Type RefType)) (= (type this@@21) RefType)) (= (type Heap@88) (MapType0Type RefType))) (= (type Heap@87) (MapType0Type RefType))) (= (type Mask@0) (MapType1Type RefType realType))) (= (type Heap@85) (MapType0Type RefType))) (= (type newPMask@21) (MapType1Type RefType boolType))) (= (type Heap@86) (MapType0Type RefType))) (= (type Heap@83) (MapType0Type RefType))) (= (type Heap@84) (MapType0Type RefType))) (= (type Heap@81) (MapType0Type RefType))) (= (type newPMask@20) (MapType1Type RefType boolType))) (= (type Heap@82) (MapType0Type RefType))) (= (type Heap@79) (MapType0Type RefType))) (= (type Heap@80) (MapType0Type RefType))) (= (type Heap@77) (MapType0Type RefType))) (= (type newPMask@19) (MapType1Type RefType boolType))) (= (type Heap@78) (MapType0Type RefType))) (= (type Heap@75) (MapType0Type RefType))) (= (type Heap@76) (MapType0Type RefType))) (= (type Heap@73) (MapType0Type RefType))) (= (type newPMask@18) (MapType1Type RefType boolType))) (= (type Heap@74) (MapType0Type RefType))) (= (type Heap@71) (MapType0Type RefType))) (= (type Heap@72) (MapType0Type RefType))) (= (type Heap@69) (MapType0Type RefType))) (= (type newPMask@17) (MapType1Type RefType boolType))) (= (type Heap@70) (MapType0Type RefType))) (= (type Heap@67) (MapType0Type RefType))) (= (type Heap@68) (MapType0Type RefType))) (= (type Heap@65) (MapType0Type RefType))) (= (type newPMask@16) (MapType1Type RefType boolType))) (= (type Heap@66) (MapType0Type RefType))) (= (type Heap@63) (MapType0Type RefType))) (= (type Heap@64) (MapType0Type RefType))) (= (type Heap@61) (MapType0Type RefType))) (= (type newPMask@15) (MapType1Type RefType boolType))) (= (type Heap@62) (MapType0Type RefType))) (= (type Heap@59) (MapType0Type RefType))) (= (type Unfolding1Mask@9) (MapType1Type RefType realType))) (= (type Heap@60) (MapType0Type RefType))) (= (type Unfolding1Mask@8) (MapType1Type RefType realType))) (= (type Unfolding1Mask@7) (MapType1Type RefType realType))) (= (type UnfoldingMask@24) (MapType1Type RefType realType))) (forall ((arg0@@36 T@U) (arg1@@13 T@U) ) (! (= (type (CombineFrames arg0@@36 arg1@@13)) FrameTypeType)
 :qid |funType:CombineFrames|
 :pattern ( (CombineFrames arg0@@36 arg1@@13))
))) (forall ((arg0@@37 T@U) ) (! (= (type (FrameFragment arg0@@37)) FrameTypeType)
 :qid |funType:FrameFragment|
 :pattern ( (FrameFragment arg0@@37))
))) (= (type Unfolding1Mask@5) (MapType1Type RefType realType))) (= (type Unfolding1Mask@6) (MapType1Type RefType realType))) (= (type UnfoldingMask@23) (MapType1Type RefType realType))) (= (type UnfoldingMask@22) (MapType1Type RefType realType))) (= (type UnfoldingMask@20) (MapType1Type RefType realType))) (= (type UnfoldingMask@21) (MapType1Type RefType realType))) (= (type Heap@57) (MapType0Type RefType))) (= (type newPMask@14) (MapType1Type RefType boolType))) (= (type Heap@58) (MapType0Type RefType))) (= (type Heap@55) (MapType0Type RefType))) (= (type Heap@56) (MapType0Type RefType))) (= (type Heap@53) (MapType0Type RefType))) (= (type newPMask@13) (MapType1Type RefType boolType))) (= (type Heap@54) (MapType0Type RefType))) (= (type Heap@51) (MapType0Type RefType))) (= (type Heap@52) (MapType0Type RefType))) (= (type Heap@49) (MapType0Type RefType))) (= (type newPMask@12) (MapType1Type RefType boolType))) (= (type Heap@50) (MapType0Type RefType))) (= (type Heap@47) (MapType0Type RefType))) (= (type Heap@48) (MapType0Type RefType))) (= (type Heap@45) (MapType0Type RefType))) (= (type newPMask@11) (MapType1Type RefType boolType))) (= (type Heap@46) (MapType0Type RefType))) (= (type Heap@43) (MapType0Type RefType))) (= (type Heap@44) (MapType0Type RefType))) (= (type Heap@41) (MapType0Type RefType))) (= (type newPMask@10) (MapType1Type RefType boolType))) (= (type Heap@42) (MapType0Type RefType))) (= (type Heap@39) (MapType0Type RefType))) (= (type Heap@40) (MapType0Type RefType))) (= (type Heap@37) (MapType0Type RefType))) (= (type newPMask@9) (MapType1Type RefType boolType))) (= (type Heap@38) (MapType0Type RefType))) (= (type Heap@35) (MapType0Type RefType))) (= (type Heap@36) (MapType0Type RefType))) (= (type Heap@33) (MapType0Type RefType))) (= (type newPMask@8) (MapType1Type RefType boolType))) (= (type Heap@34) (MapType0Type RefType))) (= (type Heap@31) (MapType0Type RefType))) (= (type Heap@32) (MapType0Type RefType))) (= (type Heap@29) (MapType0Type RefType))) (= (type newPMask@7) (MapType1Type RefType boolType))) (= (type Heap@30) (MapType0Type RefType))) (= (type Heap@27) (MapType0Type RefType))) (= (type Heap@28) (MapType0Type RefType))) (= (type Heap@25) (MapType0Type RefType))) (= (type newPMask@6) (MapType1Type RefType boolType))) (= (type Heap@26) (MapType0Type RefType))) (= (type Unfolding1Mask@4) (MapType1Type RefType realType))) (= (type Heap@23) (MapType0Type RefType))) (= (type Heap@24) (MapType0Type RefType))) (= (type Unfolding1Mask@3) (MapType1Type RefType realType))) (= (type Unfolding1Mask@2) (MapType1Type RefType realType))) (= (type UnfoldingMask@19) (MapType1Type RefType realType))) (= (type Unfolding1Mask@0) (MapType1Type RefType realType))) (= (type Unfolding1Mask@1) (MapType1Type RefType realType))) (= (type UnfoldingMask@18) (MapType1Type RefType realType))) (= (type UnfoldingMask@17) (MapType1Type RefType realType))) (= (type UnfoldingMask@15) (MapType1Type RefType realType))) (= (type UnfoldingMask@16) (MapType1Type RefType realType))) (= (type Heap@21) (MapType0Type RefType))) (= (type newPMask@5) (MapType1Type RefType boolType))) (= (type Heap@22) (MapType0Type RefType))) (= (type UnfoldingMask@14) (MapType1Type RefType realType))) (= (type Heap@20) (MapType0Type RefType))) (= (type UnfoldingMask@13) (MapType1Type RefType realType))) (= (type UnfoldingMask@12) (MapType1Type RefType realType))) (= (type UnfoldingMask@10) (MapType1Type RefType realType))) (= (type UnfoldingMask@11) (MapType1Type RefType realType))) (= (type Heap@17) (MapType0Type RefType))) (= (type newPMask@4) (MapType1Type RefType boolType))) (= (type Heap@18) (MapType0Type RefType))) (= (type Heap@15) (MapType0Type RefType))) (= (type Heap@16) (MapType0Type RefType))) (= (type Heap@13) (MapType0Type RefType))) (= (type newPMask@3) (MapType1Type RefType boolType))) (= (type Heap@14) (MapType0Type RefType))) (= (type Heap@11) (MapType0Type RefType))) (= (type UnfoldingMask@9) (MapType1Type RefType realType))) (= (type Heap@12) (MapType0Type RefType))) (= (type UnfoldingMask@8) (MapType1Type RefType realType))) (= (type UnfoldingMask@7) (MapType1Type RefType realType))) (= (type UnfoldingMask@5) (MapType1Type RefType realType))) (= (type UnfoldingMask@6) (MapType1Type RefType realType))) (= (type Heap@9) (MapType0Type RefType))) (= (type newPMask@2) (MapType1Type RefType boolType))) (= (type Heap@10) (MapType0Type RefType))) (= (type Heap@7) (MapType0Type RefType))) (= (type Heap@8) (MapType0Type RefType))) (= (type Heap@5) (MapType0Type RefType))) (= (type newPMask@1) (MapType1Type RefType boolType))) (= (type Heap@6) (MapType0Type RefType))) (= (type Heap@3) (MapType0Type RefType))) (= (type Heap@4) (MapType0Type RefType))) (= (type Heap@1) (MapType0Type RefType))) (= (type newPMask@0) (MapType1Type RefType boolType))) (= (type Heap@2) (MapType0Type RefType))) (= (type Heap@@16) (MapType0Type RefType))) (= (type UnfoldingMask@4) (MapType1Type RefType realType))) (= (type Heap@0) (MapType0Type RefType))) (= (type UnfoldingMask@3) (MapType1Type RefType realType))) (= (type UnfoldingMask@2) (MapType1Type RefType realType))) (= (type UnfoldingMask@0) (MapType1Type RefType realType))) (= (type UnfoldingMask@1) (MapType1Type RefType realType))))
(set-info :boogie-vc-id testNestingUnfolding)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 114) (let ((anon62_correct true))
(let ((anon61_correct  (=> (and (and (state Heap@87 Mask@0) (state Heap@87 Mask@0)) (and (= Heap@88 Heap@87) (= (ControlFlow 0 3) 1))) anon62_correct)))
(let ((anon93_Else_correct  (=> (= (MapType0Select Heap@85 (MapType0Select Heap@85 this@@21 next) next) null) (=> (and (= Heap@87 Heap@85) (= (ControlFlow 0 5) 3)) anon61_correct))))
(let ((anon93_Then_correct  (=> (not (= (MapType0Select Heap@85 (MapType0Select Heap@85 this@@21 next) next) null)) (=> (and (and (forall ((o_27 T@U) (f_31 T@U) ) (! (let ((B@@11 (FieldTypeInv1 (type f_31))))
(let ((A@@12 (FieldTypeInv0 (type f_31))))
 (=> (and (and (= (type o_27) RefType) (= (type f_31) (FieldType A@@12 B@@11))) (or (U_2_bool (MapType1Select (MapType0Select Heap@85 null (|valid#sm| (MapType0Select Heap@85 this@@21 next))) o_27 f_31)) (U_2_bool (MapType1Select (MapType0Select Heap@85 null (|valid#sm| (MapType0Select Heap@85 (MapType0Select Heap@85 this@@21 next) next))) o_27 f_31)))) (U_2_bool (MapType1Select newPMask@21 o_27 f_31)))))
 :qid |stdinbpl.1494:35|
 :skolemid |68|
 :pattern ( (MapType1Select newPMask@21 o_27 f_31))
)) (= Heap@86 (MapType0Store Heap@85 null (|valid#sm| (MapType0Select Heap@85 this@@21 next)) newPMask@21))) (and (= Heap@87 Heap@86) (= (ControlFlow 0 4) 3))) anon61_correct))))
(let ((anon59_correct  (=> (state Heap@83 Mask@0) (=> (and (= Heap@84 (MapType0Store Heap@83 null (|valid#sm| (MapType0Select Heap@83 this@@21 next)) (MapType1Store (MapType0Select Heap@83 null (|valid#sm| (MapType0Select Heap@83 this@@21 next))) (MapType0Select Heap@83 this@@21 next) next (bool_2_U true)))) (= Heap@85 (MapType0Store Heap@84 null (|valid#sm| (MapType0Select Heap@84 this@@21 next)) (MapType1Store (MapType0Select Heap@84 null (|valid#sm| (MapType0Select Heap@84 this@@21 next))) (MapType0Select Heap@84 this@@21 next) value (bool_2_U true))))) (and (=> (= (ControlFlow 0 6) 4) anon93_Then_correct) (=> (= (ControlFlow 0 6) 5) anon93_Else_correct))))))
(let ((anon92_Else_correct  (=> (= (MapType0Select Heap@81 this@@21 next) null) (=> (and (= Heap@83 Heap@81) (= (ControlFlow 0 8) 6)) anon59_correct))))
(let ((anon92_Then_correct  (=> (not (= (MapType0Select Heap@81 this@@21 next) null)) (=> (and (and (forall ((o_26 T@U) (f_30 T@U) ) (! (let ((B@@12 (FieldTypeInv1 (type f_30))))
(let ((A@@13 (FieldTypeInv0 (type f_30))))
 (=> (and (and (= (type o_26) RefType) (= (type f_30) (FieldType A@@13 B@@12))) (or (U_2_bool (MapType1Select (MapType0Select Heap@81 null (|valid#sm| this@@21)) o_26 f_30)) (U_2_bool (MapType1Select (MapType0Select Heap@81 null (|valid#sm| (MapType0Select Heap@81 this@@21 next))) o_26 f_30)))) (U_2_bool (MapType1Select newPMask@20 o_26 f_30)))))
 :qid |stdinbpl.1483:35|
 :skolemid |67|
 :pattern ( (MapType1Select newPMask@20 o_26 f_30))
)) (= Heap@82 (MapType0Store Heap@81 null (|valid#sm| this@@21) newPMask@20))) (and (= Heap@83 Heap@82) (= (ControlFlow 0 7) 6))) anon59_correct))))
(let ((anon57_correct  (=> (state Heap@79 Mask@0) (and (=> (= (ControlFlow 0 9) (- 0 10)) (not (= this@@21 (MapType0Select Heap@79 (MapType0Select Heap@79 this@@21 next) next)))) (=> (not (= this@@21 (MapType0Select Heap@79 (MapType0Select Heap@79 this@@21 next) next))) (=> (and (= Heap@80 (MapType0Store Heap@79 null (|valid#sm| this@@21) (MapType1Store (MapType0Select Heap@79 null (|valid#sm| this@@21)) this@@21 next (bool_2_U true)))) (= Heap@81 (MapType0Store Heap@80 null (|valid#sm| this@@21) (MapType1Store (MapType0Select Heap@80 null (|valid#sm| this@@21)) this@@21 value (bool_2_U true))))) (and (=> (= (ControlFlow 0 9) 7) anon92_Then_correct) (=> (= (ControlFlow 0 9) 8) anon92_Else_correct))))))))
(let ((anon91_Else_correct  (=> (= (MapType0Select Heap@77 (MapType0Select Heap@77 this@@21 next) next) null) (=> (and (= Heap@79 Heap@77) (= (ControlFlow 0 12) 9)) anon57_correct))))
(let ((anon91_Then_correct  (=> (not (= (MapType0Select Heap@77 (MapType0Select Heap@77 this@@21 next) next) null)) (=> (and (and (forall ((o_25 T@U) (f_29 T@U) ) (! (let ((B@@13 (FieldTypeInv1 (type f_29))))
(let ((A@@14 (FieldTypeInv0 (type f_29))))
 (=> (and (and (= (type o_25) RefType) (= (type f_29) (FieldType A@@14 B@@13))) (or (U_2_bool (MapType1Select (MapType0Select Heap@77 null (|valid#sm| (MapType0Select Heap@77 this@@21 next))) o_25 f_29)) (U_2_bool (MapType1Select (MapType0Select Heap@77 null (|valid#sm| (MapType0Select Heap@77 (MapType0Select Heap@77 this@@21 next) next))) o_25 f_29)))) (U_2_bool (MapType1Select newPMask@19 o_25 f_29)))))
 :qid |stdinbpl.1468:37|
 :skolemid |66|
 :pattern ( (MapType1Select newPMask@19 o_25 f_29))
)) (= Heap@78 (MapType0Store Heap@77 null (|valid#sm| (MapType0Select Heap@77 this@@21 next)) newPMask@19))) (and (= Heap@79 Heap@78) (= (ControlFlow 0 11) 9))) anon57_correct))))
(let ((anon55_correct  (=> (state Heap@75 Mask@0) (=> (and (= Heap@76 (MapType0Store Heap@75 null (|valid#sm| (MapType0Select Heap@75 this@@21 next)) (MapType1Store (MapType0Select Heap@75 null (|valid#sm| (MapType0Select Heap@75 this@@21 next))) (MapType0Select Heap@75 this@@21 next) next (bool_2_U true)))) (= Heap@77 (MapType0Store Heap@76 null (|valid#sm| (MapType0Select Heap@76 this@@21 next)) (MapType1Store (MapType0Select Heap@76 null (|valid#sm| (MapType0Select Heap@76 this@@21 next))) (MapType0Select Heap@76 this@@21 next) value (bool_2_U true))))) (and (=> (= (ControlFlow 0 13) 11) anon91_Then_correct) (=> (= (ControlFlow 0 13) 12) anon91_Else_correct))))))
(let ((anon90_Else_correct  (=> (= (MapType0Select Heap@73 this@@21 next) null) (=> (and (= Heap@75 Heap@73) (= (ControlFlow 0 15) 13)) anon55_correct))))
(let ((anon90_Then_correct  (=> (not (= (MapType0Select Heap@73 this@@21 next) null)) (=> (and (and (forall ((o_24 T@U) (f_28 T@U) ) (! (let ((B@@14 (FieldTypeInv1 (type f_28))))
(let ((A@@15 (FieldTypeInv0 (type f_28))))
 (=> (and (and (= (type o_24) RefType) (= (type f_28) (FieldType A@@15 B@@14))) (or (U_2_bool (MapType1Select (MapType0Select Heap@73 null (|valid#sm| this@@21)) o_24 f_28)) (U_2_bool (MapType1Select (MapType0Select Heap@73 null (|valid#sm| (MapType0Select Heap@73 this@@21 next))) o_24 f_28)))) (U_2_bool (MapType1Select newPMask@18 o_24 f_28)))))
 :qid |stdinbpl.1457:37|
 :skolemid |65|
 :pattern ( (MapType1Select newPMask@18 o_24 f_28))
)) (= Heap@74 (MapType0Store Heap@73 null (|valid#sm| this@@21) newPMask@18))) (and (= Heap@75 Heap@74) (= (ControlFlow 0 14) 13))) anon55_correct))))
(let ((anon53_correct  (=> (state Heap@71 Mask@0) (=> (and (= Heap@72 (MapType0Store Heap@71 null (|valid#sm| this@@21) (MapType1Store (MapType0Select Heap@71 null (|valid#sm| this@@21)) this@@21 next (bool_2_U true)))) (= Heap@73 (MapType0Store Heap@72 null (|valid#sm| this@@21) (MapType1Store (MapType0Select Heap@72 null (|valid#sm| this@@21)) this@@21 value (bool_2_U true))))) (and (=> (= (ControlFlow 0 16) 14) anon90_Then_correct) (=> (= (ControlFlow 0 16) 15) anon90_Else_correct))))))
(let ((anon89_Else_correct  (=> (= (MapType0Select Heap@69 (MapType0Select Heap@69 this@@21 next) next) null) (=> (and (= Heap@71 Heap@69) (= (ControlFlow 0 18) 16)) anon53_correct))))
(let ((anon89_Then_correct  (=> (not (= (MapType0Select Heap@69 (MapType0Select Heap@69 this@@21 next) next) null)) (=> (and (and (forall ((o_23 T@U) (f_27 T@U) ) (! (let ((B@@15 (FieldTypeInv1 (type f_27))))
(let ((A@@16 (FieldTypeInv0 (type f_27))))
 (=> (and (and (= (type o_23) RefType) (= (type f_27) (FieldType A@@16 B@@15))) (or (U_2_bool (MapType1Select (MapType0Select Heap@69 null (|valid#sm| (MapType0Select Heap@69 this@@21 next))) o_23 f_27)) (U_2_bool (MapType1Select (MapType0Select Heap@69 null (|valid#sm| (MapType0Select Heap@69 (MapType0Select Heap@69 this@@21 next) next))) o_23 f_27)))) (U_2_bool (MapType1Select newPMask@17 o_23 f_27)))))
 :qid |stdinbpl.1444:37|
 :skolemid |64|
 :pattern ( (MapType1Select newPMask@17 o_23 f_27))
)) (= Heap@70 (MapType0Store Heap@69 null (|valid#sm| (MapType0Select Heap@69 this@@21 next)) newPMask@17))) (and (= Heap@71 Heap@70) (= (ControlFlow 0 17) 16))) anon53_correct))))
(let ((anon51_correct  (=> (state Heap@67 Mask@0) (=> (and (= Heap@68 (MapType0Store Heap@67 null (|valid#sm| (MapType0Select Heap@67 this@@21 next)) (MapType1Store (MapType0Select Heap@67 null (|valid#sm| (MapType0Select Heap@67 this@@21 next))) (MapType0Select Heap@67 this@@21 next) next (bool_2_U true)))) (= Heap@69 (MapType0Store Heap@68 null (|valid#sm| (MapType0Select Heap@68 this@@21 next)) (MapType1Store (MapType0Select Heap@68 null (|valid#sm| (MapType0Select Heap@68 this@@21 next))) (MapType0Select Heap@68 this@@21 next) value (bool_2_U true))))) (and (=> (= (ControlFlow 0 19) 17) anon89_Then_correct) (=> (= (ControlFlow 0 19) 18) anon89_Else_correct))))))
(let ((anon88_Else_correct  (=> (= (MapType0Select Heap@65 this@@21 next) null) (=> (and (= Heap@67 Heap@65) (= (ControlFlow 0 21) 19)) anon51_correct))))
(let ((anon88_Then_correct  (=> (not (= (MapType0Select Heap@65 this@@21 next) null)) (=> (and (and (forall ((o_22 T@U) (f_26 T@U) ) (! (let ((B@@16 (FieldTypeInv1 (type f_26))))
(let ((A@@17 (FieldTypeInv0 (type f_26))))
 (=> (and (and (= (type o_22) RefType) (= (type f_26) (FieldType A@@17 B@@16))) (or (U_2_bool (MapType1Select (MapType0Select Heap@65 null (|valid#sm| this@@21)) o_22 f_26)) (U_2_bool (MapType1Select (MapType0Select Heap@65 null (|valid#sm| (MapType0Select Heap@65 this@@21 next))) o_22 f_26)))) (U_2_bool (MapType1Select newPMask@16 o_22 f_26)))))
 :qid |stdinbpl.1433:37|
 :skolemid |63|
 :pattern ( (MapType1Select newPMask@16 o_22 f_26))
)) (= Heap@66 (MapType0Store Heap@65 null (|valid#sm| this@@21) newPMask@16))) (and (= Heap@67 Heap@66) (= (ControlFlow 0 20) 19))) anon51_correct))))
(let ((anon49_correct  (=> (state Heap@63 Mask@0) (=> (and (= Heap@64 (MapType0Store Heap@63 null (|valid#sm| this@@21) (MapType1Store (MapType0Select Heap@63 null (|valid#sm| this@@21)) this@@21 next (bool_2_U true)))) (= Heap@65 (MapType0Store Heap@64 null (|valid#sm| this@@21) (MapType1Store (MapType0Select Heap@64 null (|valid#sm| this@@21)) this@@21 value (bool_2_U true))))) (and (=> (= (ControlFlow 0 22) 20) anon88_Then_correct) (=> (= (ControlFlow 0 22) 21) anon88_Else_correct))))))
(let ((anon87_Else_correct  (=> (= (MapType0Select Heap@61 (MapType0Select Heap@61 this@@21 next) next) null) (=> (and (= Heap@63 Heap@61) (= (ControlFlow 0 24) 22)) anon49_correct))))
(let ((anon87_Then_correct  (=> (not (= (MapType0Select Heap@61 (MapType0Select Heap@61 this@@21 next) next) null)) (=> (and (and (forall ((o_21 T@U) (f_25 T@U) ) (! (let ((B@@17 (FieldTypeInv1 (type f_25))))
(let ((A@@18 (FieldTypeInv0 (type f_25))))
 (=> (and (and (= (type o_21) RefType) (= (type f_25) (FieldType A@@18 B@@17))) (or (U_2_bool (MapType1Select (MapType0Select Heap@61 null (|valid#sm| (MapType0Select Heap@61 this@@21 next))) o_21 f_25)) (U_2_bool (MapType1Select (MapType0Select Heap@61 null (|valid#sm| (MapType0Select Heap@61 (MapType0Select Heap@61 this@@21 next) next))) o_21 f_25)))) (U_2_bool (MapType1Select newPMask@15 o_21 f_25)))))
 :qid |stdinbpl.1420:37|
 :skolemid |62|
 :pattern ( (MapType1Select newPMask@15 o_21 f_25))
)) (= Heap@62 (MapType0Store Heap@61 null (|valid#sm| (MapType0Select Heap@61 this@@21 next)) newPMask@15))) (and (= Heap@63 Heap@62) (= (ControlFlow 0 23) 22))) anon49_correct))))
(let ((anon47_correct  (=> (state Heap@59 Unfolding1Mask@9) (and (=> (= (ControlFlow 0 25) (- 0 28)) (HasDirectPerm Unfolding1Mask@9 this@@21 next)) (=> (HasDirectPerm Unfolding1Mask@9 this@@21 next) (and (=> (= (ControlFlow 0 25) (- 0 27)) (HasDirectPerm Unfolding1Mask@9 this@@21 next)) (=> (HasDirectPerm Unfolding1Mask@9 this@@21 next) (and (=> (= (ControlFlow 0 25) (- 0 26)) (HasDirectPerm Unfolding1Mask@9 (MapType0Select Heap@59 this@@21 next) next)) (=> (HasDirectPerm Unfolding1Mask@9 (MapType0Select Heap@59 this@@21 next) next) (=> (and (= Heap@60 (MapType0Store Heap@59 null (|valid#sm| (MapType0Select Heap@59 this@@21 next)) (MapType1Store (MapType0Select Heap@59 null (|valid#sm| (MapType0Select Heap@59 this@@21 next))) (MapType0Select Heap@59 this@@21 next) next (bool_2_U true)))) (= Heap@61 (MapType0Store Heap@60 null (|valid#sm| (MapType0Select Heap@60 this@@21 next)) (MapType1Store (MapType0Select Heap@60 null (|valid#sm| (MapType0Select Heap@60 this@@21 next))) (MapType0Select Heap@60 this@@21 next) value (bool_2_U true))))) (and (=> (= (ControlFlow 0 25) 23) anon87_Then_correct) (=> (= (ControlFlow 0 25) 24) anon87_Else_correct))))))))))))
(let ((anon86_Else_correct  (=> (= (MapType0Select Heap@59 (MapType0Select Heap@59 this@@21 next) next) null) (=> (and (= Unfolding1Mask@9 Unfolding1Mask@7) (= (ControlFlow 0 30) 25)) anon47_correct))))
(let ((anon86_Then_correct  (=> (not (= (MapType0Select Heap@59 (MapType0Select Heap@59 this@@21 next) next) null)) (=> (and (> wildcard@26 NoPerm) (= Unfolding1Mask@8 (MapType1Store Unfolding1Mask@7 null (valid (MapType0Select Heap@59 (MapType0Select Heap@59 this@@21 next) next)) (real_2_U (+ (U_2_real (MapType1Select Unfolding1Mask@7 null (valid (MapType0Select Heap@59 (MapType0Select Heap@59 this@@21 next) next)))) wildcard@26))))) (=> (and (and (InsidePredicate (valid (MapType0Select Heap@59 this@@21 next)) (MapType0Select Heap@59 null (valid (MapType0Select Heap@59 this@@21 next))) (valid (MapType0Select Heap@59 (MapType0Select Heap@59 this@@21 next) next)) (MapType0Select Heap@59 null (valid (MapType0Select Heap@59 (MapType0Select Heap@59 this@@21 next) next)))) (state Heap@59 Unfolding1Mask@8)) (and (= Unfolding1Mask@9 Unfolding1Mask@8) (= (ControlFlow 0 29) 25))) anon47_correct)))))
(let ((anon45_correct  (=> (state Heap@59 UnfoldingMask@24) (=> (and (|valid#trigger| Heap@59 (valid (MapType0Select Heap@59 this@@21 next))) (= (MapType0Select Heap@59 null (valid (MapType0Select Heap@59 this@@21 next))) (CombineFrames (FrameFragment (MapType0Select Heap@59 (MapType0Select Heap@59 this@@21 next) next)) (CombineFrames (FrameFragment (MapType0Select Heap@59 (MapType0Select Heap@59 this@@21 next) value)) (FrameFragment (ite (not (= (MapType0Select Heap@59 (MapType0Select Heap@59 this@@21 next) next) null)) (MapType0Select Heap@59 null (valid (MapType0Select Heap@59 (MapType0Select Heap@59 this@@21 next) next))) EmptyFrame)))))) (and (=> (= (ControlFlow 0 31) (- 0 32)) (> (U_2_real (MapType1Select UnfoldingMask@24 null (valid (MapType0Select Heap@59 this@@21 next)))) NoPerm)) (=> (> (U_2_real (MapType1Select UnfoldingMask@24 null (valid (MapType0Select Heap@59 this@@21 next)))) NoPerm) (=> (> wildcard@23 NoPerm) (=> (and (< wildcard@23 (U_2_real (MapType1Select UnfoldingMask@24 null (valid (MapType0Select Heap@59 this@@21 next))))) (= Unfolding1Mask@5 (MapType1Store UnfoldingMask@24 null (valid (MapType0Select Heap@59 this@@21 next)) (real_2_U (- (U_2_real (MapType1Select UnfoldingMask@24 null (valid (MapType0Select Heap@59 this@@21 next)))) wildcard@23))))) (=> (and (and (and (> wildcard@24 NoPerm) (not (= (MapType0Select Heap@59 this@@21 next) null))) (and (= Unfolding1Mask@6 (MapType1Store Unfolding1Mask@5 (MapType0Select Heap@59 this@@21 next) next (real_2_U (+ (U_2_real (MapType1Select Unfolding1Mask@5 (MapType0Select Heap@59 this@@21 next) next)) wildcard@24)))) (state Heap@59 Unfolding1Mask@6))) (and (and (> wildcard@25 NoPerm) (not (= (MapType0Select Heap@59 this@@21 next) null))) (and (= Unfolding1Mask@7 (MapType1Store Unfolding1Mask@6 (MapType0Select Heap@59 this@@21 next) value (real_2_U (+ (U_2_real (MapType1Select Unfolding1Mask@6 (MapType0Select Heap@59 this@@21 next) value)) wildcard@25)))) (state Heap@59 Unfolding1Mask@7)))) (and (=> (= (ControlFlow 0 31) 29) anon86_Then_correct) (=> (= (ControlFlow 0 31) 30) anon86_Else_correct)))))))))))
(let ((anon85_Else_correct  (=> (= (MapType0Select Heap@59 this@@21 next) null) (=> (and (= UnfoldingMask@24 UnfoldingMask@22) (= (ControlFlow 0 34) 31)) anon45_correct))))
(let ((anon85_Then_correct  (=> (not (= (MapType0Select Heap@59 this@@21 next) null)) (=> (and (> wildcard@22 NoPerm) (= UnfoldingMask@23 (MapType1Store UnfoldingMask@22 null (valid (MapType0Select Heap@59 this@@21 next)) (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@22 null (valid (MapType0Select Heap@59 this@@21 next)))) wildcard@22))))) (=> (and (and (InsidePredicate (valid this@@21) (MapType0Select Heap@59 null (valid this@@21)) (valid (MapType0Select Heap@59 this@@21 next)) (MapType0Select Heap@59 null (valid (MapType0Select Heap@59 this@@21 next)))) (state Heap@59 UnfoldingMask@23)) (and (= UnfoldingMask@24 UnfoldingMask@23) (= (ControlFlow 0 33) 31))) anon45_correct)))))
(let ((anon43_correct  (=> (and (and (state Heap@59 Mask@0) (state Heap@59 Mask@0)) (and (|valid#trigger| Heap@59 (valid this@@21)) (= (MapType0Select Heap@59 null (valid this@@21)) (CombineFrames (FrameFragment (MapType0Select Heap@59 this@@21 next)) (CombineFrames (FrameFragment (MapType0Select Heap@59 this@@21 value)) (FrameFragment (ite (not (= (MapType0Select Heap@59 this@@21 next) null)) (MapType0Select Heap@59 null (valid (MapType0Select Heap@59 this@@21 next))) EmptyFrame))))))) (and (=> (= (ControlFlow 0 35) (- 0 36)) (> (U_2_real (MapType1Select Mask@0 null (valid this@@21))) NoPerm)) (=> (> (U_2_real (MapType1Select Mask@0 null (valid this@@21))) NoPerm) (=> (> wildcard@19 NoPerm) (=> (and (< wildcard@19 (U_2_real (MapType1Select Mask@0 null (valid this@@21)))) (= UnfoldingMask@20 (MapType1Store Mask@0 null (valid this@@21) (real_2_U (- (U_2_real (MapType1Select Mask@0 null (valid this@@21))) wildcard@19))))) (=> (and (and (and (> wildcard@20 NoPerm) (not (= this@@21 null))) (and (= UnfoldingMask@21 (MapType1Store UnfoldingMask@20 this@@21 next (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@20 this@@21 next)) wildcard@20)))) (state Heap@59 UnfoldingMask@21))) (and (and (> wildcard@21 NoPerm) (not (= this@@21 null))) (and (= UnfoldingMask@22 (MapType1Store UnfoldingMask@21 this@@21 value (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@21 this@@21 value)) wildcard@21)))) (state Heap@59 UnfoldingMask@22)))) (and (=> (= (ControlFlow 0 35) 33) anon85_Then_correct) (=> (= (ControlFlow 0 35) 34) anon85_Else_correct))))))))))
(let ((anon84_Else_correct  (=> (= (MapType0Select Heap@57 (MapType0Select Heap@57 this@@21 next) next) null) (=> (and (= Heap@59 Heap@57) (= (ControlFlow 0 38) 35)) anon43_correct))))
(let ((anon84_Then_correct  (=> (not (= (MapType0Select Heap@57 (MapType0Select Heap@57 this@@21 next) next) null)) (=> (and (and (forall ((o_20 T@U) (f_24 T@U) ) (! (let ((B@@18 (FieldTypeInv1 (type f_24))))
(let ((A@@19 (FieldTypeInv0 (type f_24))))
 (=> (and (and (= (type o_20) RefType) (= (type f_24) (FieldType A@@19 B@@18))) (or (U_2_bool (MapType1Select (MapType0Select Heap@57 null (|valid#sm| (MapType0Select Heap@57 this@@21 next))) o_20 f_24)) (U_2_bool (MapType1Select (MapType0Select Heap@57 null (|valid#sm| (MapType0Select Heap@57 (MapType0Select Heap@57 this@@21 next) next))) o_20 f_24)))) (U_2_bool (MapType1Select newPMask@14 o_20 f_24)))))
 :qid |stdinbpl.1330:35|
 :skolemid |61|
 :pattern ( (MapType1Select newPMask@14 o_20 f_24))
)) (= Heap@58 (MapType0Store Heap@57 null (|valid#sm| (MapType0Select Heap@57 this@@21 next)) newPMask@14))) (and (= Heap@59 Heap@58) (= (ControlFlow 0 37) 35))) anon43_correct))))
(let ((anon41_correct  (=> (state Heap@55 Mask@0) (=> (and (= Heap@56 (MapType0Store Heap@55 null (|valid#sm| (MapType0Select Heap@55 this@@21 next)) (MapType1Store (MapType0Select Heap@55 null (|valid#sm| (MapType0Select Heap@55 this@@21 next))) (MapType0Select Heap@55 this@@21 next) next (bool_2_U true)))) (= Heap@57 (MapType0Store Heap@56 null (|valid#sm| (MapType0Select Heap@56 this@@21 next)) (MapType1Store (MapType0Select Heap@56 null (|valid#sm| (MapType0Select Heap@56 this@@21 next))) (MapType0Select Heap@56 this@@21 next) value (bool_2_U true))))) (and (=> (= (ControlFlow 0 39) 37) anon84_Then_correct) (=> (= (ControlFlow 0 39) 38) anon84_Else_correct))))))
(let ((anon83_Else_correct  (=> (= (MapType0Select Heap@53 this@@21 next) null) (=> (and (= Heap@55 Heap@53) (= (ControlFlow 0 41) 39)) anon41_correct))))
(let ((anon83_Then_correct  (=> (not (= (MapType0Select Heap@53 this@@21 next) null)) (=> (and (and (forall ((o_19 T@U) (f_23 T@U) ) (! (let ((B@@19 (FieldTypeInv1 (type f_23))))
(let ((A@@20 (FieldTypeInv0 (type f_23))))
 (=> (and (and (= (type o_19) RefType) (= (type f_23) (FieldType A@@20 B@@19))) (or (U_2_bool (MapType1Select (MapType0Select Heap@53 null (|valid#sm| this@@21)) o_19 f_23)) (U_2_bool (MapType1Select (MapType0Select Heap@53 null (|valid#sm| (MapType0Select Heap@53 this@@21 next))) o_19 f_23)))) (U_2_bool (MapType1Select newPMask@13 o_19 f_23)))))
 :qid |stdinbpl.1319:35|
 :skolemid |60|
 :pattern ( (MapType1Select newPMask@13 o_19 f_23))
)) (= Heap@54 (MapType0Store Heap@53 null (|valid#sm| this@@21) newPMask@13))) (and (= Heap@55 Heap@54) (= (ControlFlow 0 40) 39))) anon41_correct))))
(let ((anon39_correct  (=> (state Heap@51 Mask@0) (=> (and (= Heap@52 (MapType0Store Heap@51 null (|valid#sm| this@@21) (MapType1Store (MapType0Select Heap@51 null (|valid#sm| this@@21)) this@@21 next (bool_2_U true)))) (= Heap@53 (MapType0Store Heap@52 null (|valid#sm| this@@21) (MapType1Store (MapType0Select Heap@52 null (|valid#sm| this@@21)) this@@21 value (bool_2_U true))))) (and (=> (= (ControlFlow 0 42) 40) anon83_Then_correct) (=> (= (ControlFlow 0 42) 41) anon83_Else_correct))))))
(let ((anon82_Else_correct  (=> (= (MapType0Select Heap@49 this@@21 next) null) (=> (and (= Heap@51 Heap@49) (= (ControlFlow 0 44) 42)) anon39_correct))))
(let ((anon82_Then_correct  (=> (not (= (MapType0Select Heap@49 this@@21 next) null)) (=> (and (and (forall ((o_18 T@U) (f_22 T@U) ) (! (let ((B@@20 (FieldTypeInv1 (type f_22))))
(let ((A@@21 (FieldTypeInv0 (type f_22))))
 (=> (and (and (= (type o_18) RefType) (= (type f_22) (FieldType A@@21 B@@20))) (or (U_2_bool (MapType1Select (MapType0Select Heap@49 null (|valid#sm| this@@21)) o_18 f_22)) (U_2_bool (MapType1Select (MapType0Select Heap@49 null (|valid#sm| (MapType0Select Heap@49 this@@21 next))) o_18 f_22)))) (U_2_bool (MapType1Select newPMask@12 o_18 f_22)))))
 :qid |stdinbpl.1308:35|
 :skolemid |59|
 :pattern ( (MapType1Select newPMask@12 o_18 f_22))
)) (= Heap@50 (MapType0Store Heap@49 null (|valid#sm| this@@21) newPMask@12))) (and (= Heap@51 Heap@50) (= (ControlFlow 0 43) 42))) anon39_correct))))
(let ((anon37_correct  (=> (state Heap@47 Mask@0) (and (=> (= (ControlFlow 0 45) (- 0 46)) (not (= (MapType0Select Heap@47 this@@21 next) (MapType0Select Heap@47 (MapType0Select Heap@47 this@@21 next) next)))) (=> (not (= (MapType0Select Heap@47 this@@21 next) (MapType0Select Heap@47 (MapType0Select Heap@47 this@@21 next) next))) (=> (and (= Heap@48 (MapType0Store Heap@47 null (|valid#sm| this@@21) (MapType1Store (MapType0Select Heap@47 null (|valid#sm| this@@21)) this@@21 next (bool_2_U true)))) (= Heap@49 (MapType0Store Heap@48 null (|valid#sm| this@@21) (MapType1Store (MapType0Select Heap@48 null (|valid#sm| this@@21)) this@@21 value (bool_2_U true))))) (and (=> (= (ControlFlow 0 45) 43) anon82_Then_correct) (=> (= (ControlFlow 0 45) 44) anon82_Else_correct))))))))
(let ((anon81_Else_correct  (=> (= (MapType0Select Heap@45 (MapType0Select Heap@45 this@@21 next) next) null) (=> (and (= Heap@47 Heap@45) (= (ControlFlow 0 48) 45)) anon37_correct))))
(let ((anon81_Then_correct  (=> (not (= (MapType0Select Heap@45 (MapType0Select Heap@45 this@@21 next) next) null)) (=> (and (and (forall ((o_17 T@U) (f_21 T@U) ) (! (let ((B@@21 (FieldTypeInv1 (type f_21))))
(let ((A@@22 (FieldTypeInv0 (type f_21))))
 (=> (and (and (= (type o_17) RefType) (= (type f_21) (FieldType A@@22 B@@21))) (or (U_2_bool (MapType1Select (MapType0Select Heap@45 null (|valid#sm| (MapType0Select Heap@45 this@@21 next))) o_17 f_21)) (U_2_bool (MapType1Select (MapType0Select Heap@45 null (|valid#sm| (MapType0Select Heap@45 (MapType0Select Heap@45 this@@21 next) next))) o_17 f_21)))) (U_2_bool (MapType1Select newPMask@11 o_17 f_21)))))
 :qid |stdinbpl.1293:37|
 :skolemid |58|
 :pattern ( (MapType1Select newPMask@11 o_17 f_21))
)) (= Heap@46 (MapType0Store Heap@45 null (|valid#sm| (MapType0Select Heap@45 this@@21 next)) newPMask@11))) (and (= Heap@47 Heap@46) (= (ControlFlow 0 47) 45))) anon37_correct))))
(let ((anon35_correct  (=> (state Heap@43 Mask@0) (=> (and (= Heap@44 (MapType0Store Heap@43 null (|valid#sm| (MapType0Select Heap@43 this@@21 next)) (MapType1Store (MapType0Select Heap@43 null (|valid#sm| (MapType0Select Heap@43 this@@21 next))) (MapType0Select Heap@43 this@@21 next) next (bool_2_U true)))) (= Heap@45 (MapType0Store Heap@44 null (|valid#sm| (MapType0Select Heap@44 this@@21 next)) (MapType1Store (MapType0Select Heap@44 null (|valid#sm| (MapType0Select Heap@44 this@@21 next))) (MapType0Select Heap@44 this@@21 next) value (bool_2_U true))))) (and (=> (= (ControlFlow 0 49) 47) anon81_Then_correct) (=> (= (ControlFlow 0 49) 48) anon81_Else_correct))))))
(let ((anon80_Else_correct  (=> (= (MapType0Select Heap@41 this@@21 next) null) (=> (and (= Heap@43 Heap@41) (= (ControlFlow 0 51) 49)) anon35_correct))))
(let ((anon80_Then_correct  (=> (not (= (MapType0Select Heap@41 this@@21 next) null)) (=> (and (and (forall ((o_16 T@U) (f_20 T@U) ) (! (let ((B@@22 (FieldTypeInv1 (type f_20))))
(let ((A@@23 (FieldTypeInv0 (type f_20))))
 (=> (and (and (= (type o_16) RefType) (= (type f_20) (FieldType A@@23 B@@22))) (or (U_2_bool (MapType1Select (MapType0Select Heap@41 null (|valid#sm| this@@21)) o_16 f_20)) (U_2_bool (MapType1Select (MapType0Select Heap@41 null (|valid#sm| (MapType0Select Heap@41 this@@21 next))) o_16 f_20)))) (U_2_bool (MapType1Select newPMask@10 o_16 f_20)))))
 :qid |stdinbpl.1282:37|
 :skolemid |57|
 :pattern ( (MapType1Select newPMask@10 o_16 f_20))
)) (= Heap@42 (MapType0Store Heap@41 null (|valid#sm| this@@21) newPMask@10))) (and (= Heap@43 Heap@42) (= (ControlFlow 0 50) 49))) anon35_correct))))
(let ((anon33_correct  (=> (state Heap@39 Mask@0) (=> (and (= Heap@40 (MapType0Store Heap@39 null (|valid#sm| this@@21) (MapType1Store (MapType0Select Heap@39 null (|valid#sm| this@@21)) this@@21 next (bool_2_U true)))) (= Heap@41 (MapType0Store Heap@40 null (|valid#sm| this@@21) (MapType1Store (MapType0Select Heap@40 null (|valid#sm| this@@21)) this@@21 value (bool_2_U true))))) (and (=> (= (ControlFlow 0 52) 50) anon80_Then_correct) (=> (= (ControlFlow 0 52) 51) anon80_Else_correct))))))
(let ((anon79_Else_correct  (=> (= (MapType0Select Heap@37 this@@21 next) null) (=> (and (= Heap@39 Heap@37) (= (ControlFlow 0 54) 52)) anon33_correct))))
(let ((anon79_Then_correct  (=> (not (= (MapType0Select Heap@37 this@@21 next) null)) (=> (and (and (forall ((o_15 T@U) (f_19 T@U) ) (! (let ((B@@23 (FieldTypeInv1 (type f_19))))
(let ((A@@24 (FieldTypeInv0 (type f_19))))
 (=> (and (and (= (type o_15) RefType) (= (type f_19) (FieldType A@@24 B@@23))) (or (U_2_bool (MapType1Select (MapType0Select Heap@37 null (|valid#sm| this@@21)) o_15 f_19)) (U_2_bool (MapType1Select (MapType0Select Heap@37 null (|valid#sm| (MapType0Select Heap@37 this@@21 next))) o_15 f_19)))) (U_2_bool (MapType1Select newPMask@9 o_15 f_19)))))
 :qid |stdinbpl.1271:37|
 :skolemid |56|
 :pattern ( (MapType1Select newPMask@9 o_15 f_19))
)) (= Heap@38 (MapType0Store Heap@37 null (|valid#sm| this@@21) newPMask@9))) (and (= Heap@39 Heap@38) (= (ControlFlow 0 53) 52))) anon33_correct))))
(let ((anon31_correct  (=> (state Heap@35 Mask@0) (=> (and (= Heap@36 (MapType0Store Heap@35 null (|valid#sm| this@@21) (MapType1Store (MapType0Select Heap@35 null (|valid#sm| this@@21)) this@@21 next (bool_2_U true)))) (= Heap@37 (MapType0Store Heap@36 null (|valid#sm| this@@21) (MapType1Store (MapType0Select Heap@36 null (|valid#sm| this@@21)) this@@21 value (bool_2_U true))))) (and (=> (= (ControlFlow 0 55) 53) anon79_Then_correct) (=> (= (ControlFlow 0 55) 54) anon79_Else_correct))))))
(let ((anon78_Else_correct  (=> (= (MapType0Select Heap@33 (MapType0Select Heap@33 this@@21 next) next) null) (=> (and (= Heap@35 Heap@33) (= (ControlFlow 0 57) 55)) anon31_correct))))
(let ((anon78_Then_correct  (=> (not (= (MapType0Select Heap@33 (MapType0Select Heap@33 this@@21 next) next) null)) (=> (and (and (forall ((o_14 T@U) (f_18 T@U) ) (! (let ((B@@24 (FieldTypeInv1 (type f_18))))
(let ((A@@25 (FieldTypeInv0 (type f_18))))
 (=> (and (and (= (type o_14) RefType) (= (type f_18) (FieldType A@@25 B@@24))) (or (U_2_bool (MapType1Select (MapType0Select Heap@33 null (|valid#sm| (MapType0Select Heap@33 this@@21 next))) o_14 f_18)) (U_2_bool (MapType1Select (MapType0Select Heap@33 null (|valid#sm| (MapType0Select Heap@33 (MapType0Select Heap@33 this@@21 next) next))) o_14 f_18)))) (U_2_bool (MapType1Select newPMask@8 o_14 f_18)))))
 :qid |stdinbpl.1258:37|
 :skolemid |55|
 :pattern ( (MapType1Select newPMask@8 o_14 f_18))
)) (= Heap@34 (MapType0Store Heap@33 null (|valid#sm| (MapType0Select Heap@33 this@@21 next)) newPMask@8))) (and (= Heap@35 Heap@34) (= (ControlFlow 0 56) 55))) anon31_correct))))
(let ((anon29_correct  (=> (state Heap@31 Mask@0) (=> (and (= Heap@32 (MapType0Store Heap@31 null (|valid#sm| (MapType0Select Heap@31 this@@21 next)) (MapType1Store (MapType0Select Heap@31 null (|valid#sm| (MapType0Select Heap@31 this@@21 next))) (MapType0Select Heap@31 this@@21 next) next (bool_2_U true)))) (= Heap@33 (MapType0Store Heap@32 null (|valid#sm| (MapType0Select Heap@32 this@@21 next)) (MapType1Store (MapType0Select Heap@32 null (|valid#sm| (MapType0Select Heap@32 this@@21 next))) (MapType0Select Heap@32 this@@21 next) value (bool_2_U true))))) (and (=> (= (ControlFlow 0 58) 56) anon78_Then_correct) (=> (= (ControlFlow 0 58) 57) anon78_Else_correct))))))
(let ((anon77_Else_correct  (=> (= (MapType0Select Heap@29 this@@21 next) null) (=> (and (= Heap@31 Heap@29) (= (ControlFlow 0 60) 58)) anon29_correct))))
(let ((anon77_Then_correct  (=> (not (= (MapType0Select Heap@29 this@@21 next) null)) (=> (and (and (forall ((o_13 T@U) (f_17 T@U) ) (! (let ((B@@25 (FieldTypeInv1 (type f_17))))
(let ((A@@26 (FieldTypeInv0 (type f_17))))
 (=> (and (and (= (type o_13) RefType) (= (type f_17) (FieldType A@@26 B@@25))) (or (U_2_bool (MapType1Select (MapType0Select Heap@29 null (|valid#sm| this@@21)) o_13 f_17)) (U_2_bool (MapType1Select (MapType0Select Heap@29 null (|valid#sm| (MapType0Select Heap@29 this@@21 next))) o_13 f_17)))) (U_2_bool (MapType1Select newPMask@7 o_13 f_17)))))
 :qid |stdinbpl.1247:37|
 :skolemid |54|
 :pattern ( (MapType1Select newPMask@7 o_13 f_17))
)) (= Heap@30 (MapType0Store Heap@29 null (|valid#sm| this@@21) newPMask@7))) (and (= Heap@31 Heap@30) (= (ControlFlow 0 59) 58))) anon29_correct))))
(let ((anon27_correct  (=> (state Heap@27 Mask@0) (=> (and (= Heap@28 (MapType0Store Heap@27 null (|valid#sm| this@@21) (MapType1Store (MapType0Select Heap@27 null (|valid#sm| this@@21)) this@@21 next (bool_2_U true)))) (= Heap@29 (MapType0Store Heap@28 null (|valid#sm| this@@21) (MapType1Store (MapType0Select Heap@28 null (|valid#sm| this@@21)) this@@21 value (bool_2_U true))))) (and (=> (= (ControlFlow 0 61) 59) anon77_Then_correct) (=> (= (ControlFlow 0 61) 60) anon77_Else_correct))))))
(let ((anon76_Else_correct  (=> (= (MapType0Select Heap@25 (MapType0Select Heap@25 this@@21 next) next) null) (=> (and (= Heap@27 Heap@25) (= (ControlFlow 0 63) 61)) anon27_correct))))
(let ((anon76_Then_correct  (=> (not (= (MapType0Select Heap@25 (MapType0Select Heap@25 this@@21 next) next) null)) (=> (and (and (forall ((o_12 T@U) (f_16 T@U) ) (! (let ((B@@26 (FieldTypeInv1 (type f_16))))
(let ((A@@27 (FieldTypeInv0 (type f_16))))
 (=> (and (and (= (type o_12) RefType) (= (type f_16) (FieldType A@@27 B@@26))) (or (U_2_bool (MapType1Select (MapType0Select Heap@25 null (|valid#sm| (MapType0Select Heap@25 this@@21 next))) o_12 f_16)) (U_2_bool (MapType1Select (MapType0Select Heap@25 null (|valid#sm| (MapType0Select Heap@25 (MapType0Select Heap@25 this@@21 next) next))) o_12 f_16)))) (U_2_bool (MapType1Select newPMask@6 o_12 f_16)))))
 :qid |stdinbpl.1234:37|
 :skolemid |53|
 :pattern ( (MapType1Select newPMask@6 o_12 f_16))
)) (= Heap@26 (MapType0Store Heap@25 null (|valid#sm| (MapType0Select Heap@25 this@@21 next)) newPMask@6))) (and (= Heap@27 Heap@26) (= (ControlFlow 0 62) 61))) anon27_correct))))
(let ((anon25_correct  (=> (state Heap@19 Unfolding1Mask@4) (and (=> (= (ControlFlow 0 64) (- 0 67)) (HasDirectPerm Unfolding1Mask@4 this@@21 next)) (=> (HasDirectPerm Unfolding1Mask@4 this@@21 next) (and (=> (= (ControlFlow 0 64) (- 0 66)) (HasDirectPerm Unfolding1Mask@4 this@@21 next)) (=> (HasDirectPerm Unfolding1Mask@4 this@@21 next) (and (=> (= (ControlFlow 0 64) (- 0 65)) (HasDirectPerm Unfolding1Mask@4 (MapType0Select Heap@23 this@@21 next) next)) (=> (HasDirectPerm Unfolding1Mask@4 (MapType0Select Heap@23 this@@21 next) next) (=> (and (= Heap@24 (MapType0Store Heap@23 null (|valid#sm| (MapType0Select Heap@23 this@@21 next)) (MapType1Store (MapType0Select Heap@23 null (|valid#sm| (MapType0Select Heap@23 this@@21 next))) (MapType0Select Heap@23 this@@21 next) next (bool_2_U true)))) (= Heap@25 (MapType0Store Heap@24 null (|valid#sm| (MapType0Select Heap@24 this@@21 next)) (MapType1Store (MapType0Select Heap@24 null (|valid#sm| (MapType0Select Heap@24 this@@21 next))) (MapType0Select Heap@24 this@@21 next) value (bool_2_U true))))) (and (=> (= (ControlFlow 0 64) 62) anon76_Then_correct) (=> (= (ControlFlow 0 64) 63) anon76_Else_correct))))))))))))
(let ((anon75_Else_correct  (=> (= (MapType0Select Heap@19 (MapType0Select Heap@19 this@@21 next) next) null) (=> (and (= Unfolding1Mask@4 Unfolding1Mask@2) (= (ControlFlow 0 69) 64)) anon25_correct))))
(let ((anon75_Then_correct  (=> (not (= (MapType0Select Heap@19 (MapType0Select Heap@19 this@@21 next) next) null)) (=> (and (> wildcard@18 NoPerm) (= Unfolding1Mask@3 (MapType1Store Unfolding1Mask@2 null (valid (MapType0Select Heap@19 (MapType0Select Heap@19 this@@21 next) next)) (real_2_U (+ (U_2_real (MapType1Select Unfolding1Mask@2 null (valid (MapType0Select Heap@19 (MapType0Select Heap@19 this@@21 next) next)))) wildcard@18))))) (=> (and (and (InsidePredicate (valid (MapType0Select Heap@19 this@@21 next)) (MapType0Select Heap@19 null (valid (MapType0Select Heap@19 this@@21 next))) (valid (MapType0Select Heap@19 (MapType0Select Heap@19 this@@21 next) next)) (MapType0Select Heap@19 null (valid (MapType0Select Heap@19 (MapType0Select Heap@19 this@@21 next) next)))) (state Heap@19 Unfolding1Mask@3)) (and (= Unfolding1Mask@4 Unfolding1Mask@3) (= (ControlFlow 0 68) 64))) anon25_correct)))))
(let ((anon23_correct  (=> (state Heap@19 UnfoldingMask@19) (=> (and (|valid#trigger| Heap@19 (valid (MapType0Select Heap@19 this@@21 next))) (= (MapType0Select Heap@19 null (valid (MapType0Select Heap@19 this@@21 next))) (CombineFrames (FrameFragment (MapType0Select Heap@19 (MapType0Select Heap@19 this@@21 next) next)) (CombineFrames (FrameFragment (MapType0Select Heap@19 (MapType0Select Heap@19 this@@21 next) value)) (FrameFragment (ite (not (= (MapType0Select Heap@19 (MapType0Select Heap@19 this@@21 next) next) null)) (MapType0Select Heap@19 null (valid (MapType0Select Heap@19 (MapType0Select Heap@19 this@@21 next) next))) EmptyFrame)))))) (and (=> (= (ControlFlow 0 70) (- 0 71)) (> (U_2_real (MapType1Select UnfoldingMask@19 null (valid (MapType0Select Heap@19 this@@21 next)))) NoPerm)) (=> (> (U_2_real (MapType1Select UnfoldingMask@19 null (valid (MapType0Select Heap@19 this@@21 next)))) NoPerm) (=> (> wildcard@15 NoPerm) (=> (and (< wildcard@15 (U_2_real (MapType1Select UnfoldingMask@19 null (valid (MapType0Select Heap@19 this@@21 next))))) (= Unfolding1Mask@0 (MapType1Store UnfoldingMask@19 null (valid (MapType0Select Heap@19 this@@21 next)) (real_2_U (- (U_2_real (MapType1Select UnfoldingMask@19 null (valid (MapType0Select Heap@19 this@@21 next)))) wildcard@15))))) (=> (and (and (and (> wildcard@16 NoPerm) (not (= (MapType0Select Heap@19 this@@21 next) null))) (and (= Unfolding1Mask@1 (MapType1Store Unfolding1Mask@0 (MapType0Select Heap@19 this@@21 next) next (real_2_U (+ (U_2_real (MapType1Select Unfolding1Mask@0 (MapType0Select Heap@19 this@@21 next) next)) wildcard@16)))) (state Heap@19 Unfolding1Mask@1))) (and (and (> wildcard@17 NoPerm) (not (= (MapType0Select Heap@19 this@@21 next) null))) (and (= Unfolding1Mask@2 (MapType1Store Unfolding1Mask@1 (MapType0Select Heap@19 this@@21 next) value (real_2_U (+ (U_2_real (MapType1Select Unfolding1Mask@1 (MapType0Select Heap@19 this@@21 next) value)) wildcard@17)))) (state Heap@19 Unfolding1Mask@2)))) (and (=> (= (ControlFlow 0 70) 68) anon75_Then_correct) (=> (= (ControlFlow 0 70) 69) anon75_Else_correct)))))))))))
(let ((anon74_Else_correct  (=> (= (MapType0Select Heap@19 this@@21 next) null) (=> (and (= UnfoldingMask@19 UnfoldingMask@17) (= (ControlFlow 0 73) 70)) anon23_correct))))
(let ((anon74_Then_correct  (=> (not (= (MapType0Select Heap@19 this@@21 next) null)) (=> (and (> wildcard@14 NoPerm) (= UnfoldingMask@18 (MapType1Store UnfoldingMask@17 null (valid (MapType0Select Heap@19 this@@21 next)) (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@17 null (valid (MapType0Select Heap@19 this@@21 next)))) wildcard@14))))) (=> (and (and (InsidePredicate (valid this@@21) (MapType0Select Heap@19 null (valid this@@21)) (valid (MapType0Select Heap@19 this@@21 next)) (MapType0Select Heap@19 null (valid (MapType0Select Heap@19 this@@21 next)))) (state Heap@19 UnfoldingMask@18)) (and (= UnfoldingMask@19 UnfoldingMask@18) (= (ControlFlow 0 72) 70))) anon23_correct)))))
(let ((anon21_correct  (=> (state Heap@23 Mask@0) (=> (and (|valid#trigger| Heap@19 (valid this@@21)) (= (MapType0Select Heap@19 null (valid this@@21)) (CombineFrames (FrameFragment (MapType0Select Heap@19 this@@21 next)) (CombineFrames (FrameFragment (MapType0Select Heap@19 this@@21 value)) (FrameFragment (ite (not (= (MapType0Select Heap@19 this@@21 next) null)) (MapType0Select Heap@19 null (valid (MapType0Select Heap@19 this@@21 next))) EmptyFrame)))))) (and (=> (= (ControlFlow 0 74) (- 0 75)) (> (U_2_real (MapType1Select Mask@0 null (valid this@@21))) NoPerm)) (=> (> (U_2_real (MapType1Select Mask@0 null (valid this@@21))) NoPerm) (=> (> wildcard@11 NoPerm) (=> (and (< wildcard@11 (U_2_real (MapType1Select Mask@0 null (valid this@@21)))) (= UnfoldingMask@15 (MapType1Store Mask@0 null (valid this@@21) (real_2_U (- (U_2_real (MapType1Select Mask@0 null (valid this@@21))) wildcard@11))))) (=> (and (and (and (> wildcard@12 NoPerm) (not (= this@@21 null))) (and (= UnfoldingMask@16 (MapType1Store UnfoldingMask@15 this@@21 next (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@15 this@@21 next)) wildcard@12)))) (state Heap@19 UnfoldingMask@16))) (and (and (> wildcard@13 NoPerm) (not (= this@@21 null))) (and (= UnfoldingMask@17 (MapType1Store UnfoldingMask@16 this@@21 value (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@16 this@@21 value)) wildcard@13)))) (state Heap@19 UnfoldingMask@17)))) (and (=> (= (ControlFlow 0 74) 72) anon74_Then_correct) (=> (= (ControlFlow 0 74) 73) anon74_Else_correct)))))))))))
(let ((anon73_Else_correct  (=> (= (MapType0Select Heap@21 this@@21 next) null) (=> (and (= Heap@23 Heap@21) (= (ControlFlow 0 77) 74)) anon21_correct))))
(let ((anon73_Then_correct  (=> (not (= (MapType0Select Heap@21 this@@21 next) null)) (=> (and (and (forall ((o_11 T@U) (f_15 T@U) ) (! (let ((B@@27 (FieldTypeInv1 (type f_15))))
(let ((A@@28 (FieldTypeInv0 (type f_15))))
 (=> (and (and (= (type o_11) RefType) (= (type f_15) (FieldType A@@28 B@@27))) (or (U_2_bool (MapType1Select (MapType0Select Heap@21 null (|valid#sm| this@@21)) o_11 f_15)) (U_2_bool (MapType1Select (MapType0Select Heap@21 null (|valid#sm| (MapType0Select Heap@21 this@@21 next))) o_11 f_15)))) (U_2_bool (MapType1Select newPMask@5 o_11 f_15)))))
 :qid |stdinbpl.1153:37|
 :skolemid |52|
 :pattern ( (MapType1Select newPMask@5 o_11 f_15))
)) (= Heap@22 (MapType0Store Heap@21 null (|valid#sm| this@@21) newPMask@5))) (and (= Heap@23 Heap@22) (= (ControlFlow 0 76) 74))) anon21_correct))))
(let ((anon19_correct  (=> (state Heap@19 UnfoldingMask@14) (and (=> (= (ControlFlow 0 78) (- 0 79)) (HasDirectPerm UnfoldingMask@14 this@@21 next)) (=> (HasDirectPerm UnfoldingMask@14 this@@21 next) (=> (and (= Heap@20 (MapType0Store Heap@19 null (|valid#sm| this@@21) (MapType1Store (MapType0Select Heap@19 null (|valid#sm| this@@21)) this@@21 next (bool_2_U true)))) (= Heap@21 (MapType0Store Heap@20 null (|valid#sm| this@@21) (MapType1Store (MapType0Select Heap@20 null (|valid#sm| this@@21)) this@@21 value (bool_2_U true))))) (and (=> (= (ControlFlow 0 78) 76) anon73_Then_correct) (=> (= (ControlFlow 0 78) 77) anon73_Else_correct))))))))
(let ((anon72_Else_correct  (=> (= (MapType0Select Heap@19 this@@21 next) null) (=> (and (= UnfoldingMask@14 UnfoldingMask@12) (= (ControlFlow 0 81) 78)) anon19_correct))))
(let ((anon72_Then_correct  (=> (not (= (MapType0Select Heap@19 this@@21 next) null)) (=> (and (> wildcard@10 NoPerm) (= UnfoldingMask@13 (MapType1Store UnfoldingMask@12 null (valid (MapType0Select Heap@19 this@@21 next)) (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@12 null (valid (MapType0Select Heap@19 this@@21 next)))) wildcard@10))))) (=> (and (and (InsidePredicate (valid this@@21) (MapType0Select Heap@19 null (valid this@@21)) (valid (MapType0Select Heap@19 this@@21 next)) (MapType0Select Heap@19 null (valid (MapType0Select Heap@19 this@@21 next)))) (state Heap@19 UnfoldingMask@13)) (and (= UnfoldingMask@14 UnfoldingMask@13) (= (ControlFlow 0 80) 78))) anon19_correct)))))
(let ((anon71_Then_correct  (=> (not (= (MapType0Select Heap@19 this@@21 next) null)) (=> (and (|valid#trigger| Heap@19 (valid this@@21)) (= (MapType0Select Heap@19 null (valid this@@21)) (CombineFrames (FrameFragment (MapType0Select Heap@19 this@@21 next)) (CombineFrames (FrameFragment (MapType0Select Heap@19 this@@21 value)) (FrameFragment (ite (not (= (MapType0Select Heap@19 this@@21 next) null)) (MapType0Select Heap@19 null (valid (MapType0Select Heap@19 this@@21 next))) EmptyFrame)))))) (and (=> (= (ControlFlow 0 82) (- 0 83)) (> (U_2_real (MapType1Select Mask@0 null (valid this@@21))) NoPerm)) (=> (> (U_2_real (MapType1Select Mask@0 null (valid this@@21))) NoPerm) (=> (> wildcard@7 NoPerm) (=> (and (< wildcard@7 (U_2_real (MapType1Select Mask@0 null (valid this@@21)))) (= UnfoldingMask@10 (MapType1Store Mask@0 null (valid this@@21) (real_2_U (- (U_2_real (MapType1Select Mask@0 null (valid this@@21))) wildcard@7))))) (=> (and (and (and (> wildcard@8 NoPerm) (not (= this@@21 null))) (and (= UnfoldingMask@11 (MapType1Store UnfoldingMask@10 this@@21 next (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@10 this@@21 next)) wildcard@8)))) (state Heap@19 UnfoldingMask@11))) (and (and (> wildcard@9 NoPerm) (not (= this@@21 null))) (and (= UnfoldingMask@12 (MapType1Store UnfoldingMask@11 this@@21 value (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@11 this@@21 value)) wildcard@9)))) (state Heap@19 UnfoldingMask@12)))) (and (=> (= (ControlFlow 0 82) 80) anon72_Then_correct) (=> (= (ControlFlow 0 82) 81) anon72_Else_correct)))))))))))
(let ((anon71_Else_correct  (=> (= (MapType0Select Heap@19 this@@21 next) null) (=> (and (= Heap@88 Heap@19) (= (ControlFlow 0 2) 1)) anon62_correct))))
(let ((anon16_correct  (=> (state Heap@19 Mask@0) (and (=> (= (ControlFlow 0 84) 82) anon71_Then_correct) (=> (= (ControlFlow 0 84) 2) anon71_Else_correct)))))
(let ((anon70_Else_correct  (=> (= (MapType0Select Heap@17 this@@21 next) null) (=> (and (= Heap@19 Heap@17) (= (ControlFlow 0 86) 84)) anon16_correct))))
(let ((anon70_Then_correct  (=> (not (= (MapType0Select Heap@17 this@@21 next) null)) (=> (and (and (forall ((o_10 T@U) (f_14 T@U) ) (! (let ((B@@28 (FieldTypeInv1 (type f_14))))
(let ((A@@29 (FieldTypeInv0 (type f_14))))
 (=> (and (and (= (type o_10) RefType) (= (type f_14) (FieldType A@@29 B@@28))) (or (U_2_bool (MapType1Select (MapType0Select Heap@17 null (|valid#sm| this@@21)) o_10 f_14)) (U_2_bool (MapType1Select (MapType0Select Heap@17 null (|valid#sm| (MapType0Select Heap@17 this@@21 next))) o_10 f_14)))) (U_2_bool (MapType1Select newPMask@4 o_10 f_14)))))
 :qid |stdinbpl.1098:33|
 :skolemid |51|
 :pattern ( (MapType1Select newPMask@4 o_10 f_14))
)) (= Heap@18 (MapType0Store Heap@17 null (|valid#sm| this@@21) newPMask@4))) (and (= Heap@19 Heap@18) (= (ControlFlow 0 85) 84))) anon16_correct))))
(let ((anon14_correct  (=> (state Heap@15 Mask@0) (=> (and (= Heap@16 (MapType0Store Heap@15 null (|valid#sm| this@@21) (MapType1Store (MapType0Select Heap@15 null (|valid#sm| this@@21)) this@@21 next (bool_2_U true)))) (= Heap@17 (MapType0Store Heap@16 null (|valid#sm| this@@21) (MapType1Store (MapType0Select Heap@16 null (|valid#sm| this@@21)) this@@21 value (bool_2_U true))))) (and (=> (= (ControlFlow 0 87) 85) anon70_Then_correct) (=> (= (ControlFlow 0 87) 86) anon70_Else_correct))))))
(let ((anon69_Else_correct  (=> (= (MapType0Select Heap@13 this@@21 next) null) (=> (and (= Heap@15 Heap@13) (= (ControlFlow 0 89) 87)) anon14_correct))))
(let ((anon69_Then_correct  (=> (not (= (MapType0Select Heap@13 this@@21 next) null)) (=> (and (and (forall ((o_9 T@U) (f_13 T@U) ) (! (let ((B@@29 (FieldTypeInv1 (type f_13))))
(let ((A@@30 (FieldTypeInv0 (type f_13))))
 (=> (and (and (= (type o_9) RefType) (= (type f_13) (FieldType A@@30 B@@29))) (or (U_2_bool (MapType1Select (MapType0Select Heap@13 null (|valid#sm| this@@21)) o_9 f_13)) (U_2_bool (MapType1Select (MapType0Select Heap@13 null (|valid#sm| (MapType0Select Heap@13 this@@21 next))) o_9 f_13)))) (U_2_bool (MapType1Select newPMask@3 o_9 f_13)))))
 :qid |stdinbpl.1085:33|
 :skolemid |50|
 :pattern ( (MapType1Select newPMask@3 o_9 f_13))
)) (= Heap@14 (MapType0Store Heap@13 null (|valid#sm| this@@21) newPMask@3))) (and (= Heap@15 Heap@14) (= (ControlFlow 0 88) 87))) anon14_correct))))
(let ((anon12_correct  (=> (state Heap@11 UnfoldingMask@9) (and (=> (= (ControlFlow 0 90) (- 0 91)) (HasDirectPerm UnfoldingMask@9 this@@21 next)) (=> (HasDirectPerm UnfoldingMask@9 this@@21 next) (=> (and (= Heap@12 (MapType0Store Heap@11 null (|valid#sm| this@@21) (MapType1Store (MapType0Select Heap@11 null (|valid#sm| this@@21)) this@@21 next (bool_2_U true)))) (= Heap@13 (MapType0Store Heap@12 null (|valid#sm| this@@21) (MapType1Store (MapType0Select Heap@12 null (|valid#sm| this@@21)) this@@21 value (bool_2_U true))))) (and (=> (= (ControlFlow 0 90) 88) anon69_Then_correct) (=> (= (ControlFlow 0 90) 89) anon69_Else_correct))))))))
(let ((anon68_Else_correct  (=> (= (MapType0Select Heap@11 this@@21 next) null) (=> (and (= UnfoldingMask@9 UnfoldingMask@7) (= (ControlFlow 0 93) 90)) anon12_correct))))
(let ((anon68_Then_correct  (=> (not (= (MapType0Select Heap@11 this@@21 next) null)) (=> (and (> wildcard@6 NoPerm) (= UnfoldingMask@8 (MapType1Store UnfoldingMask@7 null (valid (MapType0Select Heap@11 this@@21 next)) (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@7 null (valid (MapType0Select Heap@11 this@@21 next)))) wildcard@6))))) (=> (and (and (InsidePredicate (valid this@@21) (MapType0Select Heap@11 null (valid this@@21)) (valid (MapType0Select Heap@11 this@@21 next)) (MapType0Select Heap@11 null (valid (MapType0Select Heap@11 this@@21 next)))) (state Heap@11 UnfoldingMask@8)) (and (= UnfoldingMask@9 UnfoldingMask@8) (= (ControlFlow 0 92) 90))) anon12_correct)))))
(let ((anon10_correct  (=> (and (and (state Heap@11 Mask@0) (state Heap@11 Mask@0)) (and (|valid#trigger| Heap@11 (valid this@@21)) (= (MapType0Select Heap@11 null (valid this@@21)) (CombineFrames (FrameFragment (MapType0Select Heap@11 this@@21 next)) (CombineFrames (FrameFragment (MapType0Select Heap@11 this@@21 value)) (FrameFragment (ite (not (= (MapType0Select Heap@11 this@@21 next) null)) (MapType0Select Heap@11 null (valid (MapType0Select Heap@11 this@@21 next))) EmptyFrame))))))) (and (=> (= (ControlFlow 0 94) (- 0 95)) (> (U_2_real (MapType1Select Mask@0 null (valid this@@21))) NoPerm)) (=> (> (U_2_real (MapType1Select Mask@0 null (valid this@@21))) NoPerm) (=> (> wildcard@3 NoPerm) (=> (and (< wildcard@3 (U_2_real (MapType1Select Mask@0 null (valid this@@21)))) (= UnfoldingMask@5 (MapType1Store Mask@0 null (valid this@@21) (real_2_U (- (U_2_real (MapType1Select Mask@0 null (valid this@@21))) wildcard@3))))) (=> (and (and (and (> wildcard@4 NoPerm) (not (= this@@21 null))) (and (= UnfoldingMask@6 (MapType1Store UnfoldingMask@5 this@@21 next (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@5 this@@21 next)) wildcard@4)))) (state Heap@11 UnfoldingMask@6))) (and (and (> wildcard@5 NoPerm) (not (= this@@21 null))) (and (= UnfoldingMask@7 (MapType1Store UnfoldingMask@6 this@@21 value (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@6 this@@21 value)) wildcard@5)))) (state Heap@11 UnfoldingMask@7)))) (and (=> (= (ControlFlow 0 94) 92) anon68_Then_correct) (=> (= (ControlFlow 0 94) 93) anon68_Else_correct))))))))))
(let ((anon67_Else_correct  (=> (= (MapType0Select Heap@9 this@@21 next) null) (=> (and (= Heap@11 Heap@9) (= (ControlFlow 0 97) 94)) anon10_correct))))
(let ((anon67_Then_correct  (=> (not (= (MapType0Select Heap@9 this@@21 next) null)) (=> (and (and (forall ((o_8 T@U) (f_12 T@U) ) (! (let ((B@@30 (FieldTypeInv1 (type f_12))))
(let ((A@@31 (FieldTypeInv0 (type f_12))))
 (=> (and (and (= (type o_8) RefType) (= (type f_12) (FieldType A@@31 B@@30))) (or (U_2_bool (MapType1Select (MapType0Select Heap@9 null (|valid#sm| this@@21)) o_8 f_12)) (U_2_bool (MapType1Select (MapType0Select Heap@9 null (|valid#sm| (MapType0Select Heap@9 this@@21 next))) o_8 f_12)))) (U_2_bool (MapType1Select newPMask@2 o_8 f_12)))))
 :qid |stdinbpl.1034:31|
 :skolemid |49|
 :pattern ( (MapType1Select newPMask@2 o_8 f_12))
)) (= Heap@10 (MapType0Store Heap@9 null (|valid#sm| this@@21) newPMask@2))) (and (= Heap@11 Heap@10) (= (ControlFlow 0 96) 94))) anon10_correct))))
(let ((anon8_correct  (=> (state Heap@7 Mask@0) (and (=> (= (ControlFlow 0 98) (- 0 99)) (not (= this@@21 (MapType0Select Heap@7 this@@21 next)))) (=> (not (= this@@21 (MapType0Select Heap@7 this@@21 next))) (=> (and (= Heap@8 (MapType0Store Heap@7 null (|valid#sm| this@@21) (MapType1Store (MapType0Select Heap@7 null (|valid#sm| this@@21)) this@@21 next (bool_2_U true)))) (= Heap@9 (MapType0Store Heap@8 null (|valid#sm| this@@21) (MapType1Store (MapType0Select Heap@8 null (|valid#sm| this@@21)) this@@21 value (bool_2_U true))))) (and (=> (= (ControlFlow 0 98) 96) anon67_Then_correct) (=> (= (ControlFlow 0 98) 97) anon67_Else_correct))))))))
(let ((anon66_Else_correct  (=> (= (MapType0Select Heap@5 this@@21 next) null) (=> (and (= Heap@7 Heap@5) (= (ControlFlow 0 101) 98)) anon8_correct))))
(let ((anon66_Then_correct  (=> (not (= (MapType0Select Heap@5 this@@21 next) null)) (=> (and (and (forall ((o_7 T@U) (f_11 T@U) ) (! (let ((B@@31 (FieldTypeInv1 (type f_11))))
(let ((A@@32 (FieldTypeInv0 (type f_11))))
 (=> (and (and (= (type o_7) RefType) (= (type f_11) (FieldType A@@32 B@@31))) (or (U_2_bool (MapType1Select (MapType0Select Heap@5 null (|valid#sm| this@@21)) o_7 f_11)) (U_2_bool (MapType1Select (MapType0Select Heap@5 null (|valid#sm| (MapType0Select Heap@5 this@@21 next))) o_7 f_11)))) (U_2_bool (MapType1Select newPMask@1 o_7 f_11)))))
 :qid |stdinbpl.1019:33|
 :skolemid |48|
 :pattern ( (MapType1Select newPMask@1 o_7 f_11))
)) (= Heap@6 (MapType0Store Heap@5 null (|valid#sm| this@@21) newPMask@1))) (and (= Heap@7 Heap@6) (= (ControlFlow 0 100) 98))) anon8_correct))))
(let ((anon6_correct  (=> (state Heap@3 Mask@0) (=> (and (= Heap@4 (MapType0Store Heap@3 null (|valid#sm| this@@21) (MapType1Store (MapType0Select Heap@3 null (|valid#sm| this@@21)) this@@21 next (bool_2_U true)))) (= Heap@5 (MapType0Store Heap@4 null (|valid#sm| this@@21) (MapType1Store (MapType0Select Heap@4 null (|valid#sm| this@@21)) this@@21 value (bool_2_U true))))) (and (=> (= (ControlFlow 0 102) 100) anon66_Then_correct) (=> (= (ControlFlow 0 102) 101) anon66_Else_correct))))))
(let ((anon65_Else_correct  (=> (= (MapType0Select Heap@1 this@@21 next) null) (=> (and (= Heap@3 Heap@1) (= (ControlFlow 0 104) 102)) anon6_correct))))
(let ((anon65_Then_correct  (=> (not (= (MapType0Select Heap@1 this@@21 next) null)) (=> (and (and (forall ((o_6 T@U) (f_10 T@U) ) (! (let ((B@@32 (FieldTypeInv1 (type f_10))))
(let ((A@@33 (FieldTypeInv0 (type f_10))))
 (=> (and (and (= (type o_6) RefType) (= (type f_10) (FieldType A@@33 B@@32))) (or (U_2_bool (MapType1Select (MapType0Select Heap@1 null (|valid#sm| this@@21)) o_6 f_10)) (U_2_bool (MapType1Select (MapType0Select Heap@1 null (|valid#sm| (MapType0Select Heap@1 this@@21 next))) o_6 f_10)))) (U_2_bool (MapType1Select newPMask@0 o_6 f_10)))))
 :qid |stdinbpl.1006:33|
 :skolemid |47|
 :pattern ( (MapType1Select newPMask@0 o_6 f_10))
)) (= Heap@2 (MapType0Store Heap@1 null (|valid#sm| this@@21) newPMask@0))) (and (= Heap@3 Heap@2) (= (ControlFlow 0 103) 102))) anon6_correct))))
(let ((anon4_correct  (=> (state Heap@@16 UnfoldingMask@4) (and (=> (= (ControlFlow 0 105) (- 0 106)) (HasDirectPerm UnfoldingMask@4 this@@21 next)) (=> (HasDirectPerm UnfoldingMask@4 this@@21 next) (=> (and (= Heap@0 (MapType0Store Heap@@16 null (|valid#sm| this@@21) (MapType1Store (MapType0Select Heap@@16 null (|valid#sm| this@@21)) this@@21 next (bool_2_U true)))) (= Heap@1 (MapType0Store Heap@0 null (|valid#sm| this@@21) (MapType1Store (MapType0Select Heap@0 null (|valid#sm| this@@21)) this@@21 value (bool_2_U true))))) (and (=> (= (ControlFlow 0 105) 103) anon65_Then_correct) (=> (= (ControlFlow 0 105) 104) anon65_Else_correct))))))))
(let ((anon64_Else_correct  (=> (= (MapType0Select Heap@@16 this@@21 next) null) (=> (and (= UnfoldingMask@4 UnfoldingMask@2) (= (ControlFlow 0 108) 105)) anon4_correct))))
(let ((anon64_Then_correct  (=> (not (= (MapType0Select Heap@@16 this@@21 next) null)) (=> (and (> wildcard@2 NoPerm) (= UnfoldingMask@3 (MapType1Store UnfoldingMask@2 null (valid (MapType0Select Heap@@16 this@@21 next)) (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@2 null (valid (MapType0Select Heap@@16 this@@21 next)))) wildcard@2))))) (=> (and (and (InsidePredicate (valid this@@21) (MapType0Select Heap@@16 null (valid this@@21)) (valid (MapType0Select Heap@@16 this@@21 next)) (MapType0Select Heap@@16 null (valid (MapType0Select Heap@@16 this@@21 next)))) (state Heap@@16 UnfoldingMask@3)) (and (= UnfoldingMask@4 UnfoldingMask@3) (= (ControlFlow 0 107) 105))) anon4_correct)))))
(let ((anon2_correct  (=> (= UnfoldingMask@0 (MapType1Store Mask@0 null (valid this@@21) (real_2_U (- (U_2_real (MapType1Select Mask@0 null (valid this@@21))) FullPerm)))) (=> (and (and (and (> wildcard@0 NoPerm) (not (= this@@21 null))) (and (= UnfoldingMask@1 (MapType1Store UnfoldingMask@0 this@@21 next (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@0 this@@21 next)) wildcard@0)))) (state Heap@@16 UnfoldingMask@1))) (and (and (> wildcard@1 NoPerm) (not (= this@@21 null))) (and (= UnfoldingMask@2 (MapType1Store UnfoldingMask@1 this@@21 value (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@1 this@@21 value)) wildcard@1)))) (state Heap@@16 UnfoldingMask@2)))) (and (=> (= (ControlFlow 0 109) 107) anon64_Then_correct) (=> (= (ControlFlow 0 109) 108) anon64_Else_correct))))))
(let ((anon63_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 112) 109)) anon2_correct)))
(let ((anon63_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 110) (- 0 111)) (<= FullPerm (U_2_real (MapType1Select Mask@0 null (valid this@@21))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@0 null (valid this@@21)))) (=> (= (ControlFlow 0 110) 109) anon2_correct))))))
(let ((anon0_correct  (=> (and (and (and (state Heap@@16 ZeroMask) (= AssumeFunctionsAbove (- 0 1))) (and (U_2_bool (MapType0Select Heap@@16 this@@21 $allocated)) (= Mask@0 (MapType1Store ZeroMask null (valid this@@21) (real_2_U (+ (U_2_real (MapType1Select ZeroMask null (valid this@@21))) FullPerm)))))) (and (and (state Heap@@16 Mask@0) (state Heap@@16 Mask@0)) (and (|valid#trigger| Heap@@16 (valid this@@21)) (= (MapType0Select Heap@@16 null (valid this@@21)) (CombineFrames (FrameFragment (MapType0Select Heap@@16 this@@21 next)) (CombineFrames (FrameFragment (MapType0Select Heap@@16 this@@21 value)) (FrameFragment (ite (not (= (MapType0Select Heap@@16 this@@21 next) null)) (MapType0Select Heap@@16 null (valid (MapType0Select Heap@@16 this@@21 next))) EmptyFrame)))))))) (and (=> (= (ControlFlow 0 113) 110) anon63_Then_correct) (=> (= (ControlFlow 0 113) 112) anon63_Else_correct)))))
(let ((PreconditionGeneratedEntry_correct  (=> (and (and (> wildcard NoPerm) true) (= (ControlFlow 0 114) 113)) anon0_correct)))
PreconditionGeneratedEntry_correct))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
))
(check-sat)
(pop 1)
; Valid
(get-info :rlimit)
