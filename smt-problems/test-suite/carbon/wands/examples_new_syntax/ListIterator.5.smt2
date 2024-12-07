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
(set-info :boogie-vc-id |Node_get_prev#definedness|)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 13) (let ((anon6_correct true))
(let ((anon9_Else_correct  (=> (= (MapType0Select Heap@2 this@@55 Node_next) null) (=> (and (= Heap@4 Heap@2) (= (ControlFlow 0 3) 1)) anon6_correct))))
(let ((anon9_Then_correct  (=> (not (= (MapType0Select Heap@2 this@@55 Node_next) null)) (=> (and (and (forall ((o_4 T@U) (f_8 T@U) ) (! (let ((B@@11 (FieldTypeInv1 (type f_8))))
(let ((A@@12 (FieldTypeInv0 (type f_8))))
 (=> (and (and (= (type o_4) RefType) (= (type f_8) (FieldType A@@12 B@@11))) (or (U_2_bool (MapType1Select (MapType0Select Heap@2 null (|Node_state#sm| this@@55)) o_4 f_8)) (U_2_bool (MapType1Select (MapType0Select Heap@2 null (|Node_state#sm| (MapType0Select Heap@2 this@@55 Node_next))) o_4 f_8)))) (U_2_bool (MapType1Select newPMask@0 o_4 f_8)))))
 :qid |stdinbpl.495:33|
 :skolemid |45|
 :pattern ( (MapType1Select newPMask@0 o_4 f_8))
)) (= Heap@3 (MapType0Store Heap@2 null (|Node_state#sm| this@@55) newPMask@0))) (and (= Heap@4 Heap@3) (= (ControlFlow 0 2) 1))) anon6_correct))))
(let ((anon4_correct  (=> (state Heap@@35 UnfoldingMask@5) (and (=> (= (ControlFlow 0 4) (- 0 5)) (HasDirectPerm UnfoldingMask@5 this@@55 Node_prev)) (=> (HasDirectPerm UnfoldingMask@5 this@@55 Node_prev) (=> (= Heap@0 (MapType0Store Heap@@35 null (|Node_state#sm| this@@55) (MapType1Store (MapType0Select Heap@@35 null (|Node_state#sm| this@@55)) this@@55 Node_val (bool_2_U true)))) (=> (and (= Heap@1 (MapType0Store Heap@0 null (|Node_state#sm| this@@55) (MapType1Store (MapType0Select Heap@0 null (|Node_state#sm| this@@55)) this@@55 Node_prev (bool_2_U true)))) (= Heap@2 (MapType0Store Heap@1 null (|Node_state#sm| this@@55) (MapType1Store (MapType0Select Heap@1 null (|Node_state#sm| this@@55)) this@@55 Node_next (bool_2_U true))))) (and (=> (= (ControlFlow 0 4) 2) anon9_Then_correct) (=> (= (ControlFlow 0 4) 3) anon9_Else_correct)))))))))
(let ((anon8_Else_correct  (=> (= (MapType0Select Heap@@35 this@@55 Node_next) null) (=> (and (= UnfoldingMask@5 UnfoldingMask@3) (= (ControlFlow 0 7) 4)) anon4_correct))))
(let ((anon8_Then_correct  (=> (and (not (= (MapType0Select Heap@@35 this@@55 Node_next) null)) (= UnfoldingMask@4 (MapType1Store UnfoldingMask@3 null (Node_state (MapType0Select Heap@@35 this@@55 Node_next)) (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@3 null (Node_state (MapType0Select Heap@@35 this@@55 Node_next)))) FullPerm))))) (=> (and (and (InsidePredicate (Node_state this@@55) (MapType0Select Heap@@35 null (Node_state this@@55)) (Node_state (MapType0Select Heap@@35 this@@55 Node_next)) (MapType0Select Heap@@35 null (Node_state (MapType0Select Heap@@35 this@@55 Node_next)))) (state Heap@@35 UnfoldingMask@4)) (and (= UnfoldingMask@5 UnfoldingMask@4) (= (ControlFlow 0 6) 4))) anon4_correct))))
(let ((anon2_correct  (=> (and (= UnfoldingMask@0 (MapType1Store Mask@0 null (Node_state this@@55) (real_2_U (- (U_2_real (MapType1Select Mask@0 null (Node_state this@@55))) FullPerm)))) (not (= this@@55 null))) (=> (and (and (and (= UnfoldingMask@1 (MapType1Store UnfoldingMask@0 this@@55 Node_val (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@0 this@@55 Node_val)) FullPerm)))) (state Heap@@35 UnfoldingMask@1)) (and (not (= this@@55 null)) (= UnfoldingMask@2 (MapType1Store UnfoldingMask@1 this@@55 Node_prev (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@1 this@@55 Node_prev)) FullPerm)))))) (and (and (state Heap@@35 UnfoldingMask@2) (not (= this@@55 null))) (and (= UnfoldingMask@3 (MapType1Store UnfoldingMask@2 this@@55 Node_next (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@2 this@@55 Node_next)) FullPerm)))) (state Heap@@35 UnfoldingMask@3)))) (and (=> (= (ControlFlow 0 8) 6) anon8_Then_correct) (=> (= (ControlFlow 0 8) 7) anon8_Else_correct))))))
(let ((anon7_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 11) 8)) anon2_correct)))
(let ((anon7_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 9) (- 0 10)) (<= FullPerm (U_2_real (MapType1Select Mask@0 null (Node_state this@@55))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@0 null (Node_state this@@55)))) (=> (= (ControlFlow 0 9) 8) anon2_correct))))))
(let ((anon0_correct  (=> (and (and (and (state Heap@@35 ZeroMask) (U_2_bool (MapType0Select Heap@@35 this@@55 $allocated))) (and (= AssumeFunctionsAbove 1) (= Mask@0 (MapType1Store ZeroMask null (Node_state this@@55) (real_2_U (+ (U_2_real (MapType1Select ZeroMask null (Node_state this@@55))) FullPerm)))))) (and (and (state Heap@@35 Mask@0) (state Heap@@35 Mask@0)) (and (|Node_state#trigger| Heap@@35 (Node_state this@@55)) (= (MapType0Select Heap@@35 null (Node_state this@@55)) (CombineFrames (FrameFragment (MapType0Select Heap@@35 this@@55 Node_val)) (CombineFrames (FrameFragment (MapType0Select Heap@@35 this@@55 Node_prev)) (CombineFrames (FrameFragment (MapType0Select Heap@@35 this@@55 Node_next)) (FrameFragment (ite (not (= (MapType0Select Heap@@35 this@@55 Node_next) null)) (MapType0Select Heap@@35 null (Node_state (MapType0Select Heap@@35 this@@55 Node_next))) EmptyFrame))))))))) (and (=> (= (ControlFlow 0 12) 9) anon7_Then_correct) (=> (= (ControlFlow 0 12) 11) anon7_Else_correct)))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 13) 12) anon0_correct)))
PreconditionGeneratedEntry_correct))))))))))))
))
(check-sat)
(pop 1)
; Valid
(get-info :rlimit)
(reset)
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
; Valid

(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun PostMask@0 () T@U)
(declare-fun this@@55 () T@U)
(declare-fun PostHeap@0 () T@U)
(declare-fun Mask@11 () T@U)
(declare-fun Mask@10 () T@U)
(declare-fun freshObj@0 () T@U)
(declare-fun Heap@10 () T@U)
(declare-fun n () T@U)
(declare-fun Heap@8 () T@U)
(declare-fun newPMask@0 () T@U)
(declare-fun Heap@9 () T@U)
(declare-fun Heap@6 () T@U)
(declare-fun Heap@5 () T@U)
(declare-fun Heap@7 () T@U)
(declare-fun Heap@2 () T@U)
(declare-fun Heap@3 () T@U)
(declare-fun Heap@4 () T@U)
(declare-fun freshVersion@0 () T@U)
(declare-fun Mask@9 () T@U)
(declare-fun CombineFrames (T@U T@U) T@U)
(declare-fun FrameFragment (T@U) T@U)
(declare-fun Mask@8 () T@U)
(declare-fun Mask@7 () T@U)
(declare-fun Mask@6 () T@U)
(declare-fun Mask@5 () T@U)
(declare-fun Mask@4 () T@U)
(declare-fun Heap@@35 () T@U)
(declare-fun Heap@0 () T@U)
(declare-fun Mask@2 () T@U)
(declare-fun Mask@1 () T@U)
(declare-fun Mask@3 () T@U)
(declare-fun Heap@1 () T@U)
(declare-fun v_2 () Int)
(declare-fun Mask@0 () T@U)
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (= (type Mask@11) (MapType1Type RefType realType)) (= (type Mask@10) (MapType1Type RefType realType))) (= (type freshObj@0) RefType)) (= (type Heap@10) (MapType0Type RefType))) (= (type n) RefType)) (= (type Heap@8) (MapType0Type RefType))) (= (type newPMask@0) (MapType1Type RefType boolType))) (= (type Heap@9) (MapType0Type RefType))) (= (type Heap@6) (MapType0Type RefType))) (= (type Heap@5) (MapType0Type RefType))) (= (type Heap@7) (MapType0Type RefType))) (= (type Heap@3) (MapType0Type RefType))) (= (type Heap@2) (MapType0Type RefType))) (= (type Heap@4) (MapType0Type RefType))) (= (type freshVersion@0) FrameTypeType)) (= (type Mask@9) (MapType1Type RefType realType))) (forall ((arg0@@64 T@U) (arg1@@45 T@U) ) (! (= (type (CombineFrames arg0@@64 arg1@@45)) FrameTypeType)
 :qid |funType:CombineFrames|
 :pattern ( (CombineFrames arg0@@64 arg1@@45))
))) (forall ((arg0@@65 T@U) ) (! (= (type (FrameFragment arg0@@65)) FrameTypeType)
 :qid |funType:FrameFragment|
 :pattern ( (FrameFragment arg0@@65))
))) (= (type Mask@7) (MapType1Type RefType realType))) (= (type Mask@8) (MapType1Type RefType realType))) (= (type Mask@6) (MapType1Type RefType realType))) (= (type Mask@5) (MapType1Type RefType realType))) (= (type Mask@4) (MapType1Type RefType realType))) (= (type Heap@@35) (MapType0Type RefType))) (= (type Heap@0) (MapType0Type RefType))) (= (type Mask@2) (MapType1Type RefType realType))) (= (type Mask@1) (MapType1Type RefType realType))) (= (type Mask@3) (MapType1Type RefType realType))) (= (type Heap@1) (MapType0Type RefType))) (= (type PostMask@0) (MapType1Type RefType realType))) (= (type this@@55) RefType)) (= (type PostHeap@0) (MapType0Type RefType))) (= (type Mask@0) (MapType1Type RefType realType))))
(set-info :boogie-vc-id Node_new)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 45) (let ((anon6_correct true))
(let ((anon28_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 39) 36)) anon6_correct)))
(let ((anon28_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 37) (- 0 38)) (<= FullPerm (U_2_real (MapType1Select PostMask@0 null (Node_state this@@55))))) (=> (<= FullPerm (U_2_real (MapType1Select PostMask@0 null (Node_state this@@55)))) (=> (= (ControlFlow 0 37) 36) anon6_correct))))))
(let ((anon27_Else_correct true))
(let ((anon26_Then_correct  (=> (and (and (state PostHeap@0 ZeroMask) (= PostMask@0 (MapType1Store ZeroMask null (Node_state this@@55) (real_2_U (+ (U_2_real (MapType1Select ZeroMask null (Node_state this@@55))) FullPerm))))) (and (state PostHeap@0 PostMask@0) (state PostHeap@0 PostMask@0))) (and (and (=> (= (ControlFlow 0 40) 35) anon27_Else_correct) (=> (= (ControlFlow 0 40) 37) anon28_Then_correct)) (=> (= (ControlFlow 0 40) 39) anon28_Else_correct)))))
(let ((anon24_correct  (=> (= Mask@11 (MapType1Store Mask@10 null (Node_state freshObj@0) (real_2_U (- (U_2_real (MapType1Select Mask@10 null (Node_state freshObj@0))) FullPerm)))) (and (=> (= (ControlFlow 0 2) (- 0 3)) (= (Node_get_next Heap@10 freshObj@0) n)) (=> (= (Node_get_next Heap@10 freshObj@0) n) (=> (= (ControlFlow 0 2) (- 0 1)) (not (= freshObj@0 null))))))))
(let ((anon36_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 6) 2)) anon24_correct)))
(let ((anon36_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 4) (- 0 5)) (<= FullPerm (U_2_real (MapType1Select Mask@10 null (Node_state freshObj@0))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@10 null (Node_state freshObj@0)))) (=> (= (ControlFlow 0 4) 2) anon24_correct))))))
(let ((anon22_correct  (=> (and (state Heap@10 Mask@10) (state Heap@10 Mask@10)) (and (=> (= (ControlFlow 0 7) 4) anon36_Then_correct) (=> (= (ControlFlow 0 7) 6) anon36_Else_correct)))))
(let ((anon35_Else_correct  (=> (= (MapType0Select Heap@8 freshObj@0 Node_next) null) (=> (and (= Heap@10 Heap@8) (= (ControlFlow 0 9) 7)) anon22_correct))))
(let ((anon35_Then_correct  (=> (not (= (MapType0Select Heap@8 freshObj@0 Node_next) null)) (=> (and (and (forall ((o_37 T@U) (f_41 T@U) ) (! (let ((B@@11 (FieldTypeInv1 (type f_41))))
(let ((A@@12 (FieldTypeInv0 (type f_41))))
 (=> (and (and (= (type o_37) RefType) (= (type f_41) (FieldType A@@12 B@@11))) (or (U_2_bool (MapType1Select (MapType0Select Heap@8 null (|Node_state#sm| freshObj@0)) o_37 f_41)) (U_2_bool (MapType1Select (MapType0Select Heap@8 null (|Node_state#sm| (MapType0Select Heap@8 freshObj@0 Node_next))) o_37 f_41)))) (U_2_bool (MapType1Select newPMask@0 o_37 f_41)))))
 :qid |stdinbpl.7258:29|
 :skolemid |126|
 :pattern ( (MapType1Select newPMask@0 o_37 f_41))
)) (= Heap@9 (MapType0Store Heap@8 null (|Node_state#sm| freshObj@0) newPMask@0))) (and (= Heap@10 Heap@9) (= (ControlFlow 0 8) 7))) anon22_correct))))
(let ((anon20_correct  (=> (= Heap@6 (MapType0Store Heap@5 null (|Node_state#sm| freshObj@0) (MapType1Store (MapType0Select Heap@5 null (|Node_state#sm| freshObj@0)) freshObj@0 Node_val (bool_2_U true)))) (=> (and (= Heap@7 (MapType0Store Heap@6 null (|Node_state#sm| freshObj@0) (MapType1Store (MapType0Select Heap@6 null (|Node_state#sm| freshObj@0)) freshObj@0 Node_prev (bool_2_U true)))) (= Heap@8 (MapType0Store Heap@7 null (|Node_state#sm| freshObj@0) (MapType1Store (MapType0Select Heap@7 null (|Node_state#sm| freshObj@0)) freshObj@0 Node_next (bool_2_U true))))) (and (=> (= (ControlFlow 0 10) 8) anon35_Then_correct) (=> (= (ControlFlow 0 10) 9) anon35_Else_correct))))))
(let ((anon34_Else_correct  (=> (HasDirectPerm Mask@10 null (Node_state freshObj@0)) (=> (and (= Heap@5 Heap@2) (= (ControlFlow 0 12) 10)) anon20_correct))))
(let ((anon34_Then_correct  (=> (not (HasDirectPerm Mask@10 null (Node_state freshObj@0))) (=> (and (and (= Heap@3 (MapType0Store Heap@2 null (|Node_state#sm| freshObj@0) ZeroPMask)) (= Heap@4 (MapType0Store Heap@3 null (Node_state freshObj@0) freshVersion@0))) (and (= Heap@5 Heap@4) (= (ControlFlow 0 11) 10))) anon20_correct))))
(let ((anon18_correct  (=> (= Mask@10 (MapType1Store Mask@9 null (Node_state freshObj@0) (real_2_U (+ (U_2_real (MapType1Select Mask@9 null (Node_state freshObj@0))) FullPerm)))) (=> (and (and (state Heap@2 Mask@10) (state Heap@2 Mask@10)) (and (|Node_state#trigger| Heap@2 (Node_state freshObj@0)) (= (MapType0Select Heap@2 null (Node_state freshObj@0)) (CombineFrames (FrameFragment (MapType0Select Heap@2 freshObj@0 Node_val)) (CombineFrames (FrameFragment (MapType0Select Heap@2 freshObj@0 Node_prev)) (CombineFrames (FrameFragment (MapType0Select Heap@2 freshObj@0 Node_next)) (FrameFragment (ite (not (= (MapType0Select Heap@2 freshObj@0 Node_next) null)) (MapType0Select Heap@2 null (Node_state (MapType0Select Heap@2 freshObj@0 Node_next))) EmptyFrame)))))))) (and (=> (= (ControlFlow 0 13) 11) anon34_Then_correct) (=> (= (ControlFlow 0 13) 12) anon34_Else_correct))))))
(let ((anon17_correct  (=> (and (and (= Mask@8 (MapType1Store Mask@7 null (Node_state (MapType0Select Heap@2 freshObj@0 Node_next)) (real_2_U (- (U_2_real (MapType1Select Mask@7 null (Node_state (MapType0Select Heap@2 freshObj@0 Node_next)))) FullPerm)))) (InsidePredicate (Node_state freshObj@0) (MapType0Select Heap@2 null (Node_state freshObj@0)) (Node_state (MapType0Select Heap@2 freshObj@0 Node_next)) (MapType0Select Heap@2 null (Node_state (MapType0Select Heap@2 freshObj@0 Node_next))))) (and (= Mask@9 Mask@8) (= (ControlFlow 0 15) 13))) anon18_correct)))
(let ((anon33_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 18) 15)) anon17_correct)))
(let ((anon33_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 16) (- 0 17)) (<= FullPerm (U_2_real (MapType1Select Mask@7 null (Node_state (MapType0Select Heap@2 freshObj@0 Node_next)))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@7 null (Node_state (MapType0Select Heap@2 freshObj@0 Node_next))))) (=> (= (ControlFlow 0 16) 15) anon17_correct))))))
(let ((anon32_Then_correct  (=> (not (= (MapType0Select Heap@2 freshObj@0 Node_next) null)) (and (=> (= (ControlFlow 0 19) 16) anon33_Then_correct) (=> (= (ControlFlow 0 19) 18) anon33_Else_correct)))))
(let ((anon32_Else_correct  (=> (= (MapType0Select Heap@2 freshObj@0 Node_next) null) (=> (and (= Mask@9 Mask@7) (= (ControlFlow 0 14) 13)) anon18_correct))))
(let ((anon14_correct  (=> (= Mask@7 (MapType1Store Mask@6 freshObj@0 Node_next (real_2_U (- (U_2_real (MapType1Select Mask@6 freshObj@0 Node_next)) FullPerm)))) (and (=> (= (ControlFlow 0 20) 19) anon32_Then_correct) (=> (= (ControlFlow 0 20) 14) anon32_Else_correct)))))
(let ((anon31_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 23) 20)) anon14_correct)))
(let ((anon31_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 21) (- 0 22)) (<= FullPerm (U_2_real (MapType1Select Mask@6 freshObj@0 Node_next)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@6 freshObj@0 Node_next))) (=> (= (ControlFlow 0 21) 20) anon14_correct))))))
(let ((anon12_correct  (=> (= Mask@6 (MapType1Store Mask@5 freshObj@0 Node_prev (real_2_U (- (U_2_real (MapType1Select Mask@5 freshObj@0 Node_prev)) FullPerm)))) (and (=> (= (ControlFlow 0 24) 21) anon31_Then_correct) (=> (= (ControlFlow 0 24) 23) anon31_Else_correct)))))
(let ((anon30_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 27) 24)) anon12_correct)))
(let ((anon30_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 25) (- 0 26)) (<= FullPerm (U_2_real (MapType1Select Mask@5 freshObj@0 Node_prev)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@5 freshObj@0 Node_prev))) (=> (= (ControlFlow 0 25) 24) anon12_correct))))))
(let ((anon10_correct  (=> (= Mask@5 (MapType1Store Mask@4 freshObj@0 Node_val (real_2_U (- (U_2_real (MapType1Select Mask@4 freshObj@0 Node_val)) FullPerm)))) (and (=> (= (ControlFlow 0 28) 25) anon30_Then_correct) (=> (= (ControlFlow 0 28) 27) anon30_Else_correct)))))
(let ((anon29_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 31) 28)) anon10_correct)))
(let ((anon29_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 29) (- 0 30)) (<= FullPerm (U_2_real (MapType1Select Mask@4 freshObj@0 Node_val)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@4 freshObj@0 Node_val))) (=> (= (ControlFlow 0 29) 28) anon10_correct))))))
(let ((anon26_Else_correct  (=> (and (and (and (not (= freshObj@0 null)) (not (U_2_bool (MapType0Select Heap@@35 freshObj@0 $allocated)))) (= Heap@0 (MapType0Store Heap@@35 freshObj@0 $allocated (bool_2_U true)))) (and (and (= Mask@2 (MapType1Store Mask@1 freshObj@0 Node_val (real_2_U (+ (U_2_real (MapType1Select Mask@1 freshObj@0 Node_val)) FullPerm)))) (= Mask@3 (MapType1Store Mask@2 freshObj@0 Node_prev (real_2_U (+ (U_2_real (MapType1Select Mask@2 freshObj@0 Node_prev)) FullPerm))))) (and (= Mask@4 (MapType1Store Mask@3 freshObj@0 Node_next (real_2_U (+ (U_2_real (MapType1Select Mask@3 freshObj@0 Node_next)) FullPerm)))) (state Heap@0 Mask@4)))) (and (=> (= (ControlFlow 0 32) (- 0 34)) (= FullPerm (U_2_real (MapType1Select Mask@4 freshObj@0 Node_val)))) (=> (= FullPerm (U_2_real (MapType1Select Mask@4 freshObj@0 Node_val))) (=> (and (= Heap@1 (MapType0Store Heap@0 freshObj@0 Node_val (int_2_U v_2))) (state Heap@1 Mask@4)) (and (=> (= (ControlFlow 0 32) (- 0 33)) (= FullPerm (U_2_real (MapType1Select Mask@4 freshObj@0 Node_next)))) (=> (= FullPerm (U_2_real (MapType1Select Mask@4 freshObj@0 Node_next))) (=> (and (= Heap@2 (MapType0Store Heap@1 freshObj@0 Node_next n)) (state Heap@2 Mask@4)) (and (=> (= (ControlFlow 0 32) 29) anon29_Then_correct) (=> (= (ControlFlow 0 32) 31) anon29_Else_correct)))))))))))
(let ((anon2_correct  (=> (state Heap@@35 Mask@1) (and (=> (= (ControlFlow 0 41) 40) anon26_Then_correct) (=> (= (ControlFlow 0 41) 32) anon26_Else_correct)))))
(let ((anon25_Else_correct  (=> (= n null) (=> (and (= Mask@1 ZeroMask) (= (ControlFlow 0 43) 41)) anon2_correct))))
(let ((anon25_Then_correct  (=> (not (= n null)) (=> (and (and (= Mask@0 (MapType1Store ZeroMask null (Node_state n) (real_2_U (+ (U_2_real (MapType1Select ZeroMask null (Node_state n))) FullPerm)))) (state Heap@@35 Mask@0)) (and (= Mask@1 Mask@0) (= (ControlFlow 0 42) 41))) anon2_correct))))
(let ((anon0_correct  (=> (state Heap@@35 ZeroMask) (=> (and (= AssumeFunctionsAbove (- 0 1)) (U_2_bool (MapType0Select Heap@@35 n $allocated))) (and (=> (= (ControlFlow 0 44) 42) anon25_Then_correct) (=> (= (ControlFlow 0 44) 43) anon25_Else_correct))))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 45) 44) anon0_correct)))
PreconditionGeneratedEntry_correct))))))))))))))))))))))))))))))))))))
))
(check-sat)
(pop 1)
; Valid
(get-info :rlimit)
(reset)
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
; Valid

(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun PostHeap@0 () T@U)
(declare-fun PostMask@0 () T@U)
(declare-fun this@@55 () T@U)
(declare-fun Ops_1Mask@26 () T@U)
(declare-fun Ops_1Heap@9 () T@U)
(declare-fun freshObj@0 () T@U)
(declare-fun Result_6Mask () T@U)
(declare-fun arg_this@0 () T@U)
(declare-fun Result_8Mask () T@U)
(declare-fun Mask@56 () T@U)
(declare-fun Mask@55 () T@U)
(declare-fun l () T@U)
(declare-fun b_1_1@94 () Bool)
(declare-fun b_20@6 () Bool)
(declare-fun neededTransfer@45 () Real)
(declare-fun Used_6Mask@3 () T@U)
(declare-fun initNeededTransfer@11 () Real)
(declare-fun b_21@0 () Bool)
(declare-fun b_21@1 () Bool)
(declare-fun Result_13Heap () T@U)
(declare-fun Result_13Mask () T@U)
(declare-fun b_21@2 () Bool)
(declare-fun Ops_1Mask () T@U)
(declare-fun b_21@3 () Bool)
(declare-fun Ops_1Heap@17 () T@U)
(declare-fun Used_6Heap@0 () T@U)
(declare-fun b_21@4 () Bool)
(declare-fun b_1_1@95 () Bool)
(declare-fun Mask@54 () T@U)
(declare-fun Heap@51 () T@U)
(declare-fun takeTransfer@22 () Real)
(declare-fun Heap@49 () T@U)
(declare-fun Mask@52 () T@U)
(declare-fun neededTransfer@43 () Real)
(declare-fun b_20@3 () Bool)
(declare-fun Used_6Mask@1 () T@U)
(declare-fun neededTransfer@44 () Real)
(declare-fun Used_6Mask@2 () T@U)
(declare-fun b_20@4 () Bool)
(declare-fun TempMask@11 () T@U)
(declare-fun b_20@5 () Bool)
(declare-fun Mask@53 () T@U)
(declare-fun newPMask@9 () T@U)
(declare-fun Heap@50 () T@U)
(declare-fun maskTransfer@22 () Real)
(declare-fun takeTransfer@21 () Real)
(declare-fun b_20@0 () Bool)
(declare-fun neededTransfer@42 () Real)
(declare-fun Used_6Mask@0 () T@U)
(declare-fun b_20@1 () Bool)
(declare-fun TempMask@10 () T@U)
(declare-fun b_20@2 () Bool)
(declare-fun Ops_1Mask@46 () T@U)
(declare-fun Ops_1Mask@45 () T@U)
(declare-fun maskTransfer@21 () Real)
(declare-fun b_20 () Bool)
(declare-fun Ops_1Heap@15 () T@U)
(declare-fun Ops_1Heap@14 () T@U)
(declare-fun newPMask@8 () T@U)
(declare-fun Ops_1Heap@16 () T@U)
(declare-fun Ops_1Mask@44 () T@U)
(declare-fun b_1_1@93 () Bool)
(declare-fun b_1_1@92 () Bool)
(declare-fun Mask@51 () T@U)
(declare-fun Heap@48 () T@U)
(declare-fun Ops_1Heap@11 () T@U)
(declare-fun Ops_1Heap@12 () T@U)
(declare-fun Ops_1Heap@13 () T@U)
(declare-fun freshVersion@2 () T@U)
(declare-fun b_1_1@87 () Bool)
(declare-fun b_17@12 () Bool)
(declare-fun neededTransfer@41 () Real)
(declare-fun Used_5Mask@7 () T@U)
(declare-fun arg_4@0 () T@U)
(declare-fun initNeededTransfer@10 () Real)
(declare-fun b_19@0 () Bool)
(declare-fun b_19@1 () Bool)
(declare-fun Result_12Heap () T@U)
(declare-fun Result_12Mask () T@U)
(declare-fun b_19@2 () Bool)
(declare-fun Ops_1Mask@43 () T@U)
(declare-fun b_19@3 () Bool)
(declare-fun Used_5Heap@0 () T@U)
(declare-fun b_19@4 () Bool)
(declare-fun b_1_1@88 () Bool)
(declare-fun b_1_1@89 () Bool)
(declare-fun b_1_1@90 () Bool)
(declare-fun b_1_1@91 () Bool)
(declare-fun CombineFrames (T@U T@U) T@U)
(declare-fun FrameFragment (T@U) T@U)
(declare-fun takeTransfer@20 () Real)
(declare-fun neededTransfer@39 () Real)
(declare-fun b_17@9 () Bool)
(declare-fun Heap@46 () T@U)
(declare-fun Mask@49 () T@U)
(declare-fun Used_5Mask@5 () T@U)
(declare-fun neededTransfer@40 () Real)
(declare-fun Used_5Mask@6 () T@U)
(declare-fun b_17@10 () Bool)
(declare-fun TempMask@9 () T@U)
(declare-fun b_17@11 () Bool)
(declare-fun Mask@50 () T@U)
(declare-fun newPMask@7 () T@U)
(declare-fun Heap@47 () T@U)
(declare-fun maskTransfer@20 () Real)
(declare-fun takeTransfer@19 () Real)
(declare-fun Used_5Mask@3 () T@U)
(declare-fun b_17@6 () Bool)
(declare-fun Ops_1Mask@41 () T@U)
(declare-fun neededTransfer@38 () Real)
(declare-fun Used_5Mask@4 () T@U)
(declare-fun b_17@7 () Bool)
(declare-fun TempMask@8 () T@U)
(declare-fun b_17@8 () Bool)
(declare-fun Ops_1Mask@42 () T@U)
(declare-fun maskTransfer@19 () Real)
(declare-fun Result_11Heap () T@U)
(declare-fun Result_11Mask () T@U)
(declare-fun b_1_1@85 () Bool)
(declare-fun b_1_1@86 () Bool)
(declare-fun b_1_1@82 () Bool)
(declare-fun neededTransfer@37 () Real)
(declare-fun initNeededTransfer@9 () Real)
(declare-fun b_18@0 () Bool)
(declare-fun b_18@1 () Bool)
(declare-fun b_18@2 () Bool)
(declare-fun b_18@3 () Bool)
(declare-fun b_18@4 () Bool)
(declare-fun b_1_1@83 () Bool)
(declare-fun b_1_1@84 () Bool)
(declare-fun takeTransfer@18 () Real)
(declare-fun Mask@47 () T@U)
(declare-fun Heap@44 () T@U)
(declare-fun neededTransfer@35 () Real)
(declare-fun b_17@3 () Bool)
(declare-fun Used_5Mask@1 () T@U)
(declare-fun neededTransfer@36 () Real)
(declare-fun Used_5Mask@2 () T@U)
(declare-fun b_17@4 () Bool)
(declare-fun b_17@5 () Bool)
(declare-fun Mask@48 () T@U)
(declare-fun Heap@45 () T@U)
(declare-fun maskTransfer@18 () Real)
(declare-fun takeTransfer@17 () Real)
(declare-fun Ops_1Mask@39 () T@U)
(declare-fun b_17@0 () Bool)
(declare-fun neededTransfer@34 () Real)
(declare-fun Used_5Mask@0 () T@U)
(declare-fun b_17@1 () Bool)
(declare-fun b_17@2 () Bool)
(declare-fun Ops_1Mask@40 () T@U)
(declare-fun maskTransfer@17 () Real)
(declare-fun b_17 () Bool)
(declare-fun b_1_1@79 () Bool)
(declare-fun neededTransfer@33 () Real)
(declare-fun Ops_1Mask@38 () T@U)
(declare-fun initNeededTransfer@8 () Real)
(declare-fun b_16@0 () Bool)
(declare-fun b_14@6 () Bool)
(declare-fun b_16@1 () Bool)
(declare-fun Result_10Heap () T@U)
(declare-fun Result_10Mask () T@U)
(declare-fun b_16@2 () Bool)
(declare-fun Used_4Mask@5 () T@U)
(declare-fun b_16@3 () Bool)
(declare-fun Used_4Heap@2 () T@U)
(declare-fun b_16@4 () Bool)
(declare-fun b_1_1@80 () Bool)
(declare-fun b_1_1@81 () Bool)
(declare-fun Mask@46 () T@U)
(declare-fun Heap@43 () T@U)
(declare-fun takeTransfer@16 () Real)
(declare-fun Used_4Mask@3 () T@U)
(declare-fun b_1_1@76 () Bool)
(declare-fun Used_4Heap@0 () T@U)
(declare-fun Ops_1Mask@36 () T@U)
(declare-fun neededTransfer@32 () Real)
(declare-fun Ops_1Mask@37 () T@U)
(declare-fun b_1_1@77 () Bool)
(declare-fun b_1_1@78 () Bool)
(declare-fun Used_4Mask@4 () T@U)
(declare-fun Used_4Heap@1 () T@U)
(declare-fun maskTransfer@16 () Real)
(declare-fun b_1_1@73 () Bool)
(declare-fun neededTransfer@31 () Real)
(declare-fun initNeededTransfer@7 () Real)
(declare-fun b_15@0 () Bool)
(declare-fun b_15@1 () Bool)
(declare-fun Result_9Heap () T@U)
(declare-fun Result_9Mask () T@U)
(declare-fun b_15@2 () Bool)
(declare-fun b_15@3 () Bool)
(declare-fun b_15@4 () Bool)
(declare-fun b_1_1@74 () Bool)
(declare-fun b_1_1@75 () Bool)
(declare-fun takeTransfer@15 () Real)
(declare-fun neededTransfer@29 () Real)
(declare-fun Heap@41 () T@U)
(declare-fun Mask@44 () T@U)
(declare-fun b_14@3 () Bool)
(declare-fun Used_4Mask@1 () T@U)
(declare-fun neededTransfer@30 () Real)
(declare-fun Used_4Mask@2 () T@U)
(declare-fun b_14@4 () Bool)
(declare-fun b_14@5 () Bool)
(declare-fun Mask@45 () T@U)
(declare-fun Heap@42 () T@U)
(declare-fun maskTransfer@15 () Real)
(declare-fun takeTransfer@14 () Real)
(declare-fun Ops_1Mask@34 () T@U)
(declare-fun b_14@0 () Bool)
(declare-fun neededTransfer@28 () Real)
(declare-fun Used_4Mask@0 () T@U)
(declare-fun b_14@1 () Bool)
(declare-fun b_14@2 () Bool)
(declare-fun Ops_1Mask@35 () T@U)
(declare-fun maskTransfer@14 () Real)
(declare-fun b_14 () Bool)
(declare-fun b_1_1@72 () Bool)
(declare-fun b_1_1@71 () Bool)
(declare-fun Ops_1Heap@10 () T@U)
(declare-fun Ops_1Mask@33 () T@U)
(declare-fun Heap@40 () T@U)
(declare-fun Mask@43 () T@U)
(declare-fun b_1_1@65 () Bool)
(declare-fun b_10@13 () Bool)
(declare-fun Result_8Heap () T@U)
(declare-fun arg_fst@0 () T@U)
(declare-fun b_1_1@66 () Bool)
(declare-fun ExhaleHeap@0 () T@U)
(declare-fun Ops_1Mask@31 () T@U)
(declare-fun b_1_1@67 () Bool)
(declare-fun Ops_1Mask@32 () T@U)
(declare-fun b_1_1@68 () Bool)
(declare-fun b_1_1@69 () Bool)
(declare-fun b_1_1@70 () Bool)
(declare-fun Heap@39 () T@U)
(declare-fun Mask@42 () T@U)
(declare-fun b_13@0 () Bool)
(declare-fun b_1_1@64 () Bool)
(declare-fun b_13@1 () Bool)
(declare-fun b_13@2 () Bool)
(declare-fun Used_3Mask@8 () T@U)
(declare-fun b_13@3 () Bool)
(declare-fun Used_3Heap@0 () T@U)
(declare-fun b_13@4 () Bool)
(declare-fun b_1_1@61 () Bool)
(declare-fun b_10@12 () Bool)
(declare-fun neededTransfer@27 () Real)
(declare-fun Used_3Mask@7 () T@U)
(declare-fun arg_nxt@0 () T@U)
(declare-fun initNeededTransfer@6 () Real)
(declare-fun b_12@0 () Bool)
(declare-fun b_12@1 () Bool)
(declare-fun Result_7Heap () T@U)
(declare-fun Result_7Mask () T@U)
(declare-fun b_12@2 () Bool)
(declare-fun Ops_1Mask@30 () T@U)
(declare-fun b_12@3 () Bool)
(declare-fun b_12@4 () Bool)
(declare-fun b_1_1@62 () Bool)
(declare-fun b_1_1@63 () Bool)
(declare-fun Heap@38 () T@U)
(declare-fun Mask@41 () T@U)
(declare-fun takeTransfer@13 () Real)
(declare-fun neededTransfer@25 () Real)
(declare-fun b_10@9 () Bool)
(declare-fun Mask@39 () T@U)
(declare-fun Heap@36 () T@U)
(declare-fun Used_3Mask@5 () T@U)
(declare-fun neededTransfer@26 () Real)
(declare-fun Used_3Mask@6 () T@U)
(declare-fun b_10@10 () Bool)
(declare-fun TempMask@7 () T@U)
(declare-fun b_10@11 () Bool)
(declare-fun Mask@40 () T@U)
(declare-fun newPMask@6 () T@U)
(declare-fun Heap@37 () T@U)
(declare-fun maskTransfer@13 () Real)
(declare-fun takeTransfer@12 () Real)
(declare-fun Used_3Mask@3 () T@U)
(declare-fun b_10@6 () Bool)
(declare-fun Ops_1Mask@28 () T@U)
(declare-fun neededTransfer@24 () Real)
(declare-fun Used_3Mask@4 () T@U)
(declare-fun b_10@7 () Bool)
(declare-fun TempMask@6 () T@U)
(declare-fun b_10@8 () Bool)
(declare-fun Ops_1Mask@29 () T@U)
(declare-fun maskTransfer@12 () Real)
(declare-fun b_1_1@60 () Bool)
(declare-fun Result_6Heap () T@U)
(declare-fun b_1_1@58 () Bool)
(declare-fun neededTransfer@23 () Real)
(declare-fun initNeededTransfer@5 () Real)
(declare-fun b_11@0 () Bool)
(declare-fun b_11@1 () Bool)
(declare-fun b_11@2 () Bool)
(declare-fun b_11@3 () Bool)
(declare-fun b_11@4 () Bool)
(declare-fun b_1_1@59 () Bool)
(declare-fun takeTransfer@11 () Real)
(declare-fun Heap@34 () T@U)
(declare-fun Mask@37 () T@U)
(declare-fun neededTransfer@21 () Real)
(declare-fun b_10@3 () Bool)
(declare-fun Used_3Mask@1 () T@U)
(declare-fun neededTransfer@22 () Real)
(declare-fun Used_3Mask@2 () T@U)
(declare-fun b_10@4 () Bool)
(declare-fun TempMask@5 () T@U)
(declare-fun b_10@5 () Bool)
(declare-fun Mask@38 () T@U)
(declare-fun newPMask@5 () T@U)
(declare-fun Heap@35 () T@U)
(declare-fun maskTransfer@11 () Real)
(declare-fun takeTransfer@10 () Real)
(declare-fun b_10@0 () Bool)
(declare-fun neededTransfer@20 () Real)
(declare-fun Used_3Mask@0 () T@U)
(declare-fun b_10@1 () Bool)
(declare-fun TempMask@4 () T@U)
(declare-fun b_10@2 () Bool)
(declare-fun Ops_1Mask@27 () T@U)
(declare-fun maskTransfer@10 () Real)
(declare-fun b_10 () Bool)
(declare-fun b_1_1@57 () Bool)
(declare-fun Ops_1Heap@8 () T@U)
(declare-fun Ops_1Mask@25 () T@U)
(declare-fun b_1_1@56 () Bool)
(declare-fun b_1_1@55 () Bool)
(declare-fun Mask@36 () T@U)
(declare-fun Heap@33 () T@U)
(declare-fun Ops_1Heap@6 () T@U)
(declare-fun newPMask@4 () T@U)
(declare-fun Ops_1Heap@7 () T@U)
(declare-fun Ops_1Heap@4 () T@U)
(declare-fun Ops_1Heap@3 () T@U)
(declare-fun Ops_1Heap@5 () T@U)
(declare-fun Ops_1Heap@0 () T@U)
(declare-fun Ops_1Heap@1 () T@U)
(declare-fun Ops_1Heap@2 () T@U)
(declare-fun freshVersion@1 () T@U)
(declare-fun b_9@0 () Bool)
(declare-fun b_1_1@52 () Bool)
(declare-fun b_4@25 () Bool)
(declare-fun b_9@1 () Bool)
(declare-fun Result_5Heap () T@U)
(declare-fun Result_5Mask () T@U)
(declare-fun b_9@2 () Bool)
(declare-fun Ops_1Mask@24 () T@U)
(declare-fun Used_2Mask@16 () T@U)
(declare-fun b_9@3 () Bool)
(declare-fun Used_2Heap@0 () T@U)
(declare-fun b_9@4 () Bool)
(declare-fun b_1_1@53 () Bool)
(declare-fun b_1_1@54 () Bool)
(declare-fun b_1_1@48 () Bool)
(declare-fun b_4@24 () Bool)
(declare-fun neededTransfer@19 () Real)
(declare-fun Used_2Mask@15 () T@U)
(declare-fun arg_1@0 () T@U)
(declare-fun initNeededTransfer@4 () Real)
(declare-fun b_8@0 () Bool)
(declare-fun b_8@1 () Bool)
(declare-fun Result_4Heap () T@U)
(declare-fun Result_4Mask () T@U)
(declare-fun b_8@2 () Bool)
(declare-fun Ops_1Mask@23 () T@U)
(declare-fun b_8@3 () Bool)
(declare-fun b_8@4 () Bool)
(declare-fun b_1_1@49 () Bool)
(declare-fun b_1_1@50 () Bool)
(declare-fun b_1_1@51 () Bool)
(declare-fun Mask@35 () T@U)
(declare-fun Heap@32 () T@U)
(declare-fun takeTransfer@9 () Real)
(declare-fun Heap@30 () T@U)
(declare-fun Mask@33 () T@U)
(declare-fun neededTransfer@17 () Real)
(declare-fun b_4@21 () Bool)
(declare-fun Used_2Mask@13 () T@U)
(declare-fun neededTransfer@18 () Real)
(declare-fun Used_2Mask@14 () T@U)
(declare-fun b_4@22 () Bool)
(declare-fun TempMask@3 () T@U)
(declare-fun b_4@23 () Bool)
(declare-fun Mask@34 () T@U)
(declare-fun newPMask@3 () T@U)
(declare-fun Heap@31 () T@U)
(declare-fun maskTransfer@9 () Real)
(declare-fun takeTransfer@8 () Real)
(declare-fun Used_2Mask@11 () T@U)
(declare-fun b_4@18 () Bool)
(declare-fun Ops_1Mask@21 () T@U)
(declare-fun neededTransfer@16 () Real)
(declare-fun Used_2Mask@12 () T@U)
(declare-fun b_4@19 () Bool)
(declare-fun TempMask@2 () T@U)
(declare-fun b_4@20 () Bool)
(declare-fun Ops_1Mask@22 () T@U)
(declare-fun maskTransfer@8 () Real)
(declare-fun Result_3Heap () T@U)
(declare-fun Result_3Mask () T@U)
(declare-fun b_1_1@45 () Bool)
(declare-fun neededTransfer@15 () Real)
(declare-fun rcvLocal@2 () T@U)
(declare-fun initNeededTransfer@3 () Real)
(declare-fun b_7@0 () Bool)
(declare-fun b_7@1 () Bool)
(declare-fun b_7@2 () Bool)
(declare-fun b_7@3 () Bool)
(declare-fun b_7@4 () Bool)
(declare-fun b_1_1@46 () Bool)
(declare-fun b_1_1@47 () Bool)
(declare-fun takeTransfer@7 () Real)
(declare-fun neededTransfer@13 () Real)
(declare-fun b_4@15 () Bool)
(declare-fun Used_2Mask@9 () T@U)
(declare-fun Mask@31 () T@U)
(declare-fun Heap@28 () T@U)
(declare-fun neededTransfer@14 () Real)
(declare-fun Used_2Mask@10 () T@U)
(declare-fun b_4@16 () Bool)
(declare-fun b_4@17 () Bool)
(declare-fun Mask@32 () T@U)
(declare-fun Heap@29 () T@U)
(declare-fun maskTransfer@7 () Real)
(declare-fun takeTransfer@6 () Real)
(declare-fun Ops_1Mask@19 () T@U)
(declare-fun Used_2Mask@7 () T@U)
(declare-fun b_4@12 () Bool)
(declare-fun neededTransfer@12 () Real)
(declare-fun Used_2Mask@8 () T@U)
(declare-fun b_4@13 () Bool)
(declare-fun b_4@14 () Bool)
(declare-fun Ops_1Mask@20 () T@U)
(declare-fun maskTransfer@6 () Real)
(declare-fun Result_2Heap () T@U)
(declare-fun Result_2Mask () T@U)
(declare-fun b_1_1@42 () Bool)
(declare-fun neededTransfer@11 () Real)
(declare-fun rcvLocal@1 () T@U)
(declare-fun initNeededTransfer@2 () Real)
(declare-fun b_6@0 () Bool)
(declare-fun b_6@1 () Bool)
(declare-fun b_6@2 () Bool)
(declare-fun b_6@3 () Bool)
(declare-fun b_6@4 () Bool)
(declare-fun b_1_1@43 () Bool)
(declare-fun b_1_1@44 () Bool)
(declare-fun takeTransfer@5 () Real)
(declare-fun neededTransfer@9 () Real)
(declare-fun Heap@26 () T@U)
(declare-fun Mask@29 () T@U)
(declare-fun b_4@9 () Bool)
(declare-fun Used_2Mask@5 () T@U)
(declare-fun neededTransfer@10 () Real)
(declare-fun Used_2Mask@6 () T@U)
(declare-fun b_4@10 () Bool)
(declare-fun b_4@11 () Bool)
(declare-fun Mask@30 () T@U)
(declare-fun Heap@27 () T@U)
(declare-fun maskTransfer@5 () Real)
(declare-fun takeTransfer@4 () Real)
(declare-fun Used_2Mask@3 () T@U)
(declare-fun b_4@6 () Bool)
(declare-fun Ops_1Mask@17 () T@U)
(declare-fun neededTransfer@8 () Real)
(declare-fun Used_2Mask@4 () T@U)
(declare-fun b_4@7 () Bool)
(declare-fun b_4@8 () Bool)
(declare-fun Ops_1Mask@18 () T@U)
(declare-fun maskTransfer@4 () Real)
(declare-fun Result_1Heap () T@U)
(declare-fun Result_1Mask () T@U)
(declare-fun b_1_1@39 () Bool)
(declare-fun neededTransfer@7 () Real)
(declare-fun rcvLocal@0 () T@U)
(declare-fun initNeededTransfer@1 () Real)
(declare-fun b_5@0 () Bool)
(declare-fun b_5@1 () Bool)
(declare-fun b_5@2 () Bool)
(declare-fun b_5@3 () Bool)
(declare-fun b_5@4 () Bool)
(declare-fun b_1_1@40 () Bool)
(declare-fun b_1_1@41 () Bool)
(declare-fun takeTransfer@3 () Real)
(declare-fun neededTransfer@5 () Real)
(declare-fun Mask@27 () T@U)
(declare-fun Heap@24 () T@U)
(declare-fun b_4@3 () Bool)
(declare-fun Used_2Mask@1 () T@U)
(declare-fun neededTransfer@6 () Real)
(declare-fun Used_2Mask@2 () T@U)
(declare-fun b_4@4 () Bool)
(declare-fun b_4@5 () Bool)
(declare-fun Mask@28 () T@U)
(declare-fun Heap@25 () T@U)
(declare-fun maskTransfer@3 () Real)
(declare-fun takeTransfer@2 () Real)
(declare-fun Ops_1Mask@15 () T@U)
(declare-fun b_4@0 () Bool)
(declare-fun neededTransfer@4 () Real)
(declare-fun Used_2Mask@0 () T@U)
(declare-fun b_4@1 () Bool)
(declare-fun b_4@2 () Bool)
(declare-fun Ops_1Mask@16 () T@U)
(declare-fun maskTransfer@2 () Real)
(declare-fun b_4 () Bool)
(declare-fun b_1_1@37 () Bool)
(declare-fun b_1_1@36 () Bool)
(declare-fun Ops_1Mask@14 () T@U)
(declare-fun b_1_1@38 () Bool)
(declare-fun Heap@23 () T@U)
(declare-fun Mask@26 () T@U)
(declare-fun Ops_1Mask@12 () T@U)
(declare-fun b_1_1@33 () Bool)
(declare-fun Ops_1Mask@13 () T@U)
(declare-fun b_1_1@34 () Bool)
(declare-fun b_1_1@35 () Bool)
(declare-fun b_1_1@26 () Bool)
(declare-fun Ops_1Mask@10 () T@U)
(declare-fun Ops_1Mask@11 () T@U)
(declare-fun b_1_1@27 () Bool)
(declare-fun b_1_1@28 () Bool)
(declare-fun b_1_1@29 () Bool)
(declare-fun b_1_1@30 () Bool)
(declare-fun b_1_1@31 () Bool)
(declare-fun b_1_1@32 () Bool)
(declare-fun b_1_1@24 () Bool)
(declare-fun b_1_1@25 () Bool)
(declare-fun b_1_1@4 () Bool)
(declare-fun b_2_1@6 () Bool)
(declare-fun neededTransfer@3 () Real)
(declare-fun Used_1Mask@3 () T@U)
(declare-fun initNeededTransfer@0 () Real)
(declare-fun b_3_1@0 () Bool)
(declare-fun b_3_1@1 () Bool)
(declare-fun ResultHeap () T@U)
(declare-fun ResultMask@@0 () T@U)
(declare-fun b_3_1@2 () Bool)
(declare-fun Ops_1Mask@3 () T@U)
(declare-fun b_3_1@3 () Bool)
(declare-fun Used_1Heap@0 () T@U)
(declare-fun b_3_1@4 () Bool)
(declare-fun b_1_1@5 () Bool)
(declare-fun b_1_1@6 () Bool)
(declare-fun b_1_1@7 () Bool)
(declare-fun perm@1 () Real)
(declare-fun b_1_1@8 () Bool)
(declare-fun Ops_1Mask@4 () T@U)
(declare-fun b_1_1@9 () Bool)
(declare-fun b_1_1@10 () Bool)
(declare-fun b_1_1@11 () Bool)
(declare-fun Ops_1Mask@5 () T@U)
(declare-fun b_1_1@12 () Bool)
(declare-fun b_1_1@13 () Bool)
(declare-fun b_1_1@14 () Bool)
(declare-fun Ops_1Mask@6 () T@U)
(declare-fun b_1_1@15 () Bool)
(declare-fun b_1_1@16 () Bool)
(declare-fun Ops_1Mask@7 () T@U)
(declare-fun b_1_1@17 () Bool)
(declare-fun b_1_1@18 () Bool)
(declare-fun b_1_1@19 () Bool)
(declare-fun Ops_1Mask@8 () T@U)
(declare-fun b_1_1@20 () Bool)
(declare-fun b_1_1@21 () Bool)
(declare-fun Ops_1Mask@9 () T@U)
(declare-fun b_1_1@22 () Bool)
(declare-fun b_1_1@23 () Bool)
(declare-fun takeTransfer@1 () Real)
(declare-fun Mask@24 () T@U)
(declare-fun Heap@21 () T@U)
(declare-fun neededTransfer@1 () Real)
(declare-fun b_2_1@3 () Bool)
(declare-fun Used_1Mask@1 () T@U)
(declare-fun neededTransfer@2 () Real)
(declare-fun Used_1Mask@2 () T@U)
(declare-fun b_2_1@4 () Bool)
(declare-fun TempMask@1 () T@U)
(declare-fun b_2_1@5 () Bool)
(declare-fun Mask@25 () T@U)
(declare-fun newPMask@2 () T@U)
(declare-fun Heap@22 () T@U)
(declare-fun maskTransfer@1 () Real)
(declare-fun takeTransfer@0 () Real)
(declare-fun Ops_1Mask@1 () T@U)
(declare-fun b_2_1@0 () Bool)
(declare-fun neededTransfer@0 () Real)
(declare-fun Used_1Mask@0 () T@U)
(declare-fun b_2_1@1 () Bool)
(declare-fun TempMask@0 () T@U)
(declare-fun b_2_1@2 () Bool)
(declare-fun Ops_1Mask@2 () T@U)
(declare-fun maskTransfer@0 () Real)
(declare-fun b_2_1 () Bool)
(declare-fun b_1_1@3 () Bool)
(declare-fun b_1_1@2 () Bool)
(declare-fun b_1_1@0 () Bool)
(declare-fun Ops_1Mask@0 () T@U)
(declare-fun b_1_1@1 () Bool)
(declare-fun b_1_1 () Bool)
(declare-fun b_3@0 () Bool)
(declare-fun b_3 () Bool)
(declare-fun UsedHeap@0 () T@U)
(declare-fun Heap@19 () T@U)
(declare-fun newPMask@1 () T@U)
(declare-fun Heap@20 () T@U)
(declare-fun Heap@17 () T@U)
(declare-fun newPMask@0 () T@U)
(declare-fun Heap@18 () T@U)
(declare-fun Heap@11 () T@U)
(declare-fun Heap@10 () T@U)
(declare-fun Heap@12 () T@U)
(declare-fun Heap@13 () T@U)
(declare-fun Heap@14 () T@U)
(declare-fun Heap@15 () T@U)
(declare-fun Heap@16 () T@U)
(declare-fun Heap@7 () T@U)
(declare-fun Heap@8 () T@U)
(declare-fun Heap@9 () T@U)
(declare-fun freshVersion@0 () T@U)
(declare-fun Mask@23 () T@U)
(declare-fun Mask@22 () T@U)
(declare-fun Mask@21 () T@U)
(declare-fun Mask@20 () T@U)
(declare-fun Mask@19 () T@U)
(declare-fun Mask@18 () T@U)
(declare-fun Mask@17 () T@U)
(declare-fun Mask@16 () T@U)
(declare-fun Mask@15 () T@U)
(declare-fun Mask@14 () T@U)
(declare-fun Mask@13 () T@U)
(declare-fun Mask@12 () T@U)
(declare-fun perm@0 () Real)
(declare-fun Heap@5 () T@U)
(declare-fun Heap@6 () T@U)
(declare-fun Mask@10 () T@U)
(declare-fun Mask@11 () T@U)
(declare-fun Mask@8 () T@U)
(declare-fun Mask@7 () T@U)
(declare-fun Mask@9 () T@U)
(declare-fun Heap@3 () T@U)
(declare-fun Heap@4 () T@U)
(declare-fun newVersion@1 () T@U)
(declare-fun Mask@6 () T@U)
(declare-fun Mask@5 () T@U)
(declare-fun Mask@4 () T@U)
(declare-fun Heap@2 () T@U)
(declare-fun Heap@0 () T@U)
(declare-fun Heap@1 () T@U)
(declare-fun newVersion@0 () T@U)
(declare-fun Mask@3 () T@U)
(declare-fun Heap@@35 () T@U)
(declare-fun Mask@1 () T@U)
(declare-fun Mask@0 () T@U)
(declare-fun Mask@2 () T@U)
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (= (type Mask@56) (MapType1Type RefType realType)) (= (type Mask@55) (MapType1Type RefType realType))) (= (type freshObj@0) RefType)) (= (type l) RefType)) (= (type Used_6Mask@3) (MapType1Type RefType realType))) (= (type Result_13Heap) (MapType0Type RefType))) (= (type Result_13Mask) (MapType1Type RefType realType))) (= (type Ops_1Mask) (MapType1Type RefType realType))) (= (type Ops_1Heap@17) (MapType0Type RefType))) (= (type Used_6Heap@0) (MapType0Type RefType))) (= (type Mask@54) (MapType1Type RefType realType))) (= (type Heap@51) (MapType0Type RefType))) (= (type Heap@49) (MapType0Type RefType))) (= (type Mask@52) (MapType1Type RefType realType))) (= (type Used_6Mask@1) (MapType1Type RefType realType))) (= (type Used_6Mask@2) (MapType1Type RefType realType))) (= (type TempMask@11) (MapType1Type RefType realType))) (= (type Mask@53) (MapType1Type RefType realType))) (= (type newPMask@9) (MapType1Type RefType boolType))) (= (type Heap@50) (MapType0Type RefType))) (= (type Used_6Mask@0) (MapType1Type RefType realType))) (= (type TempMask@10) (MapType1Type RefType realType))) (= (type Ops_1Mask@46) (MapType1Type RefType realType))) (= (type Ops_1Mask@45) (MapType1Type RefType realType))) (= (type Ops_1Mask@39) (MapType1Type RefType realType))) (= (type Mask@47) (MapType1Type RefType realType))) (= (type Ops_1Heap@11) (MapType0Type RefType))) (= (type Heap@44) (MapType0Type RefType))) (= (type Ops_1Heap@15) (MapType0Type RefType))) (= (type Ops_1Heap@14) (MapType0Type RefType))) (= (type newPMask@8) (MapType1Type RefType boolType))) (= (type Ops_1Heap@16) (MapType0Type RefType))) (= (type Ops_1Mask@44) (MapType1Type RefType realType))) (= (type Mask@51) (MapType1Type RefType realType))) (= (type Heap@48) (MapType0Type RefType))) (= (type Ops_1Heap@12) (MapType0Type RefType))) (= (type Ops_1Heap@13) (MapType0Type RefType))) (= (type freshVersion@2) FrameTypeType)) (= (type Used_5Mask@7) (MapType1Type RefType realType))) (= (type arg_4@0) RefType)) (= (type Result_12Heap) (MapType0Type RefType))) (= (type Result_12Mask) (MapType1Type RefType realType))) (= (type Ops_1Mask@43) (MapType1Type RefType realType))) (= (type Used_5Heap@0) (MapType0Type RefType))) (forall ((arg0@@64 T@U) (arg1@@45 T@U) ) (! (= (type (CombineFrames arg0@@64 arg1@@45)) FrameTypeType)
 :qid |funType:CombineFrames|
 :pattern ( (CombineFrames arg0@@64 arg1@@45))
))) (forall ((arg0@@65 T@U) ) (! (= (type (FrameFragment arg0@@65)) FrameTypeType)
 :qid |funType:FrameFragment|
 :pattern ( (FrameFragment arg0@@65))
))) (= (type Heap@46) (MapType0Type RefType))) (= (type Mask@49) (MapType1Type RefType realType))) (= (type Used_5Mask@5) (MapType1Type RefType realType))) (= (type Used_5Mask@6) (MapType1Type RefType realType))) (= (type TempMask@9) (MapType1Type RefType realType))) (= (type Mask@50) (MapType1Type RefType realType))) (= (type newPMask@7) (MapType1Type RefType boolType))) (= (type Heap@47) (MapType0Type RefType))) (= (type Used_5Mask@3) (MapType1Type RefType realType))) (= (type Ops_1Mask@41) (MapType1Type RefType realType))) (= (type Used_5Mask@4) (MapType1Type RefType realType))) (= (type TempMask@8) (MapType1Type RefType realType))) (= (type Ops_1Mask@42) (MapType1Type RefType realType))) (= (type Result_11Heap) (MapType0Type RefType))) (= (type Result_11Mask) (MapType1Type RefType realType))) (= (type Used_5Mask@1) (MapType1Type RefType realType))) (= (type Used_5Mask@2) (MapType1Type RefType realType))) (= (type Mask@48) (MapType1Type RefType realType))) (= (type Heap@45) (MapType0Type RefType))) (= (type Used_5Mask@0) (MapType1Type RefType realType))) (= (type Ops_1Mask@40) (MapType1Type RefType realType))) (= (type Ops_1Mask@34) (MapType1Type RefType realType))) (= (type Mask@44) (MapType1Type RefType realType))) (= (type Heap@41) (MapType0Type RefType))) (= (type Ops_1Mask@38) (MapType1Type RefType realType))) (= (type Result_10Heap) (MapType0Type RefType))) (= (type Result_10Mask) (MapType1Type RefType realType))) (= (type Used_4Mask@5) (MapType1Type RefType realType))) (= (type Used_4Heap@2) (MapType0Type RefType))) (= (type Mask@46) (MapType1Type RefType realType))) (= (type Heap@43) (MapType0Type RefType))) (= (type Used_4Mask@3) (MapType1Type RefType realType))) (= (type Used_4Heap@0) (MapType0Type RefType))) (= (type Ops_1Mask@36) (MapType1Type RefType realType))) (= (type Ops_1Mask@37) (MapType1Type RefType realType))) (= (type Used_4Mask@4) (MapType1Type RefType realType))) (= (type Used_4Heap@1) (MapType0Type RefType))) (= (type Result_9Heap) (MapType0Type RefType))) (= (type Result_9Mask) (MapType1Type RefType realType))) (= (type Used_4Mask@1) (MapType1Type RefType realType))) (= (type Used_4Mask@2) (MapType1Type RefType realType))) (= (type Mask@45) (MapType1Type RefType realType))) (= (type Heap@42) (MapType0Type RefType))) (= (type Used_4Mask@0) (MapType1Type RefType realType))) (= (type Ops_1Mask@35) (MapType1Type RefType realType))) (= (type Ops_1Mask@26) (MapType1Type RefType realType))) (= (type Heap@34) (MapType0Type RefType))) (= (type Mask@37) (MapType1Type RefType realType))) (= (type Ops_1Heap@9) (MapType0Type RefType))) (= (type Ops_1Heap@10) (MapType0Type RefType))) (= (type Ops_1Mask@33) (MapType1Type RefType realType))) (= (type Heap@40) (MapType0Type RefType))) (= (type Mask@43) (MapType1Type RefType realType))) (= (type Result_8Heap) (MapType0Type RefType))) (= (type arg_this@0) RefType)) (= (type arg_fst@0) RefType)) (= (type ExhaleHeap@0) (MapType0Type RefType))) (= (type Ops_1Mask@31) (MapType1Type RefType realType))) (= (type Ops_1Mask@32) (MapType1Type RefType realType))) (= (type Heap@39) (MapType0Type RefType))) (= (type Mask@42) (MapType1Type RefType realType))) (= (type Result_8Mask) (MapType1Type RefType realType))) (= (type Used_3Mask@8) (MapType1Type RefType realType))) (= (type Used_3Heap@0) (MapType0Type RefType))) (= (type arg_nxt@0) RefType)) (= (type Ops_1Mask@28) (MapType1Type RefType realType))) (= (type Used_3Mask@3) (MapType1Type RefType realType))) (= (type Heap@36) (MapType0Type RefType))) (= (type Mask@39) (MapType1Type RefType realType))) (= (type Used_3Mask@7) (MapType1Type RefType realType))) (= (type Result_7Heap) (MapType0Type RefType))) (= (type Result_7Mask) (MapType1Type RefType realType))) (= (type Ops_1Mask@30) (MapType1Type RefType realType))) (= (type Heap@38) (MapType0Type RefType))) (= (type Mask@41) (MapType1Type RefType realType))) (= (type Used_3Mask@5) (MapType1Type RefType realType))) (= (type Used_3Mask@6) (MapType1Type RefType realType))) (= (type TempMask@7) (MapType1Type RefType realType))) (= (type Mask@40) (MapType1Type RefType realType))) (= (type newPMask@6) (MapType1Type RefType boolType))) (= (type Heap@37) (MapType0Type RefType))) (= (type Used_3Mask@4) (MapType1Type RefType realType))) (= (type TempMask@6) (MapType1Type RefType realType))) (= (type Ops_1Mask@29) (MapType1Type RefType realType))) (= (type Result_6Heap) (MapType0Type RefType))) (= (type Result_6Mask) (MapType1Type RefType realType))) (= (type Used_3Mask@1) (MapType1Type RefType realType))) (= (type Used_3Mask@2) (MapType1Type RefType realType))) (= (type TempMask@5) (MapType1Type RefType realType))) (= (type Mask@38) (MapType1Type RefType realType))) (= (type newPMask@5) (MapType1Type RefType boolType))) (= (type Heap@35) (MapType0Type RefType))) (= (type Used_3Mask@0) (MapType1Type RefType realType))) (= (type TempMask@4) (MapType1Type RefType realType))) (= (type Ops_1Mask@27) (MapType1Type RefType realType))) (= (type Ops_1Heap@0) (MapType0Type RefType))) (= (type Ops_1Mask@15) (MapType1Type RefType realType))) (= (type Mask@27) (MapType1Type RefType realType))) (= (type Heap@24) (MapType0Type RefType))) (= (type Ops_1Heap@8) (MapType0Type RefType))) (= (type Ops_1Mask@25) (MapType1Type RefType realType))) (= (type Mask@36) (MapType1Type RefType realType))) (= (type Heap@33) (MapType0Type RefType))) (= (type Ops_1Heap@6) (MapType0Type RefType))) (= (type newPMask@4) (MapType1Type RefType boolType))) (= (type Ops_1Heap@7) (MapType0Type RefType))) (= (type Ops_1Heap@4) (MapType0Type RefType))) (= (type Ops_1Heap@3) (MapType0Type RefType))) (= (type Ops_1Heap@5) (MapType0Type RefType))) (= (type Ops_1Heap@1) (MapType0Type RefType))) (= (type Ops_1Heap@2) (MapType0Type RefType))) (= (type freshVersion@1) FrameTypeType)) (= (type Result_5Heap) (MapType0Type RefType))) (= (type Result_5Mask) (MapType1Type RefType realType))) (= (type Ops_1Mask@24) (MapType1Type RefType realType))) (= (type Used_2Mask@16) (MapType1Type RefType realType))) (= (type Used_2Heap@0) (MapType0Type RefType))) (= (type Result_3Heap) (MapType0Type RefType))) (= (type Used_2Mask@11) (MapType1Type RefType realType))) (= (type Ops_1Mask@21) (MapType1Type RefType realType))) (= (type Mask@33) (MapType1Type RefType realType))) (= (type Heap@30) (MapType0Type RefType))) (= (type Used_2Mask@15) (MapType1Type RefType realType))) (= (type arg_1@0) RefType)) (= (type Result_4Heap) (MapType0Type RefType))) (= (type Result_4Mask) (MapType1Type RefType realType))) (= (type Ops_1Mask@23) (MapType1Type RefType realType))) (= (type Mask@35) (MapType1Type RefType realType))) (= (type Heap@32) (MapType0Type RefType))) (= (type Used_2Mask@13) (MapType1Type RefType realType))) (= (type Used_2Mask@14) (MapType1Type RefType realType))) (= (type TempMask@3) (MapType1Type RefType realType))) (= (type Mask@34) (MapType1Type RefType realType))) (= (type newPMask@3) (MapType1Type RefType boolType))) (= (type Heap@31) (MapType0Type RefType))) (= (type Used_2Mask@12) (MapType1Type RefType realType))) (= (type TempMask@2) (MapType1Type RefType realType))) (= (type Ops_1Mask@22) (MapType1Type RefType realType))) (= (type Result_3Mask) (MapType1Type RefType realType))) (= (type rcvLocal@2) RefType)) (= (type Used_2Mask@9) (MapType1Type RefType realType))) (= (type Mask@31) (MapType1Type RefType realType))) (= (type Heap@28) (MapType0Type RefType))) (= (type Used_2Mask@10) (MapType1Type RefType realType))) (= (type Mask@32) (MapType1Type RefType realType))) (= (type Heap@29) (MapType0Type RefType))) (= (type Ops_1Mask@19) (MapType1Type RefType realType))) (= (type Used_2Mask@7) (MapType1Type RefType realType))) (= (type Used_2Mask@8) (MapType1Type RefType realType))) (= (type Ops_1Mask@20) (MapType1Type RefType realType))) (= (type Result_2Heap) (MapType0Type RefType))) (= (type Result_2Mask) (MapType1Type RefType realType))) (= (type rcvLocal@1) RefType)) (= (type Heap@26) (MapType0Type RefType))) (= (type Mask@29) (MapType1Type RefType realType))) (= (type Used_2Mask@5) (MapType1Type RefType realType))) (= (type Used_2Mask@6) (MapType1Type RefType realType))) (= (type Mask@30) (MapType1Type RefType realType))) (= (type Heap@27) (MapType0Type RefType))) (= (type Used_2Mask@3) (MapType1Type RefType realType))) (= (type Ops_1Mask@17) (MapType1Type RefType realType))) (= (type Used_2Mask@4) (MapType1Type RefType realType))) (= (type Ops_1Mask@18) (MapType1Type RefType realType))) (= (type Result_1Heap) (MapType0Type RefType))) (= (type Result_1Mask) (MapType1Type RefType realType))) (= (type rcvLocal@0) RefType)) (= (type Used_2Mask@1) (MapType1Type RefType realType))) (= (type Used_2Mask@2) (MapType1Type RefType realType))) (= (type Mask@28) (MapType1Type RefType realType))) (= (type Heap@25) (MapType0Type RefType))) (= (type Used_2Mask@0) (MapType1Type RefType realType))) (= (type Ops_1Mask@16) (MapType1Type RefType realType))) (= (type Heap@21) (MapType0Type RefType))) (= (type Mask@24) (MapType1Type RefType realType))) (= (type Ops_1Mask@1) (MapType1Type RefType realType))) (= (type Ops_1Mask@14) (MapType1Type RefType realType))) (= (type Heap@23) (MapType0Type RefType))) (= (type Mask@26) (MapType1Type RefType realType))) (= (type Ops_1Mask@13) (MapType1Type RefType realType))) (= (type Ops_1Mask@12) (MapType1Type RefType realType))) (= (type Ops_1Mask@11) (MapType1Type RefType realType))) (= (type Ops_1Mask@10) (MapType1Type RefType realType))) (= (type Used_1Mask@3) (MapType1Type RefType realType))) (= (type ResultHeap) (MapType0Type RefType))) (= (type ResultMask@@0) (MapType1Type RefType realType))) (= (type Ops_1Mask@3) (MapType1Type RefType realType))) (= (type Used_1Heap@0) (MapType0Type RefType))) (= (type Ops_1Mask@4) (MapType1Type RefType realType))) (= (type Ops_1Mask@5) (MapType1Type RefType realType))) (= (type Ops_1Mask@6) (MapType1Type RefType realType))) (= (type Ops_1Mask@7) (MapType1Type RefType realType))) (= (type Ops_1Mask@8) (MapType1Type RefType realType))) (= (type Ops_1Mask@9) (MapType1Type RefType realType))) (= (type Used_1Mask@1) (MapType1Type RefType realType))) (= (type Used_1Mask@2) (MapType1Type RefType realType))) (= (type TempMask@1) (MapType1Type RefType realType))) (= (type Mask@25) (MapType1Type RefType realType))) (= (type newPMask@2) (MapType1Type RefType boolType))) (= (type Heap@22) (MapType0Type RefType))) (= (type Used_1Mask@0) (MapType1Type RefType realType))) (= (type TempMask@0) (MapType1Type RefType realType))) (= (type Ops_1Mask@2) (MapType1Type RefType realType))) (= (type Ops_1Mask@0) (MapType1Type RefType realType))) (= (type UsedHeap@0) (MapType0Type RefType))) (= (type Heap@19) (MapType0Type RefType))) (= (type newPMask@1) (MapType1Type RefType boolType))) (= (type Heap@20) (MapType0Type RefType))) (= (type Heap@17) (MapType0Type RefType))) (= (type newPMask@0) (MapType1Type RefType boolType))) (= (type Heap@18) (MapType0Type RefType))) (= (type Heap@11) (MapType0Type RefType))) (= (type Heap@10) (MapType0Type RefType))) (= (type Heap@12) (MapType0Type RefType))) (= (type Heap@13) (MapType0Type RefType))) (= (type Heap@14) (MapType0Type RefType))) (= (type Heap@15) (MapType0Type RefType))) (= (type Heap@16) (MapType0Type RefType))) (= (type Heap@8) (MapType0Type RefType))) (= (type Heap@7) (MapType0Type RefType))) (= (type Heap@9) (MapType0Type RefType))) (= (type freshVersion@0) FrameTypeType)) (= (type Mask@23) (MapType1Type RefType realType))) (= (type Mask@21) (MapType1Type RefType realType))) (= (type Mask@22) (MapType1Type RefType realType))) (= (type Mask@19) (MapType1Type RefType realType))) (= (type Mask@20) (MapType1Type RefType realType))) (= (type Mask@18) (MapType1Type RefType realType))) (= (type Mask@17) (MapType1Type RefType realType))) (= (type Mask@16) (MapType1Type RefType realType))) (= (type Mask@15) (MapType1Type RefType realType))) (= (type Mask@14) (MapType1Type RefType realType))) (= (type Mask@13) (MapType1Type RefType realType))) (= (type Mask@12) (MapType1Type RefType realType))) (= (type Heap@5) (MapType0Type RefType))) (= (type Heap@6) (MapType0Type RefType))) (= (type Mask@11) (MapType1Type RefType realType))) (= (type Mask@10) (MapType1Type RefType realType))) (= (type Mask@8) (MapType1Type RefType realType))) (= (type Mask@7) (MapType1Type RefType realType))) (= (type Mask@9) (MapType1Type RefType realType))) (= (type Heap@3) (MapType0Type RefType))) (= (type Heap@4) (MapType0Type RefType))) (= (type newVersion@1) FrameTypeType)) (= (type Mask@6) (MapType1Type RefType realType))) (= (type Mask@5) (MapType1Type RefType realType))) (= (type Mask@4) (MapType1Type RefType realType))) (= (type Heap@2) (MapType0Type RefType))) (= (type Heap@1) (MapType0Type RefType))) (= (type Heap@0) (MapType0Type RefType))) (= (type newVersion@0) FrameTypeType)) (= (type Mask@3) (MapType1Type RefType realType))) (= (type Heap@@35) (MapType0Type RefType))) (= (type Mask@1) (MapType1Type RefType realType))) (= (type Mask@0) (MapType1Type RefType realType))) (= (type Mask@2) (MapType1Type RefType realType))) (= (type PostHeap@0) (MapType0Type RefType))) (= (type PostMask@0) (MapType1Type RefType realType))) (= (type this@@55) RefType)))
(set-info :boogie-vc-id Iterator_new)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 391) (let ((anon262_Else_correct true))
(let ((anon262_Then_correct true))
(let ((anon261_Then_correct  (=> (and (and (state PostHeap@0 ZeroMask) (= PostMask@0 (MapType1Store ZeroMask null (Iterator_ready this@@55) (real_2_U (+ (U_2_real (MapType1Select ZeroMask null (Iterator_ready this@@55))) FullPerm))))) (and (state PostHeap@0 PostMask@0) (state PostHeap@0 PostMask@0))) (and (=> (= (ControlFlow 0 389) 387) anon262_Then_correct) (=> (= (ControlFlow 0 389) 388) anon262_Else_correct)))))
(let ((anon141_correct true))
(let ((anon334_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 173) 170)) anon141_correct)))
(let ((anon334_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 171) (- 0 172)) (<= FullPerm (U_2_real (MapType1Select Ops_1Mask@26 null (Node_state (MapType0Select Ops_1Heap@9 freshObj@0 Iterator_current)))))) (=> (<= FullPerm (U_2_real (MapType1Select Ops_1Mask@26 null (Node_state (MapType0Select Ops_1Heap@9 freshObj@0 Iterator_current))))) (=> (= (ControlFlow 0 171) 170) anon141_correct))))))
(let ((anon147_correct true))
(let ((anon338_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 165) 162)) anon147_correct)))
(let ((anon338_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 163) (- 0 164)) (<= FullPerm (U_2_real (MapType1Select Ops_1Mask@26 null (Node_state (MapType0Select Ops_1Heap@9 freshObj@0 Iterator_current)))))) (=> (<= FullPerm (U_2_real (MapType1Select Ops_1Mask@26 null (Node_state (MapType0Select Ops_1Heap@9 freshObj@0 Iterator_current))))) (=> (= (ControlFlow 0 163) 162) anon147_correct))))))
(let ((anon169_correct true))
(let ((anon350_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 134) 131)) anon169_correct)))
(let ((anon350_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 132) (- 0 133)) (<= FullPerm (U_2_real (MapType1Select Result_6Mask null (Node_reverse arg_this@0))))) (=> (<= FullPerm (U_2_real (MapType1Select Result_6Mask null (Node_reverse arg_this@0)))) (=> (= (ControlFlow 0 132) 131) anon169_correct))))))
(let ((anon189_correct true))
(let ((anon361_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 106) 103)) anon189_correct)))
(let ((anon361_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 104) (- 0 105)) (<= FullPerm (U_2_real (MapType1Select Result_8Mask null (Node_reverse arg_this@0))))) (=> (<= FullPerm (U_2_real (MapType1Select Result_8Mask null (Node_reverse arg_this@0)))) (=> (= (ControlFlow 0 104) 103) anon189_correct))))))
(let ((anon260_correct  (=> (and (= Mask@56 (MapType1Store Mask@55 null (Iterator_ready freshObj@0) (real_2_U (- (U_2_real (MapType1Select Mask@55 null (Iterator_ready freshObj@0))) FullPerm)))) (= (ControlFlow 0 2) (- 0 1))) (<= FullPerm (U_2_real (MapType1Select Mask@56 null (wand_1 freshObj@0 FullPerm l FullPerm)))))))
(let ((anon396_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 5) 2)) anon260_correct)))
(let ((anon396_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 3) (- 0 4)) (<= FullPerm (U_2_real (MapType1Select Mask@55 null (Iterator_ready freshObj@0))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@55 null (Iterator_ready freshObj@0)))) (=> (= (ControlFlow 0 3) 2) anon260_correct))))))
(let ((anon258_correct  (and (=> (= (ControlFlow 0 6) (- 0 7)) (=> (and (and b_1_1@94 b_1_1@94) b_20@6) (and (= neededTransfer@45 0.0) (= (U_2_real (MapType1Select Used_6Mask@3 null (List_state l))) initNeededTransfer@11)))) (=> (=> (and (and b_1_1@94 b_1_1@94) b_20@6) (and (= neededTransfer@45 0.0) (= (U_2_real (MapType1Select Used_6Mask@3 null (List_state l))) initNeededTransfer@11))) (=> (and (= b_21@0  (and b_1_1@94 b_20@6)) (= b_21@1  (and b_21@0 (state Result_13Heap Result_13Mask)))) (=> (and (and (and (= b_21@2  (and b_21@1 (sumMask Result_13Mask Ops_1Mask Used_6Mask@3))) (= b_21@3  (and (and b_21@2 (IdenticalOnKnownLocations Ops_1Heap@17 Result_13Heap Ops_1Mask)) (IdenticalOnKnownLocations Used_6Heap@0 Result_13Heap Used_6Mask@3)))) (and (= b_21@4  (and b_21@3 (state Result_13Heap Result_13Mask))) (= b_1_1@95  (and b_1_1@94 b_21@4)))) (and (and (= Mask@55 (MapType1Store Mask@54 null (wand_1 freshObj@0 FullPerm l FullPerm) (real_2_U (+ (U_2_real (MapType1Select Mask@54 null (wand_1 freshObj@0 FullPerm l FullPerm))) FullPerm)))) (state Heap@51 Mask@55)) (and (state Heap@51 Mask@55) (state Heap@51 Mask@55)))) (and (=> (= (ControlFlow 0 6) 3) anon396_Then_correct) (=> (= (ControlFlow 0 6) 5) anon396_Else_correct))))))))
(let ((anon395_Else_correct  (=> (>= 0.0 takeTransfer@22) (=> (and (= Heap@51 Heap@49) (= Mask@54 Mask@52)) (=> (and (and (= neededTransfer@45 neededTransfer@43) (= b_20@6 b_20@3)) (and (= Used_6Mask@3 Used_6Mask@1) (= (ControlFlow 0 10) 6))) anon258_correct)))))
(let ((anon395_Then_correct  (=> (> takeTransfer@22 0.0) (=> (and (= neededTransfer@44 (- neededTransfer@43 takeTransfer@22)) (= Used_6Mask@2 (MapType1Store Used_6Mask@1 null (List_state l) (real_2_U (+ (U_2_real (MapType1Select Used_6Mask@1 null (List_state l))) takeTransfer@22))))) (=> (and (and (= b_20@4  (and b_20@3 (state Used_6Heap@0 Used_6Mask@2))) (= TempMask@11 (MapType1Store ZeroMask null (List_state l) (real_2_U FullPerm)))) (and (= b_20@5  (and b_20@4 (IdenticalOnKnownLocations Heap@49 Used_6Heap@0 TempMask@11))) (= Mask@53 (MapType1Store Mask@52 null (List_state l) (real_2_U (- (U_2_real (MapType1Select Mask@52 null (List_state l))) takeTransfer@22)))))) (=> (and (and (and (forall ((o_17 T@U) (f_21 T@U) ) (! (let ((B@@11 (FieldTypeInv1 (type f_21))))
(let ((A@@12 (FieldTypeInv0 (type f_21))))
 (=> (and (and (= (type o_17) RefType) (= (type f_21) (FieldType A@@12 B@@11))) (or (U_2_bool (MapType1Select (MapType0Select Heap@49 null (|wand_1#sm| freshObj@0 FullPerm l FullPerm)) o_17 f_21)) (U_2_bool (MapType1Select (MapType0Select Heap@49 null (|List_state#sm| l)) o_17 f_21)))) (U_2_bool (MapType1Select newPMask@9 o_17 f_21)))))
 :qid |stdinbpl.3914:35|
 :skolemid |106|
 :pattern ( (MapType1Select newPMask@9 o_17 f_21))
)) (= Heap@50 (MapType0Store Heap@49 null (|wand_1#sm| freshObj@0 FullPerm l FullPerm) newPMask@9))) (and (= Heap@51 Heap@50) (= Mask@54 Mask@53))) (and (and (= neededTransfer@45 neededTransfer@44) (= b_20@6 b_20@5)) (and (= Used_6Mask@3 Used_6Mask@2) (= (ControlFlow 0 9) 6)))) anon258_correct))))))
(let ((anon394_Else_correct  (=> (and (< maskTransfer@22 neededTransfer@43) (= takeTransfer@22 maskTransfer@22)) (and (=> (= (ControlFlow 0 12) 9) anon395_Then_correct) (=> (= (ControlFlow 0 12) 10) anon395_Else_correct)))))
(let ((anon394_Then_correct  (=> (and (<= neededTransfer@43 maskTransfer@22) (= takeTransfer@22 neededTransfer@43)) (and (=> (= (ControlFlow 0 11) 9) anon395_Then_correct) (=> (= (ControlFlow 0 11) 10) anon395_Else_correct)))))
(let ((anon393_Then_correct  (=> (and (and (and (and (and b_1_1@94 b_1_1@94) b_20@3) true) (> neededTransfer@43 0.0)) (= maskTransfer@22 (U_2_real (MapType1Select Mask@52 null (List_state l))))) (and (=> (= (ControlFlow 0 13) 11) anon394_Then_correct) (=> (= (ControlFlow 0 13) 12) anon394_Else_correct)))))
(let ((anon393_Else_correct  (=> (not (and (and (and (and b_1_1@94 b_1_1@94) b_20@3) true) (> neededTransfer@43 0.0))) (=> (and (= Heap@51 Heap@49) (= Mask@54 Mask@52)) (=> (and (and (= neededTransfer@45 neededTransfer@43) (= b_20@6 b_20@3)) (and (= Used_6Mask@3 Used_6Mask@1) (= (ControlFlow 0 8) 6))) anon258_correct)))))
(let ((anon392_Else_correct  (=> (and (and (>= 0.0 takeTransfer@21) (= Used_6Mask@1 ZeroMask)) (and (= b_20@3 b_20@0) (= neededTransfer@43 FullPerm))) (and (=> (= (ControlFlow 0 16) 13) anon393_Then_correct) (=> (= (ControlFlow 0 16) 8) anon393_Else_correct)))))
(let ((anon392_Then_correct  (=> (and (> takeTransfer@21 0.0) (= neededTransfer@42 (- FullPerm takeTransfer@21))) (=> (and (and (and (= Used_6Mask@0 (MapType1Store ZeroMask null (List_state l) (real_2_U (+ (U_2_real (MapType1Select ZeroMask null (List_state l))) takeTransfer@21)))) (= b_20@1  (and b_20@0 (state Used_6Heap@0 Used_6Mask@0)))) (and (= TempMask@10 (MapType1Store ZeroMask null (List_state l) (real_2_U FullPerm))) (= b_20@2  (and b_20@1 (IdenticalOnKnownLocations Ops_1Heap@17 Used_6Heap@0 TempMask@10))))) (and (and (= Ops_1Mask@46 (MapType1Store Ops_1Mask@45 null (List_state l) (real_2_U (- (U_2_real (MapType1Select Ops_1Mask@45 null (List_state l))) takeTransfer@21)))) (= Used_6Mask@1 Used_6Mask@0)) (and (= b_20@3 b_20@2) (= neededTransfer@43 neededTransfer@42)))) (and (=> (= (ControlFlow 0 15) 13) anon393_Then_correct) (=> (= (ControlFlow 0 15) 8) anon393_Else_correct))))))
(let ((anon391_Else_correct  (=> (and (< maskTransfer@21 FullPerm) (= takeTransfer@21 maskTransfer@21)) (and (=> (= (ControlFlow 0 18) 15) anon392_Then_correct) (=> (= (ControlFlow 0 18) 16) anon392_Else_correct)))))
(let ((anon391_Then_correct  (=> (and (<= FullPerm maskTransfer@21) (= takeTransfer@21 FullPerm)) (and (=> (= (ControlFlow 0 17) 15) anon392_Then_correct) (=> (= (ControlFlow 0 17) 16) anon392_Else_correct)))))
(let ((anon390_Then_correct  (=> (and (and (and (and (and b_1_1@94 b_1_1@94) b_20@0) true) (> FullPerm 0.0)) (= maskTransfer@21 (U_2_real (MapType1Select Ops_1Mask@45 null (List_state l))))) (and (=> (= (ControlFlow 0 19) 17) anon391_Then_correct) (=> (= (ControlFlow 0 19) 18) anon391_Else_correct)))))
(let ((anon390_Else_correct  (=> (and (and (not (and (and (and (and b_1_1@94 b_1_1@94) b_20@0) true) (> FullPerm 0.0))) (= Used_6Mask@1 ZeroMask)) (and (= b_20@3 b_20@0) (= neededTransfer@43 FullPerm))) (and (=> (= (ControlFlow 0 14) 13) anon393_Then_correct) (=> (= (ControlFlow 0 14) 8) anon393_Else_correct)))))
(let ((anon246_correct  (=> (and (= b_20@0  (and b_20 (state Used_6Heap@0 ZeroMask))) (= initNeededTransfer@11 (+ (U_2_real (MapType1Select ZeroMask null (List_state l))) FullPerm))) (and (=> (= (ControlFlow 0 20) (- 0 21)) (>= FullPerm 0.0)) (=> (>= FullPerm 0.0) (and (=> (= (ControlFlow 0 20) 19) anon390_Then_correct) (=> (= (ControlFlow 0 20) 14) anon390_Else_correct)))))))
(let ((anon245_correct  (=> (= Ops_1Heap@15 (MapType0Store Ops_1Heap@14 null (|List_state#sm| l) (MapType1Store (MapType0Select Ops_1Heap@14 null (|List_state#sm| l)) l List_sentinel (bool_2_U true)))) (=> (and (forall ((o_16 T@U) (f_20 T@U) ) (! (let ((B@@12 (FieldTypeInv1 (type f_20))))
(let ((A@@13 (FieldTypeInv0 (type f_20))))
 (=> (and (and (= (type o_16) RefType) (= (type f_20) (FieldType A@@13 B@@12))) (or (U_2_bool (MapType1Select (MapType0Select Ops_1Heap@15 null (|List_state#sm| l)) o_16 f_20)) (U_2_bool (MapType1Select (MapType0Select Ops_1Heap@15 null (|Node_state#sm| (MapType0Select Ops_1Heap@15 l List_sentinel))) o_16 f_20)))) (U_2_bool (MapType1Select newPMask@8 o_16 f_20)))))
 :qid |stdinbpl.3854:31|
 :skolemid |105|
 :pattern ( (MapType1Select newPMask@8 o_16 f_20))
)) (= Ops_1Heap@16 (MapType0Store Ops_1Heap@15 null (|List_state#sm| l) newPMask@8))) (=> (and (and (and (state Ops_1Heap@16 Ops_1Mask@44) (= b_1_1@93  (and b_1_1@92 (state Ops_1Heap@16 Ops_1Mask@44)))) (and (= b_1_1@94 b_1_1@93) (= Ops_1Mask@45 Ops_1Mask@44))) (and (and (= Mask@52 Mask@51) (= Ops_1Heap@17 Ops_1Heap@16)) (and (= Heap@49 Heap@48) (= (ControlFlow 0 23) 20)))) anon246_correct)))))
(let ((anon389_Else_correct  (=> (HasDirectPerm Ops_1Mask@44 null (List_state l)) (=> (and (= Ops_1Heap@14 Ops_1Heap@11) (= (ControlFlow 0 25) 23)) anon245_correct))))
(let ((anon389_Then_correct  (=> (not (HasDirectPerm Ops_1Mask@44 null (List_state l))) (=> (and (and (= Ops_1Heap@12 (MapType0Store Ops_1Heap@11 null (|List_state#sm| l) ZeroPMask)) (= Ops_1Heap@13 (MapType0Store Ops_1Heap@12 null (List_state l) freshVersion@2))) (and (= Ops_1Heap@14 Ops_1Heap@13) (= (ControlFlow 0 24) 23))) anon245_correct))))
(let ((anon243_correct  (and (=> (= (ControlFlow 0 26) (- 0 27)) (=> (and b_1_1@87 b_17@12) (and (= neededTransfer@41 0.0) (= (U_2_real (MapType1Select Used_5Mask@7 null (Node_state arg_4@0))) initNeededTransfer@10)))) (=> (=> (and b_1_1@87 b_17@12) (and (= neededTransfer@41 0.0) (= (U_2_real (MapType1Select Used_5Mask@7 null (Node_state arg_4@0))) initNeededTransfer@10))) (=> (= b_19@0  (and b_1_1@87 b_17@12)) (=> (and (and (= b_19@1  (and b_19@0 (state Result_12Heap Result_12Mask))) (= b_19@2  (and b_19@1 (sumMask Result_12Mask Ops_1Mask@43 Used_5Mask@7)))) (and (= b_19@3  (and (and b_19@2 (IdenticalOnKnownLocations Ops_1Heap@11 Result_12Heap Ops_1Mask@43)) (IdenticalOnKnownLocations Used_5Heap@0 Result_12Heap Used_5Mask@7))) (= b_19@4  (and b_19@3 (state Result_12Heap Result_12Mask))))) (=> (and (and (and (= b_1_1@88  (and b_1_1@87 b_19@4)) (= b_1_1@89  (and b_1_1@88 b_17@12))) (and (= b_1_1@90  (and b_1_1@89 (= Used_5Heap@0 Ops_1Heap@11))) (= Ops_1Mask@44 (MapType1Store Ops_1Mask@43 null (List_state l) (real_2_U (+ (U_2_real (MapType1Select Ops_1Mask@43 null (List_state l))) FullPerm)))))) (and (and (= b_1_1@91  (and b_1_1@90 (state Ops_1Heap@11 Ops_1Mask@44))) (= b_1_1@92  (and b_1_1@91 (state Ops_1Heap@11 Ops_1Mask@44)))) (and (|List_state#trigger| Ops_1Heap@11 (List_state l)) (= (MapType0Select Ops_1Heap@11 null (List_state l)) (CombineFrames (FrameFragment (MapType0Select Ops_1Heap@11 l List_sentinel)) (MapType0Select Ops_1Heap@11 null (Node_state (MapType0Select Ops_1Heap@11 l List_sentinel)))))))) (and (=> (= (ControlFlow 0 26) 24) anon389_Then_correct) (=> (= (ControlFlow 0 26) 25) anon389_Else_correct)))))))))
(let ((anon388_Else_correct  (=> (>= 0.0 takeTransfer@20) (=> (and (= neededTransfer@41 neededTransfer@39) (= b_17@12 b_17@9)) (=> (and (and (= Heap@48 Heap@46) (= Mask@51 Mask@49)) (and (= Used_5Mask@7 Used_5Mask@5) (= (ControlFlow 0 30) 26))) anon243_correct)))))
(let ((anon388_Then_correct  (=> (> takeTransfer@20 0.0) (=> (and (= neededTransfer@40 (- neededTransfer@39 takeTransfer@20)) (= Used_5Mask@6 (MapType1Store Used_5Mask@5 null (Node_state arg_4@0) (real_2_U (+ (U_2_real (MapType1Select Used_5Mask@5 null (Node_state arg_4@0))) takeTransfer@20))))) (=> (and (and (= b_17@10  (and b_17@9 (state Used_5Heap@0 Used_5Mask@6))) (= TempMask@9 (MapType1Store ZeroMask null (Node_state arg_4@0) (real_2_U FullPerm)))) (and (= b_17@11  (and b_17@10 (IdenticalOnKnownLocations Heap@46 Used_5Heap@0 TempMask@9))) (= Mask@50 (MapType1Store Mask@49 null (Node_state arg_4@0) (real_2_U (- (U_2_real (MapType1Select Mask@49 null (Node_state arg_4@0))) takeTransfer@20)))))) (=> (and (and (and (forall ((o_15 T@U) (f_19 T@U) ) (! (let ((B@@13 (FieldTypeInv1 (type f_19))))
(let ((A@@14 (FieldTypeInv0 (type f_19))))
 (=> (and (and (= (type o_15) RefType) (= (type f_19) (FieldType A@@14 B@@13))) (or (U_2_bool (MapType1Select (MapType0Select Heap@46 null (|wand_1#sm| freshObj@0 FullPerm l FullPerm)) o_15 f_19)) (U_2_bool (MapType1Select (MapType0Select Heap@46 null (|Node_state#sm| (MapType0Select Heap@46 l List_sentinel))) o_15 f_19)))) (U_2_bool (MapType1Select newPMask@7 o_15 f_19)))))
 :qid |stdinbpl.3821:39|
 :skolemid |104|
 :pattern ( (MapType1Select newPMask@7 o_15 f_19))
)) (= Heap@47 (MapType0Store Heap@46 null (|wand_1#sm| freshObj@0 FullPerm l FullPerm) newPMask@7))) (and (= neededTransfer@41 neededTransfer@40) (= b_17@12 b_17@11))) (and (and (= Heap@48 Heap@47) (= Mask@51 Mask@50)) (and (= Used_5Mask@7 Used_5Mask@6) (= (ControlFlow 0 29) 26)))) anon243_correct))))))
(let ((anon387_Else_correct  (=> (and (< maskTransfer@20 neededTransfer@39) (= takeTransfer@20 maskTransfer@20)) (and (=> (= (ControlFlow 0 32) 29) anon388_Then_correct) (=> (= (ControlFlow 0 32) 30) anon388_Else_correct)))))
(let ((anon387_Then_correct  (=> (and (<= neededTransfer@39 maskTransfer@20) (= takeTransfer@20 neededTransfer@39)) (and (=> (= (ControlFlow 0 31) 29) anon388_Then_correct) (=> (= (ControlFlow 0 31) 30) anon388_Else_correct)))))
(let ((anon386_Then_correct  (=> (and (and (and (and b_1_1@87 b_17@9) true) (> neededTransfer@39 0.0)) (= maskTransfer@20 (U_2_real (MapType1Select Mask@49 null (Node_state arg_4@0))))) (and (=> (= (ControlFlow 0 33) 31) anon387_Then_correct) (=> (= (ControlFlow 0 33) 32) anon387_Else_correct)))))
(let ((anon386_Else_correct  (=> (not (and (and (and b_1_1@87 b_17@9) true) (> neededTransfer@39 0.0))) (=> (and (= neededTransfer@41 neededTransfer@39) (= b_17@12 b_17@9)) (=> (and (and (= Heap@48 Heap@46) (= Mask@51 Mask@49)) (and (= Used_5Mask@7 Used_5Mask@5) (= (ControlFlow 0 28) 26))) anon243_correct)))))
(let ((anon385_Else_correct  (=> (>= 0.0 takeTransfer@19) (=> (and (and (= Used_5Mask@5 Used_5Mask@3) (= b_17@9 b_17@6)) (and (= neededTransfer@39 FullPerm) (= Ops_1Mask@43 Ops_1Mask@41))) (and (=> (= (ControlFlow 0 36) 33) anon386_Then_correct) (=> (= (ControlFlow 0 36) 28) anon386_Else_correct))))))
(let ((anon385_Then_correct  (=> (> takeTransfer@19 0.0) (=> (and (= neededTransfer@38 (- FullPerm takeTransfer@19)) (= Used_5Mask@4 (MapType1Store Used_5Mask@3 null (Node_state arg_4@0) (real_2_U (+ (U_2_real (MapType1Select Used_5Mask@3 null (Node_state arg_4@0))) takeTransfer@19))))) (=> (and (and (and (= b_17@7  (and b_17@6 (state Used_5Heap@0 Used_5Mask@4))) (= TempMask@8 (MapType1Store ZeroMask null (Node_state arg_4@0) (real_2_U FullPerm)))) (and (= b_17@8  (and b_17@7 (IdenticalOnKnownLocations Ops_1Heap@11 Used_5Heap@0 TempMask@8))) (= Ops_1Mask@42 (MapType1Store Ops_1Mask@41 null (Node_state arg_4@0) (real_2_U (- (U_2_real (MapType1Select Ops_1Mask@41 null (Node_state arg_4@0))) takeTransfer@19)))))) (and (and (= Used_5Mask@5 Used_5Mask@4) (= b_17@9 b_17@8)) (and (= neededTransfer@39 neededTransfer@38) (= Ops_1Mask@43 Ops_1Mask@42)))) (and (=> (= (ControlFlow 0 35) 33) anon386_Then_correct) (=> (= (ControlFlow 0 35) 28) anon386_Else_correct)))))))
(let ((anon384_Else_correct  (=> (and (< maskTransfer@19 FullPerm) (= takeTransfer@19 maskTransfer@19)) (and (=> (= (ControlFlow 0 38) 35) anon385_Then_correct) (=> (= (ControlFlow 0 38) 36) anon385_Else_correct)))))
(let ((anon384_Then_correct  (=> (and (<= FullPerm maskTransfer@19) (= takeTransfer@19 FullPerm)) (and (=> (= (ControlFlow 0 37) 35) anon385_Then_correct) (=> (= (ControlFlow 0 37) 36) anon385_Else_correct)))))
(let ((anon383_Then_correct  (=> (and (and (and (and b_1_1@87 b_17@6) true) (> FullPerm 0.0)) (= maskTransfer@19 (U_2_real (MapType1Select Ops_1Mask@41 null (Node_state arg_4@0))))) (and (=> (= (ControlFlow 0 39) 37) anon384_Then_correct) (=> (= (ControlFlow 0 39) 38) anon384_Else_correct)))))
(let ((anon383_Else_correct  (=> (not (and (and (and b_1_1@87 b_17@6) true) (> FullPerm 0.0))) (=> (and (and (= Used_5Mask@5 Used_5Mask@3) (= b_17@9 b_17@6)) (and (= neededTransfer@39 FullPerm) (= Ops_1Mask@43 Ops_1Mask@41))) (and (=> (= (ControlFlow 0 34) 33) anon386_Then_correct) (=> (= (ControlFlow 0 34) 28) anon386_Else_correct))))))
(let ((anon231_correct  (=> (and (= arg_4@0 (MapType0Select Result_11Heap l List_sentinel)) (= initNeededTransfer@10 (+ (U_2_real (MapType1Select Used_5Mask@3 null (Node_state arg_4@0))) FullPerm))) (and (=> (= (ControlFlow 0 40) (- 0 41)) (>= FullPerm 0.0)) (=> (>= FullPerm 0.0) (and (=> (= (ControlFlow 0 40) 39) anon383_Then_correct) (=> (= (ControlFlow 0 40) 34) anon383_Else_correct)))))))
(let ((anon382_Else_correct  (=> (and (not b_1_1@87) (= (ControlFlow 0 45) 40)) anon231_correct)))
(let ((anon382_Then_correct  (=> b_1_1@87 (and (=> (= (ControlFlow 0 43) (- 0 44)) (HasDirectPerm Result_11Mask l List_sentinel)) (=> (HasDirectPerm Result_11Mask l List_sentinel) (=> (= (ControlFlow 0 43) 40) anon231_correct))))))
(let ((anon381_Then_correct  (=> (and b_1_1@87 b_17@6) (and (=> (= (ControlFlow 0 46) 43) anon382_Then_correct) (=> (= (ControlFlow 0 46) 45) anon382_Else_correct)))))
(let ((anon381_Else_correct  (=> (and (not (and b_1_1@87 b_17@6)) (= (ControlFlow 0 42) 40)) anon231_correct)))
(let ((anon228_correct  (and (=> (= (ControlFlow 0 47) (- 0 48)) (=> (and b_1_1@85 b_17@6) (not (= (MapType0Select Result_11Heap l List_sentinel) null)))) (=> (=> (and b_1_1@85 b_17@6) (not (= (MapType0Select Result_11Heap l List_sentinel) null))) (=> (and (= b_1_1@86  (and b_1_1@85 b_17@6)) (= b_1_1@87  (and b_1_1@86 (= Used_5Heap@0 Ops_1Heap@11)))) (and (=> (= (ControlFlow 0 47) 46) anon381_Then_correct) (=> (= (ControlFlow 0 47) 42) anon381_Else_correct)))))))
(let ((anon380_Else_correct  (=> (and (not b_1_1@85) (= (ControlFlow 0 52) 47)) anon228_correct)))
(let ((anon380_Then_correct  (=> b_1_1@85 (and (=> (= (ControlFlow 0 50) (- 0 51)) (HasDirectPerm Result_11Mask l List_sentinel)) (=> (HasDirectPerm Result_11Mask l List_sentinel) (=> (= (ControlFlow 0 50) 47) anon228_correct))))))
(let ((anon379_Then_correct  (=> (and b_1_1@85 b_17@6) (and (=> (= (ControlFlow 0 53) 50) anon380_Then_correct) (=> (= (ControlFlow 0 53) 52) anon380_Else_correct)))))
(let ((anon379_Else_correct  (=> (and (not (and b_1_1@85 b_17@6)) (= (ControlFlow 0 49) 47)) anon228_correct)))
(let ((anon225_correct  (and (=> (= (ControlFlow 0 54) (- 0 55)) (=> (and b_1_1@82 b_17@6) (and (= neededTransfer@37 0.0) (= (U_2_real (MapType1Select Used_5Mask@3 l List_sentinel)) initNeededTransfer@9)))) (=> (=> (and b_1_1@82 b_17@6) (and (= neededTransfer@37 0.0) (= (U_2_real (MapType1Select Used_5Mask@3 l List_sentinel)) initNeededTransfer@9))) (=> (and (and (and (= b_18@0  (and b_1_1@82 b_17@6)) (= b_18@1  (and b_18@0 (state Result_11Heap Result_11Mask)))) (and (= b_18@2  (and b_18@1 (sumMask Result_11Mask Ops_1Mask@41 Used_5Mask@3))) (= b_18@3  (and (and b_18@2 (IdenticalOnKnownLocations Ops_1Heap@11 Result_11Heap Ops_1Mask@41)) (IdenticalOnKnownLocations Used_5Heap@0 Result_11Heap Used_5Mask@3))))) (and (and (= b_18@4  (and b_18@3 (state Result_11Heap Result_11Mask))) (= b_1_1@83  (and b_1_1@82 b_18@4))) (and (= b_1_1@84  (and b_1_1@83 b_17@6)) (= b_1_1@85  (and b_1_1@84 (= Used_5Heap@0 Ops_1Heap@11)))))) (and (=> (= (ControlFlow 0 54) 53) anon379_Then_correct) (=> (= (ControlFlow 0 54) 49) anon379_Else_correct)))))))
(let ((anon378_Else_correct  (=> (>= 0.0 takeTransfer@18) (=> (and (= Mask@49 Mask@47) (= Heap@46 Heap@44)) (=> (and (and (= neededTransfer@37 neededTransfer@35) (= b_17@6 b_17@3)) (and (= Used_5Mask@3 Used_5Mask@1) (= (ControlFlow 0 58) 54))) anon225_correct)))))
(let ((anon378_Then_correct  (=> (> takeTransfer@18 0.0) (=> (and (and (= neededTransfer@36 (- neededTransfer@35 takeTransfer@18)) (= Used_5Mask@2 (MapType1Store Used_5Mask@1 l List_sentinel (real_2_U (+ (U_2_real (MapType1Select Used_5Mask@1 l List_sentinel)) takeTransfer@18))))) (and (= b_17@4  (and b_17@3 (state Used_5Heap@0 Used_5Mask@2))) (= b_17@5  (and b_17@4 (= (MapType0Select Heap@44 l List_sentinel) (MapType0Select Used_5Heap@0 l List_sentinel)))))) (=> (and (and (and (= Mask@48 (MapType1Store Mask@47 l List_sentinel (real_2_U (- (U_2_real (MapType1Select Mask@47 l List_sentinel)) takeTransfer@18)))) (= Heap@45 (MapType0Store Heap@44 null (|wand_1#sm| freshObj@0 FullPerm l FullPerm) (MapType1Store (MapType0Select Heap@44 null (|wand_1#sm| freshObj@0 FullPerm l FullPerm)) l List_sentinel (bool_2_U true))))) (and (= Mask@49 Mask@48) (= Heap@46 Heap@45))) (and (and (= neededTransfer@37 neededTransfer@36) (= b_17@6 b_17@5)) (and (= Used_5Mask@3 Used_5Mask@2) (= (ControlFlow 0 57) 54)))) anon225_correct)))))
(let ((anon377_Else_correct  (=> (and (< maskTransfer@18 neededTransfer@35) (= takeTransfer@18 maskTransfer@18)) (and (=> (= (ControlFlow 0 60) 57) anon378_Then_correct) (=> (= (ControlFlow 0 60) 58) anon378_Else_correct)))))
(let ((anon377_Then_correct  (=> (and (<= neededTransfer@35 maskTransfer@18) (= takeTransfer@18 neededTransfer@35)) (and (=> (= (ControlFlow 0 59) 57) anon378_Then_correct) (=> (= (ControlFlow 0 59) 58) anon378_Else_correct)))))
(let ((anon376_Then_correct  (=> (and (and (and (and b_1_1@82 b_17@3) true) (> neededTransfer@35 0.0)) (= maskTransfer@18 (U_2_real (MapType1Select Mask@47 l List_sentinel)))) (and (=> (= (ControlFlow 0 61) 59) anon377_Then_correct) (=> (= (ControlFlow 0 61) 60) anon377_Else_correct)))))
(let ((anon376_Else_correct  (=> (not (and (and (and b_1_1@82 b_17@3) true) (> neededTransfer@35 0.0))) (=> (and (= Mask@49 Mask@47) (= Heap@46 Heap@44)) (=> (and (and (= neededTransfer@37 neededTransfer@35) (= b_17@6 b_17@3)) (and (= Used_5Mask@3 Used_5Mask@1) (= (ControlFlow 0 56) 54))) anon225_correct)))))
(let ((anon375_Else_correct  (=> (>= 0.0 takeTransfer@17) (=> (and (and (= Ops_1Mask@41 Ops_1Mask@39) (= Used_5Mask@1 ZeroMask)) (and (= b_17@3 b_17@0) (= neededTransfer@35 FullPerm))) (and (=> (= (ControlFlow 0 64) 61) anon376_Then_correct) (=> (= (ControlFlow 0 64) 56) anon376_Else_correct))))))
(let ((anon375_Then_correct  (=> (and (> takeTransfer@17 0.0) (= neededTransfer@34 (- FullPerm takeTransfer@17))) (=> (and (and (and (= Used_5Mask@0 (MapType1Store ZeroMask l List_sentinel (real_2_U (+ (U_2_real (MapType1Select ZeroMask l List_sentinel)) takeTransfer@17)))) (= b_17@1  (and b_17@0 (state Used_5Heap@0 Used_5Mask@0)))) (and (= b_17@2  (and b_17@1 (= (MapType0Select Ops_1Heap@11 l List_sentinel) (MapType0Select Used_5Heap@0 l List_sentinel)))) (= Ops_1Mask@40 (MapType1Store Ops_1Mask@39 l List_sentinel (real_2_U (- (U_2_real (MapType1Select Ops_1Mask@39 l List_sentinel)) takeTransfer@17)))))) (and (and (= Ops_1Mask@41 Ops_1Mask@40) (= Used_5Mask@1 Used_5Mask@0)) (and (= b_17@3 b_17@2) (= neededTransfer@35 neededTransfer@34)))) (and (=> (= (ControlFlow 0 63) 61) anon376_Then_correct) (=> (= (ControlFlow 0 63) 56) anon376_Else_correct))))))
(let ((anon374_Else_correct  (=> (and (< maskTransfer@17 FullPerm) (= takeTransfer@17 maskTransfer@17)) (and (=> (= (ControlFlow 0 66) 63) anon375_Then_correct) (=> (= (ControlFlow 0 66) 64) anon375_Else_correct)))))
(let ((anon374_Then_correct  (=> (and (<= FullPerm maskTransfer@17) (= takeTransfer@17 FullPerm)) (and (=> (= (ControlFlow 0 65) 63) anon375_Then_correct) (=> (= (ControlFlow 0 65) 64) anon375_Else_correct)))))
(let ((anon373_Then_correct  (=> (and (and (and (and b_1_1@82 b_17@0) true) (> FullPerm 0.0)) (= maskTransfer@17 (U_2_real (MapType1Select Ops_1Mask@39 l List_sentinel)))) (and (=> (= (ControlFlow 0 67) 65) anon374_Then_correct) (=> (= (ControlFlow 0 67) 66) anon374_Else_correct)))))
(let ((anon373_Else_correct  (=> (not (and (and (and b_1_1@82 b_17@0) true) (> FullPerm 0.0))) (=> (and (and (= Ops_1Mask@41 Ops_1Mask@39) (= Used_5Mask@1 ZeroMask)) (and (= b_17@3 b_17@0) (= neededTransfer@35 FullPerm))) (and (=> (= (ControlFlow 0 62) 61) anon376_Then_correct) (=> (= (ControlFlow 0 62) 56) anon376_Else_correct))))))
(let ((anon372_Then_correct  (=> b_1_1@82 (=> (and (= b_17@0  (and b_17 (state Used_5Heap@0 ZeroMask))) (= initNeededTransfer@9 (+ (U_2_real (MapType1Select ZeroMask l List_sentinel)) FullPerm))) (and (=> (= (ControlFlow 0 68) (- 0 69)) (>= FullPerm 0.0)) (=> (>= FullPerm 0.0) (and (=> (= (ControlFlow 0 68) 67) anon373_Then_correct) (=> (= (ControlFlow 0 68) 62) anon373_Else_correct))))))))
(let ((anon372_Else_correct  (=> (not b_1_1@82) (=> (and (= b_1_1@94 b_1_1@82) (= Ops_1Mask@45 Ops_1Mask@39)) (=> (and (and (= Mask@52 Mask@47) (= Ops_1Heap@17 Ops_1Heap@11)) (and (= Heap@49 Heap@44) (= (ControlFlow 0 22) 20))) anon246_correct)))))
(let ((anon211_correct  (and (=> (= (ControlFlow 0 71) (- 0 72)) (=> (and b_1_1@79 b_1_1@79) (and (= neededTransfer@33 0.0) (= (U_2_real (MapType1Select Ops_1Mask@38 freshObj@0 Iterator_iteratee)) initNeededTransfer@8)))) (=> (=> (and b_1_1@79 b_1_1@79) (and (= neededTransfer@33 0.0) (= (U_2_real (MapType1Select Ops_1Mask@38 freshObj@0 Iterator_iteratee)) initNeededTransfer@8))) (=> (= b_16@0  (and b_1_1@79 b_14@6)) (=> (and (= b_16@1  (and b_16@0 (state Result_10Heap Result_10Mask))) (= b_16@2  (and b_16@1 (sumMask Result_10Mask Ops_1Mask@38 Used_4Mask@5)))) (=> (and (and (and (= b_16@3  (and (and b_16@2 (IdenticalOnKnownLocations Ops_1Heap@11 Result_10Heap Ops_1Mask@38)) (IdenticalOnKnownLocations Used_4Heap@2 Result_10Heap Used_4Mask@5))) (= b_16@4  (and b_16@3 (state Result_10Heap Result_10Mask)))) (and (= b_1_1@80  (and b_1_1@79 b_16@4)) (= b_1_1@81  (and b_1_1@80 (state Ops_1Heap@11 Ops_1Mask@38))))) (and (and (= Ops_1Mask@39 Ops_1Mask@38) (= Mask@47 Mask@46)) (and (= Heap@44 Heap@43) (= b_1_1@82 b_1_1@81)))) (and (=> (= (ControlFlow 0 71) 68) anon372_Then_correct) (=> (= (ControlFlow 0 71) 22) anon372_Else_correct)))))))))
(let ((anon371_Else_correct  (=> (>= 0.0 takeTransfer@16) (=> (and (= Used_4Mask@5 Used_4Mask@3) (= b_1_1@79 b_1_1@76)) (=> (and (and (= Used_4Heap@2 Used_4Heap@0) (= neededTransfer@33 FullPerm)) (and (= Ops_1Mask@38 Ops_1Mask@36) (= (ControlFlow 0 75) 71))) anon211_correct)))))
(let ((anon371_Then_correct  (=> (> takeTransfer@16 0.0) (=> (and (and (= neededTransfer@32 (- FullPerm takeTransfer@16)) (= Ops_1Mask@37 (MapType1Store Ops_1Mask@36 freshObj@0 Iterator_iteratee (real_2_U (+ (U_2_real (MapType1Select Ops_1Mask@36 freshObj@0 Iterator_iteratee)) takeTransfer@16))))) (and (= b_1_1@77  (and b_1_1@76 (state Ops_1Heap@11 Ops_1Mask@37))) (= b_1_1@78  (and b_1_1@77 (= (MapType0Select Used_4Heap@0 freshObj@0 Iterator_iteratee) (MapType0Select Ops_1Heap@11 freshObj@0 Iterator_iteratee)))))) (=> (and (and (and (= Used_4Mask@4 (MapType1Store Used_4Mask@3 freshObj@0 Iterator_iteratee (real_2_U (- (U_2_real (MapType1Select Used_4Mask@3 freshObj@0 Iterator_iteratee)) takeTransfer@16)))) (= Used_4Heap@1 (MapType0Store Used_4Heap@0 null (|wand_1#sm| freshObj@0 FullPerm l FullPerm) (MapType1Store (MapType0Select Used_4Heap@0 null (|wand_1#sm| freshObj@0 FullPerm l FullPerm)) freshObj@0 Iterator_iteratee (bool_2_U true))))) (and (= Used_4Mask@5 Used_4Mask@4) (= b_1_1@79 b_1_1@78))) (and (and (= Used_4Heap@2 Used_4Heap@1) (= neededTransfer@33 neededTransfer@32)) (and (= Ops_1Mask@38 Ops_1Mask@37) (= (ControlFlow 0 74) 71)))) anon211_correct)))))
(let ((anon370_Else_correct  (=> (and (< maskTransfer@16 FullPerm) (= takeTransfer@16 maskTransfer@16)) (and (=> (= (ControlFlow 0 77) 74) anon371_Then_correct) (=> (= (ControlFlow 0 77) 75) anon371_Else_correct)))))
(let ((anon370_Then_correct  (=> (and (<= FullPerm maskTransfer@16) (= takeTransfer@16 FullPerm)) (and (=> (= (ControlFlow 0 76) 74) anon371_Then_correct) (=> (= (ControlFlow 0 76) 75) anon371_Else_correct)))))
(let ((anon369_Then_correct  (=> (and (and (and (and b_1_1@76 b_1_1@76) true) (> FullPerm 0.0)) (= maskTransfer@16 (U_2_real (MapType1Select Used_4Mask@3 freshObj@0 Iterator_iteratee)))) (and (=> (= (ControlFlow 0 78) 76) anon370_Then_correct) (=> (= (ControlFlow 0 78) 77) anon370_Else_correct)))))
(let ((anon369_Else_correct  (=> (not (and (and (and b_1_1@76 b_1_1@76) true) (> FullPerm 0.0))) (=> (and (= Used_4Mask@5 Used_4Mask@3) (= b_1_1@79 b_1_1@76)) (=> (and (and (= Used_4Heap@2 Used_4Heap@0) (= neededTransfer@33 FullPerm)) (and (= Ops_1Mask@38 Ops_1Mask@36) (= (ControlFlow 0 73) 71))) anon211_correct)))))
(let ((anon205_correct  (and (=> (= (ControlFlow 0 79) (- 0 81)) (=> (and b_1_1@73 b_14@6) (and (= neededTransfer@31 0.0) (= (U_2_real (MapType1Select Used_4Mask@3 freshObj@0 Iterator_iteratee)) initNeededTransfer@7)))) (=> (=> (and b_1_1@73 b_14@6) (and (= neededTransfer@31 0.0) (= (U_2_real (MapType1Select Used_4Mask@3 freshObj@0 Iterator_iteratee)) initNeededTransfer@7))) (=> (= b_15@0  (and b_1_1@73 b_14@6)) (=> (and (and (and (= b_15@1  (and b_15@0 (state Result_9Heap Result_9Mask))) (= b_15@2  (and b_15@1 (sumMask Result_9Mask Ops_1Mask@36 Used_4Mask@3)))) (and (= b_15@3  (and (and b_15@2 (IdenticalOnKnownLocations Ops_1Heap@11 Result_9Heap Ops_1Mask@36)) (IdenticalOnKnownLocations Used_4Heap@0 Result_9Heap Used_4Mask@3))) (= b_15@4  (and b_15@3 (state Result_9Heap Result_9Mask))))) (and (and (= b_1_1@74  (and b_1_1@73 b_15@4)) (= b_1_1@75  (and b_1_1@74 b_14@6))) (and (= b_1_1@76  (and b_1_1@75 (= Used_4Heap@0 Ops_1Heap@11))) (= initNeededTransfer@8 (+ (U_2_real (MapType1Select Ops_1Mask@36 freshObj@0 Iterator_iteratee)) FullPerm))))) (and (=> (= (ControlFlow 0 79) (- 0 80)) (>= FullPerm 0.0)) (=> (>= FullPerm 0.0) (and (=> (= (ControlFlow 0 79) 78) anon369_Then_correct) (=> (= (ControlFlow 0 79) 73) anon369_Else_correct))))))))))
(let ((anon368_Else_correct  (=> (>= 0.0 takeTransfer@15) (=> (and (= neededTransfer@31 neededTransfer@29) (= Heap@43 Heap@41)) (=> (and (and (= Mask@46 Mask@44) (= b_14@6 b_14@3)) (and (= Used_4Mask@3 Used_4Mask@1) (= (ControlFlow 0 84) 79))) anon205_correct)))))
(let ((anon368_Then_correct  (=> (> takeTransfer@15 0.0) (=> (and (and (= neededTransfer@30 (- neededTransfer@29 takeTransfer@15)) (= Used_4Mask@2 (MapType1Store Used_4Mask@1 freshObj@0 Iterator_iteratee (real_2_U (+ (U_2_real (MapType1Select Used_4Mask@1 freshObj@0 Iterator_iteratee)) takeTransfer@15))))) (and (= b_14@4  (and b_14@3 (state Used_4Heap@0 Used_4Mask@2))) (= b_14@5  (and b_14@4 (= (MapType0Select Heap@41 freshObj@0 Iterator_iteratee) (MapType0Select Used_4Heap@0 freshObj@0 Iterator_iteratee)))))) (=> (and (and (and (= Mask@45 (MapType1Store Mask@44 freshObj@0 Iterator_iteratee (real_2_U (- (U_2_real (MapType1Select Mask@44 freshObj@0 Iterator_iteratee)) takeTransfer@15)))) (= Heap@42 (MapType0Store Heap@41 null (|wand_1#sm| freshObj@0 FullPerm l FullPerm) (MapType1Store (MapType0Select Heap@41 null (|wand_1#sm| freshObj@0 FullPerm l FullPerm)) freshObj@0 Iterator_iteratee (bool_2_U true))))) (and (= neededTransfer@31 neededTransfer@30) (= Heap@43 Heap@42))) (and (and (= Mask@46 Mask@45) (= b_14@6 b_14@5)) (and (= Used_4Mask@3 Used_4Mask@2) (= (ControlFlow 0 83) 79)))) anon205_correct)))))
(let ((anon367_Else_correct  (=> (and (< maskTransfer@15 neededTransfer@29) (= takeTransfer@15 maskTransfer@15)) (and (=> (= (ControlFlow 0 86) 83) anon368_Then_correct) (=> (= (ControlFlow 0 86) 84) anon368_Else_correct)))))
(let ((anon367_Then_correct  (=> (and (<= neededTransfer@29 maskTransfer@15) (= takeTransfer@15 neededTransfer@29)) (and (=> (= (ControlFlow 0 85) 83) anon368_Then_correct) (=> (= (ControlFlow 0 85) 84) anon368_Else_correct)))))
(let ((anon366_Then_correct  (=> (and (and (and (and b_1_1@73 b_14@3) true) (> neededTransfer@29 0.0)) (= maskTransfer@15 (U_2_real (MapType1Select Mask@44 freshObj@0 Iterator_iteratee)))) (and (=> (= (ControlFlow 0 87) 85) anon367_Then_correct) (=> (= (ControlFlow 0 87) 86) anon367_Else_correct)))))
(let ((anon366_Else_correct  (=> (not (and (and (and b_1_1@73 b_14@3) true) (> neededTransfer@29 0.0))) (=> (and (= neededTransfer@31 neededTransfer@29) (= Heap@43 Heap@41)) (=> (and (and (= Mask@46 Mask@44) (= b_14@6 b_14@3)) (and (= Used_4Mask@3 Used_4Mask@1) (= (ControlFlow 0 82) 79))) anon205_correct)))))
(let ((anon365_Else_correct  (=> (>= 0.0 takeTransfer@14) (=> (and (and (= Ops_1Mask@36 Ops_1Mask@34) (= Used_4Mask@1 ZeroMask)) (and (= b_14@3 b_14@0) (= neededTransfer@29 FullPerm))) (and (=> (= (ControlFlow 0 90) 87) anon366_Then_correct) (=> (= (ControlFlow 0 90) 82) anon366_Else_correct))))))
(let ((anon365_Then_correct  (=> (and (> takeTransfer@14 0.0) (= neededTransfer@28 (- FullPerm takeTransfer@14))) (=> (and (and (and (= Used_4Mask@0 (MapType1Store ZeroMask freshObj@0 Iterator_iteratee (real_2_U (+ (U_2_real (MapType1Select ZeroMask freshObj@0 Iterator_iteratee)) takeTransfer@14)))) (= b_14@1  (and b_14@0 (state Used_4Heap@0 Used_4Mask@0)))) (and (= b_14@2  (and b_14@1 (= (MapType0Select Ops_1Heap@11 freshObj@0 Iterator_iteratee) (MapType0Select Used_4Heap@0 freshObj@0 Iterator_iteratee)))) (= Ops_1Mask@35 (MapType1Store Ops_1Mask@34 freshObj@0 Iterator_iteratee (real_2_U (- (U_2_real (MapType1Select Ops_1Mask@34 freshObj@0 Iterator_iteratee)) takeTransfer@14)))))) (and (and (= Ops_1Mask@36 Ops_1Mask@35) (= Used_4Mask@1 Used_4Mask@0)) (and (= b_14@3 b_14@2) (= neededTransfer@29 neededTransfer@28)))) (and (=> (= (ControlFlow 0 89) 87) anon366_Then_correct) (=> (= (ControlFlow 0 89) 82) anon366_Else_correct))))))
(let ((anon364_Else_correct  (=> (and (< maskTransfer@14 FullPerm) (= takeTransfer@14 maskTransfer@14)) (and (=> (= (ControlFlow 0 92) 89) anon365_Then_correct) (=> (= (ControlFlow 0 92) 90) anon365_Else_correct)))))
(let ((anon364_Then_correct  (=> (and (<= FullPerm maskTransfer@14) (= takeTransfer@14 FullPerm)) (and (=> (= (ControlFlow 0 91) 89) anon365_Then_correct) (=> (= (ControlFlow 0 91) 90) anon365_Else_correct)))))
(let ((anon363_Then_correct  (=> (and (and (and (and b_1_1@73 b_14@0) true) (> FullPerm 0.0)) (= maskTransfer@14 (U_2_real (MapType1Select Ops_1Mask@34 freshObj@0 Iterator_iteratee)))) (and (=> (= (ControlFlow 0 93) 91) anon364_Then_correct) (=> (= (ControlFlow 0 93) 92) anon364_Else_correct)))))
(let ((anon363_Else_correct  (=> (not (and (and (and b_1_1@73 b_14@0) true) (> FullPerm 0.0))) (=> (and (and (= Ops_1Mask@36 Ops_1Mask@34) (= Used_4Mask@1 ZeroMask)) (and (= b_14@3 b_14@0) (= neededTransfer@29 FullPerm))) (and (=> (= (ControlFlow 0 88) 87) anon366_Then_correct) (=> (= (ControlFlow 0 88) 82) anon366_Else_correct))))))
(let ((anon362_Then_correct  (=> b_1_1@73 (=> (and (= b_14@0  (and b_14 (state Used_4Heap@0 ZeroMask))) (= initNeededTransfer@7 (+ (U_2_real (MapType1Select ZeroMask freshObj@0 Iterator_iteratee)) FullPerm))) (and (=> (= (ControlFlow 0 94) (- 0 95)) (>= FullPerm 0.0)) (=> (>= FullPerm 0.0) (and (=> (= (ControlFlow 0 94) 93) anon363_Then_correct) (=> (= (ControlFlow 0 94) 88) anon363_Else_correct))))))))
(let ((anon362_Else_correct  (=> (not b_1_1@73) (=> (and (and (= Ops_1Mask@39 Ops_1Mask@34) (= Mask@47 Mask@44)) (and (= Heap@44 Heap@41) (= b_1_1@82 b_1_1@73))) (and (=> (= (ControlFlow 0 70) 68) anon372_Then_correct) (=> (= (ControlFlow 0 70) 22) anon372_Else_correct))))))
(let ((anon191_correct  (=> (and (= b_1_1@72  (and b_1_1@71 (state Ops_1Heap@10 Ops_1Mask@33))) (= Ops_1Mask@34 Ops_1Mask@33)) (=> (and (and (= b_1_1@73 b_1_1@72) (= Heap@41 Heap@40)) (and (= Mask@44 Mask@43) (= Ops_1Heap@11 Ops_1Heap@10))) (and (=> (= (ControlFlow 0 97) 94) anon362_Then_correct) (=> (= (ControlFlow 0 97) 70) anon362_Else_correct))))))
(let ((anon190_correct  (and (=> (= (ControlFlow 0 99) (- 0 100)) (=> (and b_1_1@65 b_10@13) (= (Node_first Result_8Heap arg_this@0) arg_fst@0))) (=> (=> (and b_1_1@65 b_10@13) (= (Node_first Result_8Heap arg_this@0) arg_fst@0)) (=> (= b_1_1@66  (and b_1_1@65 b_10@13)) (=> (and (and (IdenticalOnKnownLocations Ops_1Heap@9 ExhaleHeap@0 Ops_1Mask@31) (= b_1_1@67  (and b_1_1@66 (not (= arg_fst@0 null))))) (and (= Ops_1Mask@32 (MapType1Store Ops_1Mask@31 null (Node_state arg_fst@0) (real_2_U (+ (U_2_real (MapType1Select Ops_1Mask@31 null (Node_state arg_fst@0))) FullPerm)))) (= b_1_1@68  (and b_1_1@67 (state ExhaleHeap@0 Ops_1Mask@32))))) (=> (and (and (and (= b_1_1@69  (and b_1_1@68 (state ExhaleHeap@0 Ops_1Mask@32))) (= b_1_1@70  (and b_1_1@69 (state ExhaleHeap@0 Ops_1Mask@32)))) (and (= Ops_1Heap@10 ExhaleHeap@0) (= Heap@40 Heap@39))) (and (and (= Mask@43 Mask@42) (= b_1_1@71 b_1_1@70)) (and (= Ops_1Mask@33 Ops_1Mask@32) (= (ControlFlow 0 99) 97)))) anon191_correct)))))))
(let ((anon359_Then_correct  (=> b_1_1@65 (and (and (=> (= (ControlFlow 0 107) 99) anon190_correct) (=> (= (ControlFlow 0 107) 104) anon361_Then_correct)) (=> (= (ControlFlow 0 107) 106) anon361_Else_correct)))))
(let ((anon359_Else_correct  (=> (and (not b_1_1@65) (= (ControlFlow 0 102) 99)) anon190_correct)))
(let ((anon358_Then_correct  (=> (and b_1_1@65 b_10@13) (and (=> (= (ControlFlow 0 108) 107) anon359_Then_correct) (=> (= (ControlFlow 0 108) 102) anon359_Else_correct)))))
(let ((anon358_Else_correct  (=> (and (not (and b_1_1@65 b_10@13)) (= (ControlFlow 0 101) 99)) anon190_correct)))
(let ((anon184_correct  (=> (and (= b_13@0  (and b_1_1@64 b_10@13)) (= b_13@1  (and b_13@0 (state Result_8Heap Result_8Mask)))) (=> (and (and (= b_13@2  (and b_13@1 (sumMask Result_8Mask Ops_1Mask@31 Used_3Mask@8))) (= b_13@3  (and (and b_13@2 (IdenticalOnKnownLocations Ops_1Heap@9 Result_8Heap Ops_1Mask@31)) (IdenticalOnKnownLocations Used_3Heap@0 Result_8Heap Used_3Mask@8)))) (and (= b_13@4  (and b_13@3 (state Result_8Heap Result_8Mask))) (= b_1_1@65  (and b_1_1@64 b_13@4)))) (and (=> (= (ControlFlow 0 109) 108) anon358_Then_correct) (=> (= (ControlFlow 0 109) 101) anon358_Else_correct))))))
(let ((anon183_correct  (and (=> (= (ControlFlow 0 111) (- 0 112)) (=> (and b_1_1@61 b_10@12) (and (= neededTransfer@27 0.0) (= (U_2_real (MapType1Select Used_3Mask@7 null (Node_state arg_nxt@0))) initNeededTransfer@6)))) (=> (=> (and b_1_1@61 b_10@12) (and (= neededTransfer@27 0.0) (= (U_2_real (MapType1Select Used_3Mask@7 null (Node_state arg_nxt@0))) initNeededTransfer@6))) (=> (and (= b_12@0  (and b_1_1@61 b_10@12)) (= b_12@1  (and b_12@0 (state Result_7Heap Result_7Mask)))) (=> (and (and (= b_12@2  (and b_12@1 (sumMask Result_7Mask Ops_1Mask@30 Used_3Mask@7))) (= b_12@3  (and (and b_12@2 (IdenticalOnKnownLocations Ops_1Heap@9 Result_7Heap Ops_1Mask@30)) (IdenticalOnKnownLocations Used_3Heap@0 Result_7Heap Used_3Mask@7)))) (and (= b_12@4  (and b_12@3 (state Result_7Heap Result_7Mask))) (= b_1_1@62  (and b_1_1@61 b_12@4)))) (=> (and (and (and (= b_1_1@63  (and b_1_1@62 b_10@12)) (= Ops_1Mask@31 Ops_1Mask@30)) (and (= b_1_1@64 b_1_1@63) (= Used_3Mask@8 Used_3Mask@7))) (and (and (= Heap@39 Heap@38) (= Mask@42 Mask@41)) (and (= b_10@13 b_10@12) (= (ControlFlow 0 111) 109)))) anon184_correct)))))))
(let ((anon357_Else_correct  (=> (>= 0.0 takeTransfer@13) (=> (and (= neededTransfer@27 neededTransfer@25) (= b_10@12 b_10@9)) (=> (and (and (= Mask@41 Mask@39) (= Heap@38 Heap@36)) (and (= Used_3Mask@7 Used_3Mask@5) (= (ControlFlow 0 115) 111))) anon183_correct)))))
(let ((anon357_Then_correct  (=> (> takeTransfer@13 0.0) (=> (and (= neededTransfer@26 (- neededTransfer@25 takeTransfer@13)) (= Used_3Mask@6 (MapType1Store Used_3Mask@5 null (Node_state arg_nxt@0) (real_2_U (+ (U_2_real (MapType1Select Used_3Mask@5 null (Node_state arg_nxt@0))) takeTransfer@13))))) (=> (and (and (= b_10@10  (and b_10@9 (state Used_3Heap@0 Used_3Mask@6))) (= TempMask@7 (MapType1Store ZeroMask null (Node_state arg_nxt@0) (real_2_U FullPerm)))) (and (= b_10@11  (and b_10@10 (IdenticalOnKnownLocations Heap@36 Used_3Heap@0 TempMask@7))) (= Mask@40 (MapType1Store Mask@39 null (Node_state arg_nxt@0) (real_2_U (- (U_2_real (MapType1Select Mask@39 null (Node_state arg_nxt@0))) takeTransfer@13)))))) (=> (and (and (and (forall ((o_14 T@U) (f_18 T@U) ) (! (let ((B@@14 (FieldTypeInv1 (type f_18))))
(let ((A@@15 (FieldTypeInv0 (type f_18))))
 (=> (and (and (= (type o_14) RefType) (= (type f_18) (FieldType A@@15 B@@14))) (or (U_2_bool (MapType1Select (MapType0Select Heap@36 null (|wand_1#sm| freshObj@0 FullPerm l FullPerm)) o_14 f_18)) (U_2_bool (MapType1Select (MapType0Select Heap@36 null (|Node_state#sm| arg_nxt@0)) o_14 f_18)))) (U_2_bool (MapType1Select newPMask@6 o_14 f_18)))))
 :qid |stdinbpl.3504:47|
 :skolemid |103|
 :pattern ( (MapType1Select newPMask@6 o_14 f_18))
)) (= Heap@37 (MapType0Store Heap@36 null (|wand_1#sm| freshObj@0 FullPerm l FullPerm) newPMask@6))) (and (= neededTransfer@27 neededTransfer@26) (= b_10@12 b_10@11))) (and (and (= Mask@41 Mask@40) (= Heap@38 Heap@37)) (and (= Used_3Mask@7 Used_3Mask@6) (= (ControlFlow 0 114) 111)))) anon183_correct))))))
(let ((anon356_Else_correct  (=> (and (< maskTransfer@13 neededTransfer@25) (= takeTransfer@13 maskTransfer@13)) (and (=> (= (ControlFlow 0 117) 114) anon357_Then_correct) (=> (= (ControlFlow 0 117) 115) anon357_Else_correct)))))
(let ((anon356_Then_correct  (=> (and (<= neededTransfer@25 maskTransfer@13) (= takeTransfer@13 neededTransfer@25)) (and (=> (= (ControlFlow 0 116) 114) anon357_Then_correct) (=> (= (ControlFlow 0 116) 115) anon357_Else_correct)))))
(let ((anon355_Then_correct  (=> (and (and (and (and b_1_1@61 b_10@9) true) (> neededTransfer@25 0.0)) (= maskTransfer@13 (U_2_real (MapType1Select Mask@39 null (Node_state arg_nxt@0))))) (and (=> (= (ControlFlow 0 118) 116) anon356_Then_correct) (=> (= (ControlFlow 0 118) 117) anon356_Else_correct)))))
(let ((anon355_Else_correct  (=> (not (and (and (and b_1_1@61 b_10@9) true) (> neededTransfer@25 0.0))) (=> (and (= neededTransfer@27 neededTransfer@25) (= b_10@12 b_10@9)) (=> (and (and (= Mask@41 Mask@39) (= Heap@38 Heap@36)) (and (= Used_3Mask@7 Used_3Mask@5) (= (ControlFlow 0 113) 111))) anon183_correct)))))
(let ((anon354_Else_correct  (=> (>= 0.0 takeTransfer@12) (=> (and (and (= Used_3Mask@5 Used_3Mask@3) (= b_10@9 b_10@6)) (and (= neededTransfer@25 FullPerm) (= Ops_1Mask@30 Ops_1Mask@28))) (and (=> (= (ControlFlow 0 121) 118) anon355_Then_correct) (=> (= (ControlFlow 0 121) 113) anon355_Else_correct))))))
(let ((anon354_Then_correct  (=> (> takeTransfer@12 0.0) (=> (and (= neededTransfer@24 (- FullPerm takeTransfer@12)) (= Used_3Mask@4 (MapType1Store Used_3Mask@3 null (Node_state arg_nxt@0) (real_2_U (+ (U_2_real (MapType1Select Used_3Mask@3 null (Node_state arg_nxt@0))) takeTransfer@12))))) (=> (and (and (and (= b_10@7  (and b_10@6 (state Used_3Heap@0 Used_3Mask@4))) (= TempMask@6 (MapType1Store ZeroMask null (Node_state arg_nxt@0) (real_2_U FullPerm)))) (and (= b_10@8  (and b_10@7 (IdenticalOnKnownLocations Ops_1Heap@9 Used_3Heap@0 TempMask@6))) (= Ops_1Mask@29 (MapType1Store Ops_1Mask@28 null (Node_state arg_nxt@0) (real_2_U (- (U_2_real (MapType1Select Ops_1Mask@28 null (Node_state arg_nxt@0))) takeTransfer@12)))))) (and (and (= Used_3Mask@5 Used_3Mask@4) (= b_10@9 b_10@8)) (and (= neededTransfer@25 neededTransfer@24) (= Ops_1Mask@30 Ops_1Mask@29)))) (and (=> (= (ControlFlow 0 120) 118) anon355_Then_correct) (=> (= (ControlFlow 0 120) 113) anon355_Else_correct)))))))
(let ((anon353_Else_correct  (=> (and (< maskTransfer@12 FullPerm) (= takeTransfer@12 maskTransfer@12)) (and (=> (= (ControlFlow 0 123) 120) anon354_Then_correct) (=> (= (ControlFlow 0 123) 121) anon354_Else_correct)))))
(let ((anon353_Then_correct  (=> (and (<= FullPerm maskTransfer@12) (= takeTransfer@12 FullPerm)) (and (=> (= (ControlFlow 0 122) 120) anon354_Then_correct) (=> (= (ControlFlow 0 122) 121) anon354_Else_correct)))))
(let ((anon352_Then_correct  (=> (and (and (and (and b_1_1@61 b_10@6) true) (> FullPerm 0.0)) (= maskTransfer@12 (U_2_real (MapType1Select Ops_1Mask@28 null (Node_state arg_nxt@0))))) (and (=> (= (ControlFlow 0 124) 122) anon353_Then_correct) (=> (= (ControlFlow 0 124) 123) anon353_Else_correct)))))
(let ((anon352_Else_correct  (=> (not (and (and (and b_1_1@61 b_10@6) true) (> FullPerm 0.0))) (=> (and (and (= Used_3Mask@5 Used_3Mask@3) (= b_10@9 b_10@6)) (and (= neededTransfer@25 FullPerm) (= Ops_1Mask@30 Ops_1Mask@28))) (and (=> (= (ControlFlow 0 119) 118) anon355_Then_correct) (=> (= (ControlFlow 0 119) 113) anon355_Else_correct))))))
(let ((anon351_Then_correct  (=> (and (=> b_1_1@61 (not (= arg_nxt@0 null))) (= initNeededTransfer@6 (+ (U_2_real (MapType1Select Used_3Mask@3 null (Node_state arg_nxt@0))) FullPerm))) (and (=> (= (ControlFlow 0 125) (- 0 126)) (>= FullPerm 0.0)) (=> (>= FullPerm 0.0) (and (=> (= (ControlFlow 0 125) 124) anon352_Then_correct) (=> (= (ControlFlow 0 125) 119) anon352_Else_correct)))))))
(let ((anon351_Else_correct  (=> (and (and (and (not (=> b_1_1@61 (not (= arg_nxt@0 null)))) (= Ops_1Mask@31 Ops_1Mask@28)) (and (= b_1_1@64 b_1_1@61) (= Used_3Mask@8 Used_3Mask@3))) (and (and (= Heap@39 Heap@36) (= Mask@42 Mask@39)) (and (= b_10@13 b_10@6) (= (ControlFlow 0 110) 109)))) anon184_correct)))
(let ((anon170_correct  (and (=> (= (ControlFlow 0 127) (- 0 128)) (=> (and b_1_1@60 b_10@6) (= (Node_rev_next Result_6Heap arg_this@0) arg_nxt@0))) (=> (=> (and b_1_1@60 b_10@6) (= (Node_rev_next Result_6Heap arg_this@0) arg_nxt@0)) (=> (= b_1_1@61  (and b_1_1@60 b_10@6)) (and (=> (= (ControlFlow 0 127) 125) anon351_Then_correct) (=> (= (ControlFlow 0 127) 110) anon351_Else_correct)))))))
(let ((anon348_Then_correct  (=> b_1_1@60 (and (and (=> (= (ControlFlow 0 135) 127) anon170_correct) (=> (= (ControlFlow 0 135) 132) anon350_Then_correct)) (=> (= (ControlFlow 0 135) 134) anon350_Else_correct)))))
(let ((anon348_Else_correct  (=> (and (not b_1_1@60) (= (ControlFlow 0 130) 127)) anon170_correct)))
(let ((anon347_Then_correct  (=> (and b_1_1@60 b_10@6) (and (=> (= (ControlFlow 0 136) 135) anon348_Then_correct) (=> (= (ControlFlow 0 136) 130) anon348_Else_correct)))))
(let ((anon347_Else_correct  (=> (and (not (and b_1_1@60 b_10@6)) (= (ControlFlow 0 129) 127)) anon170_correct)))
(let ((anon164_correct  (and (=> (= (ControlFlow 0 137) (- 0 138)) (=> (and b_1_1@58 b_10@6) (and (= neededTransfer@23 0.0) (= (U_2_real (MapType1Select Used_3Mask@3 null (Node_reverse arg_this@0))) initNeededTransfer@5)))) (=> (=> (and b_1_1@58 b_10@6) (and (= neededTransfer@23 0.0) (= (U_2_real (MapType1Select Used_3Mask@3 null (Node_reverse arg_this@0))) initNeededTransfer@5))) (=> (= b_11@0  (and b_1_1@58 b_10@6)) (=> (and (= b_11@1  (and b_11@0 (state Result_6Heap Result_6Mask))) (= b_11@2  (and b_11@1 (sumMask Result_6Mask Ops_1Mask@28 Used_3Mask@3)))) (=> (and (and (= b_11@3  (and (and b_11@2 (IdenticalOnKnownLocations Ops_1Heap@9 Result_6Heap Ops_1Mask@28)) (IdenticalOnKnownLocations Used_3Heap@0 Result_6Heap Used_3Mask@3))) (= b_11@4  (and b_11@3 (state Result_6Heap Result_6Mask)))) (and (= b_1_1@59  (and b_1_1@58 b_11@4)) (= b_1_1@60  (and b_1_1@59 b_10@6)))) (and (=> (= (ControlFlow 0 137) 136) anon347_Then_correct) (=> (= (ControlFlow 0 137) 129) anon347_Else_correct)))))))))
(let ((anon346_Else_correct  (=> (>= 0.0 takeTransfer@11) (=> (and (= Heap@36 Heap@34) (= Mask@39 Mask@37)) (=> (and (and (= neededTransfer@23 neededTransfer@21) (= b_10@6 b_10@3)) (and (= Used_3Mask@3 Used_3Mask@1) (= (ControlFlow 0 141) 137))) anon164_correct)))))
(let ((anon346_Then_correct  (=> (> takeTransfer@11 0.0) (=> (and (= neededTransfer@22 (- neededTransfer@21 takeTransfer@11)) (= Used_3Mask@2 (MapType1Store Used_3Mask@1 null (Node_reverse arg_this@0) (real_2_U (+ (U_2_real (MapType1Select Used_3Mask@1 null (Node_reverse arg_this@0))) takeTransfer@11))))) (=> (and (and (= b_10@4  (and b_10@3 (state Used_3Heap@0 Used_3Mask@2))) (= TempMask@5 (MapType1Store ZeroMask null (Node_reverse arg_this@0) (real_2_U FullPerm)))) (and (= b_10@5  (and b_10@4 (IdenticalOnKnownLocations Heap@34 Used_3Heap@0 TempMask@5))) (= Mask@38 (MapType1Store Mask@37 null (Node_reverse arg_this@0) (real_2_U (- (U_2_real (MapType1Select Mask@37 null (Node_reverse arg_this@0))) takeTransfer@11)))))) (=> (and (and (and (forall ((o_13 T@U) (f_17 T@U) ) (! (let ((B@@15 (FieldTypeInv1 (type f_17))))
(let ((A@@16 (FieldTypeInv0 (type f_17))))
 (=> (and (and (= (type o_13) RefType) (= (type f_17) (FieldType A@@16 B@@15))) (or (U_2_bool (MapType1Select (MapType0Select Heap@34 null (|wand_1#sm| freshObj@0 FullPerm l FullPerm)) o_13 f_17)) (U_2_bool (MapType1Select (MapType0Select Heap@34 null (|Node_reverse#sm| arg_this@0)) o_13 f_17)))) (U_2_bool (MapType1Select newPMask@5 o_13 f_17)))))
 :qid |stdinbpl.3411:45|
 :skolemid |102|
 :pattern ( (MapType1Select newPMask@5 o_13 f_17))
)) (= Heap@35 (MapType0Store Heap@34 null (|wand_1#sm| freshObj@0 FullPerm l FullPerm) newPMask@5))) (and (= Heap@36 Heap@35) (= Mask@39 Mask@38))) (and (and (= neededTransfer@23 neededTransfer@22) (= b_10@6 b_10@5)) (and (= Used_3Mask@3 Used_3Mask@2) (= (ControlFlow 0 140) 137)))) anon164_correct))))))
(let ((anon345_Else_correct  (=> (and (< maskTransfer@11 neededTransfer@21) (= takeTransfer@11 maskTransfer@11)) (and (=> (= (ControlFlow 0 143) 140) anon346_Then_correct) (=> (= (ControlFlow 0 143) 141) anon346_Else_correct)))))
(let ((anon345_Then_correct  (=> (and (<= neededTransfer@21 maskTransfer@11) (= takeTransfer@11 neededTransfer@21)) (and (=> (= (ControlFlow 0 142) 140) anon346_Then_correct) (=> (= (ControlFlow 0 142) 141) anon346_Else_correct)))))
(let ((anon344_Then_correct  (=> (and (and (and (and b_1_1@58 b_10@3) true) (> neededTransfer@21 0.0)) (= maskTransfer@11 (U_2_real (MapType1Select Mask@37 null (Node_reverse arg_this@0))))) (and (=> (= (ControlFlow 0 144) 142) anon345_Then_correct) (=> (= (ControlFlow 0 144) 143) anon345_Else_correct)))))
(let ((anon344_Else_correct  (=> (not (and (and (and b_1_1@58 b_10@3) true) (> neededTransfer@21 0.0))) (=> (and (= Heap@36 Heap@34) (= Mask@39 Mask@37)) (=> (and (and (= neededTransfer@23 neededTransfer@21) (= b_10@6 b_10@3)) (and (= Used_3Mask@3 Used_3Mask@1) (= (ControlFlow 0 139) 137))) anon164_correct)))))
(let ((anon343_Else_correct  (=> (>= 0.0 takeTransfer@10) (=> (and (and (= Ops_1Mask@28 Ops_1Mask@26) (= Used_3Mask@1 ZeroMask)) (and (= b_10@3 b_10@0) (= neededTransfer@21 FullPerm))) (and (=> (= (ControlFlow 0 147) 144) anon344_Then_correct) (=> (= (ControlFlow 0 147) 139) anon344_Else_correct))))))
(let ((anon343_Then_correct  (=> (> takeTransfer@10 0.0) (=> (and (= neededTransfer@20 (- FullPerm takeTransfer@10)) (= Used_3Mask@0 (MapType1Store ZeroMask null (Node_reverse arg_this@0) (real_2_U (+ (U_2_real (MapType1Select ZeroMask null (Node_reverse arg_this@0))) takeTransfer@10))))) (=> (and (and (and (= b_10@1  (and b_10@0 (state Used_3Heap@0 Used_3Mask@0))) (= TempMask@4 (MapType1Store ZeroMask null (Node_reverse arg_this@0) (real_2_U FullPerm)))) (and (= b_10@2  (and b_10@1 (IdenticalOnKnownLocations Ops_1Heap@9 Used_3Heap@0 TempMask@4))) (= Ops_1Mask@27 (MapType1Store Ops_1Mask@26 null (Node_reverse arg_this@0) (real_2_U (- (U_2_real (MapType1Select Ops_1Mask@26 null (Node_reverse arg_this@0))) takeTransfer@10)))))) (and (and (= Ops_1Mask@28 Ops_1Mask@27) (= Used_3Mask@1 Used_3Mask@0)) (and (= b_10@3 b_10@2) (= neededTransfer@21 neededTransfer@20)))) (and (=> (= (ControlFlow 0 146) 144) anon344_Then_correct) (=> (= (ControlFlow 0 146) 139) anon344_Else_correct)))))))
(let ((anon342_Else_correct  (=> (and (< maskTransfer@10 FullPerm) (= takeTransfer@10 maskTransfer@10)) (and (=> (= (ControlFlow 0 149) 146) anon343_Then_correct) (=> (= (ControlFlow 0 149) 147) anon343_Else_correct)))))
(let ((anon342_Then_correct  (=> (and (<= FullPerm maskTransfer@10) (= takeTransfer@10 FullPerm)) (and (=> (= (ControlFlow 0 148) 146) anon343_Then_correct) (=> (= (ControlFlow 0 148) 147) anon343_Else_correct)))))
(let ((anon341_Then_correct  (=> (and (and (and (and b_1_1@58 b_10@0) true) (> FullPerm 0.0)) (= maskTransfer@10 (U_2_real (MapType1Select Ops_1Mask@26 null (Node_reverse arg_this@0))))) (and (=> (= (ControlFlow 0 150) 148) anon342_Then_correct) (=> (= (ControlFlow 0 150) 149) anon342_Else_correct)))))
(let ((anon341_Else_correct  (=> (not (and (and (and b_1_1@58 b_10@0) true) (> FullPerm 0.0))) (=> (and (and (= Ops_1Mask@28 Ops_1Mask@26) (= Used_3Mask@1 ZeroMask)) (and (= b_10@3 b_10@0) (= neededTransfer@21 FullPerm))) (and (=> (= (ControlFlow 0 145) 144) anon344_Then_correct) (=> (= (ControlFlow 0 145) 139) anon344_Else_correct))))))
(let ((anon152_correct  (=> (and (and (= arg_this@0 (Node_get_prev Ops_1Heap@9 (MapType0Select Ops_1Heap@9 freshObj@0 Iterator_current))) (= arg_fst@0 (MapType0Select Ops_1Heap@9 (MapType0Select Ops_1Heap@9 freshObj@0 Iterator_iteratee) List_sentinel))) (and (= arg_nxt@0 (MapType0Select Ops_1Heap@9 freshObj@0 Iterator_current)) (= b_10@0  (and b_10 (state Used_3Heap@0 ZeroMask))))) (and (=> (= (ControlFlow 0 151) (- 0 153)) (=> (and b_1_1@57 b_10@0) (not (= arg_fst@0 null)))) (=> (=> (and b_1_1@57 b_10@0) (not (= arg_fst@0 null))) (=> (and (= b_1_1@58  (and b_1_1@57 b_10@0)) (= initNeededTransfer@5 (+ (U_2_real (MapType1Select ZeroMask null (Node_reverse arg_this@0))) FullPerm))) (and (=> (= (ControlFlow 0 151) (- 0 152)) (>= FullPerm 0.0)) (=> (>= FullPerm 0.0) (and (=> (= (ControlFlow 0 151) 150) anon341_Then_correct) (=> (= (ControlFlow 0 151) 145) anon341_Else_correct))))))))))
(let ((anon340_Else_correct  (=> (and (not b_1_1@57) (= (ControlFlow 0 156) 151)) anon152_correct)))
(let ((anon340_Then_correct  (=> b_1_1@57 (and (=> (= (ControlFlow 0 154) (- 0 155)) (HasDirectPerm Ops_1Mask@26 freshObj@0 Iterator_current)) (=> (HasDirectPerm Ops_1Mask@26 freshObj@0 Iterator_current) (=> (= (ControlFlow 0 154) 151) anon152_correct))))))
(let ((anon339_Else_correct  (=> (not b_1_1@57) (and (=> (= (ControlFlow 0 160) 154) anon340_Then_correct) (=> (= (ControlFlow 0 160) 156) anon340_Else_correct)))))
(let ((anon339_Then_correct  (=> b_1_1@57 (and (=> (= (ControlFlow 0 157) (- 0 159)) (HasDirectPerm Ops_1Mask@26 freshObj@0 Iterator_iteratee)) (=> (HasDirectPerm Ops_1Mask@26 freshObj@0 Iterator_iteratee) (and (=> (= (ControlFlow 0 157) (- 0 158)) (HasDirectPerm Ops_1Mask@26 (MapType0Select Ops_1Heap@9 freshObj@0 Iterator_iteratee) List_sentinel)) (=> (HasDirectPerm Ops_1Mask@26 (MapType0Select Ops_1Heap@9 freshObj@0 Iterator_iteratee) List_sentinel) (and (=> (= (ControlFlow 0 157) 154) anon340_Then_correct) (=> (= (ControlFlow 0 157) 156) anon340_Else_correct)))))))))
(let ((anon336_Then_correct  (=> b_1_1@57 (and (=> (= (ControlFlow 0 166) (- 0 167)) (HasDirectPerm Ops_1Mask@26 freshObj@0 Iterator_current)) (=> (HasDirectPerm Ops_1Mask@26 freshObj@0 Iterator_current) (and (and (and (=> (= (ControlFlow 0 166) 157) anon339_Then_correct) (=> (= (ControlFlow 0 166) 160) anon339_Else_correct)) (=> (= (ControlFlow 0 166) 163) anon338_Then_correct)) (=> (= (ControlFlow 0 166) 165) anon338_Else_correct)))))))
(let ((anon336_Else_correct  (=> (not b_1_1@57) (and (=> (= (ControlFlow 0 161) 157) anon339_Then_correct) (=> (= (ControlFlow 0 161) 160) anon339_Else_correct)))))
(let ((anon335_Then_correct  (=> (=> b_1_1@57 (not (= (Node_get_prev Ops_1Heap@9 (MapType0Select Ops_1Heap@9 freshObj@0 Iterator_current)) null))) (and (=> (= (ControlFlow 0 168) 166) anon336_Then_correct) (=> (= (ControlFlow 0 168) 161) anon336_Else_correct)))))
(let ((anon335_Else_correct  (=> (not (=> b_1_1@57 (not (= (Node_get_prev Ops_1Heap@9 (MapType0Select Ops_1Heap@9 freshObj@0 Iterator_current)) null)))) (=> (and (= Ops_1Heap@10 Ops_1Heap@9) (= Heap@40 Heap@34)) (=> (and (and (= Mask@43 Mask@37) (= b_1_1@71 b_1_1@57)) (and (= Ops_1Mask@33 Ops_1Mask@26) (= (ControlFlow 0 98) 97))) anon191_correct)))))
(let ((anon332_Then_correct  (=> b_1_1@57 (and (=> (= (ControlFlow 0 174) (- 0 175)) (HasDirectPerm Ops_1Mask@26 freshObj@0 Iterator_current)) (=> (HasDirectPerm Ops_1Mask@26 freshObj@0 Iterator_current) (and (and (and (=> (= (ControlFlow 0 174) 168) anon335_Then_correct) (=> (= (ControlFlow 0 174) 98) anon335_Else_correct)) (=> (= (ControlFlow 0 174) 171) anon334_Then_correct)) (=> (= (ControlFlow 0 174) 173) anon334_Else_correct)))))))
(let ((anon332_Else_correct  (=> (not b_1_1@57) (and (=> (= (ControlFlow 0 169) 168) anon335_Then_correct) (=> (= (ControlFlow 0 169) 98) anon335_Else_correct)))))
(let ((anon331_Then_correct  (=> b_1_1@57 (and (=> (= (ControlFlow 0 176) 174) anon332_Then_correct) (=> (= (ControlFlow 0 176) 169) anon332_Else_correct)))))
(let ((anon331_Else_correct  (=> (and (not b_1_1@57) (= Ops_1Mask@34 Ops_1Mask@26)) (=> (and (and (= b_1_1@73 b_1_1@57) (= Heap@41 Heap@34)) (and (= Mask@44 Mask@37) (= Ops_1Heap@11 Ops_1Heap@9))) (and (=> (= (ControlFlow 0 96) 94) anon362_Then_correct) (=> (= (ControlFlow 0 96) 70) anon362_Else_correct))))))
(let ((anon135_correct  (=> (state Ops_1Heap@8 Ops_1Mask@25) (=> (and (= b_1_1@56  (and b_1_1@55 (state Ops_1Heap@8 Ops_1Mask@25))) (= Ops_1Heap@9 Ops_1Heap@8)) (=> (and (and (= Ops_1Mask@26 Ops_1Mask@25) (= Mask@37 Mask@36)) (and (= Heap@34 Heap@33) (= b_1_1@57 b_1_1@56))) (and (=> (= (ControlFlow 0 178) 176) anon331_Then_correct) (=> (= (ControlFlow 0 178) 96) anon331_Else_correct)))))))
(let ((anon330_Else_correct  (=> (= (MapType0Select Ops_1Heap@6 (MapType0Select Ops_1Heap@6 freshObj@0 Iterator_current) Node_next) null) (=> (and (= Ops_1Heap@8 Ops_1Heap@6) (= (ControlFlow 0 180) 178)) anon135_correct))))
(let ((anon330_Then_correct  (=> (not (= (MapType0Select Ops_1Heap@6 (MapType0Select Ops_1Heap@6 freshObj@0 Iterator_current) Node_next) null)) (=> (and (and (forall ((o_12 T@U) (f_16 T@U) ) (! (let ((B@@16 (FieldTypeInv1 (type f_16))))
(let ((A@@17 (FieldTypeInv0 (type f_16))))
 (=> (and (and (= (type o_12) RefType) (= (type f_16) (FieldType A@@17 B@@16))) (or (U_2_bool (MapType1Select (MapType0Select Ops_1Heap@6 null (|Node_state#sm| (MapType0Select Ops_1Heap@6 freshObj@0 Iterator_current))) o_12 f_16)) (U_2_bool (MapType1Select (MapType0Select Ops_1Heap@6 null (|Node_state#sm| (MapType0Select Ops_1Heap@6 (MapType0Select Ops_1Heap@6 freshObj@0 Iterator_current) Node_next))) o_12 f_16)))) (U_2_bool (MapType1Select newPMask@4 o_12 f_16)))))
 :qid |stdinbpl.3272:33|
 :skolemid |101|
 :pattern ( (MapType1Select newPMask@4 o_12 f_16))
)) (= Ops_1Heap@7 (MapType0Store Ops_1Heap@6 null (|Node_state#sm| (MapType0Select Ops_1Heap@6 freshObj@0 Iterator_current)) newPMask@4))) (and (= Ops_1Heap@8 Ops_1Heap@7) (= (ControlFlow 0 179) 178))) anon135_correct))))
(let ((anon133_correct  (=> (= Ops_1Heap@4 (MapType0Store Ops_1Heap@3 null (|Node_state#sm| (MapType0Select Ops_1Heap@3 freshObj@0 Iterator_current)) (MapType1Store (MapType0Select Ops_1Heap@3 null (|Node_state#sm| (MapType0Select Ops_1Heap@3 freshObj@0 Iterator_current))) (MapType0Select Ops_1Heap@3 freshObj@0 Iterator_current) Node_val (bool_2_U true)))) (=> (and (= Ops_1Heap@5 (MapType0Store Ops_1Heap@4 null (|Node_state#sm| (MapType0Select Ops_1Heap@4 freshObj@0 Iterator_current)) (MapType1Store (MapType0Select Ops_1Heap@4 null (|Node_state#sm| (MapType0Select Ops_1Heap@4 freshObj@0 Iterator_current))) (MapType0Select Ops_1Heap@4 freshObj@0 Iterator_current) Node_prev (bool_2_U true)))) (= Ops_1Heap@6 (MapType0Store Ops_1Heap@5 null (|Node_state#sm| (MapType0Select Ops_1Heap@5 freshObj@0 Iterator_current)) (MapType1Store (MapType0Select Ops_1Heap@5 null (|Node_state#sm| (MapType0Select Ops_1Heap@5 freshObj@0 Iterator_current))) (MapType0Select Ops_1Heap@5 freshObj@0 Iterator_current) Node_next (bool_2_U true))))) (and (=> (= (ControlFlow 0 181) 179) anon330_Then_correct) (=> (= (ControlFlow 0 181) 180) anon330_Else_correct))))))
(let ((anon329_Else_correct  (=> (HasDirectPerm Ops_1Mask@25 null (Node_state (MapType0Select Ops_1Heap@0 freshObj@0 Iterator_current))) (=> (and (= Ops_1Heap@3 Ops_1Heap@0) (= (ControlFlow 0 183) 181)) anon133_correct))))
(let ((anon329_Then_correct  (=> (not (HasDirectPerm Ops_1Mask@25 null (Node_state (MapType0Select Ops_1Heap@0 freshObj@0 Iterator_current)))) (=> (and (and (= Ops_1Heap@1 (MapType0Store Ops_1Heap@0 null (|Node_state#sm| (MapType0Select Ops_1Heap@0 freshObj@0 Iterator_current)) ZeroPMask)) (= Ops_1Heap@2 (MapType0Store Ops_1Heap@1 null (Node_state (MapType0Select Ops_1Heap@1 freshObj@0 Iterator_current)) freshVersion@1))) (and (= Ops_1Heap@3 Ops_1Heap@2) (= (ControlFlow 0 182) 181))) anon133_correct))))
(let ((anon131_correct  (=> (= b_9@0  (and b_1_1@52 b_4@25)) (=> (and (= b_9@1  (and b_9@0 (state Result_5Heap Result_5Mask))) (= b_9@2  (and b_9@1 (sumMask Result_5Mask Ops_1Mask@24 Used_2Mask@16)))) (=> (and (and (and (= b_9@3  (and (and b_9@2 (IdenticalOnKnownLocations Ops_1Heap@0 Result_5Heap Ops_1Mask@24)) (IdenticalOnKnownLocations Used_2Heap@0 Result_5Heap Used_2Mask@16))) (= b_9@4  (and b_9@3 (state Result_5Heap Result_5Mask)))) (and (= b_1_1@53  (and b_1_1@52 b_9@4)) (= Ops_1Mask@25 (MapType1Store Ops_1Mask@24 null (Node_state (MapType0Select Ops_1Heap@0 freshObj@0 Iterator_current)) (real_2_U (+ (U_2_real (MapType1Select Ops_1Mask@24 null (Node_state (MapType0Select Ops_1Heap@0 freshObj@0 Iterator_current)))) FullPerm)))))) (and (and (= b_1_1@54  (and b_1_1@53 (state Ops_1Heap@0 Ops_1Mask@25))) (= b_1_1@55  (and b_1_1@54 (state Ops_1Heap@0 Ops_1Mask@25)))) (and (|Node_state#trigger| Ops_1Heap@0 (Node_state (MapType0Select Ops_1Heap@0 freshObj@0 Iterator_current))) (= (MapType0Select Ops_1Heap@0 null (Node_state (MapType0Select Ops_1Heap@0 freshObj@0 Iterator_current))) (CombineFrames (FrameFragment (MapType0Select Ops_1Heap@0 (MapType0Select Result_5Heap freshObj@0 Iterator_current) Node_val)) (CombineFrames (FrameFragment (MapType0Select Ops_1Heap@0 (MapType0Select Result_5Heap freshObj@0 Iterator_current) Node_prev)) (CombineFrames (FrameFragment (MapType0Select Ops_1Heap@0 (MapType0Select Result_5Heap freshObj@0 Iterator_current) Node_next)) (FrameFragment (ite (not (= (MapType0Select Ops_1Heap@0 (MapType0Select Result_5Heap freshObj@0 Iterator_current) Node_next) null)) (MapType0Select Ops_1Heap@0 null (Node_state (MapType0Select Ops_1Heap@0 (MapType0Select Result_5Heap freshObj@0 Iterator_current) Node_next))) EmptyFrame))))))))) (and (=> (= (ControlFlow 0 184) 182) anon329_Then_correct) (=> (= (ControlFlow 0 184) 183) anon329_Else_correct)))))))
(let ((anon130_correct  (and (=> (= (ControlFlow 0 186) (- 0 187)) (=> (and b_1_1@48 b_4@24) (and (= neededTransfer@19 0.0) (= (U_2_real (MapType1Select Used_2Mask@15 null (Node_state arg_1@0))) initNeededTransfer@4)))) (=> (=> (and b_1_1@48 b_4@24) (and (= neededTransfer@19 0.0) (= (U_2_real (MapType1Select Used_2Mask@15 null (Node_state arg_1@0))) initNeededTransfer@4))) (=> (= b_8@0  (and b_1_1@48 b_4@24)) (=> (and (= b_8@1  (and b_8@0 (state Result_4Heap Result_4Mask))) (= b_8@2  (and b_8@1 (sumMask Result_4Mask Ops_1Mask@23 Used_2Mask@15)))) (=> (and (and (= b_8@3  (and (and b_8@2 (IdenticalOnKnownLocations Ops_1Heap@0 Result_4Heap Ops_1Mask@23)) (IdenticalOnKnownLocations Used_2Heap@0 Result_4Heap Used_2Mask@15))) (= b_8@4  (and b_8@3 (state Result_4Heap Result_4Mask)))) (and (= b_1_1@49  (and b_1_1@48 b_8@4)) (= b_1_1@50  (and b_1_1@49 b_4@24)))) (=> (and (and (and (= b_1_1@51  (and b_1_1@50 (= Used_2Heap@0 Ops_1Heap@0))) (= b_1_1@52 b_1_1@51)) (and (= Used_2Mask@16 Used_2Mask@15) (= b_4@25 b_4@24))) (and (and (= Ops_1Mask@24 Ops_1Mask@23) (= Mask@36 Mask@35)) (and (= Heap@33 Heap@32) (= (ControlFlow 0 186) 184)))) anon131_correct))))))))
(let ((anon328_Else_correct  (=> (>= 0.0 takeTransfer@9) (=> (and (= Heap@32 Heap@30) (= Mask@35 Mask@33)) (=> (and (and (= neededTransfer@19 neededTransfer@17) (= b_4@24 b_4@21)) (and (= Used_2Mask@15 Used_2Mask@13) (= (ControlFlow 0 190) 186))) anon130_correct)))))
(let ((anon328_Then_correct  (=> (> takeTransfer@9 0.0) (=> (and (= neededTransfer@18 (- neededTransfer@17 takeTransfer@9)) (= Used_2Mask@14 (MapType1Store Used_2Mask@13 null (Node_state arg_1@0) (real_2_U (+ (U_2_real (MapType1Select Used_2Mask@13 null (Node_state arg_1@0))) takeTransfer@9))))) (=> (and (and (= b_4@22  (and b_4@21 (state Used_2Heap@0 Used_2Mask@14))) (= TempMask@3 (MapType1Store ZeroMask null (Node_state arg_1@0) (real_2_U FullPerm)))) (and (= b_4@23  (and b_4@22 (IdenticalOnKnownLocations Heap@30 Used_2Heap@0 TempMask@3))) (= Mask@34 (MapType1Store Mask@33 null (Node_state arg_1@0) (real_2_U (- (U_2_real (MapType1Select Mask@33 null (Node_state arg_1@0))) takeTransfer@9)))))) (=> (and (and (and (forall ((o_11 T@U) (f_15 T@U) ) (! (let ((B@@17 (FieldTypeInv1 (type f_15))))
(let ((A@@18 (FieldTypeInv0 (type f_15))))
 (=> (and (and (= (type o_11) RefType) (= (type f_15) (FieldType A@@18 B@@17))) (or (U_2_bool (MapType1Select (MapType0Select Heap@30 null (|wand_1#sm| freshObj@0 FullPerm l FullPerm)) o_11 f_15)) (U_2_bool (MapType1Select (MapType0Select Heap@30 null (|Node_state#sm| (MapType0Select Heap@30 (MapType0Select Heap@30 freshObj@0 Iterator_current) Node_next))) o_11 f_15)))) (U_2_bool (MapType1Select newPMask@3 o_11 f_15)))))
 :qid |stdinbpl.3227:41|
 :skolemid |100|
 :pattern ( (MapType1Select newPMask@3 o_11 f_15))
)) (= Heap@31 (MapType0Store Heap@30 null (|wand_1#sm| freshObj@0 FullPerm l FullPerm) newPMask@3))) (and (= Heap@32 Heap@31) (= Mask@35 Mask@34))) (and (and (= neededTransfer@19 neededTransfer@18) (= b_4@24 b_4@23)) (and (= Used_2Mask@15 Used_2Mask@14) (= (ControlFlow 0 189) 186)))) anon130_correct))))))
(let ((anon327_Else_correct  (=> (and (< maskTransfer@9 neededTransfer@17) (= takeTransfer@9 maskTransfer@9)) (and (=> (= (ControlFlow 0 192) 189) anon328_Then_correct) (=> (= (ControlFlow 0 192) 190) anon328_Else_correct)))))
(let ((anon327_Then_correct  (=> (and (<= neededTransfer@17 maskTransfer@9) (= takeTransfer@9 neededTransfer@17)) (and (=> (= (ControlFlow 0 191) 189) anon328_Then_correct) (=> (= (ControlFlow 0 191) 190) anon328_Else_correct)))))
(let ((anon326_Then_correct  (=> (and (and (and (and b_1_1@48 b_4@21) true) (> neededTransfer@17 0.0)) (= maskTransfer@9 (U_2_real (MapType1Select Mask@33 null (Node_state arg_1@0))))) (and (=> (= (ControlFlow 0 193) 191) anon327_Then_correct) (=> (= (ControlFlow 0 193) 192) anon327_Else_correct)))))
(let ((anon326_Else_correct  (=> (not (and (and (and b_1_1@48 b_4@21) true) (> neededTransfer@17 0.0))) (=> (and (= Heap@32 Heap@30) (= Mask@35 Mask@33)) (=> (and (and (= neededTransfer@19 neededTransfer@17) (= b_4@24 b_4@21)) (and (= Used_2Mask@15 Used_2Mask@13) (= (ControlFlow 0 188) 186))) anon130_correct)))))
(let ((anon325_Else_correct  (=> (>= 0.0 takeTransfer@8) (=> (and (and (= Used_2Mask@13 Used_2Mask@11) (= b_4@21 b_4@18)) (and (= neededTransfer@17 FullPerm) (= Ops_1Mask@23 Ops_1Mask@21))) (and (=> (= (ControlFlow 0 196) 193) anon326_Then_correct) (=> (= (ControlFlow 0 196) 188) anon326_Else_correct))))))
(let ((anon325_Then_correct  (=> (> takeTransfer@8 0.0) (=> (and (= neededTransfer@16 (- FullPerm takeTransfer@8)) (= Used_2Mask@12 (MapType1Store Used_2Mask@11 null (Node_state arg_1@0) (real_2_U (+ (U_2_real (MapType1Select Used_2Mask@11 null (Node_state arg_1@0))) takeTransfer@8))))) (=> (and (and (and (= b_4@19  (and b_4@18 (state Used_2Heap@0 Used_2Mask@12))) (= TempMask@2 (MapType1Store ZeroMask null (Node_state arg_1@0) (real_2_U FullPerm)))) (and (= b_4@20  (and b_4@19 (IdenticalOnKnownLocations Ops_1Heap@0 Used_2Heap@0 TempMask@2))) (= Ops_1Mask@22 (MapType1Store Ops_1Mask@21 null (Node_state arg_1@0) (real_2_U (- (U_2_real (MapType1Select Ops_1Mask@21 null (Node_state arg_1@0))) takeTransfer@8)))))) (and (and (= Used_2Mask@13 Used_2Mask@12) (= b_4@21 b_4@20)) (and (= neededTransfer@17 neededTransfer@16) (= Ops_1Mask@23 Ops_1Mask@22)))) (and (=> (= (ControlFlow 0 195) 193) anon326_Then_correct) (=> (= (ControlFlow 0 195) 188) anon326_Else_correct)))))))
(let ((anon324_Else_correct  (=> (and (< maskTransfer@8 FullPerm) (= takeTransfer@8 maskTransfer@8)) (and (=> (= (ControlFlow 0 198) 195) anon325_Then_correct) (=> (= (ControlFlow 0 198) 196) anon325_Else_correct)))))
(let ((anon324_Then_correct  (=> (and (<= FullPerm maskTransfer@8) (= takeTransfer@8 FullPerm)) (and (=> (= (ControlFlow 0 197) 195) anon325_Then_correct) (=> (= (ControlFlow 0 197) 196) anon325_Else_correct)))))
(let ((anon323_Then_correct  (=> (and (and (and (and b_1_1@48 b_4@18) true) (> FullPerm 0.0)) (= maskTransfer@8 (U_2_real (MapType1Select Ops_1Mask@21 null (Node_state arg_1@0))))) (and (=> (= (ControlFlow 0 199) 197) anon324_Then_correct) (=> (= (ControlFlow 0 199) 198) anon324_Else_correct)))))
(let ((anon323_Else_correct  (=> (not (and (and (and b_1_1@48 b_4@18) true) (> FullPerm 0.0))) (=> (and (and (= Used_2Mask@13 Used_2Mask@11) (= b_4@21 b_4@18)) (and (= neededTransfer@17 FullPerm) (= Ops_1Mask@23 Ops_1Mask@21))) (and (=> (= (ControlFlow 0 194) 193) anon326_Then_correct) (=> (= (ControlFlow 0 194) 188) anon326_Else_correct))))))
(let ((anon118_correct  (=> (and (= arg_1@0 (MapType0Select Result_3Heap (MapType0Select Result_3Heap freshObj@0 Iterator_current) Node_next)) (= initNeededTransfer@4 (+ (U_2_real (MapType1Select Used_2Mask@11 null (Node_state arg_1@0))) FullPerm))) (and (=> (= (ControlFlow 0 200) (- 0 201)) (>= FullPerm 0.0)) (=> (>= FullPerm 0.0) (and (=> (= (ControlFlow 0 200) 199) anon323_Then_correct) (=> (= (ControlFlow 0 200) 194) anon323_Else_correct)))))))
(let ((anon322_Else_correct  (=> (and (not b_1_1@48) (= (ControlFlow 0 206) 200)) anon118_correct)))
(let ((anon322_Then_correct  (=> b_1_1@48 (and (=> (= (ControlFlow 0 203) (- 0 205)) (HasDirectPerm Result_3Mask freshObj@0 Iterator_current)) (=> (HasDirectPerm Result_3Mask freshObj@0 Iterator_current) (and (=> (= (ControlFlow 0 203) (- 0 204)) (HasDirectPerm Result_3Mask (MapType0Select Result_3Heap freshObj@0 Iterator_current) Node_next)) (=> (HasDirectPerm Result_3Mask (MapType0Select Result_3Heap freshObj@0 Iterator_current) Node_next) (=> (= (ControlFlow 0 203) 200) anon118_correct))))))))
(let ((anon321_Then_correct  (=> (and b_1_1@48 b_4@18) (and (=> (= (ControlFlow 0 207) 203) anon322_Then_correct) (=> (= (ControlFlow 0 207) 206) anon322_Else_correct)))))
(let ((anon321_Else_correct  (=> (and (not (and b_1_1@48 b_4@18)) (= (ControlFlow 0 202) 200)) anon118_correct)))
(let ((anon320_Then_correct  (=> (=> b_1_1@48 (not (= (MapType0Select Result_3Heap (MapType0Select Result_3Heap freshObj@0 Iterator_current) Node_next) null))) (and (=> (= (ControlFlow 0 208) 207) anon321_Then_correct) (=> (= (ControlFlow 0 208) 202) anon321_Else_correct)))))
(let ((anon320_Else_correct  (=> (and (and (and (not (=> b_1_1@48 (not (= (MapType0Select Result_3Heap (MapType0Select Result_3Heap freshObj@0 Iterator_current) Node_next) null)))) (= b_1_1@52 b_1_1@48)) (and (= Used_2Mask@16 Used_2Mask@11) (= b_4@25 b_4@18))) (and (and (= Ops_1Mask@24 Ops_1Mask@21) (= Mask@36 Mask@33)) (and (= Heap@33 Heap@30) (= (ControlFlow 0 185) 184)))) anon131_correct)))
(let ((anon114_correct  (and (=> (= (ControlFlow 0 209) (- 0 210)) (=> (and b_1_1@45 b_4@18) (and (= neededTransfer@15 0.0) (= (U_2_real (MapType1Select Used_2Mask@11 rcvLocal@2 Node_next)) initNeededTransfer@3)))) (=> (=> (and b_1_1@45 b_4@18) (and (= neededTransfer@15 0.0) (= (U_2_real (MapType1Select Used_2Mask@11 rcvLocal@2 Node_next)) initNeededTransfer@3))) (=> (and (and (and (= b_7@0  (and b_1_1@45 b_4@18)) (= b_7@1  (and b_7@0 (state Result_3Heap Result_3Mask)))) (and (= b_7@2  (and b_7@1 (sumMask Result_3Mask Ops_1Mask@21 Used_2Mask@11))) (= b_7@3  (and (and b_7@2 (IdenticalOnKnownLocations Ops_1Heap@0 Result_3Heap Ops_1Mask@21)) (IdenticalOnKnownLocations Used_2Heap@0 Result_3Heap Used_2Mask@11))))) (and (and (= b_7@4  (and b_7@3 (state Result_3Heap Result_3Mask))) (= b_1_1@46  (and b_1_1@45 b_7@4))) (and (= b_1_1@47  (and b_1_1@46 b_4@18)) (= b_1_1@48  (and b_1_1@47 (= Used_2Heap@0 Ops_1Heap@0)))))) (and (=> (= (ControlFlow 0 209) 208) anon320_Then_correct) (=> (= (ControlFlow 0 209) 185) anon320_Else_correct)))))))
(let ((anon319_Else_correct  (=> (>= 0.0 takeTransfer@7) (=> (and (= neededTransfer@15 neededTransfer@13) (= b_4@18 b_4@15)) (=> (and (and (= Used_2Mask@11 Used_2Mask@9) (= Mask@33 Mask@31)) (and (= Heap@30 Heap@28) (= (ControlFlow 0 213) 209))) anon114_correct)))))
(let ((anon319_Then_correct  (=> (> takeTransfer@7 0.0) (=> (and (and (= neededTransfer@14 (- neededTransfer@13 takeTransfer@7)) (= Used_2Mask@10 (MapType1Store Used_2Mask@9 rcvLocal@2 Node_next (real_2_U (+ (U_2_real (MapType1Select Used_2Mask@9 rcvLocal@2 Node_next)) takeTransfer@7))))) (and (= b_4@16  (and b_4@15 (state Used_2Heap@0 Used_2Mask@10))) (= b_4@17  (and b_4@16 (= (MapType0Select Heap@28 rcvLocal@2 Node_next) (MapType0Select Used_2Heap@0 rcvLocal@2 Node_next)))))) (=> (and (and (and (= Mask@32 (MapType1Store Mask@31 rcvLocal@2 Node_next (real_2_U (- (U_2_real (MapType1Select Mask@31 rcvLocal@2 Node_next)) takeTransfer@7)))) (= Heap@29 (MapType0Store Heap@28 null (|wand_1#sm| freshObj@0 FullPerm l FullPerm) (MapType1Store (MapType0Select Heap@28 null (|wand_1#sm| freshObj@0 FullPerm l FullPerm)) (MapType0Select Heap@28 freshObj@0 Iterator_current) Node_next (bool_2_U true))))) (and (= neededTransfer@15 neededTransfer@14) (= b_4@18 b_4@17))) (and (and (= Used_2Mask@11 Used_2Mask@10) (= Mask@33 Mask@32)) (and (= Heap@30 Heap@29) (= (ControlFlow 0 212) 209)))) anon114_correct)))))
(let ((anon318_Else_correct  (=> (and (< maskTransfer@7 neededTransfer@13) (= takeTransfer@7 maskTransfer@7)) (and (=> (= (ControlFlow 0 215) 212) anon319_Then_correct) (=> (= (ControlFlow 0 215) 213) anon319_Else_correct)))))
(let ((anon318_Then_correct  (=> (and (<= neededTransfer@13 maskTransfer@7) (= takeTransfer@7 neededTransfer@13)) (and (=> (= (ControlFlow 0 214) 212) anon319_Then_correct) (=> (= (ControlFlow 0 214) 213) anon319_Else_correct)))))
(let ((anon317_Then_correct  (=> (and (and (and (and b_1_1@45 b_4@15) true) (> neededTransfer@13 0.0)) (= maskTransfer@7 (U_2_real (MapType1Select Mask@31 rcvLocal@2 Node_next)))) (and (=> (= (ControlFlow 0 216) 214) anon318_Then_correct) (=> (= (ControlFlow 0 216) 215) anon318_Else_correct)))))
(let ((anon317_Else_correct  (=> (not (and (and (and b_1_1@45 b_4@15) true) (> neededTransfer@13 0.0))) (=> (and (= neededTransfer@15 neededTransfer@13) (= b_4@18 b_4@15)) (=> (and (and (= Used_2Mask@11 Used_2Mask@9) (= Mask@33 Mask@31)) (and (= Heap@30 Heap@28) (= (ControlFlow 0 211) 209))) anon114_correct)))))
(let ((anon316_Else_correct  (=> (>= 0.0 takeTransfer@6) (=> (and (and (= Ops_1Mask@21 Ops_1Mask@19) (= Used_2Mask@9 Used_2Mask@7)) (and (= b_4@15 b_4@12) (= neededTransfer@13 FullPerm))) (and (=> (= (ControlFlow 0 219) 216) anon317_Then_correct) (=> (= (ControlFlow 0 219) 211) anon317_Else_correct))))))
(let ((anon316_Then_correct  (=> (and (> takeTransfer@6 0.0) (= neededTransfer@12 (- FullPerm takeTransfer@6))) (=> (and (and (and (= Used_2Mask@8 (MapType1Store Used_2Mask@7 rcvLocal@2 Node_next (real_2_U (+ (U_2_real (MapType1Select Used_2Mask@7 rcvLocal@2 Node_next)) takeTransfer@6)))) (= b_4@13  (and b_4@12 (state Used_2Heap@0 Used_2Mask@8)))) (and (= b_4@14  (and b_4@13 (= (MapType0Select Ops_1Heap@0 rcvLocal@2 Node_next) (MapType0Select Used_2Heap@0 rcvLocal@2 Node_next)))) (= Ops_1Mask@20 (MapType1Store Ops_1Mask@19 rcvLocal@2 Node_next (real_2_U (- (U_2_real (MapType1Select Ops_1Mask@19 rcvLocal@2 Node_next)) takeTransfer@6)))))) (and (and (= Ops_1Mask@21 Ops_1Mask@20) (= Used_2Mask@9 Used_2Mask@8)) (and (= b_4@15 b_4@14) (= neededTransfer@13 neededTransfer@12)))) (and (=> (= (ControlFlow 0 218) 216) anon317_Then_correct) (=> (= (ControlFlow 0 218) 211) anon317_Else_correct))))))
(let ((anon315_Else_correct  (=> (and (< maskTransfer@6 FullPerm) (= takeTransfer@6 maskTransfer@6)) (and (=> (= (ControlFlow 0 221) 218) anon316_Then_correct) (=> (= (ControlFlow 0 221) 219) anon316_Else_correct)))))
(let ((anon315_Then_correct  (=> (and (<= FullPerm maskTransfer@6) (= takeTransfer@6 FullPerm)) (and (=> (= (ControlFlow 0 220) 218) anon316_Then_correct) (=> (= (ControlFlow 0 220) 219) anon316_Else_correct)))))
(let ((anon314_Then_correct  (=> (and (and (and (and b_1_1@45 b_4@12) true) (> FullPerm 0.0)) (= maskTransfer@6 (U_2_real (MapType1Select Ops_1Mask@19 rcvLocal@2 Node_next)))) (and (=> (= (ControlFlow 0 222) 220) anon315_Then_correct) (=> (= (ControlFlow 0 222) 221) anon315_Else_correct)))))
(let ((anon314_Else_correct  (=> (not (and (and (and b_1_1@45 b_4@12) true) (> FullPerm 0.0))) (=> (and (and (= Ops_1Mask@21 Ops_1Mask@19) (= Used_2Mask@9 Used_2Mask@7)) (and (= b_4@15 b_4@12) (= neededTransfer@13 FullPerm))) (and (=> (= (ControlFlow 0 217) 216) anon317_Then_correct) (=> (= (ControlFlow 0 217) 211) anon317_Else_correct))))))
(let ((anon102_correct  (=> (and (= rcvLocal@2 (MapType0Select Result_2Heap freshObj@0 Iterator_current)) (= initNeededTransfer@3 (+ (U_2_real (MapType1Select Used_2Mask@7 rcvLocal@2 Node_next)) FullPerm))) (and (=> (= (ControlFlow 0 223) (- 0 224)) (>= FullPerm 0.0)) (=> (>= FullPerm 0.0) (and (=> (= (ControlFlow 0 223) 222) anon314_Then_correct) (=> (= (ControlFlow 0 223) 217) anon314_Else_correct)))))))
(let ((anon313_Else_correct  (=> (and (not b_1_1@45) (= (ControlFlow 0 228) 223)) anon102_correct)))
(let ((anon313_Then_correct  (=> b_1_1@45 (and (=> (= (ControlFlow 0 226) (- 0 227)) (HasDirectPerm Result_2Mask freshObj@0 Iterator_current)) (=> (HasDirectPerm Result_2Mask freshObj@0 Iterator_current) (=> (= (ControlFlow 0 226) 223) anon102_correct))))))
(let ((anon312_Then_correct  (=> (and b_1_1@45 b_4@12) (and (=> (= (ControlFlow 0 229) 226) anon313_Then_correct) (=> (= (ControlFlow 0 229) 228) anon313_Else_correct)))))
(let ((anon312_Else_correct  (=> (and (not (and b_1_1@45 b_4@12)) (= (ControlFlow 0 225) 223)) anon102_correct)))
(let ((anon99_correct  (and (=> (= (ControlFlow 0 230) (- 0 231)) (=> (and b_1_1@42 b_4@12) (and (= neededTransfer@11 0.0) (= (U_2_real (MapType1Select Used_2Mask@7 rcvLocal@1 Node_prev)) initNeededTransfer@2)))) (=> (=> (and b_1_1@42 b_4@12) (and (= neededTransfer@11 0.0) (= (U_2_real (MapType1Select Used_2Mask@7 rcvLocal@1 Node_prev)) initNeededTransfer@2))) (=> (and (and (and (= b_6@0  (and b_1_1@42 b_4@12)) (= b_6@1  (and b_6@0 (state Result_2Heap Result_2Mask)))) (and (= b_6@2  (and b_6@1 (sumMask Result_2Mask Ops_1Mask@19 Used_2Mask@7))) (= b_6@3  (and (and b_6@2 (IdenticalOnKnownLocations Ops_1Heap@0 Result_2Heap Ops_1Mask@19)) (IdenticalOnKnownLocations Used_2Heap@0 Result_2Heap Used_2Mask@7))))) (and (and (= b_6@4  (and b_6@3 (state Result_2Heap Result_2Mask))) (= b_1_1@43  (and b_1_1@42 b_6@4))) (and (= b_1_1@44  (and b_1_1@43 b_4@12)) (= b_1_1@45  (and b_1_1@44 (= Used_2Heap@0 Ops_1Heap@0)))))) (and (=> (= (ControlFlow 0 230) 229) anon312_Then_correct) (=> (= (ControlFlow 0 230) 225) anon312_Else_correct)))))))
(let ((anon311_Else_correct  (=> (>= 0.0 takeTransfer@5) (=> (and (= neededTransfer@11 neededTransfer@9) (= Heap@28 Heap@26)) (=> (and (and (= Mask@31 Mask@29) (= b_4@12 b_4@9)) (and (= Used_2Mask@7 Used_2Mask@5) (= (ControlFlow 0 234) 230))) anon99_correct)))))
(let ((anon311_Then_correct  (=> (> takeTransfer@5 0.0) (=> (and (and (= neededTransfer@10 (- neededTransfer@9 takeTransfer@5)) (= Used_2Mask@6 (MapType1Store Used_2Mask@5 rcvLocal@1 Node_prev (real_2_U (+ (U_2_real (MapType1Select Used_2Mask@5 rcvLocal@1 Node_prev)) takeTransfer@5))))) (and (= b_4@10  (and b_4@9 (state Used_2Heap@0 Used_2Mask@6))) (= b_4@11  (and b_4@10 (= (MapType0Select Heap@26 rcvLocal@1 Node_prev) (MapType0Select Used_2Heap@0 rcvLocal@1 Node_prev)))))) (=> (and (and (and (= Mask@30 (MapType1Store Mask@29 rcvLocal@1 Node_prev (real_2_U (- (U_2_real (MapType1Select Mask@29 rcvLocal@1 Node_prev)) takeTransfer@5)))) (= Heap@27 (MapType0Store Heap@26 null (|wand_1#sm| freshObj@0 FullPerm l FullPerm) (MapType1Store (MapType0Select Heap@26 null (|wand_1#sm| freshObj@0 FullPerm l FullPerm)) (MapType0Select Heap@26 freshObj@0 Iterator_current) Node_prev (bool_2_U true))))) (and (= neededTransfer@11 neededTransfer@10) (= Heap@28 Heap@27))) (and (and (= Mask@31 Mask@30) (= b_4@12 b_4@11)) (and (= Used_2Mask@7 Used_2Mask@6) (= (ControlFlow 0 233) 230)))) anon99_correct)))))
(let ((anon310_Else_correct  (=> (and (< maskTransfer@5 neededTransfer@9) (= takeTransfer@5 maskTransfer@5)) (and (=> (= (ControlFlow 0 236) 233) anon311_Then_correct) (=> (= (ControlFlow 0 236) 234) anon311_Else_correct)))))
(let ((anon310_Then_correct  (=> (and (<= neededTransfer@9 maskTransfer@5) (= takeTransfer@5 neededTransfer@9)) (and (=> (= (ControlFlow 0 235) 233) anon311_Then_correct) (=> (= (ControlFlow 0 235) 234) anon311_Else_correct)))))
(let ((anon309_Then_correct  (=> (and (and (and (and b_1_1@42 b_4@9) true) (> neededTransfer@9 0.0)) (= maskTransfer@5 (U_2_real (MapType1Select Mask@29 rcvLocal@1 Node_prev)))) (and (=> (= (ControlFlow 0 237) 235) anon310_Then_correct) (=> (= (ControlFlow 0 237) 236) anon310_Else_correct)))))
(let ((anon309_Else_correct  (=> (not (and (and (and b_1_1@42 b_4@9) true) (> neededTransfer@9 0.0))) (=> (and (= neededTransfer@11 neededTransfer@9) (= Heap@28 Heap@26)) (=> (and (and (= Mask@31 Mask@29) (= b_4@12 b_4@9)) (and (= Used_2Mask@7 Used_2Mask@5) (= (ControlFlow 0 232) 230))) anon99_correct)))))
(let ((anon308_Else_correct  (=> (>= 0.0 takeTransfer@4) (=> (and (and (= Used_2Mask@5 Used_2Mask@3) (= b_4@9 b_4@6)) (and (= neededTransfer@9 FullPerm) (= Ops_1Mask@19 Ops_1Mask@17))) (and (=> (= (ControlFlow 0 240) 237) anon309_Then_correct) (=> (= (ControlFlow 0 240) 232) anon309_Else_correct))))))
(let ((anon308_Then_correct  (=> (and (> takeTransfer@4 0.0) (= neededTransfer@8 (- FullPerm takeTransfer@4))) (=> (and (and (and (= Used_2Mask@4 (MapType1Store Used_2Mask@3 rcvLocal@1 Node_prev (real_2_U (+ (U_2_real (MapType1Select Used_2Mask@3 rcvLocal@1 Node_prev)) takeTransfer@4)))) (= b_4@7  (and b_4@6 (state Used_2Heap@0 Used_2Mask@4)))) (and (= b_4@8  (and b_4@7 (= (MapType0Select Ops_1Heap@0 rcvLocal@1 Node_prev) (MapType0Select Used_2Heap@0 rcvLocal@1 Node_prev)))) (= Ops_1Mask@18 (MapType1Store Ops_1Mask@17 rcvLocal@1 Node_prev (real_2_U (- (U_2_real (MapType1Select Ops_1Mask@17 rcvLocal@1 Node_prev)) takeTransfer@4)))))) (and (and (= Used_2Mask@5 Used_2Mask@4) (= b_4@9 b_4@8)) (and (= neededTransfer@9 neededTransfer@8) (= Ops_1Mask@19 Ops_1Mask@18)))) (and (=> (= (ControlFlow 0 239) 237) anon309_Then_correct) (=> (= (ControlFlow 0 239) 232) anon309_Else_correct))))))
(let ((anon307_Else_correct  (=> (and (< maskTransfer@4 FullPerm) (= takeTransfer@4 maskTransfer@4)) (and (=> (= (ControlFlow 0 242) 239) anon308_Then_correct) (=> (= (ControlFlow 0 242) 240) anon308_Else_correct)))))
(let ((anon307_Then_correct  (=> (and (<= FullPerm maskTransfer@4) (= takeTransfer@4 FullPerm)) (and (=> (= (ControlFlow 0 241) 239) anon308_Then_correct) (=> (= (ControlFlow 0 241) 240) anon308_Else_correct)))))
(let ((anon306_Then_correct  (=> (and (and (and (and b_1_1@42 b_4@6) true) (> FullPerm 0.0)) (= maskTransfer@4 (U_2_real (MapType1Select Ops_1Mask@17 rcvLocal@1 Node_prev)))) (and (=> (= (ControlFlow 0 243) 241) anon307_Then_correct) (=> (= (ControlFlow 0 243) 242) anon307_Else_correct)))))
(let ((anon306_Else_correct  (=> (not (and (and (and b_1_1@42 b_4@6) true) (> FullPerm 0.0))) (=> (and (and (= Used_2Mask@5 Used_2Mask@3) (= b_4@9 b_4@6)) (and (= neededTransfer@9 FullPerm) (= Ops_1Mask@19 Ops_1Mask@17))) (and (=> (= (ControlFlow 0 238) 237) anon309_Then_correct) (=> (= (ControlFlow 0 238) 232) anon309_Else_correct))))))
(let ((anon87_correct  (=> (and (= rcvLocal@1 (MapType0Select Result_1Heap freshObj@0 Iterator_current)) (= initNeededTransfer@2 (+ (U_2_real (MapType1Select Used_2Mask@3 rcvLocal@1 Node_prev)) FullPerm))) (and (=> (= (ControlFlow 0 244) (- 0 245)) (>= FullPerm 0.0)) (=> (>= FullPerm 0.0) (and (=> (= (ControlFlow 0 244) 243) anon306_Then_correct) (=> (= (ControlFlow 0 244) 238) anon306_Else_correct)))))))
(let ((anon305_Else_correct  (=> (and (not b_1_1@42) (= (ControlFlow 0 249) 244)) anon87_correct)))
(let ((anon305_Then_correct  (=> b_1_1@42 (and (=> (= (ControlFlow 0 247) (- 0 248)) (HasDirectPerm Result_1Mask freshObj@0 Iterator_current)) (=> (HasDirectPerm Result_1Mask freshObj@0 Iterator_current) (=> (= (ControlFlow 0 247) 244) anon87_correct))))))
(let ((anon304_Then_correct  (=> (and b_1_1@42 b_4@6) (and (=> (= (ControlFlow 0 250) 247) anon305_Then_correct) (=> (= (ControlFlow 0 250) 249) anon305_Else_correct)))))
(let ((anon304_Else_correct  (=> (and (not (and b_1_1@42 b_4@6)) (= (ControlFlow 0 246) 244)) anon87_correct)))
(let ((anon84_correct  (and (=> (= (ControlFlow 0 251) (- 0 252)) (=> (and b_1_1@39 b_4@6) (and (= neededTransfer@7 0.0) (= (U_2_real (MapType1Select Used_2Mask@3 rcvLocal@0 Node_val)) initNeededTransfer@1)))) (=> (=> (and b_1_1@39 b_4@6) (and (= neededTransfer@7 0.0) (= (U_2_real (MapType1Select Used_2Mask@3 rcvLocal@0 Node_val)) initNeededTransfer@1))) (=> (and (and (and (= b_5@0  (and b_1_1@39 b_4@6)) (= b_5@1  (and b_5@0 (state Result_1Heap Result_1Mask)))) (and (= b_5@2  (and b_5@1 (sumMask Result_1Mask Ops_1Mask@17 Used_2Mask@3))) (= b_5@3  (and (and b_5@2 (IdenticalOnKnownLocations Ops_1Heap@0 Result_1Heap Ops_1Mask@17)) (IdenticalOnKnownLocations Used_2Heap@0 Result_1Heap Used_2Mask@3))))) (and (and (= b_5@4  (and b_5@3 (state Result_1Heap Result_1Mask))) (= b_1_1@40  (and b_1_1@39 b_5@4))) (and (= b_1_1@41  (and b_1_1@40 b_4@6)) (= b_1_1@42  (and b_1_1@41 (= Used_2Heap@0 Ops_1Heap@0)))))) (and (=> (= (ControlFlow 0 251) 250) anon304_Then_correct) (=> (= (ControlFlow 0 251) 246) anon304_Else_correct)))))))
(let ((anon303_Else_correct  (=> (>= 0.0 takeTransfer@3) (=> (and (= neededTransfer@7 neededTransfer@5) (= Mask@29 Mask@27)) (=> (and (and (= Heap@26 Heap@24) (= b_4@6 b_4@3)) (and (= Used_2Mask@3 Used_2Mask@1) (= (ControlFlow 0 255) 251))) anon84_correct)))))
(let ((anon303_Then_correct  (=> (> takeTransfer@3 0.0) (=> (and (and (= neededTransfer@6 (- neededTransfer@5 takeTransfer@3)) (= Used_2Mask@2 (MapType1Store Used_2Mask@1 rcvLocal@0 Node_val (real_2_U (+ (U_2_real (MapType1Select Used_2Mask@1 rcvLocal@0 Node_val)) takeTransfer@3))))) (and (= b_4@4  (and b_4@3 (state Used_2Heap@0 Used_2Mask@2))) (= b_4@5  (and b_4@4 (= (U_2_int (MapType0Select Heap@24 rcvLocal@0 Node_val)) (U_2_int (MapType0Select Used_2Heap@0 rcvLocal@0 Node_val))))))) (=> (and (and (and (= Mask@28 (MapType1Store Mask@27 rcvLocal@0 Node_val (real_2_U (- (U_2_real (MapType1Select Mask@27 rcvLocal@0 Node_val)) takeTransfer@3)))) (= Heap@25 (MapType0Store Heap@24 null (|wand_1#sm| freshObj@0 FullPerm l FullPerm) (MapType1Store (MapType0Select Heap@24 null (|wand_1#sm| freshObj@0 FullPerm l FullPerm)) (MapType0Select Heap@24 freshObj@0 Iterator_current) Node_val (bool_2_U true))))) (and (= neededTransfer@7 neededTransfer@6) (= Mask@29 Mask@28))) (and (and (= Heap@26 Heap@25) (= b_4@6 b_4@5)) (and (= Used_2Mask@3 Used_2Mask@2) (= (ControlFlow 0 254) 251)))) anon84_correct)))))
(let ((anon302_Else_correct  (=> (and (< maskTransfer@3 neededTransfer@5) (= takeTransfer@3 maskTransfer@3)) (and (=> (= (ControlFlow 0 257) 254) anon303_Then_correct) (=> (= (ControlFlow 0 257) 255) anon303_Else_correct)))))
(let ((anon302_Then_correct  (=> (and (<= neededTransfer@5 maskTransfer@3) (= takeTransfer@3 neededTransfer@5)) (and (=> (= (ControlFlow 0 256) 254) anon303_Then_correct) (=> (= (ControlFlow 0 256) 255) anon303_Else_correct)))))
(let ((anon301_Then_correct  (=> (and (and (and (and b_1_1@39 b_4@3) true) (> neededTransfer@5 0.0)) (= maskTransfer@3 (U_2_real (MapType1Select Mask@27 rcvLocal@0 Node_val)))) (and (=> (= (ControlFlow 0 258) 256) anon302_Then_correct) (=> (= (ControlFlow 0 258) 257) anon302_Else_correct)))))
(let ((anon301_Else_correct  (=> (not (and (and (and b_1_1@39 b_4@3) true) (> neededTransfer@5 0.0))) (=> (and (= neededTransfer@7 neededTransfer@5) (= Mask@29 Mask@27)) (=> (and (and (= Heap@26 Heap@24) (= b_4@6 b_4@3)) (and (= Used_2Mask@3 Used_2Mask@1) (= (ControlFlow 0 253) 251))) anon84_correct)))))
(let ((anon300_Else_correct  (=> (>= 0.0 takeTransfer@2) (=> (and (and (= Ops_1Mask@17 Ops_1Mask@15) (= Used_2Mask@1 ZeroMask)) (and (= b_4@3 b_4@0) (= neededTransfer@5 FullPerm))) (and (=> (= (ControlFlow 0 261) 258) anon301_Then_correct) (=> (= (ControlFlow 0 261) 253) anon301_Else_correct))))))
(let ((anon300_Then_correct  (=> (and (> takeTransfer@2 0.0) (= neededTransfer@4 (- FullPerm takeTransfer@2))) (=> (and (and (and (= Used_2Mask@0 (MapType1Store ZeroMask rcvLocal@0 Node_val (real_2_U (+ (U_2_real (MapType1Select ZeroMask rcvLocal@0 Node_val)) takeTransfer@2)))) (= b_4@1  (and b_4@0 (state Used_2Heap@0 Used_2Mask@0)))) (and (= b_4@2  (and b_4@1 (= (U_2_int (MapType0Select Ops_1Heap@0 rcvLocal@0 Node_val)) (U_2_int (MapType0Select Used_2Heap@0 rcvLocal@0 Node_val))))) (= Ops_1Mask@16 (MapType1Store Ops_1Mask@15 rcvLocal@0 Node_val (real_2_U (- (U_2_real (MapType1Select Ops_1Mask@15 rcvLocal@0 Node_val)) takeTransfer@2)))))) (and (and (= Ops_1Mask@17 Ops_1Mask@16) (= Used_2Mask@1 Used_2Mask@0)) (and (= b_4@3 b_4@2) (= neededTransfer@5 neededTransfer@4)))) (and (=> (= (ControlFlow 0 260) 258) anon301_Then_correct) (=> (= (ControlFlow 0 260) 253) anon301_Else_correct))))))
(let ((anon299_Else_correct  (=> (and (< maskTransfer@2 FullPerm) (= takeTransfer@2 maskTransfer@2)) (and (=> (= (ControlFlow 0 263) 260) anon300_Then_correct) (=> (= (ControlFlow 0 263) 261) anon300_Else_correct)))))
(let ((anon299_Then_correct  (=> (and (<= FullPerm maskTransfer@2) (= takeTransfer@2 FullPerm)) (and (=> (= (ControlFlow 0 262) 260) anon300_Then_correct) (=> (= (ControlFlow 0 262) 261) anon300_Else_correct)))))
(let ((anon298_Then_correct  (=> (and (and (and (and b_1_1@39 b_4@0) true) (> FullPerm 0.0)) (= maskTransfer@2 (U_2_real (MapType1Select Ops_1Mask@15 rcvLocal@0 Node_val)))) (and (=> (= (ControlFlow 0 264) 262) anon299_Then_correct) (=> (= (ControlFlow 0 264) 263) anon299_Else_correct)))))
(let ((anon298_Else_correct  (=> (not (and (and (and b_1_1@39 b_4@0) true) (> FullPerm 0.0))) (=> (and (and (= Ops_1Mask@17 Ops_1Mask@15) (= Used_2Mask@1 ZeroMask)) (and (= b_4@3 b_4@0) (= neededTransfer@5 FullPerm))) (and (=> (= (ControlFlow 0 259) 258) anon301_Then_correct) (=> (= (ControlFlow 0 259) 253) anon301_Else_correct))))))
(let ((anon72_correct  (=> (and (= rcvLocal@0 (MapType0Select Ops_1Heap@0 freshObj@0 Iterator_current)) (= initNeededTransfer@1 (+ (U_2_real (MapType1Select ZeroMask rcvLocal@0 Node_val)) FullPerm))) (and (=> (= (ControlFlow 0 265) (- 0 266)) (>= FullPerm 0.0)) (=> (>= FullPerm 0.0) (and (=> (= (ControlFlow 0 265) 264) anon298_Then_correct) (=> (= (ControlFlow 0 265) 259) anon298_Else_correct)))))))
(let ((anon297_Else_correct  (=> (and (not b_1_1@39) (= (ControlFlow 0 270) 265)) anon72_correct)))
(let ((anon297_Then_correct  (=> b_1_1@39 (and (=> (= (ControlFlow 0 268) (- 0 269)) (HasDirectPerm Ops_1Mask@15 freshObj@0 Iterator_current)) (=> (HasDirectPerm Ops_1Mask@15 freshObj@0 Iterator_current) (=> (= (ControlFlow 0 268) 265) anon72_correct))))))
(let ((anon296_Then_correct  (=> (and b_1_1@39 b_4@0) (and (=> (= (ControlFlow 0 271) 268) anon297_Then_correct) (=> (= (ControlFlow 0 271) 270) anon297_Else_correct)))))
(let ((anon296_Else_correct  (=> (and (not (and b_1_1@39 b_4@0)) (= (ControlFlow 0 267) 265)) anon72_correct)))
(let ((anon69_correct  (=> (= b_4@0  (and b_4 (state Used_2Heap@0 ZeroMask))) (and (=> (= (ControlFlow 0 272) 271) anon296_Then_correct) (=> (= (ControlFlow 0 272) 267) anon296_Else_correct)))))
(let ((anon295_Else_correct  (=> (and (not b_1_1@39) (= (ControlFlow 0 275) 272)) anon69_correct)))
(let ((anon295_Then_correct  (=> b_1_1@39 (and (=> (= (ControlFlow 0 273) (- 0 274)) (HasDirectPerm Ops_1Mask@15 freshObj@0 Iterator_current)) (=> (HasDirectPerm Ops_1Mask@15 freshObj@0 Iterator_current) (=> (= (ControlFlow 0 273) 272) anon69_correct))))))
(let ((anon294_Then_correct  (=> b_1_1@39 (and (=> (= (ControlFlow 0 276) 273) anon295_Then_correct) (=> (= (ControlFlow 0 276) 275) anon295_Else_correct)))))
(let ((anon294_Else_correct  (=> (and (not b_1_1@39) (= Ops_1Heap@9 Ops_1Heap@0)) (=> (and (and (= Ops_1Mask@26 Ops_1Mask@15) (= Mask@37 Mask@27)) (and (= Heap@34 Heap@24) (= b_1_1@57 b_1_1@39))) (and (=> (= (ControlFlow 0 177) 176) anon331_Then_correct) (=> (= (ControlFlow 0 177) 96) anon331_Else_correct))))))
(let ((anon65_correct  (=> (and (= b_1_1@37  (and b_1_1@36 (state Ops_1Heap@0 Ops_1Mask@14))) (= b_1_1@38  (and b_1_1@37 (state Ops_1Heap@0 Ops_1Mask@14)))) (=> (and (and (= Heap@24 Heap@23) (= Mask@27 Mask@26)) (and (= b_1_1@39 b_1_1@38) (= Ops_1Mask@15 Ops_1Mask@14))) (and (=> (= (ControlFlow 0 278) 276) anon294_Then_correct) (=> (= (ControlFlow 0 278) 177) anon294_Else_correct))))))
(let ((anon293_Else_correct  (=> (and (and (= (MapType0Select Ops_1Heap@0 (MapType0Select Ops_1Heap@0 freshObj@0 Iterator_current) Node_next) null) (= Ops_1Mask@14 Ops_1Mask@12)) (and (= b_1_1@36 b_1_1@33) (= (ControlFlow 0 280) 278))) anon65_correct)))
(let ((anon293_Then_correct  (=> (not (= (MapType0Select Ops_1Heap@0 (MapType0Select Ops_1Heap@0 freshObj@0 Iterator_current) Node_next) null)) (=> (and (= Ops_1Mask@13 (MapType1Store Ops_1Mask@12 null (Node_state (MapType0Select Ops_1Heap@0 (MapType0Select Ops_1Heap@0 freshObj@0 Iterator_current) Node_next)) (real_2_U (+ (U_2_real (MapType1Select Ops_1Mask@12 null (Node_state (MapType0Select Ops_1Heap@0 (MapType0Select Ops_1Heap@0 freshObj@0 Iterator_current) Node_next)))) FullPerm)))) (= b_1_1@34  (and b_1_1@33 (InsidePredicate (Iterator_ready freshObj@0) (MapType0Select Ops_1Heap@0 null (Iterator_ready freshObj@0)) (Node_state (MapType0Select Ops_1Heap@0 (MapType0Select Ops_1Heap@0 freshObj@0 Iterator_current) Node_next)) (MapType0Select Ops_1Heap@0 null (Node_state (MapType0Select Ops_1Heap@0 (MapType0Select Ops_1Heap@0 freshObj@0 Iterator_current) Node_next))))))) (=> (and (and (= b_1_1@35  (and b_1_1@34 (state Ops_1Heap@0 Ops_1Mask@13))) (= Ops_1Mask@14 Ops_1Mask@13)) (and (= b_1_1@36 b_1_1@35) (= (ControlFlow 0 279) 278))) anon65_correct)))))
(let ((anon292_Else_correct  (=> (= (MapType0Select Ops_1Heap@0 (MapType0Select Ops_1Heap@0 freshObj@0 Iterator_current) Node_prev) null) (=> (and (= b_1_1@33 b_1_1@26) (= Ops_1Mask@12 Ops_1Mask@10)) (and (=> (= (ControlFlow 0 282) 279) anon293_Then_correct) (=> (= (ControlFlow 0 282) 280) anon293_Else_correct))))))
(let ((anon292_Then_correct  (=> (and (not (= (MapType0Select Ops_1Heap@0 (MapType0Select Ops_1Heap@0 freshObj@0 Iterator_current) Node_prev) null)) (= Ops_1Mask@11 (MapType1Store Ops_1Mask@10 null (Node_reverse (MapType0Select Ops_1Heap@0 (MapType0Select Ops_1Heap@0 freshObj@0 Iterator_current) Node_prev)) (real_2_U (+ (U_2_real (MapType1Select Ops_1Mask@10 null (Node_reverse (MapType0Select Ops_1Heap@0 (MapType0Select Ops_1Heap@0 freshObj@0 Iterator_current) Node_prev)))) FullPerm))))) (=> (and (and (and (= b_1_1@27  (and b_1_1@26 (InsidePredicate (Iterator_ready freshObj@0) (MapType0Select Ops_1Heap@0 null (Iterator_ready freshObj@0)) (Node_reverse (MapType0Select Ops_1Heap@0 (MapType0Select Ops_1Heap@0 freshObj@0 Iterator_current) Node_prev)) (MapType0Select Ops_1Heap@0 null (Node_reverse (MapType0Select Ops_1Heap@0 (MapType0Select Ops_1Heap@0 freshObj@0 Iterator_current) Node_prev)))))) (= b_1_1@28  (and b_1_1@27 (state Ops_1Heap@0 Ops_1Mask@11)))) (and (= b_1_1@29  (and b_1_1@28 (state Ops_1Heap@0 Ops_1Mask@11))) (= b_1_1@30  (and b_1_1@29 (= (Node_first Ops_1Heap@0 (MapType0Select Ops_1Heap@0 (MapType0Select Ops_1Heap@0 freshObj@0 Iterator_current) Node_prev)) (MapType0Select Ops_1Heap@0 (MapType0Select Ops_1Heap@0 freshObj@0 Iterator_iteratee) List_sentinel)))))) (and (and (= b_1_1@31  (and b_1_1@30 (state Ops_1Heap@0 Ops_1Mask@11))) (= b_1_1@32  (and b_1_1@31 (= (Node_rev_next Ops_1Heap@0 (MapType0Select Ops_1Heap@0 (MapType0Select Ops_1Heap@0 freshObj@0 Iterator_current) Node_prev)) (MapType0Select Ops_1Heap@0 freshObj@0 Iterator_current))))) (and (= b_1_1@33 b_1_1@32) (= Ops_1Mask@12 Ops_1Mask@11)))) (and (=> (= (ControlFlow 0 281) 279) anon293_Then_correct) (=> (= (ControlFlow 0 281) 280) anon293_Else_correct))))))
(let ((anon291_Else_correct  (=> (and (not (= (MapType0Select Ops_1Heap@0 (MapType0Select Ops_1Heap@0 freshObj@0 Iterator_current) Node_prev) null)) (= b_1_1@26 b_1_1@24)) (and (=> (= (ControlFlow 0 284) 281) anon292_Then_correct) (=> (= (ControlFlow 0 284) 282) anon292_Else_correct)))))
(let ((anon291_Then_correct  (=> (= (MapType0Select Ops_1Heap@0 (MapType0Select Ops_1Heap@0 freshObj@0 Iterator_current) Node_prev) null) (=> (and (= b_1_1@25  (and b_1_1@24 (= (MapType0Select Ops_1Heap@0 freshObj@0 Iterator_current) (MapType0Select Ops_1Heap@0 (MapType0Select Ops_1Heap@0 freshObj@0 Iterator_iteratee) List_sentinel)))) (= b_1_1@26 b_1_1@25)) (and (=> (= (ControlFlow 0 283) 281) anon292_Then_correct) (=> (= (ControlFlow 0 283) 282) anon292_Else_correct))))))
(let ((anon59_correct  (and (=> (= (ControlFlow 0 285) (- 0 287)) (=> (and b_1_1@4 b_2_1@6) (and (= neededTransfer@3 0.0) (= (U_2_real (MapType1Select Used_1Mask@3 null (Iterator_ready freshObj@0))) initNeededTransfer@0)))) (=> (=> (and b_1_1@4 b_2_1@6) (and (= neededTransfer@3 0.0) (= (U_2_real (MapType1Select Used_1Mask@3 null (Iterator_ready freshObj@0))) initNeededTransfer@0))) (=> (= b_3_1@0  (and b_1_1@4 b_2_1@6)) (=> (and (and (and (= b_3_1@1  (and b_3_1@0 (state ResultHeap ResultMask@@0))) (= b_3_1@2  (and b_3_1@1 (sumMask ResultMask@@0 Ops_1Mask@3 Used_1Mask@3)))) (and (= b_3_1@3  (and (and b_3_1@2 (IdenticalOnKnownLocations Ops_1Heap@0 ResultHeap Ops_1Mask@3)) (IdenticalOnKnownLocations Used_1Heap@0 ResultHeap Used_1Mask@3))) (= b_3_1@4  (and b_3_1@3 (state ResultHeap ResultMask@@0))))) (and (and (= b_1_1@5  (and b_1_1@4 b_3_1@4)) (= b_1_1@6  (and b_1_1@5 b_2_1@6))) (and (= b_1_1@7  (and b_1_1@6 (= Used_1Heap@0 Ops_1Heap@0))) (= perm@1 (/ (to_real 1) (to_real 2)))))) (and (=> (= (ControlFlow 0 285) (- 0 286)) (>= perm@1 NoPerm)) (=> (>= perm@1 NoPerm) (=> (and (and (and (= b_1_1@8  (and b_1_1@7 (=> (> perm@1 NoPerm) (not (= freshObj@0 null))))) (= Ops_1Mask@4 (MapType1Store Ops_1Mask@3 freshObj@0 Iterator_iteratee (real_2_U (+ (U_2_real (MapType1Select Ops_1Mask@3 freshObj@0 Iterator_iteratee)) perm@1))))) (and (= b_1_1@9  (and b_1_1@8 (state Ops_1Heap@0 Ops_1Mask@4))) (= b_1_1@10  (and b_1_1@9 (not (= (MapType0Select Ops_1Heap@0 freshObj@0 Iterator_iteratee) null)))))) (and (and (= b_1_1@11  (and b_1_1@10 (not (= (MapType0Select Ops_1Heap@0 freshObj@0 Iterator_iteratee) null)))) (= Ops_1Mask@5 (MapType1Store Ops_1Mask@4 (MapType0Select Ops_1Heap@0 freshObj@0 Iterator_iteratee) List_sentinel (real_2_U (+ (U_2_real (MapType1Select Ops_1Mask@4 (MapType0Select Ops_1Heap@0 freshObj@0 Iterator_iteratee) List_sentinel)) FullPerm))))) (and (= b_1_1@12  (and b_1_1@11 (state Ops_1Heap@0 Ops_1Mask@5))) (= b_1_1@13  (and b_1_1@12 (not (= (MapType0Select Ops_1Heap@0 (MapType0Select Ops_1Heap@0 freshObj@0 Iterator_iteratee) List_sentinel) null))))))) (=> (and (and (and (and (= b_1_1@14  (and b_1_1@13 (not (= freshObj@0 null)))) (= Ops_1Mask@6 (MapType1Store Ops_1Mask@5 freshObj@0 Iterator_current (real_2_U (+ (U_2_real (MapType1Select Ops_1Mask@5 freshObj@0 Iterator_current)) FullPerm))))) (and (= b_1_1@15  (and b_1_1@14 (state Ops_1Heap@0 Ops_1Mask@6))) (= b_1_1@16  (and b_1_1@15 (not (= freshObj@0 null)))))) (and (and (= Ops_1Mask@7 (MapType1Store Ops_1Mask@6 freshObj@0 Iterator_last (real_2_U (+ (U_2_real (MapType1Select Ops_1Mask@6 freshObj@0 Iterator_last)) FullPerm)))) (= b_1_1@17  (and b_1_1@16 (state Ops_1Heap@0 Ops_1Mask@7)))) (and (= b_1_1@18  (and b_1_1@17 (not (= (MapType0Select Ops_1Heap@0 freshObj@0 Iterator_current) null)))) (= b_1_1@19  (and b_1_1@18 (not (= (MapType0Select Ops_1Heap@0 freshObj@0 Iterator_current) null))))))) (and (and (and (= Ops_1Mask@8 (MapType1Store Ops_1Mask@7 (MapType0Select Ops_1Heap@0 freshObj@0 Iterator_current) Node_val (real_2_U (+ (U_2_real (MapType1Select Ops_1Mask@7 (MapType0Select Ops_1Heap@0 freshObj@0 Iterator_current) Node_val)) FullPerm)))) (= b_1_1@20  (and b_1_1@19 (state Ops_1Heap@0 Ops_1Mask@8)))) (and (= b_1_1@21  (and b_1_1@20 (not (= (MapType0Select Ops_1Heap@0 freshObj@0 Iterator_current) null)))) (= Ops_1Mask@9 (MapType1Store Ops_1Mask@8 (MapType0Select Ops_1Heap@0 freshObj@0 Iterator_current) Node_next (real_2_U (+ (U_2_real (MapType1Select Ops_1Mask@8 (MapType0Select Ops_1Heap@0 freshObj@0 Iterator_current) Node_next)) FullPerm)))))) (and (and (= b_1_1@22  (and b_1_1@21 (state Ops_1Heap@0 Ops_1Mask@9))) (= b_1_1@23  (and b_1_1@22 (not (= (MapType0Select Ops_1Heap@0 freshObj@0 Iterator_current) null))))) (and (= Ops_1Mask@10 (MapType1Store Ops_1Mask@9 (MapType0Select Ops_1Heap@0 freshObj@0 Iterator_current) Node_prev (real_2_U (+ (U_2_real (MapType1Select Ops_1Mask@9 (MapType0Select Ops_1Heap@0 freshObj@0 Iterator_current) Node_prev)) FullPerm)))) (= b_1_1@24  (and b_1_1@23 (state Ops_1Heap@0 Ops_1Mask@10))))))) (and (=> (= (ControlFlow 0 285) 283) anon291_Then_correct) (=> (= (ControlFlow 0 285) 284) anon291_Else_correct))))))))))))
(let ((anon290_Else_correct  (=> (>= 0.0 takeTransfer@1) (=> (and (= Mask@26 Mask@24) (= Heap@23 Heap@21)) (=> (and (and (= neededTransfer@3 neededTransfer@1) (= b_2_1@6 b_2_1@3)) (and (= Used_1Mask@3 Used_1Mask@1) (= (ControlFlow 0 290) 285))) anon59_correct)))))
(let ((anon290_Then_correct  (=> (> takeTransfer@1 0.0) (=> (and (= neededTransfer@2 (- neededTransfer@1 takeTransfer@1)) (= Used_1Mask@2 (MapType1Store Used_1Mask@1 null (Iterator_ready freshObj@0) (real_2_U (+ (U_2_real (MapType1Select Used_1Mask@1 null (Iterator_ready freshObj@0))) takeTransfer@1))))) (=> (and (and (= b_2_1@4  (and b_2_1@3 (state Used_1Heap@0 Used_1Mask@2))) (= TempMask@1 (MapType1Store ZeroMask null (Iterator_ready freshObj@0) (real_2_U FullPerm)))) (and (= b_2_1@5  (and b_2_1@4 (IdenticalOnKnownLocations Heap@21 Used_1Heap@0 TempMask@1))) (= Mask@25 (MapType1Store Mask@24 null (Iterator_ready freshObj@0) (real_2_U (- (U_2_real (MapType1Select Mask@24 null (Iterator_ready freshObj@0))) takeTransfer@1)))))) (=> (and (and (and (forall ((o_10 T@U) (f_14 T@U) ) (! (let ((B@@18 (FieldTypeInv1 (type f_14))))
(let ((A@@19 (FieldTypeInv0 (type f_14))))
 (=> (and (and (= (type o_10) RefType) (= (type f_14) (FieldType A@@19 B@@18))) (or (U_2_bool (MapType1Select (MapType0Select Heap@21 null (|wand_1#sm| freshObj@0 FullPerm l FullPerm)) o_10 f_14)) (U_2_bool (MapType1Select (MapType0Select Heap@21 null (|Iterator_ready#sm| freshObj@0)) o_10 f_14)))) (U_2_bool (MapType1Select newPMask@2 o_10 f_14)))))
 :qid |stdinbpl.2862:39|
 :skolemid |99|
 :pattern ( (MapType1Select newPMask@2 o_10 f_14))
)) (= Heap@22 (MapType0Store Heap@21 null (|wand_1#sm| freshObj@0 FullPerm l FullPerm) newPMask@2))) (and (= Mask@26 Mask@25) (= Heap@23 Heap@22))) (and (and (= neededTransfer@3 neededTransfer@2) (= b_2_1@6 b_2_1@5)) (and (= Used_1Mask@3 Used_1Mask@2) (= (ControlFlow 0 289) 285)))) anon59_correct))))))
(let ((anon289_Else_correct  (=> (and (< maskTransfer@1 neededTransfer@1) (= takeTransfer@1 maskTransfer@1)) (and (=> (= (ControlFlow 0 292) 289) anon290_Then_correct) (=> (= (ControlFlow 0 292) 290) anon290_Else_correct)))))
(let ((anon289_Then_correct  (=> (and (<= neededTransfer@1 maskTransfer@1) (= takeTransfer@1 neededTransfer@1)) (and (=> (= (ControlFlow 0 291) 289) anon290_Then_correct) (=> (= (ControlFlow 0 291) 290) anon290_Else_correct)))))
(let ((anon288_Then_correct  (=> (and (and (and (and b_1_1@4 b_2_1@3) true) (> neededTransfer@1 0.0)) (= maskTransfer@1 (U_2_real (MapType1Select Mask@24 null (Iterator_ready freshObj@0))))) (and (=> (= (ControlFlow 0 293) 291) anon289_Then_correct) (=> (= (ControlFlow 0 293) 292) anon289_Else_correct)))))
(let ((anon288_Else_correct  (=> (not (and (and (and b_1_1@4 b_2_1@3) true) (> neededTransfer@1 0.0))) (=> (and (= Mask@26 Mask@24) (= Heap@23 Heap@21)) (=> (and (and (= neededTransfer@3 neededTransfer@1) (= b_2_1@6 b_2_1@3)) (and (= Used_1Mask@3 Used_1Mask@1) (= (ControlFlow 0 288) 285))) anon59_correct)))))
(let ((anon287_Else_correct  (=> (>= 0.0 takeTransfer@0) (=> (and (and (= Ops_1Mask@3 Ops_1Mask@1) (= Used_1Mask@1 ZeroMask)) (and (= b_2_1@3 b_2_1@0) (= neededTransfer@1 FullPerm))) (and (=> (= (ControlFlow 0 296) 293) anon288_Then_correct) (=> (= (ControlFlow 0 296) 288) anon288_Else_correct))))))
(let ((anon287_Then_correct  (=> (> takeTransfer@0 0.0) (=> (and (= neededTransfer@0 (- FullPerm takeTransfer@0)) (= Used_1Mask@0 (MapType1Store ZeroMask null (Iterator_ready freshObj@0) (real_2_U (+ (U_2_real (MapType1Select ZeroMask null (Iterator_ready freshObj@0))) takeTransfer@0))))) (=> (and (and (and (= b_2_1@1  (and b_2_1@0 (state Used_1Heap@0 Used_1Mask@0))) (= TempMask@0 (MapType1Store ZeroMask null (Iterator_ready freshObj@0) (real_2_U FullPerm)))) (and (= b_2_1@2  (and b_2_1@1 (IdenticalOnKnownLocations Ops_1Heap@0 Used_1Heap@0 TempMask@0))) (= Ops_1Mask@2 (MapType1Store Ops_1Mask@1 null (Iterator_ready freshObj@0) (real_2_U (- (U_2_real (MapType1Select Ops_1Mask@1 null (Iterator_ready freshObj@0))) takeTransfer@0)))))) (and (and (= Ops_1Mask@3 Ops_1Mask@2) (= Used_1Mask@1 Used_1Mask@0)) (and (= b_2_1@3 b_2_1@2) (= neededTransfer@1 neededTransfer@0)))) (and (=> (= (ControlFlow 0 295) 293) anon288_Then_correct) (=> (= (ControlFlow 0 295) 288) anon288_Else_correct)))))))
(let ((anon286_Else_correct  (=> (and (< maskTransfer@0 FullPerm) (= takeTransfer@0 maskTransfer@0)) (and (=> (= (ControlFlow 0 298) 295) anon287_Then_correct) (=> (= (ControlFlow 0 298) 296) anon287_Else_correct)))))
(let ((anon286_Then_correct  (=> (and (<= FullPerm maskTransfer@0) (= takeTransfer@0 FullPerm)) (and (=> (= (ControlFlow 0 297) 295) anon287_Then_correct) (=> (= (ControlFlow 0 297) 296) anon287_Else_correct)))))
(let ((anon285_Then_correct  (=> (and (and (and (and b_1_1@4 b_2_1@0) true) (> FullPerm 0.0)) (= maskTransfer@0 (U_2_real (MapType1Select Ops_1Mask@1 null (Iterator_ready freshObj@0))))) (and (=> (= (ControlFlow 0 299) 297) anon286_Then_correct) (=> (= (ControlFlow 0 299) 298) anon286_Else_correct)))))
(let ((anon285_Else_correct  (=> (not (and (and (and b_1_1@4 b_2_1@0) true) (> FullPerm 0.0))) (=> (and (and (= Ops_1Mask@3 Ops_1Mask@1) (= Used_1Mask@1 ZeroMask)) (and (= b_2_1@3 b_2_1@0) (= neededTransfer@1 FullPerm))) (and (=> (= (ControlFlow 0 294) 293) anon288_Then_correct) (=> (= (ControlFlow 0 294) 288) anon288_Else_correct))))))
(let ((anon284_Then_correct  (=> b_1_1@4 (=> (and (and (|Iterator_ready#trigger| Ops_1Heap@0 (Iterator_ready freshObj@0)) (= (MapType0Select Ops_1Heap@0 null (Iterator_ready freshObj@0)) (CombineFrames (FrameFragment (MapType0Select Ops_1Heap@0 freshObj@0 Iterator_iteratee)) (CombineFrames (FrameFragment (MapType0Select Ops_1Heap@0 (MapType0Select Ops_1Heap@0 freshObj@0 Iterator_iteratee) List_sentinel)) (CombineFrames (FrameFragment (MapType0Select Ops_1Heap@0 freshObj@0 Iterator_current)) (CombineFrames (FrameFragment (MapType0Select Ops_1Heap@0 freshObj@0 Iterator_last)) (CombineFrames (FrameFragment (MapType0Select Ops_1Heap@0 (MapType0Select Ops_1Heap@0 freshObj@0 Iterator_current) Node_val)) (CombineFrames (FrameFragment (MapType0Select Ops_1Heap@0 (MapType0Select Ops_1Heap@0 freshObj@0 Iterator_current) Node_next)) (CombineFrames (FrameFragment (MapType0Select Ops_1Heap@0 (MapType0Select Ops_1Heap@0 freshObj@0 Iterator_current) Node_prev)) (CombineFrames (FrameFragment (ite (= (MapType0Select Ops_1Heap@0 (MapType0Select Ops_1Heap@0 freshObj@0 Iterator_current) Node_prev) null) EmptyFrame EmptyFrame)) (CombineFrames (FrameFragment (ite (not (= (MapType0Select Ops_1Heap@0 (MapType0Select Ops_1Heap@0 freshObj@0 Iterator_current) Node_prev) null)) (MapType0Select Ops_1Heap@0 null (Node_reverse (MapType0Select Ops_1Heap@0 (MapType0Select Ops_1Heap@0 freshObj@0 Iterator_current) Node_prev))) EmptyFrame)) (FrameFragment (ite (not (= (MapType0Select Ops_1Heap@0 (MapType0Select Ops_1Heap@0 freshObj@0 Iterator_current) Node_next) null)) (MapType0Select Ops_1Heap@0 null (Node_state (MapType0Select Ops_1Heap@0 (MapType0Select Ops_1Heap@0 freshObj@0 Iterator_current) Node_next))) EmptyFrame))))))))))))) (and (= b_2_1@0  (and b_2_1 (state Used_1Heap@0 ZeroMask))) (= initNeededTransfer@0 (+ (U_2_real (MapType1Select ZeroMask null (Iterator_ready freshObj@0))) FullPerm)))) (and (=> (= (ControlFlow 0 300) (- 0 301)) (>= FullPerm 0.0)) (=> (>= FullPerm 0.0) (and (=> (= (ControlFlow 0 300) 299) anon285_Then_correct) (=> (= (ControlFlow 0 300) 294) anon285_Else_correct))))))))
(let ((anon284_Else_correct  (=> (not b_1_1@4) (=> (and (and (= Heap@24 Heap@21) (= Mask@27 Mask@24)) (and (= b_1_1@39 b_1_1@4) (= Ops_1Mask@15 Ops_1Mask@1))) (and (=> (= (ControlFlow 0 277) 276) anon294_Then_correct) (=> (= (ControlFlow 0 277) 177) anon294_Else_correct))))))
(let ((anon46_correct  (=> (and (= b_1_1@3  (and b_1_1@2 (state Ops_1Heap@0 Ops_1Mask@1))) (= b_1_1@4  (and b_1_1@3 (state Ops_1Heap@0 Ops_1Mask@1)))) (and (=> (= (ControlFlow 0 302) 300) anon284_Then_correct) (=> (= (ControlFlow 0 302) 277) anon284_Else_correct)))))
(let ((anon283_Else_correct  (=> (and (and (not b_1_1@0) (= Ops_1Mask@1 ZeroMask)) (and (= b_1_1@2 b_1_1@0) (= (ControlFlow 0 304) 302))) anon46_correct)))
(let ((anon283_Then_correct  (=> (and b_1_1@0 (= Ops_1Mask@0 (MapType1Store ZeroMask null (Iterator_ready freshObj@0) (real_2_U (+ (U_2_real (MapType1Select ZeroMask null (Iterator_ready freshObj@0))) FullPerm))))) (=> (and (and (= b_1_1@1  (and b_1_1@0 (state Ops_1Heap@0 Ops_1Mask@0))) (= Ops_1Mask@1 Ops_1Mask@0)) (and (= b_1_1@2 b_1_1@1) (= (ControlFlow 0 303) 302))) anon46_correct))))
(let ((anon44_correct  (=> (and (and (state Heap@21 Mask@24) (state Heap@21 Mask@24)) (and (= b_1_1@0  (and b_1_1 (state Ops_1Heap@0 ZeroMask))) (= b_3@0  (and b_3 (state UsedHeap@0 ZeroMask))))) (and (=> (= (ControlFlow 0 305) 303) anon283_Then_correct) (=> (= (ControlFlow 0 305) 304) anon283_Else_correct)))))
(let ((anon282_Else_correct  (=> (= (MapType0Select Heap@19 (MapType0Select Heap@19 freshObj@0 Iterator_current) Node_next) null) (=> (and (= Heap@21 Heap@19) (= (ControlFlow 0 307) 305)) anon44_correct))))
(let ((anon282_Then_correct  (=> (not (= (MapType0Select Heap@19 (MapType0Select Heap@19 freshObj@0 Iterator_current) Node_next) null)) (=> (and (and (forall ((o_9 T@U) (f_13 T@U) ) (! (let ((B@@19 (FieldTypeInv1 (type f_13))))
(let ((A@@20 (FieldTypeInv0 (type f_13))))
 (=> (and (and (= (type o_9) RefType) (= (type f_13) (FieldType A@@20 B@@19))) (or (U_2_bool (MapType1Select (MapType0Select Heap@19 null (|Iterator_ready#sm| freshObj@0)) o_9 f_13)) (U_2_bool (MapType1Select (MapType0Select Heap@19 null (|Node_state#sm| (MapType0Select Heap@19 (MapType0Select Heap@19 freshObj@0 Iterator_current) Node_next))) o_9 f_13)))) (U_2_bool (MapType1Select newPMask@1 o_9 f_13)))))
 :qid |stdinbpl.2764:29|
 :skolemid |98|
 :pattern ( (MapType1Select newPMask@1 o_9 f_13))
)) (= Heap@20 (MapType0Store Heap@19 null (|Iterator_ready#sm| freshObj@0) newPMask@1))) (and (= Heap@21 Heap@20) (= (ControlFlow 0 306) 305))) anon44_correct))))
(let ((anon281_Else_correct  (=> (and (= (MapType0Select Heap@17 (MapType0Select Heap@17 freshObj@0 Iterator_current) Node_prev) null) (= Heap@19 Heap@17)) (and (=> (= (ControlFlow 0 309) 306) anon282_Then_correct) (=> (= (ControlFlow 0 309) 307) anon282_Else_correct)))))
(let ((anon281_Then_correct  (=> (and (and (not (= (MapType0Select Heap@17 (MapType0Select Heap@17 freshObj@0 Iterator_current) Node_prev) null)) (forall ((o_8 T@U) (f_12 T@U) ) (! (let ((B@@20 (FieldTypeInv1 (type f_12))))
(let ((A@@21 (FieldTypeInv0 (type f_12))))
 (=> (and (and (= (type o_8) RefType) (= (type f_12) (FieldType A@@21 B@@20))) (or (U_2_bool (MapType1Select (MapType0Select Heap@17 null (|Iterator_ready#sm| freshObj@0)) o_8 f_12)) (U_2_bool (MapType1Select (MapType0Select Heap@17 null (|Node_reverse#sm| (MapType0Select Heap@17 (MapType0Select Heap@17 freshObj@0 Iterator_current) Node_prev))) o_8 f_12)))) (U_2_bool (MapType1Select newPMask@0 o_8 f_12)))))
 :qid |stdinbpl.2756:29|
 :skolemid |97|
 :pattern ( (MapType1Select newPMask@0 o_8 f_12))
))) (and (= Heap@18 (MapType0Store Heap@17 null (|Iterator_ready#sm| freshObj@0) newPMask@0)) (= Heap@19 Heap@18))) (and (=> (= (ControlFlow 0 308) 306) anon282_Then_correct) (=> (= (ControlFlow 0 308) 307) anon282_Else_correct)))))
(let ((anon40_correct  (=> (= Heap@11 (MapType0Store Heap@10 null (|Iterator_ready#sm| freshObj@0) (MapType1Store (MapType0Select Heap@10 null (|Iterator_ready#sm| freshObj@0)) freshObj@0 Iterator_iteratee (bool_2_U true)))) (=> (and (= Heap@12 (MapType0Store Heap@11 null (|Iterator_ready#sm| freshObj@0) (MapType1Store (MapType0Select Heap@11 null (|Iterator_ready#sm| freshObj@0)) (MapType0Select Heap@11 freshObj@0 Iterator_iteratee) List_sentinel (bool_2_U true)))) (= Heap@13 (MapType0Store Heap@12 null (|Iterator_ready#sm| freshObj@0) (MapType1Store (MapType0Select Heap@12 null (|Iterator_ready#sm| freshObj@0)) freshObj@0 Iterator_current (bool_2_U true))))) (=> (and (and (= Heap@14 (MapType0Store Heap@13 null (|Iterator_ready#sm| freshObj@0) (MapType1Store (MapType0Select Heap@13 null (|Iterator_ready#sm| freshObj@0)) freshObj@0 Iterator_last (bool_2_U true)))) (= Heap@15 (MapType0Store Heap@14 null (|Iterator_ready#sm| freshObj@0) (MapType1Store (MapType0Select Heap@14 null (|Iterator_ready#sm| freshObj@0)) (MapType0Select Heap@14 freshObj@0 Iterator_current) Node_val (bool_2_U true))))) (and (= Heap@16 (MapType0Store Heap@15 null (|Iterator_ready#sm| freshObj@0) (MapType1Store (MapType0Select Heap@15 null (|Iterator_ready#sm| freshObj@0)) (MapType0Select Heap@15 freshObj@0 Iterator_current) Node_next (bool_2_U true)))) (= Heap@17 (MapType0Store Heap@16 null (|Iterator_ready#sm| freshObj@0) (MapType1Store (MapType0Select Heap@16 null (|Iterator_ready#sm| freshObj@0)) (MapType0Select Heap@16 freshObj@0 Iterator_current) Node_prev (bool_2_U true)))))) (and (=> (= (ControlFlow 0 310) 308) anon281_Then_correct) (=> (= (ControlFlow 0 310) 309) anon281_Else_correct)))))))
(let ((anon280_Else_correct  (=> (HasDirectPerm Mask@24 null (Iterator_ready freshObj@0)) (=> (and (= Heap@10 Heap@7) (= (ControlFlow 0 312) 310)) anon40_correct))))
(let ((anon280_Then_correct  (=> (not (HasDirectPerm Mask@24 null (Iterator_ready freshObj@0))) (=> (and (and (= Heap@8 (MapType0Store Heap@7 null (|Iterator_ready#sm| freshObj@0) ZeroPMask)) (= Heap@9 (MapType0Store Heap@8 null (Iterator_ready freshObj@0) freshVersion@0))) (and (= Heap@10 Heap@9) (= (ControlFlow 0 311) 310))) anon40_correct))))
(let ((anon38_correct  (=> (= Mask@24 (MapType1Store Mask@23 null (Iterator_ready freshObj@0) (real_2_U (+ (U_2_real (MapType1Select Mask@23 null (Iterator_ready freshObj@0))) FullPerm)))) (=> (and (and (state Heap@7 Mask@24) (state Heap@7 Mask@24)) (and (|Iterator_ready#trigger| Heap@7 (Iterator_ready freshObj@0)) (= (MapType0Select Heap@7 null (Iterator_ready freshObj@0)) (CombineFrames (FrameFragment (MapType0Select Heap@7 freshObj@0 Iterator_iteratee)) (CombineFrames (FrameFragment (MapType0Select Heap@7 (MapType0Select Heap@7 freshObj@0 Iterator_iteratee) List_sentinel)) (CombineFrames (FrameFragment (MapType0Select Heap@7 freshObj@0 Iterator_current)) (CombineFrames (FrameFragment (MapType0Select Heap@7 freshObj@0 Iterator_last)) (CombineFrames (FrameFragment (MapType0Select Heap@7 (MapType0Select Heap@7 freshObj@0 Iterator_current) Node_val)) (CombineFrames (FrameFragment (MapType0Select Heap@7 (MapType0Select Heap@7 freshObj@0 Iterator_current) Node_next)) (CombineFrames (FrameFragment (MapType0Select Heap@7 (MapType0Select Heap@7 freshObj@0 Iterator_current) Node_prev)) (CombineFrames (FrameFragment (ite (= (MapType0Select Heap@7 (MapType0Select Heap@7 freshObj@0 Iterator_current) Node_prev) null) EmptyFrame EmptyFrame)) (CombineFrames (FrameFragment (ite (not (= (MapType0Select Heap@7 (MapType0Select Heap@7 freshObj@0 Iterator_current) Node_prev) null)) (MapType0Select Heap@7 null (Node_reverse (MapType0Select Heap@7 (MapType0Select Heap@7 freshObj@0 Iterator_current) Node_prev))) EmptyFrame)) (FrameFragment (ite (not (= (MapType0Select Heap@7 (MapType0Select Heap@7 freshObj@0 Iterator_current) Node_next) null)) (MapType0Select Heap@7 null (Node_state (MapType0Select Heap@7 (MapType0Select Heap@7 freshObj@0 Iterator_current) Node_next))) EmptyFrame)))))))))))))) (and (=> (= (ControlFlow 0 313) 311) anon280_Then_correct) (=> (= (ControlFlow 0 313) 312) anon280_Else_correct))))))
(let ((anon37_correct  (=> (and (and (= Mask@22 (MapType1Store Mask@21 null (Node_state (MapType0Select Heap@7 (MapType0Select Heap@7 freshObj@0 Iterator_current) Node_next)) (real_2_U (- (U_2_real (MapType1Select Mask@21 null (Node_state (MapType0Select Heap@7 (MapType0Select Heap@7 freshObj@0 Iterator_current) Node_next)))) FullPerm)))) (InsidePredicate (Iterator_ready freshObj@0) (MapType0Select Heap@7 null (Iterator_ready freshObj@0)) (Node_state (MapType0Select Heap@7 (MapType0Select Heap@7 freshObj@0 Iterator_current) Node_next)) (MapType0Select Heap@7 null (Node_state (MapType0Select Heap@7 (MapType0Select Heap@7 freshObj@0 Iterator_current) Node_next))))) (and (= Mask@23 Mask@22) (= (ControlFlow 0 315) 313))) anon38_correct)))
(let ((anon279_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 318) 315)) anon37_correct)))
(let ((anon279_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 316) (- 0 317)) (<= FullPerm (U_2_real (MapType1Select Mask@21 null (Node_state (MapType0Select Heap@7 (MapType0Select Heap@7 freshObj@0 Iterator_current) Node_next)))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@21 null (Node_state (MapType0Select Heap@7 (MapType0Select Heap@7 freshObj@0 Iterator_current) Node_next))))) (=> (= (ControlFlow 0 316) 315) anon37_correct))))))
(let ((anon278_Then_correct  (=> (not (= (MapType0Select Heap@7 (MapType0Select Heap@7 freshObj@0 Iterator_current) Node_next) null)) (and (=> (= (ControlFlow 0 319) 316) anon279_Then_correct) (=> (= (ControlFlow 0 319) 318) anon279_Else_correct)))))
(let ((anon278_Else_correct  (=> (= (MapType0Select Heap@7 (MapType0Select Heap@7 freshObj@0 Iterator_current) Node_next) null) (=> (and (= Mask@23 Mask@21) (= (ControlFlow 0 314) 313)) anon38_correct))))
(let ((anon33_correct  (=> (and (= Mask@20 (MapType1Store Mask@19 null (Node_reverse (MapType0Select Heap@7 (MapType0Select Heap@7 freshObj@0 Iterator_current) Node_prev)) (real_2_U (- (U_2_real (MapType1Select Mask@19 null (Node_reverse (MapType0Select Heap@7 (MapType0Select Heap@7 freshObj@0 Iterator_current) Node_prev)))) FullPerm)))) (InsidePredicate (Iterator_ready freshObj@0) (MapType0Select Heap@7 null (Iterator_ready freshObj@0)) (Node_reverse (MapType0Select Heap@7 (MapType0Select Heap@7 freshObj@0 Iterator_current) Node_prev)) (MapType0Select Heap@7 null (Node_reverse (MapType0Select Heap@7 (MapType0Select Heap@7 freshObj@0 Iterator_current) Node_prev))))) (and (=> (= (ControlFlow 0 321) (- 0 323)) (= (Node_first Heap@7 (MapType0Select Heap@7 (MapType0Select Heap@7 freshObj@0 Iterator_current) Node_prev)) (MapType0Select Heap@7 (MapType0Select Heap@7 freshObj@0 Iterator_iteratee) List_sentinel))) (=> (= (Node_first Heap@7 (MapType0Select Heap@7 (MapType0Select Heap@7 freshObj@0 Iterator_current) Node_prev)) (MapType0Select Heap@7 (MapType0Select Heap@7 freshObj@0 Iterator_iteratee) List_sentinel)) (and (=> (= (ControlFlow 0 321) (- 0 322)) (= (Node_rev_next Heap@7 (MapType0Select Heap@7 (MapType0Select Heap@7 freshObj@0 Iterator_current) Node_prev)) (MapType0Select Heap@7 freshObj@0 Iterator_current))) (=> (= (Node_rev_next Heap@7 (MapType0Select Heap@7 (MapType0Select Heap@7 freshObj@0 Iterator_current) Node_prev)) (MapType0Select Heap@7 freshObj@0 Iterator_current)) (=> (= Mask@21 Mask@20) (and (=> (= (ControlFlow 0 321) 319) anon278_Then_correct) (=> (= (ControlFlow 0 321) 314) anon278_Else_correct))))))))))
(let ((anon277_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 326) 321)) anon33_correct)))
(let ((anon277_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 324) (- 0 325)) (<= FullPerm (U_2_real (MapType1Select Mask@19 null (Node_reverse (MapType0Select Heap@7 (MapType0Select Heap@7 freshObj@0 Iterator_current) Node_prev)))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@19 null (Node_reverse (MapType0Select Heap@7 (MapType0Select Heap@7 freshObj@0 Iterator_current) Node_prev))))) (=> (= (ControlFlow 0 324) 321) anon33_correct))))))
(let ((anon276_Then_correct  (=> (not (= (MapType0Select Heap@7 (MapType0Select Heap@7 freshObj@0 Iterator_current) Node_prev) null)) (and (=> (= (ControlFlow 0 327) 324) anon277_Then_correct) (=> (= (ControlFlow 0 327) 326) anon277_Else_correct)))))
(let ((anon276_Else_correct  (=> (and (= (MapType0Select Heap@7 (MapType0Select Heap@7 freshObj@0 Iterator_current) Node_prev) null) (= Mask@21 Mask@19)) (and (=> (= (ControlFlow 0 320) 319) anon278_Then_correct) (=> (= (ControlFlow 0 320) 314) anon278_Else_correct)))))
(let ((anon275_Else_correct  (=> (not (= (MapType0Select Heap@7 (MapType0Select Heap@7 freshObj@0 Iterator_current) Node_prev) null)) (and (=> (= (ControlFlow 0 330) 327) anon276_Then_correct) (=> (= (ControlFlow 0 330) 320) anon276_Else_correct)))))
(let ((anon275_Then_correct  (=> (= (MapType0Select Heap@7 (MapType0Select Heap@7 freshObj@0 Iterator_current) Node_prev) null) (and (=> (= (ControlFlow 0 328) (- 0 329)) (= (MapType0Select Heap@7 freshObj@0 Iterator_current) (MapType0Select Heap@7 (MapType0Select Heap@7 freshObj@0 Iterator_iteratee) List_sentinel))) (=> (= (MapType0Select Heap@7 freshObj@0 Iterator_current) (MapType0Select Heap@7 (MapType0Select Heap@7 freshObj@0 Iterator_iteratee) List_sentinel)) (and (=> (= (ControlFlow 0 328) 327) anon276_Then_correct) (=> (= (ControlFlow 0 328) 320) anon276_Else_correct)))))))
(let ((anon28_correct  (=> (= Mask@19 (MapType1Store Mask@18 (MapType0Select Heap@7 freshObj@0 Iterator_current) Node_prev (real_2_U (- (U_2_real (MapType1Select Mask@18 (MapType0Select Heap@7 freshObj@0 Iterator_current) Node_prev)) FullPerm)))) (and (=> (= (ControlFlow 0 331) 328) anon275_Then_correct) (=> (= (ControlFlow 0 331) 330) anon275_Else_correct)))))
(let ((anon274_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 334) 331)) anon28_correct)))
(let ((anon274_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 332) (- 0 333)) (<= FullPerm (U_2_real (MapType1Select Mask@18 (MapType0Select Heap@7 freshObj@0 Iterator_current) Node_prev)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@18 (MapType0Select Heap@7 freshObj@0 Iterator_current) Node_prev))) (=> (= (ControlFlow 0 332) 331) anon28_correct))))))
(let ((anon26_correct  (=> (= Mask@18 (MapType1Store Mask@17 (MapType0Select Heap@7 freshObj@0 Iterator_current) Node_next (real_2_U (- (U_2_real (MapType1Select Mask@17 (MapType0Select Heap@7 freshObj@0 Iterator_current) Node_next)) FullPerm)))) (and (=> (= (ControlFlow 0 335) 332) anon274_Then_correct) (=> (= (ControlFlow 0 335) 334) anon274_Else_correct)))))
(let ((anon273_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 338) 335)) anon26_correct)))
(let ((anon273_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 336) (- 0 337)) (<= FullPerm (U_2_real (MapType1Select Mask@17 (MapType0Select Heap@7 freshObj@0 Iterator_current) Node_next)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@17 (MapType0Select Heap@7 freshObj@0 Iterator_current) Node_next))) (=> (= (ControlFlow 0 336) 335) anon26_correct))))))
(let ((anon24_correct  (=> (= Mask@17 (MapType1Store Mask@16 (MapType0Select Heap@7 freshObj@0 Iterator_current) Node_val (real_2_U (- (U_2_real (MapType1Select Mask@16 (MapType0Select Heap@7 freshObj@0 Iterator_current) Node_val)) FullPerm)))) (and (=> (= (ControlFlow 0 339) 336) anon273_Then_correct) (=> (= (ControlFlow 0 339) 338) anon273_Else_correct)))))
(let ((anon272_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 342) 339)) anon24_correct)))
(let ((anon272_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 340) (- 0 341)) (<= FullPerm (U_2_real (MapType1Select Mask@16 (MapType0Select Heap@7 freshObj@0 Iterator_current) Node_val)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@16 (MapType0Select Heap@7 freshObj@0 Iterator_current) Node_val))) (=> (= (ControlFlow 0 340) 339) anon24_correct))))))
(let ((anon22_correct  (=> (= Mask@16 (MapType1Store Mask@15 freshObj@0 Iterator_last (real_2_U (- (U_2_real (MapType1Select Mask@15 freshObj@0 Iterator_last)) FullPerm)))) (and (=> (= (ControlFlow 0 343) (- 0 344)) (not (= (MapType0Select Heap@7 freshObj@0 Iterator_current) null))) (=> (not (= (MapType0Select Heap@7 freshObj@0 Iterator_current) null)) (and (=> (= (ControlFlow 0 343) 340) anon272_Then_correct) (=> (= (ControlFlow 0 343) 342) anon272_Else_correct)))))))
(let ((anon271_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 347) 343)) anon22_correct)))
(let ((anon271_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 345) (- 0 346)) (<= FullPerm (U_2_real (MapType1Select Mask@15 freshObj@0 Iterator_last)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@15 freshObj@0 Iterator_last))) (=> (= (ControlFlow 0 345) 343) anon22_correct))))))
(let ((anon20_correct  (=> (= Mask@15 (MapType1Store Mask@14 freshObj@0 Iterator_current (real_2_U (- (U_2_real (MapType1Select Mask@14 freshObj@0 Iterator_current)) FullPerm)))) (and (=> (= (ControlFlow 0 348) 345) anon271_Then_correct) (=> (= (ControlFlow 0 348) 347) anon271_Else_correct)))))
(let ((anon270_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 351) 348)) anon20_correct)))
(let ((anon270_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 349) (- 0 350)) (<= FullPerm (U_2_real (MapType1Select Mask@14 freshObj@0 Iterator_current)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@14 freshObj@0 Iterator_current))) (=> (= (ControlFlow 0 349) 348) anon20_correct))))))
(let ((anon18_correct  (=> (= Mask@14 (MapType1Store Mask@13 (MapType0Select Heap@7 freshObj@0 Iterator_iteratee) List_sentinel (real_2_U (- (U_2_real (MapType1Select Mask@13 (MapType0Select Heap@7 freshObj@0 Iterator_iteratee) List_sentinel)) FullPerm)))) (and (=> (= (ControlFlow 0 352) (- 0 353)) (not (= (MapType0Select Heap@7 (MapType0Select Heap@7 freshObj@0 Iterator_iteratee) List_sentinel) null))) (=> (not (= (MapType0Select Heap@7 (MapType0Select Heap@7 freshObj@0 Iterator_iteratee) List_sentinel) null)) (and (=> (= (ControlFlow 0 352) 349) anon270_Then_correct) (=> (= (ControlFlow 0 352) 351) anon270_Else_correct)))))))
(let ((anon269_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 356) 352)) anon18_correct)))
(let ((anon269_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 354) (- 0 355)) (<= FullPerm (U_2_real (MapType1Select Mask@13 (MapType0Select Heap@7 freshObj@0 Iterator_iteratee) List_sentinel)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@13 (MapType0Select Heap@7 freshObj@0 Iterator_iteratee) List_sentinel))) (=> (= (ControlFlow 0 354) 352) anon18_correct))))))
(let ((anon16_correct  (=> (= Mask@13 (MapType1Store Mask@12 freshObj@0 Iterator_iteratee (real_2_U (- (U_2_real (MapType1Select Mask@12 freshObj@0 Iterator_iteratee)) perm@0)))) (and (=> (= (ControlFlow 0 357) (- 0 358)) (not (= (MapType0Select Heap@7 freshObj@0 Iterator_iteratee) null))) (=> (not (= (MapType0Select Heap@7 freshObj@0 Iterator_iteratee) null)) (and (=> (= (ControlFlow 0 357) 354) anon269_Then_correct) (=> (= (ControlFlow 0 357) 356) anon269_Else_correct)))))))
(let ((anon268_Else_correct  (=> (and (= perm@0 NoPerm) (= (ControlFlow 0 361) 357)) anon16_correct)))
(let ((anon268_Then_correct  (=> (not (= perm@0 NoPerm)) (and (=> (= (ControlFlow 0 359) (- 0 360)) (<= perm@0 (U_2_real (MapType1Select Mask@12 freshObj@0 Iterator_iteratee)))) (=> (<= perm@0 (U_2_real (MapType1Select Mask@12 freshObj@0 Iterator_iteratee))) (=> (= (ControlFlow 0 359) 357) anon16_correct))))))
(let ((anon14_correct  (=> (and (state Heap@5 Mask@12) (state Heap@5 Mask@12)) (and (=> (= (ControlFlow 0 362) (- 0 366)) (HasDirectPerm Mask@12 freshObj@0 Iterator_current)) (=> (HasDirectPerm Mask@12 freshObj@0 Iterator_current) (and (=> (= (ControlFlow 0 362) (- 0 365)) (= FullPerm (U_2_real (MapType1Select Mask@12 (MapType0Select Heap@5 freshObj@0 Iterator_current) Node_prev)))) (=> (= FullPerm (U_2_real (MapType1Select Mask@12 (MapType0Select Heap@5 freshObj@0 Iterator_current) Node_prev))) (=> (and (= Heap@6 (MapType0Store Heap@5 (MapType0Select Heap@5 freshObj@0 Iterator_current) Node_prev null)) (state Heap@6 Mask@12)) (and (=> (= (ControlFlow 0 362) (- 0 364)) (= FullPerm (U_2_real (MapType1Select Mask@12 freshObj@0 Iterator_iteratee)))) (=> (= FullPerm (U_2_real (MapType1Select Mask@12 freshObj@0 Iterator_iteratee))) (=> (= Heap@7 (MapType0Store Heap@6 freshObj@0 Iterator_iteratee l)) (=> (and (state Heap@7 Mask@12) (= perm@0 (/ (to_real 1) (to_real 2)))) (and (=> (= (ControlFlow 0 362) (- 0 363)) (>= perm@0 NoPerm)) (=> (>= perm@0 NoPerm) (and (=> (= (ControlFlow 0 362) 359) anon268_Then_correct) (=> (= (ControlFlow 0 362) 361) anon268_Else_correct))))))))))))))))
(let ((anon267_Else_correct  (=> (= (MapType0Select Heap@5 (MapType0Select Heap@5 freshObj@0 Iterator_current) Node_next) null) (=> (and (= Mask@12 Mask@10) (= (ControlFlow 0 368) 362)) anon14_correct))))
(let ((anon267_Then_correct  (=> (and (not (= (MapType0Select Heap@5 (MapType0Select Heap@5 freshObj@0 Iterator_current) Node_next) null)) (= Mask@11 (MapType1Store Mask@10 null (Node_state (MapType0Select Heap@5 (MapType0Select Heap@5 freshObj@0 Iterator_current) Node_next)) (real_2_U (+ (U_2_real (MapType1Select Mask@10 null (Node_state (MapType0Select Heap@5 (MapType0Select Heap@5 freshObj@0 Iterator_current) Node_next)))) FullPerm))))) (=> (and (and (InsidePredicate (Node_state (MapType0Select Heap@5 freshObj@0 Iterator_current)) (MapType0Select Heap@5 null (Node_state (MapType0Select Heap@5 freshObj@0 Iterator_current))) (Node_state (MapType0Select Heap@5 (MapType0Select Heap@5 freshObj@0 Iterator_current) Node_next)) (MapType0Select Heap@5 null (Node_state (MapType0Select Heap@5 (MapType0Select Heap@5 freshObj@0 Iterator_current) Node_next)))) (state Heap@5 Mask@11)) (and (= Mask@12 Mask@11) (= (ControlFlow 0 367) 362))) anon14_correct))))
(let ((anon12_correct  (=> (not (= (MapType0Select Heap@5 freshObj@0 Iterator_current) null)) (=> (and (and (and (= Mask@8 (MapType1Store Mask@7 (MapType0Select Heap@5 freshObj@0 Iterator_current) Node_val (real_2_U (+ (U_2_real (MapType1Select Mask@7 (MapType0Select Heap@5 freshObj@0 Iterator_current) Node_val)) FullPerm)))) (state Heap@5 Mask@8)) (and (not (= (MapType0Select Heap@5 freshObj@0 Iterator_current) null)) (= Mask@9 (MapType1Store Mask@8 (MapType0Select Heap@5 freshObj@0 Iterator_current) Node_prev (real_2_U (+ (U_2_real (MapType1Select Mask@8 (MapType0Select Heap@5 freshObj@0 Iterator_current) Node_prev)) FullPerm)))))) (and (and (state Heap@5 Mask@9) (not (= (MapType0Select Heap@5 freshObj@0 Iterator_current) null))) (and (= Mask@10 (MapType1Store Mask@9 (MapType0Select Heap@5 freshObj@0 Iterator_current) Node_next (real_2_U (+ (U_2_real (MapType1Select Mask@9 (MapType0Select Heap@5 freshObj@0 Iterator_current) Node_next)) FullPerm)))) (state Heap@5 Mask@10)))) (and (=> (= (ControlFlow 0 369) 367) anon267_Then_correct) (=> (= (ControlFlow 0 369) 368) anon267_Else_correct))))))
(let ((anon266_Else_correct  (=> (HasDirectPerm Mask@7 null (Node_state (MapType0Select Heap@3 freshObj@0 Iterator_current))) (=> (and (= Heap@5 Heap@3) (= (ControlFlow 0 371) 369)) anon12_correct))))
(let ((anon266_Then_correct  (=> (and (and (not (HasDirectPerm Mask@7 null (Node_state (MapType0Select Heap@3 freshObj@0 Iterator_current)))) (= Heap@4 (MapType0Store Heap@3 null (Node_state (MapType0Select Heap@3 freshObj@0 Iterator_current)) newVersion@1))) (and (= Heap@5 Heap@4) (= (ControlFlow 0 370) 369))) anon12_correct)))
(let ((anon10_correct  (=> (= Mask@7 (MapType1Store Mask@6 null (Node_state (MapType0Select Heap@3 freshObj@0 Iterator_current)) (real_2_U (- (U_2_real (MapType1Select Mask@6 null (Node_state (MapType0Select Heap@3 freshObj@0 Iterator_current)))) FullPerm)))) (and (=> (= (ControlFlow 0 372) 370) anon266_Then_correct) (=> (= (ControlFlow 0 372) 371) anon266_Else_correct)))))
(let ((anon265_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 375) 372)) anon10_correct)))
(let ((anon265_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 373) (- 0 374)) (<= FullPerm (U_2_real (MapType1Select Mask@6 null (Node_state (MapType0Select Heap@3 freshObj@0 Iterator_current)))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@6 null (Node_state (MapType0Select Heap@3 freshObj@0 Iterator_current))))) (=> (= (ControlFlow 0 373) 372) anon10_correct))))))
(let ((anon8_correct  (=> (not (= l null)) (=> (and (and (and (= Mask@5 (MapType1Store Mask@4 l List_sentinel (real_2_U (+ (U_2_real (MapType1Select Mask@4 l List_sentinel)) FullPerm)))) (state Heap@2 Mask@5)) (and (not (= (MapType0Select Heap@2 l List_sentinel) null)) (= Mask@6 (MapType1Store Mask@5 null (Node_state (MapType0Select Heap@2 l List_sentinel)) (real_2_U (+ (U_2_real (MapType1Select Mask@5 null (Node_state (MapType0Select Heap@2 l List_sentinel)))) FullPerm)))))) (and (and (InsidePredicate (List_state l) (MapType0Select Heap@2 null (List_state l)) (Node_state (MapType0Select Heap@2 l List_sentinel)) (MapType0Select Heap@2 null (Node_state (MapType0Select Heap@2 l List_sentinel)))) (state Heap@2 Mask@6)) (and (state Heap@2 Mask@6) (state Heap@2 Mask@6)))) (and (=> (= (ControlFlow 0 376) (- 0 379)) (HasDirectPerm Mask@6 l List_sentinel)) (=> (HasDirectPerm Mask@6 l List_sentinel) (and (=> (= (ControlFlow 0 376) (- 0 378)) (= FullPerm (U_2_real (MapType1Select Mask@6 freshObj@0 Iterator_current)))) (=> (= FullPerm (U_2_real (MapType1Select Mask@6 freshObj@0 Iterator_current))) (=> (and (= Heap@3 (MapType0Store Heap@2 freshObj@0 Iterator_current (MapType0Select Heap@2 l List_sentinel))) (state Heap@3 Mask@6)) (and (=> (= (ControlFlow 0 376) (- 0 377)) (HasDirectPerm Mask@6 freshObj@0 Iterator_current)) (=> (HasDirectPerm Mask@6 freshObj@0 Iterator_current) (=> (and (|Node_state#trigger| Heap@3 (Node_state (MapType0Select Heap@3 freshObj@0 Iterator_current))) (= (MapType0Select Heap@3 null (Node_state (MapType0Select Heap@3 freshObj@0 Iterator_current))) (CombineFrames (FrameFragment (MapType0Select Heap@3 (MapType0Select Heap@3 freshObj@0 Iterator_current) Node_val)) (CombineFrames (FrameFragment (MapType0Select Heap@3 (MapType0Select Heap@3 freshObj@0 Iterator_current) Node_prev)) (CombineFrames (FrameFragment (MapType0Select Heap@3 (MapType0Select Heap@3 freshObj@0 Iterator_current) Node_next)) (FrameFragment (ite (not (= (MapType0Select Heap@3 (MapType0Select Heap@3 freshObj@0 Iterator_current) Node_next) null)) (MapType0Select Heap@3 null (Node_state (MapType0Select Heap@3 (MapType0Select Heap@3 freshObj@0 Iterator_current) Node_next))) EmptyFrame))))))) (and (=> (= (ControlFlow 0 376) 373) anon265_Then_correct) (=> (= (ControlFlow 0 376) 375) anon265_Else_correct))))))))))))))
(let ((anon264_Else_correct  (=> (HasDirectPerm Mask@4 null (List_state l)) (=> (and (= Heap@2 Heap@0) (= (ControlFlow 0 381) 376)) anon8_correct))))
(let ((anon264_Then_correct  (=> (and (and (not (HasDirectPerm Mask@4 null (List_state l))) (= Heap@1 (MapType0Store Heap@0 null (List_state l) newVersion@0))) (and (= Heap@2 Heap@1) (= (ControlFlow 0 380) 376))) anon8_correct)))
(let ((anon6_correct  (=> (= Mask@4 (MapType1Store Mask@3 null (List_state l) (real_2_U (- (U_2_real (MapType1Select Mask@3 null (List_state l))) FullPerm)))) (and (=> (= (ControlFlow 0 382) 380) anon264_Then_correct) (=> (= (ControlFlow 0 382) 381) anon264_Else_correct)))))
(let ((anon263_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 385) 382)) anon6_correct)))
(let ((anon263_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 383) (- 0 384)) (<= FullPerm (U_2_real (MapType1Select Mask@3 null (List_state l))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@3 null (List_state l)))) (=> (= (ControlFlow 0 383) 382) anon6_correct))))))
(let ((anon261_Else_correct  (=> (and (and (and (and (not (= freshObj@0 null)) (not (U_2_bool (MapType0Select Heap@@35 freshObj@0 $allocated)))) (= Heap@0 (MapType0Store Heap@@35 freshObj@0 $allocated (bool_2_U true)))) (and (= Mask@1 (MapType1Store Mask@0 freshObj@0 Iterator_iteratee (real_2_U (+ (U_2_real (MapType1Select Mask@0 freshObj@0 Iterator_iteratee)) FullPerm)))) (= Mask@2 (MapType1Store Mask@1 freshObj@0 Iterator_current (real_2_U (+ (U_2_real (MapType1Select Mask@1 freshObj@0 Iterator_current)) FullPerm)))))) (and (and (= Mask@3 (MapType1Store Mask@2 freshObj@0 Iterator_last (real_2_U (+ (U_2_real (MapType1Select Mask@2 freshObj@0 Iterator_last)) FullPerm)))) (state Heap@0 Mask@3)) (and (|List_state#trigger| Heap@0 (List_state l)) (= (MapType0Select Heap@0 null (List_state l)) (CombineFrames (FrameFragment (MapType0Select Heap@0 l List_sentinel)) (MapType0Select Heap@0 null (Node_state (MapType0Select Heap@0 l List_sentinel)))))))) (and (=> (= (ControlFlow 0 386) 383) anon263_Then_correct) (=> (= (ControlFlow 0 386) 385) anon263_Else_correct)))))
(let ((anon0_correct  (=> (state Heap@@35 ZeroMask) (=> (and (= AssumeFunctionsAbove (- 0 1)) (U_2_bool (MapType0Select Heap@@35 l $allocated))) (=> (and (and (not (= l null)) (= Mask@0 (MapType1Store ZeroMask null (List_state l) (real_2_U (+ (U_2_real (MapType1Select ZeroMask null (List_state l))) FullPerm))))) (and (state Heap@@35 Mask@0) (state Heap@@35 Mask@0))) (and (=> (= (ControlFlow 0 390) 389) anon261_Then_correct) (=> (= (ControlFlow 0 390) 386) anon261_Else_correct)))))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 391) 390) anon0_correct)))
PreconditionGeneratedEntry_correct))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
))
(check-sat)
(pop 1)
; Valid
(get-info :rlimit)
