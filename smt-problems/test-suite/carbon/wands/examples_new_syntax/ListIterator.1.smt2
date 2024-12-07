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
(declare-fun Iterator_iteratee () T@U)
(declare-fun Iterator_current () T@U)
(declare-fun Iterator_last () T@U)
(declare-fun List_sentinel () T@U)
(declare-fun Node_val () T@U)
(declare-fun Node_prev () T@U)
(declare-fun Node_next () T@U)
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
(declare-fun wand (T@U Real T@U Real) T@U)
(declare-fun getPredWandId (T@U) Int)
(declare-fun WandType_wandType () T@T)
(declare-fun wand_1 (T@U Real T@U Real) T@U)
(declare-fun WandType_wand_1Type () T@T)
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
(declare-fun Iterator_ready (T@U) T@U)
(declare-fun PredicateType_Iterator_readyType () T@T)
(declare-fun Iterator_readyForNext (T@U) T@U)
(declare-fun PredicateType_Iterator_readyForNextType () T@T)
(declare-fun Iterator_readyForRemove (T@U) T@U)
(declare-fun PredicateType_Iterator_readyForRemoveType () T@T)
(declare-fun List_state (T@U) T@U)
(declare-fun PredicateType_List_stateType () T@T)
(declare-fun Node_state (T@U) T@U)
(declare-fun PredicateType_Node_stateType () T@T)
(declare-fun Node_reverse (T@U) T@U)
(declare-fun PredicateType_Node_reverseType () T@T)
(declare-fun |Node_get_next'| (T@U T@U) T@U)
(declare-fun dummyFunction (T@U) Bool)
(declare-fun |Node_get_next#triggerStateless| (T@U) T@U)
(declare-fun |Node_get_prev'| (T@U T@U) T@U)
(declare-fun |Node_get_prev#triggerStateless| (T@U) T@U)
(declare-fun |Node_rev_next'| (T@U T@U) T@U)
(declare-fun |Node_rev_next#triggerStateless| (T@U) T@U)
(declare-fun |Node_rev_prev'| (T@U T@U) T@U)
(declare-fun |Node_rev_prev#triggerStateless| (T@U) T@U)
(declare-fun |Node_first'| (T@U T@U) T@U)
(declare-fun |Node_first#triggerStateless| (T@U) T@U)
(declare-fun |Iterator_ready#trigger| (T@U T@U) Bool)
(declare-fun |Iterator_ready#everUsed| (T@U) Bool)
(declare-fun |Iterator_readyForNext#trigger| (T@U T@U) Bool)
(declare-fun |Iterator_readyForNext#everUsed| (T@U) Bool)
(declare-fun |Iterator_readyForRemove#trigger| (T@U T@U) Bool)
(declare-fun |Iterator_readyForRemove#everUsed| (T@U) Bool)
(declare-fun |List_state#trigger| (T@U T@U) Bool)
(declare-fun |List_state#everUsed| (T@U) Bool)
(declare-fun |Node_state#trigger| (T@U T@U) Bool)
(declare-fun |Node_state#everUsed| (T@U) Bool)
(declare-fun |Node_reverse#trigger| (T@U T@U) Bool)
(declare-fun |Node_reverse#everUsed| (T@U) Bool)
(declare-fun Node_get_next (T@U T@U) T@U)
(declare-fun Node_get_prev (T@U T@U) T@U)
(declare-fun Node_rev_next (T@U T@U) T@U)
(declare-fun Node_rev_prev (T@U T@U) T@U)
(declare-fun Node_first (T@U T@U) T@U)
(declare-fun |Iterator_ready#sm| (T@U) T@U)
(declare-fun |Iterator_readyForNext#sm| (T@U) T@U)
(declare-fun |Iterator_readyForRemove#sm| (T@U) T@U)
(declare-fun |List_state#sm| (T@U) T@U)
(declare-fun |Node_state#sm| (T@U) T@U)
(declare-fun |Node_reverse#sm| (T@U) T@U)
(declare-fun dummyHeap () T@U)
(declare-fun ZeroMask () T@U)
(declare-fun InsidePredicate (T@U T@U T@U T@U) Bool)
(declare-fun sumMask (T@U T@U T@U) Bool)
(declare-fun |wand#ft| (T@U Real T@U Real) T@U)
(declare-fun |wand_1#ft| (T@U Real T@U Real) T@U)
(declare-fun ConditionalFrame (Real T@U) T@U)
(declare-fun EmptyFrame () T@U)
(declare-fun NoPerm () Real)
(declare-fun |wand#sm| (T@U Real T@U Real) T@U)
(declare-fun |wand_1#sm| (T@U Real T@U Real) T@U)
(declare-fun FullPerm () Real)
(declare-fun |Node_get_next#frame| (T@U T@U) T@U)
(declare-fun |Node_get_prev#frame| (T@U T@U) T@U)
(declare-fun |Node_rev_next#frame| (T@U T@U) T@U)
(declare-fun |Node_rev_prev#frame| (T@U T@U) T@U)
(declare-fun |Node_first#frame| (T@U T@U) T@U)
(declare-fun AssumeFunctionsAbove () Int)
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
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (forall ((arg0@@11 T@T) (arg1 T@T) ) (! (= (Ctor (FieldType arg0@@11 arg1)) 6)
 :qid |ctor:FieldType|
)) (forall ((arg0@@12 T@T) (arg1@@0 T@T) ) (! (= (FieldTypeInv0 (FieldType arg0@@12 arg1@@0)) arg0@@12)
 :qid |typeInv:FieldTypeInv0|
 :pattern ( (FieldType arg0@@12 arg1@@0))
))) (forall ((arg0@@13 T@T) (arg1@@1 T@T) ) (! (= (FieldTypeInv1 (FieldType arg0@@13 arg1@@1)) arg1@@1)
 :qid |typeInv:FieldTypeInv1|
 :pattern ( (FieldType arg0@@13 arg1@@1))
))) (= (Ctor NormalFieldType) 7)) (= (type $allocated) (FieldType NormalFieldType boolType))) (= (Ctor RefType) 8)) (= (type Iterator_iteratee) (FieldType NormalFieldType RefType))) (= (type Iterator_current) (FieldType NormalFieldType RefType))) (= (type Iterator_last) (FieldType NormalFieldType RefType))) (= (type List_sentinel) (FieldType NormalFieldType RefType))) (= (type Node_val) (FieldType NormalFieldType intType))) (= (type Node_prev) (FieldType NormalFieldType RefType))) (= (type Node_next) (FieldType NormalFieldType RefType))))
(assert (distinct $allocated Iterator_iteratee Iterator_current Iterator_last List_sentinel Node_val Node_prev Node_next)
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
(assert  (and (= (Ctor WandType_wandType) 10) (forall ((arg0@@18 T@U) (arg1@@4 Real) (arg2@@1 T@U) (arg3@@0 Real) ) (! (= (type (wand arg0@@18 arg1@@4 arg2@@1 arg3@@0)) (FieldType WandType_wandType intType))
 :qid |funType:wand|
 :pattern ( (wand arg0@@18 arg1@@4 arg2@@1 arg3@@0))
))))
(assert (forall ((arg1@@5 T@U) (arg2@@2 Real) (arg3@@1 T@U) (arg4 Real) ) (!  (=> (and (= (type arg1@@5) RefType) (= (type arg3@@1) RefType)) (= (getPredWandId (wand arg1@@5 arg2@@2 arg3@@1 arg4)) 6))
 :qid |stdinbpl.210:15|
 :skolemid |27|
 :pattern ( (wand arg1@@5 arg2@@2 arg3@@1 arg4))
)))
(assert  (and (= (Ctor WandType_wand_1Type) 11) (forall ((arg0@@19 T@U) (arg1@@6 Real) (arg2@@3 T@U) (arg3@@2 Real) ) (! (= (type (wand_1 arg0@@19 arg1@@6 arg2@@3 arg3@@2)) (FieldType WandType_wand_1Type intType))
 :qid |funType:wand_1|
 :pattern ( (wand_1 arg0@@19 arg1@@6 arg2@@3 arg3@@2))
))))
(assert (forall ((arg1@@7 T@U) (arg2@@4 Real) (arg3@@3 T@U) (arg4@@0 Real) ) (!  (=> (and (= (type arg1@@7) RefType) (= (type arg3@@3) RefType)) (= (getPredWandId (wand_1 arg1@@7 arg2@@4 arg3@@3 arg4@@0)) 7))
 :qid |stdinbpl.242:15|
 :skolemid |34|
 :pattern ( (wand_1 arg1@@7 arg2@@4 arg3@@3 arg4@@0))
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
(assert  (and (and (= (Ctor FrameTypeType) 13) (= (type null) RefType)) (forall ((arg0@@25 T@U) ) (! (let ((A (FieldTypeInv0 (type arg0@@25))))
(= (type (PredicateMaskField arg0@@25)) (FieldType A (MapType1Type RefType boolType))))
 :qid |funType:PredicateMaskField|
 :pattern ( (PredicateMaskField arg0@@25))
))))
(assert (forall ((Heap@@0 T@U) (ExhaleHeap T@U) (Mask@@0 T@U) (pm_f T@U) ) (! (let ((C (FieldTypeInv0 (type pm_f))))
 (=> (and (and (and (and (and (= (type Heap@@0) (MapType0Type RefType)) (= (type ExhaleHeap) (MapType0Type RefType))) (= (type Mask@@0) (MapType1Type RefType realType))) (= (type pm_f) (FieldType C FrameTypeType))) (IdenticalOnKnownLocations Heap@@0 ExhaleHeap Mask@@0)) (and (HasDirectPerm Mask@@0 null pm_f) (IsPredicateField pm_f))) (= (MapType0Select Heap@@0 null (PredicateMaskField pm_f)) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))))
 :qid |stdinbpl.47:19|
 :skolemid |2|
 :pattern ( (IdenticalOnKnownLocations Heap@@0 ExhaleHeap Mask@@0) (IsPredicateField pm_f) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))
)))
(assert (forall ((arg0@@26 T@U) ) (! (let ((A@@0 (FieldTypeInv0 (type arg0@@26))))
(= (type (WandMaskField arg0@@26)) (FieldType A@@0 (MapType1Type RefType boolType))))
 :qid |funType:WandMaskField|
 :pattern ( (WandMaskField arg0@@26))
)))
(assert (forall ((Heap@@1 T@U) (ExhaleHeap@@0 T@U) (Mask@@1 T@U) (pm_f@@0 T@U) ) (! (let ((C@@0 (FieldTypeInv0 (type pm_f@@0))))
 (=> (and (and (and (and (and (= (type Heap@@1) (MapType0Type RefType)) (= (type ExhaleHeap@@0) (MapType0Type RefType))) (= (type Mask@@1) (MapType1Type RefType realType))) (= (type pm_f@@0) (FieldType C@@0 FrameTypeType))) (IdenticalOnKnownLocations Heap@@1 ExhaleHeap@@0 Mask@@1)) (and (HasDirectPerm Mask@@1 null pm_f@@0) (IsWandField pm_f@@0))) (= (MapType0Select Heap@@1 null (WandMaskField pm_f@@0)) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))))
 :qid |stdinbpl.60:19|
 :skolemid |5|
 :pattern ( (IdenticalOnKnownLocations Heap@@1 ExhaleHeap@@0 Mask@@1) (IsWandField pm_f@@0) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))
)))
(assert  (and (= (Ctor PredicateType_Iterator_readyType) 14) (forall ((arg0@@27 T@U) ) (! (= (type (Iterator_ready arg0@@27)) (FieldType PredicateType_Iterator_readyType FrameTypeType))
 :qid |funType:Iterator_ready|
 :pattern ( (Iterator_ready arg0@@27))
))))
(assert (forall ((this T@U) ) (!  (=> (= (type this) RefType) (IsPredicateField (Iterator_ready this)))
 :qid |stdinbpl.895:15|
 :skolemid |62|
 :pattern ( (Iterator_ready this))
)))
(assert  (and (= (Ctor PredicateType_Iterator_readyForNextType) 15) (forall ((arg0@@28 T@U) ) (! (= (type (Iterator_readyForNext arg0@@28)) (FieldType PredicateType_Iterator_readyForNextType FrameTypeType))
 :qid |funType:Iterator_readyForNext|
 :pattern ( (Iterator_readyForNext arg0@@28))
))))
(assert (forall ((this@@0 T@U) ) (!  (=> (= (type this@@0) RefType) (IsPredicateField (Iterator_readyForNext this@@0)))
 :qid |stdinbpl.1118:15|
 :skolemid |68|
 :pattern ( (Iterator_readyForNext this@@0))
)))
(assert  (and (= (Ctor PredicateType_Iterator_readyForRemoveType) 16) (forall ((arg0@@29 T@U) ) (! (= (type (Iterator_readyForRemove arg0@@29)) (FieldType PredicateType_Iterator_readyForRemoveType FrameTypeType))
 :qid |funType:Iterator_readyForRemove|
 :pattern ( (Iterator_readyForRemove arg0@@29))
))))
(assert (forall ((this@@1 T@U) ) (!  (=> (= (type this@@1) RefType) (IsPredicateField (Iterator_readyForRemove this@@1)))
 :qid |stdinbpl.1348:15|
 :skolemid |74|
 :pattern ( (Iterator_readyForRemove this@@1))
)))
(assert  (and (= (Ctor PredicateType_List_stateType) 17) (forall ((arg0@@30 T@U) ) (! (= (type (List_state arg0@@30)) (FieldType PredicateType_List_stateType FrameTypeType))
 :qid |funType:List_state|
 :pattern ( (List_state arg0@@30))
))))
(assert (forall ((this@@2 T@U) ) (!  (=> (= (type this@@2) RefType) (IsPredicateField (List_state this@@2)))
 :qid |stdinbpl.1635:15|
 :skolemid |80|
 :pattern ( (List_state this@@2))
)))
(assert  (and (= (Ctor PredicateType_Node_stateType) 18) (forall ((arg0@@31 T@U) ) (! (= (type (Node_state arg0@@31)) (FieldType PredicateType_Node_stateType FrameTypeType))
 :qid |funType:Node_state|
 :pattern ( (Node_state arg0@@31))
))))
(assert (forall ((this@@3 T@U) ) (!  (=> (= (type this@@3) RefType) (IsPredicateField (Node_state this@@3)))
 :qid |stdinbpl.1701:15|
 :skolemid |86|
 :pattern ( (Node_state this@@3))
)))
(assert  (and (= (Ctor PredicateType_Node_reverseType) 19) (forall ((arg0@@32 T@U) ) (! (= (type (Node_reverse arg0@@32)) (FieldType PredicateType_Node_reverseType FrameTypeType))
 :qid |funType:Node_reverse|
 :pattern ( (Node_reverse arg0@@32))
))))
(assert (forall ((this@@4 T@U) ) (!  (=> (= (type this@@4) RefType) (IsPredicateField (Node_reverse this@@4)))
 :qid |stdinbpl.1776:15|
 :skolemid |92|
 :pattern ( (Node_reverse this@@4))
)))
(assert  (and (forall ((arg0@@33 T@U) (arg1@@13 T@U) ) (! (= (type (|Node_get_next'| arg0@@33 arg1@@13)) RefType)
 :qid |funType:Node_get_next'|
 :pattern ( (|Node_get_next'| arg0@@33 arg1@@13))
)) (forall ((arg0@@34 T@U) ) (! (= (type (|Node_get_next#triggerStateless| arg0@@34)) RefType)
 :qid |funType:Node_get_next#triggerStateless|
 :pattern ( (|Node_get_next#triggerStateless| arg0@@34))
))))
(assert (forall ((Heap@@2 T@U) (this@@5 T@U) ) (!  (=> (and (= (type Heap@@2) (MapType0Type RefType)) (= (type this@@5) RefType)) (dummyFunction (|Node_get_next#triggerStateless| this@@5)))
 :qid |stdinbpl.288:15|
 :skolemid |37|
 :pattern ( (|Node_get_next'| Heap@@2 this@@5))
)))
(assert  (and (forall ((arg0@@35 T@U) (arg1@@14 T@U) ) (! (= (type (|Node_get_prev'| arg0@@35 arg1@@14)) RefType)
 :qid |funType:Node_get_prev'|
 :pattern ( (|Node_get_prev'| arg0@@35 arg1@@14))
)) (forall ((arg0@@36 T@U) ) (! (= (type (|Node_get_prev#triggerStateless| arg0@@36)) RefType)
 :qid |funType:Node_get_prev#triggerStateless|
 :pattern ( (|Node_get_prev#triggerStateless| arg0@@36))
))))
(assert (forall ((Heap@@3 T@U) (this@@6 T@U) ) (!  (=> (and (= (type Heap@@3) (MapType0Type RefType)) (= (type this@@6) RefType)) (dummyFunction (|Node_get_prev#triggerStateless| this@@6)))
 :qid |stdinbpl.403:15|
 :skolemid |42|
 :pattern ( (|Node_get_prev'| Heap@@3 this@@6))
)))
(assert  (and (forall ((arg0@@37 T@U) (arg1@@15 T@U) ) (! (= (type (|Node_rev_next'| arg0@@37 arg1@@15)) RefType)
 :qid |funType:Node_rev_next'|
 :pattern ( (|Node_rev_next'| arg0@@37 arg1@@15))
)) (forall ((arg0@@38 T@U) ) (! (= (type (|Node_rev_next#triggerStateless| arg0@@38)) RefType)
 :qid |funType:Node_rev_next#triggerStateless|
 :pattern ( (|Node_rev_next#triggerStateless| arg0@@38))
))))
(assert (forall ((Heap@@4 T@U) (this@@7 T@U) ) (!  (=> (and (= (type Heap@@4) (MapType0Type RefType)) (= (type this@@7) RefType)) (dummyFunction (|Node_rev_next#triggerStateless| this@@7)))
 :qid |stdinbpl.518:15|
 :skolemid |47|
 :pattern ( (|Node_rev_next'| Heap@@4 this@@7))
)))
(assert  (and (forall ((arg0@@39 T@U) (arg1@@16 T@U) ) (! (= (type (|Node_rev_prev'| arg0@@39 arg1@@16)) RefType)
 :qid |funType:Node_rev_prev'|
 :pattern ( (|Node_rev_prev'| arg0@@39 arg1@@16))
)) (forall ((arg0@@40 T@U) ) (! (= (type (|Node_rev_prev#triggerStateless| arg0@@40)) RefType)
 :qid |funType:Node_rev_prev#triggerStateless|
 :pattern ( (|Node_rev_prev#triggerStateless| arg0@@40))
))))
(assert (forall ((Heap@@5 T@U) (this@@8 T@U) ) (!  (=> (and (= (type Heap@@5) (MapType0Type RefType)) (= (type this@@8) RefType)) (dummyFunction (|Node_rev_prev#triggerStateless| this@@8)))
 :qid |stdinbpl.635:15|
 :skolemid |52|
 :pattern ( (|Node_rev_prev'| Heap@@5 this@@8))
)))
(assert  (and (forall ((arg0@@41 T@U) (arg1@@17 T@U) ) (! (= (type (|Node_first'| arg0@@41 arg1@@17)) RefType)
 :qid |funType:Node_first'|
 :pattern ( (|Node_first'| arg0@@41 arg1@@17))
)) (forall ((arg0@@42 T@U) ) (! (= (type (|Node_first#triggerStateless| arg0@@42)) RefType)
 :qid |funType:Node_first#triggerStateless|
 :pattern ( (|Node_first#triggerStateless| arg0@@42))
))))
(assert (forall ((Heap@@6 T@U) (this@@9 T@U) ) (!  (=> (and (= (type Heap@@6) (MapType0Type RefType)) (= (type this@@9) RefType)) (dummyFunction (|Node_first#triggerStateless| this@@9)))
 :qid |stdinbpl.752:15|
 :skolemid |57|
 :pattern ( (|Node_first'| Heap@@6 this@@9))
)))
(assert (forall ((Heap@@7 T@U) (this@@10 T@U) ) (!  (=> (and (= (type Heap@@7) (MapType0Type RefType)) (= (type this@@10) RefType)) (|Iterator_ready#everUsed| (Iterator_ready this@@10)))
 :qid |stdinbpl.914:15|
 :skolemid |66|
 :pattern ( (|Iterator_ready#trigger| Heap@@7 (Iterator_ready this@@10)))
)))
(assert (forall ((Heap@@8 T@U) (this@@11 T@U) ) (!  (=> (and (= (type Heap@@8) (MapType0Type RefType)) (= (type this@@11) RefType)) (|Iterator_readyForNext#everUsed| (Iterator_readyForNext this@@11)))
 :qid |stdinbpl.1137:15|
 :skolemid |72|
 :pattern ( (|Iterator_readyForNext#trigger| Heap@@8 (Iterator_readyForNext this@@11)))
)))
(assert (forall ((Heap@@9 T@U) (this@@12 T@U) ) (!  (=> (and (= (type Heap@@9) (MapType0Type RefType)) (= (type this@@12) RefType)) (|Iterator_readyForRemove#everUsed| (Iterator_readyForRemove this@@12)))
 :qid |stdinbpl.1367:15|
 :skolemid |78|
 :pattern ( (|Iterator_readyForRemove#trigger| Heap@@9 (Iterator_readyForRemove this@@12)))
)))
(assert (forall ((Heap@@10 T@U) (this@@13 T@U) ) (!  (=> (and (= (type Heap@@10) (MapType0Type RefType)) (= (type this@@13) RefType)) (|List_state#everUsed| (List_state this@@13)))
 :qid |stdinbpl.1654:15|
 :skolemid |84|
 :pattern ( (|List_state#trigger| Heap@@10 (List_state this@@13)))
)))
(assert (forall ((Heap@@11 T@U) (this@@14 T@U) ) (!  (=> (and (= (type Heap@@11) (MapType0Type RefType)) (= (type this@@14) RefType)) (|Node_state#everUsed| (Node_state this@@14)))
 :qid |stdinbpl.1720:15|
 :skolemid |90|
 :pattern ( (|Node_state#trigger| Heap@@11 (Node_state this@@14)))
)))
(assert (forall ((Heap@@12 T@U) (this@@15 T@U) ) (!  (=> (and (= (type Heap@@12) (MapType0Type RefType)) (= (type this@@15) RefType)) (|Node_reverse#everUsed| (Node_reverse this@@15)))
 :qid |stdinbpl.1795:15|
 :skolemid |96|
 :pattern ( (|Node_reverse#trigger| Heap@@12 (Node_reverse this@@15)))
)))
(assert (forall ((Heap@@13 T@U) (ExhaleHeap@@1 T@U) (Mask@@2 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@13) (MapType0Type RefType)) (= (type ExhaleHeap@@1) (MapType0Type RefType))) (= (type Mask@@2) (MapType1Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@13 ExhaleHeap@@1 Mask@@2)) (U_2_bool (MapType0Select Heap@@13 o_1 $allocated))) (U_2_bool (MapType0Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.73:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@13 ExhaleHeap@@1 Mask@@2) (MapType0Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert (forall ((arg0@@43 T@U) (arg1@@18 T@U) ) (! (= (type (Node_get_next arg0@@43 arg1@@18)) RefType)
 :qid |funType:Node_get_next|
 :pattern ( (Node_get_next arg0@@43 arg1@@18))
)))
(assert (forall ((Heap@@14 T@U) (this@@16 T@U) ) (!  (=> (and (= (type Heap@@14) (MapType0Type RefType)) (= (type this@@16) RefType)) (and (= (Node_get_next Heap@@14 this@@16) (|Node_get_next'| Heap@@14 this@@16)) (dummyFunction (|Node_get_next#triggerStateless| this@@16))))
 :qid |stdinbpl.284:15|
 :skolemid |36|
 :pattern ( (Node_get_next Heap@@14 this@@16))
)))
(assert (forall ((arg0@@44 T@U) (arg1@@19 T@U) ) (! (= (type (Node_get_prev arg0@@44 arg1@@19)) RefType)
 :qid |funType:Node_get_prev|
 :pattern ( (Node_get_prev arg0@@44 arg1@@19))
)))
(assert (forall ((Heap@@15 T@U) (this@@17 T@U) ) (!  (=> (and (= (type Heap@@15) (MapType0Type RefType)) (= (type this@@17) RefType)) (and (= (Node_get_prev Heap@@15 this@@17) (|Node_get_prev'| Heap@@15 this@@17)) (dummyFunction (|Node_get_prev#triggerStateless| this@@17))))
 :qid |stdinbpl.399:15|
 :skolemid |41|
 :pattern ( (Node_get_prev Heap@@15 this@@17))
)))
(assert (forall ((arg0@@45 T@U) (arg1@@20 T@U) ) (! (= (type (Node_rev_next arg0@@45 arg1@@20)) RefType)
 :qid |funType:Node_rev_next|
 :pattern ( (Node_rev_next arg0@@45 arg1@@20))
)))
(assert (forall ((Heap@@16 T@U) (this@@18 T@U) ) (!  (=> (and (= (type Heap@@16) (MapType0Type RefType)) (= (type this@@18) RefType)) (and (= (Node_rev_next Heap@@16 this@@18) (|Node_rev_next'| Heap@@16 this@@18)) (dummyFunction (|Node_rev_next#triggerStateless| this@@18))))
 :qid |stdinbpl.514:15|
 :skolemid |46|
 :pattern ( (Node_rev_next Heap@@16 this@@18))
)))
(assert (forall ((arg0@@46 T@U) (arg1@@21 T@U) ) (! (= (type (Node_rev_prev arg0@@46 arg1@@21)) RefType)
 :qid |funType:Node_rev_prev|
 :pattern ( (Node_rev_prev arg0@@46 arg1@@21))
)))
(assert (forall ((Heap@@17 T@U) (this@@19 T@U) ) (!  (=> (and (= (type Heap@@17) (MapType0Type RefType)) (= (type this@@19) RefType)) (and (= (Node_rev_prev Heap@@17 this@@19) (|Node_rev_prev'| Heap@@17 this@@19)) (dummyFunction (|Node_rev_prev#triggerStateless| this@@19))))
 :qid |stdinbpl.631:15|
 :skolemid |51|
 :pattern ( (Node_rev_prev Heap@@17 this@@19))
)))
(assert (forall ((arg0@@47 T@U) (arg1@@22 T@U) ) (! (= (type (Node_first arg0@@47 arg1@@22)) RefType)
 :qid |funType:Node_first|
 :pattern ( (Node_first arg0@@47 arg1@@22))
)))
(assert (forall ((Heap@@18 T@U) (this@@20 T@U) ) (!  (=> (and (= (type Heap@@18) (MapType0Type RefType)) (= (type this@@20) RefType)) (and (= (Node_first Heap@@18 this@@20) (|Node_first'| Heap@@18 this@@20)) (dummyFunction (|Node_first#triggerStateless| this@@20))))
 :qid |stdinbpl.748:15|
 :skolemid |56|
 :pattern ( (Node_first Heap@@18 this@@20))
)))
(assert (forall ((this@@21 T@U) (this2 T@U) ) (!  (=> (and (and (= (type this@@21) RefType) (= (type this2) RefType)) (= (Iterator_ready this@@21) (Iterator_ready this2))) (= this@@21 this2))
 :qid |stdinbpl.905:15|
 :skolemid |64|
 :pattern ( (Iterator_ready this@@21) (Iterator_ready this2))
)))
(assert (forall ((arg0@@48 T@U) ) (! (= (type (|Iterator_ready#sm| arg0@@48)) (FieldType PredicateType_Iterator_readyType (MapType1Type RefType boolType)))
 :qid |funType:Iterator_ready#sm|
 :pattern ( (|Iterator_ready#sm| arg0@@48))
)))
(assert (forall ((this@@22 T@U) (this2@@0 T@U) ) (!  (=> (and (and (= (type this@@22) RefType) (= (type this2@@0) RefType)) (= (|Iterator_ready#sm| this@@22) (|Iterator_ready#sm| this2@@0))) (= this@@22 this2@@0))
 :qid |stdinbpl.909:15|
 :skolemid |65|
 :pattern ( (|Iterator_ready#sm| this@@22) (|Iterator_ready#sm| this2@@0))
)))
(assert (forall ((this@@23 T@U) (this2@@1 T@U) ) (!  (=> (and (and (= (type this@@23) RefType) (= (type this2@@1) RefType)) (= (Iterator_readyForNext this@@23) (Iterator_readyForNext this2@@1))) (= this@@23 this2@@1))
 :qid |stdinbpl.1128:15|
 :skolemid |70|
 :pattern ( (Iterator_readyForNext this@@23) (Iterator_readyForNext this2@@1))
)))
(assert (forall ((arg0@@49 T@U) ) (! (= (type (|Iterator_readyForNext#sm| arg0@@49)) (FieldType PredicateType_Iterator_readyForNextType (MapType1Type RefType boolType)))
 :qid |funType:Iterator_readyForNext#sm|
 :pattern ( (|Iterator_readyForNext#sm| arg0@@49))
)))
(assert (forall ((this@@24 T@U) (this2@@2 T@U) ) (!  (=> (and (and (= (type this@@24) RefType) (= (type this2@@2) RefType)) (= (|Iterator_readyForNext#sm| this@@24) (|Iterator_readyForNext#sm| this2@@2))) (= this@@24 this2@@2))
 :qid |stdinbpl.1132:15|
 :skolemid |71|
 :pattern ( (|Iterator_readyForNext#sm| this@@24) (|Iterator_readyForNext#sm| this2@@2))
)))
(assert (forall ((this@@25 T@U) (this2@@3 T@U) ) (!  (=> (and (and (= (type this@@25) RefType) (= (type this2@@3) RefType)) (= (Iterator_readyForRemove this@@25) (Iterator_readyForRemove this2@@3))) (= this@@25 this2@@3))
 :qid |stdinbpl.1358:15|
 :skolemid |76|
 :pattern ( (Iterator_readyForRemove this@@25) (Iterator_readyForRemove this2@@3))
)))
(assert (forall ((arg0@@50 T@U) ) (! (= (type (|Iterator_readyForRemove#sm| arg0@@50)) (FieldType PredicateType_Iterator_readyForRemoveType (MapType1Type RefType boolType)))
 :qid |funType:Iterator_readyForRemove#sm|
 :pattern ( (|Iterator_readyForRemove#sm| arg0@@50))
)))
(assert (forall ((this@@26 T@U) (this2@@4 T@U) ) (!  (=> (and (and (= (type this@@26) RefType) (= (type this2@@4) RefType)) (= (|Iterator_readyForRemove#sm| this@@26) (|Iterator_readyForRemove#sm| this2@@4))) (= this@@26 this2@@4))
 :qid |stdinbpl.1362:15|
 :skolemid |77|
 :pattern ( (|Iterator_readyForRemove#sm| this@@26) (|Iterator_readyForRemove#sm| this2@@4))
)))
(assert (forall ((this@@27 T@U) (this2@@5 T@U) ) (!  (=> (and (and (= (type this@@27) RefType) (= (type this2@@5) RefType)) (= (List_state this@@27) (List_state this2@@5))) (= this@@27 this2@@5))
 :qid |stdinbpl.1645:15|
 :skolemid |82|
 :pattern ( (List_state this@@27) (List_state this2@@5))
)))
(assert (forall ((arg0@@51 T@U) ) (! (= (type (|List_state#sm| arg0@@51)) (FieldType PredicateType_List_stateType (MapType1Type RefType boolType)))
 :qid |funType:List_state#sm|
 :pattern ( (|List_state#sm| arg0@@51))
)))
(assert (forall ((this@@28 T@U) (this2@@6 T@U) ) (!  (=> (and (and (= (type this@@28) RefType) (= (type this2@@6) RefType)) (= (|List_state#sm| this@@28) (|List_state#sm| this2@@6))) (= this@@28 this2@@6))
 :qid |stdinbpl.1649:15|
 :skolemid |83|
 :pattern ( (|List_state#sm| this@@28) (|List_state#sm| this2@@6))
)))
(assert (forall ((this@@29 T@U) (this2@@7 T@U) ) (!  (=> (and (and (= (type this@@29) RefType) (= (type this2@@7) RefType)) (= (Node_state this@@29) (Node_state this2@@7))) (= this@@29 this2@@7))
 :qid |stdinbpl.1711:15|
 :skolemid |88|
 :pattern ( (Node_state this@@29) (Node_state this2@@7))
)))
(assert (forall ((arg0@@52 T@U) ) (! (= (type (|Node_state#sm| arg0@@52)) (FieldType PredicateType_Node_stateType (MapType1Type RefType boolType)))
 :qid |funType:Node_state#sm|
 :pattern ( (|Node_state#sm| arg0@@52))
)))
(assert (forall ((this@@30 T@U) (this2@@8 T@U) ) (!  (=> (and (and (= (type this@@30) RefType) (= (type this2@@8) RefType)) (= (|Node_state#sm| this@@30) (|Node_state#sm| this2@@8))) (= this@@30 this2@@8))
 :qid |stdinbpl.1715:15|
 :skolemid |89|
 :pattern ( (|Node_state#sm| this@@30) (|Node_state#sm| this2@@8))
)))
(assert (forall ((this@@31 T@U) (this2@@9 T@U) ) (!  (=> (and (and (= (type this@@31) RefType) (= (type this2@@9) RefType)) (= (Node_reverse this@@31) (Node_reverse this2@@9))) (= this@@31 this2@@9))
 :qid |stdinbpl.1786:15|
 :skolemid |94|
 :pattern ( (Node_reverse this@@31) (Node_reverse this2@@9))
)))
(assert (forall ((arg0@@53 T@U) ) (! (= (type (|Node_reverse#sm| arg0@@53)) (FieldType PredicateType_Node_reverseType (MapType1Type RefType boolType)))
 :qid |funType:Node_reverse#sm|
 :pattern ( (|Node_reverse#sm| arg0@@53))
)))
(assert (forall ((this@@32 T@U) (this2@@10 T@U) ) (!  (=> (and (and (= (type this@@32) RefType) (= (type this2@@10) RefType)) (= (|Node_reverse#sm| this@@32) (|Node_reverse#sm| this2@@10))) (= this@@32 this2@@10))
 :qid |stdinbpl.1790:15|
 :skolemid |95|
 :pattern ( (|Node_reverse#sm| this@@32) (|Node_reverse#sm| this2@@10))
)))
(assert (forall ((Heap@@19 T@U) (ExhaleHeap@@2 T@U) (Mask@@3 T@U) (o_1@@0 T@U) (f_2 T@U) ) (! (let ((B@@1 (FieldTypeInv1 (type f_2))))
(let ((A@@1 (FieldTypeInv0 (type f_2))))
 (=> (and (and (and (and (and (and (= (type Heap@@19) (MapType0Type RefType)) (= (type ExhaleHeap@@2) (MapType0Type RefType))) (= (type Mask@@3) (MapType1Type RefType realType))) (= (type o_1@@0) RefType)) (= (type f_2) (FieldType A@@1 B@@1))) (IdenticalOnKnownLocations Heap@@19 ExhaleHeap@@2 Mask@@3)) (HasDirectPerm Mask@@3 o_1@@0 f_2)) (= (MapType0Select Heap@@19 o_1@@0 f_2) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2)))))
 :qid |stdinbpl.42:22|
 :skolemid |1|
 :pattern ( (IdenticalOnKnownLocations Heap@@19 ExhaleHeap@@2 Mask@@3) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2))
)))
(assert  (and (= (type dummyHeap) (MapType0Type RefType)) (= (type ZeroMask) (MapType1Type RefType realType))))
(assert (state dummyHeap ZeroMask))
(assert (forall ((p T@U) (v_1 T@U) (w T@U) ) (! (let ((A@@2 (FieldTypeInv0 (type p))))
 (=> (and (and (= (type p) (FieldType A@@2 FrameTypeType)) (= (type v_1) FrameTypeType)) (= (type w) FrameTypeType)) (not (InsidePredicate p v_1 p w))))
 :qid |stdinbpl.177:19|
 :skolemid |21|
 :pattern ( (InsidePredicate p v_1 p w))
)))
(assert  (not (IsPredicateField Iterator_iteratee)))
(assert  (not (IsWandField Iterator_iteratee)))
(assert  (not (IsPredicateField Iterator_current)))
(assert  (not (IsWandField Iterator_current)))
(assert  (not (IsPredicateField Iterator_last)))
(assert  (not (IsWandField Iterator_last)))
(assert  (not (IsPredicateField List_sentinel)))
(assert  (not (IsWandField List_sentinel)))
(assert  (not (IsPredicateField Node_val)))
(assert  (not (IsWandField Node_val)))
(assert  (not (IsPredicateField Node_prev)))
(assert  (not (IsWandField Node_prev)))
(assert  (not (IsPredicateField Node_next)))
(assert  (not (IsWandField Node_next)))
(assert (forall ((Heap@@20 T@U) (ExhaleHeap@@3 T@U) (Mask@@4 T@U) ) (!  (=> (and (and (and (= (type Heap@@20) (MapType0Type RefType)) (= (type ExhaleHeap@@3) (MapType0Type RefType))) (= (type Mask@@4) (MapType1Type RefType realType))) (IdenticalOnKnownLocations Heap@@20 ExhaleHeap@@3 Mask@@4)) (succHeap Heap@@20 ExhaleHeap@@3))
 :qid |stdinbpl.83:15|
 :skolemid |10|
 :pattern ( (IdenticalOnKnownLocations Heap@@20 ExhaleHeap@@3 Mask@@4))
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
(assert (forall ((arg1@@23 T@U) (arg2@@7 Real) (arg3@@5 T@U) (arg4@@1 Real) ) (!  (=> (and (= (type arg1@@23) RefType) (= (type arg3@@5) RefType)) (IsWandField (wand arg1@@23 arg2@@7 arg3@@5 arg4@@1)))
 :qid |stdinbpl.190:15|
 :skolemid |22|
 :pattern ( (wand arg1@@23 arg2@@7 arg3@@5 arg4@@1))
)))
(assert (forall ((arg0@@54 T@U) (arg1@@24 Real) (arg2@@8 T@U) (arg3@@6 Real) ) (! (= (type (|wand#ft| arg0@@54 arg1@@24 arg2@@8 arg3@@6)) (FieldType WandType_wandType FrameTypeType))
 :qid |funType:wand#ft|
 :pattern ( (|wand#ft| arg0@@54 arg1@@24 arg2@@8 arg3@@6))
)))
(assert (forall ((arg1@@25 T@U) (arg2@@9 Real) (arg3@@7 T@U) (arg4@@2 Real) ) (!  (=> (and (= (type arg1@@25) RefType) (= (type arg3@@7) RefType)) (IsWandField (|wand#ft| arg1@@25 arg2@@9 arg3@@7 arg4@@2)))
 :qid |stdinbpl.194:15|
 :skolemid |23|
 :pattern ( (|wand#ft| arg1@@25 arg2@@9 arg3@@7 arg4@@2))
)))
(assert (forall ((arg1@@26 T@U) (arg2@@10 Real) (arg3@@8 T@U) (arg4@@3 Real) ) (!  (=> (and (= (type arg1@@26) RefType) (= (type arg3@@8) RefType)) (IsWandField (wand_1 arg1@@26 arg2@@10 arg3@@8 arg4@@3)))
 :qid |stdinbpl.222:15|
 :skolemid |29|
 :pattern ( (wand_1 arg1@@26 arg2@@10 arg3@@8 arg4@@3))
)))
(assert (forall ((arg0@@55 T@U) (arg1@@27 Real) (arg2@@11 T@U) (arg3@@9 Real) ) (! (= (type (|wand_1#ft| arg0@@55 arg1@@27 arg2@@11 arg3@@9)) (FieldType WandType_wand_1Type FrameTypeType))
 :qid |funType:wand_1#ft|
 :pattern ( (|wand_1#ft| arg0@@55 arg1@@27 arg2@@11 arg3@@9))
)))
(assert (forall ((arg1@@28 T@U) (arg2@@12 Real) (arg3@@10 T@U) (arg4@@4 Real) ) (!  (=> (and (= (type arg1@@28) RefType) (= (type arg3@@10) RefType)) (IsWandField (|wand_1#ft| arg1@@28 arg2@@12 arg3@@10 arg4@@4)))
 :qid |stdinbpl.226:15|
 :skolemid |30|
 :pattern ( (|wand_1#ft| arg1@@28 arg2@@12 arg3@@10 arg4@@4))
)))
(assert  (and (forall ((arg0@@56 Real) (arg1@@29 T@U) ) (! (= (type (ConditionalFrame arg0@@56 arg1@@29)) FrameTypeType)
 :qid |funType:ConditionalFrame|
 :pattern ( (ConditionalFrame arg0@@56 arg1@@29))
)) (= (type EmptyFrame) FrameTypeType)))
(assert (forall ((p@@0 Real) (f_6 T@U) ) (!  (=> (= (type f_6) FrameTypeType) (= (ConditionalFrame p@@0 f_6) (ite (> p@@0 0.0) f_6 EmptyFrame)))
 :qid |stdinbpl.165:15|
 :skolemid |19|
 :pattern ( (ConditionalFrame p@@0 f_6))
)))
(assert (forall ((arg1@@30 T@U) (arg2@@13 Real) (arg3@@11 T@U) (arg4@@5 Real) ) (!  (=> (and (= (type arg1@@30) RefType) (= (type arg3@@11) RefType)) (not (IsPredicateField (wand arg1@@30 arg2@@13 arg3@@11 arg4@@5))))
 :qid |stdinbpl.198:15|
 :skolemid |24|
 :pattern ( (wand arg1@@30 arg2@@13 arg3@@11 arg4@@5))
)))
(assert (forall ((arg1@@31 T@U) (arg2@@14 Real) (arg3@@12 T@U) (arg4@@6 Real) ) (!  (=> (and (= (type arg1@@31) RefType) (= (type arg3@@12) RefType)) (not (IsPredicateField (|wand#ft| arg1@@31 arg2@@14 arg3@@12 arg4@@6))))
 :qid |stdinbpl.202:15|
 :skolemid |25|
 :pattern ( (|wand#ft| arg1@@31 arg2@@14 arg3@@12 arg4@@6))
)))
(assert (forall ((arg1@@32 T@U) (arg2@@15 Real) (arg3@@13 T@U) (arg4@@7 Real) ) (!  (=> (and (= (type arg1@@32) RefType) (= (type arg3@@13) RefType)) (not (IsPredicateField (wand_1 arg1@@32 arg2@@15 arg3@@13 arg4@@7))))
 :qid |stdinbpl.230:15|
 :skolemid |31|
 :pattern ( (wand_1 arg1@@32 arg2@@15 arg3@@13 arg4@@7))
)))
(assert (forall ((arg1@@33 T@U) (arg2@@16 Real) (arg3@@14 T@U) (arg4@@8 Real) ) (!  (=> (and (= (type arg1@@33) RefType) (= (type arg3@@14) RefType)) (not (IsPredicateField (|wand_1#ft| arg1@@33 arg2@@16 arg3@@14 arg4@@8))))
 :qid |stdinbpl.234:15|
 :skolemid |32|
 :pattern ( (|wand_1#ft| arg1@@33 arg2@@16 arg3@@14 arg4@@8))
)))
(assert (forall ((Mask@@5 T@U) (o_2@@0 T@U) (f_4@@0 T@U) ) (! (let ((B@@3 (FieldTypeInv1 (type f_4@@0))))
(let ((A@@4 (FieldTypeInv0 (type f_4@@0))))
 (=> (and (and (= (type Mask@@5) (MapType1Type RefType realType)) (= (type o_2@@0) RefType)) (= (type f_4@@0) (FieldType A@@4 B@@3))) (= (HasDirectPerm Mask@@5 o_2@@0 f_4@@0) (> (U_2_real (MapType1Select Mask@@5 o_2@@0 f_4@@0)) NoPerm)))))
 :qid |stdinbpl.133:22|
 :skolemid |17|
 :pattern ( (HasDirectPerm Mask@@5 o_2@@0 f_4@@0))
)))
(assert (forall ((arg0@@57 T@U) (arg1@@34 Real) (arg2@@17 T@U) (arg3@@15 Real) ) (! (= (type (|wand#sm| arg0@@57 arg1@@34 arg2@@17 arg3@@15)) (FieldType WandType_wandType (MapType1Type RefType boolType)))
 :qid |funType:wand#sm|
 :pattern ( (|wand#sm| arg0@@57 arg1@@34 arg2@@17 arg3@@15))
)))
(assert (forall ((arg1@@35 T@U) (arg2@@18 Real) (arg3@@16 T@U) (arg4@@9 Real) ) (!  (=> (and (= (type arg1@@35) RefType) (= (type arg3@@16) RefType)) (= (|wand#sm| arg1@@35 arg2@@18 arg3@@16 arg4@@9) (WandMaskField (|wand#ft| arg1@@35 arg2@@18 arg3@@16 arg4@@9))))
 :qid |stdinbpl.206:15|
 :skolemid |26|
 :pattern ( (WandMaskField (|wand#ft| arg1@@35 arg2@@18 arg3@@16 arg4@@9)))
)))
(assert (forall ((arg0@@58 T@U) (arg1@@36 Real) (arg2@@19 T@U) (arg3@@17 Real) ) (! (= (type (|wand_1#sm| arg0@@58 arg1@@36 arg2@@19 arg3@@17)) (FieldType WandType_wand_1Type (MapType1Type RefType boolType)))
 :qid |funType:wand_1#sm|
 :pattern ( (|wand_1#sm| arg0@@58 arg1@@36 arg2@@19 arg3@@17))
)))
(assert (forall ((arg1@@37 T@U) (arg2@@20 Real) (arg3@@18 T@U) (arg4@@10 Real) ) (!  (=> (and (= (type arg1@@37) RefType) (= (type arg3@@18) RefType)) (= (|wand_1#sm| arg1@@37 arg2@@20 arg3@@18 arg4@@10) (WandMaskField (|wand_1#ft| arg1@@37 arg2@@20 arg3@@18 arg4@@10))))
 :qid |stdinbpl.238:15|
 :skolemid |33|
 :pattern ( (WandMaskField (|wand_1#ft| arg1@@37 arg2@@20 arg3@@18 arg4@@10)))
)))
(assert (forall ((o_2@@1 T@U) (f_4@@1 T@U) ) (! (let ((B@@4 (FieldTypeInv1 (type f_4@@1))))
(let ((A@@5 (FieldTypeInv0 (type f_4@@1))))
 (=> (and (= (type o_2@@1) RefType) (= (type f_4@@1) (FieldType A@@5 B@@4))) (= (U_2_real (MapType1Select ZeroMask o_2@@1 f_4@@1)) NoPerm))))
 :qid |stdinbpl.106:22|
 :skolemid |13|
 :pattern ( (MapType1Select ZeroMask o_2@@1 f_4@@1))
)))
(assert (forall ((Heap@@21 T@U) (ExhaleHeap@@4 T@U) (Mask@@6 T@U) (pm_f@@1 T@U) ) (! (let ((C@@1 (FieldTypeInv0 (type pm_f@@1))))
 (=> (and (and (and (and (and (= (type Heap@@21) (MapType0Type RefType)) (= (type ExhaleHeap@@4) (MapType0Type RefType))) (= (type Mask@@6) (MapType1Type RefType realType))) (= (type pm_f@@1) (FieldType C@@1 FrameTypeType))) (IdenticalOnKnownLocations Heap@@21 ExhaleHeap@@4 Mask@@6)) (and (HasDirectPerm Mask@@6 null pm_f@@1) (IsPredicateField pm_f@@1))) (forall ((o2 T@U) (f_2@@0 T@U) ) (! (let ((B@@5 (FieldTypeInv1 (type f_2@@0))))
(let ((A@@6 (FieldTypeInv0 (type f_2@@0))))
 (=> (and (and (= (type o2) RefType) (= (type f_2@@0) (FieldType A@@6 B@@5))) (U_2_bool (MapType1Select (MapType0Select Heap@@21 null (PredicateMaskField pm_f@@1)) o2 f_2@@0))) (= (MapType0Select Heap@@21 o2 f_2@@0) (MapType0Select ExhaleHeap@@4 o2 f_2@@0)))))
 :qid |stdinbpl.54:134|
 :skolemid |3|
 :pattern ( (MapType0Select ExhaleHeap@@4 o2 f_2@@0))
))))
 :qid |stdinbpl.52:19|
 :skolemid |4|
 :pattern ( (IdenticalOnKnownLocations Heap@@21 ExhaleHeap@@4 Mask@@6) (IsPredicateField pm_f@@1))
)))
(assert (forall ((Heap@@22 T@U) (ExhaleHeap@@5 T@U) (Mask@@7 T@U) (pm_f@@2 T@U) ) (! (let ((C@@2 (FieldTypeInv0 (type pm_f@@2))))
 (=> (and (and (and (and (and (= (type Heap@@22) (MapType0Type RefType)) (= (type ExhaleHeap@@5) (MapType0Type RefType))) (= (type Mask@@7) (MapType1Type RefType realType))) (= (type pm_f@@2) (FieldType C@@2 FrameTypeType))) (IdenticalOnKnownLocations Heap@@22 ExhaleHeap@@5 Mask@@7)) (and (HasDirectPerm Mask@@7 null pm_f@@2) (IsWandField pm_f@@2))) (forall ((o2@@0 T@U) (f_2@@1 T@U) ) (! (let ((B@@6 (FieldTypeInv1 (type f_2@@1))))
(let ((A@@7 (FieldTypeInv0 (type f_2@@1))))
 (=> (and (and (= (type o2@@0) RefType) (= (type f_2@@1) (FieldType A@@7 B@@6))) (U_2_bool (MapType1Select (MapType0Select Heap@@22 null (WandMaskField pm_f@@2)) o2@@0 f_2@@1))) (= (MapType0Select Heap@@22 o2@@0 f_2@@1) (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1)))))
 :qid |stdinbpl.67:129|
 :skolemid |6|
 :pattern ( (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1))
))))
 :qid |stdinbpl.65:19|
 :skolemid |7|
 :pattern ( (IdenticalOnKnownLocations Heap@@22 ExhaleHeap@@5 Mask@@7) (IsWandField pm_f@@2))
)))
(assert (forall ((this@@33 T@U) ) (!  (=> (= (type this@@33) RefType) (= (getPredWandId (Iterator_ready this@@33)) 0))
 :qid |stdinbpl.899:15|
 :skolemid |63|
 :pattern ( (Iterator_ready this@@33))
)))
(assert (forall ((this@@34 T@U) ) (!  (=> (= (type this@@34) RefType) (= (getPredWandId (Iterator_readyForNext this@@34)) 1))
 :qid |stdinbpl.1122:15|
 :skolemid |69|
 :pattern ( (Iterator_readyForNext this@@34))
)))
(assert (forall ((this@@35 T@U) ) (!  (=> (= (type this@@35) RefType) (= (getPredWandId (Iterator_readyForRemove this@@35)) 2))
 :qid |stdinbpl.1352:15|
 :skolemid |75|
 :pattern ( (Iterator_readyForRemove this@@35))
)))
(assert (forall ((this@@36 T@U) ) (!  (=> (= (type this@@36) RefType) (= (getPredWandId (List_state this@@36)) 3))
 :qid |stdinbpl.1639:15|
 :skolemid |81|
 :pattern ( (List_state this@@36))
)))
(assert (forall ((this@@37 T@U) ) (!  (=> (= (type this@@37) RefType) (= (getPredWandId (Node_state this@@37)) 4))
 :qid |stdinbpl.1705:15|
 :skolemid |87|
 :pattern ( (Node_state this@@37))
)))
(assert (forall ((this@@38 T@U) ) (!  (=> (= (type this@@38) RefType) (= (getPredWandId (Node_reverse this@@38)) 5))
 :qid |stdinbpl.1780:15|
 :skolemid |93|
 :pattern ( (Node_reverse this@@38))
)))
(assert (forall ((Mask@@8 T@U) (o_2@@2 T@U) (f_4@@2 T@U) ) (! (let ((B@@7 (FieldTypeInv1 (type f_4@@2))))
(let ((A@@8 (FieldTypeInv0 (type f_4@@2))))
 (=> (and (and (and (= (type Mask@@8) (MapType1Type RefType realType)) (= (type o_2@@2) RefType)) (= (type f_4@@2) (FieldType A@@8 B@@7))) (GoodMask Mask@@8)) (and (>= (U_2_real (MapType1Select Mask@@8 o_2@@2 f_4@@2)) NoPerm) (=> (and (and (GoodMask Mask@@8) (not (IsPredicateField f_4@@2))) (not (IsWandField f_4@@2))) (<= (U_2_real (MapType1Select Mask@@8 o_2@@2 f_4@@2)) FullPerm))))))
 :qid |stdinbpl.128:22|
 :skolemid |16|
 :pattern ( (GoodMask Mask@@8) (MapType1Select Mask@@8 o_2@@2 f_4@@2))
)))
(assert (forall ((arg0@@59 T@U) (arg1@@38 T@U) ) (! (= (type (|Node_get_next#frame| arg0@@59 arg1@@38)) RefType)
 :qid |funType:Node_get_next#frame|
 :pattern ( (|Node_get_next#frame| arg0@@59 arg1@@38))
)))
(assert (forall ((Heap@@23 T@U) (Mask@@9 T@U) (this@@39 T@U) ) (!  (=> (and (and (and (= (type Heap@@23) (MapType0Type RefType)) (= (type Mask@@9) (MapType1Type RefType realType))) (= (type this@@39) RefType)) (state Heap@@23 Mask@@9)) (= (|Node_get_next'| Heap@@23 this@@39) (|Node_get_next#frame| (MapType0Select Heap@@23 null (Node_state this@@39)) this@@39)))
 :qid |stdinbpl.301:15|
 :skolemid |39|
 :pattern ( (state Heap@@23 Mask@@9) (|Node_get_next'| Heap@@23 this@@39))
)))
(assert (forall ((arg0@@60 T@U) (arg1@@39 T@U) ) (! (= (type (|Node_get_prev#frame| arg0@@60 arg1@@39)) RefType)
 :qid |funType:Node_get_prev#frame|
 :pattern ( (|Node_get_prev#frame| arg0@@60 arg1@@39))
)))
(assert (forall ((Heap@@24 T@U) (Mask@@10 T@U) (this@@40 T@U) ) (!  (=> (and (and (and (= (type Heap@@24) (MapType0Type RefType)) (= (type Mask@@10) (MapType1Type RefType realType))) (= (type this@@40) RefType)) (state Heap@@24 Mask@@10)) (= (|Node_get_prev'| Heap@@24 this@@40) (|Node_get_prev#frame| (MapType0Select Heap@@24 null (Node_state this@@40)) this@@40)))
 :qid |stdinbpl.416:15|
 :skolemid |44|
 :pattern ( (state Heap@@24 Mask@@10) (|Node_get_prev'| Heap@@24 this@@40))
)))
(assert (forall ((arg0@@61 T@U) (arg1@@40 T@U) ) (! (= (type (|Node_rev_next#frame| arg0@@61 arg1@@40)) RefType)
 :qid |funType:Node_rev_next#frame|
 :pattern ( (|Node_rev_next#frame| arg0@@61 arg1@@40))
)))
(assert (forall ((Heap@@25 T@U) (Mask@@11 T@U) (this@@41 T@U) ) (!  (=> (and (and (and (= (type Heap@@25) (MapType0Type RefType)) (= (type Mask@@11) (MapType1Type RefType realType))) (= (type this@@41) RefType)) (state Heap@@25 Mask@@11)) (= (|Node_rev_next'| Heap@@25 this@@41) (|Node_rev_next#frame| (MapType0Select Heap@@25 null (Node_reverse this@@41)) this@@41)))
 :qid |stdinbpl.531:15|
 :skolemid |49|
 :pattern ( (state Heap@@25 Mask@@11) (|Node_rev_next'| Heap@@25 this@@41))
)))
(assert (forall ((arg0@@62 T@U) (arg1@@41 T@U) ) (! (= (type (|Node_rev_prev#frame| arg0@@62 arg1@@41)) RefType)
 :qid |funType:Node_rev_prev#frame|
 :pattern ( (|Node_rev_prev#frame| arg0@@62 arg1@@41))
)))
(assert (forall ((Heap@@26 T@U) (Mask@@12 T@U) (this@@42 T@U) ) (!  (=> (and (and (and (= (type Heap@@26) (MapType0Type RefType)) (= (type Mask@@12) (MapType1Type RefType realType))) (= (type this@@42) RefType)) (state Heap@@26 Mask@@12)) (= (|Node_rev_prev'| Heap@@26 this@@42) (|Node_rev_prev#frame| (MapType0Select Heap@@26 null (Node_reverse this@@42)) this@@42)))
 :qid |stdinbpl.648:15|
 :skolemid |54|
 :pattern ( (state Heap@@26 Mask@@12) (|Node_rev_prev'| Heap@@26 this@@42))
)))
(assert (forall ((arg0@@63 T@U) (arg1@@42 T@U) ) (! (= (type (|Node_first#frame| arg0@@63 arg1@@42)) RefType)
 :qid |funType:Node_first#frame|
 :pattern ( (|Node_first#frame| arg0@@63 arg1@@42))
)))
(assert (forall ((Heap@@27 T@U) (Mask@@13 T@U) (this@@43 T@U) ) (!  (=> (and (and (and (= (type Heap@@27) (MapType0Type RefType)) (= (type Mask@@13) (MapType1Type RefType realType))) (= (type this@@43) RefType)) (state Heap@@27 Mask@@13)) (= (|Node_first'| Heap@@27 this@@43) (|Node_first#frame| (MapType0Select Heap@@27 null (Node_reverse this@@43)) this@@43)))
 :qid |stdinbpl.765:15|
 :skolemid |59|
 :pattern ( (state Heap@@27 Mask@@13) (|Node_first'| Heap@@27 this@@43))
 :pattern ( (state Heap@@27 Mask@@13) (|Node_first#triggerStateless| this@@43) (|Node_reverse#trigger| Heap@@27 (Node_reverse this@@43)))
)))
(assert (forall ((o T@U) (f T@U) (Heap@@28 T@U) ) (!  (=> (and (and (and (= (type o) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap@@28) (MapType0Type RefType))) (U_2_bool (MapType0Select Heap@@28 o $allocated))) (U_2_bool (MapType0Select Heap@@28 (MapType0Select Heap@@28 o f) $allocated)))
 :qid |stdinbpl.31:15|
 :skolemid |0|
 :pattern ( (MapType0Select Heap@@28 o f))
)))
(assert (forall ((this@@44 T@U) ) (!  (=> (= (type this@@44) RefType) (= (PredicateMaskField (Iterator_ready this@@44)) (|Iterator_ready#sm| this@@44)))
 :qid |stdinbpl.891:15|
 :skolemid |61|
 :pattern ( (PredicateMaskField (Iterator_ready this@@44)))
)))
(assert (forall ((this@@45 T@U) ) (!  (=> (= (type this@@45) RefType) (= (PredicateMaskField (Iterator_readyForNext this@@45)) (|Iterator_readyForNext#sm| this@@45)))
 :qid |stdinbpl.1114:15|
 :skolemid |67|
 :pattern ( (PredicateMaskField (Iterator_readyForNext this@@45)))
)))
(assert (forall ((this@@46 T@U) ) (!  (=> (= (type this@@46) RefType) (= (PredicateMaskField (Iterator_readyForRemove this@@46)) (|Iterator_readyForRemove#sm| this@@46)))
 :qid |stdinbpl.1344:15|
 :skolemid |73|
 :pattern ( (PredicateMaskField (Iterator_readyForRemove this@@46)))
)))
(assert (forall ((this@@47 T@U) ) (!  (=> (= (type this@@47) RefType) (= (PredicateMaskField (List_state this@@47)) (|List_state#sm| this@@47)))
 :qid |stdinbpl.1631:15|
 :skolemid |79|
 :pattern ( (PredicateMaskField (List_state this@@47)))
)))
(assert (forall ((this@@48 T@U) ) (!  (=> (= (type this@@48) RefType) (= (PredicateMaskField (Node_state this@@48)) (|Node_state#sm| this@@48)))
 :qid |stdinbpl.1697:15|
 :skolemid |85|
 :pattern ( (PredicateMaskField (Node_state this@@48)))
)))
(assert (forall ((this@@49 T@U) ) (!  (=> (= (type this@@49) RefType) (= (PredicateMaskField (Node_reverse this@@49)) (|Node_reverse#sm| this@@49)))
 :qid |stdinbpl.1772:15|
 :skolemid |91|
 :pattern ( (PredicateMaskField (Node_reverse this@@49)))
)))
(assert (forall ((Heap@@29 T@U) (Mask@@14 T@U) (this@@50 T@U) ) (!  (=> (and (and (and (= (type Heap@@29) (MapType0Type RefType)) (= (type Mask@@14) (MapType1Type RefType realType))) (= (type this@@50) RefType)) (and (state Heap@@29 Mask@@14) (< AssumeFunctionsAbove 4))) (= (Node_first Heap@@29 this@@50) (ite (= (MapType0Select Heap@@29 this@@50 Node_prev) null) this@@50 (|Node_first'| Heap@@29 (MapType0Select Heap@@29 this@@50 Node_prev)))))
 :qid |stdinbpl.758:15|
 :skolemid |58|
 :pattern ( (state Heap@@29 Mask@@14) (Node_first Heap@@29 this@@50))
 :pattern ( (state Heap@@29 Mask@@14) (|Node_first#triggerStateless| this@@50) (|Node_reverse#trigger| Heap@@29 (Node_reverse this@@50)))
)))
(assert (forall ((Heap@@30 T@U) (o@@0 T@U) (f_3 T@U) (v T@U) ) (! (let ((B@@8 (type v)))
(let ((A@@9 (FieldTypeInv0 (type f_3))))
 (=> (and (and (= (type Heap@@30) (MapType0Type RefType)) (= (type o@@0) RefType)) (= (type f_3) (FieldType A@@9 B@@8))) (succHeap Heap@@30 (MapType0Store Heap@@30 o@@0 f_3 v)))))
 :qid |stdinbpl.78:22|
 :skolemid |9|
 :pattern ( (MapType0Store Heap@@30 o@@0 f_3 v))
)))
(assert (forall ((Heap@@31 T@U) (Mask@@15 T@U) (this@@51 T@U) ) (!  (=> (and (and (and (= (type Heap@@31) (MapType0Type RefType)) (= (type Mask@@15) (MapType1Type RefType realType))) (= (type this@@51) RefType)) (and (state Heap@@31 Mask@@15) (< AssumeFunctionsAbove 0))) (= (Node_get_next Heap@@31 this@@51) (MapType0Select Heap@@31 this@@51 Node_next)))
 :qid |stdinbpl.294:15|
 :skolemid |38|
 :pattern ( (state Heap@@31 Mask@@15) (Node_get_next Heap@@31 this@@51))
 :pattern ( (state Heap@@31 Mask@@15) (|Node_get_next#triggerStateless| this@@51) (|Node_state#trigger| Heap@@31 (Node_state this@@51)))
)))
(assert (forall ((Heap@@32 T@U) (Mask@@16 T@U) (this@@52 T@U) ) (!  (=> (and (and (and (= (type Heap@@32) (MapType0Type RefType)) (= (type Mask@@16) (MapType1Type RefType realType))) (= (type this@@52) RefType)) (and (state Heap@@32 Mask@@16) (< AssumeFunctionsAbove 1))) (= (Node_get_prev Heap@@32 this@@52) (MapType0Select Heap@@32 this@@52 Node_prev)))
 :qid |stdinbpl.409:15|
 :skolemid |43|
 :pattern ( (state Heap@@32 Mask@@16) (Node_get_prev Heap@@32 this@@52))
 :pattern ( (state Heap@@32 Mask@@16) (|Node_get_prev#triggerStateless| this@@52) (|Node_state#trigger| Heap@@32 (Node_state this@@52)))
)))
(assert (forall ((Heap@@33 T@U) (Mask@@17 T@U) (this@@53 T@U) ) (!  (=> (and (and (and (= (type Heap@@33) (MapType0Type RefType)) (= (type Mask@@17) (MapType1Type RefType realType))) (= (type this@@53) RefType)) (and (state Heap@@33 Mask@@17) (< AssumeFunctionsAbove 2))) (= (Node_rev_next Heap@@33 this@@53) (MapType0Select Heap@@33 this@@53 Node_next)))
 :qid |stdinbpl.524:15|
 :skolemid |48|
 :pattern ( (state Heap@@33 Mask@@17) (Node_rev_next Heap@@33 this@@53))
 :pattern ( (state Heap@@33 Mask@@17) (|Node_rev_next#triggerStateless| this@@53) (|Node_reverse#trigger| Heap@@33 (Node_reverse this@@53)))
)))
(assert (forall ((Heap@@34 T@U) (Mask@@18 T@U) (this@@54 T@U) ) (!  (=> (and (and (and (= (type Heap@@34) (MapType0Type RefType)) (= (type Mask@@18) (MapType1Type RefType realType))) (= (type this@@54) RefType)) (and (state Heap@@34 Mask@@18) (< AssumeFunctionsAbove 3))) (= (Node_rev_prev Heap@@34 this@@54) (MapType0Select Heap@@34 this@@54 Node_prev)))
 :qid |stdinbpl.641:15|
 :skolemid |53|
 :pattern ( (state Heap@@34 Mask@@18) (Node_rev_prev Heap@@34 this@@54))
 :pattern ( (state Heap@@34 Mask@@18) (|Node_rev_prev#triggerStateless| this@@54) (|Node_reverse#trigger| Heap@@34 (Node_reverse this@@54)))
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
 :qid |stdinbpl.172:25|
 :skolemid |20|
 :pattern ( (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
(assert (forall ((arg1@@43 T@U) (arg2@@21 Real) (arg3@@19 T@U) (arg4@@11 Real) (arg1_2 T@U) (arg2_2 Real) (arg3_2 T@U) (arg4_2 Real) ) (!  (=> (and (and (and (and (= (type arg1@@43) RefType) (= (type arg3@@19) RefType)) (= (type arg1_2) RefType)) (= (type arg3_2) RefType)) (= (wand arg1@@43 arg2@@21 arg3@@19 arg4@@11) (wand arg1_2 arg2_2 arg3_2 arg4_2))) (and (= arg1@@43 arg1_2) (and (= arg2@@21 arg2_2) (and (= arg3@@19 arg3_2) (= arg4@@11 arg4_2)))))
 :qid |stdinbpl.214:15|
 :skolemid |28|
 :pattern ( (wand arg1@@43 arg2@@21 arg3@@19 arg4@@11) (wand arg1_2 arg2_2 arg3_2 arg4_2))
)))
(assert (forall ((arg1@@44 T@U) (arg2@@22 Real) (arg3@@20 T@U) (arg4@@12 Real) (arg1_2@@0 T@U) (arg2_2@@0 Real) (arg3_2@@0 T@U) (arg4_2@@0 Real) ) (!  (=> (and (and (and (and (= (type arg1@@44) RefType) (= (type arg3@@20) RefType)) (= (type arg1_2@@0) RefType)) (= (type arg3_2@@0) RefType)) (= (wand_1 arg1@@44 arg2@@22 arg3@@20 arg4@@12) (wand_1 arg1_2@@0 arg2_2@@0 arg3_2@@0 arg4_2@@0))) (and (= arg1@@44 arg1_2@@0) (and (= arg2@@22 arg2_2@@0) (and (= arg3@@20 arg3_2@@0) (= arg4@@12 arg4_2@@0)))))
 :qid |stdinbpl.246:15|
 :skolemid |35|
 :pattern ( (wand_1 arg1@@44 arg2@@22 arg3@@20 arg4@@12) (wand_1 arg1_2@@0 arg2_2@@0 arg3_2@@0 arg4_2@@0))
)))
(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun Heap@2 () T@U)
(declare-fun this@@55 () T@U)
(declare-fun Heap@4 () T@U)
(declare-fun newPMask@0 () T@U)
(declare-fun Heap@3 () T@U)
(declare-fun Heap@@35 () T@U)
(declare-fun UnfoldingMask@5 () T@U)
(declare-fun Heap@0 () T@U)
(declare-fun Heap@1 () T@U)
(declare-fun UnfoldingMask@3 () T@U)
(declare-fun UnfoldingMask@4 () T@U)
(declare-fun UnfoldingMask@0 () T@U)
(declare-fun Mask@0 () T@U)
(declare-fun UnfoldingMask@1 () T@U)
(declare-fun UnfoldingMask@2 () T@U)
(declare-fun CombineFrames (T@U T@U) T@U)
(declare-fun FrameFragment (T@U) T@U)
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (= (type Heap@2) (MapType0Type RefType)) (= (type this@@55) RefType)) (= (type newPMask@0) (MapType1Type RefType boolType))) (= (type Heap@3) (MapType0Type RefType))) (= (type Heap@4) (MapType0Type RefType))) (= (type Heap@@35) (MapType0Type RefType))) (= (type UnfoldingMask@5) (MapType1Type RefType realType))) (= (type Heap@0) (MapType0Type RefType))) (= (type Heap@1) (MapType0Type RefType))) (= (type UnfoldingMask@4) (MapType1Type RefType realType))) (= (type UnfoldingMask@3) (MapType1Type RefType realType))) (= (type UnfoldingMask@0) (MapType1Type RefType realType))) (= (type Mask@0) (MapType1Type RefType realType))) (= (type UnfoldingMask@1) (MapType1Type RefType realType))) (= (type UnfoldingMask@2) (MapType1Type RefType realType))) (forall ((arg0@@64 T@U) (arg1@@45 T@U) ) (! (= (type (CombineFrames arg0@@64 arg1@@45)) FrameTypeType)
 :qid |funType:CombineFrames|
 :pattern ( (CombineFrames arg0@@64 arg1@@45))
))) (forall ((arg0@@65 T@U) ) (! (= (type (FrameFragment arg0@@65)) FrameTypeType)
 :qid |funType:FrameFragment|
 :pattern ( (FrameFragment arg0@@65))
))))
(set-info :boogie-vc-id |Node_rev_next#definedness|)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 13) (let ((anon6_correct true))
(let ((anon9_Else_correct  (=> (= (MapType0Select Heap@2 this@@55 Node_prev) null) (=> (and (= Heap@4 Heap@2) (= (ControlFlow 0 3) 1)) anon6_correct))))
(let ((anon9_Then_correct  (=> (not (= (MapType0Select Heap@2 this@@55 Node_prev) null)) (=> (and (and (forall ((o_5 T@U) (f_9 T@U) ) (! (let ((B@@11 (FieldTypeInv1 (type f_9))))
(let ((A@@12 (FieldTypeInv0 (type f_9))))
 (=> (and (and (= (type o_5) RefType) (= (type f_9) (FieldType A@@12 B@@11))) (or (U_2_bool (MapType1Select (MapType0Select Heap@2 null (|Node_reverse#sm| this@@55)) o_5 f_9)) (U_2_bool (MapType1Select (MapType0Select Heap@2 null (|Node_reverse#sm| (MapType0Select Heap@2 this@@55 Node_prev))) o_5 f_9)))) (U_2_bool (MapType1Select newPMask@0 o_5 f_9)))))
 :qid |stdinbpl.612:33|
 :skolemid |50|
 :pattern ( (MapType1Select newPMask@0 o_5 f_9))
)) (= Heap@3 (MapType0Store Heap@2 null (|Node_reverse#sm| this@@55) newPMask@0))) (and (= Heap@4 Heap@3) (= (ControlFlow 0 2) 1))) anon6_correct))))
(let ((anon4_correct  (=> (state Heap@@35 UnfoldingMask@5) (and (=> (= (ControlFlow 0 4) (- 0 5)) (HasDirectPerm UnfoldingMask@5 this@@55 Node_next)) (=> (HasDirectPerm UnfoldingMask@5 this@@55 Node_next) (=> (= Heap@0 (MapType0Store Heap@@35 null (|Node_reverse#sm| this@@55) (MapType1Store (MapType0Select Heap@@35 null (|Node_reverse#sm| this@@55)) this@@55 Node_val (bool_2_U true)))) (=> (and (= Heap@1 (MapType0Store Heap@0 null (|Node_reverse#sm| this@@55) (MapType1Store (MapType0Select Heap@0 null (|Node_reverse#sm| this@@55)) this@@55 Node_prev (bool_2_U true)))) (= Heap@2 (MapType0Store Heap@1 null (|Node_reverse#sm| this@@55) (MapType1Store (MapType0Select Heap@1 null (|Node_reverse#sm| this@@55)) this@@55 Node_next (bool_2_U true))))) (and (=> (= (ControlFlow 0 4) 2) anon9_Then_correct) (=> (= (ControlFlow 0 4) 3) anon9_Else_correct)))))))))
(let ((anon8_Else_correct  (=> (= (MapType0Select Heap@@35 this@@55 Node_prev) null) (=> (and (= UnfoldingMask@5 UnfoldingMask@3) (= (ControlFlow 0 7) 4)) anon4_correct))))
(let ((anon8_Then_correct  (=> (and (and (and (not (= (MapType0Select Heap@@35 this@@55 Node_prev) null)) (= UnfoldingMask@4 (MapType1Store UnfoldingMask@3 null (Node_reverse (MapType0Select Heap@@35 this@@55 Node_prev)) (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@3 null (Node_reverse (MapType0Select Heap@@35 this@@55 Node_prev)))) FullPerm))))) (and (InsidePredicate (Node_reverse this@@55) (MapType0Select Heap@@35 null (Node_reverse this@@55)) (Node_reverse (MapType0Select Heap@@35 this@@55 Node_prev)) (MapType0Select Heap@@35 null (Node_reverse (MapType0Select Heap@@35 this@@55 Node_prev)))) (state Heap@@35 UnfoldingMask@4))) (and (and (state Heap@@35 UnfoldingMask@4) (= (Node_rev_next Heap@@35 (MapType0Select Heap@@35 this@@55 Node_prev)) this@@55)) (and (= UnfoldingMask@5 UnfoldingMask@4) (= (ControlFlow 0 6) 4)))) anon4_correct)))
(let ((anon2_correct  (=> (and (= UnfoldingMask@0 (MapType1Store Mask@0 null (Node_reverse this@@55) (real_2_U (- (U_2_real (MapType1Select Mask@0 null (Node_reverse this@@55))) FullPerm)))) (not (= this@@55 null))) (=> (and (and (and (= UnfoldingMask@1 (MapType1Store UnfoldingMask@0 this@@55 Node_val (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@0 this@@55 Node_val)) FullPerm)))) (state Heap@@35 UnfoldingMask@1)) (and (not (= this@@55 null)) (= UnfoldingMask@2 (MapType1Store UnfoldingMask@1 this@@55 Node_prev (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@1 this@@55 Node_prev)) FullPerm)))))) (and (and (state Heap@@35 UnfoldingMask@2) (not (= this@@55 null))) (and (= UnfoldingMask@3 (MapType1Store UnfoldingMask@2 this@@55 Node_next (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@2 this@@55 Node_next)) FullPerm)))) (state Heap@@35 UnfoldingMask@3)))) (and (=> (= (ControlFlow 0 8) 6) anon8_Then_correct) (=> (= (ControlFlow 0 8) 7) anon8_Else_correct))))))
(let ((anon7_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 11) 8)) anon2_correct)))
(let ((anon7_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 9) (- 0 10)) (<= FullPerm (U_2_real (MapType1Select Mask@0 null (Node_reverse this@@55))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@0 null (Node_reverse this@@55)))) (=> (= (ControlFlow 0 9) 8) anon2_correct))))))
(let ((anon0_correct  (=> (and (and (and (state Heap@@35 ZeroMask) (U_2_bool (MapType0Select Heap@@35 this@@55 $allocated))) (and (= AssumeFunctionsAbove 2) (= Mask@0 (MapType1Store ZeroMask null (Node_reverse this@@55) (real_2_U (+ (U_2_real (MapType1Select ZeroMask null (Node_reverse this@@55))) FullPerm)))))) (and (and (state Heap@@35 Mask@0) (state Heap@@35 Mask@0)) (and (|Node_reverse#trigger| Heap@@35 (Node_reverse this@@55)) (= (MapType0Select Heap@@35 null (Node_reverse this@@55)) (CombineFrames (FrameFragment (MapType0Select Heap@@35 this@@55 Node_val)) (CombineFrames (FrameFragment (MapType0Select Heap@@35 this@@55 Node_prev)) (CombineFrames (FrameFragment (MapType0Select Heap@@35 this@@55 Node_next)) (FrameFragment (ite (not (= (MapType0Select Heap@@35 this@@55 Node_prev) null)) (MapType0Select Heap@@35 null (Node_reverse (MapType0Select Heap@@35 this@@55 Node_prev))) EmptyFrame))))))))) (and (=> (= (ControlFlow 0 12) 9) anon7_Then_correct) (=> (= (ControlFlow 0 12) 11) anon7_Else_correct)))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 13) 12) anon0_correct)))
PreconditionGeneratedEntry_correct))))))))))))
))
(check-sat)
(pop 1)
; Valid
(get-info :rlimit)
