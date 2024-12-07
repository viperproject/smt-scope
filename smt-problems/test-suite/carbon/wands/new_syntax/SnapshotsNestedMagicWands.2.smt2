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
(declare-fun wand_6 (T@U Real T@U Real) T@U)
(declare-fun getPredWandId (T@U) Int)
(declare-fun WandType_wand_6Type () T@T)
(declare-fun wand_2 (Bool Bool T@U Real) T@U)
(declare-fun WandType_wand_2Type () T@T)
(declare-fun wand_5 (T@U Real T@U Real) T@U)
(declare-fun WandType_wand_5Type () T@T)
(declare-fun state (T@U T@U) Bool)
(declare-fun MapType1Type (T@T T@T) T@T)
(declare-fun GoodMask (T@U) Bool)
(declare-fun MapType1TypeInv0 (T@T) T@T)
(declare-fun MapType1TypeInv1 (T@T) T@T)
(declare-fun MapType1Select (T@U T@U T@U) T@U)
(declare-fun MapType1Store (T@U T@U T@U T@U) T@U)
(declare-fun wand_1 (Bool T@U Real) T@U)
(declare-fun IsWandField (T@U) Bool)
(declare-fun WandType_wand_1Type () T@T)
(declare-fun |wand_1#ft| (Bool T@U Real) T@U)
(declare-fun FrameTypeType () T@T)
(declare-fun wand_3 (Bool T@U Real) T@U)
(declare-fun WandType_wand_3Type () T@T)
(declare-fun |wand_3#ft| (Bool T@U Real) T@U)
(declare-fun IsPredicateField (T@U) Bool)
(declare-fun wand_7 (Bool Bool) T@U)
(declare-fun WandType_wand_7Type () T@T)
(declare-fun |wand_7#ft| (Bool Bool) T@U)
(declare-fun IdenticalOnKnownLocations (T@U T@U T@U) Bool)
(declare-fun null () T@U)
(declare-fun PredicateMaskField (T@U) T@U)
(declare-fun HasDirectPerm (T@U T@U T@U) Bool)
(declare-fun WandMaskField (T@U) T@U)
(declare-fun Cell (T@U) T@U)
(declare-fun PredicateType_CellType () T@T)
(declare-fun |Cell#trigger| (T@U T@U) Bool)
(declare-fun |Cell#everUsed| (T@U) Bool)
(declare-fun |wand#ft| (Bool T@U Real Bool T@U Real) T@U)
(declare-fun |wand#sm| (Bool T@U Real Bool T@U Real) T@U)
(declare-fun WandType_wandType () T@T)
(declare-fun |wand_1#sm| (Bool T@U Real) T@U)
(declare-fun |wand_3#sm| (Bool T@U Real) T@U)
(declare-fun |Cell#sm| (T@U) T@U)
(declare-fun dummyHeap () T@U)
(declare-fun ZeroMask () T@U)
(declare-fun wand_4 (T@U Real T@U Real T@U Real T@U Real T@U Real T@U Real) T@U)
(declare-fun WandType_wand_4Type () T@T)
(declare-fun InsidePredicate (T@U T@U T@U T@U) Bool)
(declare-fun wand (Bool T@U Real Bool T@U Real) T@U)
(declare-fun sumMask (T@U T@U T@U) Bool)
(declare-fun |wand_6#ft| (T@U Real T@U Real) T@U)
(declare-fun |wand_2#ft| (Bool Bool T@U Real) T@U)
(declare-fun |wand_5#ft| (T@U Real T@U Real) T@U)
(declare-fun |wand_4#ft| (T@U Real T@U Real T@U Real T@U Real T@U Real T@U Real) T@U)
(declare-fun ConditionalFrame (Real T@U) T@U)
(declare-fun EmptyFrame () T@U)
(declare-fun NoPerm () Real)
(declare-fun |wand_6#sm| (T@U Real T@U Real) T@U)
(declare-fun |wand_2#sm| (Bool Bool T@U Real) T@U)
(declare-fun |wand_5#sm| (T@U Real T@U Real) T@U)
(declare-fun FullPerm () Real)
(declare-fun |wand_7#sm| (Bool Bool) T@U)
(declare-fun |wand_4#sm| (T@U Real T@U Real T@U Real T@U Real T@U Real T@U Real) T@U)
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
(assert  (and (= (Ctor WandType_wand_6Type) 10) (forall ((arg0@@18 T@U) (arg1@@4 Real) (arg2@@1 T@U) (arg3@@0 Real) ) (! (= (type (wand_6 arg0@@18 arg1@@4 arg2@@1 arg3@@0)) (FieldType WandType_wand_6Type intType))
 :qid |funType:wand_6|
 :pattern ( (wand_6 arg0@@18 arg1@@4 arg2@@1 arg3@@0))
))))
(assert (forall ((arg1@@5 T@U) (arg2@@2 Real) (arg3@@1 T@U) (arg4 Real) ) (!  (=> (and (= (type arg1@@5) RefType) (= (type arg3@@1) RefType)) (= (getPredWandId (wand_6 arg1@@5 arg2@@2 arg3@@1 arg4)) 1))
 :qid |stdinbpl.203:15|
 :skolemid |27|
 :pattern ( (wand_6 arg1@@5 arg2@@2 arg3@@1 arg4))
)))
(assert  (and (= (Ctor WandType_wand_2Type) 11) (forall ((arg0@@19 Bool) (arg1@@6 Bool) (arg2@@3 T@U) (arg3@@2 Real) ) (! (= (type (wand_2 arg0@@19 arg1@@6 arg2@@3 arg3@@2)) (FieldType WandType_wand_2Type intType))
 :qid |funType:wand_2|
 :pattern ( (wand_2 arg0@@19 arg1@@6 arg2@@3 arg3@@2))
))))
(assert (forall ((arg1@@7 Bool) (arg2@@4 Bool) (arg3@@3 T@U) (arg4@@0 Real) ) (!  (=> (= (type arg3@@3) RefType) (= (getPredWandId (wand_2 arg1@@7 arg2@@4 arg3@@3 arg4@@0)) 2))
 :qid |stdinbpl.235:15|
 :skolemid |34|
 :pattern ( (wand_2 arg1@@7 arg2@@4 arg3@@3 arg4@@0))
)))
(assert  (and (= (Ctor WandType_wand_5Type) 12) (forall ((arg0@@20 T@U) (arg1@@8 Real) (arg2@@5 T@U) (arg3@@4 Real) ) (! (= (type (wand_5 arg0@@20 arg1@@8 arg2@@5 arg3@@4)) (FieldType WandType_wand_5Type intType))
 :qid |funType:wand_5|
 :pattern ( (wand_5 arg0@@20 arg1@@8 arg2@@5 arg3@@4))
))))
(assert (forall ((arg1@@9 T@U) (arg2@@6 Real) (arg3@@5 T@U) (arg4@@1 Real) ) (!  (=> (and (= (type arg1@@9) RefType) (= (type arg3@@5) RefType)) (= (getPredWandId (wand_5 arg1@@9 arg2@@6 arg3@@5 arg4@@1)) 6))
 :qid |stdinbpl.363:15|
 :skolemid |62|
 :pattern ( (wand_5 arg1@@9 arg2@@6 arg3@@5 arg4@@1))
)))
(assert  (and (and (and (and (and (and (forall ((arg0@@21 T@T) (arg1@@10 T@T) ) (! (= (Ctor (MapType1Type arg0@@21 arg1@@10)) 13)
 :qid |ctor:MapType1Type|
)) (forall ((arg0@@22 T@T) (arg1@@11 T@T) ) (! (= (MapType1TypeInv0 (MapType1Type arg0@@22 arg1@@11)) arg0@@22)
 :qid |typeInv:MapType1TypeInv0|
 :pattern ( (MapType1Type arg0@@22 arg1@@11))
))) (forall ((arg0@@23 T@T) (arg1@@12 T@T) ) (! (= (MapType1TypeInv1 (MapType1Type arg0@@23 arg1@@12)) arg1@@12)
 :qid |typeInv:MapType1TypeInv1|
 :pattern ( (MapType1Type arg0@@23 arg1@@12))
))) (forall ((arg0@@24 T@U) (arg1@@13 T@U) (arg2@@7 T@U) ) (! (let ((aVar1 (MapType1TypeInv1 (type arg0@@24))))
(= (type (MapType1Select arg0@@24 arg1@@13 arg2@@7)) aVar1))
 :qid |funType:MapType1Select|
 :pattern ( (MapType1Select arg0@@24 arg1@@13 arg2@@7))
))) (forall ((arg0@@25 T@U) (arg1@@14 T@U) (arg2@@8 T@U) (arg3@@6 T@U) ) (! (let ((aVar1@@0 (type arg3@@6)))
(let ((aVar0@@0 (type arg1@@14)))
(= (type (MapType1Store arg0@@25 arg1@@14 arg2@@8 arg3@@6)) (MapType1Type aVar0@@0 aVar1@@0))))
 :qid |funType:MapType1Store|
 :pattern ( (MapType1Store arg0@@25 arg1@@14 arg2@@8 arg3@@6))
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
(assert  (and (= (Ctor WandType_wand_1Type) 14) (forall ((arg0@@26 Bool) (arg1@@15 T@U) (arg2@@9 Real) ) (! (= (type (wand_1 arg0@@26 arg1@@15 arg2@@9)) (FieldType WandType_wand_1Type intType))
 :qid |funType:wand_1|
 :pattern ( (wand_1 arg0@@26 arg1@@15 arg2@@9))
))))
(assert (forall ((arg1@@16 Bool) (arg2@@10 T@U) (arg3@@7 Real) ) (!  (=> (= (type arg2@@10) RefType) (IsWandField (wand_1 arg1@@16 arg2@@10 arg3@@7)))
 :qid |stdinbpl.279:15|
 :skolemid |43|
 :pattern ( (wand_1 arg1@@16 arg2@@10 arg3@@7))
)))
(assert  (and (= (Ctor FrameTypeType) 15) (forall ((arg0@@27 Bool) (arg1@@17 T@U) (arg2@@11 Real) ) (! (= (type (|wand_1#ft| arg0@@27 arg1@@17 arg2@@11)) (FieldType WandType_wand_1Type FrameTypeType))
 :qid |funType:wand_1#ft|
 :pattern ( (|wand_1#ft| arg0@@27 arg1@@17 arg2@@11))
))))
(assert (forall ((arg1@@18 Bool) (arg2@@12 T@U) (arg3@@8 Real) ) (!  (=> (= (type arg2@@12) RefType) (IsWandField (|wand_1#ft| arg1@@18 arg2@@12 arg3@@8)))
 :qid |stdinbpl.283:15|
 :skolemid |44|
 :pattern ( (|wand_1#ft| arg1@@18 arg2@@12 arg3@@8))
)))
(assert  (and (= (Ctor WandType_wand_3Type) 16) (forall ((arg0@@28 Bool) (arg1@@19 T@U) (arg2@@13 Real) ) (! (= (type (wand_3 arg0@@28 arg1@@19 arg2@@13)) (FieldType WandType_wand_3Type intType))
 :qid |funType:wand_3|
 :pattern ( (wand_3 arg0@@28 arg1@@19 arg2@@13))
))))
(assert (forall ((arg1@@20 Bool) (arg2@@14 T@U) (arg3@@9 Real) ) (!  (=> (= (type arg2@@14) RefType) (IsWandField (wand_3 arg1@@20 arg2@@14 arg3@@9)))
 :qid |stdinbpl.375:15|
 :skolemid |64|
 :pattern ( (wand_3 arg1@@20 arg2@@14 arg3@@9))
)))
(assert (forall ((arg0@@29 Bool) (arg1@@21 T@U) (arg2@@15 Real) ) (! (= (type (|wand_3#ft| arg0@@29 arg1@@21 arg2@@15)) (FieldType WandType_wand_3Type FrameTypeType))
 :qid |funType:wand_3#ft|
 :pattern ( (|wand_3#ft| arg0@@29 arg1@@21 arg2@@15))
)))
(assert (forall ((arg1@@22 Bool) (arg2@@16 T@U) (arg3@@10 Real) ) (!  (=> (= (type arg2@@16) RefType) (IsWandField (|wand_3#ft| arg1@@22 arg2@@16 arg3@@10)))
 :qid |stdinbpl.379:15|
 :skolemid |65|
 :pattern ( (|wand_3#ft| arg1@@22 arg2@@16 arg3@@10))
)))
(assert (forall ((arg1@@23 Bool) (arg2@@17 T@U) (arg3@@11 Real) ) (!  (=> (= (type arg2@@17) RefType) (= (getPredWandId (wand_1 arg1@@23 arg2@@17 arg3@@11)) 4))
 :qid |stdinbpl.299:15|
 :skolemid |48|
 :pattern ( (wand_1 arg1@@23 arg2@@17 arg3@@11))
)))
(assert (forall ((arg1@@24 Bool) (arg2@@18 T@U) (arg3@@12 Real) ) (!  (=> (= (type arg2@@18) RefType) (= (getPredWandId (wand_3 arg1@@24 arg2@@18 arg3@@12)) 7))
 :qid |stdinbpl.395:15|
 :skolemid |69|
 :pattern ( (wand_3 arg1@@24 arg2@@18 arg3@@12))
)))
(assert (forall ((arg1@@25 Bool) (arg2@@19 T@U) (arg3@@13 Real) ) (!  (=> (= (type arg2@@19) RefType) (not (IsPredicateField (wand_1 arg1@@25 arg2@@19 arg3@@13))))
 :qid |stdinbpl.287:15|
 :skolemid |45|
 :pattern ( (wand_1 arg1@@25 arg2@@19 arg3@@13))
)))
(assert (forall ((arg1@@26 Bool) (arg2@@20 T@U) (arg3@@14 Real) ) (!  (=> (= (type arg2@@20) RefType) (not (IsPredicateField (|wand_1#ft| arg1@@26 arg2@@20 arg3@@14))))
 :qid |stdinbpl.291:15|
 :skolemid |46|
 :pattern ( (|wand_1#ft| arg1@@26 arg2@@20 arg3@@14))
)))
(assert (forall ((arg1@@27 Bool) (arg2@@21 T@U) (arg3@@15 Real) ) (!  (=> (= (type arg2@@21) RefType) (not (IsPredicateField (wand_3 arg1@@27 arg2@@21 arg3@@15))))
 :qid |stdinbpl.383:15|
 :skolemid |66|
 :pattern ( (wand_3 arg1@@27 arg2@@21 arg3@@15))
)))
(assert (forall ((arg1@@28 Bool) (arg2@@22 T@U) (arg3@@16 Real) ) (!  (=> (= (type arg2@@22) RefType) (not (IsPredicateField (|wand_3#ft| arg1@@28 arg2@@22 arg3@@16))))
 :qid |stdinbpl.387:15|
 :skolemid |67|
 :pattern ( (|wand_3#ft| arg1@@28 arg2@@22 arg3@@16))
)))
(assert  (and (= (Ctor WandType_wand_7Type) 17) (forall ((arg0@@30 Bool) (arg1@@29 Bool) ) (! (= (type (wand_7 arg0@@30 arg1@@29)) (FieldType WandType_wand_7Type intType))
 :qid |funType:wand_7|
 :pattern ( (wand_7 arg0@@30 arg1@@29))
))))
(assert (forall ((arg1@@30 Bool) (arg2@@23 Bool) ) (! (IsWandField (wand_7 arg1@@30 arg2@@23))
 :qid |stdinbpl.407:15|
 :skolemid |71|
 :pattern ( (wand_7 arg1@@30 arg2@@23))
)))
(assert (forall ((arg0@@31 Bool) (arg1@@31 Bool) ) (! (= (type (|wand_7#ft| arg0@@31 arg1@@31)) (FieldType WandType_wand_7Type FrameTypeType))
 :qid |funType:wand_7#ft|
 :pattern ( (|wand_7#ft| arg0@@31 arg1@@31))
)))
(assert (forall ((arg1@@32 Bool) (arg2@@24 Bool) ) (! (IsWandField (|wand_7#ft| arg1@@32 arg2@@24))
 :qid |stdinbpl.411:15|
 :skolemid |72|
 :pattern ( (|wand_7#ft| arg1@@32 arg2@@24))
)))
(assert  (and (= (type null) RefType) (forall ((arg0@@32 T@U) ) (! (let ((A (FieldTypeInv0 (type arg0@@32))))
(= (type (PredicateMaskField arg0@@32)) (FieldType A (MapType1Type RefType boolType))))
 :qid |funType:PredicateMaskField|
 :pattern ( (PredicateMaskField arg0@@32))
))))
(assert (forall ((Heap@@0 T@U) (ExhaleHeap T@U) (Mask@@0 T@U) (pm_f T@U) ) (! (let ((C (FieldTypeInv0 (type pm_f))))
 (=> (and (and (and (and (and (= (type Heap@@0) (MapType0Type RefType)) (= (type ExhaleHeap) (MapType0Type RefType))) (= (type Mask@@0) (MapType1Type RefType realType))) (= (type pm_f) (FieldType C FrameTypeType))) (IdenticalOnKnownLocations Heap@@0 ExhaleHeap Mask@@0)) (and (HasDirectPerm Mask@@0 null pm_f) (IsPredicateField pm_f))) (= (MapType0Select Heap@@0 null (PredicateMaskField pm_f)) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))))
 :qid |stdinbpl.47:19|
 :skolemid |2|
 :pattern ( (IdenticalOnKnownLocations Heap@@0 ExhaleHeap Mask@@0) (IsPredicateField pm_f) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))
)))
(assert (forall ((arg0@@33 T@U) ) (! (let ((A@@0 (FieldTypeInv0 (type arg0@@33))))
(= (type (WandMaskField arg0@@33)) (FieldType A@@0 (MapType1Type RefType boolType))))
 :qid |funType:WandMaskField|
 :pattern ( (WandMaskField arg0@@33))
)))
(assert (forall ((Heap@@1 T@U) (ExhaleHeap@@0 T@U) (Mask@@1 T@U) (pm_f@@0 T@U) ) (! (let ((C@@0 (FieldTypeInv0 (type pm_f@@0))))
 (=> (and (and (and (and (and (= (type Heap@@1) (MapType0Type RefType)) (= (type ExhaleHeap@@0) (MapType0Type RefType))) (= (type Mask@@1) (MapType1Type RefType realType))) (= (type pm_f@@0) (FieldType C@@0 FrameTypeType))) (IdenticalOnKnownLocations Heap@@1 ExhaleHeap@@0 Mask@@1)) (and (HasDirectPerm Mask@@1 null pm_f@@0) (IsWandField pm_f@@0))) (= (MapType0Select Heap@@1 null (WandMaskField pm_f@@0)) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))))
 :qid |stdinbpl.60:19|
 :skolemid |5|
 :pattern ( (IdenticalOnKnownLocations Heap@@1 ExhaleHeap@@0 Mask@@1) (IsWandField pm_f@@0) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))
)))
(assert (forall ((arg1@@33 Bool) (arg2@@25 Bool) ) (!  (not (IsPredicateField (wand_7 arg1@@33 arg2@@25)))
 :qid |stdinbpl.415:15|
 :skolemid |73|
 :pattern ( (wand_7 arg1@@33 arg2@@25))
)))
(assert (forall ((arg1@@34 Bool) (arg2@@26 Bool) ) (!  (not (IsPredicateField (|wand_7#ft| arg1@@34 arg2@@26)))
 :qid |stdinbpl.419:15|
 :skolemid |74|
 :pattern ( (|wand_7#ft| arg1@@34 arg2@@26))
)))
(assert  (and (= (Ctor PredicateType_CellType) 18) (forall ((arg0@@34 T@U) ) (! (= (type (Cell arg0@@34)) (FieldType PredicateType_CellType FrameTypeType))
 :qid |funType:Cell|
 :pattern ( (Cell arg0@@34))
))))
(assert (forall ((x@@8 T@U) ) (!  (=> (= (type x@@8) RefType) (IsPredicateField (Cell x@@8)))
 :qid |stdinbpl.458:15|
 :skolemid |79|
 :pattern ( (Cell x@@8))
)))
(assert (forall ((Heap@@2 T@U) (x@@9 T@U) ) (!  (=> (and (= (type Heap@@2) (MapType0Type RefType)) (= (type x@@9) RefType)) (|Cell#everUsed| (Cell x@@9)))
 :qid |stdinbpl.477:15|
 :skolemid |83|
 :pattern ( (|Cell#trigger| Heap@@2 (Cell x@@9)))
)))
(assert  (and (and (= (Ctor WandType_wandType) 19) (forall ((arg0@@35 Bool) (arg1@@35 T@U) (arg2@@27 Real) (arg3@@17 Bool) (arg4@@2 T@U) (arg5 Real) ) (! (= (type (|wand#ft| arg0@@35 arg1@@35 arg2@@27 arg3@@17 arg4@@2 arg5)) (FieldType WandType_wandType FrameTypeType))
 :qid |funType:wand#ft|
 :pattern ( (|wand#ft| arg0@@35 arg1@@35 arg2@@27 arg3@@17 arg4@@2 arg5))
))) (forall ((arg0@@36 Bool) (arg1@@36 T@U) (arg2@@28 Real) (arg3@@18 Bool) (arg4@@3 T@U) (arg5@@0 Real) ) (! (= (type (|wand#sm| arg0@@36 arg1@@36 arg2@@28 arg3@@18 arg4@@3 arg5@@0)) (FieldType WandType_wandType (MapType1Type RefType boolType)))
 :qid |funType:wand#sm|
 :pattern ( (|wand#sm| arg0@@36 arg1@@36 arg2@@28 arg3@@18 arg4@@3 arg5@@0))
))))
(assert (forall ((arg1@@37 Bool) (arg2@@29 T@U) (arg3@@19 Real) (arg4@@4 Bool) (arg5@@1 T@U) (arg6 Real) ) (!  (=> (and (= (type arg2@@29) RefType) (= (type arg5@@1) RefType)) (= (|wand#sm| arg1@@37 arg2@@29 arg3@@19 arg4@@4 arg5@@1 arg6) (WandMaskField (|wand#ft| arg1@@37 arg2@@29 arg3@@19 arg4@@4 arg5@@1 arg6))))
 :qid |stdinbpl.263:15|
 :skolemid |40|
 :pattern ( (WandMaskField (|wand#ft| arg1@@37 arg2@@29 arg3@@19 arg4@@4 arg5@@1 arg6)))
)))
(assert (forall ((arg0@@37 Bool) (arg1@@38 T@U) (arg2@@30 Real) ) (! (= (type (|wand_1#sm| arg0@@37 arg1@@38 arg2@@30)) (FieldType WandType_wand_1Type (MapType1Type RefType boolType)))
 :qid |funType:wand_1#sm|
 :pattern ( (|wand_1#sm| arg0@@37 arg1@@38 arg2@@30))
)))
(assert (forall ((arg1@@39 Bool) (arg2@@31 T@U) (arg3@@20 Real) ) (!  (=> (= (type arg2@@31) RefType) (= (|wand_1#sm| arg1@@39 arg2@@31 arg3@@20) (WandMaskField (|wand_1#ft| arg1@@39 arg2@@31 arg3@@20))))
 :qid |stdinbpl.295:15|
 :skolemid |47|
 :pattern ( (WandMaskField (|wand_1#ft| arg1@@39 arg2@@31 arg3@@20)))
)))
(assert (forall ((arg0@@38 Bool) (arg1@@40 T@U) (arg2@@32 Real) ) (! (= (type (|wand_3#sm| arg0@@38 arg1@@40 arg2@@32)) (FieldType WandType_wand_3Type (MapType1Type RefType boolType)))
 :qid |funType:wand_3#sm|
 :pattern ( (|wand_3#sm| arg0@@38 arg1@@40 arg2@@32))
)))
(assert (forall ((arg1@@41 Bool) (arg2@@33 T@U) (arg3@@21 Real) ) (!  (=> (= (type arg2@@33) RefType) (= (|wand_3#sm| arg1@@41 arg2@@33 arg3@@21) (WandMaskField (|wand_3#ft| arg1@@41 arg2@@33 arg3@@21))))
 :qid |stdinbpl.391:15|
 :skolemid |68|
 :pattern ( (WandMaskField (|wand_3#ft| arg1@@41 arg2@@33 arg3@@21)))
)))
(assert (forall ((Heap@@3 T@U) (ExhaleHeap@@1 T@U) (Mask@@2 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@3) (MapType0Type RefType)) (= (type ExhaleHeap@@1) (MapType0Type RefType))) (= (type Mask@@2) (MapType1Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@3 ExhaleHeap@@1 Mask@@2)) (U_2_bool (MapType0Select Heap@@3 o_1 $allocated))) (U_2_bool (MapType0Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.73:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@3 ExhaleHeap@@1 Mask@@2) (MapType0Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert (forall ((x@@10 T@U) (x2 T@U) ) (!  (=> (and (and (= (type x@@10) RefType) (= (type x2) RefType)) (= (Cell x@@10) (Cell x2))) (= x@@10 x2))
 :qid |stdinbpl.468:15|
 :skolemid |81|
 :pattern ( (Cell x@@10) (Cell x2))
)))
(assert (forall ((arg0@@39 T@U) ) (! (= (type (|Cell#sm| arg0@@39)) (FieldType PredicateType_CellType (MapType1Type RefType boolType)))
 :qid |funType:Cell#sm|
 :pattern ( (|Cell#sm| arg0@@39))
)))
(assert (forall ((x@@11 T@U) (x2@@0 T@U) ) (!  (=> (and (and (= (type x@@11) RefType) (= (type x2@@0) RefType)) (= (|Cell#sm| x@@11) (|Cell#sm| x2@@0))) (= x@@11 x2@@0))
 :qid |stdinbpl.472:15|
 :skolemid |82|
 :pattern ( (|Cell#sm| x@@11) (|Cell#sm| x2@@0))
)))
(assert (forall ((Heap@@4 T@U) (ExhaleHeap@@2 T@U) (Mask@@3 T@U) (o_1@@0 T@U) (f_2 T@U) ) (! (let ((B@@1 (FieldTypeInv1 (type f_2))))
(let ((A@@1 (FieldTypeInv0 (type f_2))))
 (=> (and (and (and (and (and (and (= (type Heap@@4) (MapType0Type RefType)) (= (type ExhaleHeap@@2) (MapType0Type RefType))) (= (type Mask@@3) (MapType1Type RefType realType))) (= (type o_1@@0) RefType)) (= (type f_2) (FieldType A@@1 B@@1))) (IdenticalOnKnownLocations Heap@@4 ExhaleHeap@@2 Mask@@3)) (HasDirectPerm Mask@@3 o_1@@0 f_2)) (= (MapType0Select Heap@@4 o_1@@0 f_2) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2)))))
 :qid |stdinbpl.42:22|
 :skolemid |1|
 :pattern ( (IdenticalOnKnownLocations Heap@@4 ExhaleHeap@@2 Mask@@3) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2))
)))
(assert  (and (= (type dummyHeap) (MapType0Type RefType)) (= (type ZeroMask) (MapType1Type RefType realType))))
(assert (state dummyHeap ZeroMask))
(assert  (and (= (Ctor WandType_wand_4Type) 20) (forall ((arg0@@40 T@U) (arg1@@42 Real) (arg2@@34 T@U) (arg3@@22 Real) (arg4@@5 T@U) (arg5@@2 Real) (arg6@@0 T@U) (arg7 Real) (arg8 T@U) (arg9 Real) (arg10 T@U) (arg11 Real) ) (! (= (type (wand_4 arg0@@40 arg1@@42 arg2@@34 arg3@@22 arg4@@5 arg5@@2 arg6@@0 arg7 arg8 arg9 arg10 arg11)) (FieldType WandType_wand_4Type intType))
 :qid |funType:wand_4|
 :pattern ( (wand_4 arg0@@40 arg1@@42 arg2@@34 arg3@@22 arg4@@5 arg5@@2 arg6@@0 arg7 arg8 arg9 arg10 arg11))
))))
(assert (forall ((arg1@@43 T@U) (arg2@@35 Real) (arg3@@23 T@U) (arg4@@6 Real) (arg5@@3 T@U) (arg6@@1 Real) (arg7@@0 T@U) (arg8@@0 Real) (arg9@@0 T@U) (arg10@@0 Real) (arg11@@0 T@U) (arg12 Real) ) (!  (=> (and (and (and (and (and (= (type arg1@@43) RefType) (= (type arg3@@23) RefType)) (= (type arg5@@3) RefType)) (= (type arg7@@0) RefType)) (= (type arg9@@0) RefType)) (= (type arg11@@0) RefType)) (= (getPredWandId (wand_4 arg1@@43 arg2@@35 arg3@@23 arg4@@6 arg5@@3 arg6@@1 arg7@@0 arg8@@0 arg9@@0 arg10@@0 arg11@@0 arg12)) 5))
 :qid |stdinbpl.331:15|
 :skolemid |55|
 :pattern ( (wand_4 arg1@@43 arg2@@35 arg3@@23 arg4@@6 arg5@@3 arg6@@1 arg7@@0 arg8@@0 arg9@@0 arg10@@0 arg11@@0 arg12))
)))
(assert (forall ((p T@U) (v_1 T@U) (w T@U) ) (! (let ((A@@2 (FieldTypeInv0 (type p))))
 (=> (and (and (= (type p) (FieldType A@@2 FrameTypeType)) (= (type v_1) FrameTypeType)) (= (type w) FrameTypeType)) (not (InsidePredicate p v_1 p w))))
 :qid |stdinbpl.170:19|
 :skolemid |21|
 :pattern ( (InsidePredicate p v_1 p w))
)))
(assert (forall ((arg0@@41 Bool) (arg1@@44 T@U) (arg2@@36 Real) (arg3@@24 Bool) (arg4@@7 T@U) (arg5@@4 Real) ) (! (= (type (wand arg0@@41 arg1@@44 arg2@@36 arg3@@24 arg4@@7 arg5@@4)) (FieldType WandType_wandType intType))
 :qid |funType:wand|
 :pattern ( (wand arg0@@41 arg1@@44 arg2@@36 arg3@@24 arg4@@7 arg5@@4))
)))
(assert (forall ((arg1@@45 Bool) (arg2@@37 T@U) (arg3@@25 Real) (arg4@@8 Bool) (arg5@@5 T@U) (arg6@@2 Real) (arg1_2 Bool) (arg2_2 T@U) (arg3_2 Real) (arg4_2 Bool) (arg5_2 T@U) (arg6_2 Real) ) (!  (=> (and (and (and (and (= (type arg2@@37) RefType) (= (type arg5@@5) RefType)) (= (type arg2_2) RefType)) (= (type arg5_2) RefType)) (= (wand arg1@@45 arg2@@37 arg3@@25 arg4@@8 arg5@@5 arg6@@2) (wand arg1_2 arg2_2 arg3_2 arg4_2 arg5_2 arg6_2))) (and (= arg1@@45 arg1_2) (and (= arg2@@37 arg2_2) (and (= arg3@@25 arg3_2) (and (= arg4@@8 arg4_2) (and (= arg5@@5 arg5_2) (= arg6@@2 arg6_2)))))))
 :qid |stdinbpl.271:15|
 :skolemid |42|
 :pattern ( (wand arg1@@45 arg2@@37 arg3@@25 arg4@@8 arg5@@5 arg6@@2) (wand arg1_2 arg2_2 arg3_2 arg4_2 arg5_2 arg6_2))
)))
(assert  (not (IsPredicateField f_7)))
(assert  (not (IsWandField f_7)))
(assert  (not (IsPredicateField g)))
(assert  (not (IsWandField g)))
(assert (forall ((Heap@@5 T@U) (ExhaleHeap@@3 T@U) (Mask@@4 T@U) ) (!  (=> (and (and (and (= (type Heap@@5) (MapType0Type RefType)) (= (type ExhaleHeap@@3) (MapType0Type RefType))) (= (type Mask@@4) (MapType1Type RefType realType))) (IdenticalOnKnownLocations Heap@@5 ExhaleHeap@@3 Mask@@4)) (succHeap Heap@@5 ExhaleHeap@@3))
 :qid |stdinbpl.83:15|
 :skolemid |10|
 :pattern ( (IdenticalOnKnownLocations Heap@@5 ExhaleHeap@@3 Mask@@4))
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
(assert (forall ((arg1@@46 T@U) (arg2@@38 Real) (arg3@@26 T@U) (arg4@@9 Real) ) (!  (=> (and (= (type arg1@@46) RefType) (= (type arg3@@26) RefType)) (IsWandField (wand_6 arg1@@46 arg2@@38 arg3@@26 arg4@@9)))
 :qid |stdinbpl.183:15|
 :skolemid |22|
 :pattern ( (wand_6 arg1@@46 arg2@@38 arg3@@26 arg4@@9))
)))
(assert (forall ((arg0@@42 T@U) (arg1@@47 Real) (arg2@@39 T@U) (arg3@@27 Real) ) (! (= (type (|wand_6#ft| arg0@@42 arg1@@47 arg2@@39 arg3@@27)) (FieldType WandType_wand_6Type FrameTypeType))
 :qid |funType:wand_6#ft|
 :pattern ( (|wand_6#ft| arg0@@42 arg1@@47 arg2@@39 arg3@@27))
)))
(assert (forall ((arg1@@48 T@U) (arg2@@40 Real) (arg3@@28 T@U) (arg4@@10 Real) ) (!  (=> (and (= (type arg1@@48) RefType) (= (type arg3@@28) RefType)) (IsWandField (|wand_6#ft| arg1@@48 arg2@@40 arg3@@28 arg4@@10)))
 :qid |stdinbpl.187:15|
 :skolemid |23|
 :pattern ( (|wand_6#ft| arg1@@48 arg2@@40 arg3@@28 arg4@@10))
)))
(assert (forall ((arg1@@49 Bool) (arg2@@41 Bool) (arg3@@29 T@U) (arg4@@11 Real) ) (!  (=> (= (type arg3@@29) RefType) (IsWandField (wand_2 arg1@@49 arg2@@41 arg3@@29 arg4@@11)))
 :qid |stdinbpl.215:15|
 :skolemid |29|
 :pattern ( (wand_2 arg1@@49 arg2@@41 arg3@@29 arg4@@11))
)))
(assert (forall ((arg0@@43 Bool) (arg1@@50 Bool) (arg2@@42 T@U) (arg3@@30 Real) ) (! (= (type (|wand_2#ft| arg0@@43 arg1@@50 arg2@@42 arg3@@30)) (FieldType WandType_wand_2Type FrameTypeType))
 :qid |funType:wand_2#ft|
 :pattern ( (|wand_2#ft| arg0@@43 arg1@@50 arg2@@42 arg3@@30))
)))
(assert (forall ((arg1@@51 Bool) (arg2@@43 Bool) (arg3@@31 T@U) (arg4@@12 Real) ) (!  (=> (= (type arg3@@31) RefType) (IsWandField (|wand_2#ft| arg1@@51 arg2@@43 arg3@@31 arg4@@12)))
 :qid |stdinbpl.219:15|
 :skolemid |30|
 :pattern ( (|wand_2#ft| arg1@@51 arg2@@43 arg3@@31 arg4@@12))
)))
(assert (forall ((arg1@@52 T@U) (arg2@@44 Real) (arg3@@32 T@U) (arg4@@13 Real) ) (!  (=> (and (= (type arg1@@52) RefType) (= (type arg3@@32) RefType)) (IsWandField (wand_5 arg1@@52 arg2@@44 arg3@@32 arg4@@13)))
 :qid |stdinbpl.343:15|
 :skolemid |57|
 :pattern ( (wand_5 arg1@@52 arg2@@44 arg3@@32 arg4@@13))
)))
(assert (forall ((arg0@@44 T@U) (arg1@@53 Real) (arg2@@45 T@U) (arg3@@33 Real) ) (! (= (type (|wand_5#ft| arg0@@44 arg1@@53 arg2@@45 arg3@@33)) (FieldType WandType_wand_5Type FrameTypeType))
 :qid |funType:wand_5#ft|
 :pattern ( (|wand_5#ft| arg0@@44 arg1@@53 arg2@@45 arg3@@33))
)))
(assert (forall ((arg1@@54 T@U) (arg2@@46 Real) (arg3@@34 T@U) (arg4@@14 Real) ) (!  (=> (and (= (type arg1@@54) RefType) (= (type arg3@@34) RefType)) (IsWandField (|wand_5#ft| arg1@@54 arg2@@46 arg3@@34 arg4@@14)))
 :qid |stdinbpl.347:15|
 :skolemid |58|
 :pattern ( (|wand_5#ft| arg1@@54 arg2@@46 arg3@@34 arg4@@14))
)))
(assert (forall ((arg1@@55 T@U) (arg2@@47 Real) (arg3@@35 T@U) (arg4@@15 Real) (arg5@@6 T@U) (arg6@@3 Real) (arg7@@1 T@U) (arg8@@1 Real) (arg9@@1 T@U) (arg10@@1 Real) (arg11@@1 T@U) (arg12@@0 Real) ) (!  (=> (and (and (and (and (and (= (type arg1@@55) RefType) (= (type arg3@@35) RefType)) (= (type arg5@@6) RefType)) (= (type arg7@@1) RefType)) (= (type arg9@@1) RefType)) (= (type arg11@@1) RefType)) (IsWandField (wand_4 arg1@@55 arg2@@47 arg3@@35 arg4@@15 arg5@@6 arg6@@3 arg7@@1 arg8@@1 arg9@@1 arg10@@1 arg11@@1 arg12@@0)))
 :qid |stdinbpl.311:15|
 :skolemid |50|
 :pattern ( (wand_4 arg1@@55 arg2@@47 arg3@@35 arg4@@15 arg5@@6 arg6@@3 arg7@@1 arg8@@1 arg9@@1 arg10@@1 arg11@@1 arg12@@0))
)))
(assert (forall ((arg0@@45 T@U) (arg1@@56 Real) (arg2@@48 T@U) (arg3@@36 Real) (arg4@@16 T@U) (arg5@@7 Real) (arg6@@4 T@U) (arg7@@2 Real) (arg8@@2 T@U) (arg9@@2 Real) (arg10@@2 T@U) (arg11@@2 Real) ) (! (= (type (|wand_4#ft| arg0@@45 arg1@@56 arg2@@48 arg3@@36 arg4@@16 arg5@@7 arg6@@4 arg7@@2 arg8@@2 arg9@@2 arg10@@2 arg11@@2)) (FieldType WandType_wand_4Type FrameTypeType))
 :qid |funType:wand_4#ft|
 :pattern ( (|wand_4#ft| arg0@@45 arg1@@56 arg2@@48 arg3@@36 arg4@@16 arg5@@7 arg6@@4 arg7@@2 arg8@@2 arg9@@2 arg10@@2 arg11@@2))
)))
(assert (forall ((arg1@@57 T@U) (arg2@@49 Real) (arg3@@37 T@U) (arg4@@17 Real) (arg5@@8 T@U) (arg6@@5 Real) (arg7@@3 T@U) (arg8@@3 Real) (arg9@@3 T@U) (arg10@@3 Real) (arg11@@3 T@U) (arg12@@1 Real) ) (!  (=> (and (and (and (and (and (= (type arg1@@57) RefType) (= (type arg3@@37) RefType)) (= (type arg5@@8) RefType)) (= (type arg7@@3) RefType)) (= (type arg9@@3) RefType)) (= (type arg11@@3) RefType)) (IsWandField (|wand_4#ft| arg1@@57 arg2@@49 arg3@@37 arg4@@17 arg5@@8 arg6@@5 arg7@@3 arg8@@3 arg9@@3 arg10@@3 arg11@@3 arg12@@1)))
 :qid |stdinbpl.315:15|
 :skolemid |51|
 :pattern ( (|wand_4#ft| arg1@@57 arg2@@49 arg3@@37 arg4@@17 arg5@@8 arg6@@5 arg7@@3 arg8@@3 arg9@@3 arg10@@3 arg11@@3 arg12@@1))
)))
(assert  (and (forall ((arg0@@46 Real) (arg1@@58 T@U) ) (! (= (type (ConditionalFrame arg0@@46 arg1@@58)) FrameTypeType)
 :qid |funType:ConditionalFrame|
 :pattern ( (ConditionalFrame arg0@@46 arg1@@58))
)) (= (type EmptyFrame) FrameTypeType)))
(assert (forall ((p@@0 Real) (f_6 T@U) ) (!  (=> (= (type f_6) FrameTypeType) (= (ConditionalFrame p@@0 f_6) (ite (> p@@0 0.0) f_6 EmptyFrame)))
 :qid |stdinbpl.158:15|
 :skolemid |19|
 :pattern ( (ConditionalFrame p@@0 f_6))
)))
(assert (forall ((arg1@@59 T@U) (arg2@@50 Real) (arg3@@38 T@U) (arg4@@18 Real) ) (!  (=> (and (= (type arg1@@59) RefType) (= (type arg3@@38) RefType)) (not (IsPredicateField (wand_6 arg1@@59 arg2@@50 arg3@@38 arg4@@18))))
 :qid |stdinbpl.191:15|
 :skolemid |24|
 :pattern ( (wand_6 arg1@@59 arg2@@50 arg3@@38 arg4@@18))
)))
(assert (forall ((arg1@@60 T@U) (arg2@@51 Real) (arg3@@39 T@U) (arg4@@19 Real) ) (!  (=> (and (= (type arg1@@60) RefType) (= (type arg3@@39) RefType)) (not (IsPredicateField (|wand_6#ft| arg1@@60 arg2@@51 arg3@@39 arg4@@19))))
 :qid |stdinbpl.195:15|
 :skolemid |25|
 :pattern ( (|wand_6#ft| arg1@@60 arg2@@51 arg3@@39 arg4@@19))
)))
(assert (forall ((arg1@@61 Bool) (arg2@@52 Bool) (arg3@@40 T@U) (arg4@@20 Real) ) (!  (=> (= (type arg3@@40) RefType) (not (IsPredicateField (wand_2 arg1@@61 arg2@@52 arg3@@40 arg4@@20))))
 :qid |stdinbpl.223:15|
 :skolemid |31|
 :pattern ( (wand_2 arg1@@61 arg2@@52 arg3@@40 arg4@@20))
)))
(assert (forall ((arg1@@62 Bool) (arg2@@53 Bool) (arg3@@41 T@U) (arg4@@21 Real) ) (!  (=> (= (type arg3@@41) RefType) (not (IsPredicateField (|wand_2#ft| arg1@@62 arg2@@53 arg3@@41 arg4@@21))))
 :qid |stdinbpl.227:15|
 :skolemid |32|
 :pattern ( (|wand_2#ft| arg1@@62 arg2@@53 arg3@@41 arg4@@21))
)))
(assert (forall ((arg1@@63 T@U) (arg2@@54 Real) (arg3@@42 T@U) (arg4@@22 Real) ) (!  (=> (and (= (type arg1@@63) RefType) (= (type arg3@@42) RefType)) (not (IsPredicateField (wand_5 arg1@@63 arg2@@54 arg3@@42 arg4@@22))))
 :qid |stdinbpl.351:15|
 :skolemid |59|
 :pattern ( (wand_5 arg1@@63 arg2@@54 arg3@@42 arg4@@22))
)))
(assert (forall ((arg1@@64 T@U) (arg2@@55 Real) (arg3@@43 T@U) (arg4@@23 Real) ) (!  (=> (and (= (type arg1@@64) RefType) (= (type arg3@@43) RefType)) (not (IsPredicateField (|wand_5#ft| arg1@@64 arg2@@55 arg3@@43 arg4@@23))))
 :qid |stdinbpl.355:15|
 :skolemid |60|
 :pattern ( (|wand_5#ft| arg1@@64 arg2@@55 arg3@@43 arg4@@23))
)))
(assert (forall ((arg1@@65 T@U) (arg2@@56 Real) (arg3@@44 T@U) (arg4@@24 Real) (arg5@@9 T@U) (arg6@@6 Real) (arg7@@4 T@U) (arg8@@4 Real) (arg9@@4 T@U) (arg10@@4 Real) (arg11@@4 T@U) (arg12@@2 Real) ) (!  (=> (and (and (and (and (and (= (type arg1@@65) RefType) (= (type arg3@@44) RefType)) (= (type arg5@@9) RefType)) (= (type arg7@@4) RefType)) (= (type arg9@@4) RefType)) (= (type arg11@@4) RefType)) (not (IsPredicateField (wand_4 arg1@@65 arg2@@56 arg3@@44 arg4@@24 arg5@@9 arg6@@6 arg7@@4 arg8@@4 arg9@@4 arg10@@4 arg11@@4 arg12@@2))))
 :qid |stdinbpl.319:15|
 :skolemid |52|
 :pattern ( (wand_4 arg1@@65 arg2@@56 arg3@@44 arg4@@24 arg5@@9 arg6@@6 arg7@@4 arg8@@4 arg9@@4 arg10@@4 arg11@@4 arg12@@2))
)))
(assert (forall ((arg1@@66 T@U) (arg2@@57 Real) (arg3@@45 T@U) (arg4@@25 Real) (arg5@@10 T@U) (arg6@@7 Real) (arg7@@5 T@U) (arg8@@5 Real) (arg9@@5 T@U) (arg10@@5 Real) (arg11@@5 T@U) (arg12@@3 Real) ) (!  (=> (and (and (and (and (and (= (type arg1@@66) RefType) (= (type arg3@@45) RefType)) (= (type arg5@@10) RefType)) (= (type arg7@@5) RefType)) (= (type arg9@@5) RefType)) (= (type arg11@@5) RefType)) (not (IsPredicateField (|wand_4#ft| arg1@@66 arg2@@57 arg3@@45 arg4@@25 arg5@@10 arg6@@7 arg7@@5 arg8@@5 arg9@@5 arg10@@5 arg11@@5 arg12@@3))))
 :qid |stdinbpl.323:15|
 :skolemid |53|
 :pattern ( (|wand_4#ft| arg1@@66 arg2@@57 arg3@@45 arg4@@25 arg5@@10 arg6@@7 arg7@@5 arg8@@5 arg9@@5 arg10@@5 arg11@@5 arg12@@3))
)))
(assert (forall ((Mask@@5 T@U) (o_2@@0 T@U) (f_4@@0 T@U) ) (! (let ((B@@3 (FieldTypeInv1 (type f_4@@0))))
(let ((A@@4 (FieldTypeInv0 (type f_4@@0))))
 (=> (and (and (= (type Mask@@5) (MapType1Type RefType realType)) (= (type o_2@@0) RefType)) (= (type f_4@@0) (FieldType A@@4 B@@3))) (= (HasDirectPerm Mask@@5 o_2@@0 f_4@@0) (> (U_2_real (MapType1Select Mask@@5 o_2@@0 f_4@@0)) NoPerm)))))
 :qid |stdinbpl.133:22|
 :skolemid |17|
 :pattern ( (HasDirectPerm Mask@@5 o_2@@0 f_4@@0))
)))
(assert (forall ((arg0@@47 T@U) (arg1@@67 Real) (arg2@@58 T@U) (arg3@@46 Real) ) (! (= (type (|wand_6#sm| arg0@@47 arg1@@67 arg2@@58 arg3@@46)) (FieldType WandType_wand_6Type (MapType1Type RefType boolType)))
 :qid |funType:wand_6#sm|
 :pattern ( (|wand_6#sm| arg0@@47 arg1@@67 arg2@@58 arg3@@46))
)))
(assert (forall ((arg1@@68 T@U) (arg2@@59 Real) (arg3@@47 T@U) (arg4@@26 Real) ) (!  (=> (and (= (type arg1@@68) RefType) (= (type arg3@@47) RefType)) (= (|wand_6#sm| arg1@@68 arg2@@59 arg3@@47 arg4@@26) (WandMaskField (|wand_6#ft| arg1@@68 arg2@@59 arg3@@47 arg4@@26))))
 :qid |stdinbpl.199:15|
 :skolemid |26|
 :pattern ( (WandMaskField (|wand_6#ft| arg1@@68 arg2@@59 arg3@@47 arg4@@26)))
)))
(assert (forall ((arg0@@48 Bool) (arg1@@69 Bool) (arg2@@60 T@U) (arg3@@48 Real) ) (! (= (type (|wand_2#sm| arg0@@48 arg1@@69 arg2@@60 arg3@@48)) (FieldType WandType_wand_2Type (MapType1Type RefType boolType)))
 :qid |funType:wand_2#sm|
 :pattern ( (|wand_2#sm| arg0@@48 arg1@@69 arg2@@60 arg3@@48))
)))
(assert (forall ((arg1@@70 Bool) (arg2@@61 Bool) (arg3@@49 T@U) (arg4@@27 Real) ) (!  (=> (= (type arg3@@49) RefType) (= (|wand_2#sm| arg1@@70 arg2@@61 arg3@@49 arg4@@27) (WandMaskField (|wand_2#ft| arg1@@70 arg2@@61 arg3@@49 arg4@@27))))
 :qid |stdinbpl.231:15|
 :skolemid |33|
 :pattern ( (WandMaskField (|wand_2#ft| arg1@@70 arg2@@61 arg3@@49 arg4@@27)))
)))
(assert (forall ((arg0@@49 T@U) (arg1@@71 Real) (arg2@@62 T@U) (arg3@@50 Real) ) (! (= (type (|wand_5#sm| arg0@@49 arg1@@71 arg2@@62 arg3@@50)) (FieldType WandType_wand_5Type (MapType1Type RefType boolType)))
 :qid |funType:wand_5#sm|
 :pattern ( (|wand_5#sm| arg0@@49 arg1@@71 arg2@@62 arg3@@50))
)))
(assert (forall ((arg1@@72 T@U) (arg2@@63 Real) (arg3@@51 T@U) (arg4@@28 Real) ) (!  (=> (and (= (type arg1@@72) RefType) (= (type arg3@@51) RefType)) (= (|wand_5#sm| arg1@@72 arg2@@63 arg3@@51 arg4@@28) (WandMaskField (|wand_5#ft| arg1@@72 arg2@@63 arg3@@51 arg4@@28))))
 :qid |stdinbpl.359:15|
 :skolemid |61|
 :pattern ( (WandMaskField (|wand_5#ft| arg1@@72 arg2@@63 arg3@@51 arg4@@28)))
)))
(assert (forall ((arg1@@73 Bool) (arg2@@64 T@U) (arg3@@52 Real) (arg4@@29 Bool) (arg5@@11 T@U) (arg6@@8 Real) ) (!  (=> (and (= (type arg2@@64) RefType) (= (type arg5@@11) RefType)) (= (getPredWandId (wand arg1@@73 arg2@@64 arg3@@52 arg4@@29 arg5@@11 arg6@@8)) 3))
 :qid |stdinbpl.267:15|
 :skolemid |41|
 :pattern ( (wand arg1@@73 arg2@@64 arg3@@52 arg4@@29 arg5@@11 arg6@@8))
)))
(assert (forall ((o_2@@1 T@U) (f_4@@1 T@U) ) (! (let ((B@@4 (FieldTypeInv1 (type f_4@@1))))
(let ((A@@5 (FieldTypeInv0 (type f_4@@1))))
 (=> (and (= (type o_2@@1) RefType) (= (type f_4@@1) (FieldType A@@5 B@@4))) (= (U_2_real (MapType1Select ZeroMask o_2@@1 f_4@@1)) NoPerm))))
 :qid |stdinbpl.106:22|
 :skolemid |13|
 :pattern ( (MapType1Select ZeroMask o_2@@1 f_4@@1))
)))
(assert (forall ((arg1@@74 Bool) (arg2@@65 T@U) (arg3@@53 Real) (arg4@@30 Bool) (arg5@@12 T@U) (arg6@@9 Real) ) (!  (=> (and (= (type arg2@@65) RefType) (= (type arg5@@12) RefType)) (IsWandField (wand arg1@@74 arg2@@65 arg3@@53 arg4@@30 arg5@@12 arg6@@9)))
 :qid |stdinbpl.247:15|
 :skolemid |36|
 :pattern ( (wand arg1@@74 arg2@@65 arg3@@53 arg4@@30 arg5@@12 arg6@@9))
)))
(assert (forall ((arg1@@75 Bool) (arg2@@66 T@U) (arg3@@54 Real) (arg4@@31 Bool) (arg5@@13 T@U) (arg6@@10 Real) ) (!  (=> (and (= (type arg2@@66) RefType) (= (type arg5@@13) RefType)) (IsWandField (|wand#ft| arg1@@75 arg2@@66 arg3@@54 arg4@@31 arg5@@13 arg6@@10)))
 :qid |stdinbpl.251:15|
 :skolemid |37|
 :pattern ( (|wand#ft| arg1@@75 arg2@@66 arg3@@54 arg4@@31 arg5@@13 arg6@@10))
)))
(assert (forall ((arg1@@76 Bool) (arg2@@67 T@U) (arg3@@55 Real) (arg4@@32 Bool) (arg5@@14 T@U) (arg6@@11 Real) ) (!  (=> (and (= (type arg2@@67) RefType) (= (type arg5@@14) RefType)) (not (IsPredicateField (wand arg1@@76 arg2@@67 arg3@@55 arg4@@32 arg5@@14 arg6@@11))))
 :qid |stdinbpl.255:15|
 :skolemid |38|
 :pattern ( (wand arg1@@76 arg2@@67 arg3@@55 arg4@@32 arg5@@14 arg6@@11))
)))
(assert (forall ((arg1@@77 Bool) (arg2@@68 T@U) (arg3@@56 Real) (arg4@@33 Bool) (arg5@@15 T@U) (arg6@@12 Real) ) (!  (=> (and (= (type arg2@@68) RefType) (= (type arg5@@15) RefType)) (not (IsPredicateField (|wand#ft| arg1@@77 arg2@@68 arg3@@56 arg4@@33 arg5@@15 arg6@@12))))
 :qid |stdinbpl.259:15|
 :skolemid |39|
 :pattern ( (|wand#ft| arg1@@77 arg2@@68 arg3@@56 arg4@@33 arg5@@15 arg6@@12))
)))
(assert (forall ((arg1@@78 Bool) (arg2@@69 Bool) (arg1_2@@0 Bool) (arg2_2@@0 Bool) ) (!  (=> (= (wand_7 arg1@@78 arg2@@69) (wand_7 arg1_2@@0 arg2_2@@0)) (and (= arg1@@78 arg1_2@@0) (= arg2@@69 arg2_2@@0)))
 :qid |stdinbpl.431:15|
 :skolemid |77|
 :pattern ( (wand_7 arg1@@78 arg2@@69) (wand_7 arg1_2@@0 arg2_2@@0))
)))
(assert (forall ((arg1@@79 Bool) (arg2@@70 T@U) (arg3@@57 Real) (arg1_2@@1 Bool) (arg2_2@@1 T@U) (arg3_2@@0 Real) ) (!  (=> (and (and (= (type arg2@@70) RefType) (= (type arg2_2@@1) RefType)) (= (wand_1 arg1@@79 arg2@@70 arg3@@57) (wand_1 arg1_2@@1 arg2_2@@1 arg3_2@@0))) (and (= arg1@@79 arg1_2@@1) (and (= arg2@@70 arg2_2@@1) (= arg3@@57 arg3_2@@0))))
 :qid |stdinbpl.303:15|
 :skolemid |49|
 :pattern ( (wand_1 arg1@@79 arg2@@70 arg3@@57) (wand_1 arg1_2@@1 arg2_2@@1 arg3_2@@0))
)))
(assert (forall ((arg1@@80 Bool) (arg2@@71 T@U) (arg3@@58 Real) (arg1_2@@2 Bool) (arg2_2@@2 T@U) (arg3_2@@1 Real) ) (!  (=> (and (and (= (type arg2@@71) RefType) (= (type arg2_2@@2) RefType)) (= (wand_3 arg1@@80 arg2@@71 arg3@@58) (wand_3 arg1_2@@2 arg2_2@@2 arg3_2@@1))) (and (= arg1@@80 arg1_2@@2) (and (= arg2@@71 arg2_2@@2) (= arg3@@58 arg3_2@@1))))
 :qid |stdinbpl.399:15|
 :skolemid |70|
 :pattern ( (wand_3 arg1@@80 arg2@@71 arg3@@58) (wand_3 arg1_2@@2 arg2_2@@2 arg3_2@@1))
)))
(assert (forall ((arg1@@81 Bool) (arg2@@72 Bool) ) (! (= (getPredWandId (wand_7 arg1@@81 arg2@@72)) 8)
 :qid |stdinbpl.427:15|
 :skolemid |76|
 :pattern ( (wand_7 arg1@@81 arg2@@72))
)))
(assert (forall ((Heap@@6 T@U) (ExhaleHeap@@4 T@U) (Mask@@6 T@U) (pm_f@@1 T@U) ) (! (let ((C@@1 (FieldTypeInv0 (type pm_f@@1))))
 (=> (and (and (and (and (and (= (type Heap@@6) (MapType0Type RefType)) (= (type ExhaleHeap@@4) (MapType0Type RefType))) (= (type Mask@@6) (MapType1Type RefType realType))) (= (type pm_f@@1) (FieldType C@@1 FrameTypeType))) (IdenticalOnKnownLocations Heap@@6 ExhaleHeap@@4 Mask@@6)) (and (HasDirectPerm Mask@@6 null pm_f@@1) (IsPredicateField pm_f@@1))) (forall ((o2 T@U) (f_2@@0 T@U) ) (! (let ((B@@5 (FieldTypeInv1 (type f_2@@0))))
(let ((A@@6 (FieldTypeInv0 (type f_2@@0))))
 (=> (and (and (= (type o2) RefType) (= (type f_2@@0) (FieldType A@@6 B@@5))) (U_2_bool (MapType1Select (MapType0Select Heap@@6 null (PredicateMaskField pm_f@@1)) o2 f_2@@0))) (= (MapType0Select Heap@@6 o2 f_2@@0) (MapType0Select ExhaleHeap@@4 o2 f_2@@0)))))
 :qid |stdinbpl.54:134|
 :skolemid |3|
 :pattern ( (MapType0Select ExhaleHeap@@4 o2 f_2@@0))
))))
 :qid |stdinbpl.52:19|
 :skolemid |4|
 :pattern ( (IdenticalOnKnownLocations Heap@@6 ExhaleHeap@@4 Mask@@6) (IsPredicateField pm_f@@1))
)))
(assert (forall ((Heap@@7 T@U) (ExhaleHeap@@5 T@U) (Mask@@7 T@U) (pm_f@@2 T@U) ) (! (let ((C@@2 (FieldTypeInv0 (type pm_f@@2))))
 (=> (and (and (and (and (and (= (type Heap@@7) (MapType0Type RefType)) (= (type ExhaleHeap@@5) (MapType0Type RefType))) (= (type Mask@@7) (MapType1Type RefType realType))) (= (type pm_f@@2) (FieldType C@@2 FrameTypeType))) (IdenticalOnKnownLocations Heap@@7 ExhaleHeap@@5 Mask@@7)) (and (HasDirectPerm Mask@@7 null pm_f@@2) (IsWandField pm_f@@2))) (forall ((o2@@0 T@U) (f_2@@1 T@U) ) (! (let ((B@@6 (FieldTypeInv1 (type f_2@@1))))
(let ((A@@7 (FieldTypeInv0 (type f_2@@1))))
 (=> (and (and (= (type o2@@0) RefType) (= (type f_2@@1) (FieldType A@@7 B@@6))) (U_2_bool (MapType1Select (MapType0Select Heap@@7 null (WandMaskField pm_f@@2)) o2@@0 f_2@@1))) (= (MapType0Select Heap@@7 o2@@0 f_2@@1) (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1)))))
 :qid |stdinbpl.67:129|
 :skolemid |6|
 :pattern ( (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1))
))))
 :qid |stdinbpl.65:19|
 :skolemid |7|
 :pattern ( (IdenticalOnKnownLocations Heap@@7 ExhaleHeap@@5 Mask@@7) (IsWandField pm_f@@2))
)))
(assert (forall ((x@@12 T@U) ) (!  (=> (= (type x@@12) RefType) (= (getPredWandId (Cell x@@12)) 0))
 :qid |stdinbpl.462:15|
 :skolemid |80|
 :pattern ( (Cell x@@12))
)))
(assert (forall ((Mask@@8 T@U) (o_2@@2 T@U) (f_4@@2 T@U) ) (! (let ((B@@7 (FieldTypeInv1 (type f_4@@2))))
(let ((A@@8 (FieldTypeInv0 (type f_4@@2))))
 (=> (and (and (and (= (type Mask@@8) (MapType1Type RefType realType)) (= (type o_2@@2) RefType)) (= (type f_4@@2) (FieldType A@@8 B@@7))) (GoodMask Mask@@8)) (and (>= (U_2_real (MapType1Select Mask@@8 o_2@@2 f_4@@2)) NoPerm) (=> (and (and (GoodMask Mask@@8) (not (IsPredicateField f_4@@2))) (not (IsWandField f_4@@2))) (<= (U_2_real (MapType1Select Mask@@8 o_2@@2 f_4@@2)) FullPerm))))))
 :qid |stdinbpl.128:22|
 :skolemid |16|
 :pattern ( (GoodMask Mask@@8) (MapType1Select Mask@@8 o_2@@2 f_4@@2))
)))
(assert (forall ((o T@U) (f T@U) (Heap@@8 T@U) ) (!  (=> (and (and (and (= (type o) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap@@8) (MapType0Type RefType))) (U_2_bool (MapType0Select Heap@@8 o $allocated))) (U_2_bool (MapType0Select Heap@@8 (MapType0Select Heap@@8 o f) $allocated)))
 :qid |stdinbpl.31:15|
 :skolemid |0|
 :pattern ( (MapType0Select Heap@@8 o f))
)))
(assert (forall ((arg0@@50 Bool) (arg1@@82 Bool) ) (! (= (type (|wand_7#sm| arg0@@50 arg1@@82)) (FieldType WandType_wand_7Type (MapType1Type RefType boolType)))
 :qid |funType:wand_7#sm|
 :pattern ( (|wand_7#sm| arg0@@50 arg1@@82))
)))
(assert (forall ((arg1@@83 Bool) (arg2@@73 Bool) ) (! (= (|wand_7#sm| arg1@@83 arg2@@73) (WandMaskField (|wand_7#ft| arg1@@83 arg2@@73)))
 :qid |stdinbpl.423:15|
 :skolemid |75|
 :pattern ( (WandMaskField (|wand_7#ft| arg1@@83 arg2@@73)))
)))
(assert (forall ((x@@13 T@U) ) (!  (=> (= (type x@@13) RefType) (= (PredicateMaskField (Cell x@@13)) (|Cell#sm| x@@13)))
 :qid |stdinbpl.454:15|
 :skolemid |78|
 :pattern ( (PredicateMaskField (Cell x@@13)))
)))
(assert (forall ((arg0@@51 T@U) (arg1@@84 Real) (arg2@@74 T@U) (arg3@@59 Real) (arg4@@34 T@U) (arg5@@16 Real) (arg6@@13 T@U) (arg7@@6 Real) (arg8@@6 T@U) (arg9@@6 Real) (arg10@@6 T@U) (arg11@@6 Real) ) (! (= (type (|wand_4#sm| arg0@@51 arg1@@84 arg2@@74 arg3@@59 arg4@@34 arg5@@16 arg6@@13 arg7@@6 arg8@@6 arg9@@6 arg10@@6 arg11@@6)) (FieldType WandType_wand_4Type (MapType1Type RefType boolType)))
 :qid |funType:wand_4#sm|
 :pattern ( (|wand_4#sm| arg0@@51 arg1@@84 arg2@@74 arg3@@59 arg4@@34 arg5@@16 arg6@@13 arg7@@6 arg8@@6 arg9@@6 arg10@@6 arg11@@6))
)))
(assert (forall ((arg1@@85 T@U) (arg2@@75 Real) (arg3@@60 T@U) (arg4@@35 Real) (arg5@@17 T@U) (arg6@@14 Real) (arg7@@7 T@U) (arg8@@7 Real) (arg9@@7 T@U) (arg10@@7 Real) (arg11@@7 T@U) (arg12@@4 Real) ) (!  (=> (and (and (and (and (and (= (type arg1@@85) RefType) (= (type arg3@@60) RefType)) (= (type arg5@@17) RefType)) (= (type arg7@@7) RefType)) (= (type arg9@@7) RefType)) (= (type arg11@@7) RefType)) (= (|wand_4#sm| arg1@@85 arg2@@75 arg3@@60 arg4@@35 arg5@@17 arg6@@14 arg7@@7 arg8@@7 arg9@@7 arg10@@7 arg11@@7 arg12@@4) (WandMaskField (|wand_4#ft| arg1@@85 arg2@@75 arg3@@60 arg4@@35 arg5@@17 arg6@@14 arg7@@7 arg8@@7 arg9@@7 arg10@@7 arg11@@7 arg12@@4))))
 :qid |stdinbpl.327:15|
 :skolemid |54|
 :pattern ( (WandMaskField (|wand_4#ft| arg1@@85 arg2@@75 arg3@@60 arg4@@35 arg5@@17 arg6@@14 arg7@@7 arg8@@7 arg9@@7 arg10@@7 arg11@@7 arg12@@4)))
)))
(assert (forall ((Heap@@9 T@U) (o@@0 T@U) (f_3 T@U) (v T@U) ) (! (let ((B@@8 (type v)))
(let ((A@@9 (FieldTypeInv0 (type f_3))))
 (=> (and (and (= (type Heap@@9) (MapType0Type RefType)) (= (type o@@0) RefType)) (= (type f_3) (FieldType A@@9 B@@8))) (succHeap Heap@@9 (MapType0Store Heap@@9 o@@0 f_3 v)))))
 :qid |stdinbpl.78:22|
 :skolemid |9|
 :pattern ( (MapType0Store Heap@@9 o@@0 f_3 v))
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
(assert (forall ((arg1@@86 T@U) (arg2@@76 Real) (arg3@@61 T@U) (arg4@@36 Real) (arg5@@18 T@U) (arg6@@15 Real) (arg7@@8 T@U) (arg8@@8 Real) (arg9@@8 T@U) (arg10@@8 Real) (arg11@@8 T@U) (arg12@@5 Real) (arg1_2@@3 T@U) (arg2_2@@3 Real) (arg3_2@@2 T@U) (arg4_2@@0 Real) (arg5_2@@0 T@U) (arg6_2@@0 Real) (arg7_2 T@U) (arg8_2 Real) (arg9_2 T@U) (arg10_2 Real) (arg11_2 T@U) (arg12_2 Real) ) (!  (=> (and (and (and (and (and (and (and (and (and (and (and (and (= (type arg1@@86) RefType) (= (type arg3@@61) RefType)) (= (type arg5@@18) RefType)) (= (type arg7@@8) RefType)) (= (type arg9@@8) RefType)) (= (type arg11@@8) RefType)) (= (type arg1_2@@3) RefType)) (= (type arg3_2@@2) RefType)) (= (type arg5_2@@0) RefType)) (= (type arg7_2) RefType)) (= (type arg9_2) RefType)) (= (type arg11_2) RefType)) (= (wand_4 arg1@@86 arg2@@76 arg3@@61 arg4@@36 arg5@@18 arg6@@15 arg7@@8 arg8@@8 arg9@@8 arg10@@8 arg11@@8 arg12@@5) (wand_4 arg1_2@@3 arg2_2@@3 arg3_2@@2 arg4_2@@0 arg5_2@@0 arg6_2@@0 arg7_2 arg8_2 arg9_2 arg10_2 arg11_2 arg12_2))) (and (= arg1@@86 arg1_2@@3) (and (= arg2@@76 arg2_2@@3) (and (= arg3@@61 arg3_2@@2) (and (= arg4@@36 arg4_2@@0) (and (= arg5@@18 arg5_2@@0) (and (= arg6@@15 arg6_2@@0) (and (= arg7@@8 arg7_2) (and (= arg8@@8 arg8_2) (and (= arg9@@8 arg9_2) (and (= arg10@@8 arg10_2) (and (= arg11@@8 arg11_2) (= arg12@@5 arg12_2)))))))))))))
 :qid |stdinbpl.335:15|
 :skolemid |56|
 :pattern ( (wand_4 arg1@@86 arg2@@76 arg3@@61 arg4@@36 arg5@@18 arg6@@15 arg7@@8 arg8@@8 arg9@@8 arg10@@8 arg11@@8 arg12@@5) (wand_4 arg1_2@@3 arg2_2@@3 arg3_2@@2 arg4_2@@0 arg5_2@@0 arg6_2@@0 arg7_2 arg8_2 arg9_2 arg10_2 arg11_2 arg12_2))
)))
(assert (forall ((arg1@@87 Bool) (arg2@@77 Bool) (arg3@@62 T@U) (arg4@@37 Real) (arg1_2@@4 Bool) (arg2_2@@4 Bool) (arg3_2@@3 T@U) (arg4_2@@1 Real) ) (!  (=> (and (and (= (type arg3@@62) RefType) (= (type arg3_2@@3) RefType)) (= (wand_2 arg1@@87 arg2@@77 arg3@@62 arg4@@37) (wand_2 arg1_2@@4 arg2_2@@4 arg3_2@@3 arg4_2@@1))) (and (= arg1@@87 arg1_2@@4) (and (= arg2@@77 arg2_2@@4) (and (= arg3@@62 arg3_2@@3) (= arg4@@37 arg4_2@@1)))))
 :qid |stdinbpl.239:15|
 :skolemid |35|
 :pattern ( (wand_2 arg1@@87 arg2@@77 arg3@@62 arg4@@37) (wand_2 arg1_2@@4 arg2_2@@4 arg3_2@@3 arg4_2@@1))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
(assert (forall ((arg1@@88 T@U) (arg2@@78 Real) (arg3@@63 T@U) (arg4@@38 Real) (arg1_2@@5 T@U) (arg2_2@@5 Real) (arg3_2@@4 T@U) (arg4_2@@2 Real) ) (!  (=> (and (and (and (and (= (type arg1@@88) RefType) (= (type arg3@@63) RefType)) (= (type arg1_2@@5) RefType)) (= (type arg3_2@@4) RefType)) (= (wand_6 arg1@@88 arg2@@78 arg3@@63 arg4@@38) (wand_6 arg1_2@@5 arg2_2@@5 arg3_2@@4 arg4_2@@2))) (and (= arg1@@88 arg1_2@@5) (and (= arg2@@78 arg2_2@@5) (and (= arg3@@63 arg3_2@@4) (= arg4@@38 arg4_2@@2)))))
 :qid |stdinbpl.207:15|
 :skolemid |28|
 :pattern ( (wand_6 arg1@@88 arg2@@78 arg3@@63 arg4@@38) (wand_6 arg1_2@@5 arg2_2@@5 arg3_2@@4 arg4_2@@2))
)))
(assert (forall ((arg1@@89 T@U) (arg2@@79 Real) (arg3@@64 T@U) (arg4@@39 Real) (arg1_2@@6 T@U) (arg2_2@@6 Real) (arg3_2@@5 T@U) (arg4_2@@3 Real) ) (!  (=> (and (and (and (and (= (type arg1@@89) RefType) (= (type arg3@@64) RefType)) (= (type arg1_2@@6) RefType)) (= (type arg3_2@@5) RefType)) (= (wand_5 arg1@@89 arg2@@79 arg3@@64 arg4@@39) (wand_5 arg1_2@@6 arg2_2@@6 arg3_2@@5 arg4_2@@3))) (and (= arg1@@89 arg1_2@@6) (and (= arg2@@79 arg2_2@@6) (and (= arg3@@64 arg3_2@@5) (= arg4@@39 arg4_2@@3)))))
 :qid |stdinbpl.367:15|
 :skolemid |63|
 :pattern ( (wand_5 arg1@@89 arg2@@79 arg3@@64 arg4@@39) (wand_5 arg1_2@@6 arg2_2@@6 arg3_2@@5 arg4_2@@3))
)))
(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun Mask@22 () T@U)
(declare-fun Mask@21 () T@U)
(declare-fun x@@14 () T@U)
(declare-fun ExhaleHeap@1 () T@U)
(declare-fun Heap@@10 () T@U)
(declare-fun Mask@20 () T@U)
(declare-fun Mask@19 () T@U)
(declare-fun Mask@18 () T@U)
(declare-fun ExhaleHeap@0 () T@U)
(declare-fun Mask@14 () T@U)
(declare-fun Mask@13 () T@U)
(declare-fun Heap@6 () T@U)
(declare-fun Mask@15 () T@U)
(declare-fun Mask@16 () T@U)
(declare-fun Mask@17 () T@U)
(declare-fun Mask@12 () T@U)
(declare-fun b_18@14 () Bool)
(declare-fun b_23@16 () Bool)
(declare-fun neededTransfer@17 () Real)
(declare-fun Used_11Mask@11 () T@U)
(declare-fun initNeededTransfer@3 () Real)
(declare-fun b_26@0 () Bool)
(declare-fun b_26@1 () Bool)
(declare-fun Result_8Heap () T@U)
(declare-fun Result_8Mask () T@U)
(declare-fun b_26@2 () Bool)
(declare-fun Ops_9Mask () T@U)
(declare-fun b_26@3 () Bool)
(declare-fun Ops_9Heap@3 () T@U)
(declare-fun Used_11Heap@0 () T@U)
(declare-fun b_26@4 () Bool)
(declare-fun b_18@15 () Bool)
(declare-fun Mask@11 () T@U)
(declare-fun Mask@10 () T@U)
(declare-fun takeTransfer@8 () Real)
(declare-fun neededTransfer@15 () Real)
(declare-fun b_23@14 () Bool)
(declare-fun Mask@8 () T@U)
(declare-fun Used_11Mask@9 () T@U)
(declare-fun neededTransfer@16 () Real)
(declare-fun Used_11Mask@10 () T@U)
(declare-fun b_23@15 () Bool)
(declare-fun Mask@9 () T@U)
(declare-fun maskTransfer@8 () Real)
(declare-fun takeTransfer@7 () Real)
(declare-fun Used_11Mask@7 () T@U)
(declare-fun b_23@12 () Bool)
(declare-fun neededTransfer@14 () Real)
(declare-fun Used_11Mask@8 () T@U)
(declare-fun b_23@13 () Bool)
(declare-fun Ops_9Mask@12 () T@U)
(declare-fun Ops_9Mask@11 () T@U)
(declare-fun maskTransfer@7 () Real)
(declare-fun b_18@13 () Bool)
(declare-fun neededTransfer@13 () Real)
(declare-fun initNeededTransfer@2 () Real)
(declare-fun b_25@0 () Bool)
(declare-fun b_25@1 () Bool)
(declare-fun Result_7Heap () T@U)
(declare-fun Result_7Mask () T@U)
(declare-fun b_25@2 () Bool)
(declare-fun b_25@3 () Bool)
(declare-fun b_25@4 () Bool)
(declare-fun takeTransfer@6 () Real)
(declare-fun neededTransfer@11 () Real)
(declare-fun Heap@4 () T@U)
(declare-fun Mask@6 () T@U)
(declare-fun b_23@9 () Bool)
(declare-fun Used_11Mask@5 () T@U)
(declare-fun neededTransfer@12 () Real)
(declare-fun Used_11Mask@6 () T@U)
(declare-fun b_23@10 () Bool)
(declare-fun b_23@11 () Bool)
(declare-fun Mask@7 () T@U)
(declare-fun Heap@5 () T@U)
(declare-fun maskTransfer@6 () Real)
(declare-fun takeTransfer@5 () Real)
(declare-fun Used_11Mask@3 () T@U)
(declare-fun b_23@6 () Bool)
(declare-fun Ops_9Mask@9 () T@U)
(declare-fun neededTransfer@10 () Real)
(declare-fun Used_11Mask@4 () T@U)
(declare-fun b_23@7 () Bool)
(declare-fun b_23@8 () Bool)
(declare-fun Ops_9Mask@10 () T@U)
(declare-fun maskTransfer@5 () Real)
(declare-fun b_18@12 () Bool)
(declare-fun neededTransfer@9 () Real)
(declare-fun initNeededTransfer@1 () Real)
(declare-fun b_24@0 () Bool)
(declare-fun b_24@1 () Bool)
(declare-fun Result_6Heap () T@U)
(declare-fun Result_6Mask () T@U)
(declare-fun b_24@2 () Bool)
(declare-fun b_24@3 () Bool)
(declare-fun b_24@4 () Bool)
(declare-fun takeTransfer@4 () Real)
(declare-fun neededTransfer@7 () Real)
(declare-fun Mask@4 () T@U)
(declare-fun Heap@2 () T@U)
(declare-fun b_23@3 () Bool)
(declare-fun Used_11Mask@1 () T@U)
(declare-fun neededTransfer@8 () Real)
(declare-fun Used_11Mask@2 () T@U)
(declare-fun b_23@4 () Bool)
(declare-fun b_23@5 () Bool)
(declare-fun Mask@5 () T@U)
(declare-fun Heap@3 () T@U)
(declare-fun maskTransfer@4 () Real)
(declare-fun takeTransfer@3 () Real)
(declare-fun Ops_9Mask@7 () T@U)
(declare-fun b_23@0 () Bool)
(declare-fun neededTransfer@6 () Real)
(declare-fun Used_11Mask@0 () T@U)
(declare-fun b_23@1 () Bool)
(declare-fun b_23@2 () Bool)
(declare-fun Ops_9Mask@8 () T@U)
(declare-fun maskTransfer@3 () Real)
(declare-fun b_23 () Bool)
(declare-fun b_20@5 () Bool)
(declare-fun b_18@8 () Bool)
(declare-fun b_21@9 () Bool)
(declare-fun neededTransfer@5 () Real)
(declare-fun Used_10Mask@5 () T@U)
(declare-fun initNeededTransfer@0 () Real)
(declare-fun b_22@0 () Bool)
(declare-fun b_22@1 () Bool)
(declare-fun Result_5Heap () T@U)
(declare-fun Result_5Mask () T@U)
(declare-fun b_22@2 () Bool)
(declare-fun Ops_11Mask () T@U)
(declare-fun b_22@3 () Bool)
(declare-fun Ops_11Heap@0 () T@U)
(declare-fun Used_10Heap@0 () T@U)
(declare-fun b_22@4 () Bool)
(declare-fun b_20@6 () Bool)
(declare-fun Ops_9Mask@6 () T@U)
(declare-fun Ops_9Mask@5 () T@U)
(declare-fun b_18@9 () Bool)
(declare-fun Ops_9Heap@2 () T@U)
(declare-fun b_18@10 () Bool)
(declare-fun b_18@11 () Bool)
(declare-fun Mask@3 () T@U)
(declare-fun Heap@1 () T@U)
(declare-fun takeTransfer@2 () Real)
(declare-fun Mask@1 () T@U)
(declare-fun Used_10Mask@3 () T@U)
(declare-fun b_21@6 () Bool)
(declare-fun neededTransfer@3 () Real)
(declare-fun neededTransfer@4 () Real)
(declare-fun Used_10Mask@4 () T@U)
(declare-fun b_21@7 () Bool)
(declare-fun b_21@8 () Bool)
(declare-fun Mask@2 () T@U)
(declare-fun Heap@0 () T@U)
(declare-fun maskTransfer@2 () Real)
(declare-fun takeTransfer@1 () Real)
(declare-fun Ops_9Heap@0 () T@U)
(declare-fun Ops_9Mask@3 () T@U)
(declare-fun neededTransfer@1 () Real)
(declare-fun b_21@3 () Bool)
(declare-fun Used_10Mask@1 () T@U)
(declare-fun neededTransfer@2 () Real)
(declare-fun Used_10Mask@2 () T@U)
(declare-fun b_21@4 () Bool)
(declare-fun b_21@5 () Bool)
(declare-fun Ops_9Mask@4 () T@U)
(declare-fun Ops_9Heap@1 () T@U)
(declare-fun maskTransfer@1 () Real)
(declare-fun takeTransfer@0 () Real)
(declare-fun b_21@0 () Bool)
(declare-fun neededTransfer@0 () Real)
(declare-fun Used_10Mask@0 () T@U)
(declare-fun b_21@1 () Bool)
(declare-fun b_21@2 () Bool)
(declare-fun Ops_11Mask@2 () T@U)
(declare-fun Ops_11Mask@1 () T@U)
(declare-fun maskTransfer@0 () Real)
(declare-fun b_20@4 () Bool)
(declare-fun b_20@3 () Bool)
(declare-fun b_21 () Bool)
(declare-fun b_20@0 () Bool)
(declare-fun b_20@1 () Bool)
(declare-fun Ops_11Mask@0 () T@U)
(declare-fun b_20@2 () Bool)
(declare-fun b_20 () Bool)
(declare-fun b_19@0 () Bool)
(declare-fun b_19 () Bool)
(declare-fun Used_9Heap@0 () T@U)
(declare-fun b_18@7 () Bool)
(declare-fun b_18@6 () Bool)
(declare-fun b_18@3 () Bool)
(declare-fun Ops_9Mask@1 () T@U)
(declare-fun b_18@4 () Bool)
(declare-fun Ops_9Mask@2 () T@U)
(declare-fun b_18@5 () Bool)
(declare-fun b_18@0 () Bool)
(declare-fun b_18@1 () Bool)
(declare-fun Ops_9Mask@0 () T@U)
(declare-fun b_18@2 () Bool)
(declare-fun b_18 () Bool)
(declare-fun b_17@0 () Bool)
(declare-fun b_17 () Bool)
(declare-fun Used_8Heap@0 () T@U)
(declare-fun PostHeap@0 () T@U)
(declare-fun PostMask@0 () T@U)
(declare-fun PostMask@1 () T@U)
(declare-fun Mask@0 () T@U)
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (= (type PostHeap@0) (MapType0Type RefType)) (= (type x@@14) RefType)) (= (type PostMask@0) (MapType1Type RefType realType))) (= (type PostMask@1) (MapType1Type RefType realType))) (= (type Mask@1) (MapType1Type RefType realType))) (= (type Heap@@10) (MapType0Type RefType))) (= (type Mask@22) (MapType1Type RefType realType))) (= (type Mask@21) (MapType1Type RefType realType))) (= (type ExhaleHeap@1) (MapType0Type RefType))) (= (type Mask@20) (MapType1Type RefType realType))) (= (type Mask@19) (MapType1Type RefType realType))) (= (type Mask@18) (MapType1Type RefType realType))) (= (type ExhaleHeap@0) (MapType0Type RefType))) (= (type Mask@14) (MapType1Type RefType realType))) (= (type Mask@13) (MapType1Type RefType realType))) (= (type Heap@6) (MapType0Type RefType))) (= (type Mask@15) (MapType1Type RefType realType))) (= (type Mask@16) (MapType1Type RefType realType))) (= (type Mask@17) (MapType1Type RefType realType))) (= (type Mask@12) (MapType1Type RefType realType))) (= (type Used_11Mask@11) (MapType1Type RefType realType))) (= (type Result_8Heap) (MapType0Type RefType))) (= (type Result_8Mask) (MapType1Type RefType realType))) (= (type Ops_9Mask) (MapType1Type RefType realType))) (= (type Ops_9Heap@3) (MapType0Type RefType))) (= (type Used_11Heap@0) (MapType0Type RefType))) (= (type Mask@11) (MapType1Type RefType realType))) (= (type Mask@10) (MapType1Type RefType realType))) (= (type Mask@8) (MapType1Type RefType realType))) (= (type Used_11Mask@9) (MapType1Type RefType realType))) (= (type Used_11Mask@10) (MapType1Type RefType realType))) (= (type Mask@9) (MapType1Type RefType realType))) (= (type Used_11Mask@7) (MapType1Type RefType realType))) (= (type Used_11Mask@8) (MapType1Type RefType realType))) (= (type Ops_9Mask@12) (MapType1Type RefType realType))) (= (type Ops_9Mask@11) (MapType1Type RefType realType))) (= (type Result_7Heap) (MapType0Type RefType))) (= (type Result_7Mask) (MapType1Type RefType realType))) (= (type Heap@4) (MapType0Type RefType))) (= (type Mask@6) (MapType1Type RefType realType))) (= (type Used_11Mask@5) (MapType1Type RefType realType))) (= (type Used_11Mask@6) (MapType1Type RefType realType))) (= (type Mask@7) (MapType1Type RefType realType))) (= (type Heap@5) (MapType0Type RefType))) (= (type Used_11Mask@3) (MapType1Type RefType realType))) (= (type Ops_9Mask@9) (MapType1Type RefType realType))) (= (type Used_11Mask@4) (MapType1Type RefType realType))) (= (type Ops_9Mask@10) (MapType1Type RefType realType))) (= (type Result_6Heap) (MapType0Type RefType))) (= (type Result_6Mask) (MapType1Type RefType realType))) (= (type Mask@4) (MapType1Type RefType realType))) (= (type Heap@2) (MapType0Type RefType))) (= (type Used_11Mask@1) (MapType1Type RefType realType))) (= (type Used_11Mask@2) (MapType1Type RefType realType))) (= (type Mask@5) (MapType1Type RefType realType))) (= (type Heap@3) (MapType0Type RefType))) (= (type Ops_9Mask@7) (MapType1Type RefType realType))) (= (type Used_11Mask@0) (MapType1Type RefType realType))) (= (type Ops_9Mask@8) (MapType1Type RefType realType))) (= (type Ops_9Mask@3) (MapType1Type RefType realType))) (= (type Ops_9Heap@0) (MapType0Type RefType))) (= (type Used_10Mask@5) (MapType1Type RefType realType))) (= (type Result_5Heap) (MapType0Type RefType))) (= (type Result_5Mask) (MapType1Type RefType realType))) (= (type Ops_11Mask) (MapType1Type RefType realType))) (= (type Ops_11Heap@0) (MapType0Type RefType))) (= (type Used_10Heap@0) (MapType0Type RefType))) (= (type Ops_9Mask@6) (MapType1Type RefType realType))) (= (type Ops_9Mask@5) (MapType1Type RefType realType))) (= (type Ops_9Heap@2) (MapType0Type RefType))) (= (type Mask@3) (MapType1Type RefType realType))) (= (type Heap@1) (MapType0Type RefType))) (= (type Used_10Mask@3) (MapType1Type RefType realType))) (= (type Used_10Mask@4) (MapType1Type RefType realType))) (= (type Mask@2) (MapType1Type RefType realType))) (= (type Heap@0) (MapType0Type RefType))) (= (type Used_10Mask@1) (MapType1Type RefType realType))) (= (type Used_10Mask@2) (MapType1Type RefType realType))) (= (type Ops_9Mask@4) (MapType1Type RefType realType))) (= (type Ops_9Heap@1) (MapType0Type RefType))) (= (type Used_10Mask@0) (MapType1Type RefType realType))) (= (type Ops_11Mask@2) (MapType1Type RefType realType))) (= (type Ops_11Mask@1) (MapType1Type RefType realType))) (= (type Ops_11Mask@0) (MapType1Type RefType realType))) (= (type Used_9Heap@0) (MapType0Type RefType))) (= (type Ops_9Mask@2) (MapType1Type RefType realType))) (= (type Ops_9Mask@1) (MapType1Type RefType realType))) (= (type Ops_9Mask@0) (MapType1Type RefType realType))) (= (type Used_8Heap@0) (MapType0Type RefType))) (= (type Mask@0) (MapType1Type RefType realType))))
(set-info :boogie-vc-id test2)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 117) (let ((anon109_Then_correct true))
(let ((anon79_correct  (=> (= Mask@22 (MapType1Store Mask@21 x@@14 g (real_2_U (- (U_2_real (MapType1Select Mask@21 x@@14 g)) FullPerm)))) (and (=> (= (ControlFlow 0 7) (- 0 8)) (= (U_2_int (MapType0Select ExhaleHeap@1 x@@14 f_7)) (U_2_int (MapType0Select Heap@@10 x@@14 f_7)))) (=> (= (U_2_int (MapType0Select ExhaleHeap@1 x@@14 f_7)) (U_2_int (MapType0Select Heap@@10 x@@14 f_7))) (=> (= (ControlFlow 0 7) (- 0 6)) (= (U_2_int (MapType0Select ExhaleHeap@1 x@@14 g)) (U_2_int (MapType0Select Heap@@10 x@@14 g)))))))))
(let ((anon120_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 11) 7)) anon79_correct)))
(let ((anon120_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 9) (- 0 10)) (<= FullPerm (U_2_real (MapType1Select Mask@21 x@@14 g)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@21 x@@14 g))) (=> (= (ControlFlow 0 9) 7) anon79_correct))))))
(let ((anon77_correct  (=> (= Mask@21 (MapType1Store Mask@20 x@@14 f_7 (real_2_U (- (U_2_real (MapType1Select Mask@20 x@@14 f_7)) FullPerm)))) (and (=> (= (ControlFlow 0 12) 9) anon120_Then_correct) (=> (= (ControlFlow 0 12) 11) anon120_Else_correct)))))
(let ((anon119_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 15) 12)) anon77_correct)))
(let ((anon119_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 13) (- 0 14)) (<= FullPerm (U_2_real (MapType1Select Mask@20 x@@14 f_7)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@20 x@@14 f_7))) (=> (= (ControlFlow 0 13) 12) anon77_correct))))))
(let ((anon75_correct  (=> (= Mask@19 (MapType1Store Mask@18 x@@14 g (real_2_U (- (U_2_real (MapType1Select Mask@18 x@@14 g)) FullPerm)))) (=> (and (and (and (state ExhaleHeap@0 Mask@19) (not (= x@@14 null))) (and (= Mask@20 (MapType1Store Mask@19 x@@14 g (real_2_U (+ (U_2_real (MapType1Select Mask@19 x@@14 g)) FullPerm)))) (state ExhaleHeap@0 Mask@20))) (and (and (state ExhaleHeap@0 Mask@20) (IdenticalOnKnownLocations ExhaleHeap@0 ExhaleHeap@1 Mask@20)) (and (state ExhaleHeap@1 Mask@20) (state ExhaleHeap@1 Mask@20)))) (and (=> (= (ControlFlow 0 16) 13) anon119_Then_correct) (=> (= (ControlFlow 0 16) 15) anon119_Else_correct))))))
(let ((anon118_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 19) 16)) anon75_correct)))
(let ((anon118_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 17) (- 0 18)) (<= FullPerm (U_2_real (MapType1Select Mask@18 x@@14 g)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@18 x@@14 g))) (=> (= (ControlFlow 0 17) 16) anon75_correct))))))
(let ((anon73_correct  (=> (and (= Mask@14 (MapType1Store Mask@13 x@@14 g (real_2_U (- (U_2_real (MapType1Select Mask@13 x@@14 g)) FullPerm)))) (state Heap@6 Mask@14)) (=> (and (and (not (= x@@14 null)) (= Mask@15 (MapType1Store Mask@14 x@@14 f_7 (real_2_U (+ (U_2_real (MapType1Select Mask@14 x@@14 f_7)) FullPerm))))) (and (state Heap@6 Mask@15) (not (= x@@14 null)))) (=> (and (and (and (= Mask@16 (MapType1Store Mask@15 x@@14 g (real_2_U (+ (U_2_real (MapType1Select Mask@15 x@@14 g)) FullPerm)))) (state Heap@6 Mask@16)) (and (= Mask@17 (MapType1Store Mask@16 null (wand_5 x@@14 FullPerm x@@14 FullPerm) (real_2_U (+ (U_2_real (MapType1Select Mask@16 null (wand_5 x@@14 FullPerm x@@14 FullPerm))) FullPerm)))) (state Heap@6 Mask@17))) (and (and (state Heap@6 Mask@17) (IdenticalOnKnownLocations Heap@6 ExhaleHeap@0 Mask@17)) (and (state ExhaleHeap@0 Mask@17) (state ExhaleHeap@0 Mask@17)))) (and (=> (= (ControlFlow 0 20) (- 0 21)) (<= FullPerm (U_2_real (MapType1Select Mask@17 null (wand_5 x@@14 FullPerm x@@14 FullPerm))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@17 null (wand_5 x@@14 FullPerm x@@14 FullPerm)))) (=> (and (= Mask@18 (MapType1Store Mask@17 null (wand_5 x@@14 FullPerm x@@14 FullPerm) (real_2_U (- (U_2_real (MapType1Select Mask@17 null (wand_5 x@@14 FullPerm x@@14 FullPerm))) FullPerm)))) (state ExhaleHeap@0 Mask@18)) (and (=> (= (ControlFlow 0 20) 17) anon118_Then_correct) (=> (= (ControlFlow 0 20) 19) anon118_Else_correct))))))))))
(let ((anon117_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 24) 20)) anon73_correct)))
(let ((anon117_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 22) (- 0 23)) (<= FullPerm (U_2_real (MapType1Select Mask@13 x@@14 g)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@13 x@@14 g))) (=> (= (ControlFlow 0 22) 20) anon73_correct))))))
(let ((anon71_correct  (=> (= Mask@13 (MapType1Store Mask@12 x@@14 f_7 (real_2_U (- (U_2_real (MapType1Select Mask@12 x@@14 f_7)) FullPerm)))) (and (=> (= (ControlFlow 0 25) 22) anon117_Then_correct) (=> (= (ControlFlow 0 25) 24) anon117_Else_correct)))))
(let ((anon116_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 28) 25)) anon71_correct)))
(let ((anon116_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 26) (- 0 27)) (<= FullPerm (U_2_real (MapType1Select Mask@12 x@@14 f_7)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@12 x@@14 f_7))) (=> (= (ControlFlow 0 26) 25) anon71_correct))))))
(let ((anon69_correct  (and (=> (= (ControlFlow 0 29) (- 0 31)) (=> (and (and b_18@14 b_18@14) b_23@16) (and (= neededTransfer@17 0.0) (= (U_2_real (MapType1Select Used_11Mask@11 null (wand_5 x@@14 FullPerm x@@14 FullPerm))) initNeededTransfer@3)))) (=> (=> (and (and b_18@14 b_18@14) b_23@16) (and (= neededTransfer@17 0.0) (= (U_2_real (MapType1Select Used_11Mask@11 null (wand_5 x@@14 FullPerm x@@14 FullPerm))) initNeededTransfer@3))) (=> (and (= b_26@0  (and b_18@14 b_23@16)) (= b_26@1  (and b_26@0 (state Result_8Heap Result_8Mask)))) (=> (and (and (and (= b_26@2  (and b_26@1 (sumMask Result_8Mask Ops_9Mask Used_11Mask@11))) (= b_26@3  (and (and b_26@2 (IdenticalOnKnownLocations Ops_9Heap@3 Result_8Heap Ops_9Mask)) (IdenticalOnKnownLocations Used_11Heap@0 Result_8Heap Used_11Mask@11)))) (and (= b_26@4  (and b_26@3 (state Result_8Heap Result_8Mask))) (= b_18@15  (and b_18@14 b_26@4)))) (and (and (= Mask@11 (MapType1Store Mask@10 null (wand_4 x@@14 FullPerm x@@14 FullPerm x@@14 FullPerm x@@14 FullPerm x@@14 FullPerm x@@14 FullPerm) (real_2_U (+ (U_2_real (MapType1Select Mask@10 null (wand_4 x@@14 FullPerm x@@14 FullPerm x@@14 FullPerm x@@14 FullPerm x@@14 FullPerm x@@14 FullPerm))) FullPerm)))) (state Heap@6 Mask@11)) (and (state Heap@6 Mask@11) (state Heap@6 Mask@11)))) (and (=> (= (ControlFlow 0 29) (- 0 30)) (<= FullPerm (U_2_real (MapType1Select Mask@11 null (wand_4 x@@14 FullPerm x@@14 FullPerm x@@14 FullPerm x@@14 FullPerm x@@14 FullPerm x@@14 FullPerm))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@11 null (wand_4 x@@14 FullPerm x@@14 FullPerm x@@14 FullPerm x@@14 FullPerm x@@14 FullPerm x@@14 FullPerm)))) (=> (and (= Mask@12 (MapType1Store Mask@11 null (wand_4 x@@14 FullPerm x@@14 FullPerm x@@14 FullPerm x@@14 FullPerm x@@14 FullPerm x@@14 FullPerm) (real_2_U (- (U_2_real (MapType1Select Mask@11 null (wand_4 x@@14 FullPerm x@@14 FullPerm x@@14 FullPerm x@@14 FullPerm x@@14 FullPerm x@@14 FullPerm))) FullPerm)))) (state Heap@6 Mask@12)) (and (=> (= (ControlFlow 0 29) 26) anon116_Then_correct) (=> (= (ControlFlow 0 29) 28) anon116_Else_correct)))))))))))
(let ((anon115_Else_correct  (=> (and (>= 0.0 takeTransfer@8) (= neededTransfer@17 neededTransfer@15)) (=> (and (and (= b_23@16 b_23@14) (= Mask@10 Mask@8)) (and (= Used_11Mask@11 Used_11Mask@9) (= (ControlFlow 0 34) 29))) anon69_correct))))
(let ((anon115_Then_correct  (=> (and (> takeTransfer@8 0.0) (= neededTransfer@16 (- neededTransfer@15 takeTransfer@8))) (=> (and (and (and (= Used_11Mask@10 (MapType1Store Used_11Mask@9 null (wand_5 x@@14 FullPerm x@@14 FullPerm) (real_2_U (+ (U_2_real (MapType1Select Used_11Mask@9 null (wand_5 x@@14 FullPerm x@@14 FullPerm))) takeTransfer@8)))) (= b_23@15  (and b_23@14 (state Used_11Heap@0 Used_11Mask@10)))) (and (= Mask@9 (MapType1Store Mask@8 null (wand_5 x@@14 FullPerm x@@14 FullPerm) (real_2_U (- (U_2_real (MapType1Select Mask@8 null (wand_5 x@@14 FullPerm x@@14 FullPerm))) takeTransfer@8)))) (= neededTransfer@17 neededTransfer@16))) (and (and (= b_23@16 b_23@15) (= Mask@10 Mask@9)) (and (= Used_11Mask@11 Used_11Mask@10) (= (ControlFlow 0 33) 29)))) anon69_correct))))
(let ((anon114_Else_correct  (=> (and (< maskTransfer@8 neededTransfer@15) (= takeTransfer@8 maskTransfer@8)) (and (=> (= (ControlFlow 0 36) 33) anon115_Then_correct) (=> (= (ControlFlow 0 36) 34) anon115_Else_correct)))))
(let ((anon114_Then_correct  (=> (and (<= neededTransfer@15 maskTransfer@8) (= takeTransfer@8 neededTransfer@15)) (and (=> (= (ControlFlow 0 35) 33) anon115_Then_correct) (=> (= (ControlFlow 0 35) 34) anon115_Else_correct)))))
(let ((anon113_Then_correct  (=> (and (and (and (and (and b_18@14 b_18@14) b_23@14) true) (> neededTransfer@15 0.0)) (= maskTransfer@8 (U_2_real (MapType1Select Mask@8 null (wand_5 x@@14 FullPerm x@@14 FullPerm))))) (and (=> (= (ControlFlow 0 37) 35) anon114_Then_correct) (=> (= (ControlFlow 0 37) 36) anon114_Else_correct)))))
(let ((anon113_Else_correct  (=> (and (not (and (and (and (and b_18@14 b_18@14) b_23@14) true) (> neededTransfer@15 0.0))) (= neededTransfer@17 neededTransfer@15)) (=> (and (and (= b_23@16 b_23@14) (= Mask@10 Mask@8)) (and (= Used_11Mask@11 Used_11Mask@9) (= (ControlFlow 0 32) 29))) anon69_correct))))
(let ((anon112_Else_correct  (=> (and (and (>= 0.0 takeTransfer@7) (= Used_11Mask@9 Used_11Mask@7)) (and (= b_23@14 b_23@12) (= neededTransfer@15 1.0))) (and (=> (= (ControlFlow 0 40) 37) anon113_Then_correct) (=> (= (ControlFlow 0 40) 32) anon113_Else_correct)))))
(let ((anon112_Then_correct  (=> (and (and (and (> takeTransfer@7 0.0) (= neededTransfer@14 (- 1.0 takeTransfer@7))) (and (= Used_11Mask@8 (MapType1Store Used_11Mask@7 null (wand_5 x@@14 FullPerm x@@14 FullPerm) (real_2_U (+ (U_2_real (MapType1Select Used_11Mask@7 null (wand_5 x@@14 FullPerm x@@14 FullPerm))) takeTransfer@7)))) (= b_23@13  (and b_23@12 (state Used_11Heap@0 Used_11Mask@8))))) (and (and (= Ops_9Mask@12 (MapType1Store Ops_9Mask@11 null (wand_5 x@@14 FullPerm x@@14 FullPerm) (real_2_U (- (U_2_real (MapType1Select Ops_9Mask@11 null (wand_5 x@@14 FullPerm x@@14 FullPerm))) takeTransfer@7)))) (= Used_11Mask@9 Used_11Mask@8)) (and (= b_23@14 b_23@13) (= neededTransfer@15 neededTransfer@14)))) (and (=> (= (ControlFlow 0 39) 37) anon113_Then_correct) (=> (= (ControlFlow 0 39) 32) anon113_Else_correct)))))
(let ((anon111_Else_correct  (=> (and (< maskTransfer@7 1.0) (= takeTransfer@7 maskTransfer@7)) (and (=> (= (ControlFlow 0 42) 39) anon112_Then_correct) (=> (= (ControlFlow 0 42) 40) anon112_Else_correct)))))
(let ((anon111_Then_correct  (=> (and (<= 1.0 maskTransfer@7) (= takeTransfer@7 1.0)) (and (=> (= (ControlFlow 0 41) 39) anon112_Then_correct) (=> (= (ControlFlow 0 41) 40) anon112_Else_correct)))))
(let ((anon110_Then_correct  (=> (and (and (and (and (and b_18@14 b_18@14) b_23@12) true) (> 1.0 0.0)) (= maskTransfer@7 (U_2_real (MapType1Select Ops_9Mask@11 null (wand_5 x@@14 FullPerm x@@14 FullPerm))))) (and (=> (= (ControlFlow 0 43) 41) anon111_Then_correct) (=> (= (ControlFlow 0 43) 42) anon111_Else_correct)))))
(let ((anon110_Else_correct  (=> (and (and (not (and (and (and (and b_18@14 b_18@14) b_23@12) true) (> 1.0 0.0))) (= Used_11Mask@9 Used_11Mask@7)) (and (= b_23@14 b_23@12) (= neededTransfer@15 1.0))) (and (=> (= (ControlFlow 0 38) 37) anon113_Then_correct) (=> (= (ControlFlow 0 38) 32) anon113_Else_correct)))))
(let ((anon57_correct  (=> (= initNeededTransfer@3 (+ (U_2_real (MapType1Select Used_11Mask@7 null (wand_5 x@@14 FullPerm x@@14 FullPerm))) 1.0)) (and (=> (= (ControlFlow 0 44) (- 0 45)) (>= 1.0 0.0)) (=> (>= 1.0 0.0) (and (=> (= (ControlFlow 0 44) 43) anon110_Then_correct) (=> (= (ControlFlow 0 44) 38) anon110_Else_correct)))))))
(let ((anon108_Then_correct  (=> b_18@14 (and (=> (= (ControlFlow 0 49) 48) anon109_Then_correct) (=> (= (ControlFlow 0 49) 44) anon57_correct)))))
(let ((anon108_Else_correct  (=> (and (not b_18@14) (= (ControlFlow 0 47) 44)) anon57_correct)))
(let ((anon107_Then_correct  (=> (and (and b_18@14 b_18@14) b_23@12) (and (=> (= (ControlFlow 0 50) 49) anon108_Then_correct) (=> (= (ControlFlow 0 50) 47) anon108_Else_correct)))))
(let ((anon107_Else_correct  (=> (and (not (and (and b_18@14 b_18@14) b_23@12)) (= (ControlFlow 0 46) 44)) anon57_correct)))
(let ((anon53_correct  (and (=> (= (ControlFlow 0 51) (- 0 52)) (=> (and (and b_18@13 b_18@13) b_23@12) (and (= neededTransfer@13 0.0) (= (U_2_real (MapType1Select Used_11Mask@7 x@@14 g)) initNeededTransfer@2)))) (=> (=> (and (and b_18@13 b_18@13) b_23@12) (and (= neededTransfer@13 0.0) (= (U_2_real (MapType1Select Used_11Mask@7 x@@14 g)) initNeededTransfer@2))) (=> (and (= b_25@0  (and b_18@13 b_23@12)) (= b_25@1  (and b_25@0 (state Result_7Heap Result_7Mask)))) (=> (and (and (= b_25@2  (and b_25@1 (sumMask Result_7Mask Ops_9Mask@11 Used_11Mask@7))) (= b_25@3  (and (and b_25@2 (IdenticalOnKnownLocations Ops_9Heap@3 Result_7Heap Ops_9Mask@11)) (IdenticalOnKnownLocations Used_11Heap@0 Result_7Heap Used_11Mask@7)))) (and (= b_25@4  (and b_25@3 (state Result_7Heap Result_7Mask))) (= b_18@14  (and b_18@13 b_25@4)))) (and (=> (= (ControlFlow 0 51) 50) anon107_Then_correct) (=> (= (ControlFlow 0 51) 46) anon107_Else_correct))))))))
(let ((anon106_Else_correct  (=> (>= 0.0 takeTransfer@6) (=> (and (= neededTransfer@13 neededTransfer@11) (= Heap@6 Heap@4)) (=> (and (and (= Mask@8 Mask@6) (= b_23@12 b_23@9)) (and (= Used_11Mask@7 Used_11Mask@5) (= (ControlFlow 0 55) 51))) anon53_correct)))))
(let ((anon106_Then_correct  (=> (> takeTransfer@6 0.0) (=> (and (and (= neededTransfer@12 (- neededTransfer@11 takeTransfer@6)) (= Used_11Mask@6 (MapType1Store Used_11Mask@5 x@@14 g (real_2_U (+ (U_2_real (MapType1Select Used_11Mask@5 x@@14 g)) takeTransfer@6))))) (and (= b_23@10  (and b_23@9 (state Used_11Heap@0 Used_11Mask@6))) (= b_23@11  (and b_23@10 (= (U_2_int (MapType0Select Heap@4 x@@14 g)) (U_2_int (MapType0Select Used_11Heap@0 x@@14 g))))))) (=> (and (and (and (= Mask@7 (MapType1Store Mask@6 x@@14 g (real_2_U (- (U_2_real (MapType1Select Mask@6 x@@14 g)) takeTransfer@6)))) (= Heap@5 (MapType0Store Heap@4 null (|wand_4#sm| x@@14 FullPerm x@@14 FullPerm x@@14 FullPerm x@@14 FullPerm x@@14 FullPerm x@@14 FullPerm) (MapType1Store (MapType0Select Heap@4 null (|wand_4#sm| x@@14 FullPerm x@@14 FullPerm x@@14 FullPerm x@@14 FullPerm x@@14 FullPerm x@@14 FullPerm)) x@@14 g (bool_2_U true))))) (and (= neededTransfer@13 neededTransfer@12) (= Heap@6 Heap@5))) (and (and (= Mask@8 Mask@7) (= b_23@12 b_23@11)) (and (= Used_11Mask@7 Used_11Mask@6) (= (ControlFlow 0 54) 51)))) anon53_correct)))))
(let ((anon105_Else_correct  (=> (and (< maskTransfer@6 neededTransfer@11) (= takeTransfer@6 maskTransfer@6)) (and (=> (= (ControlFlow 0 57) 54) anon106_Then_correct) (=> (= (ControlFlow 0 57) 55) anon106_Else_correct)))))
(let ((anon105_Then_correct  (=> (and (<= neededTransfer@11 maskTransfer@6) (= takeTransfer@6 neededTransfer@11)) (and (=> (= (ControlFlow 0 56) 54) anon106_Then_correct) (=> (= (ControlFlow 0 56) 55) anon106_Else_correct)))))
(let ((anon104_Then_correct  (=> (and (and (and (and (and b_18@13 b_18@13) b_23@9) true) (> neededTransfer@11 0.0)) (= maskTransfer@6 (U_2_real (MapType1Select Mask@6 x@@14 g)))) (and (=> (= (ControlFlow 0 58) 56) anon105_Then_correct) (=> (= (ControlFlow 0 58) 57) anon105_Else_correct)))))
(let ((anon104_Else_correct  (=> (not (and (and (and (and b_18@13 b_18@13) b_23@9) true) (> neededTransfer@11 0.0))) (=> (and (= neededTransfer@13 neededTransfer@11) (= Heap@6 Heap@4)) (=> (and (and (= Mask@8 Mask@6) (= b_23@12 b_23@9)) (and (= Used_11Mask@7 Used_11Mask@5) (= (ControlFlow 0 53) 51))) anon53_correct)))))
(let ((anon103_Else_correct  (=> (>= 0.0 takeTransfer@5) (=> (and (and (= Used_11Mask@5 Used_11Mask@3) (= b_23@9 b_23@6)) (and (= neededTransfer@11 FullPerm) (= Ops_9Mask@11 Ops_9Mask@9))) (and (=> (= (ControlFlow 0 61) 58) anon104_Then_correct) (=> (= (ControlFlow 0 61) 53) anon104_Else_correct))))))
(let ((anon103_Then_correct  (=> (and (> takeTransfer@5 0.0) (= neededTransfer@10 (- FullPerm takeTransfer@5))) (=> (and (and (and (= Used_11Mask@4 (MapType1Store Used_11Mask@3 x@@14 g (real_2_U (+ (U_2_real (MapType1Select Used_11Mask@3 x@@14 g)) takeTransfer@5)))) (= b_23@7  (and b_23@6 (state Used_11Heap@0 Used_11Mask@4)))) (and (= b_23@8  (and b_23@7 (= (U_2_int (MapType0Select Ops_9Heap@3 x@@14 g)) (U_2_int (MapType0Select Used_11Heap@0 x@@14 g))))) (= Ops_9Mask@10 (MapType1Store Ops_9Mask@9 x@@14 g (real_2_U (- (U_2_real (MapType1Select Ops_9Mask@9 x@@14 g)) takeTransfer@5)))))) (and (and (= Used_11Mask@5 Used_11Mask@4) (= b_23@9 b_23@8)) (and (= neededTransfer@11 neededTransfer@10) (= Ops_9Mask@11 Ops_9Mask@10)))) (and (=> (= (ControlFlow 0 60) 58) anon104_Then_correct) (=> (= (ControlFlow 0 60) 53) anon104_Else_correct))))))
(let ((anon102_Else_correct  (=> (and (< maskTransfer@5 FullPerm) (= takeTransfer@5 maskTransfer@5)) (and (=> (= (ControlFlow 0 63) 60) anon103_Then_correct) (=> (= (ControlFlow 0 63) 61) anon103_Else_correct)))))
(let ((anon102_Then_correct  (=> (and (<= FullPerm maskTransfer@5) (= takeTransfer@5 FullPerm)) (and (=> (= (ControlFlow 0 62) 60) anon103_Then_correct) (=> (= (ControlFlow 0 62) 61) anon103_Else_correct)))))
(let ((anon101_Then_correct  (=> (and (and (and (and (and b_18@13 b_18@13) b_23@6) true) (> FullPerm 0.0)) (= maskTransfer@5 (U_2_real (MapType1Select Ops_9Mask@9 x@@14 g)))) (and (=> (= (ControlFlow 0 64) 62) anon102_Then_correct) (=> (= (ControlFlow 0 64) 63) anon102_Else_correct)))))
(let ((anon101_Else_correct  (=> (not (and (and (and (and b_18@13 b_18@13) b_23@6) true) (> FullPerm 0.0))) (=> (and (and (= Used_11Mask@5 Used_11Mask@3) (= b_23@9 b_23@6)) (and (= neededTransfer@11 FullPerm) (= Ops_9Mask@11 Ops_9Mask@9))) (and (=> (= (ControlFlow 0 59) 58) anon104_Then_correct) (=> (= (ControlFlow 0 59) 53) anon104_Else_correct))))))
(let ((anon41_correct  (and (=> (= (ControlFlow 0 65) (- 0 67)) (=> (and (and b_18@12 b_18@12) b_23@6) (and (= neededTransfer@9 0.0) (= (U_2_real (MapType1Select Used_11Mask@3 x@@14 f_7)) initNeededTransfer@1)))) (=> (=> (and (and b_18@12 b_18@12) b_23@6) (and (= neededTransfer@9 0.0) (= (U_2_real (MapType1Select Used_11Mask@3 x@@14 f_7)) initNeededTransfer@1))) (=> (= b_24@0  (and b_18@12 b_23@6)) (=> (and (= b_24@1  (and b_24@0 (state Result_6Heap Result_6Mask))) (= b_24@2  (and b_24@1 (sumMask Result_6Mask Ops_9Mask@9 Used_11Mask@3)))) (=> (and (and (= b_24@3  (and (and b_24@2 (IdenticalOnKnownLocations Ops_9Heap@3 Result_6Heap Ops_9Mask@9)) (IdenticalOnKnownLocations Used_11Heap@0 Result_6Heap Used_11Mask@3))) (= b_24@4  (and b_24@3 (state Result_6Heap Result_6Mask)))) (and (= b_18@13  (and b_18@12 b_24@4)) (= initNeededTransfer@2 (+ (U_2_real (MapType1Select Used_11Mask@3 x@@14 g)) FullPerm)))) (and (=> (= (ControlFlow 0 65) (- 0 66)) (>= FullPerm 0.0)) (=> (>= FullPerm 0.0) (and (=> (= (ControlFlow 0 65) 64) anon101_Then_correct) (=> (= (ControlFlow 0 65) 59) anon101_Else_correct)))))))))))
(let ((anon100_Else_correct  (=> (>= 0.0 takeTransfer@4) (=> (and (= neededTransfer@9 neededTransfer@7) (= Mask@6 Mask@4)) (=> (and (and (= Heap@4 Heap@2) (= b_23@6 b_23@3)) (and (= Used_11Mask@3 Used_11Mask@1) (= (ControlFlow 0 70) 65))) anon41_correct)))))
(let ((anon100_Then_correct  (=> (> takeTransfer@4 0.0) (=> (and (and (= neededTransfer@8 (- neededTransfer@7 takeTransfer@4)) (= Used_11Mask@2 (MapType1Store Used_11Mask@1 x@@14 f_7 (real_2_U (+ (U_2_real (MapType1Select Used_11Mask@1 x@@14 f_7)) takeTransfer@4))))) (and (= b_23@4  (and b_23@3 (state Used_11Heap@0 Used_11Mask@2))) (= b_23@5  (and b_23@4 (= (U_2_int (MapType0Select Heap@2 x@@14 f_7)) (U_2_int (MapType0Select Used_11Heap@0 x@@14 f_7))))))) (=> (and (and (and (= Mask@5 (MapType1Store Mask@4 x@@14 f_7 (real_2_U (- (U_2_real (MapType1Select Mask@4 x@@14 f_7)) takeTransfer@4)))) (= Heap@3 (MapType0Store Heap@2 null (|wand_4#sm| x@@14 FullPerm x@@14 FullPerm x@@14 FullPerm x@@14 FullPerm x@@14 FullPerm x@@14 FullPerm) (MapType1Store (MapType0Select Heap@2 null (|wand_4#sm| x@@14 FullPerm x@@14 FullPerm x@@14 FullPerm x@@14 FullPerm x@@14 FullPerm x@@14 FullPerm)) x@@14 f_7 (bool_2_U true))))) (and (= neededTransfer@9 neededTransfer@8) (= Mask@6 Mask@5))) (and (and (= Heap@4 Heap@3) (= b_23@6 b_23@5)) (and (= Used_11Mask@3 Used_11Mask@2) (= (ControlFlow 0 69) 65)))) anon41_correct)))))
(let ((anon99_Else_correct  (=> (and (< maskTransfer@4 neededTransfer@7) (= takeTransfer@4 maskTransfer@4)) (and (=> (= (ControlFlow 0 72) 69) anon100_Then_correct) (=> (= (ControlFlow 0 72) 70) anon100_Else_correct)))))
(let ((anon99_Then_correct  (=> (and (<= neededTransfer@7 maskTransfer@4) (= takeTransfer@4 neededTransfer@7)) (and (=> (= (ControlFlow 0 71) 69) anon100_Then_correct) (=> (= (ControlFlow 0 71) 70) anon100_Else_correct)))))
(let ((anon98_Then_correct  (=> (and (and (and (and (and b_18@12 b_18@12) b_23@3) true) (> neededTransfer@7 0.0)) (= maskTransfer@4 (U_2_real (MapType1Select Mask@4 x@@14 f_7)))) (and (=> (= (ControlFlow 0 73) 71) anon99_Then_correct) (=> (= (ControlFlow 0 73) 72) anon99_Else_correct)))))
(let ((anon98_Else_correct  (=> (not (and (and (and (and b_18@12 b_18@12) b_23@3) true) (> neededTransfer@7 0.0))) (=> (and (= neededTransfer@9 neededTransfer@7) (= Mask@6 Mask@4)) (=> (and (and (= Heap@4 Heap@2) (= b_23@6 b_23@3)) (and (= Used_11Mask@3 Used_11Mask@1) (= (ControlFlow 0 68) 65))) anon41_correct)))))
(let ((anon97_Else_correct  (=> (>= 0.0 takeTransfer@3) (=> (and (and (= Ops_9Mask@9 Ops_9Mask@7) (= Used_11Mask@1 ZeroMask)) (and (= b_23@3 b_23@0) (= neededTransfer@7 FullPerm))) (and (=> (= (ControlFlow 0 76) 73) anon98_Then_correct) (=> (= (ControlFlow 0 76) 68) anon98_Else_correct))))))
(let ((anon97_Then_correct  (=> (and (> takeTransfer@3 0.0) (= neededTransfer@6 (- FullPerm takeTransfer@3))) (=> (and (and (and (= Used_11Mask@0 (MapType1Store ZeroMask x@@14 f_7 (real_2_U (+ (U_2_real (MapType1Select ZeroMask x@@14 f_7)) takeTransfer@3)))) (= b_23@1  (and b_23@0 (state Used_11Heap@0 Used_11Mask@0)))) (and (= b_23@2  (and b_23@1 (= (U_2_int (MapType0Select Ops_9Heap@3 x@@14 f_7)) (U_2_int (MapType0Select Used_11Heap@0 x@@14 f_7))))) (= Ops_9Mask@8 (MapType1Store Ops_9Mask@7 x@@14 f_7 (real_2_U (- (U_2_real (MapType1Select Ops_9Mask@7 x@@14 f_7)) takeTransfer@3)))))) (and (and (= Ops_9Mask@9 Ops_9Mask@8) (= Used_11Mask@1 Used_11Mask@0)) (and (= b_23@3 b_23@2) (= neededTransfer@7 neededTransfer@6)))) (and (=> (= (ControlFlow 0 75) 73) anon98_Then_correct) (=> (= (ControlFlow 0 75) 68) anon98_Else_correct))))))
(let ((anon96_Else_correct  (=> (and (< maskTransfer@3 FullPerm) (= takeTransfer@3 maskTransfer@3)) (and (=> (= (ControlFlow 0 78) 75) anon97_Then_correct) (=> (= (ControlFlow 0 78) 76) anon97_Else_correct)))))
(let ((anon96_Then_correct  (=> (and (<= FullPerm maskTransfer@3) (= takeTransfer@3 FullPerm)) (and (=> (= (ControlFlow 0 77) 75) anon97_Then_correct) (=> (= (ControlFlow 0 77) 76) anon97_Else_correct)))))
(let ((anon95_Then_correct  (=> (and (and (and (and (and b_18@12 b_18@12) b_23@0) true) (> FullPerm 0.0)) (= maskTransfer@3 (U_2_real (MapType1Select Ops_9Mask@7 x@@14 f_7)))) (and (=> (= (ControlFlow 0 79) 77) anon96_Then_correct) (=> (= (ControlFlow 0 79) 78) anon96_Else_correct)))))
(let ((anon95_Else_correct  (=> (not (and (and (and (and b_18@12 b_18@12) b_23@0) true) (> FullPerm 0.0))) (=> (and (and (= Ops_9Mask@9 Ops_9Mask@7) (= Used_11Mask@1 ZeroMask)) (and (= b_23@3 b_23@0) (= neededTransfer@7 FullPerm))) (and (=> (= (ControlFlow 0 74) 73) anon98_Then_correct) (=> (= (ControlFlow 0 74) 68) anon98_Else_correct))))))
(let ((anon29_correct  (=> (and (= b_23@0  (and b_23 (state Used_11Heap@0 ZeroMask))) (= initNeededTransfer@1 (+ (U_2_real (MapType1Select ZeroMask x@@14 f_7)) FullPerm))) (and (=> (= (ControlFlow 0 80) (- 0 81)) (>= FullPerm 0.0)) (=> (>= FullPerm 0.0) (and (=> (= (ControlFlow 0 80) 79) anon95_Then_correct) (=> (= (ControlFlow 0 80) 74) anon95_Else_correct)))))))
(let ((anon28_correct  (and (=> (= (ControlFlow 0 83) (- 0 84)) (=> (and (and b_20@5 (and b_20@5 b_18@8)) b_21@9) (and (= neededTransfer@5 0.0) (= (U_2_real (MapType1Select Used_10Mask@5 x@@14 g)) initNeededTransfer@0)))) (=> (=> (and (and b_20@5 (and b_20@5 b_18@8)) b_21@9) (and (= neededTransfer@5 0.0) (= (U_2_real (MapType1Select Used_10Mask@5 x@@14 g)) initNeededTransfer@0))) (=> (and (and (and (and (= b_22@0  (and b_20@5 b_21@9)) (= b_22@1  (and b_22@0 (state Result_5Heap Result_5Mask)))) (and (= b_22@2  (and b_22@1 (sumMask Result_5Mask Ops_11Mask Used_10Mask@5))) (= b_22@3  (and (and b_22@2 (IdenticalOnKnownLocations Ops_11Heap@0 Result_5Heap Ops_11Mask)) (IdenticalOnKnownLocations Used_10Heap@0 Result_5Heap Used_10Mask@5))))) (and (and (= b_22@4  (and b_22@3 (state Result_5Heap Result_5Mask))) (= b_20@6  (and b_20@5 b_22@4))) (and (= Ops_9Mask@6 (MapType1Store Ops_9Mask@5 null (wand_5 x@@14 FullPerm x@@14 FullPerm) (real_2_U (+ (U_2_real (MapType1Select Ops_9Mask@5 null (wand_5 x@@14 FullPerm x@@14 FullPerm))) FullPerm)))) (= b_18@9  (and b_18@8 (state Ops_9Heap@2 Ops_9Mask@6)))))) (and (and (and (= b_18@10  (and b_18@9 (state Ops_9Heap@2 Ops_9Mask@6))) (= b_18@11  (and b_18@10 (state Ops_9Heap@2 Ops_9Mask@6)))) (and (= b_18@12 b_18@11) (= Mask@4 Mask@3))) (and (and (= Ops_9Mask@7 Ops_9Mask@6) (= Ops_9Heap@3 Ops_9Heap@2)) (and (= Heap@2 Heap@1) (= (ControlFlow 0 83) 80))))) anon29_correct)))))
(let ((anon94_Else_correct  (=> (>= 0.0 takeTransfer@2) (=> (and (= Mask@3 Mask@1) (= Used_10Mask@5 Used_10Mask@3)) (=> (and (and (= b_21@9 b_21@6) (= neededTransfer@5 neededTransfer@3)) (and (= Heap@1 Heap@@10) (= (ControlFlow 0 87) 83))) anon28_correct)))))
(let ((anon94_Then_correct  (=> (> takeTransfer@2 0.0) (=> (and (and (= neededTransfer@4 (- neededTransfer@3 takeTransfer@2)) (= Used_10Mask@4 (MapType1Store Used_10Mask@3 x@@14 g (real_2_U (+ (U_2_real (MapType1Select Used_10Mask@3 x@@14 g)) takeTransfer@2))))) (and (= b_21@7  (and b_21@6 (state Used_10Heap@0 Used_10Mask@4))) (= b_21@8  (and b_21@7 (= (U_2_int (MapType0Select Heap@@10 x@@14 g)) (U_2_int (MapType0Select Used_10Heap@0 x@@14 g))))))) (=> (and (and (and (= Mask@2 (MapType1Store Mask@1 x@@14 g (real_2_U (- (U_2_real (MapType1Select Mask@1 x@@14 g)) takeTransfer@2)))) (= Heap@0 (MapType0Store Heap@@10 null (|wand_5#sm| x@@14 FullPerm x@@14 FullPerm) (MapType1Store (MapType0Select Heap@@10 null (|wand_5#sm| x@@14 FullPerm x@@14 FullPerm)) x@@14 g (bool_2_U true))))) (and (= Mask@3 Mask@2) (= Used_10Mask@5 Used_10Mask@4))) (and (and (= b_21@9 b_21@8) (= neededTransfer@5 neededTransfer@4)) (and (= Heap@1 Heap@0) (= (ControlFlow 0 86) 83)))) anon28_correct)))))
(let ((anon93_Else_correct  (=> (and (< maskTransfer@2 neededTransfer@3) (= takeTransfer@2 maskTransfer@2)) (and (=> (= (ControlFlow 0 89) 86) anon94_Then_correct) (=> (= (ControlFlow 0 89) 87) anon94_Else_correct)))))
(let ((anon93_Then_correct  (=> (and (<= neededTransfer@3 maskTransfer@2) (= takeTransfer@2 neededTransfer@3)) (and (=> (= (ControlFlow 0 88) 86) anon94_Then_correct) (=> (= (ControlFlow 0 88) 87) anon94_Else_correct)))))
(let ((anon92_Then_correct  (=> (and (and (and (and (and b_20@5 (and b_20@5 b_18@8)) b_21@6) true) (> neededTransfer@3 0.0)) (= maskTransfer@2 (U_2_real (MapType1Select Mask@1 x@@14 g)))) (and (=> (= (ControlFlow 0 90) 88) anon93_Then_correct) (=> (= (ControlFlow 0 90) 89) anon93_Else_correct)))))
(let ((anon92_Else_correct  (=> (not (and (and (and (and b_20@5 (and b_20@5 b_18@8)) b_21@6) true) (> neededTransfer@3 0.0))) (=> (and (= Mask@3 Mask@1) (= Used_10Mask@5 Used_10Mask@3)) (=> (and (and (= b_21@9 b_21@6) (= neededTransfer@5 neededTransfer@3)) (and (= Heap@1 Heap@@10) (= (ControlFlow 0 85) 83))) anon28_correct)))))
(let ((anon91_Else_correct  (=> (and (>= 0.0 takeTransfer@1) (= Ops_9Heap@2 Ops_9Heap@0)) (=> (and (and (= Ops_9Mask@5 Ops_9Mask@3) (= neededTransfer@3 neededTransfer@1)) (and (= b_21@6 b_21@3) (= Used_10Mask@3 Used_10Mask@1))) (and (=> (= (ControlFlow 0 93) 90) anon92_Then_correct) (=> (= (ControlFlow 0 93) 85) anon92_Else_correct))))))
(let ((anon91_Then_correct  (=> (and (and (> takeTransfer@1 0.0) (= neededTransfer@2 (- neededTransfer@1 takeTransfer@1))) (and (= Used_10Mask@2 (MapType1Store Used_10Mask@1 x@@14 g (real_2_U (+ (U_2_real (MapType1Select Used_10Mask@1 x@@14 g)) takeTransfer@1)))) (= b_21@4  (and b_21@3 (state Used_10Heap@0 Used_10Mask@2))))) (=> (and (and (and (= b_21@5  (and b_21@4 (= (U_2_int (MapType0Select Ops_9Heap@0 x@@14 g)) (U_2_int (MapType0Select Used_10Heap@0 x@@14 g))))) (= Ops_9Mask@4 (MapType1Store Ops_9Mask@3 x@@14 g (real_2_U (- (U_2_real (MapType1Select Ops_9Mask@3 x@@14 g)) takeTransfer@1))))) (and (= Ops_9Heap@1 (MapType0Store Ops_9Heap@0 null (|wand_5#sm| x@@14 FullPerm x@@14 FullPerm) (MapType1Store (MapType0Select Ops_9Heap@0 null (|wand_5#sm| x@@14 FullPerm x@@14 FullPerm)) x@@14 g (bool_2_U true)))) (= Ops_9Heap@2 Ops_9Heap@1))) (and (and (= Ops_9Mask@5 Ops_9Mask@4) (= neededTransfer@3 neededTransfer@2)) (and (= b_21@6 b_21@5) (= Used_10Mask@3 Used_10Mask@2)))) (and (=> (= (ControlFlow 0 92) 90) anon92_Then_correct) (=> (= (ControlFlow 0 92) 85) anon92_Else_correct))))))
(let ((anon90_Else_correct  (=> (and (< maskTransfer@1 neededTransfer@1) (= takeTransfer@1 maskTransfer@1)) (and (=> (= (ControlFlow 0 95) 92) anon91_Then_correct) (=> (= (ControlFlow 0 95) 93) anon91_Else_correct)))))
(let ((anon90_Then_correct  (=> (and (<= neededTransfer@1 maskTransfer@1) (= takeTransfer@1 neededTransfer@1)) (and (=> (= (ControlFlow 0 94) 92) anon91_Then_correct) (=> (= (ControlFlow 0 94) 93) anon91_Else_correct)))))
(let ((anon89_Then_correct  (=> (and (and (and (and (and b_20@5 (and b_20@5 b_18@8)) b_21@3) true) (> neededTransfer@1 0.0)) (= maskTransfer@1 (U_2_real (MapType1Select Ops_9Mask@3 x@@14 g)))) (and (=> (= (ControlFlow 0 96) 94) anon90_Then_correct) (=> (= (ControlFlow 0 96) 95) anon90_Else_correct)))))
(let ((anon89_Else_correct  (=> (and (not (and (and (and (and b_20@5 (and b_20@5 b_18@8)) b_21@3) true) (> neededTransfer@1 0.0))) (= Ops_9Heap@2 Ops_9Heap@0)) (=> (and (and (= Ops_9Mask@5 Ops_9Mask@3) (= neededTransfer@3 neededTransfer@1)) (and (= b_21@6 b_21@3) (= Used_10Mask@3 Used_10Mask@1))) (and (=> (= (ControlFlow 0 91) 90) anon92_Then_correct) (=> (= (ControlFlow 0 91) 85) anon92_Else_correct))))))
(let ((anon88_Else_correct  (=> (and (and (>= 0.0 takeTransfer@0) (= Used_10Mask@1 ZeroMask)) (and (= b_21@3 b_21@0) (= neededTransfer@1 FullPerm))) (and (=> (= (ControlFlow 0 99) 96) anon89_Then_correct) (=> (= (ControlFlow 0 99) 91) anon89_Else_correct)))))
(let ((anon88_Then_correct  (=> (> takeTransfer@0 0.0) (=> (and (and (and (= neededTransfer@0 (- FullPerm takeTransfer@0)) (= Used_10Mask@0 (MapType1Store ZeroMask x@@14 g (real_2_U (+ (U_2_real (MapType1Select ZeroMask x@@14 g)) takeTransfer@0))))) (and (= b_21@1  (and b_21@0 (state Used_10Heap@0 Used_10Mask@0))) (= b_21@2  (and b_21@1 (= (U_2_int (MapType0Select Ops_11Heap@0 x@@14 g)) (U_2_int (MapType0Select Used_10Heap@0 x@@14 g))))))) (and (and (= Ops_11Mask@2 (MapType1Store Ops_11Mask@1 x@@14 g (real_2_U (- (U_2_real (MapType1Select Ops_11Mask@1 x@@14 g)) takeTransfer@0)))) (= Used_10Mask@1 Used_10Mask@0)) (and (= b_21@3 b_21@2) (= neededTransfer@1 neededTransfer@0)))) (and (=> (= (ControlFlow 0 98) 96) anon89_Then_correct) (=> (= (ControlFlow 0 98) 91) anon89_Else_correct))))))
(let ((anon87_Else_correct  (=> (and (< maskTransfer@0 FullPerm) (= takeTransfer@0 maskTransfer@0)) (and (=> (= (ControlFlow 0 101) 98) anon88_Then_correct) (=> (= (ControlFlow 0 101) 99) anon88_Else_correct)))))
(let ((anon87_Then_correct  (=> (and (<= FullPerm maskTransfer@0) (= takeTransfer@0 FullPerm)) (and (=> (= (ControlFlow 0 100) 98) anon88_Then_correct) (=> (= (ControlFlow 0 100) 99) anon88_Else_correct)))))
(let ((anon86_Then_correct  (=> (and (and (and (and (and b_20@5 (and b_20@5 b_18@8)) b_21@0) true) (> FullPerm 0.0)) (= maskTransfer@0 (U_2_real (MapType1Select Ops_11Mask@1 x@@14 g)))) (and (=> (= (ControlFlow 0 102) 100) anon87_Then_correct) (=> (= (ControlFlow 0 102) 101) anon87_Else_correct)))))
(let ((anon86_Else_correct  (=> (and (and (not (and (and (and (and b_20@5 (and b_20@5 b_18@8)) b_21@0) true) (> FullPerm 0.0))) (= Used_10Mask@1 ZeroMask)) (and (= b_21@3 b_21@0) (= neededTransfer@1 FullPerm))) (and (=> (= (ControlFlow 0 97) 96) anon89_Then_correct) (=> (= (ControlFlow 0 97) 91) anon89_Else_correct)))))
(let ((anon10_correct  (=> (and (and (= b_20@4  (and b_20@3 (state Ops_11Heap@0 Ops_11Mask@1))) (= b_20@5  (and b_20@4 (state Ops_11Heap@0 Ops_11Mask@1)))) (and (= b_21@0  (and b_21 (state Used_10Heap@0 ZeroMask))) (= initNeededTransfer@0 (+ (U_2_real (MapType1Select ZeroMask x@@14 g)) FullPerm)))) (and (=> (= (ControlFlow 0 103) (- 0 104)) (>= FullPerm 0.0)) (=> (>= FullPerm 0.0) (and (=> (= (ControlFlow 0 103) 102) anon86_Then_correct) (=> (= (ControlFlow 0 103) 97) anon86_Else_correct)))))))
(let ((anon85_Else_correct  (=> (and (and (not b_20@0) (= Ops_11Mask@1 ZeroMask)) (and (= b_20@3 b_20@0) (= (ControlFlow 0 106) 103))) anon10_correct)))
(let ((anon85_Then_correct  (=> b_20@0 (=> (and (= b_20@1  (and b_20@0 (not (= x@@14 null)))) (= Ops_11Mask@0 (MapType1Store ZeroMask x@@14 g (real_2_U (+ (U_2_real (MapType1Select ZeroMask x@@14 g)) FullPerm))))) (=> (and (and (= b_20@2  (and b_20@1 (state Ops_11Heap@0 Ops_11Mask@0))) (= Ops_11Mask@1 Ops_11Mask@0)) (and (= b_20@3 b_20@2) (= (ControlFlow 0 105) 103))) anon10_correct)))))
(let ((anon84_Then_correct  (=> b_18@8 (=> (and (= b_20@0  (and b_20 (state Ops_11Heap@0 ZeroMask))) (= b_19@0  (and b_19 (state Used_9Heap@0 ZeroMask)))) (and (=> (= (ControlFlow 0 107) 105) anon85_Then_correct) (=> (= (ControlFlow 0 107) 106) anon85_Else_correct))))))
(let ((anon84_Else_correct  (=> (not b_18@8) (=> (and (= b_18@12 b_18@8) (= Mask@4 Mask@1)) (=> (and (and (= Ops_9Mask@7 Ops_9Mask@3) (= Ops_9Heap@3 Ops_9Heap@0)) (and (= Heap@2 Heap@@10) (= (ControlFlow 0 82) 80))) anon29_correct)))))
(let ((anon7_correct  (=> (and (= b_18@7  (and b_18@6 (state Ops_9Heap@0 Ops_9Mask@3))) (= b_18@8  (and b_18@7 (state Ops_9Heap@0 Ops_9Mask@3)))) (and (=> (= (ControlFlow 0 108) 107) anon84_Then_correct) (=> (= (ControlFlow 0 108) 82) anon84_Else_correct)))))
(let ((anon83_Else_correct  (=> (and (and (not b_18@3) (= b_18@6 b_18@3)) (and (= Ops_9Mask@3 Ops_9Mask@1) (= (ControlFlow 0 111) 108))) anon7_correct)))
(let ((anon83_Then_correct  (=> b_18@3 (=> (and (= b_18@4  (and b_18@3 (not (= x@@14 null)))) (= Ops_9Mask@2 (MapType1Store Ops_9Mask@1 x@@14 g (real_2_U (+ (U_2_real (MapType1Select Ops_9Mask@1 x@@14 g)) FullPerm))))) (=> (and (and (= b_18@5  (and b_18@4 (state Ops_9Heap@0 Ops_9Mask@2))) (= b_18@6 b_18@5)) (and (= Ops_9Mask@3 Ops_9Mask@2) (= (ControlFlow 0 110) 108))) anon7_correct)))))
(let ((anon82_Else_correct  (=> (not b_18@0) (=> (and (= Ops_9Mask@1 ZeroMask) (= b_18@3 b_18@0)) (and (=> (= (ControlFlow 0 113) 110) anon83_Then_correct) (=> (= (ControlFlow 0 113) 111) anon83_Else_correct))))))
(let ((anon82_Then_correct  (=> (and b_18@0 (= b_18@1  (and b_18@0 (not (= x@@14 null))))) (=> (and (and (= Ops_9Mask@0 (MapType1Store ZeroMask x@@14 f_7 (real_2_U (+ (U_2_real (MapType1Select ZeroMask x@@14 f_7)) FullPerm)))) (= b_18@2  (and b_18@1 (state Ops_9Heap@0 Ops_9Mask@0)))) (and (= Ops_9Mask@1 Ops_9Mask@0) (= b_18@3 b_18@2))) (and (=> (= (ControlFlow 0 112) 110) anon83_Then_correct) (=> (= (ControlFlow 0 112) 111) anon83_Else_correct))))))
(let ((anon81_Then_correct  (=> b_18@0 (and (=> (= (ControlFlow 0 114) 112) anon82_Then_correct) (=> (= (ControlFlow 0 114) 113) anon82_Else_correct)))))
(let ((anon81_Else_correct  (=> (and (and (not b_18@0) (= b_18@6 b_18@0)) (and (= Ops_9Mask@3 ZeroMask) (= (ControlFlow 0 109) 108))) anon7_correct)))
(let ((anon80_Else_correct  (=> (and (= b_18@0  (and b_18 (state Ops_9Heap@0 ZeroMask))) (= b_17@0  (and b_17 (state Used_8Heap@0 ZeroMask)))) (and (=> (= (ControlFlow 0 115) 114) anon81_Then_correct) (=> (= (ControlFlow 0 115) 109) anon81_Else_correct)))))
(let ((anon80_Then_correct  (=> (state PostHeap@0 ZeroMask) (=> (and (not (= x@@14 null)) (= PostMask@0 (MapType1Store ZeroMask x@@14 f_7 (real_2_U (+ (U_2_real (MapType1Select ZeroMask x@@14 f_7)) FullPerm))))) (=> (and (and (state PostHeap@0 PostMask@0) (not (= x@@14 null))) (and (= PostMask@1 (MapType1Store PostMask@0 x@@14 g (real_2_U (+ (U_2_real (MapType1Select PostMask@0 x@@14 g)) FullPerm)))) (state PostHeap@0 PostMask@1))) (and (=> (= (ControlFlow 0 2) (- 0 5)) (HasDirectPerm PostMask@1 x@@14 f_7)) (=> (HasDirectPerm PostMask@1 x@@14 f_7) (and (=> (= (ControlFlow 0 2) (- 0 4)) (HasDirectPerm Mask@1 x@@14 f_7)) (=> (HasDirectPerm Mask@1 x@@14 f_7) (=> (= (U_2_int (MapType0Select PostHeap@0 x@@14 f_7)) (U_2_int (MapType0Select Heap@@10 x@@14 f_7))) (and (=> (= (ControlFlow 0 2) (- 0 3)) (HasDirectPerm PostMask@1 x@@14 g)) (=> (HasDirectPerm PostMask@1 x@@14 g) (=> (= (ControlFlow 0 2) (- 0 1)) (HasDirectPerm Mask@1 x@@14 g))))))))))))))
(let ((anon0_correct  (=> (state Heap@@10 ZeroMask) (=> (and (and (and (U_2_bool (MapType0Select Heap@@10 x@@14 $allocated)) (not (= x@@14 null))) (and (= Mask@0 (MapType1Store ZeroMask x@@14 f_7 (real_2_U (+ (U_2_real (MapType1Select ZeroMask x@@14 f_7)) FullPerm)))) (state Heap@@10 Mask@0))) (and (and (not (= x@@14 null)) (= Mask@1 (MapType1Store Mask@0 x@@14 g (real_2_U (+ (U_2_real (MapType1Select Mask@0 x@@14 g)) FullPerm))))) (and (state Heap@@10 Mask@1) (state Heap@@10 Mask@1)))) (and (=> (= (ControlFlow 0 116) 2) anon80_Then_correct) (=> (= (ControlFlow 0 116) 115) anon80_Else_correct))))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 117) 116) anon0_correct)))
PreconditionGeneratedEntry_correct)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
))
(check-sat)
(pop 1)
; Valid
(get-info :rlimit)
