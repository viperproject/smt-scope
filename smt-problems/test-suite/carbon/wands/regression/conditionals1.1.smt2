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
(declare-fun state (T@U T@U) Bool)
(declare-fun |get'| (T@U T@U Int) Bool)
(declare-fun MapType0Type (T@T) T@T)
(declare-fun MapType1Type (T@T T@T) T@T)
(declare-fun |get#frame| (T@U T@U Int) Bool)
(declare-fun EmptyFrame () T@U)
(declare-fun MapType0TypeInv0 (T@T) T@T)
(declare-fun MapType0Select (T@U T@U T@U) T@U)
(declare-fun MapType0Store (T@U T@U T@U T@U) T@U)
(declare-fun MapType1TypeInv0 (T@T) T@T)
(declare-fun MapType1TypeInv1 (T@T) T@T)
(declare-fun MapType1Select (T@U T@U T@U) T@U)
(declare-fun MapType1Store (T@U T@U T@U T@U) T@U)
(declare-fun FrameTypeType () T@T)
(declare-fun succHeap (T@U T@U) Bool)
(declare-fun succHeapTrans (T@U T@U) Bool)
(declare-fun wand (T@U Real T@U Real) T@U)
(declare-fun getPredWandId (T@U) Int)
(declare-fun WandType_wandType () T@T)
(declare-fun GoodMask (T@U) Bool)
(declare-fun wand_6 (T@U Real T@U Real Bool T@U Real T@U Real) T@U)
(declare-fun IsWandField (T@U) Bool)
(declare-fun WandType_wand_6Type () T@T)
(declare-fun |wand_6#ft| (T@U Real T@U Real Bool T@U Real T@U Real) T@U)
(declare-fun IsPredicateField (T@U) Bool)
(declare-fun dummyFunction (T@U) Bool)
(declare-fun |get#triggerStateless| (T@U Int) Bool)
(declare-fun IdenticalOnKnownLocations (T@U T@U T@U) Bool)
(declare-fun null () T@U)
(declare-fun PredicateMaskField (T@U) T@U)
(declare-fun HasDirectPerm (T@U T@U T@U) Bool)
(declare-fun WandMaskField (T@U) T@U)
(declare-fun M (T@U) T@U)
(declare-fun PredicateType_MType () T@T)
(declare-fun B@@1 (T@U) T@U)
(declare-fun PredicateType_BType () T@T)
(declare-fun T (T@U) T@U)
(declare-fun PredicateType_TType () T@T)
(declare-fun E (T@U) T@U)
(declare-fun PredicateType_EType () T@T)
(declare-fun |M#trigger| (T@U T@U) Bool)
(declare-fun |M#everUsed| (T@U) Bool)
(declare-fun |B#trigger| (T@U T@U) Bool)
(declare-fun |B#everUsed| (T@U) Bool)
(declare-fun |T#trigger| (T@U T@U) Bool)
(declare-fun |T#everUsed| (T@U) Bool)
(declare-fun |E#trigger| (T@U T@U) Bool)
(declare-fun |E#everUsed| (T@U) Bool)
(declare-fun |wand_4#ft| (Bool Bool T@U Real T@U Real) T@U)
(declare-fun |wand_4#sm| (Bool Bool T@U Real T@U Real) T@U)
(declare-fun WandType_wand_4Type () T@T)
(declare-fun |wand_5#ft| (Bool Bool T@U Real T@U Real) T@U)
(declare-fun |wand_5#sm| (Bool Bool T@U Real T@U Real) T@U)
(declare-fun WandType_wand_5Type () T@T)
(declare-fun wand_1 (Bool Bool T@U Real Bool) T@U)
(declare-fun WandType_wand_1Type () T@T)
(declare-fun wand_2 (Bool Bool Bool T@U Real) T@U)
(declare-fun WandType_wand_2Type () T@T)
(declare-fun |M#sm| (T@U) T@U)
(declare-fun |B#sm| (T@U) T@U)
(declare-fun |T#sm| (T@U) T@U)
(declare-fun |E#sm| (T@U) T@U)
(declare-fun dummyHeap () T@U)
(declare-fun ZeroMask () T@U)
(declare-fun InsidePredicate (T@U T@U T@U T@U) Bool)
(declare-fun |wand_1#ft| (Bool Bool T@U Real Bool) T@U)
(declare-fun |wand_2#ft| (Bool Bool Bool T@U Real) T@U)
(declare-fun wand_4 (Bool Bool T@U Real T@U Real) T@U)
(declare-fun wand_5 (Bool Bool T@U Real T@U Real) T@U)
(declare-fun sumMask (T@U T@U T@U) Bool)
(declare-fun |wand#ft| (T@U Real T@U Real) T@U)
(declare-fun ConditionalFrame (Real T@U) T@U)
(declare-fun NoPerm () Real)
(declare-fun |wand#sm| (T@U Real T@U Real) T@U)
(declare-fun |wand_1#sm| (Bool Bool T@U Real Bool) T@U)
(declare-fun |wand_2#sm| (Bool Bool Bool T@U Real) T@U)
(declare-fun wand_3 (Bool Bool T@U Real Bool T@U Real) T@U)
(declare-fun WandType_wand_3Type () T@T)
(declare-fun FullPerm () Real)
(declare-fun |wand_6#sm| (T@U Real T@U Real Bool T@U Real T@U Real) T@U)
(declare-fun |wand_3#ft| (Bool Bool T@U Real Bool T@U Real) T@U)
(declare-fun |wand_3#sm| (Bool Bool T@U Real Bool T@U Real) T@U)
(declare-fun ZeroPMask () T@U)
(declare-fun get (T@U T@U Int) Bool)
(declare-fun AssumeFunctionsAbove () Int)
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
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (and (and (forall ((arg0@@14 T@T) ) (! (= (Ctor (MapType0Type arg0@@14)) 9)
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
)))) (forall ((arg0@@18 T@T) (arg1@@4 T@T) ) (! (= (Ctor (MapType1Type arg0@@18 arg1@@4)) 10)
 :qid |ctor:MapType1Type|
))) (forall ((arg0@@19 T@T) (arg1@@5 T@T) ) (! (= (MapType1TypeInv0 (MapType1Type arg0@@19 arg1@@5)) arg0@@19)
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
)))) (= (Ctor FrameTypeType) 11)) (= (type EmptyFrame) FrameTypeType)))
(assert (forall ((Heap T@U) (Mask T@U) (x@@8 T@U) (i Int) ) (!  (=> (and (and (and (= (type Heap) (MapType0Type RefType)) (= (type Mask) (MapType1Type RefType realType))) (= (type x@@8) RefType)) (state Heap Mask)) (= (|get'| Heap x@@8 i) (|get#frame| EmptyFrame x@@8 i)))
 :qid |stdinbpl.445:15|
 :skolemid |74|
 :pattern ( (state Heap Mask) (|get'| Heap x@@8 i))
)))
(assert (forall ((Heap0 T@U) (Heap1 T@U) ) (!  (=> (and (and (= (type Heap0) (MapType0Type RefType)) (= (type Heap1) (MapType0Type RefType))) (succHeap Heap0 Heap1)) (succHeapTrans Heap0 Heap1))
 :qid |stdinbpl.88:15|
 :skolemid |11|
 :pattern ( (succHeap Heap0 Heap1))
)))
(assert  (and (= (Ctor WandType_wandType) 12) (forall ((arg0@@23 T@U) (arg1@@9 Real) (arg2@@3 T@U) (arg3@@1 Real) ) (! (= (type (wand arg0@@23 arg1@@9 arg2@@3 arg3@@1)) (FieldType WandType_wandType intType))
 :qid |funType:wand|
 :pattern ( (wand arg0@@23 arg1@@9 arg2@@3 arg3@@1))
))))
(assert (forall ((arg1@@10 T@U) (arg2@@4 Real) (arg3@@2 T@U) (arg4 Real) ) (!  (=> (and (= (type arg1@@10) RefType) (= (type arg3@@2) RefType)) (= (getPredWandId (wand arg1@@10 arg2@@4 arg3@@2 arg4)) 5))
 :qid |stdinbpl.238:15|
 :skolemid |34|
 :pattern ( (wand arg1@@10 arg2@@4 arg3@@2 arg4))
)))
(assert (forall ((Heap@@0 T@U) (Mask@@0 T@U) ) (!  (=> (and (and (= (type Heap@@0) (MapType0Type RefType)) (= (type Mask@@0) (MapType1Type RefType realType))) (state Heap@@0 Mask@@0)) (GoodMask Mask@@0))
 :qid |stdinbpl.124:15|
 :skolemid |15|
 :pattern ( (state Heap@@0 Mask@@0))
)))
(assert  (and (= (Ctor WandType_wand_6Type) 13) (forall ((arg0@@24 T@U) (arg1@@11 Real) (arg2@@5 T@U) (arg3@@3 Real) (arg4@@0 Bool) (arg5 T@U) (arg6 Real) (arg7 T@U) (arg8 Real) ) (! (= (type (wand_6 arg0@@24 arg1@@11 arg2@@5 arg3@@3 arg4@@0 arg5 arg6 arg7 arg8)) (FieldType WandType_wand_6Type intType))
 :qid |funType:wand_6|
 :pattern ( (wand_6 arg0@@24 arg1@@11 arg2@@5 arg3@@3 arg4@@0 arg5 arg6 arg7 arg8))
))))
(assert (forall ((arg1@@12 T@U) (arg2@@6 Real) (arg3@@4 T@U) (arg4@@1 Real) (arg5@@0 Bool) (arg6@@0 T@U) (arg7@@0 Real) (arg8@@0 T@U) (arg9 Real) ) (!  (=> (and (and (and (= (type arg1@@12) RefType) (= (type arg3@@4) RefType)) (= (type arg6@@0) RefType)) (= (type arg8@@0) RefType)) (IsWandField (wand_6 arg1@@12 arg2@@6 arg3@@4 arg4@@1 arg5@@0 arg6@@0 arg7@@0 arg8@@0 arg9)))
 :qid |stdinbpl.314:15|
 :skolemid |50|
 :pattern ( (wand_6 arg1@@12 arg2@@6 arg3@@4 arg4@@1 arg5@@0 arg6@@0 arg7@@0 arg8@@0 arg9))
)))
(assert (forall ((arg0@@25 T@U) (arg1@@13 Real) (arg2@@7 T@U) (arg3@@5 Real) (arg4@@2 Bool) (arg5@@1 T@U) (arg6@@1 Real) (arg7@@1 T@U) (arg8@@1 Real) ) (! (= (type (|wand_6#ft| arg0@@25 arg1@@13 arg2@@7 arg3@@5 arg4@@2 arg5@@1 arg6@@1 arg7@@1 arg8@@1)) (FieldType WandType_wand_6Type FrameTypeType))
 :qid |funType:wand_6#ft|
 :pattern ( (|wand_6#ft| arg0@@25 arg1@@13 arg2@@7 arg3@@5 arg4@@2 arg5@@1 arg6@@1 arg7@@1 arg8@@1))
)))
(assert (forall ((arg1@@14 T@U) (arg2@@8 Real) (arg3@@6 T@U) (arg4@@3 Real) (arg5@@2 Bool) (arg6@@2 T@U) (arg7@@2 Real) (arg8@@2 T@U) (arg9@@0 Real) ) (!  (=> (and (and (and (= (type arg1@@14) RefType) (= (type arg3@@6) RefType)) (= (type arg6@@2) RefType)) (= (type arg8@@2) RefType)) (IsWandField (|wand_6#ft| arg1@@14 arg2@@8 arg3@@6 arg4@@3 arg5@@2 arg6@@2 arg7@@2 arg8@@2 arg9@@0)))
 :qid |stdinbpl.318:15|
 :skolemid |51|
 :pattern ( (|wand_6#ft| arg1@@14 arg2@@8 arg3@@6 arg4@@3 arg5@@2 arg6@@2 arg7@@2 arg8@@2 arg9@@0))
)))
(assert (forall ((Heap0@@0 T@U) (Heap1@@0 T@U) (Heap2 T@U) ) (!  (=> (and (and (and (= (type Heap0@@0) (MapType0Type RefType)) (= (type Heap1@@0) (MapType0Type RefType))) (= (type Heap2) (MapType0Type RefType))) (and (succHeapTrans Heap0@@0 Heap1@@0) (succHeap Heap1@@0 Heap2))) (succHeapTrans Heap0@@0 Heap2))
 :qid |stdinbpl.93:15|
 :skolemid |12|
 :pattern ( (succHeapTrans Heap0@@0 Heap1@@0) (succHeap Heap1@@0 Heap2))
)))
(assert (forall ((arg1@@15 T@U) (arg2@@9 Real) (arg3@@7 T@U) (arg4@@4 Real) (arg5@@3 Bool) (arg6@@3 T@U) (arg7@@3 Real) (arg8@@3 T@U) (arg9@@1 Real) ) (!  (=> (and (and (and (= (type arg1@@15) RefType) (= (type arg3@@7) RefType)) (= (type arg6@@3) RefType)) (= (type arg8@@3) RefType)) (not (IsPredicateField (wand_6 arg1@@15 arg2@@9 arg3@@7 arg4@@4 arg5@@3 arg6@@3 arg7@@3 arg8@@3 arg9@@1))))
 :qid |stdinbpl.322:15|
 :skolemid |52|
 :pattern ( (wand_6 arg1@@15 arg2@@9 arg3@@7 arg4@@4 arg5@@3 arg6@@3 arg7@@3 arg8@@3 arg9@@1))
)))
(assert (forall ((arg1@@16 T@U) (arg2@@10 Real) (arg3@@8 T@U) (arg4@@5 Real) (arg5@@4 Bool) (arg6@@4 T@U) (arg7@@4 Real) (arg8@@4 T@U) (arg9@@2 Real) ) (!  (=> (and (and (and (= (type arg1@@16) RefType) (= (type arg3@@8) RefType)) (= (type arg6@@4) RefType)) (= (type arg8@@4) RefType)) (not (IsPredicateField (|wand_6#ft| arg1@@16 arg2@@10 arg3@@8 arg4@@5 arg5@@4 arg6@@4 arg7@@4 arg8@@4 arg9@@2))))
 :qid |stdinbpl.326:15|
 :skolemid |53|
 :pattern ( (|wand_6#ft| arg1@@16 arg2@@10 arg3@@8 arg4@@5 arg5@@4 arg6@@4 arg7@@4 arg8@@4 arg9@@2))
)))
(assert (forall ((Heap@@1 T@U) (x@@9 T@U) (i@@0 Int) ) (!  (=> (and (= (type Heap@@1) (MapType0Type RefType)) (= (type x@@9) RefType)) (dummyFunction (bool_2_U (|get#triggerStateless| x@@9 i@@0))))
 :qid |stdinbpl.432:15|
 :skolemid |72|
 :pattern ( (|get'| Heap@@1 x@@9 i@@0))
)))
(assert  (and (= (type null) RefType) (forall ((arg0@@26 T@U) ) (! (let ((A (FieldTypeInv0 (type arg0@@26))))
(= (type (PredicateMaskField arg0@@26)) (FieldType A (MapType1Type RefType boolType))))
 :qid |funType:PredicateMaskField|
 :pattern ( (PredicateMaskField arg0@@26))
))))
(assert (forall ((Heap@@2 T@U) (ExhaleHeap T@U) (Mask@@1 T@U) (pm_f T@U) ) (! (let ((C (FieldTypeInv0 (type pm_f))))
 (=> (and (and (and (and (and (= (type Heap@@2) (MapType0Type RefType)) (= (type ExhaleHeap) (MapType0Type RefType))) (= (type Mask@@1) (MapType1Type RefType realType))) (= (type pm_f) (FieldType C FrameTypeType))) (IdenticalOnKnownLocations Heap@@2 ExhaleHeap Mask@@1)) (and (HasDirectPerm Mask@@1 null pm_f) (IsPredicateField pm_f))) (= (MapType0Select Heap@@2 null (PredicateMaskField pm_f)) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))))
 :qid |stdinbpl.47:19|
 :skolemid |2|
 :pattern ( (IdenticalOnKnownLocations Heap@@2 ExhaleHeap Mask@@1) (IsPredicateField pm_f) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))
)))
(assert (forall ((arg0@@27 T@U) ) (! (let ((A@@0 (FieldTypeInv0 (type arg0@@27))))
(= (type (WandMaskField arg0@@27)) (FieldType A@@0 (MapType1Type RefType boolType))))
 :qid |funType:WandMaskField|
 :pattern ( (WandMaskField arg0@@27))
)))
(assert (forall ((Heap@@3 T@U) (ExhaleHeap@@0 T@U) (Mask@@2 T@U) (pm_f@@0 T@U) ) (! (let ((C@@0 (FieldTypeInv0 (type pm_f@@0))))
 (=> (and (and (and (and (and (= (type Heap@@3) (MapType0Type RefType)) (= (type ExhaleHeap@@0) (MapType0Type RefType))) (= (type Mask@@2) (MapType1Type RefType realType))) (= (type pm_f@@0) (FieldType C@@0 FrameTypeType))) (IdenticalOnKnownLocations Heap@@3 ExhaleHeap@@0 Mask@@2)) (and (HasDirectPerm Mask@@2 null pm_f@@0) (IsWandField pm_f@@0))) (= (MapType0Select Heap@@3 null (WandMaskField pm_f@@0)) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))))
 :qid |stdinbpl.60:19|
 :skolemid |5|
 :pattern ( (IdenticalOnKnownLocations Heap@@3 ExhaleHeap@@0 Mask@@2) (IsWandField pm_f@@0) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))
)))
(assert  (and (= (Ctor PredicateType_MType) 14) (forall ((arg0@@28 T@U) ) (! (= (type (M arg0@@28)) (FieldType PredicateType_MType FrameTypeType))
 :qid |funType:M|
 :pattern ( (M arg0@@28))
))))
(assert (forall ((x@@10 T@U) ) (!  (=> (= (type x@@10) RefType) (IsPredicateField (M x@@10)))
 :qid |stdinbpl.482:15|
 :skolemid |76|
 :pattern ( (M x@@10))
)))
(assert  (and (= (Ctor PredicateType_BType) 15) (forall ((arg0@@29 T@U) ) (! (= (type (B@@1 arg0@@29)) (FieldType PredicateType_BType FrameTypeType))
 :qid |funType:B|
 :pattern ( (B@@1 arg0@@29))
))))
(assert (forall ((x@@11 T@U) ) (!  (=> (= (type x@@11) RefType) (IsPredicateField (B@@1 x@@11)))
 :qid |stdinbpl.531:15|
 :skolemid |82|
 :pattern ( (B@@1 x@@11))
)))
(assert  (and (= (Ctor PredicateType_TType) 16) (forall ((arg0@@30 T@U) ) (! (= (type (T arg0@@30)) (FieldType PredicateType_TType FrameTypeType))
 :qid |funType:T|
 :pattern ( (T arg0@@30))
))))
(assert (forall ((x@@12 T@U) ) (!  (=> (= (type x@@12) RefType) (IsPredicateField (T x@@12)))
 :qid |stdinbpl.585:15|
 :skolemid |88|
 :pattern ( (T x@@12))
)))
(assert  (and (= (Ctor PredicateType_EType) 17) (forall ((arg0@@31 T@U) ) (! (= (type (E arg0@@31)) (FieldType PredicateType_EType FrameTypeType))
 :qid |funType:E|
 :pattern ( (E arg0@@31))
))))
(assert (forall ((x@@13 T@U) ) (!  (=> (= (type x@@13) RefType) (IsPredicateField (E x@@13)))
 :qid |stdinbpl.634:15|
 :skolemid |94|
 :pattern ( (E x@@13))
)))
(assert (forall ((Heap@@4 T@U) (x@@14 T@U) ) (!  (=> (and (= (type Heap@@4) (MapType0Type RefType)) (= (type x@@14) RefType)) (|M#everUsed| (M x@@14)))
 :qid |stdinbpl.501:15|
 :skolemid |80|
 :pattern ( (|M#trigger| Heap@@4 (M x@@14)))
)))
(assert (forall ((Heap@@5 T@U) (x@@15 T@U) ) (!  (=> (and (= (type Heap@@5) (MapType0Type RefType)) (= (type x@@15) RefType)) (|B#everUsed| (B@@1 x@@15)))
 :qid |stdinbpl.550:15|
 :skolemid |86|
 :pattern ( (|B#trigger| Heap@@5 (B@@1 x@@15)))
)))
(assert (forall ((Heap@@6 T@U) (x@@16 T@U) ) (!  (=> (and (= (type Heap@@6) (MapType0Type RefType)) (= (type x@@16) RefType)) (|T#everUsed| (T x@@16)))
 :qid |stdinbpl.604:15|
 :skolemid |92|
 :pattern ( (|T#trigger| Heap@@6 (T x@@16)))
)))
(assert (forall ((Heap@@7 T@U) (x@@17 T@U) ) (!  (=> (and (= (type Heap@@7) (MapType0Type RefType)) (= (type x@@17) RefType)) (|E#everUsed| (E x@@17)))
 :qid |stdinbpl.653:15|
 :skolemid |98|
 :pattern ( (|E#trigger| Heap@@7 (E x@@17)))
)))
(assert  (and (and (= (Ctor WandType_wand_4Type) 18) (forall ((arg0@@32 Bool) (arg1@@17 Bool) (arg2@@11 T@U) (arg3@@9 Real) (arg4@@6 T@U) (arg5@@5 Real) ) (! (= (type (|wand_4#ft| arg0@@32 arg1@@17 arg2@@11 arg3@@9 arg4@@6 arg5@@5)) (FieldType WandType_wand_4Type FrameTypeType))
 :qid |funType:wand_4#ft|
 :pattern ( (|wand_4#ft| arg0@@32 arg1@@17 arg2@@11 arg3@@9 arg4@@6 arg5@@5))
))) (forall ((arg0@@33 Bool) (arg1@@18 Bool) (arg2@@12 T@U) (arg3@@10 Real) (arg4@@7 T@U) (arg5@@6 Real) ) (! (= (type (|wand_4#sm| arg0@@33 arg1@@18 arg2@@12 arg3@@10 arg4@@7 arg5@@6)) (FieldType WandType_wand_4Type (MapType1Type RefType boolType)))
 :qid |funType:wand_4#sm|
 :pattern ( (|wand_4#sm| arg0@@33 arg1@@18 arg2@@12 arg3@@10 arg4@@7 arg5@@6))
))))
(assert (forall ((arg1@@19 Bool) (arg2@@13 Bool) (arg3@@11 T@U) (arg4@@8 Real) (arg5@@7 T@U) (arg6@@5 Real) ) (!  (=> (and (= (type arg3@@11) RefType) (= (type arg5@@7) RefType)) (= (|wand_4#sm| arg1@@19 arg2@@13 arg3@@11 arg4@@8 arg5@@7 arg6@@5) (WandMaskField (|wand_4#ft| arg1@@19 arg2@@13 arg3@@11 arg4@@8 arg5@@7 arg6@@5))))
 :qid |stdinbpl.202:15|
 :skolemid |26|
 :pattern ( (WandMaskField (|wand_4#ft| arg1@@19 arg2@@13 arg3@@11 arg4@@8 arg5@@7 arg6@@5)))
)))
(assert  (and (and (= (Ctor WandType_wand_5Type) 19) (forall ((arg0@@34 Bool) (arg1@@20 Bool) (arg2@@14 T@U) (arg3@@12 Real) (arg4@@9 T@U) (arg5@@8 Real) ) (! (= (type (|wand_5#ft| arg0@@34 arg1@@20 arg2@@14 arg3@@12 arg4@@9 arg5@@8)) (FieldType WandType_wand_5Type FrameTypeType))
 :qid |funType:wand_5#ft|
 :pattern ( (|wand_5#ft| arg0@@34 arg1@@20 arg2@@14 arg3@@12 arg4@@9 arg5@@8))
))) (forall ((arg0@@35 Bool) (arg1@@21 Bool) (arg2@@15 T@U) (arg3@@13 Real) (arg4@@10 T@U) (arg5@@9 Real) ) (! (= (type (|wand_5#sm| arg0@@35 arg1@@21 arg2@@15 arg3@@13 arg4@@10 arg5@@9)) (FieldType WandType_wand_5Type (MapType1Type RefType boolType)))
 :qid |funType:wand_5#sm|
 :pattern ( (|wand_5#sm| arg0@@35 arg1@@21 arg2@@15 arg3@@13 arg4@@10 arg5@@9))
))))
(assert (forall ((arg1@@22 Bool) (arg2@@16 Bool) (arg3@@14 T@U) (arg4@@11 Real) (arg5@@10 T@U) (arg6@@6 Real) ) (!  (=> (and (= (type arg3@@14) RefType) (= (type arg5@@10) RefType)) (= (|wand_5#sm| arg1@@22 arg2@@16 arg3@@14 arg4@@11 arg5@@10 arg6@@6) (WandMaskField (|wand_5#ft| arg1@@22 arg2@@16 arg3@@14 arg4@@11 arg5@@10 arg6@@6))))
 :qid |stdinbpl.298:15|
 :skolemid |47|
 :pattern ( (WandMaskField (|wand_5#ft| arg1@@22 arg2@@16 arg3@@14 arg4@@11 arg5@@10 arg6@@6)))
)))
(assert (forall ((Heap@@8 T@U) (ExhaleHeap@@1 T@U) (Mask@@3 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@8) (MapType0Type RefType)) (= (type ExhaleHeap@@1) (MapType0Type RefType))) (= (type Mask@@3) (MapType1Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@8 ExhaleHeap@@1 Mask@@3)) (U_2_bool (MapType0Select Heap@@8 o_1 $allocated))) (U_2_bool (MapType0Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.73:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@8 ExhaleHeap@@1 Mask@@3) (MapType0Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert  (and (= (Ctor WandType_wand_1Type) 20) (forall ((arg0@@36 Bool) (arg1@@23 Bool) (arg2@@17 T@U) (arg3@@15 Real) (arg4@@12 Bool) ) (! (= (type (wand_1 arg0@@36 arg1@@23 arg2@@17 arg3@@15 arg4@@12)) (FieldType WandType_wand_1Type intType))
 :qid |funType:wand_1|
 :pattern ( (wand_1 arg0@@36 arg1@@23 arg2@@17 arg3@@15 arg4@@12))
))))
(assert (forall ((arg1@@24 Bool) (arg2@@18 Bool) (arg3@@16 T@U) (arg4@@13 Real) (arg5@@11 Bool) ) (!  (=> (= (type arg3@@16) RefType) (= (getPredWandId (wand_1 arg1@@24 arg2@@18 arg3@@16 arg4@@13 arg5@@11)) 9))
 :qid |stdinbpl.366:15|
 :skolemid |62|
 :pattern ( (wand_1 arg1@@24 arg2@@18 arg3@@16 arg4@@13 arg5@@11))
)))
(assert  (and (= (Ctor WandType_wand_2Type) 21) (forall ((arg0@@37 Bool) (arg1@@25 Bool) (arg2@@19 Bool) (arg3@@17 T@U) (arg4@@14 Real) ) (! (= (type (wand_2 arg0@@37 arg1@@25 arg2@@19 arg3@@17 arg4@@14)) (FieldType WandType_wand_2Type intType))
 :qid |funType:wand_2|
 :pattern ( (wand_2 arg0@@37 arg1@@25 arg2@@19 arg3@@17 arg4@@14))
))))
(assert (forall ((arg1@@26 Bool) (arg2@@20 Bool) (arg3@@18 Bool) (arg4@@15 T@U) (arg5@@12 Real) ) (!  (=> (= (type arg4@@15) RefType) (= (getPredWandId (wand_2 arg1@@26 arg2@@20 arg3@@18 arg4@@15 arg5@@12)) 10))
 :qid |stdinbpl.398:15|
 :skolemid |69|
 :pattern ( (wand_2 arg1@@26 arg2@@20 arg3@@18 arg4@@15 arg5@@12))
)))
(assert (forall ((x@@18 T@U) (x2 T@U) ) (!  (=> (and (and (= (type x@@18) RefType) (= (type x2) RefType)) (= (M x@@18) (M x2))) (= x@@18 x2))
 :qid |stdinbpl.492:15|
 :skolemid |78|
 :pattern ( (M x@@18) (M x2))
)))
(assert (forall ((arg0@@38 T@U) ) (! (= (type (|M#sm| arg0@@38)) (FieldType PredicateType_MType (MapType1Type RefType boolType)))
 :qid |funType:M#sm|
 :pattern ( (|M#sm| arg0@@38))
)))
(assert (forall ((x@@19 T@U) (x2@@0 T@U) ) (!  (=> (and (and (= (type x@@19) RefType) (= (type x2@@0) RefType)) (= (|M#sm| x@@19) (|M#sm| x2@@0))) (= x@@19 x2@@0))
 :qid |stdinbpl.496:15|
 :skolemid |79|
 :pattern ( (|M#sm| x@@19) (|M#sm| x2@@0))
)))
(assert (forall ((x@@20 T@U) (x2@@1 T@U) ) (!  (=> (and (and (= (type x@@20) RefType) (= (type x2@@1) RefType)) (= (B@@1 x@@20) (B@@1 x2@@1))) (= x@@20 x2@@1))
 :qid |stdinbpl.541:15|
 :skolemid |84|
 :pattern ( (B@@1 x@@20) (B@@1 x2@@1))
)))
(assert (forall ((arg0@@39 T@U) ) (! (= (type (|B#sm| arg0@@39)) (FieldType PredicateType_BType (MapType1Type RefType boolType)))
 :qid |funType:B#sm|
 :pattern ( (|B#sm| arg0@@39))
)))
(assert (forall ((x@@21 T@U) (x2@@2 T@U) ) (!  (=> (and (and (= (type x@@21) RefType) (= (type x2@@2) RefType)) (= (|B#sm| x@@21) (|B#sm| x2@@2))) (= x@@21 x2@@2))
 :qid |stdinbpl.545:15|
 :skolemid |85|
 :pattern ( (|B#sm| x@@21) (|B#sm| x2@@2))
)))
(assert (forall ((x@@22 T@U) (x2@@3 T@U) ) (!  (=> (and (and (= (type x@@22) RefType) (= (type x2@@3) RefType)) (= (T x@@22) (T x2@@3))) (= x@@22 x2@@3))
 :qid |stdinbpl.595:15|
 :skolemid |90|
 :pattern ( (T x@@22) (T x2@@3))
)))
(assert (forall ((arg0@@40 T@U) ) (! (= (type (|T#sm| arg0@@40)) (FieldType PredicateType_TType (MapType1Type RefType boolType)))
 :qid |funType:T#sm|
 :pattern ( (|T#sm| arg0@@40))
)))
(assert (forall ((x@@23 T@U) (x2@@4 T@U) ) (!  (=> (and (and (= (type x@@23) RefType) (= (type x2@@4) RefType)) (= (|T#sm| x@@23) (|T#sm| x2@@4))) (= x@@23 x2@@4))
 :qid |stdinbpl.599:15|
 :skolemid |91|
 :pattern ( (|T#sm| x@@23) (|T#sm| x2@@4))
)))
(assert (forall ((x@@24 T@U) (x2@@5 T@U) ) (!  (=> (and (and (= (type x@@24) RefType) (= (type x2@@5) RefType)) (= (E x@@24) (E x2@@5))) (= x@@24 x2@@5))
 :qid |stdinbpl.644:15|
 :skolemid |96|
 :pattern ( (E x@@24) (E x2@@5))
)))
(assert (forall ((arg0@@41 T@U) ) (! (= (type (|E#sm| arg0@@41)) (FieldType PredicateType_EType (MapType1Type RefType boolType)))
 :qid |funType:E#sm|
 :pattern ( (|E#sm| arg0@@41))
)))
(assert (forall ((x@@25 T@U) (x2@@6 T@U) ) (!  (=> (and (and (= (type x@@25) RefType) (= (type x2@@6) RefType)) (= (|E#sm| x@@25) (|E#sm| x2@@6))) (= x@@25 x2@@6))
 :qid |stdinbpl.648:15|
 :skolemid |97|
 :pattern ( (|E#sm| x@@25) (|E#sm| x2@@6))
)))
(assert (forall ((Heap@@9 T@U) (ExhaleHeap@@2 T@U) (Mask@@4 T@U) (o_1@@0 T@U) (f_2 T@U) ) (! (let ((B@@2 (FieldTypeInv1 (type f_2))))
(let ((A@@1 (FieldTypeInv0 (type f_2))))
 (=> (and (and (and (and (and (and (= (type Heap@@9) (MapType0Type RefType)) (= (type ExhaleHeap@@2) (MapType0Type RefType))) (= (type Mask@@4) (MapType1Type RefType realType))) (= (type o_1@@0) RefType)) (= (type f_2) (FieldType A@@1 B@@2))) (IdenticalOnKnownLocations Heap@@9 ExhaleHeap@@2 Mask@@4)) (HasDirectPerm Mask@@4 o_1@@0 f_2)) (= (MapType0Select Heap@@9 o_1@@0 f_2) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2)))))
 :qid |stdinbpl.42:22|
 :skolemid |1|
 :pattern ( (IdenticalOnKnownLocations Heap@@9 ExhaleHeap@@2 Mask@@4) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2))
)))
(assert  (and (= (type dummyHeap) (MapType0Type RefType)) (= (type ZeroMask) (MapType1Type RefType realType))))
(assert (state dummyHeap ZeroMask))
(assert (forall ((p T@U) (v_1 T@U) (w T@U) ) (! (let ((A@@2 (FieldTypeInv0 (type p))))
 (=> (and (and (= (type p) (FieldType A@@2 FrameTypeType)) (= (type v_1) FrameTypeType)) (= (type w) FrameTypeType)) (not (InsidePredicate p v_1 p w))))
 :qid |stdinbpl.173:19|
 :skolemid |21|
 :pattern ( (InsidePredicate p v_1 p w))
)))
(assert (forall ((arg1@@27 Bool) (arg2@@21 Bool) (arg3@@19 T@U) (arg4@@16 Real) (arg5@@13 Bool) ) (!  (=> (= (type arg3@@19) RefType) (IsWandField (wand_1 arg1@@27 arg2@@21 arg3@@19 arg4@@16 arg5@@13)))
 :qid |stdinbpl.346:15|
 :skolemid |57|
 :pattern ( (wand_1 arg1@@27 arg2@@21 arg3@@19 arg4@@16 arg5@@13))
)))
(assert (forall ((arg0@@42 Bool) (arg1@@28 Bool) (arg2@@22 T@U) (arg3@@20 Real) (arg4@@17 Bool) ) (! (= (type (|wand_1#ft| arg0@@42 arg1@@28 arg2@@22 arg3@@20 arg4@@17)) (FieldType WandType_wand_1Type FrameTypeType))
 :qid |funType:wand_1#ft|
 :pattern ( (|wand_1#ft| arg0@@42 arg1@@28 arg2@@22 arg3@@20 arg4@@17))
)))
(assert (forall ((arg1@@29 Bool) (arg2@@23 Bool) (arg3@@21 T@U) (arg4@@18 Real) (arg5@@14 Bool) ) (!  (=> (= (type arg3@@21) RefType) (IsWandField (|wand_1#ft| arg1@@29 arg2@@23 arg3@@21 arg4@@18 arg5@@14)))
 :qid |stdinbpl.350:15|
 :skolemid |58|
 :pattern ( (|wand_1#ft| arg1@@29 arg2@@23 arg3@@21 arg4@@18 arg5@@14))
)))
(assert (forall ((arg1@@30 Bool) (arg2@@24 Bool) (arg3@@22 Bool) (arg4@@19 T@U) (arg5@@15 Real) ) (!  (=> (= (type arg4@@19) RefType) (IsWandField (wand_2 arg1@@30 arg2@@24 arg3@@22 arg4@@19 arg5@@15)))
 :qid |stdinbpl.378:15|
 :skolemid |64|
 :pattern ( (wand_2 arg1@@30 arg2@@24 arg3@@22 arg4@@19 arg5@@15))
)))
(assert (forall ((arg0@@43 Bool) (arg1@@31 Bool) (arg2@@25 Bool) (arg3@@23 T@U) (arg4@@20 Real) ) (! (= (type (|wand_2#ft| arg0@@43 arg1@@31 arg2@@25 arg3@@23 arg4@@20)) (FieldType WandType_wand_2Type FrameTypeType))
 :qid |funType:wand_2#ft|
 :pattern ( (|wand_2#ft| arg0@@43 arg1@@31 arg2@@25 arg3@@23 arg4@@20))
)))
(assert (forall ((arg1@@32 Bool) (arg2@@26 Bool) (arg3@@24 Bool) (arg4@@21 T@U) (arg5@@16 Real) ) (!  (=> (= (type arg4@@21) RefType) (IsWandField (|wand_2#ft| arg1@@32 arg2@@26 arg3@@24 arg4@@21 arg5@@16)))
 :qid |stdinbpl.382:15|
 :skolemid |65|
 :pattern ( (|wand_2#ft| arg1@@32 arg2@@26 arg3@@24 arg4@@21 arg5@@16))
)))
(assert (forall ((arg0@@44 Bool) (arg1@@33 Bool) (arg2@@27 T@U) (arg3@@25 Real) (arg4@@22 T@U) (arg5@@17 Real) ) (! (= (type (wand_4 arg0@@44 arg1@@33 arg2@@27 arg3@@25 arg4@@22 arg5@@17)) (FieldType WandType_wand_4Type intType))
 :qid |funType:wand_4|
 :pattern ( (wand_4 arg0@@44 arg1@@33 arg2@@27 arg3@@25 arg4@@22 arg5@@17))
)))
(assert (forall ((arg1@@34 Bool) (arg2@@28 Bool) (arg3@@26 T@U) (arg4@@23 Real) (arg5@@18 T@U) (arg6@@7 Real) (arg1_2 Bool) (arg2_2 Bool) (arg3_2 T@U) (arg4_2 Real) (arg5_2 T@U) (arg6_2 Real) ) (!  (=> (and (and (and (and (= (type arg3@@26) RefType) (= (type arg5@@18) RefType)) (= (type arg3_2) RefType)) (= (type arg5_2) RefType)) (= (wand_4 arg1@@34 arg2@@28 arg3@@26 arg4@@23 arg5@@18 arg6@@7) (wand_4 arg1_2 arg2_2 arg3_2 arg4_2 arg5_2 arg6_2))) (and (= arg1@@34 arg1_2) (and (= arg2@@28 arg2_2) (and (= arg3@@26 arg3_2) (and (= arg4@@23 arg4_2) (and (= arg5@@18 arg5_2) (= arg6@@7 arg6_2)))))))
 :qid |stdinbpl.210:15|
 :skolemid |28|
 :pattern ( (wand_4 arg1@@34 arg2@@28 arg3@@26 arg4@@23 arg5@@18 arg6@@7) (wand_4 arg1_2 arg2_2 arg3_2 arg4_2 arg5_2 arg6_2))
)))
(assert (forall ((arg0@@45 Bool) (arg1@@35 Bool) (arg2@@29 T@U) (arg3@@27 Real) (arg4@@24 T@U) (arg5@@19 Real) ) (! (= (type (wand_5 arg0@@45 arg1@@35 arg2@@29 arg3@@27 arg4@@24 arg5@@19)) (FieldType WandType_wand_5Type intType))
 :qid |funType:wand_5|
 :pattern ( (wand_5 arg0@@45 arg1@@35 arg2@@29 arg3@@27 arg4@@24 arg5@@19))
)))
(assert (forall ((arg1@@36 Bool) (arg2@@30 Bool) (arg3@@28 T@U) (arg4@@25 Real) (arg5@@20 T@U) (arg6@@8 Real) (arg1_2@@0 Bool) (arg2_2@@0 Bool) (arg3_2@@0 T@U) (arg4_2@@0 Real) (arg5_2@@0 T@U) (arg6_2@@0 Real) ) (!  (=> (and (and (and (and (= (type arg3@@28) RefType) (= (type arg5@@20) RefType)) (= (type arg3_2@@0) RefType)) (= (type arg5_2@@0) RefType)) (= (wand_5 arg1@@36 arg2@@30 arg3@@28 arg4@@25 arg5@@20 arg6@@8) (wand_5 arg1_2@@0 arg2_2@@0 arg3_2@@0 arg4_2@@0 arg5_2@@0 arg6_2@@0))) (and (= arg1@@36 arg1_2@@0) (and (= arg2@@30 arg2_2@@0) (and (= arg3@@28 arg3_2@@0) (and (= arg4@@25 arg4_2@@0) (and (= arg5@@20 arg5_2@@0) (= arg6@@8 arg6_2@@0)))))))
 :qid |stdinbpl.306:15|
 :skolemid |49|
 :pattern ( (wand_5 arg1@@36 arg2@@30 arg3@@28 arg4@@25 arg5@@20 arg6@@8) (wand_5 arg1_2@@0 arg2_2@@0 arg3_2@@0 arg4_2@@0 arg5_2@@0 arg6_2@@0))
)))
(assert  (not (IsPredicateField f_7)))
(assert  (not (IsWandField f_7)))
(assert  (not (IsPredicateField g)))
(assert  (not (IsWandField g)))
(assert  (not (IsPredicateField h)))
(assert  (not (IsWandField h)))
(assert (forall ((Heap@@10 T@U) (ExhaleHeap@@3 T@U) (Mask@@5 T@U) ) (!  (=> (and (and (and (= (type Heap@@10) (MapType0Type RefType)) (= (type ExhaleHeap@@3) (MapType0Type RefType))) (= (type Mask@@5) (MapType1Type RefType realType))) (IdenticalOnKnownLocations Heap@@10 ExhaleHeap@@3 Mask@@5)) (succHeap Heap@@10 ExhaleHeap@@3))
 :qid |stdinbpl.83:15|
 :skolemid |10|
 :pattern ( (IdenticalOnKnownLocations Heap@@10 ExhaleHeap@@3 Mask@@5))
)))
(assert (forall ((arg1@@37 Bool) (arg2@@31 Bool) (arg3@@29 T@U) (arg4@@26 Real) (arg5@@21 Bool) ) (!  (=> (= (type arg3@@29) RefType) (not (IsPredicateField (wand_1 arg1@@37 arg2@@31 arg3@@29 arg4@@26 arg5@@21))))
 :qid |stdinbpl.354:15|
 :skolemid |59|
 :pattern ( (wand_1 arg1@@37 arg2@@31 arg3@@29 arg4@@26 arg5@@21))
)))
(assert (forall ((arg1@@38 Bool) (arg2@@32 Bool) (arg3@@30 T@U) (arg4@@27 Real) (arg5@@22 Bool) ) (!  (=> (= (type arg3@@30) RefType) (not (IsPredicateField (|wand_1#ft| arg1@@38 arg2@@32 arg3@@30 arg4@@27 arg5@@22))))
 :qid |stdinbpl.358:15|
 :skolemid |60|
 :pattern ( (|wand_1#ft| arg1@@38 arg2@@32 arg3@@30 arg4@@27 arg5@@22))
)))
(assert (forall ((arg1@@39 Bool) (arg2@@33 Bool) (arg3@@31 Bool) (arg4@@28 T@U) (arg5@@23 Real) ) (!  (=> (= (type arg4@@28) RefType) (not (IsPredicateField (wand_2 arg1@@39 arg2@@33 arg3@@31 arg4@@28 arg5@@23))))
 :qid |stdinbpl.386:15|
 :skolemid |66|
 :pattern ( (wand_2 arg1@@39 arg2@@33 arg3@@31 arg4@@28 arg5@@23))
)))
(assert (forall ((arg1@@40 Bool) (arg2@@34 Bool) (arg3@@32 Bool) (arg4@@29 T@U) (arg5@@24 Real) ) (!  (=> (= (type arg4@@29) RefType) (not (IsPredicateField (|wand_2#ft| arg1@@40 arg2@@34 arg3@@32 arg4@@29 arg5@@24))))
 :qid |stdinbpl.390:15|
 :skolemid |67|
 :pattern ( (|wand_2#ft| arg1@@40 arg2@@34 arg3@@32 arg4@@29 arg5@@24))
)))
(assert (forall ((ResultMask T@U) (SummandMask1 T@U) (SummandMask2 T@U) (o_2 T@U) (f_4 T@U) ) (! (let ((B@@3 (FieldTypeInv1 (type f_4))))
(let ((A@@3 (FieldTypeInv0 (type f_4))))
 (=> (and (and (and (and (and (= (type ResultMask) (MapType1Type RefType realType)) (= (type SummandMask1) (MapType1Type RefType realType))) (= (type SummandMask2) (MapType1Type RefType realType))) (= (type o_2) RefType)) (= (type f_4) (FieldType A@@3 B@@3))) (sumMask ResultMask SummandMask1 SummandMask2)) (= (U_2_real (MapType1Select ResultMask o_2 f_4)) (+ (U_2_real (MapType1Select SummandMask1 o_2 f_4)) (U_2_real (MapType1Select SummandMask2 o_2 f_4)))))))
 :qid |stdinbpl.138:22|
 :skolemid |18|
 :pattern ( (sumMask ResultMask SummandMask1 SummandMask2) (MapType1Select ResultMask o_2 f_4))
 :pattern ( (sumMask ResultMask SummandMask1 SummandMask2) (MapType1Select SummandMask1 o_2 f_4))
 :pattern ( (sumMask ResultMask SummandMask1 SummandMask2) (MapType1Select SummandMask2 o_2 f_4))
)))
(assert (forall ((arg1@@41 T@U) (arg2@@35 Real) (arg3@@33 T@U) (arg4@@30 Real) ) (!  (=> (and (= (type arg1@@41) RefType) (= (type arg3@@33) RefType)) (IsWandField (wand arg1@@41 arg2@@35 arg3@@33 arg4@@30)))
 :qid |stdinbpl.218:15|
 :skolemid |29|
 :pattern ( (wand arg1@@41 arg2@@35 arg3@@33 arg4@@30))
)))
(assert (forall ((arg0@@46 T@U) (arg1@@42 Real) (arg2@@36 T@U) (arg3@@34 Real) ) (! (= (type (|wand#ft| arg0@@46 arg1@@42 arg2@@36 arg3@@34)) (FieldType WandType_wandType FrameTypeType))
 :qid |funType:wand#ft|
 :pattern ( (|wand#ft| arg0@@46 arg1@@42 arg2@@36 arg3@@34))
)))
(assert (forall ((arg1@@43 T@U) (arg2@@37 Real) (arg3@@35 T@U) (arg4@@31 Real) ) (!  (=> (and (= (type arg1@@43) RefType) (= (type arg3@@35) RefType)) (IsWandField (|wand#ft| arg1@@43 arg2@@37 arg3@@35 arg4@@31)))
 :qid |stdinbpl.222:15|
 :skolemid |30|
 :pattern ( (|wand#ft| arg1@@43 arg2@@37 arg3@@35 arg4@@31))
)))
(assert (forall ((arg0@@47 Real) (arg1@@44 T@U) ) (! (= (type (ConditionalFrame arg0@@47 arg1@@44)) FrameTypeType)
 :qid |funType:ConditionalFrame|
 :pattern ( (ConditionalFrame arg0@@47 arg1@@44))
)))
(assert (forall ((p@@0 Real) (f_6 T@U) ) (!  (=> (= (type f_6) FrameTypeType) (= (ConditionalFrame p@@0 f_6) (ite (> p@@0 0.0) f_6 EmptyFrame)))
 :qid |stdinbpl.161:15|
 :skolemid |19|
 :pattern ( (ConditionalFrame p@@0 f_6))
)))
(assert (forall ((arg1@@45 T@U) (arg2@@38 Real) (arg3@@36 T@U) (arg4@@32 Real) ) (!  (=> (and (= (type arg1@@45) RefType) (= (type arg3@@36) RefType)) (not (IsPredicateField (wand arg1@@45 arg2@@38 arg3@@36 arg4@@32))))
 :qid |stdinbpl.226:15|
 :skolemid |31|
 :pattern ( (wand arg1@@45 arg2@@38 arg3@@36 arg4@@32))
)))
(assert (forall ((arg1@@46 T@U) (arg2@@39 Real) (arg3@@37 T@U) (arg4@@33 Real) ) (!  (=> (and (= (type arg1@@46) RefType) (= (type arg3@@37) RefType)) (not (IsPredicateField (|wand#ft| arg1@@46 arg2@@39 arg3@@37 arg4@@33))))
 :qid |stdinbpl.230:15|
 :skolemid |32|
 :pattern ( (|wand#ft| arg1@@46 arg2@@39 arg3@@37 arg4@@33))
)))
(assert (forall ((Mask@@6 T@U) (o_2@@0 T@U) (f_4@@0 T@U) ) (! (let ((B@@4 (FieldTypeInv1 (type f_4@@0))))
(let ((A@@4 (FieldTypeInv0 (type f_4@@0))))
 (=> (and (and (= (type Mask@@6) (MapType1Type RefType realType)) (= (type o_2@@0) RefType)) (= (type f_4@@0) (FieldType A@@4 B@@4))) (= (HasDirectPerm Mask@@6 o_2@@0 f_4@@0) (> (U_2_real (MapType1Select Mask@@6 o_2@@0 f_4@@0)) NoPerm)))))
 :qid |stdinbpl.133:22|
 :skolemid |17|
 :pattern ( (HasDirectPerm Mask@@6 o_2@@0 f_4@@0))
)))
(assert (forall ((arg0@@48 T@U) (arg1@@47 Real) (arg2@@40 T@U) (arg3@@38 Real) ) (! (= (type (|wand#sm| arg0@@48 arg1@@47 arg2@@40 arg3@@38)) (FieldType WandType_wandType (MapType1Type RefType boolType)))
 :qid |funType:wand#sm|
 :pattern ( (|wand#sm| arg0@@48 arg1@@47 arg2@@40 arg3@@38))
)))
(assert (forall ((arg1@@48 T@U) (arg2@@41 Real) (arg3@@39 T@U) (arg4@@34 Real) ) (!  (=> (and (= (type arg1@@48) RefType) (= (type arg3@@39) RefType)) (= (|wand#sm| arg1@@48 arg2@@41 arg3@@39 arg4@@34) (WandMaskField (|wand#ft| arg1@@48 arg2@@41 arg3@@39 arg4@@34))))
 :qid |stdinbpl.234:15|
 :skolemid |33|
 :pattern ( (WandMaskField (|wand#ft| arg1@@48 arg2@@41 arg3@@39 arg4@@34)))
)))
(assert (forall ((arg1@@49 Bool) (arg2@@42 Bool) (arg3@@40 Bool) (arg4@@35 T@U) (arg5@@25 Real) (arg1_2@@1 Bool) (arg2_2@@1 Bool) (arg3_2@@1 Bool) (arg4_2@@1 T@U) (arg5_2@@1 Real) ) (!  (=> (and (and (= (type arg4@@35) RefType) (= (type arg4_2@@1) RefType)) (= (wand_2 arg1@@49 arg2@@42 arg3@@40 arg4@@35 arg5@@25) (wand_2 arg1_2@@1 arg2_2@@1 arg3_2@@1 arg4_2@@1 arg5_2@@1))) (and (= arg1@@49 arg1_2@@1) (and (= arg2@@42 arg2_2@@1) (and (= arg3@@40 arg3_2@@1) (and (= arg4@@35 arg4_2@@1) (= arg5@@25 arg5_2@@1))))))
 :qid |stdinbpl.402:15|
 :skolemid |70|
 :pattern ( (wand_2 arg1@@49 arg2@@42 arg3@@40 arg4@@35 arg5@@25) (wand_2 arg1_2@@1 arg2_2@@1 arg3_2@@1 arg4_2@@1 arg5_2@@1))
)))
(assert (forall ((arg1@@50 Bool) (arg2@@43 Bool) (arg3@@41 T@U) (arg4@@36 Real) (arg5@@26 T@U) (arg6@@9 Real) ) (!  (=> (and (= (type arg3@@41) RefType) (= (type arg5@@26) RefType)) (= (getPredWandId (wand_4 arg1@@50 arg2@@43 arg3@@41 arg4@@36 arg5@@26 arg6@@9)) 4))
 :qid |stdinbpl.206:15|
 :skolemid |27|
 :pattern ( (wand_4 arg1@@50 arg2@@43 arg3@@41 arg4@@36 arg5@@26 arg6@@9))
)))
(assert (forall ((arg1@@51 Bool) (arg2@@44 Bool) (arg3@@42 T@U) (arg4@@37 Real) (arg5@@27 T@U) (arg6@@10 Real) ) (!  (=> (and (= (type arg3@@42) RefType) (= (type arg5@@27) RefType)) (= (getPredWandId (wand_5 arg1@@51 arg2@@44 arg3@@42 arg4@@37 arg5@@27 arg6@@10)) 7))
 :qid |stdinbpl.302:15|
 :skolemid |48|
 :pattern ( (wand_5 arg1@@51 arg2@@44 arg3@@42 arg4@@37 arg5@@27 arg6@@10))
)))
(assert (forall ((o_2@@1 T@U) (f_4@@1 T@U) ) (! (let ((B@@5 (FieldTypeInv1 (type f_4@@1))))
(let ((A@@5 (FieldTypeInv0 (type f_4@@1))))
 (=> (and (= (type o_2@@1) RefType) (= (type f_4@@1) (FieldType A@@5 B@@5))) (= (U_2_real (MapType1Select ZeroMask o_2@@1 f_4@@1)) NoPerm))))
 :qid |stdinbpl.106:22|
 :skolemid |13|
 :pattern ( (MapType1Select ZeroMask o_2@@1 f_4@@1))
)))
(assert (forall ((arg1@@52 Bool) (arg2@@45 Bool) (arg3@@43 T@U) (arg4@@38 Real) (arg5@@28 T@U) (arg6@@11 Real) ) (!  (=> (and (= (type arg3@@43) RefType) (= (type arg5@@28) RefType)) (IsWandField (wand_4 arg1@@52 arg2@@45 arg3@@43 arg4@@38 arg5@@28 arg6@@11)))
 :qid |stdinbpl.186:15|
 :skolemid |22|
 :pattern ( (wand_4 arg1@@52 arg2@@45 arg3@@43 arg4@@38 arg5@@28 arg6@@11))
)))
(assert (forall ((arg1@@53 Bool) (arg2@@46 Bool) (arg3@@44 T@U) (arg4@@39 Real) (arg5@@29 T@U) (arg6@@12 Real) ) (!  (=> (and (= (type arg3@@44) RefType) (= (type arg5@@29) RefType)) (IsWandField (|wand_4#ft| arg1@@53 arg2@@46 arg3@@44 arg4@@39 arg5@@29 arg6@@12)))
 :qid |stdinbpl.190:15|
 :skolemid |23|
 :pattern ( (|wand_4#ft| arg1@@53 arg2@@46 arg3@@44 arg4@@39 arg5@@29 arg6@@12))
)))
(assert (forall ((arg1@@54 Bool) (arg2@@47 Bool) (arg3@@45 T@U) (arg4@@40 Real) (arg5@@30 T@U) (arg6@@13 Real) ) (!  (=> (and (= (type arg3@@45) RefType) (= (type arg5@@30) RefType)) (IsWandField (wand_5 arg1@@54 arg2@@47 arg3@@45 arg4@@40 arg5@@30 arg6@@13)))
 :qid |stdinbpl.282:15|
 :skolemid |43|
 :pattern ( (wand_5 arg1@@54 arg2@@47 arg3@@45 arg4@@40 arg5@@30 arg6@@13))
)))
(assert (forall ((arg1@@55 Bool) (arg2@@48 Bool) (arg3@@46 T@U) (arg4@@41 Real) (arg5@@31 T@U) (arg6@@14 Real) ) (!  (=> (and (= (type arg3@@46) RefType) (= (type arg5@@31) RefType)) (IsWandField (|wand_5#ft| arg1@@55 arg2@@48 arg3@@46 arg4@@41 arg5@@31 arg6@@14)))
 :qid |stdinbpl.286:15|
 :skolemid |44|
 :pattern ( (|wand_5#ft| arg1@@55 arg2@@48 arg3@@46 arg4@@41 arg5@@31 arg6@@14))
)))
(assert (forall ((arg1@@56 Bool) (arg2@@49 Bool) (arg3@@47 T@U) (arg4@@42 Real) (arg5@@32 T@U) (arg6@@15 Real) ) (!  (=> (and (= (type arg3@@47) RefType) (= (type arg5@@32) RefType)) (not (IsPredicateField (wand_4 arg1@@56 arg2@@49 arg3@@47 arg4@@42 arg5@@32 arg6@@15))))
 :qid |stdinbpl.194:15|
 :skolemid |24|
 :pattern ( (wand_4 arg1@@56 arg2@@49 arg3@@47 arg4@@42 arg5@@32 arg6@@15))
)))
(assert (forall ((arg1@@57 Bool) (arg2@@50 Bool) (arg3@@48 T@U) (arg4@@43 Real) (arg5@@33 T@U) (arg6@@16 Real) ) (!  (=> (and (= (type arg3@@48) RefType) (= (type arg5@@33) RefType)) (not (IsPredicateField (|wand_4#ft| arg1@@57 arg2@@50 arg3@@48 arg4@@43 arg5@@33 arg6@@16))))
 :qid |stdinbpl.198:15|
 :skolemid |25|
 :pattern ( (|wand_4#ft| arg1@@57 arg2@@50 arg3@@48 arg4@@43 arg5@@33 arg6@@16))
)))
(assert (forall ((arg1@@58 Bool) (arg2@@51 Bool) (arg3@@49 T@U) (arg4@@44 Real) (arg5@@34 T@U) (arg6@@17 Real) ) (!  (=> (and (= (type arg3@@49) RefType) (= (type arg5@@34) RefType)) (not (IsPredicateField (wand_5 arg1@@58 arg2@@51 arg3@@49 arg4@@44 arg5@@34 arg6@@17))))
 :qid |stdinbpl.290:15|
 :skolemid |45|
 :pattern ( (wand_5 arg1@@58 arg2@@51 arg3@@49 arg4@@44 arg5@@34 arg6@@17))
)))
(assert (forall ((arg1@@59 Bool) (arg2@@52 Bool) (arg3@@50 T@U) (arg4@@45 Real) (arg5@@35 T@U) (arg6@@18 Real) ) (!  (=> (and (= (type arg3@@50) RefType) (= (type arg5@@35) RefType)) (not (IsPredicateField (|wand_5#ft| arg1@@59 arg2@@52 arg3@@50 arg4@@45 arg5@@35 arg6@@18))))
 :qid |stdinbpl.294:15|
 :skolemid |46|
 :pattern ( (|wand_5#ft| arg1@@59 arg2@@52 arg3@@50 arg4@@45 arg5@@35 arg6@@18))
)))
(assert (forall ((arg0@@49 Bool) (arg1@@60 Bool) (arg2@@53 T@U) (arg3@@51 Real) (arg4@@46 Bool) ) (! (= (type (|wand_1#sm| arg0@@49 arg1@@60 arg2@@53 arg3@@51 arg4@@46)) (FieldType WandType_wand_1Type (MapType1Type RefType boolType)))
 :qid |funType:wand_1#sm|
 :pattern ( (|wand_1#sm| arg0@@49 arg1@@60 arg2@@53 arg3@@51 arg4@@46))
)))
(assert (forall ((arg1@@61 Bool) (arg2@@54 Bool) (arg3@@52 T@U) (arg4@@47 Real) (arg5@@36 Bool) ) (!  (=> (= (type arg3@@52) RefType) (= (|wand_1#sm| arg1@@61 arg2@@54 arg3@@52 arg4@@47 arg5@@36) (WandMaskField (|wand_1#ft| arg1@@61 arg2@@54 arg3@@52 arg4@@47 arg5@@36))))
 :qid |stdinbpl.362:15|
 :skolemid |61|
 :pattern ( (WandMaskField (|wand_1#ft| arg1@@61 arg2@@54 arg3@@52 arg4@@47 arg5@@36)))
)))
(assert (forall ((arg0@@50 Bool) (arg1@@62 Bool) (arg2@@55 Bool) (arg3@@53 T@U) (arg4@@48 Real) ) (! (= (type (|wand_2#sm| arg0@@50 arg1@@62 arg2@@55 arg3@@53 arg4@@48)) (FieldType WandType_wand_2Type (MapType1Type RefType boolType)))
 :qid |funType:wand_2#sm|
 :pattern ( (|wand_2#sm| arg0@@50 arg1@@62 arg2@@55 arg3@@53 arg4@@48))
)))
(assert (forall ((arg1@@63 Bool) (arg2@@56 Bool) (arg3@@54 Bool) (arg4@@49 T@U) (arg5@@37 Real) ) (!  (=> (= (type arg4@@49) RefType) (= (|wand_2#sm| arg1@@63 arg2@@56 arg3@@54 arg4@@49 arg5@@37) (WandMaskField (|wand_2#ft| arg1@@63 arg2@@56 arg3@@54 arg4@@49 arg5@@37))))
 :qid |stdinbpl.394:15|
 :skolemid |68|
 :pattern ( (WandMaskField (|wand_2#ft| arg1@@63 arg2@@56 arg3@@54 arg4@@49 arg5@@37)))
)))
(assert  (and (= (Ctor WandType_wand_3Type) 22) (forall ((arg0@@51 Bool) (arg1@@64 Bool) (arg2@@57 T@U) (arg3@@55 Real) (arg4@@50 Bool) (arg5@@38 T@U) (arg6@@19 Real) ) (! (= (type (wand_3 arg0@@51 arg1@@64 arg2@@57 arg3@@55 arg4@@50 arg5@@38 arg6@@19)) (FieldType WandType_wand_3Type intType))
 :qid |funType:wand_3|
 :pattern ( (wand_3 arg0@@51 arg1@@64 arg2@@57 arg3@@55 arg4@@50 arg5@@38 arg6@@19))
))))
(assert (forall ((arg1@@65 Bool) (arg2@@58 Bool) (arg3@@56 T@U) (arg4@@51 Real) (arg5@@39 Bool) (arg6@@20 T@U) (arg7@@5 Real) (arg1_2@@2 Bool) (arg2_2@@2 Bool) (arg3_2@@2 T@U) (arg4_2@@2 Real) (arg5_2@@2 Bool) (arg6_2@@1 T@U) (arg7_2 Real) ) (!  (=> (and (and (and (and (= (type arg3@@56) RefType) (= (type arg6@@20) RefType)) (= (type arg3_2@@2) RefType)) (= (type arg6_2@@1) RefType)) (= (wand_3 arg1@@65 arg2@@58 arg3@@56 arg4@@51 arg5@@39 arg6@@20 arg7@@5) (wand_3 arg1_2@@2 arg2_2@@2 arg3_2@@2 arg4_2@@2 arg5_2@@2 arg6_2@@1 arg7_2))) (and (= arg1@@65 arg1_2@@2) (and (= arg2@@58 arg2_2@@2) (and (= arg3@@56 arg3_2@@2) (and (= arg4@@51 arg4_2@@2) (and (= arg5@@39 arg5_2@@2) (and (= arg6@@20 arg6_2@@1) (= arg7@@5 arg7_2))))))))
 :qid |stdinbpl.274:15|
 :skolemid |42|
 :pattern ( (wand_3 arg1@@65 arg2@@58 arg3@@56 arg4@@51 arg5@@39 arg6@@20 arg7@@5) (wand_3 arg1_2@@2 arg2_2@@2 arg3_2@@2 arg4_2@@2 arg5_2@@2 arg6_2@@1 arg7_2))
)))
(assert (forall ((arg1@@66 T@U) (arg2@@59 Real) (arg3@@57 T@U) (arg4@@52 Real) (arg5@@40 Bool) (arg6@@21 T@U) (arg7@@6 Real) (arg8@@5 T@U) (arg9@@3 Real) ) (!  (=> (and (and (and (= (type arg1@@66) RefType) (= (type arg3@@57) RefType)) (= (type arg6@@21) RefType)) (= (type arg8@@5) RefType)) (= (getPredWandId (wand_6 arg1@@66 arg2@@59 arg3@@57 arg4@@52 arg5@@40 arg6@@21 arg7@@6 arg8@@5 arg9@@3)) 8))
 :qid |stdinbpl.334:15|
 :skolemid |55|
 :pattern ( (wand_6 arg1@@66 arg2@@59 arg3@@57 arg4@@52 arg5@@40 arg6@@21 arg7@@6 arg8@@5 arg9@@3))
)))
(assert (forall ((Heap@@11 T@U) (ExhaleHeap@@4 T@U) (Mask@@7 T@U) (pm_f@@1 T@U) ) (! (let ((C@@1 (FieldTypeInv0 (type pm_f@@1))))
 (=> (and (and (and (and (and (= (type Heap@@11) (MapType0Type RefType)) (= (type ExhaleHeap@@4) (MapType0Type RefType))) (= (type Mask@@7) (MapType1Type RefType realType))) (= (type pm_f@@1) (FieldType C@@1 FrameTypeType))) (IdenticalOnKnownLocations Heap@@11 ExhaleHeap@@4 Mask@@7)) (and (HasDirectPerm Mask@@7 null pm_f@@1) (IsPredicateField pm_f@@1))) (forall ((o2 T@U) (f_2@@0 T@U) ) (! (let ((B@@6 (FieldTypeInv1 (type f_2@@0))))
(let ((A@@6 (FieldTypeInv0 (type f_2@@0))))
 (=> (and (and (= (type o2) RefType) (= (type f_2@@0) (FieldType A@@6 B@@6))) (U_2_bool (MapType1Select (MapType0Select Heap@@11 null (PredicateMaskField pm_f@@1)) o2 f_2@@0))) (= (MapType0Select Heap@@11 o2 f_2@@0) (MapType0Select ExhaleHeap@@4 o2 f_2@@0)))))
 :qid |stdinbpl.54:134|
 :skolemid |3|
 :pattern ( (MapType0Select ExhaleHeap@@4 o2 f_2@@0))
))))
 :qid |stdinbpl.52:19|
 :skolemid |4|
 :pattern ( (IdenticalOnKnownLocations Heap@@11 ExhaleHeap@@4 Mask@@7) (IsPredicateField pm_f@@1))
)))
(assert (forall ((Heap@@12 T@U) (ExhaleHeap@@5 T@U) (Mask@@8 T@U) (pm_f@@2 T@U) ) (! (let ((C@@2 (FieldTypeInv0 (type pm_f@@2))))
 (=> (and (and (and (and (and (= (type Heap@@12) (MapType0Type RefType)) (= (type ExhaleHeap@@5) (MapType0Type RefType))) (= (type Mask@@8) (MapType1Type RefType realType))) (= (type pm_f@@2) (FieldType C@@2 FrameTypeType))) (IdenticalOnKnownLocations Heap@@12 ExhaleHeap@@5 Mask@@8)) (and (HasDirectPerm Mask@@8 null pm_f@@2) (IsWandField pm_f@@2))) (forall ((o2@@0 T@U) (f_2@@1 T@U) ) (! (let ((B@@7 (FieldTypeInv1 (type f_2@@1))))
(let ((A@@7 (FieldTypeInv0 (type f_2@@1))))
 (=> (and (and (= (type o2@@0) RefType) (= (type f_2@@1) (FieldType A@@7 B@@7))) (U_2_bool (MapType1Select (MapType0Select Heap@@12 null (WandMaskField pm_f@@2)) o2@@0 f_2@@1))) (= (MapType0Select Heap@@12 o2@@0 f_2@@1) (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1)))))
 :qid |stdinbpl.67:129|
 :skolemid |6|
 :pattern ( (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1))
))))
 :qid |stdinbpl.65:19|
 :skolemid |7|
 :pattern ( (IdenticalOnKnownLocations Heap@@12 ExhaleHeap@@5 Mask@@8) (IsWandField pm_f@@2))
)))
(assert (forall ((x@@26 T@U) ) (!  (=> (= (type x@@26) RefType) (= (getPredWandId (M x@@26)) 0))
 :qid |stdinbpl.486:15|
 :skolemid |77|
 :pattern ( (M x@@26))
)))
(assert (forall ((x@@27 T@U) ) (!  (=> (= (type x@@27) RefType) (= (getPredWandId (B@@1 x@@27)) 1))
 :qid |stdinbpl.535:15|
 :skolemid |83|
 :pattern ( (B@@1 x@@27))
)))
(assert (forall ((x@@28 T@U) ) (!  (=> (= (type x@@28) RefType) (= (getPredWandId (T x@@28)) 2))
 :qid |stdinbpl.589:15|
 :skolemid |89|
 :pattern ( (T x@@28))
)))
(assert (forall ((x@@29 T@U) ) (!  (=> (= (type x@@29) RefType) (= (getPredWandId (E x@@29)) 3))
 :qid |stdinbpl.638:15|
 :skolemid |95|
 :pattern ( (E x@@29))
)))
(assert (forall ((Mask@@9 T@U) (o_2@@2 T@U) (f_4@@2 T@U) ) (! (let ((B@@8 (FieldTypeInv1 (type f_4@@2))))
(let ((A@@8 (FieldTypeInv0 (type f_4@@2))))
 (=> (and (and (and (= (type Mask@@9) (MapType1Type RefType realType)) (= (type o_2@@2) RefType)) (= (type f_4@@2) (FieldType A@@8 B@@8))) (GoodMask Mask@@9)) (and (>= (U_2_real (MapType1Select Mask@@9 o_2@@2 f_4@@2)) NoPerm) (=> (and (and (GoodMask Mask@@9) (not (IsPredicateField f_4@@2))) (not (IsWandField f_4@@2))) (<= (U_2_real (MapType1Select Mask@@9 o_2@@2 f_4@@2)) FullPerm))))))
 :qid |stdinbpl.128:22|
 :skolemid |16|
 :pattern ( (GoodMask Mask@@9) (MapType1Select Mask@@9 o_2@@2 f_4@@2))
)))
(assert (forall ((arg0@@52 T@U) (arg1@@67 Real) (arg2@@60 T@U) (arg3@@58 Real) (arg4@@53 Bool) (arg5@@41 T@U) (arg6@@22 Real) (arg7@@7 T@U) (arg8@@6 Real) ) (! (= (type (|wand_6#sm| arg0@@52 arg1@@67 arg2@@60 arg3@@58 arg4@@53 arg5@@41 arg6@@22 arg7@@7 arg8@@6)) (FieldType WandType_wand_6Type (MapType1Type RefType boolType)))
 :qid |funType:wand_6#sm|
 :pattern ( (|wand_6#sm| arg0@@52 arg1@@67 arg2@@60 arg3@@58 arg4@@53 arg5@@41 arg6@@22 arg7@@7 arg8@@6))
)))
(assert (forall ((arg1@@68 T@U) (arg2@@61 Real) (arg3@@59 T@U) (arg4@@54 Real) (arg5@@42 Bool) (arg6@@23 T@U) (arg7@@8 Real) (arg8@@7 T@U) (arg9@@4 Real) ) (!  (=> (and (and (and (= (type arg1@@68) RefType) (= (type arg3@@59) RefType)) (= (type arg6@@23) RefType)) (= (type arg8@@7) RefType)) (= (|wand_6#sm| arg1@@68 arg2@@61 arg3@@59 arg4@@54 arg5@@42 arg6@@23 arg7@@8 arg8@@7 arg9@@4) (WandMaskField (|wand_6#ft| arg1@@68 arg2@@61 arg3@@59 arg4@@54 arg5@@42 arg6@@23 arg7@@8 arg8@@7 arg9@@4))))
 :qid |stdinbpl.330:15|
 :skolemid |54|
 :pattern ( (WandMaskField (|wand_6#ft| arg1@@68 arg2@@61 arg3@@59 arg4@@54 arg5@@42 arg6@@23 arg7@@8 arg8@@7 arg9@@4)))
)))
(assert (forall ((o T@U) (f T@U) (Heap@@13 T@U) ) (!  (=> (and (and (and (= (type o) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap@@13) (MapType0Type RefType))) (U_2_bool (MapType0Select Heap@@13 o $allocated))) (U_2_bool (MapType0Select Heap@@13 (MapType0Select Heap@@13 o f) $allocated)))
 :qid |stdinbpl.31:15|
 :skolemid |0|
 :pattern ( (MapType0Select Heap@@13 o f))
)))
(assert (forall ((x@@30 T@U) ) (!  (=> (= (type x@@30) RefType) (= (PredicateMaskField (M x@@30)) (|M#sm| x@@30)))
 :qid |stdinbpl.478:15|
 :skolemid |75|
 :pattern ( (PredicateMaskField (M x@@30)))
)))
(assert (forall ((x@@31 T@U) ) (!  (=> (= (type x@@31) RefType) (= (PredicateMaskField (B@@1 x@@31)) (|B#sm| x@@31)))
 :qid |stdinbpl.527:15|
 :skolemid |81|
 :pattern ( (PredicateMaskField (B@@1 x@@31)))
)))
(assert (forall ((x@@32 T@U) ) (!  (=> (= (type x@@32) RefType) (= (PredicateMaskField (T x@@32)) (|T#sm| x@@32)))
 :qid |stdinbpl.581:15|
 :skolemid |87|
 :pattern ( (PredicateMaskField (T x@@32)))
)))
(assert (forall ((x@@33 T@U) ) (!  (=> (= (type x@@33) RefType) (= (PredicateMaskField (E x@@33)) (|E#sm| x@@33)))
 :qid |stdinbpl.630:15|
 :skolemid |93|
 :pattern ( (PredicateMaskField (E x@@33)))
)))
(assert (forall ((Heap@@14 T@U) (o@@0 T@U) (f_3 T@U) (v T@U) ) (! (let ((B@@9 (type v)))
(let ((A@@9 (FieldTypeInv0 (type f_3))))
 (=> (and (and (= (type Heap@@14) (MapType0Type RefType)) (= (type o@@0) RefType)) (= (type f_3) (FieldType A@@9 B@@9))) (succHeap Heap@@14 (MapType0Store Heap@@14 o@@0 f_3 v)))))
 :qid |stdinbpl.78:22|
 :skolemid |9|
 :pattern ( (MapType0Store Heap@@14 o@@0 f_3 v))
)))
(assert  (and (forall ((arg0@@53 Bool) (arg1@@69 Bool) (arg2@@62 T@U) (arg3@@60 Real) (arg4@@55 Bool) (arg5@@43 T@U) (arg6@@24 Real) ) (! (= (type (|wand_3#ft| arg0@@53 arg1@@69 arg2@@62 arg3@@60 arg4@@55 arg5@@43 arg6@@24)) (FieldType WandType_wand_3Type FrameTypeType))
 :qid |funType:wand_3#ft|
 :pattern ( (|wand_3#ft| arg0@@53 arg1@@69 arg2@@62 arg3@@60 arg4@@55 arg5@@43 arg6@@24))
)) (forall ((arg0@@54 Bool) (arg1@@70 Bool) (arg2@@63 T@U) (arg3@@61 Real) (arg4@@56 Bool) (arg5@@44 T@U) (arg6@@25 Real) ) (! (= (type (|wand_3#sm| arg0@@54 arg1@@70 arg2@@63 arg3@@61 arg4@@56 arg5@@44 arg6@@25)) (FieldType WandType_wand_3Type (MapType1Type RefType boolType)))
 :qid |funType:wand_3#sm|
 :pattern ( (|wand_3#sm| arg0@@54 arg1@@70 arg2@@63 arg3@@61 arg4@@56 arg5@@44 arg6@@25))
))))
(assert (forall ((arg1@@71 Bool) (arg2@@64 Bool) (arg3@@62 T@U) (arg4@@57 Real) (arg5@@45 Bool) (arg6@@26 T@U) (arg7@@9 Real) ) (!  (=> (and (= (type arg3@@62) RefType) (= (type arg6@@26) RefType)) (= (|wand_3#sm| arg1@@71 arg2@@64 arg3@@62 arg4@@57 arg5@@45 arg6@@26 arg7@@9) (WandMaskField (|wand_3#ft| arg1@@71 arg2@@64 arg3@@62 arg4@@57 arg5@@45 arg6@@26 arg7@@9))))
 :qid |stdinbpl.266:15|
 :skolemid |40|
 :pattern ( (WandMaskField (|wand_3#ft| arg1@@71 arg2@@64 arg3@@62 arg4@@57 arg5@@45 arg6@@26 arg7@@9)))
)))
(assert (= (type ZeroPMask) (MapType1Type RefType boolType)))
(assert (forall ((o_2@@3 T@U) (f_4@@3 T@U) ) (! (let ((B@@10 (FieldTypeInv1 (type f_4@@3))))
(let ((A@@10 (FieldTypeInv0 (type f_4@@3))))
 (=> (and (= (type o_2@@3) RefType) (= (type f_4@@3) (FieldType A@@10 B@@10))) (not (U_2_bool (MapType1Select ZeroPMask o_2@@3 f_4@@3))))))
 :qid |stdinbpl.112:22|
 :skolemid |14|
 :pattern ( (MapType1Select ZeroPMask o_2@@3 f_4@@3))
)))
(assert (forall ((Heap@@15 T@U) (Mask@@10 T@U) (x@@34 T@U) (i@@1 Int) ) (!  (=> (and (and (and (= (type Heap@@15) (MapType0Type RefType)) (= (type Mask@@10) (MapType1Type RefType realType))) (= (type x@@34) RefType)) (and (state Heap@@15 Mask@@10) (< AssumeFunctionsAbove 0))) (= (get Heap@@15 x@@34 i@@1) (not (= i@@1 0))))
 :qid |stdinbpl.438:15|
 :skolemid |73|
 :pattern ( (state Heap@@15 Mask@@10) (get Heap@@15 x@@34 i@@1))
)))
(assert (forall ((p@@1 T@U) (v_1@@0 T@U) (q T@U) (w@@0 T@U) (r T@U) (u T@U) ) (! (let ((C@@3 (FieldTypeInv0 (type r))))
(let ((B@@11 (FieldTypeInv0 (type q))))
(let ((A@@11 (FieldTypeInv0 (type p@@1))))
 (=> (and (and (and (and (and (and (= (type p@@1) (FieldType A@@11 FrameTypeType)) (= (type v_1@@0) FrameTypeType)) (= (type q) (FieldType B@@11 FrameTypeType))) (= (type w@@0) FrameTypeType)) (= (type r) (FieldType C@@3 FrameTypeType))) (= (type u) FrameTypeType)) (and (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))) (InsidePredicate p@@1 v_1@@0 r u)))))
 :qid |stdinbpl.168:25|
 :skolemid |20|
 :pattern ( (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))
)))
(assert (forall ((arg1@@72 Bool) (arg2@@65 Bool) (arg3@@63 T@U) (arg4@@58 Real) (arg5@@46 Bool) (arg6@@27 T@U) (arg7@@10 Real) ) (!  (=> (and (= (type arg3@@63) RefType) (= (type arg6@@27) RefType)) (IsWandField (wand_3 arg1@@72 arg2@@65 arg3@@63 arg4@@58 arg5@@46 arg6@@27 arg7@@10)))
 :qid |stdinbpl.250:15|
 :skolemid |36|
 :pattern ( (wand_3 arg1@@72 arg2@@65 arg3@@63 arg4@@58 arg5@@46 arg6@@27 arg7@@10))
)))
(assert (forall ((arg1@@73 Bool) (arg2@@66 Bool) (arg3@@64 T@U) (arg4@@59 Real) (arg5@@47 Bool) (arg6@@28 T@U) (arg7@@11 Real) ) (!  (=> (and (= (type arg3@@64) RefType) (= (type arg6@@28) RefType)) (IsWandField (|wand_3#ft| arg1@@73 arg2@@66 arg3@@64 arg4@@59 arg5@@47 arg6@@28 arg7@@11)))
 :qid |stdinbpl.254:15|
 :skolemid |37|
 :pattern ( (|wand_3#ft| arg1@@73 arg2@@66 arg3@@64 arg4@@59 arg5@@47 arg6@@28 arg7@@11))
)))
(assert (forall ((arg1@@74 Bool) (arg2@@67 Bool) (arg3@@65 T@U) (arg4@@60 Real) (arg5@@48 Bool) (arg6@@29 T@U) (arg7@@12 Real) ) (!  (=> (and (= (type arg3@@65) RefType) (= (type arg6@@29) RefType)) (not (IsPredicateField (wand_3 arg1@@74 arg2@@67 arg3@@65 arg4@@60 arg5@@48 arg6@@29 arg7@@12))))
 :qid |stdinbpl.258:15|
 :skolemid |38|
 :pattern ( (wand_3 arg1@@74 arg2@@67 arg3@@65 arg4@@60 arg5@@48 arg6@@29 arg7@@12))
)))
(assert (forall ((arg1@@75 Bool) (arg2@@68 Bool) (arg3@@66 T@U) (arg4@@61 Real) (arg5@@49 Bool) (arg6@@30 T@U) (arg7@@13 Real) ) (!  (=> (and (= (type arg3@@66) RefType) (= (type arg6@@30) RefType)) (not (IsPredicateField (|wand_3#ft| arg1@@75 arg2@@68 arg3@@66 arg4@@61 arg5@@49 arg6@@30 arg7@@13))))
 :qid |stdinbpl.262:15|
 :skolemid |39|
 :pattern ( (|wand_3#ft| arg1@@75 arg2@@68 arg3@@66 arg4@@61 arg5@@49 arg6@@30 arg7@@13))
)))
(assert (forall ((arg1@@76 Bool) (arg2@@69 Bool) (arg3@@67 T@U) (arg4@@62 Real) (arg5@@50 Bool) (arg6@@31 T@U) (arg7@@14 Real) ) (!  (=> (and (= (type arg3@@67) RefType) (= (type arg6@@31) RefType)) (= (getPredWandId (wand_3 arg1@@76 arg2@@69 arg3@@67 arg4@@62 arg5@@50 arg6@@31 arg7@@14)) 6))
 :qid |stdinbpl.270:15|
 :skolemid |41|
 :pattern ( (wand_3 arg1@@76 arg2@@69 arg3@@67 arg4@@62 arg5@@50 arg6@@31 arg7@@14))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
(assert (forall ((arg1@@77 T@U) (arg2@@70 Real) (arg3@@68 T@U) (arg4@@63 Real) (arg5@@51 Bool) (arg6@@32 T@U) (arg7@@15 Real) (arg8@@8 T@U) (arg9@@5 Real) (arg1_2@@3 T@U) (arg2_2@@3 Real) (arg3_2@@3 T@U) (arg4_2@@3 Real) (arg5_2@@3 Bool) (arg6_2@@2 T@U) (arg7_2@@0 Real) (arg8_2 T@U) (arg9_2 Real) ) (!  (=> (and (and (and (and (and (and (and (and (= (type arg1@@77) RefType) (= (type arg3@@68) RefType)) (= (type arg6@@32) RefType)) (= (type arg8@@8) RefType)) (= (type arg1_2@@3) RefType)) (= (type arg3_2@@3) RefType)) (= (type arg6_2@@2) RefType)) (= (type arg8_2) RefType)) (= (wand_6 arg1@@77 arg2@@70 arg3@@68 arg4@@63 arg5@@51 arg6@@32 arg7@@15 arg8@@8 arg9@@5) (wand_6 arg1_2@@3 arg2_2@@3 arg3_2@@3 arg4_2@@3 arg5_2@@3 arg6_2@@2 arg7_2@@0 arg8_2 arg9_2))) (and (= arg1@@77 arg1_2@@3) (and (= arg2@@70 arg2_2@@3) (and (= arg3@@68 arg3_2@@3) (and (= arg4@@63 arg4_2@@3) (and (= arg5@@51 arg5_2@@3) (and (= arg6@@32 arg6_2@@2) (and (= arg7@@15 arg7_2@@0) (and (= arg8@@8 arg8_2) (= arg9@@5 arg9_2))))))))))
 :qid |stdinbpl.338:15|
 :skolemid |56|
 :pattern ( (wand_6 arg1@@77 arg2@@70 arg3@@68 arg4@@63 arg5@@51 arg6@@32 arg7@@15 arg8@@8 arg9@@5) (wand_6 arg1_2@@3 arg2_2@@3 arg3_2@@3 arg4_2@@3 arg5_2@@3 arg6_2@@2 arg7_2@@0 arg8_2 arg9_2))
)))
(assert (forall ((arg1@@78 Bool) (arg2@@71 Bool) (arg3@@69 T@U) (arg4@@64 Real) (arg5@@52 Bool) (arg1_2@@4 Bool) (arg2_2@@4 Bool) (arg3_2@@4 T@U) (arg4_2@@4 Real) (arg5_2@@4 Bool) ) (!  (=> (and (and (= (type arg3@@69) RefType) (= (type arg3_2@@4) RefType)) (= (wand_1 arg1@@78 arg2@@71 arg3@@69 arg4@@64 arg5@@52) (wand_1 arg1_2@@4 arg2_2@@4 arg3_2@@4 arg4_2@@4 arg5_2@@4))) (and (= arg1@@78 arg1_2@@4) (and (= arg2@@71 arg2_2@@4) (and (= arg3@@69 arg3_2@@4) (and (= arg4@@64 arg4_2@@4) (= arg5@@52 arg5_2@@4))))))
 :qid |stdinbpl.370:15|
 :skolemid |63|
 :pattern ( (wand_1 arg1@@78 arg2@@71 arg3@@69 arg4@@64 arg5@@52) (wand_1 arg1_2@@4 arg2_2@@4 arg3_2@@4 arg4_2@@4 arg5_2@@4))
)))
(assert (forall ((Heap@@16 T@U) (x@@35 T@U) (i@@2 Int) ) (!  (=> (and (= (type Heap@@16) (MapType0Type RefType)) (= (type x@@35) RefType)) (and (= (get Heap@@16 x@@35 i@@2) (|get'| Heap@@16 x@@35 i@@2)) (dummyFunction (bool_2_U (|get#triggerStateless| x@@35 i@@2)))))
 :qid |stdinbpl.428:15|
 :skolemid |71|
 :pattern ( (get Heap@@16 x@@35 i@@2))
)))
(assert (forall ((arg1@@79 T@U) (arg2@@72 Real) (arg3@@70 T@U) (arg4@@65 Real) (arg1_2@@5 T@U) (arg2_2@@5 Real) (arg3_2@@5 T@U) (arg4_2@@5 Real) ) (!  (=> (and (and (and (and (= (type arg1@@79) RefType) (= (type arg3@@70) RefType)) (= (type arg1_2@@5) RefType)) (= (type arg3_2@@5) RefType)) (= (wand arg1@@79 arg2@@72 arg3@@70 arg4@@65) (wand arg1_2@@5 arg2_2@@5 arg3_2@@5 arg4_2@@5))) (and (= arg1@@79 arg1_2@@5) (and (= arg2@@72 arg2_2@@5) (and (= arg3@@70 arg3_2@@5) (= arg4@@65 arg4_2@@5)))))
 :qid |stdinbpl.242:15|
 :skolemid |35|
 :pattern ( (wand arg1@@79 arg2@@72 arg3@@70 arg4@@65) (wand arg1_2@@5 arg2_2@@5 arg3_2@@5 arg4_2@@5))
)))
(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun i@@3 () Int)
(declare-fun WandDefRHSMask@0 () T@U)
(declare-fun x@@36 () T@U)
(declare-fun WandDefRHSHeap@0 () T@U)
(declare-fun WandDefRHSMask@1 () T@U)
(declare-fun WandDefLHSHeap@0 () T@U)
(declare-fun Mask@4 () T@U)
(declare-fun Heap@2 () T@U)
(declare-fun AssertMask@1 () T@U)
(declare-fun AssertMask@0 () T@U)
(declare-fun Mask@3 () T@U)
(declare-fun b_9@2 () Bool)
(declare-fun b_10@6 () Bool)
(declare-fun neededTransfer@3 () Real)
(declare-fun Used_5Mask@3 () T@U)
(declare-fun initNeededTransfer@0 () Real)
(declare-fun b_11@0 () Bool)
(declare-fun b_11@1 () Bool)
(declare-fun Result_2Heap () T@U)
(declare-fun Result_2Mask () T@U)
(declare-fun b_11@2 () Bool)
(declare-fun Ops_5Mask () T@U)
(declare-fun b_11@3 () Bool)
(declare-fun Ops_5Heap@0 () T@U)
(declare-fun Used_5Heap@0 () T@U)
(declare-fun b_11@4 () Bool)
(declare-fun b_9@3 () Bool)
(declare-fun Mask@2 () T@U)
(declare-fun Heap@1 () T@U)
(declare-fun takeTransfer@1 () Real)
(declare-fun Mask@0 () T@U)
(declare-fun neededTransfer@1 () Real)
(declare-fun b_10@3 () Bool)
(declare-fun Used_5Mask@1 () T@U)
(declare-fun Heap@@17 () T@U)
(declare-fun neededTransfer@2 () Real)
(declare-fun Used_5Mask@2 () T@U)
(declare-fun b_10@4 () Bool)
(declare-fun TempMask@1 () T@U)
(declare-fun b_10@5 () Bool)
(declare-fun Mask@1 () T@U)
(declare-fun newPMask@0 () T@U)
(declare-fun Heap@0 () T@U)
(declare-fun maskTransfer@1 () Real)
(declare-fun takeTransfer@0 () Real)
(declare-fun b_10@0 () Bool)
(declare-fun neededTransfer@0 () Real)
(declare-fun Used_5Mask@0 () T@U)
(declare-fun b_10@1 () Bool)
(declare-fun TempMask@0 () T@U)
(declare-fun b_10@2 () Bool)
(declare-fun Ops_5Mask@0 () T@U)
(declare-fun maskTransfer@0 () Real)
(declare-fun b_9@1 () Bool)
(declare-fun b_9@0 () Bool)
(declare-fun b_10 () Bool)
(declare-fun b_9 () Bool)
(declare-fun b_8@0 () Bool)
(declare-fun b_8 () Bool)
(declare-fun Used_4Heap@0 () T@U)
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (= (type Mask@4) (MapType1Type RefType realType)) (= (type x@@36) RefType)) (= (type Heap@2) (MapType0Type RefType))) (= (type AssertMask@1) (MapType1Type RefType realType))) (= (type AssertMask@0) (MapType1Type RefType realType))) (= (type WandDefRHSMask@1) (MapType1Type RefType realType))) (= (type WandDefRHSMask@0) (MapType1Type RefType realType))) (= (type WandDefRHSHeap@0) (MapType0Type RefType))) (= (type WandDefLHSHeap@0) (MapType0Type RefType))) (= (type Mask@3) (MapType1Type RefType realType))) (= (type Mask@0) (MapType1Type RefType realType))) (= (type Heap@@17) (MapType0Type RefType))) (= (type Used_5Mask@3) (MapType1Type RefType realType))) (= (type Result_2Heap) (MapType0Type RefType))) (= (type Result_2Mask) (MapType1Type RefType realType))) (= (type Ops_5Mask) (MapType1Type RefType realType))) (= (type Ops_5Heap@0) (MapType0Type RefType))) (= (type Used_5Heap@0) (MapType0Type RefType))) (= (type Mask@2) (MapType1Type RefType realType))) (= (type Heap@1) (MapType0Type RefType))) (= (type Used_5Mask@1) (MapType1Type RefType realType))) (= (type Used_5Mask@2) (MapType1Type RefType realType))) (= (type TempMask@1) (MapType1Type RefType realType))) (= (type Mask@1) (MapType1Type RefType realType))) (= (type newPMask@0) (MapType1Type RefType boolType))) (= (type Heap@0) (MapType0Type RefType))) (= (type Used_5Mask@0) (MapType1Type RefType realType))) (= (type TempMask@0) (MapType1Type RefType realType))) (= (type Ops_5Mask@0) (MapType1Type RefType realType))) (= (type Used_4Heap@0) (MapType0Type RefType))))
(set-info :boogie-vc-id test01b)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 42) (let ((anon22_correct true))
(let ((anon40_Else_correct  (=> (not (= i@@3 0)) (=> (and (and (= WandDefRHSMask@0 (MapType1Store ZeroMask null (M x@@36) (real_2_U (+ (U_2_real (MapType1Select ZeroMask null (M x@@36))) FullPerm)))) (state WandDefRHSHeap@0 WandDefRHSMask@0)) (and (= WandDefRHSMask@1 WandDefRHSMask@0) (= (ControlFlow 0 16) 14))) anon22_correct))))
(let ((anon40_Then_correct  (=> (= i@@3 0) (=> (and (= WandDefRHSMask@1 ZeroMask) (= (ControlFlow 0 15) 14)) anon22_correct))))
(let ((anon39_Then_correct  (=> (and (state WandDefLHSHeap@0 ZeroMask) (state WandDefLHSHeap@0 ZeroMask)) (and (=> (= (ControlFlow 0 17) 15) anon40_Then_correct) (=> (= (ControlFlow 0 17) 16) anon40_Else_correct)))))
(let ((anon29_correct true))
(let ((anon43_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 4) 1)) anon29_correct)))
(let ((anon43_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 2) (- 0 3)) (<= FullPerm (U_2_real (MapType1Select Mask@4 null (M x@@36))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@4 null (M x@@36)))) (=> (= (ControlFlow 0 2) 1) anon29_correct))))))
(let ((anon27_correct  (=> (state Heap@2 Mask@4) (and (=> (= (ControlFlow 0 5) 2) anon43_Then_correct) (=> (= (ControlFlow 0 5) 4) anon43_Else_correct)))))
(let ((anon26_correct  (=> (and (= AssertMask@1 (MapType1Store Mask@4 null (M x@@36) (real_2_U (- (U_2_real (MapType1Select Mask@4 null (M x@@36))) FullPerm)))) (= (ControlFlow 0 7) 5)) anon27_correct)))
(let ((anon42_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 10) 7)) anon26_correct)))
(let ((anon42_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 8) (- 0 9)) (<= FullPerm (U_2_real (MapType1Select Mask@4 null (M x@@36))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@4 null (M x@@36)))) (=> (= (ControlFlow 0 8) 7) anon26_correct))))))
(let ((anon41_Then_correct  (=> (= i@@3 0) (and (=> (= (ControlFlow 0 11) 8) anon42_Then_correct) (=> (= (ControlFlow 0 11) 10) anon42_Else_correct)))))
(let ((anon41_Else_correct  (=> (and (not (= i@@3 0)) (= (ControlFlow 0 6) 5)) anon27_correct)))
(let ((anon39_Else_correct  (and (=> (= (ControlFlow 0 12) (- 0 13)) (<= FullPerm (U_2_real (MapType1Select Mask@4 null (wand_2 true (= i@@3 0) true x@@36 FullPerm))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@4 null (wand_2 true (= i@@3 0) true x@@36 FullPerm)))) (=> (and (= AssertMask@0 (MapType1Store Mask@4 null (wand_2 true (= i@@3 0) true x@@36 FullPerm) (real_2_U (- (U_2_real (MapType1Select Mask@4 null (wand_2 true (= i@@3 0) true x@@36 FullPerm))) FullPerm)))) (state Heap@2 Mask@4)) (and (=> (= (ControlFlow 0 12) 11) anon41_Then_correct) (=> (= (ControlFlow 0 12) 6) anon41_Else_correct)))))))
(let ((anon18_correct  (=> (and (and (= Mask@4 (MapType1Store Mask@3 null (wand_2 true (= i@@3 0) true x@@36 FullPerm) (real_2_U (+ (U_2_real (MapType1Select Mask@3 null (wand_2 true (= i@@3 0) true x@@36 FullPerm))) FullPerm)))) (state Heap@2 Mask@4)) (and (state Heap@2 Mask@4) (state Heap@2 Mask@4))) (and (=> (= (ControlFlow 0 18) 17) anon39_Then_correct) (=> (= (ControlFlow 0 18) 12) anon39_Else_correct)))))
(let ((anon17_correct  (and (=> (= (ControlFlow 0 21) (- 0 22)) (=> (and (and b_9@2 b_9@2) b_10@6) (and (= neededTransfer@3 0.0) (= (U_2_real (MapType1Select Used_5Mask@3 null (M x@@36))) initNeededTransfer@0)))) (=> (=> (and (and b_9@2 b_9@2) b_10@6) (and (= neededTransfer@3 0.0) (= (U_2_real (MapType1Select Used_5Mask@3 null (M x@@36))) initNeededTransfer@0))) (=> (= b_11@0  (and b_9@2 b_10@6)) (=> (and (and (and (= b_11@1  (and b_11@0 (state Result_2Heap Result_2Mask))) (= b_11@2  (and b_11@1 (sumMask Result_2Mask Ops_5Mask Used_5Mask@3)))) (and (= b_11@3  (and (and b_11@2 (IdenticalOnKnownLocations Ops_5Heap@0 Result_2Heap Ops_5Mask)) (IdenticalOnKnownLocations Used_5Heap@0 Result_2Heap Used_5Mask@3))) (= b_11@4  (and b_11@3 (state Result_2Heap Result_2Mask))))) (and (and (= b_9@3  (and b_9@2 b_11@4)) (= Mask@3 Mask@2)) (and (= Heap@2 Heap@1) (= (ControlFlow 0 21) 18)))) anon18_correct))))))
(let ((anon38_Else_correct  (=> (>= 0.0 takeTransfer@1) (=> (and (= Mask@2 Mask@0) (= neededTransfer@3 neededTransfer@1)) (=> (and (and (= b_10@6 b_10@3) (= Used_5Mask@3 Used_5Mask@1)) (and (= Heap@1 Heap@@17) (= (ControlFlow 0 25) 21))) anon17_correct)))))
(let ((anon38_Then_correct  (=> (> takeTransfer@1 0.0) (=> (and (= neededTransfer@2 (- neededTransfer@1 takeTransfer@1)) (= Used_5Mask@2 (MapType1Store Used_5Mask@1 null (M x@@36) (real_2_U (+ (U_2_real (MapType1Select Used_5Mask@1 null (M x@@36))) takeTransfer@1))))) (=> (and (and (= b_10@4  (and b_10@3 (state Used_5Heap@0 Used_5Mask@2))) (= TempMask@1 (MapType1Store ZeroMask null (M x@@36) (real_2_U FullPerm)))) (and (= b_10@5  (and b_10@4 (IdenticalOnKnownLocations Heap@@17 Used_5Heap@0 TempMask@1))) (= Mask@1 (MapType1Store Mask@0 null (M x@@36) (real_2_U (- (U_2_real (MapType1Select Mask@0 null (M x@@36))) takeTransfer@1)))))) (=> (and (and (and (forall ((o_4 T@U) (f_9 T@U) ) (! (let ((B@@12 (FieldTypeInv1 (type f_9))))
(let ((A@@12 (FieldTypeInv0 (type f_9))))
 (=> (and (and (= (type o_4) RefType) (= (type f_9) (FieldType A@@12 B@@12))) (or (U_2_bool (MapType1Select (MapType0Select Heap@@17 null (|wand_2#sm| true (= i@@3 0) true x@@36 FullPerm)) o_4 f_9)) (U_2_bool (MapType1Select (MapType0Select Heap@@17 null (|M#sm| x@@36)) o_4 f_9)))) (U_2_bool (MapType1Select newPMask@0 o_4 f_9)))))
 :qid |stdinbpl.1185:39|
 :skolemid |100|
 :pattern ( (MapType1Select newPMask@0 o_4 f_9))
)) (= Heap@0 (MapType0Store Heap@@17 null (|wand_2#sm| true (= i@@3 0) true x@@36 FullPerm) newPMask@0))) (and (= Mask@2 Mask@1) (= neededTransfer@3 neededTransfer@2))) (and (and (= b_10@6 b_10@5) (= Used_5Mask@3 Used_5Mask@2)) (and (= Heap@1 Heap@0) (= (ControlFlow 0 24) 21)))) anon17_correct))))))
(let ((anon37_Else_correct  (=> (and (< maskTransfer@1 neededTransfer@1) (= takeTransfer@1 maskTransfer@1)) (and (=> (= (ControlFlow 0 27) 24) anon38_Then_correct) (=> (= (ControlFlow 0 27) 25) anon38_Else_correct)))))
(let ((anon37_Then_correct  (=> (and (<= neededTransfer@1 maskTransfer@1) (= takeTransfer@1 neededTransfer@1)) (and (=> (= (ControlFlow 0 26) 24) anon38_Then_correct) (=> (= (ControlFlow 0 26) 25) anon38_Else_correct)))))
(let ((anon36_Then_correct  (=> (and (and (and (and (and b_9@2 b_9@2) b_10@3) true) (> neededTransfer@1 0.0)) (= maskTransfer@1 (U_2_real (MapType1Select Mask@0 null (M x@@36))))) (and (=> (= (ControlFlow 0 28) 26) anon37_Then_correct) (=> (= (ControlFlow 0 28) 27) anon37_Else_correct)))))
(let ((anon36_Else_correct  (=> (not (and (and (and (and b_9@2 b_9@2) b_10@3) true) (> neededTransfer@1 0.0))) (=> (and (= Mask@2 Mask@0) (= neededTransfer@3 neededTransfer@1)) (=> (and (and (= b_10@6 b_10@3) (= Used_5Mask@3 Used_5Mask@1)) (and (= Heap@1 Heap@@17) (= (ControlFlow 0 23) 21))) anon17_correct)))))
(let ((anon35_Else_correct  (=> (and (and (>= 0.0 takeTransfer@0) (= Used_5Mask@1 ZeroMask)) (and (= b_10@3 b_10@0) (= neededTransfer@1 FullPerm))) (and (=> (= (ControlFlow 0 31) 28) anon36_Then_correct) (=> (= (ControlFlow 0 31) 23) anon36_Else_correct)))))
(let ((anon35_Then_correct  (=> (and (> takeTransfer@0 0.0) (= neededTransfer@0 (- FullPerm takeTransfer@0))) (=> (and (and (and (= Used_5Mask@0 (MapType1Store ZeroMask null (M x@@36) (real_2_U (+ (U_2_real (MapType1Select ZeroMask null (M x@@36))) takeTransfer@0)))) (= b_10@1  (and b_10@0 (state Used_5Heap@0 Used_5Mask@0)))) (and (= TempMask@0 (MapType1Store ZeroMask null (M x@@36) (real_2_U FullPerm))) (= b_10@2  (and b_10@1 (IdenticalOnKnownLocations Ops_5Heap@0 Used_5Heap@0 TempMask@0))))) (and (and (= Ops_5Mask@0 (MapType1Store ZeroMask null (M x@@36) (real_2_U (- (U_2_real (MapType1Select ZeroMask null (M x@@36))) takeTransfer@0)))) (= Used_5Mask@1 Used_5Mask@0)) (and (= b_10@3 b_10@2) (= neededTransfer@1 neededTransfer@0)))) (and (=> (= (ControlFlow 0 30) 28) anon36_Then_correct) (=> (= (ControlFlow 0 30) 23) anon36_Else_correct))))))
(let ((anon34_Else_correct  (=> (and (< maskTransfer@0 FullPerm) (= takeTransfer@0 maskTransfer@0)) (and (=> (= (ControlFlow 0 33) 30) anon35_Then_correct) (=> (= (ControlFlow 0 33) 31) anon35_Else_correct)))))
(let ((anon34_Then_correct  (=> (and (<= FullPerm maskTransfer@0) (= takeTransfer@0 FullPerm)) (and (=> (= (ControlFlow 0 32) 30) anon35_Then_correct) (=> (= (ControlFlow 0 32) 31) anon35_Else_correct)))))
(let ((anon33_Then_correct  (=> (and (and (and (and (and b_9@2 b_9@2) b_10@0) true) (> FullPerm 0.0)) (= maskTransfer@0 (U_2_real (MapType1Select ZeroMask null (M x@@36))))) (and (=> (= (ControlFlow 0 34) 32) anon34_Then_correct) (=> (= (ControlFlow 0 34) 33) anon34_Else_correct)))))
(let ((anon33_Else_correct  (=> (and (and (not (and (and (and (and b_9@2 b_9@2) b_10@0) true) (> FullPerm 0.0))) (= Used_5Mask@1 ZeroMask)) (and (= b_10@3 b_10@0) (= neededTransfer@1 FullPerm))) (and (=> (= (ControlFlow 0 29) 28) anon36_Then_correct) (=> (= (ControlFlow 0 29) 23) anon36_Else_correct)))))
(let ((anon32_Else_correct  (=> (and (not (= i@@3 0)) (= initNeededTransfer@0 (+ (U_2_real (MapType1Select ZeroMask null (M x@@36))) FullPerm))) (and (=> (= (ControlFlow 0 35) (- 0 36)) (>= FullPerm 0.0)) (=> (>= FullPerm 0.0) (and (=> (= (ControlFlow 0 35) 34) anon33_Then_correct) (=> (= (ControlFlow 0 35) 29) anon33_Else_correct)))))))
(let ((anon32_Then_correct  (=> (and (and (= i@@3 0) (= Mask@3 Mask@0)) (and (= Heap@2 Heap@@17) (= (ControlFlow 0 20) 18))) anon18_correct)))
(let ((anon31_Then_correct  (=> (and b_9@2 b_9@2) (and (=> (= (ControlFlow 0 37) 20) anon32_Then_correct) (=> (= (ControlFlow 0 37) 35) anon32_Else_correct)))))
(let ((anon31_Else_correct  (=> (and (and (not (and b_9@2 b_9@2)) (= Mask@3 Mask@0)) (and (= Heap@2 Heap@@17) (= (ControlFlow 0 19) 18))) anon18_correct)))
(let ((anon2_correct  (=> (= b_9@1  (and b_9@0 (state Ops_5Heap@0 ZeroMask))) (=> (and (= b_9@2  (and b_9@1 (state Ops_5Heap@0 ZeroMask))) (= b_10@0  (and b_10 (state Used_5Heap@0 ZeroMask)))) (and (=> (= (ControlFlow 0 38) 37) anon31_Then_correct) (=> (= (ControlFlow 0 38) 19) anon31_Else_correct))))))
(let ((anon30_Else_correct  (=> (and (not b_9@0) (= (ControlFlow 0 40) 38)) anon2_correct)))
(let ((anon30_Then_correct  (=> (and b_9@0 (= (ControlFlow 0 39) 38)) anon2_correct)))
(let ((anon0_correct  (=> (and (and (and (state Heap@@17 ZeroMask) (= AssumeFunctionsAbove (- 0 1))) (and (U_2_bool (MapType0Select Heap@@17 x@@36 $allocated)) (= Mask@0 (MapType1Store ZeroMask null (M x@@36) (real_2_U (+ (U_2_real (MapType1Select ZeroMask null (M x@@36))) FullPerm)))))) (and (and (state Heap@@17 Mask@0) (state Heap@@17 Mask@0)) (and (= b_9@0  (and b_9 (state Ops_5Heap@0 ZeroMask))) (= b_8@0  (and b_8 (state Used_4Heap@0 ZeroMask)))))) (and (=> (= (ControlFlow 0 41) 39) anon30_Then_correct) (=> (= (ControlFlow 0 41) 40) anon30_Else_correct)))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 42) 41) anon0_correct)))
PreconditionGeneratedEntry_correct))))))))))))))))))))))))))))))))))))))
))
(check-sat)
(get-info :reason-unknown)
(assert (not (= (ControlFlow 0 2) (- 3))))
(check-sat)
(pop 1)
; Invalid
(get-info :rlimit)
