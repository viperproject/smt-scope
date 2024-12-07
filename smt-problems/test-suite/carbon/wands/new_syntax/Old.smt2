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
(declare-fun |wand_1#ft| (T@U Real T@U Int T@U Int) T@U)
(declare-fun |wand_1#sm| (T@U Real T@U Int T@U Int) T@U)
(declare-fun WandType_wand_1Type () T@T)
(declare-fun |wand_2#ft| (T@U Real T@U Real T@U T@U) T@U)
(declare-fun |wand_2#sm| (T@U Real T@U Real T@U T@U) T@U)
(declare-fun WandType_wand_2Type () T@T)
(declare-fun wand_3 (Bool T@U Real T@U Int) T@U)
(declare-fun getPredWandId (T@U) Int)
(declare-fun WandType_wand_3Type () T@T)
(declare-fun dummyHeap () T@U)
(declare-fun ZeroMask () T@U)
(declare-fun wand (T@U Real T@U Real T@U Int T@U Int T@U Real T@U T@U) T@U)
(declare-fun WandType_wandType () T@T)
(declare-fun InsidePredicate (T@U T@U T@U T@U) Bool)
(declare-fun |wand_3#ft| (Bool T@U Real T@U Int) T@U)
(declare-fun sumMask (T@U T@U T@U) Bool)
(declare-fun wand_1 (T@U Real T@U Int T@U Int) T@U)
(declare-fun wand_2 (T@U Real T@U Real T@U T@U) T@U)
(declare-fun |wand#ft| (T@U Real T@U Real T@U Int T@U Int T@U Real T@U T@U) T@U)
(declare-fun ConditionalFrame (Real T@U) T@U)
(declare-fun EmptyFrame () T@U)
(declare-fun NoPerm () Real)
(declare-fun |wand_3#sm| (Bool T@U Real T@U Int) T@U)
(declare-fun FullPerm () Real)
(declare-fun |wand#sm| (T@U Real T@U Real T@U Int T@U Int T@U Real T@U T@U) T@U)
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
))) (= (Ctor NormalFieldType) 7)) (= (type $allocated) (FieldType NormalFieldType boolType))) (= (type f_7) (FieldType NormalFieldType intType))))
(assert (distinct $allocated f_7)
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
(assert  (and (and (= (Ctor WandType_wand_1Type) 12) (forall ((arg0@@25 T@U) (arg1@@9 Real) (arg2@@3 T@U) (arg3@@1 Int) (arg4 T@U) (arg5 Int) ) (! (= (type (|wand_1#ft| arg0@@25 arg1@@9 arg2@@3 arg3@@1 arg4 arg5)) (FieldType WandType_wand_1Type FrameTypeType))
 :qid |funType:wand_1#ft|
 :pattern ( (|wand_1#ft| arg0@@25 arg1@@9 arg2@@3 arg3@@1 arg4 arg5))
))) (forall ((arg0@@26 T@U) (arg1@@10 Real) (arg2@@4 T@U) (arg3@@2 Int) (arg4@@0 T@U) (arg5@@0 Int) ) (! (= (type (|wand_1#sm| arg0@@26 arg1@@10 arg2@@4 arg3@@2 arg4@@0 arg5@@0)) (FieldType WandType_wand_1Type (MapType1Type RefType boolType)))
 :qid |funType:wand_1#sm|
 :pattern ( (|wand_1#sm| arg0@@26 arg1@@10 arg2@@4 arg3@@2 arg4@@0 arg5@@0))
))))
(assert (forall ((arg1@@11 T@U) (arg2@@5 Real) (arg3@@3 T@U) (arg4@@1 Int) (arg5@@1 T@U) (arg6 Int) ) (!  (=> (and (and (= (type arg1@@11) RefType) (= (type arg3@@3) RefType)) (= (type arg5@@1) RefType)) (= (|wand_1#sm| arg1@@11 arg2@@5 arg3@@3 arg4@@1 arg5@@1 arg6) (WandMaskField (|wand_1#ft| arg1@@11 arg2@@5 arg3@@3 arg4@@1 arg5@@1 arg6))))
 :qid |stdinbpl.231:15|
 :skolemid |33|
 :pattern ( (WandMaskField (|wand_1#ft| arg1@@11 arg2@@5 arg3@@3 arg4@@1 arg5@@1 arg6)))
)))
(assert  (and (and (= (Ctor WandType_wand_2Type) 13) (forall ((arg0@@27 T@U) (arg1@@12 Real) (arg2@@6 T@U) (arg3@@4 Real) (arg4@@2 T@U) (arg5@@2 T@U) ) (! (= (type (|wand_2#ft| arg0@@27 arg1@@12 arg2@@6 arg3@@4 arg4@@2 arg5@@2)) (FieldType WandType_wand_2Type FrameTypeType))
 :qid |funType:wand_2#ft|
 :pattern ( (|wand_2#ft| arg0@@27 arg1@@12 arg2@@6 arg3@@4 arg4@@2 arg5@@2))
))) (forall ((arg0@@28 T@U) (arg1@@13 Real) (arg2@@7 T@U) (arg3@@5 Real) (arg4@@3 T@U) (arg5@@3 T@U) ) (! (= (type (|wand_2#sm| arg0@@28 arg1@@13 arg2@@7 arg3@@5 arg4@@3 arg5@@3)) (FieldType WandType_wand_2Type (MapType1Type RefType boolType)))
 :qid |funType:wand_2#sm|
 :pattern ( (|wand_2#sm| arg0@@28 arg1@@13 arg2@@7 arg3@@5 arg4@@3 arg5@@3))
))))
(assert (forall ((arg1@@14 T@U) (arg2@@8 Real) (arg3@@6 T@U) (arg4@@4 Real) (arg5@@4 T@U) (arg6@@0 T@U) ) (!  (=> (and (and (and (= (type arg1@@14) RefType) (= (type arg3@@6) RefType)) (= (type arg5@@4) RefType)) (= (type arg6@@0) RefType)) (= (|wand_2#sm| arg1@@14 arg2@@8 arg3@@6 arg4@@4 arg5@@4 arg6@@0) (WandMaskField (|wand_2#ft| arg1@@14 arg2@@8 arg3@@6 arg4@@4 arg5@@4 arg6@@0))))
 :qid |stdinbpl.263:15|
 :skolemid |40|
 :pattern ( (WandMaskField (|wand_2#ft| arg1@@14 arg2@@8 arg3@@6 arg4@@4 arg5@@4 arg6@@0)))
)))
(assert (forall ((Heap@@2 T@U) (ExhaleHeap@@1 T@U) (Mask@@2 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@2) (MapType0Type RefType)) (= (type ExhaleHeap@@1) (MapType0Type RefType))) (= (type Mask@@2) (MapType1Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@2 ExhaleHeap@@1 Mask@@2)) (U_2_bool (MapType0Select Heap@@2 o_1 $allocated))) (U_2_bool (MapType0Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.73:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@2 ExhaleHeap@@1 Mask@@2) (MapType0Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert  (and (= (Ctor WandType_wand_3Type) 14) (forall ((arg0@@29 Bool) (arg1@@15 T@U) (arg2@@9 Real) (arg3@@7 T@U) (arg4@@5 Int) ) (! (= (type (wand_3 arg0@@29 arg1@@15 arg2@@9 arg3@@7 arg4@@5)) (FieldType WandType_wand_3Type intType))
 :qid |funType:wand_3|
 :pattern ( (wand_3 arg0@@29 arg1@@15 arg2@@9 arg3@@7 arg4@@5))
))))
(assert (forall ((arg1@@16 Bool) (arg2@@10 T@U) (arg3@@8 Real) (arg4@@6 T@U) (arg5@@5 Int) ) (!  (=> (and (= (type arg2@@10) RefType) (= (type arg4@@6) RefType)) (= (getPredWandId (wand_3 arg1@@16 arg2@@10 arg3@@8 arg4@@6 arg5@@5)) 3))
 :qid |stdinbpl.299:15|
 :skolemid |48|
 :pattern ( (wand_3 arg1@@16 arg2@@10 arg3@@8 arg4@@6 arg5@@5))
)))
(assert (forall ((Heap@@3 T@U) (ExhaleHeap@@2 T@U) (Mask@@3 T@U) (o_1@@0 T@U) (f_2 T@U) ) (! (let ((B@@1 (FieldTypeInv1 (type f_2))))
(let ((A@@1 (FieldTypeInv0 (type f_2))))
 (=> (and (and (and (and (and (and (= (type Heap@@3) (MapType0Type RefType)) (= (type ExhaleHeap@@2) (MapType0Type RefType))) (= (type Mask@@3) (MapType1Type RefType realType))) (= (type o_1@@0) RefType)) (= (type f_2) (FieldType A@@1 B@@1))) (IdenticalOnKnownLocations Heap@@3 ExhaleHeap@@2 Mask@@3)) (HasDirectPerm Mask@@3 o_1@@0 f_2)) (= (MapType0Select Heap@@3 o_1@@0 f_2) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2)))))
 :qid |stdinbpl.42:22|
 :skolemid |1|
 :pattern ( (IdenticalOnKnownLocations Heap@@3 ExhaleHeap@@2 Mask@@3) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2))
)))
(assert  (and (= (type dummyHeap) (MapType0Type RefType)) (= (type ZeroMask) (MapType1Type RefType realType))))
(assert (state dummyHeap ZeroMask))
(assert  (and (= (Ctor WandType_wandType) 15) (forall ((arg0@@30 T@U) (arg1@@17 Real) (arg2@@11 T@U) (arg3@@9 Real) (arg4@@7 T@U) (arg5@@6 Int) (arg6@@1 T@U) (arg7 Int) (arg8 T@U) (arg9 Real) (arg10 T@U) (arg11 T@U) ) (! (= (type (wand arg0@@30 arg1@@17 arg2@@11 arg3@@9 arg4@@7 arg5@@6 arg6@@1 arg7 arg8 arg9 arg10 arg11)) (FieldType WandType_wandType intType))
 :qid |funType:wand|
 :pattern ( (wand arg0@@30 arg1@@17 arg2@@11 arg3@@9 arg4@@7 arg5@@6 arg6@@1 arg7 arg8 arg9 arg10 arg11))
))))
(assert (forall ((arg1@@18 T@U) (arg2@@12 Real) (arg3@@10 T@U) (arg4@@8 Real) (arg5@@7 T@U) (arg6@@2 Int) (arg7@@0 T@U) (arg8@@0 Int) (arg9@@0 T@U) (arg10@@0 Real) (arg11@@0 T@U) (arg12 T@U) ) (!  (=> (and (and (and (and (and (and (= (type arg1@@18) RefType) (= (type arg3@@10) RefType)) (= (type arg5@@7) RefType)) (= (type arg7@@0) RefType)) (= (type arg9@@0) RefType)) (= (type arg11@@0) RefType)) (= (type arg12) RefType)) (= (getPredWandId (wand arg1@@18 arg2@@12 arg3@@10 arg4@@8 arg5@@7 arg6@@2 arg7@@0 arg8@@0 arg9@@0 arg10@@0 arg11@@0 arg12)) 0))
 :qid |stdinbpl.203:15|
 :skolemid |27|
 :pattern ( (wand arg1@@18 arg2@@12 arg3@@10 arg4@@8 arg5@@7 arg6@@2 arg7@@0 arg8@@0 arg9@@0 arg10@@0 arg11@@0 arg12))
)))
(assert (forall ((p T@U) (v_1 T@U) (w T@U) ) (! (let ((A@@2 (FieldTypeInv0 (type p))))
 (=> (and (and (= (type p) (FieldType A@@2 FrameTypeType)) (= (type v_1) FrameTypeType)) (= (type w) FrameTypeType)) (not (InsidePredicate p v_1 p w))))
 :qid |stdinbpl.170:19|
 :skolemid |21|
 :pattern ( (InsidePredicate p v_1 p w))
)))
(assert (forall ((arg1@@19 Bool) (arg2@@13 T@U) (arg3@@11 Real) (arg4@@9 T@U) (arg5@@8 Int) ) (!  (=> (and (= (type arg2@@13) RefType) (= (type arg4@@9) RefType)) (IsWandField (wand_3 arg1@@19 arg2@@13 arg3@@11 arg4@@9 arg5@@8)))
 :qid |stdinbpl.279:15|
 :skolemid |43|
 :pattern ( (wand_3 arg1@@19 arg2@@13 arg3@@11 arg4@@9 arg5@@8))
)))
(assert (forall ((arg0@@31 Bool) (arg1@@20 T@U) (arg2@@14 Real) (arg3@@12 T@U) (arg4@@10 Int) ) (! (= (type (|wand_3#ft| arg0@@31 arg1@@20 arg2@@14 arg3@@12 arg4@@10)) (FieldType WandType_wand_3Type FrameTypeType))
 :qid |funType:wand_3#ft|
 :pattern ( (|wand_3#ft| arg0@@31 arg1@@20 arg2@@14 arg3@@12 arg4@@10))
)))
(assert (forall ((arg1@@21 Bool) (arg2@@15 T@U) (arg3@@13 Real) (arg4@@11 T@U) (arg5@@9 Int) ) (!  (=> (and (= (type arg2@@15) RefType) (= (type arg4@@11) RefType)) (IsWandField (|wand_3#ft| arg1@@21 arg2@@15 arg3@@13 arg4@@11 arg5@@9)))
 :qid |stdinbpl.283:15|
 :skolemid |44|
 :pattern ( (|wand_3#ft| arg1@@21 arg2@@15 arg3@@13 arg4@@11 arg5@@9))
)))
(assert  (not (IsPredicateField f_7)))
(assert  (not (IsWandField f_7)))
(assert (forall ((Heap@@4 T@U) (ExhaleHeap@@3 T@U) (Mask@@4 T@U) ) (!  (=> (and (and (and (= (type Heap@@4) (MapType0Type RefType)) (= (type ExhaleHeap@@3) (MapType0Type RefType))) (= (type Mask@@4) (MapType1Type RefType realType))) (IdenticalOnKnownLocations Heap@@4 ExhaleHeap@@3 Mask@@4)) (succHeap Heap@@4 ExhaleHeap@@3))
 :qid |stdinbpl.83:15|
 :skolemid |10|
 :pattern ( (IdenticalOnKnownLocations Heap@@4 ExhaleHeap@@3 Mask@@4))
)))
(assert (forall ((arg1@@22 Bool) (arg2@@16 T@U) (arg3@@14 Real) (arg4@@12 T@U) (arg5@@10 Int) ) (!  (=> (and (= (type arg2@@16) RefType) (= (type arg4@@12) RefType)) (not (IsPredicateField (wand_3 arg1@@22 arg2@@16 arg3@@14 arg4@@12 arg5@@10))))
 :qid |stdinbpl.287:15|
 :skolemid |45|
 :pattern ( (wand_3 arg1@@22 arg2@@16 arg3@@14 arg4@@12 arg5@@10))
)))
(assert (forall ((arg1@@23 Bool) (arg2@@17 T@U) (arg3@@15 Real) (arg4@@13 T@U) (arg5@@11 Int) ) (!  (=> (and (= (type arg2@@17) RefType) (= (type arg4@@13) RefType)) (not (IsPredicateField (|wand_3#ft| arg1@@23 arg2@@17 arg3@@15 arg4@@13 arg5@@11))))
 :qid |stdinbpl.291:15|
 :skolemid |46|
 :pattern ( (|wand_3#ft| arg1@@23 arg2@@17 arg3@@15 arg4@@13 arg5@@11))
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
(assert (forall ((arg0@@32 T@U) (arg1@@24 Real) (arg2@@18 T@U) (arg3@@16 Int) (arg4@@14 T@U) (arg5@@12 Int) ) (! (= (type (wand_1 arg0@@32 arg1@@24 arg2@@18 arg3@@16 arg4@@14 arg5@@12)) (FieldType WandType_wand_1Type intType))
 :qid |funType:wand_1|
 :pattern ( (wand_1 arg0@@32 arg1@@24 arg2@@18 arg3@@16 arg4@@14 arg5@@12))
)))
(assert (forall ((arg1@@25 T@U) (arg2@@19 Real) (arg3@@17 T@U) (arg4@@15 Int) (arg5@@13 T@U) (arg6@@3 Int) (arg1_2 T@U) (arg2_2 Real) (arg3_2 T@U) (arg4_2 Int) (arg5_2 T@U) (arg6_2 Int) ) (!  (=> (and (and (and (and (and (and (= (type arg1@@25) RefType) (= (type arg3@@17) RefType)) (= (type arg5@@13) RefType)) (= (type arg1_2) RefType)) (= (type arg3_2) RefType)) (= (type arg5_2) RefType)) (= (wand_1 arg1@@25 arg2@@19 arg3@@17 arg4@@15 arg5@@13 arg6@@3) (wand_1 arg1_2 arg2_2 arg3_2 arg4_2 arg5_2 arg6_2))) (and (= arg1@@25 arg1_2) (and (= arg2@@19 arg2_2) (and (= arg3@@17 arg3_2) (and (= arg4@@15 arg4_2) (and (= arg5@@13 arg5_2) (= arg6@@3 arg6_2)))))))
 :qid |stdinbpl.239:15|
 :skolemid |35|
 :pattern ( (wand_1 arg1@@25 arg2@@19 arg3@@17 arg4@@15 arg5@@13 arg6@@3) (wand_1 arg1_2 arg2_2 arg3_2 arg4_2 arg5_2 arg6_2))
)))
(assert (forall ((arg0@@33 T@U) (arg1@@26 Real) (arg2@@20 T@U) (arg3@@18 Real) (arg4@@16 T@U) (arg5@@14 T@U) ) (! (= (type (wand_2 arg0@@33 arg1@@26 arg2@@20 arg3@@18 arg4@@16 arg5@@14)) (FieldType WandType_wand_2Type intType))
 :qid |funType:wand_2|
 :pattern ( (wand_2 arg0@@33 arg1@@26 arg2@@20 arg3@@18 arg4@@16 arg5@@14))
)))
(assert (forall ((arg1@@27 T@U) (arg2@@21 Real) (arg3@@19 T@U) (arg4@@17 Real) (arg5@@15 T@U) (arg6@@4 T@U) (arg1_2@@0 T@U) (arg2_2@@0 Real) (arg3_2@@0 T@U) (arg4_2@@0 Real) (arg5_2@@0 T@U) (arg6_2@@0 T@U) ) (!  (=> (and (and (and (and (and (and (and (and (= (type arg1@@27) RefType) (= (type arg3@@19) RefType)) (= (type arg5@@15) RefType)) (= (type arg6@@4) RefType)) (= (type arg1_2@@0) RefType)) (= (type arg3_2@@0) RefType)) (= (type arg5_2@@0) RefType)) (= (type arg6_2@@0) RefType)) (= (wand_2 arg1@@27 arg2@@21 arg3@@19 arg4@@17 arg5@@15 arg6@@4) (wand_2 arg1_2@@0 arg2_2@@0 arg3_2@@0 arg4_2@@0 arg5_2@@0 arg6_2@@0))) (and (= arg1@@27 arg1_2@@0) (and (= arg2@@21 arg2_2@@0) (and (= arg3@@19 arg3_2@@0) (and (= arg4@@17 arg4_2@@0) (and (= arg5@@15 arg5_2@@0) (= arg6@@4 arg6_2@@0)))))))
 :qid |stdinbpl.271:15|
 :skolemid |42|
 :pattern ( (wand_2 arg1@@27 arg2@@21 arg3@@19 arg4@@17 arg5@@15 arg6@@4) (wand_2 arg1_2@@0 arg2_2@@0 arg3_2@@0 arg4_2@@0 arg5_2@@0 arg6_2@@0))
)))
(assert (forall ((arg1@@28 T@U) (arg2@@22 Real) (arg3@@20 T@U) (arg4@@18 Real) (arg5@@16 T@U) (arg6@@5 Int) (arg7@@1 T@U) (arg8@@1 Int) (arg9@@1 T@U) (arg10@@1 Real) (arg11@@1 T@U) (arg12@@0 T@U) ) (!  (=> (and (and (and (and (and (and (= (type arg1@@28) RefType) (= (type arg3@@20) RefType)) (= (type arg5@@16) RefType)) (= (type arg7@@1) RefType)) (= (type arg9@@1) RefType)) (= (type arg11@@1) RefType)) (= (type arg12@@0) RefType)) (IsWandField (wand arg1@@28 arg2@@22 arg3@@20 arg4@@18 arg5@@16 arg6@@5 arg7@@1 arg8@@1 arg9@@1 arg10@@1 arg11@@1 arg12@@0)))
 :qid |stdinbpl.183:15|
 :skolemid |22|
 :pattern ( (wand arg1@@28 arg2@@22 arg3@@20 arg4@@18 arg5@@16 arg6@@5 arg7@@1 arg8@@1 arg9@@1 arg10@@1 arg11@@1 arg12@@0))
)))
(assert (forall ((arg0@@34 T@U) (arg1@@29 Real) (arg2@@23 T@U) (arg3@@21 Real) (arg4@@19 T@U) (arg5@@17 Int) (arg6@@6 T@U) (arg7@@2 Int) (arg8@@2 T@U) (arg9@@2 Real) (arg10@@2 T@U) (arg11@@2 T@U) ) (! (= (type (|wand#ft| arg0@@34 arg1@@29 arg2@@23 arg3@@21 arg4@@19 arg5@@17 arg6@@6 arg7@@2 arg8@@2 arg9@@2 arg10@@2 arg11@@2)) (FieldType WandType_wandType FrameTypeType))
 :qid |funType:wand#ft|
 :pattern ( (|wand#ft| arg0@@34 arg1@@29 arg2@@23 arg3@@21 arg4@@19 arg5@@17 arg6@@6 arg7@@2 arg8@@2 arg9@@2 arg10@@2 arg11@@2))
)))
(assert (forall ((arg1@@30 T@U) (arg2@@24 Real) (arg3@@22 T@U) (arg4@@20 Real) (arg5@@18 T@U) (arg6@@7 Int) (arg7@@3 T@U) (arg8@@3 Int) (arg9@@3 T@U) (arg10@@3 Real) (arg11@@3 T@U) (arg12@@1 T@U) ) (!  (=> (and (and (and (and (and (and (= (type arg1@@30) RefType) (= (type arg3@@22) RefType)) (= (type arg5@@18) RefType)) (= (type arg7@@3) RefType)) (= (type arg9@@3) RefType)) (= (type arg11@@3) RefType)) (= (type arg12@@1) RefType)) (IsWandField (|wand#ft| arg1@@30 arg2@@24 arg3@@22 arg4@@20 arg5@@18 arg6@@7 arg7@@3 arg8@@3 arg9@@3 arg10@@3 arg11@@3 arg12@@1)))
 :qid |stdinbpl.187:15|
 :skolemid |23|
 :pattern ( (|wand#ft| arg1@@30 arg2@@24 arg3@@22 arg4@@20 arg5@@18 arg6@@7 arg7@@3 arg8@@3 arg9@@3 arg10@@3 arg11@@3 arg12@@1))
)))
(assert  (and (forall ((arg0@@35 Real) (arg1@@31 T@U) ) (! (= (type (ConditionalFrame arg0@@35 arg1@@31)) FrameTypeType)
 :qid |funType:ConditionalFrame|
 :pattern ( (ConditionalFrame arg0@@35 arg1@@31))
)) (= (type EmptyFrame) FrameTypeType)))
(assert (forall ((p@@0 Real) (f_6 T@U) ) (!  (=> (= (type f_6) FrameTypeType) (= (ConditionalFrame p@@0 f_6) (ite (> p@@0 0.0) f_6 EmptyFrame)))
 :qid |stdinbpl.158:15|
 :skolemid |19|
 :pattern ( (ConditionalFrame p@@0 f_6))
)))
(assert (forall ((arg1@@32 T@U) (arg2@@25 Real) (arg3@@23 T@U) (arg4@@21 Real) (arg5@@19 T@U) (arg6@@8 Int) (arg7@@4 T@U) (arg8@@4 Int) (arg9@@4 T@U) (arg10@@4 Real) (arg11@@4 T@U) (arg12@@2 T@U) ) (!  (=> (and (and (and (and (and (and (= (type arg1@@32) RefType) (= (type arg3@@23) RefType)) (= (type arg5@@19) RefType)) (= (type arg7@@4) RefType)) (= (type arg9@@4) RefType)) (= (type arg11@@4) RefType)) (= (type arg12@@2) RefType)) (not (IsPredicateField (wand arg1@@32 arg2@@25 arg3@@23 arg4@@21 arg5@@19 arg6@@8 arg7@@4 arg8@@4 arg9@@4 arg10@@4 arg11@@4 arg12@@2))))
 :qid |stdinbpl.191:15|
 :skolemid |24|
 :pattern ( (wand arg1@@32 arg2@@25 arg3@@23 arg4@@21 arg5@@19 arg6@@8 arg7@@4 arg8@@4 arg9@@4 arg10@@4 arg11@@4 arg12@@2))
)))
(assert (forall ((arg1@@33 T@U) (arg2@@26 Real) (arg3@@24 T@U) (arg4@@22 Real) (arg5@@20 T@U) (arg6@@9 Int) (arg7@@5 T@U) (arg8@@5 Int) (arg9@@5 T@U) (arg10@@5 Real) (arg11@@5 T@U) (arg12@@3 T@U) ) (!  (=> (and (and (and (and (and (and (= (type arg1@@33) RefType) (= (type arg3@@24) RefType)) (= (type arg5@@20) RefType)) (= (type arg7@@5) RefType)) (= (type arg9@@5) RefType)) (= (type arg11@@5) RefType)) (= (type arg12@@3) RefType)) (not (IsPredicateField (|wand#ft| arg1@@33 arg2@@26 arg3@@24 arg4@@22 arg5@@20 arg6@@9 arg7@@5 arg8@@5 arg9@@5 arg10@@5 arg11@@5 arg12@@3))))
 :qid |stdinbpl.195:15|
 :skolemid |25|
 :pattern ( (|wand#ft| arg1@@33 arg2@@26 arg3@@24 arg4@@22 arg5@@20 arg6@@9 arg7@@5 arg8@@5 arg9@@5 arg10@@5 arg11@@5 arg12@@3))
)))
(assert (forall ((Mask@@5 T@U) (o_2@@0 T@U) (f_4@@0 T@U) ) (! (let ((B@@3 (FieldTypeInv1 (type f_4@@0))))
(let ((A@@4 (FieldTypeInv0 (type f_4@@0))))
 (=> (and (and (= (type Mask@@5) (MapType1Type RefType realType)) (= (type o_2@@0) RefType)) (= (type f_4@@0) (FieldType A@@4 B@@3))) (= (HasDirectPerm Mask@@5 o_2@@0 f_4@@0) (> (U_2_real (MapType1Select Mask@@5 o_2@@0 f_4@@0)) NoPerm)))))
 :qid |stdinbpl.133:22|
 :skolemid |17|
 :pattern ( (HasDirectPerm Mask@@5 o_2@@0 f_4@@0))
)))
(assert (forall ((arg1@@34 T@U) (arg2@@27 Real) (arg3@@25 T@U) (arg4@@23 Int) (arg5@@21 T@U) (arg6@@10 Int) ) (!  (=> (and (and (= (type arg1@@34) RefType) (= (type arg3@@25) RefType)) (= (type arg5@@21) RefType)) (= (getPredWandId (wand_1 arg1@@34 arg2@@27 arg3@@25 arg4@@23 arg5@@21 arg6@@10)) 1))
 :qid |stdinbpl.235:15|
 :skolemid |34|
 :pattern ( (wand_1 arg1@@34 arg2@@27 arg3@@25 arg4@@23 arg5@@21 arg6@@10))
)))
(assert (forall ((arg1@@35 T@U) (arg2@@28 Real) (arg3@@26 T@U) (arg4@@24 Real) (arg5@@22 T@U) (arg6@@11 T@U) ) (!  (=> (and (and (and (= (type arg1@@35) RefType) (= (type arg3@@26) RefType)) (= (type arg5@@22) RefType)) (= (type arg6@@11) RefType)) (= (getPredWandId (wand_2 arg1@@35 arg2@@28 arg3@@26 arg4@@24 arg5@@22 arg6@@11)) 2))
 :qid |stdinbpl.267:15|
 :skolemid |41|
 :pattern ( (wand_2 arg1@@35 arg2@@28 arg3@@26 arg4@@24 arg5@@22 arg6@@11))
)))
(assert (forall ((o_2@@1 T@U) (f_4@@1 T@U) ) (! (let ((B@@4 (FieldTypeInv1 (type f_4@@1))))
(let ((A@@5 (FieldTypeInv0 (type f_4@@1))))
 (=> (and (= (type o_2@@1) RefType) (= (type f_4@@1) (FieldType A@@5 B@@4))) (= (U_2_real (MapType1Select ZeroMask o_2@@1 f_4@@1)) NoPerm))))
 :qid |stdinbpl.106:22|
 :skolemid |13|
 :pattern ( (MapType1Select ZeroMask o_2@@1 f_4@@1))
)))
(assert (forall ((arg1@@36 Bool) (arg2@@29 T@U) (arg3@@27 Real) (arg4@@25 T@U) (arg5@@23 Int) (arg1_2@@1 Bool) (arg2_2@@1 T@U) (arg3_2@@1 Real) (arg4_2@@1 T@U) (arg5_2@@1 Int) ) (!  (=> (and (and (and (and (= (type arg2@@29) RefType) (= (type arg4@@25) RefType)) (= (type arg2_2@@1) RefType)) (= (type arg4_2@@1) RefType)) (= (wand_3 arg1@@36 arg2@@29 arg3@@27 arg4@@25 arg5@@23) (wand_3 arg1_2@@1 arg2_2@@1 arg3_2@@1 arg4_2@@1 arg5_2@@1))) (and (= arg1@@36 arg1_2@@1) (and (= arg2@@29 arg2_2@@1) (and (= arg3@@27 arg3_2@@1) (and (= arg4@@25 arg4_2@@1) (= arg5@@23 arg5_2@@1))))))
 :qid |stdinbpl.303:15|
 :skolemid |49|
 :pattern ( (wand_3 arg1@@36 arg2@@29 arg3@@27 arg4@@25 arg5@@23) (wand_3 arg1_2@@1 arg2_2@@1 arg3_2@@1 arg4_2@@1 arg5_2@@1))
)))
(assert (forall ((arg1@@37 T@U) (arg2@@30 Real) (arg3@@28 T@U) (arg4@@26 Int) (arg5@@24 T@U) (arg6@@12 Int) ) (!  (=> (and (and (= (type arg1@@37) RefType) (= (type arg3@@28) RefType)) (= (type arg5@@24) RefType)) (IsWandField (wand_1 arg1@@37 arg2@@30 arg3@@28 arg4@@26 arg5@@24 arg6@@12)))
 :qid |stdinbpl.215:15|
 :skolemid |29|
 :pattern ( (wand_1 arg1@@37 arg2@@30 arg3@@28 arg4@@26 arg5@@24 arg6@@12))
)))
(assert (forall ((arg1@@38 T@U) (arg2@@31 Real) (arg3@@29 T@U) (arg4@@27 Int) (arg5@@25 T@U) (arg6@@13 Int) ) (!  (=> (and (and (= (type arg1@@38) RefType) (= (type arg3@@29) RefType)) (= (type arg5@@25) RefType)) (IsWandField (|wand_1#ft| arg1@@38 arg2@@31 arg3@@29 arg4@@27 arg5@@25 arg6@@13)))
 :qid |stdinbpl.219:15|
 :skolemid |30|
 :pattern ( (|wand_1#ft| arg1@@38 arg2@@31 arg3@@29 arg4@@27 arg5@@25 arg6@@13))
)))
(assert (forall ((arg1@@39 T@U) (arg2@@32 Real) (arg3@@30 T@U) (arg4@@28 Real) (arg5@@26 T@U) (arg6@@14 T@U) ) (!  (=> (and (and (and (= (type arg1@@39) RefType) (= (type arg3@@30) RefType)) (= (type arg5@@26) RefType)) (= (type arg6@@14) RefType)) (IsWandField (wand_2 arg1@@39 arg2@@32 arg3@@30 arg4@@28 arg5@@26 arg6@@14)))
 :qid |stdinbpl.247:15|
 :skolemid |36|
 :pattern ( (wand_2 arg1@@39 arg2@@32 arg3@@30 arg4@@28 arg5@@26 arg6@@14))
)))
(assert (forall ((arg1@@40 T@U) (arg2@@33 Real) (arg3@@31 T@U) (arg4@@29 Real) (arg5@@27 T@U) (arg6@@15 T@U) ) (!  (=> (and (and (and (= (type arg1@@40) RefType) (= (type arg3@@31) RefType)) (= (type arg5@@27) RefType)) (= (type arg6@@15) RefType)) (IsWandField (|wand_2#ft| arg1@@40 arg2@@33 arg3@@31 arg4@@29 arg5@@27 arg6@@15)))
 :qid |stdinbpl.251:15|
 :skolemid |37|
 :pattern ( (|wand_2#ft| arg1@@40 arg2@@33 arg3@@31 arg4@@29 arg5@@27 arg6@@15))
)))
(assert (forall ((arg1@@41 T@U) (arg2@@34 Real) (arg3@@32 T@U) (arg4@@30 Int) (arg5@@28 T@U) (arg6@@16 Int) ) (!  (=> (and (and (= (type arg1@@41) RefType) (= (type arg3@@32) RefType)) (= (type arg5@@28) RefType)) (not (IsPredicateField (wand_1 arg1@@41 arg2@@34 arg3@@32 arg4@@30 arg5@@28 arg6@@16))))
 :qid |stdinbpl.223:15|
 :skolemid |31|
 :pattern ( (wand_1 arg1@@41 arg2@@34 arg3@@32 arg4@@30 arg5@@28 arg6@@16))
)))
(assert (forall ((arg1@@42 T@U) (arg2@@35 Real) (arg3@@33 T@U) (arg4@@31 Int) (arg5@@29 T@U) (arg6@@17 Int) ) (!  (=> (and (and (= (type arg1@@42) RefType) (= (type arg3@@33) RefType)) (= (type arg5@@29) RefType)) (not (IsPredicateField (|wand_1#ft| arg1@@42 arg2@@35 arg3@@33 arg4@@31 arg5@@29 arg6@@17))))
 :qid |stdinbpl.227:15|
 :skolemid |32|
 :pattern ( (|wand_1#ft| arg1@@42 arg2@@35 arg3@@33 arg4@@31 arg5@@29 arg6@@17))
)))
(assert (forall ((arg1@@43 T@U) (arg2@@36 Real) (arg3@@34 T@U) (arg4@@32 Real) (arg5@@30 T@U) (arg6@@18 T@U) ) (!  (=> (and (and (and (= (type arg1@@43) RefType) (= (type arg3@@34) RefType)) (= (type arg5@@30) RefType)) (= (type arg6@@18) RefType)) (not (IsPredicateField (wand_2 arg1@@43 arg2@@36 arg3@@34 arg4@@32 arg5@@30 arg6@@18))))
 :qid |stdinbpl.255:15|
 :skolemid |38|
 :pattern ( (wand_2 arg1@@43 arg2@@36 arg3@@34 arg4@@32 arg5@@30 arg6@@18))
)))
(assert (forall ((arg1@@44 T@U) (arg2@@37 Real) (arg3@@35 T@U) (arg4@@33 Real) (arg5@@31 T@U) (arg6@@19 T@U) ) (!  (=> (and (and (and (= (type arg1@@44) RefType) (= (type arg3@@35) RefType)) (= (type arg5@@31) RefType)) (= (type arg6@@19) RefType)) (not (IsPredicateField (|wand_2#ft| arg1@@44 arg2@@37 arg3@@35 arg4@@33 arg5@@31 arg6@@19))))
 :qid |stdinbpl.259:15|
 :skolemid |39|
 :pattern ( (|wand_2#ft| arg1@@44 arg2@@37 arg3@@35 arg4@@33 arg5@@31 arg6@@19))
)))
(assert (forall ((arg0@@36 Bool) (arg1@@45 T@U) (arg2@@38 Real) (arg3@@36 T@U) (arg4@@34 Int) ) (! (= (type (|wand_3#sm| arg0@@36 arg1@@45 arg2@@38 arg3@@36 arg4@@34)) (FieldType WandType_wand_3Type (MapType1Type RefType boolType)))
 :qid |funType:wand_3#sm|
 :pattern ( (|wand_3#sm| arg0@@36 arg1@@45 arg2@@38 arg3@@36 arg4@@34))
)))
(assert (forall ((arg1@@46 Bool) (arg2@@39 T@U) (arg3@@37 Real) (arg4@@35 T@U) (arg5@@32 Int) ) (!  (=> (and (= (type arg2@@39) RefType) (= (type arg4@@35) RefType)) (= (|wand_3#sm| arg1@@46 arg2@@39 arg3@@37 arg4@@35 arg5@@32) (WandMaskField (|wand_3#ft| arg1@@46 arg2@@39 arg3@@37 arg4@@35 arg5@@32))))
 :qid |stdinbpl.295:15|
 :skolemid |47|
 :pattern ( (WandMaskField (|wand_3#ft| arg1@@46 arg2@@39 arg3@@37 arg4@@35 arg5@@32)))
)))
(assert (forall ((Heap@@5 T@U) (ExhaleHeap@@4 T@U) (Mask@@6 T@U) (pm_f@@1 T@U) ) (! (let ((C@@1 (FieldTypeInv0 (type pm_f@@1))))
 (=> (and (and (and (and (and (= (type Heap@@5) (MapType0Type RefType)) (= (type ExhaleHeap@@4) (MapType0Type RefType))) (= (type Mask@@6) (MapType1Type RefType realType))) (= (type pm_f@@1) (FieldType C@@1 FrameTypeType))) (IdenticalOnKnownLocations Heap@@5 ExhaleHeap@@4 Mask@@6)) (and (HasDirectPerm Mask@@6 null pm_f@@1) (IsPredicateField pm_f@@1))) (forall ((o2 T@U) (f_2@@0 T@U) ) (! (let ((B@@5 (FieldTypeInv1 (type f_2@@0))))
(let ((A@@6 (FieldTypeInv0 (type f_2@@0))))
 (=> (and (and (= (type o2) RefType) (= (type f_2@@0) (FieldType A@@6 B@@5))) (U_2_bool (MapType1Select (MapType0Select Heap@@5 null (PredicateMaskField pm_f@@1)) o2 f_2@@0))) (= (MapType0Select Heap@@5 o2 f_2@@0) (MapType0Select ExhaleHeap@@4 o2 f_2@@0)))))
 :qid |stdinbpl.54:134|
 :skolemid |3|
 :pattern ( (MapType0Select ExhaleHeap@@4 o2 f_2@@0))
))))
 :qid |stdinbpl.52:19|
 :skolemid |4|
 :pattern ( (IdenticalOnKnownLocations Heap@@5 ExhaleHeap@@4 Mask@@6) (IsPredicateField pm_f@@1))
)))
(assert (forall ((Heap@@6 T@U) (ExhaleHeap@@5 T@U) (Mask@@7 T@U) (pm_f@@2 T@U) ) (! (let ((C@@2 (FieldTypeInv0 (type pm_f@@2))))
 (=> (and (and (and (and (and (= (type Heap@@6) (MapType0Type RefType)) (= (type ExhaleHeap@@5) (MapType0Type RefType))) (= (type Mask@@7) (MapType1Type RefType realType))) (= (type pm_f@@2) (FieldType C@@2 FrameTypeType))) (IdenticalOnKnownLocations Heap@@6 ExhaleHeap@@5 Mask@@7)) (and (HasDirectPerm Mask@@7 null pm_f@@2) (IsWandField pm_f@@2))) (forall ((o2@@0 T@U) (f_2@@1 T@U) ) (! (let ((B@@6 (FieldTypeInv1 (type f_2@@1))))
(let ((A@@7 (FieldTypeInv0 (type f_2@@1))))
 (=> (and (and (= (type o2@@0) RefType) (= (type f_2@@1) (FieldType A@@7 B@@6))) (U_2_bool (MapType1Select (MapType0Select Heap@@6 null (WandMaskField pm_f@@2)) o2@@0 f_2@@1))) (= (MapType0Select Heap@@6 o2@@0 f_2@@1) (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1)))))
 :qid |stdinbpl.67:129|
 :skolemid |6|
 :pattern ( (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1))
))))
 :qid |stdinbpl.65:19|
 :skolemid |7|
 :pattern ( (IdenticalOnKnownLocations Heap@@6 ExhaleHeap@@5 Mask@@7) (IsWandField pm_f@@2))
)))
(assert (forall ((Mask@@8 T@U) (o_2@@2 T@U) (f_4@@2 T@U) ) (! (let ((B@@7 (FieldTypeInv1 (type f_4@@2))))
(let ((A@@8 (FieldTypeInv0 (type f_4@@2))))
 (=> (and (and (and (= (type Mask@@8) (MapType1Type RefType realType)) (= (type o_2@@2) RefType)) (= (type f_4@@2) (FieldType A@@8 B@@7))) (GoodMask Mask@@8)) (and (>= (U_2_real (MapType1Select Mask@@8 o_2@@2 f_4@@2)) NoPerm) (=> (and (and (GoodMask Mask@@8) (not (IsPredicateField f_4@@2))) (not (IsWandField f_4@@2))) (<= (U_2_real (MapType1Select Mask@@8 o_2@@2 f_4@@2)) FullPerm))))))
 :qid |stdinbpl.128:22|
 :skolemid |16|
 :pattern ( (GoodMask Mask@@8) (MapType1Select Mask@@8 o_2@@2 f_4@@2))
)))
(assert (forall ((o T@U) (f T@U) (Heap@@7 T@U) ) (!  (=> (and (and (and (= (type o) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap@@7) (MapType0Type RefType))) (U_2_bool (MapType0Select Heap@@7 o $allocated))) (U_2_bool (MapType0Select Heap@@7 (MapType0Select Heap@@7 o f) $allocated)))
 :qid |stdinbpl.31:15|
 :skolemid |0|
 :pattern ( (MapType0Select Heap@@7 o f))
)))
(assert (forall ((arg0@@37 T@U) (arg1@@47 Real) (arg2@@40 T@U) (arg3@@38 Real) (arg4@@36 T@U) (arg5@@33 Int) (arg6@@20 T@U) (arg7@@6 Int) (arg8@@6 T@U) (arg9@@6 Real) (arg10@@6 T@U) (arg11@@6 T@U) ) (! (= (type (|wand#sm| arg0@@37 arg1@@47 arg2@@40 arg3@@38 arg4@@36 arg5@@33 arg6@@20 arg7@@6 arg8@@6 arg9@@6 arg10@@6 arg11@@6)) (FieldType WandType_wandType (MapType1Type RefType boolType)))
 :qid |funType:wand#sm|
 :pattern ( (|wand#sm| arg0@@37 arg1@@47 arg2@@40 arg3@@38 arg4@@36 arg5@@33 arg6@@20 arg7@@6 arg8@@6 arg9@@6 arg10@@6 arg11@@6))
)))
(assert (forall ((arg1@@48 T@U) (arg2@@41 Real) (arg3@@39 T@U) (arg4@@37 Real) (arg5@@34 T@U) (arg6@@21 Int) (arg7@@7 T@U) (arg8@@7 Int) (arg9@@7 T@U) (arg10@@7 Real) (arg11@@7 T@U) (arg12@@4 T@U) ) (!  (=> (and (and (and (and (and (and (= (type arg1@@48) RefType) (= (type arg3@@39) RefType)) (= (type arg5@@34) RefType)) (= (type arg7@@7) RefType)) (= (type arg9@@7) RefType)) (= (type arg11@@7) RefType)) (= (type arg12@@4) RefType)) (= (|wand#sm| arg1@@48 arg2@@41 arg3@@39 arg4@@37 arg5@@34 arg6@@21 arg7@@7 arg8@@7 arg9@@7 arg10@@7 arg11@@7 arg12@@4) (WandMaskField (|wand#ft| arg1@@48 arg2@@41 arg3@@39 arg4@@37 arg5@@34 arg6@@21 arg7@@7 arg8@@7 arg9@@7 arg10@@7 arg11@@7 arg12@@4))))
 :qid |stdinbpl.199:15|
 :skolemid |26|
 :pattern ( (WandMaskField (|wand#ft| arg1@@48 arg2@@41 arg3@@39 arg4@@37 arg5@@34 arg6@@21 arg7@@7 arg8@@7 arg9@@7 arg10@@7 arg11@@7 arg12@@4)))
)))
(assert (forall ((Heap@@8 T@U) (o@@0 T@U) (f_3 T@U) (v T@U) ) (! (let ((B@@8 (type v)))
(let ((A@@9 (FieldTypeInv0 (type f_3))))
 (=> (and (and (= (type Heap@@8) (MapType0Type RefType)) (= (type o@@0) RefType)) (= (type f_3) (FieldType A@@9 B@@8))) (succHeap Heap@@8 (MapType0Store Heap@@8 o@@0 f_3 v)))))
 :qid |stdinbpl.78:22|
 :skolemid |9|
 :pattern ( (MapType0Store Heap@@8 o@@0 f_3 v))
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
(assert (forall ((arg1@@49 T@U) (arg2@@42 Real) (arg3@@40 T@U) (arg4@@38 Real) (arg5@@35 T@U) (arg6@@22 Int) (arg7@@8 T@U) (arg8@@8 Int) (arg9@@8 T@U) (arg10@@8 Real) (arg11@@8 T@U) (arg12@@5 T@U) (arg1_2@@2 T@U) (arg2_2@@2 Real) (arg3_2@@2 T@U) (arg4_2@@2 Real) (arg5_2@@2 T@U) (arg6_2@@1 Int) (arg7_2 T@U) (arg8_2 Int) (arg9_2 T@U) (arg10_2 Real) (arg11_2 T@U) (arg12_2 T@U) ) (!  (=> (and (and (and (and (and (and (and (and (and (and (and (and (and (and (= (type arg1@@49) RefType) (= (type arg3@@40) RefType)) (= (type arg5@@35) RefType)) (= (type arg7@@8) RefType)) (= (type arg9@@8) RefType)) (= (type arg11@@8) RefType)) (= (type arg12@@5) RefType)) (= (type arg1_2@@2) RefType)) (= (type arg3_2@@2) RefType)) (= (type arg5_2@@2) RefType)) (= (type arg7_2) RefType)) (= (type arg9_2) RefType)) (= (type arg11_2) RefType)) (= (type arg12_2) RefType)) (= (wand arg1@@49 arg2@@42 arg3@@40 arg4@@38 arg5@@35 arg6@@22 arg7@@8 arg8@@8 arg9@@8 arg10@@8 arg11@@8 arg12@@5) (wand arg1_2@@2 arg2_2@@2 arg3_2@@2 arg4_2@@2 arg5_2@@2 arg6_2@@1 arg7_2 arg8_2 arg9_2 arg10_2 arg11_2 arg12_2))) (and (= arg1@@49 arg1_2@@2) (and (= arg2@@42 arg2_2@@2) (and (= arg3@@40 arg3_2@@2) (and (= arg4@@38 arg4_2@@2) (and (= arg5@@35 arg5_2@@2) (and (= arg6@@22 arg6_2@@1) (and (= arg7@@8 arg7_2) (and (= arg8@@8 arg8_2) (and (= arg9@@8 arg9_2) (and (= arg10@@8 arg10_2) (and (= arg11@@8 arg11_2) (= arg12@@5 arg12_2)))))))))))))
 :qid |stdinbpl.207:15|
 :skolemid |28|
 :pattern ( (wand arg1@@49 arg2@@42 arg3@@40 arg4@@38 arg5@@35 arg6@@22 arg7@@8 arg8@@8 arg9@@8 arg10@@8 arg11@@8 arg12@@5) (wand arg1_2@@2 arg2_2@@2 arg3_2@@2 arg4_2@@2 arg5_2@@2 arg6_2@@1 arg7_2 arg8_2 arg9_2 arg10_2 arg11_2 arg12_2))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun Mask@7 () T@U)
(declare-fun Mask@6 () T@U)
(declare-fun x@@8 () T@U)
(declare-fun ExhaleHeap@0 () T@U)
(declare-fun Mask@5 () T@U)
(declare-fun Mask@4 () T@U)
(declare-fun Heap@1 () T@U)
(declare-fun Labellhs18Heap () T@U)
(declare-fun b_33@6 () Bool)
(declare-fun b_34@6 () Bool)
(declare-fun Result_8Heap () T@U)
(declare-fun Ops_11Heap@0 () T@U)
(declare-fun Mask@3 () T@U)
(declare-fun Mask@2 () T@U)
(declare-fun Result_8Mask () T@U)
(declare-fun Ops_11Mask@1 () T@U)
(declare-fun b_33@5 () Bool)
(declare-fun neededTransfer@3 () Real)
(declare-fun Used_20Mask@3 () T@U)
(declare-fun initNeededTransfer@0 () Real)
(declare-fun b_35@0 () Bool)
(declare-fun b_35@1 () Bool)
(declare-fun b_35@2 () Bool)
(declare-fun Ops_11Mask@3 () T@U)
(declare-fun b_35@3 () Bool)
(declare-fun Used_20Heap@0 () T@U)
(declare-fun b_35@4 () Bool)
(declare-fun takeTransfer@1 () Real)
(declare-fun Mask@0 () T@U)
(declare-fun neededTransfer@1 () Real)
(declare-fun b_34@3 () Bool)
(declare-fun Used_20Mask@1 () T@U)
(declare-fun Heap@@9 () T@U)
(declare-fun neededTransfer@2 () Real)
(declare-fun Used_20Mask@2 () T@U)
(declare-fun b_34@4 () Bool)
(declare-fun b_34@5 () Bool)
(declare-fun Mask@1 () T@U)
(declare-fun Heap@0 () T@U)
(declare-fun maskTransfer@1 () Real)
(declare-fun takeTransfer@0 () Real)
(declare-fun b_34@0 () Bool)
(declare-fun neededTransfer@0 () Real)
(declare-fun Used_20Mask@0 () T@U)
(declare-fun b_34@1 () Bool)
(declare-fun b_34@2 () Bool)
(declare-fun Ops_11Mask@2 () T@U)
(declare-fun maskTransfer@0 () Real)
(declare-fun b_33@4 () Bool)
(declare-fun b_33@3 () Bool)
(declare-fun b_34 () Bool)
(declare-fun b_33@0 () Bool)
(declare-fun b_33@1 () Bool)
(declare-fun Ops_11Mask@0 () T@U)
(declare-fun b_33@2 () Bool)
(declare-fun b_33 () Bool)
(declare-fun b_32@0 () Bool)
(declare-fun b_32 () Bool)
(declare-fun Used_19Heap@0 () T@U)
(declare-fun PostHeap@0 () T@U)
(declare-fun PostMask@0 () T@U)
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (= (type PostHeap@0) (MapType0Type RefType)) (= (type x@@8) RefType)) (= (type PostMask@0) (MapType1Type RefType realType))) (= (type Mask@7) (MapType1Type RefType realType))) (= (type Mask@6) (MapType1Type RefType realType))) (= (type ExhaleHeap@0) (MapType0Type RefType))) (= (type Mask@5) (MapType1Type RefType realType))) (= (type Mask@4) (MapType1Type RefType realType))) (= (type Heap@1) (MapType0Type RefType))) (= (type Labellhs18Heap) (MapType0Type RefType))) (= (type Result_8Heap) (MapType0Type RefType))) (= (type Ops_11Heap@0) (MapType0Type RefType))) (= (type Mask@3) (MapType1Type RefType realType))) (= (type Mask@2) (MapType1Type RefType realType))) (= (type Result_8Mask) (MapType1Type RefType realType))) (= (type Ops_11Mask@1) (MapType1Type RefType realType))) (= (type Used_20Mask@3) (MapType1Type RefType realType))) (= (type Ops_11Mask@3) (MapType1Type RefType realType))) (= (type Used_20Heap@0) (MapType0Type RefType))) (= (type Mask@0) (MapType1Type RefType realType))) (= (type Used_20Mask@1) (MapType1Type RefType realType))) (= (type Heap@@9) (MapType0Type RefType))) (= (type Used_20Mask@2) (MapType1Type RefType realType))) (= (type Mask@1) (MapType1Type RefType realType))) (= (type Heap@0) (MapType0Type RefType))) (= (type Used_20Mask@0) (MapType1Type RefType realType))) (= (type Ops_11Mask@2) (MapType1Type RefType realType))) (= (type Ops_11Mask@0) (MapType1Type RefType realType))) (= (type Used_19Heap@0) (MapType0Type RefType))))
(set-info :boogie-vc-id test4)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 41) (let ((anon23_correct  (=> (and (= Mask@7 (MapType1Store Mask@6 x@@8 f_7 (real_2_U (- (U_2_real (MapType1Select Mask@6 x@@8 f_7)) FullPerm)))) (= (ControlFlow 0 4) (- 0 3))) (= (U_2_int (MapType0Select ExhaleHeap@0 x@@8 f_7)) 0))))
(let ((anon35_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 7) 4)) anon23_correct)))
(let ((anon35_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 5) (- 0 6)) (<= FullPerm (U_2_real (MapType1Select Mask@6 x@@8 f_7)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@6 x@@8 f_7))) (=> (= (ControlFlow 0 5) 4) anon23_correct))))))
(let ((anon21_correct  (=> (and (= Mask@5 (MapType1Store Mask@4 x@@8 f_7 (real_2_U (- (U_2_real (MapType1Select Mask@4 x@@8 f_7)) FullPerm)))) (state Heap@1 Mask@5)) (=> (and (and (and (not (= x@@8 null)) (= Mask@6 (MapType1Store Mask@5 x@@8 f_7 (real_2_U (+ (U_2_real (MapType1Select Mask@5 x@@8 f_7)) FullPerm))))) (and (state Heap@1 Mask@6) (= (U_2_int (MapType0Select Heap@1 x@@8 f_7)) (U_2_int (MapType0Select Labellhs18Heap x@@8 f_7))))) (and (and (state Heap@1 Mask@6) (IdenticalOnKnownLocations Heap@1 ExhaleHeap@0 Mask@6)) (and (state ExhaleHeap@0 Mask@6) (state ExhaleHeap@0 Mask@6)))) (and (=> (= (ControlFlow 0 8) 5) anon35_Then_correct) (=> (= (ControlFlow 0 8) 7) anon35_Else_correct))))))
(let ((anon34_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 11) 8)) anon21_correct)))
(let ((anon34_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 9) (- 0 10)) (<= FullPerm (U_2_real (MapType1Select Mask@4 x@@8 f_7)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@4 x@@8 f_7))) (=> (= (ControlFlow 0 9) 8) anon21_correct))))))
(let ((anon19_correct  (and (=> (= (ControlFlow 0 12) (- 0 14)) (=> (and (and b_33@6 b_33@6) b_34@6) (= (U_2_int (MapType0Select Result_8Heap x@@8 f_7)) (U_2_int (MapType0Select Ops_11Heap@0 x@@8 f_7))))) (=> (=> (and (and b_33@6 b_33@6) b_34@6) (= (U_2_int (MapType0Select Result_8Heap x@@8 f_7)) (U_2_int (MapType0Select Ops_11Heap@0 x@@8 f_7)))) (=> (and (and (= Mask@3 (MapType1Store Mask@2 null (wand_2 x@@8 FullPerm x@@8 FullPerm x@@8 x@@8) (real_2_U (+ (U_2_real (MapType1Select Mask@2 null (wand_2 x@@8 FullPerm x@@8 FullPerm x@@8 x@@8))) FullPerm)))) (state Heap@1 Mask@3)) (and (state Heap@1 Mask@3) (state Heap@1 Mask@3))) (and (=> (= (ControlFlow 0 12) (- 0 13)) (<= FullPerm (U_2_real (MapType1Select Mask@3 null (wand_2 x@@8 FullPerm x@@8 FullPerm x@@8 x@@8))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@3 null (wand_2 x@@8 FullPerm x@@8 FullPerm x@@8 x@@8)))) (=> (and (= Mask@4 (MapType1Store Mask@3 null (wand_2 x@@8 FullPerm x@@8 FullPerm x@@8 x@@8) (real_2_U (- (U_2_real (MapType1Select Mask@3 null (wand_2 x@@8 FullPerm x@@8 FullPerm x@@8 x@@8))) FullPerm)))) (state Heap@1 Mask@4)) (and (=> (= (ControlFlow 0 12) 9) anon34_Then_correct) (=> (= (ControlFlow 0 12) 11) anon34_Else_correct))))))))))
(let ((anon33_Else_correct  (=> (and (not b_33@6) (= (ControlFlow 0 19) 12)) anon19_correct)))
(let ((anon33_Then_correct  (=> b_33@6 (and (=> (= (ControlFlow 0 16) (- 0 18)) (HasDirectPerm Result_8Mask x@@8 f_7)) (=> (HasDirectPerm Result_8Mask x@@8 f_7) (and (=> (= (ControlFlow 0 16) (- 0 17)) (HasDirectPerm Ops_11Mask@1 x@@8 f_7)) (=> (HasDirectPerm Ops_11Mask@1 x@@8 f_7) (=> (= (ControlFlow 0 16) 12) anon19_correct))))))))
(let ((anon32_Then_correct  (=> (and (and b_33@6 b_33@6) b_34@6) (and (=> (= (ControlFlow 0 20) 16) anon33_Then_correct) (=> (= (ControlFlow 0 20) 19) anon33_Else_correct)))))
(let ((anon32_Else_correct  (=> (and (not (and (and b_33@6 b_33@6) b_34@6)) (= (ControlFlow 0 15) 12)) anon19_correct)))
(let ((anon16_correct  (and (=> (= (ControlFlow 0 21) (- 0 22)) (=> (and (and b_33@5 b_33@5) b_34@6) (and (= neededTransfer@3 0.0) (= (U_2_real (MapType1Select Used_20Mask@3 x@@8 f_7)) initNeededTransfer@0)))) (=> (=> (and (and b_33@5 b_33@5) b_34@6) (and (= neededTransfer@3 0.0) (= (U_2_real (MapType1Select Used_20Mask@3 x@@8 f_7)) initNeededTransfer@0))) (=> (and (= b_35@0  (and b_33@5 b_34@6)) (= b_35@1  (and b_35@0 (state Result_8Heap Result_8Mask)))) (=> (and (and (= b_35@2  (and b_35@1 (sumMask Result_8Mask Ops_11Mask@3 Used_20Mask@3))) (= b_35@3  (and (and b_35@2 (IdenticalOnKnownLocations Ops_11Heap@0 Result_8Heap Ops_11Mask@3)) (IdenticalOnKnownLocations Used_20Heap@0 Result_8Heap Used_20Mask@3)))) (and (= b_35@4  (and b_35@3 (state Result_8Heap Result_8Mask))) (= b_33@6  (and b_33@5 b_35@4)))) (and (=> (= (ControlFlow 0 21) 20) anon32_Then_correct) (=> (= (ControlFlow 0 21) 15) anon32_Else_correct))))))))
(let ((anon31_Else_correct  (=> (>= 0.0 takeTransfer@1) (=> (and (= Mask@2 Mask@0) (= neededTransfer@3 neededTransfer@1)) (=> (and (and (= b_34@6 b_34@3) (= Used_20Mask@3 Used_20Mask@1)) (and (= Heap@1 Heap@@9) (= (ControlFlow 0 25) 21))) anon16_correct)))))
(let ((anon31_Then_correct  (=> (> takeTransfer@1 0.0) (=> (and (and (= neededTransfer@2 (- neededTransfer@1 takeTransfer@1)) (= Used_20Mask@2 (MapType1Store Used_20Mask@1 x@@8 f_7 (real_2_U (+ (U_2_real (MapType1Select Used_20Mask@1 x@@8 f_7)) takeTransfer@1))))) (and (= b_34@4  (and b_34@3 (state Used_20Heap@0 Used_20Mask@2))) (= b_34@5  (and b_34@4 (= (U_2_int (MapType0Select Heap@@9 x@@8 f_7)) (U_2_int (MapType0Select Used_20Heap@0 x@@8 f_7))))))) (=> (and (and (and (= Mask@1 (MapType1Store Mask@0 x@@8 f_7 (real_2_U (- (U_2_real (MapType1Select Mask@0 x@@8 f_7)) takeTransfer@1)))) (= Heap@0 (MapType0Store Heap@@9 null (|wand_2#sm| x@@8 FullPerm x@@8 FullPerm x@@8 x@@8) (MapType1Store (MapType0Select Heap@@9 null (|wand_2#sm| x@@8 FullPerm x@@8 FullPerm x@@8 x@@8)) x@@8 f_7 (bool_2_U true))))) (and (= Mask@2 Mask@1) (= neededTransfer@3 neededTransfer@2))) (and (and (= b_34@6 b_34@5) (= Used_20Mask@3 Used_20Mask@2)) (and (= Heap@1 Heap@0) (= (ControlFlow 0 24) 21)))) anon16_correct)))))
(let ((anon30_Else_correct  (=> (and (< maskTransfer@1 neededTransfer@1) (= takeTransfer@1 maskTransfer@1)) (and (=> (= (ControlFlow 0 27) 24) anon31_Then_correct) (=> (= (ControlFlow 0 27) 25) anon31_Else_correct)))))
(let ((anon30_Then_correct  (=> (and (<= neededTransfer@1 maskTransfer@1) (= takeTransfer@1 neededTransfer@1)) (and (=> (= (ControlFlow 0 26) 24) anon31_Then_correct) (=> (= (ControlFlow 0 26) 25) anon31_Else_correct)))))
(let ((anon29_Then_correct  (=> (and (and (and (and (and b_33@5 b_33@5) b_34@3) true) (> neededTransfer@1 0.0)) (= maskTransfer@1 (U_2_real (MapType1Select Mask@0 x@@8 f_7)))) (and (=> (= (ControlFlow 0 28) 26) anon30_Then_correct) (=> (= (ControlFlow 0 28) 27) anon30_Else_correct)))))
(let ((anon29_Else_correct  (=> (not (and (and (and (and b_33@5 b_33@5) b_34@3) true) (> neededTransfer@1 0.0))) (=> (and (= Mask@2 Mask@0) (= neededTransfer@3 neededTransfer@1)) (=> (and (and (= b_34@6 b_34@3) (= Used_20Mask@3 Used_20Mask@1)) (and (= Heap@1 Heap@@9) (= (ControlFlow 0 23) 21))) anon16_correct)))))
(let ((anon28_Else_correct  (=> (>= 0.0 takeTransfer@0) (=> (and (and (= Ops_11Mask@3 Ops_11Mask@1) (= Used_20Mask@1 ZeroMask)) (and (= b_34@3 b_34@0) (= neededTransfer@1 FullPerm))) (and (=> (= (ControlFlow 0 31) 28) anon29_Then_correct) (=> (= (ControlFlow 0 31) 23) anon29_Else_correct))))))
(let ((anon28_Then_correct  (=> (and (> takeTransfer@0 0.0) (= neededTransfer@0 (- FullPerm takeTransfer@0))) (=> (and (and (and (= Used_20Mask@0 (MapType1Store ZeroMask x@@8 f_7 (real_2_U (+ (U_2_real (MapType1Select ZeroMask x@@8 f_7)) takeTransfer@0)))) (= b_34@1  (and b_34@0 (state Used_20Heap@0 Used_20Mask@0)))) (and (= b_34@2  (and b_34@1 (= (U_2_int (MapType0Select Ops_11Heap@0 x@@8 f_7)) (U_2_int (MapType0Select Used_20Heap@0 x@@8 f_7))))) (= Ops_11Mask@2 (MapType1Store Ops_11Mask@1 x@@8 f_7 (real_2_U (- (U_2_real (MapType1Select Ops_11Mask@1 x@@8 f_7)) takeTransfer@0)))))) (and (and (= Ops_11Mask@3 Ops_11Mask@2) (= Used_20Mask@1 Used_20Mask@0)) (and (= b_34@3 b_34@2) (= neededTransfer@1 neededTransfer@0)))) (and (=> (= (ControlFlow 0 30) 28) anon29_Then_correct) (=> (= (ControlFlow 0 30) 23) anon29_Else_correct))))))
(let ((anon27_Else_correct  (=> (and (< maskTransfer@0 FullPerm) (= takeTransfer@0 maskTransfer@0)) (and (=> (= (ControlFlow 0 33) 30) anon28_Then_correct) (=> (= (ControlFlow 0 33) 31) anon28_Else_correct)))))
(let ((anon27_Then_correct  (=> (and (<= FullPerm maskTransfer@0) (= takeTransfer@0 FullPerm)) (and (=> (= (ControlFlow 0 32) 30) anon28_Then_correct) (=> (= (ControlFlow 0 32) 31) anon28_Else_correct)))))
(let ((anon26_Then_correct  (=> (and (and (and (and (and b_33@5 b_33@5) b_34@0) true) (> FullPerm 0.0)) (= maskTransfer@0 (U_2_real (MapType1Select Ops_11Mask@1 x@@8 f_7)))) (and (=> (= (ControlFlow 0 34) 32) anon27_Then_correct) (=> (= (ControlFlow 0 34) 33) anon27_Else_correct)))))
(let ((anon26_Else_correct  (=> (not (and (and (and (and b_33@5 b_33@5) b_34@0) true) (> FullPerm 0.0))) (=> (and (and (= Ops_11Mask@3 Ops_11Mask@1) (= Used_20Mask@1 ZeroMask)) (and (= b_34@3 b_34@0) (= neededTransfer@1 FullPerm))) (and (=> (= (ControlFlow 0 29) 28) anon29_Then_correct) (=> (= (ControlFlow 0 29) 23) anon29_Else_correct))))))
(let ((anon4_correct  (=> (and (and (= b_33@4  (and b_33@3 (state Ops_11Heap@0 Ops_11Mask@1))) (= b_33@5  (and b_33@4 (state Ops_11Heap@0 Ops_11Mask@1)))) (and (= b_34@0  (and b_34 (state Used_20Heap@0 ZeroMask))) (= initNeededTransfer@0 (+ (U_2_real (MapType1Select ZeroMask x@@8 f_7)) FullPerm)))) (and (=> (= (ControlFlow 0 35) (- 0 36)) (>= FullPerm 0.0)) (=> (>= FullPerm 0.0) (and (=> (= (ControlFlow 0 35) 34) anon26_Then_correct) (=> (= (ControlFlow 0 35) 29) anon26_Else_correct)))))))
(let ((anon25_Else_correct  (=> (and (and (not b_33@0) (= Ops_11Mask@1 ZeroMask)) (and (= b_33@3 b_33@0) (= (ControlFlow 0 38) 35))) anon4_correct)))
(let ((anon25_Then_correct  (=> b_33@0 (=> (and (= b_33@1  (and b_33@0 (not (= x@@8 null)))) (= Ops_11Mask@0 (MapType1Store ZeroMask x@@8 f_7 (real_2_U (+ (U_2_real (MapType1Select ZeroMask x@@8 f_7)) FullPerm))))) (=> (and (and (= b_33@2  (and b_33@1 (state Ops_11Heap@0 Ops_11Mask@0))) (= Ops_11Mask@1 Ops_11Mask@0)) (and (= b_33@3 b_33@2) (= (ControlFlow 0 37) 35))) anon4_correct)))))
(let ((anon24_Else_correct  (=> (and (= b_33@0  (and b_33 (state Ops_11Heap@0 ZeroMask))) (= b_32@0  (and b_32 (state Used_19Heap@0 ZeroMask)))) (and (=> (= (ControlFlow 0 39) 37) anon25_Then_correct) (=> (= (ControlFlow 0 39) 38) anon25_Else_correct)))))
(let ((anon24_Then_correct  (=> (state PostHeap@0 ZeroMask) (=> (and (and (not (= x@@8 null)) (= PostMask@0 (MapType1Store ZeroMask x@@8 f_7 (real_2_U (+ (U_2_real (MapType1Select ZeroMask x@@8 f_7)) FullPerm))))) (and (state PostHeap@0 PostMask@0) (= (ControlFlow 0 2) (- 0 1)))) (HasDirectPerm PostMask@0 x@@8 f_7)))))
(let ((anon0_correct  (=> (and (state Heap@@9 ZeroMask) (U_2_bool (MapType0Select Heap@@9 x@@8 $allocated))) (=> (and (and (not (= x@@8 null)) (= Mask@0 (MapType1Store ZeroMask x@@8 f_7 (real_2_U (+ (U_2_real (MapType1Select ZeroMask x@@8 f_7)) FullPerm))))) (and (state Heap@@9 Mask@0) (state Heap@@9 Mask@0))) (and (=> (= (ControlFlow 0 40) 2) anon24_Then_correct) (=> (= (ControlFlow 0 40) 39) anon24_Else_correct))))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 41) 40) anon0_correct)))
PreconditionGeneratedEntry_correct))))))))))))))))))))))))))))))))
))
(check-sat)
(get-info :reason-unknown)
(assert (not (= (ControlFlow 0 4) (- 3))))
(check-sat)
(pop 1)
; Invalid
(get-info :rlimit)
