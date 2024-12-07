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
(declare-fun fn$$List__Node () T@U)
(declare-fun fn$$List__Nil () T@U)
(declare-fun List__variant () T@U)
(declare-fun List__Node__0 () T@U)
(declare-fun List__Node__1 () T@U)
(declare-fun FieldType (T@T T@T) T@T)
(declare-fun FieldTypeInv0 (T@T) T@T)
(declare-fun FieldTypeInv1 (T@T) T@T)
(declare-fun NormalFieldType () T@T)
(declare-fun ListDomainTypeType () T@T)
(declare-fun RefType () T@T)
(declare-fun state (T@U T@U) Bool)
(declare-fun |silver_length'| (T@U T@U) Int)
(declare-fun MapType0Type (T@T) T@T)
(declare-fun MapType1Type (T@T T@T) T@T)
(declare-fun AssumeFunctionsAbove () Int)
(declare-fun |silver_length#trigger| (T@U T@U) Bool)
(declare-fun MapType0Select (T@U T@U T@U) T@U)
(declare-fun null () T@U)
(declare-fun valid__List (T@U) T@U)
(declare-fun MapType0TypeInv0 (T@T) T@T)
(declare-fun MapType0Store (T@U T@U T@U T@U) T@U)
(declare-fun MapType1TypeInv0 (T@T) T@T)
(declare-fun MapType1TypeInv1 (T@T) T@T)
(declare-fun MapType1Select (T@U T@U T@U) T@U)
(declare-fun MapType1Store (T@U T@U T@U T@U) T@U)
(declare-fun PredicateType_valid__ListType () T@T)
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
(declare-fun |silver_length#triggerStateless| (T@U) Int)
(declare-fun |valid__List#trigger| (T@U T@U) Bool)
(declare-fun |valid__List#everUsed| (T@U) Bool)
(declare-fun IdenticalOnKnownLocationsLiberal (T@U T@U T@U) Bool)
(declare-fun silver_length (T@U T@U) Int)
(declare-fun variantOfList (T@U) T@U)
(declare-fun |valid__List#sm| (T@U) T@U)
(declare-fun dummyHeap () T@U)
(declare-fun ZeroMask () T@U)
(declare-fun InsidePredicate (T@U T@U T@U T@U) Bool)
(declare-fun sumMask (T@U T@U T@U) Bool)
(declare-fun ConditionalFrame (Real T@U) T@U)
(declare-fun EmptyFrame () T@U)
(declare-fun NoPerm () Real)
(declare-fun SumHeap (T@U T@U T@U T@U T@U) Bool)
(declare-fun getPredWandId (T@U) Int)
(declare-fun FullPerm () Real)
(declare-fun |silver_length#frame| (T@U T@U) Int)
(declare-fun isList (T@U) Bool)
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
))) (= (Ctor NormalFieldType) 7)) (= (type $allocated) (FieldType NormalFieldType boolType))) (= (Ctor ListDomainTypeType) 8)) (= (type fn$$List__Node) ListDomainTypeType)) (= (type fn$$List__Nil) ListDomainTypeType)) (= (Ctor RefType) 9)) (= (type List__variant) (FieldType NormalFieldType RefType))) (= (type List__Node__0) (FieldType NormalFieldType intType))) (= (type List__Node__1) (FieldType NormalFieldType RefType))))
(assert (distinct $allocated fn$$List__Node fn$$List__Nil List__variant List__Node__0 List__Node__1)
)
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (forall ((arg0@@14 T@T) ) (! (= (Ctor (MapType0Type arg0@@14)) 10)
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
)))) (= (type null) RefType)) (= (Ctor PredicateType_valid__ListType) 12)) (= (Ctor FrameTypeType) 13)) (forall ((arg0@@23 T@U) ) (! (= (type (valid__List arg0@@23)) (FieldType PredicateType_valid__ListType FrameTypeType))
 :qid |funType:valid__List|
 :pattern ( (valid__List arg0@@23))
))))
(assert (forall ((Heap T@U) (Mask T@U) (this T@U) ) (!  (=> (and (and (and (= (type Heap) (MapType0Type RefType)) (= (type Mask) (MapType1Type RefType realType))) (= (type this) RefType)) (and (state Heap Mask) (or (< AssumeFunctionsAbove 0) (|silver_length#trigger| (MapType0Select Heap null (valid__List this)) this)))) (>= (|silver_length'| Heap this) 0))
 :qid |stdinbpl.310:15|
 :skolemid |40|
 :pattern ( (state Heap Mask) (|silver_length'| Heap this))
)))
(assert (forall ((Heap0 T@U) (Heap1 T@U) ) (!  (=> (and (and (= (type Heap0) (MapType0Type RefType)) (= (type Heap1) (MapType0Type RefType))) (succHeap Heap0 Heap1)) (succHeapTrans Heap0 Heap1))
 :qid |stdinbpl.95:15|
 :skolemid |12|
 :pattern ( (succHeap Heap0 Heap1))
)))
(assert (forall ((Heap@@0 T@U) (Mask@@0 T@U) ) (!  (=> (and (and (= (type Heap@@0) (MapType0Type RefType)) (= (type Mask@@0) (MapType1Type RefType realType))) (state Heap@@0 Mask@@0)) (GoodMask Mask@@0))
 :qid |stdinbpl.181:15|
 :skolemid |27|
 :pattern ( (state Heap@@0 Mask@@0))
)))
(assert (forall ((Heap0@@0 T@U) (Heap1@@0 T@U) (Heap2 T@U) ) (!  (=> (and (and (and (= (type Heap0@@0) (MapType0Type RefType)) (= (type Heap1@@0) (MapType0Type RefType))) (= (type Heap2) (MapType0Type RefType))) (and (succHeapTrans Heap0@@0 Heap1@@0) (succHeap Heap1@@0 Heap2))) (succHeapTrans Heap0@@0 Heap2))
 :qid |stdinbpl.100:15|
 :skolemid |13|
 :pattern ( (succHeapTrans Heap0@@0 Heap1@@0) (succHeap Heap1@@0 Heap2))
)))
(assert (forall ((arg0@@24 T@U) ) (! (let ((A (FieldTypeInv0 (type arg0@@24))))
(= (type (PredicateMaskField arg0@@24)) (FieldType A (MapType1Type RefType boolType))))
 :qid |funType:PredicateMaskField|
 :pattern ( (PredicateMaskField arg0@@24))
)))
(assert (forall ((Heap@@1 T@U) (ExhaleHeap T@U) (Mask@@1 T@U) (pm_f T@U) ) (! (let ((C (FieldTypeInv0 (type pm_f))))
 (=> (and (and (and (and (and (= (type Heap@@1) (MapType0Type RefType)) (= (type ExhaleHeap) (MapType0Type RefType))) (= (type Mask@@1) (MapType1Type RefType realType))) (= (type pm_f) (FieldType C FrameTypeType))) (IdenticalOnKnownLocations Heap@@1 ExhaleHeap Mask@@1)) (and (HasDirectPerm Mask@@1 null pm_f) (IsPredicateField pm_f))) (= (MapType0Select Heap@@1 null (PredicateMaskField pm_f)) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))))
 :qid |stdinbpl.49:19|
 :skolemid |2|
 :pattern ( (IdenticalOnKnownLocations Heap@@1 ExhaleHeap Mask@@1) (IsPredicateField pm_f) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))
)))
(assert (forall ((arg0@@25 T@U) ) (! (let ((A@@0 (FieldTypeInv0 (type arg0@@25))))
(= (type (WandMaskField arg0@@25)) (FieldType A@@0 (MapType1Type RefType boolType))))
 :qid |funType:WandMaskField|
 :pattern ( (WandMaskField arg0@@25))
)))
(assert (forall ((Heap@@2 T@U) (ExhaleHeap@@0 T@U) (Mask@@2 T@U) (pm_f@@0 T@U) ) (! (let ((C@@0 (FieldTypeInv0 (type pm_f@@0))))
 (=> (and (and (and (and (and (= (type Heap@@2) (MapType0Type RefType)) (= (type ExhaleHeap@@0) (MapType0Type RefType))) (= (type Mask@@2) (MapType1Type RefType realType))) (= (type pm_f@@0) (FieldType C@@0 FrameTypeType))) (IdenticalOnKnownLocations Heap@@2 ExhaleHeap@@0 Mask@@2)) (and (HasDirectPerm Mask@@2 null pm_f@@0) (IsWandField pm_f@@0))) (= (MapType0Select Heap@@2 null (WandMaskField pm_f@@0)) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))))
 :qid |stdinbpl.62:19|
 :skolemid |5|
 :pattern ( (IdenticalOnKnownLocations Heap@@2 ExhaleHeap@@0 Mask@@2) (IsWandField pm_f@@0) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))
)))
(assert (forall ((this@@0 T@U) ) (!  (=> (= (type this@@0) RefType) (IsPredicateField (valid__List this@@0)))
 :qid |stdinbpl.465:15|
 :skolemid |43|
 :pattern ( (valid__List this@@0))
)))
(assert (forall ((Heap@@3 T@U) (this@@1 T@U) ) (!  (=> (and (= (type Heap@@3) (MapType0Type RefType)) (= (type this@@1) RefType)) (dummyFunction (int_2_U (|silver_length#triggerStateless| this@@1))))
 :qid |stdinbpl.291:15|
 :skolemid |37|
 :pattern ( (|silver_length'| Heap@@3 this@@1))
)))
(assert (forall ((Heap@@4 T@U) (this@@2 T@U) ) (!  (=> (and (= (type Heap@@4) (MapType0Type RefType)) (= (type this@@2) RefType)) (|valid__List#everUsed| (valid__List this@@2)))
 :qid |stdinbpl.484:15|
 :skolemid |47|
 :pattern ( (|valid__List#trigger| Heap@@4 (valid__List this@@2)))
)))
(assert (forall ((Heap@@5 T@U) (ExhaleHeap@@1 T@U) (Mask@@3 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@5) (MapType0Type RefType)) (= (type ExhaleHeap@@1) (MapType0Type RefType))) (= (type Mask@@3) (MapType1Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@5 ExhaleHeap@@1 Mask@@3)) (U_2_bool (MapType0Select Heap@@5 o_1 $allocated))) (U_2_bool (MapType0Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.75:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@5 ExhaleHeap@@1 Mask@@3) (MapType0Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert (forall ((Heap@@6 T@U) (ExhaleHeap@@2 T@U) (Mask@@4 T@U) (o_2 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@6) (MapType0Type RefType)) (= (type ExhaleHeap@@2) (MapType0Type RefType))) (= (type Mask@@4) (MapType1Type RefType realType))) (= (type o_2) RefType)) (IdenticalOnKnownLocationsLiberal Heap@@6 ExhaleHeap@@2 Mask@@4)) (U_2_bool (MapType0Select Heap@@6 o_2 $allocated))) (U_2_bool (MapType0Select ExhaleHeap@@2 o_2 $allocated)))
 :qid |stdinbpl.142:15|
 :skolemid |23|
 :pattern ( (IdenticalOnKnownLocationsLiberal Heap@@6 ExhaleHeap@@2 Mask@@4) (MapType0Select ExhaleHeap@@2 o_2 $allocated))
)))
(assert (forall ((Heap@@7 T@U) (this@@3 T@U) ) (!  (=> (and (= (type Heap@@7) (MapType0Type RefType)) (= (type this@@3) RefType)) (and (= (silver_length Heap@@7 this@@3) (|silver_length'| Heap@@7 this@@3)) (dummyFunction (int_2_U (|silver_length#triggerStateless| this@@3)))))
 :qid |stdinbpl.287:15|
 :skolemid |36|
 :pattern ( (silver_length Heap@@7 this@@3))
)))
(assert (forall ((arg0@@26 T@U) ) (! (= (type (variantOfList arg0@@26)) ListDomainTypeType)
 :qid |funType:variantOfList|
 :pattern ( (variantOfList arg0@@26))
)))
(assert (forall ((Heap@@8 T@U) (Mask@@5 T@U) (this@@4 T@U) ) (!  (=> (and (and (and (= (type Heap@@8) (MapType0Type RefType)) (= (type Mask@@5) (MapType1Type RefType realType))) (= (type this@@4) RefType)) (and (state Heap@@8 Mask@@5) (< AssumeFunctionsAbove 0))) (= (silver_length Heap@@8 this@@4) (ite (= (variantOfList (MapType0Select Heap@@8 this@@4 List__variant)) fn$$List__Nil) 0 (+ 1 (|silver_length'| Heap@@8 (MapType0Select Heap@@8 this@@4 List__Node__1))))))
 :qid |stdinbpl.297:15|
 :skolemid |38|
 :pattern ( (state Heap@@8 Mask@@5) (silver_length Heap@@8 this@@4))
 :pattern ( (state Heap@@8 Mask@@5) (|silver_length#triggerStateless| this@@4) (|valid__List#trigger| Heap@@8 (valid__List this@@4)))
)))
(assert (forall ((this@@5 T@U) (this2 T@U) ) (!  (=> (and (and (= (type this@@5) RefType) (= (type this2) RefType)) (= (valid__List this@@5) (valid__List this2))) (= this@@5 this2))
 :qid |stdinbpl.475:15|
 :skolemid |45|
 :pattern ( (valid__List this@@5) (valid__List this2))
)))
(assert (forall ((arg0@@27 T@U) ) (! (= (type (|valid__List#sm| arg0@@27)) (FieldType PredicateType_valid__ListType (MapType1Type RefType boolType)))
 :qid |funType:valid__List#sm|
 :pattern ( (|valid__List#sm| arg0@@27))
)))
(assert (forall ((this@@6 T@U) (this2@@0 T@U) ) (!  (=> (and (and (= (type this@@6) RefType) (= (type this2@@0) RefType)) (= (|valid__List#sm| this@@6) (|valid__List#sm| this2@@0))) (= this@@6 this2@@0))
 :qid |stdinbpl.479:15|
 :skolemid |46|
 :pattern ( (|valid__List#sm| this@@6) (|valid__List#sm| this2@@0))
)))
(assert (forall ((Heap@@9 T@U) (ExhaleHeap@@3 T@U) (Mask@@6 T@U) (o_1@@0 T@U) (f_2 T@U) ) (! (let ((B@@1 (FieldTypeInv1 (type f_2))))
(let ((A@@1 (FieldTypeInv0 (type f_2))))
 (=> (and (and (and (and (and (and (= (type Heap@@9) (MapType0Type RefType)) (= (type ExhaleHeap@@3) (MapType0Type RefType))) (= (type Mask@@6) (MapType1Type RefType realType))) (= (type o_1@@0) RefType)) (= (type f_2) (FieldType A@@1 B@@1))) (IdenticalOnKnownLocations Heap@@9 ExhaleHeap@@3 Mask@@6)) (HasDirectPerm Mask@@6 o_1@@0 f_2)) (= (MapType0Select Heap@@9 o_1@@0 f_2) (MapType0Select ExhaleHeap@@3 o_1@@0 f_2)))))
 :qid |stdinbpl.44:22|
 :skolemid |1|
 :pattern ( (IdenticalOnKnownLocations Heap@@9 ExhaleHeap@@3 Mask@@6) (MapType0Select ExhaleHeap@@3 o_1@@0 f_2))
)))
(assert (forall ((Heap@@10 T@U) (ExhaleHeap@@4 T@U) (Mask@@7 T@U) (o_2@@0 T@U) (f_4 T@U) ) (! (let ((B@@2 (FieldTypeInv1 (type f_4))))
(let ((A@@2 (FieldTypeInv0 (type f_4))))
 (=> (and (and (and (and (and (and (= (type Heap@@10) (MapType0Type RefType)) (= (type ExhaleHeap@@4) (MapType0Type RefType))) (= (type Mask@@7) (MapType1Type RefType realType))) (= (type o_2@@0) RefType)) (= (type f_4) (FieldType A@@2 B@@2))) (IdenticalOnKnownLocationsLiberal Heap@@10 ExhaleHeap@@4 Mask@@7)) (HasDirectPerm Mask@@7 o_2@@0 f_4)) (= (MapType0Select Heap@@10 o_2@@0 f_4) (MapType0Select ExhaleHeap@@4 o_2@@0 f_4)))))
 :qid |stdinbpl.105:22|
 :skolemid |14|
 :pattern ( (IdenticalOnKnownLocationsLiberal Heap@@10 ExhaleHeap@@4 Mask@@7) (MapType0Select ExhaleHeap@@4 o_2@@0 f_4))
)))
(assert  (and (= (type dummyHeap) (MapType0Type RefType)) (= (type ZeroMask) (MapType1Type RefType realType))))
(assert (state dummyHeap ZeroMask))
(assert (forall ((p T@U) (v_1 T@U) (w T@U) ) (! (let ((A@@3 (FieldTypeInv0 (type p))))
 (=> (and (and (= (type p) (FieldType A@@3 FrameTypeType)) (= (type v_1) FrameTypeType)) (= (type w) FrameTypeType)) (not (InsidePredicate p v_1 p w))))
 :qid |stdinbpl.230:19|
 :skolemid |33|
 :pattern ( (InsidePredicate p v_1 p w))
)))
(assert  (not (IsPredicateField List__variant)))
(assert  (not (IsWandField List__variant)))
(assert  (not (IsPredicateField List__Node__0)))
(assert  (not (IsWandField List__Node__0)))
(assert  (not (IsPredicateField List__Node__1)))
(assert  (not (IsWandField List__Node__1)))
(assert (forall ((Heap@@11 T@U) (ExhaleHeap@@5 T@U) (Mask@@8 T@U) ) (!  (=> (and (and (and (= (type Heap@@11) (MapType0Type RefType)) (= (type ExhaleHeap@@5) (MapType0Type RefType))) (= (type Mask@@8) (MapType1Type RefType realType))) (IdenticalOnKnownLocations Heap@@11 ExhaleHeap@@5 Mask@@8)) (succHeap Heap@@11 ExhaleHeap@@5))
 :qid |stdinbpl.85:15|
 :skolemid |10|
 :pattern ( (IdenticalOnKnownLocations Heap@@11 ExhaleHeap@@5 Mask@@8))
)))
(assert (forall ((Heap@@12 T@U) (ExhaleHeap@@6 T@U) (Mask@@9 T@U) ) (!  (=> (and (and (and (= (type Heap@@12) (MapType0Type RefType)) (= (type ExhaleHeap@@6) (MapType0Type RefType))) (= (type Mask@@9) (MapType1Type RefType realType))) (IdenticalOnKnownLocationsLiberal Heap@@12 ExhaleHeap@@6 Mask@@9)) (succHeap Heap@@12 ExhaleHeap@@6))
 :qid |stdinbpl.90:15|
 :skolemid |11|
 :pattern ( (IdenticalOnKnownLocationsLiberal Heap@@12 ExhaleHeap@@6 Mask@@9))
)))
(assert (forall ((ResultMask T@U) (SummandMask1 T@U) (SummandMask2 T@U) (o_3 T@U) (f_5 T@U) ) (! (let ((B@@3 (FieldTypeInv1 (type f_5))))
(let ((A@@4 (FieldTypeInv0 (type f_5))))
 (=> (and (and (and (and (and (= (type ResultMask) (MapType1Type RefType realType)) (= (type SummandMask1) (MapType1Type RefType realType))) (= (type SummandMask2) (MapType1Type RefType realType))) (= (type o_3) RefType)) (= (type f_5) (FieldType A@@4 B@@3))) (sumMask ResultMask SummandMask1 SummandMask2)) (= (U_2_real (MapType1Select ResultMask o_3 f_5)) (+ (U_2_real (MapType1Select SummandMask1 o_3 f_5)) (U_2_real (MapType1Select SummandMask2 o_3 f_5)))))))
 :qid |stdinbpl.195:22|
 :skolemid |30|
 :pattern ( (sumMask ResultMask SummandMask1 SummandMask2) (MapType1Select ResultMask o_3 f_5))
 :pattern ( (sumMask ResultMask SummandMask1 SummandMask2) (MapType1Select SummandMask1 o_3 f_5))
 :pattern ( (sumMask ResultMask SummandMask1 SummandMask2) (MapType1Select SummandMask2 o_3 f_5))
)))
(assert  (and (forall ((arg0@@28 Real) (arg1@@9 T@U) ) (! (= (type (ConditionalFrame arg0@@28 arg1@@9)) FrameTypeType)
 :qid |funType:ConditionalFrame|
 :pattern ( (ConditionalFrame arg0@@28 arg1@@9))
)) (= (type EmptyFrame) FrameTypeType)))
(assert (forall ((p@@0 Real) (f_7 T@U) ) (!  (=> (= (type f_7) FrameTypeType) (= (ConditionalFrame p@@0 f_7) (ite (> p@@0 0.0) f_7 EmptyFrame)))
 :qid |stdinbpl.218:15|
 :skolemid |31|
 :pattern ( (ConditionalFrame p@@0 f_7))
)))
(assert (forall ((Mask@@10 T@U) (o_3@@0 T@U) (f_5@@0 T@U) ) (! (let ((B@@4 (FieldTypeInv1 (type f_5@@0))))
(let ((A@@5 (FieldTypeInv0 (type f_5@@0))))
 (=> (and (and (= (type Mask@@10) (MapType1Type RefType realType)) (= (type o_3@@0) RefType)) (= (type f_5@@0) (FieldType A@@5 B@@4))) (= (HasDirectPerm Mask@@10 o_3@@0 f_5@@0) (> (U_2_real (MapType1Select Mask@@10 o_3@@0 f_5@@0)) NoPerm)))))
 :qid |stdinbpl.190:22|
 :skolemid |29|
 :pattern ( (HasDirectPerm Mask@@10 o_3@@0 f_5@@0))
)))
(assert (forall ((o_3@@1 T@U) (f_5@@1 T@U) ) (! (let ((B@@5 (FieldTypeInv1 (type f_5@@1))))
(let ((A@@6 (FieldTypeInv0 (type f_5@@1))))
 (=> (and (= (type o_3@@1) RefType) (= (type f_5@@1) (FieldType A@@6 B@@5))) (= (U_2_real (MapType1Select ZeroMask o_3@@1 f_5@@1)) NoPerm))))
 :qid |stdinbpl.163:22|
 :skolemid |25|
 :pattern ( (MapType1Select ZeroMask o_3@@1 f_5@@1))
)))
(assert (forall ((Heap@@13 T@U) (Heap1@@1 T@U) (Mask1 T@U) (Heap2@@0 T@U) (Mask2 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@13) (MapType0Type RefType)) (= (type Heap1@@1) (MapType0Type RefType))) (= (type Mask1) (MapType1Type RefType realType))) (= (type Heap2@@0) (MapType0Type RefType))) (= (type Mask2) (MapType1Type RefType realType))) (= (SumHeap Heap@@13 Heap1@@1 Mask1 Heap2@@0 Mask2)  (and (IdenticalOnKnownLocationsLiberal Heap1@@1 Heap@@13 Mask1) (IdenticalOnKnownLocationsLiberal Heap2@@0 Heap@@13 Mask2))))
 :qid |stdinbpl.150:15|
 :skolemid |24|
 :pattern ( (SumHeap Heap@@13 Heap1@@1 Mask1 Heap2@@0 Mask2))
)))
(assert (forall ((x@@8 T@U) ) (!  (=> (= (type x@@8) RefType) (or (= (variantOfList x@@8) fn$$List__Node) (= (variantOfList x@@8) fn$$List__Nil)))
 :qid |stdinbpl.255:15|
 :skolemid |34|
 :pattern ( (variantOfList x@@8))
)))
(assert (forall ((Heap@@14 T@U) (ExhaleHeap@@7 T@U) (Mask@@11 T@U) (pm_f@@1 T@U) ) (! (let ((C@@1 (FieldTypeInv0 (type pm_f@@1))))
 (=> (and (and (and (and (and (= (type Heap@@14) (MapType0Type RefType)) (= (type ExhaleHeap@@7) (MapType0Type RefType))) (= (type Mask@@11) (MapType1Type RefType realType))) (= (type pm_f@@1) (FieldType C@@1 FrameTypeType))) (IdenticalOnKnownLocations Heap@@14 ExhaleHeap@@7 Mask@@11)) (and (HasDirectPerm Mask@@11 null pm_f@@1) (IsPredicateField pm_f@@1))) (forall ((o2 T@U) (f_2@@0 T@U) ) (! (let ((B@@6 (FieldTypeInv1 (type f_2@@0))))
(let ((A@@7 (FieldTypeInv0 (type f_2@@0))))
 (=> (and (and (= (type o2) RefType) (= (type f_2@@0) (FieldType A@@7 B@@6))) (U_2_bool (MapType1Select (MapType0Select Heap@@14 null (PredicateMaskField pm_f@@1)) o2 f_2@@0))) (= (MapType0Select Heap@@14 o2 f_2@@0) (MapType0Select ExhaleHeap@@7 o2 f_2@@0)))))
 :qid |stdinbpl.56:134|
 :skolemid |3|
 :pattern ( (MapType0Select ExhaleHeap@@7 o2 f_2@@0))
))))
 :qid |stdinbpl.54:19|
 :skolemid |4|
 :pattern ( (IdenticalOnKnownLocations Heap@@14 ExhaleHeap@@7 Mask@@11) (IsPredicateField pm_f@@1))
)))
(assert (forall ((Heap@@15 T@U) (ExhaleHeap@@8 T@U) (Mask@@12 T@U) (pm_f@@2 T@U) ) (! (let ((C@@2 (FieldTypeInv0 (type pm_f@@2))))
 (=> (and (and (and (and (and (= (type Heap@@15) (MapType0Type RefType)) (= (type ExhaleHeap@@8) (MapType0Type RefType))) (= (type Mask@@12) (MapType1Type RefType realType))) (= (type pm_f@@2) (FieldType C@@2 FrameTypeType))) (IdenticalOnKnownLocations Heap@@15 ExhaleHeap@@8 Mask@@12)) (and (HasDirectPerm Mask@@12 null pm_f@@2) (IsWandField pm_f@@2))) (forall ((o2@@0 T@U) (f_2@@1 T@U) ) (! (let ((B@@7 (FieldTypeInv1 (type f_2@@1))))
(let ((A@@8 (FieldTypeInv0 (type f_2@@1))))
 (=> (and (and (= (type o2@@0) RefType) (= (type f_2@@1) (FieldType A@@8 B@@7))) (U_2_bool (MapType1Select (MapType0Select Heap@@15 null (WandMaskField pm_f@@2)) o2@@0 f_2@@1))) (= (MapType0Select Heap@@15 o2@@0 f_2@@1) (MapType0Select ExhaleHeap@@8 o2@@0 f_2@@1)))))
 :qid |stdinbpl.69:129|
 :skolemid |6|
 :pattern ( (MapType0Select ExhaleHeap@@8 o2@@0 f_2@@1))
))))
 :qid |stdinbpl.67:19|
 :skolemid |7|
 :pattern ( (IdenticalOnKnownLocations Heap@@15 ExhaleHeap@@8 Mask@@12) (IsWandField pm_f@@2))
)))
(assert (forall ((Heap@@16 T@U) (ExhaleHeap@@9 T@U) (Mask@@13 T@U) (pm_f_1 T@U) ) (! (let ((C@@3 (FieldTypeInv0 (type pm_f_1))))
 (=> (and (and (and (and (and (= (type Heap@@16) (MapType0Type RefType)) (= (type ExhaleHeap@@9) (MapType0Type RefType))) (= (type Mask@@13) (MapType1Type RefType realType))) (= (type pm_f_1) (FieldType C@@3 FrameTypeType))) (IdenticalOnKnownLocationsLiberal Heap@@16 ExhaleHeap@@9 Mask@@13)) (and (HasDirectPerm Mask@@13 null pm_f_1) (IsPredicateField pm_f_1))) (forall ((o2_1 T@U) (f_4@@0 T@U) ) (! (let ((B@@8 (FieldTypeInv1 (type f_4@@0))))
(let ((A@@9 (FieldTypeInv0 (type f_4@@0))))
 (=> (and (and (= (type o2_1) RefType) (= (type f_4@@0) (FieldType A@@9 B@@8))) (U_2_bool (MapType1Select (MapType0Select Heap@@16 null (PredicateMaskField pm_f_1)) o2_1 f_4@@0))) (= (MapType0Select Heap@@16 o2_1 f_4@@0) (MapType0Select ExhaleHeap@@9 o2_1 f_4@@0)))))
 :qid |stdinbpl.120:145|
 :skolemid |17|
 :pattern ( (MapType0Select ExhaleHeap@@9 o2_1 f_4@@0))
))))
 :qid |stdinbpl.118:19|
 :skolemid |18|
 :pattern ( (IdenticalOnKnownLocationsLiberal Heap@@16 ExhaleHeap@@9 Mask@@13) (IsPredicateField pm_f_1))
)))
(assert (forall ((Heap@@17 T@U) (ExhaleHeap@@10 T@U) (Mask@@14 T@U) (pm_f_1@@0 T@U) ) (! (let ((C@@4 (FieldTypeInv0 (type pm_f_1@@0))))
 (=> (and (and (and (and (and (= (type Heap@@17) (MapType0Type RefType)) (= (type ExhaleHeap@@10) (MapType0Type RefType))) (= (type Mask@@14) (MapType1Type RefType realType))) (= (type pm_f_1@@0) (FieldType C@@4 FrameTypeType))) (IdenticalOnKnownLocationsLiberal Heap@@17 ExhaleHeap@@10 Mask@@14)) (and (HasDirectPerm Mask@@14 null pm_f_1@@0) (IsWandField pm_f_1@@0))) (forall ((o2_1@@0 T@U) (f_4@@1 T@U) ) (! (let ((B@@9 (FieldTypeInv1 (type f_4@@1))))
(let ((A@@10 (FieldTypeInv0 (type f_4@@1))))
 (=> (and (and (= (type o2_1@@0) RefType) (= (type f_4@@1) (FieldType A@@10 B@@9))) (U_2_bool (MapType1Select (MapType0Select Heap@@17 null (WandMaskField pm_f_1@@0)) o2_1@@0 f_4@@1))) (= (MapType0Select Heap@@17 o2_1@@0 f_4@@1) (MapType0Select ExhaleHeap@@10 o2_1@@0 f_4@@1)))))
 :qid |stdinbpl.136:140|
 :skolemid |21|
 :pattern ( (MapType0Select ExhaleHeap@@10 o2_1@@0 f_4@@1))
))))
 :qid |stdinbpl.134:19|
 :skolemid |22|
 :pattern ( (IdenticalOnKnownLocationsLiberal Heap@@17 ExhaleHeap@@10 Mask@@14) (IsWandField pm_f_1@@0))
)))
(assert (forall ((this@@7 T@U) ) (!  (=> (= (type this@@7) RefType) (= (getPredWandId (valid__List this@@7)) 0))
 :qid |stdinbpl.469:15|
 :skolemid |44|
 :pattern ( (valid__List this@@7))
)))
(assert (forall ((Mask@@15 T@U) (o_3@@2 T@U) (f_5@@2 T@U) ) (! (let ((B@@10 (FieldTypeInv1 (type f_5@@2))))
(let ((A@@11 (FieldTypeInv0 (type f_5@@2))))
 (=> (and (and (and (= (type Mask@@15) (MapType1Type RefType realType)) (= (type o_3@@2) RefType)) (= (type f_5@@2) (FieldType A@@11 B@@10))) (GoodMask Mask@@15)) (and (>= (U_2_real (MapType1Select Mask@@15 o_3@@2 f_5@@2)) NoPerm) (=> (and (and (GoodMask Mask@@15) (not (IsPredicateField f_5@@2))) (not (IsWandField f_5@@2))) (<= (U_2_real (MapType1Select Mask@@15 o_3@@2 f_5@@2)) FullPerm))))))
 :qid |stdinbpl.185:22|
 :skolemid |28|
 :pattern ( (GoodMask Mask@@15) (MapType1Select Mask@@15 o_3@@2 f_5@@2))
)))
(assert (forall ((Heap@@18 T@U) (Mask@@16 T@U) (this@@8 T@U) ) (!  (=> (and (and (and (= (type Heap@@18) (MapType0Type RefType)) (= (type Mask@@16) (MapType1Type RefType realType))) (= (type this@@8) RefType)) (state Heap@@18 Mask@@16)) (= (|silver_length'| Heap@@18 this@@8) (|silver_length#frame| (MapType0Select Heap@@18 null (valid__List this@@8)) this@@8)))
 :qid |stdinbpl.304:15|
 :skolemid |39|
 :pattern ( (state Heap@@18 Mask@@16) (|silver_length'| Heap@@18 this@@8))
 :pattern ( (state Heap@@18 Mask@@16) (|silver_length#triggerStateless| this@@8) (|valid__List#trigger| Heap@@18 (valid__List this@@8)))
)))
(assert (forall ((o T@U) (f T@U) (Heap@@19 T@U) ) (!  (=> (and (and (and (= (type o) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap@@19) (MapType0Type RefType))) (U_2_bool (MapType0Select Heap@@19 o $allocated))) (U_2_bool (MapType0Select Heap@@19 (MapType0Select Heap@@19 o f) $allocated)))
 :qid |stdinbpl.31:15|
 :skolemid |0|
 :pattern ( (MapType0Select Heap@@19 o f))
)))
(assert (forall ((this@@9 T@U) ) (!  (=> (= (type this@@9) RefType) (= (PredicateMaskField (valid__List this@@9)) (|valid__List#sm| this@@9)))
 :qid |stdinbpl.461:15|
 :skolemid |42|
 :pattern ( (PredicateMaskField (valid__List this@@9)))
)))
(assert (forall ((x@@9 T@U) ) (!  (=> (= (type x@@9) RefType) (= (isList x@@9)  (or (= (variantOfList x@@9) fn$$List__Node) (= (variantOfList x@@9) fn$$List__Nil))))
 :qid |stdinbpl.261:15|
 :skolemid |35|
 :pattern ( (isList x@@9))
 :pattern ( (variantOfList x@@9))
)))
(assert (forall ((Heap@@20 T@U) (o@@0 T@U) (f_3 T@U) (v T@U) ) (! (let ((B@@11 (type v)))
(let ((A@@12 (FieldTypeInv0 (type f_3))))
 (=> (and (and (= (type Heap@@20) (MapType0Type RefType)) (= (type o@@0) RefType)) (= (type f_3) (FieldType A@@12 B@@11))) (succHeap Heap@@20 (MapType0Store Heap@@20 o@@0 f_3 v)))))
 :qid |stdinbpl.80:22|
 :skolemid |9|
 :pattern ( (MapType0Store Heap@@20 o@@0 f_3 v))
)))
(assert (= (type ZeroPMask) (MapType1Type RefType boolType)))
(assert (forall ((o_3@@3 T@U) (f_5@@3 T@U) ) (! (let ((B@@12 (FieldTypeInv1 (type f_5@@3))))
(let ((A@@13 (FieldTypeInv0 (type f_5@@3))))
 (=> (and (= (type o_3@@3) RefType) (= (type f_5@@3) (FieldType A@@13 B@@12))) (not (U_2_bool (MapType1Select ZeroPMask o_3@@3 f_5@@3))))))
 :qid |stdinbpl.169:22|
 :skolemid |26|
 :pattern ( (MapType1Select ZeroPMask o_3@@3 f_5@@3))
)))
(assert (forall ((p@@1 T@U) (v_1@@0 T@U) (q T@U) (w@@0 T@U) (r T@U) (u T@U) ) (! (let ((C@@5 (FieldTypeInv0 (type r))))
(let ((B@@13 (FieldTypeInv0 (type q))))
(let ((A@@14 (FieldTypeInv0 (type p@@1))))
 (=> (and (and (and (and (and (and (= (type p@@1) (FieldType A@@14 FrameTypeType)) (= (type v_1@@0) FrameTypeType)) (= (type q) (FieldType B@@13 FrameTypeType))) (= (type w@@0) FrameTypeType)) (= (type r) (FieldType C@@5 FrameTypeType))) (= (type u) FrameTypeType)) (and (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))) (InsidePredicate p@@1 v_1@@0 r u)))))
 :qid |stdinbpl.225:25|
 :skolemid |32|
 :pattern ( (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))
)))
(assert (forall ((Heap@@21 T@U) (ExhaleHeap@@11 T@U) (Mask@@17 T@U) (pm_f_1@@1 T@U) ) (! (let ((C@@6 (FieldTypeInv0 (type pm_f_1@@1))))
 (=> (and (and (and (and (and (= (type Heap@@21) (MapType0Type RefType)) (= (type ExhaleHeap@@11) (MapType0Type RefType))) (= (type Mask@@17) (MapType1Type RefType realType))) (= (type pm_f_1@@1) (FieldType C@@6 FrameTypeType))) (IdenticalOnKnownLocationsLiberal Heap@@21 ExhaleHeap@@11 Mask@@17)) (and (HasDirectPerm Mask@@17 null pm_f_1@@1) (IsPredicateField pm_f_1@@1))) (forall ((o2_1@@1 T@U) (f_4@@2 T@U) ) (! (let ((B@@14 (FieldTypeInv1 (type f_4@@2))))
(let ((A@@15 (FieldTypeInv0 (type f_4@@2))))
 (=> (and (and (= (type o2_1@@1) RefType) (= (type f_4@@2) (FieldType A@@15 B@@14))) (U_2_bool (MapType1Select (MapType0Select Heap@@21 null (PredicateMaskField pm_f_1@@1)) o2_1@@1 f_4@@2))) (U_2_bool (MapType1Select (MapType0Select ExhaleHeap@@11 null (PredicateMaskField pm_f_1@@1)) o2_1@@1 f_4@@2)))))
 :qid |stdinbpl.112:145|
 :skolemid |15|
 :pattern ( (MapType1Select (MapType0Select ExhaleHeap@@11 null (PredicateMaskField pm_f_1@@1)) o2_1@@1 f_4@@2))
))))
 :qid |stdinbpl.110:19|
 :skolemid |16|
 :pattern ( (IdenticalOnKnownLocationsLiberal Heap@@21 ExhaleHeap@@11 Mask@@17) (IsPredicateField pm_f_1@@1) (MapType0Select ExhaleHeap@@11 null (PredicateMaskField pm_f_1@@1)))
)))
(assert (forall ((Heap@@22 T@U) (ExhaleHeap@@12 T@U) (Mask@@18 T@U) (pm_f_1@@2 T@U) ) (! (let ((C@@7 (FieldTypeInv0 (type pm_f_1@@2))))
 (=> (and (and (and (and (and (= (type Heap@@22) (MapType0Type RefType)) (= (type ExhaleHeap@@12) (MapType0Type RefType))) (= (type Mask@@18) (MapType1Type RefType realType))) (= (type pm_f_1@@2) (FieldType C@@7 FrameTypeType))) (IdenticalOnKnownLocationsLiberal Heap@@22 ExhaleHeap@@12 Mask@@18)) (and (HasDirectPerm Mask@@18 null pm_f_1@@2) (IsWandField pm_f_1@@2))) (forall ((o2_1@@2 T@U) (f_4@@3 T@U) ) (! (let ((B@@15 (FieldTypeInv1 (type f_4@@3))))
(let ((A@@16 (FieldTypeInv0 (type f_4@@3))))
 (=> (and (and (= (type o2_1@@2) RefType) (= (type f_4@@3) (FieldType A@@16 B@@15))) (U_2_bool (MapType1Select (MapType0Select Heap@@22 null (WandMaskField pm_f_1@@2)) o2_1@@2 f_4@@3))) (U_2_bool (MapType1Select (MapType0Select ExhaleHeap@@12 null (WandMaskField pm_f_1@@2)) o2_1@@2 f_4@@3)))))
 :qid |stdinbpl.128:140|
 :skolemid |19|
 :pattern ( (MapType1Select (MapType0Select ExhaleHeap@@12 null (WandMaskField pm_f_1@@2)) o2_1@@2 f_4@@3))
))))
 :qid |stdinbpl.126:19|
 :skolemid |20|
 :pattern ( (IdenticalOnKnownLocationsLiberal Heap@@22 ExhaleHeap@@12 Mask@@18) (IsWandField pm_f_1@@2) (MapType0Select ExhaleHeap@@12 null (WandMaskField pm_f_1@@2)))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun Heap@@23 () T@U)
(declare-fun this@@10 () T@U)
(declare-fun Mask@7 () T@U)
(declare-fun Mask@4 () T@U)
(declare-fun Mask@5 () T@U)
(declare-fun Mask@6 () T@U)
(declare-fun Mask@0 () T@U)
(declare-fun Mask@1 () T@U)
(declare-fun Mask@2 () T@U)
(declare-fun Mask@3 () T@U)
(assert  (and (and (and (and (and (and (and (and (and (= (type Heap@@23) (MapType0Type RefType)) (= (type this@@10) RefType)) (= (type Mask@5) (MapType1Type RefType realType))) (= (type Mask@4) (MapType1Type RefType realType))) (= (type Mask@6) (MapType1Type RefType realType))) (= (type Mask@7) (MapType1Type RefType realType))) (= (type Mask@1) (MapType1Type RefType realType))) (= (type Mask@0) (MapType1Type RefType realType))) (= (type Mask@2) (MapType1Type RefType realType))) (= (type Mask@3) (MapType1Type RefType realType))))
(set-info :boogie-vc-id |valid__List#definedness|)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 12) (let ((anon4_correct true))
(let ((anon6_Else_correct  (=> (not (= (variantOfList (MapType0Select Heap@@23 this@@10 List__variant)) fn$$List__Nil)) (=> (and (= Mask@7 Mask@4) (= (ControlFlow 0 3) 1)) anon4_correct))))
(let ((anon6_Then_correct  (=> (= (variantOfList (MapType0Select Heap@@23 this@@10 List__variant)) fn$$List__Nil) (=> (and (and (and (not (= this@@10 null)) (= Mask@5 (MapType1Store Mask@4 this@@10 List__Node__0 (real_2_U (+ (U_2_real (MapType1Select Mask@4 this@@10 List__Node__0)) FullPerm))))) (and (state Heap@@23 Mask@5) (not (= this@@10 null)))) (and (and (= Mask@6 (MapType1Store Mask@5 this@@10 List__Node__1 (real_2_U (+ (U_2_real (MapType1Select Mask@5 this@@10 List__Node__1)) FullPerm)))) (state Heap@@23 Mask@6)) (and (= Mask@7 Mask@6) (= (ControlFlow 0 2) 1)))) anon4_correct))))
(let ((anon2_correct  (and (=> (= (ControlFlow 0 4) (- 0 5)) (HasDirectPerm Mask@4 this@@10 List__variant)) (=> (HasDirectPerm Mask@4 this@@10 List__variant) (and (=> (= (ControlFlow 0 4) 2) anon6_Then_correct) (=> (= (ControlFlow 0 4) 3) anon6_Else_correct))))))
(let ((anon5_Else_correct  (=> (not (= (variantOfList (MapType0Select Heap@@23 this@@10 List__variant)) fn$$List__Node)) (=> (and (= Mask@4 Mask@0) (= (ControlFlow 0 8) 4)) anon2_correct))))
(let ((anon5_Then_correct  (=> (= (variantOfList (MapType0Select Heap@@23 this@@10 List__variant)) fn$$List__Node) (=> (and (not (= this@@10 null)) (= Mask@1 (MapType1Store Mask@0 this@@10 List__Node__0 (real_2_U (+ (U_2_real (MapType1Select Mask@0 this@@10 List__Node__0)) FullPerm))))) (=> (and (and (state Heap@@23 Mask@1) (not (= this@@10 null))) (and (= Mask@2 (MapType1Store Mask@1 this@@10 List__Node__1 (real_2_U (+ (U_2_real (MapType1Select Mask@1 this@@10 List__Node__1)) FullPerm)))) (state Heap@@23 Mask@2))) (and (=> (= (ControlFlow 0 6) (- 0 7)) (HasDirectPerm Mask@2 this@@10 List__Node__1)) (=> (HasDirectPerm Mask@2 this@@10 List__Node__1) (=> (and (and (= Mask@3 (MapType1Store Mask@2 null (valid__List (MapType0Select Heap@@23 this@@10 List__Node__1)) (real_2_U (+ (U_2_real (MapType1Select Mask@2 null (valid__List (MapType0Select Heap@@23 this@@10 List__Node__1)))) FullPerm)))) (state Heap@@23 Mask@3)) (and (= Mask@4 Mask@3) (= (ControlFlow 0 6) 4))) anon2_correct))))))))
(let ((anon0_correct  (=> (and (state Heap@@23 ZeroMask) (= AssumeFunctionsAbove (- 0 1))) (=> (and (and (U_2_bool (MapType0Select Heap@@23 this@@10 $allocated)) (not (= this@@10 null))) (and (= Mask@0 (MapType1Store ZeroMask this@@10 List__variant (real_2_U (+ (U_2_real (MapType1Select ZeroMask this@@10 List__variant)) FullPerm)))) (state Heap@@23 Mask@0))) (and (=> (= (ControlFlow 0 9) (- 0 11)) (HasDirectPerm Mask@0 this@@10 List__variant)) (=> (HasDirectPerm Mask@0 this@@10 List__variant) (=> (isList (MapType0Select Heap@@23 this@@10 List__variant)) (and (=> (= (ControlFlow 0 9) (- 0 10)) (HasDirectPerm Mask@0 this@@10 List__variant)) (=> (HasDirectPerm Mask@0 this@@10 List__variant) (and (=> (= (ControlFlow 0 9) 6) anon5_Then_correct) (=> (= (ControlFlow 0 9) 8) anon5_Else_correct)))))))))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 12) 9) anon0_correct)))
PreconditionGeneratedEntry_correct)))))))))
))
(check-sat)
(pop 1)
; Valid
(get-info :rlimit)
