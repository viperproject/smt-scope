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
(declare-fun succHeap (T@U T@U) Bool)
(declare-fun MapType0Type (T@T) T@T)
(declare-fun RefType () T@T)
(declare-fun succHeapTrans (T@U T@U) Bool)
(declare-fun MapType0TypeInv0 (T@T) T@T)
(declare-fun MapType0Select (T@U T@U T@U) T@U)
(declare-fun MapType0Store (T@U T@U T@U T@U) T@U)
(declare-fun wand (T@U Real T@U Real) T@U)
(declare-fun getPredWandId (T@U) Int)
(declare-fun WandType_wandType () T@T)
(declare-fun wand_2 (T@U Real T@U Real) T@U)
(declare-fun WandType_wand_2Type () T@T)
(declare-fun state (T@U T@U) Bool)
(declare-fun MapType1Type (T@T T@T) T@T)
(declare-fun GoodMask (T@U) Bool)
(declare-fun MapType1TypeInv0 (T@T) T@T)
(declare-fun MapType1TypeInv1 (T@T) T@T)
(declare-fun MapType1Select (T@U T@U T@U) T@U)
(declare-fun MapType1Store (T@U T@U T@U T@U) T@U)
(declare-fun wand_3 (Bool T@U Real) T@U)
(declare-fun IsWandField (T@U) Bool)
(declare-fun WandType_wand_3Type () T@T)
(declare-fun |wand_3#ft| (Bool T@U Real) T@U)
(declare-fun FrameTypeType () T@T)
(declare-fun wand_5 (Bool T@U Real) T@U)
(declare-fun WandType_wand_5Type () T@T)
(declare-fun |wand_5#ft| (Bool T@U Real) T@U)
(declare-fun IsPredicateField (T@U) Bool)
(declare-fun wand_1 (Bool Bool) T@U)
(declare-fun WandType_wand_1Type () T@T)
(declare-fun |wand_1#ft| (Bool Bool) T@U)
(declare-fun IdenticalOnKnownLocations (T@U T@U T@U) Bool)
(declare-fun null () T@U)
(declare-fun PredicateMaskField (T@U) T@U)
(declare-fun HasDirectPerm (T@U T@U T@U) Bool)
(declare-fun WandMaskField (T@U) T@U)
(declare-fun Pair (T@U) T@U)
(declare-fun PredicateType_PairType () T@T)
(declare-fun |sum'| (T@U T@U) Int)
(declare-fun dummyFunction (T@U) Bool)
(declare-fun |sum#triggerStateless| (T@U) Int)
(declare-fun |Pair#trigger| (T@U T@U) Bool)
(declare-fun |Pair#everUsed| (T@U) Bool)
(declare-fun |wand_4#ft| (T@U Real T@U Real T@U Int) T@U)
(declare-fun |wand_4#sm| (T@U Real T@U Real T@U Int) T@U)
(declare-fun WandType_wand_4Type () T@T)
(declare-fun |wand_3#sm| (Bool T@U Real) T@U)
(declare-fun |wand_5#sm| (Bool T@U Real) T@U)
(declare-fun sum (T@U T@U) Int)
(declare-fun |Pair#sm| (T@U) T@U)
(declare-fun dummyHeap () T@U)
(declare-fun ZeroMask () T@U)
(declare-fun InsidePredicate (T@U T@U T@U T@U) Bool)
(declare-fun AssumeFunctionsAbove () Int)
(declare-fun sumMask (T@U T@U T@U) Bool)
(declare-fun |wand#ft| (T@U Real T@U Real) T@U)
(declare-fun |wand_2#ft| (T@U Real T@U Real) T@U)
(declare-fun wand_4 (T@U Real T@U Real T@U Int) T@U)
(declare-fun ConditionalFrame (Real T@U) T@U)
(declare-fun EmptyFrame () T@U)
(declare-fun NoPerm () Real)
(declare-fun |wand#sm| (T@U Real T@U Real) T@U)
(declare-fun |wand_2#sm| (T@U Real T@U Real) T@U)
(declare-fun FullPerm () Real)
(declare-fun |sum#frame| (T@U T@U) Int)
(declare-fun |wand_1#sm| (Bool Bool) T@U)
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
))) (= (Ctor NormalFieldType) 7)) (= (type $allocated) (FieldType NormalFieldType boolType))) (= (type f_7) (FieldType NormalFieldType intType))) (= (type g) (FieldType NormalFieldType intType))) (= (type h) (FieldType NormalFieldType intType))))
(assert (distinct $allocated f_7 g h)
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
(assert  (and (= (Ctor WandType_wandType) 10) (forall ((arg0@@18 T@U) (arg1@@4 Real) (arg2@@1 T@U) (arg3@@0 Real) ) (! (= (type (wand arg0@@18 arg1@@4 arg2@@1 arg3@@0)) (FieldType WandType_wandType intType))
 :qid |funType:wand|
 :pattern ( (wand arg0@@18 arg1@@4 arg2@@1 arg3@@0))
))))
(assert (forall ((arg1@@5 T@U) (arg2@@2 Real) (arg3@@1 T@U) (arg4 Real) ) (!  (=> (and (= (type arg1@@5) RefType) (= (type arg3@@1) RefType)) (= (getPredWandId (wand arg1@@5 arg2@@2 arg3@@1 arg4)) 1))
 :qid |stdinbpl.206:15|
 :skolemid |27|
 :pattern ( (wand arg1@@5 arg2@@2 arg3@@1 arg4))
)))
(assert  (and (= (Ctor WandType_wand_2Type) 11) (forall ((arg0@@19 T@U) (arg1@@6 Real) (arg2@@3 T@U) (arg3@@2 Real) ) (! (= (type (wand_2 arg0@@19 arg1@@6 arg2@@3 arg3@@2)) (FieldType WandType_wand_2Type intType))
 :qid |funType:wand_2|
 :pattern ( (wand_2 arg0@@19 arg1@@6 arg2@@3 arg3@@2))
))))
(assert (forall ((arg1@@7 T@U) (arg2@@4 Real) (arg3@@3 T@U) (arg4@@0 Real) ) (!  (=> (and (= (type arg1@@7) RefType) (= (type arg3@@3) RefType)) (= (getPredWandId (wand_2 arg1@@7 arg2@@4 arg3@@3 arg4@@0)) 2))
 :qid |stdinbpl.238:15|
 :skolemid |34|
 :pattern ( (wand_2 arg1@@7 arg2@@4 arg3@@3 arg4@@0))
)))
(assert  (and (and (and (and (and (and (forall ((arg0@@20 T@T) (arg1@@8 T@T) ) (! (= (Ctor (MapType1Type arg0@@20 arg1@@8)) 12)
 :qid |ctor:MapType1Type|
)) (forall ((arg0@@21 T@T) (arg1@@9 T@T) ) (! (= (MapType1TypeInv0 (MapType1Type arg0@@21 arg1@@9)) arg0@@21)
 :qid |typeInv:MapType1TypeInv0|
 :pattern ( (MapType1Type arg0@@21 arg1@@9))
))) (forall ((arg0@@22 T@T) (arg1@@10 T@T) ) (! (= (MapType1TypeInv1 (MapType1Type arg0@@22 arg1@@10)) arg1@@10)
 :qid |typeInv:MapType1TypeInv1|
 :pattern ( (MapType1Type arg0@@22 arg1@@10))
))) (forall ((arg0@@23 T@U) (arg1@@11 T@U) (arg2@@5 T@U) ) (! (let ((aVar1 (MapType1TypeInv1 (type arg0@@23))))
(= (type (MapType1Select arg0@@23 arg1@@11 arg2@@5)) aVar1))
 :qid |funType:MapType1Select|
 :pattern ( (MapType1Select arg0@@23 arg1@@11 arg2@@5))
))) (forall ((arg0@@24 T@U) (arg1@@12 T@U) (arg2@@6 T@U) (arg3@@4 T@U) ) (! (let ((aVar1@@0 (type arg3@@4)))
(let ((aVar0@@0 (type arg1@@12)))
(= (type (MapType1Store arg0@@24 arg1@@12 arg2@@6 arg3@@4)) (MapType1Type aVar0@@0 aVar1@@0))))
 :qid |funType:MapType1Store|
 :pattern ( (MapType1Store arg0@@24 arg1@@12 arg2@@6 arg3@@4))
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
(assert  (and (= (Ctor WandType_wand_3Type) 13) (forall ((arg0@@25 Bool) (arg1@@13 T@U) (arg2@@7 Real) ) (! (= (type (wand_3 arg0@@25 arg1@@13 arg2@@7)) (FieldType WandType_wand_3Type intType))
 :qid |funType:wand_3|
 :pattern ( (wand_3 arg0@@25 arg1@@13 arg2@@7))
))))
(assert (forall ((arg1@@14 Bool) (arg2@@8 T@U) (arg3@@5 Real) ) (!  (=> (= (type arg2@@8) RefType) (IsWandField (wand_3 arg1@@14 arg2@@8 arg3@@5)))
 :qid |stdinbpl.282:15|
 :skolemid |43|
 :pattern ( (wand_3 arg1@@14 arg2@@8 arg3@@5))
)))
(assert  (and (= (Ctor FrameTypeType) 14) (forall ((arg0@@26 Bool) (arg1@@15 T@U) (arg2@@9 Real) ) (! (= (type (|wand_3#ft| arg0@@26 arg1@@15 arg2@@9)) (FieldType WandType_wand_3Type FrameTypeType))
 :qid |funType:wand_3#ft|
 :pattern ( (|wand_3#ft| arg0@@26 arg1@@15 arg2@@9))
))))
(assert (forall ((arg1@@16 Bool) (arg2@@10 T@U) (arg3@@6 Real) ) (!  (=> (= (type arg2@@10) RefType) (IsWandField (|wand_3#ft| arg1@@16 arg2@@10 arg3@@6)))
 :qid |stdinbpl.286:15|
 :skolemid |44|
 :pattern ( (|wand_3#ft| arg1@@16 arg2@@10 arg3@@6))
)))
(assert  (and (= (Ctor WandType_wand_5Type) 15) (forall ((arg0@@27 Bool) (arg1@@17 T@U) (arg2@@11 Real) ) (! (= (type (wand_5 arg0@@27 arg1@@17 arg2@@11)) (FieldType WandType_wand_5Type intType))
 :qid |funType:wand_5|
 :pattern ( (wand_5 arg0@@27 arg1@@17 arg2@@11))
))))
(assert (forall ((arg1@@18 Bool) (arg2@@12 T@U) (arg3@@7 Real) ) (!  (=> (= (type arg2@@12) RefType) (IsWandField (wand_5 arg1@@18 arg2@@12 arg3@@7)))
 :qid |stdinbpl.314:15|
 :skolemid |50|
 :pattern ( (wand_5 arg1@@18 arg2@@12 arg3@@7))
)))
(assert (forall ((arg0@@28 Bool) (arg1@@19 T@U) (arg2@@13 Real) ) (! (= (type (|wand_5#ft| arg0@@28 arg1@@19 arg2@@13)) (FieldType WandType_wand_5Type FrameTypeType))
 :qid |funType:wand_5#ft|
 :pattern ( (|wand_5#ft| arg0@@28 arg1@@19 arg2@@13))
)))
(assert (forall ((arg1@@20 Bool) (arg2@@14 T@U) (arg3@@8 Real) ) (!  (=> (= (type arg2@@14) RefType) (IsWandField (|wand_5#ft| arg1@@20 arg2@@14 arg3@@8)))
 :qid |stdinbpl.318:15|
 :skolemid |51|
 :pattern ( (|wand_5#ft| arg1@@20 arg2@@14 arg3@@8))
)))
(assert (forall ((arg1@@21 Bool) (arg2@@15 T@U) (arg3@@9 Real) ) (!  (=> (= (type arg2@@15) RefType) (= (getPredWandId (wand_3 arg1@@21 arg2@@15 arg3@@9)) 4))
 :qid |stdinbpl.302:15|
 :skolemid |48|
 :pattern ( (wand_3 arg1@@21 arg2@@15 arg3@@9))
)))
(assert (forall ((arg1@@22 Bool) (arg2@@16 T@U) (arg3@@10 Real) ) (!  (=> (= (type arg2@@16) RefType) (= (getPredWandId (wand_5 arg1@@22 arg2@@16 arg3@@10)) 5))
 :qid |stdinbpl.334:15|
 :skolemid |55|
 :pattern ( (wand_5 arg1@@22 arg2@@16 arg3@@10))
)))
(assert (forall ((arg1@@23 Bool) (arg2@@17 T@U) (arg3@@11 Real) ) (!  (=> (= (type arg2@@17) RefType) (not (IsPredicateField (wand_3 arg1@@23 arg2@@17 arg3@@11))))
 :qid |stdinbpl.290:15|
 :skolemid |45|
 :pattern ( (wand_3 arg1@@23 arg2@@17 arg3@@11))
)))
(assert (forall ((arg1@@24 Bool) (arg2@@18 T@U) (arg3@@12 Real) ) (!  (=> (= (type arg2@@18) RefType) (not (IsPredicateField (|wand_3#ft| arg1@@24 arg2@@18 arg3@@12))))
 :qid |stdinbpl.294:15|
 :skolemid |46|
 :pattern ( (|wand_3#ft| arg1@@24 arg2@@18 arg3@@12))
)))
(assert (forall ((arg1@@25 Bool) (arg2@@19 T@U) (arg3@@13 Real) ) (!  (=> (= (type arg2@@19) RefType) (not (IsPredicateField (wand_5 arg1@@25 arg2@@19 arg3@@13))))
 :qid |stdinbpl.322:15|
 :skolemid |52|
 :pattern ( (wand_5 arg1@@25 arg2@@19 arg3@@13))
)))
(assert (forall ((arg1@@26 Bool) (arg2@@20 T@U) (arg3@@14 Real) ) (!  (=> (= (type arg2@@20) RefType) (not (IsPredicateField (|wand_5#ft| arg1@@26 arg2@@20 arg3@@14))))
 :qid |stdinbpl.326:15|
 :skolemid |53|
 :pattern ( (|wand_5#ft| arg1@@26 arg2@@20 arg3@@14))
)))
(assert  (and (= (Ctor WandType_wand_1Type) 16) (forall ((arg0@@29 Bool) (arg1@@27 Bool) ) (! (= (type (wand_1 arg0@@29 arg1@@27)) (FieldType WandType_wand_1Type intType))
 :qid |funType:wand_1|
 :pattern ( (wand_1 arg0@@29 arg1@@27))
))))
(assert (forall ((arg1@@28 Bool) (arg2@@21 Bool) ) (! (IsWandField (wand_1 arg1@@28 arg2@@21))
 :qid |stdinbpl.346:15|
 :skolemid |57|
 :pattern ( (wand_1 arg1@@28 arg2@@21))
)))
(assert (forall ((arg0@@30 Bool) (arg1@@29 Bool) ) (! (= (type (|wand_1#ft| arg0@@30 arg1@@29)) (FieldType WandType_wand_1Type FrameTypeType))
 :qid |funType:wand_1#ft|
 :pattern ( (|wand_1#ft| arg0@@30 arg1@@29))
)))
(assert (forall ((arg1@@30 Bool) (arg2@@22 Bool) ) (! (IsWandField (|wand_1#ft| arg1@@30 arg2@@22))
 :qid |stdinbpl.350:15|
 :skolemid |58|
 :pattern ( (|wand_1#ft| arg1@@30 arg2@@22))
)))
(assert  (and (= (type null) RefType) (forall ((arg0@@31 T@U) ) (! (let ((A (FieldTypeInv0 (type arg0@@31))))
(= (type (PredicateMaskField arg0@@31)) (FieldType A (MapType1Type RefType boolType))))
 :qid |funType:PredicateMaskField|
 :pattern ( (PredicateMaskField arg0@@31))
))))
(assert (forall ((Heap@@0 T@U) (ExhaleHeap T@U) (Mask@@0 T@U) (pm_f T@U) ) (! (let ((C (FieldTypeInv0 (type pm_f))))
 (=> (and (and (and (and (and (= (type Heap@@0) (MapType0Type RefType)) (= (type ExhaleHeap) (MapType0Type RefType))) (= (type Mask@@0) (MapType1Type RefType realType))) (= (type pm_f) (FieldType C FrameTypeType))) (IdenticalOnKnownLocations Heap@@0 ExhaleHeap Mask@@0)) (and (HasDirectPerm Mask@@0 null pm_f) (IsPredicateField pm_f))) (= (MapType0Select Heap@@0 null (PredicateMaskField pm_f)) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))))
 :qid |stdinbpl.47:19|
 :skolemid |2|
 :pattern ( (IdenticalOnKnownLocations Heap@@0 ExhaleHeap Mask@@0) (IsPredicateField pm_f) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))
)))
(assert (forall ((arg0@@32 T@U) ) (! (let ((A@@0 (FieldTypeInv0 (type arg0@@32))))
(= (type (WandMaskField arg0@@32)) (FieldType A@@0 (MapType1Type RefType boolType))))
 :qid |funType:WandMaskField|
 :pattern ( (WandMaskField arg0@@32))
)))
(assert (forall ((Heap@@1 T@U) (ExhaleHeap@@0 T@U) (Mask@@1 T@U) (pm_f@@0 T@U) ) (! (let ((C@@0 (FieldTypeInv0 (type pm_f@@0))))
 (=> (and (and (and (and (and (= (type Heap@@1) (MapType0Type RefType)) (= (type ExhaleHeap@@0) (MapType0Type RefType))) (= (type Mask@@1) (MapType1Type RefType realType))) (= (type pm_f@@0) (FieldType C@@0 FrameTypeType))) (IdenticalOnKnownLocations Heap@@1 ExhaleHeap@@0 Mask@@1)) (and (HasDirectPerm Mask@@1 null pm_f@@0) (IsWandField pm_f@@0))) (= (MapType0Select Heap@@1 null (WandMaskField pm_f@@0)) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))))
 :qid |stdinbpl.60:19|
 :skolemid |5|
 :pattern ( (IdenticalOnKnownLocations Heap@@1 ExhaleHeap@@0 Mask@@1) (IsWandField pm_f@@0) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))
)))
(assert (forall ((arg1@@31 Bool) (arg2@@23 Bool) ) (!  (not (IsPredicateField (wand_1 arg1@@31 arg2@@23)))
 :qid |stdinbpl.354:15|
 :skolemid |59|
 :pattern ( (wand_1 arg1@@31 arg2@@23))
)))
(assert (forall ((arg1@@32 Bool) (arg2@@24 Bool) ) (!  (not (IsPredicateField (|wand_1#ft| arg1@@32 arg2@@24)))
 :qid |stdinbpl.358:15|
 :skolemid |60|
 :pattern ( (|wand_1#ft| arg1@@32 arg2@@24))
)))
(assert  (and (= (Ctor PredicateType_PairType) 17) (forall ((arg0@@33 T@U) ) (! (= (type (Pair arg0@@33)) (FieldType PredicateType_PairType FrameTypeType))
 :qid |funType:Pair|
 :pattern ( (Pair arg0@@33))
))))
(assert (forall ((this T@U) ) (!  (=> (= (type this) RefType) (IsPredicateField (Pair this)))
 :qid |stdinbpl.495:15|
 :skolemid |69|
 :pattern ( (Pair this))
)))
(assert (forall ((Heap@@2 T@U) (p_1 T@U) ) (!  (=> (and (= (type Heap@@2) (MapType0Type RefType)) (= (type p_1) RefType)) (dummyFunction (int_2_U (|sum#triggerStateless| p_1))))
 :qid |stdinbpl.400:15|
 :skolemid |65|
 :pattern ( (|sum'| Heap@@2 p_1))
)))
(assert (forall ((Heap@@3 T@U) (this@@0 T@U) ) (!  (=> (and (= (type Heap@@3) (MapType0Type RefType)) (= (type this@@0) RefType)) (|Pair#everUsed| (Pair this@@0)))
 :qid |stdinbpl.514:15|
 :skolemid |73|
 :pattern ( (|Pair#trigger| Heap@@3 (Pair this@@0)))
)))
(assert  (and (and (= (Ctor WandType_wand_4Type) 18) (forall ((arg0@@34 T@U) (arg1@@33 Real) (arg2@@25 T@U) (arg3@@15 Real) (arg4@@1 T@U) (arg5 Int) ) (! (= (type (|wand_4#ft| arg0@@34 arg1@@33 arg2@@25 arg3@@15 arg4@@1 arg5)) (FieldType WandType_wand_4Type FrameTypeType))
 :qid |funType:wand_4#ft|
 :pattern ( (|wand_4#ft| arg0@@34 arg1@@33 arg2@@25 arg3@@15 arg4@@1 arg5))
))) (forall ((arg0@@35 T@U) (arg1@@34 Real) (arg2@@26 T@U) (arg3@@16 Real) (arg4@@2 T@U) (arg5@@0 Int) ) (! (= (type (|wand_4#sm| arg0@@35 arg1@@34 arg2@@26 arg3@@16 arg4@@2 arg5@@0)) (FieldType WandType_wand_4Type (MapType1Type RefType boolType)))
 :qid |funType:wand_4#sm|
 :pattern ( (|wand_4#sm| arg0@@35 arg1@@34 arg2@@26 arg3@@16 arg4@@2 arg5@@0))
))))
(assert (forall ((arg1@@35 T@U) (arg2@@27 Real) (arg3@@17 T@U) (arg4@@3 Real) (arg5@@1 T@U) (arg6 Int) ) (!  (=> (and (and (= (type arg1@@35) RefType) (= (type arg3@@17) RefType)) (= (type arg5@@1) RefType)) (= (|wand_4#sm| arg1@@35 arg2@@27 arg3@@17 arg4@@3 arg5@@1 arg6) (WandMaskField (|wand_4#ft| arg1@@35 arg2@@27 arg3@@17 arg4@@3 arg5@@1 arg6))))
 :qid |stdinbpl.266:15|
 :skolemid |40|
 :pattern ( (WandMaskField (|wand_4#ft| arg1@@35 arg2@@27 arg3@@17 arg4@@3 arg5@@1 arg6)))
)))
(assert (forall ((arg0@@36 Bool) (arg1@@36 T@U) (arg2@@28 Real) ) (! (= (type (|wand_3#sm| arg0@@36 arg1@@36 arg2@@28)) (FieldType WandType_wand_3Type (MapType1Type RefType boolType)))
 :qid |funType:wand_3#sm|
 :pattern ( (|wand_3#sm| arg0@@36 arg1@@36 arg2@@28))
)))
(assert (forall ((arg1@@37 Bool) (arg2@@29 T@U) (arg3@@18 Real) ) (!  (=> (= (type arg2@@29) RefType) (= (|wand_3#sm| arg1@@37 arg2@@29 arg3@@18) (WandMaskField (|wand_3#ft| arg1@@37 arg2@@29 arg3@@18))))
 :qid |stdinbpl.298:15|
 :skolemid |47|
 :pattern ( (WandMaskField (|wand_3#ft| arg1@@37 arg2@@29 arg3@@18)))
)))
(assert (forall ((arg0@@37 Bool) (arg1@@38 T@U) (arg2@@30 Real) ) (! (= (type (|wand_5#sm| arg0@@37 arg1@@38 arg2@@30)) (FieldType WandType_wand_5Type (MapType1Type RefType boolType)))
 :qid |funType:wand_5#sm|
 :pattern ( (|wand_5#sm| arg0@@37 arg1@@38 arg2@@30))
)))
(assert (forall ((arg1@@39 Bool) (arg2@@31 T@U) (arg3@@19 Real) ) (!  (=> (= (type arg2@@31) RefType) (= (|wand_5#sm| arg1@@39 arg2@@31 arg3@@19) (WandMaskField (|wand_5#ft| arg1@@39 arg2@@31 arg3@@19))))
 :qid |stdinbpl.330:15|
 :skolemid |54|
 :pattern ( (WandMaskField (|wand_5#ft| arg1@@39 arg2@@31 arg3@@19)))
)))
(assert (forall ((Heap@@4 T@U) (ExhaleHeap@@1 T@U) (Mask@@2 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@4) (MapType0Type RefType)) (= (type ExhaleHeap@@1) (MapType0Type RefType))) (= (type Mask@@2) (MapType1Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@4 ExhaleHeap@@1 Mask@@2)) (U_2_bool (MapType0Select Heap@@4 o_1 $allocated))) (U_2_bool (MapType0Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.73:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@4 ExhaleHeap@@1 Mask@@2) (MapType0Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert (forall ((Heap@@5 T@U) (p_1@@0 T@U) ) (!  (=> (and (= (type Heap@@5) (MapType0Type RefType)) (= (type p_1@@0) RefType)) (and (= (sum Heap@@5 p_1@@0) (|sum'| Heap@@5 p_1@@0)) (dummyFunction (int_2_U (|sum#triggerStateless| p_1@@0)))))
 :qid |stdinbpl.396:15|
 :skolemid |64|
 :pattern ( (sum Heap@@5 p_1@@0))
)))
(assert (forall ((this@@1 T@U) (this2 T@U) ) (!  (=> (and (and (= (type this@@1) RefType) (= (type this2) RefType)) (= (Pair this@@1) (Pair this2))) (= this@@1 this2))
 :qid |stdinbpl.505:15|
 :skolemid |71|
 :pattern ( (Pair this@@1) (Pair this2))
)))
(assert (forall ((arg0@@38 T@U) ) (! (= (type (|Pair#sm| arg0@@38)) (FieldType PredicateType_PairType (MapType1Type RefType boolType)))
 :qid |funType:Pair#sm|
 :pattern ( (|Pair#sm| arg0@@38))
)))
(assert (forall ((this@@2 T@U) (this2@@0 T@U) ) (!  (=> (and (and (= (type this@@2) RefType) (= (type this2@@0) RefType)) (= (|Pair#sm| this@@2) (|Pair#sm| this2@@0))) (= this@@2 this2@@0))
 :qid |stdinbpl.509:15|
 :skolemid |72|
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
(assert (forall ((p T@U) (v_1 T@U) (w T@U) ) (! (let ((A@@2 (FieldTypeInv0 (type p))))
 (=> (and (and (= (type p) (FieldType A@@2 FrameTypeType)) (= (type v_1) FrameTypeType)) (= (type w) FrameTypeType)) (not (InsidePredicate p v_1 p w))))
 :qid |stdinbpl.173:19|
 :skolemid |21|
 :pattern ( (InsidePredicate p v_1 p w))
)))
(assert  (not (IsPredicateField f_7)))
(assert  (not (IsWandField f_7)))
(assert  (not (IsPredicateField g)))
(assert  (not (IsWandField g)))
(assert  (not (IsPredicateField h)))
(assert  (not (IsWandField h)))
(assert (forall ((Heap@@7 T@U) (ExhaleHeap@@3 T@U) (Mask@@4 T@U) ) (!  (=> (and (and (and (= (type Heap@@7) (MapType0Type RefType)) (= (type ExhaleHeap@@3) (MapType0Type RefType))) (= (type Mask@@4) (MapType1Type RefType realType))) (IdenticalOnKnownLocations Heap@@7 ExhaleHeap@@3 Mask@@4)) (succHeap Heap@@7 ExhaleHeap@@3))
 :qid |stdinbpl.83:15|
 :skolemid |10|
 :pattern ( (IdenticalOnKnownLocations Heap@@7 ExhaleHeap@@3 Mask@@4))
)))
(assert (forall ((Heap@@8 T@U) (Mask@@5 T@U) (p_1@@1 T@U) ) (!  (=> (and (and (and (= (type Heap@@8) (MapType0Type RefType)) (= (type Mask@@5) (MapType1Type RefType realType))) (= (type p_1@@1) RefType)) (and (state Heap@@8 Mask@@5) (< AssumeFunctionsAbove 0))) (= (sum Heap@@8 p_1@@1) (+ (U_2_int (MapType0Select Heap@@8 p_1@@1 f_7)) (U_2_int (MapType0Select Heap@@8 p_1@@1 g)))))
 :qid |stdinbpl.406:15|
 :skolemid |66|
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
(assert (forall ((arg1@@40 T@U) (arg2@@32 Real) (arg3@@20 T@U) (arg4@@4 Real) ) (!  (=> (and (= (type arg1@@40) RefType) (= (type arg3@@20) RefType)) (IsWandField (wand arg1@@40 arg2@@32 arg3@@20 arg4@@4)))
 :qid |stdinbpl.186:15|
 :skolemid |22|
 :pattern ( (wand arg1@@40 arg2@@32 arg3@@20 arg4@@4))
)))
(assert (forall ((arg0@@39 T@U) (arg1@@41 Real) (arg2@@33 T@U) (arg3@@21 Real) ) (! (= (type (|wand#ft| arg0@@39 arg1@@41 arg2@@33 arg3@@21)) (FieldType WandType_wandType FrameTypeType))
 :qid |funType:wand#ft|
 :pattern ( (|wand#ft| arg0@@39 arg1@@41 arg2@@33 arg3@@21))
)))
(assert (forall ((arg1@@42 T@U) (arg2@@34 Real) (arg3@@22 T@U) (arg4@@5 Real) ) (!  (=> (and (= (type arg1@@42) RefType) (= (type arg3@@22) RefType)) (IsWandField (|wand#ft| arg1@@42 arg2@@34 arg3@@22 arg4@@5)))
 :qid |stdinbpl.190:15|
 :skolemid |23|
 :pattern ( (|wand#ft| arg1@@42 arg2@@34 arg3@@22 arg4@@5))
)))
(assert (forall ((arg1@@43 T@U) (arg2@@35 Real) (arg3@@23 T@U) (arg4@@6 Real) ) (!  (=> (and (= (type arg1@@43) RefType) (= (type arg3@@23) RefType)) (IsWandField (wand_2 arg1@@43 arg2@@35 arg3@@23 arg4@@6)))
 :qid |stdinbpl.218:15|
 :skolemid |29|
 :pattern ( (wand_2 arg1@@43 arg2@@35 arg3@@23 arg4@@6))
)))
(assert (forall ((arg0@@40 T@U) (arg1@@44 Real) (arg2@@36 T@U) (arg3@@24 Real) ) (! (= (type (|wand_2#ft| arg0@@40 arg1@@44 arg2@@36 arg3@@24)) (FieldType WandType_wand_2Type FrameTypeType))
 :qid |funType:wand_2#ft|
 :pattern ( (|wand_2#ft| arg0@@40 arg1@@44 arg2@@36 arg3@@24))
)))
(assert (forall ((arg1@@45 T@U) (arg2@@37 Real) (arg3@@25 T@U) (arg4@@7 Real) ) (!  (=> (and (= (type arg1@@45) RefType) (= (type arg3@@25) RefType)) (IsWandField (|wand_2#ft| arg1@@45 arg2@@37 arg3@@25 arg4@@7)))
 :qid |stdinbpl.222:15|
 :skolemid |30|
 :pattern ( (|wand_2#ft| arg1@@45 arg2@@37 arg3@@25 arg4@@7))
)))
(assert (forall ((arg0@@41 T@U) (arg1@@46 Real) (arg2@@38 T@U) (arg3@@26 Real) (arg4@@8 T@U) (arg5@@2 Int) ) (! (= (type (wand_4 arg0@@41 arg1@@46 arg2@@38 arg3@@26 arg4@@8 arg5@@2)) (FieldType WandType_wand_4Type intType))
 :qid |funType:wand_4|
 :pattern ( (wand_4 arg0@@41 arg1@@46 arg2@@38 arg3@@26 arg4@@8 arg5@@2))
)))
(assert (forall ((arg1@@47 T@U) (arg2@@39 Real) (arg3@@27 T@U) (arg4@@9 Real) (arg5@@3 T@U) (arg6@@0 Int) (arg1_2 T@U) (arg2_2 Real) (arg3_2 T@U) (arg4_2 Real) (arg5_2 T@U) (arg6_2 Int) ) (!  (=> (and (and (and (and (and (and (= (type arg1@@47) RefType) (= (type arg3@@27) RefType)) (= (type arg5@@3) RefType)) (= (type arg1_2) RefType)) (= (type arg3_2) RefType)) (= (type arg5_2) RefType)) (= (wand_4 arg1@@47 arg2@@39 arg3@@27 arg4@@9 arg5@@3 arg6@@0) (wand_4 arg1_2 arg2_2 arg3_2 arg4_2 arg5_2 arg6_2))) (and (= arg1@@47 arg1_2) (and (= arg2@@39 arg2_2) (and (= arg3@@27 arg3_2) (and (= arg4@@9 arg4_2) (and (= arg5@@3 arg5_2) (= arg6@@0 arg6_2)))))))
 :qid |stdinbpl.274:15|
 :skolemid |42|
 :pattern ( (wand_4 arg1@@47 arg2@@39 arg3@@27 arg4@@9 arg5@@3 arg6@@0) (wand_4 arg1_2 arg2_2 arg3_2 arg4_2 arg5_2 arg6_2))
)))
(assert  (and (forall ((arg0@@42 Real) (arg1@@48 T@U) ) (! (= (type (ConditionalFrame arg0@@42 arg1@@48)) FrameTypeType)
 :qid |funType:ConditionalFrame|
 :pattern ( (ConditionalFrame arg0@@42 arg1@@48))
)) (= (type EmptyFrame) FrameTypeType)))
(assert (forall ((p@@0 Real) (f_6 T@U) ) (!  (=> (= (type f_6) FrameTypeType) (= (ConditionalFrame p@@0 f_6) (ite (> p@@0 0.0) f_6 EmptyFrame)))
 :qid |stdinbpl.161:15|
 :skolemid |19|
 :pattern ( (ConditionalFrame p@@0 f_6))
)))
(assert (forall ((arg1@@49 T@U) (arg2@@40 Real) (arg3@@28 T@U) (arg4@@10 Real) ) (!  (=> (and (= (type arg1@@49) RefType) (= (type arg3@@28) RefType)) (not (IsPredicateField (wand arg1@@49 arg2@@40 arg3@@28 arg4@@10))))
 :qid |stdinbpl.194:15|
 :skolemid |24|
 :pattern ( (wand arg1@@49 arg2@@40 arg3@@28 arg4@@10))
)))
(assert (forall ((arg1@@50 T@U) (arg2@@41 Real) (arg3@@29 T@U) (arg4@@11 Real) ) (!  (=> (and (= (type arg1@@50) RefType) (= (type arg3@@29) RefType)) (not (IsPredicateField (|wand#ft| arg1@@50 arg2@@41 arg3@@29 arg4@@11))))
 :qid |stdinbpl.198:15|
 :skolemid |25|
 :pattern ( (|wand#ft| arg1@@50 arg2@@41 arg3@@29 arg4@@11))
)))
(assert (forall ((arg1@@51 T@U) (arg2@@42 Real) (arg3@@30 T@U) (arg4@@12 Real) ) (!  (=> (and (= (type arg1@@51) RefType) (= (type arg3@@30) RefType)) (not (IsPredicateField (wand_2 arg1@@51 arg2@@42 arg3@@30 arg4@@12))))
 :qid |stdinbpl.226:15|
 :skolemid |31|
 :pattern ( (wand_2 arg1@@51 arg2@@42 arg3@@30 arg4@@12))
)))
(assert (forall ((arg1@@52 T@U) (arg2@@43 Real) (arg3@@31 T@U) (arg4@@13 Real) ) (!  (=> (and (= (type arg1@@52) RefType) (= (type arg3@@31) RefType)) (not (IsPredicateField (|wand_2#ft| arg1@@52 arg2@@43 arg3@@31 arg4@@13))))
 :qid |stdinbpl.230:15|
 :skolemid |32|
 :pattern ( (|wand_2#ft| arg1@@52 arg2@@43 arg3@@31 arg4@@13))
)))
(assert (forall ((Mask@@6 T@U) (o_2@@0 T@U) (f_4@@0 T@U) ) (! (let ((B@@3 (FieldTypeInv1 (type f_4@@0))))
(let ((A@@4 (FieldTypeInv0 (type f_4@@0))))
 (=> (and (and (= (type Mask@@6) (MapType1Type RefType realType)) (= (type o_2@@0) RefType)) (= (type f_4@@0) (FieldType A@@4 B@@3))) (= (HasDirectPerm Mask@@6 o_2@@0 f_4@@0) (> (U_2_real (MapType1Select Mask@@6 o_2@@0 f_4@@0)) NoPerm)))))
 :qid |stdinbpl.133:22|
 :skolemid |17|
 :pattern ( (HasDirectPerm Mask@@6 o_2@@0 f_4@@0))
)))
(assert (forall ((arg0@@43 T@U) (arg1@@53 Real) (arg2@@44 T@U) (arg3@@32 Real) ) (! (= (type (|wand#sm| arg0@@43 arg1@@53 arg2@@44 arg3@@32)) (FieldType WandType_wandType (MapType1Type RefType boolType)))
 :qid |funType:wand#sm|
 :pattern ( (|wand#sm| arg0@@43 arg1@@53 arg2@@44 arg3@@32))
)))
(assert (forall ((arg1@@54 T@U) (arg2@@45 Real) (arg3@@33 T@U) (arg4@@14 Real) ) (!  (=> (and (= (type arg1@@54) RefType) (= (type arg3@@33) RefType)) (= (|wand#sm| arg1@@54 arg2@@45 arg3@@33 arg4@@14) (WandMaskField (|wand#ft| arg1@@54 arg2@@45 arg3@@33 arg4@@14))))
 :qid |stdinbpl.202:15|
 :skolemid |26|
 :pattern ( (WandMaskField (|wand#ft| arg1@@54 arg2@@45 arg3@@33 arg4@@14)))
)))
(assert (forall ((arg0@@44 T@U) (arg1@@55 Real) (arg2@@46 T@U) (arg3@@34 Real) ) (! (= (type (|wand_2#sm| arg0@@44 arg1@@55 arg2@@46 arg3@@34)) (FieldType WandType_wand_2Type (MapType1Type RefType boolType)))
 :qid |funType:wand_2#sm|
 :pattern ( (|wand_2#sm| arg0@@44 arg1@@55 arg2@@46 arg3@@34))
)))
(assert (forall ((arg1@@56 T@U) (arg2@@47 Real) (arg3@@35 T@U) (arg4@@15 Real) ) (!  (=> (and (= (type arg1@@56) RefType) (= (type arg3@@35) RefType)) (= (|wand_2#sm| arg1@@56 arg2@@47 arg3@@35 arg4@@15) (WandMaskField (|wand_2#ft| arg1@@56 arg2@@47 arg3@@35 arg4@@15))))
 :qid |stdinbpl.234:15|
 :skolemid |33|
 :pattern ( (WandMaskField (|wand_2#ft| arg1@@56 arg2@@47 arg3@@35 arg4@@15)))
)))
(assert (forall ((arg1@@57 T@U) (arg2@@48 Real) (arg3@@36 T@U) (arg4@@16 Real) (arg5@@4 T@U) (arg6@@1 Int) ) (!  (=> (and (and (= (type arg1@@57) RefType) (= (type arg3@@36) RefType)) (= (type arg5@@4) RefType)) (= (getPredWandId (wand_4 arg1@@57 arg2@@48 arg3@@36 arg4@@16 arg5@@4 arg6@@1)) 3))
 :qid |stdinbpl.270:15|
 :skolemid |41|
 :pattern ( (wand_4 arg1@@57 arg2@@48 arg3@@36 arg4@@16 arg5@@4 arg6@@1))
)))
(assert (forall ((o_2@@1 T@U) (f_4@@1 T@U) ) (! (let ((B@@4 (FieldTypeInv1 (type f_4@@1))))
(let ((A@@5 (FieldTypeInv0 (type f_4@@1))))
 (=> (and (= (type o_2@@1) RefType) (= (type f_4@@1) (FieldType A@@5 B@@4))) (= (U_2_real (MapType1Select ZeroMask o_2@@1 f_4@@1)) NoPerm))))
 :qid |stdinbpl.106:22|
 :skolemid |13|
 :pattern ( (MapType1Select ZeroMask o_2@@1 f_4@@1))
)))
(assert (forall ((arg1@@58 T@U) (arg2@@49 Real) (arg3@@37 T@U) (arg4@@17 Real) (arg5@@5 T@U) (arg6@@2 Int) ) (!  (=> (and (and (= (type arg1@@58) RefType) (= (type arg3@@37) RefType)) (= (type arg5@@5) RefType)) (IsWandField (wand_4 arg1@@58 arg2@@49 arg3@@37 arg4@@17 arg5@@5 arg6@@2)))
 :qid |stdinbpl.250:15|
 :skolemid |36|
 :pattern ( (wand_4 arg1@@58 arg2@@49 arg3@@37 arg4@@17 arg5@@5 arg6@@2))
)))
(assert (forall ((arg1@@59 T@U) (arg2@@50 Real) (arg3@@38 T@U) (arg4@@18 Real) (arg5@@6 T@U) (arg6@@3 Int) ) (!  (=> (and (and (= (type arg1@@59) RefType) (= (type arg3@@38) RefType)) (= (type arg5@@6) RefType)) (IsWandField (|wand_4#ft| arg1@@59 arg2@@50 arg3@@38 arg4@@18 arg5@@6 arg6@@3)))
 :qid |stdinbpl.254:15|
 :skolemid |37|
 :pattern ( (|wand_4#ft| arg1@@59 arg2@@50 arg3@@38 arg4@@18 arg5@@6 arg6@@3))
)))
(assert (forall ((arg1@@60 T@U) (arg2@@51 Real) (arg3@@39 T@U) (arg4@@19 Real) (arg5@@7 T@U) (arg6@@4 Int) ) (!  (=> (and (and (= (type arg1@@60) RefType) (= (type arg3@@39) RefType)) (= (type arg5@@7) RefType)) (not (IsPredicateField (wand_4 arg1@@60 arg2@@51 arg3@@39 arg4@@19 arg5@@7 arg6@@4))))
 :qid |stdinbpl.258:15|
 :skolemid |38|
 :pattern ( (wand_4 arg1@@60 arg2@@51 arg3@@39 arg4@@19 arg5@@7 arg6@@4))
)))
(assert (forall ((arg1@@61 T@U) (arg2@@52 Real) (arg3@@40 T@U) (arg4@@20 Real) (arg5@@8 T@U) (arg6@@5 Int) ) (!  (=> (and (and (= (type arg1@@61) RefType) (= (type arg3@@40) RefType)) (= (type arg5@@8) RefType)) (not (IsPredicateField (|wand_4#ft| arg1@@61 arg2@@52 arg3@@40 arg4@@20 arg5@@8 arg6@@5))))
 :qid |stdinbpl.262:15|
 :skolemid |39|
 :pattern ( (|wand_4#ft| arg1@@61 arg2@@52 arg3@@40 arg4@@20 arg5@@8 arg6@@5))
)))
(assert (forall ((arg1@@62 Bool) (arg2@@53 Bool) (arg1_2@@0 Bool) (arg2_2@@0 Bool) ) (!  (=> (= (wand_1 arg1@@62 arg2@@53) (wand_1 arg1_2@@0 arg2_2@@0)) (and (= arg1@@62 arg1_2@@0) (= arg2@@53 arg2_2@@0)))
 :qid |stdinbpl.370:15|
 :skolemid |63|
 :pattern ( (wand_1 arg1@@62 arg2@@53) (wand_1 arg1_2@@0 arg2_2@@0))
)))
(assert (forall ((arg1@@63 Bool) (arg2@@54 T@U) (arg3@@41 Real) (arg1_2@@1 Bool) (arg2_2@@1 T@U) (arg3_2@@0 Real) ) (!  (=> (and (and (= (type arg2@@54) RefType) (= (type arg2_2@@1) RefType)) (= (wand_3 arg1@@63 arg2@@54 arg3@@41) (wand_3 arg1_2@@1 arg2_2@@1 arg3_2@@0))) (and (= arg1@@63 arg1_2@@1) (and (= arg2@@54 arg2_2@@1) (= arg3@@41 arg3_2@@0))))
 :qid |stdinbpl.306:15|
 :skolemid |49|
 :pattern ( (wand_3 arg1@@63 arg2@@54 arg3@@41) (wand_3 arg1_2@@1 arg2_2@@1 arg3_2@@0))
)))
(assert (forall ((arg1@@64 Bool) (arg2@@55 T@U) (arg3@@42 Real) (arg1_2@@2 Bool) (arg2_2@@2 T@U) (arg3_2@@1 Real) ) (!  (=> (and (and (= (type arg2@@55) RefType) (= (type arg2_2@@2) RefType)) (= (wand_5 arg1@@64 arg2@@55 arg3@@42) (wand_5 arg1_2@@2 arg2_2@@2 arg3_2@@1))) (and (= arg1@@64 arg1_2@@2) (and (= arg2@@55 arg2_2@@2) (= arg3@@42 arg3_2@@1))))
 :qid |stdinbpl.338:15|
 :skolemid |56|
 :pattern ( (wand_5 arg1@@64 arg2@@55 arg3@@42) (wand_5 arg1_2@@2 arg2_2@@2 arg3_2@@1))
)))
(assert (forall ((arg1@@65 Bool) (arg2@@56 Bool) ) (! (= (getPredWandId (wand_1 arg1@@65 arg2@@56)) 6)
 :qid |stdinbpl.366:15|
 :skolemid |62|
 :pattern ( (wand_1 arg1@@65 arg2@@56))
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
 :qid |stdinbpl.499:15|
 :skolemid |70|
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
 :qid |stdinbpl.413:15|
 :skolemid |67|
 :pattern ( (state Heap@@11 Mask@@10) (|sum'| Heap@@11 p_1@@2))
)))
(assert (forall ((o T@U) (f T@U) (Heap@@12 T@U) ) (!  (=> (and (and (and (= (type o) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap@@12) (MapType0Type RefType))) (U_2_bool (MapType0Select Heap@@12 o $allocated))) (U_2_bool (MapType0Select Heap@@12 (MapType0Select Heap@@12 o f) $allocated)))
 :qid |stdinbpl.31:15|
 :skolemid |0|
 :pattern ( (MapType0Select Heap@@12 o f))
)))
(assert (forall ((arg0@@45 Bool) (arg1@@66 Bool) ) (! (= (type (|wand_1#sm| arg0@@45 arg1@@66)) (FieldType WandType_wand_1Type (MapType1Type RefType boolType)))
 :qid |funType:wand_1#sm|
 :pattern ( (|wand_1#sm| arg0@@45 arg1@@66))
)))
(assert (forall ((arg1@@67 Bool) (arg2@@57 Bool) ) (! (= (|wand_1#sm| arg1@@67 arg2@@57) (WandMaskField (|wand_1#ft| arg1@@67 arg2@@57)))
 :qid |stdinbpl.362:15|
 :skolemid |61|
 :pattern ( (WandMaskField (|wand_1#ft| arg1@@67 arg2@@57)))
)))
(assert (forall ((this@@4 T@U) ) (!  (=> (= (type this@@4) RefType) (= (PredicateMaskField (Pair this@@4)) (|Pair#sm| this@@4)))
 :qid |stdinbpl.491:15|
 :skolemid |68|
 :pattern ( (PredicateMaskField (Pair this@@4)))
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
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
(assert (forall ((arg1@@68 T@U) (arg2@@58 Real) (arg3@@43 T@U) (arg4@@21 Real) (arg1_2@@3 T@U) (arg2_2@@3 Real) (arg3_2@@2 T@U) (arg4_2@@0 Real) ) (!  (=> (and (and (and (and (= (type arg1@@68) RefType) (= (type arg3@@43) RefType)) (= (type arg1_2@@3) RefType)) (= (type arg3_2@@2) RefType)) (= (wand arg1@@68 arg2@@58 arg3@@43 arg4@@21) (wand arg1_2@@3 arg2_2@@3 arg3_2@@2 arg4_2@@0))) (and (= arg1@@68 arg1_2@@3) (and (= arg2@@58 arg2_2@@3) (and (= arg3@@43 arg3_2@@2) (= arg4@@21 arg4_2@@0)))))
 :qid |stdinbpl.210:15|
 :skolemid |28|
 :pattern ( (wand arg1@@68 arg2@@58 arg3@@43 arg4@@21) (wand arg1_2@@3 arg2_2@@3 arg3_2@@2 arg4_2@@0))
)))
(assert (forall ((arg1@@69 T@U) (arg2@@59 Real) (arg3@@44 T@U) (arg4@@22 Real) (arg1_2@@4 T@U) (arg2_2@@4 Real) (arg3_2@@3 T@U) (arg4_2@@1 Real) ) (!  (=> (and (and (and (and (= (type arg1@@69) RefType) (= (type arg3@@44) RefType)) (= (type arg1_2@@4) RefType)) (= (type arg3_2@@3) RefType)) (= (wand_2 arg1@@69 arg2@@59 arg3@@44 arg4@@22) (wand_2 arg1_2@@4 arg2_2@@4 arg3_2@@3 arg4_2@@1))) (and (= arg1@@69 arg1_2@@4) (and (= arg2@@59 arg2_2@@4) (and (= arg3@@44 arg3_2@@3) (= arg4@@22 arg4_2@@1)))))
 :qid |stdinbpl.242:15|
 :skolemid |35|
 :pattern ( (wand_2 arg1@@69 arg2@@59 arg3@@44 arg4@@22) (wand_2 arg1_2@@4 arg2_2@@4 arg3_2@@3 arg4_2@@1))
)))
(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun Mask@15 () T@U)
(declare-fun p_1@@3 () T@U)
(declare-fun AssertMask@0 () T@U)
(declare-fun Heap@9 () T@U)
(declare-fun b_8@26 () Bool)
(declare-fun b_16@6 () Bool)
(declare-fun neededTransfer@19 () Real)
(declare-fun Used_8Mask@3 () T@U)
(declare-fun initNeededTransfer@4 () Real)
(declare-fun b_17@0 () Bool)
(declare-fun b_17@1 () Bool)
(declare-fun Result_6Heap () T@U)
(declare-fun Result_6Mask () T@U)
(declare-fun b_17@2 () Bool)
(declare-fun Ops_3Mask () T@U)
(declare-fun b_17@3 () Bool)
(declare-fun Ops_3Heap@7 () T@U)
(declare-fun Used_8Heap@0 () T@U)
(declare-fun b_17@4 () Bool)
(declare-fun b_8@27 () Bool)
(declare-fun Mask@14 () T@U)
(declare-fun takeTransfer@9 () Real)
(declare-fun Mask@12 () T@U)
(declare-fun Heap@7 () T@U)
(declare-fun neededTransfer@17 () Real)
(declare-fun b_16@3 () Bool)
(declare-fun Used_8Mask@1 () T@U)
(declare-fun neededTransfer@18 () Real)
(declare-fun Used_8Mask@2 () T@U)
(declare-fun b_16@4 () Bool)
(declare-fun TempMask@1 () T@U)
(declare-fun b_16@5 () Bool)
(declare-fun Mask@13 () T@U)
(declare-fun newPMask@0 () T@U)
(declare-fun Heap@8 () T@U)
(declare-fun maskTransfer@9 () Real)
(declare-fun takeTransfer@8 () Real)
(declare-fun b_16@0 () Bool)
(declare-fun neededTransfer@16 () Real)
(declare-fun Used_8Mask@0 () T@U)
(declare-fun b_16@1 () Bool)
(declare-fun TempMask@0 () T@U)
(declare-fun b_16@2 () Bool)
(declare-fun Ops_3Mask@12 () T@U)
(declare-fun Ops_3Mask@11 () T@U)
(declare-fun maskTransfer@8 () Real)
(declare-fun b_16 () Bool)
(declare-fun Ops_3Heap@5 () T@U)
(declare-fun Ops_3Heap@4 () T@U)
(declare-fun Ops_3Heap@6 () T@U)
(declare-fun Ops_3Mask@10 () T@U)
(declare-fun b_8@25 () Bool)
(declare-fun b_8@24 () Bool)
(declare-fun Heap@6 () T@U)
(declare-fun Mask@11 () T@U)
(declare-fun Ops_3Heap@1 () T@U)
(declare-fun Ops_3Heap@2 () T@U)
(declare-fun Ops_3Heap@3 () T@U)
(declare-fun freshVersion@0 () T@U)
(declare-fun b_8@19 () Bool)
(declare-fun b_13@12 () Bool)
(declare-fun neededTransfer@15 () Real)
(declare-fun Used_7Mask@7 () T@U)
(declare-fun initNeededTransfer@3 () Real)
(declare-fun b_15@0 () Bool)
(declare-fun b_15@1 () Bool)
(declare-fun Result_5Heap () T@U)
(declare-fun Result_5Mask () T@U)
(declare-fun b_15@2 () Bool)
(declare-fun Ops_3Mask@9 () T@U)
(declare-fun b_15@3 () Bool)
(declare-fun Used_7Heap@0 () T@U)
(declare-fun b_15@4 () Bool)
(declare-fun b_8@20 () Bool)
(declare-fun b_8@21 () Bool)
(declare-fun b_8@22 () Bool)
(declare-fun b_8@23 () Bool)
(declare-fun CombineFrames (T@U T@U) T@U)
(declare-fun FrameFragment (T@U) T@U)
(declare-fun takeTransfer@7 () Real)
(declare-fun neededTransfer@13 () Real)
(declare-fun Mask@9 () T@U)
(declare-fun b_13@9 () Bool)
(declare-fun Heap@4 () T@U)
(declare-fun Used_7Mask@5 () T@U)
(declare-fun neededTransfer@14 () Real)
(declare-fun Used_7Mask@6 () T@U)
(declare-fun b_13@10 () Bool)
(declare-fun b_13@11 () Bool)
(declare-fun Mask@10 () T@U)
(declare-fun Heap@5 () T@U)
(declare-fun maskTransfer@7 () Real)
(declare-fun takeTransfer@6 () Real)
(declare-fun Used_7Mask@3 () T@U)
(declare-fun b_13@6 () Bool)
(declare-fun Ops_3Mask@7 () T@U)
(declare-fun neededTransfer@12 () Real)
(declare-fun Used_7Mask@4 () T@U)
(declare-fun b_13@7 () Bool)
(declare-fun b_13@8 () Bool)
(declare-fun Ops_3Mask@8 () T@U)
(declare-fun maskTransfer@6 () Real)
(declare-fun b_8@16 () Bool)
(declare-fun neededTransfer@11 () Real)
(declare-fun initNeededTransfer@2 () Real)
(declare-fun b_14@0 () Bool)
(declare-fun b_14@1 () Bool)
(declare-fun Result_4Heap () T@U)
(declare-fun Result_4Mask () T@U)
(declare-fun b_14@2 () Bool)
(declare-fun b_14@3 () Bool)
(declare-fun b_14@4 () Bool)
(declare-fun b_8@17 () Bool)
(declare-fun b_8@18 () Bool)
(declare-fun takeTransfer@5 () Real)
(declare-fun Heap@2 () T@U)
(declare-fun neededTransfer@9 () Real)
(declare-fun Mask@7 () T@U)
(declare-fun b_13@3 () Bool)
(declare-fun Used_7Mask@1 () T@U)
(declare-fun neededTransfer@10 () Real)
(declare-fun Used_7Mask@2 () T@U)
(declare-fun b_13@4 () Bool)
(declare-fun b_13@5 () Bool)
(declare-fun Mask@8 () T@U)
(declare-fun Heap@3 () T@U)
(declare-fun maskTransfer@5 () Real)
(declare-fun takeTransfer@4 () Real)
(declare-fun Ops_3Mask@5 () T@U)
(declare-fun b_13@0 () Bool)
(declare-fun neededTransfer@8 () Real)
(declare-fun Used_7Mask@0 () T@U)
(declare-fun b_13@1 () Bool)
(declare-fun b_13@2 () Bool)
(declare-fun Ops_3Mask@6 () T@U)
(declare-fun maskTransfer@4 () Real)
(declare-fun b_13 () Bool)
(declare-fun b_8@6 () Bool)
(declare-fun b_11@6 () Bool)
(declare-fun neededTransfer@7 () Real)
(declare-fun Used_6Mask@3 () T@U)
(declare-fun initNeededTransfer@1 () Real)
(declare-fun b_12@0 () Bool)
(declare-fun b_12@1 () Bool)
(declare-fun Result_3Heap () T@U)
(declare-fun Result_3Mask () T@U)
(declare-fun b_12@2 () Bool)
(declare-fun Ops_3Mask@3 () T@U)
(declare-fun b_12@3 () Bool)
(declare-fun Ops_3Heap@0 () T@U)
(declare-fun Used_6Heap@0 () T@U)
(declare-fun b_12@4 () Bool)
(declare-fun b_8@7 () Bool)
(declare-fun b_8@8 () Bool)
(declare-fun b_8@9 () Bool)
(declare-fun b_8@10 () Bool)
(declare-fun b_8@11 () Bool)
(declare-fun Ops_3Mask@4 () T@U)
(declare-fun b_8@12 () Bool)
(declare-fun b_8@13 () Bool)
(declare-fun ExhaleHeap@0 () T@U)
(declare-fun b_8@14 () Bool)
(declare-fun b_8@15 () Bool)
(declare-fun Mask@6 () T@U)
(declare-fun Heap@1 () T@U)
(declare-fun takeTransfer@3 () Real)
(declare-fun b_11@3 () Bool)
(declare-fun Mask@4 () T@U)
(declare-fun Used_6Mask@1 () T@U)
(declare-fun neededTransfer@5 () Real)
(declare-fun Heap@@14 () T@U)
(declare-fun neededTransfer@6 () Real)
(declare-fun Used_6Mask@2 () T@U)
(declare-fun b_11@4 () Bool)
(declare-fun b_11@5 () Bool)
(declare-fun Mask@5 () T@U)
(declare-fun Heap@0 () T@U)
(declare-fun maskTransfer@3 () Real)
(declare-fun takeTransfer@2 () Real)
(declare-fun Ops_3Mask@1 () T@U)
(declare-fun b_11@0 () Bool)
(declare-fun neededTransfer@4 () Real)
(declare-fun Used_6Mask@0 () T@U)
(declare-fun b_11@1 () Bool)
(declare-fun b_11@2 () Bool)
(declare-fun Ops_3Mask@2 () T@U)
(declare-fun maskTransfer@2 () Real)
(declare-fun b_8@2 () Bool)
(declare-fun b_9@4 () Bool)
(declare-fun neededTransfer@3 () Real)
(declare-fun Used_5Mask@3 () T@U)
(declare-fun initNeededTransfer@0 () Real)
(declare-fun b_10@0 () Bool)
(declare-fun b_10@1 () Bool)
(declare-fun Result_2Heap () T@U)
(declare-fun Result_2Mask () T@U)
(declare-fun b_10@2 () Bool)
(declare-fun b_10@3 () Bool)
(declare-fun Used_5Heap@0 () T@U)
(declare-fun b_10@4 () Bool)
(declare-fun b_8@3 () Bool)
(declare-fun b_8@4 () Bool)
(declare-fun b_8@5 () Bool)
(declare-fun b_11 () Bool)
(declare-fun takeTransfer@1 () Real)
(declare-fun Mask@2 () T@U)
(declare-fun neededTransfer@1 () Real)
(declare-fun b_9@2 () Bool)
(declare-fun Used_5Mask@1 () T@U)
(declare-fun neededTransfer@2 () Real)
(declare-fun Used_5Mask@2 () T@U)
(declare-fun b_9@3 () Bool)
(declare-fun Mask@3 () T@U)
(declare-fun maskTransfer@1 () Real)
(declare-fun takeTransfer@0 () Real)
(declare-fun b_9@0 () Bool)
(declare-fun neededTransfer@0 () Real)
(declare-fun Used_5Mask@0 () T@U)
(declare-fun b_9@1 () Bool)
(declare-fun Ops_3Mask@0 () T@U)
(declare-fun maskTransfer@0 () Real)
(declare-fun b_9 () Bool)
(declare-fun b_8@1 () Bool)
(declare-fun b_8@0 () Bool)
(declare-fun Mask@1 () T@U)
(declare-fun b_8 () Bool)
(declare-fun b_7@0 () Bool)
(declare-fun b_7 () Bool)
(declare-fun Used_4Heap@0 () T@U)
(declare-fun Mask@0 () T@U)
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (= (type Mask@15) (MapType1Type RefType realType)) (= (type p_1@@3) RefType)) (= (type AssertMask@0) (MapType1Type RefType realType))) (= (type Heap@9) (MapType0Type RefType))) (= (type Used_8Mask@3) (MapType1Type RefType realType))) (= (type Result_6Heap) (MapType0Type RefType))) (= (type Result_6Mask) (MapType1Type RefType realType))) (= (type Ops_3Mask) (MapType1Type RefType realType))) (= (type Ops_3Heap@7) (MapType0Type RefType))) (= (type Used_8Heap@0) (MapType0Type RefType))) (= (type Mask@14) (MapType1Type RefType realType))) (= (type Mask@12) (MapType1Type RefType realType))) (= (type Heap@7) (MapType0Type RefType))) (= (type Used_8Mask@1) (MapType1Type RefType realType))) (= (type Used_8Mask@2) (MapType1Type RefType realType))) (= (type TempMask@1) (MapType1Type RefType realType))) (= (type Mask@13) (MapType1Type RefType realType))) (= (type newPMask@0) (MapType1Type RefType boolType))) (= (type Heap@8) (MapType0Type RefType))) (= (type Used_8Mask@0) (MapType1Type RefType realType))) (= (type TempMask@0) (MapType1Type RefType realType))) (= (type Ops_3Mask@12) (MapType1Type RefType realType))) (= (type Ops_3Mask@11) (MapType1Type RefType realType))) (= (type Ops_3Mask@5) (MapType1Type RefType realType))) (= (type Ops_3Heap@1) (MapType0Type RefType))) (= (type Heap@2) (MapType0Type RefType))) (= (type Mask@7) (MapType1Type RefType realType))) (= (type Ops_3Heap@5) (MapType0Type RefType))) (= (type Ops_3Heap@4) (MapType0Type RefType))) (= (type Ops_3Heap@6) (MapType0Type RefType))) (= (type Ops_3Mask@10) (MapType1Type RefType realType))) (= (type Heap@6) (MapType0Type RefType))) (= (type Mask@11) (MapType1Type RefType realType))) (= (type Ops_3Heap@2) (MapType0Type RefType))) (= (type Ops_3Heap@3) (MapType0Type RefType))) (= (type freshVersion@0) FrameTypeType)) (= (type Used_7Mask@7) (MapType1Type RefType realType))) (= (type Result_5Heap) (MapType0Type RefType))) (= (type Result_5Mask) (MapType1Type RefType realType))) (= (type Ops_3Mask@9) (MapType1Type RefType realType))) (= (type Used_7Heap@0) (MapType0Type RefType))) (forall ((arg0@@46 T@U) (arg1@@70 T@U) ) (! (= (type (CombineFrames arg0@@46 arg1@@70)) FrameTypeType)
 :qid |funType:CombineFrames|
 :pattern ( (CombineFrames arg0@@46 arg1@@70))
))) (forall ((arg0@@47 T@U) ) (! (= (type (FrameFragment arg0@@47)) FrameTypeType)
 :qid |funType:FrameFragment|
 :pattern ( (FrameFragment arg0@@47))
))) (= (type Mask@9) (MapType1Type RefType realType))) (= (type Heap@4) (MapType0Type RefType))) (= (type Used_7Mask@5) (MapType1Type RefType realType))) (= (type Used_7Mask@6) (MapType1Type RefType realType))) (= (type Mask@10) (MapType1Type RefType realType))) (= (type Heap@5) (MapType0Type RefType))) (= (type Used_7Mask@3) (MapType1Type RefType realType))) (= (type Ops_3Mask@7) (MapType1Type RefType realType))) (= (type Used_7Mask@4) (MapType1Type RefType realType))) (= (type Ops_3Mask@8) (MapType1Type RefType realType))) (= (type Result_4Heap) (MapType0Type RefType))) (= (type Result_4Mask) (MapType1Type RefType realType))) (= (type Used_7Mask@1) (MapType1Type RefType realType))) (= (type Used_7Mask@2) (MapType1Type RefType realType))) (= (type Mask@8) (MapType1Type RefType realType))) (= (type Heap@3) (MapType0Type RefType))) (= (type Used_7Mask@0) (MapType1Type RefType realType))) (= (type Ops_3Mask@6) (MapType1Type RefType realType))) (= (type Ops_3Heap@0) (MapType0Type RefType))) (= (type Mask@2) (MapType1Type RefType realType))) (= (type Heap@@14) (MapType0Type RefType))) (= (type Used_6Mask@3) (MapType1Type RefType realType))) (= (type Result_3Heap) (MapType0Type RefType))) (= (type Result_3Mask) (MapType1Type RefType realType))) (= (type Ops_3Mask@3) (MapType1Type RefType realType))) (= (type Used_6Heap@0) (MapType0Type RefType))) (= (type Ops_3Mask@4) (MapType1Type RefType realType))) (= (type ExhaleHeap@0) (MapType0Type RefType))) (= (type Mask@6) (MapType1Type RefType realType))) (= (type Heap@1) (MapType0Type RefType))) (= (type Mask@4) (MapType1Type RefType realType))) (= (type Used_6Mask@1) (MapType1Type RefType realType))) (= (type Used_6Mask@2) (MapType1Type RefType realType))) (= (type Mask@5) (MapType1Type RefType realType))) (= (type Heap@0) (MapType0Type RefType))) (= (type Ops_3Mask@1) (MapType1Type RefType realType))) (= (type Used_6Mask@0) (MapType1Type RefType realType))) (= (type Ops_3Mask@2) (MapType1Type RefType realType))) (= (type Used_5Mask@3) (MapType1Type RefType realType))) (= (type Result_2Heap) (MapType0Type RefType))) (= (type Result_2Mask) (MapType1Type RefType realType))) (= (type Used_5Heap@0) (MapType0Type RefType))) (= (type Used_5Mask@1) (MapType1Type RefType realType))) (= (type Used_5Mask@2) (MapType1Type RefType realType))) (= (type Mask@3) (MapType1Type RefType realType))) (= (type Used_5Mask@0) (MapType1Type RefType realType))) (= (type Ops_3Mask@0) (MapType1Type RefType realType))) (= (type Mask@1) (MapType1Type RefType realType))) (= (type Used_4Heap@0) (MapType0Type RefType))) (= (type Mask@0) (MapType1Type RefType realType))))
(set-info :boogie-vc-id test01)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 103) (let ((anon84_Then_correct true))
(let ((anon78_correct true))
(let ((anon118_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 6) 3)) anon78_correct)))
(let ((anon118_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 4) (- 0 5)) (<= FullPerm (U_2_real (MapType1Select Mask@15 p_1@@3 f_7)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@15 p_1@@3 f_7))) (=> (= (ControlFlow 0 4) 3) anon78_correct))))))
(let ((anon117_Else_correct  (and (=> (= (ControlFlow 0 7) (- 0 8)) (<= FullPerm (U_2_real (MapType1Select Mask@15 null (wand_3 true p_1@@3 FullPerm))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@15 null (wand_3 true p_1@@3 FullPerm)))) (=> (and (= AssertMask@0 (MapType1Store Mask@15 null (wand_3 true p_1@@3 FullPerm) (real_2_U (- (U_2_real (MapType1Select Mask@15 null (wand_3 true p_1@@3 FullPerm))) FullPerm)))) (state Heap@9 Mask@15)) (and (=> (= (ControlFlow 0 7) 4) anon118_Then_correct) (=> (= (ControlFlow 0 7) 6) anon118_Else_correct)))))))
(let ((anon117_Then_correct true))
(let ((anon74_correct  (and (=> (= (ControlFlow 0 9) (- 0 10)) (=> (and (and b_8@26 b_8@26) b_16@6) (and (= neededTransfer@19 0.0) (= (U_2_real (MapType1Select Used_8Mask@3 null (Pair p_1@@3))) initNeededTransfer@4)))) (=> (=> (and (and b_8@26 b_8@26) b_16@6) (and (= neededTransfer@19 0.0) (= (U_2_real (MapType1Select Used_8Mask@3 null (Pair p_1@@3))) initNeededTransfer@4))) (=> (and (= b_17@0  (and b_8@26 b_16@6)) (= b_17@1  (and b_17@0 (state Result_6Heap Result_6Mask)))) (=> (and (and (and (= b_17@2  (and b_17@1 (sumMask Result_6Mask Ops_3Mask Used_8Mask@3))) (= b_17@3  (and (and b_17@2 (IdenticalOnKnownLocations Ops_3Heap@7 Result_6Heap Ops_3Mask)) (IdenticalOnKnownLocations Used_8Heap@0 Result_6Heap Used_8Mask@3)))) (and (= b_17@4  (and b_17@3 (state Result_6Heap Result_6Mask))) (= b_8@27  (and b_8@26 b_17@4)))) (and (and (= Mask@15 (MapType1Store Mask@14 null (wand_3 true p_1@@3 FullPerm) (real_2_U (+ (U_2_real (MapType1Select Mask@14 null (wand_3 true p_1@@3 FullPerm))) FullPerm)))) (state Heap@9 Mask@15)) (and (state Heap@9 Mask@15) (state Heap@9 Mask@15)))) (and (=> (= (ControlFlow 0 9) 2) anon117_Then_correct) (=> (= (ControlFlow 0 9) 7) anon117_Else_correct))))))))
(let ((anon116_Else_correct  (=> (>= 0.0 takeTransfer@9) (=> (and (= Mask@14 Mask@12) (= Heap@9 Heap@7)) (=> (and (and (= neededTransfer@19 neededTransfer@17) (= b_16@6 b_16@3)) (and (= Used_8Mask@3 Used_8Mask@1) (= (ControlFlow 0 13) 9))) anon74_correct)))))
(let ((anon116_Then_correct  (=> (> takeTransfer@9 0.0) (=> (and (= neededTransfer@18 (- neededTransfer@17 takeTransfer@9)) (= Used_8Mask@2 (MapType1Store Used_8Mask@1 null (Pair p_1@@3) (real_2_U (+ (U_2_real (MapType1Select Used_8Mask@1 null (Pair p_1@@3))) takeTransfer@9))))) (=> (and (and (= b_16@4  (and b_16@3 (state Used_8Heap@0 Used_8Mask@2))) (= TempMask@1 (MapType1Store ZeroMask null (Pair p_1@@3) (real_2_U FullPerm)))) (and (= b_16@5  (and b_16@4 (IdenticalOnKnownLocations Heap@7 Used_8Heap@0 TempMask@1))) (= Mask@13 (MapType1Store Mask@12 null (Pair p_1@@3) (real_2_U (- (U_2_real (MapType1Select Mask@12 null (Pair p_1@@3))) takeTransfer@9)))))) (=> (and (and (and (forall ((o_3 T@U) (f_8 T@U) ) (! (let ((B@@11 (FieldTypeInv1 (type f_8))))
(let ((A@@12 (FieldTypeInv0 (type f_8))))
 (=> (and (and (= (type o_3) RefType) (= (type f_8) (FieldType A@@12 B@@11))) (or (U_2_bool (MapType1Select (MapType0Select Heap@7 null (|wand_3#sm| true p_1@@3 FullPerm)) o_3 f_8)) (U_2_bool (MapType1Select (MapType0Select Heap@7 null (|Pair#sm| p_1@@3)) o_3 f_8)))) (U_2_bool (MapType1Select newPMask@0 o_3 f_8)))))
 :qid |stdinbpl.1421:35|
 :skolemid |74|
 :pattern ( (MapType1Select newPMask@0 o_3 f_8))
)) (= Heap@8 (MapType0Store Heap@7 null (|wand_3#sm| true p_1@@3 FullPerm) newPMask@0))) (and (= Mask@14 Mask@13) (= Heap@9 Heap@8))) (and (and (= neededTransfer@19 neededTransfer@18) (= b_16@6 b_16@5)) (and (= Used_8Mask@3 Used_8Mask@2) (= (ControlFlow 0 12) 9)))) anon74_correct))))))
(let ((anon115_Else_correct  (=> (and (< maskTransfer@9 neededTransfer@17) (= takeTransfer@9 maskTransfer@9)) (and (=> (= (ControlFlow 0 15) 12) anon116_Then_correct) (=> (= (ControlFlow 0 15) 13) anon116_Else_correct)))))
(let ((anon115_Then_correct  (=> (and (<= neededTransfer@17 maskTransfer@9) (= takeTransfer@9 neededTransfer@17)) (and (=> (= (ControlFlow 0 14) 12) anon116_Then_correct) (=> (= (ControlFlow 0 14) 13) anon116_Else_correct)))))
(let ((anon114_Then_correct  (=> (and (and (and (and (and b_8@26 b_8@26) b_16@3) true) (> neededTransfer@17 0.0)) (= maskTransfer@9 (U_2_real (MapType1Select Mask@12 null (Pair p_1@@3))))) (and (=> (= (ControlFlow 0 16) 14) anon115_Then_correct) (=> (= (ControlFlow 0 16) 15) anon115_Else_correct)))))
(let ((anon114_Else_correct  (=> (not (and (and (and (and b_8@26 b_8@26) b_16@3) true) (> neededTransfer@17 0.0))) (=> (and (= Mask@14 Mask@12) (= Heap@9 Heap@7)) (=> (and (and (= neededTransfer@19 neededTransfer@17) (= b_16@6 b_16@3)) (and (= Used_8Mask@3 Used_8Mask@1) (= (ControlFlow 0 11) 9))) anon74_correct)))))
(let ((anon113_Else_correct  (=> (and (and (>= 0.0 takeTransfer@8) (= Used_8Mask@1 ZeroMask)) (and (= b_16@3 b_16@0) (= neededTransfer@17 FullPerm))) (and (=> (= (ControlFlow 0 19) 16) anon114_Then_correct) (=> (= (ControlFlow 0 19) 11) anon114_Else_correct)))))
(let ((anon113_Then_correct  (=> (and (> takeTransfer@8 0.0) (= neededTransfer@16 (- FullPerm takeTransfer@8))) (=> (and (and (and (= Used_8Mask@0 (MapType1Store ZeroMask null (Pair p_1@@3) (real_2_U (+ (U_2_real (MapType1Select ZeroMask null (Pair p_1@@3))) takeTransfer@8)))) (= b_16@1  (and b_16@0 (state Used_8Heap@0 Used_8Mask@0)))) (and (= TempMask@0 (MapType1Store ZeroMask null (Pair p_1@@3) (real_2_U FullPerm))) (= b_16@2  (and b_16@1 (IdenticalOnKnownLocations Ops_3Heap@7 Used_8Heap@0 TempMask@0))))) (and (and (= Ops_3Mask@12 (MapType1Store Ops_3Mask@11 null (Pair p_1@@3) (real_2_U (- (U_2_real (MapType1Select Ops_3Mask@11 null (Pair p_1@@3))) takeTransfer@8)))) (= Used_8Mask@1 Used_8Mask@0)) (and (= b_16@3 b_16@2) (= neededTransfer@17 neededTransfer@16)))) (and (=> (= (ControlFlow 0 18) 16) anon114_Then_correct) (=> (= (ControlFlow 0 18) 11) anon114_Else_correct))))))
(let ((anon112_Else_correct  (=> (and (< maskTransfer@8 FullPerm) (= takeTransfer@8 maskTransfer@8)) (and (=> (= (ControlFlow 0 21) 18) anon113_Then_correct) (=> (= (ControlFlow 0 21) 19) anon113_Else_correct)))))
(let ((anon112_Then_correct  (=> (and (<= FullPerm maskTransfer@8) (= takeTransfer@8 FullPerm)) (and (=> (= (ControlFlow 0 20) 18) anon113_Then_correct) (=> (= (ControlFlow 0 20) 19) anon113_Else_correct)))))
(let ((anon111_Then_correct  (=> (and (and (and (and (and b_8@26 b_8@26) b_16@0) true) (> FullPerm 0.0)) (= maskTransfer@8 (U_2_real (MapType1Select Ops_3Mask@11 null (Pair p_1@@3))))) (and (=> (= (ControlFlow 0 22) 20) anon112_Then_correct) (=> (= (ControlFlow 0 22) 21) anon112_Else_correct)))))
(let ((anon111_Else_correct  (=> (and (and (not (and (and (and (and b_8@26 b_8@26) b_16@0) true) (> FullPerm 0.0))) (= Used_8Mask@1 ZeroMask)) (and (= b_16@3 b_16@0) (= neededTransfer@17 FullPerm))) (and (=> (= (ControlFlow 0 17) 16) anon114_Then_correct) (=> (= (ControlFlow 0 17) 11) anon114_Else_correct)))))
(let ((anon62_correct  (=> (and (= b_16@0  (and b_16 (state Used_8Heap@0 ZeroMask))) (= initNeededTransfer@4 (+ (U_2_real (MapType1Select ZeroMask null (Pair p_1@@3))) FullPerm))) (and (=> (= (ControlFlow 0 23) (- 0 24)) (>= FullPerm 0.0)) (=> (>= FullPerm 0.0) (and (=> (= (ControlFlow 0 23) 22) anon111_Then_correct) (=> (= (ControlFlow 0 23) 17) anon111_Else_correct)))))))
(let ((anon61_correct  (=> (and (= Ops_3Heap@5 (MapType0Store Ops_3Heap@4 null (|Pair#sm| p_1@@3) (MapType1Store (MapType0Select Ops_3Heap@4 null (|Pair#sm| p_1@@3)) p_1@@3 f_7 (bool_2_U true)))) (= Ops_3Heap@6 (MapType0Store Ops_3Heap@5 null (|Pair#sm| p_1@@3) (MapType1Store (MapType0Select Ops_3Heap@5 null (|Pair#sm| p_1@@3)) p_1@@3 g (bool_2_U true))))) (=> (and (and (and (state Ops_3Heap@6 Ops_3Mask@10) (= b_8@25  (and b_8@24 (state Ops_3Heap@6 Ops_3Mask@10)))) (and (= b_8@26 b_8@25) (= Ops_3Mask@11 Ops_3Mask@10))) (and (and (= Ops_3Heap@7 Ops_3Heap@6) (= Heap@7 Heap@6)) (and (= Mask@12 Mask@11) (= (ControlFlow 0 26) 23)))) anon62_correct))))
(let ((anon110_Else_correct  (=> (HasDirectPerm Ops_3Mask@10 null (Pair p_1@@3)) (=> (and (= Ops_3Heap@4 Ops_3Heap@1) (= (ControlFlow 0 28) 26)) anon61_correct))))
(let ((anon110_Then_correct  (=> (not (HasDirectPerm Ops_3Mask@10 null (Pair p_1@@3))) (=> (and (and (= Ops_3Heap@2 (MapType0Store Ops_3Heap@1 null (|Pair#sm| p_1@@3) ZeroPMask)) (= Ops_3Heap@3 (MapType0Store Ops_3Heap@2 null (Pair p_1@@3) freshVersion@0))) (and (= Ops_3Heap@4 Ops_3Heap@3) (= (ControlFlow 0 27) 26))) anon61_correct))))
(let ((anon59_correct  (and (=> (= (ControlFlow 0 29) (- 0 30)) (=> (and b_8@19 b_13@12) (and (= neededTransfer@15 0.0) (= (U_2_real (MapType1Select Used_7Mask@7 p_1@@3 g)) initNeededTransfer@3)))) (=> (=> (and b_8@19 b_13@12) (and (= neededTransfer@15 0.0) (= (U_2_real (MapType1Select Used_7Mask@7 p_1@@3 g)) initNeededTransfer@3))) (=> (= b_15@0  (and b_8@19 b_13@12)) (=> (and (and (= b_15@1  (and b_15@0 (state Result_5Heap Result_5Mask))) (= b_15@2  (and b_15@1 (sumMask Result_5Mask Ops_3Mask@9 Used_7Mask@7)))) (and (= b_15@3  (and (and b_15@2 (IdenticalOnKnownLocations Ops_3Heap@1 Result_5Heap Ops_3Mask@9)) (IdenticalOnKnownLocations Used_7Heap@0 Result_5Heap Used_7Mask@7))) (= b_15@4  (and b_15@3 (state Result_5Heap Result_5Mask))))) (=> (and (and (and (= b_8@20  (and b_8@19 b_15@4)) (= b_8@21  (and b_8@20 b_13@12))) (and (= b_8@22  (and b_8@21 (= Used_7Heap@0 Ops_3Heap@1))) (= Ops_3Mask@10 (MapType1Store Ops_3Mask@9 null (Pair p_1@@3) (real_2_U (+ (U_2_real (MapType1Select Ops_3Mask@9 null (Pair p_1@@3))) FullPerm)))))) (and (and (= b_8@23  (and b_8@22 (state Ops_3Heap@1 Ops_3Mask@10))) (= b_8@24  (and b_8@23 (state Ops_3Heap@1 Ops_3Mask@10)))) (and (|Pair#trigger| Ops_3Heap@1 (Pair p_1@@3)) (= (MapType0Select Ops_3Heap@1 null (Pair p_1@@3)) (CombineFrames (FrameFragment (MapType0Select Ops_3Heap@1 p_1@@3 f_7)) (FrameFragment (MapType0Select Ops_3Heap@1 p_1@@3 g))))))) (and (=> (= (ControlFlow 0 29) 27) anon110_Then_correct) (=> (= (ControlFlow 0 29) 28) anon110_Else_correct)))))))))
(let ((anon109_Else_correct  (=> (>= 0.0 takeTransfer@7) (=> (and (= neededTransfer@15 neededTransfer@13) (= Mask@11 Mask@9)) (=> (and (and (= b_13@12 b_13@9) (= Heap@6 Heap@4)) (and (= Used_7Mask@7 Used_7Mask@5) (= (ControlFlow 0 33) 29))) anon59_correct)))))
(let ((anon109_Then_correct  (=> (> takeTransfer@7 0.0) (=> (and (and (= neededTransfer@14 (- neededTransfer@13 takeTransfer@7)) (= Used_7Mask@6 (MapType1Store Used_7Mask@5 p_1@@3 g (real_2_U (+ (U_2_real (MapType1Select Used_7Mask@5 p_1@@3 g)) takeTransfer@7))))) (and (= b_13@10  (and b_13@9 (state Used_7Heap@0 Used_7Mask@6))) (= b_13@11  (and b_13@10 (= (U_2_int (MapType0Select Heap@4 p_1@@3 g)) (U_2_int (MapType0Select Used_7Heap@0 p_1@@3 g))))))) (=> (and (and (and (= Mask@10 (MapType1Store Mask@9 p_1@@3 g (real_2_U (- (U_2_real (MapType1Select Mask@9 p_1@@3 g)) takeTransfer@7)))) (= Heap@5 (MapType0Store Heap@4 null (|wand_3#sm| true p_1@@3 FullPerm) (MapType1Store (MapType0Select Heap@4 null (|wand_3#sm| true p_1@@3 FullPerm)) p_1@@3 g (bool_2_U true))))) (and (= neededTransfer@15 neededTransfer@14) (= Mask@11 Mask@10))) (and (and (= b_13@12 b_13@11) (= Heap@6 Heap@5)) (and (= Used_7Mask@7 Used_7Mask@6) (= (ControlFlow 0 32) 29)))) anon59_correct)))))
(let ((anon108_Else_correct  (=> (and (< maskTransfer@7 neededTransfer@13) (= takeTransfer@7 maskTransfer@7)) (and (=> (= (ControlFlow 0 35) 32) anon109_Then_correct) (=> (= (ControlFlow 0 35) 33) anon109_Else_correct)))))
(let ((anon108_Then_correct  (=> (and (<= neededTransfer@13 maskTransfer@7) (= takeTransfer@7 neededTransfer@13)) (and (=> (= (ControlFlow 0 34) 32) anon109_Then_correct) (=> (= (ControlFlow 0 34) 33) anon109_Else_correct)))))
(let ((anon107_Then_correct  (=> (and (and (and (and b_8@19 b_13@9) true) (> neededTransfer@13 0.0)) (= maskTransfer@7 (U_2_real (MapType1Select Mask@9 p_1@@3 g)))) (and (=> (= (ControlFlow 0 36) 34) anon108_Then_correct) (=> (= (ControlFlow 0 36) 35) anon108_Else_correct)))))
(let ((anon107_Else_correct  (=> (not (and (and (and b_8@19 b_13@9) true) (> neededTransfer@13 0.0))) (=> (and (= neededTransfer@15 neededTransfer@13) (= Mask@11 Mask@9)) (=> (and (and (= b_13@12 b_13@9) (= Heap@6 Heap@4)) (and (= Used_7Mask@7 Used_7Mask@5) (= (ControlFlow 0 31) 29))) anon59_correct)))))
(let ((anon106_Else_correct  (=> (>= 0.0 takeTransfer@6) (=> (and (and (= Used_7Mask@5 Used_7Mask@3) (= b_13@9 b_13@6)) (and (= neededTransfer@13 FullPerm) (= Ops_3Mask@9 Ops_3Mask@7))) (and (=> (= (ControlFlow 0 39) 36) anon107_Then_correct) (=> (= (ControlFlow 0 39) 31) anon107_Else_correct))))))
(let ((anon106_Then_correct  (=> (and (> takeTransfer@6 0.0) (= neededTransfer@12 (- FullPerm takeTransfer@6))) (=> (and (and (and (= Used_7Mask@4 (MapType1Store Used_7Mask@3 p_1@@3 g (real_2_U (+ (U_2_real (MapType1Select Used_7Mask@3 p_1@@3 g)) takeTransfer@6)))) (= b_13@7  (and b_13@6 (state Used_7Heap@0 Used_7Mask@4)))) (and (= b_13@8  (and b_13@7 (= (U_2_int (MapType0Select Ops_3Heap@1 p_1@@3 g)) (U_2_int (MapType0Select Used_7Heap@0 p_1@@3 g))))) (= Ops_3Mask@8 (MapType1Store Ops_3Mask@7 p_1@@3 g (real_2_U (- (U_2_real (MapType1Select Ops_3Mask@7 p_1@@3 g)) takeTransfer@6)))))) (and (and (= Used_7Mask@5 Used_7Mask@4) (= b_13@9 b_13@8)) (and (= neededTransfer@13 neededTransfer@12) (= Ops_3Mask@9 Ops_3Mask@8)))) (and (=> (= (ControlFlow 0 38) 36) anon107_Then_correct) (=> (= (ControlFlow 0 38) 31) anon107_Else_correct))))))
(let ((anon105_Else_correct  (=> (and (< maskTransfer@6 FullPerm) (= takeTransfer@6 maskTransfer@6)) (and (=> (= (ControlFlow 0 41) 38) anon106_Then_correct) (=> (= (ControlFlow 0 41) 39) anon106_Else_correct)))))
(let ((anon105_Then_correct  (=> (and (<= FullPerm maskTransfer@6) (= takeTransfer@6 FullPerm)) (and (=> (= (ControlFlow 0 40) 38) anon106_Then_correct) (=> (= (ControlFlow 0 40) 39) anon106_Else_correct)))))
(let ((anon104_Then_correct  (=> (and (and (and (and b_8@19 b_13@6) true) (> FullPerm 0.0)) (= maskTransfer@6 (U_2_real (MapType1Select Ops_3Mask@7 p_1@@3 g)))) (and (=> (= (ControlFlow 0 42) 40) anon105_Then_correct) (=> (= (ControlFlow 0 42) 41) anon105_Else_correct)))))
(let ((anon104_Else_correct  (=> (not (and (and (and b_8@19 b_13@6) true) (> FullPerm 0.0))) (=> (and (and (= Used_7Mask@5 Used_7Mask@3) (= b_13@9 b_13@6)) (and (= neededTransfer@13 FullPerm) (= Ops_3Mask@9 Ops_3Mask@7))) (and (=> (= (ControlFlow 0 37) 36) anon107_Then_correct) (=> (= (ControlFlow 0 37) 31) anon107_Else_correct))))))
(let ((anon47_correct  (and (=> (= (ControlFlow 0 43) (- 0 45)) (=> (and b_8@16 b_13@6) (and (= neededTransfer@11 0.0) (= (U_2_real (MapType1Select Used_7Mask@3 p_1@@3 f_7)) initNeededTransfer@2)))) (=> (=> (and b_8@16 b_13@6) (and (= neededTransfer@11 0.0) (= (U_2_real (MapType1Select Used_7Mask@3 p_1@@3 f_7)) initNeededTransfer@2))) (=> (= b_14@0  (and b_8@16 b_13@6)) (=> (and (and (and (= b_14@1  (and b_14@0 (state Result_4Heap Result_4Mask))) (= b_14@2  (and b_14@1 (sumMask Result_4Mask Ops_3Mask@7 Used_7Mask@3)))) (and (= b_14@3  (and (and b_14@2 (IdenticalOnKnownLocations Ops_3Heap@1 Result_4Heap Ops_3Mask@7)) (IdenticalOnKnownLocations Used_7Heap@0 Result_4Heap Used_7Mask@3))) (= b_14@4  (and b_14@3 (state Result_4Heap Result_4Mask))))) (and (and (= b_8@17  (and b_8@16 b_14@4)) (= b_8@18  (and b_8@17 b_13@6))) (and (= b_8@19  (and b_8@18 (= Used_7Heap@0 Ops_3Heap@1))) (= initNeededTransfer@3 (+ (U_2_real (MapType1Select Used_7Mask@3 p_1@@3 g)) FullPerm))))) (and (=> (= (ControlFlow 0 43) (- 0 44)) (>= FullPerm 0.0)) (=> (>= FullPerm 0.0) (and (=> (= (ControlFlow 0 43) 42) anon104_Then_correct) (=> (= (ControlFlow 0 43) 37) anon104_Else_correct))))))))))
(let ((anon103_Else_correct  (=> (>= 0.0 takeTransfer@5) (=> (and (= Heap@4 Heap@2) (= neededTransfer@11 neededTransfer@9)) (=> (and (and (= Mask@9 Mask@7) (= b_13@6 b_13@3)) (and (= Used_7Mask@3 Used_7Mask@1) (= (ControlFlow 0 48) 43))) anon47_correct)))))
(let ((anon103_Then_correct  (=> (> takeTransfer@5 0.0) (=> (and (and (= neededTransfer@10 (- neededTransfer@9 takeTransfer@5)) (= Used_7Mask@2 (MapType1Store Used_7Mask@1 p_1@@3 f_7 (real_2_U (+ (U_2_real (MapType1Select Used_7Mask@1 p_1@@3 f_7)) takeTransfer@5))))) (and (= b_13@4  (and b_13@3 (state Used_7Heap@0 Used_7Mask@2))) (= b_13@5  (and b_13@4 (= (U_2_int (MapType0Select Heap@2 p_1@@3 f_7)) (U_2_int (MapType0Select Used_7Heap@0 p_1@@3 f_7))))))) (=> (and (and (and (= Mask@8 (MapType1Store Mask@7 p_1@@3 f_7 (real_2_U (- (U_2_real (MapType1Select Mask@7 p_1@@3 f_7)) takeTransfer@5)))) (= Heap@3 (MapType0Store Heap@2 null (|wand_3#sm| true p_1@@3 FullPerm) (MapType1Store (MapType0Select Heap@2 null (|wand_3#sm| true p_1@@3 FullPerm)) p_1@@3 f_7 (bool_2_U true))))) (and (= Heap@4 Heap@3) (= neededTransfer@11 neededTransfer@10))) (and (and (= Mask@9 Mask@8) (= b_13@6 b_13@5)) (and (= Used_7Mask@3 Used_7Mask@2) (= (ControlFlow 0 47) 43)))) anon47_correct)))))
(let ((anon102_Else_correct  (=> (and (< maskTransfer@5 neededTransfer@9) (= takeTransfer@5 maskTransfer@5)) (and (=> (= (ControlFlow 0 50) 47) anon103_Then_correct) (=> (= (ControlFlow 0 50) 48) anon103_Else_correct)))))
(let ((anon102_Then_correct  (=> (and (<= neededTransfer@9 maskTransfer@5) (= takeTransfer@5 neededTransfer@9)) (and (=> (= (ControlFlow 0 49) 47) anon103_Then_correct) (=> (= (ControlFlow 0 49) 48) anon103_Else_correct)))))
(let ((anon101_Then_correct  (=> (and (and (and (and b_8@16 b_13@3) true) (> neededTransfer@9 0.0)) (= maskTransfer@5 (U_2_real (MapType1Select Mask@7 p_1@@3 f_7)))) (and (=> (= (ControlFlow 0 51) 49) anon102_Then_correct) (=> (= (ControlFlow 0 51) 50) anon102_Else_correct)))))
(let ((anon101_Else_correct  (=> (not (and (and (and b_8@16 b_13@3) true) (> neededTransfer@9 0.0))) (=> (and (= Heap@4 Heap@2) (= neededTransfer@11 neededTransfer@9)) (=> (and (and (= Mask@9 Mask@7) (= b_13@6 b_13@3)) (and (= Used_7Mask@3 Used_7Mask@1) (= (ControlFlow 0 46) 43))) anon47_correct)))))
(let ((anon100_Else_correct  (=> (>= 0.0 takeTransfer@4) (=> (and (and (= Ops_3Mask@7 Ops_3Mask@5) (= Used_7Mask@1 ZeroMask)) (and (= b_13@3 b_13@0) (= neededTransfer@9 FullPerm))) (and (=> (= (ControlFlow 0 54) 51) anon101_Then_correct) (=> (= (ControlFlow 0 54) 46) anon101_Else_correct))))))
(let ((anon100_Then_correct  (=> (and (> takeTransfer@4 0.0) (= neededTransfer@8 (- FullPerm takeTransfer@4))) (=> (and (and (and (= Used_7Mask@0 (MapType1Store ZeroMask p_1@@3 f_7 (real_2_U (+ (U_2_real (MapType1Select ZeroMask p_1@@3 f_7)) takeTransfer@4)))) (= b_13@1  (and b_13@0 (state Used_7Heap@0 Used_7Mask@0)))) (and (= b_13@2  (and b_13@1 (= (U_2_int (MapType0Select Ops_3Heap@1 p_1@@3 f_7)) (U_2_int (MapType0Select Used_7Heap@0 p_1@@3 f_7))))) (= Ops_3Mask@6 (MapType1Store Ops_3Mask@5 p_1@@3 f_7 (real_2_U (- (U_2_real (MapType1Select Ops_3Mask@5 p_1@@3 f_7)) takeTransfer@4)))))) (and (and (= Ops_3Mask@7 Ops_3Mask@6) (= Used_7Mask@1 Used_7Mask@0)) (and (= b_13@3 b_13@2) (= neededTransfer@9 neededTransfer@8)))) (and (=> (= (ControlFlow 0 53) 51) anon101_Then_correct) (=> (= (ControlFlow 0 53) 46) anon101_Else_correct))))))
(let ((anon99_Else_correct  (=> (and (< maskTransfer@4 FullPerm) (= takeTransfer@4 maskTransfer@4)) (and (=> (= (ControlFlow 0 56) 53) anon100_Then_correct) (=> (= (ControlFlow 0 56) 54) anon100_Else_correct)))))
(let ((anon99_Then_correct  (=> (and (<= FullPerm maskTransfer@4) (= takeTransfer@4 FullPerm)) (and (=> (= (ControlFlow 0 55) 53) anon100_Then_correct) (=> (= (ControlFlow 0 55) 54) anon100_Else_correct)))))
(let ((anon98_Then_correct  (=> (and (and (and (and b_8@16 b_13@0) true) (> FullPerm 0.0)) (= maskTransfer@4 (U_2_real (MapType1Select Ops_3Mask@5 p_1@@3 f_7)))) (and (=> (= (ControlFlow 0 57) 55) anon99_Then_correct) (=> (= (ControlFlow 0 57) 56) anon99_Else_correct)))))
(let ((anon98_Else_correct  (=> (not (and (and (and b_8@16 b_13@0) true) (> FullPerm 0.0))) (=> (and (and (= Ops_3Mask@7 Ops_3Mask@5) (= Used_7Mask@1 ZeroMask)) (and (= b_13@3 b_13@0) (= neededTransfer@9 FullPerm))) (and (=> (= (ControlFlow 0 52) 51) anon101_Then_correct) (=> (= (ControlFlow 0 52) 46) anon101_Else_correct))))))
(let ((anon97_Then_correct  (=> b_8@16 (=> (and (= b_13@0  (and b_13 (state Used_7Heap@0 ZeroMask))) (= initNeededTransfer@2 (+ (U_2_real (MapType1Select ZeroMask p_1@@3 f_7)) FullPerm))) (and (=> (= (ControlFlow 0 58) (- 0 59)) (>= FullPerm 0.0)) (=> (>= FullPerm 0.0) (and (=> (= (ControlFlow 0 58) 57) anon98_Then_correct) (=> (= (ControlFlow 0 58) 52) anon98_Else_correct))))))))
(let ((anon97_Else_correct  (=> (not b_8@16) (=> (and (= b_8@26 b_8@16) (= Ops_3Mask@11 Ops_3Mask@5)) (=> (and (and (= Ops_3Heap@7 Ops_3Heap@1) (= Heap@7 Heap@2)) (and (= Mask@12 Mask@7) (= (ControlFlow 0 25) 23))) anon62_correct)))))
(let ((anon33_correct  (and (=> (= (ControlFlow 0 61) (- 0 62)) (=> (and b_8@6 b_11@6) (and (= neededTransfer@7 0.0) (= (U_2_real (MapType1Select Used_6Mask@3 p_1@@3 h)) initNeededTransfer@1)))) (=> (=> (and b_8@6 b_11@6) (and (= neededTransfer@7 0.0) (= (U_2_real (MapType1Select Used_6Mask@3 p_1@@3 h)) initNeededTransfer@1))) (=> (= b_12@0  (and b_8@6 b_11@6)) (=> (and (and (= b_12@1  (and b_12@0 (state Result_3Heap Result_3Mask))) (= b_12@2  (and b_12@1 (sumMask Result_3Mask Ops_3Mask@3 Used_6Mask@3)))) (and (= b_12@3  (and (and b_12@2 (IdenticalOnKnownLocations Ops_3Heap@0 Result_3Heap Ops_3Mask@3)) (IdenticalOnKnownLocations Used_6Heap@0 Result_3Heap Used_6Mask@3))) (= b_12@4  (and b_12@3 (state Result_3Heap Result_3Mask))))) (=> (and (and (and (and (= b_8@7  (and b_8@6 b_12@4)) (= b_8@8  (and b_8@7 b_11@6))) (and (= b_8@9  (and b_8@8 (= Used_6Heap@0 Ops_3Heap@0))) (= b_8@10  (and b_8@9 (state Ops_3Heap@0 Ops_3Mask@3))))) (and (and (= b_8@11  (and b_8@10 (not (= p_1@@3 null)))) (= Ops_3Mask@4 (MapType1Store Ops_3Mask@3 p_1@@3 g (real_2_U (+ (U_2_real (MapType1Select Ops_3Mask@3 p_1@@3 g)) FullPerm))))) (and (= b_8@12  (and b_8@11 (state Ops_3Heap@0 Ops_3Mask@4))) (= b_8@13  (and b_8@12 (state Ops_3Heap@0 Ops_3Mask@4)))))) (and (and (and (IdenticalOnKnownLocations Ops_3Heap@0 ExhaleHeap@0 Ops_3Mask@4) (= b_8@14  (and b_8@13 (state ExhaleHeap@0 Ops_3Mask@4)))) (and (= b_8@15  (and b_8@14 (state ExhaleHeap@0 Ops_3Mask@4))) (= Ops_3Heap@1 ExhaleHeap@0))) (and (and (= b_8@16 b_8@15) (= Mask@7 Mask@6)) (and (= Ops_3Mask@5 Ops_3Mask@4) (= Heap@2 Heap@1))))) (and (=> (= (ControlFlow 0 61) 58) anon97_Then_correct) (=> (= (ControlFlow 0 61) 25) anon97_Else_correct)))))))))
(let ((anon96_Else_correct  (=> (>= 0.0 takeTransfer@3) (=> (and (= b_11@6 b_11@3) (= Mask@6 Mask@4)) (=> (and (and (= Used_6Mask@3 Used_6Mask@1) (= neededTransfer@7 neededTransfer@5)) (and (= Heap@1 Heap@@14) (= (ControlFlow 0 65) 61))) anon33_correct)))))
(let ((anon96_Then_correct  (=> (> takeTransfer@3 0.0) (=> (and (and (= neededTransfer@6 (- neededTransfer@5 takeTransfer@3)) (= Used_6Mask@2 (MapType1Store Used_6Mask@1 p_1@@3 h (real_2_U (+ (U_2_real (MapType1Select Used_6Mask@1 p_1@@3 h)) takeTransfer@3))))) (and (= b_11@4  (and b_11@3 (state Used_6Heap@0 Used_6Mask@2))) (= b_11@5  (and b_11@4 (= (U_2_int (MapType0Select Heap@@14 p_1@@3 h)) (U_2_int (MapType0Select Used_6Heap@0 p_1@@3 h))))))) (=> (and (and (and (= Mask@5 (MapType1Store Mask@4 p_1@@3 h (real_2_U (- (U_2_real (MapType1Select Mask@4 p_1@@3 h)) takeTransfer@3)))) (= Heap@0 (MapType0Store Heap@@14 null (|wand_3#sm| true p_1@@3 FullPerm) (MapType1Store (MapType0Select Heap@@14 null (|wand_3#sm| true p_1@@3 FullPerm)) p_1@@3 h (bool_2_U true))))) (and (= b_11@6 b_11@5) (= Mask@6 Mask@5))) (and (and (= Used_6Mask@3 Used_6Mask@2) (= neededTransfer@7 neededTransfer@6)) (and (= Heap@1 Heap@0) (= (ControlFlow 0 64) 61)))) anon33_correct)))))
(let ((anon95_Else_correct  (=> (and (< maskTransfer@3 neededTransfer@5) (= takeTransfer@3 maskTransfer@3)) (and (=> (= (ControlFlow 0 67) 64) anon96_Then_correct) (=> (= (ControlFlow 0 67) 65) anon96_Else_correct)))))
(let ((anon95_Then_correct  (=> (and (<= neededTransfer@5 maskTransfer@3) (= takeTransfer@3 neededTransfer@5)) (and (=> (= (ControlFlow 0 66) 64) anon96_Then_correct) (=> (= (ControlFlow 0 66) 65) anon96_Else_correct)))))
(let ((anon94_Then_correct  (=> (and (and (and (and b_8@6 b_11@3) true) (> neededTransfer@5 0.0)) (= maskTransfer@3 (U_2_real (MapType1Select Mask@4 p_1@@3 h)))) (and (=> (= (ControlFlow 0 68) 66) anon95_Then_correct) (=> (= (ControlFlow 0 68) 67) anon95_Else_correct)))))
(let ((anon94_Else_correct  (=> (not (and (and (and b_8@6 b_11@3) true) (> neededTransfer@5 0.0))) (=> (and (= b_11@6 b_11@3) (= Mask@6 Mask@4)) (=> (and (and (= Used_6Mask@3 Used_6Mask@1) (= neededTransfer@7 neededTransfer@5)) (and (= Heap@1 Heap@@14) (= (ControlFlow 0 63) 61))) anon33_correct)))))
(let ((anon93_Else_correct  (=> (>= 0.0 takeTransfer@2) (=> (and (and (= neededTransfer@5 FullPerm) (= Ops_3Mask@3 Ops_3Mask@1)) (and (= Used_6Mask@1 ZeroMask) (= b_11@3 b_11@0))) (and (=> (= (ControlFlow 0 71) 68) anon94_Then_correct) (=> (= (ControlFlow 0 71) 63) anon94_Else_correct))))))
(let ((anon93_Then_correct  (=> (and (> takeTransfer@2 0.0) (= neededTransfer@4 (- FullPerm takeTransfer@2))) (=> (and (and (and (= Used_6Mask@0 (MapType1Store ZeroMask p_1@@3 h (real_2_U (+ (U_2_real (MapType1Select ZeroMask p_1@@3 h)) takeTransfer@2)))) (= b_11@1  (and b_11@0 (state Used_6Heap@0 Used_6Mask@0)))) (and (= b_11@2  (and b_11@1 (= (U_2_int (MapType0Select Ops_3Heap@0 p_1@@3 h)) (U_2_int (MapType0Select Used_6Heap@0 p_1@@3 h))))) (= Ops_3Mask@2 (MapType1Store Ops_3Mask@1 p_1@@3 h (real_2_U (- (U_2_real (MapType1Select Ops_3Mask@1 p_1@@3 h)) takeTransfer@2)))))) (and (and (= neededTransfer@5 neededTransfer@4) (= Ops_3Mask@3 Ops_3Mask@2)) (and (= Used_6Mask@1 Used_6Mask@0) (= b_11@3 b_11@2)))) (and (=> (= (ControlFlow 0 70) 68) anon94_Then_correct) (=> (= (ControlFlow 0 70) 63) anon94_Else_correct))))))
(let ((anon92_Else_correct  (=> (and (< maskTransfer@2 FullPerm) (= takeTransfer@2 maskTransfer@2)) (and (=> (= (ControlFlow 0 73) 70) anon93_Then_correct) (=> (= (ControlFlow 0 73) 71) anon93_Else_correct)))))
(let ((anon92_Then_correct  (=> (and (<= FullPerm maskTransfer@2) (= takeTransfer@2 FullPerm)) (and (=> (= (ControlFlow 0 72) 70) anon93_Then_correct) (=> (= (ControlFlow 0 72) 71) anon93_Else_correct)))))
(let ((anon91_Then_correct  (=> (and (and (and (and b_8@6 b_11@0) true) (> FullPerm 0.0)) (= maskTransfer@2 (U_2_real (MapType1Select Ops_3Mask@1 p_1@@3 h)))) (and (=> (= (ControlFlow 0 74) 72) anon92_Then_correct) (=> (= (ControlFlow 0 74) 73) anon92_Else_correct)))))
(let ((anon91_Else_correct  (=> (not (and (and (and b_8@6 b_11@0) true) (> FullPerm 0.0))) (=> (and (and (= neededTransfer@5 FullPerm) (= Ops_3Mask@3 Ops_3Mask@1)) (and (= Used_6Mask@1 ZeroMask) (= b_11@3 b_11@0))) (and (=> (= (ControlFlow 0 69) 68) anon94_Then_correct) (=> (= (ControlFlow 0 69) 63) anon94_Else_correct))))))
(let ((anon21_correct  (and (=> (= (ControlFlow 0 75) (- 0 77)) (=> (and b_8@2 b_9@4) (and (= neededTransfer@3 0.0) (= (U_2_real (MapType1Select Used_5Mask@3 null (wand_2 p_1@@3 FullPerm p_1@@3 FullPerm))) initNeededTransfer@0)))) (=> (=> (and b_8@2 b_9@4) (and (= neededTransfer@3 0.0) (= (U_2_real (MapType1Select Used_5Mask@3 null (wand_2 p_1@@3 FullPerm p_1@@3 FullPerm))) initNeededTransfer@0))) (=> (= b_10@0  (and b_8@2 b_9@4)) (=> (and (= b_10@1  (and b_10@0 (state Result_2Heap Result_2Mask))) (= b_10@2  (and b_10@1 (sumMask Result_2Mask Ops_3Mask@1 Used_5Mask@3)))) (=> (and (and (and (= b_10@3  (and (and b_10@2 (IdenticalOnKnownLocations Ops_3Heap@0 Result_2Heap Ops_3Mask@1)) (IdenticalOnKnownLocations Used_5Heap@0 Result_2Heap Used_5Mask@3))) (= b_10@4  (and b_10@3 (state Result_2Heap Result_2Mask)))) (and (= b_8@3  (and b_8@2 b_10@4)) (= b_8@4  (and b_8@3 b_9@4)))) (and (and (= b_8@5  (and b_8@4 (= Used_5Heap@0 Ops_3Heap@0))) (= b_8@6  (and b_8@5 (state Ops_3Heap@0 Ops_3Mask@1)))) (and (= b_11@0  (and b_11 (state Used_6Heap@0 ZeroMask))) (= initNeededTransfer@1 (+ (U_2_real (MapType1Select ZeroMask p_1@@3 h)) FullPerm))))) (and (=> (= (ControlFlow 0 75) (- 0 76)) (>= FullPerm 0.0)) (=> (>= FullPerm 0.0) (and (=> (= (ControlFlow 0 75) 74) anon91_Then_correct) (=> (= (ControlFlow 0 75) 69) anon91_Else_correct)))))))))))
(let ((anon90_Else_correct  (=> (and (>= 0.0 takeTransfer@1) (= Mask@4 Mask@2)) (=> (and (and (= neededTransfer@3 neededTransfer@1) (= b_9@4 b_9@2)) (and (= Used_5Mask@3 Used_5Mask@1) (= (ControlFlow 0 80) 75))) anon21_correct))))
(let ((anon90_Then_correct  (=> (and (> takeTransfer@1 0.0) (= neededTransfer@2 (- neededTransfer@1 takeTransfer@1))) (=> (and (and (and (= Used_5Mask@2 (MapType1Store Used_5Mask@1 null (wand_2 p_1@@3 FullPerm p_1@@3 FullPerm) (real_2_U (+ (U_2_real (MapType1Select Used_5Mask@1 null (wand_2 p_1@@3 FullPerm p_1@@3 FullPerm))) takeTransfer@1)))) (= b_9@3  (and b_9@2 (state Used_5Heap@0 Used_5Mask@2)))) (and (= Mask@3 (MapType1Store Mask@2 null (wand_2 p_1@@3 FullPerm p_1@@3 FullPerm) (real_2_U (- (U_2_real (MapType1Select Mask@2 null (wand_2 p_1@@3 FullPerm p_1@@3 FullPerm))) takeTransfer@1)))) (= Mask@4 Mask@3))) (and (and (= neededTransfer@3 neededTransfer@2) (= b_9@4 b_9@3)) (and (= Used_5Mask@3 Used_5Mask@2) (= (ControlFlow 0 79) 75)))) anon21_correct))))
(let ((anon89_Else_correct  (=> (and (< maskTransfer@1 neededTransfer@1) (= takeTransfer@1 maskTransfer@1)) (and (=> (= (ControlFlow 0 82) 79) anon90_Then_correct) (=> (= (ControlFlow 0 82) 80) anon90_Else_correct)))))
(let ((anon89_Then_correct  (=> (and (<= neededTransfer@1 maskTransfer@1) (= takeTransfer@1 neededTransfer@1)) (and (=> (= (ControlFlow 0 81) 79) anon90_Then_correct) (=> (= (ControlFlow 0 81) 80) anon90_Else_correct)))))
(let ((anon88_Then_correct  (=> (and (and (and (and b_8@2 b_9@2) true) (> neededTransfer@1 0.0)) (= maskTransfer@1 (U_2_real (MapType1Select Mask@2 null (wand_2 p_1@@3 FullPerm p_1@@3 FullPerm))))) (and (=> (= (ControlFlow 0 83) 81) anon89_Then_correct) (=> (= (ControlFlow 0 83) 82) anon89_Else_correct)))))
(let ((anon88_Else_correct  (=> (and (not (and (and (and b_8@2 b_9@2) true) (> neededTransfer@1 0.0))) (= Mask@4 Mask@2)) (=> (and (and (= neededTransfer@3 neededTransfer@1) (= b_9@4 b_9@2)) (and (= Used_5Mask@3 Used_5Mask@1) (= (ControlFlow 0 78) 75))) anon21_correct))))
(let ((anon87_Else_correct  (=> (>= 0.0 takeTransfer@0) (=> (and (and (= Ops_3Mask@1 ZeroMask) (= Used_5Mask@1 ZeroMask)) (and (= b_9@2 b_9@0) (= neededTransfer@1 1.0))) (and (=> (= (ControlFlow 0 86) 83) anon88_Then_correct) (=> (= (ControlFlow 0 86) 78) anon88_Else_correct))))))
(let ((anon87_Then_correct  (=> (> takeTransfer@0 0.0) (=> (and (and (and (= neededTransfer@0 (- 1.0 takeTransfer@0)) (= Used_5Mask@0 (MapType1Store ZeroMask null (wand_2 p_1@@3 FullPerm p_1@@3 FullPerm) (real_2_U (+ (U_2_real (MapType1Select ZeroMask null (wand_2 p_1@@3 FullPerm p_1@@3 FullPerm))) takeTransfer@0))))) (and (= b_9@1  (and b_9@0 (state Used_5Heap@0 Used_5Mask@0))) (= Ops_3Mask@0 (MapType1Store ZeroMask null (wand_2 p_1@@3 FullPerm p_1@@3 FullPerm) (real_2_U (- (U_2_real (MapType1Select ZeroMask null (wand_2 p_1@@3 FullPerm p_1@@3 FullPerm))) takeTransfer@0)))))) (and (and (= Ops_3Mask@1 Ops_3Mask@0) (= Used_5Mask@1 Used_5Mask@0)) (and (= b_9@2 b_9@1) (= neededTransfer@1 neededTransfer@0)))) (and (=> (= (ControlFlow 0 85) 83) anon88_Then_correct) (=> (= (ControlFlow 0 85) 78) anon88_Else_correct))))))
(let ((anon86_Else_correct  (=> (and (< maskTransfer@0 1.0) (= takeTransfer@0 maskTransfer@0)) (and (=> (= (ControlFlow 0 88) 85) anon87_Then_correct) (=> (= (ControlFlow 0 88) 86) anon87_Else_correct)))))
(let ((anon86_Then_correct  (=> (and (<= 1.0 maskTransfer@0) (= takeTransfer@0 1.0)) (and (=> (= (ControlFlow 0 87) 85) anon87_Then_correct) (=> (= (ControlFlow 0 87) 86) anon87_Else_correct)))))
(let ((anon85_Then_correct  (=> (and (and (and (and b_8@2 b_9@0) true) (> 1.0 0.0)) (= maskTransfer@0 (U_2_real (MapType1Select ZeroMask null (wand_2 p_1@@3 FullPerm p_1@@3 FullPerm))))) (and (=> (= (ControlFlow 0 89) 87) anon86_Then_correct) (=> (= (ControlFlow 0 89) 88) anon86_Else_correct)))))
(let ((anon85_Else_correct  (=> (not (and (and (and b_8@2 b_9@0) true) (> 1.0 0.0))) (=> (and (and (= Ops_3Mask@1 ZeroMask) (= Used_5Mask@1 ZeroMask)) (and (= b_9@2 b_9@0) (= neededTransfer@1 1.0))) (and (=> (= (ControlFlow 0 84) 83) anon88_Then_correct) (=> (= (ControlFlow 0 84) 78) anon88_Else_correct))))))
(let ((anon9_correct  (=> (= initNeededTransfer@0 (+ (U_2_real (MapType1Select ZeroMask null (wand_2 p_1@@3 FullPerm p_1@@3 FullPerm))) 1.0)) (and (=> (= (ControlFlow 0 90) (- 0 91)) (>= 1.0 0.0)) (=> (>= 1.0 0.0) (and (=> (= (ControlFlow 0 90) 89) anon85_Then_correct) (=> (= (ControlFlow 0 90) 84) anon85_Else_correct)))))))
(let ((anon83_Then_correct  (=> b_8@2 (and (=> (= (ControlFlow 0 95) 94) anon84_Then_correct) (=> (= (ControlFlow 0 95) 90) anon9_correct)))))
(let ((anon83_Else_correct  (=> (and (not b_8@2) (= (ControlFlow 0 93) 90)) anon9_correct)))
(let ((anon82_Then_correct  (=> (and b_8@2 b_9@0) (and (=> (= (ControlFlow 0 96) 95) anon83_Then_correct) (=> (= (ControlFlow 0 96) 93) anon83_Else_correct)))))
(let ((anon82_Else_correct  (=> (and (not (and b_8@2 b_9@0)) (= (ControlFlow 0 92) 90)) anon9_correct)))
(let ((anon81_Then_correct  (=> (and b_8@2 (= b_9@0  (and b_9 (state Used_5Heap@0 ZeroMask)))) (and (=> (= (ControlFlow 0 97) 96) anon82_Then_correct) (=> (= (ControlFlow 0 97) 92) anon82_Else_correct)))))
(let ((anon81_Else_correct  (=> (and (not b_8@2) (= Ops_3Heap@1 Ops_3Heap@0)) (=> (and (and (= b_8@16 b_8@2) (= Mask@7 Mask@2)) (and (= Ops_3Mask@5 ZeroMask) (= Heap@2 Heap@@14))) (and (=> (= (ControlFlow 0 60) 58) anon97_Then_correct) (=> (= (ControlFlow 0 60) 25) anon97_Else_correct))))))
(let ((anon4_correct  (=> (and (= b_8@1  (and b_8@0 (state Ops_3Heap@0 ZeroMask))) (= b_8@2  (and b_8@1 (state Ops_3Heap@0 ZeroMask)))) (and (=> (= (ControlFlow 0 98) 97) anon81_Then_correct) (=> (= (ControlFlow 0 98) 60) anon81_Else_correct)))))
(let ((anon80_Else_correct  (=> (and (not b_8@0) (= (ControlFlow 0 100) 98)) anon4_correct)))
(let ((anon80_Then_correct  (=> (and b_8@0 (= (ControlFlow 0 99) 98)) anon4_correct)))
(let ((anon79_Else_correct  (=> (= Mask@2 (MapType1Store Mask@1 null (wand_2 p_1@@3 FullPerm p_1@@3 FullPerm) (real_2_U (+ (U_2_real (MapType1Select Mask@1 null (wand_2 p_1@@3 FullPerm p_1@@3 FullPerm))) FullPerm)))) (=> (and (and (state Heap@@14 Mask@2) (state Heap@@14 Mask@2)) (and (= b_8@0  (and b_8 (state Ops_3Heap@0 ZeroMask))) (= b_7@0  (and b_7 (state Used_4Heap@0 ZeroMask))))) (and (=> (= (ControlFlow 0 101) 99) anon80_Then_correct) (=> (= (ControlFlow 0 101) 100) anon80_Else_correct))))))
(let ((anon79_Then_correct true))
(let ((anon0_correct  (=> (and (state Heap@@14 ZeroMask) (= AssumeFunctionsAbove (- 0 1))) (=> (and (and (and (U_2_bool (MapType0Select Heap@@14 p_1@@3 $allocated)) (not (= p_1@@3 null))) (and (= Mask@0 (MapType1Store ZeroMask p_1@@3 f_7 (real_2_U (+ (U_2_real (MapType1Select ZeroMask p_1@@3 f_7)) FullPerm)))) (state Heap@@14 Mask@0))) (and (and (not (= p_1@@3 null)) (= Mask@1 (MapType1Store Mask@0 p_1@@3 h (real_2_U (+ (U_2_real (MapType1Select Mask@0 p_1@@3 h)) FullPerm))))) (and (state Heap@@14 Mask@1) (state Heap@@14 Mask@1)))) (and (=> (= (ControlFlow 0 102) 1) anon79_Then_correct) (=> (= (ControlFlow 0 102) 101) anon79_Else_correct))))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 103) 102) anon0_correct)))
PreconditionGeneratedEntry_correct))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
))
(check-sat)
(get-info :reason-unknown)
(assert (not (= (ControlFlow 0 4) (- 5))))
(check-sat)
(pop 1)
; Invalid
(get-info :rlimit)
