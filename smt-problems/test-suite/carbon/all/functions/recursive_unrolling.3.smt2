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
(declare-fun node (T@U) T@U)
(declare-fun PredicateType_nodeType () T@T)
(declare-fun |length'| (T@U T@U) Int)
(declare-fun dummyFunction (T@U) Bool)
(declare-fun |length#triggerStateless| (T@U) Int)
(declare-fun |node#trigger| (T@U T@U) Bool)
(declare-fun |node#everUsed| (T@U) Bool)
(declare-fun length (T@U T@U) Int)
(declare-fun |node#sm| (T@U) T@U)
(declare-fun dummyHeap () T@U)
(declare-fun ZeroMask () T@U)
(declare-fun InsidePredicate (T@U T@U T@U T@U) Bool)
(declare-fun AssumeFunctionsAbove () Int)
(declare-fun sumMask (T@U T@U T@U) Bool)
(declare-fun ConditionalFrame (Real T@U) T@U)
(declare-fun EmptyFrame () T@U)
(declare-fun NoPerm () Real)
(declare-fun getPredWandId (T@U) Int)
(declare-fun FullPerm () Real)
(declare-fun |length#frame| (T@U T@U) Int)
(declare-fun ZeroPMask () T@U)
(declare-fun |length#trigger| (T@U T@U) Bool)
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
))) (= (Ctor NormalFieldType) 7)) (= (type $allocated) (FieldType NormalFieldType boolType))) (= (Ctor RefType) 8)) (= (type next) (FieldType NormalFieldType RefType))))
(assert (distinct $allocated next)
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
(assert  (and (= (Ctor PredicateType_nodeType) 12) (forall ((arg0@@25 T@U) ) (! (= (type (node arg0@@25)) (FieldType PredicateType_nodeType FrameTypeType))
 :qid |funType:node|
 :pattern ( (node arg0@@25))
))))
(assert (forall ((this T@U) ) (!  (=> (= (type this) RefType) (IsPredicateField (node this)))
 :qid |stdinbpl.352:15|
 :skolemid |30|
 :pattern ( (node this))
)))
(assert (forall ((Heap@@2 T@U) (this@@0 T@U) ) (!  (=> (and (= (type Heap@@2) (MapType0Type RefType)) (= (type this@@0) RefType)) (dummyFunction (int_2_U (|length#triggerStateless| this@@0))))
 :qid |stdinbpl.197:15|
 :skolemid |23|
 :pattern ( (|length'| Heap@@2 this@@0))
)))
(assert (forall ((Heap@@3 T@U) (this@@1 T@U) ) (!  (=> (and (= (type Heap@@3) (MapType0Type RefType)) (= (type this@@1) RefType)) (|node#everUsed| (node this@@1)))
 :qid |stdinbpl.371:15|
 :skolemid |34|
 :pattern ( (|node#trigger| Heap@@3 (node this@@1)))
)))
(assert (forall ((Heap@@4 T@U) (ExhaleHeap@@1 T@U) (Mask@@2 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@4) (MapType0Type RefType)) (= (type ExhaleHeap@@1) (MapType0Type RefType))) (= (type Mask@@2) (MapType1Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@4 ExhaleHeap@@1 Mask@@2)) (U_2_bool (MapType0Select Heap@@4 o_1 $allocated))) (U_2_bool (MapType0Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.73:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@4 ExhaleHeap@@1 Mask@@2) (MapType0Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert (forall ((Heap@@5 T@U) (this@@2 T@U) ) (!  (=> (and (= (type Heap@@5) (MapType0Type RefType)) (= (type this@@2) RefType)) (and (= (length Heap@@5 this@@2) (|length'| Heap@@5 this@@2)) (dummyFunction (int_2_U (|length#triggerStateless| this@@2)))))
 :qid |stdinbpl.193:15|
 :skolemid |22|
 :pattern ( (length Heap@@5 this@@2))
)))
(assert (forall ((this@@3 T@U) (this2 T@U) ) (!  (=> (and (and (= (type this@@3) RefType) (= (type this2) RefType)) (= (node this@@3) (node this2))) (= this@@3 this2))
 :qid |stdinbpl.362:15|
 :skolemid |32|
 :pattern ( (node this@@3) (node this2))
)))
(assert (forall ((arg0@@26 T@U) ) (! (= (type (|node#sm| arg0@@26)) (FieldType PredicateType_nodeType (MapType1Type RefType boolType)))
 :qid |funType:node#sm|
 :pattern ( (|node#sm| arg0@@26))
)))
(assert (forall ((this@@4 T@U) (this2@@0 T@U) ) (!  (=> (and (and (= (type this@@4) RefType) (= (type this2@@0) RefType)) (= (|node#sm| this@@4) (|node#sm| this2@@0))) (= this@@4 this2@@0))
 :qid |stdinbpl.366:15|
 :skolemid |33|
 :pattern ( (|node#sm| this@@4) (|node#sm| this2@@0))
)))
(assert (forall ((Heap@@6 T@U) (ExhaleHeap@@2 T@U) (Mask@@3 T@U) (o_1@@0 T@U) (f_2 T@U) ) (! (let ((B@@1 (FieldTypeInv1 (type f_2))))
(let ((A@@1 (FieldTypeInv0 (type f_2))))
 (=> (and (and (and (and (and (and (= (type Heap@@6) (MapType0Type RefType)) (= (type ExhaleHeap@@2) (MapType0Type RefType))) (= (type Mask@@3) (MapType1Type RefType realType))) (= (type o_1@@0) RefType)) (= (type f_2) (FieldType A@@1 B@@1))) (IdenticalOnKnownLocations Heap@@6 ExhaleHeap@@2 Mask@@3)) (HasDirectPerm Mask@@3 o_1@@0 f_2)) (= (MapType0Select Heap@@6 o_1@@0 f_2) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2)))))
 :qid |stdinbpl.42:22|
 :skolemid |1|
 :pattern ( (IdenticalOnKnownLocations Heap@@6 ExhaleHeap@@2 Mask@@3) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2))
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
(assert (forall ((Heap@@7 T@U) (ExhaleHeap@@3 T@U) (Mask@@4 T@U) ) (!  (=> (and (and (and (= (type Heap@@7) (MapType0Type RefType)) (= (type ExhaleHeap@@3) (MapType0Type RefType))) (= (type Mask@@4) (MapType1Type RefType realType))) (IdenticalOnKnownLocations Heap@@7 ExhaleHeap@@3 Mask@@4)) (succHeap Heap@@7 ExhaleHeap@@3))
 :qid |stdinbpl.83:15|
 :skolemid |10|
 :pattern ( (IdenticalOnKnownLocations Heap@@7 ExhaleHeap@@3 Mask@@4))
)))
(assert (forall ((Heap@@8 T@U) (Mask@@5 T@U) (this@@5 T@U) ) (!  (=> (and (and (and (= (type Heap@@8) (MapType0Type RefType)) (= (type Mask@@5) (MapType1Type RefType realType))) (= (type this@@5) RefType)) (and (state Heap@@8 Mask@@5) (< AssumeFunctionsAbove 0))) (= (length Heap@@8 this@@5) (+ 1 (ite (= (MapType0Select Heap@@8 this@@5 next) null) 0 (|length'| Heap@@8 (MapType0Select Heap@@8 this@@5 next))))))
 :qid |stdinbpl.203:15|
 :skolemid |24|
 :pattern ( (state Heap@@8 Mask@@5) (length Heap@@8 this@@5))
 :pattern ( (state Heap@@8 Mask@@5) (|length#triggerStateless| this@@5) (|node#trigger| Heap@@8 (node this@@5)))
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
(assert  (and (forall ((arg0@@27 Real) (arg1@@9 T@U) ) (! (= (type (ConditionalFrame arg0@@27 arg1@@9)) FrameTypeType)
 :qid |funType:ConditionalFrame|
 :pattern ( (ConditionalFrame arg0@@27 arg1@@9))
)) (= (type EmptyFrame) FrameTypeType)))
(assert (forall ((p@@0 Real) (f_6 T@U) ) (!  (=> (= (type f_6) FrameTypeType) (= (ConditionalFrame p@@0 f_6) (ite (> p@@0 0.0) f_6 EmptyFrame)))
 :qid |stdinbpl.161:15|
 :skolemid |19|
 :pattern ( (ConditionalFrame p@@0 f_6))
)))
(assert (forall ((Mask@@6 T@U) (o_2@@0 T@U) (f_4@@0 T@U) ) (! (let ((B@@3 (FieldTypeInv1 (type f_4@@0))))
(let ((A@@4 (FieldTypeInv0 (type f_4@@0))))
 (=> (and (and (= (type Mask@@6) (MapType1Type RefType realType)) (= (type o_2@@0) RefType)) (= (type f_4@@0) (FieldType A@@4 B@@3))) (= (HasDirectPerm Mask@@6 o_2@@0 f_4@@0) (> (U_2_real (MapType1Select Mask@@6 o_2@@0 f_4@@0)) NoPerm)))))
 :qid |stdinbpl.133:22|
 :skolemid |17|
 :pattern ( (HasDirectPerm Mask@@6 o_2@@0 f_4@@0))
)))
(assert (forall ((o_2@@1 T@U) (f_4@@1 T@U) ) (! (let ((B@@4 (FieldTypeInv1 (type f_4@@1))))
(let ((A@@5 (FieldTypeInv0 (type f_4@@1))))
 (=> (and (= (type o_2@@1) RefType) (= (type f_4@@1) (FieldType A@@5 B@@4))) (= (U_2_real (MapType1Select ZeroMask o_2@@1 f_4@@1)) NoPerm))))
 :qid |stdinbpl.106:22|
 :skolemid |13|
 :pattern ( (MapType1Select ZeroMask o_2@@1 f_4@@1))
)))
(assert (forall ((Heap@@9 T@U) (ExhaleHeap@@4 T@U) (Mask@@7 T@U) (pm_f@@1 T@U) ) (! (let ((C@@1 (FieldTypeInv0 (type pm_f@@1))))
 (=> (and (and (and (and (and (= (type Heap@@9) (MapType0Type RefType)) (= (type ExhaleHeap@@4) (MapType0Type RefType))) (= (type Mask@@7) (MapType1Type RefType realType))) (= (type pm_f@@1) (FieldType C@@1 FrameTypeType))) (IdenticalOnKnownLocations Heap@@9 ExhaleHeap@@4 Mask@@7)) (and (HasDirectPerm Mask@@7 null pm_f@@1) (IsPredicateField pm_f@@1))) (forall ((o2 T@U) (f_2@@0 T@U) ) (! (let ((B@@5 (FieldTypeInv1 (type f_2@@0))))
(let ((A@@6 (FieldTypeInv0 (type f_2@@0))))
 (=> (and (and (= (type o2) RefType) (= (type f_2@@0) (FieldType A@@6 B@@5))) (U_2_bool (MapType1Select (MapType0Select Heap@@9 null (PredicateMaskField pm_f@@1)) o2 f_2@@0))) (= (MapType0Select Heap@@9 o2 f_2@@0) (MapType0Select ExhaleHeap@@4 o2 f_2@@0)))))
 :qid |stdinbpl.54:134|
 :skolemid |3|
 :pattern ( (MapType0Select ExhaleHeap@@4 o2 f_2@@0))
))))
 :qid |stdinbpl.52:19|
 :skolemid |4|
 :pattern ( (IdenticalOnKnownLocations Heap@@9 ExhaleHeap@@4 Mask@@7) (IsPredicateField pm_f@@1))
)))
(assert (forall ((Heap@@10 T@U) (ExhaleHeap@@5 T@U) (Mask@@8 T@U) (pm_f@@2 T@U) ) (! (let ((C@@2 (FieldTypeInv0 (type pm_f@@2))))
 (=> (and (and (and (and (and (= (type Heap@@10) (MapType0Type RefType)) (= (type ExhaleHeap@@5) (MapType0Type RefType))) (= (type Mask@@8) (MapType1Type RefType realType))) (= (type pm_f@@2) (FieldType C@@2 FrameTypeType))) (IdenticalOnKnownLocations Heap@@10 ExhaleHeap@@5 Mask@@8)) (and (HasDirectPerm Mask@@8 null pm_f@@2) (IsWandField pm_f@@2))) (forall ((o2@@0 T@U) (f_2@@1 T@U) ) (! (let ((B@@6 (FieldTypeInv1 (type f_2@@1))))
(let ((A@@7 (FieldTypeInv0 (type f_2@@1))))
 (=> (and (and (= (type o2@@0) RefType) (= (type f_2@@1) (FieldType A@@7 B@@6))) (U_2_bool (MapType1Select (MapType0Select Heap@@10 null (WandMaskField pm_f@@2)) o2@@0 f_2@@1))) (= (MapType0Select Heap@@10 o2@@0 f_2@@1) (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1)))))
 :qid |stdinbpl.67:129|
 :skolemid |6|
 :pattern ( (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1))
))))
 :qid |stdinbpl.65:19|
 :skolemid |7|
 :pattern ( (IdenticalOnKnownLocations Heap@@10 ExhaleHeap@@5 Mask@@8) (IsWandField pm_f@@2))
)))
(assert (forall ((this@@6 T@U) ) (!  (=> (= (type this@@6) RefType) (= (getPredWandId (node this@@6)) 0))
 :qid |stdinbpl.356:15|
 :skolemid |31|
 :pattern ( (node this@@6))
)))
(assert (forall ((Mask@@9 T@U) (o_2@@2 T@U) (f_4@@2 T@U) ) (! (let ((B@@7 (FieldTypeInv1 (type f_4@@2))))
(let ((A@@8 (FieldTypeInv0 (type f_4@@2))))
 (=> (and (and (and (= (type Mask@@9) (MapType1Type RefType realType)) (= (type o_2@@2) RefType)) (= (type f_4@@2) (FieldType A@@8 B@@7))) (GoodMask Mask@@9)) (and (>= (U_2_real (MapType1Select Mask@@9 o_2@@2 f_4@@2)) NoPerm) (=> (and (and (GoodMask Mask@@9) (not (IsPredicateField f_4@@2))) (not (IsWandField f_4@@2))) (<= (U_2_real (MapType1Select Mask@@9 o_2@@2 f_4@@2)) FullPerm))))))
 :qid |stdinbpl.128:22|
 :skolemid |16|
 :pattern ( (GoodMask Mask@@9) (MapType1Select Mask@@9 o_2@@2 f_4@@2))
)))
(assert (forall ((Heap@@11 T@U) (Mask@@10 T@U) (this@@7 T@U) ) (!  (=> (and (and (and (= (type Heap@@11) (MapType0Type RefType)) (= (type Mask@@10) (MapType1Type RefType realType))) (= (type this@@7) RefType)) (state Heap@@11 Mask@@10)) (= (|length'| Heap@@11 this@@7) (|length#frame| (MapType0Select Heap@@11 null (node this@@7)) this@@7)))
 :qid |stdinbpl.210:15|
 :skolemid |25|
 :pattern ( (state Heap@@11 Mask@@10) (|length'| Heap@@11 this@@7))
 :pattern ( (state Heap@@11 Mask@@10) (|length#triggerStateless| this@@7) (|node#trigger| Heap@@11 (node this@@7)))
)))
(assert (forall ((o T@U) (f T@U) (Heap@@12 T@U) ) (!  (=> (and (and (and (= (type o) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap@@12) (MapType0Type RefType))) (U_2_bool (MapType0Select Heap@@12 o $allocated))) (U_2_bool (MapType0Select Heap@@12 (MapType0Select Heap@@12 o f) $allocated)))
 :qid |stdinbpl.31:15|
 :skolemid |0|
 :pattern ( (MapType0Select Heap@@12 o f))
)))
(assert (forall ((this@@8 T@U) ) (!  (=> (= (type this@@8) RefType) (= (PredicateMaskField (node this@@8)) (|node#sm| this@@8)))
 :qid |stdinbpl.348:15|
 :skolemid |29|
 :pattern ( (PredicateMaskField (node this@@8)))
)))
(assert (forall ((Heap@@13 T@U) (o@@0 T@U) (f_3 T@U) (v T@U) ) (! (let ((B@@8 (type v)))
(let ((A@@9 (FieldTypeInv0 (type f_3))))
 (=> (and (and (= (type Heap@@13) (MapType0Type RefType)) (= (type o@@0) RefType)) (= (type f_3) (FieldType A@@9 B@@8))) (succHeap Heap@@13 (MapType0Store Heap@@13 o@@0 f_3 v)))))
 :qid |stdinbpl.78:22|
 :skolemid |9|
 :pattern ( (MapType0Store Heap@@13 o@@0 f_3 v))
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
(assert (forall ((Heap@@14 T@U) (Mask@@11 T@U) (this@@9 T@U) ) (!  (=> (and (and (and (= (type Heap@@14) (MapType0Type RefType)) (= (type Mask@@11) (MapType1Type RefType realType))) (= (type this@@9) RefType)) (and (state Heap@@14 Mask@@11) (or (< AssumeFunctionsAbove 0) (|length#trigger| (MapType0Select Heap@@14 null (node this@@9)) this@@9)))) (> (|length'| Heap@@14 this@@9) 0))
 :qid |stdinbpl.216:15|
 :skolemid |26|
 :pattern ( (state Heap@@14 Mask@@11) (|length'| Heap@@14 this@@9))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun Mask@24 () T@U)
(declare-fun freshObj@4 () T@U)
(declare-fun Heap@39 () T@U)
(declare-fun Heap@37 () T@U)
(declare-fun newPMask@4 () T@U)
(declare-fun Heap@38 () T@U)
(declare-fun Heap@36 () T@U)
(declare-fun Heap@33 () T@U)
(declare-fun Heap@34 () T@U)
(declare-fun Heap@35 () T@U)
(declare-fun freshVersion@4 () T@U)
(declare-fun Mask@23 () T@U)
(declare-fun CombineFrames (T@U T@U) T@U)
(declare-fun FrameFragment (T@U) T@U)
(declare-fun Mask@22 () T@U)
(declare-fun Mask@21 () T@U)
(declare-fun Mask@20 () T@U)
(declare-fun Heap@31 () T@U)
(declare-fun Mask@19 () T@U)
(declare-fun Heap@32 () T@U)
(declare-fun freshObj@3 () T@U)
(declare-fun Heap@29 () T@U)
(declare-fun newPMask@3 () T@U)
(declare-fun Heap@30 () T@U)
(declare-fun Heap@28 () T@U)
(declare-fun Heap@25 () T@U)
(declare-fun Heap@26 () T@U)
(declare-fun Heap@27 () T@U)
(declare-fun freshVersion@3 () T@U)
(declare-fun Mask@18 () T@U)
(declare-fun Mask@17 () T@U)
(declare-fun Mask@16 () T@U)
(declare-fun Mask@15 () T@U)
(declare-fun Heap@23 () T@U)
(declare-fun Mask@14 () T@U)
(declare-fun Heap@24 () T@U)
(declare-fun freshObj@2 () T@U)
(declare-fun Heap@21 () T@U)
(declare-fun newPMask@2 () T@U)
(declare-fun Heap@22 () T@U)
(declare-fun Heap@20 () T@U)
(declare-fun Heap@17 () T@U)
(declare-fun Heap@18 () T@U)
(declare-fun Heap@19 () T@U)
(declare-fun freshVersion@2 () T@U)
(declare-fun Mask@13 () T@U)
(declare-fun Mask@12 () T@U)
(declare-fun Mask@11 () T@U)
(declare-fun Mask@10 () T@U)
(declare-fun Heap@15 () T@U)
(declare-fun Mask@9 () T@U)
(declare-fun Heap@16 () T@U)
(declare-fun freshObj@1 () T@U)
(declare-fun Heap@13 () T@U)
(declare-fun newPMask@1 () T@U)
(declare-fun Heap@14 () T@U)
(declare-fun Heap@12 () T@U)
(declare-fun Heap@9 () T@U)
(declare-fun Heap@10 () T@U)
(declare-fun Heap@11 () T@U)
(declare-fun freshVersion@1 () T@U)
(declare-fun Mask@8 () T@U)
(declare-fun Mask@7 () T@U)
(declare-fun Mask@6 () T@U)
(declare-fun Mask@5 () T@U)
(declare-fun Heap@7 () T@U)
(declare-fun Mask@4 () T@U)
(declare-fun Heap@8 () T@U)
(declare-fun freshObj@0 () T@U)
(declare-fun Heap@5 () T@U)
(declare-fun newPMask@0 () T@U)
(declare-fun Heap@6 () T@U)
(declare-fun Heap@4 () T@U)
(declare-fun Heap@1 () T@U)
(declare-fun Heap@2 () T@U)
(declare-fun Heap@3 () T@U)
(declare-fun freshVersion@0 () T@U)
(declare-fun Mask@3 () T@U)
(declare-fun Mask@2 () T@U)
(declare-fun Mask@1 () T@U)
(declare-fun Mask@0 () T@U)
(declare-fun Heap@@15 () T@U)
(declare-fun n1 () T@U)
(declare-fun n2 () T@U)
(declare-fun n3 () T@U)
(declare-fun n4 () T@U)
(declare-fun n5 () T@U)
(declare-fun Heap@0 () T@U)
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (= (type Heap@39) (MapType0Type RefType)) (= (type freshObj@4) RefType)) (= (type Mask@24) (MapType1Type RefType realType))) (= (type Heap@37) (MapType0Type RefType))) (= (type newPMask@4) (MapType1Type RefType boolType))) (= (type Heap@38) (MapType0Type RefType))) (= (type Heap@36) (MapType0Type RefType))) (= (type Heap@34) (MapType0Type RefType))) (= (type Heap@33) (MapType0Type RefType))) (= (type Heap@35) (MapType0Type RefType))) (= (type freshVersion@4) FrameTypeType)) (= (type Mask@23) (MapType1Type RefType realType))) (forall ((arg0@@28 T@U) (arg1@@10 T@U) ) (! (= (type (CombineFrames arg0@@28 arg1@@10)) FrameTypeType)
 :qid |funType:CombineFrames|
 :pattern ( (CombineFrames arg0@@28 arg1@@10))
))) (forall ((arg0@@29 T@U) ) (! (= (type (FrameFragment arg0@@29)) FrameTypeType)
 :qid |funType:FrameFragment|
 :pattern ( (FrameFragment arg0@@29))
))) (= (type Mask@21) (MapType1Type RefType realType))) (= (type Mask@22) (MapType1Type RefType realType))) (= (type Mask@20) (MapType1Type RefType realType))) (= (type Heap@31) (MapType0Type RefType))) (= (type Mask@19) (MapType1Type RefType realType))) (= (type Heap@32) (MapType0Type RefType))) (= (type freshObj@3) RefType)) (= (type Heap@29) (MapType0Type RefType))) (= (type newPMask@3) (MapType1Type RefType boolType))) (= (type Heap@30) (MapType0Type RefType))) (= (type Heap@28) (MapType0Type RefType))) (= (type Heap@26) (MapType0Type RefType))) (= (type Heap@25) (MapType0Type RefType))) (= (type Heap@27) (MapType0Type RefType))) (= (type freshVersion@3) FrameTypeType)) (= (type Mask@18) (MapType1Type RefType realType))) (= (type Mask@16) (MapType1Type RefType realType))) (= (type Mask@17) (MapType1Type RefType realType))) (= (type Mask@15) (MapType1Type RefType realType))) (= (type Heap@23) (MapType0Type RefType))) (= (type Mask@14) (MapType1Type RefType realType))) (= (type Heap@24) (MapType0Type RefType))) (= (type freshObj@2) RefType)) (= (type Heap@21) (MapType0Type RefType))) (= (type newPMask@2) (MapType1Type RefType boolType))) (= (type Heap@22) (MapType0Type RefType))) (= (type Heap@20) (MapType0Type RefType))) (= (type Heap@18) (MapType0Type RefType))) (= (type Heap@17) (MapType0Type RefType))) (= (type Heap@19) (MapType0Type RefType))) (= (type freshVersion@2) FrameTypeType)) (= (type Mask@13) (MapType1Type RefType realType))) (= (type Mask@11) (MapType1Type RefType realType))) (= (type Mask@12) (MapType1Type RefType realType))) (= (type Mask@10) (MapType1Type RefType realType))) (= (type Heap@15) (MapType0Type RefType))) (= (type Mask@9) (MapType1Type RefType realType))) (= (type Heap@16) (MapType0Type RefType))) (= (type freshObj@1) RefType)) (= (type Heap@13) (MapType0Type RefType))) (= (type newPMask@1) (MapType1Type RefType boolType))) (= (type Heap@14) (MapType0Type RefType))) (= (type Heap@12) (MapType0Type RefType))) (= (type Heap@10) (MapType0Type RefType))) (= (type Heap@9) (MapType0Type RefType))) (= (type Heap@11) (MapType0Type RefType))) (= (type freshVersion@1) FrameTypeType)) (= (type Mask@8) (MapType1Type RefType realType))) (= (type Mask@6) (MapType1Type RefType realType))) (= (type Mask@7) (MapType1Type RefType realType))) (= (type Mask@5) (MapType1Type RefType realType))) (= (type Heap@7) (MapType0Type RefType))) (= (type Mask@4) (MapType1Type RefType realType))) (= (type Heap@8) (MapType0Type RefType))) (= (type freshObj@0) RefType)) (= (type Heap@5) (MapType0Type RefType))) (= (type newPMask@0) (MapType1Type RefType boolType))) (= (type Heap@6) (MapType0Type RefType))) (= (type Heap@4) (MapType0Type RefType))) (= (type Heap@2) (MapType0Type RefType))) (= (type Heap@1) (MapType0Type RefType))) (= (type Heap@3) (MapType0Type RefType))) (= (type freshVersion@0) FrameTypeType)) (= (type Mask@3) (MapType1Type RefType realType))) (= (type Mask@1) (MapType1Type RefType realType))) (= (type Mask@2) (MapType1Type RefType realType))) (= (type Mask@0) (MapType1Type RefType realType))) (= (type Heap@@15) (MapType0Type RefType))) (= (type n1) RefType)) (= (type n2) RefType)) (= (type n3) RefType)) (= (type n4) RefType)) (= (type n5) RefType)) (= (type Heap@0) (MapType0Type RefType))))
(set-info :boogie-vc-id test01)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 98) (let ((anon53_correct true))
(let ((anon81_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 6) 3)) anon53_correct)))
(let ((anon81_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 4) (- 0 5)) (<= FullPerm (U_2_real (MapType1Select Mask@24 null (node freshObj@4))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@24 null (node freshObj@4)))) (=> (= (ControlFlow 0 4) 3) anon53_correct))))))
(let ((anon80_Else_correct  (=> (= (ControlFlow 0 2) (- 0 1)) (= (length Heap@39 freshObj@4) 5))))
(let ((anon50_correct  (=> (and (state Heap@39 Mask@24) (state Heap@39 Mask@24)) (and (and (=> (= (ControlFlow 0 7) 2) anon80_Else_correct) (=> (= (ControlFlow 0 7) 4) anon81_Then_correct)) (=> (= (ControlFlow 0 7) 6) anon81_Else_correct)))))
(let ((anon79_Else_correct  (=> (= (MapType0Select Heap@37 freshObj@4 next) null) (=> (and (= Heap@39 Heap@37) (= (ControlFlow 0 9) 7)) anon50_correct))))
(let ((anon79_Then_correct  (=> (not (= (MapType0Select Heap@37 freshObj@4 next) null)) (=> (and (and (forall ((o_9 T@U) (f_13 T@U) ) (! (let ((B@@11 (FieldTypeInv1 (type f_13))))
(let ((A@@12 (FieldTypeInv0 (type f_13))))
 (=> (and (and (= (type o_9) RefType) (= (type f_13) (FieldType A@@12 B@@11))) (or (U_2_bool (MapType1Select (MapType0Select Heap@37 null (|node#sm| freshObj@4)) o_9 f_13)) (U_2_bool (MapType1Select (MapType0Select Heap@37 null (|node#sm| (MapType0Select Heap@37 freshObj@4 next))) o_9 f_13)))) (U_2_bool (MapType1Select newPMask@4 o_9 f_13)))))
 :qid |stdinbpl.726:29|
 :skolemid |39|
 :pattern ( (MapType1Select newPMask@4 o_9 f_13))
)) (= Heap@38 (MapType0Store Heap@37 null (|node#sm| freshObj@4) newPMask@4))) (and (= Heap@39 Heap@38) (= (ControlFlow 0 8) 7))) anon50_correct))))
(let ((anon48_correct  (=> (= Heap@37 (MapType0Store Heap@36 null (|node#sm| freshObj@4) (MapType1Store (MapType0Select Heap@36 null (|node#sm| freshObj@4)) freshObj@4 next (bool_2_U true)))) (and (=> (= (ControlFlow 0 10) 8) anon79_Then_correct) (=> (= (ControlFlow 0 10) 9) anon79_Else_correct)))))
(let ((anon78_Else_correct  (=> (HasDirectPerm Mask@24 null (node freshObj@4)) (=> (and (= Heap@36 Heap@33) (= (ControlFlow 0 12) 10)) anon48_correct))))
(let ((anon78_Then_correct  (=> (not (HasDirectPerm Mask@24 null (node freshObj@4))) (=> (and (and (= Heap@34 (MapType0Store Heap@33 null (|node#sm| freshObj@4) ZeroPMask)) (= Heap@35 (MapType0Store Heap@34 null (node freshObj@4) freshVersion@4))) (and (= Heap@36 Heap@35) (= (ControlFlow 0 11) 10))) anon48_correct))))
(let ((anon46_correct  (=> (= Mask@24 (MapType1Store Mask@23 null (node freshObj@4) (real_2_U (+ (U_2_real (MapType1Select Mask@23 null (node freshObj@4))) FullPerm)))) (=> (and (and (state Heap@33 Mask@24) (state Heap@33 Mask@24)) (and (|node#trigger| Heap@33 (node freshObj@4)) (= (MapType0Select Heap@33 null (node freshObj@4)) (CombineFrames (FrameFragment (MapType0Select Heap@33 freshObj@4 next)) (FrameFragment (ite (not (= (MapType0Select Heap@33 freshObj@4 next) null)) (MapType0Select Heap@33 null (node (MapType0Select Heap@33 freshObj@4 next))) EmptyFrame)))))) (and (=> (= (ControlFlow 0 13) 11) anon78_Then_correct) (=> (= (ControlFlow 0 13) 12) anon78_Else_correct))))))
(let ((anon45_correct  (=> (and (and (= Mask@22 (MapType1Store Mask@21 null (node (MapType0Select Heap@33 freshObj@4 next)) (real_2_U (- (U_2_real (MapType1Select Mask@21 null (node (MapType0Select Heap@33 freshObj@4 next)))) FullPerm)))) (InsidePredicate (node freshObj@4) (MapType0Select Heap@33 null (node freshObj@4)) (node (MapType0Select Heap@33 freshObj@4 next)) (MapType0Select Heap@33 null (node (MapType0Select Heap@33 freshObj@4 next))))) (and (= Mask@23 Mask@22) (= (ControlFlow 0 15) 13))) anon46_correct)))
(let ((anon77_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 18) 15)) anon45_correct)))
(let ((anon77_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 16) (- 0 17)) (<= FullPerm (U_2_real (MapType1Select Mask@21 null (node (MapType0Select Heap@33 freshObj@4 next)))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@21 null (node (MapType0Select Heap@33 freshObj@4 next))))) (=> (= (ControlFlow 0 16) 15) anon45_correct))))))
(let ((anon76_Then_correct  (=> (not (= (MapType0Select Heap@33 freshObj@4 next) null)) (and (=> (= (ControlFlow 0 19) 16) anon77_Then_correct) (=> (= (ControlFlow 0 19) 18) anon77_Else_correct)))))
(let ((anon76_Else_correct  (=> (= (MapType0Select Heap@33 freshObj@4 next) null) (=> (and (= Mask@23 Mask@21) (= (ControlFlow 0 14) 13)) anon46_correct))))
(let ((anon42_correct  (=> (= Mask@21 (MapType1Store Mask@20 freshObj@4 next (real_2_U (- (U_2_real (MapType1Select Mask@20 freshObj@4 next)) FullPerm)))) (and (=> (= (ControlFlow 0 20) 19) anon76_Then_correct) (=> (= (ControlFlow 0 20) 14) anon76_Else_correct)))))
(let ((anon75_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 23) 20)) anon42_correct)))
(let ((anon75_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 21) (- 0 22)) (<= FullPerm (U_2_real (MapType1Select Mask@20 freshObj@4 next)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@20 freshObj@4 next))) (=> (= (ControlFlow 0 21) 20) anon42_correct))))))
(let ((anon40_correct  (=> (and (state Heap@31 Mask@19) (state Heap@31 Mask@19)) (=> (and (and (and (not (= freshObj@4 null)) (not (U_2_bool (MapType0Select Heap@31 freshObj@4 $allocated)))) (= Heap@32 (MapType0Store Heap@31 freshObj@4 $allocated (bool_2_U true)))) (and (= Mask@20 (MapType1Store Mask@19 freshObj@4 next (real_2_U (+ (U_2_real (MapType1Select Mask@19 freshObj@4 next)) FullPerm)))) (state Heap@32 Mask@20))) (and (=> (= (ControlFlow 0 24) (- 0 25)) (= FullPerm (U_2_real (MapType1Select Mask@20 freshObj@4 next)))) (=> (= FullPerm (U_2_real (MapType1Select Mask@20 freshObj@4 next))) (=> (and (= Heap@33 (MapType0Store Heap@32 freshObj@4 next freshObj@3)) (state Heap@33 Mask@20)) (and (=> (= (ControlFlow 0 24) 21) anon75_Then_correct) (=> (= (ControlFlow 0 24) 23) anon75_Else_correct)))))))))
(let ((anon74_Else_correct  (=> (= (MapType0Select Heap@29 freshObj@3 next) null) (=> (and (= Heap@31 Heap@29) (= (ControlFlow 0 27) 24)) anon40_correct))))
(let ((anon74_Then_correct  (=> (not (= (MapType0Select Heap@29 freshObj@3 next) null)) (=> (and (and (forall ((o_8 T@U) (f_12 T@U) ) (! (let ((B@@12 (FieldTypeInv1 (type f_12))))
(let ((A@@13 (FieldTypeInv0 (type f_12))))
 (=> (and (and (= (type o_8) RefType) (= (type f_12) (FieldType A@@13 B@@12))) (or (U_2_bool (MapType1Select (MapType0Select Heap@29 null (|node#sm| freshObj@3)) o_8 f_12)) (U_2_bool (MapType1Select (MapType0Select Heap@29 null (|node#sm| (MapType0Select Heap@29 freshObj@3 next))) o_8 f_12)))) (U_2_bool (MapType1Select newPMask@3 o_8 f_12)))))
 :qid |stdinbpl.669:29|
 :skolemid |38|
 :pattern ( (MapType1Select newPMask@3 o_8 f_12))
)) (= Heap@30 (MapType0Store Heap@29 null (|node#sm| freshObj@3) newPMask@3))) (and (= Heap@31 Heap@30) (= (ControlFlow 0 26) 24))) anon40_correct))))
(let ((anon38_correct  (=> (= Heap@29 (MapType0Store Heap@28 null (|node#sm| freshObj@3) (MapType1Store (MapType0Select Heap@28 null (|node#sm| freshObj@3)) freshObj@3 next (bool_2_U true)))) (and (=> (= (ControlFlow 0 28) 26) anon74_Then_correct) (=> (= (ControlFlow 0 28) 27) anon74_Else_correct)))))
(let ((anon73_Else_correct  (=> (HasDirectPerm Mask@19 null (node freshObj@3)) (=> (and (= Heap@28 Heap@25) (= (ControlFlow 0 30) 28)) anon38_correct))))
(let ((anon73_Then_correct  (=> (not (HasDirectPerm Mask@19 null (node freshObj@3))) (=> (and (and (= Heap@26 (MapType0Store Heap@25 null (|node#sm| freshObj@3) ZeroPMask)) (= Heap@27 (MapType0Store Heap@26 null (node freshObj@3) freshVersion@3))) (and (= Heap@28 Heap@27) (= (ControlFlow 0 29) 28))) anon38_correct))))
(let ((anon36_correct  (=> (= Mask@19 (MapType1Store Mask@18 null (node freshObj@3) (real_2_U (+ (U_2_real (MapType1Select Mask@18 null (node freshObj@3))) FullPerm)))) (=> (and (and (state Heap@25 Mask@19) (state Heap@25 Mask@19)) (and (|node#trigger| Heap@25 (node freshObj@3)) (= (MapType0Select Heap@25 null (node freshObj@3)) (CombineFrames (FrameFragment (MapType0Select Heap@25 freshObj@3 next)) (FrameFragment (ite (not (= (MapType0Select Heap@25 freshObj@3 next) null)) (MapType0Select Heap@25 null (node (MapType0Select Heap@25 freshObj@3 next))) EmptyFrame)))))) (and (=> (= (ControlFlow 0 31) 29) anon73_Then_correct) (=> (= (ControlFlow 0 31) 30) anon73_Else_correct))))))
(let ((anon35_correct  (=> (and (and (= Mask@17 (MapType1Store Mask@16 null (node (MapType0Select Heap@25 freshObj@3 next)) (real_2_U (- (U_2_real (MapType1Select Mask@16 null (node (MapType0Select Heap@25 freshObj@3 next)))) FullPerm)))) (InsidePredicate (node freshObj@3) (MapType0Select Heap@25 null (node freshObj@3)) (node (MapType0Select Heap@25 freshObj@3 next)) (MapType0Select Heap@25 null (node (MapType0Select Heap@25 freshObj@3 next))))) (and (= Mask@18 Mask@17) (= (ControlFlow 0 33) 31))) anon36_correct)))
(let ((anon72_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 36) 33)) anon35_correct)))
(let ((anon72_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 34) (- 0 35)) (<= FullPerm (U_2_real (MapType1Select Mask@16 null (node (MapType0Select Heap@25 freshObj@3 next)))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@16 null (node (MapType0Select Heap@25 freshObj@3 next))))) (=> (= (ControlFlow 0 34) 33) anon35_correct))))))
(let ((anon71_Then_correct  (=> (not (= (MapType0Select Heap@25 freshObj@3 next) null)) (and (=> (= (ControlFlow 0 37) 34) anon72_Then_correct) (=> (= (ControlFlow 0 37) 36) anon72_Else_correct)))))
(let ((anon71_Else_correct  (=> (= (MapType0Select Heap@25 freshObj@3 next) null) (=> (and (= Mask@18 Mask@16) (= (ControlFlow 0 32) 31)) anon36_correct))))
(let ((anon32_correct  (=> (= Mask@16 (MapType1Store Mask@15 freshObj@3 next (real_2_U (- (U_2_real (MapType1Select Mask@15 freshObj@3 next)) FullPerm)))) (and (=> (= (ControlFlow 0 38) 37) anon71_Then_correct) (=> (= (ControlFlow 0 38) 32) anon71_Else_correct)))))
(let ((anon70_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 41) 38)) anon32_correct)))
(let ((anon70_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 39) (- 0 40)) (<= FullPerm (U_2_real (MapType1Select Mask@15 freshObj@3 next)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@15 freshObj@3 next))) (=> (= (ControlFlow 0 39) 38) anon32_correct))))))
(let ((anon30_correct  (=> (and (state Heap@23 Mask@14) (state Heap@23 Mask@14)) (=> (and (and (and (not (= freshObj@3 null)) (not (U_2_bool (MapType0Select Heap@23 freshObj@3 $allocated)))) (= Heap@24 (MapType0Store Heap@23 freshObj@3 $allocated (bool_2_U true)))) (and (= Mask@15 (MapType1Store Mask@14 freshObj@3 next (real_2_U (+ (U_2_real (MapType1Select Mask@14 freshObj@3 next)) FullPerm)))) (state Heap@24 Mask@15))) (and (=> (= (ControlFlow 0 42) (- 0 43)) (= FullPerm (U_2_real (MapType1Select Mask@15 freshObj@3 next)))) (=> (= FullPerm (U_2_real (MapType1Select Mask@15 freshObj@3 next))) (=> (and (= Heap@25 (MapType0Store Heap@24 freshObj@3 next freshObj@2)) (state Heap@25 Mask@15)) (and (=> (= (ControlFlow 0 42) 39) anon70_Then_correct) (=> (= (ControlFlow 0 42) 41) anon70_Else_correct)))))))))
(let ((anon69_Else_correct  (=> (= (MapType0Select Heap@21 freshObj@2 next) null) (=> (and (= Heap@23 Heap@21) (= (ControlFlow 0 45) 42)) anon30_correct))))
(let ((anon69_Then_correct  (=> (not (= (MapType0Select Heap@21 freshObj@2 next) null)) (=> (and (and (forall ((o_7 T@U) (f_11 T@U) ) (! (let ((B@@13 (FieldTypeInv1 (type f_11))))
(let ((A@@14 (FieldTypeInv0 (type f_11))))
 (=> (and (and (= (type o_7) RefType) (= (type f_11) (FieldType A@@14 B@@13))) (or (U_2_bool (MapType1Select (MapType0Select Heap@21 null (|node#sm| freshObj@2)) o_7 f_11)) (U_2_bool (MapType1Select (MapType0Select Heap@21 null (|node#sm| (MapType0Select Heap@21 freshObj@2 next))) o_7 f_11)))) (U_2_bool (MapType1Select newPMask@2 o_7 f_11)))))
 :qid |stdinbpl.612:29|
 :skolemid |37|
 :pattern ( (MapType1Select newPMask@2 o_7 f_11))
)) (= Heap@22 (MapType0Store Heap@21 null (|node#sm| freshObj@2) newPMask@2))) (and (= Heap@23 Heap@22) (= (ControlFlow 0 44) 42))) anon30_correct))))
(let ((anon28_correct  (=> (= Heap@21 (MapType0Store Heap@20 null (|node#sm| freshObj@2) (MapType1Store (MapType0Select Heap@20 null (|node#sm| freshObj@2)) freshObj@2 next (bool_2_U true)))) (and (=> (= (ControlFlow 0 46) 44) anon69_Then_correct) (=> (= (ControlFlow 0 46) 45) anon69_Else_correct)))))
(let ((anon68_Else_correct  (=> (HasDirectPerm Mask@14 null (node freshObj@2)) (=> (and (= Heap@20 Heap@17) (= (ControlFlow 0 48) 46)) anon28_correct))))
(let ((anon68_Then_correct  (=> (not (HasDirectPerm Mask@14 null (node freshObj@2))) (=> (and (and (= Heap@18 (MapType0Store Heap@17 null (|node#sm| freshObj@2) ZeroPMask)) (= Heap@19 (MapType0Store Heap@18 null (node freshObj@2) freshVersion@2))) (and (= Heap@20 Heap@19) (= (ControlFlow 0 47) 46))) anon28_correct))))
(let ((anon26_correct  (=> (= Mask@14 (MapType1Store Mask@13 null (node freshObj@2) (real_2_U (+ (U_2_real (MapType1Select Mask@13 null (node freshObj@2))) FullPerm)))) (=> (and (and (state Heap@17 Mask@14) (state Heap@17 Mask@14)) (and (|node#trigger| Heap@17 (node freshObj@2)) (= (MapType0Select Heap@17 null (node freshObj@2)) (CombineFrames (FrameFragment (MapType0Select Heap@17 freshObj@2 next)) (FrameFragment (ite (not (= (MapType0Select Heap@17 freshObj@2 next) null)) (MapType0Select Heap@17 null (node (MapType0Select Heap@17 freshObj@2 next))) EmptyFrame)))))) (and (=> (= (ControlFlow 0 49) 47) anon68_Then_correct) (=> (= (ControlFlow 0 49) 48) anon68_Else_correct))))))
(let ((anon25_correct  (=> (and (and (= Mask@12 (MapType1Store Mask@11 null (node (MapType0Select Heap@17 freshObj@2 next)) (real_2_U (- (U_2_real (MapType1Select Mask@11 null (node (MapType0Select Heap@17 freshObj@2 next)))) FullPerm)))) (InsidePredicate (node freshObj@2) (MapType0Select Heap@17 null (node freshObj@2)) (node (MapType0Select Heap@17 freshObj@2 next)) (MapType0Select Heap@17 null (node (MapType0Select Heap@17 freshObj@2 next))))) (and (= Mask@13 Mask@12) (= (ControlFlow 0 51) 49))) anon26_correct)))
(let ((anon67_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 54) 51)) anon25_correct)))
(let ((anon67_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 52) (- 0 53)) (<= FullPerm (U_2_real (MapType1Select Mask@11 null (node (MapType0Select Heap@17 freshObj@2 next)))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@11 null (node (MapType0Select Heap@17 freshObj@2 next))))) (=> (= (ControlFlow 0 52) 51) anon25_correct))))))
(let ((anon66_Then_correct  (=> (not (= (MapType0Select Heap@17 freshObj@2 next) null)) (and (=> (= (ControlFlow 0 55) 52) anon67_Then_correct) (=> (= (ControlFlow 0 55) 54) anon67_Else_correct)))))
(let ((anon66_Else_correct  (=> (= (MapType0Select Heap@17 freshObj@2 next) null) (=> (and (= Mask@13 Mask@11) (= (ControlFlow 0 50) 49)) anon26_correct))))
(let ((anon22_correct  (=> (= Mask@11 (MapType1Store Mask@10 freshObj@2 next (real_2_U (- (U_2_real (MapType1Select Mask@10 freshObj@2 next)) FullPerm)))) (and (=> (= (ControlFlow 0 56) 55) anon66_Then_correct) (=> (= (ControlFlow 0 56) 50) anon66_Else_correct)))))
(let ((anon65_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 59) 56)) anon22_correct)))
(let ((anon65_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 57) (- 0 58)) (<= FullPerm (U_2_real (MapType1Select Mask@10 freshObj@2 next)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@10 freshObj@2 next))) (=> (= (ControlFlow 0 57) 56) anon22_correct))))))
(let ((anon20_correct  (=> (and (state Heap@15 Mask@9) (state Heap@15 Mask@9)) (=> (and (and (and (not (= freshObj@2 null)) (not (U_2_bool (MapType0Select Heap@15 freshObj@2 $allocated)))) (= Heap@16 (MapType0Store Heap@15 freshObj@2 $allocated (bool_2_U true)))) (and (= Mask@10 (MapType1Store Mask@9 freshObj@2 next (real_2_U (+ (U_2_real (MapType1Select Mask@9 freshObj@2 next)) FullPerm)))) (state Heap@16 Mask@10))) (and (=> (= (ControlFlow 0 60) (- 0 61)) (= FullPerm (U_2_real (MapType1Select Mask@10 freshObj@2 next)))) (=> (= FullPerm (U_2_real (MapType1Select Mask@10 freshObj@2 next))) (=> (and (= Heap@17 (MapType0Store Heap@16 freshObj@2 next freshObj@1)) (state Heap@17 Mask@10)) (and (=> (= (ControlFlow 0 60) 57) anon65_Then_correct) (=> (= (ControlFlow 0 60) 59) anon65_Else_correct)))))))))
(let ((anon64_Else_correct  (=> (= (MapType0Select Heap@13 freshObj@1 next) null) (=> (and (= Heap@15 Heap@13) (= (ControlFlow 0 63) 60)) anon20_correct))))
(let ((anon64_Then_correct  (=> (not (= (MapType0Select Heap@13 freshObj@1 next) null)) (=> (and (and (forall ((o_6 T@U) (f_10 T@U) ) (! (let ((B@@14 (FieldTypeInv1 (type f_10))))
(let ((A@@15 (FieldTypeInv0 (type f_10))))
 (=> (and (and (= (type o_6) RefType) (= (type f_10) (FieldType A@@15 B@@14))) (or (U_2_bool (MapType1Select (MapType0Select Heap@13 null (|node#sm| freshObj@1)) o_6 f_10)) (U_2_bool (MapType1Select (MapType0Select Heap@13 null (|node#sm| (MapType0Select Heap@13 freshObj@1 next))) o_6 f_10)))) (U_2_bool (MapType1Select newPMask@1 o_6 f_10)))))
 :qid |stdinbpl.555:29|
 :skolemid |36|
 :pattern ( (MapType1Select newPMask@1 o_6 f_10))
)) (= Heap@14 (MapType0Store Heap@13 null (|node#sm| freshObj@1) newPMask@1))) (and (= Heap@15 Heap@14) (= (ControlFlow 0 62) 60))) anon20_correct))))
(let ((anon18_correct  (=> (= Heap@13 (MapType0Store Heap@12 null (|node#sm| freshObj@1) (MapType1Store (MapType0Select Heap@12 null (|node#sm| freshObj@1)) freshObj@1 next (bool_2_U true)))) (and (=> (= (ControlFlow 0 64) 62) anon64_Then_correct) (=> (= (ControlFlow 0 64) 63) anon64_Else_correct)))))
(let ((anon63_Else_correct  (=> (HasDirectPerm Mask@9 null (node freshObj@1)) (=> (and (= Heap@12 Heap@9) (= (ControlFlow 0 66) 64)) anon18_correct))))
(let ((anon63_Then_correct  (=> (not (HasDirectPerm Mask@9 null (node freshObj@1))) (=> (and (and (= Heap@10 (MapType0Store Heap@9 null (|node#sm| freshObj@1) ZeroPMask)) (= Heap@11 (MapType0Store Heap@10 null (node freshObj@1) freshVersion@1))) (and (= Heap@12 Heap@11) (= (ControlFlow 0 65) 64))) anon18_correct))))
(let ((anon16_correct  (=> (= Mask@9 (MapType1Store Mask@8 null (node freshObj@1) (real_2_U (+ (U_2_real (MapType1Select Mask@8 null (node freshObj@1))) FullPerm)))) (=> (and (and (state Heap@9 Mask@9) (state Heap@9 Mask@9)) (and (|node#trigger| Heap@9 (node freshObj@1)) (= (MapType0Select Heap@9 null (node freshObj@1)) (CombineFrames (FrameFragment (MapType0Select Heap@9 freshObj@1 next)) (FrameFragment (ite (not (= (MapType0Select Heap@9 freshObj@1 next) null)) (MapType0Select Heap@9 null (node (MapType0Select Heap@9 freshObj@1 next))) EmptyFrame)))))) (and (=> (= (ControlFlow 0 67) 65) anon63_Then_correct) (=> (= (ControlFlow 0 67) 66) anon63_Else_correct))))))
(let ((anon15_correct  (=> (and (and (= Mask@7 (MapType1Store Mask@6 null (node (MapType0Select Heap@9 freshObj@1 next)) (real_2_U (- (U_2_real (MapType1Select Mask@6 null (node (MapType0Select Heap@9 freshObj@1 next)))) FullPerm)))) (InsidePredicate (node freshObj@1) (MapType0Select Heap@9 null (node freshObj@1)) (node (MapType0Select Heap@9 freshObj@1 next)) (MapType0Select Heap@9 null (node (MapType0Select Heap@9 freshObj@1 next))))) (and (= Mask@8 Mask@7) (= (ControlFlow 0 69) 67))) anon16_correct)))
(let ((anon62_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 72) 69)) anon15_correct)))
(let ((anon62_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 70) (- 0 71)) (<= FullPerm (U_2_real (MapType1Select Mask@6 null (node (MapType0Select Heap@9 freshObj@1 next)))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@6 null (node (MapType0Select Heap@9 freshObj@1 next))))) (=> (= (ControlFlow 0 70) 69) anon15_correct))))))
(let ((anon61_Then_correct  (=> (not (= (MapType0Select Heap@9 freshObj@1 next) null)) (and (=> (= (ControlFlow 0 73) 70) anon62_Then_correct) (=> (= (ControlFlow 0 73) 72) anon62_Else_correct)))))
(let ((anon61_Else_correct  (=> (= (MapType0Select Heap@9 freshObj@1 next) null) (=> (and (= Mask@8 Mask@6) (= (ControlFlow 0 68) 67)) anon16_correct))))
(let ((anon12_correct  (=> (= Mask@6 (MapType1Store Mask@5 freshObj@1 next (real_2_U (- (U_2_real (MapType1Select Mask@5 freshObj@1 next)) FullPerm)))) (and (=> (= (ControlFlow 0 74) 73) anon61_Then_correct) (=> (= (ControlFlow 0 74) 68) anon61_Else_correct)))))
(let ((anon60_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 77) 74)) anon12_correct)))
(let ((anon60_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 75) (- 0 76)) (<= FullPerm (U_2_real (MapType1Select Mask@5 freshObj@1 next)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@5 freshObj@1 next))) (=> (= (ControlFlow 0 75) 74) anon12_correct))))))
(let ((anon10_correct  (=> (and (state Heap@7 Mask@4) (state Heap@7 Mask@4)) (=> (and (and (and (not (= freshObj@1 null)) (not (U_2_bool (MapType0Select Heap@7 freshObj@1 $allocated)))) (= Heap@8 (MapType0Store Heap@7 freshObj@1 $allocated (bool_2_U true)))) (and (= Mask@5 (MapType1Store Mask@4 freshObj@1 next (real_2_U (+ (U_2_real (MapType1Select Mask@4 freshObj@1 next)) FullPerm)))) (state Heap@8 Mask@5))) (and (=> (= (ControlFlow 0 78) (- 0 79)) (= FullPerm (U_2_real (MapType1Select Mask@5 freshObj@1 next)))) (=> (= FullPerm (U_2_real (MapType1Select Mask@5 freshObj@1 next))) (=> (and (= Heap@9 (MapType0Store Heap@8 freshObj@1 next freshObj@0)) (state Heap@9 Mask@5)) (and (=> (= (ControlFlow 0 78) 75) anon60_Then_correct) (=> (= (ControlFlow 0 78) 77) anon60_Else_correct)))))))))
(let ((anon59_Else_correct  (=> (= (MapType0Select Heap@5 freshObj@0 next) null) (=> (and (= Heap@7 Heap@5) (= (ControlFlow 0 81) 78)) anon10_correct))))
(let ((anon59_Then_correct  (=> (not (= (MapType0Select Heap@5 freshObj@0 next) null)) (=> (and (and (forall ((o_5 T@U) (f_9 T@U) ) (! (let ((B@@15 (FieldTypeInv1 (type f_9))))
(let ((A@@16 (FieldTypeInv0 (type f_9))))
 (=> (and (and (= (type o_5) RefType) (= (type f_9) (FieldType A@@16 B@@15))) (or (U_2_bool (MapType1Select (MapType0Select Heap@5 null (|node#sm| freshObj@0)) o_5 f_9)) (U_2_bool (MapType1Select (MapType0Select Heap@5 null (|node#sm| (MapType0Select Heap@5 freshObj@0 next))) o_5 f_9)))) (U_2_bool (MapType1Select newPMask@0 o_5 f_9)))))
 :qid |stdinbpl.498:29|
 :skolemid |35|
 :pattern ( (MapType1Select newPMask@0 o_5 f_9))
)) (= Heap@6 (MapType0Store Heap@5 null (|node#sm| freshObj@0) newPMask@0))) (and (= Heap@7 Heap@6) (= (ControlFlow 0 80) 78))) anon10_correct))))
(let ((anon8_correct  (=> (= Heap@5 (MapType0Store Heap@4 null (|node#sm| freshObj@0) (MapType1Store (MapType0Select Heap@4 null (|node#sm| freshObj@0)) freshObj@0 next (bool_2_U true)))) (and (=> (= (ControlFlow 0 82) 80) anon59_Then_correct) (=> (= (ControlFlow 0 82) 81) anon59_Else_correct)))))
(let ((anon58_Else_correct  (=> (HasDirectPerm Mask@4 null (node freshObj@0)) (=> (and (= Heap@4 Heap@1) (= (ControlFlow 0 84) 82)) anon8_correct))))
(let ((anon58_Then_correct  (=> (not (HasDirectPerm Mask@4 null (node freshObj@0))) (=> (and (and (= Heap@2 (MapType0Store Heap@1 null (|node#sm| freshObj@0) ZeroPMask)) (= Heap@3 (MapType0Store Heap@2 null (node freshObj@0) freshVersion@0))) (and (= Heap@4 Heap@3) (= (ControlFlow 0 83) 82))) anon8_correct))))
(let ((anon6_correct  (=> (= Mask@4 (MapType1Store Mask@3 null (node freshObj@0) (real_2_U (+ (U_2_real (MapType1Select Mask@3 null (node freshObj@0))) FullPerm)))) (=> (and (and (state Heap@1 Mask@4) (state Heap@1 Mask@4)) (and (|node#trigger| Heap@1 (node freshObj@0)) (= (MapType0Select Heap@1 null (node freshObj@0)) (CombineFrames (FrameFragment (MapType0Select Heap@1 freshObj@0 next)) (FrameFragment (ite (not (= (MapType0Select Heap@1 freshObj@0 next) null)) (MapType0Select Heap@1 null (node (MapType0Select Heap@1 freshObj@0 next))) EmptyFrame)))))) (and (=> (= (ControlFlow 0 85) 83) anon58_Then_correct) (=> (= (ControlFlow 0 85) 84) anon58_Else_correct))))))
(let ((anon5_correct  (=> (and (and (= Mask@2 (MapType1Store Mask@1 null (node (MapType0Select Heap@1 freshObj@0 next)) (real_2_U (- (U_2_real (MapType1Select Mask@1 null (node (MapType0Select Heap@1 freshObj@0 next)))) FullPerm)))) (InsidePredicate (node freshObj@0) (MapType0Select Heap@1 null (node freshObj@0)) (node (MapType0Select Heap@1 freshObj@0 next)) (MapType0Select Heap@1 null (node (MapType0Select Heap@1 freshObj@0 next))))) (and (= Mask@3 Mask@2) (= (ControlFlow 0 87) 85))) anon6_correct)))
(let ((anon57_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 90) 87)) anon5_correct)))
(let ((anon57_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 88) (- 0 89)) (<= FullPerm (U_2_real (MapType1Select Mask@1 null (node (MapType0Select Heap@1 freshObj@0 next)))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@1 null (node (MapType0Select Heap@1 freshObj@0 next))))) (=> (= (ControlFlow 0 88) 87) anon5_correct))))))
(let ((anon56_Then_correct  (=> (not (= (MapType0Select Heap@1 freshObj@0 next) null)) (and (=> (= (ControlFlow 0 91) 88) anon57_Then_correct) (=> (= (ControlFlow 0 91) 90) anon57_Else_correct)))))
(let ((anon56_Else_correct  (=> (= (MapType0Select Heap@1 freshObj@0 next) null) (=> (and (= Mask@3 Mask@1) (= (ControlFlow 0 86) 85)) anon6_correct))))
(let ((anon2_correct  (=> (= Mask@1 (MapType1Store Mask@0 freshObj@0 next (real_2_U (- (U_2_real (MapType1Select Mask@0 freshObj@0 next)) FullPerm)))) (and (=> (= (ControlFlow 0 92) 91) anon56_Then_correct) (=> (= (ControlFlow 0 92) 86) anon56_Else_correct)))))
(let ((anon55_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 95) 92)) anon2_correct)))
(let ((anon55_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 93) (- 0 94)) (<= FullPerm (U_2_real (MapType1Select Mask@0 freshObj@0 next)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@0 freshObj@0 next))) (=> (= (ControlFlow 0 93) 92) anon2_correct))))))
(let ((anon0_correct  (=> (state Heap@@15 ZeroMask) (=> (and (= AssumeFunctionsAbove (- 0 1)) (U_2_bool (MapType0Select Heap@@15 n1 $allocated))) (=> (and (and (U_2_bool (MapType0Select Heap@@15 n2 $allocated)) (U_2_bool (MapType0Select Heap@@15 n3 $allocated))) (and (U_2_bool (MapType0Select Heap@@15 n4 $allocated)) (U_2_bool (MapType0Select Heap@@15 n5 $allocated)))) (=> (and (and (and (not (= freshObj@0 null)) (not (U_2_bool (MapType0Select Heap@@15 freshObj@0 $allocated)))) (= Heap@0 (MapType0Store Heap@@15 freshObj@0 $allocated (bool_2_U true)))) (and (= Mask@0 (MapType1Store ZeroMask freshObj@0 next (real_2_U (+ (U_2_real (MapType1Select ZeroMask freshObj@0 next)) FullPerm)))) (state Heap@0 Mask@0))) (and (=> (= (ControlFlow 0 96) (- 0 97)) (= FullPerm (U_2_real (MapType1Select Mask@0 freshObj@0 next)))) (=> (= FullPerm (U_2_real (MapType1Select Mask@0 freshObj@0 next))) (=> (and (= Heap@1 (MapType0Store Heap@0 freshObj@0 next null)) (state Heap@1 Mask@0)) (and (=> (= (ControlFlow 0 96) 93) anon55_Then_correct) (=> (= (ControlFlow 0 96) 95) anon55_Else_correct)))))))))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 98) 96) anon0_correct)))
PreconditionGeneratedEntry_correct))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
))
(check-sat)
(pop 1)
; Valid
(get-info :rlimit)
