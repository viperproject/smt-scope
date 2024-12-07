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
(declare-fun Worker__input () T@U)
(declare-fun Worker__output () T@U)
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
(declare-fun state (T@U T@U) Bool)
(declare-fun MapType1Type (T@T T@T) T@T)
(declare-fun GoodMask (T@U) Bool)
(declare-fun MapType1TypeInv0 (T@T) T@T)
(declare-fun MapType1TypeInv1 (T@T) T@T)
(declare-fun MapType1Select (T@U T@U T@U) T@U)
(declare-fun MapType1Store (T@U T@U T@U T@U) T@U)
(declare-fun Thread__joinToken (T@U Real) T@U)
(declare-fun IsPredicateField (T@U) Bool)
(declare-fun PredicateType_Thread__joinTokenType () T@T)
(declare-fun FrameTypeType () T@T)
(declare-fun Thread__preFork (T@U Real) T@U)
(declare-fun PredicateType_Thread__preForkType () T@T)
(declare-fun Thread__postJoin (T@U Real) T@U)
(declare-fun PredicateType_Thread__postJoinType () T@T)
(declare-fun Thread__joinToken_at_Thread (T@U Real) T@U)
(declare-fun PredicateType_Thread__joinToken_at_ThreadType () T@T)
(declare-fun Thread__preFork_at_Thread (T@U Real) T@U)
(declare-fun PredicateType_Thread__preFork_at_ThreadType () T@T)
(declare-fun Thread__postJoin_at_Thread (T@U Real) T@U)
(declare-fun PredicateType_Thread__postJoin_at_ThreadType () T@T)
(declare-fun Worker__joinToken (T@U Real) T@U)
(declare-fun PredicateType_Worker__joinTokenType () T@T)
(declare-fun Worker__joinToken_at_Worker (T@U Real) T@U)
(declare-fun PredicateType_Worker__joinToken_at_WorkerType () T@T)
(declare-fun Worker__preFork (T@U Real) T@U)
(declare-fun PredicateType_Worker__preForkType () T@T)
(declare-fun Worker__postJoin (T@U Real) T@U)
(declare-fun PredicateType_Worker__postJoinType () T@T)
(declare-fun Worker__joinToken_at_Thread (T@U Real) T@U)
(declare-fun PredicateType_Worker__joinToken_at_ThreadType () T@T)
(declare-fun Worker__preFork_at_Thread (T@U Real) T@U)
(declare-fun PredicateType_Worker__preFork_at_ThreadType () T@T)
(declare-fun Worker__postJoin_at_Thread (T@U Real) T@U)
(declare-fun PredicateType_Worker__postJoin_at_ThreadType () T@T)
(declare-fun Worker__preFork_at_Worker (T@U Real) T@U)
(declare-fun PredicateType_Worker__preFork_at_WorkerType () T@T)
(declare-fun Worker__postJoin_at_Worker (T@U Real) T@U)
(declare-fun PredicateType_Worker__postJoin_at_WorkerType () T@T)
(declare-fun |Thread__joinToken#trigger| (T@U T@U) Bool)
(declare-fun |Thread__joinToken#everUsed| (T@U) Bool)
(declare-fun |Thread__preFork#trigger| (T@U T@U) Bool)
(declare-fun |Thread__preFork#everUsed| (T@U) Bool)
(declare-fun |Thread__postJoin#trigger| (T@U T@U) Bool)
(declare-fun |Thread__postJoin#everUsed| (T@U) Bool)
(declare-fun |Thread__joinToken_at_Thread#trigger| (T@U T@U) Bool)
(declare-fun |Thread__joinToken_at_Thread#everUsed| (T@U) Bool)
(declare-fun |Thread__preFork_at_Thread#trigger| (T@U T@U) Bool)
(declare-fun |Thread__preFork_at_Thread#everUsed| (T@U) Bool)
(declare-fun |Thread__postJoin_at_Thread#trigger| (T@U T@U) Bool)
(declare-fun |Thread__postJoin_at_Thread#everUsed| (T@U) Bool)
(declare-fun |Worker__joinToken#trigger| (T@U T@U) Bool)
(declare-fun |Worker__joinToken#everUsed| (T@U) Bool)
(declare-fun |Worker__joinToken_at_Worker#trigger| (T@U T@U) Bool)
(declare-fun |Worker__joinToken_at_Worker#everUsed| (T@U) Bool)
(declare-fun |Worker__preFork#trigger| (T@U T@U) Bool)
(declare-fun |Worker__preFork#everUsed| (T@U) Bool)
(declare-fun |Worker__postJoin#trigger| (T@U T@U) Bool)
(declare-fun |Worker__postJoin#everUsed| (T@U) Bool)
(declare-fun |Worker__joinToken_at_Thread#trigger| (T@U T@U) Bool)
(declare-fun |Worker__joinToken_at_Thread#everUsed| (T@U) Bool)
(declare-fun |Worker__preFork_at_Thread#trigger| (T@U T@U) Bool)
(declare-fun |Worker__preFork_at_Thread#everUsed| (T@U) Bool)
(declare-fun |Worker__postJoin_at_Thread#trigger| (T@U T@U) Bool)
(declare-fun |Worker__postJoin_at_Thread#everUsed| (T@U) Bool)
(declare-fun |Worker__preFork_at_Worker#trigger| (T@U T@U) Bool)
(declare-fun |Worker__preFork_at_Worker#everUsed| (T@U) Bool)
(declare-fun |Worker__postJoin_at_Worker#trigger| (T@U T@U) Bool)
(declare-fun |Worker__postJoin_at_Worker#everUsed| (T@U) Bool)
(declare-fun IdenticalOnKnownLocations (T@U T@U T@U) Bool)
(declare-fun null () T@U)
(declare-fun PredicateMaskField (T@U) T@U)
(declare-fun HasDirectPerm (T@U T@U T@U) Bool)
(declare-fun IsWandField (T@U) Bool)
(declare-fun WandMaskField (T@U) T@U)
(declare-fun Thread__is_a_Thread (T@U) T@U)
(declare-fun PredicateType_Thread__is_a_ThreadType () T@T)
(declare-fun Thread__instance_of_Thread (T@U) T@U)
(declare-fun PredicateType_Thread__instance_of_ThreadType () T@T)
(declare-fun Worker__is_a_Worker (T@U) T@U)
(declare-fun PredicateType_Worker__is_a_WorkerType () T@T)
(declare-fun Worker__instance_of_Worker (T@U) T@U)
(declare-fun PredicateType_Worker__instance_of_WorkerType () T@T)
(declare-fun Worker__is_a_Thread (T@U) T@U)
(declare-fun PredicateType_Worker__is_a_ThreadType () T@T)
(declare-fun Worker__instance_of_Thread (T@U) T@U)
(declare-fun PredicateType_Worker__instance_of_ThreadType () T@T)
(declare-fun |Thread__is_a_Thread#trigger| (T@U T@U) Bool)
(declare-fun |Thread__is_a_Thread#everUsed| (T@U) Bool)
(declare-fun |Thread__instance_of_Thread#trigger| (T@U T@U) Bool)
(declare-fun |Thread__instance_of_Thread#everUsed| (T@U) Bool)
(declare-fun |Worker__is_a_Worker#trigger| (T@U T@U) Bool)
(declare-fun |Worker__is_a_Worker#everUsed| (T@U) Bool)
(declare-fun |Worker__instance_of_Worker#trigger| (T@U T@U) Bool)
(declare-fun |Worker__instance_of_Worker#everUsed| (T@U) Bool)
(declare-fun |Worker__is_a_Thread#trigger| (T@U T@U) Bool)
(declare-fun |Worker__is_a_Thread#everUsed| (T@U) Bool)
(declare-fun |Worker__instance_of_Thread#trigger| (T@U T@U) Bool)
(declare-fun |Worker__instance_of_Thread#everUsed| (T@U) Bool)
(declare-fun |Thread__joinToken#sm| (T@U Real) T@U)
(declare-fun |Thread__preFork#sm| (T@U Real) T@U)
(declare-fun |Thread__postJoin#sm| (T@U Real) T@U)
(declare-fun |Thread__joinToken_at_Thread#sm| (T@U Real) T@U)
(declare-fun |Thread__preFork_at_Thread#sm| (T@U Real) T@U)
(declare-fun |Thread__postJoin_at_Thread#sm| (T@U Real) T@U)
(declare-fun |Worker__joinToken#sm| (T@U Real) T@U)
(declare-fun |Worker__joinToken_at_Worker#sm| (T@U Real) T@U)
(declare-fun |Worker__preFork#sm| (T@U Real) T@U)
(declare-fun |Worker__postJoin#sm| (T@U Real) T@U)
(declare-fun |Worker__joinToken_at_Thread#sm| (T@U Real) T@U)
(declare-fun |Worker__preFork_at_Thread#sm| (T@U Real) T@U)
(declare-fun |Worker__postJoin_at_Thread#sm| (T@U Real) T@U)
(declare-fun |Worker__preFork_at_Worker#sm| (T@U Real) T@U)
(declare-fun |Worker__postJoin_at_Worker#sm| (T@U Real) T@U)
(declare-fun |Thread__is_a_Thread#sm| (T@U) T@U)
(declare-fun |Thread__instance_of_Thread#sm| (T@U) T@U)
(declare-fun |Worker__is_a_Worker#sm| (T@U) T@U)
(declare-fun |Worker__instance_of_Worker#sm| (T@U) T@U)
(declare-fun |Worker__is_a_Thread#sm| (T@U) T@U)
(declare-fun |Worker__instance_of_Thread#sm| (T@U) T@U)
(declare-fun dummyHeap () T@U)
(declare-fun ZeroMask () T@U)
(declare-fun InsidePredicate (T@U T@U T@U T@U) Bool)
(declare-fun sumMask (T@U T@U T@U) Bool)
(declare-fun ConditionalFrame (Real T@U) T@U)
(declare-fun EmptyFrame () T@U)
(declare-fun NoPerm () Real)
(declare-fun instanceof (T@U T@U) Bool)
(declare-fun class_Object () T@U)
(declare-fun TYPEDomainTypeType () T@T)
(declare-fun getPredWandId (T@U) Int)
(declare-fun FullPerm () Real)
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
))) (= (Ctor NormalFieldType) 7)) (= (type $allocated) (FieldType NormalFieldType boolType))) (= (type Worker__input) (FieldType NormalFieldType intType))) (= (type Worker__output) (FieldType NormalFieldType intType))))
(assert (distinct $allocated Worker__input Worker__output)
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
(assert  (and (and (= (Ctor PredicateType_Thread__joinTokenType) 11) (= (Ctor FrameTypeType) 12)) (forall ((arg0@@23 T@U) (arg1@@9 Real) ) (! (= (type (Thread__joinToken arg0@@23 arg1@@9)) (FieldType PredicateType_Thread__joinTokenType FrameTypeType))
 :qid |funType:Thread__joinToken|
 :pattern ( (Thread__joinToken arg0@@23 arg1@@9))
))))
(assert (forall ((diz T@U) (p_1 Real) ) (!  (=> (= (type diz) RefType) (IsPredicateField (Thread__joinToken diz p_1)))
 :qid |stdinbpl.298:15|
 :skolemid |36|
 :pattern ( (Thread__joinToken diz p_1))
)))
(assert  (and (= (Ctor PredicateType_Thread__preForkType) 13) (forall ((arg0@@24 T@U) (arg1@@10 Real) ) (! (= (type (Thread__preFork arg0@@24 arg1@@10)) (FieldType PredicateType_Thread__preForkType FrameTypeType))
 :qid |funType:Thread__preFork|
 :pattern ( (Thread__preFork arg0@@24 arg1@@10))
))))
(assert (forall ((diz@@0 T@U) (p_1@@0 Real) ) (!  (=> (= (type diz@@0) RefType) (IsPredicateField (Thread__preFork diz@@0 p_1@@0)))
 :qid |stdinbpl.333:15|
 :skolemid |42|
 :pattern ( (Thread__preFork diz@@0 p_1@@0))
)))
(assert  (and (= (Ctor PredicateType_Thread__postJoinType) 14) (forall ((arg0@@25 T@U) (arg1@@11 Real) ) (! (= (type (Thread__postJoin arg0@@25 arg1@@11)) (FieldType PredicateType_Thread__postJoinType FrameTypeType))
 :qid |funType:Thread__postJoin|
 :pattern ( (Thread__postJoin arg0@@25 arg1@@11))
))))
(assert (forall ((diz@@1 T@U) (p_1@@1 Real) ) (!  (=> (= (type diz@@1) RefType) (IsPredicateField (Thread__postJoin diz@@1 p_1@@1)))
 :qid |stdinbpl.368:15|
 :skolemid |48|
 :pattern ( (Thread__postJoin diz@@1 p_1@@1))
)))
(assert  (and (= (Ctor PredicateType_Thread__joinToken_at_ThreadType) 15) (forall ((arg0@@26 T@U) (arg1@@12 Real) ) (! (= (type (Thread__joinToken_at_Thread arg0@@26 arg1@@12)) (FieldType PredicateType_Thread__joinToken_at_ThreadType FrameTypeType))
 :qid |funType:Thread__joinToken_at_Thread|
 :pattern ( (Thread__joinToken_at_Thread arg0@@26 arg1@@12))
))))
(assert (forall ((diz@@2 T@U) (p_1@@2 Real) ) (!  (=> (= (type diz@@2) RefType) (IsPredicateField (Thread__joinToken_at_Thread diz@@2 p_1@@2)))
 :qid |stdinbpl.403:15|
 :skolemid |54|
 :pattern ( (Thread__joinToken_at_Thread diz@@2 p_1@@2))
)))
(assert  (and (= (Ctor PredicateType_Thread__preFork_at_ThreadType) 16) (forall ((arg0@@27 T@U) (arg1@@13 Real) ) (! (= (type (Thread__preFork_at_Thread arg0@@27 arg1@@13)) (FieldType PredicateType_Thread__preFork_at_ThreadType FrameTypeType))
 :qid |funType:Thread__preFork_at_Thread|
 :pattern ( (Thread__preFork_at_Thread arg0@@27 arg1@@13))
))))
(assert (forall ((diz@@3 T@U) (p_1@@3 Real) ) (!  (=> (= (type diz@@3) RefType) (IsPredicateField (Thread__preFork_at_Thread diz@@3 p_1@@3)))
 :qid |stdinbpl.438:15|
 :skolemid |60|
 :pattern ( (Thread__preFork_at_Thread diz@@3 p_1@@3))
)))
(assert  (and (= (Ctor PredicateType_Thread__postJoin_at_ThreadType) 17) (forall ((arg0@@28 T@U) (arg1@@14 Real) ) (! (= (type (Thread__postJoin_at_Thread arg0@@28 arg1@@14)) (FieldType PredicateType_Thread__postJoin_at_ThreadType FrameTypeType))
 :qid |funType:Thread__postJoin_at_Thread|
 :pattern ( (Thread__postJoin_at_Thread arg0@@28 arg1@@14))
))))
(assert (forall ((diz@@4 T@U) (p_1@@4 Real) ) (!  (=> (= (type diz@@4) RefType) (IsPredicateField (Thread__postJoin_at_Thread diz@@4 p_1@@4)))
 :qid |stdinbpl.486:15|
 :skolemid |66|
 :pattern ( (Thread__postJoin_at_Thread diz@@4 p_1@@4))
)))
(assert  (and (= (Ctor PredicateType_Worker__joinTokenType) 18) (forall ((arg0@@29 T@U) (arg1@@15 Real) ) (! (= (type (Worker__joinToken arg0@@29 arg1@@15)) (FieldType PredicateType_Worker__joinTokenType FrameTypeType))
 :qid |funType:Worker__joinToken|
 :pattern ( (Worker__joinToken arg0@@29 arg1@@15))
))))
(assert (forall ((diz@@5 T@U) (p_1@@5 Real) ) (!  (=> (= (type diz@@5) RefType) (IsPredicateField (Worker__joinToken diz@@5 p_1@@5)))
 :qid |stdinbpl.674:15|
 :skolemid |96|
 :pattern ( (Worker__joinToken diz@@5 p_1@@5))
)))
(assert  (and (= (Ctor PredicateType_Worker__joinToken_at_WorkerType) 19) (forall ((arg0@@30 T@U) (arg1@@16 Real) ) (! (= (type (Worker__joinToken_at_Worker arg0@@30 arg1@@16)) (FieldType PredicateType_Worker__joinToken_at_WorkerType FrameTypeType))
 :qid |funType:Worker__joinToken_at_Worker|
 :pattern ( (Worker__joinToken_at_Worker arg0@@30 arg1@@16))
))))
(assert (forall ((diz@@6 T@U) (p_1@@6 Real) ) (!  (=> (= (type diz@@6) RefType) (IsPredicateField (Worker__joinToken_at_Worker diz@@6 p_1@@6)))
 :qid |stdinbpl.709:15|
 :skolemid |102|
 :pattern ( (Worker__joinToken_at_Worker diz@@6 p_1@@6))
)))
(assert  (and (= (Ctor PredicateType_Worker__preForkType) 20) (forall ((arg0@@31 T@U) (arg1@@17 Real) ) (! (= (type (Worker__preFork arg0@@31 arg1@@17)) (FieldType PredicateType_Worker__preForkType FrameTypeType))
 :qid |funType:Worker__preFork|
 :pattern ( (Worker__preFork arg0@@31 arg1@@17))
))))
(assert (forall ((diz@@7 T@U) (p_1@@7 Real) ) (!  (=> (= (type diz@@7) RefType) (IsPredicateField (Worker__preFork diz@@7 p_1@@7)))
 :qid |stdinbpl.761:15|
 :skolemid |108|
 :pattern ( (Worker__preFork diz@@7 p_1@@7))
)))
(assert  (and (= (Ctor PredicateType_Worker__postJoinType) 21) (forall ((arg0@@32 T@U) (arg1@@18 Real) ) (! (= (type (Worker__postJoin arg0@@32 arg1@@18)) (FieldType PredicateType_Worker__postJoinType FrameTypeType))
 :qid |funType:Worker__postJoin|
 :pattern ( (Worker__postJoin arg0@@32 arg1@@18))
))))
(assert (forall ((diz@@8 T@U) (p_1@@8 Real) ) (!  (=> (= (type diz@@8) RefType) (IsPredicateField (Worker__postJoin diz@@8 p_1@@8)))
 :qid |stdinbpl.796:15|
 :skolemid |114|
 :pattern ( (Worker__postJoin diz@@8 p_1@@8))
)))
(assert  (and (= (Ctor PredicateType_Worker__joinToken_at_ThreadType) 22) (forall ((arg0@@33 T@U) (arg1@@19 Real) ) (! (= (type (Worker__joinToken_at_Thread arg0@@33 arg1@@19)) (FieldType PredicateType_Worker__joinToken_at_ThreadType FrameTypeType))
 :qid |funType:Worker__joinToken_at_Thread|
 :pattern ( (Worker__joinToken_at_Thread arg0@@33 arg1@@19))
))))
(assert (forall ((diz@@9 T@U) (p_1@@9 Real) ) (!  (=> (= (type diz@@9) RefType) (IsPredicateField (Worker__joinToken_at_Thread diz@@9 p_1@@9)))
 :qid |stdinbpl.831:15|
 :skolemid |120|
 :pattern ( (Worker__joinToken_at_Thread diz@@9 p_1@@9))
)))
(assert  (and (= (Ctor PredicateType_Worker__preFork_at_ThreadType) 23) (forall ((arg0@@34 T@U) (arg1@@20 Real) ) (! (= (type (Worker__preFork_at_Thread arg0@@34 arg1@@20)) (FieldType PredicateType_Worker__preFork_at_ThreadType FrameTypeType))
 :qid |funType:Worker__preFork_at_Thread|
 :pattern ( (Worker__preFork_at_Thread arg0@@34 arg1@@20))
))))
(assert (forall ((diz@@10 T@U) (p_1@@10 Real) ) (!  (=> (= (type diz@@10) RefType) (IsPredicateField (Worker__preFork_at_Thread diz@@10 p_1@@10)))
 :qid |stdinbpl.866:15|
 :skolemid |126|
 :pattern ( (Worker__preFork_at_Thread diz@@10 p_1@@10))
)))
(assert  (and (= (Ctor PredicateType_Worker__postJoin_at_ThreadType) 24) (forall ((arg0@@35 T@U) (arg1@@21 Real) ) (! (= (type (Worker__postJoin_at_Thread arg0@@35 arg1@@21)) (FieldType PredicateType_Worker__postJoin_at_ThreadType FrameTypeType))
 :qid |funType:Worker__postJoin_at_Thread|
 :pattern ( (Worker__postJoin_at_Thread arg0@@35 arg1@@21))
))))
(assert (forall ((diz@@11 T@U) (p_1@@11 Real) ) (!  (=> (= (type diz@@11) RefType) (IsPredicateField (Worker__postJoin_at_Thread diz@@11 p_1@@11)))
 :qid |stdinbpl.914:15|
 :skolemid |132|
 :pattern ( (Worker__postJoin_at_Thread diz@@11 p_1@@11))
)))
(assert  (and (= (Ctor PredicateType_Worker__preFork_at_WorkerType) 25) (forall ((arg0@@36 T@U) (arg1@@22 Real) ) (! (= (type (Worker__preFork_at_Worker arg0@@36 arg1@@22)) (FieldType PredicateType_Worker__preFork_at_WorkerType FrameTypeType))
 :qid |funType:Worker__preFork_at_Worker|
 :pattern ( (Worker__preFork_at_Worker arg0@@36 arg1@@22))
))))
(assert (forall ((diz@@12 T@U) (p_1@@12 Real) ) (!  (=> (= (type diz@@12) RefType) (IsPredicateField (Worker__preFork_at_Worker diz@@12 p_1@@12)))
 :qid |stdinbpl.962:15|
 :skolemid |138|
 :pattern ( (Worker__preFork_at_Worker diz@@12 p_1@@12))
)))
(assert  (and (= (Ctor PredicateType_Worker__postJoin_at_WorkerType) 26) (forall ((arg0@@37 T@U) (arg1@@23 Real) ) (! (= (type (Worker__postJoin_at_Worker arg0@@37 arg1@@23)) (FieldType PredicateType_Worker__postJoin_at_WorkerType FrameTypeType))
 :qid |funType:Worker__postJoin_at_Worker|
 :pattern ( (Worker__postJoin_at_Worker arg0@@37 arg1@@23))
))))
(assert (forall ((diz@@13 T@U) (p_1@@13 Real) ) (!  (=> (= (type diz@@13) RefType) (IsPredicateField (Worker__postJoin_at_Worker diz@@13 p_1@@13)))
 :qid |stdinbpl.1028:15|
 :skolemid |144|
 :pattern ( (Worker__postJoin_at_Worker diz@@13 p_1@@13))
)))
(assert (forall ((Heap@@0 T@U) (diz@@14 T@U) (p_1@@14 Real) ) (!  (=> (and (= (type Heap@@0) (MapType0Type RefType)) (= (type diz@@14) RefType)) (|Thread__joinToken#everUsed| (Thread__joinToken diz@@14 p_1@@14)))
 :qid |stdinbpl.317:15|
 :skolemid |40|
 :pattern ( (|Thread__joinToken#trigger| Heap@@0 (Thread__joinToken diz@@14 p_1@@14)))
)))
(assert (forall ((Heap@@1 T@U) (diz@@15 T@U) (p_1@@15 Real) ) (!  (=> (and (= (type Heap@@1) (MapType0Type RefType)) (= (type diz@@15) RefType)) (|Thread__preFork#everUsed| (Thread__preFork diz@@15 p_1@@15)))
 :qid |stdinbpl.352:15|
 :skolemid |46|
 :pattern ( (|Thread__preFork#trigger| Heap@@1 (Thread__preFork diz@@15 p_1@@15)))
)))
(assert (forall ((Heap@@2 T@U) (diz@@16 T@U) (p_1@@16 Real) ) (!  (=> (and (= (type Heap@@2) (MapType0Type RefType)) (= (type diz@@16) RefType)) (|Thread__postJoin#everUsed| (Thread__postJoin diz@@16 p_1@@16)))
 :qid |stdinbpl.387:15|
 :skolemid |52|
 :pattern ( (|Thread__postJoin#trigger| Heap@@2 (Thread__postJoin diz@@16 p_1@@16)))
)))
(assert (forall ((Heap@@3 T@U) (diz@@17 T@U) (p_1@@17 Real) ) (!  (=> (and (= (type Heap@@3) (MapType0Type RefType)) (= (type diz@@17) RefType)) (|Thread__joinToken_at_Thread#everUsed| (Thread__joinToken_at_Thread diz@@17 p_1@@17)))
 :qid |stdinbpl.422:15|
 :skolemid |58|
 :pattern ( (|Thread__joinToken_at_Thread#trigger| Heap@@3 (Thread__joinToken_at_Thread diz@@17 p_1@@17)))
)))
(assert (forall ((Heap@@4 T@U) (diz@@18 T@U) (p_1@@18 Real) ) (!  (=> (and (= (type Heap@@4) (MapType0Type RefType)) (= (type diz@@18) RefType)) (|Thread__preFork_at_Thread#everUsed| (Thread__preFork_at_Thread diz@@18 p_1@@18)))
 :qid |stdinbpl.457:15|
 :skolemid |64|
 :pattern ( (|Thread__preFork_at_Thread#trigger| Heap@@4 (Thread__preFork_at_Thread diz@@18 p_1@@18)))
)))
(assert (forall ((Heap@@5 T@U) (diz@@19 T@U) (p_1@@19 Real) ) (!  (=> (and (= (type Heap@@5) (MapType0Type RefType)) (= (type diz@@19) RefType)) (|Thread__postJoin_at_Thread#everUsed| (Thread__postJoin_at_Thread diz@@19 p_1@@19)))
 :qid |stdinbpl.505:15|
 :skolemid |70|
 :pattern ( (|Thread__postJoin_at_Thread#trigger| Heap@@5 (Thread__postJoin_at_Thread diz@@19 p_1@@19)))
)))
(assert (forall ((Heap@@6 T@U) (diz@@20 T@U) (p_1@@20 Real) ) (!  (=> (and (= (type Heap@@6) (MapType0Type RefType)) (= (type diz@@20) RefType)) (|Worker__joinToken#everUsed| (Worker__joinToken diz@@20 p_1@@20)))
 :qid |stdinbpl.693:15|
 :skolemid |100|
 :pattern ( (|Worker__joinToken#trigger| Heap@@6 (Worker__joinToken diz@@20 p_1@@20)))
)))
(assert (forall ((Heap@@7 T@U) (diz@@21 T@U) (p_1@@21 Real) ) (!  (=> (and (= (type Heap@@7) (MapType0Type RefType)) (= (type diz@@21) RefType)) (|Worker__joinToken_at_Worker#everUsed| (Worker__joinToken_at_Worker diz@@21 p_1@@21)))
 :qid |stdinbpl.728:15|
 :skolemid |106|
 :pattern ( (|Worker__joinToken_at_Worker#trigger| Heap@@7 (Worker__joinToken_at_Worker diz@@21 p_1@@21)))
)))
(assert (forall ((Heap@@8 T@U) (diz@@22 T@U) (p_1@@22 Real) ) (!  (=> (and (= (type Heap@@8) (MapType0Type RefType)) (= (type diz@@22) RefType)) (|Worker__preFork#everUsed| (Worker__preFork diz@@22 p_1@@22)))
 :qid |stdinbpl.780:15|
 :skolemid |112|
 :pattern ( (|Worker__preFork#trigger| Heap@@8 (Worker__preFork diz@@22 p_1@@22)))
)))
(assert (forall ((Heap@@9 T@U) (diz@@23 T@U) (p_1@@23 Real) ) (!  (=> (and (= (type Heap@@9) (MapType0Type RefType)) (= (type diz@@23) RefType)) (|Worker__postJoin#everUsed| (Worker__postJoin diz@@23 p_1@@23)))
 :qid |stdinbpl.815:15|
 :skolemid |118|
 :pattern ( (|Worker__postJoin#trigger| Heap@@9 (Worker__postJoin diz@@23 p_1@@23)))
)))
(assert (forall ((Heap@@10 T@U) (diz@@24 T@U) (p_1@@24 Real) ) (!  (=> (and (= (type Heap@@10) (MapType0Type RefType)) (= (type diz@@24) RefType)) (|Worker__joinToken_at_Thread#everUsed| (Worker__joinToken_at_Thread diz@@24 p_1@@24)))
 :qid |stdinbpl.850:15|
 :skolemid |124|
 :pattern ( (|Worker__joinToken_at_Thread#trigger| Heap@@10 (Worker__joinToken_at_Thread diz@@24 p_1@@24)))
)))
(assert (forall ((Heap@@11 T@U) (diz@@25 T@U) (p_1@@25 Real) ) (!  (=> (and (= (type Heap@@11) (MapType0Type RefType)) (= (type diz@@25) RefType)) (|Worker__preFork_at_Thread#everUsed| (Worker__preFork_at_Thread diz@@25 p_1@@25)))
 :qid |stdinbpl.885:15|
 :skolemid |130|
 :pattern ( (|Worker__preFork_at_Thread#trigger| Heap@@11 (Worker__preFork_at_Thread diz@@25 p_1@@25)))
)))
(assert (forall ((Heap@@12 T@U) (diz@@26 T@U) (p_1@@26 Real) ) (!  (=> (and (= (type Heap@@12) (MapType0Type RefType)) (= (type diz@@26) RefType)) (|Worker__postJoin_at_Thread#everUsed| (Worker__postJoin_at_Thread diz@@26 p_1@@26)))
 :qid |stdinbpl.933:15|
 :skolemid |136|
 :pattern ( (|Worker__postJoin_at_Thread#trigger| Heap@@12 (Worker__postJoin_at_Thread diz@@26 p_1@@26)))
)))
(assert (forall ((Heap@@13 T@U) (diz@@27 T@U) (p_1@@27 Real) ) (!  (=> (and (= (type Heap@@13) (MapType0Type RefType)) (= (type diz@@27) RefType)) (|Worker__preFork_at_Worker#everUsed| (Worker__preFork_at_Worker diz@@27 p_1@@27)))
 :qid |stdinbpl.981:15|
 :skolemid |142|
 :pattern ( (|Worker__preFork_at_Worker#trigger| Heap@@13 (Worker__preFork_at_Worker diz@@27 p_1@@27)))
)))
(assert (forall ((Heap@@14 T@U) (diz@@28 T@U) (p_1@@28 Real) ) (!  (=> (and (= (type Heap@@14) (MapType0Type RefType)) (= (type diz@@28) RefType)) (|Worker__postJoin_at_Worker#everUsed| (Worker__postJoin_at_Worker diz@@28 p_1@@28)))
 :qid |stdinbpl.1047:15|
 :skolemid |148|
 :pattern ( (|Worker__postJoin_at_Worker#trigger| Heap@@14 (Worker__postJoin_at_Worker diz@@28 p_1@@28)))
)))
(assert  (and (= (type null) RefType) (forall ((arg0@@38 T@U) ) (! (let ((A (FieldTypeInv0 (type arg0@@38))))
(= (type (PredicateMaskField arg0@@38)) (FieldType A (MapType1Type RefType boolType))))
 :qid |funType:PredicateMaskField|
 :pattern ( (PredicateMaskField arg0@@38))
))))
(assert (forall ((Heap@@15 T@U) (ExhaleHeap T@U) (Mask@@0 T@U) (pm_f T@U) ) (! (let ((C (FieldTypeInv0 (type pm_f))))
 (=> (and (and (and (and (and (= (type Heap@@15) (MapType0Type RefType)) (= (type ExhaleHeap) (MapType0Type RefType))) (= (type Mask@@0) (MapType1Type RefType realType))) (= (type pm_f) (FieldType C FrameTypeType))) (IdenticalOnKnownLocations Heap@@15 ExhaleHeap Mask@@0)) (and (HasDirectPerm Mask@@0 null pm_f) (IsPredicateField pm_f))) (= (MapType0Select Heap@@15 null (PredicateMaskField pm_f)) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))))
 :qid |stdinbpl.47:19|
 :skolemid |2|
 :pattern ( (IdenticalOnKnownLocations Heap@@15 ExhaleHeap Mask@@0) (IsPredicateField pm_f) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))
)))
(assert (forall ((arg0@@39 T@U) ) (! (let ((A@@0 (FieldTypeInv0 (type arg0@@39))))
(= (type (WandMaskField arg0@@39)) (FieldType A@@0 (MapType1Type RefType boolType))))
 :qid |funType:WandMaskField|
 :pattern ( (WandMaskField arg0@@39))
)))
(assert (forall ((Heap@@16 T@U) (ExhaleHeap@@0 T@U) (Mask@@1 T@U) (pm_f@@0 T@U) ) (! (let ((C@@0 (FieldTypeInv0 (type pm_f@@0))))
 (=> (and (and (and (and (and (= (type Heap@@16) (MapType0Type RefType)) (= (type ExhaleHeap@@0) (MapType0Type RefType))) (= (type Mask@@1) (MapType1Type RefType realType))) (= (type pm_f@@0) (FieldType C@@0 FrameTypeType))) (IdenticalOnKnownLocations Heap@@16 ExhaleHeap@@0 Mask@@1)) (and (HasDirectPerm Mask@@1 null pm_f@@0) (IsWandField pm_f@@0))) (= (MapType0Select Heap@@16 null (WandMaskField pm_f@@0)) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))))
 :qid |stdinbpl.60:19|
 :skolemid |5|
 :pattern ( (IdenticalOnKnownLocations Heap@@16 ExhaleHeap@@0 Mask@@1) (IsWandField pm_f@@0) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))
)))
(assert  (and (= (Ctor PredicateType_Thread__is_a_ThreadType) 27) (forall ((arg0@@40 T@U) ) (! (= (type (Thread__is_a_Thread arg0@@40)) (FieldType PredicateType_Thread__is_a_ThreadType FrameTypeType))
 :qid |funType:Thread__is_a_Thread|
 :pattern ( (Thread__is_a_Thread arg0@@40))
))))
(assert (forall ((diz@@29 T@U) ) (!  (=> (= (type diz@@29) RefType) (IsPredicateField (Thread__is_a_Thread diz@@29)))
 :qid |stdinbpl.228:15|
 :skolemid |24|
 :pattern ( (Thread__is_a_Thread diz@@29))
)))
(assert  (and (= (Ctor PredicateType_Thread__instance_of_ThreadType) 28) (forall ((arg0@@41 T@U) ) (! (= (type (Thread__instance_of_Thread arg0@@41)) (FieldType PredicateType_Thread__instance_of_ThreadType FrameTypeType))
 :qid |funType:Thread__instance_of_Thread|
 :pattern ( (Thread__instance_of_Thread arg0@@41))
))))
(assert (forall ((diz@@30 T@U) ) (!  (=> (= (type diz@@30) RefType) (IsPredicateField (Thread__instance_of_Thread diz@@30)))
 :qid |stdinbpl.263:15|
 :skolemid |30|
 :pattern ( (Thread__instance_of_Thread diz@@30))
)))
(assert  (and (= (Ctor PredicateType_Worker__is_a_WorkerType) 29) (forall ((arg0@@42 T@U) ) (! (= (type (Worker__is_a_Worker arg0@@42)) (FieldType PredicateType_Worker__is_a_WorkerType FrameTypeType))
 :qid |funType:Worker__is_a_Worker|
 :pattern ( (Worker__is_a_Worker arg0@@42))
))))
(assert (forall ((diz@@31 T@U) ) (!  (=> (= (type diz@@31) RefType) (IsPredicateField (Worker__is_a_Worker diz@@31)))
 :qid |stdinbpl.534:15|
 :skolemid |72|
 :pattern ( (Worker__is_a_Worker diz@@31))
)))
(assert  (and (= (Ctor PredicateType_Worker__instance_of_WorkerType) 30) (forall ((arg0@@43 T@U) ) (! (= (type (Worker__instance_of_Worker arg0@@43)) (FieldType PredicateType_Worker__instance_of_WorkerType FrameTypeType))
 :qid |funType:Worker__instance_of_Worker|
 :pattern ( (Worker__instance_of_Worker arg0@@43))
))))
(assert (forall ((diz@@32 T@U) ) (!  (=> (= (type diz@@32) RefType) (IsPredicateField (Worker__instance_of_Worker diz@@32)))
 :qid |stdinbpl.569:15|
 :skolemid |78|
 :pattern ( (Worker__instance_of_Worker diz@@32))
)))
(assert  (and (= (Ctor PredicateType_Worker__is_a_ThreadType) 31) (forall ((arg0@@44 T@U) ) (! (= (type (Worker__is_a_Thread arg0@@44)) (FieldType PredicateType_Worker__is_a_ThreadType FrameTypeType))
 :qid |funType:Worker__is_a_Thread|
 :pattern ( (Worker__is_a_Thread arg0@@44))
))))
(assert (forall ((diz@@33 T@U) ) (!  (=> (= (type diz@@33) RefType) (IsPredicateField (Worker__is_a_Thread diz@@33)))
 :qid |stdinbpl.604:15|
 :skolemid |84|
 :pattern ( (Worker__is_a_Thread diz@@33))
)))
(assert  (and (= (Ctor PredicateType_Worker__instance_of_ThreadType) 32) (forall ((arg0@@45 T@U) ) (! (= (type (Worker__instance_of_Thread arg0@@45)) (FieldType PredicateType_Worker__instance_of_ThreadType FrameTypeType))
 :qid |funType:Worker__instance_of_Thread|
 :pattern ( (Worker__instance_of_Thread arg0@@45))
))))
(assert (forall ((diz@@34 T@U) ) (!  (=> (= (type diz@@34) RefType) (IsPredicateField (Worker__instance_of_Thread diz@@34)))
 :qid |stdinbpl.639:15|
 :skolemid |90|
 :pattern ( (Worker__instance_of_Thread diz@@34))
)))
(assert (forall ((Heap@@17 T@U) (diz@@35 T@U) ) (!  (=> (and (= (type Heap@@17) (MapType0Type RefType)) (= (type diz@@35) RefType)) (|Thread__is_a_Thread#everUsed| (Thread__is_a_Thread diz@@35)))
 :qid |stdinbpl.247:15|
 :skolemid |28|
 :pattern ( (|Thread__is_a_Thread#trigger| Heap@@17 (Thread__is_a_Thread diz@@35)))
)))
(assert (forall ((Heap@@18 T@U) (diz@@36 T@U) ) (!  (=> (and (= (type Heap@@18) (MapType0Type RefType)) (= (type diz@@36) RefType)) (|Thread__instance_of_Thread#everUsed| (Thread__instance_of_Thread diz@@36)))
 :qid |stdinbpl.282:15|
 :skolemid |34|
 :pattern ( (|Thread__instance_of_Thread#trigger| Heap@@18 (Thread__instance_of_Thread diz@@36)))
)))
(assert (forall ((Heap@@19 T@U) (diz@@37 T@U) ) (!  (=> (and (= (type Heap@@19) (MapType0Type RefType)) (= (type diz@@37) RefType)) (|Worker__is_a_Worker#everUsed| (Worker__is_a_Worker diz@@37)))
 :qid |stdinbpl.553:15|
 :skolemid |76|
 :pattern ( (|Worker__is_a_Worker#trigger| Heap@@19 (Worker__is_a_Worker diz@@37)))
)))
(assert (forall ((Heap@@20 T@U) (diz@@38 T@U) ) (!  (=> (and (= (type Heap@@20) (MapType0Type RefType)) (= (type diz@@38) RefType)) (|Worker__instance_of_Worker#everUsed| (Worker__instance_of_Worker diz@@38)))
 :qid |stdinbpl.588:15|
 :skolemid |82|
 :pattern ( (|Worker__instance_of_Worker#trigger| Heap@@20 (Worker__instance_of_Worker diz@@38)))
)))
(assert (forall ((Heap@@21 T@U) (diz@@39 T@U) ) (!  (=> (and (= (type Heap@@21) (MapType0Type RefType)) (= (type diz@@39) RefType)) (|Worker__is_a_Thread#everUsed| (Worker__is_a_Thread diz@@39)))
 :qid |stdinbpl.623:15|
 :skolemid |88|
 :pattern ( (|Worker__is_a_Thread#trigger| Heap@@21 (Worker__is_a_Thread diz@@39)))
)))
(assert (forall ((Heap@@22 T@U) (diz@@40 T@U) ) (!  (=> (and (= (type Heap@@22) (MapType0Type RefType)) (= (type diz@@40) RefType)) (|Worker__instance_of_Thread#everUsed| (Worker__instance_of_Thread diz@@40)))
 :qid |stdinbpl.658:15|
 :skolemid |94|
 :pattern ( (|Worker__instance_of_Thread#trigger| Heap@@22 (Worker__instance_of_Thread diz@@40)))
)))
(assert (forall ((Heap@@23 T@U) (ExhaleHeap@@1 T@U) (Mask@@2 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@23) (MapType0Type RefType)) (= (type ExhaleHeap@@1) (MapType0Type RefType))) (= (type Mask@@2) (MapType1Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@23 ExhaleHeap@@1 Mask@@2)) (U_2_bool (MapType0Select Heap@@23 o_1 $allocated))) (U_2_bool (MapType0Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.73:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@23 ExhaleHeap@@1 Mask@@2) (MapType0Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert (forall ((diz@@41 T@U) (p_1@@29 Real) (diz2 T@U) (p2 Real) ) (!  (=> (and (and (= (type diz@@41) RefType) (= (type diz2) RefType)) (= (Thread__joinToken diz@@41 p_1@@29) (Thread__joinToken diz2 p2))) (and (= diz@@41 diz2) (= p_1@@29 p2)))
 :qid |stdinbpl.308:15|
 :skolemid |38|
 :pattern ( (Thread__joinToken diz@@41 p_1@@29) (Thread__joinToken diz2 p2))
)))
(assert (forall ((arg0@@46 T@U) (arg1@@24 Real) ) (! (= (type (|Thread__joinToken#sm| arg0@@46 arg1@@24)) (FieldType PredicateType_Thread__joinTokenType (MapType1Type RefType boolType)))
 :qid |funType:Thread__joinToken#sm|
 :pattern ( (|Thread__joinToken#sm| arg0@@46 arg1@@24))
)))
(assert (forall ((diz@@42 T@U) (p_1@@30 Real) (diz2@@0 T@U) (p2@@0 Real) ) (!  (=> (and (and (= (type diz@@42) RefType) (= (type diz2@@0) RefType)) (= (|Thread__joinToken#sm| diz@@42 p_1@@30) (|Thread__joinToken#sm| diz2@@0 p2@@0))) (and (= diz@@42 diz2@@0) (= p_1@@30 p2@@0)))
 :qid |stdinbpl.312:15|
 :skolemid |39|
 :pattern ( (|Thread__joinToken#sm| diz@@42 p_1@@30) (|Thread__joinToken#sm| diz2@@0 p2@@0))
)))
(assert (forall ((diz@@43 T@U) (p_1@@31 Real) (diz2@@1 T@U) (p2@@1 Real) ) (!  (=> (and (and (= (type diz@@43) RefType) (= (type diz2@@1) RefType)) (= (Thread__preFork diz@@43 p_1@@31) (Thread__preFork diz2@@1 p2@@1))) (and (= diz@@43 diz2@@1) (= p_1@@31 p2@@1)))
 :qid |stdinbpl.343:15|
 :skolemid |44|
 :pattern ( (Thread__preFork diz@@43 p_1@@31) (Thread__preFork diz2@@1 p2@@1))
)))
(assert (forall ((arg0@@47 T@U) (arg1@@25 Real) ) (! (= (type (|Thread__preFork#sm| arg0@@47 arg1@@25)) (FieldType PredicateType_Thread__preForkType (MapType1Type RefType boolType)))
 :qid |funType:Thread__preFork#sm|
 :pattern ( (|Thread__preFork#sm| arg0@@47 arg1@@25))
)))
(assert (forall ((diz@@44 T@U) (p_1@@32 Real) (diz2@@2 T@U) (p2@@2 Real) ) (!  (=> (and (and (= (type diz@@44) RefType) (= (type diz2@@2) RefType)) (= (|Thread__preFork#sm| diz@@44 p_1@@32) (|Thread__preFork#sm| diz2@@2 p2@@2))) (and (= diz@@44 diz2@@2) (= p_1@@32 p2@@2)))
 :qid |stdinbpl.347:15|
 :skolemid |45|
 :pattern ( (|Thread__preFork#sm| diz@@44 p_1@@32) (|Thread__preFork#sm| diz2@@2 p2@@2))
)))
(assert (forall ((diz@@45 T@U) (p_1@@33 Real) (diz2@@3 T@U) (p2@@3 Real) ) (!  (=> (and (and (= (type diz@@45) RefType) (= (type diz2@@3) RefType)) (= (Thread__postJoin diz@@45 p_1@@33) (Thread__postJoin diz2@@3 p2@@3))) (and (= diz@@45 diz2@@3) (= p_1@@33 p2@@3)))
 :qid |stdinbpl.378:15|
 :skolemid |50|
 :pattern ( (Thread__postJoin diz@@45 p_1@@33) (Thread__postJoin diz2@@3 p2@@3))
)))
(assert (forall ((arg0@@48 T@U) (arg1@@26 Real) ) (! (= (type (|Thread__postJoin#sm| arg0@@48 arg1@@26)) (FieldType PredicateType_Thread__postJoinType (MapType1Type RefType boolType)))
 :qid |funType:Thread__postJoin#sm|
 :pattern ( (|Thread__postJoin#sm| arg0@@48 arg1@@26))
)))
(assert (forall ((diz@@46 T@U) (p_1@@34 Real) (diz2@@4 T@U) (p2@@4 Real) ) (!  (=> (and (and (= (type diz@@46) RefType) (= (type diz2@@4) RefType)) (= (|Thread__postJoin#sm| diz@@46 p_1@@34) (|Thread__postJoin#sm| diz2@@4 p2@@4))) (and (= diz@@46 diz2@@4) (= p_1@@34 p2@@4)))
 :qid |stdinbpl.382:15|
 :skolemid |51|
 :pattern ( (|Thread__postJoin#sm| diz@@46 p_1@@34) (|Thread__postJoin#sm| diz2@@4 p2@@4))
)))
(assert (forall ((diz@@47 T@U) (p_1@@35 Real) (diz2@@5 T@U) (p2@@5 Real) ) (!  (=> (and (and (= (type diz@@47) RefType) (= (type diz2@@5) RefType)) (= (Thread__joinToken_at_Thread diz@@47 p_1@@35) (Thread__joinToken_at_Thread diz2@@5 p2@@5))) (and (= diz@@47 diz2@@5) (= p_1@@35 p2@@5)))
 :qid |stdinbpl.413:15|
 :skolemid |56|
 :pattern ( (Thread__joinToken_at_Thread diz@@47 p_1@@35) (Thread__joinToken_at_Thread diz2@@5 p2@@5))
)))
(assert (forall ((arg0@@49 T@U) (arg1@@27 Real) ) (! (= (type (|Thread__joinToken_at_Thread#sm| arg0@@49 arg1@@27)) (FieldType PredicateType_Thread__joinToken_at_ThreadType (MapType1Type RefType boolType)))
 :qid |funType:Thread__joinToken_at_Thread#sm|
 :pattern ( (|Thread__joinToken_at_Thread#sm| arg0@@49 arg1@@27))
)))
(assert (forall ((diz@@48 T@U) (p_1@@36 Real) (diz2@@6 T@U) (p2@@6 Real) ) (!  (=> (and (and (= (type diz@@48) RefType) (= (type diz2@@6) RefType)) (= (|Thread__joinToken_at_Thread#sm| diz@@48 p_1@@36) (|Thread__joinToken_at_Thread#sm| diz2@@6 p2@@6))) (and (= diz@@48 diz2@@6) (= p_1@@36 p2@@6)))
 :qid |stdinbpl.417:15|
 :skolemid |57|
 :pattern ( (|Thread__joinToken_at_Thread#sm| diz@@48 p_1@@36) (|Thread__joinToken_at_Thread#sm| diz2@@6 p2@@6))
)))
(assert (forall ((diz@@49 T@U) (p_1@@37 Real) (diz2@@7 T@U) (p2@@7 Real) ) (!  (=> (and (and (= (type diz@@49) RefType) (= (type diz2@@7) RefType)) (= (Thread__preFork_at_Thread diz@@49 p_1@@37) (Thread__preFork_at_Thread diz2@@7 p2@@7))) (and (= diz@@49 diz2@@7) (= p_1@@37 p2@@7)))
 :qid |stdinbpl.448:15|
 :skolemid |62|
 :pattern ( (Thread__preFork_at_Thread diz@@49 p_1@@37) (Thread__preFork_at_Thread diz2@@7 p2@@7))
)))
(assert (forall ((arg0@@50 T@U) (arg1@@28 Real) ) (! (= (type (|Thread__preFork_at_Thread#sm| arg0@@50 arg1@@28)) (FieldType PredicateType_Thread__preFork_at_ThreadType (MapType1Type RefType boolType)))
 :qid |funType:Thread__preFork_at_Thread#sm|
 :pattern ( (|Thread__preFork_at_Thread#sm| arg0@@50 arg1@@28))
)))
(assert (forall ((diz@@50 T@U) (p_1@@38 Real) (diz2@@8 T@U) (p2@@8 Real) ) (!  (=> (and (and (= (type diz@@50) RefType) (= (type diz2@@8) RefType)) (= (|Thread__preFork_at_Thread#sm| diz@@50 p_1@@38) (|Thread__preFork_at_Thread#sm| diz2@@8 p2@@8))) (and (= diz@@50 diz2@@8) (= p_1@@38 p2@@8)))
 :qid |stdinbpl.452:15|
 :skolemid |63|
 :pattern ( (|Thread__preFork_at_Thread#sm| diz@@50 p_1@@38) (|Thread__preFork_at_Thread#sm| diz2@@8 p2@@8))
)))
(assert (forall ((diz@@51 T@U) (p_1@@39 Real) (diz2@@9 T@U) (p2@@9 Real) ) (!  (=> (and (and (= (type diz@@51) RefType) (= (type diz2@@9) RefType)) (= (Thread__postJoin_at_Thread diz@@51 p_1@@39) (Thread__postJoin_at_Thread diz2@@9 p2@@9))) (and (= diz@@51 diz2@@9) (= p_1@@39 p2@@9)))
 :qid |stdinbpl.496:15|
 :skolemid |68|
 :pattern ( (Thread__postJoin_at_Thread diz@@51 p_1@@39) (Thread__postJoin_at_Thread diz2@@9 p2@@9))
)))
(assert (forall ((arg0@@51 T@U) (arg1@@29 Real) ) (! (= (type (|Thread__postJoin_at_Thread#sm| arg0@@51 arg1@@29)) (FieldType PredicateType_Thread__postJoin_at_ThreadType (MapType1Type RefType boolType)))
 :qid |funType:Thread__postJoin_at_Thread#sm|
 :pattern ( (|Thread__postJoin_at_Thread#sm| arg0@@51 arg1@@29))
)))
(assert (forall ((diz@@52 T@U) (p_1@@40 Real) (diz2@@10 T@U) (p2@@10 Real) ) (!  (=> (and (and (= (type diz@@52) RefType) (= (type diz2@@10) RefType)) (= (|Thread__postJoin_at_Thread#sm| diz@@52 p_1@@40) (|Thread__postJoin_at_Thread#sm| diz2@@10 p2@@10))) (and (= diz@@52 diz2@@10) (= p_1@@40 p2@@10)))
 :qid |stdinbpl.500:15|
 :skolemid |69|
 :pattern ( (|Thread__postJoin_at_Thread#sm| diz@@52 p_1@@40) (|Thread__postJoin_at_Thread#sm| diz2@@10 p2@@10))
)))
(assert (forall ((diz@@53 T@U) (p_1@@41 Real) (diz2@@11 T@U) (p2@@11 Real) ) (!  (=> (and (and (= (type diz@@53) RefType) (= (type diz2@@11) RefType)) (= (Worker__joinToken diz@@53 p_1@@41) (Worker__joinToken diz2@@11 p2@@11))) (and (= diz@@53 diz2@@11) (= p_1@@41 p2@@11)))
 :qid |stdinbpl.684:15|
 :skolemid |98|
 :pattern ( (Worker__joinToken diz@@53 p_1@@41) (Worker__joinToken diz2@@11 p2@@11))
)))
(assert (forall ((arg0@@52 T@U) (arg1@@30 Real) ) (! (= (type (|Worker__joinToken#sm| arg0@@52 arg1@@30)) (FieldType PredicateType_Worker__joinTokenType (MapType1Type RefType boolType)))
 :qid |funType:Worker__joinToken#sm|
 :pattern ( (|Worker__joinToken#sm| arg0@@52 arg1@@30))
)))
(assert (forall ((diz@@54 T@U) (p_1@@42 Real) (diz2@@12 T@U) (p2@@12 Real) ) (!  (=> (and (and (= (type diz@@54) RefType) (= (type diz2@@12) RefType)) (= (|Worker__joinToken#sm| diz@@54 p_1@@42) (|Worker__joinToken#sm| diz2@@12 p2@@12))) (and (= diz@@54 diz2@@12) (= p_1@@42 p2@@12)))
 :qid |stdinbpl.688:15|
 :skolemid |99|
 :pattern ( (|Worker__joinToken#sm| diz@@54 p_1@@42) (|Worker__joinToken#sm| diz2@@12 p2@@12))
)))
(assert (forall ((diz@@55 T@U) (p_1@@43 Real) (diz2@@13 T@U) (p2@@13 Real) ) (!  (=> (and (and (= (type diz@@55) RefType) (= (type diz2@@13) RefType)) (= (Worker__joinToken_at_Worker diz@@55 p_1@@43) (Worker__joinToken_at_Worker diz2@@13 p2@@13))) (and (= diz@@55 diz2@@13) (= p_1@@43 p2@@13)))
 :qid |stdinbpl.719:15|
 :skolemid |104|
 :pattern ( (Worker__joinToken_at_Worker diz@@55 p_1@@43) (Worker__joinToken_at_Worker diz2@@13 p2@@13))
)))
(assert (forall ((arg0@@53 T@U) (arg1@@31 Real) ) (! (= (type (|Worker__joinToken_at_Worker#sm| arg0@@53 arg1@@31)) (FieldType PredicateType_Worker__joinToken_at_WorkerType (MapType1Type RefType boolType)))
 :qid |funType:Worker__joinToken_at_Worker#sm|
 :pattern ( (|Worker__joinToken_at_Worker#sm| arg0@@53 arg1@@31))
)))
(assert (forall ((diz@@56 T@U) (p_1@@44 Real) (diz2@@14 T@U) (p2@@14 Real) ) (!  (=> (and (and (= (type diz@@56) RefType) (= (type diz2@@14) RefType)) (= (|Worker__joinToken_at_Worker#sm| diz@@56 p_1@@44) (|Worker__joinToken_at_Worker#sm| diz2@@14 p2@@14))) (and (= diz@@56 diz2@@14) (= p_1@@44 p2@@14)))
 :qid |stdinbpl.723:15|
 :skolemid |105|
 :pattern ( (|Worker__joinToken_at_Worker#sm| diz@@56 p_1@@44) (|Worker__joinToken_at_Worker#sm| diz2@@14 p2@@14))
)))
(assert (forall ((diz@@57 T@U) (p_1@@45 Real) (diz2@@15 T@U) (p2@@15 Real) ) (!  (=> (and (and (= (type diz@@57) RefType) (= (type diz2@@15) RefType)) (= (Worker__preFork diz@@57 p_1@@45) (Worker__preFork diz2@@15 p2@@15))) (and (= diz@@57 diz2@@15) (= p_1@@45 p2@@15)))
 :qid |stdinbpl.771:15|
 :skolemid |110|
 :pattern ( (Worker__preFork diz@@57 p_1@@45) (Worker__preFork diz2@@15 p2@@15))
)))
(assert (forall ((arg0@@54 T@U) (arg1@@32 Real) ) (! (= (type (|Worker__preFork#sm| arg0@@54 arg1@@32)) (FieldType PredicateType_Worker__preForkType (MapType1Type RefType boolType)))
 :qid |funType:Worker__preFork#sm|
 :pattern ( (|Worker__preFork#sm| arg0@@54 arg1@@32))
)))
(assert (forall ((diz@@58 T@U) (p_1@@46 Real) (diz2@@16 T@U) (p2@@16 Real) ) (!  (=> (and (and (= (type diz@@58) RefType) (= (type diz2@@16) RefType)) (= (|Worker__preFork#sm| diz@@58 p_1@@46) (|Worker__preFork#sm| diz2@@16 p2@@16))) (and (= diz@@58 diz2@@16) (= p_1@@46 p2@@16)))
 :qid |stdinbpl.775:15|
 :skolemid |111|
 :pattern ( (|Worker__preFork#sm| diz@@58 p_1@@46) (|Worker__preFork#sm| diz2@@16 p2@@16))
)))
(assert (forall ((diz@@59 T@U) (p_1@@47 Real) (diz2@@17 T@U) (p2@@17 Real) ) (!  (=> (and (and (= (type diz@@59) RefType) (= (type diz2@@17) RefType)) (= (Worker__postJoin diz@@59 p_1@@47) (Worker__postJoin diz2@@17 p2@@17))) (and (= diz@@59 diz2@@17) (= p_1@@47 p2@@17)))
 :qid |stdinbpl.806:15|
 :skolemid |116|
 :pattern ( (Worker__postJoin diz@@59 p_1@@47) (Worker__postJoin diz2@@17 p2@@17))
)))
(assert (forall ((arg0@@55 T@U) (arg1@@33 Real) ) (! (= (type (|Worker__postJoin#sm| arg0@@55 arg1@@33)) (FieldType PredicateType_Worker__postJoinType (MapType1Type RefType boolType)))
 :qid |funType:Worker__postJoin#sm|
 :pattern ( (|Worker__postJoin#sm| arg0@@55 arg1@@33))
)))
(assert (forall ((diz@@60 T@U) (p_1@@48 Real) (diz2@@18 T@U) (p2@@18 Real) ) (!  (=> (and (and (= (type diz@@60) RefType) (= (type diz2@@18) RefType)) (= (|Worker__postJoin#sm| diz@@60 p_1@@48) (|Worker__postJoin#sm| diz2@@18 p2@@18))) (and (= diz@@60 diz2@@18) (= p_1@@48 p2@@18)))
 :qid |stdinbpl.810:15|
 :skolemid |117|
 :pattern ( (|Worker__postJoin#sm| diz@@60 p_1@@48) (|Worker__postJoin#sm| diz2@@18 p2@@18))
)))
(assert (forall ((diz@@61 T@U) (p_1@@49 Real) (diz2@@19 T@U) (p2@@19 Real) ) (!  (=> (and (and (= (type diz@@61) RefType) (= (type diz2@@19) RefType)) (= (Worker__joinToken_at_Thread diz@@61 p_1@@49) (Worker__joinToken_at_Thread diz2@@19 p2@@19))) (and (= diz@@61 diz2@@19) (= p_1@@49 p2@@19)))
 :qid |stdinbpl.841:15|
 :skolemid |122|
 :pattern ( (Worker__joinToken_at_Thread diz@@61 p_1@@49) (Worker__joinToken_at_Thread diz2@@19 p2@@19))
)))
(assert (forall ((arg0@@56 T@U) (arg1@@34 Real) ) (! (= (type (|Worker__joinToken_at_Thread#sm| arg0@@56 arg1@@34)) (FieldType PredicateType_Worker__joinToken_at_ThreadType (MapType1Type RefType boolType)))
 :qid |funType:Worker__joinToken_at_Thread#sm|
 :pattern ( (|Worker__joinToken_at_Thread#sm| arg0@@56 arg1@@34))
)))
(assert (forall ((diz@@62 T@U) (p_1@@50 Real) (diz2@@20 T@U) (p2@@20 Real) ) (!  (=> (and (and (= (type diz@@62) RefType) (= (type diz2@@20) RefType)) (= (|Worker__joinToken_at_Thread#sm| diz@@62 p_1@@50) (|Worker__joinToken_at_Thread#sm| diz2@@20 p2@@20))) (and (= diz@@62 diz2@@20) (= p_1@@50 p2@@20)))
 :qid |stdinbpl.845:15|
 :skolemid |123|
 :pattern ( (|Worker__joinToken_at_Thread#sm| diz@@62 p_1@@50) (|Worker__joinToken_at_Thread#sm| diz2@@20 p2@@20))
)))
(assert (forall ((diz@@63 T@U) (p_1@@51 Real) (diz2@@21 T@U) (p2@@21 Real) ) (!  (=> (and (and (= (type diz@@63) RefType) (= (type diz2@@21) RefType)) (= (Worker__preFork_at_Thread diz@@63 p_1@@51) (Worker__preFork_at_Thread diz2@@21 p2@@21))) (and (= diz@@63 diz2@@21) (= p_1@@51 p2@@21)))
 :qid |stdinbpl.876:15|
 :skolemid |128|
 :pattern ( (Worker__preFork_at_Thread diz@@63 p_1@@51) (Worker__preFork_at_Thread diz2@@21 p2@@21))
)))
(assert (forall ((arg0@@57 T@U) (arg1@@35 Real) ) (! (= (type (|Worker__preFork_at_Thread#sm| arg0@@57 arg1@@35)) (FieldType PredicateType_Worker__preFork_at_ThreadType (MapType1Type RefType boolType)))
 :qid |funType:Worker__preFork_at_Thread#sm|
 :pattern ( (|Worker__preFork_at_Thread#sm| arg0@@57 arg1@@35))
)))
(assert (forall ((diz@@64 T@U) (p_1@@52 Real) (diz2@@22 T@U) (p2@@22 Real) ) (!  (=> (and (and (= (type diz@@64) RefType) (= (type diz2@@22) RefType)) (= (|Worker__preFork_at_Thread#sm| diz@@64 p_1@@52) (|Worker__preFork_at_Thread#sm| diz2@@22 p2@@22))) (and (= diz@@64 diz2@@22) (= p_1@@52 p2@@22)))
 :qid |stdinbpl.880:15|
 :skolemid |129|
 :pattern ( (|Worker__preFork_at_Thread#sm| diz@@64 p_1@@52) (|Worker__preFork_at_Thread#sm| diz2@@22 p2@@22))
)))
(assert (forall ((diz@@65 T@U) (p_1@@53 Real) (diz2@@23 T@U) (p2@@23 Real) ) (!  (=> (and (and (= (type diz@@65) RefType) (= (type diz2@@23) RefType)) (= (Worker__postJoin_at_Thread diz@@65 p_1@@53) (Worker__postJoin_at_Thread diz2@@23 p2@@23))) (and (= diz@@65 diz2@@23) (= p_1@@53 p2@@23)))
 :qid |stdinbpl.924:15|
 :skolemid |134|
 :pattern ( (Worker__postJoin_at_Thread diz@@65 p_1@@53) (Worker__postJoin_at_Thread diz2@@23 p2@@23))
)))
(assert (forall ((arg0@@58 T@U) (arg1@@36 Real) ) (! (= (type (|Worker__postJoin_at_Thread#sm| arg0@@58 arg1@@36)) (FieldType PredicateType_Worker__postJoin_at_ThreadType (MapType1Type RefType boolType)))
 :qid |funType:Worker__postJoin_at_Thread#sm|
 :pattern ( (|Worker__postJoin_at_Thread#sm| arg0@@58 arg1@@36))
)))
(assert (forall ((diz@@66 T@U) (p_1@@54 Real) (diz2@@24 T@U) (p2@@24 Real) ) (!  (=> (and (and (= (type diz@@66) RefType) (= (type diz2@@24) RefType)) (= (|Worker__postJoin_at_Thread#sm| diz@@66 p_1@@54) (|Worker__postJoin_at_Thread#sm| diz2@@24 p2@@24))) (and (= diz@@66 diz2@@24) (= p_1@@54 p2@@24)))
 :qid |stdinbpl.928:15|
 :skolemid |135|
 :pattern ( (|Worker__postJoin_at_Thread#sm| diz@@66 p_1@@54) (|Worker__postJoin_at_Thread#sm| diz2@@24 p2@@24))
)))
(assert (forall ((diz@@67 T@U) (p_1@@55 Real) (diz2@@25 T@U) (p2@@25 Real) ) (!  (=> (and (and (= (type diz@@67) RefType) (= (type diz2@@25) RefType)) (= (Worker__preFork_at_Worker diz@@67 p_1@@55) (Worker__preFork_at_Worker diz2@@25 p2@@25))) (and (= diz@@67 diz2@@25) (= p_1@@55 p2@@25)))
 :qid |stdinbpl.972:15|
 :skolemid |140|
 :pattern ( (Worker__preFork_at_Worker diz@@67 p_1@@55) (Worker__preFork_at_Worker diz2@@25 p2@@25))
)))
(assert (forall ((arg0@@59 T@U) (arg1@@37 Real) ) (! (= (type (|Worker__preFork_at_Worker#sm| arg0@@59 arg1@@37)) (FieldType PredicateType_Worker__preFork_at_WorkerType (MapType1Type RefType boolType)))
 :qid |funType:Worker__preFork_at_Worker#sm|
 :pattern ( (|Worker__preFork_at_Worker#sm| arg0@@59 arg1@@37))
)))
(assert (forall ((diz@@68 T@U) (p_1@@56 Real) (diz2@@26 T@U) (p2@@26 Real) ) (!  (=> (and (and (= (type diz@@68) RefType) (= (type diz2@@26) RefType)) (= (|Worker__preFork_at_Worker#sm| diz@@68 p_1@@56) (|Worker__preFork_at_Worker#sm| diz2@@26 p2@@26))) (and (= diz@@68 diz2@@26) (= p_1@@56 p2@@26)))
 :qid |stdinbpl.976:15|
 :skolemid |141|
 :pattern ( (|Worker__preFork_at_Worker#sm| diz@@68 p_1@@56) (|Worker__preFork_at_Worker#sm| diz2@@26 p2@@26))
)))
(assert (forall ((diz@@69 T@U) (p_1@@57 Real) (diz2@@27 T@U) (p2@@27 Real) ) (!  (=> (and (and (= (type diz@@69) RefType) (= (type diz2@@27) RefType)) (= (Worker__postJoin_at_Worker diz@@69 p_1@@57) (Worker__postJoin_at_Worker diz2@@27 p2@@27))) (and (= diz@@69 diz2@@27) (= p_1@@57 p2@@27)))
 :qid |stdinbpl.1038:15|
 :skolemid |146|
 :pattern ( (Worker__postJoin_at_Worker diz@@69 p_1@@57) (Worker__postJoin_at_Worker diz2@@27 p2@@27))
)))
(assert (forall ((arg0@@60 T@U) (arg1@@38 Real) ) (! (= (type (|Worker__postJoin_at_Worker#sm| arg0@@60 arg1@@38)) (FieldType PredicateType_Worker__postJoin_at_WorkerType (MapType1Type RefType boolType)))
 :qid |funType:Worker__postJoin_at_Worker#sm|
 :pattern ( (|Worker__postJoin_at_Worker#sm| arg0@@60 arg1@@38))
)))
(assert (forall ((diz@@70 T@U) (p_1@@58 Real) (diz2@@28 T@U) (p2@@28 Real) ) (!  (=> (and (and (= (type diz@@70) RefType) (= (type diz2@@28) RefType)) (= (|Worker__postJoin_at_Worker#sm| diz@@70 p_1@@58) (|Worker__postJoin_at_Worker#sm| diz2@@28 p2@@28))) (and (= diz@@70 diz2@@28) (= p_1@@58 p2@@28)))
 :qid |stdinbpl.1042:15|
 :skolemid |147|
 :pattern ( (|Worker__postJoin_at_Worker#sm| diz@@70 p_1@@58) (|Worker__postJoin_at_Worker#sm| diz2@@28 p2@@28))
)))
(assert (forall ((diz@@71 T@U) (diz2@@29 T@U) ) (!  (=> (and (and (= (type diz@@71) RefType) (= (type diz2@@29) RefType)) (= (Thread__is_a_Thread diz@@71) (Thread__is_a_Thread diz2@@29))) (= diz@@71 diz2@@29))
 :qid |stdinbpl.238:15|
 :skolemid |26|
 :pattern ( (Thread__is_a_Thread diz@@71) (Thread__is_a_Thread diz2@@29))
)))
(assert (forall ((arg0@@61 T@U) ) (! (= (type (|Thread__is_a_Thread#sm| arg0@@61)) (FieldType PredicateType_Thread__is_a_ThreadType (MapType1Type RefType boolType)))
 :qid |funType:Thread__is_a_Thread#sm|
 :pattern ( (|Thread__is_a_Thread#sm| arg0@@61))
)))
(assert (forall ((diz@@72 T@U) (diz2@@30 T@U) ) (!  (=> (and (and (= (type diz@@72) RefType) (= (type diz2@@30) RefType)) (= (|Thread__is_a_Thread#sm| diz@@72) (|Thread__is_a_Thread#sm| diz2@@30))) (= diz@@72 diz2@@30))
 :qid |stdinbpl.242:15|
 :skolemid |27|
 :pattern ( (|Thread__is_a_Thread#sm| diz@@72) (|Thread__is_a_Thread#sm| diz2@@30))
)))
(assert (forall ((diz@@73 T@U) (diz2@@31 T@U) ) (!  (=> (and (and (= (type diz@@73) RefType) (= (type diz2@@31) RefType)) (= (Thread__instance_of_Thread diz@@73) (Thread__instance_of_Thread diz2@@31))) (= diz@@73 diz2@@31))
 :qid |stdinbpl.273:15|
 :skolemid |32|
 :pattern ( (Thread__instance_of_Thread diz@@73) (Thread__instance_of_Thread diz2@@31))
)))
(assert (forall ((arg0@@62 T@U) ) (! (= (type (|Thread__instance_of_Thread#sm| arg0@@62)) (FieldType PredicateType_Thread__instance_of_ThreadType (MapType1Type RefType boolType)))
 :qid |funType:Thread__instance_of_Thread#sm|
 :pattern ( (|Thread__instance_of_Thread#sm| arg0@@62))
)))
(assert (forall ((diz@@74 T@U) (diz2@@32 T@U) ) (!  (=> (and (and (= (type diz@@74) RefType) (= (type diz2@@32) RefType)) (= (|Thread__instance_of_Thread#sm| diz@@74) (|Thread__instance_of_Thread#sm| diz2@@32))) (= diz@@74 diz2@@32))
 :qid |stdinbpl.277:15|
 :skolemid |33|
 :pattern ( (|Thread__instance_of_Thread#sm| diz@@74) (|Thread__instance_of_Thread#sm| diz2@@32))
)))
(assert (forall ((diz@@75 T@U) (diz2@@33 T@U) ) (!  (=> (and (and (= (type diz@@75) RefType) (= (type diz2@@33) RefType)) (= (Worker__is_a_Worker diz@@75) (Worker__is_a_Worker diz2@@33))) (= diz@@75 diz2@@33))
 :qid |stdinbpl.544:15|
 :skolemid |74|
 :pattern ( (Worker__is_a_Worker diz@@75) (Worker__is_a_Worker diz2@@33))
)))
(assert (forall ((arg0@@63 T@U) ) (! (= (type (|Worker__is_a_Worker#sm| arg0@@63)) (FieldType PredicateType_Worker__is_a_WorkerType (MapType1Type RefType boolType)))
 :qid |funType:Worker__is_a_Worker#sm|
 :pattern ( (|Worker__is_a_Worker#sm| arg0@@63))
)))
(assert (forall ((diz@@76 T@U) (diz2@@34 T@U) ) (!  (=> (and (and (= (type diz@@76) RefType) (= (type diz2@@34) RefType)) (= (|Worker__is_a_Worker#sm| diz@@76) (|Worker__is_a_Worker#sm| diz2@@34))) (= diz@@76 diz2@@34))
 :qid |stdinbpl.548:15|
 :skolemid |75|
 :pattern ( (|Worker__is_a_Worker#sm| diz@@76) (|Worker__is_a_Worker#sm| diz2@@34))
)))
(assert (forall ((diz@@77 T@U) (diz2@@35 T@U) ) (!  (=> (and (and (= (type diz@@77) RefType) (= (type diz2@@35) RefType)) (= (Worker__instance_of_Worker diz@@77) (Worker__instance_of_Worker diz2@@35))) (= diz@@77 diz2@@35))
 :qid |stdinbpl.579:15|
 :skolemid |80|
 :pattern ( (Worker__instance_of_Worker diz@@77) (Worker__instance_of_Worker diz2@@35))
)))
(assert (forall ((arg0@@64 T@U) ) (! (= (type (|Worker__instance_of_Worker#sm| arg0@@64)) (FieldType PredicateType_Worker__instance_of_WorkerType (MapType1Type RefType boolType)))
 :qid |funType:Worker__instance_of_Worker#sm|
 :pattern ( (|Worker__instance_of_Worker#sm| arg0@@64))
)))
(assert (forall ((diz@@78 T@U) (diz2@@36 T@U) ) (!  (=> (and (and (= (type diz@@78) RefType) (= (type diz2@@36) RefType)) (= (|Worker__instance_of_Worker#sm| diz@@78) (|Worker__instance_of_Worker#sm| diz2@@36))) (= diz@@78 diz2@@36))
 :qid |stdinbpl.583:15|
 :skolemid |81|
 :pattern ( (|Worker__instance_of_Worker#sm| diz@@78) (|Worker__instance_of_Worker#sm| diz2@@36))
)))
(assert (forall ((diz@@79 T@U) (diz2@@37 T@U) ) (!  (=> (and (and (= (type diz@@79) RefType) (= (type diz2@@37) RefType)) (= (Worker__is_a_Thread diz@@79) (Worker__is_a_Thread diz2@@37))) (= diz@@79 diz2@@37))
 :qid |stdinbpl.614:15|
 :skolemid |86|
 :pattern ( (Worker__is_a_Thread diz@@79) (Worker__is_a_Thread diz2@@37))
)))
(assert (forall ((arg0@@65 T@U) ) (! (= (type (|Worker__is_a_Thread#sm| arg0@@65)) (FieldType PredicateType_Worker__is_a_ThreadType (MapType1Type RefType boolType)))
 :qid |funType:Worker__is_a_Thread#sm|
 :pattern ( (|Worker__is_a_Thread#sm| arg0@@65))
)))
(assert (forall ((diz@@80 T@U) (diz2@@38 T@U) ) (!  (=> (and (and (= (type diz@@80) RefType) (= (type diz2@@38) RefType)) (= (|Worker__is_a_Thread#sm| diz@@80) (|Worker__is_a_Thread#sm| diz2@@38))) (= diz@@80 diz2@@38))
 :qid |stdinbpl.618:15|
 :skolemid |87|
 :pattern ( (|Worker__is_a_Thread#sm| diz@@80) (|Worker__is_a_Thread#sm| diz2@@38))
)))
(assert (forall ((diz@@81 T@U) (diz2@@39 T@U) ) (!  (=> (and (and (= (type diz@@81) RefType) (= (type diz2@@39) RefType)) (= (Worker__instance_of_Thread diz@@81) (Worker__instance_of_Thread diz2@@39))) (= diz@@81 diz2@@39))
 :qid |stdinbpl.649:15|
 :skolemid |92|
 :pattern ( (Worker__instance_of_Thread diz@@81) (Worker__instance_of_Thread diz2@@39))
)))
(assert (forall ((arg0@@66 T@U) ) (! (= (type (|Worker__instance_of_Thread#sm| arg0@@66)) (FieldType PredicateType_Worker__instance_of_ThreadType (MapType1Type RefType boolType)))
 :qid |funType:Worker__instance_of_Thread#sm|
 :pattern ( (|Worker__instance_of_Thread#sm| arg0@@66))
)))
(assert (forall ((diz@@82 T@U) (diz2@@40 T@U) ) (!  (=> (and (and (= (type diz@@82) RefType) (= (type diz2@@40) RefType)) (= (|Worker__instance_of_Thread#sm| diz@@82) (|Worker__instance_of_Thread#sm| diz2@@40))) (= diz@@82 diz2@@40))
 :qid |stdinbpl.653:15|
 :skolemid |93|
 :pattern ( (|Worker__instance_of_Thread#sm| diz@@82) (|Worker__instance_of_Thread#sm| diz2@@40))
)))
(assert (forall ((Heap@@24 T@U) (ExhaleHeap@@2 T@U) (Mask@@3 T@U) (o_1@@0 T@U) (f_2 T@U) ) (! (let ((B@@1 (FieldTypeInv1 (type f_2))))
(let ((A@@1 (FieldTypeInv0 (type f_2))))
 (=> (and (and (and (and (and (and (= (type Heap@@24) (MapType0Type RefType)) (= (type ExhaleHeap@@2) (MapType0Type RefType))) (= (type Mask@@3) (MapType1Type RefType realType))) (= (type o_1@@0) RefType)) (= (type f_2) (FieldType A@@1 B@@1))) (IdenticalOnKnownLocations Heap@@24 ExhaleHeap@@2 Mask@@3)) (HasDirectPerm Mask@@3 o_1@@0 f_2)) (= (MapType0Select Heap@@24 o_1@@0 f_2) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2)))))
 :qid |stdinbpl.42:22|
 :skolemid |1|
 :pattern ( (IdenticalOnKnownLocations Heap@@24 ExhaleHeap@@2 Mask@@3) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2))
)))
(assert  (and (= (type dummyHeap) (MapType0Type RefType)) (= (type ZeroMask) (MapType1Type RefType realType))))
(assert (state dummyHeap ZeroMask))
(assert (forall ((p T@U) (v_1 T@U) (w T@U) ) (! (let ((A@@2 (FieldTypeInv0 (type p))))
 (=> (and (and (= (type p) (FieldType A@@2 FrameTypeType)) (= (type v_1) FrameTypeType)) (= (type w) FrameTypeType)) (not (InsidePredicate p v_1 p w))))
 :qid |stdinbpl.170:19|
 :skolemid |21|
 :pattern ( (InsidePredicate p v_1 p w))
)))
(assert  (not (IsPredicateField Worker__input)))
(assert  (not (IsWandField Worker__input)))
(assert  (not (IsPredicateField Worker__output)))
(assert  (not (IsWandField Worker__output)))
(assert (forall ((Heap@@25 T@U) (ExhaleHeap@@3 T@U) (Mask@@4 T@U) ) (!  (=> (and (and (and (= (type Heap@@25) (MapType0Type RefType)) (= (type ExhaleHeap@@3) (MapType0Type RefType))) (= (type Mask@@4) (MapType1Type RefType realType))) (IdenticalOnKnownLocations Heap@@25 ExhaleHeap@@3 Mask@@4)) (succHeap Heap@@25 ExhaleHeap@@3))
 :qid |stdinbpl.83:15|
 :skolemid |10|
 :pattern ( (IdenticalOnKnownLocations Heap@@25 ExhaleHeap@@3 Mask@@4))
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
(assert  (and (forall ((arg0@@67 Real) (arg1@@39 T@U) ) (! (= (type (ConditionalFrame arg0@@67 arg1@@39)) FrameTypeType)
 :qid |funType:ConditionalFrame|
 :pattern ( (ConditionalFrame arg0@@67 arg1@@39))
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
(assert  (and (= (Ctor TYPEDomainTypeType) 33) (= (type class_Object) TYPEDomainTypeType)))
(assert (forall ((t_1 T@U) ) (!  (=> (= (type t_1) TYPEDomainTypeType) (instanceof class_Object t_1))
 :qid |stdinbpl.201:15|
 :skolemid |22|
 :pattern ( (instanceof class_Object t_1))
)))
(assert (forall ((diz@@83 T@U) (p_1@@59 Real) ) (!  (=> (= (type diz@@83) RefType) (= (getPredWandId (Thread__joinToken diz@@83 p_1@@59)) 2))
 :qid |stdinbpl.302:15|
 :skolemid |37|
 :pattern ( (Thread__joinToken diz@@83 p_1@@59))
)))
(assert (forall ((diz@@84 T@U) (p_1@@60 Real) ) (!  (=> (= (type diz@@84) RefType) (= (getPredWandId (Thread__preFork diz@@84 p_1@@60)) 3))
 :qid |stdinbpl.337:15|
 :skolemid |43|
 :pattern ( (Thread__preFork diz@@84 p_1@@60))
)))
(assert (forall ((diz@@85 T@U) (p_1@@61 Real) ) (!  (=> (= (type diz@@85) RefType) (= (getPredWandId (Thread__postJoin diz@@85 p_1@@61)) 4))
 :qid |stdinbpl.372:15|
 :skolemid |49|
 :pattern ( (Thread__postJoin diz@@85 p_1@@61))
)))
(assert (forall ((diz@@86 T@U) (p_1@@62 Real) ) (!  (=> (= (type diz@@86) RefType) (= (getPredWandId (Thread__joinToken_at_Thread diz@@86 p_1@@62)) 5))
 :qid |stdinbpl.407:15|
 :skolemid |55|
 :pattern ( (Thread__joinToken_at_Thread diz@@86 p_1@@62))
)))
(assert (forall ((diz@@87 T@U) (p_1@@63 Real) ) (!  (=> (= (type diz@@87) RefType) (= (getPredWandId (Thread__preFork_at_Thread diz@@87 p_1@@63)) 6))
 :qid |stdinbpl.442:15|
 :skolemid |61|
 :pattern ( (Thread__preFork_at_Thread diz@@87 p_1@@63))
)))
(assert (forall ((diz@@88 T@U) (p_1@@64 Real) ) (!  (=> (= (type diz@@88) RefType) (= (getPredWandId (Thread__postJoin_at_Thread diz@@88 p_1@@64)) 7))
 :qid |stdinbpl.490:15|
 :skolemid |67|
 :pattern ( (Thread__postJoin_at_Thread diz@@88 p_1@@64))
)))
(assert (forall ((diz@@89 T@U) (p_1@@65 Real) ) (!  (=> (= (type diz@@89) RefType) (= (getPredWandId (Worker__joinToken diz@@89 p_1@@65)) 12))
 :qid |stdinbpl.678:15|
 :skolemid |97|
 :pattern ( (Worker__joinToken diz@@89 p_1@@65))
)))
(assert (forall ((diz@@90 T@U) (p_1@@66 Real) ) (!  (=> (= (type diz@@90) RefType) (= (getPredWandId (Worker__joinToken_at_Worker diz@@90 p_1@@66)) 13))
 :qid |stdinbpl.713:15|
 :skolemid |103|
 :pattern ( (Worker__joinToken_at_Worker diz@@90 p_1@@66))
)))
(assert (forall ((diz@@91 T@U) (p_1@@67 Real) ) (!  (=> (= (type diz@@91) RefType) (= (getPredWandId (Worker__preFork diz@@91 p_1@@67)) 14))
 :qid |stdinbpl.765:15|
 :skolemid |109|
 :pattern ( (Worker__preFork diz@@91 p_1@@67))
)))
(assert (forall ((diz@@92 T@U) (p_1@@68 Real) ) (!  (=> (= (type diz@@92) RefType) (= (getPredWandId (Worker__postJoin diz@@92 p_1@@68)) 15))
 :qid |stdinbpl.800:15|
 :skolemid |115|
 :pattern ( (Worker__postJoin diz@@92 p_1@@68))
)))
(assert (forall ((diz@@93 T@U) (p_1@@69 Real) ) (!  (=> (= (type diz@@93) RefType) (= (getPredWandId (Worker__joinToken_at_Thread diz@@93 p_1@@69)) 16))
 :qid |stdinbpl.835:15|
 :skolemid |121|
 :pattern ( (Worker__joinToken_at_Thread diz@@93 p_1@@69))
)))
(assert (forall ((diz@@94 T@U) (p_1@@70 Real) ) (!  (=> (= (type diz@@94) RefType) (= (getPredWandId (Worker__preFork_at_Thread diz@@94 p_1@@70)) 17))
 :qid |stdinbpl.870:15|
 :skolemid |127|
 :pattern ( (Worker__preFork_at_Thread diz@@94 p_1@@70))
)))
(assert (forall ((diz@@95 T@U) (p_1@@71 Real) ) (!  (=> (= (type diz@@95) RefType) (= (getPredWandId (Worker__postJoin_at_Thread diz@@95 p_1@@71)) 18))
 :qid |stdinbpl.918:15|
 :skolemid |133|
 :pattern ( (Worker__postJoin_at_Thread diz@@95 p_1@@71))
)))
(assert (forall ((diz@@96 T@U) (p_1@@72 Real) ) (!  (=> (= (type diz@@96) RefType) (= (getPredWandId (Worker__preFork_at_Worker diz@@96 p_1@@72)) 19))
 :qid |stdinbpl.966:15|
 :skolemid |139|
 :pattern ( (Worker__preFork_at_Worker diz@@96 p_1@@72))
)))
(assert (forall ((diz@@97 T@U) (p_1@@73 Real) ) (!  (=> (= (type diz@@97) RefType) (= (getPredWandId (Worker__postJoin_at_Worker diz@@97 p_1@@73)) 20))
 :qid |stdinbpl.1032:15|
 :skolemid |145|
 :pattern ( (Worker__postJoin_at_Worker diz@@97 p_1@@73))
)))
(assert (forall ((Heap@@26 T@U) (ExhaleHeap@@4 T@U) (Mask@@6 T@U) (pm_f@@1 T@U) ) (! (let ((C@@1 (FieldTypeInv0 (type pm_f@@1))))
 (=> (and (and (and (and (and (= (type Heap@@26) (MapType0Type RefType)) (= (type ExhaleHeap@@4) (MapType0Type RefType))) (= (type Mask@@6) (MapType1Type RefType realType))) (= (type pm_f@@1) (FieldType C@@1 FrameTypeType))) (IdenticalOnKnownLocations Heap@@26 ExhaleHeap@@4 Mask@@6)) (and (HasDirectPerm Mask@@6 null pm_f@@1) (IsPredicateField pm_f@@1))) (forall ((o2 T@U) (f_2@@0 T@U) ) (! (let ((B@@5 (FieldTypeInv1 (type f_2@@0))))
(let ((A@@6 (FieldTypeInv0 (type f_2@@0))))
 (=> (and (and (= (type o2) RefType) (= (type f_2@@0) (FieldType A@@6 B@@5))) (U_2_bool (MapType1Select (MapType0Select Heap@@26 null (PredicateMaskField pm_f@@1)) o2 f_2@@0))) (= (MapType0Select Heap@@26 o2 f_2@@0) (MapType0Select ExhaleHeap@@4 o2 f_2@@0)))))
 :qid |stdinbpl.54:134|
 :skolemid |3|
 :pattern ( (MapType0Select ExhaleHeap@@4 o2 f_2@@0))
))))
 :qid |stdinbpl.52:19|
 :skolemid |4|
 :pattern ( (IdenticalOnKnownLocations Heap@@26 ExhaleHeap@@4 Mask@@6) (IsPredicateField pm_f@@1))
)))
(assert (forall ((Heap@@27 T@U) (ExhaleHeap@@5 T@U) (Mask@@7 T@U) (pm_f@@2 T@U) ) (! (let ((C@@2 (FieldTypeInv0 (type pm_f@@2))))
 (=> (and (and (and (and (and (= (type Heap@@27) (MapType0Type RefType)) (= (type ExhaleHeap@@5) (MapType0Type RefType))) (= (type Mask@@7) (MapType1Type RefType realType))) (= (type pm_f@@2) (FieldType C@@2 FrameTypeType))) (IdenticalOnKnownLocations Heap@@27 ExhaleHeap@@5 Mask@@7)) (and (HasDirectPerm Mask@@7 null pm_f@@2) (IsWandField pm_f@@2))) (forall ((o2@@0 T@U) (f_2@@1 T@U) ) (! (let ((B@@6 (FieldTypeInv1 (type f_2@@1))))
(let ((A@@7 (FieldTypeInv0 (type f_2@@1))))
 (=> (and (and (= (type o2@@0) RefType) (= (type f_2@@1) (FieldType A@@7 B@@6))) (U_2_bool (MapType1Select (MapType0Select Heap@@27 null (WandMaskField pm_f@@2)) o2@@0 f_2@@1))) (= (MapType0Select Heap@@27 o2@@0 f_2@@1) (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1)))))
 :qid |stdinbpl.67:129|
 :skolemid |6|
 :pattern ( (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1))
))))
 :qid |stdinbpl.65:19|
 :skolemid |7|
 :pattern ( (IdenticalOnKnownLocations Heap@@27 ExhaleHeap@@5 Mask@@7) (IsWandField pm_f@@2))
)))
(assert (forall ((diz@@98 T@U) ) (!  (=> (= (type diz@@98) RefType) (= (getPredWandId (Thread__is_a_Thread diz@@98)) 0))
 :qid |stdinbpl.232:15|
 :skolemid |25|
 :pattern ( (Thread__is_a_Thread diz@@98))
)))
(assert (forall ((diz@@99 T@U) ) (!  (=> (= (type diz@@99) RefType) (= (getPredWandId (Thread__instance_of_Thread diz@@99)) 1))
 :qid |stdinbpl.267:15|
 :skolemid |31|
 :pattern ( (Thread__instance_of_Thread diz@@99))
)))
(assert (forall ((diz@@100 T@U) ) (!  (=> (= (type diz@@100) RefType) (= (getPredWandId (Worker__is_a_Worker diz@@100)) 8))
 :qid |stdinbpl.538:15|
 :skolemid |73|
 :pattern ( (Worker__is_a_Worker diz@@100))
)))
(assert (forall ((diz@@101 T@U) ) (!  (=> (= (type diz@@101) RefType) (= (getPredWandId (Worker__instance_of_Worker diz@@101)) 9))
 :qid |stdinbpl.573:15|
 :skolemid |79|
 :pattern ( (Worker__instance_of_Worker diz@@101))
)))
(assert (forall ((diz@@102 T@U) ) (!  (=> (= (type diz@@102) RefType) (= (getPredWandId (Worker__is_a_Thread diz@@102)) 10))
 :qid |stdinbpl.608:15|
 :skolemid |85|
 :pattern ( (Worker__is_a_Thread diz@@102))
)))
(assert (forall ((diz@@103 T@U) ) (!  (=> (= (type diz@@103) RefType) (= (getPredWandId (Worker__instance_of_Thread diz@@103)) 11))
 :qid |stdinbpl.643:15|
 :skolemid |91|
 :pattern ( (Worker__instance_of_Thread diz@@103))
)))
(assert (forall ((Mask@@8 T@U) (o_2@@2 T@U) (f_4@@2 T@U) ) (! (let ((B@@7 (FieldTypeInv1 (type f_4@@2))))
(let ((A@@8 (FieldTypeInv0 (type f_4@@2))))
 (=> (and (and (and (= (type Mask@@8) (MapType1Type RefType realType)) (= (type o_2@@2) RefType)) (= (type f_4@@2) (FieldType A@@8 B@@7))) (GoodMask Mask@@8)) (and (>= (U_2_real (MapType1Select Mask@@8 o_2@@2 f_4@@2)) NoPerm) (=> (and (and (GoodMask Mask@@8) (not (IsPredicateField f_4@@2))) (not (IsWandField f_4@@2))) (<= (U_2_real (MapType1Select Mask@@8 o_2@@2 f_4@@2)) FullPerm))))))
 :qid |stdinbpl.128:22|
 :skolemid |16|
 :pattern ( (GoodMask Mask@@8) (MapType1Select Mask@@8 o_2@@2 f_4@@2))
)))
(assert (forall ((o T@U) (f T@U) (Heap@@28 T@U) ) (!  (=> (and (and (and (= (type o) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap@@28) (MapType0Type RefType))) (U_2_bool (MapType0Select Heap@@28 o $allocated))) (U_2_bool (MapType0Select Heap@@28 (MapType0Select Heap@@28 o f) $allocated)))
 :qid |stdinbpl.31:15|
 :skolemid |0|
 :pattern ( (MapType0Select Heap@@28 o f))
)))
(assert (forall ((diz@@104 T@U) (p_1@@74 Real) ) (!  (=> (= (type diz@@104) RefType) (= (PredicateMaskField (Thread__joinToken diz@@104 p_1@@74)) (|Thread__joinToken#sm| diz@@104 p_1@@74)))
 :qid |stdinbpl.294:15|
 :skolemid |35|
 :pattern ( (PredicateMaskField (Thread__joinToken diz@@104 p_1@@74)))
)))
(assert (forall ((diz@@105 T@U) (p_1@@75 Real) ) (!  (=> (= (type diz@@105) RefType) (= (PredicateMaskField (Thread__preFork diz@@105 p_1@@75)) (|Thread__preFork#sm| diz@@105 p_1@@75)))
 :qid |stdinbpl.329:15|
 :skolemid |41|
 :pattern ( (PredicateMaskField (Thread__preFork diz@@105 p_1@@75)))
)))
(assert (forall ((diz@@106 T@U) (p_1@@76 Real) ) (!  (=> (= (type diz@@106) RefType) (= (PredicateMaskField (Thread__postJoin diz@@106 p_1@@76)) (|Thread__postJoin#sm| diz@@106 p_1@@76)))
 :qid |stdinbpl.364:15|
 :skolemid |47|
 :pattern ( (PredicateMaskField (Thread__postJoin diz@@106 p_1@@76)))
)))
(assert (forall ((diz@@107 T@U) (p_1@@77 Real) ) (!  (=> (= (type diz@@107) RefType) (= (PredicateMaskField (Thread__joinToken_at_Thread diz@@107 p_1@@77)) (|Thread__joinToken_at_Thread#sm| diz@@107 p_1@@77)))
 :qid |stdinbpl.399:15|
 :skolemid |53|
 :pattern ( (PredicateMaskField (Thread__joinToken_at_Thread diz@@107 p_1@@77)))
)))
(assert (forall ((diz@@108 T@U) (p_1@@78 Real) ) (!  (=> (= (type diz@@108) RefType) (= (PredicateMaskField (Thread__preFork_at_Thread diz@@108 p_1@@78)) (|Thread__preFork_at_Thread#sm| diz@@108 p_1@@78)))
 :qid |stdinbpl.434:15|
 :skolemid |59|
 :pattern ( (PredicateMaskField (Thread__preFork_at_Thread diz@@108 p_1@@78)))
)))
(assert (forall ((diz@@109 T@U) (p_1@@79 Real) ) (!  (=> (= (type diz@@109) RefType) (= (PredicateMaskField (Thread__postJoin_at_Thread diz@@109 p_1@@79)) (|Thread__postJoin_at_Thread#sm| diz@@109 p_1@@79)))
 :qid |stdinbpl.482:15|
 :skolemid |65|
 :pattern ( (PredicateMaskField (Thread__postJoin_at_Thread diz@@109 p_1@@79)))
)))
(assert (forall ((diz@@110 T@U) (p_1@@80 Real) ) (!  (=> (= (type diz@@110) RefType) (= (PredicateMaskField (Worker__joinToken diz@@110 p_1@@80)) (|Worker__joinToken#sm| diz@@110 p_1@@80)))
 :qid |stdinbpl.670:15|
 :skolemid |95|
 :pattern ( (PredicateMaskField (Worker__joinToken diz@@110 p_1@@80)))
)))
(assert (forall ((diz@@111 T@U) (p_1@@81 Real) ) (!  (=> (= (type diz@@111) RefType) (= (PredicateMaskField (Worker__joinToken_at_Worker diz@@111 p_1@@81)) (|Worker__joinToken_at_Worker#sm| diz@@111 p_1@@81)))
 :qid |stdinbpl.705:15|
 :skolemid |101|
 :pattern ( (PredicateMaskField (Worker__joinToken_at_Worker diz@@111 p_1@@81)))
)))
(assert (forall ((diz@@112 T@U) (p_1@@82 Real) ) (!  (=> (= (type diz@@112) RefType) (= (PredicateMaskField (Worker__preFork diz@@112 p_1@@82)) (|Worker__preFork#sm| diz@@112 p_1@@82)))
 :qid |stdinbpl.757:15|
 :skolemid |107|
 :pattern ( (PredicateMaskField (Worker__preFork diz@@112 p_1@@82)))
)))
(assert (forall ((diz@@113 T@U) (p_1@@83 Real) ) (!  (=> (= (type diz@@113) RefType) (= (PredicateMaskField (Worker__postJoin diz@@113 p_1@@83)) (|Worker__postJoin#sm| diz@@113 p_1@@83)))
 :qid |stdinbpl.792:15|
 :skolemid |113|
 :pattern ( (PredicateMaskField (Worker__postJoin diz@@113 p_1@@83)))
)))
(assert (forall ((diz@@114 T@U) (p_1@@84 Real) ) (!  (=> (= (type diz@@114) RefType) (= (PredicateMaskField (Worker__joinToken_at_Thread diz@@114 p_1@@84)) (|Worker__joinToken_at_Thread#sm| diz@@114 p_1@@84)))
 :qid |stdinbpl.827:15|
 :skolemid |119|
 :pattern ( (PredicateMaskField (Worker__joinToken_at_Thread diz@@114 p_1@@84)))
)))
(assert (forall ((diz@@115 T@U) (p_1@@85 Real) ) (!  (=> (= (type diz@@115) RefType) (= (PredicateMaskField (Worker__preFork_at_Thread diz@@115 p_1@@85)) (|Worker__preFork_at_Thread#sm| diz@@115 p_1@@85)))
 :qid |stdinbpl.862:15|
 :skolemid |125|
 :pattern ( (PredicateMaskField (Worker__preFork_at_Thread diz@@115 p_1@@85)))
)))
(assert (forall ((diz@@116 T@U) (p_1@@86 Real) ) (!  (=> (= (type diz@@116) RefType) (= (PredicateMaskField (Worker__postJoin_at_Thread diz@@116 p_1@@86)) (|Worker__postJoin_at_Thread#sm| diz@@116 p_1@@86)))
 :qid |stdinbpl.910:15|
 :skolemid |131|
 :pattern ( (PredicateMaskField (Worker__postJoin_at_Thread diz@@116 p_1@@86)))
)))
(assert (forall ((diz@@117 T@U) (p_1@@87 Real) ) (!  (=> (= (type diz@@117) RefType) (= (PredicateMaskField (Worker__preFork_at_Worker diz@@117 p_1@@87)) (|Worker__preFork_at_Worker#sm| diz@@117 p_1@@87)))
 :qid |stdinbpl.958:15|
 :skolemid |137|
 :pattern ( (PredicateMaskField (Worker__preFork_at_Worker diz@@117 p_1@@87)))
)))
(assert (forall ((diz@@118 T@U) (p_1@@88 Real) ) (!  (=> (= (type diz@@118) RefType) (= (PredicateMaskField (Worker__postJoin_at_Worker diz@@118 p_1@@88)) (|Worker__postJoin_at_Worker#sm| diz@@118 p_1@@88)))
 :qid |stdinbpl.1024:15|
 :skolemid |143|
 :pattern ( (PredicateMaskField (Worker__postJoin_at_Worker diz@@118 p_1@@88)))
)))
(assert (forall ((diz@@119 T@U) ) (!  (=> (= (type diz@@119) RefType) (= (PredicateMaskField (Thread__is_a_Thread diz@@119)) (|Thread__is_a_Thread#sm| diz@@119)))
 :qid |stdinbpl.224:15|
 :skolemid |23|
 :pattern ( (PredicateMaskField (Thread__is_a_Thread diz@@119)))
)))
(assert (forall ((diz@@120 T@U) ) (!  (=> (= (type diz@@120) RefType) (= (PredicateMaskField (Thread__instance_of_Thread diz@@120)) (|Thread__instance_of_Thread#sm| diz@@120)))
 :qid |stdinbpl.259:15|
 :skolemid |29|
 :pattern ( (PredicateMaskField (Thread__instance_of_Thread diz@@120)))
)))
(assert (forall ((diz@@121 T@U) ) (!  (=> (= (type diz@@121) RefType) (= (PredicateMaskField (Worker__is_a_Worker diz@@121)) (|Worker__is_a_Worker#sm| diz@@121)))
 :qid |stdinbpl.530:15|
 :skolemid |71|
 :pattern ( (PredicateMaskField (Worker__is_a_Worker diz@@121)))
)))
(assert (forall ((diz@@122 T@U) ) (!  (=> (= (type diz@@122) RefType) (= (PredicateMaskField (Worker__instance_of_Worker diz@@122)) (|Worker__instance_of_Worker#sm| diz@@122)))
 :qid |stdinbpl.565:15|
 :skolemid |77|
 :pattern ( (PredicateMaskField (Worker__instance_of_Worker diz@@122)))
)))
(assert (forall ((diz@@123 T@U) ) (!  (=> (= (type diz@@123) RefType) (= (PredicateMaskField (Worker__is_a_Thread diz@@123)) (|Worker__is_a_Thread#sm| diz@@123)))
 :qid |stdinbpl.600:15|
 :skolemid |83|
 :pattern ( (PredicateMaskField (Worker__is_a_Thread diz@@123)))
)))
(assert (forall ((diz@@124 T@U) ) (!  (=> (= (type diz@@124) RefType) (= (PredicateMaskField (Worker__instance_of_Thread diz@@124)) (|Worker__instance_of_Thread#sm| diz@@124)))
 :qid |stdinbpl.635:15|
 :skolemid |89|
 :pattern ( (PredicateMaskField (Worker__instance_of_Thread diz@@124)))
)))
(assert (forall ((Heap@@29 T@U) (o@@0 T@U) (f_3 T@U) (v T@U) ) (! (let ((B@@8 (type v)))
(let ((A@@9 (FieldTypeInv0 (type f_3))))
 (=> (and (and (= (type Heap@@29) (MapType0Type RefType)) (= (type o@@0) RefType)) (= (type f_3) (FieldType A@@9 B@@8))) (succHeap Heap@@29 (MapType0Store Heap@@29 o@@0 f_3 v)))))
 :qid |stdinbpl.78:22|
 :skolemid |9|
 :pattern ( (MapType0Store Heap@@29 o@@0 f_3 v))
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
(set-info :boogie-vc-id |Thread__postJoin_at_Thread#definedness|)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 2) true)
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
(declare-fun Worker__input () T@U)
(declare-fun Worker__output () T@U)
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
(declare-fun state (T@U T@U) Bool)
(declare-fun MapType1Type (T@T T@T) T@T)
(declare-fun GoodMask (T@U) Bool)
(declare-fun MapType1TypeInv0 (T@T) T@T)
(declare-fun MapType1TypeInv1 (T@T) T@T)
(declare-fun MapType1Select (T@U T@U T@U) T@U)
(declare-fun MapType1Store (T@U T@U T@U T@U) T@U)
(declare-fun Thread__joinToken (T@U Real) T@U)
(declare-fun IsPredicateField (T@U) Bool)
(declare-fun PredicateType_Thread__joinTokenType () T@T)
(declare-fun FrameTypeType () T@T)
(declare-fun Thread__preFork (T@U Real) T@U)
(declare-fun PredicateType_Thread__preForkType () T@T)
(declare-fun Thread__postJoin (T@U Real) T@U)
(declare-fun PredicateType_Thread__postJoinType () T@T)
(declare-fun Thread__joinToken_at_Thread (T@U Real) T@U)
(declare-fun PredicateType_Thread__joinToken_at_ThreadType () T@T)
(declare-fun Thread__preFork_at_Thread (T@U Real) T@U)
(declare-fun PredicateType_Thread__preFork_at_ThreadType () T@T)
(declare-fun Thread__postJoin_at_Thread (T@U Real) T@U)
(declare-fun PredicateType_Thread__postJoin_at_ThreadType () T@T)
(declare-fun Worker__joinToken (T@U Real) T@U)
(declare-fun PredicateType_Worker__joinTokenType () T@T)
(declare-fun Worker__joinToken_at_Worker (T@U Real) T@U)
(declare-fun PredicateType_Worker__joinToken_at_WorkerType () T@T)
(declare-fun Worker__preFork (T@U Real) T@U)
(declare-fun PredicateType_Worker__preForkType () T@T)
(declare-fun Worker__postJoin (T@U Real) T@U)
(declare-fun PredicateType_Worker__postJoinType () T@T)
(declare-fun Worker__joinToken_at_Thread (T@U Real) T@U)
(declare-fun PredicateType_Worker__joinToken_at_ThreadType () T@T)
(declare-fun Worker__preFork_at_Thread (T@U Real) T@U)
(declare-fun PredicateType_Worker__preFork_at_ThreadType () T@T)
(declare-fun Worker__postJoin_at_Thread (T@U Real) T@U)
(declare-fun PredicateType_Worker__postJoin_at_ThreadType () T@T)
(declare-fun Worker__preFork_at_Worker (T@U Real) T@U)
(declare-fun PredicateType_Worker__preFork_at_WorkerType () T@T)
(declare-fun Worker__postJoin_at_Worker (T@U Real) T@U)
(declare-fun PredicateType_Worker__postJoin_at_WorkerType () T@T)
(declare-fun |Thread__joinToken#trigger| (T@U T@U) Bool)
(declare-fun |Thread__joinToken#everUsed| (T@U) Bool)
(declare-fun |Thread__preFork#trigger| (T@U T@U) Bool)
(declare-fun |Thread__preFork#everUsed| (T@U) Bool)
(declare-fun |Thread__postJoin#trigger| (T@U T@U) Bool)
(declare-fun |Thread__postJoin#everUsed| (T@U) Bool)
(declare-fun |Thread__joinToken_at_Thread#trigger| (T@U T@U) Bool)
(declare-fun |Thread__joinToken_at_Thread#everUsed| (T@U) Bool)
(declare-fun |Thread__preFork_at_Thread#trigger| (T@U T@U) Bool)
(declare-fun |Thread__preFork_at_Thread#everUsed| (T@U) Bool)
(declare-fun |Thread__postJoin_at_Thread#trigger| (T@U T@U) Bool)
(declare-fun |Thread__postJoin_at_Thread#everUsed| (T@U) Bool)
(declare-fun |Worker__joinToken#trigger| (T@U T@U) Bool)
(declare-fun |Worker__joinToken#everUsed| (T@U) Bool)
(declare-fun |Worker__joinToken_at_Worker#trigger| (T@U T@U) Bool)
(declare-fun |Worker__joinToken_at_Worker#everUsed| (T@U) Bool)
(declare-fun |Worker__preFork#trigger| (T@U T@U) Bool)
(declare-fun |Worker__preFork#everUsed| (T@U) Bool)
(declare-fun |Worker__postJoin#trigger| (T@U T@U) Bool)
(declare-fun |Worker__postJoin#everUsed| (T@U) Bool)
(declare-fun |Worker__joinToken_at_Thread#trigger| (T@U T@U) Bool)
(declare-fun |Worker__joinToken_at_Thread#everUsed| (T@U) Bool)
(declare-fun |Worker__preFork_at_Thread#trigger| (T@U T@U) Bool)
(declare-fun |Worker__preFork_at_Thread#everUsed| (T@U) Bool)
(declare-fun |Worker__postJoin_at_Thread#trigger| (T@U T@U) Bool)
(declare-fun |Worker__postJoin_at_Thread#everUsed| (T@U) Bool)
(declare-fun |Worker__preFork_at_Worker#trigger| (T@U T@U) Bool)
(declare-fun |Worker__preFork_at_Worker#everUsed| (T@U) Bool)
(declare-fun |Worker__postJoin_at_Worker#trigger| (T@U T@U) Bool)
(declare-fun |Worker__postJoin_at_Worker#everUsed| (T@U) Bool)
(declare-fun IdenticalOnKnownLocations (T@U T@U T@U) Bool)
(declare-fun null () T@U)
(declare-fun PredicateMaskField (T@U) T@U)
(declare-fun HasDirectPerm (T@U T@U T@U) Bool)
(declare-fun IsWandField (T@U) Bool)
(declare-fun WandMaskField (T@U) T@U)
(declare-fun Thread__is_a_Thread (T@U) T@U)
(declare-fun PredicateType_Thread__is_a_ThreadType () T@T)
(declare-fun Thread__instance_of_Thread (T@U) T@U)
(declare-fun PredicateType_Thread__instance_of_ThreadType () T@T)
(declare-fun Worker__is_a_Worker (T@U) T@U)
(declare-fun PredicateType_Worker__is_a_WorkerType () T@T)
(declare-fun Worker__instance_of_Worker (T@U) T@U)
(declare-fun PredicateType_Worker__instance_of_WorkerType () T@T)
(declare-fun Worker__is_a_Thread (T@U) T@U)
(declare-fun PredicateType_Worker__is_a_ThreadType () T@T)
(declare-fun Worker__instance_of_Thread (T@U) T@U)
(declare-fun PredicateType_Worker__instance_of_ThreadType () T@T)
(declare-fun |Thread__is_a_Thread#trigger| (T@U T@U) Bool)
(declare-fun |Thread__is_a_Thread#everUsed| (T@U) Bool)
(declare-fun |Thread__instance_of_Thread#trigger| (T@U T@U) Bool)
(declare-fun |Thread__instance_of_Thread#everUsed| (T@U) Bool)
(declare-fun |Worker__is_a_Worker#trigger| (T@U T@U) Bool)
(declare-fun |Worker__is_a_Worker#everUsed| (T@U) Bool)
(declare-fun |Worker__instance_of_Worker#trigger| (T@U T@U) Bool)
(declare-fun |Worker__instance_of_Worker#everUsed| (T@U) Bool)
(declare-fun |Worker__is_a_Thread#trigger| (T@U T@U) Bool)
(declare-fun |Worker__is_a_Thread#everUsed| (T@U) Bool)
(declare-fun |Worker__instance_of_Thread#trigger| (T@U T@U) Bool)
(declare-fun |Worker__instance_of_Thread#everUsed| (T@U) Bool)
(declare-fun |Thread__joinToken#sm| (T@U Real) T@U)
(declare-fun |Thread__preFork#sm| (T@U Real) T@U)
(declare-fun |Thread__postJoin#sm| (T@U Real) T@U)
(declare-fun |Thread__joinToken_at_Thread#sm| (T@U Real) T@U)
(declare-fun |Thread__preFork_at_Thread#sm| (T@U Real) T@U)
(declare-fun |Thread__postJoin_at_Thread#sm| (T@U Real) T@U)
(declare-fun |Worker__joinToken#sm| (T@U Real) T@U)
(declare-fun |Worker__joinToken_at_Worker#sm| (T@U Real) T@U)
(declare-fun |Worker__preFork#sm| (T@U Real) T@U)
(declare-fun |Worker__postJoin#sm| (T@U Real) T@U)
(declare-fun |Worker__joinToken_at_Thread#sm| (T@U Real) T@U)
(declare-fun |Worker__preFork_at_Thread#sm| (T@U Real) T@U)
(declare-fun |Worker__postJoin_at_Thread#sm| (T@U Real) T@U)
(declare-fun |Worker__preFork_at_Worker#sm| (T@U Real) T@U)
(declare-fun |Worker__postJoin_at_Worker#sm| (T@U Real) T@U)
(declare-fun |Thread__is_a_Thread#sm| (T@U) T@U)
(declare-fun |Thread__instance_of_Thread#sm| (T@U) T@U)
(declare-fun |Worker__is_a_Worker#sm| (T@U) T@U)
(declare-fun |Worker__instance_of_Worker#sm| (T@U) T@U)
(declare-fun |Worker__is_a_Thread#sm| (T@U) T@U)
(declare-fun |Worker__instance_of_Thread#sm| (T@U) T@U)
(declare-fun dummyHeap () T@U)
(declare-fun ZeroMask () T@U)
(declare-fun InsidePredicate (T@U T@U T@U T@U) Bool)
(declare-fun sumMask (T@U T@U T@U) Bool)
(declare-fun ConditionalFrame (Real T@U) T@U)
(declare-fun EmptyFrame () T@U)
(declare-fun NoPerm () Real)
(declare-fun instanceof (T@U T@U) Bool)
(declare-fun class_Object () T@U)
(declare-fun TYPEDomainTypeType () T@T)
(declare-fun getPredWandId (T@U) Int)
(declare-fun FullPerm () Real)
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
))) (= (Ctor NormalFieldType) 7)) (= (type $allocated) (FieldType NormalFieldType boolType))) (= (type Worker__input) (FieldType NormalFieldType intType))) (= (type Worker__output) (FieldType NormalFieldType intType))))
(assert (distinct $allocated Worker__input Worker__output)
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
(assert  (and (and (= (Ctor PredicateType_Thread__joinTokenType) 11) (= (Ctor FrameTypeType) 12)) (forall ((arg0@@23 T@U) (arg1@@9 Real) ) (! (= (type (Thread__joinToken arg0@@23 arg1@@9)) (FieldType PredicateType_Thread__joinTokenType FrameTypeType))
 :qid |funType:Thread__joinToken|
 :pattern ( (Thread__joinToken arg0@@23 arg1@@9))
))))
(assert (forall ((diz T@U) (p_1 Real) ) (!  (=> (= (type diz) RefType) (IsPredicateField (Thread__joinToken diz p_1)))
 :qid |stdinbpl.298:15|
 :skolemid |36|
 :pattern ( (Thread__joinToken diz p_1))
)))
(assert  (and (= (Ctor PredicateType_Thread__preForkType) 13) (forall ((arg0@@24 T@U) (arg1@@10 Real) ) (! (= (type (Thread__preFork arg0@@24 arg1@@10)) (FieldType PredicateType_Thread__preForkType FrameTypeType))
 :qid |funType:Thread__preFork|
 :pattern ( (Thread__preFork arg0@@24 arg1@@10))
))))
(assert (forall ((diz@@0 T@U) (p_1@@0 Real) ) (!  (=> (= (type diz@@0) RefType) (IsPredicateField (Thread__preFork diz@@0 p_1@@0)))
 :qid |stdinbpl.333:15|
 :skolemid |42|
 :pattern ( (Thread__preFork diz@@0 p_1@@0))
)))
(assert  (and (= (Ctor PredicateType_Thread__postJoinType) 14) (forall ((arg0@@25 T@U) (arg1@@11 Real) ) (! (= (type (Thread__postJoin arg0@@25 arg1@@11)) (FieldType PredicateType_Thread__postJoinType FrameTypeType))
 :qid |funType:Thread__postJoin|
 :pattern ( (Thread__postJoin arg0@@25 arg1@@11))
))))
(assert (forall ((diz@@1 T@U) (p_1@@1 Real) ) (!  (=> (= (type diz@@1) RefType) (IsPredicateField (Thread__postJoin diz@@1 p_1@@1)))
 :qid |stdinbpl.368:15|
 :skolemid |48|
 :pattern ( (Thread__postJoin diz@@1 p_1@@1))
)))
(assert  (and (= (Ctor PredicateType_Thread__joinToken_at_ThreadType) 15) (forall ((arg0@@26 T@U) (arg1@@12 Real) ) (! (= (type (Thread__joinToken_at_Thread arg0@@26 arg1@@12)) (FieldType PredicateType_Thread__joinToken_at_ThreadType FrameTypeType))
 :qid |funType:Thread__joinToken_at_Thread|
 :pattern ( (Thread__joinToken_at_Thread arg0@@26 arg1@@12))
))))
(assert (forall ((diz@@2 T@U) (p_1@@2 Real) ) (!  (=> (= (type diz@@2) RefType) (IsPredicateField (Thread__joinToken_at_Thread diz@@2 p_1@@2)))
 :qid |stdinbpl.403:15|
 :skolemid |54|
 :pattern ( (Thread__joinToken_at_Thread diz@@2 p_1@@2))
)))
(assert  (and (= (Ctor PredicateType_Thread__preFork_at_ThreadType) 16) (forall ((arg0@@27 T@U) (arg1@@13 Real) ) (! (= (type (Thread__preFork_at_Thread arg0@@27 arg1@@13)) (FieldType PredicateType_Thread__preFork_at_ThreadType FrameTypeType))
 :qid |funType:Thread__preFork_at_Thread|
 :pattern ( (Thread__preFork_at_Thread arg0@@27 arg1@@13))
))))
(assert (forall ((diz@@3 T@U) (p_1@@3 Real) ) (!  (=> (= (type diz@@3) RefType) (IsPredicateField (Thread__preFork_at_Thread diz@@3 p_1@@3)))
 :qid |stdinbpl.438:15|
 :skolemid |60|
 :pattern ( (Thread__preFork_at_Thread diz@@3 p_1@@3))
)))
(assert  (and (= (Ctor PredicateType_Thread__postJoin_at_ThreadType) 17) (forall ((arg0@@28 T@U) (arg1@@14 Real) ) (! (= (type (Thread__postJoin_at_Thread arg0@@28 arg1@@14)) (FieldType PredicateType_Thread__postJoin_at_ThreadType FrameTypeType))
 :qid |funType:Thread__postJoin_at_Thread|
 :pattern ( (Thread__postJoin_at_Thread arg0@@28 arg1@@14))
))))
(assert (forall ((diz@@4 T@U) (p_1@@4 Real) ) (!  (=> (= (type diz@@4) RefType) (IsPredicateField (Thread__postJoin_at_Thread diz@@4 p_1@@4)))
 :qid |stdinbpl.486:15|
 :skolemid |66|
 :pattern ( (Thread__postJoin_at_Thread diz@@4 p_1@@4))
)))
(assert  (and (= (Ctor PredicateType_Worker__joinTokenType) 18) (forall ((arg0@@29 T@U) (arg1@@15 Real) ) (! (= (type (Worker__joinToken arg0@@29 arg1@@15)) (FieldType PredicateType_Worker__joinTokenType FrameTypeType))
 :qid |funType:Worker__joinToken|
 :pattern ( (Worker__joinToken arg0@@29 arg1@@15))
))))
(assert (forall ((diz@@5 T@U) (p_1@@5 Real) ) (!  (=> (= (type diz@@5) RefType) (IsPredicateField (Worker__joinToken diz@@5 p_1@@5)))
 :qid |stdinbpl.674:15|
 :skolemid |96|
 :pattern ( (Worker__joinToken diz@@5 p_1@@5))
)))
(assert  (and (= (Ctor PredicateType_Worker__joinToken_at_WorkerType) 19) (forall ((arg0@@30 T@U) (arg1@@16 Real) ) (! (= (type (Worker__joinToken_at_Worker arg0@@30 arg1@@16)) (FieldType PredicateType_Worker__joinToken_at_WorkerType FrameTypeType))
 :qid |funType:Worker__joinToken_at_Worker|
 :pattern ( (Worker__joinToken_at_Worker arg0@@30 arg1@@16))
))))
(assert (forall ((diz@@6 T@U) (p_1@@6 Real) ) (!  (=> (= (type diz@@6) RefType) (IsPredicateField (Worker__joinToken_at_Worker diz@@6 p_1@@6)))
 :qid |stdinbpl.709:15|
 :skolemid |102|
 :pattern ( (Worker__joinToken_at_Worker diz@@6 p_1@@6))
)))
(assert  (and (= (Ctor PredicateType_Worker__preForkType) 20) (forall ((arg0@@31 T@U) (arg1@@17 Real) ) (! (= (type (Worker__preFork arg0@@31 arg1@@17)) (FieldType PredicateType_Worker__preForkType FrameTypeType))
 :qid |funType:Worker__preFork|
 :pattern ( (Worker__preFork arg0@@31 arg1@@17))
))))
(assert (forall ((diz@@7 T@U) (p_1@@7 Real) ) (!  (=> (= (type diz@@7) RefType) (IsPredicateField (Worker__preFork diz@@7 p_1@@7)))
 :qid |stdinbpl.761:15|
 :skolemid |108|
 :pattern ( (Worker__preFork diz@@7 p_1@@7))
)))
(assert  (and (= (Ctor PredicateType_Worker__postJoinType) 21) (forall ((arg0@@32 T@U) (arg1@@18 Real) ) (! (= (type (Worker__postJoin arg0@@32 arg1@@18)) (FieldType PredicateType_Worker__postJoinType FrameTypeType))
 :qid |funType:Worker__postJoin|
 :pattern ( (Worker__postJoin arg0@@32 arg1@@18))
))))
(assert (forall ((diz@@8 T@U) (p_1@@8 Real) ) (!  (=> (= (type diz@@8) RefType) (IsPredicateField (Worker__postJoin diz@@8 p_1@@8)))
 :qid |stdinbpl.796:15|
 :skolemid |114|
 :pattern ( (Worker__postJoin diz@@8 p_1@@8))
)))
(assert  (and (= (Ctor PredicateType_Worker__joinToken_at_ThreadType) 22) (forall ((arg0@@33 T@U) (arg1@@19 Real) ) (! (= (type (Worker__joinToken_at_Thread arg0@@33 arg1@@19)) (FieldType PredicateType_Worker__joinToken_at_ThreadType FrameTypeType))
 :qid |funType:Worker__joinToken_at_Thread|
 :pattern ( (Worker__joinToken_at_Thread arg0@@33 arg1@@19))
))))
(assert (forall ((diz@@9 T@U) (p_1@@9 Real) ) (!  (=> (= (type diz@@9) RefType) (IsPredicateField (Worker__joinToken_at_Thread diz@@9 p_1@@9)))
 :qid |stdinbpl.831:15|
 :skolemid |120|
 :pattern ( (Worker__joinToken_at_Thread diz@@9 p_1@@9))
)))
(assert  (and (= (Ctor PredicateType_Worker__preFork_at_ThreadType) 23) (forall ((arg0@@34 T@U) (arg1@@20 Real) ) (! (= (type (Worker__preFork_at_Thread arg0@@34 arg1@@20)) (FieldType PredicateType_Worker__preFork_at_ThreadType FrameTypeType))
 :qid |funType:Worker__preFork_at_Thread|
 :pattern ( (Worker__preFork_at_Thread arg0@@34 arg1@@20))
))))
(assert (forall ((diz@@10 T@U) (p_1@@10 Real) ) (!  (=> (= (type diz@@10) RefType) (IsPredicateField (Worker__preFork_at_Thread diz@@10 p_1@@10)))
 :qid |stdinbpl.866:15|
 :skolemid |126|
 :pattern ( (Worker__preFork_at_Thread diz@@10 p_1@@10))
)))
(assert  (and (= (Ctor PredicateType_Worker__postJoin_at_ThreadType) 24) (forall ((arg0@@35 T@U) (arg1@@21 Real) ) (! (= (type (Worker__postJoin_at_Thread arg0@@35 arg1@@21)) (FieldType PredicateType_Worker__postJoin_at_ThreadType FrameTypeType))
 :qid |funType:Worker__postJoin_at_Thread|
 :pattern ( (Worker__postJoin_at_Thread arg0@@35 arg1@@21))
))))
(assert (forall ((diz@@11 T@U) (p_1@@11 Real) ) (!  (=> (= (type diz@@11) RefType) (IsPredicateField (Worker__postJoin_at_Thread diz@@11 p_1@@11)))
 :qid |stdinbpl.914:15|
 :skolemid |132|
 :pattern ( (Worker__postJoin_at_Thread diz@@11 p_1@@11))
)))
(assert  (and (= (Ctor PredicateType_Worker__preFork_at_WorkerType) 25) (forall ((arg0@@36 T@U) (arg1@@22 Real) ) (! (= (type (Worker__preFork_at_Worker arg0@@36 arg1@@22)) (FieldType PredicateType_Worker__preFork_at_WorkerType FrameTypeType))
 :qid |funType:Worker__preFork_at_Worker|
 :pattern ( (Worker__preFork_at_Worker arg0@@36 arg1@@22))
))))
(assert (forall ((diz@@12 T@U) (p_1@@12 Real) ) (!  (=> (= (type diz@@12) RefType) (IsPredicateField (Worker__preFork_at_Worker diz@@12 p_1@@12)))
 :qid |stdinbpl.962:15|
 :skolemid |138|
 :pattern ( (Worker__preFork_at_Worker diz@@12 p_1@@12))
)))
(assert  (and (= (Ctor PredicateType_Worker__postJoin_at_WorkerType) 26) (forall ((arg0@@37 T@U) (arg1@@23 Real) ) (! (= (type (Worker__postJoin_at_Worker arg0@@37 arg1@@23)) (FieldType PredicateType_Worker__postJoin_at_WorkerType FrameTypeType))
 :qid |funType:Worker__postJoin_at_Worker|
 :pattern ( (Worker__postJoin_at_Worker arg0@@37 arg1@@23))
))))
(assert (forall ((diz@@13 T@U) (p_1@@13 Real) ) (!  (=> (= (type diz@@13) RefType) (IsPredicateField (Worker__postJoin_at_Worker diz@@13 p_1@@13)))
 :qid |stdinbpl.1028:15|
 :skolemid |144|
 :pattern ( (Worker__postJoin_at_Worker diz@@13 p_1@@13))
)))
(assert (forall ((Heap@@0 T@U) (diz@@14 T@U) (p_1@@14 Real) ) (!  (=> (and (= (type Heap@@0) (MapType0Type RefType)) (= (type diz@@14) RefType)) (|Thread__joinToken#everUsed| (Thread__joinToken diz@@14 p_1@@14)))
 :qid |stdinbpl.317:15|
 :skolemid |40|
 :pattern ( (|Thread__joinToken#trigger| Heap@@0 (Thread__joinToken diz@@14 p_1@@14)))
)))
(assert (forall ((Heap@@1 T@U) (diz@@15 T@U) (p_1@@15 Real) ) (!  (=> (and (= (type Heap@@1) (MapType0Type RefType)) (= (type diz@@15) RefType)) (|Thread__preFork#everUsed| (Thread__preFork diz@@15 p_1@@15)))
 :qid |stdinbpl.352:15|
 :skolemid |46|
 :pattern ( (|Thread__preFork#trigger| Heap@@1 (Thread__preFork diz@@15 p_1@@15)))
)))
(assert (forall ((Heap@@2 T@U) (diz@@16 T@U) (p_1@@16 Real) ) (!  (=> (and (= (type Heap@@2) (MapType0Type RefType)) (= (type diz@@16) RefType)) (|Thread__postJoin#everUsed| (Thread__postJoin diz@@16 p_1@@16)))
 :qid |stdinbpl.387:15|
 :skolemid |52|
 :pattern ( (|Thread__postJoin#trigger| Heap@@2 (Thread__postJoin diz@@16 p_1@@16)))
)))
(assert (forall ((Heap@@3 T@U) (diz@@17 T@U) (p_1@@17 Real) ) (!  (=> (and (= (type Heap@@3) (MapType0Type RefType)) (= (type diz@@17) RefType)) (|Thread__joinToken_at_Thread#everUsed| (Thread__joinToken_at_Thread diz@@17 p_1@@17)))
 :qid |stdinbpl.422:15|
 :skolemid |58|
 :pattern ( (|Thread__joinToken_at_Thread#trigger| Heap@@3 (Thread__joinToken_at_Thread diz@@17 p_1@@17)))
)))
(assert (forall ((Heap@@4 T@U) (diz@@18 T@U) (p_1@@18 Real) ) (!  (=> (and (= (type Heap@@4) (MapType0Type RefType)) (= (type diz@@18) RefType)) (|Thread__preFork_at_Thread#everUsed| (Thread__preFork_at_Thread diz@@18 p_1@@18)))
 :qid |stdinbpl.457:15|
 :skolemid |64|
 :pattern ( (|Thread__preFork_at_Thread#trigger| Heap@@4 (Thread__preFork_at_Thread diz@@18 p_1@@18)))
)))
(assert (forall ((Heap@@5 T@U) (diz@@19 T@U) (p_1@@19 Real) ) (!  (=> (and (= (type Heap@@5) (MapType0Type RefType)) (= (type diz@@19) RefType)) (|Thread__postJoin_at_Thread#everUsed| (Thread__postJoin_at_Thread diz@@19 p_1@@19)))
 :qid |stdinbpl.505:15|
 :skolemid |70|
 :pattern ( (|Thread__postJoin_at_Thread#trigger| Heap@@5 (Thread__postJoin_at_Thread diz@@19 p_1@@19)))
)))
(assert (forall ((Heap@@6 T@U) (diz@@20 T@U) (p_1@@20 Real) ) (!  (=> (and (= (type Heap@@6) (MapType0Type RefType)) (= (type diz@@20) RefType)) (|Worker__joinToken#everUsed| (Worker__joinToken diz@@20 p_1@@20)))
 :qid |stdinbpl.693:15|
 :skolemid |100|
 :pattern ( (|Worker__joinToken#trigger| Heap@@6 (Worker__joinToken diz@@20 p_1@@20)))
)))
(assert (forall ((Heap@@7 T@U) (diz@@21 T@U) (p_1@@21 Real) ) (!  (=> (and (= (type Heap@@7) (MapType0Type RefType)) (= (type diz@@21) RefType)) (|Worker__joinToken_at_Worker#everUsed| (Worker__joinToken_at_Worker diz@@21 p_1@@21)))
 :qid |stdinbpl.728:15|
 :skolemid |106|
 :pattern ( (|Worker__joinToken_at_Worker#trigger| Heap@@7 (Worker__joinToken_at_Worker diz@@21 p_1@@21)))
)))
(assert (forall ((Heap@@8 T@U) (diz@@22 T@U) (p_1@@22 Real) ) (!  (=> (and (= (type Heap@@8) (MapType0Type RefType)) (= (type diz@@22) RefType)) (|Worker__preFork#everUsed| (Worker__preFork diz@@22 p_1@@22)))
 :qid |stdinbpl.780:15|
 :skolemid |112|
 :pattern ( (|Worker__preFork#trigger| Heap@@8 (Worker__preFork diz@@22 p_1@@22)))
)))
(assert (forall ((Heap@@9 T@U) (diz@@23 T@U) (p_1@@23 Real) ) (!  (=> (and (= (type Heap@@9) (MapType0Type RefType)) (= (type diz@@23) RefType)) (|Worker__postJoin#everUsed| (Worker__postJoin diz@@23 p_1@@23)))
 :qid |stdinbpl.815:15|
 :skolemid |118|
 :pattern ( (|Worker__postJoin#trigger| Heap@@9 (Worker__postJoin diz@@23 p_1@@23)))
)))
(assert (forall ((Heap@@10 T@U) (diz@@24 T@U) (p_1@@24 Real) ) (!  (=> (and (= (type Heap@@10) (MapType0Type RefType)) (= (type diz@@24) RefType)) (|Worker__joinToken_at_Thread#everUsed| (Worker__joinToken_at_Thread diz@@24 p_1@@24)))
 :qid |stdinbpl.850:15|
 :skolemid |124|
 :pattern ( (|Worker__joinToken_at_Thread#trigger| Heap@@10 (Worker__joinToken_at_Thread diz@@24 p_1@@24)))
)))
(assert (forall ((Heap@@11 T@U) (diz@@25 T@U) (p_1@@25 Real) ) (!  (=> (and (= (type Heap@@11) (MapType0Type RefType)) (= (type diz@@25) RefType)) (|Worker__preFork_at_Thread#everUsed| (Worker__preFork_at_Thread diz@@25 p_1@@25)))
 :qid |stdinbpl.885:15|
 :skolemid |130|
 :pattern ( (|Worker__preFork_at_Thread#trigger| Heap@@11 (Worker__preFork_at_Thread diz@@25 p_1@@25)))
)))
(assert (forall ((Heap@@12 T@U) (diz@@26 T@U) (p_1@@26 Real) ) (!  (=> (and (= (type Heap@@12) (MapType0Type RefType)) (= (type diz@@26) RefType)) (|Worker__postJoin_at_Thread#everUsed| (Worker__postJoin_at_Thread diz@@26 p_1@@26)))
 :qid |stdinbpl.933:15|
 :skolemid |136|
 :pattern ( (|Worker__postJoin_at_Thread#trigger| Heap@@12 (Worker__postJoin_at_Thread diz@@26 p_1@@26)))
)))
(assert (forall ((Heap@@13 T@U) (diz@@27 T@U) (p_1@@27 Real) ) (!  (=> (and (= (type Heap@@13) (MapType0Type RefType)) (= (type diz@@27) RefType)) (|Worker__preFork_at_Worker#everUsed| (Worker__preFork_at_Worker diz@@27 p_1@@27)))
 :qid |stdinbpl.981:15|
 :skolemid |142|
 :pattern ( (|Worker__preFork_at_Worker#trigger| Heap@@13 (Worker__preFork_at_Worker diz@@27 p_1@@27)))
)))
(assert (forall ((Heap@@14 T@U) (diz@@28 T@U) (p_1@@28 Real) ) (!  (=> (and (= (type Heap@@14) (MapType0Type RefType)) (= (type diz@@28) RefType)) (|Worker__postJoin_at_Worker#everUsed| (Worker__postJoin_at_Worker diz@@28 p_1@@28)))
 :qid |stdinbpl.1047:15|
 :skolemid |148|
 :pattern ( (|Worker__postJoin_at_Worker#trigger| Heap@@14 (Worker__postJoin_at_Worker diz@@28 p_1@@28)))
)))
(assert  (and (= (type null) RefType) (forall ((arg0@@38 T@U) ) (! (let ((A (FieldTypeInv0 (type arg0@@38))))
(= (type (PredicateMaskField arg0@@38)) (FieldType A (MapType1Type RefType boolType))))
 :qid |funType:PredicateMaskField|
 :pattern ( (PredicateMaskField arg0@@38))
))))
(assert (forall ((Heap@@15 T@U) (ExhaleHeap T@U) (Mask@@0 T@U) (pm_f T@U) ) (! (let ((C (FieldTypeInv0 (type pm_f))))
 (=> (and (and (and (and (and (= (type Heap@@15) (MapType0Type RefType)) (= (type ExhaleHeap) (MapType0Type RefType))) (= (type Mask@@0) (MapType1Type RefType realType))) (= (type pm_f) (FieldType C FrameTypeType))) (IdenticalOnKnownLocations Heap@@15 ExhaleHeap Mask@@0)) (and (HasDirectPerm Mask@@0 null pm_f) (IsPredicateField pm_f))) (= (MapType0Select Heap@@15 null (PredicateMaskField pm_f)) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))))
 :qid |stdinbpl.47:19|
 :skolemid |2|
 :pattern ( (IdenticalOnKnownLocations Heap@@15 ExhaleHeap Mask@@0) (IsPredicateField pm_f) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))
)))
(assert (forall ((arg0@@39 T@U) ) (! (let ((A@@0 (FieldTypeInv0 (type arg0@@39))))
(= (type (WandMaskField arg0@@39)) (FieldType A@@0 (MapType1Type RefType boolType))))
 :qid |funType:WandMaskField|
 :pattern ( (WandMaskField arg0@@39))
)))
(assert (forall ((Heap@@16 T@U) (ExhaleHeap@@0 T@U) (Mask@@1 T@U) (pm_f@@0 T@U) ) (! (let ((C@@0 (FieldTypeInv0 (type pm_f@@0))))
 (=> (and (and (and (and (and (= (type Heap@@16) (MapType0Type RefType)) (= (type ExhaleHeap@@0) (MapType0Type RefType))) (= (type Mask@@1) (MapType1Type RefType realType))) (= (type pm_f@@0) (FieldType C@@0 FrameTypeType))) (IdenticalOnKnownLocations Heap@@16 ExhaleHeap@@0 Mask@@1)) (and (HasDirectPerm Mask@@1 null pm_f@@0) (IsWandField pm_f@@0))) (= (MapType0Select Heap@@16 null (WandMaskField pm_f@@0)) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))))
 :qid |stdinbpl.60:19|
 :skolemid |5|
 :pattern ( (IdenticalOnKnownLocations Heap@@16 ExhaleHeap@@0 Mask@@1) (IsWandField pm_f@@0) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))
)))
(assert  (and (= (Ctor PredicateType_Thread__is_a_ThreadType) 27) (forall ((arg0@@40 T@U) ) (! (= (type (Thread__is_a_Thread arg0@@40)) (FieldType PredicateType_Thread__is_a_ThreadType FrameTypeType))
 :qid |funType:Thread__is_a_Thread|
 :pattern ( (Thread__is_a_Thread arg0@@40))
))))
(assert (forall ((diz@@29 T@U) ) (!  (=> (= (type diz@@29) RefType) (IsPredicateField (Thread__is_a_Thread diz@@29)))
 :qid |stdinbpl.228:15|
 :skolemid |24|
 :pattern ( (Thread__is_a_Thread diz@@29))
)))
(assert  (and (= (Ctor PredicateType_Thread__instance_of_ThreadType) 28) (forall ((arg0@@41 T@U) ) (! (= (type (Thread__instance_of_Thread arg0@@41)) (FieldType PredicateType_Thread__instance_of_ThreadType FrameTypeType))
 :qid |funType:Thread__instance_of_Thread|
 :pattern ( (Thread__instance_of_Thread arg0@@41))
))))
(assert (forall ((diz@@30 T@U) ) (!  (=> (= (type diz@@30) RefType) (IsPredicateField (Thread__instance_of_Thread diz@@30)))
 :qid |stdinbpl.263:15|
 :skolemid |30|
 :pattern ( (Thread__instance_of_Thread diz@@30))
)))
(assert  (and (= (Ctor PredicateType_Worker__is_a_WorkerType) 29) (forall ((arg0@@42 T@U) ) (! (= (type (Worker__is_a_Worker arg0@@42)) (FieldType PredicateType_Worker__is_a_WorkerType FrameTypeType))
 :qid |funType:Worker__is_a_Worker|
 :pattern ( (Worker__is_a_Worker arg0@@42))
))))
(assert (forall ((diz@@31 T@U) ) (!  (=> (= (type diz@@31) RefType) (IsPredicateField (Worker__is_a_Worker diz@@31)))
 :qid |stdinbpl.534:15|
 :skolemid |72|
 :pattern ( (Worker__is_a_Worker diz@@31))
)))
(assert  (and (= (Ctor PredicateType_Worker__instance_of_WorkerType) 30) (forall ((arg0@@43 T@U) ) (! (= (type (Worker__instance_of_Worker arg0@@43)) (FieldType PredicateType_Worker__instance_of_WorkerType FrameTypeType))
 :qid |funType:Worker__instance_of_Worker|
 :pattern ( (Worker__instance_of_Worker arg0@@43))
))))
(assert (forall ((diz@@32 T@U) ) (!  (=> (= (type diz@@32) RefType) (IsPredicateField (Worker__instance_of_Worker diz@@32)))
 :qid |stdinbpl.569:15|
 :skolemid |78|
 :pattern ( (Worker__instance_of_Worker diz@@32))
)))
(assert  (and (= (Ctor PredicateType_Worker__is_a_ThreadType) 31) (forall ((arg0@@44 T@U) ) (! (= (type (Worker__is_a_Thread arg0@@44)) (FieldType PredicateType_Worker__is_a_ThreadType FrameTypeType))
 :qid |funType:Worker__is_a_Thread|
 :pattern ( (Worker__is_a_Thread arg0@@44))
))))
(assert (forall ((diz@@33 T@U) ) (!  (=> (= (type diz@@33) RefType) (IsPredicateField (Worker__is_a_Thread diz@@33)))
 :qid |stdinbpl.604:15|
 :skolemid |84|
 :pattern ( (Worker__is_a_Thread diz@@33))
)))
(assert  (and (= (Ctor PredicateType_Worker__instance_of_ThreadType) 32) (forall ((arg0@@45 T@U) ) (! (= (type (Worker__instance_of_Thread arg0@@45)) (FieldType PredicateType_Worker__instance_of_ThreadType FrameTypeType))
 :qid |funType:Worker__instance_of_Thread|
 :pattern ( (Worker__instance_of_Thread arg0@@45))
))))
(assert (forall ((diz@@34 T@U) ) (!  (=> (= (type diz@@34) RefType) (IsPredicateField (Worker__instance_of_Thread diz@@34)))
 :qid |stdinbpl.639:15|
 :skolemid |90|
 :pattern ( (Worker__instance_of_Thread diz@@34))
)))
(assert (forall ((Heap@@17 T@U) (diz@@35 T@U) ) (!  (=> (and (= (type Heap@@17) (MapType0Type RefType)) (= (type diz@@35) RefType)) (|Thread__is_a_Thread#everUsed| (Thread__is_a_Thread diz@@35)))
 :qid |stdinbpl.247:15|
 :skolemid |28|
 :pattern ( (|Thread__is_a_Thread#trigger| Heap@@17 (Thread__is_a_Thread diz@@35)))
)))
(assert (forall ((Heap@@18 T@U) (diz@@36 T@U) ) (!  (=> (and (= (type Heap@@18) (MapType0Type RefType)) (= (type diz@@36) RefType)) (|Thread__instance_of_Thread#everUsed| (Thread__instance_of_Thread diz@@36)))
 :qid |stdinbpl.282:15|
 :skolemid |34|
 :pattern ( (|Thread__instance_of_Thread#trigger| Heap@@18 (Thread__instance_of_Thread diz@@36)))
)))
(assert (forall ((Heap@@19 T@U) (diz@@37 T@U) ) (!  (=> (and (= (type Heap@@19) (MapType0Type RefType)) (= (type diz@@37) RefType)) (|Worker__is_a_Worker#everUsed| (Worker__is_a_Worker diz@@37)))
 :qid |stdinbpl.553:15|
 :skolemid |76|
 :pattern ( (|Worker__is_a_Worker#trigger| Heap@@19 (Worker__is_a_Worker diz@@37)))
)))
(assert (forall ((Heap@@20 T@U) (diz@@38 T@U) ) (!  (=> (and (= (type Heap@@20) (MapType0Type RefType)) (= (type diz@@38) RefType)) (|Worker__instance_of_Worker#everUsed| (Worker__instance_of_Worker diz@@38)))
 :qid |stdinbpl.588:15|
 :skolemid |82|
 :pattern ( (|Worker__instance_of_Worker#trigger| Heap@@20 (Worker__instance_of_Worker diz@@38)))
)))
(assert (forall ((Heap@@21 T@U) (diz@@39 T@U) ) (!  (=> (and (= (type Heap@@21) (MapType0Type RefType)) (= (type diz@@39) RefType)) (|Worker__is_a_Thread#everUsed| (Worker__is_a_Thread diz@@39)))
 :qid |stdinbpl.623:15|
 :skolemid |88|
 :pattern ( (|Worker__is_a_Thread#trigger| Heap@@21 (Worker__is_a_Thread diz@@39)))
)))
(assert (forall ((Heap@@22 T@U) (diz@@40 T@U) ) (!  (=> (and (= (type Heap@@22) (MapType0Type RefType)) (= (type diz@@40) RefType)) (|Worker__instance_of_Thread#everUsed| (Worker__instance_of_Thread diz@@40)))
 :qid |stdinbpl.658:15|
 :skolemid |94|
 :pattern ( (|Worker__instance_of_Thread#trigger| Heap@@22 (Worker__instance_of_Thread diz@@40)))
)))
(assert (forall ((Heap@@23 T@U) (ExhaleHeap@@1 T@U) (Mask@@2 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@23) (MapType0Type RefType)) (= (type ExhaleHeap@@1) (MapType0Type RefType))) (= (type Mask@@2) (MapType1Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@23 ExhaleHeap@@1 Mask@@2)) (U_2_bool (MapType0Select Heap@@23 o_1 $allocated))) (U_2_bool (MapType0Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.73:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@23 ExhaleHeap@@1 Mask@@2) (MapType0Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert (forall ((diz@@41 T@U) (p_1@@29 Real) (diz2 T@U) (p2 Real) ) (!  (=> (and (and (= (type diz@@41) RefType) (= (type diz2) RefType)) (= (Thread__joinToken diz@@41 p_1@@29) (Thread__joinToken diz2 p2))) (and (= diz@@41 diz2) (= p_1@@29 p2)))
 :qid |stdinbpl.308:15|
 :skolemid |38|
 :pattern ( (Thread__joinToken diz@@41 p_1@@29) (Thread__joinToken diz2 p2))
)))
(assert (forall ((arg0@@46 T@U) (arg1@@24 Real) ) (! (= (type (|Thread__joinToken#sm| arg0@@46 arg1@@24)) (FieldType PredicateType_Thread__joinTokenType (MapType1Type RefType boolType)))
 :qid |funType:Thread__joinToken#sm|
 :pattern ( (|Thread__joinToken#sm| arg0@@46 arg1@@24))
)))
(assert (forall ((diz@@42 T@U) (p_1@@30 Real) (diz2@@0 T@U) (p2@@0 Real) ) (!  (=> (and (and (= (type diz@@42) RefType) (= (type diz2@@0) RefType)) (= (|Thread__joinToken#sm| diz@@42 p_1@@30) (|Thread__joinToken#sm| diz2@@0 p2@@0))) (and (= diz@@42 diz2@@0) (= p_1@@30 p2@@0)))
 :qid |stdinbpl.312:15|
 :skolemid |39|
 :pattern ( (|Thread__joinToken#sm| diz@@42 p_1@@30) (|Thread__joinToken#sm| diz2@@0 p2@@0))
)))
(assert (forall ((diz@@43 T@U) (p_1@@31 Real) (diz2@@1 T@U) (p2@@1 Real) ) (!  (=> (and (and (= (type diz@@43) RefType) (= (type diz2@@1) RefType)) (= (Thread__preFork diz@@43 p_1@@31) (Thread__preFork diz2@@1 p2@@1))) (and (= diz@@43 diz2@@1) (= p_1@@31 p2@@1)))
 :qid |stdinbpl.343:15|
 :skolemid |44|
 :pattern ( (Thread__preFork diz@@43 p_1@@31) (Thread__preFork diz2@@1 p2@@1))
)))
(assert (forall ((arg0@@47 T@U) (arg1@@25 Real) ) (! (= (type (|Thread__preFork#sm| arg0@@47 arg1@@25)) (FieldType PredicateType_Thread__preForkType (MapType1Type RefType boolType)))
 :qid |funType:Thread__preFork#sm|
 :pattern ( (|Thread__preFork#sm| arg0@@47 arg1@@25))
)))
(assert (forall ((diz@@44 T@U) (p_1@@32 Real) (diz2@@2 T@U) (p2@@2 Real) ) (!  (=> (and (and (= (type diz@@44) RefType) (= (type diz2@@2) RefType)) (= (|Thread__preFork#sm| diz@@44 p_1@@32) (|Thread__preFork#sm| diz2@@2 p2@@2))) (and (= diz@@44 diz2@@2) (= p_1@@32 p2@@2)))
 :qid |stdinbpl.347:15|
 :skolemid |45|
 :pattern ( (|Thread__preFork#sm| diz@@44 p_1@@32) (|Thread__preFork#sm| diz2@@2 p2@@2))
)))
(assert (forall ((diz@@45 T@U) (p_1@@33 Real) (diz2@@3 T@U) (p2@@3 Real) ) (!  (=> (and (and (= (type diz@@45) RefType) (= (type diz2@@3) RefType)) (= (Thread__postJoin diz@@45 p_1@@33) (Thread__postJoin diz2@@3 p2@@3))) (and (= diz@@45 diz2@@3) (= p_1@@33 p2@@3)))
 :qid |stdinbpl.378:15|
 :skolemid |50|
 :pattern ( (Thread__postJoin diz@@45 p_1@@33) (Thread__postJoin diz2@@3 p2@@3))
)))
(assert (forall ((arg0@@48 T@U) (arg1@@26 Real) ) (! (= (type (|Thread__postJoin#sm| arg0@@48 arg1@@26)) (FieldType PredicateType_Thread__postJoinType (MapType1Type RefType boolType)))
 :qid |funType:Thread__postJoin#sm|
 :pattern ( (|Thread__postJoin#sm| arg0@@48 arg1@@26))
)))
(assert (forall ((diz@@46 T@U) (p_1@@34 Real) (diz2@@4 T@U) (p2@@4 Real) ) (!  (=> (and (and (= (type diz@@46) RefType) (= (type diz2@@4) RefType)) (= (|Thread__postJoin#sm| diz@@46 p_1@@34) (|Thread__postJoin#sm| diz2@@4 p2@@4))) (and (= diz@@46 diz2@@4) (= p_1@@34 p2@@4)))
 :qid |stdinbpl.382:15|
 :skolemid |51|
 :pattern ( (|Thread__postJoin#sm| diz@@46 p_1@@34) (|Thread__postJoin#sm| diz2@@4 p2@@4))
)))
(assert (forall ((diz@@47 T@U) (p_1@@35 Real) (diz2@@5 T@U) (p2@@5 Real) ) (!  (=> (and (and (= (type diz@@47) RefType) (= (type diz2@@5) RefType)) (= (Thread__joinToken_at_Thread diz@@47 p_1@@35) (Thread__joinToken_at_Thread diz2@@5 p2@@5))) (and (= diz@@47 diz2@@5) (= p_1@@35 p2@@5)))
 :qid |stdinbpl.413:15|
 :skolemid |56|
 :pattern ( (Thread__joinToken_at_Thread diz@@47 p_1@@35) (Thread__joinToken_at_Thread diz2@@5 p2@@5))
)))
(assert (forall ((arg0@@49 T@U) (arg1@@27 Real) ) (! (= (type (|Thread__joinToken_at_Thread#sm| arg0@@49 arg1@@27)) (FieldType PredicateType_Thread__joinToken_at_ThreadType (MapType1Type RefType boolType)))
 :qid |funType:Thread__joinToken_at_Thread#sm|
 :pattern ( (|Thread__joinToken_at_Thread#sm| arg0@@49 arg1@@27))
)))
(assert (forall ((diz@@48 T@U) (p_1@@36 Real) (diz2@@6 T@U) (p2@@6 Real) ) (!  (=> (and (and (= (type diz@@48) RefType) (= (type diz2@@6) RefType)) (= (|Thread__joinToken_at_Thread#sm| diz@@48 p_1@@36) (|Thread__joinToken_at_Thread#sm| diz2@@6 p2@@6))) (and (= diz@@48 diz2@@6) (= p_1@@36 p2@@6)))
 :qid |stdinbpl.417:15|
 :skolemid |57|
 :pattern ( (|Thread__joinToken_at_Thread#sm| diz@@48 p_1@@36) (|Thread__joinToken_at_Thread#sm| diz2@@6 p2@@6))
)))
(assert (forall ((diz@@49 T@U) (p_1@@37 Real) (diz2@@7 T@U) (p2@@7 Real) ) (!  (=> (and (and (= (type diz@@49) RefType) (= (type diz2@@7) RefType)) (= (Thread__preFork_at_Thread diz@@49 p_1@@37) (Thread__preFork_at_Thread diz2@@7 p2@@7))) (and (= diz@@49 diz2@@7) (= p_1@@37 p2@@7)))
 :qid |stdinbpl.448:15|
 :skolemid |62|
 :pattern ( (Thread__preFork_at_Thread diz@@49 p_1@@37) (Thread__preFork_at_Thread diz2@@7 p2@@7))
)))
(assert (forall ((arg0@@50 T@U) (arg1@@28 Real) ) (! (= (type (|Thread__preFork_at_Thread#sm| arg0@@50 arg1@@28)) (FieldType PredicateType_Thread__preFork_at_ThreadType (MapType1Type RefType boolType)))
 :qid |funType:Thread__preFork_at_Thread#sm|
 :pattern ( (|Thread__preFork_at_Thread#sm| arg0@@50 arg1@@28))
)))
(assert (forall ((diz@@50 T@U) (p_1@@38 Real) (diz2@@8 T@U) (p2@@8 Real) ) (!  (=> (and (and (= (type diz@@50) RefType) (= (type diz2@@8) RefType)) (= (|Thread__preFork_at_Thread#sm| diz@@50 p_1@@38) (|Thread__preFork_at_Thread#sm| diz2@@8 p2@@8))) (and (= diz@@50 diz2@@8) (= p_1@@38 p2@@8)))
 :qid |stdinbpl.452:15|
 :skolemid |63|
 :pattern ( (|Thread__preFork_at_Thread#sm| diz@@50 p_1@@38) (|Thread__preFork_at_Thread#sm| diz2@@8 p2@@8))
)))
(assert (forall ((diz@@51 T@U) (p_1@@39 Real) (diz2@@9 T@U) (p2@@9 Real) ) (!  (=> (and (and (= (type diz@@51) RefType) (= (type diz2@@9) RefType)) (= (Thread__postJoin_at_Thread diz@@51 p_1@@39) (Thread__postJoin_at_Thread diz2@@9 p2@@9))) (and (= diz@@51 diz2@@9) (= p_1@@39 p2@@9)))
 :qid |stdinbpl.496:15|
 :skolemid |68|
 :pattern ( (Thread__postJoin_at_Thread diz@@51 p_1@@39) (Thread__postJoin_at_Thread diz2@@9 p2@@9))
)))
(assert (forall ((arg0@@51 T@U) (arg1@@29 Real) ) (! (= (type (|Thread__postJoin_at_Thread#sm| arg0@@51 arg1@@29)) (FieldType PredicateType_Thread__postJoin_at_ThreadType (MapType1Type RefType boolType)))
 :qid |funType:Thread__postJoin_at_Thread#sm|
 :pattern ( (|Thread__postJoin_at_Thread#sm| arg0@@51 arg1@@29))
)))
(assert (forall ((diz@@52 T@U) (p_1@@40 Real) (diz2@@10 T@U) (p2@@10 Real) ) (!  (=> (and (and (= (type diz@@52) RefType) (= (type diz2@@10) RefType)) (= (|Thread__postJoin_at_Thread#sm| diz@@52 p_1@@40) (|Thread__postJoin_at_Thread#sm| diz2@@10 p2@@10))) (and (= diz@@52 diz2@@10) (= p_1@@40 p2@@10)))
 :qid |stdinbpl.500:15|
 :skolemid |69|
 :pattern ( (|Thread__postJoin_at_Thread#sm| diz@@52 p_1@@40) (|Thread__postJoin_at_Thread#sm| diz2@@10 p2@@10))
)))
(assert (forall ((diz@@53 T@U) (p_1@@41 Real) (diz2@@11 T@U) (p2@@11 Real) ) (!  (=> (and (and (= (type diz@@53) RefType) (= (type diz2@@11) RefType)) (= (Worker__joinToken diz@@53 p_1@@41) (Worker__joinToken diz2@@11 p2@@11))) (and (= diz@@53 diz2@@11) (= p_1@@41 p2@@11)))
 :qid |stdinbpl.684:15|
 :skolemid |98|
 :pattern ( (Worker__joinToken diz@@53 p_1@@41) (Worker__joinToken diz2@@11 p2@@11))
)))
(assert (forall ((arg0@@52 T@U) (arg1@@30 Real) ) (! (= (type (|Worker__joinToken#sm| arg0@@52 arg1@@30)) (FieldType PredicateType_Worker__joinTokenType (MapType1Type RefType boolType)))
 :qid |funType:Worker__joinToken#sm|
 :pattern ( (|Worker__joinToken#sm| arg0@@52 arg1@@30))
)))
(assert (forall ((diz@@54 T@U) (p_1@@42 Real) (diz2@@12 T@U) (p2@@12 Real) ) (!  (=> (and (and (= (type diz@@54) RefType) (= (type diz2@@12) RefType)) (= (|Worker__joinToken#sm| diz@@54 p_1@@42) (|Worker__joinToken#sm| diz2@@12 p2@@12))) (and (= diz@@54 diz2@@12) (= p_1@@42 p2@@12)))
 :qid |stdinbpl.688:15|
 :skolemid |99|
 :pattern ( (|Worker__joinToken#sm| diz@@54 p_1@@42) (|Worker__joinToken#sm| diz2@@12 p2@@12))
)))
(assert (forall ((diz@@55 T@U) (p_1@@43 Real) (diz2@@13 T@U) (p2@@13 Real) ) (!  (=> (and (and (= (type diz@@55) RefType) (= (type diz2@@13) RefType)) (= (Worker__joinToken_at_Worker diz@@55 p_1@@43) (Worker__joinToken_at_Worker diz2@@13 p2@@13))) (and (= diz@@55 diz2@@13) (= p_1@@43 p2@@13)))
 :qid |stdinbpl.719:15|
 :skolemid |104|
 :pattern ( (Worker__joinToken_at_Worker diz@@55 p_1@@43) (Worker__joinToken_at_Worker diz2@@13 p2@@13))
)))
(assert (forall ((arg0@@53 T@U) (arg1@@31 Real) ) (! (= (type (|Worker__joinToken_at_Worker#sm| arg0@@53 arg1@@31)) (FieldType PredicateType_Worker__joinToken_at_WorkerType (MapType1Type RefType boolType)))
 :qid |funType:Worker__joinToken_at_Worker#sm|
 :pattern ( (|Worker__joinToken_at_Worker#sm| arg0@@53 arg1@@31))
)))
(assert (forall ((diz@@56 T@U) (p_1@@44 Real) (diz2@@14 T@U) (p2@@14 Real) ) (!  (=> (and (and (= (type diz@@56) RefType) (= (type diz2@@14) RefType)) (= (|Worker__joinToken_at_Worker#sm| diz@@56 p_1@@44) (|Worker__joinToken_at_Worker#sm| diz2@@14 p2@@14))) (and (= diz@@56 diz2@@14) (= p_1@@44 p2@@14)))
 :qid |stdinbpl.723:15|
 :skolemid |105|
 :pattern ( (|Worker__joinToken_at_Worker#sm| diz@@56 p_1@@44) (|Worker__joinToken_at_Worker#sm| diz2@@14 p2@@14))
)))
(assert (forall ((diz@@57 T@U) (p_1@@45 Real) (diz2@@15 T@U) (p2@@15 Real) ) (!  (=> (and (and (= (type diz@@57) RefType) (= (type diz2@@15) RefType)) (= (Worker__preFork diz@@57 p_1@@45) (Worker__preFork diz2@@15 p2@@15))) (and (= diz@@57 diz2@@15) (= p_1@@45 p2@@15)))
 :qid |stdinbpl.771:15|
 :skolemid |110|
 :pattern ( (Worker__preFork diz@@57 p_1@@45) (Worker__preFork diz2@@15 p2@@15))
)))
(assert (forall ((arg0@@54 T@U) (arg1@@32 Real) ) (! (= (type (|Worker__preFork#sm| arg0@@54 arg1@@32)) (FieldType PredicateType_Worker__preForkType (MapType1Type RefType boolType)))
 :qid |funType:Worker__preFork#sm|
 :pattern ( (|Worker__preFork#sm| arg0@@54 arg1@@32))
)))
(assert (forall ((diz@@58 T@U) (p_1@@46 Real) (diz2@@16 T@U) (p2@@16 Real) ) (!  (=> (and (and (= (type diz@@58) RefType) (= (type diz2@@16) RefType)) (= (|Worker__preFork#sm| diz@@58 p_1@@46) (|Worker__preFork#sm| diz2@@16 p2@@16))) (and (= diz@@58 diz2@@16) (= p_1@@46 p2@@16)))
 :qid |stdinbpl.775:15|
 :skolemid |111|
 :pattern ( (|Worker__preFork#sm| diz@@58 p_1@@46) (|Worker__preFork#sm| diz2@@16 p2@@16))
)))
(assert (forall ((diz@@59 T@U) (p_1@@47 Real) (diz2@@17 T@U) (p2@@17 Real) ) (!  (=> (and (and (= (type diz@@59) RefType) (= (type diz2@@17) RefType)) (= (Worker__postJoin diz@@59 p_1@@47) (Worker__postJoin diz2@@17 p2@@17))) (and (= diz@@59 diz2@@17) (= p_1@@47 p2@@17)))
 :qid |stdinbpl.806:15|
 :skolemid |116|
 :pattern ( (Worker__postJoin diz@@59 p_1@@47) (Worker__postJoin diz2@@17 p2@@17))
)))
(assert (forall ((arg0@@55 T@U) (arg1@@33 Real) ) (! (= (type (|Worker__postJoin#sm| arg0@@55 arg1@@33)) (FieldType PredicateType_Worker__postJoinType (MapType1Type RefType boolType)))
 :qid |funType:Worker__postJoin#sm|
 :pattern ( (|Worker__postJoin#sm| arg0@@55 arg1@@33))
)))
(assert (forall ((diz@@60 T@U) (p_1@@48 Real) (diz2@@18 T@U) (p2@@18 Real) ) (!  (=> (and (and (= (type diz@@60) RefType) (= (type diz2@@18) RefType)) (= (|Worker__postJoin#sm| diz@@60 p_1@@48) (|Worker__postJoin#sm| diz2@@18 p2@@18))) (and (= diz@@60 diz2@@18) (= p_1@@48 p2@@18)))
 :qid |stdinbpl.810:15|
 :skolemid |117|
 :pattern ( (|Worker__postJoin#sm| diz@@60 p_1@@48) (|Worker__postJoin#sm| diz2@@18 p2@@18))
)))
(assert (forall ((diz@@61 T@U) (p_1@@49 Real) (diz2@@19 T@U) (p2@@19 Real) ) (!  (=> (and (and (= (type diz@@61) RefType) (= (type diz2@@19) RefType)) (= (Worker__joinToken_at_Thread diz@@61 p_1@@49) (Worker__joinToken_at_Thread diz2@@19 p2@@19))) (and (= diz@@61 diz2@@19) (= p_1@@49 p2@@19)))
 :qid |stdinbpl.841:15|
 :skolemid |122|
 :pattern ( (Worker__joinToken_at_Thread diz@@61 p_1@@49) (Worker__joinToken_at_Thread diz2@@19 p2@@19))
)))
(assert (forall ((arg0@@56 T@U) (arg1@@34 Real) ) (! (= (type (|Worker__joinToken_at_Thread#sm| arg0@@56 arg1@@34)) (FieldType PredicateType_Worker__joinToken_at_ThreadType (MapType1Type RefType boolType)))
 :qid |funType:Worker__joinToken_at_Thread#sm|
 :pattern ( (|Worker__joinToken_at_Thread#sm| arg0@@56 arg1@@34))
)))
(assert (forall ((diz@@62 T@U) (p_1@@50 Real) (diz2@@20 T@U) (p2@@20 Real) ) (!  (=> (and (and (= (type diz@@62) RefType) (= (type diz2@@20) RefType)) (= (|Worker__joinToken_at_Thread#sm| diz@@62 p_1@@50) (|Worker__joinToken_at_Thread#sm| diz2@@20 p2@@20))) (and (= diz@@62 diz2@@20) (= p_1@@50 p2@@20)))
 :qid |stdinbpl.845:15|
 :skolemid |123|
 :pattern ( (|Worker__joinToken_at_Thread#sm| diz@@62 p_1@@50) (|Worker__joinToken_at_Thread#sm| diz2@@20 p2@@20))
)))
(assert (forall ((diz@@63 T@U) (p_1@@51 Real) (diz2@@21 T@U) (p2@@21 Real) ) (!  (=> (and (and (= (type diz@@63) RefType) (= (type diz2@@21) RefType)) (= (Worker__preFork_at_Thread diz@@63 p_1@@51) (Worker__preFork_at_Thread diz2@@21 p2@@21))) (and (= diz@@63 diz2@@21) (= p_1@@51 p2@@21)))
 :qid |stdinbpl.876:15|
 :skolemid |128|
 :pattern ( (Worker__preFork_at_Thread diz@@63 p_1@@51) (Worker__preFork_at_Thread diz2@@21 p2@@21))
)))
(assert (forall ((arg0@@57 T@U) (arg1@@35 Real) ) (! (= (type (|Worker__preFork_at_Thread#sm| arg0@@57 arg1@@35)) (FieldType PredicateType_Worker__preFork_at_ThreadType (MapType1Type RefType boolType)))
 :qid |funType:Worker__preFork_at_Thread#sm|
 :pattern ( (|Worker__preFork_at_Thread#sm| arg0@@57 arg1@@35))
)))
(assert (forall ((diz@@64 T@U) (p_1@@52 Real) (diz2@@22 T@U) (p2@@22 Real) ) (!  (=> (and (and (= (type diz@@64) RefType) (= (type diz2@@22) RefType)) (= (|Worker__preFork_at_Thread#sm| diz@@64 p_1@@52) (|Worker__preFork_at_Thread#sm| diz2@@22 p2@@22))) (and (= diz@@64 diz2@@22) (= p_1@@52 p2@@22)))
 :qid |stdinbpl.880:15|
 :skolemid |129|
 :pattern ( (|Worker__preFork_at_Thread#sm| diz@@64 p_1@@52) (|Worker__preFork_at_Thread#sm| diz2@@22 p2@@22))
)))
(assert (forall ((diz@@65 T@U) (p_1@@53 Real) (diz2@@23 T@U) (p2@@23 Real) ) (!  (=> (and (and (= (type diz@@65) RefType) (= (type diz2@@23) RefType)) (= (Worker__postJoin_at_Thread diz@@65 p_1@@53) (Worker__postJoin_at_Thread diz2@@23 p2@@23))) (and (= diz@@65 diz2@@23) (= p_1@@53 p2@@23)))
 :qid |stdinbpl.924:15|
 :skolemid |134|
 :pattern ( (Worker__postJoin_at_Thread diz@@65 p_1@@53) (Worker__postJoin_at_Thread diz2@@23 p2@@23))
)))
(assert (forall ((arg0@@58 T@U) (arg1@@36 Real) ) (! (= (type (|Worker__postJoin_at_Thread#sm| arg0@@58 arg1@@36)) (FieldType PredicateType_Worker__postJoin_at_ThreadType (MapType1Type RefType boolType)))
 :qid |funType:Worker__postJoin_at_Thread#sm|
 :pattern ( (|Worker__postJoin_at_Thread#sm| arg0@@58 arg1@@36))
)))
(assert (forall ((diz@@66 T@U) (p_1@@54 Real) (diz2@@24 T@U) (p2@@24 Real) ) (!  (=> (and (and (= (type diz@@66) RefType) (= (type diz2@@24) RefType)) (= (|Worker__postJoin_at_Thread#sm| diz@@66 p_1@@54) (|Worker__postJoin_at_Thread#sm| diz2@@24 p2@@24))) (and (= diz@@66 diz2@@24) (= p_1@@54 p2@@24)))
 :qid |stdinbpl.928:15|
 :skolemid |135|
 :pattern ( (|Worker__postJoin_at_Thread#sm| diz@@66 p_1@@54) (|Worker__postJoin_at_Thread#sm| diz2@@24 p2@@24))
)))
(assert (forall ((diz@@67 T@U) (p_1@@55 Real) (diz2@@25 T@U) (p2@@25 Real) ) (!  (=> (and (and (= (type diz@@67) RefType) (= (type diz2@@25) RefType)) (= (Worker__preFork_at_Worker diz@@67 p_1@@55) (Worker__preFork_at_Worker diz2@@25 p2@@25))) (and (= diz@@67 diz2@@25) (= p_1@@55 p2@@25)))
 :qid |stdinbpl.972:15|
 :skolemid |140|
 :pattern ( (Worker__preFork_at_Worker diz@@67 p_1@@55) (Worker__preFork_at_Worker diz2@@25 p2@@25))
)))
(assert (forall ((arg0@@59 T@U) (arg1@@37 Real) ) (! (= (type (|Worker__preFork_at_Worker#sm| arg0@@59 arg1@@37)) (FieldType PredicateType_Worker__preFork_at_WorkerType (MapType1Type RefType boolType)))
 :qid |funType:Worker__preFork_at_Worker#sm|
 :pattern ( (|Worker__preFork_at_Worker#sm| arg0@@59 arg1@@37))
)))
(assert (forall ((diz@@68 T@U) (p_1@@56 Real) (diz2@@26 T@U) (p2@@26 Real) ) (!  (=> (and (and (= (type diz@@68) RefType) (= (type diz2@@26) RefType)) (= (|Worker__preFork_at_Worker#sm| diz@@68 p_1@@56) (|Worker__preFork_at_Worker#sm| diz2@@26 p2@@26))) (and (= diz@@68 diz2@@26) (= p_1@@56 p2@@26)))
 :qid |stdinbpl.976:15|
 :skolemid |141|
 :pattern ( (|Worker__preFork_at_Worker#sm| diz@@68 p_1@@56) (|Worker__preFork_at_Worker#sm| diz2@@26 p2@@26))
)))
(assert (forall ((diz@@69 T@U) (p_1@@57 Real) (diz2@@27 T@U) (p2@@27 Real) ) (!  (=> (and (and (= (type diz@@69) RefType) (= (type diz2@@27) RefType)) (= (Worker__postJoin_at_Worker diz@@69 p_1@@57) (Worker__postJoin_at_Worker diz2@@27 p2@@27))) (and (= diz@@69 diz2@@27) (= p_1@@57 p2@@27)))
 :qid |stdinbpl.1038:15|
 :skolemid |146|
 :pattern ( (Worker__postJoin_at_Worker diz@@69 p_1@@57) (Worker__postJoin_at_Worker diz2@@27 p2@@27))
)))
(assert (forall ((arg0@@60 T@U) (arg1@@38 Real) ) (! (= (type (|Worker__postJoin_at_Worker#sm| arg0@@60 arg1@@38)) (FieldType PredicateType_Worker__postJoin_at_WorkerType (MapType1Type RefType boolType)))
 :qid |funType:Worker__postJoin_at_Worker#sm|
 :pattern ( (|Worker__postJoin_at_Worker#sm| arg0@@60 arg1@@38))
)))
(assert (forall ((diz@@70 T@U) (p_1@@58 Real) (diz2@@28 T@U) (p2@@28 Real) ) (!  (=> (and (and (= (type diz@@70) RefType) (= (type diz2@@28) RefType)) (= (|Worker__postJoin_at_Worker#sm| diz@@70 p_1@@58) (|Worker__postJoin_at_Worker#sm| diz2@@28 p2@@28))) (and (= diz@@70 diz2@@28) (= p_1@@58 p2@@28)))
 :qid |stdinbpl.1042:15|
 :skolemid |147|
 :pattern ( (|Worker__postJoin_at_Worker#sm| diz@@70 p_1@@58) (|Worker__postJoin_at_Worker#sm| diz2@@28 p2@@28))
)))
(assert (forall ((diz@@71 T@U) (diz2@@29 T@U) ) (!  (=> (and (and (= (type diz@@71) RefType) (= (type diz2@@29) RefType)) (= (Thread__is_a_Thread diz@@71) (Thread__is_a_Thread diz2@@29))) (= diz@@71 diz2@@29))
 :qid |stdinbpl.238:15|
 :skolemid |26|
 :pattern ( (Thread__is_a_Thread diz@@71) (Thread__is_a_Thread diz2@@29))
)))
(assert (forall ((arg0@@61 T@U) ) (! (= (type (|Thread__is_a_Thread#sm| arg0@@61)) (FieldType PredicateType_Thread__is_a_ThreadType (MapType1Type RefType boolType)))
 :qid |funType:Thread__is_a_Thread#sm|
 :pattern ( (|Thread__is_a_Thread#sm| arg0@@61))
)))
(assert (forall ((diz@@72 T@U) (diz2@@30 T@U) ) (!  (=> (and (and (= (type diz@@72) RefType) (= (type diz2@@30) RefType)) (= (|Thread__is_a_Thread#sm| diz@@72) (|Thread__is_a_Thread#sm| diz2@@30))) (= diz@@72 diz2@@30))
 :qid |stdinbpl.242:15|
 :skolemid |27|
 :pattern ( (|Thread__is_a_Thread#sm| diz@@72) (|Thread__is_a_Thread#sm| diz2@@30))
)))
(assert (forall ((diz@@73 T@U) (diz2@@31 T@U) ) (!  (=> (and (and (= (type diz@@73) RefType) (= (type diz2@@31) RefType)) (= (Thread__instance_of_Thread diz@@73) (Thread__instance_of_Thread diz2@@31))) (= diz@@73 diz2@@31))
 :qid |stdinbpl.273:15|
 :skolemid |32|
 :pattern ( (Thread__instance_of_Thread diz@@73) (Thread__instance_of_Thread diz2@@31))
)))
(assert (forall ((arg0@@62 T@U) ) (! (= (type (|Thread__instance_of_Thread#sm| arg0@@62)) (FieldType PredicateType_Thread__instance_of_ThreadType (MapType1Type RefType boolType)))
 :qid |funType:Thread__instance_of_Thread#sm|
 :pattern ( (|Thread__instance_of_Thread#sm| arg0@@62))
)))
(assert (forall ((diz@@74 T@U) (diz2@@32 T@U) ) (!  (=> (and (and (= (type diz@@74) RefType) (= (type diz2@@32) RefType)) (= (|Thread__instance_of_Thread#sm| diz@@74) (|Thread__instance_of_Thread#sm| diz2@@32))) (= diz@@74 diz2@@32))
 :qid |stdinbpl.277:15|
 :skolemid |33|
 :pattern ( (|Thread__instance_of_Thread#sm| diz@@74) (|Thread__instance_of_Thread#sm| diz2@@32))
)))
(assert (forall ((diz@@75 T@U) (diz2@@33 T@U) ) (!  (=> (and (and (= (type diz@@75) RefType) (= (type diz2@@33) RefType)) (= (Worker__is_a_Worker diz@@75) (Worker__is_a_Worker diz2@@33))) (= diz@@75 diz2@@33))
 :qid |stdinbpl.544:15|
 :skolemid |74|
 :pattern ( (Worker__is_a_Worker diz@@75) (Worker__is_a_Worker diz2@@33))
)))
(assert (forall ((arg0@@63 T@U) ) (! (= (type (|Worker__is_a_Worker#sm| arg0@@63)) (FieldType PredicateType_Worker__is_a_WorkerType (MapType1Type RefType boolType)))
 :qid |funType:Worker__is_a_Worker#sm|
 :pattern ( (|Worker__is_a_Worker#sm| arg0@@63))
)))
(assert (forall ((diz@@76 T@U) (diz2@@34 T@U) ) (!  (=> (and (and (= (type diz@@76) RefType) (= (type diz2@@34) RefType)) (= (|Worker__is_a_Worker#sm| diz@@76) (|Worker__is_a_Worker#sm| diz2@@34))) (= diz@@76 diz2@@34))
 :qid |stdinbpl.548:15|
 :skolemid |75|
 :pattern ( (|Worker__is_a_Worker#sm| diz@@76) (|Worker__is_a_Worker#sm| diz2@@34))
)))
(assert (forall ((diz@@77 T@U) (diz2@@35 T@U) ) (!  (=> (and (and (= (type diz@@77) RefType) (= (type diz2@@35) RefType)) (= (Worker__instance_of_Worker diz@@77) (Worker__instance_of_Worker diz2@@35))) (= diz@@77 diz2@@35))
 :qid |stdinbpl.579:15|
 :skolemid |80|
 :pattern ( (Worker__instance_of_Worker diz@@77) (Worker__instance_of_Worker diz2@@35))
)))
(assert (forall ((arg0@@64 T@U) ) (! (= (type (|Worker__instance_of_Worker#sm| arg0@@64)) (FieldType PredicateType_Worker__instance_of_WorkerType (MapType1Type RefType boolType)))
 :qid |funType:Worker__instance_of_Worker#sm|
 :pattern ( (|Worker__instance_of_Worker#sm| arg0@@64))
)))
(assert (forall ((diz@@78 T@U) (diz2@@36 T@U) ) (!  (=> (and (and (= (type diz@@78) RefType) (= (type diz2@@36) RefType)) (= (|Worker__instance_of_Worker#sm| diz@@78) (|Worker__instance_of_Worker#sm| diz2@@36))) (= diz@@78 diz2@@36))
 :qid |stdinbpl.583:15|
 :skolemid |81|
 :pattern ( (|Worker__instance_of_Worker#sm| diz@@78) (|Worker__instance_of_Worker#sm| diz2@@36))
)))
(assert (forall ((diz@@79 T@U) (diz2@@37 T@U) ) (!  (=> (and (and (= (type diz@@79) RefType) (= (type diz2@@37) RefType)) (= (Worker__is_a_Thread diz@@79) (Worker__is_a_Thread diz2@@37))) (= diz@@79 diz2@@37))
 :qid |stdinbpl.614:15|
 :skolemid |86|
 :pattern ( (Worker__is_a_Thread diz@@79) (Worker__is_a_Thread diz2@@37))
)))
(assert (forall ((arg0@@65 T@U) ) (! (= (type (|Worker__is_a_Thread#sm| arg0@@65)) (FieldType PredicateType_Worker__is_a_ThreadType (MapType1Type RefType boolType)))
 :qid |funType:Worker__is_a_Thread#sm|
 :pattern ( (|Worker__is_a_Thread#sm| arg0@@65))
)))
(assert (forall ((diz@@80 T@U) (diz2@@38 T@U) ) (!  (=> (and (and (= (type diz@@80) RefType) (= (type diz2@@38) RefType)) (= (|Worker__is_a_Thread#sm| diz@@80) (|Worker__is_a_Thread#sm| diz2@@38))) (= diz@@80 diz2@@38))
 :qid |stdinbpl.618:15|
 :skolemid |87|
 :pattern ( (|Worker__is_a_Thread#sm| diz@@80) (|Worker__is_a_Thread#sm| diz2@@38))
)))
(assert (forall ((diz@@81 T@U) (diz2@@39 T@U) ) (!  (=> (and (and (= (type diz@@81) RefType) (= (type diz2@@39) RefType)) (= (Worker__instance_of_Thread diz@@81) (Worker__instance_of_Thread diz2@@39))) (= diz@@81 diz2@@39))
 :qid |stdinbpl.649:15|
 :skolemid |92|
 :pattern ( (Worker__instance_of_Thread diz@@81) (Worker__instance_of_Thread diz2@@39))
)))
(assert (forall ((arg0@@66 T@U) ) (! (= (type (|Worker__instance_of_Thread#sm| arg0@@66)) (FieldType PredicateType_Worker__instance_of_ThreadType (MapType1Type RefType boolType)))
 :qid |funType:Worker__instance_of_Thread#sm|
 :pattern ( (|Worker__instance_of_Thread#sm| arg0@@66))
)))
(assert (forall ((diz@@82 T@U) (diz2@@40 T@U) ) (!  (=> (and (and (= (type diz@@82) RefType) (= (type diz2@@40) RefType)) (= (|Worker__instance_of_Thread#sm| diz@@82) (|Worker__instance_of_Thread#sm| diz2@@40))) (= diz@@82 diz2@@40))
 :qid |stdinbpl.653:15|
 :skolemid |93|
 :pattern ( (|Worker__instance_of_Thread#sm| diz@@82) (|Worker__instance_of_Thread#sm| diz2@@40))
)))
(assert (forall ((Heap@@24 T@U) (ExhaleHeap@@2 T@U) (Mask@@3 T@U) (o_1@@0 T@U) (f_2 T@U) ) (! (let ((B@@1 (FieldTypeInv1 (type f_2))))
(let ((A@@1 (FieldTypeInv0 (type f_2))))
 (=> (and (and (and (and (and (and (= (type Heap@@24) (MapType0Type RefType)) (= (type ExhaleHeap@@2) (MapType0Type RefType))) (= (type Mask@@3) (MapType1Type RefType realType))) (= (type o_1@@0) RefType)) (= (type f_2) (FieldType A@@1 B@@1))) (IdenticalOnKnownLocations Heap@@24 ExhaleHeap@@2 Mask@@3)) (HasDirectPerm Mask@@3 o_1@@0 f_2)) (= (MapType0Select Heap@@24 o_1@@0 f_2) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2)))))
 :qid |stdinbpl.42:22|
 :skolemid |1|
 :pattern ( (IdenticalOnKnownLocations Heap@@24 ExhaleHeap@@2 Mask@@3) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2))
)))
(assert  (and (= (type dummyHeap) (MapType0Type RefType)) (= (type ZeroMask) (MapType1Type RefType realType))))
(assert (state dummyHeap ZeroMask))
(assert (forall ((p T@U) (v_1 T@U) (w T@U) ) (! (let ((A@@2 (FieldTypeInv0 (type p))))
 (=> (and (and (= (type p) (FieldType A@@2 FrameTypeType)) (= (type v_1) FrameTypeType)) (= (type w) FrameTypeType)) (not (InsidePredicate p v_1 p w))))
 :qid |stdinbpl.170:19|
 :skolemid |21|
 :pattern ( (InsidePredicate p v_1 p w))
)))
(assert  (not (IsPredicateField Worker__input)))
(assert  (not (IsWandField Worker__input)))
(assert  (not (IsPredicateField Worker__output)))
(assert  (not (IsWandField Worker__output)))
(assert (forall ((Heap@@25 T@U) (ExhaleHeap@@3 T@U) (Mask@@4 T@U) ) (!  (=> (and (and (and (= (type Heap@@25) (MapType0Type RefType)) (= (type ExhaleHeap@@3) (MapType0Type RefType))) (= (type Mask@@4) (MapType1Type RefType realType))) (IdenticalOnKnownLocations Heap@@25 ExhaleHeap@@3 Mask@@4)) (succHeap Heap@@25 ExhaleHeap@@3))
 :qid |stdinbpl.83:15|
 :skolemid |10|
 :pattern ( (IdenticalOnKnownLocations Heap@@25 ExhaleHeap@@3 Mask@@4))
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
(assert  (and (forall ((arg0@@67 Real) (arg1@@39 T@U) ) (! (= (type (ConditionalFrame arg0@@67 arg1@@39)) FrameTypeType)
 :qid |funType:ConditionalFrame|
 :pattern ( (ConditionalFrame arg0@@67 arg1@@39))
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
(assert  (and (= (Ctor TYPEDomainTypeType) 33) (= (type class_Object) TYPEDomainTypeType)))
(assert (forall ((t_1 T@U) ) (!  (=> (= (type t_1) TYPEDomainTypeType) (instanceof class_Object t_1))
 :qid |stdinbpl.201:15|
 :skolemid |22|
 :pattern ( (instanceof class_Object t_1))
)))
(assert (forall ((diz@@83 T@U) (p_1@@59 Real) ) (!  (=> (= (type diz@@83) RefType) (= (getPredWandId (Thread__joinToken diz@@83 p_1@@59)) 2))
 :qid |stdinbpl.302:15|
 :skolemid |37|
 :pattern ( (Thread__joinToken diz@@83 p_1@@59))
)))
(assert (forall ((diz@@84 T@U) (p_1@@60 Real) ) (!  (=> (= (type diz@@84) RefType) (= (getPredWandId (Thread__preFork diz@@84 p_1@@60)) 3))
 :qid |stdinbpl.337:15|
 :skolemid |43|
 :pattern ( (Thread__preFork diz@@84 p_1@@60))
)))
(assert (forall ((diz@@85 T@U) (p_1@@61 Real) ) (!  (=> (= (type diz@@85) RefType) (= (getPredWandId (Thread__postJoin diz@@85 p_1@@61)) 4))
 :qid |stdinbpl.372:15|
 :skolemid |49|
 :pattern ( (Thread__postJoin diz@@85 p_1@@61))
)))
(assert (forall ((diz@@86 T@U) (p_1@@62 Real) ) (!  (=> (= (type diz@@86) RefType) (= (getPredWandId (Thread__joinToken_at_Thread diz@@86 p_1@@62)) 5))
 :qid |stdinbpl.407:15|
 :skolemid |55|
 :pattern ( (Thread__joinToken_at_Thread diz@@86 p_1@@62))
)))
(assert (forall ((diz@@87 T@U) (p_1@@63 Real) ) (!  (=> (= (type diz@@87) RefType) (= (getPredWandId (Thread__preFork_at_Thread diz@@87 p_1@@63)) 6))
 :qid |stdinbpl.442:15|
 :skolemid |61|
 :pattern ( (Thread__preFork_at_Thread diz@@87 p_1@@63))
)))
(assert (forall ((diz@@88 T@U) (p_1@@64 Real) ) (!  (=> (= (type diz@@88) RefType) (= (getPredWandId (Thread__postJoin_at_Thread diz@@88 p_1@@64)) 7))
 :qid |stdinbpl.490:15|
 :skolemid |67|
 :pattern ( (Thread__postJoin_at_Thread diz@@88 p_1@@64))
)))
(assert (forall ((diz@@89 T@U) (p_1@@65 Real) ) (!  (=> (= (type diz@@89) RefType) (= (getPredWandId (Worker__joinToken diz@@89 p_1@@65)) 12))
 :qid |stdinbpl.678:15|
 :skolemid |97|
 :pattern ( (Worker__joinToken diz@@89 p_1@@65))
)))
(assert (forall ((diz@@90 T@U) (p_1@@66 Real) ) (!  (=> (= (type diz@@90) RefType) (= (getPredWandId (Worker__joinToken_at_Worker diz@@90 p_1@@66)) 13))
 :qid |stdinbpl.713:15|
 :skolemid |103|
 :pattern ( (Worker__joinToken_at_Worker diz@@90 p_1@@66))
)))
(assert (forall ((diz@@91 T@U) (p_1@@67 Real) ) (!  (=> (= (type diz@@91) RefType) (= (getPredWandId (Worker__preFork diz@@91 p_1@@67)) 14))
 :qid |stdinbpl.765:15|
 :skolemid |109|
 :pattern ( (Worker__preFork diz@@91 p_1@@67))
)))
(assert (forall ((diz@@92 T@U) (p_1@@68 Real) ) (!  (=> (= (type diz@@92) RefType) (= (getPredWandId (Worker__postJoin diz@@92 p_1@@68)) 15))
 :qid |stdinbpl.800:15|
 :skolemid |115|
 :pattern ( (Worker__postJoin diz@@92 p_1@@68))
)))
(assert (forall ((diz@@93 T@U) (p_1@@69 Real) ) (!  (=> (= (type diz@@93) RefType) (= (getPredWandId (Worker__joinToken_at_Thread diz@@93 p_1@@69)) 16))
 :qid |stdinbpl.835:15|
 :skolemid |121|
 :pattern ( (Worker__joinToken_at_Thread diz@@93 p_1@@69))
)))
(assert (forall ((diz@@94 T@U) (p_1@@70 Real) ) (!  (=> (= (type diz@@94) RefType) (= (getPredWandId (Worker__preFork_at_Thread diz@@94 p_1@@70)) 17))
 :qid |stdinbpl.870:15|
 :skolemid |127|
 :pattern ( (Worker__preFork_at_Thread diz@@94 p_1@@70))
)))
(assert (forall ((diz@@95 T@U) (p_1@@71 Real) ) (!  (=> (= (type diz@@95) RefType) (= (getPredWandId (Worker__postJoin_at_Thread diz@@95 p_1@@71)) 18))
 :qid |stdinbpl.918:15|
 :skolemid |133|
 :pattern ( (Worker__postJoin_at_Thread diz@@95 p_1@@71))
)))
(assert (forall ((diz@@96 T@U) (p_1@@72 Real) ) (!  (=> (= (type diz@@96) RefType) (= (getPredWandId (Worker__preFork_at_Worker diz@@96 p_1@@72)) 19))
 :qid |stdinbpl.966:15|
 :skolemid |139|
 :pattern ( (Worker__preFork_at_Worker diz@@96 p_1@@72))
)))
(assert (forall ((diz@@97 T@U) (p_1@@73 Real) ) (!  (=> (= (type diz@@97) RefType) (= (getPredWandId (Worker__postJoin_at_Worker diz@@97 p_1@@73)) 20))
 :qid |stdinbpl.1032:15|
 :skolemid |145|
 :pattern ( (Worker__postJoin_at_Worker diz@@97 p_1@@73))
)))
(assert (forall ((Heap@@26 T@U) (ExhaleHeap@@4 T@U) (Mask@@6 T@U) (pm_f@@1 T@U) ) (! (let ((C@@1 (FieldTypeInv0 (type pm_f@@1))))
 (=> (and (and (and (and (and (= (type Heap@@26) (MapType0Type RefType)) (= (type ExhaleHeap@@4) (MapType0Type RefType))) (= (type Mask@@6) (MapType1Type RefType realType))) (= (type pm_f@@1) (FieldType C@@1 FrameTypeType))) (IdenticalOnKnownLocations Heap@@26 ExhaleHeap@@4 Mask@@6)) (and (HasDirectPerm Mask@@6 null pm_f@@1) (IsPredicateField pm_f@@1))) (forall ((o2 T@U) (f_2@@0 T@U) ) (! (let ((B@@5 (FieldTypeInv1 (type f_2@@0))))
(let ((A@@6 (FieldTypeInv0 (type f_2@@0))))
 (=> (and (and (= (type o2) RefType) (= (type f_2@@0) (FieldType A@@6 B@@5))) (U_2_bool (MapType1Select (MapType0Select Heap@@26 null (PredicateMaskField pm_f@@1)) o2 f_2@@0))) (= (MapType0Select Heap@@26 o2 f_2@@0) (MapType0Select ExhaleHeap@@4 o2 f_2@@0)))))
 :qid |stdinbpl.54:134|
 :skolemid |3|
 :pattern ( (MapType0Select ExhaleHeap@@4 o2 f_2@@0))
))))
 :qid |stdinbpl.52:19|
 :skolemid |4|
 :pattern ( (IdenticalOnKnownLocations Heap@@26 ExhaleHeap@@4 Mask@@6) (IsPredicateField pm_f@@1))
)))
(assert (forall ((Heap@@27 T@U) (ExhaleHeap@@5 T@U) (Mask@@7 T@U) (pm_f@@2 T@U) ) (! (let ((C@@2 (FieldTypeInv0 (type pm_f@@2))))
 (=> (and (and (and (and (and (= (type Heap@@27) (MapType0Type RefType)) (= (type ExhaleHeap@@5) (MapType0Type RefType))) (= (type Mask@@7) (MapType1Type RefType realType))) (= (type pm_f@@2) (FieldType C@@2 FrameTypeType))) (IdenticalOnKnownLocations Heap@@27 ExhaleHeap@@5 Mask@@7)) (and (HasDirectPerm Mask@@7 null pm_f@@2) (IsWandField pm_f@@2))) (forall ((o2@@0 T@U) (f_2@@1 T@U) ) (! (let ((B@@6 (FieldTypeInv1 (type f_2@@1))))
(let ((A@@7 (FieldTypeInv0 (type f_2@@1))))
 (=> (and (and (= (type o2@@0) RefType) (= (type f_2@@1) (FieldType A@@7 B@@6))) (U_2_bool (MapType1Select (MapType0Select Heap@@27 null (WandMaskField pm_f@@2)) o2@@0 f_2@@1))) (= (MapType0Select Heap@@27 o2@@0 f_2@@1) (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1)))))
 :qid |stdinbpl.67:129|
 :skolemid |6|
 :pattern ( (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1))
))))
 :qid |stdinbpl.65:19|
 :skolemid |7|
 :pattern ( (IdenticalOnKnownLocations Heap@@27 ExhaleHeap@@5 Mask@@7) (IsWandField pm_f@@2))
)))
(assert (forall ((diz@@98 T@U) ) (!  (=> (= (type diz@@98) RefType) (= (getPredWandId (Thread__is_a_Thread diz@@98)) 0))
 :qid |stdinbpl.232:15|
 :skolemid |25|
 :pattern ( (Thread__is_a_Thread diz@@98))
)))
(assert (forall ((diz@@99 T@U) ) (!  (=> (= (type diz@@99) RefType) (= (getPredWandId (Thread__instance_of_Thread diz@@99)) 1))
 :qid |stdinbpl.267:15|
 :skolemid |31|
 :pattern ( (Thread__instance_of_Thread diz@@99))
)))
(assert (forall ((diz@@100 T@U) ) (!  (=> (= (type diz@@100) RefType) (= (getPredWandId (Worker__is_a_Worker diz@@100)) 8))
 :qid |stdinbpl.538:15|
 :skolemid |73|
 :pattern ( (Worker__is_a_Worker diz@@100))
)))
(assert (forall ((diz@@101 T@U) ) (!  (=> (= (type diz@@101) RefType) (= (getPredWandId (Worker__instance_of_Worker diz@@101)) 9))
 :qid |stdinbpl.573:15|
 :skolemid |79|
 :pattern ( (Worker__instance_of_Worker diz@@101))
)))
(assert (forall ((diz@@102 T@U) ) (!  (=> (= (type diz@@102) RefType) (= (getPredWandId (Worker__is_a_Thread diz@@102)) 10))
 :qid |stdinbpl.608:15|
 :skolemid |85|
 :pattern ( (Worker__is_a_Thread diz@@102))
)))
(assert (forall ((diz@@103 T@U) ) (!  (=> (= (type diz@@103) RefType) (= (getPredWandId (Worker__instance_of_Thread diz@@103)) 11))
 :qid |stdinbpl.643:15|
 :skolemid |91|
 :pattern ( (Worker__instance_of_Thread diz@@103))
)))
(assert (forall ((Mask@@8 T@U) (o_2@@2 T@U) (f_4@@2 T@U) ) (! (let ((B@@7 (FieldTypeInv1 (type f_4@@2))))
(let ((A@@8 (FieldTypeInv0 (type f_4@@2))))
 (=> (and (and (and (= (type Mask@@8) (MapType1Type RefType realType)) (= (type o_2@@2) RefType)) (= (type f_4@@2) (FieldType A@@8 B@@7))) (GoodMask Mask@@8)) (and (>= (U_2_real (MapType1Select Mask@@8 o_2@@2 f_4@@2)) NoPerm) (=> (and (and (GoodMask Mask@@8) (not (IsPredicateField f_4@@2))) (not (IsWandField f_4@@2))) (<= (U_2_real (MapType1Select Mask@@8 o_2@@2 f_4@@2)) FullPerm))))))
 :qid |stdinbpl.128:22|
 :skolemid |16|
 :pattern ( (GoodMask Mask@@8) (MapType1Select Mask@@8 o_2@@2 f_4@@2))
)))
(assert (forall ((o T@U) (f T@U) (Heap@@28 T@U) ) (!  (=> (and (and (and (= (type o) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap@@28) (MapType0Type RefType))) (U_2_bool (MapType0Select Heap@@28 o $allocated))) (U_2_bool (MapType0Select Heap@@28 (MapType0Select Heap@@28 o f) $allocated)))
 :qid |stdinbpl.31:15|
 :skolemid |0|
 :pattern ( (MapType0Select Heap@@28 o f))
)))
(assert (forall ((diz@@104 T@U) (p_1@@74 Real) ) (!  (=> (= (type diz@@104) RefType) (= (PredicateMaskField (Thread__joinToken diz@@104 p_1@@74)) (|Thread__joinToken#sm| diz@@104 p_1@@74)))
 :qid |stdinbpl.294:15|
 :skolemid |35|
 :pattern ( (PredicateMaskField (Thread__joinToken diz@@104 p_1@@74)))
)))
(assert (forall ((diz@@105 T@U) (p_1@@75 Real) ) (!  (=> (= (type diz@@105) RefType) (= (PredicateMaskField (Thread__preFork diz@@105 p_1@@75)) (|Thread__preFork#sm| diz@@105 p_1@@75)))
 :qid |stdinbpl.329:15|
 :skolemid |41|
 :pattern ( (PredicateMaskField (Thread__preFork diz@@105 p_1@@75)))
)))
(assert (forall ((diz@@106 T@U) (p_1@@76 Real) ) (!  (=> (= (type diz@@106) RefType) (= (PredicateMaskField (Thread__postJoin diz@@106 p_1@@76)) (|Thread__postJoin#sm| diz@@106 p_1@@76)))
 :qid |stdinbpl.364:15|
 :skolemid |47|
 :pattern ( (PredicateMaskField (Thread__postJoin diz@@106 p_1@@76)))
)))
(assert (forall ((diz@@107 T@U) (p_1@@77 Real) ) (!  (=> (= (type diz@@107) RefType) (= (PredicateMaskField (Thread__joinToken_at_Thread diz@@107 p_1@@77)) (|Thread__joinToken_at_Thread#sm| diz@@107 p_1@@77)))
 :qid |stdinbpl.399:15|
 :skolemid |53|
 :pattern ( (PredicateMaskField (Thread__joinToken_at_Thread diz@@107 p_1@@77)))
)))
(assert (forall ((diz@@108 T@U) (p_1@@78 Real) ) (!  (=> (= (type diz@@108) RefType) (= (PredicateMaskField (Thread__preFork_at_Thread diz@@108 p_1@@78)) (|Thread__preFork_at_Thread#sm| diz@@108 p_1@@78)))
 :qid |stdinbpl.434:15|
 :skolemid |59|
 :pattern ( (PredicateMaskField (Thread__preFork_at_Thread diz@@108 p_1@@78)))
)))
(assert (forall ((diz@@109 T@U) (p_1@@79 Real) ) (!  (=> (= (type diz@@109) RefType) (= (PredicateMaskField (Thread__postJoin_at_Thread diz@@109 p_1@@79)) (|Thread__postJoin_at_Thread#sm| diz@@109 p_1@@79)))
 :qid |stdinbpl.482:15|
 :skolemid |65|
 :pattern ( (PredicateMaskField (Thread__postJoin_at_Thread diz@@109 p_1@@79)))
)))
(assert (forall ((diz@@110 T@U) (p_1@@80 Real) ) (!  (=> (= (type diz@@110) RefType) (= (PredicateMaskField (Worker__joinToken diz@@110 p_1@@80)) (|Worker__joinToken#sm| diz@@110 p_1@@80)))
 :qid |stdinbpl.670:15|
 :skolemid |95|
 :pattern ( (PredicateMaskField (Worker__joinToken diz@@110 p_1@@80)))
)))
(assert (forall ((diz@@111 T@U) (p_1@@81 Real) ) (!  (=> (= (type diz@@111) RefType) (= (PredicateMaskField (Worker__joinToken_at_Worker diz@@111 p_1@@81)) (|Worker__joinToken_at_Worker#sm| diz@@111 p_1@@81)))
 :qid |stdinbpl.705:15|
 :skolemid |101|
 :pattern ( (PredicateMaskField (Worker__joinToken_at_Worker diz@@111 p_1@@81)))
)))
(assert (forall ((diz@@112 T@U) (p_1@@82 Real) ) (!  (=> (= (type diz@@112) RefType) (= (PredicateMaskField (Worker__preFork diz@@112 p_1@@82)) (|Worker__preFork#sm| diz@@112 p_1@@82)))
 :qid |stdinbpl.757:15|
 :skolemid |107|
 :pattern ( (PredicateMaskField (Worker__preFork diz@@112 p_1@@82)))
)))
(assert (forall ((diz@@113 T@U) (p_1@@83 Real) ) (!  (=> (= (type diz@@113) RefType) (= (PredicateMaskField (Worker__postJoin diz@@113 p_1@@83)) (|Worker__postJoin#sm| diz@@113 p_1@@83)))
 :qid |stdinbpl.792:15|
 :skolemid |113|
 :pattern ( (PredicateMaskField (Worker__postJoin diz@@113 p_1@@83)))
)))
(assert (forall ((diz@@114 T@U) (p_1@@84 Real) ) (!  (=> (= (type diz@@114) RefType) (= (PredicateMaskField (Worker__joinToken_at_Thread diz@@114 p_1@@84)) (|Worker__joinToken_at_Thread#sm| diz@@114 p_1@@84)))
 :qid |stdinbpl.827:15|
 :skolemid |119|
 :pattern ( (PredicateMaskField (Worker__joinToken_at_Thread diz@@114 p_1@@84)))
)))
(assert (forall ((diz@@115 T@U) (p_1@@85 Real) ) (!  (=> (= (type diz@@115) RefType) (= (PredicateMaskField (Worker__preFork_at_Thread diz@@115 p_1@@85)) (|Worker__preFork_at_Thread#sm| diz@@115 p_1@@85)))
 :qid |stdinbpl.862:15|
 :skolemid |125|
 :pattern ( (PredicateMaskField (Worker__preFork_at_Thread diz@@115 p_1@@85)))
)))
(assert (forall ((diz@@116 T@U) (p_1@@86 Real) ) (!  (=> (= (type diz@@116) RefType) (= (PredicateMaskField (Worker__postJoin_at_Thread diz@@116 p_1@@86)) (|Worker__postJoin_at_Thread#sm| diz@@116 p_1@@86)))
 :qid |stdinbpl.910:15|
 :skolemid |131|
 :pattern ( (PredicateMaskField (Worker__postJoin_at_Thread diz@@116 p_1@@86)))
)))
(assert (forall ((diz@@117 T@U) (p_1@@87 Real) ) (!  (=> (= (type diz@@117) RefType) (= (PredicateMaskField (Worker__preFork_at_Worker diz@@117 p_1@@87)) (|Worker__preFork_at_Worker#sm| diz@@117 p_1@@87)))
 :qid |stdinbpl.958:15|
 :skolemid |137|
 :pattern ( (PredicateMaskField (Worker__preFork_at_Worker diz@@117 p_1@@87)))
)))
(assert (forall ((diz@@118 T@U) (p_1@@88 Real) ) (!  (=> (= (type diz@@118) RefType) (= (PredicateMaskField (Worker__postJoin_at_Worker diz@@118 p_1@@88)) (|Worker__postJoin_at_Worker#sm| diz@@118 p_1@@88)))
 :qid |stdinbpl.1024:15|
 :skolemid |143|
 :pattern ( (PredicateMaskField (Worker__postJoin_at_Worker diz@@118 p_1@@88)))
)))
(assert (forall ((diz@@119 T@U) ) (!  (=> (= (type diz@@119) RefType) (= (PredicateMaskField (Thread__is_a_Thread diz@@119)) (|Thread__is_a_Thread#sm| diz@@119)))
 :qid |stdinbpl.224:15|
 :skolemid |23|
 :pattern ( (PredicateMaskField (Thread__is_a_Thread diz@@119)))
)))
(assert (forall ((diz@@120 T@U) ) (!  (=> (= (type diz@@120) RefType) (= (PredicateMaskField (Thread__instance_of_Thread diz@@120)) (|Thread__instance_of_Thread#sm| diz@@120)))
 :qid |stdinbpl.259:15|
 :skolemid |29|
 :pattern ( (PredicateMaskField (Thread__instance_of_Thread diz@@120)))
)))
(assert (forall ((diz@@121 T@U) ) (!  (=> (= (type diz@@121) RefType) (= (PredicateMaskField (Worker__is_a_Worker diz@@121)) (|Worker__is_a_Worker#sm| diz@@121)))
 :qid |stdinbpl.530:15|
 :skolemid |71|
 :pattern ( (PredicateMaskField (Worker__is_a_Worker diz@@121)))
)))
(assert (forall ((diz@@122 T@U) ) (!  (=> (= (type diz@@122) RefType) (= (PredicateMaskField (Worker__instance_of_Worker diz@@122)) (|Worker__instance_of_Worker#sm| diz@@122)))
 :qid |stdinbpl.565:15|
 :skolemid |77|
 :pattern ( (PredicateMaskField (Worker__instance_of_Worker diz@@122)))
)))
(assert (forall ((diz@@123 T@U) ) (!  (=> (= (type diz@@123) RefType) (= (PredicateMaskField (Worker__is_a_Thread diz@@123)) (|Worker__is_a_Thread#sm| diz@@123)))
 :qid |stdinbpl.600:15|
 :skolemid |83|
 :pattern ( (PredicateMaskField (Worker__is_a_Thread diz@@123)))
)))
(assert (forall ((diz@@124 T@U) ) (!  (=> (= (type diz@@124) RefType) (= (PredicateMaskField (Worker__instance_of_Thread diz@@124)) (|Worker__instance_of_Thread#sm| diz@@124)))
 :qid |stdinbpl.635:15|
 :skolemid |89|
 :pattern ( (PredicateMaskField (Worker__instance_of_Thread diz@@124)))
)))
(assert (forall ((Heap@@29 T@U) (o@@0 T@U) (f_3 T@U) (v T@U) ) (! (let ((B@@8 (type v)))
(let ((A@@9 (FieldTypeInv0 (type f_3))))
 (=> (and (and (= (type Heap@@29) (MapType0Type RefType)) (= (type o@@0) RefType)) (= (type f_3) (FieldType A@@9 B@@8))) (succHeap Heap@@29 (MapType0Store Heap@@29 o@@0 f_3 v)))))
 :qid |stdinbpl.78:22|
 :skolemid |9|
 :pattern ( (MapType0Store Heap@@29 o@@0 f_3 v))
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
; Valid

(push 1)
(declare-fun ControlFlow (Int Int) Int)
(set-info :boogie-vc-id Thread__run_at_Thread)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 4) true)
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
(declare-fun Worker__input () T@U)
(declare-fun Worker__output () T@U)
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
(declare-fun state (T@U T@U) Bool)
(declare-fun MapType1Type (T@T T@T) T@T)
(declare-fun GoodMask (T@U) Bool)
(declare-fun MapType1TypeInv0 (T@T) T@T)
(declare-fun MapType1TypeInv1 (T@T) T@T)
(declare-fun MapType1Select (T@U T@U T@U) T@U)
(declare-fun MapType1Store (T@U T@U T@U T@U) T@U)
(declare-fun Thread__joinToken (T@U Real) T@U)
(declare-fun IsPredicateField (T@U) Bool)
(declare-fun PredicateType_Thread__joinTokenType () T@T)
(declare-fun FrameTypeType () T@T)
(declare-fun Thread__preFork (T@U Real) T@U)
(declare-fun PredicateType_Thread__preForkType () T@T)
(declare-fun Thread__postJoin (T@U Real) T@U)
(declare-fun PredicateType_Thread__postJoinType () T@T)
(declare-fun Thread__joinToken_at_Thread (T@U Real) T@U)
(declare-fun PredicateType_Thread__joinToken_at_ThreadType () T@T)
(declare-fun Thread__preFork_at_Thread (T@U Real) T@U)
(declare-fun PredicateType_Thread__preFork_at_ThreadType () T@T)
(declare-fun Thread__postJoin_at_Thread (T@U Real) T@U)
(declare-fun PredicateType_Thread__postJoin_at_ThreadType () T@T)
(declare-fun Worker__joinToken (T@U Real) T@U)
(declare-fun PredicateType_Worker__joinTokenType () T@T)
(declare-fun Worker__joinToken_at_Worker (T@U Real) T@U)
(declare-fun PredicateType_Worker__joinToken_at_WorkerType () T@T)
(declare-fun Worker__preFork (T@U Real) T@U)
(declare-fun PredicateType_Worker__preForkType () T@T)
(declare-fun Worker__postJoin (T@U Real) T@U)
(declare-fun PredicateType_Worker__postJoinType () T@T)
(declare-fun Worker__joinToken_at_Thread (T@U Real) T@U)
(declare-fun PredicateType_Worker__joinToken_at_ThreadType () T@T)
(declare-fun Worker__preFork_at_Thread (T@U Real) T@U)
(declare-fun PredicateType_Worker__preFork_at_ThreadType () T@T)
(declare-fun Worker__postJoin_at_Thread (T@U Real) T@U)
(declare-fun PredicateType_Worker__postJoin_at_ThreadType () T@T)
(declare-fun Worker__preFork_at_Worker (T@U Real) T@U)
(declare-fun PredicateType_Worker__preFork_at_WorkerType () T@T)
(declare-fun Worker__postJoin_at_Worker (T@U Real) T@U)
(declare-fun PredicateType_Worker__postJoin_at_WorkerType () T@T)
(declare-fun |Thread__joinToken#trigger| (T@U T@U) Bool)
(declare-fun |Thread__joinToken#everUsed| (T@U) Bool)
(declare-fun |Thread__preFork#trigger| (T@U T@U) Bool)
(declare-fun |Thread__preFork#everUsed| (T@U) Bool)
(declare-fun |Thread__postJoin#trigger| (T@U T@U) Bool)
(declare-fun |Thread__postJoin#everUsed| (T@U) Bool)
(declare-fun |Thread__joinToken_at_Thread#trigger| (T@U T@U) Bool)
(declare-fun |Thread__joinToken_at_Thread#everUsed| (T@U) Bool)
(declare-fun |Thread__preFork_at_Thread#trigger| (T@U T@U) Bool)
(declare-fun |Thread__preFork_at_Thread#everUsed| (T@U) Bool)
(declare-fun |Thread__postJoin_at_Thread#trigger| (T@U T@U) Bool)
(declare-fun |Thread__postJoin_at_Thread#everUsed| (T@U) Bool)
(declare-fun |Worker__joinToken#trigger| (T@U T@U) Bool)
(declare-fun |Worker__joinToken#everUsed| (T@U) Bool)
(declare-fun |Worker__joinToken_at_Worker#trigger| (T@U T@U) Bool)
(declare-fun |Worker__joinToken_at_Worker#everUsed| (T@U) Bool)
(declare-fun |Worker__preFork#trigger| (T@U T@U) Bool)
(declare-fun |Worker__preFork#everUsed| (T@U) Bool)
(declare-fun |Worker__postJoin#trigger| (T@U T@U) Bool)
(declare-fun |Worker__postJoin#everUsed| (T@U) Bool)
(declare-fun |Worker__joinToken_at_Thread#trigger| (T@U T@U) Bool)
(declare-fun |Worker__joinToken_at_Thread#everUsed| (T@U) Bool)
(declare-fun |Worker__preFork_at_Thread#trigger| (T@U T@U) Bool)
(declare-fun |Worker__preFork_at_Thread#everUsed| (T@U) Bool)
(declare-fun |Worker__postJoin_at_Thread#trigger| (T@U T@U) Bool)
(declare-fun |Worker__postJoin_at_Thread#everUsed| (T@U) Bool)
(declare-fun |Worker__preFork_at_Worker#trigger| (T@U T@U) Bool)
(declare-fun |Worker__preFork_at_Worker#everUsed| (T@U) Bool)
(declare-fun |Worker__postJoin_at_Worker#trigger| (T@U T@U) Bool)
(declare-fun |Worker__postJoin_at_Worker#everUsed| (T@U) Bool)
(declare-fun IdenticalOnKnownLocations (T@U T@U T@U) Bool)
(declare-fun null () T@U)
(declare-fun PredicateMaskField (T@U) T@U)
(declare-fun HasDirectPerm (T@U T@U T@U) Bool)
(declare-fun IsWandField (T@U) Bool)
(declare-fun WandMaskField (T@U) T@U)
(declare-fun Thread__is_a_Thread (T@U) T@U)
(declare-fun PredicateType_Thread__is_a_ThreadType () T@T)
(declare-fun Thread__instance_of_Thread (T@U) T@U)
(declare-fun PredicateType_Thread__instance_of_ThreadType () T@T)
(declare-fun Worker__is_a_Worker (T@U) T@U)
(declare-fun PredicateType_Worker__is_a_WorkerType () T@T)
(declare-fun Worker__instance_of_Worker (T@U) T@U)
(declare-fun PredicateType_Worker__instance_of_WorkerType () T@T)
(declare-fun Worker__is_a_Thread (T@U) T@U)
(declare-fun PredicateType_Worker__is_a_ThreadType () T@T)
(declare-fun Worker__instance_of_Thread (T@U) T@U)
(declare-fun PredicateType_Worker__instance_of_ThreadType () T@T)
(declare-fun |Thread__is_a_Thread#trigger| (T@U T@U) Bool)
(declare-fun |Thread__is_a_Thread#everUsed| (T@U) Bool)
(declare-fun |Thread__instance_of_Thread#trigger| (T@U T@U) Bool)
(declare-fun |Thread__instance_of_Thread#everUsed| (T@U) Bool)
(declare-fun |Worker__is_a_Worker#trigger| (T@U T@U) Bool)
(declare-fun |Worker__is_a_Worker#everUsed| (T@U) Bool)
(declare-fun |Worker__instance_of_Worker#trigger| (T@U T@U) Bool)
(declare-fun |Worker__instance_of_Worker#everUsed| (T@U) Bool)
(declare-fun |Worker__is_a_Thread#trigger| (T@U T@U) Bool)
(declare-fun |Worker__is_a_Thread#everUsed| (T@U) Bool)
(declare-fun |Worker__instance_of_Thread#trigger| (T@U T@U) Bool)
(declare-fun |Worker__instance_of_Thread#everUsed| (T@U) Bool)
(declare-fun |Thread__joinToken#sm| (T@U Real) T@U)
(declare-fun |Thread__preFork#sm| (T@U Real) T@U)
(declare-fun |Thread__postJoin#sm| (T@U Real) T@U)
(declare-fun |Thread__joinToken_at_Thread#sm| (T@U Real) T@U)
(declare-fun |Thread__preFork_at_Thread#sm| (T@U Real) T@U)
(declare-fun |Thread__postJoin_at_Thread#sm| (T@U Real) T@U)
(declare-fun |Worker__joinToken#sm| (T@U Real) T@U)
(declare-fun |Worker__joinToken_at_Worker#sm| (T@U Real) T@U)
(declare-fun |Worker__preFork#sm| (T@U Real) T@U)
(declare-fun |Worker__postJoin#sm| (T@U Real) T@U)
(declare-fun |Worker__joinToken_at_Thread#sm| (T@U Real) T@U)
(declare-fun |Worker__preFork_at_Thread#sm| (T@U Real) T@U)
(declare-fun |Worker__postJoin_at_Thread#sm| (T@U Real) T@U)
(declare-fun |Worker__preFork_at_Worker#sm| (T@U Real) T@U)
(declare-fun |Worker__postJoin_at_Worker#sm| (T@U Real) T@U)
(declare-fun |Thread__is_a_Thread#sm| (T@U) T@U)
(declare-fun |Thread__instance_of_Thread#sm| (T@U) T@U)
(declare-fun |Worker__is_a_Worker#sm| (T@U) T@U)
(declare-fun |Worker__instance_of_Worker#sm| (T@U) T@U)
(declare-fun |Worker__is_a_Thread#sm| (T@U) T@U)
(declare-fun |Worker__instance_of_Thread#sm| (T@U) T@U)
(declare-fun dummyHeap () T@U)
(declare-fun ZeroMask () T@U)
(declare-fun InsidePredicate (T@U T@U T@U T@U) Bool)
(declare-fun sumMask (T@U T@U T@U) Bool)
(declare-fun ConditionalFrame (Real T@U) T@U)
(declare-fun EmptyFrame () T@U)
(declare-fun NoPerm () Real)
(declare-fun instanceof (T@U T@U) Bool)
(declare-fun class_Object () T@U)
(declare-fun TYPEDomainTypeType () T@T)
(declare-fun getPredWandId (T@U) Int)
(declare-fun FullPerm () Real)
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
))) (= (Ctor NormalFieldType) 7)) (= (type $allocated) (FieldType NormalFieldType boolType))) (= (type Worker__input) (FieldType NormalFieldType intType))) (= (type Worker__output) (FieldType NormalFieldType intType))))
(assert (distinct $allocated Worker__input Worker__output)
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
(assert  (and (and (= (Ctor PredicateType_Thread__joinTokenType) 11) (= (Ctor FrameTypeType) 12)) (forall ((arg0@@23 T@U) (arg1@@9 Real) ) (! (= (type (Thread__joinToken arg0@@23 arg1@@9)) (FieldType PredicateType_Thread__joinTokenType FrameTypeType))
 :qid |funType:Thread__joinToken|
 :pattern ( (Thread__joinToken arg0@@23 arg1@@9))
))))
(assert (forall ((diz T@U) (p_1 Real) ) (!  (=> (= (type diz) RefType) (IsPredicateField (Thread__joinToken diz p_1)))
 :qid |stdinbpl.298:15|
 :skolemid |36|
 :pattern ( (Thread__joinToken diz p_1))
)))
(assert  (and (= (Ctor PredicateType_Thread__preForkType) 13) (forall ((arg0@@24 T@U) (arg1@@10 Real) ) (! (= (type (Thread__preFork arg0@@24 arg1@@10)) (FieldType PredicateType_Thread__preForkType FrameTypeType))
 :qid |funType:Thread__preFork|
 :pattern ( (Thread__preFork arg0@@24 arg1@@10))
))))
(assert (forall ((diz@@0 T@U) (p_1@@0 Real) ) (!  (=> (= (type diz@@0) RefType) (IsPredicateField (Thread__preFork diz@@0 p_1@@0)))
 :qid |stdinbpl.333:15|
 :skolemid |42|
 :pattern ( (Thread__preFork diz@@0 p_1@@0))
)))
(assert  (and (= (Ctor PredicateType_Thread__postJoinType) 14) (forall ((arg0@@25 T@U) (arg1@@11 Real) ) (! (= (type (Thread__postJoin arg0@@25 arg1@@11)) (FieldType PredicateType_Thread__postJoinType FrameTypeType))
 :qid |funType:Thread__postJoin|
 :pattern ( (Thread__postJoin arg0@@25 arg1@@11))
))))
(assert (forall ((diz@@1 T@U) (p_1@@1 Real) ) (!  (=> (= (type diz@@1) RefType) (IsPredicateField (Thread__postJoin diz@@1 p_1@@1)))
 :qid |stdinbpl.368:15|
 :skolemid |48|
 :pattern ( (Thread__postJoin diz@@1 p_1@@1))
)))
(assert  (and (= (Ctor PredicateType_Thread__joinToken_at_ThreadType) 15) (forall ((arg0@@26 T@U) (arg1@@12 Real) ) (! (= (type (Thread__joinToken_at_Thread arg0@@26 arg1@@12)) (FieldType PredicateType_Thread__joinToken_at_ThreadType FrameTypeType))
 :qid |funType:Thread__joinToken_at_Thread|
 :pattern ( (Thread__joinToken_at_Thread arg0@@26 arg1@@12))
))))
(assert (forall ((diz@@2 T@U) (p_1@@2 Real) ) (!  (=> (= (type diz@@2) RefType) (IsPredicateField (Thread__joinToken_at_Thread diz@@2 p_1@@2)))
 :qid |stdinbpl.403:15|
 :skolemid |54|
 :pattern ( (Thread__joinToken_at_Thread diz@@2 p_1@@2))
)))
(assert  (and (= (Ctor PredicateType_Thread__preFork_at_ThreadType) 16) (forall ((arg0@@27 T@U) (arg1@@13 Real) ) (! (= (type (Thread__preFork_at_Thread arg0@@27 arg1@@13)) (FieldType PredicateType_Thread__preFork_at_ThreadType FrameTypeType))
 :qid |funType:Thread__preFork_at_Thread|
 :pattern ( (Thread__preFork_at_Thread arg0@@27 arg1@@13))
))))
(assert (forall ((diz@@3 T@U) (p_1@@3 Real) ) (!  (=> (= (type diz@@3) RefType) (IsPredicateField (Thread__preFork_at_Thread diz@@3 p_1@@3)))
 :qid |stdinbpl.438:15|
 :skolemid |60|
 :pattern ( (Thread__preFork_at_Thread diz@@3 p_1@@3))
)))
(assert  (and (= (Ctor PredicateType_Thread__postJoin_at_ThreadType) 17) (forall ((arg0@@28 T@U) (arg1@@14 Real) ) (! (= (type (Thread__postJoin_at_Thread arg0@@28 arg1@@14)) (FieldType PredicateType_Thread__postJoin_at_ThreadType FrameTypeType))
 :qid |funType:Thread__postJoin_at_Thread|
 :pattern ( (Thread__postJoin_at_Thread arg0@@28 arg1@@14))
))))
(assert (forall ((diz@@4 T@U) (p_1@@4 Real) ) (!  (=> (= (type diz@@4) RefType) (IsPredicateField (Thread__postJoin_at_Thread diz@@4 p_1@@4)))
 :qid |stdinbpl.486:15|
 :skolemid |66|
 :pattern ( (Thread__postJoin_at_Thread diz@@4 p_1@@4))
)))
(assert  (and (= (Ctor PredicateType_Worker__joinTokenType) 18) (forall ((arg0@@29 T@U) (arg1@@15 Real) ) (! (= (type (Worker__joinToken arg0@@29 arg1@@15)) (FieldType PredicateType_Worker__joinTokenType FrameTypeType))
 :qid |funType:Worker__joinToken|
 :pattern ( (Worker__joinToken arg0@@29 arg1@@15))
))))
(assert (forall ((diz@@5 T@U) (p_1@@5 Real) ) (!  (=> (= (type diz@@5) RefType) (IsPredicateField (Worker__joinToken diz@@5 p_1@@5)))
 :qid |stdinbpl.674:15|
 :skolemid |96|
 :pattern ( (Worker__joinToken diz@@5 p_1@@5))
)))
(assert  (and (= (Ctor PredicateType_Worker__joinToken_at_WorkerType) 19) (forall ((arg0@@30 T@U) (arg1@@16 Real) ) (! (= (type (Worker__joinToken_at_Worker arg0@@30 arg1@@16)) (FieldType PredicateType_Worker__joinToken_at_WorkerType FrameTypeType))
 :qid |funType:Worker__joinToken_at_Worker|
 :pattern ( (Worker__joinToken_at_Worker arg0@@30 arg1@@16))
))))
(assert (forall ((diz@@6 T@U) (p_1@@6 Real) ) (!  (=> (= (type diz@@6) RefType) (IsPredicateField (Worker__joinToken_at_Worker diz@@6 p_1@@6)))
 :qid |stdinbpl.709:15|
 :skolemid |102|
 :pattern ( (Worker__joinToken_at_Worker diz@@6 p_1@@6))
)))
(assert  (and (= (Ctor PredicateType_Worker__preForkType) 20) (forall ((arg0@@31 T@U) (arg1@@17 Real) ) (! (= (type (Worker__preFork arg0@@31 arg1@@17)) (FieldType PredicateType_Worker__preForkType FrameTypeType))
 :qid |funType:Worker__preFork|
 :pattern ( (Worker__preFork arg0@@31 arg1@@17))
))))
(assert (forall ((diz@@7 T@U) (p_1@@7 Real) ) (!  (=> (= (type diz@@7) RefType) (IsPredicateField (Worker__preFork diz@@7 p_1@@7)))
 :qid |stdinbpl.761:15|
 :skolemid |108|
 :pattern ( (Worker__preFork diz@@7 p_1@@7))
)))
(assert  (and (= (Ctor PredicateType_Worker__postJoinType) 21) (forall ((arg0@@32 T@U) (arg1@@18 Real) ) (! (= (type (Worker__postJoin arg0@@32 arg1@@18)) (FieldType PredicateType_Worker__postJoinType FrameTypeType))
 :qid |funType:Worker__postJoin|
 :pattern ( (Worker__postJoin arg0@@32 arg1@@18))
))))
(assert (forall ((diz@@8 T@U) (p_1@@8 Real) ) (!  (=> (= (type diz@@8) RefType) (IsPredicateField (Worker__postJoin diz@@8 p_1@@8)))
 :qid |stdinbpl.796:15|
 :skolemid |114|
 :pattern ( (Worker__postJoin diz@@8 p_1@@8))
)))
(assert  (and (= (Ctor PredicateType_Worker__joinToken_at_ThreadType) 22) (forall ((arg0@@33 T@U) (arg1@@19 Real) ) (! (= (type (Worker__joinToken_at_Thread arg0@@33 arg1@@19)) (FieldType PredicateType_Worker__joinToken_at_ThreadType FrameTypeType))
 :qid |funType:Worker__joinToken_at_Thread|
 :pattern ( (Worker__joinToken_at_Thread arg0@@33 arg1@@19))
))))
(assert (forall ((diz@@9 T@U) (p_1@@9 Real) ) (!  (=> (= (type diz@@9) RefType) (IsPredicateField (Worker__joinToken_at_Thread diz@@9 p_1@@9)))
 :qid |stdinbpl.831:15|
 :skolemid |120|
 :pattern ( (Worker__joinToken_at_Thread diz@@9 p_1@@9))
)))
(assert  (and (= (Ctor PredicateType_Worker__preFork_at_ThreadType) 23) (forall ((arg0@@34 T@U) (arg1@@20 Real) ) (! (= (type (Worker__preFork_at_Thread arg0@@34 arg1@@20)) (FieldType PredicateType_Worker__preFork_at_ThreadType FrameTypeType))
 :qid |funType:Worker__preFork_at_Thread|
 :pattern ( (Worker__preFork_at_Thread arg0@@34 arg1@@20))
))))
(assert (forall ((diz@@10 T@U) (p_1@@10 Real) ) (!  (=> (= (type diz@@10) RefType) (IsPredicateField (Worker__preFork_at_Thread diz@@10 p_1@@10)))
 :qid |stdinbpl.866:15|
 :skolemid |126|
 :pattern ( (Worker__preFork_at_Thread diz@@10 p_1@@10))
)))
(assert  (and (= (Ctor PredicateType_Worker__postJoin_at_ThreadType) 24) (forall ((arg0@@35 T@U) (arg1@@21 Real) ) (! (= (type (Worker__postJoin_at_Thread arg0@@35 arg1@@21)) (FieldType PredicateType_Worker__postJoin_at_ThreadType FrameTypeType))
 :qid |funType:Worker__postJoin_at_Thread|
 :pattern ( (Worker__postJoin_at_Thread arg0@@35 arg1@@21))
))))
(assert (forall ((diz@@11 T@U) (p_1@@11 Real) ) (!  (=> (= (type diz@@11) RefType) (IsPredicateField (Worker__postJoin_at_Thread diz@@11 p_1@@11)))
 :qid |stdinbpl.914:15|
 :skolemid |132|
 :pattern ( (Worker__postJoin_at_Thread diz@@11 p_1@@11))
)))
(assert  (and (= (Ctor PredicateType_Worker__preFork_at_WorkerType) 25) (forall ((arg0@@36 T@U) (arg1@@22 Real) ) (! (= (type (Worker__preFork_at_Worker arg0@@36 arg1@@22)) (FieldType PredicateType_Worker__preFork_at_WorkerType FrameTypeType))
 :qid |funType:Worker__preFork_at_Worker|
 :pattern ( (Worker__preFork_at_Worker arg0@@36 arg1@@22))
))))
(assert (forall ((diz@@12 T@U) (p_1@@12 Real) ) (!  (=> (= (type diz@@12) RefType) (IsPredicateField (Worker__preFork_at_Worker diz@@12 p_1@@12)))
 :qid |stdinbpl.962:15|
 :skolemid |138|
 :pattern ( (Worker__preFork_at_Worker diz@@12 p_1@@12))
)))
(assert  (and (= (Ctor PredicateType_Worker__postJoin_at_WorkerType) 26) (forall ((arg0@@37 T@U) (arg1@@23 Real) ) (! (= (type (Worker__postJoin_at_Worker arg0@@37 arg1@@23)) (FieldType PredicateType_Worker__postJoin_at_WorkerType FrameTypeType))
 :qid |funType:Worker__postJoin_at_Worker|
 :pattern ( (Worker__postJoin_at_Worker arg0@@37 arg1@@23))
))))
(assert (forall ((diz@@13 T@U) (p_1@@13 Real) ) (!  (=> (= (type diz@@13) RefType) (IsPredicateField (Worker__postJoin_at_Worker diz@@13 p_1@@13)))
 :qid |stdinbpl.1028:15|
 :skolemid |144|
 :pattern ( (Worker__postJoin_at_Worker diz@@13 p_1@@13))
)))
(assert (forall ((Heap@@0 T@U) (diz@@14 T@U) (p_1@@14 Real) ) (!  (=> (and (= (type Heap@@0) (MapType0Type RefType)) (= (type diz@@14) RefType)) (|Thread__joinToken#everUsed| (Thread__joinToken diz@@14 p_1@@14)))
 :qid |stdinbpl.317:15|
 :skolemid |40|
 :pattern ( (|Thread__joinToken#trigger| Heap@@0 (Thread__joinToken diz@@14 p_1@@14)))
)))
(assert (forall ((Heap@@1 T@U) (diz@@15 T@U) (p_1@@15 Real) ) (!  (=> (and (= (type Heap@@1) (MapType0Type RefType)) (= (type diz@@15) RefType)) (|Thread__preFork#everUsed| (Thread__preFork diz@@15 p_1@@15)))
 :qid |stdinbpl.352:15|
 :skolemid |46|
 :pattern ( (|Thread__preFork#trigger| Heap@@1 (Thread__preFork diz@@15 p_1@@15)))
)))
(assert (forall ((Heap@@2 T@U) (diz@@16 T@U) (p_1@@16 Real) ) (!  (=> (and (= (type Heap@@2) (MapType0Type RefType)) (= (type diz@@16) RefType)) (|Thread__postJoin#everUsed| (Thread__postJoin diz@@16 p_1@@16)))
 :qid |stdinbpl.387:15|
 :skolemid |52|
 :pattern ( (|Thread__postJoin#trigger| Heap@@2 (Thread__postJoin diz@@16 p_1@@16)))
)))
(assert (forall ((Heap@@3 T@U) (diz@@17 T@U) (p_1@@17 Real) ) (!  (=> (and (= (type Heap@@3) (MapType0Type RefType)) (= (type diz@@17) RefType)) (|Thread__joinToken_at_Thread#everUsed| (Thread__joinToken_at_Thread diz@@17 p_1@@17)))
 :qid |stdinbpl.422:15|
 :skolemid |58|
 :pattern ( (|Thread__joinToken_at_Thread#trigger| Heap@@3 (Thread__joinToken_at_Thread diz@@17 p_1@@17)))
)))
(assert (forall ((Heap@@4 T@U) (diz@@18 T@U) (p_1@@18 Real) ) (!  (=> (and (= (type Heap@@4) (MapType0Type RefType)) (= (type diz@@18) RefType)) (|Thread__preFork_at_Thread#everUsed| (Thread__preFork_at_Thread diz@@18 p_1@@18)))
 :qid |stdinbpl.457:15|
 :skolemid |64|
 :pattern ( (|Thread__preFork_at_Thread#trigger| Heap@@4 (Thread__preFork_at_Thread diz@@18 p_1@@18)))
)))
(assert (forall ((Heap@@5 T@U) (diz@@19 T@U) (p_1@@19 Real) ) (!  (=> (and (= (type Heap@@5) (MapType0Type RefType)) (= (type diz@@19) RefType)) (|Thread__postJoin_at_Thread#everUsed| (Thread__postJoin_at_Thread diz@@19 p_1@@19)))
 :qid |stdinbpl.505:15|
 :skolemid |70|
 :pattern ( (|Thread__postJoin_at_Thread#trigger| Heap@@5 (Thread__postJoin_at_Thread diz@@19 p_1@@19)))
)))
(assert (forall ((Heap@@6 T@U) (diz@@20 T@U) (p_1@@20 Real) ) (!  (=> (and (= (type Heap@@6) (MapType0Type RefType)) (= (type diz@@20) RefType)) (|Worker__joinToken#everUsed| (Worker__joinToken diz@@20 p_1@@20)))
 :qid |stdinbpl.693:15|
 :skolemid |100|
 :pattern ( (|Worker__joinToken#trigger| Heap@@6 (Worker__joinToken diz@@20 p_1@@20)))
)))
(assert (forall ((Heap@@7 T@U) (diz@@21 T@U) (p_1@@21 Real) ) (!  (=> (and (= (type Heap@@7) (MapType0Type RefType)) (= (type diz@@21) RefType)) (|Worker__joinToken_at_Worker#everUsed| (Worker__joinToken_at_Worker diz@@21 p_1@@21)))
 :qid |stdinbpl.728:15|
 :skolemid |106|
 :pattern ( (|Worker__joinToken_at_Worker#trigger| Heap@@7 (Worker__joinToken_at_Worker diz@@21 p_1@@21)))
)))
(assert (forall ((Heap@@8 T@U) (diz@@22 T@U) (p_1@@22 Real) ) (!  (=> (and (= (type Heap@@8) (MapType0Type RefType)) (= (type diz@@22) RefType)) (|Worker__preFork#everUsed| (Worker__preFork diz@@22 p_1@@22)))
 :qid |stdinbpl.780:15|
 :skolemid |112|
 :pattern ( (|Worker__preFork#trigger| Heap@@8 (Worker__preFork diz@@22 p_1@@22)))
)))
(assert (forall ((Heap@@9 T@U) (diz@@23 T@U) (p_1@@23 Real) ) (!  (=> (and (= (type Heap@@9) (MapType0Type RefType)) (= (type diz@@23) RefType)) (|Worker__postJoin#everUsed| (Worker__postJoin diz@@23 p_1@@23)))
 :qid |stdinbpl.815:15|
 :skolemid |118|
 :pattern ( (|Worker__postJoin#trigger| Heap@@9 (Worker__postJoin diz@@23 p_1@@23)))
)))
(assert (forall ((Heap@@10 T@U) (diz@@24 T@U) (p_1@@24 Real) ) (!  (=> (and (= (type Heap@@10) (MapType0Type RefType)) (= (type diz@@24) RefType)) (|Worker__joinToken_at_Thread#everUsed| (Worker__joinToken_at_Thread diz@@24 p_1@@24)))
 :qid |stdinbpl.850:15|
 :skolemid |124|
 :pattern ( (|Worker__joinToken_at_Thread#trigger| Heap@@10 (Worker__joinToken_at_Thread diz@@24 p_1@@24)))
)))
(assert (forall ((Heap@@11 T@U) (diz@@25 T@U) (p_1@@25 Real) ) (!  (=> (and (= (type Heap@@11) (MapType0Type RefType)) (= (type diz@@25) RefType)) (|Worker__preFork_at_Thread#everUsed| (Worker__preFork_at_Thread diz@@25 p_1@@25)))
 :qid |stdinbpl.885:15|
 :skolemid |130|
 :pattern ( (|Worker__preFork_at_Thread#trigger| Heap@@11 (Worker__preFork_at_Thread diz@@25 p_1@@25)))
)))
(assert (forall ((Heap@@12 T@U) (diz@@26 T@U) (p_1@@26 Real) ) (!  (=> (and (= (type Heap@@12) (MapType0Type RefType)) (= (type diz@@26) RefType)) (|Worker__postJoin_at_Thread#everUsed| (Worker__postJoin_at_Thread diz@@26 p_1@@26)))
 :qid |stdinbpl.933:15|
 :skolemid |136|
 :pattern ( (|Worker__postJoin_at_Thread#trigger| Heap@@12 (Worker__postJoin_at_Thread diz@@26 p_1@@26)))
)))
(assert (forall ((Heap@@13 T@U) (diz@@27 T@U) (p_1@@27 Real) ) (!  (=> (and (= (type Heap@@13) (MapType0Type RefType)) (= (type diz@@27) RefType)) (|Worker__preFork_at_Worker#everUsed| (Worker__preFork_at_Worker diz@@27 p_1@@27)))
 :qid |stdinbpl.981:15|
 :skolemid |142|
 :pattern ( (|Worker__preFork_at_Worker#trigger| Heap@@13 (Worker__preFork_at_Worker diz@@27 p_1@@27)))
)))
(assert (forall ((Heap@@14 T@U) (diz@@28 T@U) (p_1@@28 Real) ) (!  (=> (and (= (type Heap@@14) (MapType0Type RefType)) (= (type diz@@28) RefType)) (|Worker__postJoin_at_Worker#everUsed| (Worker__postJoin_at_Worker diz@@28 p_1@@28)))
 :qid |stdinbpl.1047:15|
 :skolemid |148|
 :pattern ( (|Worker__postJoin_at_Worker#trigger| Heap@@14 (Worker__postJoin_at_Worker diz@@28 p_1@@28)))
)))
(assert  (and (= (type null) RefType) (forall ((arg0@@38 T@U) ) (! (let ((A (FieldTypeInv0 (type arg0@@38))))
(= (type (PredicateMaskField arg0@@38)) (FieldType A (MapType1Type RefType boolType))))
 :qid |funType:PredicateMaskField|
 :pattern ( (PredicateMaskField arg0@@38))
))))
(assert (forall ((Heap@@15 T@U) (ExhaleHeap T@U) (Mask@@0 T@U) (pm_f T@U) ) (! (let ((C (FieldTypeInv0 (type pm_f))))
 (=> (and (and (and (and (and (= (type Heap@@15) (MapType0Type RefType)) (= (type ExhaleHeap) (MapType0Type RefType))) (= (type Mask@@0) (MapType1Type RefType realType))) (= (type pm_f) (FieldType C FrameTypeType))) (IdenticalOnKnownLocations Heap@@15 ExhaleHeap Mask@@0)) (and (HasDirectPerm Mask@@0 null pm_f) (IsPredicateField pm_f))) (= (MapType0Select Heap@@15 null (PredicateMaskField pm_f)) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))))
 :qid |stdinbpl.47:19|
 :skolemid |2|
 :pattern ( (IdenticalOnKnownLocations Heap@@15 ExhaleHeap Mask@@0) (IsPredicateField pm_f) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))
)))
(assert (forall ((arg0@@39 T@U) ) (! (let ((A@@0 (FieldTypeInv0 (type arg0@@39))))
(= (type (WandMaskField arg0@@39)) (FieldType A@@0 (MapType1Type RefType boolType))))
 :qid |funType:WandMaskField|
 :pattern ( (WandMaskField arg0@@39))
)))
(assert (forall ((Heap@@16 T@U) (ExhaleHeap@@0 T@U) (Mask@@1 T@U) (pm_f@@0 T@U) ) (! (let ((C@@0 (FieldTypeInv0 (type pm_f@@0))))
 (=> (and (and (and (and (and (= (type Heap@@16) (MapType0Type RefType)) (= (type ExhaleHeap@@0) (MapType0Type RefType))) (= (type Mask@@1) (MapType1Type RefType realType))) (= (type pm_f@@0) (FieldType C@@0 FrameTypeType))) (IdenticalOnKnownLocations Heap@@16 ExhaleHeap@@0 Mask@@1)) (and (HasDirectPerm Mask@@1 null pm_f@@0) (IsWandField pm_f@@0))) (= (MapType0Select Heap@@16 null (WandMaskField pm_f@@0)) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))))
 :qid |stdinbpl.60:19|
 :skolemid |5|
 :pattern ( (IdenticalOnKnownLocations Heap@@16 ExhaleHeap@@0 Mask@@1) (IsWandField pm_f@@0) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))
)))
(assert  (and (= (Ctor PredicateType_Thread__is_a_ThreadType) 27) (forall ((arg0@@40 T@U) ) (! (= (type (Thread__is_a_Thread arg0@@40)) (FieldType PredicateType_Thread__is_a_ThreadType FrameTypeType))
 :qid |funType:Thread__is_a_Thread|
 :pattern ( (Thread__is_a_Thread arg0@@40))
))))
(assert (forall ((diz@@29 T@U) ) (!  (=> (= (type diz@@29) RefType) (IsPredicateField (Thread__is_a_Thread diz@@29)))
 :qid |stdinbpl.228:15|
 :skolemid |24|
 :pattern ( (Thread__is_a_Thread diz@@29))
)))
(assert  (and (= (Ctor PredicateType_Thread__instance_of_ThreadType) 28) (forall ((arg0@@41 T@U) ) (! (= (type (Thread__instance_of_Thread arg0@@41)) (FieldType PredicateType_Thread__instance_of_ThreadType FrameTypeType))
 :qid |funType:Thread__instance_of_Thread|
 :pattern ( (Thread__instance_of_Thread arg0@@41))
))))
(assert (forall ((diz@@30 T@U) ) (!  (=> (= (type diz@@30) RefType) (IsPredicateField (Thread__instance_of_Thread diz@@30)))
 :qid |stdinbpl.263:15|
 :skolemid |30|
 :pattern ( (Thread__instance_of_Thread diz@@30))
)))
(assert  (and (= (Ctor PredicateType_Worker__is_a_WorkerType) 29) (forall ((arg0@@42 T@U) ) (! (= (type (Worker__is_a_Worker arg0@@42)) (FieldType PredicateType_Worker__is_a_WorkerType FrameTypeType))
 :qid |funType:Worker__is_a_Worker|
 :pattern ( (Worker__is_a_Worker arg0@@42))
))))
(assert (forall ((diz@@31 T@U) ) (!  (=> (= (type diz@@31) RefType) (IsPredicateField (Worker__is_a_Worker diz@@31)))
 :qid |stdinbpl.534:15|
 :skolemid |72|
 :pattern ( (Worker__is_a_Worker diz@@31))
)))
(assert  (and (= (Ctor PredicateType_Worker__instance_of_WorkerType) 30) (forall ((arg0@@43 T@U) ) (! (= (type (Worker__instance_of_Worker arg0@@43)) (FieldType PredicateType_Worker__instance_of_WorkerType FrameTypeType))
 :qid |funType:Worker__instance_of_Worker|
 :pattern ( (Worker__instance_of_Worker arg0@@43))
))))
(assert (forall ((diz@@32 T@U) ) (!  (=> (= (type diz@@32) RefType) (IsPredicateField (Worker__instance_of_Worker diz@@32)))
 :qid |stdinbpl.569:15|
 :skolemid |78|
 :pattern ( (Worker__instance_of_Worker diz@@32))
)))
(assert  (and (= (Ctor PredicateType_Worker__is_a_ThreadType) 31) (forall ((arg0@@44 T@U) ) (! (= (type (Worker__is_a_Thread arg0@@44)) (FieldType PredicateType_Worker__is_a_ThreadType FrameTypeType))
 :qid |funType:Worker__is_a_Thread|
 :pattern ( (Worker__is_a_Thread arg0@@44))
))))
(assert (forall ((diz@@33 T@U) ) (!  (=> (= (type diz@@33) RefType) (IsPredicateField (Worker__is_a_Thread diz@@33)))
 :qid |stdinbpl.604:15|
 :skolemid |84|
 :pattern ( (Worker__is_a_Thread diz@@33))
)))
(assert  (and (= (Ctor PredicateType_Worker__instance_of_ThreadType) 32) (forall ((arg0@@45 T@U) ) (! (= (type (Worker__instance_of_Thread arg0@@45)) (FieldType PredicateType_Worker__instance_of_ThreadType FrameTypeType))
 :qid |funType:Worker__instance_of_Thread|
 :pattern ( (Worker__instance_of_Thread arg0@@45))
))))
(assert (forall ((diz@@34 T@U) ) (!  (=> (= (type diz@@34) RefType) (IsPredicateField (Worker__instance_of_Thread diz@@34)))
 :qid |stdinbpl.639:15|
 :skolemid |90|
 :pattern ( (Worker__instance_of_Thread diz@@34))
)))
(assert (forall ((Heap@@17 T@U) (diz@@35 T@U) ) (!  (=> (and (= (type Heap@@17) (MapType0Type RefType)) (= (type diz@@35) RefType)) (|Thread__is_a_Thread#everUsed| (Thread__is_a_Thread diz@@35)))
 :qid |stdinbpl.247:15|
 :skolemid |28|
 :pattern ( (|Thread__is_a_Thread#trigger| Heap@@17 (Thread__is_a_Thread diz@@35)))
)))
(assert (forall ((Heap@@18 T@U) (diz@@36 T@U) ) (!  (=> (and (= (type Heap@@18) (MapType0Type RefType)) (= (type diz@@36) RefType)) (|Thread__instance_of_Thread#everUsed| (Thread__instance_of_Thread diz@@36)))
 :qid |stdinbpl.282:15|
 :skolemid |34|
 :pattern ( (|Thread__instance_of_Thread#trigger| Heap@@18 (Thread__instance_of_Thread diz@@36)))
)))
(assert (forall ((Heap@@19 T@U) (diz@@37 T@U) ) (!  (=> (and (= (type Heap@@19) (MapType0Type RefType)) (= (type diz@@37) RefType)) (|Worker__is_a_Worker#everUsed| (Worker__is_a_Worker diz@@37)))
 :qid |stdinbpl.553:15|
 :skolemid |76|
 :pattern ( (|Worker__is_a_Worker#trigger| Heap@@19 (Worker__is_a_Worker diz@@37)))
)))
(assert (forall ((Heap@@20 T@U) (diz@@38 T@U) ) (!  (=> (and (= (type Heap@@20) (MapType0Type RefType)) (= (type diz@@38) RefType)) (|Worker__instance_of_Worker#everUsed| (Worker__instance_of_Worker diz@@38)))
 :qid |stdinbpl.588:15|
 :skolemid |82|
 :pattern ( (|Worker__instance_of_Worker#trigger| Heap@@20 (Worker__instance_of_Worker diz@@38)))
)))
(assert (forall ((Heap@@21 T@U) (diz@@39 T@U) ) (!  (=> (and (= (type Heap@@21) (MapType0Type RefType)) (= (type diz@@39) RefType)) (|Worker__is_a_Thread#everUsed| (Worker__is_a_Thread diz@@39)))
 :qid |stdinbpl.623:15|
 :skolemid |88|
 :pattern ( (|Worker__is_a_Thread#trigger| Heap@@21 (Worker__is_a_Thread diz@@39)))
)))
(assert (forall ((Heap@@22 T@U) (diz@@40 T@U) ) (!  (=> (and (= (type Heap@@22) (MapType0Type RefType)) (= (type diz@@40) RefType)) (|Worker__instance_of_Thread#everUsed| (Worker__instance_of_Thread diz@@40)))
 :qid |stdinbpl.658:15|
 :skolemid |94|
 :pattern ( (|Worker__instance_of_Thread#trigger| Heap@@22 (Worker__instance_of_Thread diz@@40)))
)))
(assert (forall ((Heap@@23 T@U) (ExhaleHeap@@1 T@U) (Mask@@2 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@23) (MapType0Type RefType)) (= (type ExhaleHeap@@1) (MapType0Type RefType))) (= (type Mask@@2) (MapType1Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@23 ExhaleHeap@@1 Mask@@2)) (U_2_bool (MapType0Select Heap@@23 o_1 $allocated))) (U_2_bool (MapType0Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.73:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@23 ExhaleHeap@@1 Mask@@2) (MapType0Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert (forall ((diz@@41 T@U) (p_1@@29 Real) (diz2 T@U) (p2 Real) ) (!  (=> (and (and (= (type diz@@41) RefType) (= (type diz2) RefType)) (= (Thread__joinToken diz@@41 p_1@@29) (Thread__joinToken diz2 p2))) (and (= diz@@41 diz2) (= p_1@@29 p2)))
 :qid |stdinbpl.308:15|
 :skolemid |38|
 :pattern ( (Thread__joinToken diz@@41 p_1@@29) (Thread__joinToken diz2 p2))
)))
(assert (forall ((arg0@@46 T@U) (arg1@@24 Real) ) (! (= (type (|Thread__joinToken#sm| arg0@@46 arg1@@24)) (FieldType PredicateType_Thread__joinTokenType (MapType1Type RefType boolType)))
 :qid |funType:Thread__joinToken#sm|
 :pattern ( (|Thread__joinToken#sm| arg0@@46 arg1@@24))
)))
(assert (forall ((diz@@42 T@U) (p_1@@30 Real) (diz2@@0 T@U) (p2@@0 Real) ) (!  (=> (and (and (= (type diz@@42) RefType) (= (type diz2@@0) RefType)) (= (|Thread__joinToken#sm| diz@@42 p_1@@30) (|Thread__joinToken#sm| diz2@@0 p2@@0))) (and (= diz@@42 diz2@@0) (= p_1@@30 p2@@0)))
 :qid |stdinbpl.312:15|
 :skolemid |39|
 :pattern ( (|Thread__joinToken#sm| diz@@42 p_1@@30) (|Thread__joinToken#sm| diz2@@0 p2@@0))
)))
(assert (forall ((diz@@43 T@U) (p_1@@31 Real) (diz2@@1 T@U) (p2@@1 Real) ) (!  (=> (and (and (= (type diz@@43) RefType) (= (type diz2@@1) RefType)) (= (Thread__preFork diz@@43 p_1@@31) (Thread__preFork diz2@@1 p2@@1))) (and (= diz@@43 diz2@@1) (= p_1@@31 p2@@1)))
 :qid |stdinbpl.343:15|
 :skolemid |44|
 :pattern ( (Thread__preFork diz@@43 p_1@@31) (Thread__preFork diz2@@1 p2@@1))
)))
(assert (forall ((arg0@@47 T@U) (arg1@@25 Real) ) (! (= (type (|Thread__preFork#sm| arg0@@47 arg1@@25)) (FieldType PredicateType_Thread__preForkType (MapType1Type RefType boolType)))
 :qid |funType:Thread__preFork#sm|
 :pattern ( (|Thread__preFork#sm| arg0@@47 arg1@@25))
)))
(assert (forall ((diz@@44 T@U) (p_1@@32 Real) (diz2@@2 T@U) (p2@@2 Real) ) (!  (=> (and (and (= (type diz@@44) RefType) (= (type diz2@@2) RefType)) (= (|Thread__preFork#sm| diz@@44 p_1@@32) (|Thread__preFork#sm| diz2@@2 p2@@2))) (and (= diz@@44 diz2@@2) (= p_1@@32 p2@@2)))
 :qid |stdinbpl.347:15|
 :skolemid |45|
 :pattern ( (|Thread__preFork#sm| diz@@44 p_1@@32) (|Thread__preFork#sm| diz2@@2 p2@@2))
)))
(assert (forall ((diz@@45 T@U) (p_1@@33 Real) (diz2@@3 T@U) (p2@@3 Real) ) (!  (=> (and (and (= (type diz@@45) RefType) (= (type diz2@@3) RefType)) (= (Thread__postJoin diz@@45 p_1@@33) (Thread__postJoin diz2@@3 p2@@3))) (and (= diz@@45 diz2@@3) (= p_1@@33 p2@@3)))
 :qid |stdinbpl.378:15|
 :skolemid |50|
 :pattern ( (Thread__postJoin diz@@45 p_1@@33) (Thread__postJoin diz2@@3 p2@@3))
)))
(assert (forall ((arg0@@48 T@U) (arg1@@26 Real) ) (! (= (type (|Thread__postJoin#sm| arg0@@48 arg1@@26)) (FieldType PredicateType_Thread__postJoinType (MapType1Type RefType boolType)))
 :qid |funType:Thread__postJoin#sm|
 :pattern ( (|Thread__postJoin#sm| arg0@@48 arg1@@26))
)))
(assert (forall ((diz@@46 T@U) (p_1@@34 Real) (diz2@@4 T@U) (p2@@4 Real) ) (!  (=> (and (and (= (type diz@@46) RefType) (= (type diz2@@4) RefType)) (= (|Thread__postJoin#sm| diz@@46 p_1@@34) (|Thread__postJoin#sm| diz2@@4 p2@@4))) (and (= diz@@46 diz2@@4) (= p_1@@34 p2@@4)))
 :qid |stdinbpl.382:15|
 :skolemid |51|
 :pattern ( (|Thread__postJoin#sm| diz@@46 p_1@@34) (|Thread__postJoin#sm| diz2@@4 p2@@4))
)))
(assert (forall ((diz@@47 T@U) (p_1@@35 Real) (diz2@@5 T@U) (p2@@5 Real) ) (!  (=> (and (and (= (type diz@@47) RefType) (= (type diz2@@5) RefType)) (= (Thread__joinToken_at_Thread diz@@47 p_1@@35) (Thread__joinToken_at_Thread diz2@@5 p2@@5))) (and (= diz@@47 diz2@@5) (= p_1@@35 p2@@5)))
 :qid |stdinbpl.413:15|
 :skolemid |56|
 :pattern ( (Thread__joinToken_at_Thread diz@@47 p_1@@35) (Thread__joinToken_at_Thread diz2@@5 p2@@5))
)))
(assert (forall ((arg0@@49 T@U) (arg1@@27 Real) ) (! (= (type (|Thread__joinToken_at_Thread#sm| arg0@@49 arg1@@27)) (FieldType PredicateType_Thread__joinToken_at_ThreadType (MapType1Type RefType boolType)))
 :qid |funType:Thread__joinToken_at_Thread#sm|
 :pattern ( (|Thread__joinToken_at_Thread#sm| arg0@@49 arg1@@27))
)))
(assert (forall ((diz@@48 T@U) (p_1@@36 Real) (diz2@@6 T@U) (p2@@6 Real) ) (!  (=> (and (and (= (type diz@@48) RefType) (= (type diz2@@6) RefType)) (= (|Thread__joinToken_at_Thread#sm| diz@@48 p_1@@36) (|Thread__joinToken_at_Thread#sm| diz2@@6 p2@@6))) (and (= diz@@48 diz2@@6) (= p_1@@36 p2@@6)))
 :qid |stdinbpl.417:15|
 :skolemid |57|
 :pattern ( (|Thread__joinToken_at_Thread#sm| diz@@48 p_1@@36) (|Thread__joinToken_at_Thread#sm| diz2@@6 p2@@6))
)))
(assert (forall ((diz@@49 T@U) (p_1@@37 Real) (diz2@@7 T@U) (p2@@7 Real) ) (!  (=> (and (and (= (type diz@@49) RefType) (= (type diz2@@7) RefType)) (= (Thread__preFork_at_Thread diz@@49 p_1@@37) (Thread__preFork_at_Thread diz2@@7 p2@@7))) (and (= diz@@49 diz2@@7) (= p_1@@37 p2@@7)))
 :qid |stdinbpl.448:15|
 :skolemid |62|
 :pattern ( (Thread__preFork_at_Thread diz@@49 p_1@@37) (Thread__preFork_at_Thread diz2@@7 p2@@7))
)))
(assert (forall ((arg0@@50 T@U) (arg1@@28 Real) ) (! (= (type (|Thread__preFork_at_Thread#sm| arg0@@50 arg1@@28)) (FieldType PredicateType_Thread__preFork_at_ThreadType (MapType1Type RefType boolType)))
 :qid |funType:Thread__preFork_at_Thread#sm|
 :pattern ( (|Thread__preFork_at_Thread#sm| arg0@@50 arg1@@28))
)))
(assert (forall ((diz@@50 T@U) (p_1@@38 Real) (diz2@@8 T@U) (p2@@8 Real) ) (!  (=> (and (and (= (type diz@@50) RefType) (= (type diz2@@8) RefType)) (= (|Thread__preFork_at_Thread#sm| diz@@50 p_1@@38) (|Thread__preFork_at_Thread#sm| diz2@@8 p2@@8))) (and (= diz@@50 diz2@@8) (= p_1@@38 p2@@8)))
 :qid |stdinbpl.452:15|
 :skolemid |63|
 :pattern ( (|Thread__preFork_at_Thread#sm| diz@@50 p_1@@38) (|Thread__preFork_at_Thread#sm| diz2@@8 p2@@8))
)))
(assert (forall ((diz@@51 T@U) (p_1@@39 Real) (diz2@@9 T@U) (p2@@9 Real) ) (!  (=> (and (and (= (type diz@@51) RefType) (= (type diz2@@9) RefType)) (= (Thread__postJoin_at_Thread diz@@51 p_1@@39) (Thread__postJoin_at_Thread diz2@@9 p2@@9))) (and (= diz@@51 diz2@@9) (= p_1@@39 p2@@9)))
 :qid |stdinbpl.496:15|
 :skolemid |68|
 :pattern ( (Thread__postJoin_at_Thread diz@@51 p_1@@39) (Thread__postJoin_at_Thread diz2@@9 p2@@9))
)))
(assert (forall ((arg0@@51 T@U) (arg1@@29 Real) ) (! (= (type (|Thread__postJoin_at_Thread#sm| arg0@@51 arg1@@29)) (FieldType PredicateType_Thread__postJoin_at_ThreadType (MapType1Type RefType boolType)))
 :qid |funType:Thread__postJoin_at_Thread#sm|
 :pattern ( (|Thread__postJoin_at_Thread#sm| arg0@@51 arg1@@29))
)))
(assert (forall ((diz@@52 T@U) (p_1@@40 Real) (diz2@@10 T@U) (p2@@10 Real) ) (!  (=> (and (and (= (type diz@@52) RefType) (= (type diz2@@10) RefType)) (= (|Thread__postJoin_at_Thread#sm| diz@@52 p_1@@40) (|Thread__postJoin_at_Thread#sm| diz2@@10 p2@@10))) (and (= diz@@52 diz2@@10) (= p_1@@40 p2@@10)))
 :qid |stdinbpl.500:15|
 :skolemid |69|
 :pattern ( (|Thread__postJoin_at_Thread#sm| diz@@52 p_1@@40) (|Thread__postJoin_at_Thread#sm| diz2@@10 p2@@10))
)))
(assert (forall ((diz@@53 T@U) (p_1@@41 Real) (diz2@@11 T@U) (p2@@11 Real) ) (!  (=> (and (and (= (type diz@@53) RefType) (= (type diz2@@11) RefType)) (= (Worker__joinToken diz@@53 p_1@@41) (Worker__joinToken diz2@@11 p2@@11))) (and (= diz@@53 diz2@@11) (= p_1@@41 p2@@11)))
 :qid |stdinbpl.684:15|
 :skolemid |98|
 :pattern ( (Worker__joinToken diz@@53 p_1@@41) (Worker__joinToken diz2@@11 p2@@11))
)))
(assert (forall ((arg0@@52 T@U) (arg1@@30 Real) ) (! (= (type (|Worker__joinToken#sm| arg0@@52 arg1@@30)) (FieldType PredicateType_Worker__joinTokenType (MapType1Type RefType boolType)))
 :qid |funType:Worker__joinToken#sm|
 :pattern ( (|Worker__joinToken#sm| arg0@@52 arg1@@30))
)))
(assert (forall ((diz@@54 T@U) (p_1@@42 Real) (diz2@@12 T@U) (p2@@12 Real) ) (!  (=> (and (and (= (type diz@@54) RefType) (= (type diz2@@12) RefType)) (= (|Worker__joinToken#sm| diz@@54 p_1@@42) (|Worker__joinToken#sm| diz2@@12 p2@@12))) (and (= diz@@54 diz2@@12) (= p_1@@42 p2@@12)))
 :qid |stdinbpl.688:15|
 :skolemid |99|
 :pattern ( (|Worker__joinToken#sm| diz@@54 p_1@@42) (|Worker__joinToken#sm| diz2@@12 p2@@12))
)))
(assert (forall ((diz@@55 T@U) (p_1@@43 Real) (diz2@@13 T@U) (p2@@13 Real) ) (!  (=> (and (and (= (type diz@@55) RefType) (= (type diz2@@13) RefType)) (= (Worker__joinToken_at_Worker diz@@55 p_1@@43) (Worker__joinToken_at_Worker diz2@@13 p2@@13))) (and (= diz@@55 diz2@@13) (= p_1@@43 p2@@13)))
 :qid |stdinbpl.719:15|
 :skolemid |104|
 :pattern ( (Worker__joinToken_at_Worker diz@@55 p_1@@43) (Worker__joinToken_at_Worker diz2@@13 p2@@13))
)))
(assert (forall ((arg0@@53 T@U) (arg1@@31 Real) ) (! (= (type (|Worker__joinToken_at_Worker#sm| arg0@@53 arg1@@31)) (FieldType PredicateType_Worker__joinToken_at_WorkerType (MapType1Type RefType boolType)))
 :qid |funType:Worker__joinToken_at_Worker#sm|
 :pattern ( (|Worker__joinToken_at_Worker#sm| arg0@@53 arg1@@31))
)))
(assert (forall ((diz@@56 T@U) (p_1@@44 Real) (diz2@@14 T@U) (p2@@14 Real) ) (!  (=> (and (and (= (type diz@@56) RefType) (= (type diz2@@14) RefType)) (= (|Worker__joinToken_at_Worker#sm| diz@@56 p_1@@44) (|Worker__joinToken_at_Worker#sm| diz2@@14 p2@@14))) (and (= diz@@56 diz2@@14) (= p_1@@44 p2@@14)))
 :qid |stdinbpl.723:15|
 :skolemid |105|
 :pattern ( (|Worker__joinToken_at_Worker#sm| diz@@56 p_1@@44) (|Worker__joinToken_at_Worker#sm| diz2@@14 p2@@14))
)))
(assert (forall ((diz@@57 T@U) (p_1@@45 Real) (diz2@@15 T@U) (p2@@15 Real) ) (!  (=> (and (and (= (type diz@@57) RefType) (= (type diz2@@15) RefType)) (= (Worker__preFork diz@@57 p_1@@45) (Worker__preFork diz2@@15 p2@@15))) (and (= diz@@57 diz2@@15) (= p_1@@45 p2@@15)))
 :qid |stdinbpl.771:15|
 :skolemid |110|
 :pattern ( (Worker__preFork diz@@57 p_1@@45) (Worker__preFork diz2@@15 p2@@15))
)))
(assert (forall ((arg0@@54 T@U) (arg1@@32 Real) ) (! (= (type (|Worker__preFork#sm| arg0@@54 arg1@@32)) (FieldType PredicateType_Worker__preForkType (MapType1Type RefType boolType)))
 :qid |funType:Worker__preFork#sm|
 :pattern ( (|Worker__preFork#sm| arg0@@54 arg1@@32))
)))
(assert (forall ((diz@@58 T@U) (p_1@@46 Real) (diz2@@16 T@U) (p2@@16 Real) ) (!  (=> (and (and (= (type diz@@58) RefType) (= (type diz2@@16) RefType)) (= (|Worker__preFork#sm| diz@@58 p_1@@46) (|Worker__preFork#sm| diz2@@16 p2@@16))) (and (= diz@@58 diz2@@16) (= p_1@@46 p2@@16)))
 :qid |stdinbpl.775:15|
 :skolemid |111|
 :pattern ( (|Worker__preFork#sm| diz@@58 p_1@@46) (|Worker__preFork#sm| diz2@@16 p2@@16))
)))
(assert (forall ((diz@@59 T@U) (p_1@@47 Real) (diz2@@17 T@U) (p2@@17 Real) ) (!  (=> (and (and (= (type diz@@59) RefType) (= (type diz2@@17) RefType)) (= (Worker__postJoin diz@@59 p_1@@47) (Worker__postJoin diz2@@17 p2@@17))) (and (= diz@@59 diz2@@17) (= p_1@@47 p2@@17)))
 :qid |stdinbpl.806:15|
 :skolemid |116|
 :pattern ( (Worker__postJoin diz@@59 p_1@@47) (Worker__postJoin diz2@@17 p2@@17))
)))
(assert (forall ((arg0@@55 T@U) (arg1@@33 Real) ) (! (= (type (|Worker__postJoin#sm| arg0@@55 arg1@@33)) (FieldType PredicateType_Worker__postJoinType (MapType1Type RefType boolType)))
 :qid |funType:Worker__postJoin#sm|
 :pattern ( (|Worker__postJoin#sm| arg0@@55 arg1@@33))
)))
(assert (forall ((diz@@60 T@U) (p_1@@48 Real) (diz2@@18 T@U) (p2@@18 Real) ) (!  (=> (and (and (= (type diz@@60) RefType) (= (type diz2@@18) RefType)) (= (|Worker__postJoin#sm| diz@@60 p_1@@48) (|Worker__postJoin#sm| diz2@@18 p2@@18))) (and (= diz@@60 diz2@@18) (= p_1@@48 p2@@18)))
 :qid |stdinbpl.810:15|
 :skolemid |117|
 :pattern ( (|Worker__postJoin#sm| diz@@60 p_1@@48) (|Worker__postJoin#sm| diz2@@18 p2@@18))
)))
(assert (forall ((diz@@61 T@U) (p_1@@49 Real) (diz2@@19 T@U) (p2@@19 Real) ) (!  (=> (and (and (= (type diz@@61) RefType) (= (type diz2@@19) RefType)) (= (Worker__joinToken_at_Thread diz@@61 p_1@@49) (Worker__joinToken_at_Thread diz2@@19 p2@@19))) (and (= diz@@61 diz2@@19) (= p_1@@49 p2@@19)))
 :qid |stdinbpl.841:15|
 :skolemid |122|
 :pattern ( (Worker__joinToken_at_Thread diz@@61 p_1@@49) (Worker__joinToken_at_Thread diz2@@19 p2@@19))
)))
(assert (forall ((arg0@@56 T@U) (arg1@@34 Real) ) (! (= (type (|Worker__joinToken_at_Thread#sm| arg0@@56 arg1@@34)) (FieldType PredicateType_Worker__joinToken_at_ThreadType (MapType1Type RefType boolType)))
 :qid |funType:Worker__joinToken_at_Thread#sm|
 :pattern ( (|Worker__joinToken_at_Thread#sm| arg0@@56 arg1@@34))
)))
(assert (forall ((diz@@62 T@U) (p_1@@50 Real) (diz2@@20 T@U) (p2@@20 Real) ) (!  (=> (and (and (= (type diz@@62) RefType) (= (type diz2@@20) RefType)) (= (|Worker__joinToken_at_Thread#sm| diz@@62 p_1@@50) (|Worker__joinToken_at_Thread#sm| diz2@@20 p2@@20))) (and (= diz@@62 diz2@@20) (= p_1@@50 p2@@20)))
 :qid |stdinbpl.845:15|
 :skolemid |123|
 :pattern ( (|Worker__joinToken_at_Thread#sm| diz@@62 p_1@@50) (|Worker__joinToken_at_Thread#sm| diz2@@20 p2@@20))
)))
(assert (forall ((diz@@63 T@U) (p_1@@51 Real) (diz2@@21 T@U) (p2@@21 Real) ) (!  (=> (and (and (= (type diz@@63) RefType) (= (type diz2@@21) RefType)) (= (Worker__preFork_at_Thread diz@@63 p_1@@51) (Worker__preFork_at_Thread diz2@@21 p2@@21))) (and (= diz@@63 diz2@@21) (= p_1@@51 p2@@21)))
 :qid |stdinbpl.876:15|
 :skolemid |128|
 :pattern ( (Worker__preFork_at_Thread diz@@63 p_1@@51) (Worker__preFork_at_Thread diz2@@21 p2@@21))
)))
(assert (forall ((arg0@@57 T@U) (arg1@@35 Real) ) (! (= (type (|Worker__preFork_at_Thread#sm| arg0@@57 arg1@@35)) (FieldType PredicateType_Worker__preFork_at_ThreadType (MapType1Type RefType boolType)))
 :qid |funType:Worker__preFork_at_Thread#sm|
 :pattern ( (|Worker__preFork_at_Thread#sm| arg0@@57 arg1@@35))
)))
(assert (forall ((diz@@64 T@U) (p_1@@52 Real) (diz2@@22 T@U) (p2@@22 Real) ) (!  (=> (and (and (= (type diz@@64) RefType) (= (type diz2@@22) RefType)) (= (|Worker__preFork_at_Thread#sm| diz@@64 p_1@@52) (|Worker__preFork_at_Thread#sm| diz2@@22 p2@@22))) (and (= diz@@64 diz2@@22) (= p_1@@52 p2@@22)))
 :qid |stdinbpl.880:15|
 :skolemid |129|
 :pattern ( (|Worker__preFork_at_Thread#sm| diz@@64 p_1@@52) (|Worker__preFork_at_Thread#sm| diz2@@22 p2@@22))
)))
(assert (forall ((diz@@65 T@U) (p_1@@53 Real) (diz2@@23 T@U) (p2@@23 Real) ) (!  (=> (and (and (= (type diz@@65) RefType) (= (type diz2@@23) RefType)) (= (Worker__postJoin_at_Thread diz@@65 p_1@@53) (Worker__postJoin_at_Thread diz2@@23 p2@@23))) (and (= diz@@65 diz2@@23) (= p_1@@53 p2@@23)))
 :qid |stdinbpl.924:15|
 :skolemid |134|
 :pattern ( (Worker__postJoin_at_Thread diz@@65 p_1@@53) (Worker__postJoin_at_Thread diz2@@23 p2@@23))
)))
(assert (forall ((arg0@@58 T@U) (arg1@@36 Real) ) (! (= (type (|Worker__postJoin_at_Thread#sm| arg0@@58 arg1@@36)) (FieldType PredicateType_Worker__postJoin_at_ThreadType (MapType1Type RefType boolType)))
 :qid |funType:Worker__postJoin_at_Thread#sm|
 :pattern ( (|Worker__postJoin_at_Thread#sm| arg0@@58 arg1@@36))
)))
(assert (forall ((diz@@66 T@U) (p_1@@54 Real) (diz2@@24 T@U) (p2@@24 Real) ) (!  (=> (and (and (= (type diz@@66) RefType) (= (type diz2@@24) RefType)) (= (|Worker__postJoin_at_Thread#sm| diz@@66 p_1@@54) (|Worker__postJoin_at_Thread#sm| diz2@@24 p2@@24))) (and (= diz@@66 diz2@@24) (= p_1@@54 p2@@24)))
 :qid |stdinbpl.928:15|
 :skolemid |135|
 :pattern ( (|Worker__postJoin_at_Thread#sm| diz@@66 p_1@@54) (|Worker__postJoin_at_Thread#sm| diz2@@24 p2@@24))
)))
(assert (forall ((diz@@67 T@U) (p_1@@55 Real) (diz2@@25 T@U) (p2@@25 Real) ) (!  (=> (and (and (= (type diz@@67) RefType) (= (type diz2@@25) RefType)) (= (Worker__preFork_at_Worker diz@@67 p_1@@55) (Worker__preFork_at_Worker diz2@@25 p2@@25))) (and (= diz@@67 diz2@@25) (= p_1@@55 p2@@25)))
 :qid |stdinbpl.972:15|
 :skolemid |140|
 :pattern ( (Worker__preFork_at_Worker diz@@67 p_1@@55) (Worker__preFork_at_Worker diz2@@25 p2@@25))
)))
(assert (forall ((arg0@@59 T@U) (arg1@@37 Real) ) (! (= (type (|Worker__preFork_at_Worker#sm| arg0@@59 arg1@@37)) (FieldType PredicateType_Worker__preFork_at_WorkerType (MapType1Type RefType boolType)))
 :qid |funType:Worker__preFork_at_Worker#sm|
 :pattern ( (|Worker__preFork_at_Worker#sm| arg0@@59 arg1@@37))
)))
(assert (forall ((diz@@68 T@U) (p_1@@56 Real) (diz2@@26 T@U) (p2@@26 Real) ) (!  (=> (and (and (= (type diz@@68) RefType) (= (type diz2@@26) RefType)) (= (|Worker__preFork_at_Worker#sm| diz@@68 p_1@@56) (|Worker__preFork_at_Worker#sm| diz2@@26 p2@@26))) (and (= diz@@68 diz2@@26) (= p_1@@56 p2@@26)))
 :qid |stdinbpl.976:15|
 :skolemid |141|
 :pattern ( (|Worker__preFork_at_Worker#sm| diz@@68 p_1@@56) (|Worker__preFork_at_Worker#sm| diz2@@26 p2@@26))
)))
(assert (forall ((diz@@69 T@U) (p_1@@57 Real) (diz2@@27 T@U) (p2@@27 Real) ) (!  (=> (and (and (= (type diz@@69) RefType) (= (type diz2@@27) RefType)) (= (Worker__postJoin_at_Worker diz@@69 p_1@@57) (Worker__postJoin_at_Worker diz2@@27 p2@@27))) (and (= diz@@69 diz2@@27) (= p_1@@57 p2@@27)))
 :qid |stdinbpl.1038:15|
 :skolemid |146|
 :pattern ( (Worker__postJoin_at_Worker diz@@69 p_1@@57) (Worker__postJoin_at_Worker diz2@@27 p2@@27))
)))
(assert (forall ((arg0@@60 T@U) (arg1@@38 Real) ) (! (= (type (|Worker__postJoin_at_Worker#sm| arg0@@60 arg1@@38)) (FieldType PredicateType_Worker__postJoin_at_WorkerType (MapType1Type RefType boolType)))
 :qid |funType:Worker__postJoin_at_Worker#sm|
 :pattern ( (|Worker__postJoin_at_Worker#sm| arg0@@60 arg1@@38))
)))
(assert (forall ((diz@@70 T@U) (p_1@@58 Real) (diz2@@28 T@U) (p2@@28 Real) ) (!  (=> (and (and (= (type diz@@70) RefType) (= (type diz2@@28) RefType)) (= (|Worker__postJoin_at_Worker#sm| diz@@70 p_1@@58) (|Worker__postJoin_at_Worker#sm| diz2@@28 p2@@28))) (and (= diz@@70 diz2@@28) (= p_1@@58 p2@@28)))
 :qid |stdinbpl.1042:15|
 :skolemid |147|
 :pattern ( (|Worker__postJoin_at_Worker#sm| diz@@70 p_1@@58) (|Worker__postJoin_at_Worker#sm| diz2@@28 p2@@28))
)))
(assert (forall ((diz@@71 T@U) (diz2@@29 T@U) ) (!  (=> (and (and (= (type diz@@71) RefType) (= (type diz2@@29) RefType)) (= (Thread__is_a_Thread diz@@71) (Thread__is_a_Thread diz2@@29))) (= diz@@71 diz2@@29))
 :qid |stdinbpl.238:15|
 :skolemid |26|
 :pattern ( (Thread__is_a_Thread diz@@71) (Thread__is_a_Thread diz2@@29))
)))
(assert (forall ((arg0@@61 T@U) ) (! (= (type (|Thread__is_a_Thread#sm| arg0@@61)) (FieldType PredicateType_Thread__is_a_ThreadType (MapType1Type RefType boolType)))
 :qid |funType:Thread__is_a_Thread#sm|
 :pattern ( (|Thread__is_a_Thread#sm| arg0@@61))
)))
(assert (forall ((diz@@72 T@U) (diz2@@30 T@U) ) (!  (=> (and (and (= (type diz@@72) RefType) (= (type diz2@@30) RefType)) (= (|Thread__is_a_Thread#sm| diz@@72) (|Thread__is_a_Thread#sm| diz2@@30))) (= diz@@72 diz2@@30))
 :qid |stdinbpl.242:15|
 :skolemid |27|
 :pattern ( (|Thread__is_a_Thread#sm| diz@@72) (|Thread__is_a_Thread#sm| diz2@@30))
)))
(assert (forall ((diz@@73 T@U) (diz2@@31 T@U) ) (!  (=> (and (and (= (type diz@@73) RefType) (= (type diz2@@31) RefType)) (= (Thread__instance_of_Thread diz@@73) (Thread__instance_of_Thread diz2@@31))) (= diz@@73 diz2@@31))
 :qid |stdinbpl.273:15|
 :skolemid |32|
 :pattern ( (Thread__instance_of_Thread diz@@73) (Thread__instance_of_Thread diz2@@31))
)))
(assert (forall ((arg0@@62 T@U) ) (! (= (type (|Thread__instance_of_Thread#sm| arg0@@62)) (FieldType PredicateType_Thread__instance_of_ThreadType (MapType1Type RefType boolType)))
 :qid |funType:Thread__instance_of_Thread#sm|
 :pattern ( (|Thread__instance_of_Thread#sm| arg0@@62))
)))
(assert (forall ((diz@@74 T@U) (diz2@@32 T@U) ) (!  (=> (and (and (= (type diz@@74) RefType) (= (type diz2@@32) RefType)) (= (|Thread__instance_of_Thread#sm| diz@@74) (|Thread__instance_of_Thread#sm| diz2@@32))) (= diz@@74 diz2@@32))
 :qid |stdinbpl.277:15|
 :skolemid |33|
 :pattern ( (|Thread__instance_of_Thread#sm| diz@@74) (|Thread__instance_of_Thread#sm| diz2@@32))
)))
(assert (forall ((diz@@75 T@U) (diz2@@33 T@U) ) (!  (=> (and (and (= (type diz@@75) RefType) (= (type diz2@@33) RefType)) (= (Worker__is_a_Worker diz@@75) (Worker__is_a_Worker diz2@@33))) (= diz@@75 diz2@@33))
 :qid |stdinbpl.544:15|
 :skolemid |74|
 :pattern ( (Worker__is_a_Worker diz@@75) (Worker__is_a_Worker diz2@@33))
)))
(assert (forall ((arg0@@63 T@U) ) (! (= (type (|Worker__is_a_Worker#sm| arg0@@63)) (FieldType PredicateType_Worker__is_a_WorkerType (MapType1Type RefType boolType)))
 :qid |funType:Worker__is_a_Worker#sm|
 :pattern ( (|Worker__is_a_Worker#sm| arg0@@63))
)))
(assert (forall ((diz@@76 T@U) (diz2@@34 T@U) ) (!  (=> (and (and (= (type diz@@76) RefType) (= (type diz2@@34) RefType)) (= (|Worker__is_a_Worker#sm| diz@@76) (|Worker__is_a_Worker#sm| diz2@@34))) (= diz@@76 diz2@@34))
 :qid |stdinbpl.548:15|
 :skolemid |75|
 :pattern ( (|Worker__is_a_Worker#sm| diz@@76) (|Worker__is_a_Worker#sm| diz2@@34))
)))
(assert (forall ((diz@@77 T@U) (diz2@@35 T@U) ) (!  (=> (and (and (= (type diz@@77) RefType) (= (type diz2@@35) RefType)) (= (Worker__instance_of_Worker diz@@77) (Worker__instance_of_Worker diz2@@35))) (= diz@@77 diz2@@35))
 :qid |stdinbpl.579:15|
 :skolemid |80|
 :pattern ( (Worker__instance_of_Worker diz@@77) (Worker__instance_of_Worker diz2@@35))
)))
(assert (forall ((arg0@@64 T@U) ) (! (= (type (|Worker__instance_of_Worker#sm| arg0@@64)) (FieldType PredicateType_Worker__instance_of_WorkerType (MapType1Type RefType boolType)))
 :qid |funType:Worker__instance_of_Worker#sm|
 :pattern ( (|Worker__instance_of_Worker#sm| arg0@@64))
)))
(assert (forall ((diz@@78 T@U) (diz2@@36 T@U) ) (!  (=> (and (and (= (type diz@@78) RefType) (= (type diz2@@36) RefType)) (= (|Worker__instance_of_Worker#sm| diz@@78) (|Worker__instance_of_Worker#sm| diz2@@36))) (= diz@@78 diz2@@36))
 :qid |stdinbpl.583:15|
 :skolemid |81|
 :pattern ( (|Worker__instance_of_Worker#sm| diz@@78) (|Worker__instance_of_Worker#sm| diz2@@36))
)))
(assert (forall ((diz@@79 T@U) (diz2@@37 T@U) ) (!  (=> (and (and (= (type diz@@79) RefType) (= (type diz2@@37) RefType)) (= (Worker__is_a_Thread diz@@79) (Worker__is_a_Thread diz2@@37))) (= diz@@79 diz2@@37))
 :qid |stdinbpl.614:15|
 :skolemid |86|
 :pattern ( (Worker__is_a_Thread diz@@79) (Worker__is_a_Thread diz2@@37))
)))
(assert (forall ((arg0@@65 T@U) ) (! (= (type (|Worker__is_a_Thread#sm| arg0@@65)) (FieldType PredicateType_Worker__is_a_ThreadType (MapType1Type RefType boolType)))
 :qid |funType:Worker__is_a_Thread#sm|
 :pattern ( (|Worker__is_a_Thread#sm| arg0@@65))
)))
(assert (forall ((diz@@80 T@U) (diz2@@38 T@U) ) (!  (=> (and (and (= (type diz@@80) RefType) (= (type diz2@@38) RefType)) (= (|Worker__is_a_Thread#sm| diz@@80) (|Worker__is_a_Thread#sm| diz2@@38))) (= diz@@80 diz2@@38))
 :qid |stdinbpl.618:15|
 :skolemid |87|
 :pattern ( (|Worker__is_a_Thread#sm| diz@@80) (|Worker__is_a_Thread#sm| diz2@@38))
)))
(assert (forall ((diz@@81 T@U) (diz2@@39 T@U) ) (!  (=> (and (and (= (type diz@@81) RefType) (= (type diz2@@39) RefType)) (= (Worker__instance_of_Thread diz@@81) (Worker__instance_of_Thread diz2@@39))) (= diz@@81 diz2@@39))
 :qid |stdinbpl.649:15|
 :skolemid |92|
 :pattern ( (Worker__instance_of_Thread diz@@81) (Worker__instance_of_Thread diz2@@39))
)))
(assert (forall ((arg0@@66 T@U) ) (! (= (type (|Worker__instance_of_Thread#sm| arg0@@66)) (FieldType PredicateType_Worker__instance_of_ThreadType (MapType1Type RefType boolType)))
 :qid |funType:Worker__instance_of_Thread#sm|
 :pattern ( (|Worker__instance_of_Thread#sm| arg0@@66))
)))
(assert (forall ((diz@@82 T@U) (diz2@@40 T@U) ) (!  (=> (and (and (= (type diz@@82) RefType) (= (type diz2@@40) RefType)) (= (|Worker__instance_of_Thread#sm| diz@@82) (|Worker__instance_of_Thread#sm| diz2@@40))) (= diz@@82 diz2@@40))
 :qid |stdinbpl.653:15|
 :skolemid |93|
 :pattern ( (|Worker__instance_of_Thread#sm| diz@@82) (|Worker__instance_of_Thread#sm| diz2@@40))
)))
(assert (forall ((Heap@@24 T@U) (ExhaleHeap@@2 T@U) (Mask@@3 T@U) (o_1@@0 T@U) (f_2 T@U) ) (! (let ((B@@1 (FieldTypeInv1 (type f_2))))
(let ((A@@1 (FieldTypeInv0 (type f_2))))
 (=> (and (and (and (and (and (and (= (type Heap@@24) (MapType0Type RefType)) (= (type ExhaleHeap@@2) (MapType0Type RefType))) (= (type Mask@@3) (MapType1Type RefType realType))) (= (type o_1@@0) RefType)) (= (type f_2) (FieldType A@@1 B@@1))) (IdenticalOnKnownLocations Heap@@24 ExhaleHeap@@2 Mask@@3)) (HasDirectPerm Mask@@3 o_1@@0 f_2)) (= (MapType0Select Heap@@24 o_1@@0 f_2) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2)))))
 :qid |stdinbpl.42:22|
 :skolemid |1|
 :pattern ( (IdenticalOnKnownLocations Heap@@24 ExhaleHeap@@2 Mask@@3) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2))
)))
(assert  (and (= (type dummyHeap) (MapType0Type RefType)) (= (type ZeroMask) (MapType1Type RefType realType))))
(assert (state dummyHeap ZeroMask))
(assert (forall ((p T@U) (v_1 T@U) (w T@U) ) (! (let ((A@@2 (FieldTypeInv0 (type p))))
 (=> (and (and (= (type p) (FieldType A@@2 FrameTypeType)) (= (type v_1) FrameTypeType)) (= (type w) FrameTypeType)) (not (InsidePredicate p v_1 p w))))
 :qid |stdinbpl.170:19|
 :skolemid |21|
 :pattern ( (InsidePredicate p v_1 p w))
)))
(assert  (not (IsPredicateField Worker__input)))
(assert  (not (IsWandField Worker__input)))
(assert  (not (IsPredicateField Worker__output)))
(assert  (not (IsWandField Worker__output)))
(assert (forall ((Heap@@25 T@U) (ExhaleHeap@@3 T@U) (Mask@@4 T@U) ) (!  (=> (and (and (and (= (type Heap@@25) (MapType0Type RefType)) (= (type ExhaleHeap@@3) (MapType0Type RefType))) (= (type Mask@@4) (MapType1Type RefType realType))) (IdenticalOnKnownLocations Heap@@25 ExhaleHeap@@3 Mask@@4)) (succHeap Heap@@25 ExhaleHeap@@3))
 :qid |stdinbpl.83:15|
 :skolemid |10|
 :pattern ( (IdenticalOnKnownLocations Heap@@25 ExhaleHeap@@3 Mask@@4))
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
(assert  (and (forall ((arg0@@67 Real) (arg1@@39 T@U) ) (! (= (type (ConditionalFrame arg0@@67 arg1@@39)) FrameTypeType)
 :qid |funType:ConditionalFrame|
 :pattern ( (ConditionalFrame arg0@@67 arg1@@39))
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
(assert  (and (= (Ctor TYPEDomainTypeType) 33) (= (type class_Object) TYPEDomainTypeType)))
(assert (forall ((t_1 T@U) ) (!  (=> (= (type t_1) TYPEDomainTypeType) (instanceof class_Object t_1))
 :qid |stdinbpl.201:15|
 :skolemid |22|
 :pattern ( (instanceof class_Object t_1))
)))
(assert (forall ((diz@@83 T@U) (p_1@@59 Real) ) (!  (=> (= (type diz@@83) RefType) (= (getPredWandId (Thread__joinToken diz@@83 p_1@@59)) 2))
 :qid |stdinbpl.302:15|
 :skolemid |37|
 :pattern ( (Thread__joinToken diz@@83 p_1@@59))
)))
(assert (forall ((diz@@84 T@U) (p_1@@60 Real) ) (!  (=> (= (type diz@@84) RefType) (= (getPredWandId (Thread__preFork diz@@84 p_1@@60)) 3))
 :qid |stdinbpl.337:15|
 :skolemid |43|
 :pattern ( (Thread__preFork diz@@84 p_1@@60))
)))
(assert (forall ((diz@@85 T@U) (p_1@@61 Real) ) (!  (=> (= (type diz@@85) RefType) (= (getPredWandId (Thread__postJoin diz@@85 p_1@@61)) 4))
 :qid |stdinbpl.372:15|
 :skolemid |49|
 :pattern ( (Thread__postJoin diz@@85 p_1@@61))
)))
(assert (forall ((diz@@86 T@U) (p_1@@62 Real) ) (!  (=> (= (type diz@@86) RefType) (= (getPredWandId (Thread__joinToken_at_Thread diz@@86 p_1@@62)) 5))
 :qid |stdinbpl.407:15|
 :skolemid |55|
 :pattern ( (Thread__joinToken_at_Thread diz@@86 p_1@@62))
)))
(assert (forall ((diz@@87 T@U) (p_1@@63 Real) ) (!  (=> (= (type diz@@87) RefType) (= (getPredWandId (Thread__preFork_at_Thread diz@@87 p_1@@63)) 6))
 :qid |stdinbpl.442:15|
 :skolemid |61|
 :pattern ( (Thread__preFork_at_Thread diz@@87 p_1@@63))
)))
(assert (forall ((diz@@88 T@U) (p_1@@64 Real) ) (!  (=> (= (type diz@@88) RefType) (= (getPredWandId (Thread__postJoin_at_Thread diz@@88 p_1@@64)) 7))
 :qid |stdinbpl.490:15|
 :skolemid |67|
 :pattern ( (Thread__postJoin_at_Thread diz@@88 p_1@@64))
)))
(assert (forall ((diz@@89 T@U) (p_1@@65 Real) ) (!  (=> (= (type diz@@89) RefType) (= (getPredWandId (Worker__joinToken diz@@89 p_1@@65)) 12))
 :qid |stdinbpl.678:15|
 :skolemid |97|
 :pattern ( (Worker__joinToken diz@@89 p_1@@65))
)))
(assert (forall ((diz@@90 T@U) (p_1@@66 Real) ) (!  (=> (= (type diz@@90) RefType) (= (getPredWandId (Worker__joinToken_at_Worker diz@@90 p_1@@66)) 13))
 :qid |stdinbpl.713:15|
 :skolemid |103|
 :pattern ( (Worker__joinToken_at_Worker diz@@90 p_1@@66))
)))
(assert (forall ((diz@@91 T@U) (p_1@@67 Real) ) (!  (=> (= (type diz@@91) RefType) (= (getPredWandId (Worker__preFork diz@@91 p_1@@67)) 14))
 :qid |stdinbpl.765:15|
 :skolemid |109|
 :pattern ( (Worker__preFork diz@@91 p_1@@67))
)))
(assert (forall ((diz@@92 T@U) (p_1@@68 Real) ) (!  (=> (= (type diz@@92) RefType) (= (getPredWandId (Worker__postJoin diz@@92 p_1@@68)) 15))
 :qid |stdinbpl.800:15|
 :skolemid |115|
 :pattern ( (Worker__postJoin diz@@92 p_1@@68))
)))
(assert (forall ((diz@@93 T@U) (p_1@@69 Real) ) (!  (=> (= (type diz@@93) RefType) (= (getPredWandId (Worker__joinToken_at_Thread diz@@93 p_1@@69)) 16))
 :qid |stdinbpl.835:15|
 :skolemid |121|
 :pattern ( (Worker__joinToken_at_Thread diz@@93 p_1@@69))
)))
(assert (forall ((diz@@94 T@U) (p_1@@70 Real) ) (!  (=> (= (type diz@@94) RefType) (= (getPredWandId (Worker__preFork_at_Thread diz@@94 p_1@@70)) 17))
 :qid |stdinbpl.870:15|
 :skolemid |127|
 :pattern ( (Worker__preFork_at_Thread diz@@94 p_1@@70))
)))
(assert (forall ((diz@@95 T@U) (p_1@@71 Real) ) (!  (=> (= (type diz@@95) RefType) (= (getPredWandId (Worker__postJoin_at_Thread diz@@95 p_1@@71)) 18))
 :qid |stdinbpl.918:15|
 :skolemid |133|
 :pattern ( (Worker__postJoin_at_Thread diz@@95 p_1@@71))
)))
(assert (forall ((diz@@96 T@U) (p_1@@72 Real) ) (!  (=> (= (type diz@@96) RefType) (= (getPredWandId (Worker__preFork_at_Worker diz@@96 p_1@@72)) 19))
 :qid |stdinbpl.966:15|
 :skolemid |139|
 :pattern ( (Worker__preFork_at_Worker diz@@96 p_1@@72))
)))
(assert (forall ((diz@@97 T@U) (p_1@@73 Real) ) (!  (=> (= (type diz@@97) RefType) (= (getPredWandId (Worker__postJoin_at_Worker diz@@97 p_1@@73)) 20))
 :qid |stdinbpl.1032:15|
 :skolemid |145|
 :pattern ( (Worker__postJoin_at_Worker diz@@97 p_1@@73))
)))
(assert (forall ((Heap@@26 T@U) (ExhaleHeap@@4 T@U) (Mask@@6 T@U) (pm_f@@1 T@U) ) (! (let ((C@@1 (FieldTypeInv0 (type pm_f@@1))))
 (=> (and (and (and (and (and (= (type Heap@@26) (MapType0Type RefType)) (= (type ExhaleHeap@@4) (MapType0Type RefType))) (= (type Mask@@6) (MapType1Type RefType realType))) (= (type pm_f@@1) (FieldType C@@1 FrameTypeType))) (IdenticalOnKnownLocations Heap@@26 ExhaleHeap@@4 Mask@@6)) (and (HasDirectPerm Mask@@6 null pm_f@@1) (IsPredicateField pm_f@@1))) (forall ((o2 T@U) (f_2@@0 T@U) ) (! (let ((B@@5 (FieldTypeInv1 (type f_2@@0))))
(let ((A@@6 (FieldTypeInv0 (type f_2@@0))))
 (=> (and (and (= (type o2) RefType) (= (type f_2@@0) (FieldType A@@6 B@@5))) (U_2_bool (MapType1Select (MapType0Select Heap@@26 null (PredicateMaskField pm_f@@1)) o2 f_2@@0))) (= (MapType0Select Heap@@26 o2 f_2@@0) (MapType0Select ExhaleHeap@@4 o2 f_2@@0)))))
 :qid |stdinbpl.54:134|
 :skolemid |3|
 :pattern ( (MapType0Select ExhaleHeap@@4 o2 f_2@@0))
))))
 :qid |stdinbpl.52:19|
 :skolemid |4|
 :pattern ( (IdenticalOnKnownLocations Heap@@26 ExhaleHeap@@4 Mask@@6) (IsPredicateField pm_f@@1))
)))
(assert (forall ((Heap@@27 T@U) (ExhaleHeap@@5 T@U) (Mask@@7 T@U) (pm_f@@2 T@U) ) (! (let ((C@@2 (FieldTypeInv0 (type pm_f@@2))))
 (=> (and (and (and (and (and (= (type Heap@@27) (MapType0Type RefType)) (= (type ExhaleHeap@@5) (MapType0Type RefType))) (= (type Mask@@7) (MapType1Type RefType realType))) (= (type pm_f@@2) (FieldType C@@2 FrameTypeType))) (IdenticalOnKnownLocations Heap@@27 ExhaleHeap@@5 Mask@@7)) (and (HasDirectPerm Mask@@7 null pm_f@@2) (IsWandField pm_f@@2))) (forall ((o2@@0 T@U) (f_2@@1 T@U) ) (! (let ((B@@6 (FieldTypeInv1 (type f_2@@1))))
(let ((A@@7 (FieldTypeInv0 (type f_2@@1))))
 (=> (and (and (= (type o2@@0) RefType) (= (type f_2@@1) (FieldType A@@7 B@@6))) (U_2_bool (MapType1Select (MapType0Select Heap@@27 null (WandMaskField pm_f@@2)) o2@@0 f_2@@1))) (= (MapType0Select Heap@@27 o2@@0 f_2@@1) (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1)))))
 :qid |stdinbpl.67:129|
 :skolemid |6|
 :pattern ( (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1))
))))
 :qid |stdinbpl.65:19|
 :skolemid |7|
 :pattern ( (IdenticalOnKnownLocations Heap@@27 ExhaleHeap@@5 Mask@@7) (IsWandField pm_f@@2))
)))
(assert (forall ((diz@@98 T@U) ) (!  (=> (= (type diz@@98) RefType) (= (getPredWandId (Thread__is_a_Thread diz@@98)) 0))
 :qid |stdinbpl.232:15|
 :skolemid |25|
 :pattern ( (Thread__is_a_Thread diz@@98))
)))
(assert (forall ((diz@@99 T@U) ) (!  (=> (= (type diz@@99) RefType) (= (getPredWandId (Thread__instance_of_Thread diz@@99)) 1))
 :qid |stdinbpl.267:15|
 :skolemid |31|
 :pattern ( (Thread__instance_of_Thread diz@@99))
)))
(assert (forall ((diz@@100 T@U) ) (!  (=> (= (type diz@@100) RefType) (= (getPredWandId (Worker__is_a_Worker diz@@100)) 8))
 :qid |stdinbpl.538:15|
 :skolemid |73|
 :pattern ( (Worker__is_a_Worker diz@@100))
)))
(assert (forall ((diz@@101 T@U) ) (!  (=> (= (type diz@@101) RefType) (= (getPredWandId (Worker__instance_of_Worker diz@@101)) 9))
 :qid |stdinbpl.573:15|
 :skolemid |79|
 :pattern ( (Worker__instance_of_Worker diz@@101))
)))
(assert (forall ((diz@@102 T@U) ) (!  (=> (= (type diz@@102) RefType) (= (getPredWandId (Worker__is_a_Thread diz@@102)) 10))
 :qid |stdinbpl.608:15|
 :skolemid |85|
 :pattern ( (Worker__is_a_Thread diz@@102))
)))
(assert (forall ((diz@@103 T@U) ) (!  (=> (= (type diz@@103) RefType) (= (getPredWandId (Worker__instance_of_Thread diz@@103)) 11))
 :qid |stdinbpl.643:15|
 :skolemid |91|
 :pattern ( (Worker__instance_of_Thread diz@@103))
)))
(assert (forall ((Mask@@8 T@U) (o_2@@2 T@U) (f_4@@2 T@U) ) (! (let ((B@@7 (FieldTypeInv1 (type f_4@@2))))
(let ((A@@8 (FieldTypeInv0 (type f_4@@2))))
 (=> (and (and (and (= (type Mask@@8) (MapType1Type RefType realType)) (= (type o_2@@2) RefType)) (= (type f_4@@2) (FieldType A@@8 B@@7))) (GoodMask Mask@@8)) (and (>= (U_2_real (MapType1Select Mask@@8 o_2@@2 f_4@@2)) NoPerm) (=> (and (and (GoodMask Mask@@8) (not (IsPredicateField f_4@@2))) (not (IsWandField f_4@@2))) (<= (U_2_real (MapType1Select Mask@@8 o_2@@2 f_4@@2)) FullPerm))))))
 :qid |stdinbpl.128:22|
 :skolemid |16|
 :pattern ( (GoodMask Mask@@8) (MapType1Select Mask@@8 o_2@@2 f_4@@2))
)))
(assert (forall ((o T@U) (f T@U) (Heap@@28 T@U) ) (!  (=> (and (and (and (= (type o) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap@@28) (MapType0Type RefType))) (U_2_bool (MapType0Select Heap@@28 o $allocated))) (U_2_bool (MapType0Select Heap@@28 (MapType0Select Heap@@28 o f) $allocated)))
 :qid |stdinbpl.31:15|
 :skolemid |0|
 :pattern ( (MapType0Select Heap@@28 o f))
)))
(assert (forall ((diz@@104 T@U) (p_1@@74 Real) ) (!  (=> (= (type diz@@104) RefType) (= (PredicateMaskField (Thread__joinToken diz@@104 p_1@@74)) (|Thread__joinToken#sm| diz@@104 p_1@@74)))
 :qid |stdinbpl.294:15|
 :skolemid |35|
 :pattern ( (PredicateMaskField (Thread__joinToken diz@@104 p_1@@74)))
)))
(assert (forall ((diz@@105 T@U) (p_1@@75 Real) ) (!  (=> (= (type diz@@105) RefType) (= (PredicateMaskField (Thread__preFork diz@@105 p_1@@75)) (|Thread__preFork#sm| diz@@105 p_1@@75)))
 :qid |stdinbpl.329:15|
 :skolemid |41|
 :pattern ( (PredicateMaskField (Thread__preFork diz@@105 p_1@@75)))
)))
(assert (forall ((diz@@106 T@U) (p_1@@76 Real) ) (!  (=> (= (type diz@@106) RefType) (= (PredicateMaskField (Thread__postJoin diz@@106 p_1@@76)) (|Thread__postJoin#sm| diz@@106 p_1@@76)))
 :qid |stdinbpl.364:15|
 :skolemid |47|
 :pattern ( (PredicateMaskField (Thread__postJoin diz@@106 p_1@@76)))
)))
(assert (forall ((diz@@107 T@U) (p_1@@77 Real) ) (!  (=> (= (type diz@@107) RefType) (= (PredicateMaskField (Thread__joinToken_at_Thread diz@@107 p_1@@77)) (|Thread__joinToken_at_Thread#sm| diz@@107 p_1@@77)))
 :qid |stdinbpl.399:15|
 :skolemid |53|
 :pattern ( (PredicateMaskField (Thread__joinToken_at_Thread diz@@107 p_1@@77)))
)))
(assert (forall ((diz@@108 T@U) (p_1@@78 Real) ) (!  (=> (= (type diz@@108) RefType) (= (PredicateMaskField (Thread__preFork_at_Thread diz@@108 p_1@@78)) (|Thread__preFork_at_Thread#sm| diz@@108 p_1@@78)))
 :qid |stdinbpl.434:15|
 :skolemid |59|
 :pattern ( (PredicateMaskField (Thread__preFork_at_Thread diz@@108 p_1@@78)))
)))
(assert (forall ((diz@@109 T@U) (p_1@@79 Real) ) (!  (=> (= (type diz@@109) RefType) (= (PredicateMaskField (Thread__postJoin_at_Thread diz@@109 p_1@@79)) (|Thread__postJoin_at_Thread#sm| diz@@109 p_1@@79)))
 :qid |stdinbpl.482:15|
 :skolemid |65|
 :pattern ( (PredicateMaskField (Thread__postJoin_at_Thread diz@@109 p_1@@79)))
)))
(assert (forall ((diz@@110 T@U) (p_1@@80 Real) ) (!  (=> (= (type diz@@110) RefType) (= (PredicateMaskField (Worker__joinToken diz@@110 p_1@@80)) (|Worker__joinToken#sm| diz@@110 p_1@@80)))
 :qid |stdinbpl.670:15|
 :skolemid |95|
 :pattern ( (PredicateMaskField (Worker__joinToken diz@@110 p_1@@80)))
)))
(assert (forall ((diz@@111 T@U) (p_1@@81 Real) ) (!  (=> (= (type diz@@111) RefType) (= (PredicateMaskField (Worker__joinToken_at_Worker diz@@111 p_1@@81)) (|Worker__joinToken_at_Worker#sm| diz@@111 p_1@@81)))
 :qid |stdinbpl.705:15|
 :skolemid |101|
 :pattern ( (PredicateMaskField (Worker__joinToken_at_Worker diz@@111 p_1@@81)))
)))
(assert (forall ((diz@@112 T@U) (p_1@@82 Real) ) (!  (=> (= (type diz@@112) RefType) (= (PredicateMaskField (Worker__preFork diz@@112 p_1@@82)) (|Worker__preFork#sm| diz@@112 p_1@@82)))
 :qid |stdinbpl.757:15|
 :skolemid |107|
 :pattern ( (PredicateMaskField (Worker__preFork diz@@112 p_1@@82)))
)))
(assert (forall ((diz@@113 T@U) (p_1@@83 Real) ) (!  (=> (= (type diz@@113) RefType) (= (PredicateMaskField (Worker__postJoin diz@@113 p_1@@83)) (|Worker__postJoin#sm| diz@@113 p_1@@83)))
 :qid |stdinbpl.792:15|
 :skolemid |113|
 :pattern ( (PredicateMaskField (Worker__postJoin diz@@113 p_1@@83)))
)))
(assert (forall ((diz@@114 T@U) (p_1@@84 Real) ) (!  (=> (= (type diz@@114) RefType) (= (PredicateMaskField (Worker__joinToken_at_Thread diz@@114 p_1@@84)) (|Worker__joinToken_at_Thread#sm| diz@@114 p_1@@84)))
 :qid |stdinbpl.827:15|
 :skolemid |119|
 :pattern ( (PredicateMaskField (Worker__joinToken_at_Thread diz@@114 p_1@@84)))
)))
(assert (forall ((diz@@115 T@U) (p_1@@85 Real) ) (!  (=> (= (type diz@@115) RefType) (= (PredicateMaskField (Worker__preFork_at_Thread diz@@115 p_1@@85)) (|Worker__preFork_at_Thread#sm| diz@@115 p_1@@85)))
 :qid |stdinbpl.862:15|
 :skolemid |125|
 :pattern ( (PredicateMaskField (Worker__preFork_at_Thread diz@@115 p_1@@85)))
)))
(assert (forall ((diz@@116 T@U) (p_1@@86 Real) ) (!  (=> (= (type diz@@116) RefType) (= (PredicateMaskField (Worker__postJoin_at_Thread diz@@116 p_1@@86)) (|Worker__postJoin_at_Thread#sm| diz@@116 p_1@@86)))
 :qid |stdinbpl.910:15|
 :skolemid |131|
 :pattern ( (PredicateMaskField (Worker__postJoin_at_Thread diz@@116 p_1@@86)))
)))
(assert (forall ((diz@@117 T@U) (p_1@@87 Real) ) (!  (=> (= (type diz@@117) RefType) (= (PredicateMaskField (Worker__preFork_at_Worker diz@@117 p_1@@87)) (|Worker__preFork_at_Worker#sm| diz@@117 p_1@@87)))
 :qid |stdinbpl.958:15|
 :skolemid |137|
 :pattern ( (PredicateMaskField (Worker__preFork_at_Worker diz@@117 p_1@@87)))
)))
(assert (forall ((diz@@118 T@U) (p_1@@88 Real) ) (!  (=> (= (type diz@@118) RefType) (= (PredicateMaskField (Worker__postJoin_at_Worker diz@@118 p_1@@88)) (|Worker__postJoin_at_Worker#sm| diz@@118 p_1@@88)))
 :qid |stdinbpl.1024:15|
 :skolemid |143|
 :pattern ( (PredicateMaskField (Worker__postJoin_at_Worker diz@@118 p_1@@88)))
)))
(assert (forall ((diz@@119 T@U) ) (!  (=> (= (type diz@@119) RefType) (= (PredicateMaskField (Thread__is_a_Thread diz@@119)) (|Thread__is_a_Thread#sm| diz@@119)))
 :qid |stdinbpl.224:15|
 :skolemid |23|
 :pattern ( (PredicateMaskField (Thread__is_a_Thread diz@@119)))
)))
(assert (forall ((diz@@120 T@U) ) (!  (=> (= (type diz@@120) RefType) (= (PredicateMaskField (Thread__instance_of_Thread diz@@120)) (|Thread__instance_of_Thread#sm| diz@@120)))
 :qid |stdinbpl.259:15|
 :skolemid |29|
 :pattern ( (PredicateMaskField (Thread__instance_of_Thread diz@@120)))
)))
(assert (forall ((diz@@121 T@U) ) (!  (=> (= (type diz@@121) RefType) (= (PredicateMaskField (Worker__is_a_Worker diz@@121)) (|Worker__is_a_Worker#sm| diz@@121)))
 :qid |stdinbpl.530:15|
 :skolemid |71|
 :pattern ( (PredicateMaskField (Worker__is_a_Worker diz@@121)))
)))
(assert (forall ((diz@@122 T@U) ) (!  (=> (= (type diz@@122) RefType) (= (PredicateMaskField (Worker__instance_of_Worker diz@@122)) (|Worker__instance_of_Worker#sm| diz@@122)))
 :qid |stdinbpl.565:15|
 :skolemid |77|
 :pattern ( (PredicateMaskField (Worker__instance_of_Worker diz@@122)))
)))
(assert (forall ((diz@@123 T@U) ) (!  (=> (= (type diz@@123) RefType) (= (PredicateMaskField (Worker__is_a_Thread diz@@123)) (|Worker__is_a_Thread#sm| diz@@123)))
 :qid |stdinbpl.600:15|
 :skolemid |83|
 :pattern ( (PredicateMaskField (Worker__is_a_Thread diz@@123)))
)))
(assert (forall ((diz@@124 T@U) ) (!  (=> (= (type diz@@124) RefType) (= (PredicateMaskField (Worker__instance_of_Thread diz@@124)) (|Worker__instance_of_Thread#sm| diz@@124)))
 :qid |stdinbpl.635:15|
 :skolemid |89|
 :pattern ( (PredicateMaskField (Worker__instance_of_Thread diz@@124)))
)))
(assert (forall ((Heap@@29 T@U) (o@@0 T@U) (f_3 T@U) (v T@U) ) (! (let ((B@@8 (type v)))
(let ((A@@9 (FieldTypeInv0 (type f_3))))
 (=> (and (and (= (type Heap@@29) (MapType0Type RefType)) (= (type o@@0) RefType)) (= (type f_3) (FieldType A@@9 B@@8))) (succHeap Heap@@29 (MapType0Store Heap@@29 o@@0 f_3 v)))))
 :qid |stdinbpl.78:22|
 :skolemid |9|
 :pattern ( (MapType0Store Heap@@29 o@@0 f_3 v))
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
; Valid

(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun Heap@@30 () T@U)
(declare-fun diz@@125 () T@U)
(declare-fun freshObj@0 () T@U)
(declare-fun Heap@0 () T@U)
(declare-fun type_of (T@U) T@U)
(declare-fun class_Main () T@U)
(declare-fun current_thread_id () Int)
(assert  (and (and (and (and (and (= (type Heap@@30) (MapType0Type RefType)) (= (type diz@@125) RefType)) (= (type freshObj@0) RefType)) (= (type Heap@0) (MapType0Type RefType))) (forall ((arg0@@68 T@U) ) (! (= (type (type_of arg0@@68)) TYPEDomainTypeType)
 :qid |funType:type_of|
 :pattern ( (type_of arg0@@68))
))) (= (type class_Main) TYPEDomainTypeType)))
(set-info :boogie-vc-id Main__Main)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 8) (let ((anon3_Else_correct  (=> (U_2_bool (MapType0Select Heap@@30 diz@@125 $allocated)) (=> (and (and (and (not (= freshObj@0 null)) (not (U_2_bool (MapType0Select Heap@@30 freshObj@0 $allocated)))) (and (= Heap@0 (MapType0Store Heap@@30 freshObj@0 $allocated (bool_2_U true))) (state Heap@0 ZeroMask))) (and (and (= (type_of freshObj@0) class_Main) (state Heap@0 ZeroMask)) (and (state Heap@0 ZeroMask) (state Heap@0 ZeroMask)))) (and (=> (= (ControlFlow 0 3) (- 0 6)) (not (= freshObj@0 null))) (=> (not (= freshObj@0 null)) (=> (= (ControlFlow 0 3) (- 0 5)) (= (type_of freshObj@0) class_Main))))))))
(let ((anon3_Then_correct true))
(let ((anon0_correct  (=> (state Heap@@30 ZeroMask) (=> (and (>= current_thread_id 0) (state Heap@@30 ZeroMask)) (and (=> (= (ControlFlow 0 7) 1) anon3_Then_correct) (=> (= (ControlFlow 0 7) 3) anon3_Else_correct))))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 8) 7) anon0_correct)))
PreconditionGeneratedEntry_correct)))))
))
(check-sat)
(pop 1)
; Valid
(get-info :rlimit)
