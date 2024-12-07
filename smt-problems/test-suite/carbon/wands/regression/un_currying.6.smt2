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
(declare-fun succHeap (T@U T@U) Bool)
(declare-fun MapType0Type (T@T) T@T)
(declare-fun RefType () T@T)
(declare-fun succHeapTrans (T@U T@U) Bool)
(declare-fun MapType0TypeInv0 (T@T) T@T)
(declare-fun FieldType (T@T T@T) T@T)
(declare-fun FieldTypeInv0 (T@T) T@T)
(declare-fun FieldTypeInv1 (T@T) T@T)
(declare-fun MapType0Select (T@U T@U T@U) T@U)
(declare-fun MapType0Store (T@U T@U T@U T@U) T@U)
(declare-fun state (T@U T@U) Bool)
(declare-fun MapType1Type (T@T T@T) T@T)
(declare-fun GoodMask (T@U) Bool)
(declare-fun MapType1TypeInv0 (T@T) T@T)
(declare-fun MapType1TypeInv1 (T@T) T@T)
(declare-fun MapType1Select (T@U T@U T@U) T@U)
(declare-fun MapType1Store (T@U T@U T@U T@U) T@U)
(declare-fun wand (Real Real Real) T@U)
(declare-fun IsWandField (T@U) Bool)
(declare-fun WandType_wandType () T@T)
(declare-fun |wand#ft| (Real Real Real) T@U)
(declare-fun FrameTypeType () T@T)
(declare-fun wand_2 (Real Real Real) T@U)
(declare-fun WandType_wand_2Type () T@T)
(declare-fun |wand_2#ft| (Real Real Real) T@U)
(declare-fun getPredWandId (T@U) Int)
(declare-fun IsPredicateField (T@U) Bool)
(declare-fun wand_3 (Bool Real) T@U)
(declare-fun WandType_wand_3Type () T@T)
(declare-fun |wand_3#ft| (Bool Real) T@U)
(declare-fun wand_4 (Bool Bool) T@U)
(declare-fun WandType_wand_4Type () T@T)
(declare-fun |wand_4#ft| (Bool Bool) T@U)
(declare-fun wand_1 (Real Real) T@U)
(declare-fun WandType_wand_1Type () T@T)
(declare-fun |wand_1#ft| (Real Real) T@U)
(declare-fun IdenticalOnKnownLocations (T@U T@U T@U) Bool)
(declare-fun null () T@U)
(declare-fun PredicateMaskField (T@U) T@U)
(declare-fun HasDirectPerm (T@U T@U T@U) Bool)
(declare-fun WandMaskField (T@U) T@U)
(declare-fun P () T@U)
(declare-fun PredicateType_PType () T@T)
(declare-fun Q () T@U)
(declare-fun PredicateType_QType () T@T)
(declare-fun R () T@U)
(declare-fun PredicateType_RType () T@T)
(declare-fun |wand#sm| (Real Real Real) T@U)
(declare-fun |wand_2#sm| (Real Real Real) T@U)
(declare-fun $allocated () T@U)
(declare-fun NormalFieldType () T@T)
(declare-fun dummyHeap () T@U)
(declare-fun ZeroMask () T@U)
(declare-fun InsidePredicate (T@U T@U T@U T@U) Bool)
(declare-fun sumMask (T@U T@U T@U) Bool)
(declare-fun ConditionalFrame (Real T@U) T@U)
(declare-fun EmptyFrame () T@U)
(declare-fun NoPerm () Real)
(declare-fun FullPerm () Real)
(declare-fun |P#trigger| (T@U T@U) Bool)
(declare-fun |P#everUsed| (T@U) Bool)
(declare-fun |Q#trigger| (T@U T@U) Bool)
(declare-fun |Q#everUsed| (T@U) Bool)
(declare-fun |R#trigger| (T@U T@U) Bool)
(declare-fun |R#everUsed| (T@U) Bool)
(declare-fun |wand_3#sm| (Bool Real) T@U)
(declare-fun |wand_4#sm| (Bool Bool) T@U)
(declare-fun |wand_1#sm| (Real Real) T@U)
(declare-fun |P#sm| () T@U)
(declare-fun |Q#sm| () T@U)
(declare-fun |R#sm| () T@U)
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
(assert  (and (and (and (and (and (and (and (and (and (forall ((arg0@@11 T@T) ) (! (= (Ctor (MapType0Type arg0@@11)) 6)
 :qid |ctor:MapType0Type|
)) (forall ((arg0@@12 T@T) ) (! (= (MapType0TypeInv0 (MapType0Type arg0@@12)) arg0@@12)
 :qid |typeInv:MapType0TypeInv0|
 :pattern ( (MapType0Type arg0@@12))
))) (forall ((arg0@@13 T@T) (arg1 T@T) ) (! (= (Ctor (FieldType arg0@@13 arg1)) 7)
 :qid |ctor:FieldType|
))) (forall ((arg0@@14 T@T) (arg1@@0 T@T) ) (! (= (FieldTypeInv0 (FieldType arg0@@14 arg1@@0)) arg0@@14)
 :qid |typeInv:FieldTypeInv0|
 :pattern ( (FieldType arg0@@14 arg1@@0))
))) (forall ((arg0@@15 T@T) (arg1@@1 T@T) ) (! (= (FieldTypeInv1 (FieldType arg0@@15 arg1@@1)) arg1@@1)
 :qid |typeInv:FieldTypeInv1|
 :pattern ( (FieldType arg0@@15 arg1@@1))
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
)))) (= (Ctor RefType) 8)))
(assert (forall ((Heap0 T@U) (Heap1 T@U) ) (!  (=> (and (and (= (type Heap0) (MapType0Type RefType)) (= (type Heap1) (MapType0Type RefType))) (succHeap Heap0 Heap1)) (succHeapTrans Heap0 Heap1))
 :qid |stdinbpl.88:15|
 :skolemid |11|
 :pattern ( (succHeap Heap0 Heap1))
)))
(assert  (and (and (and (and (and (and (forall ((arg0@@18 T@T) (arg1@@4 T@T) ) (! (= (Ctor (MapType1Type arg0@@18 arg1@@4)) 9)
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
(assert  (and (= (Ctor WandType_wandType) 10) (forall ((arg0@@23 Real) (arg1@@9 Real) (arg2@@3 Real) ) (! (= (type (wand arg0@@23 arg1@@9 arg2@@3)) (FieldType WandType_wandType intType))
 :qid |funType:wand|
 :pattern ( (wand arg0@@23 arg1@@9 arg2@@3))
))))
(assert (forall ((arg1@@10 Real) (arg2@@4 Real) (arg3@@1 Real) ) (! (IsWandField (wand arg1@@10 arg2@@4 arg3@@1))
 :qid |stdinbpl.215:15|
 :skolemid |29|
 :pattern ( (wand arg1@@10 arg2@@4 arg3@@1))
)))
(assert  (and (= (Ctor FrameTypeType) 11) (forall ((arg0@@24 Real) (arg1@@11 Real) (arg2@@5 Real) ) (! (= (type (|wand#ft| arg0@@24 arg1@@11 arg2@@5)) (FieldType WandType_wandType FrameTypeType))
 :qid |funType:wand#ft|
 :pattern ( (|wand#ft| arg0@@24 arg1@@11 arg2@@5))
))))
(assert (forall ((arg1@@12 Real) (arg2@@6 Real) (arg3@@2 Real) ) (! (IsWandField (|wand#ft| arg1@@12 arg2@@6 arg3@@2))
 :qid |stdinbpl.219:15|
 :skolemid |30|
 :pattern ( (|wand#ft| arg1@@12 arg2@@6 arg3@@2))
)))
(assert  (and (= (Ctor WandType_wand_2Type) 12) (forall ((arg0@@25 Real) (arg1@@13 Real) (arg2@@7 Real) ) (! (= (type (wand_2 arg0@@25 arg1@@13 arg2@@7)) (FieldType WandType_wand_2Type intType))
 :qid |funType:wand_2|
 :pattern ( (wand_2 arg0@@25 arg1@@13 arg2@@7))
))))
(assert (forall ((arg1@@14 Real) (arg2@@8 Real) (arg3@@3 Real) ) (! (IsWandField (wand_2 arg1@@14 arg2@@8 arg3@@3))
 :qid |stdinbpl.247:15|
 :skolemid |36|
 :pattern ( (wand_2 arg1@@14 arg2@@8 arg3@@3))
)))
(assert (forall ((arg0@@26 Real) (arg1@@15 Real) (arg2@@9 Real) ) (! (= (type (|wand_2#ft| arg0@@26 arg1@@15 arg2@@9)) (FieldType WandType_wand_2Type FrameTypeType))
 :qid |funType:wand_2#ft|
 :pattern ( (|wand_2#ft| arg0@@26 arg1@@15 arg2@@9))
)))
(assert (forall ((arg1@@16 Real) (arg2@@10 Real) (arg3@@4 Real) ) (! (IsWandField (|wand_2#ft| arg1@@16 arg2@@10 arg3@@4))
 :qid |stdinbpl.251:15|
 :skolemid |37|
 :pattern ( (|wand_2#ft| arg1@@16 arg2@@10 arg3@@4))
)))
(assert (forall ((arg1@@17 Real) (arg2@@11 Real) (arg3@@5 Real) ) (! (= (getPredWandId (wand arg1@@17 arg2@@11 arg3@@5)) 4)
 :qid |stdinbpl.235:15|
 :skolemid |34|
 :pattern ( (wand arg1@@17 arg2@@11 arg3@@5))
)))
(assert (forall ((arg1@@18 Real) (arg2@@12 Real) (arg3@@6 Real) ) (! (= (getPredWandId (wand_2 arg1@@18 arg2@@12 arg3@@6)) 5)
 :qid |stdinbpl.267:15|
 :skolemid |41|
 :pattern ( (wand_2 arg1@@18 arg2@@12 arg3@@6))
)))
(assert (forall ((arg1@@19 Real) (arg2@@13 Real) (arg3@@7 Real) ) (!  (not (IsPredicateField (wand arg1@@19 arg2@@13 arg3@@7)))
 :qid |stdinbpl.223:15|
 :skolemid |31|
 :pattern ( (wand arg1@@19 arg2@@13 arg3@@7))
)))
(assert (forall ((arg1@@20 Real) (arg2@@14 Real) (arg3@@8 Real) ) (!  (not (IsPredicateField (|wand#ft| arg1@@20 arg2@@14 arg3@@8)))
 :qid |stdinbpl.227:15|
 :skolemid |32|
 :pattern ( (|wand#ft| arg1@@20 arg2@@14 arg3@@8))
)))
(assert (forall ((arg1@@21 Real) (arg2@@15 Real) (arg3@@9 Real) ) (!  (not (IsPredicateField (wand_2 arg1@@21 arg2@@15 arg3@@9)))
 :qid |stdinbpl.255:15|
 :skolemid |38|
 :pattern ( (wand_2 arg1@@21 arg2@@15 arg3@@9))
)))
(assert (forall ((arg1@@22 Real) (arg2@@16 Real) (arg3@@10 Real) ) (!  (not (IsPredicateField (|wand_2#ft| arg1@@22 arg2@@16 arg3@@10)))
 :qid |stdinbpl.259:15|
 :skolemid |39|
 :pattern ( (|wand_2#ft| arg1@@22 arg2@@16 arg3@@10))
)))
(assert  (and (= (Ctor WandType_wand_3Type) 13) (forall ((arg0@@27 Bool) (arg1@@23 Real) ) (! (= (type (wand_3 arg0@@27 arg1@@23)) (FieldType WandType_wand_3Type intType))
 :qid |funType:wand_3|
 :pattern ( (wand_3 arg0@@27 arg1@@23))
))))
(assert (forall ((arg1@@24 Bool) (arg2@@17 Real) ) (! (IsWandField (wand_3 arg1@@24 arg2@@17))
 :qid |stdinbpl.183:15|
 :skolemid |22|
 :pattern ( (wand_3 arg1@@24 arg2@@17))
)))
(assert (forall ((arg0@@28 Bool) (arg1@@25 Real) ) (! (= (type (|wand_3#ft| arg0@@28 arg1@@25)) (FieldType WandType_wand_3Type FrameTypeType))
 :qid |funType:wand_3#ft|
 :pattern ( (|wand_3#ft| arg0@@28 arg1@@25))
)))
(assert (forall ((arg1@@26 Bool) (arg2@@18 Real) ) (! (IsWandField (|wand_3#ft| arg1@@26 arg2@@18))
 :qid |stdinbpl.187:15|
 :skolemid |23|
 :pattern ( (|wand_3#ft| arg1@@26 arg2@@18))
)))
(assert  (and (= (Ctor WandType_wand_4Type) 14) (forall ((arg0@@29 Bool) (arg1@@27 Bool) ) (! (= (type (wand_4 arg0@@29 arg1@@27)) (FieldType WandType_wand_4Type intType))
 :qid |funType:wand_4|
 :pattern ( (wand_4 arg0@@29 arg1@@27))
))))
(assert (forall ((arg1@@28 Bool) (arg2@@19 Bool) ) (! (IsWandField (wand_4 arg1@@28 arg2@@19))
 :qid |stdinbpl.279:15|
 :skolemid |43|
 :pattern ( (wand_4 arg1@@28 arg2@@19))
)))
(assert (forall ((arg0@@30 Bool) (arg1@@29 Bool) ) (! (= (type (|wand_4#ft| arg0@@30 arg1@@29)) (FieldType WandType_wand_4Type FrameTypeType))
 :qid |funType:wand_4#ft|
 :pattern ( (|wand_4#ft| arg0@@30 arg1@@29))
)))
(assert (forall ((arg1@@30 Bool) (arg2@@20 Bool) ) (! (IsWandField (|wand_4#ft| arg1@@30 arg2@@20))
 :qid |stdinbpl.283:15|
 :skolemid |44|
 :pattern ( (|wand_4#ft| arg1@@30 arg2@@20))
)))
(assert  (and (= (Ctor WandType_wand_1Type) 15) (forall ((arg0@@31 Real) (arg1@@31 Real) ) (! (= (type (wand_1 arg0@@31 arg1@@31)) (FieldType WandType_wand_1Type intType))
 :qid |funType:wand_1|
 :pattern ( (wand_1 arg0@@31 arg1@@31))
))))
(assert (forall ((arg1@@32 Real) (arg2@@21 Real) ) (! (IsWandField (wand_1 arg1@@32 arg2@@21))
 :qid |stdinbpl.311:15|
 :skolemid |50|
 :pattern ( (wand_1 arg1@@32 arg2@@21))
)))
(assert (forall ((arg0@@32 Real) (arg1@@33 Real) ) (! (= (type (|wand_1#ft| arg0@@32 arg1@@33)) (FieldType WandType_wand_1Type FrameTypeType))
 :qid |funType:wand_1#ft|
 :pattern ( (|wand_1#ft| arg0@@32 arg1@@33))
)))
(assert (forall ((arg1@@34 Real) (arg2@@22 Real) ) (! (IsWandField (|wand_1#ft| arg1@@34 arg2@@22))
 :qid |stdinbpl.315:15|
 :skolemid |51|
 :pattern ( (|wand_1#ft| arg1@@34 arg2@@22))
)))
(assert  (and (= (type null) RefType) (forall ((arg0@@33 T@U) ) (! (let ((A (FieldTypeInv0 (type arg0@@33))))
(= (type (PredicateMaskField arg0@@33)) (FieldType A (MapType1Type RefType boolType))))
 :qid |funType:PredicateMaskField|
 :pattern ( (PredicateMaskField arg0@@33))
))))
(assert (forall ((Heap@@0 T@U) (ExhaleHeap T@U) (Mask@@0 T@U) (pm_f T@U) ) (! (let ((C (FieldTypeInv0 (type pm_f))))
 (=> (and (and (and (and (and (= (type Heap@@0) (MapType0Type RefType)) (= (type ExhaleHeap) (MapType0Type RefType))) (= (type Mask@@0) (MapType1Type RefType realType))) (= (type pm_f) (FieldType C FrameTypeType))) (IdenticalOnKnownLocations Heap@@0 ExhaleHeap Mask@@0)) (and (HasDirectPerm Mask@@0 null pm_f) (IsPredicateField pm_f))) (= (MapType0Select Heap@@0 null (PredicateMaskField pm_f)) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))))
 :qid |stdinbpl.47:19|
 :skolemid |2|
 :pattern ( (IdenticalOnKnownLocations Heap@@0 ExhaleHeap Mask@@0) (IsPredicateField pm_f) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))
)))
(assert (forall ((arg0@@34 T@U) ) (! (let ((A@@0 (FieldTypeInv0 (type arg0@@34))))
(= (type (WandMaskField arg0@@34)) (FieldType A@@0 (MapType1Type RefType boolType))))
 :qid |funType:WandMaskField|
 :pattern ( (WandMaskField arg0@@34))
)))
(assert (forall ((Heap@@1 T@U) (ExhaleHeap@@0 T@U) (Mask@@1 T@U) (pm_f@@0 T@U) ) (! (let ((C@@0 (FieldTypeInv0 (type pm_f@@0))))
 (=> (and (and (and (and (and (= (type Heap@@1) (MapType0Type RefType)) (= (type ExhaleHeap@@0) (MapType0Type RefType))) (= (type Mask@@1) (MapType1Type RefType realType))) (= (type pm_f@@0) (FieldType C@@0 FrameTypeType))) (IdenticalOnKnownLocations Heap@@1 ExhaleHeap@@0 Mask@@1)) (and (HasDirectPerm Mask@@1 null pm_f@@0) (IsWandField pm_f@@0))) (= (MapType0Select Heap@@1 null (WandMaskField pm_f@@0)) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))))
 :qid |stdinbpl.60:19|
 :skolemid |5|
 :pattern ( (IdenticalOnKnownLocations Heap@@1 ExhaleHeap@@0 Mask@@1) (IsWandField pm_f@@0) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))
)))
(assert  (and (= (Ctor PredicateType_PType) 16) (= (type P) (FieldType PredicateType_PType FrameTypeType))))
(assert (IsPredicateField P))
(assert  (and (= (Ctor PredicateType_QType) 17) (= (type Q) (FieldType PredicateType_QType FrameTypeType))))
(assert (IsPredicateField Q))
(assert  (and (= (Ctor PredicateType_RType) 18) (= (type R) (FieldType PredicateType_RType FrameTypeType))))
(assert (IsPredicateField R))
(assert (forall ((arg1@@35 Bool) (arg2@@23 Real) ) (!  (not (IsPredicateField (wand_3 arg1@@35 arg2@@23)))
 :qid |stdinbpl.191:15|
 :skolemid |24|
 :pattern ( (wand_3 arg1@@35 arg2@@23))
)))
(assert (forall ((arg1@@36 Bool) (arg2@@24 Real) ) (!  (not (IsPredicateField (|wand_3#ft| arg1@@36 arg2@@24)))
 :qid |stdinbpl.195:15|
 :skolemid |25|
 :pattern ( (|wand_3#ft| arg1@@36 arg2@@24))
)))
(assert (forall ((arg1@@37 Bool) (arg2@@25 Bool) ) (!  (not (IsPredicateField (wand_4 arg1@@37 arg2@@25)))
 :qid |stdinbpl.287:15|
 :skolemid |45|
 :pattern ( (wand_4 arg1@@37 arg2@@25))
)))
(assert (forall ((arg1@@38 Bool) (arg2@@26 Bool) ) (!  (not (IsPredicateField (|wand_4#ft| arg1@@38 arg2@@26)))
 :qid |stdinbpl.291:15|
 :skolemid |46|
 :pattern ( (|wand_4#ft| arg1@@38 arg2@@26))
)))
(assert (forall ((arg1@@39 Real) (arg2@@27 Real) ) (!  (not (IsPredicateField (wand_1 arg1@@39 arg2@@27)))
 :qid |stdinbpl.319:15|
 :skolemid |52|
 :pattern ( (wand_1 arg1@@39 arg2@@27))
)))
(assert (forall ((arg1@@40 Real) (arg2@@28 Real) ) (!  (not (IsPredicateField (|wand_1#ft| arg1@@40 arg2@@28)))
 :qid |stdinbpl.323:15|
 :skolemid |53|
 :pattern ( (|wand_1#ft| arg1@@40 arg2@@28))
)))
(assert (= (getPredWandId P) 0))
(assert (= (getPredWandId Q) 1))
(assert (= (getPredWandId R) 2))
(assert (forall ((arg0@@35 Real) (arg1@@41 Real) (arg2@@29 Real) ) (! (= (type (|wand#sm| arg0@@35 arg1@@41 arg2@@29)) (FieldType WandType_wandType (MapType1Type RefType boolType)))
 :qid |funType:wand#sm|
 :pattern ( (|wand#sm| arg0@@35 arg1@@41 arg2@@29))
)))
(assert (forall ((arg1@@42 Real) (arg2@@30 Real) (arg3@@11 Real) ) (! (= (|wand#sm| arg1@@42 arg2@@30 arg3@@11) (WandMaskField (|wand#ft| arg1@@42 arg2@@30 arg3@@11)))
 :qid |stdinbpl.231:15|
 :skolemid |33|
 :pattern ( (WandMaskField (|wand#ft| arg1@@42 arg2@@30 arg3@@11)))
)))
(assert (forall ((arg0@@36 Real) (arg1@@43 Real) (arg2@@31 Real) ) (! (= (type (|wand_2#sm| arg0@@36 arg1@@43 arg2@@31)) (FieldType WandType_wand_2Type (MapType1Type RefType boolType)))
 :qid |funType:wand_2#sm|
 :pattern ( (|wand_2#sm| arg0@@36 arg1@@43 arg2@@31))
)))
(assert (forall ((arg1@@44 Real) (arg2@@32 Real) (arg3@@12 Real) ) (! (= (|wand_2#sm| arg1@@44 arg2@@32 arg3@@12) (WandMaskField (|wand_2#ft| arg1@@44 arg2@@32 arg3@@12)))
 :qid |stdinbpl.263:15|
 :skolemid |40|
 :pattern ( (WandMaskField (|wand_2#ft| arg1@@44 arg2@@32 arg3@@12)))
)))
(assert  (and (= (Ctor NormalFieldType) 19) (= (type $allocated) (FieldType NormalFieldType boolType))))
(assert (forall ((Heap@@2 T@U) (ExhaleHeap@@1 T@U) (Mask@@2 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@2) (MapType0Type RefType)) (= (type ExhaleHeap@@1) (MapType0Type RefType))) (= (type Mask@@2) (MapType1Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@2 ExhaleHeap@@1 Mask@@2)) (U_2_bool (MapType0Select Heap@@2 o_1 $allocated))) (U_2_bool (MapType0Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.73:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@2 ExhaleHeap@@1 Mask@@2) (MapType0Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert (forall ((arg1@@45 Real) (arg2@@33 Real) (arg3@@13 Real) (arg1_2 Real) (arg2_2 Real) (arg3_2 Real) ) (!  (=> (= (wand arg1@@45 arg2@@33 arg3@@13) (wand arg1_2 arg2_2 arg3_2)) (and (= arg1@@45 arg1_2) (and (= arg2@@33 arg2_2) (= arg3@@13 arg3_2))))
 :qid |stdinbpl.239:15|
 :skolemid |35|
 :pattern ( (wand arg1@@45 arg2@@33 arg3@@13) (wand arg1_2 arg2_2 arg3_2))
)))
(assert (forall ((arg1@@46 Real) (arg2@@34 Real) (arg3@@14 Real) (arg1_2@@0 Real) (arg2_2@@0 Real) (arg3_2@@0 Real) ) (!  (=> (= (wand_2 arg1@@46 arg2@@34 arg3@@14) (wand_2 arg1_2@@0 arg2_2@@0 arg3_2@@0)) (and (= arg1@@46 arg1_2@@0) (and (= arg2@@34 arg2_2@@0) (= arg3@@14 arg3_2@@0))))
 :qid |stdinbpl.271:15|
 :skolemid |42|
 :pattern ( (wand_2 arg1@@46 arg2@@34 arg3@@14) (wand_2 arg1_2@@0 arg2_2@@0 arg3_2@@0))
)))
(assert (forall ((arg1@@47 Real) (arg2@@35 Real) (arg1_2@@1 Real) (arg2_2@@1 Real) ) (!  (=> (= (wand_1 arg1@@47 arg2@@35) (wand_1 arg1_2@@1 arg2_2@@1)) (and (= arg1@@47 arg1_2@@1) (= arg2@@35 arg2_2@@1)))
 :qid |stdinbpl.335:15|
 :skolemid |56|
 :pattern ( (wand_1 arg1@@47 arg2@@35) (wand_1 arg1_2@@1 arg2_2@@1))
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
(assert (forall ((p T@U) (v_1 T@U) (w T@U) ) (! (let ((A@@2 (FieldTypeInv0 (type p))))
 (=> (and (and (= (type p) (FieldType A@@2 FrameTypeType)) (= (type v_1) FrameTypeType)) (= (type w) FrameTypeType)) (not (InsidePredicate p v_1 p w))))
 :qid |stdinbpl.170:19|
 :skolemid |21|
 :pattern ( (InsidePredicate p v_1 p w))
)))
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
(assert  (and (forall ((arg0@@37 Real) (arg1@@48 T@U) ) (! (= (type (ConditionalFrame arg0@@37 arg1@@48)) FrameTypeType)
 :qid |funType:ConditionalFrame|
 :pattern ( (ConditionalFrame arg0@@37 arg1@@48))
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
(assert (forall ((arg1@@49 Bool) (arg2@@36 Bool) (arg1_2@@2 Bool) (arg2_2@@2 Bool) ) (!  (=> (= (wand_4 arg1@@49 arg2@@36) (wand_4 arg1_2@@2 arg2_2@@2)) (and (= arg1@@49 arg1_2@@2) (= arg2@@36 arg2_2@@2)))
 :qid |stdinbpl.303:15|
 :skolemid |49|
 :pattern ( (wand_4 arg1@@49 arg2@@36) (wand_4 arg1_2@@2 arg2_2@@2))
)))
(assert (forall ((arg1@@50 Bool) (arg2@@37 Real) ) (! (= (getPredWandId (wand_3 arg1@@50 arg2@@37)) 3)
 :qid |stdinbpl.203:15|
 :skolemid |27|
 :pattern ( (wand_3 arg1@@50 arg2@@37))
)))
(assert (forall ((arg1@@51 Bool) (arg2@@38 Bool) ) (! (= (getPredWandId (wand_4 arg1@@51 arg2@@38)) 6)
 :qid |stdinbpl.299:15|
 :skolemid |48|
 :pattern ( (wand_4 arg1@@51 arg2@@38))
)))
(assert (forall ((arg1@@52 Real) (arg2@@39 Real) ) (! (= (getPredWandId (wand_1 arg1@@52 arg2@@39)) 7)
 :qid |stdinbpl.331:15|
 :skolemid |55|
 :pattern ( (wand_1 arg1@@52 arg2@@39))
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
(assert (forall ((Heap@@7 T@U) ) (!  (=> (= (type Heap@@7) (MapType0Type RefType)) (|P#everUsed| P))
 :qid |stdinbpl.353:15|
 :skolemid |57|
 :pattern ( (|P#trigger| Heap@@7 P))
)))
(assert (forall ((Heap@@8 T@U) ) (!  (=> (= (type Heap@@8) (MapType0Type RefType)) (|Q#everUsed| Q))
 :qid |stdinbpl.383:15|
 :skolemid |58|
 :pattern ( (|Q#trigger| Heap@@8 Q))
)))
(assert (forall ((Heap@@9 T@U) ) (!  (=> (= (type Heap@@9) (MapType0Type RefType)) (|R#everUsed| R))
 :qid |stdinbpl.413:15|
 :skolemid |59|
 :pattern ( (|R#trigger| Heap@@9 R))
)))
(assert (forall ((arg1@@53 Bool) (arg2@@40 Real) (arg1_2@@3 Bool) (arg2_2@@3 Real) ) (!  (=> (= (wand_3 arg1@@53 arg2@@40) (wand_3 arg1_2@@3 arg2_2@@3)) (and (= arg1@@53 arg1_2@@3) (= arg2@@40 arg2_2@@3)))
 :qid |stdinbpl.207:15|
 :skolemid |28|
 :pattern ( (wand_3 arg1@@53 arg2@@40) (wand_3 arg1_2@@3 arg2_2@@3))
)))
(assert (forall ((o T@U) (f T@U) (Heap@@10 T@U) ) (!  (=> (and (and (and (= (type o) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap@@10) (MapType0Type RefType))) (U_2_bool (MapType0Select Heap@@10 o $allocated))) (U_2_bool (MapType0Select Heap@@10 (MapType0Select Heap@@10 o f) $allocated)))
 :qid |stdinbpl.31:15|
 :skolemid |0|
 :pattern ( (MapType0Select Heap@@10 o f))
)))
(assert (forall ((arg0@@38 Bool) (arg1@@54 Real) ) (! (= (type (|wand_3#sm| arg0@@38 arg1@@54)) (FieldType WandType_wand_3Type (MapType1Type RefType boolType)))
 :qid |funType:wand_3#sm|
 :pattern ( (|wand_3#sm| arg0@@38 arg1@@54))
)))
(assert (forall ((arg1@@55 Bool) (arg2@@41 Real) ) (! (= (|wand_3#sm| arg1@@55 arg2@@41) (WandMaskField (|wand_3#ft| arg1@@55 arg2@@41)))
 :qid |stdinbpl.199:15|
 :skolemid |26|
 :pattern ( (WandMaskField (|wand_3#ft| arg1@@55 arg2@@41)))
)))
(assert (forall ((arg0@@39 Bool) (arg1@@56 Bool) ) (! (= (type (|wand_4#sm| arg0@@39 arg1@@56)) (FieldType WandType_wand_4Type (MapType1Type RefType boolType)))
 :qid |funType:wand_4#sm|
 :pattern ( (|wand_4#sm| arg0@@39 arg1@@56))
)))
(assert (forall ((arg1@@57 Bool) (arg2@@42 Bool) ) (! (= (|wand_4#sm| arg1@@57 arg2@@42) (WandMaskField (|wand_4#ft| arg1@@57 arg2@@42)))
 :qid |stdinbpl.295:15|
 :skolemid |47|
 :pattern ( (WandMaskField (|wand_4#ft| arg1@@57 arg2@@42)))
)))
(assert (forall ((arg0@@40 Real) (arg1@@58 Real) ) (! (= (type (|wand_1#sm| arg0@@40 arg1@@58)) (FieldType WandType_wand_1Type (MapType1Type RefType boolType)))
 :qid |funType:wand_1#sm|
 :pattern ( (|wand_1#sm| arg0@@40 arg1@@58))
)))
(assert (forall ((arg1@@59 Real) (arg2@@43 Real) ) (! (= (|wand_1#sm| arg1@@59 arg2@@43) (WandMaskField (|wand_1#ft| arg1@@59 arg2@@43)))
 :qid |stdinbpl.327:15|
 :skolemid |54|
 :pattern ( (WandMaskField (|wand_1#ft| arg1@@59 arg2@@43)))
)))
(assert (= (type |P#sm|) (FieldType PredicateType_PType (MapType1Type RefType boolType))))
(assert (= (PredicateMaskField P) |P#sm|))
(assert (= (type |Q#sm|) (FieldType PredicateType_QType (MapType1Type RefType boolType))))
(assert (= (PredicateMaskField Q) |Q#sm|))
(assert (= (type |R#sm|) (FieldType PredicateType_RType (MapType1Type RefType boolType))))
(assert (= (PredicateMaskField R) |R#sm|))
(assert (forall ((Heap@@11 T@U) (o@@0 T@U) (f_3 T@U) (v T@U) ) (! (let ((B@@8 (type v)))
(let ((A@@9 (FieldTypeInv0 (type f_3))))
 (=> (and (and (= (type Heap@@11) (MapType0Type RefType)) (= (type o@@0) RefType)) (= (type f_3) (FieldType A@@9 B@@8))) (succHeap Heap@@11 (MapType0Store Heap@@11 o@@0 f_3 v)))))
 :qid |stdinbpl.78:22|
 :skolemid |9|
 :pattern ( (MapType0Store Heap@@11 o@@0 f_3 v))
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
(declare-fun Mask@10 () T@U)
(declare-fun Mask@9 () T@U)
(declare-fun ExhaleHeap@1 () T@U)
(declare-fun ExhaleHeap@2 () T@U)
(declare-fun Mask@8 () T@U)
(declare-fun Heap@2 () T@U)
(declare-fun b_43@0 () Bool)
(declare-fun b_43 () Bool)
(declare-fun Used_21Heap@0 () T@U)
(declare-fun Mask@7 () T@U)
(declare-fun b_37@14 () Bool)
(declare-fun b_35@2 () Bool)
(declare-fun b_41@9 () Bool)
(declare-fun neededTransfer@11 () Real)
(declare-fun Used_20Mask@5 () T@U)
(declare-fun initNeededTransfer@1 () Real)
(declare-fun b_42@0 () Bool)
(declare-fun b_42@1 () Bool)
(declare-fun Result_15Heap () T@U)
(declare-fun Result_15Mask () T@U)
(declare-fun b_42@2 () Bool)
(declare-fun Ops_11Mask () T@U)
(declare-fun b_42@3 () Bool)
(declare-fun Ops_11Heap@1 () T@U)
(declare-fun Used_20Heap@0 () T@U)
(declare-fun b_42@4 () Bool)
(declare-fun b_37@15 () Bool)
(declare-fun Ops_9Mask@4 () T@U)
(declare-fun Ops_9Mask () T@U)
(declare-fun b_35@3 () Bool)
(declare-fun Ops_9Heap () T@U)
(declare-fun b_35@4 () Bool)
(declare-fun b_35@5 () Bool)
(declare-fun Mask@6 () T@U)
(declare-fun Heap@1 () T@U)
(declare-fun takeTransfer@5 () Real)
(declare-fun Mask@4 () T@U)
(declare-fun Used_20Mask@3 () T@U)
(declare-fun b_41@6 () Bool)
(declare-fun neededTransfer@9 () Real)
(declare-fun Heap@@12 () T@U)
(declare-fun neededTransfer@10 () Real)
(declare-fun Used_20Mask@4 () T@U)
(declare-fun b_41@7 () Bool)
(declare-fun TempMask@2 () T@U)
(declare-fun b_41@8 () Bool)
(declare-fun Mask@5 () T@U)
(declare-fun newPMask@1 () T@U)
(declare-fun Heap@0 () T@U)
(declare-fun maskTransfer@5 () Real)
(declare-fun takeTransfer@4 () Real)
(declare-fun neededTransfer@7 () Real)
(declare-fun b_41@3 () Bool)
(declare-fun Used_20Mask@1 () T@U)
(declare-fun neededTransfer@8 () Real)
(declare-fun Used_20Mask@2 () T@U)
(declare-fun b_41@4 () Bool)
(declare-fun TempMask@1 () T@U)
(declare-fun b_41@5 () Bool)
(declare-fun Ops_9Heap@0 () T@U)
(declare-fun Ops_9Mask@3 () T@U)
(declare-fun Ops_9Mask@2 () T@U)
(declare-fun newPMask@0 () T@U)
(declare-fun Ops_9Heap@1 () T@U)
(declare-fun maskTransfer@4 () Real)
(declare-fun takeTransfer@3 () Real)
(declare-fun b_41@0 () Bool)
(declare-fun neededTransfer@6 () Real)
(declare-fun Used_20Mask@0 () T@U)
(declare-fun b_41@1 () Bool)
(declare-fun TempMask@0 () T@U)
(declare-fun b_41@2 () Bool)
(declare-fun Ops_11Mask@4 () T@U)
(declare-fun Ops_11Mask@3 () T@U)
(declare-fun maskTransfer@3 () Real)
(declare-fun b_41 () Bool)
(declare-fun b_37@2 () Bool)
(declare-fun b_38@6 () Bool)
(declare-fun neededTransfer@5 () Real)
(declare-fun Used_18Mask@5 () T@U)
(declare-fun initNeededTransfer@0 () Real)
(declare-fun b_39@0 () Bool)
(declare-fun b_39@1 () Bool)
(declare-fun Result_14Heap () T@U)
(declare-fun Result_14Mask () T@U)
(declare-fun b_39@2 () Bool)
(declare-fun Ops_11Mask@1 () T@U)
(declare-fun b_39@3 () Bool)
(declare-fun Ops_11Heap@0 () T@U)
(declare-fun Used_18Heap@0 () T@U)
(declare-fun b_39@4 () Bool)
(declare-fun b_37@3 () Bool)
(declare-fun b_37@4 () Bool)
(declare-fun b_37@5 () Bool)
(declare-fun b_37@6 () Bool)
(declare-fun b_40@0 () Bool)
(declare-fun b_40 () Bool)
(declare-fun Used_19Heap@0 () T@U)
(declare-fun b_37@7 () Bool)
(declare-fun b_37@8 () Bool)
(declare-fun b_37@9 () Bool)
(declare-fun Ops_11Mask@2 () T@U)
(declare-fun b_37@10 () Bool)
(declare-fun b_37@11 () Bool)
(declare-fun ExhaleHeap@0 () T@U)
(declare-fun b_37@12 () Bool)
(declare-fun b_37@13 () Bool)
(declare-fun Mask@3 () T@U)
(declare-fun Ops_9Mask@1 () T@U)
(declare-fun takeTransfer@2 () Real)
(declare-fun Mask@1 () T@U)
(declare-fun Used_18Mask@3 () T@U)
(declare-fun b_38@4 () Bool)
(declare-fun neededTransfer@3 () Real)
(declare-fun neededTransfer@4 () Real)
(declare-fun Used_18Mask@4 () T@U)
(declare-fun b_38@5 () Bool)
(declare-fun Mask@2 () T@U)
(declare-fun maskTransfer@2 () Real)
(declare-fun takeTransfer@1 () Real)
(declare-fun neededTransfer@1 () Real)
(declare-fun b_38@2 () Bool)
(declare-fun Used_18Mask@1 () T@U)
(declare-fun neededTransfer@2 () Real)
(declare-fun Used_18Mask@2 () T@U)
(declare-fun b_38@3 () Bool)
(declare-fun Ops_9Mask@0 () T@U)
(declare-fun maskTransfer@1 () Real)
(declare-fun takeTransfer@0 () Real)
(declare-fun b_38@0 () Bool)
(declare-fun neededTransfer@0 () Real)
(declare-fun Used_18Mask@0 () T@U)
(declare-fun b_38@1 () Bool)
(declare-fun Ops_11Mask@0 () T@U)
(declare-fun maskTransfer@0 () Real)
(declare-fun b_38 () Bool)
(declare-fun b_37@1 () Bool)
(declare-fun b_37@0 () Bool)
(declare-fun b_37 () Bool)
(declare-fun b_36@0 () Bool)
(declare-fun b_36 () Bool)
(declare-fun Used_17Heap@0 () T@U)
(declare-fun b_35@1 () Bool)
(declare-fun b_35@0 () Bool)
(declare-fun Mask@0 () T@U)
(declare-fun b_35 () Bool)
(declare-fun b_34@0 () Bool)
(declare-fun b_34 () Bool)
(declare-fun Used_16Heap@0 () T@U)
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (= (type Mask@10) (MapType1Type RefType realType)) (= (type Mask@9) (MapType1Type RefType realType))) (= (type ExhaleHeap@1) (MapType0Type RefType))) (= (type ExhaleHeap@2) (MapType0Type RefType))) (= (type Mask@8) (MapType1Type RefType realType))) (= (type Heap@2) (MapType0Type RefType))) (= (type Used_21Heap@0) (MapType0Type RefType))) (= (type Mask@7) (MapType1Type RefType realType))) (= (type Mask@1) (MapType1Type RefType realType))) (= (type Heap@@12) (MapType0Type RefType))) (= (type Used_20Mask@5) (MapType1Type RefType realType))) (= (type Result_15Heap) (MapType0Type RefType))) (= (type Result_15Mask) (MapType1Type RefType realType))) (= (type Ops_11Mask) (MapType1Type RefType realType))) (= (type Ops_11Heap@1) (MapType0Type RefType))) (= (type Used_20Heap@0) (MapType0Type RefType))) (= (type Ops_9Mask@4) (MapType1Type RefType realType))) (= (type Ops_9Mask) (MapType1Type RefType realType))) (= (type Ops_9Heap) (MapType0Type RefType))) (= (type Mask@6) (MapType1Type RefType realType))) (= (type Heap@1) (MapType0Type RefType))) (= (type Mask@4) (MapType1Type RefType realType))) (= (type Used_20Mask@3) (MapType1Type RefType realType))) (= (type Used_20Mask@4) (MapType1Type RefType realType))) (= (type TempMask@2) (MapType1Type RefType realType))) (= (type Mask@5) (MapType1Type RefType realType))) (= (type newPMask@1) (MapType1Type RefType boolType))) (= (type Heap@0) (MapType0Type RefType))) (= (type Used_20Mask@1) (MapType1Type RefType realType))) (= (type Used_20Mask@2) (MapType1Type RefType realType))) (= (type TempMask@1) (MapType1Type RefType realType))) (= (type Ops_9Heap@0) (MapType0Type RefType))) (= (type Ops_9Mask@3) (MapType1Type RefType realType))) (= (type Ops_9Mask@2) (MapType1Type RefType realType))) (= (type newPMask@0) (MapType1Type RefType boolType))) (= (type Ops_9Heap@1) (MapType0Type RefType))) (= (type Used_20Mask@0) (MapType1Type RefType realType))) (= (type TempMask@0) (MapType1Type RefType realType))) (= (type Ops_11Mask@4) (MapType1Type RefType realType))) (= (type Ops_11Mask@3) (MapType1Type RefType realType))) (= (type Ops_11Heap@0) (MapType0Type RefType))) (= (type Used_18Mask@5) (MapType1Type RefType realType))) (= (type Result_14Heap) (MapType0Type RefType))) (= (type Result_14Mask) (MapType1Type RefType realType))) (= (type Ops_11Mask@1) (MapType1Type RefType realType))) (= (type Used_18Heap@0) (MapType0Type RefType))) (= (type Used_19Heap@0) (MapType0Type RefType))) (= (type Ops_11Mask@2) (MapType1Type RefType realType))) (= (type ExhaleHeap@0) (MapType0Type RefType))) (= (type Mask@3) (MapType1Type RefType realType))) (= (type Ops_9Mask@1) (MapType1Type RefType realType))) (= (type Used_18Mask@3) (MapType1Type RefType realType))) (= (type Used_18Mask@4) (MapType1Type RefType realType))) (= (type Mask@2) (MapType1Type RefType realType))) (= (type Used_18Mask@1) (MapType1Type RefType realType))) (= (type Used_18Mask@2) (MapType1Type RefType realType))) (= (type Ops_9Mask@0) (MapType1Type RefType realType))) (= (type Used_18Mask@0) (MapType1Type RefType realType))) (= (type Ops_11Mask@0) (MapType1Type RefType realType))) (= (type Used_17Heap@0) (MapType0Type RefType))) (= (type Mask@0) (MapType1Type RefType realType))) (= (type Used_16Heap@0) (MapType0Type RefType))))
(set-info :boogie-vc-id curry_test03)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 72) (let ((anon62_Then_correct true))
(let ((anon54_correct  (=> (and (and (= Mask@10 (MapType1Store Mask@9 null R (real_2_U (- (U_2_real (MapType1Select Mask@9 null R)) FullPerm)))) (IdenticalOnKnownLocations ExhaleHeap@1 ExhaleHeap@2 Mask@10)) (and (state ExhaleHeap@2 Mask@10) (= (ControlFlow 0 4) (- 0 3)))) false)))
(let ((anon82_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 7) 4)) anon54_correct)))
(let ((anon82_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 5) (- 0 6)) (<= FullPerm (U_2_real (MapType1Select Mask@9 null R)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@9 null R))) (=> (= (ControlFlow 0 5) 4) anon54_correct))))))
(let ((anon81_Else_correct  (and (=> (= (ControlFlow 0 8) (- 0 9)) (<= FullPerm (U_2_real (MapType1Select Mask@8 null (wand_4 true true))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@8 null (wand_4 true true)))) (=> (= Mask@9 (MapType1Store Mask@8 null (wand_4 true true) (real_2_U (- (U_2_real (MapType1Select Mask@8 null (wand_4 true true))) FullPerm)))) (=> (and (IdenticalOnKnownLocations Heap@2 ExhaleHeap@1 Mask@9) (state ExhaleHeap@1 Mask@9)) (and (=> (= (ControlFlow 0 8) 5) anon82_Then_correct) (=> (= (ControlFlow 0 8) 7) anon82_Else_correct))))))))
(let ((anon81_Then_correct true))
(let ((anon50_correct  (=> (= b_43@0  (and b_43 (state Used_21Heap@0 ZeroMask))) (=> (and (and (= Mask@8 (MapType1Store Mask@7 null (wand_4 true true) (real_2_U (+ (U_2_real (MapType1Select Mask@7 null (wand_4 true true))) FullPerm)))) (state Heap@2 Mask@8)) (and (state Heap@2 Mask@8) (state Heap@2 Mask@8))) (and (=> (= (ControlFlow 0 10) 2) anon81_Then_correct) (=> (= (ControlFlow 0 10) 8) anon81_Else_correct))))))
(let ((anon49_correct  (and (=> (= (ControlFlow 0 12) (- 0 13)) (=> (and (and b_37@14 (and b_37@14 b_35@2)) b_41@9) (and (= neededTransfer@11 0.0) (= (U_2_real (MapType1Select Used_20Mask@5 null R)) initNeededTransfer@1)))) (=> (=> (and (and b_37@14 (and b_37@14 b_35@2)) b_41@9) (and (= neededTransfer@11 0.0) (= (U_2_real (MapType1Select Used_20Mask@5 null R)) initNeededTransfer@1))) (=> (= b_42@0  (and b_37@14 b_41@9)) (=> (and (and (= b_42@1  (and b_42@0 (state Result_15Heap Result_15Mask))) (= b_42@2  (and b_42@1 (sumMask Result_15Mask Ops_11Mask Used_20Mask@5)))) (and (= b_42@3  (and (and b_42@2 (IdenticalOnKnownLocations Ops_11Heap@1 Result_15Heap Ops_11Mask)) (IdenticalOnKnownLocations Used_20Heap@0 Result_15Heap Used_20Mask@5))) (= b_42@4  (and b_42@3 (state Result_15Heap Result_15Mask))))) (=> (and (and (and (= b_37@15  (and b_37@14 b_42@4)) (= Ops_9Mask@4 (MapType1Store Ops_9Mask null (wand_3 true FullPerm) (real_2_U (+ (U_2_real (MapType1Select Ops_9Mask null (wand_3 true FullPerm))) FullPerm))))) (and (= b_35@3  (and b_35@2 (state Ops_9Heap Ops_9Mask@4))) (= b_35@4  (and b_35@3 (state Ops_9Heap Ops_9Mask@4))))) (and (and (= b_35@5  (and b_35@4 (state Ops_9Heap Ops_9Mask@4))) (= Mask@7 Mask@6)) (and (= Heap@2 Heap@1) (= (ControlFlow 0 12) 10)))) anon50_correct)))))))
(let ((anon80_Else_correct  (=> (>= 0.0 takeTransfer@5) (=> (and (= Mask@6 Mask@4) (= Used_20Mask@5 Used_20Mask@3)) (=> (and (and (= b_41@9 b_41@6) (= neededTransfer@11 neededTransfer@9)) (and (= Heap@1 Heap@@12) (= (ControlFlow 0 16) 12))) anon49_correct)))))
(let ((anon80_Then_correct  (=> (> takeTransfer@5 0.0) (=> (and (= neededTransfer@10 (- neededTransfer@9 takeTransfer@5)) (= Used_20Mask@4 (MapType1Store Used_20Mask@3 null R (real_2_U (+ (U_2_real (MapType1Select Used_20Mask@3 null R)) takeTransfer@5))))) (=> (and (and (= b_41@7  (and b_41@6 (state Used_20Heap@0 Used_20Mask@4))) (= TempMask@2 (MapType1Store ZeroMask null R (real_2_U FullPerm)))) (and (= b_41@8  (and b_41@7 (IdenticalOnKnownLocations Heap@@12 Used_20Heap@0 TempMask@2))) (= Mask@5 (MapType1Store Mask@4 null R (real_2_U (- (U_2_real (MapType1Select Mask@4 null R)) takeTransfer@5)))))) (=> (and (and (and (forall ((o_16 T@U) (f_20 T@U) ) (! (let ((B@@11 (FieldTypeInv1 (type f_20))))
(let ((A@@12 (FieldTypeInv0 (type f_20))))
 (=> (and (and (= (type o_16) RefType) (= (type f_20) (FieldType A@@12 B@@11))) (or (U_2_bool (MapType1Select (MapType0Select Heap@@12 null (|wand_3#sm| true FullPerm)) o_16 f_20)) (U_2_bool (MapType1Select (MapType0Select Heap@@12 null |R#sm|) o_16 f_20)))) (U_2_bool (MapType1Select newPMask@1 o_16 f_20)))))
 :qid |stdinbpl.2966:39|
 :skolemid |73|
 :pattern ( (MapType1Select newPMask@1 o_16 f_20))
)) (= Heap@0 (MapType0Store Heap@@12 null (|wand_3#sm| true FullPerm) newPMask@1))) (and (= Mask@6 Mask@5) (= Used_20Mask@5 Used_20Mask@4))) (and (and (= b_41@9 b_41@8) (= neededTransfer@11 neededTransfer@10)) (and (= Heap@1 Heap@0) (= (ControlFlow 0 15) 12)))) anon49_correct))))))
(let ((anon79_Else_correct  (=> (and (< maskTransfer@5 neededTransfer@9) (= takeTransfer@5 maskTransfer@5)) (and (=> (= (ControlFlow 0 18) 15) anon80_Then_correct) (=> (= (ControlFlow 0 18) 16) anon80_Else_correct)))))
(let ((anon79_Then_correct  (=> (and (<= neededTransfer@9 maskTransfer@5) (= takeTransfer@5 neededTransfer@9)) (and (=> (= (ControlFlow 0 17) 15) anon80_Then_correct) (=> (= (ControlFlow 0 17) 16) anon80_Else_correct)))))
(let ((anon78_Then_correct  (=> (and (and (and (and (and b_37@14 (and b_37@14 b_35@2)) b_41@6) true) (> neededTransfer@9 0.0)) (= maskTransfer@5 (U_2_real (MapType1Select Mask@4 null R)))) (and (=> (= (ControlFlow 0 19) 17) anon79_Then_correct) (=> (= (ControlFlow 0 19) 18) anon79_Else_correct)))))
(let ((anon78_Else_correct  (=> (not (and (and (and (and b_37@14 (and b_37@14 b_35@2)) b_41@6) true) (> neededTransfer@9 0.0))) (=> (and (= Mask@6 Mask@4) (= Used_20Mask@5 Used_20Mask@3)) (=> (and (and (= b_41@9 b_41@6) (= neededTransfer@11 neededTransfer@9)) (and (= Heap@1 Heap@@12) (= (ControlFlow 0 14) 12))) anon49_correct)))))
(let ((anon77_Else_correct  (=> (and (and (>= 0.0 takeTransfer@4) (= neededTransfer@9 neededTransfer@7)) (and (= b_41@6 b_41@3) (= Used_20Mask@3 Used_20Mask@1))) (and (=> (= (ControlFlow 0 22) 19) anon78_Then_correct) (=> (= (ControlFlow 0 22) 14) anon78_Else_correct)))))
(let ((anon77_Then_correct  (=> (and (and (> takeTransfer@4 0.0) (= neededTransfer@8 (- neededTransfer@7 takeTransfer@4))) (and (= Used_20Mask@2 (MapType1Store Used_20Mask@1 null R (real_2_U (+ (U_2_real (MapType1Select Used_20Mask@1 null R)) takeTransfer@4)))) (= b_41@4  (and b_41@3 (state Used_20Heap@0 Used_20Mask@2))))) (=> (and (and (and (= TempMask@1 (MapType1Store ZeroMask null R (real_2_U FullPerm))) (= b_41@5  (and b_41@4 (IdenticalOnKnownLocations Ops_9Heap@0 Used_20Heap@0 TempMask@1)))) (and (= Ops_9Mask@3 (MapType1Store Ops_9Mask@2 null R (real_2_U (- (U_2_real (MapType1Select Ops_9Mask@2 null R)) takeTransfer@4)))) (forall ((o_15 T@U) (f_19 T@U) ) (! (let ((B@@12 (FieldTypeInv1 (type f_19))))
(let ((A@@13 (FieldTypeInv0 (type f_19))))
 (=> (and (and (= (type o_15) RefType) (= (type f_19) (FieldType A@@13 B@@12))) (or (U_2_bool (MapType1Select (MapType0Select Ops_9Heap@0 null (|wand_3#sm| true FullPerm)) o_15 f_19)) (U_2_bool (MapType1Select (MapType0Select Ops_9Heap@0 null |R#sm|) o_15 f_19)))) (U_2_bool (MapType1Select newPMask@0 o_15 f_19)))))
 :qid |stdinbpl.2939:39|
 :skolemid |72|
 :pattern ( (MapType1Select newPMask@0 o_15 f_19))
)))) (and (and (= Ops_9Heap@1 (MapType0Store Ops_9Heap@0 null (|wand_3#sm| true FullPerm) newPMask@0)) (= neededTransfer@9 neededTransfer@8)) (and (= b_41@6 b_41@5) (= Used_20Mask@3 Used_20Mask@2)))) (and (=> (= (ControlFlow 0 21) 19) anon78_Then_correct) (=> (= (ControlFlow 0 21) 14) anon78_Else_correct))))))
(let ((anon76_Else_correct  (=> (and (< maskTransfer@4 neededTransfer@7) (= takeTransfer@4 maskTransfer@4)) (and (=> (= (ControlFlow 0 24) 21) anon77_Then_correct) (=> (= (ControlFlow 0 24) 22) anon77_Else_correct)))))
(let ((anon76_Then_correct  (=> (and (<= neededTransfer@7 maskTransfer@4) (= takeTransfer@4 neededTransfer@7)) (and (=> (= (ControlFlow 0 23) 21) anon77_Then_correct) (=> (= (ControlFlow 0 23) 22) anon77_Else_correct)))))
(let ((anon75_Then_correct  (=> (and (and (and (and (and b_37@14 (and b_37@14 b_35@2)) b_41@3) true) (> neededTransfer@7 0.0)) (= maskTransfer@4 (U_2_real (MapType1Select Ops_9Mask@2 null R)))) (and (=> (= (ControlFlow 0 25) 23) anon76_Then_correct) (=> (= (ControlFlow 0 25) 24) anon76_Else_correct)))))
(let ((anon75_Else_correct  (=> (and (and (not (and (and (and (and b_37@14 (and b_37@14 b_35@2)) b_41@3) true) (> neededTransfer@7 0.0))) (= neededTransfer@9 neededTransfer@7)) (and (= b_41@6 b_41@3) (= Used_20Mask@3 Used_20Mask@1))) (and (=> (= (ControlFlow 0 20) 19) anon78_Then_correct) (=> (= (ControlFlow 0 20) 14) anon78_Else_correct)))))
(let ((anon74_Else_correct  (=> (and (and (>= 0.0 takeTransfer@3) (= Used_20Mask@1 ZeroMask)) (and (= b_41@3 b_41@0) (= neededTransfer@7 FullPerm))) (and (=> (= (ControlFlow 0 28) 25) anon75_Then_correct) (=> (= (ControlFlow 0 28) 20) anon75_Else_correct)))))
(let ((anon74_Then_correct  (=> (and (> takeTransfer@3 0.0) (= neededTransfer@6 (- FullPerm takeTransfer@3))) (=> (and (and (and (= Used_20Mask@0 (MapType1Store ZeroMask null R (real_2_U (+ (U_2_real (MapType1Select ZeroMask null R)) takeTransfer@3)))) (= b_41@1  (and b_41@0 (state Used_20Heap@0 Used_20Mask@0)))) (and (= TempMask@0 (MapType1Store ZeroMask null R (real_2_U FullPerm))) (= b_41@2  (and b_41@1 (IdenticalOnKnownLocations Ops_11Heap@1 Used_20Heap@0 TempMask@0))))) (and (and (= Ops_11Mask@4 (MapType1Store Ops_11Mask@3 null R (real_2_U (- (U_2_real (MapType1Select Ops_11Mask@3 null R)) takeTransfer@3)))) (= Used_20Mask@1 Used_20Mask@0)) (and (= b_41@3 b_41@2) (= neededTransfer@7 neededTransfer@6)))) (and (=> (= (ControlFlow 0 27) 25) anon75_Then_correct) (=> (= (ControlFlow 0 27) 20) anon75_Else_correct))))))
(let ((anon73_Else_correct  (=> (and (< maskTransfer@3 FullPerm) (= takeTransfer@3 maskTransfer@3)) (and (=> (= (ControlFlow 0 30) 27) anon74_Then_correct) (=> (= (ControlFlow 0 30) 28) anon74_Else_correct)))))
(let ((anon73_Then_correct  (=> (and (<= FullPerm maskTransfer@3) (= takeTransfer@3 FullPerm)) (and (=> (= (ControlFlow 0 29) 27) anon74_Then_correct) (=> (= (ControlFlow 0 29) 28) anon74_Else_correct)))))
(let ((anon72_Then_correct  (=> (and (and (and (and (and b_37@14 (and b_37@14 b_35@2)) b_41@0) true) (> FullPerm 0.0)) (= maskTransfer@3 (U_2_real (MapType1Select Ops_11Mask@3 null R)))) (and (=> (= (ControlFlow 0 31) 29) anon73_Then_correct) (=> (= (ControlFlow 0 31) 30) anon73_Else_correct)))))
(let ((anon72_Else_correct  (=> (and (and (not (and (and (and (and b_37@14 (and b_37@14 b_35@2)) b_41@0) true) (> FullPerm 0.0))) (= Used_20Mask@1 ZeroMask)) (and (= b_41@3 b_41@0) (= neededTransfer@7 FullPerm))) (and (=> (= (ControlFlow 0 26) 25) anon75_Then_correct) (=> (= (ControlFlow 0 26) 20) anon75_Else_correct)))))
(let ((anon31_correct  (=> (and (= b_41@0  (and b_41 (state Used_20Heap@0 ZeroMask))) (= initNeededTransfer@1 (+ (U_2_real (MapType1Select ZeroMask null R)) FullPerm))) (and (=> (= (ControlFlow 0 32) (- 0 33)) (>= FullPerm 0.0)) (=> (>= FullPerm 0.0) (and (=> (= (ControlFlow 0 32) 31) anon72_Then_correct) (=> (= (ControlFlow 0 32) 26) anon72_Else_correct)))))))
(let ((anon30_correct  (and (=> (= (ControlFlow 0 35) (- 0 36)) (=> (and b_37@2 b_38@6) (and (= neededTransfer@5 0.0) (= (U_2_real (MapType1Select Used_18Mask@5 null (wand_3 true FullPerm))) initNeededTransfer@0)))) (=> (=> (and b_37@2 b_38@6) (and (= neededTransfer@5 0.0) (= (U_2_real (MapType1Select Used_18Mask@5 null (wand_3 true FullPerm))) initNeededTransfer@0))) (=> (= b_39@0  (and b_37@2 b_38@6)) (=> (and (and (and (= b_39@1  (and b_39@0 (state Result_14Heap Result_14Mask))) (= b_39@2  (and b_39@1 (sumMask Result_14Mask Ops_11Mask@1 Used_18Mask@5)))) (and (= b_39@3  (and (and b_39@2 (IdenticalOnKnownLocations Ops_11Heap@0 Result_14Heap Ops_11Mask@1)) (IdenticalOnKnownLocations Used_18Heap@0 Result_14Heap Used_18Mask@5))) (= b_39@4  (and b_39@3 (state Result_14Heap Result_14Mask))))) (and (and (= b_37@3  (and b_37@2 b_39@4)) (= b_37@4  (and b_37@3 b_38@6))) (and (= b_37@5  (and b_37@4 (= Used_18Heap@0 Ops_11Heap@0))) (= b_37@6  (and b_37@5 (state Ops_11Heap@0 Ops_11Mask@1)))))) (=> (and (and (and (and (= b_40@0  (and b_40 (state Used_19Heap@0 ZeroMask))) (= b_37@7  (and b_37@6 b_40@0))) (and (= b_37@8  (and b_37@7 (= Used_19Heap@0 Ops_11Heap@0))) (= b_37@9  (and b_37@8 (state Ops_11Heap@0 Ops_11Mask@1))))) (and (and (= Ops_11Mask@2 (MapType1Store Ops_11Mask@1 null R (real_2_U (+ (U_2_real (MapType1Select Ops_11Mask@1 null R)) FullPerm)))) (= b_37@10  (and b_37@9 (state Ops_11Heap@0 Ops_11Mask@2)))) (and (= b_37@11  (and b_37@10 (state Ops_11Heap@0 Ops_11Mask@2))) (IdenticalOnKnownLocations Ops_11Heap@0 ExhaleHeap@0 Ops_11Mask@2)))) (and (and (and (= b_37@12  (and b_37@11 (state ExhaleHeap@0 Ops_11Mask@2))) (= b_37@13  (and b_37@12 (state ExhaleHeap@0 Ops_11Mask@2)))) (and (= Ops_11Heap@1 ExhaleHeap@0) (= b_37@14 b_37@13))) (and (and (= Mask@4 Mask@3) (= Ops_9Mask@2 Ops_9Mask@1)) (and (= Ops_11Mask@3 Ops_11Mask@2) (= (ControlFlow 0 35) 32))))) anon31_correct)))))))
(let ((anon71_Else_correct  (=> (and (>= 0.0 takeTransfer@2) (= Mask@3 Mask@1)) (=> (and (and (= Used_18Mask@5 Used_18Mask@3) (= b_38@6 b_38@4)) (and (= neededTransfer@5 neededTransfer@3) (= (ControlFlow 0 39) 35))) anon30_correct))))
(let ((anon71_Then_correct  (=> (and (> takeTransfer@2 0.0) (= neededTransfer@4 (- neededTransfer@3 takeTransfer@2))) (=> (and (and (and (= Used_18Mask@4 (MapType1Store Used_18Mask@3 null (wand_3 true FullPerm) (real_2_U (+ (U_2_real (MapType1Select Used_18Mask@3 null (wand_3 true FullPerm))) takeTransfer@2)))) (= b_38@5  (and b_38@4 (state Used_18Heap@0 Used_18Mask@4)))) (and (= Mask@2 (MapType1Store Mask@1 null (wand_3 true FullPerm) (real_2_U (- (U_2_real (MapType1Select Mask@1 null (wand_3 true FullPerm))) takeTransfer@2)))) (= Mask@3 Mask@2))) (and (and (= Used_18Mask@5 Used_18Mask@4) (= b_38@6 b_38@5)) (and (= neededTransfer@5 neededTransfer@4) (= (ControlFlow 0 38) 35)))) anon30_correct))))
(let ((anon70_Else_correct  (=> (and (< maskTransfer@2 neededTransfer@3) (= takeTransfer@2 maskTransfer@2)) (and (=> (= (ControlFlow 0 41) 38) anon71_Then_correct) (=> (= (ControlFlow 0 41) 39) anon71_Else_correct)))))
(let ((anon70_Then_correct  (=> (and (<= neededTransfer@3 maskTransfer@2) (= takeTransfer@2 neededTransfer@3)) (and (=> (= (ControlFlow 0 40) 38) anon71_Then_correct) (=> (= (ControlFlow 0 40) 39) anon71_Else_correct)))))
(let ((anon69_Then_correct  (=> (and (and (and (and b_37@2 b_38@4) true) (> neededTransfer@3 0.0)) (= maskTransfer@2 (U_2_real (MapType1Select Mask@1 null (wand_3 true FullPerm))))) (and (=> (= (ControlFlow 0 42) 40) anon70_Then_correct) (=> (= (ControlFlow 0 42) 41) anon70_Else_correct)))))
(let ((anon69_Else_correct  (=> (and (not (and (and (and b_37@2 b_38@4) true) (> neededTransfer@3 0.0))) (= Mask@3 Mask@1)) (=> (and (and (= Used_18Mask@5 Used_18Mask@3) (= b_38@6 b_38@4)) (and (= neededTransfer@5 neededTransfer@3) (= (ControlFlow 0 37) 35))) anon30_correct))))
(let ((anon68_Else_correct  (=> (>= 0.0 takeTransfer@1) (=> (and (and (= Ops_9Mask@1 ZeroMask) (= neededTransfer@3 neededTransfer@1)) (and (= b_38@4 b_38@2) (= Used_18Mask@3 Used_18Mask@1))) (and (=> (= (ControlFlow 0 45) 42) anon69_Then_correct) (=> (= (ControlFlow 0 45) 37) anon69_Else_correct))))))
(let ((anon68_Then_correct  (=> (> takeTransfer@1 0.0) (=> (and (and (and (= neededTransfer@2 (- neededTransfer@1 takeTransfer@1)) (= Used_18Mask@2 (MapType1Store Used_18Mask@1 null (wand_3 true FullPerm) (real_2_U (+ (U_2_real (MapType1Select Used_18Mask@1 null (wand_3 true FullPerm))) takeTransfer@1))))) (and (= b_38@3  (and b_38@2 (state Used_18Heap@0 Used_18Mask@2))) (= Ops_9Mask@0 (MapType1Store ZeroMask null (wand_3 true FullPerm) (real_2_U (- (U_2_real (MapType1Select ZeroMask null (wand_3 true FullPerm))) takeTransfer@1)))))) (and (and (= Ops_9Mask@1 Ops_9Mask@0) (= neededTransfer@3 neededTransfer@2)) (and (= b_38@4 b_38@3) (= Used_18Mask@3 Used_18Mask@2)))) (and (=> (= (ControlFlow 0 44) 42) anon69_Then_correct) (=> (= (ControlFlow 0 44) 37) anon69_Else_correct))))))
(let ((anon67_Else_correct  (=> (and (< maskTransfer@1 neededTransfer@1) (= takeTransfer@1 maskTransfer@1)) (and (=> (= (ControlFlow 0 47) 44) anon68_Then_correct) (=> (= (ControlFlow 0 47) 45) anon68_Else_correct)))))
(let ((anon67_Then_correct  (=> (and (<= neededTransfer@1 maskTransfer@1) (= takeTransfer@1 neededTransfer@1)) (and (=> (= (ControlFlow 0 46) 44) anon68_Then_correct) (=> (= (ControlFlow 0 46) 45) anon68_Else_correct)))))
(let ((anon66_Then_correct  (=> (and (and (and (and b_37@2 b_38@2) true) (> neededTransfer@1 0.0)) (= maskTransfer@1 (U_2_real (MapType1Select ZeroMask null (wand_3 true FullPerm))))) (and (=> (= (ControlFlow 0 48) 46) anon67_Then_correct) (=> (= (ControlFlow 0 48) 47) anon67_Else_correct)))))
(let ((anon66_Else_correct  (=> (not (and (and (and b_37@2 b_38@2) true) (> neededTransfer@1 0.0))) (=> (and (and (= Ops_9Mask@1 ZeroMask) (= neededTransfer@3 neededTransfer@1)) (and (= b_38@4 b_38@2) (= Used_18Mask@3 Used_18Mask@1))) (and (=> (= (ControlFlow 0 43) 42) anon69_Then_correct) (=> (= (ControlFlow 0 43) 37) anon69_Else_correct))))))
(let ((anon65_Else_correct  (=> (>= 0.0 takeTransfer@0) (=> (and (and (= Ops_11Mask@1 ZeroMask) (= Used_18Mask@1 ZeroMask)) (and (= b_38@2 b_38@0) (= neededTransfer@1 1.0))) (and (=> (= (ControlFlow 0 51) 48) anon66_Then_correct) (=> (= (ControlFlow 0 51) 43) anon66_Else_correct))))))
(let ((anon65_Then_correct  (=> (> takeTransfer@0 0.0) (=> (and (and (and (= neededTransfer@0 (- 1.0 takeTransfer@0)) (= Used_18Mask@0 (MapType1Store ZeroMask null (wand_3 true FullPerm) (real_2_U (+ (U_2_real (MapType1Select ZeroMask null (wand_3 true FullPerm))) takeTransfer@0))))) (and (= b_38@1  (and b_38@0 (state Used_18Heap@0 Used_18Mask@0))) (= Ops_11Mask@0 (MapType1Store ZeroMask null (wand_3 true FullPerm) (real_2_U (- (U_2_real (MapType1Select ZeroMask null (wand_3 true FullPerm))) takeTransfer@0)))))) (and (and (= Ops_11Mask@1 Ops_11Mask@0) (= Used_18Mask@1 Used_18Mask@0)) (and (= b_38@2 b_38@1) (= neededTransfer@1 neededTransfer@0)))) (and (=> (= (ControlFlow 0 50) 48) anon66_Then_correct) (=> (= (ControlFlow 0 50) 43) anon66_Else_correct))))))
(let ((anon64_Else_correct  (=> (and (< maskTransfer@0 1.0) (= takeTransfer@0 maskTransfer@0)) (and (=> (= (ControlFlow 0 53) 50) anon65_Then_correct) (=> (= (ControlFlow 0 53) 51) anon65_Else_correct)))))
(let ((anon64_Then_correct  (=> (and (<= 1.0 maskTransfer@0) (= takeTransfer@0 1.0)) (and (=> (= (ControlFlow 0 52) 50) anon65_Then_correct) (=> (= (ControlFlow 0 52) 51) anon65_Else_correct)))))
(let ((anon63_Then_correct  (=> (and (and (and (and b_37@2 b_38@0) true) (> 1.0 0.0)) (= maskTransfer@0 (U_2_real (MapType1Select ZeroMask null (wand_3 true FullPerm))))) (and (=> (= (ControlFlow 0 54) 52) anon64_Then_correct) (=> (= (ControlFlow 0 54) 53) anon64_Else_correct)))))
(let ((anon63_Else_correct  (=> (not (and (and (and b_37@2 b_38@0) true) (> 1.0 0.0))) (=> (and (and (= Ops_11Mask@1 ZeroMask) (= Used_18Mask@1 ZeroMask)) (and (= b_38@2 b_38@0) (= neededTransfer@1 1.0))) (and (=> (= (ControlFlow 0 49) 48) anon66_Then_correct) (=> (= (ControlFlow 0 49) 43) anon66_Else_correct))))))
(let ((anon12_correct  (=> (= initNeededTransfer@0 (+ (U_2_real (MapType1Select ZeroMask null (wand_3 true FullPerm))) 1.0)) (and (=> (= (ControlFlow 0 55) (- 0 56)) (>= 1.0 0.0)) (=> (>= 1.0 0.0) (and (=> (= (ControlFlow 0 55) 54) anon63_Then_correct) (=> (= (ControlFlow 0 55) 49) anon63_Else_correct)))))))
(let ((anon61_Then_correct  (=> b_37@2 (and (=> (= (ControlFlow 0 60) 59) anon62_Then_correct) (=> (= (ControlFlow 0 60) 55) anon12_correct)))))
(let ((anon61_Else_correct  (=> (and (not b_37@2) (= (ControlFlow 0 58) 55)) anon12_correct)))
(let ((anon60_Then_correct  (=> (and b_37@2 b_38@0) (and (=> (= (ControlFlow 0 61) 60) anon61_Then_correct) (=> (= (ControlFlow 0 61) 58) anon61_Else_correct)))))
(let ((anon60_Else_correct  (=> (and (not (and b_37@2 b_38@0)) (= (ControlFlow 0 57) 55)) anon12_correct)))
(let ((anon59_Then_correct  (=> (and (and b_37@2 b_35@2) (= b_38@0  (and b_38 (state Used_18Heap@0 ZeroMask)))) (and (=> (= (ControlFlow 0 62) 61) anon60_Then_correct) (=> (= (ControlFlow 0 62) 57) anon60_Else_correct)))))
(let ((anon59_Else_correct  (=> (not (and b_37@2 b_35@2)) (=> (and (= Ops_11Heap@1 Ops_11Heap@0) (= b_37@14 b_37@2)) (=> (and (and (= Mask@4 Mask@1) (= Ops_9Mask@2 ZeroMask)) (and (= Ops_11Mask@3 ZeroMask) (= (ControlFlow 0 34) 32))) anon31_correct)))))
(let ((anon7_correct  (=> (and (= b_37@1  (and b_37@0 (state Ops_11Heap@0 ZeroMask))) (= b_37@2  (and b_37@1 (state Ops_11Heap@0 ZeroMask)))) (and (=> (= (ControlFlow 0 63) 62) anon59_Then_correct) (=> (= (ControlFlow 0 63) 34) anon59_Else_correct)))))
(let ((anon58_Else_correct  (=> (and (not b_37@0) (= (ControlFlow 0 65) 63)) anon7_correct)))
(let ((anon58_Then_correct  (=> (and b_37@0 (= (ControlFlow 0 64) 63)) anon7_correct)))
(let ((anon57_Then_correct  (=> b_35@2 (=> (and (= b_37@0  (and b_37 (state Ops_11Heap@0 ZeroMask))) (= b_36@0  (and b_36 (state Used_17Heap@0 ZeroMask)))) (and (=> (= (ControlFlow 0 66) 64) anon58_Then_correct) (=> (= (ControlFlow 0 66) 65) anon58_Else_correct))))))
(let ((anon57_Else_correct  (=> (and (and (not b_35@2) (= Mask@7 Mask@1)) (and (= Heap@2 Heap@@12) (= (ControlFlow 0 11) 10))) anon50_correct)))
(let ((anon4_correct  (=> (and (= b_35@1  (and b_35@0 (state Ops_9Heap@0 ZeroMask))) (= b_35@2  (and b_35@1 (state Ops_9Heap@0 ZeroMask)))) (and (=> (= (ControlFlow 0 67) 66) anon57_Then_correct) (=> (= (ControlFlow 0 67) 11) anon57_Else_correct)))))
(let ((anon56_Else_correct  (=> (and (not b_35@0) (= (ControlFlow 0 69) 67)) anon4_correct)))
(let ((anon56_Then_correct  (=> (and b_35@0 (= (ControlFlow 0 68) 67)) anon4_correct)))
(let ((anon55_Else_correct  (=> (and (= Mask@1 (MapType1Store Mask@0 null (wand_3 true FullPerm) (real_2_U (+ (U_2_real (MapType1Select Mask@0 null (wand_3 true FullPerm))) FullPerm)))) (state Heap@@12 Mask@1)) (=> (and (and (state Heap@@12 Mask@1) (state Heap@@12 Mask@1)) (and (= b_35@0  (and b_35 (state Ops_9Heap@0 ZeroMask))) (= b_34@0  (and b_34 (state Used_16Heap@0 ZeroMask))))) (and (=> (= (ControlFlow 0 70) 68) anon56_Then_correct) (=> (= (ControlFlow 0 70) 69) anon56_Else_correct))))))
(let ((anon55_Then_correct true))
(let ((anon0_correct  (=> (state Heap@@12 ZeroMask) (=> (and (and (= Mask@0 (MapType1Store ZeroMask null R (real_2_U (+ (U_2_real (MapType1Select ZeroMask null R)) FullPerm)))) (state Heap@@12 Mask@0)) (and (state Heap@@12 Mask@0) (state Heap@@12 Mask@0))) (and (=> (= (ControlFlow 0 71) 1) anon55_Then_correct) (=> (= (ControlFlow 0 71) 70) anon55_Else_correct))))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 72) 71) anon0_correct)))
PreconditionGeneratedEntry_correct))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
))
(check-sat)
(get-info :reason-unknown)
(assert (not (= (ControlFlow 0 4) (- 3))))
(check-sat)
(pop 1)
; Invalid
(get-info :rlimit)
