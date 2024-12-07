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
(declare-fun wand_1 (T@U Real T@U Int T@U Real T@U T@U Int Real Real) T@U)
(declare-fun getPredWandId (T@U) Int)
(declare-fun WandType_wand_1Type () T@T)
(declare-fun dummyHeap () T@U)
(declare-fun ZeroMask () T@U)
(declare-fun |wand_1#ft| (T@U Real T@U Int T@U Real T@U T@U Int Real Real) T@U)
(declare-fun wand_2 (T@U Real T@U Int T@U Real T@U Int T@U Real T@U Real) T@U)
(declare-fun WandType_wand_2Type () T@T)
(declare-fun InsidePredicate (T@U T@U T@U T@U) Bool)
(declare-fun sumMask (T@U T@U T@U) Bool)
(declare-fun |wand_2#ft| (T@U Real T@U Int T@U Real T@U Int T@U Real T@U Real) T@U)
(declare-fun ConditionalFrame (Real T@U) T@U)
(declare-fun EmptyFrame () T@U)
(declare-fun |wand_1#sm| (T@U Real T@U Int T@U Real T@U T@U Int Real Real) T@U)
(declare-fun NoPerm () Real)
(declare-fun wand (T@U Real Bool T@U Real T@U Real) T@U)
(declare-fun WandType_wandType () T@T)
(declare-fun FullPerm () Real)
(declare-fun |wand_2#sm| (T@U Real T@U Int T@U Real T@U Int T@U Real T@U Real) T@U)
(declare-fun |wand#ft| (T@U Real Bool T@U Real T@U Real) T@U)
(declare-fun |wand#sm| (T@U Real Bool T@U Real T@U Real) T@U)
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
(assert  (and (= (Ctor WandType_wand_1Type) 12) (forall ((arg0@@25 T@U) (arg1@@9 Real) (arg2@@3 T@U) (arg3@@1 Int) (arg4 T@U) (arg5 Real) (arg6 T@U) (arg7 T@U) (arg8 Int) (arg9 Real) (arg10 Real) ) (! (= (type (wand_1 arg0@@25 arg1@@9 arg2@@3 arg3@@1 arg4 arg5 arg6 arg7 arg8 arg9 arg10)) (FieldType WandType_wand_1Type intType))
 :qid |funType:wand_1|
 :pattern ( (wand_1 arg0@@25 arg1@@9 arg2@@3 arg3@@1 arg4 arg5 arg6 arg7 arg8 arg9 arg10))
))))
(assert (forall ((arg1@@10 T@U) (arg2@@4 Real) (arg3@@2 T@U) (arg4@@0 Int) (arg5@@0 T@U) (arg6@@0 Real) (arg7@@0 T@U) (arg8@@0 T@U) (arg9@@0 Int) (arg10@@0 Real) (arg11 Real) ) (!  (=> (and (and (and (and (= (type arg1@@10) RefType) (= (type arg3@@2) RefType)) (= (type arg5@@0) RefType)) (= (type arg7@@0) RefType)) (= (type arg8@@0) RefType)) (= (getPredWandId (wand_1 arg1@@10 arg2@@4 arg3@@2 arg4@@0 arg5@@0 arg6@@0 arg7@@0 arg8@@0 arg9@@0 arg10@@0 arg11)) 1))
 :qid |stdinbpl.235:15|
 :skolemid |34|
 :pattern ( (wand_1 arg1@@10 arg2@@4 arg3@@2 arg4@@0 arg5@@0 arg6@@0 arg7@@0 arg8@@0 arg9@@0 arg10@@0 arg11))
)))
(assert (forall ((Heap@@2 T@U) (ExhaleHeap@@1 T@U) (Mask@@2 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@2) (MapType0Type RefType)) (= (type ExhaleHeap@@1) (MapType0Type RefType))) (= (type Mask@@2) (MapType1Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@2 ExhaleHeap@@1 Mask@@2)) (U_2_bool (MapType0Select Heap@@2 o_1 $allocated))) (U_2_bool (MapType0Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.73:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@2 ExhaleHeap@@1 Mask@@2) (MapType0Select ExhaleHeap@@1 o_1 $allocated))
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
(assert (forall ((arg1@@11 T@U) (arg2@@5 Real) (arg3@@3 T@U) (arg4@@1 Int) (arg5@@1 T@U) (arg6@@1 Real) (arg7@@1 T@U) (arg8@@1 T@U) (arg9@@1 Int) (arg10@@1 Real) (arg11@@0 Real) ) (!  (=> (and (and (and (and (= (type arg1@@11) RefType) (= (type arg3@@3) RefType)) (= (type arg5@@1) RefType)) (= (type arg7@@1) RefType)) (= (type arg8@@1) RefType)) (IsWandField (wand_1 arg1@@11 arg2@@5 arg3@@3 arg4@@1 arg5@@1 arg6@@1 arg7@@1 arg8@@1 arg9@@1 arg10@@1 arg11@@0)))
 :qid |stdinbpl.215:15|
 :skolemid |29|
 :pattern ( (wand_1 arg1@@11 arg2@@5 arg3@@3 arg4@@1 arg5@@1 arg6@@1 arg7@@1 arg8@@1 arg9@@1 arg10@@1 arg11@@0))
)))
(assert (forall ((arg0@@26 T@U) (arg1@@12 Real) (arg2@@6 T@U) (arg3@@4 Int) (arg4@@2 T@U) (arg5@@2 Real) (arg6@@2 T@U) (arg7@@2 T@U) (arg8@@2 Int) (arg9@@2 Real) (arg10@@2 Real) ) (! (= (type (|wand_1#ft| arg0@@26 arg1@@12 arg2@@6 arg3@@4 arg4@@2 arg5@@2 arg6@@2 arg7@@2 arg8@@2 arg9@@2 arg10@@2)) (FieldType WandType_wand_1Type FrameTypeType))
 :qid |funType:wand_1#ft|
 :pattern ( (|wand_1#ft| arg0@@26 arg1@@12 arg2@@6 arg3@@4 arg4@@2 arg5@@2 arg6@@2 arg7@@2 arg8@@2 arg9@@2 arg10@@2))
)))
(assert (forall ((arg1@@13 T@U) (arg2@@7 Real) (arg3@@5 T@U) (arg4@@3 Int) (arg5@@3 T@U) (arg6@@3 Real) (arg7@@3 T@U) (arg8@@3 T@U) (arg9@@3 Int) (arg10@@3 Real) (arg11@@1 Real) ) (!  (=> (and (and (and (and (= (type arg1@@13) RefType) (= (type arg3@@5) RefType)) (= (type arg5@@3) RefType)) (= (type arg7@@3) RefType)) (= (type arg8@@3) RefType)) (IsWandField (|wand_1#ft| arg1@@13 arg2@@7 arg3@@5 arg4@@3 arg5@@3 arg6@@3 arg7@@3 arg8@@3 arg9@@3 arg10@@3 arg11@@1)))
 :qid |stdinbpl.219:15|
 :skolemid |30|
 :pattern ( (|wand_1#ft| arg1@@13 arg2@@7 arg3@@5 arg4@@3 arg5@@3 arg6@@3 arg7@@3 arg8@@3 arg9@@3 arg10@@3 arg11@@1))
)))
(assert  (and (= (Ctor WandType_wand_2Type) 13) (forall ((arg0@@27 T@U) (arg1@@14 Real) (arg2@@8 T@U) (arg3@@6 Int) (arg4@@4 T@U) (arg5@@4 Real) (arg6@@4 T@U) (arg7@@4 Int) (arg8@@4 T@U) (arg9@@4 Real) (arg10@@4 T@U) (arg11@@2 Real) ) (! (= (type (wand_2 arg0@@27 arg1@@14 arg2@@8 arg3@@6 arg4@@4 arg5@@4 arg6@@4 arg7@@4 arg8@@4 arg9@@4 arg10@@4 arg11@@2)) (FieldType WandType_wand_2Type intType))
 :qid |funType:wand_2|
 :pattern ( (wand_2 arg0@@27 arg1@@14 arg2@@8 arg3@@6 arg4@@4 arg5@@4 arg6@@4 arg7@@4 arg8@@4 arg9@@4 arg10@@4 arg11@@2))
))))
(assert (forall ((arg1@@15 T@U) (arg2@@9 Real) (arg3@@7 T@U) (arg4@@5 Int) (arg5@@5 T@U) (arg6@@5 Real) (arg7@@5 T@U) (arg8@@5 Int) (arg9@@5 T@U) (arg10@@5 Real) (arg11@@3 T@U) (arg12 Real) ) (!  (=> (and (and (and (and (and (= (type arg1@@15) RefType) (= (type arg3@@7) RefType)) (= (type arg5@@5) RefType)) (= (type arg7@@5) RefType)) (= (type arg9@@5) RefType)) (= (type arg11@@3) RefType)) (= (getPredWandId (wand_2 arg1@@15 arg2@@9 arg3@@7 arg4@@5 arg5@@5 arg6@@5 arg7@@5 arg8@@5 arg9@@5 arg10@@5 arg11@@3 arg12)) 2))
 :qid |stdinbpl.267:15|
 :skolemid |41|
 :pattern ( (wand_2 arg1@@15 arg2@@9 arg3@@7 arg4@@5 arg5@@5 arg6@@5 arg7@@5 arg8@@5 arg9@@5 arg10@@5 arg11@@3 arg12))
)))
(assert (forall ((p T@U) (v_1 T@U) (w T@U) ) (! (let ((A@@2 (FieldTypeInv0 (type p))))
 (=> (and (and (= (type p) (FieldType A@@2 FrameTypeType)) (= (type v_1) FrameTypeType)) (= (type w) FrameTypeType)) (not (InsidePredicate p v_1 p w))))
 :qid |stdinbpl.170:19|
 :skolemid |21|
 :pattern ( (InsidePredicate p v_1 p w))
)))
(assert (forall ((arg1@@16 T@U) (arg2@@10 Real) (arg3@@8 T@U) (arg4@@6 Int) (arg5@@6 T@U) (arg6@@6 Real) (arg7@@6 T@U) (arg8@@6 T@U) (arg9@@6 Int) (arg10@@6 Real) (arg11@@4 Real) ) (!  (=> (and (and (and (and (= (type arg1@@16) RefType) (= (type arg3@@8) RefType)) (= (type arg5@@6) RefType)) (= (type arg7@@6) RefType)) (= (type arg8@@6) RefType)) (not (IsPredicateField (wand_1 arg1@@16 arg2@@10 arg3@@8 arg4@@6 arg5@@6 arg6@@6 arg7@@6 arg8@@6 arg9@@6 arg10@@6 arg11@@4))))
 :qid |stdinbpl.223:15|
 :skolemid |31|
 :pattern ( (wand_1 arg1@@16 arg2@@10 arg3@@8 arg4@@6 arg5@@6 arg6@@6 arg7@@6 arg8@@6 arg9@@6 arg10@@6 arg11@@4))
)))
(assert (forall ((arg1@@17 T@U) (arg2@@11 Real) (arg3@@9 T@U) (arg4@@7 Int) (arg5@@7 T@U) (arg6@@7 Real) (arg7@@7 T@U) (arg8@@7 T@U) (arg9@@7 Int) (arg10@@7 Real) (arg11@@5 Real) ) (!  (=> (and (and (and (and (= (type arg1@@17) RefType) (= (type arg3@@9) RefType)) (= (type arg5@@7) RefType)) (= (type arg7@@7) RefType)) (= (type arg8@@7) RefType)) (not (IsPredicateField (|wand_1#ft| arg1@@17 arg2@@11 arg3@@9 arg4@@7 arg5@@7 arg6@@7 arg7@@7 arg8@@7 arg9@@7 arg10@@7 arg11@@5))))
 :qid |stdinbpl.227:15|
 :skolemid |32|
 :pattern ( (|wand_1#ft| arg1@@17 arg2@@11 arg3@@9 arg4@@7 arg5@@7 arg6@@7 arg7@@7 arg8@@7 arg9@@7 arg10@@7 arg11@@5))
)))
(assert  (not (IsPredicateField f_7)))
(assert  (not (IsWandField f_7)))
(assert (forall ((Heap@@4 T@U) (ExhaleHeap@@3 T@U) (Mask@@4 T@U) ) (!  (=> (and (and (and (= (type Heap@@4) (MapType0Type RefType)) (= (type ExhaleHeap@@3) (MapType0Type RefType))) (= (type Mask@@4) (MapType1Type RefType realType))) (IdenticalOnKnownLocations Heap@@4 ExhaleHeap@@3 Mask@@4)) (succHeap Heap@@4 ExhaleHeap@@3))
 :qid |stdinbpl.83:15|
 :skolemid |10|
 :pattern ( (IdenticalOnKnownLocations Heap@@4 ExhaleHeap@@3 Mask@@4))
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
(assert (forall ((arg1@@18 T@U) (arg2@@12 Real) (arg3@@10 T@U) (arg4@@8 Int) (arg5@@8 T@U) (arg6@@8 Real) (arg7@@8 T@U) (arg8@@8 Int) (arg9@@8 T@U) (arg10@@8 Real) (arg11@@6 T@U) (arg12@@0 Real) ) (!  (=> (and (and (and (and (and (= (type arg1@@18) RefType) (= (type arg3@@10) RefType)) (= (type arg5@@8) RefType)) (= (type arg7@@8) RefType)) (= (type arg9@@8) RefType)) (= (type arg11@@6) RefType)) (IsWandField (wand_2 arg1@@18 arg2@@12 arg3@@10 arg4@@8 arg5@@8 arg6@@8 arg7@@8 arg8@@8 arg9@@8 arg10@@8 arg11@@6 arg12@@0)))
 :qid |stdinbpl.247:15|
 :skolemid |36|
 :pattern ( (wand_2 arg1@@18 arg2@@12 arg3@@10 arg4@@8 arg5@@8 arg6@@8 arg7@@8 arg8@@8 arg9@@8 arg10@@8 arg11@@6 arg12@@0))
)))
(assert (forall ((arg0@@28 T@U) (arg1@@19 Real) (arg2@@13 T@U) (arg3@@11 Int) (arg4@@9 T@U) (arg5@@9 Real) (arg6@@9 T@U) (arg7@@9 Int) (arg8@@9 T@U) (arg9@@9 Real) (arg10@@9 T@U) (arg11@@7 Real) ) (! (= (type (|wand_2#ft| arg0@@28 arg1@@19 arg2@@13 arg3@@11 arg4@@9 arg5@@9 arg6@@9 arg7@@9 arg8@@9 arg9@@9 arg10@@9 arg11@@7)) (FieldType WandType_wand_2Type FrameTypeType))
 :qid |funType:wand_2#ft|
 :pattern ( (|wand_2#ft| arg0@@28 arg1@@19 arg2@@13 arg3@@11 arg4@@9 arg5@@9 arg6@@9 arg7@@9 arg8@@9 arg9@@9 arg10@@9 arg11@@7))
)))
(assert (forall ((arg1@@20 T@U) (arg2@@14 Real) (arg3@@12 T@U) (arg4@@10 Int) (arg5@@10 T@U) (arg6@@10 Real) (arg7@@10 T@U) (arg8@@10 Int) (arg9@@10 T@U) (arg10@@10 Real) (arg11@@8 T@U) (arg12@@1 Real) ) (!  (=> (and (and (and (and (and (= (type arg1@@20) RefType) (= (type arg3@@12) RefType)) (= (type arg5@@10) RefType)) (= (type arg7@@10) RefType)) (= (type arg9@@10) RefType)) (= (type arg11@@8) RefType)) (IsWandField (|wand_2#ft| arg1@@20 arg2@@14 arg3@@12 arg4@@10 arg5@@10 arg6@@10 arg7@@10 arg8@@10 arg9@@10 arg10@@10 arg11@@8 arg12@@1)))
 :qid |stdinbpl.251:15|
 :skolemid |37|
 :pattern ( (|wand_2#ft| arg1@@20 arg2@@14 arg3@@12 arg4@@10 arg5@@10 arg6@@10 arg7@@10 arg8@@10 arg9@@10 arg10@@10 arg11@@8 arg12@@1))
)))
(assert  (and (forall ((arg0@@29 Real) (arg1@@21 T@U) ) (! (= (type (ConditionalFrame arg0@@29 arg1@@21)) FrameTypeType)
 :qid |funType:ConditionalFrame|
 :pattern ( (ConditionalFrame arg0@@29 arg1@@21))
)) (= (type EmptyFrame) FrameTypeType)))
(assert (forall ((p@@0 Real) (f_6 T@U) ) (!  (=> (= (type f_6) FrameTypeType) (= (ConditionalFrame p@@0 f_6) (ite (> p@@0 0.0) f_6 EmptyFrame)))
 :qid |stdinbpl.158:15|
 :skolemid |19|
 :pattern ( (ConditionalFrame p@@0 f_6))
)))
(assert (forall ((arg0@@30 T@U) (arg1@@22 Real) (arg2@@15 T@U) (arg3@@13 Int) (arg4@@11 T@U) (arg5@@11 Real) (arg6@@11 T@U) (arg7@@11 T@U) (arg8@@11 Int) (arg9@@11 Real) (arg10@@11 Real) ) (! (= (type (|wand_1#sm| arg0@@30 arg1@@22 arg2@@15 arg3@@13 arg4@@11 arg5@@11 arg6@@11 arg7@@11 arg8@@11 arg9@@11 arg10@@11)) (FieldType WandType_wand_1Type (MapType1Type RefType boolType)))
 :qid |funType:wand_1#sm|
 :pattern ( (|wand_1#sm| arg0@@30 arg1@@22 arg2@@15 arg3@@13 arg4@@11 arg5@@11 arg6@@11 arg7@@11 arg8@@11 arg9@@11 arg10@@11))
)))
(assert (forall ((arg1@@23 T@U) (arg2@@16 Real) (arg3@@14 T@U) (arg4@@12 Int) (arg5@@12 T@U) (arg6@@12 Real) (arg7@@12 T@U) (arg8@@12 T@U) (arg9@@12 Int) (arg10@@12 Real) (arg11@@9 Real) ) (!  (=> (and (and (and (and (= (type arg1@@23) RefType) (= (type arg3@@14) RefType)) (= (type arg5@@12) RefType)) (= (type arg7@@12) RefType)) (= (type arg8@@12) RefType)) (= (|wand_1#sm| arg1@@23 arg2@@16 arg3@@14 arg4@@12 arg5@@12 arg6@@12 arg7@@12 arg8@@12 arg9@@12 arg10@@12 arg11@@9) (WandMaskField (|wand_1#ft| arg1@@23 arg2@@16 arg3@@14 arg4@@12 arg5@@12 arg6@@12 arg7@@12 arg8@@12 arg9@@12 arg10@@12 arg11@@9))))
 :qid |stdinbpl.231:15|
 :skolemid |33|
 :pattern ( (WandMaskField (|wand_1#ft| arg1@@23 arg2@@16 arg3@@14 arg4@@12 arg5@@12 arg6@@12 arg7@@12 arg8@@12 arg9@@12 arg10@@12 arg11@@9)))
)))
(assert (forall ((arg1@@24 T@U) (arg2@@17 Real) (arg3@@15 T@U) (arg4@@13 Int) (arg5@@13 T@U) (arg6@@13 Real) (arg7@@13 T@U) (arg8@@13 Int) (arg9@@13 T@U) (arg10@@13 Real) (arg11@@10 T@U) (arg12@@2 Real) ) (!  (=> (and (and (and (and (and (= (type arg1@@24) RefType) (= (type arg3@@15) RefType)) (= (type arg5@@13) RefType)) (= (type arg7@@13) RefType)) (= (type arg9@@13) RefType)) (= (type arg11@@10) RefType)) (not (IsPredicateField (wand_2 arg1@@24 arg2@@17 arg3@@15 arg4@@13 arg5@@13 arg6@@13 arg7@@13 arg8@@13 arg9@@13 arg10@@13 arg11@@10 arg12@@2))))
 :qid |stdinbpl.255:15|
 :skolemid |38|
 :pattern ( (wand_2 arg1@@24 arg2@@17 arg3@@15 arg4@@13 arg5@@13 arg6@@13 arg7@@13 arg8@@13 arg9@@13 arg10@@13 arg11@@10 arg12@@2))
)))
(assert (forall ((arg1@@25 T@U) (arg2@@18 Real) (arg3@@16 T@U) (arg4@@14 Int) (arg5@@14 T@U) (arg6@@14 Real) (arg7@@14 T@U) (arg8@@14 Int) (arg9@@14 T@U) (arg10@@14 Real) (arg11@@11 T@U) (arg12@@3 Real) ) (!  (=> (and (and (and (and (and (= (type arg1@@25) RefType) (= (type arg3@@16) RefType)) (= (type arg5@@14) RefType)) (= (type arg7@@14) RefType)) (= (type arg9@@14) RefType)) (= (type arg11@@11) RefType)) (not (IsPredicateField (|wand_2#ft| arg1@@25 arg2@@18 arg3@@16 arg4@@14 arg5@@14 arg6@@14 arg7@@14 arg8@@14 arg9@@14 arg10@@14 arg11@@11 arg12@@3))))
 :qid |stdinbpl.259:15|
 :skolemid |39|
 :pattern ( (|wand_2#ft| arg1@@25 arg2@@18 arg3@@16 arg4@@14 arg5@@14 arg6@@14 arg7@@14 arg8@@14 arg9@@14 arg10@@14 arg11@@11 arg12@@3))
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
(assert (forall ((arg1@@26 T@U) (arg2@@19 Real) (arg3@@17 T@U) (arg4@@15 Int) (arg5@@15 T@U) (arg6@@15 Real) (arg7@@15 T@U) (arg8@@15 T@U) (arg9@@15 Int) (arg10@@15 Real) (arg11@@12 Real) (arg1_2 T@U) (arg2_2 Real) (arg3_2 T@U) (arg4_2 Int) (arg5_2 T@U) (arg6_2 Real) (arg7_2 T@U) (arg8_2 T@U) (arg9_2 Int) (arg10_2 Real) (arg11_2 Real) ) (!  (=> (and (and (and (and (and (and (and (and (and (and (= (type arg1@@26) RefType) (= (type arg3@@17) RefType)) (= (type arg5@@15) RefType)) (= (type arg7@@15) RefType)) (= (type arg8@@15) RefType)) (= (type arg1_2) RefType)) (= (type arg3_2) RefType)) (= (type arg5_2) RefType)) (= (type arg7_2) RefType)) (= (type arg8_2) RefType)) (= (wand_1 arg1@@26 arg2@@19 arg3@@17 arg4@@15 arg5@@15 arg6@@15 arg7@@15 arg8@@15 arg9@@15 arg10@@15 arg11@@12) (wand_1 arg1_2 arg2_2 arg3_2 arg4_2 arg5_2 arg6_2 arg7_2 arg8_2 arg9_2 arg10_2 arg11_2))) (and (= arg1@@26 arg1_2) (and (= arg2@@19 arg2_2) (and (= arg3@@17 arg3_2) (and (= arg4@@15 arg4_2) (and (= arg5@@15 arg5_2) (and (= arg6@@15 arg6_2) (and (= arg7@@15 arg7_2) (and (= arg8@@15 arg8_2) (and (= arg9@@15 arg9_2) (and (= arg10@@15 arg10_2) (= arg11@@12 arg11_2))))))))))))
 :qid |stdinbpl.239:15|
 :skolemid |35|
 :pattern ( (wand_1 arg1@@26 arg2@@19 arg3@@17 arg4@@15 arg5@@15 arg6@@15 arg7@@15 arg8@@15 arg9@@15 arg10@@15 arg11@@12) (wand_1 arg1_2 arg2_2 arg3_2 arg4_2 arg5_2 arg6_2 arg7_2 arg8_2 arg9_2 arg10_2 arg11_2))
)))
(assert  (and (= (Ctor WandType_wandType) 14) (forall ((arg0@@31 T@U) (arg1@@27 Real) (arg2@@20 Bool) (arg3@@18 T@U) (arg4@@16 Real) (arg5@@16 T@U) (arg6@@16 Real) ) (! (= (type (wand arg0@@31 arg1@@27 arg2@@20 arg3@@18 arg4@@16 arg5@@16 arg6@@16)) (FieldType WandType_wandType intType))
 :qid |funType:wand|
 :pattern ( (wand arg0@@31 arg1@@27 arg2@@20 arg3@@18 arg4@@16 arg5@@16 arg6@@16))
))))
(assert (forall ((arg1@@28 T@U) (arg2@@21 Real) (arg3@@19 Bool) (arg4@@17 T@U) (arg5@@17 Real) (arg6@@17 T@U) (arg7@@16 Real) (arg1_2@@0 T@U) (arg2_2@@0 Real) (arg3_2@@0 Bool) (arg4_2@@0 T@U) (arg5_2@@0 Real) (arg6_2@@0 T@U) (arg7_2@@0 Real) ) (!  (=> (and (and (and (and (and (and (= (type arg1@@28) RefType) (= (type arg4@@17) RefType)) (= (type arg6@@17) RefType)) (= (type arg1_2@@0) RefType)) (= (type arg4_2@@0) RefType)) (= (type arg6_2@@0) RefType)) (= (wand arg1@@28 arg2@@21 arg3@@19 arg4@@17 arg5@@17 arg6@@17 arg7@@16) (wand arg1_2@@0 arg2_2@@0 arg3_2@@0 arg4_2@@0 arg5_2@@0 arg6_2@@0 arg7_2@@0))) (and (= arg1@@28 arg1_2@@0) (and (= arg2@@21 arg2_2@@0) (and (= arg3@@19 arg3_2@@0) (and (= arg4@@17 arg4_2@@0) (and (= arg5@@17 arg5_2@@0) (and (= arg6@@17 arg6_2@@0) (= arg7@@16 arg7_2@@0))))))))
 :qid |stdinbpl.207:15|
 :skolemid |28|
 :pattern ( (wand arg1@@28 arg2@@21 arg3@@19 arg4@@17 arg5@@17 arg6@@17 arg7@@16) (wand arg1_2@@0 arg2_2@@0 arg3_2@@0 arg4_2@@0 arg5_2@@0 arg6_2@@0 arg7_2@@0))
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
(assert (forall ((arg0@@32 T@U) (arg1@@29 Real) (arg2@@22 T@U) (arg3@@20 Int) (arg4@@18 T@U) (arg5@@18 Real) (arg6@@18 T@U) (arg7@@17 Int) (arg8@@16 T@U) (arg9@@16 Real) (arg10@@16 T@U) (arg11@@13 Real) ) (! (= (type (|wand_2#sm| arg0@@32 arg1@@29 arg2@@22 arg3@@20 arg4@@18 arg5@@18 arg6@@18 arg7@@17 arg8@@16 arg9@@16 arg10@@16 arg11@@13)) (FieldType WandType_wand_2Type (MapType1Type RefType boolType)))
 :qid |funType:wand_2#sm|
 :pattern ( (|wand_2#sm| arg0@@32 arg1@@29 arg2@@22 arg3@@20 arg4@@18 arg5@@18 arg6@@18 arg7@@17 arg8@@16 arg9@@16 arg10@@16 arg11@@13))
)))
(assert (forall ((arg1@@30 T@U) (arg2@@23 Real) (arg3@@21 T@U) (arg4@@19 Int) (arg5@@19 T@U) (arg6@@19 Real) (arg7@@18 T@U) (arg8@@17 Int) (arg9@@17 T@U) (arg10@@17 Real) (arg11@@14 T@U) (arg12@@4 Real) ) (!  (=> (and (and (and (and (and (= (type arg1@@30) RefType) (= (type arg3@@21) RefType)) (= (type arg5@@19) RefType)) (= (type arg7@@18) RefType)) (= (type arg9@@17) RefType)) (= (type arg11@@14) RefType)) (= (|wand_2#sm| arg1@@30 arg2@@23 arg3@@21 arg4@@19 arg5@@19 arg6@@19 arg7@@18 arg8@@17 arg9@@17 arg10@@17 arg11@@14 arg12@@4) (WandMaskField (|wand_2#ft| arg1@@30 arg2@@23 arg3@@21 arg4@@19 arg5@@19 arg6@@19 arg7@@18 arg8@@17 arg9@@17 arg10@@17 arg11@@14 arg12@@4))))
 :qid |stdinbpl.263:15|
 :skolemid |40|
 :pattern ( (WandMaskField (|wand_2#ft| arg1@@30 arg2@@23 arg3@@21 arg4@@19 arg5@@19 arg6@@19 arg7@@18 arg8@@17 arg9@@17 arg10@@17 arg11@@14 arg12@@4)))
)))
(assert (forall ((Heap@@8 T@U) (o@@0 T@U) (f_3 T@U) (v T@U) ) (! (let ((B@@8 (type v)))
(let ((A@@9 (FieldTypeInv0 (type f_3))))
 (=> (and (and (= (type Heap@@8) (MapType0Type RefType)) (= (type o@@0) RefType)) (= (type f_3) (FieldType A@@9 B@@8))) (succHeap Heap@@8 (MapType0Store Heap@@8 o@@0 f_3 v)))))
 :qid |stdinbpl.78:22|
 :skolemid |9|
 :pattern ( (MapType0Store Heap@@8 o@@0 f_3 v))
)))
(assert  (and (forall ((arg0@@33 T@U) (arg1@@31 Real) (arg2@@24 Bool) (arg3@@22 T@U) (arg4@@20 Real) (arg5@@20 T@U) (arg6@@20 Real) ) (! (= (type (|wand#ft| arg0@@33 arg1@@31 arg2@@24 arg3@@22 arg4@@20 arg5@@20 arg6@@20)) (FieldType WandType_wandType FrameTypeType))
 :qid |funType:wand#ft|
 :pattern ( (|wand#ft| arg0@@33 arg1@@31 arg2@@24 arg3@@22 arg4@@20 arg5@@20 arg6@@20))
)) (forall ((arg0@@34 T@U) (arg1@@32 Real) (arg2@@25 Bool) (arg3@@23 T@U) (arg4@@21 Real) (arg5@@21 T@U) (arg6@@21 Real) ) (! (= (type (|wand#sm| arg0@@34 arg1@@32 arg2@@25 arg3@@23 arg4@@21 arg5@@21 arg6@@21)) (FieldType WandType_wandType (MapType1Type RefType boolType)))
 :qid |funType:wand#sm|
 :pattern ( (|wand#sm| arg0@@34 arg1@@32 arg2@@25 arg3@@23 arg4@@21 arg5@@21 arg6@@21))
))))
(assert (forall ((arg1@@33 T@U) (arg2@@26 Real) (arg3@@24 Bool) (arg4@@22 T@U) (arg5@@22 Real) (arg6@@22 T@U) (arg7@@19 Real) ) (!  (=> (and (and (= (type arg1@@33) RefType) (= (type arg4@@22) RefType)) (= (type arg6@@22) RefType)) (= (|wand#sm| arg1@@33 arg2@@26 arg3@@24 arg4@@22 arg5@@22 arg6@@22 arg7@@19) (WandMaskField (|wand#ft| arg1@@33 arg2@@26 arg3@@24 arg4@@22 arg5@@22 arg6@@22 arg7@@19))))
 :qid |stdinbpl.199:15|
 :skolemid |26|
 :pattern ( (WandMaskField (|wand#ft| arg1@@33 arg2@@26 arg3@@24 arg4@@22 arg5@@22 arg6@@22 arg7@@19)))
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
(assert (forall ((arg1@@34 T@U) (arg2@@27 Real) (arg3@@25 Bool) (arg4@@23 T@U) (arg5@@23 Real) (arg6@@23 T@U) (arg7@@20 Real) ) (!  (=> (and (and (= (type arg1@@34) RefType) (= (type arg4@@23) RefType)) (= (type arg6@@23) RefType)) (IsWandField (wand arg1@@34 arg2@@27 arg3@@25 arg4@@23 arg5@@23 arg6@@23 arg7@@20)))
 :qid |stdinbpl.183:15|
 :skolemid |22|
 :pattern ( (wand arg1@@34 arg2@@27 arg3@@25 arg4@@23 arg5@@23 arg6@@23 arg7@@20))
)))
(assert (forall ((arg1@@35 T@U) (arg2@@28 Real) (arg3@@26 Bool) (arg4@@24 T@U) (arg5@@24 Real) (arg6@@24 T@U) (arg7@@21 Real) ) (!  (=> (and (and (= (type arg1@@35) RefType) (= (type arg4@@24) RefType)) (= (type arg6@@24) RefType)) (IsWandField (|wand#ft| arg1@@35 arg2@@28 arg3@@26 arg4@@24 arg5@@24 arg6@@24 arg7@@21)))
 :qid |stdinbpl.187:15|
 :skolemid |23|
 :pattern ( (|wand#ft| arg1@@35 arg2@@28 arg3@@26 arg4@@24 arg5@@24 arg6@@24 arg7@@21))
)))
(assert (forall ((arg1@@36 T@U) (arg2@@29 Real) (arg3@@27 Bool) (arg4@@25 T@U) (arg5@@25 Real) (arg6@@25 T@U) (arg7@@22 Real) ) (!  (=> (and (and (= (type arg1@@36) RefType) (= (type arg4@@25) RefType)) (= (type arg6@@25) RefType)) (not (IsPredicateField (wand arg1@@36 arg2@@29 arg3@@27 arg4@@25 arg5@@25 arg6@@25 arg7@@22))))
 :qid |stdinbpl.191:15|
 :skolemid |24|
 :pattern ( (wand arg1@@36 arg2@@29 arg3@@27 arg4@@25 arg5@@25 arg6@@25 arg7@@22))
)))
(assert (forall ((arg1@@37 T@U) (arg2@@30 Real) (arg3@@28 Bool) (arg4@@26 T@U) (arg5@@26 Real) (arg6@@26 T@U) (arg7@@23 Real) ) (!  (=> (and (and (= (type arg1@@37) RefType) (= (type arg4@@26) RefType)) (= (type arg6@@26) RefType)) (not (IsPredicateField (|wand#ft| arg1@@37 arg2@@30 arg3@@28 arg4@@26 arg5@@26 arg6@@26 arg7@@23))))
 :qid |stdinbpl.195:15|
 :skolemid |25|
 :pattern ( (|wand#ft| arg1@@37 arg2@@30 arg3@@28 arg4@@26 arg5@@26 arg6@@26 arg7@@23))
)))
(assert (forall ((arg1@@38 T@U) (arg2@@31 Real) (arg3@@29 T@U) (arg4@@27 Int) (arg5@@27 T@U) (arg6@@27 Real) (arg7@@24 T@U) (arg8@@18 Int) (arg9@@18 T@U) (arg10@@18 Real) (arg11@@15 T@U) (arg12@@5 Real) (arg1_2@@1 T@U) (arg2_2@@1 Real) (arg3_2@@1 T@U) (arg4_2@@1 Int) (arg5_2@@1 T@U) (arg6_2@@1 Real) (arg7_2@@1 T@U) (arg8_2@@0 Int) (arg9_2@@0 T@U) (arg10_2@@0 Real) (arg11_2@@0 T@U) (arg12_2 Real) ) (!  (=> (and (and (and (and (and (and (and (and (and (and (and (and (= (type arg1@@38) RefType) (= (type arg3@@29) RefType)) (= (type arg5@@27) RefType)) (= (type arg7@@24) RefType)) (= (type arg9@@18) RefType)) (= (type arg11@@15) RefType)) (= (type arg1_2@@1) RefType)) (= (type arg3_2@@1) RefType)) (= (type arg5_2@@1) RefType)) (= (type arg7_2@@1) RefType)) (= (type arg9_2@@0) RefType)) (= (type arg11_2@@0) RefType)) (= (wand_2 arg1@@38 arg2@@31 arg3@@29 arg4@@27 arg5@@27 arg6@@27 arg7@@24 arg8@@18 arg9@@18 arg10@@18 arg11@@15 arg12@@5) (wand_2 arg1_2@@1 arg2_2@@1 arg3_2@@1 arg4_2@@1 arg5_2@@1 arg6_2@@1 arg7_2@@1 arg8_2@@0 arg9_2@@0 arg10_2@@0 arg11_2@@0 arg12_2))) (and (= arg1@@38 arg1_2@@1) (and (= arg2@@31 arg2_2@@1) (and (= arg3@@29 arg3_2@@1) (and (= arg4@@27 arg4_2@@1) (and (= arg5@@27 arg5_2@@1) (and (= arg6@@27 arg6_2@@1) (and (= arg7@@24 arg7_2@@1) (and (= arg8@@18 arg8_2@@0) (and (= arg9@@18 arg9_2@@0) (and (= arg10@@18 arg10_2@@0) (and (= arg11@@15 arg11_2@@0) (= arg12@@5 arg12_2)))))))))))))
 :qid |stdinbpl.271:15|
 :skolemid |42|
 :pattern ( (wand_2 arg1@@38 arg2@@31 arg3@@29 arg4@@27 arg5@@27 arg6@@27 arg7@@24 arg8@@18 arg9@@18 arg10@@18 arg11@@15 arg12@@5) (wand_2 arg1_2@@1 arg2_2@@1 arg3_2@@1 arg4_2@@1 arg5_2@@1 arg6_2@@1 arg7_2@@1 arg8_2@@0 arg9_2@@0 arg10_2@@0 arg11_2@@0 arg12_2))
)))
(assert (forall ((arg1@@39 T@U) (arg2@@32 Real) (arg3@@30 Bool) (arg4@@28 T@U) (arg5@@28 Real) (arg6@@28 T@U) (arg7@@25 Real) ) (!  (=> (and (and (= (type arg1@@39) RefType) (= (type arg4@@28) RefType)) (= (type arg6@@28) RefType)) (= (getPredWandId (wand arg1@@39 arg2@@32 arg3@@30 arg4@@28 arg5@@28 arg6@@28 arg7@@25)) 0))
 :qid |stdinbpl.203:15|
 :skolemid |27|
 :pattern ( (wand arg1@@39 arg2@@32 arg3@@30 arg4@@28 arg5@@28 arg6@@28 arg7@@25))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun perm@2 () Real)
(declare-fun Mask@8 () T@U)
(declare-fun x@@8 () T@U)
(declare-fun Mask@7 () T@U)
(declare-fun Heap@6 () T@U)
(declare-fun b_11@8 () Bool)
(declare-fun b_12@18 () Bool)
(declare-fun neededTransfer@14 () Real)
(declare-fun Used_5Mask@11 () T@U)
(declare-fun initNeededTransfer@1 () Real)
(declare-fun b_14@0 () Bool)
(declare-fun b_14@1 () Bool)
(declare-fun Result_5Heap () T@U)
(declare-fun Result_5Mask () T@U)
(declare-fun b_14@2 () Bool)
(declare-fun Ops_5Mask () T@U)
(declare-fun b_14@3 () Bool)
(declare-fun Ops_5Heap@0 () T@U)
(declare-fun Used_5Heap@0 () T@U)
(declare-fun b_14@4 () Bool)
(declare-fun b_11@10 () Bool)
(declare-fun Heap@5 () T@U)
(declare-fun Mask@6 () T@U)
(declare-fun takeTransfer@5 () Real)
(declare-fun neededTransfer@12 () Real)
(declare-fun b_12@15 () Bool)
(declare-fun Mask@2 () T@U)
(declare-fun Used_5Mask@9 () T@U)
(declare-fun Heap@1 () T@U)
(declare-fun neededTransfer@13 () Real)
(declare-fun Used_5Mask@10 () T@U)
(declare-fun b_12@16 () Bool)
(declare-fun b_12@17 () Bool)
(declare-fun Mask@5 () T@U)
(declare-fun Heap@4 () T@U)
(declare-fun maskTransfer@5 () Real)
(declare-fun takeTransfer@4 () Real)
(declare-fun Used_5Mask@3 () T@U)
(declare-fun b_12@6 () Bool)
(declare-fun neededTransfer@5 () Real)
(declare-fun neededTransfer@11 () Real)
(declare-fun Used_5Mask@8 () T@U)
(declare-fun b_12@13 () Bool)
(declare-fun b_12@14 () Bool)
(declare-fun Ops_5Mask@6 () T@U)
(declare-fun Ops_5Mask@4 () T@U)
(declare-fun maskTransfer@4 () Real)
(declare-fun Result_4Heap () T@U)
(declare-fun b_12@12 () Bool)
(declare-fun neededTransfer@10 () Real)
(declare-fun Used_5Mask@7 () T@U)
(declare-fun initNeededTransfer@2 () Real)
(declare-fun b_15@0 () Bool)
(declare-fun b_15@1 () Bool)
(declare-fun Result_6Heap () T@U)
(declare-fun Result_6Mask () T@U)
(declare-fun b_15@2 () Bool)
(declare-fun b_15@3 () Bool)
(declare-fun b_15@4 () Bool)
(declare-fun b_11@9 () Bool)
(declare-fun Heap@3 () T@U)
(declare-fun Mask@4 () T@U)
(declare-fun takeTransfer@3 () Real)
(declare-fun neededTransfer@8 () Real)
(declare-fun b_12@9 () Bool)
(declare-fun Used_5Mask@5 () T@U)
(declare-fun neededTransfer@9 () Real)
(declare-fun Used_5Mask@6 () T@U)
(declare-fun b_12@10 () Bool)
(declare-fun b_12@11 () Bool)
(declare-fun Mask@3 () T@U)
(declare-fun Heap@2 () T@U)
(declare-fun maskTransfer@3 () Real)
(declare-fun takeTransfer@2 () Real)
(declare-fun neededTransfer@6 () Real)
(declare-fun neededTransfer@7 () Real)
(declare-fun Used_5Mask@4 () T@U)
(declare-fun b_12@7 () Bool)
(declare-fun b_12@8 () Bool)
(declare-fun Ops_5Mask@5 () T@U)
(declare-fun maskTransfer@2 () Real)
(declare-fun b_11@7 () Bool)
(declare-fun neededTransfer@4 () Real)
(declare-fun initNeededTransfer@0 () Real)
(declare-fun b_13@0 () Bool)
(declare-fun b_13@1 () Bool)
(declare-fun Result_4Mask () T@U)
(declare-fun b_13@2 () Bool)
(declare-fun b_13@3 () Bool)
(declare-fun b_13@4 () Bool)
(declare-fun takeTransfer@1 () Real)
(declare-fun Mask@0 () T@U)
(declare-fun neededTransfer@2 () Real)
(declare-fun b_12@3 () Bool)
(declare-fun Used_5Mask@1 () T@U)
(declare-fun Heap@@9 () T@U)
(declare-fun neededTransfer@3 () Real)
(declare-fun Used_5Mask@2 () T@U)
(declare-fun b_12@4 () Bool)
(declare-fun b_12@5 () Bool)
(declare-fun Mask@1 () T@U)
(declare-fun Heap@0 () T@U)
(declare-fun maskTransfer@1 () Real)
(declare-fun takeTransfer@0 () Real)
(declare-fun Ops_5Mask@2 () T@U)
(declare-fun b_12@0 () Bool)
(declare-fun neededTransfer@0 () Real)
(declare-fun neededTransfer@1 () Real)
(declare-fun Used_5Mask@0 () T@U)
(declare-fun b_12@1 () Bool)
(declare-fun b_12@2 () Bool)
(declare-fun Ops_5Mask@3 () T@U)
(declare-fun maskTransfer@0 () Real)
(declare-fun b_11@6 () Bool)
(declare-fun b_11@5 () Bool)
(declare-fun b_12 () Bool)
(declare-fun b_11@4 () Bool)
(declare-fun b_11@3 () Bool)
(declare-fun Ops_5Mask@1 () T@U)
(declare-fun b_11@0 () Bool)
(declare-fun perm@1 () Real)
(declare-fun b_11@1 () Bool)
(declare-fun Ops_5Mask@0 () T@U)
(declare-fun b_11@2 () Bool)
(declare-fun perm@0 () Real)
(declare-fun b_11 () Bool)
(declare-fun b_10@0 () Bool)
(declare-fun b_10 () Bool)
(declare-fun Used_4Heap@0 () T@U)
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (= (type Mask@8) (MapType1Type RefType realType)) (= (type x@@8) RefType)) (= (type Mask@7) (MapType1Type RefType realType))) (= (type Heap@6) (MapType0Type RefType))) (= (type Heap@1) (MapType0Type RefType))) (= (type Mask@2) (MapType1Type RefType realType))) (= (type Used_5Mask@7) (MapType1Type RefType realType))) (= (type Result_6Heap) (MapType0Type RefType))) (= (type Result_6Mask) (MapType1Type RefType realType))) (= (type Ops_5Mask) (MapType1Type RefType realType))) (= (type Ops_5Heap@0) (MapType0Type RefType))) (= (type Used_5Heap@0) (MapType0Type RefType))) (= (type Heap@3) (MapType0Type RefType))) (= (type Mask@4) (MapType1Type RefType realType))) (= (type Used_5Mask@5) (MapType1Type RefType realType))) (= (type Used_5Mask@6) (MapType1Type RefType realType))) (= (type Mask@3) (MapType1Type RefType realType))) (= (type Heap@2) (MapType0Type RefType))) (= (type Used_5Mask@3) (MapType1Type RefType realType))) (= (type Used_5Mask@4) (MapType1Type RefType realType))) (= (type Ops_5Mask@5) (MapType1Type RefType realType))) (= (type Ops_5Mask@4) (MapType1Type RefType realType))) (= (type Result_4Heap) (MapType0Type RefType))) (= (type Used_5Mask@11) (MapType1Type RefType realType))) (= (type Result_5Heap) (MapType0Type RefType))) (= (type Result_5Mask) (MapType1Type RefType realType))) (= (type Heap@5) (MapType0Type RefType))) (= (type Mask@6) (MapType1Type RefType realType))) (= (type Used_5Mask@9) (MapType1Type RefType realType))) (= (type Used_5Mask@10) (MapType1Type RefType realType))) (= (type Mask@5) (MapType1Type RefType realType))) (= (type Heap@4) (MapType0Type RefType))) (= (type Used_5Mask@8) (MapType1Type RefType realType))) (= (type Ops_5Mask@6) (MapType1Type RefType realType))) (= (type Result_4Mask) (MapType1Type RefType realType))) (= (type Mask@0) (MapType1Type RefType realType))) (= (type Used_5Mask@1) (MapType1Type RefType realType))) (= (type Heap@@9) (MapType0Type RefType))) (= (type Used_5Mask@2) (MapType1Type RefType realType))) (= (type Mask@1) (MapType1Type RefType realType))) (= (type Heap@0) (MapType0Type RefType))) (= (type Ops_5Mask@2) (MapType1Type RefType realType))) (= (type Used_5Mask@0) (MapType1Type RefType realType))) (= (type Ops_5Mask@3) (MapType1Type RefType realType))) (= (type Ops_5Mask@1) (MapType1Type RefType realType))) (= (type Ops_5Mask@0) (MapType1Type RefType realType))) (= (type Used_4Heap@0) (MapType0Type RefType))))
(set-info :boogie-vc-id test03)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 70) (let ((anon49_correct true))
(let ((anon74_Else_correct  (=> (and (= perm@2 NoPerm) (= (ControlFlow 0 4) 1)) anon49_correct)))
(let ((anon74_Then_correct  (=> (not (= perm@2 NoPerm)) (and (=> (= (ControlFlow 0 2) (- 0 3)) (<= perm@2 (U_2_real (MapType1Select Mask@8 x@@8 f_7)))) (=> (<= perm@2 (U_2_real (MapType1Select Mask@8 x@@8 f_7))) (=> (= (ControlFlow 0 2) 1) anon49_correct))))))
(let ((anon47_correct  (=> (= Mask@8 (MapType1Store Mask@7 null (wand_2 x@@8 (/ (to_real 2) (to_real 4)) x@@8 0 x@@8 (/ (to_real 1) (to_real 4)) x@@8 0 x@@8 (/ (to_real 2) (to_real 4)) x@@8 (/ (to_real 1) (to_real 4))) (real_2_U (+ (U_2_real (MapType1Select Mask@7 null (wand_2 x@@8 (/ (to_real 2) (to_real 4)) x@@8 0 x@@8 (/ (to_real 1) (to_real 4)) x@@8 0 x@@8 (/ (to_real 2) (to_real 4)) x@@8 (/ (to_real 1) (to_real 4))))) FullPerm)))) (=> (and (and (state Heap@6 Mask@8) (state Heap@6 Mask@8)) (and (state Heap@6 Mask@8) (= perm@2 (/ (to_real 1) (to_real 4))))) (and (=> (= (ControlFlow 0 5) (- 0 6)) (>= perm@2 NoPerm)) (=> (>= perm@2 NoPerm) (and (=> (= (ControlFlow 0 5) 2) anon74_Then_correct) (=> (= (ControlFlow 0 5) 4) anon74_Else_correct))))))))
(let ((anon33_correct  (and (=> (= (ControlFlow 0 24) (- 0 25)) (=> (and (and b_11@8 b_11@8) b_12@18) (and (= neededTransfer@14 0.0) (= (U_2_real (MapType1Select Used_5Mask@11 x@@8 f_7)) initNeededTransfer@1)))) (=> (=> (and (and b_11@8 b_11@8) b_12@18) (and (= neededTransfer@14 0.0) (= (U_2_real (MapType1Select Used_5Mask@11 x@@8 f_7)) initNeededTransfer@1))) (=> (= b_14@0  (and b_11@8 b_12@18)) (=> (and (and (and (= b_14@1  (and b_14@0 (state Result_5Heap Result_5Mask))) (= b_14@2  (and b_14@1 (sumMask Result_5Mask Ops_5Mask Used_5Mask@11)))) (and (= b_14@3  (and (and b_14@2 (IdenticalOnKnownLocations Ops_5Heap@0 Result_5Heap Ops_5Mask)) (IdenticalOnKnownLocations Used_5Heap@0 Result_5Heap Used_5Mask@11))) (= b_14@4  (and b_14@3 (state Result_5Heap Result_5Mask))))) (and (and (= b_11@10  (and b_11@8 b_14@4)) (= Heap@6 Heap@5)) (and (= Mask@7 Mask@6) (= (ControlFlow 0 24) 5)))) anon47_correct))))))
(let ((anon67_Else_correct  (=> (>= 0.0 takeTransfer@5) (=> (and (= neededTransfer@14 neededTransfer@12) (= b_12@18 b_12@15)) (=> (and (and (= Mask@6 Mask@2) (= Used_5Mask@11 Used_5Mask@9)) (and (= Heap@5 Heap@1) (= (ControlFlow 0 28) 24))) anon33_correct)))))
(let ((anon67_Then_correct  (=> (> takeTransfer@5 0.0) (=> (and (and (= neededTransfer@13 (- neededTransfer@12 takeTransfer@5)) (= Used_5Mask@10 (MapType1Store Used_5Mask@9 x@@8 f_7 (real_2_U (+ (U_2_real (MapType1Select Used_5Mask@9 x@@8 f_7)) takeTransfer@5))))) (and (= b_12@16  (and b_12@15 (state Used_5Heap@0 Used_5Mask@10))) (= b_12@17  (and b_12@16 (= (U_2_int (MapType0Select Heap@1 x@@8 f_7)) (U_2_int (MapType0Select Used_5Heap@0 x@@8 f_7))))))) (=> (and (and (and (= Mask@5 (MapType1Store Mask@2 x@@8 f_7 (real_2_U (- (U_2_real (MapType1Select Mask@2 x@@8 f_7)) takeTransfer@5)))) (= Heap@4 (MapType0Store Heap@1 null (|wand_2#sm| x@@8 (/ (to_real 2) (to_real 4)) x@@8 0 x@@8 (/ (to_real 1) (to_real 4)) x@@8 0 x@@8 (/ (to_real 2) (to_real 4)) x@@8 (/ (to_real 1) (to_real 4))) (MapType1Store (MapType0Select Heap@1 null (|wand_2#sm| x@@8 (/ (to_real 2) (to_real 4)) x@@8 0 x@@8 (/ (to_real 1) (to_real 4)) x@@8 0 x@@8 (/ (to_real 2) (to_real 4)) x@@8 (/ (to_real 1) (to_real 4)))) x@@8 f_7 (bool_2_U true))))) (and (= neededTransfer@14 neededTransfer@13) (= b_12@18 b_12@17))) (and (and (= Mask@6 Mask@5) (= Used_5Mask@11 Used_5Mask@10)) (and (= Heap@5 Heap@4) (= (ControlFlow 0 27) 24)))) anon33_correct)))))
(let ((anon66_Else_correct  (=> (and (< maskTransfer@5 neededTransfer@12) (= takeTransfer@5 maskTransfer@5)) (and (=> (= (ControlFlow 0 30) 27) anon67_Then_correct) (=> (= (ControlFlow 0 30) 28) anon67_Else_correct)))))
(let ((anon66_Then_correct  (=> (and (<= neededTransfer@12 maskTransfer@5) (= takeTransfer@5 neededTransfer@12)) (and (=> (= (ControlFlow 0 29) 27) anon67_Then_correct) (=> (= (ControlFlow 0 29) 28) anon67_Else_correct)))))
(let ((anon65_Then_correct  (=> (and (and (and (and (and b_11@8 b_11@8) b_12@15) true) (> neededTransfer@12 0.0)) (= maskTransfer@5 (U_2_real (MapType1Select Mask@2 x@@8 f_7)))) (and (=> (= (ControlFlow 0 31) 29) anon66_Then_correct) (=> (= (ControlFlow 0 31) 30) anon66_Else_correct)))))
(let ((anon65_Else_correct  (=> (not (and (and (and (and b_11@8 b_11@8) b_12@15) true) (> neededTransfer@12 0.0))) (=> (and (= neededTransfer@14 neededTransfer@12) (= b_12@18 b_12@15)) (=> (and (and (= Mask@6 Mask@2) (= Used_5Mask@11 Used_5Mask@9)) (and (= Heap@5 Heap@1) (= (ControlFlow 0 26) 24))) anon33_correct)))))
(let ((anon64_Else_correct  (=> (and (and (>= 0.0 takeTransfer@4) (= Used_5Mask@9 Used_5Mask@3)) (and (= b_12@15 b_12@6) (= neededTransfer@12 neededTransfer@5))) (and (=> (= (ControlFlow 0 34) 31) anon65_Then_correct) (=> (= (ControlFlow 0 34) 26) anon65_Else_correct)))))
(let ((anon64_Then_correct  (=> (> takeTransfer@4 0.0) (=> (and (and (and (= neededTransfer@11 (- neededTransfer@5 takeTransfer@4)) (= Used_5Mask@8 (MapType1Store Used_5Mask@3 x@@8 f_7 (real_2_U (+ (U_2_real (MapType1Select Used_5Mask@3 x@@8 f_7)) takeTransfer@4))))) (and (= b_12@13  (and b_12@6 (state Used_5Heap@0 Used_5Mask@8))) (= b_12@14  (and b_12@13 (= (U_2_int (MapType0Select Ops_5Heap@0 x@@8 f_7)) (U_2_int (MapType0Select Used_5Heap@0 x@@8 f_7))))))) (and (and (= Ops_5Mask@6 (MapType1Store Ops_5Mask@4 x@@8 f_7 (real_2_U (- (U_2_real (MapType1Select Ops_5Mask@4 x@@8 f_7)) takeTransfer@4)))) (= Used_5Mask@9 Used_5Mask@8)) (and (= b_12@15 b_12@14) (= neededTransfer@12 neededTransfer@11)))) (and (=> (= (ControlFlow 0 33) 31) anon65_Then_correct) (=> (= (ControlFlow 0 33) 26) anon65_Else_correct))))))
(let ((anon63_Else_correct  (=> (and (< maskTransfer@4 neededTransfer@5) (= takeTransfer@4 maskTransfer@4)) (and (=> (= (ControlFlow 0 36) 33) anon64_Then_correct) (=> (= (ControlFlow 0 36) 34) anon64_Else_correct)))))
(let ((anon63_Then_correct  (=> (and (<= neededTransfer@5 maskTransfer@4) (= takeTransfer@4 neededTransfer@5)) (and (=> (= (ControlFlow 0 35) 33) anon64_Then_correct) (=> (= (ControlFlow 0 35) 34) anon64_Else_correct)))))
(let ((anon62_Then_correct  (=> (and (and (and (and (and b_11@8 b_11@8) b_12@6) true) (> neededTransfer@5 0.0)) (= maskTransfer@4 (U_2_real (MapType1Select Ops_5Mask@4 x@@8 f_7)))) (and (=> (= (ControlFlow 0 37) 35) anon63_Then_correct) (=> (= (ControlFlow 0 37) 36) anon63_Else_correct)))))
(let ((anon62_Else_correct  (=> (and (and (not (and (and (and (and b_11@8 b_11@8) b_12@6) true) (> neededTransfer@5 0.0))) (= Used_5Mask@9 Used_5Mask@3)) (and (= b_12@15 b_12@6) (= neededTransfer@12 neededTransfer@5))) (and (=> (= (ControlFlow 0 32) 31) anon65_Then_correct) (=> (= (ControlFlow 0 32) 26) anon65_Else_correct)))))
(let ((anon61_Then_correct  (=> (> (U_2_int (MapType0Select Result_4Heap x@@8 f_7)) 0) (=> (and (= neededTransfer@5 (/ (to_real 2) (to_real 4))) (= initNeededTransfer@1 (+ (U_2_real (MapType1Select Used_5Mask@3 x@@8 f_7)) neededTransfer@5))) (and (=> (= (ControlFlow 0 38) (- 0 39)) (>= neededTransfer@5 0.0)) (=> (>= neededTransfer@5 0.0) (and (=> (= (ControlFlow 0 38) 37) anon62_Then_correct) (=> (= (ControlFlow 0 38) 32) anon62_Else_correct))))))))
(let ((anon46_correct  (and (=> (= (ControlFlow 0 8) (- 0 9)) (=> (and (and b_11@8 b_11@8) b_12@12) (and (= neededTransfer@10 0.0) (= (U_2_real (MapType1Select Used_5Mask@7 x@@8 f_7)) initNeededTransfer@2)))) (=> (=> (and (and b_11@8 b_11@8) b_12@12) (and (= neededTransfer@10 0.0) (= (U_2_real (MapType1Select Used_5Mask@7 x@@8 f_7)) initNeededTransfer@2))) (=> (= b_15@0  (and b_11@8 b_12@12)) (=> (and (and (and (= b_15@1  (and b_15@0 (state Result_6Heap Result_6Mask))) (= b_15@2  (and b_15@1 (sumMask Result_6Mask Ops_5Mask Used_5Mask@7)))) (and (= b_15@3  (and (and b_15@2 (IdenticalOnKnownLocations Ops_5Heap@0 Result_6Heap Ops_5Mask)) (IdenticalOnKnownLocations Used_5Heap@0 Result_6Heap Used_5Mask@7))) (= b_15@4  (and b_15@3 (state Result_6Heap Result_6Mask))))) (and (and (= b_11@9  (and b_11@8 b_15@4)) (= Heap@6 Heap@3)) (and (= Mask@7 Mask@4) (= (ControlFlow 0 8) 5)))) anon47_correct))))))
(let ((anon73_Else_correct  (=> (>= 0.0 takeTransfer@3) (=> (and (= neededTransfer@10 neededTransfer@8) (= b_12@12 b_12@9)) (=> (and (and (= Mask@4 Mask@2) (= Used_5Mask@7 Used_5Mask@5)) (and (= Heap@3 Heap@1) (= (ControlFlow 0 12) 8))) anon46_correct)))))
(let ((anon73_Then_correct  (=> (> takeTransfer@3 0.0) (=> (and (and (= neededTransfer@9 (- neededTransfer@8 takeTransfer@3)) (= Used_5Mask@6 (MapType1Store Used_5Mask@5 x@@8 f_7 (real_2_U (+ (U_2_real (MapType1Select Used_5Mask@5 x@@8 f_7)) takeTransfer@3))))) (and (= b_12@10  (and b_12@9 (state Used_5Heap@0 Used_5Mask@6))) (= b_12@11  (and b_12@10 (= (U_2_int (MapType0Select Heap@1 x@@8 f_7)) (U_2_int (MapType0Select Used_5Heap@0 x@@8 f_7))))))) (=> (and (and (and (= Mask@3 (MapType1Store Mask@2 x@@8 f_7 (real_2_U (- (U_2_real (MapType1Select Mask@2 x@@8 f_7)) takeTransfer@3)))) (= Heap@2 (MapType0Store Heap@1 null (|wand_2#sm| x@@8 (/ (to_real 2) (to_real 4)) x@@8 0 x@@8 (/ (to_real 1) (to_real 4)) x@@8 0 x@@8 (/ (to_real 2) (to_real 4)) x@@8 (/ (to_real 1) (to_real 4))) (MapType1Store (MapType0Select Heap@1 null (|wand_2#sm| x@@8 (/ (to_real 2) (to_real 4)) x@@8 0 x@@8 (/ (to_real 1) (to_real 4)) x@@8 0 x@@8 (/ (to_real 2) (to_real 4)) x@@8 (/ (to_real 1) (to_real 4)))) x@@8 f_7 (bool_2_U true))))) (and (= neededTransfer@10 neededTransfer@9) (= b_12@12 b_12@11))) (and (and (= Mask@4 Mask@3) (= Used_5Mask@7 Used_5Mask@6)) (and (= Heap@3 Heap@2) (= (ControlFlow 0 11) 8)))) anon46_correct)))))
(let ((anon72_Else_correct  (=> (and (< maskTransfer@3 neededTransfer@8) (= takeTransfer@3 maskTransfer@3)) (and (=> (= (ControlFlow 0 14) 11) anon73_Then_correct) (=> (= (ControlFlow 0 14) 12) anon73_Else_correct)))))
(let ((anon72_Then_correct  (=> (and (<= neededTransfer@8 maskTransfer@3) (= takeTransfer@3 neededTransfer@8)) (and (=> (= (ControlFlow 0 13) 11) anon73_Then_correct) (=> (= (ControlFlow 0 13) 12) anon73_Else_correct)))))
(let ((anon71_Then_correct  (=> (and (and (and (and (and b_11@8 b_11@8) b_12@9) true) (> neededTransfer@8 0.0)) (= maskTransfer@3 (U_2_real (MapType1Select Mask@2 x@@8 f_7)))) (and (=> (= (ControlFlow 0 15) 13) anon72_Then_correct) (=> (= (ControlFlow 0 15) 14) anon72_Else_correct)))))
(let ((anon71_Else_correct  (=> (not (and (and (and (and b_11@8 b_11@8) b_12@9) true) (> neededTransfer@8 0.0))) (=> (and (= neededTransfer@10 neededTransfer@8) (= b_12@12 b_12@9)) (=> (and (and (= Mask@4 Mask@2) (= Used_5Mask@7 Used_5Mask@5)) (and (= Heap@3 Heap@1) (= (ControlFlow 0 10) 8))) anon46_correct)))))
(let ((anon70_Else_correct  (=> (and (and (>= 0.0 takeTransfer@2) (= Used_5Mask@5 Used_5Mask@3)) (and (= b_12@9 b_12@6) (= neededTransfer@8 neededTransfer@6))) (and (=> (= (ControlFlow 0 18) 15) anon71_Then_correct) (=> (= (ControlFlow 0 18) 10) anon71_Else_correct)))))
(let ((anon70_Then_correct  (=> (> takeTransfer@2 0.0) (=> (and (and (and (= neededTransfer@7 (- neededTransfer@6 takeTransfer@2)) (= Used_5Mask@4 (MapType1Store Used_5Mask@3 x@@8 f_7 (real_2_U (+ (U_2_real (MapType1Select Used_5Mask@3 x@@8 f_7)) takeTransfer@2))))) (and (= b_12@7  (and b_12@6 (state Used_5Heap@0 Used_5Mask@4))) (= b_12@8  (and b_12@7 (= (U_2_int (MapType0Select Ops_5Heap@0 x@@8 f_7)) (U_2_int (MapType0Select Used_5Heap@0 x@@8 f_7))))))) (and (and (= Ops_5Mask@5 (MapType1Store Ops_5Mask@4 x@@8 f_7 (real_2_U (- (U_2_real (MapType1Select Ops_5Mask@4 x@@8 f_7)) takeTransfer@2)))) (= Used_5Mask@5 Used_5Mask@4)) (and (= b_12@9 b_12@8) (= neededTransfer@8 neededTransfer@7)))) (and (=> (= (ControlFlow 0 17) 15) anon71_Then_correct) (=> (= (ControlFlow 0 17) 10) anon71_Else_correct))))))
(let ((anon69_Else_correct  (=> (and (< maskTransfer@2 neededTransfer@6) (= takeTransfer@2 maskTransfer@2)) (and (=> (= (ControlFlow 0 20) 17) anon70_Then_correct) (=> (= (ControlFlow 0 20) 18) anon70_Else_correct)))))
(let ((anon69_Then_correct  (=> (and (<= neededTransfer@6 maskTransfer@2) (= takeTransfer@2 neededTransfer@6)) (and (=> (= (ControlFlow 0 19) 17) anon70_Then_correct) (=> (= (ControlFlow 0 19) 18) anon70_Else_correct)))))
(let ((anon68_Then_correct  (=> (and (and (and (and (and b_11@8 b_11@8) b_12@6) true) (> neededTransfer@6 0.0)) (= maskTransfer@2 (U_2_real (MapType1Select Ops_5Mask@4 x@@8 f_7)))) (and (=> (= (ControlFlow 0 21) 19) anon69_Then_correct) (=> (= (ControlFlow 0 21) 20) anon69_Else_correct)))))
(let ((anon68_Else_correct  (=> (and (and (not (and (and (and (and b_11@8 b_11@8) b_12@6) true) (> neededTransfer@6 0.0))) (= Used_5Mask@5 Used_5Mask@3)) (and (= b_12@9 b_12@6) (= neededTransfer@8 neededTransfer@6))) (and (=> (= (ControlFlow 0 16) 15) anon71_Then_correct) (=> (= (ControlFlow 0 16) 10) anon71_Else_correct)))))
(let ((anon61_Else_correct  (=> (>= 0 (U_2_int (MapType0Select Result_4Heap x@@8 f_7))) (=> (and (= neededTransfer@6 (/ (to_real 1) (to_real 4))) (= initNeededTransfer@2 (+ (U_2_real (MapType1Select Used_5Mask@3 x@@8 f_7)) neededTransfer@6))) (and (=> (= (ControlFlow 0 22) (- 0 23)) (>= neededTransfer@6 0.0)) (=> (>= neededTransfer@6 0.0) (and (=> (= (ControlFlow 0 22) 21) anon68_Then_correct) (=> (= (ControlFlow 0 22) 16) anon68_Else_correct))))))))
(let ((anon60_Then_correct  (=> (and b_11@8 b_11@8) (and (=> (= (ControlFlow 0 40) 38) anon61_Then_correct) (=> (= (ControlFlow 0 40) 22) anon61_Else_correct)))))
(let ((anon60_Else_correct  (=> (and (and (not (and b_11@8 b_11@8)) (= Heap@6 Heap@1)) (and (= Mask@7 Mask@2) (= (ControlFlow 0 7) 5))) anon47_correct)))
(let ((anon19_correct  (and (=> (= (ControlFlow 0 41) (- 0 42)) (=> (and (and b_11@7 b_11@7) b_12@6) (and (= neededTransfer@4 0.0) (= (U_2_real (MapType1Select Used_5Mask@3 x@@8 f_7)) initNeededTransfer@0)))) (=> (=> (and (and b_11@7 b_11@7) b_12@6) (and (= neededTransfer@4 0.0) (= (U_2_real (MapType1Select Used_5Mask@3 x@@8 f_7)) initNeededTransfer@0))) (=> (and (= b_13@0  (and b_11@7 b_12@6)) (= b_13@1  (and b_13@0 (state Result_4Heap Result_4Mask)))) (=> (and (and (= b_13@2  (and b_13@1 (sumMask Result_4Mask Ops_5Mask@4 Used_5Mask@3))) (= b_13@3  (and (and b_13@2 (IdenticalOnKnownLocations Ops_5Heap@0 Result_4Heap Ops_5Mask@4)) (IdenticalOnKnownLocations Used_5Heap@0 Result_4Heap Used_5Mask@3)))) (and (= b_13@4  (and b_13@3 (state Result_4Heap Result_4Mask))) (= b_11@8  (and b_11@7 b_13@4)))) (and (=> (= (ControlFlow 0 41) 40) anon60_Then_correct) (=> (= (ControlFlow 0 41) 7) anon60_Else_correct))))))))
(let ((anon59_Else_correct  (=> (>= 0.0 takeTransfer@1) (=> (and (= Mask@2 Mask@0) (= neededTransfer@4 neededTransfer@2)) (=> (and (and (= b_12@6 b_12@3) (= Used_5Mask@3 Used_5Mask@1)) (and (= Heap@1 Heap@@9) (= (ControlFlow 0 45) 41))) anon19_correct)))))
(let ((anon59_Then_correct  (=> (> takeTransfer@1 0.0) (=> (and (and (= neededTransfer@3 (- neededTransfer@2 takeTransfer@1)) (= Used_5Mask@2 (MapType1Store Used_5Mask@1 x@@8 f_7 (real_2_U (+ (U_2_real (MapType1Select Used_5Mask@1 x@@8 f_7)) takeTransfer@1))))) (and (= b_12@4  (and b_12@3 (state Used_5Heap@0 Used_5Mask@2))) (= b_12@5  (and b_12@4 (= (U_2_int (MapType0Select Heap@@9 x@@8 f_7)) (U_2_int (MapType0Select Used_5Heap@0 x@@8 f_7))))))) (=> (and (and (and (= Mask@1 (MapType1Store Mask@0 x@@8 f_7 (real_2_U (- (U_2_real (MapType1Select Mask@0 x@@8 f_7)) takeTransfer@1)))) (= Heap@0 (MapType0Store Heap@@9 null (|wand_2#sm| x@@8 (/ (to_real 2) (to_real 4)) x@@8 0 x@@8 (/ (to_real 1) (to_real 4)) x@@8 0 x@@8 (/ (to_real 2) (to_real 4)) x@@8 (/ (to_real 1) (to_real 4))) (MapType1Store (MapType0Select Heap@@9 null (|wand_2#sm| x@@8 (/ (to_real 2) (to_real 4)) x@@8 0 x@@8 (/ (to_real 1) (to_real 4)) x@@8 0 x@@8 (/ (to_real 2) (to_real 4)) x@@8 (/ (to_real 1) (to_real 4)))) x@@8 f_7 (bool_2_U true))))) (and (= Mask@2 Mask@1) (= neededTransfer@4 neededTransfer@3))) (and (and (= b_12@6 b_12@5) (= Used_5Mask@3 Used_5Mask@2)) (and (= Heap@1 Heap@0) (= (ControlFlow 0 44) 41)))) anon19_correct)))))
(let ((anon58_Else_correct  (=> (and (< maskTransfer@1 neededTransfer@2) (= takeTransfer@1 maskTransfer@1)) (and (=> (= (ControlFlow 0 47) 44) anon59_Then_correct) (=> (= (ControlFlow 0 47) 45) anon59_Else_correct)))))
(let ((anon58_Then_correct  (=> (and (<= neededTransfer@2 maskTransfer@1) (= takeTransfer@1 neededTransfer@2)) (and (=> (= (ControlFlow 0 46) 44) anon59_Then_correct) (=> (= (ControlFlow 0 46) 45) anon59_Else_correct)))))
(let ((anon57_Then_correct  (=> (and (and (and (and (and b_11@7 b_11@7) b_12@3) true) (> neededTransfer@2 0.0)) (= maskTransfer@1 (U_2_real (MapType1Select Mask@0 x@@8 f_7)))) (and (=> (= (ControlFlow 0 48) 46) anon58_Then_correct) (=> (= (ControlFlow 0 48) 47) anon58_Else_correct)))))
(let ((anon57_Else_correct  (=> (not (and (and (and (and b_11@7 b_11@7) b_12@3) true) (> neededTransfer@2 0.0))) (=> (and (= Mask@2 Mask@0) (= neededTransfer@4 neededTransfer@2)) (=> (and (and (= b_12@6 b_12@3) (= Used_5Mask@3 Used_5Mask@1)) (and (= Heap@1 Heap@@9) (= (ControlFlow 0 43) 41))) anon19_correct)))))
(let ((anon56_Else_correct  (=> (>= 0.0 takeTransfer@0) (=> (and (and (= Ops_5Mask@4 Ops_5Mask@2) (= Used_5Mask@1 ZeroMask)) (and (= b_12@3 b_12@0) (= neededTransfer@2 neededTransfer@0))) (and (=> (= (ControlFlow 0 51) 48) anon57_Then_correct) (=> (= (ControlFlow 0 51) 43) anon57_Else_correct))))))
(let ((anon56_Then_correct  (=> (and (> takeTransfer@0 0.0) (= neededTransfer@1 (- neededTransfer@0 takeTransfer@0))) (=> (and (and (and (= Used_5Mask@0 (MapType1Store ZeroMask x@@8 f_7 (real_2_U (+ (U_2_real (MapType1Select ZeroMask x@@8 f_7)) takeTransfer@0)))) (= b_12@1  (and b_12@0 (state Used_5Heap@0 Used_5Mask@0)))) (and (= b_12@2  (and b_12@1 (= (U_2_int (MapType0Select Ops_5Heap@0 x@@8 f_7)) (U_2_int (MapType0Select Used_5Heap@0 x@@8 f_7))))) (= Ops_5Mask@3 (MapType1Store Ops_5Mask@2 x@@8 f_7 (real_2_U (- (U_2_real (MapType1Select Ops_5Mask@2 x@@8 f_7)) takeTransfer@0)))))) (and (and (= Ops_5Mask@4 Ops_5Mask@3) (= Used_5Mask@1 Used_5Mask@0)) (and (= b_12@3 b_12@2) (= neededTransfer@2 neededTransfer@1)))) (and (=> (= (ControlFlow 0 50) 48) anon57_Then_correct) (=> (= (ControlFlow 0 50) 43) anon57_Else_correct))))))
(let ((anon55_Else_correct  (=> (and (< maskTransfer@0 neededTransfer@0) (= takeTransfer@0 maskTransfer@0)) (and (=> (= (ControlFlow 0 53) 50) anon56_Then_correct) (=> (= (ControlFlow 0 53) 51) anon56_Else_correct)))))
(let ((anon55_Then_correct  (=> (and (<= neededTransfer@0 maskTransfer@0) (= takeTransfer@0 neededTransfer@0)) (and (=> (= (ControlFlow 0 52) 50) anon56_Then_correct) (=> (= (ControlFlow 0 52) 51) anon56_Else_correct)))))
(let ((anon54_Then_correct  (=> (and (and (and (and (and b_11@7 b_11@7) b_12@0) true) (> neededTransfer@0 0.0)) (= maskTransfer@0 (U_2_real (MapType1Select Ops_5Mask@2 x@@8 f_7)))) (and (=> (= (ControlFlow 0 54) 52) anon55_Then_correct) (=> (= (ControlFlow 0 54) 53) anon55_Else_correct)))))
(let ((anon54_Else_correct  (=> (not (and (and (and (and b_11@7 b_11@7) b_12@0) true) (> neededTransfer@0 0.0))) (=> (and (and (= Ops_5Mask@4 Ops_5Mask@2) (= Used_5Mask@1 ZeroMask)) (and (= b_12@3 b_12@0) (= neededTransfer@2 neededTransfer@0))) (and (=> (= (ControlFlow 0 49) 48) anon57_Then_correct) (=> (= (ControlFlow 0 49) 43) anon57_Else_correct))))))
(let ((anon7_correct  (=> (= b_11@6  (and b_11@5 (state Ops_5Heap@0 Ops_5Mask@2))) (=> (and (and (= b_11@7  (and b_11@6 (state Ops_5Heap@0 Ops_5Mask@2))) (= b_12@0  (and b_12 (state Used_5Heap@0 ZeroMask)))) (and (= neededTransfer@0 (/ (to_real 1) (to_real 4))) (= initNeededTransfer@0 (+ (U_2_real (MapType1Select ZeroMask x@@8 f_7)) neededTransfer@0)))) (and (=> (= (ControlFlow 0 55) (- 0 56)) (>= neededTransfer@0 0.0)) (=> (>= neededTransfer@0 0.0) (and (=> (= (ControlFlow 0 55) 54) anon54_Then_correct) (=> (= (ControlFlow 0 55) 49) anon54_Else_correct))))))))
(let ((anon6_correct  (=> (and (and (= b_11@4  (and b_11@3 (> (U_2_int (MapType0Select Ops_5Heap@0 x@@8 f_7)) 0))) (= b_11@5 b_11@4)) (and (= Ops_5Mask@2 Ops_5Mask@1) (= (ControlFlow 0 59) 55))) anon7_correct)))
(let ((anon53_Else_correct  (=> (and (not b_11@3) (= (ControlFlow 0 62) 59)) anon6_correct)))
(let ((anon53_Then_correct  (=> b_11@3 (and (=> (= (ControlFlow 0 60) (- 0 61)) (HasDirectPerm Ops_5Mask@1 x@@8 f_7)) (=> (HasDirectPerm Ops_5Mask@1 x@@8 f_7) (=> (= (ControlFlow 0 60) 59) anon6_correct))))))
(let ((anon52_Then_correct  (=> b_11@3 (and (=> (= (ControlFlow 0 63) 60) anon53_Then_correct) (=> (= (ControlFlow 0 63) 62) anon53_Else_correct)))))
(let ((anon52_Else_correct  (=> (and (and (not b_11@3) (= b_11@5 b_11@3)) (and (= Ops_5Mask@2 Ops_5Mask@1) (= (ControlFlow 0 58) 55))) anon7_correct)))
(let ((anon51_Else_correct  (=> (not b_11@0) (=> (and (= Ops_5Mask@1 ZeroMask) (= b_11@3 b_11@0)) (and (=> (= (ControlFlow 0 66) 63) anon52_Then_correct) (=> (= (ControlFlow 0 66) 58) anon52_Else_correct))))))
(let ((anon51_Then_correct  (=> (and b_11@0 (= perm@1 (/ (to_real 2) (to_real 4)))) (and (=> (= (ControlFlow 0 64) (- 0 65)) (>= perm@1 NoPerm)) (=> (>= perm@1 NoPerm) (=> (= b_11@1  (and b_11@0 (=> (> perm@1 NoPerm) (not (= x@@8 null))))) (=> (and (and (= Ops_5Mask@0 (MapType1Store ZeroMask x@@8 f_7 (real_2_U (+ (U_2_real (MapType1Select ZeroMask x@@8 f_7)) perm@1)))) (= b_11@2  (and b_11@1 (state Ops_5Heap@0 Ops_5Mask@0)))) (and (= Ops_5Mask@1 Ops_5Mask@0) (= b_11@3 b_11@2))) (and (=> (= (ControlFlow 0 64) 63) anon52_Then_correct) (=> (= (ControlFlow 0 64) 58) anon52_Else_correct)))))))))
(let ((anon50_Then_correct  (=> b_11@0 (and (=> (= (ControlFlow 0 67) 64) anon51_Then_correct) (=> (= (ControlFlow 0 67) 66) anon51_Else_correct)))))
(let ((anon50_Else_correct  (=> (and (and (not b_11@0) (= b_11@5 b_11@0)) (and (= Ops_5Mask@2 ZeroMask) (= (ControlFlow 0 57) 55))) anon7_correct)))
(let ((anon0_correct  (=> (state Heap@@9 ZeroMask) (=> (and (U_2_bool (MapType0Select Heap@@9 x@@8 $allocated)) (= perm@0 (/ (to_real 2) (to_real 4)))) (and (=> (= (ControlFlow 0 68) (- 0 69)) (>= perm@0 NoPerm)) (=> (>= perm@0 NoPerm) (=> (=> (> perm@0 NoPerm) (not (= x@@8 null))) (=> (and (= Mask@0 (MapType1Store ZeroMask x@@8 f_7 (real_2_U (+ (U_2_real (MapType1Select ZeroMask x@@8 f_7)) perm@0)))) (state Heap@@9 Mask@0)) (=> (and (and (state Heap@@9 Mask@0) (state Heap@@9 Mask@0)) (and (= b_11@0  (and b_11 (state Ops_5Heap@0 ZeroMask))) (= b_10@0  (and b_10 (state Used_4Heap@0 ZeroMask))))) (and (=> (= (ControlFlow 0 68) 67) anon50_Then_correct) (=> (= (ControlFlow 0 68) 57) anon50_Else_correct)))))))))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 70) 68) anon0_correct)))
PreconditionGeneratedEntry_correct))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
))
(check-sat)
(pop 1)
; Valid
(get-info :rlimit)
