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
(declare-fun h () T@U)
(declare-fun FieldType (T@T T@T) T@T)
(declare-fun FieldTypeInv0 (T@T) T@T)
(declare-fun FieldTypeInv1 (T@T) T@T)
(declare-fun NormalFieldType () T@T)
(declare-fun RefType () T@T)
(declare-fun WandMaskField (T@U) T@U)
(declare-fun |wand#ft| (T@U Real T@U Real T@U T@U Real Real) T@U)
(declare-fun |wand#sm| (T@U Real T@U Real T@U T@U Real Real) T@U)
(declare-fun MapType0Type (T@T T@T) T@T)
(declare-fun MapType0TypeInv0 (T@T) T@T)
(declare-fun MapType0TypeInv1 (T@T) T@T)
(declare-fun MapType0Select (T@U T@U T@U) T@U)
(declare-fun MapType0Store (T@U T@U T@U T@U) T@U)
(declare-fun WandType_wandType () T@T)
(declare-fun FrameTypeType () T@T)
(declare-fun succHeap (T@U T@U) Bool)
(declare-fun MapType1Type (T@T) T@T)
(declare-fun succHeapTrans (T@U T@U) Bool)
(declare-fun MapType1TypeInv0 (T@T) T@T)
(declare-fun MapType1Select (T@U T@U T@U) T@U)
(declare-fun MapType1Store (T@U T@U T@U T@U) T@U)
(declare-fun state (T@U T@U) Bool)
(declare-fun GoodMask (T@U) Bool)
(declare-fun IdenticalOnKnownLocations (T@U T@U T@U) Bool)
(declare-fun IsPredicateField (T@U) Bool)
(declare-fun null () T@U)
(declare-fun PredicateMaskField (T@U) T@U)
(declare-fun HasDirectPerm (T@U T@U T@U) Bool)
(declare-fun IsWandField (T@U) Bool)
(declare-fun wand (T@U Real T@U Real T@U T@U Real Real) T@U)
(declare-fun dummyHeap () T@U)
(declare-fun ZeroMask () T@U)
(declare-fun wand_1 (T@U Real T@U Real T@U T@U Real Real T@U T@U Real Real) T@U)
(declare-fun getPredWandId (T@U) Int)
(declare-fun WandType_wand_1Type () T@T)
(declare-fun wand_2 (T@U Real T@U Real T@U T@U Real Real T@U T@U Real Real) T@U)
(declare-fun WandType_wand_2Type () T@T)
(declare-fun InsidePredicate (T@U T@U T@U T@U) Bool)
(declare-fun sumMask (T@U T@U T@U) Bool)
(declare-fun |wand_1#ft| (T@U Real T@U Real T@U T@U Real Real T@U T@U Real Real) T@U)
(declare-fun |wand_2#ft| (T@U Real T@U Real T@U T@U Real Real T@U T@U Real Real) T@U)
(declare-fun ConditionalFrame (Real T@U) T@U)
(declare-fun EmptyFrame () T@U)
(declare-fun NoPerm () Real)
(declare-fun FullPerm () Real)
(declare-fun |wand_1#sm| (T@U Real T@U Real T@U T@U Real Real T@U T@U Real Real) T@U)
(declare-fun |wand_2#sm| (T@U Real T@U Real T@U T@U Real Real T@U T@U Real Real) T@U)
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
(assert  (and (and (and (and (and (and (and (and (forall ((arg0@@11 T@T) (arg1 T@T) ) (! (= (Ctor (FieldType arg0@@11 arg1)) 6)
 :qid |ctor:FieldType|
)) (forall ((arg0@@12 T@T) (arg1@@0 T@T) ) (! (= (FieldTypeInv0 (FieldType arg0@@12 arg1@@0)) arg0@@12)
 :qid |typeInv:FieldTypeInv0|
 :pattern ( (FieldType arg0@@12 arg1@@0))
))) (forall ((arg0@@13 T@T) (arg1@@1 T@T) ) (! (= (FieldTypeInv1 (FieldType arg0@@13 arg1@@1)) arg1@@1)
 :qid |typeInv:FieldTypeInv1|
 :pattern ( (FieldType arg0@@13 arg1@@1))
))) (= (Ctor NormalFieldType) 7)) (= (type $allocated) (FieldType NormalFieldType boolType))) (= (type f_7) (FieldType NormalFieldType boolType))) (= (type g) (FieldType NormalFieldType intType))) (= (Ctor RefType) 8)) (= (type h) (FieldType NormalFieldType RefType))))
(assert (distinct $allocated f_7 g h)
)
(assert  (and (and (and (and (and (and (and (and (and (and (and (forall ((arg0@@14 T@T) (arg1@@2 T@T) ) (! (= (Ctor (MapType0Type arg0@@14 arg1@@2)) 9)
 :qid |ctor:MapType0Type|
)) (forall ((arg0@@15 T@T) (arg1@@3 T@T) ) (! (= (MapType0TypeInv0 (MapType0Type arg0@@15 arg1@@3)) arg0@@15)
 :qid |typeInv:MapType0TypeInv0|
 :pattern ( (MapType0Type arg0@@15 arg1@@3))
))) (forall ((arg0@@16 T@T) (arg1@@4 T@T) ) (! (= (MapType0TypeInv1 (MapType0Type arg0@@16 arg1@@4)) arg1@@4)
 :qid |typeInv:MapType0TypeInv1|
 :pattern ( (MapType0Type arg0@@16 arg1@@4))
))) (forall ((arg0@@17 T@U) (arg1@@5 T@U) (arg2 T@U) ) (! (let ((aVar1 (MapType0TypeInv1 (type arg0@@17))))
(= (type (MapType0Select arg0@@17 arg1@@5 arg2)) aVar1))
 :qid |funType:MapType0Select|
 :pattern ( (MapType0Select arg0@@17 arg1@@5 arg2))
))) (forall ((arg0@@18 T@U) (arg1@@6 T@U) (arg2@@0 T@U) (arg3 T@U) ) (! (let ((aVar1@@0 (type arg3)))
(let ((aVar0 (type arg1@@6)))
(= (type (MapType0Store arg0@@18 arg1@@6 arg2@@0 arg3)) (MapType0Type aVar0 aVar1@@0))))
 :qid |funType:MapType0Store|
 :pattern ( (MapType0Store arg0@@18 arg1@@6 arg2@@0 arg3))
))) (forall ((m T@U) (x0 T@U) (x1 T@U) (val T@U) ) (! (let ((aVar1@@1 (MapType0TypeInv1 (type m))))
 (=> (= (type val) aVar1@@1) (= (MapType0Select (MapType0Store m x0 x1 val) x0 x1) val)))
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
)))) (forall ((arg0@@19 T@U) ) (! (let ((A (FieldTypeInv0 (type arg0@@19))))
(= (type (WandMaskField arg0@@19)) (FieldType A (MapType0Type RefType boolType))))
 :qid |funType:WandMaskField|
 :pattern ( (WandMaskField arg0@@19))
))) (= (Ctor WandType_wandType) 10)) (= (Ctor FrameTypeType) 11)) (forall ((arg0@@20 T@U) (arg1@@7 Real) (arg2@@1 T@U) (arg3@@0 Real) (arg4 T@U) (arg5 T@U) (arg6 Real) (arg7 Real) ) (! (= (type (|wand#ft| arg0@@20 arg1@@7 arg2@@1 arg3@@0 arg4 arg5 arg6 arg7)) (FieldType WandType_wandType FrameTypeType))
 :qid |funType:wand#ft|
 :pattern ( (|wand#ft| arg0@@20 arg1@@7 arg2@@1 arg3@@0 arg4 arg5 arg6 arg7))
))) (forall ((arg0@@21 T@U) (arg1@@8 Real) (arg2@@2 T@U) (arg3@@1 Real) (arg4@@0 T@U) (arg5@@0 T@U) (arg6@@0 Real) (arg7@@0 Real) ) (! (= (type (|wand#sm| arg0@@21 arg1@@8 arg2@@2 arg3@@1 arg4@@0 arg5@@0 arg6@@0 arg7@@0)) (FieldType WandType_wandType (MapType0Type RefType boolType)))
 :qid |funType:wand#sm|
 :pattern ( (|wand#sm| arg0@@21 arg1@@8 arg2@@2 arg3@@1 arg4@@0 arg5@@0 arg6@@0 arg7@@0))
))))
(assert (forall ((arg1@@9 T@U) (arg2@@3 Real) (arg3@@2 T@U) (arg4@@1 Real) (arg5@@1 T@U) (arg6@@1 T@U) (arg7@@1 Real) (arg8 Real) ) (!  (=> (and (and (and (= (type arg1@@9) RefType) (= (type arg3@@2) RefType)) (= (type arg5@@1) RefType)) (= (type arg6@@1) RefType)) (= (|wand#sm| arg1@@9 arg2@@3 arg3@@2 arg4@@1 arg5@@1 arg6@@1 arg7@@1 arg8) (WandMaskField (|wand#ft| arg1@@9 arg2@@3 arg3@@2 arg4@@1 arg5@@1 arg6@@1 arg7@@1 arg8))))
 :qid |stdinbpl.199:15|
 :skolemid |26|
 :pattern ( (WandMaskField (|wand#ft| arg1@@9 arg2@@3 arg3@@2 arg4@@1 arg5@@1 arg6@@1 arg7@@1 arg8)))
)))
(assert  (and (and (and (and (and (forall ((arg0@@22 T@T) ) (! (= (Ctor (MapType1Type arg0@@22)) 12)
 :qid |ctor:MapType1Type|
)) (forall ((arg0@@23 T@T) ) (! (= (MapType1TypeInv0 (MapType1Type arg0@@23)) arg0@@23)
 :qid |typeInv:MapType1TypeInv0|
 :pattern ( (MapType1Type arg0@@23))
))) (forall ((arg0@@24 T@U) (arg1@@10 T@U) (arg2@@4 T@U) ) (! (let ((B (FieldTypeInv1 (type arg2@@4))))
(= (type (MapType1Select arg0@@24 arg1@@10 arg2@@4)) B))
 :qid |funType:MapType1Select|
 :pattern ( (MapType1Select arg0@@24 arg1@@10 arg2@@4))
))) (forall ((arg0@@25 T@U) (arg1@@11 T@U) (arg2@@5 T@U) (arg3@@3 T@U) ) (! (let ((aVar0@@0 (type arg1@@11)))
(= (type (MapType1Store arg0@@25 arg1@@11 arg2@@5 arg3@@3)) (MapType1Type aVar0@@0)))
 :qid |funType:MapType1Store|
 :pattern ( (MapType1Store arg0@@25 arg1@@11 arg2@@5 arg3@@3))
))) (forall ((m@@3 T@U) (x0@@3 T@U) (x1@@3 T@U) (val@@3 T@U) ) (! (let ((B@@0 (FieldTypeInv1 (type x1@@3))))
 (=> (= (type val@@3) B@@0) (= (MapType1Select (MapType1Store m@@3 x0@@3 x1@@3 val@@3) x0@@3 x1@@3) val@@3)))
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
(assert (forall ((Heap0 T@U) (Heap1 T@U) ) (!  (=> (and (and (= (type Heap0) (MapType1Type RefType)) (= (type Heap1) (MapType1Type RefType))) (succHeap Heap0 Heap1)) (succHeapTrans Heap0 Heap1))
 :qid |stdinbpl.88:15|
 :skolemid |11|
 :pattern ( (succHeap Heap0 Heap1))
)))
(assert (forall ((Heap T@U) (Mask T@U) ) (!  (=> (and (and (= (type Heap) (MapType1Type RefType)) (= (type Mask) (MapType0Type RefType realType))) (state Heap Mask)) (GoodMask Mask))
 :qid |stdinbpl.124:15|
 :skolemid |15|
 :pattern ( (state Heap Mask))
)))
(assert (forall ((Heap0@@0 T@U) (Heap1@@0 T@U) (Heap2 T@U) ) (!  (=> (and (and (and (= (type Heap0@@0) (MapType1Type RefType)) (= (type Heap1@@0) (MapType1Type RefType))) (= (type Heap2) (MapType1Type RefType))) (and (succHeapTrans Heap0@@0 Heap1@@0) (succHeap Heap1@@0 Heap2))) (succHeapTrans Heap0@@0 Heap2))
 :qid |stdinbpl.93:15|
 :skolemid |12|
 :pattern ( (succHeapTrans Heap0@@0 Heap1@@0) (succHeap Heap1@@0 Heap2))
)))
(assert  (and (= (type null) RefType) (forall ((arg0@@26 T@U) ) (! (let ((A@@0 (FieldTypeInv0 (type arg0@@26))))
(= (type (PredicateMaskField arg0@@26)) (FieldType A@@0 (MapType0Type RefType boolType))))
 :qid |funType:PredicateMaskField|
 :pattern ( (PredicateMaskField arg0@@26))
))))
(assert (forall ((Heap@@0 T@U) (ExhaleHeap T@U) (Mask@@0 T@U) (pm_f T@U) ) (! (let ((C (FieldTypeInv0 (type pm_f))))
 (=> (and (and (and (and (and (= (type Heap@@0) (MapType1Type RefType)) (= (type ExhaleHeap) (MapType1Type RefType))) (= (type Mask@@0) (MapType0Type RefType realType))) (= (type pm_f) (FieldType C FrameTypeType))) (IdenticalOnKnownLocations Heap@@0 ExhaleHeap Mask@@0)) (and (HasDirectPerm Mask@@0 null pm_f) (IsPredicateField pm_f))) (= (MapType1Select Heap@@0 null (PredicateMaskField pm_f)) (MapType1Select ExhaleHeap null (PredicateMaskField pm_f)))))
 :qid |stdinbpl.47:19|
 :skolemid |2|
 :pattern ( (IdenticalOnKnownLocations Heap@@0 ExhaleHeap Mask@@0) (IsPredicateField pm_f) (MapType1Select ExhaleHeap null (PredicateMaskField pm_f)))
)))
(assert (forall ((Heap@@1 T@U) (ExhaleHeap@@0 T@U) (Mask@@1 T@U) (pm_f@@0 T@U) ) (! (let ((C@@0 (FieldTypeInv0 (type pm_f@@0))))
 (=> (and (and (and (and (and (= (type Heap@@1) (MapType1Type RefType)) (= (type ExhaleHeap@@0) (MapType1Type RefType))) (= (type Mask@@1) (MapType0Type RefType realType))) (= (type pm_f@@0) (FieldType C@@0 FrameTypeType))) (IdenticalOnKnownLocations Heap@@1 ExhaleHeap@@0 Mask@@1)) (and (HasDirectPerm Mask@@1 null pm_f@@0) (IsWandField pm_f@@0))) (= (MapType1Select Heap@@1 null (WandMaskField pm_f@@0)) (MapType1Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))))
 :qid |stdinbpl.60:19|
 :skolemid |5|
 :pattern ( (IdenticalOnKnownLocations Heap@@1 ExhaleHeap@@0 Mask@@1) (IsWandField pm_f@@0) (MapType1Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))
)))
(assert (forall ((Heap@@2 T@U) (ExhaleHeap@@1 T@U) (Mask@@2 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@2) (MapType1Type RefType)) (= (type ExhaleHeap@@1) (MapType1Type RefType))) (= (type Mask@@2) (MapType0Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@2 ExhaleHeap@@1 Mask@@2)) (U_2_bool (MapType1Select Heap@@2 o_1 $allocated))) (U_2_bool (MapType1Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.73:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@2 ExhaleHeap@@1 Mask@@2) (MapType1Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert (forall ((arg0@@27 T@U) (arg1@@12 Real) (arg2@@6 T@U) (arg3@@4 Real) (arg4@@2 T@U) (arg5@@2 T@U) (arg6@@2 Real) (arg7@@2 Real) ) (! (= (type (wand arg0@@27 arg1@@12 arg2@@6 arg3@@4 arg4@@2 arg5@@2 arg6@@2 arg7@@2)) (FieldType WandType_wandType intType))
 :qid |funType:wand|
 :pattern ( (wand arg0@@27 arg1@@12 arg2@@6 arg3@@4 arg4@@2 arg5@@2 arg6@@2 arg7@@2))
)))
(assert (forall ((arg1@@13 T@U) (arg2@@7 Real) (arg3@@5 T@U) (arg4@@3 Real) (arg5@@3 T@U) (arg6@@3 T@U) (arg7@@3 Real) (arg8@@0 Real) ) (!  (=> (and (and (and (= (type arg1@@13) RefType) (= (type arg3@@5) RefType)) (= (type arg5@@3) RefType)) (= (type arg6@@3) RefType)) (IsWandField (wand arg1@@13 arg2@@7 arg3@@5 arg4@@3 arg5@@3 arg6@@3 arg7@@3 arg8@@0)))
 :qid |stdinbpl.183:15|
 :skolemid |22|
 :pattern ( (wand arg1@@13 arg2@@7 arg3@@5 arg4@@3 arg5@@3 arg6@@3 arg7@@3 arg8@@0))
)))
(assert (forall ((arg1@@14 T@U) (arg2@@8 Real) (arg3@@6 T@U) (arg4@@4 Real) (arg5@@4 T@U) (arg6@@4 T@U) (arg7@@4 Real) (arg8@@1 Real) ) (!  (=> (and (and (and (= (type arg1@@14) RefType) (= (type arg3@@6) RefType)) (= (type arg5@@4) RefType)) (= (type arg6@@4) RefType)) (IsWandField (|wand#ft| arg1@@14 arg2@@8 arg3@@6 arg4@@4 arg5@@4 arg6@@4 arg7@@4 arg8@@1)))
 :qid |stdinbpl.187:15|
 :skolemid |23|
 :pattern ( (|wand#ft| arg1@@14 arg2@@8 arg3@@6 arg4@@4 arg5@@4 arg6@@4 arg7@@4 arg8@@1))
)))
(assert (forall ((Heap@@3 T@U) (ExhaleHeap@@2 T@U) (Mask@@3 T@U) (o_1@@0 T@U) (f_2 T@U) ) (! (let ((B@@1 (FieldTypeInv1 (type f_2))))
(let ((A@@1 (FieldTypeInv0 (type f_2))))
 (=> (and (and (and (and (and (and (= (type Heap@@3) (MapType1Type RefType)) (= (type ExhaleHeap@@2) (MapType1Type RefType))) (= (type Mask@@3) (MapType0Type RefType realType))) (= (type o_1@@0) RefType)) (= (type f_2) (FieldType A@@1 B@@1))) (IdenticalOnKnownLocations Heap@@3 ExhaleHeap@@2 Mask@@3)) (HasDirectPerm Mask@@3 o_1@@0 f_2)) (= (MapType1Select Heap@@3 o_1@@0 f_2) (MapType1Select ExhaleHeap@@2 o_1@@0 f_2)))))
 :qid |stdinbpl.42:22|
 :skolemid |1|
 :pattern ( (IdenticalOnKnownLocations Heap@@3 ExhaleHeap@@2 Mask@@3) (MapType1Select ExhaleHeap@@2 o_1@@0 f_2))
)))
(assert (forall ((arg1@@15 T@U) (arg2@@9 Real) (arg3@@7 T@U) (arg4@@5 Real) (arg5@@5 T@U) (arg6@@5 T@U) (arg7@@5 Real) (arg8@@2 Real) ) (!  (=> (and (and (and (= (type arg1@@15) RefType) (= (type arg3@@7) RefType)) (= (type arg5@@5) RefType)) (= (type arg6@@5) RefType)) (not (IsPredicateField (wand arg1@@15 arg2@@9 arg3@@7 arg4@@5 arg5@@5 arg6@@5 arg7@@5 arg8@@2))))
 :qid |stdinbpl.191:15|
 :skolemid |24|
 :pattern ( (wand arg1@@15 arg2@@9 arg3@@7 arg4@@5 arg5@@5 arg6@@5 arg7@@5 arg8@@2))
)))
(assert (forall ((arg1@@16 T@U) (arg2@@10 Real) (arg3@@8 T@U) (arg4@@6 Real) (arg5@@6 T@U) (arg6@@6 T@U) (arg7@@6 Real) (arg8@@3 Real) ) (!  (=> (and (and (and (= (type arg1@@16) RefType) (= (type arg3@@8) RefType)) (= (type arg5@@6) RefType)) (= (type arg6@@6) RefType)) (not (IsPredicateField (|wand#ft| arg1@@16 arg2@@10 arg3@@8 arg4@@6 arg5@@6 arg6@@6 arg7@@6 arg8@@3))))
 :qid |stdinbpl.195:15|
 :skolemid |25|
 :pattern ( (|wand#ft| arg1@@16 arg2@@10 arg3@@8 arg4@@6 arg5@@6 arg6@@6 arg7@@6 arg8@@3))
)))
(assert  (and (= (type dummyHeap) (MapType1Type RefType)) (= (type ZeroMask) (MapType0Type RefType realType))))
(assert (state dummyHeap ZeroMask))
(assert  (and (= (Ctor WandType_wand_1Type) 13) (forall ((arg0@@28 T@U) (arg1@@17 Real) (arg2@@11 T@U) (arg3@@9 Real) (arg4@@7 T@U) (arg5@@7 T@U) (arg6@@7 Real) (arg7@@7 Real) (arg8@@4 T@U) (arg9 T@U) (arg10 Real) (arg11 Real) ) (! (= (type (wand_1 arg0@@28 arg1@@17 arg2@@11 arg3@@9 arg4@@7 arg5@@7 arg6@@7 arg7@@7 arg8@@4 arg9 arg10 arg11)) (FieldType WandType_wand_1Type intType))
 :qid |funType:wand_1|
 :pattern ( (wand_1 arg0@@28 arg1@@17 arg2@@11 arg3@@9 arg4@@7 arg5@@7 arg6@@7 arg7@@7 arg8@@4 arg9 arg10 arg11))
))))
(assert (forall ((arg1@@18 T@U) (arg2@@12 Real) (arg3@@10 T@U) (arg4@@8 Real) (arg5@@8 T@U) (arg6@@8 T@U) (arg7@@8 Real) (arg8@@5 Real) (arg9@@0 T@U) (arg10@@0 T@U) (arg11@@0 Real) (arg12 Real) ) (!  (=> (and (and (and (and (and (= (type arg1@@18) RefType) (= (type arg3@@10) RefType)) (= (type arg5@@8) RefType)) (= (type arg6@@8) RefType)) (= (type arg9@@0) RefType)) (= (type arg10@@0) RefType)) (= (getPredWandId (wand_1 arg1@@18 arg2@@12 arg3@@10 arg4@@8 arg5@@8 arg6@@8 arg7@@8 arg8@@5 arg9@@0 arg10@@0 arg11@@0 arg12)) 1))
 :qid |stdinbpl.235:15|
 :skolemid |34|
 :pattern ( (wand_1 arg1@@18 arg2@@12 arg3@@10 arg4@@8 arg5@@8 arg6@@8 arg7@@8 arg8@@5 arg9@@0 arg10@@0 arg11@@0 arg12))
)))
(assert  (and (= (Ctor WandType_wand_2Type) 14) (forall ((arg0@@29 T@U) (arg1@@19 Real) (arg2@@13 T@U) (arg3@@11 Real) (arg4@@9 T@U) (arg5@@9 T@U) (arg6@@9 Real) (arg7@@9 Real) (arg8@@6 T@U) (arg9@@1 T@U) (arg10@@1 Real) (arg11@@1 Real) ) (! (= (type (wand_2 arg0@@29 arg1@@19 arg2@@13 arg3@@11 arg4@@9 arg5@@9 arg6@@9 arg7@@9 arg8@@6 arg9@@1 arg10@@1 arg11@@1)) (FieldType WandType_wand_2Type intType))
 :qid |funType:wand_2|
 :pattern ( (wand_2 arg0@@29 arg1@@19 arg2@@13 arg3@@11 arg4@@9 arg5@@9 arg6@@9 arg7@@9 arg8@@6 arg9@@1 arg10@@1 arg11@@1))
))))
(assert (forall ((arg1@@20 T@U) (arg2@@14 Real) (arg3@@12 T@U) (arg4@@10 Real) (arg5@@10 T@U) (arg6@@10 T@U) (arg7@@10 Real) (arg8@@7 Real) (arg9@@2 T@U) (arg10@@2 T@U) (arg11@@2 Real) (arg12@@0 Real) ) (!  (=> (and (and (and (and (and (= (type arg1@@20) RefType) (= (type arg3@@12) RefType)) (= (type arg5@@10) RefType)) (= (type arg6@@10) RefType)) (= (type arg9@@2) RefType)) (= (type arg10@@2) RefType)) (= (getPredWandId (wand_2 arg1@@20 arg2@@14 arg3@@12 arg4@@10 arg5@@10 arg6@@10 arg7@@10 arg8@@7 arg9@@2 arg10@@2 arg11@@2 arg12@@0)) 2))
 :qid |stdinbpl.267:15|
 :skolemid |41|
 :pattern ( (wand_2 arg1@@20 arg2@@14 arg3@@12 arg4@@10 arg5@@10 arg6@@10 arg7@@10 arg8@@7 arg9@@2 arg10@@2 arg11@@2 arg12@@0))
)))
(assert (forall ((p T@U) (v_1 T@U) (w T@U) ) (! (let ((A@@2 (FieldTypeInv0 (type p))))
 (=> (and (and (= (type p) (FieldType A@@2 FrameTypeType)) (= (type v_1) FrameTypeType)) (= (type w) FrameTypeType)) (not (InsidePredicate p v_1 p w))))
 :qid |stdinbpl.170:19|
 :skolemid |21|
 :pattern ( (InsidePredicate p v_1 p w))
)))
(assert  (not (IsPredicateField f_7)))
(assert  (not (IsWandField f_7)))
(assert  (not (IsPredicateField g)))
(assert  (not (IsWandField g)))
(assert  (not (IsPredicateField h)))
(assert  (not (IsWandField h)))
(assert (forall ((Heap@@4 T@U) (ExhaleHeap@@3 T@U) (Mask@@4 T@U) ) (!  (=> (and (and (and (= (type Heap@@4) (MapType1Type RefType)) (= (type ExhaleHeap@@3) (MapType1Type RefType))) (= (type Mask@@4) (MapType0Type RefType realType))) (IdenticalOnKnownLocations Heap@@4 ExhaleHeap@@3 Mask@@4)) (succHeap Heap@@4 ExhaleHeap@@3))
 :qid |stdinbpl.83:15|
 :skolemid |10|
 :pattern ( (IdenticalOnKnownLocations Heap@@4 ExhaleHeap@@3 Mask@@4))
)))
(assert (forall ((ResultMask T@U) (SummandMask1 T@U) (SummandMask2 T@U) (o_2 T@U) (f_4 T@U) ) (! (let ((B@@2 (FieldTypeInv1 (type f_4))))
(let ((A@@3 (FieldTypeInv0 (type f_4))))
 (=> (and (and (and (and (and (= (type ResultMask) (MapType0Type RefType realType)) (= (type SummandMask1) (MapType0Type RefType realType))) (= (type SummandMask2) (MapType0Type RefType realType))) (= (type o_2) RefType)) (= (type f_4) (FieldType A@@3 B@@2))) (sumMask ResultMask SummandMask1 SummandMask2)) (= (U_2_real (MapType0Select ResultMask o_2 f_4)) (+ (U_2_real (MapType0Select SummandMask1 o_2 f_4)) (U_2_real (MapType0Select SummandMask2 o_2 f_4)))))))
 :qid |stdinbpl.138:22|
 :skolemid |18|
 :pattern ( (sumMask ResultMask SummandMask1 SummandMask2) (MapType0Select ResultMask o_2 f_4))
 :pattern ( (sumMask ResultMask SummandMask1 SummandMask2) (MapType0Select SummandMask1 o_2 f_4))
 :pattern ( (sumMask ResultMask SummandMask1 SummandMask2) (MapType0Select SummandMask2 o_2 f_4))
)))
(assert (forall ((arg1@@21 T@U) (arg2@@15 Real) (arg3@@13 T@U) (arg4@@11 Real) (arg5@@11 T@U) (arg6@@11 T@U) (arg7@@11 Real) (arg8@@8 Real) (arg9@@3 T@U) (arg10@@3 T@U) (arg11@@3 Real) (arg12@@1 Real) ) (!  (=> (and (and (and (and (and (= (type arg1@@21) RefType) (= (type arg3@@13) RefType)) (= (type arg5@@11) RefType)) (= (type arg6@@11) RefType)) (= (type arg9@@3) RefType)) (= (type arg10@@3) RefType)) (IsWandField (wand_1 arg1@@21 arg2@@15 arg3@@13 arg4@@11 arg5@@11 arg6@@11 arg7@@11 arg8@@8 arg9@@3 arg10@@3 arg11@@3 arg12@@1)))
 :qid |stdinbpl.215:15|
 :skolemid |29|
 :pattern ( (wand_1 arg1@@21 arg2@@15 arg3@@13 arg4@@11 arg5@@11 arg6@@11 arg7@@11 arg8@@8 arg9@@3 arg10@@3 arg11@@3 arg12@@1))
)))
(assert (forall ((arg0@@30 T@U) (arg1@@22 Real) (arg2@@16 T@U) (arg3@@14 Real) (arg4@@12 T@U) (arg5@@12 T@U) (arg6@@12 Real) (arg7@@12 Real) (arg8@@9 T@U) (arg9@@4 T@U) (arg10@@4 Real) (arg11@@4 Real) ) (! (= (type (|wand_1#ft| arg0@@30 arg1@@22 arg2@@16 arg3@@14 arg4@@12 arg5@@12 arg6@@12 arg7@@12 arg8@@9 arg9@@4 arg10@@4 arg11@@4)) (FieldType WandType_wand_1Type FrameTypeType))
 :qid |funType:wand_1#ft|
 :pattern ( (|wand_1#ft| arg0@@30 arg1@@22 arg2@@16 arg3@@14 arg4@@12 arg5@@12 arg6@@12 arg7@@12 arg8@@9 arg9@@4 arg10@@4 arg11@@4))
)))
(assert (forall ((arg1@@23 T@U) (arg2@@17 Real) (arg3@@15 T@U) (arg4@@13 Real) (arg5@@13 T@U) (arg6@@13 T@U) (arg7@@13 Real) (arg8@@10 Real) (arg9@@5 T@U) (arg10@@5 T@U) (arg11@@5 Real) (arg12@@2 Real) ) (!  (=> (and (and (and (and (and (= (type arg1@@23) RefType) (= (type arg3@@15) RefType)) (= (type arg5@@13) RefType)) (= (type arg6@@13) RefType)) (= (type arg9@@5) RefType)) (= (type arg10@@5) RefType)) (IsWandField (|wand_1#ft| arg1@@23 arg2@@17 arg3@@15 arg4@@13 arg5@@13 arg6@@13 arg7@@13 arg8@@10 arg9@@5 arg10@@5 arg11@@5 arg12@@2)))
 :qid |stdinbpl.219:15|
 :skolemid |30|
 :pattern ( (|wand_1#ft| arg1@@23 arg2@@17 arg3@@15 arg4@@13 arg5@@13 arg6@@13 arg7@@13 arg8@@10 arg9@@5 arg10@@5 arg11@@5 arg12@@2))
)))
(assert (forall ((arg1@@24 T@U) (arg2@@18 Real) (arg3@@16 T@U) (arg4@@14 Real) (arg5@@14 T@U) (arg6@@14 T@U) (arg7@@14 Real) (arg8@@11 Real) (arg9@@6 T@U) (arg10@@6 T@U) (arg11@@6 Real) (arg12@@3 Real) ) (!  (=> (and (and (and (and (and (= (type arg1@@24) RefType) (= (type arg3@@16) RefType)) (= (type arg5@@14) RefType)) (= (type arg6@@14) RefType)) (= (type arg9@@6) RefType)) (= (type arg10@@6) RefType)) (IsWandField (wand_2 arg1@@24 arg2@@18 arg3@@16 arg4@@14 arg5@@14 arg6@@14 arg7@@14 arg8@@11 arg9@@6 arg10@@6 arg11@@6 arg12@@3)))
 :qid |stdinbpl.247:15|
 :skolemid |36|
 :pattern ( (wand_2 arg1@@24 arg2@@18 arg3@@16 arg4@@14 arg5@@14 arg6@@14 arg7@@14 arg8@@11 arg9@@6 arg10@@6 arg11@@6 arg12@@3))
)))
(assert (forall ((arg0@@31 T@U) (arg1@@25 Real) (arg2@@19 T@U) (arg3@@17 Real) (arg4@@15 T@U) (arg5@@15 T@U) (arg6@@15 Real) (arg7@@15 Real) (arg8@@12 T@U) (arg9@@7 T@U) (arg10@@7 Real) (arg11@@7 Real) ) (! (= (type (|wand_2#ft| arg0@@31 arg1@@25 arg2@@19 arg3@@17 arg4@@15 arg5@@15 arg6@@15 arg7@@15 arg8@@12 arg9@@7 arg10@@7 arg11@@7)) (FieldType WandType_wand_2Type FrameTypeType))
 :qid |funType:wand_2#ft|
 :pattern ( (|wand_2#ft| arg0@@31 arg1@@25 arg2@@19 arg3@@17 arg4@@15 arg5@@15 arg6@@15 arg7@@15 arg8@@12 arg9@@7 arg10@@7 arg11@@7))
)))
(assert (forall ((arg1@@26 T@U) (arg2@@20 Real) (arg3@@18 T@U) (arg4@@16 Real) (arg5@@16 T@U) (arg6@@16 T@U) (arg7@@16 Real) (arg8@@13 Real) (arg9@@8 T@U) (arg10@@8 T@U) (arg11@@8 Real) (arg12@@4 Real) ) (!  (=> (and (and (and (and (and (= (type arg1@@26) RefType) (= (type arg3@@18) RefType)) (= (type arg5@@16) RefType)) (= (type arg6@@16) RefType)) (= (type arg9@@8) RefType)) (= (type arg10@@8) RefType)) (IsWandField (|wand_2#ft| arg1@@26 arg2@@20 arg3@@18 arg4@@16 arg5@@16 arg6@@16 arg7@@16 arg8@@13 arg9@@8 arg10@@8 arg11@@8 arg12@@4)))
 :qid |stdinbpl.251:15|
 :skolemid |37|
 :pattern ( (|wand_2#ft| arg1@@26 arg2@@20 arg3@@18 arg4@@16 arg5@@16 arg6@@16 arg7@@16 arg8@@13 arg9@@8 arg10@@8 arg11@@8 arg12@@4))
)))
(assert  (and (forall ((arg0@@32 Real) (arg1@@27 T@U) ) (! (= (type (ConditionalFrame arg0@@32 arg1@@27)) FrameTypeType)
 :qid |funType:ConditionalFrame|
 :pattern ( (ConditionalFrame arg0@@32 arg1@@27))
)) (= (type EmptyFrame) FrameTypeType)))
(assert (forall ((p@@0 Real) (f_6 T@U) ) (!  (=> (= (type f_6) FrameTypeType) (= (ConditionalFrame p@@0 f_6) (ite (> p@@0 0.0) f_6 EmptyFrame)))
 :qid |stdinbpl.158:15|
 :skolemid |19|
 :pattern ( (ConditionalFrame p@@0 f_6))
)))
(assert (forall ((arg1@@28 T@U) (arg2@@21 Real) (arg3@@19 T@U) (arg4@@17 Real) (arg5@@17 T@U) (arg6@@17 T@U) (arg7@@17 Real) (arg8@@14 Real) (arg9@@9 T@U) (arg10@@9 T@U) (arg11@@9 Real) (arg12@@5 Real) ) (!  (=> (and (and (and (and (and (= (type arg1@@28) RefType) (= (type arg3@@19) RefType)) (= (type arg5@@17) RefType)) (= (type arg6@@17) RefType)) (= (type arg9@@9) RefType)) (= (type arg10@@9) RefType)) (not (IsPredicateField (wand_1 arg1@@28 arg2@@21 arg3@@19 arg4@@17 arg5@@17 arg6@@17 arg7@@17 arg8@@14 arg9@@9 arg10@@9 arg11@@9 arg12@@5))))
 :qid |stdinbpl.223:15|
 :skolemid |31|
 :pattern ( (wand_1 arg1@@28 arg2@@21 arg3@@19 arg4@@17 arg5@@17 arg6@@17 arg7@@17 arg8@@14 arg9@@9 arg10@@9 arg11@@9 arg12@@5))
)))
(assert (forall ((arg1@@29 T@U) (arg2@@22 Real) (arg3@@20 T@U) (arg4@@18 Real) (arg5@@18 T@U) (arg6@@18 T@U) (arg7@@18 Real) (arg8@@15 Real) (arg9@@10 T@U) (arg10@@10 T@U) (arg11@@10 Real) (arg12@@6 Real) ) (!  (=> (and (and (and (and (and (= (type arg1@@29) RefType) (= (type arg3@@20) RefType)) (= (type arg5@@18) RefType)) (= (type arg6@@18) RefType)) (= (type arg9@@10) RefType)) (= (type arg10@@10) RefType)) (not (IsPredicateField (|wand_1#ft| arg1@@29 arg2@@22 arg3@@20 arg4@@18 arg5@@18 arg6@@18 arg7@@18 arg8@@15 arg9@@10 arg10@@10 arg11@@10 arg12@@6))))
 :qid |stdinbpl.227:15|
 :skolemid |32|
 :pattern ( (|wand_1#ft| arg1@@29 arg2@@22 arg3@@20 arg4@@18 arg5@@18 arg6@@18 arg7@@18 arg8@@15 arg9@@10 arg10@@10 arg11@@10 arg12@@6))
)))
(assert (forall ((arg1@@30 T@U) (arg2@@23 Real) (arg3@@21 T@U) (arg4@@19 Real) (arg5@@19 T@U) (arg6@@19 T@U) (arg7@@19 Real) (arg8@@16 Real) (arg9@@11 T@U) (arg10@@11 T@U) (arg11@@11 Real) (arg12@@7 Real) ) (!  (=> (and (and (and (and (and (= (type arg1@@30) RefType) (= (type arg3@@21) RefType)) (= (type arg5@@19) RefType)) (= (type arg6@@19) RefType)) (= (type arg9@@11) RefType)) (= (type arg10@@11) RefType)) (not (IsPredicateField (wand_2 arg1@@30 arg2@@23 arg3@@21 arg4@@19 arg5@@19 arg6@@19 arg7@@19 arg8@@16 arg9@@11 arg10@@11 arg11@@11 arg12@@7))))
 :qid |stdinbpl.255:15|
 :skolemid |38|
 :pattern ( (wand_2 arg1@@30 arg2@@23 arg3@@21 arg4@@19 arg5@@19 arg6@@19 arg7@@19 arg8@@16 arg9@@11 arg10@@11 arg11@@11 arg12@@7))
)))
(assert (forall ((arg1@@31 T@U) (arg2@@24 Real) (arg3@@22 T@U) (arg4@@20 Real) (arg5@@20 T@U) (arg6@@20 T@U) (arg7@@20 Real) (arg8@@17 Real) (arg9@@12 T@U) (arg10@@12 T@U) (arg11@@12 Real) (arg12@@8 Real) ) (!  (=> (and (and (and (and (and (= (type arg1@@31) RefType) (= (type arg3@@22) RefType)) (= (type arg5@@20) RefType)) (= (type arg6@@20) RefType)) (= (type arg9@@12) RefType)) (= (type arg10@@12) RefType)) (not (IsPredicateField (|wand_2#ft| arg1@@31 arg2@@24 arg3@@22 arg4@@20 arg5@@20 arg6@@20 arg7@@20 arg8@@17 arg9@@12 arg10@@12 arg11@@12 arg12@@8))))
 :qid |stdinbpl.259:15|
 :skolemid |39|
 :pattern ( (|wand_2#ft| arg1@@31 arg2@@24 arg3@@22 arg4@@20 arg5@@20 arg6@@20 arg7@@20 arg8@@17 arg9@@12 arg10@@12 arg11@@12 arg12@@8))
)))
(assert (forall ((Mask@@5 T@U) (o_2@@0 T@U) (f_4@@0 T@U) ) (! (let ((B@@3 (FieldTypeInv1 (type f_4@@0))))
(let ((A@@4 (FieldTypeInv0 (type f_4@@0))))
 (=> (and (and (= (type Mask@@5) (MapType0Type RefType realType)) (= (type o_2@@0) RefType)) (= (type f_4@@0) (FieldType A@@4 B@@3))) (= (HasDirectPerm Mask@@5 o_2@@0 f_4@@0) (> (U_2_real (MapType0Select Mask@@5 o_2@@0 f_4@@0)) NoPerm)))))
 :qid |stdinbpl.133:22|
 :skolemid |17|
 :pattern ( (HasDirectPerm Mask@@5 o_2@@0 f_4@@0))
)))
(assert (forall ((o_2@@1 T@U) (f_4@@1 T@U) ) (! (let ((B@@4 (FieldTypeInv1 (type f_4@@1))))
(let ((A@@5 (FieldTypeInv0 (type f_4@@1))))
 (=> (and (= (type o_2@@1) RefType) (= (type f_4@@1) (FieldType A@@5 B@@4))) (= (U_2_real (MapType0Select ZeroMask o_2@@1 f_4@@1)) NoPerm))))
 :qid |stdinbpl.106:22|
 :skolemid |13|
 :pattern ( (MapType0Select ZeroMask o_2@@1 f_4@@1))
)))
(assert (forall ((arg1@@32 T@U) (arg2@@25 Real) (arg3@@23 T@U) (arg4@@21 Real) (arg5@@21 T@U) (arg6@@21 T@U) (arg7@@21 Real) (arg8@@18 Real) (arg1_2 T@U) (arg2_2 Real) (arg3_2 T@U) (arg4_2 Real) (arg5_2 T@U) (arg6_2 T@U) (arg7_2 Real) (arg8_2 Real) ) (!  (=> (and (and (and (and (and (and (and (and (= (type arg1@@32) RefType) (= (type arg3@@23) RefType)) (= (type arg5@@21) RefType)) (= (type arg6@@21) RefType)) (= (type arg1_2) RefType)) (= (type arg3_2) RefType)) (= (type arg5_2) RefType)) (= (type arg6_2) RefType)) (= (wand arg1@@32 arg2@@25 arg3@@23 arg4@@21 arg5@@21 arg6@@21 arg7@@21 arg8@@18) (wand arg1_2 arg2_2 arg3_2 arg4_2 arg5_2 arg6_2 arg7_2 arg8_2))) (and (= arg1@@32 arg1_2) (and (= arg2@@25 arg2_2) (and (= arg3@@23 arg3_2) (and (= arg4@@21 arg4_2) (and (= arg5@@21 arg5_2) (and (= arg6@@21 arg6_2) (and (= arg7@@21 arg7_2) (= arg8@@18 arg8_2)))))))))
 :qid |stdinbpl.207:15|
 :skolemid |28|
 :pattern ( (wand arg1@@32 arg2@@25 arg3@@23 arg4@@21 arg5@@21 arg6@@21 arg7@@21 arg8@@18) (wand arg1_2 arg2_2 arg3_2 arg4_2 arg5_2 arg6_2 arg7_2 arg8_2))
)))
(assert (forall ((arg1@@33 T@U) (arg2@@26 Real) (arg3@@24 T@U) (arg4@@22 Real) (arg5@@22 T@U) (arg6@@22 T@U) (arg7@@22 Real) (arg8@@19 Real) ) (!  (=> (and (and (and (= (type arg1@@33) RefType) (= (type arg3@@24) RefType)) (= (type arg5@@22) RefType)) (= (type arg6@@22) RefType)) (= (getPredWandId (wand arg1@@33 arg2@@26 arg3@@24 arg4@@22 arg5@@22 arg6@@22 arg7@@22 arg8@@19)) 0))
 :qid |stdinbpl.203:15|
 :skolemid |27|
 :pattern ( (wand arg1@@33 arg2@@26 arg3@@24 arg4@@22 arg5@@22 arg6@@22 arg7@@22 arg8@@19))
)))
(assert (forall ((Heap@@5 T@U) (ExhaleHeap@@4 T@U) (Mask@@6 T@U) (pm_f@@1 T@U) ) (! (let ((C@@1 (FieldTypeInv0 (type pm_f@@1))))
 (=> (and (and (and (and (and (= (type Heap@@5) (MapType1Type RefType)) (= (type ExhaleHeap@@4) (MapType1Type RefType))) (= (type Mask@@6) (MapType0Type RefType realType))) (= (type pm_f@@1) (FieldType C@@1 FrameTypeType))) (IdenticalOnKnownLocations Heap@@5 ExhaleHeap@@4 Mask@@6)) (and (HasDirectPerm Mask@@6 null pm_f@@1) (IsPredicateField pm_f@@1))) (forall ((o2 T@U) (f_2@@0 T@U) ) (! (let ((B@@5 (FieldTypeInv1 (type f_2@@0))))
(let ((A@@6 (FieldTypeInv0 (type f_2@@0))))
 (=> (and (and (= (type o2) RefType) (= (type f_2@@0) (FieldType A@@6 B@@5))) (U_2_bool (MapType0Select (MapType1Select Heap@@5 null (PredicateMaskField pm_f@@1)) o2 f_2@@0))) (= (MapType1Select Heap@@5 o2 f_2@@0) (MapType1Select ExhaleHeap@@4 o2 f_2@@0)))))
 :qid |stdinbpl.54:134|
 :skolemid |3|
 :pattern ( (MapType1Select ExhaleHeap@@4 o2 f_2@@0))
))))
 :qid |stdinbpl.52:19|
 :skolemid |4|
 :pattern ( (IdenticalOnKnownLocations Heap@@5 ExhaleHeap@@4 Mask@@6) (IsPredicateField pm_f@@1))
)))
(assert (forall ((Heap@@6 T@U) (ExhaleHeap@@5 T@U) (Mask@@7 T@U) (pm_f@@2 T@U) ) (! (let ((C@@2 (FieldTypeInv0 (type pm_f@@2))))
 (=> (and (and (and (and (and (= (type Heap@@6) (MapType1Type RefType)) (= (type ExhaleHeap@@5) (MapType1Type RefType))) (= (type Mask@@7) (MapType0Type RefType realType))) (= (type pm_f@@2) (FieldType C@@2 FrameTypeType))) (IdenticalOnKnownLocations Heap@@6 ExhaleHeap@@5 Mask@@7)) (and (HasDirectPerm Mask@@7 null pm_f@@2) (IsWandField pm_f@@2))) (forall ((o2@@0 T@U) (f_2@@1 T@U) ) (! (let ((B@@6 (FieldTypeInv1 (type f_2@@1))))
(let ((A@@7 (FieldTypeInv0 (type f_2@@1))))
 (=> (and (and (= (type o2@@0) RefType) (= (type f_2@@1) (FieldType A@@7 B@@6))) (U_2_bool (MapType0Select (MapType1Select Heap@@6 null (WandMaskField pm_f@@2)) o2@@0 f_2@@1))) (= (MapType1Select Heap@@6 o2@@0 f_2@@1) (MapType1Select ExhaleHeap@@5 o2@@0 f_2@@1)))))
 :qid |stdinbpl.67:129|
 :skolemid |6|
 :pattern ( (MapType1Select ExhaleHeap@@5 o2@@0 f_2@@1))
))))
 :qid |stdinbpl.65:19|
 :skolemid |7|
 :pattern ( (IdenticalOnKnownLocations Heap@@6 ExhaleHeap@@5 Mask@@7) (IsWandField pm_f@@2))
)))
(assert (forall ((Mask@@8 T@U) (o_2@@2 T@U) (f_4@@2 T@U) ) (! (let ((B@@7 (FieldTypeInv1 (type f_4@@2))))
(let ((A@@8 (FieldTypeInv0 (type f_4@@2))))
 (=> (and (and (and (= (type Mask@@8) (MapType0Type RefType realType)) (= (type o_2@@2) RefType)) (= (type f_4@@2) (FieldType A@@8 B@@7))) (GoodMask Mask@@8)) (and (>= (U_2_real (MapType0Select Mask@@8 o_2@@2 f_4@@2)) NoPerm) (=> (and (and (GoodMask Mask@@8) (not (IsPredicateField f_4@@2))) (not (IsWandField f_4@@2))) (<= (U_2_real (MapType0Select Mask@@8 o_2@@2 f_4@@2)) FullPerm))))))
 :qid |stdinbpl.128:22|
 :skolemid |16|
 :pattern ( (GoodMask Mask@@8) (MapType0Select Mask@@8 o_2@@2 f_4@@2))
)))
(assert (forall ((o T@U) (f T@U) (Heap@@7 T@U) ) (!  (=> (and (and (and (= (type o) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap@@7) (MapType1Type RefType))) (U_2_bool (MapType1Select Heap@@7 o $allocated))) (U_2_bool (MapType1Select Heap@@7 (MapType1Select Heap@@7 o f) $allocated)))
 :qid |stdinbpl.31:15|
 :skolemid |0|
 :pattern ( (MapType1Select Heap@@7 o f))
)))
(assert (forall ((arg0@@33 T@U) (arg1@@34 Real) (arg2@@27 T@U) (arg3@@25 Real) (arg4@@23 T@U) (arg5@@23 T@U) (arg6@@23 Real) (arg7@@23 Real) (arg8@@20 T@U) (arg9@@13 T@U) (arg10@@13 Real) (arg11@@13 Real) ) (! (= (type (|wand_1#sm| arg0@@33 arg1@@34 arg2@@27 arg3@@25 arg4@@23 arg5@@23 arg6@@23 arg7@@23 arg8@@20 arg9@@13 arg10@@13 arg11@@13)) (FieldType WandType_wand_1Type (MapType0Type RefType boolType)))
 :qid |funType:wand_1#sm|
 :pattern ( (|wand_1#sm| arg0@@33 arg1@@34 arg2@@27 arg3@@25 arg4@@23 arg5@@23 arg6@@23 arg7@@23 arg8@@20 arg9@@13 arg10@@13 arg11@@13))
)))
(assert (forall ((arg1@@35 T@U) (arg2@@28 Real) (arg3@@26 T@U) (arg4@@24 Real) (arg5@@24 T@U) (arg6@@24 T@U) (arg7@@24 Real) (arg8@@21 Real) (arg9@@14 T@U) (arg10@@14 T@U) (arg11@@14 Real) (arg12@@9 Real) ) (!  (=> (and (and (and (and (and (= (type arg1@@35) RefType) (= (type arg3@@26) RefType)) (= (type arg5@@24) RefType)) (= (type arg6@@24) RefType)) (= (type arg9@@14) RefType)) (= (type arg10@@14) RefType)) (= (|wand_1#sm| arg1@@35 arg2@@28 arg3@@26 arg4@@24 arg5@@24 arg6@@24 arg7@@24 arg8@@21 arg9@@14 arg10@@14 arg11@@14 arg12@@9) (WandMaskField (|wand_1#ft| arg1@@35 arg2@@28 arg3@@26 arg4@@24 arg5@@24 arg6@@24 arg7@@24 arg8@@21 arg9@@14 arg10@@14 arg11@@14 arg12@@9))))
 :qid |stdinbpl.231:15|
 :skolemid |33|
 :pattern ( (WandMaskField (|wand_1#ft| arg1@@35 arg2@@28 arg3@@26 arg4@@24 arg5@@24 arg6@@24 arg7@@24 arg8@@21 arg9@@14 arg10@@14 arg11@@14 arg12@@9)))
)))
(assert (forall ((arg0@@34 T@U) (arg1@@36 Real) (arg2@@29 T@U) (arg3@@27 Real) (arg4@@25 T@U) (arg5@@25 T@U) (arg6@@25 Real) (arg7@@25 Real) (arg8@@22 T@U) (arg9@@15 T@U) (arg10@@15 Real) (arg11@@15 Real) ) (! (= (type (|wand_2#sm| arg0@@34 arg1@@36 arg2@@29 arg3@@27 arg4@@25 arg5@@25 arg6@@25 arg7@@25 arg8@@22 arg9@@15 arg10@@15 arg11@@15)) (FieldType WandType_wand_2Type (MapType0Type RefType boolType)))
 :qid |funType:wand_2#sm|
 :pattern ( (|wand_2#sm| arg0@@34 arg1@@36 arg2@@29 arg3@@27 arg4@@25 arg5@@25 arg6@@25 arg7@@25 arg8@@22 arg9@@15 arg10@@15 arg11@@15))
)))
(assert (forall ((arg1@@37 T@U) (arg2@@30 Real) (arg3@@28 T@U) (arg4@@26 Real) (arg5@@26 T@U) (arg6@@26 T@U) (arg7@@26 Real) (arg8@@23 Real) (arg9@@16 T@U) (arg10@@16 T@U) (arg11@@16 Real) (arg12@@10 Real) ) (!  (=> (and (and (and (and (and (= (type arg1@@37) RefType) (= (type arg3@@28) RefType)) (= (type arg5@@26) RefType)) (= (type arg6@@26) RefType)) (= (type arg9@@16) RefType)) (= (type arg10@@16) RefType)) (= (|wand_2#sm| arg1@@37 arg2@@30 arg3@@28 arg4@@26 arg5@@26 arg6@@26 arg7@@26 arg8@@23 arg9@@16 arg10@@16 arg11@@16 arg12@@10) (WandMaskField (|wand_2#ft| arg1@@37 arg2@@30 arg3@@28 arg4@@26 arg5@@26 arg6@@26 arg7@@26 arg8@@23 arg9@@16 arg10@@16 arg11@@16 arg12@@10))))
 :qid |stdinbpl.263:15|
 :skolemid |40|
 :pattern ( (WandMaskField (|wand_2#ft| arg1@@37 arg2@@30 arg3@@28 arg4@@26 arg5@@26 arg6@@26 arg7@@26 arg8@@23 arg9@@16 arg10@@16 arg11@@16 arg12@@10)))
)))
(assert (forall ((Heap@@8 T@U) (o@@0 T@U) (f_3 T@U) (v T@U) ) (! (let ((B@@8 (type v)))
(let ((A@@9 (FieldTypeInv0 (type f_3))))
 (=> (and (and (= (type Heap@@8) (MapType1Type RefType)) (= (type o@@0) RefType)) (= (type f_3) (FieldType A@@9 B@@8))) (succHeap Heap@@8 (MapType1Store Heap@@8 o@@0 f_3 v)))))
 :qid |stdinbpl.78:22|
 :skolemid |9|
 :pattern ( (MapType1Store Heap@@8 o@@0 f_3 v))
)))
(assert (= (type ZeroPMask) (MapType0Type RefType boolType)))
(assert (forall ((o_2@@3 T@U) (f_4@@3 T@U) ) (! (let ((B@@9 (FieldTypeInv1 (type f_4@@3))))
(let ((A@@10 (FieldTypeInv0 (type f_4@@3))))
 (=> (and (= (type o_2@@3) RefType) (= (type f_4@@3) (FieldType A@@10 B@@9))) (not (U_2_bool (MapType0Select ZeroPMask o_2@@3 f_4@@3))))))
 :qid |stdinbpl.112:22|
 :skolemid |14|
 :pattern ( (MapType0Select ZeroPMask o_2@@3 f_4@@3))
)))
(assert (forall ((p@@1 T@U) (v_1@@0 T@U) (q T@U) (w@@0 T@U) (r T@U) (u T@U) ) (! (let ((C@@3 (FieldTypeInv0 (type r))))
(let ((B@@10 (FieldTypeInv0 (type q))))
(let ((A@@11 (FieldTypeInv0 (type p@@1))))
 (=> (and (and (and (and (and (and (= (type p@@1) (FieldType A@@11 FrameTypeType)) (= (type v_1@@0) FrameTypeType)) (= (type q) (FieldType B@@10 FrameTypeType))) (= (type w@@0) FrameTypeType)) (= (type r) (FieldType C@@3 FrameTypeType))) (= (type u) FrameTypeType)) (and (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))) (InsidePredicate p@@1 v_1@@0 r u)))))
 :qid |stdinbpl.165:25|
 :skolemid |20|
 :pattern ( (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))
)))
(assert (forall ((arg1@@38 T@U) (arg2@@31 Real) (arg3@@29 T@U) (arg4@@27 Real) (arg5@@27 T@U) (arg6@@27 T@U) (arg7@@27 Real) (arg8@@24 Real) (arg9@@17 T@U) (arg10@@17 T@U) (arg11@@17 Real) (arg12@@11 Real) (arg1_2@@0 T@U) (arg2_2@@0 Real) (arg3_2@@0 T@U) (arg4_2@@0 Real) (arg5_2@@0 T@U) (arg6_2@@0 T@U) (arg7_2@@0 Real) (arg8_2@@0 Real) (arg9_2 T@U) (arg10_2 T@U) (arg11_2 Real) (arg12_2 Real) ) (!  (=> (and (and (and (and (and (and (and (and (and (and (and (and (= (type arg1@@38) RefType) (= (type arg3@@29) RefType)) (= (type arg5@@27) RefType)) (= (type arg6@@27) RefType)) (= (type arg9@@17) RefType)) (= (type arg10@@17) RefType)) (= (type arg1_2@@0) RefType)) (= (type arg3_2@@0) RefType)) (= (type arg5_2@@0) RefType)) (= (type arg6_2@@0) RefType)) (= (type arg9_2) RefType)) (= (type arg10_2) RefType)) (= (wand_1 arg1@@38 arg2@@31 arg3@@29 arg4@@27 arg5@@27 arg6@@27 arg7@@27 arg8@@24 arg9@@17 arg10@@17 arg11@@17 arg12@@11) (wand_1 arg1_2@@0 arg2_2@@0 arg3_2@@0 arg4_2@@0 arg5_2@@0 arg6_2@@0 arg7_2@@0 arg8_2@@0 arg9_2 arg10_2 arg11_2 arg12_2))) (and (= arg1@@38 arg1_2@@0) (and (= arg2@@31 arg2_2@@0) (and (= arg3@@29 arg3_2@@0) (and (= arg4@@27 arg4_2@@0) (and (= arg5@@27 arg5_2@@0) (and (= arg6@@27 arg6_2@@0) (and (= arg7@@27 arg7_2@@0) (and (= arg8@@24 arg8_2@@0) (and (= arg9@@17 arg9_2) (and (= arg10@@17 arg10_2) (and (= arg11@@17 arg11_2) (= arg12@@11 arg12_2)))))))))))))
 :qid |stdinbpl.239:15|
 :skolemid |35|
 :pattern ( (wand_1 arg1@@38 arg2@@31 arg3@@29 arg4@@27 arg5@@27 arg6@@27 arg7@@27 arg8@@24 arg9@@17 arg10@@17 arg11@@17 arg12@@11) (wand_1 arg1_2@@0 arg2_2@@0 arg3_2@@0 arg4_2@@0 arg5_2@@0 arg6_2@@0 arg7_2@@0 arg8_2@@0 arg9_2 arg10_2 arg11_2 arg12_2))
)))
(assert (forall ((arg1@@39 T@U) (arg2@@32 Real) (arg3@@30 T@U) (arg4@@28 Real) (arg5@@28 T@U) (arg6@@28 T@U) (arg7@@28 Real) (arg8@@25 Real) (arg9@@18 T@U) (arg10@@18 T@U) (arg11@@18 Real) (arg12@@12 Real) (arg1_2@@1 T@U) (arg2_2@@1 Real) (arg3_2@@1 T@U) (arg4_2@@1 Real) (arg5_2@@1 T@U) (arg6_2@@1 T@U) (arg7_2@@1 Real) (arg8_2@@1 Real) (arg9_2@@0 T@U) (arg10_2@@0 T@U) (arg11_2@@0 Real) (arg12_2@@0 Real) ) (!  (=> (and (and (and (and (and (and (and (and (and (and (and (and (= (type arg1@@39) RefType) (= (type arg3@@30) RefType)) (= (type arg5@@28) RefType)) (= (type arg6@@28) RefType)) (= (type arg9@@18) RefType)) (= (type arg10@@18) RefType)) (= (type arg1_2@@1) RefType)) (= (type arg3_2@@1) RefType)) (= (type arg5_2@@1) RefType)) (= (type arg6_2@@1) RefType)) (= (type arg9_2@@0) RefType)) (= (type arg10_2@@0) RefType)) (= (wand_2 arg1@@39 arg2@@32 arg3@@30 arg4@@28 arg5@@28 arg6@@28 arg7@@28 arg8@@25 arg9@@18 arg10@@18 arg11@@18 arg12@@12) (wand_2 arg1_2@@1 arg2_2@@1 arg3_2@@1 arg4_2@@1 arg5_2@@1 arg6_2@@1 arg7_2@@1 arg8_2@@1 arg9_2@@0 arg10_2@@0 arg11_2@@0 arg12_2@@0))) (and (= arg1@@39 arg1_2@@1) (and (= arg2@@32 arg2_2@@1) (and (= arg3@@30 arg3_2@@1) (and (= arg4@@28 arg4_2@@1) (and (= arg5@@28 arg5_2@@1) (and (= arg6@@28 arg6_2@@1) (and (= arg7@@28 arg7_2@@1) (and (= arg8@@25 arg8_2@@1) (and (= arg9@@18 arg9_2@@0) (and (= arg10@@18 arg10_2@@0) (and (= arg11@@18 arg11_2@@0) (= arg12@@12 arg12_2@@0)))))))))))))
 :qid |stdinbpl.271:15|
 :skolemid |42|
 :pattern ( (wand_2 arg1@@39 arg2@@32 arg3@@30 arg4@@28 arg5@@28 arg6@@28 arg7@@28 arg8@@25 arg9@@18 arg10@@18 arg11@@18 arg12@@12) (wand_2 arg1_2@@1 arg2_2@@1 arg3_2@@1 arg4_2@@1 arg5_2@@1 arg6_2@@1 arg7_2@@1 arg8_2@@1 arg9_2@@0 arg10_2@@0 arg11_2@@0 arg12_2@@0))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun AssertMask@0 () T@U)
(declare-fun Mask@9 () T@U)
(declare-fun x@@8 () T@U)
(declare-fun Heap@5 () T@U)
(declare-fun b_17@7 () Bool)
(declare-fun b_18@18 () Bool)
(declare-fun neededTransfer@13 () Real)
(declare-fun Used_7Mask@11 () T@U)
(declare-fun initNeededTransfer@2 () Real)
(declare-fun b_21@0 () Bool)
(declare-fun b_21@1 () Bool)
(declare-fun Result_9Heap () T@U)
(declare-fun Result_9Mask () T@U)
(declare-fun b_21@2 () Bool)
(declare-fun Ops_7Mask () T@U)
(declare-fun b_21@3 () Bool)
(declare-fun Ops_7Heap@0 () T@U)
(declare-fun Used_7Heap@0 () T@U)
(declare-fun b_21@4 () Bool)
(declare-fun b_17@8 () Bool)
(declare-fun Mask@8 () T@U)
(declare-fun takeTransfer@5 () Real)
(declare-fun Heap@3 () T@U)
(declare-fun neededTransfer@11 () Real)
(declare-fun Mask@6 () T@U)
(declare-fun b_18@15 () Bool)
(declare-fun Used_7Mask@9 () T@U)
(declare-fun neededTransfer@12 () Real)
(declare-fun Used_7Mask@10 () T@U)
(declare-fun b_18@16 () Bool)
(declare-fun b_18@17 () Bool)
(declare-fun Mask@7 () T@U)
(declare-fun Heap@4 () T@U)
(declare-fun maskTransfer@5 () Real)
(declare-fun takeTransfer@4 () Real)
(declare-fun Used_7Mask@7 () T@U)
(declare-fun b_18@12 () Bool)
(declare-fun neededTransfer@9 () Real)
(declare-fun neededTransfer@10 () Real)
(declare-fun Used_7Mask@8 () T@U)
(declare-fun b_18@13 () Bool)
(declare-fun b_18@14 () Bool)
(declare-fun Ops_7Mask@6 () T@U)
(declare-fun Ops_7Mask@5 () T@U)
(declare-fun maskTransfer@4 () Real)
(declare-fun Result_8Mask () T@U)
(declare-fun b_17@6 () Bool)
(declare-fun neededTransfer@8 () Real)
(declare-fun initNeededTransfer@1 () Real)
(declare-fun b_20@0 () Bool)
(declare-fun b_20@1 () Bool)
(declare-fun Result_8Heap () T@U)
(declare-fun b_20@2 () Bool)
(declare-fun b_20@3 () Bool)
(declare-fun b_20@4 () Bool)
(declare-fun takeTransfer@3 () Real)
(declare-fun neededTransfer@6 () Real)
(declare-fun b_18@9 () Bool)
(declare-fun Mask@4 () T@U)
(declare-fun Used_7Mask@5 () T@U)
(declare-fun Heap@1 () T@U)
(declare-fun neededTransfer@7 () Real)
(declare-fun Used_7Mask@6 () T@U)
(declare-fun b_18@10 () Bool)
(declare-fun b_18@11 () Bool)
(declare-fun Mask@5 () T@U)
(declare-fun Heap@2 () T@U)
(declare-fun maskTransfer@3 () Real)
(declare-fun takeTransfer@2 () Real)
(declare-fun Used_7Mask@3 () T@U)
(declare-fun b_18@6 () Bool)
(declare-fun neededTransfer@4 () Real)
(declare-fun Ops_7Mask@3 () T@U)
(declare-fun neededTransfer@5 () Real)
(declare-fun Used_7Mask@4 () T@U)
(declare-fun b_18@7 () Bool)
(declare-fun b_18@8 () Bool)
(declare-fun Ops_7Mask@4 () T@U)
(declare-fun maskTransfer@2 () Real)
(declare-fun Result_7Mask () T@U)
(declare-fun b_17@5 () Bool)
(declare-fun neededTransfer@3 () Real)
(declare-fun initNeededTransfer@0 () Real)
(declare-fun b_19@0 () Bool)
(declare-fun b_19@1 () Bool)
(declare-fun Result_7Heap () T@U)
(declare-fun b_19@2 () Bool)
(declare-fun b_19@3 () Bool)
(declare-fun b_19@4 () Bool)
(declare-fun takeTransfer@1 () Real)
(declare-fun Mask@2 () T@U)
(declare-fun neededTransfer@1 () Real)
(declare-fun b_18@3 () Bool)
(declare-fun Used_7Mask@1 () T@U)
(declare-fun Heap@@9 () T@U)
(declare-fun neededTransfer@2 () Real)
(declare-fun Used_7Mask@2 () T@U)
(declare-fun b_18@4 () Bool)
(declare-fun b_18@5 () Bool)
(declare-fun Mask@3 () T@U)
(declare-fun Heap@0 () T@U)
(declare-fun maskTransfer@1 () Real)
(declare-fun takeTransfer@0 () Real)
(declare-fun Ops_7Mask@1 () T@U)
(declare-fun b_18@0 () Bool)
(declare-fun neededTransfer@0 () Real)
(declare-fun Used_7Mask@0 () T@U)
(declare-fun b_18@1 () Bool)
(declare-fun b_18@2 () Bool)
(declare-fun Ops_7Mask@2 () T@U)
(declare-fun maskTransfer@0 () Real)
(declare-fun b_17@4 () Bool)
(declare-fun b_17@3 () Bool)
(declare-fun b_18 () Bool)
(declare-fun b_17@0 () Bool)
(declare-fun b_17@1 () Bool)
(declare-fun Ops_7Mask@0 () T@U)
(declare-fun b_17@2 () Bool)
(declare-fun Mask@0 () T@U)
(declare-fun Mask@1 () T@U)
(declare-fun b_17 () Bool)
(declare-fun b_16@0 () Bool)
(declare-fun b_16 () Bool)
(declare-fun Used_6Heap@0 () T@U)
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (= (type Heap@5) (MapType1Type RefType)) (= (type x@@8) RefType)) (= (type AssertMask@0) (MapType0Type RefType realType))) (= (type Mask@9) (MapType0Type RefType realType))) (= (type Used_7Mask@11) (MapType0Type RefType realType))) (= (type Result_9Heap) (MapType1Type RefType))) (= (type Result_9Mask) (MapType0Type RefType realType))) (= (type Ops_7Mask) (MapType0Type RefType realType))) (= (type Ops_7Heap@0) (MapType1Type RefType))) (= (type Used_7Heap@0) (MapType1Type RefType))) (= (type Mask@8) (MapType0Type RefType realType))) (= (type Heap@3) (MapType1Type RefType))) (= (type Mask@6) (MapType0Type RefType realType))) (= (type Used_7Mask@9) (MapType0Type RefType realType))) (= (type Used_7Mask@10) (MapType0Type RefType realType))) (= (type Mask@7) (MapType0Type RefType realType))) (= (type Heap@4) (MapType1Type RefType))) (= (type Used_7Mask@7) (MapType0Type RefType realType))) (= (type Used_7Mask@8) (MapType0Type RefType realType))) (= (type Ops_7Mask@6) (MapType0Type RefType realType))) (= (type Ops_7Mask@5) (MapType0Type RefType realType))) (= (type Result_8Mask) (MapType0Type RefType realType))) (= (type Result_8Heap) (MapType1Type RefType))) (= (type Mask@4) (MapType0Type RefType realType))) (= (type Used_7Mask@5) (MapType0Type RefType realType))) (= (type Heap@1) (MapType1Type RefType))) (= (type Used_7Mask@6) (MapType0Type RefType realType))) (= (type Mask@5) (MapType0Type RefType realType))) (= (type Heap@2) (MapType1Type RefType))) (= (type Used_7Mask@3) (MapType0Type RefType realType))) (= (type Ops_7Mask@3) (MapType0Type RefType realType))) (= (type Used_7Mask@4) (MapType0Type RefType realType))) (= (type Ops_7Mask@4) (MapType0Type RefType realType))) (= (type Result_7Mask) (MapType0Type RefType realType))) (= (type Result_7Heap) (MapType1Type RefType))) (= (type Mask@2) (MapType0Type RefType realType))) (= (type Used_7Mask@1) (MapType0Type RefType realType))) (= (type Heap@@9) (MapType1Type RefType))) (= (type Used_7Mask@2) (MapType0Type RefType realType))) (= (type Mask@3) (MapType0Type RefType realType))) (= (type Heap@0) (MapType1Type RefType))) (= (type Ops_7Mask@1) (MapType0Type RefType realType))) (= (type Used_7Mask@0) (MapType0Type RefType realType))) (= (type Ops_7Mask@2) (MapType0Type RefType realType))) (= (type Ops_7Mask@0) (MapType0Type RefType realType))) (= (type Mask@0) (MapType0Type RefType realType))) (= (type Mask@1) (MapType0Type RefType realType))) (= (type Used_6Heap@0) (MapType1Type RefType))))
(set-info :boogie-vc-id test20b)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 73) (let ((anon48_correct true))
(let ((anon47_correct  (=> (= AssertMask@0 (MapType0Store Mask@9 x@@8 h (real_2_U (- (U_2_real (MapType0Select Mask@9 x@@8 h)) FullPerm)))) (=> (and (state Heap@5 Mask@9) (= (ControlFlow 0 3) 1)) anon48_correct))))
(let ((anon73_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 6) 3)) anon47_correct)))
(let ((anon73_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 4) (- 0 5)) (<= FullPerm (U_2_real (MapType0Select Mask@9 x@@8 h)))) (=> (<= FullPerm (U_2_real (MapType0Select Mask@9 x@@8 h))) (=> (= (ControlFlow 0 4) 3) anon47_correct))))))
(let ((anon72_Then_correct  (=> (U_2_bool (MapType1Select Heap@5 x@@8 f_7)) (and (=> (= (ControlFlow 0 7) 4) anon73_Then_correct) (=> (= (ControlFlow 0 7) 6) anon73_Else_correct)))))
(let ((anon72_Else_correct  (=> (and (not (U_2_bool (MapType1Select Heap@5 x@@8 f_7))) (= (ControlFlow 0 2) 1)) anon48_correct)))
(let ((anon44_correct  (and (=> (= (ControlFlow 0 8) (- 0 13)) (=> (and (and b_17@7 b_17@7) b_18@18) (and (= neededTransfer@13 0.0) (= (U_2_real (MapType0Select Used_7Mask@11 x@@8 h)) initNeededTransfer@2)))) (=> (=> (and (and b_17@7 b_17@7) b_18@18) (and (= neededTransfer@13 0.0) (= (U_2_real (MapType0Select Used_7Mask@11 x@@8 h)) initNeededTransfer@2))) (=> (and (= b_21@0  (and b_17@7 b_18@18)) (= b_21@1  (and b_21@0 (state Result_9Heap Result_9Mask)))) (=> (and (and (and (= b_21@2  (and b_21@1 (sumMask Result_9Mask Ops_7Mask Used_7Mask@11))) (= b_21@3  (and (and b_21@2 (IdenticalOnKnownLocations Ops_7Heap@0 Result_9Heap Ops_7Mask)) (IdenticalOnKnownLocations Used_7Heap@0 Result_9Heap Used_7Mask@11)))) (and (= b_21@4  (and b_21@3 (state Result_9Heap Result_9Mask))) (= b_17@8  (and b_17@7 b_21@4)))) (and (and (= Mask@9 (MapType0Store Mask@8 null (wand_1 x@@8 FullPerm x@@8 FullPerm x@@8 x@@8 FullPerm NoPerm x@@8 x@@8 FullPerm NoPerm) (real_2_U (+ (U_2_real (MapType0Select Mask@8 null (wand_1 x@@8 FullPerm x@@8 FullPerm x@@8 x@@8 FullPerm NoPerm x@@8 x@@8 FullPerm NoPerm))) FullPerm)))) (state Heap@5 Mask@9)) (and (state Heap@5 Mask@9) (state Heap@5 Mask@9)))) (and (=> (= (ControlFlow 0 8) (- 0 12)) (or (and (= (U_2_real (MapType0Select Mask@9 x@@8 g)) FullPerm) (= (U_2_real (MapType0Select Mask@9 x@@8 h)) NoPerm)) (and (= (U_2_real (MapType0Select Mask@9 x@@8 h)) FullPerm) (= (U_2_real (MapType0Select Mask@9 x@@8 g)) NoPerm)))) (=> (or (and (= (U_2_real (MapType0Select Mask@9 x@@8 g)) FullPerm) (= (U_2_real (MapType0Select Mask@9 x@@8 h)) NoPerm)) (and (= (U_2_real (MapType0Select Mask@9 x@@8 h)) FullPerm) (= (U_2_real (MapType0Select Mask@9 x@@8 g)) NoPerm))) (=> (state Heap@5 Mask@9) (and (=> (= (ControlFlow 0 8) (- 0 11)) (or (= (U_2_real (MapType0Select Mask@9 x@@8 g)) FullPerm) (= (U_2_real (MapType0Select Mask@9 x@@8 h)) FullPerm))) (=> (or (= (U_2_real (MapType0Select Mask@9 x@@8 g)) FullPerm) (= (U_2_real (MapType0Select Mask@9 x@@8 h)) FullPerm)) (and (=> (= (ControlFlow 0 8) (- 0 10)) (= (+ (U_2_real (MapType0Select Mask@9 x@@8 g)) (U_2_real (MapType0Select Mask@9 x@@8 h))) FullPerm)) (=> (= (+ (U_2_real (MapType0Select Mask@9 x@@8 g)) (U_2_real (MapType0Select Mask@9 x@@8 h))) FullPerm) (=> (state Heap@5 Mask@9) (and (=> (= (ControlFlow 0 8) (- 0 9)) (HasDirectPerm Mask@9 x@@8 f_7)) (=> (HasDirectPerm Mask@9 x@@8 f_7) (and (=> (= (ControlFlow 0 8) 7) anon72_Then_correct) (=> (= (ControlFlow 0 8) 2) anon72_Else_correct))))))))))))))))))
(let ((anon71_Else_correct  (=> (>= 0.0 takeTransfer@5) (=> (and (= Heap@5 Heap@3) (= neededTransfer@13 neededTransfer@11)) (=> (and (and (= Mask@8 Mask@6) (= b_18@18 b_18@15)) (and (= Used_7Mask@11 Used_7Mask@9) (= (ControlFlow 0 16) 8))) anon44_correct)))))
(let ((anon71_Then_correct  (=> (> takeTransfer@5 0.0) (=> (and (and (= neededTransfer@12 (- neededTransfer@11 takeTransfer@5)) (= Used_7Mask@10 (MapType0Store Used_7Mask@9 x@@8 h (real_2_U (+ (U_2_real (MapType0Select Used_7Mask@9 x@@8 h)) takeTransfer@5))))) (and (= b_18@16  (and b_18@15 (state Used_7Heap@0 Used_7Mask@10))) (= b_18@17  (and b_18@16 (= (MapType1Select Heap@3 x@@8 h) (MapType1Select Used_7Heap@0 x@@8 h)))))) (=> (and (and (and (= Mask@7 (MapType0Store Mask@6 x@@8 h (real_2_U (- (U_2_real (MapType0Select Mask@6 x@@8 h)) takeTransfer@5)))) (= Heap@4 (MapType1Store Heap@3 null (|wand_1#sm| x@@8 FullPerm x@@8 FullPerm x@@8 x@@8 FullPerm NoPerm x@@8 x@@8 FullPerm NoPerm) (MapType0Store (MapType1Select Heap@3 null (|wand_1#sm| x@@8 FullPerm x@@8 FullPerm x@@8 x@@8 FullPerm NoPerm x@@8 x@@8 FullPerm NoPerm)) x@@8 h (bool_2_U true))))) (and (= Heap@5 Heap@4) (= neededTransfer@13 neededTransfer@12))) (and (and (= Mask@8 Mask@7) (= b_18@18 b_18@17)) (and (= Used_7Mask@11 Used_7Mask@10) (= (ControlFlow 0 15) 8)))) anon44_correct)))))
(let ((anon70_Else_correct  (=> (and (< maskTransfer@5 neededTransfer@11) (= takeTransfer@5 maskTransfer@5)) (and (=> (= (ControlFlow 0 18) 15) anon71_Then_correct) (=> (= (ControlFlow 0 18) 16) anon71_Else_correct)))))
(let ((anon70_Then_correct  (=> (and (<= neededTransfer@11 maskTransfer@5) (= takeTransfer@5 neededTransfer@11)) (and (=> (= (ControlFlow 0 17) 15) anon71_Then_correct) (=> (= (ControlFlow 0 17) 16) anon71_Else_correct)))))
(let ((anon69_Then_correct  (=> (and (and (and (and (and b_17@7 b_17@7) b_18@15) true) (> neededTransfer@11 0.0)) (= maskTransfer@5 (U_2_real (MapType0Select Mask@6 x@@8 h)))) (and (=> (= (ControlFlow 0 19) 17) anon70_Then_correct) (=> (= (ControlFlow 0 19) 18) anon70_Else_correct)))))
(let ((anon69_Else_correct  (=> (not (and (and (and (and b_17@7 b_17@7) b_18@15) true) (> neededTransfer@11 0.0))) (=> (and (= Heap@5 Heap@3) (= neededTransfer@13 neededTransfer@11)) (=> (and (and (= Mask@8 Mask@6) (= b_18@18 b_18@15)) (and (= Used_7Mask@11 Used_7Mask@9) (= (ControlFlow 0 14) 8))) anon44_correct)))))
(let ((anon68_Else_correct  (=> (and (and (>= 0.0 takeTransfer@4) (= Used_7Mask@9 Used_7Mask@7)) (and (= b_18@15 b_18@12) (= neededTransfer@11 neededTransfer@9))) (and (=> (= (ControlFlow 0 22) 19) anon69_Then_correct) (=> (= (ControlFlow 0 22) 14) anon69_Else_correct)))))
(let ((anon68_Then_correct  (=> (> takeTransfer@4 0.0) (=> (and (and (and (= neededTransfer@10 (- neededTransfer@9 takeTransfer@4)) (= Used_7Mask@8 (MapType0Store Used_7Mask@7 x@@8 h (real_2_U (+ (U_2_real (MapType0Select Used_7Mask@7 x@@8 h)) takeTransfer@4))))) (and (= b_18@13  (and b_18@12 (state Used_7Heap@0 Used_7Mask@8))) (= b_18@14  (and b_18@13 (= (MapType1Select Ops_7Heap@0 x@@8 h) (MapType1Select Used_7Heap@0 x@@8 h)))))) (and (and (= Ops_7Mask@6 (MapType0Store Ops_7Mask@5 x@@8 h (real_2_U (- (U_2_real (MapType0Select Ops_7Mask@5 x@@8 h)) takeTransfer@4)))) (= Used_7Mask@9 Used_7Mask@8)) (and (= b_18@15 b_18@14) (= neededTransfer@11 neededTransfer@10)))) (and (=> (= (ControlFlow 0 21) 19) anon69_Then_correct) (=> (= (ControlFlow 0 21) 14) anon69_Else_correct))))))
(let ((anon67_Else_correct  (=> (and (< maskTransfer@4 neededTransfer@9) (= takeTransfer@4 maskTransfer@4)) (and (=> (= (ControlFlow 0 24) 21) anon68_Then_correct) (=> (= (ControlFlow 0 24) 22) anon68_Else_correct)))))
(let ((anon67_Then_correct  (=> (and (<= neededTransfer@9 maskTransfer@4) (= takeTransfer@4 neededTransfer@9)) (and (=> (= (ControlFlow 0 23) 21) anon68_Then_correct) (=> (= (ControlFlow 0 23) 22) anon68_Else_correct)))))
(let ((anon66_Then_correct  (=> (and (and (and (and (and b_17@7 b_17@7) b_18@12) true) (> neededTransfer@9 0.0)) (= maskTransfer@4 (U_2_real (MapType0Select Ops_7Mask@5 x@@8 h)))) (and (=> (= (ControlFlow 0 25) 23) anon67_Then_correct) (=> (= (ControlFlow 0 25) 24) anon67_Else_correct)))))
(let ((anon66_Else_correct  (=> (and (and (not (and (and (and (and b_17@7 b_17@7) b_18@12) true) (> neededTransfer@9 0.0))) (= Used_7Mask@9 Used_7Mask@7)) (and (= b_18@15 b_18@12) (= neededTransfer@11 neededTransfer@9))) (and (=> (= (ControlFlow 0 20) 19) anon69_Then_correct) (=> (= (ControlFlow 0 20) 14) anon69_Else_correct)))))
(let ((anon32_correct  (=> (and (= neededTransfer@9 (ite  (not (U_2_bool (MapType1Select Used_7Heap@0 x@@8 f_7))) FullPerm NoPerm)) (= initNeededTransfer@2 (+ (U_2_real (MapType0Select Used_7Mask@7 x@@8 h)) neededTransfer@9))) (and (=> (= (ControlFlow 0 26) (- 0 27)) (>= neededTransfer@9 0.0)) (=> (>= neededTransfer@9 0.0) (and (=> (= (ControlFlow 0 26) 25) anon66_Then_correct) (=> (= (ControlFlow 0 26) 20) anon66_Else_correct)))))))
(let ((anon65_Else_correct  (=> (and (not b_17@7) (= (ControlFlow 0 31) 26)) anon32_correct)))
(let ((anon65_Then_correct  (=> b_17@7 (and (=> (= (ControlFlow 0 29) (- 0 30)) (HasDirectPerm Result_8Mask x@@8 f_7)) (=> (HasDirectPerm Result_8Mask x@@8 f_7) (=> (= (ControlFlow 0 29) 26) anon32_correct))))))
(let ((anon64_Then_correct  (=> (and (and b_17@7 b_17@7) b_18@12) (and (=> (= (ControlFlow 0 32) 29) anon65_Then_correct) (=> (= (ControlFlow 0 32) 31) anon65_Else_correct)))))
(let ((anon64_Else_correct  (=> (and (not (and (and b_17@7 b_17@7) b_18@12)) (= (ControlFlow 0 28) 26)) anon32_correct)))
(let ((anon29_correct  (and (=> (= (ControlFlow 0 33) (- 0 34)) (=> (and (and b_17@6 b_17@6) b_18@12) (and (= neededTransfer@8 0.0) (= (U_2_real (MapType0Select Used_7Mask@7 x@@8 g)) initNeededTransfer@1)))) (=> (=> (and (and b_17@6 b_17@6) b_18@12) (and (= neededTransfer@8 0.0) (= (U_2_real (MapType0Select Used_7Mask@7 x@@8 g)) initNeededTransfer@1))) (=> (and (= b_20@0  (and b_17@6 b_18@12)) (= b_20@1  (and b_20@0 (state Result_8Heap Result_8Mask)))) (=> (and (and (= b_20@2  (and b_20@1 (sumMask Result_8Mask Ops_7Mask@5 Used_7Mask@7))) (= b_20@3  (and (and b_20@2 (IdenticalOnKnownLocations Ops_7Heap@0 Result_8Heap Ops_7Mask@5)) (IdenticalOnKnownLocations Used_7Heap@0 Result_8Heap Used_7Mask@7)))) (and (= b_20@4  (and b_20@3 (state Result_8Heap Result_8Mask))) (= b_17@7  (and b_17@6 b_20@4)))) (and (=> (= (ControlFlow 0 33) 32) anon64_Then_correct) (=> (= (ControlFlow 0 33) 28) anon64_Else_correct))))))))
(let ((anon63_Else_correct  (=> (>= 0.0 takeTransfer@3) (=> (and (= neededTransfer@8 neededTransfer@6) (= b_18@12 b_18@9)) (=> (and (and (= Mask@6 Mask@4) (= Used_7Mask@7 Used_7Mask@5)) (and (= Heap@3 Heap@1) (= (ControlFlow 0 37) 33))) anon29_correct)))))
(let ((anon63_Then_correct  (=> (> takeTransfer@3 0.0) (=> (and (and (= neededTransfer@7 (- neededTransfer@6 takeTransfer@3)) (= Used_7Mask@6 (MapType0Store Used_7Mask@5 x@@8 g (real_2_U (+ (U_2_real (MapType0Select Used_7Mask@5 x@@8 g)) takeTransfer@3))))) (and (= b_18@10  (and b_18@9 (state Used_7Heap@0 Used_7Mask@6))) (= b_18@11  (and b_18@10 (= (U_2_int (MapType1Select Heap@1 x@@8 g)) (U_2_int (MapType1Select Used_7Heap@0 x@@8 g))))))) (=> (and (and (and (= Mask@5 (MapType0Store Mask@4 x@@8 g (real_2_U (- (U_2_real (MapType0Select Mask@4 x@@8 g)) takeTransfer@3)))) (= Heap@2 (MapType1Store Heap@1 null (|wand_1#sm| x@@8 FullPerm x@@8 FullPerm x@@8 x@@8 FullPerm NoPerm x@@8 x@@8 FullPerm NoPerm) (MapType0Store (MapType1Select Heap@1 null (|wand_1#sm| x@@8 FullPerm x@@8 FullPerm x@@8 x@@8 FullPerm NoPerm x@@8 x@@8 FullPerm NoPerm)) x@@8 g (bool_2_U true))))) (and (= neededTransfer@8 neededTransfer@7) (= b_18@12 b_18@11))) (and (and (= Mask@6 Mask@5) (= Used_7Mask@7 Used_7Mask@6)) (and (= Heap@3 Heap@2) (= (ControlFlow 0 36) 33)))) anon29_correct)))))
(let ((anon62_Else_correct  (=> (and (< maskTransfer@3 neededTransfer@6) (= takeTransfer@3 maskTransfer@3)) (and (=> (= (ControlFlow 0 39) 36) anon63_Then_correct) (=> (= (ControlFlow 0 39) 37) anon63_Else_correct)))))
(let ((anon62_Then_correct  (=> (and (<= neededTransfer@6 maskTransfer@3) (= takeTransfer@3 neededTransfer@6)) (and (=> (= (ControlFlow 0 38) 36) anon63_Then_correct) (=> (= (ControlFlow 0 38) 37) anon63_Else_correct)))))
(let ((anon61_Then_correct  (=> (and (and (and (and (and b_17@6 b_17@6) b_18@9) true) (> neededTransfer@6 0.0)) (= maskTransfer@3 (U_2_real (MapType0Select Mask@4 x@@8 g)))) (and (=> (= (ControlFlow 0 40) 38) anon62_Then_correct) (=> (= (ControlFlow 0 40) 39) anon62_Else_correct)))))
(let ((anon61_Else_correct  (=> (not (and (and (and (and b_17@6 b_17@6) b_18@9) true) (> neededTransfer@6 0.0))) (=> (and (= neededTransfer@8 neededTransfer@6) (= b_18@12 b_18@9)) (=> (and (and (= Mask@6 Mask@4) (= Used_7Mask@7 Used_7Mask@5)) (and (= Heap@3 Heap@1) (= (ControlFlow 0 35) 33))) anon29_correct)))))
(let ((anon60_Else_correct  (=> (>= 0.0 takeTransfer@2) (=> (and (and (= Used_7Mask@5 Used_7Mask@3) (= b_18@9 b_18@6)) (and (= neededTransfer@6 neededTransfer@4) (= Ops_7Mask@5 Ops_7Mask@3))) (and (=> (= (ControlFlow 0 43) 40) anon61_Then_correct) (=> (= (ControlFlow 0 43) 35) anon61_Else_correct))))))
(let ((anon60_Then_correct  (=> (and (> takeTransfer@2 0.0) (= neededTransfer@5 (- neededTransfer@4 takeTransfer@2))) (=> (and (and (and (= Used_7Mask@4 (MapType0Store Used_7Mask@3 x@@8 g (real_2_U (+ (U_2_real (MapType0Select Used_7Mask@3 x@@8 g)) takeTransfer@2)))) (= b_18@7  (and b_18@6 (state Used_7Heap@0 Used_7Mask@4)))) (and (= b_18@8  (and b_18@7 (= (U_2_int (MapType1Select Ops_7Heap@0 x@@8 g)) (U_2_int (MapType1Select Used_7Heap@0 x@@8 g))))) (= Ops_7Mask@4 (MapType0Store Ops_7Mask@3 x@@8 g (real_2_U (- (U_2_real (MapType0Select Ops_7Mask@3 x@@8 g)) takeTransfer@2)))))) (and (and (= Used_7Mask@5 Used_7Mask@4) (= b_18@9 b_18@8)) (and (= neededTransfer@6 neededTransfer@5) (= Ops_7Mask@5 Ops_7Mask@4)))) (and (=> (= (ControlFlow 0 42) 40) anon61_Then_correct) (=> (= (ControlFlow 0 42) 35) anon61_Else_correct))))))
(let ((anon59_Else_correct  (=> (and (< maskTransfer@2 neededTransfer@4) (= takeTransfer@2 maskTransfer@2)) (and (=> (= (ControlFlow 0 45) 42) anon60_Then_correct) (=> (= (ControlFlow 0 45) 43) anon60_Else_correct)))))
(let ((anon59_Then_correct  (=> (and (<= neededTransfer@4 maskTransfer@2) (= takeTransfer@2 neededTransfer@4)) (and (=> (= (ControlFlow 0 44) 42) anon60_Then_correct) (=> (= (ControlFlow 0 44) 43) anon60_Else_correct)))))
(let ((anon58_Then_correct  (=> (and (and (and (and (and b_17@6 b_17@6) b_18@6) true) (> neededTransfer@4 0.0)) (= maskTransfer@2 (U_2_real (MapType0Select Ops_7Mask@3 x@@8 g)))) (and (=> (= (ControlFlow 0 46) 44) anon59_Then_correct) (=> (= (ControlFlow 0 46) 45) anon59_Else_correct)))))
(let ((anon58_Else_correct  (=> (not (and (and (and (and b_17@6 b_17@6) b_18@6) true) (> neededTransfer@4 0.0))) (=> (and (and (= Used_7Mask@5 Used_7Mask@3) (= b_18@9 b_18@6)) (and (= neededTransfer@6 neededTransfer@4) (= Ops_7Mask@5 Ops_7Mask@3))) (and (=> (= (ControlFlow 0 41) 40) anon61_Then_correct) (=> (= (ControlFlow 0 41) 35) anon61_Else_correct))))))
(let ((anon17_correct  (=> (and (= neededTransfer@4 (ite (U_2_bool (MapType1Select Used_7Heap@0 x@@8 f_7)) FullPerm NoPerm)) (= initNeededTransfer@1 (+ (U_2_real (MapType0Select Used_7Mask@3 x@@8 g)) neededTransfer@4))) (and (=> (= (ControlFlow 0 47) (- 0 48)) (>= neededTransfer@4 0.0)) (=> (>= neededTransfer@4 0.0) (and (=> (= (ControlFlow 0 47) 46) anon58_Then_correct) (=> (= (ControlFlow 0 47) 41) anon58_Else_correct)))))))
(let ((anon57_Else_correct  (=> (and (not b_17@6) (= (ControlFlow 0 52) 47)) anon17_correct)))
(let ((anon57_Then_correct  (=> b_17@6 (and (=> (= (ControlFlow 0 50) (- 0 51)) (HasDirectPerm Result_7Mask x@@8 f_7)) (=> (HasDirectPerm Result_7Mask x@@8 f_7) (=> (= (ControlFlow 0 50) 47) anon17_correct))))))
(let ((anon56_Then_correct  (=> (and (and b_17@6 b_17@6) b_18@6) (and (=> (= (ControlFlow 0 53) 50) anon57_Then_correct) (=> (= (ControlFlow 0 53) 52) anon57_Else_correct)))))
(let ((anon56_Else_correct  (=> (and (not (and (and b_17@6 b_17@6) b_18@6)) (= (ControlFlow 0 49) 47)) anon17_correct)))
(let ((anon14_correct  (and (=> (= (ControlFlow 0 54) (- 0 55)) (=> (and (and b_17@5 b_17@5) b_18@6) (and (= neededTransfer@3 0.0) (= (U_2_real (MapType0Select Used_7Mask@3 x@@8 f_7)) initNeededTransfer@0)))) (=> (=> (and (and b_17@5 b_17@5) b_18@6) (and (= neededTransfer@3 0.0) (= (U_2_real (MapType0Select Used_7Mask@3 x@@8 f_7)) initNeededTransfer@0))) (=> (and (= b_19@0  (and b_17@5 b_18@6)) (= b_19@1  (and b_19@0 (state Result_7Heap Result_7Mask)))) (=> (and (and (= b_19@2  (and b_19@1 (sumMask Result_7Mask Ops_7Mask@3 Used_7Mask@3))) (= b_19@3  (and (and b_19@2 (IdenticalOnKnownLocations Ops_7Heap@0 Result_7Heap Ops_7Mask@3)) (IdenticalOnKnownLocations Used_7Heap@0 Result_7Heap Used_7Mask@3)))) (and (= b_19@4  (and b_19@3 (state Result_7Heap Result_7Mask))) (= b_17@6  (and b_17@5 b_19@4)))) (and (=> (= (ControlFlow 0 54) 53) anon56_Then_correct) (=> (= (ControlFlow 0 54) 49) anon56_Else_correct))))))))
(let ((anon55_Else_correct  (=> (>= 0.0 takeTransfer@1) (=> (and (= Mask@4 Mask@2) (= neededTransfer@3 neededTransfer@1)) (=> (and (and (= b_18@6 b_18@3) (= Used_7Mask@3 Used_7Mask@1)) (and (= Heap@1 Heap@@9) (= (ControlFlow 0 58) 54))) anon14_correct)))))
(let ((anon55_Then_correct  (=> (> takeTransfer@1 0.0) (=> (and (and (= neededTransfer@2 (- neededTransfer@1 takeTransfer@1)) (= Used_7Mask@2 (MapType0Store Used_7Mask@1 x@@8 f_7 (real_2_U (+ (U_2_real (MapType0Select Used_7Mask@1 x@@8 f_7)) takeTransfer@1))))) (and (= b_18@4  (and b_18@3 (state Used_7Heap@0 Used_7Mask@2))) (= b_18@5  (and b_18@4 (= (U_2_bool (MapType1Select Heap@@9 x@@8 f_7)) (U_2_bool (MapType1Select Used_7Heap@0 x@@8 f_7))))))) (=> (and (and (and (= Mask@3 (MapType0Store Mask@2 x@@8 f_7 (real_2_U (- (U_2_real (MapType0Select Mask@2 x@@8 f_7)) takeTransfer@1)))) (= Heap@0 (MapType1Store Heap@@9 null (|wand_1#sm| x@@8 FullPerm x@@8 FullPerm x@@8 x@@8 FullPerm NoPerm x@@8 x@@8 FullPerm NoPerm) (MapType0Store (MapType1Select Heap@@9 null (|wand_1#sm| x@@8 FullPerm x@@8 FullPerm x@@8 x@@8 FullPerm NoPerm x@@8 x@@8 FullPerm NoPerm)) x@@8 f_7 (bool_2_U true))))) (and (= Mask@4 Mask@3) (= neededTransfer@3 neededTransfer@2))) (and (and (= b_18@6 b_18@5) (= Used_7Mask@3 Used_7Mask@2)) (and (= Heap@1 Heap@0) (= (ControlFlow 0 57) 54)))) anon14_correct)))))
(let ((anon54_Else_correct  (=> (and (< maskTransfer@1 neededTransfer@1) (= takeTransfer@1 maskTransfer@1)) (and (=> (= (ControlFlow 0 60) 57) anon55_Then_correct) (=> (= (ControlFlow 0 60) 58) anon55_Else_correct)))))
(let ((anon54_Then_correct  (=> (and (<= neededTransfer@1 maskTransfer@1) (= takeTransfer@1 neededTransfer@1)) (and (=> (= (ControlFlow 0 59) 57) anon55_Then_correct) (=> (= (ControlFlow 0 59) 58) anon55_Else_correct)))))
(let ((anon53_Then_correct  (=> (and (and (and (and (and b_17@5 b_17@5) b_18@3) true) (> neededTransfer@1 0.0)) (= maskTransfer@1 (U_2_real (MapType0Select Mask@2 x@@8 f_7)))) (and (=> (= (ControlFlow 0 61) 59) anon54_Then_correct) (=> (= (ControlFlow 0 61) 60) anon54_Else_correct)))))
(let ((anon53_Else_correct  (=> (not (and (and (and (and b_17@5 b_17@5) b_18@3) true) (> neededTransfer@1 0.0))) (=> (and (= Mask@4 Mask@2) (= neededTransfer@3 neededTransfer@1)) (=> (and (and (= b_18@6 b_18@3) (= Used_7Mask@3 Used_7Mask@1)) (and (= Heap@1 Heap@@9) (= (ControlFlow 0 56) 54))) anon14_correct)))))
(let ((anon52_Else_correct  (=> (>= 0.0 takeTransfer@0) (=> (and (and (= Ops_7Mask@3 Ops_7Mask@1) (= Used_7Mask@1 ZeroMask)) (and (= b_18@3 b_18@0) (= neededTransfer@1 FullPerm))) (and (=> (= (ControlFlow 0 64) 61) anon53_Then_correct) (=> (= (ControlFlow 0 64) 56) anon53_Else_correct))))))
(let ((anon52_Then_correct  (=> (and (> takeTransfer@0 0.0) (= neededTransfer@0 (- FullPerm takeTransfer@0))) (=> (and (and (and (= Used_7Mask@0 (MapType0Store ZeroMask x@@8 f_7 (real_2_U (+ (U_2_real (MapType0Select ZeroMask x@@8 f_7)) takeTransfer@0)))) (= b_18@1  (and b_18@0 (state Used_7Heap@0 Used_7Mask@0)))) (and (= b_18@2  (and b_18@1 (= (U_2_bool (MapType1Select Ops_7Heap@0 x@@8 f_7)) (U_2_bool (MapType1Select Used_7Heap@0 x@@8 f_7))))) (= Ops_7Mask@2 (MapType0Store Ops_7Mask@1 x@@8 f_7 (real_2_U (- (U_2_real (MapType0Select Ops_7Mask@1 x@@8 f_7)) takeTransfer@0)))))) (and (and (= Ops_7Mask@3 Ops_7Mask@2) (= Used_7Mask@1 Used_7Mask@0)) (and (= b_18@3 b_18@2) (= neededTransfer@1 neededTransfer@0)))) (and (=> (= (ControlFlow 0 63) 61) anon53_Then_correct) (=> (= (ControlFlow 0 63) 56) anon53_Else_correct))))))
(let ((anon51_Else_correct  (=> (and (< maskTransfer@0 FullPerm) (= takeTransfer@0 maskTransfer@0)) (and (=> (= (ControlFlow 0 66) 63) anon52_Then_correct) (=> (= (ControlFlow 0 66) 64) anon52_Else_correct)))))
(let ((anon51_Then_correct  (=> (and (<= FullPerm maskTransfer@0) (= takeTransfer@0 FullPerm)) (and (=> (= (ControlFlow 0 65) 63) anon52_Then_correct) (=> (= (ControlFlow 0 65) 64) anon52_Else_correct)))))
(let ((anon50_Then_correct  (=> (and (and (and (and (and b_17@5 b_17@5) b_18@0) true) (> FullPerm 0.0)) (= maskTransfer@0 (U_2_real (MapType0Select Ops_7Mask@1 x@@8 f_7)))) (and (=> (= (ControlFlow 0 67) 65) anon51_Then_correct) (=> (= (ControlFlow 0 67) 66) anon51_Else_correct)))))
(let ((anon50_Else_correct  (=> (not (and (and (and (and b_17@5 b_17@5) b_18@0) true) (> FullPerm 0.0))) (=> (and (and (= Ops_7Mask@3 Ops_7Mask@1) (= Used_7Mask@1 ZeroMask)) (and (= b_18@3 b_18@0) (= neededTransfer@1 FullPerm))) (and (=> (= (ControlFlow 0 62) 61) anon53_Then_correct) (=> (= (ControlFlow 0 62) 56) anon53_Else_correct))))))
(let ((anon2_correct  (=> (and (and (= b_17@4  (and b_17@3 (state Ops_7Heap@0 Ops_7Mask@1))) (= b_17@5  (and b_17@4 (state Ops_7Heap@0 Ops_7Mask@1)))) (and (= b_18@0  (and b_18 (state Used_7Heap@0 ZeroMask))) (= initNeededTransfer@0 (+ (U_2_real (MapType0Select ZeroMask x@@8 f_7)) FullPerm)))) (and (=> (= (ControlFlow 0 68) (- 0 69)) (>= FullPerm 0.0)) (=> (>= FullPerm 0.0) (and (=> (= (ControlFlow 0 68) 67) anon50_Then_correct) (=> (= (ControlFlow 0 68) 62) anon50_Else_correct)))))))
(let ((anon49_Else_correct  (=> (and (and (not b_17@0) (= Ops_7Mask@1 ZeroMask)) (and (= b_17@3 b_17@0) (= (ControlFlow 0 71) 68))) anon2_correct)))
(let ((anon49_Then_correct  (=> b_17@0 (=> (and (= b_17@1  (and b_17@0 (not (= x@@8 null)))) (= Ops_7Mask@0 (MapType0Store ZeroMask x@@8 f_7 (real_2_U (+ (U_2_real (MapType0Select ZeroMask x@@8 f_7)) FullPerm))))) (=> (and (and (= b_17@2  (and b_17@1 (state Ops_7Heap@0 Ops_7Mask@0))) (= Ops_7Mask@1 Ops_7Mask@0)) (and (= b_17@3 b_17@2) (= (ControlFlow 0 70) 68))) anon2_correct)))))
(let ((anon0_correct  (=> (and (state Heap@@9 ZeroMask) (U_2_bool (MapType1Select Heap@@9 x@@8 $allocated))) (=> (and (and (not (= x@@8 null)) (= Mask@0 (MapType0Store ZeroMask x@@8 f_7 (real_2_U (+ (U_2_real (MapType0Select ZeroMask x@@8 f_7)) FullPerm))))) (and (state Heap@@9 Mask@0) (not (= x@@8 null)))) (=> (and (and (and (= Mask@1 (MapType0Store Mask@0 x@@8 g (real_2_U (+ (U_2_real (MapType0Select Mask@0 x@@8 g)) FullPerm)))) (state Heap@@9 Mask@1)) (and (not (= x@@8 null)) (= Mask@2 (MapType0Store Mask@1 x@@8 h (real_2_U (+ (U_2_real (MapType0Select Mask@1 x@@8 h)) FullPerm)))))) (and (and (state Heap@@9 Mask@2) (state Heap@@9 Mask@2)) (and (= b_17@0  (and b_17 (state Ops_7Heap@0 ZeroMask))) (= b_16@0  (and b_16 (state Used_6Heap@0 ZeroMask)))))) (and (=> (= (ControlFlow 0 72) 70) anon49_Then_correct) (=> (= (ControlFlow 0 72) 71) anon49_Else_correct)))))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 73) 72) anon0_correct)))
PreconditionGeneratedEntry_correct)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
))
(check-sat)
(get-info :reason-unknown)
(assert (not (= (ControlFlow 0 8) (- 12))))
(check-sat)
(get-info :reason-unknown)
(assert (not (= (ControlFlow 0 4) (- 5))))
(check-sat)
(pop 1)
; Invalid
(get-info :rlimit)
