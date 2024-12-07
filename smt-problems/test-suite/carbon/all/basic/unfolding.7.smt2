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
(declare-fun f_7 () T@U)
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
(declare-fun valid (T@U) T@U)
(declare-fun PredicateType_validType () T@T)
(declare-fun deeper (T@U) T@U)
(declare-fun PredicateType_deeperType () T@T)
(declare-fun strange (T@U) T@U)
(declare-fun PredicateType_strangeType () T@T)
(declare-fun deeperfalse (T@U) T@U)
(declare-fun PredicateType_deeperfalseType () T@T)
(declare-fun |valid#trigger| (T@U T@U) Bool)
(declare-fun |valid#everUsed| (T@U) Bool)
(declare-fun |deeper#trigger| (T@U T@U) Bool)
(declare-fun |deeper#everUsed| (T@U) Bool)
(declare-fun |strange#trigger| (T@U T@U) Bool)
(declare-fun |strange#everUsed| (T@U) Bool)
(declare-fun |deeperfalse#trigger| (T@U T@U) Bool)
(declare-fun |deeperfalse#everUsed| (T@U) Bool)
(declare-fun |valid#sm| (T@U) T@U)
(declare-fun |deeper#sm| (T@U) T@U)
(declare-fun |strange#sm| (T@U) T@U)
(declare-fun |deeperfalse#sm| (T@U) T@U)
(declare-fun dummyHeap () T@U)
(declare-fun ZeroMask () T@U)
(declare-fun InsidePredicate (T@U T@U T@U T@U) Bool)
(declare-fun sumMask (T@U T@U T@U) Bool)
(declare-fun ConditionalFrame (Real T@U) T@U)
(declare-fun EmptyFrame () T@U)
(declare-fun NoPerm () Real)
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
(assert  (and (and (and (and (and (and (and (forall ((arg0@@11 T@T) (arg1 T@T) ) (! (= (Ctor (FieldType arg0@@11 arg1)) 6)
 :qid |ctor:FieldType|
)) (forall ((arg0@@12 T@T) (arg1@@0 T@T) ) (! (= (FieldTypeInv0 (FieldType arg0@@12 arg1@@0)) arg0@@12)
 :qid |typeInv:FieldTypeInv0|
 :pattern ( (FieldType arg0@@12 arg1@@0))
))) (forall ((arg0@@13 T@T) (arg1@@1 T@T) ) (! (= (FieldTypeInv1 (FieldType arg0@@13 arg1@@1)) arg1@@1)
 :qid |typeInv:FieldTypeInv1|
 :pattern ( (FieldType arg0@@13 arg1@@1))
))) (= (Ctor NormalFieldType) 7)) (= (type $allocated) (FieldType NormalFieldType boolType))) (= (type f_7) (FieldType NormalFieldType intType))) (= (Ctor RefType) 8)) (= (type next) (FieldType NormalFieldType RefType))))
(assert (distinct $allocated f_7 next)
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
(assert (forall ((r_1 T@U) ) (!  (=> (= (type r_1) RefType) (IsPredicateField (valid r_1)))
 :qid |stdinbpl.197:15|
 :skolemid |23|
 :pattern ( (valid r_1))
)))
(assert  (and (= (Ctor PredicateType_deeperType) 13) (forall ((arg0@@26 T@U) ) (! (= (type (deeper arg0@@26)) (FieldType PredicateType_deeperType FrameTypeType))
 :qid |funType:deeper|
 :pattern ( (deeper arg0@@26))
))))
(assert (forall ((r_1@@0 T@U) ) (!  (=> (= (type r_1@@0) RefType) (IsPredicateField (deeper r_1@@0)))
 :qid |stdinbpl.267:15|
 :skolemid |29|
 :pattern ( (deeper r_1@@0))
)))
(assert  (and (= (Ctor PredicateType_strangeType) 14) (forall ((arg0@@27 T@U) ) (! (= (type (strange arg0@@27)) (FieldType PredicateType_strangeType FrameTypeType))
 :qid |funType:strange|
 :pattern ( (strange arg0@@27))
))))
(assert (forall ((r_1@@1 T@U) ) (!  (=> (= (type r_1@@1) RefType) (IsPredicateField (strange r_1@@1)))
 :qid |stdinbpl.483:15|
 :skolemid |39|
 :pattern ( (strange r_1@@1))
)))
(assert  (and (= (Ctor PredicateType_deeperfalseType) 15) (forall ((arg0@@28 T@U) ) (! (= (type (deeperfalse arg0@@28)) (FieldType PredicateType_deeperfalseType FrameTypeType))
 :qid |funType:deeperfalse|
 :pattern ( (deeperfalse arg0@@28))
))))
(assert (forall ((r_1@@2 T@U) ) (!  (=> (= (type r_1@@2) RefType) (IsPredicateField (deeperfalse r_1@@2)))
 :qid |stdinbpl.741:15|
 :skolemid |49|
 :pattern ( (deeperfalse r_1@@2))
)))
(assert (forall ((Heap@@2 T@U) (r_1@@3 T@U) ) (!  (=> (and (= (type Heap@@2) (MapType0Type RefType)) (= (type r_1@@3) RefType)) (|valid#everUsed| (valid r_1@@3)))
 :qid |stdinbpl.216:15|
 :skolemid |27|
 :pattern ( (|valid#trigger| Heap@@2 (valid r_1@@3)))
)))
(assert (forall ((Heap@@3 T@U) (r_1@@4 T@U) ) (!  (=> (and (= (type Heap@@3) (MapType0Type RefType)) (= (type r_1@@4) RefType)) (|deeper#everUsed| (deeper r_1@@4)))
 :qid |stdinbpl.286:15|
 :skolemid |33|
 :pattern ( (|deeper#trigger| Heap@@3 (deeper r_1@@4)))
)))
(assert (forall ((Heap@@4 T@U) (r_1@@5 T@U) ) (!  (=> (and (= (type Heap@@4) (MapType0Type RefType)) (= (type r_1@@5) RefType)) (|strange#everUsed| (strange r_1@@5)))
 :qid |stdinbpl.502:15|
 :skolemid |43|
 :pattern ( (|strange#trigger| Heap@@4 (strange r_1@@5)))
)))
(assert (forall ((Heap@@5 T@U) (r_1@@6 T@U) ) (!  (=> (and (= (type Heap@@5) (MapType0Type RefType)) (= (type r_1@@6) RefType)) (|deeperfalse#everUsed| (deeperfalse r_1@@6)))
 :qid |stdinbpl.760:15|
 :skolemid |53|
 :pattern ( (|deeperfalse#trigger| Heap@@5 (deeperfalse r_1@@6)))
)))
(assert (forall ((Heap@@6 T@U) (ExhaleHeap@@1 T@U) (Mask@@2 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@6) (MapType0Type RefType)) (= (type ExhaleHeap@@1) (MapType0Type RefType))) (= (type Mask@@2) (MapType1Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@6 ExhaleHeap@@1 Mask@@2)) (U_2_bool (MapType0Select Heap@@6 o_1 $allocated))) (U_2_bool (MapType0Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.73:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@6 ExhaleHeap@@1 Mask@@2) (MapType0Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert (forall ((r_1@@7 T@U) (r2 T@U) ) (!  (=> (and (and (= (type r_1@@7) RefType) (= (type r2) RefType)) (= (valid r_1@@7) (valid r2))) (= r_1@@7 r2))
 :qid |stdinbpl.207:15|
 :skolemid |25|
 :pattern ( (valid r_1@@7) (valid r2))
)))
(assert (forall ((arg0@@29 T@U) ) (! (= (type (|valid#sm| arg0@@29)) (FieldType PredicateType_validType (MapType1Type RefType boolType)))
 :qid |funType:valid#sm|
 :pattern ( (|valid#sm| arg0@@29))
)))
(assert (forall ((r_1@@8 T@U) (r2@@0 T@U) ) (!  (=> (and (and (= (type r_1@@8) RefType) (= (type r2@@0) RefType)) (= (|valid#sm| r_1@@8) (|valid#sm| r2@@0))) (= r_1@@8 r2@@0))
 :qid |stdinbpl.211:15|
 :skolemid |26|
 :pattern ( (|valid#sm| r_1@@8) (|valid#sm| r2@@0))
)))
(assert (forall ((r_1@@9 T@U) (r2@@1 T@U) ) (!  (=> (and (and (= (type r_1@@9) RefType) (= (type r2@@1) RefType)) (= (deeper r_1@@9) (deeper r2@@1))) (= r_1@@9 r2@@1))
 :qid |stdinbpl.277:15|
 :skolemid |31|
 :pattern ( (deeper r_1@@9) (deeper r2@@1))
)))
(assert (forall ((arg0@@30 T@U) ) (! (= (type (|deeper#sm| arg0@@30)) (FieldType PredicateType_deeperType (MapType1Type RefType boolType)))
 :qid |funType:deeper#sm|
 :pattern ( (|deeper#sm| arg0@@30))
)))
(assert (forall ((r_1@@10 T@U) (r2@@2 T@U) ) (!  (=> (and (and (= (type r_1@@10) RefType) (= (type r2@@2) RefType)) (= (|deeper#sm| r_1@@10) (|deeper#sm| r2@@2))) (= r_1@@10 r2@@2))
 :qid |stdinbpl.281:15|
 :skolemid |32|
 :pattern ( (|deeper#sm| r_1@@10) (|deeper#sm| r2@@2))
)))
(assert (forall ((r_1@@11 T@U) (r2@@3 T@U) ) (!  (=> (and (and (= (type r_1@@11) RefType) (= (type r2@@3) RefType)) (= (strange r_1@@11) (strange r2@@3))) (= r_1@@11 r2@@3))
 :qid |stdinbpl.493:15|
 :skolemid |41|
 :pattern ( (strange r_1@@11) (strange r2@@3))
)))
(assert (forall ((arg0@@31 T@U) ) (! (= (type (|strange#sm| arg0@@31)) (FieldType PredicateType_strangeType (MapType1Type RefType boolType)))
 :qid |funType:strange#sm|
 :pattern ( (|strange#sm| arg0@@31))
)))
(assert (forall ((r_1@@12 T@U) (r2@@4 T@U) ) (!  (=> (and (and (= (type r_1@@12) RefType) (= (type r2@@4) RefType)) (= (|strange#sm| r_1@@12) (|strange#sm| r2@@4))) (= r_1@@12 r2@@4))
 :qid |stdinbpl.497:15|
 :skolemid |42|
 :pattern ( (|strange#sm| r_1@@12) (|strange#sm| r2@@4))
)))
(assert (forall ((r_1@@13 T@U) (r2@@5 T@U) ) (!  (=> (and (and (= (type r_1@@13) RefType) (= (type r2@@5) RefType)) (= (deeperfalse r_1@@13) (deeperfalse r2@@5))) (= r_1@@13 r2@@5))
 :qid |stdinbpl.751:15|
 :skolemid |51|
 :pattern ( (deeperfalse r_1@@13) (deeperfalse r2@@5))
)))
(assert (forall ((arg0@@32 T@U) ) (! (= (type (|deeperfalse#sm| arg0@@32)) (FieldType PredicateType_deeperfalseType (MapType1Type RefType boolType)))
 :qid |funType:deeperfalse#sm|
 :pattern ( (|deeperfalse#sm| arg0@@32))
)))
(assert (forall ((r_1@@14 T@U) (r2@@6 T@U) ) (!  (=> (and (and (= (type r_1@@14) RefType) (= (type r2@@6) RefType)) (= (|deeperfalse#sm| r_1@@14) (|deeperfalse#sm| r2@@6))) (= r_1@@14 r2@@6))
 :qid |stdinbpl.755:15|
 :skolemid |52|
 :pattern ( (|deeperfalse#sm| r_1@@14) (|deeperfalse#sm| r2@@6))
)))
(assert (forall ((Heap@@7 T@U) (ExhaleHeap@@2 T@U) (Mask@@3 T@U) (o_1@@0 T@U) (f_2 T@U) ) (! (let ((B@@1 (FieldTypeInv1 (type f_2))))
(let ((A@@1 (FieldTypeInv0 (type f_2))))
 (=> (and (and (and (and (and (and (= (type Heap@@7) (MapType0Type RefType)) (= (type ExhaleHeap@@2) (MapType0Type RefType))) (= (type Mask@@3) (MapType1Type RefType realType))) (= (type o_1@@0) RefType)) (= (type f_2) (FieldType A@@1 B@@1))) (IdenticalOnKnownLocations Heap@@7 ExhaleHeap@@2 Mask@@3)) (HasDirectPerm Mask@@3 o_1@@0 f_2)) (= (MapType0Select Heap@@7 o_1@@0 f_2) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2)))))
 :qid |stdinbpl.42:22|
 :skolemid |1|
 :pattern ( (IdenticalOnKnownLocations Heap@@7 ExhaleHeap@@2 Mask@@3) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2))
)))
(assert  (and (= (type dummyHeap) (MapType0Type RefType)) (= (type ZeroMask) (MapType1Type RefType realType))))
(assert (state dummyHeap ZeroMask))
(assert (forall ((p T@U) (v_1 T@U) (w T@U) ) (! (let ((A@@2 (FieldTypeInv0 (type p))))
 (=> (and (and (= (type p) (FieldType A@@2 FrameTypeType)) (= (type v_1) FrameTypeType)) (= (type w) FrameTypeType)) (not (InsidePredicate p v_1 p w))))
 :qid |stdinbpl.170:19|
 :skolemid |21|
 :pattern ( (InsidePredicate p v_1 p w))
)))
(assert  (not (IsPredicateField f_7)))
(assert  (not (IsWandField f_7)))
(assert  (not (IsPredicateField next)))
(assert  (not (IsWandField next)))
(assert (forall ((Heap@@8 T@U) (ExhaleHeap@@3 T@U) (Mask@@4 T@U) ) (!  (=> (and (and (and (= (type Heap@@8) (MapType0Type RefType)) (= (type ExhaleHeap@@3) (MapType0Type RefType))) (= (type Mask@@4) (MapType1Type RefType realType))) (IdenticalOnKnownLocations Heap@@8 ExhaleHeap@@3 Mask@@4)) (succHeap Heap@@8 ExhaleHeap@@3))
 :qid |stdinbpl.83:15|
 :skolemid |10|
 :pattern ( (IdenticalOnKnownLocations Heap@@8 ExhaleHeap@@3 Mask@@4))
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
(assert  (and (forall ((arg0@@33 Real) (arg1@@9 T@U) ) (! (= (type (ConditionalFrame arg0@@33 arg1@@9)) FrameTypeType)
 :qid |funType:ConditionalFrame|
 :pattern ( (ConditionalFrame arg0@@33 arg1@@9))
)) (= (type EmptyFrame) FrameTypeType)))
(assert (forall ((p@@0 Real) (f_6 T@U) ) (!  (=> (= (type f_6) FrameTypeType) (= (ConditionalFrame p@@0 f_6) (ite (> p@@0 0.0) f_6 EmptyFrame)))
 :qid |stdinbpl.158:15|
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
(assert (forall ((Heap@@9 T@U) (ExhaleHeap@@4 T@U) (Mask@@6 T@U) (pm_f@@1 T@U) ) (! (let ((C@@1 (FieldTypeInv0 (type pm_f@@1))))
 (=> (and (and (and (and (and (= (type Heap@@9) (MapType0Type RefType)) (= (type ExhaleHeap@@4) (MapType0Type RefType))) (= (type Mask@@6) (MapType1Type RefType realType))) (= (type pm_f@@1) (FieldType C@@1 FrameTypeType))) (IdenticalOnKnownLocations Heap@@9 ExhaleHeap@@4 Mask@@6)) (and (HasDirectPerm Mask@@6 null pm_f@@1) (IsPredicateField pm_f@@1))) (forall ((o2 T@U) (f_2@@0 T@U) ) (! (let ((B@@5 (FieldTypeInv1 (type f_2@@0))))
(let ((A@@6 (FieldTypeInv0 (type f_2@@0))))
 (=> (and (and (= (type o2) RefType) (= (type f_2@@0) (FieldType A@@6 B@@5))) (U_2_bool (MapType1Select (MapType0Select Heap@@9 null (PredicateMaskField pm_f@@1)) o2 f_2@@0))) (= (MapType0Select Heap@@9 o2 f_2@@0) (MapType0Select ExhaleHeap@@4 o2 f_2@@0)))))
 :qid |stdinbpl.54:134|
 :skolemid |3|
 :pattern ( (MapType0Select ExhaleHeap@@4 o2 f_2@@0))
))))
 :qid |stdinbpl.52:19|
 :skolemid |4|
 :pattern ( (IdenticalOnKnownLocations Heap@@9 ExhaleHeap@@4 Mask@@6) (IsPredicateField pm_f@@1))
)))
(assert (forall ((Heap@@10 T@U) (ExhaleHeap@@5 T@U) (Mask@@7 T@U) (pm_f@@2 T@U) ) (! (let ((C@@2 (FieldTypeInv0 (type pm_f@@2))))
 (=> (and (and (and (and (and (= (type Heap@@10) (MapType0Type RefType)) (= (type ExhaleHeap@@5) (MapType0Type RefType))) (= (type Mask@@7) (MapType1Type RefType realType))) (= (type pm_f@@2) (FieldType C@@2 FrameTypeType))) (IdenticalOnKnownLocations Heap@@10 ExhaleHeap@@5 Mask@@7)) (and (HasDirectPerm Mask@@7 null pm_f@@2) (IsWandField pm_f@@2))) (forall ((o2@@0 T@U) (f_2@@1 T@U) ) (! (let ((B@@6 (FieldTypeInv1 (type f_2@@1))))
(let ((A@@7 (FieldTypeInv0 (type f_2@@1))))
 (=> (and (and (= (type o2@@0) RefType) (= (type f_2@@1) (FieldType A@@7 B@@6))) (U_2_bool (MapType1Select (MapType0Select Heap@@10 null (WandMaskField pm_f@@2)) o2@@0 f_2@@1))) (= (MapType0Select Heap@@10 o2@@0 f_2@@1) (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1)))))
 :qid |stdinbpl.67:129|
 :skolemid |6|
 :pattern ( (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1))
))))
 :qid |stdinbpl.65:19|
 :skolemid |7|
 :pattern ( (IdenticalOnKnownLocations Heap@@10 ExhaleHeap@@5 Mask@@7) (IsWandField pm_f@@2))
)))
(assert (forall ((r_1@@15 T@U) ) (!  (=> (= (type r_1@@15) RefType) (= (getPredWandId (valid r_1@@15)) 0))
 :qid |stdinbpl.201:15|
 :skolemid |24|
 :pattern ( (valid r_1@@15))
)))
(assert (forall ((r_1@@16 T@U) ) (!  (=> (= (type r_1@@16) RefType) (= (getPredWandId (deeper r_1@@16)) 1))
 :qid |stdinbpl.271:15|
 :skolemid |30|
 :pattern ( (deeper r_1@@16))
)))
(assert (forall ((r_1@@17 T@U) ) (!  (=> (= (type r_1@@17) RefType) (= (getPredWandId (strange r_1@@17)) 2))
 :qid |stdinbpl.487:15|
 :skolemid |40|
 :pattern ( (strange r_1@@17))
)))
(assert (forall ((r_1@@18 T@U) ) (!  (=> (= (type r_1@@18) RefType) (= (getPredWandId (deeperfalse r_1@@18)) 3))
 :qid |stdinbpl.745:15|
 :skolemid |50|
 :pattern ( (deeperfalse r_1@@18))
)))
(assert (forall ((Mask@@8 T@U) (o_2@@2 T@U) (f_4@@2 T@U) ) (! (let ((B@@7 (FieldTypeInv1 (type f_4@@2))))
(let ((A@@8 (FieldTypeInv0 (type f_4@@2))))
 (=> (and (and (and (= (type Mask@@8) (MapType1Type RefType realType)) (= (type o_2@@2) RefType)) (= (type f_4@@2) (FieldType A@@8 B@@7))) (GoodMask Mask@@8)) (and (>= (U_2_real (MapType1Select Mask@@8 o_2@@2 f_4@@2)) NoPerm) (=> (and (and (GoodMask Mask@@8) (not (IsPredicateField f_4@@2))) (not (IsWandField f_4@@2))) (<= (U_2_real (MapType1Select Mask@@8 o_2@@2 f_4@@2)) FullPerm))))))
 :qid |stdinbpl.128:22|
 :skolemid |16|
 :pattern ( (GoodMask Mask@@8) (MapType1Select Mask@@8 o_2@@2 f_4@@2))
)))
(assert (forall ((o T@U) (f T@U) (Heap@@11 T@U) ) (!  (=> (and (and (and (= (type o) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap@@11) (MapType0Type RefType))) (U_2_bool (MapType0Select Heap@@11 o $allocated))) (U_2_bool (MapType0Select Heap@@11 (MapType0Select Heap@@11 o f) $allocated)))
 :qid |stdinbpl.31:15|
 :skolemid |0|
 :pattern ( (MapType0Select Heap@@11 o f))
)))
(assert (forall ((r_1@@19 T@U) ) (!  (=> (= (type r_1@@19) RefType) (= (PredicateMaskField (valid r_1@@19)) (|valid#sm| r_1@@19)))
 :qid |stdinbpl.193:15|
 :skolemid |22|
 :pattern ( (PredicateMaskField (valid r_1@@19)))
)))
(assert (forall ((r_1@@20 T@U) ) (!  (=> (= (type r_1@@20) RefType) (= (PredicateMaskField (deeper r_1@@20)) (|deeper#sm| r_1@@20)))
 :qid |stdinbpl.263:15|
 :skolemid |28|
 :pattern ( (PredicateMaskField (deeper r_1@@20)))
)))
(assert (forall ((r_1@@21 T@U) ) (!  (=> (= (type r_1@@21) RefType) (= (PredicateMaskField (strange r_1@@21)) (|strange#sm| r_1@@21)))
 :qid |stdinbpl.479:15|
 :skolemid |38|
 :pattern ( (PredicateMaskField (strange r_1@@21)))
)))
(assert (forall ((r_1@@22 T@U) ) (!  (=> (= (type r_1@@22) RefType) (= (PredicateMaskField (deeperfalse r_1@@22)) (|deeperfalse#sm| r_1@@22)))
 :qid |stdinbpl.737:15|
 :skolemid |48|
 :pattern ( (PredicateMaskField (deeperfalse r_1@@22)))
)))
(assert (forall ((Heap@@12 T@U) (o@@0 T@U) (f_3 T@U) (v T@U) ) (! (let ((B@@8 (type v)))
(let ((A@@9 (FieldTypeInv0 (type f_3))))
 (=> (and (and (= (type Heap@@12) (MapType0Type RefType)) (= (type o@@0) RefType)) (= (type f_3) (FieldType A@@9 B@@8))) (succHeap Heap@@12 (MapType0Store Heap@@12 o@@0 f_3 v)))))
 :qid |stdinbpl.78:22|
 :skolemid |9|
 :pattern ( (MapType0Store Heap@@12 o@@0 f_3 v))
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
 :qid |stdinbpl.165:25|
 :skolemid |20|
 :pattern ( (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun Heap@5 () T@U)
(declare-fun r_1@@23 () T@U)
(declare-fun Heap@7 () T@U)
(declare-fun newPMask@2 () T@U)
(declare-fun Heap@6 () T@U)
(declare-fun Heap@3 () T@U)
(declare-fun Mask@0 () T@U)
(declare-fun Heap@4 () T@U)
(declare-fun Heap@1 () T@U)
(declare-fun newPMask@1 () T@U)
(declare-fun Heap@2 () T@U)
(declare-fun UnfoldingHeap@3 () T@U)
(declare-fun UnfoldingMask@4 () T@U)
(declare-fun Heap@0 () T@U)
(declare-fun Heap@@13 () T@U)
(declare-fun UnfoldingHeap@1 () T@U)
(declare-fun newPMask@0 () T@U)
(declare-fun UnfoldingHeap@2 () T@U)
(declare-fun Unfolding1Mask@4 () T@U)
(declare-fun UnfoldingHeap@0 () T@U)
(declare-fun Unfolding1Mask@2 () T@U)
(declare-fun Unfolding1Mask@3 () T@U)
(declare-fun Unfolding1Mask@0 () T@U)
(declare-fun Unfolding1Mask@1 () T@U)
(declare-fun CombineFrames (T@U T@U) T@U)
(declare-fun FrameFragment (T@U) T@U)
(declare-fun UnfoldingMask@2 () T@U)
(declare-fun UnfoldingMask@3 () T@U)
(declare-fun UnfoldingMask@0 () T@U)
(declare-fun UnfoldingMask@1 () T@U)
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (= (type Heap@5) (MapType0Type RefType)) (= (type r_1@@23) RefType)) (= (type newPMask@2) (MapType1Type RefType boolType))) (= (type Heap@6) (MapType0Type RefType))) (= (type Heap@7) (MapType0Type RefType))) (= (type Heap@3) (MapType0Type RefType))) (= (type Mask@0) (MapType1Type RefType realType))) (= (type Heap@4) (MapType0Type RefType))) (= (type Heap@1) (MapType0Type RefType))) (= (type newPMask@1) (MapType1Type RefType boolType))) (= (type Heap@2) (MapType0Type RefType))) (= (type UnfoldingHeap@3) (MapType0Type RefType))) (= (type UnfoldingMask@4) (MapType1Type RefType realType))) (= (type Heap@0) (MapType0Type RefType))) (= (type Heap@@13) (MapType0Type RefType))) (= (type UnfoldingHeap@1) (MapType0Type RefType))) (= (type newPMask@0) (MapType1Type RefType boolType))) (= (type UnfoldingHeap@2) (MapType0Type RefType))) (= (type Unfolding1Mask@4) (MapType1Type RefType realType))) (= (type UnfoldingHeap@0) (MapType0Type RefType))) (= (type Unfolding1Mask@3) (MapType1Type RefType realType))) (= (type Unfolding1Mask@2) (MapType1Type RefType realType))) (= (type Unfolding1Mask@0) (MapType1Type RefType realType))) (= (type Unfolding1Mask@1) (MapType1Type RefType realType))) (forall ((arg0@@34 T@U) (arg1@@10 T@U) ) (! (= (type (CombineFrames arg0@@34 arg1@@10)) FrameTypeType)
 :qid |funType:CombineFrames|
 :pattern ( (CombineFrames arg0@@34 arg1@@10))
))) (forall ((arg0@@35 T@U) ) (! (= (type (FrameFragment arg0@@35)) FrameTypeType)
 :qid |funType:FrameFragment|
 :pattern ( (FrameFragment arg0@@35))
))) (= (type UnfoldingMask@3) (MapType1Type RefType realType))) (= (type UnfoldingMask@2) (MapType1Type RefType realType))) (= (type UnfoldingMask@0) (MapType1Type RefType realType))) (= (type UnfoldingMask@1) (MapType1Type RefType realType))))
(set-info :boogie-vc-id t3)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 26) (let ((anon14_correct true))
(let ((anon21_Else_correct  (=> (= (MapType0Select Heap@5 r_1@@23 next) null) (=> (and (= Heap@7 Heap@5) (= (ControlFlow 0 3) 1)) anon14_correct))))
(let ((anon21_Then_correct  (=> (not (= (MapType0Select Heap@5 r_1@@23 next) null)) (=> (and (and (forall ((o_16 T@U) (f_21 T@U) ) (! (let ((B@@11 (FieldTypeInv1 (type f_21))))
(let ((A@@12 (FieldTypeInv0 (type f_21))))
 (=> (and (and (= (type o_16) RefType) (= (type f_21) (FieldType A@@12 B@@11))) (or (U_2_bool (MapType1Select (MapType0Select Heap@5 null (|valid#sm| r_1@@23)) o_16 f_21)) (U_2_bool (MapType1Select (MapType0Select Heap@5 null (|valid#sm| (MapType0Select Heap@5 r_1@@23 next))) o_16 f_21)))) (U_2_bool (MapType1Select newPMask@2 o_16 f_21)))))
 :qid |stdinbpl.1178:33|
 :skolemid |59|
 :pattern ( (MapType1Select newPMask@2 o_16 f_21))
)) (= Heap@6 (MapType0Store Heap@5 null (|valid#sm| r_1@@23) newPMask@2))) (and (= Heap@7 Heap@6) (= (ControlFlow 0 2) 1))) anon14_correct))))
(let ((anon12_correct  (=> (state Heap@3 Mask@0) (=> (and (= Heap@4 (MapType0Store Heap@3 null (|valid#sm| r_1@@23) (MapType1Store (MapType0Select Heap@3 null (|valid#sm| r_1@@23)) r_1@@23 f_7 (bool_2_U true)))) (= Heap@5 (MapType0Store Heap@4 null (|valid#sm| r_1@@23) (MapType1Store (MapType0Select Heap@4 null (|valid#sm| r_1@@23)) r_1@@23 next (bool_2_U true))))) (and (=> (= (ControlFlow 0 4) 2) anon21_Then_correct) (=> (= (ControlFlow 0 4) 3) anon21_Else_correct))))))
(let ((anon20_Else_correct  (=> (= (MapType0Select Heap@1 r_1@@23 next) null) (=> (and (= Heap@3 Heap@1) (= (ControlFlow 0 6) 4)) anon12_correct))))
(let ((anon20_Then_correct  (=> (not (= (MapType0Select Heap@1 r_1@@23 next) null)) (=> (and (and (forall ((o_15 T@U) (f_20 T@U) ) (! (let ((B@@12 (FieldTypeInv1 (type f_20))))
(let ((A@@13 (FieldTypeInv0 (type f_20))))
 (=> (and (and (= (type o_15) RefType) (= (type f_20) (FieldType A@@13 B@@12))) (or (U_2_bool (MapType1Select (MapType0Select Heap@1 null (|valid#sm| r_1@@23)) o_15 f_20)) (U_2_bool (MapType1Select (MapType0Select Heap@1 null (|valid#sm| (MapType0Select Heap@1 r_1@@23 next))) o_15 f_20)))) (U_2_bool (MapType1Select newPMask@1 o_15 f_20)))))
 :qid |stdinbpl.1167:33|
 :skolemid |58|
 :pattern ( (MapType1Select newPMask@1 o_15 f_20))
)) (= Heap@2 (MapType0Store Heap@1 null (|valid#sm| r_1@@23) newPMask@1))) (and (= Heap@3 Heap@2) (= (ControlFlow 0 5) 4))) anon12_correct))))
(let ((anon10_correct  (=> (state UnfoldingHeap@3 UnfoldingMask@4) (=> (and (= Heap@0 (MapType0Store Heap@@13 null (|valid#sm| r_1@@23) (MapType1Store (MapType0Select Heap@@13 null (|valid#sm| r_1@@23)) r_1@@23 f_7 (bool_2_U true)))) (= Heap@1 (MapType0Store Heap@0 null (|valid#sm| r_1@@23) (MapType1Store (MapType0Select Heap@0 null (|valid#sm| r_1@@23)) r_1@@23 next (bool_2_U true))))) (and (=> (= (ControlFlow 0 7) 5) anon20_Then_correct) (=> (= (ControlFlow 0 7) 6) anon20_Else_correct))))))
(let ((anon19_Else_correct  (=> (= (MapType0Select UnfoldingHeap@1 r_1@@23 next) null) (=> (and (= UnfoldingHeap@3 UnfoldingHeap@1) (= (ControlFlow 0 9) 7)) anon10_correct))))
(let ((anon19_Then_correct  (=> (not (= (MapType0Select UnfoldingHeap@1 r_1@@23 next) null)) (=> (and (and (forall ((o_14 T@U) (f_19 T@U) ) (! (let ((B@@13 (FieldTypeInv1 (type f_19))))
(let ((A@@14 (FieldTypeInv0 (type f_19))))
 (=> (and (and (= (type o_14) RefType) (= (type f_19) (FieldType A@@14 B@@13))) (or (U_2_bool (MapType1Select (MapType0Select UnfoldingHeap@1 null (|valid#sm| r_1@@23)) o_14 f_19)) (U_2_bool (MapType1Select (MapType0Select UnfoldingHeap@1 null (|valid#sm| (MapType0Select UnfoldingHeap@1 r_1@@23 next))) o_14 f_19)))) (U_2_bool (MapType1Select newPMask@0 o_14 f_19)))))
 :qid |stdinbpl.1154:33|
 :skolemid |57|
 :pattern ( (MapType1Select newPMask@0 o_14 f_19))
)) (= UnfoldingHeap@2 (MapType0Store UnfoldingHeap@1 null (|valid#sm| r_1@@23) newPMask@0))) (and (= UnfoldingHeap@3 UnfoldingHeap@2) (= (ControlFlow 0 8) 7))) anon10_correct))))
(let ((anon8_correct  (=> (state Heap@@13 Unfolding1Mask@4) (and (=> (= (ControlFlow 0 10) (- 0 11)) (HasDirectPerm Unfolding1Mask@4 r_1@@23 f_7)) (=> (HasDirectPerm Unfolding1Mask@4 r_1@@23 f_7) (=> (and (= UnfoldingHeap@0 (MapType0Store Heap@@13 null (|valid#sm| r_1@@23) (MapType1Store (MapType0Select Heap@@13 null (|valid#sm| r_1@@23)) r_1@@23 f_7 (bool_2_U true)))) (= UnfoldingHeap@1 (MapType0Store UnfoldingHeap@0 null (|valid#sm| r_1@@23) (MapType1Store (MapType0Select UnfoldingHeap@0 null (|valid#sm| r_1@@23)) r_1@@23 next (bool_2_U true))))) (and (=> (= (ControlFlow 0 10) 8) anon19_Then_correct) (=> (= (ControlFlow 0 10) 9) anon19_Else_correct))))))))
(let ((anon18_Else_correct  (=> (= (MapType0Select Heap@@13 r_1@@23 next) null) (=> (and (= Unfolding1Mask@4 Unfolding1Mask@2) (= (ControlFlow 0 13) 10)) anon8_correct))))
(let ((anon18_Then_correct  (=> (and (not (= (MapType0Select Heap@@13 r_1@@23 next) null)) (= Unfolding1Mask@3 (MapType1Store Unfolding1Mask@2 null (valid (MapType0Select Heap@@13 r_1@@23 next)) (real_2_U (+ (U_2_real (MapType1Select Unfolding1Mask@2 null (valid (MapType0Select Heap@@13 r_1@@23 next)))) FullPerm))))) (=> (and (and (InsidePredicate (valid r_1@@23) (MapType0Select Heap@@13 null (valid r_1@@23)) (valid (MapType0Select Heap@@13 r_1@@23 next)) (MapType0Select Heap@@13 null (valid (MapType0Select Heap@@13 r_1@@23 next)))) (state Heap@@13 Unfolding1Mask@3)) (and (= Unfolding1Mask@4 Unfolding1Mask@3) (= (ControlFlow 0 12) 10))) anon8_correct))))
(let ((anon6_correct  (=> (= Unfolding1Mask@0 (MapType1Store UnfoldingMask@4 null (valid r_1@@23) (real_2_U (- (U_2_real (MapType1Select UnfoldingMask@4 null (valid r_1@@23))) FullPerm)))) (=> (and (not (= r_1@@23 null)) (= Unfolding1Mask@1 (MapType1Store Unfolding1Mask@0 r_1@@23 f_7 (real_2_U (+ (U_2_real (MapType1Select Unfolding1Mask@0 r_1@@23 f_7)) FullPerm))))) (=> (and (and (state Heap@@13 Unfolding1Mask@1) (not (= r_1@@23 null))) (and (= Unfolding1Mask@2 (MapType1Store Unfolding1Mask@1 r_1@@23 next (real_2_U (+ (U_2_real (MapType1Select Unfolding1Mask@1 r_1@@23 next)) FullPerm)))) (state Heap@@13 Unfolding1Mask@2))) (and (=> (= (ControlFlow 0 14) 12) anon18_Then_correct) (=> (= (ControlFlow 0 14) 13) anon18_Else_correct)))))))
(let ((anon17_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 17) 14)) anon6_correct)))
(let ((anon17_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 15) (- 0 16)) (<= FullPerm (U_2_real (MapType1Select UnfoldingMask@4 null (valid r_1@@23))))) (=> (<= FullPerm (U_2_real (MapType1Select UnfoldingMask@4 null (valid r_1@@23)))) (=> (= (ControlFlow 0 15) 14) anon6_correct))))))
(let ((anon4_correct  (=> (state Heap@@13 UnfoldingMask@4) (=> (and (|valid#trigger| Heap@@13 (valid r_1@@23)) (= (MapType0Select Heap@@13 null (valid r_1@@23)) (CombineFrames (FrameFragment (MapType0Select Heap@@13 r_1@@23 f_7)) (CombineFrames (FrameFragment (MapType0Select Heap@@13 r_1@@23 next)) (FrameFragment (ite (not (= (MapType0Select Heap@@13 r_1@@23 next) null)) (MapType0Select Heap@@13 null (valid (MapType0Select Heap@@13 r_1@@23 next))) EmptyFrame)))))) (and (=> (= (ControlFlow 0 18) 15) anon17_Then_correct) (=> (= (ControlFlow 0 18) 17) anon17_Else_correct))))))
(let ((anon16_Else_correct  (=> (= (MapType0Select Heap@@13 r_1@@23 next) null) (=> (and (= UnfoldingMask@4 UnfoldingMask@2) (= (ControlFlow 0 20) 18)) anon4_correct))))
(let ((anon16_Then_correct  (=> (and (not (= (MapType0Select Heap@@13 r_1@@23 next) null)) (= UnfoldingMask@3 (MapType1Store UnfoldingMask@2 null (valid (MapType0Select Heap@@13 r_1@@23 next)) (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@2 null (valid (MapType0Select Heap@@13 r_1@@23 next)))) FullPerm))))) (=> (and (and (InsidePredicate (valid r_1@@23) (MapType0Select Heap@@13 null (valid r_1@@23)) (valid (MapType0Select Heap@@13 r_1@@23 next)) (MapType0Select Heap@@13 null (valid (MapType0Select Heap@@13 r_1@@23 next)))) (state Heap@@13 UnfoldingMask@3)) (and (= UnfoldingMask@4 UnfoldingMask@3) (= (ControlFlow 0 19) 18))) anon4_correct))))
(let ((anon2_correct  (=> (= UnfoldingMask@0 (MapType1Store Mask@0 null (valid r_1@@23) (real_2_U (- (U_2_real (MapType1Select Mask@0 null (valid r_1@@23))) FullPerm)))) (=> (and (not (= r_1@@23 null)) (= UnfoldingMask@1 (MapType1Store UnfoldingMask@0 r_1@@23 f_7 (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@0 r_1@@23 f_7)) FullPerm))))) (=> (and (and (state Heap@@13 UnfoldingMask@1) (not (= r_1@@23 null))) (and (= UnfoldingMask@2 (MapType1Store UnfoldingMask@1 r_1@@23 next (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@1 r_1@@23 next)) FullPerm)))) (state Heap@@13 UnfoldingMask@2))) (and (=> (= (ControlFlow 0 21) 19) anon16_Then_correct) (=> (= (ControlFlow 0 21) 20) anon16_Else_correct)))))))
(let ((anon15_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 24) 21)) anon2_correct)))
(let ((anon15_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 22) (- 0 23)) (<= FullPerm (U_2_real (MapType1Select Mask@0 null (valid r_1@@23))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@0 null (valid r_1@@23)))) (=> (= (ControlFlow 0 22) 21) anon2_correct))))))
(let ((anon0_correct  (=> (state Heap@@13 ZeroMask) (=> (and (U_2_bool (MapType0Select Heap@@13 r_1@@23 $allocated)) (= Mask@0 (MapType1Store ZeroMask null (valid r_1@@23) (real_2_U (+ (U_2_real (MapType1Select ZeroMask null (valid r_1@@23))) FullPerm))))) (=> (and (and (state Heap@@13 Mask@0) (state Heap@@13 Mask@0)) (and (|valid#trigger| Heap@@13 (valid r_1@@23)) (= (MapType0Select Heap@@13 null (valid r_1@@23)) (CombineFrames (FrameFragment (MapType0Select Heap@@13 r_1@@23 f_7)) (CombineFrames (FrameFragment (MapType0Select Heap@@13 r_1@@23 next)) (FrameFragment (ite (not (= (MapType0Select Heap@@13 r_1@@23 next) null)) (MapType0Select Heap@@13 null (valid (MapType0Select Heap@@13 r_1@@23 next))) EmptyFrame))))))) (and (=> (= (ControlFlow 0 25) 22) anon15_Then_correct) (=> (= (ControlFlow 0 25) 24) anon15_Else_correct)))))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 26) 25) anon0_correct)))
PreconditionGeneratedEntry_correct))))))))))))))))))))))))
))
(check-sat)
(get-info :reason-unknown)
(assert (not (= (ControlFlow 0 15) (- 16))))
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
(declare-fun $allocated () T@U)
(declare-fun f_7 () T@U)
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
(declare-fun valid (T@U) T@U)
(declare-fun PredicateType_validType () T@T)
(declare-fun deeper (T@U) T@U)
(declare-fun PredicateType_deeperType () T@T)
(declare-fun strange (T@U) T@U)
(declare-fun PredicateType_strangeType () T@T)
(declare-fun deeperfalse (T@U) T@U)
(declare-fun PredicateType_deeperfalseType () T@T)
(declare-fun |valid#trigger| (T@U T@U) Bool)
(declare-fun |valid#everUsed| (T@U) Bool)
(declare-fun |deeper#trigger| (T@U T@U) Bool)
(declare-fun |deeper#everUsed| (T@U) Bool)
(declare-fun |strange#trigger| (T@U T@U) Bool)
(declare-fun |strange#everUsed| (T@U) Bool)
(declare-fun |deeperfalse#trigger| (T@U T@U) Bool)
(declare-fun |deeperfalse#everUsed| (T@U) Bool)
(declare-fun |valid#sm| (T@U) T@U)
(declare-fun |deeper#sm| (T@U) T@U)
(declare-fun |strange#sm| (T@U) T@U)
(declare-fun |deeperfalse#sm| (T@U) T@U)
(declare-fun dummyHeap () T@U)
(declare-fun ZeroMask () T@U)
(declare-fun InsidePredicate (T@U T@U T@U T@U) Bool)
(declare-fun sumMask (T@U T@U T@U) Bool)
(declare-fun ConditionalFrame (Real T@U) T@U)
(declare-fun EmptyFrame () T@U)
(declare-fun NoPerm () Real)
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
(assert  (and (and (and (and (and (and (and (forall ((arg0@@11 T@T) (arg1 T@T) ) (! (= (Ctor (FieldType arg0@@11 arg1)) 6)
 :qid |ctor:FieldType|
)) (forall ((arg0@@12 T@T) (arg1@@0 T@T) ) (! (= (FieldTypeInv0 (FieldType arg0@@12 arg1@@0)) arg0@@12)
 :qid |typeInv:FieldTypeInv0|
 :pattern ( (FieldType arg0@@12 arg1@@0))
))) (forall ((arg0@@13 T@T) (arg1@@1 T@T) ) (! (= (FieldTypeInv1 (FieldType arg0@@13 arg1@@1)) arg1@@1)
 :qid |typeInv:FieldTypeInv1|
 :pattern ( (FieldType arg0@@13 arg1@@1))
))) (= (Ctor NormalFieldType) 7)) (= (type $allocated) (FieldType NormalFieldType boolType))) (= (type f_7) (FieldType NormalFieldType intType))) (= (Ctor RefType) 8)) (= (type next) (FieldType NormalFieldType RefType))))
(assert (distinct $allocated f_7 next)
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
(assert (forall ((r_1 T@U) ) (!  (=> (= (type r_1) RefType) (IsPredicateField (valid r_1)))
 :qid |stdinbpl.197:15|
 :skolemid |23|
 :pattern ( (valid r_1))
)))
(assert  (and (= (Ctor PredicateType_deeperType) 13) (forall ((arg0@@26 T@U) ) (! (= (type (deeper arg0@@26)) (FieldType PredicateType_deeperType FrameTypeType))
 :qid |funType:deeper|
 :pattern ( (deeper arg0@@26))
))))
(assert (forall ((r_1@@0 T@U) ) (!  (=> (= (type r_1@@0) RefType) (IsPredicateField (deeper r_1@@0)))
 :qid |stdinbpl.267:15|
 :skolemid |29|
 :pattern ( (deeper r_1@@0))
)))
(assert  (and (= (Ctor PredicateType_strangeType) 14) (forall ((arg0@@27 T@U) ) (! (= (type (strange arg0@@27)) (FieldType PredicateType_strangeType FrameTypeType))
 :qid |funType:strange|
 :pattern ( (strange arg0@@27))
))))
(assert (forall ((r_1@@1 T@U) ) (!  (=> (= (type r_1@@1) RefType) (IsPredicateField (strange r_1@@1)))
 :qid |stdinbpl.483:15|
 :skolemid |39|
 :pattern ( (strange r_1@@1))
)))
(assert  (and (= (Ctor PredicateType_deeperfalseType) 15) (forall ((arg0@@28 T@U) ) (! (= (type (deeperfalse arg0@@28)) (FieldType PredicateType_deeperfalseType FrameTypeType))
 :qid |funType:deeperfalse|
 :pattern ( (deeperfalse arg0@@28))
))))
(assert (forall ((r_1@@2 T@U) ) (!  (=> (= (type r_1@@2) RefType) (IsPredicateField (deeperfalse r_1@@2)))
 :qid |stdinbpl.741:15|
 :skolemid |49|
 :pattern ( (deeperfalse r_1@@2))
)))
(assert (forall ((Heap@@2 T@U) (r_1@@3 T@U) ) (!  (=> (and (= (type Heap@@2) (MapType0Type RefType)) (= (type r_1@@3) RefType)) (|valid#everUsed| (valid r_1@@3)))
 :qid |stdinbpl.216:15|
 :skolemid |27|
 :pattern ( (|valid#trigger| Heap@@2 (valid r_1@@3)))
)))
(assert (forall ((Heap@@3 T@U) (r_1@@4 T@U) ) (!  (=> (and (= (type Heap@@3) (MapType0Type RefType)) (= (type r_1@@4) RefType)) (|deeper#everUsed| (deeper r_1@@4)))
 :qid |stdinbpl.286:15|
 :skolemid |33|
 :pattern ( (|deeper#trigger| Heap@@3 (deeper r_1@@4)))
)))
(assert (forall ((Heap@@4 T@U) (r_1@@5 T@U) ) (!  (=> (and (= (type Heap@@4) (MapType0Type RefType)) (= (type r_1@@5) RefType)) (|strange#everUsed| (strange r_1@@5)))
 :qid |stdinbpl.502:15|
 :skolemid |43|
 :pattern ( (|strange#trigger| Heap@@4 (strange r_1@@5)))
)))
(assert (forall ((Heap@@5 T@U) (r_1@@6 T@U) ) (!  (=> (and (= (type Heap@@5) (MapType0Type RefType)) (= (type r_1@@6) RefType)) (|deeperfalse#everUsed| (deeperfalse r_1@@6)))
 :qid |stdinbpl.760:15|
 :skolemid |53|
 :pattern ( (|deeperfalse#trigger| Heap@@5 (deeperfalse r_1@@6)))
)))
(assert (forall ((Heap@@6 T@U) (ExhaleHeap@@1 T@U) (Mask@@2 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@6) (MapType0Type RefType)) (= (type ExhaleHeap@@1) (MapType0Type RefType))) (= (type Mask@@2) (MapType1Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@6 ExhaleHeap@@1 Mask@@2)) (U_2_bool (MapType0Select Heap@@6 o_1 $allocated))) (U_2_bool (MapType0Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.73:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@6 ExhaleHeap@@1 Mask@@2) (MapType0Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert (forall ((r_1@@7 T@U) (r2 T@U) ) (!  (=> (and (and (= (type r_1@@7) RefType) (= (type r2) RefType)) (= (valid r_1@@7) (valid r2))) (= r_1@@7 r2))
 :qid |stdinbpl.207:15|
 :skolemid |25|
 :pattern ( (valid r_1@@7) (valid r2))
)))
(assert (forall ((arg0@@29 T@U) ) (! (= (type (|valid#sm| arg0@@29)) (FieldType PredicateType_validType (MapType1Type RefType boolType)))
 :qid |funType:valid#sm|
 :pattern ( (|valid#sm| arg0@@29))
)))
(assert (forall ((r_1@@8 T@U) (r2@@0 T@U) ) (!  (=> (and (and (= (type r_1@@8) RefType) (= (type r2@@0) RefType)) (= (|valid#sm| r_1@@8) (|valid#sm| r2@@0))) (= r_1@@8 r2@@0))
 :qid |stdinbpl.211:15|
 :skolemid |26|
 :pattern ( (|valid#sm| r_1@@8) (|valid#sm| r2@@0))
)))
(assert (forall ((r_1@@9 T@U) (r2@@1 T@U) ) (!  (=> (and (and (= (type r_1@@9) RefType) (= (type r2@@1) RefType)) (= (deeper r_1@@9) (deeper r2@@1))) (= r_1@@9 r2@@1))
 :qid |stdinbpl.277:15|
 :skolemid |31|
 :pattern ( (deeper r_1@@9) (deeper r2@@1))
)))
(assert (forall ((arg0@@30 T@U) ) (! (= (type (|deeper#sm| arg0@@30)) (FieldType PredicateType_deeperType (MapType1Type RefType boolType)))
 :qid |funType:deeper#sm|
 :pattern ( (|deeper#sm| arg0@@30))
)))
(assert (forall ((r_1@@10 T@U) (r2@@2 T@U) ) (!  (=> (and (and (= (type r_1@@10) RefType) (= (type r2@@2) RefType)) (= (|deeper#sm| r_1@@10) (|deeper#sm| r2@@2))) (= r_1@@10 r2@@2))
 :qid |stdinbpl.281:15|
 :skolemid |32|
 :pattern ( (|deeper#sm| r_1@@10) (|deeper#sm| r2@@2))
)))
(assert (forall ((r_1@@11 T@U) (r2@@3 T@U) ) (!  (=> (and (and (= (type r_1@@11) RefType) (= (type r2@@3) RefType)) (= (strange r_1@@11) (strange r2@@3))) (= r_1@@11 r2@@3))
 :qid |stdinbpl.493:15|
 :skolemid |41|
 :pattern ( (strange r_1@@11) (strange r2@@3))
)))
(assert (forall ((arg0@@31 T@U) ) (! (= (type (|strange#sm| arg0@@31)) (FieldType PredicateType_strangeType (MapType1Type RefType boolType)))
 :qid |funType:strange#sm|
 :pattern ( (|strange#sm| arg0@@31))
)))
(assert (forall ((r_1@@12 T@U) (r2@@4 T@U) ) (!  (=> (and (and (= (type r_1@@12) RefType) (= (type r2@@4) RefType)) (= (|strange#sm| r_1@@12) (|strange#sm| r2@@4))) (= r_1@@12 r2@@4))
 :qid |stdinbpl.497:15|
 :skolemid |42|
 :pattern ( (|strange#sm| r_1@@12) (|strange#sm| r2@@4))
)))
(assert (forall ((r_1@@13 T@U) (r2@@5 T@U) ) (!  (=> (and (and (= (type r_1@@13) RefType) (= (type r2@@5) RefType)) (= (deeperfalse r_1@@13) (deeperfalse r2@@5))) (= r_1@@13 r2@@5))
 :qid |stdinbpl.751:15|
 :skolemid |51|
 :pattern ( (deeperfalse r_1@@13) (deeperfalse r2@@5))
)))
(assert (forall ((arg0@@32 T@U) ) (! (= (type (|deeperfalse#sm| arg0@@32)) (FieldType PredicateType_deeperfalseType (MapType1Type RefType boolType)))
 :qid |funType:deeperfalse#sm|
 :pattern ( (|deeperfalse#sm| arg0@@32))
)))
(assert (forall ((r_1@@14 T@U) (r2@@6 T@U) ) (!  (=> (and (and (= (type r_1@@14) RefType) (= (type r2@@6) RefType)) (= (|deeperfalse#sm| r_1@@14) (|deeperfalse#sm| r2@@6))) (= r_1@@14 r2@@6))
 :qid |stdinbpl.755:15|
 :skolemid |52|
 :pattern ( (|deeperfalse#sm| r_1@@14) (|deeperfalse#sm| r2@@6))
)))
(assert (forall ((Heap@@7 T@U) (ExhaleHeap@@2 T@U) (Mask@@3 T@U) (o_1@@0 T@U) (f_2 T@U) ) (! (let ((B@@1 (FieldTypeInv1 (type f_2))))
(let ((A@@1 (FieldTypeInv0 (type f_2))))
 (=> (and (and (and (and (and (and (= (type Heap@@7) (MapType0Type RefType)) (= (type ExhaleHeap@@2) (MapType0Type RefType))) (= (type Mask@@3) (MapType1Type RefType realType))) (= (type o_1@@0) RefType)) (= (type f_2) (FieldType A@@1 B@@1))) (IdenticalOnKnownLocations Heap@@7 ExhaleHeap@@2 Mask@@3)) (HasDirectPerm Mask@@3 o_1@@0 f_2)) (= (MapType0Select Heap@@7 o_1@@0 f_2) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2)))))
 :qid |stdinbpl.42:22|
 :skolemid |1|
 :pattern ( (IdenticalOnKnownLocations Heap@@7 ExhaleHeap@@2 Mask@@3) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2))
)))
(assert  (and (= (type dummyHeap) (MapType0Type RefType)) (= (type ZeroMask) (MapType1Type RefType realType))))
(assert (state dummyHeap ZeroMask))
(assert (forall ((p T@U) (v_1 T@U) (w T@U) ) (! (let ((A@@2 (FieldTypeInv0 (type p))))
 (=> (and (and (= (type p) (FieldType A@@2 FrameTypeType)) (= (type v_1) FrameTypeType)) (= (type w) FrameTypeType)) (not (InsidePredicate p v_1 p w))))
 :qid |stdinbpl.170:19|
 :skolemid |21|
 :pattern ( (InsidePredicate p v_1 p w))
)))
(assert  (not (IsPredicateField f_7)))
(assert  (not (IsWandField f_7)))
(assert  (not (IsPredicateField next)))
(assert  (not (IsWandField next)))
(assert (forall ((Heap@@8 T@U) (ExhaleHeap@@3 T@U) (Mask@@4 T@U) ) (!  (=> (and (and (and (= (type Heap@@8) (MapType0Type RefType)) (= (type ExhaleHeap@@3) (MapType0Type RefType))) (= (type Mask@@4) (MapType1Type RefType realType))) (IdenticalOnKnownLocations Heap@@8 ExhaleHeap@@3 Mask@@4)) (succHeap Heap@@8 ExhaleHeap@@3))
 :qid |stdinbpl.83:15|
 :skolemid |10|
 :pattern ( (IdenticalOnKnownLocations Heap@@8 ExhaleHeap@@3 Mask@@4))
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
(assert  (and (forall ((arg0@@33 Real) (arg1@@9 T@U) ) (! (= (type (ConditionalFrame arg0@@33 arg1@@9)) FrameTypeType)
 :qid |funType:ConditionalFrame|
 :pattern ( (ConditionalFrame arg0@@33 arg1@@9))
)) (= (type EmptyFrame) FrameTypeType)))
(assert (forall ((p@@0 Real) (f_6 T@U) ) (!  (=> (= (type f_6) FrameTypeType) (= (ConditionalFrame p@@0 f_6) (ite (> p@@0 0.0) f_6 EmptyFrame)))
 :qid |stdinbpl.158:15|
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
(assert (forall ((Heap@@9 T@U) (ExhaleHeap@@4 T@U) (Mask@@6 T@U) (pm_f@@1 T@U) ) (! (let ((C@@1 (FieldTypeInv0 (type pm_f@@1))))
 (=> (and (and (and (and (and (= (type Heap@@9) (MapType0Type RefType)) (= (type ExhaleHeap@@4) (MapType0Type RefType))) (= (type Mask@@6) (MapType1Type RefType realType))) (= (type pm_f@@1) (FieldType C@@1 FrameTypeType))) (IdenticalOnKnownLocations Heap@@9 ExhaleHeap@@4 Mask@@6)) (and (HasDirectPerm Mask@@6 null pm_f@@1) (IsPredicateField pm_f@@1))) (forall ((o2 T@U) (f_2@@0 T@U) ) (! (let ((B@@5 (FieldTypeInv1 (type f_2@@0))))
(let ((A@@6 (FieldTypeInv0 (type f_2@@0))))
 (=> (and (and (= (type o2) RefType) (= (type f_2@@0) (FieldType A@@6 B@@5))) (U_2_bool (MapType1Select (MapType0Select Heap@@9 null (PredicateMaskField pm_f@@1)) o2 f_2@@0))) (= (MapType0Select Heap@@9 o2 f_2@@0) (MapType0Select ExhaleHeap@@4 o2 f_2@@0)))))
 :qid |stdinbpl.54:134|
 :skolemid |3|
 :pattern ( (MapType0Select ExhaleHeap@@4 o2 f_2@@0))
))))
 :qid |stdinbpl.52:19|
 :skolemid |4|
 :pattern ( (IdenticalOnKnownLocations Heap@@9 ExhaleHeap@@4 Mask@@6) (IsPredicateField pm_f@@1))
)))
(assert (forall ((Heap@@10 T@U) (ExhaleHeap@@5 T@U) (Mask@@7 T@U) (pm_f@@2 T@U) ) (! (let ((C@@2 (FieldTypeInv0 (type pm_f@@2))))
 (=> (and (and (and (and (and (= (type Heap@@10) (MapType0Type RefType)) (= (type ExhaleHeap@@5) (MapType0Type RefType))) (= (type Mask@@7) (MapType1Type RefType realType))) (= (type pm_f@@2) (FieldType C@@2 FrameTypeType))) (IdenticalOnKnownLocations Heap@@10 ExhaleHeap@@5 Mask@@7)) (and (HasDirectPerm Mask@@7 null pm_f@@2) (IsWandField pm_f@@2))) (forall ((o2@@0 T@U) (f_2@@1 T@U) ) (! (let ((B@@6 (FieldTypeInv1 (type f_2@@1))))
(let ((A@@7 (FieldTypeInv0 (type f_2@@1))))
 (=> (and (and (= (type o2@@0) RefType) (= (type f_2@@1) (FieldType A@@7 B@@6))) (U_2_bool (MapType1Select (MapType0Select Heap@@10 null (WandMaskField pm_f@@2)) o2@@0 f_2@@1))) (= (MapType0Select Heap@@10 o2@@0 f_2@@1) (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1)))))
 :qid |stdinbpl.67:129|
 :skolemid |6|
 :pattern ( (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1))
))))
 :qid |stdinbpl.65:19|
 :skolemid |7|
 :pattern ( (IdenticalOnKnownLocations Heap@@10 ExhaleHeap@@5 Mask@@7) (IsWandField pm_f@@2))
)))
(assert (forall ((r_1@@15 T@U) ) (!  (=> (= (type r_1@@15) RefType) (= (getPredWandId (valid r_1@@15)) 0))
 :qid |stdinbpl.201:15|
 :skolemid |24|
 :pattern ( (valid r_1@@15))
)))
(assert (forall ((r_1@@16 T@U) ) (!  (=> (= (type r_1@@16) RefType) (= (getPredWandId (deeper r_1@@16)) 1))
 :qid |stdinbpl.271:15|
 :skolemid |30|
 :pattern ( (deeper r_1@@16))
)))
(assert (forall ((r_1@@17 T@U) ) (!  (=> (= (type r_1@@17) RefType) (= (getPredWandId (strange r_1@@17)) 2))
 :qid |stdinbpl.487:15|
 :skolemid |40|
 :pattern ( (strange r_1@@17))
)))
(assert (forall ((r_1@@18 T@U) ) (!  (=> (= (type r_1@@18) RefType) (= (getPredWandId (deeperfalse r_1@@18)) 3))
 :qid |stdinbpl.745:15|
 :skolemid |50|
 :pattern ( (deeperfalse r_1@@18))
)))
(assert (forall ((Mask@@8 T@U) (o_2@@2 T@U) (f_4@@2 T@U) ) (! (let ((B@@7 (FieldTypeInv1 (type f_4@@2))))
(let ((A@@8 (FieldTypeInv0 (type f_4@@2))))
 (=> (and (and (and (= (type Mask@@8) (MapType1Type RefType realType)) (= (type o_2@@2) RefType)) (= (type f_4@@2) (FieldType A@@8 B@@7))) (GoodMask Mask@@8)) (and (>= (U_2_real (MapType1Select Mask@@8 o_2@@2 f_4@@2)) NoPerm) (=> (and (and (GoodMask Mask@@8) (not (IsPredicateField f_4@@2))) (not (IsWandField f_4@@2))) (<= (U_2_real (MapType1Select Mask@@8 o_2@@2 f_4@@2)) FullPerm))))))
 :qid |stdinbpl.128:22|
 :skolemid |16|
 :pattern ( (GoodMask Mask@@8) (MapType1Select Mask@@8 o_2@@2 f_4@@2))
)))
(assert (forall ((o T@U) (f T@U) (Heap@@11 T@U) ) (!  (=> (and (and (and (= (type o) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap@@11) (MapType0Type RefType))) (U_2_bool (MapType0Select Heap@@11 o $allocated))) (U_2_bool (MapType0Select Heap@@11 (MapType0Select Heap@@11 o f) $allocated)))
 :qid |stdinbpl.31:15|
 :skolemid |0|
 :pattern ( (MapType0Select Heap@@11 o f))
)))
(assert (forall ((r_1@@19 T@U) ) (!  (=> (= (type r_1@@19) RefType) (= (PredicateMaskField (valid r_1@@19)) (|valid#sm| r_1@@19)))
 :qid |stdinbpl.193:15|
 :skolemid |22|
 :pattern ( (PredicateMaskField (valid r_1@@19)))
)))
(assert (forall ((r_1@@20 T@U) ) (!  (=> (= (type r_1@@20) RefType) (= (PredicateMaskField (deeper r_1@@20)) (|deeper#sm| r_1@@20)))
 :qid |stdinbpl.263:15|
 :skolemid |28|
 :pattern ( (PredicateMaskField (deeper r_1@@20)))
)))
(assert (forall ((r_1@@21 T@U) ) (!  (=> (= (type r_1@@21) RefType) (= (PredicateMaskField (strange r_1@@21)) (|strange#sm| r_1@@21)))
 :qid |stdinbpl.479:15|
 :skolemid |38|
 :pattern ( (PredicateMaskField (strange r_1@@21)))
)))
(assert (forall ((r_1@@22 T@U) ) (!  (=> (= (type r_1@@22) RefType) (= (PredicateMaskField (deeperfalse r_1@@22)) (|deeperfalse#sm| r_1@@22)))
 :qid |stdinbpl.737:15|
 :skolemid |48|
 :pattern ( (PredicateMaskField (deeperfalse r_1@@22)))
)))
(assert (forall ((Heap@@12 T@U) (o@@0 T@U) (f_3 T@U) (v T@U) ) (! (let ((B@@8 (type v)))
(let ((A@@9 (FieldTypeInv0 (type f_3))))
 (=> (and (and (= (type Heap@@12) (MapType0Type RefType)) (= (type o@@0) RefType)) (= (type f_3) (FieldType A@@9 B@@8))) (succHeap Heap@@12 (MapType0Store Heap@@12 o@@0 f_3 v)))))
 :qid |stdinbpl.78:22|
 :skolemid |9|
 :pattern ( (MapType0Store Heap@@12 o@@0 f_3 v))
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
 :qid |stdinbpl.165:25|
 :skolemid |20|
 :pattern ( (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
; Invalid

(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun PostHeap@4 () T@U)
(declare-fun r_1@@23 () T@U)
(declare-fun UnfoldingMask@64 () T@U)
(declare-fun UnfoldingMask@62 () T@U)
(declare-fun UnfoldingMask@63 () T@U)
(declare-fun PostMask@0 () T@U)
(declare-fun CombineFrames (T@U T@U) T@U)
(declare-fun FrameFragment (T@U) T@U)
(declare-fun UnfoldingMask@60 () T@U)
(declare-fun UnfoldingMask@61 () T@U)
(declare-fun PostHeap@2 () T@U)
(declare-fun newPMask@12 () T@U)
(declare-fun PostHeap@3 () T@U)
(declare-fun PostHeap@0 () T@U)
(declare-fun UnfoldingMask@59 () T@U)
(declare-fun PostHeap@1 () T@U)
(declare-fun UnfoldingMask@57 () T@U)
(declare-fun UnfoldingMask@58 () T@U)
(declare-fun UnfoldingMask@55 () T@U)
(declare-fun UnfoldingMask@56 () T@U)
(declare-fun Heap@59 () T@U)
(declare-fun UnfoldingMask@54 () T@U)
(declare-fun UnfoldingMask@52 () T@U)
(declare-fun UnfoldingMask@53 () T@U)
(declare-fun Mask@12 () T@U)
(declare-fun UnfoldingMask@50 () T@U)
(declare-fun UnfoldingMask@51 () T@U)
(declare-fun Heap@57 () T@U)
(declare-fun newPMask@11 () T@U)
(declare-fun Heap@58 () T@U)
(declare-fun ExhaleHeap@0 () T@U)
(declare-fun UnfoldingMask@49 () T@U)
(declare-fun Heap@56 () T@U)
(declare-fun UnfoldingMask@47 () T@U)
(declare-fun UnfoldingMask@48 () T@U)
(declare-fun UnfoldingMask@45 () T@U)
(declare-fun UnfoldingMask@46 () T@U)
(declare-fun Mask@11 () T@U)
(declare-fun Heap@53 () T@U)
(declare-fun Heap@55 () T@U)
(declare-fun newPMask@10 () T@U)
(declare-fun Heap@54 () T@U)
(declare-fun Heap@51 () T@U)
(declare-fun UnfoldingMask@44 () T@U)
(declare-fun Heap@52 () T@U)
(declare-fun UnfoldingMask@42 () T@U)
(declare-fun UnfoldingMask@43 () T@U)
(declare-fun UnfoldingMask@40 () T@U)
(declare-fun Mask@25 () T@U)
(declare-fun UnfoldingMask@41 () T@U)
(declare-fun Mask@26 () T@U)
(declare-fun Heap@49 () T@U)
(declare-fun newPMask@9 () T@U)
(declare-fun Heap@50 () T@U)
(declare-fun Heap@47 () T@U)
(declare-fun UnfoldingMask@39 () T@U)
(declare-fun Heap@48 () T@U)
(declare-fun UnfoldingMask@37 () T@U)
(declare-fun UnfoldingMask@38 () T@U)
(declare-fun UnfoldingMask@35 () T@U)
(declare-fun UnfoldingMask@36 () T@U)
(declare-fun Heap@45 () T@U)
(declare-fun newPMask@8 () T@U)
(declare-fun Heap@46 () T@U)
(declare-fun Heap@44 () T@U)
(declare-fun Heap@43 () T@U)
(declare-fun Heap@40 () T@U)
(declare-fun Heap@41 () T@U)
(declare-fun Heap@42 () T@U)
(declare-fun freshVersion@1 () T@U)
(declare-fun Mask@24 () T@U)
(declare-fun Mask@23 () T@U)
(declare-fun Mask@22 () T@U)
(declare-fun Mask@21 () T@U)
(declare-fun Mask@20 () T@U)
(declare-fun Heap@39 () T@U)
(declare-fun Mask@18 () T@U)
(declare-fun Mask@19 () T@U)
(declare-fun Mask@17 () T@U)
(declare-fun Mask@16 () T@U)
(declare-fun Heap@37 () T@U)
(declare-fun Heap@38 () T@U)
(declare-fun newVersion@1 () T@U)
(declare-fun Mask@13 () T@U)
(declare-fun j@0 () Int)
(declare-fun j@1 () Int)
(declare-fun Heap@35 () T@U)
(declare-fun newPMask@7 () T@U)
(declare-fun Heap@36 () T@U)
(declare-fun Heap@33 () T@U)
(declare-fun UnfoldingMask@34 () T@U)
(declare-fun Heap@34 () T@U)
(declare-fun UnfoldingMask@32 () T@U)
(declare-fun UnfoldingMask@33 () T@U)
(declare-fun UnfoldingMask@30 () T@U)
(declare-fun UnfoldingMask@31 () T@U)
(declare-fun Heap@31 () T@U)
(declare-fun newPMask@6 () T@U)
(declare-fun Heap@32 () T@U)
(declare-fun UnfoldingMask@29 () T@U)
(declare-fun Heap@30 () T@U)
(declare-fun UnfoldingMask@12 () T@U)
(declare-fun UnfoldingMask@28 () T@U)
(declare-fun UnfoldingMask@10 () T@U)
(declare-fun UnfoldingMask@11 () T@U)
(declare-fun Heap@27 () T@U)
(declare-fun Heap@29 () T@U)
(declare-fun newPMask@5 () T@U)
(declare-fun Heap@28 () T@U)
(declare-fun Heap@25 () T@U)
(declare-fun UnfoldingMask@27 () T@U)
(declare-fun Heap@26 () T@U)
(declare-fun UnfoldingMask@25 () T@U)
(declare-fun UnfoldingMask@26 () T@U)
(declare-fun UnfoldingMask@23 () T@U)
(declare-fun Mask@14 () T@U)
(declare-fun UnfoldingMask@24 () T@U)
(declare-fun Mask@15 () T@U)
(declare-fun Heap@23 () T@U)
(declare-fun newPMask@4 () T@U)
(declare-fun Heap@24 () T@U)
(declare-fun Heap@21 () T@U)
(declare-fun UnfoldingMask@22 () T@U)
(declare-fun Heap@22 () T@U)
(declare-fun UnfoldingMask@20 () T@U)
(declare-fun UnfoldingMask@21 () T@U)
(declare-fun UnfoldingMask@18 () T@U)
(declare-fun UnfoldingMask@19 () T@U)
(declare-fun Heap@19 () T@U)
(declare-fun newPMask@3 () T@U)
(declare-fun Heap@20 () T@U)
(declare-fun UnfoldingMask@17 () T@U)
(declare-fun Heap@18 () T@U)
(declare-fun UnfoldingMask@15 () T@U)
(declare-fun UnfoldingMask@16 () T@U)
(declare-fun UnfoldingMask@13 () T@U)
(declare-fun UnfoldingMask@14 () T@U)
(declare-fun Heap@17 () T@U)
(declare-fun Heap@15 () T@U)
(declare-fun newPMask@2 () T@U)
(declare-fun Heap@16 () T@U)
(declare-fun Heap@13 () T@U)
(declare-fun UnfoldingMask@9 () T@U)
(declare-fun Heap@14 () T@U)
(declare-fun UnfoldingMask@7 () T@U)
(declare-fun UnfoldingMask@8 () T@U)
(declare-fun UnfoldingMask@5 () T@U)
(declare-fun Mask@10 () T@U)
(declare-fun UnfoldingMask@6 () T@U)
(declare-fun Heap@11 () T@U)
(declare-fun newPMask@1 () T@U)
(declare-fun Heap@12 () T@U)
(declare-fun Heap@9 () T@U)
(declare-fun UnfoldingMask@4 () T@U)
(declare-fun Heap@10 () T@U)
(declare-fun UnfoldingMask@2 () T@U)
(declare-fun UnfoldingMask@3 () T@U)
(declare-fun UnfoldingMask@0 () T@U)
(declare-fun UnfoldingMask@1 () T@U)
(declare-fun Heap@7 () T@U)
(declare-fun newPMask@0 () T@U)
(declare-fun Heap@8 () T@U)
(declare-fun Heap@6 () T@U)
(declare-fun Heap@5 () T@U)
(declare-fun Heap@2 () T@U)
(declare-fun Heap@3 () T@U)
(declare-fun Heap@4 () T@U)
(declare-fun freshVersion@0 () T@U)
(declare-fun Mask@9 () T@U)
(declare-fun Mask@8 () T@U)
(declare-fun Mask@7 () T@U)
(declare-fun Mask@6 () T@U)
(declare-fun Mask@5 () T@U)
(declare-fun Heap@1 () T@U)
(declare-fun Mask@3 () T@U)
(declare-fun Mask@4 () T@U)
(declare-fun Mask@2 () T@U)
(declare-fun Mask@1 () T@U)
(declare-fun Heap@@13 () T@U)
(declare-fun Heap@0 () T@U)
(declare-fun newVersion@0 () T@U)
(declare-fun Mask@0 () T@U)
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (= (type Heap@27) (MapType0Type RefType)) (= (type r_1@@23) RefType)) (= (type newPMask@5) (MapType1Type RefType boolType))) (= (type Heap@28) (MapType0Type RefType))) (= (type Heap@29) (MapType0Type RefType))) (= (type Heap@25) (MapType0Type RefType))) (= (type UnfoldingMask@27) (MapType1Type RefType realType))) (= (type Heap@26) (MapType0Type RefType))) (= (type UnfoldingMask@26) (MapType1Type RefType realType))) (= (type UnfoldingMask@25) (MapType1Type RefType realType))) (= (type UnfoldingMask@23) (MapType1Type RefType realType))) (= (type Mask@14) (MapType1Type RefType realType))) (= (type UnfoldingMask@24) (MapType1Type RefType realType))) (= (type Mask@15) (MapType1Type RefType realType))) (forall ((arg0@@34 T@U) (arg1@@10 T@U) ) (! (= (type (CombineFrames arg0@@34 arg1@@10)) FrameTypeType)
 :qid |funType:CombineFrames|
 :pattern ( (CombineFrames arg0@@34 arg1@@10))
))) (forall ((arg0@@35 T@U) ) (! (= (type (FrameFragment arg0@@35)) FrameTypeType)
 :qid |funType:FrameFragment|
 :pattern ( (FrameFragment arg0@@35))
))) (= (type Heap@23) (MapType0Type RefType))) (= (type newPMask@4) (MapType1Type RefType boolType))) (= (type Heap@24) (MapType0Type RefType))) (= (type Heap@21) (MapType0Type RefType))) (= (type UnfoldingMask@22) (MapType1Type RefType realType))) (= (type Heap@22) (MapType0Type RefType))) (= (type UnfoldingMask@21) (MapType1Type RefType realType))) (= (type UnfoldingMask@20) (MapType1Type RefType realType))) (= (type UnfoldingMask@18) (MapType1Type RefType realType))) (= (type UnfoldingMask@19) (MapType1Type RefType realType))) (= (type Heap@19) (MapType0Type RefType))) (= (type newPMask@3) (MapType1Type RefType boolType))) (= (type Heap@20) (MapType0Type RefType))) (= (type ExhaleHeap@0) (MapType0Type RefType))) (= (type UnfoldingMask@17) (MapType1Type RefType realType))) (= (type Heap@18) (MapType0Type RefType))) (= (type UnfoldingMask@16) (MapType1Type RefType realType))) (= (type UnfoldingMask@15) (MapType1Type RefType realType))) (= (type Mask@11) (MapType1Type RefType realType))) (= (type UnfoldingMask@13) (MapType1Type RefType realType))) (= (type UnfoldingMask@14) (MapType1Type RefType realType))) (= (type Heap@53) (MapType0Type RefType))) (= (type newPMask@10) (MapType1Type RefType boolType))) (= (type Heap@54) (MapType0Type RefType))) (= (type Heap@55) (MapType0Type RefType))) (= (type Heap@51) (MapType0Type RefType))) (= (type UnfoldingMask@44) (MapType1Type RefType realType))) (= (type Heap@52) (MapType0Type RefType))) (= (type UnfoldingMask@43) (MapType1Type RefType realType))) (= (type UnfoldingMask@42) (MapType1Type RefType realType))) (= (type UnfoldingMask@40) (MapType1Type RefType realType))) (= (type Mask@25) (MapType1Type RefType realType))) (= (type UnfoldingMask@41) (MapType1Type RefType realType))) (= (type Mask@26) (MapType1Type RefType realType))) (= (type Heap@49) (MapType0Type RefType))) (= (type newPMask@9) (MapType1Type RefType boolType))) (= (type Heap@50) (MapType0Type RefType))) (= (type Heap@47) (MapType0Type RefType))) (= (type UnfoldingMask@39) (MapType1Type RefType realType))) (= (type Heap@48) (MapType0Type RefType))) (= (type UnfoldingMask@38) (MapType1Type RefType realType))) (= (type UnfoldingMask@37) (MapType1Type RefType realType))) (= (type UnfoldingMask@35) (MapType1Type RefType realType))) (= (type UnfoldingMask@36) (MapType1Type RefType realType))) (= (type Heap@45) (MapType0Type RefType))) (= (type newPMask@8) (MapType1Type RefType boolType))) (= (type Heap@46) (MapType0Type RefType))) (= (type Heap@44) (MapType0Type RefType))) (= (type Heap@43) (MapType0Type RefType))) (= (type Heap@41) (MapType0Type RefType))) (= (type Heap@40) (MapType0Type RefType))) (= (type Heap@42) (MapType0Type RefType))) (= (type freshVersion@1) FrameTypeType)) (= (type Mask@24) (MapType1Type RefType realType))) (= (type Mask@22) (MapType1Type RefType realType))) (= (type Mask@23) (MapType1Type RefType realType))) (= (type Mask@21) (MapType1Type RefType realType))) (= (type Mask@20) (MapType1Type RefType realType))) (= (type Heap@39) (MapType0Type RefType))) (= (type Mask@19) (MapType1Type RefType realType))) (= (type Mask@18) (MapType1Type RefType realType))) (= (type Mask@17) (MapType1Type RefType realType))) (= (type Mask@16) (MapType1Type RefType realType))) (= (type Heap@38) (MapType0Type RefType))) (= (type Heap@37) (MapType0Type RefType))) (= (type newVersion@1) FrameTypeType)) (= (type Mask@13) (MapType1Type RefType realType))) (= (type Heap@35) (MapType0Type RefType))) (= (type newPMask@7) (MapType1Type RefType boolType))) (= (type Heap@36) (MapType0Type RefType))) (= (type Heap@33) (MapType0Type RefType))) (= (type UnfoldingMask@34) (MapType1Type RefType realType))) (= (type Heap@34) (MapType0Type RefType))) (= (type UnfoldingMask@33) (MapType1Type RefType realType))) (= (type UnfoldingMask@32) (MapType1Type RefType realType))) (= (type UnfoldingMask@30) (MapType1Type RefType realType))) (= (type UnfoldingMask@31) (MapType1Type RefType realType))) (= (type Heap@31) (MapType0Type RefType))) (= (type newPMask@6) (MapType1Type RefType boolType))) (= (type Heap@32) (MapType0Type RefType))) (= (type UnfoldingMask@29) (MapType1Type RefType realType))) (= (type Heap@30) (MapType0Type RefType))) (= (type UnfoldingMask@28) (MapType1Type RefType realType))) (= (type UnfoldingMask@12) (MapType1Type RefType realType))) (= (type UnfoldingMask@10) (MapType1Type RefType realType))) (= (type UnfoldingMask@11) (MapType1Type RefType realType))) (= (type Heap@59) (MapType0Type RefType))) (= (type UnfoldingMask@53) (MapType1Type RefType realType))) (= (type UnfoldingMask@52) (MapType1Type RefType realType))) (= (type UnfoldingMask@54) (MapType1Type RefType realType))) (= (type Mask@12) (MapType1Type RefType realType))) (= (type UnfoldingMask@50) (MapType1Type RefType realType))) (= (type UnfoldingMask@51) (MapType1Type RefType realType))) (= (type Heap@57) (MapType0Type RefType))) (= (type newPMask@11) (MapType1Type RefType boolType))) (= (type Heap@58) (MapType0Type RefType))) (= (type UnfoldingMask@49) (MapType1Type RefType realType))) (= (type Heap@56) (MapType0Type RefType))) (= (type UnfoldingMask@48) (MapType1Type RefType realType))) (= (type UnfoldingMask@47) (MapType1Type RefType realType))) (= (type UnfoldingMask@45) (MapType1Type RefType realType))) (= (type UnfoldingMask@46) (MapType1Type RefType realType))) (= (type Heap@17) (MapType0Type RefType))) (= (type Heap@15) (MapType0Type RefType))) (= (type newPMask@2) (MapType1Type RefType boolType))) (= (type Heap@16) (MapType0Type RefType))) (= (type Heap@13) (MapType0Type RefType))) (= (type UnfoldingMask@9) (MapType1Type RefType realType))) (= (type Heap@14) (MapType0Type RefType))) (= (type UnfoldingMask@8) (MapType1Type RefType realType))) (= (type UnfoldingMask@7) (MapType1Type RefType realType))) (= (type UnfoldingMask@5) (MapType1Type RefType realType))) (= (type Mask@10) (MapType1Type RefType realType))) (= (type UnfoldingMask@6) (MapType1Type RefType realType))) (= (type Heap@11) (MapType0Type RefType))) (= (type newPMask@1) (MapType1Type RefType boolType))) (= (type Heap@12) (MapType0Type RefType))) (= (type Heap@9) (MapType0Type RefType))) (= (type UnfoldingMask@4) (MapType1Type RefType realType))) (= (type Heap@10) (MapType0Type RefType))) (= (type UnfoldingMask@3) (MapType1Type RefType realType))) (= (type UnfoldingMask@2) (MapType1Type RefType realType))) (= (type UnfoldingMask@0) (MapType1Type RefType realType))) (= (type UnfoldingMask@1) (MapType1Type RefType realType))) (= (type Heap@7) (MapType0Type RefType))) (= (type newPMask@0) (MapType1Type RefType boolType))) (= (type Heap@8) (MapType0Type RefType))) (= (type Heap@6) (MapType0Type RefType))) (= (type Heap@5) (MapType0Type RefType))) (= (type Heap@3) (MapType0Type RefType))) (= (type Heap@2) (MapType0Type RefType))) (= (type Heap@4) (MapType0Type RefType))) (= (type freshVersion@0) FrameTypeType)) (= (type Mask@9) (MapType1Type RefType realType))) (= (type Mask@7) (MapType1Type RefType realType))) (= (type Mask@8) (MapType1Type RefType realType))) (= (type Mask@6) (MapType1Type RefType realType))) (= (type Mask@5) (MapType1Type RefType realType))) (= (type Heap@1) (MapType0Type RefType))) (= (type Mask@4) (MapType1Type RefType realType))) (= (type Mask@3) (MapType1Type RefType realType))) (= (type Mask@2) (MapType1Type RefType realType))) (= (type Mask@1) (MapType1Type RefType realType))) (= (type Heap@0) (MapType0Type RefType))) (= (type Heap@@13) (MapType0Type RefType))) (= (type newVersion@0) FrameTypeType)) (= (type Mask@0) (MapType1Type RefType realType))) (= (type PostHeap@4) (MapType0Type RefType))) (= (type UnfoldingMask@63) (MapType1Type RefType realType))) (= (type UnfoldingMask@62) (MapType1Type RefType realType))) (= (type UnfoldingMask@64) (MapType1Type RefType realType))) (= (type PostMask@0) (MapType1Type RefType realType))) (= (type UnfoldingMask@60) (MapType1Type RefType realType))) (= (type UnfoldingMask@61) (MapType1Type RefType realType))) (= (type PostHeap@2) (MapType0Type RefType))) (= (type newPMask@12) (MapType1Type RefType boolType))) (= (type PostHeap@3) (MapType0Type RefType))) (= (type PostHeap@0) (MapType0Type RefType))) (= (type UnfoldingMask@59) (MapType1Type RefType realType))) (= (type PostHeap@1) (MapType0Type RefType))) (= (type UnfoldingMask@58) (MapType1Type RefType realType))) (= (type UnfoldingMask@57) (MapType1Type RefType realType))) (= (type UnfoldingMask@55) (MapType1Type RefType realType))) (= (type UnfoldingMask@56) (MapType1Type RefType realType))))
(set-info :boogie-vc-id t10)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 197) (let ((anon9_correct true))
(let ((anon119_Else_correct  (=> (= (MapType0Select PostHeap@4 r_1@@23 next) null) (=> (and (= UnfoldingMask@64 UnfoldingMask@62) (= (ControlFlow 0 183) 181)) anon9_correct))))
(let ((anon119_Then_correct  (=> (and (not (= (MapType0Select PostHeap@4 r_1@@23 next) null)) (= UnfoldingMask@63 (MapType1Store UnfoldingMask@62 null (valid (MapType0Select PostHeap@4 r_1@@23 next)) (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@62 null (valid (MapType0Select PostHeap@4 r_1@@23 next)))) FullPerm))))) (=> (and (and (InsidePredicate (valid r_1@@23) (MapType0Select PostHeap@4 null (valid r_1@@23)) (valid (MapType0Select PostHeap@4 r_1@@23 next)) (MapType0Select PostHeap@4 null (valid (MapType0Select PostHeap@4 r_1@@23 next)))) (state PostHeap@4 UnfoldingMask@63)) (and (= UnfoldingMask@64 UnfoldingMask@63) (= (ControlFlow 0 182) 181))) anon9_correct))))
(let ((anon7_correct  (=> (and (state PostHeap@4 PostMask@0) (|valid#trigger| PostHeap@4 (valid r_1@@23))) (=> (and (and (and (= (MapType0Select PostHeap@4 null (valid r_1@@23)) (CombineFrames (FrameFragment (MapType0Select PostHeap@4 r_1@@23 f_7)) (CombineFrames (FrameFragment (MapType0Select PostHeap@4 r_1@@23 next)) (FrameFragment (ite (not (= (MapType0Select PostHeap@4 r_1@@23 next) null)) (MapType0Select PostHeap@4 null (valid (MapType0Select PostHeap@4 r_1@@23 next))) EmptyFrame))))) (= UnfoldingMask@60 (MapType1Store PostMask@0 null (valid r_1@@23) (real_2_U (- (U_2_real (MapType1Select PostMask@0 null (valid r_1@@23))) FullPerm))))) (and (not (= r_1@@23 null)) (= UnfoldingMask@61 (MapType1Store UnfoldingMask@60 r_1@@23 f_7 (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@60 r_1@@23 f_7)) FullPerm)))))) (and (and (state PostHeap@4 UnfoldingMask@61) (not (= r_1@@23 null))) (and (= UnfoldingMask@62 (MapType1Store UnfoldingMask@61 r_1@@23 next (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@61 r_1@@23 next)) FullPerm)))) (state PostHeap@4 UnfoldingMask@62)))) (and (=> (= (ControlFlow 0 184) 182) anon119_Then_correct) (=> (= (ControlFlow 0 184) 183) anon119_Else_correct))))))
(let ((anon118_Else_correct  (=> (= (MapType0Select PostHeap@2 r_1@@23 next) null) (=> (and (= PostHeap@4 PostHeap@2) (= (ControlFlow 0 186) 184)) anon7_correct))))
(let ((anon118_Then_correct  (=> (not (= (MapType0Select PostHeap@2 r_1@@23 next) null)) (=> (and (and (forall ((o_36 T@U) (f_41 T@U) ) (! (let ((B@@11 (FieldTypeInv1 (type f_41))))
(let ((A@@12 (FieldTypeInv0 (type f_41))))
 (=> (and (and (= (type o_36) RefType) (= (type f_41) (FieldType A@@12 B@@11))) (or (U_2_bool (MapType1Select (MapType0Select PostHeap@2 null (|valid#sm| r_1@@23)) o_36 f_41)) (U_2_bool (MapType1Select (MapType0Select PostHeap@2 null (|valid#sm| (MapType0Select PostHeap@2 r_1@@23 next))) o_36 f_41)))) (U_2_bool (MapType1Select newPMask@12 o_36 f_41)))))
 :qid |stdinbpl.2228:33|
 :skolemid |79|
 :pattern ( (MapType1Select newPMask@12 o_36 f_41))
)) (= PostHeap@3 (MapType0Store PostHeap@2 null (|valid#sm| r_1@@23) newPMask@12))) (and (= PostHeap@4 PostHeap@3) (= (ControlFlow 0 185) 184))) anon7_correct))))
(let ((anon5_correct  (=> (state PostHeap@0 UnfoldingMask@59) (and (=> (= (ControlFlow 0 187) (- 0 188)) (HasDirectPerm UnfoldingMask@59 r_1@@23 f_7)) (=> (HasDirectPerm UnfoldingMask@59 r_1@@23 f_7) (=> (and (= PostHeap@1 (MapType0Store PostHeap@0 null (|valid#sm| r_1@@23) (MapType1Store (MapType0Select PostHeap@0 null (|valid#sm| r_1@@23)) r_1@@23 f_7 (bool_2_U true)))) (= PostHeap@2 (MapType0Store PostHeap@1 null (|valid#sm| r_1@@23) (MapType1Store (MapType0Select PostHeap@1 null (|valid#sm| r_1@@23)) r_1@@23 next (bool_2_U true))))) (and (=> (= (ControlFlow 0 187) 185) anon118_Then_correct) (=> (= (ControlFlow 0 187) 186) anon118_Else_correct))))))))
(let ((anon117_Else_correct  (=> (= (MapType0Select PostHeap@0 r_1@@23 next) null) (=> (and (= UnfoldingMask@59 UnfoldingMask@57) (= (ControlFlow 0 190) 187)) anon5_correct))))
(let ((anon117_Then_correct  (=> (and (not (= (MapType0Select PostHeap@0 r_1@@23 next) null)) (= UnfoldingMask@58 (MapType1Store UnfoldingMask@57 null (valid (MapType0Select PostHeap@0 r_1@@23 next)) (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@57 null (valid (MapType0Select PostHeap@0 r_1@@23 next)))) FullPerm))))) (=> (and (and (InsidePredicate (valid r_1@@23) (MapType0Select PostHeap@0 null (valid r_1@@23)) (valid (MapType0Select PostHeap@0 r_1@@23 next)) (MapType0Select PostHeap@0 null (valid (MapType0Select PostHeap@0 r_1@@23 next)))) (state PostHeap@0 UnfoldingMask@58)) (and (= UnfoldingMask@59 UnfoldingMask@58) (= (ControlFlow 0 189) 187))) anon5_correct))))
(let ((anon3_correct  (=> (= UnfoldingMask@55 (MapType1Store PostMask@0 null (valid r_1@@23) (real_2_U (- (U_2_real (MapType1Select PostMask@0 null (valid r_1@@23))) FullPerm)))) (=> (and (not (= r_1@@23 null)) (= UnfoldingMask@56 (MapType1Store UnfoldingMask@55 r_1@@23 f_7 (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@55 r_1@@23 f_7)) FullPerm))))) (=> (and (and (state PostHeap@0 UnfoldingMask@56) (not (= r_1@@23 null))) (and (= UnfoldingMask@57 (MapType1Store UnfoldingMask@56 r_1@@23 next (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@56 r_1@@23 next)) FullPerm)))) (state PostHeap@0 UnfoldingMask@57))) (and (=> (= (ControlFlow 0 191) 189) anon117_Then_correct) (=> (= (ControlFlow 0 191) 190) anon117_Else_correct)))))))
(let ((anon116_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 194) 191)) anon3_correct)))
(let ((anon116_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 192) (- 0 193)) (<= FullPerm (U_2_real (MapType1Select PostMask@0 null (valid r_1@@23))))) (=> (<= FullPerm (U_2_real (MapType1Select PostMask@0 null (valid r_1@@23)))) (=> (= (ControlFlow 0 192) 191) anon3_correct))))))
(let ((anon115_Then_correct  (=> (state PostHeap@0 ZeroMask) (=> (and (and (= PostMask@0 (MapType1Store ZeroMask null (valid r_1@@23) (real_2_U (+ (U_2_real (MapType1Select ZeroMask null (valid r_1@@23))) FullPerm)))) (state PostHeap@0 PostMask@0)) (and (|valid#trigger| PostHeap@0 (valid r_1@@23)) (= (MapType0Select PostHeap@0 null (valid r_1@@23)) (CombineFrames (FrameFragment (MapType0Select PostHeap@0 r_1@@23 f_7)) (CombineFrames (FrameFragment (MapType0Select PostHeap@0 r_1@@23 next)) (FrameFragment (ite (not (= (MapType0Select PostHeap@0 r_1@@23 next) null)) (MapType0Select PostHeap@0 null (valid (MapType0Select PostHeap@0 r_1@@23 next))) EmptyFrame))))))) (and (=> (= (ControlFlow 0 195) 192) anon116_Then_correct) (=> (= (ControlFlow 0 195) 194) anon116_Else_correct))))))
(let ((anon51_correct true))
(let ((anon140_Else_correct  (=> (= (MapType0Select Heap@59 r_1@@23 next) null) (=> (and (= UnfoldingMask@54 UnfoldingMask@52) (= (ControlFlow 0 110) 108)) anon51_correct))))
(let ((anon140_Then_correct  (=> (and (not (= (MapType0Select Heap@59 r_1@@23 next) null)) (= UnfoldingMask@53 (MapType1Store UnfoldingMask@52 null (valid (MapType0Select Heap@59 r_1@@23 next)) (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@52 null (valid (MapType0Select Heap@59 r_1@@23 next)))) FullPerm))))) (=> (and (and (InsidePredicate (valid r_1@@23) (MapType0Select Heap@59 null (valid r_1@@23)) (valid (MapType0Select Heap@59 r_1@@23 next)) (MapType0Select Heap@59 null (valid (MapType0Select Heap@59 r_1@@23 next)))) (state Heap@59 UnfoldingMask@53)) (and (= UnfoldingMask@54 UnfoldingMask@53) (= (ControlFlow 0 109) 108))) anon51_correct))))
(let ((anon49_correct  (=> (and (state Heap@59 Mask@12) (|valid#trigger| Heap@59 (valid r_1@@23))) (=> (and (and (and (= (MapType0Select Heap@59 null (valid r_1@@23)) (CombineFrames (FrameFragment (MapType0Select Heap@59 r_1@@23 f_7)) (CombineFrames (FrameFragment (MapType0Select Heap@59 r_1@@23 next)) (FrameFragment (ite (not (= (MapType0Select Heap@59 r_1@@23 next) null)) (MapType0Select Heap@59 null (valid (MapType0Select Heap@59 r_1@@23 next))) EmptyFrame))))) (= UnfoldingMask@50 (MapType1Store Mask@12 null (valid r_1@@23) (real_2_U (- (U_2_real (MapType1Select Mask@12 null (valid r_1@@23))) FullPerm))))) (and (not (= r_1@@23 null)) (= UnfoldingMask@51 (MapType1Store UnfoldingMask@50 r_1@@23 f_7 (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@50 r_1@@23 f_7)) FullPerm)))))) (and (and (state Heap@59 UnfoldingMask@51) (not (= r_1@@23 null))) (and (= UnfoldingMask@52 (MapType1Store UnfoldingMask@51 r_1@@23 next (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@51 r_1@@23 next)) FullPerm)))) (state Heap@59 UnfoldingMask@52)))) (and (=> (= (ControlFlow 0 111) 109) anon140_Then_correct) (=> (= (ControlFlow 0 111) 110) anon140_Else_correct))))))
(let ((anon139_Else_correct  (=> (= (MapType0Select Heap@57 r_1@@23 next) null) (=> (and (= Heap@59 Heap@57) (= (ControlFlow 0 113) 111)) anon49_correct))))
(let ((anon139_Then_correct  (=> (not (= (MapType0Select Heap@57 r_1@@23 next) null)) (=> (and (and (forall ((o_40 T@U) (f_45 T@U) ) (! (let ((B@@12 (FieldTypeInv1 (type f_45))))
(let ((A@@13 (FieldTypeInv0 (type f_45))))
 (=> (and (and (= (type o_40) RefType) (= (type f_45) (FieldType A@@13 B@@12))) (or (U_2_bool (MapType1Select (MapType0Select Heap@57 null (|valid#sm| r_1@@23)) o_40 f_45)) (U_2_bool (MapType1Select (MapType0Select Heap@57 null (|valid#sm| (MapType0Select Heap@57 r_1@@23 next))) o_40 f_45)))) (U_2_bool (MapType1Select newPMask@11 o_40 f_45)))))
 :qid |stdinbpl.2519:37|
 :skolemid |83|
 :pattern ( (MapType1Select newPMask@11 o_40 f_45))
)) (= Heap@58 (MapType0Store Heap@57 null (|valid#sm| r_1@@23) newPMask@11))) (and (= Heap@59 Heap@58) (= (ControlFlow 0 112) 111))) anon49_correct))))
(let ((anon47_correct  (=> (state ExhaleHeap@0 UnfoldingMask@49) (and (=> (= (ControlFlow 0 114) (- 0 115)) (HasDirectPerm UnfoldingMask@49 r_1@@23 f_7)) (=> (HasDirectPerm UnfoldingMask@49 r_1@@23 f_7) (=> (and (= Heap@56 (MapType0Store ExhaleHeap@0 null (|valid#sm| r_1@@23) (MapType1Store (MapType0Select ExhaleHeap@0 null (|valid#sm| r_1@@23)) r_1@@23 f_7 (bool_2_U true)))) (= Heap@57 (MapType0Store Heap@56 null (|valid#sm| r_1@@23) (MapType1Store (MapType0Select Heap@56 null (|valid#sm| r_1@@23)) r_1@@23 next (bool_2_U true))))) (and (=> (= (ControlFlow 0 114) 112) anon139_Then_correct) (=> (= (ControlFlow 0 114) 113) anon139_Else_correct))))))))
(let ((anon138_Else_correct  (=> (= (MapType0Select ExhaleHeap@0 r_1@@23 next) null) (=> (and (= UnfoldingMask@49 UnfoldingMask@47) (= (ControlFlow 0 117) 114)) anon47_correct))))
(let ((anon138_Then_correct  (=> (and (not (= (MapType0Select ExhaleHeap@0 r_1@@23 next) null)) (= UnfoldingMask@48 (MapType1Store UnfoldingMask@47 null (valid (MapType0Select ExhaleHeap@0 r_1@@23 next)) (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@47 null (valid (MapType0Select ExhaleHeap@0 r_1@@23 next)))) FullPerm))))) (=> (and (and (InsidePredicate (valid r_1@@23) (MapType0Select ExhaleHeap@0 null (valid r_1@@23)) (valid (MapType0Select ExhaleHeap@0 r_1@@23 next)) (MapType0Select ExhaleHeap@0 null (valid (MapType0Select ExhaleHeap@0 r_1@@23 next)))) (state ExhaleHeap@0 UnfoldingMask@48)) (and (= UnfoldingMask@49 UnfoldingMask@48) (= (ControlFlow 0 116) 114))) anon47_correct))))
(let ((anon45_correct  (=> (= UnfoldingMask@45 (MapType1Store Mask@12 null (valid r_1@@23) (real_2_U (- (U_2_real (MapType1Select Mask@12 null (valid r_1@@23))) FullPerm)))) (=> (and (not (= r_1@@23 null)) (= UnfoldingMask@46 (MapType1Store UnfoldingMask@45 r_1@@23 f_7 (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@45 r_1@@23 f_7)) FullPerm))))) (=> (and (and (state ExhaleHeap@0 UnfoldingMask@46) (not (= r_1@@23 null))) (and (= UnfoldingMask@47 (MapType1Store UnfoldingMask@46 r_1@@23 next (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@46 r_1@@23 next)) FullPerm)))) (state ExhaleHeap@0 UnfoldingMask@47))) (and (=> (= (ControlFlow 0 118) 116) anon138_Then_correct) (=> (= (ControlFlow 0 118) 117) anon138_Else_correct)))))))
(let ((anon137_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 121) 118)) anon45_correct)))
(let ((anon137_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 119) (- 0 120)) (<= FullPerm (U_2_real (MapType1Select Mask@12 null (valid r_1@@23))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@12 null (valid r_1@@23)))) (=> (= (ControlFlow 0 119) 118) anon45_correct))))))
(let ((anon136_Then_correct  (=> (and (and (= Mask@12 (MapType1Store Mask@11 null (valid r_1@@23) (real_2_U (+ (U_2_real (MapType1Select Mask@11 null (valid r_1@@23))) FullPerm)))) (state ExhaleHeap@0 Mask@12)) (and (|valid#trigger| ExhaleHeap@0 (valid r_1@@23)) (= (MapType0Select ExhaleHeap@0 null (valid r_1@@23)) (CombineFrames (FrameFragment (MapType0Select ExhaleHeap@0 r_1@@23 f_7)) (CombineFrames (FrameFragment (MapType0Select ExhaleHeap@0 r_1@@23 next)) (FrameFragment (ite (not (= (MapType0Select ExhaleHeap@0 r_1@@23 next) null)) (MapType0Select ExhaleHeap@0 null (valid (MapType0Select ExhaleHeap@0 r_1@@23 next))) EmptyFrame))))))) (and (=> (= (ControlFlow 0 122) 119) anon137_Then_correct) (=> (= (ControlFlow 0 122) 121) anon137_Else_correct)))))
(let ((anon95_correct true))
(let ((anon162_Else_correct  (=> (= (MapType0Select Heap@53 r_1@@23 next) null) (=> (and (= Heap@55 Heap@53) (= (ControlFlow 0 35) 33)) anon95_correct))))
(let ((anon162_Then_correct  (=> (not (= (MapType0Select Heap@53 r_1@@23 next) null)) (=> (and (and (forall ((o_45 T@U) (f_50 T@U) ) (! (let ((B@@13 (FieldTypeInv1 (type f_50))))
(let ((A@@14 (FieldTypeInv0 (type f_50))))
 (=> (and (and (= (type o_45) RefType) (= (type f_50) (FieldType A@@14 B@@13))) (or (U_2_bool (MapType1Select (MapType0Select Heap@53 null (|valid#sm| r_1@@23)) o_45 f_50)) (U_2_bool (MapType1Select (MapType0Select Heap@53 null (|valid#sm| (MapType0Select Heap@53 r_1@@23 next))) o_45 f_50)))) (U_2_bool (MapType1Select newPMask@10 o_45 f_50)))))
 :qid |stdinbpl.2852:35|
 :skolemid |88|
 :pattern ( (MapType1Select newPMask@10 o_45 f_50))
)) (= Heap@54 (MapType0Store Heap@53 null (|valid#sm| r_1@@23) newPMask@10))) (and (= Heap@55 Heap@54) (= (ControlFlow 0 34) 33))) anon95_correct))))
(let ((anon93_correct  (=> (state Heap@51 UnfoldingMask@44) (and (=> (= (ControlFlow 0 36) (- 0 37)) (> (U_2_int (MapType0Select Heap@51 r_1@@23 f_7)) 2)) (=> (> (U_2_int (MapType0Select Heap@51 r_1@@23 f_7)) 2) (=> (and (= Heap@52 (MapType0Store Heap@51 null (|valid#sm| r_1@@23) (MapType1Store (MapType0Select Heap@51 null (|valid#sm| r_1@@23)) r_1@@23 f_7 (bool_2_U true)))) (= Heap@53 (MapType0Store Heap@52 null (|valid#sm| r_1@@23) (MapType1Store (MapType0Select Heap@52 null (|valid#sm| r_1@@23)) r_1@@23 next (bool_2_U true))))) (and (=> (= (ControlFlow 0 36) 34) anon162_Then_correct) (=> (= (ControlFlow 0 36) 35) anon162_Else_correct))))))))
(let ((anon161_Else_correct  (=> (= (MapType0Select Heap@51 r_1@@23 next) null) (=> (and (= UnfoldingMask@44 UnfoldingMask@42) (= (ControlFlow 0 39) 36)) anon93_correct))))
(let ((anon161_Then_correct  (=> (and (not (= (MapType0Select Heap@51 r_1@@23 next) null)) (= UnfoldingMask@43 (MapType1Store UnfoldingMask@42 null (valid (MapType0Select Heap@51 r_1@@23 next)) (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@42 null (valid (MapType0Select Heap@51 r_1@@23 next)))) FullPerm))))) (=> (and (and (InsidePredicate (valid r_1@@23) (MapType0Select Heap@51 null (valid r_1@@23)) (valid (MapType0Select Heap@51 r_1@@23 next)) (MapType0Select Heap@51 null (valid (MapType0Select Heap@51 r_1@@23 next)))) (state Heap@51 UnfoldingMask@43)) (and (= UnfoldingMask@44 UnfoldingMask@43) (= (ControlFlow 0 38) 36))) anon93_correct))))
(let ((anon91_correct  (=> (= UnfoldingMask@40 (MapType1Store Mask@25 null (valid r_1@@23) (real_2_U (- (U_2_real (MapType1Select Mask@25 null (valid r_1@@23))) FullPerm)))) (=> (and (not (= r_1@@23 null)) (= UnfoldingMask@41 (MapType1Store UnfoldingMask@40 r_1@@23 f_7 (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@40 r_1@@23 f_7)) FullPerm))))) (=> (and (and (state Heap@51 UnfoldingMask@41) (not (= r_1@@23 null))) (and (= UnfoldingMask@42 (MapType1Store UnfoldingMask@41 r_1@@23 next (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@41 r_1@@23 next)) FullPerm)))) (state Heap@51 UnfoldingMask@42))) (and (=> (= (ControlFlow 0 40) 38) anon161_Then_correct) (=> (= (ControlFlow 0 40) 39) anon161_Else_correct)))))))
(let ((anon160_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 43) 40)) anon91_correct)))
(let ((anon160_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 41) (- 0 42)) (<= FullPerm (U_2_real (MapType1Select Mask@25 null (valid r_1@@23))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@25 null (valid r_1@@23)))) (=> (= (ControlFlow 0 41) 40) anon91_correct))))))
(let ((anon89_correct  (=> (= Mask@26 (MapType1Store Mask@25 null (valid r_1@@23) (real_2_U (- (U_2_real (MapType1Select Mask@25 null (valid r_1@@23))) FullPerm)))) (=> (and (|valid#trigger| Heap@51 (valid r_1@@23)) (= (MapType0Select Heap@51 null (valid r_1@@23)) (CombineFrames (FrameFragment (MapType0Select Heap@51 r_1@@23 f_7)) (CombineFrames (FrameFragment (MapType0Select Heap@51 r_1@@23 next)) (FrameFragment (ite (not (= (MapType0Select Heap@51 r_1@@23 next) null)) (MapType0Select Heap@51 null (valid (MapType0Select Heap@51 r_1@@23 next))) EmptyFrame)))))) (and (=> (= (ControlFlow 0 44) 41) anon160_Then_correct) (=> (= (ControlFlow 0 44) 43) anon160_Else_correct))))))
(let ((anon159_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 47) 44)) anon89_correct)))
(let ((anon159_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 45) (- 0 46)) (<= FullPerm (U_2_real (MapType1Select Mask@25 null (valid r_1@@23))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@25 null (valid r_1@@23)))) (=> (= (ControlFlow 0 45) 44) anon89_correct))))))
(let ((anon87_correct  (=> (state Heap@51 Mask@25) (and (=> (= (ControlFlow 0 48) 45) anon159_Then_correct) (=> (= (ControlFlow 0 48) 47) anon159_Else_correct)))))
(let ((anon158_Else_correct  (=> (= (MapType0Select Heap@49 r_1@@23 next) null) (=> (and (= Heap@51 Heap@49) (= (ControlFlow 0 50) 48)) anon87_correct))))
(let ((anon158_Then_correct  (=> (not (= (MapType0Select Heap@49 r_1@@23 next) null)) (=> (and (and (forall ((o_44 T@U) (f_49 T@U) ) (! (let ((B@@14 (FieldTypeInv1 (type f_49))))
(let ((A@@15 (FieldTypeInv0 (type f_49))))
 (=> (and (and (= (type o_44) RefType) (= (type f_49) (FieldType A@@15 B@@14))) (or (U_2_bool (MapType1Select (MapType0Select Heap@49 null (|valid#sm| r_1@@23)) o_44 f_49)) (U_2_bool (MapType1Select (MapType0Select Heap@49 null (|valid#sm| (MapType0Select Heap@49 r_1@@23 next))) o_44 f_49)))) (U_2_bool (MapType1Select newPMask@9 o_44 f_49)))))
 :qid |stdinbpl.2798:37|
 :skolemid |87|
 :pattern ( (MapType1Select newPMask@9 o_44 f_49))
)) (= Heap@50 (MapType0Store Heap@49 null (|valid#sm| r_1@@23) newPMask@9))) (and (= Heap@51 Heap@50) (= (ControlFlow 0 49) 48))) anon87_correct))))
(let ((anon85_correct  (=> (state Heap@47 UnfoldingMask@39) (=> (and (= Heap@48 (MapType0Store Heap@47 null (|valid#sm| r_1@@23) (MapType1Store (MapType0Select Heap@47 null (|valid#sm| r_1@@23)) r_1@@23 f_7 (bool_2_U true)))) (= Heap@49 (MapType0Store Heap@48 null (|valid#sm| r_1@@23) (MapType1Store (MapType0Select Heap@48 null (|valid#sm| r_1@@23)) r_1@@23 next (bool_2_U true))))) (and (=> (= (ControlFlow 0 51) 49) anon158_Then_correct) (=> (= (ControlFlow 0 51) 50) anon158_Else_correct))))))
(let ((anon157_Else_correct  (=> (= (MapType0Select Heap@47 r_1@@23 next) null) (=> (and (= UnfoldingMask@39 UnfoldingMask@37) (= (ControlFlow 0 53) 51)) anon85_correct))))
(let ((anon157_Then_correct  (=> (and (not (= (MapType0Select Heap@47 r_1@@23 next) null)) (= UnfoldingMask@38 (MapType1Store UnfoldingMask@37 null (valid (MapType0Select Heap@47 r_1@@23 next)) (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@37 null (valid (MapType0Select Heap@47 r_1@@23 next)))) FullPerm))))) (=> (and (and (InsidePredicate (valid r_1@@23) (MapType0Select Heap@47 null (valid r_1@@23)) (valid (MapType0Select Heap@47 r_1@@23 next)) (MapType0Select Heap@47 null (valid (MapType0Select Heap@47 r_1@@23 next)))) (state Heap@47 UnfoldingMask@38)) (and (= UnfoldingMask@39 UnfoldingMask@38) (= (ControlFlow 0 52) 51))) anon85_correct))))
(let ((anon83_correct  (=> (= UnfoldingMask@35 (MapType1Store Mask@25 null (valid r_1@@23) (real_2_U (- (U_2_real (MapType1Select Mask@25 null (valid r_1@@23))) FullPerm)))) (=> (and (not (= r_1@@23 null)) (= UnfoldingMask@36 (MapType1Store UnfoldingMask@35 r_1@@23 f_7 (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@35 r_1@@23 f_7)) FullPerm))))) (=> (and (and (state Heap@47 UnfoldingMask@36) (not (= r_1@@23 null))) (and (= UnfoldingMask@37 (MapType1Store UnfoldingMask@36 r_1@@23 next (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@36 r_1@@23 next)) FullPerm)))) (state Heap@47 UnfoldingMask@37))) (and (=> (= (ControlFlow 0 54) 52) anon157_Then_correct) (=> (= (ControlFlow 0 54) 53) anon157_Else_correct)))))))
(let ((anon156_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 57) 54)) anon83_correct)))
(let ((anon156_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 55) (- 0 56)) (<= FullPerm (U_2_real (MapType1Select Mask@25 null (valid r_1@@23))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@25 null (valid r_1@@23)))) (=> (= (ControlFlow 0 55) 54) anon83_correct))))))
(let ((anon81_correct  (=> (and (and (state Heap@47 Mask@25) (state Heap@47 Mask@25)) (and (|valid#trigger| Heap@47 (valid r_1@@23)) (= (MapType0Select Heap@47 null (valid r_1@@23)) (CombineFrames (FrameFragment (MapType0Select Heap@47 r_1@@23 f_7)) (CombineFrames (FrameFragment (MapType0Select Heap@47 r_1@@23 next)) (FrameFragment (ite (not (= (MapType0Select Heap@47 r_1@@23 next) null)) (MapType0Select Heap@47 null (valid (MapType0Select Heap@47 r_1@@23 next))) EmptyFrame))))))) (and (=> (= (ControlFlow 0 58) 55) anon156_Then_correct) (=> (= (ControlFlow 0 58) 57) anon156_Else_correct)))))
(let ((anon155_Else_correct  (=> (= (MapType0Select Heap@45 r_1@@23 next) null) (=> (and (= Heap@47 Heap@45) (= (ControlFlow 0 60) 58)) anon81_correct))))
(let ((anon155_Then_correct  (=> (not (= (MapType0Select Heap@45 r_1@@23 next) null)) (=> (and (and (forall ((o_43 T@U) (f_48 T@U) ) (! (let ((B@@15 (FieldTypeInv1 (type f_48))))
(let ((A@@16 (FieldTypeInv0 (type f_48))))
 (=> (and (and (= (type o_43) RefType) (= (type f_48) (FieldType A@@16 B@@15))) (or (U_2_bool (MapType1Select (MapType0Select Heap@45 null (|valid#sm| r_1@@23)) o_43 f_48)) (U_2_bool (MapType1Select (MapType0Select Heap@45 null (|valid#sm| (MapType0Select Heap@45 r_1@@23 next))) o_43 f_48)))) (U_2_bool (MapType1Select newPMask@8 o_43 f_48)))))
 :qid |stdinbpl.2752:37|
 :skolemid |86|
 :pattern ( (MapType1Select newPMask@8 o_43 f_48))
)) (= Heap@46 (MapType0Store Heap@45 null (|valid#sm| r_1@@23) newPMask@8))) (and (= Heap@47 Heap@46) (= (ControlFlow 0 59) 58))) anon81_correct))))
(let ((anon79_correct  (=> (and (= Heap@44 (MapType0Store Heap@43 null (|valid#sm| r_1@@23) (MapType1Store (MapType0Select Heap@43 null (|valid#sm| r_1@@23)) r_1@@23 f_7 (bool_2_U true)))) (= Heap@45 (MapType0Store Heap@44 null (|valid#sm| r_1@@23) (MapType1Store (MapType0Select Heap@44 null (|valid#sm| r_1@@23)) r_1@@23 next (bool_2_U true))))) (and (=> (= (ControlFlow 0 61) 59) anon155_Then_correct) (=> (= (ControlFlow 0 61) 60) anon155_Else_correct)))))
(let ((anon154_Else_correct  (=> (HasDirectPerm Mask@25 null (valid r_1@@23)) (=> (and (= Heap@43 Heap@40) (= (ControlFlow 0 63) 61)) anon79_correct))))
(let ((anon154_Then_correct  (=> (not (HasDirectPerm Mask@25 null (valid r_1@@23))) (=> (and (and (= Heap@41 (MapType0Store Heap@40 null (|valid#sm| r_1@@23) ZeroPMask)) (= Heap@42 (MapType0Store Heap@41 null (valid r_1@@23) freshVersion@1))) (and (= Heap@43 Heap@42) (= (ControlFlow 0 62) 61))) anon79_correct))))
(let ((anon77_correct  (=> (= Mask@25 (MapType1Store Mask@24 null (valid r_1@@23) (real_2_U (+ (U_2_real (MapType1Select Mask@24 null (valid r_1@@23))) FullPerm)))) (=> (and (and (state Heap@40 Mask@25) (state Heap@40 Mask@25)) (and (|valid#trigger| Heap@40 (valid r_1@@23)) (= (MapType0Select Heap@40 null (valid r_1@@23)) (CombineFrames (FrameFragment (MapType0Select Heap@40 r_1@@23 f_7)) (CombineFrames (FrameFragment (MapType0Select Heap@40 r_1@@23 next)) (FrameFragment (ite (not (= (MapType0Select Heap@40 r_1@@23 next) null)) (MapType0Select Heap@40 null (valid (MapType0Select Heap@40 r_1@@23 next))) EmptyFrame))))))) (and (=> (= (ControlFlow 0 64) 62) anon154_Then_correct) (=> (= (ControlFlow 0 64) 63) anon154_Else_correct))))))
(let ((anon76_correct  (=> (and (and (= Mask@23 (MapType1Store Mask@22 null (valid (MapType0Select Heap@40 r_1@@23 next)) (real_2_U (- (U_2_real (MapType1Select Mask@22 null (valid (MapType0Select Heap@40 r_1@@23 next)))) FullPerm)))) (InsidePredicate (valid r_1@@23) (MapType0Select Heap@40 null (valid r_1@@23)) (valid (MapType0Select Heap@40 r_1@@23 next)) (MapType0Select Heap@40 null (valid (MapType0Select Heap@40 r_1@@23 next))))) (and (= Mask@24 Mask@23) (= (ControlFlow 0 66) 64))) anon77_correct)))
(let ((anon153_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 69) 66)) anon76_correct)))
(let ((anon153_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 67) (- 0 68)) (<= FullPerm (U_2_real (MapType1Select Mask@22 null (valid (MapType0Select Heap@40 r_1@@23 next)))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@22 null (valid (MapType0Select Heap@40 r_1@@23 next))))) (=> (= (ControlFlow 0 67) 66) anon76_correct))))))
(let ((anon152_Then_correct  (=> (not (= (MapType0Select Heap@40 r_1@@23 next) null)) (and (=> (= (ControlFlow 0 70) 67) anon153_Then_correct) (=> (= (ControlFlow 0 70) 69) anon153_Else_correct)))))
(let ((anon152_Else_correct  (=> (= (MapType0Select Heap@40 r_1@@23 next) null) (=> (and (= Mask@24 Mask@22) (= (ControlFlow 0 65) 64)) anon77_correct))))
(let ((anon73_correct  (=> (= Mask@22 (MapType1Store Mask@21 r_1@@23 next (real_2_U (- (U_2_real (MapType1Select Mask@21 r_1@@23 next)) FullPerm)))) (and (=> (= (ControlFlow 0 71) 70) anon152_Then_correct) (=> (= (ControlFlow 0 71) 65) anon152_Else_correct)))))
(let ((anon151_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 74) 71)) anon73_correct)))
(let ((anon151_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 72) (- 0 73)) (<= FullPerm (U_2_real (MapType1Select Mask@21 r_1@@23 next)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@21 r_1@@23 next))) (=> (= (ControlFlow 0 72) 71) anon73_correct))))))
(let ((anon71_correct  (=> (= Mask@21 (MapType1Store Mask@20 r_1@@23 f_7 (real_2_U (- (U_2_real (MapType1Select Mask@20 r_1@@23 f_7)) FullPerm)))) (and (=> (= (ControlFlow 0 75) 72) anon151_Then_correct) (=> (= (ControlFlow 0 75) 74) anon151_Else_correct)))))
(let ((anon150_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 78) 75)) anon71_correct)))
(let ((anon150_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 76) (- 0 77)) (<= FullPerm (U_2_real (MapType1Select Mask@20 r_1@@23 f_7)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@20 r_1@@23 f_7))) (=> (= (ControlFlow 0 76) 75) anon71_correct))))))
(let ((anon69_correct  (=> (and (state Heap@39 Mask@20) (state Heap@39 Mask@20)) (and (=> (= (ControlFlow 0 79) (- 0 81)) (HasDirectPerm Mask@20 r_1@@23 f_7)) (=> (HasDirectPerm Mask@20 r_1@@23 f_7) (and (=> (= (ControlFlow 0 79) (- 0 80)) (= FullPerm (U_2_real (MapType1Select Mask@20 r_1@@23 f_7)))) (=> (= FullPerm (U_2_real (MapType1Select Mask@20 r_1@@23 f_7))) (=> (and (= Heap@40 (MapType0Store Heap@39 r_1@@23 f_7 (int_2_U (+ (U_2_int (MapType0Select Heap@39 r_1@@23 f_7)) 1)))) (state Heap@40 Mask@20)) (and (=> (= (ControlFlow 0 79) 76) anon150_Then_correct) (=> (= (ControlFlow 0 79) 78) anon150_Else_correct))))))))))
(let ((anon149_Else_correct  (=> (= (MapType0Select Heap@39 r_1@@23 next) null) (=> (and (= Mask@20 Mask@18) (= (ControlFlow 0 83) 79)) anon69_correct))))
(let ((anon149_Then_correct  (=> (and (not (= (MapType0Select Heap@39 r_1@@23 next) null)) (= Mask@19 (MapType1Store Mask@18 null (valid (MapType0Select Heap@39 r_1@@23 next)) (real_2_U (+ (U_2_real (MapType1Select Mask@18 null (valid (MapType0Select Heap@39 r_1@@23 next)))) FullPerm))))) (=> (and (and (InsidePredicate (valid r_1@@23) (MapType0Select Heap@39 null (valid r_1@@23)) (valid (MapType0Select Heap@39 r_1@@23 next)) (MapType0Select Heap@39 null (valid (MapType0Select Heap@39 r_1@@23 next)))) (state Heap@39 Mask@19)) (and (= Mask@20 Mask@19) (= (ControlFlow 0 82) 79))) anon69_correct))))
(let ((anon67_correct  (=> (and (not (= r_1@@23 null)) (= Mask@17 (MapType1Store Mask@16 r_1@@23 f_7 (real_2_U (+ (U_2_real (MapType1Select Mask@16 r_1@@23 f_7)) FullPerm))))) (=> (and (and (state Heap@39 Mask@17) (not (= r_1@@23 null))) (and (= Mask@18 (MapType1Store Mask@17 r_1@@23 next (real_2_U (+ (U_2_real (MapType1Select Mask@17 r_1@@23 next)) FullPerm)))) (state Heap@39 Mask@18))) (and (=> (= (ControlFlow 0 84) 82) anon149_Then_correct) (=> (= (ControlFlow 0 84) 83) anon149_Else_correct))))))
(let ((anon148_Else_correct  (=> (HasDirectPerm Mask@16 null (valid r_1@@23)) (=> (and (= Heap@39 Heap@37) (= (ControlFlow 0 86) 84)) anon67_correct))))
(let ((anon148_Then_correct  (=> (and (and (not (HasDirectPerm Mask@16 null (valid r_1@@23))) (= Heap@38 (MapType0Store Heap@37 null (valid r_1@@23) newVersion@1))) (and (= Heap@39 Heap@38) (= (ControlFlow 0 85) 84))) anon67_correct)))
(let ((anon65_correct  (=> (= Mask@16 (MapType1Store Mask@13 null (valid r_1@@23) (real_2_U (- (U_2_real (MapType1Select Mask@13 null (valid r_1@@23))) FullPerm)))) (and (=> (= (ControlFlow 0 87) 85) anon148_Then_correct) (=> (= (ControlFlow 0 87) 86) anon148_Else_correct)))))
(let ((anon147_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 90) 87)) anon65_correct)))
(let ((anon147_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 88) (- 0 89)) (<= FullPerm (U_2_real (MapType1Select Mask@13 null (valid r_1@@23))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@13 null (valid r_1@@23)))) (=> (= (ControlFlow 0 88) 87) anon65_correct))))))
(let ((anon63_correct  (=> (state Heap@37 Mask@13) (=> (and (> j@0 0) (state Heap@37 Mask@13)) (=> (and (and (= j@1 (- j@0 1)) (state Heap@37 Mask@13)) (and (|valid#trigger| Heap@37 (valid r_1@@23)) (= (MapType0Select Heap@37 null (valid r_1@@23)) (CombineFrames (FrameFragment (MapType0Select Heap@37 r_1@@23 f_7)) (CombineFrames (FrameFragment (MapType0Select Heap@37 r_1@@23 next)) (FrameFragment (ite (not (= (MapType0Select Heap@37 r_1@@23 next) null)) (MapType0Select Heap@37 null (valid (MapType0Select Heap@37 r_1@@23 next))) EmptyFrame))))))) (and (=> (= (ControlFlow 0 91) 88) anon147_Then_correct) (=> (= (ControlFlow 0 91) 90) anon147_Else_correct)))))))
(let ((anon146_Else_correct  (=> (= (MapType0Select Heap@35 r_1@@23 next) null) (=> (and (= Heap@37 Heap@35) (= (ControlFlow 0 93) 91)) anon63_correct))))
(let ((anon146_Then_correct  (=> (not (= (MapType0Select Heap@35 r_1@@23 next) null)) (=> (and (and (forall ((o_42 T@U) (f_47 T@U) ) (! (let ((B@@16 (FieldTypeInv1 (type f_47))))
(let ((A@@17 (FieldTypeInv0 (type f_47))))
 (=> (and (and (= (type o_42) RefType) (= (type f_47) (FieldType A@@17 B@@16))) (or (U_2_bool (MapType1Select (MapType0Select Heap@35 null (|valid#sm| r_1@@23)) o_42 f_47)) (U_2_bool (MapType1Select (MapType0Select Heap@35 null (|valid#sm| (MapType0Select Heap@35 r_1@@23 next))) o_42 f_47)))) (U_2_bool (MapType1Select newPMask@7 o_42 f_47)))))
 :qid |stdinbpl.2648:37|
 :skolemid |85|
 :pattern ( (MapType1Select newPMask@7 o_42 f_47))
)) (= Heap@36 (MapType0Store Heap@35 null (|valid#sm| r_1@@23) newPMask@7))) (and (= Heap@37 Heap@36) (= (ControlFlow 0 92) 91))) anon63_correct))))
(let ((anon61_correct  (=> (state Heap@33 UnfoldingMask@34) (=> (and (= Heap@34 (MapType0Store Heap@33 null (|valid#sm| r_1@@23) (MapType1Store (MapType0Select Heap@33 null (|valid#sm| r_1@@23)) r_1@@23 f_7 (bool_2_U true)))) (= Heap@35 (MapType0Store Heap@34 null (|valid#sm| r_1@@23) (MapType1Store (MapType0Select Heap@34 null (|valid#sm| r_1@@23)) r_1@@23 next (bool_2_U true))))) (and (=> (= (ControlFlow 0 94) 92) anon146_Then_correct) (=> (= (ControlFlow 0 94) 93) anon146_Else_correct))))))
(let ((anon145_Else_correct  (=> (= (MapType0Select Heap@33 r_1@@23 next) null) (=> (and (= UnfoldingMask@34 UnfoldingMask@32) (= (ControlFlow 0 96) 94)) anon61_correct))))
(let ((anon145_Then_correct  (=> (and (not (= (MapType0Select Heap@33 r_1@@23 next) null)) (= UnfoldingMask@33 (MapType1Store UnfoldingMask@32 null (valid (MapType0Select Heap@33 r_1@@23 next)) (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@32 null (valid (MapType0Select Heap@33 r_1@@23 next)))) FullPerm))))) (=> (and (and (InsidePredicate (valid r_1@@23) (MapType0Select Heap@33 null (valid r_1@@23)) (valid (MapType0Select Heap@33 r_1@@23 next)) (MapType0Select Heap@33 null (valid (MapType0Select Heap@33 r_1@@23 next)))) (state Heap@33 UnfoldingMask@33)) (and (= UnfoldingMask@34 UnfoldingMask@33) (= (ControlFlow 0 95) 94))) anon61_correct))))
(let ((anon59_correct  (=> (= UnfoldingMask@30 (MapType1Store Mask@13 null (valid r_1@@23) (real_2_U (- (U_2_real (MapType1Select Mask@13 null (valid r_1@@23))) FullPerm)))) (=> (and (not (= r_1@@23 null)) (= UnfoldingMask@31 (MapType1Store UnfoldingMask@30 r_1@@23 f_7 (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@30 r_1@@23 f_7)) FullPerm))))) (=> (and (and (state Heap@33 UnfoldingMask@31) (not (= r_1@@23 null))) (and (= UnfoldingMask@32 (MapType1Store UnfoldingMask@31 r_1@@23 next (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@31 r_1@@23 next)) FullPerm)))) (state Heap@33 UnfoldingMask@32))) (and (=> (= (ControlFlow 0 97) 95) anon145_Then_correct) (=> (= (ControlFlow 0 97) 96) anon145_Else_correct)))))))
(let ((anon144_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 100) 97)) anon59_correct)))
(let ((anon144_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 98) (- 0 99)) (<= FullPerm (U_2_real (MapType1Select Mask@13 null (valid r_1@@23))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@13 null (valid r_1@@23)))) (=> (= (ControlFlow 0 98) 97) anon59_correct))))))
(let ((anon57_correct  (=> (and (and (state Heap@33 Mask@13) (state Heap@33 Mask@13)) (and (|valid#trigger| Heap@33 (valid r_1@@23)) (= (MapType0Select Heap@33 null (valid r_1@@23)) (CombineFrames (FrameFragment (MapType0Select Heap@33 r_1@@23 f_7)) (CombineFrames (FrameFragment (MapType0Select Heap@33 r_1@@23 next)) (FrameFragment (ite (not (= (MapType0Select Heap@33 r_1@@23 next) null)) (MapType0Select Heap@33 null (valid (MapType0Select Heap@33 r_1@@23 next))) EmptyFrame))))))) (and (=> (= (ControlFlow 0 101) 98) anon144_Then_correct) (=> (= (ControlFlow 0 101) 100) anon144_Else_correct)))))
(let ((anon143_Else_correct  (=> (= (MapType0Select Heap@31 r_1@@23 next) null) (=> (and (= Heap@33 Heap@31) (= (ControlFlow 0 103) 101)) anon57_correct))))
(let ((anon143_Then_correct  (=> (not (= (MapType0Select Heap@31 r_1@@23 next) null)) (=> (and (and (forall ((o_41 T@U) (f_46 T@U) ) (! (let ((B@@17 (FieldTypeInv1 (type f_46))))
(let ((A@@18 (FieldTypeInv0 (type f_46))))
 (=> (and (and (= (type o_41) RefType) (= (type f_46) (FieldType A@@18 B@@17))) (or (U_2_bool (MapType1Select (MapType0Select Heap@31 null (|valid#sm| r_1@@23)) o_41 f_46)) (U_2_bool (MapType1Select (MapType0Select Heap@31 null (|valid#sm| (MapType0Select Heap@31 r_1@@23 next))) o_41 f_46)))) (U_2_bool (MapType1Select newPMask@6 o_41 f_46)))))
 :qid |stdinbpl.2603:35|
 :skolemid |84|
 :pattern ( (MapType1Select newPMask@6 o_41 f_46))
)) (= Heap@32 (MapType0Store Heap@31 null (|valid#sm| r_1@@23) newPMask@6))) (and (= Heap@33 Heap@32) (= (ControlFlow 0 102) 101))) anon57_correct))))
(let ((anon55_correct  (=> (and (and (state ExhaleHeap@0 UnfoldingMask@29) (> (U_2_int (MapType0Select ExhaleHeap@0 r_1@@23 f_7)) 2)) (and (= Heap@30 (MapType0Store ExhaleHeap@0 null (|valid#sm| r_1@@23) (MapType1Store (MapType0Select ExhaleHeap@0 null (|valid#sm| r_1@@23)) r_1@@23 f_7 (bool_2_U true)))) (= Heap@31 (MapType0Store Heap@30 null (|valid#sm| r_1@@23) (MapType1Store (MapType0Select Heap@30 null (|valid#sm| r_1@@23)) r_1@@23 next (bool_2_U true)))))) (and (=> (= (ControlFlow 0 104) 102) anon143_Then_correct) (=> (= (ControlFlow 0 104) 103) anon143_Else_correct)))))
(let ((anon142_Else_correct  (=> (= (MapType0Select ExhaleHeap@0 r_1@@23 next) null) (=> (and (= UnfoldingMask@29 UnfoldingMask@12) (= (ControlFlow 0 106) 104)) anon55_correct))))
(let ((anon142_Then_correct  (=> (and (not (= (MapType0Select ExhaleHeap@0 r_1@@23 next) null)) (= UnfoldingMask@28 (MapType1Store UnfoldingMask@12 null (valid (MapType0Select ExhaleHeap@0 r_1@@23 next)) (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@12 null (valid (MapType0Select ExhaleHeap@0 r_1@@23 next)))) FullPerm))))) (=> (and (and (InsidePredicate (valid r_1@@23) (MapType0Select ExhaleHeap@0 null (valid r_1@@23)) (valid (MapType0Select ExhaleHeap@0 r_1@@23 next)) (MapType0Select ExhaleHeap@0 null (valid (MapType0Select ExhaleHeap@0 r_1@@23 next)))) (state ExhaleHeap@0 UnfoldingMask@28)) (and (= UnfoldingMask@29 UnfoldingMask@28) (= (ControlFlow 0 105) 104))) anon55_correct))))
(let ((anon141_Then_correct  (=> (and (and (state ExhaleHeap@0 ZeroMask) (= Mask@13 (MapType1Store ZeroMask null (valid r_1@@23) (real_2_U (+ (U_2_real (MapType1Select ZeroMask null (valid r_1@@23))) FullPerm))))) (and (state ExhaleHeap@0 Mask@13) (|valid#trigger| ExhaleHeap@0 (valid r_1@@23)))) (=> (and (and (and (= (MapType0Select ExhaleHeap@0 null (valid r_1@@23)) (CombineFrames (FrameFragment (MapType0Select ExhaleHeap@0 r_1@@23 f_7)) (CombineFrames (FrameFragment (MapType0Select ExhaleHeap@0 r_1@@23 next)) (FrameFragment (ite (not (= (MapType0Select ExhaleHeap@0 r_1@@23 next) null)) (MapType0Select ExhaleHeap@0 null (valid (MapType0Select ExhaleHeap@0 r_1@@23 next))) EmptyFrame))))) (= UnfoldingMask@10 (MapType1Store Mask@13 null (valid r_1@@23) (real_2_U (- (U_2_real (MapType1Select Mask@13 null (valid r_1@@23))) FullPerm))))) (and (not (= r_1@@23 null)) (= UnfoldingMask@11 (MapType1Store UnfoldingMask@10 r_1@@23 f_7 (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@10 r_1@@23 f_7)) FullPerm)))))) (and (and (state ExhaleHeap@0 UnfoldingMask@11) (not (= r_1@@23 null))) (and (= UnfoldingMask@12 (MapType1Store UnfoldingMask@11 r_1@@23 next (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@11 r_1@@23 next)) FullPerm)))) (state ExhaleHeap@0 UnfoldingMask@12)))) (and (=> (= (ControlFlow 0 107) 105) anon142_Then_correct) (=> (= (ControlFlow 0 107) 106) anon142_Else_correct))))))
(let ((anon114_correct true))
(let ((anon171_Else_correct  (=> (= (MapType0Select Heap@27 r_1@@23 next) null) (=> (and (= Heap@29 Heap@27) (= (ControlFlow 0 3) 1)) anon114_correct))))
(let ((anon171_Then_correct  (=> (not (= (MapType0Select Heap@27 r_1@@23 next) null)) (=> (and (and (forall ((o_48 T@U) (f_53 T@U) ) (! (let ((B@@18 (FieldTypeInv1 (type f_53))))
(let ((A@@19 (FieldTypeInv0 (type f_53))))
 (=> (and (and (= (type o_48) RefType) (= (type f_53) (FieldType A@@19 B@@18))) (or (U_2_bool (MapType1Select (MapType0Select Heap@27 null (|valid#sm| r_1@@23)) o_48 f_53)) (U_2_bool (MapType1Select (MapType0Select Heap@27 null (|valid#sm| (MapType0Select Heap@27 r_1@@23 next))) o_48 f_53)))) (U_2_bool (MapType1Select newPMask@5 o_48 f_53)))))
 :qid |stdinbpl.3009:31|
 :skolemid |91|
 :pattern ( (MapType1Select newPMask@5 o_48 f_53))
)) (= Heap@28 (MapType0Store Heap@27 null (|valid#sm| r_1@@23) newPMask@5))) (and (= Heap@29 Heap@28) (= (ControlFlow 0 2) 1))) anon114_correct))))
(let ((anon112_correct  (=> (state Heap@25 UnfoldingMask@27) (and (=> (= (ControlFlow 0 4) (- 0 5)) (> (U_2_int (MapType0Select Heap@25 r_1@@23 f_7)) 2)) (=> (> (U_2_int (MapType0Select Heap@25 r_1@@23 f_7)) 2) (=> (and (= Heap@26 (MapType0Store Heap@25 null (|valid#sm| r_1@@23) (MapType1Store (MapType0Select Heap@25 null (|valid#sm| r_1@@23)) r_1@@23 f_7 (bool_2_U true)))) (= Heap@27 (MapType0Store Heap@26 null (|valid#sm| r_1@@23) (MapType1Store (MapType0Select Heap@26 null (|valid#sm| r_1@@23)) r_1@@23 next (bool_2_U true))))) (and (=> (= (ControlFlow 0 4) 2) anon171_Then_correct) (=> (= (ControlFlow 0 4) 3) anon171_Else_correct))))))))
(let ((anon170_Else_correct  (=> (= (MapType0Select Heap@25 r_1@@23 next) null) (=> (and (= UnfoldingMask@27 UnfoldingMask@25) (= (ControlFlow 0 7) 4)) anon112_correct))))
(let ((anon170_Then_correct  (=> (and (not (= (MapType0Select Heap@25 r_1@@23 next) null)) (= UnfoldingMask@26 (MapType1Store UnfoldingMask@25 null (valid (MapType0Select Heap@25 r_1@@23 next)) (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@25 null (valid (MapType0Select Heap@25 r_1@@23 next)))) FullPerm))))) (=> (and (and (InsidePredicate (valid r_1@@23) (MapType0Select Heap@25 null (valid r_1@@23)) (valid (MapType0Select Heap@25 r_1@@23 next)) (MapType0Select Heap@25 null (valid (MapType0Select Heap@25 r_1@@23 next)))) (state Heap@25 UnfoldingMask@26)) (and (= UnfoldingMask@27 UnfoldingMask@26) (= (ControlFlow 0 6) 4))) anon112_correct))))
(let ((anon110_correct  (=> (= UnfoldingMask@23 (MapType1Store Mask@14 null (valid r_1@@23) (real_2_U (- (U_2_real (MapType1Select Mask@14 null (valid r_1@@23))) FullPerm)))) (=> (and (not (= r_1@@23 null)) (= UnfoldingMask@24 (MapType1Store UnfoldingMask@23 r_1@@23 f_7 (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@23 r_1@@23 f_7)) FullPerm))))) (=> (and (and (state Heap@25 UnfoldingMask@24) (not (= r_1@@23 null))) (and (= UnfoldingMask@25 (MapType1Store UnfoldingMask@24 r_1@@23 next (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@24 r_1@@23 next)) FullPerm)))) (state Heap@25 UnfoldingMask@25))) (and (=> (= (ControlFlow 0 8) 6) anon170_Then_correct) (=> (= (ControlFlow 0 8) 7) anon170_Else_correct)))))))
(let ((anon169_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 11) 8)) anon110_correct)))
(let ((anon169_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 9) (- 0 10)) (<= FullPerm (U_2_real (MapType1Select Mask@14 null (valid r_1@@23))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@14 null (valid r_1@@23)))) (=> (= (ControlFlow 0 9) 8) anon110_correct))))))
(let ((anon108_correct  (=> (= Mask@15 (MapType1Store Mask@14 null (valid r_1@@23) (real_2_U (- (U_2_real (MapType1Select Mask@14 null (valid r_1@@23))) FullPerm)))) (=> (and (|valid#trigger| Heap@25 (valid r_1@@23)) (= (MapType0Select Heap@25 null (valid r_1@@23)) (CombineFrames (FrameFragment (MapType0Select Heap@25 r_1@@23 f_7)) (CombineFrames (FrameFragment (MapType0Select Heap@25 r_1@@23 next)) (FrameFragment (ite (not (= (MapType0Select Heap@25 r_1@@23 next) null)) (MapType0Select Heap@25 null (valid (MapType0Select Heap@25 r_1@@23 next))) EmptyFrame)))))) (and (=> (= (ControlFlow 0 12) 9) anon169_Then_correct) (=> (= (ControlFlow 0 12) 11) anon169_Else_correct))))))
(let ((anon168_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 15) 12)) anon108_correct)))
(let ((anon168_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 13) (- 0 14)) (<= FullPerm (U_2_real (MapType1Select Mask@14 null (valid r_1@@23))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@14 null (valid r_1@@23)))) (=> (= (ControlFlow 0 13) 12) anon108_correct))))))
(let ((anon106_correct  (=> (and (state Heap@25 Mask@14) (state Heap@25 Mask@14)) (and (=> (= (ControlFlow 0 16) 13) anon168_Then_correct) (=> (= (ControlFlow 0 16) 15) anon168_Else_correct)))))
(let ((anon167_Else_correct  (=> (= (MapType0Select Heap@23 r_1@@23 next) null) (=> (and (= Heap@25 Heap@23) (= (ControlFlow 0 18) 16)) anon106_correct))))
(let ((anon167_Then_correct  (=> (not (= (MapType0Select Heap@23 r_1@@23 next) null)) (=> (and (and (forall ((o_47 T@U) (f_52 T@U) ) (! (let ((B@@19 (FieldTypeInv1 (type f_52))))
(let ((A@@20 (FieldTypeInv0 (type f_52))))
 (=> (and (and (= (type o_47) RefType) (= (type f_52) (FieldType A@@20 B@@19))) (or (U_2_bool (MapType1Select (MapType0Select Heap@23 null (|valid#sm| r_1@@23)) o_47 f_52)) (U_2_bool (MapType1Select (MapType0Select Heap@23 null (|valid#sm| (MapType0Select Heap@23 r_1@@23 next))) o_47 f_52)))) (U_2_bool (MapType1Select newPMask@4 o_47 f_52)))))
 :qid |stdinbpl.2952:35|
 :skolemid |90|
 :pattern ( (MapType1Select newPMask@4 o_47 f_52))
)) (= Heap@24 (MapType0Store Heap@23 null (|valid#sm| r_1@@23) newPMask@4))) (and (= Heap@25 Heap@24) (= (ControlFlow 0 17) 16))) anon106_correct))))
(let ((anon104_correct  (=> (state Heap@21 UnfoldingMask@22) (=> (and (= Heap@22 (MapType0Store Heap@21 null (|valid#sm| r_1@@23) (MapType1Store (MapType0Select Heap@21 null (|valid#sm| r_1@@23)) r_1@@23 f_7 (bool_2_U true)))) (= Heap@23 (MapType0Store Heap@22 null (|valid#sm| r_1@@23) (MapType1Store (MapType0Select Heap@22 null (|valid#sm| r_1@@23)) r_1@@23 next (bool_2_U true))))) (and (=> (= (ControlFlow 0 19) 17) anon167_Then_correct) (=> (= (ControlFlow 0 19) 18) anon167_Else_correct))))))
(let ((anon166_Else_correct  (=> (= (MapType0Select Heap@21 r_1@@23 next) null) (=> (and (= UnfoldingMask@22 UnfoldingMask@20) (= (ControlFlow 0 21) 19)) anon104_correct))))
(let ((anon166_Then_correct  (=> (and (not (= (MapType0Select Heap@21 r_1@@23 next) null)) (= UnfoldingMask@21 (MapType1Store UnfoldingMask@20 null (valid (MapType0Select Heap@21 r_1@@23 next)) (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@20 null (valid (MapType0Select Heap@21 r_1@@23 next)))) FullPerm))))) (=> (and (and (InsidePredicate (valid r_1@@23) (MapType0Select Heap@21 null (valid r_1@@23)) (valid (MapType0Select Heap@21 r_1@@23 next)) (MapType0Select Heap@21 null (valid (MapType0Select Heap@21 r_1@@23 next)))) (state Heap@21 UnfoldingMask@21)) (and (= UnfoldingMask@22 UnfoldingMask@21) (= (ControlFlow 0 20) 19))) anon104_correct))))
(let ((anon102_correct  (=> (= UnfoldingMask@18 (MapType1Store Mask@14 null (valid r_1@@23) (real_2_U (- (U_2_real (MapType1Select Mask@14 null (valid r_1@@23))) FullPerm)))) (=> (and (not (= r_1@@23 null)) (= UnfoldingMask@19 (MapType1Store UnfoldingMask@18 r_1@@23 f_7 (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@18 r_1@@23 f_7)) FullPerm))))) (=> (and (and (state Heap@21 UnfoldingMask@19) (not (= r_1@@23 null))) (and (= UnfoldingMask@20 (MapType1Store UnfoldingMask@19 r_1@@23 next (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@19 r_1@@23 next)) FullPerm)))) (state Heap@21 UnfoldingMask@20))) (and (=> (= (ControlFlow 0 22) 20) anon166_Then_correct) (=> (= (ControlFlow 0 22) 21) anon166_Else_correct)))))))
(let ((anon165_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 25) 22)) anon102_correct)))
(let ((anon165_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 23) (- 0 24)) (<= FullPerm (U_2_real (MapType1Select Mask@14 null (valid r_1@@23))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@14 null (valid r_1@@23)))) (=> (= (ControlFlow 0 23) 22) anon102_correct))))))
(let ((anon100_correct  (=> (and (and (state Heap@21 Mask@14) (state Heap@21 Mask@14)) (and (|valid#trigger| Heap@21 (valid r_1@@23)) (= (MapType0Select Heap@21 null (valid r_1@@23)) (CombineFrames (FrameFragment (MapType0Select Heap@21 r_1@@23 f_7)) (CombineFrames (FrameFragment (MapType0Select Heap@21 r_1@@23 next)) (FrameFragment (ite (not (= (MapType0Select Heap@21 r_1@@23 next) null)) (MapType0Select Heap@21 null (valid (MapType0Select Heap@21 r_1@@23 next))) EmptyFrame))))))) (and (=> (= (ControlFlow 0 26) 23) anon165_Then_correct) (=> (= (ControlFlow 0 26) 25) anon165_Else_correct)))))
(let ((anon164_Else_correct  (=> (= (MapType0Select Heap@19 r_1@@23 next) null) (=> (and (= Heap@21 Heap@19) (= (ControlFlow 0 28) 26)) anon100_correct))))
(let ((anon164_Then_correct  (=> (not (= (MapType0Select Heap@19 r_1@@23 next) null)) (=> (and (and (forall ((o_46 T@U) (f_51 T@U) ) (! (let ((B@@20 (FieldTypeInv1 (type f_51))))
(let ((A@@21 (FieldTypeInv0 (type f_51))))
 (=> (and (and (= (type o_46) RefType) (= (type f_51) (FieldType A@@21 B@@20))) (or (U_2_bool (MapType1Select (MapType0Select Heap@19 null (|valid#sm| r_1@@23)) o_46 f_51)) (U_2_bool (MapType1Select (MapType0Select Heap@19 null (|valid#sm| (MapType0Select Heap@19 r_1@@23 next))) o_46 f_51)))) (U_2_bool (MapType1Select newPMask@3 o_46 f_51)))))
 :qid |stdinbpl.2907:33|
 :skolemid |89|
 :pattern ( (MapType1Select newPMask@3 o_46 f_51))
)) (= Heap@20 (MapType0Store Heap@19 null (|valid#sm| r_1@@23) newPMask@3))) (and (= Heap@21 Heap@20) (= (ControlFlow 0 27) 26))) anon100_correct))))
(let ((anon98_correct  (=> (and (and (state ExhaleHeap@0 UnfoldingMask@17) (> (U_2_int (MapType0Select ExhaleHeap@0 r_1@@23 f_7)) 2)) (and (= Heap@18 (MapType0Store ExhaleHeap@0 null (|valid#sm| r_1@@23) (MapType1Store (MapType0Select ExhaleHeap@0 null (|valid#sm| r_1@@23)) r_1@@23 f_7 (bool_2_U true)))) (= Heap@19 (MapType0Store Heap@18 null (|valid#sm| r_1@@23) (MapType1Store (MapType0Select Heap@18 null (|valid#sm| r_1@@23)) r_1@@23 next (bool_2_U true)))))) (and (=> (= (ControlFlow 0 29) 27) anon164_Then_correct) (=> (= (ControlFlow 0 29) 28) anon164_Else_correct)))))
(let ((anon163_Else_correct  (=> (= (MapType0Select ExhaleHeap@0 r_1@@23 next) null) (=> (and (= UnfoldingMask@17 UnfoldingMask@15) (= (ControlFlow 0 31) 29)) anon98_correct))))
(let ((anon163_Then_correct  (=> (and (not (= (MapType0Select ExhaleHeap@0 r_1@@23 next) null)) (= UnfoldingMask@16 (MapType1Store UnfoldingMask@15 null (valid (MapType0Select ExhaleHeap@0 r_1@@23 next)) (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@15 null (valid (MapType0Select ExhaleHeap@0 r_1@@23 next)))) FullPerm))))) (=> (and (and (InsidePredicate (valid r_1@@23) (MapType0Select ExhaleHeap@0 null (valid r_1@@23)) (valid (MapType0Select ExhaleHeap@0 r_1@@23 next)) (MapType0Select ExhaleHeap@0 null (valid (MapType0Select ExhaleHeap@0 r_1@@23 next)))) (state ExhaleHeap@0 UnfoldingMask@16)) (and (= UnfoldingMask@17 UnfoldingMask@16) (= (ControlFlow 0 30) 29))) anon98_correct))))
(let ((anon141_Else_correct  (=> (not (> j@0 0)) (=> (and (and (state ExhaleHeap@0 Mask@11) (= Mask@14 (MapType1Store Mask@11 null (valid r_1@@23) (real_2_U (+ (U_2_real (MapType1Select Mask@11 null (valid r_1@@23))) FullPerm))))) (and (state ExhaleHeap@0 Mask@14) (|valid#trigger| ExhaleHeap@0 (valid r_1@@23)))) (=> (and (and (and (= (MapType0Select ExhaleHeap@0 null (valid r_1@@23)) (CombineFrames (FrameFragment (MapType0Select ExhaleHeap@0 r_1@@23 f_7)) (CombineFrames (FrameFragment (MapType0Select ExhaleHeap@0 r_1@@23 next)) (FrameFragment (ite (not (= (MapType0Select ExhaleHeap@0 r_1@@23 next) null)) (MapType0Select ExhaleHeap@0 null (valid (MapType0Select ExhaleHeap@0 r_1@@23 next))) EmptyFrame))))) (= UnfoldingMask@13 (MapType1Store Mask@14 null (valid r_1@@23) (real_2_U (- (U_2_real (MapType1Select Mask@14 null (valid r_1@@23))) FullPerm))))) (and (not (= r_1@@23 null)) (= UnfoldingMask@14 (MapType1Store UnfoldingMask@13 r_1@@23 f_7 (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@13 r_1@@23 f_7)) FullPerm)))))) (and (and (state ExhaleHeap@0 UnfoldingMask@14) (not (= r_1@@23 null))) (and (= UnfoldingMask@15 (MapType1Store UnfoldingMask@14 r_1@@23 next (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@14 r_1@@23 next)) FullPerm)))) (state ExhaleHeap@0 UnfoldingMask@15)))) (and (=> (= (ControlFlow 0 32) 30) anon163_Then_correct) (=> (= (ControlFlow 0 32) 31) anon163_Else_correct)))))))
(let ((anon42_correct  (=> (and (state Heap@17 Mask@11) (IdenticalOnKnownLocations Heap@17 ExhaleHeap@0 Mask@11)) (and (and (=> (= (ControlFlow 0 123) 122) anon136_Then_correct) (=> (= (ControlFlow 0 123) 107) anon141_Then_correct)) (=> (= (ControlFlow 0 123) 32) anon141_Else_correct)))))
(let ((anon135_Else_correct  (=> (= (MapType0Select Heap@15 r_1@@23 next) null) (=> (and (= Heap@17 Heap@15) (= (ControlFlow 0 125) 123)) anon42_correct))))
(let ((anon135_Then_correct  (=> (not (= (MapType0Select Heap@15 r_1@@23 next) null)) (=> (and (and (forall ((o_39 T@U) (f_44 T@U) ) (! (let ((B@@21 (FieldTypeInv1 (type f_44))))
(let ((A@@22 (FieldTypeInv0 (type f_44))))
 (=> (and (and (= (type o_39) RefType) (= (type f_44) (FieldType A@@22 B@@21))) (or (U_2_bool (MapType1Select (MapType0Select Heap@15 null (|valid#sm| r_1@@23)) o_39 f_44)) (U_2_bool (MapType1Select (MapType0Select Heap@15 null (|valid#sm| (MapType0Select Heap@15 r_1@@23 next))) o_39 f_44)))) (U_2_bool (MapType1Select newPMask@2 o_39 f_44)))))
 :qid |stdinbpl.2460:35|
 :skolemid |82|
 :pattern ( (MapType1Select newPMask@2 o_39 f_44))
)) (= Heap@16 (MapType0Store Heap@15 null (|valid#sm| r_1@@23) newPMask@2))) (and (= Heap@17 Heap@16) (= (ControlFlow 0 124) 123))) anon42_correct))))
(let ((anon40_correct  (=> (state Heap@13 UnfoldingMask@9) (and (=> (= (ControlFlow 0 126) (- 0 127)) (> (U_2_int (MapType0Select Heap@13 r_1@@23 f_7)) 2)) (=> (> (U_2_int (MapType0Select Heap@13 r_1@@23 f_7)) 2) (=> (and (= Heap@14 (MapType0Store Heap@13 null (|valid#sm| r_1@@23) (MapType1Store (MapType0Select Heap@13 null (|valid#sm| r_1@@23)) r_1@@23 f_7 (bool_2_U true)))) (= Heap@15 (MapType0Store Heap@14 null (|valid#sm| r_1@@23) (MapType1Store (MapType0Select Heap@14 null (|valid#sm| r_1@@23)) r_1@@23 next (bool_2_U true))))) (and (=> (= (ControlFlow 0 126) 124) anon135_Then_correct) (=> (= (ControlFlow 0 126) 125) anon135_Else_correct))))))))
(let ((anon134_Else_correct  (=> (= (MapType0Select Heap@13 r_1@@23 next) null) (=> (and (= UnfoldingMask@9 UnfoldingMask@7) (= (ControlFlow 0 129) 126)) anon40_correct))))
(let ((anon134_Then_correct  (=> (and (not (= (MapType0Select Heap@13 r_1@@23 next) null)) (= UnfoldingMask@8 (MapType1Store UnfoldingMask@7 null (valid (MapType0Select Heap@13 r_1@@23 next)) (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@7 null (valid (MapType0Select Heap@13 r_1@@23 next)))) FullPerm))))) (=> (and (and (InsidePredicate (valid r_1@@23) (MapType0Select Heap@13 null (valid r_1@@23)) (valid (MapType0Select Heap@13 r_1@@23 next)) (MapType0Select Heap@13 null (valid (MapType0Select Heap@13 r_1@@23 next)))) (state Heap@13 UnfoldingMask@8)) (and (= UnfoldingMask@9 UnfoldingMask@8) (= (ControlFlow 0 128) 126))) anon40_correct))))
(let ((anon38_correct  (=> (= UnfoldingMask@5 (MapType1Store Mask@10 null (valid r_1@@23) (real_2_U (- (U_2_real (MapType1Select Mask@10 null (valid r_1@@23))) FullPerm)))) (=> (and (not (= r_1@@23 null)) (= UnfoldingMask@6 (MapType1Store UnfoldingMask@5 r_1@@23 f_7 (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@5 r_1@@23 f_7)) FullPerm))))) (=> (and (and (state Heap@13 UnfoldingMask@6) (not (= r_1@@23 null))) (and (= UnfoldingMask@7 (MapType1Store UnfoldingMask@6 r_1@@23 next (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@6 r_1@@23 next)) FullPerm)))) (state Heap@13 UnfoldingMask@7))) (and (=> (= (ControlFlow 0 130) 128) anon134_Then_correct) (=> (= (ControlFlow 0 130) 129) anon134_Else_correct)))))))
(let ((anon133_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 133) 130)) anon38_correct)))
(let ((anon133_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 131) (- 0 132)) (<= FullPerm (U_2_real (MapType1Select Mask@10 null (valid r_1@@23))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@10 null (valid r_1@@23)))) (=> (= (ControlFlow 0 131) 130) anon38_correct))))))
(let ((anon36_correct  (=> (= Mask@11 (MapType1Store Mask@10 null (valid r_1@@23) (real_2_U (- (U_2_real (MapType1Select Mask@10 null (valid r_1@@23))) FullPerm)))) (=> (and (|valid#trigger| Heap@13 (valid r_1@@23)) (= (MapType0Select Heap@13 null (valid r_1@@23)) (CombineFrames (FrameFragment (MapType0Select Heap@13 r_1@@23 f_7)) (CombineFrames (FrameFragment (MapType0Select Heap@13 r_1@@23 next)) (FrameFragment (ite (not (= (MapType0Select Heap@13 r_1@@23 next) null)) (MapType0Select Heap@13 null (valid (MapType0Select Heap@13 r_1@@23 next))) EmptyFrame)))))) (and (=> (= (ControlFlow 0 134) 131) anon133_Then_correct) (=> (= (ControlFlow 0 134) 133) anon133_Else_correct))))))
(let ((anon132_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 137) 134)) anon36_correct)))
(let ((anon132_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 135) (- 0 136)) (<= FullPerm (U_2_real (MapType1Select Mask@10 null (valid r_1@@23))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@10 null (valid r_1@@23)))) (=> (= (ControlFlow 0 135) 134) anon36_correct))))))
(let ((anon34_correct  (=> (state Heap@13 Mask@10) (and (=> (= (ControlFlow 0 138) 135) anon132_Then_correct) (=> (= (ControlFlow 0 138) 137) anon132_Else_correct)))))
(let ((anon131_Else_correct  (=> (= (MapType0Select Heap@11 r_1@@23 next) null) (=> (and (= Heap@13 Heap@11) (= (ControlFlow 0 140) 138)) anon34_correct))))
(let ((anon131_Then_correct  (=> (not (= (MapType0Select Heap@11 r_1@@23 next) null)) (=> (and (and (forall ((o_38 T@U) (f_43 T@U) ) (! (let ((B@@22 (FieldTypeInv1 (type f_43))))
(let ((A@@23 (FieldTypeInv0 (type f_43))))
 (=> (and (and (= (type o_38) RefType) (= (type f_43) (FieldType A@@23 B@@22))) (or (U_2_bool (MapType1Select (MapType0Select Heap@11 null (|valid#sm| r_1@@23)) o_38 f_43)) (U_2_bool (MapType1Select (MapType0Select Heap@11 null (|valid#sm| (MapType0Select Heap@11 r_1@@23 next))) o_38 f_43)))) (U_2_bool (MapType1Select newPMask@1 o_38 f_43)))))
 :qid |stdinbpl.2406:37|
 :skolemid |81|
 :pattern ( (MapType1Select newPMask@1 o_38 f_43))
)) (= Heap@12 (MapType0Store Heap@11 null (|valid#sm| r_1@@23) newPMask@1))) (and (= Heap@13 Heap@12) (= (ControlFlow 0 139) 138))) anon34_correct))))
(let ((anon32_correct  (=> (state Heap@9 UnfoldingMask@4) (=> (and (= Heap@10 (MapType0Store Heap@9 null (|valid#sm| r_1@@23) (MapType1Store (MapType0Select Heap@9 null (|valid#sm| r_1@@23)) r_1@@23 f_7 (bool_2_U true)))) (= Heap@11 (MapType0Store Heap@10 null (|valid#sm| r_1@@23) (MapType1Store (MapType0Select Heap@10 null (|valid#sm| r_1@@23)) r_1@@23 next (bool_2_U true))))) (and (=> (= (ControlFlow 0 141) 139) anon131_Then_correct) (=> (= (ControlFlow 0 141) 140) anon131_Else_correct))))))
(let ((anon130_Else_correct  (=> (= (MapType0Select Heap@9 r_1@@23 next) null) (=> (and (= UnfoldingMask@4 UnfoldingMask@2) (= (ControlFlow 0 143) 141)) anon32_correct))))
(let ((anon130_Then_correct  (=> (and (not (= (MapType0Select Heap@9 r_1@@23 next) null)) (= UnfoldingMask@3 (MapType1Store UnfoldingMask@2 null (valid (MapType0Select Heap@9 r_1@@23 next)) (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@2 null (valid (MapType0Select Heap@9 r_1@@23 next)))) FullPerm))))) (=> (and (and (InsidePredicate (valid r_1@@23) (MapType0Select Heap@9 null (valid r_1@@23)) (valid (MapType0Select Heap@9 r_1@@23 next)) (MapType0Select Heap@9 null (valid (MapType0Select Heap@9 r_1@@23 next)))) (state Heap@9 UnfoldingMask@3)) (and (= UnfoldingMask@4 UnfoldingMask@3) (= (ControlFlow 0 142) 141))) anon32_correct))))
(let ((anon30_correct  (=> (= UnfoldingMask@0 (MapType1Store Mask@10 null (valid r_1@@23) (real_2_U (- (U_2_real (MapType1Select Mask@10 null (valid r_1@@23))) FullPerm)))) (=> (and (not (= r_1@@23 null)) (= UnfoldingMask@1 (MapType1Store UnfoldingMask@0 r_1@@23 f_7 (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@0 r_1@@23 f_7)) FullPerm))))) (=> (and (and (state Heap@9 UnfoldingMask@1) (not (= r_1@@23 null))) (and (= UnfoldingMask@2 (MapType1Store UnfoldingMask@1 r_1@@23 next (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@1 r_1@@23 next)) FullPerm)))) (state Heap@9 UnfoldingMask@2))) (and (=> (= (ControlFlow 0 144) 142) anon130_Then_correct) (=> (= (ControlFlow 0 144) 143) anon130_Else_correct)))))))
(let ((anon129_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 147) 144)) anon30_correct)))
(let ((anon129_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 145) (- 0 146)) (<= FullPerm (U_2_real (MapType1Select Mask@10 null (valid r_1@@23))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@10 null (valid r_1@@23)))) (=> (= (ControlFlow 0 145) 144) anon30_correct))))))
(let ((anon28_correct  (=> (and (and (state Heap@9 Mask@10) (state Heap@9 Mask@10)) (and (|valid#trigger| Heap@9 (valid r_1@@23)) (= (MapType0Select Heap@9 null (valid r_1@@23)) (CombineFrames (FrameFragment (MapType0Select Heap@9 r_1@@23 f_7)) (CombineFrames (FrameFragment (MapType0Select Heap@9 r_1@@23 next)) (FrameFragment (ite (not (= (MapType0Select Heap@9 r_1@@23 next) null)) (MapType0Select Heap@9 null (valid (MapType0Select Heap@9 r_1@@23 next))) EmptyFrame))))))) (and (=> (= (ControlFlow 0 148) 145) anon129_Then_correct) (=> (= (ControlFlow 0 148) 147) anon129_Else_correct)))))
(let ((anon128_Else_correct  (=> (= (MapType0Select Heap@7 r_1@@23 next) null) (=> (and (= Heap@9 Heap@7) (= (ControlFlow 0 150) 148)) anon28_correct))))
(let ((anon128_Then_correct  (=> (not (= (MapType0Select Heap@7 r_1@@23 next) null)) (=> (and (and (forall ((o_37 T@U) (f_42 T@U) ) (! (let ((B@@23 (FieldTypeInv1 (type f_42))))
(let ((A@@24 (FieldTypeInv0 (type f_42))))
 (=> (and (and (= (type o_37) RefType) (= (type f_42) (FieldType A@@24 B@@23))) (or (U_2_bool (MapType1Select (MapType0Select Heap@7 null (|valid#sm| r_1@@23)) o_37 f_42)) (U_2_bool (MapType1Select (MapType0Select Heap@7 null (|valid#sm| (MapType0Select Heap@7 r_1@@23 next))) o_37 f_42)))) (U_2_bool (MapType1Select newPMask@0 o_37 f_42)))))
 :qid |stdinbpl.2355:29|
 :skolemid |80|
 :pattern ( (MapType1Select newPMask@0 o_37 f_42))
)) (= Heap@8 (MapType0Store Heap@7 null (|valid#sm| r_1@@23) newPMask@0))) (and (= Heap@9 Heap@8) (= (ControlFlow 0 149) 148))) anon28_correct))))
(let ((anon26_correct  (=> (and (= Heap@6 (MapType0Store Heap@5 null (|valid#sm| r_1@@23) (MapType1Store (MapType0Select Heap@5 null (|valid#sm| r_1@@23)) r_1@@23 f_7 (bool_2_U true)))) (= Heap@7 (MapType0Store Heap@6 null (|valid#sm| r_1@@23) (MapType1Store (MapType0Select Heap@6 null (|valid#sm| r_1@@23)) r_1@@23 next (bool_2_U true))))) (and (=> (= (ControlFlow 0 151) 149) anon128_Then_correct) (=> (= (ControlFlow 0 151) 150) anon128_Else_correct)))))
(let ((anon127_Else_correct  (=> (HasDirectPerm Mask@10 null (valid r_1@@23)) (=> (and (= Heap@5 Heap@2) (= (ControlFlow 0 153) 151)) anon26_correct))))
(let ((anon127_Then_correct  (=> (not (HasDirectPerm Mask@10 null (valid r_1@@23))) (=> (and (and (= Heap@3 (MapType0Store Heap@2 null (|valid#sm| r_1@@23) ZeroPMask)) (= Heap@4 (MapType0Store Heap@3 null (valid r_1@@23) freshVersion@0))) (and (= Heap@5 Heap@4) (= (ControlFlow 0 152) 151))) anon26_correct))))
(let ((anon24_correct  (=> (= Mask@10 (MapType1Store Mask@9 null (valid r_1@@23) (real_2_U (+ (U_2_real (MapType1Select Mask@9 null (valid r_1@@23))) FullPerm)))) (=> (and (and (state Heap@2 Mask@10) (state Heap@2 Mask@10)) (and (|valid#trigger| Heap@2 (valid r_1@@23)) (= (MapType0Select Heap@2 null (valid r_1@@23)) (CombineFrames (FrameFragment (MapType0Select Heap@2 r_1@@23 f_7)) (CombineFrames (FrameFragment (MapType0Select Heap@2 r_1@@23 next)) (FrameFragment (ite (not (= (MapType0Select Heap@2 r_1@@23 next) null)) (MapType0Select Heap@2 null (valid (MapType0Select Heap@2 r_1@@23 next))) EmptyFrame))))))) (and (=> (= (ControlFlow 0 154) 152) anon127_Then_correct) (=> (= (ControlFlow 0 154) 153) anon127_Else_correct))))))
(let ((anon23_correct  (=> (and (and (= Mask@8 (MapType1Store Mask@7 null (valid (MapType0Select Heap@2 r_1@@23 next)) (real_2_U (- (U_2_real (MapType1Select Mask@7 null (valid (MapType0Select Heap@2 r_1@@23 next)))) FullPerm)))) (InsidePredicate (valid r_1@@23) (MapType0Select Heap@2 null (valid r_1@@23)) (valid (MapType0Select Heap@2 r_1@@23 next)) (MapType0Select Heap@2 null (valid (MapType0Select Heap@2 r_1@@23 next))))) (and (= Mask@9 Mask@8) (= (ControlFlow 0 156) 154))) anon24_correct)))
(let ((anon126_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 159) 156)) anon23_correct)))
(let ((anon126_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 157) (- 0 158)) (<= FullPerm (U_2_real (MapType1Select Mask@7 null (valid (MapType0Select Heap@2 r_1@@23 next)))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@7 null (valid (MapType0Select Heap@2 r_1@@23 next))))) (=> (= (ControlFlow 0 157) 156) anon23_correct))))))
(let ((anon125_Then_correct  (=> (not (= (MapType0Select Heap@2 r_1@@23 next) null)) (and (=> (= (ControlFlow 0 160) 157) anon126_Then_correct) (=> (= (ControlFlow 0 160) 159) anon126_Else_correct)))))
(let ((anon125_Else_correct  (=> (= (MapType0Select Heap@2 r_1@@23 next) null) (=> (and (= Mask@9 Mask@7) (= (ControlFlow 0 155) 154)) anon24_correct))))
(let ((anon20_correct  (=> (= Mask@7 (MapType1Store Mask@6 r_1@@23 next (real_2_U (- (U_2_real (MapType1Select Mask@6 r_1@@23 next)) FullPerm)))) (and (=> (= (ControlFlow 0 161) 160) anon125_Then_correct) (=> (= (ControlFlow 0 161) 155) anon125_Else_correct)))))
(let ((anon124_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 164) 161)) anon20_correct)))
(let ((anon124_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 162) (- 0 163)) (<= FullPerm (U_2_real (MapType1Select Mask@6 r_1@@23 next)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@6 r_1@@23 next))) (=> (= (ControlFlow 0 162) 161) anon20_correct))))))
(let ((anon18_correct  (=> (= Mask@6 (MapType1Store Mask@5 r_1@@23 f_7 (real_2_U (- (U_2_real (MapType1Select Mask@5 r_1@@23 f_7)) FullPerm)))) (and (=> (= (ControlFlow 0 165) 162) anon124_Then_correct) (=> (= (ControlFlow 0 165) 164) anon124_Else_correct)))))
(let ((anon123_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 168) 165)) anon18_correct)))
(let ((anon123_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 166) (- 0 167)) (<= FullPerm (U_2_real (MapType1Select Mask@5 r_1@@23 f_7)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@5 r_1@@23 f_7))) (=> (= (ControlFlow 0 166) 165) anon18_correct))))))
(let ((anon16_correct  (=> (and (state Heap@1 Mask@5) (state Heap@1 Mask@5)) (and (=> (= (ControlFlow 0 169) (- 0 170)) (= FullPerm (U_2_real (MapType1Select Mask@5 r_1@@23 f_7)))) (=> (= FullPerm (U_2_real (MapType1Select Mask@5 r_1@@23 f_7))) (=> (and (= Heap@2 (MapType0Store Heap@1 r_1@@23 f_7 (int_2_U 3))) (state Heap@2 Mask@5)) (and (=> (= (ControlFlow 0 169) 166) anon123_Then_correct) (=> (= (ControlFlow 0 169) 168) anon123_Else_correct))))))))
(let ((anon122_Else_correct  (=> (= (MapType0Select Heap@1 r_1@@23 next) null) (=> (and (= Mask@5 Mask@3) (= (ControlFlow 0 172) 169)) anon16_correct))))
(let ((anon122_Then_correct  (=> (and (not (= (MapType0Select Heap@1 r_1@@23 next) null)) (= Mask@4 (MapType1Store Mask@3 null (valid (MapType0Select Heap@1 r_1@@23 next)) (real_2_U (+ (U_2_real (MapType1Select Mask@3 null (valid (MapType0Select Heap@1 r_1@@23 next)))) FullPerm))))) (=> (and (and (InsidePredicate (valid r_1@@23) (MapType0Select Heap@1 null (valid r_1@@23)) (valid (MapType0Select Heap@1 r_1@@23 next)) (MapType0Select Heap@1 null (valid (MapType0Select Heap@1 r_1@@23 next)))) (state Heap@1 Mask@4)) (and (= Mask@5 Mask@4) (= (ControlFlow 0 171) 169))) anon16_correct))))
(let ((anon14_correct  (=> (and (not (= r_1@@23 null)) (= Mask@2 (MapType1Store Mask@1 r_1@@23 f_7 (real_2_U (+ (U_2_real (MapType1Select Mask@1 r_1@@23 f_7)) FullPerm))))) (=> (and (and (state Heap@1 Mask@2) (not (= r_1@@23 null))) (and (= Mask@3 (MapType1Store Mask@2 r_1@@23 next (real_2_U (+ (U_2_real (MapType1Select Mask@2 r_1@@23 next)) FullPerm)))) (state Heap@1 Mask@3))) (and (=> (= (ControlFlow 0 173) 171) anon122_Then_correct) (=> (= (ControlFlow 0 173) 172) anon122_Else_correct))))))
(let ((anon121_Else_correct  (=> (HasDirectPerm Mask@1 null (valid r_1@@23)) (=> (and (= Heap@1 Heap@@13) (= (ControlFlow 0 175) 173)) anon14_correct))))
(let ((anon121_Then_correct  (=> (and (and (not (HasDirectPerm Mask@1 null (valid r_1@@23))) (= Heap@0 (MapType0Store Heap@@13 null (valid r_1@@23) newVersion@0))) (and (= Heap@1 Heap@0) (= (ControlFlow 0 174) 173))) anon14_correct)))
(let ((anon12_correct  (=> (= Mask@1 (MapType1Store Mask@0 null (valid r_1@@23) (real_2_U (- (U_2_real (MapType1Select Mask@0 null (valid r_1@@23))) FullPerm)))) (and (=> (= (ControlFlow 0 176) 174) anon121_Then_correct) (=> (= (ControlFlow 0 176) 175) anon121_Else_correct)))))
(let ((anon120_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 179) 176)) anon12_correct)))
(let ((anon120_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 177) (- 0 178)) (<= FullPerm (U_2_real (MapType1Select Mask@0 null (valid r_1@@23))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@0 null (valid r_1@@23)))) (=> (= (ControlFlow 0 177) 176) anon12_correct))))))
(let ((anon115_Else_correct  (=> (state Heap@@13 Mask@0) (=> (and (|valid#trigger| Heap@@13 (valid r_1@@23)) (= (MapType0Select Heap@@13 null (valid r_1@@23)) (CombineFrames (FrameFragment (MapType0Select Heap@@13 r_1@@23 f_7)) (CombineFrames (FrameFragment (MapType0Select Heap@@13 r_1@@23 next)) (FrameFragment (ite (not (= (MapType0Select Heap@@13 r_1@@23 next) null)) (MapType0Select Heap@@13 null (valid (MapType0Select Heap@@13 r_1@@23 next))) EmptyFrame)))))) (and (=> (= (ControlFlow 0 180) 177) anon120_Then_correct) (=> (= (ControlFlow 0 180) 179) anon120_Else_correct))))))
(let ((anon0_correct  (=> (state Heap@@13 ZeroMask) (=> (and (and (U_2_bool (MapType0Select Heap@@13 r_1@@23 $allocated)) (= Mask@0 (MapType1Store ZeroMask null (valid r_1@@23) (real_2_U (+ (U_2_real (MapType1Select ZeroMask null (valid r_1@@23))) FullPerm))))) (and (state Heap@@13 Mask@0) (state Heap@@13 Mask@0))) (and (=> (= (ControlFlow 0 196) 195) anon115_Then_correct) (=> (= (ControlFlow 0 196) 180) anon115_Else_correct))))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 197) 196) anon0_correct)))
PreconditionGeneratedEntry_correct))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
))
(check-sat)
(pop 1)
; Valid
(get-info :rlimit)
