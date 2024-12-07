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
(declare-fun f$m2 () T@U)
(declare-fun f$m5 () T@U)
(declare-fun val_int () T@U)
(declare-fun val_ref () T@U)
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
(declare-fun P (T@U) T@U)
(declare-fun PredicateType_PType () T@T)
(declare-fun u32 (T@U) T@U)
(declare-fun PredicateType_u32Type () T@T)
(declare-fun |f'| (T@U T@U) Bool)
(declare-fun dummyFunction (T@U) Bool)
(declare-fun |f#triggerStateless| (T@U) Bool)
(declare-fun |P#trigger| (T@U T@U) Bool)
(declare-fun |P#everUsed| (T@U) Bool)
(declare-fun |u32#trigger| (T@U T@U) Bool)
(declare-fun |u32#everUsed| (T@U) Bool)
(declare-fun |read$'| (T@U) Real)
(declare-fun AssumeFunctionsAbove () Int)
(declare-fun |read$#trigger| (T@U) Bool)
(declare-fun EmptyFrame () T@U)
(declare-fun NoPerm () Real)
(declare-fun |P#sm| (T@U) T@U)
(declare-fun |u32#sm| (T@U) T@U)
(declare-fun dummyHeap () T@U)
(declare-fun ZeroMask () T@U)
(declare-fun InsidePredicate (T@U T@U T@U T@U) Bool)
(declare-fun sumMask (T@U T@U T@U) Bool)
(declare-fun ConditionalFrame (Real T@U) T@U)
(declare-fun read$ (T@U) Real)
(declare-fun |read$#triggerStateless| () Real)
(declare-fun f_6@@0 (T@U T@U) Bool)
(declare-fun getPredWandId (T@U) Int)
(declare-fun FullPerm () Real)
(declare-fun |f#frame| (T@U T@U) Bool)
(declare-fun |read$#frame| (T@U) Real)
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
(assert  (and (and (and (and (and (and (and (and (and (forall ((arg0@@11 T@T) (arg1 T@T) ) (! (= (Ctor (FieldType arg0@@11 arg1)) 6)
 :qid |ctor:FieldType|
)) (forall ((arg0@@12 T@T) (arg1@@0 T@T) ) (! (= (FieldTypeInv0 (FieldType arg0@@12 arg1@@0)) arg0@@12)
 :qid |typeInv:FieldTypeInv0|
 :pattern ( (FieldType arg0@@12 arg1@@0))
))) (forall ((arg0@@13 T@T) (arg1@@1 T@T) ) (! (= (FieldTypeInv1 (FieldType arg0@@13 arg1@@1)) arg1@@1)
 :qid |typeInv:FieldTypeInv1|
 :pattern ( (FieldType arg0@@13 arg1@@1))
))) (= (Ctor NormalFieldType) 7)) (= (type $allocated) (FieldType NormalFieldType boolType))) (= (Ctor RefType) 8)) (= (type f$m2) (FieldType NormalFieldType RefType))) (= (type f$m5) (FieldType NormalFieldType RefType))) (= (type val_int) (FieldType NormalFieldType intType))) (= (type val_ref) (FieldType NormalFieldType RefType))))
(assert (distinct $allocated f$m2 f$m5 val_int val_ref)
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
(assert  (and (= (Ctor PredicateType_PType) 12) (forall ((arg0@@25 T@U) ) (! (= (type (P arg0@@25)) (FieldType PredicateType_PType FrameTypeType))
 :qid |funType:P|
 :pattern ( (P arg0@@25))
))))
(assert (forall ((self T@U) ) (!  (=> (= (type self) RefType) (IsPredicateField (P self)))
 :qid |stdinbpl.800:15|
 :skolemid |51|
 :pattern ( (P self))
)))
(assert  (and (= (Ctor PredicateType_u32Type) 13) (forall ((arg0@@26 T@U) ) (! (= (type (u32 arg0@@26)) (FieldType PredicateType_u32Type FrameTypeType))
 :qid |funType:u32|
 :pattern ( (u32 arg0@@26))
))))
(assert (forall ((self@@0 T@U) ) (!  (=> (= (type self@@0) RefType) (IsPredicateField (u32 self@@0)))
 :qid |stdinbpl.872:15|
 :skolemid |57|
 :pattern ( (u32 self@@0))
)))
(assert (forall ((Heap@@2 T@U) (_pure_1 T@U) ) (!  (=> (and (= (type Heap@@2) (MapType0Type RefType)) (= (type _pure_1) RefType)) (dummyFunction (bool_2_U (|f#triggerStateless| _pure_1))))
 :qid |stdinbpl.207:15|
 :skolemid |23|
 :pattern ( (|f'| Heap@@2 _pure_1))
)))
(assert (forall ((Heap@@3 T@U) (self@@1 T@U) ) (!  (=> (and (= (type Heap@@3) (MapType0Type RefType)) (= (type self@@1) RefType)) (|P#everUsed| (P self@@1)))
 :qid |stdinbpl.819:15|
 :skolemid |55|
 :pattern ( (|P#trigger| Heap@@3 (P self@@1)))
)))
(assert (forall ((Heap@@4 T@U) (self@@2 T@U) ) (!  (=> (and (= (type Heap@@4) (MapType0Type RefType)) (= (type self@@2) RefType)) (|u32#everUsed| (u32 self@@2)))
 :qid |stdinbpl.891:15|
 :skolemid |61|
 :pattern ( (|u32#trigger| Heap@@4 (u32 self@@2)))
)))
(assert (= (type EmptyFrame) FrameTypeType))
(assert (forall ((Heap@@5 T@U) (Mask@@2 T@U) ) (!  (=> (and (and (= (type Heap@@5) (MapType0Type RefType)) (= (type Mask@@2) (MapType1Type RefType realType))) (and (state Heap@@5 Mask@@2) (or (< AssumeFunctionsAbove 1) (|read$#trigger| EmptyFrame)))) (< NoPerm (|read$'| Heap@@5)))
 :qid |stdinbpl.763:15|
 :skolemid |49|
 :pattern ( (state Heap@@5 Mask@@2) (|read$'| Heap@@5))
)))
(assert (forall ((Heap@@6 T@U) (ExhaleHeap@@1 T@U) (Mask@@3 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@6) (MapType0Type RefType)) (= (type ExhaleHeap@@1) (MapType0Type RefType))) (= (type Mask@@3) (MapType1Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@6 ExhaleHeap@@1 Mask@@3)) (U_2_bool (MapType0Select Heap@@6 o_1 $allocated))) (U_2_bool (MapType0Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.73:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@6 ExhaleHeap@@1 Mask@@3) (MapType0Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert (forall ((self@@3 T@U) (self2 T@U) ) (!  (=> (and (and (= (type self@@3) RefType) (= (type self2) RefType)) (= (P self@@3) (P self2))) (= self@@3 self2))
 :qid |stdinbpl.810:15|
 :skolemid |53|
 :pattern ( (P self@@3) (P self2))
)))
(assert (forall ((arg0@@27 T@U) ) (! (= (type (|P#sm| arg0@@27)) (FieldType PredicateType_PType (MapType1Type RefType boolType)))
 :qid |funType:P#sm|
 :pattern ( (|P#sm| arg0@@27))
)))
(assert (forall ((self@@4 T@U) (self2@@0 T@U) ) (!  (=> (and (and (= (type self@@4) RefType) (= (type self2@@0) RefType)) (= (|P#sm| self@@4) (|P#sm| self2@@0))) (= self@@4 self2@@0))
 :qid |stdinbpl.814:15|
 :skolemid |54|
 :pattern ( (|P#sm| self@@4) (|P#sm| self2@@0))
)))
(assert (forall ((self@@5 T@U) (self2@@1 T@U) ) (!  (=> (and (and (= (type self@@5) RefType) (= (type self2@@1) RefType)) (= (u32 self@@5) (u32 self2@@1))) (= self@@5 self2@@1))
 :qid |stdinbpl.882:15|
 :skolemid |59|
 :pattern ( (u32 self@@5) (u32 self2@@1))
)))
(assert (forall ((arg0@@28 T@U) ) (! (= (type (|u32#sm| arg0@@28)) (FieldType PredicateType_u32Type (MapType1Type RefType boolType)))
 :qid |funType:u32#sm|
 :pattern ( (|u32#sm| arg0@@28))
)))
(assert (forall ((self@@6 T@U) (self2@@2 T@U) ) (!  (=> (and (and (= (type self@@6) RefType) (= (type self2@@2) RefType)) (= (|u32#sm| self@@6) (|u32#sm| self2@@2))) (= self@@6 self2@@2))
 :qid |stdinbpl.886:15|
 :skolemid |60|
 :pattern ( (|u32#sm| self@@6) (|u32#sm| self2@@2))
)))
(assert (forall ((Heap@@7 T@U) (ExhaleHeap@@2 T@U) (Mask@@4 T@U) (o_1@@0 T@U) (f_2 T@U) ) (! (let ((B@@1 (FieldTypeInv1 (type f_2))))
(let ((A@@1 (FieldTypeInv0 (type f_2))))
 (=> (and (and (and (and (and (and (= (type Heap@@7) (MapType0Type RefType)) (= (type ExhaleHeap@@2) (MapType0Type RefType))) (= (type Mask@@4) (MapType1Type RefType realType))) (= (type o_1@@0) RefType)) (= (type f_2) (FieldType A@@1 B@@1))) (IdenticalOnKnownLocations Heap@@7 ExhaleHeap@@2 Mask@@4)) (HasDirectPerm Mask@@4 o_1@@0 f_2)) (= (MapType0Select Heap@@7 o_1@@0 f_2) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2)))))
 :qid |stdinbpl.42:22|
 :skolemid |1|
 :pattern ( (IdenticalOnKnownLocations Heap@@7 ExhaleHeap@@2 Mask@@4) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2))
)))
(assert  (and (= (type dummyHeap) (MapType0Type RefType)) (= (type ZeroMask) (MapType1Type RefType realType))))
(assert (state dummyHeap ZeroMask))
(assert (forall ((p T@U) (v_1 T@U) (w T@U) ) (! (let ((A@@2 (FieldTypeInv0 (type p))))
 (=> (and (and (= (type p) (FieldType A@@2 FrameTypeType)) (= (type v_1) FrameTypeType)) (= (type w) FrameTypeType)) (not (InsidePredicate p v_1 p w))))
 :qid |stdinbpl.174:19|
 :skolemid |21|
 :pattern ( (InsidePredicate p v_1 p w))
)))
(assert  (not (IsPredicateField f$m2)))
(assert  (not (IsWandField f$m2)))
(assert  (not (IsPredicateField f$m5)))
(assert  (not (IsWandField f$m5)))
(assert  (not (IsPredicateField val_int)))
(assert  (not (IsWandField val_int)))
(assert  (not (IsPredicateField val_ref)))
(assert  (not (IsWandField val_ref)))
(assert (forall ((Heap@@8 T@U) (ExhaleHeap@@3 T@U) (Mask@@5 T@U) ) (!  (=> (and (and (and (= (type Heap@@8) (MapType0Type RefType)) (= (type ExhaleHeap@@3) (MapType0Type RefType))) (= (type Mask@@5) (MapType1Type RefType realType))) (IdenticalOnKnownLocations Heap@@8 ExhaleHeap@@3 Mask@@5)) (succHeap Heap@@8 ExhaleHeap@@3))
 :qid |stdinbpl.83:15|
 :skolemid |10|
 :pattern ( (IdenticalOnKnownLocations Heap@@8 ExhaleHeap@@3 Mask@@5))
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
(assert (forall ((arg0@@29 Real) (arg1@@9 T@U) ) (! (= (type (ConditionalFrame arg0@@29 arg1@@9)) FrameTypeType)
 :qid |funType:ConditionalFrame|
 :pattern ( (ConditionalFrame arg0@@29 arg1@@9))
)))
(assert (forall ((p@@0 Real) (f_6 T@U) ) (!  (=> (= (type f_6) FrameTypeType) (= (ConditionalFrame p@@0 f_6) (ite (> p@@0 0.0) f_6 EmptyFrame)))
 :qid |stdinbpl.162:15|
 :skolemid |19|
 :pattern ( (ConditionalFrame p@@0 f_6))
)))
(assert (forall ((Heap@@9 T@U) ) (!  (=> (= (type Heap@@9) (MapType0Type RefType)) (and (= (read$ Heap@@9) (|read$'| Heap@@9)) (dummyFunction (real_2_U |read$#triggerStateless|))))
 :qid |stdinbpl.746:15|
 :skolemid |46|
 :pattern ( (read$ Heap@@9))
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
(assert (forall ((Heap@@10 T@U) (Mask@@7 T@U) (_pure_1@@0 T@U) ) (!  (=> (and (and (and (= (type Heap@@10) (MapType0Type RefType)) (= (type Mask@@7) (MapType1Type RefType realType))) (= (type _pure_1@@0) RefType)) (and (state Heap@@10 Mask@@7) (< AssumeFunctionsAbove 0))) (= (f_6@@0 Heap@@10 _pure_1@@0) (= (ite  (or (>= (U_2_int (MapType0Select Heap@@10 (MapType0Select Heap@@10 _pure_1@@0 f$m2) val_int)) 0) (= (mod (U_2_int (MapType0Select Heap@@10 (MapType0Select Heap@@10 _pure_1@@0 f$m2) val_int)) 2) 0)) (mod (U_2_int (MapType0Select Heap@@10 (MapType0Select Heap@@10 _pure_1@@0 f$m2) val_int)) 2) 0) 0)))
 :qid |stdinbpl.213:15|
 :skolemid |24|
 :pattern ( (state Heap@@10 Mask@@7) (f_6@@0 Heap@@10 _pure_1@@0))
 :pattern ( (state Heap@@10 Mask@@7) (|f#triggerStateless| _pure_1@@0) (|P#trigger| Heap@@10 (P _pure_1@@0)))
)))
(assert (forall ((Heap@@11 T@U) (_pure_1@@1 T@U) ) (!  (=> (and (= (type Heap@@11) (MapType0Type RefType)) (= (type _pure_1@@1) RefType)) (and (= (f_6@@0 Heap@@11 _pure_1@@1) (|f'| Heap@@11 _pure_1@@1)) (dummyFunction (bool_2_U (|f#triggerStateless| _pure_1@@1)))))
 :qid |stdinbpl.203:15|
 :skolemid |22|
 :pattern ( (f_6@@0 Heap@@11 _pure_1@@1))
)))
(assert (forall ((Heap@@12 T@U) (ExhaleHeap@@4 T@U) (Mask@@8 T@U) (pm_f@@1 T@U) ) (! (let ((C@@1 (FieldTypeInv0 (type pm_f@@1))))
 (=> (and (and (and (and (and (= (type Heap@@12) (MapType0Type RefType)) (= (type ExhaleHeap@@4) (MapType0Type RefType))) (= (type Mask@@8) (MapType1Type RefType realType))) (= (type pm_f@@1) (FieldType C@@1 FrameTypeType))) (IdenticalOnKnownLocations Heap@@12 ExhaleHeap@@4 Mask@@8)) (and (HasDirectPerm Mask@@8 null pm_f@@1) (IsPredicateField pm_f@@1))) (forall ((o2 T@U) (f_2@@0 T@U) ) (! (let ((B@@5 (FieldTypeInv1 (type f_2@@0))))
(let ((A@@6 (FieldTypeInv0 (type f_2@@0))))
 (=> (and (and (= (type o2) RefType) (= (type f_2@@0) (FieldType A@@6 B@@5))) (U_2_bool (MapType1Select (MapType0Select Heap@@12 null (PredicateMaskField pm_f@@1)) o2 f_2@@0))) (= (MapType0Select Heap@@12 o2 f_2@@0) (MapType0Select ExhaleHeap@@4 o2 f_2@@0)))))
 :qid |stdinbpl.54:134|
 :skolemid |3|
 :pattern ( (MapType0Select ExhaleHeap@@4 o2 f_2@@0))
))))
 :qid |stdinbpl.52:19|
 :skolemid |4|
 :pattern ( (IdenticalOnKnownLocations Heap@@12 ExhaleHeap@@4 Mask@@8) (IsPredicateField pm_f@@1))
)))
(assert (forall ((Heap@@13 T@U) (ExhaleHeap@@5 T@U) (Mask@@9 T@U) (pm_f@@2 T@U) ) (! (let ((C@@2 (FieldTypeInv0 (type pm_f@@2))))
 (=> (and (and (and (and (and (= (type Heap@@13) (MapType0Type RefType)) (= (type ExhaleHeap@@5) (MapType0Type RefType))) (= (type Mask@@9) (MapType1Type RefType realType))) (= (type pm_f@@2) (FieldType C@@2 FrameTypeType))) (IdenticalOnKnownLocations Heap@@13 ExhaleHeap@@5 Mask@@9)) (and (HasDirectPerm Mask@@9 null pm_f@@2) (IsWandField pm_f@@2))) (forall ((o2@@0 T@U) (f_2@@1 T@U) ) (! (let ((B@@6 (FieldTypeInv1 (type f_2@@1))))
(let ((A@@7 (FieldTypeInv0 (type f_2@@1))))
 (=> (and (and (= (type o2@@0) RefType) (= (type f_2@@1) (FieldType A@@7 B@@6))) (U_2_bool (MapType1Select (MapType0Select Heap@@13 null (WandMaskField pm_f@@2)) o2@@0 f_2@@1))) (= (MapType0Select Heap@@13 o2@@0 f_2@@1) (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1)))))
 :qid |stdinbpl.67:129|
 :skolemid |6|
 :pattern ( (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1))
))))
 :qid |stdinbpl.65:19|
 :skolemid |7|
 :pattern ( (IdenticalOnKnownLocations Heap@@13 ExhaleHeap@@5 Mask@@9) (IsWandField pm_f@@2))
)))
(assert (forall ((self@@7 T@U) ) (!  (=> (= (type self@@7) RefType) (= (getPredWandId (P self@@7)) 0))
 :qid |stdinbpl.804:15|
 :skolemid |52|
 :pattern ( (P self@@7))
)))
(assert (forall ((self@@8 T@U) ) (!  (=> (= (type self@@8) RefType) (= (getPredWandId (u32 self@@8)) 1))
 :qid |stdinbpl.876:15|
 :skolemid |58|
 :pattern ( (u32 self@@8))
)))
(assert (forall ((Mask@@10 T@U) (o_2@@2 T@U) (f_4@@2 T@U) ) (! (let ((B@@7 (FieldTypeInv1 (type f_4@@2))))
(let ((A@@8 (FieldTypeInv0 (type f_4@@2))))
 (=> (and (and (and (= (type Mask@@10) (MapType1Type RefType realType)) (= (type o_2@@2) RefType)) (= (type f_4@@2) (FieldType A@@8 B@@7))) (GoodMask Mask@@10)) (and (>= (U_2_real (MapType1Select Mask@@10 o_2@@2 f_4@@2)) NoPerm) (=> (and (and (GoodMask Mask@@10) (not (IsPredicateField f_4@@2))) (not (IsWandField f_4@@2))) (<= (U_2_real (MapType1Select Mask@@10 o_2@@2 f_4@@2)) FullPerm))))))
 :qid |stdinbpl.128:22|
 :skolemid |16|
 :pattern ( (GoodMask Mask@@10) (MapType1Select Mask@@10 o_2@@2 f_4@@2))
)))
(assert (forall ((Heap@@14 T@U) ) (!  (=> (= (type Heap@@14) (MapType0Type RefType)) (dummyFunction (real_2_U |read$#triggerStateless|)))
 :qid |stdinbpl.750:15|
 :skolemid |47|
 :pattern ( (|read$'| Heap@@14))
)))
(assert (forall ((o T@U) (f T@U) (Heap@@15 T@U) ) (!  (=> (and (and (and (= (type o) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap@@15) (MapType0Type RefType))) (U_2_bool (MapType0Select Heap@@15 o $allocated))) (U_2_bool (MapType0Select Heap@@15 (MapType0Select Heap@@15 o f) $allocated)))
 :qid |stdinbpl.31:15|
 :skolemid |0|
 :pattern ( (MapType0Select Heap@@15 o f))
)))
(assert (forall ((Heap@@16 T@U) (Mask@@11 T@U) (_pure_1@@2 T@U) ) (!  (=> (and (and (and (= (type Heap@@16) (MapType0Type RefType)) (= (type Mask@@11) (MapType1Type RefType realType))) (= (type _pure_1@@2) RefType)) (state Heap@@16 Mask@@11)) (= (|f'| Heap@@16 _pure_1@@2) (|f#frame| (ConditionalFrame (read$ Heap@@16) (MapType0Select Heap@@16 null (P _pure_1@@2))) _pure_1@@2)))
 :qid |stdinbpl.220:15|
 :skolemid |25|
 :pattern ( (state Heap@@16 Mask@@11) (|f'| Heap@@16 _pure_1@@2))
)))
(assert (forall ((Heap@@17 T@U) (Mask@@12 T@U) ) (!  (=> (and (and (= (type Heap@@17) (MapType0Type RefType)) (= (type Mask@@12) (MapType1Type RefType realType))) (state Heap@@17 Mask@@12)) (= (|read$'| Heap@@17) (|read$#frame| EmptyFrame)))
 :qid |stdinbpl.757:15|
 :skolemid |48|
 :pattern ( (state Heap@@17 Mask@@12) (|read$'| Heap@@17))
)))
(assert (forall ((self@@9 T@U) ) (!  (=> (= (type self@@9) RefType) (= (PredicateMaskField (P self@@9)) (|P#sm| self@@9)))
 :qid |stdinbpl.796:15|
 :skolemid |50|
 :pattern ( (PredicateMaskField (P self@@9)))
)))
(assert (forall ((self@@10 T@U) ) (!  (=> (= (type self@@10) RefType) (= (PredicateMaskField (u32 self@@10)) (|u32#sm| self@@10)))
 :qid |stdinbpl.868:15|
 :skolemid |56|
 :pattern ( (PredicateMaskField (u32 self@@10)))
)))
(assert (forall ((Heap@@18 T@U) (o@@0 T@U) (f_3 T@U) (v T@U) ) (! (let ((B@@8 (type v)))
(let ((A@@9 (FieldTypeInv0 (type f_3))))
 (=> (and (and (= (type Heap@@18) (MapType0Type RefType)) (= (type o@@0) RefType)) (= (type f_3) (FieldType A@@9 B@@8))) (succHeap Heap@@18 (MapType0Store Heap@@18 o@@0 f_3 v)))))
 :qid |stdinbpl.78:22|
 :skolemid |9|
 :pattern ( (MapType0Store Heap@@18 o@@0 f_3 v))
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
(declare-fun Unfolding1Mask@5 () T@U)
(declare-fun _pure_1@@3 () T@U)
(declare-fun Heap@25 () T@U)
(declare-fun UnfoldingHeap@2 () T@U)
(declare-fun UnfoldingMask@14 () T@U)
(declare-fun Heap@26 () T@U)
(declare-fun newPMask@10 () T@U)
(declare-fun Heap@27 () T@U)
(declare-fun Heap@28 () T@U)
(declare-fun newPMask@11 () T@U)
(declare-fun Heap@29 () T@U)
(declare-fun Mask@0 () T@U)
(declare-fun Heap@30 () T@U)
(declare-fun Heap@31 () T@U)
(declare-fun newPMask@12 () T@U)
(declare-fun Heap@32 () T@U)
(declare-fun Heap@33 () T@U)
(declare-fun newPMask@13 () T@U)
(declare-fun Heap@34 () T@U)
(declare-fun Heap@35 () T@U)
(declare-fun Heap@36 () T@U)
(declare-fun Unfolding1Mask@4 () T@U)
(declare-fun perm@20 () Real)
(declare-fun perm@21 () Real)
(declare-fun FrameFragment (T@U) T@U)
(declare-fun UnfoldingMask@10 () T@U)
(declare-fun perm@15 () Real)
(declare-fun perm@16 () Real)
(declare-fun UnfoldingMask@11 () T@U)
(declare-fun perm@17 () Real)
(declare-fun UnfoldingMask@12 () T@U)
(declare-fun perm@18 () Real)
(declare-fun UnfoldingMask@13 () T@U)
(declare-fun perm@19 () Real)
(declare-fun CombineFrames (T@U T@U) T@U)
(declare-fun Unfolding1Mask@3 () T@U)
(declare-fun Heap@9 () T@U)
(declare-fun UnfoldingHeap@1 () T@U)
(declare-fun UnfoldingMask@9 () T@U)
(declare-fun Heap@10 () T@U)
(declare-fun newPMask@4 () T@U)
(declare-fun Heap@11 () T@U)
(declare-fun Heap@12 () T@U)
(declare-fun newPMask@5 () T@U)
(declare-fun Heap@13 () T@U)
(declare-fun Heap@14 () T@U)
(declare-fun Heap@15 () T@U)
(declare-fun newPMask@6 () T@U)
(declare-fun Heap@16 () T@U)
(declare-fun Heap@17 () T@U)
(declare-fun newPMask@7 () T@U)
(declare-fun Heap@18 () T@U)
(declare-fun Heap@19 () T@U)
(declare-fun Heap@20 () T@U)
(declare-fun newPMask@8 () T@U)
(declare-fun Heap@21 () T@U)
(declare-fun Heap@22 () T@U)
(declare-fun newPMask@9 () T@U)
(declare-fun Heap@23 () T@U)
(declare-fun Heap@24 () T@U)
(declare-fun Unfolding1Mask@2 () T@U)
(declare-fun perm@13 () Real)
(declare-fun perm@14 () Real)
(declare-fun UnfoldingMask@5 () T@U)
(declare-fun perm@8 () Real)
(declare-fun perm@9 () Real)
(declare-fun UnfoldingMask@6 () T@U)
(declare-fun perm@10 () Real)
(declare-fun UnfoldingMask@7 () T@U)
(declare-fun perm@11 () Real)
(declare-fun UnfoldingMask@8 () T@U)
(declare-fun perm@12 () Real)
(declare-fun Unfolding1Mask@1 () T@U)
(declare-fun Heap@@19 () T@U)
(declare-fun UnfoldingHeap@0 () T@U)
(declare-fun UnfoldingMask@4 () T@U)
(declare-fun Heap@0 () T@U)
(declare-fun newPMask@0 () T@U)
(declare-fun Heap@1 () T@U)
(declare-fun Heap@2 () T@U)
(declare-fun newPMask@1 () T@U)
(declare-fun Heap@3 () T@U)
(declare-fun Heap@4 () T@U)
(declare-fun Heap@5 () T@U)
(declare-fun newPMask@2 () T@U)
(declare-fun Heap@6 () T@U)
(declare-fun Heap@7 () T@U)
(declare-fun newPMask@3 () T@U)
(declare-fun Heap@8 () T@U)
(declare-fun Unfolding1Mask@0 () T@U)
(declare-fun perm@6 () Real)
(declare-fun perm@7 () Real)
(declare-fun UnfoldingMask@0 () T@U)
(declare-fun perm@1 () Real)
(declare-fun perm@2 () Real)
(declare-fun UnfoldingMask@1 () T@U)
(declare-fun perm@3 () Real)
(declare-fun UnfoldingMask@2 () T@U)
(declare-fun perm@4 () Real)
(declare-fun UnfoldingMask@3 () T@U)
(declare-fun perm@5 () Real)
(declare-fun perm@0 () Real)
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (= (type Heap@25) (MapType0Type RefType)) (= (type _pure_1@@3) RefType)) (= (type Heap@36) (MapType0Type RefType))) (= (type Unfolding1Mask@5) (MapType1Type RefType realType))) (= (type UnfoldingHeap@2) (MapType0Type RefType))) (= (type UnfoldingMask@14) (MapType1Type RefType realType))) (= (type Heap@26) (MapType0Type RefType))) (= (type newPMask@10) (MapType1Type RefType boolType))) (= (type Heap@27) (MapType0Type RefType))) (= (type Heap@28) (MapType0Type RefType))) (= (type newPMask@11) (MapType1Type RefType boolType))) (= (type Heap@29) (MapType0Type RefType))) (= (type Mask@0) (MapType1Type RefType realType))) (= (type Heap@30) (MapType0Type RefType))) (= (type Heap@31) (MapType0Type RefType))) (= (type newPMask@12) (MapType1Type RefType boolType))) (= (type Heap@32) (MapType0Type RefType))) (= (type Heap@33) (MapType0Type RefType))) (= (type newPMask@13) (MapType1Type RefType boolType))) (= (type Heap@34) (MapType0Type RefType))) (= (type Heap@35) (MapType0Type RefType))) (= (type Unfolding1Mask@4) (MapType1Type RefType realType))) (forall ((arg0@@30 T@U) ) (! (= (type (FrameFragment arg0@@30)) FrameTypeType)
 :qid |funType:FrameFragment|
 :pattern ( (FrameFragment arg0@@30))
))) (= (type UnfoldingMask@10) (MapType1Type RefType realType))) (= (type UnfoldingMask@11) (MapType1Type RefType realType))) (= (type UnfoldingMask@12) (MapType1Type RefType realType))) (= (type UnfoldingMask@13) (MapType1Type RefType realType))) (forall ((arg0@@31 T@U) (arg1@@10 T@U) ) (! (= (type (CombineFrames arg0@@31 arg1@@10)) FrameTypeType)
 :qid |funType:CombineFrames|
 :pattern ( (CombineFrames arg0@@31 arg1@@10))
))) (= (type Heap@9) (MapType0Type RefType))) (= (type Unfolding1Mask@3) (MapType1Type RefType realType))) (= (type UnfoldingHeap@1) (MapType0Type RefType))) (= (type UnfoldingMask@9) (MapType1Type RefType realType))) (= (type Heap@10) (MapType0Type RefType))) (= (type newPMask@4) (MapType1Type RefType boolType))) (= (type Heap@11) (MapType0Type RefType))) (= (type Heap@12) (MapType0Type RefType))) (= (type newPMask@5) (MapType1Type RefType boolType))) (= (type Heap@13) (MapType0Type RefType))) (= (type Heap@14) (MapType0Type RefType))) (= (type Heap@15) (MapType0Type RefType))) (= (type newPMask@6) (MapType1Type RefType boolType))) (= (type Heap@16) (MapType0Type RefType))) (= (type Heap@17) (MapType0Type RefType))) (= (type newPMask@7) (MapType1Type RefType boolType))) (= (type Heap@18) (MapType0Type RefType))) (= (type Heap@19) (MapType0Type RefType))) (= (type Heap@20) (MapType0Type RefType))) (= (type newPMask@8) (MapType1Type RefType boolType))) (= (type Heap@21) (MapType0Type RefType))) (= (type Heap@22) (MapType0Type RefType))) (= (type newPMask@9) (MapType1Type RefType boolType))) (= (type Heap@23) (MapType0Type RefType))) (= (type Heap@24) (MapType0Type RefType))) (= (type Unfolding1Mask@2) (MapType1Type RefType realType))) (= (type UnfoldingMask@5) (MapType1Type RefType realType))) (= (type UnfoldingMask@6) (MapType1Type RefType realType))) (= (type UnfoldingMask@7) (MapType1Type RefType realType))) (= (type UnfoldingMask@8) (MapType1Type RefType realType))) (= (type Unfolding1Mask@1) (MapType1Type RefType realType))) (= (type Heap@@19) (MapType0Type RefType))) (= (type UnfoldingHeap@0) (MapType0Type RefType))) (= (type UnfoldingMask@4) (MapType1Type RefType realType))) (= (type Heap@0) (MapType0Type RefType))) (= (type newPMask@0) (MapType1Type RefType boolType))) (= (type Heap@1) (MapType0Type RefType))) (= (type Heap@2) (MapType0Type RefType))) (= (type newPMask@1) (MapType1Type RefType boolType))) (= (type Heap@3) (MapType0Type RefType))) (= (type Heap@4) (MapType0Type RefType))) (= (type Heap@5) (MapType0Type RefType))) (= (type newPMask@2) (MapType1Type RefType boolType))) (= (type Heap@6) (MapType0Type RefType))) (= (type Heap@7) (MapType0Type RefType))) (= (type newPMask@3) (MapType1Type RefType boolType))) (= (type Heap@8) (MapType0Type RefType))) (= (type Unfolding1Mask@0) (MapType1Type RefType realType))) (= (type UnfoldingMask@0) (MapType1Type RefType realType))) (= (type UnfoldingMask@1) (MapType1Type RefType realType))) (= (type UnfoldingMask@2) (MapType1Type RefType realType))) (= (type UnfoldingMask@3) (MapType1Type RefType realType))))
(set-info :boogie-vc-id |f#definedness|)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 82) (let ((anon40_Then_correct true))
(let ((anon38_Then_correct true))
(let ((anon45_Then_correct true))
(let ((anon43_Then_correct true))
(let ((anon30_correct true))
(let ((anon45_Else_correct  (and (=> (= (ControlFlow 0 8) (- 0 10)) (HasDirectPerm Unfolding1Mask@5 _pure_1@@3 f$m2)) (=> (HasDirectPerm Unfolding1Mask@5 _pure_1@@3 f$m2) (and (=> (= (ControlFlow 0 8) (- 0 9)) (HasDirectPerm Unfolding1Mask@5 (MapType0Select Heap@25 _pure_1@@3 f$m2) val_int)) (=> (HasDirectPerm Unfolding1Mask@5 (MapType0Select Heap@25 _pure_1@@3 f$m2) val_int) (=> (and (= UnfoldingHeap@2 (MapType0Store Heap@25 null (|u32#sm| (MapType0Select Heap@25 _pure_1@@3 f$m2)) (MapType1Store (MapType0Select Heap@25 null (|u32#sm| (MapType0Select Heap@25 _pure_1@@3 f$m2))) (MapType0Select Heap@25 _pure_1@@3 f$m2) val_int (bool_2_U true)))) (state UnfoldingHeap@2 UnfoldingMask@14)) (=> (and (and (= Heap@26 (MapType0Store Heap@25 null (|P#sm| _pure_1@@3) (MapType1Store (MapType0Select Heap@25 null (|P#sm| _pure_1@@3)) _pure_1@@3 f$m2 (bool_2_U true)))) (forall ((o_13 T@U) (f_17 T@U) ) (! (let ((B@@11 (FieldTypeInv1 (type f_17))))
(let ((A@@12 (FieldTypeInv0 (type f_17))))
 (=> (and (and (= (type o_13) RefType) (= (type f_17) (FieldType A@@12 B@@11))) (or (U_2_bool (MapType1Select (MapType0Select Heap@26 null (|P#sm| _pure_1@@3)) o_13 f_17)) (U_2_bool (MapType1Select (MapType0Select Heap@26 null (|u32#sm| (MapType0Select Heap@26 _pure_1@@3 f$m2))) o_13 f_17)))) (U_2_bool (MapType1Select newPMask@10 o_13 f_17)))))
 :qid |stdinbpl.646:33|
 :skolemid |36|
 :pattern ( (MapType1Select newPMask@10 o_13 f_17))
))) (and (= Heap@27 (MapType0Store Heap@26 null (|P#sm| _pure_1@@3) newPMask@10)) (= Heap@28 (MapType0Store Heap@27 null (|P#sm| _pure_1@@3) (MapType1Store (MapType0Select Heap@27 null (|P#sm| _pure_1@@3)) _pure_1@@3 f$m5 (bool_2_U true)))))) (=> (and (and (and (and (forall ((o_14 T@U) (f_18 T@U) ) (! (let ((B@@12 (FieldTypeInv1 (type f_18))))
(let ((A@@13 (FieldTypeInv0 (type f_18))))
 (=> (and (and (= (type o_14) RefType) (= (type f_18) (FieldType A@@13 B@@12))) (or (U_2_bool (MapType1Select (MapType0Select Heap@28 null (|P#sm| _pure_1@@3)) o_14 f_18)) (U_2_bool (MapType1Select (MapType0Select Heap@28 null (|u32#sm| (MapType0Select Heap@28 _pure_1@@3 f$m5))) o_14 f_18)))) (U_2_bool (MapType1Select newPMask@11 o_14 f_18)))))
 :qid |stdinbpl.653:33|
 :skolemid |37|
 :pattern ( (MapType1Select newPMask@11 o_14 f_18))
)) (= Heap@29 (MapType0Store Heap@28 null (|P#sm| _pure_1@@3) newPMask@11))) (and (state Heap@29 Mask@0) (= Heap@30 (MapType0Store Heap@29 null (|u32#sm| (MapType0Select Heap@29 _pure_1@@3 f$m2)) (MapType1Store (MapType0Select Heap@29 null (|u32#sm| (MapType0Select Heap@29 _pure_1@@3 f$m2))) (MapType0Select Heap@29 _pure_1@@3 f$m2) val_int (bool_2_U true)))))) (and (and (state Heap@30 Mask@0) (= Heap@31 (MapType0Store Heap@30 null (|P#sm| _pure_1@@3) (MapType1Store (MapType0Select Heap@30 null (|P#sm| _pure_1@@3)) _pure_1@@3 f$m2 (bool_2_U true))))) (and (forall ((o_15 T@U) (f_19 T@U) ) (! (let ((B@@13 (FieldTypeInv1 (type f_19))))
(let ((A@@14 (FieldTypeInv0 (type f_19))))
 (=> (and (and (= (type o_15) RefType) (= (type f_19) (FieldType A@@14 B@@13))) (or (U_2_bool (MapType1Select (MapType0Select Heap@31 null (|P#sm| _pure_1@@3)) o_15 f_19)) (U_2_bool (MapType1Select (MapType0Select Heap@31 null (|u32#sm| (MapType0Select Heap@31 _pure_1@@3 f$m2))) o_15 f_19)))) (U_2_bool (MapType1Select newPMask@12 o_15 f_19)))))
 :qid |stdinbpl.665:33|
 :skolemid |38|
 :pattern ( (MapType1Select newPMask@12 o_15 f_19))
)) (= Heap@32 (MapType0Store Heap@31 null (|P#sm| _pure_1@@3) newPMask@12))))) (and (and (and (= Heap@33 (MapType0Store Heap@32 null (|P#sm| _pure_1@@3) (MapType1Store (MapType0Select Heap@32 null (|P#sm| _pure_1@@3)) _pure_1@@3 f$m5 (bool_2_U true)))) (forall ((o_16 T@U) (f_20 T@U) ) (! (let ((B@@14 (FieldTypeInv1 (type f_20))))
(let ((A@@15 (FieldTypeInv0 (type f_20))))
 (=> (and (and (= (type o_16) RefType) (= (type f_20) (FieldType A@@15 B@@14))) (or (U_2_bool (MapType1Select (MapType0Select Heap@33 null (|P#sm| _pure_1@@3)) o_16 f_20)) (U_2_bool (MapType1Select (MapType0Select Heap@33 null (|u32#sm| (MapType0Select Heap@33 _pure_1@@3 f$m5))) o_16 f_20)))) (U_2_bool (MapType1Select newPMask@13 o_16 f_20)))))
 :qid |stdinbpl.672:33|
 :skolemid |39|
 :pattern ( (MapType1Select newPMask@13 o_16 f_20))
))) (and (= Heap@34 (MapType0Store Heap@33 null (|P#sm| _pure_1@@3) newPMask@13)) (state Heap@34 Mask@0))) (and (and (= Heap@35 (MapType0Store Heap@34 null (|u32#sm| (MapType0Select Heap@34 _pure_1@@3 f$m2)) (MapType1Store (MapType0Select Heap@34 null (|u32#sm| (MapType0Select Heap@34 _pure_1@@3 f$m2))) (MapType0Select Heap@34 _pure_1@@3 f$m2) val_int (bool_2_U true)))) (state Heap@35 Mask@0)) (and (= Heap@36 Heap@35) (= (ControlFlow 0 8) 4))))) anon30_correct)))))))))
(let ((anon27_correct  (=> (= Unfolding1Mask@4 (MapType1Store UnfoldingMask@14 null (u32 (MapType0Select Heap@25 _pure_1@@3 f$m2)) (real_2_U (- (U_2_real (MapType1Select UnfoldingMask@14 null (u32 (MapType0Select Heap@25 _pure_1@@3 f$m2)))) perm@20)))) (=> (and (state Heap@25 Unfolding1Mask@4) (= perm@21 (* FullPerm (read$ Heap@25)))) (and (=> (= (ControlFlow 0 11) (- 0 13)) (>= perm@21 NoPerm)) (=> (>= perm@21 NoPerm) (=> (=> (> perm@21 NoPerm) (not (= (MapType0Select Heap@25 _pure_1@@3 f$m2) null))) (=> (and (and (= Unfolding1Mask@5 (MapType1Store Unfolding1Mask@4 (MapType0Select Heap@25 _pure_1@@3 f$m2) val_int (real_2_U (+ (U_2_real (MapType1Select Unfolding1Mask@4 (MapType0Select Heap@25 _pure_1@@3 f$m2) val_int)) perm@21)))) (state Heap@25 Unfolding1Mask@5)) (and (<= 0 (U_2_int (MapType0Select Heap@25 (MapType0Select Heap@25 _pure_1@@3 f$m2) val_int))) (state Heap@25 Unfolding1Mask@5))) (and (=> (= (ControlFlow 0 11) (- 0 12)) (HasDirectPerm Unfolding1Mask@5 _pure_1@@3 f$m2)) (=> (HasDirectPerm Unfolding1Mask@5 _pure_1@@3 f$m2) (and (=> (= (ControlFlow 0 11) 7) anon45_Then_correct) (=> (= (ControlFlow 0 11) 8) anon45_Else_correct))))))))))))
(let ((anon44_Else_correct  (=> (and (= perm@20 NoPerm) (= (ControlFlow 0 16) 11)) anon27_correct)))
(let ((anon44_Then_correct  (=> (not (= perm@20 NoPerm)) (and (=> (= (ControlFlow 0 14) (- 0 15)) (<= perm@20 (U_2_real (MapType1Select UnfoldingMask@14 null (u32 (MapType0Select Heap@25 _pure_1@@3 f$m2)))))) (=> (<= perm@20 (U_2_real (MapType1Select UnfoldingMask@14 null (u32 (MapType0Select Heap@25 _pure_1@@3 f$m2))))) (=> (= (ControlFlow 0 14) 11) anon27_correct))))))
(let ((anon43_Else_correct  (and (=> (= (ControlFlow 0 17) (- 0 19)) (> (read$ Heap@25) NoPerm)) (=> (> (read$ Heap@25) NoPerm) (=> (|u32#trigger| Heap@25 (u32 (MapType0Select Heap@25 _pure_1@@3 f$m2))) (=> (and (= (MapType0Select Heap@25 null (u32 (MapType0Select Heap@25 _pure_1@@3 f$m2))) (FrameFragment (MapType0Select Heap@25 (MapType0Select Heap@25 _pure_1@@3 f$m2) val_int))) (= perm@20 (read$ Heap@25))) (and (=> (= (ControlFlow 0 17) (- 0 18)) (>= perm@20 NoPerm)) (=> (>= perm@20 NoPerm) (and (=> (= (ControlFlow 0 17) 14) anon44_Then_correct) (=> (= (ControlFlow 0 17) 16) anon44_Else_correct))))))))))
(let ((anon23_correct  (=> (= UnfoldingMask@10 (MapType1Store Mask@0 null (P _pure_1@@3) (real_2_U (- (U_2_real (MapType1Select Mask@0 null (P _pure_1@@3))) perm@15)))) (=> (and (state Heap@25 UnfoldingMask@10) (= perm@16 (* FullPerm (read$ Heap@25)))) (and (=> (= (ControlFlow 0 20) (- 0 24)) (>= perm@16 NoPerm)) (=> (>= perm@16 NoPerm) (=> (=> (> perm@16 NoPerm) (not (= _pure_1@@3 null))) (=> (and (and (= UnfoldingMask@11 (MapType1Store UnfoldingMask@10 _pure_1@@3 f$m2 (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@10 _pure_1@@3 f$m2)) perm@16)))) (state Heap@25 UnfoldingMask@11)) (and (state Heap@25 UnfoldingMask@11) (= perm@17 (* FullPerm (read$ Heap@25))))) (and (=> (= (ControlFlow 0 20) (- 0 23)) (>= perm@17 NoPerm)) (=> (>= perm@17 NoPerm) (=> (= UnfoldingMask@12 (MapType1Store UnfoldingMask@11 null (u32 (MapType0Select Heap@25 _pure_1@@3 f$m2)) (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@11 null (u32 (MapType0Select Heap@25 _pure_1@@3 f$m2)))) perm@17)))) (=> (and (and (InsidePredicate (P _pure_1@@3) (MapType0Select Heap@25 null (P _pure_1@@3)) (u32 (MapType0Select Heap@25 _pure_1@@3 f$m2)) (MapType0Select Heap@25 null (u32 (MapType0Select Heap@25 _pure_1@@3 f$m2)))) (state Heap@25 UnfoldingMask@12)) (and (state Heap@25 UnfoldingMask@12) (= perm@18 (* FullPerm (read$ Heap@25))))) (and (=> (= (ControlFlow 0 20) (- 0 22)) (>= perm@18 NoPerm)) (=> (>= perm@18 NoPerm) (=> (=> (> perm@18 NoPerm) (not (= _pure_1@@3 null))) (=> (and (and (= UnfoldingMask@13 (MapType1Store UnfoldingMask@12 _pure_1@@3 f$m5 (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@12 _pure_1@@3 f$m5)) perm@18)))) (state Heap@25 UnfoldingMask@13)) (and (state Heap@25 UnfoldingMask@13) (= perm@19 (* FullPerm (read$ Heap@25))))) (and (=> (= (ControlFlow 0 20) (- 0 21)) (>= perm@19 NoPerm)) (=> (>= perm@19 NoPerm) (=> (and (and (= UnfoldingMask@14 (MapType1Store UnfoldingMask@13 null (u32 (MapType0Select Heap@25 _pure_1@@3 f$m5)) (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@13 null (u32 (MapType0Select Heap@25 _pure_1@@3 f$m5)))) perm@19)))) (InsidePredicate (P _pure_1@@3) (MapType0Select Heap@25 null (P _pure_1@@3)) (u32 (MapType0Select Heap@25 _pure_1@@3 f$m5)) (MapType0Select Heap@25 null (u32 (MapType0Select Heap@25 _pure_1@@3 f$m5))))) (and (state Heap@25 UnfoldingMask@14) (state Heap@25 UnfoldingMask@14))) (and (=> (= (ControlFlow 0 20) 6) anon43_Then_correct) (=> (= (ControlFlow 0 20) 17) anon43_Else_correct)))))))))))))))))))))
(let ((anon42_Else_correct  (=> (and (= perm@15 NoPerm) (= (ControlFlow 0 27) 20)) anon23_correct)))
(let ((anon42_Then_correct  (=> (not (= perm@15 NoPerm)) (and (=> (= (ControlFlow 0 25) (- 0 26)) (<= perm@15 (U_2_real (MapType1Select Mask@0 null (P _pure_1@@3))))) (=> (<= perm@15 (U_2_real (MapType1Select Mask@0 null (P _pure_1@@3)))) (=> (= (ControlFlow 0 25) 20) anon23_correct))))))
(let ((anon41_Then_correct  (=> (or (>= (U_2_int (MapType0Select Heap@25 (MapType0Select Heap@25 _pure_1@@3 f$m2) val_int)) 0) (= (mod (U_2_int (MapType0Select Heap@25 (MapType0Select Heap@25 _pure_1@@3 f$m2) val_int)) 2) 0)) (and (=> (= (ControlFlow 0 28) (- 0 30)) (> (read$ Heap@25) NoPerm)) (=> (> (read$ Heap@25) NoPerm) (=> (|P#trigger| Heap@25 (P _pure_1@@3)) (=> (and (= (MapType0Select Heap@25 null (P _pure_1@@3)) (CombineFrames (FrameFragment (MapType0Select Heap@25 _pure_1@@3 f$m2)) (CombineFrames (MapType0Select Heap@25 null (u32 (MapType0Select Heap@25 _pure_1@@3 f$m2))) (CombineFrames (FrameFragment (MapType0Select Heap@25 _pure_1@@3 f$m5)) (MapType0Select Heap@25 null (u32 (MapType0Select Heap@25 _pure_1@@3 f$m5))))))) (= perm@15 (read$ Heap@25))) (and (=> (= (ControlFlow 0 28) (- 0 29)) (>= perm@15 NoPerm)) (=> (>= perm@15 NoPerm) (and (=> (= (ControlFlow 0 28) 25) anon42_Then_correct) (=> (= (ControlFlow 0 28) 27) anon42_Else_correct)))))))))))
(let ((anon41_Else_correct  (=> (not (or (>= (U_2_int (MapType0Select Heap@25 (MapType0Select Heap@25 _pure_1@@3 f$m2) val_int)) 0) (= (mod (U_2_int (MapType0Select Heap@25 (MapType0Select Heap@25 _pure_1@@3 f$m2) val_int)) 2) 0))) (=> (and (= Heap@36 Heap@25) (= (ControlFlow 0 5) 4)) anon30_correct))))
(let ((anon40_Else_correct  (and (=> (= (ControlFlow 0 34) (- 0 36)) (HasDirectPerm Unfolding1Mask@3 _pure_1@@3 f$m2)) (=> (HasDirectPerm Unfolding1Mask@3 _pure_1@@3 f$m2) (and (=> (= (ControlFlow 0 34) (- 0 35)) (HasDirectPerm Unfolding1Mask@3 (MapType0Select Heap@9 _pure_1@@3 f$m2) val_int)) (=> (HasDirectPerm Unfolding1Mask@3 (MapType0Select Heap@9 _pure_1@@3 f$m2) val_int) (=> (and (= UnfoldingHeap@1 (MapType0Store Heap@9 null (|u32#sm| (MapType0Select Heap@9 _pure_1@@3 f$m2)) (MapType1Store (MapType0Select Heap@9 null (|u32#sm| (MapType0Select Heap@9 _pure_1@@3 f$m2))) (MapType0Select Heap@9 _pure_1@@3 f$m2) val_int (bool_2_U true)))) (state UnfoldingHeap@1 UnfoldingMask@9)) (=> (and (and (= Heap@10 (MapType0Store Heap@9 null (|P#sm| _pure_1@@3) (MapType1Store (MapType0Select Heap@9 null (|P#sm| _pure_1@@3)) _pure_1@@3 f$m2 (bool_2_U true)))) (forall ((o_7 T@U) (f_11 T@U) ) (! (let ((B@@15 (FieldTypeInv1 (type f_11))))
(let ((A@@16 (FieldTypeInv0 (type f_11))))
 (=> (and (and (= (type o_7) RefType) (= (type f_11) (FieldType A@@16 B@@15))) (or (U_2_bool (MapType1Select (MapType0Select Heap@10 null (|P#sm| _pure_1@@3)) o_7 f_11)) (U_2_bool (MapType1Select (MapType0Select Heap@10 null (|u32#sm| (MapType0Select Heap@10 _pure_1@@3 f$m2))) o_7 f_11)))) (U_2_bool (MapType1Select newPMask@4 o_7 f_11)))))
 :qid |stdinbpl.495:33|
 :skolemid |30|
 :pattern ( (MapType1Select newPMask@4 o_7 f_11))
))) (and (= Heap@11 (MapType0Store Heap@10 null (|P#sm| _pure_1@@3) newPMask@4)) (= Heap@12 (MapType0Store Heap@11 null (|P#sm| _pure_1@@3) (MapType1Store (MapType0Select Heap@11 null (|P#sm| _pure_1@@3)) _pure_1@@3 f$m5 (bool_2_U true)))))) (=> (and (and (and (forall ((o_8 T@U) (f_12 T@U) ) (! (let ((B@@16 (FieldTypeInv1 (type f_12))))
(let ((A@@17 (FieldTypeInv0 (type f_12))))
 (=> (and (and (= (type o_8) RefType) (= (type f_12) (FieldType A@@17 B@@16))) (or (U_2_bool (MapType1Select (MapType0Select Heap@12 null (|P#sm| _pure_1@@3)) o_8 f_12)) (U_2_bool (MapType1Select (MapType0Select Heap@12 null (|u32#sm| (MapType0Select Heap@12 _pure_1@@3 f$m5))) o_8 f_12)))) (U_2_bool (MapType1Select newPMask@5 o_8 f_12)))))
 :qid |stdinbpl.502:33|
 :skolemid |31|
 :pattern ( (MapType1Select newPMask@5 o_8 f_12))
)) (= Heap@13 (MapType0Store Heap@12 null (|P#sm| _pure_1@@3) newPMask@5))) (and (state Heap@13 Mask@0) (= Heap@14 (MapType0Store Heap@13 null (|u32#sm| (MapType0Select Heap@13 _pure_1@@3 f$m2)) (MapType1Store (MapType0Select Heap@13 null (|u32#sm| (MapType0Select Heap@13 _pure_1@@3 f$m2))) (MapType0Select Heap@13 _pure_1@@3 f$m2) val_int (bool_2_U true)))))) (and (and (state Heap@14 Mask@0) (= Heap@15 (MapType0Store Heap@14 null (|P#sm| _pure_1@@3) (MapType1Store (MapType0Select Heap@14 null (|P#sm| _pure_1@@3)) _pure_1@@3 f$m2 (bool_2_U true))))) (and (forall ((o_9 T@U) (f_13 T@U) ) (! (let ((B@@17 (FieldTypeInv1 (type f_13))))
(let ((A@@18 (FieldTypeInv0 (type f_13))))
 (=> (and (and (= (type o_9) RefType) (= (type f_13) (FieldType A@@18 B@@17))) (or (U_2_bool (MapType1Select (MapType0Select Heap@15 null (|P#sm| _pure_1@@3)) o_9 f_13)) (U_2_bool (MapType1Select (MapType0Select Heap@15 null (|u32#sm| (MapType0Select Heap@15 _pure_1@@3 f$m2))) o_9 f_13)))) (U_2_bool (MapType1Select newPMask@6 o_9 f_13)))))
 :qid |stdinbpl.514:33|
 :skolemid |32|
 :pattern ( (MapType1Select newPMask@6 o_9 f_13))
)) (= Heap@16 (MapType0Store Heap@15 null (|P#sm| _pure_1@@3) newPMask@6))))) (=> (and (and (and (and (= Heap@17 (MapType0Store Heap@16 null (|P#sm| _pure_1@@3) (MapType1Store (MapType0Select Heap@16 null (|P#sm| _pure_1@@3)) _pure_1@@3 f$m5 (bool_2_U true)))) (forall ((o_10 T@U) (f_14 T@U) ) (! (let ((B@@18 (FieldTypeInv1 (type f_14))))
(let ((A@@19 (FieldTypeInv0 (type f_14))))
 (=> (and (and (= (type o_10) RefType) (= (type f_14) (FieldType A@@19 B@@18))) (or (U_2_bool (MapType1Select (MapType0Select Heap@17 null (|P#sm| _pure_1@@3)) o_10 f_14)) (U_2_bool (MapType1Select (MapType0Select Heap@17 null (|u32#sm| (MapType0Select Heap@17 _pure_1@@3 f$m5))) o_10 f_14)))) (U_2_bool (MapType1Select newPMask@7 o_10 f_14)))))
 :qid |stdinbpl.521:33|
 :skolemid |33|
 :pattern ( (MapType1Select newPMask@7 o_10 f_14))
))) (and (= Heap@18 (MapType0Store Heap@17 null (|P#sm| _pure_1@@3) newPMask@7)) (state Heap@18 Mask@0))) (and (and (= Heap@19 (MapType0Store Heap@18 null (|u32#sm| (MapType0Select Heap@18 _pure_1@@3 f$m2)) (MapType1Store (MapType0Select Heap@18 null (|u32#sm| (MapType0Select Heap@18 _pure_1@@3 f$m2))) (MapType0Select Heap@18 _pure_1@@3 f$m2) val_int (bool_2_U true)))) (state Heap@19 Mask@0)) (and (= Heap@20 (MapType0Store Heap@19 null (|P#sm| _pure_1@@3) (MapType1Store (MapType0Select Heap@19 null (|P#sm| _pure_1@@3)) _pure_1@@3 f$m2 (bool_2_U true)))) (forall ((o_11 T@U) (f_15 T@U) ) (! (let ((B@@19 (FieldTypeInv1 (type f_15))))
(let ((A@@20 (FieldTypeInv0 (type f_15))))
 (=> (and (and (= (type o_11) RefType) (= (type f_15) (FieldType A@@20 B@@19))) (or (U_2_bool (MapType1Select (MapType0Select Heap@20 null (|P#sm| _pure_1@@3)) o_11 f_15)) (U_2_bool (MapType1Select (MapType0Select Heap@20 null (|u32#sm| (MapType0Select Heap@20 _pure_1@@3 f$m2))) o_11 f_15)))) (U_2_bool (MapType1Select newPMask@8 o_11 f_15)))))
 :qid |stdinbpl.533:33|
 :skolemid |34|
 :pattern ( (MapType1Select newPMask@8 o_11 f_15))
))))) (and (and (and (= Heap@21 (MapType0Store Heap@20 null (|P#sm| _pure_1@@3) newPMask@8)) (= Heap@22 (MapType0Store Heap@21 null (|P#sm| _pure_1@@3) (MapType1Store (MapType0Select Heap@21 null (|P#sm| _pure_1@@3)) _pure_1@@3 f$m5 (bool_2_U true))))) (and (forall ((o_12 T@U) (f_16 T@U) ) (! (let ((B@@20 (FieldTypeInv1 (type f_16))))
(let ((A@@21 (FieldTypeInv0 (type f_16))))
 (=> (and (and (= (type o_12) RefType) (= (type f_16) (FieldType A@@21 B@@20))) (or (U_2_bool (MapType1Select (MapType0Select Heap@22 null (|P#sm| _pure_1@@3)) o_12 f_16)) (U_2_bool (MapType1Select (MapType0Select Heap@22 null (|u32#sm| (MapType0Select Heap@22 _pure_1@@3 f$m5))) o_12 f_16)))) (U_2_bool (MapType1Select newPMask@9 o_12 f_16)))))
 :qid |stdinbpl.540:33|
 :skolemid |35|
 :pattern ( (MapType1Select newPMask@9 o_12 f_16))
)) (= Heap@23 (MapType0Store Heap@22 null (|P#sm| _pure_1@@3) newPMask@9)))) (and (and (state Heap@23 Mask@0) (= Heap@24 (MapType0Store Heap@23 null (|u32#sm| (MapType0Select Heap@23 _pure_1@@3 f$m2)) (MapType1Store (MapType0Select Heap@23 null (|u32#sm| (MapType0Select Heap@23 _pure_1@@3 f$m2))) (MapType0Select Heap@23 _pure_1@@3 f$m2) val_int (bool_2_U true))))) (and (state Heap@24 Mask@0) (= Heap@25 Heap@24))))) (and (=> (= (ControlFlow 0 34) 28) anon41_Then_correct) (=> (= (ControlFlow 0 34) 5) anon41_Else_correct))))))))))))
(let ((anon17_correct  (=> (= Unfolding1Mask@2 (MapType1Store UnfoldingMask@9 null (u32 (MapType0Select Heap@9 _pure_1@@3 f$m2)) (real_2_U (- (U_2_real (MapType1Select UnfoldingMask@9 null (u32 (MapType0Select Heap@9 _pure_1@@3 f$m2)))) perm@13)))) (=> (and (state Heap@9 Unfolding1Mask@2) (= perm@14 (* FullPerm (read$ Heap@9)))) (and (=> (= (ControlFlow 0 37) (- 0 39)) (>= perm@14 NoPerm)) (=> (>= perm@14 NoPerm) (=> (=> (> perm@14 NoPerm) (not (= (MapType0Select Heap@9 _pure_1@@3 f$m2) null))) (=> (and (and (= Unfolding1Mask@3 (MapType1Store Unfolding1Mask@2 (MapType0Select Heap@9 _pure_1@@3 f$m2) val_int (real_2_U (+ (U_2_real (MapType1Select Unfolding1Mask@2 (MapType0Select Heap@9 _pure_1@@3 f$m2) val_int)) perm@14)))) (state Heap@9 Unfolding1Mask@3)) (and (<= 0 (U_2_int (MapType0Select Heap@9 (MapType0Select Heap@9 _pure_1@@3 f$m2) val_int))) (state Heap@9 Unfolding1Mask@3))) (and (=> (= (ControlFlow 0 37) (- 0 38)) (HasDirectPerm Unfolding1Mask@3 _pure_1@@3 f$m2)) (=> (HasDirectPerm Unfolding1Mask@3 _pure_1@@3 f$m2) (and (=> (= (ControlFlow 0 37) 33) anon40_Then_correct) (=> (= (ControlFlow 0 37) 34) anon40_Else_correct))))))))))))
(let ((anon39_Else_correct  (=> (and (= perm@13 NoPerm) (= (ControlFlow 0 42) 37)) anon17_correct)))
(let ((anon39_Then_correct  (=> (not (= perm@13 NoPerm)) (and (=> (= (ControlFlow 0 40) (- 0 41)) (<= perm@13 (U_2_real (MapType1Select UnfoldingMask@9 null (u32 (MapType0Select Heap@9 _pure_1@@3 f$m2)))))) (=> (<= perm@13 (U_2_real (MapType1Select UnfoldingMask@9 null (u32 (MapType0Select Heap@9 _pure_1@@3 f$m2))))) (=> (= (ControlFlow 0 40) 37) anon17_correct))))))
(let ((anon38_Else_correct  (and (=> (= (ControlFlow 0 43) (- 0 45)) (> (read$ Heap@9) NoPerm)) (=> (> (read$ Heap@9) NoPerm) (=> (|u32#trigger| Heap@9 (u32 (MapType0Select Heap@9 _pure_1@@3 f$m2))) (=> (and (= (MapType0Select Heap@9 null (u32 (MapType0Select Heap@9 _pure_1@@3 f$m2))) (FrameFragment (MapType0Select Heap@9 (MapType0Select Heap@9 _pure_1@@3 f$m2) val_int))) (= perm@13 (read$ Heap@9))) (and (=> (= (ControlFlow 0 43) (- 0 44)) (>= perm@13 NoPerm)) (=> (>= perm@13 NoPerm) (and (=> (= (ControlFlow 0 43) 40) anon39_Then_correct) (=> (= (ControlFlow 0 43) 42) anon39_Else_correct))))))))))
(let ((anon13_correct  (=> (= UnfoldingMask@5 (MapType1Store Mask@0 null (P _pure_1@@3) (real_2_U (- (U_2_real (MapType1Select Mask@0 null (P _pure_1@@3))) perm@8)))) (=> (and (state Heap@9 UnfoldingMask@5) (= perm@9 (* FullPerm (read$ Heap@9)))) (and (=> (= (ControlFlow 0 46) (- 0 50)) (>= perm@9 NoPerm)) (=> (>= perm@9 NoPerm) (=> (=> (> perm@9 NoPerm) (not (= _pure_1@@3 null))) (=> (and (and (= UnfoldingMask@6 (MapType1Store UnfoldingMask@5 _pure_1@@3 f$m2 (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@5 _pure_1@@3 f$m2)) perm@9)))) (state Heap@9 UnfoldingMask@6)) (and (state Heap@9 UnfoldingMask@6) (= perm@10 (* FullPerm (read$ Heap@9))))) (and (=> (= (ControlFlow 0 46) (- 0 49)) (>= perm@10 NoPerm)) (=> (>= perm@10 NoPerm) (=> (= UnfoldingMask@7 (MapType1Store UnfoldingMask@6 null (u32 (MapType0Select Heap@9 _pure_1@@3 f$m2)) (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@6 null (u32 (MapType0Select Heap@9 _pure_1@@3 f$m2)))) perm@10)))) (=> (and (and (InsidePredicate (P _pure_1@@3) (MapType0Select Heap@9 null (P _pure_1@@3)) (u32 (MapType0Select Heap@9 _pure_1@@3 f$m2)) (MapType0Select Heap@9 null (u32 (MapType0Select Heap@9 _pure_1@@3 f$m2)))) (state Heap@9 UnfoldingMask@7)) (and (state Heap@9 UnfoldingMask@7) (= perm@11 (* FullPerm (read$ Heap@9))))) (and (=> (= (ControlFlow 0 46) (- 0 48)) (>= perm@11 NoPerm)) (=> (>= perm@11 NoPerm) (=> (=> (> perm@11 NoPerm) (not (= _pure_1@@3 null))) (=> (and (and (= UnfoldingMask@8 (MapType1Store UnfoldingMask@7 _pure_1@@3 f$m5 (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@7 _pure_1@@3 f$m5)) perm@11)))) (state Heap@9 UnfoldingMask@8)) (and (state Heap@9 UnfoldingMask@8) (= perm@12 (* FullPerm (read$ Heap@9))))) (and (=> (= (ControlFlow 0 46) (- 0 47)) (>= perm@12 NoPerm)) (=> (>= perm@12 NoPerm) (=> (and (and (= UnfoldingMask@9 (MapType1Store UnfoldingMask@8 null (u32 (MapType0Select Heap@9 _pure_1@@3 f$m5)) (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@8 null (u32 (MapType0Select Heap@9 _pure_1@@3 f$m5)))) perm@12)))) (InsidePredicate (P _pure_1@@3) (MapType0Select Heap@9 null (P _pure_1@@3)) (u32 (MapType0Select Heap@9 _pure_1@@3 f$m5)) (MapType0Select Heap@9 null (u32 (MapType0Select Heap@9 _pure_1@@3 f$m5))))) (and (state Heap@9 UnfoldingMask@9) (state Heap@9 UnfoldingMask@9))) (and (=> (= (ControlFlow 0 46) 32) anon38_Then_correct) (=> (= (ControlFlow 0 46) 43) anon38_Else_correct)))))))))))))))))))))
(let ((anon37_Else_correct  (=> (and (= perm@8 NoPerm) (= (ControlFlow 0 53) 46)) anon13_correct)))
(let ((anon37_Then_correct  (=> (not (= perm@8 NoPerm)) (and (=> (= (ControlFlow 0 51) (- 0 52)) (<= perm@8 (U_2_real (MapType1Select Mask@0 null (P _pure_1@@3))))) (=> (<= perm@8 (U_2_real (MapType1Select Mask@0 null (P _pure_1@@3)))) (=> (= (ControlFlow 0 51) 46) anon13_correct))))))
(let ((anon36_Then_correct  (=> (not (>= (U_2_int (MapType0Select Heap@9 (MapType0Select Heap@9 _pure_1@@3 f$m2) val_int)) 0)) (and (=> (= (ControlFlow 0 54) (- 0 56)) (> (read$ Heap@9) NoPerm)) (=> (> (read$ Heap@9) NoPerm) (=> (|P#trigger| Heap@9 (P _pure_1@@3)) (=> (and (= (MapType0Select Heap@9 null (P _pure_1@@3)) (CombineFrames (FrameFragment (MapType0Select Heap@9 _pure_1@@3 f$m2)) (CombineFrames (MapType0Select Heap@9 null (u32 (MapType0Select Heap@9 _pure_1@@3 f$m2))) (CombineFrames (FrameFragment (MapType0Select Heap@9 _pure_1@@3 f$m5)) (MapType0Select Heap@9 null (u32 (MapType0Select Heap@9 _pure_1@@3 f$m5))))))) (= perm@8 (read$ Heap@9))) (and (=> (= (ControlFlow 0 54) (- 0 55)) (>= perm@8 NoPerm)) (=> (>= perm@8 NoPerm) (and (=> (= (ControlFlow 0 54) 51) anon37_Then_correct) (=> (= (ControlFlow 0 54) 53) anon37_Else_correct)))))))))))
(let ((anon36_Else_correct  (=> (and (>= (U_2_int (MapType0Select Heap@9 (MapType0Select Heap@9 _pure_1@@3 f$m2) val_int)) 0) (= Heap@25 Heap@9)) (and (=> (= (ControlFlow 0 31) 28) anon41_Then_correct) (=> (= (ControlFlow 0 31) 5) anon41_Else_correct)))))
(let ((anon35_Else_correct  (and (=> (= (ControlFlow 0 57) (- 0 59)) (HasDirectPerm Unfolding1Mask@1 _pure_1@@3 f$m2)) (=> (HasDirectPerm Unfolding1Mask@1 _pure_1@@3 f$m2) (and (=> (= (ControlFlow 0 57) (- 0 58)) (HasDirectPerm Unfolding1Mask@1 (MapType0Select Heap@@19 _pure_1@@3 f$m2) val_int)) (=> (HasDirectPerm Unfolding1Mask@1 (MapType0Select Heap@@19 _pure_1@@3 f$m2) val_int) (=> (and (and (= UnfoldingHeap@0 (MapType0Store Heap@@19 null (|u32#sm| (MapType0Select Heap@@19 _pure_1@@3 f$m2)) (MapType1Store (MapType0Select Heap@@19 null (|u32#sm| (MapType0Select Heap@@19 _pure_1@@3 f$m2))) (MapType0Select Heap@@19 _pure_1@@3 f$m2) val_int (bool_2_U true)))) (state UnfoldingHeap@0 UnfoldingMask@4)) (and (= Heap@0 (MapType0Store Heap@@19 null (|P#sm| _pure_1@@3) (MapType1Store (MapType0Select Heap@@19 null (|P#sm| _pure_1@@3)) _pure_1@@3 f$m2 (bool_2_U true)))) (forall ((o_3 T@U) (f_7 T@U) ) (! (let ((B@@21 (FieldTypeInv1 (type f_7))))
(let ((A@@22 (FieldTypeInv0 (type f_7))))
 (=> (and (and (= (type o_3) RefType) (= (type f_7) (FieldType A@@22 B@@21))) (or (U_2_bool (MapType1Select (MapType0Select Heap@0 null (|P#sm| _pure_1@@3)) o_3 f_7)) (U_2_bool (MapType1Select (MapType0Select Heap@0 null (|u32#sm| (MapType0Select Heap@0 _pure_1@@3 f$m2))) o_3 f_7)))) (U_2_bool (MapType1Select newPMask@0 o_3 f_7)))))
 :qid |stdinbpl.364:31|
 :skolemid |26|
 :pattern ( (MapType1Select newPMask@0 o_3 f_7))
)))) (=> (and (and (and (and (= Heap@1 (MapType0Store Heap@0 null (|P#sm| _pure_1@@3) newPMask@0)) (= Heap@2 (MapType0Store Heap@1 null (|P#sm| _pure_1@@3) (MapType1Store (MapType0Select Heap@1 null (|P#sm| _pure_1@@3)) _pure_1@@3 f$m5 (bool_2_U true))))) (and (forall ((o_4 T@U) (f_8 T@U) ) (! (let ((B@@22 (FieldTypeInv1 (type f_8))))
(let ((A@@23 (FieldTypeInv0 (type f_8))))
 (=> (and (and (= (type o_4) RefType) (= (type f_8) (FieldType A@@23 B@@22))) (or (U_2_bool (MapType1Select (MapType0Select Heap@2 null (|P#sm| _pure_1@@3)) o_4 f_8)) (U_2_bool (MapType1Select (MapType0Select Heap@2 null (|u32#sm| (MapType0Select Heap@2 _pure_1@@3 f$m5))) o_4 f_8)))) (U_2_bool (MapType1Select newPMask@1 o_4 f_8)))))
 :qid |stdinbpl.371:31|
 :skolemid |27|
 :pattern ( (MapType1Select newPMask@1 o_4 f_8))
)) (= Heap@3 (MapType0Store Heap@2 null (|P#sm| _pure_1@@3) newPMask@1)))) (and (and (state Heap@3 Mask@0) (= Heap@4 (MapType0Store Heap@3 null (|u32#sm| (MapType0Select Heap@3 _pure_1@@3 f$m2)) (MapType1Store (MapType0Select Heap@3 null (|u32#sm| (MapType0Select Heap@3 _pure_1@@3 f$m2))) (MapType0Select Heap@3 _pure_1@@3 f$m2) val_int (bool_2_U true))))) (and (state Heap@4 Mask@0) (= Heap@5 (MapType0Store Heap@4 null (|P#sm| _pure_1@@3) (MapType1Store (MapType0Select Heap@4 null (|P#sm| _pure_1@@3)) _pure_1@@3 f$m2 (bool_2_U true))))))) (and (and (and (forall ((o_5 T@U) (f_9 T@U) ) (! (let ((B@@23 (FieldTypeInv1 (type f_9))))
(let ((A@@24 (FieldTypeInv0 (type f_9))))
 (=> (and (and (= (type o_5) RefType) (= (type f_9) (FieldType A@@24 B@@23))) (or (U_2_bool (MapType1Select (MapType0Select Heap@5 null (|P#sm| _pure_1@@3)) o_5 f_9)) (U_2_bool (MapType1Select (MapType0Select Heap@5 null (|u32#sm| (MapType0Select Heap@5 _pure_1@@3 f$m2))) o_5 f_9)))) (U_2_bool (MapType1Select newPMask@2 o_5 f_9)))))
 :qid |stdinbpl.383:31|
 :skolemid |28|
 :pattern ( (MapType1Select newPMask@2 o_5 f_9))
)) (= Heap@6 (MapType0Store Heap@5 null (|P#sm| _pure_1@@3) newPMask@2))) (and (= Heap@7 (MapType0Store Heap@6 null (|P#sm| _pure_1@@3) (MapType1Store (MapType0Select Heap@6 null (|P#sm| _pure_1@@3)) _pure_1@@3 f$m5 (bool_2_U true)))) (forall ((o_6 T@U) (f_10 T@U) ) (! (let ((B@@24 (FieldTypeInv1 (type f_10))))
(let ((A@@25 (FieldTypeInv0 (type f_10))))
 (=> (and (and (= (type o_6) RefType) (= (type f_10) (FieldType A@@25 B@@24))) (or (U_2_bool (MapType1Select (MapType0Select Heap@7 null (|P#sm| _pure_1@@3)) o_6 f_10)) (U_2_bool (MapType1Select (MapType0Select Heap@7 null (|u32#sm| (MapType0Select Heap@7 _pure_1@@3 f$m5))) o_6 f_10)))) (U_2_bool (MapType1Select newPMask@3 o_6 f_10)))))
 :qid |stdinbpl.390:31|
 :skolemid |29|
 :pattern ( (MapType1Select newPMask@3 o_6 f_10))
)))) (and (and (= Heap@8 (MapType0Store Heap@7 null (|P#sm| _pure_1@@3) newPMask@3)) (state Heap@8 Mask@0)) (and (= Heap@9 (MapType0Store Heap@8 null (|u32#sm| (MapType0Select Heap@8 _pure_1@@3 f$m2)) (MapType1Store (MapType0Select Heap@8 null (|u32#sm| (MapType0Select Heap@8 _pure_1@@3 f$m2))) (MapType0Select Heap@8 _pure_1@@3 f$m2) val_int (bool_2_U true)))) (state Heap@9 Mask@0))))) (and (=> (= (ControlFlow 0 57) 54) anon36_Then_correct) (=> (= (ControlFlow 0 57) 31) anon36_Else_correct))))))))))
(let ((anon35_Then_correct true))
(let ((anon8_correct  (=> (= Unfolding1Mask@0 (MapType1Store UnfoldingMask@4 null (u32 (MapType0Select Heap@@19 _pure_1@@3 f$m2)) (real_2_U (- (U_2_real (MapType1Select UnfoldingMask@4 null (u32 (MapType0Select Heap@@19 _pure_1@@3 f$m2)))) perm@6)))) (=> (and (state Heap@@19 Unfolding1Mask@0) (= perm@7 (* FullPerm (read$ Heap@@19)))) (and (=> (= (ControlFlow 0 60) (- 0 62)) (>= perm@7 NoPerm)) (=> (>= perm@7 NoPerm) (=> (=> (> perm@7 NoPerm) (not (= (MapType0Select Heap@@19 _pure_1@@3 f$m2) null))) (=> (and (and (= Unfolding1Mask@1 (MapType1Store Unfolding1Mask@0 (MapType0Select Heap@@19 _pure_1@@3 f$m2) val_int (real_2_U (+ (U_2_real (MapType1Select Unfolding1Mask@0 (MapType0Select Heap@@19 _pure_1@@3 f$m2) val_int)) perm@7)))) (state Heap@@19 Unfolding1Mask@1)) (and (<= 0 (U_2_int (MapType0Select Heap@@19 (MapType0Select Heap@@19 _pure_1@@3 f$m2) val_int))) (state Heap@@19 Unfolding1Mask@1))) (and (=> (= (ControlFlow 0 60) (- 0 61)) (HasDirectPerm Unfolding1Mask@1 _pure_1@@3 f$m2)) (=> (HasDirectPerm Unfolding1Mask@1 _pure_1@@3 f$m2) (and (=> (= (ControlFlow 0 60) 3) anon35_Then_correct) (=> (= (ControlFlow 0 60) 57) anon35_Else_correct))))))))))))
(let ((anon34_Else_correct  (=> (and (= perm@6 NoPerm) (= (ControlFlow 0 65) 60)) anon8_correct)))
(let ((anon34_Then_correct  (=> (not (= perm@6 NoPerm)) (and (=> (= (ControlFlow 0 63) (- 0 64)) (<= perm@6 (U_2_real (MapType1Select UnfoldingMask@4 null (u32 (MapType0Select Heap@@19 _pure_1@@3 f$m2)))))) (=> (<= perm@6 (U_2_real (MapType1Select UnfoldingMask@4 null (u32 (MapType0Select Heap@@19 _pure_1@@3 f$m2))))) (=> (= (ControlFlow 0 63) 60) anon8_correct))))))
(let ((anon33_Else_correct  (and (=> (= (ControlFlow 0 66) (- 0 68)) (> (read$ Heap@@19) NoPerm)) (=> (> (read$ Heap@@19) NoPerm) (=> (|u32#trigger| Heap@@19 (u32 (MapType0Select Heap@@19 _pure_1@@3 f$m2))) (=> (and (= (MapType0Select Heap@@19 null (u32 (MapType0Select Heap@@19 _pure_1@@3 f$m2))) (FrameFragment (MapType0Select Heap@@19 (MapType0Select Heap@@19 _pure_1@@3 f$m2) val_int))) (= perm@6 (read$ Heap@@19))) (and (=> (= (ControlFlow 0 66) (- 0 67)) (>= perm@6 NoPerm)) (=> (>= perm@6 NoPerm) (and (=> (= (ControlFlow 0 66) 63) anon34_Then_correct) (=> (= (ControlFlow 0 66) 65) anon34_Else_correct))))))))))
(let ((anon33_Then_correct true))
(let ((anon4_correct  (=> (= UnfoldingMask@0 (MapType1Store Mask@0 null (P _pure_1@@3) (real_2_U (- (U_2_real (MapType1Select Mask@0 null (P _pure_1@@3))) perm@1)))) (=> (and (state Heap@@19 UnfoldingMask@0) (= perm@2 (* FullPerm (read$ Heap@@19)))) (and (=> (= (ControlFlow 0 69) (- 0 73)) (>= perm@2 NoPerm)) (=> (>= perm@2 NoPerm) (=> (=> (> perm@2 NoPerm) (not (= _pure_1@@3 null))) (=> (and (and (= UnfoldingMask@1 (MapType1Store UnfoldingMask@0 _pure_1@@3 f$m2 (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@0 _pure_1@@3 f$m2)) perm@2)))) (state Heap@@19 UnfoldingMask@1)) (and (state Heap@@19 UnfoldingMask@1) (= perm@3 (* FullPerm (read$ Heap@@19))))) (and (=> (= (ControlFlow 0 69) (- 0 72)) (>= perm@3 NoPerm)) (=> (>= perm@3 NoPerm) (=> (= UnfoldingMask@2 (MapType1Store UnfoldingMask@1 null (u32 (MapType0Select Heap@@19 _pure_1@@3 f$m2)) (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@1 null (u32 (MapType0Select Heap@@19 _pure_1@@3 f$m2)))) perm@3)))) (=> (and (and (InsidePredicate (P _pure_1@@3) (MapType0Select Heap@@19 null (P _pure_1@@3)) (u32 (MapType0Select Heap@@19 _pure_1@@3 f$m2)) (MapType0Select Heap@@19 null (u32 (MapType0Select Heap@@19 _pure_1@@3 f$m2)))) (state Heap@@19 UnfoldingMask@2)) (and (state Heap@@19 UnfoldingMask@2) (= perm@4 (* FullPerm (read$ Heap@@19))))) (and (=> (= (ControlFlow 0 69) (- 0 71)) (>= perm@4 NoPerm)) (=> (>= perm@4 NoPerm) (=> (=> (> perm@4 NoPerm) (not (= _pure_1@@3 null))) (=> (and (and (= UnfoldingMask@3 (MapType1Store UnfoldingMask@2 _pure_1@@3 f$m5 (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@2 _pure_1@@3 f$m5)) perm@4)))) (state Heap@@19 UnfoldingMask@3)) (and (state Heap@@19 UnfoldingMask@3) (= perm@5 (* FullPerm (read$ Heap@@19))))) (and (=> (= (ControlFlow 0 69) (- 0 70)) (>= perm@5 NoPerm)) (=> (>= perm@5 NoPerm) (=> (and (and (= UnfoldingMask@4 (MapType1Store UnfoldingMask@3 null (u32 (MapType0Select Heap@@19 _pure_1@@3 f$m5)) (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@3 null (u32 (MapType0Select Heap@@19 _pure_1@@3 f$m5)))) perm@5)))) (InsidePredicate (P _pure_1@@3) (MapType0Select Heap@@19 null (P _pure_1@@3)) (u32 (MapType0Select Heap@@19 _pure_1@@3 f$m5)) (MapType0Select Heap@@19 null (u32 (MapType0Select Heap@@19 _pure_1@@3 f$m5))))) (and (state Heap@@19 UnfoldingMask@4) (state Heap@@19 UnfoldingMask@4))) (and (=> (= (ControlFlow 0 69) 2) anon33_Then_correct) (=> (= (ControlFlow 0 69) 66) anon33_Else_correct)))))))))))))))))))))
(let ((anon32_Else_correct  (=> (and (= perm@1 NoPerm) (= (ControlFlow 0 76) 69)) anon4_correct)))
(let ((anon32_Then_correct  (=> (not (= perm@1 NoPerm)) (and (=> (= (ControlFlow 0 74) (- 0 75)) (<= perm@1 (U_2_real (MapType1Select Mask@0 null (P _pure_1@@3))))) (=> (<= perm@1 (U_2_real (MapType1Select Mask@0 null (P _pure_1@@3)))) (=> (= (ControlFlow 0 74) 69) anon4_correct))))))
(let ((anon31_Else_correct  (=> (= perm@0 (read$ Heap@@19)) (and (=> (= (ControlFlow 0 77) (- 0 80)) (>= perm@0 NoPerm)) (=> (>= perm@0 NoPerm) (=> (= Mask@0 (MapType1Store ZeroMask null (P _pure_1@@3) (real_2_U (+ (U_2_real (MapType1Select ZeroMask null (P _pure_1@@3))) perm@0)))) (=> (and (state Heap@@19 Mask@0) (state Heap@@19 Mask@0)) (and (=> (= (ControlFlow 0 77) (- 0 79)) (> (read$ Heap@@19) NoPerm)) (=> (> (read$ Heap@@19) NoPerm) (=> (|P#trigger| Heap@@19 (P _pure_1@@3)) (=> (and (= (MapType0Select Heap@@19 null (P _pure_1@@3)) (CombineFrames (FrameFragment (MapType0Select Heap@@19 _pure_1@@3 f$m2)) (CombineFrames (MapType0Select Heap@@19 null (u32 (MapType0Select Heap@@19 _pure_1@@3 f$m2))) (CombineFrames (FrameFragment (MapType0Select Heap@@19 _pure_1@@3 f$m5)) (MapType0Select Heap@@19 null (u32 (MapType0Select Heap@@19 _pure_1@@3 f$m5))))))) (= perm@1 (read$ Heap@@19))) (and (=> (= (ControlFlow 0 77) (- 0 78)) (>= perm@1 NoPerm)) (=> (>= perm@1 NoPerm) (and (=> (= (ControlFlow 0 77) 74) anon32_Then_correct) (=> (= (ControlFlow 0 77) 76) anon32_Else_correct)))))))))))))))
(let ((anon31_Then_correct true))
(let ((anon0_correct  (=> (and (and (state Heap@@19 ZeroMask) (U_2_bool (MapType0Select Heap@@19 _pure_1@@3 $allocated))) (and (= AssumeFunctionsAbove 0) (state Heap@@19 ZeroMask))) (and (=> (= (ControlFlow 0 81) 1) anon31_Then_correct) (=> (= (ControlFlow 0 81) 77) anon31_Else_correct)))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 82) 81) anon0_correct)))
PreconditionGeneratedEntry_correct))))))))))))))))))))))))))))))))))))))))
))
(check-sat)
(pop 1)
; Valid
(get-info :rlimit)
