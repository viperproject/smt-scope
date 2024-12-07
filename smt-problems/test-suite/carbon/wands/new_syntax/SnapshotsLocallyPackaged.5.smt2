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
(declare-fun next () T@U)
(declare-fun FieldType (T@T T@T) T@T)
(declare-fun FieldTypeInv0 (T@T) T@T)
(declare-fun FieldTypeInv1 (T@T) T@T)
(declare-fun NormalFieldType () T@T)
(declare-fun RefType () T@T)
(declare-fun WandMaskField (T@U) T@U)
(declare-fun |wand_5#ft| (T@U Real T@U Real T@U Real T@U Real) T@U)
(declare-fun |wand_5#sm| (T@U Real T@U Real T@U Real T@U Real) T@U)
(declare-fun MapType0Type (T@T T@T) T@T)
(declare-fun MapType0TypeInv0 (T@T) T@T)
(declare-fun MapType0TypeInv1 (T@T) T@T)
(declare-fun MapType0Select (T@U T@U T@U) T@U)
(declare-fun MapType0Store (T@U T@U T@U T@U) T@U)
(declare-fun WandType_wand_5Type () T@T)
(declare-fun FrameTypeType () T@T)
(declare-fun succHeap (T@U T@U) Bool)
(declare-fun MapType1Type (T@T) T@T)
(declare-fun succHeapTrans (T@U T@U) Bool)
(declare-fun MapType1TypeInv0 (T@T) T@T)
(declare-fun MapType1Select (T@U T@U T@U) T@U)
(declare-fun MapType1Store (T@U T@U T@U T@U) T@U)
(declare-fun wand_4 (T@U Real T@U Real) T@U)
(declare-fun getPredWandId (T@U) Int)
(declare-fun WandType_wand_4Type () T@T)
(declare-fun wand (T@U Real T@U Real) T@U)
(declare-fun WandType_wandType () T@T)
(declare-fun wand_3 (T@U Real T@U Real) T@U)
(declare-fun WandType_wand_3Type () T@T)
(declare-fun state (T@U T@U) Bool)
(declare-fun GoodMask (T@U) Bool)
(declare-fun wand_2 (Bool T@U Real) T@U)
(declare-fun IsWandField (T@U) Bool)
(declare-fun WandType_wand_2Type () T@T)
(declare-fun |wand_2#ft| (Bool T@U Real) T@U)
(declare-fun IsPredicateField (T@U) Bool)
(declare-fun IdenticalOnKnownLocations (T@U T@U T@U) Bool)
(declare-fun null () T@U)
(declare-fun PredicateMaskField (T@U) T@U)
(declare-fun HasDirectPerm (T@U T@U T@U) Bool)
(declare-fun List (T@U) T@U)
(declare-fun PredicateType_ListType () T@T)
(declare-fun pair (T@U) T@U)
(declare-fun PredicateType_pairType () T@T)
(declare-fun |length'| (T@U T@U) Int)
(declare-fun dummyFunction (T@U) Bool)
(declare-fun |length#triggerStateless| (T@U) Int)
(declare-fun |sum'| (T@U T@U) Int)
(declare-fun |sum#triggerStateless| (T@U) Int)
(declare-fun |List#trigger| (T@U T@U) Bool)
(declare-fun |List#everUsed| (T@U) Bool)
(declare-fun |pair#trigger| (T@U T@U) Bool)
(declare-fun |pair#everUsed| (T@U) Bool)
(declare-fun |wand_1#ft| (T@U Real T@U Real T@U Real) T@U)
(declare-fun |wand_1#sm| (T@U Real T@U Real T@U Real) T@U)
(declare-fun WandType_wand_1Type () T@T)
(declare-fun wand_6 (T@U Real T@U Int T@U Real Bool) T@U)
(declare-fun WandType_wand_6Type () T@T)
(declare-fun |wand_2#sm| (Bool T@U Real) T@U)
(declare-fun length (T@U T@U) Int)
(declare-fun sum (T@U T@U) Int)
(declare-fun |List#sm| (T@U) T@U)
(declare-fun |pair#sm| (T@U) T@U)
(declare-fun wand_5 (T@U Real T@U Real T@U Real T@U Real) T@U)
(declare-fun dummyHeap () T@U)
(declare-fun ZeroMask () T@U)
(declare-fun InsidePredicate (T@U T@U T@U T@U) Bool)
(declare-fun AssumeFunctionsAbove () Int)
(declare-fun sumMask (T@U T@U T@U) Bool)
(declare-fun |wand_4#ft| (T@U Real T@U Real) T@U)
(declare-fun |wand#ft| (T@U Real T@U Real) T@U)
(declare-fun |wand_3#ft| (T@U Real T@U Real) T@U)
(declare-fun wand_1 (T@U Real T@U Real T@U Real) T@U)
(declare-fun ConditionalFrame (Real T@U) T@U)
(declare-fun EmptyFrame () T@U)
(declare-fun NoPerm () Real)
(declare-fun |wand_4#sm| (T@U Real T@U Real) T@U)
(declare-fun |wand#sm| (T@U Real T@U Real) T@U)
(declare-fun |wand_3#sm| (T@U Real T@U Real) T@U)
(declare-fun FullPerm () Real)
(declare-fun |length#frame| (T@U T@U) Int)
(declare-fun |sum#frame| (T@U T@U) Int)
(declare-fun |wand_6#ft| (T@U Real T@U Int T@U Real Bool) T@U)
(declare-fun |wand_6#sm| (T@U Real T@U Int T@U Real Bool) T@U)
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
))) (= (Ctor NormalFieldType) 7)) (= (type $allocated) (FieldType NormalFieldType boolType))) (= (type f_7) (FieldType NormalFieldType intType))) (= (type g) (FieldType NormalFieldType intType))) (= (Ctor RefType) 8)) (= (type next) (FieldType NormalFieldType RefType))))
(assert (distinct $allocated f_7 g next)
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
))) (= (Ctor WandType_wand_5Type) 10)) (= (Ctor FrameTypeType) 11)) (forall ((arg0@@20 T@U) (arg1@@7 Real) (arg2@@1 T@U) (arg3@@0 Real) (arg4 T@U) (arg5 Real) (arg6 T@U) (arg7 Real) ) (! (= (type (|wand_5#ft| arg0@@20 arg1@@7 arg2@@1 arg3@@0 arg4 arg5 arg6 arg7)) (FieldType WandType_wand_5Type FrameTypeType))
 :qid |funType:wand_5#ft|
 :pattern ( (|wand_5#ft| arg0@@20 arg1@@7 arg2@@1 arg3@@0 arg4 arg5 arg6 arg7))
))) (forall ((arg0@@21 T@U) (arg1@@8 Real) (arg2@@2 T@U) (arg3@@1 Real) (arg4@@0 T@U) (arg5@@0 Real) (arg6@@0 T@U) (arg7@@0 Real) ) (! (= (type (|wand_5#sm| arg0@@21 arg1@@8 arg2@@2 arg3@@1 arg4@@0 arg5@@0 arg6@@0 arg7@@0)) (FieldType WandType_wand_5Type (MapType0Type RefType boolType)))
 :qid |funType:wand_5#sm|
 :pattern ( (|wand_5#sm| arg0@@21 arg1@@8 arg2@@2 arg3@@1 arg4@@0 arg5@@0 arg6@@0 arg7@@0))
))))
(assert (forall ((arg1@@9 T@U) (arg2@@3 Real) (arg3@@2 T@U) (arg4@@1 Real) (arg5@@1 T@U) (arg6@@1 Real) (arg7@@1 T@U) (arg8 Real) ) (!  (=> (and (and (and (= (type arg1@@9) RefType) (= (type arg3@@2) RefType)) (= (type arg5@@1) RefType)) (= (type arg7@@1) RefType)) (= (|wand_5#sm| arg1@@9 arg2@@3 arg3@@2 arg4@@1 arg5@@1 arg6@@1 arg7@@1 arg8) (WandMaskField (|wand_5#ft| arg1@@9 arg2@@3 arg3@@2 arg4@@1 arg5@@1 arg6@@1 arg7@@1 arg8))))
 :qid |stdinbpl.395:15|
 :skolemid |68|
 :pattern ( (WandMaskField (|wand_5#ft| arg1@@9 arg2@@3 arg3@@2 arg4@@1 arg5@@1 arg6@@1 arg7@@1 arg8)))
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
(assert  (and (= (Ctor WandType_wand_4Type) 13) (forall ((arg0@@26 T@U) (arg1@@12 Real) (arg2@@6 T@U) (arg3@@4 Real) ) (! (= (type (wand_4 arg0@@26 arg1@@12 arg2@@6 arg3@@4)) (FieldType WandType_wand_4Type intType))
 :qid |funType:wand_4|
 :pattern ( (wand_4 arg0@@26 arg1@@12 arg2@@6 arg3@@4))
))))
(assert (forall ((arg1@@13 T@U) (arg2@@7 Real) (arg3@@5 T@U) (arg4@@2 Real) ) (!  (=> (and (= (type arg1@@13) RefType) (= (type arg3@@5) RefType)) (= (getPredWandId (wand_4 arg1@@13 arg2@@7 arg3@@5 arg4@@2)) 2))
 :qid |stdinbpl.207:15|
 :skolemid |27|
 :pattern ( (wand_4 arg1@@13 arg2@@7 arg3@@5 arg4@@2))
)))
(assert  (and (= (Ctor WandType_wandType) 14) (forall ((arg0@@27 T@U) (arg1@@14 Real) (arg2@@8 T@U) (arg3@@6 Real) ) (! (= (type (wand arg0@@27 arg1@@14 arg2@@8 arg3@@6)) (FieldType WandType_wandType intType))
 :qid |funType:wand|
 :pattern ( (wand arg0@@27 arg1@@14 arg2@@8 arg3@@6))
))))
(assert (forall ((arg1@@15 T@U) (arg2@@9 Real) (arg3@@7 T@U) (arg4@@3 Real) ) (!  (=> (and (= (type arg1@@15) RefType) (= (type arg3@@7) RefType)) (= (getPredWandId (wand arg1@@15 arg2@@9 arg3@@7 arg4@@3)) 4))
 :qid |stdinbpl.271:15|
 :skolemid |41|
 :pattern ( (wand arg1@@15 arg2@@9 arg3@@7 arg4@@3))
)))
(assert  (and (= (Ctor WandType_wand_3Type) 15) (forall ((arg0@@28 T@U) (arg1@@16 Real) (arg2@@10 T@U) (arg3@@8 Real) ) (! (= (type (wand_3 arg0@@28 arg1@@16 arg2@@10 arg3@@8)) (FieldType WandType_wand_3Type intType))
 :qid |funType:wand_3|
 :pattern ( (wand_3 arg0@@28 arg1@@16 arg2@@10 arg3@@8))
))))
(assert (forall ((arg1@@17 T@U) (arg2@@11 Real) (arg3@@9 T@U) (arg4@@4 Real) ) (!  (=> (and (= (type arg1@@17) RefType) (= (type arg3@@9) RefType)) (= (getPredWandId (wand_3 arg1@@17 arg2@@11 arg3@@9 arg4@@4)) 6))
 :qid |stdinbpl.335:15|
 :skolemid |55|
 :pattern ( (wand_3 arg1@@17 arg2@@11 arg3@@9 arg4@@4))
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
(assert  (and (= (Ctor WandType_wand_2Type) 16) (forall ((arg0@@29 Bool) (arg1@@18 T@U) (arg2@@12 Real) ) (! (= (type (wand_2 arg0@@29 arg1@@18 arg2@@12)) (FieldType WandType_wand_2Type intType))
 :qid |funType:wand_2|
 :pattern ( (wand_2 arg0@@29 arg1@@18 arg2@@12))
))))
(assert (forall ((arg1@@19 Bool) (arg2@@13 T@U) (arg3@@10 Real) ) (!  (=> (= (type arg2@@13) RefType) (IsWandField (wand_2 arg1@@19 arg2@@13 arg3@@10)))
 :qid |stdinbpl.283:15|
 :skolemid |43|
 :pattern ( (wand_2 arg1@@19 arg2@@13 arg3@@10))
)))
(assert (forall ((arg0@@30 Bool) (arg1@@20 T@U) (arg2@@14 Real) ) (! (= (type (|wand_2#ft| arg0@@30 arg1@@20 arg2@@14)) (FieldType WandType_wand_2Type FrameTypeType))
 :qid |funType:wand_2#ft|
 :pattern ( (|wand_2#ft| arg0@@30 arg1@@20 arg2@@14))
)))
(assert (forall ((arg1@@21 Bool) (arg2@@15 T@U) (arg3@@11 Real) ) (!  (=> (= (type arg2@@15) RefType) (IsWandField (|wand_2#ft| arg1@@21 arg2@@15 arg3@@11)))
 :qid |stdinbpl.287:15|
 :skolemid |44|
 :pattern ( (|wand_2#ft| arg1@@21 arg2@@15 arg3@@11))
)))
(assert (forall ((arg1@@22 Bool) (arg2@@16 T@U) (arg3@@12 Real) ) (!  (=> (= (type arg2@@16) RefType) (= (getPredWandId (wand_2 arg1@@22 arg2@@16 arg3@@12)) 5))
 :qid |stdinbpl.303:15|
 :skolemid |48|
 :pattern ( (wand_2 arg1@@22 arg2@@16 arg3@@12))
)))
(assert (forall ((arg1@@23 Bool) (arg2@@17 T@U) (arg3@@13 Real) ) (!  (=> (= (type arg2@@17) RefType) (not (IsPredicateField (wand_2 arg1@@23 arg2@@17 arg3@@13))))
 :qid |stdinbpl.291:15|
 :skolemid |45|
 :pattern ( (wand_2 arg1@@23 arg2@@17 arg3@@13))
)))
(assert (forall ((arg1@@24 Bool) (arg2@@18 T@U) (arg3@@14 Real) ) (!  (=> (= (type arg2@@18) RefType) (not (IsPredicateField (|wand_2#ft| arg1@@24 arg2@@18 arg3@@14))))
 :qid |stdinbpl.295:15|
 :skolemid |46|
 :pattern ( (|wand_2#ft| arg1@@24 arg2@@18 arg3@@14))
)))
(assert  (and (= (type null) RefType) (forall ((arg0@@31 T@U) ) (! (let ((A@@0 (FieldTypeInv0 (type arg0@@31))))
(= (type (PredicateMaskField arg0@@31)) (FieldType A@@0 (MapType0Type RefType boolType))))
 :qid |funType:PredicateMaskField|
 :pattern ( (PredicateMaskField arg0@@31))
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
(assert  (and (= (Ctor PredicateType_ListType) 17) (forall ((arg0@@32 T@U) ) (! (= (type (List arg0@@32)) (FieldType PredicateType_ListType FrameTypeType))
 :qid |funType:List|
 :pattern ( (List arg0@@32))
))))
(assert (forall ((x@@8 T@U) ) (!  (=> (= (type x@@8) RefType) (IsPredicateField (List x@@8)))
 :qid |stdinbpl.664:15|
 :skolemid |81|
 :pattern ( (List x@@8))
)))
(assert  (and (= (Ctor PredicateType_pairType) 18) (forall ((arg0@@33 T@U) ) (! (= (type (pair arg0@@33)) (FieldType PredicateType_pairType FrameTypeType))
 :qid |funType:pair|
 :pattern ( (pair arg0@@33))
))))
(assert (forall ((x@@9 T@U) ) (!  (=> (= (type x@@9) RefType) (IsPredicateField (pair x@@9)))
 :qid |stdinbpl.735:15|
 :skolemid |87|
 :pattern ( (pair x@@9))
)))
(assert (forall ((Heap@@2 T@U) (x@@10 T@U) ) (!  (=> (and (= (type Heap@@2) (MapType1Type RefType)) (= (type x@@10) RefType)) (dummyFunction (int_2_U (|length#triggerStateless| x@@10))))
 :qid |stdinbpl.433:15|
 :skolemid |72|
 :pattern ( (|length'| Heap@@2 x@@10))
)))
(assert (forall ((Heap@@3 T@U) (x@@11 T@U) ) (!  (=> (and (= (type Heap@@3) (MapType1Type RefType)) (= (type x@@11) RefType)) (dummyFunction (int_2_U (|sum#triggerStateless| x@@11))))
 :qid |stdinbpl.569:15|
 :skolemid |77|
 :pattern ( (|sum'| Heap@@3 x@@11))
)))
(assert (forall ((Heap@@4 T@U) (x@@12 T@U) ) (!  (=> (and (= (type Heap@@4) (MapType1Type RefType)) (= (type x@@12) RefType)) (|List#everUsed| (List x@@12)))
 :qid |stdinbpl.683:15|
 :skolemid |85|
 :pattern ( (|List#trigger| Heap@@4 (List x@@12)))
)))
(assert (forall ((Heap@@5 T@U) (x@@13 T@U) ) (!  (=> (and (= (type Heap@@5) (MapType1Type RefType)) (= (type x@@13) RefType)) (|pair#everUsed| (pair x@@13)))
 :qid |stdinbpl.754:15|
 :skolemid |91|
 :pattern ( (|pair#trigger| Heap@@5 (pair x@@13)))
)))
(assert  (and (and (= (Ctor WandType_wand_1Type) 19) (forall ((arg0@@34 T@U) (arg1@@25 Real) (arg2@@19 T@U) (arg3@@15 Real) (arg4@@5 T@U) (arg5@@2 Real) ) (! (= (type (|wand_1#ft| arg0@@34 arg1@@25 arg2@@19 arg3@@15 arg4@@5 arg5@@2)) (FieldType WandType_wand_1Type FrameTypeType))
 :qid |funType:wand_1#ft|
 :pattern ( (|wand_1#ft| arg0@@34 arg1@@25 arg2@@19 arg3@@15 arg4@@5 arg5@@2))
))) (forall ((arg0@@35 T@U) (arg1@@26 Real) (arg2@@20 T@U) (arg3@@16 Real) (arg4@@6 T@U) (arg5@@3 Real) ) (! (= (type (|wand_1#sm| arg0@@35 arg1@@26 arg2@@20 arg3@@16 arg4@@6 arg5@@3)) (FieldType WandType_wand_1Type (MapType0Type RefType boolType)))
 :qid |funType:wand_1#sm|
 :pattern ( (|wand_1#sm| arg0@@35 arg1@@26 arg2@@20 arg3@@16 arg4@@6 arg5@@3))
))))
(assert (forall ((arg1@@27 T@U) (arg2@@21 Real) (arg3@@17 T@U) (arg4@@7 Real) (arg5@@4 T@U) (arg6@@2 Real) ) (!  (=> (and (and (= (type arg1@@27) RefType) (= (type arg3@@17) RefType)) (= (type arg5@@4) RefType)) (= (|wand_1#sm| arg1@@27 arg2@@21 arg3@@17 arg4@@7 arg5@@4 arg6@@2) (WandMaskField (|wand_1#ft| arg1@@27 arg2@@21 arg3@@17 arg4@@7 arg5@@4 arg6@@2))))
 :qid |stdinbpl.235:15|
 :skolemid |33|
 :pattern ( (WandMaskField (|wand_1#ft| arg1@@27 arg2@@21 arg3@@17 arg4@@7 arg5@@4 arg6@@2)))
)))
(assert  (and (= (Ctor WandType_wand_6Type) 20) (forall ((arg0@@36 T@U) (arg1@@28 Real) (arg2@@22 T@U) (arg3@@18 Int) (arg4@@8 T@U) (arg5@@5 Real) (arg6@@3 Bool) ) (! (= (type (wand_6 arg0@@36 arg1@@28 arg2@@22 arg3@@18 arg4@@8 arg5@@5 arg6@@3)) (FieldType WandType_wand_6Type intType))
 :qid |funType:wand_6|
 :pattern ( (wand_6 arg0@@36 arg1@@28 arg2@@22 arg3@@18 arg4@@8 arg5@@5 arg6@@3))
))))
(assert (forall ((arg1@@29 T@U) (arg2@@23 Real) (arg3@@19 T@U) (arg4@@9 Int) (arg5@@6 T@U) (arg6@@4 Real) (arg7@@2 Bool) (arg1_2 T@U) (arg2_2 Real) (arg3_2 T@U) (arg4_2 Int) (arg5_2 T@U) (arg6_2 Real) (arg7_2 Bool) ) (!  (=> (and (and (and (and (and (and (= (type arg1@@29) RefType) (= (type arg3@@19) RefType)) (= (type arg5@@6) RefType)) (= (type arg1_2) RefType)) (= (type arg3_2) RefType)) (= (type arg5_2) RefType)) (= (wand_6 arg1@@29 arg2@@23 arg3@@19 arg4@@9 arg5@@6 arg6@@4 arg7@@2) (wand_6 arg1_2 arg2_2 arg3_2 arg4_2 arg5_2 arg6_2 arg7_2))) (and (= arg1@@29 arg1_2) (and (= arg2@@23 arg2_2) (and (= arg3@@19 arg3_2) (and (= arg4@@9 arg4_2) (and (= arg5@@6 arg5_2) (and (= arg6@@4 arg6_2) (= arg7@@2 arg7_2))))))))
 :qid |stdinbpl.371:15|
 :skolemid |63|
 :pattern ( (wand_6 arg1@@29 arg2@@23 arg3@@19 arg4@@9 arg5@@6 arg6@@4 arg7@@2) (wand_6 arg1_2 arg2_2 arg3_2 arg4_2 arg5_2 arg6_2 arg7_2))
)))
(assert (forall ((arg0@@37 Bool) (arg1@@30 T@U) (arg2@@24 Real) ) (! (= (type (|wand_2#sm| arg0@@37 arg1@@30 arg2@@24)) (FieldType WandType_wand_2Type (MapType0Type RefType boolType)))
 :qid |funType:wand_2#sm|
 :pattern ( (|wand_2#sm| arg0@@37 arg1@@30 arg2@@24))
)))
(assert (forall ((arg1@@31 Bool) (arg2@@25 T@U) (arg3@@20 Real) ) (!  (=> (= (type arg2@@25) RefType) (= (|wand_2#sm| arg1@@31 arg2@@25 arg3@@20) (WandMaskField (|wand_2#ft| arg1@@31 arg2@@25 arg3@@20))))
 :qid |stdinbpl.299:15|
 :skolemid |47|
 :pattern ( (WandMaskField (|wand_2#ft| arg1@@31 arg2@@25 arg3@@20)))
)))
(assert (forall ((Heap@@6 T@U) (ExhaleHeap@@1 T@U) (Mask@@2 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@6) (MapType1Type RefType)) (= (type ExhaleHeap@@1) (MapType1Type RefType))) (= (type Mask@@2) (MapType0Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@6 ExhaleHeap@@1 Mask@@2)) (U_2_bool (MapType1Select Heap@@6 o_1 $allocated))) (U_2_bool (MapType1Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.73:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@6 ExhaleHeap@@1 Mask@@2) (MapType1Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert (forall ((Heap@@7 T@U) (x@@14 T@U) ) (!  (=> (and (= (type Heap@@7) (MapType1Type RefType)) (= (type x@@14) RefType)) (and (= (length Heap@@7 x@@14) (|length'| Heap@@7 x@@14)) (dummyFunction (int_2_U (|length#triggerStateless| x@@14)))))
 :qid |stdinbpl.429:15|
 :skolemid |71|
 :pattern ( (length Heap@@7 x@@14))
)))
(assert (forall ((Heap@@8 T@U) (x@@15 T@U) ) (!  (=> (and (= (type Heap@@8) (MapType1Type RefType)) (= (type x@@15) RefType)) (and (= (sum Heap@@8 x@@15) (|sum'| Heap@@8 x@@15)) (dummyFunction (int_2_U (|sum#triggerStateless| x@@15)))))
 :qid |stdinbpl.565:15|
 :skolemid |76|
 :pattern ( (sum Heap@@8 x@@15))
)))
(assert (forall ((x@@16 T@U) (x2 T@U) ) (!  (=> (and (and (= (type x@@16) RefType) (= (type x2) RefType)) (= (List x@@16) (List x2))) (= x@@16 x2))
 :qid |stdinbpl.674:15|
 :skolemid |83|
 :pattern ( (List x@@16) (List x2))
)))
(assert (forall ((arg0@@38 T@U) ) (! (= (type (|List#sm| arg0@@38)) (FieldType PredicateType_ListType (MapType0Type RefType boolType)))
 :qid |funType:List#sm|
 :pattern ( (|List#sm| arg0@@38))
)))
(assert (forall ((x@@17 T@U) (x2@@0 T@U) ) (!  (=> (and (and (= (type x@@17) RefType) (= (type x2@@0) RefType)) (= (|List#sm| x@@17) (|List#sm| x2@@0))) (= x@@17 x2@@0))
 :qid |stdinbpl.678:15|
 :skolemid |84|
 :pattern ( (|List#sm| x@@17) (|List#sm| x2@@0))
)))
(assert (forall ((x@@18 T@U) (x2@@1 T@U) ) (!  (=> (and (and (= (type x@@18) RefType) (= (type x2@@1) RefType)) (= (pair x@@18) (pair x2@@1))) (= x@@18 x2@@1))
 :qid |stdinbpl.745:15|
 :skolemid |89|
 :pattern ( (pair x@@18) (pair x2@@1))
)))
(assert (forall ((arg0@@39 T@U) ) (! (= (type (|pair#sm| arg0@@39)) (FieldType PredicateType_pairType (MapType0Type RefType boolType)))
 :qid |funType:pair#sm|
 :pattern ( (|pair#sm| arg0@@39))
)))
(assert (forall ((x@@19 T@U) (x2@@2 T@U) ) (!  (=> (and (and (= (type x@@19) RefType) (= (type x2@@2) RefType)) (= (|pair#sm| x@@19) (|pair#sm| x2@@2))) (= x@@19 x2@@2))
 :qid |stdinbpl.749:15|
 :skolemid |90|
 :pattern ( (|pair#sm| x@@19) (|pair#sm| x2@@2))
)))
(assert (forall ((arg0@@40 T@U) (arg1@@32 Real) (arg2@@26 T@U) (arg3@@21 Real) (arg4@@10 T@U) (arg5@@7 Real) (arg6@@5 T@U) (arg7@@3 Real) ) (! (= (type (wand_5 arg0@@40 arg1@@32 arg2@@26 arg3@@21 arg4@@10 arg5@@7 arg6@@5 arg7@@3)) (FieldType WandType_wand_5Type intType))
 :qid |funType:wand_5|
 :pattern ( (wand_5 arg0@@40 arg1@@32 arg2@@26 arg3@@21 arg4@@10 arg5@@7 arg6@@5 arg7@@3))
)))
(assert (forall ((arg1@@33 T@U) (arg2@@27 Real) (arg3@@22 T@U) (arg4@@11 Real) (arg5@@8 T@U) (arg6@@6 Real) (arg7@@4 T@U) (arg8@@0 Real) ) (!  (=> (and (and (and (= (type arg1@@33) RefType) (= (type arg3@@22) RefType)) (= (type arg5@@8) RefType)) (= (type arg7@@4) RefType)) (IsWandField (wand_5 arg1@@33 arg2@@27 arg3@@22 arg4@@11 arg5@@8 arg6@@6 arg7@@4 arg8@@0)))
 :qid |stdinbpl.379:15|
 :skolemid |64|
 :pattern ( (wand_5 arg1@@33 arg2@@27 arg3@@22 arg4@@11 arg5@@8 arg6@@6 arg7@@4 arg8@@0))
)))
(assert (forall ((arg1@@34 T@U) (arg2@@28 Real) (arg3@@23 T@U) (arg4@@12 Real) (arg5@@9 T@U) (arg6@@7 Real) (arg7@@5 T@U) (arg8@@1 Real) ) (!  (=> (and (and (and (= (type arg1@@34) RefType) (= (type arg3@@23) RefType)) (= (type arg5@@9) RefType)) (= (type arg7@@5) RefType)) (IsWandField (|wand_5#ft| arg1@@34 arg2@@28 arg3@@23 arg4@@12 arg5@@9 arg6@@7 arg7@@5 arg8@@1)))
 :qid |stdinbpl.383:15|
 :skolemid |65|
 :pattern ( (|wand_5#ft| arg1@@34 arg2@@28 arg3@@23 arg4@@12 arg5@@9 arg6@@7 arg7@@5 arg8@@1))
)))
(assert (forall ((Heap@@9 T@U) (ExhaleHeap@@2 T@U) (Mask@@3 T@U) (o_1@@0 T@U) (f_2 T@U) ) (! (let ((B@@1 (FieldTypeInv1 (type f_2))))
(let ((A@@1 (FieldTypeInv0 (type f_2))))
 (=> (and (and (and (and (and (and (= (type Heap@@9) (MapType1Type RefType)) (= (type ExhaleHeap@@2) (MapType1Type RefType))) (= (type Mask@@3) (MapType0Type RefType realType))) (= (type o_1@@0) RefType)) (= (type f_2) (FieldType A@@1 B@@1))) (IdenticalOnKnownLocations Heap@@9 ExhaleHeap@@2 Mask@@3)) (HasDirectPerm Mask@@3 o_1@@0 f_2)) (= (MapType1Select Heap@@9 o_1@@0 f_2) (MapType1Select ExhaleHeap@@2 o_1@@0 f_2)))))
 :qid |stdinbpl.42:22|
 :skolemid |1|
 :pattern ( (IdenticalOnKnownLocations Heap@@9 ExhaleHeap@@2 Mask@@3) (MapType1Select ExhaleHeap@@2 o_1@@0 f_2))
)))
(assert (forall ((arg1@@35 T@U) (arg2@@29 Real) (arg3@@24 T@U) (arg4@@13 Real) (arg5@@10 T@U) (arg6@@8 Real) (arg7@@6 T@U) (arg8@@2 Real) ) (!  (=> (and (and (and (= (type arg1@@35) RefType) (= (type arg3@@24) RefType)) (= (type arg5@@10) RefType)) (= (type arg7@@6) RefType)) (not (IsPredicateField (wand_5 arg1@@35 arg2@@29 arg3@@24 arg4@@13 arg5@@10 arg6@@8 arg7@@6 arg8@@2))))
 :qid |stdinbpl.387:15|
 :skolemid |66|
 :pattern ( (wand_5 arg1@@35 arg2@@29 arg3@@24 arg4@@13 arg5@@10 arg6@@8 arg7@@6 arg8@@2))
)))
(assert (forall ((arg1@@36 T@U) (arg2@@30 Real) (arg3@@25 T@U) (arg4@@14 Real) (arg5@@11 T@U) (arg6@@9 Real) (arg7@@7 T@U) (arg8@@3 Real) ) (!  (=> (and (and (and (= (type arg1@@36) RefType) (= (type arg3@@25) RefType)) (= (type arg5@@11) RefType)) (= (type arg7@@7) RefType)) (not (IsPredicateField (|wand_5#ft| arg1@@36 arg2@@30 arg3@@25 arg4@@14 arg5@@11 arg6@@9 arg7@@7 arg8@@3))))
 :qid |stdinbpl.391:15|
 :skolemid |67|
 :pattern ( (|wand_5#ft| arg1@@36 arg2@@30 arg3@@25 arg4@@14 arg5@@11 arg6@@9 arg7@@7 arg8@@3))
)))
(assert  (and (= (type dummyHeap) (MapType1Type RefType)) (= (type ZeroMask) (MapType0Type RefType realType))))
(assert (state dummyHeap ZeroMask))
(assert (forall ((p T@U) (v_1 T@U) (w T@U) ) (! (let ((A@@2 (FieldTypeInv0 (type p))))
 (=> (and (and (= (type p) (FieldType A@@2 FrameTypeType)) (= (type v_1) FrameTypeType)) (= (type w) FrameTypeType)) (not (InsidePredicate p v_1 p w))))
 :qid |stdinbpl.174:19|
 :skolemid |21|
 :pattern ( (InsidePredicate p v_1 p w))
)))
(assert  (not (IsPredicateField f_7)))
(assert  (not (IsWandField f_7)))
(assert  (not (IsPredicateField g)))
(assert  (not (IsWandField g)))
(assert  (not (IsPredicateField next)))
(assert  (not (IsWandField next)))
(assert (forall ((Heap@@10 T@U) (ExhaleHeap@@3 T@U) (Mask@@4 T@U) ) (!  (=> (and (and (and (= (type Heap@@10) (MapType1Type RefType)) (= (type ExhaleHeap@@3) (MapType1Type RefType))) (= (type Mask@@4) (MapType0Type RefType realType))) (IdenticalOnKnownLocations Heap@@10 ExhaleHeap@@3 Mask@@4)) (succHeap Heap@@10 ExhaleHeap@@3))
 :qid |stdinbpl.83:15|
 :skolemid |10|
 :pattern ( (IdenticalOnKnownLocations Heap@@10 ExhaleHeap@@3 Mask@@4))
)))
(assert (forall ((Heap@@11 T@U) (Mask@@5 T@U) (x@@20 T@U) ) (!  (=> (and (and (and (= (type Heap@@11) (MapType1Type RefType)) (= (type Mask@@5) (MapType0Type RefType realType))) (= (type x@@20) RefType)) (and (state Heap@@11 Mask@@5) (< AssumeFunctionsAbove 1))) (= (sum Heap@@11 x@@20) (+ (U_2_int (MapType1Select Heap@@11 x@@20 f_7)) (U_2_int (MapType1Select Heap@@11 x@@20 g)))))
 :qid |stdinbpl.575:15|
 :skolemid |78|
 :pattern ( (state Heap@@11 Mask@@5) (sum Heap@@11 x@@20))
 :pattern ( (state Heap@@11 Mask@@5) (|sum#triggerStateless| x@@20) (|pair#trigger| Heap@@11 (pair x@@20)))
)))
(assert (forall ((Heap@@12 T@U) (Mask@@6 T@U) (x@@21 T@U) ) (!  (=> (and (and (and (= (type Heap@@12) (MapType1Type RefType)) (= (type Mask@@6) (MapType0Type RefType realType))) (= (type x@@21) RefType)) (and (state Heap@@12 Mask@@6) (< AssumeFunctionsAbove 0))) (= (length Heap@@12 x@@21) (ite (= (MapType1Select Heap@@12 x@@21 next) null) 1 (+ 1 (|length'| Heap@@12 (MapType1Select Heap@@12 x@@21 next))))))
 :qid |stdinbpl.439:15|
 :skolemid |73|
 :pattern ( (state Heap@@12 Mask@@6) (length Heap@@12 x@@21))
 :pattern ( (state Heap@@12 Mask@@6) (|length#triggerStateless| x@@21) (|List#trigger| Heap@@12 (List x@@21)))
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
(assert (forall ((arg1@@37 T@U) (arg2@@31 Real) (arg3@@26 T@U) (arg4@@15 Real) ) (!  (=> (and (= (type arg1@@37) RefType) (= (type arg3@@26) RefType)) (IsWandField (wand_4 arg1@@37 arg2@@31 arg3@@26 arg4@@15)))
 :qid |stdinbpl.187:15|
 :skolemid |22|
 :pattern ( (wand_4 arg1@@37 arg2@@31 arg3@@26 arg4@@15))
)))
(assert (forall ((arg0@@41 T@U) (arg1@@38 Real) (arg2@@32 T@U) (arg3@@27 Real) ) (! (= (type (|wand_4#ft| arg0@@41 arg1@@38 arg2@@32 arg3@@27)) (FieldType WandType_wand_4Type FrameTypeType))
 :qid |funType:wand_4#ft|
 :pattern ( (|wand_4#ft| arg0@@41 arg1@@38 arg2@@32 arg3@@27))
)))
(assert (forall ((arg1@@39 T@U) (arg2@@33 Real) (arg3@@28 T@U) (arg4@@16 Real) ) (!  (=> (and (= (type arg1@@39) RefType) (= (type arg3@@28) RefType)) (IsWandField (|wand_4#ft| arg1@@39 arg2@@33 arg3@@28 arg4@@16)))
 :qid |stdinbpl.191:15|
 :skolemid |23|
 :pattern ( (|wand_4#ft| arg1@@39 arg2@@33 arg3@@28 arg4@@16))
)))
(assert (forall ((arg1@@40 T@U) (arg2@@34 Real) (arg3@@29 T@U) (arg4@@17 Real) ) (!  (=> (and (= (type arg1@@40) RefType) (= (type arg3@@29) RefType)) (IsWandField (wand arg1@@40 arg2@@34 arg3@@29 arg4@@17)))
 :qid |stdinbpl.251:15|
 :skolemid |36|
 :pattern ( (wand arg1@@40 arg2@@34 arg3@@29 arg4@@17))
)))
(assert (forall ((arg0@@42 T@U) (arg1@@41 Real) (arg2@@35 T@U) (arg3@@30 Real) ) (! (= (type (|wand#ft| arg0@@42 arg1@@41 arg2@@35 arg3@@30)) (FieldType WandType_wandType FrameTypeType))
 :qid |funType:wand#ft|
 :pattern ( (|wand#ft| arg0@@42 arg1@@41 arg2@@35 arg3@@30))
)))
(assert (forall ((arg1@@42 T@U) (arg2@@36 Real) (arg3@@31 T@U) (arg4@@18 Real) ) (!  (=> (and (= (type arg1@@42) RefType) (= (type arg3@@31) RefType)) (IsWandField (|wand#ft| arg1@@42 arg2@@36 arg3@@31 arg4@@18)))
 :qid |stdinbpl.255:15|
 :skolemid |37|
 :pattern ( (|wand#ft| arg1@@42 arg2@@36 arg3@@31 arg4@@18))
)))
(assert (forall ((arg1@@43 T@U) (arg2@@37 Real) (arg3@@32 T@U) (arg4@@19 Real) ) (!  (=> (and (= (type arg1@@43) RefType) (= (type arg3@@32) RefType)) (IsWandField (wand_3 arg1@@43 arg2@@37 arg3@@32 arg4@@19)))
 :qid |stdinbpl.315:15|
 :skolemid |50|
 :pattern ( (wand_3 arg1@@43 arg2@@37 arg3@@32 arg4@@19))
)))
(assert (forall ((arg0@@43 T@U) (arg1@@44 Real) (arg2@@38 T@U) (arg3@@33 Real) ) (! (= (type (|wand_3#ft| arg0@@43 arg1@@44 arg2@@38 arg3@@33)) (FieldType WandType_wand_3Type FrameTypeType))
 :qid |funType:wand_3#ft|
 :pattern ( (|wand_3#ft| arg0@@43 arg1@@44 arg2@@38 arg3@@33))
)))
(assert (forall ((arg1@@45 T@U) (arg2@@39 Real) (arg3@@34 T@U) (arg4@@20 Real) ) (!  (=> (and (= (type arg1@@45) RefType) (= (type arg3@@34) RefType)) (IsWandField (|wand_3#ft| arg1@@45 arg2@@39 arg3@@34 arg4@@20)))
 :qid |stdinbpl.319:15|
 :skolemid |51|
 :pattern ( (|wand_3#ft| arg1@@45 arg2@@39 arg3@@34 arg4@@20))
)))
(assert (forall ((arg0@@44 T@U) (arg1@@46 Real) (arg2@@40 T@U) (arg3@@35 Real) (arg4@@21 T@U) (arg5@@12 Real) ) (! (= (type (wand_1 arg0@@44 arg1@@46 arg2@@40 arg3@@35 arg4@@21 arg5@@12)) (FieldType WandType_wand_1Type intType))
 :qid |funType:wand_1|
 :pattern ( (wand_1 arg0@@44 arg1@@46 arg2@@40 arg3@@35 arg4@@21 arg5@@12))
)))
(assert (forall ((arg1@@47 T@U) (arg2@@41 Real) (arg3@@36 T@U) (arg4@@22 Real) (arg5@@13 T@U) (arg6@@10 Real) (arg1_2@@0 T@U) (arg2_2@@0 Real) (arg3_2@@0 T@U) (arg4_2@@0 Real) (arg5_2@@0 T@U) (arg6_2@@0 Real) ) (!  (=> (and (and (and (and (and (and (= (type arg1@@47) RefType) (= (type arg3@@36) RefType)) (= (type arg5@@13) RefType)) (= (type arg1_2@@0) RefType)) (= (type arg3_2@@0) RefType)) (= (type arg5_2@@0) RefType)) (= (wand_1 arg1@@47 arg2@@41 arg3@@36 arg4@@22 arg5@@13 arg6@@10) (wand_1 arg1_2@@0 arg2_2@@0 arg3_2@@0 arg4_2@@0 arg5_2@@0 arg6_2@@0))) (and (= arg1@@47 arg1_2@@0) (and (= arg2@@41 arg2_2@@0) (and (= arg3@@36 arg3_2@@0) (and (= arg4@@22 arg4_2@@0) (and (= arg5@@13 arg5_2@@0) (= arg6@@10 arg6_2@@0)))))))
 :qid |stdinbpl.243:15|
 :skolemid |35|
 :pattern ( (wand_1 arg1@@47 arg2@@41 arg3@@36 arg4@@22 arg5@@13 arg6@@10) (wand_1 arg1_2@@0 arg2_2@@0 arg3_2@@0 arg4_2@@0 arg5_2@@0 arg6_2@@0))
)))
(assert  (and (forall ((arg0@@45 Real) (arg1@@48 T@U) ) (! (= (type (ConditionalFrame arg0@@45 arg1@@48)) FrameTypeType)
 :qid |funType:ConditionalFrame|
 :pattern ( (ConditionalFrame arg0@@45 arg1@@48))
)) (= (type EmptyFrame) FrameTypeType)))
(assert (forall ((p@@0 Real) (f_6 T@U) ) (!  (=> (= (type f_6) FrameTypeType) (= (ConditionalFrame p@@0 f_6) (ite (> p@@0 0.0) f_6 EmptyFrame)))
 :qid |stdinbpl.162:15|
 :skolemid |19|
 :pattern ( (ConditionalFrame p@@0 f_6))
)))
(assert (forall ((arg1@@49 T@U) (arg2@@42 Real) (arg3@@37 T@U) (arg4@@23 Real) ) (!  (=> (and (= (type arg1@@49) RefType) (= (type arg3@@37) RefType)) (not (IsPredicateField (wand_4 arg1@@49 arg2@@42 arg3@@37 arg4@@23))))
 :qid |stdinbpl.195:15|
 :skolemid |24|
 :pattern ( (wand_4 arg1@@49 arg2@@42 arg3@@37 arg4@@23))
)))
(assert (forall ((arg1@@50 T@U) (arg2@@43 Real) (arg3@@38 T@U) (arg4@@24 Real) ) (!  (=> (and (= (type arg1@@50) RefType) (= (type arg3@@38) RefType)) (not (IsPredicateField (|wand_4#ft| arg1@@50 arg2@@43 arg3@@38 arg4@@24))))
 :qid |stdinbpl.199:15|
 :skolemid |25|
 :pattern ( (|wand_4#ft| arg1@@50 arg2@@43 arg3@@38 arg4@@24))
)))
(assert (forall ((arg1@@51 T@U) (arg2@@44 Real) (arg3@@39 T@U) (arg4@@25 Real) ) (!  (=> (and (= (type arg1@@51) RefType) (= (type arg3@@39) RefType)) (not (IsPredicateField (wand arg1@@51 arg2@@44 arg3@@39 arg4@@25))))
 :qid |stdinbpl.259:15|
 :skolemid |38|
 :pattern ( (wand arg1@@51 arg2@@44 arg3@@39 arg4@@25))
)))
(assert (forall ((arg1@@52 T@U) (arg2@@45 Real) (arg3@@40 T@U) (arg4@@26 Real) ) (!  (=> (and (= (type arg1@@52) RefType) (= (type arg3@@40) RefType)) (not (IsPredicateField (|wand#ft| arg1@@52 arg2@@45 arg3@@40 arg4@@26))))
 :qid |stdinbpl.263:15|
 :skolemid |39|
 :pattern ( (|wand#ft| arg1@@52 arg2@@45 arg3@@40 arg4@@26))
)))
(assert (forall ((arg1@@53 T@U) (arg2@@46 Real) (arg3@@41 T@U) (arg4@@27 Real) ) (!  (=> (and (= (type arg1@@53) RefType) (= (type arg3@@41) RefType)) (not (IsPredicateField (wand_3 arg1@@53 arg2@@46 arg3@@41 arg4@@27))))
 :qid |stdinbpl.323:15|
 :skolemid |52|
 :pattern ( (wand_3 arg1@@53 arg2@@46 arg3@@41 arg4@@27))
)))
(assert (forall ((arg1@@54 T@U) (arg2@@47 Real) (arg3@@42 T@U) (arg4@@28 Real) ) (!  (=> (and (= (type arg1@@54) RefType) (= (type arg3@@42) RefType)) (not (IsPredicateField (|wand_3#ft| arg1@@54 arg2@@47 arg3@@42 arg4@@28))))
 :qid |stdinbpl.327:15|
 :skolemid |53|
 :pattern ( (|wand_3#ft| arg1@@54 arg2@@47 arg3@@42 arg4@@28))
)))
(assert (forall ((Mask@@7 T@U) (o_2@@0 T@U) (f_4@@0 T@U) ) (! (let ((B@@3 (FieldTypeInv1 (type f_4@@0))))
(let ((A@@4 (FieldTypeInv0 (type f_4@@0))))
 (=> (and (and (= (type Mask@@7) (MapType0Type RefType realType)) (= (type o_2@@0) RefType)) (= (type f_4@@0) (FieldType A@@4 B@@3))) (= (HasDirectPerm Mask@@7 o_2@@0 f_4@@0) (> (U_2_real (MapType0Select Mask@@7 o_2@@0 f_4@@0)) NoPerm)))))
 :qid |stdinbpl.133:22|
 :skolemid |17|
 :pattern ( (HasDirectPerm Mask@@7 o_2@@0 f_4@@0))
)))
(assert (forall ((arg0@@46 T@U) (arg1@@55 Real) (arg2@@48 T@U) (arg3@@43 Real) ) (! (= (type (|wand_4#sm| arg0@@46 arg1@@55 arg2@@48 arg3@@43)) (FieldType WandType_wand_4Type (MapType0Type RefType boolType)))
 :qid |funType:wand_4#sm|
 :pattern ( (|wand_4#sm| arg0@@46 arg1@@55 arg2@@48 arg3@@43))
)))
(assert (forall ((arg1@@56 T@U) (arg2@@49 Real) (arg3@@44 T@U) (arg4@@29 Real) ) (!  (=> (and (= (type arg1@@56) RefType) (= (type arg3@@44) RefType)) (= (|wand_4#sm| arg1@@56 arg2@@49 arg3@@44 arg4@@29) (WandMaskField (|wand_4#ft| arg1@@56 arg2@@49 arg3@@44 arg4@@29))))
 :qid |stdinbpl.203:15|
 :skolemid |26|
 :pattern ( (WandMaskField (|wand_4#ft| arg1@@56 arg2@@49 arg3@@44 arg4@@29)))
)))
(assert (forall ((arg0@@47 T@U) (arg1@@57 Real) (arg2@@50 T@U) (arg3@@45 Real) ) (! (= (type (|wand#sm| arg0@@47 arg1@@57 arg2@@50 arg3@@45)) (FieldType WandType_wandType (MapType0Type RefType boolType)))
 :qid |funType:wand#sm|
 :pattern ( (|wand#sm| arg0@@47 arg1@@57 arg2@@50 arg3@@45))
)))
(assert (forall ((arg1@@58 T@U) (arg2@@51 Real) (arg3@@46 T@U) (arg4@@30 Real) ) (!  (=> (and (= (type arg1@@58) RefType) (= (type arg3@@46) RefType)) (= (|wand#sm| arg1@@58 arg2@@51 arg3@@46 arg4@@30) (WandMaskField (|wand#ft| arg1@@58 arg2@@51 arg3@@46 arg4@@30))))
 :qid |stdinbpl.267:15|
 :skolemid |40|
 :pattern ( (WandMaskField (|wand#ft| arg1@@58 arg2@@51 arg3@@46 arg4@@30)))
)))
(assert (forall ((arg0@@48 T@U) (arg1@@59 Real) (arg2@@52 T@U) (arg3@@47 Real) ) (! (= (type (|wand_3#sm| arg0@@48 arg1@@59 arg2@@52 arg3@@47)) (FieldType WandType_wand_3Type (MapType0Type RefType boolType)))
 :qid |funType:wand_3#sm|
 :pattern ( (|wand_3#sm| arg0@@48 arg1@@59 arg2@@52 arg3@@47))
)))
(assert (forall ((arg1@@60 T@U) (arg2@@53 Real) (arg3@@48 T@U) (arg4@@31 Real) ) (!  (=> (and (= (type arg1@@60) RefType) (= (type arg3@@48) RefType)) (= (|wand_3#sm| arg1@@60 arg2@@53 arg3@@48 arg4@@31) (WandMaskField (|wand_3#ft| arg1@@60 arg2@@53 arg3@@48 arg4@@31))))
 :qid |stdinbpl.331:15|
 :skolemid |54|
 :pattern ( (WandMaskField (|wand_3#ft| arg1@@60 arg2@@53 arg3@@48 arg4@@31)))
)))
(assert (forall ((arg1@@61 T@U) (arg2@@54 Real) (arg3@@49 T@U) (arg4@@32 Real) (arg5@@14 T@U) (arg6@@11 Real) ) (!  (=> (and (and (= (type arg1@@61) RefType) (= (type arg3@@49) RefType)) (= (type arg5@@14) RefType)) (= (getPredWandId (wand_1 arg1@@61 arg2@@54 arg3@@49 arg4@@32 arg5@@14 arg6@@11)) 3))
 :qid |stdinbpl.239:15|
 :skolemid |34|
 :pattern ( (wand_1 arg1@@61 arg2@@54 arg3@@49 arg4@@32 arg5@@14 arg6@@11))
)))
(assert (forall ((o_2@@1 T@U) (f_4@@1 T@U) ) (! (let ((B@@4 (FieldTypeInv1 (type f_4@@1))))
(let ((A@@5 (FieldTypeInv0 (type f_4@@1))))
 (=> (and (= (type o_2@@1) RefType) (= (type f_4@@1) (FieldType A@@5 B@@4))) (= (U_2_real (MapType0Select ZeroMask o_2@@1 f_4@@1)) NoPerm))))
 :qid |stdinbpl.106:22|
 :skolemid |13|
 :pattern ( (MapType0Select ZeroMask o_2@@1 f_4@@1))
)))
(assert (forall ((arg1@@62 T@U) (arg2@@55 Real) (arg3@@50 T@U) (arg4@@33 Real) (arg5@@15 T@U) (arg6@@12 Real) (arg7@@8 T@U) (arg8@@4 Real) (arg1_2@@1 T@U) (arg2_2@@1 Real) (arg3_2@@1 T@U) (arg4_2@@1 Real) (arg5_2@@1 T@U) (arg6_2@@1 Real) (arg7_2@@0 T@U) (arg8_2 Real) ) (!  (=> (and (and (and (and (and (and (and (and (= (type arg1@@62) RefType) (= (type arg3@@50) RefType)) (= (type arg5@@15) RefType)) (= (type arg7@@8) RefType)) (= (type arg1_2@@1) RefType)) (= (type arg3_2@@1) RefType)) (= (type arg5_2@@1) RefType)) (= (type arg7_2@@0) RefType)) (= (wand_5 arg1@@62 arg2@@55 arg3@@50 arg4@@33 arg5@@15 arg6@@12 arg7@@8 arg8@@4) (wand_5 arg1_2@@1 arg2_2@@1 arg3_2@@1 arg4_2@@1 arg5_2@@1 arg6_2@@1 arg7_2@@0 arg8_2))) (and (= arg1@@62 arg1_2@@1) (and (= arg2@@55 arg2_2@@1) (and (= arg3@@50 arg3_2@@1) (and (= arg4@@33 arg4_2@@1) (and (= arg5@@15 arg5_2@@1) (and (= arg6@@12 arg6_2@@1) (and (= arg7@@8 arg7_2@@0) (= arg8@@4 arg8_2)))))))))
 :qid |stdinbpl.403:15|
 :skolemid |70|
 :pattern ( (wand_5 arg1@@62 arg2@@55 arg3@@50 arg4@@33 arg5@@15 arg6@@12 arg7@@8 arg8@@4) (wand_5 arg1_2@@1 arg2_2@@1 arg3_2@@1 arg4_2@@1 arg5_2@@1 arg6_2@@1 arg7_2@@0 arg8_2))
)))
(assert (forall ((arg1@@63 T@U) (arg2@@56 Real) (arg3@@51 T@U) (arg4@@34 Real) (arg5@@16 T@U) (arg6@@13 Real) ) (!  (=> (and (and (= (type arg1@@63) RefType) (= (type arg3@@51) RefType)) (= (type arg5@@16) RefType)) (IsWandField (wand_1 arg1@@63 arg2@@56 arg3@@51 arg4@@34 arg5@@16 arg6@@13)))
 :qid |stdinbpl.219:15|
 :skolemid |29|
 :pattern ( (wand_1 arg1@@63 arg2@@56 arg3@@51 arg4@@34 arg5@@16 arg6@@13))
)))
(assert (forall ((arg1@@64 T@U) (arg2@@57 Real) (arg3@@52 T@U) (arg4@@35 Real) (arg5@@17 T@U) (arg6@@14 Real) ) (!  (=> (and (and (= (type arg1@@64) RefType) (= (type arg3@@52) RefType)) (= (type arg5@@17) RefType)) (IsWandField (|wand_1#ft| arg1@@64 arg2@@57 arg3@@52 arg4@@35 arg5@@17 arg6@@14)))
 :qid |stdinbpl.223:15|
 :skolemid |30|
 :pattern ( (|wand_1#ft| arg1@@64 arg2@@57 arg3@@52 arg4@@35 arg5@@17 arg6@@14))
)))
(assert (forall ((arg1@@65 T@U) (arg2@@58 Real) (arg3@@53 T@U) (arg4@@36 Real) (arg5@@18 T@U) (arg6@@15 Real) ) (!  (=> (and (and (= (type arg1@@65) RefType) (= (type arg3@@53) RefType)) (= (type arg5@@18) RefType)) (not (IsPredicateField (wand_1 arg1@@65 arg2@@58 arg3@@53 arg4@@36 arg5@@18 arg6@@15))))
 :qid |stdinbpl.227:15|
 :skolemid |31|
 :pattern ( (wand_1 arg1@@65 arg2@@58 arg3@@53 arg4@@36 arg5@@18 arg6@@15))
)))
(assert (forall ((arg1@@66 T@U) (arg2@@59 Real) (arg3@@54 T@U) (arg4@@37 Real) (arg5@@19 T@U) (arg6@@16 Real) ) (!  (=> (and (and (= (type arg1@@66) RefType) (= (type arg3@@54) RefType)) (= (type arg5@@19) RefType)) (not (IsPredicateField (|wand_1#ft| arg1@@66 arg2@@59 arg3@@54 arg4@@37 arg5@@19 arg6@@16))))
 :qid |stdinbpl.231:15|
 :skolemid |32|
 :pattern ( (|wand_1#ft| arg1@@66 arg2@@59 arg3@@54 arg4@@37 arg5@@19 arg6@@16))
)))
(assert (forall ((arg1@@67 T@U) (arg2@@60 Real) (arg3@@55 T@U) (arg4@@38 Real) (arg5@@20 T@U) (arg6@@17 Real) (arg7@@9 T@U) (arg8@@5 Real) ) (!  (=> (and (and (and (= (type arg1@@67) RefType) (= (type arg3@@55) RefType)) (= (type arg5@@20) RefType)) (= (type arg7@@9) RefType)) (= (getPredWandId (wand_5 arg1@@67 arg2@@60 arg3@@55 arg4@@38 arg5@@20 arg6@@17 arg7@@9 arg8@@5)) 8))
 :qid |stdinbpl.399:15|
 :skolemid |69|
 :pattern ( (wand_5 arg1@@67 arg2@@60 arg3@@55 arg4@@38 arg5@@20 arg6@@17 arg7@@9 arg8@@5))
)))
(assert (forall ((arg1@@68 Bool) (arg2@@61 T@U) (arg3@@56 Real) (arg1_2@@2 Bool) (arg2_2@@2 T@U) (arg3_2@@2 Real) ) (!  (=> (and (and (= (type arg2@@61) RefType) (= (type arg2_2@@2) RefType)) (= (wand_2 arg1@@68 arg2@@61 arg3@@56) (wand_2 arg1_2@@2 arg2_2@@2 arg3_2@@2))) (and (= arg1@@68 arg1_2@@2) (and (= arg2@@61 arg2_2@@2) (= arg3@@56 arg3_2@@2))))
 :qid |stdinbpl.307:15|
 :skolemid |49|
 :pattern ( (wand_2 arg1@@68 arg2@@61 arg3@@56) (wand_2 arg1_2@@2 arg2_2@@2 arg3_2@@2))
)))
(assert (forall ((Heap@@13 T@U) (ExhaleHeap@@4 T@U) (Mask@@8 T@U) (pm_f@@1 T@U) ) (! (let ((C@@1 (FieldTypeInv0 (type pm_f@@1))))
 (=> (and (and (and (and (and (= (type Heap@@13) (MapType1Type RefType)) (= (type ExhaleHeap@@4) (MapType1Type RefType))) (= (type Mask@@8) (MapType0Type RefType realType))) (= (type pm_f@@1) (FieldType C@@1 FrameTypeType))) (IdenticalOnKnownLocations Heap@@13 ExhaleHeap@@4 Mask@@8)) (and (HasDirectPerm Mask@@8 null pm_f@@1) (IsPredicateField pm_f@@1))) (forall ((o2 T@U) (f_2@@0 T@U) ) (! (let ((B@@5 (FieldTypeInv1 (type f_2@@0))))
(let ((A@@6 (FieldTypeInv0 (type f_2@@0))))
 (=> (and (and (= (type o2) RefType) (= (type f_2@@0) (FieldType A@@6 B@@5))) (U_2_bool (MapType0Select (MapType1Select Heap@@13 null (PredicateMaskField pm_f@@1)) o2 f_2@@0))) (= (MapType1Select Heap@@13 o2 f_2@@0) (MapType1Select ExhaleHeap@@4 o2 f_2@@0)))))
 :qid |stdinbpl.54:134|
 :skolemid |3|
 :pattern ( (MapType1Select ExhaleHeap@@4 o2 f_2@@0))
))))
 :qid |stdinbpl.52:19|
 :skolemid |4|
 :pattern ( (IdenticalOnKnownLocations Heap@@13 ExhaleHeap@@4 Mask@@8) (IsPredicateField pm_f@@1))
)))
(assert (forall ((Heap@@14 T@U) (ExhaleHeap@@5 T@U) (Mask@@9 T@U) (pm_f@@2 T@U) ) (! (let ((C@@2 (FieldTypeInv0 (type pm_f@@2))))
 (=> (and (and (and (and (and (= (type Heap@@14) (MapType1Type RefType)) (= (type ExhaleHeap@@5) (MapType1Type RefType))) (= (type Mask@@9) (MapType0Type RefType realType))) (= (type pm_f@@2) (FieldType C@@2 FrameTypeType))) (IdenticalOnKnownLocations Heap@@14 ExhaleHeap@@5 Mask@@9)) (and (HasDirectPerm Mask@@9 null pm_f@@2) (IsWandField pm_f@@2))) (forall ((o2@@0 T@U) (f_2@@1 T@U) ) (! (let ((B@@6 (FieldTypeInv1 (type f_2@@1))))
(let ((A@@7 (FieldTypeInv0 (type f_2@@1))))
 (=> (and (and (= (type o2@@0) RefType) (= (type f_2@@1) (FieldType A@@7 B@@6))) (U_2_bool (MapType0Select (MapType1Select Heap@@14 null (WandMaskField pm_f@@2)) o2@@0 f_2@@1))) (= (MapType1Select Heap@@14 o2@@0 f_2@@1) (MapType1Select ExhaleHeap@@5 o2@@0 f_2@@1)))))
 :qid |stdinbpl.67:129|
 :skolemid |6|
 :pattern ( (MapType1Select ExhaleHeap@@5 o2@@0 f_2@@1))
))))
 :qid |stdinbpl.65:19|
 :skolemid |7|
 :pattern ( (IdenticalOnKnownLocations Heap@@14 ExhaleHeap@@5 Mask@@9) (IsWandField pm_f@@2))
)))
(assert (forall ((x@@22 T@U) ) (!  (=> (= (type x@@22) RefType) (= (getPredWandId (List x@@22)) 0))
 :qid |stdinbpl.668:15|
 :skolemid |82|
 :pattern ( (List x@@22))
)))
(assert (forall ((x@@23 T@U) ) (!  (=> (= (type x@@23) RefType) (= (getPredWandId (pair x@@23)) 1))
 :qid |stdinbpl.739:15|
 :skolemid |88|
 :pattern ( (pair x@@23))
)))
(assert (forall ((Mask@@10 T@U) (o_2@@2 T@U) (f_4@@2 T@U) ) (! (let ((B@@7 (FieldTypeInv1 (type f_4@@2))))
(let ((A@@8 (FieldTypeInv0 (type f_4@@2))))
 (=> (and (and (and (= (type Mask@@10) (MapType0Type RefType realType)) (= (type o_2@@2) RefType)) (= (type f_4@@2) (FieldType A@@8 B@@7))) (GoodMask Mask@@10)) (and (>= (U_2_real (MapType0Select Mask@@10 o_2@@2 f_4@@2)) NoPerm) (=> (and (and (GoodMask Mask@@10) (not (IsPredicateField f_4@@2))) (not (IsWandField f_4@@2))) (<= (U_2_real (MapType0Select Mask@@10 o_2@@2 f_4@@2)) FullPerm))))))
 :qid |stdinbpl.128:22|
 :skolemid |16|
 :pattern ( (GoodMask Mask@@10) (MapType0Select Mask@@10 o_2@@2 f_4@@2))
)))
(assert (forall ((Heap@@15 T@U) (Mask@@11 T@U) (x@@24 T@U) ) (!  (=> (and (and (and (= (type Heap@@15) (MapType1Type RefType)) (= (type Mask@@11) (MapType0Type RefType realType))) (= (type x@@24) RefType)) (state Heap@@15 Mask@@11)) (= (|length'| Heap@@15 x@@24) (|length#frame| (MapType1Select Heap@@15 null (List x@@24)) x@@24)))
 :qid |stdinbpl.446:15|
 :skolemid |74|
 :pattern ( (state Heap@@15 Mask@@11) (|length'| Heap@@15 x@@24))
 :pattern ( (state Heap@@15 Mask@@11) (|length#triggerStateless| x@@24) (|List#trigger| Heap@@15 (List x@@24)))
)))
(assert (forall ((Heap@@16 T@U) (Mask@@12 T@U) (x@@25 T@U) ) (!  (=> (and (and (and (= (type Heap@@16) (MapType1Type RefType)) (= (type Mask@@12) (MapType0Type RefType realType))) (= (type x@@25) RefType)) (state Heap@@16 Mask@@12)) (= (|sum'| Heap@@16 x@@25) (|sum#frame| (MapType1Select Heap@@16 null (pair x@@25)) x@@25)))
 :qid |stdinbpl.582:15|
 :skolemid |79|
 :pattern ( (state Heap@@16 Mask@@12) (|sum'| Heap@@16 x@@25))
)))
(assert (forall ((o T@U) (f T@U) (Heap@@17 T@U) ) (!  (=> (and (and (and (= (type o) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap@@17) (MapType1Type RefType))) (U_2_bool (MapType1Select Heap@@17 o $allocated))) (U_2_bool (MapType1Select Heap@@17 (MapType1Select Heap@@17 o f) $allocated)))
 :qid |stdinbpl.31:15|
 :skolemid |0|
 :pattern ( (MapType1Select Heap@@17 o f))
)))
(assert (forall ((x@@26 T@U) ) (!  (=> (= (type x@@26) RefType) (= (PredicateMaskField (List x@@26)) (|List#sm| x@@26)))
 :qid |stdinbpl.660:15|
 :skolemid |80|
 :pattern ( (PredicateMaskField (List x@@26)))
)))
(assert (forall ((x@@27 T@U) ) (!  (=> (= (type x@@27) RefType) (= (PredicateMaskField (pair x@@27)) (|pair#sm| x@@27)))
 :qid |stdinbpl.731:15|
 :skolemid |86|
 :pattern ( (PredicateMaskField (pair x@@27)))
)))
(assert (forall ((Heap@@18 T@U) (o@@0 T@U) (f_3 T@U) (v T@U) ) (! (let ((B@@8 (type v)))
(let ((A@@9 (FieldTypeInv0 (type f_3))))
 (=> (and (and (= (type Heap@@18) (MapType1Type RefType)) (= (type o@@0) RefType)) (= (type f_3) (FieldType A@@9 B@@8))) (succHeap Heap@@18 (MapType1Store Heap@@18 o@@0 f_3 v)))))
 :qid |stdinbpl.78:22|
 :skolemid |9|
 :pattern ( (MapType1Store Heap@@18 o@@0 f_3 v))
)))
(assert  (and (forall ((arg0@@49 T@U) (arg1@@69 Real) (arg2@@62 T@U) (arg3@@57 Int) (arg4@@39 T@U) (arg5@@21 Real) (arg6@@18 Bool) ) (! (= (type (|wand_6#ft| arg0@@49 arg1@@69 arg2@@62 arg3@@57 arg4@@39 arg5@@21 arg6@@18)) (FieldType WandType_wand_6Type FrameTypeType))
 :qid |funType:wand_6#ft|
 :pattern ( (|wand_6#ft| arg0@@49 arg1@@69 arg2@@62 arg3@@57 arg4@@39 arg5@@21 arg6@@18))
)) (forall ((arg0@@50 T@U) (arg1@@70 Real) (arg2@@63 T@U) (arg3@@58 Int) (arg4@@40 T@U) (arg5@@22 Real) (arg6@@19 Bool) ) (! (= (type (|wand_6#sm| arg0@@50 arg1@@70 arg2@@63 arg3@@58 arg4@@40 arg5@@22 arg6@@19)) (FieldType WandType_wand_6Type (MapType0Type RefType boolType)))
 :qid |funType:wand_6#sm|
 :pattern ( (|wand_6#sm| arg0@@50 arg1@@70 arg2@@63 arg3@@58 arg4@@40 arg5@@22 arg6@@19))
))))
(assert (forall ((arg1@@71 T@U) (arg2@@64 Real) (arg3@@59 T@U) (arg4@@41 Int) (arg5@@23 T@U) (arg6@@20 Real) (arg7@@10 Bool) ) (!  (=> (and (and (= (type arg1@@71) RefType) (= (type arg3@@59) RefType)) (= (type arg5@@23) RefType)) (= (|wand_6#sm| arg1@@71 arg2@@64 arg3@@59 arg4@@41 arg5@@23 arg6@@20 arg7@@10) (WandMaskField (|wand_6#ft| arg1@@71 arg2@@64 arg3@@59 arg4@@41 arg5@@23 arg6@@20 arg7@@10))))
 :qid |stdinbpl.363:15|
 :skolemid |61|
 :pattern ( (WandMaskField (|wand_6#ft| arg1@@71 arg2@@64 arg3@@59 arg4@@41 arg5@@23 arg6@@20 arg7@@10)))
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
 :qid |stdinbpl.169:25|
 :skolemid |20|
 :pattern ( (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))
)))
(assert (forall ((arg1@@72 T@U) (arg2@@65 Real) (arg3@@60 T@U) (arg4@@42 Int) (arg5@@24 T@U) (arg6@@21 Real) (arg7@@11 Bool) ) (!  (=> (and (and (= (type arg1@@72) RefType) (= (type arg3@@60) RefType)) (= (type arg5@@24) RefType)) (IsWandField (wand_6 arg1@@72 arg2@@65 arg3@@60 arg4@@42 arg5@@24 arg6@@21 arg7@@11)))
 :qid |stdinbpl.347:15|
 :skolemid |57|
 :pattern ( (wand_6 arg1@@72 arg2@@65 arg3@@60 arg4@@42 arg5@@24 arg6@@21 arg7@@11))
)))
(assert (forall ((arg1@@73 T@U) (arg2@@66 Real) (arg3@@61 T@U) (arg4@@43 Int) (arg5@@25 T@U) (arg6@@22 Real) (arg7@@12 Bool) ) (!  (=> (and (and (= (type arg1@@73) RefType) (= (type arg3@@61) RefType)) (= (type arg5@@25) RefType)) (IsWandField (|wand_6#ft| arg1@@73 arg2@@66 arg3@@61 arg4@@43 arg5@@25 arg6@@22 arg7@@12)))
 :qid |stdinbpl.351:15|
 :skolemid |58|
 :pattern ( (|wand_6#ft| arg1@@73 arg2@@66 arg3@@61 arg4@@43 arg5@@25 arg6@@22 arg7@@12))
)))
(assert (forall ((arg1@@74 T@U) (arg2@@67 Real) (arg3@@62 T@U) (arg4@@44 Int) (arg5@@26 T@U) (arg6@@23 Real) (arg7@@13 Bool) ) (!  (=> (and (and (= (type arg1@@74) RefType) (= (type arg3@@62) RefType)) (= (type arg5@@26) RefType)) (not (IsPredicateField (wand_6 arg1@@74 arg2@@67 arg3@@62 arg4@@44 arg5@@26 arg6@@23 arg7@@13))))
 :qid |stdinbpl.355:15|
 :skolemid |59|
 :pattern ( (wand_6 arg1@@74 arg2@@67 arg3@@62 arg4@@44 arg5@@26 arg6@@23 arg7@@13))
)))
(assert (forall ((arg1@@75 T@U) (arg2@@68 Real) (arg3@@63 T@U) (arg4@@45 Int) (arg5@@27 T@U) (arg6@@24 Real) (arg7@@14 Bool) ) (!  (=> (and (and (= (type arg1@@75) RefType) (= (type arg3@@63) RefType)) (= (type arg5@@27) RefType)) (not (IsPredicateField (|wand_6#ft| arg1@@75 arg2@@68 arg3@@63 arg4@@45 arg5@@27 arg6@@24 arg7@@14))))
 :qid |stdinbpl.359:15|
 :skolemid |60|
 :pattern ( (|wand_6#ft| arg1@@75 arg2@@68 arg3@@63 arg4@@45 arg5@@27 arg6@@24 arg7@@14))
)))
(assert (forall ((arg1@@76 T@U) (arg2@@69 Real) (arg3@@64 T@U) (arg4@@46 Int) (arg5@@28 T@U) (arg6@@25 Real) (arg7@@15 Bool) ) (!  (=> (and (and (= (type arg1@@76) RefType) (= (type arg3@@64) RefType)) (= (type arg5@@28) RefType)) (= (getPredWandId (wand_6 arg1@@76 arg2@@69 arg3@@64 arg4@@46 arg5@@28 arg6@@25 arg7@@15)) 7))
 :qid |stdinbpl.367:15|
 :skolemid |62|
 :pattern ( (wand_6 arg1@@76 arg2@@69 arg3@@64 arg4@@46 arg5@@28 arg6@@25 arg7@@15))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
(assert (forall ((arg1@@77 T@U) (arg2@@70 Real) (arg3@@65 T@U) (arg4@@47 Real) (arg1_2@@3 T@U) (arg2_2@@3 Real) (arg3_2@@3 T@U) (arg4_2@@2 Real) ) (!  (=> (and (and (and (and (= (type arg1@@77) RefType) (= (type arg3@@65) RefType)) (= (type arg1_2@@3) RefType)) (= (type arg3_2@@3) RefType)) (= (wand_4 arg1@@77 arg2@@70 arg3@@65 arg4@@47) (wand_4 arg1_2@@3 arg2_2@@3 arg3_2@@3 arg4_2@@2))) (and (= arg1@@77 arg1_2@@3) (and (= arg2@@70 arg2_2@@3) (and (= arg3@@65 arg3_2@@3) (= arg4@@47 arg4_2@@2)))))
 :qid |stdinbpl.211:15|
 :skolemid |28|
 :pattern ( (wand_4 arg1@@77 arg2@@70 arg3@@65 arg4@@47) (wand_4 arg1_2@@3 arg2_2@@3 arg3_2@@3 arg4_2@@2))
)))
(assert (forall ((arg1@@78 T@U) (arg2@@71 Real) (arg3@@66 T@U) (arg4@@48 Real) (arg1_2@@4 T@U) (arg2_2@@4 Real) (arg3_2@@4 T@U) (arg4_2@@3 Real) ) (!  (=> (and (and (and (and (= (type arg1@@78) RefType) (= (type arg3@@66) RefType)) (= (type arg1_2@@4) RefType)) (= (type arg3_2@@4) RefType)) (= (wand arg1@@78 arg2@@71 arg3@@66 arg4@@48) (wand arg1_2@@4 arg2_2@@4 arg3_2@@4 arg4_2@@3))) (and (= arg1@@78 arg1_2@@4) (and (= arg2@@71 arg2_2@@4) (and (= arg3@@66 arg3_2@@4) (= arg4@@48 arg4_2@@3)))))
 :qid |stdinbpl.275:15|
 :skolemid |42|
 :pattern ( (wand arg1@@78 arg2@@71 arg3@@66 arg4@@48) (wand arg1_2@@4 arg2_2@@4 arg3_2@@4 arg4_2@@3))
)))
(assert (forall ((arg1@@79 T@U) (arg2@@72 Real) (arg3@@67 T@U) (arg4@@49 Real) (arg1_2@@5 T@U) (arg2_2@@5 Real) (arg3_2@@5 T@U) (arg4_2@@4 Real) ) (!  (=> (and (and (and (and (= (type arg1@@79) RefType) (= (type arg3@@67) RefType)) (= (type arg1_2@@5) RefType)) (= (type arg3_2@@5) RefType)) (= (wand_3 arg1@@79 arg2@@72 arg3@@67 arg4@@49) (wand_3 arg1_2@@5 arg2_2@@5 arg3_2@@5 arg4_2@@4))) (and (= arg1@@79 arg1_2@@5) (and (= arg2@@72 arg2_2@@5) (and (= arg3@@67 arg3_2@@5) (= arg4@@49 arg4_2@@4)))))
 :qid |stdinbpl.339:15|
 :skolemid |56|
 :pattern ( (wand_3 arg1@@79 arg2@@72 arg3@@67 arg4@@49) (wand_3 arg1_2@@5 arg2_2@@5 arg3_2@@5 arg4_2@@4))
)))
(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun Mask@0 () T@U)
(declare-fun x@@28 () T@U)
(declare-fun PostMask@0 () T@U)
(declare-fun PostHeap@0 () T@U)
(declare-fun Mask@7 () T@U)
(declare-fun Mask@6 () T@U)
(declare-fun ExhaleHeap@0 () T@U)
(declare-fun Heap@@19 () T@U)
(declare-fun Mask@5 () T@U)
(declare-fun Mask@4 () T@U)
(declare-fun Heap@1 () T@U)
(declare-fun b_17@4 () Bool)
(declare-fun b_18@6 () Bool)
(declare-fun neededTransfer@3 () Real)
(declare-fun Used_8Mask@3 () T@U)
(declare-fun initNeededTransfer@0 () Real)
(declare-fun b_19@0 () Bool)
(declare-fun b_19@1 () Bool)
(declare-fun Result_6Heap () T@U)
(declare-fun Result_6Mask () T@U)
(declare-fun b_19@2 () Bool)
(declare-fun Ops_7Mask () T@U)
(declare-fun b_19@3 () Bool)
(declare-fun Ops_7Heap@0 () T@U)
(declare-fun Used_8Heap@0 () T@U)
(declare-fun b_19@4 () Bool)
(declare-fun b_17@5 () Bool)
(declare-fun Mask@3 () T@U)
(declare-fun Mask@2 () T@U)
(declare-fun takeTransfer@1 () Real)
(declare-fun neededTransfer@1 () Real)
(declare-fun b_18@3 () Bool)
(declare-fun Used_8Mask@1 () T@U)
(declare-fun neededTransfer@2 () Real)
(declare-fun Used_8Mask@2 () T@U)
(declare-fun b_18@4 () Bool)
(declare-fun TempMask@1 () T@U)
(declare-fun b_18@5 () Bool)
(declare-fun Mask@1 () T@U)
(declare-fun newPMask@0 () T@U)
(declare-fun Heap@0 () T@U)
(declare-fun maskTransfer@1 () Real)
(declare-fun takeTransfer@0 () Real)
(declare-fun b_18@0 () Bool)
(declare-fun neededTransfer@0 () Real)
(declare-fun Used_8Mask@0 () T@U)
(declare-fun b_18@1 () Bool)
(declare-fun TempMask@0 () T@U)
(declare-fun b_18@2 () Bool)
(declare-fun Ops_7Mask@2 () T@U)
(declare-fun Ops_7Mask@1 () T@U)
(declare-fun maskTransfer@0 () Real)
(declare-fun b_17@3 () Bool)
(declare-fun b_17@2 () Bool)
(declare-fun b_18 () Bool)
(declare-fun b_17@0 () Bool)
(declare-fun Ops_7Mask@0 () T@U)
(declare-fun b_17@1 () Bool)
(declare-fun b_17 () Bool)
(declare-fun b_16@0 () Bool)
(declare-fun b_16 () Bool)
(declare-fun Used_7Heap@0 () T@U)
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (= (type Mask@7) (MapType0Type RefType realType)) (= (type Mask@6) (MapType0Type RefType realType))) (= (type x@@28) RefType)) (= (type ExhaleHeap@0) (MapType1Type RefType))) (= (type Heap@@19) (MapType1Type RefType))) (= (type Mask@5) (MapType0Type RefType realType))) (= (type Mask@4) (MapType0Type RefType realType))) (= (type Heap@1) (MapType1Type RefType))) (= (type Used_8Mask@3) (MapType0Type RefType realType))) (= (type Result_6Heap) (MapType1Type RefType))) (= (type Result_6Mask) (MapType0Type RefType realType))) (= (type Ops_7Mask) (MapType0Type RefType realType))) (= (type Ops_7Heap@0) (MapType1Type RefType))) (= (type Used_8Heap@0) (MapType1Type RefType))) (= (type Mask@3) (MapType0Type RefType realType))) (= (type Mask@2) (MapType0Type RefType realType))) (= (type Mask@0) (MapType0Type RefType realType))) (= (type Used_8Mask@1) (MapType0Type RefType realType))) (= (type Used_8Mask@2) (MapType0Type RefType realType))) (= (type TempMask@1) (MapType0Type RefType realType))) (= (type Mask@1) (MapType0Type RefType realType))) (= (type newPMask@0) (MapType0Type RefType boolType))) (= (type Heap@0) (MapType1Type RefType))) (= (type Used_8Mask@0) (MapType0Type RefType realType))) (= (type TempMask@0) (MapType0Type RefType realType))) (= (type Ops_7Mask@2) (MapType0Type RefType realType))) (= (type Ops_7Mask@1) (MapType0Type RefType realType))) (= (type Ops_7Mask@0) (MapType0Type RefType realType))) (= (type Used_7Heap@0) (MapType1Type RefType))) (= (type PostMask@0) (MapType0Type RefType realType))) (= (type PostHeap@0) (MapType1Type RefType))))
(set-info :boogie-vc-id test3)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 41) (let ((anon8_correct true))
(let ((anon33_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 38) 35)) anon8_correct)))
(let ((anon33_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 36) (- 0 37)) (<= FullPerm (U_2_real (MapType0Select Mask@0 null (List x@@28))))) (=> (<= FullPerm (U_2_real (MapType0Select Mask@0 null (List x@@28)))) (=> (= (ControlFlow 0 36) 35) anon8_correct))))))
(let ((anon4_correct true))
(let ((anon31_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 34) 31)) anon4_correct)))
(let ((anon31_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 32) (- 0 33)) (<= FullPerm (U_2_real (MapType0Select PostMask@0 null (List x@@28))))) (=> (<= FullPerm (U_2_real (MapType0Select PostMask@0 null (List x@@28)))) (=> (= (ControlFlow 0 32) 31) anon4_correct))))))
(let ((anon32_Else_correct true))
(let ((anon29_Then_correct  (=> (and (and (state PostHeap@0 ZeroMask) (= PostMask@0 (MapType0Store ZeroMask null (List x@@28) (real_2_U (+ (U_2_real (MapType0Select ZeroMask null (List x@@28))) FullPerm))))) (and (state PostHeap@0 PostMask@0) (state PostHeap@0 PostMask@0))) (and (and (and (and (=> (= (ControlFlow 0 39) 30) anon32_Else_correct) (=> (= (ControlFlow 0 39) 36) anon33_Then_correct)) (=> (= (ControlFlow 0 39) 38) anon33_Else_correct)) (=> (= (ControlFlow 0 39) 32) anon31_Then_correct)) (=> (= (ControlFlow 0 39) 34) anon31_Else_correct)))))
(let ((anon28_correct  (=> (and (= Mask@7 (MapType0Store Mask@6 null (List x@@28) (real_2_U (- (U_2_real (MapType0Select Mask@6 null (List x@@28))) FullPerm)))) (= (ControlFlow 0 2) (- 0 1))) (= (length ExhaleHeap@0 x@@28) (length Heap@@19 x@@28)))))
(let ((anon42_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 5) 2)) anon28_correct)))
(let ((anon42_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 3) (- 0 4)) (<= FullPerm (U_2_real (MapType0Select Mask@6 null (List x@@28))))) (=> (<= FullPerm (U_2_real (MapType0Select Mask@6 null (List x@@28)))) (=> (= (ControlFlow 0 3) 2) anon28_correct))))))
(let ((anon26_correct  (=> (and (and (and (= Mask@5 (MapType0Store Mask@4 null (List x@@28) (real_2_U (- (U_2_real (MapType0Select Mask@4 null (List x@@28))) FullPerm)))) (state Heap@1 Mask@5)) (and (= Mask@6 (MapType0Store Mask@5 null (List x@@28) (real_2_U (+ (U_2_real (MapType0Select Mask@5 null (List x@@28))) FullPerm)))) (state Heap@1 Mask@6))) (and (and (state Heap@1 Mask@6) (IdenticalOnKnownLocations Heap@1 ExhaleHeap@0 Mask@6)) (and (state ExhaleHeap@0 Mask@6) (state ExhaleHeap@0 Mask@6)))) (and (=> (= (ControlFlow 0 6) 3) anon42_Then_correct) (=> (= (ControlFlow 0 6) 5) anon42_Else_correct)))))
(let ((anon41_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 9) 6)) anon26_correct)))
(let ((anon41_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 7) (- 0 8)) (<= FullPerm (U_2_real (MapType0Select Mask@4 null (List x@@28))))) (=> (<= FullPerm (U_2_real (MapType0Select Mask@4 null (List x@@28)))) (=> (= (ControlFlow 0 7) 6) anon26_correct))))))
(let ((anon24_correct  (and (=> (= (ControlFlow 0 10) (- 0 12)) (=> (and (and b_17@4 b_17@4) b_18@6) (and (= neededTransfer@3 0.0) (= (U_2_real (MapType0Select Used_8Mask@3 null (List x@@28))) initNeededTransfer@0)))) (=> (=> (and (and b_17@4 b_17@4) b_18@6) (and (= neededTransfer@3 0.0) (= (U_2_real (MapType0Select Used_8Mask@3 null (List x@@28))) initNeededTransfer@0))) (=> (and (= b_19@0  (and b_17@4 b_18@6)) (= b_19@1  (and b_19@0 (state Result_6Heap Result_6Mask)))) (=> (and (and (and (= b_19@2  (and b_19@1 (sumMask Result_6Mask Ops_7Mask Used_8Mask@3))) (= b_19@3  (and (and b_19@2 (IdenticalOnKnownLocations Ops_7Heap@0 Result_6Heap Ops_7Mask)) (IdenticalOnKnownLocations Used_8Heap@0 Result_6Heap Used_8Mask@3)))) (and (= b_19@4  (and b_19@3 (state Result_6Heap Result_6Mask))) (= b_17@5  (and b_17@4 b_19@4)))) (and (and (= Mask@3 (MapType0Store Mask@2 null (wand_3 x@@28 FullPerm x@@28 FullPerm) (real_2_U (+ (U_2_real (MapType0Select Mask@2 null (wand_3 x@@28 FullPerm x@@28 FullPerm))) FullPerm)))) (state Heap@1 Mask@3)) (and (state Heap@1 Mask@3) (state Heap@1 Mask@3)))) (and (=> (= (ControlFlow 0 10) (- 0 11)) (<= FullPerm (U_2_real (MapType0Select Mask@3 null (wand_3 x@@28 FullPerm x@@28 FullPerm))))) (=> (<= FullPerm (U_2_real (MapType0Select Mask@3 null (wand_3 x@@28 FullPerm x@@28 FullPerm)))) (=> (and (= Mask@4 (MapType0Store Mask@3 null (wand_3 x@@28 FullPerm x@@28 FullPerm) (real_2_U (- (U_2_real (MapType0Select Mask@3 null (wand_3 x@@28 FullPerm x@@28 FullPerm))) FullPerm)))) (state Heap@1 Mask@4)) (and (=> (= (ControlFlow 0 10) 7) anon41_Then_correct) (=> (= (ControlFlow 0 10) 9) anon41_Else_correct)))))))))))
(let ((anon40_Else_correct  (=> (>= 0.0 takeTransfer@1) (=> (and (= Mask@2 Mask@0) (= neededTransfer@3 neededTransfer@1)) (=> (and (and (= b_18@6 b_18@3) (= Used_8Mask@3 Used_8Mask@1)) (and (= Heap@1 Heap@@19) (= (ControlFlow 0 15) 10))) anon24_correct)))))
(let ((anon40_Then_correct  (=> (> takeTransfer@1 0.0) (=> (and (= neededTransfer@2 (- neededTransfer@1 takeTransfer@1)) (= Used_8Mask@2 (MapType0Store Used_8Mask@1 null (List x@@28) (real_2_U (+ (U_2_real (MapType0Select Used_8Mask@1 null (List x@@28))) takeTransfer@1))))) (=> (and (and (= b_18@4  (and b_18@3 (state Used_8Heap@0 Used_8Mask@2))) (= TempMask@1 (MapType0Store ZeroMask null (List x@@28) (real_2_U FullPerm)))) (and (= b_18@5  (and b_18@4 (IdenticalOnKnownLocations Heap@@19 Used_8Heap@0 TempMask@1))) (= Mask@1 (MapType0Store Mask@0 null (List x@@28) (real_2_U (- (U_2_real (MapType0Select Mask@0 null (List x@@28))) takeTransfer@1)))))) (=> (and (and (and (forall ((o_6 T@U) (f_11 T@U) ) (! (let ((B@@11 (FieldTypeInv1 (type f_11))))
(let ((A@@12 (FieldTypeInv0 (type f_11))))
 (=> (and (and (= (type o_6) RefType) (= (type f_11) (FieldType A@@12 B@@11))) (or (U_2_bool (MapType0Select (MapType1Select Heap@@19 null (|wand_3#sm| x@@28 FullPerm x@@28 FullPerm)) o_6 f_11)) (U_2_bool (MapType0Select (MapType1Select Heap@@19 null (|List#sm| x@@28)) o_6 f_11)))) (U_2_bool (MapType0Select newPMask@0 o_6 f_11)))))
 :qid |stdinbpl.1887:35|
 :skolemid |94|
 :pattern ( (MapType0Select newPMask@0 o_6 f_11))
)) (= Heap@0 (MapType1Store Heap@@19 null (|wand_3#sm| x@@28 FullPerm x@@28 FullPerm) newPMask@0))) (and (= Mask@2 Mask@1) (= neededTransfer@3 neededTransfer@2))) (and (and (= b_18@6 b_18@5) (= Used_8Mask@3 Used_8Mask@2)) (and (= Heap@1 Heap@0) (= (ControlFlow 0 14) 10)))) anon24_correct))))))
(let ((anon39_Else_correct  (=> (and (< maskTransfer@1 neededTransfer@1) (= takeTransfer@1 maskTransfer@1)) (and (=> (= (ControlFlow 0 17) 14) anon40_Then_correct) (=> (= (ControlFlow 0 17) 15) anon40_Else_correct)))))
(let ((anon39_Then_correct  (=> (and (<= neededTransfer@1 maskTransfer@1) (= takeTransfer@1 neededTransfer@1)) (and (=> (= (ControlFlow 0 16) 14) anon40_Then_correct) (=> (= (ControlFlow 0 16) 15) anon40_Else_correct)))))
(let ((anon38_Then_correct  (=> (and (and (and (and (and b_17@4 b_17@4) b_18@3) true) (> neededTransfer@1 0.0)) (= maskTransfer@1 (U_2_real (MapType0Select Mask@0 null (List x@@28))))) (and (=> (= (ControlFlow 0 18) 16) anon39_Then_correct) (=> (= (ControlFlow 0 18) 17) anon39_Else_correct)))))
(let ((anon38_Else_correct  (=> (not (and (and (and (and b_17@4 b_17@4) b_18@3) true) (> neededTransfer@1 0.0))) (=> (and (= Mask@2 Mask@0) (= neededTransfer@3 neededTransfer@1)) (=> (and (and (= b_18@6 b_18@3) (= Used_8Mask@3 Used_8Mask@1)) (and (= Heap@1 Heap@@19) (= (ControlFlow 0 13) 10))) anon24_correct)))))
(let ((anon37_Else_correct  (=> (and (and (>= 0.0 takeTransfer@0) (= Used_8Mask@1 ZeroMask)) (and (= b_18@3 b_18@0) (= neededTransfer@1 FullPerm))) (and (=> (= (ControlFlow 0 21) 18) anon38_Then_correct) (=> (= (ControlFlow 0 21) 13) anon38_Else_correct)))))
(let ((anon37_Then_correct  (=> (and (> takeTransfer@0 0.0) (= neededTransfer@0 (- FullPerm takeTransfer@0))) (=> (and (and (and (= Used_8Mask@0 (MapType0Store ZeroMask null (List x@@28) (real_2_U (+ (U_2_real (MapType0Select ZeroMask null (List x@@28))) takeTransfer@0)))) (= b_18@1  (and b_18@0 (state Used_8Heap@0 Used_8Mask@0)))) (and (= TempMask@0 (MapType0Store ZeroMask null (List x@@28) (real_2_U FullPerm))) (= b_18@2  (and b_18@1 (IdenticalOnKnownLocations Ops_7Heap@0 Used_8Heap@0 TempMask@0))))) (and (and (= Ops_7Mask@2 (MapType0Store Ops_7Mask@1 null (List x@@28) (real_2_U (- (U_2_real (MapType0Select Ops_7Mask@1 null (List x@@28))) takeTransfer@0)))) (= Used_8Mask@1 Used_8Mask@0)) (and (= b_18@3 b_18@2) (= neededTransfer@1 neededTransfer@0)))) (and (=> (= (ControlFlow 0 20) 18) anon38_Then_correct) (=> (= (ControlFlow 0 20) 13) anon38_Else_correct))))))
(let ((anon36_Else_correct  (=> (and (< maskTransfer@0 FullPerm) (= takeTransfer@0 maskTransfer@0)) (and (=> (= (ControlFlow 0 23) 20) anon37_Then_correct) (=> (= (ControlFlow 0 23) 21) anon37_Else_correct)))))
(let ((anon36_Then_correct  (=> (and (<= FullPerm maskTransfer@0) (= takeTransfer@0 FullPerm)) (and (=> (= (ControlFlow 0 22) 20) anon37_Then_correct) (=> (= (ControlFlow 0 22) 21) anon37_Else_correct)))))
(let ((anon35_Then_correct  (=> (and (and (and (and (and b_17@4 b_17@4) b_18@0) true) (> FullPerm 0.0)) (= maskTransfer@0 (U_2_real (MapType0Select Ops_7Mask@1 null (List x@@28))))) (and (=> (= (ControlFlow 0 24) 22) anon36_Then_correct) (=> (= (ControlFlow 0 24) 23) anon36_Else_correct)))))
(let ((anon35_Else_correct  (=> (and (and (not (and (and (and (and b_17@4 b_17@4) b_18@0) true) (> FullPerm 0.0))) (= Used_8Mask@1 ZeroMask)) (and (= b_18@3 b_18@0) (= neededTransfer@1 FullPerm))) (and (=> (= (ControlFlow 0 19) 18) anon38_Then_correct) (=> (= (ControlFlow 0 19) 13) anon38_Else_correct)))))
(let ((anon12_correct  (=> (and (and (= b_17@3  (and b_17@2 (state Ops_7Heap@0 Ops_7Mask@1))) (= b_17@4  (and b_17@3 (state Ops_7Heap@0 Ops_7Mask@1)))) (and (= b_18@0  (and b_18 (state Used_8Heap@0 ZeroMask))) (= initNeededTransfer@0 (+ (U_2_real (MapType0Select ZeroMask null (List x@@28))) FullPerm)))) (and (=> (= (ControlFlow 0 25) (- 0 26)) (>= FullPerm 0.0)) (=> (>= FullPerm 0.0) (and (=> (= (ControlFlow 0 25) 24) anon35_Then_correct) (=> (= (ControlFlow 0 25) 19) anon35_Else_correct)))))))
(let ((anon34_Else_correct  (=> (and (and (not b_17@0) (= Ops_7Mask@1 ZeroMask)) (and (= b_17@2 b_17@0) (= (ControlFlow 0 28) 25))) anon12_correct)))
(let ((anon34_Then_correct  (=> (and b_17@0 (= Ops_7Mask@0 (MapType0Store ZeroMask null (List x@@28) (real_2_U (+ (U_2_real (MapType0Select ZeroMask null (List x@@28))) FullPerm))))) (=> (and (and (= b_17@1  (and b_17@0 (state Ops_7Heap@0 Ops_7Mask@0))) (= Ops_7Mask@1 Ops_7Mask@0)) (and (= b_17@2 b_17@1) (= (ControlFlow 0 27) 25))) anon12_correct))))
(let ((anon29_Else_correct  (=> (and (= b_17@0  (and b_17 (state Ops_7Heap@0 ZeroMask))) (= b_16@0  (and b_16 (state Used_7Heap@0 ZeroMask)))) (and (=> (= (ControlFlow 0 29) 27) anon34_Then_correct) (=> (= (ControlFlow 0 29) 28) anon34_Else_correct)))))
(let ((anon0_correct  (=> (and (state Heap@@19 ZeroMask) (= AssumeFunctionsAbove (- 0 1))) (=> (and (and (U_2_bool (MapType1Select Heap@@19 x@@28 $allocated)) (= Mask@0 (MapType0Store ZeroMask null (List x@@28) (real_2_U (+ (U_2_real (MapType0Select ZeroMask null (List x@@28))) FullPerm))))) (and (state Heap@@19 Mask@0) (state Heap@@19 Mask@0))) (and (=> (= (ControlFlow 0 40) 39) anon29_Then_correct) (=> (= (ControlFlow 0 40) 29) anon29_Else_correct))))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 41) 40) anon0_correct)))
PreconditionGeneratedEntry_correct))))))))))))))))))))))))))))))))))
))
(check-sat)
(pop 1)
; Valid
(get-info :rlimit)
