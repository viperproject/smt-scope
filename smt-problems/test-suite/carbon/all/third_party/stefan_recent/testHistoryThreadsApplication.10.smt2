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
(declare-fun History__x_hist_value () T@U)
(declare-fun History__x_hist_mode () T@U)
(declare-fun History__x_hist_init () T@U)
(declare-fun History__x_hist_act () T@U)
(declare-fun SubjectLock__subject () T@U)
(declare-fun Worker__l () T@U)
(declare-fun Worker__s () T@U)
(declare-fun FieldType (T@T T@T) T@T)
(declare-fun FieldTypeInv0 (T@T) T@T)
(declare-fun FieldTypeInv1 (T@T) T@T)
(declare-fun NormalFieldType () T@T)
(declare-fun RefType () T@T)
(declare-fun p_single (Int) T@U)
(declare-fun p_seq (T@U T@U) T@U)
(declare-fun p_incr () T@U)
(declare-fun p_empty () T@U)
(declare-fun ProcessDomainTypeType () T@T)
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
(declare-fun History__hist_do_incr (T@U Real T@U) T@U)
(declare-fun IsPredicateField (T@U) Bool)
(declare-fun PredicateType_History__hist_do_incrType () T@T)
(declare-fun FrameTypeType () T@T)
(declare-fun History__hist_idle (T@U Real T@U) T@U)
(declare-fun PredicateType_History__hist_idleType () T@T)
(declare-fun SubjectLock__locked (T@U Real Int) T@U)
(declare-fun PredicateType_SubjectLock__lockedType () T@T)
(declare-fun |History__hist_do_incr#trigger| (T@U T@U) Bool)
(declare-fun |History__hist_do_incr#everUsed| (T@U) Bool)
(declare-fun |History__hist_idle#trigger| (T@U T@U) Bool)
(declare-fun |History__hist_idle#everUsed| (T@U) Bool)
(declare-fun |SubjectLock__locked#trigger| (T@U T@U) Bool)
(declare-fun |SubjectLock__locked#everUsed| (T@U) Bool)
(declare-fun getPredWandId (T@U) Int)
(declare-fun Thread__joinToken (T@U Real) T@U)
(declare-fun PredicateType_Thread__joinTokenType () T@T)
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
(declare-fun History__inv (T@U) T@U)
(declare-fun PredicateType_History__invType () T@T)
(declare-fun SubjectLock__inv (T@U) T@U)
(declare-fun PredicateType_SubjectLock__invType () T@T)
(declare-fun SubjectLock__valid (T@U) T@U)
(declare-fun PredicateType_SubjectLock__validType () T@T)
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
(declare-fun |History__free_get_x'| (T@U T@U) Int)
(declare-fun dummyFunction (T@U) Bool)
(declare-fun |History__free_get_x#triggerStateless| (T@U) Int)
(declare-fun |History__hist_get_x'| (T@U T@U) Int)
(declare-fun |History__hist_get_x#triggerStateless| (T@U) Int)
(declare-fun |History__inv#trigger| (T@U T@U) Bool)
(declare-fun |History__inv#everUsed| (T@U) Bool)
(declare-fun |SubjectLock__inv#trigger| (T@U T@U) Bool)
(declare-fun |SubjectLock__inv#everUsed| (T@U) Bool)
(declare-fun |SubjectLock__valid#trigger| (T@U T@U) Bool)
(declare-fun |SubjectLock__valid#everUsed| (T@U) Bool)
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
(declare-fun |History__hist_do_incr#sm| (T@U Real T@U) T@U)
(declare-fun |History__hist_idle#sm| (T@U Real T@U) T@U)
(declare-fun |SubjectLock__locked#sm| (T@U Real Int) T@U)
(declare-fun History__free_get_x (T@U T@U) Int)
(declare-fun History__hist_get_x (T@U T@U) Int)
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
(declare-fun p_dual (Int Int) T@U)
(declare-fun p_merge (T@U T@U) T@U)
(declare-fun |History__inv#sm| (T@U) T@U)
(declare-fun |SubjectLock__inv#sm| (T@U) T@U)
(declare-fun |SubjectLock__valid#sm| (T@U) T@U)
(declare-fun |Thread__is_a_Thread#sm| (T@U) T@U)
(declare-fun |Thread__instance_of_Thread#sm| (T@U) T@U)
(declare-fun |Worker__is_a_Worker#sm| (T@U) T@U)
(declare-fun |Worker__instance_of_Worker#sm| (T@U) T@U)
(declare-fun |Worker__is_a_Thread#sm| (T@U) T@U)
(declare-fun |Worker__instance_of_Thread#sm| (T@U) T@U)
(declare-fun dummyHeap () T@U)
(declare-fun ZeroMask () T@U)
(declare-fun InsidePredicate (T@U T@U T@U T@U) Bool)
(declare-fun AssumeFunctionsAbove () Int)
(declare-fun sumMask (T@U T@U T@U) Bool)
(declare-fun ConditionalFrame (Real T@U) T@U)
(declare-fun EmptyFrame () T@U)
(declare-fun NoPerm () Real)
(declare-fun instanceof (T@U T@U) Bool)
(declare-fun class_Object () T@U)
(declare-fun TYPEDomainTypeType () T@T)
(declare-fun FullPerm () Real)
(declare-fun |History__free_get_x#frame| (T@U T@U) Int)
(declare-fun FrameFragment (T@U) T@U)
(declare-fun |History__hist_get_x#frame| (T@U T@U) Int)
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
))) (= (Ctor NormalFieldType) 7)) (= (type $allocated) (FieldType NormalFieldType boolType))) (= (type History__x_hist_value) (FieldType NormalFieldType intType))) (= (type History__x_hist_mode) (FieldType NormalFieldType intType))) (= (type History__x_hist_init) (FieldType NormalFieldType intType))) (= (type History__x_hist_act) (FieldType NormalFieldType intType))) (= (Ctor RefType) 8)) (= (type SubjectLock__subject) (FieldType NormalFieldType RefType))) (= (type Worker__l) (FieldType NormalFieldType RefType))) (= (type Worker__s) (FieldType NormalFieldType RefType))))
(assert (distinct $allocated History__x_hist_value History__x_hist_mode History__x_hist_init History__x_hist_act SubjectLock__subject Worker__l Worker__s)
)
(assert  (and (and (and (and (= (Ctor ProcessDomainTypeType) 9) (forall ((arg0@@14 Int) ) (! (= (type (p_single arg0@@14)) ProcessDomainTypeType)
 :qid |funType:p_single|
 :pattern ( (p_single arg0@@14))
))) (forall ((arg0@@15 T@U) (arg1@@2 T@U) ) (! (= (type (p_seq arg0@@15 arg1@@2)) ProcessDomainTypeType)
 :qid |funType:p_seq|
 :pattern ( (p_seq arg0@@15 arg1@@2))
))) (= (type p_incr) ProcessDomainTypeType)) (= (type p_empty) ProcessDomainTypeType)))
(assert (forall ((n_1 Int) ) (! (= (ite (> n_1 0) (p_seq p_incr (p_single (- n_1 1))) p_empty) (p_single n_1))
 :qid |stdinbpl.272:15|
 :skolemid |29|
 :pattern ( (p_single n_1))
)))
(assert  (and (and (and (and (and (forall ((arg0@@16 T@T) ) (! (= (Ctor (MapType0Type arg0@@16)) 10)
 :qid |ctor:MapType0Type|
)) (forall ((arg0@@17 T@T) ) (! (= (MapType0TypeInv0 (MapType0Type arg0@@17)) arg0@@17)
 :qid |typeInv:MapType0TypeInv0|
 :pattern ( (MapType0Type arg0@@17))
))) (forall ((arg0@@18 T@U) (arg1@@3 T@U) (arg2 T@U) ) (! (let ((B (FieldTypeInv1 (type arg2))))
(= (type (MapType0Select arg0@@18 arg1@@3 arg2)) B))
 :qid |funType:MapType0Select|
 :pattern ( (MapType0Select arg0@@18 arg1@@3 arg2))
))) (forall ((arg0@@19 T@U) (arg1@@4 T@U) (arg2@@0 T@U) (arg3 T@U) ) (! (let ((aVar0 (type arg1@@4)))
(= (type (MapType0Store arg0@@19 arg1@@4 arg2@@0 arg3)) (MapType0Type aVar0)))
 :qid |funType:MapType0Store|
 :pattern ( (MapType0Store arg0@@19 arg1@@4 arg2@@0 arg3))
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
(assert  (and (and (and (and (and (and (forall ((arg0@@20 T@T) (arg1@@5 T@T) ) (! (= (Ctor (MapType1Type arg0@@20 arg1@@5)) 11)
 :qid |ctor:MapType1Type|
)) (forall ((arg0@@21 T@T) (arg1@@6 T@T) ) (! (= (MapType1TypeInv0 (MapType1Type arg0@@21 arg1@@6)) arg0@@21)
 :qid |typeInv:MapType1TypeInv0|
 :pattern ( (MapType1Type arg0@@21 arg1@@6))
))) (forall ((arg0@@22 T@T) (arg1@@7 T@T) ) (! (= (MapType1TypeInv1 (MapType1Type arg0@@22 arg1@@7)) arg1@@7)
 :qid |typeInv:MapType1TypeInv1|
 :pattern ( (MapType1Type arg0@@22 arg1@@7))
))) (forall ((arg0@@23 T@U) (arg1@@8 T@U) (arg2@@1 T@U) ) (! (let ((aVar1 (MapType1TypeInv1 (type arg0@@23))))
(= (type (MapType1Select arg0@@23 arg1@@8 arg2@@1)) aVar1))
 :qid |funType:MapType1Select|
 :pattern ( (MapType1Select arg0@@23 arg1@@8 arg2@@1))
))) (forall ((arg0@@24 T@U) (arg1@@9 T@U) (arg2@@2 T@U) (arg3@@0 T@U) ) (! (let ((aVar1@@0 (type arg3@@0)))
(let ((aVar0@@0 (type arg1@@9)))
(= (type (MapType1Store arg0@@24 arg1@@9 arg2@@2 arg3@@0)) (MapType1Type aVar0@@0 aVar1@@0))))
 :qid |funType:MapType1Store|
 :pattern ( (MapType1Store arg0@@24 arg1@@9 arg2@@2 arg3@@0))
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
(assert  (and (and (= (Ctor PredicateType_History__hist_do_incrType) 12) (= (Ctor FrameTypeType) 13)) (forall ((arg0@@25 T@U) (arg1@@10 Real) (arg2@@3 T@U) ) (! (= (type (History__hist_do_incr arg0@@25 arg1@@10 arg2@@3)) (FieldType PredicateType_History__hist_do_incrType FrameTypeType))
 :qid |funType:History__hist_do_incr|
 :pattern ( (History__hist_do_incr arg0@@25 arg1@@10 arg2@@3))
))))
(assert (forall ((diz T@U) (frac Real) (proc T@U) ) (!  (=> (and (= (type diz) RefType) (= (type proc) ProcessDomainTypeType)) (IsPredicateField (History__hist_do_incr diz frac proc)))
 :qid |stdinbpl.531:15|
 :skolemid |48|
 :pattern ( (History__hist_do_incr diz frac proc))
)))
(assert  (and (= (Ctor PredicateType_History__hist_idleType) 14) (forall ((arg0@@26 T@U) (arg1@@11 Real) (arg2@@4 T@U) ) (! (= (type (History__hist_idle arg0@@26 arg1@@11 arg2@@4)) (FieldType PredicateType_History__hist_idleType FrameTypeType))
 :qid |funType:History__hist_idle|
 :pattern ( (History__hist_idle arg0@@26 arg1@@11 arg2@@4))
))))
(assert (forall ((diz@@0 T@U) (frac@@0 Real) (proc@@0 T@U) ) (!  (=> (and (= (type diz@@0) RefType) (= (type proc@@0) ProcessDomainTypeType)) (IsPredicateField (History__hist_idle diz@@0 frac@@0 proc@@0)))
 :qid |stdinbpl.566:15|
 :skolemid |54|
 :pattern ( (History__hist_idle diz@@0 frac@@0 proc@@0))
)))
(assert  (and (= (Ctor PredicateType_SubjectLock__lockedType) 15) (forall ((arg0@@27 T@U) (arg1@@12 Real) (arg2@@5 Int) ) (! (= (type (SubjectLock__locked arg0@@27 arg1@@12 arg2@@5)) (FieldType PredicateType_SubjectLock__lockedType FrameTypeType))
 :qid |funType:SubjectLock__locked|
 :pattern ( (SubjectLock__locked arg0@@27 arg1@@12 arg2@@5))
))))
(assert (forall ((diz@@1 T@U) (p_1 Real) (count Int) ) (!  (=> (= (type diz@@1) RefType) (IsPredicateField (SubjectLock__locked diz@@1 p_1 count)))
 :qid |stdinbpl.699:15|
 :skolemid |72|
 :pattern ( (SubjectLock__locked diz@@1 p_1 count))
)))
(assert (forall ((Heap@@0 T@U) (diz@@2 T@U) (frac@@1 Real) (proc@@1 T@U) ) (!  (=> (and (and (= (type Heap@@0) (MapType0Type RefType)) (= (type diz@@2) RefType)) (= (type proc@@1) ProcessDomainTypeType)) (|History__hist_do_incr#everUsed| (History__hist_do_incr diz@@2 frac@@1 proc@@1)))
 :qid |stdinbpl.550:15|
 :skolemid |52|
 :pattern ( (|History__hist_do_incr#trigger| Heap@@0 (History__hist_do_incr diz@@2 frac@@1 proc@@1)))
)))
(assert (forall ((Heap@@1 T@U) (diz@@3 T@U) (frac@@2 Real) (proc@@2 T@U) ) (!  (=> (and (and (= (type Heap@@1) (MapType0Type RefType)) (= (type diz@@3) RefType)) (= (type proc@@2) ProcessDomainTypeType)) (|History__hist_idle#everUsed| (History__hist_idle diz@@3 frac@@2 proc@@2)))
 :qid |stdinbpl.585:15|
 :skolemid |58|
 :pattern ( (|History__hist_idle#trigger| Heap@@1 (History__hist_idle diz@@3 frac@@2 proc@@2)))
)))
(assert (forall ((Heap@@2 T@U) (diz@@4 T@U) (p_1@@0 Real) (count@@0 Int) ) (!  (=> (and (= (type Heap@@2) (MapType0Type RefType)) (= (type diz@@4) RefType)) (|SubjectLock__locked#everUsed| (SubjectLock__locked diz@@4 p_1@@0 count@@0)))
 :qid |stdinbpl.718:15|
 :skolemid |76|
 :pattern ( (|SubjectLock__locked#trigger| Heap@@2 (SubjectLock__locked diz@@4 p_1@@0 count@@0)))
)))
(assert (forall ((diz@@5 T@U) (frac@@3 Real) (proc@@3 T@U) ) (!  (=> (and (= (type diz@@5) RefType) (= (type proc@@3) ProcessDomainTypeType)) (= (getPredWandId (History__hist_do_incr diz@@5 frac@@3 proc@@3)) 1))
 :qid |stdinbpl.535:15|
 :skolemid |49|
 :pattern ( (History__hist_do_incr diz@@5 frac@@3 proc@@3))
)))
(assert (forall ((diz@@6 T@U) (frac@@4 Real) (proc@@4 T@U) ) (!  (=> (and (= (type diz@@6) RefType) (= (type proc@@4) ProcessDomainTypeType)) (= (getPredWandId (History__hist_idle diz@@6 frac@@4 proc@@4)) 2))
 :qid |stdinbpl.570:15|
 :skolemid |55|
 :pattern ( (History__hist_idle diz@@6 frac@@4 proc@@4))
)))
(assert (forall ((diz@@7 T@U) (p_1@@1 Real) (count@@1 Int) ) (!  (=> (= (type diz@@7) RefType) (= (getPredWandId (SubjectLock__locked diz@@7 p_1@@1 count@@1)) 5))
 :qid |stdinbpl.703:15|
 :skolemid |73|
 :pattern ( (SubjectLock__locked diz@@7 p_1@@1 count@@1))
)))
(assert  (and (= (Ctor PredicateType_Thread__joinTokenType) 16) (forall ((arg0@@28 T@U) (arg1@@13 Real) ) (! (= (type (Thread__joinToken arg0@@28 arg1@@13)) (FieldType PredicateType_Thread__joinTokenType FrameTypeType))
 :qid |funType:Thread__joinToken|
 :pattern ( (Thread__joinToken arg0@@28 arg1@@13))
))))
(assert (forall ((diz@@8 T@U) (p_1@@2 Real) ) (!  (=> (= (type diz@@8) RefType) (IsPredicateField (Thread__joinToken diz@@8 p_1@@2)))
 :qid |stdinbpl.804:15|
 :skolemid |90|
 :pattern ( (Thread__joinToken diz@@8 p_1@@2))
)))
(assert  (and (= (Ctor PredicateType_Thread__preForkType) 17) (forall ((arg0@@29 T@U) (arg1@@14 Real) ) (! (= (type (Thread__preFork arg0@@29 arg1@@14)) (FieldType PredicateType_Thread__preForkType FrameTypeType))
 :qid |funType:Thread__preFork|
 :pattern ( (Thread__preFork arg0@@29 arg1@@14))
))))
(assert (forall ((diz@@9 T@U) (p_1@@3 Real) ) (!  (=> (= (type diz@@9) RefType) (IsPredicateField (Thread__preFork diz@@9 p_1@@3)))
 :qid |stdinbpl.839:15|
 :skolemid |96|
 :pattern ( (Thread__preFork diz@@9 p_1@@3))
)))
(assert  (and (= (Ctor PredicateType_Thread__postJoinType) 18) (forall ((arg0@@30 T@U) (arg1@@15 Real) ) (! (= (type (Thread__postJoin arg0@@30 arg1@@15)) (FieldType PredicateType_Thread__postJoinType FrameTypeType))
 :qid |funType:Thread__postJoin|
 :pattern ( (Thread__postJoin arg0@@30 arg1@@15))
))))
(assert (forall ((diz@@10 T@U) (p_1@@4 Real) ) (!  (=> (= (type diz@@10) RefType) (IsPredicateField (Thread__postJoin diz@@10 p_1@@4)))
 :qid |stdinbpl.874:15|
 :skolemid |102|
 :pattern ( (Thread__postJoin diz@@10 p_1@@4))
)))
(assert  (and (= (Ctor PredicateType_Thread__joinToken_at_ThreadType) 19) (forall ((arg0@@31 T@U) (arg1@@16 Real) ) (! (= (type (Thread__joinToken_at_Thread arg0@@31 arg1@@16)) (FieldType PredicateType_Thread__joinToken_at_ThreadType FrameTypeType))
 :qid |funType:Thread__joinToken_at_Thread|
 :pattern ( (Thread__joinToken_at_Thread arg0@@31 arg1@@16))
))))
(assert (forall ((diz@@11 T@U) (p_1@@5 Real) ) (!  (=> (= (type diz@@11) RefType) (IsPredicateField (Thread__joinToken_at_Thread diz@@11 p_1@@5)))
 :qid |stdinbpl.909:15|
 :skolemid |108|
 :pattern ( (Thread__joinToken_at_Thread diz@@11 p_1@@5))
)))
(assert  (and (= (Ctor PredicateType_Thread__preFork_at_ThreadType) 20) (forall ((arg0@@32 T@U) (arg1@@17 Real) ) (! (= (type (Thread__preFork_at_Thread arg0@@32 arg1@@17)) (FieldType PredicateType_Thread__preFork_at_ThreadType FrameTypeType))
 :qid |funType:Thread__preFork_at_Thread|
 :pattern ( (Thread__preFork_at_Thread arg0@@32 arg1@@17))
))))
(assert (forall ((diz@@12 T@U) (p_1@@6 Real) ) (!  (=> (= (type diz@@12) RefType) (IsPredicateField (Thread__preFork_at_Thread diz@@12 p_1@@6)))
 :qid |stdinbpl.944:15|
 :skolemid |114|
 :pattern ( (Thread__preFork_at_Thread diz@@12 p_1@@6))
)))
(assert  (and (= (Ctor PredicateType_Thread__postJoin_at_ThreadType) 21) (forall ((arg0@@33 T@U) (arg1@@18 Real) ) (! (= (type (Thread__postJoin_at_Thread arg0@@33 arg1@@18)) (FieldType PredicateType_Thread__postJoin_at_ThreadType FrameTypeType))
 :qid |funType:Thread__postJoin_at_Thread|
 :pattern ( (Thread__postJoin_at_Thread arg0@@33 arg1@@18))
))))
(assert (forall ((diz@@13 T@U) (p_1@@7 Real) ) (!  (=> (= (type diz@@13) RefType) (IsPredicateField (Thread__postJoin_at_Thread diz@@13 p_1@@7)))
 :qid |stdinbpl.993:15|
 :skolemid |120|
 :pattern ( (Thread__postJoin_at_Thread diz@@13 p_1@@7))
)))
(assert  (and (= (Ctor PredicateType_Worker__joinTokenType) 22) (forall ((arg0@@34 T@U) (arg1@@19 Real) ) (! (= (type (Worker__joinToken arg0@@34 arg1@@19)) (FieldType PredicateType_Worker__joinTokenType FrameTypeType))
 :qid |funType:Worker__joinToken|
 :pattern ( (Worker__joinToken arg0@@34 arg1@@19))
))))
(assert (forall ((diz@@14 T@U) (p_1@@8 Real) ) (!  (=> (= (type diz@@14) RefType) (IsPredicateField (Worker__joinToken diz@@14 p_1@@8)))
 :qid |stdinbpl.1182:15|
 :skolemid |150|
 :pattern ( (Worker__joinToken diz@@14 p_1@@8))
)))
(assert  (and (= (Ctor PredicateType_Worker__joinToken_at_WorkerType) 23) (forall ((arg0@@35 T@U) (arg1@@20 Real) ) (! (= (type (Worker__joinToken_at_Worker arg0@@35 arg1@@20)) (FieldType PredicateType_Worker__joinToken_at_WorkerType FrameTypeType))
 :qid |funType:Worker__joinToken_at_Worker|
 :pattern ( (Worker__joinToken_at_Worker arg0@@35 arg1@@20))
))))
(assert (forall ((diz@@15 T@U) (p_1@@9 Real) ) (!  (=> (= (type diz@@15) RefType) (IsPredicateField (Worker__joinToken_at_Worker diz@@15 p_1@@9)))
 :qid |stdinbpl.1217:15|
 :skolemid |156|
 :pattern ( (Worker__joinToken_at_Worker diz@@15 p_1@@9))
)))
(assert  (and (= (Ctor PredicateType_Worker__preForkType) 24) (forall ((arg0@@36 T@U) (arg1@@21 Real) ) (! (= (type (Worker__preFork arg0@@36 arg1@@21)) (FieldType PredicateType_Worker__preForkType FrameTypeType))
 :qid |funType:Worker__preFork|
 :pattern ( (Worker__preFork arg0@@36 arg1@@21))
))))
(assert (forall ((diz@@16 T@U) (p_1@@10 Real) ) (!  (=> (= (type diz@@16) RefType) (IsPredicateField (Worker__preFork diz@@16 p_1@@10)))
 :qid |stdinbpl.1270:15|
 :skolemid |162|
 :pattern ( (Worker__preFork diz@@16 p_1@@10))
)))
(assert  (and (= (Ctor PredicateType_Worker__postJoinType) 25) (forall ((arg0@@37 T@U) (arg1@@22 Real) ) (! (= (type (Worker__postJoin arg0@@37 arg1@@22)) (FieldType PredicateType_Worker__postJoinType FrameTypeType))
 :qid |funType:Worker__postJoin|
 :pattern ( (Worker__postJoin arg0@@37 arg1@@22))
))))
(assert (forall ((diz@@17 T@U) (p_1@@11 Real) ) (!  (=> (= (type diz@@17) RefType) (IsPredicateField (Worker__postJoin diz@@17 p_1@@11)))
 :qid |stdinbpl.1305:15|
 :skolemid |168|
 :pattern ( (Worker__postJoin diz@@17 p_1@@11))
)))
(assert  (and (= (Ctor PredicateType_Worker__joinToken_at_ThreadType) 26) (forall ((arg0@@38 T@U) (arg1@@23 Real) ) (! (= (type (Worker__joinToken_at_Thread arg0@@38 arg1@@23)) (FieldType PredicateType_Worker__joinToken_at_ThreadType FrameTypeType))
 :qid |funType:Worker__joinToken_at_Thread|
 :pattern ( (Worker__joinToken_at_Thread arg0@@38 arg1@@23))
))))
(assert (forall ((diz@@18 T@U) (p_1@@12 Real) ) (!  (=> (= (type diz@@18) RefType) (IsPredicateField (Worker__joinToken_at_Thread diz@@18 p_1@@12)))
 :qid |stdinbpl.1340:15|
 :skolemid |174|
 :pattern ( (Worker__joinToken_at_Thread diz@@18 p_1@@12))
)))
(assert  (and (= (Ctor PredicateType_Worker__preFork_at_ThreadType) 27) (forall ((arg0@@39 T@U) (arg1@@24 Real) ) (! (= (type (Worker__preFork_at_Thread arg0@@39 arg1@@24)) (FieldType PredicateType_Worker__preFork_at_ThreadType FrameTypeType))
 :qid |funType:Worker__preFork_at_Thread|
 :pattern ( (Worker__preFork_at_Thread arg0@@39 arg1@@24))
))))
(assert (forall ((diz@@19 T@U) (p_1@@13 Real) ) (!  (=> (= (type diz@@19) RefType) (IsPredicateField (Worker__preFork_at_Thread diz@@19 p_1@@13)))
 :qid |stdinbpl.1375:15|
 :skolemid |180|
 :pattern ( (Worker__preFork_at_Thread diz@@19 p_1@@13))
)))
(assert  (and (= (Ctor PredicateType_Worker__postJoin_at_ThreadType) 28) (forall ((arg0@@40 T@U) (arg1@@25 Real) ) (! (= (type (Worker__postJoin_at_Thread arg0@@40 arg1@@25)) (FieldType PredicateType_Worker__postJoin_at_ThreadType FrameTypeType))
 :qid |funType:Worker__postJoin_at_Thread|
 :pattern ( (Worker__postJoin_at_Thread arg0@@40 arg1@@25))
))))
(assert (forall ((diz@@20 T@U) (p_1@@14 Real) ) (!  (=> (= (type diz@@20) RefType) (IsPredicateField (Worker__postJoin_at_Thread diz@@20 p_1@@14)))
 :qid |stdinbpl.1424:15|
 :skolemid |186|
 :pattern ( (Worker__postJoin_at_Thread diz@@20 p_1@@14))
)))
(assert  (and (= (Ctor PredicateType_Worker__preFork_at_WorkerType) 29) (forall ((arg0@@41 T@U) (arg1@@26 Real) ) (! (= (type (Worker__preFork_at_Worker arg0@@41 arg1@@26)) (FieldType PredicateType_Worker__preFork_at_WorkerType FrameTypeType))
 :qid |funType:Worker__preFork_at_Worker|
 :pattern ( (Worker__preFork_at_Worker arg0@@41 arg1@@26))
))))
(assert (forall ((diz@@21 T@U) (p_1@@15 Real) ) (!  (=> (= (type diz@@21) RefType) (IsPredicateField (Worker__preFork_at_Worker diz@@21 p_1@@15)))
 :qid |stdinbpl.1473:15|
 :skolemid |192|
 :pattern ( (Worker__preFork_at_Worker diz@@21 p_1@@15))
)))
(assert  (and (= (Ctor PredicateType_Worker__postJoin_at_WorkerType) 30) (forall ((arg0@@42 T@U) (arg1@@27 Real) ) (! (= (type (Worker__postJoin_at_Worker arg0@@42 arg1@@27)) (FieldType PredicateType_Worker__postJoin_at_WorkerType FrameTypeType))
 :qid |funType:Worker__postJoin_at_Worker|
 :pattern ( (Worker__postJoin_at_Worker arg0@@42 arg1@@27))
))))
(assert (forall ((diz@@22 T@U) (p_1@@16 Real) ) (!  (=> (= (type diz@@22) RefType) (IsPredicateField (Worker__postJoin_at_Worker diz@@22 p_1@@16)))
 :qid |stdinbpl.1572:15|
 :skolemid |198|
 :pattern ( (Worker__postJoin_at_Worker diz@@22 p_1@@16))
)))
(assert (forall ((Heap@@3 T@U) (diz@@23 T@U) (p_1@@17 Real) ) (!  (=> (and (= (type Heap@@3) (MapType0Type RefType)) (= (type diz@@23) RefType)) (|Thread__joinToken#everUsed| (Thread__joinToken diz@@23 p_1@@17)))
 :qid |stdinbpl.823:15|
 :skolemid |94|
 :pattern ( (|Thread__joinToken#trigger| Heap@@3 (Thread__joinToken diz@@23 p_1@@17)))
)))
(assert (forall ((Heap@@4 T@U) (diz@@24 T@U) (p_1@@18 Real) ) (!  (=> (and (= (type Heap@@4) (MapType0Type RefType)) (= (type diz@@24) RefType)) (|Thread__preFork#everUsed| (Thread__preFork diz@@24 p_1@@18)))
 :qid |stdinbpl.858:15|
 :skolemid |100|
 :pattern ( (|Thread__preFork#trigger| Heap@@4 (Thread__preFork diz@@24 p_1@@18)))
)))
(assert (forall ((Heap@@5 T@U) (diz@@25 T@U) (p_1@@19 Real) ) (!  (=> (and (= (type Heap@@5) (MapType0Type RefType)) (= (type diz@@25) RefType)) (|Thread__postJoin#everUsed| (Thread__postJoin diz@@25 p_1@@19)))
 :qid |stdinbpl.893:15|
 :skolemid |106|
 :pattern ( (|Thread__postJoin#trigger| Heap@@5 (Thread__postJoin diz@@25 p_1@@19)))
)))
(assert (forall ((Heap@@6 T@U) (diz@@26 T@U) (p_1@@20 Real) ) (!  (=> (and (= (type Heap@@6) (MapType0Type RefType)) (= (type diz@@26) RefType)) (|Thread__joinToken_at_Thread#everUsed| (Thread__joinToken_at_Thread diz@@26 p_1@@20)))
 :qid |stdinbpl.928:15|
 :skolemid |112|
 :pattern ( (|Thread__joinToken_at_Thread#trigger| Heap@@6 (Thread__joinToken_at_Thread diz@@26 p_1@@20)))
)))
(assert (forall ((Heap@@7 T@U) (diz@@27 T@U) (p_1@@21 Real) ) (!  (=> (and (= (type Heap@@7) (MapType0Type RefType)) (= (type diz@@27) RefType)) (|Thread__preFork_at_Thread#everUsed| (Thread__preFork_at_Thread diz@@27 p_1@@21)))
 :qid |stdinbpl.963:15|
 :skolemid |118|
 :pattern ( (|Thread__preFork_at_Thread#trigger| Heap@@7 (Thread__preFork_at_Thread diz@@27 p_1@@21)))
)))
(assert (forall ((Heap@@8 T@U) (diz@@28 T@U) (p_1@@22 Real) ) (!  (=> (and (= (type Heap@@8) (MapType0Type RefType)) (= (type diz@@28) RefType)) (|Thread__postJoin_at_Thread#everUsed| (Thread__postJoin_at_Thread diz@@28 p_1@@22)))
 :qid |stdinbpl.1012:15|
 :skolemid |124|
 :pattern ( (|Thread__postJoin_at_Thread#trigger| Heap@@8 (Thread__postJoin_at_Thread diz@@28 p_1@@22)))
)))
(assert (forall ((Heap@@9 T@U) (diz@@29 T@U) (p_1@@23 Real) ) (!  (=> (and (= (type Heap@@9) (MapType0Type RefType)) (= (type diz@@29) RefType)) (|Worker__joinToken#everUsed| (Worker__joinToken diz@@29 p_1@@23)))
 :qid |stdinbpl.1201:15|
 :skolemid |154|
 :pattern ( (|Worker__joinToken#trigger| Heap@@9 (Worker__joinToken diz@@29 p_1@@23)))
)))
(assert (forall ((Heap@@10 T@U) (diz@@30 T@U) (p_1@@24 Real) ) (!  (=> (and (= (type Heap@@10) (MapType0Type RefType)) (= (type diz@@30) RefType)) (|Worker__joinToken_at_Worker#everUsed| (Worker__joinToken_at_Worker diz@@30 p_1@@24)))
 :qid |stdinbpl.1236:15|
 :skolemid |160|
 :pattern ( (|Worker__joinToken_at_Worker#trigger| Heap@@10 (Worker__joinToken_at_Worker diz@@30 p_1@@24)))
)))
(assert (forall ((Heap@@11 T@U) (diz@@31 T@U) (p_1@@25 Real) ) (!  (=> (and (= (type Heap@@11) (MapType0Type RefType)) (= (type diz@@31) RefType)) (|Worker__preFork#everUsed| (Worker__preFork diz@@31 p_1@@25)))
 :qid |stdinbpl.1289:15|
 :skolemid |166|
 :pattern ( (|Worker__preFork#trigger| Heap@@11 (Worker__preFork diz@@31 p_1@@25)))
)))
(assert (forall ((Heap@@12 T@U) (diz@@32 T@U) (p_1@@26 Real) ) (!  (=> (and (= (type Heap@@12) (MapType0Type RefType)) (= (type diz@@32) RefType)) (|Worker__postJoin#everUsed| (Worker__postJoin diz@@32 p_1@@26)))
 :qid |stdinbpl.1324:15|
 :skolemid |172|
 :pattern ( (|Worker__postJoin#trigger| Heap@@12 (Worker__postJoin diz@@32 p_1@@26)))
)))
(assert (forall ((Heap@@13 T@U) (diz@@33 T@U) (p_1@@27 Real) ) (!  (=> (and (= (type Heap@@13) (MapType0Type RefType)) (= (type diz@@33) RefType)) (|Worker__joinToken_at_Thread#everUsed| (Worker__joinToken_at_Thread diz@@33 p_1@@27)))
 :qid |stdinbpl.1359:15|
 :skolemid |178|
 :pattern ( (|Worker__joinToken_at_Thread#trigger| Heap@@13 (Worker__joinToken_at_Thread diz@@33 p_1@@27)))
)))
(assert (forall ((Heap@@14 T@U) (diz@@34 T@U) (p_1@@28 Real) ) (!  (=> (and (= (type Heap@@14) (MapType0Type RefType)) (= (type diz@@34) RefType)) (|Worker__preFork_at_Thread#everUsed| (Worker__preFork_at_Thread diz@@34 p_1@@28)))
 :qid |stdinbpl.1394:15|
 :skolemid |184|
 :pattern ( (|Worker__preFork_at_Thread#trigger| Heap@@14 (Worker__preFork_at_Thread diz@@34 p_1@@28)))
)))
(assert (forall ((Heap@@15 T@U) (diz@@35 T@U) (p_1@@29 Real) ) (!  (=> (and (= (type Heap@@15) (MapType0Type RefType)) (= (type diz@@35) RefType)) (|Worker__postJoin_at_Thread#everUsed| (Worker__postJoin_at_Thread diz@@35 p_1@@29)))
 :qid |stdinbpl.1443:15|
 :skolemid |190|
 :pattern ( (|Worker__postJoin_at_Thread#trigger| Heap@@15 (Worker__postJoin_at_Thread diz@@35 p_1@@29)))
)))
(assert (forall ((Heap@@16 T@U) (diz@@36 T@U) (p_1@@30 Real) ) (!  (=> (and (= (type Heap@@16) (MapType0Type RefType)) (= (type diz@@36) RefType)) (|Worker__preFork_at_Worker#everUsed| (Worker__preFork_at_Worker diz@@36 p_1@@30)))
 :qid |stdinbpl.1492:15|
 :skolemid |196|
 :pattern ( (|Worker__preFork_at_Worker#trigger| Heap@@16 (Worker__preFork_at_Worker diz@@36 p_1@@30)))
)))
(assert (forall ((Heap@@17 T@U) (diz@@37 T@U) (p_1@@31 Real) ) (!  (=> (and (= (type Heap@@17) (MapType0Type RefType)) (= (type diz@@37) RefType)) (|Worker__postJoin_at_Worker#everUsed| (Worker__postJoin_at_Worker diz@@37 p_1@@31)))
 :qid |stdinbpl.1591:15|
 :skolemid |202|
 :pattern ( (|Worker__postJoin_at_Worker#trigger| Heap@@17 (Worker__postJoin_at_Worker diz@@37 p_1@@31)))
)))
(assert  (and (= (type null) RefType) (forall ((arg0@@43 T@U) ) (! (let ((A (FieldTypeInv0 (type arg0@@43))))
(= (type (PredicateMaskField arg0@@43)) (FieldType A (MapType1Type RefType boolType))))
 :qid |funType:PredicateMaskField|
 :pattern ( (PredicateMaskField arg0@@43))
))))
(assert (forall ((Heap@@18 T@U) (ExhaleHeap T@U) (Mask@@0 T@U) (pm_f T@U) ) (! (let ((C (FieldTypeInv0 (type pm_f))))
 (=> (and (and (and (and (and (= (type Heap@@18) (MapType0Type RefType)) (= (type ExhaleHeap) (MapType0Type RefType))) (= (type Mask@@0) (MapType1Type RefType realType))) (= (type pm_f) (FieldType C FrameTypeType))) (IdenticalOnKnownLocations Heap@@18 ExhaleHeap Mask@@0)) (and (HasDirectPerm Mask@@0 null pm_f) (IsPredicateField pm_f))) (= (MapType0Select Heap@@18 null (PredicateMaskField pm_f)) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))))
 :qid |stdinbpl.47:19|
 :skolemid |2|
 :pattern ( (IdenticalOnKnownLocations Heap@@18 ExhaleHeap Mask@@0) (IsPredicateField pm_f) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))
)))
(assert (forall ((arg0@@44 T@U) ) (! (let ((A@@0 (FieldTypeInv0 (type arg0@@44))))
(= (type (WandMaskField arg0@@44)) (FieldType A@@0 (MapType1Type RefType boolType))))
 :qid |funType:WandMaskField|
 :pattern ( (WandMaskField arg0@@44))
)))
(assert (forall ((Heap@@19 T@U) (ExhaleHeap@@0 T@U) (Mask@@1 T@U) (pm_f@@0 T@U) ) (! (let ((C@@0 (FieldTypeInv0 (type pm_f@@0))))
 (=> (and (and (and (and (and (= (type Heap@@19) (MapType0Type RefType)) (= (type ExhaleHeap@@0) (MapType0Type RefType))) (= (type Mask@@1) (MapType1Type RefType realType))) (= (type pm_f@@0) (FieldType C@@0 FrameTypeType))) (IdenticalOnKnownLocations Heap@@19 ExhaleHeap@@0 Mask@@1)) (and (HasDirectPerm Mask@@1 null pm_f@@0) (IsWandField pm_f@@0))) (= (MapType0Select Heap@@19 null (WandMaskField pm_f@@0)) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))))
 :qid |stdinbpl.60:19|
 :skolemid |5|
 :pattern ( (IdenticalOnKnownLocations Heap@@19 ExhaleHeap@@0 Mask@@1) (IsWandField pm_f@@0) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))
)))
(assert  (and (= (Ctor PredicateType_History__invType) 31) (forall ((arg0@@45 T@U) ) (! (= (type (History__inv arg0@@45)) (FieldType PredicateType_History__invType FrameTypeType))
 :qid |funType:History__inv|
 :pattern ( (History__inv arg0@@45))
))))
(assert (forall ((diz@@38 T@U) ) (!  (=> (= (type diz@@38) RefType) (IsPredicateField (History__inv diz@@38)))
 :qid |stdinbpl.468:15|
 :skolemid |42|
 :pattern ( (History__inv diz@@38))
)))
(assert  (and (= (Ctor PredicateType_SubjectLock__invType) 32) (forall ((arg0@@46 T@U) ) (! (= (type (SubjectLock__inv arg0@@46)) (FieldType PredicateType_SubjectLock__invType FrameTypeType))
 :qid |funType:SubjectLock__inv|
 :pattern ( (SubjectLock__inv arg0@@46))
))))
(assert (forall ((diz@@39 T@U) ) (!  (=> (= (type diz@@39) RefType) (IsPredicateField (SubjectLock__inv diz@@39)))
 :qid |stdinbpl.601:15|
 :skolemid |60|
 :pattern ( (SubjectLock__inv diz@@39))
)))
(assert  (and (= (Ctor PredicateType_SubjectLock__validType) 33) (forall ((arg0@@47 T@U) ) (! (= (type (SubjectLock__valid arg0@@47)) (FieldType PredicateType_SubjectLock__validType FrameTypeType))
 :qid |funType:SubjectLock__valid|
 :pattern ( (SubjectLock__valid arg0@@47))
))))
(assert (forall ((diz@@40 T@U) ) (!  (=> (= (type diz@@40) RefType) (IsPredicateField (SubjectLock__valid diz@@40)))
 :qid |stdinbpl.664:15|
 :skolemid |66|
 :pattern ( (SubjectLock__valid diz@@40))
)))
(assert  (and (= (Ctor PredicateType_Thread__is_a_ThreadType) 34) (forall ((arg0@@48 T@U) ) (! (= (type (Thread__is_a_Thread arg0@@48)) (FieldType PredicateType_Thread__is_a_ThreadType FrameTypeType))
 :qid |funType:Thread__is_a_Thread|
 :pattern ( (Thread__is_a_Thread arg0@@48))
))))
(assert (forall ((diz@@41 T@U) ) (!  (=> (= (type diz@@41) RefType) (IsPredicateField (Thread__is_a_Thread diz@@41)))
 :qid |stdinbpl.734:15|
 :skolemid |78|
 :pattern ( (Thread__is_a_Thread diz@@41))
)))
(assert  (and (= (Ctor PredicateType_Thread__instance_of_ThreadType) 35) (forall ((arg0@@49 T@U) ) (! (= (type (Thread__instance_of_Thread arg0@@49)) (FieldType PredicateType_Thread__instance_of_ThreadType FrameTypeType))
 :qid |funType:Thread__instance_of_Thread|
 :pattern ( (Thread__instance_of_Thread arg0@@49))
))))
(assert (forall ((diz@@42 T@U) ) (!  (=> (= (type diz@@42) RefType) (IsPredicateField (Thread__instance_of_Thread diz@@42)))
 :qid |stdinbpl.769:15|
 :skolemid |84|
 :pattern ( (Thread__instance_of_Thread diz@@42))
)))
(assert  (and (= (Ctor PredicateType_Worker__is_a_WorkerType) 36) (forall ((arg0@@50 T@U) ) (! (= (type (Worker__is_a_Worker arg0@@50)) (FieldType PredicateType_Worker__is_a_WorkerType FrameTypeType))
 :qid |funType:Worker__is_a_Worker|
 :pattern ( (Worker__is_a_Worker arg0@@50))
))))
(assert (forall ((diz@@43 T@U) ) (!  (=> (= (type diz@@43) RefType) (IsPredicateField (Worker__is_a_Worker diz@@43)))
 :qid |stdinbpl.1042:15|
 :skolemid |126|
 :pattern ( (Worker__is_a_Worker diz@@43))
)))
(assert  (and (= (Ctor PredicateType_Worker__instance_of_WorkerType) 37) (forall ((arg0@@51 T@U) ) (! (= (type (Worker__instance_of_Worker arg0@@51)) (FieldType PredicateType_Worker__instance_of_WorkerType FrameTypeType))
 :qid |funType:Worker__instance_of_Worker|
 :pattern ( (Worker__instance_of_Worker arg0@@51))
))))
(assert (forall ((diz@@44 T@U) ) (!  (=> (= (type diz@@44) RefType) (IsPredicateField (Worker__instance_of_Worker diz@@44)))
 :qid |stdinbpl.1077:15|
 :skolemid |132|
 :pattern ( (Worker__instance_of_Worker diz@@44))
)))
(assert  (and (= (Ctor PredicateType_Worker__is_a_ThreadType) 38) (forall ((arg0@@52 T@U) ) (! (= (type (Worker__is_a_Thread arg0@@52)) (FieldType PredicateType_Worker__is_a_ThreadType FrameTypeType))
 :qid |funType:Worker__is_a_Thread|
 :pattern ( (Worker__is_a_Thread arg0@@52))
))))
(assert (forall ((diz@@45 T@U) ) (!  (=> (= (type diz@@45) RefType) (IsPredicateField (Worker__is_a_Thread diz@@45)))
 :qid |stdinbpl.1112:15|
 :skolemid |138|
 :pattern ( (Worker__is_a_Thread diz@@45))
)))
(assert  (and (= (Ctor PredicateType_Worker__instance_of_ThreadType) 39) (forall ((arg0@@53 T@U) ) (! (= (type (Worker__instance_of_Thread arg0@@53)) (FieldType PredicateType_Worker__instance_of_ThreadType FrameTypeType))
 :qid |funType:Worker__instance_of_Thread|
 :pattern ( (Worker__instance_of_Thread arg0@@53))
))))
(assert (forall ((diz@@46 T@U) ) (!  (=> (= (type diz@@46) RefType) (IsPredicateField (Worker__instance_of_Thread diz@@46)))
 :qid |stdinbpl.1147:15|
 :skolemid |144|
 :pattern ( (Worker__instance_of_Thread diz@@46))
)))
(assert (forall ((Heap@@20 T@U) (diz@@47 T@U) ) (!  (=> (and (= (type Heap@@20) (MapType0Type RefType)) (= (type diz@@47) RefType)) (dummyFunction (int_2_U (|History__free_get_x#triggerStateless| diz@@47))))
 :qid |stdinbpl.332:15|
 :skolemid |34|
 :pattern ( (|History__free_get_x'| Heap@@20 diz@@47))
)))
(assert (forall ((Heap@@21 T@U) (diz@@48 T@U) ) (!  (=> (and (= (type Heap@@21) (MapType0Type RefType)) (= (type diz@@48) RefType)) (dummyFunction (int_2_U (|History__hist_get_x#triggerStateless| diz@@48))))
 :qid |stdinbpl.400:15|
 :skolemid |38|
 :pattern ( (|History__hist_get_x'| Heap@@21 diz@@48))
)))
(assert (forall ((Heap@@22 T@U) (diz@@49 T@U) ) (!  (=> (and (= (type Heap@@22) (MapType0Type RefType)) (= (type diz@@49) RefType)) (|History__inv#everUsed| (History__inv diz@@49)))
 :qid |stdinbpl.487:15|
 :skolemid |46|
 :pattern ( (|History__inv#trigger| Heap@@22 (History__inv diz@@49)))
)))
(assert (forall ((Heap@@23 T@U) (diz@@50 T@U) ) (!  (=> (and (= (type Heap@@23) (MapType0Type RefType)) (= (type diz@@50) RefType)) (|SubjectLock__inv#everUsed| (SubjectLock__inv diz@@50)))
 :qid |stdinbpl.620:15|
 :skolemid |64|
 :pattern ( (|SubjectLock__inv#trigger| Heap@@23 (SubjectLock__inv diz@@50)))
)))
(assert (forall ((Heap@@24 T@U) (diz@@51 T@U) ) (!  (=> (and (= (type Heap@@24) (MapType0Type RefType)) (= (type diz@@51) RefType)) (|SubjectLock__valid#everUsed| (SubjectLock__valid diz@@51)))
 :qid |stdinbpl.683:15|
 :skolemid |70|
 :pattern ( (|SubjectLock__valid#trigger| Heap@@24 (SubjectLock__valid diz@@51)))
)))
(assert (forall ((Heap@@25 T@U) (diz@@52 T@U) ) (!  (=> (and (= (type Heap@@25) (MapType0Type RefType)) (= (type diz@@52) RefType)) (|Thread__is_a_Thread#everUsed| (Thread__is_a_Thread diz@@52)))
 :qid |stdinbpl.753:15|
 :skolemid |82|
 :pattern ( (|Thread__is_a_Thread#trigger| Heap@@25 (Thread__is_a_Thread diz@@52)))
)))
(assert (forall ((Heap@@26 T@U) (diz@@53 T@U) ) (!  (=> (and (= (type Heap@@26) (MapType0Type RefType)) (= (type diz@@53) RefType)) (|Thread__instance_of_Thread#everUsed| (Thread__instance_of_Thread diz@@53)))
 :qid |stdinbpl.788:15|
 :skolemid |88|
 :pattern ( (|Thread__instance_of_Thread#trigger| Heap@@26 (Thread__instance_of_Thread diz@@53)))
)))
(assert (forall ((Heap@@27 T@U) (diz@@54 T@U) ) (!  (=> (and (= (type Heap@@27) (MapType0Type RefType)) (= (type diz@@54) RefType)) (|Worker__is_a_Worker#everUsed| (Worker__is_a_Worker diz@@54)))
 :qid |stdinbpl.1061:15|
 :skolemid |130|
 :pattern ( (|Worker__is_a_Worker#trigger| Heap@@27 (Worker__is_a_Worker diz@@54)))
)))
(assert (forall ((Heap@@28 T@U) (diz@@55 T@U) ) (!  (=> (and (= (type Heap@@28) (MapType0Type RefType)) (= (type diz@@55) RefType)) (|Worker__instance_of_Worker#everUsed| (Worker__instance_of_Worker diz@@55)))
 :qid |stdinbpl.1096:15|
 :skolemid |136|
 :pattern ( (|Worker__instance_of_Worker#trigger| Heap@@28 (Worker__instance_of_Worker diz@@55)))
)))
(assert (forall ((Heap@@29 T@U) (diz@@56 T@U) ) (!  (=> (and (= (type Heap@@29) (MapType0Type RefType)) (= (type diz@@56) RefType)) (|Worker__is_a_Thread#everUsed| (Worker__is_a_Thread diz@@56)))
 :qid |stdinbpl.1131:15|
 :skolemid |142|
 :pattern ( (|Worker__is_a_Thread#trigger| Heap@@29 (Worker__is_a_Thread diz@@56)))
)))
(assert (forall ((Heap@@30 T@U) (diz@@57 T@U) ) (!  (=> (and (= (type Heap@@30) (MapType0Type RefType)) (= (type diz@@57) RefType)) (|Worker__instance_of_Thread#everUsed| (Worker__instance_of_Thread diz@@57)))
 :qid |stdinbpl.1166:15|
 :skolemid |148|
 :pattern ( (|Worker__instance_of_Thread#trigger| Heap@@30 (Worker__instance_of_Thread diz@@57)))
)))
(assert (forall ((arg0@@54 T@U) (arg1@@28 Real) (arg2@@6 T@U) ) (! (= (type (|History__hist_do_incr#sm| arg0@@54 arg1@@28 arg2@@6)) (FieldType PredicateType_History__hist_do_incrType (MapType1Type RefType boolType)))
 :qid |funType:History__hist_do_incr#sm|
 :pattern ( (|History__hist_do_incr#sm| arg0@@54 arg1@@28 arg2@@6))
)))
(assert (forall ((diz@@58 T@U) (frac@@5 Real) (proc@@5 T@U) ) (!  (=> (and (= (type diz@@58) RefType) (= (type proc@@5) ProcessDomainTypeType)) (= (PredicateMaskField (History__hist_do_incr diz@@58 frac@@5 proc@@5)) (|History__hist_do_incr#sm| diz@@58 frac@@5 proc@@5)))
 :qid |stdinbpl.527:15|
 :skolemid |47|
 :pattern ( (PredicateMaskField (History__hist_do_incr diz@@58 frac@@5 proc@@5)))
)))
(assert (forall ((arg0@@55 T@U) (arg1@@29 Real) (arg2@@7 T@U) ) (! (= (type (|History__hist_idle#sm| arg0@@55 arg1@@29 arg2@@7)) (FieldType PredicateType_History__hist_idleType (MapType1Type RefType boolType)))
 :qid |funType:History__hist_idle#sm|
 :pattern ( (|History__hist_idle#sm| arg0@@55 arg1@@29 arg2@@7))
)))
(assert (forall ((diz@@59 T@U) (frac@@6 Real) (proc@@6 T@U) ) (!  (=> (and (= (type diz@@59) RefType) (= (type proc@@6) ProcessDomainTypeType)) (= (PredicateMaskField (History__hist_idle diz@@59 frac@@6 proc@@6)) (|History__hist_idle#sm| diz@@59 frac@@6 proc@@6)))
 :qid |stdinbpl.562:15|
 :skolemid |53|
 :pattern ( (PredicateMaskField (History__hist_idle diz@@59 frac@@6 proc@@6)))
)))
(assert (forall ((arg0@@56 T@U) (arg1@@30 Real) (arg2@@8 Int) ) (! (= (type (|SubjectLock__locked#sm| arg0@@56 arg1@@30 arg2@@8)) (FieldType PredicateType_SubjectLock__lockedType (MapType1Type RefType boolType)))
 :qid |funType:SubjectLock__locked#sm|
 :pattern ( (|SubjectLock__locked#sm| arg0@@56 arg1@@30 arg2@@8))
)))
(assert (forall ((diz@@60 T@U) (p_1@@32 Real) (count@@2 Int) ) (!  (=> (= (type diz@@60) RefType) (= (PredicateMaskField (SubjectLock__locked diz@@60 p_1@@32 count@@2)) (|SubjectLock__locked#sm| diz@@60 p_1@@32 count@@2)))
 :qid |stdinbpl.695:15|
 :skolemid |71|
 :pattern ( (PredicateMaskField (SubjectLock__locked diz@@60 p_1@@32 count@@2)))
)))
(assert (forall ((Heap@@31 T@U) (ExhaleHeap@@1 T@U) (Mask@@2 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@31) (MapType0Type RefType)) (= (type ExhaleHeap@@1) (MapType0Type RefType))) (= (type Mask@@2) (MapType1Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@31 ExhaleHeap@@1 Mask@@2)) (U_2_bool (MapType0Select Heap@@31 o_1 $allocated))) (U_2_bool (MapType0Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.73:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@31 ExhaleHeap@@1 Mask@@2) (MapType0Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert (forall ((Heap@@32 T@U) (diz@@61 T@U) ) (!  (=> (and (= (type Heap@@32) (MapType0Type RefType)) (= (type diz@@61) RefType)) (and (= (History__free_get_x Heap@@32 diz@@61) (|History__free_get_x'| Heap@@32 diz@@61)) (dummyFunction (int_2_U (|History__free_get_x#triggerStateless| diz@@61)))))
 :qid |stdinbpl.328:15|
 :skolemid |33|
 :pattern ( (History__free_get_x Heap@@32 diz@@61))
)))
(assert (forall ((Heap@@33 T@U) (diz@@62 T@U) ) (!  (=> (and (= (type Heap@@33) (MapType0Type RefType)) (= (type diz@@62) RefType)) (and (= (History__hist_get_x Heap@@33 diz@@62) (|History__hist_get_x'| Heap@@33 diz@@62)) (dummyFunction (int_2_U (|History__hist_get_x#triggerStateless| diz@@62)))))
 :qid |stdinbpl.396:15|
 :skolemid |37|
 :pattern ( (History__hist_get_x Heap@@33 diz@@62))
)))
(assert (forall ((diz@@63 T@U) (frac@@7 Real) (proc@@7 T@U) (diz2 T@U) (frac2 Real) (proc2 T@U) ) (!  (=> (and (and (and (and (= (type diz@@63) RefType) (= (type proc@@7) ProcessDomainTypeType)) (= (type diz2) RefType)) (= (type proc2) ProcessDomainTypeType)) (= (History__hist_do_incr diz@@63 frac@@7 proc@@7) (History__hist_do_incr diz2 frac2 proc2))) (and (= diz@@63 diz2) (and (= frac@@7 frac2) (= proc@@7 proc2))))
 :qid |stdinbpl.541:15|
 :skolemid |50|
 :pattern ( (History__hist_do_incr diz@@63 frac@@7 proc@@7) (History__hist_do_incr diz2 frac2 proc2))
)))
(assert (forall ((diz@@64 T@U) (frac@@8 Real) (proc@@8 T@U) (diz2@@0 T@U) (frac2@@0 Real) (proc2@@0 T@U) ) (!  (=> (and (and (and (and (= (type diz@@64) RefType) (= (type proc@@8) ProcessDomainTypeType)) (= (type diz2@@0) RefType)) (= (type proc2@@0) ProcessDomainTypeType)) (= (|History__hist_do_incr#sm| diz@@64 frac@@8 proc@@8) (|History__hist_do_incr#sm| diz2@@0 frac2@@0 proc2@@0))) (and (= diz@@64 diz2@@0) (and (= frac@@8 frac2@@0) (= proc@@8 proc2@@0))))
 :qid |stdinbpl.545:15|
 :skolemid |51|
 :pattern ( (|History__hist_do_incr#sm| diz@@64 frac@@8 proc@@8) (|History__hist_do_incr#sm| diz2@@0 frac2@@0 proc2@@0))
)))
(assert (forall ((diz@@65 T@U) (frac@@9 Real) (proc@@9 T@U) (diz2@@1 T@U) (frac2@@1 Real) (proc2@@1 T@U) ) (!  (=> (and (and (and (and (= (type diz@@65) RefType) (= (type proc@@9) ProcessDomainTypeType)) (= (type diz2@@1) RefType)) (= (type proc2@@1) ProcessDomainTypeType)) (= (History__hist_idle diz@@65 frac@@9 proc@@9) (History__hist_idle diz2@@1 frac2@@1 proc2@@1))) (and (= diz@@65 diz2@@1) (and (= frac@@9 frac2@@1) (= proc@@9 proc2@@1))))
 :qid |stdinbpl.576:15|
 :skolemid |56|
 :pattern ( (History__hist_idle diz@@65 frac@@9 proc@@9) (History__hist_idle diz2@@1 frac2@@1 proc2@@1))
)))
(assert (forall ((diz@@66 T@U) (frac@@10 Real) (proc@@10 T@U) (diz2@@2 T@U) (frac2@@2 Real) (proc2@@2 T@U) ) (!  (=> (and (and (and (and (= (type diz@@66) RefType) (= (type proc@@10) ProcessDomainTypeType)) (= (type diz2@@2) RefType)) (= (type proc2@@2) ProcessDomainTypeType)) (= (|History__hist_idle#sm| diz@@66 frac@@10 proc@@10) (|History__hist_idle#sm| diz2@@2 frac2@@2 proc2@@2))) (and (= diz@@66 diz2@@2) (and (= frac@@10 frac2@@2) (= proc@@10 proc2@@2))))
 :qid |stdinbpl.580:15|
 :skolemid |57|
 :pattern ( (|History__hist_idle#sm| diz@@66 frac@@10 proc@@10) (|History__hist_idle#sm| diz2@@2 frac2@@2 proc2@@2))
)))
(assert (forall ((diz@@67 T@U) (p_1@@33 Real) (count@@3 Int) (diz2@@3 T@U) (p2_1 Real) (count2 Int) ) (!  (=> (and (and (= (type diz@@67) RefType) (= (type diz2@@3) RefType)) (= (SubjectLock__locked diz@@67 p_1@@33 count@@3) (SubjectLock__locked diz2@@3 p2_1 count2))) (and (= diz@@67 diz2@@3) (and (= p_1@@33 p2_1) (= count@@3 count2))))
 :qid |stdinbpl.709:15|
 :skolemid |74|
 :pattern ( (SubjectLock__locked diz@@67 p_1@@33 count@@3) (SubjectLock__locked diz2@@3 p2_1 count2))
)))
(assert (forall ((diz@@68 T@U) (p_1@@34 Real) (count@@4 Int) (diz2@@4 T@U) (p2_1@@0 Real) (count2@@0 Int) ) (!  (=> (and (and (= (type diz@@68) RefType) (= (type diz2@@4) RefType)) (= (|SubjectLock__locked#sm| diz@@68 p_1@@34 count@@4) (|SubjectLock__locked#sm| diz2@@4 p2_1@@0 count2@@0))) (and (= diz@@68 diz2@@4) (and (= p_1@@34 p2_1@@0) (= count@@4 count2@@0))))
 :qid |stdinbpl.713:15|
 :skolemid |75|
 :pattern ( (|SubjectLock__locked#sm| diz@@68 p_1@@34 count@@4) (|SubjectLock__locked#sm| diz2@@4 p2_1@@0 count2@@0))
)))
(assert (forall ((diz@@69 T@U) (p_1@@35 Real) (diz2@@5 T@U) (p2_1@@1 Real) ) (!  (=> (and (and (= (type diz@@69) RefType) (= (type diz2@@5) RefType)) (= (Thread__joinToken diz@@69 p_1@@35) (Thread__joinToken diz2@@5 p2_1@@1))) (and (= diz@@69 diz2@@5) (= p_1@@35 p2_1@@1)))
 :qid |stdinbpl.814:15|
 :skolemid |92|
 :pattern ( (Thread__joinToken diz@@69 p_1@@35) (Thread__joinToken diz2@@5 p2_1@@1))
)))
(assert (forall ((arg0@@57 T@U) (arg1@@31 Real) ) (! (= (type (|Thread__joinToken#sm| arg0@@57 arg1@@31)) (FieldType PredicateType_Thread__joinTokenType (MapType1Type RefType boolType)))
 :qid |funType:Thread__joinToken#sm|
 :pattern ( (|Thread__joinToken#sm| arg0@@57 arg1@@31))
)))
(assert (forall ((diz@@70 T@U) (p_1@@36 Real) (diz2@@6 T@U) (p2_1@@2 Real) ) (!  (=> (and (and (= (type diz@@70) RefType) (= (type diz2@@6) RefType)) (= (|Thread__joinToken#sm| diz@@70 p_1@@36) (|Thread__joinToken#sm| diz2@@6 p2_1@@2))) (and (= diz@@70 diz2@@6) (= p_1@@36 p2_1@@2)))
 :qid |stdinbpl.818:15|
 :skolemid |93|
 :pattern ( (|Thread__joinToken#sm| diz@@70 p_1@@36) (|Thread__joinToken#sm| diz2@@6 p2_1@@2))
)))
(assert (forall ((diz@@71 T@U) (p_1@@37 Real) (diz2@@7 T@U) (p2_1@@3 Real) ) (!  (=> (and (and (= (type diz@@71) RefType) (= (type diz2@@7) RefType)) (= (Thread__preFork diz@@71 p_1@@37) (Thread__preFork diz2@@7 p2_1@@3))) (and (= diz@@71 diz2@@7) (= p_1@@37 p2_1@@3)))
 :qid |stdinbpl.849:15|
 :skolemid |98|
 :pattern ( (Thread__preFork diz@@71 p_1@@37) (Thread__preFork diz2@@7 p2_1@@3))
)))
(assert (forall ((arg0@@58 T@U) (arg1@@32 Real) ) (! (= (type (|Thread__preFork#sm| arg0@@58 arg1@@32)) (FieldType PredicateType_Thread__preForkType (MapType1Type RefType boolType)))
 :qid |funType:Thread__preFork#sm|
 :pattern ( (|Thread__preFork#sm| arg0@@58 arg1@@32))
)))
(assert (forall ((diz@@72 T@U) (p_1@@38 Real) (diz2@@8 T@U) (p2_1@@4 Real) ) (!  (=> (and (and (= (type diz@@72) RefType) (= (type diz2@@8) RefType)) (= (|Thread__preFork#sm| diz@@72 p_1@@38) (|Thread__preFork#sm| diz2@@8 p2_1@@4))) (and (= diz@@72 diz2@@8) (= p_1@@38 p2_1@@4)))
 :qid |stdinbpl.853:15|
 :skolemid |99|
 :pattern ( (|Thread__preFork#sm| diz@@72 p_1@@38) (|Thread__preFork#sm| diz2@@8 p2_1@@4))
)))
(assert (forall ((diz@@73 T@U) (p_1@@39 Real) (diz2@@9 T@U) (p2_1@@5 Real) ) (!  (=> (and (and (= (type diz@@73) RefType) (= (type diz2@@9) RefType)) (= (Thread__postJoin diz@@73 p_1@@39) (Thread__postJoin diz2@@9 p2_1@@5))) (and (= diz@@73 diz2@@9) (= p_1@@39 p2_1@@5)))
 :qid |stdinbpl.884:15|
 :skolemid |104|
 :pattern ( (Thread__postJoin diz@@73 p_1@@39) (Thread__postJoin diz2@@9 p2_1@@5))
)))
(assert (forall ((arg0@@59 T@U) (arg1@@33 Real) ) (! (= (type (|Thread__postJoin#sm| arg0@@59 arg1@@33)) (FieldType PredicateType_Thread__postJoinType (MapType1Type RefType boolType)))
 :qid |funType:Thread__postJoin#sm|
 :pattern ( (|Thread__postJoin#sm| arg0@@59 arg1@@33))
)))
(assert (forall ((diz@@74 T@U) (p_1@@40 Real) (diz2@@10 T@U) (p2_1@@6 Real) ) (!  (=> (and (and (= (type diz@@74) RefType) (= (type diz2@@10) RefType)) (= (|Thread__postJoin#sm| diz@@74 p_1@@40) (|Thread__postJoin#sm| diz2@@10 p2_1@@6))) (and (= diz@@74 diz2@@10) (= p_1@@40 p2_1@@6)))
 :qid |stdinbpl.888:15|
 :skolemid |105|
 :pattern ( (|Thread__postJoin#sm| diz@@74 p_1@@40) (|Thread__postJoin#sm| diz2@@10 p2_1@@6))
)))
(assert (forall ((diz@@75 T@U) (p_1@@41 Real) (diz2@@11 T@U) (p2_1@@7 Real) ) (!  (=> (and (and (= (type diz@@75) RefType) (= (type diz2@@11) RefType)) (= (Thread__joinToken_at_Thread diz@@75 p_1@@41) (Thread__joinToken_at_Thread diz2@@11 p2_1@@7))) (and (= diz@@75 diz2@@11) (= p_1@@41 p2_1@@7)))
 :qid |stdinbpl.919:15|
 :skolemid |110|
 :pattern ( (Thread__joinToken_at_Thread diz@@75 p_1@@41) (Thread__joinToken_at_Thread diz2@@11 p2_1@@7))
)))
(assert (forall ((arg0@@60 T@U) (arg1@@34 Real) ) (! (= (type (|Thread__joinToken_at_Thread#sm| arg0@@60 arg1@@34)) (FieldType PredicateType_Thread__joinToken_at_ThreadType (MapType1Type RefType boolType)))
 :qid |funType:Thread__joinToken_at_Thread#sm|
 :pattern ( (|Thread__joinToken_at_Thread#sm| arg0@@60 arg1@@34))
)))
(assert (forall ((diz@@76 T@U) (p_1@@42 Real) (diz2@@12 T@U) (p2_1@@8 Real) ) (!  (=> (and (and (= (type diz@@76) RefType) (= (type diz2@@12) RefType)) (= (|Thread__joinToken_at_Thread#sm| diz@@76 p_1@@42) (|Thread__joinToken_at_Thread#sm| diz2@@12 p2_1@@8))) (and (= diz@@76 diz2@@12) (= p_1@@42 p2_1@@8)))
 :qid |stdinbpl.923:15|
 :skolemid |111|
 :pattern ( (|Thread__joinToken_at_Thread#sm| diz@@76 p_1@@42) (|Thread__joinToken_at_Thread#sm| diz2@@12 p2_1@@8))
)))
(assert (forall ((diz@@77 T@U) (p_1@@43 Real) (diz2@@13 T@U) (p2_1@@9 Real) ) (!  (=> (and (and (= (type diz@@77) RefType) (= (type diz2@@13) RefType)) (= (Thread__preFork_at_Thread diz@@77 p_1@@43) (Thread__preFork_at_Thread diz2@@13 p2_1@@9))) (and (= diz@@77 diz2@@13) (= p_1@@43 p2_1@@9)))
 :qid |stdinbpl.954:15|
 :skolemid |116|
 :pattern ( (Thread__preFork_at_Thread diz@@77 p_1@@43) (Thread__preFork_at_Thread diz2@@13 p2_1@@9))
)))
(assert (forall ((arg0@@61 T@U) (arg1@@35 Real) ) (! (= (type (|Thread__preFork_at_Thread#sm| arg0@@61 arg1@@35)) (FieldType PredicateType_Thread__preFork_at_ThreadType (MapType1Type RefType boolType)))
 :qid |funType:Thread__preFork_at_Thread#sm|
 :pattern ( (|Thread__preFork_at_Thread#sm| arg0@@61 arg1@@35))
)))
(assert (forall ((diz@@78 T@U) (p_1@@44 Real) (diz2@@14 T@U) (p2_1@@10 Real) ) (!  (=> (and (and (= (type diz@@78) RefType) (= (type diz2@@14) RefType)) (= (|Thread__preFork_at_Thread#sm| diz@@78 p_1@@44) (|Thread__preFork_at_Thread#sm| diz2@@14 p2_1@@10))) (and (= diz@@78 diz2@@14) (= p_1@@44 p2_1@@10)))
 :qid |stdinbpl.958:15|
 :skolemid |117|
 :pattern ( (|Thread__preFork_at_Thread#sm| diz@@78 p_1@@44) (|Thread__preFork_at_Thread#sm| diz2@@14 p2_1@@10))
)))
(assert (forall ((diz@@79 T@U) (p_1@@45 Real) (diz2@@15 T@U) (p2_1@@11 Real) ) (!  (=> (and (and (= (type diz@@79) RefType) (= (type diz2@@15) RefType)) (= (Thread__postJoin_at_Thread diz@@79 p_1@@45) (Thread__postJoin_at_Thread diz2@@15 p2_1@@11))) (and (= diz@@79 diz2@@15) (= p_1@@45 p2_1@@11)))
 :qid |stdinbpl.1003:15|
 :skolemid |122|
 :pattern ( (Thread__postJoin_at_Thread diz@@79 p_1@@45) (Thread__postJoin_at_Thread diz2@@15 p2_1@@11))
)))
(assert (forall ((arg0@@62 T@U) (arg1@@36 Real) ) (! (= (type (|Thread__postJoin_at_Thread#sm| arg0@@62 arg1@@36)) (FieldType PredicateType_Thread__postJoin_at_ThreadType (MapType1Type RefType boolType)))
 :qid |funType:Thread__postJoin_at_Thread#sm|
 :pattern ( (|Thread__postJoin_at_Thread#sm| arg0@@62 arg1@@36))
)))
(assert (forall ((diz@@80 T@U) (p_1@@46 Real) (diz2@@16 T@U) (p2_1@@12 Real) ) (!  (=> (and (and (= (type diz@@80) RefType) (= (type diz2@@16) RefType)) (= (|Thread__postJoin_at_Thread#sm| diz@@80 p_1@@46) (|Thread__postJoin_at_Thread#sm| diz2@@16 p2_1@@12))) (and (= diz@@80 diz2@@16) (= p_1@@46 p2_1@@12)))
 :qid |stdinbpl.1007:15|
 :skolemid |123|
 :pattern ( (|Thread__postJoin_at_Thread#sm| diz@@80 p_1@@46) (|Thread__postJoin_at_Thread#sm| diz2@@16 p2_1@@12))
)))
(assert (forall ((diz@@81 T@U) (p_1@@47 Real) (diz2@@17 T@U) (p2_1@@13 Real) ) (!  (=> (and (and (= (type diz@@81) RefType) (= (type diz2@@17) RefType)) (= (Worker__joinToken diz@@81 p_1@@47) (Worker__joinToken diz2@@17 p2_1@@13))) (and (= diz@@81 diz2@@17) (= p_1@@47 p2_1@@13)))
 :qid |stdinbpl.1192:15|
 :skolemid |152|
 :pattern ( (Worker__joinToken diz@@81 p_1@@47) (Worker__joinToken diz2@@17 p2_1@@13))
)))
(assert (forall ((arg0@@63 T@U) (arg1@@37 Real) ) (! (= (type (|Worker__joinToken#sm| arg0@@63 arg1@@37)) (FieldType PredicateType_Worker__joinTokenType (MapType1Type RefType boolType)))
 :qid |funType:Worker__joinToken#sm|
 :pattern ( (|Worker__joinToken#sm| arg0@@63 arg1@@37))
)))
(assert (forall ((diz@@82 T@U) (p_1@@48 Real) (diz2@@18 T@U) (p2_1@@14 Real) ) (!  (=> (and (and (= (type diz@@82) RefType) (= (type diz2@@18) RefType)) (= (|Worker__joinToken#sm| diz@@82 p_1@@48) (|Worker__joinToken#sm| diz2@@18 p2_1@@14))) (and (= diz@@82 diz2@@18) (= p_1@@48 p2_1@@14)))
 :qid |stdinbpl.1196:15|
 :skolemid |153|
 :pattern ( (|Worker__joinToken#sm| diz@@82 p_1@@48) (|Worker__joinToken#sm| diz2@@18 p2_1@@14))
)))
(assert (forall ((diz@@83 T@U) (p_1@@49 Real) (diz2@@19 T@U) (p2_1@@15 Real) ) (!  (=> (and (and (= (type diz@@83) RefType) (= (type diz2@@19) RefType)) (= (Worker__joinToken_at_Worker diz@@83 p_1@@49) (Worker__joinToken_at_Worker diz2@@19 p2_1@@15))) (and (= diz@@83 diz2@@19) (= p_1@@49 p2_1@@15)))
 :qid |stdinbpl.1227:15|
 :skolemid |158|
 :pattern ( (Worker__joinToken_at_Worker diz@@83 p_1@@49) (Worker__joinToken_at_Worker diz2@@19 p2_1@@15))
)))
(assert (forall ((arg0@@64 T@U) (arg1@@38 Real) ) (! (= (type (|Worker__joinToken_at_Worker#sm| arg0@@64 arg1@@38)) (FieldType PredicateType_Worker__joinToken_at_WorkerType (MapType1Type RefType boolType)))
 :qid |funType:Worker__joinToken_at_Worker#sm|
 :pattern ( (|Worker__joinToken_at_Worker#sm| arg0@@64 arg1@@38))
)))
(assert (forall ((diz@@84 T@U) (p_1@@50 Real) (diz2@@20 T@U) (p2_1@@16 Real) ) (!  (=> (and (and (= (type diz@@84) RefType) (= (type diz2@@20) RefType)) (= (|Worker__joinToken_at_Worker#sm| diz@@84 p_1@@50) (|Worker__joinToken_at_Worker#sm| diz2@@20 p2_1@@16))) (and (= diz@@84 diz2@@20) (= p_1@@50 p2_1@@16)))
 :qid |stdinbpl.1231:15|
 :skolemid |159|
 :pattern ( (|Worker__joinToken_at_Worker#sm| diz@@84 p_1@@50) (|Worker__joinToken_at_Worker#sm| diz2@@20 p2_1@@16))
)))
(assert (forall ((diz@@85 T@U) (p_1@@51 Real) (diz2@@21 T@U) (p2_1@@17 Real) ) (!  (=> (and (and (= (type diz@@85) RefType) (= (type diz2@@21) RefType)) (= (Worker__preFork diz@@85 p_1@@51) (Worker__preFork diz2@@21 p2_1@@17))) (and (= diz@@85 diz2@@21) (= p_1@@51 p2_1@@17)))
 :qid |stdinbpl.1280:15|
 :skolemid |164|
 :pattern ( (Worker__preFork diz@@85 p_1@@51) (Worker__preFork diz2@@21 p2_1@@17))
)))
(assert (forall ((arg0@@65 T@U) (arg1@@39 Real) ) (! (= (type (|Worker__preFork#sm| arg0@@65 arg1@@39)) (FieldType PredicateType_Worker__preForkType (MapType1Type RefType boolType)))
 :qid |funType:Worker__preFork#sm|
 :pattern ( (|Worker__preFork#sm| arg0@@65 arg1@@39))
)))
(assert (forall ((diz@@86 T@U) (p_1@@52 Real) (diz2@@22 T@U) (p2_1@@18 Real) ) (!  (=> (and (and (= (type diz@@86) RefType) (= (type diz2@@22) RefType)) (= (|Worker__preFork#sm| diz@@86 p_1@@52) (|Worker__preFork#sm| diz2@@22 p2_1@@18))) (and (= diz@@86 diz2@@22) (= p_1@@52 p2_1@@18)))
 :qid |stdinbpl.1284:15|
 :skolemid |165|
 :pattern ( (|Worker__preFork#sm| diz@@86 p_1@@52) (|Worker__preFork#sm| diz2@@22 p2_1@@18))
)))
(assert (forall ((diz@@87 T@U) (p_1@@53 Real) (diz2@@23 T@U) (p2_1@@19 Real) ) (!  (=> (and (and (= (type diz@@87) RefType) (= (type diz2@@23) RefType)) (= (Worker__postJoin diz@@87 p_1@@53) (Worker__postJoin diz2@@23 p2_1@@19))) (and (= diz@@87 diz2@@23) (= p_1@@53 p2_1@@19)))
 :qid |stdinbpl.1315:15|
 :skolemid |170|
 :pattern ( (Worker__postJoin diz@@87 p_1@@53) (Worker__postJoin diz2@@23 p2_1@@19))
)))
(assert (forall ((arg0@@66 T@U) (arg1@@40 Real) ) (! (= (type (|Worker__postJoin#sm| arg0@@66 arg1@@40)) (FieldType PredicateType_Worker__postJoinType (MapType1Type RefType boolType)))
 :qid |funType:Worker__postJoin#sm|
 :pattern ( (|Worker__postJoin#sm| arg0@@66 arg1@@40))
)))
(assert (forall ((diz@@88 T@U) (p_1@@54 Real) (diz2@@24 T@U) (p2_1@@20 Real) ) (!  (=> (and (and (= (type diz@@88) RefType) (= (type diz2@@24) RefType)) (= (|Worker__postJoin#sm| diz@@88 p_1@@54) (|Worker__postJoin#sm| diz2@@24 p2_1@@20))) (and (= diz@@88 diz2@@24) (= p_1@@54 p2_1@@20)))
 :qid |stdinbpl.1319:15|
 :skolemid |171|
 :pattern ( (|Worker__postJoin#sm| diz@@88 p_1@@54) (|Worker__postJoin#sm| diz2@@24 p2_1@@20))
)))
(assert (forall ((diz@@89 T@U) (p_1@@55 Real) (diz2@@25 T@U) (p2_1@@21 Real) ) (!  (=> (and (and (= (type diz@@89) RefType) (= (type diz2@@25) RefType)) (= (Worker__joinToken_at_Thread diz@@89 p_1@@55) (Worker__joinToken_at_Thread diz2@@25 p2_1@@21))) (and (= diz@@89 diz2@@25) (= p_1@@55 p2_1@@21)))
 :qid |stdinbpl.1350:15|
 :skolemid |176|
 :pattern ( (Worker__joinToken_at_Thread diz@@89 p_1@@55) (Worker__joinToken_at_Thread diz2@@25 p2_1@@21))
)))
(assert (forall ((arg0@@67 T@U) (arg1@@41 Real) ) (! (= (type (|Worker__joinToken_at_Thread#sm| arg0@@67 arg1@@41)) (FieldType PredicateType_Worker__joinToken_at_ThreadType (MapType1Type RefType boolType)))
 :qid |funType:Worker__joinToken_at_Thread#sm|
 :pattern ( (|Worker__joinToken_at_Thread#sm| arg0@@67 arg1@@41))
)))
(assert (forall ((diz@@90 T@U) (p_1@@56 Real) (diz2@@26 T@U) (p2_1@@22 Real) ) (!  (=> (and (and (= (type diz@@90) RefType) (= (type diz2@@26) RefType)) (= (|Worker__joinToken_at_Thread#sm| diz@@90 p_1@@56) (|Worker__joinToken_at_Thread#sm| diz2@@26 p2_1@@22))) (and (= diz@@90 diz2@@26) (= p_1@@56 p2_1@@22)))
 :qid |stdinbpl.1354:15|
 :skolemid |177|
 :pattern ( (|Worker__joinToken_at_Thread#sm| diz@@90 p_1@@56) (|Worker__joinToken_at_Thread#sm| diz2@@26 p2_1@@22))
)))
(assert (forall ((diz@@91 T@U) (p_1@@57 Real) (diz2@@27 T@U) (p2_1@@23 Real) ) (!  (=> (and (and (= (type diz@@91) RefType) (= (type diz2@@27) RefType)) (= (Worker__preFork_at_Thread diz@@91 p_1@@57) (Worker__preFork_at_Thread diz2@@27 p2_1@@23))) (and (= diz@@91 diz2@@27) (= p_1@@57 p2_1@@23)))
 :qid |stdinbpl.1385:15|
 :skolemid |182|
 :pattern ( (Worker__preFork_at_Thread diz@@91 p_1@@57) (Worker__preFork_at_Thread diz2@@27 p2_1@@23))
)))
(assert (forall ((arg0@@68 T@U) (arg1@@42 Real) ) (! (= (type (|Worker__preFork_at_Thread#sm| arg0@@68 arg1@@42)) (FieldType PredicateType_Worker__preFork_at_ThreadType (MapType1Type RefType boolType)))
 :qid |funType:Worker__preFork_at_Thread#sm|
 :pattern ( (|Worker__preFork_at_Thread#sm| arg0@@68 arg1@@42))
)))
(assert (forall ((diz@@92 T@U) (p_1@@58 Real) (diz2@@28 T@U) (p2_1@@24 Real) ) (!  (=> (and (and (= (type diz@@92) RefType) (= (type diz2@@28) RefType)) (= (|Worker__preFork_at_Thread#sm| diz@@92 p_1@@58) (|Worker__preFork_at_Thread#sm| diz2@@28 p2_1@@24))) (and (= diz@@92 diz2@@28) (= p_1@@58 p2_1@@24)))
 :qid |stdinbpl.1389:15|
 :skolemid |183|
 :pattern ( (|Worker__preFork_at_Thread#sm| diz@@92 p_1@@58) (|Worker__preFork_at_Thread#sm| diz2@@28 p2_1@@24))
)))
(assert (forall ((diz@@93 T@U) (p_1@@59 Real) (diz2@@29 T@U) (p2_1@@25 Real) ) (!  (=> (and (and (= (type diz@@93) RefType) (= (type diz2@@29) RefType)) (= (Worker__postJoin_at_Thread diz@@93 p_1@@59) (Worker__postJoin_at_Thread diz2@@29 p2_1@@25))) (and (= diz@@93 diz2@@29) (= p_1@@59 p2_1@@25)))
 :qid |stdinbpl.1434:15|
 :skolemid |188|
 :pattern ( (Worker__postJoin_at_Thread diz@@93 p_1@@59) (Worker__postJoin_at_Thread diz2@@29 p2_1@@25))
)))
(assert (forall ((arg0@@69 T@U) (arg1@@43 Real) ) (! (= (type (|Worker__postJoin_at_Thread#sm| arg0@@69 arg1@@43)) (FieldType PredicateType_Worker__postJoin_at_ThreadType (MapType1Type RefType boolType)))
 :qid |funType:Worker__postJoin_at_Thread#sm|
 :pattern ( (|Worker__postJoin_at_Thread#sm| arg0@@69 arg1@@43))
)))
(assert (forall ((diz@@94 T@U) (p_1@@60 Real) (diz2@@30 T@U) (p2_1@@26 Real) ) (!  (=> (and (and (= (type diz@@94) RefType) (= (type diz2@@30) RefType)) (= (|Worker__postJoin_at_Thread#sm| diz@@94 p_1@@60) (|Worker__postJoin_at_Thread#sm| diz2@@30 p2_1@@26))) (and (= diz@@94 diz2@@30) (= p_1@@60 p2_1@@26)))
 :qid |stdinbpl.1438:15|
 :skolemid |189|
 :pattern ( (|Worker__postJoin_at_Thread#sm| diz@@94 p_1@@60) (|Worker__postJoin_at_Thread#sm| diz2@@30 p2_1@@26))
)))
(assert (forall ((diz@@95 T@U) (p_1@@61 Real) (diz2@@31 T@U) (p2_1@@27 Real) ) (!  (=> (and (and (= (type diz@@95) RefType) (= (type diz2@@31) RefType)) (= (Worker__preFork_at_Worker diz@@95 p_1@@61) (Worker__preFork_at_Worker diz2@@31 p2_1@@27))) (and (= diz@@95 diz2@@31) (= p_1@@61 p2_1@@27)))
 :qid |stdinbpl.1483:15|
 :skolemid |194|
 :pattern ( (Worker__preFork_at_Worker diz@@95 p_1@@61) (Worker__preFork_at_Worker diz2@@31 p2_1@@27))
)))
(assert (forall ((arg0@@70 T@U) (arg1@@44 Real) ) (! (= (type (|Worker__preFork_at_Worker#sm| arg0@@70 arg1@@44)) (FieldType PredicateType_Worker__preFork_at_WorkerType (MapType1Type RefType boolType)))
 :qid |funType:Worker__preFork_at_Worker#sm|
 :pattern ( (|Worker__preFork_at_Worker#sm| arg0@@70 arg1@@44))
)))
(assert (forall ((diz@@96 T@U) (p_1@@62 Real) (diz2@@32 T@U) (p2_1@@28 Real) ) (!  (=> (and (and (= (type diz@@96) RefType) (= (type diz2@@32) RefType)) (= (|Worker__preFork_at_Worker#sm| diz@@96 p_1@@62) (|Worker__preFork_at_Worker#sm| diz2@@32 p2_1@@28))) (and (= diz@@96 diz2@@32) (= p_1@@62 p2_1@@28)))
 :qid |stdinbpl.1487:15|
 :skolemid |195|
 :pattern ( (|Worker__preFork_at_Worker#sm| diz@@96 p_1@@62) (|Worker__preFork_at_Worker#sm| diz2@@32 p2_1@@28))
)))
(assert (forall ((diz@@97 T@U) (p_1@@63 Real) (diz2@@33 T@U) (p2_1@@29 Real) ) (!  (=> (and (and (= (type diz@@97) RefType) (= (type diz2@@33) RefType)) (= (Worker__postJoin_at_Worker diz@@97 p_1@@63) (Worker__postJoin_at_Worker diz2@@33 p2_1@@29))) (and (= diz@@97 diz2@@33) (= p_1@@63 p2_1@@29)))
 :qid |stdinbpl.1582:15|
 :skolemid |200|
 :pattern ( (Worker__postJoin_at_Worker diz@@97 p_1@@63) (Worker__postJoin_at_Worker diz2@@33 p2_1@@29))
)))
(assert (forall ((arg0@@71 T@U) (arg1@@45 Real) ) (! (= (type (|Worker__postJoin_at_Worker#sm| arg0@@71 arg1@@45)) (FieldType PredicateType_Worker__postJoin_at_WorkerType (MapType1Type RefType boolType)))
 :qid |funType:Worker__postJoin_at_Worker#sm|
 :pattern ( (|Worker__postJoin_at_Worker#sm| arg0@@71 arg1@@45))
)))
(assert (forall ((diz@@98 T@U) (p_1@@64 Real) (diz2@@34 T@U) (p2_1@@30 Real) ) (!  (=> (and (and (= (type diz@@98) RefType) (= (type diz2@@34) RefType)) (= (|Worker__postJoin_at_Worker#sm| diz@@98 p_1@@64) (|Worker__postJoin_at_Worker#sm| diz2@@34 p2_1@@30))) (and (= diz@@98 diz2@@34) (= p_1@@64 p2_1@@30)))
 :qid |stdinbpl.1586:15|
 :skolemid |201|
 :pattern ( (|Worker__postJoin_at_Worker#sm| diz@@98 p_1@@64) (|Worker__postJoin_at_Worker#sm| diz2@@34 p2_1@@30))
)))
(assert  (and (forall ((arg0@@72 Int) (arg1@@46 Int) ) (! (= (type (p_dual arg0@@72 arg1@@46)) ProcessDomainTypeType)
 :qid |funType:p_dual|
 :pattern ( (p_dual arg0@@72 arg1@@46))
)) (forall ((arg0@@73 T@U) (arg1@@47 T@U) ) (! (= (type (p_merge arg0@@73 arg1@@47)) ProcessDomainTypeType)
 :qid |funType:p_merge|
 :pattern ( (p_merge arg0@@73 arg1@@47))
))))
(assert (forall ((n_1@@0 Int) (m_1 Int) ) (! (= (p_merge (p_single n_1@@0) (p_single m_1)) (p_dual n_1@@0 m_1))
 :qid |stdinbpl.278:15|
 :skolemid |30|
 :pattern ( (p_dual n_1@@0 m_1))
)))
(assert (forall ((diz@@99 T@U) (diz2@@35 T@U) ) (!  (=> (and (and (= (type diz@@99) RefType) (= (type diz2@@35) RefType)) (= (History__inv diz@@99) (History__inv diz2@@35))) (= diz@@99 diz2@@35))
 :qid |stdinbpl.478:15|
 :skolemid |44|
 :pattern ( (History__inv diz@@99) (History__inv diz2@@35))
)))
(assert (forall ((arg0@@74 T@U) ) (! (= (type (|History__inv#sm| arg0@@74)) (FieldType PredicateType_History__invType (MapType1Type RefType boolType)))
 :qid |funType:History__inv#sm|
 :pattern ( (|History__inv#sm| arg0@@74))
)))
(assert (forall ((diz@@100 T@U) (diz2@@36 T@U) ) (!  (=> (and (and (= (type diz@@100) RefType) (= (type diz2@@36) RefType)) (= (|History__inv#sm| diz@@100) (|History__inv#sm| diz2@@36))) (= diz@@100 diz2@@36))
 :qid |stdinbpl.482:15|
 :skolemid |45|
 :pattern ( (|History__inv#sm| diz@@100) (|History__inv#sm| diz2@@36))
)))
(assert (forall ((diz@@101 T@U) (diz2@@37 T@U) ) (!  (=> (and (and (= (type diz@@101) RefType) (= (type diz2@@37) RefType)) (= (SubjectLock__inv diz@@101) (SubjectLock__inv diz2@@37))) (= diz@@101 diz2@@37))
 :qid |stdinbpl.611:15|
 :skolemid |62|
 :pattern ( (SubjectLock__inv diz@@101) (SubjectLock__inv diz2@@37))
)))
(assert (forall ((arg0@@75 T@U) ) (! (= (type (|SubjectLock__inv#sm| arg0@@75)) (FieldType PredicateType_SubjectLock__invType (MapType1Type RefType boolType)))
 :qid |funType:SubjectLock__inv#sm|
 :pattern ( (|SubjectLock__inv#sm| arg0@@75))
)))
(assert (forall ((diz@@102 T@U) (diz2@@38 T@U) ) (!  (=> (and (and (= (type diz@@102) RefType) (= (type diz2@@38) RefType)) (= (|SubjectLock__inv#sm| diz@@102) (|SubjectLock__inv#sm| diz2@@38))) (= diz@@102 diz2@@38))
 :qid |stdinbpl.615:15|
 :skolemid |63|
 :pattern ( (|SubjectLock__inv#sm| diz@@102) (|SubjectLock__inv#sm| diz2@@38))
)))
(assert (forall ((diz@@103 T@U) (diz2@@39 T@U) ) (!  (=> (and (and (= (type diz@@103) RefType) (= (type diz2@@39) RefType)) (= (SubjectLock__valid diz@@103) (SubjectLock__valid diz2@@39))) (= diz@@103 diz2@@39))
 :qid |stdinbpl.674:15|
 :skolemid |68|
 :pattern ( (SubjectLock__valid diz@@103) (SubjectLock__valid diz2@@39))
)))
(assert (forall ((arg0@@76 T@U) ) (! (= (type (|SubjectLock__valid#sm| arg0@@76)) (FieldType PredicateType_SubjectLock__validType (MapType1Type RefType boolType)))
 :qid |funType:SubjectLock__valid#sm|
 :pattern ( (|SubjectLock__valid#sm| arg0@@76))
)))
(assert (forall ((diz@@104 T@U) (diz2@@40 T@U) ) (!  (=> (and (and (= (type diz@@104) RefType) (= (type diz2@@40) RefType)) (= (|SubjectLock__valid#sm| diz@@104) (|SubjectLock__valid#sm| diz2@@40))) (= diz@@104 diz2@@40))
 :qid |stdinbpl.678:15|
 :skolemid |69|
 :pattern ( (|SubjectLock__valid#sm| diz@@104) (|SubjectLock__valid#sm| diz2@@40))
)))
(assert (forall ((diz@@105 T@U) (diz2@@41 T@U) ) (!  (=> (and (and (= (type diz@@105) RefType) (= (type diz2@@41) RefType)) (= (Thread__is_a_Thread diz@@105) (Thread__is_a_Thread diz2@@41))) (= diz@@105 diz2@@41))
 :qid |stdinbpl.744:15|
 :skolemid |80|
 :pattern ( (Thread__is_a_Thread diz@@105) (Thread__is_a_Thread diz2@@41))
)))
(assert (forall ((arg0@@77 T@U) ) (! (= (type (|Thread__is_a_Thread#sm| arg0@@77)) (FieldType PredicateType_Thread__is_a_ThreadType (MapType1Type RefType boolType)))
 :qid |funType:Thread__is_a_Thread#sm|
 :pattern ( (|Thread__is_a_Thread#sm| arg0@@77))
)))
(assert (forall ((diz@@106 T@U) (diz2@@42 T@U) ) (!  (=> (and (and (= (type diz@@106) RefType) (= (type diz2@@42) RefType)) (= (|Thread__is_a_Thread#sm| diz@@106) (|Thread__is_a_Thread#sm| diz2@@42))) (= diz@@106 diz2@@42))
 :qid |stdinbpl.748:15|
 :skolemid |81|
 :pattern ( (|Thread__is_a_Thread#sm| diz@@106) (|Thread__is_a_Thread#sm| diz2@@42))
)))
(assert (forall ((diz@@107 T@U) (diz2@@43 T@U) ) (!  (=> (and (and (= (type diz@@107) RefType) (= (type diz2@@43) RefType)) (= (Thread__instance_of_Thread diz@@107) (Thread__instance_of_Thread diz2@@43))) (= diz@@107 diz2@@43))
 :qid |stdinbpl.779:15|
 :skolemid |86|
 :pattern ( (Thread__instance_of_Thread diz@@107) (Thread__instance_of_Thread diz2@@43))
)))
(assert (forall ((arg0@@78 T@U) ) (! (= (type (|Thread__instance_of_Thread#sm| arg0@@78)) (FieldType PredicateType_Thread__instance_of_ThreadType (MapType1Type RefType boolType)))
 :qid |funType:Thread__instance_of_Thread#sm|
 :pattern ( (|Thread__instance_of_Thread#sm| arg0@@78))
)))
(assert (forall ((diz@@108 T@U) (diz2@@44 T@U) ) (!  (=> (and (and (= (type diz@@108) RefType) (= (type diz2@@44) RefType)) (= (|Thread__instance_of_Thread#sm| diz@@108) (|Thread__instance_of_Thread#sm| diz2@@44))) (= diz@@108 diz2@@44))
 :qid |stdinbpl.783:15|
 :skolemid |87|
 :pattern ( (|Thread__instance_of_Thread#sm| diz@@108) (|Thread__instance_of_Thread#sm| diz2@@44))
)))
(assert (forall ((diz@@109 T@U) (diz2@@45 T@U) ) (!  (=> (and (and (= (type diz@@109) RefType) (= (type diz2@@45) RefType)) (= (Worker__is_a_Worker diz@@109) (Worker__is_a_Worker diz2@@45))) (= diz@@109 diz2@@45))
 :qid |stdinbpl.1052:15|
 :skolemid |128|
 :pattern ( (Worker__is_a_Worker diz@@109) (Worker__is_a_Worker diz2@@45))
)))
(assert (forall ((arg0@@79 T@U) ) (! (= (type (|Worker__is_a_Worker#sm| arg0@@79)) (FieldType PredicateType_Worker__is_a_WorkerType (MapType1Type RefType boolType)))
 :qid |funType:Worker__is_a_Worker#sm|
 :pattern ( (|Worker__is_a_Worker#sm| arg0@@79))
)))
(assert (forall ((diz@@110 T@U) (diz2@@46 T@U) ) (!  (=> (and (and (= (type diz@@110) RefType) (= (type diz2@@46) RefType)) (= (|Worker__is_a_Worker#sm| diz@@110) (|Worker__is_a_Worker#sm| diz2@@46))) (= diz@@110 diz2@@46))
 :qid |stdinbpl.1056:15|
 :skolemid |129|
 :pattern ( (|Worker__is_a_Worker#sm| diz@@110) (|Worker__is_a_Worker#sm| diz2@@46))
)))
(assert (forall ((diz@@111 T@U) (diz2@@47 T@U) ) (!  (=> (and (and (= (type diz@@111) RefType) (= (type diz2@@47) RefType)) (= (Worker__instance_of_Worker diz@@111) (Worker__instance_of_Worker diz2@@47))) (= diz@@111 diz2@@47))
 :qid |stdinbpl.1087:15|
 :skolemid |134|
 :pattern ( (Worker__instance_of_Worker diz@@111) (Worker__instance_of_Worker diz2@@47))
)))
(assert (forall ((arg0@@80 T@U) ) (! (= (type (|Worker__instance_of_Worker#sm| arg0@@80)) (FieldType PredicateType_Worker__instance_of_WorkerType (MapType1Type RefType boolType)))
 :qid |funType:Worker__instance_of_Worker#sm|
 :pattern ( (|Worker__instance_of_Worker#sm| arg0@@80))
)))
(assert (forall ((diz@@112 T@U) (diz2@@48 T@U) ) (!  (=> (and (and (= (type diz@@112) RefType) (= (type diz2@@48) RefType)) (= (|Worker__instance_of_Worker#sm| diz@@112) (|Worker__instance_of_Worker#sm| diz2@@48))) (= diz@@112 diz2@@48))
 :qid |stdinbpl.1091:15|
 :skolemid |135|
 :pattern ( (|Worker__instance_of_Worker#sm| diz@@112) (|Worker__instance_of_Worker#sm| diz2@@48))
)))
(assert (forall ((diz@@113 T@U) (diz2@@49 T@U) ) (!  (=> (and (and (= (type diz@@113) RefType) (= (type diz2@@49) RefType)) (= (Worker__is_a_Thread diz@@113) (Worker__is_a_Thread diz2@@49))) (= diz@@113 diz2@@49))
 :qid |stdinbpl.1122:15|
 :skolemid |140|
 :pattern ( (Worker__is_a_Thread diz@@113) (Worker__is_a_Thread diz2@@49))
)))
(assert (forall ((arg0@@81 T@U) ) (! (= (type (|Worker__is_a_Thread#sm| arg0@@81)) (FieldType PredicateType_Worker__is_a_ThreadType (MapType1Type RefType boolType)))
 :qid |funType:Worker__is_a_Thread#sm|
 :pattern ( (|Worker__is_a_Thread#sm| arg0@@81))
)))
(assert (forall ((diz@@114 T@U) (diz2@@50 T@U) ) (!  (=> (and (and (= (type diz@@114) RefType) (= (type diz2@@50) RefType)) (= (|Worker__is_a_Thread#sm| diz@@114) (|Worker__is_a_Thread#sm| diz2@@50))) (= diz@@114 diz2@@50))
 :qid |stdinbpl.1126:15|
 :skolemid |141|
 :pattern ( (|Worker__is_a_Thread#sm| diz@@114) (|Worker__is_a_Thread#sm| diz2@@50))
)))
(assert (forall ((diz@@115 T@U) (diz2@@51 T@U) ) (!  (=> (and (and (= (type diz@@115) RefType) (= (type diz2@@51) RefType)) (= (Worker__instance_of_Thread diz@@115) (Worker__instance_of_Thread diz2@@51))) (= diz@@115 diz2@@51))
 :qid |stdinbpl.1157:15|
 :skolemid |146|
 :pattern ( (Worker__instance_of_Thread diz@@115) (Worker__instance_of_Thread diz2@@51))
)))
(assert (forall ((arg0@@82 T@U) ) (! (= (type (|Worker__instance_of_Thread#sm| arg0@@82)) (FieldType PredicateType_Worker__instance_of_ThreadType (MapType1Type RefType boolType)))
 :qid |funType:Worker__instance_of_Thread#sm|
 :pattern ( (|Worker__instance_of_Thread#sm| arg0@@82))
)))
(assert (forall ((diz@@116 T@U) (diz2@@52 T@U) ) (!  (=> (and (and (= (type diz@@116) RefType) (= (type diz2@@52) RefType)) (= (|Worker__instance_of_Thread#sm| diz@@116) (|Worker__instance_of_Thread#sm| diz2@@52))) (= diz@@116 diz2@@52))
 :qid |stdinbpl.1161:15|
 :skolemid |147|
 :pattern ( (|Worker__instance_of_Thread#sm| diz@@116) (|Worker__instance_of_Thread#sm| diz2@@52))
)))
(assert (forall ((Heap@@34 T@U) (ExhaleHeap@@2 T@U) (Mask@@3 T@U) (o_1@@0 T@U) (f_2 T@U) ) (! (let ((B@@1 (FieldTypeInv1 (type f_2))))
(let ((A@@1 (FieldTypeInv0 (type f_2))))
 (=> (and (and (and (and (and (and (= (type Heap@@34) (MapType0Type RefType)) (= (type ExhaleHeap@@2) (MapType0Type RefType))) (= (type Mask@@3) (MapType1Type RefType realType))) (= (type o_1@@0) RefType)) (= (type f_2) (FieldType A@@1 B@@1))) (IdenticalOnKnownLocations Heap@@34 ExhaleHeap@@2 Mask@@3)) (HasDirectPerm Mask@@3 o_1@@0 f_2)) (= (MapType0Select Heap@@34 o_1@@0 f_2) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2)))))
 :qid |stdinbpl.42:22|
 :skolemid |1|
 :pattern ( (IdenticalOnKnownLocations Heap@@34 ExhaleHeap@@2 Mask@@3) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2))
)))
(assert  (and (= (type dummyHeap) (MapType0Type RefType)) (= (type ZeroMask) (MapType1Type RefType realType))))
(assert (state dummyHeap ZeroMask))
(assert (forall ((p1_1 T@U) ) (!  (=> (= (type p1_1) ProcessDomainTypeType) (forall ((p2_1@@31 T@U) ) (!  (=> (= (type p2_1@@31) ProcessDomainTypeType) (forall ((p3 T@U) ) (!  (=> (= (type p3) ProcessDomainTypeType) (= (p_seq (p_seq p1_1 p2_1@@31) p3) (p_seq p1_1 (p_seq p2_1@@31 p3))))
 :qid |stdinbpl.264:13|
 :skolemid |26|
 :pattern ( (p_seq (p_seq p1_1 p2_1@@31) p3))
 :pattern ( (p_seq p1_1 (p_seq p2_1@@31 p3)))
)))
 :qid |stdinbpl.262:11|
 :skolemid |27|
 :pattern ( (p_seq p1_1 p2_1@@31))
)))
 :qid |stdinbpl.260:15|
 :skolemid |28|
 :no-pattern (type p1_1)
 :no-pattern (U_2_int p1_1)
 :no-pattern (U_2_bool p1_1)
)))
(assert (forall ((p T@U) (v_1 T@U) (w T@U) ) (! (let ((A@@2 (FieldTypeInv0 (type p))))
 (=> (and (and (= (type p) (FieldType A@@2 FrameTypeType)) (= (type v_1) FrameTypeType)) (= (type w) FrameTypeType)) (not (InsidePredicate p v_1 p w))))
 :qid |stdinbpl.174:19|
 :skolemid |21|
 :pattern ( (InsidePredicate p v_1 p w))
)))
(assert  (not (IsPredicateField History__x_hist_value)))
(assert  (not (IsWandField History__x_hist_value)))
(assert  (not (IsPredicateField History__x_hist_mode)))
(assert  (not (IsWandField History__x_hist_mode)))
(assert  (not (IsPredicateField History__x_hist_init)))
(assert  (not (IsWandField History__x_hist_init)))
(assert  (not (IsPredicateField History__x_hist_act)))
(assert  (not (IsWandField History__x_hist_act)))
(assert  (not (IsPredicateField SubjectLock__subject)))
(assert  (not (IsWandField SubjectLock__subject)))
(assert  (not (IsPredicateField Worker__l)))
(assert  (not (IsWandField Worker__l)))
(assert  (not (IsPredicateField Worker__s)))
(assert  (not (IsWandField Worker__s)))
(assert (forall ((Heap@@35 T@U) (ExhaleHeap@@3 T@U) (Mask@@4 T@U) ) (!  (=> (and (and (and (= (type Heap@@35) (MapType0Type RefType)) (= (type ExhaleHeap@@3) (MapType0Type RefType))) (= (type Mask@@4) (MapType1Type RefType realType))) (IdenticalOnKnownLocations Heap@@35 ExhaleHeap@@3 Mask@@4)) (succHeap Heap@@35 ExhaleHeap@@3))
 :qid |stdinbpl.83:15|
 :skolemid |10|
 :pattern ( (IdenticalOnKnownLocations Heap@@35 ExhaleHeap@@3 Mask@@4))
)))
(assert (forall ((Heap@@36 T@U) (Mask@@5 T@U) (diz@@117 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@36) (MapType0Type RefType)) (= (type Mask@@5) (MapType1Type RefType realType))) (= (type diz@@117) RefType)) (and (state Heap@@36 Mask@@5) (< AssumeFunctionsAbove 0))) (not (= diz@@117 null))) (= (History__free_get_x Heap@@36 diz@@117) (U_2_int (MapType0Select Heap@@36 diz@@117 History__x_hist_value))))
 :qid |stdinbpl.338:15|
 :skolemid |35|
 :pattern ( (state Heap@@36 Mask@@5) (History__free_get_x Heap@@36 diz@@117))
)))
(assert (forall ((Heap@@37 T@U) (Mask@@6 T@U) (diz@@118 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@37) (MapType0Type RefType)) (= (type Mask@@6) (MapType1Type RefType realType))) (= (type diz@@118) RefType)) (and (state Heap@@37 Mask@@6) (< AssumeFunctionsAbove 1))) (not (= diz@@118 null))) (= (History__hist_get_x Heap@@37 diz@@118) (U_2_int (MapType0Select Heap@@37 diz@@118 History__x_hist_value))))
 :qid |stdinbpl.406:15|
 :skolemid |39|
 :pattern ( (state Heap@@37 Mask@@6) (History__hist_get_x Heap@@37 diz@@118))
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
(assert  (and (forall ((arg0@@83 Real) (arg1@@48 T@U) ) (! (= (type (ConditionalFrame arg0@@83 arg1@@48)) FrameTypeType)
 :qid |funType:ConditionalFrame|
 :pattern ( (ConditionalFrame arg0@@83 arg1@@48))
)) (= (type EmptyFrame) FrameTypeType)))
(assert (forall ((p@@0 Real) (f_6 T@U) ) (!  (=> (= (type f_6) FrameTypeType) (= (ConditionalFrame p@@0 f_6) (ite (> p@@0 0.0) f_6 EmptyFrame)))
 :qid |stdinbpl.162:15|
 :skolemid |19|
 :pattern ( (ConditionalFrame p@@0 f_6))
)))
(assert (forall ((Mask@@7 T@U) (o_2@@0 T@U) (f_4@@0 T@U) ) (! (let ((B@@3 (FieldTypeInv1 (type f_4@@0))))
(let ((A@@4 (FieldTypeInv0 (type f_4@@0))))
 (=> (and (and (= (type Mask@@7) (MapType1Type RefType realType)) (= (type o_2@@0) RefType)) (= (type f_4@@0) (FieldType A@@4 B@@3))) (= (HasDirectPerm Mask@@7 o_2@@0 f_4@@0) (> (U_2_real (MapType1Select Mask@@7 o_2@@0 f_4@@0)) NoPerm)))))
 :qid |stdinbpl.133:22|
 :skolemid |17|
 :pattern ( (HasDirectPerm Mask@@7 o_2@@0 f_4@@0))
)))
(assert (forall ((o_2@@1 T@U) (f_4@@1 T@U) ) (! (let ((B@@4 (FieldTypeInv1 (type f_4@@1))))
(let ((A@@5 (FieldTypeInv0 (type f_4@@1))))
 (=> (and (= (type o_2@@1) RefType) (= (type f_4@@1) (FieldType A@@5 B@@4))) (= (U_2_real (MapType1Select ZeroMask o_2@@1 f_4@@1)) NoPerm))))
 :qid |stdinbpl.106:22|
 :skolemid |13|
 :pattern ( (MapType1Select ZeroMask o_2@@1 f_4@@1))
)))
(assert (forall ((p_1@@65 T@U) ) (!  (=> (= (type p_1@@65) ProcessDomainTypeType) (= (p_merge p_empty p_1@@65) p_1@@65))
 :qid |stdinbpl.242:15|
 :skolemid |23|
 :pattern ( (p_merge p_empty p_1@@65))
)))
(assert (forall ((p_1@@66 T@U) ) (!  (=> (= (type p_1@@66) ProcessDomainTypeType) (= (p_seq p_empty p_1@@66) p_1@@66))
 :qid |stdinbpl.248:15|
 :skolemid |24|
 :pattern ( (p_seq p_empty p_1@@66))
)))
(assert  (and (= (Ctor TYPEDomainTypeType) 40) (= (type class_Object) TYPEDomainTypeType)))
(assert (forall ((t_1 T@U) ) (!  (=> (= (type t_1) TYPEDomainTypeType) (instanceof class_Object t_1))
 :qid |stdinbpl.211:15|
 :skolemid |22|
 :pattern ( (instanceof class_Object t_1))
)))
(assert (forall ((diz@@119 T@U) (p_1@@67 Real) ) (!  (=> (= (type diz@@119) RefType) (= (getPredWandId (Thread__joinToken diz@@119 p_1@@67)) 8))
 :qid |stdinbpl.808:15|
 :skolemid |91|
 :pattern ( (Thread__joinToken diz@@119 p_1@@67))
)))
(assert (forall ((diz@@120 T@U) (p_1@@68 Real) ) (!  (=> (= (type diz@@120) RefType) (= (getPredWandId (Thread__preFork diz@@120 p_1@@68)) 9))
 :qid |stdinbpl.843:15|
 :skolemid |97|
 :pattern ( (Thread__preFork diz@@120 p_1@@68))
)))
(assert (forall ((diz@@121 T@U) (p_1@@69 Real) ) (!  (=> (= (type diz@@121) RefType) (= (getPredWandId (Thread__postJoin diz@@121 p_1@@69)) 10))
 :qid |stdinbpl.878:15|
 :skolemid |103|
 :pattern ( (Thread__postJoin diz@@121 p_1@@69))
)))
(assert (forall ((diz@@122 T@U) (p_1@@70 Real) ) (!  (=> (= (type diz@@122) RefType) (= (getPredWandId (Thread__joinToken_at_Thread diz@@122 p_1@@70)) 11))
 :qid |stdinbpl.913:15|
 :skolemid |109|
 :pattern ( (Thread__joinToken_at_Thread diz@@122 p_1@@70))
)))
(assert (forall ((diz@@123 T@U) (p_1@@71 Real) ) (!  (=> (= (type diz@@123) RefType) (= (getPredWandId (Thread__preFork_at_Thread diz@@123 p_1@@71)) 12))
 :qid |stdinbpl.948:15|
 :skolemid |115|
 :pattern ( (Thread__preFork_at_Thread diz@@123 p_1@@71))
)))
(assert (forall ((diz@@124 T@U) (p_1@@72 Real) ) (!  (=> (= (type diz@@124) RefType) (= (getPredWandId (Thread__postJoin_at_Thread diz@@124 p_1@@72)) 13))
 :qid |stdinbpl.997:15|
 :skolemid |121|
 :pattern ( (Thread__postJoin_at_Thread diz@@124 p_1@@72))
)))
(assert (forall ((diz@@125 T@U) (p_1@@73 Real) ) (!  (=> (= (type diz@@125) RefType) (= (getPredWandId (Worker__joinToken diz@@125 p_1@@73)) 18))
 :qid |stdinbpl.1186:15|
 :skolemid |151|
 :pattern ( (Worker__joinToken diz@@125 p_1@@73))
)))
(assert (forall ((diz@@126 T@U) (p_1@@74 Real) ) (!  (=> (= (type diz@@126) RefType) (= (getPredWandId (Worker__joinToken_at_Worker diz@@126 p_1@@74)) 19))
 :qid |stdinbpl.1221:15|
 :skolemid |157|
 :pattern ( (Worker__joinToken_at_Worker diz@@126 p_1@@74))
)))
(assert (forall ((diz@@127 T@U) (p_1@@75 Real) ) (!  (=> (= (type diz@@127) RefType) (= (getPredWandId (Worker__preFork diz@@127 p_1@@75)) 20))
 :qid |stdinbpl.1274:15|
 :skolemid |163|
 :pattern ( (Worker__preFork diz@@127 p_1@@75))
)))
(assert (forall ((diz@@128 T@U) (p_1@@76 Real) ) (!  (=> (= (type diz@@128) RefType) (= (getPredWandId (Worker__postJoin diz@@128 p_1@@76)) 21))
 :qid |stdinbpl.1309:15|
 :skolemid |169|
 :pattern ( (Worker__postJoin diz@@128 p_1@@76))
)))
(assert (forall ((diz@@129 T@U) (p_1@@77 Real) ) (!  (=> (= (type diz@@129) RefType) (= (getPredWandId (Worker__joinToken_at_Thread diz@@129 p_1@@77)) 22))
 :qid |stdinbpl.1344:15|
 :skolemid |175|
 :pattern ( (Worker__joinToken_at_Thread diz@@129 p_1@@77))
)))
(assert (forall ((diz@@130 T@U) (p_1@@78 Real) ) (!  (=> (= (type diz@@130) RefType) (= (getPredWandId (Worker__preFork_at_Thread diz@@130 p_1@@78)) 23))
 :qid |stdinbpl.1379:15|
 :skolemid |181|
 :pattern ( (Worker__preFork_at_Thread diz@@130 p_1@@78))
)))
(assert (forall ((diz@@131 T@U) (p_1@@79 Real) ) (!  (=> (= (type diz@@131) RefType) (= (getPredWandId (Worker__postJoin_at_Thread diz@@131 p_1@@79)) 24))
 :qid |stdinbpl.1428:15|
 :skolemid |187|
 :pattern ( (Worker__postJoin_at_Thread diz@@131 p_1@@79))
)))
(assert (forall ((diz@@132 T@U) (p_1@@80 Real) ) (!  (=> (= (type diz@@132) RefType) (= (getPredWandId (Worker__preFork_at_Worker diz@@132 p_1@@80)) 25))
 :qid |stdinbpl.1477:15|
 :skolemid |193|
 :pattern ( (Worker__preFork_at_Worker diz@@132 p_1@@80))
)))
(assert (forall ((diz@@133 T@U) (p_1@@81 Real) ) (!  (=> (= (type diz@@133) RefType) (= (getPredWandId (Worker__postJoin_at_Worker diz@@133 p_1@@81)) 26))
 :qid |stdinbpl.1576:15|
 :skolemid |199|
 :pattern ( (Worker__postJoin_at_Worker diz@@133 p_1@@81))
)))
(assert (forall ((Heap@@38 T@U) (ExhaleHeap@@4 T@U) (Mask@@8 T@U) (pm_f@@1 T@U) ) (! (let ((C@@1 (FieldTypeInv0 (type pm_f@@1))))
 (=> (and (and (and (and (and (= (type Heap@@38) (MapType0Type RefType)) (= (type ExhaleHeap@@4) (MapType0Type RefType))) (= (type Mask@@8) (MapType1Type RefType realType))) (= (type pm_f@@1) (FieldType C@@1 FrameTypeType))) (IdenticalOnKnownLocations Heap@@38 ExhaleHeap@@4 Mask@@8)) (and (HasDirectPerm Mask@@8 null pm_f@@1) (IsPredicateField pm_f@@1))) (forall ((o2 T@U) (f_2@@0 T@U) ) (! (let ((B@@5 (FieldTypeInv1 (type f_2@@0))))
(let ((A@@6 (FieldTypeInv0 (type f_2@@0))))
 (=> (and (and (= (type o2) RefType) (= (type f_2@@0) (FieldType A@@6 B@@5))) (U_2_bool (MapType1Select (MapType0Select Heap@@38 null (PredicateMaskField pm_f@@1)) o2 f_2@@0))) (= (MapType0Select Heap@@38 o2 f_2@@0) (MapType0Select ExhaleHeap@@4 o2 f_2@@0)))))
 :qid |stdinbpl.54:134|
 :skolemid |3|
 :pattern ( (MapType0Select ExhaleHeap@@4 o2 f_2@@0))
))))
 :qid |stdinbpl.52:19|
 :skolemid |4|
 :pattern ( (IdenticalOnKnownLocations Heap@@38 ExhaleHeap@@4 Mask@@8) (IsPredicateField pm_f@@1))
)))
(assert (forall ((Heap@@39 T@U) (ExhaleHeap@@5 T@U) (Mask@@9 T@U) (pm_f@@2 T@U) ) (! (let ((C@@2 (FieldTypeInv0 (type pm_f@@2))))
 (=> (and (and (and (and (and (= (type Heap@@39) (MapType0Type RefType)) (= (type ExhaleHeap@@5) (MapType0Type RefType))) (= (type Mask@@9) (MapType1Type RefType realType))) (= (type pm_f@@2) (FieldType C@@2 FrameTypeType))) (IdenticalOnKnownLocations Heap@@39 ExhaleHeap@@5 Mask@@9)) (and (HasDirectPerm Mask@@9 null pm_f@@2) (IsWandField pm_f@@2))) (forall ((o2@@0 T@U) (f_2@@1 T@U) ) (! (let ((B@@6 (FieldTypeInv1 (type f_2@@1))))
(let ((A@@7 (FieldTypeInv0 (type f_2@@1))))
 (=> (and (and (= (type o2@@0) RefType) (= (type f_2@@1) (FieldType A@@7 B@@6))) (U_2_bool (MapType1Select (MapType0Select Heap@@39 null (WandMaskField pm_f@@2)) o2@@0 f_2@@1))) (= (MapType0Select Heap@@39 o2@@0 f_2@@1) (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1)))))
 :qid |stdinbpl.67:129|
 :skolemid |6|
 :pattern ( (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1))
))))
 :qid |stdinbpl.65:19|
 :skolemid |7|
 :pattern ( (IdenticalOnKnownLocations Heap@@39 ExhaleHeap@@5 Mask@@9) (IsWandField pm_f@@2))
)))
(assert (forall ((diz@@134 T@U) ) (!  (=> (= (type diz@@134) RefType) (= (getPredWandId (History__inv diz@@134)) 0))
 :qid |stdinbpl.472:15|
 :skolemid |43|
 :pattern ( (History__inv diz@@134))
)))
(assert (forall ((diz@@135 T@U) ) (!  (=> (= (type diz@@135) RefType) (= (getPredWandId (SubjectLock__inv diz@@135)) 3))
 :qid |stdinbpl.605:15|
 :skolemid |61|
 :pattern ( (SubjectLock__inv diz@@135))
)))
(assert (forall ((diz@@136 T@U) ) (!  (=> (= (type diz@@136) RefType) (= (getPredWandId (SubjectLock__valid diz@@136)) 4))
 :qid |stdinbpl.668:15|
 :skolemid |67|
 :pattern ( (SubjectLock__valid diz@@136))
)))
(assert (forall ((diz@@137 T@U) ) (!  (=> (= (type diz@@137) RefType) (= (getPredWandId (Thread__is_a_Thread diz@@137)) 6))
 :qid |stdinbpl.738:15|
 :skolemid |79|
 :pattern ( (Thread__is_a_Thread diz@@137))
)))
(assert (forall ((diz@@138 T@U) ) (!  (=> (= (type diz@@138) RefType) (= (getPredWandId (Thread__instance_of_Thread diz@@138)) 7))
 :qid |stdinbpl.773:15|
 :skolemid |85|
 :pattern ( (Thread__instance_of_Thread diz@@138))
)))
(assert (forall ((diz@@139 T@U) ) (!  (=> (= (type diz@@139) RefType) (= (getPredWandId (Worker__is_a_Worker diz@@139)) 14))
 :qid |stdinbpl.1046:15|
 :skolemid |127|
 :pattern ( (Worker__is_a_Worker diz@@139))
)))
(assert (forall ((diz@@140 T@U) ) (!  (=> (= (type diz@@140) RefType) (= (getPredWandId (Worker__instance_of_Worker diz@@140)) 15))
 :qid |stdinbpl.1081:15|
 :skolemid |133|
 :pattern ( (Worker__instance_of_Worker diz@@140))
)))
(assert (forall ((diz@@141 T@U) ) (!  (=> (= (type diz@@141) RefType) (= (getPredWandId (Worker__is_a_Thread diz@@141)) 16))
 :qid |stdinbpl.1116:15|
 :skolemid |139|
 :pattern ( (Worker__is_a_Thread diz@@141))
)))
(assert (forall ((diz@@142 T@U) ) (!  (=> (= (type diz@@142) RefType) (= (getPredWandId (Worker__instance_of_Thread diz@@142)) 17))
 :qid |stdinbpl.1151:15|
 :skolemid |145|
 :pattern ( (Worker__instance_of_Thread diz@@142))
)))
(assert (forall ((Mask@@10 T@U) (o_2@@2 T@U) (f_4@@2 T@U) ) (! (let ((B@@7 (FieldTypeInv1 (type f_4@@2))))
(let ((A@@8 (FieldTypeInv0 (type f_4@@2))))
 (=> (and (and (and (= (type Mask@@10) (MapType1Type RefType realType)) (= (type o_2@@2) RefType)) (= (type f_4@@2) (FieldType A@@8 B@@7))) (GoodMask Mask@@10)) (and (>= (U_2_real (MapType1Select Mask@@10 o_2@@2 f_4@@2)) NoPerm) (=> (and (and (GoodMask Mask@@10) (not (IsPredicateField f_4@@2))) (not (IsWandField f_4@@2))) (<= (U_2_real (MapType1Select Mask@@10 o_2@@2 f_4@@2)) FullPerm))))))
 :qid |stdinbpl.128:22|
 :skolemid |16|
 :pattern ( (GoodMask Mask@@10) (MapType1Select Mask@@10 o_2@@2 f_4@@2))
)))
(assert (forall ((arg0@@84 T@U) ) (! (= (type (FrameFragment arg0@@84)) FrameTypeType)
 :qid |funType:FrameFragment|
 :pattern ( (FrameFragment arg0@@84))
)))
(assert (forall ((Heap@@40 T@U) (Mask@@11 T@U) (diz@@143 T@U) ) (!  (=> (and (and (and (= (type Heap@@40) (MapType0Type RefType)) (= (type Mask@@11) (MapType1Type RefType realType))) (= (type diz@@143) RefType)) (state Heap@@40 Mask@@11)) (= (|History__free_get_x'| Heap@@40 diz@@143) (|History__free_get_x#frame| (FrameFragment (MapType0Select Heap@@40 diz@@143 History__x_hist_value)) diz@@143)))
 :qid |stdinbpl.345:15|
 :skolemid |36|
 :pattern ( (state Heap@@40 Mask@@11) (|History__free_get_x'| Heap@@40 diz@@143))
)))
(assert (forall ((Heap@@41 T@U) (Mask@@12 T@U) (diz@@144 T@U) ) (!  (=> (and (and (and (= (type Heap@@41) (MapType0Type RefType)) (= (type Mask@@12) (MapType1Type RefType realType))) (= (type diz@@144) RefType)) (state Heap@@41 Mask@@12)) (= (|History__hist_get_x'| Heap@@41 diz@@144) (|History__hist_get_x#frame| (FrameFragment (MapType0Select Heap@@41 diz@@144 History__x_hist_value)) diz@@144)))
 :qid |stdinbpl.413:15|
 :skolemid |40|
 :pattern ( (state Heap@@41 Mask@@12) (|History__hist_get_x'| Heap@@41 diz@@144))
)))
(assert (forall ((o T@U) (f T@U) (Heap@@42 T@U) ) (!  (=> (and (and (and (= (type o) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap@@42) (MapType0Type RefType))) (U_2_bool (MapType0Select Heap@@42 o $allocated))) (U_2_bool (MapType0Select Heap@@42 (MapType0Select Heap@@42 o f) $allocated)))
 :qid |stdinbpl.31:15|
 :skolemid |0|
 :pattern ( (MapType0Select Heap@@42 o f))
)))
(assert (forall ((diz@@145 T@U) (p_1@@82 Real) ) (!  (=> (= (type diz@@145) RefType) (= (PredicateMaskField (Thread__joinToken diz@@145 p_1@@82)) (|Thread__joinToken#sm| diz@@145 p_1@@82)))
 :qid |stdinbpl.800:15|
 :skolemid |89|
 :pattern ( (PredicateMaskField (Thread__joinToken diz@@145 p_1@@82)))
)))
(assert (forall ((diz@@146 T@U) (p_1@@83 Real) ) (!  (=> (= (type diz@@146) RefType) (= (PredicateMaskField (Thread__preFork diz@@146 p_1@@83)) (|Thread__preFork#sm| diz@@146 p_1@@83)))
 :qid |stdinbpl.835:15|
 :skolemid |95|
 :pattern ( (PredicateMaskField (Thread__preFork diz@@146 p_1@@83)))
)))
(assert (forall ((diz@@147 T@U) (p_1@@84 Real) ) (!  (=> (= (type diz@@147) RefType) (= (PredicateMaskField (Thread__postJoin diz@@147 p_1@@84)) (|Thread__postJoin#sm| diz@@147 p_1@@84)))
 :qid |stdinbpl.870:15|
 :skolemid |101|
 :pattern ( (PredicateMaskField (Thread__postJoin diz@@147 p_1@@84)))
)))
(assert (forall ((diz@@148 T@U) (p_1@@85 Real) ) (!  (=> (= (type diz@@148) RefType) (= (PredicateMaskField (Thread__joinToken_at_Thread diz@@148 p_1@@85)) (|Thread__joinToken_at_Thread#sm| diz@@148 p_1@@85)))
 :qid |stdinbpl.905:15|
 :skolemid |107|
 :pattern ( (PredicateMaskField (Thread__joinToken_at_Thread diz@@148 p_1@@85)))
)))
(assert (forall ((diz@@149 T@U) (p_1@@86 Real) ) (!  (=> (= (type diz@@149) RefType) (= (PredicateMaskField (Thread__preFork_at_Thread diz@@149 p_1@@86)) (|Thread__preFork_at_Thread#sm| diz@@149 p_1@@86)))
 :qid |stdinbpl.940:15|
 :skolemid |113|
 :pattern ( (PredicateMaskField (Thread__preFork_at_Thread diz@@149 p_1@@86)))
)))
(assert (forall ((diz@@150 T@U) (p_1@@87 Real) ) (!  (=> (= (type diz@@150) RefType) (= (PredicateMaskField (Thread__postJoin_at_Thread diz@@150 p_1@@87)) (|Thread__postJoin_at_Thread#sm| diz@@150 p_1@@87)))
 :qid |stdinbpl.989:15|
 :skolemid |119|
 :pattern ( (PredicateMaskField (Thread__postJoin_at_Thread diz@@150 p_1@@87)))
)))
(assert (forall ((diz@@151 T@U) (p_1@@88 Real) ) (!  (=> (= (type diz@@151) RefType) (= (PredicateMaskField (Worker__joinToken diz@@151 p_1@@88)) (|Worker__joinToken#sm| diz@@151 p_1@@88)))
 :qid |stdinbpl.1178:15|
 :skolemid |149|
 :pattern ( (PredicateMaskField (Worker__joinToken diz@@151 p_1@@88)))
)))
(assert (forall ((diz@@152 T@U) (p_1@@89 Real) ) (!  (=> (= (type diz@@152) RefType) (= (PredicateMaskField (Worker__joinToken_at_Worker diz@@152 p_1@@89)) (|Worker__joinToken_at_Worker#sm| diz@@152 p_1@@89)))
 :qid |stdinbpl.1213:15|
 :skolemid |155|
 :pattern ( (PredicateMaskField (Worker__joinToken_at_Worker diz@@152 p_1@@89)))
)))
(assert (forall ((diz@@153 T@U) (p_1@@90 Real) ) (!  (=> (= (type diz@@153) RefType) (= (PredicateMaskField (Worker__preFork diz@@153 p_1@@90)) (|Worker__preFork#sm| diz@@153 p_1@@90)))
 :qid |stdinbpl.1266:15|
 :skolemid |161|
 :pattern ( (PredicateMaskField (Worker__preFork diz@@153 p_1@@90)))
)))
(assert (forall ((diz@@154 T@U) (p_1@@91 Real) ) (!  (=> (= (type diz@@154) RefType) (= (PredicateMaskField (Worker__postJoin diz@@154 p_1@@91)) (|Worker__postJoin#sm| diz@@154 p_1@@91)))
 :qid |stdinbpl.1301:15|
 :skolemid |167|
 :pattern ( (PredicateMaskField (Worker__postJoin diz@@154 p_1@@91)))
)))
(assert (forall ((diz@@155 T@U) (p_1@@92 Real) ) (!  (=> (= (type diz@@155) RefType) (= (PredicateMaskField (Worker__joinToken_at_Thread diz@@155 p_1@@92)) (|Worker__joinToken_at_Thread#sm| diz@@155 p_1@@92)))
 :qid |stdinbpl.1336:15|
 :skolemid |173|
 :pattern ( (PredicateMaskField (Worker__joinToken_at_Thread diz@@155 p_1@@92)))
)))
(assert (forall ((diz@@156 T@U) (p_1@@93 Real) ) (!  (=> (= (type diz@@156) RefType) (= (PredicateMaskField (Worker__preFork_at_Thread diz@@156 p_1@@93)) (|Worker__preFork_at_Thread#sm| diz@@156 p_1@@93)))
 :qid |stdinbpl.1371:15|
 :skolemid |179|
 :pattern ( (PredicateMaskField (Worker__preFork_at_Thread diz@@156 p_1@@93)))
)))
(assert (forall ((diz@@157 T@U) (p_1@@94 Real) ) (!  (=> (= (type diz@@157) RefType) (= (PredicateMaskField (Worker__postJoin_at_Thread diz@@157 p_1@@94)) (|Worker__postJoin_at_Thread#sm| diz@@157 p_1@@94)))
 :qid |stdinbpl.1420:15|
 :skolemid |185|
 :pattern ( (PredicateMaskField (Worker__postJoin_at_Thread diz@@157 p_1@@94)))
)))
(assert (forall ((diz@@158 T@U) (p_1@@95 Real) ) (!  (=> (= (type diz@@158) RefType) (= (PredicateMaskField (Worker__preFork_at_Worker diz@@158 p_1@@95)) (|Worker__preFork_at_Worker#sm| diz@@158 p_1@@95)))
 :qid |stdinbpl.1469:15|
 :skolemid |191|
 :pattern ( (PredicateMaskField (Worker__preFork_at_Worker diz@@158 p_1@@95)))
)))
(assert (forall ((diz@@159 T@U) (p_1@@96 Real) ) (!  (=> (= (type diz@@159) RefType) (= (PredicateMaskField (Worker__postJoin_at_Worker diz@@159 p_1@@96)) (|Worker__postJoin_at_Worker#sm| diz@@159 p_1@@96)))
 :qid |stdinbpl.1568:15|
 :skolemid |197|
 :pattern ( (PredicateMaskField (Worker__postJoin_at_Worker diz@@159 p_1@@96)))
)))
(assert (forall ((diz@@160 T@U) ) (!  (=> (= (type diz@@160) RefType) (= (PredicateMaskField (History__inv diz@@160)) (|History__inv#sm| diz@@160)))
 :qid |stdinbpl.464:15|
 :skolemid |41|
 :pattern ( (PredicateMaskField (History__inv diz@@160)))
)))
(assert (forall ((diz@@161 T@U) ) (!  (=> (= (type diz@@161) RefType) (= (PredicateMaskField (SubjectLock__inv diz@@161)) (|SubjectLock__inv#sm| diz@@161)))
 :qid |stdinbpl.597:15|
 :skolemid |59|
 :pattern ( (PredicateMaskField (SubjectLock__inv diz@@161)))
)))
(assert (forall ((diz@@162 T@U) ) (!  (=> (= (type diz@@162) RefType) (= (PredicateMaskField (SubjectLock__valid diz@@162)) (|SubjectLock__valid#sm| diz@@162)))
 :qid |stdinbpl.660:15|
 :skolemid |65|
 :pattern ( (PredicateMaskField (SubjectLock__valid diz@@162)))
)))
(assert (forall ((diz@@163 T@U) ) (!  (=> (= (type diz@@163) RefType) (= (PredicateMaskField (Thread__is_a_Thread diz@@163)) (|Thread__is_a_Thread#sm| diz@@163)))
 :qid |stdinbpl.730:15|
 :skolemid |77|
 :pattern ( (PredicateMaskField (Thread__is_a_Thread diz@@163)))
)))
(assert (forall ((diz@@164 T@U) ) (!  (=> (= (type diz@@164) RefType) (= (PredicateMaskField (Thread__instance_of_Thread diz@@164)) (|Thread__instance_of_Thread#sm| diz@@164)))
 :qid |stdinbpl.765:15|
 :skolemid |83|
 :pattern ( (PredicateMaskField (Thread__instance_of_Thread diz@@164)))
)))
(assert (forall ((diz@@165 T@U) ) (!  (=> (= (type diz@@165) RefType) (= (PredicateMaskField (Worker__is_a_Worker diz@@165)) (|Worker__is_a_Worker#sm| diz@@165)))
 :qid |stdinbpl.1038:15|
 :skolemid |125|
 :pattern ( (PredicateMaskField (Worker__is_a_Worker diz@@165)))
)))
(assert (forall ((diz@@166 T@U) ) (!  (=> (= (type diz@@166) RefType) (= (PredicateMaskField (Worker__instance_of_Worker diz@@166)) (|Worker__instance_of_Worker#sm| diz@@166)))
 :qid |stdinbpl.1073:15|
 :skolemid |131|
 :pattern ( (PredicateMaskField (Worker__instance_of_Worker diz@@166)))
)))
(assert (forall ((diz@@167 T@U) ) (!  (=> (= (type diz@@167) RefType) (= (PredicateMaskField (Worker__is_a_Thread diz@@167)) (|Worker__is_a_Thread#sm| diz@@167)))
 :qid |stdinbpl.1108:15|
 :skolemid |137|
 :pattern ( (PredicateMaskField (Worker__is_a_Thread diz@@167)))
)))
(assert (forall ((diz@@168 T@U) ) (!  (=> (= (type diz@@168) RefType) (= (PredicateMaskField (Worker__instance_of_Thread diz@@168)) (|Worker__instance_of_Thread#sm| diz@@168)))
 :qid |stdinbpl.1143:15|
 :skolemid |143|
 :pattern ( (PredicateMaskField (Worker__instance_of_Thread diz@@168)))
)))
(assert (forall ((n_1@@1 Int) ) (! (= (p_single n_1@@1) (ite (> n_1@@1 0) (p_seq (p_single (- n_1@@1 1)) p_incr) p_empty))
 :qid |stdinbpl.284:15|
 :skolemid |31|
 :pattern ( (p_single n_1@@1))
)))
(assert (forall ((Heap@@43 T@U) (o@@0 T@U) (f_3 T@U) (v T@U) ) (! (let ((B@@8 (type v)))
(let ((A@@9 (FieldTypeInv0 (type f_3))))
 (=> (and (and (= (type Heap@@43) (MapType0Type RefType)) (= (type o@@0) RefType)) (= (type f_3) (FieldType A@@9 B@@8))) (succHeap Heap@@43 (MapType0Store Heap@@43 o@@0 f_3 v)))))
 :qid |stdinbpl.78:22|
 :skolemid |9|
 :pattern ( (MapType0Store Heap@@43 o@@0 f_3 v))
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
 :qid |stdinbpl.169:25|
 :skolemid |20|
 :pattern ( (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))
)))
(assert (forall ((m_1@@0 Int) (n_1@@2 Int) ) (! (= (p_seq (p_single m_1@@0) (p_single n_1@@2)) (p_single (+ m_1@@0 n_1@@2)))
 :qid |stdinbpl.290:15|
 :skolemid |32|
 :pattern ( (p_seq (p_single m_1@@0) (p_single n_1@@2)))
)))
(assert (forall ((p_1@@97 T@U) ) (!  (=> (= (type p_1@@97) ProcessDomainTypeType) (= (p_seq p_1@@97 p_empty) p_1@@97))
 :qid |stdinbpl.254:15|
 :skolemid |25|
 :pattern ( (p_seq p_1@@97 p_empty))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
(push 1)
(declare-fun ControlFlow (Int Int) Int)
(set-info :boogie-vc-id |Worker__preFork_at_Thread#definedness|)
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
(declare-fun History__x_hist_value () T@U)
(declare-fun History__x_hist_mode () T@U)
(declare-fun History__x_hist_init () T@U)
(declare-fun History__x_hist_act () T@U)
(declare-fun SubjectLock__subject () T@U)
(declare-fun Worker__l () T@U)
(declare-fun Worker__s () T@U)
(declare-fun FieldType (T@T T@T) T@T)
(declare-fun FieldTypeInv0 (T@T) T@T)
(declare-fun FieldTypeInv1 (T@T) T@T)
(declare-fun NormalFieldType () T@T)
(declare-fun RefType () T@T)
(declare-fun p_single (Int) T@U)
(declare-fun p_seq (T@U T@U) T@U)
(declare-fun p_incr () T@U)
(declare-fun p_empty () T@U)
(declare-fun ProcessDomainTypeType () T@T)
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
(declare-fun History__hist_do_incr (T@U Real T@U) T@U)
(declare-fun IsPredicateField (T@U) Bool)
(declare-fun PredicateType_History__hist_do_incrType () T@T)
(declare-fun FrameTypeType () T@T)
(declare-fun History__hist_idle (T@U Real T@U) T@U)
(declare-fun PredicateType_History__hist_idleType () T@T)
(declare-fun SubjectLock__locked (T@U Real Int) T@U)
(declare-fun PredicateType_SubjectLock__lockedType () T@T)
(declare-fun |History__hist_do_incr#trigger| (T@U T@U) Bool)
(declare-fun |History__hist_do_incr#everUsed| (T@U) Bool)
(declare-fun |History__hist_idle#trigger| (T@U T@U) Bool)
(declare-fun |History__hist_idle#everUsed| (T@U) Bool)
(declare-fun |SubjectLock__locked#trigger| (T@U T@U) Bool)
(declare-fun |SubjectLock__locked#everUsed| (T@U) Bool)
(declare-fun getPredWandId (T@U) Int)
(declare-fun Thread__joinToken (T@U Real) T@U)
(declare-fun PredicateType_Thread__joinTokenType () T@T)
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
(declare-fun History__inv (T@U) T@U)
(declare-fun PredicateType_History__invType () T@T)
(declare-fun SubjectLock__inv (T@U) T@U)
(declare-fun PredicateType_SubjectLock__invType () T@T)
(declare-fun SubjectLock__valid (T@U) T@U)
(declare-fun PredicateType_SubjectLock__validType () T@T)
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
(declare-fun |History__free_get_x'| (T@U T@U) Int)
(declare-fun dummyFunction (T@U) Bool)
(declare-fun |History__free_get_x#triggerStateless| (T@U) Int)
(declare-fun |History__hist_get_x'| (T@U T@U) Int)
(declare-fun |History__hist_get_x#triggerStateless| (T@U) Int)
(declare-fun |History__inv#trigger| (T@U T@U) Bool)
(declare-fun |History__inv#everUsed| (T@U) Bool)
(declare-fun |SubjectLock__inv#trigger| (T@U T@U) Bool)
(declare-fun |SubjectLock__inv#everUsed| (T@U) Bool)
(declare-fun |SubjectLock__valid#trigger| (T@U T@U) Bool)
(declare-fun |SubjectLock__valid#everUsed| (T@U) Bool)
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
(declare-fun |History__hist_do_incr#sm| (T@U Real T@U) T@U)
(declare-fun |History__hist_idle#sm| (T@U Real T@U) T@U)
(declare-fun |SubjectLock__locked#sm| (T@U Real Int) T@U)
(declare-fun History__free_get_x (T@U T@U) Int)
(declare-fun History__hist_get_x (T@U T@U) Int)
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
(declare-fun p_dual (Int Int) T@U)
(declare-fun p_merge (T@U T@U) T@U)
(declare-fun |History__inv#sm| (T@U) T@U)
(declare-fun |SubjectLock__inv#sm| (T@U) T@U)
(declare-fun |SubjectLock__valid#sm| (T@U) T@U)
(declare-fun |Thread__is_a_Thread#sm| (T@U) T@U)
(declare-fun |Thread__instance_of_Thread#sm| (T@U) T@U)
(declare-fun |Worker__is_a_Worker#sm| (T@U) T@U)
(declare-fun |Worker__instance_of_Worker#sm| (T@U) T@U)
(declare-fun |Worker__is_a_Thread#sm| (T@U) T@U)
(declare-fun |Worker__instance_of_Thread#sm| (T@U) T@U)
(declare-fun dummyHeap () T@U)
(declare-fun ZeroMask () T@U)
(declare-fun InsidePredicate (T@U T@U T@U T@U) Bool)
(declare-fun AssumeFunctionsAbove () Int)
(declare-fun sumMask (T@U T@U T@U) Bool)
(declare-fun ConditionalFrame (Real T@U) T@U)
(declare-fun EmptyFrame () T@U)
(declare-fun NoPerm () Real)
(declare-fun instanceof (T@U T@U) Bool)
(declare-fun class_Object () T@U)
(declare-fun TYPEDomainTypeType () T@T)
(declare-fun FullPerm () Real)
(declare-fun |History__free_get_x#frame| (T@U T@U) Int)
(declare-fun FrameFragment (T@U) T@U)
(declare-fun |History__hist_get_x#frame| (T@U T@U) Int)
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
))) (= (Ctor NormalFieldType) 7)) (= (type $allocated) (FieldType NormalFieldType boolType))) (= (type History__x_hist_value) (FieldType NormalFieldType intType))) (= (type History__x_hist_mode) (FieldType NormalFieldType intType))) (= (type History__x_hist_init) (FieldType NormalFieldType intType))) (= (type History__x_hist_act) (FieldType NormalFieldType intType))) (= (Ctor RefType) 8)) (= (type SubjectLock__subject) (FieldType NormalFieldType RefType))) (= (type Worker__l) (FieldType NormalFieldType RefType))) (= (type Worker__s) (FieldType NormalFieldType RefType))))
(assert (distinct $allocated History__x_hist_value History__x_hist_mode History__x_hist_init History__x_hist_act SubjectLock__subject Worker__l Worker__s)
)
(assert  (and (and (and (and (= (Ctor ProcessDomainTypeType) 9) (forall ((arg0@@14 Int) ) (! (= (type (p_single arg0@@14)) ProcessDomainTypeType)
 :qid |funType:p_single|
 :pattern ( (p_single arg0@@14))
))) (forall ((arg0@@15 T@U) (arg1@@2 T@U) ) (! (= (type (p_seq arg0@@15 arg1@@2)) ProcessDomainTypeType)
 :qid |funType:p_seq|
 :pattern ( (p_seq arg0@@15 arg1@@2))
))) (= (type p_incr) ProcessDomainTypeType)) (= (type p_empty) ProcessDomainTypeType)))
(assert (forall ((n_1 Int) ) (! (= (ite (> n_1 0) (p_seq p_incr (p_single (- n_1 1))) p_empty) (p_single n_1))
 :qid |stdinbpl.272:15|
 :skolemid |29|
 :pattern ( (p_single n_1))
)))
(assert  (and (and (and (and (and (forall ((arg0@@16 T@T) ) (! (= (Ctor (MapType0Type arg0@@16)) 10)
 :qid |ctor:MapType0Type|
)) (forall ((arg0@@17 T@T) ) (! (= (MapType0TypeInv0 (MapType0Type arg0@@17)) arg0@@17)
 :qid |typeInv:MapType0TypeInv0|
 :pattern ( (MapType0Type arg0@@17))
))) (forall ((arg0@@18 T@U) (arg1@@3 T@U) (arg2 T@U) ) (! (let ((B (FieldTypeInv1 (type arg2))))
(= (type (MapType0Select arg0@@18 arg1@@3 arg2)) B))
 :qid |funType:MapType0Select|
 :pattern ( (MapType0Select arg0@@18 arg1@@3 arg2))
))) (forall ((arg0@@19 T@U) (arg1@@4 T@U) (arg2@@0 T@U) (arg3 T@U) ) (! (let ((aVar0 (type arg1@@4)))
(= (type (MapType0Store arg0@@19 arg1@@4 arg2@@0 arg3)) (MapType0Type aVar0)))
 :qid |funType:MapType0Store|
 :pattern ( (MapType0Store arg0@@19 arg1@@4 arg2@@0 arg3))
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
(assert  (and (and (and (and (and (and (forall ((arg0@@20 T@T) (arg1@@5 T@T) ) (! (= (Ctor (MapType1Type arg0@@20 arg1@@5)) 11)
 :qid |ctor:MapType1Type|
)) (forall ((arg0@@21 T@T) (arg1@@6 T@T) ) (! (= (MapType1TypeInv0 (MapType1Type arg0@@21 arg1@@6)) arg0@@21)
 :qid |typeInv:MapType1TypeInv0|
 :pattern ( (MapType1Type arg0@@21 arg1@@6))
))) (forall ((arg0@@22 T@T) (arg1@@7 T@T) ) (! (= (MapType1TypeInv1 (MapType1Type arg0@@22 arg1@@7)) arg1@@7)
 :qid |typeInv:MapType1TypeInv1|
 :pattern ( (MapType1Type arg0@@22 arg1@@7))
))) (forall ((arg0@@23 T@U) (arg1@@8 T@U) (arg2@@1 T@U) ) (! (let ((aVar1 (MapType1TypeInv1 (type arg0@@23))))
(= (type (MapType1Select arg0@@23 arg1@@8 arg2@@1)) aVar1))
 :qid |funType:MapType1Select|
 :pattern ( (MapType1Select arg0@@23 arg1@@8 arg2@@1))
))) (forall ((arg0@@24 T@U) (arg1@@9 T@U) (arg2@@2 T@U) (arg3@@0 T@U) ) (! (let ((aVar1@@0 (type arg3@@0)))
(let ((aVar0@@0 (type arg1@@9)))
(= (type (MapType1Store arg0@@24 arg1@@9 arg2@@2 arg3@@0)) (MapType1Type aVar0@@0 aVar1@@0))))
 :qid |funType:MapType1Store|
 :pattern ( (MapType1Store arg0@@24 arg1@@9 arg2@@2 arg3@@0))
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
(assert  (and (and (= (Ctor PredicateType_History__hist_do_incrType) 12) (= (Ctor FrameTypeType) 13)) (forall ((arg0@@25 T@U) (arg1@@10 Real) (arg2@@3 T@U) ) (! (= (type (History__hist_do_incr arg0@@25 arg1@@10 arg2@@3)) (FieldType PredicateType_History__hist_do_incrType FrameTypeType))
 :qid |funType:History__hist_do_incr|
 :pattern ( (History__hist_do_incr arg0@@25 arg1@@10 arg2@@3))
))))
(assert (forall ((diz T@U) (frac Real) (proc T@U) ) (!  (=> (and (= (type diz) RefType) (= (type proc) ProcessDomainTypeType)) (IsPredicateField (History__hist_do_incr diz frac proc)))
 :qid |stdinbpl.531:15|
 :skolemid |48|
 :pattern ( (History__hist_do_incr diz frac proc))
)))
(assert  (and (= (Ctor PredicateType_History__hist_idleType) 14) (forall ((arg0@@26 T@U) (arg1@@11 Real) (arg2@@4 T@U) ) (! (= (type (History__hist_idle arg0@@26 arg1@@11 arg2@@4)) (FieldType PredicateType_History__hist_idleType FrameTypeType))
 :qid |funType:History__hist_idle|
 :pattern ( (History__hist_idle arg0@@26 arg1@@11 arg2@@4))
))))
(assert (forall ((diz@@0 T@U) (frac@@0 Real) (proc@@0 T@U) ) (!  (=> (and (= (type diz@@0) RefType) (= (type proc@@0) ProcessDomainTypeType)) (IsPredicateField (History__hist_idle diz@@0 frac@@0 proc@@0)))
 :qid |stdinbpl.566:15|
 :skolemid |54|
 :pattern ( (History__hist_idle diz@@0 frac@@0 proc@@0))
)))
(assert  (and (= (Ctor PredicateType_SubjectLock__lockedType) 15) (forall ((arg0@@27 T@U) (arg1@@12 Real) (arg2@@5 Int) ) (! (= (type (SubjectLock__locked arg0@@27 arg1@@12 arg2@@5)) (FieldType PredicateType_SubjectLock__lockedType FrameTypeType))
 :qid |funType:SubjectLock__locked|
 :pattern ( (SubjectLock__locked arg0@@27 arg1@@12 arg2@@5))
))))
(assert (forall ((diz@@1 T@U) (p_1 Real) (count Int) ) (!  (=> (= (type diz@@1) RefType) (IsPredicateField (SubjectLock__locked diz@@1 p_1 count)))
 :qid |stdinbpl.699:15|
 :skolemid |72|
 :pattern ( (SubjectLock__locked diz@@1 p_1 count))
)))
(assert (forall ((Heap@@0 T@U) (diz@@2 T@U) (frac@@1 Real) (proc@@1 T@U) ) (!  (=> (and (and (= (type Heap@@0) (MapType0Type RefType)) (= (type diz@@2) RefType)) (= (type proc@@1) ProcessDomainTypeType)) (|History__hist_do_incr#everUsed| (History__hist_do_incr diz@@2 frac@@1 proc@@1)))
 :qid |stdinbpl.550:15|
 :skolemid |52|
 :pattern ( (|History__hist_do_incr#trigger| Heap@@0 (History__hist_do_incr diz@@2 frac@@1 proc@@1)))
)))
(assert (forall ((Heap@@1 T@U) (diz@@3 T@U) (frac@@2 Real) (proc@@2 T@U) ) (!  (=> (and (and (= (type Heap@@1) (MapType0Type RefType)) (= (type diz@@3) RefType)) (= (type proc@@2) ProcessDomainTypeType)) (|History__hist_idle#everUsed| (History__hist_idle diz@@3 frac@@2 proc@@2)))
 :qid |stdinbpl.585:15|
 :skolemid |58|
 :pattern ( (|History__hist_idle#trigger| Heap@@1 (History__hist_idle diz@@3 frac@@2 proc@@2)))
)))
(assert (forall ((Heap@@2 T@U) (diz@@4 T@U) (p_1@@0 Real) (count@@0 Int) ) (!  (=> (and (= (type Heap@@2) (MapType0Type RefType)) (= (type diz@@4) RefType)) (|SubjectLock__locked#everUsed| (SubjectLock__locked diz@@4 p_1@@0 count@@0)))
 :qid |stdinbpl.718:15|
 :skolemid |76|
 :pattern ( (|SubjectLock__locked#trigger| Heap@@2 (SubjectLock__locked diz@@4 p_1@@0 count@@0)))
)))
(assert (forall ((diz@@5 T@U) (frac@@3 Real) (proc@@3 T@U) ) (!  (=> (and (= (type diz@@5) RefType) (= (type proc@@3) ProcessDomainTypeType)) (= (getPredWandId (History__hist_do_incr diz@@5 frac@@3 proc@@3)) 1))
 :qid |stdinbpl.535:15|
 :skolemid |49|
 :pattern ( (History__hist_do_incr diz@@5 frac@@3 proc@@3))
)))
(assert (forall ((diz@@6 T@U) (frac@@4 Real) (proc@@4 T@U) ) (!  (=> (and (= (type diz@@6) RefType) (= (type proc@@4) ProcessDomainTypeType)) (= (getPredWandId (History__hist_idle diz@@6 frac@@4 proc@@4)) 2))
 :qid |stdinbpl.570:15|
 :skolemid |55|
 :pattern ( (History__hist_idle diz@@6 frac@@4 proc@@4))
)))
(assert (forall ((diz@@7 T@U) (p_1@@1 Real) (count@@1 Int) ) (!  (=> (= (type diz@@7) RefType) (= (getPredWandId (SubjectLock__locked diz@@7 p_1@@1 count@@1)) 5))
 :qid |stdinbpl.703:15|
 :skolemid |73|
 :pattern ( (SubjectLock__locked diz@@7 p_1@@1 count@@1))
)))
(assert  (and (= (Ctor PredicateType_Thread__joinTokenType) 16) (forall ((arg0@@28 T@U) (arg1@@13 Real) ) (! (= (type (Thread__joinToken arg0@@28 arg1@@13)) (FieldType PredicateType_Thread__joinTokenType FrameTypeType))
 :qid |funType:Thread__joinToken|
 :pattern ( (Thread__joinToken arg0@@28 arg1@@13))
))))
(assert (forall ((diz@@8 T@U) (p_1@@2 Real) ) (!  (=> (= (type diz@@8) RefType) (IsPredicateField (Thread__joinToken diz@@8 p_1@@2)))
 :qid |stdinbpl.804:15|
 :skolemid |90|
 :pattern ( (Thread__joinToken diz@@8 p_1@@2))
)))
(assert  (and (= (Ctor PredicateType_Thread__preForkType) 17) (forall ((arg0@@29 T@U) (arg1@@14 Real) ) (! (= (type (Thread__preFork arg0@@29 arg1@@14)) (FieldType PredicateType_Thread__preForkType FrameTypeType))
 :qid |funType:Thread__preFork|
 :pattern ( (Thread__preFork arg0@@29 arg1@@14))
))))
(assert (forall ((diz@@9 T@U) (p_1@@3 Real) ) (!  (=> (= (type diz@@9) RefType) (IsPredicateField (Thread__preFork diz@@9 p_1@@3)))
 :qid |stdinbpl.839:15|
 :skolemid |96|
 :pattern ( (Thread__preFork diz@@9 p_1@@3))
)))
(assert  (and (= (Ctor PredicateType_Thread__postJoinType) 18) (forall ((arg0@@30 T@U) (arg1@@15 Real) ) (! (= (type (Thread__postJoin arg0@@30 arg1@@15)) (FieldType PredicateType_Thread__postJoinType FrameTypeType))
 :qid |funType:Thread__postJoin|
 :pattern ( (Thread__postJoin arg0@@30 arg1@@15))
))))
(assert (forall ((diz@@10 T@U) (p_1@@4 Real) ) (!  (=> (= (type diz@@10) RefType) (IsPredicateField (Thread__postJoin diz@@10 p_1@@4)))
 :qid |stdinbpl.874:15|
 :skolemid |102|
 :pattern ( (Thread__postJoin diz@@10 p_1@@4))
)))
(assert  (and (= (Ctor PredicateType_Thread__joinToken_at_ThreadType) 19) (forall ((arg0@@31 T@U) (arg1@@16 Real) ) (! (= (type (Thread__joinToken_at_Thread arg0@@31 arg1@@16)) (FieldType PredicateType_Thread__joinToken_at_ThreadType FrameTypeType))
 :qid |funType:Thread__joinToken_at_Thread|
 :pattern ( (Thread__joinToken_at_Thread arg0@@31 arg1@@16))
))))
(assert (forall ((diz@@11 T@U) (p_1@@5 Real) ) (!  (=> (= (type diz@@11) RefType) (IsPredicateField (Thread__joinToken_at_Thread diz@@11 p_1@@5)))
 :qid |stdinbpl.909:15|
 :skolemid |108|
 :pattern ( (Thread__joinToken_at_Thread diz@@11 p_1@@5))
)))
(assert  (and (= (Ctor PredicateType_Thread__preFork_at_ThreadType) 20) (forall ((arg0@@32 T@U) (arg1@@17 Real) ) (! (= (type (Thread__preFork_at_Thread arg0@@32 arg1@@17)) (FieldType PredicateType_Thread__preFork_at_ThreadType FrameTypeType))
 :qid |funType:Thread__preFork_at_Thread|
 :pattern ( (Thread__preFork_at_Thread arg0@@32 arg1@@17))
))))
(assert (forall ((diz@@12 T@U) (p_1@@6 Real) ) (!  (=> (= (type diz@@12) RefType) (IsPredicateField (Thread__preFork_at_Thread diz@@12 p_1@@6)))
 :qid |stdinbpl.944:15|
 :skolemid |114|
 :pattern ( (Thread__preFork_at_Thread diz@@12 p_1@@6))
)))
(assert  (and (= (Ctor PredicateType_Thread__postJoin_at_ThreadType) 21) (forall ((arg0@@33 T@U) (arg1@@18 Real) ) (! (= (type (Thread__postJoin_at_Thread arg0@@33 arg1@@18)) (FieldType PredicateType_Thread__postJoin_at_ThreadType FrameTypeType))
 :qid |funType:Thread__postJoin_at_Thread|
 :pattern ( (Thread__postJoin_at_Thread arg0@@33 arg1@@18))
))))
(assert (forall ((diz@@13 T@U) (p_1@@7 Real) ) (!  (=> (= (type diz@@13) RefType) (IsPredicateField (Thread__postJoin_at_Thread diz@@13 p_1@@7)))
 :qid |stdinbpl.993:15|
 :skolemid |120|
 :pattern ( (Thread__postJoin_at_Thread diz@@13 p_1@@7))
)))
(assert  (and (= (Ctor PredicateType_Worker__joinTokenType) 22) (forall ((arg0@@34 T@U) (arg1@@19 Real) ) (! (= (type (Worker__joinToken arg0@@34 arg1@@19)) (FieldType PredicateType_Worker__joinTokenType FrameTypeType))
 :qid |funType:Worker__joinToken|
 :pattern ( (Worker__joinToken arg0@@34 arg1@@19))
))))
(assert (forall ((diz@@14 T@U) (p_1@@8 Real) ) (!  (=> (= (type diz@@14) RefType) (IsPredicateField (Worker__joinToken diz@@14 p_1@@8)))
 :qid |stdinbpl.1182:15|
 :skolemid |150|
 :pattern ( (Worker__joinToken diz@@14 p_1@@8))
)))
(assert  (and (= (Ctor PredicateType_Worker__joinToken_at_WorkerType) 23) (forall ((arg0@@35 T@U) (arg1@@20 Real) ) (! (= (type (Worker__joinToken_at_Worker arg0@@35 arg1@@20)) (FieldType PredicateType_Worker__joinToken_at_WorkerType FrameTypeType))
 :qid |funType:Worker__joinToken_at_Worker|
 :pattern ( (Worker__joinToken_at_Worker arg0@@35 arg1@@20))
))))
(assert (forall ((diz@@15 T@U) (p_1@@9 Real) ) (!  (=> (= (type diz@@15) RefType) (IsPredicateField (Worker__joinToken_at_Worker diz@@15 p_1@@9)))
 :qid |stdinbpl.1217:15|
 :skolemid |156|
 :pattern ( (Worker__joinToken_at_Worker diz@@15 p_1@@9))
)))
(assert  (and (= (Ctor PredicateType_Worker__preForkType) 24) (forall ((arg0@@36 T@U) (arg1@@21 Real) ) (! (= (type (Worker__preFork arg0@@36 arg1@@21)) (FieldType PredicateType_Worker__preForkType FrameTypeType))
 :qid |funType:Worker__preFork|
 :pattern ( (Worker__preFork arg0@@36 arg1@@21))
))))
(assert (forall ((diz@@16 T@U) (p_1@@10 Real) ) (!  (=> (= (type diz@@16) RefType) (IsPredicateField (Worker__preFork diz@@16 p_1@@10)))
 :qid |stdinbpl.1270:15|
 :skolemid |162|
 :pattern ( (Worker__preFork diz@@16 p_1@@10))
)))
(assert  (and (= (Ctor PredicateType_Worker__postJoinType) 25) (forall ((arg0@@37 T@U) (arg1@@22 Real) ) (! (= (type (Worker__postJoin arg0@@37 arg1@@22)) (FieldType PredicateType_Worker__postJoinType FrameTypeType))
 :qid |funType:Worker__postJoin|
 :pattern ( (Worker__postJoin arg0@@37 arg1@@22))
))))
(assert (forall ((diz@@17 T@U) (p_1@@11 Real) ) (!  (=> (= (type diz@@17) RefType) (IsPredicateField (Worker__postJoin diz@@17 p_1@@11)))
 :qid |stdinbpl.1305:15|
 :skolemid |168|
 :pattern ( (Worker__postJoin diz@@17 p_1@@11))
)))
(assert  (and (= (Ctor PredicateType_Worker__joinToken_at_ThreadType) 26) (forall ((arg0@@38 T@U) (arg1@@23 Real) ) (! (= (type (Worker__joinToken_at_Thread arg0@@38 arg1@@23)) (FieldType PredicateType_Worker__joinToken_at_ThreadType FrameTypeType))
 :qid |funType:Worker__joinToken_at_Thread|
 :pattern ( (Worker__joinToken_at_Thread arg0@@38 arg1@@23))
))))
(assert (forall ((diz@@18 T@U) (p_1@@12 Real) ) (!  (=> (= (type diz@@18) RefType) (IsPredicateField (Worker__joinToken_at_Thread diz@@18 p_1@@12)))
 :qid |stdinbpl.1340:15|
 :skolemid |174|
 :pattern ( (Worker__joinToken_at_Thread diz@@18 p_1@@12))
)))
(assert  (and (= (Ctor PredicateType_Worker__preFork_at_ThreadType) 27) (forall ((arg0@@39 T@U) (arg1@@24 Real) ) (! (= (type (Worker__preFork_at_Thread arg0@@39 arg1@@24)) (FieldType PredicateType_Worker__preFork_at_ThreadType FrameTypeType))
 :qid |funType:Worker__preFork_at_Thread|
 :pattern ( (Worker__preFork_at_Thread arg0@@39 arg1@@24))
))))
(assert (forall ((diz@@19 T@U) (p_1@@13 Real) ) (!  (=> (= (type diz@@19) RefType) (IsPredicateField (Worker__preFork_at_Thread diz@@19 p_1@@13)))
 :qid |stdinbpl.1375:15|
 :skolemid |180|
 :pattern ( (Worker__preFork_at_Thread diz@@19 p_1@@13))
)))
(assert  (and (= (Ctor PredicateType_Worker__postJoin_at_ThreadType) 28) (forall ((arg0@@40 T@U) (arg1@@25 Real) ) (! (= (type (Worker__postJoin_at_Thread arg0@@40 arg1@@25)) (FieldType PredicateType_Worker__postJoin_at_ThreadType FrameTypeType))
 :qid |funType:Worker__postJoin_at_Thread|
 :pattern ( (Worker__postJoin_at_Thread arg0@@40 arg1@@25))
))))
(assert (forall ((diz@@20 T@U) (p_1@@14 Real) ) (!  (=> (= (type diz@@20) RefType) (IsPredicateField (Worker__postJoin_at_Thread diz@@20 p_1@@14)))
 :qid |stdinbpl.1424:15|
 :skolemid |186|
 :pattern ( (Worker__postJoin_at_Thread diz@@20 p_1@@14))
)))
(assert  (and (= (Ctor PredicateType_Worker__preFork_at_WorkerType) 29) (forall ((arg0@@41 T@U) (arg1@@26 Real) ) (! (= (type (Worker__preFork_at_Worker arg0@@41 arg1@@26)) (FieldType PredicateType_Worker__preFork_at_WorkerType FrameTypeType))
 :qid |funType:Worker__preFork_at_Worker|
 :pattern ( (Worker__preFork_at_Worker arg0@@41 arg1@@26))
))))
(assert (forall ((diz@@21 T@U) (p_1@@15 Real) ) (!  (=> (= (type diz@@21) RefType) (IsPredicateField (Worker__preFork_at_Worker diz@@21 p_1@@15)))
 :qid |stdinbpl.1473:15|
 :skolemid |192|
 :pattern ( (Worker__preFork_at_Worker diz@@21 p_1@@15))
)))
(assert  (and (= (Ctor PredicateType_Worker__postJoin_at_WorkerType) 30) (forall ((arg0@@42 T@U) (arg1@@27 Real) ) (! (= (type (Worker__postJoin_at_Worker arg0@@42 arg1@@27)) (FieldType PredicateType_Worker__postJoin_at_WorkerType FrameTypeType))
 :qid |funType:Worker__postJoin_at_Worker|
 :pattern ( (Worker__postJoin_at_Worker arg0@@42 arg1@@27))
))))
(assert (forall ((diz@@22 T@U) (p_1@@16 Real) ) (!  (=> (= (type diz@@22) RefType) (IsPredicateField (Worker__postJoin_at_Worker diz@@22 p_1@@16)))
 :qid |stdinbpl.1572:15|
 :skolemid |198|
 :pattern ( (Worker__postJoin_at_Worker diz@@22 p_1@@16))
)))
(assert (forall ((Heap@@3 T@U) (diz@@23 T@U) (p_1@@17 Real) ) (!  (=> (and (= (type Heap@@3) (MapType0Type RefType)) (= (type diz@@23) RefType)) (|Thread__joinToken#everUsed| (Thread__joinToken diz@@23 p_1@@17)))
 :qid |stdinbpl.823:15|
 :skolemid |94|
 :pattern ( (|Thread__joinToken#trigger| Heap@@3 (Thread__joinToken diz@@23 p_1@@17)))
)))
(assert (forall ((Heap@@4 T@U) (diz@@24 T@U) (p_1@@18 Real) ) (!  (=> (and (= (type Heap@@4) (MapType0Type RefType)) (= (type diz@@24) RefType)) (|Thread__preFork#everUsed| (Thread__preFork diz@@24 p_1@@18)))
 :qid |stdinbpl.858:15|
 :skolemid |100|
 :pattern ( (|Thread__preFork#trigger| Heap@@4 (Thread__preFork diz@@24 p_1@@18)))
)))
(assert (forall ((Heap@@5 T@U) (diz@@25 T@U) (p_1@@19 Real) ) (!  (=> (and (= (type Heap@@5) (MapType0Type RefType)) (= (type diz@@25) RefType)) (|Thread__postJoin#everUsed| (Thread__postJoin diz@@25 p_1@@19)))
 :qid |stdinbpl.893:15|
 :skolemid |106|
 :pattern ( (|Thread__postJoin#trigger| Heap@@5 (Thread__postJoin diz@@25 p_1@@19)))
)))
(assert (forall ((Heap@@6 T@U) (diz@@26 T@U) (p_1@@20 Real) ) (!  (=> (and (= (type Heap@@6) (MapType0Type RefType)) (= (type diz@@26) RefType)) (|Thread__joinToken_at_Thread#everUsed| (Thread__joinToken_at_Thread diz@@26 p_1@@20)))
 :qid |stdinbpl.928:15|
 :skolemid |112|
 :pattern ( (|Thread__joinToken_at_Thread#trigger| Heap@@6 (Thread__joinToken_at_Thread diz@@26 p_1@@20)))
)))
(assert (forall ((Heap@@7 T@U) (diz@@27 T@U) (p_1@@21 Real) ) (!  (=> (and (= (type Heap@@7) (MapType0Type RefType)) (= (type diz@@27) RefType)) (|Thread__preFork_at_Thread#everUsed| (Thread__preFork_at_Thread diz@@27 p_1@@21)))
 :qid |stdinbpl.963:15|
 :skolemid |118|
 :pattern ( (|Thread__preFork_at_Thread#trigger| Heap@@7 (Thread__preFork_at_Thread diz@@27 p_1@@21)))
)))
(assert (forall ((Heap@@8 T@U) (diz@@28 T@U) (p_1@@22 Real) ) (!  (=> (and (= (type Heap@@8) (MapType0Type RefType)) (= (type diz@@28) RefType)) (|Thread__postJoin_at_Thread#everUsed| (Thread__postJoin_at_Thread diz@@28 p_1@@22)))
 :qid |stdinbpl.1012:15|
 :skolemid |124|
 :pattern ( (|Thread__postJoin_at_Thread#trigger| Heap@@8 (Thread__postJoin_at_Thread diz@@28 p_1@@22)))
)))
(assert (forall ((Heap@@9 T@U) (diz@@29 T@U) (p_1@@23 Real) ) (!  (=> (and (= (type Heap@@9) (MapType0Type RefType)) (= (type diz@@29) RefType)) (|Worker__joinToken#everUsed| (Worker__joinToken diz@@29 p_1@@23)))
 :qid |stdinbpl.1201:15|
 :skolemid |154|
 :pattern ( (|Worker__joinToken#trigger| Heap@@9 (Worker__joinToken diz@@29 p_1@@23)))
)))
(assert (forall ((Heap@@10 T@U) (diz@@30 T@U) (p_1@@24 Real) ) (!  (=> (and (= (type Heap@@10) (MapType0Type RefType)) (= (type diz@@30) RefType)) (|Worker__joinToken_at_Worker#everUsed| (Worker__joinToken_at_Worker diz@@30 p_1@@24)))
 :qid |stdinbpl.1236:15|
 :skolemid |160|
 :pattern ( (|Worker__joinToken_at_Worker#trigger| Heap@@10 (Worker__joinToken_at_Worker diz@@30 p_1@@24)))
)))
(assert (forall ((Heap@@11 T@U) (diz@@31 T@U) (p_1@@25 Real) ) (!  (=> (and (= (type Heap@@11) (MapType0Type RefType)) (= (type diz@@31) RefType)) (|Worker__preFork#everUsed| (Worker__preFork diz@@31 p_1@@25)))
 :qid |stdinbpl.1289:15|
 :skolemid |166|
 :pattern ( (|Worker__preFork#trigger| Heap@@11 (Worker__preFork diz@@31 p_1@@25)))
)))
(assert (forall ((Heap@@12 T@U) (diz@@32 T@U) (p_1@@26 Real) ) (!  (=> (and (= (type Heap@@12) (MapType0Type RefType)) (= (type diz@@32) RefType)) (|Worker__postJoin#everUsed| (Worker__postJoin diz@@32 p_1@@26)))
 :qid |stdinbpl.1324:15|
 :skolemid |172|
 :pattern ( (|Worker__postJoin#trigger| Heap@@12 (Worker__postJoin diz@@32 p_1@@26)))
)))
(assert (forall ((Heap@@13 T@U) (diz@@33 T@U) (p_1@@27 Real) ) (!  (=> (and (= (type Heap@@13) (MapType0Type RefType)) (= (type diz@@33) RefType)) (|Worker__joinToken_at_Thread#everUsed| (Worker__joinToken_at_Thread diz@@33 p_1@@27)))
 :qid |stdinbpl.1359:15|
 :skolemid |178|
 :pattern ( (|Worker__joinToken_at_Thread#trigger| Heap@@13 (Worker__joinToken_at_Thread diz@@33 p_1@@27)))
)))
(assert (forall ((Heap@@14 T@U) (diz@@34 T@U) (p_1@@28 Real) ) (!  (=> (and (= (type Heap@@14) (MapType0Type RefType)) (= (type diz@@34) RefType)) (|Worker__preFork_at_Thread#everUsed| (Worker__preFork_at_Thread diz@@34 p_1@@28)))
 :qid |stdinbpl.1394:15|
 :skolemid |184|
 :pattern ( (|Worker__preFork_at_Thread#trigger| Heap@@14 (Worker__preFork_at_Thread diz@@34 p_1@@28)))
)))
(assert (forall ((Heap@@15 T@U) (diz@@35 T@U) (p_1@@29 Real) ) (!  (=> (and (= (type Heap@@15) (MapType0Type RefType)) (= (type diz@@35) RefType)) (|Worker__postJoin_at_Thread#everUsed| (Worker__postJoin_at_Thread diz@@35 p_1@@29)))
 :qid |stdinbpl.1443:15|
 :skolemid |190|
 :pattern ( (|Worker__postJoin_at_Thread#trigger| Heap@@15 (Worker__postJoin_at_Thread diz@@35 p_1@@29)))
)))
(assert (forall ((Heap@@16 T@U) (diz@@36 T@U) (p_1@@30 Real) ) (!  (=> (and (= (type Heap@@16) (MapType0Type RefType)) (= (type diz@@36) RefType)) (|Worker__preFork_at_Worker#everUsed| (Worker__preFork_at_Worker diz@@36 p_1@@30)))
 :qid |stdinbpl.1492:15|
 :skolemid |196|
 :pattern ( (|Worker__preFork_at_Worker#trigger| Heap@@16 (Worker__preFork_at_Worker diz@@36 p_1@@30)))
)))
(assert (forall ((Heap@@17 T@U) (diz@@37 T@U) (p_1@@31 Real) ) (!  (=> (and (= (type Heap@@17) (MapType0Type RefType)) (= (type diz@@37) RefType)) (|Worker__postJoin_at_Worker#everUsed| (Worker__postJoin_at_Worker diz@@37 p_1@@31)))
 :qid |stdinbpl.1591:15|
 :skolemid |202|
 :pattern ( (|Worker__postJoin_at_Worker#trigger| Heap@@17 (Worker__postJoin_at_Worker diz@@37 p_1@@31)))
)))
(assert  (and (= (type null) RefType) (forall ((arg0@@43 T@U) ) (! (let ((A (FieldTypeInv0 (type arg0@@43))))
(= (type (PredicateMaskField arg0@@43)) (FieldType A (MapType1Type RefType boolType))))
 :qid |funType:PredicateMaskField|
 :pattern ( (PredicateMaskField arg0@@43))
))))
(assert (forall ((Heap@@18 T@U) (ExhaleHeap T@U) (Mask@@0 T@U) (pm_f T@U) ) (! (let ((C (FieldTypeInv0 (type pm_f))))
 (=> (and (and (and (and (and (= (type Heap@@18) (MapType0Type RefType)) (= (type ExhaleHeap) (MapType0Type RefType))) (= (type Mask@@0) (MapType1Type RefType realType))) (= (type pm_f) (FieldType C FrameTypeType))) (IdenticalOnKnownLocations Heap@@18 ExhaleHeap Mask@@0)) (and (HasDirectPerm Mask@@0 null pm_f) (IsPredicateField pm_f))) (= (MapType0Select Heap@@18 null (PredicateMaskField pm_f)) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))))
 :qid |stdinbpl.47:19|
 :skolemid |2|
 :pattern ( (IdenticalOnKnownLocations Heap@@18 ExhaleHeap Mask@@0) (IsPredicateField pm_f) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))
)))
(assert (forall ((arg0@@44 T@U) ) (! (let ((A@@0 (FieldTypeInv0 (type arg0@@44))))
(= (type (WandMaskField arg0@@44)) (FieldType A@@0 (MapType1Type RefType boolType))))
 :qid |funType:WandMaskField|
 :pattern ( (WandMaskField arg0@@44))
)))
(assert (forall ((Heap@@19 T@U) (ExhaleHeap@@0 T@U) (Mask@@1 T@U) (pm_f@@0 T@U) ) (! (let ((C@@0 (FieldTypeInv0 (type pm_f@@0))))
 (=> (and (and (and (and (and (= (type Heap@@19) (MapType0Type RefType)) (= (type ExhaleHeap@@0) (MapType0Type RefType))) (= (type Mask@@1) (MapType1Type RefType realType))) (= (type pm_f@@0) (FieldType C@@0 FrameTypeType))) (IdenticalOnKnownLocations Heap@@19 ExhaleHeap@@0 Mask@@1)) (and (HasDirectPerm Mask@@1 null pm_f@@0) (IsWandField pm_f@@0))) (= (MapType0Select Heap@@19 null (WandMaskField pm_f@@0)) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))))
 :qid |stdinbpl.60:19|
 :skolemid |5|
 :pattern ( (IdenticalOnKnownLocations Heap@@19 ExhaleHeap@@0 Mask@@1) (IsWandField pm_f@@0) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))
)))
(assert  (and (= (Ctor PredicateType_History__invType) 31) (forall ((arg0@@45 T@U) ) (! (= (type (History__inv arg0@@45)) (FieldType PredicateType_History__invType FrameTypeType))
 :qid |funType:History__inv|
 :pattern ( (History__inv arg0@@45))
))))
(assert (forall ((diz@@38 T@U) ) (!  (=> (= (type diz@@38) RefType) (IsPredicateField (History__inv diz@@38)))
 :qid |stdinbpl.468:15|
 :skolemid |42|
 :pattern ( (History__inv diz@@38))
)))
(assert  (and (= (Ctor PredicateType_SubjectLock__invType) 32) (forall ((arg0@@46 T@U) ) (! (= (type (SubjectLock__inv arg0@@46)) (FieldType PredicateType_SubjectLock__invType FrameTypeType))
 :qid |funType:SubjectLock__inv|
 :pattern ( (SubjectLock__inv arg0@@46))
))))
(assert (forall ((diz@@39 T@U) ) (!  (=> (= (type diz@@39) RefType) (IsPredicateField (SubjectLock__inv diz@@39)))
 :qid |stdinbpl.601:15|
 :skolemid |60|
 :pattern ( (SubjectLock__inv diz@@39))
)))
(assert  (and (= (Ctor PredicateType_SubjectLock__validType) 33) (forall ((arg0@@47 T@U) ) (! (= (type (SubjectLock__valid arg0@@47)) (FieldType PredicateType_SubjectLock__validType FrameTypeType))
 :qid |funType:SubjectLock__valid|
 :pattern ( (SubjectLock__valid arg0@@47))
))))
(assert (forall ((diz@@40 T@U) ) (!  (=> (= (type diz@@40) RefType) (IsPredicateField (SubjectLock__valid diz@@40)))
 :qid |stdinbpl.664:15|
 :skolemid |66|
 :pattern ( (SubjectLock__valid diz@@40))
)))
(assert  (and (= (Ctor PredicateType_Thread__is_a_ThreadType) 34) (forall ((arg0@@48 T@U) ) (! (= (type (Thread__is_a_Thread arg0@@48)) (FieldType PredicateType_Thread__is_a_ThreadType FrameTypeType))
 :qid |funType:Thread__is_a_Thread|
 :pattern ( (Thread__is_a_Thread arg0@@48))
))))
(assert (forall ((diz@@41 T@U) ) (!  (=> (= (type diz@@41) RefType) (IsPredicateField (Thread__is_a_Thread diz@@41)))
 :qid |stdinbpl.734:15|
 :skolemid |78|
 :pattern ( (Thread__is_a_Thread diz@@41))
)))
(assert  (and (= (Ctor PredicateType_Thread__instance_of_ThreadType) 35) (forall ((arg0@@49 T@U) ) (! (= (type (Thread__instance_of_Thread arg0@@49)) (FieldType PredicateType_Thread__instance_of_ThreadType FrameTypeType))
 :qid |funType:Thread__instance_of_Thread|
 :pattern ( (Thread__instance_of_Thread arg0@@49))
))))
(assert (forall ((diz@@42 T@U) ) (!  (=> (= (type diz@@42) RefType) (IsPredicateField (Thread__instance_of_Thread diz@@42)))
 :qid |stdinbpl.769:15|
 :skolemid |84|
 :pattern ( (Thread__instance_of_Thread diz@@42))
)))
(assert  (and (= (Ctor PredicateType_Worker__is_a_WorkerType) 36) (forall ((arg0@@50 T@U) ) (! (= (type (Worker__is_a_Worker arg0@@50)) (FieldType PredicateType_Worker__is_a_WorkerType FrameTypeType))
 :qid |funType:Worker__is_a_Worker|
 :pattern ( (Worker__is_a_Worker arg0@@50))
))))
(assert (forall ((diz@@43 T@U) ) (!  (=> (= (type diz@@43) RefType) (IsPredicateField (Worker__is_a_Worker diz@@43)))
 :qid |stdinbpl.1042:15|
 :skolemid |126|
 :pattern ( (Worker__is_a_Worker diz@@43))
)))
(assert  (and (= (Ctor PredicateType_Worker__instance_of_WorkerType) 37) (forall ((arg0@@51 T@U) ) (! (= (type (Worker__instance_of_Worker arg0@@51)) (FieldType PredicateType_Worker__instance_of_WorkerType FrameTypeType))
 :qid |funType:Worker__instance_of_Worker|
 :pattern ( (Worker__instance_of_Worker arg0@@51))
))))
(assert (forall ((diz@@44 T@U) ) (!  (=> (= (type diz@@44) RefType) (IsPredicateField (Worker__instance_of_Worker diz@@44)))
 :qid |stdinbpl.1077:15|
 :skolemid |132|
 :pattern ( (Worker__instance_of_Worker diz@@44))
)))
(assert  (and (= (Ctor PredicateType_Worker__is_a_ThreadType) 38) (forall ((arg0@@52 T@U) ) (! (= (type (Worker__is_a_Thread arg0@@52)) (FieldType PredicateType_Worker__is_a_ThreadType FrameTypeType))
 :qid |funType:Worker__is_a_Thread|
 :pattern ( (Worker__is_a_Thread arg0@@52))
))))
(assert (forall ((diz@@45 T@U) ) (!  (=> (= (type diz@@45) RefType) (IsPredicateField (Worker__is_a_Thread diz@@45)))
 :qid |stdinbpl.1112:15|
 :skolemid |138|
 :pattern ( (Worker__is_a_Thread diz@@45))
)))
(assert  (and (= (Ctor PredicateType_Worker__instance_of_ThreadType) 39) (forall ((arg0@@53 T@U) ) (! (= (type (Worker__instance_of_Thread arg0@@53)) (FieldType PredicateType_Worker__instance_of_ThreadType FrameTypeType))
 :qid |funType:Worker__instance_of_Thread|
 :pattern ( (Worker__instance_of_Thread arg0@@53))
))))
(assert (forall ((diz@@46 T@U) ) (!  (=> (= (type diz@@46) RefType) (IsPredicateField (Worker__instance_of_Thread diz@@46)))
 :qid |stdinbpl.1147:15|
 :skolemid |144|
 :pattern ( (Worker__instance_of_Thread diz@@46))
)))
(assert (forall ((Heap@@20 T@U) (diz@@47 T@U) ) (!  (=> (and (= (type Heap@@20) (MapType0Type RefType)) (= (type diz@@47) RefType)) (dummyFunction (int_2_U (|History__free_get_x#triggerStateless| diz@@47))))
 :qid |stdinbpl.332:15|
 :skolemid |34|
 :pattern ( (|History__free_get_x'| Heap@@20 diz@@47))
)))
(assert (forall ((Heap@@21 T@U) (diz@@48 T@U) ) (!  (=> (and (= (type Heap@@21) (MapType0Type RefType)) (= (type diz@@48) RefType)) (dummyFunction (int_2_U (|History__hist_get_x#triggerStateless| diz@@48))))
 :qid |stdinbpl.400:15|
 :skolemid |38|
 :pattern ( (|History__hist_get_x'| Heap@@21 diz@@48))
)))
(assert (forall ((Heap@@22 T@U) (diz@@49 T@U) ) (!  (=> (and (= (type Heap@@22) (MapType0Type RefType)) (= (type diz@@49) RefType)) (|History__inv#everUsed| (History__inv diz@@49)))
 :qid |stdinbpl.487:15|
 :skolemid |46|
 :pattern ( (|History__inv#trigger| Heap@@22 (History__inv diz@@49)))
)))
(assert (forall ((Heap@@23 T@U) (diz@@50 T@U) ) (!  (=> (and (= (type Heap@@23) (MapType0Type RefType)) (= (type diz@@50) RefType)) (|SubjectLock__inv#everUsed| (SubjectLock__inv diz@@50)))
 :qid |stdinbpl.620:15|
 :skolemid |64|
 :pattern ( (|SubjectLock__inv#trigger| Heap@@23 (SubjectLock__inv diz@@50)))
)))
(assert (forall ((Heap@@24 T@U) (diz@@51 T@U) ) (!  (=> (and (= (type Heap@@24) (MapType0Type RefType)) (= (type diz@@51) RefType)) (|SubjectLock__valid#everUsed| (SubjectLock__valid diz@@51)))
 :qid |stdinbpl.683:15|
 :skolemid |70|
 :pattern ( (|SubjectLock__valid#trigger| Heap@@24 (SubjectLock__valid diz@@51)))
)))
(assert (forall ((Heap@@25 T@U) (diz@@52 T@U) ) (!  (=> (and (= (type Heap@@25) (MapType0Type RefType)) (= (type diz@@52) RefType)) (|Thread__is_a_Thread#everUsed| (Thread__is_a_Thread diz@@52)))
 :qid |stdinbpl.753:15|
 :skolemid |82|
 :pattern ( (|Thread__is_a_Thread#trigger| Heap@@25 (Thread__is_a_Thread diz@@52)))
)))
(assert (forall ((Heap@@26 T@U) (diz@@53 T@U) ) (!  (=> (and (= (type Heap@@26) (MapType0Type RefType)) (= (type diz@@53) RefType)) (|Thread__instance_of_Thread#everUsed| (Thread__instance_of_Thread diz@@53)))
 :qid |stdinbpl.788:15|
 :skolemid |88|
 :pattern ( (|Thread__instance_of_Thread#trigger| Heap@@26 (Thread__instance_of_Thread diz@@53)))
)))
(assert (forall ((Heap@@27 T@U) (diz@@54 T@U) ) (!  (=> (and (= (type Heap@@27) (MapType0Type RefType)) (= (type diz@@54) RefType)) (|Worker__is_a_Worker#everUsed| (Worker__is_a_Worker diz@@54)))
 :qid |stdinbpl.1061:15|
 :skolemid |130|
 :pattern ( (|Worker__is_a_Worker#trigger| Heap@@27 (Worker__is_a_Worker diz@@54)))
)))
(assert (forall ((Heap@@28 T@U) (diz@@55 T@U) ) (!  (=> (and (= (type Heap@@28) (MapType0Type RefType)) (= (type diz@@55) RefType)) (|Worker__instance_of_Worker#everUsed| (Worker__instance_of_Worker diz@@55)))
 :qid |stdinbpl.1096:15|
 :skolemid |136|
 :pattern ( (|Worker__instance_of_Worker#trigger| Heap@@28 (Worker__instance_of_Worker diz@@55)))
)))
(assert (forall ((Heap@@29 T@U) (diz@@56 T@U) ) (!  (=> (and (= (type Heap@@29) (MapType0Type RefType)) (= (type diz@@56) RefType)) (|Worker__is_a_Thread#everUsed| (Worker__is_a_Thread diz@@56)))
 :qid |stdinbpl.1131:15|
 :skolemid |142|
 :pattern ( (|Worker__is_a_Thread#trigger| Heap@@29 (Worker__is_a_Thread diz@@56)))
)))
(assert (forall ((Heap@@30 T@U) (diz@@57 T@U) ) (!  (=> (and (= (type Heap@@30) (MapType0Type RefType)) (= (type diz@@57) RefType)) (|Worker__instance_of_Thread#everUsed| (Worker__instance_of_Thread diz@@57)))
 :qid |stdinbpl.1166:15|
 :skolemid |148|
 :pattern ( (|Worker__instance_of_Thread#trigger| Heap@@30 (Worker__instance_of_Thread diz@@57)))
)))
(assert (forall ((arg0@@54 T@U) (arg1@@28 Real) (arg2@@6 T@U) ) (! (= (type (|History__hist_do_incr#sm| arg0@@54 arg1@@28 arg2@@6)) (FieldType PredicateType_History__hist_do_incrType (MapType1Type RefType boolType)))
 :qid |funType:History__hist_do_incr#sm|
 :pattern ( (|History__hist_do_incr#sm| arg0@@54 arg1@@28 arg2@@6))
)))
(assert (forall ((diz@@58 T@U) (frac@@5 Real) (proc@@5 T@U) ) (!  (=> (and (= (type diz@@58) RefType) (= (type proc@@5) ProcessDomainTypeType)) (= (PredicateMaskField (History__hist_do_incr diz@@58 frac@@5 proc@@5)) (|History__hist_do_incr#sm| diz@@58 frac@@5 proc@@5)))
 :qid |stdinbpl.527:15|
 :skolemid |47|
 :pattern ( (PredicateMaskField (History__hist_do_incr diz@@58 frac@@5 proc@@5)))
)))
(assert (forall ((arg0@@55 T@U) (arg1@@29 Real) (arg2@@7 T@U) ) (! (= (type (|History__hist_idle#sm| arg0@@55 arg1@@29 arg2@@7)) (FieldType PredicateType_History__hist_idleType (MapType1Type RefType boolType)))
 :qid |funType:History__hist_idle#sm|
 :pattern ( (|History__hist_idle#sm| arg0@@55 arg1@@29 arg2@@7))
)))
(assert (forall ((diz@@59 T@U) (frac@@6 Real) (proc@@6 T@U) ) (!  (=> (and (= (type diz@@59) RefType) (= (type proc@@6) ProcessDomainTypeType)) (= (PredicateMaskField (History__hist_idle diz@@59 frac@@6 proc@@6)) (|History__hist_idle#sm| diz@@59 frac@@6 proc@@6)))
 :qid |stdinbpl.562:15|
 :skolemid |53|
 :pattern ( (PredicateMaskField (History__hist_idle diz@@59 frac@@6 proc@@6)))
)))
(assert (forall ((arg0@@56 T@U) (arg1@@30 Real) (arg2@@8 Int) ) (! (= (type (|SubjectLock__locked#sm| arg0@@56 arg1@@30 arg2@@8)) (FieldType PredicateType_SubjectLock__lockedType (MapType1Type RefType boolType)))
 :qid |funType:SubjectLock__locked#sm|
 :pattern ( (|SubjectLock__locked#sm| arg0@@56 arg1@@30 arg2@@8))
)))
(assert (forall ((diz@@60 T@U) (p_1@@32 Real) (count@@2 Int) ) (!  (=> (= (type diz@@60) RefType) (= (PredicateMaskField (SubjectLock__locked diz@@60 p_1@@32 count@@2)) (|SubjectLock__locked#sm| diz@@60 p_1@@32 count@@2)))
 :qid |stdinbpl.695:15|
 :skolemid |71|
 :pattern ( (PredicateMaskField (SubjectLock__locked diz@@60 p_1@@32 count@@2)))
)))
(assert (forall ((Heap@@31 T@U) (ExhaleHeap@@1 T@U) (Mask@@2 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@31) (MapType0Type RefType)) (= (type ExhaleHeap@@1) (MapType0Type RefType))) (= (type Mask@@2) (MapType1Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@31 ExhaleHeap@@1 Mask@@2)) (U_2_bool (MapType0Select Heap@@31 o_1 $allocated))) (U_2_bool (MapType0Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.73:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@31 ExhaleHeap@@1 Mask@@2) (MapType0Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert (forall ((Heap@@32 T@U) (diz@@61 T@U) ) (!  (=> (and (= (type Heap@@32) (MapType0Type RefType)) (= (type diz@@61) RefType)) (and (= (History__free_get_x Heap@@32 diz@@61) (|History__free_get_x'| Heap@@32 diz@@61)) (dummyFunction (int_2_U (|History__free_get_x#triggerStateless| diz@@61)))))
 :qid |stdinbpl.328:15|
 :skolemid |33|
 :pattern ( (History__free_get_x Heap@@32 diz@@61))
)))
(assert (forall ((Heap@@33 T@U) (diz@@62 T@U) ) (!  (=> (and (= (type Heap@@33) (MapType0Type RefType)) (= (type diz@@62) RefType)) (and (= (History__hist_get_x Heap@@33 diz@@62) (|History__hist_get_x'| Heap@@33 diz@@62)) (dummyFunction (int_2_U (|History__hist_get_x#triggerStateless| diz@@62)))))
 :qid |stdinbpl.396:15|
 :skolemid |37|
 :pattern ( (History__hist_get_x Heap@@33 diz@@62))
)))
(assert (forall ((diz@@63 T@U) (frac@@7 Real) (proc@@7 T@U) (diz2 T@U) (frac2 Real) (proc2 T@U) ) (!  (=> (and (and (and (and (= (type diz@@63) RefType) (= (type proc@@7) ProcessDomainTypeType)) (= (type diz2) RefType)) (= (type proc2) ProcessDomainTypeType)) (= (History__hist_do_incr diz@@63 frac@@7 proc@@7) (History__hist_do_incr diz2 frac2 proc2))) (and (= diz@@63 diz2) (and (= frac@@7 frac2) (= proc@@7 proc2))))
 :qid |stdinbpl.541:15|
 :skolemid |50|
 :pattern ( (History__hist_do_incr diz@@63 frac@@7 proc@@7) (History__hist_do_incr diz2 frac2 proc2))
)))
(assert (forall ((diz@@64 T@U) (frac@@8 Real) (proc@@8 T@U) (diz2@@0 T@U) (frac2@@0 Real) (proc2@@0 T@U) ) (!  (=> (and (and (and (and (= (type diz@@64) RefType) (= (type proc@@8) ProcessDomainTypeType)) (= (type diz2@@0) RefType)) (= (type proc2@@0) ProcessDomainTypeType)) (= (|History__hist_do_incr#sm| diz@@64 frac@@8 proc@@8) (|History__hist_do_incr#sm| diz2@@0 frac2@@0 proc2@@0))) (and (= diz@@64 diz2@@0) (and (= frac@@8 frac2@@0) (= proc@@8 proc2@@0))))
 :qid |stdinbpl.545:15|
 :skolemid |51|
 :pattern ( (|History__hist_do_incr#sm| diz@@64 frac@@8 proc@@8) (|History__hist_do_incr#sm| diz2@@0 frac2@@0 proc2@@0))
)))
(assert (forall ((diz@@65 T@U) (frac@@9 Real) (proc@@9 T@U) (diz2@@1 T@U) (frac2@@1 Real) (proc2@@1 T@U) ) (!  (=> (and (and (and (and (= (type diz@@65) RefType) (= (type proc@@9) ProcessDomainTypeType)) (= (type diz2@@1) RefType)) (= (type proc2@@1) ProcessDomainTypeType)) (= (History__hist_idle diz@@65 frac@@9 proc@@9) (History__hist_idle diz2@@1 frac2@@1 proc2@@1))) (and (= diz@@65 diz2@@1) (and (= frac@@9 frac2@@1) (= proc@@9 proc2@@1))))
 :qid |stdinbpl.576:15|
 :skolemid |56|
 :pattern ( (History__hist_idle diz@@65 frac@@9 proc@@9) (History__hist_idle diz2@@1 frac2@@1 proc2@@1))
)))
(assert (forall ((diz@@66 T@U) (frac@@10 Real) (proc@@10 T@U) (diz2@@2 T@U) (frac2@@2 Real) (proc2@@2 T@U) ) (!  (=> (and (and (and (and (= (type diz@@66) RefType) (= (type proc@@10) ProcessDomainTypeType)) (= (type diz2@@2) RefType)) (= (type proc2@@2) ProcessDomainTypeType)) (= (|History__hist_idle#sm| diz@@66 frac@@10 proc@@10) (|History__hist_idle#sm| diz2@@2 frac2@@2 proc2@@2))) (and (= diz@@66 diz2@@2) (and (= frac@@10 frac2@@2) (= proc@@10 proc2@@2))))
 :qid |stdinbpl.580:15|
 :skolemid |57|
 :pattern ( (|History__hist_idle#sm| diz@@66 frac@@10 proc@@10) (|History__hist_idle#sm| diz2@@2 frac2@@2 proc2@@2))
)))
(assert (forall ((diz@@67 T@U) (p_1@@33 Real) (count@@3 Int) (diz2@@3 T@U) (p2_1 Real) (count2 Int) ) (!  (=> (and (and (= (type diz@@67) RefType) (= (type diz2@@3) RefType)) (= (SubjectLock__locked diz@@67 p_1@@33 count@@3) (SubjectLock__locked diz2@@3 p2_1 count2))) (and (= diz@@67 diz2@@3) (and (= p_1@@33 p2_1) (= count@@3 count2))))
 :qid |stdinbpl.709:15|
 :skolemid |74|
 :pattern ( (SubjectLock__locked diz@@67 p_1@@33 count@@3) (SubjectLock__locked diz2@@3 p2_1 count2))
)))
(assert (forall ((diz@@68 T@U) (p_1@@34 Real) (count@@4 Int) (diz2@@4 T@U) (p2_1@@0 Real) (count2@@0 Int) ) (!  (=> (and (and (= (type diz@@68) RefType) (= (type diz2@@4) RefType)) (= (|SubjectLock__locked#sm| diz@@68 p_1@@34 count@@4) (|SubjectLock__locked#sm| diz2@@4 p2_1@@0 count2@@0))) (and (= diz@@68 diz2@@4) (and (= p_1@@34 p2_1@@0) (= count@@4 count2@@0))))
 :qid |stdinbpl.713:15|
 :skolemid |75|
 :pattern ( (|SubjectLock__locked#sm| diz@@68 p_1@@34 count@@4) (|SubjectLock__locked#sm| diz2@@4 p2_1@@0 count2@@0))
)))
(assert (forall ((diz@@69 T@U) (p_1@@35 Real) (diz2@@5 T@U) (p2_1@@1 Real) ) (!  (=> (and (and (= (type diz@@69) RefType) (= (type diz2@@5) RefType)) (= (Thread__joinToken diz@@69 p_1@@35) (Thread__joinToken diz2@@5 p2_1@@1))) (and (= diz@@69 diz2@@5) (= p_1@@35 p2_1@@1)))
 :qid |stdinbpl.814:15|
 :skolemid |92|
 :pattern ( (Thread__joinToken diz@@69 p_1@@35) (Thread__joinToken diz2@@5 p2_1@@1))
)))
(assert (forall ((arg0@@57 T@U) (arg1@@31 Real) ) (! (= (type (|Thread__joinToken#sm| arg0@@57 arg1@@31)) (FieldType PredicateType_Thread__joinTokenType (MapType1Type RefType boolType)))
 :qid |funType:Thread__joinToken#sm|
 :pattern ( (|Thread__joinToken#sm| arg0@@57 arg1@@31))
)))
(assert (forall ((diz@@70 T@U) (p_1@@36 Real) (diz2@@6 T@U) (p2_1@@2 Real) ) (!  (=> (and (and (= (type diz@@70) RefType) (= (type diz2@@6) RefType)) (= (|Thread__joinToken#sm| diz@@70 p_1@@36) (|Thread__joinToken#sm| diz2@@6 p2_1@@2))) (and (= diz@@70 diz2@@6) (= p_1@@36 p2_1@@2)))
 :qid |stdinbpl.818:15|
 :skolemid |93|
 :pattern ( (|Thread__joinToken#sm| diz@@70 p_1@@36) (|Thread__joinToken#sm| diz2@@6 p2_1@@2))
)))
(assert (forall ((diz@@71 T@U) (p_1@@37 Real) (diz2@@7 T@U) (p2_1@@3 Real) ) (!  (=> (and (and (= (type diz@@71) RefType) (= (type diz2@@7) RefType)) (= (Thread__preFork diz@@71 p_1@@37) (Thread__preFork diz2@@7 p2_1@@3))) (and (= diz@@71 diz2@@7) (= p_1@@37 p2_1@@3)))
 :qid |stdinbpl.849:15|
 :skolemid |98|
 :pattern ( (Thread__preFork diz@@71 p_1@@37) (Thread__preFork diz2@@7 p2_1@@3))
)))
(assert (forall ((arg0@@58 T@U) (arg1@@32 Real) ) (! (= (type (|Thread__preFork#sm| arg0@@58 arg1@@32)) (FieldType PredicateType_Thread__preForkType (MapType1Type RefType boolType)))
 :qid |funType:Thread__preFork#sm|
 :pattern ( (|Thread__preFork#sm| arg0@@58 arg1@@32))
)))
(assert (forall ((diz@@72 T@U) (p_1@@38 Real) (diz2@@8 T@U) (p2_1@@4 Real) ) (!  (=> (and (and (= (type diz@@72) RefType) (= (type diz2@@8) RefType)) (= (|Thread__preFork#sm| diz@@72 p_1@@38) (|Thread__preFork#sm| diz2@@8 p2_1@@4))) (and (= diz@@72 diz2@@8) (= p_1@@38 p2_1@@4)))
 :qid |stdinbpl.853:15|
 :skolemid |99|
 :pattern ( (|Thread__preFork#sm| diz@@72 p_1@@38) (|Thread__preFork#sm| diz2@@8 p2_1@@4))
)))
(assert (forall ((diz@@73 T@U) (p_1@@39 Real) (diz2@@9 T@U) (p2_1@@5 Real) ) (!  (=> (and (and (= (type diz@@73) RefType) (= (type diz2@@9) RefType)) (= (Thread__postJoin diz@@73 p_1@@39) (Thread__postJoin diz2@@9 p2_1@@5))) (and (= diz@@73 diz2@@9) (= p_1@@39 p2_1@@5)))
 :qid |stdinbpl.884:15|
 :skolemid |104|
 :pattern ( (Thread__postJoin diz@@73 p_1@@39) (Thread__postJoin diz2@@9 p2_1@@5))
)))
(assert (forall ((arg0@@59 T@U) (arg1@@33 Real) ) (! (= (type (|Thread__postJoin#sm| arg0@@59 arg1@@33)) (FieldType PredicateType_Thread__postJoinType (MapType1Type RefType boolType)))
 :qid |funType:Thread__postJoin#sm|
 :pattern ( (|Thread__postJoin#sm| arg0@@59 arg1@@33))
)))
(assert (forall ((diz@@74 T@U) (p_1@@40 Real) (diz2@@10 T@U) (p2_1@@6 Real) ) (!  (=> (and (and (= (type diz@@74) RefType) (= (type diz2@@10) RefType)) (= (|Thread__postJoin#sm| diz@@74 p_1@@40) (|Thread__postJoin#sm| diz2@@10 p2_1@@6))) (and (= diz@@74 diz2@@10) (= p_1@@40 p2_1@@6)))
 :qid |stdinbpl.888:15|
 :skolemid |105|
 :pattern ( (|Thread__postJoin#sm| diz@@74 p_1@@40) (|Thread__postJoin#sm| diz2@@10 p2_1@@6))
)))
(assert (forall ((diz@@75 T@U) (p_1@@41 Real) (diz2@@11 T@U) (p2_1@@7 Real) ) (!  (=> (and (and (= (type diz@@75) RefType) (= (type diz2@@11) RefType)) (= (Thread__joinToken_at_Thread diz@@75 p_1@@41) (Thread__joinToken_at_Thread diz2@@11 p2_1@@7))) (and (= diz@@75 diz2@@11) (= p_1@@41 p2_1@@7)))
 :qid |stdinbpl.919:15|
 :skolemid |110|
 :pattern ( (Thread__joinToken_at_Thread diz@@75 p_1@@41) (Thread__joinToken_at_Thread diz2@@11 p2_1@@7))
)))
(assert (forall ((arg0@@60 T@U) (arg1@@34 Real) ) (! (= (type (|Thread__joinToken_at_Thread#sm| arg0@@60 arg1@@34)) (FieldType PredicateType_Thread__joinToken_at_ThreadType (MapType1Type RefType boolType)))
 :qid |funType:Thread__joinToken_at_Thread#sm|
 :pattern ( (|Thread__joinToken_at_Thread#sm| arg0@@60 arg1@@34))
)))
(assert (forall ((diz@@76 T@U) (p_1@@42 Real) (diz2@@12 T@U) (p2_1@@8 Real) ) (!  (=> (and (and (= (type diz@@76) RefType) (= (type diz2@@12) RefType)) (= (|Thread__joinToken_at_Thread#sm| diz@@76 p_1@@42) (|Thread__joinToken_at_Thread#sm| diz2@@12 p2_1@@8))) (and (= diz@@76 diz2@@12) (= p_1@@42 p2_1@@8)))
 :qid |stdinbpl.923:15|
 :skolemid |111|
 :pattern ( (|Thread__joinToken_at_Thread#sm| diz@@76 p_1@@42) (|Thread__joinToken_at_Thread#sm| diz2@@12 p2_1@@8))
)))
(assert (forall ((diz@@77 T@U) (p_1@@43 Real) (diz2@@13 T@U) (p2_1@@9 Real) ) (!  (=> (and (and (= (type diz@@77) RefType) (= (type diz2@@13) RefType)) (= (Thread__preFork_at_Thread diz@@77 p_1@@43) (Thread__preFork_at_Thread diz2@@13 p2_1@@9))) (and (= diz@@77 diz2@@13) (= p_1@@43 p2_1@@9)))
 :qid |stdinbpl.954:15|
 :skolemid |116|
 :pattern ( (Thread__preFork_at_Thread diz@@77 p_1@@43) (Thread__preFork_at_Thread diz2@@13 p2_1@@9))
)))
(assert (forall ((arg0@@61 T@U) (arg1@@35 Real) ) (! (= (type (|Thread__preFork_at_Thread#sm| arg0@@61 arg1@@35)) (FieldType PredicateType_Thread__preFork_at_ThreadType (MapType1Type RefType boolType)))
 :qid |funType:Thread__preFork_at_Thread#sm|
 :pattern ( (|Thread__preFork_at_Thread#sm| arg0@@61 arg1@@35))
)))
(assert (forall ((diz@@78 T@U) (p_1@@44 Real) (diz2@@14 T@U) (p2_1@@10 Real) ) (!  (=> (and (and (= (type diz@@78) RefType) (= (type diz2@@14) RefType)) (= (|Thread__preFork_at_Thread#sm| diz@@78 p_1@@44) (|Thread__preFork_at_Thread#sm| diz2@@14 p2_1@@10))) (and (= diz@@78 diz2@@14) (= p_1@@44 p2_1@@10)))
 :qid |stdinbpl.958:15|
 :skolemid |117|
 :pattern ( (|Thread__preFork_at_Thread#sm| diz@@78 p_1@@44) (|Thread__preFork_at_Thread#sm| diz2@@14 p2_1@@10))
)))
(assert (forall ((diz@@79 T@U) (p_1@@45 Real) (diz2@@15 T@U) (p2_1@@11 Real) ) (!  (=> (and (and (= (type diz@@79) RefType) (= (type diz2@@15) RefType)) (= (Thread__postJoin_at_Thread diz@@79 p_1@@45) (Thread__postJoin_at_Thread diz2@@15 p2_1@@11))) (and (= diz@@79 diz2@@15) (= p_1@@45 p2_1@@11)))
 :qid |stdinbpl.1003:15|
 :skolemid |122|
 :pattern ( (Thread__postJoin_at_Thread diz@@79 p_1@@45) (Thread__postJoin_at_Thread diz2@@15 p2_1@@11))
)))
(assert (forall ((arg0@@62 T@U) (arg1@@36 Real) ) (! (= (type (|Thread__postJoin_at_Thread#sm| arg0@@62 arg1@@36)) (FieldType PredicateType_Thread__postJoin_at_ThreadType (MapType1Type RefType boolType)))
 :qid |funType:Thread__postJoin_at_Thread#sm|
 :pattern ( (|Thread__postJoin_at_Thread#sm| arg0@@62 arg1@@36))
)))
(assert (forall ((diz@@80 T@U) (p_1@@46 Real) (diz2@@16 T@U) (p2_1@@12 Real) ) (!  (=> (and (and (= (type diz@@80) RefType) (= (type diz2@@16) RefType)) (= (|Thread__postJoin_at_Thread#sm| diz@@80 p_1@@46) (|Thread__postJoin_at_Thread#sm| diz2@@16 p2_1@@12))) (and (= diz@@80 diz2@@16) (= p_1@@46 p2_1@@12)))
 :qid |stdinbpl.1007:15|
 :skolemid |123|
 :pattern ( (|Thread__postJoin_at_Thread#sm| diz@@80 p_1@@46) (|Thread__postJoin_at_Thread#sm| diz2@@16 p2_1@@12))
)))
(assert (forall ((diz@@81 T@U) (p_1@@47 Real) (diz2@@17 T@U) (p2_1@@13 Real) ) (!  (=> (and (and (= (type diz@@81) RefType) (= (type diz2@@17) RefType)) (= (Worker__joinToken diz@@81 p_1@@47) (Worker__joinToken diz2@@17 p2_1@@13))) (and (= diz@@81 diz2@@17) (= p_1@@47 p2_1@@13)))
 :qid |stdinbpl.1192:15|
 :skolemid |152|
 :pattern ( (Worker__joinToken diz@@81 p_1@@47) (Worker__joinToken diz2@@17 p2_1@@13))
)))
(assert (forall ((arg0@@63 T@U) (arg1@@37 Real) ) (! (= (type (|Worker__joinToken#sm| arg0@@63 arg1@@37)) (FieldType PredicateType_Worker__joinTokenType (MapType1Type RefType boolType)))
 :qid |funType:Worker__joinToken#sm|
 :pattern ( (|Worker__joinToken#sm| arg0@@63 arg1@@37))
)))
(assert (forall ((diz@@82 T@U) (p_1@@48 Real) (diz2@@18 T@U) (p2_1@@14 Real) ) (!  (=> (and (and (= (type diz@@82) RefType) (= (type diz2@@18) RefType)) (= (|Worker__joinToken#sm| diz@@82 p_1@@48) (|Worker__joinToken#sm| diz2@@18 p2_1@@14))) (and (= diz@@82 diz2@@18) (= p_1@@48 p2_1@@14)))
 :qid |stdinbpl.1196:15|
 :skolemid |153|
 :pattern ( (|Worker__joinToken#sm| diz@@82 p_1@@48) (|Worker__joinToken#sm| diz2@@18 p2_1@@14))
)))
(assert (forall ((diz@@83 T@U) (p_1@@49 Real) (diz2@@19 T@U) (p2_1@@15 Real) ) (!  (=> (and (and (= (type diz@@83) RefType) (= (type diz2@@19) RefType)) (= (Worker__joinToken_at_Worker diz@@83 p_1@@49) (Worker__joinToken_at_Worker diz2@@19 p2_1@@15))) (and (= diz@@83 diz2@@19) (= p_1@@49 p2_1@@15)))
 :qid |stdinbpl.1227:15|
 :skolemid |158|
 :pattern ( (Worker__joinToken_at_Worker diz@@83 p_1@@49) (Worker__joinToken_at_Worker diz2@@19 p2_1@@15))
)))
(assert (forall ((arg0@@64 T@U) (arg1@@38 Real) ) (! (= (type (|Worker__joinToken_at_Worker#sm| arg0@@64 arg1@@38)) (FieldType PredicateType_Worker__joinToken_at_WorkerType (MapType1Type RefType boolType)))
 :qid |funType:Worker__joinToken_at_Worker#sm|
 :pattern ( (|Worker__joinToken_at_Worker#sm| arg0@@64 arg1@@38))
)))
(assert (forall ((diz@@84 T@U) (p_1@@50 Real) (diz2@@20 T@U) (p2_1@@16 Real) ) (!  (=> (and (and (= (type diz@@84) RefType) (= (type diz2@@20) RefType)) (= (|Worker__joinToken_at_Worker#sm| diz@@84 p_1@@50) (|Worker__joinToken_at_Worker#sm| diz2@@20 p2_1@@16))) (and (= diz@@84 diz2@@20) (= p_1@@50 p2_1@@16)))
 :qid |stdinbpl.1231:15|
 :skolemid |159|
 :pattern ( (|Worker__joinToken_at_Worker#sm| diz@@84 p_1@@50) (|Worker__joinToken_at_Worker#sm| diz2@@20 p2_1@@16))
)))
(assert (forall ((diz@@85 T@U) (p_1@@51 Real) (diz2@@21 T@U) (p2_1@@17 Real) ) (!  (=> (and (and (= (type diz@@85) RefType) (= (type diz2@@21) RefType)) (= (Worker__preFork diz@@85 p_1@@51) (Worker__preFork diz2@@21 p2_1@@17))) (and (= diz@@85 diz2@@21) (= p_1@@51 p2_1@@17)))
 :qid |stdinbpl.1280:15|
 :skolemid |164|
 :pattern ( (Worker__preFork diz@@85 p_1@@51) (Worker__preFork diz2@@21 p2_1@@17))
)))
(assert (forall ((arg0@@65 T@U) (arg1@@39 Real) ) (! (= (type (|Worker__preFork#sm| arg0@@65 arg1@@39)) (FieldType PredicateType_Worker__preForkType (MapType1Type RefType boolType)))
 :qid |funType:Worker__preFork#sm|
 :pattern ( (|Worker__preFork#sm| arg0@@65 arg1@@39))
)))
(assert (forall ((diz@@86 T@U) (p_1@@52 Real) (diz2@@22 T@U) (p2_1@@18 Real) ) (!  (=> (and (and (= (type diz@@86) RefType) (= (type diz2@@22) RefType)) (= (|Worker__preFork#sm| diz@@86 p_1@@52) (|Worker__preFork#sm| diz2@@22 p2_1@@18))) (and (= diz@@86 diz2@@22) (= p_1@@52 p2_1@@18)))
 :qid |stdinbpl.1284:15|
 :skolemid |165|
 :pattern ( (|Worker__preFork#sm| diz@@86 p_1@@52) (|Worker__preFork#sm| diz2@@22 p2_1@@18))
)))
(assert (forall ((diz@@87 T@U) (p_1@@53 Real) (diz2@@23 T@U) (p2_1@@19 Real) ) (!  (=> (and (and (= (type diz@@87) RefType) (= (type diz2@@23) RefType)) (= (Worker__postJoin diz@@87 p_1@@53) (Worker__postJoin diz2@@23 p2_1@@19))) (and (= diz@@87 diz2@@23) (= p_1@@53 p2_1@@19)))
 :qid |stdinbpl.1315:15|
 :skolemid |170|
 :pattern ( (Worker__postJoin diz@@87 p_1@@53) (Worker__postJoin diz2@@23 p2_1@@19))
)))
(assert (forall ((arg0@@66 T@U) (arg1@@40 Real) ) (! (= (type (|Worker__postJoin#sm| arg0@@66 arg1@@40)) (FieldType PredicateType_Worker__postJoinType (MapType1Type RefType boolType)))
 :qid |funType:Worker__postJoin#sm|
 :pattern ( (|Worker__postJoin#sm| arg0@@66 arg1@@40))
)))
(assert (forall ((diz@@88 T@U) (p_1@@54 Real) (diz2@@24 T@U) (p2_1@@20 Real) ) (!  (=> (and (and (= (type diz@@88) RefType) (= (type diz2@@24) RefType)) (= (|Worker__postJoin#sm| diz@@88 p_1@@54) (|Worker__postJoin#sm| diz2@@24 p2_1@@20))) (and (= diz@@88 diz2@@24) (= p_1@@54 p2_1@@20)))
 :qid |stdinbpl.1319:15|
 :skolemid |171|
 :pattern ( (|Worker__postJoin#sm| diz@@88 p_1@@54) (|Worker__postJoin#sm| diz2@@24 p2_1@@20))
)))
(assert (forall ((diz@@89 T@U) (p_1@@55 Real) (diz2@@25 T@U) (p2_1@@21 Real) ) (!  (=> (and (and (= (type diz@@89) RefType) (= (type diz2@@25) RefType)) (= (Worker__joinToken_at_Thread diz@@89 p_1@@55) (Worker__joinToken_at_Thread diz2@@25 p2_1@@21))) (and (= diz@@89 diz2@@25) (= p_1@@55 p2_1@@21)))
 :qid |stdinbpl.1350:15|
 :skolemid |176|
 :pattern ( (Worker__joinToken_at_Thread diz@@89 p_1@@55) (Worker__joinToken_at_Thread diz2@@25 p2_1@@21))
)))
(assert (forall ((arg0@@67 T@U) (arg1@@41 Real) ) (! (= (type (|Worker__joinToken_at_Thread#sm| arg0@@67 arg1@@41)) (FieldType PredicateType_Worker__joinToken_at_ThreadType (MapType1Type RefType boolType)))
 :qid |funType:Worker__joinToken_at_Thread#sm|
 :pattern ( (|Worker__joinToken_at_Thread#sm| arg0@@67 arg1@@41))
)))
(assert (forall ((diz@@90 T@U) (p_1@@56 Real) (diz2@@26 T@U) (p2_1@@22 Real) ) (!  (=> (and (and (= (type diz@@90) RefType) (= (type diz2@@26) RefType)) (= (|Worker__joinToken_at_Thread#sm| diz@@90 p_1@@56) (|Worker__joinToken_at_Thread#sm| diz2@@26 p2_1@@22))) (and (= diz@@90 diz2@@26) (= p_1@@56 p2_1@@22)))
 :qid |stdinbpl.1354:15|
 :skolemid |177|
 :pattern ( (|Worker__joinToken_at_Thread#sm| diz@@90 p_1@@56) (|Worker__joinToken_at_Thread#sm| diz2@@26 p2_1@@22))
)))
(assert (forall ((diz@@91 T@U) (p_1@@57 Real) (diz2@@27 T@U) (p2_1@@23 Real) ) (!  (=> (and (and (= (type diz@@91) RefType) (= (type diz2@@27) RefType)) (= (Worker__preFork_at_Thread diz@@91 p_1@@57) (Worker__preFork_at_Thread diz2@@27 p2_1@@23))) (and (= diz@@91 diz2@@27) (= p_1@@57 p2_1@@23)))
 :qid |stdinbpl.1385:15|
 :skolemid |182|
 :pattern ( (Worker__preFork_at_Thread diz@@91 p_1@@57) (Worker__preFork_at_Thread diz2@@27 p2_1@@23))
)))
(assert (forall ((arg0@@68 T@U) (arg1@@42 Real) ) (! (= (type (|Worker__preFork_at_Thread#sm| arg0@@68 arg1@@42)) (FieldType PredicateType_Worker__preFork_at_ThreadType (MapType1Type RefType boolType)))
 :qid |funType:Worker__preFork_at_Thread#sm|
 :pattern ( (|Worker__preFork_at_Thread#sm| arg0@@68 arg1@@42))
)))
(assert (forall ((diz@@92 T@U) (p_1@@58 Real) (diz2@@28 T@U) (p2_1@@24 Real) ) (!  (=> (and (and (= (type diz@@92) RefType) (= (type diz2@@28) RefType)) (= (|Worker__preFork_at_Thread#sm| diz@@92 p_1@@58) (|Worker__preFork_at_Thread#sm| diz2@@28 p2_1@@24))) (and (= diz@@92 diz2@@28) (= p_1@@58 p2_1@@24)))
 :qid |stdinbpl.1389:15|
 :skolemid |183|
 :pattern ( (|Worker__preFork_at_Thread#sm| diz@@92 p_1@@58) (|Worker__preFork_at_Thread#sm| diz2@@28 p2_1@@24))
)))
(assert (forall ((diz@@93 T@U) (p_1@@59 Real) (diz2@@29 T@U) (p2_1@@25 Real) ) (!  (=> (and (and (= (type diz@@93) RefType) (= (type diz2@@29) RefType)) (= (Worker__postJoin_at_Thread diz@@93 p_1@@59) (Worker__postJoin_at_Thread diz2@@29 p2_1@@25))) (and (= diz@@93 diz2@@29) (= p_1@@59 p2_1@@25)))
 :qid |stdinbpl.1434:15|
 :skolemid |188|
 :pattern ( (Worker__postJoin_at_Thread diz@@93 p_1@@59) (Worker__postJoin_at_Thread diz2@@29 p2_1@@25))
)))
(assert (forall ((arg0@@69 T@U) (arg1@@43 Real) ) (! (= (type (|Worker__postJoin_at_Thread#sm| arg0@@69 arg1@@43)) (FieldType PredicateType_Worker__postJoin_at_ThreadType (MapType1Type RefType boolType)))
 :qid |funType:Worker__postJoin_at_Thread#sm|
 :pattern ( (|Worker__postJoin_at_Thread#sm| arg0@@69 arg1@@43))
)))
(assert (forall ((diz@@94 T@U) (p_1@@60 Real) (diz2@@30 T@U) (p2_1@@26 Real) ) (!  (=> (and (and (= (type diz@@94) RefType) (= (type diz2@@30) RefType)) (= (|Worker__postJoin_at_Thread#sm| diz@@94 p_1@@60) (|Worker__postJoin_at_Thread#sm| diz2@@30 p2_1@@26))) (and (= diz@@94 diz2@@30) (= p_1@@60 p2_1@@26)))
 :qid |stdinbpl.1438:15|
 :skolemid |189|
 :pattern ( (|Worker__postJoin_at_Thread#sm| diz@@94 p_1@@60) (|Worker__postJoin_at_Thread#sm| diz2@@30 p2_1@@26))
)))
(assert (forall ((diz@@95 T@U) (p_1@@61 Real) (diz2@@31 T@U) (p2_1@@27 Real) ) (!  (=> (and (and (= (type diz@@95) RefType) (= (type diz2@@31) RefType)) (= (Worker__preFork_at_Worker diz@@95 p_1@@61) (Worker__preFork_at_Worker diz2@@31 p2_1@@27))) (and (= diz@@95 diz2@@31) (= p_1@@61 p2_1@@27)))
 :qid |stdinbpl.1483:15|
 :skolemid |194|
 :pattern ( (Worker__preFork_at_Worker diz@@95 p_1@@61) (Worker__preFork_at_Worker diz2@@31 p2_1@@27))
)))
(assert (forall ((arg0@@70 T@U) (arg1@@44 Real) ) (! (= (type (|Worker__preFork_at_Worker#sm| arg0@@70 arg1@@44)) (FieldType PredicateType_Worker__preFork_at_WorkerType (MapType1Type RefType boolType)))
 :qid |funType:Worker__preFork_at_Worker#sm|
 :pattern ( (|Worker__preFork_at_Worker#sm| arg0@@70 arg1@@44))
)))
(assert (forall ((diz@@96 T@U) (p_1@@62 Real) (diz2@@32 T@U) (p2_1@@28 Real) ) (!  (=> (and (and (= (type diz@@96) RefType) (= (type diz2@@32) RefType)) (= (|Worker__preFork_at_Worker#sm| diz@@96 p_1@@62) (|Worker__preFork_at_Worker#sm| diz2@@32 p2_1@@28))) (and (= diz@@96 diz2@@32) (= p_1@@62 p2_1@@28)))
 :qid |stdinbpl.1487:15|
 :skolemid |195|
 :pattern ( (|Worker__preFork_at_Worker#sm| diz@@96 p_1@@62) (|Worker__preFork_at_Worker#sm| diz2@@32 p2_1@@28))
)))
(assert (forall ((diz@@97 T@U) (p_1@@63 Real) (diz2@@33 T@U) (p2_1@@29 Real) ) (!  (=> (and (and (= (type diz@@97) RefType) (= (type diz2@@33) RefType)) (= (Worker__postJoin_at_Worker diz@@97 p_1@@63) (Worker__postJoin_at_Worker diz2@@33 p2_1@@29))) (and (= diz@@97 diz2@@33) (= p_1@@63 p2_1@@29)))
 :qid |stdinbpl.1582:15|
 :skolemid |200|
 :pattern ( (Worker__postJoin_at_Worker diz@@97 p_1@@63) (Worker__postJoin_at_Worker diz2@@33 p2_1@@29))
)))
(assert (forall ((arg0@@71 T@U) (arg1@@45 Real) ) (! (= (type (|Worker__postJoin_at_Worker#sm| arg0@@71 arg1@@45)) (FieldType PredicateType_Worker__postJoin_at_WorkerType (MapType1Type RefType boolType)))
 :qid |funType:Worker__postJoin_at_Worker#sm|
 :pattern ( (|Worker__postJoin_at_Worker#sm| arg0@@71 arg1@@45))
)))
(assert (forall ((diz@@98 T@U) (p_1@@64 Real) (diz2@@34 T@U) (p2_1@@30 Real) ) (!  (=> (and (and (= (type diz@@98) RefType) (= (type diz2@@34) RefType)) (= (|Worker__postJoin_at_Worker#sm| diz@@98 p_1@@64) (|Worker__postJoin_at_Worker#sm| diz2@@34 p2_1@@30))) (and (= diz@@98 diz2@@34) (= p_1@@64 p2_1@@30)))
 :qid |stdinbpl.1586:15|
 :skolemid |201|
 :pattern ( (|Worker__postJoin_at_Worker#sm| diz@@98 p_1@@64) (|Worker__postJoin_at_Worker#sm| diz2@@34 p2_1@@30))
)))
(assert  (and (forall ((arg0@@72 Int) (arg1@@46 Int) ) (! (= (type (p_dual arg0@@72 arg1@@46)) ProcessDomainTypeType)
 :qid |funType:p_dual|
 :pattern ( (p_dual arg0@@72 arg1@@46))
)) (forall ((arg0@@73 T@U) (arg1@@47 T@U) ) (! (= (type (p_merge arg0@@73 arg1@@47)) ProcessDomainTypeType)
 :qid |funType:p_merge|
 :pattern ( (p_merge arg0@@73 arg1@@47))
))))
(assert (forall ((n_1@@0 Int) (m_1 Int) ) (! (= (p_merge (p_single n_1@@0) (p_single m_1)) (p_dual n_1@@0 m_1))
 :qid |stdinbpl.278:15|
 :skolemid |30|
 :pattern ( (p_dual n_1@@0 m_1))
)))
(assert (forall ((diz@@99 T@U) (diz2@@35 T@U) ) (!  (=> (and (and (= (type diz@@99) RefType) (= (type diz2@@35) RefType)) (= (History__inv diz@@99) (History__inv diz2@@35))) (= diz@@99 diz2@@35))
 :qid |stdinbpl.478:15|
 :skolemid |44|
 :pattern ( (History__inv diz@@99) (History__inv diz2@@35))
)))
(assert (forall ((arg0@@74 T@U) ) (! (= (type (|History__inv#sm| arg0@@74)) (FieldType PredicateType_History__invType (MapType1Type RefType boolType)))
 :qid |funType:History__inv#sm|
 :pattern ( (|History__inv#sm| arg0@@74))
)))
(assert (forall ((diz@@100 T@U) (diz2@@36 T@U) ) (!  (=> (and (and (= (type diz@@100) RefType) (= (type diz2@@36) RefType)) (= (|History__inv#sm| diz@@100) (|History__inv#sm| diz2@@36))) (= diz@@100 diz2@@36))
 :qid |stdinbpl.482:15|
 :skolemid |45|
 :pattern ( (|History__inv#sm| diz@@100) (|History__inv#sm| diz2@@36))
)))
(assert (forall ((diz@@101 T@U) (diz2@@37 T@U) ) (!  (=> (and (and (= (type diz@@101) RefType) (= (type diz2@@37) RefType)) (= (SubjectLock__inv diz@@101) (SubjectLock__inv diz2@@37))) (= diz@@101 diz2@@37))
 :qid |stdinbpl.611:15|
 :skolemid |62|
 :pattern ( (SubjectLock__inv diz@@101) (SubjectLock__inv diz2@@37))
)))
(assert (forall ((arg0@@75 T@U) ) (! (= (type (|SubjectLock__inv#sm| arg0@@75)) (FieldType PredicateType_SubjectLock__invType (MapType1Type RefType boolType)))
 :qid |funType:SubjectLock__inv#sm|
 :pattern ( (|SubjectLock__inv#sm| arg0@@75))
)))
(assert (forall ((diz@@102 T@U) (diz2@@38 T@U) ) (!  (=> (and (and (= (type diz@@102) RefType) (= (type diz2@@38) RefType)) (= (|SubjectLock__inv#sm| diz@@102) (|SubjectLock__inv#sm| diz2@@38))) (= diz@@102 diz2@@38))
 :qid |stdinbpl.615:15|
 :skolemid |63|
 :pattern ( (|SubjectLock__inv#sm| diz@@102) (|SubjectLock__inv#sm| diz2@@38))
)))
(assert (forall ((diz@@103 T@U) (diz2@@39 T@U) ) (!  (=> (and (and (= (type diz@@103) RefType) (= (type diz2@@39) RefType)) (= (SubjectLock__valid diz@@103) (SubjectLock__valid diz2@@39))) (= diz@@103 diz2@@39))
 :qid |stdinbpl.674:15|
 :skolemid |68|
 :pattern ( (SubjectLock__valid diz@@103) (SubjectLock__valid diz2@@39))
)))
(assert (forall ((arg0@@76 T@U) ) (! (= (type (|SubjectLock__valid#sm| arg0@@76)) (FieldType PredicateType_SubjectLock__validType (MapType1Type RefType boolType)))
 :qid |funType:SubjectLock__valid#sm|
 :pattern ( (|SubjectLock__valid#sm| arg0@@76))
)))
(assert (forall ((diz@@104 T@U) (diz2@@40 T@U) ) (!  (=> (and (and (= (type diz@@104) RefType) (= (type diz2@@40) RefType)) (= (|SubjectLock__valid#sm| diz@@104) (|SubjectLock__valid#sm| diz2@@40))) (= diz@@104 diz2@@40))
 :qid |stdinbpl.678:15|
 :skolemid |69|
 :pattern ( (|SubjectLock__valid#sm| diz@@104) (|SubjectLock__valid#sm| diz2@@40))
)))
(assert (forall ((diz@@105 T@U) (diz2@@41 T@U) ) (!  (=> (and (and (= (type diz@@105) RefType) (= (type diz2@@41) RefType)) (= (Thread__is_a_Thread diz@@105) (Thread__is_a_Thread diz2@@41))) (= diz@@105 diz2@@41))
 :qid |stdinbpl.744:15|
 :skolemid |80|
 :pattern ( (Thread__is_a_Thread diz@@105) (Thread__is_a_Thread diz2@@41))
)))
(assert (forall ((arg0@@77 T@U) ) (! (= (type (|Thread__is_a_Thread#sm| arg0@@77)) (FieldType PredicateType_Thread__is_a_ThreadType (MapType1Type RefType boolType)))
 :qid |funType:Thread__is_a_Thread#sm|
 :pattern ( (|Thread__is_a_Thread#sm| arg0@@77))
)))
(assert (forall ((diz@@106 T@U) (diz2@@42 T@U) ) (!  (=> (and (and (= (type diz@@106) RefType) (= (type diz2@@42) RefType)) (= (|Thread__is_a_Thread#sm| diz@@106) (|Thread__is_a_Thread#sm| diz2@@42))) (= diz@@106 diz2@@42))
 :qid |stdinbpl.748:15|
 :skolemid |81|
 :pattern ( (|Thread__is_a_Thread#sm| diz@@106) (|Thread__is_a_Thread#sm| diz2@@42))
)))
(assert (forall ((diz@@107 T@U) (diz2@@43 T@U) ) (!  (=> (and (and (= (type diz@@107) RefType) (= (type diz2@@43) RefType)) (= (Thread__instance_of_Thread diz@@107) (Thread__instance_of_Thread diz2@@43))) (= diz@@107 diz2@@43))
 :qid |stdinbpl.779:15|
 :skolemid |86|
 :pattern ( (Thread__instance_of_Thread diz@@107) (Thread__instance_of_Thread diz2@@43))
)))
(assert (forall ((arg0@@78 T@U) ) (! (= (type (|Thread__instance_of_Thread#sm| arg0@@78)) (FieldType PredicateType_Thread__instance_of_ThreadType (MapType1Type RefType boolType)))
 :qid |funType:Thread__instance_of_Thread#sm|
 :pattern ( (|Thread__instance_of_Thread#sm| arg0@@78))
)))
(assert (forall ((diz@@108 T@U) (diz2@@44 T@U) ) (!  (=> (and (and (= (type diz@@108) RefType) (= (type diz2@@44) RefType)) (= (|Thread__instance_of_Thread#sm| diz@@108) (|Thread__instance_of_Thread#sm| diz2@@44))) (= diz@@108 diz2@@44))
 :qid |stdinbpl.783:15|
 :skolemid |87|
 :pattern ( (|Thread__instance_of_Thread#sm| diz@@108) (|Thread__instance_of_Thread#sm| diz2@@44))
)))
(assert (forall ((diz@@109 T@U) (diz2@@45 T@U) ) (!  (=> (and (and (= (type diz@@109) RefType) (= (type diz2@@45) RefType)) (= (Worker__is_a_Worker diz@@109) (Worker__is_a_Worker diz2@@45))) (= diz@@109 diz2@@45))
 :qid |stdinbpl.1052:15|
 :skolemid |128|
 :pattern ( (Worker__is_a_Worker diz@@109) (Worker__is_a_Worker diz2@@45))
)))
(assert (forall ((arg0@@79 T@U) ) (! (= (type (|Worker__is_a_Worker#sm| arg0@@79)) (FieldType PredicateType_Worker__is_a_WorkerType (MapType1Type RefType boolType)))
 :qid |funType:Worker__is_a_Worker#sm|
 :pattern ( (|Worker__is_a_Worker#sm| arg0@@79))
)))
(assert (forall ((diz@@110 T@U) (diz2@@46 T@U) ) (!  (=> (and (and (= (type diz@@110) RefType) (= (type diz2@@46) RefType)) (= (|Worker__is_a_Worker#sm| diz@@110) (|Worker__is_a_Worker#sm| diz2@@46))) (= diz@@110 diz2@@46))
 :qid |stdinbpl.1056:15|
 :skolemid |129|
 :pattern ( (|Worker__is_a_Worker#sm| diz@@110) (|Worker__is_a_Worker#sm| diz2@@46))
)))
(assert (forall ((diz@@111 T@U) (diz2@@47 T@U) ) (!  (=> (and (and (= (type diz@@111) RefType) (= (type diz2@@47) RefType)) (= (Worker__instance_of_Worker diz@@111) (Worker__instance_of_Worker diz2@@47))) (= diz@@111 diz2@@47))
 :qid |stdinbpl.1087:15|
 :skolemid |134|
 :pattern ( (Worker__instance_of_Worker diz@@111) (Worker__instance_of_Worker diz2@@47))
)))
(assert (forall ((arg0@@80 T@U) ) (! (= (type (|Worker__instance_of_Worker#sm| arg0@@80)) (FieldType PredicateType_Worker__instance_of_WorkerType (MapType1Type RefType boolType)))
 :qid |funType:Worker__instance_of_Worker#sm|
 :pattern ( (|Worker__instance_of_Worker#sm| arg0@@80))
)))
(assert (forall ((diz@@112 T@U) (diz2@@48 T@U) ) (!  (=> (and (and (= (type diz@@112) RefType) (= (type diz2@@48) RefType)) (= (|Worker__instance_of_Worker#sm| diz@@112) (|Worker__instance_of_Worker#sm| diz2@@48))) (= diz@@112 diz2@@48))
 :qid |stdinbpl.1091:15|
 :skolemid |135|
 :pattern ( (|Worker__instance_of_Worker#sm| diz@@112) (|Worker__instance_of_Worker#sm| diz2@@48))
)))
(assert (forall ((diz@@113 T@U) (diz2@@49 T@U) ) (!  (=> (and (and (= (type diz@@113) RefType) (= (type diz2@@49) RefType)) (= (Worker__is_a_Thread diz@@113) (Worker__is_a_Thread diz2@@49))) (= diz@@113 diz2@@49))
 :qid |stdinbpl.1122:15|
 :skolemid |140|
 :pattern ( (Worker__is_a_Thread diz@@113) (Worker__is_a_Thread diz2@@49))
)))
(assert (forall ((arg0@@81 T@U) ) (! (= (type (|Worker__is_a_Thread#sm| arg0@@81)) (FieldType PredicateType_Worker__is_a_ThreadType (MapType1Type RefType boolType)))
 :qid |funType:Worker__is_a_Thread#sm|
 :pattern ( (|Worker__is_a_Thread#sm| arg0@@81))
)))
(assert (forall ((diz@@114 T@U) (diz2@@50 T@U) ) (!  (=> (and (and (= (type diz@@114) RefType) (= (type diz2@@50) RefType)) (= (|Worker__is_a_Thread#sm| diz@@114) (|Worker__is_a_Thread#sm| diz2@@50))) (= diz@@114 diz2@@50))
 :qid |stdinbpl.1126:15|
 :skolemid |141|
 :pattern ( (|Worker__is_a_Thread#sm| diz@@114) (|Worker__is_a_Thread#sm| diz2@@50))
)))
(assert (forall ((diz@@115 T@U) (diz2@@51 T@U) ) (!  (=> (and (and (= (type diz@@115) RefType) (= (type diz2@@51) RefType)) (= (Worker__instance_of_Thread diz@@115) (Worker__instance_of_Thread diz2@@51))) (= diz@@115 diz2@@51))
 :qid |stdinbpl.1157:15|
 :skolemid |146|
 :pattern ( (Worker__instance_of_Thread diz@@115) (Worker__instance_of_Thread diz2@@51))
)))
(assert (forall ((arg0@@82 T@U) ) (! (= (type (|Worker__instance_of_Thread#sm| arg0@@82)) (FieldType PredicateType_Worker__instance_of_ThreadType (MapType1Type RefType boolType)))
 :qid |funType:Worker__instance_of_Thread#sm|
 :pattern ( (|Worker__instance_of_Thread#sm| arg0@@82))
)))
(assert (forall ((diz@@116 T@U) (diz2@@52 T@U) ) (!  (=> (and (and (= (type diz@@116) RefType) (= (type diz2@@52) RefType)) (= (|Worker__instance_of_Thread#sm| diz@@116) (|Worker__instance_of_Thread#sm| diz2@@52))) (= diz@@116 diz2@@52))
 :qid |stdinbpl.1161:15|
 :skolemid |147|
 :pattern ( (|Worker__instance_of_Thread#sm| diz@@116) (|Worker__instance_of_Thread#sm| diz2@@52))
)))
(assert (forall ((Heap@@34 T@U) (ExhaleHeap@@2 T@U) (Mask@@3 T@U) (o_1@@0 T@U) (f_2 T@U) ) (! (let ((B@@1 (FieldTypeInv1 (type f_2))))
(let ((A@@1 (FieldTypeInv0 (type f_2))))
 (=> (and (and (and (and (and (and (= (type Heap@@34) (MapType0Type RefType)) (= (type ExhaleHeap@@2) (MapType0Type RefType))) (= (type Mask@@3) (MapType1Type RefType realType))) (= (type o_1@@0) RefType)) (= (type f_2) (FieldType A@@1 B@@1))) (IdenticalOnKnownLocations Heap@@34 ExhaleHeap@@2 Mask@@3)) (HasDirectPerm Mask@@3 o_1@@0 f_2)) (= (MapType0Select Heap@@34 o_1@@0 f_2) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2)))))
 :qid |stdinbpl.42:22|
 :skolemid |1|
 :pattern ( (IdenticalOnKnownLocations Heap@@34 ExhaleHeap@@2 Mask@@3) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2))
)))
(assert  (and (= (type dummyHeap) (MapType0Type RefType)) (= (type ZeroMask) (MapType1Type RefType realType))))
(assert (state dummyHeap ZeroMask))
(assert (forall ((p1_1 T@U) ) (!  (=> (= (type p1_1) ProcessDomainTypeType) (forall ((p2_1@@31 T@U) ) (!  (=> (= (type p2_1@@31) ProcessDomainTypeType) (forall ((p3 T@U) ) (!  (=> (= (type p3) ProcessDomainTypeType) (= (p_seq (p_seq p1_1 p2_1@@31) p3) (p_seq p1_1 (p_seq p2_1@@31 p3))))
 :qid |stdinbpl.264:13|
 :skolemid |26|
 :pattern ( (p_seq (p_seq p1_1 p2_1@@31) p3))
 :pattern ( (p_seq p1_1 (p_seq p2_1@@31 p3)))
)))
 :qid |stdinbpl.262:11|
 :skolemid |27|
 :pattern ( (p_seq p1_1 p2_1@@31))
)))
 :qid |stdinbpl.260:15|
 :skolemid |28|
 :no-pattern (type p1_1)
 :no-pattern (U_2_int p1_1)
 :no-pattern (U_2_bool p1_1)
)))
(assert (forall ((p T@U) (v_1 T@U) (w T@U) ) (! (let ((A@@2 (FieldTypeInv0 (type p))))
 (=> (and (and (= (type p) (FieldType A@@2 FrameTypeType)) (= (type v_1) FrameTypeType)) (= (type w) FrameTypeType)) (not (InsidePredicate p v_1 p w))))
 :qid |stdinbpl.174:19|
 :skolemid |21|
 :pattern ( (InsidePredicate p v_1 p w))
)))
(assert  (not (IsPredicateField History__x_hist_value)))
(assert  (not (IsWandField History__x_hist_value)))
(assert  (not (IsPredicateField History__x_hist_mode)))
(assert  (not (IsWandField History__x_hist_mode)))
(assert  (not (IsPredicateField History__x_hist_init)))
(assert  (not (IsWandField History__x_hist_init)))
(assert  (not (IsPredicateField History__x_hist_act)))
(assert  (not (IsWandField History__x_hist_act)))
(assert  (not (IsPredicateField SubjectLock__subject)))
(assert  (not (IsWandField SubjectLock__subject)))
(assert  (not (IsPredicateField Worker__l)))
(assert  (not (IsWandField Worker__l)))
(assert  (not (IsPredicateField Worker__s)))
(assert  (not (IsWandField Worker__s)))
(assert (forall ((Heap@@35 T@U) (ExhaleHeap@@3 T@U) (Mask@@4 T@U) ) (!  (=> (and (and (and (= (type Heap@@35) (MapType0Type RefType)) (= (type ExhaleHeap@@3) (MapType0Type RefType))) (= (type Mask@@4) (MapType1Type RefType realType))) (IdenticalOnKnownLocations Heap@@35 ExhaleHeap@@3 Mask@@4)) (succHeap Heap@@35 ExhaleHeap@@3))
 :qid |stdinbpl.83:15|
 :skolemid |10|
 :pattern ( (IdenticalOnKnownLocations Heap@@35 ExhaleHeap@@3 Mask@@4))
)))
(assert (forall ((Heap@@36 T@U) (Mask@@5 T@U) (diz@@117 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@36) (MapType0Type RefType)) (= (type Mask@@5) (MapType1Type RefType realType))) (= (type diz@@117) RefType)) (and (state Heap@@36 Mask@@5) (< AssumeFunctionsAbove 0))) (not (= diz@@117 null))) (= (History__free_get_x Heap@@36 diz@@117) (U_2_int (MapType0Select Heap@@36 diz@@117 History__x_hist_value))))
 :qid |stdinbpl.338:15|
 :skolemid |35|
 :pattern ( (state Heap@@36 Mask@@5) (History__free_get_x Heap@@36 diz@@117))
)))
(assert (forall ((Heap@@37 T@U) (Mask@@6 T@U) (diz@@118 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@37) (MapType0Type RefType)) (= (type Mask@@6) (MapType1Type RefType realType))) (= (type diz@@118) RefType)) (and (state Heap@@37 Mask@@6) (< AssumeFunctionsAbove 1))) (not (= diz@@118 null))) (= (History__hist_get_x Heap@@37 diz@@118) (U_2_int (MapType0Select Heap@@37 diz@@118 History__x_hist_value))))
 :qid |stdinbpl.406:15|
 :skolemid |39|
 :pattern ( (state Heap@@37 Mask@@6) (History__hist_get_x Heap@@37 diz@@118))
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
(assert  (and (forall ((arg0@@83 Real) (arg1@@48 T@U) ) (! (= (type (ConditionalFrame arg0@@83 arg1@@48)) FrameTypeType)
 :qid |funType:ConditionalFrame|
 :pattern ( (ConditionalFrame arg0@@83 arg1@@48))
)) (= (type EmptyFrame) FrameTypeType)))
(assert (forall ((p@@0 Real) (f_6 T@U) ) (!  (=> (= (type f_6) FrameTypeType) (= (ConditionalFrame p@@0 f_6) (ite (> p@@0 0.0) f_6 EmptyFrame)))
 :qid |stdinbpl.162:15|
 :skolemid |19|
 :pattern ( (ConditionalFrame p@@0 f_6))
)))
(assert (forall ((Mask@@7 T@U) (o_2@@0 T@U) (f_4@@0 T@U) ) (! (let ((B@@3 (FieldTypeInv1 (type f_4@@0))))
(let ((A@@4 (FieldTypeInv0 (type f_4@@0))))
 (=> (and (and (= (type Mask@@7) (MapType1Type RefType realType)) (= (type o_2@@0) RefType)) (= (type f_4@@0) (FieldType A@@4 B@@3))) (= (HasDirectPerm Mask@@7 o_2@@0 f_4@@0) (> (U_2_real (MapType1Select Mask@@7 o_2@@0 f_4@@0)) NoPerm)))))
 :qid |stdinbpl.133:22|
 :skolemid |17|
 :pattern ( (HasDirectPerm Mask@@7 o_2@@0 f_4@@0))
)))
(assert (forall ((o_2@@1 T@U) (f_4@@1 T@U) ) (! (let ((B@@4 (FieldTypeInv1 (type f_4@@1))))
(let ((A@@5 (FieldTypeInv0 (type f_4@@1))))
 (=> (and (= (type o_2@@1) RefType) (= (type f_4@@1) (FieldType A@@5 B@@4))) (= (U_2_real (MapType1Select ZeroMask o_2@@1 f_4@@1)) NoPerm))))
 :qid |stdinbpl.106:22|
 :skolemid |13|
 :pattern ( (MapType1Select ZeroMask o_2@@1 f_4@@1))
)))
(assert (forall ((p_1@@65 T@U) ) (!  (=> (= (type p_1@@65) ProcessDomainTypeType) (= (p_merge p_empty p_1@@65) p_1@@65))
 :qid |stdinbpl.242:15|
 :skolemid |23|
 :pattern ( (p_merge p_empty p_1@@65))
)))
(assert (forall ((p_1@@66 T@U) ) (!  (=> (= (type p_1@@66) ProcessDomainTypeType) (= (p_seq p_empty p_1@@66) p_1@@66))
 :qid |stdinbpl.248:15|
 :skolemid |24|
 :pattern ( (p_seq p_empty p_1@@66))
)))
(assert  (and (= (Ctor TYPEDomainTypeType) 40) (= (type class_Object) TYPEDomainTypeType)))
(assert (forall ((t_1 T@U) ) (!  (=> (= (type t_1) TYPEDomainTypeType) (instanceof class_Object t_1))
 :qid |stdinbpl.211:15|
 :skolemid |22|
 :pattern ( (instanceof class_Object t_1))
)))
(assert (forall ((diz@@119 T@U) (p_1@@67 Real) ) (!  (=> (= (type diz@@119) RefType) (= (getPredWandId (Thread__joinToken diz@@119 p_1@@67)) 8))
 :qid |stdinbpl.808:15|
 :skolemid |91|
 :pattern ( (Thread__joinToken diz@@119 p_1@@67))
)))
(assert (forall ((diz@@120 T@U) (p_1@@68 Real) ) (!  (=> (= (type diz@@120) RefType) (= (getPredWandId (Thread__preFork diz@@120 p_1@@68)) 9))
 :qid |stdinbpl.843:15|
 :skolemid |97|
 :pattern ( (Thread__preFork diz@@120 p_1@@68))
)))
(assert (forall ((diz@@121 T@U) (p_1@@69 Real) ) (!  (=> (= (type diz@@121) RefType) (= (getPredWandId (Thread__postJoin diz@@121 p_1@@69)) 10))
 :qid |stdinbpl.878:15|
 :skolemid |103|
 :pattern ( (Thread__postJoin diz@@121 p_1@@69))
)))
(assert (forall ((diz@@122 T@U) (p_1@@70 Real) ) (!  (=> (= (type diz@@122) RefType) (= (getPredWandId (Thread__joinToken_at_Thread diz@@122 p_1@@70)) 11))
 :qid |stdinbpl.913:15|
 :skolemid |109|
 :pattern ( (Thread__joinToken_at_Thread diz@@122 p_1@@70))
)))
(assert (forall ((diz@@123 T@U) (p_1@@71 Real) ) (!  (=> (= (type diz@@123) RefType) (= (getPredWandId (Thread__preFork_at_Thread diz@@123 p_1@@71)) 12))
 :qid |stdinbpl.948:15|
 :skolemid |115|
 :pattern ( (Thread__preFork_at_Thread diz@@123 p_1@@71))
)))
(assert (forall ((diz@@124 T@U) (p_1@@72 Real) ) (!  (=> (= (type diz@@124) RefType) (= (getPredWandId (Thread__postJoin_at_Thread diz@@124 p_1@@72)) 13))
 :qid |stdinbpl.997:15|
 :skolemid |121|
 :pattern ( (Thread__postJoin_at_Thread diz@@124 p_1@@72))
)))
(assert (forall ((diz@@125 T@U) (p_1@@73 Real) ) (!  (=> (= (type diz@@125) RefType) (= (getPredWandId (Worker__joinToken diz@@125 p_1@@73)) 18))
 :qid |stdinbpl.1186:15|
 :skolemid |151|
 :pattern ( (Worker__joinToken diz@@125 p_1@@73))
)))
(assert (forall ((diz@@126 T@U) (p_1@@74 Real) ) (!  (=> (= (type diz@@126) RefType) (= (getPredWandId (Worker__joinToken_at_Worker diz@@126 p_1@@74)) 19))
 :qid |stdinbpl.1221:15|
 :skolemid |157|
 :pattern ( (Worker__joinToken_at_Worker diz@@126 p_1@@74))
)))
(assert (forall ((diz@@127 T@U) (p_1@@75 Real) ) (!  (=> (= (type diz@@127) RefType) (= (getPredWandId (Worker__preFork diz@@127 p_1@@75)) 20))
 :qid |stdinbpl.1274:15|
 :skolemid |163|
 :pattern ( (Worker__preFork diz@@127 p_1@@75))
)))
(assert (forall ((diz@@128 T@U) (p_1@@76 Real) ) (!  (=> (= (type diz@@128) RefType) (= (getPredWandId (Worker__postJoin diz@@128 p_1@@76)) 21))
 :qid |stdinbpl.1309:15|
 :skolemid |169|
 :pattern ( (Worker__postJoin diz@@128 p_1@@76))
)))
(assert (forall ((diz@@129 T@U) (p_1@@77 Real) ) (!  (=> (= (type diz@@129) RefType) (= (getPredWandId (Worker__joinToken_at_Thread diz@@129 p_1@@77)) 22))
 :qid |stdinbpl.1344:15|
 :skolemid |175|
 :pattern ( (Worker__joinToken_at_Thread diz@@129 p_1@@77))
)))
(assert (forall ((diz@@130 T@U) (p_1@@78 Real) ) (!  (=> (= (type diz@@130) RefType) (= (getPredWandId (Worker__preFork_at_Thread diz@@130 p_1@@78)) 23))
 :qid |stdinbpl.1379:15|
 :skolemid |181|
 :pattern ( (Worker__preFork_at_Thread diz@@130 p_1@@78))
)))
(assert (forall ((diz@@131 T@U) (p_1@@79 Real) ) (!  (=> (= (type diz@@131) RefType) (= (getPredWandId (Worker__postJoin_at_Thread diz@@131 p_1@@79)) 24))
 :qid |stdinbpl.1428:15|
 :skolemid |187|
 :pattern ( (Worker__postJoin_at_Thread diz@@131 p_1@@79))
)))
(assert (forall ((diz@@132 T@U) (p_1@@80 Real) ) (!  (=> (= (type diz@@132) RefType) (= (getPredWandId (Worker__preFork_at_Worker diz@@132 p_1@@80)) 25))
 :qid |stdinbpl.1477:15|
 :skolemid |193|
 :pattern ( (Worker__preFork_at_Worker diz@@132 p_1@@80))
)))
(assert (forall ((diz@@133 T@U) (p_1@@81 Real) ) (!  (=> (= (type diz@@133) RefType) (= (getPredWandId (Worker__postJoin_at_Worker diz@@133 p_1@@81)) 26))
 :qid |stdinbpl.1576:15|
 :skolemid |199|
 :pattern ( (Worker__postJoin_at_Worker diz@@133 p_1@@81))
)))
(assert (forall ((Heap@@38 T@U) (ExhaleHeap@@4 T@U) (Mask@@8 T@U) (pm_f@@1 T@U) ) (! (let ((C@@1 (FieldTypeInv0 (type pm_f@@1))))
 (=> (and (and (and (and (and (= (type Heap@@38) (MapType0Type RefType)) (= (type ExhaleHeap@@4) (MapType0Type RefType))) (= (type Mask@@8) (MapType1Type RefType realType))) (= (type pm_f@@1) (FieldType C@@1 FrameTypeType))) (IdenticalOnKnownLocations Heap@@38 ExhaleHeap@@4 Mask@@8)) (and (HasDirectPerm Mask@@8 null pm_f@@1) (IsPredicateField pm_f@@1))) (forall ((o2 T@U) (f_2@@0 T@U) ) (! (let ((B@@5 (FieldTypeInv1 (type f_2@@0))))
(let ((A@@6 (FieldTypeInv0 (type f_2@@0))))
 (=> (and (and (= (type o2) RefType) (= (type f_2@@0) (FieldType A@@6 B@@5))) (U_2_bool (MapType1Select (MapType0Select Heap@@38 null (PredicateMaskField pm_f@@1)) o2 f_2@@0))) (= (MapType0Select Heap@@38 o2 f_2@@0) (MapType0Select ExhaleHeap@@4 o2 f_2@@0)))))
 :qid |stdinbpl.54:134|
 :skolemid |3|
 :pattern ( (MapType0Select ExhaleHeap@@4 o2 f_2@@0))
))))
 :qid |stdinbpl.52:19|
 :skolemid |4|
 :pattern ( (IdenticalOnKnownLocations Heap@@38 ExhaleHeap@@4 Mask@@8) (IsPredicateField pm_f@@1))
)))
(assert (forall ((Heap@@39 T@U) (ExhaleHeap@@5 T@U) (Mask@@9 T@U) (pm_f@@2 T@U) ) (! (let ((C@@2 (FieldTypeInv0 (type pm_f@@2))))
 (=> (and (and (and (and (and (= (type Heap@@39) (MapType0Type RefType)) (= (type ExhaleHeap@@5) (MapType0Type RefType))) (= (type Mask@@9) (MapType1Type RefType realType))) (= (type pm_f@@2) (FieldType C@@2 FrameTypeType))) (IdenticalOnKnownLocations Heap@@39 ExhaleHeap@@5 Mask@@9)) (and (HasDirectPerm Mask@@9 null pm_f@@2) (IsWandField pm_f@@2))) (forall ((o2@@0 T@U) (f_2@@1 T@U) ) (! (let ((B@@6 (FieldTypeInv1 (type f_2@@1))))
(let ((A@@7 (FieldTypeInv0 (type f_2@@1))))
 (=> (and (and (= (type o2@@0) RefType) (= (type f_2@@1) (FieldType A@@7 B@@6))) (U_2_bool (MapType1Select (MapType0Select Heap@@39 null (WandMaskField pm_f@@2)) o2@@0 f_2@@1))) (= (MapType0Select Heap@@39 o2@@0 f_2@@1) (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1)))))
 :qid |stdinbpl.67:129|
 :skolemid |6|
 :pattern ( (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1))
))))
 :qid |stdinbpl.65:19|
 :skolemid |7|
 :pattern ( (IdenticalOnKnownLocations Heap@@39 ExhaleHeap@@5 Mask@@9) (IsWandField pm_f@@2))
)))
(assert (forall ((diz@@134 T@U) ) (!  (=> (= (type diz@@134) RefType) (= (getPredWandId (History__inv diz@@134)) 0))
 :qid |stdinbpl.472:15|
 :skolemid |43|
 :pattern ( (History__inv diz@@134))
)))
(assert (forall ((diz@@135 T@U) ) (!  (=> (= (type diz@@135) RefType) (= (getPredWandId (SubjectLock__inv diz@@135)) 3))
 :qid |stdinbpl.605:15|
 :skolemid |61|
 :pattern ( (SubjectLock__inv diz@@135))
)))
(assert (forall ((diz@@136 T@U) ) (!  (=> (= (type diz@@136) RefType) (= (getPredWandId (SubjectLock__valid diz@@136)) 4))
 :qid |stdinbpl.668:15|
 :skolemid |67|
 :pattern ( (SubjectLock__valid diz@@136))
)))
(assert (forall ((diz@@137 T@U) ) (!  (=> (= (type diz@@137) RefType) (= (getPredWandId (Thread__is_a_Thread diz@@137)) 6))
 :qid |stdinbpl.738:15|
 :skolemid |79|
 :pattern ( (Thread__is_a_Thread diz@@137))
)))
(assert (forall ((diz@@138 T@U) ) (!  (=> (= (type diz@@138) RefType) (= (getPredWandId (Thread__instance_of_Thread diz@@138)) 7))
 :qid |stdinbpl.773:15|
 :skolemid |85|
 :pattern ( (Thread__instance_of_Thread diz@@138))
)))
(assert (forall ((diz@@139 T@U) ) (!  (=> (= (type diz@@139) RefType) (= (getPredWandId (Worker__is_a_Worker diz@@139)) 14))
 :qid |stdinbpl.1046:15|
 :skolemid |127|
 :pattern ( (Worker__is_a_Worker diz@@139))
)))
(assert (forall ((diz@@140 T@U) ) (!  (=> (= (type diz@@140) RefType) (= (getPredWandId (Worker__instance_of_Worker diz@@140)) 15))
 :qid |stdinbpl.1081:15|
 :skolemid |133|
 :pattern ( (Worker__instance_of_Worker diz@@140))
)))
(assert (forall ((diz@@141 T@U) ) (!  (=> (= (type diz@@141) RefType) (= (getPredWandId (Worker__is_a_Thread diz@@141)) 16))
 :qid |stdinbpl.1116:15|
 :skolemid |139|
 :pattern ( (Worker__is_a_Thread diz@@141))
)))
(assert (forall ((diz@@142 T@U) ) (!  (=> (= (type diz@@142) RefType) (= (getPredWandId (Worker__instance_of_Thread diz@@142)) 17))
 :qid |stdinbpl.1151:15|
 :skolemid |145|
 :pattern ( (Worker__instance_of_Thread diz@@142))
)))
(assert (forall ((Mask@@10 T@U) (o_2@@2 T@U) (f_4@@2 T@U) ) (! (let ((B@@7 (FieldTypeInv1 (type f_4@@2))))
(let ((A@@8 (FieldTypeInv0 (type f_4@@2))))
 (=> (and (and (and (= (type Mask@@10) (MapType1Type RefType realType)) (= (type o_2@@2) RefType)) (= (type f_4@@2) (FieldType A@@8 B@@7))) (GoodMask Mask@@10)) (and (>= (U_2_real (MapType1Select Mask@@10 o_2@@2 f_4@@2)) NoPerm) (=> (and (and (GoodMask Mask@@10) (not (IsPredicateField f_4@@2))) (not (IsWandField f_4@@2))) (<= (U_2_real (MapType1Select Mask@@10 o_2@@2 f_4@@2)) FullPerm))))))
 :qid |stdinbpl.128:22|
 :skolemid |16|
 :pattern ( (GoodMask Mask@@10) (MapType1Select Mask@@10 o_2@@2 f_4@@2))
)))
(assert (forall ((arg0@@84 T@U) ) (! (= (type (FrameFragment arg0@@84)) FrameTypeType)
 :qid |funType:FrameFragment|
 :pattern ( (FrameFragment arg0@@84))
)))
(assert (forall ((Heap@@40 T@U) (Mask@@11 T@U) (diz@@143 T@U) ) (!  (=> (and (and (and (= (type Heap@@40) (MapType0Type RefType)) (= (type Mask@@11) (MapType1Type RefType realType))) (= (type diz@@143) RefType)) (state Heap@@40 Mask@@11)) (= (|History__free_get_x'| Heap@@40 diz@@143) (|History__free_get_x#frame| (FrameFragment (MapType0Select Heap@@40 diz@@143 History__x_hist_value)) diz@@143)))
 :qid |stdinbpl.345:15|
 :skolemid |36|
 :pattern ( (state Heap@@40 Mask@@11) (|History__free_get_x'| Heap@@40 diz@@143))
)))
(assert (forall ((Heap@@41 T@U) (Mask@@12 T@U) (diz@@144 T@U) ) (!  (=> (and (and (and (= (type Heap@@41) (MapType0Type RefType)) (= (type Mask@@12) (MapType1Type RefType realType))) (= (type diz@@144) RefType)) (state Heap@@41 Mask@@12)) (= (|History__hist_get_x'| Heap@@41 diz@@144) (|History__hist_get_x#frame| (FrameFragment (MapType0Select Heap@@41 diz@@144 History__x_hist_value)) diz@@144)))
 :qid |stdinbpl.413:15|
 :skolemid |40|
 :pattern ( (state Heap@@41 Mask@@12) (|History__hist_get_x'| Heap@@41 diz@@144))
)))
(assert (forall ((o T@U) (f T@U) (Heap@@42 T@U) ) (!  (=> (and (and (and (= (type o) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap@@42) (MapType0Type RefType))) (U_2_bool (MapType0Select Heap@@42 o $allocated))) (U_2_bool (MapType0Select Heap@@42 (MapType0Select Heap@@42 o f) $allocated)))
 :qid |stdinbpl.31:15|
 :skolemid |0|
 :pattern ( (MapType0Select Heap@@42 o f))
)))
(assert (forall ((diz@@145 T@U) (p_1@@82 Real) ) (!  (=> (= (type diz@@145) RefType) (= (PredicateMaskField (Thread__joinToken diz@@145 p_1@@82)) (|Thread__joinToken#sm| diz@@145 p_1@@82)))
 :qid |stdinbpl.800:15|
 :skolemid |89|
 :pattern ( (PredicateMaskField (Thread__joinToken diz@@145 p_1@@82)))
)))
(assert (forall ((diz@@146 T@U) (p_1@@83 Real) ) (!  (=> (= (type diz@@146) RefType) (= (PredicateMaskField (Thread__preFork diz@@146 p_1@@83)) (|Thread__preFork#sm| diz@@146 p_1@@83)))
 :qid |stdinbpl.835:15|
 :skolemid |95|
 :pattern ( (PredicateMaskField (Thread__preFork diz@@146 p_1@@83)))
)))
(assert (forall ((diz@@147 T@U) (p_1@@84 Real) ) (!  (=> (= (type diz@@147) RefType) (= (PredicateMaskField (Thread__postJoin diz@@147 p_1@@84)) (|Thread__postJoin#sm| diz@@147 p_1@@84)))
 :qid |stdinbpl.870:15|
 :skolemid |101|
 :pattern ( (PredicateMaskField (Thread__postJoin diz@@147 p_1@@84)))
)))
(assert (forall ((diz@@148 T@U) (p_1@@85 Real) ) (!  (=> (= (type diz@@148) RefType) (= (PredicateMaskField (Thread__joinToken_at_Thread diz@@148 p_1@@85)) (|Thread__joinToken_at_Thread#sm| diz@@148 p_1@@85)))
 :qid |stdinbpl.905:15|
 :skolemid |107|
 :pattern ( (PredicateMaskField (Thread__joinToken_at_Thread diz@@148 p_1@@85)))
)))
(assert (forall ((diz@@149 T@U) (p_1@@86 Real) ) (!  (=> (= (type diz@@149) RefType) (= (PredicateMaskField (Thread__preFork_at_Thread diz@@149 p_1@@86)) (|Thread__preFork_at_Thread#sm| diz@@149 p_1@@86)))
 :qid |stdinbpl.940:15|
 :skolemid |113|
 :pattern ( (PredicateMaskField (Thread__preFork_at_Thread diz@@149 p_1@@86)))
)))
(assert (forall ((diz@@150 T@U) (p_1@@87 Real) ) (!  (=> (= (type diz@@150) RefType) (= (PredicateMaskField (Thread__postJoin_at_Thread diz@@150 p_1@@87)) (|Thread__postJoin_at_Thread#sm| diz@@150 p_1@@87)))
 :qid |stdinbpl.989:15|
 :skolemid |119|
 :pattern ( (PredicateMaskField (Thread__postJoin_at_Thread diz@@150 p_1@@87)))
)))
(assert (forall ((diz@@151 T@U) (p_1@@88 Real) ) (!  (=> (= (type diz@@151) RefType) (= (PredicateMaskField (Worker__joinToken diz@@151 p_1@@88)) (|Worker__joinToken#sm| diz@@151 p_1@@88)))
 :qid |stdinbpl.1178:15|
 :skolemid |149|
 :pattern ( (PredicateMaskField (Worker__joinToken diz@@151 p_1@@88)))
)))
(assert (forall ((diz@@152 T@U) (p_1@@89 Real) ) (!  (=> (= (type diz@@152) RefType) (= (PredicateMaskField (Worker__joinToken_at_Worker diz@@152 p_1@@89)) (|Worker__joinToken_at_Worker#sm| diz@@152 p_1@@89)))
 :qid |stdinbpl.1213:15|
 :skolemid |155|
 :pattern ( (PredicateMaskField (Worker__joinToken_at_Worker diz@@152 p_1@@89)))
)))
(assert (forall ((diz@@153 T@U) (p_1@@90 Real) ) (!  (=> (= (type diz@@153) RefType) (= (PredicateMaskField (Worker__preFork diz@@153 p_1@@90)) (|Worker__preFork#sm| diz@@153 p_1@@90)))
 :qid |stdinbpl.1266:15|
 :skolemid |161|
 :pattern ( (PredicateMaskField (Worker__preFork diz@@153 p_1@@90)))
)))
(assert (forall ((diz@@154 T@U) (p_1@@91 Real) ) (!  (=> (= (type diz@@154) RefType) (= (PredicateMaskField (Worker__postJoin diz@@154 p_1@@91)) (|Worker__postJoin#sm| diz@@154 p_1@@91)))
 :qid |stdinbpl.1301:15|
 :skolemid |167|
 :pattern ( (PredicateMaskField (Worker__postJoin diz@@154 p_1@@91)))
)))
(assert (forall ((diz@@155 T@U) (p_1@@92 Real) ) (!  (=> (= (type diz@@155) RefType) (= (PredicateMaskField (Worker__joinToken_at_Thread diz@@155 p_1@@92)) (|Worker__joinToken_at_Thread#sm| diz@@155 p_1@@92)))
 :qid |stdinbpl.1336:15|
 :skolemid |173|
 :pattern ( (PredicateMaskField (Worker__joinToken_at_Thread diz@@155 p_1@@92)))
)))
(assert (forall ((diz@@156 T@U) (p_1@@93 Real) ) (!  (=> (= (type diz@@156) RefType) (= (PredicateMaskField (Worker__preFork_at_Thread diz@@156 p_1@@93)) (|Worker__preFork_at_Thread#sm| diz@@156 p_1@@93)))
 :qid |stdinbpl.1371:15|
 :skolemid |179|
 :pattern ( (PredicateMaskField (Worker__preFork_at_Thread diz@@156 p_1@@93)))
)))
(assert (forall ((diz@@157 T@U) (p_1@@94 Real) ) (!  (=> (= (type diz@@157) RefType) (= (PredicateMaskField (Worker__postJoin_at_Thread diz@@157 p_1@@94)) (|Worker__postJoin_at_Thread#sm| diz@@157 p_1@@94)))
 :qid |stdinbpl.1420:15|
 :skolemid |185|
 :pattern ( (PredicateMaskField (Worker__postJoin_at_Thread diz@@157 p_1@@94)))
)))
(assert (forall ((diz@@158 T@U) (p_1@@95 Real) ) (!  (=> (= (type diz@@158) RefType) (= (PredicateMaskField (Worker__preFork_at_Worker diz@@158 p_1@@95)) (|Worker__preFork_at_Worker#sm| diz@@158 p_1@@95)))
 :qid |stdinbpl.1469:15|
 :skolemid |191|
 :pattern ( (PredicateMaskField (Worker__preFork_at_Worker diz@@158 p_1@@95)))
)))
(assert (forall ((diz@@159 T@U) (p_1@@96 Real) ) (!  (=> (= (type diz@@159) RefType) (= (PredicateMaskField (Worker__postJoin_at_Worker diz@@159 p_1@@96)) (|Worker__postJoin_at_Worker#sm| diz@@159 p_1@@96)))
 :qid |stdinbpl.1568:15|
 :skolemid |197|
 :pattern ( (PredicateMaskField (Worker__postJoin_at_Worker diz@@159 p_1@@96)))
)))
(assert (forall ((diz@@160 T@U) ) (!  (=> (= (type diz@@160) RefType) (= (PredicateMaskField (History__inv diz@@160)) (|History__inv#sm| diz@@160)))
 :qid |stdinbpl.464:15|
 :skolemid |41|
 :pattern ( (PredicateMaskField (History__inv diz@@160)))
)))
(assert (forall ((diz@@161 T@U) ) (!  (=> (= (type diz@@161) RefType) (= (PredicateMaskField (SubjectLock__inv diz@@161)) (|SubjectLock__inv#sm| diz@@161)))
 :qid |stdinbpl.597:15|
 :skolemid |59|
 :pattern ( (PredicateMaskField (SubjectLock__inv diz@@161)))
)))
(assert (forall ((diz@@162 T@U) ) (!  (=> (= (type diz@@162) RefType) (= (PredicateMaskField (SubjectLock__valid diz@@162)) (|SubjectLock__valid#sm| diz@@162)))
 :qid |stdinbpl.660:15|
 :skolemid |65|
 :pattern ( (PredicateMaskField (SubjectLock__valid diz@@162)))
)))
(assert (forall ((diz@@163 T@U) ) (!  (=> (= (type diz@@163) RefType) (= (PredicateMaskField (Thread__is_a_Thread diz@@163)) (|Thread__is_a_Thread#sm| diz@@163)))
 :qid |stdinbpl.730:15|
 :skolemid |77|
 :pattern ( (PredicateMaskField (Thread__is_a_Thread diz@@163)))
)))
(assert (forall ((diz@@164 T@U) ) (!  (=> (= (type diz@@164) RefType) (= (PredicateMaskField (Thread__instance_of_Thread diz@@164)) (|Thread__instance_of_Thread#sm| diz@@164)))
 :qid |stdinbpl.765:15|
 :skolemid |83|
 :pattern ( (PredicateMaskField (Thread__instance_of_Thread diz@@164)))
)))
(assert (forall ((diz@@165 T@U) ) (!  (=> (= (type diz@@165) RefType) (= (PredicateMaskField (Worker__is_a_Worker diz@@165)) (|Worker__is_a_Worker#sm| diz@@165)))
 :qid |stdinbpl.1038:15|
 :skolemid |125|
 :pattern ( (PredicateMaskField (Worker__is_a_Worker diz@@165)))
)))
(assert (forall ((diz@@166 T@U) ) (!  (=> (= (type diz@@166) RefType) (= (PredicateMaskField (Worker__instance_of_Worker diz@@166)) (|Worker__instance_of_Worker#sm| diz@@166)))
 :qid |stdinbpl.1073:15|
 :skolemid |131|
 :pattern ( (PredicateMaskField (Worker__instance_of_Worker diz@@166)))
)))
(assert (forall ((diz@@167 T@U) ) (!  (=> (= (type diz@@167) RefType) (= (PredicateMaskField (Worker__is_a_Thread diz@@167)) (|Worker__is_a_Thread#sm| diz@@167)))
 :qid |stdinbpl.1108:15|
 :skolemid |137|
 :pattern ( (PredicateMaskField (Worker__is_a_Thread diz@@167)))
)))
(assert (forall ((diz@@168 T@U) ) (!  (=> (= (type diz@@168) RefType) (= (PredicateMaskField (Worker__instance_of_Thread diz@@168)) (|Worker__instance_of_Thread#sm| diz@@168)))
 :qid |stdinbpl.1143:15|
 :skolemid |143|
 :pattern ( (PredicateMaskField (Worker__instance_of_Thread diz@@168)))
)))
(assert (forall ((n_1@@1 Int) ) (! (= (p_single n_1@@1) (ite (> n_1@@1 0) (p_seq (p_single (- n_1@@1 1)) p_incr) p_empty))
 :qid |stdinbpl.284:15|
 :skolemid |31|
 :pattern ( (p_single n_1@@1))
)))
(assert (forall ((Heap@@43 T@U) (o@@0 T@U) (f_3 T@U) (v T@U) ) (! (let ((B@@8 (type v)))
(let ((A@@9 (FieldTypeInv0 (type f_3))))
 (=> (and (and (= (type Heap@@43) (MapType0Type RefType)) (= (type o@@0) RefType)) (= (type f_3) (FieldType A@@9 B@@8))) (succHeap Heap@@43 (MapType0Store Heap@@43 o@@0 f_3 v)))))
 :qid |stdinbpl.78:22|
 :skolemid |9|
 :pattern ( (MapType0Store Heap@@43 o@@0 f_3 v))
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
 :qid |stdinbpl.169:25|
 :skolemid |20|
 :pattern ( (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))
)))
(assert (forall ((m_1@@0 Int) (n_1@@2 Int) ) (! (= (p_seq (p_single m_1@@0) (p_single n_1@@2)) (p_single (+ m_1@@0 n_1@@2)))
 :qid |stdinbpl.290:15|
 :skolemid |32|
 :pattern ( (p_seq (p_single m_1@@0) (p_single n_1@@2)))
)))
(assert (forall ((p_1@@97 T@U) ) (!  (=> (= (type p_1@@97) ProcessDomainTypeType) (= (p_seq p_1@@97 p_empty) p_1@@97))
 :qid |stdinbpl.254:15|
 :skolemid |25|
 :pattern ( (p_seq p_1@@97 p_empty))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
; Valid

(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun AssertMask@3 () T@U)
(declare-fun AssertMask@2 () T@U)
(declare-fun freshObj@0 () T@U)
(declare-fun Mask@3 () T@U)
(declare-fun Heap@4 () T@U)
(declare-fun AssertMask@1 () T@U)
(declare-fun AssertMask@0 () T@U)
(declare-fun Heap@@44 () T@U)
(declare-fun diz@@169 () T@U)
(declare-fun Heap@0 () T@U)
(declare-fun Mask@0 () T@U)
(declare-fun Mask@1 () T@U)
(declare-fun Mask@2 () T@U)
(declare-fun Heap@1 () T@U)
(declare-fun Heap@2 () T@U)
(declare-fun Heap@3 () T@U)
(declare-fun PostHeap@0 () T@U)
(declare-fun sys__result () T@U)
(declare-fun PostMask@0 () T@U)
(declare-fun PostMask@1 () T@U)
(declare-fun PostMask@2 () T@U)
(declare-fun PostMask@3 () T@U)
(declare-fun current_thread_id () Int)
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (= (type PostHeap@0) (MapType0Type RefType)) (= (type sys__result) RefType)) (= (type PostMask@0) (MapType1Type RefType realType))) (= (type PostMask@1) (MapType1Type RefType realType))) (= (type PostMask@2) (MapType1Type RefType realType))) (= (type PostMask@3) (MapType1Type RefType realType))) (= (type AssertMask@3) (MapType1Type RefType realType))) (= (type AssertMask@2) (MapType1Type RefType realType))) (= (type freshObj@0) RefType)) (= (type Mask@3) (MapType1Type RefType realType))) (= (type Heap@4) (MapType0Type RefType))) (= (type AssertMask@1) (MapType1Type RefType realType))) (= (type AssertMask@0) (MapType1Type RefType realType))) (= (type Heap@@44) (MapType0Type RefType))) (= (type diz@@169) RefType)) (= (type Heap@0) (MapType0Type RefType))) (= (type Mask@0) (MapType1Type RefType realType))) (= (type Mask@1) (MapType1Type RefType realType))) (= (type Mask@2) (MapType1Type RefType realType))) (= (type Heap@1) (MapType0Type RefType))) (= (type Heap@2) (MapType0Type RefType))) (= (type Heap@3) (MapType0Type RefType))))
(set-info :boogie-vc-id History__History)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 38) (let ((anon10_correct  (=> (= AssertMask@3 (MapType1Store AssertMask@2 freshObj@0 History__x_hist_act (real_2_U (- (U_2_real (MapType1Select AssertMask@2 freshObj@0 History__x_hist_act)) FullPerm)))) (and (=> (= (ControlFlow 0 7) (- 0 9)) (HasDirectPerm Mask@3 freshObj@0 History__x_hist_act)) (=> (HasDirectPerm Mask@3 freshObj@0 History__x_hist_act) (=> (= (ControlFlow 0 7) (- 0 8)) (= (U_2_int (MapType0Select Heap@4 freshObj@0 History__x_hist_act)) 0)))))))
(let ((anon23_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 12) 7)) anon10_correct)))
(let ((anon23_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 10) (- 0 11)) (<= FullPerm (U_2_real (MapType1Select AssertMask@2 freshObj@0 History__x_hist_act)))) (=> (<= FullPerm (U_2_real (MapType1Select AssertMask@2 freshObj@0 History__x_hist_act))) (=> (= (ControlFlow 0 10) 7) anon10_correct))))))
(let ((anon8_correct  (=> (= AssertMask@2 (MapType1Store AssertMask@1 freshObj@0 History__x_hist_init (real_2_U (- (U_2_real (MapType1Select AssertMask@1 freshObj@0 History__x_hist_init)) FullPerm)))) (and (=> (= (ControlFlow 0 13) (- 0 15)) (HasDirectPerm Mask@3 freshObj@0 History__x_hist_init)) (=> (HasDirectPerm Mask@3 freshObj@0 History__x_hist_init) (and (=> (= (ControlFlow 0 13) (- 0 14)) (= (U_2_int (MapType0Select Heap@4 freshObj@0 History__x_hist_init)) 0)) (=> (= (U_2_int (MapType0Select Heap@4 freshObj@0 History__x_hist_init)) 0) (and (=> (= (ControlFlow 0 13) 10) anon23_Then_correct) (=> (= (ControlFlow 0 13) 12) anon23_Else_correct)))))))))
(let ((anon22_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 18) 13)) anon8_correct)))
(let ((anon22_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 16) (- 0 17)) (<= FullPerm (U_2_real (MapType1Select AssertMask@1 freshObj@0 History__x_hist_init)))) (=> (<= FullPerm (U_2_real (MapType1Select AssertMask@1 freshObj@0 History__x_hist_init))) (=> (= (ControlFlow 0 16) 13) anon8_correct))))))
(let ((anon6_correct  (=> (= AssertMask@1 (MapType1Store AssertMask@0 freshObj@0 History__x_hist_mode (real_2_U (- (U_2_real (MapType1Select AssertMask@0 freshObj@0 History__x_hist_mode)) FullPerm)))) (and (=> (= (ControlFlow 0 19) (- 0 21)) (HasDirectPerm Mask@3 freshObj@0 History__x_hist_mode)) (=> (HasDirectPerm Mask@3 freshObj@0 History__x_hist_mode) (and (=> (= (ControlFlow 0 19) (- 0 20)) (= (U_2_int (MapType0Select Heap@4 freshObj@0 History__x_hist_mode)) 0)) (=> (= (U_2_int (MapType0Select Heap@4 freshObj@0 History__x_hist_mode)) 0) (and (=> (= (ControlFlow 0 19) 16) anon22_Then_correct) (=> (= (ControlFlow 0 19) 18) anon22_Else_correct)))))))))
(let ((anon21_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 24) 19)) anon6_correct)))
(let ((anon21_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 22) (- 0 23)) (<= FullPerm (U_2_real (MapType1Select AssertMask@0 freshObj@0 History__x_hist_mode)))) (=> (<= FullPerm (U_2_real (MapType1Select AssertMask@0 freshObj@0 History__x_hist_mode))) (=> (= (ControlFlow 0 22) 19) anon6_correct))))))
(let ((anon4_correct  (=> (= AssertMask@0 (MapType1Store Mask@3 freshObj@0 History__x_hist_value (real_2_U (- (U_2_real (MapType1Select Mask@3 freshObj@0 History__x_hist_value)) FullPerm)))) (and (=> (= (ControlFlow 0 25) (- 0 27)) (HasDirectPerm Mask@3 freshObj@0 History__x_hist_value)) (=> (HasDirectPerm Mask@3 freshObj@0 History__x_hist_value) (and (=> (= (ControlFlow 0 25) (- 0 26)) (= (U_2_int (MapType0Select Heap@4 freshObj@0 History__x_hist_value)) 0)) (=> (= (U_2_int (MapType0Select Heap@4 freshObj@0 History__x_hist_value)) 0) (and (=> (= (ControlFlow 0 25) 22) anon21_Then_correct) (=> (= (ControlFlow 0 25) 24) anon21_Else_correct)))))))))
(let ((anon20_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 30) 25)) anon4_correct)))
(let ((anon20_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 28) (- 0 29)) (<= FullPerm (U_2_real (MapType1Select Mask@3 freshObj@0 History__x_hist_value)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@3 freshObj@0 History__x_hist_value))) (=> (= (ControlFlow 0 28) 25) anon4_correct))))))
(let ((anon19_Else_correct  (=> (U_2_bool (MapType0Select Heap@@44 diz@@169 $allocated)) (=> (and (not (= freshObj@0 null)) (not (U_2_bool (MapType0Select Heap@@44 freshObj@0 $allocated)))) (=> (and (and (and (= Heap@0 (MapType0Store Heap@@44 freshObj@0 $allocated (bool_2_U true))) (= Mask@0 (MapType1Store ZeroMask freshObj@0 History__x_hist_value (real_2_U (+ (U_2_real (MapType1Select ZeroMask freshObj@0 History__x_hist_value)) FullPerm))))) (and (= Mask@1 (MapType1Store Mask@0 freshObj@0 History__x_hist_mode (real_2_U (+ (U_2_real (MapType1Select Mask@0 freshObj@0 History__x_hist_mode)) FullPerm)))) (= Mask@2 (MapType1Store Mask@1 freshObj@0 History__x_hist_init (real_2_U (+ (U_2_real (MapType1Select Mask@1 freshObj@0 History__x_hist_init)) FullPerm)))))) (and (and (= Mask@3 (MapType1Store Mask@2 freshObj@0 History__x_hist_act (real_2_U (+ (U_2_real (MapType1Select Mask@2 freshObj@0 History__x_hist_act)) FullPerm)))) (state Heap@0 Mask@3)) (and (state Heap@0 Mask@3) (state Heap@0 Mask@3)))) (and (=> (= (ControlFlow 0 31) (- 0 36)) (= FullPerm (U_2_real (MapType1Select Mask@3 freshObj@0 History__x_hist_value)))) (=> (= FullPerm (U_2_real (MapType1Select Mask@3 freshObj@0 History__x_hist_value))) (=> (and (and (= Heap@1 (MapType0Store Heap@0 freshObj@0 History__x_hist_value (int_2_U 0))) (state Heap@1 Mask@3)) (and (state Heap@1 Mask@3) (state Heap@1 Mask@3))) (and (=> (= (ControlFlow 0 31) (- 0 35)) (= FullPerm (U_2_real (MapType1Select Mask@3 freshObj@0 History__x_hist_mode)))) (=> (= FullPerm (U_2_real (MapType1Select Mask@3 freshObj@0 History__x_hist_mode))) (=> (and (and (= Heap@2 (MapType0Store Heap@1 freshObj@0 History__x_hist_mode (int_2_U 0))) (state Heap@2 Mask@3)) (and (state Heap@2 Mask@3) (state Heap@2 Mask@3))) (and (=> (= (ControlFlow 0 31) (- 0 34)) (= FullPerm (U_2_real (MapType1Select Mask@3 freshObj@0 History__x_hist_init)))) (=> (= FullPerm (U_2_real (MapType1Select Mask@3 freshObj@0 History__x_hist_init))) (=> (and (and (= Heap@3 (MapType0Store Heap@2 freshObj@0 History__x_hist_init (int_2_U 0))) (state Heap@3 Mask@3)) (and (state Heap@3 Mask@3) (state Heap@3 Mask@3))) (and (=> (= (ControlFlow 0 31) (- 0 33)) (= FullPerm (U_2_real (MapType1Select Mask@3 freshObj@0 History__x_hist_act)))) (=> (= FullPerm (U_2_real (MapType1Select Mask@3 freshObj@0 History__x_hist_act))) (=> (= Heap@4 (MapType0Store Heap@3 freshObj@0 History__x_hist_act (int_2_U 0))) (=> (and (state Heap@4 Mask@3) (state Heap@4 Mask@3)) (and (=> (= (ControlFlow 0 31) (- 0 32)) (not (= freshObj@0 null))) (=> (not (= freshObj@0 null)) (and (=> (= (ControlFlow 0 31) 28) anon20_Then_correct) (=> (= (ControlFlow 0 31) 30) anon20_Else_correct))))))))))))))))))))))
(let ((anon19_Then_correct  (=> (and (state PostHeap@0 ZeroMask) (not (= sys__result null))) (=> (and (and (state PostHeap@0 ZeroMask) (not (= sys__result null))) (and (= PostMask@0 (MapType1Store ZeroMask sys__result History__x_hist_value (real_2_U (+ (U_2_real (MapType1Select ZeroMask sys__result History__x_hist_value)) FullPerm)))) (state PostHeap@0 PostMask@0))) (and (=> (= (ControlFlow 0 2) (- 0 5)) (HasDirectPerm PostMask@0 sys__result History__x_hist_value)) (=> (HasDirectPerm PostMask@0 sys__result History__x_hist_value) (=> (= (U_2_int (MapType0Select PostHeap@0 sys__result History__x_hist_value)) 0) (=> (and (and (state PostHeap@0 PostMask@0) (not (= sys__result null))) (and (= PostMask@1 (MapType1Store PostMask@0 sys__result History__x_hist_mode (real_2_U (+ (U_2_real (MapType1Select PostMask@0 sys__result History__x_hist_mode)) FullPerm)))) (state PostHeap@0 PostMask@1))) (and (=> (= (ControlFlow 0 2) (- 0 4)) (HasDirectPerm PostMask@1 sys__result History__x_hist_mode)) (=> (HasDirectPerm PostMask@1 sys__result History__x_hist_mode) (=> (= (U_2_int (MapType0Select PostHeap@0 sys__result History__x_hist_mode)) 0) (=> (and (and (state PostHeap@0 PostMask@1) (not (= sys__result null))) (and (= PostMask@2 (MapType1Store PostMask@1 sys__result History__x_hist_init (real_2_U (+ (U_2_real (MapType1Select PostMask@1 sys__result History__x_hist_init)) FullPerm)))) (state PostHeap@0 PostMask@2))) (and (=> (= (ControlFlow 0 2) (- 0 3)) (HasDirectPerm PostMask@2 sys__result History__x_hist_init)) (=> (HasDirectPerm PostMask@2 sys__result History__x_hist_init) (=> (and (= (U_2_int (MapType0Select PostHeap@0 sys__result History__x_hist_init)) 0) (state PostHeap@0 PostMask@2)) (=> (and (and (not (= sys__result null)) (= PostMask@3 (MapType1Store PostMask@2 sys__result History__x_hist_act (real_2_U (+ (U_2_real (MapType1Select PostMask@2 sys__result History__x_hist_act)) FullPerm))))) (and (state PostHeap@0 PostMask@3) (= (ControlFlow 0 2) (- 0 1)))) (HasDirectPerm PostMask@3 sys__result History__x_hist_act)))))))))))))))))
(let ((anon0_correct  (=> (and (and (state Heap@@44 ZeroMask) (= AssumeFunctionsAbove (- 0 1))) (and (>= current_thread_id 0) (state Heap@@44 ZeroMask))) (and (=> (= (ControlFlow 0 37) 2) anon19_Then_correct) (=> (= (ControlFlow 0 37) 31) anon19_Else_correct)))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 38) 37) anon0_correct)))
PreconditionGeneratedEntry_correct)))))))))))))))))
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
(declare-fun History__x_hist_value () T@U)
(declare-fun History__x_hist_mode () T@U)
(declare-fun History__x_hist_init () T@U)
(declare-fun History__x_hist_act () T@U)
(declare-fun SubjectLock__subject () T@U)
(declare-fun Worker__l () T@U)
(declare-fun Worker__s () T@U)
(declare-fun FieldType (T@T T@T) T@T)
(declare-fun FieldTypeInv0 (T@T) T@T)
(declare-fun FieldTypeInv1 (T@T) T@T)
(declare-fun NormalFieldType () T@T)
(declare-fun RefType () T@T)
(declare-fun p_single (Int) T@U)
(declare-fun p_seq (T@U T@U) T@U)
(declare-fun p_incr () T@U)
(declare-fun p_empty () T@U)
(declare-fun ProcessDomainTypeType () T@T)
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
(declare-fun History__hist_do_incr (T@U Real T@U) T@U)
(declare-fun IsPredicateField (T@U) Bool)
(declare-fun PredicateType_History__hist_do_incrType () T@T)
(declare-fun FrameTypeType () T@T)
(declare-fun History__hist_idle (T@U Real T@U) T@U)
(declare-fun PredicateType_History__hist_idleType () T@T)
(declare-fun SubjectLock__locked (T@U Real Int) T@U)
(declare-fun PredicateType_SubjectLock__lockedType () T@T)
(declare-fun |History__hist_do_incr#trigger| (T@U T@U) Bool)
(declare-fun |History__hist_do_incr#everUsed| (T@U) Bool)
(declare-fun |History__hist_idle#trigger| (T@U T@U) Bool)
(declare-fun |History__hist_idle#everUsed| (T@U) Bool)
(declare-fun |SubjectLock__locked#trigger| (T@U T@U) Bool)
(declare-fun |SubjectLock__locked#everUsed| (T@U) Bool)
(declare-fun getPredWandId (T@U) Int)
(declare-fun Thread__joinToken (T@U Real) T@U)
(declare-fun PredicateType_Thread__joinTokenType () T@T)
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
(declare-fun History__inv (T@U) T@U)
(declare-fun PredicateType_History__invType () T@T)
(declare-fun SubjectLock__inv (T@U) T@U)
(declare-fun PredicateType_SubjectLock__invType () T@T)
(declare-fun SubjectLock__valid (T@U) T@U)
(declare-fun PredicateType_SubjectLock__validType () T@T)
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
(declare-fun |History__free_get_x'| (T@U T@U) Int)
(declare-fun dummyFunction (T@U) Bool)
(declare-fun |History__free_get_x#triggerStateless| (T@U) Int)
(declare-fun |History__hist_get_x'| (T@U T@U) Int)
(declare-fun |History__hist_get_x#triggerStateless| (T@U) Int)
(declare-fun |History__inv#trigger| (T@U T@U) Bool)
(declare-fun |History__inv#everUsed| (T@U) Bool)
(declare-fun |SubjectLock__inv#trigger| (T@U T@U) Bool)
(declare-fun |SubjectLock__inv#everUsed| (T@U) Bool)
(declare-fun |SubjectLock__valid#trigger| (T@U T@U) Bool)
(declare-fun |SubjectLock__valid#everUsed| (T@U) Bool)
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
(declare-fun |History__hist_do_incr#sm| (T@U Real T@U) T@U)
(declare-fun |History__hist_idle#sm| (T@U Real T@U) T@U)
(declare-fun |SubjectLock__locked#sm| (T@U Real Int) T@U)
(declare-fun History__free_get_x (T@U T@U) Int)
(declare-fun History__hist_get_x (T@U T@U) Int)
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
(declare-fun p_dual (Int Int) T@U)
(declare-fun p_merge (T@U T@U) T@U)
(declare-fun |History__inv#sm| (T@U) T@U)
(declare-fun |SubjectLock__inv#sm| (T@U) T@U)
(declare-fun |SubjectLock__valid#sm| (T@U) T@U)
(declare-fun |Thread__is_a_Thread#sm| (T@U) T@U)
(declare-fun |Thread__instance_of_Thread#sm| (T@U) T@U)
(declare-fun |Worker__is_a_Worker#sm| (T@U) T@U)
(declare-fun |Worker__instance_of_Worker#sm| (T@U) T@U)
(declare-fun |Worker__is_a_Thread#sm| (T@U) T@U)
(declare-fun |Worker__instance_of_Thread#sm| (T@U) T@U)
(declare-fun dummyHeap () T@U)
(declare-fun ZeroMask () T@U)
(declare-fun InsidePredicate (T@U T@U T@U T@U) Bool)
(declare-fun AssumeFunctionsAbove () Int)
(declare-fun sumMask (T@U T@U T@U) Bool)
(declare-fun ConditionalFrame (Real T@U) T@U)
(declare-fun EmptyFrame () T@U)
(declare-fun NoPerm () Real)
(declare-fun instanceof (T@U T@U) Bool)
(declare-fun class_Object () T@U)
(declare-fun TYPEDomainTypeType () T@T)
(declare-fun FullPerm () Real)
(declare-fun |History__free_get_x#frame| (T@U T@U) Int)
(declare-fun FrameFragment (T@U) T@U)
(declare-fun |History__hist_get_x#frame| (T@U T@U) Int)
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
))) (= (Ctor NormalFieldType) 7)) (= (type $allocated) (FieldType NormalFieldType boolType))) (= (type History__x_hist_value) (FieldType NormalFieldType intType))) (= (type History__x_hist_mode) (FieldType NormalFieldType intType))) (= (type History__x_hist_init) (FieldType NormalFieldType intType))) (= (type History__x_hist_act) (FieldType NormalFieldType intType))) (= (Ctor RefType) 8)) (= (type SubjectLock__subject) (FieldType NormalFieldType RefType))) (= (type Worker__l) (FieldType NormalFieldType RefType))) (= (type Worker__s) (FieldType NormalFieldType RefType))))
(assert (distinct $allocated History__x_hist_value History__x_hist_mode History__x_hist_init History__x_hist_act SubjectLock__subject Worker__l Worker__s)
)
(assert  (and (and (and (and (= (Ctor ProcessDomainTypeType) 9) (forall ((arg0@@14 Int) ) (! (= (type (p_single arg0@@14)) ProcessDomainTypeType)
 :qid |funType:p_single|
 :pattern ( (p_single arg0@@14))
))) (forall ((arg0@@15 T@U) (arg1@@2 T@U) ) (! (= (type (p_seq arg0@@15 arg1@@2)) ProcessDomainTypeType)
 :qid |funType:p_seq|
 :pattern ( (p_seq arg0@@15 arg1@@2))
))) (= (type p_incr) ProcessDomainTypeType)) (= (type p_empty) ProcessDomainTypeType)))
(assert (forall ((n_1 Int) ) (! (= (ite (> n_1 0) (p_seq p_incr (p_single (- n_1 1))) p_empty) (p_single n_1))
 :qid |stdinbpl.272:15|
 :skolemid |29|
 :pattern ( (p_single n_1))
)))
(assert  (and (and (and (and (and (forall ((arg0@@16 T@T) ) (! (= (Ctor (MapType0Type arg0@@16)) 10)
 :qid |ctor:MapType0Type|
)) (forall ((arg0@@17 T@T) ) (! (= (MapType0TypeInv0 (MapType0Type arg0@@17)) arg0@@17)
 :qid |typeInv:MapType0TypeInv0|
 :pattern ( (MapType0Type arg0@@17))
))) (forall ((arg0@@18 T@U) (arg1@@3 T@U) (arg2 T@U) ) (! (let ((B (FieldTypeInv1 (type arg2))))
(= (type (MapType0Select arg0@@18 arg1@@3 arg2)) B))
 :qid |funType:MapType0Select|
 :pattern ( (MapType0Select arg0@@18 arg1@@3 arg2))
))) (forall ((arg0@@19 T@U) (arg1@@4 T@U) (arg2@@0 T@U) (arg3 T@U) ) (! (let ((aVar0 (type arg1@@4)))
(= (type (MapType0Store arg0@@19 arg1@@4 arg2@@0 arg3)) (MapType0Type aVar0)))
 :qid |funType:MapType0Store|
 :pattern ( (MapType0Store arg0@@19 arg1@@4 arg2@@0 arg3))
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
(assert  (and (and (and (and (and (and (forall ((arg0@@20 T@T) (arg1@@5 T@T) ) (! (= (Ctor (MapType1Type arg0@@20 arg1@@5)) 11)
 :qid |ctor:MapType1Type|
)) (forall ((arg0@@21 T@T) (arg1@@6 T@T) ) (! (= (MapType1TypeInv0 (MapType1Type arg0@@21 arg1@@6)) arg0@@21)
 :qid |typeInv:MapType1TypeInv0|
 :pattern ( (MapType1Type arg0@@21 arg1@@6))
))) (forall ((arg0@@22 T@T) (arg1@@7 T@T) ) (! (= (MapType1TypeInv1 (MapType1Type arg0@@22 arg1@@7)) arg1@@7)
 :qid |typeInv:MapType1TypeInv1|
 :pattern ( (MapType1Type arg0@@22 arg1@@7))
))) (forall ((arg0@@23 T@U) (arg1@@8 T@U) (arg2@@1 T@U) ) (! (let ((aVar1 (MapType1TypeInv1 (type arg0@@23))))
(= (type (MapType1Select arg0@@23 arg1@@8 arg2@@1)) aVar1))
 :qid |funType:MapType1Select|
 :pattern ( (MapType1Select arg0@@23 arg1@@8 arg2@@1))
))) (forall ((arg0@@24 T@U) (arg1@@9 T@U) (arg2@@2 T@U) (arg3@@0 T@U) ) (! (let ((aVar1@@0 (type arg3@@0)))
(let ((aVar0@@0 (type arg1@@9)))
(= (type (MapType1Store arg0@@24 arg1@@9 arg2@@2 arg3@@0)) (MapType1Type aVar0@@0 aVar1@@0))))
 :qid |funType:MapType1Store|
 :pattern ( (MapType1Store arg0@@24 arg1@@9 arg2@@2 arg3@@0))
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
(assert  (and (and (= (Ctor PredicateType_History__hist_do_incrType) 12) (= (Ctor FrameTypeType) 13)) (forall ((arg0@@25 T@U) (arg1@@10 Real) (arg2@@3 T@U) ) (! (= (type (History__hist_do_incr arg0@@25 arg1@@10 arg2@@3)) (FieldType PredicateType_History__hist_do_incrType FrameTypeType))
 :qid |funType:History__hist_do_incr|
 :pattern ( (History__hist_do_incr arg0@@25 arg1@@10 arg2@@3))
))))
(assert (forall ((diz T@U) (frac Real) (proc T@U) ) (!  (=> (and (= (type diz) RefType) (= (type proc) ProcessDomainTypeType)) (IsPredicateField (History__hist_do_incr diz frac proc)))
 :qid |stdinbpl.531:15|
 :skolemid |48|
 :pattern ( (History__hist_do_incr diz frac proc))
)))
(assert  (and (= (Ctor PredicateType_History__hist_idleType) 14) (forall ((arg0@@26 T@U) (arg1@@11 Real) (arg2@@4 T@U) ) (! (= (type (History__hist_idle arg0@@26 arg1@@11 arg2@@4)) (FieldType PredicateType_History__hist_idleType FrameTypeType))
 :qid |funType:History__hist_idle|
 :pattern ( (History__hist_idle arg0@@26 arg1@@11 arg2@@4))
))))
(assert (forall ((diz@@0 T@U) (frac@@0 Real) (proc@@0 T@U) ) (!  (=> (and (= (type diz@@0) RefType) (= (type proc@@0) ProcessDomainTypeType)) (IsPredicateField (History__hist_idle diz@@0 frac@@0 proc@@0)))
 :qid |stdinbpl.566:15|
 :skolemid |54|
 :pattern ( (History__hist_idle diz@@0 frac@@0 proc@@0))
)))
(assert  (and (= (Ctor PredicateType_SubjectLock__lockedType) 15) (forall ((arg0@@27 T@U) (arg1@@12 Real) (arg2@@5 Int) ) (! (= (type (SubjectLock__locked arg0@@27 arg1@@12 arg2@@5)) (FieldType PredicateType_SubjectLock__lockedType FrameTypeType))
 :qid |funType:SubjectLock__locked|
 :pattern ( (SubjectLock__locked arg0@@27 arg1@@12 arg2@@5))
))))
(assert (forall ((diz@@1 T@U) (p_1 Real) (count Int) ) (!  (=> (= (type diz@@1) RefType) (IsPredicateField (SubjectLock__locked diz@@1 p_1 count)))
 :qid |stdinbpl.699:15|
 :skolemid |72|
 :pattern ( (SubjectLock__locked diz@@1 p_1 count))
)))
(assert (forall ((Heap@@0 T@U) (diz@@2 T@U) (frac@@1 Real) (proc@@1 T@U) ) (!  (=> (and (and (= (type Heap@@0) (MapType0Type RefType)) (= (type diz@@2) RefType)) (= (type proc@@1) ProcessDomainTypeType)) (|History__hist_do_incr#everUsed| (History__hist_do_incr diz@@2 frac@@1 proc@@1)))
 :qid |stdinbpl.550:15|
 :skolemid |52|
 :pattern ( (|History__hist_do_incr#trigger| Heap@@0 (History__hist_do_incr diz@@2 frac@@1 proc@@1)))
)))
(assert (forall ((Heap@@1 T@U) (diz@@3 T@U) (frac@@2 Real) (proc@@2 T@U) ) (!  (=> (and (and (= (type Heap@@1) (MapType0Type RefType)) (= (type diz@@3) RefType)) (= (type proc@@2) ProcessDomainTypeType)) (|History__hist_idle#everUsed| (History__hist_idle diz@@3 frac@@2 proc@@2)))
 :qid |stdinbpl.585:15|
 :skolemid |58|
 :pattern ( (|History__hist_idle#trigger| Heap@@1 (History__hist_idle diz@@3 frac@@2 proc@@2)))
)))
(assert (forall ((Heap@@2 T@U) (diz@@4 T@U) (p_1@@0 Real) (count@@0 Int) ) (!  (=> (and (= (type Heap@@2) (MapType0Type RefType)) (= (type diz@@4) RefType)) (|SubjectLock__locked#everUsed| (SubjectLock__locked diz@@4 p_1@@0 count@@0)))
 :qid |stdinbpl.718:15|
 :skolemid |76|
 :pattern ( (|SubjectLock__locked#trigger| Heap@@2 (SubjectLock__locked diz@@4 p_1@@0 count@@0)))
)))
(assert (forall ((diz@@5 T@U) (frac@@3 Real) (proc@@3 T@U) ) (!  (=> (and (= (type diz@@5) RefType) (= (type proc@@3) ProcessDomainTypeType)) (= (getPredWandId (History__hist_do_incr diz@@5 frac@@3 proc@@3)) 1))
 :qid |stdinbpl.535:15|
 :skolemid |49|
 :pattern ( (History__hist_do_incr diz@@5 frac@@3 proc@@3))
)))
(assert (forall ((diz@@6 T@U) (frac@@4 Real) (proc@@4 T@U) ) (!  (=> (and (= (type diz@@6) RefType) (= (type proc@@4) ProcessDomainTypeType)) (= (getPredWandId (History__hist_idle diz@@6 frac@@4 proc@@4)) 2))
 :qid |stdinbpl.570:15|
 :skolemid |55|
 :pattern ( (History__hist_idle diz@@6 frac@@4 proc@@4))
)))
(assert (forall ((diz@@7 T@U) (p_1@@1 Real) (count@@1 Int) ) (!  (=> (= (type diz@@7) RefType) (= (getPredWandId (SubjectLock__locked diz@@7 p_1@@1 count@@1)) 5))
 :qid |stdinbpl.703:15|
 :skolemid |73|
 :pattern ( (SubjectLock__locked diz@@7 p_1@@1 count@@1))
)))
(assert  (and (= (Ctor PredicateType_Thread__joinTokenType) 16) (forall ((arg0@@28 T@U) (arg1@@13 Real) ) (! (= (type (Thread__joinToken arg0@@28 arg1@@13)) (FieldType PredicateType_Thread__joinTokenType FrameTypeType))
 :qid |funType:Thread__joinToken|
 :pattern ( (Thread__joinToken arg0@@28 arg1@@13))
))))
(assert (forall ((diz@@8 T@U) (p_1@@2 Real) ) (!  (=> (= (type diz@@8) RefType) (IsPredicateField (Thread__joinToken diz@@8 p_1@@2)))
 :qid |stdinbpl.804:15|
 :skolemid |90|
 :pattern ( (Thread__joinToken diz@@8 p_1@@2))
)))
(assert  (and (= (Ctor PredicateType_Thread__preForkType) 17) (forall ((arg0@@29 T@U) (arg1@@14 Real) ) (! (= (type (Thread__preFork arg0@@29 arg1@@14)) (FieldType PredicateType_Thread__preForkType FrameTypeType))
 :qid |funType:Thread__preFork|
 :pattern ( (Thread__preFork arg0@@29 arg1@@14))
))))
(assert (forall ((diz@@9 T@U) (p_1@@3 Real) ) (!  (=> (= (type diz@@9) RefType) (IsPredicateField (Thread__preFork diz@@9 p_1@@3)))
 :qid |stdinbpl.839:15|
 :skolemid |96|
 :pattern ( (Thread__preFork diz@@9 p_1@@3))
)))
(assert  (and (= (Ctor PredicateType_Thread__postJoinType) 18) (forall ((arg0@@30 T@U) (arg1@@15 Real) ) (! (= (type (Thread__postJoin arg0@@30 arg1@@15)) (FieldType PredicateType_Thread__postJoinType FrameTypeType))
 :qid |funType:Thread__postJoin|
 :pattern ( (Thread__postJoin arg0@@30 arg1@@15))
))))
(assert (forall ((diz@@10 T@U) (p_1@@4 Real) ) (!  (=> (= (type diz@@10) RefType) (IsPredicateField (Thread__postJoin diz@@10 p_1@@4)))
 :qid |stdinbpl.874:15|
 :skolemid |102|
 :pattern ( (Thread__postJoin diz@@10 p_1@@4))
)))
(assert  (and (= (Ctor PredicateType_Thread__joinToken_at_ThreadType) 19) (forall ((arg0@@31 T@U) (arg1@@16 Real) ) (! (= (type (Thread__joinToken_at_Thread arg0@@31 arg1@@16)) (FieldType PredicateType_Thread__joinToken_at_ThreadType FrameTypeType))
 :qid |funType:Thread__joinToken_at_Thread|
 :pattern ( (Thread__joinToken_at_Thread arg0@@31 arg1@@16))
))))
(assert (forall ((diz@@11 T@U) (p_1@@5 Real) ) (!  (=> (= (type diz@@11) RefType) (IsPredicateField (Thread__joinToken_at_Thread diz@@11 p_1@@5)))
 :qid |stdinbpl.909:15|
 :skolemid |108|
 :pattern ( (Thread__joinToken_at_Thread diz@@11 p_1@@5))
)))
(assert  (and (= (Ctor PredicateType_Thread__preFork_at_ThreadType) 20) (forall ((arg0@@32 T@U) (arg1@@17 Real) ) (! (= (type (Thread__preFork_at_Thread arg0@@32 arg1@@17)) (FieldType PredicateType_Thread__preFork_at_ThreadType FrameTypeType))
 :qid |funType:Thread__preFork_at_Thread|
 :pattern ( (Thread__preFork_at_Thread arg0@@32 arg1@@17))
))))
(assert (forall ((diz@@12 T@U) (p_1@@6 Real) ) (!  (=> (= (type diz@@12) RefType) (IsPredicateField (Thread__preFork_at_Thread diz@@12 p_1@@6)))
 :qid |stdinbpl.944:15|
 :skolemid |114|
 :pattern ( (Thread__preFork_at_Thread diz@@12 p_1@@6))
)))
(assert  (and (= (Ctor PredicateType_Thread__postJoin_at_ThreadType) 21) (forall ((arg0@@33 T@U) (arg1@@18 Real) ) (! (= (type (Thread__postJoin_at_Thread arg0@@33 arg1@@18)) (FieldType PredicateType_Thread__postJoin_at_ThreadType FrameTypeType))
 :qid |funType:Thread__postJoin_at_Thread|
 :pattern ( (Thread__postJoin_at_Thread arg0@@33 arg1@@18))
))))
(assert (forall ((diz@@13 T@U) (p_1@@7 Real) ) (!  (=> (= (type diz@@13) RefType) (IsPredicateField (Thread__postJoin_at_Thread diz@@13 p_1@@7)))
 :qid |stdinbpl.993:15|
 :skolemid |120|
 :pattern ( (Thread__postJoin_at_Thread diz@@13 p_1@@7))
)))
(assert  (and (= (Ctor PredicateType_Worker__joinTokenType) 22) (forall ((arg0@@34 T@U) (arg1@@19 Real) ) (! (= (type (Worker__joinToken arg0@@34 arg1@@19)) (FieldType PredicateType_Worker__joinTokenType FrameTypeType))
 :qid |funType:Worker__joinToken|
 :pattern ( (Worker__joinToken arg0@@34 arg1@@19))
))))
(assert (forall ((diz@@14 T@U) (p_1@@8 Real) ) (!  (=> (= (type diz@@14) RefType) (IsPredicateField (Worker__joinToken diz@@14 p_1@@8)))
 :qid |stdinbpl.1182:15|
 :skolemid |150|
 :pattern ( (Worker__joinToken diz@@14 p_1@@8))
)))
(assert  (and (= (Ctor PredicateType_Worker__joinToken_at_WorkerType) 23) (forall ((arg0@@35 T@U) (arg1@@20 Real) ) (! (= (type (Worker__joinToken_at_Worker arg0@@35 arg1@@20)) (FieldType PredicateType_Worker__joinToken_at_WorkerType FrameTypeType))
 :qid |funType:Worker__joinToken_at_Worker|
 :pattern ( (Worker__joinToken_at_Worker arg0@@35 arg1@@20))
))))
(assert (forall ((diz@@15 T@U) (p_1@@9 Real) ) (!  (=> (= (type diz@@15) RefType) (IsPredicateField (Worker__joinToken_at_Worker diz@@15 p_1@@9)))
 :qid |stdinbpl.1217:15|
 :skolemid |156|
 :pattern ( (Worker__joinToken_at_Worker diz@@15 p_1@@9))
)))
(assert  (and (= (Ctor PredicateType_Worker__preForkType) 24) (forall ((arg0@@36 T@U) (arg1@@21 Real) ) (! (= (type (Worker__preFork arg0@@36 arg1@@21)) (FieldType PredicateType_Worker__preForkType FrameTypeType))
 :qid |funType:Worker__preFork|
 :pattern ( (Worker__preFork arg0@@36 arg1@@21))
))))
(assert (forall ((diz@@16 T@U) (p_1@@10 Real) ) (!  (=> (= (type diz@@16) RefType) (IsPredicateField (Worker__preFork diz@@16 p_1@@10)))
 :qid |stdinbpl.1270:15|
 :skolemid |162|
 :pattern ( (Worker__preFork diz@@16 p_1@@10))
)))
(assert  (and (= (Ctor PredicateType_Worker__postJoinType) 25) (forall ((arg0@@37 T@U) (arg1@@22 Real) ) (! (= (type (Worker__postJoin arg0@@37 arg1@@22)) (FieldType PredicateType_Worker__postJoinType FrameTypeType))
 :qid |funType:Worker__postJoin|
 :pattern ( (Worker__postJoin arg0@@37 arg1@@22))
))))
(assert (forall ((diz@@17 T@U) (p_1@@11 Real) ) (!  (=> (= (type diz@@17) RefType) (IsPredicateField (Worker__postJoin diz@@17 p_1@@11)))
 :qid |stdinbpl.1305:15|
 :skolemid |168|
 :pattern ( (Worker__postJoin diz@@17 p_1@@11))
)))
(assert  (and (= (Ctor PredicateType_Worker__joinToken_at_ThreadType) 26) (forall ((arg0@@38 T@U) (arg1@@23 Real) ) (! (= (type (Worker__joinToken_at_Thread arg0@@38 arg1@@23)) (FieldType PredicateType_Worker__joinToken_at_ThreadType FrameTypeType))
 :qid |funType:Worker__joinToken_at_Thread|
 :pattern ( (Worker__joinToken_at_Thread arg0@@38 arg1@@23))
))))
(assert (forall ((diz@@18 T@U) (p_1@@12 Real) ) (!  (=> (= (type diz@@18) RefType) (IsPredicateField (Worker__joinToken_at_Thread diz@@18 p_1@@12)))
 :qid |stdinbpl.1340:15|
 :skolemid |174|
 :pattern ( (Worker__joinToken_at_Thread diz@@18 p_1@@12))
)))
(assert  (and (= (Ctor PredicateType_Worker__preFork_at_ThreadType) 27) (forall ((arg0@@39 T@U) (arg1@@24 Real) ) (! (= (type (Worker__preFork_at_Thread arg0@@39 arg1@@24)) (FieldType PredicateType_Worker__preFork_at_ThreadType FrameTypeType))
 :qid |funType:Worker__preFork_at_Thread|
 :pattern ( (Worker__preFork_at_Thread arg0@@39 arg1@@24))
))))
(assert (forall ((diz@@19 T@U) (p_1@@13 Real) ) (!  (=> (= (type diz@@19) RefType) (IsPredicateField (Worker__preFork_at_Thread diz@@19 p_1@@13)))
 :qid |stdinbpl.1375:15|
 :skolemid |180|
 :pattern ( (Worker__preFork_at_Thread diz@@19 p_1@@13))
)))
(assert  (and (= (Ctor PredicateType_Worker__postJoin_at_ThreadType) 28) (forall ((arg0@@40 T@U) (arg1@@25 Real) ) (! (= (type (Worker__postJoin_at_Thread arg0@@40 arg1@@25)) (FieldType PredicateType_Worker__postJoin_at_ThreadType FrameTypeType))
 :qid |funType:Worker__postJoin_at_Thread|
 :pattern ( (Worker__postJoin_at_Thread arg0@@40 arg1@@25))
))))
(assert (forall ((diz@@20 T@U) (p_1@@14 Real) ) (!  (=> (= (type diz@@20) RefType) (IsPredicateField (Worker__postJoin_at_Thread diz@@20 p_1@@14)))
 :qid |stdinbpl.1424:15|
 :skolemid |186|
 :pattern ( (Worker__postJoin_at_Thread diz@@20 p_1@@14))
)))
(assert  (and (= (Ctor PredicateType_Worker__preFork_at_WorkerType) 29) (forall ((arg0@@41 T@U) (arg1@@26 Real) ) (! (= (type (Worker__preFork_at_Worker arg0@@41 arg1@@26)) (FieldType PredicateType_Worker__preFork_at_WorkerType FrameTypeType))
 :qid |funType:Worker__preFork_at_Worker|
 :pattern ( (Worker__preFork_at_Worker arg0@@41 arg1@@26))
))))
(assert (forall ((diz@@21 T@U) (p_1@@15 Real) ) (!  (=> (= (type diz@@21) RefType) (IsPredicateField (Worker__preFork_at_Worker diz@@21 p_1@@15)))
 :qid |stdinbpl.1473:15|
 :skolemid |192|
 :pattern ( (Worker__preFork_at_Worker diz@@21 p_1@@15))
)))
(assert  (and (= (Ctor PredicateType_Worker__postJoin_at_WorkerType) 30) (forall ((arg0@@42 T@U) (arg1@@27 Real) ) (! (= (type (Worker__postJoin_at_Worker arg0@@42 arg1@@27)) (FieldType PredicateType_Worker__postJoin_at_WorkerType FrameTypeType))
 :qid |funType:Worker__postJoin_at_Worker|
 :pattern ( (Worker__postJoin_at_Worker arg0@@42 arg1@@27))
))))
(assert (forall ((diz@@22 T@U) (p_1@@16 Real) ) (!  (=> (= (type diz@@22) RefType) (IsPredicateField (Worker__postJoin_at_Worker diz@@22 p_1@@16)))
 :qid |stdinbpl.1572:15|
 :skolemid |198|
 :pattern ( (Worker__postJoin_at_Worker diz@@22 p_1@@16))
)))
(assert (forall ((Heap@@3 T@U) (diz@@23 T@U) (p_1@@17 Real) ) (!  (=> (and (= (type Heap@@3) (MapType0Type RefType)) (= (type diz@@23) RefType)) (|Thread__joinToken#everUsed| (Thread__joinToken diz@@23 p_1@@17)))
 :qid |stdinbpl.823:15|
 :skolemid |94|
 :pattern ( (|Thread__joinToken#trigger| Heap@@3 (Thread__joinToken diz@@23 p_1@@17)))
)))
(assert (forall ((Heap@@4 T@U) (diz@@24 T@U) (p_1@@18 Real) ) (!  (=> (and (= (type Heap@@4) (MapType0Type RefType)) (= (type diz@@24) RefType)) (|Thread__preFork#everUsed| (Thread__preFork diz@@24 p_1@@18)))
 :qid |stdinbpl.858:15|
 :skolemid |100|
 :pattern ( (|Thread__preFork#trigger| Heap@@4 (Thread__preFork diz@@24 p_1@@18)))
)))
(assert (forall ((Heap@@5 T@U) (diz@@25 T@U) (p_1@@19 Real) ) (!  (=> (and (= (type Heap@@5) (MapType0Type RefType)) (= (type diz@@25) RefType)) (|Thread__postJoin#everUsed| (Thread__postJoin diz@@25 p_1@@19)))
 :qid |stdinbpl.893:15|
 :skolemid |106|
 :pattern ( (|Thread__postJoin#trigger| Heap@@5 (Thread__postJoin diz@@25 p_1@@19)))
)))
(assert (forall ((Heap@@6 T@U) (diz@@26 T@U) (p_1@@20 Real) ) (!  (=> (and (= (type Heap@@6) (MapType0Type RefType)) (= (type diz@@26) RefType)) (|Thread__joinToken_at_Thread#everUsed| (Thread__joinToken_at_Thread diz@@26 p_1@@20)))
 :qid |stdinbpl.928:15|
 :skolemid |112|
 :pattern ( (|Thread__joinToken_at_Thread#trigger| Heap@@6 (Thread__joinToken_at_Thread diz@@26 p_1@@20)))
)))
(assert (forall ((Heap@@7 T@U) (diz@@27 T@U) (p_1@@21 Real) ) (!  (=> (and (= (type Heap@@7) (MapType0Type RefType)) (= (type diz@@27) RefType)) (|Thread__preFork_at_Thread#everUsed| (Thread__preFork_at_Thread diz@@27 p_1@@21)))
 :qid |stdinbpl.963:15|
 :skolemid |118|
 :pattern ( (|Thread__preFork_at_Thread#trigger| Heap@@7 (Thread__preFork_at_Thread diz@@27 p_1@@21)))
)))
(assert (forall ((Heap@@8 T@U) (diz@@28 T@U) (p_1@@22 Real) ) (!  (=> (and (= (type Heap@@8) (MapType0Type RefType)) (= (type diz@@28) RefType)) (|Thread__postJoin_at_Thread#everUsed| (Thread__postJoin_at_Thread diz@@28 p_1@@22)))
 :qid |stdinbpl.1012:15|
 :skolemid |124|
 :pattern ( (|Thread__postJoin_at_Thread#trigger| Heap@@8 (Thread__postJoin_at_Thread diz@@28 p_1@@22)))
)))
(assert (forall ((Heap@@9 T@U) (diz@@29 T@U) (p_1@@23 Real) ) (!  (=> (and (= (type Heap@@9) (MapType0Type RefType)) (= (type diz@@29) RefType)) (|Worker__joinToken#everUsed| (Worker__joinToken diz@@29 p_1@@23)))
 :qid |stdinbpl.1201:15|
 :skolemid |154|
 :pattern ( (|Worker__joinToken#trigger| Heap@@9 (Worker__joinToken diz@@29 p_1@@23)))
)))
(assert (forall ((Heap@@10 T@U) (diz@@30 T@U) (p_1@@24 Real) ) (!  (=> (and (= (type Heap@@10) (MapType0Type RefType)) (= (type diz@@30) RefType)) (|Worker__joinToken_at_Worker#everUsed| (Worker__joinToken_at_Worker diz@@30 p_1@@24)))
 :qid |stdinbpl.1236:15|
 :skolemid |160|
 :pattern ( (|Worker__joinToken_at_Worker#trigger| Heap@@10 (Worker__joinToken_at_Worker diz@@30 p_1@@24)))
)))
(assert (forall ((Heap@@11 T@U) (diz@@31 T@U) (p_1@@25 Real) ) (!  (=> (and (= (type Heap@@11) (MapType0Type RefType)) (= (type diz@@31) RefType)) (|Worker__preFork#everUsed| (Worker__preFork diz@@31 p_1@@25)))
 :qid |stdinbpl.1289:15|
 :skolemid |166|
 :pattern ( (|Worker__preFork#trigger| Heap@@11 (Worker__preFork diz@@31 p_1@@25)))
)))
(assert (forall ((Heap@@12 T@U) (diz@@32 T@U) (p_1@@26 Real) ) (!  (=> (and (= (type Heap@@12) (MapType0Type RefType)) (= (type diz@@32) RefType)) (|Worker__postJoin#everUsed| (Worker__postJoin diz@@32 p_1@@26)))
 :qid |stdinbpl.1324:15|
 :skolemid |172|
 :pattern ( (|Worker__postJoin#trigger| Heap@@12 (Worker__postJoin diz@@32 p_1@@26)))
)))
(assert (forall ((Heap@@13 T@U) (diz@@33 T@U) (p_1@@27 Real) ) (!  (=> (and (= (type Heap@@13) (MapType0Type RefType)) (= (type diz@@33) RefType)) (|Worker__joinToken_at_Thread#everUsed| (Worker__joinToken_at_Thread diz@@33 p_1@@27)))
 :qid |stdinbpl.1359:15|
 :skolemid |178|
 :pattern ( (|Worker__joinToken_at_Thread#trigger| Heap@@13 (Worker__joinToken_at_Thread diz@@33 p_1@@27)))
)))
(assert (forall ((Heap@@14 T@U) (diz@@34 T@U) (p_1@@28 Real) ) (!  (=> (and (= (type Heap@@14) (MapType0Type RefType)) (= (type diz@@34) RefType)) (|Worker__preFork_at_Thread#everUsed| (Worker__preFork_at_Thread diz@@34 p_1@@28)))
 :qid |stdinbpl.1394:15|
 :skolemid |184|
 :pattern ( (|Worker__preFork_at_Thread#trigger| Heap@@14 (Worker__preFork_at_Thread diz@@34 p_1@@28)))
)))
(assert (forall ((Heap@@15 T@U) (diz@@35 T@U) (p_1@@29 Real) ) (!  (=> (and (= (type Heap@@15) (MapType0Type RefType)) (= (type diz@@35) RefType)) (|Worker__postJoin_at_Thread#everUsed| (Worker__postJoin_at_Thread diz@@35 p_1@@29)))
 :qid |stdinbpl.1443:15|
 :skolemid |190|
 :pattern ( (|Worker__postJoin_at_Thread#trigger| Heap@@15 (Worker__postJoin_at_Thread diz@@35 p_1@@29)))
)))
(assert (forall ((Heap@@16 T@U) (diz@@36 T@U) (p_1@@30 Real) ) (!  (=> (and (= (type Heap@@16) (MapType0Type RefType)) (= (type diz@@36) RefType)) (|Worker__preFork_at_Worker#everUsed| (Worker__preFork_at_Worker diz@@36 p_1@@30)))
 :qid |stdinbpl.1492:15|
 :skolemid |196|
 :pattern ( (|Worker__preFork_at_Worker#trigger| Heap@@16 (Worker__preFork_at_Worker diz@@36 p_1@@30)))
)))
(assert (forall ((Heap@@17 T@U) (diz@@37 T@U) (p_1@@31 Real) ) (!  (=> (and (= (type Heap@@17) (MapType0Type RefType)) (= (type diz@@37) RefType)) (|Worker__postJoin_at_Worker#everUsed| (Worker__postJoin_at_Worker diz@@37 p_1@@31)))
 :qid |stdinbpl.1591:15|
 :skolemid |202|
 :pattern ( (|Worker__postJoin_at_Worker#trigger| Heap@@17 (Worker__postJoin_at_Worker diz@@37 p_1@@31)))
)))
(assert  (and (= (type null) RefType) (forall ((arg0@@43 T@U) ) (! (let ((A (FieldTypeInv0 (type arg0@@43))))
(= (type (PredicateMaskField arg0@@43)) (FieldType A (MapType1Type RefType boolType))))
 :qid |funType:PredicateMaskField|
 :pattern ( (PredicateMaskField arg0@@43))
))))
(assert (forall ((Heap@@18 T@U) (ExhaleHeap T@U) (Mask@@0 T@U) (pm_f T@U) ) (! (let ((C (FieldTypeInv0 (type pm_f))))
 (=> (and (and (and (and (and (= (type Heap@@18) (MapType0Type RefType)) (= (type ExhaleHeap) (MapType0Type RefType))) (= (type Mask@@0) (MapType1Type RefType realType))) (= (type pm_f) (FieldType C FrameTypeType))) (IdenticalOnKnownLocations Heap@@18 ExhaleHeap Mask@@0)) (and (HasDirectPerm Mask@@0 null pm_f) (IsPredicateField pm_f))) (= (MapType0Select Heap@@18 null (PredicateMaskField pm_f)) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))))
 :qid |stdinbpl.47:19|
 :skolemid |2|
 :pattern ( (IdenticalOnKnownLocations Heap@@18 ExhaleHeap Mask@@0) (IsPredicateField pm_f) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))
)))
(assert (forall ((arg0@@44 T@U) ) (! (let ((A@@0 (FieldTypeInv0 (type arg0@@44))))
(= (type (WandMaskField arg0@@44)) (FieldType A@@0 (MapType1Type RefType boolType))))
 :qid |funType:WandMaskField|
 :pattern ( (WandMaskField arg0@@44))
)))
(assert (forall ((Heap@@19 T@U) (ExhaleHeap@@0 T@U) (Mask@@1 T@U) (pm_f@@0 T@U) ) (! (let ((C@@0 (FieldTypeInv0 (type pm_f@@0))))
 (=> (and (and (and (and (and (= (type Heap@@19) (MapType0Type RefType)) (= (type ExhaleHeap@@0) (MapType0Type RefType))) (= (type Mask@@1) (MapType1Type RefType realType))) (= (type pm_f@@0) (FieldType C@@0 FrameTypeType))) (IdenticalOnKnownLocations Heap@@19 ExhaleHeap@@0 Mask@@1)) (and (HasDirectPerm Mask@@1 null pm_f@@0) (IsWandField pm_f@@0))) (= (MapType0Select Heap@@19 null (WandMaskField pm_f@@0)) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))))
 :qid |stdinbpl.60:19|
 :skolemid |5|
 :pattern ( (IdenticalOnKnownLocations Heap@@19 ExhaleHeap@@0 Mask@@1) (IsWandField pm_f@@0) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))
)))
(assert  (and (= (Ctor PredicateType_History__invType) 31) (forall ((arg0@@45 T@U) ) (! (= (type (History__inv arg0@@45)) (FieldType PredicateType_History__invType FrameTypeType))
 :qid |funType:History__inv|
 :pattern ( (History__inv arg0@@45))
))))
(assert (forall ((diz@@38 T@U) ) (!  (=> (= (type diz@@38) RefType) (IsPredicateField (History__inv diz@@38)))
 :qid |stdinbpl.468:15|
 :skolemid |42|
 :pattern ( (History__inv diz@@38))
)))
(assert  (and (= (Ctor PredicateType_SubjectLock__invType) 32) (forall ((arg0@@46 T@U) ) (! (= (type (SubjectLock__inv arg0@@46)) (FieldType PredicateType_SubjectLock__invType FrameTypeType))
 :qid |funType:SubjectLock__inv|
 :pattern ( (SubjectLock__inv arg0@@46))
))))
(assert (forall ((diz@@39 T@U) ) (!  (=> (= (type diz@@39) RefType) (IsPredicateField (SubjectLock__inv diz@@39)))
 :qid |stdinbpl.601:15|
 :skolemid |60|
 :pattern ( (SubjectLock__inv diz@@39))
)))
(assert  (and (= (Ctor PredicateType_SubjectLock__validType) 33) (forall ((arg0@@47 T@U) ) (! (= (type (SubjectLock__valid arg0@@47)) (FieldType PredicateType_SubjectLock__validType FrameTypeType))
 :qid |funType:SubjectLock__valid|
 :pattern ( (SubjectLock__valid arg0@@47))
))))
(assert (forall ((diz@@40 T@U) ) (!  (=> (= (type diz@@40) RefType) (IsPredicateField (SubjectLock__valid diz@@40)))
 :qid |stdinbpl.664:15|
 :skolemid |66|
 :pattern ( (SubjectLock__valid diz@@40))
)))
(assert  (and (= (Ctor PredicateType_Thread__is_a_ThreadType) 34) (forall ((arg0@@48 T@U) ) (! (= (type (Thread__is_a_Thread arg0@@48)) (FieldType PredicateType_Thread__is_a_ThreadType FrameTypeType))
 :qid |funType:Thread__is_a_Thread|
 :pattern ( (Thread__is_a_Thread arg0@@48))
))))
(assert (forall ((diz@@41 T@U) ) (!  (=> (= (type diz@@41) RefType) (IsPredicateField (Thread__is_a_Thread diz@@41)))
 :qid |stdinbpl.734:15|
 :skolemid |78|
 :pattern ( (Thread__is_a_Thread diz@@41))
)))
(assert  (and (= (Ctor PredicateType_Thread__instance_of_ThreadType) 35) (forall ((arg0@@49 T@U) ) (! (= (type (Thread__instance_of_Thread arg0@@49)) (FieldType PredicateType_Thread__instance_of_ThreadType FrameTypeType))
 :qid |funType:Thread__instance_of_Thread|
 :pattern ( (Thread__instance_of_Thread arg0@@49))
))))
(assert (forall ((diz@@42 T@U) ) (!  (=> (= (type diz@@42) RefType) (IsPredicateField (Thread__instance_of_Thread diz@@42)))
 :qid |stdinbpl.769:15|
 :skolemid |84|
 :pattern ( (Thread__instance_of_Thread diz@@42))
)))
(assert  (and (= (Ctor PredicateType_Worker__is_a_WorkerType) 36) (forall ((arg0@@50 T@U) ) (! (= (type (Worker__is_a_Worker arg0@@50)) (FieldType PredicateType_Worker__is_a_WorkerType FrameTypeType))
 :qid |funType:Worker__is_a_Worker|
 :pattern ( (Worker__is_a_Worker arg0@@50))
))))
(assert (forall ((diz@@43 T@U) ) (!  (=> (= (type diz@@43) RefType) (IsPredicateField (Worker__is_a_Worker diz@@43)))
 :qid |stdinbpl.1042:15|
 :skolemid |126|
 :pattern ( (Worker__is_a_Worker diz@@43))
)))
(assert  (and (= (Ctor PredicateType_Worker__instance_of_WorkerType) 37) (forall ((arg0@@51 T@U) ) (! (= (type (Worker__instance_of_Worker arg0@@51)) (FieldType PredicateType_Worker__instance_of_WorkerType FrameTypeType))
 :qid |funType:Worker__instance_of_Worker|
 :pattern ( (Worker__instance_of_Worker arg0@@51))
))))
(assert (forall ((diz@@44 T@U) ) (!  (=> (= (type diz@@44) RefType) (IsPredicateField (Worker__instance_of_Worker diz@@44)))
 :qid |stdinbpl.1077:15|
 :skolemid |132|
 :pattern ( (Worker__instance_of_Worker diz@@44))
)))
(assert  (and (= (Ctor PredicateType_Worker__is_a_ThreadType) 38) (forall ((arg0@@52 T@U) ) (! (= (type (Worker__is_a_Thread arg0@@52)) (FieldType PredicateType_Worker__is_a_ThreadType FrameTypeType))
 :qid |funType:Worker__is_a_Thread|
 :pattern ( (Worker__is_a_Thread arg0@@52))
))))
(assert (forall ((diz@@45 T@U) ) (!  (=> (= (type diz@@45) RefType) (IsPredicateField (Worker__is_a_Thread diz@@45)))
 :qid |stdinbpl.1112:15|
 :skolemid |138|
 :pattern ( (Worker__is_a_Thread diz@@45))
)))
(assert  (and (= (Ctor PredicateType_Worker__instance_of_ThreadType) 39) (forall ((arg0@@53 T@U) ) (! (= (type (Worker__instance_of_Thread arg0@@53)) (FieldType PredicateType_Worker__instance_of_ThreadType FrameTypeType))
 :qid |funType:Worker__instance_of_Thread|
 :pattern ( (Worker__instance_of_Thread arg0@@53))
))))
(assert (forall ((diz@@46 T@U) ) (!  (=> (= (type diz@@46) RefType) (IsPredicateField (Worker__instance_of_Thread diz@@46)))
 :qid |stdinbpl.1147:15|
 :skolemid |144|
 :pattern ( (Worker__instance_of_Thread diz@@46))
)))
(assert (forall ((Heap@@20 T@U) (diz@@47 T@U) ) (!  (=> (and (= (type Heap@@20) (MapType0Type RefType)) (= (type diz@@47) RefType)) (dummyFunction (int_2_U (|History__free_get_x#triggerStateless| diz@@47))))
 :qid |stdinbpl.332:15|
 :skolemid |34|
 :pattern ( (|History__free_get_x'| Heap@@20 diz@@47))
)))
(assert (forall ((Heap@@21 T@U) (diz@@48 T@U) ) (!  (=> (and (= (type Heap@@21) (MapType0Type RefType)) (= (type diz@@48) RefType)) (dummyFunction (int_2_U (|History__hist_get_x#triggerStateless| diz@@48))))
 :qid |stdinbpl.400:15|
 :skolemid |38|
 :pattern ( (|History__hist_get_x'| Heap@@21 diz@@48))
)))
(assert (forall ((Heap@@22 T@U) (diz@@49 T@U) ) (!  (=> (and (= (type Heap@@22) (MapType0Type RefType)) (= (type diz@@49) RefType)) (|History__inv#everUsed| (History__inv diz@@49)))
 :qid |stdinbpl.487:15|
 :skolemid |46|
 :pattern ( (|History__inv#trigger| Heap@@22 (History__inv diz@@49)))
)))
(assert (forall ((Heap@@23 T@U) (diz@@50 T@U) ) (!  (=> (and (= (type Heap@@23) (MapType0Type RefType)) (= (type diz@@50) RefType)) (|SubjectLock__inv#everUsed| (SubjectLock__inv diz@@50)))
 :qid |stdinbpl.620:15|
 :skolemid |64|
 :pattern ( (|SubjectLock__inv#trigger| Heap@@23 (SubjectLock__inv diz@@50)))
)))
(assert (forall ((Heap@@24 T@U) (diz@@51 T@U) ) (!  (=> (and (= (type Heap@@24) (MapType0Type RefType)) (= (type diz@@51) RefType)) (|SubjectLock__valid#everUsed| (SubjectLock__valid diz@@51)))
 :qid |stdinbpl.683:15|
 :skolemid |70|
 :pattern ( (|SubjectLock__valid#trigger| Heap@@24 (SubjectLock__valid diz@@51)))
)))
(assert (forall ((Heap@@25 T@U) (diz@@52 T@U) ) (!  (=> (and (= (type Heap@@25) (MapType0Type RefType)) (= (type diz@@52) RefType)) (|Thread__is_a_Thread#everUsed| (Thread__is_a_Thread diz@@52)))
 :qid |stdinbpl.753:15|
 :skolemid |82|
 :pattern ( (|Thread__is_a_Thread#trigger| Heap@@25 (Thread__is_a_Thread diz@@52)))
)))
(assert (forall ((Heap@@26 T@U) (diz@@53 T@U) ) (!  (=> (and (= (type Heap@@26) (MapType0Type RefType)) (= (type diz@@53) RefType)) (|Thread__instance_of_Thread#everUsed| (Thread__instance_of_Thread diz@@53)))
 :qid |stdinbpl.788:15|
 :skolemid |88|
 :pattern ( (|Thread__instance_of_Thread#trigger| Heap@@26 (Thread__instance_of_Thread diz@@53)))
)))
(assert (forall ((Heap@@27 T@U) (diz@@54 T@U) ) (!  (=> (and (= (type Heap@@27) (MapType0Type RefType)) (= (type diz@@54) RefType)) (|Worker__is_a_Worker#everUsed| (Worker__is_a_Worker diz@@54)))
 :qid |stdinbpl.1061:15|
 :skolemid |130|
 :pattern ( (|Worker__is_a_Worker#trigger| Heap@@27 (Worker__is_a_Worker diz@@54)))
)))
(assert (forall ((Heap@@28 T@U) (diz@@55 T@U) ) (!  (=> (and (= (type Heap@@28) (MapType0Type RefType)) (= (type diz@@55) RefType)) (|Worker__instance_of_Worker#everUsed| (Worker__instance_of_Worker diz@@55)))
 :qid |stdinbpl.1096:15|
 :skolemid |136|
 :pattern ( (|Worker__instance_of_Worker#trigger| Heap@@28 (Worker__instance_of_Worker diz@@55)))
)))
(assert (forall ((Heap@@29 T@U) (diz@@56 T@U) ) (!  (=> (and (= (type Heap@@29) (MapType0Type RefType)) (= (type diz@@56) RefType)) (|Worker__is_a_Thread#everUsed| (Worker__is_a_Thread diz@@56)))
 :qid |stdinbpl.1131:15|
 :skolemid |142|
 :pattern ( (|Worker__is_a_Thread#trigger| Heap@@29 (Worker__is_a_Thread diz@@56)))
)))
(assert (forall ((Heap@@30 T@U) (diz@@57 T@U) ) (!  (=> (and (= (type Heap@@30) (MapType0Type RefType)) (= (type diz@@57) RefType)) (|Worker__instance_of_Thread#everUsed| (Worker__instance_of_Thread diz@@57)))
 :qid |stdinbpl.1166:15|
 :skolemid |148|
 :pattern ( (|Worker__instance_of_Thread#trigger| Heap@@30 (Worker__instance_of_Thread diz@@57)))
)))
(assert (forall ((arg0@@54 T@U) (arg1@@28 Real) (arg2@@6 T@U) ) (! (= (type (|History__hist_do_incr#sm| arg0@@54 arg1@@28 arg2@@6)) (FieldType PredicateType_History__hist_do_incrType (MapType1Type RefType boolType)))
 :qid |funType:History__hist_do_incr#sm|
 :pattern ( (|History__hist_do_incr#sm| arg0@@54 arg1@@28 arg2@@6))
)))
(assert (forall ((diz@@58 T@U) (frac@@5 Real) (proc@@5 T@U) ) (!  (=> (and (= (type diz@@58) RefType) (= (type proc@@5) ProcessDomainTypeType)) (= (PredicateMaskField (History__hist_do_incr diz@@58 frac@@5 proc@@5)) (|History__hist_do_incr#sm| diz@@58 frac@@5 proc@@5)))
 :qid |stdinbpl.527:15|
 :skolemid |47|
 :pattern ( (PredicateMaskField (History__hist_do_incr diz@@58 frac@@5 proc@@5)))
)))
(assert (forall ((arg0@@55 T@U) (arg1@@29 Real) (arg2@@7 T@U) ) (! (= (type (|History__hist_idle#sm| arg0@@55 arg1@@29 arg2@@7)) (FieldType PredicateType_History__hist_idleType (MapType1Type RefType boolType)))
 :qid |funType:History__hist_idle#sm|
 :pattern ( (|History__hist_idle#sm| arg0@@55 arg1@@29 arg2@@7))
)))
(assert (forall ((diz@@59 T@U) (frac@@6 Real) (proc@@6 T@U) ) (!  (=> (and (= (type diz@@59) RefType) (= (type proc@@6) ProcessDomainTypeType)) (= (PredicateMaskField (History__hist_idle diz@@59 frac@@6 proc@@6)) (|History__hist_idle#sm| diz@@59 frac@@6 proc@@6)))
 :qid |stdinbpl.562:15|
 :skolemid |53|
 :pattern ( (PredicateMaskField (History__hist_idle diz@@59 frac@@6 proc@@6)))
)))
(assert (forall ((arg0@@56 T@U) (arg1@@30 Real) (arg2@@8 Int) ) (! (= (type (|SubjectLock__locked#sm| arg0@@56 arg1@@30 arg2@@8)) (FieldType PredicateType_SubjectLock__lockedType (MapType1Type RefType boolType)))
 :qid |funType:SubjectLock__locked#sm|
 :pattern ( (|SubjectLock__locked#sm| arg0@@56 arg1@@30 arg2@@8))
)))
(assert (forall ((diz@@60 T@U) (p_1@@32 Real) (count@@2 Int) ) (!  (=> (= (type diz@@60) RefType) (= (PredicateMaskField (SubjectLock__locked diz@@60 p_1@@32 count@@2)) (|SubjectLock__locked#sm| diz@@60 p_1@@32 count@@2)))
 :qid |stdinbpl.695:15|
 :skolemid |71|
 :pattern ( (PredicateMaskField (SubjectLock__locked diz@@60 p_1@@32 count@@2)))
)))
(assert (forall ((Heap@@31 T@U) (ExhaleHeap@@1 T@U) (Mask@@2 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@31) (MapType0Type RefType)) (= (type ExhaleHeap@@1) (MapType0Type RefType))) (= (type Mask@@2) (MapType1Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@31 ExhaleHeap@@1 Mask@@2)) (U_2_bool (MapType0Select Heap@@31 o_1 $allocated))) (U_2_bool (MapType0Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.73:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@31 ExhaleHeap@@1 Mask@@2) (MapType0Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert (forall ((Heap@@32 T@U) (diz@@61 T@U) ) (!  (=> (and (= (type Heap@@32) (MapType0Type RefType)) (= (type diz@@61) RefType)) (and (= (History__free_get_x Heap@@32 diz@@61) (|History__free_get_x'| Heap@@32 diz@@61)) (dummyFunction (int_2_U (|History__free_get_x#triggerStateless| diz@@61)))))
 :qid |stdinbpl.328:15|
 :skolemid |33|
 :pattern ( (History__free_get_x Heap@@32 diz@@61))
)))
(assert (forall ((Heap@@33 T@U) (diz@@62 T@U) ) (!  (=> (and (= (type Heap@@33) (MapType0Type RefType)) (= (type diz@@62) RefType)) (and (= (History__hist_get_x Heap@@33 diz@@62) (|History__hist_get_x'| Heap@@33 diz@@62)) (dummyFunction (int_2_U (|History__hist_get_x#triggerStateless| diz@@62)))))
 :qid |stdinbpl.396:15|
 :skolemid |37|
 :pattern ( (History__hist_get_x Heap@@33 diz@@62))
)))
(assert (forall ((diz@@63 T@U) (frac@@7 Real) (proc@@7 T@U) (diz2 T@U) (frac2 Real) (proc2 T@U) ) (!  (=> (and (and (and (and (= (type diz@@63) RefType) (= (type proc@@7) ProcessDomainTypeType)) (= (type diz2) RefType)) (= (type proc2) ProcessDomainTypeType)) (= (History__hist_do_incr diz@@63 frac@@7 proc@@7) (History__hist_do_incr diz2 frac2 proc2))) (and (= diz@@63 diz2) (and (= frac@@7 frac2) (= proc@@7 proc2))))
 :qid |stdinbpl.541:15|
 :skolemid |50|
 :pattern ( (History__hist_do_incr diz@@63 frac@@7 proc@@7) (History__hist_do_incr diz2 frac2 proc2))
)))
(assert (forall ((diz@@64 T@U) (frac@@8 Real) (proc@@8 T@U) (diz2@@0 T@U) (frac2@@0 Real) (proc2@@0 T@U) ) (!  (=> (and (and (and (and (= (type diz@@64) RefType) (= (type proc@@8) ProcessDomainTypeType)) (= (type diz2@@0) RefType)) (= (type proc2@@0) ProcessDomainTypeType)) (= (|History__hist_do_incr#sm| diz@@64 frac@@8 proc@@8) (|History__hist_do_incr#sm| diz2@@0 frac2@@0 proc2@@0))) (and (= diz@@64 diz2@@0) (and (= frac@@8 frac2@@0) (= proc@@8 proc2@@0))))
 :qid |stdinbpl.545:15|
 :skolemid |51|
 :pattern ( (|History__hist_do_incr#sm| diz@@64 frac@@8 proc@@8) (|History__hist_do_incr#sm| diz2@@0 frac2@@0 proc2@@0))
)))
(assert (forall ((diz@@65 T@U) (frac@@9 Real) (proc@@9 T@U) (diz2@@1 T@U) (frac2@@1 Real) (proc2@@1 T@U) ) (!  (=> (and (and (and (and (= (type diz@@65) RefType) (= (type proc@@9) ProcessDomainTypeType)) (= (type diz2@@1) RefType)) (= (type proc2@@1) ProcessDomainTypeType)) (= (History__hist_idle diz@@65 frac@@9 proc@@9) (History__hist_idle diz2@@1 frac2@@1 proc2@@1))) (and (= diz@@65 diz2@@1) (and (= frac@@9 frac2@@1) (= proc@@9 proc2@@1))))
 :qid |stdinbpl.576:15|
 :skolemid |56|
 :pattern ( (History__hist_idle diz@@65 frac@@9 proc@@9) (History__hist_idle diz2@@1 frac2@@1 proc2@@1))
)))
(assert (forall ((diz@@66 T@U) (frac@@10 Real) (proc@@10 T@U) (diz2@@2 T@U) (frac2@@2 Real) (proc2@@2 T@U) ) (!  (=> (and (and (and (and (= (type diz@@66) RefType) (= (type proc@@10) ProcessDomainTypeType)) (= (type diz2@@2) RefType)) (= (type proc2@@2) ProcessDomainTypeType)) (= (|History__hist_idle#sm| diz@@66 frac@@10 proc@@10) (|History__hist_idle#sm| diz2@@2 frac2@@2 proc2@@2))) (and (= diz@@66 diz2@@2) (and (= frac@@10 frac2@@2) (= proc@@10 proc2@@2))))
 :qid |stdinbpl.580:15|
 :skolemid |57|
 :pattern ( (|History__hist_idle#sm| diz@@66 frac@@10 proc@@10) (|History__hist_idle#sm| diz2@@2 frac2@@2 proc2@@2))
)))
(assert (forall ((diz@@67 T@U) (p_1@@33 Real) (count@@3 Int) (diz2@@3 T@U) (p2_1 Real) (count2 Int) ) (!  (=> (and (and (= (type diz@@67) RefType) (= (type diz2@@3) RefType)) (= (SubjectLock__locked diz@@67 p_1@@33 count@@3) (SubjectLock__locked diz2@@3 p2_1 count2))) (and (= diz@@67 diz2@@3) (and (= p_1@@33 p2_1) (= count@@3 count2))))
 :qid |stdinbpl.709:15|
 :skolemid |74|
 :pattern ( (SubjectLock__locked diz@@67 p_1@@33 count@@3) (SubjectLock__locked diz2@@3 p2_1 count2))
)))
(assert (forall ((diz@@68 T@U) (p_1@@34 Real) (count@@4 Int) (diz2@@4 T@U) (p2_1@@0 Real) (count2@@0 Int) ) (!  (=> (and (and (= (type diz@@68) RefType) (= (type diz2@@4) RefType)) (= (|SubjectLock__locked#sm| diz@@68 p_1@@34 count@@4) (|SubjectLock__locked#sm| diz2@@4 p2_1@@0 count2@@0))) (and (= diz@@68 diz2@@4) (and (= p_1@@34 p2_1@@0) (= count@@4 count2@@0))))
 :qid |stdinbpl.713:15|
 :skolemid |75|
 :pattern ( (|SubjectLock__locked#sm| diz@@68 p_1@@34 count@@4) (|SubjectLock__locked#sm| diz2@@4 p2_1@@0 count2@@0))
)))
(assert (forall ((diz@@69 T@U) (p_1@@35 Real) (diz2@@5 T@U) (p2_1@@1 Real) ) (!  (=> (and (and (= (type diz@@69) RefType) (= (type diz2@@5) RefType)) (= (Thread__joinToken diz@@69 p_1@@35) (Thread__joinToken diz2@@5 p2_1@@1))) (and (= diz@@69 diz2@@5) (= p_1@@35 p2_1@@1)))
 :qid |stdinbpl.814:15|
 :skolemid |92|
 :pattern ( (Thread__joinToken diz@@69 p_1@@35) (Thread__joinToken diz2@@5 p2_1@@1))
)))
(assert (forall ((arg0@@57 T@U) (arg1@@31 Real) ) (! (= (type (|Thread__joinToken#sm| arg0@@57 arg1@@31)) (FieldType PredicateType_Thread__joinTokenType (MapType1Type RefType boolType)))
 :qid |funType:Thread__joinToken#sm|
 :pattern ( (|Thread__joinToken#sm| arg0@@57 arg1@@31))
)))
(assert (forall ((diz@@70 T@U) (p_1@@36 Real) (diz2@@6 T@U) (p2_1@@2 Real) ) (!  (=> (and (and (= (type diz@@70) RefType) (= (type diz2@@6) RefType)) (= (|Thread__joinToken#sm| diz@@70 p_1@@36) (|Thread__joinToken#sm| diz2@@6 p2_1@@2))) (and (= diz@@70 diz2@@6) (= p_1@@36 p2_1@@2)))
 :qid |stdinbpl.818:15|
 :skolemid |93|
 :pattern ( (|Thread__joinToken#sm| diz@@70 p_1@@36) (|Thread__joinToken#sm| diz2@@6 p2_1@@2))
)))
(assert (forall ((diz@@71 T@U) (p_1@@37 Real) (diz2@@7 T@U) (p2_1@@3 Real) ) (!  (=> (and (and (= (type diz@@71) RefType) (= (type diz2@@7) RefType)) (= (Thread__preFork diz@@71 p_1@@37) (Thread__preFork diz2@@7 p2_1@@3))) (and (= diz@@71 diz2@@7) (= p_1@@37 p2_1@@3)))
 :qid |stdinbpl.849:15|
 :skolemid |98|
 :pattern ( (Thread__preFork diz@@71 p_1@@37) (Thread__preFork diz2@@7 p2_1@@3))
)))
(assert (forall ((arg0@@58 T@U) (arg1@@32 Real) ) (! (= (type (|Thread__preFork#sm| arg0@@58 arg1@@32)) (FieldType PredicateType_Thread__preForkType (MapType1Type RefType boolType)))
 :qid |funType:Thread__preFork#sm|
 :pattern ( (|Thread__preFork#sm| arg0@@58 arg1@@32))
)))
(assert (forall ((diz@@72 T@U) (p_1@@38 Real) (diz2@@8 T@U) (p2_1@@4 Real) ) (!  (=> (and (and (= (type diz@@72) RefType) (= (type diz2@@8) RefType)) (= (|Thread__preFork#sm| diz@@72 p_1@@38) (|Thread__preFork#sm| diz2@@8 p2_1@@4))) (and (= diz@@72 diz2@@8) (= p_1@@38 p2_1@@4)))
 :qid |stdinbpl.853:15|
 :skolemid |99|
 :pattern ( (|Thread__preFork#sm| diz@@72 p_1@@38) (|Thread__preFork#sm| diz2@@8 p2_1@@4))
)))
(assert (forall ((diz@@73 T@U) (p_1@@39 Real) (diz2@@9 T@U) (p2_1@@5 Real) ) (!  (=> (and (and (= (type diz@@73) RefType) (= (type diz2@@9) RefType)) (= (Thread__postJoin diz@@73 p_1@@39) (Thread__postJoin diz2@@9 p2_1@@5))) (and (= diz@@73 diz2@@9) (= p_1@@39 p2_1@@5)))
 :qid |stdinbpl.884:15|
 :skolemid |104|
 :pattern ( (Thread__postJoin diz@@73 p_1@@39) (Thread__postJoin diz2@@9 p2_1@@5))
)))
(assert (forall ((arg0@@59 T@U) (arg1@@33 Real) ) (! (= (type (|Thread__postJoin#sm| arg0@@59 arg1@@33)) (FieldType PredicateType_Thread__postJoinType (MapType1Type RefType boolType)))
 :qid |funType:Thread__postJoin#sm|
 :pattern ( (|Thread__postJoin#sm| arg0@@59 arg1@@33))
)))
(assert (forall ((diz@@74 T@U) (p_1@@40 Real) (diz2@@10 T@U) (p2_1@@6 Real) ) (!  (=> (and (and (= (type diz@@74) RefType) (= (type diz2@@10) RefType)) (= (|Thread__postJoin#sm| diz@@74 p_1@@40) (|Thread__postJoin#sm| diz2@@10 p2_1@@6))) (and (= diz@@74 diz2@@10) (= p_1@@40 p2_1@@6)))
 :qid |stdinbpl.888:15|
 :skolemid |105|
 :pattern ( (|Thread__postJoin#sm| diz@@74 p_1@@40) (|Thread__postJoin#sm| diz2@@10 p2_1@@6))
)))
(assert (forall ((diz@@75 T@U) (p_1@@41 Real) (diz2@@11 T@U) (p2_1@@7 Real) ) (!  (=> (and (and (= (type diz@@75) RefType) (= (type diz2@@11) RefType)) (= (Thread__joinToken_at_Thread diz@@75 p_1@@41) (Thread__joinToken_at_Thread diz2@@11 p2_1@@7))) (and (= diz@@75 diz2@@11) (= p_1@@41 p2_1@@7)))
 :qid |stdinbpl.919:15|
 :skolemid |110|
 :pattern ( (Thread__joinToken_at_Thread diz@@75 p_1@@41) (Thread__joinToken_at_Thread diz2@@11 p2_1@@7))
)))
(assert (forall ((arg0@@60 T@U) (arg1@@34 Real) ) (! (= (type (|Thread__joinToken_at_Thread#sm| arg0@@60 arg1@@34)) (FieldType PredicateType_Thread__joinToken_at_ThreadType (MapType1Type RefType boolType)))
 :qid |funType:Thread__joinToken_at_Thread#sm|
 :pattern ( (|Thread__joinToken_at_Thread#sm| arg0@@60 arg1@@34))
)))
(assert (forall ((diz@@76 T@U) (p_1@@42 Real) (diz2@@12 T@U) (p2_1@@8 Real) ) (!  (=> (and (and (= (type diz@@76) RefType) (= (type diz2@@12) RefType)) (= (|Thread__joinToken_at_Thread#sm| diz@@76 p_1@@42) (|Thread__joinToken_at_Thread#sm| diz2@@12 p2_1@@8))) (and (= diz@@76 diz2@@12) (= p_1@@42 p2_1@@8)))
 :qid |stdinbpl.923:15|
 :skolemid |111|
 :pattern ( (|Thread__joinToken_at_Thread#sm| diz@@76 p_1@@42) (|Thread__joinToken_at_Thread#sm| diz2@@12 p2_1@@8))
)))
(assert (forall ((diz@@77 T@U) (p_1@@43 Real) (diz2@@13 T@U) (p2_1@@9 Real) ) (!  (=> (and (and (= (type diz@@77) RefType) (= (type diz2@@13) RefType)) (= (Thread__preFork_at_Thread diz@@77 p_1@@43) (Thread__preFork_at_Thread diz2@@13 p2_1@@9))) (and (= diz@@77 diz2@@13) (= p_1@@43 p2_1@@9)))
 :qid |stdinbpl.954:15|
 :skolemid |116|
 :pattern ( (Thread__preFork_at_Thread diz@@77 p_1@@43) (Thread__preFork_at_Thread diz2@@13 p2_1@@9))
)))
(assert (forall ((arg0@@61 T@U) (arg1@@35 Real) ) (! (= (type (|Thread__preFork_at_Thread#sm| arg0@@61 arg1@@35)) (FieldType PredicateType_Thread__preFork_at_ThreadType (MapType1Type RefType boolType)))
 :qid |funType:Thread__preFork_at_Thread#sm|
 :pattern ( (|Thread__preFork_at_Thread#sm| arg0@@61 arg1@@35))
)))
(assert (forall ((diz@@78 T@U) (p_1@@44 Real) (diz2@@14 T@U) (p2_1@@10 Real) ) (!  (=> (and (and (= (type diz@@78) RefType) (= (type diz2@@14) RefType)) (= (|Thread__preFork_at_Thread#sm| diz@@78 p_1@@44) (|Thread__preFork_at_Thread#sm| diz2@@14 p2_1@@10))) (and (= diz@@78 diz2@@14) (= p_1@@44 p2_1@@10)))
 :qid |stdinbpl.958:15|
 :skolemid |117|
 :pattern ( (|Thread__preFork_at_Thread#sm| diz@@78 p_1@@44) (|Thread__preFork_at_Thread#sm| diz2@@14 p2_1@@10))
)))
(assert (forall ((diz@@79 T@U) (p_1@@45 Real) (diz2@@15 T@U) (p2_1@@11 Real) ) (!  (=> (and (and (= (type diz@@79) RefType) (= (type diz2@@15) RefType)) (= (Thread__postJoin_at_Thread diz@@79 p_1@@45) (Thread__postJoin_at_Thread diz2@@15 p2_1@@11))) (and (= diz@@79 diz2@@15) (= p_1@@45 p2_1@@11)))
 :qid |stdinbpl.1003:15|
 :skolemid |122|
 :pattern ( (Thread__postJoin_at_Thread diz@@79 p_1@@45) (Thread__postJoin_at_Thread diz2@@15 p2_1@@11))
)))
(assert (forall ((arg0@@62 T@U) (arg1@@36 Real) ) (! (= (type (|Thread__postJoin_at_Thread#sm| arg0@@62 arg1@@36)) (FieldType PredicateType_Thread__postJoin_at_ThreadType (MapType1Type RefType boolType)))
 :qid |funType:Thread__postJoin_at_Thread#sm|
 :pattern ( (|Thread__postJoin_at_Thread#sm| arg0@@62 arg1@@36))
)))
(assert (forall ((diz@@80 T@U) (p_1@@46 Real) (diz2@@16 T@U) (p2_1@@12 Real) ) (!  (=> (and (and (= (type diz@@80) RefType) (= (type diz2@@16) RefType)) (= (|Thread__postJoin_at_Thread#sm| diz@@80 p_1@@46) (|Thread__postJoin_at_Thread#sm| diz2@@16 p2_1@@12))) (and (= diz@@80 diz2@@16) (= p_1@@46 p2_1@@12)))
 :qid |stdinbpl.1007:15|
 :skolemid |123|
 :pattern ( (|Thread__postJoin_at_Thread#sm| diz@@80 p_1@@46) (|Thread__postJoin_at_Thread#sm| diz2@@16 p2_1@@12))
)))
(assert (forall ((diz@@81 T@U) (p_1@@47 Real) (diz2@@17 T@U) (p2_1@@13 Real) ) (!  (=> (and (and (= (type diz@@81) RefType) (= (type diz2@@17) RefType)) (= (Worker__joinToken diz@@81 p_1@@47) (Worker__joinToken diz2@@17 p2_1@@13))) (and (= diz@@81 diz2@@17) (= p_1@@47 p2_1@@13)))
 :qid |stdinbpl.1192:15|
 :skolemid |152|
 :pattern ( (Worker__joinToken diz@@81 p_1@@47) (Worker__joinToken diz2@@17 p2_1@@13))
)))
(assert (forall ((arg0@@63 T@U) (arg1@@37 Real) ) (! (= (type (|Worker__joinToken#sm| arg0@@63 arg1@@37)) (FieldType PredicateType_Worker__joinTokenType (MapType1Type RefType boolType)))
 :qid |funType:Worker__joinToken#sm|
 :pattern ( (|Worker__joinToken#sm| arg0@@63 arg1@@37))
)))
(assert (forall ((diz@@82 T@U) (p_1@@48 Real) (diz2@@18 T@U) (p2_1@@14 Real) ) (!  (=> (and (and (= (type diz@@82) RefType) (= (type diz2@@18) RefType)) (= (|Worker__joinToken#sm| diz@@82 p_1@@48) (|Worker__joinToken#sm| diz2@@18 p2_1@@14))) (and (= diz@@82 diz2@@18) (= p_1@@48 p2_1@@14)))
 :qid |stdinbpl.1196:15|
 :skolemid |153|
 :pattern ( (|Worker__joinToken#sm| diz@@82 p_1@@48) (|Worker__joinToken#sm| diz2@@18 p2_1@@14))
)))
(assert (forall ((diz@@83 T@U) (p_1@@49 Real) (diz2@@19 T@U) (p2_1@@15 Real) ) (!  (=> (and (and (= (type diz@@83) RefType) (= (type diz2@@19) RefType)) (= (Worker__joinToken_at_Worker diz@@83 p_1@@49) (Worker__joinToken_at_Worker diz2@@19 p2_1@@15))) (and (= diz@@83 diz2@@19) (= p_1@@49 p2_1@@15)))
 :qid |stdinbpl.1227:15|
 :skolemid |158|
 :pattern ( (Worker__joinToken_at_Worker diz@@83 p_1@@49) (Worker__joinToken_at_Worker diz2@@19 p2_1@@15))
)))
(assert (forall ((arg0@@64 T@U) (arg1@@38 Real) ) (! (= (type (|Worker__joinToken_at_Worker#sm| arg0@@64 arg1@@38)) (FieldType PredicateType_Worker__joinToken_at_WorkerType (MapType1Type RefType boolType)))
 :qid |funType:Worker__joinToken_at_Worker#sm|
 :pattern ( (|Worker__joinToken_at_Worker#sm| arg0@@64 arg1@@38))
)))
(assert (forall ((diz@@84 T@U) (p_1@@50 Real) (diz2@@20 T@U) (p2_1@@16 Real) ) (!  (=> (and (and (= (type diz@@84) RefType) (= (type diz2@@20) RefType)) (= (|Worker__joinToken_at_Worker#sm| diz@@84 p_1@@50) (|Worker__joinToken_at_Worker#sm| diz2@@20 p2_1@@16))) (and (= diz@@84 diz2@@20) (= p_1@@50 p2_1@@16)))
 :qid |stdinbpl.1231:15|
 :skolemid |159|
 :pattern ( (|Worker__joinToken_at_Worker#sm| diz@@84 p_1@@50) (|Worker__joinToken_at_Worker#sm| diz2@@20 p2_1@@16))
)))
(assert (forall ((diz@@85 T@U) (p_1@@51 Real) (diz2@@21 T@U) (p2_1@@17 Real) ) (!  (=> (and (and (= (type diz@@85) RefType) (= (type diz2@@21) RefType)) (= (Worker__preFork diz@@85 p_1@@51) (Worker__preFork diz2@@21 p2_1@@17))) (and (= diz@@85 diz2@@21) (= p_1@@51 p2_1@@17)))
 :qid |stdinbpl.1280:15|
 :skolemid |164|
 :pattern ( (Worker__preFork diz@@85 p_1@@51) (Worker__preFork diz2@@21 p2_1@@17))
)))
(assert (forall ((arg0@@65 T@U) (arg1@@39 Real) ) (! (= (type (|Worker__preFork#sm| arg0@@65 arg1@@39)) (FieldType PredicateType_Worker__preForkType (MapType1Type RefType boolType)))
 :qid |funType:Worker__preFork#sm|
 :pattern ( (|Worker__preFork#sm| arg0@@65 arg1@@39))
)))
(assert (forall ((diz@@86 T@U) (p_1@@52 Real) (diz2@@22 T@U) (p2_1@@18 Real) ) (!  (=> (and (and (= (type diz@@86) RefType) (= (type diz2@@22) RefType)) (= (|Worker__preFork#sm| diz@@86 p_1@@52) (|Worker__preFork#sm| diz2@@22 p2_1@@18))) (and (= diz@@86 diz2@@22) (= p_1@@52 p2_1@@18)))
 :qid |stdinbpl.1284:15|
 :skolemid |165|
 :pattern ( (|Worker__preFork#sm| diz@@86 p_1@@52) (|Worker__preFork#sm| diz2@@22 p2_1@@18))
)))
(assert (forall ((diz@@87 T@U) (p_1@@53 Real) (diz2@@23 T@U) (p2_1@@19 Real) ) (!  (=> (and (and (= (type diz@@87) RefType) (= (type diz2@@23) RefType)) (= (Worker__postJoin diz@@87 p_1@@53) (Worker__postJoin diz2@@23 p2_1@@19))) (and (= diz@@87 diz2@@23) (= p_1@@53 p2_1@@19)))
 :qid |stdinbpl.1315:15|
 :skolemid |170|
 :pattern ( (Worker__postJoin diz@@87 p_1@@53) (Worker__postJoin diz2@@23 p2_1@@19))
)))
(assert (forall ((arg0@@66 T@U) (arg1@@40 Real) ) (! (= (type (|Worker__postJoin#sm| arg0@@66 arg1@@40)) (FieldType PredicateType_Worker__postJoinType (MapType1Type RefType boolType)))
 :qid |funType:Worker__postJoin#sm|
 :pattern ( (|Worker__postJoin#sm| arg0@@66 arg1@@40))
)))
(assert (forall ((diz@@88 T@U) (p_1@@54 Real) (diz2@@24 T@U) (p2_1@@20 Real) ) (!  (=> (and (and (= (type diz@@88) RefType) (= (type diz2@@24) RefType)) (= (|Worker__postJoin#sm| diz@@88 p_1@@54) (|Worker__postJoin#sm| diz2@@24 p2_1@@20))) (and (= diz@@88 diz2@@24) (= p_1@@54 p2_1@@20)))
 :qid |stdinbpl.1319:15|
 :skolemid |171|
 :pattern ( (|Worker__postJoin#sm| diz@@88 p_1@@54) (|Worker__postJoin#sm| diz2@@24 p2_1@@20))
)))
(assert (forall ((diz@@89 T@U) (p_1@@55 Real) (diz2@@25 T@U) (p2_1@@21 Real) ) (!  (=> (and (and (= (type diz@@89) RefType) (= (type diz2@@25) RefType)) (= (Worker__joinToken_at_Thread diz@@89 p_1@@55) (Worker__joinToken_at_Thread diz2@@25 p2_1@@21))) (and (= diz@@89 diz2@@25) (= p_1@@55 p2_1@@21)))
 :qid |stdinbpl.1350:15|
 :skolemid |176|
 :pattern ( (Worker__joinToken_at_Thread diz@@89 p_1@@55) (Worker__joinToken_at_Thread diz2@@25 p2_1@@21))
)))
(assert (forall ((arg0@@67 T@U) (arg1@@41 Real) ) (! (= (type (|Worker__joinToken_at_Thread#sm| arg0@@67 arg1@@41)) (FieldType PredicateType_Worker__joinToken_at_ThreadType (MapType1Type RefType boolType)))
 :qid |funType:Worker__joinToken_at_Thread#sm|
 :pattern ( (|Worker__joinToken_at_Thread#sm| arg0@@67 arg1@@41))
)))
(assert (forall ((diz@@90 T@U) (p_1@@56 Real) (diz2@@26 T@U) (p2_1@@22 Real) ) (!  (=> (and (and (= (type diz@@90) RefType) (= (type diz2@@26) RefType)) (= (|Worker__joinToken_at_Thread#sm| diz@@90 p_1@@56) (|Worker__joinToken_at_Thread#sm| diz2@@26 p2_1@@22))) (and (= diz@@90 diz2@@26) (= p_1@@56 p2_1@@22)))
 :qid |stdinbpl.1354:15|
 :skolemid |177|
 :pattern ( (|Worker__joinToken_at_Thread#sm| diz@@90 p_1@@56) (|Worker__joinToken_at_Thread#sm| diz2@@26 p2_1@@22))
)))
(assert (forall ((diz@@91 T@U) (p_1@@57 Real) (diz2@@27 T@U) (p2_1@@23 Real) ) (!  (=> (and (and (= (type diz@@91) RefType) (= (type diz2@@27) RefType)) (= (Worker__preFork_at_Thread diz@@91 p_1@@57) (Worker__preFork_at_Thread diz2@@27 p2_1@@23))) (and (= diz@@91 diz2@@27) (= p_1@@57 p2_1@@23)))
 :qid |stdinbpl.1385:15|
 :skolemid |182|
 :pattern ( (Worker__preFork_at_Thread diz@@91 p_1@@57) (Worker__preFork_at_Thread diz2@@27 p2_1@@23))
)))
(assert (forall ((arg0@@68 T@U) (arg1@@42 Real) ) (! (= (type (|Worker__preFork_at_Thread#sm| arg0@@68 arg1@@42)) (FieldType PredicateType_Worker__preFork_at_ThreadType (MapType1Type RefType boolType)))
 :qid |funType:Worker__preFork_at_Thread#sm|
 :pattern ( (|Worker__preFork_at_Thread#sm| arg0@@68 arg1@@42))
)))
(assert (forall ((diz@@92 T@U) (p_1@@58 Real) (diz2@@28 T@U) (p2_1@@24 Real) ) (!  (=> (and (and (= (type diz@@92) RefType) (= (type diz2@@28) RefType)) (= (|Worker__preFork_at_Thread#sm| diz@@92 p_1@@58) (|Worker__preFork_at_Thread#sm| diz2@@28 p2_1@@24))) (and (= diz@@92 diz2@@28) (= p_1@@58 p2_1@@24)))
 :qid |stdinbpl.1389:15|
 :skolemid |183|
 :pattern ( (|Worker__preFork_at_Thread#sm| diz@@92 p_1@@58) (|Worker__preFork_at_Thread#sm| diz2@@28 p2_1@@24))
)))
(assert (forall ((diz@@93 T@U) (p_1@@59 Real) (diz2@@29 T@U) (p2_1@@25 Real) ) (!  (=> (and (and (= (type diz@@93) RefType) (= (type diz2@@29) RefType)) (= (Worker__postJoin_at_Thread diz@@93 p_1@@59) (Worker__postJoin_at_Thread diz2@@29 p2_1@@25))) (and (= diz@@93 diz2@@29) (= p_1@@59 p2_1@@25)))
 :qid |stdinbpl.1434:15|
 :skolemid |188|
 :pattern ( (Worker__postJoin_at_Thread diz@@93 p_1@@59) (Worker__postJoin_at_Thread diz2@@29 p2_1@@25))
)))
(assert (forall ((arg0@@69 T@U) (arg1@@43 Real) ) (! (= (type (|Worker__postJoin_at_Thread#sm| arg0@@69 arg1@@43)) (FieldType PredicateType_Worker__postJoin_at_ThreadType (MapType1Type RefType boolType)))
 :qid |funType:Worker__postJoin_at_Thread#sm|
 :pattern ( (|Worker__postJoin_at_Thread#sm| arg0@@69 arg1@@43))
)))
(assert (forall ((diz@@94 T@U) (p_1@@60 Real) (diz2@@30 T@U) (p2_1@@26 Real) ) (!  (=> (and (and (= (type diz@@94) RefType) (= (type diz2@@30) RefType)) (= (|Worker__postJoin_at_Thread#sm| diz@@94 p_1@@60) (|Worker__postJoin_at_Thread#sm| diz2@@30 p2_1@@26))) (and (= diz@@94 diz2@@30) (= p_1@@60 p2_1@@26)))
 :qid |stdinbpl.1438:15|
 :skolemid |189|
 :pattern ( (|Worker__postJoin_at_Thread#sm| diz@@94 p_1@@60) (|Worker__postJoin_at_Thread#sm| diz2@@30 p2_1@@26))
)))
(assert (forall ((diz@@95 T@U) (p_1@@61 Real) (diz2@@31 T@U) (p2_1@@27 Real) ) (!  (=> (and (and (= (type diz@@95) RefType) (= (type diz2@@31) RefType)) (= (Worker__preFork_at_Worker diz@@95 p_1@@61) (Worker__preFork_at_Worker diz2@@31 p2_1@@27))) (and (= diz@@95 diz2@@31) (= p_1@@61 p2_1@@27)))
 :qid |stdinbpl.1483:15|
 :skolemid |194|
 :pattern ( (Worker__preFork_at_Worker diz@@95 p_1@@61) (Worker__preFork_at_Worker diz2@@31 p2_1@@27))
)))
(assert (forall ((arg0@@70 T@U) (arg1@@44 Real) ) (! (= (type (|Worker__preFork_at_Worker#sm| arg0@@70 arg1@@44)) (FieldType PredicateType_Worker__preFork_at_WorkerType (MapType1Type RefType boolType)))
 :qid |funType:Worker__preFork_at_Worker#sm|
 :pattern ( (|Worker__preFork_at_Worker#sm| arg0@@70 arg1@@44))
)))
(assert (forall ((diz@@96 T@U) (p_1@@62 Real) (diz2@@32 T@U) (p2_1@@28 Real) ) (!  (=> (and (and (= (type diz@@96) RefType) (= (type diz2@@32) RefType)) (= (|Worker__preFork_at_Worker#sm| diz@@96 p_1@@62) (|Worker__preFork_at_Worker#sm| diz2@@32 p2_1@@28))) (and (= diz@@96 diz2@@32) (= p_1@@62 p2_1@@28)))
 :qid |stdinbpl.1487:15|
 :skolemid |195|
 :pattern ( (|Worker__preFork_at_Worker#sm| diz@@96 p_1@@62) (|Worker__preFork_at_Worker#sm| diz2@@32 p2_1@@28))
)))
(assert (forall ((diz@@97 T@U) (p_1@@63 Real) (diz2@@33 T@U) (p2_1@@29 Real) ) (!  (=> (and (and (= (type diz@@97) RefType) (= (type diz2@@33) RefType)) (= (Worker__postJoin_at_Worker diz@@97 p_1@@63) (Worker__postJoin_at_Worker diz2@@33 p2_1@@29))) (and (= diz@@97 diz2@@33) (= p_1@@63 p2_1@@29)))
 :qid |stdinbpl.1582:15|
 :skolemid |200|
 :pattern ( (Worker__postJoin_at_Worker diz@@97 p_1@@63) (Worker__postJoin_at_Worker diz2@@33 p2_1@@29))
)))
(assert (forall ((arg0@@71 T@U) (arg1@@45 Real) ) (! (= (type (|Worker__postJoin_at_Worker#sm| arg0@@71 arg1@@45)) (FieldType PredicateType_Worker__postJoin_at_WorkerType (MapType1Type RefType boolType)))
 :qid |funType:Worker__postJoin_at_Worker#sm|
 :pattern ( (|Worker__postJoin_at_Worker#sm| arg0@@71 arg1@@45))
)))
(assert (forall ((diz@@98 T@U) (p_1@@64 Real) (diz2@@34 T@U) (p2_1@@30 Real) ) (!  (=> (and (and (= (type diz@@98) RefType) (= (type diz2@@34) RefType)) (= (|Worker__postJoin_at_Worker#sm| diz@@98 p_1@@64) (|Worker__postJoin_at_Worker#sm| diz2@@34 p2_1@@30))) (and (= diz@@98 diz2@@34) (= p_1@@64 p2_1@@30)))
 :qid |stdinbpl.1586:15|
 :skolemid |201|
 :pattern ( (|Worker__postJoin_at_Worker#sm| diz@@98 p_1@@64) (|Worker__postJoin_at_Worker#sm| diz2@@34 p2_1@@30))
)))
(assert  (and (forall ((arg0@@72 Int) (arg1@@46 Int) ) (! (= (type (p_dual arg0@@72 arg1@@46)) ProcessDomainTypeType)
 :qid |funType:p_dual|
 :pattern ( (p_dual arg0@@72 arg1@@46))
)) (forall ((arg0@@73 T@U) (arg1@@47 T@U) ) (! (= (type (p_merge arg0@@73 arg1@@47)) ProcessDomainTypeType)
 :qid |funType:p_merge|
 :pattern ( (p_merge arg0@@73 arg1@@47))
))))
(assert (forall ((n_1@@0 Int) (m_1 Int) ) (! (= (p_merge (p_single n_1@@0) (p_single m_1)) (p_dual n_1@@0 m_1))
 :qid |stdinbpl.278:15|
 :skolemid |30|
 :pattern ( (p_dual n_1@@0 m_1))
)))
(assert (forall ((diz@@99 T@U) (diz2@@35 T@U) ) (!  (=> (and (and (= (type diz@@99) RefType) (= (type diz2@@35) RefType)) (= (History__inv diz@@99) (History__inv diz2@@35))) (= diz@@99 diz2@@35))
 :qid |stdinbpl.478:15|
 :skolemid |44|
 :pattern ( (History__inv diz@@99) (History__inv diz2@@35))
)))
(assert (forall ((arg0@@74 T@U) ) (! (= (type (|History__inv#sm| arg0@@74)) (FieldType PredicateType_History__invType (MapType1Type RefType boolType)))
 :qid |funType:History__inv#sm|
 :pattern ( (|History__inv#sm| arg0@@74))
)))
(assert (forall ((diz@@100 T@U) (diz2@@36 T@U) ) (!  (=> (and (and (= (type diz@@100) RefType) (= (type diz2@@36) RefType)) (= (|History__inv#sm| diz@@100) (|History__inv#sm| diz2@@36))) (= diz@@100 diz2@@36))
 :qid |stdinbpl.482:15|
 :skolemid |45|
 :pattern ( (|History__inv#sm| diz@@100) (|History__inv#sm| diz2@@36))
)))
(assert (forall ((diz@@101 T@U) (diz2@@37 T@U) ) (!  (=> (and (and (= (type diz@@101) RefType) (= (type diz2@@37) RefType)) (= (SubjectLock__inv diz@@101) (SubjectLock__inv diz2@@37))) (= diz@@101 diz2@@37))
 :qid |stdinbpl.611:15|
 :skolemid |62|
 :pattern ( (SubjectLock__inv diz@@101) (SubjectLock__inv diz2@@37))
)))
(assert (forall ((arg0@@75 T@U) ) (! (= (type (|SubjectLock__inv#sm| arg0@@75)) (FieldType PredicateType_SubjectLock__invType (MapType1Type RefType boolType)))
 :qid |funType:SubjectLock__inv#sm|
 :pattern ( (|SubjectLock__inv#sm| arg0@@75))
)))
(assert (forall ((diz@@102 T@U) (diz2@@38 T@U) ) (!  (=> (and (and (= (type diz@@102) RefType) (= (type diz2@@38) RefType)) (= (|SubjectLock__inv#sm| diz@@102) (|SubjectLock__inv#sm| diz2@@38))) (= diz@@102 diz2@@38))
 :qid |stdinbpl.615:15|
 :skolemid |63|
 :pattern ( (|SubjectLock__inv#sm| diz@@102) (|SubjectLock__inv#sm| diz2@@38))
)))
(assert (forall ((diz@@103 T@U) (diz2@@39 T@U) ) (!  (=> (and (and (= (type diz@@103) RefType) (= (type diz2@@39) RefType)) (= (SubjectLock__valid diz@@103) (SubjectLock__valid diz2@@39))) (= diz@@103 diz2@@39))
 :qid |stdinbpl.674:15|
 :skolemid |68|
 :pattern ( (SubjectLock__valid diz@@103) (SubjectLock__valid diz2@@39))
)))
(assert (forall ((arg0@@76 T@U) ) (! (= (type (|SubjectLock__valid#sm| arg0@@76)) (FieldType PredicateType_SubjectLock__validType (MapType1Type RefType boolType)))
 :qid |funType:SubjectLock__valid#sm|
 :pattern ( (|SubjectLock__valid#sm| arg0@@76))
)))
(assert (forall ((diz@@104 T@U) (diz2@@40 T@U) ) (!  (=> (and (and (= (type diz@@104) RefType) (= (type diz2@@40) RefType)) (= (|SubjectLock__valid#sm| diz@@104) (|SubjectLock__valid#sm| diz2@@40))) (= diz@@104 diz2@@40))
 :qid |stdinbpl.678:15|
 :skolemid |69|
 :pattern ( (|SubjectLock__valid#sm| diz@@104) (|SubjectLock__valid#sm| diz2@@40))
)))
(assert (forall ((diz@@105 T@U) (diz2@@41 T@U) ) (!  (=> (and (and (= (type diz@@105) RefType) (= (type diz2@@41) RefType)) (= (Thread__is_a_Thread diz@@105) (Thread__is_a_Thread diz2@@41))) (= diz@@105 diz2@@41))
 :qid |stdinbpl.744:15|
 :skolemid |80|
 :pattern ( (Thread__is_a_Thread diz@@105) (Thread__is_a_Thread diz2@@41))
)))
(assert (forall ((arg0@@77 T@U) ) (! (= (type (|Thread__is_a_Thread#sm| arg0@@77)) (FieldType PredicateType_Thread__is_a_ThreadType (MapType1Type RefType boolType)))
 :qid |funType:Thread__is_a_Thread#sm|
 :pattern ( (|Thread__is_a_Thread#sm| arg0@@77))
)))
(assert (forall ((diz@@106 T@U) (diz2@@42 T@U) ) (!  (=> (and (and (= (type diz@@106) RefType) (= (type diz2@@42) RefType)) (= (|Thread__is_a_Thread#sm| diz@@106) (|Thread__is_a_Thread#sm| diz2@@42))) (= diz@@106 diz2@@42))
 :qid |stdinbpl.748:15|
 :skolemid |81|
 :pattern ( (|Thread__is_a_Thread#sm| diz@@106) (|Thread__is_a_Thread#sm| diz2@@42))
)))
(assert (forall ((diz@@107 T@U) (diz2@@43 T@U) ) (!  (=> (and (and (= (type diz@@107) RefType) (= (type diz2@@43) RefType)) (= (Thread__instance_of_Thread diz@@107) (Thread__instance_of_Thread diz2@@43))) (= diz@@107 diz2@@43))
 :qid |stdinbpl.779:15|
 :skolemid |86|
 :pattern ( (Thread__instance_of_Thread diz@@107) (Thread__instance_of_Thread diz2@@43))
)))
(assert (forall ((arg0@@78 T@U) ) (! (= (type (|Thread__instance_of_Thread#sm| arg0@@78)) (FieldType PredicateType_Thread__instance_of_ThreadType (MapType1Type RefType boolType)))
 :qid |funType:Thread__instance_of_Thread#sm|
 :pattern ( (|Thread__instance_of_Thread#sm| arg0@@78))
)))
(assert (forall ((diz@@108 T@U) (diz2@@44 T@U) ) (!  (=> (and (and (= (type diz@@108) RefType) (= (type diz2@@44) RefType)) (= (|Thread__instance_of_Thread#sm| diz@@108) (|Thread__instance_of_Thread#sm| diz2@@44))) (= diz@@108 diz2@@44))
 :qid |stdinbpl.783:15|
 :skolemid |87|
 :pattern ( (|Thread__instance_of_Thread#sm| diz@@108) (|Thread__instance_of_Thread#sm| diz2@@44))
)))
(assert (forall ((diz@@109 T@U) (diz2@@45 T@U) ) (!  (=> (and (and (= (type diz@@109) RefType) (= (type diz2@@45) RefType)) (= (Worker__is_a_Worker diz@@109) (Worker__is_a_Worker diz2@@45))) (= diz@@109 diz2@@45))
 :qid |stdinbpl.1052:15|
 :skolemid |128|
 :pattern ( (Worker__is_a_Worker diz@@109) (Worker__is_a_Worker diz2@@45))
)))
(assert (forall ((arg0@@79 T@U) ) (! (= (type (|Worker__is_a_Worker#sm| arg0@@79)) (FieldType PredicateType_Worker__is_a_WorkerType (MapType1Type RefType boolType)))
 :qid |funType:Worker__is_a_Worker#sm|
 :pattern ( (|Worker__is_a_Worker#sm| arg0@@79))
)))
(assert (forall ((diz@@110 T@U) (diz2@@46 T@U) ) (!  (=> (and (and (= (type diz@@110) RefType) (= (type diz2@@46) RefType)) (= (|Worker__is_a_Worker#sm| diz@@110) (|Worker__is_a_Worker#sm| diz2@@46))) (= diz@@110 diz2@@46))
 :qid |stdinbpl.1056:15|
 :skolemid |129|
 :pattern ( (|Worker__is_a_Worker#sm| diz@@110) (|Worker__is_a_Worker#sm| diz2@@46))
)))
(assert (forall ((diz@@111 T@U) (diz2@@47 T@U) ) (!  (=> (and (and (= (type diz@@111) RefType) (= (type diz2@@47) RefType)) (= (Worker__instance_of_Worker diz@@111) (Worker__instance_of_Worker diz2@@47))) (= diz@@111 diz2@@47))
 :qid |stdinbpl.1087:15|
 :skolemid |134|
 :pattern ( (Worker__instance_of_Worker diz@@111) (Worker__instance_of_Worker diz2@@47))
)))
(assert (forall ((arg0@@80 T@U) ) (! (= (type (|Worker__instance_of_Worker#sm| arg0@@80)) (FieldType PredicateType_Worker__instance_of_WorkerType (MapType1Type RefType boolType)))
 :qid |funType:Worker__instance_of_Worker#sm|
 :pattern ( (|Worker__instance_of_Worker#sm| arg0@@80))
)))
(assert (forall ((diz@@112 T@U) (diz2@@48 T@U) ) (!  (=> (and (and (= (type diz@@112) RefType) (= (type diz2@@48) RefType)) (= (|Worker__instance_of_Worker#sm| diz@@112) (|Worker__instance_of_Worker#sm| diz2@@48))) (= diz@@112 diz2@@48))
 :qid |stdinbpl.1091:15|
 :skolemid |135|
 :pattern ( (|Worker__instance_of_Worker#sm| diz@@112) (|Worker__instance_of_Worker#sm| diz2@@48))
)))
(assert (forall ((diz@@113 T@U) (diz2@@49 T@U) ) (!  (=> (and (and (= (type diz@@113) RefType) (= (type diz2@@49) RefType)) (= (Worker__is_a_Thread diz@@113) (Worker__is_a_Thread diz2@@49))) (= diz@@113 diz2@@49))
 :qid |stdinbpl.1122:15|
 :skolemid |140|
 :pattern ( (Worker__is_a_Thread diz@@113) (Worker__is_a_Thread diz2@@49))
)))
(assert (forall ((arg0@@81 T@U) ) (! (= (type (|Worker__is_a_Thread#sm| arg0@@81)) (FieldType PredicateType_Worker__is_a_ThreadType (MapType1Type RefType boolType)))
 :qid |funType:Worker__is_a_Thread#sm|
 :pattern ( (|Worker__is_a_Thread#sm| arg0@@81))
)))
(assert (forall ((diz@@114 T@U) (diz2@@50 T@U) ) (!  (=> (and (and (= (type diz@@114) RefType) (= (type diz2@@50) RefType)) (= (|Worker__is_a_Thread#sm| diz@@114) (|Worker__is_a_Thread#sm| diz2@@50))) (= diz@@114 diz2@@50))
 :qid |stdinbpl.1126:15|
 :skolemid |141|
 :pattern ( (|Worker__is_a_Thread#sm| diz@@114) (|Worker__is_a_Thread#sm| diz2@@50))
)))
(assert (forall ((diz@@115 T@U) (diz2@@51 T@U) ) (!  (=> (and (and (= (type diz@@115) RefType) (= (type diz2@@51) RefType)) (= (Worker__instance_of_Thread diz@@115) (Worker__instance_of_Thread diz2@@51))) (= diz@@115 diz2@@51))
 :qid |stdinbpl.1157:15|
 :skolemid |146|
 :pattern ( (Worker__instance_of_Thread diz@@115) (Worker__instance_of_Thread diz2@@51))
)))
(assert (forall ((arg0@@82 T@U) ) (! (= (type (|Worker__instance_of_Thread#sm| arg0@@82)) (FieldType PredicateType_Worker__instance_of_ThreadType (MapType1Type RefType boolType)))
 :qid |funType:Worker__instance_of_Thread#sm|
 :pattern ( (|Worker__instance_of_Thread#sm| arg0@@82))
)))
(assert (forall ((diz@@116 T@U) (diz2@@52 T@U) ) (!  (=> (and (and (= (type diz@@116) RefType) (= (type diz2@@52) RefType)) (= (|Worker__instance_of_Thread#sm| diz@@116) (|Worker__instance_of_Thread#sm| diz2@@52))) (= diz@@116 diz2@@52))
 :qid |stdinbpl.1161:15|
 :skolemid |147|
 :pattern ( (|Worker__instance_of_Thread#sm| diz@@116) (|Worker__instance_of_Thread#sm| diz2@@52))
)))
(assert (forall ((Heap@@34 T@U) (ExhaleHeap@@2 T@U) (Mask@@3 T@U) (o_1@@0 T@U) (f_2 T@U) ) (! (let ((B@@1 (FieldTypeInv1 (type f_2))))
(let ((A@@1 (FieldTypeInv0 (type f_2))))
 (=> (and (and (and (and (and (and (= (type Heap@@34) (MapType0Type RefType)) (= (type ExhaleHeap@@2) (MapType0Type RefType))) (= (type Mask@@3) (MapType1Type RefType realType))) (= (type o_1@@0) RefType)) (= (type f_2) (FieldType A@@1 B@@1))) (IdenticalOnKnownLocations Heap@@34 ExhaleHeap@@2 Mask@@3)) (HasDirectPerm Mask@@3 o_1@@0 f_2)) (= (MapType0Select Heap@@34 o_1@@0 f_2) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2)))))
 :qid |stdinbpl.42:22|
 :skolemid |1|
 :pattern ( (IdenticalOnKnownLocations Heap@@34 ExhaleHeap@@2 Mask@@3) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2))
)))
(assert  (and (= (type dummyHeap) (MapType0Type RefType)) (= (type ZeroMask) (MapType1Type RefType realType))))
(assert (state dummyHeap ZeroMask))
(assert (forall ((p1_1 T@U) ) (!  (=> (= (type p1_1) ProcessDomainTypeType) (forall ((p2_1@@31 T@U) ) (!  (=> (= (type p2_1@@31) ProcessDomainTypeType) (forall ((p3 T@U) ) (!  (=> (= (type p3) ProcessDomainTypeType) (= (p_seq (p_seq p1_1 p2_1@@31) p3) (p_seq p1_1 (p_seq p2_1@@31 p3))))
 :qid |stdinbpl.264:13|
 :skolemid |26|
 :pattern ( (p_seq (p_seq p1_1 p2_1@@31) p3))
 :pattern ( (p_seq p1_1 (p_seq p2_1@@31 p3)))
)))
 :qid |stdinbpl.262:11|
 :skolemid |27|
 :pattern ( (p_seq p1_1 p2_1@@31))
)))
 :qid |stdinbpl.260:15|
 :skolemid |28|
 :no-pattern (type p1_1)
 :no-pattern (U_2_int p1_1)
 :no-pattern (U_2_bool p1_1)
)))
(assert (forall ((p T@U) (v_1 T@U) (w T@U) ) (! (let ((A@@2 (FieldTypeInv0 (type p))))
 (=> (and (and (= (type p) (FieldType A@@2 FrameTypeType)) (= (type v_1) FrameTypeType)) (= (type w) FrameTypeType)) (not (InsidePredicate p v_1 p w))))
 :qid |stdinbpl.174:19|
 :skolemid |21|
 :pattern ( (InsidePredicate p v_1 p w))
)))
(assert  (not (IsPredicateField History__x_hist_value)))
(assert  (not (IsWandField History__x_hist_value)))
(assert  (not (IsPredicateField History__x_hist_mode)))
(assert  (not (IsWandField History__x_hist_mode)))
(assert  (not (IsPredicateField History__x_hist_init)))
(assert  (not (IsWandField History__x_hist_init)))
(assert  (not (IsPredicateField History__x_hist_act)))
(assert  (not (IsWandField History__x_hist_act)))
(assert  (not (IsPredicateField SubjectLock__subject)))
(assert  (not (IsWandField SubjectLock__subject)))
(assert  (not (IsPredicateField Worker__l)))
(assert  (not (IsWandField Worker__l)))
(assert  (not (IsPredicateField Worker__s)))
(assert  (not (IsWandField Worker__s)))
(assert (forall ((Heap@@35 T@U) (ExhaleHeap@@3 T@U) (Mask@@4 T@U) ) (!  (=> (and (and (and (= (type Heap@@35) (MapType0Type RefType)) (= (type ExhaleHeap@@3) (MapType0Type RefType))) (= (type Mask@@4) (MapType1Type RefType realType))) (IdenticalOnKnownLocations Heap@@35 ExhaleHeap@@3 Mask@@4)) (succHeap Heap@@35 ExhaleHeap@@3))
 :qid |stdinbpl.83:15|
 :skolemid |10|
 :pattern ( (IdenticalOnKnownLocations Heap@@35 ExhaleHeap@@3 Mask@@4))
)))
(assert (forall ((Heap@@36 T@U) (Mask@@5 T@U) (diz@@117 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@36) (MapType0Type RefType)) (= (type Mask@@5) (MapType1Type RefType realType))) (= (type diz@@117) RefType)) (and (state Heap@@36 Mask@@5) (< AssumeFunctionsAbove 0))) (not (= diz@@117 null))) (= (History__free_get_x Heap@@36 diz@@117) (U_2_int (MapType0Select Heap@@36 diz@@117 History__x_hist_value))))
 :qid |stdinbpl.338:15|
 :skolemid |35|
 :pattern ( (state Heap@@36 Mask@@5) (History__free_get_x Heap@@36 diz@@117))
)))
(assert (forall ((Heap@@37 T@U) (Mask@@6 T@U) (diz@@118 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@37) (MapType0Type RefType)) (= (type Mask@@6) (MapType1Type RefType realType))) (= (type diz@@118) RefType)) (and (state Heap@@37 Mask@@6) (< AssumeFunctionsAbove 1))) (not (= diz@@118 null))) (= (History__hist_get_x Heap@@37 diz@@118) (U_2_int (MapType0Select Heap@@37 diz@@118 History__x_hist_value))))
 :qid |stdinbpl.406:15|
 :skolemid |39|
 :pattern ( (state Heap@@37 Mask@@6) (History__hist_get_x Heap@@37 diz@@118))
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
(assert  (and (forall ((arg0@@83 Real) (arg1@@48 T@U) ) (! (= (type (ConditionalFrame arg0@@83 arg1@@48)) FrameTypeType)
 :qid |funType:ConditionalFrame|
 :pattern ( (ConditionalFrame arg0@@83 arg1@@48))
)) (= (type EmptyFrame) FrameTypeType)))
(assert (forall ((p@@0 Real) (f_6 T@U) ) (!  (=> (= (type f_6) FrameTypeType) (= (ConditionalFrame p@@0 f_6) (ite (> p@@0 0.0) f_6 EmptyFrame)))
 :qid |stdinbpl.162:15|
 :skolemid |19|
 :pattern ( (ConditionalFrame p@@0 f_6))
)))
(assert (forall ((Mask@@7 T@U) (o_2@@0 T@U) (f_4@@0 T@U) ) (! (let ((B@@3 (FieldTypeInv1 (type f_4@@0))))
(let ((A@@4 (FieldTypeInv0 (type f_4@@0))))
 (=> (and (and (= (type Mask@@7) (MapType1Type RefType realType)) (= (type o_2@@0) RefType)) (= (type f_4@@0) (FieldType A@@4 B@@3))) (= (HasDirectPerm Mask@@7 o_2@@0 f_4@@0) (> (U_2_real (MapType1Select Mask@@7 o_2@@0 f_4@@0)) NoPerm)))))
 :qid |stdinbpl.133:22|
 :skolemid |17|
 :pattern ( (HasDirectPerm Mask@@7 o_2@@0 f_4@@0))
)))
(assert (forall ((o_2@@1 T@U) (f_4@@1 T@U) ) (! (let ((B@@4 (FieldTypeInv1 (type f_4@@1))))
(let ((A@@5 (FieldTypeInv0 (type f_4@@1))))
 (=> (and (= (type o_2@@1) RefType) (= (type f_4@@1) (FieldType A@@5 B@@4))) (= (U_2_real (MapType1Select ZeroMask o_2@@1 f_4@@1)) NoPerm))))
 :qid |stdinbpl.106:22|
 :skolemid |13|
 :pattern ( (MapType1Select ZeroMask o_2@@1 f_4@@1))
)))
(assert (forall ((p_1@@65 T@U) ) (!  (=> (= (type p_1@@65) ProcessDomainTypeType) (= (p_merge p_empty p_1@@65) p_1@@65))
 :qid |stdinbpl.242:15|
 :skolemid |23|
 :pattern ( (p_merge p_empty p_1@@65))
)))
(assert (forall ((p_1@@66 T@U) ) (!  (=> (= (type p_1@@66) ProcessDomainTypeType) (= (p_seq p_empty p_1@@66) p_1@@66))
 :qid |stdinbpl.248:15|
 :skolemid |24|
 :pattern ( (p_seq p_empty p_1@@66))
)))
(assert  (and (= (Ctor TYPEDomainTypeType) 40) (= (type class_Object) TYPEDomainTypeType)))
(assert (forall ((t_1 T@U) ) (!  (=> (= (type t_1) TYPEDomainTypeType) (instanceof class_Object t_1))
 :qid |stdinbpl.211:15|
 :skolemid |22|
 :pattern ( (instanceof class_Object t_1))
)))
(assert (forall ((diz@@119 T@U) (p_1@@67 Real) ) (!  (=> (= (type diz@@119) RefType) (= (getPredWandId (Thread__joinToken diz@@119 p_1@@67)) 8))
 :qid |stdinbpl.808:15|
 :skolemid |91|
 :pattern ( (Thread__joinToken diz@@119 p_1@@67))
)))
(assert (forall ((diz@@120 T@U) (p_1@@68 Real) ) (!  (=> (= (type diz@@120) RefType) (= (getPredWandId (Thread__preFork diz@@120 p_1@@68)) 9))
 :qid |stdinbpl.843:15|
 :skolemid |97|
 :pattern ( (Thread__preFork diz@@120 p_1@@68))
)))
(assert (forall ((diz@@121 T@U) (p_1@@69 Real) ) (!  (=> (= (type diz@@121) RefType) (= (getPredWandId (Thread__postJoin diz@@121 p_1@@69)) 10))
 :qid |stdinbpl.878:15|
 :skolemid |103|
 :pattern ( (Thread__postJoin diz@@121 p_1@@69))
)))
(assert (forall ((diz@@122 T@U) (p_1@@70 Real) ) (!  (=> (= (type diz@@122) RefType) (= (getPredWandId (Thread__joinToken_at_Thread diz@@122 p_1@@70)) 11))
 :qid |stdinbpl.913:15|
 :skolemid |109|
 :pattern ( (Thread__joinToken_at_Thread diz@@122 p_1@@70))
)))
(assert (forall ((diz@@123 T@U) (p_1@@71 Real) ) (!  (=> (= (type diz@@123) RefType) (= (getPredWandId (Thread__preFork_at_Thread diz@@123 p_1@@71)) 12))
 :qid |stdinbpl.948:15|
 :skolemid |115|
 :pattern ( (Thread__preFork_at_Thread diz@@123 p_1@@71))
)))
(assert (forall ((diz@@124 T@U) (p_1@@72 Real) ) (!  (=> (= (type diz@@124) RefType) (= (getPredWandId (Thread__postJoin_at_Thread diz@@124 p_1@@72)) 13))
 :qid |stdinbpl.997:15|
 :skolemid |121|
 :pattern ( (Thread__postJoin_at_Thread diz@@124 p_1@@72))
)))
(assert (forall ((diz@@125 T@U) (p_1@@73 Real) ) (!  (=> (= (type diz@@125) RefType) (= (getPredWandId (Worker__joinToken diz@@125 p_1@@73)) 18))
 :qid |stdinbpl.1186:15|
 :skolemid |151|
 :pattern ( (Worker__joinToken diz@@125 p_1@@73))
)))
(assert (forall ((diz@@126 T@U) (p_1@@74 Real) ) (!  (=> (= (type diz@@126) RefType) (= (getPredWandId (Worker__joinToken_at_Worker diz@@126 p_1@@74)) 19))
 :qid |stdinbpl.1221:15|
 :skolemid |157|
 :pattern ( (Worker__joinToken_at_Worker diz@@126 p_1@@74))
)))
(assert (forall ((diz@@127 T@U) (p_1@@75 Real) ) (!  (=> (= (type diz@@127) RefType) (= (getPredWandId (Worker__preFork diz@@127 p_1@@75)) 20))
 :qid |stdinbpl.1274:15|
 :skolemid |163|
 :pattern ( (Worker__preFork diz@@127 p_1@@75))
)))
(assert (forall ((diz@@128 T@U) (p_1@@76 Real) ) (!  (=> (= (type diz@@128) RefType) (= (getPredWandId (Worker__postJoin diz@@128 p_1@@76)) 21))
 :qid |stdinbpl.1309:15|
 :skolemid |169|
 :pattern ( (Worker__postJoin diz@@128 p_1@@76))
)))
(assert (forall ((diz@@129 T@U) (p_1@@77 Real) ) (!  (=> (= (type diz@@129) RefType) (= (getPredWandId (Worker__joinToken_at_Thread diz@@129 p_1@@77)) 22))
 :qid |stdinbpl.1344:15|
 :skolemid |175|
 :pattern ( (Worker__joinToken_at_Thread diz@@129 p_1@@77))
)))
(assert (forall ((diz@@130 T@U) (p_1@@78 Real) ) (!  (=> (= (type diz@@130) RefType) (= (getPredWandId (Worker__preFork_at_Thread diz@@130 p_1@@78)) 23))
 :qid |stdinbpl.1379:15|
 :skolemid |181|
 :pattern ( (Worker__preFork_at_Thread diz@@130 p_1@@78))
)))
(assert (forall ((diz@@131 T@U) (p_1@@79 Real) ) (!  (=> (= (type diz@@131) RefType) (= (getPredWandId (Worker__postJoin_at_Thread diz@@131 p_1@@79)) 24))
 :qid |stdinbpl.1428:15|
 :skolemid |187|
 :pattern ( (Worker__postJoin_at_Thread diz@@131 p_1@@79))
)))
(assert (forall ((diz@@132 T@U) (p_1@@80 Real) ) (!  (=> (= (type diz@@132) RefType) (= (getPredWandId (Worker__preFork_at_Worker diz@@132 p_1@@80)) 25))
 :qid |stdinbpl.1477:15|
 :skolemid |193|
 :pattern ( (Worker__preFork_at_Worker diz@@132 p_1@@80))
)))
(assert (forall ((diz@@133 T@U) (p_1@@81 Real) ) (!  (=> (= (type diz@@133) RefType) (= (getPredWandId (Worker__postJoin_at_Worker diz@@133 p_1@@81)) 26))
 :qid |stdinbpl.1576:15|
 :skolemid |199|
 :pattern ( (Worker__postJoin_at_Worker diz@@133 p_1@@81))
)))
(assert (forall ((Heap@@38 T@U) (ExhaleHeap@@4 T@U) (Mask@@8 T@U) (pm_f@@1 T@U) ) (! (let ((C@@1 (FieldTypeInv0 (type pm_f@@1))))
 (=> (and (and (and (and (and (= (type Heap@@38) (MapType0Type RefType)) (= (type ExhaleHeap@@4) (MapType0Type RefType))) (= (type Mask@@8) (MapType1Type RefType realType))) (= (type pm_f@@1) (FieldType C@@1 FrameTypeType))) (IdenticalOnKnownLocations Heap@@38 ExhaleHeap@@4 Mask@@8)) (and (HasDirectPerm Mask@@8 null pm_f@@1) (IsPredicateField pm_f@@1))) (forall ((o2 T@U) (f_2@@0 T@U) ) (! (let ((B@@5 (FieldTypeInv1 (type f_2@@0))))
(let ((A@@6 (FieldTypeInv0 (type f_2@@0))))
 (=> (and (and (= (type o2) RefType) (= (type f_2@@0) (FieldType A@@6 B@@5))) (U_2_bool (MapType1Select (MapType0Select Heap@@38 null (PredicateMaskField pm_f@@1)) o2 f_2@@0))) (= (MapType0Select Heap@@38 o2 f_2@@0) (MapType0Select ExhaleHeap@@4 o2 f_2@@0)))))
 :qid |stdinbpl.54:134|
 :skolemid |3|
 :pattern ( (MapType0Select ExhaleHeap@@4 o2 f_2@@0))
))))
 :qid |stdinbpl.52:19|
 :skolemid |4|
 :pattern ( (IdenticalOnKnownLocations Heap@@38 ExhaleHeap@@4 Mask@@8) (IsPredicateField pm_f@@1))
)))
(assert (forall ((Heap@@39 T@U) (ExhaleHeap@@5 T@U) (Mask@@9 T@U) (pm_f@@2 T@U) ) (! (let ((C@@2 (FieldTypeInv0 (type pm_f@@2))))
 (=> (and (and (and (and (and (= (type Heap@@39) (MapType0Type RefType)) (= (type ExhaleHeap@@5) (MapType0Type RefType))) (= (type Mask@@9) (MapType1Type RefType realType))) (= (type pm_f@@2) (FieldType C@@2 FrameTypeType))) (IdenticalOnKnownLocations Heap@@39 ExhaleHeap@@5 Mask@@9)) (and (HasDirectPerm Mask@@9 null pm_f@@2) (IsWandField pm_f@@2))) (forall ((o2@@0 T@U) (f_2@@1 T@U) ) (! (let ((B@@6 (FieldTypeInv1 (type f_2@@1))))
(let ((A@@7 (FieldTypeInv0 (type f_2@@1))))
 (=> (and (and (= (type o2@@0) RefType) (= (type f_2@@1) (FieldType A@@7 B@@6))) (U_2_bool (MapType1Select (MapType0Select Heap@@39 null (WandMaskField pm_f@@2)) o2@@0 f_2@@1))) (= (MapType0Select Heap@@39 o2@@0 f_2@@1) (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1)))))
 :qid |stdinbpl.67:129|
 :skolemid |6|
 :pattern ( (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1))
))))
 :qid |stdinbpl.65:19|
 :skolemid |7|
 :pattern ( (IdenticalOnKnownLocations Heap@@39 ExhaleHeap@@5 Mask@@9) (IsWandField pm_f@@2))
)))
(assert (forall ((diz@@134 T@U) ) (!  (=> (= (type diz@@134) RefType) (= (getPredWandId (History__inv diz@@134)) 0))
 :qid |stdinbpl.472:15|
 :skolemid |43|
 :pattern ( (History__inv diz@@134))
)))
(assert (forall ((diz@@135 T@U) ) (!  (=> (= (type diz@@135) RefType) (= (getPredWandId (SubjectLock__inv diz@@135)) 3))
 :qid |stdinbpl.605:15|
 :skolemid |61|
 :pattern ( (SubjectLock__inv diz@@135))
)))
(assert (forall ((diz@@136 T@U) ) (!  (=> (= (type diz@@136) RefType) (= (getPredWandId (SubjectLock__valid diz@@136)) 4))
 :qid |stdinbpl.668:15|
 :skolemid |67|
 :pattern ( (SubjectLock__valid diz@@136))
)))
(assert (forall ((diz@@137 T@U) ) (!  (=> (= (type diz@@137) RefType) (= (getPredWandId (Thread__is_a_Thread diz@@137)) 6))
 :qid |stdinbpl.738:15|
 :skolemid |79|
 :pattern ( (Thread__is_a_Thread diz@@137))
)))
(assert (forall ((diz@@138 T@U) ) (!  (=> (= (type diz@@138) RefType) (= (getPredWandId (Thread__instance_of_Thread diz@@138)) 7))
 :qid |stdinbpl.773:15|
 :skolemid |85|
 :pattern ( (Thread__instance_of_Thread diz@@138))
)))
(assert (forall ((diz@@139 T@U) ) (!  (=> (= (type diz@@139) RefType) (= (getPredWandId (Worker__is_a_Worker diz@@139)) 14))
 :qid |stdinbpl.1046:15|
 :skolemid |127|
 :pattern ( (Worker__is_a_Worker diz@@139))
)))
(assert (forall ((diz@@140 T@U) ) (!  (=> (= (type diz@@140) RefType) (= (getPredWandId (Worker__instance_of_Worker diz@@140)) 15))
 :qid |stdinbpl.1081:15|
 :skolemid |133|
 :pattern ( (Worker__instance_of_Worker diz@@140))
)))
(assert (forall ((diz@@141 T@U) ) (!  (=> (= (type diz@@141) RefType) (= (getPredWandId (Worker__is_a_Thread diz@@141)) 16))
 :qid |stdinbpl.1116:15|
 :skolemid |139|
 :pattern ( (Worker__is_a_Thread diz@@141))
)))
(assert (forall ((diz@@142 T@U) ) (!  (=> (= (type diz@@142) RefType) (= (getPredWandId (Worker__instance_of_Thread diz@@142)) 17))
 :qid |stdinbpl.1151:15|
 :skolemid |145|
 :pattern ( (Worker__instance_of_Thread diz@@142))
)))
(assert (forall ((Mask@@10 T@U) (o_2@@2 T@U) (f_4@@2 T@U) ) (! (let ((B@@7 (FieldTypeInv1 (type f_4@@2))))
(let ((A@@8 (FieldTypeInv0 (type f_4@@2))))
 (=> (and (and (and (= (type Mask@@10) (MapType1Type RefType realType)) (= (type o_2@@2) RefType)) (= (type f_4@@2) (FieldType A@@8 B@@7))) (GoodMask Mask@@10)) (and (>= (U_2_real (MapType1Select Mask@@10 o_2@@2 f_4@@2)) NoPerm) (=> (and (and (GoodMask Mask@@10) (not (IsPredicateField f_4@@2))) (not (IsWandField f_4@@2))) (<= (U_2_real (MapType1Select Mask@@10 o_2@@2 f_4@@2)) FullPerm))))))
 :qid |stdinbpl.128:22|
 :skolemid |16|
 :pattern ( (GoodMask Mask@@10) (MapType1Select Mask@@10 o_2@@2 f_4@@2))
)))
(assert (forall ((arg0@@84 T@U) ) (! (= (type (FrameFragment arg0@@84)) FrameTypeType)
 :qid |funType:FrameFragment|
 :pattern ( (FrameFragment arg0@@84))
)))
(assert (forall ((Heap@@40 T@U) (Mask@@11 T@U) (diz@@143 T@U) ) (!  (=> (and (and (and (= (type Heap@@40) (MapType0Type RefType)) (= (type Mask@@11) (MapType1Type RefType realType))) (= (type diz@@143) RefType)) (state Heap@@40 Mask@@11)) (= (|History__free_get_x'| Heap@@40 diz@@143) (|History__free_get_x#frame| (FrameFragment (MapType0Select Heap@@40 diz@@143 History__x_hist_value)) diz@@143)))
 :qid |stdinbpl.345:15|
 :skolemid |36|
 :pattern ( (state Heap@@40 Mask@@11) (|History__free_get_x'| Heap@@40 diz@@143))
)))
(assert (forall ((Heap@@41 T@U) (Mask@@12 T@U) (diz@@144 T@U) ) (!  (=> (and (and (and (= (type Heap@@41) (MapType0Type RefType)) (= (type Mask@@12) (MapType1Type RefType realType))) (= (type diz@@144) RefType)) (state Heap@@41 Mask@@12)) (= (|History__hist_get_x'| Heap@@41 diz@@144) (|History__hist_get_x#frame| (FrameFragment (MapType0Select Heap@@41 diz@@144 History__x_hist_value)) diz@@144)))
 :qid |stdinbpl.413:15|
 :skolemid |40|
 :pattern ( (state Heap@@41 Mask@@12) (|History__hist_get_x'| Heap@@41 diz@@144))
)))
(assert (forall ((o T@U) (f T@U) (Heap@@42 T@U) ) (!  (=> (and (and (and (= (type o) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap@@42) (MapType0Type RefType))) (U_2_bool (MapType0Select Heap@@42 o $allocated))) (U_2_bool (MapType0Select Heap@@42 (MapType0Select Heap@@42 o f) $allocated)))
 :qid |stdinbpl.31:15|
 :skolemid |0|
 :pattern ( (MapType0Select Heap@@42 o f))
)))
(assert (forall ((diz@@145 T@U) (p_1@@82 Real) ) (!  (=> (= (type diz@@145) RefType) (= (PredicateMaskField (Thread__joinToken diz@@145 p_1@@82)) (|Thread__joinToken#sm| diz@@145 p_1@@82)))
 :qid |stdinbpl.800:15|
 :skolemid |89|
 :pattern ( (PredicateMaskField (Thread__joinToken diz@@145 p_1@@82)))
)))
(assert (forall ((diz@@146 T@U) (p_1@@83 Real) ) (!  (=> (= (type diz@@146) RefType) (= (PredicateMaskField (Thread__preFork diz@@146 p_1@@83)) (|Thread__preFork#sm| diz@@146 p_1@@83)))
 :qid |stdinbpl.835:15|
 :skolemid |95|
 :pattern ( (PredicateMaskField (Thread__preFork diz@@146 p_1@@83)))
)))
(assert (forall ((diz@@147 T@U) (p_1@@84 Real) ) (!  (=> (= (type diz@@147) RefType) (= (PredicateMaskField (Thread__postJoin diz@@147 p_1@@84)) (|Thread__postJoin#sm| diz@@147 p_1@@84)))
 :qid |stdinbpl.870:15|
 :skolemid |101|
 :pattern ( (PredicateMaskField (Thread__postJoin diz@@147 p_1@@84)))
)))
(assert (forall ((diz@@148 T@U) (p_1@@85 Real) ) (!  (=> (= (type diz@@148) RefType) (= (PredicateMaskField (Thread__joinToken_at_Thread diz@@148 p_1@@85)) (|Thread__joinToken_at_Thread#sm| diz@@148 p_1@@85)))
 :qid |stdinbpl.905:15|
 :skolemid |107|
 :pattern ( (PredicateMaskField (Thread__joinToken_at_Thread diz@@148 p_1@@85)))
)))
(assert (forall ((diz@@149 T@U) (p_1@@86 Real) ) (!  (=> (= (type diz@@149) RefType) (= (PredicateMaskField (Thread__preFork_at_Thread diz@@149 p_1@@86)) (|Thread__preFork_at_Thread#sm| diz@@149 p_1@@86)))
 :qid |stdinbpl.940:15|
 :skolemid |113|
 :pattern ( (PredicateMaskField (Thread__preFork_at_Thread diz@@149 p_1@@86)))
)))
(assert (forall ((diz@@150 T@U) (p_1@@87 Real) ) (!  (=> (= (type diz@@150) RefType) (= (PredicateMaskField (Thread__postJoin_at_Thread diz@@150 p_1@@87)) (|Thread__postJoin_at_Thread#sm| diz@@150 p_1@@87)))
 :qid |stdinbpl.989:15|
 :skolemid |119|
 :pattern ( (PredicateMaskField (Thread__postJoin_at_Thread diz@@150 p_1@@87)))
)))
(assert (forall ((diz@@151 T@U) (p_1@@88 Real) ) (!  (=> (= (type diz@@151) RefType) (= (PredicateMaskField (Worker__joinToken diz@@151 p_1@@88)) (|Worker__joinToken#sm| diz@@151 p_1@@88)))
 :qid |stdinbpl.1178:15|
 :skolemid |149|
 :pattern ( (PredicateMaskField (Worker__joinToken diz@@151 p_1@@88)))
)))
(assert (forall ((diz@@152 T@U) (p_1@@89 Real) ) (!  (=> (= (type diz@@152) RefType) (= (PredicateMaskField (Worker__joinToken_at_Worker diz@@152 p_1@@89)) (|Worker__joinToken_at_Worker#sm| diz@@152 p_1@@89)))
 :qid |stdinbpl.1213:15|
 :skolemid |155|
 :pattern ( (PredicateMaskField (Worker__joinToken_at_Worker diz@@152 p_1@@89)))
)))
(assert (forall ((diz@@153 T@U) (p_1@@90 Real) ) (!  (=> (= (type diz@@153) RefType) (= (PredicateMaskField (Worker__preFork diz@@153 p_1@@90)) (|Worker__preFork#sm| diz@@153 p_1@@90)))
 :qid |stdinbpl.1266:15|
 :skolemid |161|
 :pattern ( (PredicateMaskField (Worker__preFork diz@@153 p_1@@90)))
)))
(assert (forall ((diz@@154 T@U) (p_1@@91 Real) ) (!  (=> (= (type diz@@154) RefType) (= (PredicateMaskField (Worker__postJoin diz@@154 p_1@@91)) (|Worker__postJoin#sm| diz@@154 p_1@@91)))
 :qid |stdinbpl.1301:15|
 :skolemid |167|
 :pattern ( (PredicateMaskField (Worker__postJoin diz@@154 p_1@@91)))
)))
(assert (forall ((diz@@155 T@U) (p_1@@92 Real) ) (!  (=> (= (type diz@@155) RefType) (= (PredicateMaskField (Worker__joinToken_at_Thread diz@@155 p_1@@92)) (|Worker__joinToken_at_Thread#sm| diz@@155 p_1@@92)))
 :qid |stdinbpl.1336:15|
 :skolemid |173|
 :pattern ( (PredicateMaskField (Worker__joinToken_at_Thread diz@@155 p_1@@92)))
)))
(assert (forall ((diz@@156 T@U) (p_1@@93 Real) ) (!  (=> (= (type diz@@156) RefType) (= (PredicateMaskField (Worker__preFork_at_Thread diz@@156 p_1@@93)) (|Worker__preFork_at_Thread#sm| diz@@156 p_1@@93)))
 :qid |stdinbpl.1371:15|
 :skolemid |179|
 :pattern ( (PredicateMaskField (Worker__preFork_at_Thread diz@@156 p_1@@93)))
)))
(assert (forall ((diz@@157 T@U) (p_1@@94 Real) ) (!  (=> (= (type diz@@157) RefType) (= (PredicateMaskField (Worker__postJoin_at_Thread diz@@157 p_1@@94)) (|Worker__postJoin_at_Thread#sm| diz@@157 p_1@@94)))
 :qid |stdinbpl.1420:15|
 :skolemid |185|
 :pattern ( (PredicateMaskField (Worker__postJoin_at_Thread diz@@157 p_1@@94)))
)))
(assert (forall ((diz@@158 T@U) (p_1@@95 Real) ) (!  (=> (= (type diz@@158) RefType) (= (PredicateMaskField (Worker__preFork_at_Worker diz@@158 p_1@@95)) (|Worker__preFork_at_Worker#sm| diz@@158 p_1@@95)))
 :qid |stdinbpl.1469:15|
 :skolemid |191|
 :pattern ( (PredicateMaskField (Worker__preFork_at_Worker diz@@158 p_1@@95)))
)))
(assert (forall ((diz@@159 T@U) (p_1@@96 Real) ) (!  (=> (= (type diz@@159) RefType) (= (PredicateMaskField (Worker__postJoin_at_Worker diz@@159 p_1@@96)) (|Worker__postJoin_at_Worker#sm| diz@@159 p_1@@96)))
 :qid |stdinbpl.1568:15|
 :skolemid |197|
 :pattern ( (PredicateMaskField (Worker__postJoin_at_Worker diz@@159 p_1@@96)))
)))
(assert (forall ((diz@@160 T@U) ) (!  (=> (= (type diz@@160) RefType) (= (PredicateMaskField (History__inv diz@@160)) (|History__inv#sm| diz@@160)))
 :qid |stdinbpl.464:15|
 :skolemid |41|
 :pattern ( (PredicateMaskField (History__inv diz@@160)))
)))
(assert (forall ((diz@@161 T@U) ) (!  (=> (= (type diz@@161) RefType) (= (PredicateMaskField (SubjectLock__inv diz@@161)) (|SubjectLock__inv#sm| diz@@161)))
 :qid |stdinbpl.597:15|
 :skolemid |59|
 :pattern ( (PredicateMaskField (SubjectLock__inv diz@@161)))
)))
(assert (forall ((diz@@162 T@U) ) (!  (=> (= (type diz@@162) RefType) (= (PredicateMaskField (SubjectLock__valid diz@@162)) (|SubjectLock__valid#sm| diz@@162)))
 :qid |stdinbpl.660:15|
 :skolemid |65|
 :pattern ( (PredicateMaskField (SubjectLock__valid diz@@162)))
)))
(assert (forall ((diz@@163 T@U) ) (!  (=> (= (type diz@@163) RefType) (= (PredicateMaskField (Thread__is_a_Thread diz@@163)) (|Thread__is_a_Thread#sm| diz@@163)))
 :qid |stdinbpl.730:15|
 :skolemid |77|
 :pattern ( (PredicateMaskField (Thread__is_a_Thread diz@@163)))
)))
(assert (forall ((diz@@164 T@U) ) (!  (=> (= (type diz@@164) RefType) (= (PredicateMaskField (Thread__instance_of_Thread diz@@164)) (|Thread__instance_of_Thread#sm| diz@@164)))
 :qid |stdinbpl.765:15|
 :skolemid |83|
 :pattern ( (PredicateMaskField (Thread__instance_of_Thread diz@@164)))
)))
(assert (forall ((diz@@165 T@U) ) (!  (=> (= (type diz@@165) RefType) (= (PredicateMaskField (Worker__is_a_Worker diz@@165)) (|Worker__is_a_Worker#sm| diz@@165)))
 :qid |stdinbpl.1038:15|
 :skolemid |125|
 :pattern ( (PredicateMaskField (Worker__is_a_Worker diz@@165)))
)))
(assert (forall ((diz@@166 T@U) ) (!  (=> (= (type diz@@166) RefType) (= (PredicateMaskField (Worker__instance_of_Worker diz@@166)) (|Worker__instance_of_Worker#sm| diz@@166)))
 :qid |stdinbpl.1073:15|
 :skolemid |131|
 :pattern ( (PredicateMaskField (Worker__instance_of_Worker diz@@166)))
)))
(assert (forall ((diz@@167 T@U) ) (!  (=> (= (type diz@@167) RefType) (= (PredicateMaskField (Worker__is_a_Thread diz@@167)) (|Worker__is_a_Thread#sm| diz@@167)))
 :qid |stdinbpl.1108:15|
 :skolemid |137|
 :pattern ( (PredicateMaskField (Worker__is_a_Thread diz@@167)))
)))
(assert (forall ((diz@@168 T@U) ) (!  (=> (= (type diz@@168) RefType) (= (PredicateMaskField (Worker__instance_of_Thread diz@@168)) (|Worker__instance_of_Thread#sm| diz@@168)))
 :qid |stdinbpl.1143:15|
 :skolemid |143|
 :pattern ( (PredicateMaskField (Worker__instance_of_Thread diz@@168)))
)))
(assert (forall ((n_1@@1 Int) ) (! (= (p_single n_1@@1) (ite (> n_1@@1 0) (p_seq (p_single (- n_1@@1 1)) p_incr) p_empty))
 :qid |stdinbpl.284:15|
 :skolemid |31|
 :pattern ( (p_single n_1@@1))
)))
(assert (forall ((Heap@@43 T@U) (o@@0 T@U) (f_3 T@U) (v T@U) ) (! (let ((B@@8 (type v)))
(let ((A@@9 (FieldTypeInv0 (type f_3))))
 (=> (and (and (= (type Heap@@43) (MapType0Type RefType)) (= (type o@@0) RefType)) (= (type f_3) (FieldType A@@9 B@@8))) (succHeap Heap@@43 (MapType0Store Heap@@43 o@@0 f_3 v)))))
 :qid |stdinbpl.78:22|
 :skolemid |9|
 :pattern ( (MapType0Store Heap@@43 o@@0 f_3 v))
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
 :qid |stdinbpl.169:25|
 :skolemid |20|
 :pattern ( (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))
)))
(assert (forall ((m_1@@0 Int) (n_1@@2 Int) ) (! (= (p_seq (p_single m_1@@0) (p_single n_1@@2)) (p_single (+ m_1@@0 n_1@@2)))
 :qid |stdinbpl.290:15|
 :skolemid |32|
 :pattern ( (p_seq (p_single m_1@@0) (p_single n_1@@2)))
)))
(assert (forall ((p_1@@97 T@U) ) (!  (=> (= (type p_1@@97) ProcessDomainTypeType) (= (p_seq p_1@@97 p_empty) p_1@@97))
 :qid |stdinbpl.254:15|
 :skolemid |25|
 :pattern ( (p_seq p_1@@97 p_empty))
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
(declare-fun History__x_hist_value () T@U)
(declare-fun History__x_hist_mode () T@U)
(declare-fun History__x_hist_init () T@U)
(declare-fun History__x_hist_act () T@U)
(declare-fun SubjectLock__subject () T@U)
(declare-fun Worker__l () T@U)
(declare-fun Worker__s () T@U)
(declare-fun FieldType (T@T T@T) T@T)
(declare-fun FieldTypeInv0 (T@T) T@T)
(declare-fun FieldTypeInv1 (T@T) T@T)
(declare-fun NormalFieldType () T@T)
(declare-fun RefType () T@T)
(declare-fun p_single (Int) T@U)
(declare-fun p_seq (T@U T@U) T@U)
(declare-fun p_incr () T@U)
(declare-fun p_empty () T@U)
(declare-fun ProcessDomainTypeType () T@T)
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
(declare-fun History__hist_do_incr (T@U Real T@U) T@U)
(declare-fun IsPredicateField (T@U) Bool)
(declare-fun PredicateType_History__hist_do_incrType () T@T)
(declare-fun FrameTypeType () T@T)
(declare-fun History__hist_idle (T@U Real T@U) T@U)
(declare-fun PredicateType_History__hist_idleType () T@T)
(declare-fun SubjectLock__locked (T@U Real Int) T@U)
(declare-fun PredicateType_SubjectLock__lockedType () T@T)
(declare-fun |History__hist_do_incr#trigger| (T@U T@U) Bool)
(declare-fun |History__hist_do_incr#everUsed| (T@U) Bool)
(declare-fun |History__hist_idle#trigger| (T@U T@U) Bool)
(declare-fun |History__hist_idle#everUsed| (T@U) Bool)
(declare-fun |SubjectLock__locked#trigger| (T@U T@U) Bool)
(declare-fun |SubjectLock__locked#everUsed| (T@U) Bool)
(declare-fun getPredWandId (T@U) Int)
(declare-fun Thread__joinToken (T@U Real) T@U)
(declare-fun PredicateType_Thread__joinTokenType () T@T)
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
(declare-fun History__inv (T@U) T@U)
(declare-fun PredicateType_History__invType () T@T)
(declare-fun SubjectLock__inv (T@U) T@U)
(declare-fun PredicateType_SubjectLock__invType () T@T)
(declare-fun SubjectLock__valid (T@U) T@U)
(declare-fun PredicateType_SubjectLock__validType () T@T)
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
(declare-fun |History__free_get_x'| (T@U T@U) Int)
(declare-fun dummyFunction (T@U) Bool)
(declare-fun |History__free_get_x#triggerStateless| (T@U) Int)
(declare-fun |History__hist_get_x'| (T@U T@U) Int)
(declare-fun |History__hist_get_x#triggerStateless| (T@U) Int)
(declare-fun |History__inv#trigger| (T@U T@U) Bool)
(declare-fun |History__inv#everUsed| (T@U) Bool)
(declare-fun |SubjectLock__inv#trigger| (T@U T@U) Bool)
(declare-fun |SubjectLock__inv#everUsed| (T@U) Bool)
(declare-fun |SubjectLock__valid#trigger| (T@U T@U) Bool)
(declare-fun |SubjectLock__valid#everUsed| (T@U) Bool)
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
(declare-fun |History__hist_do_incr#sm| (T@U Real T@U) T@U)
(declare-fun |History__hist_idle#sm| (T@U Real T@U) T@U)
(declare-fun |SubjectLock__locked#sm| (T@U Real Int) T@U)
(declare-fun History__free_get_x (T@U T@U) Int)
(declare-fun History__hist_get_x (T@U T@U) Int)
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
(declare-fun p_dual (Int Int) T@U)
(declare-fun p_merge (T@U T@U) T@U)
(declare-fun |History__inv#sm| (T@U) T@U)
(declare-fun |SubjectLock__inv#sm| (T@U) T@U)
(declare-fun |SubjectLock__valid#sm| (T@U) T@U)
(declare-fun |Thread__is_a_Thread#sm| (T@U) T@U)
(declare-fun |Thread__instance_of_Thread#sm| (T@U) T@U)
(declare-fun |Worker__is_a_Worker#sm| (T@U) T@U)
(declare-fun |Worker__instance_of_Worker#sm| (T@U) T@U)
(declare-fun |Worker__is_a_Thread#sm| (T@U) T@U)
(declare-fun |Worker__instance_of_Thread#sm| (T@U) T@U)
(declare-fun dummyHeap () T@U)
(declare-fun ZeroMask () T@U)
(declare-fun InsidePredicate (T@U T@U T@U T@U) Bool)
(declare-fun AssumeFunctionsAbove () Int)
(declare-fun sumMask (T@U T@U T@U) Bool)
(declare-fun ConditionalFrame (Real T@U) T@U)
(declare-fun EmptyFrame () T@U)
(declare-fun NoPerm () Real)
(declare-fun instanceof (T@U T@U) Bool)
(declare-fun class_Object () T@U)
(declare-fun TYPEDomainTypeType () T@T)
(declare-fun FullPerm () Real)
(declare-fun |History__free_get_x#frame| (T@U T@U) Int)
(declare-fun FrameFragment (T@U) T@U)
(declare-fun |History__hist_get_x#frame| (T@U T@U) Int)
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
))) (= (Ctor NormalFieldType) 7)) (= (type $allocated) (FieldType NormalFieldType boolType))) (= (type History__x_hist_value) (FieldType NormalFieldType intType))) (= (type History__x_hist_mode) (FieldType NormalFieldType intType))) (= (type History__x_hist_init) (FieldType NormalFieldType intType))) (= (type History__x_hist_act) (FieldType NormalFieldType intType))) (= (Ctor RefType) 8)) (= (type SubjectLock__subject) (FieldType NormalFieldType RefType))) (= (type Worker__l) (FieldType NormalFieldType RefType))) (= (type Worker__s) (FieldType NormalFieldType RefType))))
(assert (distinct $allocated History__x_hist_value History__x_hist_mode History__x_hist_init History__x_hist_act SubjectLock__subject Worker__l Worker__s)
)
(assert  (and (and (and (and (= (Ctor ProcessDomainTypeType) 9) (forall ((arg0@@14 Int) ) (! (= (type (p_single arg0@@14)) ProcessDomainTypeType)
 :qid |funType:p_single|
 :pattern ( (p_single arg0@@14))
))) (forall ((arg0@@15 T@U) (arg1@@2 T@U) ) (! (= (type (p_seq arg0@@15 arg1@@2)) ProcessDomainTypeType)
 :qid |funType:p_seq|
 :pattern ( (p_seq arg0@@15 arg1@@2))
))) (= (type p_incr) ProcessDomainTypeType)) (= (type p_empty) ProcessDomainTypeType)))
(assert (forall ((n_1 Int) ) (! (= (ite (> n_1 0) (p_seq p_incr (p_single (- n_1 1))) p_empty) (p_single n_1))
 :qid |stdinbpl.272:15|
 :skolemid |29|
 :pattern ( (p_single n_1))
)))
(assert  (and (and (and (and (and (forall ((arg0@@16 T@T) ) (! (= (Ctor (MapType0Type arg0@@16)) 10)
 :qid |ctor:MapType0Type|
)) (forall ((arg0@@17 T@T) ) (! (= (MapType0TypeInv0 (MapType0Type arg0@@17)) arg0@@17)
 :qid |typeInv:MapType0TypeInv0|
 :pattern ( (MapType0Type arg0@@17))
))) (forall ((arg0@@18 T@U) (arg1@@3 T@U) (arg2 T@U) ) (! (let ((B (FieldTypeInv1 (type arg2))))
(= (type (MapType0Select arg0@@18 arg1@@3 arg2)) B))
 :qid |funType:MapType0Select|
 :pattern ( (MapType0Select arg0@@18 arg1@@3 arg2))
))) (forall ((arg0@@19 T@U) (arg1@@4 T@U) (arg2@@0 T@U) (arg3 T@U) ) (! (let ((aVar0 (type arg1@@4)))
(= (type (MapType0Store arg0@@19 arg1@@4 arg2@@0 arg3)) (MapType0Type aVar0)))
 :qid |funType:MapType0Store|
 :pattern ( (MapType0Store arg0@@19 arg1@@4 arg2@@0 arg3))
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
(assert  (and (and (and (and (and (and (forall ((arg0@@20 T@T) (arg1@@5 T@T) ) (! (= (Ctor (MapType1Type arg0@@20 arg1@@5)) 11)
 :qid |ctor:MapType1Type|
)) (forall ((arg0@@21 T@T) (arg1@@6 T@T) ) (! (= (MapType1TypeInv0 (MapType1Type arg0@@21 arg1@@6)) arg0@@21)
 :qid |typeInv:MapType1TypeInv0|
 :pattern ( (MapType1Type arg0@@21 arg1@@6))
))) (forall ((arg0@@22 T@T) (arg1@@7 T@T) ) (! (= (MapType1TypeInv1 (MapType1Type arg0@@22 arg1@@7)) arg1@@7)
 :qid |typeInv:MapType1TypeInv1|
 :pattern ( (MapType1Type arg0@@22 arg1@@7))
))) (forall ((arg0@@23 T@U) (arg1@@8 T@U) (arg2@@1 T@U) ) (! (let ((aVar1 (MapType1TypeInv1 (type arg0@@23))))
(= (type (MapType1Select arg0@@23 arg1@@8 arg2@@1)) aVar1))
 :qid |funType:MapType1Select|
 :pattern ( (MapType1Select arg0@@23 arg1@@8 arg2@@1))
))) (forall ((arg0@@24 T@U) (arg1@@9 T@U) (arg2@@2 T@U) (arg3@@0 T@U) ) (! (let ((aVar1@@0 (type arg3@@0)))
(let ((aVar0@@0 (type arg1@@9)))
(= (type (MapType1Store arg0@@24 arg1@@9 arg2@@2 arg3@@0)) (MapType1Type aVar0@@0 aVar1@@0))))
 :qid |funType:MapType1Store|
 :pattern ( (MapType1Store arg0@@24 arg1@@9 arg2@@2 arg3@@0))
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
(assert  (and (and (= (Ctor PredicateType_History__hist_do_incrType) 12) (= (Ctor FrameTypeType) 13)) (forall ((arg0@@25 T@U) (arg1@@10 Real) (arg2@@3 T@U) ) (! (= (type (History__hist_do_incr arg0@@25 arg1@@10 arg2@@3)) (FieldType PredicateType_History__hist_do_incrType FrameTypeType))
 :qid |funType:History__hist_do_incr|
 :pattern ( (History__hist_do_incr arg0@@25 arg1@@10 arg2@@3))
))))
(assert (forall ((diz T@U) (frac Real) (proc T@U) ) (!  (=> (and (= (type diz) RefType) (= (type proc) ProcessDomainTypeType)) (IsPredicateField (History__hist_do_incr diz frac proc)))
 :qid |stdinbpl.531:15|
 :skolemid |48|
 :pattern ( (History__hist_do_incr diz frac proc))
)))
(assert  (and (= (Ctor PredicateType_History__hist_idleType) 14) (forall ((arg0@@26 T@U) (arg1@@11 Real) (arg2@@4 T@U) ) (! (= (type (History__hist_idle arg0@@26 arg1@@11 arg2@@4)) (FieldType PredicateType_History__hist_idleType FrameTypeType))
 :qid |funType:History__hist_idle|
 :pattern ( (History__hist_idle arg0@@26 arg1@@11 arg2@@4))
))))
(assert (forall ((diz@@0 T@U) (frac@@0 Real) (proc@@0 T@U) ) (!  (=> (and (= (type diz@@0) RefType) (= (type proc@@0) ProcessDomainTypeType)) (IsPredicateField (History__hist_idle diz@@0 frac@@0 proc@@0)))
 :qid |stdinbpl.566:15|
 :skolemid |54|
 :pattern ( (History__hist_idle diz@@0 frac@@0 proc@@0))
)))
(assert  (and (= (Ctor PredicateType_SubjectLock__lockedType) 15) (forall ((arg0@@27 T@U) (arg1@@12 Real) (arg2@@5 Int) ) (! (= (type (SubjectLock__locked arg0@@27 arg1@@12 arg2@@5)) (FieldType PredicateType_SubjectLock__lockedType FrameTypeType))
 :qid |funType:SubjectLock__locked|
 :pattern ( (SubjectLock__locked arg0@@27 arg1@@12 arg2@@5))
))))
(assert (forall ((diz@@1 T@U) (p_1 Real) (count Int) ) (!  (=> (= (type diz@@1) RefType) (IsPredicateField (SubjectLock__locked diz@@1 p_1 count)))
 :qid |stdinbpl.699:15|
 :skolemid |72|
 :pattern ( (SubjectLock__locked diz@@1 p_1 count))
)))
(assert (forall ((Heap@@0 T@U) (diz@@2 T@U) (frac@@1 Real) (proc@@1 T@U) ) (!  (=> (and (and (= (type Heap@@0) (MapType0Type RefType)) (= (type diz@@2) RefType)) (= (type proc@@1) ProcessDomainTypeType)) (|History__hist_do_incr#everUsed| (History__hist_do_incr diz@@2 frac@@1 proc@@1)))
 :qid |stdinbpl.550:15|
 :skolemid |52|
 :pattern ( (|History__hist_do_incr#trigger| Heap@@0 (History__hist_do_incr diz@@2 frac@@1 proc@@1)))
)))
(assert (forall ((Heap@@1 T@U) (diz@@3 T@U) (frac@@2 Real) (proc@@2 T@U) ) (!  (=> (and (and (= (type Heap@@1) (MapType0Type RefType)) (= (type diz@@3) RefType)) (= (type proc@@2) ProcessDomainTypeType)) (|History__hist_idle#everUsed| (History__hist_idle diz@@3 frac@@2 proc@@2)))
 :qid |stdinbpl.585:15|
 :skolemid |58|
 :pattern ( (|History__hist_idle#trigger| Heap@@1 (History__hist_idle diz@@3 frac@@2 proc@@2)))
)))
(assert (forall ((Heap@@2 T@U) (diz@@4 T@U) (p_1@@0 Real) (count@@0 Int) ) (!  (=> (and (= (type Heap@@2) (MapType0Type RefType)) (= (type diz@@4) RefType)) (|SubjectLock__locked#everUsed| (SubjectLock__locked diz@@4 p_1@@0 count@@0)))
 :qid |stdinbpl.718:15|
 :skolemid |76|
 :pattern ( (|SubjectLock__locked#trigger| Heap@@2 (SubjectLock__locked diz@@4 p_1@@0 count@@0)))
)))
(assert (forall ((diz@@5 T@U) (frac@@3 Real) (proc@@3 T@U) ) (!  (=> (and (= (type diz@@5) RefType) (= (type proc@@3) ProcessDomainTypeType)) (= (getPredWandId (History__hist_do_incr diz@@5 frac@@3 proc@@3)) 1))
 :qid |stdinbpl.535:15|
 :skolemid |49|
 :pattern ( (History__hist_do_incr diz@@5 frac@@3 proc@@3))
)))
(assert (forall ((diz@@6 T@U) (frac@@4 Real) (proc@@4 T@U) ) (!  (=> (and (= (type diz@@6) RefType) (= (type proc@@4) ProcessDomainTypeType)) (= (getPredWandId (History__hist_idle diz@@6 frac@@4 proc@@4)) 2))
 :qid |stdinbpl.570:15|
 :skolemid |55|
 :pattern ( (History__hist_idle diz@@6 frac@@4 proc@@4))
)))
(assert (forall ((diz@@7 T@U) (p_1@@1 Real) (count@@1 Int) ) (!  (=> (= (type diz@@7) RefType) (= (getPredWandId (SubjectLock__locked diz@@7 p_1@@1 count@@1)) 5))
 :qid |stdinbpl.703:15|
 :skolemid |73|
 :pattern ( (SubjectLock__locked diz@@7 p_1@@1 count@@1))
)))
(assert  (and (= (Ctor PredicateType_Thread__joinTokenType) 16) (forall ((arg0@@28 T@U) (arg1@@13 Real) ) (! (= (type (Thread__joinToken arg0@@28 arg1@@13)) (FieldType PredicateType_Thread__joinTokenType FrameTypeType))
 :qid |funType:Thread__joinToken|
 :pattern ( (Thread__joinToken arg0@@28 arg1@@13))
))))
(assert (forall ((diz@@8 T@U) (p_1@@2 Real) ) (!  (=> (= (type diz@@8) RefType) (IsPredicateField (Thread__joinToken diz@@8 p_1@@2)))
 :qid |stdinbpl.804:15|
 :skolemid |90|
 :pattern ( (Thread__joinToken diz@@8 p_1@@2))
)))
(assert  (and (= (Ctor PredicateType_Thread__preForkType) 17) (forall ((arg0@@29 T@U) (arg1@@14 Real) ) (! (= (type (Thread__preFork arg0@@29 arg1@@14)) (FieldType PredicateType_Thread__preForkType FrameTypeType))
 :qid |funType:Thread__preFork|
 :pattern ( (Thread__preFork arg0@@29 arg1@@14))
))))
(assert (forall ((diz@@9 T@U) (p_1@@3 Real) ) (!  (=> (= (type diz@@9) RefType) (IsPredicateField (Thread__preFork diz@@9 p_1@@3)))
 :qid |stdinbpl.839:15|
 :skolemid |96|
 :pattern ( (Thread__preFork diz@@9 p_1@@3))
)))
(assert  (and (= (Ctor PredicateType_Thread__postJoinType) 18) (forall ((arg0@@30 T@U) (arg1@@15 Real) ) (! (= (type (Thread__postJoin arg0@@30 arg1@@15)) (FieldType PredicateType_Thread__postJoinType FrameTypeType))
 :qid |funType:Thread__postJoin|
 :pattern ( (Thread__postJoin arg0@@30 arg1@@15))
))))
(assert (forall ((diz@@10 T@U) (p_1@@4 Real) ) (!  (=> (= (type diz@@10) RefType) (IsPredicateField (Thread__postJoin diz@@10 p_1@@4)))
 :qid |stdinbpl.874:15|
 :skolemid |102|
 :pattern ( (Thread__postJoin diz@@10 p_1@@4))
)))
(assert  (and (= (Ctor PredicateType_Thread__joinToken_at_ThreadType) 19) (forall ((arg0@@31 T@U) (arg1@@16 Real) ) (! (= (type (Thread__joinToken_at_Thread arg0@@31 arg1@@16)) (FieldType PredicateType_Thread__joinToken_at_ThreadType FrameTypeType))
 :qid |funType:Thread__joinToken_at_Thread|
 :pattern ( (Thread__joinToken_at_Thread arg0@@31 arg1@@16))
))))
(assert (forall ((diz@@11 T@U) (p_1@@5 Real) ) (!  (=> (= (type diz@@11) RefType) (IsPredicateField (Thread__joinToken_at_Thread diz@@11 p_1@@5)))
 :qid |stdinbpl.909:15|
 :skolemid |108|
 :pattern ( (Thread__joinToken_at_Thread diz@@11 p_1@@5))
)))
(assert  (and (= (Ctor PredicateType_Thread__preFork_at_ThreadType) 20) (forall ((arg0@@32 T@U) (arg1@@17 Real) ) (! (= (type (Thread__preFork_at_Thread arg0@@32 arg1@@17)) (FieldType PredicateType_Thread__preFork_at_ThreadType FrameTypeType))
 :qid |funType:Thread__preFork_at_Thread|
 :pattern ( (Thread__preFork_at_Thread arg0@@32 arg1@@17))
))))
(assert (forall ((diz@@12 T@U) (p_1@@6 Real) ) (!  (=> (= (type diz@@12) RefType) (IsPredicateField (Thread__preFork_at_Thread diz@@12 p_1@@6)))
 :qid |stdinbpl.944:15|
 :skolemid |114|
 :pattern ( (Thread__preFork_at_Thread diz@@12 p_1@@6))
)))
(assert  (and (= (Ctor PredicateType_Thread__postJoin_at_ThreadType) 21) (forall ((arg0@@33 T@U) (arg1@@18 Real) ) (! (= (type (Thread__postJoin_at_Thread arg0@@33 arg1@@18)) (FieldType PredicateType_Thread__postJoin_at_ThreadType FrameTypeType))
 :qid |funType:Thread__postJoin_at_Thread|
 :pattern ( (Thread__postJoin_at_Thread arg0@@33 arg1@@18))
))))
(assert (forall ((diz@@13 T@U) (p_1@@7 Real) ) (!  (=> (= (type diz@@13) RefType) (IsPredicateField (Thread__postJoin_at_Thread diz@@13 p_1@@7)))
 :qid |stdinbpl.993:15|
 :skolemid |120|
 :pattern ( (Thread__postJoin_at_Thread diz@@13 p_1@@7))
)))
(assert  (and (= (Ctor PredicateType_Worker__joinTokenType) 22) (forall ((arg0@@34 T@U) (arg1@@19 Real) ) (! (= (type (Worker__joinToken arg0@@34 arg1@@19)) (FieldType PredicateType_Worker__joinTokenType FrameTypeType))
 :qid |funType:Worker__joinToken|
 :pattern ( (Worker__joinToken arg0@@34 arg1@@19))
))))
(assert (forall ((diz@@14 T@U) (p_1@@8 Real) ) (!  (=> (= (type diz@@14) RefType) (IsPredicateField (Worker__joinToken diz@@14 p_1@@8)))
 :qid |stdinbpl.1182:15|
 :skolemid |150|
 :pattern ( (Worker__joinToken diz@@14 p_1@@8))
)))
(assert  (and (= (Ctor PredicateType_Worker__joinToken_at_WorkerType) 23) (forall ((arg0@@35 T@U) (arg1@@20 Real) ) (! (= (type (Worker__joinToken_at_Worker arg0@@35 arg1@@20)) (FieldType PredicateType_Worker__joinToken_at_WorkerType FrameTypeType))
 :qid |funType:Worker__joinToken_at_Worker|
 :pattern ( (Worker__joinToken_at_Worker arg0@@35 arg1@@20))
))))
(assert (forall ((diz@@15 T@U) (p_1@@9 Real) ) (!  (=> (= (type diz@@15) RefType) (IsPredicateField (Worker__joinToken_at_Worker diz@@15 p_1@@9)))
 :qid |stdinbpl.1217:15|
 :skolemid |156|
 :pattern ( (Worker__joinToken_at_Worker diz@@15 p_1@@9))
)))
(assert  (and (= (Ctor PredicateType_Worker__preForkType) 24) (forall ((arg0@@36 T@U) (arg1@@21 Real) ) (! (= (type (Worker__preFork arg0@@36 arg1@@21)) (FieldType PredicateType_Worker__preForkType FrameTypeType))
 :qid |funType:Worker__preFork|
 :pattern ( (Worker__preFork arg0@@36 arg1@@21))
))))
(assert (forall ((diz@@16 T@U) (p_1@@10 Real) ) (!  (=> (= (type diz@@16) RefType) (IsPredicateField (Worker__preFork diz@@16 p_1@@10)))
 :qid |stdinbpl.1270:15|
 :skolemid |162|
 :pattern ( (Worker__preFork diz@@16 p_1@@10))
)))
(assert  (and (= (Ctor PredicateType_Worker__postJoinType) 25) (forall ((arg0@@37 T@U) (arg1@@22 Real) ) (! (= (type (Worker__postJoin arg0@@37 arg1@@22)) (FieldType PredicateType_Worker__postJoinType FrameTypeType))
 :qid |funType:Worker__postJoin|
 :pattern ( (Worker__postJoin arg0@@37 arg1@@22))
))))
(assert (forall ((diz@@17 T@U) (p_1@@11 Real) ) (!  (=> (= (type diz@@17) RefType) (IsPredicateField (Worker__postJoin diz@@17 p_1@@11)))
 :qid |stdinbpl.1305:15|
 :skolemid |168|
 :pattern ( (Worker__postJoin diz@@17 p_1@@11))
)))
(assert  (and (= (Ctor PredicateType_Worker__joinToken_at_ThreadType) 26) (forall ((arg0@@38 T@U) (arg1@@23 Real) ) (! (= (type (Worker__joinToken_at_Thread arg0@@38 arg1@@23)) (FieldType PredicateType_Worker__joinToken_at_ThreadType FrameTypeType))
 :qid |funType:Worker__joinToken_at_Thread|
 :pattern ( (Worker__joinToken_at_Thread arg0@@38 arg1@@23))
))))
(assert (forall ((diz@@18 T@U) (p_1@@12 Real) ) (!  (=> (= (type diz@@18) RefType) (IsPredicateField (Worker__joinToken_at_Thread diz@@18 p_1@@12)))
 :qid |stdinbpl.1340:15|
 :skolemid |174|
 :pattern ( (Worker__joinToken_at_Thread diz@@18 p_1@@12))
)))
(assert  (and (= (Ctor PredicateType_Worker__preFork_at_ThreadType) 27) (forall ((arg0@@39 T@U) (arg1@@24 Real) ) (! (= (type (Worker__preFork_at_Thread arg0@@39 arg1@@24)) (FieldType PredicateType_Worker__preFork_at_ThreadType FrameTypeType))
 :qid |funType:Worker__preFork_at_Thread|
 :pattern ( (Worker__preFork_at_Thread arg0@@39 arg1@@24))
))))
(assert (forall ((diz@@19 T@U) (p_1@@13 Real) ) (!  (=> (= (type diz@@19) RefType) (IsPredicateField (Worker__preFork_at_Thread diz@@19 p_1@@13)))
 :qid |stdinbpl.1375:15|
 :skolemid |180|
 :pattern ( (Worker__preFork_at_Thread diz@@19 p_1@@13))
)))
(assert  (and (= (Ctor PredicateType_Worker__postJoin_at_ThreadType) 28) (forall ((arg0@@40 T@U) (arg1@@25 Real) ) (! (= (type (Worker__postJoin_at_Thread arg0@@40 arg1@@25)) (FieldType PredicateType_Worker__postJoin_at_ThreadType FrameTypeType))
 :qid |funType:Worker__postJoin_at_Thread|
 :pattern ( (Worker__postJoin_at_Thread arg0@@40 arg1@@25))
))))
(assert (forall ((diz@@20 T@U) (p_1@@14 Real) ) (!  (=> (= (type diz@@20) RefType) (IsPredicateField (Worker__postJoin_at_Thread diz@@20 p_1@@14)))
 :qid |stdinbpl.1424:15|
 :skolemid |186|
 :pattern ( (Worker__postJoin_at_Thread diz@@20 p_1@@14))
)))
(assert  (and (= (Ctor PredicateType_Worker__preFork_at_WorkerType) 29) (forall ((arg0@@41 T@U) (arg1@@26 Real) ) (! (= (type (Worker__preFork_at_Worker arg0@@41 arg1@@26)) (FieldType PredicateType_Worker__preFork_at_WorkerType FrameTypeType))
 :qid |funType:Worker__preFork_at_Worker|
 :pattern ( (Worker__preFork_at_Worker arg0@@41 arg1@@26))
))))
(assert (forall ((diz@@21 T@U) (p_1@@15 Real) ) (!  (=> (= (type diz@@21) RefType) (IsPredicateField (Worker__preFork_at_Worker diz@@21 p_1@@15)))
 :qid |stdinbpl.1473:15|
 :skolemid |192|
 :pattern ( (Worker__preFork_at_Worker diz@@21 p_1@@15))
)))
(assert  (and (= (Ctor PredicateType_Worker__postJoin_at_WorkerType) 30) (forall ((arg0@@42 T@U) (arg1@@27 Real) ) (! (= (type (Worker__postJoin_at_Worker arg0@@42 arg1@@27)) (FieldType PredicateType_Worker__postJoin_at_WorkerType FrameTypeType))
 :qid |funType:Worker__postJoin_at_Worker|
 :pattern ( (Worker__postJoin_at_Worker arg0@@42 arg1@@27))
))))
(assert (forall ((diz@@22 T@U) (p_1@@16 Real) ) (!  (=> (= (type diz@@22) RefType) (IsPredicateField (Worker__postJoin_at_Worker diz@@22 p_1@@16)))
 :qid |stdinbpl.1572:15|
 :skolemid |198|
 :pattern ( (Worker__postJoin_at_Worker diz@@22 p_1@@16))
)))
(assert (forall ((Heap@@3 T@U) (diz@@23 T@U) (p_1@@17 Real) ) (!  (=> (and (= (type Heap@@3) (MapType0Type RefType)) (= (type diz@@23) RefType)) (|Thread__joinToken#everUsed| (Thread__joinToken diz@@23 p_1@@17)))
 :qid |stdinbpl.823:15|
 :skolemid |94|
 :pattern ( (|Thread__joinToken#trigger| Heap@@3 (Thread__joinToken diz@@23 p_1@@17)))
)))
(assert (forall ((Heap@@4 T@U) (diz@@24 T@U) (p_1@@18 Real) ) (!  (=> (and (= (type Heap@@4) (MapType0Type RefType)) (= (type diz@@24) RefType)) (|Thread__preFork#everUsed| (Thread__preFork diz@@24 p_1@@18)))
 :qid |stdinbpl.858:15|
 :skolemid |100|
 :pattern ( (|Thread__preFork#trigger| Heap@@4 (Thread__preFork diz@@24 p_1@@18)))
)))
(assert (forall ((Heap@@5 T@U) (diz@@25 T@U) (p_1@@19 Real) ) (!  (=> (and (= (type Heap@@5) (MapType0Type RefType)) (= (type diz@@25) RefType)) (|Thread__postJoin#everUsed| (Thread__postJoin diz@@25 p_1@@19)))
 :qid |stdinbpl.893:15|
 :skolemid |106|
 :pattern ( (|Thread__postJoin#trigger| Heap@@5 (Thread__postJoin diz@@25 p_1@@19)))
)))
(assert (forall ((Heap@@6 T@U) (diz@@26 T@U) (p_1@@20 Real) ) (!  (=> (and (= (type Heap@@6) (MapType0Type RefType)) (= (type diz@@26) RefType)) (|Thread__joinToken_at_Thread#everUsed| (Thread__joinToken_at_Thread diz@@26 p_1@@20)))
 :qid |stdinbpl.928:15|
 :skolemid |112|
 :pattern ( (|Thread__joinToken_at_Thread#trigger| Heap@@6 (Thread__joinToken_at_Thread diz@@26 p_1@@20)))
)))
(assert (forall ((Heap@@7 T@U) (diz@@27 T@U) (p_1@@21 Real) ) (!  (=> (and (= (type Heap@@7) (MapType0Type RefType)) (= (type diz@@27) RefType)) (|Thread__preFork_at_Thread#everUsed| (Thread__preFork_at_Thread diz@@27 p_1@@21)))
 :qid |stdinbpl.963:15|
 :skolemid |118|
 :pattern ( (|Thread__preFork_at_Thread#trigger| Heap@@7 (Thread__preFork_at_Thread diz@@27 p_1@@21)))
)))
(assert (forall ((Heap@@8 T@U) (diz@@28 T@U) (p_1@@22 Real) ) (!  (=> (and (= (type Heap@@8) (MapType0Type RefType)) (= (type diz@@28) RefType)) (|Thread__postJoin_at_Thread#everUsed| (Thread__postJoin_at_Thread diz@@28 p_1@@22)))
 :qid |stdinbpl.1012:15|
 :skolemid |124|
 :pattern ( (|Thread__postJoin_at_Thread#trigger| Heap@@8 (Thread__postJoin_at_Thread diz@@28 p_1@@22)))
)))
(assert (forall ((Heap@@9 T@U) (diz@@29 T@U) (p_1@@23 Real) ) (!  (=> (and (= (type Heap@@9) (MapType0Type RefType)) (= (type diz@@29) RefType)) (|Worker__joinToken#everUsed| (Worker__joinToken diz@@29 p_1@@23)))
 :qid |stdinbpl.1201:15|
 :skolemid |154|
 :pattern ( (|Worker__joinToken#trigger| Heap@@9 (Worker__joinToken diz@@29 p_1@@23)))
)))
(assert (forall ((Heap@@10 T@U) (diz@@30 T@U) (p_1@@24 Real) ) (!  (=> (and (= (type Heap@@10) (MapType0Type RefType)) (= (type diz@@30) RefType)) (|Worker__joinToken_at_Worker#everUsed| (Worker__joinToken_at_Worker diz@@30 p_1@@24)))
 :qid |stdinbpl.1236:15|
 :skolemid |160|
 :pattern ( (|Worker__joinToken_at_Worker#trigger| Heap@@10 (Worker__joinToken_at_Worker diz@@30 p_1@@24)))
)))
(assert (forall ((Heap@@11 T@U) (diz@@31 T@U) (p_1@@25 Real) ) (!  (=> (and (= (type Heap@@11) (MapType0Type RefType)) (= (type diz@@31) RefType)) (|Worker__preFork#everUsed| (Worker__preFork diz@@31 p_1@@25)))
 :qid |stdinbpl.1289:15|
 :skolemid |166|
 :pattern ( (|Worker__preFork#trigger| Heap@@11 (Worker__preFork diz@@31 p_1@@25)))
)))
(assert (forall ((Heap@@12 T@U) (diz@@32 T@U) (p_1@@26 Real) ) (!  (=> (and (= (type Heap@@12) (MapType0Type RefType)) (= (type diz@@32) RefType)) (|Worker__postJoin#everUsed| (Worker__postJoin diz@@32 p_1@@26)))
 :qid |stdinbpl.1324:15|
 :skolemid |172|
 :pattern ( (|Worker__postJoin#trigger| Heap@@12 (Worker__postJoin diz@@32 p_1@@26)))
)))
(assert (forall ((Heap@@13 T@U) (diz@@33 T@U) (p_1@@27 Real) ) (!  (=> (and (= (type Heap@@13) (MapType0Type RefType)) (= (type diz@@33) RefType)) (|Worker__joinToken_at_Thread#everUsed| (Worker__joinToken_at_Thread diz@@33 p_1@@27)))
 :qid |stdinbpl.1359:15|
 :skolemid |178|
 :pattern ( (|Worker__joinToken_at_Thread#trigger| Heap@@13 (Worker__joinToken_at_Thread diz@@33 p_1@@27)))
)))
(assert (forall ((Heap@@14 T@U) (diz@@34 T@U) (p_1@@28 Real) ) (!  (=> (and (= (type Heap@@14) (MapType0Type RefType)) (= (type diz@@34) RefType)) (|Worker__preFork_at_Thread#everUsed| (Worker__preFork_at_Thread diz@@34 p_1@@28)))
 :qid |stdinbpl.1394:15|
 :skolemid |184|
 :pattern ( (|Worker__preFork_at_Thread#trigger| Heap@@14 (Worker__preFork_at_Thread diz@@34 p_1@@28)))
)))
(assert (forall ((Heap@@15 T@U) (diz@@35 T@U) (p_1@@29 Real) ) (!  (=> (and (= (type Heap@@15) (MapType0Type RefType)) (= (type diz@@35) RefType)) (|Worker__postJoin_at_Thread#everUsed| (Worker__postJoin_at_Thread diz@@35 p_1@@29)))
 :qid |stdinbpl.1443:15|
 :skolemid |190|
 :pattern ( (|Worker__postJoin_at_Thread#trigger| Heap@@15 (Worker__postJoin_at_Thread diz@@35 p_1@@29)))
)))
(assert (forall ((Heap@@16 T@U) (diz@@36 T@U) (p_1@@30 Real) ) (!  (=> (and (= (type Heap@@16) (MapType0Type RefType)) (= (type diz@@36) RefType)) (|Worker__preFork_at_Worker#everUsed| (Worker__preFork_at_Worker diz@@36 p_1@@30)))
 :qid |stdinbpl.1492:15|
 :skolemid |196|
 :pattern ( (|Worker__preFork_at_Worker#trigger| Heap@@16 (Worker__preFork_at_Worker diz@@36 p_1@@30)))
)))
(assert (forall ((Heap@@17 T@U) (diz@@37 T@U) (p_1@@31 Real) ) (!  (=> (and (= (type Heap@@17) (MapType0Type RefType)) (= (type diz@@37) RefType)) (|Worker__postJoin_at_Worker#everUsed| (Worker__postJoin_at_Worker diz@@37 p_1@@31)))
 :qid |stdinbpl.1591:15|
 :skolemid |202|
 :pattern ( (|Worker__postJoin_at_Worker#trigger| Heap@@17 (Worker__postJoin_at_Worker diz@@37 p_1@@31)))
)))
(assert  (and (= (type null) RefType) (forall ((arg0@@43 T@U) ) (! (let ((A (FieldTypeInv0 (type arg0@@43))))
(= (type (PredicateMaskField arg0@@43)) (FieldType A (MapType1Type RefType boolType))))
 :qid |funType:PredicateMaskField|
 :pattern ( (PredicateMaskField arg0@@43))
))))
(assert (forall ((Heap@@18 T@U) (ExhaleHeap T@U) (Mask@@0 T@U) (pm_f T@U) ) (! (let ((C (FieldTypeInv0 (type pm_f))))
 (=> (and (and (and (and (and (= (type Heap@@18) (MapType0Type RefType)) (= (type ExhaleHeap) (MapType0Type RefType))) (= (type Mask@@0) (MapType1Type RefType realType))) (= (type pm_f) (FieldType C FrameTypeType))) (IdenticalOnKnownLocations Heap@@18 ExhaleHeap Mask@@0)) (and (HasDirectPerm Mask@@0 null pm_f) (IsPredicateField pm_f))) (= (MapType0Select Heap@@18 null (PredicateMaskField pm_f)) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))))
 :qid |stdinbpl.47:19|
 :skolemid |2|
 :pattern ( (IdenticalOnKnownLocations Heap@@18 ExhaleHeap Mask@@0) (IsPredicateField pm_f) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))
)))
(assert (forall ((arg0@@44 T@U) ) (! (let ((A@@0 (FieldTypeInv0 (type arg0@@44))))
(= (type (WandMaskField arg0@@44)) (FieldType A@@0 (MapType1Type RefType boolType))))
 :qid |funType:WandMaskField|
 :pattern ( (WandMaskField arg0@@44))
)))
(assert (forall ((Heap@@19 T@U) (ExhaleHeap@@0 T@U) (Mask@@1 T@U) (pm_f@@0 T@U) ) (! (let ((C@@0 (FieldTypeInv0 (type pm_f@@0))))
 (=> (and (and (and (and (and (= (type Heap@@19) (MapType0Type RefType)) (= (type ExhaleHeap@@0) (MapType0Type RefType))) (= (type Mask@@1) (MapType1Type RefType realType))) (= (type pm_f@@0) (FieldType C@@0 FrameTypeType))) (IdenticalOnKnownLocations Heap@@19 ExhaleHeap@@0 Mask@@1)) (and (HasDirectPerm Mask@@1 null pm_f@@0) (IsWandField pm_f@@0))) (= (MapType0Select Heap@@19 null (WandMaskField pm_f@@0)) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))))
 :qid |stdinbpl.60:19|
 :skolemid |5|
 :pattern ( (IdenticalOnKnownLocations Heap@@19 ExhaleHeap@@0 Mask@@1) (IsWandField pm_f@@0) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))
)))
(assert  (and (= (Ctor PredicateType_History__invType) 31) (forall ((arg0@@45 T@U) ) (! (= (type (History__inv arg0@@45)) (FieldType PredicateType_History__invType FrameTypeType))
 :qid |funType:History__inv|
 :pattern ( (History__inv arg0@@45))
))))
(assert (forall ((diz@@38 T@U) ) (!  (=> (= (type diz@@38) RefType) (IsPredicateField (History__inv diz@@38)))
 :qid |stdinbpl.468:15|
 :skolemid |42|
 :pattern ( (History__inv diz@@38))
)))
(assert  (and (= (Ctor PredicateType_SubjectLock__invType) 32) (forall ((arg0@@46 T@U) ) (! (= (type (SubjectLock__inv arg0@@46)) (FieldType PredicateType_SubjectLock__invType FrameTypeType))
 :qid |funType:SubjectLock__inv|
 :pattern ( (SubjectLock__inv arg0@@46))
))))
(assert (forall ((diz@@39 T@U) ) (!  (=> (= (type diz@@39) RefType) (IsPredicateField (SubjectLock__inv diz@@39)))
 :qid |stdinbpl.601:15|
 :skolemid |60|
 :pattern ( (SubjectLock__inv diz@@39))
)))
(assert  (and (= (Ctor PredicateType_SubjectLock__validType) 33) (forall ((arg0@@47 T@U) ) (! (= (type (SubjectLock__valid arg0@@47)) (FieldType PredicateType_SubjectLock__validType FrameTypeType))
 :qid |funType:SubjectLock__valid|
 :pattern ( (SubjectLock__valid arg0@@47))
))))
(assert (forall ((diz@@40 T@U) ) (!  (=> (= (type diz@@40) RefType) (IsPredicateField (SubjectLock__valid diz@@40)))
 :qid |stdinbpl.664:15|
 :skolemid |66|
 :pattern ( (SubjectLock__valid diz@@40))
)))
(assert  (and (= (Ctor PredicateType_Thread__is_a_ThreadType) 34) (forall ((arg0@@48 T@U) ) (! (= (type (Thread__is_a_Thread arg0@@48)) (FieldType PredicateType_Thread__is_a_ThreadType FrameTypeType))
 :qid |funType:Thread__is_a_Thread|
 :pattern ( (Thread__is_a_Thread arg0@@48))
))))
(assert (forall ((diz@@41 T@U) ) (!  (=> (= (type diz@@41) RefType) (IsPredicateField (Thread__is_a_Thread diz@@41)))
 :qid |stdinbpl.734:15|
 :skolemid |78|
 :pattern ( (Thread__is_a_Thread diz@@41))
)))
(assert  (and (= (Ctor PredicateType_Thread__instance_of_ThreadType) 35) (forall ((arg0@@49 T@U) ) (! (= (type (Thread__instance_of_Thread arg0@@49)) (FieldType PredicateType_Thread__instance_of_ThreadType FrameTypeType))
 :qid |funType:Thread__instance_of_Thread|
 :pattern ( (Thread__instance_of_Thread arg0@@49))
))))
(assert (forall ((diz@@42 T@U) ) (!  (=> (= (type diz@@42) RefType) (IsPredicateField (Thread__instance_of_Thread diz@@42)))
 :qid |stdinbpl.769:15|
 :skolemid |84|
 :pattern ( (Thread__instance_of_Thread diz@@42))
)))
(assert  (and (= (Ctor PredicateType_Worker__is_a_WorkerType) 36) (forall ((arg0@@50 T@U) ) (! (= (type (Worker__is_a_Worker arg0@@50)) (FieldType PredicateType_Worker__is_a_WorkerType FrameTypeType))
 :qid |funType:Worker__is_a_Worker|
 :pattern ( (Worker__is_a_Worker arg0@@50))
))))
(assert (forall ((diz@@43 T@U) ) (!  (=> (= (type diz@@43) RefType) (IsPredicateField (Worker__is_a_Worker diz@@43)))
 :qid |stdinbpl.1042:15|
 :skolemid |126|
 :pattern ( (Worker__is_a_Worker diz@@43))
)))
(assert  (and (= (Ctor PredicateType_Worker__instance_of_WorkerType) 37) (forall ((arg0@@51 T@U) ) (! (= (type (Worker__instance_of_Worker arg0@@51)) (FieldType PredicateType_Worker__instance_of_WorkerType FrameTypeType))
 :qid |funType:Worker__instance_of_Worker|
 :pattern ( (Worker__instance_of_Worker arg0@@51))
))))
(assert (forall ((diz@@44 T@U) ) (!  (=> (= (type diz@@44) RefType) (IsPredicateField (Worker__instance_of_Worker diz@@44)))
 :qid |stdinbpl.1077:15|
 :skolemid |132|
 :pattern ( (Worker__instance_of_Worker diz@@44))
)))
(assert  (and (= (Ctor PredicateType_Worker__is_a_ThreadType) 38) (forall ((arg0@@52 T@U) ) (! (= (type (Worker__is_a_Thread arg0@@52)) (FieldType PredicateType_Worker__is_a_ThreadType FrameTypeType))
 :qid |funType:Worker__is_a_Thread|
 :pattern ( (Worker__is_a_Thread arg0@@52))
))))
(assert (forall ((diz@@45 T@U) ) (!  (=> (= (type diz@@45) RefType) (IsPredicateField (Worker__is_a_Thread diz@@45)))
 :qid |stdinbpl.1112:15|
 :skolemid |138|
 :pattern ( (Worker__is_a_Thread diz@@45))
)))
(assert  (and (= (Ctor PredicateType_Worker__instance_of_ThreadType) 39) (forall ((arg0@@53 T@U) ) (! (= (type (Worker__instance_of_Thread arg0@@53)) (FieldType PredicateType_Worker__instance_of_ThreadType FrameTypeType))
 :qid |funType:Worker__instance_of_Thread|
 :pattern ( (Worker__instance_of_Thread arg0@@53))
))))
(assert (forall ((diz@@46 T@U) ) (!  (=> (= (type diz@@46) RefType) (IsPredicateField (Worker__instance_of_Thread diz@@46)))
 :qid |stdinbpl.1147:15|
 :skolemid |144|
 :pattern ( (Worker__instance_of_Thread diz@@46))
)))
(assert (forall ((Heap@@20 T@U) (diz@@47 T@U) ) (!  (=> (and (= (type Heap@@20) (MapType0Type RefType)) (= (type diz@@47) RefType)) (dummyFunction (int_2_U (|History__free_get_x#triggerStateless| diz@@47))))
 :qid |stdinbpl.332:15|
 :skolemid |34|
 :pattern ( (|History__free_get_x'| Heap@@20 diz@@47))
)))
(assert (forall ((Heap@@21 T@U) (diz@@48 T@U) ) (!  (=> (and (= (type Heap@@21) (MapType0Type RefType)) (= (type diz@@48) RefType)) (dummyFunction (int_2_U (|History__hist_get_x#triggerStateless| diz@@48))))
 :qid |stdinbpl.400:15|
 :skolemid |38|
 :pattern ( (|History__hist_get_x'| Heap@@21 diz@@48))
)))
(assert (forall ((Heap@@22 T@U) (diz@@49 T@U) ) (!  (=> (and (= (type Heap@@22) (MapType0Type RefType)) (= (type diz@@49) RefType)) (|History__inv#everUsed| (History__inv diz@@49)))
 :qid |stdinbpl.487:15|
 :skolemid |46|
 :pattern ( (|History__inv#trigger| Heap@@22 (History__inv diz@@49)))
)))
(assert (forall ((Heap@@23 T@U) (diz@@50 T@U) ) (!  (=> (and (= (type Heap@@23) (MapType0Type RefType)) (= (type diz@@50) RefType)) (|SubjectLock__inv#everUsed| (SubjectLock__inv diz@@50)))
 :qid |stdinbpl.620:15|
 :skolemid |64|
 :pattern ( (|SubjectLock__inv#trigger| Heap@@23 (SubjectLock__inv diz@@50)))
)))
(assert (forall ((Heap@@24 T@U) (diz@@51 T@U) ) (!  (=> (and (= (type Heap@@24) (MapType0Type RefType)) (= (type diz@@51) RefType)) (|SubjectLock__valid#everUsed| (SubjectLock__valid diz@@51)))
 :qid |stdinbpl.683:15|
 :skolemid |70|
 :pattern ( (|SubjectLock__valid#trigger| Heap@@24 (SubjectLock__valid diz@@51)))
)))
(assert (forall ((Heap@@25 T@U) (diz@@52 T@U) ) (!  (=> (and (= (type Heap@@25) (MapType0Type RefType)) (= (type diz@@52) RefType)) (|Thread__is_a_Thread#everUsed| (Thread__is_a_Thread diz@@52)))
 :qid |stdinbpl.753:15|
 :skolemid |82|
 :pattern ( (|Thread__is_a_Thread#trigger| Heap@@25 (Thread__is_a_Thread diz@@52)))
)))
(assert (forall ((Heap@@26 T@U) (diz@@53 T@U) ) (!  (=> (and (= (type Heap@@26) (MapType0Type RefType)) (= (type diz@@53) RefType)) (|Thread__instance_of_Thread#everUsed| (Thread__instance_of_Thread diz@@53)))
 :qid |stdinbpl.788:15|
 :skolemid |88|
 :pattern ( (|Thread__instance_of_Thread#trigger| Heap@@26 (Thread__instance_of_Thread diz@@53)))
)))
(assert (forall ((Heap@@27 T@U) (diz@@54 T@U) ) (!  (=> (and (= (type Heap@@27) (MapType0Type RefType)) (= (type diz@@54) RefType)) (|Worker__is_a_Worker#everUsed| (Worker__is_a_Worker diz@@54)))
 :qid |stdinbpl.1061:15|
 :skolemid |130|
 :pattern ( (|Worker__is_a_Worker#trigger| Heap@@27 (Worker__is_a_Worker diz@@54)))
)))
(assert (forall ((Heap@@28 T@U) (diz@@55 T@U) ) (!  (=> (and (= (type Heap@@28) (MapType0Type RefType)) (= (type diz@@55) RefType)) (|Worker__instance_of_Worker#everUsed| (Worker__instance_of_Worker diz@@55)))
 :qid |stdinbpl.1096:15|
 :skolemid |136|
 :pattern ( (|Worker__instance_of_Worker#trigger| Heap@@28 (Worker__instance_of_Worker diz@@55)))
)))
(assert (forall ((Heap@@29 T@U) (diz@@56 T@U) ) (!  (=> (and (= (type Heap@@29) (MapType0Type RefType)) (= (type diz@@56) RefType)) (|Worker__is_a_Thread#everUsed| (Worker__is_a_Thread diz@@56)))
 :qid |stdinbpl.1131:15|
 :skolemid |142|
 :pattern ( (|Worker__is_a_Thread#trigger| Heap@@29 (Worker__is_a_Thread diz@@56)))
)))
(assert (forall ((Heap@@30 T@U) (diz@@57 T@U) ) (!  (=> (and (= (type Heap@@30) (MapType0Type RefType)) (= (type diz@@57) RefType)) (|Worker__instance_of_Thread#everUsed| (Worker__instance_of_Thread diz@@57)))
 :qid |stdinbpl.1166:15|
 :skolemid |148|
 :pattern ( (|Worker__instance_of_Thread#trigger| Heap@@30 (Worker__instance_of_Thread diz@@57)))
)))
(assert (forall ((arg0@@54 T@U) (arg1@@28 Real) (arg2@@6 T@U) ) (! (= (type (|History__hist_do_incr#sm| arg0@@54 arg1@@28 arg2@@6)) (FieldType PredicateType_History__hist_do_incrType (MapType1Type RefType boolType)))
 :qid |funType:History__hist_do_incr#sm|
 :pattern ( (|History__hist_do_incr#sm| arg0@@54 arg1@@28 arg2@@6))
)))
(assert (forall ((diz@@58 T@U) (frac@@5 Real) (proc@@5 T@U) ) (!  (=> (and (= (type diz@@58) RefType) (= (type proc@@5) ProcessDomainTypeType)) (= (PredicateMaskField (History__hist_do_incr diz@@58 frac@@5 proc@@5)) (|History__hist_do_incr#sm| diz@@58 frac@@5 proc@@5)))
 :qid |stdinbpl.527:15|
 :skolemid |47|
 :pattern ( (PredicateMaskField (History__hist_do_incr diz@@58 frac@@5 proc@@5)))
)))
(assert (forall ((arg0@@55 T@U) (arg1@@29 Real) (arg2@@7 T@U) ) (! (= (type (|History__hist_idle#sm| arg0@@55 arg1@@29 arg2@@7)) (FieldType PredicateType_History__hist_idleType (MapType1Type RefType boolType)))
 :qid |funType:History__hist_idle#sm|
 :pattern ( (|History__hist_idle#sm| arg0@@55 arg1@@29 arg2@@7))
)))
(assert (forall ((diz@@59 T@U) (frac@@6 Real) (proc@@6 T@U) ) (!  (=> (and (= (type diz@@59) RefType) (= (type proc@@6) ProcessDomainTypeType)) (= (PredicateMaskField (History__hist_idle diz@@59 frac@@6 proc@@6)) (|History__hist_idle#sm| diz@@59 frac@@6 proc@@6)))
 :qid |stdinbpl.562:15|
 :skolemid |53|
 :pattern ( (PredicateMaskField (History__hist_idle diz@@59 frac@@6 proc@@6)))
)))
(assert (forall ((arg0@@56 T@U) (arg1@@30 Real) (arg2@@8 Int) ) (! (= (type (|SubjectLock__locked#sm| arg0@@56 arg1@@30 arg2@@8)) (FieldType PredicateType_SubjectLock__lockedType (MapType1Type RefType boolType)))
 :qid |funType:SubjectLock__locked#sm|
 :pattern ( (|SubjectLock__locked#sm| arg0@@56 arg1@@30 arg2@@8))
)))
(assert (forall ((diz@@60 T@U) (p_1@@32 Real) (count@@2 Int) ) (!  (=> (= (type diz@@60) RefType) (= (PredicateMaskField (SubjectLock__locked diz@@60 p_1@@32 count@@2)) (|SubjectLock__locked#sm| diz@@60 p_1@@32 count@@2)))
 :qid |stdinbpl.695:15|
 :skolemid |71|
 :pattern ( (PredicateMaskField (SubjectLock__locked diz@@60 p_1@@32 count@@2)))
)))
(assert (forall ((Heap@@31 T@U) (ExhaleHeap@@1 T@U) (Mask@@2 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@31) (MapType0Type RefType)) (= (type ExhaleHeap@@1) (MapType0Type RefType))) (= (type Mask@@2) (MapType1Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@31 ExhaleHeap@@1 Mask@@2)) (U_2_bool (MapType0Select Heap@@31 o_1 $allocated))) (U_2_bool (MapType0Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.73:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@31 ExhaleHeap@@1 Mask@@2) (MapType0Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert (forall ((Heap@@32 T@U) (diz@@61 T@U) ) (!  (=> (and (= (type Heap@@32) (MapType0Type RefType)) (= (type diz@@61) RefType)) (and (= (History__free_get_x Heap@@32 diz@@61) (|History__free_get_x'| Heap@@32 diz@@61)) (dummyFunction (int_2_U (|History__free_get_x#triggerStateless| diz@@61)))))
 :qid |stdinbpl.328:15|
 :skolemid |33|
 :pattern ( (History__free_get_x Heap@@32 diz@@61))
)))
(assert (forall ((Heap@@33 T@U) (diz@@62 T@U) ) (!  (=> (and (= (type Heap@@33) (MapType0Type RefType)) (= (type diz@@62) RefType)) (and (= (History__hist_get_x Heap@@33 diz@@62) (|History__hist_get_x'| Heap@@33 diz@@62)) (dummyFunction (int_2_U (|History__hist_get_x#triggerStateless| diz@@62)))))
 :qid |stdinbpl.396:15|
 :skolemid |37|
 :pattern ( (History__hist_get_x Heap@@33 diz@@62))
)))
(assert (forall ((diz@@63 T@U) (frac@@7 Real) (proc@@7 T@U) (diz2 T@U) (frac2 Real) (proc2 T@U) ) (!  (=> (and (and (and (and (= (type diz@@63) RefType) (= (type proc@@7) ProcessDomainTypeType)) (= (type diz2) RefType)) (= (type proc2) ProcessDomainTypeType)) (= (History__hist_do_incr diz@@63 frac@@7 proc@@7) (History__hist_do_incr diz2 frac2 proc2))) (and (= diz@@63 diz2) (and (= frac@@7 frac2) (= proc@@7 proc2))))
 :qid |stdinbpl.541:15|
 :skolemid |50|
 :pattern ( (History__hist_do_incr diz@@63 frac@@7 proc@@7) (History__hist_do_incr diz2 frac2 proc2))
)))
(assert (forall ((diz@@64 T@U) (frac@@8 Real) (proc@@8 T@U) (diz2@@0 T@U) (frac2@@0 Real) (proc2@@0 T@U) ) (!  (=> (and (and (and (and (= (type diz@@64) RefType) (= (type proc@@8) ProcessDomainTypeType)) (= (type diz2@@0) RefType)) (= (type proc2@@0) ProcessDomainTypeType)) (= (|History__hist_do_incr#sm| diz@@64 frac@@8 proc@@8) (|History__hist_do_incr#sm| diz2@@0 frac2@@0 proc2@@0))) (and (= diz@@64 diz2@@0) (and (= frac@@8 frac2@@0) (= proc@@8 proc2@@0))))
 :qid |stdinbpl.545:15|
 :skolemid |51|
 :pattern ( (|History__hist_do_incr#sm| diz@@64 frac@@8 proc@@8) (|History__hist_do_incr#sm| diz2@@0 frac2@@0 proc2@@0))
)))
(assert (forall ((diz@@65 T@U) (frac@@9 Real) (proc@@9 T@U) (diz2@@1 T@U) (frac2@@1 Real) (proc2@@1 T@U) ) (!  (=> (and (and (and (and (= (type diz@@65) RefType) (= (type proc@@9) ProcessDomainTypeType)) (= (type diz2@@1) RefType)) (= (type proc2@@1) ProcessDomainTypeType)) (= (History__hist_idle diz@@65 frac@@9 proc@@9) (History__hist_idle diz2@@1 frac2@@1 proc2@@1))) (and (= diz@@65 diz2@@1) (and (= frac@@9 frac2@@1) (= proc@@9 proc2@@1))))
 :qid |stdinbpl.576:15|
 :skolemid |56|
 :pattern ( (History__hist_idle diz@@65 frac@@9 proc@@9) (History__hist_idle diz2@@1 frac2@@1 proc2@@1))
)))
(assert (forall ((diz@@66 T@U) (frac@@10 Real) (proc@@10 T@U) (diz2@@2 T@U) (frac2@@2 Real) (proc2@@2 T@U) ) (!  (=> (and (and (and (and (= (type diz@@66) RefType) (= (type proc@@10) ProcessDomainTypeType)) (= (type diz2@@2) RefType)) (= (type proc2@@2) ProcessDomainTypeType)) (= (|History__hist_idle#sm| diz@@66 frac@@10 proc@@10) (|History__hist_idle#sm| diz2@@2 frac2@@2 proc2@@2))) (and (= diz@@66 diz2@@2) (and (= frac@@10 frac2@@2) (= proc@@10 proc2@@2))))
 :qid |stdinbpl.580:15|
 :skolemid |57|
 :pattern ( (|History__hist_idle#sm| diz@@66 frac@@10 proc@@10) (|History__hist_idle#sm| diz2@@2 frac2@@2 proc2@@2))
)))
(assert (forall ((diz@@67 T@U) (p_1@@33 Real) (count@@3 Int) (diz2@@3 T@U) (p2_1 Real) (count2 Int) ) (!  (=> (and (and (= (type diz@@67) RefType) (= (type diz2@@3) RefType)) (= (SubjectLock__locked diz@@67 p_1@@33 count@@3) (SubjectLock__locked diz2@@3 p2_1 count2))) (and (= diz@@67 diz2@@3) (and (= p_1@@33 p2_1) (= count@@3 count2))))
 :qid |stdinbpl.709:15|
 :skolemid |74|
 :pattern ( (SubjectLock__locked diz@@67 p_1@@33 count@@3) (SubjectLock__locked diz2@@3 p2_1 count2))
)))
(assert (forall ((diz@@68 T@U) (p_1@@34 Real) (count@@4 Int) (diz2@@4 T@U) (p2_1@@0 Real) (count2@@0 Int) ) (!  (=> (and (and (= (type diz@@68) RefType) (= (type diz2@@4) RefType)) (= (|SubjectLock__locked#sm| diz@@68 p_1@@34 count@@4) (|SubjectLock__locked#sm| diz2@@4 p2_1@@0 count2@@0))) (and (= diz@@68 diz2@@4) (and (= p_1@@34 p2_1@@0) (= count@@4 count2@@0))))
 :qid |stdinbpl.713:15|
 :skolemid |75|
 :pattern ( (|SubjectLock__locked#sm| diz@@68 p_1@@34 count@@4) (|SubjectLock__locked#sm| diz2@@4 p2_1@@0 count2@@0))
)))
(assert (forall ((diz@@69 T@U) (p_1@@35 Real) (diz2@@5 T@U) (p2_1@@1 Real) ) (!  (=> (and (and (= (type diz@@69) RefType) (= (type diz2@@5) RefType)) (= (Thread__joinToken diz@@69 p_1@@35) (Thread__joinToken diz2@@5 p2_1@@1))) (and (= diz@@69 diz2@@5) (= p_1@@35 p2_1@@1)))
 :qid |stdinbpl.814:15|
 :skolemid |92|
 :pattern ( (Thread__joinToken diz@@69 p_1@@35) (Thread__joinToken diz2@@5 p2_1@@1))
)))
(assert (forall ((arg0@@57 T@U) (arg1@@31 Real) ) (! (= (type (|Thread__joinToken#sm| arg0@@57 arg1@@31)) (FieldType PredicateType_Thread__joinTokenType (MapType1Type RefType boolType)))
 :qid |funType:Thread__joinToken#sm|
 :pattern ( (|Thread__joinToken#sm| arg0@@57 arg1@@31))
)))
(assert (forall ((diz@@70 T@U) (p_1@@36 Real) (diz2@@6 T@U) (p2_1@@2 Real) ) (!  (=> (and (and (= (type diz@@70) RefType) (= (type diz2@@6) RefType)) (= (|Thread__joinToken#sm| diz@@70 p_1@@36) (|Thread__joinToken#sm| diz2@@6 p2_1@@2))) (and (= diz@@70 diz2@@6) (= p_1@@36 p2_1@@2)))
 :qid |stdinbpl.818:15|
 :skolemid |93|
 :pattern ( (|Thread__joinToken#sm| diz@@70 p_1@@36) (|Thread__joinToken#sm| diz2@@6 p2_1@@2))
)))
(assert (forall ((diz@@71 T@U) (p_1@@37 Real) (diz2@@7 T@U) (p2_1@@3 Real) ) (!  (=> (and (and (= (type diz@@71) RefType) (= (type diz2@@7) RefType)) (= (Thread__preFork diz@@71 p_1@@37) (Thread__preFork diz2@@7 p2_1@@3))) (and (= diz@@71 diz2@@7) (= p_1@@37 p2_1@@3)))
 :qid |stdinbpl.849:15|
 :skolemid |98|
 :pattern ( (Thread__preFork diz@@71 p_1@@37) (Thread__preFork diz2@@7 p2_1@@3))
)))
(assert (forall ((arg0@@58 T@U) (arg1@@32 Real) ) (! (= (type (|Thread__preFork#sm| arg0@@58 arg1@@32)) (FieldType PredicateType_Thread__preForkType (MapType1Type RefType boolType)))
 :qid |funType:Thread__preFork#sm|
 :pattern ( (|Thread__preFork#sm| arg0@@58 arg1@@32))
)))
(assert (forall ((diz@@72 T@U) (p_1@@38 Real) (diz2@@8 T@U) (p2_1@@4 Real) ) (!  (=> (and (and (= (type diz@@72) RefType) (= (type diz2@@8) RefType)) (= (|Thread__preFork#sm| diz@@72 p_1@@38) (|Thread__preFork#sm| diz2@@8 p2_1@@4))) (and (= diz@@72 diz2@@8) (= p_1@@38 p2_1@@4)))
 :qid |stdinbpl.853:15|
 :skolemid |99|
 :pattern ( (|Thread__preFork#sm| diz@@72 p_1@@38) (|Thread__preFork#sm| diz2@@8 p2_1@@4))
)))
(assert (forall ((diz@@73 T@U) (p_1@@39 Real) (diz2@@9 T@U) (p2_1@@5 Real) ) (!  (=> (and (and (= (type diz@@73) RefType) (= (type diz2@@9) RefType)) (= (Thread__postJoin diz@@73 p_1@@39) (Thread__postJoin diz2@@9 p2_1@@5))) (and (= diz@@73 diz2@@9) (= p_1@@39 p2_1@@5)))
 :qid |stdinbpl.884:15|
 :skolemid |104|
 :pattern ( (Thread__postJoin diz@@73 p_1@@39) (Thread__postJoin diz2@@9 p2_1@@5))
)))
(assert (forall ((arg0@@59 T@U) (arg1@@33 Real) ) (! (= (type (|Thread__postJoin#sm| arg0@@59 arg1@@33)) (FieldType PredicateType_Thread__postJoinType (MapType1Type RefType boolType)))
 :qid |funType:Thread__postJoin#sm|
 :pattern ( (|Thread__postJoin#sm| arg0@@59 arg1@@33))
)))
(assert (forall ((diz@@74 T@U) (p_1@@40 Real) (diz2@@10 T@U) (p2_1@@6 Real) ) (!  (=> (and (and (= (type diz@@74) RefType) (= (type diz2@@10) RefType)) (= (|Thread__postJoin#sm| diz@@74 p_1@@40) (|Thread__postJoin#sm| diz2@@10 p2_1@@6))) (and (= diz@@74 diz2@@10) (= p_1@@40 p2_1@@6)))
 :qid |stdinbpl.888:15|
 :skolemid |105|
 :pattern ( (|Thread__postJoin#sm| diz@@74 p_1@@40) (|Thread__postJoin#sm| diz2@@10 p2_1@@6))
)))
(assert (forall ((diz@@75 T@U) (p_1@@41 Real) (diz2@@11 T@U) (p2_1@@7 Real) ) (!  (=> (and (and (= (type diz@@75) RefType) (= (type diz2@@11) RefType)) (= (Thread__joinToken_at_Thread diz@@75 p_1@@41) (Thread__joinToken_at_Thread diz2@@11 p2_1@@7))) (and (= diz@@75 diz2@@11) (= p_1@@41 p2_1@@7)))
 :qid |stdinbpl.919:15|
 :skolemid |110|
 :pattern ( (Thread__joinToken_at_Thread diz@@75 p_1@@41) (Thread__joinToken_at_Thread diz2@@11 p2_1@@7))
)))
(assert (forall ((arg0@@60 T@U) (arg1@@34 Real) ) (! (= (type (|Thread__joinToken_at_Thread#sm| arg0@@60 arg1@@34)) (FieldType PredicateType_Thread__joinToken_at_ThreadType (MapType1Type RefType boolType)))
 :qid |funType:Thread__joinToken_at_Thread#sm|
 :pattern ( (|Thread__joinToken_at_Thread#sm| arg0@@60 arg1@@34))
)))
(assert (forall ((diz@@76 T@U) (p_1@@42 Real) (diz2@@12 T@U) (p2_1@@8 Real) ) (!  (=> (and (and (= (type diz@@76) RefType) (= (type diz2@@12) RefType)) (= (|Thread__joinToken_at_Thread#sm| diz@@76 p_1@@42) (|Thread__joinToken_at_Thread#sm| diz2@@12 p2_1@@8))) (and (= diz@@76 diz2@@12) (= p_1@@42 p2_1@@8)))
 :qid |stdinbpl.923:15|
 :skolemid |111|
 :pattern ( (|Thread__joinToken_at_Thread#sm| diz@@76 p_1@@42) (|Thread__joinToken_at_Thread#sm| diz2@@12 p2_1@@8))
)))
(assert (forall ((diz@@77 T@U) (p_1@@43 Real) (diz2@@13 T@U) (p2_1@@9 Real) ) (!  (=> (and (and (= (type diz@@77) RefType) (= (type diz2@@13) RefType)) (= (Thread__preFork_at_Thread diz@@77 p_1@@43) (Thread__preFork_at_Thread diz2@@13 p2_1@@9))) (and (= diz@@77 diz2@@13) (= p_1@@43 p2_1@@9)))
 :qid |stdinbpl.954:15|
 :skolemid |116|
 :pattern ( (Thread__preFork_at_Thread diz@@77 p_1@@43) (Thread__preFork_at_Thread diz2@@13 p2_1@@9))
)))
(assert (forall ((arg0@@61 T@U) (arg1@@35 Real) ) (! (= (type (|Thread__preFork_at_Thread#sm| arg0@@61 arg1@@35)) (FieldType PredicateType_Thread__preFork_at_ThreadType (MapType1Type RefType boolType)))
 :qid |funType:Thread__preFork_at_Thread#sm|
 :pattern ( (|Thread__preFork_at_Thread#sm| arg0@@61 arg1@@35))
)))
(assert (forall ((diz@@78 T@U) (p_1@@44 Real) (diz2@@14 T@U) (p2_1@@10 Real) ) (!  (=> (and (and (= (type diz@@78) RefType) (= (type diz2@@14) RefType)) (= (|Thread__preFork_at_Thread#sm| diz@@78 p_1@@44) (|Thread__preFork_at_Thread#sm| diz2@@14 p2_1@@10))) (and (= diz@@78 diz2@@14) (= p_1@@44 p2_1@@10)))
 :qid |stdinbpl.958:15|
 :skolemid |117|
 :pattern ( (|Thread__preFork_at_Thread#sm| diz@@78 p_1@@44) (|Thread__preFork_at_Thread#sm| diz2@@14 p2_1@@10))
)))
(assert (forall ((diz@@79 T@U) (p_1@@45 Real) (diz2@@15 T@U) (p2_1@@11 Real) ) (!  (=> (and (and (= (type diz@@79) RefType) (= (type diz2@@15) RefType)) (= (Thread__postJoin_at_Thread diz@@79 p_1@@45) (Thread__postJoin_at_Thread diz2@@15 p2_1@@11))) (and (= diz@@79 diz2@@15) (= p_1@@45 p2_1@@11)))
 :qid |stdinbpl.1003:15|
 :skolemid |122|
 :pattern ( (Thread__postJoin_at_Thread diz@@79 p_1@@45) (Thread__postJoin_at_Thread diz2@@15 p2_1@@11))
)))
(assert (forall ((arg0@@62 T@U) (arg1@@36 Real) ) (! (= (type (|Thread__postJoin_at_Thread#sm| arg0@@62 arg1@@36)) (FieldType PredicateType_Thread__postJoin_at_ThreadType (MapType1Type RefType boolType)))
 :qid |funType:Thread__postJoin_at_Thread#sm|
 :pattern ( (|Thread__postJoin_at_Thread#sm| arg0@@62 arg1@@36))
)))
(assert (forall ((diz@@80 T@U) (p_1@@46 Real) (diz2@@16 T@U) (p2_1@@12 Real) ) (!  (=> (and (and (= (type diz@@80) RefType) (= (type diz2@@16) RefType)) (= (|Thread__postJoin_at_Thread#sm| diz@@80 p_1@@46) (|Thread__postJoin_at_Thread#sm| diz2@@16 p2_1@@12))) (and (= diz@@80 diz2@@16) (= p_1@@46 p2_1@@12)))
 :qid |stdinbpl.1007:15|
 :skolemid |123|
 :pattern ( (|Thread__postJoin_at_Thread#sm| diz@@80 p_1@@46) (|Thread__postJoin_at_Thread#sm| diz2@@16 p2_1@@12))
)))
(assert (forall ((diz@@81 T@U) (p_1@@47 Real) (diz2@@17 T@U) (p2_1@@13 Real) ) (!  (=> (and (and (= (type diz@@81) RefType) (= (type diz2@@17) RefType)) (= (Worker__joinToken diz@@81 p_1@@47) (Worker__joinToken diz2@@17 p2_1@@13))) (and (= diz@@81 diz2@@17) (= p_1@@47 p2_1@@13)))
 :qid |stdinbpl.1192:15|
 :skolemid |152|
 :pattern ( (Worker__joinToken diz@@81 p_1@@47) (Worker__joinToken diz2@@17 p2_1@@13))
)))
(assert (forall ((arg0@@63 T@U) (arg1@@37 Real) ) (! (= (type (|Worker__joinToken#sm| arg0@@63 arg1@@37)) (FieldType PredicateType_Worker__joinTokenType (MapType1Type RefType boolType)))
 :qid |funType:Worker__joinToken#sm|
 :pattern ( (|Worker__joinToken#sm| arg0@@63 arg1@@37))
)))
(assert (forall ((diz@@82 T@U) (p_1@@48 Real) (diz2@@18 T@U) (p2_1@@14 Real) ) (!  (=> (and (and (= (type diz@@82) RefType) (= (type diz2@@18) RefType)) (= (|Worker__joinToken#sm| diz@@82 p_1@@48) (|Worker__joinToken#sm| diz2@@18 p2_1@@14))) (and (= diz@@82 diz2@@18) (= p_1@@48 p2_1@@14)))
 :qid |stdinbpl.1196:15|
 :skolemid |153|
 :pattern ( (|Worker__joinToken#sm| diz@@82 p_1@@48) (|Worker__joinToken#sm| diz2@@18 p2_1@@14))
)))
(assert (forall ((diz@@83 T@U) (p_1@@49 Real) (diz2@@19 T@U) (p2_1@@15 Real) ) (!  (=> (and (and (= (type diz@@83) RefType) (= (type diz2@@19) RefType)) (= (Worker__joinToken_at_Worker diz@@83 p_1@@49) (Worker__joinToken_at_Worker diz2@@19 p2_1@@15))) (and (= diz@@83 diz2@@19) (= p_1@@49 p2_1@@15)))
 :qid |stdinbpl.1227:15|
 :skolemid |158|
 :pattern ( (Worker__joinToken_at_Worker diz@@83 p_1@@49) (Worker__joinToken_at_Worker diz2@@19 p2_1@@15))
)))
(assert (forall ((arg0@@64 T@U) (arg1@@38 Real) ) (! (= (type (|Worker__joinToken_at_Worker#sm| arg0@@64 arg1@@38)) (FieldType PredicateType_Worker__joinToken_at_WorkerType (MapType1Type RefType boolType)))
 :qid |funType:Worker__joinToken_at_Worker#sm|
 :pattern ( (|Worker__joinToken_at_Worker#sm| arg0@@64 arg1@@38))
)))
(assert (forall ((diz@@84 T@U) (p_1@@50 Real) (diz2@@20 T@U) (p2_1@@16 Real) ) (!  (=> (and (and (= (type diz@@84) RefType) (= (type diz2@@20) RefType)) (= (|Worker__joinToken_at_Worker#sm| diz@@84 p_1@@50) (|Worker__joinToken_at_Worker#sm| diz2@@20 p2_1@@16))) (and (= diz@@84 diz2@@20) (= p_1@@50 p2_1@@16)))
 :qid |stdinbpl.1231:15|
 :skolemid |159|
 :pattern ( (|Worker__joinToken_at_Worker#sm| diz@@84 p_1@@50) (|Worker__joinToken_at_Worker#sm| diz2@@20 p2_1@@16))
)))
(assert (forall ((diz@@85 T@U) (p_1@@51 Real) (diz2@@21 T@U) (p2_1@@17 Real) ) (!  (=> (and (and (= (type diz@@85) RefType) (= (type diz2@@21) RefType)) (= (Worker__preFork diz@@85 p_1@@51) (Worker__preFork diz2@@21 p2_1@@17))) (and (= diz@@85 diz2@@21) (= p_1@@51 p2_1@@17)))
 :qid |stdinbpl.1280:15|
 :skolemid |164|
 :pattern ( (Worker__preFork diz@@85 p_1@@51) (Worker__preFork diz2@@21 p2_1@@17))
)))
(assert (forall ((arg0@@65 T@U) (arg1@@39 Real) ) (! (= (type (|Worker__preFork#sm| arg0@@65 arg1@@39)) (FieldType PredicateType_Worker__preForkType (MapType1Type RefType boolType)))
 :qid |funType:Worker__preFork#sm|
 :pattern ( (|Worker__preFork#sm| arg0@@65 arg1@@39))
)))
(assert (forall ((diz@@86 T@U) (p_1@@52 Real) (diz2@@22 T@U) (p2_1@@18 Real) ) (!  (=> (and (and (= (type diz@@86) RefType) (= (type diz2@@22) RefType)) (= (|Worker__preFork#sm| diz@@86 p_1@@52) (|Worker__preFork#sm| diz2@@22 p2_1@@18))) (and (= diz@@86 diz2@@22) (= p_1@@52 p2_1@@18)))
 :qid |stdinbpl.1284:15|
 :skolemid |165|
 :pattern ( (|Worker__preFork#sm| diz@@86 p_1@@52) (|Worker__preFork#sm| diz2@@22 p2_1@@18))
)))
(assert (forall ((diz@@87 T@U) (p_1@@53 Real) (diz2@@23 T@U) (p2_1@@19 Real) ) (!  (=> (and (and (= (type diz@@87) RefType) (= (type diz2@@23) RefType)) (= (Worker__postJoin diz@@87 p_1@@53) (Worker__postJoin diz2@@23 p2_1@@19))) (and (= diz@@87 diz2@@23) (= p_1@@53 p2_1@@19)))
 :qid |stdinbpl.1315:15|
 :skolemid |170|
 :pattern ( (Worker__postJoin diz@@87 p_1@@53) (Worker__postJoin diz2@@23 p2_1@@19))
)))
(assert (forall ((arg0@@66 T@U) (arg1@@40 Real) ) (! (= (type (|Worker__postJoin#sm| arg0@@66 arg1@@40)) (FieldType PredicateType_Worker__postJoinType (MapType1Type RefType boolType)))
 :qid |funType:Worker__postJoin#sm|
 :pattern ( (|Worker__postJoin#sm| arg0@@66 arg1@@40))
)))
(assert (forall ((diz@@88 T@U) (p_1@@54 Real) (diz2@@24 T@U) (p2_1@@20 Real) ) (!  (=> (and (and (= (type diz@@88) RefType) (= (type diz2@@24) RefType)) (= (|Worker__postJoin#sm| diz@@88 p_1@@54) (|Worker__postJoin#sm| diz2@@24 p2_1@@20))) (and (= diz@@88 diz2@@24) (= p_1@@54 p2_1@@20)))
 :qid |stdinbpl.1319:15|
 :skolemid |171|
 :pattern ( (|Worker__postJoin#sm| diz@@88 p_1@@54) (|Worker__postJoin#sm| diz2@@24 p2_1@@20))
)))
(assert (forall ((diz@@89 T@U) (p_1@@55 Real) (diz2@@25 T@U) (p2_1@@21 Real) ) (!  (=> (and (and (= (type diz@@89) RefType) (= (type diz2@@25) RefType)) (= (Worker__joinToken_at_Thread diz@@89 p_1@@55) (Worker__joinToken_at_Thread diz2@@25 p2_1@@21))) (and (= diz@@89 diz2@@25) (= p_1@@55 p2_1@@21)))
 :qid |stdinbpl.1350:15|
 :skolemid |176|
 :pattern ( (Worker__joinToken_at_Thread diz@@89 p_1@@55) (Worker__joinToken_at_Thread diz2@@25 p2_1@@21))
)))
(assert (forall ((arg0@@67 T@U) (arg1@@41 Real) ) (! (= (type (|Worker__joinToken_at_Thread#sm| arg0@@67 arg1@@41)) (FieldType PredicateType_Worker__joinToken_at_ThreadType (MapType1Type RefType boolType)))
 :qid |funType:Worker__joinToken_at_Thread#sm|
 :pattern ( (|Worker__joinToken_at_Thread#sm| arg0@@67 arg1@@41))
)))
(assert (forall ((diz@@90 T@U) (p_1@@56 Real) (diz2@@26 T@U) (p2_1@@22 Real) ) (!  (=> (and (and (= (type diz@@90) RefType) (= (type diz2@@26) RefType)) (= (|Worker__joinToken_at_Thread#sm| diz@@90 p_1@@56) (|Worker__joinToken_at_Thread#sm| diz2@@26 p2_1@@22))) (and (= diz@@90 diz2@@26) (= p_1@@56 p2_1@@22)))
 :qid |stdinbpl.1354:15|
 :skolemid |177|
 :pattern ( (|Worker__joinToken_at_Thread#sm| diz@@90 p_1@@56) (|Worker__joinToken_at_Thread#sm| diz2@@26 p2_1@@22))
)))
(assert (forall ((diz@@91 T@U) (p_1@@57 Real) (diz2@@27 T@U) (p2_1@@23 Real) ) (!  (=> (and (and (= (type diz@@91) RefType) (= (type diz2@@27) RefType)) (= (Worker__preFork_at_Thread diz@@91 p_1@@57) (Worker__preFork_at_Thread diz2@@27 p2_1@@23))) (and (= diz@@91 diz2@@27) (= p_1@@57 p2_1@@23)))
 :qid |stdinbpl.1385:15|
 :skolemid |182|
 :pattern ( (Worker__preFork_at_Thread diz@@91 p_1@@57) (Worker__preFork_at_Thread diz2@@27 p2_1@@23))
)))
(assert (forall ((arg0@@68 T@U) (arg1@@42 Real) ) (! (= (type (|Worker__preFork_at_Thread#sm| arg0@@68 arg1@@42)) (FieldType PredicateType_Worker__preFork_at_ThreadType (MapType1Type RefType boolType)))
 :qid |funType:Worker__preFork_at_Thread#sm|
 :pattern ( (|Worker__preFork_at_Thread#sm| arg0@@68 arg1@@42))
)))
(assert (forall ((diz@@92 T@U) (p_1@@58 Real) (diz2@@28 T@U) (p2_1@@24 Real) ) (!  (=> (and (and (= (type diz@@92) RefType) (= (type diz2@@28) RefType)) (= (|Worker__preFork_at_Thread#sm| diz@@92 p_1@@58) (|Worker__preFork_at_Thread#sm| diz2@@28 p2_1@@24))) (and (= diz@@92 diz2@@28) (= p_1@@58 p2_1@@24)))
 :qid |stdinbpl.1389:15|
 :skolemid |183|
 :pattern ( (|Worker__preFork_at_Thread#sm| diz@@92 p_1@@58) (|Worker__preFork_at_Thread#sm| diz2@@28 p2_1@@24))
)))
(assert (forall ((diz@@93 T@U) (p_1@@59 Real) (diz2@@29 T@U) (p2_1@@25 Real) ) (!  (=> (and (and (= (type diz@@93) RefType) (= (type diz2@@29) RefType)) (= (Worker__postJoin_at_Thread diz@@93 p_1@@59) (Worker__postJoin_at_Thread diz2@@29 p2_1@@25))) (and (= diz@@93 diz2@@29) (= p_1@@59 p2_1@@25)))
 :qid |stdinbpl.1434:15|
 :skolemid |188|
 :pattern ( (Worker__postJoin_at_Thread diz@@93 p_1@@59) (Worker__postJoin_at_Thread diz2@@29 p2_1@@25))
)))
(assert (forall ((arg0@@69 T@U) (arg1@@43 Real) ) (! (= (type (|Worker__postJoin_at_Thread#sm| arg0@@69 arg1@@43)) (FieldType PredicateType_Worker__postJoin_at_ThreadType (MapType1Type RefType boolType)))
 :qid |funType:Worker__postJoin_at_Thread#sm|
 :pattern ( (|Worker__postJoin_at_Thread#sm| arg0@@69 arg1@@43))
)))
(assert (forall ((diz@@94 T@U) (p_1@@60 Real) (diz2@@30 T@U) (p2_1@@26 Real) ) (!  (=> (and (and (= (type diz@@94) RefType) (= (type diz2@@30) RefType)) (= (|Worker__postJoin_at_Thread#sm| diz@@94 p_1@@60) (|Worker__postJoin_at_Thread#sm| diz2@@30 p2_1@@26))) (and (= diz@@94 diz2@@30) (= p_1@@60 p2_1@@26)))
 :qid |stdinbpl.1438:15|
 :skolemid |189|
 :pattern ( (|Worker__postJoin_at_Thread#sm| diz@@94 p_1@@60) (|Worker__postJoin_at_Thread#sm| diz2@@30 p2_1@@26))
)))
(assert (forall ((diz@@95 T@U) (p_1@@61 Real) (diz2@@31 T@U) (p2_1@@27 Real) ) (!  (=> (and (and (= (type diz@@95) RefType) (= (type diz2@@31) RefType)) (= (Worker__preFork_at_Worker diz@@95 p_1@@61) (Worker__preFork_at_Worker diz2@@31 p2_1@@27))) (and (= diz@@95 diz2@@31) (= p_1@@61 p2_1@@27)))
 :qid |stdinbpl.1483:15|
 :skolemid |194|
 :pattern ( (Worker__preFork_at_Worker diz@@95 p_1@@61) (Worker__preFork_at_Worker diz2@@31 p2_1@@27))
)))
(assert (forall ((arg0@@70 T@U) (arg1@@44 Real) ) (! (= (type (|Worker__preFork_at_Worker#sm| arg0@@70 arg1@@44)) (FieldType PredicateType_Worker__preFork_at_WorkerType (MapType1Type RefType boolType)))
 :qid |funType:Worker__preFork_at_Worker#sm|
 :pattern ( (|Worker__preFork_at_Worker#sm| arg0@@70 arg1@@44))
)))
(assert (forall ((diz@@96 T@U) (p_1@@62 Real) (diz2@@32 T@U) (p2_1@@28 Real) ) (!  (=> (and (and (= (type diz@@96) RefType) (= (type diz2@@32) RefType)) (= (|Worker__preFork_at_Worker#sm| diz@@96 p_1@@62) (|Worker__preFork_at_Worker#sm| diz2@@32 p2_1@@28))) (and (= diz@@96 diz2@@32) (= p_1@@62 p2_1@@28)))
 :qid |stdinbpl.1487:15|
 :skolemid |195|
 :pattern ( (|Worker__preFork_at_Worker#sm| diz@@96 p_1@@62) (|Worker__preFork_at_Worker#sm| diz2@@32 p2_1@@28))
)))
(assert (forall ((diz@@97 T@U) (p_1@@63 Real) (diz2@@33 T@U) (p2_1@@29 Real) ) (!  (=> (and (and (= (type diz@@97) RefType) (= (type diz2@@33) RefType)) (= (Worker__postJoin_at_Worker diz@@97 p_1@@63) (Worker__postJoin_at_Worker diz2@@33 p2_1@@29))) (and (= diz@@97 diz2@@33) (= p_1@@63 p2_1@@29)))
 :qid |stdinbpl.1582:15|
 :skolemid |200|
 :pattern ( (Worker__postJoin_at_Worker diz@@97 p_1@@63) (Worker__postJoin_at_Worker diz2@@33 p2_1@@29))
)))
(assert (forall ((arg0@@71 T@U) (arg1@@45 Real) ) (! (= (type (|Worker__postJoin_at_Worker#sm| arg0@@71 arg1@@45)) (FieldType PredicateType_Worker__postJoin_at_WorkerType (MapType1Type RefType boolType)))
 :qid |funType:Worker__postJoin_at_Worker#sm|
 :pattern ( (|Worker__postJoin_at_Worker#sm| arg0@@71 arg1@@45))
)))
(assert (forall ((diz@@98 T@U) (p_1@@64 Real) (diz2@@34 T@U) (p2_1@@30 Real) ) (!  (=> (and (and (= (type diz@@98) RefType) (= (type diz2@@34) RefType)) (= (|Worker__postJoin_at_Worker#sm| diz@@98 p_1@@64) (|Worker__postJoin_at_Worker#sm| diz2@@34 p2_1@@30))) (and (= diz@@98 diz2@@34) (= p_1@@64 p2_1@@30)))
 :qid |stdinbpl.1586:15|
 :skolemid |201|
 :pattern ( (|Worker__postJoin_at_Worker#sm| diz@@98 p_1@@64) (|Worker__postJoin_at_Worker#sm| diz2@@34 p2_1@@30))
)))
(assert  (and (forall ((arg0@@72 Int) (arg1@@46 Int) ) (! (= (type (p_dual arg0@@72 arg1@@46)) ProcessDomainTypeType)
 :qid |funType:p_dual|
 :pattern ( (p_dual arg0@@72 arg1@@46))
)) (forall ((arg0@@73 T@U) (arg1@@47 T@U) ) (! (= (type (p_merge arg0@@73 arg1@@47)) ProcessDomainTypeType)
 :qid |funType:p_merge|
 :pattern ( (p_merge arg0@@73 arg1@@47))
))))
(assert (forall ((n_1@@0 Int) (m_1 Int) ) (! (= (p_merge (p_single n_1@@0) (p_single m_1)) (p_dual n_1@@0 m_1))
 :qid |stdinbpl.278:15|
 :skolemid |30|
 :pattern ( (p_dual n_1@@0 m_1))
)))
(assert (forall ((diz@@99 T@U) (diz2@@35 T@U) ) (!  (=> (and (and (= (type diz@@99) RefType) (= (type diz2@@35) RefType)) (= (History__inv diz@@99) (History__inv diz2@@35))) (= diz@@99 diz2@@35))
 :qid |stdinbpl.478:15|
 :skolemid |44|
 :pattern ( (History__inv diz@@99) (History__inv diz2@@35))
)))
(assert (forall ((arg0@@74 T@U) ) (! (= (type (|History__inv#sm| arg0@@74)) (FieldType PredicateType_History__invType (MapType1Type RefType boolType)))
 :qid |funType:History__inv#sm|
 :pattern ( (|History__inv#sm| arg0@@74))
)))
(assert (forall ((diz@@100 T@U) (diz2@@36 T@U) ) (!  (=> (and (and (= (type diz@@100) RefType) (= (type diz2@@36) RefType)) (= (|History__inv#sm| diz@@100) (|History__inv#sm| diz2@@36))) (= diz@@100 diz2@@36))
 :qid |stdinbpl.482:15|
 :skolemid |45|
 :pattern ( (|History__inv#sm| diz@@100) (|History__inv#sm| diz2@@36))
)))
(assert (forall ((diz@@101 T@U) (diz2@@37 T@U) ) (!  (=> (and (and (= (type diz@@101) RefType) (= (type diz2@@37) RefType)) (= (SubjectLock__inv diz@@101) (SubjectLock__inv diz2@@37))) (= diz@@101 diz2@@37))
 :qid |stdinbpl.611:15|
 :skolemid |62|
 :pattern ( (SubjectLock__inv diz@@101) (SubjectLock__inv diz2@@37))
)))
(assert (forall ((arg0@@75 T@U) ) (! (= (type (|SubjectLock__inv#sm| arg0@@75)) (FieldType PredicateType_SubjectLock__invType (MapType1Type RefType boolType)))
 :qid |funType:SubjectLock__inv#sm|
 :pattern ( (|SubjectLock__inv#sm| arg0@@75))
)))
(assert (forall ((diz@@102 T@U) (diz2@@38 T@U) ) (!  (=> (and (and (= (type diz@@102) RefType) (= (type diz2@@38) RefType)) (= (|SubjectLock__inv#sm| diz@@102) (|SubjectLock__inv#sm| diz2@@38))) (= diz@@102 diz2@@38))
 :qid |stdinbpl.615:15|
 :skolemid |63|
 :pattern ( (|SubjectLock__inv#sm| diz@@102) (|SubjectLock__inv#sm| diz2@@38))
)))
(assert (forall ((diz@@103 T@U) (diz2@@39 T@U) ) (!  (=> (and (and (= (type diz@@103) RefType) (= (type diz2@@39) RefType)) (= (SubjectLock__valid diz@@103) (SubjectLock__valid diz2@@39))) (= diz@@103 diz2@@39))
 :qid |stdinbpl.674:15|
 :skolemid |68|
 :pattern ( (SubjectLock__valid diz@@103) (SubjectLock__valid diz2@@39))
)))
(assert (forall ((arg0@@76 T@U) ) (! (= (type (|SubjectLock__valid#sm| arg0@@76)) (FieldType PredicateType_SubjectLock__validType (MapType1Type RefType boolType)))
 :qid |funType:SubjectLock__valid#sm|
 :pattern ( (|SubjectLock__valid#sm| arg0@@76))
)))
(assert (forall ((diz@@104 T@U) (diz2@@40 T@U) ) (!  (=> (and (and (= (type diz@@104) RefType) (= (type diz2@@40) RefType)) (= (|SubjectLock__valid#sm| diz@@104) (|SubjectLock__valid#sm| diz2@@40))) (= diz@@104 diz2@@40))
 :qid |stdinbpl.678:15|
 :skolemid |69|
 :pattern ( (|SubjectLock__valid#sm| diz@@104) (|SubjectLock__valid#sm| diz2@@40))
)))
(assert (forall ((diz@@105 T@U) (diz2@@41 T@U) ) (!  (=> (and (and (= (type diz@@105) RefType) (= (type diz2@@41) RefType)) (= (Thread__is_a_Thread diz@@105) (Thread__is_a_Thread diz2@@41))) (= diz@@105 diz2@@41))
 :qid |stdinbpl.744:15|
 :skolemid |80|
 :pattern ( (Thread__is_a_Thread diz@@105) (Thread__is_a_Thread diz2@@41))
)))
(assert (forall ((arg0@@77 T@U) ) (! (= (type (|Thread__is_a_Thread#sm| arg0@@77)) (FieldType PredicateType_Thread__is_a_ThreadType (MapType1Type RefType boolType)))
 :qid |funType:Thread__is_a_Thread#sm|
 :pattern ( (|Thread__is_a_Thread#sm| arg0@@77))
)))
(assert (forall ((diz@@106 T@U) (diz2@@42 T@U) ) (!  (=> (and (and (= (type diz@@106) RefType) (= (type diz2@@42) RefType)) (= (|Thread__is_a_Thread#sm| diz@@106) (|Thread__is_a_Thread#sm| diz2@@42))) (= diz@@106 diz2@@42))
 :qid |stdinbpl.748:15|
 :skolemid |81|
 :pattern ( (|Thread__is_a_Thread#sm| diz@@106) (|Thread__is_a_Thread#sm| diz2@@42))
)))
(assert (forall ((diz@@107 T@U) (diz2@@43 T@U) ) (!  (=> (and (and (= (type diz@@107) RefType) (= (type diz2@@43) RefType)) (= (Thread__instance_of_Thread diz@@107) (Thread__instance_of_Thread diz2@@43))) (= diz@@107 diz2@@43))
 :qid |stdinbpl.779:15|
 :skolemid |86|
 :pattern ( (Thread__instance_of_Thread diz@@107) (Thread__instance_of_Thread diz2@@43))
)))
(assert (forall ((arg0@@78 T@U) ) (! (= (type (|Thread__instance_of_Thread#sm| arg0@@78)) (FieldType PredicateType_Thread__instance_of_ThreadType (MapType1Type RefType boolType)))
 :qid |funType:Thread__instance_of_Thread#sm|
 :pattern ( (|Thread__instance_of_Thread#sm| arg0@@78))
)))
(assert (forall ((diz@@108 T@U) (diz2@@44 T@U) ) (!  (=> (and (and (= (type diz@@108) RefType) (= (type diz2@@44) RefType)) (= (|Thread__instance_of_Thread#sm| diz@@108) (|Thread__instance_of_Thread#sm| diz2@@44))) (= diz@@108 diz2@@44))
 :qid |stdinbpl.783:15|
 :skolemid |87|
 :pattern ( (|Thread__instance_of_Thread#sm| diz@@108) (|Thread__instance_of_Thread#sm| diz2@@44))
)))
(assert (forall ((diz@@109 T@U) (diz2@@45 T@U) ) (!  (=> (and (and (= (type diz@@109) RefType) (= (type diz2@@45) RefType)) (= (Worker__is_a_Worker diz@@109) (Worker__is_a_Worker diz2@@45))) (= diz@@109 diz2@@45))
 :qid |stdinbpl.1052:15|
 :skolemid |128|
 :pattern ( (Worker__is_a_Worker diz@@109) (Worker__is_a_Worker diz2@@45))
)))
(assert (forall ((arg0@@79 T@U) ) (! (= (type (|Worker__is_a_Worker#sm| arg0@@79)) (FieldType PredicateType_Worker__is_a_WorkerType (MapType1Type RefType boolType)))
 :qid |funType:Worker__is_a_Worker#sm|
 :pattern ( (|Worker__is_a_Worker#sm| arg0@@79))
)))
(assert (forall ((diz@@110 T@U) (diz2@@46 T@U) ) (!  (=> (and (and (= (type diz@@110) RefType) (= (type diz2@@46) RefType)) (= (|Worker__is_a_Worker#sm| diz@@110) (|Worker__is_a_Worker#sm| diz2@@46))) (= diz@@110 diz2@@46))
 :qid |stdinbpl.1056:15|
 :skolemid |129|
 :pattern ( (|Worker__is_a_Worker#sm| diz@@110) (|Worker__is_a_Worker#sm| diz2@@46))
)))
(assert (forall ((diz@@111 T@U) (diz2@@47 T@U) ) (!  (=> (and (and (= (type diz@@111) RefType) (= (type diz2@@47) RefType)) (= (Worker__instance_of_Worker diz@@111) (Worker__instance_of_Worker diz2@@47))) (= diz@@111 diz2@@47))
 :qid |stdinbpl.1087:15|
 :skolemid |134|
 :pattern ( (Worker__instance_of_Worker diz@@111) (Worker__instance_of_Worker diz2@@47))
)))
(assert (forall ((arg0@@80 T@U) ) (! (= (type (|Worker__instance_of_Worker#sm| arg0@@80)) (FieldType PredicateType_Worker__instance_of_WorkerType (MapType1Type RefType boolType)))
 :qid |funType:Worker__instance_of_Worker#sm|
 :pattern ( (|Worker__instance_of_Worker#sm| arg0@@80))
)))
(assert (forall ((diz@@112 T@U) (diz2@@48 T@U) ) (!  (=> (and (and (= (type diz@@112) RefType) (= (type diz2@@48) RefType)) (= (|Worker__instance_of_Worker#sm| diz@@112) (|Worker__instance_of_Worker#sm| diz2@@48))) (= diz@@112 diz2@@48))
 :qid |stdinbpl.1091:15|
 :skolemid |135|
 :pattern ( (|Worker__instance_of_Worker#sm| diz@@112) (|Worker__instance_of_Worker#sm| diz2@@48))
)))
(assert (forall ((diz@@113 T@U) (diz2@@49 T@U) ) (!  (=> (and (and (= (type diz@@113) RefType) (= (type diz2@@49) RefType)) (= (Worker__is_a_Thread diz@@113) (Worker__is_a_Thread diz2@@49))) (= diz@@113 diz2@@49))
 :qid |stdinbpl.1122:15|
 :skolemid |140|
 :pattern ( (Worker__is_a_Thread diz@@113) (Worker__is_a_Thread diz2@@49))
)))
(assert (forall ((arg0@@81 T@U) ) (! (= (type (|Worker__is_a_Thread#sm| arg0@@81)) (FieldType PredicateType_Worker__is_a_ThreadType (MapType1Type RefType boolType)))
 :qid |funType:Worker__is_a_Thread#sm|
 :pattern ( (|Worker__is_a_Thread#sm| arg0@@81))
)))
(assert (forall ((diz@@114 T@U) (diz2@@50 T@U) ) (!  (=> (and (and (= (type diz@@114) RefType) (= (type diz2@@50) RefType)) (= (|Worker__is_a_Thread#sm| diz@@114) (|Worker__is_a_Thread#sm| diz2@@50))) (= diz@@114 diz2@@50))
 :qid |stdinbpl.1126:15|
 :skolemid |141|
 :pattern ( (|Worker__is_a_Thread#sm| diz@@114) (|Worker__is_a_Thread#sm| diz2@@50))
)))
(assert (forall ((diz@@115 T@U) (diz2@@51 T@U) ) (!  (=> (and (and (= (type diz@@115) RefType) (= (type diz2@@51) RefType)) (= (Worker__instance_of_Thread diz@@115) (Worker__instance_of_Thread diz2@@51))) (= diz@@115 diz2@@51))
 :qid |stdinbpl.1157:15|
 :skolemid |146|
 :pattern ( (Worker__instance_of_Thread diz@@115) (Worker__instance_of_Thread diz2@@51))
)))
(assert (forall ((arg0@@82 T@U) ) (! (= (type (|Worker__instance_of_Thread#sm| arg0@@82)) (FieldType PredicateType_Worker__instance_of_ThreadType (MapType1Type RefType boolType)))
 :qid |funType:Worker__instance_of_Thread#sm|
 :pattern ( (|Worker__instance_of_Thread#sm| arg0@@82))
)))
(assert (forall ((diz@@116 T@U) (diz2@@52 T@U) ) (!  (=> (and (and (= (type diz@@116) RefType) (= (type diz2@@52) RefType)) (= (|Worker__instance_of_Thread#sm| diz@@116) (|Worker__instance_of_Thread#sm| diz2@@52))) (= diz@@116 diz2@@52))
 :qid |stdinbpl.1161:15|
 :skolemid |147|
 :pattern ( (|Worker__instance_of_Thread#sm| diz@@116) (|Worker__instance_of_Thread#sm| diz2@@52))
)))
(assert (forall ((Heap@@34 T@U) (ExhaleHeap@@2 T@U) (Mask@@3 T@U) (o_1@@0 T@U) (f_2 T@U) ) (! (let ((B@@1 (FieldTypeInv1 (type f_2))))
(let ((A@@1 (FieldTypeInv0 (type f_2))))
 (=> (and (and (and (and (and (and (= (type Heap@@34) (MapType0Type RefType)) (= (type ExhaleHeap@@2) (MapType0Type RefType))) (= (type Mask@@3) (MapType1Type RefType realType))) (= (type o_1@@0) RefType)) (= (type f_2) (FieldType A@@1 B@@1))) (IdenticalOnKnownLocations Heap@@34 ExhaleHeap@@2 Mask@@3)) (HasDirectPerm Mask@@3 o_1@@0 f_2)) (= (MapType0Select Heap@@34 o_1@@0 f_2) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2)))))
 :qid |stdinbpl.42:22|
 :skolemid |1|
 :pattern ( (IdenticalOnKnownLocations Heap@@34 ExhaleHeap@@2 Mask@@3) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2))
)))
(assert  (and (= (type dummyHeap) (MapType0Type RefType)) (= (type ZeroMask) (MapType1Type RefType realType))))
(assert (state dummyHeap ZeroMask))
(assert (forall ((p1_1 T@U) ) (!  (=> (= (type p1_1) ProcessDomainTypeType) (forall ((p2_1@@31 T@U) ) (!  (=> (= (type p2_1@@31) ProcessDomainTypeType) (forall ((p3 T@U) ) (!  (=> (= (type p3) ProcessDomainTypeType) (= (p_seq (p_seq p1_1 p2_1@@31) p3) (p_seq p1_1 (p_seq p2_1@@31 p3))))
 :qid |stdinbpl.264:13|
 :skolemid |26|
 :pattern ( (p_seq (p_seq p1_1 p2_1@@31) p3))
 :pattern ( (p_seq p1_1 (p_seq p2_1@@31 p3)))
)))
 :qid |stdinbpl.262:11|
 :skolemid |27|
 :pattern ( (p_seq p1_1 p2_1@@31))
)))
 :qid |stdinbpl.260:15|
 :skolemid |28|
 :no-pattern (type p1_1)
 :no-pattern (U_2_int p1_1)
 :no-pattern (U_2_bool p1_1)
)))
(assert (forall ((p T@U) (v_1 T@U) (w T@U) ) (! (let ((A@@2 (FieldTypeInv0 (type p))))
 (=> (and (and (= (type p) (FieldType A@@2 FrameTypeType)) (= (type v_1) FrameTypeType)) (= (type w) FrameTypeType)) (not (InsidePredicate p v_1 p w))))
 :qid |stdinbpl.174:19|
 :skolemid |21|
 :pattern ( (InsidePredicate p v_1 p w))
)))
(assert  (not (IsPredicateField History__x_hist_value)))
(assert  (not (IsWandField History__x_hist_value)))
(assert  (not (IsPredicateField History__x_hist_mode)))
(assert  (not (IsWandField History__x_hist_mode)))
(assert  (not (IsPredicateField History__x_hist_init)))
(assert  (not (IsWandField History__x_hist_init)))
(assert  (not (IsPredicateField History__x_hist_act)))
(assert  (not (IsWandField History__x_hist_act)))
(assert  (not (IsPredicateField SubjectLock__subject)))
(assert  (not (IsWandField SubjectLock__subject)))
(assert  (not (IsPredicateField Worker__l)))
(assert  (not (IsWandField Worker__l)))
(assert  (not (IsPredicateField Worker__s)))
(assert  (not (IsWandField Worker__s)))
(assert (forall ((Heap@@35 T@U) (ExhaleHeap@@3 T@U) (Mask@@4 T@U) ) (!  (=> (and (and (and (= (type Heap@@35) (MapType0Type RefType)) (= (type ExhaleHeap@@3) (MapType0Type RefType))) (= (type Mask@@4) (MapType1Type RefType realType))) (IdenticalOnKnownLocations Heap@@35 ExhaleHeap@@3 Mask@@4)) (succHeap Heap@@35 ExhaleHeap@@3))
 :qid |stdinbpl.83:15|
 :skolemid |10|
 :pattern ( (IdenticalOnKnownLocations Heap@@35 ExhaleHeap@@3 Mask@@4))
)))
(assert (forall ((Heap@@36 T@U) (Mask@@5 T@U) (diz@@117 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@36) (MapType0Type RefType)) (= (type Mask@@5) (MapType1Type RefType realType))) (= (type diz@@117) RefType)) (and (state Heap@@36 Mask@@5) (< AssumeFunctionsAbove 0))) (not (= diz@@117 null))) (= (History__free_get_x Heap@@36 diz@@117) (U_2_int (MapType0Select Heap@@36 diz@@117 History__x_hist_value))))
 :qid |stdinbpl.338:15|
 :skolemid |35|
 :pattern ( (state Heap@@36 Mask@@5) (History__free_get_x Heap@@36 diz@@117))
)))
(assert (forall ((Heap@@37 T@U) (Mask@@6 T@U) (diz@@118 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@37) (MapType0Type RefType)) (= (type Mask@@6) (MapType1Type RefType realType))) (= (type diz@@118) RefType)) (and (state Heap@@37 Mask@@6) (< AssumeFunctionsAbove 1))) (not (= diz@@118 null))) (= (History__hist_get_x Heap@@37 diz@@118) (U_2_int (MapType0Select Heap@@37 diz@@118 History__x_hist_value))))
 :qid |stdinbpl.406:15|
 :skolemid |39|
 :pattern ( (state Heap@@37 Mask@@6) (History__hist_get_x Heap@@37 diz@@118))
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
(assert  (and (forall ((arg0@@83 Real) (arg1@@48 T@U) ) (! (= (type (ConditionalFrame arg0@@83 arg1@@48)) FrameTypeType)
 :qid |funType:ConditionalFrame|
 :pattern ( (ConditionalFrame arg0@@83 arg1@@48))
)) (= (type EmptyFrame) FrameTypeType)))
(assert (forall ((p@@0 Real) (f_6 T@U) ) (!  (=> (= (type f_6) FrameTypeType) (= (ConditionalFrame p@@0 f_6) (ite (> p@@0 0.0) f_6 EmptyFrame)))
 :qid |stdinbpl.162:15|
 :skolemid |19|
 :pattern ( (ConditionalFrame p@@0 f_6))
)))
(assert (forall ((Mask@@7 T@U) (o_2@@0 T@U) (f_4@@0 T@U) ) (! (let ((B@@3 (FieldTypeInv1 (type f_4@@0))))
(let ((A@@4 (FieldTypeInv0 (type f_4@@0))))
 (=> (and (and (= (type Mask@@7) (MapType1Type RefType realType)) (= (type o_2@@0) RefType)) (= (type f_4@@0) (FieldType A@@4 B@@3))) (= (HasDirectPerm Mask@@7 o_2@@0 f_4@@0) (> (U_2_real (MapType1Select Mask@@7 o_2@@0 f_4@@0)) NoPerm)))))
 :qid |stdinbpl.133:22|
 :skolemid |17|
 :pattern ( (HasDirectPerm Mask@@7 o_2@@0 f_4@@0))
)))
(assert (forall ((o_2@@1 T@U) (f_4@@1 T@U) ) (! (let ((B@@4 (FieldTypeInv1 (type f_4@@1))))
(let ((A@@5 (FieldTypeInv0 (type f_4@@1))))
 (=> (and (= (type o_2@@1) RefType) (= (type f_4@@1) (FieldType A@@5 B@@4))) (= (U_2_real (MapType1Select ZeroMask o_2@@1 f_4@@1)) NoPerm))))
 :qid |stdinbpl.106:22|
 :skolemid |13|
 :pattern ( (MapType1Select ZeroMask o_2@@1 f_4@@1))
)))
(assert (forall ((p_1@@65 T@U) ) (!  (=> (= (type p_1@@65) ProcessDomainTypeType) (= (p_merge p_empty p_1@@65) p_1@@65))
 :qid |stdinbpl.242:15|
 :skolemid |23|
 :pattern ( (p_merge p_empty p_1@@65))
)))
(assert (forall ((p_1@@66 T@U) ) (!  (=> (= (type p_1@@66) ProcessDomainTypeType) (= (p_seq p_empty p_1@@66) p_1@@66))
 :qid |stdinbpl.248:15|
 :skolemid |24|
 :pattern ( (p_seq p_empty p_1@@66))
)))
(assert  (and (= (Ctor TYPEDomainTypeType) 40) (= (type class_Object) TYPEDomainTypeType)))
(assert (forall ((t_1 T@U) ) (!  (=> (= (type t_1) TYPEDomainTypeType) (instanceof class_Object t_1))
 :qid |stdinbpl.211:15|
 :skolemid |22|
 :pattern ( (instanceof class_Object t_1))
)))
(assert (forall ((diz@@119 T@U) (p_1@@67 Real) ) (!  (=> (= (type diz@@119) RefType) (= (getPredWandId (Thread__joinToken diz@@119 p_1@@67)) 8))
 :qid |stdinbpl.808:15|
 :skolemid |91|
 :pattern ( (Thread__joinToken diz@@119 p_1@@67))
)))
(assert (forall ((diz@@120 T@U) (p_1@@68 Real) ) (!  (=> (= (type diz@@120) RefType) (= (getPredWandId (Thread__preFork diz@@120 p_1@@68)) 9))
 :qid |stdinbpl.843:15|
 :skolemid |97|
 :pattern ( (Thread__preFork diz@@120 p_1@@68))
)))
(assert (forall ((diz@@121 T@U) (p_1@@69 Real) ) (!  (=> (= (type diz@@121) RefType) (= (getPredWandId (Thread__postJoin diz@@121 p_1@@69)) 10))
 :qid |stdinbpl.878:15|
 :skolemid |103|
 :pattern ( (Thread__postJoin diz@@121 p_1@@69))
)))
(assert (forall ((diz@@122 T@U) (p_1@@70 Real) ) (!  (=> (= (type diz@@122) RefType) (= (getPredWandId (Thread__joinToken_at_Thread diz@@122 p_1@@70)) 11))
 :qid |stdinbpl.913:15|
 :skolemid |109|
 :pattern ( (Thread__joinToken_at_Thread diz@@122 p_1@@70))
)))
(assert (forall ((diz@@123 T@U) (p_1@@71 Real) ) (!  (=> (= (type diz@@123) RefType) (= (getPredWandId (Thread__preFork_at_Thread diz@@123 p_1@@71)) 12))
 :qid |stdinbpl.948:15|
 :skolemid |115|
 :pattern ( (Thread__preFork_at_Thread diz@@123 p_1@@71))
)))
(assert (forall ((diz@@124 T@U) (p_1@@72 Real) ) (!  (=> (= (type diz@@124) RefType) (= (getPredWandId (Thread__postJoin_at_Thread diz@@124 p_1@@72)) 13))
 :qid |stdinbpl.997:15|
 :skolemid |121|
 :pattern ( (Thread__postJoin_at_Thread diz@@124 p_1@@72))
)))
(assert (forall ((diz@@125 T@U) (p_1@@73 Real) ) (!  (=> (= (type diz@@125) RefType) (= (getPredWandId (Worker__joinToken diz@@125 p_1@@73)) 18))
 :qid |stdinbpl.1186:15|
 :skolemid |151|
 :pattern ( (Worker__joinToken diz@@125 p_1@@73))
)))
(assert (forall ((diz@@126 T@U) (p_1@@74 Real) ) (!  (=> (= (type diz@@126) RefType) (= (getPredWandId (Worker__joinToken_at_Worker diz@@126 p_1@@74)) 19))
 :qid |stdinbpl.1221:15|
 :skolemid |157|
 :pattern ( (Worker__joinToken_at_Worker diz@@126 p_1@@74))
)))
(assert (forall ((diz@@127 T@U) (p_1@@75 Real) ) (!  (=> (= (type diz@@127) RefType) (= (getPredWandId (Worker__preFork diz@@127 p_1@@75)) 20))
 :qid |stdinbpl.1274:15|
 :skolemid |163|
 :pattern ( (Worker__preFork diz@@127 p_1@@75))
)))
(assert (forall ((diz@@128 T@U) (p_1@@76 Real) ) (!  (=> (= (type diz@@128) RefType) (= (getPredWandId (Worker__postJoin diz@@128 p_1@@76)) 21))
 :qid |stdinbpl.1309:15|
 :skolemid |169|
 :pattern ( (Worker__postJoin diz@@128 p_1@@76))
)))
(assert (forall ((diz@@129 T@U) (p_1@@77 Real) ) (!  (=> (= (type diz@@129) RefType) (= (getPredWandId (Worker__joinToken_at_Thread diz@@129 p_1@@77)) 22))
 :qid |stdinbpl.1344:15|
 :skolemid |175|
 :pattern ( (Worker__joinToken_at_Thread diz@@129 p_1@@77))
)))
(assert (forall ((diz@@130 T@U) (p_1@@78 Real) ) (!  (=> (= (type diz@@130) RefType) (= (getPredWandId (Worker__preFork_at_Thread diz@@130 p_1@@78)) 23))
 :qid |stdinbpl.1379:15|
 :skolemid |181|
 :pattern ( (Worker__preFork_at_Thread diz@@130 p_1@@78))
)))
(assert (forall ((diz@@131 T@U) (p_1@@79 Real) ) (!  (=> (= (type diz@@131) RefType) (= (getPredWandId (Worker__postJoin_at_Thread diz@@131 p_1@@79)) 24))
 :qid |stdinbpl.1428:15|
 :skolemid |187|
 :pattern ( (Worker__postJoin_at_Thread diz@@131 p_1@@79))
)))
(assert (forall ((diz@@132 T@U) (p_1@@80 Real) ) (!  (=> (= (type diz@@132) RefType) (= (getPredWandId (Worker__preFork_at_Worker diz@@132 p_1@@80)) 25))
 :qid |stdinbpl.1477:15|
 :skolemid |193|
 :pattern ( (Worker__preFork_at_Worker diz@@132 p_1@@80))
)))
(assert (forall ((diz@@133 T@U) (p_1@@81 Real) ) (!  (=> (= (type diz@@133) RefType) (= (getPredWandId (Worker__postJoin_at_Worker diz@@133 p_1@@81)) 26))
 :qid |stdinbpl.1576:15|
 :skolemid |199|
 :pattern ( (Worker__postJoin_at_Worker diz@@133 p_1@@81))
)))
(assert (forall ((Heap@@38 T@U) (ExhaleHeap@@4 T@U) (Mask@@8 T@U) (pm_f@@1 T@U) ) (! (let ((C@@1 (FieldTypeInv0 (type pm_f@@1))))
 (=> (and (and (and (and (and (= (type Heap@@38) (MapType0Type RefType)) (= (type ExhaleHeap@@4) (MapType0Type RefType))) (= (type Mask@@8) (MapType1Type RefType realType))) (= (type pm_f@@1) (FieldType C@@1 FrameTypeType))) (IdenticalOnKnownLocations Heap@@38 ExhaleHeap@@4 Mask@@8)) (and (HasDirectPerm Mask@@8 null pm_f@@1) (IsPredicateField pm_f@@1))) (forall ((o2 T@U) (f_2@@0 T@U) ) (! (let ((B@@5 (FieldTypeInv1 (type f_2@@0))))
(let ((A@@6 (FieldTypeInv0 (type f_2@@0))))
 (=> (and (and (= (type o2) RefType) (= (type f_2@@0) (FieldType A@@6 B@@5))) (U_2_bool (MapType1Select (MapType0Select Heap@@38 null (PredicateMaskField pm_f@@1)) o2 f_2@@0))) (= (MapType0Select Heap@@38 o2 f_2@@0) (MapType0Select ExhaleHeap@@4 o2 f_2@@0)))))
 :qid |stdinbpl.54:134|
 :skolemid |3|
 :pattern ( (MapType0Select ExhaleHeap@@4 o2 f_2@@0))
))))
 :qid |stdinbpl.52:19|
 :skolemid |4|
 :pattern ( (IdenticalOnKnownLocations Heap@@38 ExhaleHeap@@4 Mask@@8) (IsPredicateField pm_f@@1))
)))
(assert (forall ((Heap@@39 T@U) (ExhaleHeap@@5 T@U) (Mask@@9 T@U) (pm_f@@2 T@U) ) (! (let ((C@@2 (FieldTypeInv0 (type pm_f@@2))))
 (=> (and (and (and (and (and (= (type Heap@@39) (MapType0Type RefType)) (= (type ExhaleHeap@@5) (MapType0Type RefType))) (= (type Mask@@9) (MapType1Type RefType realType))) (= (type pm_f@@2) (FieldType C@@2 FrameTypeType))) (IdenticalOnKnownLocations Heap@@39 ExhaleHeap@@5 Mask@@9)) (and (HasDirectPerm Mask@@9 null pm_f@@2) (IsWandField pm_f@@2))) (forall ((o2@@0 T@U) (f_2@@1 T@U) ) (! (let ((B@@6 (FieldTypeInv1 (type f_2@@1))))
(let ((A@@7 (FieldTypeInv0 (type f_2@@1))))
 (=> (and (and (= (type o2@@0) RefType) (= (type f_2@@1) (FieldType A@@7 B@@6))) (U_2_bool (MapType1Select (MapType0Select Heap@@39 null (WandMaskField pm_f@@2)) o2@@0 f_2@@1))) (= (MapType0Select Heap@@39 o2@@0 f_2@@1) (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1)))))
 :qid |stdinbpl.67:129|
 :skolemid |6|
 :pattern ( (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1))
))))
 :qid |stdinbpl.65:19|
 :skolemid |7|
 :pattern ( (IdenticalOnKnownLocations Heap@@39 ExhaleHeap@@5 Mask@@9) (IsWandField pm_f@@2))
)))
(assert (forall ((diz@@134 T@U) ) (!  (=> (= (type diz@@134) RefType) (= (getPredWandId (History__inv diz@@134)) 0))
 :qid |stdinbpl.472:15|
 :skolemid |43|
 :pattern ( (History__inv diz@@134))
)))
(assert (forall ((diz@@135 T@U) ) (!  (=> (= (type diz@@135) RefType) (= (getPredWandId (SubjectLock__inv diz@@135)) 3))
 :qid |stdinbpl.605:15|
 :skolemid |61|
 :pattern ( (SubjectLock__inv diz@@135))
)))
(assert (forall ((diz@@136 T@U) ) (!  (=> (= (type diz@@136) RefType) (= (getPredWandId (SubjectLock__valid diz@@136)) 4))
 :qid |stdinbpl.668:15|
 :skolemid |67|
 :pattern ( (SubjectLock__valid diz@@136))
)))
(assert (forall ((diz@@137 T@U) ) (!  (=> (= (type diz@@137) RefType) (= (getPredWandId (Thread__is_a_Thread diz@@137)) 6))
 :qid |stdinbpl.738:15|
 :skolemid |79|
 :pattern ( (Thread__is_a_Thread diz@@137))
)))
(assert (forall ((diz@@138 T@U) ) (!  (=> (= (type diz@@138) RefType) (= (getPredWandId (Thread__instance_of_Thread diz@@138)) 7))
 :qid |stdinbpl.773:15|
 :skolemid |85|
 :pattern ( (Thread__instance_of_Thread diz@@138))
)))
(assert (forall ((diz@@139 T@U) ) (!  (=> (= (type diz@@139) RefType) (= (getPredWandId (Worker__is_a_Worker diz@@139)) 14))
 :qid |stdinbpl.1046:15|
 :skolemid |127|
 :pattern ( (Worker__is_a_Worker diz@@139))
)))
(assert (forall ((diz@@140 T@U) ) (!  (=> (= (type diz@@140) RefType) (= (getPredWandId (Worker__instance_of_Worker diz@@140)) 15))
 :qid |stdinbpl.1081:15|
 :skolemid |133|
 :pattern ( (Worker__instance_of_Worker diz@@140))
)))
(assert (forall ((diz@@141 T@U) ) (!  (=> (= (type diz@@141) RefType) (= (getPredWandId (Worker__is_a_Thread diz@@141)) 16))
 :qid |stdinbpl.1116:15|
 :skolemid |139|
 :pattern ( (Worker__is_a_Thread diz@@141))
)))
(assert (forall ((diz@@142 T@U) ) (!  (=> (= (type diz@@142) RefType) (= (getPredWandId (Worker__instance_of_Thread diz@@142)) 17))
 :qid |stdinbpl.1151:15|
 :skolemid |145|
 :pattern ( (Worker__instance_of_Thread diz@@142))
)))
(assert (forall ((Mask@@10 T@U) (o_2@@2 T@U) (f_4@@2 T@U) ) (! (let ((B@@7 (FieldTypeInv1 (type f_4@@2))))
(let ((A@@8 (FieldTypeInv0 (type f_4@@2))))
 (=> (and (and (and (= (type Mask@@10) (MapType1Type RefType realType)) (= (type o_2@@2) RefType)) (= (type f_4@@2) (FieldType A@@8 B@@7))) (GoodMask Mask@@10)) (and (>= (U_2_real (MapType1Select Mask@@10 o_2@@2 f_4@@2)) NoPerm) (=> (and (and (GoodMask Mask@@10) (not (IsPredicateField f_4@@2))) (not (IsWandField f_4@@2))) (<= (U_2_real (MapType1Select Mask@@10 o_2@@2 f_4@@2)) FullPerm))))))
 :qid |stdinbpl.128:22|
 :skolemid |16|
 :pattern ( (GoodMask Mask@@10) (MapType1Select Mask@@10 o_2@@2 f_4@@2))
)))
(assert (forall ((arg0@@84 T@U) ) (! (= (type (FrameFragment arg0@@84)) FrameTypeType)
 :qid |funType:FrameFragment|
 :pattern ( (FrameFragment arg0@@84))
)))
(assert (forall ((Heap@@40 T@U) (Mask@@11 T@U) (diz@@143 T@U) ) (!  (=> (and (and (and (= (type Heap@@40) (MapType0Type RefType)) (= (type Mask@@11) (MapType1Type RefType realType))) (= (type diz@@143) RefType)) (state Heap@@40 Mask@@11)) (= (|History__free_get_x'| Heap@@40 diz@@143) (|History__free_get_x#frame| (FrameFragment (MapType0Select Heap@@40 diz@@143 History__x_hist_value)) diz@@143)))
 :qid |stdinbpl.345:15|
 :skolemid |36|
 :pattern ( (state Heap@@40 Mask@@11) (|History__free_get_x'| Heap@@40 diz@@143))
)))
(assert (forall ((Heap@@41 T@U) (Mask@@12 T@U) (diz@@144 T@U) ) (!  (=> (and (and (and (= (type Heap@@41) (MapType0Type RefType)) (= (type Mask@@12) (MapType1Type RefType realType))) (= (type diz@@144) RefType)) (state Heap@@41 Mask@@12)) (= (|History__hist_get_x'| Heap@@41 diz@@144) (|History__hist_get_x#frame| (FrameFragment (MapType0Select Heap@@41 diz@@144 History__x_hist_value)) diz@@144)))
 :qid |stdinbpl.413:15|
 :skolemid |40|
 :pattern ( (state Heap@@41 Mask@@12) (|History__hist_get_x'| Heap@@41 diz@@144))
)))
(assert (forall ((o T@U) (f T@U) (Heap@@42 T@U) ) (!  (=> (and (and (and (= (type o) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap@@42) (MapType0Type RefType))) (U_2_bool (MapType0Select Heap@@42 o $allocated))) (U_2_bool (MapType0Select Heap@@42 (MapType0Select Heap@@42 o f) $allocated)))
 :qid |stdinbpl.31:15|
 :skolemid |0|
 :pattern ( (MapType0Select Heap@@42 o f))
)))
(assert (forall ((diz@@145 T@U) (p_1@@82 Real) ) (!  (=> (= (type diz@@145) RefType) (= (PredicateMaskField (Thread__joinToken diz@@145 p_1@@82)) (|Thread__joinToken#sm| diz@@145 p_1@@82)))
 :qid |stdinbpl.800:15|
 :skolemid |89|
 :pattern ( (PredicateMaskField (Thread__joinToken diz@@145 p_1@@82)))
)))
(assert (forall ((diz@@146 T@U) (p_1@@83 Real) ) (!  (=> (= (type diz@@146) RefType) (= (PredicateMaskField (Thread__preFork diz@@146 p_1@@83)) (|Thread__preFork#sm| diz@@146 p_1@@83)))
 :qid |stdinbpl.835:15|
 :skolemid |95|
 :pattern ( (PredicateMaskField (Thread__preFork diz@@146 p_1@@83)))
)))
(assert (forall ((diz@@147 T@U) (p_1@@84 Real) ) (!  (=> (= (type diz@@147) RefType) (= (PredicateMaskField (Thread__postJoin diz@@147 p_1@@84)) (|Thread__postJoin#sm| diz@@147 p_1@@84)))
 :qid |stdinbpl.870:15|
 :skolemid |101|
 :pattern ( (PredicateMaskField (Thread__postJoin diz@@147 p_1@@84)))
)))
(assert (forall ((diz@@148 T@U) (p_1@@85 Real) ) (!  (=> (= (type diz@@148) RefType) (= (PredicateMaskField (Thread__joinToken_at_Thread diz@@148 p_1@@85)) (|Thread__joinToken_at_Thread#sm| diz@@148 p_1@@85)))
 :qid |stdinbpl.905:15|
 :skolemid |107|
 :pattern ( (PredicateMaskField (Thread__joinToken_at_Thread diz@@148 p_1@@85)))
)))
(assert (forall ((diz@@149 T@U) (p_1@@86 Real) ) (!  (=> (= (type diz@@149) RefType) (= (PredicateMaskField (Thread__preFork_at_Thread diz@@149 p_1@@86)) (|Thread__preFork_at_Thread#sm| diz@@149 p_1@@86)))
 :qid |stdinbpl.940:15|
 :skolemid |113|
 :pattern ( (PredicateMaskField (Thread__preFork_at_Thread diz@@149 p_1@@86)))
)))
(assert (forall ((diz@@150 T@U) (p_1@@87 Real) ) (!  (=> (= (type diz@@150) RefType) (= (PredicateMaskField (Thread__postJoin_at_Thread diz@@150 p_1@@87)) (|Thread__postJoin_at_Thread#sm| diz@@150 p_1@@87)))
 :qid |stdinbpl.989:15|
 :skolemid |119|
 :pattern ( (PredicateMaskField (Thread__postJoin_at_Thread diz@@150 p_1@@87)))
)))
(assert (forall ((diz@@151 T@U) (p_1@@88 Real) ) (!  (=> (= (type diz@@151) RefType) (= (PredicateMaskField (Worker__joinToken diz@@151 p_1@@88)) (|Worker__joinToken#sm| diz@@151 p_1@@88)))
 :qid |stdinbpl.1178:15|
 :skolemid |149|
 :pattern ( (PredicateMaskField (Worker__joinToken diz@@151 p_1@@88)))
)))
(assert (forall ((diz@@152 T@U) (p_1@@89 Real) ) (!  (=> (= (type diz@@152) RefType) (= (PredicateMaskField (Worker__joinToken_at_Worker diz@@152 p_1@@89)) (|Worker__joinToken_at_Worker#sm| diz@@152 p_1@@89)))
 :qid |stdinbpl.1213:15|
 :skolemid |155|
 :pattern ( (PredicateMaskField (Worker__joinToken_at_Worker diz@@152 p_1@@89)))
)))
(assert (forall ((diz@@153 T@U) (p_1@@90 Real) ) (!  (=> (= (type diz@@153) RefType) (= (PredicateMaskField (Worker__preFork diz@@153 p_1@@90)) (|Worker__preFork#sm| diz@@153 p_1@@90)))
 :qid |stdinbpl.1266:15|
 :skolemid |161|
 :pattern ( (PredicateMaskField (Worker__preFork diz@@153 p_1@@90)))
)))
(assert (forall ((diz@@154 T@U) (p_1@@91 Real) ) (!  (=> (= (type diz@@154) RefType) (= (PredicateMaskField (Worker__postJoin diz@@154 p_1@@91)) (|Worker__postJoin#sm| diz@@154 p_1@@91)))
 :qid |stdinbpl.1301:15|
 :skolemid |167|
 :pattern ( (PredicateMaskField (Worker__postJoin diz@@154 p_1@@91)))
)))
(assert (forall ((diz@@155 T@U) (p_1@@92 Real) ) (!  (=> (= (type diz@@155) RefType) (= (PredicateMaskField (Worker__joinToken_at_Thread diz@@155 p_1@@92)) (|Worker__joinToken_at_Thread#sm| diz@@155 p_1@@92)))
 :qid |stdinbpl.1336:15|
 :skolemid |173|
 :pattern ( (PredicateMaskField (Worker__joinToken_at_Thread diz@@155 p_1@@92)))
)))
(assert (forall ((diz@@156 T@U) (p_1@@93 Real) ) (!  (=> (= (type diz@@156) RefType) (= (PredicateMaskField (Worker__preFork_at_Thread diz@@156 p_1@@93)) (|Worker__preFork_at_Thread#sm| diz@@156 p_1@@93)))
 :qid |stdinbpl.1371:15|
 :skolemid |179|
 :pattern ( (PredicateMaskField (Worker__preFork_at_Thread diz@@156 p_1@@93)))
)))
(assert (forall ((diz@@157 T@U) (p_1@@94 Real) ) (!  (=> (= (type diz@@157) RefType) (= (PredicateMaskField (Worker__postJoin_at_Thread diz@@157 p_1@@94)) (|Worker__postJoin_at_Thread#sm| diz@@157 p_1@@94)))
 :qid |stdinbpl.1420:15|
 :skolemid |185|
 :pattern ( (PredicateMaskField (Worker__postJoin_at_Thread diz@@157 p_1@@94)))
)))
(assert (forall ((diz@@158 T@U) (p_1@@95 Real) ) (!  (=> (= (type diz@@158) RefType) (= (PredicateMaskField (Worker__preFork_at_Worker diz@@158 p_1@@95)) (|Worker__preFork_at_Worker#sm| diz@@158 p_1@@95)))
 :qid |stdinbpl.1469:15|
 :skolemid |191|
 :pattern ( (PredicateMaskField (Worker__preFork_at_Worker diz@@158 p_1@@95)))
)))
(assert (forall ((diz@@159 T@U) (p_1@@96 Real) ) (!  (=> (= (type diz@@159) RefType) (= (PredicateMaskField (Worker__postJoin_at_Worker diz@@159 p_1@@96)) (|Worker__postJoin_at_Worker#sm| diz@@159 p_1@@96)))
 :qid |stdinbpl.1568:15|
 :skolemid |197|
 :pattern ( (PredicateMaskField (Worker__postJoin_at_Worker diz@@159 p_1@@96)))
)))
(assert (forall ((diz@@160 T@U) ) (!  (=> (= (type diz@@160) RefType) (= (PredicateMaskField (History__inv diz@@160)) (|History__inv#sm| diz@@160)))
 :qid |stdinbpl.464:15|
 :skolemid |41|
 :pattern ( (PredicateMaskField (History__inv diz@@160)))
)))
(assert (forall ((diz@@161 T@U) ) (!  (=> (= (type diz@@161) RefType) (= (PredicateMaskField (SubjectLock__inv diz@@161)) (|SubjectLock__inv#sm| diz@@161)))
 :qid |stdinbpl.597:15|
 :skolemid |59|
 :pattern ( (PredicateMaskField (SubjectLock__inv diz@@161)))
)))
(assert (forall ((diz@@162 T@U) ) (!  (=> (= (type diz@@162) RefType) (= (PredicateMaskField (SubjectLock__valid diz@@162)) (|SubjectLock__valid#sm| diz@@162)))
 :qid |stdinbpl.660:15|
 :skolemid |65|
 :pattern ( (PredicateMaskField (SubjectLock__valid diz@@162)))
)))
(assert (forall ((diz@@163 T@U) ) (!  (=> (= (type diz@@163) RefType) (= (PredicateMaskField (Thread__is_a_Thread diz@@163)) (|Thread__is_a_Thread#sm| diz@@163)))
 :qid |stdinbpl.730:15|
 :skolemid |77|
 :pattern ( (PredicateMaskField (Thread__is_a_Thread diz@@163)))
)))
(assert (forall ((diz@@164 T@U) ) (!  (=> (= (type diz@@164) RefType) (= (PredicateMaskField (Thread__instance_of_Thread diz@@164)) (|Thread__instance_of_Thread#sm| diz@@164)))
 :qid |stdinbpl.765:15|
 :skolemid |83|
 :pattern ( (PredicateMaskField (Thread__instance_of_Thread diz@@164)))
)))
(assert (forall ((diz@@165 T@U) ) (!  (=> (= (type diz@@165) RefType) (= (PredicateMaskField (Worker__is_a_Worker diz@@165)) (|Worker__is_a_Worker#sm| diz@@165)))
 :qid |stdinbpl.1038:15|
 :skolemid |125|
 :pattern ( (PredicateMaskField (Worker__is_a_Worker diz@@165)))
)))
(assert (forall ((diz@@166 T@U) ) (!  (=> (= (type diz@@166) RefType) (= (PredicateMaskField (Worker__instance_of_Worker diz@@166)) (|Worker__instance_of_Worker#sm| diz@@166)))
 :qid |stdinbpl.1073:15|
 :skolemid |131|
 :pattern ( (PredicateMaskField (Worker__instance_of_Worker diz@@166)))
)))
(assert (forall ((diz@@167 T@U) ) (!  (=> (= (type diz@@167) RefType) (= (PredicateMaskField (Worker__is_a_Thread diz@@167)) (|Worker__is_a_Thread#sm| diz@@167)))
 :qid |stdinbpl.1108:15|
 :skolemid |137|
 :pattern ( (PredicateMaskField (Worker__is_a_Thread diz@@167)))
)))
(assert (forall ((diz@@168 T@U) ) (!  (=> (= (type diz@@168) RefType) (= (PredicateMaskField (Worker__instance_of_Thread diz@@168)) (|Worker__instance_of_Thread#sm| diz@@168)))
 :qid |stdinbpl.1143:15|
 :skolemid |143|
 :pattern ( (PredicateMaskField (Worker__instance_of_Thread diz@@168)))
)))
(assert (forall ((n_1@@1 Int) ) (! (= (p_single n_1@@1) (ite (> n_1@@1 0) (p_seq (p_single (- n_1@@1 1)) p_incr) p_empty))
 :qid |stdinbpl.284:15|
 :skolemid |31|
 :pattern ( (p_single n_1@@1))
)))
(assert (forall ((Heap@@43 T@U) (o@@0 T@U) (f_3 T@U) (v T@U) ) (! (let ((B@@8 (type v)))
(let ((A@@9 (FieldTypeInv0 (type f_3))))
 (=> (and (and (= (type Heap@@43) (MapType0Type RefType)) (= (type o@@0) RefType)) (= (type f_3) (FieldType A@@9 B@@8))) (succHeap Heap@@43 (MapType0Store Heap@@43 o@@0 f_3 v)))))
 :qid |stdinbpl.78:22|
 :skolemid |9|
 :pattern ( (MapType0Store Heap@@43 o@@0 f_3 v))
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
 :qid |stdinbpl.169:25|
 :skolemid |20|
 :pattern ( (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))
)))
(assert (forall ((m_1@@0 Int) (n_1@@2 Int) ) (! (= (p_seq (p_single m_1@@0) (p_single n_1@@2)) (p_single (+ m_1@@0 n_1@@2)))
 :qid |stdinbpl.290:15|
 :skolemid |32|
 :pattern ( (p_seq (p_single m_1@@0) (p_single n_1@@2)))
)))
(assert (forall ((p_1@@97 T@U) ) (!  (=> (= (type p_1@@97) ProcessDomainTypeType) (= (p_seq p_1@@97 p_empty) p_1@@97))
 :qid |stdinbpl.254:15|
 :skolemid |25|
 :pattern ( (p_seq p_1@@97 p_empty))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
; Valid

(push 1)
(declare-fun ControlFlow (Int Int) Int)
(set-info :boogie-vc-id Worker__run_at_Thread)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 4) true)
))
(check-sat)
(pop 1)
; Valid
(get-info :rlimit)
