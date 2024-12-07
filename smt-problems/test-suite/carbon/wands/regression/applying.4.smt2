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
(declare-fun WandMaskField (T@U) T@U)
(declare-fun |wand_1#ft| (T@U Real T@U Real T@U Real T@U Real) T@U)
(declare-fun RefType () T@T)
(declare-fun |wand_1#sm| (T@U Real T@U Real T@U Real T@U Real) T@U)
(declare-fun MapType0Type (T@T T@T) T@T)
(declare-fun MapType0TypeInv0 (T@T) T@T)
(declare-fun MapType0TypeInv1 (T@T) T@T)
(declare-fun MapType0Select (T@U T@U T@U) T@U)
(declare-fun MapType0Store (T@U T@U T@U T@U) T@U)
(declare-fun WandType_wand_1Type () T@T)
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
(declare-fun wand_5 (T@U Real T@U Real T@U Real T@U Real T@U T@U Int) T@U)
(declare-fun getPredWandId (T@U) Int)
(declare-fun WandType_wand_5Type () T@T)
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
(declare-fun |wand_4#ft| (T@U Real T@U Real T@U Int) T@U)
(declare-fun |wand_4#sm| (T@U Real T@U Real T@U Int) T@U)
(declare-fun WandType_wand_4Type () T@T)
(declare-fun wand_2 (T@U Real T@U Real T@U Real Bool) T@U)
(declare-fun WandType_wand_2Type () T@T)
(declare-fun sum (T@U T@U) Int)
(declare-fun wand (Bool T@U Real T@U Int) T@U)
(declare-fun WandType_wandType () T@T)
(declare-fun |Pair#sm| (T@U) T@U)
(declare-fun wand_1 (T@U Real T@U Real T@U Real T@U Real) T@U)
(declare-fun dummyHeap () T@U)
(declare-fun ZeroMask () T@U)
(declare-fun |wand_5#ft| (T@U Real T@U Real T@U Real T@U Real T@U T@U Int) T@U)
(declare-fun InsidePredicate (T@U T@U T@U T@U) Bool)
(declare-fun |wand#ft| (Bool T@U Real T@U Int) T@U)
(declare-fun AssumeFunctionsAbove () Int)
(declare-fun sumMask (T@U T@U T@U) Bool)
(declare-fun wand_3 (T@U Real T@U Real T@U Real) T@U)
(declare-fun wand_4 (T@U Real T@U Real T@U Int) T@U)
(declare-fun ConditionalFrame (Real T@U) T@U)
(declare-fun EmptyFrame () T@U)
(declare-fun |wand_5#sm| (T@U Real T@U Real T@U Real T@U Real T@U T@U Int) T@U)
(declare-fun NoPerm () Real)
(declare-fun |wand#sm| (Bool T@U Real T@U Int) T@U)
(declare-fun FullPerm () Real)
(declare-fun |sum#frame| (T@U T@U) Int)
(declare-fun |wand_2#ft| (T@U Real T@U Real T@U Real Bool) T@U)
(declare-fun |wand_2#sm| (T@U Real T@U Real T@U Real Bool) T@U)
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
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (= (Ctor RefType) 8) (forall ((arg0@@14 T@T) (arg1@@2 T@T) ) (! (= (Ctor (MapType0Type arg0@@14 arg1@@2)) 9)
 :qid |ctor:MapType0Type|
))) (forall ((arg0@@15 T@T) (arg1@@3 T@T) ) (! (= (MapType0TypeInv0 (MapType0Type arg0@@15 arg1@@3)) arg0@@15)
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
))) (= (Ctor WandType_wand_1Type) 10)) (= (Ctor FrameTypeType) 11)) (forall ((arg0@@20 T@U) (arg1@@7 Real) (arg2@@1 T@U) (arg3@@0 Real) (arg4 T@U) (arg5 Real) (arg6 T@U) (arg7 Real) ) (! (= (type (|wand_1#ft| arg0@@20 arg1@@7 arg2@@1 arg3@@0 arg4 arg5 arg6 arg7)) (FieldType WandType_wand_1Type FrameTypeType))
 :qid |funType:wand_1#ft|
 :pattern ( (|wand_1#ft| arg0@@20 arg1@@7 arg2@@1 arg3@@0 arg4 arg5 arg6 arg7))
))) (forall ((arg0@@21 T@U) (arg1@@8 Real) (arg2@@2 T@U) (arg3@@1 Real) (arg4@@0 T@U) (arg5@@0 Real) (arg6@@0 T@U) (arg7@@0 Real) ) (! (= (type (|wand_1#sm| arg0@@21 arg1@@8 arg2@@2 arg3@@1 arg4@@0 arg5@@0 arg6@@0 arg7@@0)) (FieldType WandType_wand_1Type (MapType0Type RefType boolType)))
 :qid |funType:wand_1#sm|
 :pattern ( (|wand_1#sm| arg0@@21 arg1@@8 arg2@@2 arg3@@1 arg4@@0 arg5@@0 arg6@@0 arg7@@0))
))))
(assert (forall ((arg1@@9 T@U) (arg2@@3 Real) (arg3@@2 T@U) (arg4@@1 Real) (arg5@@1 T@U) (arg6@@1 Real) (arg7@@1 T@U) (arg8 Real) ) (!  (=> (and (and (and (= (type arg1@@9) RefType) (= (type arg3@@2) RefType)) (= (type arg5@@1) RefType)) (= (type arg7@@1) RefType)) (= (|wand_1#sm| arg1@@9 arg2@@3 arg3@@2 arg4@@1 arg5@@1 arg6@@1 arg7@@1 arg8) (WandMaskField (|wand_1#ft| arg1@@9 arg2@@3 arg3@@2 arg4@@1 arg5@@1 arg6@@1 arg7@@1 arg8))))
 :qid |stdinbpl.234:15|
 :skolemid |33|
 :pattern ( (WandMaskField (|wand_1#ft| arg1@@9 arg2@@3 arg3@@2 arg4@@1 arg5@@1 arg6@@1 arg7@@1 arg8)))
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
(assert  (and (= (Ctor WandType_wand_5Type) 13) (forall ((arg0@@27 T@U) (arg1@@12 Real) (arg2@@6 T@U) (arg3@@4 Real) (arg4@@2 T@U) (arg5@@2 Real) (arg6@@2 T@U) (arg7@@2 Real) (arg8@@0 T@U) (arg9 T@U) (arg10 Int) ) (! (= (type (wand_5 arg0@@27 arg1@@12 arg2@@6 arg3@@4 arg4@@2 arg5@@2 arg6@@2 arg7@@2 arg8@@0 arg9 arg10)) (FieldType WandType_wand_5Type intType))
 :qid |funType:wand_5|
 :pattern ( (wand_5 arg0@@27 arg1@@12 arg2@@6 arg3@@4 arg4@@2 arg5@@2 arg6@@2 arg7@@2 arg8@@0 arg9 arg10))
))))
(assert (forall ((arg1@@13 T@U) (arg2@@7 Real) (arg3@@5 T@U) (arg4@@3 Real) (arg5@@3 T@U) (arg6@@3 Real) (arg7@@3 T@U) (arg8@@1 Real) (arg9@@0 T@U) (arg10@@0 T@U) (arg11 Int) ) (!  (=> (and (and (and (and (and (= (type arg1@@13) RefType) (= (type arg3@@5) RefType)) (= (type arg5@@3) RefType)) (= (type arg7@@3) RefType)) (= (type arg9@@0) RefType)) (= (type arg10@@0) RefType)) (= (getPredWandId (wand_5 arg1@@13 arg2@@7 arg3@@5 arg4@@3 arg5@@3 arg6@@3 arg7@@3 arg8@@1 arg9@@0 arg10@@0 arg11)) 6))
 :qid |stdinbpl.366:15|
 :skolemid |62|
 :pattern ( (wand_5 arg1@@13 arg2@@7 arg3@@5 arg4@@3 arg5@@3 arg6@@3 arg7@@3 arg8@@1 arg9@@0 arg10@@0 arg11))
)))
(assert  (and (= (Ctor PredicateType_PairType) 14) (forall ((arg0@@28 T@U) ) (! (= (type (Pair arg0@@28)) (FieldType PredicateType_PairType FrameTypeType))
 :qid |funType:Pair|
 :pattern ( (Pair arg0@@28))
))))
(assert (forall ((this T@U) ) (!  (=> (= (type this) RefType) (IsPredicateField (Pair this)))
 :qid |stdinbpl.492:15|
 :skolemid |69|
 :pattern ( (Pair this))
)))
(assert (forall ((Heap@@2 T@U) (p_1 T@U) ) (!  (=> (and (= (type Heap@@2) (MapType1Type RefType)) (= (type p_1) RefType)) (dummyFunction (int_2_U (|sum#triggerStateless| p_1))))
 :qid |stdinbpl.397:15|
 :skolemid |65|
 :pattern ( (|sum'| Heap@@2 p_1))
)))
(assert (forall ((Heap@@3 T@U) (this@@0 T@U) ) (!  (=> (and (= (type Heap@@3) (MapType1Type RefType)) (= (type this@@0) RefType)) (|Pair#everUsed| (Pair this@@0)))
 :qid |stdinbpl.511:15|
 :skolemid |73|
 :pattern ( (|Pair#trigger| Heap@@3 (Pair this@@0)))
)))
(assert  (and (and (= (Ctor WandType_wand_3Type) 15) (forall ((arg0@@29 T@U) (arg1@@14 Real) (arg2@@8 T@U) (arg3@@6 Real) (arg4@@4 T@U) (arg5@@4 Real) ) (! (= (type (|wand_3#ft| arg0@@29 arg1@@14 arg2@@8 arg3@@6 arg4@@4 arg5@@4)) (FieldType WandType_wand_3Type FrameTypeType))
 :qid |funType:wand_3#ft|
 :pattern ( (|wand_3#ft| arg0@@29 arg1@@14 arg2@@8 arg3@@6 arg4@@4 arg5@@4))
))) (forall ((arg0@@30 T@U) (arg1@@15 Real) (arg2@@9 T@U) (arg3@@7 Real) (arg4@@5 T@U) (arg5@@5 Real) ) (! (= (type (|wand_3#sm| arg0@@30 arg1@@15 arg2@@9 arg3@@7 arg4@@5 arg5@@5)) (FieldType WandType_wand_3Type (MapType0Type RefType boolType)))
 :qid |funType:wand_3#sm|
 :pattern ( (|wand_3#sm| arg0@@30 arg1@@15 arg2@@9 arg3@@7 arg4@@5 arg5@@5))
))))
(assert (forall ((arg1@@16 T@U) (arg2@@10 Real) (arg3@@8 T@U) (arg4@@6 Real) (arg5@@6 T@U) (arg6@@4 Real) ) (!  (=> (and (and (= (type arg1@@16) RefType) (= (type arg3@@8) RefType)) (= (type arg5@@6) RefType)) (= (|wand_3#sm| arg1@@16 arg2@@10 arg3@@8 arg4@@6 arg5@@6 arg6@@4) (WandMaskField (|wand_3#ft| arg1@@16 arg2@@10 arg3@@8 arg4@@6 arg5@@6 arg6@@4))))
 :qid |stdinbpl.202:15|
 :skolemid |26|
 :pattern ( (WandMaskField (|wand_3#ft| arg1@@16 arg2@@10 arg3@@8 arg4@@6 arg5@@6 arg6@@4)))
)))
(assert  (and (and (= (Ctor WandType_wand_4Type) 16) (forall ((arg0@@31 T@U) (arg1@@17 Real) (arg2@@11 T@U) (arg3@@9 Real) (arg4@@7 T@U) (arg5@@7 Int) ) (! (= (type (|wand_4#ft| arg0@@31 arg1@@17 arg2@@11 arg3@@9 arg4@@7 arg5@@7)) (FieldType WandType_wand_4Type FrameTypeType))
 :qid |funType:wand_4#ft|
 :pattern ( (|wand_4#ft| arg0@@31 arg1@@17 arg2@@11 arg3@@9 arg4@@7 arg5@@7))
))) (forall ((arg0@@32 T@U) (arg1@@18 Real) (arg2@@12 T@U) (arg3@@10 Real) (arg4@@8 T@U) (arg5@@8 Int) ) (! (= (type (|wand_4#sm| arg0@@32 arg1@@18 arg2@@12 arg3@@10 arg4@@8 arg5@@8)) (FieldType WandType_wand_4Type (MapType0Type RefType boolType)))
 :qid |funType:wand_4#sm|
 :pattern ( (|wand_4#sm| arg0@@32 arg1@@18 arg2@@12 arg3@@10 arg4@@8 arg5@@8))
))))
(assert (forall ((arg1@@19 T@U) (arg2@@13 Real) (arg3@@11 T@U) (arg4@@9 Real) (arg5@@9 T@U) (arg6@@5 Int) ) (!  (=> (and (and (= (type arg1@@19) RefType) (= (type arg3@@11) RefType)) (= (type arg5@@9) RefType)) (= (|wand_4#sm| arg1@@19 arg2@@13 arg3@@11 arg4@@9 arg5@@9 arg6@@5) (WandMaskField (|wand_4#ft| arg1@@19 arg2@@13 arg3@@11 arg4@@9 arg5@@9 arg6@@5))))
 :qid |stdinbpl.266:15|
 :skolemid |40|
 :pattern ( (WandMaskField (|wand_4#ft| arg1@@19 arg2@@13 arg3@@11 arg4@@9 arg5@@9 arg6@@5)))
)))
(assert  (and (= (Ctor WandType_wand_2Type) 17) (forall ((arg0@@33 T@U) (arg1@@20 Real) (arg2@@14 T@U) (arg3@@12 Real) (arg4@@10 T@U) (arg5@@10 Real) (arg6@@6 Bool) ) (! (= (type (wand_2 arg0@@33 arg1@@20 arg2@@14 arg3@@12 arg4@@10 arg5@@10 arg6@@6)) (FieldType WandType_wand_2Type intType))
 :qid |funType:wand_2|
 :pattern ( (wand_2 arg0@@33 arg1@@20 arg2@@14 arg3@@12 arg4@@10 arg5@@10 arg6@@6))
))))
(assert (forall ((arg1@@21 T@U) (arg2@@15 Real) (arg3@@13 T@U) (arg4@@11 Real) (arg5@@11 T@U) (arg6@@7 Real) (arg7@@4 Bool) (arg1_2 T@U) (arg2_2 Real) (arg3_2 T@U) (arg4_2 Real) (arg5_2 T@U) (arg6_2 Real) (arg7_2 Bool) ) (!  (=> (and (and (and (and (and (and (= (type arg1@@21) RefType) (= (type arg3@@13) RefType)) (= (type arg5@@11) RefType)) (= (type arg1_2) RefType)) (= (type arg3_2) RefType)) (= (type arg5_2) RefType)) (= (wand_2 arg1@@21 arg2@@15 arg3@@13 arg4@@11 arg5@@11 arg6@@7 arg7@@4) (wand_2 arg1_2 arg2_2 arg3_2 arg4_2 arg5_2 arg6_2 arg7_2))) (and (= arg1@@21 arg1_2) (and (= arg2@@15 arg2_2) (and (= arg3@@13 arg3_2) (and (= arg4@@11 arg4_2) (and (= arg5@@11 arg5_2) (and (= arg6@@7 arg6_2) (= arg7@@4 arg7_2))))))))
 :qid |stdinbpl.306:15|
 :skolemid |49|
 :pattern ( (wand_2 arg1@@21 arg2@@15 arg3@@13 arg4@@11 arg5@@11 arg6@@7 arg7@@4) (wand_2 arg1_2 arg2_2 arg3_2 arg4_2 arg5_2 arg6_2 arg7_2))
)))
(assert (forall ((Heap@@4 T@U) (ExhaleHeap@@1 T@U) (Mask@@2 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@4) (MapType1Type RefType)) (= (type ExhaleHeap@@1) (MapType1Type RefType))) (= (type Mask@@2) (MapType0Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@4 ExhaleHeap@@1 Mask@@2)) (U_2_bool (MapType1Select Heap@@4 o_1 $allocated))) (U_2_bool (MapType1Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.73:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@4 ExhaleHeap@@1 Mask@@2) (MapType1Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert (forall ((Heap@@5 T@U) (p_1@@0 T@U) ) (!  (=> (and (= (type Heap@@5) (MapType1Type RefType)) (= (type p_1@@0) RefType)) (and (= (sum Heap@@5 p_1@@0) (|sum'| Heap@@5 p_1@@0)) (dummyFunction (int_2_U (|sum#triggerStateless| p_1@@0)))))
 :qid |stdinbpl.393:15|
 :skolemid |64|
 :pattern ( (sum Heap@@5 p_1@@0))
)))
(assert  (and (= (Ctor WandType_wandType) 18) (forall ((arg0@@34 Bool) (arg1@@22 T@U) (arg2@@16 Real) (arg3@@14 T@U) (arg4@@12 Int) ) (! (= (type (wand arg0@@34 arg1@@22 arg2@@16 arg3@@14 arg4@@12)) (FieldType WandType_wandType intType))
 :qid |funType:wand|
 :pattern ( (wand arg0@@34 arg1@@22 arg2@@16 arg3@@14 arg4@@12))
))))
(assert (forall ((arg1@@23 Bool) (arg2@@17 T@U) (arg3@@15 Real) (arg4@@13 T@U) (arg5@@12 Int) ) (!  (=> (and (= (type arg2@@17) RefType) (= (type arg4@@13) RefType)) (= (getPredWandId (wand arg1@@23 arg2@@17 arg3@@15 arg4@@13 arg5@@12)) 5))
 :qid |stdinbpl.334:15|
 :skolemid |55|
 :pattern ( (wand arg1@@23 arg2@@17 arg3@@15 arg4@@13 arg5@@12))
)))
(assert (forall ((this@@1 T@U) (this2 T@U) ) (!  (=> (and (and (= (type this@@1) RefType) (= (type this2) RefType)) (= (Pair this@@1) (Pair this2))) (= this@@1 this2))
 :qid |stdinbpl.502:15|
 :skolemid |71|
 :pattern ( (Pair this@@1) (Pair this2))
)))
(assert (forall ((arg0@@35 T@U) ) (! (= (type (|Pair#sm| arg0@@35)) (FieldType PredicateType_PairType (MapType0Type RefType boolType)))
 :qid |funType:Pair#sm|
 :pattern ( (|Pair#sm| arg0@@35))
)))
(assert (forall ((this@@2 T@U) (this2@@0 T@U) ) (!  (=> (and (and (= (type this@@2) RefType) (= (type this2@@0) RefType)) (= (|Pair#sm| this@@2) (|Pair#sm| this2@@0))) (= this@@2 this2@@0))
 :qid |stdinbpl.506:15|
 :skolemid |72|
 :pattern ( (|Pair#sm| this@@2) (|Pair#sm| this2@@0))
)))
(assert (forall ((arg0@@36 T@U) (arg1@@24 Real) (arg2@@18 T@U) (arg3@@16 Real) (arg4@@14 T@U) (arg5@@13 Real) (arg6@@8 T@U) (arg7@@5 Real) ) (! (= (type (wand_1 arg0@@36 arg1@@24 arg2@@18 arg3@@16 arg4@@14 arg5@@13 arg6@@8 arg7@@5)) (FieldType WandType_wand_1Type intType))
 :qid |funType:wand_1|
 :pattern ( (wand_1 arg0@@36 arg1@@24 arg2@@18 arg3@@16 arg4@@14 arg5@@13 arg6@@8 arg7@@5))
)))
(assert (forall ((arg1@@25 T@U) (arg2@@19 Real) (arg3@@17 T@U) (arg4@@15 Real) (arg5@@14 T@U) (arg6@@9 Real) (arg7@@6 T@U) (arg8@@2 Real) ) (!  (=> (and (and (and (= (type arg1@@25) RefType) (= (type arg3@@17) RefType)) (= (type arg5@@14) RefType)) (= (type arg7@@6) RefType)) (IsWandField (wand_1 arg1@@25 arg2@@19 arg3@@17 arg4@@15 arg5@@14 arg6@@9 arg7@@6 arg8@@2)))
 :qid |stdinbpl.218:15|
 :skolemid |29|
 :pattern ( (wand_1 arg1@@25 arg2@@19 arg3@@17 arg4@@15 arg5@@14 arg6@@9 arg7@@6 arg8@@2))
)))
(assert (forall ((arg1@@26 T@U) (arg2@@20 Real) (arg3@@18 T@U) (arg4@@16 Real) (arg5@@15 T@U) (arg6@@10 Real) (arg7@@7 T@U) (arg8@@3 Real) ) (!  (=> (and (and (and (= (type arg1@@26) RefType) (= (type arg3@@18) RefType)) (= (type arg5@@15) RefType)) (= (type arg7@@7) RefType)) (IsWandField (|wand_1#ft| arg1@@26 arg2@@20 arg3@@18 arg4@@16 arg5@@15 arg6@@10 arg7@@7 arg8@@3)))
 :qid |stdinbpl.222:15|
 :skolemid |30|
 :pattern ( (|wand_1#ft| arg1@@26 arg2@@20 arg3@@18 arg4@@16 arg5@@15 arg6@@10 arg7@@7 arg8@@3))
)))
(assert (forall ((Heap@@6 T@U) (ExhaleHeap@@2 T@U) (Mask@@3 T@U) (o_1@@0 T@U) (f_2 T@U) ) (! (let ((B@@1 (FieldTypeInv1 (type f_2))))
(let ((A@@1 (FieldTypeInv0 (type f_2))))
 (=> (and (and (and (and (and (and (= (type Heap@@6) (MapType1Type RefType)) (= (type ExhaleHeap@@2) (MapType1Type RefType))) (= (type Mask@@3) (MapType0Type RefType realType))) (= (type o_1@@0) RefType)) (= (type f_2) (FieldType A@@1 B@@1))) (IdenticalOnKnownLocations Heap@@6 ExhaleHeap@@2 Mask@@3)) (HasDirectPerm Mask@@3 o_1@@0 f_2)) (= (MapType1Select Heap@@6 o_1@@0 f_2) (MapType1Select ExhaleHeap@@2 o_1@@0 f_2)))))
 :qid |stdinbpl.42:22|
 :skolemid |1|
 :pattern ( (IdenticalOnKnownLocations Heap@@6 ExhaleHeap@@2 Mask@@3) (MapType1Select ExhaleHeap@@2 o_1@@0 f_2))
)))
(assert (forall ((arg1@@27 T@U) (arg2@@21 Real) (arg3@@19 T@U) (arg4@@17 Real) (arg5@@16 T@U) (arg6@@11 Real) (arg7@@8 T@U) (arg8@@4 Real) ) (!  (=> (and (and (and (= (type arg1@@27) RefType) (= (type arg3@@19) RefType)) (= (type arg5@@16) RefType)) (= (type arg7@@8) RefType)) (not (IsPredicateField (wand_1 arg1@@27 arg2@@21 arg3@@19 arg4@@17 arg5@@16 arg6@@11 arg7@@8 arg8@@4))))
 :qid |stdinbpl.226:15|
 :skolemid |31|
 :pattern ( (wand_1 arg1@@27 arg2@@21 arg3@@19 arg4@@17 arg5@@16 arg6@@11 arg7@@8 arg8@@4))
)))
(assert (forall ((arg1@@28 T@U) (arg2@@22 Real) (arg3@@20 T@U) (arg4@@18 Real) (arg5@@17 T@U) (arg6@@12 Real) (arg7@@9 T@U) (arg8@@5 Real) ) (!  (=> (and (and (and (= (type arg1@@28) RefType) (= (type arg3@@20) RefType)) (= (type arg5@@17) RefType)) (= (type arg7@@9) RefType)) (not (IsPredicateField (|wand_1#ft| arg1@@28 arg2@@22 arg3@@20 arg4@@18 arg5@@17 arg6@@12 arg7@@9 arg8@@5))))
 :qid |stdinbpl.230:15|
 :skolemid |32|
 :pattern ( (|wand_1#ft| arg1@@28 arg2@@22 arg3@@20 arg4@@18 arg5@@17 arg6@@12 arg7@@9 arg8@@5))
)))
(assert  (and (= (type dummyHeap) (MapType1Type RefType)) (= (type ZeroMask) (MapType0Type RefType realType))))
(assert (state dummyHeap ZeroMask))
(assert (forall ((arg1@@29 T@U) (arg2@@23 Real) (arg3@@21 T@U) (arg4@@19 Real) (arg5@@18 T@U) (arg6@@13 Real) (arg7@@10 T@U) (arg8@@6 Real) (arg9@@1 T@U) (arg10@@1 T@U) (arg11@@0 Int) ) (!  (=> (and (and (and (and (and (= (type arg1@@29) RefType) (= (type arg3@@21) RefType)) (= (type arg5@@18) RefType)) (= (type arg7@@10) RefType)) (= (type arg9@@1) RefType)) (= (type arg10@@1) RefType)) (IsWandField (wand_5 arg1@@29 arg2@@23 arg3@@21 arg4@@19 arg5@@18 arg6@@13 arg7@@10 arg8@@6 arg9@@1 arg10@@1 arg11@@0)))
 :qid |stdinbpl.346:15|
 :skolemid |57|
 :pattern ( (wand_5 arg1@@29 arg2@@23 arg3@@21 arg4@@19 arg5@@18 arg6@@13 arg7@@10 arg8@@6 arg9@@1 arg10@@1 arg11@@0))
)))
(assert (forall ((arg0@@37 T@U) (arg1@@30 Real) (arg2@@24 T@U) (arg3@@22 Real) (arg4@@20 T@U) (arg5@@19 Real) (arg6@@14 T@U) (arg7@@11 Real) (arg8@@7 T@U) (arg9@@2 T@U) (arg10@@2 Int) ) (! (= (type (|wand_5#ft| arg0@@37 arg1@@30 arg2@@24 arg3@@22 arg4@@20 arg5@@19 arg6@@14 arg7@@11 arg8@@7 arg9@@2 arg10@@2)) (FieldType WandType_wand_5Type FrameTypeType))
 :qid |funType:wand_5#ft|
 :pattern ( (|wand_5#ft| arg0@@37 arg1@@30 arg2@@24 arg3@@22 arg4@@20 arg5@@19 arg6@@14 arg7@@11 arg8@@7 arg9@@2 arg10@@2))
)))
(assert (forall ((arg1@@31 T@U) (arg2@@25 Real) (arg3@@23 T@U) (arg4@@21 Real) (arg5@@20 T@U) (arg6@@15 Real) (arg7@@12 T@U) (arg8@@8 Real) (arg9@@3 T@U) (arg10@@3 T@U) (arg11@@1 Int) ) (!  (=> (and (and (and (and (and (= (type arg1@@31) RefType) (= (type arg3@@23) RefType)) (= (type arg5@@20) RefType)) (= (type arg7@@12) RefType)) (= (type arg9@@3) RefType)) (= (type arg10@@3) RefType)) (IsWandField (|wand_5#ft| arg1@@31 arg2@@25 arg3@@23 arg4@@21 arg5@@20 arg6@@15 arg7@@12 arg8@@8 arg9@@3 arg10@@3 arg11@@1)))
 :qid |stdinbpl.350:15|
 :skolemid |58|
 :pattern ( (|wand_5#ft| arg1@@31 arg2@@25 arg3@@23 arg4@@21 arg5@@20 arg6@@15 arg7@@12 arg8@@8 arg9@@3 arg10@@3 arg11@@1))
)))
(assert (forall ((p T@U) (v_1 T@U) (w T@U) ) (! (let ((A@@2 (FieldTypeInv0 (type p))))
 (=> (and (and (= (type p) (FieldType A@@2 FrameTypeType)) (= (type v_1) FrameTypeType)) (= (type w) FrameTypeType)) (not (InsidePredicate p v_1 p w))))
 :qid |stdinbpl.173:19|
 :skolemid |21|
 :pattern ( (InsidePredicate p v_1 p w))
)))
(assert (forall ((arg1@@32 T@U) (arg2@@26 Real) (arg3@@24 T@U) (arg4@@22 Real) (arg5@@21 T@U) (arg6@@16 Real) (arg7@@13 T@U) (arg8@@9 Real) (arg9@@4 T@U) (arg10@@4 T@U) (arg11@@2 Int) ) (!  (=> (and (and (and (and (and (= (type arg1@@32) RefType) (= (type arg3@@24) RefType)) (= (type arg5@@21) RefType)) (= (type arg7@@13) RefType)) (= (type arg9@@4) RefType)) (= (type arg10@@4) RefType)) (not (IsPredicateField (wand_5 arg1@@32 arg2@@26 arg3@@24 arg4@@22 arg5@@21 arg6@@16 arg7@@13 arg8@@9 arg9@@4 arg10@@4 arg11@@2))))
 :qid |stdinbpl.354:15|
 :skolemid |59|
 :pattern ( (wand_5 arg1@@32 arg2@@26 arg3@@24 arg4@@22 arg5@@21 arg6@@16 arg7@@13 arg8@@9 arg9@@4 arg10@@4 arg11@@2))
)))
(assert (forall ((arg1@@33 T@U) (arg2@@27 Real) (arg3@@25 T@U) (arg4@@23 Real) (arg5@@22 T@U) (arg6@@17 Real) (arg7@@14 T@U) (arg8@@10 Real) (arg9@@5 T@U) (arg10@@5 T@U) (arg11@@3 Int) ) (!  (=> (and (and (and (and (and (= (type arg1@@33) RefType) (= (type arg3@@25) RefType)) (= (type arg5@@22) RefType)) (= (type arg7@@14) RefType)) (= (type arg9@@5) RefType)) (= (type arg10@@5) RefType)) (not (IsPredicateField (|wand_5#ft| arg1@@33 arg2@@27 arg3@@25 arg4@@23 arg5@@22 arg6@@17 arg7@@14 arg8@@10 arg9@@5 arg10@@5 arg11@@3))))
 :qid |stdinbpl.358:15|
 :skolemid |60|
 :pattern ( (|wand_5#ft| arg1@@33 arg2@@27 arg3@@25 arg4@@23 arg5@@22 arg6@@17 arg7@@14 arg8@@10 arg9@@5 arg10@@5 arg11@@3))
)))
(assert (forall ((arg1@@34 Bool) (arg2@@28 T@U) (arg3@@26 Real) (arg4@@24 T@U) (arg5@@23 Int) ) (!  (=> (and (= (type arg2@@28) RefType) (= (type arg4@@24) RefType)) (IsWandField (wand arg1@@34 arg2@@28 arg3@@26 arg4@@24 arg5@@23)))
 :qid |stdinbpl.314:15|
 :skolemid |50|
 :pattern ( (wand arg1@@34 arg2@@28 arg3@@26 arg4@@24 arg5@@23))
)))
(assert (forall ((arg0@@38 Bool) (arg1@@35 T@U) (arg2@@29 Real) (arg3@@27 T@U) (arg4@@25 Int) ) (! (= (type (|wand#ft| arg0@@38 arg1@@35 arg2@@29 arg3@@27 arg4@@25)) (FieldType WandType_wandType FrameTypeType))
 :qid |funType:wand#ft|
 :pattern ( (|wand#ft| arg0@@38 arg1@@35 arg2@@29 arg3@@27 arg4@@25))
)))
(assert (forall ((arg1@@36 Bool) (arg2@@30 T@U) (arg3@@28 Real) (arg4@@26 T@U) (arg5@@24 Int) ) (!  (=> (and (= (type arg2@@30) RefType) (= (type arg4@@26) RefType)) (IsWandField (|wand#ft| arg1@@36 arg2@@30 arg3@@28 arg4@@26 arg5@@24)))
 :qid |stdinbpl.318:15|
 :skolemid |51|
 :pattern ( (|wand#ft| arg1@@36 arg2@@30 arg3@@28 arg4@@26 arg5@@24))
)))
(assert  (not (IsPredicateField f_7)))
(assert  (not (IsWandField f_7)))
(assert  (not (IsPredicateField g)))
(assert  (not (IsWandField g)))
(assert (forall ((Heap@@7 T@U) (ExhaleHeap@@3 T@U) (Mask@@4 T@U) ) (!  (=> (and (and (and (= (type Heap@@7) (MapType1Type RefType)) (= (type ExhaleHeap@@3) (MapType1Type RefType))) (= (type Mask@@4) (MapType0Type RefType realType))) (IdenticalOnKnownLocations Heap@@7 ExhaleHeap@@3 Mask@@4)) (succHeap Heap@@7 ExhaleHeap@@3))
 :qid |stdinbpl.83:15|
 :skolemid |10|
 :pattern ( (IdenticalOnKnownLocations Heap@@7 ExhaleHeap@@3 Mask@@4))
)))
(assert (forall ((Heap@@8 T@U) (Mask@@5 T@U) (p_1@@1 T@U) ) (!  (=> (and (and (and (= (type Heap@@8) (MapType1Type RefType)) (= (type Mask@@5) (MapType0Type RefType realType))) (= (type p_1@@1) RefType)) (and (state Heap@@8 Mask@@5) (< AssumeFunctionsAbove 0))) (= (sum Heap@@8 p_1@@1) (+ (U_2_int (MapType1Select Heap@@8 p_1@@1 f_7)) (U_2_int (MapType1Select Heap@@8 p_1@@1 g)))))
 :qid |stdinbpl.403:15|
 :skolemid |66|
 :pattern ( (state Heap@@8 Mask@@5) (sum Heap@@8 p_1@@1))
 :pattern ( (state Heap@@8 Mask@@5) (|sum#triggerStateless| p_1@@1) (|Pair#trigger| Heap@@8 (Pair p_1@@1)))
)))
(assert (forall ((arg1@@37 Bool) (arg2@@31 T@U) (arg3@@29 Real) (arg4@@27 T@U) (arg5@@25 Int) ) (!  (=> (and (= (type arg2@@31) RefType) (= (type arg4@@27) RefType)) (not (IsPredicateField (wand arg1@@37 arg2@@31 arg3@@29 arg4@@27 arg5@@25))))
 :qid |stdinbpl.322:15|
 :skolemid |52|
 :pattern ( (wand arg1@@37 arg2@@31 arg3@@29 arg4@@27 arg5@@25))
)))
(assert (forall ((arg1@@38 Bool) (arg2@@32 T@U) (arg3@@30 Real) (arg4@@28 T@U) (arg5@@26 Int) ) (!  (=> (and (= (type arg2@@32) RefType) (= (type arg4@@28) RefType)) (not (IsPredicateField (|wand#ft| arg1@@38 arg2@@32 arg3@@30 arg4@@28 arg5@@26))))
 :qid |stdinbpl.326:15|
 :skolemid |53|
 :pattern ( (|wand#ft| arg1@@38 arg2@@32 arg3@@30 arg4@@28 arg5@@26))
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
(assert (forall ((arg0@@39 T@U) (arg1@@39 Real) (arg2@@33 T@U) (arg3@@31 Real) (arg4@@29 T@U) (arg5@@27 Real) ) (! (= (type (wand_3 arg0@@39 arg1@@39 arg2@@33 arg3@@31 arg4@@29 arg5@@27)) (FieldType WandType_wand_3Type intType))
 :qid |funType:wand_3|
 :pattern ( (wand_3 arg0@@39 arg1@@39 arg2@@33 arg3@@31 arg4@@29 arg5@@27))
)))
(assert (forall ((arg1@@40 T@U) (arg2@@34 Real) (arg3@@32 T@U) (arg4@@30 Real) (arg5@@28 T@U) (arg6@@18 Real) (arg1_2@@0 T@U) (arg2_2@@0 Real) (arg3_2@@0 T@U) (arg4_2@@0 Real) (arg5_2@@0 T@U) (arg6_2@@0 Real) ) (!  (=> (and (and (and (and (and (and (= (type arg1@@40) RefType) (= (type arg3@@32) RefType)) (= (type arg5@@28) RefType)) (= (type arg1_2@@0) RefType)) (= (type arg3_2@@0) RefType)) (= (type arg5_2@@0) RefType)) (= (wand_3 arg1@@40 arg2@@34 arg3@@32 arg4@@30 arg5@@28 arg6@@18) (wand_3 arg1_2@@0 arg2_2@@0 arg3_2@@0 arg4_2@@0 arg5_2@@0 arg6_2@@0))) (and (= arg1@@40 arg1_2@@0) (and (= arg2@@34 arg2_2@@0) (and (= arg3@@32 arg3_2@@0) (and (= arg4@@30 arg4_2@@0) (and (= arg5@@28 arg5_2@@0) (= arg6@@18 arg6_2@@0)))))))
 :qid |stdinbpl.210:15|
 :skolemid |28|
 :pattern ( (wand_3 arg1@@40 arg2@@34 arg3@@32 arg4@@30 arg5@@28 arg6@@18) (wand_3 arg1_2@@0 arg2_2@@0 arg3_2@@0 arg4_2@@0 arg5_2@@0 arg6_2@@0))
)))
(assert (forall ((arg0@@40 T@U) (arg1@@41 Real) (arg2@@35 T@U) (arg3@@33 Real) (arg4@@31 T@U) (arg5@@29 Int) ) (! (= (type (wand_4 arg0@@40 arg1@@41 arg2@@35 arg3@@33 arg4@@31 arg5@@29)) (FieldType WandType_wand_4Type intType))
 :qid |funType:wand_4|
 :pattern ( (wand_4 arg0@@40 arg1@@41 arg2@@35 arg3@@33 arg4@@31 arg5@@29))
)))
(assert (forall ((arg1@@42 T@U) (arg2@@36 Real) (arg3@@34 T@U) (arg4@@32 Real) (arg5@@30 T@U) (arg6@@19 Int) (arg1_2@@1 T@U) (arg2_2@@1 Real) (arg3_2@@1 T@U) (arg4_2@@1 Real) (arg5_2@@1 T@U) (arg6_2@@1 Int) ) (!  (=> (and (and (and (and (and (and (= (type arg1@@42) RefType) (= (type arg3@@34) RefType)) (= (type arg5@@30) RefType)) (= (type arg1_2@@1) RefType)) (= (type arg3_2@@1) RefType)) (= (type arg5_2@@1) RefType)) (= (wand_4 arg1@@42 arg2@@36 arg3@@34 arg4@@32 arg5@@30 arg6@@19) (wand_4 arg1_2@@1 arg2_2@@1 arg3_2@@1 arg4_2@@1 arg5_2@@1 arg6_2@@1))) (and (= arg1@@42 arg1_2@@1) (and (= arg2@@36 arg2_2@@1) (and (= arg3@@34 arg3_2@@1) (and (= arg4@@32 arg4_2@@1) (and (= arg5@@30 arg5_2@@1) (= arg6@@19 arg6_2@@1)))))))
 :qid |stdinbpl.274:15|
 :skolemid |42|
 :pattern ( (wand_4 arg1@@42 arg2@@36 arg3@@34 arg4@@32 arg5@@30 arg6@@19) (wand_4 arg1_2@@1 arg2_2@@1 arg3_2@@1 arg4_2@@1 arg5_2@@1 arg6_2@@1))
)))
(assert  (and (forall ((arg0@@41 Real) (arg1@@43 T@U) ) (! (= (type (ConditionalFrame arg0@@41 arg1@@43)) FrameTypeType)
 :qid |funType:ConditionalFrame|
 :pattern ( (ConditionalFrame arg0@@41 arg1@@43))
)) (= (type EmptyFrame) FrameTypeType)))
(assert (forall ((p@@0 Real) (f_6 T@U) ) (!  (=> (= (type f_6) FrameTypeType) (= (ConditionalFrame p@@0 f_6) (ite (> p@@0 0.0) f_6 EmptyFrame)))
 :qid |stdinbpl.161:15|
 :skolemid |19|
 :pattern ( (ConditionalFrame p@@0 f_6))
)))
(assert (forall ((arg0@@42 T@U) (arg1@@44 Real) (arg2@@37 T@U) (arg3@@35 Real) (arg4@@33 T@U) (arg5@@31 Real) (arg6@@20 T@U) (arg7@@15 Real) (arg8@@11 T@U) (arg9@@6 T@U) (arg10@@6 Int) ) (! (= (type (|wand_5#sm| arg0@@42 arg1@@44 arg2@@37 arg3@@35 arg4@@33 arg5@@31 arg6@@20 arg7@@15 arg8@@11 arg9@@6 arg10@@6)) (FieldType WandType_wand_5Type (MapType0Type RefType boolType)))
 :qid |funType:wand_5#sm|
 :pattern ( (|wand_5#sm| arg0@@42 arg1@@44 arg2@@37 arg3@@35 arg4@@33 arg5@@31 arg6@@20 arg7@@15 arg8@@11 arg9@@6 arg10@@6))
)))
(assert (forall ((arg1@@45 T@U) (arg2@@38 Real) (arg3@@36 T@U) (arg4@@34 Real) (arg5@@32 T@U) (arg6@@21 Real) (arg7@@16 T@U) (arg8@@12 Real) (arg9@@7 T@U) (arg10@@7 T@U) (arg11@@4 Int) ) (!  (=> (and (and (and (and (and (= (type arg1@@45) RefType) (= (type arg3@@36) RefType)) (= (type arg5@@32) RefType)) (= (type arg7@@16) RefType)) (= (type arg9@@7) RefType)) (= (type arg10@@7) RefType)) (= (|wand_5#sm| arg1@@45 arg2@@38 arg3@@36 arg4@@34 arg5@@32 arg6@@21 arg7@@16 arg8@@12 arg9@@7 arg10@@7 arg11@@4) (WandMaskField (|wand_5#ft| arg1@@45 arg2@@38 arg3@@36 arg4@@34 arg5@@32 arg6@@21 arg7@@16 arg8@@12 arg9@@7 arg10@@7 arg11@@4))))
 :qid |stdinbpl.362:15|
 :skolemid |61|
 :pattern ( (WandMaskField (|wand_5#ft| arg1@@45 arg2@@38 arg3@@36 arg4@@34 arg5@@32 arg6@@21 arg7@@16 arg8@@12 arg9@@7 arg10@@7 arg11@@4)))
)))
(assert (forall ((Mask@@6 T@U) (o_2@@0 T@U) (f_4@@0 T@U) ) (! (let ((B@@3 (FieldTypeInv1 (type f_4@@0))))
(let ((A@@4 (FieldTypeInv0 (type f_4@@0))))
 (=> (and (and (= (type Mask@@6) (MapType0Type RefType realType)) (= (type o_2@@0) RefType)) (= (type f_4@@0) (FieldType A@@4 B@@3))) (= (HasDirectPerm Mask@@6 o_2@@0 f_4@@0) (> (U_2_real (MapType0Select Mask@@6 o_2@@0 f_4@@0)) NoPerm)))))
 :qid |stdinbpl.133:22|
 :skolemid |17|
 :pattern ( (HasDirectPerm Mask@@6 o_2@@0 f_4@@0))
)))
(assert (forall ((arg1@@46 T@U) (arg2@@39 Real) (arg3@@37 T@U) (arg4@@35 Real) (arg5@@33 T@U) (arg6@@22 Real) ) (!  (=> (and (and (= (type arg1@@46) RefType) (= (type arg3@@37) RefType)) (= (type arg5@@33) RefType)) (= (getPredWandId (wand_3 arg1@@46 arg2@@39 arg3@@37 arg4@@35 arg5@@33 arg6@@22)) 1))
 :qid |stdinbpl.206:15|
 :skolemid |27|
 :pattern ( (wand_3 arg1@@46 arg2@@39 arg3@@37 arg4@@35 arg5@@33 arg6@@22))
)))
(assert (forall ((arg1@@47 T@U) (arg2@@40 Real) (arg3@@38 T@U) (arg4@@36 Real) (arg5@@34 T@U) (arg6@@23 Int) ) (!  (=> (and (and (= (type arg1@@47) RefType) (= (type arg3@@38) RefType)) (= (type arg5@@34) RefType)) (= (getPredWandId (wand_4 arg1@@47 arg2@@40 arg3@@38 arg4@@36 arg5@@34 arg6@@23)) 3))
 :qid |stdinbpl.270:15|
 :skolemid |41|
 :pattern ( (wand_4 arg1@@47 arg2@@40 arg3@@38 arg4@@36 arg5@@34 arg6@@23))
)))
(assert (forall ((o_2@@1 T@U) (f_4@@1 T@U) ) (! (let ((B@@4 (FieldTypeInv1 (type f_4@@1))))
(let ((A@@5 (FieldTypeInv0 (type f_4@@1))))
 (=> (and (= (type o_2@@1) RefType) (= (type f_4@@1) (FieldType A@@5 B@@4))) (= (U_2_real (MapType0Select ZeroMask o_2@@1 f_4@@1)) NoPerm))))
 :qid |stdinbpl.106:22|
 :skolemid |13|
 :pattern ( (MapType0Select ZeroMask o_2@@1 f_4@@1))
)))
(assert (forall ((arg1@@48 T@U) (arg2@@41 Real) (arg3@@39 T@U) (arg4@@37 Real) (arg5@@35 T@U) (arg6@@24 Real) (arg7@@17 T@U) (arg8@@13 Real) (arg9@@8 T@U) (arg10@@8 T@U) (arg11@@5 Int) (arg1_2@@2 T@U) (arg2_2@@2 Real) (arg3_2@@2 T@U) (arg4_2@@2 Real) (arg5_2@@2 T@U) (arg6_2@@2 Real) (arg7_2@@0 T@U) (arg8_2 Real) (arg9_2 T@U) (arg10_2 T@U) (arg11_2 Int) ) (!  (=> (and (and (and (and (and (and (and (and (and (and (and (and (= (type arg1@@48) RefType) (= (type arg3@@39) RefType)) (= (type arg5@@35) RefType)) (= (type arg7@@17) RefType)) (= (type arg9@@8) RefType)) (= (type arg10@@8) RefType)) (= (type arg1_2@@2) RefType)) (= (type arg3_2@@2) RefType)) (= (type arg5_2@@2) RefType)) (= (type arg7_2@@0) RefType)) (= (type arg9_2) RefType)) (= (type arg10_2) RefType)) (= (wand_5 arg1@@48 arg2@@41 arg3@@39 arg4@@37 arg5@@35 arg6@@24 arg7@@17 arg8@@13 arg9@@8 arg10@@8 arg11@@5) (wand_5 arg1_2@@2 arg2_2@@2 arg3_2@@2 arg4_2@@2 arg5_2@@2 arg6_2@@2 arg7_2@@0 arg8_2 arg9_2 arg10_2 arg11_2))) (and (= arg1@@48 arg1_2@@2) (and (= arg2@@41 arg2_2@@2) (and (= arg3@@39 arg3_2@@2) (and (= arg4@@37 arg4_2@@2) (and (= arg5@@35 arg5_2@@2) (and (= arg6@@24 arg6_2@@2) (and (= arg7@@17 arg7_2@@0) (and (= arg8@@13 arg8_2) (and (= arg9@@8 arg9_2) (and (= arg10@@8 arg10_2) (= arg11@@5 arg11_2))))))))))))
 :qid |stdinbpl.370:15|
 :skolemid |63|
 :pattern ( (wand_5 arg1@@48 arg2@@41 arg3@@39 arg4@@37 arg5@@35 arg6@@24 arg7@@17 arg8@@13 arg9@@8 arg10@@8 arg11@@5) (wand_5 arg1_2@@2 arg2_2@@2 arg3_2@@2 arg4_2@@2 arg5_2@@2 arg6_2@@2 arg7_2@@0 arg8_2 arg9_2 arg10_2 arg11_2))
)))
(assert (forall ((arg1@@49 T@U) (arg2@@42 Real) (arg3@@40 T@U) (arg4@@38 Real) (arg5@@36 T@U) (arg6@@25 Real) (arg7@@18 T@U) (arg8@@14 Real) (arg1_2@@3 T@U) (arg2_2@@3 Real) (arg3_2@@3 T@U) (arg4_2@@3 Real) (arg5_2@@3 T@U) (arg6_2@@3 Real) (arg7_2@@1 T@U) (arg8_2@@0 Real) ) (!  (=> (and (and (and (and (and (and (and (and (= (type arg1@@49) RefType) (= (type arg3@@40) RefType)) (= (type arg5@@36) RefType)) (= (type arg7@@18) RefType)) (= (type arg1_2@@3) RefType)) (= (type arg3_2@@3) RefType)) (= (type arg5_2@@3) RefType)) (= (type arg7_2@@1) RefType)) (= (wand_1 arg1@@49 arg2@@42 arg3@@40 arg4@@38 arg5@@36 arg6@@25 arg7@@18 arg8@@14) (wand_1 arg1_2@@3 arg2_2@@3 arg3_2@@3 arg4_2@@3 arg5_2@@3 arg6_2@@3 arg7_2@@1 arg8_2@@0))) (and (= arg1@@49 arg1_2@@3) (and (= arg2@@42 arg2_2@@3) (and (= arg3@@40 arg3_2@@3) (and (= arg4@@38 arg4_2@@3) (and (= arg5@@36 arg5_2@@3) (and (= arg6@@25 arg6_2@@3) (and (= arg7@@18 arg7_2@@1) (= arg8@@14 arg8_2@@0)))))))))
 :qid |stdinbpl.242:15|
 :skolemid |35|
 :pattern ( (wand_1 arg1@@49 arg2@@42 arg3@@40 arg4@@38 arg5@@36 arg6@@25 arg7@@18 arg8@@14) (wand_1 arg1_2@@3 arg2_2@@3 arg3_2@@3 arg4_2@@3 arg5_2@@3 arg6_2@@3 arg7_2@@1 arg8_2@@0))
)))
(assert (forall ((arg1@@50 Bool) (arg2@@43 T@U) (arg3@@41 Real) (arg4@@39 T@U) (arg5@@37 Int) (arg1_2@@4 Bool) (arg2_2@@4 T@U) (arg3_2@@4 Real) (arg4_2@@4 T@U) (arg5_2@@4 Int) ) (!  (=> (and (and (and (and (= (type arg2@@43) RefType) (= (type arg4@@39) RefType)) (= (type arg2_2@@4) RefType)) (= (type arg4_2@@4) RefType)) (= (wand arg1@@50 arg2@@43 arg3@@41 arg4@@39 arg5@@37) (wand arg1_2@@4 arg2_2@@4 arg3_2@@4 arg4_2@@4 arg5_2@@4))) (and (= arg1@@50 arg1_2@@4) (and (= arg2@@43 arg2_2@@4) (and (= arg3@@41 arg3_2@@4) (and (= arg4@@39 arg4_2@@4) (= arg5@@37 arg5_2@@4))))))
 :qid |stdinbpl.338:15|
 :skolemid |56|
 :pattern ( (wand arg1@@50 arg2@@43 arg3@@41 arg4@@39 arg5@@37) (wand arg1_2@@4 arg2_2@@4 arg3_2@@4 arg4_2@@4 arg5_2@@4))
)))
(assert (forall ((arg1@@51 T@U) (arg2@@44 Real) (arg3@@42 T@U) (arg4@@40 Real) (arg5@@38 T@U) (arg6@@26 Real) ) (!  (=> (and (and (= (type arg1@@51) RefType) (= (type arg3@@42) RefType)) (= (type arg5@@38) RefType)) (IsWandField (wand_3 arg1@@51 arg2@@44 arg3@@42 arg4@@40 arg5@@38 arg6@@26)))
 :qid |stdinbpl.186:15|
 :skolemid |22|
 :pattern ( (wand_3 arg1@@51 arg2@@44 arg3@@42 arg4@@40 arg5@@38 arg6@@26))
)))
(assert (forall ((arg1@@52 T@U) (arg2@@45 Real) (arg3@@43 T@U) (arg4@@41 Real) (arg5@@39 T@U) (arg6@@27 Real) ) (!  (=> (and (and (= (type arg1@@52) RefType) (= (type arg3@@43) RefType)) (= (type arg5@@39) RefType)) (IsWandField (|wand_3#ft| arg1@@52 arg2@@45 arg3@@43 arg4@@41 arg5@@39 arg6@@27)))
 :qid |stdinbpl.190:15|
 :skolemid |23|
 :pattern ( (|wand_3#ft| arg1@@52 arg2@@45 arg3@@43 arg4@@41 arg5@@39 arg6@@27))
)))
(assert (forall ((arg1@@53 T@U) (arg2@@46 Real) (arg3@@44 T@U) (arg4@@42 Real) (arg5@@40 T@U) (arg6@@28 Int) ) (!  (=> (and (and (= (type arg1@@53) RefType) (= (type arg3@@44) RefType)) (= (type arg5@@40) RefType)) (IsWandField (wand_4 arg1@@53 arg2@@46 arg3@@44 arg4@@42 arg5@@40 arg6@@28)))
 :qid |stdinbpl.250:15|
 :skolemid |36|
 :pattern ( (wand_4 arg1@@53 arg2@@46 arg3@@44 arg4@@42 arg5@@40 arg6@@28))
)))
(assert (forall ((arg1@@54 T@U) (arg2@@47 Real) (arg3@@45 T@U) (arg4@@43 Real) (arg5@@41 T@U) (arg6@@29 Int) ) (!  (=> (and (and (= (type arg1@@54) RefType) (= (type arg3@@45) RefType)) (= (type arg5@@41) RefType)) (IsWandField (|wand_4#ft| arg1@@54 arg2@@47 arg3@@45 arg4@@43 arg5@@41 arg6@@29)))
 :qid |stdinbpl.254:15|
 :skolemid |37|
 :pattern ( (|wand_4#ft| arg1@@54 arg2@@47 arg3@@45 arg4@@43 arg5@@41 arg6@@29))
)))
(assert (forall ((arg1@@55 T@U) (arg2@@48 Real) (arg3@@46 T@U) (arg4@@44 Real) (arg5@@42 T@U) (arg6@@30 Real) ) (!  (=> (and (and (= (type arg1@@55) RefType) (= (type arg3@@46) RefType)) (= (type arg5@@42) RefType)) (not (IsPredicateField (wand_3 arg1@@55 arg2@@48 arg3@@46 arg4@@44 arg5@@42 arg6@@30))))
 :qid |stdinbpl.194:15|
 :skolemid |24|
 :pattern ( (wand_3 arg1@@55 arg2@@48 arg3@@46 arg4@@44 arg5@@42 arg6@@30))
)))
(assert (forall ((arg1@@56 T@U) (arg2@@49 Real) (arg3@@47 T@U) (arg4@@45 Real) (arg5@@43 T@U) (arg6@@31 Real) ) (!  (=> (and (and (= (type arg1@@56) RefType) (= (type arg3@@47) RefType)) (= (type arg5@@43) RefType)) (not (IsPredicateField (|wand_3#ft| arg1@@56 arg2@@49 arg3@@47 arg4@@45 arg5@@43 arg6@@31))))
 :qid |stdinbpl.198:15|
 :skolemid |25|
 :pattern ( (|wand_3#ft| arg1@@56 arg2@@49 arg3@@47 arg4@@45 arg5@@43 arg6@@31))
)))
(assert (forall ((arg1@@57 T@U) (arg2@@50 Real) (arg3@@48 T@U) (arg4@@46 Real) (arg5@@44 T@U) (arg6@@32 Int) ) (!  (=> (and (and (= (type arg1@@57) RefType) (= (type arg3@@48) RefType)) (= (type arg5@@44) RefType)) (not (IsPredicateField (wand_4 arg1@@57 arg2@@50 arg3@@48 arg4@@46 arg5@@44 arg6@@32))))
 :qid |stdinbpl.258:15|
 :skolemid |38|
 :pattern ( (wand_4 arg1@@57 arg2@@50 arg3@@48 arg4@@46 arg5@@44 arg6@@32))
)))
(assert (forall ((arg1@@58 T@U) (arg2@@51 Real) (arg3@@49 T@U) (arg4@@47 Real) (arg5@@45 T@U) (arg6@@33 Int) ) (!  (=> (and (and (= (type arg1@@58) RefType) (= (type arg3@@49) RefType)) (= (type arg5@@45) RefType)) (not (IsPredicateField (|wand_4#ft| arg1@@58 arg2@@51 arg3@@49 arg4@@47 arg5@@45 arg6@@33))))
 :qid |stdinbpl.262:15|
 :skolemid |39|
 :pattern ( (|wand_4#ft| arg1@@58 arg2@@51 arg3@@49 arg4@@47 arg5@@45 arg6@@33))
)))
(assert (forall ((arg0@@43 Bool) (arg1@@59 T@U) (arg2@@52 Real) (arg3@@50 T@U) (arg4@@48 Int) ) (! (= (type (|wand#sm| arg0@@43 arg1@@59 arg2@@52 arg3@@50 arg4@@48)) (FieldType WandType_wandType (MapType0Type RefType boolType)))
 :qid |funType:wand#sm|
 :pattern ( (|wand#sm| arg0@@43 arg1@@59 arg2@@52 arg3@@50 arg4@@48))
)))
(assert (forall ((arg1@@60 Bool) (arg2@@53 T@U) (arg3@@51 Real) (arg4@@49 T@U) (arg5@@46 Int) ) (!  (=> (and (= (type arg2@@53) RefType) (= (type arg4@@49) RefType)) (= (|wand#sm| arg1@@60 arg2@@53 arg3@@51 arg4@@49 arg5@@46) (WandMaskField (|wand#ft| arg1@@60 arg2@@53 arg3@@51 arg4@@49 arg5@@46))))
 :qid |stdinbpl.330:15|
 :skolemid |54|
 :pattern ( (WandMaskField (|wand#ft| arg1@@60 arg2@@53 arg3@@51 arg4@@49 arg5@@46)))
)))
(assert (forall ((arg1@@61 T@U) (arg2@@54 Real) (arg3@@52 T@U) (arg4@@50 Real) (arg5@@47 T@U) (arg6@@34 Real) (arg7@@19 T@U) (arg8@@15 Real) ) (!  (=> (and (and (and (= (type arg1@@61) RefType) (= (type arg3@@52) RefType)) (= (type arg5@@47) RefType)) (= (type arg7@@19) RefType)) (= (getPredWandId (wand_1 arg1@@61 arg2@@54 arg3@@52 arg4@@50 arg5@@47 arg6@@34 arg7@@19 arg8@@15)) 2))
 :qid |stdinbpl.238:15|
 :skolemid |34|
 :pattern ( (wand_1 arg1@@61 arg2@@54 arg3@@52 arg4@@50 arg5@@47 arg6@@34 arg7@@19 arg8@@15))
)))
(assert (forall ((Heap@@9 T@U) (ExhaleHeap@@4 T@U) (Mask@@7 T@U) (pm_f@@1 T@U) ) (! (let ((C@@1 (FieldTypeInv0 (type pm_f@@1))))
 (=> (and (and (and (and (and (= (type Heap@@9) (MapType1Type RefType)) (= (type ExhaleHeap@@4) (MapType1Type RefType))) (= (type Mask@@7) (MapType0Type RefType realType))) (= (type pm_f@@1) (FieldType C@@1 FrameTypeType))) (IdenticalOnKnownLocations Heap@@9 ExhaleHeap@@4 Mask@@7)) (and (HasDirectPerm Mask@@7 null pm_f@@1) (IsPredicateField pm_f@@1))) (forall ((o2 T@U) (f_2@@0 T@U) ) (! (let ((B@@5 (FieldTypeInv1 (type f_2@@0))))
(let ((A@@6 (FieldTypeInv0 (type f_2@@0))))
 (=> (and (and (= (type o2) RefType) (= (type f_2@@0) (FieldType A@@6 B@@5))) (U_2_bool (MapType0Select (MapType1Select Heap@@9 null (PredicateMaskField pm_f@@1)) o2 f_2@@0))) (= (MapType1Select Heap@@9 o2 f_2@@0) (MapType1Select ExhaleHeap@@4 o2 f_2@@0)))))
 :qid |stdinbpl.54:134|
 :skolemid |3|
 :pattern ( (MapType1Select ExhaleHeap@@4 o2 f_2@@0))
))))
 :qid |stdinbpl.52:19|
 :skolemid |4|
 :pattern ( (IdenticalOnKnownLocations Heap@@9 ExhaleHeap@@4 Mask@@7) (IsPredicateField pm_f@@1))
)))
(assert (forall ((Heap@@10 T@U) (ExhaleHeap@@5 T@U) (Mask@@8 T@U) (pm_f@@2 T@U) ) (! (let ((C@@2 (FieldTypeInv0 (type pm_f@@2))))
 (=> (and (and (and (and (and (= (type Heap@@10) (MapType1Type RefType)) (= (type ExhaleHeap@@5) (MapType1Type RefType))) (= (type Mask@@8) (MapType0Type RefType realType))) (= (type pm_f@@2) (FieldType C@@2 FrameTypeType))) (IdenticalOnKnownLocations Heap@@10 ExhaleHeap@@5 Mask@@8)) (and (HasDirectPerm Mask@@8 null pm_f@@2) (IsWandField pm_f@@2))) (forall ((o2@@0 T@U) (f_2@@1 T@U) ) (! (let ((B@@6 (FieldTypeInv1 (type f_2@@1))))
(let ((A@@7 (FieldTypeInv0 (type f_2@@1))))
 (=> (and (and (= (type o2@@0) RefType) (= (type f_2@@1) (FieldType A@@7 B@@6))) (U_2_bool (MapType0Select (MapType1Select Heap@@10 null (WandMaskField pm_f@@2)) o2@@0 f_2@@1))) (= (MapType1Select Heap@@10 o2@@0 f_2@@1) (MapType1Select ExhaleHeap@@5 o2@@0 f_2@@1)))))
 :qid |stdinbpl.67:129|
 :skolemid |6|
 :pattern ( (MapType1Select ExhaleHeap@@5 o2@@0 f_2@@1))
))))
 :qid |stdinbpl.65:19|
 :skolemid |7|
 :pattern ( (IdenticalOnKnownLocations Heap@@10 ExhaleHeap@@5 Mask@@8) (IsWandField pm_f@@2))
)))
(assert (forall ((this@@3 T@U) ) (!  (=> (= (type this@@3) RefType) (= (getPredWandId (Pair this@@3)) 0))
 :qid |stdinbpl.496:15|
 :skolemid |70|
 :pattern ( (Pair this@@3))
)))
(assert (forall ((Mask@@9 T@U) (o_2@@2 T@U) (f_4@@2 T@U) ) (! (let ((B@@7 (FieldTypeInv1 (type f_4@@2))))
(let ((A@@8 (FieldTypeInv0 (type f_4@@2))))
 (=> (and (and (and (= (type Mask@@9) (MapType0Type RefType realType)) (= (type o_2@@2) RefType)) (= (type f_4@@2) (FieldType A@@8 B@@7))) (GoodMask Mask@@9)) (and (>= (U_2_real (MapType0Select Mask@@9 o_2@@2 f_4@@2)) NoPerm) (=> (and (and (GoodMask Mask@@9) (not (IsPredicateField f_4@@2))) (not (IsWandField f_4@@2))) (<= (U_2_real (MapType0Select Mask@@9 o_2@@2 f_4@@2)) FullPerm))))))
 :qid |stdinbpl.128:22|
 :skolemid |16|
 :pattern ( (GoodMask Mask@@9) (MapType0Select Mask@@9 o_2@@2 f_4@@2))
)))
(assert (forall ((Heap@@11 T@U) (Mask@@10 T@U) (p_1@@2 T@U) ) (!  (=> (and (and (and (= (type Heap@@11) (MapType1Type RefType)) (= (type Mask@@10) (MapType0Type RefType realType))) (= (type p_1@@2) RefType)) (state Heap@@11 Mask@@10)) (= (|sum'| Heap@@11 p_1@@2) (|sum#frame| (MapType1Select Heap@@11 null (Pair p_1@@2)) p_1@@2)))
 :qid |stdinbpl.410:15|
 :skolemid |67|
 :pattern ( (state Heap@@11 Mask@@10) (|sum'| Heap@@11 p_1@@2))
)))
(assert (forall ((o T@U) (f T@U) (Heap@@12 T@U) ) (!  (=> (and (and (and (= (type o) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap@@12) (MapType1Type RefType))) (U_2_bool (MapType1Select Heap@@12 o $allocated))) (U_2_bool (MapType1Select Heap@@12 (MapType1Select Heap@@12 o f) $allocated)))
 :qid |stdinbpl.31:15|
 :skolemid |0|
 :pattern ( (MapType1Select Heap@@12 o f))
)))
(assert (forall ((this@@4 T@U) ) (!  (=> (= (type this@@4) RefType) (= (PredicateMaskField (Pair this@@4)) (|Pair#sm| this@@4)))
 :qid |stdinbpl.488:15|
 :skolemid |68|
 :pattern ( (PredicateMaskField (Pair this@@4)))
)))
(assert (forall ((Heap@@13 T@U) (o@@0 T@U) (f_3 T@U) (v T@U) ) (! (let ((B@@8 (type v)))
(let ((A@@9 (FieldTypeInv0 (type f_3))))
 (=> (and (and (= (type Heap@@13) (MapType1Type RefType)) (= (type o@@0) RefType)) (= (type f_3) (FieldType A@@9 B@@8))) (succHeap Heap@@13 (MapType1Store Heap@@13 o@@0 f_3 v)))))
 :qid |stdinbpl.78:22|
 :skolemid |9|
 :pattern ( (MapType1Store Heap@@13 o@@0 f_3 v))
)))
(assert  (and (forall ((arg0@@44 T@U) (arg1@@62 Real) (arg2@@55 T@U) (arg3@@53 Real) (arg4@@51 T@U) (arg5@@48 Real) (arg6@@35 Bool) ) (! (= (type (|wand_2#ft| arg0@@44 arg1@@62 arg2@@55 arg3@@53 arg4@@51 arg5@@48 arg6@@35)) (FieldType WandType_wand_2Type FrameTypeType))
 :qid |funType:wand_2#ft|
 :pattern ( (|wand_2#ft| arg0@@44 arg1@@62 arg2@@55 arg3@@53 arg4@@51 arg5@@48 arg6@@35))
)) (forall ((arg0@@45 T@U) (arg1@@63 Real) (arg2@@56 T@U) (arg3@@54 Real) (arg4@@52 T@U) (arg5@@49 Real) (arg6@@36 Bool) ) (! (= (type (|wand_2#sm| arg0@@45 arg1@@63 arg2@@56 arg3@@54 arg4@@52 arg5@@49 arg6@@36)) (FieldType WandType_wand_2Type (MapType0Type RefType boolType)))
 :qid |funType:wand_2#sm|
 :pattern ( (|wand_2#sm| arg0@@45 arg1@@63 arg2@@56 arg3@@54 arg4@@52 arg5@@49 arg6@@36))
))))
(assert (forall ((arg1@@64 T@U) (arg2@@57 Real) (arg3@@55 T@U) (arg4@@53 Real) (arg5@@50 T@U) (arg6@@37 Real) (arg7@@20 Bool) ) (!  (=> (and (and (= (type arg1@@64) RefType) (= (type arg3@@55) RefType)) (= (type arg5@@50) RefType)) (= (|wand_2#sm| arg1@@64 arg2@@57 arg3@@55 arg4@@53 arg5@@50 arg6@@37 arg7@@20) (WandMaskField (|wand_2#ft| arg1@@64 arg2@@57 arg3@@55 arg4@@53 arg5@@50 arg6@@37 arg7@@20))))
 :qid |stdinbpl.298:15|
 :skolemid |47|
 :pattern ( (WandMaskField (|wand_2#ft| arg1@@64 arg2@@57 arg3@@55 arg4@@53 arg5@@50 arg6@@37 arg7@@20)))
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
 :qid |stdinbpl.168:25|
 :skolemid |20|
 :pattern ( (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))
)))
(assert (forall ((arg1@@65 T@U) (arg2@@58 Real) (arg3@@56 T@U) (arg4@@54 Real) (arg5@@51 T@U) (arg6@@38 Real) (arg7@@21 Bool) ) (!  (=> (and (and (= (type arg1@@65) RefType) (= (type arg3@@56) RefType)) (= (type arg5@@51) RefType)) (IsWandField (wand_2 arg1@@65 arg2@@58 arg3@@56 arg4@@54 arg5@@51 arg6@@38 arg7@@21)))
 :qid |stdinbpl.282:15|
 :skolemid |43|
 :pattern ( (wand_2 arg1@@65 arg2@@58 arg3@@56 arg4@@54 arg5@@51 arg6@@38 arg7@@21))
)))
(assert (forall ((arg1@@66 T@U) (arg2@@59 Real) (arg3@@57 T@U) (arg4@@55 Real) (arg5@@52 T@U) (arg6@@39 Real) (arg7@@22 Bool) ) (!  (=> (and (and (= (type arg1@@66) RefType) (= (type arg3@@57) RefType)) (= (type arg5@@52) RefType)) (IsWandField (|wand_2#ft| arg1@@66 arg2@@59 arg3@@57 arg4@@55 arg5@@52 arg6@@39 arg7@@22)))
 :qid |stdinbpl.286:15|
 :skolemid |44|
 :pattern ( (|wand_2#ft| arg1@@66 arg2@@59 arg3@@57 arg4@@55 arg5@@52 arg6@@39 arg7@@22))
)))
(assert (forall ((arg1@@67 T@U) (arg2@@60 Real) (arg3@@58 T@U) (arg4@@56 Real) (arg5@@53 T@U) (arg6@@40 Real) (arg7@@23 Bool) ) (!  (=> (and (and (= (type arg1@@67) RefType) (= (type arg3@@58) RefType)) (= (type arg5@@53) RefType)) (not (IsPredicateField (wand_2 arg1@@67 arg2@@60 arg3@@58 arg4@@56 arg5@@53 arg6@@40 arg7@@23))))
 :qid |stdinbpl.290:15|
 :skolemid |45|
 :pattern ( (wand_2 arg1@@67 arg2@@60 arg3@@58 arg4@@56 arg5@@53 arg6@@40 arg7@@23))
)))
(assert (forall ((arg1@@68 T@U) (arg2@@61 Real) (arg3@@59 T@U) (arg4@@57 Real) (arg5@@54 T@U) (arg6@@41 Real) (arg7@@24 Bool) ) (!  (=> (and (and (= (type arg1@@68) RefType) (= (type arg3@@59) RefType)) (= (type arg5@@54) RefType)) (not (IsPredicateField (|wand_2#ft| arg1@@68 arg2@@61 arg3@@59 arg4@@57 arg5@@54 arg6@@41 arg7@@24))))
 :qid |stdinbpl.294:15|
 :skolemid |46|
 :pattern ( (|wand_2#ft| arg1@@68 arg2@@61 arg3@@59 arg4@@57 arg5@@54 arg6@@41 arg7@@24))
)))
(assert (forall ((arg1@@69 T@U) (arg2@@62 Real) (arg3@@60 T@U) (arg4@@58 Real) (arg5@@55 T@U) (arg6@@42 Real) (arg7@@25 Bool) ) (!  (=> (and (and (= (type arg1@@69) RefType) (= (type arg3@@60) RefType)) (= (type arg5@@55) RefType)) (= (getPredWandId (wand_2 arg1@@69 arg2@@62 arg3@@60 arg4@@58 arg5@@55 arg6@@42 arg7@@25)) 4))
 :qid |stdinbpl.302:15|
 :skolemid |48|
 :pattern ( (wand_2 arg1@@69 arg2@@62 arg3@@60 arg4@@58 arg5@@55 arg6@@42 arg7@@25))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun perm@4 () Real)
(declare-fun p_1@@3 () T@U)
(declare-fun WandDefLHSMask@1 () T@U)
(declare-fun WandDefLHSHeap@1 () T@U)
(declare-fun WandDefRHSMask@1 () T@U)
(declare-fun WandDefRHSHeap@1 () T@U)
(declare-fun Mask@20 () T@U)
(declare-fun Heap@12 () T@U)
(declare-fun Heap@11 () T@U)
(declare-fun Heap@10 () T@U)
(declare-fun ExhaleHeap@1 () T@U)
(declare-fun Heap@8 () T@U)
(declare-fun Heap@9 () T@U)
(declare-fun freshVersion@0 () T@U)
(declare-fun Mask@19 () T@U)
(declare-fun Mask@18 () T@U)
(declare-fun CombineFrames (T@U T@U) T@U)
(declare-fun FrameFragment (T@U) T@U)
(declare-fun Mask@17 () T@U)
(declare-fun Mask@15 () T@U)
(declare-fun Mask@14 () T@U)
(declare-fun perm@6 () Real)
(declare-fun Heap@7 () T@U)
(declare-fun Mask@16 () T@U)
(declare-fun Mask@13 () T@U)
(declare-fun perm@5 () Real)
(declare-fun b_28@25 () Bool)
(declare-fun b_33@12 () Bool)
(declare-fun Result_15Heap () T@U)
(declare-fun Mask@12 () T@U)
(declare-fun Mask@11 () T@U)
(declare-fun Result_15Mask () T@U)
(declare-fun b_28@24 () Bool)
(declare-fun neededTransfer@16 () Real)
(declare-fun Used_15Mask@7 () T@U)
(declare-fun initNeededTransfer@3 () Real)
(declare-fun b_35@0 () Bool)
(declare-fun b_35@1 () Bool)
(declare-fun b_35@2 () Bool)
(declare-fun Ops_7Mask@13 () T@U)
(declare-fun b_35@3 () Bool)
(declare-fun Ops_7Heap@1 () T@U)
(declare-fun Used_15Heap@0 () T@U)
(declare-fun b_35@4 () Bool)
(declare-fun takeTransfer@7 () Real)
(declare-fun neededTransfer@14 () Real)
(declare-fun b_33@9 () Bool)
(declare-fun Heap@5 () T@U)
(declare-fun Mask@9 () T@U)
(declare-fun Used_15Mask@5 () T@U)
(declare-fun neededTransfer@15 () Real)
(declare-fun Used_15Mask@6 () T@U)
(declare-fun b_33@10 () Bool)
(declare-fun b_33@11 () Bool)
(declare-fun Mask@10 () T@U)
(declare-fun Heap@6 () T@U)
(declare-fun maskTransfer@7 () Real)
(declare-fun takeTransfer@6 () Real)
(declare-fun Used_15Mask@3 () T@U)
(declare-fun b_33@6 () Bool)
(declare-fun Ops_7Mask@11 () T@U)
(declare-fun neededTransfer@13 () Real)
(declare-fun Used_15Mask@4 () T@U)
(declare-fun b_33@7 () Bool)
(declare-fun b_33@8 () Bool)
(declare-fun Ops_7Mask@12 () T@U)
(declare-fun maskTransfer@6 () Real)
(declare-fun b_28@23 () Bool)
(declare-fun neededTransfer@12 () Real)
(declare-fun initNeededTransfer@2 () Real)
(declare-fun b_34@0 () Bool)
(declare-fun b_34@1 () Bool)
(declare-fun Result_14Heap () T@U)
(declare-fun Result_14Mask () T@U)
(declare-fun b_34@2 () Bool)
(declare-fun b_34@3 () Bool)
(declare-fun b_34@4 () Bool)
(declare-fun takeTransfer@5 () Real)
(declare-fun Mask@7 () T@U)
(declare-fun Heap@3 () T@U)
(declare-fun neededTransfer@10 () Real)
(declare-fun b_33@3 () Bool)
(declare-fun Used_15Mask@1 () T@U)
(declare-fun neededTransfer@11 () Real)
(declare-fun Used_15Mask@2 () T@U)
(declare-fun b_33@4 () Bool)
(declare-fun b_33@5 () Bool)
(declare-fun Mask@8 () T@U)
(declare-fun Heap@4 () T@U)
(declare-fun maskTransfer@5 () Real)
(declare-fun takeTransfer@4 () Real)
(declare-fun Ops_7Mask@9 () T@U)
(declare-fun b_33@0 () Bool)
(declare-fun neededTransfer@9 () Real)
(declare-fun Used_15Mask@0 () T@U)
(declare-fun b_33@1 () Bool)
(declare-fun b_33@2 () Bool)
(declare-fun Ops_7Mask@10 () T@U)
(declare-fun maskTransfer@4 () Real)
(declare-fun b_33 () Bool)
(declare-fun b_28@12 () Bool)
(declare-fun b_31@6 () Bool)
(declare-fun neededTransfer@8 () Real)
(declare-fun Used_14Mask@3 () T@U)
(declare-fun initNeededTransfer@1 () Real)
(declare-fun b_32@0 () Bool)
(declare-fun b_32@1 () Bool)
(declare-fun Result_13Heap () T@U)
(declare-fun Result_13Mask () T@U)
(declare-fun b_32@2 () Bool)
(declare-fun Ops_7Mask@7 () T@U)
(declare-fun b_32@3 () Bool)
(declare-fun Ops_7Heap@0 () T@U)
(declare-fun Used_14Heap@0 () T@U)
(declare-fun b_32@4 () Bool)
(declare-fun b_28@13 () Bool)
(declare-fun b_28@14 () Bool)
(declare-fun b_28@15 () Bool)
(declare-fun b_28@16 () Bool)
(declare-fun b_28@17 () Bool)
(declare-fun Ops_7Mask@8 () T@U)
(declare-fun b_28@18 () Bool)
(declare-fun b_28@19 () Bool)
(declare-fun b_28@20 () Bool)
(declare-fun ExhaleHeap@0 () T@U)
(declare-fun b_28@21 () Bool)
(declare-fun b_28@22 () Bool)
(declare-fun Mask@6 () T@U)
(declare-fun Heap@2 () T@U)
(declare-fun takeTransfer@3 () Real)
(declare-fun Heap@0 () T@U)
(declare-fun b_31@3 () Bool)
(declare-fun Mask@4 () T@U)
(declare-fun Used_14Mask@1 () T@U)
(declare-fun neededTransfer@6 () Real)
(declare-fun neededTransfer@7 () Real)
(declare-fun Used_14Mask@2 () T@U)
(declare-fun b_31@4 () Bool)
(declare-fun b_31@5 () Bool)
(declare-fun Mask@5 () T@U)
(declare-fun Heap@1 () T@U)
(declare-fun maskTransfer@3 () Real)
(declare-fun takeTransfer@2 () Real)
(declare-fun neededTransfer@4 () Real)
(declare-fun Ops_7Mask@5 () T@U)
(declare-fun b_31@0 () Bool)
(declare-fun neededTransfer@5 () Real)
(declare-fun Used_14Mask@0 () T@U)
(declare-fun b_31@1 () Bool)
(declare-fun b_31@2 () Bool)
(declare-fun Ops_7Mask@6 () T@U)
(declare-fun maskTransfer@2 () Real)
(declare-fun b_28@8 () Bool)
(declare-fun b_29@4 () Bool)
(declare-fun neededTransfer@3 () Real)
(declare-fun Used_13Mask@3 () T@U)
(declare-fun initNeededTransfer@0 () Real)
(declare-fun b_30@0 () Bool)
(declare-fun b_30@1 () Bool)
(declare-fun Result_12Heap () T@U)
(declare-fun Result_12Mask () T@U)
(declare-fun b_30@2 () Bool)
(declare-fun b_30@3 () Bool)
(declare-fun Used_13Heap@0 () T@U)
(declare-fun b_30@4 () Bool)
(declare-fun b_28@9 () Bool)
(declare-fun b_28@10 () Bool)
(declare-fun b_28@11 () Bool)
(declare-fun b_31 () Bool)
(declare-fun takeTransfer@1 () Real)
(declare-fun Mask@2 () T@U)
(declare-fun neededTransfer@1 () Real)
(declare-fun b_29@2 () Bool)
(declare-fun Used_13Mask@1 () T@U)
(declare-fun neededTransfer@2 () Real)
(declare-fun Used_13Mask@2 () T@U)
(declare-fun b_29@3 () Bool)
(declare-fun Mask@3 () T@U)
(declare-fun maskTransfer@1 () Real)
(declare-fun takeTransfer@0 () Real)
(declare-fun Ops_7Mask@3 () T@U)
(declare-fun b_29@0 () Bool)
(declare-fun neededTransfer@0 () Real)
(declare-fun Used_13Mask@0 () T@U)
(declare-fun b_29@1 () Bool)
(declare-fun Ops_7Mask@4 () T@U)
(declare-fun maskTransfer@0 () Real)
(declare-fun b_29 () Bool)
(declare-fun b_28@7 () Bool)
(declare-fun b_28@6 () Bool)
(declare-fun b_28@3 () Bool)
(declare-fun Ops_7Mask@1 () T@U)
(declare-fun perm@3 () Real)
(declare-fun b_28@4 () Bool)
(declare-fun Ops_7Mask@2 () T@U)
(declare-fun b_28@5 () Bool)
(declare-fun b_28@0 () Bool)
(declare-fun perm@2 () Real)
(declare-fun b_28@1 () Bool)
(declare-fun Ops_7Mask@0 () T@U)
(declare-fun b_28@2 () Bool)
(declare-fun Mask@0 () T@U)
(declare-fun Heap@@14 () T@U)
(declare-fun perm@1 () Real)
(declare-fun Mask@1 () T@U)
(declare-fun b_28 () Bool)
(declare-fun b_27@0 () Bool)
(declare-fun b_27 () Bool)
(declare-fun Used_12Heap@0 () T@U)
(declare-fun perm@0 () Real)
(declare-fun WandDefLHSMask@0 () T@U)
(declare-fun WandDefLHSHeap@0 () T@U)
(declare-fun WandDefRHSMask@0 () T@U)
(declare-fun WandDefRHSHeap@0 () T@U)
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (= (type p_1@@3) RefType) (= (type WandDefLHSMask@0) (MapType0Type RefType realType))) (= (type WandDefLHSHeap@0) (MapType1Type RefType))) (= (type WandDefRHSMask@0) (MapType0Type RefType realType))) (= (type WandDefRHSHeap@0) (MapType1Type RefType))) (= (type Heap@12) (MapType1Type RefType))) (= (type Mask@20) (MapType0Type RefType realType))) (= (type Heap@11) (MapType1Type RefType))) (= (type Heap@10) (MapType1Type RefType))) (= (type Heap@8) (MapType1Type RefType))) (= (type ExhaleHeap@1) (MapType1Type RefType))) (= (type Heap@9) (MapType1Type RefType))) (= (type freshVersion@0) FrameTypeType)) (= (type Mask@19) (MapType0Type RefType realType))) (= (type Mask@18) (MapType0Type RefType realType))) (forall ((arg0@@46 T@U) (arg1@@70 T@U) ) (! (= (type (CombineFrames arg0@@46 arg1@@70)) FrameTypeType)
 :qid |funType:CombineFrames|
 :pattern ( (CombineFrames arg0@@46 arg1@@70))
))) (forall ((arg0@@47 T@U) ) (! (= (type (FrameFragment arg0@@47)) FrameTypeType)
 :qid |funType:FrameFragment|
 :pattern ( (FrameFragment arg0@@47))
))) (= (type Mask@17) (MapType0Type RefType realType))) (= (type Mask@15) (MapType0Type RefType realType))) (= (type Mask@14) (MapType0Type RefType realType))) (= (type Heap@7) (MapType1Type RefType))) (= (type Mask@16) (MapType0Type RefType realType))) (= (type Mask@13) (MapType0Type RefType realType))) (= (type Result_15Heap) (MapType1Type RefType))) (= (type Mask@12) (MapType0Type RefType realType))) (= (type Mask@11) (MapType0Type RefType realType))) (= (type Result_15Mask) (MapType0Type RefType realType))) (= (type Used_15Mask@7) (MapType0Type RefType realType))) (= (type Ops_7Mask@13) (MapType0Type RefType realType))) (= (type Ops_7Heap@1) (MapType1Type RefType))) (= (type Used_15Heap@0) (MapType1Type RefType))) (= (type Heap@5) (MapType1Type RefType))) (= (type Mask@9) (MapType0Type RefType realType))) (= (type Used_15Mask@5) (MapType0Type RefType realType))) (= (type Used_15Mask@6) (MapType0Type RefType realType))) (= (type Mask@10) (MapType0Type RefType realType))) (= (type Heap@6) (MapType1Type RefType))) (= (type Used_15Mask@3) (MapType0Type RefType realType))) (= (type Ops_7Mask@11) (MapType0Type RefType realType))) (= (type Used_15Mask@4) (MapType0Type RefType realType))) (= (type Ops_7Mask@12) (MapType0Type RefType realType))) (= (type Result_14Heap) (MapType1Type RefType))) (= (type Result_14Mask) (MapType0Type RefType realType))) (= (type Mask@7) (MapType0Type RefType realType))) (= (type Heap@3) (MapType1Type RefType))) (= (type Used_15Mask@1) (MapType0Type RefType realType))) (= (type Used_15Mask@2) (MapType0Type RefType realType))) (= (type Mask@8) (MapType0Type RefType realType))) (= (type Heap@4) (MapType1Type RefType))) (= (type Ops_7Mask@9) (MapType0Type RefType realType))) (= (type Used_15Mask@0) (MapType0Type RefType realType))) (= (type Ops_7Mask@10) (MapType0Type RefType realType))) (= (type Ops_7Heap@0) (MapType1Type RefType))) (= (type Mask@2) (MapType0Type RefType realType))) (= (type Ops_7Mask@3) (MapType0Type RefType realType))) (= (type Heap@0) (MapType1Type RefType))) (= (type Used_14Mask@3) (MapType0Type RefType realType))) (= (type Result_13Heap) (MapType1Type RefType))) (= (type Result_13Mask) (MapType0Type RefType realType))) (= (type Ops_7Mask@7) (MapType0Type RefType realType))) (= (type Used_14Heap@0) (MapType1Type RefType))) (= (type Ops_7Mask@8) (MapType0Type RefType realType))) (= (type ExhaleHeap@0) (MapType1Type RefType))) (= (type Mask@6) (MapType0Type RefType realType))) (= (type Heap@2) (MapType1Type RefType))) (= (type Mask@4) (MapType0Type RefType realType))) (= (type Used_14Mask@1) (MapType0Type RefType realType))) (= (type Used_14Mask@2) (MapType0Type RefType realType))) (= (type Mask@5) (MapType0Type RefType realType))) (= (type Heap@1) (MapType1Type RefType))) (= (type Ops_7Mask@5) (MapType0Type RefType realType))) (= (type Used_14Mask@0) (MapType0Type RefType realType))) (= (type Ops_7Mask@6) (MapType0Type RefType realType))) (= (type Used_13Mask@3) (MapType0Type RefType realType))) (= (type Result_12Heap) (MapType1Type RefType))) (= (type Result_12Mask) (MapType0Type RefType realType))) (= (type Used_13Heap@0) (MapType1Type RefType))) (= (type Used_13Mask@1) (MapType0Type RefType realType))) (= (type Used_13Mask@2) (MapType0Type RefType realType))) (= (type Mask@3) (MapType0Type RefType realType))) (= (type Used_13Mask@0) (MapType0Type RefType realType))) (= (type Ops_7Mask@4) (MapType0Type RefType realType))) (= (type WandDefLHSMask@1) (MapType0Type RefType realType))) (= (type WandDefLHSHeap@1) (MapType1Type RefType))) (= (type WandDefRHSMask@1) (MapType0Type RefType realType))) (= (type WandDefRHSHeap@1) (MapType1Type RefType))) (= (type Ops_7Mask@2) (MapType0Type RefType realType))) (= (type Ops_7Mask@1) (MapType0Type RefType realType))) (= (type Ops_7Mask@0) (MapType0Type RefType realType))) (= (type Mask@0) (MapType0Type RefType realType))) (= (type Heap@@14) (MapType1Type RefType))) (= (type Mask@1) (MapType0Type RefType realType))) (= (type Used_12Heap@0) (MapType1Type RefType))))
(set-info :boogie-vc-id test01)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 125) (let ((anon86_Then_correct  (=> (= perm@4 (/ (to_real 1) (to_real 2))) (and (=> (= (ControlFlow 0 107) (- 0 108)) (>= perm@4 NoPerm)) (=> (>= perm@4 NoPerm) (=> (=> (> perm@4 NoPerm) (not (= p_1@@3 null))) (=> (and (and (and (= WandDefLHSMask@1 (MapType0Store ZeroMask p_1@@3 f_7 (real_2_U (+ (U_2_real (MapType0Select ZeroMask p_1@@3 f_7)) perm@4)))) (state WandDefLHSHeap@1 WandDefLHSMask@1)) (and (state WandDefLHSHeap@1 WandDefLHSMask@1) (state WandDefLHSHeap@1 WandDefLHSMask@1))) (and (and (not (= p_1@@3 null)) (= WandDefRHSMask@1 (MapType0Store ZeroMask p_1@@3 f_7 (real_2_U (+ (U_2_real (MapType0Select ZeroMask p_1@@3 f_7)) FullPerm))))) (and (state WandDefRHSHeap@1 WandDefRHSMask@1) (= (ControlFlow 0 107) (- 0 106))))) (HasDirectPerm WandDefRHSMask@1 p_1@@3 f_7))))))))
(let ((anon77_correct true))
(let ((anon119_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 10) 7)) anon77_correct)))
(let ((anon119_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 8) (- 0 9)) (<= FullPerm (U_2_real (MapType0Select Mask@20 null (Pair p_1@@3))))) (=> (<= FullPerm (U_2_real (MapType0Select Mask@20 null (Pair p_1@@3)))) (=> (= (ControlFlow 0 8) 7) anon77_correct))))))
(let ((anon118_Else_correct  (and (=> (= (ControlFlow 0 5) (- 0 6)) (> (sum Heap@12 p_1@@3) 0)) (=> (> (sum Heap@12 p_1@@3) 0) (=> (and (state Heap@12 Mask@20) (= (ControlFlow 0 5) (- 0 4))) false)))))
(let ((anon74_correct  (=> (and (and (= Heap@11 (MapType1Store Heap@10 null (|Pair#sm| p_1@@3) (MapType0Store (MapType1Select Heap@10 null (|Pair#sm| p_1@@3)) p_1@@3 f_7 (bool_2_U true)))) (= Heap@12 (MapType1Store Heap@11 null (|Pair#sm| p_1@@3) (MapType0Store (MapType1Select Heap@11 null (|Pair#sm| p_1@@3)) p_1@@3 g (bool_2_U true))))) (and (state Heap@12 Mask@20) (state Heap@12 Mask@20))) (and (and (=> (= (ControlFlow 0 11) 5) anon118_Else_correct) (=> (= (ControlFlow 0 11) 8) anon119_Then_correct)) (=> (= (ControlFlow 0 11) 10) anon119_Else_correct)))))
(let ((anon117_Else_correct  (=> (HasDirectPerm Mask@20 null (Pair p_1@@3)) (=> (and (= Heap@10 ExhaleHeap@1) (= (ControlFlow 0 13) 11)) anon74_correct))))
(let ((anon117_Then_correct  (=> (not (HasDirectPerm Mask@20 null (Pair p_1@@3))) (=> (and (and (= Heap@8 (MapType1Store ExhaleHeap@1 null (|Pair#sm| p_1@@3) ZeroPMask)) (= Heap@9 (MapType1Store Heap@8 null (Pair p_1@@3) freshVersion@0))) (and (= Heap@10 Heap@9) (= (ControlFlow 0 12) 11))) anon74_correct))))
(let ((anon72_correct  (=> (and (= Mask@19 (MapType0Store Mask@18 p_1@@3 g (real_2_U (- (U_2_real (MapType0Select Mask@18 p_1@@3 g)) FullPerm)))) (= Mask@20 (MapType0Store Mask@19 null (Pair p_1@@3) (real_2_U (+ (U_2_real (MapType0Select Mask@19 null (Pair p_1@@3))) FullPerm))))) (=> (and (and (state ExhaleHeap@1 Mask@20) (state ExhaleHeap@1 Mask@20)) (and (|Pair#trigger| ExhaleHeap@1 (Pair p_1@@3)) (= (MapType1Select ExhaleHeap@1 null (Pair p_1@@3)) (CombineFrames (FrameFragment (MapType1Select ExhaleHeap@1 p_1@@3 f_7)) (FrameFragment (MapType1Select ExhaleHeap@1 p_1@@3 g)))))) (and (=> (= (ControlFlow 0 14) 12) anon117_Then_correct) (=> (= (ControlFlow 0 14) 13) anon117_Else_correct))))))
(let ((anon116_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 17) 14)) anon72_correct)))
(let ((anon116_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 15) (- 0 16)) (<= FullPerm (U_2_real (MapType0Select Mask@18 p_1@@3 g)))) (=> (<= FullPerm (U_2_real (MapType0Select Mask@18 p_1@@3 g))) (=> (= (ControlFlow 0 15) 14) anon72_correct))))))
(let ((anon70_correct  (=> (= Mask@18 (MapType0Store Mask@17 p_1@@3 f_7 (real_2_U (- (U_2_real (MapType0Select Mask@17 p_1@@3 f_7)) FullPerm)))) (and (=> (= (ControlFlow 0 18) 15) anon116_Then_correct) (=> (= (ControlFlow 0 18) 17) anon116_Else_correct)))))
(let ((anon115_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 21) 18)) anon70_correct)))
(let ((anon115_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 19) (- 0 20)) (<= FullPerm (U_2_real (MapType0Select Mask@17 p_1@@3 f_7)))) (=> (<= FullPerm (U_2_real (MapType0Select Mask@17 p_1@@3 f_7))) (=> (= (ControlFlow 0 19) 18) anon70_correct))))))
(let ((anon68_correct  (=> (= Mask@15 (MapType0Store Mask@14 p_1@@3 f_7 (real_2_U (- (U_2_real (MapType0Select Mask@14 p_1@@3 f_7)) perm@6)))) (=> (and (and (state Heap@7 Mask@15) (not (= p_1@@3 null))) (and (= Mask@16 (MapType0Store Mask@15 p_1@@3 f_7 (real_2_U (+ (U_2_real (MapType0Select Mask@15 p_1@@3 f_7)) FullPerm)))) (state Heap@7 Mask@16))) (=> (and (and (and (not (= p_1@@3 null)) (= Mask@17 (MapType0Store Mask@16 p_1@@3 g (real_2_U (+ (U_2_real (MapType0Select Mask@16 p_1@@3 g)) FullPerm))))) (and (state Heap@7 Mask@17) (> (+ (U_2_int (MapType1Select Heap@7 p_1@@3 f_7)) (U_2_int (MapType1Select Heap@7 p_1@@3 g))) 0))) (and (and (state Heap@7 Mask@17) (IdenticalOnKnownLocations Heap@7 ExhaleHeap@1 Mask@17)) (and (state ExhaleHeap@1 Mask@17) (state ExhaleHeap@1 Mask@17)))) (and (=> (= (ControlFlow 0 22) 19) anon115_Then_correct) (=> (= (ControlFlow 0 22) 21) anon115_Else_correct)))))))
(let ((anon114_Else_correct  (=> (and (= perm@6 NoPerm) (= (ControlFlow 0 25) 22)) anon68_correct)))
(let ((anon114_Then_correct  (=> (not (= perm@6 NoPerm)) (and (=> (= (ControlFlow 0 23) (- 0 24)) (<= perm@6 (U_2_real (MapType0Select Mask@14 p_1@@3 f_7)))) (=> (<= perm@6 (U_2_real (MapType0Select Mask@14 p_1@@3 f_7))) (=> (= (ControlFlow 0 23) 22) anon68_correct))))))
(let ((anon66_correct  (=> (and (= Mask@14 (MapType0Store Mask@13 p_1@@3 g (real_2_U (- (U_2_real (MapType0Select Mask@13 p_1@@3 g)) perm@5)))) (= perm@6 (/ (to_real 1) (to_real 2)))) (and (=> (= (ControlFlow 0 26) (- 0 27)) (>= perm@6 NoPerm)) (=> (>= perm@6 NoPerm) (and (=> (= (ControlFlow 0 26) 23) anon114_Then_correct) (=> (= (ControlFlow 0 26) 25) anon114_Else_correct)))))))
(let ((anon113_Else_correct  (=> (and (= perm@5 NoPerm) (= (ControlFlow 0 30) 26)) anon66_correct)))
(let ((anon113_Then_correct  (=> (not (= perm@5 NoPerm)) (and (=> (= (ControlFlow 0 28) (- 0 29)) (<= perm@5 (U_2_real (MapType0Select Mask@13 p_1@@3 g)))) (=> (<= perm@5 (U_2_real (MapType0Select Mask@13 p_1@@3 g))) (=> (= (ControlFlow 0 28) 26) anon66_correct))))))
(let ((anon64_correct  (and (=> (= (ControlFlow 0 31) (- 0 34)) (=> (and (and b_28@25 b_28@25) b_33@12) (> (+ (U_2_int (MapType1Select Result_15Heap p_1@@3 f_7)) (U_2_int (MapType1Select Result_15Heap p_1@@3 g))) 0))) (=> (=> (and (and b_28@25 b_28@25) b_33@12) (> (+ (U_2_int (MapType1Select Result_15Heap p_1@@3 f_7)) (U_2_int (MapType1Select Result_15Heap p_1@@3 g))) 0)) (=> (and (and (= Mask@12 (MapType0Store Mask@11 null (wand_5 p_1@@3 (/ (to_real 1) (to_real 2)) p_1@@3 (/ (to_real 1) (to_real 2)) p_1@@3 FullPerm p_1@@3 FullPerm p_1@@3 p_1@@3 0) (real_2_U (+ (U_2_real (MapType0Select Mask@11 null (wand_5 p_1@@3 (/ (to_real 1) (to_real 2)) p_1@@3 (/ (to_real 1) (to_real 2)) p_1@@3 FullPerm p_1@@3 FullPerm p_1@@3 p_1@@3 0))) FullPerm)))) (state Heap@7 Mask@12)) (and (state Heap@7 Mask@12) (state Heap@7 Mask@12))) (and (=> (= (ControlFlow 0 31) (- 0 33)) (<= FullPerm (U_2_real (MapType0Select Mask@12 null (wand_5 p_1@@3 (/ (to_real 1) (to_real 2)) p_1@@3 (/ (to_real 1) (to_real 2)) p_1@@3 FullPerm p_1@@3 FullPerm p_1@@3 p_1@@3 0))))) (=> (<= FullPerm (U_2_real (MapType0Select Mask@12 null (wand_5 p_1@@3 (/ (to_real 1) (to_real 2)) p_1@@3 (/ (to_real 1) (to_real 2)) p_1@@3 FullPerm p_1@@3 FullPerm p_1@@3 p_1@@3 0)))) (=> (= Mask@13 (MapType0Store Mask@12 null (wand_5 p_1@@3 (/ (to_real 1) (to_real 2)) p_1@@3 (/ (to_real 1) (to_real 2)) p_1@@3 FullPerm p_1@@3 FullPerm p_1@@3 p_1@@3 0) (real_2_U (- (U_2_real (MapType0Select Mask@12 null (wand_5 p_1@@3 (/ (to_real 1) (to_real 2)) p_1@@3 (/ (to_real 1) (to_real 2)) p_1@@3 FullPerm p_1@@3 FullPerm p_1@@3 p_1@@3 0))) FullPerm)))) (=> (and (state Heap@7 Mask@13) (= perm@5 (/ (to_real 1) (to_real 2)))) (and (=> (= (ControlFlow 0 31) (- 0 32)) (>= perm@5 NoPerm)) (=> (>= perm@5 NoPerm) (and (=> (= (ControlFlow 0 31) 28) anon113_Then_correct) (=> (= (ControlFlow 0 31) 30) anon113_Else_correct)))))))))))))
(let ((anon112_Else_correct  (=> (and (not b_28@25) (= (ControlFlow 0 39) 31)) anon64_correct)))
(let ((anon112_Then_correct  (=> b_28@25 (and (=> (= (ControlFlow 0 36) (- 0 38)) (HasDirectPerm Result_15Mask p_1@@3 f_7)) (=> (HasDirectPerm Result_15Mask p_1@@3 f_7) (and (=> (= (ControlFlow 0 36) (- 0 37)) (HasDirectPerm Result_15Mask p_1@@3 g)) (=> (HasDirectPerm Result_15Mask p_1@@3 g) (=> (= (ControlFlow 0 36) 31) anon64_correct))))))))
(let ((anon111_Then_correct  (=> (and (and b_28@25 b_28@25) b_33@12) (and (=> (= (ControlFlow 0 40) 36) anon112_Then_correct) (=> (= (ControlFlow 0 40) 39) anon112_Else_correct)))))
(let ((anon111_Else_correct  (=> (and (not (and (and b_28@25 b_28@25) b_33@12)) (= (ControlFlow 0 35) 31)) anon64_correct)))
(let ((anon61_correct  (and (=> (= (ControlFlow 0 41) (- 0 42)) (=> (and (and b_28@24 b_28@24) b_33@12) (and (= neededTransfer@16 0.0) (= (U_2_real (MapType0Select Used_15Mask@7 p_1@@3 g)) initNeededTransfer@3)))) (=> (=> (and (and b_28@24 b_28@24) b_33@12) (and (= neededTransfer@16 0.0) (= (U_2_real (MapType0Select Used_15Mask@7 p_1@@3 g)) initNeededTransfer@3))) (=> (and (= b_35@0  (and b_28@24 b_33@12)) (= b_35@1  (and b_35@0 (state Result_15Heap Result_15Mask)))) (=> (and (and (= b_35@2  (and b_35@1 (sumMask Result_15Mask Ops_7Mask@13 Used_15Mask@7))) (= b_35@3  (and (and b_35@2 (IdenticalOnKnownLocations Ops_7Heap@1 Result_15Heap Ops_7Mask@13)) (IdenticalOnKnownLocations Used_15Heap@0 Result_15Heap Used_15Mask@7)))) (and (= b_35@4  (and b_35@3 (state Result_15Heap Result_15Mask))) (= b_28@25  (and b_28@24 b_35@4)))) (and (=> (= (ControlFlow 0 41) 40) anon111_Then_correct) (=> (= (ControlFlow 0 41) 35) anon111_Else_correct))))))))
(let ((anon110_Else_correct  (=> (>= 0.0 takeTransfer@7) (=> (and (= neededTransfer@16 neededTransfer@14) (= b_33@12 b_33@9)) (=> (and (and (= Heap@7 Heap@5) (= Mask@11 Mask@9)) (and (= Used_15Mask@7 Used_15Mask@5) (= (ControlFlow 0 45) 41))) anon61_correct)))))
(let ((anon110_Then_correct  (=> (> takeTransfer@7 0.0) (=> (and (and (= neededTransfer@15 (- neededTransfer@14 takeTransfer@7)) (= Used_15Mask@6 (MapType0Store Used_15Mask@5 p_1@@3 g (real_2_U (+ (U_2_real (MapType0Select Used_15Mask@5 p_1@@3 g)) takeTransfer@7))))) (and (= b_33@10  (and b_33@9 (state Used_15Heap@0 Used_15Mask@6))) (= b_33@11  (and b_33@10 (= (U_2_int (MapType1Select Heap@5 p_1@@3 g)) (U_2_int (MapType1Select Used_15Heap@0 p_1@@3 g))))))) (=> (and (and (and (= Mask@10 (MapType0Store Mask@9 p_1@@3 g (real_2_U (- (U_2_real (MapType0Select Mask@9 p_1@@3 g)) takeTransfer@7)))) (= Heap@6 (MapType1Store Heap@5 null (|wand_5#sm| p_1@@3 (/ (to_real 1) (to_real 2)) p_1@@3 (/ (to_real 1) (to_real 2)) p_1@@3 FullPerm p_1@@3 FullPerm p_1@@3 p_1@@3 0) (MapType0Store (MapType1Select Heap@5 null (|wand_5#sm| p_1@@3 (/ (to_real 1) (to_real 2)) p_1@@3 (/ (to_real 1) (to_real 2)) p_1@@3 FullPerm p_1@@3 FullPerm p_1@@3 p_1@@3 0)) p_1@@3 g (bool_2_U true))))) (and (= neededTransfer@16 neededTransfer@15) (= b_33@12 b_33@11))) (and (and (= Heap@7 Heap@6) (= Mask@11 Mask@10)) (and (= Used_15Mask@7 Used_15Mask@6) (= (ControlFlow 0 44) 41)))) anon61_correct)))))
(let ((anon109_Else_correct  (=> (and (< maskTransfer@7 neededTransfer@14) (= takeTransfer@7 maskTransfer@7)) (and (=> (= (ControlFlow 0 47) 44) anon110_Then_correct) (=> (= (ControlFlow 0 47) 45) anon110_Else_correct)))))
(let ((anon109_Then_correct  (=> (and (<= neededTransfer@14 maskTransfer@7) (= takeTransfer@7 neededTransfer@14)) (and (=> (= (ControlFlow 0 46) 44) anon110_Then_correct) (=> (= (ControlFlow 0 46) 45) anon110_Else_correct)))))
(let ((anon108_Then_correct  (=> (and (and (and (and (and b_28@24 b_28@24) b_33@9) true) (> neededTransfer@14 0.0)) (= maskTransfer@7 (U_2_real (MapType0Select Mask@9 p_1@@3 g)))) (and (=> (= (ControlFlow 0 48) 46) anon109_Then_correct) (=> (= (ControlFlow 0 48) 47) anon109_Else_correct)))))
(let ((anon108_Else_correct  (=> (not (and (and (and (and b_28@24 b_28@24) b_33@9) true) (> neededTransfer@14 0.0))) (=> (and (= neededTransfer@16 neededTransfer@14) (= b_33@12 b_33@9)) (=> (and (and (= Heap@7 Heap@5) (= Mask@11 Mask@9)) (and (= Used_15Mask@7 Used_15Mask@5) (= (ControlFlow 0 43) 41))) anon61_correct)))))
(let ((anon107_Else_correct  (=> (>= 0.0 takeTransfer@6) (=> (and (and (= Used_15Mask@5 Used_15Mask@3) (= b_33@9 b_33@6)) (and (= neededTransfer@14 FullPerm) (= Ops_7Mask@13 Ops_7Mask@11))) (and (=> (= (ControlFlow 0 51) 48) anon108_Then_correct) (=> (= (ControlFlow 0 51) 43) anon108_Else_correct))))))
(let ((anon107_Then_correct  (=> (and (> takeTransfer@6 0.0) (= neededTransfer@13 (- FullPerm takeTransfer@6))) (=> (and (and (and (= Used_15Mask@4 (MapType0Store Used_15Mask@3 p_1@@3 g (real_2_U (+ (U_2_real (MapType0Select Used_15Mask@3 p_1@@3 g)) takeTransfer@6)))) (= b_33@7  (and b_33@6 (state Used_15Heap@0 Used_15Mask@4)))) (and (= b_33@8  (and b_33@7 (= (U_2_int (MapType1Select Ops_7Heap@1 p_1@@3 g)) (U_2_int (MapType1Select Used_15Heap@0 p_1@@3 g))))) (= Ops_7Mask@12 (MapType0Store Ops_7Mask@11 p_1@@3 g (real_2_U (- (U_2_real (MapType0Select Ops_7Mask@11 p_1@@3 g)) takeTransfer@6)))))) (and (and (= Used_15Mask@5 Used_15Mask@4) (= b_33@9 b_33@8)) (and (= neededTransfer@14 neededTransfer@13) (= Ops_7Mask@13 Ops_7Mask@12)))) (and (=> (= (ControlFlow 0 50) 48) anon108_Then_correct) (=> (= (ControlFlow 0 50) 43) anon108_Else_correct))))))
(let ((anon106_Else_correct  (=> (and (< maskTransfer@6 FullPerm) (= takeTransfer@6 maskTransfer@6)) (and (=> (= (ControlFlow 0 53) 50) anon107_Then_correct) (=> (= (ControlFlow 0 53) 51) anon107_Else_correct)))))
(let ((anon106_Then_correct  (=> (and (<= FullPerm maskTransfer@6) (= takeTransfer@6 FullPerm)) (and (=> (= (ControlFlow 0 52) 50) anon107_Then_correct) (=> (= (ControlFlow 0 52) 51) anon107_Else_correct)))))
(let ((anon105_Then_correct  (=> (and (and (and (and (and b_28@24 b_28@24) b_33@6) true) (> FullPerm 0.0)) (= maskTransfer@6 (U_2_real (MapType0Select Ops_7Mask@11 p_1@@3 g)))) (and (=> (= (ControlFlow 0 54) 52) anon106_Then_correct) (=> (= (ControlFlow 0 54) 53) anon106_Else_correct)))))
(let ((anon105_Else_correct  (=> (not (and (and (and (and b_28@24 b_28@24) b_33@6) true) (> FullPerm 0.0))) (=> (and (and (= Used_15Mask@5 Used_15Mask@3) (= b_33@9 b_33@6)) (and (= neededTransfer@14 FullPerm) (= Ops_7Mask@13 Ops_7Mask@11))) (and (=> (= (ControlFlow 0 49) 48) anon108_Then_correct) (=> (= (ControlFlow 0 49) 43) anon108_Else_correct))))))
(let ((anon49_correct  (and (=> (= (ControlFlow 0 55) (- 0 57)) (=> (and (and b_28@23 b_28@23) b_33@6) (and (= neededTransfer@12 0.0) (= (U_2_real (MapType0Select Used_15Mask@3 p_1@@3 f_7)) initNeededTransfer@2)))) (=> (=> (and (and b_28@23 b_28@23) b_33@6) (and (= neededTransfer@12 0.0) (= (U_2_real (MapType0Select Used_15Mask@3 p_1@@3 f_7)) initNeededTransfer@2))) (=> (= b_34@0  (and b_28@23 b_33@6)) (=> (and (= b_34@1  (and b_34@0 (state Result_14Heap Result_14Mask))) (= b_34@2  (and b_34@1 (sumMask Result_14Mask Ops_7Mask@11 Used_15Mask@3)))) (=> (and (and (= b_34@3  (and (and b_34@2 (IdenticalOnKnownLocations Ops_7Heap@1 Result_14Heap Ops_7Mask@11)) (IdenticalOnKnownLocations Used_15Heap@0 Result_14Heap Used_15Mask@3))) (= b_34@4  (and b_34@3 (state Result_14Heap Result_14Mask)))) (and (= b_28@24  (and b_28@23 b_34@4)) (= initNeededTransfer@3 (+ (U_2_real (MapType0Select Used_15Mask@3 p_1@@3 g)) FullPerm)))) (and (=> (= (ControlFlow 0 55) (- 0 56)) (>= FullPerm 0.0)) (=> (>= FullPerm 0.0) (and (=> (= (ControlFlow 0 55) 54) anon105_Then_correct) (=> (= (ControlFlow 0 55) 49) anon105_Else_correct)))))))))))
(let ((anon104_Else_correct  (=> (>= 0.0 takeTransfer@5) (=> (and (= Mask@9 Mask@7) (= Heap@5 Heap@3)) (=> (and (and (= neededTransfer@12 neededTransfer@10) (= b_33@6 b_33@3)) (and (= Used_15Mask@3 Used_15Mask@1) (= (ControlFlow 0 60) 55))) anon49_correct)))))
(let ((anon104_Then_correct  (=> (> takeTransfer@5 0.0) (=> (and (and (= neededTransfer@11 (- neededTransfer@10 takeTransfer@5)) (= Used_15Mask@2 (MapType0Store Used_15Mask@1 p_1@@3 f_7 (real_2_U (+ (U_2_real (MapType0Select Used_15Mask@1 p_1@@3 f_7)) takeTransfer@5))))) (and (= b_33@4  (and b_33@3 (state Used_15Heap@0 Used_15Mask@2))) (= b_33@5  (and b_33@4 (= (U_2_int (MapType1Select Heap@3 p_1@@3 f_7)) (U_2_int (MapType1Select Used_15Heap@0 p_1@@3 f_7))))))) (=> (and (and (and (= Mask@8 (MapType0Store Mask@7 p_1@@3 f_7 (real_2_U (- (U_2_real (MapType0Select Mask@7 p_1@@3 f_7)) takeTransfer@5)))) (= Heap@4 (MapType1Store Heap@3 null (|wand_5#sm| p_1@@3 (/ (to_real 1) (to_real 2)) p_1@@3 (/ (to_real 1) (to_real 2)) p_1@@3 FullPerm p_1@@3 FullPerm p_1@@3 p_1@@3 0) (MapType0Store (MapType1Select Heap@3 null (|wand_5#sm| p_1@@3 (/ (to_real 1) (to_real 2)) p_1@@3 (/ (to_real 1) (to_real 2)) p_1@@3 FullPerm p_1@@3 FullPerm p_1@@3 p_1@@3 0)) p_1@@3 f_7 (bool_2_U true))))) (and (= Mask@9 Mask@8) (= Heap@5 Heap@4))) (and (and (= neededTransfer@12 neededTransfer@11) (= b_33@6 b_33@5)) (and (= Used_15Mask@3 Used_15Mask@2) (= (ControlFlow 0 59) 55)))) anon49_correct)))))
(let ((anon103_Else_correct  (=> (and (< maskTransfer@5 neededTransfer@10) (= takeTransfer@5 maskTransfer@5)) (and (=> (= (ControlFlow 0 62) 59) anon104_Then_correct) (=> (= (ControlFlow 0 62) 60) anon104_Else_correct)))))
(let ((anon103_Then_correct  (=> (and (<= neededTransfer@10 maskTransfer@5) (= takeTransfer@5 neededTransfer@10)) (and (=> (= (ControlFlow 0 61) 59) anon104_Then_correct) (=> (= (ControlFlow 0 61) 60) anon104_Else_correct)))))
(let ((anon102_Then_correct  (=> (and (and (and (and (and b_28@23 b_28@23) b_33@3) true) (> neededTransfer@10 0.0)) (= maskTransfer@5 (U_2_real (MapType0Select Mask@7 p_1@@3 f_7)))) (and (=> (= (ControlFlow 0 63) 61) anon103_Then_correct) (=> (= (ControlFlow 0 63) 62) anon103_Else_correct)))))
(let ((anon102_Else_correct  (=> (not (and (and (and (and b_28@23 b_28@23) b_33@3) true) (> neededTransfer@10 0.0))) (=> (and (= Mask@9 Mask@7) (= Heap@5 Heap@3)) (=> (and (and (= neededTransfer@12 neededTransfer@10) (= b_33@6 b_33@3)) (and (= Used_15Mask@3 Used_15Mask@1) (= (ControlFlow 0 58) 55))) anon49_correct)))))
(let ((anon101_Else_correct  (=> (>= 0.0 takeTransfer@4) (=> (and (and (= Ops_7Mask@11 Ops_7Mask@9) (= Used_15Mask@1 ZeroMask)) (and (= b_33@3 b_33@0) (= neededTransfer@10 FullPerm))) (and (=> (= (ControlFlow 0 66) 63) anon102_Then_correct) (=> (= (ControlFlow 0 66) 58) anon102_Else_correct))))))
(let ((anon101_Then_correct  (=> (and (> takeTransfer@4 0.0) (= neededTransfer@9 (- FullPerm takeTransfer@4))) (=> (and (and (and (= Used_15Mask@0 (MapType0Store ZeroMask p_1@@3 f_7 (real_2_U (+ (U_2_real (MapType0Select ZeroMask p_1@@3 f_7)) takeTransfer@4)))) (= b_33@1  (and b_33@0 (state Used_15Heap@0 Used_15Mask@0)))) (and (= b_33@2  (and b_33@1 (= (U_2_int (MapType1Select Ops_7Heap@1 p_1@@3 f_7)) (U_2_int (MapType1Select Used_15Heap@0 p_1@@3 f_7))))) (= Ops_7Mask@10 (MapType0Store Ops_7Mask@9 p_1@@3 f_7 (real_2_U (- (U_2_real (MapType0Select Ops_7Mask@9 p_1@@3 f_7)) takeTransfer@4)))))) (and (and (= Ops_7Mask@11 Ops_7Mask@10) (= Used_15Mask@1 Used_15Mask@0)) (and (= b_33@3 b_33@2) (= neededTransfer@10 neededTransfer@9)))) (and (=> (= (ControlFlow 0 65) 63) anon102_Then_correct) (=> (= (ControlFlow 0 65) 58) anon102_Else_correct))))))
(let ((anon100_Else_correct  (=> (and (< maskTransfer@4 FullPerm) (= takeTransfer@4 maskTransfer@4)) (and (=> (= (ControlFlow 0 68) 65) anon101_Then_correct) (=> (= (ControlFlow 0 68) 66) anon101_Else_correct)))))
(let ((anon100_Then_correct  (=> (and (<= FullPerm maskTransfer@4) (= takeTransfer@4 FullPerm)) (and (=> (= (ControlFlow 0 67) 65) anon101_Then_correct) (=> (= (ControlFlow 0 67) 66) anon101_Else_correct)))))
(let ((anon99_Then_correct  (=> (and (and (and (and (and b_28@23 b_28@23) b_33@0) true) (> FullPerm 0.0)) (= maskTransfer@4 (U_2_real (MapType0Select Ops_7Mask@9 p_1@@3 f_7)))) (and (=> (= (ControlFlow 0 69) 67) anon100_Then_correct) (=> (= (ControlFlow 0 69) 68) anon100_Else_correct)))))
(let ((anon99_Else_correct  (=> (not (and (and (and (and b_28@23 b_28@23) b_33@0) true) (> FullPerm 0.0))) (=> (and (and (= Ops_7Mask@11 Ops_7Mask@9) (= Used_15Mask@1 ZeroMask)) (and (= b_33@3 b_33@0) (= neededTransfer@10 FullPerm))) (and (=> (= (ControlFlow 0 64) 63) anon102_Then_correct) (=> (= (ControlFlow 0 64) 58) anon102_Else_correct))))))
(let ((anon37_correct  (=> (and (= b_33@0  (and b_33 (state Used_15Heap@0 ZeroMask))) (= initNeededTransfer@2 (+ (U_2_real (MapType0Select ZeroMask p_1@@3 f_7)) FullPerm))) (and (=> (= (ControlFlow 0 70) (- 0 71)) (>= FullPerm 0.0)) (=> (>= FullPerm 0.0) (and (=> (= (ControlFlow 0 70) 69) anon99_Then_correct) (=> (= (ControlFlow 0 70) 64) anon99_Else_correct)))))))
(let ((anon36_correct  (and (=> (= (ControlFlow 0 73) (- 0 74)) (=> (and b_28@12 b_31@6) (and (= neededTransfer@8 0.0) (= (U_2_real (MapType0Select Used_14Mask@3 p_1@@3 f_7)) initNeededTransfer@1)))) (=> (=> (and b_28@12 b_31@6) (and (= neededTransfer@8 0.0) (= (U_2_real (MapType0Select Used_14Mask@3 p_1@@3 f_7)) initNeededTransfer@1))) (=> (= b_32@0  (and b_28@12 b_31@6)) (=> (and (= b_32@1  (and b_32@0 (state Result_13Heap Result_13Mask))) (= b_32@2  (and b_32@1 (sumMask Result_13Mask Ops_7Mask@7 Used_14Mask@3)))) (=> (and (and (= b_32@3  (and (and b_32@2 (IdenticalOnKnownLocations Ops_7Heap@0 Result_13Heap Ops_7Mask@7)) (IdenticalOnKnownLocations Used_14Heap@0 Result_13Heap Used_14Mask@3))) (= b_32@4  (and b_32@3 (state Result_13Heap Result_13Mask)))) (and (= b_28@13  (and b_28@12 b_32@4)) (= b_28@14  (and b_28@13 b_31@6)))) (=> (and (and (and (and (= b_28@15  (and b_28@14 (= Used_14Heap@0 Ops_7Heap@0))) (= b_28@16  (and b_28@15 (state Ops_7Heap@0 Ops_7Mask@7)))) (and (= b_28@17  (and b_28@16 (not (= p_1@@3 null)))) (= Ops_7Mask@8 (MapType0Store Ops_7Mask@7 p_1@@3 f_7 (real_2_U (+ (U_2_real (MapType0Select Ops_7Mask@7 p_1@@3 f_7)) FullPerm)))))) (and (and (= b_28@18  (and b_28@17 (state Ops_7Heap@0 Ops_7Mask@8))) (= b_28@19  (and b_28@18 (> (U_2_int (MapType1Select Ops_7Heap@0 p_1@@3 f_7)) 0)))) (and (= b_28@20  (and b_28@19 (state Ops_7Heap@0 Ops_7Mask@8))) (IdenticalOnKnownLocations Ops_7Heap@0 ExhaleHeap@0 Ops_7Mask@8)))) (and (and (and (= b_28@21  (and b_28@20 (state ExhaleHeap@0 Ops_7Mask@8))) (= b_28@22  (and b_28@21 (state ExhaleHeap@0 Ops_7Mask@8)))) (and (= Ops_7Heap@1 ExhaleHeap@0) (= b_28@23 b_28@22))) (and (and (= Mask@7 Mask@6) (= Ops_7Mask@9 Ops_7Mask@8)) (and (= Heap@3 Heap@2) (= (ControlFlow 0 73) 70))))) anon37_correct))))))))
(let ((anon98_Else_correct  (=> (>= 0.0 takeTransfer@3) (=> (and (= Heap@2 Heap@0) (= b_31@6 b_31@3)) (=> (and (and (= Mask@6 Mask@4) (= Used_14Mask@3 Used_14Mask@1)) (and (= neededTransfer@8 neededTransfer@6) (= (ControlFlow 0 77) 73))) anon36_correct)))))
(let ((anon98_Then_correct  (=> (> takeTransfer@3 0.0) (=> (and (and (= neededTransfer@7 (- neededTransfer@6 takeTransfer@3)) (= Used_14Mask@2 (MapType0Store Used_14Mask@1 p_1@@3 f_7 (real_2_U (+ (U_2_real (MapType0Select Used_14Mask@1 p_1@@3 f_7)) takeTransfer@3))))) (and (= b_31@4  (and b_31@3 (state Used_14Heap@0 Used_14Mask@2))) (= b_31@5  (and b_31@4 (= (U_2_int (MapType1Select Heap@0 p_1@@3 f_7)) (U_2_int (MapType1Select Used_14Heap@0 p_1@@3 f_7))))))) (=> (and (and (and (= Mask@5 (MapType0Store Mask@4 p_1@@3 f_7 (real_2_U (- (U_2_real (MapType0Select Mask@4 p_1@@3 f_7)) takeTransfer@3)))) (= Heap@1 (MapType1Store Heap@0 null (|wand_5#sm| p_1@@3 (/ (to_real 1) (to_real 2)) p_1@@3 (/ (to_real 1) (to_real 2)) p_1@@3 FullPerm p_1@@3 FullPerm p_1@@3 p_1@@3 0) (MapType0Store (MapType1Select Heap@0 null (|wand_5#sm| p_1@@3 (/ (to_real 1) (to_real 2)) p_1@@3 (/ (to_real 1) (to_real 2)) p_1@@3 FullPerm p_1@@3 FullPerm p_1@@3 p_1@@3 0)) p_1@@3 f_7 (bool_2_U true))))) (and (= Heap@2 Heap@1) (= b_31@6 b_31@5))) (and (and (= Mask@6 Mask@5) (= Used_14Mask@3 Used_14Mask@2)) (and (= neededTransfer@8 neededTransfer@7) (= (ControlFlow 0 76) 73)))) anon36_correct)))))
(let ((anon97_Else_correct  (=> (and (< maskTransfer@3 neededTransfer@6) (= takeTransfer@3 maskTransfer@3)) (and (=> (= (ControlFlow 0 79) 76) anon98_Then_correct) (=> (= (ControlFlow 0 79) 77) anon98_Else_correct)))))
(let ((anon97_Then_correct  (=> (and (<= neededTransfer@6 maskTransfer@3) (= takeTransfer@3 neededTransfer@6)) (and (=> (= (ControlFlow 0 78) 76) anon98_Then_correct) (=> (= (ControlFlow 0 78) 77) anon98_Else_correct)))))
(let ((anon96_Then_correct  (=> (and (and (and (and b_28@12 b_31@3) true) (> neededTransfer@6 0.0)) (= maskTransfer@3 (U_2_real (MapType0Select Mask@4 p_1@@3 f_7)))) (and (=> (= (ControlFlow 0 80) 78) anon97_Then_correct) (=> (= (ControlFlow 0 80) 79) anon97_Else_correct)))))
(let ((anon96_Else_correct  (=> (not (and (and (and b_28@12 b_31@3) true) (> neededTransfer@6 0.0))) (=> (and (= Heap@2 Heap@0) (= b_31@6 b_31@3)) (=> (and (and (= Mask@6 Mask@4) (= Used_14Mask@3 Used_14Mask@1)) (and (= neededTransfer@8 neededTransfer@6) (= (ControlFlow 0 75) 73))) anon36_correct)))))
(let ((anon95_Else_correct  (=> (>= 0.0 takeTransfer@2) (=> (and (and (= neededTransfer@6 neededTransfer@4) (= Ops_7Mask@7 Ops_7Mask@5)) (and (= Used_14Mask@1 ZeroMask) (= b_31@3 b_31@0))) (and (=> (= (ControlFlow 0 83) 80) anon96_Then_correct) (=> (= (ControlFlow 0 83) 75) anon96_Else_correct))))))
(let ((anon95_Then_correct  (=> (and (> takeTransfer@2 0.0) (= neededTransfer@5 (- neededTransfer@4 takeTransfer@2))) (=> (and (and (and (= Used_14Mask@0 (MapType0Store ZeroMask p_1@@3 f_7 (real_2_U (+ (U_2_real (MapType0Select ZeroMask p_1@@3 f_7)) takeTransfer@2)))) (= b_31@1  (and b_31@0 (state Used_14Heap@0 Used_14Mask@0)))) (and (= b_31@2  (and b_31@1 (= (U_2_int (MapType1Select Ops_7Heap@0 p_1@@3 f_7)) (U_2_int (MapType1Select Used_14Heap@0 p_1@@3 f_7))))) (= Ops_7Mask@6 (MapType0Store Ops_7Mask@5 p_1@@3 f_7 (real_2_U (- (U_2_real (MapType0Select Ops_7Mask@5 p_1@@3 f_7)) takeTransfer@2)))))) (and (and (= neededTransfer@6 neededTransfer@5) (= Ops_7Mask@7 Ops_7Mask@6)) (and (= Used_14Mask@1 Used_14Mask@0) (= b_31@3 b_31@2)))) (and (=> (= (ControlFlow 0 82) 80) anon96_Then_correct) (=> (= (ControlFlow 0 82) 75) anon96_Else_correct))))))
(let ((anon94_Else_correct  (=> (and (< maskTransfer@2 neededTransfer@4) (= takeTransfer@2 maskTransfer@2)) (and (=> (= (ControlFlow 0 85) 82) anon95_Then_correct) (=> (= (ControlFlow 0 85) 83) anon95_Else_correct)))))
(let ((anon94_Then_correct  (=> (and (<= neededTransfer@4 maskTransfer@2) (= takeTransfer@2 neededTransfer@4)) (and (=> (= (ControlFlow 0 84) 82) anon95_Then_correct) (=> (= (ControlFlow 0 84) 83) anon95_Else_correct)))))
(let ((anon93_Then_correct  (=> (and (and (and (and b_28@12 b_31@0) true) (> neededTransfer@4 0.0)) (= maskTransfer@2 (U_2_real (MapType0Select Ops_7Mask@5 p_1@@3 f_7)))) (and (=> (= (ControlFlow 0 86) 84) anon94_Then_correct) (=> (= (ControlFlow 0 86) 85) anon94_Else_correct)))))
(let ((anon93_Else_correct  (=> (not (and (and (and b_28@12 b_31@0) true) (> neededTransfer@4 0.0))) (=> (and (and (= neededTransfer@6 neededTransfer@4) (= Ops_7Mask@7 Ops_7Mask@5)) (and (= Used_14Mask@1 ZeroMask) (= b_31@3 b_31@0))) (and (=> (= (ControlFlow 0 81) 80) anon96_Then_correct) (=> (= (ControlFlow 0 81) 75) anon96_Else_correct))))))
(let ((anon24_correct  (and (=> (= (ControlFlow 0 87) (- 0 89)) (=> (and b_28@8 b_29@4) (and (= neededTransfer@3 0.0) (= (U_2_real (MapType0Select Used_13Mask@3 null (wand_4 p_1@@3 (/ (to_real 1) (to_real 2)) p_1@@3 FullPerm p_1@@3 0))) initNeededTransfer@0)))) (=> (=> (and b_28@8 b_29@4) (and (= neededTransfer@3 0.0) (= (U_2_real (MapType0Select Used_13Mask@3 null (wand_4 p_1@@3 (/ (to_real 1) (to_real 2)) p_1@@3 FullPerm p_1@@3 0))) initNeededTransfer@0))) (=> (and (and (= b_30@0  (and b_28@8 b_29@4)) (= b_30@1  (and b_30@0 (state Result_12Heap Result_12Mask)))) (and (= b_30@2  (and b_30@1 (sumMask Result_12Mask Ops_7Mask@5 Used_13Mask@3))) (= b_30@3  (and (and b_30@2 (IdenticalOnKnownLocations Ops_7Heap@0 Result_12Heap Ops_7Mask@5)) (IdenticalOnKnownLocations Used_13Heap@0 Result_12Heap Used_13Mask@3))))) (=> (and (and (and (= b_30@4  (and b_30@3 (state Result_12Heap Result_12Mask))) (= b_28@9  (and b_28@8 b_30@4))) (and (= b_28@10  (and b_28@9 b_29@4)) (= b_28@11  (and b_28@10 (= Used_13Heap@0 Ops_7Heap@0))))) (and (and (= b_28@12  (and b_28@11 (state Ops_7Heap@0 Ops_7Mask@5))) (= b_31@0  (and b_31 (state Used_14Heap@0 ZeroMask)))) (and (= neededTransfer@4 (/ (to_real 1) (to_real 2))) (= initNeededTransfer@1 (+ (U_2_real (MapType0Select ZeroMask p_1@@3 f_7)) neededTransfer@4))))) (and (=> (= (ControlFlow 0 87) (- 0 88)) (>= neededTransfer@4 0.0)) (=> (>= neededTransfer@4 0.0) (and (=> (= (ControlFlow 0 87) 86) anon93_Then_correct) (=> (= (ControlFlow 0 87) 81) anon93_Else_correct))))))))))
(let ((anon92_Else_correct  (=> (and (>= 0.0 takeTransfer@1) (= Mask@4 Mask@2)) (=> (and (and (= neededTransfer@3 neededTransfer@1) (= b_29@4 b_29@2)) (and (= Used_13Mask@3 Used_13Mask@1) (= (ControlFlow 0 92) 87))) anon24_correct))))
(let ((anon92_Then_correct  (=> (and (> takeTransfer@1 0.0) (= neededTransfer@2 (- neededTransfer@1 takeTransfer@1))) (=> (and (and (and (= Used_13Mask@2 (MapType0Store Used_13Mask@1 null (wand_4 p_1@@3 (/ (to_real 1) (to_real 2)) p_1@@3 FullPerm p_1@@3 0) (real_2_U (+ (U_2_real (MapType0Select Used_13Mask@1 null (wand_4 p_1@@3 (/ (to_real 1) (to_real 2)) p_1@@3 FullPerm p_1@@3 0))) takeTransfer@1)))) (= b_29@3  (and b_29@2 (state Used_13Heap@0 Used_13Mask@2)))) (and (= Mask@3 (MapType0Store Mask@2 null (wand_4 p_1@@3 (/ (to_real 1) (to_real 2)) p_1@@3 FullPerm p_1@@3 0) (real_2_U (- (U_2_real (MapType0Select Mask@2 null (wand_4 p_1@@3 (/ (to_real 1) (to_real 2)) p_1@@3 FullPerm p_1@@3 0))) takeTransfer@1)))) (= Mask@4 Mask@3))) (and (and (= neededTransfer@3 neededTransfer@2) (= b_29@4 b_29@3)) (and (= Used_13Mask@3 Used_13Mask@2) (= (ControlFlow 0 91) 87)))) anon24_correct))))
(let ((anon91_Else_correct  (=> (and (< maskTransfer@1 neededTransfer@1) (= takeTransfer@1 maskTransfer@1)) (and (=> (= (ControlFlow 0 94) 91) anon92_Then_correct) (=> (= (ControlFlow 0 94) 92) anon92_Else_correct)))))
(let ((anon91_Then_correct  (=> (and (<= neededTransfer@1 maskTransfer@1) (= takeTransfer@1 neededTransfer@1)) (and (=> (= (ControlFlow 0 93) 91) anon92_Then_correct) (=> (= (ControlFlow 0 93) 92) anon92_Else_correct)))))
(let ((anon90_Then_correct  (=> (and (and (and (and b_28@8 b_29@2) true) (> neededTransfer@1 0.0)) (= maskTransfer@1 (U_2_real (MapType0Select Mask@2 null (wand_4 p_1@@3 (/ (to_real 1) (to_real 2)) p_1@@3 FullPerm p_1@@3 0))))) (and (=> (= (ControlFlow 0 95) 93) anon91_Then_correct) (=> (= (ControlFlow 0 95) 94) anon91_Else_correct)))))
(let ((anon90_Else_correct  (=> (and (not (and (and (and b_28@8 b_29@2) true) (> neededTransfer@1 0.0))) (= Mask@4 Mask@2)) (=> (and (and (= neededTransfer@3 neededTransfer@1) (= b_29@4 b_29@2)) (and (= Used_13Mask@3 Used_13Mask@1) (= (ControlFlow 0 90) 87))) anon24_correct))))
(let ((anon89_Else_correct  (=> (>= 0.0 takeTransfer@0) (=> (and (and (= Ops_7Mask@5 Ops_7Mask@3) (= Used_13Mask@1 ZeroMask)) (and (= b_29@2 b_29@0) (= neededTransfer@1 1.0))) (and (=> (= (ControlFlow 0 98) 95) anon90_Then_correct) (=> (= (ControlFlow 0 98) 90) anon90_Else_correct))))))
(let ((anon89_Then_correct  (=> (> takeTransfer@0 0.0) (=> (and (and (and (= neededTransfer@0 (- 1.0 takeTransfer@0)) (= Used_13Mask@0 (MapType0Store ZeroMask null (wand_4 p_1@@3 (/ (to_real 1) (to_real 2)) p_1@@3 FullPerm p_1@@3 0) (real_2_U (+ (U_2_real (MapType0Select ZeroMask null (wand_4 p_1@@3 (/ (to_real 1) (to_real 2)) p_1@@3 FullPerm p_1@@3 0))) takeTransfer@0))))) (and (= b_29@1  (and b_29@0 (state Used_13Heap@0 Used_13Mask@0))) (= Ops_7Mask@4 (MapType0Store Ops_7Mask@3 null (wand_4 p_1@@3 (/ (to_real 1) (to_real 2)) p_1@@3 FullPerm p_1@@3 0) (real_2_U (- (U_2_real (MapType0Select Ops_7Mask@3 null (wand_4 p_1@@3 (/ (to_real 1) (to_real 2)) p_1@@3 FullPerm p_1@@3 0))) takeTransfer@0)))))) (and (and (= Ops_7Mask@5 Ops_7Mask@4) (= Used_13Mask@1 Used_13Mask@0)) (and (= b_29@2 b_29@1) (= neededTransfer@1 neededTransfer@0)))) (and (=> (= (ControlFlow 0 97) 95) anon90_Then_correct) (=> (= (ControlFlow 0 97) 90) anon90_Else_correct))))))
(let ((anon88_Else_correct  (=> (and (< maskTransfer@0 1.0) (= takeTransfer@0 maskTransfer@0)) (and (=> (= (ControlFlow 0 100) 97) anon89_Then_correct) (=> (= (ControlFlow 0 100) 98) anon89_Else_correct)))))
(let ((anon88_Then_correct  (=> (and (<= 1.0 maskTransfer@0) (= takeTransfer@0 1.0)) (and (=> (= (ControlFlow 0 99) 97) anon89_Then_correct) (=> (= (ControlFlow 0 99) 98) anon89_Else_correct)))))
(let ((anon87_Then_correct  (=> (and (and (and (and b_28@8 b_29@0) true) (> 1.0 0.0)) (= maskTransfer@0 (U_2_real (MapType0Select Ops_7Mask@3 null (wand_4 p_1@@3 (/ (to_real 1) (to_real 2)) p_1@@3 FullPerm p_1@@3 0))))) (and (=> (= (ControlFlow 0 101) 99) anon88_Then_correct) (=> (= (ControlFlow 0 101) 100) anon88_Else_correct)))))
(let ((anon87_Else_correct  (=> (not (and (and (and b_28@8 b_29@0) true) (> 1.0 0.0))) (=> (and (and (= Ops_7Mask@5 Ops_7Mask@3) (= Used_13Mask@1 ZeroMask)) (and (= b_29@2 b_29@0) (= neededTransfer@1 1.0))) (and (=> (= (ControlFlow 0 96) 95) anon90_Then_correct) (=> (= (ControlFlow 0 96) 90) anon90_Else_correct))))))
(let ((anon12_correct  (=> (= initNeededTransfer@0 (+ (U_2_real (MapType0Select ZeroMask null (wand_4 p_1@@3 (/ (to_real 1) (to_real 2)) p_1@@3 FullPerm p_1@@3 0))) 1.0)) (and (=> (= (ControlFlow 0 102) (- 0 103)) (>= 1.0 0.0)) (=> (>= 1.0 0.0) (and (=> (= (ControlFlow 0 102) 101) anon87_Then_correct) (=> (= (ControlFlow 0 102) 96) anon87_Else_correct)))))))
(let ((anon85_Then_correct  (=> b_28@8 (and (=> (= (ControlFlow 0 109) 107) anon86_Then_correct) (=> (= (ControlFlow 0 109) 102) anon12_correct)))))
(let ((anon85_Else_correct  (=> (and (not b_28@8) (= (ControlFlow 0 105) 102)) anon12_correct)))
(let ((anon84_Then_correct  (=> (and b_28@8 b_29@0) (and (=> (= (ControlFlow 0 110) 109) anon85_Then_correct) (=> (= (ControlFlow 0 110) 105) anon85_Else_correct)))))
(let ((anon84_Else_correct  (=> (and (not (and b_28@8 b_29@0)) (= (ControlFlow 0 104) 102)) anon12_correct)))
(let ((anon83_Then_correct  (=> (and b_28@8 (= b_29@0  (and b_29 (state Used_13Heap@0 ZeroMask)))) (and (=> (= (ControlFlow 0 111) 110) anon84_Then_correct) (=> (= (ControlFlow 0 111) 104) anon84_Else_correct)))))
(let ((anon83_Else_correct  (=> (not b_28@8) (=> (and (= Ops_7Heap@1 Ops_7Heap@0) (= b_28@23 b_28@8)) (=> (and (and (= Mask@7 Mask@2) (= Ops_7Mask@9 Ops_7Mask@3)) (and (= Heap@3 Heap@0) (= (ControlFlow 0 72) 70))) anon37_correct)))))
(let ((anon7_correct  (=> (and (= b_28@7  (and b_28@6 (state Ops_7Heap@0 Ops_7Mask@3))) (= b_28@8  (and b_28@7 (state Ops_7Heap@0 Ops_7Mask@3)))) (and (=> (= (ControlFlow 0 112) 111) anon83_Then_correct) (=> (= (ControlFlow 0 112) 72) anon83_Else_correct)))))
(let ((anon82_Else_correct  (=> (and (and (not b_28@3) (= b_28@6 b_28@3)) (and (= Ops_7Mask@3 Ops_7Mask@1) (= (ControlFlow 0 116) 112))) anon7_correct)))
(let ((anon82_Then_correct  (=> (and b_28@3 (= perm@3 (/ (to_real 1) (to_real 2)))) (and (=> (= (ControlFlow 0 114) (- 0 115)) (>= perm@3 NoPerm)) (=> (>= perm@3 NoPerm) (=> (and (= b_28@4  (and b_28@3 (=> (> perm@3 NoPerm) (not (= p_1@@3 null))))) (= Ops_7Mask@2 (MapType0Store Ops_7Mask@1 p_1@@3 f_7 (real_2_U (+ (U_2_real (MapType0Select Ops_7Mask@1 p_1@@3 f_7)) perm@3))))) (=> (and (and (= b_28@5  (and b_28@4 (state Ops_7Heap@0 Ops_7Mask@2))) (= b_28@6 b_28@5)) (and (= Ops_7Mask@3 Ops_7Mask@2) (= (ControlFlow 0 114) 112))) anon7_correct)))))))
(let ((anon81_Else_correct  (=> (not b_28@0) (=> (and (= Ops_7Mask@1 ZeroMask) (= b_28@3 b_28@0)) (and (=> (= (ControlFlow 0 119) 114) anon82_Then_correct) (=> (= (ControlFlow 0 119) 116) anon82_Else_correct))))))
(let ((anon81_Then_correct  (=> (and b_28@0 (= perm@2 (/ (to_real 1) (to_real 2)))) (and (=> (= (ControlFlow 0 117) (- 0 118)) (>= perm@2 NoPerm)) (=> (>= perm@2 NoPerm) (=> (= b_28@1  (and b_28@0 (=> (> perm@2 NoPerm) (not (= p_1@@3 null))))) (=> (and (and (= Ops_7Mask@0 (MapType0Store ZeroMask p_1@@3 g (real_2_U (+ (U_2_real (MapType0Select ZeroMask p_1@@3 g)) perm@2)))) (= b_28@2  (and b_28@1 (state Ops_7Heap@0 Ops_7Mask@0)))) (and (= Ops_7Mask@1 Ops_7Mask@0) (= b_28@3 b_28@2))) (and (=> (= (ControlFlow 0 117) 114) anon82_Then_correct) (=> (= (ControlFlow 0 117) 116) anon82_Else_correct)))))))))
(let ((anon80_Then_correct  (=> b_28@0 (and (=> (= (ControlFlow 0 120) 117) anon81_Then_correct) (=> (= (ControlFlow 0 120) 119) anon81_Else_correct)))))
(let ((anon80_Else_correct  (=> (and (and (not b_28@0) (= b_28@6 b_28@0)) (and (= Ops_7Mask@3 ZeroMask) (= (ControlFlow 0 113) 112))) anon7_correct)))
(let ((anon79_Else_correct  (=> (and (and (= Mask@0 (MapType0Store ZeroMask null (wand_4 p_1@@3 (/ (to_real 1) (to_real 2)) p_1@@3 FullPerm p_1@@3 0) (real_2_U (+ (U_2_real (MapType0Select ZeroMask null (wand_4 p_1@@3 (/ (to_real 1) (to_real 2)) p_1@@3 FullPerm p_1@@3 0))) FullPerm)))) (state Heap@@14 Mask@0)) (and (state Heap@@14 Mask@0) (= perm@1 (/ (to_real 1) (to_real 2))))) (and (=> (= (ControlFlow 0 121) (- 0 123)) (>= perm@1 NoPerm)) (=> (>= perm@1 NoPerm) (=> (and (and (and (=> (> perm@1 NoPerm) (not (= p_1@@3 null))) (= Mask@1 (MapType0Store Mask@0 p_1@@3 f_7 (real_2_U (+ (U_2_real (MapType0Select Mask@0 p_1@@3 f_7)) perm@1))))) (and (state Heap@@14 Mask@1) (state Heap@@14 Mask@1))) (and (and (not (= p_1@@3 null)) (= Mask@2 (MapType0Store Mask@1 p_1@@3 g (real_2_U (+ (U_2_real (MapType0Select Mask@1 p_1@@3 g)) FullPerm))))) (and (state Heap@@14 Mask@2) (state Heap@@14 Mask@2)))) (and (=> (= (ControlFlow 0 121) (- 0 122)) (= FullPerm (U_2_real (MapType0Select Mask@2 p_1@@3 g)))) (=> (= FullPerm (U_2_real (MapType0Select Mask@2 p_1@@3 g))) (=> (and (and (= Heap@0 (MapType1Store Heap@@14 p_1@@3 g (int_2_U 1))) (state Heap@0 Mask@2)) (and (= b_28@0  (and b_28 (state Ops_7Heap@0 ZeroMask))) (= b_27@0  (and b_27 (state Used_12Heap@0 ZeroMask))))) (and (=> (= (ControlFlow 0 121) 120) anon80_Then_correct) (=> (= (ControlFlow 0 121) 113) anon80_Else_correct)))))))))))
(let ((anon79_Then_correct  (=> (= perm@0 (/ (to_real 1) (to_real 2))) (and (=> (= (ControlFlow 0 2) (- 0 3)) (>= perm@0 NoPerm)) (=> (>= perm@0 NoPerm) (=> (=> (> perm@0 NoPerm) (not (= p_1@@3 null))) (=> (and (and (and (= WandDefLHSMask@0 (MapType0Store ZeroMask p_1@@3 f_7 (real_2_U (+ (U_2_real (MapType0Select ZeroMask p_1@@3 f_7)) perm@0)))) (state WandDefLHSHeap@0 WandDefLHSMask@0)) (and (state WandDefLHSHeap@0 WandDefLHSMask@0) (state WandDefLHSHeap@0 WandDefLHSMask@0))) (and (and (not (= p_1@@3 null)) (= WandDefRHSMask@0 (MapType0Store ZeroMask p_1@@3 f_7 (real_2_U (+ (U_2_real (MapType0Select ZeroMask p_1@@3 f_7)) FullPerm))))) (and (state WandDefRHSHeap@0 WandDefRHSMask@0) (= (ControlFlow 0 2) (- 0 1))))) (HasDirectPerm WandDefRHSMask@0 p_1@@3 f_7))))))))
(let ((anon0_correct  (=> (state Heap@@14 ZeroMask) (=> (and (= AssumeFunctionsAbove (- 0 1)) (U_2_bool (MapType1Select Heap@@14 p_1@@3 $allocated))) (and (=> (= (ControlFlow 0 124) 2) anon79_Then_correct) (=> (= (ControlFlow 0 124) 121) anon79_Else_correct))))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 125) 124) anon0_correct)))
PreconditionGeneratedEntry_correct)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
))
(check-sat)
(get-info :reason-unknown)
(assert (not (= (ControlFlow 0 5) (- 4))))
(check-sat)
(pop 1)
; Invalid
(get-info :rlimit)
