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
(declare-fun val () T@U)
(declare-fun next () T@U)
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
(declare-fun wand_3 (Bool Bool Real) T@U)
(declare-fun IsWandField (T@U) Bool)
(declare-fun WandType_wand_3Type () T@T)
(declare-fun |wand_3#ft| (Bool Bool Real) T@U)
(declare-fun FrameTypeType () T@T)
(declare-fun getPredWandId (T@U) Int)
(declare-fun IsPredicateField (T@U) Bool)
(declare-fun LLC (T@U Int) T@U)
(declare-fun PredicateType_LLCType () T@T)
(declare-fun |LLC#trigger| (T@U T@U) Bool)
(declare-fun |LLC#everUsed| (T@U) Bool)
(declare-fun IdenticalOnKnownLocations (T@U T@U T@U) Bool)
(declare-fun null () T@U)
(declare-fun PredicateMaskField (T@U) T@U)
(declare-fun HasDirectPerm (T@U T@U T@U) Bool)
(declare-fun WandMaskField (T@U) T@U)
(declare-fun P () T@U)
(declare-fun PredicateType_PType () T@T)
(declare-fun Q (Bool) T@U)
(declare-fun PredicateType_QType () T@T)
(declare-fun LL (T@U) T@U)
(declare-fun PredicateType_LLType () T@T)
(declare-fun |Q#trigger| (T@U T@U) Bool)
(declare-fun |Q#everUsed| (T@U) Bool)
(declare-fun |LL#trigger| (T@U T@U) Bool)
(declare-fun |LL#everUsed| (T@U) Bool)
(declare-fun |wand_2#ft| (T@U Real T@U Real T@U Int T@U Real T@U T@U T@U Real T@U Int T@U Real T@U Real T@U T@U T@U Real T@U T@U) T@U)
(declare-fun |wand_2#sm| (T@U Real T@U Real T@U Int T@U Real T@U T@U T@U Real T@U Int T@U Real T@U Real T@U T@U T@U Real T@U T@U) T@U)
(declare-fun WandType_wand_2Type () T@T)
(declare-fun |wand#ft| (Bool Real Bool Real Bool Bool) T@U)
(declare-fun |wand#sm| (Bool Real Bool Real Bool Bool) T@U)
(declare-fun WandType_wandType () T@T)
(declare-fun |wand_3#sm| (Bool Bool Real) T@U)
(declare-fun wand_2 (T@U Real T@U Real T@U Int T@U Real T@U T@U T@U Real T@U Int T@U Real T@U Real T@U T@U T@U Real T@U T@U) T@U)
(declare-fun |Q#sm| (Bool) T@U)
(declare-fun |LLC#sm| (T@U Int) T@U)
(declare-fun |LL#sm| (T@U) T@U)
(declare-fun dummyHeap () T@U)
(declare-fun ZeroMask () T@U)
(declare-fun wand_4 (T@U Int Real T@U Int Real T@U Int Real T@U T@U T@U Int Real T@U Int) T@U)
(declare-fun WandType_wand_4Type () T@T)
(declare-fun wand_1 (T@U Real T@U Real T@U Int T@U Real T@U T@U T@U Real T@U Int T@U Real) T@U)
(declare-fun WandType_wand_1Type () T@T)
(declare-fun InsidePredicate (T@U T@U T@U T@U) Bool)
(declare-fun |wand_4#ft| (T@U Int Real T@U Int Real T@U Int Real T@U T@U T@U Int Real T@U Int) T@U)
(declare-fun |wand_1#ft| (T@U Real T@U Real T@U Int T@U Real T@U T@U T@U Real T@U Int T@U Real) T@U)
(declare-fun sumMask (T@U T@U T@U) Bool)
(declare-fun ConditionalFrame (Real T@U) T@U)
(declare-fun EmptyFrame () T@U)
(declare-fun NoPerm () Real)
(declare-fun wand (Bool Real Bool Real Bool Bool) T@U)
(declare-fun FullPerm () Real)
(declare-fun |P#trigger| (T@U T@U) Bool)
(declare-fun |P#everUsed| (T@U) Bool)
(declare-fun |wand_4#sm| (T@U Int Real T@U Int Real T@U Int Real T@U T@U T@U Int Real T@U Int) T@U)
(declare-fun |wand_1#sm| (T@U Real T@U Real T@U Int T@U Real T@U T@U T@U Real T@U Int T@U Real) T@U)
(declare-fun |P#sm| () T@U)
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
))) (= (Ctor NormalFieldType) 7)) (= (type $allocated) (FieldType NormalFieldType boolType))) (= (type val) (FieldType NormalFieldType intType))) (= (Ctor RefType) 8)) (= (type next) (FieldType NormalFieldType RefType))))
(assert (distinct $allocated val next)
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
))) (forall ((m T@U) (x0 T@U) (x1 T@U) (val@@0 T@U) ) (! (let ((B@@0 (FieldTypeInv1 (type x1))))
 (=> (= (type val@@0) B@@0) (= (MapType0Select (MapType0Store m x0 x1 val@@0) x0 x1) val@@0)))
 :qid |mapAx0:MapType0Select|
 :weight 0
))) (and (and (forall ((val@@1 T@U) (m@@0 T@U) (x0@@0 T@U) (x1@@0 T@U) (y0 T@U) (y1 T@U) ) (!  (or (= x0@@0 y0) (= (MapType0Select (MapType0Store m@@0 x0@@0 x1@@0 val@@1) y0 y1) (MapType0Select m@@0 y0 y1)))
 :qid |mapAx1:MapType0Select:0|
 :weight 0
)) (forall ((val@@2 T@U) (m@@1 T@U) (x0@@1 T@U) (x1@@1 T@U) (y0@@0 T@U) (y1@@0 T@U) ) (!  (or (= x1@@1 y1@@0) (= (MapType0Select (MapType0Store m@@1 x0@@1 x1@@1 val@@2) y0@@0 y1@@0) (MapType0Select m@@1 y0@@0 y1@@0)))
 :qid |mapAx1:MapType0Select:1|
 :weight 0
))) (forall ((val@@3 T@U) (m@@2 T@U) (x0@@2 T@U) (x1@@2 T@U) (y0@@1 T@U) (y1@@1 T@U) ) (!  (or true (= (MapType0Select (MapType0Store m@@2 x0@@2 x1@@2 val@@3) y0@@1 y1@@1) (MapType0Select m@@2 y0@@1 y1@@1)))
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
))) (forall ((m@@3 T@U) (x0@@3 T@U) (x1@@3 T@U) (val@@4 T@U) ) (! (let ((aVar1@@1 (MapType1TypeInv1 (type m@@3))))
 (=> (= (type val@@4) aVar1@@1) (= (MapType1Select (MapType1Store m@@3 x0@@3 x1@@3 val@@4) x0@@3 x1@@3) val@@4)))
 :qid |mapAx0:MapType1Select|
 :weight 0
))) (and (and (forall ((val@@5 T@U) (m@@4 T@U) (x0@@4 T@U) (x1@@4 T@U) (y0@@2 T@U) (y1@@2 T@U) ) (!  (or (= x0@@4 y0@@2) (= (MapType1Select (MapType1Store m@@4 x0@@4 x1@@4 val@@5) y0@@2 y1@@2) (MapType1Select m@@4 y0@@2 y1@@2)))
 :qid |mapAx1:MapType1Select:0|
 :weight 0
)) (forall ((val@@6 T@U) (m@@5 T@U) (x0@@5 T@U) (x1@@5 T@U) (y0@@3 T@U) (y1@@3 T@U) ) (!  (or (= x1@@5 y1@@3) (= (MapType1Select (MapType1Store m@@5 x0@@5 x1@@5 val@@6) y0@@3 y1@@3) (MapType1Select m@@5 y0@@3 y1@@3)))
 :qid |mapAx1:MapType1Select:1|
 :weight 0
))) (forall ((val@@7 T@U) (m@@6 T@U) (x0@@6 T@U) (x1@@6 T@U) (y0@@4 T@U) (y1@@4 T@U) ) (!  (or true (= (MapType1Select (MapType1Store m@@6 x0@@6 x1@@6 val@@7) y0@@4 y1@@4) (MapType1Select m@@6 y0@@4 y1@@4)))
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
(assert  (and (= (Ctor WandType_wand_3Type) 11) (forall ((arg0@@23 Bool) (arg1@@9 Bool) (arg2@@3 Real) ) (! (= (type (wand_3 arg0@@23 arg1@@9 arg2@@3)) (FieldType WandType_wand_3Type intType))
 :qid |funType:wand_3|
 :pattern ( (wand_3 arg0@@23 arg1@@9 arg2@@3))
))))
(assert (forall ((arg1@@10 Bool) (arg2@@4 Bool) (arg3@@1 Real) ) (! (IsWandField (wand_3 arg1@@10 arg2@@4 arg3@@1))
 :qid |stdinbpl.215:15|
 :skolemid |29|
 :pattern ( (wand_3 arg1@@10 arg2@@4 arg3@@1))
)))
(assert  (and (= (Ctor FrameTypeType) 12) (forall ((arg0@@24 Bool) (arg1@@11 Bool) (arg2@@5 Real) ) (! (= (type (|wand_3#ft| arg0@@24 arg1@@11 arg2@@5)) (FieldType WandType_wand_3Type FrameTypeType))
 :qid |funType:wand_3#ft|
 :pattern ( (|wand_3#ft| arg0@@24 arg1@@11 arg2@@5))
))))
(assert (forall ((arg1@@12 Bool) (arg2@@6 Bool) (arg3@@2 Real) ) (! (IsWandField (|wand_3#ft| arg1@@12 arg2@@6 arg3@@2))
 :qid |stdinbpl.219:15|
 :skolemid |30|
 :pattern ( (|wand_3#ft| arg1@@12 arg2@@6 arg3@@2))
)))
(assert (forall ((arg1@@13 Bool) (arg2@@7 Bool) (arg3@@3 Real) ) (! (= (getPredWandId (wand_3 arg1@@13 arg2@@7 arg3@@3)) 5)
 :qid |stdinbpl.235:15|
 :skolemid |34|
 :pattern ( (wand_3 arg1@@13 arg2@@7 arg3@@3))
)))
(assert (forall ((arg1@@14 Bool) (arg2@@8 Bool) (arg3@@4 Real) ) (!  (not (IsPredicateField (wand_3 arg1@@14 arg2@@8 arg3@@4)))
 :qid |stdinbpl.223:15|
 :skolemid |31|
 :pattern ( (wand_3 arg1@@14 arg2@@8 arg3@@4))
)))
(assert (forall ((arg1@@15 Bool) (arg2@@9 Bool) (arg3@@5 Real) ) (!  (not (IsPredicateField (|wand_3#ft| arg1@@15 arg2@@9 arg3@@5)))
 :qid |stdinbpl.227:15|
 :skolemid |32|
 :pattern ( (|wand_3#ft| arg1@@15 arg2@@9 arg3@@5))
)))
(assert  (and (= (Ctor PredicateType_LLCType) 13) (forall ((arg0@@25 T@U) (arg1@@16 Int) ) (! (= (type (LLC arg0@@25 arg1@@16)) (FieldType PredicateType_LLCType FrameTypeType))
 :qid |funType:LLC|
 :pattern ( (LLC arg0@@25 arg1@@16))
))))
(assert (forall ((x@@8 T@U) (i Int) ) (!  (=> (= (type x@@8) RefType) (IsPredicateField (LLC x@@8 i)))
 :qid |stdinbpl.503:15|
 :skolemid |71|
 :pattern ( (LLC x@@8 i))
)))
(assert (forall ((Heap@@0 T@U) (x@@9 T@U) (i@@0 Int) ) (!  (=> (and (= (type Heap@@0) (MapType0Type RefType)) (= (type x@@9) RefType)) (|LLC#everUsed| (LLC x@@9 i@@0)))
 :qid |stdinbpl.522:15|
 :skolemid |75|
 :pattern ( (|LLC#trigger| Heap@@0 (LLC x@@9 i@@0)))
)))
(assert  (and (= (type null) RefType) (forall ((arg0@@26 T@U) ) (! (let ((A (FieldTypeInv0 (type arg0@@26))))
(= (type (PredicateMaskField arg0@@26)) (FieldType A (MapType1Type RefType boolType))))
 :qid |funType:PredicateMaskField|
 :pattern ( (PredicateMaskField arg0@@26))
))))
(assert (forall ((Heap@@1 T@U) (ExhaleHeap T@U) (Mask@@0 T@U) (pm_f T@U) ) (! (let ((C (FieldTypeInv0 (type pm_f))))
 (=> (and (and (and (and (and (= (type Heap@@1) (MapType0Type RefType)) (= (type ExhaleHeap) (MapType0Type RefType))) (= (type Mask@@0) (MapType1Type RefType realType))) (= (type pm_f) (FieldType C FrameTypeType))) (IdenticalOnKnownLocations Heap@@1 ExhaleHeap Mask@@0)) (and (HasDirectPerm Mask@@0 null pm_f) (IsPredicateField pm_f))) (= (MapType0Select Heap@@1 null (PredicateMaskField pm_f)) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))))
 :qid |stdinbpl.47:19|
 :skolemid |2|
 :pattern ( (IdenticalOnKnownLocations Heap@@1 ExhaleHeap Mask@@0) (IsPredicateField pm_f) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))
)))
(assert (forall ((arg0@@27 T@U) ) (! (let ((A@@0 (FieldTypeInv0 (type arg0@@27))))
(= (type (WandMaskField arg0@@27)) (FieldType A@@0 (MapType1Type RefType boolType))))
 :qid |funType:WandMaskField|
 :pattern ( (WandMaskField arg0@@27))
)))
(assert (forall ((Heap@@2 T@U) (ExhaleHeap@@0 T@U) (Mask@@1 T@U) (pm_f@@0 T@U) ) (! (let ((C@@0 (FieldTypeInv0 (type pm_f@@0))))
 (=> (and (and (and (and (and (= (type Heap@@2) (MapType0Type RefType)) (= (type ExhaleHeap@@0) (MapType0Type RefType))) (= (type Mask@@1) (MapType1Type RefType realType))) (= (type pm_f@@0) (FieldType C@@0 FrameTypeType))) (IdenticalOnKnownLocations Heap@@2 ExhaleHeap@@0 Mask@@1)) (and (HasDirectPerm Mask@@1 null pm_f@@0) (IsWandField pm_f@@0))) (= (MapType0Select Heap@@2 null (WandMaskField pm_f@@0)) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))))
 :qid |stdinbpl.60:19|
 :skolemid |5|
 :pattern ( (IdenticalOnKnownLocations Heap@@2 ExhaleHeap@@0 Mask@@1) (IsWandField pm_f@@0) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))
)))
(assert  (and (= (Ctor PredicateType_PType) 14) (= (type P) (FieldType PredicateType_PType FrameTypeType))))
(assert (IsPredicateField P))
(assert (= (getPredWandId P) 0))
(assert  (and (= (Ctor PredicateType_QType) 15) (forall ((arg0@@28 Bool) ) (! (= (type (Q arg0@@28)) (FieldType PredicateType_QType FrameTypeType))
 :qid |funType:Q|
 :pattern ( (Q arg0@@28))
))))
(assert (forall ((b_2 Bool) ) (! (IsPredicateField (Q b_2))
 :qid |stdinbpl.380:15|
 :skolemid |59|
 :pattern ( (Q b_2))
)))
(assert  (and (= (Ctor PredicateType_LLType) 16) (forall ((arg0@@29 T@U) ) (! (= (type (LL arg0@@29)) (FieldType PredicateType_LLType FrameTypeType))
 :qid |funType:LL|
 :pattern ( (LL arg0@@29))
))))
(assert (forall ((x@@10 T@U) ) (!  (=> (= (type x@@10) RefType) (IsPredicateField (LL x@@10)))
 :qid |stdinbpl.433:15|
 :skolemid |65|
 :pattern ( (LL x@@10))
)))
(assert (forall ((Heap@@3 T@U) (b_2@@0 Bool) ) (!  (=> (= (type Heap@@3) (MapType0Type RefType)) (|Q#everUsed| (Q b_2@@0)))
 :qid |stdinbpl.399:15|
 :skolemid |63|
 :pattern ( (|Q#trigger| Heap@@3 (Q b_2@@0)))
)))
(assert (forall ((Heap@@4 T@U) (x@@11 T@U) ) (!  (=> (and (= (type Heap@@4) (MapType0Type RefType)) (= (type x@@11) RefType)) (|LL#everUsed| (LL x@@11)))
 :qid |stdinbpl.452:15|
 :skolemid |69|
 :pattern ( (|LL#trigger| Heap@@4 (LL x@@11)))
)))
(assert  (and (and (= (Ctor WandType_wand_2Type) 17) (forall ((arg0@@30 T@U) (arg1@@17 Real) (arg2@@10 T@U) (arg3@@6 Real) (arg4 T@U) (arg5 Int) (arg6 T@U) (arg7 Real) (arg8 T@U) (arg9 T@U) (arg10 T@U) (arg11 Real) (arg12 T@U) (arg13 Int) (arg14 T@U) (arg15 Real) (arg16 T@U) (arg17 Real) (arg18 T@U) (arg19 T@U) (arg20 T@U) (arg21 Real) (arg22 T@U) (arg23 T@U) ) (! (= (type (|wand_2#ft| arg0@@30 arg1@@17 arg2@@10 arg3@@6 arg4 arg5 arg6 arg7 arg8 arg9 arg10 arg11 arg12 arg13 arg14 arg15 arg16 arg17 arg18 arg19 arg20 arg21 arg22 arg23)) (FieldType WandType_wand_2Type FrameTypeType))
 :qid |funType:wand_2#ft|
 :pattern ( (|wand_2#ft| arg0@@30 arg1@@17 arg2@@10 arg3@@6 arg4 arg5 arg6 arg7 arg8 arg9 arg10 arg11 arg12 arg13 arg14 arg15 arg16 arg17 arg18 arg19 arg20 arg21 arg22 arg23))
))) (forall ((arg0@@31 T@U) (arg1@@18 Real) (arg2@@11 T@U) (arg3@@7 Real) (arg4@@0 T@U) (arg5@@0 Int) (arg6@@0 T@U) (arg7@@0 Real) (arg8@@0 T@U) (arg9@@0 T@U) (arg10@@0 T@U) (arg11@@0 Real) (arg12@@0 T@U) (arg13@@0 Int) (arg14@@0 T@U) (arg15@@0 Real) (arg16@@0 T@U) (arg17@@0 Real) (arg18@@0 T@U) (arg19@@0 T@U) (arg20@@0 T@U) (arg21@@0 Real) (arg22@@0 T@U) (arg23@@0 T@U) ) (! (= (type (|wand_2#sm| arg0@@31 arg1@@18 arg2@@11 arg3@@7 arg4@@0 arg5@@0 arg6@@0 arg7@@0 arg8@@0 arg9@@0 arg10@@0 arg11@@0 arg12@@0 arg13@@0 arg14@@0 arg15@@0 arg16@@0 arg17@@0 arg18@@0 arg19@@0 arg20@@0 arg21@@0 arg22@@0 arg23@@0)) (FieldType WandType_wand_2Type (MapType1Type RefType boolType)))
 :qid |funType:wand_2#sm|
 :pattern ( (|wand_2#sm| arg0@@31 arg1@@18 arg2@@11 arg3@@7 arg4@@0 arg5@@0 arg6@@0 arg7@@0 arg8@@0 arg9@@0 arg10@@0 arg11@@0 arg12@@0 arg13@@0 arg14@@0 arg15@@0 arg16@@0 arg17@@0 arg18@@0 arg19@@0 arg20@@0 arg21@@0 arg22@@0 arg23@@0))
))))
(assert (forall ((arg1@@19 T@U) (arg2@@12 Real) (arg3@@8 T@U) (arg4@@1 Real) (arg5@@1 T@U) (arg6@@1 Int) (arg7@@1 T@U) (arg8@@1 Real) (arg9@@1 T@U) (arg10@@1 T@U) (arg11@@1 T@U) (arg12@@1 Real) (arg13@@1 T@U) (arg14@@1 Int) (arg15@@1 T@U) (arg16@@1 Real) (arg17@@1 T@U) (arg18@@1 Real) (arg19@@1 T@U) (arg20@@1 T@U) (arg21@@1 T@U) (arg22@@1 Real) (arg23@@1 T@U) (arg24 T@U) ) (!  (=> (and (and (and (and (and (and (and (and (and (and (and (and (and (and (= (type arg1@@19) RefType) (= (type arg3@@8) RefType)) (= (type arg5@@1) RefType)) (= (type arg7@@1) RefType)) (= (type arg9@@1) RefType)) (= (type arg10@@1) RefType)) (= (type arg11@@1) RefType)) (= (type arg13@@1) RefType)) (= (type arg15@@1) RefType)) (= (type arg17@@1) RefType)) (= (type arg19@@1) RefType)) (= (type arg20@@1) RefType)) (= (type arg21@@1) RefType)) (= (type arg23@@1) RefType)) (= (type arg24) RefType)) (= (|wand_2#sm| arg1@@19 arg2@@12 arg3@@8 arg4@@1 arg5@@1 arg6@@1 arg7@@1 arg8@@1 arg9@@1 arg10@@1 arg11@@1 arg12@@1 arg13@@1 arg14@@1 arg15@@1 arg16@@1 arg17@@1 arg18@@1 arg19@@1 arg20@@1 arg21@@1 arg22@@1 arg23@@1 arg24) (WandMaskField (|wand_2#ft| arg1@@19 arg2@@12 arg3@@8 arg4@@1 arg5@@1 arg6@@1 arg7@@1 arg8@@1 arg9@@1 arg10@@1 arg11@@1 arg12@@1 arg13@@1 arg14@@1 arg15@@1 arg16@@1 arg17@@1 arg18@@1 arg19@@1 arg20@@1 arg21@@1 arg22@@1 arg23@@1 arg24))))
 :qid |stdinbpl.263:15|
 :skolemid |40|
 :pattern ( (WandMaskField (|wand_2#ft| arg1@@19 arg2@@12 arg3@@8 arg4@@1 arg5@@1 arg6@@1 arg7@@1 arg8@@1 arg9@@1 arg10@@1 arg11@@1 arg12@@1 arg13@@1 arg14@@1 arg15@@1 arg16@@1 arg17@@1 arg18@@1 arg19@@1 arg20@@1 arg21@@1 arg22@@1 arg23@@1 arg24)))
)))
(assert  (and (and (= (Ctor WandType_wandType) 18) (forall ((arg0@@32 Bool) (arg1@@20 Real) (arg2@@13 Bool) (arg3@@9 Real) (arg4@@2 Bool) (arg5@@2 Bool) ) (! (= (type (|wand#ft| arg0@@32 arg1@@20 arg2@@13 arg3@@9 arg4@@2 arg5@@2)) (FieldType WandType_wandType FrameTypeType))
 :qid |funType:wand#ft|
 :pattern ( (|wand#ft| arg0@@32 arg1@@20 arg2@@13 arg3@@9 arg4@@2 arg5@@2))
))) (forall ((arg0@@33 Bool) (arg1@@21 Real) (arg2@@14 Bool) (arg3@@10 Real) (arg4@@3 Bool) (arg5@@3 Bool) ) (! (= (type (|wand#sm| arg0@@33 arg1@@21 arg2@@14 arg3@@10 arg4@@3 arg5@@3)) (FieldType WandType_wandType (MapType1Type RefType boolType)))
 :qid |funType:wand#sm|
 :pattern ( (|wand#sm| arg0@@33 arg1@@21 arg2@@14 arg3@@10 arg4@@3 arg5@@3))
))))
(assert (forall ((arg1@@22 Bool) (arg2@@15 Real) (arg3@@11 Bool) (arg4@@4 Real) (arg5@@4 Bool) (arg6@@2 Bool) ) (! (= (|wand#sm| arg1@@22 arg2@@15 arg3@@11 arg4@@4 arg5@@4 arg6@@2) (WandMaskField (|wand#ft| arg1@@22 arg2@@15 arg3@@11 arg4@@4 arg5@@4 arg6@@2)))
 :qid |stdinbpl.199:15|
 :skolemid |26|
 :pattern ( (WandMaskField (|wand#ft| arg1@@22 arg2@@15 arg3@@11 arg4@@4 arg5@@4 arg6@@2)))
)))
(assert (forall ((arg0@@34 Bool) (arg1@@23 Bool) (arg2@@16 Real) ) (! (= (type (|wand_3#sm| arg0@@34 arg1@@23 arg2@@16)) (FieldType WandType_wand_3Type (MapType1Type RefType boolType)))
 :qid |funType:wand_3#sm|
 :pattern ( (|wand_3#sm| arg0@@34 arg1@@23 arg2@@16))
)))
(assert (forall ((arg1@@24 Bool) (arg2@@17 Bool) (arg3@@12 Real) ) (! (= (|wand_3#sm| arg1@@24 arg2@@17 arg3@@12) (WandMaskField (|wand_3#ft| arg1@@24 arg2@@17 arg3@@12)))
 :qid |stdinbpl.231:15|
 :skolemid |33|
 :pattern ( (WandMaskField (|wand_3#ft| arg1@@24 arg2@@17 arg3@@12)))
)))
(assert (forall ((arg1@@25 Bool) (arg2@@18 Bool) (arg3@@13 Real) (arg1_2 Bool) (arg2_2 Bool) (arg3_2 Real) ) (!  (=> (= (wand_3 arg1@@25 arg2@@18 arg3@@13) (wand_3 arg1_2 arg2_2 arg3_2)) (and (= arg1@@25 arg1_2) (and (= arg2@@18 arg2_2) (= arg3@@13 arg3_2))))
 :qid |stdinbpl.239:15|
 :skolemid |35|
 :pattern ( (wand_3 arg1@@25 arg2@@18 arg3@@13) (wand_3 arg1_2 arg2_2 arg3_2))
)))
(assert (forall ((arg0@@35 T@U) (arg1@@26 Real) (arg2@@19 T@U) (arg3@@14 Real) (arg4@@5 T@U) (arg5@@5 Int) (arg6@@3 T@U) (arg7@@2 Real) (arg8@@2 T@U) (arg9@@2 T@U) (arg10@@2 T@U) (arg11@@2 Real) (arg12@@2 T@U) (arg13@@2 Int) (arg14@@2 T@U) (arg15@@2 Real) (arg16@@2 T@U) (arg17@@2 Real) (arg18@@2 T@U) (arg19@@2 T@U) (arg20@@2 T@U) (arg21@@2 Real) (arg22@@2 T@U) (arg23@@2 T@U) ) (! (= (type (wand_2 arg0@@35 arg1@@26 arg2@@19 arg3@@14 arg4@@5 arg5@@5 arg6@@3 arg7@@2 arg8@@2 arg9@@2 arg10@@2 arg11@@2 arg12@@2 arg13@@2 arg14@@2 arg15@@2 arg16@@2 arg17@@2 arg18@@2 arg19@@2 arg20@@2 arg21@@2 arg22@@2 arg23@@2)) (FieldType WandType_wand_2Type intType))
 :qid |funType:wand_2|
 :pattern ( (wand_2 arg0@@35 arg1@@26 arg2@@19 arg3@@14 arg4@@5 arg5@@5 arg6@@3 arg7@@2 arg8@@2 arg9@@2 arg10@@2 arg11@@2 arg12@@2 arg13@@2 arg14@@2 arg15@@2 arg16@@2 arg17@@2 arg18@@2 arg19@@2 arg20@@2 arg21@@2 arg22@@2 arg23@@2))
)))
(assert (forall ((arg1@@27 T@U) (arg2@@20 Real) (arg3@@15 T@U) (arg4@@6 Real) (arg5@@6 T@U) (arg6@@4 Int) (arg7@@3 T@U) (arg8@@3 Real) (arg9@@3 T@U) (arg10@@3 T@U) (arg11@@3 T@U) (arg12@@3 Real) (arg13@@3 T@U) (arg14@@3 Int) (arg15@@3 T@U) (arg16@@3 Real) (arg17@@3 T@U) (arg18@@3 Real) (arg19@@3 T@U) (arg20@@3 T@U) (arg21@@3 T@U) (arg22@@3 Real) (arg23@@3 T@U) (arg24@@0 T@U) (arg1_2@@0 T@U) (arg2_2@@0 Real) (arg3_2@@0 T@U) (arg4_2 Real) (arg5_2 T@U) (arg6_2 Int) (arg7_2 T@U) (arg8_2 Real) (arg9_2 T@U) (arg10_2 T@U) (arg11_2 T@U) (arg12_2 Real) (arg13_2 T@U) (arg14_2 Int) (arg15_2 T@U) (arg16_2 Real) (arg17_2 T@U) (arg18_2 Real) (arg19_2 T@U) (arg20_2 T@U) (arg21_2 T@U) (arg22_2 Real) (arg23_2 T@U) (arg24_2 T@U) ) (!  (=> (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (= (type arg1@@27) RefType) (= (type arg3@@15) RefType)) (= (type arg5@@6) RefType)) (= (type arg7@@3) RefType)) (= (type arg9@@3) RefType)) (= (type arg10@@3) RefType)) (= (type arg11@@3) RefType)) (= (type arg13@@3) RefType)) (= (type arg15@@3) RefType)) (= (type arg17@@3) RefType)) (= (type arg19@@3) RefType)) (= (type arg20@@3) RefType)) (= (type arg21@@3) RefType)) (= (type arg23@@3) RefType)) (= (type arg24@@0) RefType)) (= (type arg1_2@@0) RefType)) (= (type arg3_2@@0) RefType)) (= (type arg5_2) RefType)) (= (type arg7_2) RefType)) (= (type arg9_2) RefType)) (= (type arg10_2) RefType)) (= (type arg11_2) RefType)) (= (type arg13_2) RefType)) (= (type arg15_2) RefType)) (= (type arg17_2) RefType)) (= (type arg19_2) RefType)) (= (type arg20_2) RefType)) (= (type arg21_2) RefType)) (= (type arg23_2) RefType)) (= (type arg24_2) RefType)) (= (wand_2 arg1@@27 arg2@@20 arg3@@15 arg4@@6 arg5@@6 arg6@@4 arg7@@3 arg8@@3 arg9@@3 arg10@@3 arg11@@3 arg12@@3 arg13@@3 arg14@@3 arg15@@3 arg16@@3 arg17@@3 arg18@@3 arg19@@3 arg20@@3 arg21@@3 arg22@@3 arg23@@3 arg24@@0) (wand_2 arg1_2@@0 arg2_2@@0 arg3_2@@0 arg4_2 arg5_2 arg6_2 arg7_2 arg8_2 arg9_2 arg10_2 arg11_2 arg12_2 arg13_2 arg14_2 arg15_2 arg16_2 arg17_2 arg18_2 arg19_2 arg20_2 arg21_2 arg22_2 arg23_2 arg24_2))) (and (= arg1@@27 arg1_2@@0) (and (= arg2@@20 arg2_2@@0) (and (= arg3@@15 arg3_2@@0) (and (= arg4@@6 arg4_2) (and (= arg5@@6 arg5_2) (and (= arg6@@4 arg6_2) (and (= arg7@@3 arg7_2) (and (= arg8@@3 arg8_2) (and (= arg9@@3 arg9_2) (and (= arg10@@3 arg10_2) (and (= arg11@@3 arg11_2) (and (= arg12@@3 arg12_2) (and (= arg13@@3 arg13_2) (and (= arg14@@3 arg14_2) (and (= arg15@@3 arg15_2) (and (= arg16@@3 arg16_2) (and (= arg17@@3 arg17_2) (and (= arg18@@3 arg18_2) (and (= arg19@@3 arg19_2) (and (= arg20@@3 arg20_2) (and (= arg21@@3 arg21_2) (and (= arg22@@3 arg22_2) (and (= arg23@@3 arg23_2) (= arg24@@0 arg24_2)))))))))))))))))))))))))
 :qid |stdinbpl.271:15|
 :skolemid |42|
 :pattern ( (wand_2 arg1@@27 arg2@@20 arg3@@15 arg4@@6 arg5@@6 arg6@@4 arg7@@3 arg8@@3 arg9@@3 arg10@@3 arg11@@3 arg12@@3 arg13@@3 arg14@@3 arg15@@3 arg16@@3 arg17@@3 arg18@@3 arg19@@3 arg20@@3 arg21@@3 arg22@@3 arg23@@3 arg24@@0) (wand_2 arg1_2@@0 arg2_2@@0 arg3_2@@0 arg4_2 arg5_2 arg6_2 arg7_2 arg8_2 arg9_2 arg10_2 arg11_2 arg12_2 arg13_2 arg14_2 arg15_2 arg16_2 arg17_2 arg18_2 arg19_2 arg20_2 arg21_2 arg22_2 arg23_2 arg24_2))
)))
(assert (forall ((b_2@@1 Bool) (b2 Bool) ) (!  (=> (= (Q b_2@@1) (Q b2)) (= b_2@@1 b2))
 :qid |stdinbpl.390:15|
 :skolemid |61|
 :pattern ( (Q b_2@@1) (Q b2))
)))
(assert (forall ((arg0@@36 Bool) ) (! (= (type (|Q#sm| arg0@@36)) (FieldType PredicateType_QType (MapType1Type RefType boolType)))
 :qid |funType:Q#sm|
 :pattern ( (|Q#sm| arg0@@36))
)))
(assert (forall ((b_2@@2 Bool) (b2@@0 Bool) ) (!  (=> (= (|Q#sm| b_2@@2) (|Q#sm| b2@@0)) (= b_2@@2 b2@@0))
 :qid |stdinbpl.394:15|
 :skolemid |62|
 :pattern ( (|Q#sm| b_2@@2) (|Q#sm| b2@@0))
)))
(assert (forall ((Heap@@5 T@U) (ExhaleHeap@@1 T@U) (Mask@@2 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@5) (MapType0Type RefType)) (= (type ExhaleHeap@@1) (MapType0Type RefType))) (= (type Mask@@2) (MapType1Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@5 ExhaleHeap@@1 Mask@@2)) (U_2_bool (MapType0Select Heap@@5 o_1 $allocated))) (U_2_bool (MapType0Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.73:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@5 ExhaleHeap@@1 Mask@@2) (MapType0Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert (forall ((x@@12 T@U) (i@@1 Int) (x2 T@U) (i2 Int) ) (!  (=> (and (and (= (type x@@12) RefType) (= (type x2) RefType)) (= (LLC x@@12 i@@1) (LLC x2 i2))) (and (= x@@12 x2) (= i@@1 i2)))
 :qid |stdinbpl.513:15|
 :skolemid |73|
 :pattern ( (LLC x@@12 i@@1) (LLC x2 i2))
)))
(assert (forall ((arg0@@37 T@U) (arg1@@28 Int) ) (! (= (type (|LLC#sm| arg0@@37 arg1@@28)) (FieldType PredicateType_LLCType (MapType1Type RefType boolType)))
 :qid |funType:LLC#sm|
 :pattern ( (|LLC#sm| arg0@@37 arg1@@28))
)))
(assert (forall ((x@@13 T@U) (i@@2 Int) (x2@@0 T@U) (i2@@0 Int) ) (!  (=> (and (and (= (type x@@13) RefType) (= (type x2@@0) RefType)) (= (|LLC#sm| x@@13 i@@2) (|LLC#sm| x2@@0 i2@@0))) (and (= x@@13 x2@@0) (= i@@2 i2@@0)))
 :qid |stdinbpl.517:15|
 :skolemid |74|
 :pattern ( (|LLC#sm| x@@13 i@@2) (|LLC#sm| x2@@0 i2@@0))
)))
(assert (forall ((x@@14 T@U) (x2@@1 T@U) ) (!  (=> (and (and (= (type x@@14) RefType) (= (type x2@@1) RefType)) (= (LL x@@14) (LL x2@@1))) (= x@@14 x2@@1))
 :qid |stdinbpl.443:15|
 :skolemid |67|
 :pattern ( (LL x@@14) (LL x2@@1))
)))
(assert (forall ((arg0@@38 T@U) ) (! (= (type (|LL#sm| arg0@@38)) (FieldType PredicateType_LLType (MapType1Type RefType boolType)))
 :qid |funType:LL#sm|
 :pattern ( (|LL#sm| arg0@@38))
)))
(assert (forall ((x@@15 T@U) (x2@@2 T@U) ) (!  (=> (and (and (= (type x@@15) RefType) (= (type x2@@2) RefType)) (= (|LL#sm| x@@15) (|LL#sm| x2@@2))) (= x@@15 x2@@2))
 :qid |stdinbpl.447:15|
 :skolemid |68|
 :pattern ( (|LL#sm| x@@15) (|LL#sm| x2@@2))
)))
(assert (forall ((Heap@@6 T@U) (ExhaleHeap@@2 T@U) (Mask@@3 T@U) (o_1@@0 T@U) (f_2 T@U) ) (! (let ((B@@1 (FieldTypeInv1 (type f_2))))
(let ((A@@1 (FieldTypeInv0 (type f_2))))
 (=> (and (and (and (and (and (and (= (type Heap@@6) (MapType0Type RefType)) (= (type ExhaleHeap@@2) (MapType0Type RefType))) (= (type Mask@@3) (MapType1Type RefType realType))) (= (type o_1@@0) RefType)) (= (type f_2) (FieldType A@@1 B@@1))) (IdenticalOnKnownLocations Heap@@6 ExhaleHeap@@2 Mask@@3)) (HasDirectPerm Mask@@3 o_1@@0 f_2)) (= (MapType0Select Heap@@6 o_1@@0 f_2) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2)))))
 :qid |stdinbpl.42:22|
 :skolemid |1|
 :pattern ( (IdenticalOnKnownLocations Heap@@6 ExhaleHeap@@2 Mask@@3) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2))
)))
(assert (forall ((arg1@@29 T@U) (arg2@@21 Real) (arg3@@16 T@U) (arg4@@7 Real) (arg5@@7 T@U) (arg6@@5 Int) (arg7@@4 T@U) (arg8@@4 Real) (arg9@@4 T@U) (arg10@@4 T@U) (arg11@@4 T@U) (arg12@@4 Real) (arg13@@4 T@U) (arg14@@4 Int) (arg15@@4 T@U) (arg16@@4 Real) (arg17@@4 T@U) (arg18@@4 Real) (arg19@@4 T@U) (arg20@@4 T@U) (arg21@@4 T@U) (arg22@@4 Real) (arg23@@4 T@U) (arg24@@1 T@U) ) (!  (=> (and (and (and (and (and (and (and (and (and (and (and (and (and (and (= (type arg1@@29) RefType) (= (type arg3@@16) RefType)) (= (type arg5@@7) RefType)) (= (type arg7@@4) RefType)) (= (type arg9@@4) RefType)) (= (type arg10@@4) RefType)) (= (type arg11@@4) RefType)) (= (type arg13@@4) RefType)) (= (type arg15@@4) RefType)) (= (type arg17@@4) RefType)) (= (type arg19@@4) RefType)) (= (type arg20@@4) RefType)) (= (type arg21@@4) RefType)) (= (type arg23@@4) RefType)) (= (type arg24@@1) RefType)) (IsWandField (wand_2 arg1@@29 arg2@@21 arg3@@16 arg4@@7 arg5@@7 arg6@@5 arg7@@4 arg8@@4 arg9@@4 arg10@@4 arg11@@4 arg12@@4 arg13@@4 arg14@@4 arg15@@4 arg16@@4 arg17@@4 arg18@@4 arg19@@4 arg20@@4 arg21@@4 arg22@@4 arg23@@4 arg24@@1)))
 :qid |stdinbpl.247:15|
 :skolemid |36|
 :pattern ( (wand_2 arg1@@29 arg2@@21 arg3@@16 arg4@@7 arg5@@7 arg6@@5 arg7@@4 arg8@@4 arg9@@4 arg10@@4 arg11@@4 arg12@@4 arg13@@4 arg14@@4 arg15@@4 arg16@@4 arg17@@4 arg18@@4 arg19@@4 arg20@@4 arg21@@4 arg22@@4 arg23@@4 arg24@@1))
)))
(assert (forall ((arg1@@30 T@U) (arg2@@22 Real) (arg3@@17 T@U) (arg4@@8 Real) (arg5@@8 T@U) (arg6@@6 Int) (arg7@@5 T@U) (arg8@@5 Real) (arg9@@5 T@U) (arg10@@5 T@U) (arg11@@5 T@U) (arg12@@5 Real) (arg13@@5 T@U) (arg14@@5 Int) (arg15@@5 T@U) (arg16@@5 Real) (arg17@@5 T@U) (arg18@@5 Real) (arg19@@5 T@U) (arg20@@5 T@U) (arg21@@5 T@U) (arg22@@5 Real) (arg23@@5 T@U) (arg24@@2 T@U) ) (!  (=> (and (and (and (and (and (and (and (and (and (and (and (and (and (and (= (type arg1@@30) RefType) (= (type arg3@@17) RefType)) (= (type arg5@@8) RefType)) (= (type arg7@@5) RefType)) (= (type arg9@@5) RefType)) (= (type arg10@@5) RefType)) (= (type arg11@@5) RefType)) (= (type arg13@@5) RefType)) (= (type arg15@@5) RefType)) (= (type arg17@@5) RefType)) (= (type arg19@@5) RefType)) (= (type arg20@@5) RefType)) (= (type arg21@@5) RefType)) (= (type arg23@@5) RefType)) (= (type arg24@@2) RefType)) (IsWandField (|wand_2#ft| arg1@@30 arg2@@22 arg3@@17 arg4@@8 arg5@@8 arg6@@6 arg7@@5 arg8@@5 arg9@@5 arg10@@5 arg11@@5 arg12@@5 arg13@@5 arg14@@5 arg15@@5 arg16@@5 arg17@@5 arg18@@5 arg19@@5 arg20@@5 arg21@@5 arg22@@5 arg23@@5 arg24@@2)))
 :qid |stdinbpl.251:15|
 :skolemid |37|
 :pattern ( (|wand_2#ft| arg1@@30 arg2@@22 arg3@@17 arg4@@8 arg5@@8 arg6@@6 arg7@@5 arg8@@5 arg9@@5 arg10@@5 arg11@@5 arg12@@5 arg13@@5 arg14@@5 arg15@@5 arg16@@5 arg17@@5 arg18@@5 arg19@@5 arg20@@5 arg21@@5 arg22@@5 arg23@@5 arg24@@2))
)))
(assert (forall ((arg1@@31 T@U) (arg2@@23 Real) (arg3@@18 T@U) (arg4@@9 Real) (arg5@@9 T@U) (arg6@@7 Int) (arg7@@6 T@U) (arg8@@6 Real) (arg9@@6 T@U) (arg10@@6 T@U) (arg11@@6 T@U) (arg12@@6 Real) (arg13@@6 T@U) (arg14@@6 Int) (arg15@@6 T@U) (arg16@@6 Real) (arg17@@6 T@U) (arg18@@6 Real) (arg19@@6 T@U) (arg20@@6 T@U) (arg21@@6 T@U) (arg22@@6 Real) (arg23@@6 T@U) (arg24@@3 T@U) ) (!  (=> (and (and (and (and (and (and (and (and (and (and (and (and (and (and (= (type arg1@@31) RefType) (= (type arg3@@18) RefType)) (= (type arg5@@9) RefType)) (= (type arg7@@6) RefType)) (= (type arg9@@6) RefType)) (= (type arg10@@6) RefType)) (= (type arg11@@6) RefType)) (= (type arg13@@6) RefType)) (= (type arg15@@6) RefType)) (= (type arg17@@6) RefType)) (= (type arg19@@6) RefType)) (= (type arg20@@6) RefType)) (= (type arg21@@6) RefType)) (= (type arg23@@6) RefType)) (= (type arg24@@3) RefType)) (not (IsPredicateField (wand_2 arg1@@31 arg2@@23 arg3@@18 arg4@@9 arg5@@9 arg6@@7 arg7@@6 arg8@@6 arg9@@6 arg10@@6 arg11@@6 arg12@@6 arg13@@6 arg14@@6 arg15@@6 arg16@@6 arg17@@6 arg18@@6 arg19@@6 arg20@@6 arg21@@6 arg22@@6 arg23@@6 arg24@@3))))
 :qid |stdinbpl.255:15|
 :skolemid |38|
 :pattern ( (wand_2 arg1@@31 arg2@@23 arg3@@18 arg4@@9 arg5@@9 arg6@@7 arg7@@6 arg8@@6 arg9@@6 arg10@@6 arg11@@6 arg12@@6 arg13@@6 arg14@@6 arg15@@6 arg16@@6 arg17@@6 arg18@@6 arg19@@6 arg20@@6 arg21@@6 arg22@@6 arg23@@6 arg24@@3))
)))
(assert (forall ((arg1@@32 T@U) (arg2@@24 Real) (arg3@@19 T@U) (arg4@@10 Real) (arg5@@10 T@U) (arg6@@8 Int) (arg7@@7 T@U) (arg8@@7 Real) (arg9@@7 T@U) (arg10@@7 T@U) (arg11@@7 T@U) (arg12@@7 Real) (arg13@@7 T@U) (arg14@@7 Int) (arg15@@7 T@U) (arg16@@7 Real) (arg17@@7 T@U) (arg18@@7 Real) (arg19@@7 T@U) (arg20@@7 T@U) (arg21@@7 T@U) (arg22@@7 Real) (arg23@@7 T@U) (arg24@@4 T@U) ) (!  (=> (and (and (and (and (and (and (and (and (and (and (and (and (and (and (= (type arg1@@32) RefType) (= (type arg3@@19) RefType)) (= (type arg5@@10) RefType)) (= (type arg7@@7) RefType)) (= (type arg9@@7) RefType)) (= (type arg10@@7) RefType)) (= (type arg11@@7) RefType)) (= (type arg13@@7) RefType)) (= (type arg15@@7) RefType)) (= (type arg17@@7) RefType)) (= (type arg19@@7) RefType)) (= (type arg20@@7) RefType)) (= (type arg21@@7) RefType)) (= (type arg23@@7) RefType)) (= (type arg24@@4) RefType)) (not (IsPredicateField (|wand_2#ft| arg1@@32 arg2@@24 arg3@@19 arg4@@10 arg5@@10 arg6@@8 arg7@@7 arg8@@7 arg9@@7 arg10@@7 arg11@@7 arg12@@7 arg13@@7 arg14@@7 arg15@@7 arg16@@7 arg17@@7 arg18@@7 arg19@@7 arg20@@7 arg21@@7 arg22@@7 arg23@@7 arg24@@4))))
 :qid |stdinbpl.259:15|
 :skolemid |39|
 :pattern ( (|wand_2#ft| arg1@@32 arg2@@24 arg3@@19 arg4@@10 arg5@@10 arg6@@8 arg7@@7 arg8@@7 arg9@@7 arg10@@7 arg11@@7 arg12@@7 arg13@@7 arg14@@7 arg15@@7 arg16@@7 arg17@@7 arg18@@7 arg19@@7 arg20@@7 arg21@@7 arg22@@7 arg23@@7 arg24@@4))
)))
(assert  (and (= (type dummyHeap) (MapType0Type RefType)) (= (type ZeroMask) (MapType1Type RefType realType))))
(assert (state dummyHeap ZeroMask))
(assert  (and (= (Ctor WandType_wand_4Type) 19) (forall ((arg0@@39 T@U) (arg1@@33 Int) (arg2@@25 Real) (arg3@@20 T@U) (arg4@@11 Int) (arg5@@11 Real) (arg6@@9 T@U) (arg7@@8 Int) (arg8@@8 Real) (arg9@@8 T@U) (arg10@@8 T@U) (arg11@@8 T@U) (arg12@@8 Int) (arg13@@8 Real) (arg14@@8 T@U) (arg15@@8 Int) ) (! (= (type (wand_4 arg0@@39 arg1@@33 arg2@@25 arg3@@20 arg4@@11 arg5@@11 arg6@@9 arg7@@8 arg8@@8 arg9@@8 arg10@@8 arg11@@8 arg12@@8 arg13@@8 arg14@@8 arg15@@8)) (FieldType WandType_wand_4Type intType))
 :qid |funType:wand_4|
 :pattern ( (wand_4 arg0@@39 arg1@@33 arg2@@25 arg3@@20 arg4@@11 arg5@@11 arg6@@9 arg7@@8 arg8@@8 arg9@@8 arg10@@8 arg11@@8 arg12@@8 arg13@@8 arg14@@8 arg15@@8))
))))
(assert (forall ((arg1@@34 T@U) (arg2@@26 Int) (arg3@@21 Real) (arg4@@12 T@U) (arg5@@12 Int) (arg6@@10 Real) (arg7@@9 T@U) (arg8@@9 Int) (arg9@@9 Real) (arg10@@9 T@U) (arg11@@9 T@U) (arg12@@9 T@U) (arg13@@9 Int) (arg14@@9 Real) (arg15@@9 T@U) (arg16@@8 Int) ) (!  (=> (and (and (and (and (and (and (= (type arg1@@34) RefType) (= (type arg4@@12) RefType)) (= (type arg7@@9) RefType)) (= (type arg10@@9) RefType)) (= (type arg11@@9) RefType)) (= (type arg12@@9) RefType)) (= (type arg15@@9) RefType)) (= (getPredWandId (wand_4 arg1@@34 arg2@@26 arg3@@21 arg4@@12 arg5@@12 arg6@@10 arg7@@9 arg8@@9 arg9@@9 arg10@@9 arg11@@9 arg12@@9 arg13@@9 arg14@@9 arg15@@9 arg16@@8)) 7))
 :qid |stdinbpl.299:15|
 :skolemid |48|
 :pattern ( (wand_4 arg1@@34 arg2@@26 arg3@@21 arg4@@12 arg5@@12 arg6@@10 arg7@@9 arg8@@9 arg9@@9 arg10@@9 arg11@@9 arg12@@9 arg13@@9 arg14@@9 arg15@@9 arg16@@8))
)))
(assert  (and (= (Ctor WandType_wand_1Type) 20) (forall ((arg0@@40 T@U) (arg1@@35 Real) (arg2@@27 T@U) (arg3@@22 Real) (arg4@@13 T@U) (arg5@@13 Int) (arg6@@11 T@U) (arg7@@10 Real) (arg8@@10 T@U) (arg9@@10 T@U) (arg10@@10 T@U) (arg11@@10 Real) (arg12@@10 T@U) (arg13@@10 Int) (arg14@@10 T@U) (arg15@@10 Real) ) (! (= (type (wand_1 arg0@@40 arg1@@35 arg2@@27 arg3@@22 arg4@@13 arg5@@13 arg6@@11 arg7@@10 arg8@@10 arg9@@10 arg10@@10 arg11@@10 arg12@@10 arg13@@10 arg14@@10 arg15@@10)) (FieldType WandType_wand_1Type intType))
 :qid |funType:wand_1|
 :pattern ( (wand_1 arg0@@40 arg1@@35 arg2@@27 arg3@@22 arg4@@13 arg5@@13 arg6@@11 arg7@@10 arg8@@10 arg9@@10 arg10@@10 arg11@@10 arg12@@10 arg13@@10 arg14@@10 arg15@@10))
))))
(assert (forall ((arg1@@36 T@U) (arg2@@28 Real) (arg3@@23 T@U) (arg4@@14 Real) (arg5@@14 T@U) (arg6@@12 Int) (arg7@@11 T@U) (arg8@@11 Real) (arg9@@11 T@U) (arg10@@11 T@U) (arg11@@11 T@U) (arg12@@11 Real) (arg13@@11 T@U) (arg14@@11 Int) (arg15@@11 T@U) (arg16@@9 Real) ) (!  (=> (and (and (and (and (and (and (and (and (= (type arg1@@36) RefType) (= (type arg3@@23) RefType)) (= (type arg5@@14) RefType)) (= (type arg7@@11) RefType)) (= (type arg9@@11) RefType)) (= (type arg10@@11) RefType)) (= (type arg11@@11) RefType)) (= (type arg13@@11) RefType)) (= (type arg15@@11) RefType)) (= (getPredWandId (wand_1 arg1@@36 arg2@@28 arg3@@23 arg4@@14 arg5@@14 arg6@@12 arg7@@11 arg8@@11 arg9@@11 arg10@@11 arg11@@11 arg12@@11 arg13@@11 arg14@@11 arg15@@11 arg16@@9)) 8))
 :qid |stdinbpl.331:15|
 :skolemid |55|
 :pattern ( (wand_1 arg1@@36 arg2@@28 arg3@@23 arg4@@14 arg5@@14 arg6@@12 arg7@@11 arg8@@11 arg9@@11 arg10@@11 arg11@@11 arg12@@11 arg13@@11 arg14@@11 arg15@@11 arg16@@9))
)))
(assert (forall ((p T@U) (v_1 T@U) (w T@U) ) (! (let ((A@@2 (FieldTypeInv0 (type p))))
 (=> (and (and (= (type p) (FieldType A@@2 FrameTypeType)) (= (type v_1) FrameTypeType)) (= (type w) FrameTypeType)) (not (InsidePredicate p v_1 p w))))
 :qid |stdinbpl.170:19|
 :skolemid |21|
 :pattern ( (InsidePredicate p v_1 p w))
)))
(assert (forall ((arg1@@37 T@U) (arg2@@29 Int) (arg3@@24 Real) (arg4@@15 T@U) (arg5@@15 Int) (arg6@@13 Real) (arg7@@12 T@U) (arg8@@12 Int) (arg9@@12 Real) (arg10@@12 T@U) (arg11@@12 T@U) (arg12@@12 T@U) (arg13@@12 Int) (arg14@@12 Real) (arg15@@12 T@U) (arg16@@10 Int) ) (!  (=> (and (and (and (and (and (and (= (type arg1@@37) RefType) (= (type arg4@@15) RefType)) (= (type arg7@@12) RefType)) (= (type arg10@@12) RefType)) (= (type arg11@@12) RefType)) (= (type arg12@@12) RefType)) (= (type arg15@@12) RefType)) (IsWandField (wand_4 arg1@@37 arg2@@29 arg3@@24 arg4@@15 arg5@@15 arg6@@13 arg7@@12 arg8@@12 arg9@@12 arg10@@12 arg11@@12 arg12@@12 arg13@@12 arg14@@12 arg15@@12 arg16@@10)))
 :qid |stdinbpl.279:15|
 :skolemid |43|
 :pattern ( (wand_4 arg1@@37 arg2@@29 arg3@@24 arg4@@15 arg5@@15 arg6@@13 arg7@@12 arg8@@12 arg9@@12 arg10@@12 arg11@@12 arg12@@12 arg13@@12 arg14@@12 arg15@@12 arg16@@10))
)))
(assert (forall ((arg0@@41 T@U) (arg1@@38 Int) (arg2@@30 Real) (arg3@@25 T@U) (arg4@@16 Int) (arg5@@16 Real) (arg6@@14 T@U) (arg7@@13 Int) (arg8@@13 Real) (arg9@@13 T@U) (arg10@@13 T@U) (arg11@@13 T@U) (arg12@@13 Int) (arg13@@13 Real) (arg14@@13 T@U) (arg15@@13 Int) ) (! (= (type (|wand_4#ft| arg0@@41 arg1@@38 arg2@@30 arg3@@25 arg4@@16 arg5@@16 arg6@@14 arg7@@13 arg8@@13 arg9@@13 arg10@@13 arg11@@13 arg12@@13 arg13@@13 arg14@@13 arg15@@13)) (FieldType WandType_wand_4Type FrameTypeType))
 :qid |funType:wand_4#ft|
 :pattern ( (|wand_4#ft| arg0@@41 arg1@@38 arg2@@30 arg3@@25 arg4@@16 arg5@@16 arg6@@14 arg7@@13 arg8@@13 arg9@@13 arg10@@13 arg11@@13 arg12@@13 arg13@@13 arg14@@13 arg15@@13))
)))
(assert (forall ((arg1@@39 T@U) (arg2@@31 Int) (arg3@@26 Real) (arg4@@17 T@U) (arg5@@17 Int) (arg6@@15 Real) (arg7@@14 T@U) (arg8@@14 Int) (arg9@@14 Real) (arg10@@14 T@U) (arg11@@14 T@U) (arg12@@14 T@U) (arg13@@14 Int) (arg14@@14 Real) (arg15@@14 T@U) (arg16@@11 Int) ) (!  (=> (and (and (and (and (and (and (= (type arg1@@39) RefType) (= (type arg4@@17) RefType)) (= (type arg7@@14) RefType)) (= (type arg10@@14) RefType)) (= (type arg11@@14) RefType)) (= (type arg12@@14) RefType)) (= (type arg15@@14) RefType)) (IsWandField (|wand_4#ft| arg1@@39 arg2@@31 arg3@@26 arg4@@17 arg5@@17 arg6@@15 arg7@@14 arg8@@14 arg9@@14 arg10@@14 arg11@@14 arg12@@14 arg13@@14 arg14@@14 arg15@@14 arg16@@11)))
 :qid |stdinbpl.283:15|
 :skolemid |44|
 :pattern ( (|wand_4#ft| arg1@@39 arg2@@31 arg3@@26 arg4@@17 arg5@@17 arg6@@15 arg7@@14 arg8@@14 arg9@@14 arg10@@14 arg11@@14 arg12@@14 arg13@@14 arg14@@14 arg15@@14 arg16@@11))
)))
(assert (forall ((arg1@@40 T@U) (arg2@@32 Real) (arg3@@27 T@U) (arg4@@18 Real) (arg5@@18 T@U) (arg6@@16 Int) (arg7@@15 T@U) (arg8@@15 Real) (arg9@@15 T@U) (arg10@@15 T@U) (arg11@@15 T@U) (arg12@@15 Real) (arg13@@15 T@U) (arg14@@15 Int) (arg15@@15 T@U) (arg16@@12 Real) ) (!  (=> (and (and (and (and (and (and (and (and (= (type arg1@@40) RefType) (= (type arg3@@27) RefType)) (= (type arg5@@18) RefType)) (= (type arg7@@15) RefType)) (= (type arg9@@15) RefType)) (= (type arg10@@15) RefType)) (= (type arg11@@15) RefType)) (= (type arg13@@15) RefType)) (= (type arg15@@15) RefType)) (IsWandField (wand_1 arg1@@40 arg2@@32 arg3@@27 arg4@@18 arg5@@18 arg6@@16 arg7@@15 arg8@@15 arg9@@15 arg10@@15 arg11@@15 arg12@@15 arg13@@15 arg14@@15 arg15@@15 arg16@@12)))
 :qid |stdinbpl.311:15|
 :skolemid |50|
 :pattern ( (wand_1 arg1@@40 arg2@@32 arg3@@27 arg4@@18 arg5@@18 arg6@@16 arg7@@15 arg8@@15 arg9@@15 arg10@@15 arg11@@15 arg12@@15 arg13@@15 arg14@@15 arg15@@15 arg16@@12))
)))
(assert (forall ((arg0@@42 T@U) (arg1@@41 Real) (arg2@@33 T@U) (arg3@@28 Real) (arg4@@19 T@U) (arg5@@19 Int) (arg6@@17 T@U) (arg7@@16 Real) (arg8@@16 T@U) (arg9@@16 T@U) (arg10@@16 T@U) (arg11@@16 Real) (arg12@@16 T@U) (arg13@@16 Int) (arg14@@16 T@U) (arg15@@16 Real) ) (! (= (type (|wand_1#ft| arg0@@42 arg1@@41 arg2@@33 arg3@@28 arg4@@19 arg5@@19 arg6@@17 arg7@@16 arg8@@16 arg9@@16 arg10@@16 arg11@@16 arg12@@16 arg13@@16 arg14@@16 arg15@@16)) (FieldType WandType_wand_1Type FrameTypeType))
 :qid |funType:wand_1#ft|
 :pattern ( (|wand_1#ft| arg0@@42 arg1@@41 arg2@@33 arg3@@28 arg4@@19 arg5@@19 arg6@@17 arg7@@16 arg8@@16 arg9@@16 arg10@@16 arg11@@16 arg12@@16 arg13@@16 arg14@@16 arg15@@16))
)))
(assert (forall ((arg1@@42 T@U) (arg2@@34 Real) (arg3@@29 T@U) (arg4@@20 Real) (arg5@@20 T@U) (arg6@@18 Int) (arg7@@17 T@U) (arg8@@17 Real) (arg9@@17 T@U) (arg10@@17 T@U) (arg11@@17 T@U) (arg12@@17 Real) (arg13@@17 T@U) (arg14@@17 Int) (arg15@@17 T@U) (arg16@@13 Real) ) (!  (=> (and (and (and (and (and (and (and (and (= (type arg1@@42) RefType) (= (type arg3@@29) RefType)) (= (type arg5@@20) RefType)) (= (type arg7@@17) RefType)) (= (type arg9@@17) RefType)) (= (type arg10@@17) RefType)) (= (type arg11@@17) RefType)) (= (type arg13@@17) RefType)) (= (type arg15@@17) RefType)) (IsWandField (|wand_1#ft| arg1@@42 arg2@@34 arg3@@29 arg4@@20 arg5@@20 arg6@@18 arg7@@17 arg8@@17 arg9@@17 arg10@@17 arg11@@17 arg12@@17 arg13@@17 arg14@@17 arg15@@17 arg16@@13)))
 :qid |stdinbpl.315:15|
 :skolemid |51|
 :pattern ( (|wand_1#ft| arg1@@42 arg2@@34 arg3@@29 arg4@@20 arg5@@20 arg6@@18 arg7@@17 arg8@@17 arg9@@17 arg10@@17 arg11@@17 arg12@@17 arg13@@17 arg14@@17 arg15@@17 arg16@@13))
)))
(assert  (not (IsPredicateField val)))
(assert  (not (IsWandField val)))
(assert  (not (IsPredicateField next)))
(assert  (not (IsWandField next)))
(assert (forall ((Heap@@7 T@U) (ExhaleHeap@@3 T@U) (Mask@@4 T@U) ) (!  (=> (and (and (and (= (type Heap@@7) (MapType0Type RefType)) (= (type ExhaleHeap@@3) (MapType0Type RefType))) (= (type Mask@@4) (MapType1Type RefType realType))) (IdenticalOnKnownLocations Heap@@7 ExhaleHeap@@3 Mask@@4)) (succHeap Heap@@7 ExhaleHeap@@3))
 :qid |stdinbpl.83:15|
 :skolemid |10|
 :pattern ( (IdenticalOnKnownLocations Heap@@7 ExhaleHeap@@3 Mask@@4))
)))
(assert (forall ((arg1@@43 T@U) (arg2@@35 Int) (arg3@@30 Real) (arg4@@21 T@U) (arg5@@21 Int) (arg6@@19 Real) (arg7@@18 T@U) (arg8@@18 Int) (arg9@@18 Real) (arg10@@18 T@U) (arg11@@18 T@U) (arg12@@18 T@U) (arg13@@18 Int) (arg14@@18 Real) (arg15@@18 T@U) (arg16@@14 Int) ) (!  (=> (and (and (and (and (and (and (= (type arg1@@43) RefType) (= (type arg4@@21) RefType)) (= (type arg7@@18) RefType)) (= (type arg10@@18) RefType)) (= (type arg11@@18) RefType)) (= (type arg12@@18) RefType)) (= (type arg15@@18) RefType)) (not (IsPredicateField (wand_4 arg1@@43 arg2@@35 arg3@@30 arg4@@21 arg5@@21 arg6@@19 arg7@@18 arg8@@18 arg9@@18 arg10@@18 arg11@@18 arg12@@18 arg13@@18 arg14@@18 arg15@@18 arg16@@14))))
 :qid |stdinbpl.287:15|
 :skolemid |45|
 :pattern ( (wand_4 arg1@@43 arg2@@35 arg3@@30 arg4@@21 arg5@@21 arg6@@19 arg7@@18 arg8@@18 arg9@@18 arg10@@18 arg11@@18 arg12@@18 arg13@@18 arg14@@18 arg15@@18 arg16@@14))
)))
(assert (forall ((arg1@@44 T@U) (arg2@@36 Int) (arg3@@31 Real) (arg4@@22 T@U) (arg5@@22 Int) (arg6@@20 Real) (arg7@@19 T@U) (arg8@@19 Int) (arg9@@19 Real) (arg10@@19 T@U) (arg11@@19 T@U) (arg12@@19 T@U) (arg13@@19 Int) (arg14@@19 Real) (arg15@@19 T@U) (arg16@@15 Int) ) (!  (=> (and (and (and (and (and (and (= (type arg1@@44) RefType) (= (type arg4@@22) RefType)) (= (type arg7@@19) RefType)) (= (type arg10@@19) RefType)) (= (type arg11@@19) RefType)) (= (type arg12@@19) RefType)) (= (type arg15@@19) RefType)) (not (IsPredicateField (|wand_4#ft| arg1@@44 arg2@@36 arg3@@31 arg4@@22 arg5@@22 arg6@@20 arg7@@19 arg8@@19 arg9@@19 arg10@@19 arg11@@19 arg12@@19 arg13@@19 arg14@@19 arg15@@19 arg16@@15))))
 :qid |stdinbpl.291:15|
 :skolemid |46|
 :pattern ( (|wand_4#ft| arg1@@44 arg2@@36 arg3@@31 arg4@@22 arg5@@22 arg6@@20 arg7@@19 arg8@@19 arg9@@19 arg10@@19 arg11@@19 arg12@@19 arg13@@19 arg14@@19 arg15@@19 arg16@@15))
)))
(assert (forall ((arg1@@45 T@U) (arg2@@37 Real) (arg3@@32 T@U) (arg4@@23 Real) (arg5@@23 T@U) (arg6@@21 Int) (arg7@@20 T@U) (arg8@@20 Real) (arg9@@20 T@U) (arg10@@20 T@U) (arg11@@20 T@U) (arg12@@20 Real) (arg13@@20 T@U) (arg14@@20 Int) (arg15@@20 T@U) (arg16@@16 Real) ) (!  (=> (and (and (and (and (and (and (and (and (= (type arg1@@45) RefType) (= (type arg3@@32) RefType)) (= (type arg5@@23) RefType)) (= (type arg7@@20) RefType)) (= (type arg9@@20) RefType)) (= (type arg10@@20) RefType)) (= (type arg11@@20) RefType)) (= (type arg13@@20) RefType)) (= (type arg15@@20) RefType)) (not (IsPredicateField (wand_1 arg1@@45 arg2@@37 arg3@@32 arg4@@23 arg5@@23 arg6@@21 arg7@@20 arg8@@20 arg9@@20 arg10@@20 arg11@@20 arg12@@20 arg13@@20 arg14@@20 arg15@@20 arg16@@16))))
 :qid |stdinbpl.319:15|
 :skolemid |52|
 :pattern ( (wand_1 arg1@@45 arg2@@37 arg3@@32 arg4@@23 arg5@@23 arg6@@21 arg7@@20 arg8@@20 arg9@@20 arg10@@20 arg11@@20 arg12@@20 arg13@@20 arg14@@20 arg15@@20 arg16@@16))
)))
(assert (forall ((arg1@@46 T@U) (arg2@@38 Real) (arg3@@33 T@U) (arg4@@24 Real) (arg5@@24 T@U) (arg6@@22 Int) (arg7@@21 T@U) (arg8@@21 Real) (arg9@@21 T@U) (arg10@@21 T@U) (arg11@@21 T@U) (arg12@@21 Real) (arg13@@21 T@U) (arg14@@21 Int) (arg15@@21 T@U) (arg16@@17 Real) ) (!  (=> (and (and (and (and (and (and (and (and (= (type arg1@@46) RefType) (= (type arg3@@33) RefType)) (= (type arg5@@24) RefType)) (= (type arg7@@21) RefType)) (= (type arg9@@21) RefType)) (= (type arg10@@21) RefType)) (= (type arg11@@21) RefType)) (= (type arg13@@21) RefType)) (= (type arg15@@21) RefType)) (not (IsPredicateField (|wand_1#ft| arg1@@46 arg2@@38 arg3@@33 arg4@@24 arg5@@24 arg6@@22 arg7@@21 arg8@@21 arg9@@21 arg10@@21 arg11@@21 arg12@@21 arg13@@21 arg14@@21 arg15@@21 arg16@@17))))
 :qid |stdinbpl.323:15|
 :skolemid |53|
 :pattern ( (|wand_1#ft| arg1@@46 arg2@@38 arg3@@33 arg4@@24 arg5@@24 arg6@@22 arg7@@21 arg8@@21 arg9@@21 arg10@@21 arg11@@21 arg12@@21 arg13@@21 arg14@@21 arg15@@21 arg16@@17))
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
(assert  (and (forall ((arg0@@43 Real) (arg1@@47 T@U) ) (! (= (type (ConditionalFrame arg0@@43 arg1@@47)) FrameTypeType)
 :qid |funType:ConditionalFrame|
 :pattern ( (ConditionalFrame arg0@@43 arg1@@47))
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
(assert (forall ((arg1@@48 T@U) (arg2@@39 Int) (arg3@@34 Real) (arg4@@25 T@U) (arg5@@25 Int) (arg6@@23 Real) (arg7@@22 T@U) (arg8@@22 Int) (arg9@@22 Real) (arg10@@22 T@U) (arg11@@22 T@U) (arg12@@22 T@U) (arg13@@22 Int) (arg14@@22 Real) (arg15@@22 T@U) (arg16@@18 Int) (arg1_2@@1 T@U) (arg2_2@@1 Int) (arg3_2@@1 Real) (arg4_2@@0 T@U) (arg5_2@@0 Int) (arg6_2@@0 Real) (arg7_2@@0 T@U) (arg8_2@@0 Int) (arg9_2@@0 Real) (arg10_2@@0 T@U) (arg11_2@@0 T@U) (arg12_2@@0 T@U) (arg13_2@@0 Int) (arg14_2@@0 Real) (arg15_2@@0 T@U) (arg16_2@@0 Int) ) (!  (=> (and (and (and (and (and (and (and (and (and (and (and (and (and (and (= (type arg1@@48) RefType) (= (type arg4@@25) RefType)) (= (type arg7@@22) RefType)) (= (type arg10@@22) RefType)) (= (type arg11@@22) RefType)) (= (type arg12@@22) RefType)) (= (type arg15@@22) RefType)) (= (type arg1_2@@1) RefType)) (= (type arg4_2@@0) RefType)) (= (type arg7_2@@0) RefType)) (= (type arg10_2@@0) RefType)) (= (type arg11_2@@0) RefType)) (= (type arg12_2@@0) RefType)) (= (type arg15_2@@0) RefType)) (= (wand_4 arg1@@48 arg2@@39 arg3@@34 arg4@@25 arg5@@25 arg6@@23 arg7@@22 arg8@@22 arg9@@22 arg10@@22 arg11@@22 arg12@@22 arg13@@22 arg14@@22 arg15@@22 arg16@@18) (wand_4 arg1_2@@1 arg2_2@@1 arg3_2@@1 arg4_2@@0 arg5_2@@0 arg6_2@@0 arg7_2@@0 arg8_2@@0 arg9_2@@0 arg10_2@@0 arg11_2@@0 arg12_2@@0 arg13_2@@0 arg14_2@@0 arg15_2@@0 arg16_2@@0))) (and (= arg1@@48 arg1_2@@1) (and (= arg2@@39 arg2_2@@1) (and (= arg3@@34 arg3_2@@1) (and (= arg4@@25 arg4_2@@0) (and (= arg5@@25 arg5_2@@0) (and (= arg6@@23 arg6_2@@0) (and (= arg7@@22 arg7_2@@0) (and (= arg8@@22 arg8_2@@0) (and (= arg9@@22 arg9_2@@0) (and (= arg10@@22 arg10_2@@0) (and (= arg11@@22 arg11_2@@0) (and (= arg12@@22 arg12_2@@0) (and (= arg13@@22 arg13_2@@0) (and (= arg14@@22 arg14_2@@0) (and (= arg15@@22 arg15_2@@0) (= arg16@@18 arg16_2@@0)))))))))))))))))
 :qid |stdinbpl.303:15|
 :skolemid |49|
 :pattern ( (wand_4 arg1@@48 arg2@@39 arg3@@34 arg4@@25 arg5@@25 arg6@@23 arg7@@22 arg8@@22 arg9@@22 arg10@@22 arg11@@22 arg12@@22 arg13@@22 arg14@@22 arg15@@22 arg16@@18) (wand_4 arg1_2@@1 arg2_2@@1 arg3_2@@1 arg4_2@@0 arg5_2@@0 arg6_2@@0 arg7_2@@0 arg8_2@@0 arg9_2@@0 arg10_2@@0 arg11_2@@0 arg12_2@@0 arg13_2@@0 arg14_2@@0 arg15_2@@0 arg16_2@@0))
)))
(assert (forall ((arg1@@49 T@U) (arg2@@40 Real) (arg3@@35 T@U) (arg4@@26 Real) (arg5@@26 T@U) (arg6@@24 Int) (arg7@@23 T@U) (arg8@@23 Real) (arg9@@23 T@U) (arg10@@23 T@U) (arg11@@23 T@U) (arg12@@23 Real) (arg13@@23 T@U) (arg14@@23 Int) (arg15@@23 T@U) (arg16@@19 Real) (arg1_2@@2 T@U) (arg2_2@@2 Real) (arg3_2@@2 T@U) (arg4_2@@1 Real) (arg5_2@@1 T@U) (arg6_2@@1 Int) (arg7_2@@1 T@U) (arg8_2@@1 Real) (arg9_2@@1 T@U) (arg10_2@@1 T@U) (arg11_2@@1 T@U) (arg12_2@@1 Real) (arg13_2@@1 T@U) (arg14_2@@1 Int) (arg15_2@@1 T@U) (arg16_2@@1 Real) ) (!  (=> (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (= (type arg1@@49) RefType) (= (type arg3@@35) RefType)) (= (type arg5@@26) RefType)) (= (type arg7@@23) RefType)) (= (type arg9@@23) RefType)) (= (type arg10@@23) RefType)) (= (type arg11@@23) RefType)) (= (type arg13@@23) RefType)) (= (type arg15@@23) RefType)) (= (type arg1_2@@2) RefType)) (= (type arg3_2@@2) RefType)) (= (type arg5_2@@1) RefType)) (= (type arg7_2@@1) RefType)) (= (type arg9_2@@1) RefType)) (= (type arg10_2@@1) RefType)) (= (type arg11_2@@1) RefType)) (= (type arg13_2@@1) RefType)) (= (type arg15_2@@1) RefType)) (= (wand_1 arg1@@49 arg2@@40 arg3@@35 arg4@@26 arg5@@26 arg6@@24 arg7@@23 arg8@@23 arg9@@23 arg10@@23 arg11@@23 arg12@@23 arg13@@23 arg14@@23 arg15@@23 arg16@@19) (wand_1 arg1_2@@2 arg2_2@@2 arg3_2@@2 arg4_2@@1 arg5_2@@1 arg6_2@@1 arg7_2@@1 arg8_2@@1 arg9_2@@1 arg10_2@@1 arg11_2@@1 arg12_2@@1 arg13_2@@1 arg14_2@@1 arg15_2@@1 arg16_2@@1))) (and (= arg1@@49 arg1_2@@2) (and (= arg2@@40 arg2_2@@2) (and (= arg3@@35 arg3_2@@2) (and (= arg4@@26 arg4_2@@1) (and (= arg5@@26 arg5_2@@1) (and (= arg6@@24 arg6_2@@1) (and (= arg7@@23 arg7_2@@1) (and (= arg8@@23 arg8_2@@1) (and (= arg9@@23 arg9_2@@1) (and (= arg10@@23 arg10_2@@1) (and (= arg11@@23 arg11_2@@1) (and (= arg12@@23 arg12_2@@1) (and (= arg13@@23 arg13_2@@1) (and (= arg14@@23 arg14_2@@1) (and (= arg15@@23 arg15_2@@1) (= arg16@@19 arg16_2@@1)))))))))))))))))
 :qid |stdinbpl.335:15|
 :skolemid |56|
 :pattern ( (wand_1 arg1@@49 arg2@@40 arg3@@35 arg4@@26 arg5@@26 arg6@@24 arg7@@23 arg8@@23 arg9@@23 arg10@@23 arg11@@23 arg12@@23 arg13@@23 arg14@@23 arg15@@23 arg16@@19) (wand_1 arg1_2@@2 arg2_2@@2 arg3_2@@2 arg4_2@@1 arg5_2@@1 arg6_2@@1 arg7_2@@1 arg8_2@@1 arg9_2@@1 arg10_2@@1 arg11_2@@1 arg12_2@@1 arg13_2@@1 arg14_2@@1 arg15_2@@1 arg16_2@@1))
)))
(assert (forall ((arg0@@44 Bool) (arg1@@50 Real) (arg2@@41 Bool) (arg3@@36 Real) (arg4@@27 Bool) (arg5@@27 Bool) ) (! (= (type (wand arg0@@44 arg1@@50 arg2@@41 arg3@@36 arg4@@27 arg5@@27)) (FieldType WandType_wandType intType))
 :qid |funType:wand|
 :pattern ( (wand arg0@@44 arg1@@50 arg2@@41 arg3@@36 arg4@@27 arg5@@27))
)))
(assert (forall ((arg1@@51 Bool) (arg2@@42 Real) (arg3@@37 Bool) (arg4@@28 Real) (arg5@@28 Bool) (arg6@@25 Bool) ) (! (= (getPredWandId (wand arg1@@51 arg2@@42 arg3@@37 arg4@@28 arg5@@28 arg6@@25)) 4)
 :qid |stdinbpl.203:15|
 :skolemid |27|
 :pattern ( (wand arg1@@51 arg2@@42 arg3@@37 arg4@@28 arg5@@28 arg6@@25))
)))
(assert (forall ((o_2@@1 T@U) (f_4@@1 T@U) ) (! (let ((B@@4 (FieldTypeInv1 (type f_4@@1))))
(let ((A@@5 (FieldTypeInv0 (type f_4@@1))))
 (=> (and (= (type o_2@@1) RefType) (= (type f_4@@1) (FieldType A@@5 B@@4))) (= (U_2_real (MapType1Select ZeroMask o_2@@1 f_4@@1)) NoPerm))))
 :qid |stdinbpl.106:22|
 :skolemid |13|
 :pattern ( (MapType1Select ZeroMask o_2@@1 f_4@@1))
)))
(assert (forall ((arg1@@52 Bool) (arg2@@43 Real) (arg3@@38 Bool) (arg4@@29 Real) (arg5@@29 Bool) (arg6@@26 Bool) ) (! (IsWandField (wand arg1@@52 arg2@@43 arg3@@38 arg4@@29 arg5@@29 arg6@@26))
 :qid |stdinbpl.183:15|
 :skolemid |22|
 :pattern ( (wand arg1@@52 arg2@@43 arg3@@38 arg4@@29 arg5@@29 arg6@@26))
)))
(assert (forall ((arg1@@53 Bool) (arg2@@44 Real) (arg3@@39 Bool) (arg4@@30 Real) (arg5@@30 Bool) (arg6@@27 Bool) ) (! (IsWandField (|wand#ft| arg1@@53 arg2@@44 arg3@@39 arg4@@30 arg5@@30 arg6@@27))
 :qid |stdinbpl.187:15|
 :skolemid |23|
 :pattern ( (|wand#ft| arg1@@53 arg2@@44 arg3@@39 arg4@@30 arg5@@30 arg6@@27))
)))
(assert (forall ((arg1@@54 Bool) (arg2@@45 Real) (arg3@@40 Bool) (arg4@@31 Real) (arg5@@31 Bool) (arg6@@28 Bool) ) (!  (not (IsPredicateField (wand arg1@@54 arg2@@45 arg3@@40 arg4@@31 arg5@@31 arg6@@28)))
 :qid |stdinbpl.191:15|
 :skolemid |24|
 :pattern ( (wand arg1@@54 arg2@@45 arg3@@40 arg4@@31 arg5@@31 arg6@@28))
)))
(assert (forall ((arg1@@55 Bool) (arg2@@46 Real) (arg3@@41 Bool) (arg4@@32 Real) (arg5@@32 Bool) (arg6@@29 Bool) ) (!  (not (IsPredicateField (|wand#ft| arg1@@55 arg2@@46 arg3@@41 arg4@@32 arg5@@32 arg6@@29)))
 :qid |stdinbpl.195:15|
 :skolemid |25|
 :pattern ( (|wand#ft| arg1@@55 arg2@@46 arg3@@41 arg4@@32 arg5@@32 arg6@@29))
)))
(assert (forall ((x@@16 T@U) (i@@3 Int) ) (!  (=> (= (type x@@16) RefType) (= (getPredWandId (LLC x@@16 i@@3)) 3))
 :qid |stdinbpl.507:15|
 :skolemid |72|
 :pattern ( (LLC x@@16 i@@3))
)))
(assert (forall ((Heap@@8 T@U) (ExhaleHeap@@4 T@U) (Mask@@6 T@U) (pm_f@@1 T@U) ) (! (let ((C@@1 (FieldTypeInv0 (type pm_f@@1))))
 (=> (and (and (and (and (and (= (type Heap@@8) (MapType0Type RefType)) (= (type ExhaleHeap@@4) (MapType0Type RefType))) (= (type Mask@@6) (MapType1Type RefType realType))) (= (type pm_f@@1) (FieldType C@@1 FrameTypeType))) (IdenticalOnKnownLocations Heap@@8 ExhaleHeap@@4 Mask@@6)) (and (HasDirectPerm Mask@@6 null pm_f@@1) (IsPredicateField pm_f@@1))) (forall ((o2 T@U) (f_2@@0 T@U) ) (! (let ((B@@5 (FieldTypeInv1 (type f_2@@0))))
(let ((A@@6 (FieldTypeInv0 (type f_2@@0))))
 (=> (and (and (= (type o2) RefType) (= (type f_2@@0) (FieldType A@@6 B@@5))) (U_2_bool (MapType1Select (MapType0Select Heap@@8 null (PredicateMaskField pm_f@@1)) o2 f_2@@0))) (= (MapType0Select Heap@@8 o2 f_2@@0) (MapType0Select ExhaleHeap@@4 o2 f_2@@0)))))
 :qid |stdinbpl.54:134|
 :skolemid |3|
 :pattern ( (MapType0Select ExhaleHeap@@4 o2 f_2@@0))
))))
 :qid |stdinbpl.52:19|
 :skolemid |4|
 :pattern ( (IdenticalOnKnownLocations Heap@@8 ExhaleHeap@@4 Mask@@6) (IsPredicateField pm_f@@1))
)))
(assert (forall ((Heap@@9 T@U) (ExhaleHeap@@5 T@U) (Mask@@7 T@U) (pm_f@@2 T@U) ) (! (let ((C@@2 (FieldTypeInv0 (type pm_f@@2))))
 (=> (and (and (and (and (and (= (type Heap@@9) (MapType0Type RefType)) (= (type ExhaleHeap@@5) (MapType0Type RefType))) (= (type Mask@@7) (MapType1Type RefType realType))) (= (type pm_f@@2) (FieldType C@@2 FrameTypeType))) (IdenticalOnKnownLocations Heap@@9 ExhaleHeap@@5 Mask@@7)) (and (HasDirectPerm Mask@@7 null pm_f@@2) (IsWandField pm_f@@2))) (forall ((o2@@0 T@U) (f_2@@1 T@U) ) (! (let ((B@@6 (FieldTypeInv1 (type f_2@@1))))
(let ((A@@7 (FieldTypeInv0 (type f_2@@1))))
 (=> (and (and (= (type o2@@0) RefType) (= (type f_2@@1) (FieldType A@@7 B@@6))) (U_2_bool (MapType1Select (MapType0Select Heap@@9 null (WandMaskField pm_f@@2)) o2@@0 f_2@@1))) (= (MapType0Select Heap@@9 o2@@0 f_2@@1) (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1)))))
 :qid |stdinbpl.67:129|
 :skolemid |6|
 :pattern ( (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1))
))))
 :qid |stdinbpl.65:19|
 :skolemid |7|
 :pattern ( (IdenticalOnKnownLocations Heap@@9 ExhaleHeap@@5 Mask@@7) (IsWandField pm_f@@2))
)))
(assert (forall ((b_2@@3 Bool) ) (! (= (getPredWandId (Q b_2@@3)) 1)
 :qid |stdinbpl.384:15|
 :skolemid |60|
 :pattern ( (Q b_2@@3))
)))
(assert (forall ((x@@17 T@U) ) (!  (=> (= (type x@@17) RefType) (= (getPredWandId (LL x@@17)) 2))
 :qid |stdinbpl.437:15|
 :skolemid |66|
 :pattern ( (LL x@@17))
)))
(assert (forall ((Mask@@8 T@U) (o_2@@2 T@U) (f_4@@2 T@U) ) (! (let ((B@@7 (FieldTypeInv1 (type f_4@@2))))
(let ((A@@8 (FieldTypeInv0 (type f_4@@2))))
 (=> (and (and (and (= (type Mask@@8) (MapType1Type RefType realType)) (= (type o_2@@2) RefType)) (= (type f_4@@2) (FieldType A@@8 B@@7))) (GoodMask Mask@@8)) (and (>= (U_2_real (MapType1Select Mask@@8 o_2@@2 f_4@@2)) NoPerm) (=> (and (and (GoodMask Mask@@8) (not (IsPredicateField f_4@@2))) (not (IsWandField f_4@@2))) (<= (U_2_real (MapType1Select Mask@@8 o_2@@2 f_4@@2)) FullPerm))))))
 :qid |stdinbpl.128:22|
 :skolemid |16|
 :pattern ( (GoodMask Mask@@8) (MapType1Select Mask@@8 o_2@@2 f_4@@2))
)))
(assert (forall ((Heap@@10 T@U) ) (!  (=> (= (type Heap@@10) (MapType0Type RefType)) (|P#everUsed| P))
 :qid |stdinbpl.364:15|
 :skolemid |57|
 :pattern ( (|P#trigger| Heap@@10 P))
)))
(assert (forall ((o T@U) (f T@U) (Heap@@11 T@U) ) (!  (=> (and (and (and (= (type o) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap@@11) (MapType0Type RefType))) (U_2_bool (MapType0Select Heap@@11 o $allocated))) (U_2_bool (MapType0Select Heap@@11 (MapType0Select Heap@@11 o f) $allocated)))
 :qid |stdinbpl.31:15|
 :skolemid |0|
 :pattern ( (MapType0Select Heap@@11 o f))
)))
(assert (forall ((x@@18 T@U) (i@@4 Int) ) (!  (=> (= (type x@@18) RefType) (= (PredicateMaskField (LLC x@@18 i@@4)) (|LLC#sm| x@@18 i@@4)))
 :qid |stdinbpl.499:15|
 :skolemid |70|
 :pattern ( (PredicateMaskField (LLC x@@18 i@@4)))
)))
(assert (forall ((arg0@@45 T@U) (arg1@@56 Int) (arg2@@47 Real) (arg3@@42 T@U) (arg4@@33 Int) (arg5@@33 Real) (arg6@@30 T@U) (arg7@@24 Int) (arg8@@24 Real) (arg9@@24 T@U) (arg10@@24 T@U) (arg11@@24 T@U) (arg12@@24 Int) (arg13@@24 Real) (arg14@@24 T@U) (arg15@@24 Int) ) (! (= (type (|wand_4#sm| arg0@@45 arg1@@56 arg2@@47 arg3@@42 arg4@@33 arg5@@33 arg6@@30 arg7@@24 arg8@@24 arg9@@24 arg10@@24 arg11@@24 arg12@@24 arg13@@24 arg14@@24 arg15@@24)) (FieldType WandType_wand_4Type (MapType1Type RefType boolType)))
 :qid |funType:wand_4#sm|
 :pattern ( (|wand_4#sm| arg0@@45 arg1@@56 arg2@@47 arg3@@42 arg4@@33 arg5@@33 arg6@@30 arg7@@24 arg8@@24 arg9@@24 arg10@@24 arg11@@24 arg12@@24 arg13@@24 arg14@@24 arg15@@24))
)))
(assert (forall ((arg1@@57 T@U) (arg2@@48 Int) (arg3@@43 Real) (arg4@@34 T@U) (arg5@@34 Int) (arg6@@31 Real) (arg7@@25 T@U) (arg8@@25 Int) (arg9@@25 Real) (arg10@@25 T@U) (arg11@@25 T@U) (arg12@@25 T@U) (arg13@@25 Int) (arg14@@25 Real) (arg15@@25 T@U) (arg16@@20 Int) ) (!  (=> (and (and (and (and (and (and (= (type arg1@@57) RefType) (= (type arg4@@34) RefType)) (= (type arg7@@25) RefType)) (= (type arg10@@25) RefType)) (= (type arg11@@25) RefType)) (= (type arg12@@25) RefType)) (= (type arg15@@25) RefType)) (= (|wand_4#sm| arg1@@57 arg2@@48 arg3@@43 arg4@@34 arg5@@34 arg6@@31 arg7@@25 arg8@@25 arg9@@25 arg10@@25 arg11@@25 arg12@@25 arg13@@25 arg14@@25 arg15@@25 arg16@@20) (WandMaskField (|wand_4#ft| arg1@@57 arg2@@48 arg3@@43 arg4@@34 arg5@@34 arg6@@31 arg7@@25 arg8@@25 arg9@@25 arg10@@25 arg11@@25 arg12@@25 arg13@@25 arg14@@25 arg15@@25 arg16@@20))))
 :qid |stdinbpl.295:15|
 :skolemid |47|
 :pattern ( (WandMaskField (|wand_4#ft| arg1@@57 arg2@@48 arg3@@43 arg4@@34 arg5@@34 arg6@@31 arg7@@25 arg8@@25 arg9@@25 arg10@@25 arg11@@25 arg12@@25 arg13@@25 arg14@@25 arg15@@25 arg16@@20)))
)))
(assert (forall ((arg0@@46 T@U) (arg1@@58 Real) (arg2@@49 T@U) (arg3@@44 Real) (arg4@@35 T@U) (arg5@@35 Int) (arg6@@32 T@U) (arg7@@26 Real) (arg8@@26 T@U) (arg9@@26 T@U) (arg10@@26 T@U) (arg11@@26 Real) (arg12@@26 T@U) (arg13@@26 Int) (arg14@@26 T@U) (arg15@@26 Real) ) (! (= (type (|wand_1#sm| arg0@@46 arg1@@58 arg2@@49 arg3@@44 arg4@@35 arg5@@35 arg6@@32 arg7@@26 arg8@@26 arg9@@26 arg10@@26 arg11@@26 arg12@@26 arg13@@26 arg14@@26 arg15@@26)) (FieldType WandType_wand_1Type (MapType1Type RefType boolType)))
 :qid |funType:wand_1#sm|
 :pattern ( (|wand_1#sm| arg0@@46 arg1@@58 arg2@@49 arg3@@44 arg4@@35 arg5@@35 arg6@@32 arg7@@26 arg8@@26 arg9@@26 arg10@@26 arg11@@26 arg12@@26 arg13@@26 arg14@@26 arg15@@26))
)))
(assert (forall ((arg1@@59 T@U) (arg2@@50 Real) (arg3@@45 T@U) (arg4@@36 Real) (arg5@@36 T@U) (arg6@@33 Int) (arg7@@27 T@U) (arg8@@27 Real) (arg9@@27 T@U) (arg10@@27 T@U) (arg11@@27 T@U) (arg12@@27 Real) (arg13@@27 T@U) (arg14@@27 Int) (arg15@@27 T@U) (arg16@@21 Real) ) (!  (=> (and (and (and (and (and (and (and (and (= (type arg1@@59) RefType) (= (type arg3@@45) RefType)) (= (type arg5@@36) RefType)) (= (type arg7@@27) RefType)) (= (type arg9@@27) RefType)) (= (type arg10@@27) RefType)) (= (type arg11@@27) RefType)) (= (type arg13@@27) RefType)) (= (type arg15@@27) RefType)) (= (|wand_1#sm| arg1@@59 arg2@@50 arg3@@45 arg4@@36 arg5@@36 arg6@@33 arg7@@27 arg8@@27 arg9@@27 arg10@@27 arg11@@27 arg12@@27 arg13@@27 arg14@@27 arg15@@27 arg16@@21) (WandMaskField (|wand_1#ft| arg1@@59 arg2@@50 arg3@@45 arg4@@36 arg5@@36 arg6@@33 arg7@@27 arg8@@27 arg9@@27 arg10@@27 arg11@@27 arg12@@27 arg13@@27 arg14@@27 arg15@@27 arg16@@21))))
 :qid |stdinbpl.327:15|
 :skolemid |54|
 :pattern ( (WandMaskField (|wand_1#ft| arg1@@59 arg2@@50 arg3@@45 arg4@@36 arg5@@36 arg6@@33 arg7@@27 arg8@@27 arg9@@27 arg10@@27 arg11@@27 arg12@@27 arg13@@27 arg14@@27 arg15@@27 arg16@@21)))
)))
(assert (forall ((arg1@@60 Bool) (arg2@@51 Real) (arg3@@46 Bool) (arg4@@37 Real) (arg5@@37 Bool) (arg6@@34 Bool) (arg1_2@@3 Bool) (arg2_2@@3 Real) (arg3_2@@3 Bool) (arg4_2@@2 Real) (arg5_2@@2 Bool) (arg6_2@@2 Bool) ) (!  (=> (= (wand arg1@@60 arg2@@51 arg3@@46 arg4@@37 arg5@@37 arg6@@34) (wand arg1_2@@3 arg2_2@@3 arg3_2@@3 arg4_2@@2 arg5_2@@2 arg6_2@@2)) (and (= arg1@@60 arg1_2@@3) (and (= arg2@@51 arg2_2@@3) (and (= arg3@@46 arg3_2@@3) (and (= arg4@@37 arg4_2@@2) (and (= arg5@@37 arg5_2@@2) (= arg6@@34 arg6_2@@2)))))))
 :qid |stdinbpl.207:15|
 :skolemid |28|
 :pattern ( (wand arg1@@60 arg2@@51 arg3@@46 arg4@@37 arg5@@37 arg6@@34) (wand arg1_2@@3 arg2_2@@3 arg3_2@@3 arg4_2@@2 arg5_2@@2 arg6_2@@2))
)))
(assert (forall ((arg1@@61 T@U) (arg2@@52 Real) (arg3@@47 T@U) (arg4@@38 Real) (arg5@@38 T@U) (arg6@@35 Int) (arg7@@28 T@U) (arg8@@28 Real) (arg9@@28 T@U) (arg10@@28 T@U) (arg11@@28 T@U) (arg12@@28 Real) (arg13@@28 T@U) (arg14@@28 Int) (arg15@@28 T@U) (arg16@@22 Real) (arg17@@8 T@U) (arg18@@8 Real) (arg19@@8 T@U) (arg20@@8 T@U) (arg21@@8 T@U) (arg22@@8 Real) (arg23@@8 T@U) (arg24@@5 T@U) ) (!  (=> (and (and (and (and (and (and (and (and (and (and (and (and (and (and (= (type arg1@@61) RefType) (= (type arg3@@47) RefType)) (= (type arg5@@38) RefType)) (= (type arg7@@28) RefType)) (= (type arg9@@28) RefType)) (= (type arg10@@28) RefType)) (= (type arg11@@28) RefType)) (= (type arg13@@28) RefType)) (= (type arg15@@28) RefType)) (= (type arg17@@8) RefType)) (= (type arg19@@8) RefType)) (= (type arg20@@8) RefType)) (= (type arg21@@8) RefType)) (= (type arg23@@8) RefType)) (= (type arg24@@5) RefType)) (= (getPredWandId (wand_2 arg1@@61 arg2@@52 arg3@@47 arg4@@38 arg5@@38 arg6@@35 arg7@@28 arg8@@28 arg9@@28 arg10@@28 arg11@@28 arg12@@28 arg13@@28 arg14@@28 arg15@@28 arg16@@22 arg17@@8 arg18@@8 arg19@@8 arg20@@8 arg21@@8 arg22@@8 arg23@@8 arg24@@5)) 6))
 :qid |stdinbpl.267:15|
 :skolemid |41|
 :pattern ( (wand_2 arg1@@61 arg2@@52 arg3@@47 arg4@@38 arg5@@38 arg6@@35 arg7@@28 arg8@@28 arg9@@28 arg10@@28 arg11@@28 arg12@@28 arg13@@28 arg14@@28 arg15@@28 arg16@@22 arg17@@8 arg18@@8 arg19@@8 arg20@@8 arg21@@8 arg22@@8 arg23@@8 arg24@@5))
)))
(assert (forall ((b_2@@4 Bool) ) (! (= (PredicateMaskField (Q b_2@@4)) (|Q#sm| b_2@@4))
 :qid |stdinbpl.376:15|
 :skolemid |58|
 :pattern ( (PredicateMaskField (Q b_2@@4)))
)))
(assert (forall ((x@@19 T@U) ) (!  (=> (= (type x@@19) RefType) (= (PredicateMaskField (LL x@@19)) (|LL#sm| x@@19)))
 :qid |stdinbpl.429:15|
 :skolemid |64|
 :pattern ( (PredicateMaskField (LL x@@19)))
)))
(assert (= (type |P#sm|) (FieldType PredicateType_PType (MapType1Type RefType boolType))))
(assert (= (PredicateMaskField P) |P#sm|))
(assert (forall ((Heap@@12 T@U) (o@@0 T@U) (f_3 T@U) (v T@U) ) (! (let ((B@@8 (type v)))
(let ((A@@9 (FieldTypeInv0 (type f_3))))
 (=> (and (and (= (type Heap@@12) (MapType0Type RefType)) (= (type o@@0) RefType)) (= (type f_3) (FieldType A@@9 B@@8))) (succHeap Heap@@12 (MapType0Store Heap@@12 o@@0 f_3 v)))))
 :qid |stdinbpl.78:22|
 :skolemid |9|
 :pattern ( (MapType0Store Heap@@12 o@@0 f_3 v))
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
(declare-fun Heap@@13 () T@U)
(declare-fun x@@20 () T@U)
(declare-fun Mask@3 () T@U)
(declare-fun Mask@1 () T@U)
(declare-fun Mask@2 () T@U)
(declare-fun i@@5 () Int)
(declare-fun Mask@0 () T@U)
(assert  (and (and (and (and (and (= (type Heap@@13) (MapType0Type RefType)) (= (type x@@20) RefType)) (= (type Mask@1) (MapType1Type RefType realType))) (= (type Mask@2) (MapType1Type RefType realType))) (= (type Mask@3) (MapType1Type RefType realType))) (= (type Mask@0) (MapType1Type RefType realType))))
(set-info :boogie-vc-id |LLC#definedness|)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 8) (let ((anon2_correct true))
(let ((anon3_Else_correct  (=> (= (MapType0Select Heap@@13 x@@20 next) null) (=> (and (= Mask@3 Mask@1) (= (ControlFlow 0 4) 1)) anon2_correct))))
(let ((anon3_Then_correct  (=> (not (= (MapType0Select Heap@@13 x@@20 next) null)) (and (=> (= (ControlFlow 0 2) (- 0 3)) (HasDirectPerm Mask@1 x@@20 next)) (=> (HasDirectPerm Mask@1 x@@20 next) (=> (and (and (= Mask@2 (MapType1Store Mask@1 null (LLC (MapType0Select Heap@@13 x@@20 next) (+ i@@5 1)) (real_2_U (+ (U_2_real (MapType1Select Mask@1 null (LLC (MapType0Select Heap@@13 x@@20 next) (+ i@@5 1)))) FullPerm)))) (state Heap@@13 Mask@2)) (and (= Mask@3 Mask@2) (= (ControlFlow 0 2) 1))) anon2_correct))))))
(let ((anon0_correct  (=> (state Heap@@13 ZeroMask) (=> (and (and (U_2_bool (MapType0Select Heap@@13 x@@20 $allocated)) (not (= x@@20 null))) (and (= Mask@0 (MapType1Store ZeroMask x@@20 val (real_2_U (+ (U_2_real (MapType1Select ZeroMask x@@20 val)) FullPerm)))) (state Heap@@13 Mask@0))) (and (=> (= (ControlFlow 0 5) (- 0 7)) (HasDirectPerm Mask@0 x@@20 val)) (=> (HasDirectPerm Mask@0 x@@20 val) (=> (and (and (= (U_2_int (MapType0Select Heap@@13 x@@20 val)) i@@5) (not (= x@@20 null))) (and (= Mask@1 (MapType1Store Mask@0 x@@20 next (real_2_U (+ (U_2_real (MapType1Select Mask@0 x@@20 next)) FullPerm)))) (state Heap@@13 Mask@1))) (and (=> (= (ControlFlow 0 5) (- 0 6)) (HasDirectPerm Mask@1 x@@20 next)) (=> (HasDirectPerm Mask@1 x@@20 next) (and (=> (= (ControlFlow 0 5) 2) anon3_Then_correct) (=> (= (ControlFlow 0 5) 4) anon3_Else_correct)))))))))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 8) 5) anon0_correct)))
PreconditionGeneratedEntry_correct))))))
))
(check-sat)
(pop 1)
; Valid
(get-info :rlimit)
