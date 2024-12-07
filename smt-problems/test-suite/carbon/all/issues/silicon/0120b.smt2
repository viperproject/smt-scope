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
(declare-fun A () T@U)
(declare-fun B () T@U)
(declare-fun a_2 () T@U)
(declare-fun val () T@U)
(declare-fun next () T@U)
(declare-fun FieldType (T@T T@T) T@T)
(declare-fun FieldTypeInv0 (T@T) T@T)
(declare-fun FieldTypeInv1 (T@T) T@T)
(declare-fun NormalFieldType () T@T)
(declare-fun TypeDomainTypeType () T@T)
(declare-fun RefType () T@T)
(declare-fun state (T@U T@U) Bool)
(declare-fun |length'| (T@U T@U) Int)
(declare-fun MapType0Type (T@T) T@T)
(declare-fun MapType1Type (T@T T@T) T@T)
(declare-fun AssumeFunctionsAbove () Int)
(declare-fun |length#trigger| (T@U T@U) Bool)
(declare-fun MapType0Select (T@U T@U T@U) T@U)
(declare-fun null () T@U)
(declare-fun node (T@U) T@U)
(declare-fun MapType0TypeInv0 (T@T) T@T)
(declare-fun MapType0Store (T@U T@U T@U T@U) T@U)
(declare-fun MapType1TypeInv0 (T@T) T@T)
(declare-fun MapType1TypeInv1 (T@T) T@T)
(declare-fun MapType1Select (T@U T@U T@U) T@U)
(declare-fun MapType1Store (T@U T@U T@U T@U) T@U)
(declare-fun PredicateType_nodeType () T@T)
(declare-fun FrameTypeType () T@T)
(declare-fun succHeap (T@U T@U) Bool)
(declare-fun succHeapTrans (T@U T@U) Bool)
(declare-fun GoodMask (T@U) Bool)
(declare-fun IdenticalOnKnownLocations (T@U T@U T@U) Bool)
(declare-fun IsPredicateField (T@U) Bool)
(declare-fun PredicateMaskField (T@U) T@U)
(declare-fun HasDirectPerm (T@U T@U T@U) Bool)
(declare-fun IsWandField (T@U) Bool)
(declare-fun WandMaskField (T@U) T@U)
(declare-fun dummyFunction (T@U) Bool)
(declare-fun |length#triggerStateless| (T@U) Int)
(declare-fun |node#trigger| (T@U T@U) Bool)
(declare-fun |node#everUsed| (T@U) Bool)
(declare-fun length (T@U T@U) Int)
(declare-fun typeOf (T@U) T@U)
(declare-fun |node#sm| (T@U) T@U)
(declare-fun dummyHeap () T@U)
(declare-fun ZeroMask () T@U)
(declare-fun InsidePredicate (T@U T@U T@U T@U) Bool)
(declare-fun sumMask (T@U T@U T@U) Bool)
(declare-fun ConditionalFrame (Real T@U) T@U)
(declare-fun EmptyFrame () T@U)
(declare-fun NoPerm () Real)
(declare-fun getPredWandId (T@U) Int)
(declare-fun FullPerm () Real)
(declare-fun |length#frame| (T@U T@U) Int)
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
(assert  (and (and (and (and (and (and (and (and (and (and (and (forall ((arg0@@11 T@T) (arg1 T@T) ) (! (= (Ctor (FieldType arg0@@11 arg1)) 6)
 :qid |ctor:FieldType|
)) (forall ((arg0@@12 T@T) (arg1@@0 T@T) ) (! (= (FieldTypeInv0 (FieldType arg0@@12 arg1@@0)) arg0@@12)
 :qid |typeInv:FieldTypeInv0|
 :pattern ( (FieldType arg0@@12 arg1@@0))
))) (forall ((arg0@@13 T@T) (arg1@@1 T@T) ) (! (= (FieldTypeInv1 (FieldType arg0@@13 arg1@@1)) arg1@@1)
 :qid |typeInv:FieldTypeInv1|
 :pattern ( (FieldType arg0@@13 arg1@@1))
))) (= (Ctor NormalFieldType) 7)) (= (type $allocated) (FieldType NormalFieldType boolType))) (= (Ctor TypeDomainTypeType) 8)) (= (type A) TypeDomainTypeType)) (= (type B) TypeDomainTypeType)) (= (Ctor RefType) 9)) (= (type a_2) (FieldType NormalFieldType RefType))) (= (type val) (FieldType NormalFieldType intType))) (= (type next) (FieldType NormalFieldType RefType))))
(assert (distinct $allocated A B a_2 val next)
)
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (forall ((arg0@@14 T@T) ) (! (= (Ctor (MapType0Type arg0@@14)) 10)
 :qid |ctor:MapType0Type|
)) (forall ((arg0@@15 T@T) ) (! (= (MapType0TypeInv0 (MapType0Type arg0@@15)) arg0@@15)
 :qid |typeInv:MapType0TypeInv0|
 :pattern ( (MapType0Type arg0@@15))
))) (forall ((arg0@@16 T@U) (arg1@@2 T@U) (arg2 T@U) ) (! (let ((B@@0 (FieldTypeInv1 (type arg2))))
(= (type (MapType0Select arg0@@16 arg1@@2 arg2)) B@@0))
 :qid |funType:MapType0Select|
 :pattern ( (MapType0Select arg0@@16 arg1@@2 arg2))
))) (forall ((arg0@@17 T@U) (arg1@@3 T@U) (arg2@@0 T@U) (arg3 T@U) ) (! (let ((aVar0 (type arg1@@3)))
(= (type (MapType0Store arg0@@17 arg1@@3 arg2@@0 arg3)) (MapType0Type aVar0)))
 :qid |funType:MapType0Store|
 :pattern ( (MapType0Store arg0@@17 arg1@@3 arg2@@0 arg3))
))) (forall ((m T@U) (x0 T@U) (x1 T@U) (val@@0 T@U) ) (! (let ((B@@1 (FieldTypeInv1 (type x1))))
 (=> (= (type val@@0) B@@1) (= (MapType0Select (MapType0Store m x0 x1 val@@0) x0 x1) val@@0)))
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
)))) (forall ((arg0@@18 T@T) (arg1@@4 T@T) ) (! (= (Ctor (MapType1Type arg0@@18 arg1@@4)) 11)
 :qid |ctor:MapType1Type|
))) (forall ((arg0@@19 T@T) (arg1@@5 T@T) ) (! (= (MapType1TypeInv0 (MapType1Type arg0@@19 arg1@@5)) arg0@@19)
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
)))) (= (type null) RefType)) (= (Ctor PredicateType_nodeType) 12)) (= (Ctor FrameTypeType) 13)) (forall ((arg0@@23 T@U) ) (! (= (type (node arg0@@23)) (FieldType PredicateType_nodeType FrameTypeType))
 :qid |funType:node|
 :pattern ( (node arg0@@23))
))))
(assert (forall ((Heap T@U) (Mask T@U) (this T@U) ) (!  (=> (and (and (and (= (type Heap) (MapType0Type RefType)) (= (type Mask) (MapType1Type RefType realType))) (= (type this) RefType)) (and (state Heap Mask) (or (< AssumeFunctionsAbove 0) (|length#trigger| (MapType0Select Heap null (node this)) this)))) (>= (|length'| Heap this) 1))
 :qid |stdinbpl.244:15|
 :skolemid |27|
 :pattern ( (state Heap Mask) (|length'| Heap this))
)))
(assert (forall ((Heap0 T@U) (Heap1 T@U) ) (!  (=> (and (and (= (type Heap0) (MapType0Type RefType)) (= (type Heap1) (MapType0Type RefType))) (succHeap Heap0 Heap1)) (succHeapTrans Heap0 Heap1))
 :qid |stdinbpl.88:15|
 :skolemid |11|
 :pattern ( (succHeap Heap0 Heap1))
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
(assert (forall ((arg0@@24 T@U) ) (! (let ((A@@0 (FieldTypeInv0 (type arg0@@24))))
(= (type (PredicateMaskField arg0@@24)) (FieldType A@@0 (MapType1Type RefType boolType))))
 :qid |funType:PredicateMaskField|
 :pattern ( (PredicateMaskField arg0@@24))
)))
(assert (forall ((Heap@@1 T@U) (ExhaleHeap T@U) (Mask@@1 T@U) (pm_f T@U) ) (! (let ((C (FieldTypeInv0 (type pm_f))))
 (=> (and (and (and (and (and (= (type Heap@@1) (MapType0Type RefType)) (= (type ExhaleHeap) (MapType0Type RefType))) (= (type Mask@@1) (MapType1Type RefType realType))) (= (type pm_f) (FieldType C FrameTypeType))) (IdenticalOnKnownLocations Heap@@1 ExhaleHeap Mask@@1)) (and (HasDirectPerm Mask@@1 null pm_f) (IsPredicateField pm_f))) (= (MapType0Select Heap@@1 null (PredicateMaskField pm_f)) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))))
 :qid |stdinbpl.47:19|
 :skolemid |2|
 :pattern ( (IdenticalOnKnownLocations Heap@@1 ExhaleHeap Mask@@1) (IsPredicateField pm_f) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))
)))
(assert (forall ((arg0@@25 T@U) ) (! (let ((A@@1 (FieldTypeInv0 (type arg0@@25))))
(= (type (WandMaskField arg0@@25)) (FieldType A@@1 (MapType1Type RefType boolType))))
 :qid |funType:WandMaskField|
 :pattern ( (WandMaskField arg0@@25))
)))
(assert (forall ((Heap@@2 T@U) (ExhaleHeap@@0 T@U) (Mask@@2 T@U) (pm_f@@0 T@U) ) (! (let ((C@@0 (FieldTypeInv0 (type pm_f@@0))))
 (=> (and (and (and (and (and (= (type Heap@@2) (MapType0Type RefType)) (= (type ExhaleHeap@@0) (MapType0Type RefType))) (= (type Mask@@2) (MapType1Type RefType realType))) (= (type pm_f@@0) (FieldType C@@0 FrameTypeType))) (IdenticalOnKnownLocations Heap@@2 ExhaleHeap@@0 Mask@@2)) (and (HasDirectPerm Mask@@2 null pm_f@@0) (IsWandField pm_f@@0))) (= (MapType0Select Heap@@2 null (WandMaskField pm_f@@0)) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))))
 :qid |stdinbpl.60:19|
 :skolemid |5|
 :pattern ( (IdenticalOnKnownLocations Heap@@2 ExhaleHeap@@0 Mask@@2) (IsWandField pm_f@@0) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))
)))
(assert (forall ((this@@0 T@U) ) (!  (=> (= (type this@@0) RefType) (IsPredicateField (node this@@0)))
 :qid |stdinbpl.380:15|
 :skolemid |30|
 :pattern ( (node this@@0))
)))
(assert (forall ((Heap@@3 T@U) (this@@1 T@U) ) (!  (=> (and (= (type Heap@@3) (MapType0Type RefType)) (= (type this@@1) RefType)) (dummyFunction (int_2_U (|length#triggerStateless| this@@1))))
 :qid |stdinbpl.225:15|
 :skolemid |24|
 :pattern ( (|length'| Heap@@3 this@@1))
)))
(assert (forall ((Heap@@4 T@U) (this@@2 T@U) ) (!  (=> (and (= (type Heap@@4) (MapType0Type RefType)) (= (type this@@2) RefType)) (|node#everUsed| (node this@@2)))
 :qid |stdinbpl.399:15|
 :skolemid |34|
 :pattern ( (|node#trigger| Heap@@4 (node this@@2)))
)))
(assert (forall ((arg0@@26 T@U) ) (! (= (type (typeOf arg0@@26)) TypeDomainTypeType)
 :qid |funType:typeOf|
 :pattern ( (typeOf arg0@@26))
)))
(assert (forall ((Heap@@5 T@U) (Mask@@3 T@U) (this@@3 T@U) ) (!  (=> (and (and (and (= (type Heap@@5) (MapType0Type RefType)) (= (type Mask@@3) (MapType1Type RefType realType))) (= (type this@@3) RefType)) (and (state Heap@@5 Mask@@3) (< AssumeFunctionsAbove 0))) (= (length Heap@@5 this@@3) (ite (= (typeOf (MapType0Select Heap@@5 this@@3 next)) B) 1 (+ 1 (|length'| Heap@@5 (MapType0Select Heap@@5 (MapType0Select Heap@@5 this@@3 next) a_2))))))
 :qid |stdinbpl.231:15|
 :skolemid |25|
 :pattern ( (state Heap@@5 Mask@@3) (length Heap@@5 this@@3))
 :pattern ( (state Heap@@5 Mask@@3) (|length#triggerStateless| this@@3) (|node#trigger| Heap@@5 (node this@@3)))
)))
(assert (forall ((Heap@@6 T@U) (ExhaleHeap@@1 T@U) (Mask@@4 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@6) (MapType0Type RefType)) (= (type ExhaleHeap@@1) (MapType0Type RefType))) (= (type Mask@@4) (MapType1Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@6 ExhaleHeap@@1 Mask@@4)) (U_2_bool (MapType0Select Heap@@6 o_1 $allocated))) (U_2_bool (MapType0Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.73:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@6 ExhaleHeap@@1 Mask@@4) (MapType0Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert (forall ((Heap@@7 T@U) (this@@4 T@U) ) (!  (=> (and (= (type Heap@@7) (MapType0Type RefType)) (= (type this@@4) RefType)) (and (= (length Heap@@7 this@@4) (|length'| Heap@@7 this@@4)) (dummyFunction (int_2_U (|length#triggerStateless| this@@4)))))
 :qid |stdinbpl.221:15|
 :skolemid |23|
 :pattern ( (length Heap@@7 this@@4))
)))
(assert (forall ((this@@5 T@U) (this2 T@U) ) (!  (=> (and (and (= (type this@@5) RefType) (= (type this2) RefType)) (= (node this@@5) (node this2))) (= this@@5 this2))
 :qid |stdinbpl.390:15|
 :skolemid |32|
 :pattern ( (node this@@5) (node this2))
)))
(assert (forall ((arg0@@27 T@U) ) (! (= (type (|node#sm| arg0@@27)) (FieldType PredicateType_nodeType (MapType1Type RefType boolType)))
 :qid |funType:node#sm|
 :pattern ( (|node#sm| arg0@@27))
)))
(assert (forall ((this@@6 T@U) (this2@@0 T@U) ) (!  (=> (and (and (= (type this@@6) RefType) (= (type this2@@0) RefType)) (= (|node#sm| this@@6) (|node#sm| this2@@0))) (= this@@6 this2@@0))
 :qid |stdinbpl.394:15|
 :skolemid |33|
 :pattern ( (|node#sm| this@@6) (|node#sm| this2@@0))
)))
(assert (forall ((Heap@@8 T@U) (ExhaleHeap@@2 T@U) (Mask@@5 T@U) (o_1@@0 T@U) (f_2 T@U) ) (! (let ((B@@2 (FieldTypeInv1 (type f_2))))
(let ((A@@2 (FieldTypeInv0 (type f_2))))
 (=> (and (and (and (and (and (and (= (type Heap@@8) (MapType0Type RefType)) (= (type ExhaleHeap@@2) (MapType0Type RefType))) (= (type Mask@@5) (MapType1Type RefType realType))) (= (type o_1@@0) RefType)) (= (type f_2) (FieldType A@@2 B@@2))) (IdenticalOnKnownLocations Heap@@8 ExhaleHeap@@2 Mask@@5)) (HasDirectPerm Mask@@5 o_1@@0 f_2)) (= (MapType0Select Heap@@8 o_1@@0 f_2) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2)))))
 :qid |stdinbpl.42:22|
 :skolemid |1|
 :pattern ( (IdenticalOnKnownLocations Heap@@8 ExhaleHeap@@2 Mask@@5) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2))
)))
(assert  (and (= (type dummyHeap) (MapType0Type RefType)) (= (type ZeroMask) (MapType1Type RefType realType))))
(assert (state dummyHeap ZeroMask))
(assert (forall ((p T@U) (v_1 T@U) (w T@U) ) (! (let ((A@@3 (FieldTypeInv0 (type p))))
 (=> (and (and (= (type p) (FieldType A@@3 FrameTypeType)) (= (type v_1) FrameTypeType)) (= (type w) FrameTypeType)) (not (InsidePredicate p v_1 p w))))
 :qid |stdinbpl.173:19|
 :skolemid |21|
 :pattern ( (InsidePredicate p v_1 p w))
)))
(assert  (not (IsPredicateField a_2)))
(assert  (not (IsWandField a_2)))
(assert  (not (IsPredicateField val)))
(assert  (not (IsWandField val)))
(assert  (not (IsPredicateField next)))
(assert  (not (IsWandField next)))
(assert (forall ((Heap@@9 T@U) (ExhaleHeap@@3 T@U) (Mask@@6 T@U) ) (!  (=> (and (and (and (= (type Heap@@9) (MapType0Type RefType)) (= (type ExhaleHeap@@3) (MapType0Type RefType))) (= (type Mask@@6) (MapType1Type RefType realType))) (IdenticalOnKnownLocations Heap@@9 ExhaleHeap@@3 Mask@@6)) (succHeap Heap@@9 ExhaleHeap@@3))
 :qid |stdinbpl.83:15|
 :skolemid |10|
 :pattern ( (IdenticalOnKnownLocations Heap@@9 ExhaleHeap@@3 Mask@@6))
)))
(assert (forall ((ResultMask T@U) (SummandMask1 T@U) (SummandMask2 T@U) (o_2 T@U) (f_4 T@U) ) (! (let ((B@@3 (FieldTypeInv1 (type f_4))))
(let ((A@@4 (FieldTypeInv0 (type f_4))))
 (=> (and (and (and (and (and (= (type ResultMask) (MapType1Type RefType realType)) (= (type SummandMask1) (MapType1Type RefType realType))) (= (type SummandMask2) (MapType1Type RefType realType))) (= (type o_2) RefType)) (= (type f_4) (FieldType A@@4 B@@3))) (sumMask ResultMask SummandMask1 SummandMask2)) (= (U_2_real (MapType1Select ResultMask o_2 f_4)) (+ (U_2_real (MapType1Select SummandMask1 o_2 f_4)) (U_2_real (MapType1Select SummandMask2 o_2 f_4)))))))
 :qid |stdinbpl.138:22|
 :skolemid |18|
 :pattern ( (sumMask ResultMask SummandMask1 SummandMask2) (MapType1Select ResultMask o_2 f_4))
 :pattern ( (sumMask ResultMask SummandMask1 SummandMask2) (MapType1Select SummandMask1 o_2 f_4))
 :pattern ( (sumMask ResultMask SummandMask1 SummandMask2) (MapType1Select SummandMask2 o_2 f_4))
)))
(assert  (and (forall ((arg0@@28 Real) (arg1@@9 T@U) ) (! (= (type (ConditionalFrame arg0@@28 arg1@@9)) FrameTypeType)
 :qid |funType:ConditionalFrame|
 :pattern ( (ConditionalFrame arg0@@28 arg1@@9))
)) (= (type EmptyFrame) FrameTypeType)))
(assert (forall ((p@@0 Real) (f_6 T@U) ) (!  (=> (= (type f_6) FrameTypeType) (= (ConditionalFrame p@@0 f_6) (ite (> p@@0 0.0) f_6 EmptyFrame)))
 :qid |stdinbpl.161:15|
 :skolemid |19|
 :pattern ( (ConditionalFrame p@@0 f_6))
)))
(assert (forall ((Mask@@7 T@U) (o_2@@0 T@U) (f_4@@0 T@U) ) (! (let ((B@@4 (FieldTypeInv1 (type f_4@@0))))
(let ((A@@5 (FieldTypeInv0 (type f_4@@0))))
 (=> (and (and (= (type Mask@@7) (MapType1Type RefType realType)) (= (type o_2@@0) RefType)) (= (type f_4@@0) (FieldType A@@5 B@@4))) (= (HasDirectPerm Mask@@7 o_2@@0 f_4@@0) (> (U_2_real (MapType1Select Mask@@7 o_2@@0 f_4@@0)) NoPerm)))))
 :qid |stdinbpl.133:22|
 :skolemid |17|
 :pattern ( (HasDirectPerm Mask@@7 o_2@@0 f_4@@0))
)))
(assert (forall ((o_2@@1 T@U) (f_4@@1 T@U) ) (! (let ((B@@5 (FieldTypeInv1 (type f_4@@1))))
(let ((A@@6 (FieldTypeInv0 (type f_4@@1))))
 (=> (and (= (type o_2@@1) RefType) (= (type f_4@@1) (FieldType A@@6 B@@5))) (= (U_2_real (MapType1Select ZeroMask o_2@@1 f_4@@1)) NoPerm))))
 :qid |stdinbpl.106:22|
 :skolemid |13|
 :pattern ( (MapType1Select ZeroMask o_2@@1 f_4@@1))
)))
(assert (forall ((x@@8 T@U) ) (!  (=> (= (type x@@8) RefType) (or (= (typeOf x@@8) A) (= (typeOf x@@8) B)))
 :qid |stdinbpl.195:15|
 :skolemid |22|
 :pattern ( (typeOf x@@8))
)))
(assert (forall ((Heap@@10 T@U) (ExhaleHeap@@4 T@U) (Mask@@8 T@U) (pm_f@@1 T@U) ) (! (let ((C@@1 (FieldTypeInv0 (type pm_f@@1))))
 (=> (and (and (and (and (and (= (type Heap@@10) (MapType0Type RefType)) (= (type ExhaleHeap@@4) (MapType0Type RefType))) (= (type Mask@@8) (MapType1Type RefType realType))) (= (type pm_f@@1) (FieldType C@@1 FrameTypeType))) (IdenticalOnKnownLocations Heap@@10 ExhaleHeap@@4 Mask@@8)) (and (HasDirectPerm Mask@@8 null pm_f@@1) (IsPredicateField pm_f@@1))) (forall ((o2 T@U) (f_2@@0 T@U) ) (! (let ((B@@6 (FieldTypeInv1 (type f_2@@0))))
(let ((A@@7 (FieldTypeInv0 (type f_2@@0))))
 (=> (and (and (= (type o2) RefType) (= (type f_2@@0) (FieldType A@@7 B@@6))) (U_2_bool (MapType1Select (MapType0Select Heap@@10 null (PredicateMaskField pm_f@@1)) o2 f_2@@0))) (= (MapType0Select Heap@@10 o2 f_2@@0) (MapType0Select ExhaleHeap@@4 o2 f_2@@0)))))
 :qid |stdinbpl.54:134|
 :skolemid |3|
 :pattern ( (MapType0Select ExhaleHeap@@4 o2 f_2@@0))
))))
 :qid |stdinbpl.52:19|
 :skolemid |4|
 :pattern ( (IdenticalOnKnownLocations Heap@@10 ExhaleHeap@@4 Mask@@8) (IsPredicateField pm_f@@1))
)))
(assert (forall ((Heap@@11 T@U) (ExhaleHeap@@5 T@U) (Mask@@9 T@U) (pm_f@@2 T@U) ) (! (let ((C@@2 (FieldTypeInv0 (type pm_f@@2))))
 (=> (and (and (and (and (and (= (type Heap@@11) (MapType0Type RefType)) (= (type ExhaleHeap@@5) (MapType0Type RefType))) (= (type Mask@@9) (MapType1Type RefType realType))) (= (type pm_f@@2) (FieldType C@@2 FrameTypeType))) (IdenticalOnKnownLocations Heap@@11 ExhaleHeap@@5 Mask@@9)) (and (HasDirectPerm Mask@@9 null pm_f@@2) (IsWandField pm_f@@2))) (forall ((o2@@0 T@U) (f_2@@1 T@U) ) (! (let ((B@@7 (FieldTypeInv1 (type f_2@@1))))
(let ((A@@8 (FieldTypeInv0 (type f_2@@1))))
 (=> (and (and (= (type o2@@0) RefType) (= (type f_2@@1) (FieldType A@@8 B@@7))) (U_2_bool (MapType1Select (MapType0Select Heap@@11 null (WandMaskField pm_f@@2)) o2@@0 f_2@@1))) (= (MapType0Select Heap@@11 o2@@0 f_2@@1) (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1)))))
 :qid |stdinbpl.67:129|
 :skolemid |6|
 :pattern ( (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1))
))))
 :qid |stdinbpl.65:19|
 :skolemid |7|
 :pattern ( (IdenticalOnKnownLocations Heap@@11 ExhaleHeap@@5 Mask@@9) (IsWandField pm_f@@2))
)))
(assert (forall ((this@@7 T@U) ) (!  (=> (= (type this@@7) RefType) (= (getPredWandId (node this@@7)) 0))
 :qid |stdinbpl.384:15|
 :skolemid |31|
 :pattern ( (node this@@7))
)))
(assert (forall ((Mask@@10 T@U) (o_2@@2 T@U) (f_4@@2 T@U) ) (! (let ((B@@8 (FieldTypeInv1 (type f_4@@2))))
(let ((A@@9 (FieldTypeInv0 (type f_4@@2))))
 (=> (and (and (and (= (type Mask@@10) (MapType1Type RefType realType)) (= (type o_2@@2) RefType)) (= (type f_4@@2) (FieldType A@@9 B@@8))) (GoodMask Mask@@10)) (and (>= (U_2_real (MapType1Select Mask@@10 o_2@@2 f_4@@2)) NoPerm) (=> (and (and (GoodMask Mask@@10) (not (IsPredicateField f_4@@2))) (not (IsWandField f_4@@2))) (<= (U_2_real (MapType1Select Mask@@10 o_2@@2 f_4@@2)) FullPerm))))))
 :qid |stdinbpl.128:22|
 :skolemid |16|
 :pattern ( (GoodMask Mask@@10) (MapType1Select Mask@@10 o_2@@2 f_4@@2))
)))
(assert (forall ((Heap@@12 T@U) (Mask@@11 T@U) (this@@8 T@U) ) (!  (=> (and (and (and (= (type Heap@@12) (MapType0Type RefType)) (= (type Mask@@11) (MapType1Type RefType realType))) (= (type this@@8) RefType)) (state Heap@@12 Mask@@11)) (= (|length'| Heap@@12 this@@8) (|length#frame| (MapType0Select Heap@@12 null (node this@@8)) this@@8)))
 :qid |stdinbpl.238:15|
 :skolemid |26|
 :pattern ( (state Heap@@12 Mask@@11) (|length'| Heap@@12 this@@8))
 :pattern ( (state Heap@@12 Mask@@11) (|length#triggerStateless| this@@8) (|node#trigger| Heap@@12 (node this@@8)))
)))
(assert (forall ((o T@U) (f T@U) (Heap@@13 T@U) ) (!  (=> (and (and (and (= (type o) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap@@13) (MapType0Type RefType))) (U_2_bool (MapType0Select Heap@@13 o $allocated))) (U_2_bool (MapType0Select Heap@@13 (MapType0Select Heap@@13 o f) $allocated)))
 :qid |stdinbpl.31:15|
 :skolemid |0|
 :pattern ( (MapType0Select Heap@@13 o f))
)))
(assert (forall ((this@@9 T@U) ) (!  (=> (= (type this@@9) RefType) (= (PredicateMaskField (node this@@9)) (|node#sm| this@@9)))
 :qid |stdinbpl.376:15|
 :skolemid |29|
 :pattern ( (PredicateMaskField (node this@@9)))
)))
(assert (forall ((Heap@@14 T@U) (o@@0 T@U) (f_3 T@U) (v T@U) ) (! (let ((B@@9 (type v)))
(let ((A@@10 (FieldTypeInv0 (type f_3))))
 (=> (and (and (= (type Heap@@14) (MapType0Type RefType)) (= (type o@@0) RefType)) (= (type f_3) (FieldType A@@10 B@@9))) (succHeap Heap@@14 (MapType0Store Heap@@14 o@@0 f_3 v)))))
 :qid |stdinbpl.78:22|
 :skolemid |9|
 :pattern ( (MapType0Store Heap@@14 o@@0 f_3 v))
)))
(assert (= (type ZeroPMask) (MapType1Type RefType boolType)))
(assert (forall ((o_2@@3 T@U) (f_4@@3 T@U) ) (! (let ((B@@10 (FieldTypeInv1 (type f_4@@3))))
(let ((A@@11 (FieldTypeInv0 (type f_4@@3))))
 (=> (and (= (type o_2@@3) RefType) (= (type f_4@@3) (FieldType A@@11 B@@10))) (not (U_2_bool (MapType1Select ZeroPMask o_2@@3 f_4@@3))))))
 :qid |stdinbpl.112:22|
 :skolemid |14|
 :pattern ( (MapType1Select ZeroPMask o_2@@3 f_4@@3))
)))
(assert (forall ((p@@1 T@U) (v_1@@0 T@U) (q T@U) (w@@0 T@U) (r T@U) (u T@U) ) (! (let ((C@@3 (FieldTypeInv0 (type r))))
(let ((B@@11 (FieldTypeInv0 (type q))))
(let ((A@@12 (FieldTypeInv0 (type p@@1))))
 (=> (and (and (and (and (and (and (= (type p@@1) (FieldType A@@12 FrameTypeType)) (= (type v_1@@0) FrameTypeType)) (= (type q) (FieldType B@@11 FrameTypeType))) (= (type w@@0) FrameTypeType)) (= (type r) (FieldType C@@3 FrameTypeType))) (= (type u) FrameTypeType)) (and (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))) (InsidePredicate p@@1 v_1@@0 r u)))))
 :qid |stdinbpl.168:25|
 :skolemid |20|
 :pattern ( (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun Mask@0 () T@U)
(declare-fun tail () T@U)
(declare-fun PostMask@0 () T@U)
(declare-fun res () T@U)
(declare-fun PostHeap@0 () T@U)
(declare-fun Mask@22 () T@U)
(declare-fun Mask@21 () T@U)
(declare-fun freshObj@0 () T@U)
(declare-fun Heap@22 () T@U)
(declare-fun Heap@@15 () T@U)
(declare-fun Heap@19 () T@U)
(declare-fun Heap@20 () T@U)
(declare-fun newPMask@1 () T@U)
(declare-fun Heap@21 () T@U)
(declare-fun Heap@18 () T@U)
(declare-fun Heap@17 () T@U)
(declare-fun Heap@14 () T@U)
(declare-fun Heap@15 () T@U)
(declare-fun Heap@16 () T@U)
(declare-fun freshVersion@1 () T@U)
(declare-fun Mask@20 () T@U)
(declare-fun CombineFrames (T@U T@U) T@U)
(declare-fun FrameFragment (T@U) T@U)
(declare-fun Mask@19 () T@U)
(declare-fun Mask@18 () T@U)
(declare-fun Mask@17 () T@U)
(declare-fun Mask@16 () T@U)
(declare-fun Mask@15 () T@U)
(declare-fun Heap@11 () T@U)
(declare-fun Heap@12 () T@U)
(declare-fun newPMask@0 () T@U)
(declare-fun Heap@13 () T@U)
(declare-fun Heap@10 () T@U)
(declare-fun Heap@9 () T@U)
(declare-fun Heap@6 () T@U)
(declare-fun Heap@7 () T@U)
(declare-fun Heap@8 () T@U)
(declare-fun freshVersion@0 () T@U)
(declare-fun Mask@14 () T@U)
(declare-fun Mask@13 () T@U)
(declare-fun Mask@12 () T@U)
(declare-fun Mask@11 () T@U)
(declare-fun Mask@10 () T@U)
(declare-fun Mask@9 () T@U)
(declare-fun Mask@6 () T@U)
(declare-fun Mask@7 () T@U)
(declare-fun Mask@8 () T@U)
(declare-fun Mask@5 () T@U)
(declare-fun Mask@4 () T@U)
(declare-fun Heap@4 () T@U)
(declare-fun Heap@5 () T@U)
(declare-fun newVersion@0 () T@U)
(declare-fun Mask@3 () T@U)
(declare-fun tmp () T@U)
(declare-fun Heap@0 () T@U)
(declare-fun Mask@1 () T@U)
(declare-fun Mask@2 () T@U)
(declare-fun Heap@1 () T@U)
(declare-fun v_2 () Int)
(declare-fun freshObj@1 () T@U)
(declare-fun Heap@2 () T@U)
(declare-fun Heap@3 () T@U)
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (= (type Mask@22) (MapType1Type RefType realType)) (= (type Mask@21) (MapType1Type RefType realType))) (= (type freshObj@0) RefType)) (= (type Heap@22) (MapType0Type RefType))) (= (type Heap@@15) (MapType0Type RefType))) (= (type tail) RefType)) (= (type Heap@19) (MapType0Type RefType))) (= (type Heap@20) (MapType0Type RefType))) (= (type newPMask@1) (MapType1Type RefType boolType))) (= (type Heap@21) (MapType0Type RefType))) (= (type Heap@18) (MapType0Type RefType))) (= (type Heap@17) (MapType0Type RefType))) (= (type Heap@15) (MapType0Type RefType))) (= (type Heap@14) (MapType0Type RefType))) (= (type Heap@16) (MapType0Type RefType))) (= (type freshVersion@1) FrameTypeType)) (= (type Mask@20) (MapType1Type RefType realType))) (forall ((arg0@@29 T@U) (arg1@@10 T@U) ) (! (= (type (CombineFrames arg0@@29 arg1@@10)) FrameTypeType)
 :qid |funType:CombineFrames|
 :pattern ( (CombineFrames arg0@@29 arg1@@10))
))) (forall ((arg0@@30 T@U) ) (! (= (type (FrameFragment arg0@@30)) FrameTypeType)
 :qid |funType:FrameFragment|
 :pattern ( (FrameFragment arg0@@30))
))) (= (type Mask@17) (MapType1Type RefType realType))) (= (type Mask@19) (MapType1Type RefType realType))) (= (type Mask@18) (MapType1Type RefType realType))) (= (type Mask@16) (MapType1Type RefType realType))) (= (type Mask@15) (MapType1Type RefType realType))) (= (type Heap@11) (MapType0Type RefType))) (= (type Heap@12) (MapType0Type RefType))) (= (type newPMask@0) (MapType1Type RefType boolType))) (= (type Heap@13) (MapType0Type RefType))) (= (type Heap@10) (MapType0Type RefType))) (= (type Heap@9) (MapType0Type RefType))) (= (type Heap@7) (MapType0Type RefType))) (= (type Heap@6) (MapType0Type RefType))) (= (type Heap@8) (MapType0Type RefType))) (= (type freshVersion@0) FrameTypeType)) (= (type Mask@14) (MapType1Type RefType realType))) (= (type Mask@11) (MapType1Type RefType realType))) (= (type Mask@13) (MapType1Type RefType realType))) (= (type Mask@12) (MapType1Type RefType realType))) (= (type Mask@10) (MapType1Type RefType realType))) (= (type Mask@9) (MapType1Type RefType realType))) (= (type Mask@7) (MapType1Type RefType realType))) (= (type Mask@6) (MapType1Type RefType realType))) (= (type Mask@8) (MapType1Type RefType realType))) (= (type Mask@5) (MapType1Type RefType realType))) (= (type Mask@4) (MapType1Type RefType realType))) (= (type Heap@5) (MapType0Type RefType))) (= (type Heap@4) (MapType0Type RefType))) (= (type newVersion@0) FrameTypeType)) (= (type Mask@3) (MapType1Type RefType realType))) (= (type tmp) RefType)) (= (type Heap@0) (MapType0Type RefType))) (= (type Mask@1) (MapType1Type RefType realType))) (= (type Mask@0) (MapType1Type RefType realType))) (= (type Mask@2) (MapType1Type RefType realType))) (= (type Heap@1) (MapType0Type RefType))) (= (type freshObj@1) RefType)) (= (type Heap@2) (MapType0Type RefType))) (= (type Heap@3) (MapType0Type RefType))) (= (type PostMask@0) (MapType1Type RefType realType))) (= (type res) RefType)) (= (type PostHeap@0) (MapType0Type RefType))))
(set-info :boogie-vc-id prepend)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 81) (let ((anon8_correct true))
(let ((anon51_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 78) 75)) anon8_correct)))
(let ((anon51_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 76) (- 0 77)) (<= FullPerm (U_2_real (MapType1Select Mask@0 null (node tail))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@0 null (node tail)))) (=> (= (ControlFlow 0 76) 75) anon8_correct))))))
(let ((anon4_correct true))
(let ((anon49_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 74) 71)) anon4_correct)))
(let ((anon49_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 72) (- 0 73)) (<= FullPerm (U_2_real (MapType1Select PostMask@0 null (node res))))) (=> (<= FullPerm (U_2_real (MapType1Select PostMask@0 null (node res)))) (=> (= (ControlFlow 0 72) 71) anon4_correct))))))
(let ((anon50_Else_correct true))
(let ((anon47_Then_correct  (=> (state PostHeap@0 ZeroMask) (=> (and (and (= PostMask@0 (MapType1Store ZeroMask null (node res) (real_2_U (+ (U_2_real (MapType1Select ZeroMask null (node res))) FullPerm)))) (state PostHeap@0 PostMask@0)) (and (state PostHeap@0 PostMask@0) (state PostHeap@0 PostMask@0))) (and (and (and (and (=> (= (ControlFlow 0 79) 70) anon50_Else_correct) (=> (= (ControlFlow 0 79) 76) anon51_Then_correct)) (=> (= (ControlFlow 0 79) 78) anon51_Else_correct)) (=> (= (ControlFlow 0 79) 72) anon49_Then_correct)) (=> (= (ControlFlow 0 79) 74) anon49_Else_correct))))))
(let ((anon46_correct  (=> (and (= Mask@22 (MapType1Store Mask@21 null (node freshObj@0) (real_2_U (- (U_2_real (MapType1Select Mask@21 null (node freshObj@0))) FullPerm)))) (= (ControlFlow 0 2) (- 0 1))) (= (length Heap@22 freshObj@0) (+ (length Heap@@15 tail) 1)))))
(let ((anon69_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 5) 2)) anon46_correct)))
(let ((anon69_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 3) (- 0 4)) (<= FullPerm (U_2_real (MapType1Select Mask@21 null (node freshObj@0))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@21 null (node freshObj@0)))) (=> (= (ControlFlow 0 3) 2) anon46_correct))))))
(let ((anon44_correct  (=> (and (state Heap@22 Mask@21) (state Heap@22 Mask@21)) (and (=> (= (ControlFlow 0 6) 3) anon69_Then_correct) (=> (= (ControlFlow 0 6) 5) anon69_Else_correct)))))
(let ((anon68_Else_correct  (=> (not (= (typeOf (MapType0Select Heap@19 freshObj@0 next)) A)) (=> (and (= Heap@22 Heap@19) (= (ControlFlow 0 8) 6)) anon44_correct))))
(let ((anon68_Then_correct  (=> (and (= (typeOf (MapType0Select Heap@19 freshObj@0 next)) A) (= Heap@20 (MapType0Store Heap@19 null (|node#sm| freshObj@0) (MapType1Store (MapType0Select Heap@19 null (|node#sm| freshObj@0)) (MapType0Select Heap@19 freshObj@0 next) a_2 (bool_2_U true))))) (=> (and (and (forall ((o_5 T@U) (f_9 T@U) ) (! (let ((B@@12 (FieldTypeInv1 (type f_9))))
(let ((A@@13 (FieldTypeInv0 (type f_9))))
 (=> (and (and (= (type o_5) RefType) (= (type f_9) (FieldType A@@13 B@@12))) (or (U_2_bool (MapType1Select (MapType0Select Heap@20 null (|node#sm| freshObj@0)) o_5 f_9)) (U_2_bool (MapType1Select (MapType0Select Heap@20 null (|node#sm| (MapType0Select Heap@20 (MapType0Select Heap@20 freshObj@0 next) a_2))) o_5 f_9)))) (U_2_bool (MapType1Select newPMask@1 o_5 f_9)))))
 :qid |stdinbpl.726:29|
 :skolemid |36|
 :pattern ( (MapType1Select newPMask@1 o_5 f_9))
)) (= Heap@21 (MapType0Store Heap@20 null (|node#sm| freshObj@0) newPMask@1))) (and (= Heap@22 Heap@21) (= (ControlFlow 0 7) 6))) anon44_correct))))
(let ((anon42_correct  (=> (and (= Heap@18 (MapType0Store Heap@17 null (|node#sm| freshObj@0) (MapType1Store (MapType0Select Heap@17 null (|node#sm| freshObj@0)) freshObj@0 val (bool_2_U true)))) (= Heap@19 (MapType0Store Heap@18 null (|node#sm| freshObj@0) (MapType1Store (MapType0Select Heap@18 null (|node#sm| freshObj@0)) freshObj@0 next (bool_2_U true))))) (and (=> (= (ControlFlow 0 9) 7) anon68_Then_correct) (=> (= (ControlFlow 0 9) 8) anon68_Else_correct)))))
(let ((anon67_Else_correct  (=> (HasDirectPerm Mask@21 null (node freshObj@0)) (=> (and (= Heap@17 Heap@14) (= (ControlFlow 0 11) 9)) anon42_correct))))
(let ((anon67_Then_correct  (=> (not (HasDirectPerm Mask@21 null (node freshObj@0))) (=> (and (and (= Heap@15 (MapType0Store Heap@14 null (|node#sm| freshObj@0) ZeroPMask)) (= Heap@16 (MapType0Store Heap@15 null (node freshObj@0) freshVersion@1))) (and (= Heap@17 Heap@16) (= (ControlFlow 0 10) 9))) anon42_correct))))
(let ((anon40_correct  (=> (= Mask@21 (MapType1Store Mask@20 null (node freshObj@0) (real_2_U (+ (U_2_real (MapType1Select Mask@20 null (node freshObj@0))) FullPerm)))) (=> (and (and (state Heap@14 Mask@21) (state Heap@14 Mask@21)) (and (|node#trigger| Heap@14 (node freshObj@0)) (= (MapType0Select Heap@14 null (node freshObj@0)) (CombineFrames (FrameFragment (MapType0Select Heap@14 freshObj@0 val)) (CombineFrames (FrameFragment (MapType0Select Heap@14 freshObj@0 next)) (FrameFragment (ite (= (typeOf (MapType0Select Heap@14 freshObj@0 next)) A) (CombineFrames (FrameFragment (MapType0Select Heap@14 (MapType0Select Heap@14 freshObj@0 next) a_2)) (MapType0Select Heap@14 null (node (MapType0Select Heap@14 (MapType0Select Heap@14 freshObj@0 next) a_2)))) EmptyFrame))))))) (and (=> (= (ControlFlow 0 12) 10) anon67_Then_correct) (=> (= (ControlFlow 0 12) 11) anon67_Else_correct))))))
(let ((anon39_correct  (=> (and (and (= Mask@19 (MapType1Store Mask@18 null (node (MapType0Select Heap@14 (MapType0Select Heap@14 freshObj@0 next) a_2)) (real_2_U (- (U_2_real (MapType1Select Mask@18 null (node (MapType0Select Heap@14 (MapType0Select Heap@14 freshObj@0 next) a_2)))) FullPerm)))) (InsidePredicate (node freshObj@0) (MapType0Select Heap@14 null (node freshObj@0)) (node (MapType0Select Heap@14 (MapType0Select Heap@14 freshObj@0 next) a_2)) (MapType0Select Heap@14 null (node (MapType0Select Heap@14 (MapType0Select Heap@14 freshObj@0 next) a_2))))) (and (= Mask@20 Mask@19) (= (ControlFlow 0 14) 12))) anon40_correct)))
(let ((anon66_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 17) 14)) anon39_correct)))
(let ((anon66_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 15) (- 0 16)) (<= FullPerm (U_2_real (MapType1Select Mask@18 null (node (MapType0Select Heap@14 (MapType0Select Heap@14 freshObj@0 next) a_2)))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@18 null (node (MapType0Select Heap@14 (MapType0Select Heap@14 freshObj@0 next) a_2))))) (=> (= (ControlFlow 0 15) 14) anon39_correct))))))
(let ((anon37_correct  (=> (= Mask@18 (MapType1Store Mask@17 (MapType0Select Heap@14 freshObj@0 next) a_2 (real_2_U (- (U_2_real (MapType1Select Mask@17 (MapType0Select Heap@14 freshObj@0 next) a_2)) FullPerm)))) (and (=> (= (ControlFlow 0 18) 15) anon66_Then_correct) (=> (= (ControlFlow 0 18) 17) anon66_Else_correct)))))
(let ((anon65_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 21) 18)) anon37_correct)))
(let ((anon65_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 19) (- 0 20)) (<= FullPerm (U_2_real (MapType1Select Mask@17 (MapType0Select Heap@14 freshObj@0 next) a_2)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@17 (MapType0Select Heap@14 freshObj@0 next) a_2))) (=> (= (ControlFlow 0 19) 18) anon37_correct))))))
(let ((anon64_Then_correct  (=> (= (typeOf (MapType0Select Heap@14 freshObj@0 next)) A) (and (=> (= (ControlFlow 0 22) 19) anon65_Then_correct) (=> (= (ControlFlow 0 22) 21) anon65_Else_correct)))))
(let ((anon64_Else_correct  (=> (not (= (typeOf (MapType0Select Heap@14 freshObj@0 next)) A)) (=> (and (= Mask@20 Mask@17) (= (ControlFlow 0 13) 12)) anon40_correct))))
(let ((anon34_correct  (=> (= Mask@17 (MapType1Store Mask@16 freshObj@0 next (real_2_U (- (U_2_real (MapType1Select Mask@16 freshObj@0 next)) FullPerm)))) (and (=> (= (ControlFlow 0 23) 22) anon64_Then_correct) (=> (= (ControlFlow 0 23) 13) anon64_Else_correct)))))
(let ((anon63_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 26) 23)) anon34_correct)))
(let ((anon63_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 24) (- 0 25)) (<= FullPerm (U_2_real (MapType1Select Mask@16 freshObj@0 next)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@16 freshObj@0 next))) (=> (= (ControlFlow 0 24) 23) anon34_correct))))))
(let ((anon32_correct  (=> (= Mask@16 (MapType1Store Mask@15 freshObj@0 val (real_2_U (- (U_2_real (MapType1Select Mask@15 freshObj@0 val)) FullPerm)))) (and (=> (= (ControlFlow 0 27) 24) anon63_Then_correct) (=> (= (ControlFlow 0 27) 26) anon63_Else_correct)))))
(let ((anon62_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 30) 27)) anon32_correct)))
(let ((anon62_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 28) (- 0 29)) (<= FullPerm (U_2_real (MapType1Select Mask@15 freshObj@0 val)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@15 freshObj@0 val))) (=> (= (ControlFlow 0 28) 27) anon32_correct))))))
(let ((anon30_correct  (=> (and (state Heap@14 Mask@15) (state Heap@14 Mask@15)) (and (=> (= (ControlFlow 0 31) 28) anon62_Then_correct) (=> (= (ControlFlow 0 31) 30) anon62_Else_correct)))))
(let ((anon61_Else_correct  (=> (not (= (typeOf (MapType0Select Heap@11 tail next)) A)) (=> (and (= Heap@14 Heap@11) (= (ControlFlow 0 33) 31)) anon30_correct))))
(let ((anon61_Then_correct  (=> (and (= (typeOf (MapType0Select Heap@11 tail next)) A) (= Heap@12 (MapType0Store Heap@11 null (|node#sm| tail) (MapType1Store (MapType0Select Heap@11 null (|node#sm| tail)) (MapType0Select Heap@11 tail next) a_2 (bool_2_U true))))) (=> (and (and (forall ((o_4 T@U) (f_8 T@U) ) (! (let ((B@@13 (FieldTypeInv1 (type f_8))))
(let ((A@@14 (FieldTypeInv0 (type f_8))))
 (=> (and (and (= (type o_4) RefType) (= (type f_8) (FieldType A@@14 B@@13))) (or (U_2_bool (MapType1Select (MapType0Select Heap@12 null (|node#sm| tail)) o_4 f_8)) (U_2_bool (MapType1Select (MapType0Select Heap@12 null (|node#sm| (MapType0Select Heap@12 (MapType0Select Heap@12 tail next) a_2))) o_4 f_8)))) (U_2_bool (MapType1Select newPMask@0 o_4 f_8)))))
 :qid |stdinbpl.669:29|
 :skolemid |35|
 :pattern ( (MapType1Select newPMask@0 o_4 f_8))
)) (= Heap@13 (MapType0Store Heap@12 null (|node#sm| tail) newPMask@0))) (and (= Heap@14 Heap@13) (= (ControlFlow 0 32) 31))) anon30_correct))))
(let ((anon28_correct  (=> (and (= Heap@10 (MapType0Store Heap@9 null (|node#sm| tail) (MapType1Store (MapType0Select Heap@9 null (|node#sm| tail)) tail val (bool_2_U true)))) (= Heap@11 (MapType0Store Heap@10 null (|node#sm| tail) (MapType1Store (MapType0Select Heap@10 null (|node#sm| tail)) tail next (bool_2_U true))))) (and (=> (= (ControlFlow 0 34) 32) anon61_Then_correct) (=> (= (ControlFlow 0 34) 33) anon61_Else_correct)))))
(let ((anon60_Else_correct  (=> (HasDirectPerm Mask@15 null (node tail)) (=> (and (= Heap@9 Heap@6) (= (ControlFlow 0 36) 34)) anon28_correct))))
(let ((anon60_Then_correct  (=> (not (HasDirectPerm Mask@15 null (node tail))) (=> (and (and (= Heap@7 (MapType0Store Heap@6 null (|node#sm| tail) ZeroPMask)) (= Heap@8 (MapType0Store Heap@7 null (node tail) freshVersion@0))) (and (= Heap@9 Heap@8) (= (ControlFlow 0 35) 34))) anon28_correct))))
(let ((anon26_correct  (=> (= Mask@15 (MapType1Store Mask@14 null (node tail) (real_2_U (+ (U_2_real (MapType1Select Mask@14 null (node tail))) FullPerm)))) (=> (and (and (state Heap@6 Mask@15) (state Heap@6 Mask@15)) (and (|node#trigger| Heap@6 (node tail)) (= (MapType0Select Heap@6 null (node tail)) (CombineFrames (FrameFragment (MapType0Select Heap@6 tail val)) (CombineFrames (FrameFragment (MapType0Select Heap@6 tail next)) (FrameFragment (ite (= (typeOf (MapType0Select Heap@6 tail next)) A) (CombineFrames (FrameFragment (MapType0Select Heap@6 (MapType0Select Heap@6 tail next) a_2)) (MapType0Select Heap@6 null (node (MapType0Select Heap@6 (MapType0Select Heap@6 tail next) a_2)))) EmptyFrame))))))) (and (=> (= (ControlFlow 0 37) 35) anon60_Then_correct) (=> (= (ControlFlow 0 37) 36) anon60_Else_correct))))))
(let ((anon25_correct  (=> (and (and (= Mask@13 (MapType1Store Mask@12 null (node (MapType0Select Heap@6 (MapType0Select Heap@6 tail next) a_2)) (real_2_U (- (U_2_real (MapType1Select Mask@12 null (node (MapType0Select Heap@6 (MapType0Select Heap@6 tail next) a_2)))) FullPerm)))) (InsidePredicate (node tail) (MapType0Select Heap@6 null (node tail)) (node (MapType0Select Heap@6 (MapType0Select Heap@6 tail next) a_2)) (MapType0Select Heap@6 null (node (MapType0Select Heap@6 (MapType0Select Heap@6 tail next) a_2))))) (and (= Mask@14 Mask@13) (= (ControlFlow 0 39) 37))) anon26_correct)))
(let ((anon59_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 42) 39)) anon25_correct)))
(let ((anon59_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 40) (- 0 41)) (<= FullPerm (U_2_real (MapType1Select Mask@12 null (node (MapType0Select Heap@6 (MapType0Select Heap@6 tail next) a_2)))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@12 null (node (MapType0Select Heap@6 (MapType0Select Heap@6 tail next) a_2))))) (=> (= (ControlFlow 0 40) 39) anon25_correct))))))
(let ((anon23_correct  (=> (= Mask@12 (MapType1Store Mask@11 (MapType0Select Heap@6 tail next) a_2 (real_2_U (- (U_2_real (MapType1Select Mask@11 (MapType0Select Heap@6 tail next) a_2)) FullPerm)))) (and (=> (= (ControlFlow 0 43) 40) anon59_Then_correct) (=> (= (ControlFlow 0 43) 42) anon59_Else_correct)))))
(let ((anon58_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 46) 43)) anon23_correct)))
(let ((anon58_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 44) (- 0 45)) (<= FullPerm (U_2_real (MapType1Select Mask@11 (MapType0Select Heap@6 tail next) a_2)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@11 (MapType0Select Heap@6 tail next) a_2))) (=> (= (ControlFlow 0 44) 43) anon23_correct))))))
(let ((anon57_Then_correct  (=> (= (typeOf (MapType0Select Heap@6 tail next)) A) (and (=> (= (ControlFlow 0 47) 44) anon58_Then_correct) (=> (= (ControlFlow 0 47) 46) anon58_Else_correct)))))
(let ((anon57_Else_correct  (=> (not (= (typeOf (MapType0Select Heap@6 tail next)) A)) (=> (and (= Mask@14 Mask@11) (= (ControlFlow 0 38) 37)) anon26_correct))))
(let ((anon20_correct  (=> (= Mask@11 (MapType1Store Mask@10 tail next (real_2_U (- (U_2_real (MapType1Select Mask@10 tail next)) FullPerm)))) (and (=> (= (ControlFlow 0 48) 47) anon57_Then_correct) (=> (= (ControlFlow 0 48) 38) anon57_Else_correct)))))
(let ((anon56_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 51) 48)) anon20_correct)))
(let ((anon56_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 49) (- 0 50)) (<= FullPerm (U_2_real (MapType1Select Mask@10 tail next)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@10 tail next))) (=> (= (ControlFlow 0 49) 48) anon20_correct))))))
(let ((anon18_correct  (=> (= Mask@10 (MapType1Store Mask@9 tail val (real_2_U (- (U_2_real (MapType1Select Mask@9 tail val)) FullPerm)))) (and (=> (= (ControlFlow 0 52) 49) anon56_Then_correct) (=> (= (ControlFlow 0 52) 51) anon56_Else_correct)))))
(let ((anon55_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 55) 52)) anon18_correct)))
(let ((anon55_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 53) (- 0 54)) (<= FullPerm (U_2_real (MapType1Select Mask@9 tail val)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@9 tail val))) (=> (= (ControlFlow 0 53) 52) anon18_correct))))))
(let ((anon16_correct  (=> (and (state Heap@6 Mask@9) (state Heap@6 Mask@9)) (and (=> (= (ControlFlow 0 56) 53) anon55_Then_correct) (=> (= (ControlFlow 0 56) 55) anon55_Else_correct)))))
(let ((anon54_Else_correct  (=> (not (= (typeOf (MapType0Select Heap@6 tail next)) A)) (=> (and (= Mask@9 Mask@6) (= (ControlFlow 0 58) 56)) anon16_correct))))
(let ((anon54_Then_correct  (=> (= (typeOf (MapType0Select Heap@6 tail next)) A) (=> (and (and (and (not (= (MapType0Select Heap@6 tail next) null)) (= Mask@7 (MapType1Store Mask@6 (MapType0Select Heap@6 tail next) a_2 (real_2_U (+ (U_2_real (MapType1Select Mask@6 (MapType0Select Heap@6 tail next) a_2)) FullPerm))))) (and (state Heap@6 Mask@7) (= Mask@8 (MapType1Store Mask@7 null (node (MapType0Select Heap@6 (MapType0Select Heap@6 tail next) a_2)) (real_2_U (+ (U_2_real (MapType1Select Mask@7 null (node (MapType0Select Heap@6 (MapType0Select Heap@6 tail next) a_2)))) FullPerm)))))) (and (and (InsidePredicate (node tail) (MapType0Select Heap@6 null (node tail)) (node (MapType0Select Heap@6 (MapType0Select Heap@6 tail next) a_2)) (MapType0Select Heap@6 null (node (MapType0Select Heap@6 (MapType0Select Heap@6 tail next) a_2)))) (state Heap@6 Mask@8)) (and (= Mask@9 Mask@8) (= (ControlFlow 0 57) 56)))) anon16_correct))))
(let ((anon14_correct  (=> (and (not (= tail null)) (= Mask@5 (MapType1Store Mask@4 tail val (real_2_U (+ (U_2_real (MapType1Select Mask@4 tail val)) FullPerm))))) (=> (and (and (state Heap@6 Mask@5) (not (= tail null))) (and (= Mask@6 (MapType1Store Mask@5 tail next (real_2_U (+ (U_2_real (MapType1Select Mask@5 tail next)) FullPerm)))) (state Heap@6 Mask@6))) (and (=> (= (ControlFlow 0 59) 57) anon54_Then_correct) (=> (= (ControlFlow 0 59) 58) anon54_Else_correct))))))
(let ((anon53_Else_correct  (=> (HasDirectPerm Mask@4 null (node tail)) (=> (and (= Heap@6 Heap@4) (= (ControlFlow 0 61) 59)) anon14_correct))))
(let ((anon53_Then_correct  (=> (and (and (not (HasDirectPerm Mask@4 null (node tail))) (= Heap@5 (MapType0Store Heap@4 null (node tail) newVersion@0))) (and (= Heap@6 Heap@5) (= (ControlFlow 0 60) 59))) anon14_correct)))
(let ((anon12_correct  (=> (= Mask@4 (MapType1Store Mask@3 null (node tail) (real_2_U (- (U_2_real (MapType1Select Mask@3 null (node tail))) FullPerm)))) (and (=> (= (ControlFlow 0 62) 60) anon53_Then_correct) (=> (= (ControlFlow 0 62) 61) anon53_Else_correct)))))
(let ((anon52_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 65) 62)) anon12_correct)))
(let ((anon52_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 63) (- 0 64)) (<= FullPerm (U_2_real (MapType1Select Mask@3 null (node tail))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@3 null (node tail)))) (=> (= (ControlFlow 0 63) 62) anon12_correct))))))
(let ((anon47_Else_correct  (=> (U_2_bool (MapType0Select Heap@@15 tmp $allocated)) (=> (and (not (= freshObj@0 null)) (not (U_2_bool (MapType0Select Heap@@15 freshObj@0 $allocated)))) (=> (and (and (= Heap@0 (MapType0Store Heap@@15 freshObj@0 $allocated (bool_2_U true))) (= Mask@1 (MapType1Store Mask@0 freshObj@0 val (real_2_U (+ (U_2_real (MapType1Select Mask@0 freshObj@0 val)) FullPerm))))) (and (= Mask@2 (MapType1Store Mask@1 freshObj@0 next (real_2_U (+ (U_2_real (MapType1Select Mask@1 freshObj@0 next)) FullPerm)))) (state Heap@0 Mask@2))) (and (=> (= (ControlFlow 0 66) (- 0 69)) (= FullPerm (U_2_real (MapType1Select Mask@2 freshObj@0 val)))) (=> (= FullPerm (U_2_real (MapType1Select Mask@2 freshObj@0 val))) (=> (and (= Heap@1 (MapType0Store Heap@0 freshObj@0 val (int_2_U v_2))) (state Heap@1 Mask@2)) (=> (and (and (and (not (= freshObj@1 null)) (not (U_2_bool (MapType0Select Heap@1 freshObj@1 $allocated)))) (= Heap@2 (MapType0Store Heap@1 freshObj@1 $allocated (bool_2_U true)))) (and (= Mask@3 (MapType1Store Mask@2 freshObj@1 a_2 (real_2_U (+ (U_2_real (MapType1Select Mask@2 freshObj@1 a_2)) FullPerm)))) (state Heap@2 Mask@3))) (and (=> (= (ControlFlow 0 66) (- 0 68)) (= FullPerm (U_2_real (MapType1Select Mask@3 freshObj@1 a_2)))) (=> (= FullPerm (U_2_real (MapType1Select Mask@3 freshObj@1 a_2))) (=> (= Heap@3 (MapType0Store Heap@2 freshObj@1 a_2 tail)) (=> (and (and (state Heap@3 Mask@3) (= (typeOf freshObj@1) A)) (and (state Heap@3 Mask@3) (state Heap@3 Mask@3))) (and (=> (= (ControlFlow 0 66) (- 0 67)) (= FullPerm (U_2_real (MapType1Select Mask@3 freshObj@0 next)))) (=> (= FullPerm (U_2_real (MapType1Select Mask@3 freshObj@0 next))) (=> (and (and (= Heap@4 (MapType0Store Heap@3 freshObj@0 next freshObj@1)) (state Heap@4 Mask@3)) (and (|node#trigger| Heap@4 (node tail)) (= (MapType0Select Heap@4 null (node tail)) (CombineFrames (FrameFragment (MapType0Select Heap@4 tail val)) (CombineFrames (FrameFragment (MapType0Select Heap@4 tail next)) (FrameFragment (ite (= (typeOf (MapType0Select Heap@4 tail next)) A) (CombineFrames (FrameFragment (MapType0Select Heap@4 (MapType0Select Heap@4 tail next) a_2)) (MapType0Select Heap@4 null (node (MapType0Select Heap@4 (MapType0Select Heap@4 tail next) a_2)))) EmptyFrame))))))) (and (=> (= (ControlFlow 0 66) 63) anon52_Then_correct) (=> (= (ControlFlow 0 66) 65) anon52_Else_correct))))))))))))))))))
(let ((anon0_correct  (=> (and (state Heap@@15 ZeroMask) (= AssumeFunctionsAbove (- 0 1))) (=> (and (and (U_2_bool (MapType0Select Heap@@15 tail $allocated)) (= Mask@0 (MapType1Store ZeroMask null (node tail) (real_2_U (+ (U_2_real (MapType1Select ZeroMask null (node tail))) FullPerm))))) (and (state Heap@@15 Mask@0) (state Heap@@15 Mask@0))) (and (=> (= (ControlFlow 0 80) 79) anon47_Then_correct) (=> (= (ControlFlow 0 80) 66) anon47_Else_correct))))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 81) 80) anon0_correct)))
PreconditionGeneratedEntry_correct))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
))
(check-sat)
(pop 1)
; Valid
(get-info :rlimit)
