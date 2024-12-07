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
(declare-fun g () T@U)
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
(declare-fun wand_1 (T@U Real T@U Int T@U Real T@U Real T@U T@U Int) T@U)
(declare-fun getPredWandId (T@U) Int)
(declare-fun WandType_wand_1Type () T@T)
(declare-fun wand_2 (T@U Real T@U Int T@U Real T@U Real T@U T@U Int) T@U)
(declare-fun WandType_wand_2Type () T@T)
(declare-fun Pair (T@U) T@U)
(declare-fun PredicateType_PairType () T@T)
(declare-fun |sum'| (T@U T@U) Int)
(declare-fun dummyFunction (T@U) Bool)
(declare-fun |sum#triggerStateless| (T@U) Int)
(declare-fun |Pair#trigger| (T@U T@U) Bool)
(declare-fun |Pair#everUsed| (T@U) Bool)
(declare-fun |wand_3#ft| (T@U Real T@U Real T@U Real) T@U)
(declare-fun |wand_3#sm| (T@U Real T@U Real T@U Real) T@U)
(declare-fun WandType_wand_3Type () T@T)
(declare-fun sum (T@U T@U) Int)
(declare-fun wand (T@U Real T@U Int T@U T@U Int) T@U)
(declare-fun WandType_wandType () T@T)
(declare-fun |Pair#sm| (T@U) T@U)
(declare-fun dummyHeap () T@U)
(declare-fun ZeroMask () T@U)
(declare-fun |wand_1#ft| (T@U Real T@U Int T@U Real T@U Real T@U T@U Int) T@U)
(declare-fun |wand_2#ft| (T@U Real T@U Int T@U Real T@U Real T@U T@U Int) T@U)
(declare-fun InsidePredicate (T@U T@U T@U T@U) Bool)
(declare-fun AssumeFunctionsAbove () Int)
(declare-fun sumMask (T@U T@U T@U) Bool)
(declare-fun wand_3 (T@U Real T@U Real T@U Real) T@U)
(declare-fun ConditionalFrame (Real T@U) T@U)
(declare-fun EmptyFrame () T@U)
(declare-fun |wand_1#sm| (T@U Real T@U Int T@U Real T@U Real T@U T@U Int) T@U)
(declare-fun |wand_2#sm| (T@U Real T@U Int T@U Real T@U Real T@U T@U Int) T@U)
(declare-fun NoPerm () Real)
(declare-fun FullPerm () Real)
(declare-fun |sum#frame| (T@U T@U) Int)
(declare-fun |wand#ft| (T@U Real T@U Int T@U T@U Int) T@U)
(declare-fun |wand#sm| (T@U Real T@U Int T@U T@U Int) T@U)
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
))) (= (Ctor NormalFieldType) 7)) (= (type $allocated) (FieldType NormalFieldType boolType))) (= (type f_7) (FieldType NormalFieldType intType))) (= (type g) (FieldType NormalFieldType intType))))
(assert (distinct $allocated f_7 g)
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
(assert  (and (= (Ctor WandType_wand_1Type) 12) (forall ((arg0@@25 T@U) (arg1@@9 Real) (arg2@@3 T@U) (arg3@@1 Int) (arg4 T@U) (arg5 Real) (arg6 T@U) (arg7 Real) (arg8 T@U) (arg9 T@U) (arg10 Int) ) (! (= (type (wand_1 arg0@@25 arg1@@9 arg2@@3 arg3@@1 arg4 arg5 arg6 arg7 arg8 arg9 arg10)) (FieldType WandType_wand_1Type intType))
 :qid |funType:wand_1|
 :pattern ( (wand_1 arg0@@25 arg1@@9 arg2@@3 arg3@@1 arg4 arg5 arg6 arg7 arg8 arg9 arg10))
))))
(assert (forall ((arg1@@10 T@U) (arg2@@4 Real) (arg3@@2 T@U) (arg4@@0 Int) (arg5@@0 T@U) (arg6@@0 Real) (arg7@@0 T@U) (arg8@@0 Real) (arg9@@0 T@U) (arg10@@0 T@U) (arg11 Int) ) (!  (=> (and (and (and (and (and (= (type arg1@@10) RefType) (= (type arg3@@2) RefType)) (= (type arg5@@0) RefType)) (= (type arg7@@0) RefType)) (= (type arg9@@0) RefType)) (= (type arg10@@0) RefType)) (= (getPredWandId (wand_1 arg1@@10 arg2@@4 arg3@@2 arg4@@0 arg5@@0 arg6@@0 arg7@@0 arg8@@0 arg9@@0 arg10@@0 arg11)) 2))
 :qid |stdinbpl.238:15|
 :skolemid |34|
 :pattern ( (wand_1 arg1@@10 arg2@@4 arg3@@2 arg4@@0 arg5@@0 arg6@@0 arg7@@0 arg8@@0 arg9@@0 arg10@@0 arg11))
)))
(assert  (and (= (Ctor WandType_wand_2Type) 13) (forall ((arg0@@26 T@U) (arg1@@11 Real) (arg2@@5 T@U) (arg3@@3 Int) (arg4@@1 T@U) (arg5@@1 Real) (arg6@@1 T@U) (arg7@@1 Real) (arg8@@1 T@U) (arg9@@1 T@U) (arg10@@1 Int) ) (! (= (type (wand_2 arg0@@26 arg1@@11 arg2@@5 arg3@@3 arg4@@1 arg5@@1 arg6@@1 arg7@@1 arg8@@1 arg9@@1 arg10@@1)) (FieldType WandType_wand_2Type intType))
 :qid |funType:wand_2|
 :pattern ( (wand_2 arg0@@26 arg1@@11 arg2@@5 arg3@@3 arg4@@1 arg5@@1 arg6@@1 arg7@@1 arg8@@1 arg9@@1 arg10@@1))
))))
(assert (forall ((arg1@@12 T@U) (arg2@@6 Real) (arg3@@4 T@U) (arg4@@2 Int) (arg5@@2 T@U) (arg6@@2 Real) (arg7@@2 T@U) (arg8@@2 Real) (arg9@@2 T@U) (arg10@@2 T@U) (arg11@@0 Int) ) (!  (=> (and (and (and (and (and (= (type arg1@@12) RefType) (= (type arg3@@4) RefType)) (= (type arg5@@2) RefType)) (= (type arg7@@2) RefType)) (= (type arg9@@2) RefType)) (= (type arg10@@2) RefType)) (= (getPredWandId (wand_2 arg1@@12 arg2@@6 arg3@@4 arg4@@2 arg5@@2 arg6@@2 arg7@@2 arg8@@2 arg9@@2 arg10@@2 arg11@@0)) 3))
 :qid |stdinbpl.270:15|
 :skolemid |41|
 :pattern ( (wand_2 arg1@@12 arg2@@6 arg3@@4 arg4@@2 arg5@@2 arg6@@2 arg7@@2 arg8@@2 arg9@@2 arg10@@2 arg11@@0))
)))
(assert  (and (= (Ctor PredicateType_PairType) 14) (forall ((arg0@@27 T@U) ) (! (= (type (Pair arg0@@27)) (FieldType PredicateType_PairType FrameTypeType))
 :qid |funType:Pair|
 :pattern ( (Pair arg0@@27))
))))
(assert (forall ((this T@U) ) (!  (=> (= (type this) RefType) (IsPredicateField (Pair this)))
 :qid |stdinbpl.428:15|
 :skolemid |55|
 :pattern ( (Pair this))
)))
(assert (forall ((Heap@@2 T@U) (p_1 T@U) ) (!  (=> (and (= (type Heap@@2) (MapType0Type RefType)) (= (type p_1) RefType)) (dummyFunction (int_2_U (|sum#triggerStateless| p_1))))
 :qid |stdinbpl.333:15|
 :skolemid |51|
 :pattern ( (|sum'| Heap@@2 p_1))
)))
(assert (forall ((Heap@@3 T@U) (this@@0 T@U) ) (!  (=> (and (= (type Heap@@3) (MapType0Type RefType)) (= (type this@@0) RefType)) (|Pair#everUsed| (Pair this@@0)))
 :qid |stdinbpl.447:15|
 :skolemid |59|
 :pattern ( (|Pair#trigger| Heap@@3 (Pair this@@0)))
)))
(assert  (and (and (= (Ctor WandType_wand_3Type) 15) (forall ((arg0@@28 T@U) (arg1@@13 Real) (arg2@@7 T@U) (arg3@@5 Real) (arg4@@3 T@U) (arg5@@3 Real) ) (! (= (type (|wand_3#ft| arg0@@28 arg1@@13 arg2@@7 arg3@@5 arg4@@3 arg5@@3)) (FieldType WandType_wand_3Type FrameTypeType))
 :qid |funType:wand_3#ft|
 :pattern ( (|wand_3#ft| arg0@@28 arg1@@13 arg2@@7 arg3@@5 arg4@@3 arg5@@3))
))) (forall ((arg0@@29 T@U) (arg1@@14 Real) (arg2@@8 T@U) (arg3@@6 Real) (arg4@@4 T@U) (arg5@@4 Real) ) (! (= (type (|wand_3#sm| arg0@@29 arg1@@14 arg2@@8 arg3@@6 arg4@@4 arg5@@4)) (FieldType WandType_wand_3Type (MapType1Type RefType boolType)))
 :qid |funType:wand_3#sm|
 :pattern ( (|wand_3#sm| arg0@@29 arg1@@14 arg2@@8 arg3@@6 arg4@@4 arg5@@4))
))))
(assert (forall ((arg1@@15 T@U) (arg2@@9 Real) (arg3@@7 T@U) (arg4@@5 Real) (arg5@@5 T@U) (arg6@@3 Real) ) (!  (=> (and (and (= (type arg1@@15) RefType) (= (type arg3@@7) RefType)) (= (type arg5@@5) RefType)) (= (|wand_3#sm| arg1@@15 arg2@@9 arg3@@7 arg4@@5 arg5@@5 arg6@@3) (WandMaskField (|wand_3#ft| arg1@@15 arg2@@9 arg3@@7 arg4@@5 arg5@@5 arg6@@3))))
 :qid |stdinbpl.298:15|
 :skolemid |47|
 :pattern ( (WandMaskField (|wand_3#ft| arg1@@15 arg2@@9 arg3@@7 arg4@@5 arg5@@5 arg6@@3)))
)))
(assert (forall ((Heap@@4 T@U) (ExhaleHeap@@1 T@U) (Mask@@2 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@4) (MapType0Type RefType)) (= (type ExhaleHeap@@1) (MapType0Type RefType))) (= (type Mask@@2) (MapType1Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@4 ExhaleHeap@@1 Mask@@2)) (U_2_bool (MapType0Select Heap@@4 o_1 $allocated))) (U_2_bool (MapType0Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.73:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@4 ExhaleHeap@@1 Mask@@2) (MapType0Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert (forall ((Heap@@5 T@U) (p_1@@0 T@U) ) (!  (=> (and (= (type Heap@@5) (MapType0Type RefType)) (= (type p_1@@0) RefType)) (and (= (sum Heap@@5 p_1@@0) (|sum'| Heap@@5 p_1@@0)) (dummyFunction (int_2_U (|sum#triggerStateless| p_1@@0)))))
 :qid |stdinbpl.329:15|
 :skolemid |50|
 :pattern ( (sum Heap@@5 p_1@@0))
)))
(assert  (and (= (Ctor WandType_wandType) 16) (forall ((arg0@@30 T@U) (arg1@@16 Real) (arg2@@10 T@U) (arg3@@8 Int) (arg4@@6 T@U) (arg5@@6 T@U) (arg6@@4 Int) ) (! (= (type (wand arg0@@30 arg1@@16 arg2@@10 arg3@@8 arg4@@6 arg5@@6 arg6@@4)) (FieldType WandType_wandType intType))
 :qid |funType:wand|
 :pattern ( (wand arg0@@30 arg1@@16 arg2@@10 arg3@@8 arg4@@6 arg5@@6 arg6@@4))
))))
(assert (forall ((arg1@@17 T@U) (arg2@@11 Real) (arg3@@9 T@U) (arg4@@7 Int) (arg5@@7 T@U) (arg6@@5 T@U) (arg7@@3 Int) (arg1_2 T@U) (arg2_2 Real) (arg3_2 T@U) (arg4_2 Int) (arg5_2 T@U) (arg6_2 T@U) (arg7_2 Int) ) (!  (=> (and (and (and (and (and (and (and (and (= (type arg1@@17) RefType) (= (type arg3@@9) RefType)) (= (type arg5@@7) RefType)) (= (type arg6@@5) RefType)) (= (type arg1_2) RefType)) (= (type arg3_2) RefType)) (= (type arg5_2) RefType)) (= (type arg6_2) RefType)) (= (wand arg1@@17 arg2@@11 arg3@@9 arg4@@7 arg5@@7 arg6@@5 arg7@@3) (wand arg1_2 arg2_2 arg3_2 arg4_2 arg5_2 arg6_2 arg7_2))) (and (= arg1@@17 arg1_2) (and (= arg2@@11 arg2_2) (and (= arg3@@9 arg3_2) (and (= arg4@@7 arg4_2) (and (= arg5@@7 arg5_2) (and (= arg6@@5 arg6_2) (= arg7@@3 arg7_2))))))))
 :qid |stdinbpl.210:15|
 :skolemid |28|
 :pattern ( (wand arg1@@17 arg2@@11 arg3@@9 arg4@@7 arg5@@7 arg6@@5 arg7@@3) (wand arg1_2 arg2_2 arg3_2 arg4_2 arg5_2 arg6_2 arg7_2))
)))
(assert (forall ((this@@1 T@U) (this2 T@U) ) (!  (=> (and (and (= (type this@@1) RefType) (= (type this2) RefType)) (= (Pair this@@1) (Pair this2))) (= this@@1 this2))
 :qid |stdinbpl.438:15|
 :skolemid |57|
 :pattern ( (Pair this@@1) (Pair this2))
)))
(assert (forall ((arg0@@31 T@U) ) (! (= (type (|Pair#sm| arg0@@31)) (FieldType PredicateType_PairType (MapType1Type RefType boolType)))
 :qid |funType:Pair#sm|
 :pattern ( (|Pair#sm| arg0@@31))
)))
(assert (forall ((this@@2 T@U) (this2@@0 T@U) ) (!  (=> (and (and (= (type this@@2) RefType) (= (type this2@@0) RefType)) (= (|Pair#sm| this@@2) (|Pair#sm| this2@@0))) (= this@@2 this2@@0))
 :qid |stdinbpl.442:15|
 :skolemid |58|
 :pattern ( (|Pair#sm| this@@2) (|Pair#sm| this2@@0))
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
(assert (forall ((arg1@@18 T@U) (arg2@@12 Real) (arg3@@10 T@U) (arg4@@8 Int) (arg5@@8 T@U) (arg6@@6 Real) (arg7@@4 T@U) (arg8@@3 Real) (arg9@@3 T@U) (arg10@@3 T@U) (arg11@@1 Int) ) (!  (=> (and (and (and (and (and (= (type arg1@@18) RefType) (= (type arg3@@10) RefType)) (= (type arg5@@8) RefType)) (= (type arg7@@4) RefType)) (= (type arg9@@3) RefType)) (= (type arg10@@3) RefType)) (IsWandField (wand_1 arg1@@18 arg2@@12 arg3@@10 arg4@@8 arg5@@8 arg6@@6 arg7@@4 arg8@@3 arg9@@3 arg10@@3 arg11@@1)))
 :qid |stdinbpl.218:15|
 :skolemid |29|
 :pattern ( (wand_1 arg1@@18 arg2@@12 arg3@@10 arg4@@8 arg5@@8 arg6@@6 arg7@@4 arg8@@3 arg9@@3 arg10@@3 arg11@@1))
)))
(assert (forall ((arg0@@32 T@U) (arg1@@19 Real) (arg2@@13 T@U) (arg3@@11 Int) (arg4@@9 T@U) (arg5@@9 Real) (arg6@@7 T@U) (arg7@@5 Real) (arg8@@4 T@U) (arg9@@4 T@U) (arg10@@4 Int) ) (! (= (type (|wand_1#ft| arg0@@32 arg1@@19 arg2@@13 arg3@@11 arg4@@9 arg5@@9 arg6@@7 arg7@@5 arg8@@4 arg9@@4 arg10@@4)) (FieldType WandType_wand_1Type FrameTypeType))
 :qid |funType:wand_1#ft|
 :pattern ( (|wand_1#ft| arg0@@32 arg1@@19 arg2@@13 arg3@@11 arg4@@9 arg5@@9 arg6@@7 arg7@@5 arg8@@4 arg9@@4 arg10@@4))
)))
(assert (forall ((arg1@@20 T@U) (arg2@@14 Real) (arg3@@12 T@U) (arg4@@10 Int) (arg5@@10 T@U) (arg6@@8 Real) (arg7@@6 T@U) (arg8@@5 Real) (arg9@@5 T@U) (arg10@@5 T@U) (arg11@@2 Int) ) (!  (=> (and (and (and (and (and (= (type arg1@@20) RefType) (= (type arg3@@12) RefType)) (= (type arg5@@10) RefType)) (= (type arg7@@6) RefType)) (= (type arg9@@5) RefType)) (= (type arg10@@5) RefType)) (IsWandField (|wand_1#ft| arg1@@20 arg2@@14 arg3@@12 arg4@@10 arg5@@10 arg6@@8 arg7@@6 arg8@@5 arg9@@5 arg10@@5 arg11@@2)))
 :qid |stdinbpl.222:15|
 :skolemid |30|
 :pattern ( (|wand_1#ft| arg1@@20 arg2@@14 arg3@@12 arg4@@10 arg5@@10 arg6@@8 arg7@@6 arg8@@5 arg9@@5 arg10@@5 arg11@@2))
)))
(assert (forall ((arg1@@21 T@U) (arg2@@15 Real) (arg3@@13 T@U) (arg4@@11 Int) (arg5@@11 T@U) (arg6@@9 Real) (arg7@@7 T@U) (arg8@@6 Real) (arg9@@6 T@U) (arg10@@6 T@U) (arg11@@3 Int) ) (!  (=> (and (and (and (and (and (= (type arg1@@21) RefType) (= (type arg3@@13) RefType)) (= (type arg5@@11) RefType)) (= (type arg7@@7) RefType)) (= (type arg9@@6) RefType)) (= (type arg10@@6) RefType)) (IsWandField (wand_2 arg1@@21 arg2@@15 arg3@@13 arg4@@11 arg5@@11 arg6@@9 arg7@@7 arg8@@6 arg9@@6 arg10@@6 arg11@@3)))
 :qid |stdinbpl.250:15|
 :skolemid |36|
 :pattern ( (wand_2 arg1@@21 arg2@@15 arg3@@13 arg4@@11 arg5@@11 arg6@@9 arg7@@7 arg8@@6 arg9@@6 arg10@@6 arg11@@3))
)))
(assert (forall ((arg0@@33 T@U) (arg1@@22 Real) (arg2@@16 T@U) (arg3@@14 Int) (arg4@@12 T@U) (arg5@@12 Real) (arg6@@10 T@U) (arg7@@8 Real) (arg8@@7 T@U) (arg9@@7 T@U) (arg10@@7 Int) ) (! (= (type (|wand_2#ft| arg0@@33 arg1@@22 arg2@@16 arg3@@14 arg4@@12 arg5@@12 arg6@@10 arg7@@8 arg8@@7 arg9@@7 arg10@@7)) (FieldType WandType_wand_2Type FrameTypeType))
 :qid |funType:wand_2#ft|
 :pattern ( (|wand_2#ft| arg0@@33 arg1@@22 arg2@@16 arg3@@14 arg4@@12 arg5@@12 arg6@@10 arg7@@8 arg8@@7 arg9@@7 arg10@@7))
)))
(assert (forall ((arg1@@23 T@U) (arg2@@17 Real) (arg3@@15 T@U) (arg4@@13 Int) (arg5@@13 T@U) (arg6@@11 Real) (arg7@@9 T@U) (arg8@@8 Real) (arg9@@8 T@U) (arg10@@8 T@U) (arg11@@4 Int) ) (!  (=> (and (and (and (and (and (= (type arg1@@23) RefType) (= (type arg3@@15) RefType)) (= (type arg5@@13) RefType)) (= (type arg7@@9) RefType)) (= (type arg9@@8) RefType)) (= (type arg10@@8) RefType)) (IsWandField (|wand_2#ft| arg1@@23 arg2@@17 arg3@@15 arg4@@13 arg5@@13 arg6@@11 arg7@@9 arg8@@8 arg9@@8 arg10@@8 arg11@@4)))
 :qid |stdinbpl.254:15|
 :skolemid |37|
 :pattern ( (|wand_2#ft| arg1@@23 arg2@@17 arg3@@15 arg4@@13 arg5@@13 arg6@@11 arg7@@9 arg8@@8 arg9@@8 arg10@@8 arg11@@4))
)))
(assert (forall ((p T@U) (v_1 T@U) (w T@U) ) (! (let ((A@@2 (FieldTypeInv0 (type p))))
 (=> (and (and (= (type p) (FieldType A@@2 FrameTypeType)) (= (type v_1) FrameTypeType)) (= (type w) FrameTypeType)) (not (InsidePredicate p v_1 p w))))
 :qid |stdinbpl.173:19|
 :skolemid |21|
 :pattern ( (InsidePredicate p v_1 p w))
)))
(assert (forall ((arg1@@24 T@U) (arg2@@18 Real) (arg3@@16 T@U) (arg4@@14 Int) (arg5@@14 T@U) (arg6@@12 Real) (arg7@@10 T@U) (arg8@@9 Real) (arg9@@9 T@U) (arg10@@9 T@U) (arg11@@5 Int) ) (!  (=> (and (and (and (and (and (= (type arg1@@24) RefType) (= (type arg3@@16) RefType)) (= (type arg5@@14) RefType)) (= (type arg7@@10) RefType)) (= (type arg9@@9) RefType)) (= (type arg10@@9) RefType)) (not (IsPredicateField (wand_1 arg1@@24 arg2@@18 arg3@@16 arg4@@14 arg5@@14 arg6@@12 arg7@@10 arg8@@9 arg9@@9 arg10@@9 arg11@@5))))
 :qid |stdinbpl.226:15|
 :skolemid |31|
 :pattern ( (wand_1 arg1@@24 arg2@@18 arg3@@16 arg4@@14 arg5@@14 arg6@@12 arg7@@10 arg8@@9 arg9@@9 arg10@@9 arg11@@5))
)))
(assert (forall ((arg1@@25 T@U) (arg2@@19 Real) (arg3@@17 T@U) (arg4@@15 Int) (arg5@@15 T@U) (arg6@@13 Real) (arg7@@11 T@U) (arg8@@10 Real) (arg9@@10 T@U) (arg10@@10 T@U) (arg11@@6 Int) ) (!  (=> (and (and (and (and (and (= (type arg1@@25) RefType) (= (type arg3@@17) RefType)) (= (type arg5@@15) RefType)) (= (type arg7@@11) RefType)) (= (type arg9@@10) RefType)) (= (type arg10@@10) RefType)) (not (IsPredicateField (|wand_1#ft| arg1@@25 arg2@@19 arg3@@17 arg4@@15 arg5@@15 arg6@@13 arg7@@11 arg8@@10 arg9@@10 arg10@@10 arg11@@6))))
 :qid |stdinbpl.230:15|
 :skolemid |32|
 :pattern ( (|wand_1#ft| arg1@@25 arg2@@19 arg3@@17 arg4@@15 arg5@@15 arg6@@13 arg7@@11 arg8@@10 arg9@@10 arg10@@10 arg11@@6))
)))
(assert (forall ((arg1@@26 T@U) (arg2@@20 Real) (arg3@@18 T@U) (arg4@@16 Int) (arg5@@16 T@U) (arg6@@14 Real) (arg7@@12 T@U) (arg8@@11 Real) (arg9@@11 T@U) (arg10@@11 T@U) (arg11@@7 Int) ) (!  (=> (and (and (and (and (and (= (type arg1@@26) RefType) (= (type arg3@@18) RefType)) (= (type arg5@@16) RefType)) (= (type arg7@@12) RefType)) (= (type arg9@@11) RefType)) (= (type arg10@@11) RefType)) (not (IsPredicateField (wand_2 arg1@@26 arg2@@20 arg3@@18 arg4@@16 arg5@@16 arg6@@14 arg7@@12 arg8@@11 arg9@@11 arg10@@11 arg11@@7))))
 :qid |stdinbpl.258:15|
 :skolemid |38|
 :pattern ( (wand_2 arg1@@26 arg2@@20 arg3@@18 arg4@@16 arg5@@16 arg6@@14 arg7@@12 arg8@@11 arg9@@11 arg10@@11 arg11@@7))
)))
(assert (forall ((arg1@@27 T@U) (arg2@@21 Real) (arg3@@19 T@U) (arg4@@17 Int) (arg5@@17 T@U) (arg6@@15 Real) (arg7@@13 T@U) (arg8@@12 Real) (arg9@@12 T@U) (arg10@@12 T@U) (arg11@@8 Int) ) (!  (=> (and (and (and (and (and (= (type arg1@@27) RefType) (= (type arg3@@19) RefType)) (= (type arg5@@17) RefType)) (= (type arg7@@13) RefType)) (= (type arg9@@12) RefType)) (= (type arg10@@12) RefType)) (not (IsPredicateField (|wand_2#ft| arg1@@27 arg2@@21 arg3@@19 arg4@@17 arg5@@17 arg6@@15 arg7@@13 arg8@@12 arg9@@12 arg10@@12 arg11@@8))))
 :qid |stdinbpl.262:15|
 :skolemid |39|
 :pattern ( (|wand_2#ft| arg1@@27 arg2@@21 arg3@@19 arg4@@17 arg5@@17 arg6@@15 arg7@@13 arg8@@12 arg9@@12 arg10@@12 arg11@@8))
)))
(assert  (not (IsPredicateField f_7)))
(assert  (not (IsWandField f_7)))
(assert  (not (IsPredicateField g)))
(assert  (not (IsWandField g)))
(assert (forall ((Heap@@7 T@U) (ExhaleHeap@@3 T@U) (Mask@@4 T@U) ) (!  (=> (and (and (and (= (type Heap@@7) (MapType0Type RefType)) (= (type ExhaleHeap@@3) (MapType0Type RefType))) (= (type Mask@@4) (MapType1Type RefType realType))) (IdenticalOnKnownLocations Heap@@7 ExhaleHeap@@3 Mask@@4)) (succHeap Heap@@7 ExhaleHeap@@3))
 :qid |stdinbpl.83:15|
 :skolemid |10|
 :pattern ( (IdenticalOnKnownLocations Heap@@7 ExhaleHeap@@3 Mask@@4))
)))
(assert (forall ((Heap@@8 T@U) (Mask@@5 T@U) (p_1@@1 T@U) ) (!  (=> (and (and (and (= (type Heap@@8) (MapType0Type RefType)) (= (type Mask@@5) (MapType1Type RefType realType))) (= (type p_1@@1) RefType)) (and (state Heap@@8 Mask@@5) (< AssumeFunctionsAbove 0))) (= (sum Heap@@8 p_1@@1) (+ (U_2_int (MapType0Select Heap@@8 p_1@@1 f_7)) (U_2_int (MapType0Select Heap@@8 p_1@@1 g)))))
 :qid |stdinbpl.339:15|
 :skolemid |52|
 :pattern ( (state Heap@@8 Mask@@5) (sum Heap@@8 p_1@@1))
 :pattern ( (state Heap@@8 Mask@@5) (|sum#triggerStateless| p_1@@1) (|Pair#trigger| Heap@@8 (Pair p_1@@1)))
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
(assert (forall ((arg0@@34 T@U) (arg1@@28 Real) (arg2@@22 T@U) (arg3@@20 Real) (arg4@@18 T@U) (arg5@@18 Real) ) (! (= (type (wand_3 arg0@@34 arg1@@28 arg2@@22 arg3@@20 arg4@@18 arg5@@18)) (FieldType WandType_wand_3Type intType))
 :qid |funType:wand_3|
 :pattern ( (wand_3 arg0@@34 arg1@@28 arg2@@22 arg3@@20 arg4@@18 arg5@@18))
)))
(assert (forall ((arg1@@29 T@U) (arg2@@23 Real) (arg3@@21 T@U) (arg4@@19 Real) (arg5@@19 T@U) (arg6@@16 Real) (arg1_2@@0 T@U) (arg2_2@@0 Real) (arg3_2@@0 T@U) (arg4_2@@0 Real) (arg5_2@@0 T@U) (arg6_2@@0 Real) ) (!  (=> (and (and (and (and (and (and (= (type arg1@@29) RefType) (= (type arg3@@21) RefType)) (= (type arg5@@19) RefType)) (= (type arg1_2@@0) RefType)) (= (type arg3_2@@0) RefType)) (= (type arg5_2@@0) RefType)) (= (wand_3 arg1@@29 arg2@@23 arg3@@21 arg4@@19 arg5@@19 arg6@@16) (wand_3 arg1_2@@0 arg2_2@@0 arg3_2@@0 arg4_2@@0 arg5_2@@0 arg6_2@@0))) (and (= arg1@@29 arg1_2@@0) (and (= arg2@@23 arg2_2@@0) (and (= arg3@@21 arg3_2@@0) (and (= arg4@@19 arg4_2@@0) (and (= arg5@@19 arg5_2@@0) (= arg6@@16 arg6_2@@0)))))))
 :qid |stdinbpl.306:15|
 :skolemid |49|
 :pattern ( (wand_3 arg1@@29 arg2@@23 arg3@@21 arg4@@19 arg5@@19 arg6@@16) (wand_3 arg1_2@@0 arg2_2@@0 arg3_2@@0 arg4_2@@0 arg5_2@@0 arg6_2@@0))
)))
(assert  (and (forall ((arg0@@35 Real) (arg1@@30 T@U) ) (! (= (type (ConditionalFrame arg0@@35 arg1@@30)) FrameTypeType)
 :qid |funType:ConditionalFrame|
 :pattern ( (ConditionalFrame arg0@@35 arg1@@30))
)) (= (type EmptyFrame) FrameTypeType)))
(assert (forall ((p@@0 Real) (f_6 T@U) ) (!  (=> (= (type f_6) FrameTypeType) (= (ConditionalFrame p@@0 f_6) (ite (> p@@0 0.0) f_6 EmptyFrame)))
 :qid |stdinbpl.161:15|
 :skolemid |19|
 :pattern ( (ConditionalFrame p@@0 f_6))
)))
(assert (forall ((arg0@@36 T@U) (arg1@@31 Real) (arg2@@24 T@U) (arg3@@22 Int) (arg4@@20 T@U) (arg5@@20 Real) (arg6@@17 T@U) (arg7@@14 Real) (arg8@@13 T@U) (arg9@@13 T@U) (arg10@@13 Int) ) (! (= (type (|wand_1#sm| arg0@@36 arg1@@31 arg2@@24 arg3@@22 arg4@@20 arg5@@20 arg6@@17 arg7@@14 arg8@@13 arg9@@13 arg10@@13)) (FieldType WandType_wand_1Type (MapType1Type RefType boolType)))
 :qid |funType:wand_1#sm|
 :pattern ( (|wand_1#sm| arg0@@36 arg1@@31 arg2@@24 arg3@@22 arg4@@20 arg5@@20 arg6@@17 arg7@@14 arg8@@13 arg9@@13 arg10@@13))
)))
(assert (forall ((arg1@@32 T@U) (arg2@@25 Real) (arg3@@23 T@U) (arg4@@21 Int) (arg5@@21 T@U) (arg6@@18 Real) (arg7@@15 T@U) (arg8@@14 Real) (arg9@@14 T@U) (arg10@@14 T@U) (arg11@@9 Int) ) (!  (=> (and (and (and (and (and (= (type arg1@@32) RefType) (= (type arg3@@23) RefType)) (= (type arg5@@21) RefType)) (= (type arg7@@15) RefType)) (= (type arg9@@14) RefType)) (= (type arg10@@14) RefType)) (= (|wand_1#sm| arg1@@32 arg2@@25 arg3@@23 arg4@@21 arg5@@21 arg6@@18 arg7@@15 arg8@@14 arg9@@14 arg10@@14 arg11@@9) (WandMaskField (|wand_1#ft| arg1@@32 arg2@@25 arg3@@23 arg4@@21 arg5@@21 arg6@@18 arg7@@15 arg8@@14 arg9@@14 arg10@@14 arg11@@9))))
 :qid |stdinbpl.234:15|
 :skolemid |33|
 :pattern ( (WandMaskField (|wand_1#ft| arg1@@32 arg2@@25 arg3@@23 arg4@@21 arg5@@21 arg6@@18 arg7@@15 arg8@@14 arg9@@14 arg10@@14 arg11@@9)))
)))
(assert (forall ((arg0@@37 T@U) (arg1@@33 Real) (arg2@@26 T@U) (arg3@@24 Int) (arg4@@22 T@U) (arg5@@22 Real) (arg6@@19 T@U) (arg7@@16 Real) (arg8@@15 T@U) (arg9@@15 T@U) (arg10@@15 Int) ) (! (= (type (|wand_2#sm| arg0@@37 arg1@@33 arg2@@26 arg3@@24 arg4@@22 arg5@@22 arg6@@19 arg7@@16 arg8@@15 arg9@@15 arg10@@15)) (FieldType WandType_wand_2Type (MapType1Type RefType boolType)))
 :qid |funType:wand_2#sm|
 :pattern ( (|wand_2#sm| arg0@@37 arg1@@33 arg2@@26 arg3@@24 arg4@@22 arg5@@22 arg6@@19 arg7@@16 arg8@@15 arg9@@15 arg10@@15))
)))
(assert (forall ((arg1@@34 T@U) (arg2@@27 Real) (arg3@@25 T@U) (arg4@@23 Int) (arg5@@23 T@U) (arg6@@20 Real) (arg7@@17 T@U) (arg8@@16 Real) (arg9@@16 T@U) (arg10@@16 T@U) (arg11@@10 Int) ) (!  (=> (and (and (and (and (and (= (type arg1@@34) RefType) (= (type arg3@@25) RefType)) (= (type arg5@@23) RefType)) (= (type arg7@@17) RefType)) (= (type arg9@@16) RefType)) (= (type arg10@@16) RefType)) (= (|wand_2#sm| arg1@@34 arg2@@27 arg3@@25 arg4@@23 arg5@@23 arg6@@20 arg7@@17 arg8@@16 arg9@@16 arg10@@16 arg11@@10) (WandMaskField (|wand_2#ft| arg1@@34 arg2@@27 arg3@@25 arg4@@23 arg5@@23 arg6@@20 arg7@@17 arg8@@16 arg9@@16 arg10@@16 arg11@@10))))
 :qid |stdinbpl.266:15|
 :skolemid |40|
 :pattern ( (WandMaskField (|wand_2#ft| arg1@@34 arg2@@27 arg3@@25 arg4@@23 arg5@@23 arg6@@20 arg7@@17 arg8@@16 arg9@@16 arg10@@16 arg11@@10)))
)))
(assert (forall ((Mask@@6 T@U) (o_2@@0 T@U) (f_4@@0 T@U) ) (! (let ((B@@3 (FieldTypeInv1 (type f_4@@0))))
(let ((A@@4 (FieldTypeInv0 (type f_4@@0))))
 (=> (and (and (= (type Mask@@6) (MapType1Type RefType realType)) (= (type o_2@@0) RefType)) (= (type f_4@@0) (FieldType A@@4 B@@3))) (= (HasDirectPerm Mask@@6 o_2@@0 f_4@@0) (> (U_2_real (MapType1Select Mask@@6 o_2@@0 f_4@@0)) NoPerm)))))
 :qid |stdinbpl.133:22|
 :skolemid |17|
 :pattern ( (HasDirectPerm Mask@@6 o_2@@0 f_4@@0))
)))
(assert (forall ((arg1@@35 T@U) (arg2@@28 Real) (arg3@@26 T@U) (arg4@@24 Real) (arg5@@24 T@U) (arg6@@21 Real) ) (!  (=> (and (and (= (type arg1@@35) RefType) (= (type arg3@@26) RefType)) (= (type arg5@@24) RefType)) (= (getPredWandId (wand_3 arg1@@35 arg2@@28 arg3@@26 arg4@@24 arg5@@24 arg6@@21)) 4))
 :qid |stdinbpl.302:15|
 :skolemid |48|
 :pattern ( (wand_3 arg1@@35 arg2@@28 arg3@@26 arg4@@24 arg5@@24 arg6@@21))
)))
(assert (forall ((o_2@@1 T@U) (f_4@@1 T@U) ) (! (let ((B@@4 (FieldTypeInv1 (type f_4@@1))))
(let ((A@@5 (FieldTypeInv0 (type f_4@@1))))
 (=> (and (= (type o_2@@1) RefType) (= (type f_4@@1) (FieldType A@@5 B@@4))) (= (U_2_real (MapType1Select ZeroMask o_2@@1 f_4@@1)) NoPerm))))
 :qid |stdinbpl.106:22|
 :skolemid |13|
 :pattern ( (MapType1Select ZeroMask o_2@@1 f_4@@1))
)))
(assert (forall ((arg1@@36 T@U) (arg2@@29 Real) (arg3@@27 T@U) (arg4@@25 Int) (arg5@@25 T@U) (arg6@@22 Real) (arg7@@18 T@U) (arg8@@17 Real) (arg9@@17 T@U) (arg10@@17 T@U) (arg11@@11 Int) (arg1_2@@1 T@U) (arg2_2@@1 Real) (arg3_2@@1 T@U) (arg4_2@@1 Int) (arg5_2@@1 T@U) (arg6_2@@1 Real) (arg7_2@@0 T@U) (arg8_2 Real) (arg9_2 T@U) (arg10_2 T@U) (arg11_2 Int) ) (!  (=> (and (and (and (and (and (and (and (and (and (and (and (and (= (type arg1@@36) RefType) (= (type arg3@@27) RefType)) (= (type arg5@@25) RefType)) (= (type arg7@@18) RefType)) (= (type arg9@@17) RefType)) (= (type arg10@@17) RefType)) (= (type arg1_2@@1) RefType)) (= (type arg3_2@@1) RefType)) (= (type arg5_2@@1) RefType)) (= (type arg7_2@@0) RefType)) (= (type arg9_2) RefType)) (= (type arg10_2) RefType)) (= (wand_1 arg1@@36 arg2@@29 arg3@@27 arg4@@25 arg5@@25 arg6@@22 arg7@@18 arg8@@17 arg9@@17 arg10@@17 arg11@@11) (wand_1 arg1_2@@1 arg2_2@@1 arg3_2@@1 arg4_2@@1 arg5_2@@1 arg6_2@@1 arg7_2@@0 arg8_2 arg9_2 arg10_2 arg11_2))) (and (= arg1@@36 arg1_2@@1) (and (= arg2@@29 arg2_2@@1) (and (= arg3@@27 arg3_2@@1) (and (= arg4@@25 arg4_2@@1) (and (= arg5@@25 arg5_2@@1) (and (= arg6@@22 arg6_2@@1) (and (= arg7@@18 arg7_2@@0) (and (= arg8@@17 arg8_2) (and (= arg9@@17 arg9_2) (and (= arg10@@17 arg10_2) (= arg11@@11 arg11_2))))))))))))
 :qid |stdinbpl.242:15|
 :skolemid |35|
 :pattern ( (wand_1 arg1@@36 arg2@@29 arg3@@27 arg4@@25 arg5@@25 arg6@@22 arg7@@18 arg8@@17 arg9@@17 arg10@@17 arg11@@11) (wand_1 arg1_2@@1 arg2_2@@1 arg3_2@@1 arg4_2@@1 arg5_2@@1 arg6_2@@1 arg7_2@@0 arg8_2 arg9_2 arg10_2 arg11_2))
)))
(assert (forall ((arg1@@37 T@U) (arg2@@30 Real) (arg3@@28 T@U) (arg4@@26 Int) (arg5@@26 T@U) (arg6@@23 Real) (arg7@@19 T@U) (arg8@@18 Real) (arg9@@18 T@U) (arg10@@18 T@U) (arg11@@12 Int) (arg1_2@@2 T@U) (arg2_2@@2 Real) (arg3_2@@2 T@U) (arg4_2@@2 Int) (arg5_2@@2 T@U) (arg6_2@@2 Real) (arg7_2@@1 T@U) (arg8_2@@0 Real) (arg9_2@@0 T@U) (arg10_2@@0 T@U) (arg11_2@@0 Int) ) (!  (=> (and (and (and (and (and (and (and (and (and (and (and (and (= (type arg1@@37) RefType) (= (type arg3@@28) RefType)) (= (type arg5@@26) RefType)) (= (type arg7@@19) RefType)) (= (type arg9@@18) RefType)) (= (type arg10@@18) RefType)) (= (type arg1_2@@2) RefType)) (= (type arg3_2@@2) RefType)) (= (type arg5_2@@2) RefType)) (= (type arg7_2@@1) RefType)) (= (type arg9_2@@0) RefType)) (= (type arg10_2@@0) RefType)) (= (wand_2 arg1@@37 arg2@@30 arg3@@28 arg4@@26 arg5@@26 arg6@@23 arg7@@19 arg8@@18 arg9@@18 arg10@@18 arg11@@12) (wand_2 arg1_2@@2 arg2_2@@2 arg3_2@@2 arg4_2@@2 arg5_2@@2 arg6_2@@2 arg7_2@@1 arg8_2@@0 arg9_2@@0 arg10_2@@0 arg11_2@@0))) (and (= arg1@@37 arg1_2@@2) (and (= arg2@@30 arg2_2@@2) (and (= arg3@@28 arg3_2@@2) (and (= arg4@@26 arg4_2@@2) (and (= arg5@@26 arg5_2@@2) (and (= arg6@@23 arg6_2@@2) (and (= arg7@@19 arg7_2@@1) (and (= arg8@@18 arg8_2@@0) (and (= arg9@@18 arg9_2@@0) (and (= arg10@@18 arg10_2@@0) (= arg11@@12 arg11_2@@0))))))))))))
 :qid |stdinbpl.274:15|
 :skolemid |42|
 :pattern ( (wand_2 arg1@@37 arg2@@30 arg3@@28 arg4@@26 arg5@@26 arg6@@23 arg7@@19 arg8@@18 arg9@@18 arg10@@18 arg11@@12) (wand_2 arg1_2@@2 arg2_2@@2 arg3_2@@2 arg4_2@@2 arg5_2@@2 arg6_2@@2 arg7_2@@1 arg8_2@@0 arg9_2@@0 arg10_2@@0 arg11_2@@0))
)))
(assert (forall ((arg1@@38 T@U) (arg2@@31 Real) (arg3@@29 T@U) (arg4@@27 Real) (arg5@@27 T@U) (arg6@@24 Real) ) (!  (=> (and (and (= (type arg1@@38) RefType) (= (type arg3@@29) RefType)) (= (type arg5@@27) RefType)) (IsWandField (wand_3 arg1@@38 arg2@@31 arg3@@29 arg4@@27 arg5@@27 arg6@@24)))
 :qid |stdinbpl.282:15|
 :skolemid |43|
 :pattern ( (wand_3 arg1@@38 arg2@@31 arg3@@29 arg4@@27 arg5@@27 arg6@@24))
)))
(assert (forall ((arg1@@39 T@U) (arg2@@32 Real) (arg3@@30 T@U) (arg4@@28 Real) (arg5@@28 T@U) (arg6@@25 Real) ) (!  (=> (and (and (= (type arg1@@39) RefType) (= (type arg3@@30) RefType)) (= (type arg5@@28) RefType)) (IsWandField (|wand_3#ft| arg1@@39 arg2@@32 arg3@@30 arg4@@28 arg5@@28 arg6@@25)))
 :qid |stdinbpl.286:15|
 :skolemid |44|
 :pattern ( (|wand_3#ft| arg1@@39 arg2@@32 arg3@@30 arg4@@28 arg5@@28 arg6@@25))
)))
(assert (forall ((arg1@@40 T@U) (arg2@@33 Real) (arg3@@31 T@U) (arg4@@29 Real) (arg5@@29 T@U) (arg6@@26 Real) ) (!  (=> (and (and (= (type arg1@@40) RefType) (= (type arg3@@31) RefType)) (= (type arg5@@29) RefType)) (not (IsPredicateField (wand_3 arg1@@40 arg2@@33 arg3@@31 arg4@@29 arg5@@29 arg6@@26))))
 :qid |stdinbpl.290:15|
 :skolemid |45|
 :pattern ( (wand_3 arg1@@40 arg2@@33 arg3@@31 arg4@@29 arg5@@29 arg6@@26))
)))
(assert (forall ((arg1@@41 T@U) (arg2@@34 Real) (arg3@@32 T@U) (arg4@@30 Real) (arg5@@30 T@U) (arg6@@27 Real) ) (!  (=> (and (and (= (type arg1@@41) RefType) (= (type arg3@@32) RefType)) (= (type arg5@@30) RefType)) (not (IsPredicateField (|wand_3#ft| arg1@@41 arg2@@34 arg3@@32 arg4@@30 arg5@@30 arg6@@27))))
 :qid |stdinbpl.294:15|
 :skolemid |46|
 :pattern ( (|wand_3#ft| arg1@@41 arg2@@34 arg3@@32 arg4@@30 arg5@@30 arg6@@27))
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
(assert (forall ((this@@3 T@U) ) (!  (=> (= (type this@@3) RefType) (= (getPredWandId (Pair this@@3)) 0))
 :qid |stdinbpl.432:15|
 :skolemid |56|
 :pattern ( (Pair this@@3))
)))
(assert (forall ((Mask@@9 T@U) (o_2@@2 T@U) (f_4@@2 T@U) ) (! (let ((B@@7 (FieldTypeInv1 (type f_4@@2))))
(let ((A@@8 (FieldTypeInv0 (type f_4@@2))))
 (=> (and (and (and (= (type Mask@@9) (MapType1Type RefType realType)) (= (type o_2@@2) RefType)) (= (type f_4@@2) (FieldType A@@8 B@@7))) (GoodMask Mask@@9)) (and (>= (U_2_real (MapType1Select Mask@@9 o_2@@2 f_4@@2)) NoPerm) (=> (and (and (GoodMask Mask@@9) (not (IsPredicateField f_4@@2))) (not (IsWandField f_4@@2))) (<= (U_2_real (MapType1Select Mask@@9 o_2@@2 f_4@@2)) FullPerm))))))
 :qid |stdinbpl.128:22|
 :skolemid |16|
 :pattern ( (GoodMask Mask@@9) (MapType1Select Mask@@9 o_2@@2 f_4@@2))
)))
(assert (forall ((Heap@@11 T@U) (Mask@@10 T@U) (p_1@@2 T@U) ) (!  (=> (and (and (and (= (type Heap@@11) (MapType0Type RefType)) (= (type Mask@@10) (MapType1Type RefType realType))) (= (type p_1@@2) RefType)) (state Heap@@11 Mask@@10)) (= (|sum'| Heap@@11 p_1@@2) (|sum#frame| (MapType0Select Heap@@11 null (Pair p_1@@2)) p_1@@2)))
 :qid |stdinbpl.346:15|
 :skolemid |53|
 :pattern ( (state Heap@@11 Mask@@10) (|sum'| Heap@@11 p_1@@2))
)))
(assert (forall ((o T@U) (f T@U) (Heap@@12 T@U) ) (!  (=> (and (and (and (= (type o) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap@@12) (MapType0Type RefType))) (U_2_bool (MapType0Select Heap@@12 o $allocated))) (U_2_bool (MapType0Select Heap@@12 (MapType0Select Heap@@12 o f) $allocated)))
 :qid |stdinbpl.31:15|
 :skolemid |0|
 :pattern ( (MapType0Select Heap@@12 o f))
)))
(assert (forall ((this@@4 T@U) ) (!  (=> (= (type this@@4) RefType) (= (PredicateMaskField (Pair this@@4)) (|Pair#sm| this@@4)))
 :qid |stdinbpl.424:15|
 :skolemid |54|
 :pattern ( (PredicateMaskField (Pair this@@4)))
)))
(assert (forall ((Heap@@13 T@U) (o@@0 T@U) (f_3 T@U) (v T@U) ) (! (let ((B@@8 (type v)))
(let ((A@@9 (FieldTypeInv0 (type f_3))))
 (=> (and (and (= (type Heap@@13) (MapType0Type RefType)) (= (type o@@0) RefType)) (= (type f_3) (FieldType A@@9 B@@8))) (succHeap Heap@@13 (MapType0Store Heap@@13 o@@0 f_3 v)))))
 :qid |stdinbpl.78:22|
 :skolemid |9|
 :pattern ( (MapType0Store Heap@@13 o@@0 f_3 v))
)))
(assert  (and (forall ((arg0@@38 T@U) (arg1@@42 Real) (arg2@@35 T@U) (arg3@@33 Int) (arg4@@31 T@U) (arg5@@31 T@U) (arg6@@28 Int) ) (! (= (type (|wand#ft| arg0@@38 arg1@@42 arg2@@35 arg3@@33 arg4@@31 arg5@@31 arg6@@28)) (FieldType WandType_wandType FrameTypeType))
 :qid |funType:wand#ft|
 :pattern ( (|wand#ft| arg0@@38 arg1@@42 arg2@@35 arg3@@33 arg4@@31 arg5@@31 arg6@@28))
)) (forall ((arg0@@39 T@U) (arg1@@43 Real) (arg2@@36 T@U) (arg3@@34 Int) (arg4@@32 T@U) (arg5@@32 T@U) (arg6@@29 Int) ) (! (= (type (|wand#sm| arg0@@39 arg1@@43 arg2@@36 arg3@@34 arg4@@32 arg5@@32 arg6@@29)) (FieldType WandType_wandType (MapType1Type RefType boolType)))
 :qid |funType:wand#sm|
 :pattern ( (|wand#sm| arg0@@39 arg1@@43 arg2@@36 arg3@@34 arg4@@32 arg5@@32 arg6@@29))
))))
(assert (forall ((arg1@@44 T@U) (arg2@@37 Real) (arg3@@35 T@U) (arg4@@33 Int) (arg5@@33 T@U) (arg6@@30 T@U) (arg7@@20 Int) ) (!  (=> (and (and (and (= (type arg1@@44) RefType) (= (type arg3@@35) RefType)) (= (type arg5@@33) RefType)) (= (type arg6@@30) RefType)) (= (|wand#sm| arg1@@44 arg2@@37 arg3@@35 arg4@@33 arg5@@33 arg6@@30 arg7@@20) (WandMaskField (|wand#ft| arg1@@44 arg2@@37 arg3@@35 arg4@@33 arg5@@33 arg6@@30 arg7@@20))))
 :qid |stdinbpl.202:15|
 :skolemid |26|
 :pattern ( (WandMaskField (|wand#ft| arg1@@44 arg2@@37 arg3@@35 arg4@@33 arg5@@33 arg6@@30 arg7@@20)))
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
(assert (forall ((arg1@@45 T@U) (arg2@@38 Real) (arg3@@36 T@U) (arg4@@34 Int) (arg5@@34 T@U) (arg6@@31 T@U) (arg7@@21 Int) ) (!  (=> (and (and (and (= (type arg1@@45) RefType) (= (type arg3@@36) RefType)) (= (type arg5@@34) RefType)) (= (type arg6@@31) RefType)) (IsWandField (wand arg1@@45 arg2@@38 arg3@@36 arg4@@34 arg5@@34 arg6@@31 arg7@@21)))
 :qid |stdinbpl.186:15|
 :skolemid |22|
 :pattern ( (wand arg1@@45 arg2@@38 arg3@@36 arg4@@34 arg5@@34 arg6@@31 arg7@@21))
)))
(assert (forall ((arg1@@46 T@U) (arg2@@39 Real) (arg3@@37 T@U) (arg4@@35 Int) (arg5@@35 T@U) (arg6@@32 T@U) (arg7@@22 Int) ) (!  (=> (and (and (and (= (type arg1@@46) RefType) (= (type arg3@@37) RefType)) (= (type arg5@@35) RefType)) (= (type arg6@@32) RefType)) (IsWandField (|wand#ft| arg1@@46 arg2@@39 arg3@@37 arg4@@35 arg5@@35 arg6@@32 arg7@@22)))
 :qid |stdinbpl.190:15|
 :skolemid |23|
 :pattern ( (|wand#ft| arg1@@46 arg2@@39 arg3@@37 arg4@@35 arg5@@35 arg6@@32 arg7@@22))
)))
(assert (forall ((arg1@@47 T@U) (arg2@@40 Real) (arg3@@38 T@U) (arg4@@36 Int) (arg5@@36 T@U) (arg6@@33 T@U) (arg7@@23 Int) ) (!  (=> (and (and (and (= (type arg1@@47) RefType) (= (type arg3@@38) RefType)) (= (type arg5@@36) RefType)) (= (type arg6@@33) RefType)) (not (IsPredicateField (wand arg1@@47 arg2@@40 arg3@@38 arg4@@36 arg5@@36 arg6@@33 arg7@@23))))
 :qid |stdinbpl.194:15|
 :skolemid |24|
 :pattern ( (wand arg1@@47 arg2@@40 arg3@@38 arg4@@36 arg5@@36 arg6@@33 arg7@@23))
)))
(assert (forall ((arg1@@48 T@U) (arg2@@41 Real) (arg3@@39 T@U) (arg4@@37 Int) (arg5@@37 T@U) (arg6@@34 T@U) (arg7@@24 Int) ) (!  (=> (and (and (and (= (type arg1@@48) RefType) (= (type arg3@@39) RefType)) (= (type arg5@@37) RefType)) (= (type arg6@@34) RefType)) (not (IsPredicateField (|wand#ft| arg1@@48 arg2@@41 arg3@@39 arg4@@37 arg5@@37 arg6@@34 arg7@@24))))
 :qid |stdinbpl.198:15|
 :skolemid |25|
 :pattern ( (|wand#ft| arg1@@48 arg2@@41 arg3@@39 arg4@@37 arg5@@37 arg6@@34 arg7@@24))
)))
(assert (forall ((arg1@@49 T@U) (arg2@@42 Real) (arg3@@40 T@U) (arg4@@38 Int) (arg5@@38 T@U) (arg6@@35 T@U) (arg7@@25 Int) ) (!  (=> (and (and (and (= (type arg1@@49) RefType) (= (type arg3@@40) RefType)) (= (type arg5@@38) RefType)) (= (type arg6@@35) RefType)) (= (getPredWandId (wand arg1@@49 arg2@@42 arg3@@40 arg4@@38 arg5@@38 arg6@@35 arg7@@25)) 1))
 :qid |stdinbpl.206:15|
 :skolemid |27|
 :pattern ( (wand arg1@@49 arg2@@42 arg3@@40 arg4@@38 arg5@@38 arg6@@35 arg7@@25))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun Mask@19 () T@U)
(declare-fun freshObj@0 () T@U)
(declare-fun Heap@19 () T@U)
(declare-fun Heap@18 () T@U)
(declare-fun Heap@17 () T@U)
(declare-fun ExhaleHeap@1 () T@U)
(declare-fun Heap@15 () T@U)
(declare-fun Heap@16 () T@U)
(declare-fun freshVersion@1 () T@U)
(declare-fun Mask@18 () T@U)
(declare-fun Mask@17 () T@U)
(declare-fun CombineFrames (T@U T@U) T@U)
(declare-fun FrameFragment (T@U) T@U)
(declare-fun Mask@16 () T@U)
(declare-fun Mask@14 () T@U)
(declare-fun Mask@13 () T@U)
(declare-fun Heap@14 () T@U)
(declare-fun Mask@15 () T@U)
(declare-fun b_10@21 () Bool)
(declare-fun b_13@12 () Bool)
(declare-fun Result_4Heap () T@U)
(declare-fun Mask@11 () T@U)
(declare-fun Mask@12 () T@U)
(declare-fun Result_4Mask () T@U)
(declare-fun b_10@20 () Bool)
(declare-fun neededTransfer@11 () Real)
(declare-fun Used_7Mask@7 () T@U)
(declare-fun initNeededTransfer@2 () Real)
(declare-fun b_15@0 () Bool)
(declare-fun b_15@1 () Bool)
(declare-fun b_15@2 () Bool)
(declare-fun Ops_5Mask@13 () T@U)
(declare-fun b_15@3 () Bool)
(declare-fun Ops_5Heap@2 () T@U)
(declare-fun Used_7Heap@0 () T@U)
(declare-fun b_15@4 () Bool)
(declare-fun takeTransfer@5 () Real)
(declare-fun neededTransfer@9 () Real)
(declare-fun b_13@9 () Bool)
(declare-fun Mask@9 () T@U)
(declare-fun Heap@12 () T@U)
(declare-fun Used_7Mask@5 () T@U)
(declare-fun neededTransfer@10 () Real)
(declare-fun Used_7Mask@6 () T@U)
(declare-fun b_13@10 () Bool)
(declare-fun b_13@11 () Bool)
(declare-fun Mask@10 () T@U)
(declare-fun Heap@13 () T@U)
(declare-fun maskTransfer@5 () Real)
(declare-fun takeTransfer@4 () Real)
(declare-fun Used_7Mask@3 () T@U)
(declare-fun b_13@6 () Bool)
(declare-fun Ops_5Mask@11 () T@U)
(declare-fun neededTransfer@8 () Real)
(declare-fun Used_7Mask@4 () T@U)
(declare-fun b_13@7 () Bool)
(declare-fun b_13@8 () Bool)
(declare-fun Ops_5Mask@12 () T@U)
(declare-fun maskTransfer@4 () Real)
(declare-fun b_10@19 () Bool)
(declare-fun neededTransfer@7 () Real)
(declare-fun initNeededTransfer@1 () Real)
(declare-fun b_14@0 () Bool)
(declare-fun b_14@1 () Bool)
(declare-fun Result_3Heap () T@U)
(declare-fun Result_3Mask () T@U)
(declare-fun b_14@2 () Bool)
(declare-fun b_14@3 () Bool)
(declare-fun b_14@4 () Bool)
(declare-fun takeTransfer@3 () Real)
(declare-fun Heap@10 () T@U)
(declare-fun Mask@7 () T@U)
(declare-fun neededTransfer@5 () Real)
(declare-fun b_13@3 () Bool)
(declare-fun Used_7Mask@1 () T@U)
(declare-fun neededTransfer@6 () Real)
(declare-fun Used_7Mask@2 () T@U)
(declare-fun b_13@4 () Bool)
(declare-fun b_13@5 () Bool)
(declare-fun Mask@8 () T@U)
(declare-fun Heap@11 () T@U)
(declare-fun maskTransfer@3 () Real)
(declare-fun takeTransfer@2 () Real)
(declare-fun Ops_5Mask@9 () T@U)
(declare-fun b_13@0 () Bool)
(declare-fun neededTransfer@4 () Real)
(declare-fun Used_7Mask@0 () T@U)
(declare-fun b_13@1 () Bool)
(declare-fun b_13@2 () Bool)
(declare-fun Ops_5Mask@10 () T@U)
(declare-fun maskTransfer@2 () Real)
(declare-fun b_13 () Bool)
(declare-fun b_10@9 () Bool)
(declare-fun b_11@6 () Bool)
(declare-fun neededTransfer@3 () Real)
(declare-fun Used_6Mask@3 () T@U)
(declare-fun initNeededTransfer@0 () Real)
(declare-fun b_12@0 () Bool)
(declare-fun b_12@1 () Bool)
(declare-fun Result_2Heap () T@U)
(declare-fun Result_2Mask () T@U)
(declare-fun b_12@2 () Bool)
(declare-fun Ops_5Mask@6 () T@U)
(declare-fun b_12@3 () Bool)
(declare-fun Used_6Heap@0 () T@U)
(declare-fun b_12@4 () Bool)
(declare-fun b_10@10 () Bool)
(declare-fun b_10@11 () Bool)
(declare-fun b_10@12 () Bool)
(declare-fun b_10@13 () Bool)
(declare-fun Ops_5Mask@7 () T@U)
(declare-fun b_10@14 () Bool)
(declare-fun b_10@15 () Bool)
(declare-fun Ops_5Mask@8 () T@U)
(declare-fun b_10@16 () Bool)
(declare-fun b_10@17 () Bool)
(declare-fun b_10@18 () Bool)
(declare-fun Heap@9 () T@U)
(declare-fun Mask@6 () T@U)
(declare-fun takeTransfer@1 () Real)
(declare-fun Mask@4 () T@U)
(declare-fun Heap@7 () T@U)
(declare-fun neededTransfer@1 () Real)
(declare-fun b_11@3 () Bool)
(declare-fun Used_6Mask@1 () T@U)
(declare-fun neededTransfer@2 () Real)
(declare-fun Used_6Mask@2 () T@U)
(declare-fun b_11@4 () Bool)
(declare-fun TempMask@1 () T@U)
(declare-fun b_11@5 () Bool)
(declare-fun Mask@5 () T@U)
(declare-fun newPMask@0 () T@U)
(declare-fun Heap@8 () T@U)
(declare-fun maskTransfer@1 () Real)
(declare-fun takeTransfer@0 () Real)
(declare-fun Ops_5Mask@4 () T@U)
(declare-fun b_11@0 () Bool)
(declare-fun neededTransfer@0 () Real)
(declare-fun Used_6Mask@0 () T@U)
(declare-fun b_11@1 () Bool)
(declare-fun TempMask@0 () T@U)
(declare-fun b_11@2 () Bool)
(declare-fun Ops_5Mask@5 () T@U)
(declare-fun maskTransfer@0 () Real)
(declare-fun b_11 () Bool)
(declare-fun b_10@8 () Bool)
(declare-fun b_10@7 () Bool)
(declare-fun b_10@6 () Bool)
(declare-fun b_10@5 () Bool)
(declare-fun Ops_5Heap@1 () T@U)
(declare-fun Ops_5Mask@3 () T@U)
(declare-fun Ops_5Mask@2 () T@U)
(declare-fun Ops_5Mask@1 () T@U)
(declare-fun b_10@4 () Bool)
(declare-fun b_10@3 () Bool)
(declare-fun Ops_5Heap@0 () T@U)
(declare-fun ExhaleHeap@0 () T@U)
(declare-fun b_10@2 () Bool)
(declare-fun b_10@0 () Bool)
(declare-fun Ops_5Mask@0 () T@U)
(declare-fun b_10@1 () Bool)
(declare-fun Heap@6 () T@U)
(declare-fun Heap@5 () T@U)
(declare-fun b_10 () Bool)
(declare-fun b_9@0 () Bool)
(declare-fun b_9 () Bool)
(declare-fun Used_5Heap@0 () T@U)
(declare-fun Heap@2 () T@U)
(declare-fun Heap@3 () T@U)
(declare-fun Heap@4 () T@U)
(declare-fun freshVersion@0 () T@U)
(declare-fun Mask@3 () T@U)
(declare-fun Mask@2 () T@U)
(declare-fun Mask@1 () T@U)
(declare-fun Heap@@14 () T@U)
(declare-fun p_1@@3 () T@U)
(declare-fun Heap@0 () T@U)
(declare-fun Mask@0 () T@U)
(declare-fun Heap@1 () T@U)
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (= (type Heap@19) (MapType0Type RefType)) (= (type freshObj@0) RefType)) (= (type Mask@19) (MapType1Type RefType realType))) (= (type Heap@18) (MapType0Type RefType))) (= (type Heap@17) (MapType0Type RefType))) (= (type Heap@15) (MapType0Type RefType))) (= (type ExhaleHeap@1) (MapType0Type RefType))) (= (type Heap@16) (MapType0Type RefType))) (= (type freshVersion@1) FrameTypeType)) (= (type Mask@18) (MapType1Type RefType realType))) (= (type Mask@17) (MapType1Type RefType realType))) (forall ((arg0@@40 T@U) (arg1@@50 T@U) ) (! (= (type (CombineFrames arg0@@40 arg1@@50)) FrameTypeType)
 :qid |funType:CombineFrames|
 :pattern ( (CombineFrames arg0@@40 arg1@@50))
))) (forall ((arg0@@41 T@U) ) (! (= (type (FrameFragment arg0@@41)) FrameTypeType)
 :qid |funType:FrameFragment|
 :pattern ( (FrameFragment arg0@@41))
))) (= (type Mask@16) (MapType1Type RefType realType))) (= (type Mask@14) (MapType1Type RefType realType))) (= (type Mask@13) (MapType1Type RefType realType))) (= (type Heap@14) (MapType0Type RefType))) (= (type Mask@15) (MapType1Type RefType realType))) (= (type Result_4Heap) (MapType0Type RefType))) (= (type Mask@11) (MapType1Type RefType realType))) (= (type Mask@12) (MapType1Type RefType realType))) (= (type Result_4Mask) (MapType1Type RefType realType))) (= (type Used_7Mask@7) (MapType1Type RefType realType))) (= (type Ops_5Mask@13) (MapType1Type RefType realType))) (= (type Ops_5Heap@2) (MapType0Type RefType))) (= (type Used_7Heap@0) (MapType0Type RefType))) (= (type Mask@9) (MapType1Type RefType realType))) (= (type Heap@12) (MapType0Type RefType))) (= (type Used_7Mask@5) (MapType1Type RefType realType))) (= (type Used_7Mask@6) (MapType1Type RefType realType))) (= (type Mask@10) (MapType1Type RefType realType))) (= (type Heap@13) (MapType0Type RefType))) (= (type Used_7Mask@3) (MapType1Type RefType realType))) (= (type Ops_5Mask@11) (MapType1Type RefType realType))) (= (type Used_7Mask@4) (MapType1Type RefType realType))) (= (type Ops_5Mask@12) (MapType1Type RefType realType))) (= (type Result_3Heap) (MapType0Type RefType))) (= (type Result_3Mask) (MapType1Type RefType realType))) (= (type Heap@10) (MapType0Type RefType))) (= (type Mask@7) (MapType1Type RefType realType))) (= (type Used_7Mask@1) (MapType1Type RefType realType))) (= (type Used_7Mask@2) (MapType1Type RefType realType))) (= (type Mask@8) (MapType1Type RefType realType))) (= (type Heap@11) (MapType0Type RefType))) (= (type Ops_5Mask@9) (MapType1Type RefType realType))) (= (type Used_7Mask@0) (MapType1Type RefType realType))) (= (type Ops_5Mask@10) (MapType1Type RefType realType))) (= (type Heap@7) (MapType0Type RefType))) (= (type Mask@4) (MapType1Type RefType realType))) (= (type Ops_5Mask@4) (MapType1Type RefType realType))) (= (type Used_6Mask@3) (MapType1Type RefType realType))) (= (type Result_2Heap) (MapType0Type RefType))) (= (type Result_2Mask) (MapType1Type RefType realType))) (= (type Ops_5Mask@6) (MapType1Type RefType realType))) (= (type Used_6Heap@0) (MapType0Type RefType))) (= (type Ops_5Mask@7) (MapType1Type RefType realType))) (= (type Ops_5Mask@8) (MapType1Type RefType realType))) (= (type Heap@9) (MapType0Type RefType))) (= (type Mask@6) (MapType1Type RefType realType))) (= (type Used_6Mask@1) (MapType1Type RefType realType))) (= (type Used_6Mask@2) (MapType1Type RefType realType))) (= (type TempMask@1) (MapType1Type RefType realType))) (= (type Mask@5) (MapType1Type RefType realType))) (= (type newPMask@0) (MapType1Type RefType boolType))) (= (type Heap@8) (MapType0Type RefType))) (= (type Used_6Mask@0) (MapType1Type RefType realType))) (= (type TempMask@0) (MapType1Type RefType realType))) (= (type Ops_5Mask@5) (MapType1Type RefType realType))) (= (type Ops_5Heap@0) (MapType0Type RefType))) (= (type Ops_5Mask@1) (MapType1Type RefType realType))) (= (type Ops_5Heap@1) (MapType0Type RefType))) (= (type Ops_5Mask@3) (MapType1Type RefType realType))) (= (type Ops_5Mask@2) (MapType1Type RefType realType))) (= (type ExhaleHeap@0) (MapType0Type RefType))) (= (type Ops_5Mask@0) (MapType1Type RefType realType))) (= (type Heap@6) (MapType0Type RefType))) (= (type Heap@5) (MapType0Type RefType))) (= (type Used_5Heap@0) (MapType0Type RefType))) (= (type Heap@3) (MapType0Type RefType))) (= (type Heap@2) (MapType0Type RefType))) (= (type Heap@4) (MapType0Type RefType))) (= (type freshVersion@0) FrameTypeType)) (= (type Mask@3) (MapType1Type RefType realType))) (= (type Mask@2) (MapType1Type RefType realType))) (= (type Mask@1) (MapType1Type RefType realType))) (= (type Heap@@14) (MapType0Type RefType))) (= (type p_1@@3) RefType)) (= (type Heap@0) (MapType0Type RefType))) (= (type Mask@0) (MapType1Type RefType realType))) (= (type Heap@1) (MapType0Type RefType))))
(set-info :boogie-vc-id test01)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 110) (let ((anon68_correct true))
(let ((anon105_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 7) 4)) anon68_correct)))
(let ((anon105_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 5) (- 0 6)) (<= FullPerm (U_2_real (MapType1Select Mask@19 null (Pair freshObj@0))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@19 null (Pair freshObj@0)))) (=> (= (ControlFlow 0 5) 4) anon68_correct))))))
(let ((anon104_Else_correct  (and (=> (= (ControlFlow 0 2) (- 0 3)) (= (sum Heap@19 freshObj@0) 10)) (=> (= (sum Heap@19 freshObj@0) 10) (=> (and (state Heap@19 Mask@19) (= (ControlFlow 0 2) (- 0 1))) false)))))
(let ((anon65_correct  (=> (and (and (= Heap@18 (MapType0Store Heap@17 null (|Pair#sm| freshObj@0) (MapType1Store (MapType0Select Heap@17 null (|Pair#sm| freshObj@0)) freshObj@0 f_7 (bool_2_U true)))) (= Heap@19 (MapType0Store Heap@18 null (|Pair#sm| freshObj@0) (MapType1Store (MapType0Select Heap@18 null (|Pair#sm| freshObj@0)) freshObj@0 g (bool_2_U true))))) (and (state Heap@19 Mask@19) (state Heap@19 Mask@19))) (and (and (=> (= (ControlFlow 0 8) 2) anon104_Else_correct) (=> (= (ControlFlow 0 8) 5) anon105_Then_correct)) (=> (= (ControlFlow 0 8) 7) anon105_Else_correct)))))
(let ((anon103_Else_correct  (=> (HasDirectPerm Mask@19 null (Pair freshObj@0)) (=> (and (= Heap@17 ExhaleHeap@1) (= (ControlFlow 0 10) 8)) anon65_correct))))
(let ((anon103_Then_correct  (=> (not (HasDirectPerm Mask@19 null (Pair freshObj@0))) (=> (and (and (= Heap@15 (MapType0Store ExhaleHeap@1 null (|Pair#sm| freshObj@0) ZeroPMask)) (= Heap@16 (MapType0Store Heap@15 null (Pair freshObj@0) freshVersion@1))) (and (= Heap@17 Heap@16) (= (ControlFlow 0 9) 8))) anon65_correct))))
(let ((anon63_correct  (=> (and (= Mask@18 (MapType1Store Mask@17 freshObj@0 g (real_2_U (- (U_2_real (MapType1Select Mask@17 freshObj@0 g)) FullPerm)))) (= Mask@19 (MapType1Store Mask@18 null (Pair freshObj@0) (real_2_U (+ (U_2_real (MapType1Select Mask@18 null (Pair freshObj@0))) FullPerm))))) (=> (and (and (state ExhaleHeap@1 Mask@19) (state ExhaleHeap@1 Mask@19)) (and (|Pair#trigger| ExhaleHeap@1 (Pair freshObj@0)) (= (MapType0Select ExhaleHeap@1 null (Pair freshObj@0)) (CombineFrames (FrameFragment (MapType0Select ExhaleHeap@1 freshObj@0 f_7)) (FrameFragment (MapType0Select ExhaleHeap@1 freshObj@0 g)))))) (and (=> (= (ControlFlow 0 11) 9) anon103_Then_correct) (=> (= (ControlFlow 0 11) 10) anon103_Else_correct))))))
(let ((anon102_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 14) 11)) anon63_correct)))
(let ((anon102_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 12) (- 0 13)) (<= FullPerm (U_2_real (MapType1Select Mask@17 freshObj@0 g)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@17 freshObj@0 g))) (=> (= (ControlFlow 0 12) 11) anon63_correct))))))
(let ((anon61_correct  (=> (= Mask@17 (MapType1Store Mask@16 freshObj@0 f_7 (real_2_U (- (U_2_real (MapType1Select Mask@16 freshObj@0 f_7)) FullPerm)))) (and (=> (= (ControlFlow 0 15) 12) anon102_Then_correct) (=> (= (ControlFlow 0 15) 14) anon102_Else_correct)))))
(let ((anon101_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 18) 15)) anon61_correct)))
(let ((anon101_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 16) (- 0 17)) (<= FullPerm (U_2_real (MapType1Select Mask@16 freshObj@0 f_7)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@16 freshObj@0 f_7))) (=> (= (ControlFlow 0 16) 15) anon61_correct))))))
(let ((anon59_correct  (=> (= Mask@14 (MapType1Store Mask@13 null (Pair freshObj@0) (real_2_U (- (U_2_real (MapType1Select Mask@13 null (Pair freshObj@0))) FullPerm)))) (and (=> (= (ControlFlow 0 19) (- 0 20)) (= (sum Heap@14 freshObj@0) 10)) (=> (= (sum Heap@14 freshObj@0) 10) (=> (and (and (state Heap@14 Mask@14) (not (= freshObj@0 null))) (and (= Mask@15 (MapType1Store Mask@14 freshObj@0 f_7 (real_2_U (+ (U_2_real (MapType1Select Mask@14 freshObj@0 f_7)) FullPerm)))) (state Heap@14 Mask@15))) (=> (and (and (and (not (= freshObj@0 null)) (= Mask@16 (MapType1Store Mask@15 freshObj@0 g (real_2_U (+ (U_2_real (MapType1Select Mask@15 freshObj@0 g)) FullPerm))))) (and (state Heap@14 Mask@16) (= (+ (U_2_int (MapType0Select Heap@14 freshObj@0 f_7)) (U_2_int (MapType0Select Heap@14 freshObj@0 g))) 10))) (and (and (state Heap@14 Mask@16) (IdenticalOnKnownLocations Heap@14 ExhaleHeap@1 Mask@16)) (and (state ExhaleHeap@1 Mask@16) (state ExhaleHeap@1 Mask@16)))) (and (=> (= (ControlFlow 0 19) 16) anon101_Then_correct) (=> (= (ControlFlow 0 19) 18) anon101_Else_correct)))))))))
(let ((anon100_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 23) 19)) anon59_correct)))
(let ((anon100_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 21) (- 0 22)) (<= FullPerm (U_2_real (MapType1Select Mask@13 null (Pair freshObj@0))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@13 null (Pair freshObj@0)))) (=> (= (ControlFlow 0 21) 19) anon59_correct))))))
(let ((anon57_correct  (and (=> (= (ControlFlow 0 24) (- 0 26)) (=> (and (and b_10@21 b_10@21) b_13@12) (= (+ (U_2_int (MapType0Select Result_4Heap freshObj@0 f_7)) (U_2_int (MapType0Select Result_4Heap freshObj@0 g))) 10))) (=> (=> (and (and b_10@21 b_10@21) b_13@12) (= (+ (U_2_int (MapType0Select Result_4Heap freshObj@0 f_7)) (U_2_int (MapType0Select Result_4Heap freshObj@0 g))) 10)) (=> (state Heap@14 Mask@11) (=> (and (and (= Mask@12 (MapType1Store Mask@11 null (wand_2 freshObj@0 FullPerm freshObj@0 10 freshObj@0 FullPerm freshObj@0 FullPerm freshObj@0 freshObj@0 10) (real_2_U (+ (U_2_real (MapType1Select Mask@11 null (wand_2 freshObj@0 FullPerm freshObj@0 10 freshObj@0 FullPerm freshObj@0 FullPerm freshObj@0 freshObj@0 10))) FullPerm)))) (state Heap@14 Mask@12)) (and (state Heap@14 Mask@12) (state Heap@14 Mask@12))) (and (=> (= (ControlFlow 0 24) (- 0 25)) (<= FullPerm (U_2_real (MapType1Select Mask@12 null (wand_2 freshObj@0 FullPerm freshObj@0 10 freshObj@0 FullPerm freshObj@0 FullPerm freshObj@0 freshObj@0 10))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@12 null (wand_2 freshObj@0 FullPerm freshObj@0 10 freshObj@0 FullPerm freshObj@0 FullPerm freshObj@0 freshObj@0 10)))) (=> (and (= Mask@13 (MapType1Store Mask@12 null (wand_2 freshObj@0 FullPerm freshObj@0 10 freshObj@0 FullPerm freshObj@0 FullPerm freshObj@0 freshObj@0 10) (real_2_U (- (U_2_real (MapType1Select Mask@12 null (wand_2 freshObj@0 FullPerm freshObj@0 10 freshObj@0 FullPerm freshObj@0 FullPerm freshObj@0 freshObj@0 10))) FullPerm)))) (state Heap@14 Mask@13)) (and (=> (= (ControlFlow 0 24) 21) anon100_Then_correct) (=> (= (ControlFlow 0 24) 23) anon100_Else_correct)))))))))))
(let ((anon99_Else_correct  (=> (and (not b_10@21) (= (ControlFlow 0 31) 24)) anon57_correct)))
(let ((anon99_Then_correct  (=> b_10@21 (and (=> (= (ControlFlow 0 28) (- 0 30)) (HasDirectPerm Result_4Mask freshObj@0 f_7)) (=> (HasDirectPerm Result_4Mask freshObj@0 f_7) (and (=> (= (ControlFlow 0 28) (- 0 29)) (HasDirectPerm Result_4Mask freshObj@0 g)) (=> (HasDirectPerm Result_4Mask freshObj@0 g) (=> (= (ControlFlow 0 28) 24) anon57_correct))))))))
(let ((anon98_Then_correct  (=> (and (and b_10@21 b_10@21) b_13@12) (and (=> (= (ControlFlow 0 32) 28) anon99_Then_correct) (=> (= (ControlFlow 0 32) 31) anon99_Else_correct)))))
(let ((anon98_Else_correct  (=> (and (not (and (and b_10@21 b_10@21) b_13@12)) (= (ControlFlow 0 27) 24)) anon57_correct)))
(let ((anon54_correct  (and (=> (= (ControlFlow 0 33) (- 0 34)) (=> (and (and b_10@20 b_10@20) b_13@12) (and (= neededTransfer@11 0.0) (= (U_2_real (MapType1Select Used_7Mask@7 freshObj@0 g)) initNeededTransfer@2)))) (=> (=> (and (and b_10@20 b_10@20) b_13@12) (and (= neededTransfer@11 0.0) (= (U_2_real (MapType1Select Used_7Mask@7 freshObj@0 g)) initNeededTransfer@2))) (=> (and (= b_15@0  (and b_10@20 b_13@12)) (= b_15@1  (and b_15@0 (state Result_4Heap Result_4Mask)))) (=> (and (and (= b_15@2  (and b_15@1 (sumMask Result_4Mask Ops_5Mask@13 Used_7Mask@7))) (= b_15@3  (and (and b_15@2 (IdenticalOnKnownLocations Ops_5Heap@2 Result_4Heap Ops_5Mask@13)) (IdenticalOnKnownLocations Used_7Heap@0 Result_4Heap Used_7Mask@7)))) (and (= b_15@4  (and b_15@3 (state Result_4Heap Result_4Mask))) (= b_10@21  (and b_10@20 b_15@4)))) (and (=> (= (ControlFlow 0 33) 32) anon98_Then_correct) (=> (= (ControlFlow 0 33) 27) anon98_Else_correct))))))))
(let ((anon97_Else_correct  (=> (>= 0.0 takeTransfer@5) (=> (and (= neededTransfer@11 neededTransfer@9) (= b_13@12 b_13@9)) (=> (and (and (= Mask@11 Mask@9) (= Heap@14 Heap@12)) (and (= Used_7Mask@7 Used_7Mask@5) (= (ControlFlow 0 37) 33))) anon54_correct)))))
(let ((anon97_Then_correct  (=> (> takeTransfer@5 0.0) (=> (and (and (= neededTransfer@10 (- neededTransfer@9 takeTransfer@5)) (= Used_7Mask@6 (MapType1Store Used_7Mask@5 freshObj@0 g (real_2_U (+ (U_2_real (MapType1Select Used_7Mask@5 freshObj@0 g)) takeTransfer@5))))) (and (= b_13@10  (and b_13@9 (state Used_7Heap@0 Used_7Mask@6))) (= b_13@11  (and b_13@10 (= (U_2_int (MapType0Select Heap@12 freshObj@0 g)) (U_2_int (MapType0Select Used_7Heap@0 freshObj@0 g))))))) (=> (and (and (and (= Mask@10 (MapType1Store Mask@9 freshObj@0 g (real_2_U (- (U_2_real (MapType1Select Mask@9 freshObj@0 g)) takeTransfer@5)))) (= Heap@13 (MapType0Store Heap@12 null (|wand_2#sm| freshObj@0 FullPerm freshObj@0 10 freshObj@0 FullPerm freshObj@0 FullPerm freshObj@0 freshObj@0 10) (MapType1Store (MapType0Select Heap@12 null (|wand_2#sm| freshObj@0 FullPerm freshObj@0 10 freshObj@0 FullPerm freshObj@0 FullPerm freshObj@0 freshObj@0 10)) freshObj@0 g (bool_2_U true))))) (and (= neededTransfer@11 neededTransfer@10) (= b_13@12 b_13@11))) (and (and (= Mask@11 Mask@10) (= Heap@14 Heap@13)) (and (= Used_7Mask@7 Used_7Mask@6) (= (ControlFlow 0 36) 33)))) anon54_correct)))))
(let ((anon96_Else_correct  (=> (and (< maskTransfer@5 neededTransfer@9) (= takeTransfer@5 maskTransfer@5)) (and (=> (= (ControlFlow 0 39) 36) anon97_Then_correct) (=> (= (ControlFlow 0 39) 37) anon97_Else_correct)))))
(let ((anon96_Then_correct  (=> (and (<= neededTransfer@9 maskTransfer@5) (= takeTransfer@5 neededTransfer@9)) (and (=> (= (ControlFlow 0 38) 36) anon97_Then_correct) (=> (= (ControlFlow 0 38) 37) anon97_Else_correct)))))
(let ((anon95_Then_correct  (=> (and (and (and (and (and b_10@20 b_10@20) b_13@9) true) (> neededTransfer@9 0.0)) (= maskTransfer@5 (U_2_real (MapType1Select Mask@9 freshObj@0 g)))) (and (=> (= (ControlFlow 0 40) 38) anon96_Then_correct) (=> (= (ControlFlow 0 40) 39) anon96_Else_correct)))))
(let ((anon95_Else_correct  (=> (not (and (and (and (and b_10@20 b_10@20) b_13@9) true) (> neededTransfer@9 0.0))) (=> (and (= neededTransfer@11 neededTransfer@9) (= b_13@12 b_13@9)) (=> (and (and (= Mask@11 Mask@9) (= Heap@14 Heap@12)) (and (= Used_7Mask@7 Used_7Mask@5) (= (ControlFlow 0 35) 33))) anon54_correct)))))
(let ((anon94_Else_correct  (=> (>= 0.0 takeTransfer@4) (=> (and (and (= Used_7Mask@5 Used_7Mask@3) (= b_13@9 b_13@6)) (and (= neededTransfer@9 FullPerm) (= Ops_5Mask@13 Ops_5Mask@11))) (and (=> (= (ControlFlow 0 43) 40) anon95_Then_correct) (=> (= (ControlFlow 0 43) 35) anon95_Else_correct))))))
(let ((anon94_Then_correct  (=> (and (> takeTransfer@4 0.0) (= neededTransfer@8 (- FullPerm takeTransfer@4))) (=> (and (and (and (= Used_7Mask@4 (MapType1Store Used_7Mask@3 freshObj@0 g (real_2_U (+ (U_2_real (MapType1Select Used_7Mask@3 freshObj@0 g)) takeTransfer@4)))) (= b_13@7  (and b_13@6 (state Used_7Heap@0 Used_7Mask@4)))) (and (= b_13@8  (and b_13@7 (= (U_2_int (MapType0Select Ops_5Heap@2 freshObj@0 g)) (U_2_int (MapType0Select Used_7Heap@0 freshObj@0 g))))) (= Ops_5Mask@12 (MapType1Store Ops_5Mask@11 freshObj@0 g (real_2_U (- (U_2_real (MapType1Select Ops_5Mask@11 freshObj@0 g)) takeTransfer@4)))))) (and (and (= Used_7Mask@5 Used_7Mask@4) (= b_13@9 b_13@8)) (and (= neededTransfer@9 neededTransfer@8) (= Ops_5Mask@13 Ops_5Mask@12)))) (and (=> (= (ControlFlow 0 42) 40) anon95_Then_correct) (=> (= (ControlFlow 0 42) 35) anon95_Else_correct))))))
(let ((anon93_Else_correct  (=> (and (< maskTransfer@4 FullPerm) (= takeTransfer@4 maskTransfer@4)) (and (=> (= (ControlFlow 0 45) 42) anon94_Then_correct) (=> (= (ControlFlow 0 45) 43) anon94_Else_correct)))))
(let ((anon93_Then_correct  (=> (and (<= FullPerm maskTransfer@4) (= takeTransfer@4 FullPerm)) (and (=> (= (ControlFlow 0 44) 42) anon94_Then_correct) (=> (= (ControlFlow 0 44) 43) anon94_Else_correct)))))
(let ((anon92_Then_correct  (=> (and (and (and (and (and b_10@20 b_10@20) b_13@6) true) (> FullPerm 0.0)) (= maskTransfer@4 (U_2_real (MapType1Select Ops_5Mask@11 freshObj@0 g)))) (and (=> (= (ControlFlow 0 46) 44) anon93_Then_correct) (=> (= (ControlFlow 0 46) 45) anon93_Else_correct)))))
(let ((anon92_Else_correct  (=> (not (and (and (and (and b_10@20 b_10@20) b_13@6) true) (> FullPerm 0.0))) (=> (and (and (= Used_7Mask@5 Used_7Mask@3) (= b_13@9 b_13@6)) (and (= neededTransfer@9 FullPerm) (= Ops_5Mask@13 Ops_5Mask@11))) (and (=> (= (ControlFlow 0 41) 40) anon95_Then_correct) (=> (= (ControlFlow 0 41) 35) anon95_Else_correct))))))
(let ((anon42_correct  (and (=> (= (ControlFlow 0 47) (- 0 49)) (=> (and (and b_10@19 b_10@19) b_13@6) (and (= neededTransfer@7 0.0) (= (U_2_real (MapType1Select Used_7Mask@3 freshObj@0 f_7)) initNeededTransfer@1)))) (=> (=> (and (and b_10@19 b_10@19) b_13@6) (and (= neededTransfer@7 0.0) (= (U_2_real (MapType1Select Used_7Mask@3 freshObj@0 f_7)) initNeededTransfer@1))) (=> (= b_14@0  (and b_10@19 b_13@6)) (=> (and (= b_14@1  (and b_14@0 (state Result_3Heap Result_3Mask))) (= b_14@2  (and b_14@1 (sumMask Result_3Mask Ops_5Mask@11 Used_7Mask@3)))) (=> (and (and (= b_14@3  (and (and b_14@2 (IdenticalOnKnownLocations Ops_5Heap@2 Result_3Heap Ops_5Mask@11)) (IdenticalOnKnownLocations Used_7Heap@0 Result_3Heap Used_7Mask@3))) (= b_14@4  (and b_14@3 (state Result_3Heap Result_3Mask)))) (and (= b_10@20  (and b_10@19 b_14@4)) (= initNeededTransfer@2 (+ (U_2_real (MapType1Select Used_7Mask@3 freshObj@0 g)) FullPerm)))) (and (=> (= (ControlFlow 0 47) (- 0 48)) (>= FullPerm 0.0)) (=> (>= FullPerm 0.0) (and (=> (= (ControlFlow 0 47) 46) anon92_Then_correct) (=> (= (ControlFlow 0 47) 41) anon92_Else_correct)))))))))))
(let ((anon91_Else_correct  (=> (>= 0.0 takeTransfer@3) (=> (and (= Heap@12 Heap@10) (= Mask@9 Mask@7)) (=> (and (and (= neededTransfer@7 neededTransfer@5) (= b_13@6 b_13@3)) (and (= Used_7Mask@3 Used_7Mask@1) (= (ControlFlow 0 52) 47))) anon42_correct)))))
(let ((anon91_Then_correct  (=> (> takeTransfer@3 0.0) (=> (and (and (= neededTransfer@6 (- neededTransfer@5 takeTransfer@3)) (= Used_7Mask@2 (MapType1Store Used_7Mask@1 freshObj@0 f_7 (real_2_U (+ (U_2_real (MapType1Select Used_7Mask@1 freshObj@0 f_7)) takeTransfer@3))))) (and (= b_13@4  (and b_13@3 (state Used_7Heap@0 Used_7Mask@2))) (= b_13@5  (and b_13@4 (= (U_2_int (MapType0Select Heap@10 freshObj@0 f_7)) (U_2_int (MapType0Select Used_7Heap@0 freshObj@0 f_7))))))) (=> (and (and (and (= Mask@8 (MapType1Store Mask@7 freshObj@0 f_7 (real_2_U (- (U_2_real (MapType1Select Mask@7 freshObj@0 f_7)) takeTransfer@3)))) (= Heap@11 (MapType0Store Heap@10 null (|wand_2#sm| freshObj@0 FullPerm freshObj@0 10 freshObj@0 FullPerm freshObj@0 FullPerm freshObj@0 freshObj@0 10) (MapType1Store (MapType0Select Heap@10 null (|wand_2#sm| freshObj@0 FullPerm freshObj@0 10 freshObj@0 FullPerm freshObj@0 FullPerm freshObj@0 freshObj@0 10)) freshObj@0 f_7 (bool_2_U true))))) (and (= Heap@12 Heap@11) (= Mask@9 Mask@8))) (and (and (= neededTransfer@7 neededTransfer@6) (= b_13@6 b_13@5)) (and (= Used_7Mask@3 Used_7Mask@2) (= (ControlFlow 0 51) 47)))) anon42_correct)))))
(let ((anon90_Else_correct  (=> (and (< maskTransfer@3 neededTransfer@5) (= takeTransfer@3 maskTransfer@3)) (and (=> (= (ControlFlow 0 54) 51) anon91_Then_correct) (=> (= (ControlFlow 0 54) 52) anon91_Else_correct)))))
(let ((anon90_Then_correct  (=> (and (<= neededTransfer@5 maskTransfer@3) (= takeTransfer@3 neededTransfer@5)) (and (=> (= (ControlFlow 0 53) 51) anon91_Then_correct) (=> (= (ControlFlow 0 53) 52) anon91_Else_correct)))))
(let ((anon89_Then_correct  (=> (and (and (and (and (and b_10@19 b_10@19) b_13@3) true) (> neededTransfer@5 0.0)) (= maskTransfer@3 (U_2_real (MapType1Select Mask@7 freshObj@0 f_7)))) (and (=> (= (ControlFlow 0 55) 53) anon90_Then_correct) (=> (= (ControlFlow 0 55) 54) anon90_Else_correct)))))
(let ((anon89_Else_correct  (=> (not (and (and (and (and b_10@19 b_10@19) b_13@3) true) (> neededTransfer@5 0.0))) (=> (and (= Heap@12 Heap@10) (= Mask@9 Mask@7)) (=> (and (and (= neededTransfer@7 neededTransfer@5) (= b_13@6 b_13@3)) (and (= Used_7Mask@3 Used_7Mask@1) (= (ControlFlow 0 50) 47))) anon42_correct)))))
(let ((anon88_Else_correct  (=> (>= 0.0 takeTransfer@2) (=> (and (and (= Ops_5Mask@11 Ops_5Mask@9) (= Used_7Mask@1 ZeroMask)) (and (= b_13@3 b_13@0) (= neededTransfer@5 FullPerm))) (and (=> (= (ControlFlow 0 58) 55) anon89_Then_correct) (=> (= (ControlFlow 0 58) 50) anon89_Else_correct))))))
(let ((anon88_Then_correct  (=> (and (> takeTransfer@2 0.0) (= neededTransfer@4 (- FullPerm takeTransfer@2))) (=> (and (and (and (= Used_7Mask@0 (MapType1Store ZeroMask freshObj@0 f_7 (real_2_U (+ (U_2_real (MapType1Select ZeroMask freshObj@0 f_7)) takeTransfer@2)))) (= b_13@1  (and b_13@0 (state Used_7Heap@0 Used_7Mask@0)))) (and (= b_13@2  (and b_13@1 (= (U_2_int (MapType0Select Ops_5Heap@2 freshObj@0 f_7)) (U_2_int (MapType0Select Used_7Heap@0 freshObj@0 f_7))))) (= Ops_5Mask@10 (MapType1Store Ops_5Mask@9 freshObj@0 f_7 (real_2_U (- (U_2_real (MapType1Select Ops_5Mask@9 freshObj@0 f_7)) takeTransfer@2)))))) (and (and (= Ops_5Mask@11 Ops_5Mask@10) (= Used_7Mask@1 Used_7Mask@0)) (and (= b_13@3 b_13@2) (= neededTransfer@5 neededTransfer@4)))) (and (=> (= (ControlFlow 0 57) 55) anon89_Then_correct) (=> (= (ControlFlow 0 57) 50) anon89_Else_correct))))))
(let ((anon87_Else_correct  (=> (and (< maskTransfer@2 FullPerm) (= takeTransfer@2 maskTransfer@2)) (and (=> (= (ControlFlow 0 60) 57) anon88_Then_correct) (=> (= (ControlFlow 0 60) 58) anon88_Else_correct)))))
(let ((anon87_Then_correct  (=> (and (<= FullPerm maskTransfer@2) (= takeTransfer@2 FullPerm)) (and (=> (= (ControlFlow 0 59) 57) anon88_Then_correct) (=> (= (ControlFlow 0 59) 58) anon88_Else_correct)))))
(let ((anon86_Then_correct  (=> (and (and (and (and (and b_10@19 b_10@19) b_13@0) true) (> FullPerm 0.0)) (= maskTransfer@2 (U_2_real (MapType1Select Ops_5Mask@9 freshObj@0 f_7)))) (and (=> (= (ControlFlow 0 61) 59) anon87_Then_correct) (=> (= (ControlFlow 0 61) 60) anon87_Else_correct)))))
(let ((anon86_Else_correct  (=> (not (and (and (and (and b_10@19 b_10@19) b_13@0) true) (> FullPerm 0.0))) (=> (and (and (= Ops_5Mask@11 Ops_5Mask@9) (= Used_7Mask@1 ZeroMask)) (and (= b_13@3 b_13@0) (= neededTransfer@5 FullPerm))) (and (=> (= (ControlFlow 0 56) 55) anon89_Then_correct) (=> (= (ControlFlow 0 56) 50) anon89_Else_correct))))))
(let ((anon30_correct  (=> (and (= b_13@0  (and b_13 (state Used_7Heap@0 ZeroMask))) (= initNeededTransfer@1 (+ (U_2_real (MapType1Select ZeroMask freshObj@0 f_7)) FullPerm))) (and (=> (= (ControlFlow 0 62) (- 0 63)) (>= FullPerm 0.0)) (=> (>= FullPerm 0.0) (and (=> (= (ControlFlow 0 62) 61) anon86_Then_correct) (=> (= (ControlFlow 0 62) 56) anon86_Else_correct)))))))
(let ((anon29_correct  (and (=> (= (ControlFlow 0 65) (- 0 66)) (=> (and b_10@9 b_11@6) (and (= neededTransfer@3 0.0) (= (U_2_real (MapType1Select Used_6Mask@3 null (Pair freshObj@0))) initNeededTransfer@0)))) (=> (=> (and b_10@9 b_11@6) (and (= neededTransfer@3 0.0) (= (U_2_real (MapType1Select Used_6Mask@3 null (Pair freshObj@0))) initNeededTransfer@0))) (=> (= b_12@0  (and b_10@9 b_11@6)) (=> (and (and (= b_12@1  (and b_12@0 (state Result_2Heap Result_2Mask))) (= b_12@2  (and b_12@1 (sumMask Result_2Mask Ops_5Mask@6 Used_6Mask@3)))) (and (= b_12@3  (and (and b_12@2 (IdenticalOnKnownLocations Ops_5Heap@2 Result_2Heap Ops_5Mask@6)) (IdenticalOnKnownLocations Used_6Heap@0 Result_2Heap Used_6Mask@3))) (= b_12@4  (and b_12@3 (state Result_2Heap Result_2Mask))))) (=> (and (and (and (and (= b_10@10  (and b_10@9 b_12@4)) (= b_10@11  (and b_10@10 b_11@6))) (and (= b_10@12  (and b_10@11 (= Used_6Heap@0 Ops_5Heap@2))) (= b_10@13  (and b_10@12 (not (= freshObj@0 null)))))) (and (and (= Ops_5Mask@7 (MapType1Store Ops_5Mask@6 freshObj@0 f_7 (real_2_U (+ (U_2_real (MapType1Select Ops_5Mask@6 freshObj@0 f_7)) FullPerm)))) (= b_10@14  (and b_10@13 (state Ops_5Heap@2 Ops_5Mask@7)))) (and (= b_10@15  (and b_10@14 (not (= freshObj@0 null)))) (= Ops_5Mask@8 (MapType1Store Ops_5Mask@7 freshObj@0 g (real_2_U (+ (U_2_real (MapType1Select Ops_5Mask@7 freshObj@0 g)) FullPerm))))))) (and (and (and (= b_10@16  (and b_10@15 (state Ops_5Heap@2 Ops_5Mask@8))) (= b_10@17  (and b_10@16 (state Ops_5Heap@2 Ops_5Mask@8)))) (and (= b_10@18  (and b_10@17 (state Ops_5Heap@2 Ops_5Mask@8))) (= b_10@19 b_10@18))) (and (and (= Heap@10 Heap@9) (= Mask@7 Mask@6)) (and (= Ops_5Mask@9 Ops_5Mask@8) (= (ControlFlow 0 65) 62))))) anon30_correct)))))))
(let ((anon85_Else_correct  (=> (>= 0.0 takeTransfer@1) (=> (and (= Mask@6 Mask@4) (= Heap@9 Heap@7)) (=> (and (and (= neededTransfer@3 neededTransfer@1) (= b_11@6 b_11@3)) (and (= Used_6Mask@3 Used_6Mask@1) (= (ControlFlow 0 69) 65))) anon29_correct)))))
(let ((anon85_Then_correct  (=> (> takeTransfer@1 0.0) (=> (and (= neededTransfer@2 (- neededTransfer@1 takeTransfer@1)) (= Used_6Mask@2 (MapType1Store Used_6Mask@1 null (Pair freshObj@0) (real_2_U (+ (U_2_real (MapType1Select Used_6Mask@1 null (Pair freshObj@0))) takeTransfer@1))))) (=> (and (and (= b_11@4  (and b_11@3 (state Used_6Heap@0 Used_6Mask@2))) (= TempMask@1 (MapType1Store ZeroMask null (Pair freshObj@0) (real_2_U FullPerm)))) (and (= b_11@5  (and b_11@4 (IdenticalOnKnownLocations Heap@7 Used_6Heap@0 TempMask@1))) (= Mask@5 (MapType1Store Mask@4 null (Pair freshObj@0) (real_2_U (- (U_2_real (MapType1Select Mask@4 null (Pair freshObj@0))) takeTransfer@1)))))) (=> (and (and (and (forall ((o_5 T@U) (f_10 T@U) ) (! (let ((B@@11 (FieldTypeInv1 (type f_10))))
(let ((A@@12 (FieldTypeInv0 (type f_10))))
 (=> (and (and (= (type o_5) RefType) (= (type f_10) (FieldType A@@12 B@@11))) (or (U_2_bool (MapType1Select (MapType0Select Heap@7 null (|wand_2#sm| freshObj@0 FullPerm freshObj@0 10 freshObj@0 FullPerm freshObj@0 FullPerm freshObj@0 freshObj@0 10)) o_5 f_10)) (U_2_bool (MapType1Select (MapType0Select Heap@7 null (|Pair#sm| freshObj@0)) o_5 f_10)))) (U_2_bool (MapType1Select newPMask@0 o_5 f_10)))))
 :qid |stdinbpl.1335:39|
 :skolemid |62|
 :pattern ( (MapType1Select newPMask@0 o_5 f_10))
)) (= Heap@8 (MapType0Store Heap@7 null (|wand_2#sm| freshObj@0 FullPerm freshObj@0 10 freshObj@0 FullPerm freshObj@0 FullPerm freshObj@0 freshObj@0 10) newPMask@0))) (and (= Mask@6 Mask@5) (= Heap@9 Heap@8))) (and (and (= neededTransfer@3 neededTransfer@2) (= b_11@6 b_11@5)) (and (= Used_6Mask@3 Used_6Mask@2) (= (ControlFlow 0 68) 65)))) anon29_correct))))))
(let ((anon84_Else_correct  (=> (and (< maskTransfer@1 neededTransfer@1) (= takeTransfer@1 maskTransfer@1)) (and (=> (= (ControlFlow 0 71) 68) anon85_Then_correct) (=> (= (ControlFlow 0 71) 69) anon85_Else_correct)))))
(let ((anon84_Then_correct  (=> (and (<= neededTransfer@1 maskTransfer@1) (= takeTransfer@1 neededTransfer@1)) (and (=> (= (ControlFlow 0 70) 68) anon85_Then_correct) (=> (= (ControlFlow 0 70) 69) anon85_Else_correct)))))
(let ((anon83_Then_correct  (=> (and (and (and (and b_10@9 b_11@3) true) (> neededTransfer@1 0.0)) (= maskTransfer@1 (U_2_real (MapType1Select Mask@4 null (Pair freshObj@0))))) (and (=> (= (ControlFlow 0 72) 70) anon84_Then_correct) (=> (= (ControlFlow 0 72) 71) anon84_Else_correct)))))
(let ((anon83_Else_correct  (=> (not (and (and (and b_10@9 b_11@3) true) (> neededTransfer@1 0.0))) (=> (and (= Mask@6 Mask@4) (= Heap@9 Heap@7)) (=> (and (and (= neededTransfer@3 neededTransfer@1) (= b_11@6 b_11@3)) (and (= Used_6Mask@3 Used_6Mask@1) (= (ControlFlow 0 67) 65))) anon29_correct)))))
(let ((anon82_Else_correct  (=> (>= 0.0 takeTransfer@0) (=> (and (and (= Ops_5Mask@6 Ops_5Mask@4) (= Used_6Mask@1 ZeroMask)) (and (= b_11@3 b_11@0) (= neededTransfer@1 FullPerm))) (and (=> (= (ControlFlow 0 75) 72) anon83_Then_correct) (=> (= (ControlFlow 0 75) 67) anon83_Else_correct))))))
(let ((anon82_Then_correct  (=> (> takeTransfer@0 0.0) (=> (and (= neededTransfer@0 (- FullPerm takeTransfer@0)) (= Used_6Mask@0 (MapType1Store ZeroMask null (Pair freshObj@0) (real_2_U (+ (U_2_real (MapType1Select ZeroMask null (Pair freshObj@0))) takeTransfer@0))))) (=> (and (and (and (= b_11@1  (and b_11@0 (state Used_6Heap@0 Used_6Mask@0))) (= TempMask@0 (MapType1Store ZeroMask null (Pair freshObj@0) (real_2_U FullPerm)))) (and (= b_11@2  (and b_11@1 (IdenticalOnKnownLocations Ops_5Heap@2 Used_6Heap@0 TempMask@0))) (= Ops_5Mask@5 (MapType1Store Ops_5Mask@4 null (Pair freshObj@0) (real_2_U (- (U_2_real (MapType1Select Ops_5Mask@4 null (Pair freshObj@0))) takeTransfer@0)))))) (and (and (= Ops_5Mask@6 Ops_5Mask@5) (= Used_6Mask@1 Used_6Mask@0)) (and (= b_11@3 b_11@2) (= neededTransfer@1 neededTransfer@0)))) (and (=> (= (ControlFlow 0 74) 72) anon83_Then_correct) (=> (= (ControlFlow 0 74) 67) anon83_Else_correct)))))))
(let ((anon81_Else_correct  (=> (and (< maskTransfer@0 FullPerm) (= takeTransfer@0 maskTransfer@0)) (and (=> (= (ControlFlow 0 77) 74) anon82_Then_correct) (=> (= (ControlFlow 0 77) 75) anon82_Else_correct)))))
(let ((anon81_Then_correct  (=> (and (<= FullPerm maskTransfer@0) (= takeTransfer@0 FullPerm)) (and (=> (= (ControlFlow 0 76) 74) anon82_Then_correct) (=> (= (ControlFlow 0 76) 75) anon82_Else_correct)))))
(let ((anon80_Then_correct  (=> (and (and (and (and b_10@9 b_11@0) true) (> FullPerm 0.0)) (= maskTransfer@0 (U_2_real (MapType1Select Ops_5Mask@4 null (Pair freshObj@0))))) (and (=> (= (ControlFlow 0 78) 76) anon81_Then_correct) (=> (= (ControlFlow 0 78) 77) anon81_Else_correct)))))
(let ((anon80_Else_correct  (=> (not (and (and (and b_10@9 b_11@0) true) (> FullPerm 0.0))) (=> (and (and (= Ops_5Mask@6 Ops_5Mask@4) (= Used_6Mask@1 ZeroMask)) (and (= b_11@3 b_11@0) (= neededTransfer@1 FullPerm))) (and (=> (= (ControlFlow 0 73) 72) anon83_Then_correct) (=> (= (ControlFlow 0 73) 67) anon83_Else_correct))))))
(let ((anon79_Then_correct  (=> b_10@9 (=> (and (and (|Pair#trigger| Ops_5Heap@2 (Pair freshObj@0)) (= (MapType0Select Ops_5Heap@2 null (Pair freshObj@0)) (CombineFrames (FrameFragment (MapType0Select Ops_5Heap@2 freshObj@0 f_7)) (FrameFragment (MapType0Select Ops_5Heap@2 freshObj@0 g))))) (and (= b_11@0  (and b_11 (state Used_6Heap@0 ZeroMask))) (= initNeededTransfer@0 (+ (U_2_real (MapType1Select ZeroMask null (Pair freshObj@0))) FullPerm)))) (and (=> (= (ControlFlow 0 79) (- 0 80)) (>= FullPerm 0.0)) (=> (>= FullPerm 0.0) (and (=> (= (ControlFlow 0 79) 78) anon80_Then_correct) (=> (= (ControlFlow 0 79) 73) anon80_Else_correct))))))))
(let ((anon79_Else_correct  (=> (and (not b_10@9) (= b_10@19 b_10@9)) (=> (and (and (= Heap@10 Heap@7) (= Mask@7 Mask@4)) (and (= Ops_5Mask@9 Ops_5Mask@4) (= (ControlFlow 0 64) 62))) anon30_correct))))
(let ((anon16_correct  (=> (and (= b_10@8  (and b_10@7 (state Ops_5Heap@2 Ops_5Mask@4))) (= b_10@9  (and b_10@8 (state Ops_5Heap@2 Ops_5Mask@4)))) (and (=> (= (ControlFlow 0 81) 79) anon79_Then_correct) (=> (= (ControlFlow 0 81) 64) anon79_Else_correct)))))
(let ((anon15_correct  (=> (= b_10@6  (and b_10@5 (= (sum Ops_5Heap@1 freshObj@0) 10))) (=> (and (and (= b_10@7 b_10@6) (= Ops_5Mask@4 Ops_5Mask@3)) (and (= Ops_5Heap@2 Ops_5Heap@1) (= (ControlFlow 0 84) 81))) anon16_correct))))
(let ((anon14_correct  (=> (and (= Ops_5Mask@2 (MapType1Store Ops_5Mask@1 null (Pair freshObj@0) (real_2_U (- (U_2_real (MapType1Select Ops_5Mask@1 null (Pair freshObj@0))) FullPerm)))) (= b_10@4  (and b_10@3 (IdenticalOnKnownLocations Ops_5Heap@0 ExhaleHeap@0 Ops_5Mask@2)))) (=> (and (and (= Ops_5Heap@1 ExhaleHeap@0) (= b_10@5 false)) (and (= Ops_5Mask@3 Ops_5Mask@2) (= (ControlFlow 0 87) 84))) anon15_correct))))
(let ((anon78_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 90) 87)) anon14_correct)))
(let ((anon78_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 88) (- 0 89)) (<= FullPerm (U_2_real (MapType1Select Ops_5Mask@1 null (Pair freshObj@0))))) (=> (<= FullPerm (U_2_real (MapType1Select Ops_5Mask@1 null (Pair freshObj@0)))) (=> (= (ControlFlow 0 88) 87) anon14_correct))))))
(let ((anon77_Else_correct  (=> (and (and (= Ops_5Heap@1 Ops_5Heap@0) (= b_10@5 b_10@3)) (and (= Ops_5Mask@3 Ops_5Mask@1) (= (ControlFlow 0 86) 84))) anon15_correct)))
(let ((anon76_Then_correct  (=> b_10@3 (and (and (=> (= (ControlFlow 0 91) 86) anon77_Else_correct) (=> (= (ControlFlow 0 91) 88) anon78_Then_correct)) (=> (= (ControlFlow 0 91) 90) anon78_Else_correct)))))
(let ((anon76_Else_correct  (=> (not b_10@3) (=> (and (and (= Ops_5Heap@1 Ops_5Heap@0) (= b_10@5 b_10@3)) (and (= Ops_5Mask@3 Ops_5Mask@1) (= (ControlFlow 0 85) 84))) anon15_correct))))
(let ((anon75_Then_correct  (=> (and b_10@2 (= b_10@3  (and b_10@2 (state Ops_5Heap@0 Ops_5Mask@1)))) (and (=> (= (ControlFlow 0 92) 91) anon76_Then_correct) (=> (= (ControlFlow 0 92) 85) anon76_Else_correct)))))
(let ((anon75_Else_correct  (=> (not b_10@2) (=> (and (and (= b_10@7 b_10@2) (= Ops_5Mask@4 Ops_5Mask@1)) (and (= Ops_5Heap@2 Ops_5Heap@0) (= (ControlFlow 0 83) 81))) anon16_correct))))
(let ((anon74_Else_correct  (=> (not b_10@0) (=> (and (= Ops_5Mask@1 ZeroMask) (= b_10@2 b_10@0)) (and (=> (= (ControlFlow 0 94) 92) anon75_Then_correct) (=> (= (ControlFlow 0 94) 83) anon75_Else_correct))))))
(let ((anon74_Then_correct  (=> b_10@0 (=> (and (and (= Ops_5Mask@0 (MapType1Store ZeroMask null (Pair freshObj@0) (real_2_U (+ (U_2_real (MapType1Select ZeroMask null (Pair freshObj@0))) FullPerm)))) (= b_10@1  (and b_10@0 (state Ops_5Heap@0 Ops_5Mask@0)))) (and (= Ops_5Mask@1 Ops_5Mask@0) (= b_10@2 b_10@1))) (and (=> (= (ControlFlow 0 93) 92) anon75_Then_correct) (=> (= (ControlFlow 0 93) 83) anon75_Else_correct))))))
(let ((anon73_Then_correct  (=> b_10@0 (and (=> (= (ControlFlow 0 95) 93) anon74_Then_correct) (=> (= (ControlFlow 0 95) 94) anon74_Else_correct)))))
(let ((anon73_Else_correct  (=> (not b_10@0) (=> (and (and (= b_10@7 b_10@0) (= Ops_5Mask@4 ZeroMask)) (and (= Ops_5Heap@2 Ops_5Heap@0) (= (ControlFlow 0 82) 81))) anon16_correct))))
(let ((anon6_correct  (=> (and (= Heap@6 (MapType0Store Heap@5 null (|Pair#sm| freshObj@0) (MapType1Store (MapType0Select Heap@5 null (|Pair#sm| freshObj@0)) freshObj@0 f_7 (bool_2_U true)))) (= Heap@7 (MapType0Store Heap@6 null (|Pair#sm| freshObj@0) (MapType1Store (MapType0Select Heap@6 null (|Pair#sm| freshObj@0)) freshObj@0 g (bool_2_U true))))) (=> (and (and (state Heap@7 Mask@4) (state Heap@7 Mask@4)) (and (= b_10@0  (and b_10 (state Ops_5Heap@0 ZeroMask))) (= b_9@0  (and b_9 (state Used_5Heap@0 ZeroMask))))) (and (=> (= (ControlFlow 0 96) 95) anon73_Then_correct) (=> (= (ControlFlow 0 96) 82) anon73_Else_correct))))))
(let ((anon72_Else_correct  (=> (HasDirectPerm Mask@4 null (Pair freshObj@0)) (=> (and (= Heap@5 Heap@2) (= (ControlFlow 0 98) 96)) anon6_correct))))
(let ((anon72_Then_correct  (=> (not (HasDirectPerm Mask@4 null (Pair freshObj@0))) (=> (and (and (= Heap@3 (MapType0Store Heap@2 null (|Pair#sm| freshObj@0) ZeroPMask)) (= Heap@4 (MapType0Store Heap@3 null (Pair freshObj@0) freshVersion@0))) (and (= Heap@5 Heap@4) (= (ControlFlow 0 97) 96))) anon6_correct))))
(let ((anon4_correct  (=> (and (= Mask@3 (MapType1Store Mask@2 freshObj@0 g (real_2_U (- (U_2_real (MapType1Select Mask@2 freshObj@0 g)) FullPerm)))) (= Mask@4 (MapType1Store Mask@3 null (Pair freshObj@0) (real_2_U (+ (U_2_real (MapType1Select Mask@3 null (Pair freshObj@0))) FullPerm))))) (=> (and (and (state Heap@2 Mask@4) (state Heap@2 Mask@4)) (and (|Pair#trigger| Heap@2 (Pair freshObj@0)) (= (MapType0Select Heap@2 null (Pair freshObj@0)) (CombineFrames (FrameFragment (MapType0Select Heap@2 freshObj@0 f_7)) (FrameFragment (MapType0Select Heap@2 freshObj@0 g)))))) (and (=> (= (ControlFlow 0 99) 97) anon72_Then_correct) (=> (= (ControlFlow 0 99) 98) anon72_Else_correct))))))
(let ((anon71_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 102) 99)) anon4_correct)))
(let ((anon71_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 100) (- 0 101)) (<= FullPerm (U_2_real (MapType1Select Mask@2 freshObj@0 g)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@2 freshObj@0 g))) (=> (= (ControlFlow 0 100) 99) anon4_correct))))))
(let ((anon2_correct  (=> (= Mask@2 (MapType1Store Mask@1 freshObj@0 f_7 (real_2_U (- (U_2_real (MapType1Select Mask@1 freshObj@0 f_7)) FullPerm)))) (and (=> (= (ControlFlow 0 103) 100) anon71_Then_correct) (=> (= (ControlFlow 0 103) 102) anon71_Else_correct)))))
(let ((anon70_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 106) 103)) anon2_correct)))
(let ((anon70_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 104) (- 0 105)) (<= FullPerm (U_2_real (MapType1Select Mask@1 freshObj@0 f_7)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@1 freshObj@0 f_7))) (=> (= (ControlFlow 0 104) 103) anon2_correct))))))
(let ((anon0_correct  (=> (state Heap@@14 ZeroMask) (=> (and (and (and (= AssumeFunctionsAbove (- 0 1)) (U_2_bool (MapType0Select Heap@@14 p_1@@3 $allocated))) (and (not (= freshObj@0 null)) (not (U_2_bool (MapType0Select Heap@@14 freshObj@0 $allocated))))) (and (and (= Heap@0 (MapType0Store Heap@@14 freshObj@0 $allocated (bool_2_U true))) (= Mask@0 (MapType1Store ZeroMask freshObj@0 f_7 (real_2_U (+ (U_2_real (MapType1Select ZeroMask freshObj@0 f_7)) FullPerm))))) (and (= Mask@1 (MapType1Store Mask@0 freshObj@0 g (real_2_U (+ (U_2_real (MapType1Select Mask@0 freshObj@0 g)) FullPerm)))) (state Heap@0 Mask@1)))) (and (=> (= (ControlFlow 0 107) (- 0 109)) (= FullPerm (U_2_real (MapType1Select Mask@1 freshObj@0 f_7)))) (=> (= FullPerm (U_2_real (MapType1Select Mask@1 freshObj@0 f_7))) (=> (and (= Heap@1 (MapType0Store Heap@0 freshObj@0 f_7 (int_2_U 3))) (state Heap@1 Mask@1)) (and (=> (= (ControlFlow 0 107) (- 0 108)) (= FullPerm (U_2_real (MapType1Select Mask@1 freshObj@0 g)))) (=> (= FullPerm (U_2_real (MapType1Select Mask@1 freshObj@0 g))) (=> (and (= Heap@2 (MapType0Store Heap@1 freshObj@0 g (int_2_U 7))) (state Heap@2 Mask@1)) (and (=> (= (ControlFlow 0 107) 104) anon70_Then_correct) (=> (= (ControlFlow 0 107) 106) anon70_Else_correct))))))))))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 110) 107) anon0_correct)))
PreconditionGeneratedEntry_correct)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
))
(check-sat)
(get-info :reason-unknown)
(assert (not (= (ControlFlow 0 2) (- 1))))
(check-sat)
(pop 1)
; Invalid
(get-info :rlimit)
