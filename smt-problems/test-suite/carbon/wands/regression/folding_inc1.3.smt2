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
(declare-fun succHeap (T@U T@U) Bool)
(declare-fun MapType0Type (T@T) T@T)
(declare-fun succHeapTrans (T@U T@U) Bool)
(declare-fun MapType0TypeInv0 (T@T) T@T)
(declare-fun MapType0Select (T@U T@U T@U) T@U)
(declare-fun MapType0Store (T@U T@U T@U T@U) T@U)
(declare-fun wand_1 (T@U Real T@U Real) T@U)
(declare-fun getPredWandId (T@U) Int)
(declare-fun WandType_wand_1Type () T@T)
(declare-fun wand_3 (T@U Real T@U Real) T@U)
(declare-fun WandType_wand_3Type () T@T)
(declare-fun state (T@U T@U) Bool)
(declare-fun MapType1Type (T@T T@T) T@T)
(declare-fun GoodMask (T@U) Bool)
(declare-fun MapType1TypeInv0 (T@T) T@T)
(declare-fun MapType1TypeInv1 (T@T) T@T)
(declare-fun MapType1Select (T@U T@U T@U) T@U)
(declare-fun MapType1Store (T@U T@U T@U T@U) T@U)
(declare-fun wand_2 (T@U Real Bool) T@U)
(declare-fun IsWandField (T@U) Bool)
(declare-fun WandType_wand_2Type () T@T)
(declare-fun |wand_2#ft| (T@U Real Bool) T@U)
(declare-fun FrameTypeType () T@T)
(declare-fun IsPredicateField (T@U) Bool)
(declare-fun wand (Bool Bool) T@U)
(declare-fun WandType_wandType () T@T)
(declare-fun |wand#ft| (Bool Bool) T@U)
(declare-fun IdenticalOnKnownLocations (T@U T@U T@U) Bool)
(declare-fun null () T@U)
(declare-fun PredicateMaskField (T@U) T@U)
(declare-fun HasDirectPerm (T@U T@U T@U) Bool)
(declare-fun WandMaskField (T@U) T@U)
(declare-fun P (T@U) T@U)
(declare-fun PredicateType_PType () T@T)
(declare-fun Q (T@U) T@U)
(declare-fun PredicateType_QType () T@T)
(declare-fun |P#trigger| (T@U T@U) Bool)
(declare-fun |P#everUsed| (T@U) Bool)
(declare-fun |Q#trigger| (T@U T@U) Bool)
(declare-fun |Q#everUsed| (T@U) Bool)
(declare-fun |wand_2#sm| (T@U Real Bool) T@U)
(declare-fun |P#sm| (T@U) T@U)
(declare-fun |Q#sm| (T@U) T@U)
(declare-fun dummyHeap () T@U)
(declare-fun ZeroMask () T@U)
(declare-fun InsidePredicate (T@U T@U T@U T@U) Bool)
(declare-fun sumMask (T@U T@U T@U) Bool)
(declare-fun |wand_1#ft| (T@U Real T@U Real) T@U)
(declare-fun |wand_3#ft| (T@U Real T@U Real) T@U)
(declare-fun ConditionalFrame (Real T@U) T@U)
(declare-fun EmptyFrame () T@U)
(declare-fun NoPerm () Real)
(declare-fun |wand_1#sm| (T@U Real T@U Real) T@U)
(declare-fun |wand_3#sm| (T@U Real T@U Real) T@U)
(declare-fun FullPerm () Real)
(declare-fun |wand#sm| (Bool Bool) T@U)
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
))) (= (Ctor NormalFieldType) 7)) (= (type $allocated) (FieldType NormalFieldType boolType))) (= (type f_7) (FieldType NormalFieldType intType))) (= (Ctor RefType) 8)) (= (type g) (FieldType NormalFieldType RefType))) (= (type h) (FieldType NormalFieldType RefType))))
(assert (distinct $allocated f_7 g h)
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
(assert  (and (= (Ctor WandType_wand_1Type) 10) (forall ((arg0@@18 T@U) (arg1@@4 Real) (arg2@@1 T@U) (arg3@@0 Real) ) (! (= (type (wand_1 arg0@@18 arg1@@4 arg2@@1 arg3@@0)) (FieldType WandType_wand_1Type intType))
 :qid |funType:wand_1|
 :pattern ( (wand_1 arg0@@18 arg1@@4 arg2@@1 arg3@@0))
))))
(assert (forall ((arg1@@5 T@U) (arg2@@2 Real) (arg3@@1 T@U) (arg4 Real) ) (!  (=> (and (= (type arg1@@5) RefType) (= (type arg3@@1) RefType)) (= (getPredWandId (wand_1 arg1@@5 arg2@@2 arg3@@1 arg4)) 3))
 :qid |stdinbpl.235:15|
 :skolemid |34|
 :pattern ( (wand_1 arg1@@5 arg2@@2 arg3@@1 arg4))
)))
(assert  (and (= (Ctor WandType_wand_3Type) 11) (forall ((arg0@@19 T@U) (arg1@@6 Real) (arg2@@3 T@U) (arg3@@2 Real) ) (! (= (type (wand_3 arg0@@19 arg1@@6 arg2@@3 arg3@@2)) (FieldType WandType_wand_3Type intType))
 :qid |funType:wand_3|
 :pattern ( (wand_3 arg0@@19 arg1@@6 arg2@@3 arg3@@2))
))))
(assert (forall ((arg1@@7 T@U) (arg2@@4 Real) (arg3@@3 T@U) (arg4@@0 Real) ) (!  (=> (and (= (type arg1@@7) RefType) (= (type arg3@@3) RefType)) (= (getPredWandId (wand_3 arg1@@7 arg2@@4 arg3@@3 arg4@@0)) 5))
 :qid |stdinbpl.299:15|
 :skolemid |48|
 :pattern ( (wand_3 arg1@@7 arg2@@4 arg3@@3 arg4@@0))
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
(assert  (and (= (Ctor WandType_wand_2Type) 13) (forall ((arg0@@25 T@U) (arg1@@13 Real) (arg2@@7 Bool) ) (! (= (type (wand_2 arg0@@25 arg1@@13 arg2@@7)) (FieldType WandType_wand_2Type intType))
 :qid |funType:wand_2|
 :pattern ( (wand_2 arg0@@25 arg1@@13 arg2@@7))
))))
(assert (forall ((arg1@@14 T@U) (arg2@@8 Real) (arg3@@5 Bool) ) (!  (=> (= (type arg1@@14) RefType) (IsWandField (wand_2 arg1@@14 arg2@@8 arg3@@5)))
 :qid |stdinbpl.247:15|
 :skolemid |36|
 :pattern ( (wand_2 arg1@@14 arg2@@8 arg3@@5))
)))
(assert  (and (= (Ctor FrameTypeType) 14) (forall ((arg0@@26 T@U) (arg1@@15 Real) (arg2@@9 Bool) ) (! (= (type (|wand_2#ft| arg0@@26 arg1@@15 arg2@@9)) (FieldType WandType_wand_2Type FrameTypeType))
 :qid |funType:wand_2#ft|
 :pattern ( (|wand_2#ft| arg0@@26 arg1@@15 arg2@@9))
))))
(assert (forall ((arg1@@16 T@U) (arg2@@10 Real) (arg3@@6 Bool) ) (!  (=> (= (type arg1@@16) RefType) (IsWandField (|wand_2#ft| arg1@@16 arg2@@10 arg3@@6)))
 :qid |stdinbpl.251:15|
 :skolemid |37|
 :pattern ( (|wand_2#ft| arg1@@16 arg2@@10 arg3@@6))
)))
(assert (forall ((arg1@@17 T@U) (arg2@@11 Real) (arg3@@7 Bool) ) (!  (=> (= (type arg1@@17) RefType) (= (getPredWandId (wand_2 arg1@@17 arg2@@11 arg3@@7)) 4))
 :qid |stdinbpl.267:15|
 :skolemid |41|
 :pattern ( (wand_2 arg1@@17 arg2@@11 arg3@@7))
)))
(assert (forall ((arg1@@18 T@U) (arg2@@12 Real) (arg3@@8 Bool) ) (!  (=> (= (type arg1@@18) RefType) (not (IsPredicateField (wand_2 arg1@@18 arg2@@12 arg3@@8))))
 :qid |stdinbpl.255:15|
 :skolemid |38|
 :pattern ( (wand_2 arg1@@18 arg2@@12 arg3@@8))
)))
(assert (forall ((arg1@@19 T@U) (arg2@@13 Real) (arg3@@9 Bool) ) (!  (=> (= (type arg1@@19) RefType) (not (IsPredicateField (|wand_2#ft| arg1@@19 arg2@@13 arg3@@9))))
 :qid |stdinbpl.259:15|
 :skolemid |39|
 :pattern ( (|wand_2#ft| arg1@@19 arg2@@13 arg3@@9))
)))
(assert  (and (= (Ctor WandType_wandType) 15) (forall ((arg0@@27 Bool) (arg1@@20 Bool) ) (! (= (type (wand arg0@@27 arg1@@20)) (FieldType WandType_wandType intType))
 :qid |funType:wand|
 :pattern ( (wand arg0@@27 arg1@@20))
))))
(assert (forall ((arg1@@21 Bool) (arg2@@14 Bool) ) (! (IsWandField (wand arg1@@21 arg2@@14))
 :qid |stdinbpl.183:15|
 :skolemid |22|
 :pattern ( (wand arg1@@21 arg2@@14))
)))
(assert (forall ((arg0@@28 Bool) (arg1@@22 Bool) ) (! (= (type (|wand#ft| arg0@@28 arg1@@22)) (FieldType WandType_wandType FrameTypeType))
 :qid |funType:wand#ft|
 :pattern ( (|wand#ft| arg0@@28 arg1@@22))
)))
(assert (forall ((arg1@@23 Bool) (arg2@@15 Bool) ) (! (IsWandField (|wand#ft| arg1@@23 arg2@@15))
 :qid |stdinbpl.187:15|
 :skolemid |23|
 :pattern ( (|wand#ft| arg1@@23 arg2@@15))
)))
(assert  (and (= (type null) RefType) (forall ((arg0@@29 T@U) ) (! (let ((A (FieldTypeInv0 (type arg0@@29))))
(= (type (PredicateMaskField arg0@@29)) (FieldType A (MapType1Type RefType boolType))))
 :qid |funType:PredicateMaskField|
 :pattern ( (PredicateMaskField arg0@@29))
))))
(assert (forall ((Heap@@0 T@U) (ExhaleHeap T@U) (Mask@@0 T@U) (pm_f T@U) ) (! (let ((C (FieldTypeInv0 (type pm_f))))
 (=> (and (and (and (and (and (= (type Heap@@0) (MapType0Type RefType)) (= (type ExhaleHeap) (MapType0Type RefType))) (= (type Mask@@0) (MapType1Type RefType realType))) (= (type pm_f) (FieldType C FrameTypeType))) (IdenticalOnKnownLocations Heap@@0 ExhaleHeap Mask@@0)) (and (HasDirectPerm Mask@@0 null pm_f) (IsPredicateField pm_f))) (= (MapType0Select Heap@@0 null (PredicateMaskField pm_f)) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))))
 :qid |stdinbpl.47:19|
 :skolemid |2|
 :pattern ( (IdenticalOnKnownLocations Heap@@0 ExhaleHeap Mask@@0) (IsPredicateField pm_f) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))
)))
(assert (forall ((arg0@@30 T@U) ) (! (let ((A@@0 (FieldTypeInv0 (type arg0@@30))))
(= (type (WandMaskField arg0@@30)) (FieldType A@@0 (MapType1Type RefType boolType))))
 :qid |funType:WandMaskField|
 :pattern ( (WandMaskField arg0@@30))
)))
(assert (forall ((Heap@@1 T@U) (ExhaleHeap@@0 T@U) (Mask@@1 T@U) (pm_f@@0 T@U) ) (! (let ((C@@0 (FieldTypeInv0 (type pm_f@@0))))
 (=> (and (and (and (and (and (= (type Heap@@1) (MapType0Type RefType)) (= (type ExhaleHeap@@0) (MapType0Type RefType))) (= (type Mask@@1) (MapType1Type RefType realType))) (= (type pm_f@@0) (FieldType C@@0 FrameTypeType))) (IdenticalOnKnownLocations Heap@@1 ExhaleHeap@@0 Mask@@1)) (and (HasDirectPerm Mask@@1 null pm_f@@0) (IsWandField pm_f@@0))) (= (MapType0Select Heap@@1 null (WandMaskField pm_f@@0)) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))))
 :qid |stdinbpl.60:19|
 :skolemid |5|
 :pattern ( (IdenticalOnKnownLocations Heap@@1 ExhaleHeap@@0 Mask@@1) (IsWandField pm_f@@0) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))
)))
(assert (forall ((arg1@@24 Bool) (arg2@@16 Bool) ) (!  (not (IsPredicateField (wand arg1@@24 arg2@@16)))
 :qid |stdinbpl.191:15|
 :skolemid |24|
 :pattern ( (wand arg1@@24 arg2@@16))
)))
(assert (forall ((arg1@@25 Bool) (arg2@@17 Bool) ) (!  (not (IsPredicateField (|wand#ft| arg1@@25 arg2@@17)))
 :qid |stdinbpl.195:15|
 :skolemid |25|
 :pattern ( (|wand#ft| arg1@@25 arg2@@17))
)))
(assert  (and (= (Ctor PredicateType_PType) 16) (forall ((arg0@@31 T@U) ) (! (= (type (P arg0@@31)) (FieldType PredicateType_PType FrameTypeType))
 :qid |funType:P|
 :pattern ( (P arg0@@31))
))))
(assert (forall ((x@@8 T@U) ) (!  (=> (= (type x@@8) RefType) (IsPredicateField (P x@@8)))
 :qid |stdinbpl.333:15|
 :skolemid |51|
 :pattern ( (P x@@8))
)))
(assert  (and (= (Ctor PredicateType_QType) 17) (forall ((arg0@@32 T@U) ) (! (= (type (Q arg0@@32)) (FieldType PredicateType_QType FrameTypeType))
 :qid |funType:Q|
 :pattern ( (Q arg0@@32))
))))
(assert (forall ((x@@9 T@U) ) (!  (=> (= (type x@@9) RefType) (IsPredicateField (Q x@@9)))
 :qid |stdinbpl.386:15|
 :skolemid |57|
 :pattern ( (Q x@@9))
)))
(assert (forall ((Heap@@2 T@U) (x@@10 T@U) ) (!  (=> (and (= (type Heap@@2) (MapType0Type RefType)) (= (type x@@10) RefType)) (|P#everUsed| (P x@@10)))
 :qid |stdinbpl.352:15|
 :skolemid |55|
 :pattern ( (|P#trigger| Heap@@2 (P x@@10)))
)))
(assert (forall ((Heap@@3 T@U) (x@@11 T@U) ) (!  (=> (and (= (type Heap@@3) (MapType0Type RefType)) (= (type x@@11) RefType)) (|Q#everUsed| (Q x@@11)))
 :qid |stdinbpl.405:15|
 :skolemid |61|
 :pattern ( (|Q#trigger| Heap@@3 (Q x@@11)))
)))
(assert (forall ((arg1@@26 T@U) (arg2@@18 Real) (arg3@@10 Bool) (arg1_2 T@U) (arg2_2 Real) (arg3_2 Bool) ) (!  (=> (and (and (= (type arg1@@26) RefType) (= (type arg1_2) RefType)) (= (wand_2 arg1@@26 arg2@@18 arg3@@10) (wand_2 arg1_2 arg2_2 arg3_2))) (and (= arg1@@26 arg1_2) (and (= arg2@@18 arg2_2) (= arg3@@10 arg3_2))))
 :qid |stdinbpl.271:15|
 :skolemid |42|
 :pattern ( (wand_2 arg1@@26 arg2@@18 arg3@@10) (wand_2 arg1_2 arg2_2 arg3_2))
)))
(assert (forall ((arg0@@33 T@U) (arg1@@27 Real) (arg2@@19 Bool) ) (! (= (type (|wand_2#sm| arg0@@33 arg1@@27 arg2@@19)) (FieldType WandType_wand_2Type (MapType1Type RefType boolType)))
 :qid |funType:wand_2#sm|
 :pattern ( (|wand_2#sm| arg0@@33 arg1@@27 arg2@@19))
)))
(assert (forall ((arg1@@28 T@U) (arg2@@20 Real) (arg3@@11 Bool) ) (!  (=> (= (type arg1@@28) RefType) (= (|wand_2#sm| arg1@@28 arg2@@20 arg3@@11) (WandMaskField (|wand_2#ft| arg1@@28 arg2@@20 arg3@@11))))
 :qid |stdinbpl.263:15|
 :skolemid |40|
 :pattern ( (WandMaskField (|wand_2#ft| arg1@@28 arg2@@20 arg3@@11)))
)))
(assert (forall ((Heap@@4 T@U) (ExhaleHeap@@1 T@U) (Mask@@2 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@4) (MapType0Type RefType)) (= (type ExhaleHeap@@1) (MapType0Type RefType))) (= (type Mask@@2) (MapType1Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@4 ExhaleHeap@@1 Mask@@2)) (U_2_bool (MapType0Select Heap@@4 o_1 $allocated))) (U_2_bool (MapType0Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.73:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@4 ExhaleHeap@@1 Mask@@2) (MapType0Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert (forall ((x@@12 T@U) (x2 T@U) ) (!  (=> (and (and (= (type x@@12) RefType) (= (type x2) RefType)) (= (P x@@12) (P x2))) (= x@@12 x2))
 :qid |stdinbpl.343:15|
 :skolemid |53|
 :pattern ( (P x@@12) (P x2))
)))
(assert (forall ((arg0@@34 T@U) ) (! (= (type (|P#sm| arg0@@34)) (FieldType PredicateType_PType (MapType1Type RefType boolType)))
 :qid |funType:P#sm|
 :pattern ( (|P#sm| arg0@@34))
)))
(assert (forall ((x@@13 T@U) (x2@@0 T@U) ) (!  (=> (and (and (= (type x@@13) RefType) (= (type x2@@0) RefType)) (= (|P#sm| x@@13) (|P#sm| x2@@0))) (= x@@13 x2@@0))
 :qid |stdinbpl.347:15|
 :skolemid |54|
 :pattern ( (|P#sm| x@@13) (|P#sm| x2@@0))
)))
(assert (forall ((x@@14 T@U) (x2@@1 T@U) ) (!  (=> (and (and (= (type x@@14) RefType) (= (type x2@@1) RefType)) (= (Q x@@14) (Q x2@@1))) (= x@@14 x2@@1))
 :qid |stdinbpl.396:15|
 :skolemid |59|
 :pattern ( (Q x@@14) (Q x2@@1))
)))
(assert (forall ((arg0@@35 T@U) ) (! (= (type (|Q#sm| arg0@@35)) (FieldType PredicateType_QType (MapType1Type RefType boolType)))
 :qid |funType:Q#sm|
 :pattern ( (|Q#sm| arg0@@35))
)))
(assert (forall ((x@@15 T@U) (x2@@2 T@U) ) (!  (=> (and (and (= (type x@@15) RefType) (= (type x2@@2) RefType)) (= (|Q#sm| x@@15) (|Q#sm| x2@@2))) (= x@@15 x2@@2))
 :qid |stdinbpl.400:15|
 :skolemid |60|
 :pattern ( (|Q#sm| x@@15) (|Q#sm| x2@@2))
)))
(assert (forall ((Heap@@5 T@U) (ExhaleHeap@@2 T@U) (Mask@@3 T@U) (o_1@@0 T@U) (f_2 T@U) ) (! (let ((B@@1 (FieldTypeInv1 (type f_2))))
(let ((A@@1 (FieldTypeInv0 (type f_2))))
 (=> (and (and (and (and (and (and (= (type Heap@@5) (MapType0Type RefType)) (= (type ExhaleHeap@@2) (MapType0Type RefType))) (= (type Mask@@3) (MapType1Type RefType realType))) (= (type o_1@@0) RefType)) (= (type f_2) (FieldType A@@1 B@@1))) (IdenticalOnKnownLocations Heap@@5 ExhaleHeap@@2 Mask@@3)) (HasDirectPerm Mask@@3 o_1@@0 f_2)) (= (MapType0Select Heap@@5 o_1@@0 f_2) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2)))))
 :qid |stdinbpl.42:22|
 :skolemid |1|
 :pattern ( (IdenticalOnKnownLocations Heap@@5 ExhaleHeap@@2 Mask@@3) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2))
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
(assert  (not (IsPredicateField g)))
(assert  (not (IsWandField g)))
(assert  (not (IsPredicateField h)))
(assert  (not (IsWandField h)))
(assert (forall ((Heap@@6 T@U) (ExhaleHeap@@3 T@U) (Mask@@4 T@U) ) (!  (=> (and (and (and (= (type Heap@@6) (MapType0Type RefType)) (= (type ExhaleHeap@@3) (MapType0Type RefType))) (= (type Mask@@4) (MapType1Type RefType realType))) (IdenticalOnKnownLocations Heap@@6 ExhaleHeap@@3 Mask@@4)) (succHeap Heap@@6 ExhaleHeap@@3))
 :qid |stdinbpl.83:15|
 :skolemid |10|
 :pattern ( (IdenticalOnKnownLocations Heap@@6 ExhaleHeap@@3 Mask@@4))
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
(assert (forall ((arg1@@29 T@U) (arg2@@21 Real) (arg3@@12 T@U) (arg4@@1 Real) ) (!  (=> (and (= (type arg1@@29) RefType) (= (type arg3@@12) RefType)) (IsWandField (wand_1 arg1@@29 arg2@@21 arg3@@12 arg4@@1)))
 :qid |stdinbpl.215:15|
 :skolemid |29|
 :pattern ( (wand_1 arg1@@29 arg2@@21 arg3@@12 arg4@@1))
)))
(assert (forall ((arg0@@36 T@U) (arg1@@30 Real) (arg2@@22 T@U) (arg3@@13 Real) ) (! (= (type (|wand_1#ft| arg0@@36 arg1@@30 arg2@@22 arg3@@13)) (FieldType WandType_wand_1Type FrameTypeType))
 :qid |funType:wand_1#ft|
 :pattern ( (|wand_1#ft| arg0@@36 arg1@@30 arg2@@22 arg3@@13))
)))
(assert (forall ((arg1@@31 T@U) (arg2@@23 Real) (arg3@@14 T@U) (arg4@@2 Real) ) (!  (=> (and (= (type arg1@@31) RefType) (= (type arg3@@14) RefType)) (IsWandField (|wand_1#ft| arg1@@31 arg2@@23 arg3@@14 arg4@@2)))
 :qid |stdinbpl.219:15|
 :skolemid |30|
 :pattern ( (|wand_1#ft| arg1@@31 arg2@@23 arg3@@14 arg4@@2))
)))
(assert (forall ((arg1@@32 T@U) (arg2@@24 Real) (arg3@@15 T@U) (arg4@@3 Real) ) (!  (=> (and (= (type arg1@@32) RefType) (= (type arg3@@15) RefType)) (IsWandField (wand_3 arg1@@32 arg2@@24 arg3@@15 arg4@@3)))
 :qid |stdinbpl.279:15|
 :skolemid |43|
 :pattern ( (wand_3 arg1@@32 arg2@@24 arg3@@15 arg4@@3))
)))
(assert (forall ((arg0@@37 T@U) (arg1@@33 Real) (arg2@@25 T@U) (arg3@@16 Real) ) (! (= (type (|wand_3#ft| arg0@@37 arg1@@33 arg2@@25 arg3@@16)) (FieldType WandType_wand_3Type FrameTypeType))
 :qid |funType:wand_3#ft|
 :pattern ( (|wand_3#ft| arg0@@37 arg1@@33 arg2@@25 arg3@@16))
)))
(assert (forall ((arg1@@34 T@U) (arg2@@26 Real) (arg3@@17 T@U) (arg4@@4 Real) ) (!  (=> (and (= (type arg1@@34) RefType) (= (type arg3@@17) RefType)) (IsWandField (|wand_3#ft| arg1@@34 arg2@@26 arg3@@17 arg4@@4)))
 :qid |stdinbpl.283:15|
 :skolemid |44|
 :pattern ( (|wand_3#ft| arg1@@34 arg2@@26 arg3@@17 arg4@@4))
)))
(assert  (and (forall ((arg0@@38 Real) (arg1@@35 T@U) ) (! (= (type (ConditionalFrame arg0@@38 arg1@@35)) FrameTypeType)
 :qid |funType:ConditionalFrame|
 :pattern ( (ConditionalFrame arg0@@38 arg1@@35))
)) (= (type EmptyFrame) FrameTypeType)))
(assert (forall ((p@@0 Real) (f_6 T@U) ) (!  (=> (= (type f_6) FrameTypeType) (= (ConditionalFrame p@@0 f_6) (ite (> p@@0 0.0) f_6 EmptyFrame)))
 :qid |stdinbpl.158:15|
 :skolemid |19|
 :pattern ( (ConditionalFrame p@@0 f_6))
)))
(assert (forall ((arg1@@36 T@U) (arg2@@27 Real) (arg3@@18 T@U) (arg4@@5 Real) ) (!  (=> (and (= (type arg1@@36) RefType) (= (type arg3@@18) RefType)) (not (IsPredicateField (wand_1 arg1@@36 arg2@@27 arg3@@18 arg4@@5))))
 :qid |stdinbpl.223:15|
 :skolemid |31|
 :pattern ( (wand_1 arg1@@36 arg2@@27 arg3@@18 arg4@@5))
)))
(assert (forall ((arg1@@37 T@U) (arg2@@28 Real) (arg3@@19 T@U) (arg4@@6 Real) ) (!  (=> (and (= (type arg1@@37) RefType) (= (type arg3@@19) RefType)) (not (IsPredicateField (|wand_1#ft| arg1@@37 arg2@@28 arg3@@19 arg4@@6))))
 :qid |stdinbpl.227:15|
 :skolemid |32|
 :pattern ( (|wand_1#ft| arg1@@37 arg2@@28 arg3@@19 arg4@@6))
)))
(assert (forall ((arg1@@38 T@U) (arg2@@29 Real) (arg3@@20 T@U) (arg4@@7 Real) ) (!  (=> (and (= (type arg1@@38) RefType) (= (type arg3@@20) RefType)) (not (IsPredicateField (wand_3 arg1@@38 arg2@@29 arg3@@20 arg4@@7))))
 :qid |stdinbpl.287:15|
 :skolemid |45|
 :pattern ( (wand_3 arg1@@38 arg2@@29 arg3@@20 arg4@@7))
)))
(assert (forall ((arg1@@39 T@U) (arg2@@30 Real) (arg3@@21 T@U) (arg4@@8 Real) ) (!  (=> (and (= (type arg1@@39) RefType) (= (type arg3@@21) RefType)) (not (IsPredicateField (|wand_3#ft| arg1@@39 arg2@@30 arg3@@21 arg4@@8))))
 :qid |stdinbpl.291:15|
 :skolemid |46|
 :pattern ( (|wand_3#ft| arg1@@39 arg2@@30 arg3@@21 arg4@@8))
)))
(assert (forall ((Mask@@5 T@U) (o_2@@0 T@U) (f_4@@0 T@U) ) (! (let ((B@@3 (FieldTypeInv1 (type f_4@@0))))
(let ((A@@4 (FieldTypeInv0 (type f_4@@0))))
 (=> (and (and (= (type Mask@@5) (MapType1Type RefType realType)) (= (type o_2@@0) RefType)) (= (type f_4@@0) (FieldType A@@4 B@@3))) (= (HasDirectPerm Mask@@5 o_2@@0 f_4@@0) (> (U_2_real (MapType1Select Mask@@5 o_2@@0 f_4@@0)) NoPerm)))))
 :qid |stdinbpl.133:22|
 :skolemid |17|
 :pattern ( (HasDirectPerm Mask@@5 o_2@@0 f_4@@0))
)))
(assert (forall ((arg0@@39 T@U) (arg1@@40 Real) (arg2@@31 T@U) (arg3@@22 Real) ) (! (= (type (|wand_1#sm| arg0@@39 arg1@@40 arg2@@31 arg3@@22)) (FieldType WandType_wand_1Type (MapType1Type RefType boolType)))
 :qid |funType:wand_1#sm|
 :pattern ( (|wand_1#sm| arg0@@39 arg1@@40 arg2@@31 arg3@@22))
)))
(assert (forall ((arg1@@41 T@U) (arg2@@32 Real) (arg3@@23 T@U) (arg4@@9 Real) ) (!  (=> (and (= (type arg1@@41) RefType) (= (type arg3@@23) RefType)) (= (|wand_1#sm| arg1@@41 arg2@@32 arg3@@23 arg4@@9) (WandMaskField (|wand_1#ft| arg1@@41 arg2@@32 arg3@@23 arg4@@9))))
 :qid |stdinbpl.231:15|
 :skolemid |33|
 :pattern ( (WandMaskField (|wand_1#ft| arg1@@41 arg2@@32 arg3@@23 arg4@@9)))
)))
(assert (forall ((arg0@@40 T@U) (arg1@@42 Real) (arg2@@33 T@U) (arg3@@24 Real) ) (! (= (type (|wand_3#sm| arg0@@40 arg1@@42 arg2@@33 arg3@@24)) (FieldType WandType_wand_3Type (MapType1Type RefType boolType)))
 :qid |funType:wand_3#sm|
 :pattern ( (|wand_3#sm| arg0@@40 arg1@@42 arg2@@33 arg3@@24))
)))
(assert (forall ((arg1@@43 T@U) (arg2@@34 Real) (arg3@@25 T@U) (arg4@@10 Real) ) (!  (=> (and (= (type arg1@@43) RefType) (= (type arg3@@25) RefType)) (= (|wand_3#sm| arg1@@43 arg2@@34 arg3@@25 arg4@@10) (WandMaskField (|wand_3#ft| arg1@@43 arg2@@34 arg3@@25 arg4@@10))))
 :qid |stdinbpl.295:15|
 :skolemid |47|
 :pattern ( (WandMaskField (|wand_3#ft| arg1@@43 arg2@@34 arg3@@25 arg4@@10)))
)))
(assert (forall ((o_2@@1 T@U) (f_4@@1 T@U) ) (! (let ((B@@4 (FieldTypeInv1 (type f_4@@1))))
(let ((A@@5 (FieldTypeInv0 (type f_4@@1))))
 (=> (and (= (type o_2@@1) RefType) (= (type f_4@@1) (FieldType A@@5 B@@4))) (= (U_2_real (MapType1Select ZeroMask o_2@@1 f_4@@1)) NoPerm))))
 :qid |stdinbpl.106:22|
 :skolemid |13|
 :pattern ( (MapType1Select ZeroMask o_2@@1 f_4@@1))
)))
(assert (forall ((arg1@@44 Bool) (arg2@@35 Bool) (arg1_2@@0 Bool) (arg2_2@@0 Bool) ) (!  (=> (= (wand arg1@@44 arg2@@35) (wand arg1_2@@0 arg2_2@@0)) (and (= arg1@@44 arg1_2@@0) (= arg2@@35 arg2_2@@0)))
 :qid |stdinbpl.207:15|
 :skolemid |28|
 :pattern ( (wand arg1@@44 arg2@@35) (wand arg1_2@@0 arg2_2@@0))
)))
(assert (forall ((arg1@@45 Bool) (arg2@@36 Bool) ) (! (= (getPredWandId (wand arg1@@45 arg2@@36)) 2)
 :qid |stdinbpl.203:15|
 :skolemid |27|
 :pattern ( (wand arg1@@45 arg2@@36))
)))
(assert (forall ((Heap@@7 T@U) (ExhaleHeap@@4 T@U) (Mask@@6 T@U) (pm_f@@1 T@U) ) (! (let ((C@@1 (FieldTypeInv0 (type pm_f@@1))))
 (=> (and (and (and (and (and (= (type Heap@@7) (MapType0Type RefType)) (= (type ExhaleHeap@@4) (MapType0Type RefType))) (= (type Mask@@6) (MapType1Type RefType realType))) (= (type pm_f@@1) (FieldType C@@1 FrameTypeType))) (IdenticalOnKnownLocations Heap@@7 ExhaleHeap@@4 Mask@@6)) (and (HasDirectPerm Mask@@6 null pm_f@@1) (IsPredicateField pm_f@@1))) (forall ((o2 T@U) (f_2@@0 T@U) ) (! (let ((B@@5 (FieldTypeInv1 (type f_2@@0))))
(let ((A@@6 (FieldTypeInv0 (type f_2@@0))))
 (=> (and (and (= (type o2) RefType) (= (type f_2@@0) (FieldType A@@6 B@@5))) (U_2_bool (MapType1Select (MapType0Select Heap@@7 null (PredicateMaskField pm_f@@1)) o2 f_2@@0))) (= (MapType0Select Heap@@7 o2 f_2@@0) (MapType0Select ExhaleHeap@@4 o2 f_2@@0)))))
 :qid |stdinbpl.54:134|
 :skolemid |3|
 :pattern ( (MapType0Select ExhaleHeap@@4 o2 f_2@@0))
))))
 :qid |stdinbpl.52:19|
 :skolemid |4|
 :pattern ( (IdenticalOnKnownLocations Heap@@7 ExhaleHeap@@4 Mask@@6) (IsPredicateField pm_f@@1))
)))
(assert (forall ((Heap@@8 T@U) (ExhaleHeap@@5 T@U) (Mask@@7 T@U) (pm_f@@2 T@U) ) (! (let ((C@@2 (FieldTypeInv0 (type pm_f@@2))))
 (=> (and (and (and (and (and (= (type Heap@@8) (MapType0Type RefType)) (= (type ExhaleHeap@@5) (MapType0Type RefType))) (= (type Mask@@7) (MapType1Type RefType realType))) (= (type pm_f@@2) (FieldType C@@2 FrameTypeType))) (IdenticalOnKnownLocations Heap@@8 ExhaleHeap@@5 Mask@@7)) (and (HasDirectPerm Mask@@7 null pm_f@@2) (IsWandField pm_f@@2))) (forall ((o2@@0 T@U) (f_2@@1 T@U) ) (! (let ((B@@6 (FieldTypeInv1 (type f_2@@1))))
(let ((A@@7 (FieldTypeInv0 (type f_2@@1))))
 (=> (and (and (= (type o2@@0) RefType) (= (type f_2@@1) (FieldType A@@7 B@@6))) (U_2_bool (MapType1Select (MapType0Select Heap@@8 null (WandMaskField pm_f@@2)) o2@@0 f_2@@1))) (= (MapType0Select Heap@@8 o2@@0 f_2@@1) (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1)))))
 :qid |stdinbpl.67:129|
 :skolemid |6|
 :pattern ( (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1))
))))
 :qid |stdinbpl.65:19|
 :skolemid |7|
 :pattern ( (IdenticalOnKnownLocations Heap@@8 ExhaleHeap@@5 Mask@@7) (IsWandField pm_f@@2))
)))
(assert (forall ((x@@16 T@U) ) (!  (=> (= (type x@@16) RefType) (= (getPredWandId (P x@@16)) 0))
 :qid |stdinbpl.337:15|
 :skolemid |52|
 :pattern ( (P x@@16))
)))
(assert (forall ((x@@17 T@U) ) (!  (=> (= (type x@@17) RefType) (= (getPredWandId (Q x@@17)) 1))
 :qid |stdinbpl.390:15|
 :skolemid |58|
 :pattern ( (Q x@@17))
)))
(assert (forall ((Mask@@8 T@U) (o_2@@2 T@U) (f_4@@2 T@U) ) (! (let ((B@@7 (FieldTypeInv1 (type f_4@@2))))
(let ((A@@8 (FieldTypeInv0 (type f_4@@2))))
 (=> (and (and (and (= (type Mask@@8) (MapType1Type RefType realType)) (= (type o_2@@2) RefType)) (= (type f_4@@2) (FieldType A@@8 B@@7))) (GoodMask Mask@@8)) (and (>= (U_2_real (MapType1Select Mask@@8 o_2@@2 f_4@@2)) NoPerm) (=> (and (and (GoodMask Mask@@8) (not (IsPredicateField f_4@@2))) (not (IsWandField f_4@@2))) (<= (U_2_real (MapType1Select Mask@@8 o_2@@2 f_4@@2)) FullPerm))))))
 :qid |stdinbpl.128:22|
 :skolemid |16|
 :pattern ( (GoodMask Mask@@8) (MapType1Select Mask@@8 o_2@@2 f_4@@2))
)))
(assert (forall ((o T@U) (f T@U) (Heap@@9 T@U) ) (!  (=> (and (and (and (= (type o) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap@@9) (MapType0Type RefType))) (U_2_bool (MapType0Select Heap@@9 o $allocated))) (U_2_bool (MapType0Select Heap@@9 (MapType0Select Heap@@9 o f) $allocated)))
 :qid |stdinbpl.31:15|
 :skolemid |0|
 :pattern ( (MapType0Select Heap@@9 o f))
)))
(assert (forall ((arg0@@41 Bool) (arg1@@46 Bool) ) (! (= (type (|wand#sm| arg0@@41 arg1@@46)) (FieldType WandType_wandType (MapType1Type RefType boolType)))
 :qid |funType:wand#sm|
 :pattern ( (|wand#sm| arg0@@41 arg1@@46))
)))
(assert (forall ((arg1@@47 Bool) (arg2@@37 Bool) ) (! (= (|wand#sm| arg1@@47 arg2@@37) (WandMaskField (|wand#ft| arg1@@47 arg2@@37)))
 :qid |stdinbpl.199:15|
 :skolemid |26|
 :pattern ( (WandMaskField (|wand#ft| arg1@@47 arg2@@37)))
)))
(assert (forall ((x@@18 T@U) ) (!  (=> (= (type x@@18) RefType) (= (PredicateMaskField (P x@@18)) (|P#sm| x@@18)))
 :qid |stdinbpl.329:15|
 :skolemid |50|
 :pattern ( (PredicateMaskField (P x@@18)))
)))
(assert (forall ((x@@19 T@U) ) (!  (=> (= (type x@@19) RefType) (= (PredicateMaskField (Q x@@19)) (|Q#sm| x@@19)))
 :qid |stdinbpl.382:15|
 :skolemid |56|
 :pattern ( (PredicateMaskField (Q x@@19)))
)))
(assert (forall ((Heap@@10 T@U) (o@@0 T@U) (f_3 T@U) (v T@U) ) (! (let ((B@@8 (type v)))
(let ((A@@9 (FieldTypeInv0 (type f_3))))
 (=> (and (and (= (type Heap@@10) (MapType0Type RefType)) (= (type o@@0) RefType)) (= (type f_3) (FieldType A@@9 B@@8))) (succHeap Heap@@10 (MapType0Store Heap@@10 o@@0 f_3 v)))))
 :qid |stdinbpl.78:22|
 :skolemid |9|
 :pattern ( (MapType0Store Heap@@10 o@@0 f_3 v))
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
(assert (forall ((arg1@@48 T@U) (arg2@@38 Real) (arg3@@26 T@U) (arg4@@11 Real) (arg1_2@@1 T@U) (arg2_2@@1 Real) (arg3_2@@0 T@U) (arg4_2 Real) ) (!  (=> (and (and (and (and (= (type arg1@@48) RefType) (= (type arg3@@26) RefType)) (= (type arg1_2@@1) RefType)) (= (type arg3_2@@0) RefType)) (= (wand_1 arg1@@48 arg2@@38 arg3@@26 arg4@@11) (wand_1 arg1_2@@1 arg2_2@@1 arg3_2@@0 arg4_2))) (and (= arg1@@48 arg1_2@@1) (and (= arg2@@38 arg2_2@@1) (and (= arg3@@26 arg3_2@@0) (= arg4@@11 arg4_2)))))
 :qid |stdinbpl.239:15|
 :skolemid |35|
 :pattern ( (wand_1 arg1@@48 arg2@@38 arg3@@26 arg4@@11) (wand_1 arg1_2@@1 arg2_2@@1 arg3_2@@0 arg4_2))
)))
(assert (forall ((arg1@@49 T@U) (arg2@@39 Real) (arg3@@27 T@U) (arg4@@12 Real) (arg1_2@@2 T@U) (arg2_2@@2 Real) (arg3_2@@1 T@U) (arg4_2@@0 Real) ) (!  (=> (and (and (and (and (= (type arg1@@49) RefType) (= (type arg3@@27) RefType)) (= (type arg1_2@@2) RefType)) (= (type arg3_2@@1) RefType)) (= (wand_3 arg1@@49 arg2@@39 arg3@@27 arg4@@12) (wand_3 arg1_2@@2 arg2_2@@2 arg3_2@@1 arg4_2@@0))) (and (= arg1@@49 arg1_2@@2) (and (= arg2@@39 arg2_2@@2) (and (= arg3@@27 arg3_2@@1) (= arg4@@12 arg4_2@@0)))))
 :qid |stdinbpl.303:15|
 :skolemid |49|
 :pattern ( (wand_3 arg1@@49 arg2@@39 arg3@@27 arg4@@12) (wand_3 arg1_2@@2 arg2_2@@2 arg3_2@@1 arg4_2@@0))
)))
(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun b_20@0 () Bool)
(declare-fun b_20 () Bool)
(declare-fun Used_11Heap@0 () T@U)
(declare-fun Mask@6 () T@U)
(declare-fun Mask@5 () T@U)
(declare-fun x@@20 () T@U)
(declare-fun Heap@5 () T@U)
(declare-fun b_19@0 () Bool)
(declare-fun b_19 () Bool)
(declare-fun Used_10Heap@0 () T@U)
(declare-fun b_15@15 () Bool)
(declare-fun b_13@5 () Bool)
(declare-fun Ops_7Mask@5 () T@U)
(declare-fun Ops_7Mask () T@U)
(declare-fun b_13@6 () Bool)
(declare-fun Ops_7Heap () T@U)
(declare-fun b_13@7 () Bool)
(declare-fun b_13@8 () Bool)
(declare-fun Mask@4 () T@U)
(declare-fun Heap@4 () T@U)
(declare-fun Ops_9Heap@4 () T@U)
(declare-fun Ops_9Heap@3 () T@U)
(declare-fun Ops_9Heap@5 () T@U)
(declare-fun Ops_9Mask@6 () T@U)
(declare-fun b_15@14 () Bool)
(declare-fun b_15@13 () Bool)
(declare-fun Heap@3 () T@U)
(declare-fun Mask@3 () T@U)
(declare-fun Ops_9Heap@0 () T@U)
(declare-fun Ops_9Heap@1 () T@U)
(declare-fun Ops_9Heap@2 () T@U)
(declare-fun freshVersion@0 () T@U)
(declare-fun b_15@8 () Bool)
(declare-fun b_16@18 () Bool)
(declare-fun neededTransfer@11 () Real)
(declare-fun Used_9Mask@11 () T@U)
(declare-fun initNeededTransfer@1 () Real)
(declare-fun b_18@0 () Bool)
(declare-fun b_18@1 () Bool)
(declare-fun Result_3Heap () T@U)
(declare-fun Result_3Mask () T@U)
(declare-fun b_18@2 () Bool)
(declare-fun Ops_9Mask@5 () T@U)
(declare-fun b_18@3 () Bool)
(declare-fun Used_9Heap@0 () T@U)
(declare-fun b_18@4 () Bool)
(declare-fun b_15@9 () Bool)
(declare-fun b_15@10 () Bool)
(declare-fun b_15@11 () Bool)
(declare-fun b_15@12 () Bool)
(declare-fun CombineFrames (T@U T@U) T@U)
(declare-fun FrameFragment (T@U) T@U)
(declare-fun takeTransfer@5 () Real)
(declare-fun Mask@1 () T@U)
(declare-fun neededTransfer@9 () Real)
(declare-fun b_16@15 () Bool)
(declare-fun Used_9Mask@9 () T@U)
(declare-fun Heap@1 () T@U)
(declare-fun neededTransfer@10 () Real)
(declare-fun Used_9Mask@10 () T@U)
(declare-fun b_16@16 () Bool)
(declare-fun b_16@17 () Bool)
(declare-fun Mask@2 () T@U)
(declare-fun Heap@2 () T@U)
(declare-fun maskTransfer@5 () Real)
(declare-fun takeTransfer@4 () Real)
(declare-fun Used_9Mask@7 () T@U)
(declare-fun b_16@12 () Bool)
(declare-fun neededTransfer@7 () Real)
(declare-fun neededTransfer@8 () Real)
(declare-fun Used_9Mask@8 () T@U)
(declare-fun b_16@13 () Bool)
(declare-fun b_16@14 () Bool)
(declare-fun Ops_7Heap@2 () T@U)
(declare-fun Ops_7Mask@4 () T@U)
(declare-fun Ops_7Mask@3 () T@U)
(declare-fun Ops_7Heap@3 () T@U)
(declare-fun maskTransfer@4 () Real)
(declare-fun takeTransfer@3 () Real)
(declare-fun b_16@9 () Bool)
(declare-fun Used_9Mask@5 () T@U)
(declare-fun Ops_9Mask@3 () T@U)
(declare-fun neededTransfer@6 () Real)
(declare-fun Used_9Mask@6 () T@U)
(declare-fun b_16@10 () Bool)
(declare-fun b_16@11 () Bool)
(declare-fun Ops_9Mask@4 () T@U)
(declare-fun maskTransfer@3 () Real)
(declare-fun b_15@5 () Bool)
(declare-fun neededTransfer@5 () Real)
(declare-fun initNeededTransfer@0 () Real)
(declare-fun b_17@0 () Bool)
(declare-fun b_17@1 () Bool)
(declare-fun Result_2Heap () T@U)
(declare-fun Result_2Mask () T@U)
(declare-fun b_17@2 () Bool)
(declare-fun b_17@3 () Bool)
(declare-fun b_17@4 () Bool)
(declare-fun b_15@6 () Bool)
(declare-fun b_15@7 () Bool)
(declare-fun takeTransfer@2 () Real)
(declare-fun Used_9Mask@3 () T@U)
(declare-fun b_16@6 () Bool)
(declare-fun neededTransfer@3 () Real)
(declare-fun Heap@@11 () T@U)
(declare-fun neededTransfer@4 () Real)
(declare-fun Used_9Mask@4 () T@U)
(declare-fun b_16@7 () Bool)
(declare-fun b_16@8 () Bool)
(declare-fun Mask@0 () T@U)
(declare-fun Heap@0 () T@U)
(declare-fun maskTransfer@2 () Real)
(declare-fun takeTransfer@1 () Real)
(declare-fun Ops_7Heap@0 () T@U)
(declare-fun Ops_7Mask@1 () T@U)
(declare-fun neededTransfer@1 () Real)
(declare-fun b_16@3 () Bool)
(declare-fun Used_9Mask@1 () T@U)
(declare-fun neededTransfer@2 () Real)
(declare-fun Used_9Mask@2 () T@U)
(declare-fun b_16@4 () Bool)
(declare-fun b_16@5 () Bool)
(declare-fun Ops_7Mask@2 () T@U)
(declare-fun Ops_7Heap@1 () T@U)
(declare-fun maskTransfer@1 () Real)
(declare-fun takeTransfer@0 () Real)
(declare-fun Ops_9Mask@1 () T@U)
(declare-fun b_16@0 () Bool)
(declare-fun neededTransfer@0 () Real)
(declare-fun Used_9Mask@0 () T@U)
(declare-fun b_16@1 () Bool)
(declare-fun b_16@2 () Bool)
(declare-fun Ops_9Mask@2 () T@U)
(declare-fun maskTransfer@0 () Real)
(declare-fun b_16 () Bool)
(declare-fun b_15@4 () Bool)
(declare-fun b_15@3 () Bool)
(declare-fun b_15@0 () Bool)
(declare-fun b_15@1 () Bool)
(declare-fun Ops_9Mask@0 () T@U)
(declare-fun b_15@2 () Bool)
(declare-fun b_15 () Bool)
(declare-fun b_14@0 () Bool)
(declare-fun b_14 () Bool)
(declare-fun Used_8Heap@0 () T@U)
(declare-fun b_13@4 () Bool)
(declare-fun b_13@3 () Bool)
(declare-fun b_13@0 () Bool)
(declare-fun b_13@1 () Bool)
(declare-fun Ops_7Mask@0 () T@U)
(declare-fun b_13@2 () Bool)
(declare-fun b_13 () Bool)
(declare-fun b_12@0 () Bool)
(declare-fun b_12 () Bool)
(declare-fun Used_7Heap@0 () T@U)
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (= (type Used_11Heap@0) (MapType0Type RefType)) (= (type Mask@6) (MapType1Type RefType realType))) (= (type Mask@5) (MapType1Type RefType realType))) (= (type x@@20) RefType)) (= (type Heap@5) (MapType0Type RefType))) (= (type Heap@@11) (MapType0Type RefType))) (= (type Used_10Heap@0) (MapType0Type RefType))) (= (type Ops_7Mask@5) (MapType1Type RefType realType))) (= (type Ops_7Mask) (MapType1Type RefType realType))) (= (type Ops_7Heap) (MapType0Type RefType))) (= (type Mask@4) (MapType1Type RefType realType))) (= (type Heap@4) (MapType0Type RefType))) (= (type Ops_9Heap@4) (MapType0Type RefType))) (= (type Ops_9Heap@3) (MapType0Type RefType))) (= (type Ops_9Heap@5) (MapType0Type RefType))) (= (type Ops_9Mask@6) (MapType1Type RefType realType))) (= (type Heap@3) (MapType0Type RefType))) (= (type Mask@3) (MapType1Type RefType realType))) (= (type Ops_9Heap@1) (MapType0Type RefType))) (= (type Ops_9Heap@0) (MapType0Type RefType))) (= (type Ops_9Heap@2) (MapType0Type RefType))) (= (type freshVersion@0) FrameTypeType)) (= (type Used_9Mask@11) (MapType1Type RefType realType))) (= (type Result_3Heap) (MapType0Type RefType))) (= (type Result_3Mask) (MapType1Type RefType realType))) (= (type Ops_9Mask@5) (MapType1Type RefType realType))) (= (type Used_9Heap@0) (MapType0Type RefType))) (forall ((arg0@@42 T@U) (arg1@@50 T@U) ) (! (= (type (CombineFrames arg0@@42 arg1@@50)) FrameTypeType)
 :qid |funType:CombineFrames|
 :pattern ( (CombineFrames arg0@@42 arg1@@50))
))) (forall ((arg0@@43 T@U) ) (! (= (type (FrameFragment arg0@@43)) FrameTypeType)
 :qid |funType:FrameFragment|
 :pattern ( (FrameFragment arg0@@43))
))) (= (type Mask@1) (MapType1Type RefType realType))) (= (type Used_9Mask@9) (MapType1Type RefType realType))) (= (type Heap@1) (MapType0Type RefType))) (= (type Used_9Mask@10) (MapType1Type RefType realType))) (= (type Mask@2) (MapType1Type RefType realType))) (= (type Heap@2) (MapType0Type RefType))) (= (type Used_9Mask@7) (MapType1Type RefType realType))) (= (type Used_9Mask@8) (MapType1Type RefType realType))) (= (type Ops_7Heap@2) (MapType0Type RefType))) (= (type Ops_7Mask@4) (MapType1Type RefType realType))) (= (type Ops_7Mask@3) (MapType1Type RefType realType))) (= (type Ops_7Heap@3) (MapType0Type RefType))) (= (type Used_9Mask@5) (MapType1Type RefType realType))) (= (type Ops_9Mask@3) (MapType1Type RefType realType))) (= (type Used_9Mask@6) (MapType1Type RefType realType))) (= (type Ops_9Mask@4) (MapType1Type RefType realType))) (= (type Result_2Heap) (MapType0Type RefType))) (= (type Result_2Mask) (MapType1Type RefType realType))) (= (type Used_9Mask@3) (MapType1Type RefType realType))) (= (type Used_9Mask@4) (MapType1Type RefType realType))) (= (type Mask@0) (MapType1Type RefType realType))) (= (type Heap@0) (MapType0Type RefType))) (= (type Ops_7Heap@0) (MapType0Type RefType))) (= (type Ops_7Mask@1) (MapType1Type RefType realType))) (= (type Used_9Mask@1) (MapType1Type RefType realType))) (= (type Used_9Mask@2) (MapType1Type RefType realType))) (= (type Ops_7Mask@2) (MapType1Type RefType realType))) (= (type Ops_7Heap@1) (MapType0Type RefType))) (= (type Ops_9Mask@1) (MapType1Type RefType realType))) (= (type Used_9Mask@0) (MapType1Type RefType realType))) (= (type Ops_9Mask@2) (MapType1Type RefType realType))) (= (type Ops_9Mask@0) (MapType1Type RefType realType))) (= (type Used_8Heap@0) (MapType0Type RefType))) (= (type Ops_7Mask@0) (MapType1Type RefType realType))) (= (type Used_7Heap@0) (MapType0Type RefType))))
(set-info :boogie-vc-id test04)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 61) (let ((anon46_correct  (=> (and (= b_20@0  (and b_20 (state Used_11Heap@0 ZeroMask))) (= Mask@6 (MapType1Store Mask@5 null (wand_2 x@@20 FullPerm true) (real_2_U (+ (U_2_real (MapType1Select Mask@5 null (wand_2 x@@20 FullPerm true))) FullPerm))))) (=> (and (and (state Heap@5 Mask@6) (state Heap@5 Mask@6)) (and (state Heap@5 Mask@6) (= (ControlFlow 0 2) (- 0 1)))) false))))
(let ((anon45_correct  (=> (= b_19@0  (and b_19 (state Used_10Heap@0 ZeroMask))) (and (=> (= (ControlFlow 0 4) (- 0 5)) (=> (and (and b_15@15 (and b_15@15 b_13@5)) b_19@0) false)) (=> (=> (and (and b_15@15 (and b_15@15 b_13@5)) b_19@0) false) (=> (= Ops_7Mask@5 (MapType1Store Ops_7Mask null (wand_2 x@@20 FullPerm false) (real_2_U (+ (U_2_real (MapType1Select Ops_7Mask null (wand_2 x@@20 FullPerm false))) FullPerm)))) (=> (and (= b_13@6  (and b_13@5 (state Ops_7Heap Ops_7Mask@5))) (= b_13@7  (and b_13@6 (state Ops_7Heap Ops_7Mask@5)))) (=> (and (and (= b_13@8  (and b_13@7 (state Ops_7Heap Ops_7Mask@5))) (= Mask@5 Mask@4)) (and (= Heap@5 Heap@4) (= (ControlFlow 0 4) 2))) anon46_correct))))))))
(let ((anon44_correct  (=> (and (and (and (= Ops_9Heap@4 (MapType0Store Ops_9Heap@3 null (|Q#sm| x@@20) (MapType1Store (MapType0Select Ops_9Heap@3 null (|Q#sm| x@@20)) x@@20 f_7 (bool_2_U true)))) (= Ops_9Heap@5 (MapType0Store Ops_9Heap@4 null (|Q#sm| x@@20) (MapType1Store (MapType0Select Ops_9Heap@4 null (|Q#sm| x@@20)) x@@20 f_7 (bool_2_U true))))) (and (state Ops_9Heap@5 Ops_9Mask@6) (= b_15@14  (and b_15@13 (state Ops_9Heap@5 Ops_9Mask@6))))) (and (and (= b_15@15 b_15@14) (= Heap@4 Heap@3)) (and (= Mask@4 Mask@3) (= (ControlFlow 0 7) 4)))) anon45_correct)))
(let ((anon69_Else_correct  (=> (HasDirectPerm Ops_9Mask@6 null (Q x@@20)) (=> (and (= Ops_9Heap@3 Ops_9Heap@0) (= (ControlFlow 0 9) 7)) anon44_correct))))
(let ((anon69_Then_correct  (=> (not (HasDirectPerm Ops_9Mask@6 null (Q x@@20))) (=> (and (and (= Ops_9Heap@1 (MapType0Store Ops_9Heap@0 null (|Q#sm| x@@20) ZeroPMask)) (= Ops_9Heap@2 (MapType0Store Ops_9Heap@1 null (Q x@@20) freshVersion@0))) (and (= Ops_9Heap@3 Ops_9Heap@2) (= (ControlFlow 0 8) 7))) anon44_correct))))
(let ((anon42_correct  (and (=> (= (ControlFlow 0 10) (- 0 11)) (=> (and b_15@8 b_16@18) (and (= neededTransfer@11 0.0) (= (U_2_real (MapType1Select Used_9Mask@11 x@@20 f_7)) initNeededTransfer@1)))) (=> (=> (and b_15@8 b_16@18) (and (= neededTransfer@11 0.0) (= (U_2_real (MapType1Select Used_9Mask@11 x@@20 f_7)) initNeededTransfer@1))) (=> (= b_18@0  (and b_15@8 b_16@18)) (=> (and (and (= b_18@1  (and b_18@0 (state Result_3Heap Result_3Mask))) (= b_18@2  (and b_18@1 (sumMask Result_3Mask Ops_9Mask@5 Used_9Mask@11)))) (and (= b_18@3  (and (and b_18@2 (IdenticalOnKnownLocations Ops_9Heap@0 Result_3Heap Ops_9Mask@5)) (IdenticalOnKnownLocations Used_9Heap@0 Result_3Heap Used_9Mask@11))) (= b_18@4  (and b_18@3 (state Result_3Heap Result_3Mask))))) (=> (and (and (and (= b_15@9  (and b_15@8 b_18@4)) (= b_15@10  (and b_15@9 b_16@18))) (and (= b_15@11  (and b_15@10 (= Used_9Heap@0 Ops_9Heap@0))) (= Ops_9Mask@6 (MapType1Store Ops_9Mask@5 null (Q x@@20) (real_2_U (+ (U_2_real (MapType1Select Ops_9Mask@5 null (Q x@@20))) FullPerm)))))) (and (and (= b_15@12  (and b_15@11 (state Ops_9Heap@0 Ops_9Mask@6))) (= b_15@13  (and b_15@12 (state Ops_9Heap@0 Ops_9Mask@6)))) (and (|Q#trigger| Ops_9Heap@0 (Q x@@20)) (= (MapType0Select Ops_9Heap@0 null (Q x@@20)) (CombineFrames (FrameFragment (MapType0Select Ops_9Heap@0 x@@20 f_7)) (FrameFragment (MapType0Select Ops_9Heap@0 x@@20 f_7))))))) (and (=> (= (ControlFlow 0 10) 8) anon69_Then_correct) (=> (= (ControlFlow 0 10) 9) anon69_Else_correct)))))))))
(let ((anon68_Else_correct  (=> (>= 0.0 takeTransfer@5) (=> (and (= Mask@3 Mask@1) (= neededTransfer@11 neededTransfer@9)) (=> (and (and (= b_16@18 b_16@15) (= Used_9Mask@11 Used_9Mask@9)) (and (= Heap@3 Heap@1) (= (ControlFlow 0 14) 10))) anon42_correct)))))
(let ((anon68_Then_correct  (=> (> takeTransfer@5 0.0) (=> (and (and (= neededTransfer@10 (- neededTransfer@9 takeTransfer@5)) (= Used_9Mask@10 (MapType1Store Used_9Mask@9 x@@20 f_7 (real_2_U (+ (U_2_real (MapType1Select Used_9Mask@9 x@@20 f_7)) takeTransfer@5))))) (and (= b_16@16  (and b_16@15 (state Used_9Heap@0 Used_9Mask@10))) (= b_16@17  (and b_16@16 (= (U_2_int (MapType0Select Heap@1 x@@20 f_7)) (U_2_int (MapType0Select Used_9Heap@0 x@@20 f_7))))))) (=> (and (and (and (= Mask@2 (MapType1Store Mask@1 x@@20 f_7 (real_2_U (- (U_2_real (MapType1Select Mask@1 x@@20 f_7)) takeTransfer@5)))) (= Heap@2 (MapType0Store Heap@1 null (|wand_2#sm| x@@20 FullPerm false) (MapType1Store (MapType0Select Heap@1 null (|wand_2#sm| x@@20 FullPerm false)) x@@20 f_7 (bool_2_U true))))) (and (= Mask@3 Mask@2) (= neededTransfer@11 neededTransfer@10))) (and (and (= b_16@18 b_16@17) (= Used_9Mask@11 Used_9Mask@10)) (and (= Heap@3 Heap@2) (= (ControlFlow 0 13) 10)))) anon42_correct)))))
(let ((anon67_Else_correct  (=> (and (< maskTransfer@5 neededTransfer@9) (= takeTransfer@5 maskTransfer@5)) (and (=> (= (ControlFlow 0 16) 13) anon68_Then_correct) (=> (= (ControlFlow 0 16) 14) anon68_Else_correct)))))
(let ((anon67_Then_correct  (=> (and (<= neededTransfer@9 maskTransfer@5) (= takeTransfer@5 neededTransfer@9)) (and (=> (= (ControlFlow 0 15) 13) anon68_Then_correct) (=> (= (ControlFlow 0 15) 14) anon68_Else_correct)))))
(let ((anon66_Then_correct  (=> (and (and (and (and b_15@8 b_16@15) true) (> neededTransfer@9 0.0)) (= maskTransfer@5 (U_2_real (MapType1Select Mask@1 x@@20 f_7)))) (and (=> (= (ControlFlow 0 17) 15) anon67_Then_correct) (=> (= (ControlFlow 0 17) 16) anon67_Else_correct)))))
(let ((anon66_Else_correct  (=> (not (and (and (and b_15@8 b_16@15) true) (> neededTransfer@9 0.0))) (=> (and (= Mask@3 Mask@1) (= neededTransfer@11 neededTransfer@9)) (=> (and (and (= b_16@18 b_16@15) (= Used_9Mask@11 Used_9Mask@9)) (and (= Heap@3 Heap@1) (= (ControlFlow 0 12) 10))) anon42_correct)))))
(let ((anon65_Else_correct  (=> (and (and (>= 0.0 takeTransfer@4) (= Used_9Mask@9 Used_9Mask@7)) (and (= b_16@15 b_16@12) (= neededTransfer@9 neededTransfer@7))) (and (=> (= (ControlFlow 0 20) 17) anon66_Then_correct) (=> (= (ControlFlow 0 20) 12) anon66_Else_correct)))))
(let ((anon65_Then_correct  (=> (and (> takeTransfer@4 0.0) (= neededTransfer@8 (- neededTransfer@7 takeTransfer@4))) (=> (and (and (and (= Used_9Mask@8 (MapType1Store Used_9Mask@7 x@@20 f_7 (real_2_U (+ (U_2_real (MapType1Select Used_9Mask@7 x@@20 f_7)) takeTransfer@4)))) (= b_16@13  (and b_16@12 (state Used_9Heap@0 Used_9Mask@8)))) (and (= b_16@14  (and b_16@13 (= (U_2_int (MapType0Select Ops_7Heap@2 x@@20 f_7)) (U_2_int (MapType0Select Used_9Heap@0 x@@20 f_7))))) (= Ops_7Mask@4 (MapType1Store Ops_7Mask@3 x@@20 f_7 (real_2_U (- (U_2_real (MapType1Select Ops_7Mask@3 x@@20 f_7)) takeTransfer@4)))))) (and (and (= Ops_7Heap@3 (MapType0Store Ops_7Heap@2 null (|wand_2#sm| x@@20 FullPerm false) (MapType1Store (MapType0Select Ops_7Heap@2 null (|wand_2#sm| x@@20 FullPerm false)) x@@20 f_7 (bool_2_U true)))) (= Used_9Mask@9 Used_9Mask@8)) (and (= b_16@15 b_16@14) (= neededTransfer@9 neededTransfer@8)))) (and (=> (= (ControlFlow 0 19) 17) anon66_Then_correct) (=> (= (ControlFlow 0 19) 12) anon66_Else_correct))))))
(let ((anon64_Else_correct  (=> (and (< maskTransfer@4 neededTransfer@7) (= takeTransfer@4 maskTransfer@4)) (and (=> (= (ControlFlow 0 22) 19) anon65_Then_correct) (=> (= (ControlFlow 0 22) 20) anon65_Else_correct)))))
(let ((anon64_Then_correct  (=> (and (<= neededTransfer@7 maskTransfer@4) (= takeTransfer@4 neededTransfer@7)) (and (=> (= (ControlFlow 0 21) 19) anon65_Then_correct) (=> (= (ControlFlow 0 21) 20) anon65_Else_correct)))))
(let ((anon63_Then_correct  (=> (and (and (and (and b_15@8 b_16@12) true) (> neededTransfer@7 0.0)) (= maskTransfer@4 (U_2_real (MapType1Select Ops_7Mask@3 x@@20 f_7)))) (and (=> (= (ControlFlow 0 23) 21) anon64_Then_correct) (=> (= (ControlFlow 0 23) 22) anon64_Else_correct)))))
(let ((anon63_Else_correct  (=> (and (and (not (and (and (and b_15@8 b_16@12) true) (> neededTransfer@7 0.0))) (= Used_9Mask@9 Used_9Mask@7)) (and (= b_16@15 b_16@12) (= neededTransfer@9 neededTransfer@7))) (and (=> (= (ControlFlow 0 18) 17) anon66_Then_correct) (=> (= (ControlFlow 0 18) 12) anon66_Else_correct)))))
(let ((anon62_Else_correct  (=> (>= 0.0 takeTransfer@3) (=> (and (and (= neededTransfer@7 FullPerm) (= b_16@12 b_16@9)) (and (= Used_9Mask@7 Used_9Mask@5) (= Ops_9Mask@5 Ops_9Mask@3))) (and (=> (= (ControlFlow 0 26) 23) anon63_Then_correct) (=> (= (ControlFlow 0 26) 18) anon63_Else_correct))))))
(let ((anon62_Then_correct  (=> (and (> takeTransfer@3 0.0) (= neededTransfer@6 (- FullPerm takeTransfer@3))) (=> (and (and (and (= Used_9Mask@6 (MapType1Store Used_9Mask@5 x@@20 f_7 (real_2_U (+ (U_2_real (MapType1Select Used_9Mask@5 x@@20 f_7)) takeTransfer@3)))) (= b_16@10  (and b_16@9 (state Used_9Heap@0 Used_9Mask@6)))) (and (= b_16@11  (and b_16@10 (= (U_2_int (MapType0Select Ops_9Heap@0 x@@20 f_7)) (U_2_int (MapType0Select Used_9Heap@0 x@@20 f_7))))) (= Ops_9Mask@4 (MapType1Store Ops_9Mask@3 x@@20 f_7 (real_2_U (- (U_2_real (MapType1Select Ops_9Mask@3 x@@20 f_7)) takeTransfer@3)))))) (and (and (= neededTransfer@7 neededTransfer@6) (= b_16@12 b_16@11)) (and (= Used_9Mask@7 Used_9Mask@6) (= Ops_9Mask@5 Ops_9Mask@4)))) (and (=> (= (ControlFlow 0 25) 23) anon63_Then_correct) (=> (= (ControlFlow 0 25) 18) anon63_Else_correct))))))
(let ((anon61_Else_correct  (=> (and (< maskTransfer@3 FullPerm) (= takeTransfer@3 maskTransfer@3)) (and (=> (= (ControlFlow 0 28) 25) anon62_Then_correct) (=> (= (ControlFlow 0 28) 26) anon62_Else_correct)))))
(let ((anon61_Then_correct  (=> (and (<= FullPerm maskTransfer@3) (= takeTransfer@3 FullPerm)) (and (=> (= (ControlFlow 0 27) 25) anon62_Then_correct) (=> (= (ControlFlow 0 27) 26) anon62_Else_correct)))))
(let ((anon60_Then_correct  (=> (and (and (and (and b_15@8 b_16@9) true) (> FullPerm 0.0)) (= maskTransfer@3 (U_2_real (MapType1Select Ops_9Mask@3 x@@20 f_7)))) (and (=> (= (ControlFlow 0 29) 27) anon61_Then_correct) (=> (= (ControlFlow 0 29) 28) anon61_Else_correct)))))
(let ((anon60_Else_correct  (=> (not (and (and (and b_15@8 b_16@9) true) (> FullPerm 0.0))) (=> (and (and (= neededTransfer@7 FullPerm) (= b_16@12 b_16@9)) (and (= Used_9Mask@7 Used_9Mask@5) (= Ops_9Mask@5 Ops_9Mask@3))) (and (=> (= (ControlFlow 0 24) 23) anon63_Then_correct) (=> (= (ControlFlow 0 24) 18) anon63_Else_correct))))))
(let ((anon24_correct  (and (=> (= (ControlFlow 0 30) (- 0 32)) (=> (and b_15@5 b_16@9) (and (= neededTransfer@5 0.0) (= (U_2_real (MapType1Select Used_9Mask@5 x@@20 f_7)) initNeededTransfer@0)))) (=> (=> (and b_15@5 b_16@9) (and (= neededTransfer@5 0.0) (= (U_2_real (MapType1Select Used_9Mask@5 x@@20 f_7)) initNeededTransfer@0))) (=> (= b_17@0  (and b_15@5 b_16@9)) (=> (and (and (and (= b_17@1  (and b_17@0 (state Result_2Heap Result_2Mask))) (= b_17@2  (and b_17@1 (sumMask Result_2Mask Ops_9Mask@3 Used_9Mask@5)))) (and (= b_17@3  (and (and b_17@2 (IdenticalOnKnownLocations Ops_9Heap@0 Result_2Heap Ops_9Mask@3)) (IdenticalOnKnownLocations Used_9Heap@0 Result_2Heap Used_9Mask@5))) (= b_17@4  (and b_17@3 (state Result_2Heap Result_2Mask))))) (and (and (= b_15@6  (and b_15@5 b_17@4)) (= b_15@7  (and b_15@6 b_16@9))) (and (= b_15@8  (and b_15@7 (= Used_9Heap@0 Ops_9Heap@0))) (= initNeededTransfer@1 (+ (U_2_real (MapType1Select Used_9Mask@5 x@@20 f_7)) FullPerm))))) (and (=> (= (ControlFlow 0 30) (- 0 31)) (>= FullPerm 0.0)) (=> (>= FullPerm 0.0) (and (=> (= (ControlFlow 0 30) 29) anon60_Then_correct) (=> (= (ControlFlow 0 30) 24) anon60_Else_correct))))))))))
(let ((anon59_Else_correct  (=> (>= 0.0 takeTransfer@2) (=> (and (= Mask@1 ZeroMask) (= Used_9Mask@5 Used_9Mask@3)) (=> (and (and (= b_16@9 b_16@6) (= neededTransfer@5 neededTransfer@3)) (and (= Heap@1 Heap@@11) (= (ControlFlow 0 35) 30))) anon24_correct)))))
(let ((anon59_Then_correct  (=> (> takeTransfer@2 0.0) (=> (and (and (= neededTransfer@4 (- neededTransfer@3 takeTransfer@2)) (= Used_9Mask@4 (MapType1Store Used_9Mask@3 x@@20 f_7 (real_2_U (+ (U_2_real (MapType1Select Used_9Mask@3 x@@20 f_7)) takeTransfer@2))))) (and (= b_16@7  (and b_16@6 (state Used_9Heap@0 Used_9Mask@4))) (= b_16@8  (and b_16@7 (= (U_2_int (MapType0Select Heap@@11 x@@20 f_7)) (U_2_int (MapType0Select Used_9Heap@0 x@@20 f_7))))))) (=> (and (and (and (= Mask@0 (MapType1Store ZeroMask x@@20 f_7 (real_2_U (- (U_2_real (MapType1Select ZeroMask x@@20 f_7)) takeTransfer@2)))) (= Heap@0 (MapType0Store Heap@@11 null (|wand_2#sm| x@@20 FullPerm false) (MapType1Store (MapType0Select Heap@@11 null (|wand_2#sm| x@@20 FullPerm false)) x@@20 f_7 (bool_2_U true))))) (and (= Mask@1 Mask@0) (= Used_9Mask@5 Used_9Mask@4))) (and (and (= b_16@9 b_16@8) (= neededTransfer@5 neededTransfer@4)) (and (= Heap@1 Heap@0) (= (ControlFlow 0 34) 30)))) anon24_correct)))))
(let ((anon58_Else_correct  (=> (and (< maskTransfer@2 neededTransfer@3) (= takeTransfer@2 maskTransfer@2)) (and (=> (= (ControlFlow 0 37) 34) anon59_Then_correct) (=> (= (ControlFlow 0 37) 35) anon59_Else_correct)))))
(let ((anon58_Then_correct  (=> (and (<= neededTransfer@3 maskTransfer@2) (= takeTransfer@2 neededTransfer@3)) (and (=> (= (ControlFlow 0 36) 34) anon59_Then_correct) (=> (= (ControlFlow 0 36) 35) anon59_Else_correct)))))
(let ((anon57_Then_correct  (=> (and (and (and (and b_15@5 b_16@6) true) (> neededTransfer@3 0.0)) (= maskTransfer@2 (U_2_real (MapType1Select ZeroMask x@@20 f_7)))) (and (=> (= (ControlFlow 0 38) 36) anon58_Then_correct) (=> (= (ControlFlow 0 38) 37) anon58_Else_correct)))))
(let ((anon57_Else_correct  (=> (not (and (and (and b_15@5 b_16@6) true) (> neededTransfer@3 0.0))) (=> (and (= Mask@1 ZeroMask) (= Used_9Mask@5 Used_9Mask@3)) (=> (and (and (= b_16@9 b_16@6) (= neededTransfer@5 neededTransfer@3)) (and (= Heap@1 Heap@@11) (= (ControlFlow 0 33) 30))) anon24_correct)))))
(let ((anon56_Else_correct  (=> (and (>= 0.0 takeTransfer@1) (= Ops_7Heap@2 Ops_7Heap@0)) (=> (and (and (= Ops_7Mask@3 Ops_7Mask@1) (= neededTransfer@3 neededTransfer@1)) (and (= b_16@6 b_16@3) (= Used_9Mask@3 Used_9Mask@1))) (and (=> (= (ControlFlow 0 41) 38) anon57_Then_correct) (=> (= (ControlFlow 0 41) 33) anon57_Else_correct))))))
(let ((anon56_Then_correct  (=> (and (and (> takeTransfer@1 0.0) (= neededTransfer@2 (- neededTransfer@1 takeTransfer@1))) (and (= Used_9Mask@2 (MapType1Store Used_9Mask@1 x@@20 f_7 (real_2_U (+ (U_2_real (MapType1Select Used_9Mask@1 x@@20 f_7)) takeTransfer@1)))) (= b_16@4  (and b_16@3 (state Used_9Heap@0 Used_9Mask@2))))) (=> (and (and (and (= b_16@5  (and b_16@4 (= (U_2_int (MapType0Select Ops_7Heap@0 x@@20 f_7)) (U_2_int (MapType0Select Used_9Heap@0 x@@20 f_7))))) (= Ops_7Mask@2 (MapType1Store Ops_7Mask@1 x@@20 f_7 (real_2_U (- (U_2_real (MapType1Select Ops_7Mask@1 x@@20 f_7)) takeTransfer@1))))) (and (= Ops_7Heap@1 (MapType0Store Ops_7Heap@0 null (|wand_2#sm| x@@20 FullPerm false) (MapType1Store (MapType0Select Ops_7Heap@0 null (|wand_2#sm| x@@20 FullPerm false)) x@@20 f_7 (bool_2_U true)))) (= Ops_7Heap@2 Ops_7Heap@1))) (and (and (= Ops_7Mask@3 Ops_7Mask@2) (= neededTransfer@3 neededTransfer@2)) (and (= b_16@6 b_16@5) (= Used_9Mask@3 Used_9Mask@2)))) (and (=> (= (ControlFlow 0 40) 38) anon57_Then_correct) (=> (= (ControlFlow 0 40) 33) anon57_Else_correct))))))
(let ((anon55_Else_correct  (=> (and (< maskTransfer@1 neededTransfer@1) (= takeTransfer@1 maskTransfer@1)) (and (=> (= (ControlFlow 0 43) 40) anon56_Then_correct) (=> (= (ControlFlow 0 43) 41) anon56_Else_correct)))))
(let ((anon55_Then_correct  (=> (and (<= neededTransfer@1 maskTransfer@1) (= takeTransfer@1 neededTransfer@1)) (and (=> (= (ControlFlow 0 42) 40) anon56_Then_correct) (=> (= (ControlFlow 0 42) 41) anon56_Else_correct)))))
(let ((anon54_Then_correct  (=> (and (and (and (and b_15@5 b_16@3) true) (> neededTransfer@1 0.0)) (= maskTransfer@1 (U_2_real (MapType1Select Ops_7Mask@1 x@@20 f_7)))) (and (=> (= (ControlFlow 0 44) 42) anon55_Then_correct) (=> (= (ControlFlow 0 44) 43) anon55_Else_correct)))))
(let ((anon54_Else_correct  (=> (and (not (and (and (and b_15@5 b_16@3) true) (> neededTransfer@1 0.0))) (= Ops_7Heap@2 Ops_7Heap@0)) (=> (and (and (= Ops_7Mask@3 Ops_7Mask@1) (= neededTransfer@3 neededTransfer@1)) (and (= b_16@6 b_16@3) (= Used_9Mask@3 Used_9Mask@1))) (and (=> (= (ControlFlow 0 39) 38) anon57_Then_correct) (=> (= (ControlFlow 0 39) 33) anon57_Else_correct))))))
(let ((anon53_Else_correct  (=> (>= 0.0 takeTransfer@0) (=> (and (and (= Ops_9Mask@3 Ops_9Mask@1) (= Used_9Mask@1 ZeroMask)) (and (= b_16@3 b_16@0) (= neededTransfer@1 FullPerm))) (and (=> (= (ControlFlow 0 47) 44) anon54_Then_correct) (=> (= (ControlFlow 0 47) 39) anon54_Else_correct))))))
(let ((anon53_Then_correct  (=> (and (> takeTransfer@0 0.0) (= neededTransfer@0 (- FullPerm takeTransfer@0))) (=> (and (and (and (= Used_9Mask@0 (MapType1Store ZeroMask x@@20 f_7 (real_2_U (+ (U_2_real (MapType1Select ZeroMask x@@20 f_7)) takeTransfer@0)))) (= b_16@1  (and b_16@0 (state Used_9Heap@0 Used_9Mask@0)))) (and (= b_16@2  (and b_16@1 (= (U_2_int (MapType0Select Ops_9Heap@0 x@@20 f_7)) (U_2_int (MapType0Select Used_9Heap@0 x@@20 f_7))))) (= Ops_9Mask@2 (MapType1Store Ops_9Mask@1 x@@20 f_7 (real_2_U (- (U_2_real (MapType1Select Ops_9Mask@1 x@@20 f_7)) takeTransfer@0)))))) (and (and (= Ops_9Mask@3 Ops_9Mask@2) (= Used_9Mask@1 Used_9Mask@0)) (and (= b_16@3 b_16@2) (= neededTransfer@1 neededTransfer@0)))) (and (=> (= (ControlFlow 0 46) 44) anon54_Then_correct) (=> (= (ControlFlow 0 46) 39) anon54_Else_correct))))))
(let ((anon52_Else_correct  (=> (and (< maskTransfer@0 FullPerm) (= takeTransfer@0 maskTransfer@0)) (and (=> (= (ControlFlow 0 49) 46) anon53_Then_correct) (=> (= (ControlFlow 0 49) 47) anon53_Else_correct)))))
(let ((anon52_Then_correct  (=> (and (<= FullPerm maskTransfer@0) (= takeTransfer@0 FullPerm)) (and (=> (= (ControlFlow 0 48) 46) anon53_Then_correct) (=> (= (ControlFlow 0 48) 47) anon53_Else_correct)))))
(let ((anon51_Then_correct  (=> (and (and (and (and b_15@5 b_16@0) true) (> FullPerm 0.0)) (= maskTransfer@0 (U_2_real (MapType1Select Ops_9Mask@1 x@@20 f_7)))) (and (=> (= (ControlFlow 0 50) 48) anon52_Then_correct) (=> (= (ControlFlow 0 50) 49) anon52_Else_correct)))))
(let ((anon51_Else_correct  (=> (not (and (and (and b_15@5 b_16@0) true) (> FullPerm 0.0))) (=> (and (and (= Ops_9Mask@3 Ops_9Mask@1) (= Used_9Mask@1 ZeroMask)) (and (= b_16@3 b_16@0) (= neededTransfer@1 FullPerm))) (and (=> (= (ControlFlow 0 45) 44) anon54_Then_correct) (=> (= (ControlFlow 0 45) 39) anon54_Else_correct))))))
(let ((anon50_Then_correct  (=> (and (and b_15@5 b_13@5) (and (= b_16@0  (and b_16 (state Used_9Heap@0 ZeroMask))) (= initNeededTransfer@0 (+ (U_2_real (MapType1Select ZeroMask x@@20 f_7)) FullPerm)))) (and (=> (= (ControlFlow 0 51) (- 0 52)) (>= FullPerm 0.0)) (=> (>= FullPerm 0.0) (and (=> (= (ControlFlow 0 51) 50) anon51_Then_correct) (=> (= (ControlFlow 0 51) 45) anon51_Else_correct)))))))
(let ((anon50_Else_correct  (=> (not (and b_15@5 b_13@5)) (=> (and (and (= b_15@15 b_15@5) (= Heap@4 Heap@@11)) (and (= Mask@4 ZeroMask) (= (ControlFlow 0 6) 4))) anon45_correct))))
(let ((anon5_correct  (=> (and (= b_15@4  (and b_15@3 (state Ops_9Heap@0 Ops_9Mask@1))) (= b_15@5  (and b_15@4 (state Ops_9Heap@0 Ops_9Mask@1)))) (and (=> (= (ControlFlow 0 53) 51) anon50_Then_correct) (=> (= (ControlFlow 0 53) 6) anon50_Else_correct)))))
(let ((anon49_Else_correct  (=> (and (and (not b_15@0) (= Ops_9Mask@1 ZeroMask)) (and (= b_15@3 b_15@0) (= (ControlFlow 0 55) 53))) anon5_correct)))
(let ((anon49_Then_correct  (=> b_15@0 (=> (and (= b_15@1  (and b_15@0 (not (= x@@20 null)))) (= Ops_9Mask@0 (MapType1Store ZeroMask x@@20 f_7 (real_2_U (+ (U_2_real (MapType1Select ZeroMask x@@20 f_7)) FullPerm))))) (=> (and (and (= b_15@2  (and b_15@1 (state Ops_9Heap@0 Ops_9Mask@0))) (= Ops_9Mask@1 Ops_9Mask@0)) (and (= b_15@3 b_15@2) (= (ControlFlow 0 54) 53))) anon5_correct)))))
(let ((anon48_Then_correct  (=> b_13@5 (=> (and (= b_15@0  (and b_15 (state Ops_9Heap@0 ZeroMask))) (= b_14@0  (and b_14 (state Used_8Heap@0 ZeroMask)))) (and (=> (= (ControlFlow 0 56) 54) anon49_Then_correct) (=> (= (ControlFlow 0 56) 55) anon49_Else_correct))))))
(let ((anon48_Else_correct  (=> (and (and (not b_13@5) (= Mask@5 ZeroMask)) (and (= Heap@5 Heap@@11) (= (ControlFlow 0 3) 2))) anon46_correct)))
(let ((anon2_correct  (=> (and (= b_13@4  (and b_13@3 (state Ops_7Heap@0 Ops_7Mask@1))) (= b_13@5  (and b_13@4 (state Ops_7Heap@0 Ops_7Mask@1)))) (and (=> (= (ControlFlow 0 57) 56) anon48_Then_correct) (=> (= (ControlFlow 0 57) 3) anon48_Else_correct)))))
(let ((anon47_Else_correct  (=> (and (and (not b_13@0) (= Ops_7Mask@1 ZeroMask)) (and (= b_13@3 b_13@0) (= (ControlFlow 0 59) 57))) anon2_correct)))
(let ((anon47_Then_correct  (=> b_13@0 (=> (and (= b_13@1  (and b_13@0 (not (= x@@20 null)))) (= Ops_7Mask@0 (MapType1Store ZeroMask x@@20 f_7 (real_2_U (+ (U_2_real (MapType1Select ZeroMask x@@20 f_7)) FullPerm))))) (=> (and (and (= b_13@2  (and b_13@1 (state Ops_7Heap@0 Ops_7Mask@0))) (= Ops_7Mask@1 Ops_7Mask@0)) (and (= b_13@3 b_13@2) (= (ControlFlow 0 58) 57))) anon2_correct)))))
(let ((anon0_correct  (=> (and (and (state Heap@@11 ZeroMask) (U_2_bool (MapType0Select Heap@@11 x@@20 $allocated))) (and (= b_13@0  (and b_13 (state Ops_7Heap@0 ZeroMask))) (= b_12@0  (and b_12 (state Used_7Heap@0 ZeroMask))))) (and (=> (= (ControlFlow 0 60) 58) anon47_Then_correct) (=> (= (ControlFlow 0 60) 59) anon47_Else_correct)))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 61) 60) anon0_correct)))
PreconditionGeneratedEntry_correct))))))))))))))))))))))))))))))))))))))))))))))))))))))))
))
(check-sat)
(get-info :reason-unknown)
(assert (not (= (ControlFlow 0 2) (- 1))))
(check-sat)
(pop 1)
; Invalid
(get-info :rlimit)
