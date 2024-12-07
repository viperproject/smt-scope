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
(declare-fun next () T@U)
(declare-fun FieldType (T@T T@T) T@T)
(declare-fun FieldTypeInv0 (T@T) T@T)
(declare-fun FieldTypeInv1 (T@T) T@T)
(declare-fun NormalFieldType () T@T)
(declare-fun RefType () T@T)
(declare-fun apply_IND (T@U T@U T@U) Bool)
(declare-fun MapType0Type (T@T T@T) T@T)
(declare-fun EdgeDomainTypeType () T@T)
(declare-fun MapType0Select (T@U T@U) T@U)
(declare-fun edge (T@U T@U T@U) Bool)
(declare-fun exists_path (T@U T@U T@U) Bool)
(declare-fun MapType0TypeInv0 (T@T) T@T)
(declare-fun MapType0TypeInv1 (T@T) T@T)
(declare-fun MapType0Store (T@U T@U T@U) T@U)
(declare-fun succHeap (T@U T@U) Bool)
(declare-fun MapType1Type (T@T) T@T)
(declare-fun succHeapTrans (T@U T@U) Bool)
(declare-fun MapType1TypeInv0 (T@T) T@T)
(declare-fun MapType1Select (T@U T@U T@U) T@U)
(declare-fun MapType1Store (T@U T@U T@U T@U) T@U)
(declare-fun |MultiSet#Card| (T@U) Int)
(declare-fun |MultiSet#Difference| (T@U T@U) T@U)
(declare-fun MultiSetTypeInv0 (T@T) T@T)
(declare-fun MultiSetType (T@T) T@T)
(declare-fun |MultiSet#Intersection| (T@U T@U) T@U)
(declare-fun |MultiSet#Union| (T@U T@U) T@U)
(declare-fun state (T@U T@U) Bool)
(declare-fun MapType2Type (T@T T@T) T@T)
(declare-fun GoodMask (T@U) Bool)
(declare-fun MapType2TypeInv0 (T@T) T@T)
(declare-fun MapType2TypeInv1 (T@T) T@T)
(declare-fun MapType2Select (T@U T@U T@U) T@U)
(declare-fun MapType2Store (T@U T@U T@U T@U) T@U)
(declare-fun |Math#min| (Int Int) Int)
(declare-fun IdenticalOnKnownLocations (T@U T@U T@U) Bool)
(declare-fun IsPredicateField (T@U) Bool)
(declare-fun null () T@U)
(declare-fun PredicateMaskField (T@U) T@U)
(declare-fun FrameTypeType () T@T)
(declare-fun HasDirectPerm (T@U T@U T@U) Bool)
(declare-fun IsWandField (T@U) Bool)
(declare-fun WandMaskField (T@U) T@U)
(declare-fun |$$'| (T@U T@U) T@U)
(declare-fun dummyFunction (T@U) Bool)
(declare-fun |$$#triggerStateless| (T@U) T@U)
(declare-fun |$$#condqp1| (T@U T@U) Int)
(declare-fun |sk_$$#condqp1| (Int Int) T@U)
(declare-fun NoPerm () Real)
(declare-fun FullPerm () Real)
(declare-fun |MultiSet#Select| (T@U T@U) Int)
(declare-fun |Set#Union| (T@U T@U) T@U)
(declare-fun |Set#Intersection| (T@U T@U) T@U)
(declare-fun |Set#Singleton| (T@U) T@U)
(declare-fun |Set#Card| (T@U) Int)
(declare-fun inst_uReach_rev (T@U T@U) T@U)
(declare-fun inst_uReach_2 (T@U T@U) T@U)
(declare-fun exists_path_2 (T@U T@U T@U) Bool)
(declare-fun inst_uReach (T@U T@U) T@U)
(declare-fun $$ (T@U T@U) T@U)
(declare-fun |Math#clip| (Int) Int)
(declare-fun exists_path_ (T@U T@U T@U) Bool)
(declare-fun exists_path_2_ (T@U T@U T@U) Bool)
(declare-fun create_edge (T@U T@U) T@U)
(declare-fun edge_ (T@U T@U T@U) Bool)
(declare-fun dummyHeap () T@U)
(declare-fun ZeroMask () T@U)
(declare-fun |MultiSet#UnionOne| (T@U T@U) T@U)
(declare-fun |MultiSet#Disjoint| (T@U T@U) Bool)
(declare-fun InsidePredicate (T@U T@U T@U T@U) Bool)
(declare-fun |MultiSet#Singleton| (T@U) T@U)
(declare-fun |Set#Equal| (T@U T@U) Bool)
(declare-fun sumMask (T@U T@U T@U) Bool)
(declare-fun ConditionalFrame (Real T@U) T@U)
(declare-fun EmptyFrame () T@U)
(declare-fun apply_IND_2 (T@U T@U T@U) Bool)
(declare-fun edge_pred (T@U) T@U)
(declare-fun edge_succ (T@U) T@U)
(declare-fun AssumeFunctionsAbove () Int)
(declare-fun |$$#trigger| (T@U T@U) Bool)
(declare-fun FrameFragment (T@U) T@U)
(declare-fun |Set#Difference| (T@U T@U) T@U)
(declare-fun |MultiSet#Equal| (T@U T@U) Bool)
(declare-fun |Set#UnionOne| (T@U T@U) T@U)
(declare-fun |MultiSet#Empty| (T@T) T@U)
(declare-fun func_graph (T@U) Bool)
(declare-fun unshared_graph (T@U) Bool)
(declare-fun |Set#Empty| (T@T) T@U)
(declare-fun |$$#frame| (T@U T@U) T@U)
(declare-fun |Set#Subset| (T@U T@U) Bool)
(declare-fun ZeroPMask () T@U)
(declare-fun acyclic_graph (T@U) Bool)
(declare-fun |MultiSet#Subset| (T@U T@U) Bool)
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
))) (= (Ctor NormalFieldType) 7)) (= (type $allocated) (FieldType NormalFieldType boolType))) (= (Ctor RefType) 8)) (= (type next) (FieldType NormalFieldType RefType))))
(assert (distinct $allocated next)
)
(assert  (and (and (and (and (and (and (and (forall ((arg0@@14 T@T) (arg1@@2 T@T) ) (! (= (Ctor (MapType0Type arg0@@14 arg1@@2)) 9)
 :qid |ctor:MapType0Type|
)) (forall ((arg0@@15 T@T) (arg1@@3 T@T) ) (! (= (MapType0TypeInv0 (MapType0Type arg0@@15 arg1@@3)) arg0@@15)
 :qid |typeInv:MapType0TypeInv0|
 :pattern ( (MapType0Type arg0@@15 arg1@@3))
))) (forall ((arg0@@16 T@T) (arg1@@4 T@T) ) (! (= (MapType0TypeInv1 (MapType0Type arg0@@16 arg1@@4)) arg1@@4)
 :qid |typeInv:MapType0TypeInv1|
 :pattern ( (MapType0Type arg0@@16 arg1@@4))
))) (forall ((arg0@@17 T@U) (arg1@@5 T@U) ) (! (let ((aVar1 (MapType0TypeInv1 (type arg0@@17))))
(= (type (MapType0Select arg0@@17 arg1@@5)) aVar1))
 :qid |funType:MapType0Select|
 :pattern ( (MapType0Select arg0@@17 arg1@@5))
))) (forall ((arg0@@18 T@U) (arg1@@6 T@U) (arg2 T@U) ) (! (let ((aVar1@@0 (type arg2)))
(let ((aVar0 (type arg1@@6)))
(= (type (MapType0Store arg0@@18 arg1@@6 arg2)) (MapType0Type aVar0 aVar1@@0))))
 :qid |funType:MapType0Store|
 :pattern ( (MapType0Store arg0@@18 arg1@@6 arg2))
))) (forall ((m T@U) (x0 T@U) (val T@U) ) (! (let ((aVar1@@1 (MapType0TypeInv1 (type m))))
 (=> (= (type val) aVar1@@1) (= (MapType0Select (MapType0Store m x0 val) x0) val)))
 :qid |mapAx0:MapType0Select|
 :weight 0
))) (and (forall ((val@@0 T@U) (m@@0 T@U) (x0@@0 T@U) (y0 T@U) ) (!  (or (= x0@@0 y0) (= (MapType0Select (MapType0Store m@@0 x0@@0 val@@0) y0) (MapType0Select m@@0 y0)))
 :qid |mapAx1:MapType0Select:0|
 :weight 0
)) (forall ((val@@1 T@U) (m@@1 T@U) (x0@@1 T@U) (y0@@0 T@U) ) (!  (or true (= (MapType0Select (MapType0Store m@@1 x0@@1 val@@1) y0@@0) (MapType0Select m@@1 y0@@0)))
 :qid |mapAx2:MapType0Select|
 :weight 0
)))) (= (Ctor EdgeDomainTypeType) 10)))
(assert (forall ((EG_1 T@U) (Z_1 T@U) (P_1 T@U) ) (!  (=> (and (and (and (and (= (type EG_1) (MapType0Type EdgeDomainTypeType boolType)) (= (type Z_1) (MapType0Type RefType boolType))) (= (type P_1) (MapType0Type RefType boolType))) (apply_IND EG_1 Z_1 P_1)) (and (forall ((z@@0 T@U) ) (!  (=> (and (= (type z@@0) RefType) (U_2_bool (MapType0Select Z_1 z@@0))) (U_2_bool (MapType0Select P_1 z@@0)))
 :qid |stdinbpl.713:49|
 :skolemid |85|
 :pattern ( (MapType0Select Z_1 z@@0))
 :pattern ( (MapType0Select P_1 z@@0))
)) (forall ((u_1 T@U) (v_2 T@U) ) (!  (=> (and (and (= (type u_1) RefType) (= (type v_2) RefType)) (and (U_2_bool (MapType0Select P_1 u_1)) (edge EG_1 u_1 v_2))) (U_2_bool (MapType0Select P_1 v_2)))
 :qid |stdinbpl.716:16|
 :skolemid |86|
 :pattern ( (edge EG_1 u_1 v_2))
 :pattern ( (MapType0Select P_1 u_1) (MapType0Select P_1 v_2))
)))) (forall ((u_1_1 T@U) (z_1 T@U) ) (!  (=> (and (and (= (type u_1_1) RefType) (= (type z_1) RefType)) (and (U_2_bool (MapType0Select Z_1 z_1)) (exists_path EG_1 z_1 u_1_1))) (U_2_bool (MapType0Select P_1 u_1_1)))
 :qid |stdinbpl.719:17|
 :skolemid |87|
 :pattern ( (exists_path EG_1 z_1 u_1_1))
 :pattern ( (MapType0Select Z_1 z_1) (MapType0Select P_1 u_1_1))
)))
 :qid |stdinbpl.711:15|
 :skolemid |88|
 :pattern ( (apply_IND EG_1 Z_1 P_1))
)))
(assert  (and (and (and (and (and (forall ((arg0@@19 T@T) ) (! (= (Ctor (MapType1Type arg0@@19)) 11)
 :qid |ctor:MapType1Type|
)) (forall ((arg0@@20 T@T) ) (! (= (MapType1TypeInv0 (MapType1Type arg0@@20)) arg0@@20)
 :qid |typeInv:MapType1TypeInv0|
 :pattern ( (MapType1Type arg0@@20))
))) (forall ((arg0@@21 T@U) (arg1@@7 T@U) (arg2@@0 T@U) ) (! (let ((B (FieldTypeInv1 (type arg2@@0))))
(= (type (MapType1Select arg0@@21 arg1@@7 arg2@@0)) B))
 :qid |funType:MapType1Select|
 :pattern ( (MapType1Select arg0@@21 arg1@@7 arg2@@0))
))) (forall ((arg0@@22 T@U) (arg1@@8 T@U) (arg2@@1 T@U) (arg3 T@U) ) (! (let ((aVar0@@0 (type arg1@@8)))
(= (type (MapType1Store arg0@@22 arg1@@8 arg2@@1 arg3)) (MapType1Type aVar0@@0)))
 :qid |funType:MapType1Store|
 :pattern ( (MapType1Store arg0@@22 arg1@@8 arg2@@1 arg3))
))) (forall ((m@@2 T@U) (x0@@2 T@U) (x1 T@U) (val@@2 T@U) ) (! (let ((B@@0 (FieldTypeInv1 (type x1))))
 (=> (= (type val@@2) B@@0) (= (MapType1Select (MapType1Store m@@2 x0@@2 x1 val@@2) x0@@2 x1) val@@2)))
 :qid |mapAx0:MapType1Select|
 :weight 0
))) (and (and (forall ((val@@3 T@U) (m@@3 T@U) (x0@@3 T@U) (x1@@0 T@U) (y0@@1 T@U) (y1 T@U) ) (!  (or (= x0@@3 y0@@1) (= (MapType1Select (MapType1Store m@@3 x0@@3 x1@@0 val@@3) y0@@1 y1) (MapType1Select m@@3 y0@@1 y1)))
 :qid |mapAx1:MapType1Select:0|
 :weight 0
)) (forall ((val@@4 T@U) (m@@4 T@U) (x0@@4 T@U) (x1@@1 T@U) (y0@@2 T@U) (y1@@0 T@U) ) (!  (or (= x1@@1 y1@@0) (= (MapType1Select (MapType1Store m@@4 x0@@4 x1@@1 val@@4) y0@@2 y1@@0) (MapType1Select m@@4 y0@@2 y1@@0)))
 :qid |mapAx1:MapType1Select:1|
 :weight 0
))) (forall ((val@@5 T@U) (m@@5 T@U) (x0@@5 T@U) (x1@@2 T@U) (y0@@3 T@U) (y1@@1 T@U) ) (!  (or true (= (MapType1Select (MapType1Store m@@5 x0@@5 x1@@2 val@@5) y0@@3 y1@@1) (MapType1Select m@@5 y0@@3 y1@@1)))
 :qid |mapAx2:MapType1Select|
 :weight 0
)))))
(assert (forall ((Heap0 T@U) (Heap1 T@U) ) (!  (=> (and (and (= (type Heap0) (MapType1Type RefType)) (= (type Heap1) (MapType1Type RefType))) (succHeap Heap0 Heap1)) (succHeapTrans Heap0 Heap1))
 :qid |stdinbpl.88:15|
 :skolemid |11|
 :pattern ( (succHeap Heap0 Heap1))
)))
(assert  (and (and (and (and (forall ((arg0@@23 T@T) ) (! (= (Ctor (MultiSetType arg0@@23)) 12)
 :qid |ctor:MultiSetType|
)) (forall ((arg0@@24 T@T) ) (! (= (MultiSetTypeInv0 (MultiSetType arg0@@24)) arg0@@24)
 :qid |typeInv:MultiSetTypeInv0|
 :pattern ( (MultiSetType arg0@@24))
))) (forall ((arg0@@25 T@U) (arg1@@9 T@U) ) (! (let ((T (MultiSetTypeInv0 (type arg0@@25))))
(= (type (|MultiSet#Difference| arg0@@25 arg1@@9)) (MultiSetType T)))
 :qid |funType:MultiSet#Difference|
 :pattern ( (|MultiSet#Difference| arg0@@25 arg1@@9))
))) (forall ((arg0@@26 T@U) (arg1@@10 T@U) ) (! (let ((T@@0 (MultiSetTypeInv0 (type arg0@@26))))
(= (type (|MultiSet#Intersection| arg0@@26 arg1@@10)) (MultiSetType T@@0)))
 :qid |funType:MultiSet#Intersection|
 :pattern ( (|MultiSet#Intersection| arg0@@26 arg1@@10))
))) (forall ((arg0@@27 T@U) (arg1@@11 T@U) ) (! (let ((T@@1 (MultiSetTypeInv0 (type arg0@@27))))
(= (type (|MultiSet#Union| arg0@@27 arg1@@11)) (MultiSetType T@@1)))
 :qid |funType:MultiSet#Union|
 :pattern ( (|MultiSet#Union| arg0@@27 arg1@@11))
))))
(assert (forall ((a T@U) (b T@U) ) (! (let ((T@@2 (MultiSetTypeInv0 (type a))))
 (=> (and (= (type a) (MultiSetType T@@2)) (= (type b) (MultiSetType T@@2))) (and (= (+ (+ (|MultiSet#Card| (|MultiSet#Difference| a b)) (|MultiSet#Card| (|MultiSet#Difference| b a))) (* 2 (|MultiSet#Card| (|MultiSet#Intersection| a b)))) (|MultiSet#Card| (|MultiSet#Union| a b))) (= (|MultiSet#Card| (|MultiSet#Difference| a b)) (- (|MultiSet#Card| a) (|MultiSet#Card| (|MultiSet#Intersection| a b)))))))
 :qid |stdinbpl.587:18|
 :skolemid |74|
 :pattern ( (|MultiSet#Card| (|MultiSet#Difference| a b)))
)))
(assert  (and (and (and (and (and (and (forall ((arg0@@28 T@T) (arg1@@12 T@T) ) (! (= (Ctor (MapType2Type arg0@@28 arg1@@12)) 13)
 :qid |ctor:MapType2Type|
)) (forall ((arg0@@29 T@T) (arg1@@13 T@T) ) (! (= (MapType2TypeInv0 (MapType2Type arg0@@29 arg1@@13)) arg0@@29)
 :qid |typeInv:MapType2TypeInv0|
 :pattern ( (MapType2Type arg0@@29 arg1@@13))
))) (forall ((arg0@@30 T@T) (arg1@@14 T@T) ) (! (= (MapType2TypeInv1 (MapType2Type arg0@@30 arg1@@14)) arg1@@14)
 :qid |typeInv:MapType2TypeInv1|
 :pattern ( (MapType2Type arg0@@30 arg1@@14))
))) (forall ((arg0@@31 T@U) (arg1@@15 T@U) (arg2@@2 T@U) ) (! (let ((aVar1@@2 (MapType2TypeInv1 (type arg0@@31))))
(= (type (MapType2Select arg0@@31 arg1@@15 arg2@@2)) aVar1@@2))
 :qid |funType:MapType2Select|
 :pattern ( (MapType2Select arg0@@31 arg1@@15 arg2@@2))
))) (forall ((arg0@@32 T@U) (arg1@@16 T@U) (arg2@@3 T@U) (arg3@@0 T@U) ) (! (let ((aVar1@@3 (type arg3@@0)))
(let ((aVar0@@1 (type arg1@@16)))
(= (type (MapType2Store arg0@@32 arg1@@16 arg2@@3 arg3@@0)) (MapType2Type aVar0@@1 aVar1@@3))))
 :qid |funType:MapType2Store|
 :pattern ( (MapType2Store arg0@@32 arg1@@16 arg2@@3 arg3@@0))
))) (forall ((m@@6 T@U) (x0@@6 T@U) (x1@@3 T@U) (val@@6 T@U) ) (! (let ((aVar1@@4 (MapType2TypeInv1 (type m@@6))))
 (=> (= (type val@@6) aVar1@@4) (= (MapType2Select (MapType2Store m@@6 x0@@6 x1@@3 val@@6) x0@@6 x1@@3) val@@6)))
 :qid |mapAx0:MapType2Select|
 :weight 0
))) (and (and (forall ((val@@7 T@U) (m@@7 T@U) (x0@@7 T@U) (x1@@4 T@U) (y0@@4 T@U) (y1@@2 T@U) ) (!  (or (= x0@@7 y0@@4) (= (MapType2Select (MapType2Store m@@7 x0@@7 x1@@4 val@@7) y0@@4 y1@@2) (MapType2Select m@@7 y0@@4 y1@@2)))
 :qid |mapAx1:MapType2Select:0|
 :weight 0
)) (forall ((val@@8 T@U) (m@@8 T@U) (x0@@8 T@U) (x1@@5 T@U) (y0@@5 T@U) (y1@@3 T@U) ) (!  (or (= x1@@5 y1@@3) (= (MapType2Select (MapType2Store m@@8 x0@@8 x1@@5 val@@8) y0@@5 y1@@3) (MapType2Select m@@8 y0@@5 y1@@3)))
 :qid |mapAx1:MapType2Select:1|
 :weight 0
))) (forall ((val@@9 T@U) (m@@9 T@U) (x0@@9 T@U) (x1@@6 T@U) (y0@@6 T@U) (y1@@4 T@U) ) (!  (or true (= (MapType2Select (MapType2Store m@@9 x0@@9 x1@@6 val@@9) y0@@6 y1@@4) (MapType2Select m@@9 y0@@6 y1@@4)))
 :qid |mapAx2:MapType2Select|
 :weight 0
)))))
(assert (forall ((Heap T@U) (Mask T@U) ) (!  (=> (and (and (= (type Heap) (MapType1Type RefType)) (= (type Mask) (MapType2Type RefType realType))) (state Heap Mask)) (GoodMask Mask))
 :qid |stdinbpl.124:15|
 :skolemid |15|
 :pattern ( (state Heap Mask))
)))
(assert (forall ((Heap0@@0 T@U) (Heap1@@0 T@U) (Heap2 T@U) ) (!  (=> (and (and (and (= (type Heap0@@0) (MapType1Type RefType)) (= (type Heap1@@0) (MapType1Type RefType))) (= (type Heap2) (MapType1Type RefType))) (and (succHeapTrans Heap0@@0 Heap1@@0) (succHeap Heap1@@0 Heap2))) (succHeapTrans Heap0@@0 Heap2))
 :qid |stdinbpl.93:15|
 :skolemid |12|
 :pattern ( (succHeapTrans Heap0@@0 Heap1@@0) (succHeap Heap1@@0 Heap2))
)))
(assert (forall ((a@@0 Int) (b@@0 Int) ) (!  (or (= (|Math#min| a@@0 b@@0) a@@0) (= (|Math#min| a@@0 b@@0) b@@0))
 :qid |stdinbpl.518:15|
 :skolemid |53|
 :pattern ( (|Math#min| a@@0 b@@0))
)))
(assert  (and (and (= (Ctor FrameTypeType) 14) (= (type null) RefType)) (forall ((arg0@@33 T@U) ) (! (let ((A (FieldTypeInv0 (type arg0@@33))))
(= (type (PredicateMaskField arg0@@33)) (FieldType A (MapType2Type RefType boolType))))
 :qid |funType:PredicateMaskField|
 :pattern ( (PredicateMaskField arg0@@33))
))))
(assert (forall ((Heap@@0 T@U) (ExhaleHeap T@U) (Mask@@0 T@U) (pm_f T@U) ) (! (let ((C (FieldTypeInv0 (type pm_f))))
 (=> (and (and (and (and (and (= (type Heap@@0) (MapType1Type RefType)) (= (type ExhaleHeap) (MapType1Type RefType))) (= (type Mask@@0) (MapType2Type RefType realType))) (= (type pm_f) (FieldType C FrameTypeType))) (IdenticalOnKnownLocations Heap@@0 ExhaleHeap Mask@@0)) (and (HasDirectPerm Mask@@0 null pm_f) (IsPredicateField pm_f))) (= (MapType1Select Heap@@0 null (PredicateMaskField pm_f)) (MapType1Select ExhaleHeap null (PredicateMaskField pm_f)))))
 :qid |stdinbpl.47:19|
 :skolemid |2|
 :pattern ( (IdenticalOnKnownLocations Heap@@0 ExhaleHeap Mask@@0) (IsPredicateField pm_f) (MapType1Select ExhaleHeap null (PredicateMaskField pm_f)))
)))
(assert (forall ((arg0@@34 T@U) ) (! (let ((A@@0 (FieldTypeInv0 (type arg0@@34))))
(= (type (WandMaskField arg0@@34)) (FieldType A@@0 (MapType2Type RefType boolType))))
 :qid |funType:WandMaskField|
 :pattern ( (WandMaskField arg0@@34))
)))
(assert (forall ((Heap@@1 T@U) (ExhaleHeap@@0 T@U) (Mask@@1 T@U) (pm_f@@0 T@U) ) (! (let ((C@@0 (FieldTypeInv0 (type pm_f@@0))))
 (=> (and (and (and (and (and (= (type Heap@@1) (MapType1Type RefType)) (= (type ExhaleHeap@@0) (MapType1Type RefType))) (= (type Mask@@1) (MapType2Type RefType realType))) (= (type pm_f@@0) (FieldType C@@0 FrameTypeType))) (IdenticalOnKnownLocations Heap@@1 ExhaleHeap@@0 Mask@@1)) (and (HasDirectPerm Mask@@1 null pm_f@@0) (IsWandField pm_f@@0))) (= (MapType1Select Heap@@1 null (WandMaskField pm_f@@0)) (MapType1Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))))
 :qid |stdinbpl.60:19|
 :skolemid |5|
 :pattern ( (IdenticalOnKnownLocations Heap@@1 ExhaleHeap@@0 Mask@@1) (IsWandField pm_f@@0) (MapType1Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))
)))
(assert  (and (forall ((arg0@@35 T@U) (arg1@@17 T@U) ) (! (= (type (|$$'| arg0@@35 arg1@@17)) (MapType0Type EdgeDomainTypeType boolType))
 :qid |funType:$$'|
 :pattern ( (|$$'| arg0@@35 arg1@@17))
)) (forall ((arg0@@36 T@U) ) (! (= (type (|$$#triggerStateless| arg0@@36)) (MapType0Type EdgeDomainTypeType boolType))
 :qid |funType:$$#triggerStateless|
 :pattern ( (|$$#triggerStateless| arg0@@36))
))))
(assert (forall ((Heap@@2 T@U) (refs T@U) ) (!  (=> (and (= (type Heap@@2) (MapType1Type RefType)) (= (type refs) (MapType0Type RefType boolType))) (dummyFunction (|$$#triggerStateless| refs)))
 :qid |stdinbpl.840:15|
 :skolemid |110|
 :pattern ( (|$$'| Heap@@2 refs))
)))
(assert (forall ((arg0@@37 Int) (arg1@@18 Int) ) (! (= (type (|sk_$$#condqp1| arg0@@37 arg1@@18)) RefType)
 :qid |funType:sk_$$#condqp1|
 :pattern ( (|sk_$$#condqp1| arg0@@37 arg1@@18))
)))
(assert (forall ((Heap2Heap T@U) (Heap1Heap T@U) (refs@@0 T@U) ) (!  (=> (and (and (and (= (type Heap2Heap) (MapType1Type RefType)) (= (type Heap1Heap) (MapType1Type RefType))) (= (type refs@@0) (MapType0Type RefType boolType))) (and (=  (and (U_2_bool (MapType0Select refs@@0 (|sk_$$#condqp1| (|$$#condqp1| Heap2Heap refs@@0) (|$$#condqp1| Heap1Heap refs@@0)))) (< NoPerm FullPerm))  (and (U_2_bool (MapType0Select refs@@0 (|sk_$$#condqp1| (|$$#condqp1| Heap2Heap refs@@0) (|$$#condqp1| Heap1Heap refs@@0)))) (< NoPerm FullPerm))) (=> (and (U_2_bool (MapType0Select refs@@0 (|sk_$$#condqp1| (|$$#condqp1| Heap2Heap refs@@0) (|$$#condqp1| Heap1Heap refs@@0)))) (< NoPerm FullPerm)) (= (MapType1Select Heap2Heap (|sk_$$#condqp1| (|$$#condqp1| Heap2Heap refs@@0) (|$$#condqp1| Heap1Heap refs@@0)) next) (MapType1Select Heap1Heap (|sk_$$#condqp1| (|$$#condqp1| Heap2Heap refs@@0) (|$$#condqp1| Heap1Heap refs@@0)) next))))) (= (|$$#condqp1| Heap2Heap refs@@0) (|$$#condqp1| Heap1Heap refs@@0)))
 :qid |stdinbpl.857:15|
 :skolemid |112|
 :pattern ( (|$$#condqp1| Heap2Heap refs@@0) (|$$#condqp1| Heap1Heap refs@@0) (succHeapTrans Heap2Heap Heap1Heap))
)))
(assert (forall ((a@@1 T@U) (b@@1 T@U) (y@@1 T@U) ) (! (let ((T@@3 (type y@@1)))
 (=> (and (and (= (type a@@1) (MultiSetType T@@3)) (= (type b@@1) (MultiSetType T@@3))) (<= (|MultiSet#Select| a@@1 y@@1) (|MultiSet#Select| b@@1 y@@1))) (= (|MultiSet#Select| (|MultiSet#Difference| a@@1 b@@1) y@@1) 0)))
 :qid |stdinbpl.585:18|
 :skolemid |73|
 :pattern ( (|MultiSet#Difference| a@@1 b@@1) (|MultiSet#Select| b@@1 y@@1) (|MultiSet#Select| a@@1 y@@1))
)))
(assert (forall ((arg0@@38 T@U) (arg1@@19 T@U) ) (! (let ((T@@4 (MapType0TypeInv0 (type arg0@@38))))
(= (type (|Set#Union| arg0@@38 arg1@@19)) (MapType0Type T@@4 boolType)))
 :qid |funType:Set#Union|
 :pattern ( (|Set#Union| arg0@@38 arg1@@19))
)))
(assert (forall ((a@@2 T@U) (b@@2 T@U) ) (! (let ((T@@5 (MapType0TypeInv0 (type a@@2))))
 (=> (and (= (type a@@2) (MapType0Type T@@5 boolType)) (= (type b@@2) (MapType0Type T@@5 boolType))) (= (|Set#Union| (|Set#Union| a@@2 b@@2) b@@2) (|Set#Union| a@@2 b@@2))))
 :qid |stdinbpl.470:18|
 :skolemid |38|
 :pattern ( (|Set#Union| (|Set#Union| a@@2 b@@2) b@@2))
)))
(assert (forall ((arg0@@39 T@U) (arg1@@20 T@U) ) (! (let ((T@@6 (MapType0TypeInv0 (type arg0@@39))))
(= (type (|Set#Intersection| arg0@@39 arg1@@20)) (MapType0Type T@@6 boolType)))
 :qid |funType:Set#Intersection|
 :pattern ( (|Set#Intersection| arg0@@39 arg1@@20))
)))
(assert (forall ((a@@3 T@U) (b@@3 T@U) ) (! (let ((T@@7 (MapType0TypeInv0 (type a@@3))))
 (=> (and (= (type a@@3) (MapType0Type T@@7 boolType)) (= (type b@@3) (MapType0Type T@@7 boolType))) (= (|Set#Intersection| (|Set#Intersection| a@@3 b@@3) b@@3) (|Set#Intersection| a@@3 b@@3))))
 :qid |stdinbpl.474:18|
 :skolemid |40|
 :pattern ( (|Set#Intersection| (|Set#Intersection| a@@3 b@@3) b@@3))
)))
(assert (forall ((a@@4 T@U) (b@@4 T@U) ) (! (let ((T@@8 (MultiSetTypeInv0 (type a@@4))))
 (=> (and (= (type a@@4) (MultiSetType T@@8)) (= (type b@@4) (MultiSetType T@@8))) (= (|MultiSet#Intersection| (|MultiSet#Intersection| a@@4 b@@4) b@@4) (|MultiSet#Intersection| a@@4 b@@4))))
 :qid |stdinbpl.576:18|
 :skolemid |70|
 :pattern ( (|MultiSet#Intersection| (|MultiSet#Intersection| a@@4 b@@4) b@@4))
)))
(assert (forall ((arg0@@40 T@U) ) (! (let ((T@@9 (type arg0@@40)))
(= (type (|Set#Singleton| arg0@@40)) (MapType0Type T@@9 boolType)))
 :qid |funType:Set#Singleton|
 :pattern ( (|Set#Singleton| arg0@@40))
)))
(assert (forall ((r T@U) (o T@U) ) (! (let ((T@@10 (type r)))
 (=> (= (type o) T@@10) (= (U_2_bool (MapType0Select (|Set#Singleton| r) o)) (= r o))))
 :qid |stdinbpl.439:18|
 :skolemid |27|
 :pattern ( (MapType0Select (|Set#Singleton| r) o))
)))
(assert (forall ((a@@5 T@U) (b@@5 T@U) ) (! (let ((T@@11 (MapType0TypeInv0 (type a@@5))))
 (=> (and (= (type a@@5) (MapType0Type T@@11 boolType)) (= (type b@@5) (MapType0Type T@@11 boolType))) (= (+ (|Set#Card| (|Set#Union| a@@5 b@@5)) (|Set#Card| (|Set#Intersection| a@@5 b@@5))) (+ (|Set#Card| a@@5) (|Set#Card| b@@5)))))
 :qid |stdinbpl.478:18|
 :skolemid |42|
 :pattern ( (|Set#Card| (|Set#Union| a@@5 b@@5)))
 :pattern ( (|Set#Card| (|Set#Intersection| a@@5 b@@5)))
)))
(assert (forall ((arg0@@41 T@U) (arg1@@21 T@U) ) (! (= (type (inst_uReach_rev arg0@@41 arg1@@21)) (MapType0Type RefType boolType))
 :qid |funType:inst_uReach_rev|
 :pattern ( (inst_uReach_rev arg0@@41 arg1@@21))
)))
(assert (forall ((EG_1@@0 T@U) (u_1@@0 T@U) (y@@2 T@U) ) (!  (=> (and (and (= (type EG_1@@0) (MapType0Type EdgeDomainTypeType boolType)) (= (type u_1@@0) RefType)) (= (type y@@2) RefType)) (= (U_2_bool (MapType0Select (inst_uReach_rev EG_1@@0 y@@2) u_1@@0)) (exists_path EG_1@@0 u_1@@0 y@@2)))
 :qid |stdinbpl.741:15|
 :skolemid |93|
 :pattern ( (MapType0Select (inst_uReach_rev EG_1@@0 y@@2) u_1@@0))
 :pattern ( (exists_path EG_1@@0 u_1@@0 y@@2))
)))
(assert (forall ((arg0@@42 T@U) (arg1@@22 T@U) ) (! (= (type (inst_uReach_2 arg0@@42 arg1@@22)) (MapType0Type RefType boolType))
 :qid |funType:inst_uReach_2|
 :pattern ( (inst_uReach_2 arg0@@42 arg1@@22))
)))
(assert (forall ((EG_1@@1 T@U) (x_1 T@U) (v_2@@0 T@U) ) (!  (=> (and (and (= (type EG_1@@1) (MapType0Type EdgeDomainTypeType boolType)) (= (type x_1) RefType)) (= (type v_2@@0) RefType)) (= (U_2_bool (MapType0Select (inst_uReach_2 EG_1@@1 x_1) v_2@@0)) (exists_path_2 EG_1@@1 x_1 v_2@@0)))
 :qid |stdinbpl.747:15|
 :skolemid |94|
 :pattern ( (MapType0Select (inst_uReach_2 EG_1@@1 x_1) v_2@@0))
 :pattern ( (exists_path_2 EG_1@@1 x_1 v_2@@0))
)))
(assert (forall ((arg0@@43 T@U) (arg1@@23 T@U) ) (! (= (type (inst_uReach arg0@@43 arg1@@23)) (MapType0Type RefType boolType))
 :qid |funType:inst_uReach|
 :pattern ( (inst_uReach arg0@@43 arg1@@23))
)))
(assert (forall ((EG_1@@2 T@U) (x_1@@0 T@U) (v_2@@1 T@U) ) (!  (=> (and (and (= (type EG_1@@2) (MapType0Type EdgeDomainTypeType boolType)) (= (type x_1@@0) RefType)) (= (type v_2@@1) RefType)) (= (U_2_bool (MapType0Select (inst_uReach EG_1@@2 x_1@@0) v_2@@1)) (exists_path EG_1@@2 x_1@@0 v_2@@1)))
 :qid |stdinbpl.753:15|
 :skolemid |95|
 :pattern ( (MapType0Select (inst_uReach EG_1@@2 x_1@@0) v_2@@1))
 :pattern ( (exists_path EG_1@@2 x_1@@0 v_2@@1))
)))
(assert (forall ((Heap@@3 T@U) (ExhaleHeap@@1 T@U) (Mask@@2 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@3) (MapType1Type RefType)) (= (type ExhaleHeap@@1) (MapType1Type RefType))) (= (type Mask@@2) (MapType2Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@3 ExhaleHeap@@1 Mask@@2)) (U_2_bool (MapType1Select Heap@@3 o_1 $allocated))) (U_2_bool (MapType1Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.73:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@3 ExhaleHeap@@1 Mask@@2) (MapType1Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert (forall ((arg0@@44 T@U) (arg1@@24 T@U) ) (! (= (type ($$ arg0@@44 arg1@@24)) (MapType0Type EdgeDomainTypeType boolType))
 :qid |funType:$$|
 :pattern ( ($$ arg0@@44 arg1@@24))
)))
(assert (forall ((Heap@@4 T@U) (refs@@1 T@U) ) (!  (=> (and (= (type Heap@@4) (MapType1Type RefType)) (= (type refs@@1) (MapType0Type RefType boolType))) (and (= ($$ Heap@@4 refs@@1) (|$$'| Heap@@4 refs@@1)) (dummyFunction (|$$#triggerStateless| refs@@1))))
 :qid |stdinbpl.836:15|
 :skolemid |109|
 :pattern ( ($$ Heap@@4 refs@@1))
)))
(assert (forall ((a@@6 Int) ) (!  (=> (<= 0 a@@6) (= (|Math#clip| a@@6) a@@6))
 :qid |stdinbpl.521:15|
 :skolemid |54|
 :pattern ( (|Math#clip| a@@6))
)))
(assert (forall ((EG_1@@3 T@U) (u_1@@1 T@U) (v_2@@2 T@U) (w_2 T@U) ) (!  (=> (and (and (and (and (= (type EG_1@@3) (MapType0Type EdgeDomainTypeType boolType)) (= (type u_1@@1) RefType)) (= (type v_2@@2) RefType)) (= (type w_2) RefType)) (and (exists_path_ EG_1@@3 u_1@@1 w_2) (exists_path_ EG_1@@3 w_2 v_2@@2))) (exists_path_ EG_1@@3 u_1@@1 v_2@@2))
 :qid |stdinbpl.789:15|
 :skolemid |102|
 :pattern ( (exists_path EG_1@@3 u_1@@1 w_2) (exists_path EG_1@@3 w_2 v_2@@2))
)))
(assert (forall ((a@@7 T@U) (b@@6 T@U) (o@@0 T@U) ) (! (let ((T@@12 (type o@@0)))
 (=> (and (= (type a@@7) (MultiSetType T@@12)) (= (type b@@6) (MultiSetType T@@12))) (= (|MultiSet#Select| (|MultiSet#Intersection| a@@7 b@@6) o@@0) (|Math#min| (|MultiSet#Select| a@@7 o@@0) (|MultiSet#Select| b@@6 o@@0)))))
 :qid |stdinbpl.572:18|
 :skolemid |69|
 :pattern ( (|MultiSet#Select| (|MultiSet#Intersection| a@@7 b@@6) o@@0))
)))
(assert (forall ((EG_1@@4 T@U) (start_1 T@U) (end_1 T@U) ) (!  (=> (and (and (= (type EG_1@@4) (MapType0Type EdgeDomainTypeType boolType)) (= (type start_1) RefType)) (= (type end_1) RefType)) (= (exists_path_ EG_1@@4 start_1 end_1)  (or (= start_1 end_1) (exists ((w_2@@0 T@U) ) (!  (and (= (type w_2@@0) RefType) (and (edge EG_1@@4 start_1 w_2@@0) (exists_path_ EG_1@@4 w_2@@0 end_1)))
 :qid |stdinbpl.773:78|
 :skolemid |98|
 :pattern ( (edge EG_1@@4 start_1 w_2@@0))
 :pattern ( (exists_path_ EG_1@@4 w_2@@0 end_1))
)))))
 :qid |stdinbpl.771:15|
 :skolemid |99|
 :pattern ( (exists_path EG_1@@4 start_1 end_1))
 :pattern ( (edge EG_1@@4 start_1 end_1))
)))
(assert (forall ((EG_1@@5 T@U) (start_1@@0 T@U) (end_1@@0 T@U) ) (!  (=> (and (and (= (type EG_1@@5) (MapType0Type EdgeDomainTypeType boolType)) (= (type start_1@@0) RefType)) (= (type end_1@@0) RefType)) (= (exists_path_2_ EG_1@@5 start_1@@0 end_1@@0)  (or (= start_1@@0 end_1@@0) (exists ((w_2@@1 T@U) ) (!  (and (= (type w_2@@1) RefType) (and (exists_path_2_ EG_1@@5 start_1@@0 w_2@@1) (edge EG_1@@5 w_2@@1 end_1@@0)))
 :qid |stdinbpl.782:80|
 :skolemid |100|
 :pattern ( (exists_path_2_ EG_1@@5 start_1@@0 w_2@@1))
 :pattern ( (edge EG_1@@5 w_2@@1 end_1@@0))
)))))
 :qid |stdinbpl.780:15|
 :skolemid |101|
 :pattern ( (exists_path_2 EG_1@@5 start_1@@0 end_1@@0))
 :pattern ( (edge EG_1@@5 start_1@@0 end_1@@0))
)))
(assert (forall ((Heap@@5 T@U) (ExhaleHeap@@2 T@U) (Mask@@3 T@U) (o_1@@0 T@U) (f_2 T@U) ) (! (let ((B@@1 (FieldTypeInv1 (type f_2))))
(let ((A@@1 (FieldTypeInv0 (type f_2))))
 (=> (and (and (and (and (and (and (= (type Heap@@5) (MapType1Type RefType)) (= (type ExhaleHeap@@2) (MapType1Type RefType))) (= (type Mask@@3) (MapType2Type RefType realType))) (= (type o_1@@0) RefType)) (= (type f_2) (FieldType A@@1 B@@1))) (IdenticalOnKnownLocations Heap@@5 ExhaleHeap@@2 Mask@@3)) (HasDirectPerm Mask@@3 o_1@@0 f_2)) (= (MapType1Select Heap@@5 o_1@@0 f_2) (MapType1Select ExhaleHeap@@2 o_1@@0 f_2)))))
 :qid |stdinbpl.42:22|
 :skolemid |1|
 :pattern ( (IdenticalOnKnownLocations Heap@@5 ExhaleHeap@@2 Mask@@3) (MapType1Select ExhaleHeap@@2 o_1@@0 f_2))
)))
(assert (forall ((arg0@@45 T@U) (arg1@@25 T@U) ) (! (= (type (create_edge arg0@@45 arg1@@25)) EdgeDomainTypeType)
 :qid |funType:create_edge|
 :pattern ( (create_edge arg0@@45 arg1@@25))
)))
(assert (forall ((EG_1@@6 T@U) (p_2 T@U) (s_1 T@U) ) (!  (=> (and (and (= (type EG_1@@6) (MapType0Type EdgeDomainTypeType boolType)) (= (type p_2) RefType)) (= (type s_1) RefType)) (= (edge_ EG_1@@6 p_2 s_1) (U_2_bool (MapType0Select EG_1@@6 (create_edge p_2 s_1)))))
 :qid |stdinbpl.705:15|
 :skolemid |84|
 :pattern ( (MapType0Select EG_1@@6 (create_edge p_2 s_1)))
 :pattern ( (edge EG_1@@6 p_2 s_1))
)))
(assert  (and (= (type dummyHeap) (MapType1Type RefType)) (= (type ZeroMask) (MapType2Type RefType realType))))
(assert (state dummyHeap ZeroMask))
(assert (forall ((arg0@@46 T@U) (arg1@@26 T@U) ) (! (let ((T@@13 (type arg1@@26)))
(= (type (|MultiSet#UnionOne| arg0@@46 arg1@@26)) (MultiSetType T@@13)))
 :qid |funType:MultiSet#UnionOne|
 :pattern ( (|MultiSet#UnionOne| arg0@@46 arg1@@26))
)))
(assert (forall ((a@@8 T@U) (x@@8 T@U) ) (! (let ((T@@14 (type x@@8)))
 (=> (= (type a@@8) (MultiSetType T@@14)) (= (|MultiSet#Card| (|MultiSet#UnionOne| a@@8 x@@8)) (+ (|MultiSet#Card| a@@8) 1))))
 :qid |stdinbpl.558:18|
 :skolemid |65|
 :pattern ( (|MultiSet#Card| (|MultiSet#UnionOne| a@@8 x@@8)))
 :pattern ( (|MultiSet#UnionOne| a@@8 x@@8) (|MultiSet#Card| a@@8))
)))
(assert (forall ((a@@9 T@U) (b@@7 T@U) ) (! (let ((T@@15 (MultiSetTypeInv0 (type a@@9))))
 (=> (and (= (type a@@9) (MultiSetType T@@15)) (= (type b@@7) (MultiSetType T@@15))) (= (|MultiSet#Disjoint| a@@9 b@@7) (forall ((o@@1 T@U) ) (!  (=> (= (type o@@1) T@@15) (or (= (|MultiSet#Select| a@@9 o@@1) 0) (= (|MultiSet#Select| b@@7 o@@1) 0)))
 :qid |stdinbpl.608:39|
 :skolemid |80|
 :pattern ( (|MultiSet#Select| a@@9 o@@1))
 :pattern ( (|MultiSet#Select| b@@7 o@@1))
)))))
 :qid |stdinbpl.607:18|
 :skolemid |81|
 :pattern ( (|MultiSet#Disjoint| a@@9 b@@7))
)))
(assert (forall ((p T@U) (v_1 T@U) (w T@U) ) (! (let ((A@@2 (FieldTypeInv0 (type p))))
 (=> (and (and (= (type p) (FieldType A@@2 FrameTypeType)) (= (type v_1) FrameTypeType)) (= (type w) FrameTypeType)) (not (InsidePredicate p v_1 p w))))
 :qid |stdinbpl.416:19|
 :skolemid |21|
 :pattern ( (InsidePredicate p v_1 p w))
)))
(assert (forall ((arg0@@47 T@U) ) (! (let ((T@@16 (type arg0@@47)))
(= (type (|MultiSet#Singleton| arg0@@47)) (MultiSetType T@@16)))
 :qid |funType:MultiSet#Singleton|
 :pattern ( (|MultiSet#Singleton| arg0@@47))
)))
(assert (forall ((r@@0 T@U) ) (!  (and (= (|MultiSet#Card| (|MultiSet#Singleton| r@@0)) 1) (= (|MultiSet#Select| (|MultiSet#Singleton| r@@0) r@@0) 1))
 :qid |stdinbpl.550:18|
 :skolemid |62|
 :pattern ( (|MultiSet#Singleton| r@@0))
)))
(assert  (not (IsPredicateField next)))
(assert  (not (IsWandField next)))
(assert (forall ((Heap@@6 T@U) (ExhaleHeap@@3 T@U) (Mask@@4 T@U) ) (!  (=> (and (and (and (= (type Heap@@6) (MapType1Type RefType)) (= (type ExhaleHeap@@3) (MapType1Type RefType))) (= (type Mask@@4) (MapType2Type RefType realType))) (IdenticalOnKnownLocations Heap@@6 ExhaleHeap@@3 Mask@@4)) (succHeap Heap@@6 ExhaleHeap@@3))
 :qid |stdinbpl.83:15|
 :skolemid |10|
 :pattern ( (IdenticalOnKnownLocations Heap@@6 ExhaleHeap@@3 Mask@@4))
)))
(assert (forall ((a@@10 T@U) (b@@8 T@U) ) (! (let ((T@@17 (MapType0TypeInv0 (type a@@10))))
 (=> (and (= (type a@@10) (MapType0Type T@@17 boolType)) (= (type b@@8) (MapType0Type T@@17 boolType))) (= (|Set#Equal| a@@10 b@@8) (forall ((o@@2 T@U) ) (!  (=> (= (type o@@2) T@@17) (= (U_2_bool (MapType0Select a@@10 o@@2)) (U_2_bool (MapType0Select b@@8 o@@2))))
 :qid |stdinbpl.503:31|
 :skolemid |48|
 :pattern ( (MapType0Select a@@10 o@@2))
 :pattern ( (MapType0Select b@@8 o@@2))
)))))
 :qid |stdinbpl.502:17|
 :skolemid |49|
 :pattern ( (|Set#Equal| a@@10 b@@8))
)))
(assert (forall ((ResultMask T@U) (SummandMask1 T@U) (SummandMask2 T@U) (o_2 T@U) (f_4 T@U) ) (! (let ((B@@2 (FieldTypeInv1 (type f_4))))
(let ((A@@3 (FieldTypeInv0 (type f_4))))
 (=> (and (and (and (and (and (= (type ResultMask) (MapType2Type RefType realType)) (= (type SummandMask1) (MapType2Type RefType realType))) (= (type SummandMask2) (MapType2Type RefType realType))) (= (type o_2) RefType)) (= (type f_4) (FieldType A@@3 B@@2))) (sumMask ResultMask SummandMask1 SummandMask2)) (= (U_2_real (MapType2Select ResultMask o_2 f_4)) (+ (U_2_real (MapType2Select SummandMask1 o_2 f_4)) (U_2_real (MapType2Select SummandMask2 o_2 f_4)))))))
 :qid |stdinbpl.138:22|
 :skolemid |18|
 :pattern ( (sumMask ResultMask SummandMask1 SummandMask2) (MapType2Select ResultMask o_2 f_4))
 :pattern ( (sumMask ResultMask SummandMask1 SummandMask2) (MapType2Select SummandMask1 o_2 f_4))
 :pattern ( (sumMask ResultMask SummandMask1 SummandMask2) (MapType2Select SummandMask2 o_2 f_4))
)))
(assert (forall ((a@@11 T@U) (b@@9 T@U) ) (! (let ((T@@18 (MultiSetTypeInv0 (type a@@11))))
 (=> (and (= (type a@@11) (MultiSetType T@@18)) (= (type b@@9) (MultiSetType T@@18))) (= (|MultiSet#Card| (|MultiSet#Union| a@@11 b@@9)) (+ (|MultiSet#Card| a@@11) (|MultiSet#Card| b@@9)))))
 :qid |stdinbpl.568:18|
 :skolemid |68|
 :pattern ( (|MultiSet#Card| (|MultiSet#Union| a@@11 b@@9)))
 :pattern ( (|MultiSet#Card| a@@11) (|MultiSet#Union| a@@11 b@@9))
 :pattern ( (|MultiSet#Card| b@@9) (|MultiSet#Union| a@@11 b@@9))
)))
(assert  (and (forall ((arg0@@48 Real) (arg1@@27 T@U) ) (! (= (type (ConditionalFrame arg0@@48 arg1@@27)) FrameTypeType)
 :qid |funType:ConditionalFrame|
 :pattern ( (ConditionalFrame arg0@@48 arg1@@27))
)) (= (type EmptyFrame) FrameTypeType)))
(assert (forall ((p@@0 Real) (f_6 T@U) ) (!  (=> (= (type f_6) FrameTypeType) (= (ConditionalFrame p@@0 f_6) (ite (> p@@0 0.0) f_6 EmptyFrame)))
 :qid |stdinbpl.404:15|
 :skolemid |19|
 :pattern ( (ConditionalFrame p@@0 f_6))
)))
(assert (forall ((Mask@@5 T@U) (o_2@@0 T@U) (f_4@@0 T@U) ) (! (let ((B@@3 (FieldTypeInv1 (type f_4@@0))))
(let ((A@@4 (FieldTypeInv0 (type f_4@@0))))
 (=> (and (and (= (type Mask@@5) (MapType2Type RefType realType)) (= (type o_2@@0) RefType)) (= (type f_4@@0) (FieldType A@@4 B@@3))) (= (HasDirectPerm Mask@@5 o_2@@0 f_4@@0) (> (U_2_real (MapType2Select Mask@@5 o_2@@0 f_4@@0)) NoPerm)))))
 :qid |stdinbpl.133:22|
 :skolemid |17|
 :pattern ( (HasDirectPerm Mask@@5 o_2@@0 f_4@@0))
)))
(assert (forall ((EG_1@@7 T@U) (Z_1@@0 T@U) (P_1@@0 T@U) ) (!  (=> (and (and (and (and (= (type EG_1@@7) (MapType0Type EdgeDomainTypeType boolType)) (= (type Z_1@@0) (MapType0Type RefType boolType))) (= (type P_1@@0) (MapType0Type RefType boolType))) (apply_IND_2 EG_1@@7 Z_1@@0 P_1@@0)) (and (forall ((z@@1 T@U) ) (!  (=> (and (= (type z@@1) RefType) (U_2_bool (MapType0Select Z_1@@0 z@@1))) (U_2_bool (MapType0Select P_1@@0 z@@1)))
 :qid |stdinbpl.728:51|
 :skolemid |89|
 :pattern ( (MapType0Select Z_1@@0 z@@1))
 :pattern ( (MapType0Select P_1@@0 z@@1))
)) (forall ((u_1@@2 T@U) (v_2@@3 T@U) ) (!  (=> (and (and (= (type u_1@@2) RefType) (= (type v_2@@3) RefType)) (and (edge EG_1@@7 u_1@@2 v_2@@3) (U_2_bool (MapType0Select P_1@@0 v_2@@3)))) (U_2_bool (MapType0Select P_1@@0 u_1@@2)))
 :qid |stdinbpl.731:16|
 :skolemid |90|
 :pattern ( (edge EG_1@@7 u_1@@2 v_2@@3))
 :pattern ( (MapType0Select P_1@@0 u_1@@2) (MapType0Select P_1@@0 v_2@@3))
)))) (forall ((u_1_1@@0 T@U) (z_1@@0 T@U) ) (!  (=> (and (and (= (type u_1_1@@0) RefType) (= (type z_1@@0) RefType)) (and (U_2_bool (MapType0Select Z_1@@0 z_1@@0)) (exists_path_2 EG_1@@7 u_1_1@@0 z_1@@0))) (U_2_bool (MapType0Select P_1@@0 u_1_1@@0)))
 :qid |stdinbpl.734:17|
 :skolemid |91|
 :pattern ( (exists_path_2 EG_1@@7 z_1@@0 u_1_1@@0))
 :pattern ( (MapType0Select Z_1@@0 z_1@@0) (MapType0Select P_1@@0 u_1_1@@0))
)))
 :qid |stdinbpl.726:15|
 :skolemid |92|
 :pattern ( (apply_IND_2 EG_1@@7 Z_1@@0 P_1@@0))
)))
(assert  (and (forall ((arg0@@49 T@U) ) (! (= (type (edge_pred arg0@@49)) RefType)
 :qid |funType:edge_pred|
 :pattern ( (edge_pred arg0@@49))
)) (forall ((arg0@@50 T@U) ) (! (= (type (edge_succ arg0@@50)) RefType)
 :qid |funType:edge_succ|
 :pattern ( (edge_succ arg0@@50))
))))
(assert (forall ((p_2@@0 T@U) (s_1@@0 T@U) ) (!  (=> (and (= (type p_2@@0) RefType) (= (type s_1@@0) RefType)) (and (= (edge_pred (create_edge p_2@@0 s_1@@0)) p_2@@0) (= (edge_succ (create_edge p_2@@0 s_1@@0)) s_1@@0)))
 :qid |stdinbpl.632:15|
 :skolemid |82|
 :pattern ( (create_edge p_2@@0 s_1@@0))
)))
(assert (forall ((o_2@@1 T@U) (f_4@@1 T@U) ) (! (let ((B@@4 (FieldTypeInv1 (type f_4@@1))))
(let ((A@@5 (FieldTypeInv0 (type f_4@@1))))
 (=> (and (= (type o_2@@1) RefType) (= (type f_4@@1) (FieldType A@@5 B@@4))) (= (U_2_real (MapType2Select ZeroMask o_2@@1 f_4@@1)) NoPerm))))
 :qid |stdinbpl.106:22|
 :skolemid |13|
 :pattern ( (MapType2Select ZeroMask o_2@@1 f_4@@1))
)))
(assert (forall ((arg0@@51 T@U) ) (! (= (type (FrameFragment arg0@@51)) FrameTypeType)
 :qid |funType:FrameFragment|
 :pattern ( (FrameFragment arg0@@51))
)))
(assert (forall ((Heap@@7 T@U) (Mask@@6 T@U) (refs@@2 T@U) ) (!  (=> (and (and (and (= (type Heap@@7) (MapType1Type RefType)) (= (type Mask@@6) (MapType2Type RefType realType))) (= (type refs@@2) (MapType0Type RefType boolType))) (and (state Heap@@7 Mask@@6) (or (< AssumeFunctionsAbove 0) (|$$#trigger| (FrameFragment (int_2_U (|$$#condqp1| Heap@@7 refs@@2))) refs@@2)))) (forall ((p_2@@1 T@U) (s_1@@1 T@U) ) (!  (=> (and (= (type p_2@@1) RefType) (= (type s_1@@1) RefType)) (=  (and (U_2_bool (MapType0Select refs@@2 p_2@@1)) (and (U_2_bool (MapType0Select refs@@2 s_1@@1)) (= (MapType1Select Heap@@7 p_2@@1 next) s_1@@1))) (U_2_bool (MapType0Select (|$$'| Heap@@7 refs@@2) (create_edge p_2@@1 s_1@@1)))))
 :qid |stdinbpl.865:122|
 :skolemid |113|
 :pattern ( (create_edge p_2@@1 s_1@@1))
)))
 :qid |stdinbpl.863:15|
 :skolemid |114|
 :pattern ( (state Heap@@7 Mask@@6) (|$$'| Heap@@7 refs@@2))
)))
(assert (forall ((a@@12 T@U) (b@@10 T@U) (o@@3 T@U) ) (! (let ((T@@19 (type o@@3)))
 (=> (and (= (type a@@12) (MapType0Type T@@19 boolType)) (= (type b@@10) (MapType0Type T@@19 boolType))) (= (U_2_bool (MapType0Select (|Set#Intersection| a@@12 b@@10) o@@3))  (and (U_2_bool (MapType0Select a@@12 o@@3)) (U_2_bool (MapType0Select b@@10 o@@3))))))
 :qid |stdinbpl.467:18|
 :skolemid |37|
 :pattern ( (MapType0Select (|Set#Intersection| a@@12 b@@10) o@@3))
 :pattern ( (|Set#Intersection| a@@12 b@@10) (MapType0Select a@@12 o@@3))
 :pattern ( (|Set#Intersection| a@@12 b@@10) (MapType0Select b@@10 o@@3))
)))
(assert (forall ((arg0@@52 T@U) (arg1@@28 T@U) ) (! (let ((T@@20 (MapType0TypeInv0 (type arg0@@52))))
(= (type (|Set#Difference| arg0@@52 arg1@@28)) (MapType0Type T@@20 boolType)))
 :qid |funType:Set#Difference|
 :pattern ( (|Set#Difference| arg0@@52 arg1@@28))
)))
(assert (forall ((a@@13 T@U) (b@@11 T@U) (o@@4 T@U) ) (! (let ((T@@21 (type o@@4)))
 (=> (and (= (type a@@13) (MapType0Type T@@21 boolType)) (= (type b@@11) (MapType0Type T@@21 boolType))) (= (U_2_bool (MapType0Select (|Set#Difference| a@@13 b@@11) o@@4))  (and (U_2_bool (MapType0Select a@@13 o@@4)) (not (U_2_bool (MapType0Select b@@11 o@@4)))))))
 :qid |stdinbpl.482:18|
 :skolemid |43|
 :pattern ( (MapType0Select (|Set#Difference| a@@13 b@@11) o@@4))
 :pattern ( (|Set#Difference| a@@13 b@@11) (MapType0Select a@@13 o@@4))
)))
(assert (forall ((EG_1@@8 T@U) (p_2@@2 T@U) (s_1@@2 T@U) ) (!  (=> (and (and (= (type EG_1@@8) (MapType0Type EdgeDomainTypeType boolType)) (= (type p_2@@2) RefType)) (= (type s_1@@2) RefType)) (= (edge EG_1@@8 p_2@@2 s_1@@2) (edge_ EG_1@@8 p_2@@2 s_1@@2)))
 :qid |stdinbpl.699:15|
 :skolemid |83|
 :pattern ( (edge EG_1@@8 p_2@@2 s_1@@2))
)))
(assert (forall ((EG_1@@9 T@U) (start_1@@1 T@U) (end_1@@1 T@U) ) (!  (=> (and (and (= (type EG_1@@9) (MapType0Type EdgeDomainTypeType boolType)) (= (type start_1@@1) RefType)) (= (type end_1@@1) RefType)) (= (exists_path EG_1@@9 start_1@@1 end_1@@1) (exists_path_ EG_1@@9 start_1@@1 end_1@@1)))
 :qid |stdinbpl.759:15|
 :skolemid |96|
 :pattern ( (exists_path EG_1@@9 start_1@@1 end_1@@1))
)))
(assert (forall ((EG_1@@10 T@U) (start_1@@2 T@U) (end_1@@2 T@U) ) (!  (=> (and (and (= (type EG_1@@10) (MapType0Type EdgeDomainTypeType boolType)) (= (type start_1@@2) RefType)) (= (type end_1@@2) RefType)) (= (exists_path_2 EG_1@@10 start_1@@2 end_1@@2) (exists_path_2_ EG_1@@10 start_1@@2 end_1@@2)))
 :qid |stdinbpl.765:15|
 :skolemid |97|
 :pattern ( (exists_path_2 EG_1@@10 start_1@@2 end_1@@2))
)))
(assert (forall ((a@@14 T@U) (b@@12 T@U) ) (! (let ((T@@22 (MapType0TypeInv0 (type a@@14))))
 (=> (and (and (= (type a@@14) (MapType0Type T@@22 boolType)) (= (type b@@12) (MapType0Type T@@22 boolType))) (|Set#Equal| a@@14 b@@12)) (= a@@14 b@@12)))
 :qid |stdinbpl.504:17|
 :skolemid |50|
 :pattern ( (|Set#Equal| a@@14 b@@12))
)))
(assert (forall ((a@@15 T@U) (b@@13 T@U) ) (! (let ((T@@23 (MultiSetTypeInv0 (type a@@15))))
 (=> (and (and (= (type a@@15) (MultiSetType T@@23)) (= (type b@@13) (MultiSetType T@@23))) (|MultiSet#Equal| a@@15 b@@13)) (= a@@15 b@@13)))
 :qid |stdinbpl.603:17|
 :skolemid |79|
 :pattern ( (|MultiSet#Equal| a@@15 b@@13))
)))
(assert (forall ((arg0@@53 T@U) (arg1@@29 T@U) ) (! (let ((T@@24 (type arg1@@29)))
(= (type (|Set#UnionOne| arg0@@53 arg1@@29)) (MapType0Type T@@24 boolType)))
 :qid |funType:Set#UnionOne|
 :pattern ( (|Set#UnionOne| arg0@@53 arg1@@29))
)))
(assert (forall ((a@@16 T@U) (x@@9 T@U) (y@@3 T@U) ) (! (let ((T@@25 (type x@@9)))
 (=> (and (and (= (type a@@16) (MapType0Type T@@25 boolType)) (= (type y@@3) T@@25)) (U_2_bool (MapType0Select a@@16 y@@3))) (U_2_bool (MapType0Select (|Set#UnionOne| a@@16 x@@9) y@@3))))
 :qid |stdinbpl.447:18|
 :skolemid |31|
 :pattern ( (|Set#UnionOne| a@@16 x@@9) (MapType0Select a@@16 y@@3))
)))
(assert (forall ((a@@17 T@U) (b@@14 T@U) (y@@4 T@U) ) (! (let ((T@@26 (type y@@4)))
 (=> (and (and (= (type a@@17) (MapType0Type T@@26 boolType)) (= (type b@@14) (MapType0Type T@@26 boolType))) (U_2_bool (MapType0Select a@@17 y@@4))) (U_2_bool (MapType0Select (|Set#Union| a@@17 b@@14) y@@4))))
 :qid |stdinbpl.457:18|
 :skolemid |35|
 :pattern ( (|Set#Union| a@@17 b@@14) (MapType0Select a@@17 y@@4))
)))
(assert (forall ((a@@18 T@U) (b@@15 T@U) (y@@5 T@U) ) (! (let ((T@@27 (type y@@5)))
 (=> (and (and (= (type a@@18) (MapType0Type T@@27 boolType)) (= (type b@@15) (MapType0Type T@@27 boolType))) (U_2_bool (MapType0Select b@@15 y@@5))) (U_2_bool (MapType0Select (|Set#Union| a@@18 b@@15) y@@5))))
 :qid |stdinbpl.459:18|
 :skolemid |36|
 :pattern ( (|Set#Union| a@@18 b@@15) (MapType0Select b@@15 y@@5))
)))
(assert (forall ((ms T@U) (x@@10 T@U) ) (! (let ((T@@28 (type x@@10)))
 (=> (= (type ms) (MultiSetType T@@28)) (>= (|MultiSet#Select| ms x@@10) 0)))
 :qid |stdinbpl.534:18|
 :skolemid |56|
 :pattern ( (|MultiSet#Select| ms x@@10))
)))
(assert (forall ((a@@19 T@U) (x@@11 T@U) (o@@5 T@U) ) (! (let ((T@@29 (type x@@11)))
 (=> (and (= (type a@@19) (MapType0Type T@@29 boolType)) (= (type o@@5) T@@29)) (= (U_2_bool (MapType0Select (|Set#UnionOne| a@@19 x@@11) o@@5))  (or (= o@@5 x@@11) (U_2_bool (MapType0Select a@@19 o@@5))))))
 :qid |stdinbpl.443:18|
 :skolemid |29|
 :pattern ( (MapType0Select (|Set#UnionOne| a@@19 x@@11) o@@5))
)))
(assert (forall ((a@@20 T@U) (b@@16 T@U) (y@@6 T@U) ) (! (let ((T@@30 (type y@@6)))
 (=> (and (and (= (type a@@20) (MapType0Type T@@30 boolType)) (= (type b@@16) (MapType0Type T@@30 boolType))) (U_2_bool (MapType0Select b@@16 y@@6))) (not (U_2_bool (MapType0Select (|Set#Difference| a@@20 b@@16) y@@6)))))
 :qid |stdinbpl.484:18|
 :skolemid |44|
 :pattern ( (|Set#Difference| a@@20 b@@16) (MapType0Select b@@16 y@@6))
)))
(assert (forall ((a@@21 T@U) (b@@17 T@U) ) (! (let ((T@@31 (MapType0TypeInv0 (type a@@21))))
 (=> (and (= (type a@@21) (MapType0Type T@@31 boolType)) (= (type b@@17) (MapType0Type T@@31 boolType))) (and (= (+ (+ (|Set#Card| (|Set#Difference| a@@21 b@@17)) (|Set#Card| (|Set#Difference| b@@17 a@@21))) (|Set#Card| (|Set#Intersection| a@@21 b@@17))) (|Set#Card| (|Set#Union| a@@21 b@@17))) (= (|Set#Card| (|Set#Difference| a@@21 b@@17)) (- (|Set#Card| a@@21) (|Set#Card| (|Set#Intersection| a@@21 b@@17)))))))
 :qid |stdinbpl.486:18|
 :skolemid |45|
 :pattern ( (|Set#Card| (|Set#Difference| a@@21 b@@17)))
)))
(assert (forall ((s T@U) ) (! (let ((T@@32 (MapType0TypeInv0 (type s))))
 (=> (= (type s) (MapType0Type T@@32 boolType)) (<= 0 (|Set#Card| s))))
 :qid |stdinbpl.429:18|
 :skolemid |22|
 :pattern ( (|Set#Card| s))
)))
(assert (forall ((s@@0 T@U) ) (! (let ((T@@33 (MultiSetTypeInv0 (type s@@0))))
 (=> (= (type s@@0) (MultiSetType T@@33)) (<= 0 (|MultiSet#Card| s@@0))))
 :qid |stdinbpl.537:18|
 :skolemid |57|
 :pattern ( (|MultiSet#Card| s@@0))
)))
(assert (forall ((T@@34 T@T) ) (! (= (type (|MultiSet#Empty| T@@34)) (MultiSetType T@@34))
 :qid |funType:MultiSet#Empty|
 :pattern ( (|MultiSet#Empty| T@@34))
)))
(assert (forall ((o@@6 T@U) ) (! (let ((T@@35 (type o@@6)))
(= (|MultiSet#Select| (|MultiSet#Empty| T@@35) o@@6) 0))
 :qid |stdinbpl.542:18|
 :skolemid |58|
 :pattern ( (let ((T@@35 (type o@@6)))
(|MultiSet#Select| (|MultiSet#Empty| T@@35) o@@6)))
)))
(assert (forall ((a@@22 T@U) (x@@12 T@U) ) (! (let ((T@@36 (type x@@12)))
 (=> (= (type a@@22) (MapType0Type T@@36 boolType)) (U_2_bool (MapType0Select (|Set#UnionOne| a@@22 x@@12) x@@12))))
 :qid |stdinbpl.445:18|
 :skolemid |30|
 :pattern ( (|Set#UnionOne| a@@22 x@@12))
)))
(assert (forall ((EG_1@@11 T@U) ) (!  (=> (= (type EG_1@@11) (MapType0Type EdgeDomainTypeType boolType)) (= (func_graph EG_1@@11) (forall ((v1 T@U) (v2 T@U) (v_2@@4 T@U) ) (!  (=> (and (and (and (= (type v1) RefType) (= (type v2) RefType)) (= (type v_2@@4) RefType)) (and (edge EG_1@@11 v_2@@4 v1) (edge EG_1@@11 v_2@@4 v2))) (= v1 v2))
 :qid |stdinbpl.797:39|
 :skolemid |103|
 :pattern ( (edge EG_1@@11 v_2@@4 v1) (edge EG_1@@11 v_2@@4 v2))
))))
 :qid |stdinbpl.795:15|
 :skolemid |104|
 :pattern ( (func_graph EG_1@@11))
)))
(assert (forall ((EG_1@@12 T@U) ) (!  (=> (= (type EG_1@@12) (MapType0Type EdgeDomainTypeType boolType)) (= (unshared_graph EG_1@@12) (forall ((v1@@0 T@U) (v2@@0 T@U) (v_2@@5 T@U) ) (!  (=> (and (and (and (= (type v1@@0) RefType) (= (type v2@@0) RefType)) (= (type v_2@@5) RefType)) (and (edge EG_1@@12 v1@@0 v_2@@5) (edge EG_1@@12 v2@@0 v_2@@5))) (= v1@@0 v2@@0))
 :qid |stdinbpl.806:43|
 :skolemid |105|
 :pattern ( (edge EG_1@@12 v1@@0 v_2@@5) (edge EG_1@@12 v2@@0 v_2@@5))
))))
 :qid |stdinbpl.804:15|
 :skolemid |106|
 :pattern ( (unshared_graph EG_1@@12))
)))
(assert (forall ((Heap@@8 T@U) (ExhaleHeap@@4 T@U) (Mask@@7 T@U) (pm_f@@1 T@U) ) (! (let ((C@@1 (FieldTypeInv0 (type pm_f@@1))))
 (=> (and (and (and (and (and (= (type Heap@@8) (MapType1Type RefType)) (= (type ExhaleHeap@@4) (MapType1Type RefType))) (= (type Mask@@7) (MapType2Type RefType realType))) (= (type pm_f@@1) (FieldType C@@1 FrameTypeType))) (IdenticalOnKnownLocations Heap@@8 ExhaleHeap@@4 Mask@@7)) (and (HasDirectPerm Mask@@7 null pm_f@@1) (IsPredicateField pm_f@@1))) (forall ((o2 T@U) (f_2@@0 T@U) ) (! (let ((B@@5 (FieldTypeInv1 (type f_2@@0))))
(let ((A@@6 (FieldTypeInv0 (type f_2@@0))))
 (=> (and (and (= (type o2) RefType) (= (type f_2@@0) (FieldType A@@6 B@@5))) (U_2_bool (MapType2Select (MapType1Select Heap@@8 null (PredicateMaskField pm_f@@1)) o2 f_2@@0))) (= (MapType1Select Heap@@8 o2 f_2@@0) (MapType1Select ExhaleHeap@@4 o2 f_2@@0)))))
 :qid |stdinbpl.54:134|
 :skolemid |3|
 :pattern ( (MapType1Select ExhaleHeap@@4 o2 f_2@@0))
))))
 :qid |stdinbpl.52:19|
 :skolemid |4|
 :pattern ( (IdenticalOnKnownLocations Heap@@8 ExhaleHeap@@4 Mask@@7) (IsPredicateField pm_f@@1))
)))
(assert (forall ((Heap@@9 T@U) (ExhaleHeap@@5 T@U) (Mask@@8 T@U) (pm_f@@2 T@U) ) (! (let ((C@@2 (FieldTypeInv0 (type pm_f@@2))))
 (=> (and (and (and (and (and (= (type Heap@@9) (MapType1Type RefType)) (= (type ExhaleHeap@@5) (MapType1Type RefType))) (= (type Mask@@8) (MapType2Type RefType realType))) (= (type pm_f@@2) (FieldType C@@2 FrameTypeType))) (IdenticalOnKnownLocations Heap@@9 ExhaleHeap@@5 Mask@@8)) (and (HasDirectPerm Mask@@8 null pm_f@@2) (IsWandField pm_f@@2))) (forall ((o2@@0 T@U) (f_2@@1 T@U) ) (! (let ((B@@6 (FieldTypeInv1 (type f_2@@1))))
(let ((A@@7 (FieldTypeInv0 (type f_2@@1))))
 (=> (and (and (= (type o2@@0) RefType) (= (type f_2@@1) (FieldType A@@7 B@@6))) (U_2_bool (MapType2Select (MapType1Select Heap@@9 null (WandMaskField pm_f@@2)) o2@@0 f_2@@1))) (= (MapType1Select Heap@@9 o2@@0 f_2@@1) (MapType1Select ExhaleHeap@@5 o2@@0 f_2@@1)))))
 :qid |stdinbpl.67:129|
 :skolemid |6|
 :pattern ( (MapType1Select ExhaleHeap@@5 o2@@0 f_2@@1))
))))
 :qid |stdinbpl.65:19|
 :skolemid |7|
 :pattern ( (IdenticalOnKnownLocations Heap@@9 ExhaleHeap@@5 Mask@@8) (IsWandField pm_f@@2))
)))
(assert (forall ((a@@23 T@U) (x@@13 T@U) ) (! (let ((T@@37 (type x@@13)))
 (=> (and (= (type a@@23) (MapType0Type T@@37 boolType)) (U_2_bool (MapType0Select a@@23 x@@13))) (= (|Set#Card| (|Set#UnionOne| a@@23 x@@13)) (|Set#Card| a@@23))))
 :qid |stdinbpl.449:18|
 :skolemid |32|
 :pattern ( (|Set#Card| (|Set#UnionOne| a@@23 x@@13)))
)))
(assert (forall ((a@@24 T@U) (x@@14 T@U) ) (! (let ((T@@38 (type x@@14)))
 (=> (= (type a@@24) (MultiSetType T@@38)) (and (> (|MultiSet#Select| (|MultiSet#UnionOne| a@@24 x@@14) x@@14) 0) (> (|MultiSet#Card| (|MultiSet#UnionOne| a@@24 x@@14)) 0))))
 :qid |stdinbpl.561:18|
 :skolemid |66|
 :pattern ( (|MultiSet#UnionOne| a@@24 x@@14))
)))
(assert (forall ((r@@1 T@U) ) (! (= (|Set#Card| (|Set#Singleton| r@@1)) 1)
 :qid |stdinbpl.440:18|
 :skolemid |28|
 :pattern ( (|Set#Card| (|Set#Singleton| r@@1)))
)))
(assert (forall ((Mask@@9 T@U) (o_2@@2 T@U) (f_4@@2 T@U) ) (! (let ((B@@7 (FieldTypeInv1 (type f_4@@2))))
(let ((A@@8 (FieldTypeInv0 (type f_4@@2))))
 (=> (and (and (and (= (type Mask@@9) (MapType2Type RefType realType)) (= (type o_2@@2) RefType)) (= (type f_4@@2) (FieldType A@@8 B@@7))) (GoodMask Mask@@9)) (and (>= (U_2_real (MapType2Select Mask@@9 o_2@@2 f_4@@2)) NoPerm) (=> (and (and (GoodMask Mask@@9) (not (IsPredicateField f_4@@2))) (not (IsWandField f_4@@2))) (<= (U_2_real (MapType2Select Mask@@9 o_2@@2 f_4@@2)) FullPerm))))))
 :qid |stdinbpl.128:22|
 :skolemid |16|
 :pattern ( (GoodMask Mask@@9) (MapType2Select Mask@@9 o_2@@2 f_4@@2))
)))
(assert (forall ((r@@2 T@U) ) (! (U_2_bool (MapType0Select (|Set#Singleton| r@@2) r@@2))
 :qid |stdinbpl.438:18|
 :skolemid |26|
 :pattern ( (|Set#Singleton| r@@2))
)))
(assert (forall ((a@@25 T@U) (b@@18 T@U) ) (! (let ((T@@39 (MapType0TypeInv0 (type a@@25))))
 (=> (and (= (type a@@25) (MapType0Type T@@39 boolType)) (= (type b@@18) (MapType0Type T@@39 boolType))) (= (|Set#Union| a@@25 (|Set#Union| a@@25 b@@18)) (|Set#Union| a@@25 b@@18))))
 :qid |stdinbpl.472:18|
 :skolemid |39|
 :pattern ( (|Set#Union| a@@25 (|Set#Union| a@@25 b@@18)))
)))
(assert (forall ((a@@26 T@U) (b@@19 T@U) ) (! (let ((T@@40 (MapType0TypeInv0 (type a@@26))))
 (=> (and (= (type a@@26) (MapType0Type T@@40 boolType)) (= (type b@@19) (MapType0Type T@@40 boolType))) (= (|Set#Intersection| a@@26 (|Set#Intersection| a@@26 b@@19)) (|Set#Intersection| a@@26 b@@19))))
 :qid |stdinbpl.476:18|
 :skolemid |41|
 :pattern ( (|Set#Intersection| a@@26 (|Set#Intersection| a@@26 b@@19)))
)))
(assert (forall ((a@@27 T@U) (b@@20 T@U) ) (! (let ((T@@41 (MultiSetTypeInv0 (type a@@27))))
 (=> (and (= (type a@@27) (MultiSetType T@@41)) (= (type b@@20) (MultiSetType T@@41))) (= (|MultiSet#Intersection| a@@27 (|MultiSet#Intersection| a@@27 b@@20)) (|MultiSet#Intersection| a@@27 b@@20))))
 :qid |stdinbpl.578:18|
 :skolemid |71|
 :pattern ( (|MultiSet#Intersection| a@@27 (|MultiSet#Intersection| a@@27 b@@20)))
)))
(assert (forall ((s@@1 T@U) ) (! (let ((T@@42 (MultiSetTypeInv0 (type s@@1))))
 (=> (= (type s@@1) (MultiSetType T@@42)) (and (= (= (|MultiSet#Card| s@@1) 0) (= s@@1 (|MultiSet#Empty| T@@42))) (=> (not (= (|MultiSet#Card| s@@1) 0)) (exists ((x@@15 T@U) ) (!  (and (= (type x@@15) T@@42) (< 0 (|MultiSet#Select| s@@1 x@@15)))
 :qid |stdinbpl.545:38|
 :skolemid |59|
 :no-pattern (type x@@15)
 :no-pattern (U_2_int x@@15)
 :no-pattern (U_2_bool x@@15)
))))))
 :qid |stdinbpl.543:18|
 :skolemid |60|
 :pattern ( (|MultiSet#Card| s@@1))
)))
(assert (forall ((r@@3 T@U) (o@@7 T@U) ) (! (let ((T@@43 (type r@@3)))
 (=> (= (type o@@7) T@@43) (and (= (= (|MultiSet#Select| (|MultiSet#Singleton| r@@3) o@@7) 1) (= r@@3 o@@7)) (= (= (|MultiSet#Select| (|MultiSet#Singleton| r@@3) o@@7) 0) (not (= r@@3 o@@7))))))
 :qid |stdinbpl.548:18|
 :skolemid |61|
 :pattern ( (|MultiSet#Select| (|MultiSet#Singleton| r@@3) o@@7))
)))
(assert (forall ((o@@8 T@U) (f T@U) (Heap@@10 T@U) ) (!  (=> (and (and (and (= (type o@@8) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap@@10) (MapType1Type RefType))) (U_2_bool (MapType1Select Heap@@10 o@@8 $allocated))) (U_2_bool (MapType1Select Heap@@10 (MapType1Select Heap@@10 o@@8 f) $allocated)))
 :qid |stdinbpl.31:15|
 :skolemid |0|
 :pattern ( (MapType1Select Heap@@10 o@@8 f))
)))
(assert (forall ((a@@28 T@U) (b@@21 T@U) (o@@9 T@U) ) (! (let ((T@@44 (type o@@9)))
 (=> (and (= (type a@@28) (MultiSetType T@@44)) (= (type b@@21) (MultiSetType T@@44))) (= (|MultiSet#Select| (|MultiSet#Union| a@@28 b@@21) o@@9) (+ (|MultiSet#Select| a@@28 o@@9) (|MultiSet#Select| b@@21 o@@9)))))
 :qid |stdinbpl.566:18|
 :skolemid |67|
 :pattern ( (|MultiSet#Select| (|MultiSet#Union| a@@28 b@@21) o@@9))
 :pattern ( (|MultiSet#Union| a@@28 b@@21) (|MultiSet#Select| a@@28 o@@9) (|MultiSet#Select| b@@21 o@@9))
)))
(assert (forall ((T@@45 T@T) ) (! (= (type (|Set#Empty| T@@45)) (MapType0Type T@@45 boolType))
 :qid |funType:Set#Empty|
 :pattern ( (|Set#Empty| T@@45))
)))
(assert (forall ((o@@10 T@U) ) (! (let ((T@@46 (type o@@10)))
 (not (U_2_bool (MapType0Select (|Set#Empty| T@@46) o@@10))))
 :qid |stdinbpl.432:18|
 :skolemid |23|
 :pattern ( (let ((T@@46 (type o@@10)))
(MapType0Select (|Set#Empty| T@@46) o@@10)))
)))
(assert (forall ((r@@4 T@U) ) (! (let ((T@@47 (type r@@4)))
(= (|MultiSet#Singleton| r@@4) (|MultiSet#UnionOne| (|MultiSet#Empty| T@@47) r@@4)))
 :qid |stdinbpl.551:18|
 :skolemid |63|
 :pattern ( (|MultiSet#Singleton| r@@4))
)))
(assert (forall ((a@@29 Int) (b@@22 Int) ) (! (= (<= a@@29 b@@22) (= (|Math#min| a@@29 b@@22) a@@29))
 :qid |stdinbpl.516:15|
 :skolemid |51|
 :pattern ( (|Math#min| a@@29 b@@22))
)))
(assert (forall ((a@@30 Int) (b@@23 Int) ) (! (= (<= b@@23 a@@30) (= (|Math#min| a@@30 b@@23) b@@23))
 :qid |stdinbpl.517:15|
 :skolemid |52|
 :pattern ( (|Math#min| a@@30 b@@23))
)))
(assert (forall ((s@@2 T@U) ) (! (let ((T@@48 (MapType0TypeInv0 (type s@@2))))
 (=> (= (type s@@2) (MapType0Type T@@48 boolType)) (and (= (= (|Set#Card| s@@2) 0) (= s@@2 (|Set#Empty| T@@48))) (=> (not (= (|Set#Card| s@@2) 0)) (exists ((x@@16 T@U) ) (!  (and (= (type x@@16) T@@48) (U_2_bool (MapType0Select s@@2 x@@16)))
 :qid |stdinbpl.435:33|
 :skolemid |24|
 :no-pattern (type x@@16)
 :no-pattern (U_2_int x@@16)
 :no-pattern (U_2_bool x@@16)
))))))
 :qid |stdinbpl.433:18|
 :skolemid |25|
 :pattern ( (|Set#Card| s@@2))
)))
(assert (forall ((arg0@@54 T@U) (arg1@@30 T@U) ) (! (= (type (|$$#frame| arg0@@54 arg1@@30)) (MapType0Type EdgeDomainTypeType boolType))
 :qid |funType:$$#frame|
 :pattern ( (|$$#frame| arg0@@54 arg1@@30))
)))
(assert (forall ((Heap@@11 T@U) (Mask@@10 T@U) (refs@@3 T@U) ) (!  (=> (and (and (and (= (type Heap@@11) (MapType1Type RefType)) (= (type Mask@@10) (MapType2Type RefType realType))) (= (type refs@@3) (MapType0Type RefType boolType))) (state Heap@@11 Mask@@10)) (= (|$$'| Heap@@11 refs@@3) (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| Heap@@11 refs@@3))) refs@@3)))
 :qid |stdinbpl.847:15|
 :skolemid |111|
 :pattern ( (state Heap@@11 Mask@@10) (|$$'| Heap@@11 refs@@3))
)))
(assert (forall ((Heap@@12 T@U) (o@@11 T@U) (f_3 T@U) (v T@U) ) (! (let ((B@@8 (type v)))
(let ((A@@9 (FieldTypeInv0 (type f_3))))
 (=> (and (and (= (type Heap@@12) (MapType1Type RefType)) (= (type o@@11) RefType)) (= (type f_3) (FieldType A@@9 B@@8))) (succHeap Heap@@12 (MapType1Store Heap@@12 o@@11 f_3 v)))))
 :qid |stdinbpl.78:22|
 :skolemid |9|
 :pattern ( (MapType1Store Heap@@12 o@@11 f_3 v))
)))
(assert (forall ((a@@31 T@U) (b@@24 T@U) ) (! (let ((T@@49 (MapType0TypeInv0 (type a@@31))))
 (=> (and (= (type a@@31) (MapType0Type T@@49 boolType)) (= (type b@@24) (MapType0Type T@@49 boolType))) (= (|Set#Subset| a@@31 b@@24) (forall ((o@@12 T@U) ) (!  (=> (and (= (type o@@12) T@@49) (U_2_bool (MapType0Select a@@31 o@@12))) (U_2_bool (MapType0Select b@@24 o@@12)))
 :qid |stdinbpl.495:32|
 :skolemid |46|
 :pattern ( (MapType0Select a@@31 o@@12))
 :pattern ( (MapType0Select b@@24 o@@12))
)))))
 :qid |stdinbpl.494:17|
 :skolemid |47|
 :pattern ( (|Set#Subset| a@@31 b@@24))
)))
(assert (forall ((a@@32 T@U) (x@@17 T@U) ) (! (let ((T@@50 (type x@@17)))
 (=> (and (= (type a@@32) (MapType0Type T@@50 boolType)) (not (U_2_bool (MapType0Select a@@32 x@@17)))) (= (|Set#Card| (|Set#UnionOne| a@@32 x@@17)) (+ (|Set#Card| a@@32) 1))))
 :qid |stdinbpl.451:18|
 :skolemid |33|
 :pattern ( (|Set#Card| (|Set#UnionOne| a@@32 x@@17)))
)))
(assert (forall ((a@@33 T@U) (b@@25 T@U) (o@@13 T@U) ) (! (let ((T@@51 (type o@@13)))
 (=> (and (= (type a@@33) (MultiSetType T@@51)) (= (type b@@25) (MultiSetType T@@51))) (= (|MultiSet#Select| (|MultiSet#Difference| a@@33 b@@25) o@@13) (|Math#clip| (- (|MultiSet#Select| a@@33 o@@13) (|MultiSet#Select| b@@25 o@@13))))))
 :qid |stdinbpl.583:18|
 :skolemid |72|
 :pattern ( (|MultiSet#Select| (|MultiSet#Difference| a@@33 b@@25) o@@13))
)))
(assert (= (type ZeroPMask) (MapType2Type RefType boolType)))
(assert (forall ((o_2@@3 T@U) (f_4@@3 T@U) ) (! (let ((B@@9 (FieldTypeInv1 (type f_4@@3))))
(let ((A@@10 (FieldTypeInv0 (type f_4@@3))))
 (=> (and (= (type o_2@@3) RefType) (= (type f_4@@3) (FieldType A@@10 B@@9))) (not (U_2_bool (MapType2Select ZeroPMask o_2@@3 f_4@@3))))))
 :qid |stdinbpl.112:22|
 :skolemid |14|
 :pattern ( (MapType2Select ZeroPMask o_2@@3 f_4@@3))
)))
(assert (forall ((p@@1 T@U) (v_1@@0 T@U) (q T@U) (w@@0 T@U) (r@@5 T@U) (u T@U) ) (! (let ((C@@3 (FieldTypeInv0 (type r@@5))))
(let ((B@@10 (FieldTypeInv0 (type q))))
(let ((A@@11 (FieldTypeInv0 (type p@@1))))
 (=> (and (and (and (and (and (and (= (type p@@1) (FieldType A@@11 FrameTypeType)) (= (type v_1@@0) FrameTypeType)) (= (type q) (FieldType B@@10 FrameTypeType))) (= (type w@@0) FrameTypeType)) (= (type r@@5) (FieldType C@@3 FrameTypeType))) (= (type u) FrameTypeType)) (and (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r@@5 u))) (InsidePredicate p@@1 v_1@@0 r@@5 u)))))
 :qid |stdinbpl.411:25|
 :skolemid |20|
 :pattern ( (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r@@5 u))
)))
(assert (forall ((a@@34 Int) ) (!  (=> (< a@@34 0) (= (|Math#clip| a@@34) 0))
 :qid |stdinbpl.522:15|
 :skolemid |55|
 :pattern ( (|Math#clip| a@@34))
)))
(assert (forall ((EG_1@@13 T@U) ) (!  (=> (= (type EG_1@@13) (MapType0Type EdgeDomainTypeType boolType)) (= (acyclic_graph EG_1@@13) (forall ((v1@@1 T@U) (v2@@1 T@U) ) (!  (=> (and (= (type v1@@1) RefType) (= (type v2@@1) RefType)) (or (not (edge EG_1@@13 v1@@1 v2@@1)) (not (exists_path EG_1@@13 v2@@1 v1@@1))))
 :qid |stdinbpl.815:42|
 :skolemid |107|
 :pattern ( (edge EG_1@@13 v1@@1 v2@@1))
 :pattern ( (exists_path EG_1@@13 v2@@1 v1@@1))
))))
 :qid |stdinbpl.813:15|
 :skolemid |108|
 :pattern ( (acyclic_graph EG_1@@13))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
(assert (forall ((a@@35 T@U) (x@@18 T@U) (o@@14 T@U) ) (! (let ((T@@52 (type x@@18)))
 (=> (and (= (type a@@35) (MultiSetType T@@52)) (= (type o@@14) T@@52)) (= (|MultiSet#Select| (|MultiSet#UnionOne| a@@35 x@@18) o@@14) (ite (= x@@18 o@@14) (+ (|MultiSet#Select| a@@35 o@@14) 1) (|MultiSet#Select| a@@35 o@@14)))))
 :qid |stdinbpl.555:18|
 :skolemid |64|
 :pattern ( (|MultiSet#Select| (|MultiSet#UnionOne| a@@35 x@@18) o@@14))
 :pattern ( (|MultiSet#UnionOne| a@@35 x@@18) (|MultiSet#Select| a@@35 o@@14))
)))
(assert (forall ((a@@36 T@U) (b@@26 T@U) ) (! (let ((T@@53 (MultiSetTypeInv0 (type a@@36))))
 (=> (and (= (type a@@36) (MultiSetType T@@53)) (= (type b@@26) (MultiSetType T@@53))) (= (|MultiSet#Equal| a@@36 b@@26) (forall ((o@@15 T@U) ) (!  (=> (= (type o@@15) T@@53) (= (|MultiSet#Select| a@@36 o@@15) (|MultiSet#Select| b@@26 o@@15)))
 :qid |stdinbpl.601:36|
 :skolemid |77|
 :pattern ( (|MultiSet#Select| a@@36 o@@15))
 :pattern ( (|MultiSet#Select| b@@26 o@@15))
)))))
 :qid |stdinbpl.600:17|
 :skolemid |78|
 :pattern ( (|MultiSet#Equal| a@@36 b@@26))
)))
(assert (forall ((a@@37 T@U) (b@@27 T@U) ) (! (let ((T@@54 (MultiSetTypeInv0 (type a@@37))))
 (=> (and (= (type a@@37) (MultiSetType T@@54)) (= (type b@@27) (MultiSetType T@@54))) (= (|MultiSet#Subset| a@@37 b@@27) (forall ((o@@16 T@U) ) (!  (=> (= (type o@@16) T@@54) (<= (|MultiSet#Select| a@@37 o@@16) (|MultiSet#Select| b@@27 o@@16)))
 :qid |stdinbpl.597:37|
 :skolemid |75|
 :pattern ( (|MultiSet#Select| a@@37 o@@16))
 :pattern ( (|MultiSet#Select| b@@27 o@@16))
)))))
 :qid |stdinbpl.596:17|
 :skolemid |76|
 :pattern ( (|MultiSet#Subset| a@@37 b@@27))
)))
(assert (forall ((a@@38 T@U) (b@@28 T@U) (o@@17 T@U) ) (! (let ((T@@55 (type o@@17)))
 (=> (and (= (type a@@38) (MapType0Type T@@55 boolType)) (= (type b@@28) (MapType0Type T@@55 boolType))) (= (U_2_bool (MapType0Select (|Set#Union| a@@38 b@@28) o@@17))  (or (U_2_bool (MapType0Select a@@38 o@@17)) (U_2_bool (MapType0Select b@@28 o@@17))))))
 :qid |stdinbpl.455:18|
 :skolemid |34|
 :pattern ( (MapType0Select (|Set#Union| a@@38 b@@28) o@@17))
)))
(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun neverTriggered57 (T@U) Bool)
(declare-fun g () T@U)
(declare-fun ExhaleHeap@4 () T@U)
(declare-fun QPMask@31 () T@U)
(declare-fun QPMask@25 () T@U)
(declare-fun neverTriggered58 (T@U) Bool)
(declare-fun QPMask@32 () T@U)
(declare-fun neverTriggered56 (T@U) Bool)
(declare-fun QPMask@30 () T@U)
(declare-fun last@0 () T@U)
(declare-fun x_1@@1 () T@U)
(declare-fun neverTriggered55 (T@U) Bool)
(declare-fun QPMask@29 () T@U)
(declare-fun old_g@0 () T@U)
(declare-fun neverTriggered54 (T@U) Bool)
(declare-fun QPMask@28 () T@U)
(declare-fun neverTriggered53 (T@U) Bool)
(declare-fun QPMask@27 () T@U)
(declare-fun neverTriggered52 (T@U) Bool)
(declare-fun QPMask@26 () T@U)
(declare-fun y@@7 () T@U)
(declare-fun neverTriggered51 (T@U) Bool)
(declare-fun QPMask@34 () T@U)
(declare-fun neverTriggered50 (T@U) Bool)
(declare-fun QPMask@33 () T@U)
(declare-fun n_13 () T@U)
(declare-fun neverTriggered49 (T@U) Bool)
(declare-fun QPMask@36 () T@U)
(declare-fun neverTriggered48 (T@U) Bool)
(declare-fun QPMask@35 () T@U)
(declare-fun n_11 () T@U)
(declare-fun n$2_7 () T@U)
(declare-fun qpRange47 (T@U) Bool)
(declare-fun invRecv47 (T@U) T@U)
(declare-fun QPMask@5 () T@U)
(declare-fun neverTriggered61 (T@U) Bool)
(declare-fun QPMask@21 () T@U)
(declare-fun QPMask@6 () T@U)
(declare-fun neverTriggered60 (T@U) Bool)
(declare-fun QPMask@20 () T@U)
(declare-fun neverTriggered63 (T@U) Bool)
(declare-fun QPMask@23 () T@U)
(declare-fun neverTriggered62 (T@U) Bool)
(declare-fun QPMask@22 () T@U)
(declare-fun last@2 () T@U)
(declare-fun n_33 () T@U)
(declare-fun n_31 () T@U)
(declare-fun n$2_5_1 () T@U)
(declare-fun neverTriggered64 (T@U) Bool)
(declare-fun QPMask@24 () T@U)
(declare-fun qpRange64 (T@U) Bool)
(declare-fun invRecv64 (T@U) T@U)
(declare-fun qpRange59 (T@U) Bool)
(declare-fun invRecv59 (T@U) T@U)
(declare-fun neverTriggered77 (T@U) Bool)
(declare-fun Heap@0 () T@U)
(declare-fun QPMask@13 () T@U)
(declare-fun Mask@0 () T@U)
(declare-fun u_10 () T@U)
(declare-fun v_7 () T@U)
(declare-fun last@1 () T@U)
(declare-fun neverTriggered76 (T@U) Bool)
(declare-fun QPMask@14 () T@U)
(declare-fun u_7 () T@U)
(declare-fun neverTriggered75 (T@U) Bool)
(declare-fun QPMask@12 () T@U)
(declare-fun neverTriggered74 (T@U) Bool)
(declare-fun QPMask@11 () T@U)
(declare-fun neverTriggered73 (T@U) Bool)
(declare-fun QPMask@10 () T@U)
(declare-fun ExhaleHeap@5 () T@U)
(declare-fun QPMask@9 () T@U)
(declare-fun Heap@@13 () T@U)
(declare-fun QPMask@0 () T@U)
(declare-fun u_4 () T@U)
(declare-fun v_4_1 () T@U)
(declare-fun neverTriggered72 (T@U) Bool)
(declare-fun QPMask@16 () T@U)
(declare-fun u_3 () T@U)
(declare-fun v_4 () T@U)
(declare-fun neverTriggered71 (T@U) Bool)
(declare-fun QPMask@15 () T@U)
(declare-fun u_1_1@@1 () T@U)
(declare-fun w_1_1 () T@U)
(declare-fun v_1_1 () T@U)
(declare-fun neverTriggered70 (T@U) Bool)
(declare-fun QPMask@19 () T@U)
(declare-fun u_2 () T@U)
(declare-fun w_3 () T@U)
(declare-fun neverTriggered69 (T@U) Bool)
(declare-fun QPMask@18 () T@U)
(declare-fun v_3 () T@U)
(declare-fun neverTriggered68 (T@U) Bool)
(declare-fun QPMask@17 () T@U)
(declare-fun QPMask@8 () T@U)
(declare-fun qpRange67 (T@U) Bool)
(declare-fun invRecv67 (T@U) T@U)
(declare-fun n$0_10_1 () T@U)
(declare-fun neverTriggered66 (T@U) Bool)
(declare-fun QPMask@7 () T@U)
(declare-fun qpRange66 (T@U) Bool)
(declare-fun invRecv66 (T@U) T@U)
(declare-fun qpRange65 (T@U) Bool)
(declare-fun invRecv65 (T@U) T@U)
(declare-fun n_12 () T@U)
(declare-fun n_10_1 () T@U)
(declare-fun n$2_6 () T@U)
(declare-fun neverTriggered46 (T@U) Bool)
(declare-fun qpRange46 (T@U) Bool)
(declare-fun invRecv46 (T@U) T@U)
(declare-fun neverTriggered45 (T@U) Bool)
(declare-fun QPMask@4 () T@U)
(declare-fun neverTriggered44 (T@U) Bool)
(declare-fun QPMask@3 () T@U)
(declare-fun neverTriggered43 (T@U) Bool)
(declare-fun QPMask@2 () T@U)
(declare-fun neverTriggered42 (T@U) Bool)
(declare-fun QPMask@1 () T@U)
(declare-fun neverTriggered41 (T@U) Bool)
(declare-fun QPMask@38 () T@U)
(declare-fun neverTriggered40 (T@U) Bool)
(declare-fun QPMask@37 () T@U)
(declare-fun n_10 () T@U)
(declare-fun neverTriggered39 (T@U) Bool)
(declare-fun QPMask@40 () T@U)
(declare-fun neverTriggered38 (T@U) Bool)
(declare-fun QPMask@39 () T@U)
(declare-fun n () T@U)
(declare-fun n$0_13 () T@U)
(declare-fun qpRange37 (T@U) Bool)
(declare-fun invRecv37 (T@U) T@U)
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (= (type g) (MapType0Type RefType boolType)) (= (type n$0_13) RefType)) (= (type Heap@@13) (MapType1Type RefType))) (= (type QPMask@0) (MapType2Type RefType realType))) (= (type n) RefType)) (= (type QPMask@39) (MapType2Type RefType realType))) (= (type x_1@@1) RefType)) (= (type QPMask@40) (MapType2Type RefType realType))) (= (type n_10) RefType)) (= (type QPMask@37) (MapType2Type RefType realType))) (= (type QPMask@38) (MapType2Type RefType realType))) (= (type QPMask@1) (MapType2Type RefType realType))) (= (type QPMask@2) (MapType2Type RefType realType))) (= (type QPMask@3) (MapType2Type RefType realType))) (= (type QPMask@4) (MapType2Type RefType realType))) (= (type n$2_6) RefType)) (= (type n_10_1) RefType)) (= (type y@@7) RefType)) (= (type n_12) RefType)) (= (type n$0_10_1) RefType)) (= (type ExhaleHeap@4) (MapType1Type RefType))) (= (type ExhaleHeap@5) (MapType1Type RefType))) (= (type QPMask@17) (MapType2Type RefType realType))) (= (type QPMask@9) (MapType2Type RefType realType))) (= (type u_2) RefType)) (= (type v_3) RefType)) (= (type QPMask@18) (MapType2Type RefType realType))) (= (type w_3) RefType)) (= (type QPMask@19) (MapType2Type RefType realType))) (= (type u_1_1@@1) RefType)) (= (type v_1_1) RefType)) (= (type w_1_1) RefType)) (= (type QPMask@15) (MapType2Type RefType realType))) (= (type u_3) RefType)) (= (type v_4) RefType)) (= (type QPMask@16) (MapType2Type RefType realType))) (= (type u_4) RefType)) (= (type v_4_1) RefType)) (= (type Heap@0) (MapType1Type RefType))) (= (type QPMask@10) (MapType2Type RefType realType))) (= (type Mask@0) (MapType2Type RefType realType))) (= (type QPMask@11) (MapType2Type RefType realType))) (= (type QPMask@12) (MapType2Type RefType realType))) (= (type u_7) RefType)) (= (type old_g@0) (MapType0Type EdgeDomainTypeType boolType))) (= (type QPMask@14) (MapType2Type RefType realType))) (= (type u_10) RefType)) (= (type v_7) RefType)) (= (type last@1) RefType)) (= (type QPMask@13) (MapType2Type RefType realType))) (= (type last@0) RefType)) (= (type QPMask@8) (MapType2Type RefType realType))) (forall ((arg0@@55 T@U) ) (! (= (type (invRecv67 arg0@@55)) RefType)
 :qid |funType:invRecv67|
 :pattern ( (invRecv67 arg0@@55))
))) (= (type QPMask@7) (MapType2Type RefType realType))) (forall ((arg0@@56 T@U) ) (! (= (type (invRecv66 arg0@@56)) RefType)
 :qid |funType:invRecv66|
 :pattern ( (invRecv66 arg0@@56))
))) (= (type QPMask@5) (MapType2Type RefType realType))) (forall ((arg0@@57 T@U) ) (! (= (type (invRecv65 arg0@@57)) RefType)
 :qid |funType:invRecv65|
 :pattern ( (invRecv65 arg0@@57))
))) (= (type n$2_5_1) RefType)) (= (type n_31) RefType)) (= (type n_33) RefType)) (= (type last@2) RefType)) (= (type QPMask@6) (MapType2Type RefType realType))) (= (type QPMask@24) (MapType2Type RefType realType))) (forall ((arg0@@58 T@U) ) (! (= (type (invRecv64 arg0@@58)) RefType)
 :qid |funType:invRecv64|
 :pattern ( (invRecv64 arg0@@58))
))) (= (type QPMask@22) (MapType2Type RefType realType))) (= (type QPMask@23) (MapType2Type RefType realType))) (= (type QPMask@20) (MapType2Type RefType realType))) (= (type QPMask@21) (MapType2Type RefType realType))) (forall ((arg0@@59 T@U) ) (! (= (type (invRecv59 arg0@@59)) RefType)
 :qid |funType:invRecv59|
 :pattern ( (invRecv59 arg0@@59))
))) (= (type n$2_7) RefType)) (= (type QPMask@25) (MapType2Type RefType realType))) (= (type n_11) RefType)) (= (type QPMask@35) (MapType2Type RefType realType))) (= (type QPMask@36) (MapType2Type RefType realType))) (= (type n_13) RefType)) (= (type QPMask@33) (MapType2Type RefType realType))) (= (type QPMask@34) (MapType2Type RefType realType))) (= (type QPMask@26) (MapType2Type RefType realType))) (= (type QPMask@27) (MapType2Type RefType realType))) (= (type QPMask@28) (MapType2Type RefType realType))) (= (type QPMask@29) (MapType2Type RefType realType))) (= (type QPMask@30) (MapType2Type RefType realType))) (= (type QPMask@32) (MapType2Type RefType realType))) (= (type QPMask@31) (MapType2Type RefType realType))) (forall ((arg0@@60 T@U) ) (! (= (type (invRecv47 arg0@@60)) RefType)
 :qid |funType:invRecv47|
 :pattern ( (invRecv47 arg0@@60))
))) (forall ((arg0@@61 T@U) ) (! (= (type (invRecv46 arg0@@61)) RefType)
 :qid |funType:invRecv46|
 :pattern ( (invRecv46 arg0@@61))
))) (forall ((arg0@@62 T@U) ) (! (= (type (invRecv37 arg0@@62)) RefType)
 :qid |funType:invRecv37|
 :pattern ( (invRecv37 arg0@@62))
))))
(set-info :boogie-vc-id append)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 322) (let ((anon240_Then_correct  (and (=> (= (ControlFlow 0 272) (- 0 273)) (forall ((n_23 T@U) (n_23_1 T@U) ) (!  (=> (and (= (type n_23) RefType) (= (type n_23_1) RefType)) (=> (and (and (and (and (not (= n_23 n_23_1)) (U_2_bool (MapType0Select g n_23))) (U_2_bool (MapType0Select g n_23_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_23 n_23_1))))
 :qid |stdinbpl.4515:33|
 :skolemid |477|
 :pattern ( (neverTriggered57 n_23) (neverTriggered57 n_23_1))
))) (=> (forall ((n_23@@0 T@U) (n_23_1@@0 T@U) ) (!  (=> (and (= (type n_23@@0) RefType) (= (type n_23_1@@0) RefType)) (=> (and (and (and (and (not (= n_23@@0 n_23_1@@0)) (U_2_bool (MapType0Select g n_23@@0))) (U_2_bool (MapType0Select g n_23_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_23@@0 n_23_1@@0))))
 :qid |stdinbpl.4515:33|
 :skolemid |477|
 :pattern ( (neverTriggered57 n_23@@0) (neverTriggered57 n_23_1@@0))
)) (=> (= (ControlFlow 0 272) (- 0 271)) (forall ((n_23@@1 T@U) ) (!  (=> (and (= (type n_23@@1) RefType) (U_2_bool (MapType0Select g n_23@@1))) (>= (U_2_real (MapType2Select QPMask@25 n_23@@1 next)) FullPerm))
 :qid |stdinbpl.4522:33|
 :skolemid |478|
 :pattern ( (MapType1Select ExhaleHeap@4 n_23@@1 next))
 :pattern ( (MapType2Select QPMask@31 n_23@@1 next))
 :pattern ( (MapType1Select ExhaleHeap@4 n_23@@1 next))
)))))))
(let ((anon242_Then_correct  (and (=> (= (ControlFlow 0 265) (- 0 266)) (forall ((n_24 T@U) (n_24_1 T@U) ) (!  (=> (and (= (type n_24) RefType) (= (type n_24_1) RefType)) (=> (and (and (and (and (not (= n_24 n_24_1)) (U_2_bool (MapType0Select g n_24))) (U_2_bool (MapType0Select g n_24_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_24 n_24_1))))
 :qid |stdinbpl.4576:33|
 :skolemid |483|
 :pattern ( (neverTriggered58 n_24) (neverTriggered58 n_24_1))
))) (=> (forall ((n_24@@0 T@U) (n_24_1@@0 T@U) ) (!  (=> (and (= (type n_24@@0) RefType) (= (type n_24_1@@0) RefType)) (=> (and (and (and (and (not (= n_24@@0 n_24_1@@0)) (U_2_bool (MapType0Select g n_24@@0))) (U_2_bool (MapType0Select g n_24_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_24@@0 n_24_1@@0))))
 :qid |stdinbpl.4576:33|
 :skolemid |483|
 :pattern ( (neverTriggered58 n_24@@0) (neverTriggered58 n_24_1@@0))
)) (=> (= (ControlFlow 0 265) (- 0 264)) (forall ((n_24@@1 T@U) ) (!  (=> (and (= (type n_24@@1) RefType) (U_2_bool (MapType0Select g n_24@@1))) (>= (U_2_real (MapType2Select QPMask@25 n_24@@1 next)) FullPerm))
 :qid |stdinbpl.4583:33|
 :skolemid |484|
 :pattern ( (MapType1Select ExhaleHeap@4 n_24@@1 next))
 :pattern ( (MapType2Select QPMask@32 n_24@@1 next))
 :pattern ( (MapType1Select ExhaleHeap@4 n_24@@1 next))
)))))))
(let ((anon238_Then_correct  (and (=> (= (ControlFlow 0 261) (- 0 262)) (forall ((n_22 T@U) (n_22_1 T@U) ) (!  (=> (and (= (type n_22) RefType) (= (type n_22_1) RefType)) (=> (and (and (and (and (not (= n_22 n_22_1)) (U_2_bool (MapType0Select g n_22))) (U_2_bool (MapType0Select g n_22_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_22 n_22_1))))
 :qid |stdinbpl.4460:31|
 :skolemid |471|
 :pattern ( (neverTriggered56 n_22) (neverTriggered56 n_22_1))
))) (=> (forall ((n_22@@0 T@U) (n_22_1@@0 T@U) ) (!  (=> (and (= (type n_22@@0) RefType) (= (type n_22_1@@0) RefType)) (=> (and (and (and (and (not (= n_22@@0 n_22_1@@0)) (U_2_bool (MapType0Select g n_22@@0))) (U_2_bool (MapType0Select g n_22_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_22@@0 n_22_1@@0))))
 :qid |stdinbpl.4460:31|
 :skolemid |471|
 :pattern ( (neverTriggered56 n_22@@0) (neverTriggered56 n_22_1@@0))
)) (=> (= (ControlFlow 0 261) (- 0 260)) (forall ((n_22@@1 T@U) ) (!  (=> (and (= (type n_22@@1) RefType) (U_2_bool (MapType0Select g n_22@@1))) (>= (U_2_real (MapType2Select QPMask@25 n_22@@1 next)) FullPerm))
 :qid |stdinbpl.4467:31|
 :skolemid |472|
 :pattern ( (MapType1Select ExhaleHeap@4 n_22@@1 next))
 :pattern ( (MapType2Select QPMask@30 n_22@@1 next))
 :pattern ( (MapType1Select ExhaleHeap@4 n_22@@1 next))
)))))))
(let ((anon93_correct true))
(let ((anon242_Else_correct  (and (=> (= (ControlFlow 0 267) (- 0 268)) (HasDirectPerm QPMask@25 last@0 next)) (=> (HasDirectPerm QPMask@25 last@0 next) (=> (and (exists_path ($$ ExhaleHeap@4 g) last@0 (MapType1Select ExhaleHeap@4 last@0 next)) (= (ControlFlow 0 267) 258)) anon93_correct)))))
(let ((anon241_Then_correct  (=> (and (and (edge ($$ ExhaleHeap@4 g) last@0 (MapType1Select ExhaleHeap@4 last@0 next)) (exists_path ($$ ExhaleHeap@4 g) (MapType1Select ExhaleHeap@4 last@0 next) (MapType1Select ExhaleHeap@4 last@0 next))) (state ExhaleHeap@4 QPMask@25)) (and (=> (= (ControlFlow 0 269) 265) anon242_Then_correct) (=> (= (ControlFlow 0 269) 267) anon242_Else_correct)))))
(let ((anon241_Else_correct  (=> (and (not (and (edge ($$ ExhaleHeap@4 g) last@0 (MapType1Select ExhaleHeap@4 last@0 next)) (exists_path ($$ ExhaleHeap@4 g) (MapType1Select ExhaleHeap@4 last@0 next) (MapType1Select ExhaleHeap@4 last@0 next)))) (= (ControlFlow 0 263) 258)) anon93_correct)))
(let ((anon240_Else_correct  (and (=> (= (ControlFlow 0 274) (- 0 276)) (HasDirectPerm QPMask@25 last@0 next)) (=> (HasDirectPerm QPMask@25 last@0 next) (and (=> (= (ControlFlow 0 274) (- 0 275)) (HasDirectPerm QPMask@25 last@0 next)) (=> (HasDirectPerm QPMask@25 last@0 next) (and (=> (= (ControlFlow 0 274) 269) anon241_Then_correct) (=> (= (ControlFlow 0 274) 263) anon241_Else_correct))))))))
(let ((anon239_Then_correct  (=> (edge ($$ ExhaleHeap@4 g) last@0 (MapType1Select ExhaleHeap@4 last@0 next)) (and (=> (= (ControlFlow 0 277) 272) anon240_Then_correct) (=> (= (ControlFlow 0 277) 274) anon240_Else_correct)))))
(let ((anon239_Else_correct  (=> (not (edge ($$ ExhaleHeap@4 g) last@0 (MapType1Select ExhaleHeap@4 last@0 next))) (and (=> (= (ControlFlow 0 270) 269) anon241_Then_correct) (=> (= (ControlFlow 0 270) 263) anon241_Else_correct)))))
(let ((anon238_Else_correct  (and (=> (= (ControlFlow 0 278) (- 0 279)) (HasDirectPerm QPMask@25 last@0 next)) (=> (HasDirectPerm QPMask@25 last@0 next) (and (=> (= (ControlFlow 0 278) 277) anon239_Then_correct) (=> (= (ControlFlow 0 278) 270) anon239_Else_correct))))))
(let ((anon237_Then_correct  (=> (not (= (MapType1Select ExhaleHeap@4 last@0 next) null)) (and (=> (= (ControlFlow 0 280) 261) anon238_Then_correct) (=> (= (ControlFlow 0 280) 278) anon238_Else_correct)))))
(let ((anon237_Else_correct  (=> (and (= (MapType1Select ExhaleHeap@4 last@0 next) null) (= (ControlFlow 0 259) 258)) anon93_correct)))
(let ((anon236_Else_correct  (=> (exists_path ($$ ExhaleHeap@4 g) x_1@@1 last@0) (and (=> (= (ControlFlow 0 281) (- 0 282)) (HasDirectPerm QPMask@25 last@0 next)) (=> (HasDirectPerm QPMask@25 last@0 next) (and (=> (= (ControlFlow 0 281) 280) anon237_Then_correct) (=> (= (ControlFlow 0 281) 259) anon237_Else_correct)))))))
(let ((anon236_Then_correct  (and (=> (= (ControlFlow 0 256) (- 0 257)) (forall ((n_21 T@U) (n_21_1 T@U) ) (!  (=> (and (= (type n_21) RefType) (= (type n_21_1) RefType)) (=> (and (and (and (and (not (= n_21 n_21_1)) (U_2_bool (MapType0Select g n_21))) (U_2_bool (MapType0Select g n_21_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_21 n_21_1))))
 :qid |stdinbpl.4400:29|
 :skolemid |465|
 :pattern ( (neverTriggered55 n_21) (neverTriggered55 n_21_1))
))) (=> (forall ((n_21@@0 T@U) (n_21_1@@0 T@U) ) (!  (=> (and (= (type n_21@@0) RefType) (= (type n_21_1@@0) RefType)) (=> (and (and (and (and (not (= n_21@@0 n_21_1@@0)) (U_2_bool (MapType0Select g n_21@@0))) (U_2_bool (MapType0Select g n_21_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_21@@0 n_21_1@@0))))
 :qid |stdinbpl.4400:29|
 :skolemid |465|
 :pattern ( (neverTriggered55 n_21@@0) (neverTriggered55 n_21_1@@0))
)) (=> (= (ControlFlow 0 256) (- 0 255)) (forall ((n_21@@1 T@U) ) (!  (=> (and (= (type n_21@@1) RefType) (U_2_bool (MapType0Select g n_21@@1))) (>= (U_2_real (MapType2Select QPMask@25 n_21@@1 next)) FullPerm))
 :qid |stdinbpl.4407:29|
 :skolemid |466|
 :pattern ( (MapType1Select ExhaleHeap@4 n_21@@1 next))
 :pattern ( (MapType2Select QPMask@29 n_21@@1 next))
 :pattern ( (MapType1Select ExhaleHeap@4 n_21@@1 next))
)))))))
(let ((anon235_Else_correct  (=> (|Set#Equal| ($$ ExhaleHeap@4 g) old_g@0) (=> (and (state ExhaleHeap@4 QPMask@25) (state ExhaleHeap@4 QPMask@25)) (and (=> (= (ControlFlow 0 283) 256) anon236_Then_correct) (=> (= (ControlFlow 0 283) 281) anon236_Else_correct))))))
(let ((anon235_Then_correct  (and (=> (= (ControlFlow 0 253) (- 0 254)) (forall ((n_20 T@U) (n_20_1 T@U) ) (!  (=> (and (= (type n_20) RefType) (= (type n_20_1) RefType)) (=> (and (and (and (and (not (= n_20 n_20_1)) (U_2_bool (MapType0Select g n_20))) (U_2_bool (MapType0Select g n_20_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_20 n_20_1))))
 :qid |stdinbpl.4343:29|
 :skolemid |459|
 :pattern ( (neverTriggered54 n_20) (neverTriggered54 n_20_1))
))) (=> (forall ((n_20@@0 T@U) (n_20_1@@0 T@U) ) (!  (=> (and (= (type n_20@@0) RefType) (= (type n_20_1@@0) RefType)) (=> (and (and (and (and (not (= n_20@@0 n_20_1@@0)) (U_2_bool (MapType0Select g n_20@@0))) (U_2_bool (MapType0Select g n_20_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_20@@0 n_20_1@@0))))
 :qid |stdinbpl.4343:29|
 :skolemid |459|
 :pattern ( (neverTriggered54 n_20@@0) (neverTriggered54 n_20_1@@0))
)) (=> (= (ControlFlow 0 253) (- 0 252)) (forall ((n_20@@1 T@U) ) (!  (=> (and (= (type n_20@@1) RefType) (U_2_bool (MapType0Select g n_20@@1))) (>= (U_2_real (MapType2Select QPMask@25 n_20@@1 next)) FullPerm))
 :qid |stdinbpl.4350:29|
 :skolemid |460|
 :pattern ( (MapType1Select ExhaleHeap@4 n_20@@1 next))
 :pattern ( (MapType2Select QPMask@28 n_20@@1 next))
 :pattern ( (MapType1Select ExhaleHeap@4 n_20@@1 next))
)))))))
(let ((anon234_Else_correct  (=> (unshared_graph ($$ ExhaleHeap@4 g)) (=> (and (state ExhaleHeap@4 QPMask@25) (state ExhaleHeap@4 QPMask@25)) (and (=> (= (ControlFlow 0 284) 253) anon235_Then_correct) (=> (= (ControlFlow 0 284) 283) anon235_Else_correct))))))
(let ((anon234_Then_correct  (and (=> (= (ControlFlow 0 250) (- 0 251)) (forall ((n_19 T@U) (n_19_1 T@U) ) (!  (=> (and (= (type n_19) RefType) (= (type n_19_1) RefType)) (=> (and (and (and (and (not (= n_19 n_19_1)) (U_2_bool (MapType0Select g n_19))) (U_2_bool (MapType0Select g n_19_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_19 n_19_1))))
 :qid |stdinbpl.4286:29|
 :skolemid |453|
 :pattern ( (neverTriggered53 n_19) (neverTriggered53 n_19_1))
))) (=> (forall ((n_19@@0 T@U) (n_19_1@@0 T@U) ) (!  (=> (and (= (type n_19@@0) RefType) (= (type n_19_1@@0) RefType)) (=> (and (and (and (and (not (= n_19@@0 n_19_1@@0)) (U_2_bool (MapType0Select g n_19@@0))) (U_2_bool (MapType0Select g n_19_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_19@@0 n_19_1@@0))))
 :qid |stdinbpl.4286:29|
 :skolemid |453|
 :pattern ( (neverTriggered53 n_19@@0) (neverTriggered53 n_19_1@@0))
)) (=> (= (ControlFlow 0 250) (- 0 249)) (forall ((n_19@@1 T@U) ) (!  (=> (and (= (type n_19@@1) RefType) (U_2_bool (MapType0Select g n_19@@1))) (>= (U_2_real (MapType2Select QPMask@25 n_19@@1 next)) FullPerm))
 :qid |stdinbpl.4293:29|
 :skolemid |454|
 :pattern ( (MapType1Select ExhaleHeap@4 n_19@@1 next))
 :pattern ( (MapType2Select QPMask@27 n_19@@1 next))
 :pattern ( (MapType1Select ExhaleHeap@4 n_19@@1 next))
)))))))
(let ((anon233_Else_correct  (=> (acyclic_graph ($$ ExhaleHeap@4 g)) (=> (and (state ExhaleHeap@4 QPMask@25) (state ExhaleHeap@4 QPMask@25)) (and (=> (= (ControlFlow 0 285) 250) anon234_Then_correct) (=> (= (ControlFlow 0 285) 284) anon234_Else_correct))))))
(let ((anon233_Then_correct  (and (=> (= (ControlFlow 0 247) (- 0 248)) (forall ((n_18 T@U) (n_18_1 T@U) ) (!  (=> (and (= (type n_18) RefType) (= (type n_18_1) RefType)) (=> (and (and (and (and (not (= n_18 n_18_1)) (U_2_bool (MapType0Select g n_18))) (U_2_bool (MapType0Select g n_18_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_18 n_18_1))))
 :qid |stdinbpl.4229:29|
 :skolemid |447|
 :pattern ( (neverTriggered52 n_18) (neverTriggered52 n_18_1))
))) (=> (forall ((n_18@@0 T@U) (n_18_1@@0 T@U) ) (!  (=> (and (= (type n_18@@0) RefType) (= (type n_18_1@@0) RefType)) (=> (and (and (and (and (not (= n_18@@0 n_18_1@@0)) (U_2_bool (MapType0Select g n_18@@0))) (U_2_bool (MapType0Select g n_18_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_18@@0 n_18_1@@0))))
 :qid |stdinbpl.4229:29|
 :skolemid |447|
 :pattern ( (neverTriggered52 n_18@@0) (neverTriggered52 n_18_1@@0))
)) (=> (= (ControlFlow 0 247) (- 0 246)) (forall ((n_18@@1 T@U) ) (!  (=> (and (= (type n_18@@1) RefType) (U_2_bool (MapType0Select g n_18@@1))) (>= (U_2_real (MapType2Select QPMask@25 n_18@@1 next)) FullPerm))
 :qid |stdinbpl.4236:29|
 :skolemid |448|
 :pattern ( (MapType1Select ExhaleHeap@4 n_18@@1 next))
 :pattern ( (MapType2Select QPMask@26 n_18@@1 next))
 :pattern ( (MapType1Select ExhaleHeap@4 n_18@@1 next))
)))))))
(let ((anon228_Else_correct  (=> (forall ((n_17 T@U) ) (!  (=> (and (= (type n_17) RefType) (U_2_bool (MapType0Select g n_17))) (or (not (exists_path ($$ ExhaleHeap@4 g) x_1@@1 n_17)) (not (exists_path ($$ ExhaleHeap@4 g) y@@7 n_17))))
 :qid |stdinbpl.4210:28|
 :skolemid |446|
 :pattern ( (MapType0Select g n_17))
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| ExhaleHeap@4 g))) g) x_1@@1 n_17))
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| ExhaleHeap@4 g))) g) y@@7 n_17))
)) (=> (and (state ExhaleHeap@4 QPMask@25) (state ExhaleHeap@4 QPMask@25)) (and (=> (= (ControlFlow 0 286) 247) anon233_Then_correct) (=> (= (ControlFlow 0 286) 285) anon233_Else_correct))))))
(let ((anon232_Then_correct  (and (=> (= (ControlFlow 0 242) (- 0 243)) (forall ((n$0_9 T@U) (n$0_9_1 T@U) ) (!  (=> (and (= (type n$0_9) RefType) (= (type n$0_9_1) RefType)) (=> (and (and (and (and (not (= n$0_9 n$0_9_1)) (U_2_bool (MapType0Select g n$0_9))) (U_2_bool (MapType0Select g n$0_9_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$0_9 n$0_9_1))))
 :qid |stdinbpl.4165:35|
 :skolemid |440|
 :pattern ( (neverTriggered51 n$0_9) (neverTriggered51 n$0_9_1))
))) (=> (forall ((n$0_9@@0 T@U) (n$0_9_1@@0 T@U) ) (!  (=> (and (= (type n$0_9@@0) RefType) (= (type n$0_9_1@@0) RefType)) (=> (and (and (and (and (not (= n$0_9@@0 n$0_9_1@@0)) (U_2_bool (MapType0Select g n$0_9@@0))) (U_2_bool (MapType0Select g n$0_9_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$0_9@@0 n$0_9_1@@0))))
 :qid |stdinbpl.4165:35|
 :skolemid |440|
 :pattern ( (neverTriggered51 n$0_9@@0) (neverTriggered51 n$0_9_1@@0))
)) (=> (= (ControlFlow 0 242) (- 0 241)) (forall ((n$0_9@@1 T@U) ) (!  (=> (and (= (type n$0_9@@1) RefType) (U_2_bool (MapType0Select g n$0_9@@1))) (>= (U_2_real (MapType2Select QPMask@25 n$0_9@@1 next)) FullPerm))
 :qid |stdinbpl.4172:35|
 :skolemid |441|
 :pattern ( (MapType1Select ExhaleHeap@4 n$0_9@@1 next))
 :pattern ( (MapType2Select QPMask@34 n$0_9@@1 next))
 :pattern ( (MapType1Select ExhaleHeap@4 n$0_9@@1 next))
)))))))
(let ((anon230_Then_correct  (and (=> (= (ControlFlow 0 238) (- 0 239)) (forall ((n$0_8 T@U) (n$0_8_1 T@U) ) (!  (=> (and (= (type n$0_8) RefType) (= (type n$0_8_1) RefType)) (=> (and (and (and (and (not (= n$0_8 n$0_8_1)) (U_2_bool (MapType0Select g n$0_8))) (U_2_bool (MapType0Select g n$0_8_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$0_8 n$0_8_1))))
 :qid |stdinbpl.4112:33|
 :skolemid |434|
 :pattern ( (neverTriggered50 n$0_8) (neverTriggered50 n$0_8_1))
))) (=> (forall ((n$0_8@@0 T@U) (n$0_8_1@@0 T@U) ) (!  (=> (and (= (type n$0_8@@0) RefType) (= (type n$0_8_1@@0) RefType)) (=> (and (and (and (and (not (= n$0_8@@0 n$0_8_1@@0)) (U_2_bool (MapType0Select g n$0_8@@0))) (U_2_bool (MapType0Select g n$0_8_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$0_8@@0 n$0_8_1@@0))))
 :qid |stdinbpl.4112:33|
 :skolemid |434|
 :pattern ( (neverTriggered50 n$0_8@@0) (neverTriggered50 n$0_8_1@@0))
)) (=> (= (ControlFlow 0 238) (- 0 237)) (forall ((n$0_8@@1 T@U) ) (!  (=> (and (= (type n$0_8@@1) RefType) (U_2_bool (MapType0Select g n$0_8@@1))) (>= (U_2_real (MapType2Select QPMask@25 n$0_8@@1 next)) FullPerm))
 :qid |stdinbpl.4119:33|
 :skolemid |435|
 :pattern ( (MapType1Select ExhaleHeap@4 n$0_8@@1 next))
 :pattern ( (MapType2Select QPMask@33 n$0_8@@1 next))
 :pattern ( (MapType1Select ExhaleHeap@4 n$0_8@@1 next))
)))))))
(let ((anon73_correct true))
(let ((anon231_Then_correct  (=> (exists_path ($$ ExhaleHeap@4 g) x_1@@1 n_13) (and (=> (= (ControlFlow 0 244) 242) anon232_Then_correct) (=> (= (ControlFlow 0 244) 235) anon73_correct)))))
(let ((anon231_Else_correct  (=> (and (not (exists_path ($$ ExhaleHeap@4 g) x_1@@1 n_13)) (= (ControlFlow 0 240) 235)) anon73_correct)))
(let ((anon229_Then_correct  (=> (U_2_bool (MapType0Select g n_13)) (and (and (=> (= (ControlFlow 0 245) 238) anon230_Then_correct) (=> (= (ControlFlow 0 245) 244) anon231_Then_correct)) (=> (= (ControlFlow 0 245) 240) anon231_Else_correct)))))
(let ((anon229_Else_correct  (=> (and (not (U_2_bool (MapType0Select g n_13))) (= (ControlFlow 0 236) 235)) anon73_correct)))
(let ((anon223_Else_correct  (=> (forall ((n_15 T@U) ) (!  (=> (and (= (type n_15) RefType) (U_2_bool (MapType0Select g n_15))) (or (exists_path ($$ ExhaleHeap@4 g) x_1@@1 n_15) (exists_path ($$ ExhaleHeap@4 g) y@@7 n_15)))
 :qid |stdinbpl.4091:28|
 :skolemid |433|
 :pattern ( (MapType0Select g n_15))
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| ExhaleHeap@4 g))) g) x_1@@1 n_15))
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| ExhaleHeap@4 g))) g) y@@7 n_15))
)) (=> (and (state ExhaleHeap@4 QPMask@25) (state ExhaleHeap@4 QPMask@25)) (and (and (=> (= (ControlFlow 0 287) 286) anon228_Else_correct) (=> (= (ControlFlow 0 287) 245) anon229_Then_correct)) (=> (= (ControlFlow 0 287) 236) anon229_Else_correct))))))
(let ((anon227_Then_correct  (and (=> (= (ControlFlow 0 231) (- 0 232)) (forall ((n$0_7 T@U) (n$0_7_1 T@U) ) (!  (=> (and (= (type n$0_7) RefType) (= (type n$0_7_1) RefType)) (=> (and (and (and (and (not (= n$0_7 n$0_7_1)) (U_2_bool (MapType0Select g n$0_7))) (U_2_bool (MapType0Select g n$0_7_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$0_7 n$0_7_1))))
 :qid |stdinbpl.4046:35|
 :skolemid |427|
 :pattern ( (neverTriggered49 n$0_7) (neverTriggered49 n$0_7_1))
))) (=> (forall ((n$0_7@@0 T@U) (n$0_7_1@@0 T@U) ) (!  (=> (and (= (type n$0_7@@0) RefType) (= (type n$0_7_1@@0) RefType)) (=> (and (and (and (and (not (= n$0_7@@0 n$0_7_1@@0)) (U_2_bool (MapType0Select g n$0_7@@0))) (U_2_bool (MapType0Select g n$0_7_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$0_7@@0 n$0_7_1@@0))))
 :qid |stdinbpl.4046:35|
 :skolemid |427|
 :pattern ( (neverTriggered49 n$0_7@@0) (neverTriggered49 n$0_7_1@@0))
)) (=> (= (ControlFlow 0 231) (- 0 230)) (forall ((n$0_7@@1 T@U) ) (!  (=> (and (= (type n$0_7@@1) RefType) (U_2_bool (MapType0Select g n$0_7@@1))) (>= (U_2_real (MapType2Select QPMask@25 n$0_7@@1 next)) FullPerm))
 :qid |stdinbpl.4053:35|
 :skolemid |428|
 :pattern ( (MapType1Select ExhaleHeap@4 n$0_7@@1 next))
 :pattern ( (MapType2Select QPMask@36 n$0_7@@1 next))
 :pattern ( (MapType1Select ExhaleHeap@4 n$0_7@@1 next))
)))))))
(let ((anon225_Then_correct  (and (=> (= (ControlFlow 0 227) (- 0 228)) (forall ((n$0_6 T@U) (n$0_6_1 T@U) ) (!  (=> (and (= (type n$0_6) RefType) (= (type n$0_6_1) RefType)) (=> (and (and (and (and (not (= n$0_6 n$0_6_1)) (U_2_bool (MapType0Select g n$0_6))) (U_2_bool (MapType0Select g n$0_6_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$0_6 n$0_6_1))))
 :qid |stdinbpl.3993:33|
 :skolemid |421|
 :pattern ( (neverTriggered48 n$0_6) (neverTriggered48 n$0_6_1))
))) (=> (forall ((n$0_6@@0 T@U) (n$0_6_1@@0 T@U) ) (!  (=> (and (= (type n$0_6@@0) RefType) (= (type n$0_6_1@@0) RefType)) (=> (and (and (and (and (not (= n$0_6@@0 n$0_6_1@@0)) (U_2_bool (MapType0Select g n$0_6@@0))) (U_2_bool (MapType0Select g n$0_6_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$0_6@@0 n$0_6_1@@0))))
 :qid |stdinbpl.3993:33|
 :skolemid |421|
 :pattern ( (neverTriggered48 n$0_6@@0) (neverTriggered48 n$0_6_1@@0))
)) (=> (= (ControlFlow 0 227) (- 0 226)) (forall ((n$0_6@@1 T@U) ) (!  (=> (and (= (type n$0_6@@1) RefType) (U_2_bool (MapType0Select g n$0_6@@1))) (>= (U_2_real (MapType2Select QPMask@25 n$0_6@@1 next)) FullPerm))
 :qid |stdinbpl.4000:33|
 :skolemid |422|
 :pattern ( (MapType1Select ExhaleHeap@4 n$0_6@@1 next))
 :pattern ( (MapType2Select QPMask@35 n$0_6@@1 next))
 :pattern ( (MapType1Select ExhaleHeap@4 n$0_6@@1 next))
)))))))
(let ((anon65_correct true))
(let ((anon226_Then_correct  (=> (not (exists_path ($$ ExhaleHeap@4 g) x_1@@1 n_11)) (and (=> (= (ControlFlow 0 233) 231) anon227_Then_correct) (=> (= (ControlFlow 0 233) 224) anon65_correct)))))
(let ((anon226_Else_correct  (=> (and (exists_path ($$ ExhaleHeap@4 g) x_1@@1 n_11) (= (ControlFlow 0 229) 224)) anon65_correct)))
(let ((anon224_Then_correct  (=> (U_2_bool (MapType0Select g n_11)) (and (and (=> (= (ControlFlow 0 234) 227) anon225_Then_correct) (=> (= (ControlFlow 0 234) 233) anon226_Then_correct)) (=> (= (ControlFlow 0 234) 229) anon226_Else_correct)))))
(let ((anon224_Else_correct  (=> (and (not (U_2_bool (MapType0Select g n_11))) (= (ControlFlow 0 225) 224)) anon65_correct)))
(let ((anon220_Else_correct  (=> (and (and (and (forall ((n$2_3_2 T@U) ) (!  (=> (= (type n$2_3_2) RefType) (=> (and (U_2_bool (MapType0Select g n$2_3_2)) (not (= (MapType1Select ExhaleHeap@4 n$2_3_2 next) null))) (U_2_bool (MapType0Select g (MapType1Select ExhaleHeap@4 n$2_3_2 next)))))
 :qid |stdinbpl.3967:28|
 :skolemid |420|
 :pattern ( (MapType0Select g (MapType1Select ExhaleHeap@4 n$2_3_2 next)))
 :pattern ( (MapType0Select g n$2_3_2) (MapType1Select ExhaleHeap@4 n$2_3_2 next))
)) (state ExhaleHeap@4 QPMask@25)) (and (U_2_bool (MapType0Select g last@0)) (state ExhaleHeap@4 QPMask@25))) (and (and (U_2_bool (MapType0Select g x_1@@1)) (U_2_bool (MapType0Select g y@@7))) (and (state ExhaleHeap@4 QPMask@25) (state ExhaleHeap@4 QPMask@25)))) (and (and (=> (= (ControlFlow 0 288) 287) anon223_Else_correct) (=> (= (ControlFlow 0 288) 234) anon224_Then_correct)) (=> (= (ControlFlow 0 288) 225) anon224_Else_correct)))))
(let ((anon57_correct true))
(let ((anon222_Else_correct  (=> (and (not (and (U_2_bool (MapType0Select g n$2_7)) (not (= (MapType1Select ExhaleHeap@4 n$2_7 next) null)))) (= (ControlFlow 0 220) 217)) anon57_correct)))
(let ((anon222_Then_correct  (=> (and (U_2_bool (MapType0Select g n$2_7)) (not (= (MapType1Select ExhaleHeap@4 n$2_7 next) null))) (and (=> (= (ControlFlow 0 218) (- 0 219)) (HasDirectPerm QPMask@25 n$2_7 next)) (=> (HasDirectPerm QPMask@25 n$2_7 next) (=> (= (ControlFlow 0 218) 217) anon57_correct))))))
(let ((anon221_Else_correct  (=> (not (U_2_bool (MapType0Select g n$2_7))) (and (=> (= (ControlFlow 0 223) 218) anon222_Then_correct) (=> (= (ControlFlow 0 223) 220) anon222_Else_correct)))))
(let ((anon221_Then_correct  (=> (U_2_bool (MapType0Select g n$2_7)) (and (=> (= (ControlFlow 0 221) (- 0 222)) (HasDirectPerm QPMask@25 n$2_7 next)) (=> (HasDirectPerm QPMask@25 n$2_7 next) (and (=> (= (ControlFlow 0 221) 218) anon222_Then_correct) (=> (= (ControlFlow 0 221) 220) anon222_Else_correct)))))))
(let ((anon219_Else_correct  (and (=> (= (ControlFlow 0 289) (- 0 290)) (forall ((n$1_2 T@U) (n$1_2_1 T@U) ) (!  (=> (and (= (type n$1_2) RefType) (= (type n$1_2_1) RefType)) (=> (and (and (and (and (not (= n$1_2 n$1_2_1)) (U_2_bool (MapType0Select g n$1_2))) (U_2_bool (MapType0Select g n$1_2_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$1_2 n$1_2_1))))
 :qid |stdinbpl.3922:23|
 :skolemid |414|
 :no-pattern (type n$1_2)
 :no-pattern (type n$1_2_1)
 :no-pattern (U_2_int n$1_2)
 :no-pattern (U_2_bool n$1_2)
 :no-pattern (U_2_int n$1_2_1)
 :no-pattern (U_2_bool n$1_2_1)
))) (=> (forall ((n$1_2@@0 T@U) (n$1_2_1@@0 T@U) ) (!  (=> (and (= (type n$1_2@@0) RefType) (= (type n$1_2_1@@0) RefType)) (=> (and (and (and (and (not (= n$1_2@@0 n$1_2_1@@0)) (U_2_bool (MapType0Select g n$1_2@@0))) (U_2_bool (MapType0Select g n$1_2_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$1_2@@0 n$1_2_1@@0))))
 :qid |stdinbpl.3922:23|
 :skolemid |414|
 :no-pattern (type n$1_2@@0)
 :no-pattern (type n$1_2_1@@0)
 :no-pattern (U_2_int n$1_2@@0)
 :no-pattern (U_2_bool n$1_2@@0)
 :no-pattern (U_2_int n$1_2_1@@0)
 :no-pattern (U_2_bool n$1_2_1@@0)
)) (=> (and (forall ((n$1_2@@1 T@U) ) (!  (=> (= (type n$1_2@@1) RefType) (=> (and (U_2_bool (MapType0Select g n$1_2@@1)) (< NoPerm FullPerm)) (and (qpRange47 n$1_2@@1) (= (invRecv47 n$1_2@@1) n$1_2@@1))))
 :qid |stdinbpl.3928:30|
 :skolemid |415|
 :pattern ( (MapType1Select ExhaleHeap@4 n$1_2@@1 next))
 :pattern ( (MapType2Select QPMask@25 n$1_2@@1 next))
 :pattern ( (MapType1Select ExhaleHeap@4 n$1_2@@1 next))
)) (forall ((o_3 T@U) ) (!  (=> (= (type o_3) RefType) (=> (and (and (U_2_bool (MapType0Select g (invRecv47 o_3))) (< NoPerm FullPerm)) (qpRange47 o_3)) (= (invRecv47 o_3) o_3)))
 :qid |stdinbpl.3932:30|
 :skolemid |416|
 :pattern ( (invRecv47 o_3))
))) (=> (and (and (forall ((n$1_2@@2 T@U) ) (!  (=> (and (= (type n$1_2@@2) RefType) (U_2_bool (MapType0Select g n$1_2@@2))) (not (= n$1_2@@2 null)))
 :qid |stdinbpl.3938:30|
 :skolemid |417|
 :pattern ( (MapType1Select ExhaleHeap@4 n$1_2@@2 next))
 :pattern ( (MapType2Select QPMask@25 n$1_2@@2 next))
 :pattern ( (MapType1Select ExhaleHeap@4 n$1_2@@2 next))
)) (forall ((o_3@@0 T@U) ) (!  (=> (= (type o_3@@0) RefType) (and (=> (and (and (U_2_bool (MapType0Select g (invRecv47 o_3@@0))) (< NoPerm FullPerm)) (qpRange47 o_3@@0)) (and (=> (< NoPerm FullPerm) (= (invRecv47 o_3@@0) o_3@@0)) (= (U_2_real (MapType2Select QPMask@25 o_3@@0 next)) (+ (U_2_real (MapType2Select QPMask@5 o_3@@0 next)) FullPerm)))) (=> (not (and (and (U_2_bool (MapType0Select g (invRecv47 o_3@@0))) (< NoPerm FullPerm)) (qpRange47 o_3@@0))) (= (U_2_real (MapType2Select QPMask@25 o_3@@0 next)) (U_2_real (MapType2Select QPMask@5 o_3@@0 next))))))
 :qid |stdinbpl.3944:30|
 :skolemid |418|
 :pattern ( (MapType2Select QPMask@25 o_3@@0 next))
))) (and (forall ((o_3@@1 T@U) (f_5 T@U) ) (! (let ((B@@11 (FieldTypeInv1 (type f_5))))
(let ((A@@12 (FieldTypeInv0 (type f_5))))
 (=> (and (and (= (type o_3@@1) RefType) (= (type f_5) (FieldType A@@12 B@@11))) (not (= f_5 next))) (= (U_2_real (MapType2Select QPMask@5 o_3@@1 f_5)) (U_2_real (MapType2Select QPMask@25 o_3@@1 f_5))))))
 :qid |stdinbpl.3948:37|
 :skolemid |419|
 :pattern ( (MapType2Select QPMask@5 o_3@@1 f_5))
 :pattern ( (MapType2Select QPMask@25 o_3@@1 f_5))
)) (state ExhaleHeap@4 QPMask@25))) (and (and (=> (= (ControlFlow 0 289) 288) anon220_Else_correct) (=> (= (ControlFlow 0 289) 221) anon221_Then_correct)) (=> (= (ControlFlow 0 289) 223) anon221_Else_correct))))))))
(let ((anon219_Then_correct true))
(let ((anon218_Then_correct  (=> (not (U_2_bool (MapType0Select g null))) (and (=> (= (ControlFlow 0 291) 216) anon219_Then_correct) (=> (= (ControlFlow 0 291) 289) anon219_Else_correct)))))
(let ((anon248_Then_correct  (and (=> (= (ControlFlow 0 202) (- 0 203)) (forall ((n_28 T@U) (n_28_1 T@U) ) (!  (=> (and (= (type n_28) RefType) (= (type n_28_1) RefType)) (=> (and (and (and (and (not (= n_28 n_28_1)) (U_2_bool (MapType0Select g n_28))) (U_2_bool (MapType0Select g n_28_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_28 n_28_1))))
 :qid |stdinbpl.4784:35|
 :skolemid |504|
 :pattern ( (neverTriggered61 n_28) (neverTriggered61 n_28_1))
))) (=> (forall ((n_28@@0 T@U) (n_28_1@@0 T@U) ) (!  (=> (and (= (type n_28@@0) RefType) (= (type n_28_1@@0) RefType)) (=> (and (and (and (and (not (= n_28@@0 n_28_1@@0)) (U_2_bool (MapType0Select g n_28@@0))) (U_2_bool (MapType0Select g n_28_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_28@@0 n_28_1@@0))))
 :qid |stdinbpl.4784:35|
 :skolemid |504|
 :pattern ( (neverTriggered61 n_28@@0) (neverTriggered61 n_28_1@@0))
)) (=> (= (ControlFlow 0 202) (- 0 201)) (forall ((n_28@@1 T@U) ) (!  (=> (and (= (type n_28@@1) RefType) (U_2_bool (MapType0Select g n_28@@1))) (>= (U_2_real (MapType2Select QPMask@6 n_28@@1 next)) FullPerm))
 :qid |stdinbpl.4791:35|
 :skolemid |505|
 :pattern ( (MapType1Select ExhaleHeap@4 n_28@@1 next))
 :pattern ( (MapType2Select QPMask@21 n_28@@1 next))
 :pattern ( (MapType1Select ExhaleHeap@4 n_28@@1 next))
)))))))
(let ((anon247_Then_correct  (and (=> (= (ControlFlow 0 199) (- 0 200)) (forall ((n_27 T@U) (n_27_1 T@U) ) (!  (=> (and (= (type n_27) RefType) (= (type n_27_1) RefType)) (=> (and (and (and (and (not (= n_27 n_27_1)) (U_2_bool (MapType0Select g n_27))) (U_2_bool (MapType0Select g n_27_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_27 n_27_1))))
 :qid |stdinbpl.4732:35|
 :skolemid |498|
 :pattern ( (neverTriggered60 n_27) (neverTriggered60 n_27_1))
))) (=> (forall ((n_27@@0 T@U) (n_27_1@@0 T@U) ) (!  (=> (and (= (type n_27@@0) RefType) (= (type n_27_1@@0) RefType)) (=> (and (and (and (and (not (= n_27@@0 n_27_1@@0)) (U_2_bool (MapType0Select g n_27@@0))) (U_2_bool (MapType0Select g n_27_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_27@@0 n_27_1@@0))))
 :qid |stdinbpl.4732:35|
 :skolemid |498|
 :pattern ( (neverTriggered60 n_27@@0) (neverTriggered60 n_27_1@@0))
)) (=> (= (ControlFlow 0 199) (- 0 198)) (forall ((n_27@@1 T@U) ) (!  (=> (and (= (type n_27@@1) RefType) (U_2_bool (MapType0Select g n_27@@1))) (>= (U_2_real (MapType2Select QPMask@6 n_27@@1 next)) FullPerm))
 :qid |stdinbpl.4739:35|
 :skolemid |499|
 :pattern ( (MapType1Select ExhaleHeap@4 n_27@@1 next))
 :pattern ( (MapType2Select QPMask@20 n_27@@1 next))
 :pattern ( (MapType1Select ExhaleHeap@4 n_27@@1 next))
)))))))
(let ((anon251_Then_correct  (and (=> (= (ControlFlow 0 191) (- 0 192)) (forall ((n_30 T@U) (n_30_1 T@U) ) (!  (=> (and (= (type n_30) RefType) (= (type n_30_1) RefType)) (=> (and (and (and (and (not (= n_30 n_30_1)) (U_2_bool (MapType0Select g n_30))) (U_2_bool (MapType0Select g n_30_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_30 n_30_1))))
 :qid |stdinbpl.4905:35|
 :skolemid |516|
 :pattern ( (neverTriggered63 n_30) (neverTriggered63 n_30_1))
))) (=> (forall ((n_30@@0 T@U) (n_30_1@@0 T@U) ) (!  (=> (and (= (type n_30@@0) RefType) (= (type n_30_1@@0) RefType)) (=> (and (and (and (and (not (= n_30@@0 n_30_1@@0)) (U_2_bool (MapType0Select g n_30@@0))) (U_2_bool (MapType0Select g n_30_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_30@@0 n_30_1@@0))))
 :qid |stdinbpl.4905:35|
 :skolemid |516|
 :pattern ( (neverTriggered63 n_30@@0) (neverTriggered63 n_30_1@@0))
)) (=> (= (ControlFlow 0 191) (- 0 190)) (forall ((n_30@@1 T@U) ) (!  (=> (and (= (type n_30@@1) RefType) (U_2_bool (MapType0Select g n_30@@1))) (>= (U_2_real (MapType2Select QPMask@6 n_30@@1 next)) FullPerm))
 :qid |stdinbpl.4912:35|
 :skolemid |517|
 :pattern ( (MapType1Select ExhaleHeap@4 n_30@@1 next))
 :pattern ( (MapType2Select QPMask@23 n_30@@1 next))
 :pattern ( (MapType1Select ExhaleHeap@4 n_30@@1 next))
)))))))
(let ((anon250_Then_correct  (and (=> (= (ControlFlow 0 188) (- 0 189)) (forall ((n_29 T@U) (n_29_1 T@U) ) (!  (=> (and (= (type n_29) RefType) (= (type n_29_1) RefType)) (=> (and (and (and (and (not (= n_29 n_29_1)) (U_2_bool (MapType0Select g n_29))) (U_2_bool (MapType0Select g n_29_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_29 n_29_1))))
 :qid |stdinbpl.4853:35|
 :skolemid |510|
 :pattern ( (neverTriggered62 n_29) (neverTriggered62 n_29_1))
))) (=> (forall ((n_29@@0 T@U) (n_29_1@@0 T@U) ) (!  (=> (and (= (type n_29@@0) RefType) (= (type n_29_1@@0) RefType)) (=> (and (and (and (and (not (= n_29@@0 n_29_1@@0)) (U_2_bool (MapType0Select g n_29@@0))) (U_2_bool (MapType0Select g n_29_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_29@@0 n_29_1@@0))))
 :qid |stdinbpl.4853:35|
 :skolemid |510|
 :pattern ( (neverTriggered62 n_29@@0) (neverTriggered62 n_29_1@@0))
)) (=> (= (ControlFlow 0 188) (- 0 187)) (forall ((n_29@@1 T@U) ) (!  (=> (and (= (type n_29@@1) RefType) (U_2_bool (MapType0Select g n_29@@1))) (>= (U_2_real (MapType2Select QPMask@6 n_29@@1 next)) FullPerm))
 :qid |stdinbpl.4860:35|
 :skolemid |511|
 :pattern ( (MapType1Select ExhaleHeap@4 n_29@@1 next))
 :pattern ( (MapType2Select QPMask@22 n_29@@1 next))
 :pattern ( (MapType1Select ExhaleHeap@4 n_29@@1 next))
)))))))
(let ((anon125_correct true))
(let ((anon259_Else_correct  (=> (and (not (and (edge ($$ ExhaleHeap@4 g) last@2 (MapType1Select ExhaleHeap@4 last@2 next)) (exists_path ($$ ExhaleHeap@4 g) (MapType1Select ExhaleHeap@4 last@2 next) (MapType1Select ExhaleHeap@4 last@2 next)))) (= (ControlFlow 0 169) 165)) anon125_correct)))
(let ((anon259_Then_correct  (=> (and (edge ($$ ExhaleHeap@4 g) last@2 (MapType1Select ExhaleHeap@4 last@2 next)) (exists_path ($$ ExhaleHeap@4 g) (MapType1Select ExhaleHeap@4 last@2 next) (MapType1Select ExhaleHeap@4 last@2 next))) (and (=> (= (ControlFlow 0 167) (- 0 168)) (exists_path ($$ ExhaleHeap@4 g) last@2 (MapType1Select ExhaleHeap@4 last@2 next))) (=> (exists_path ($$ ExhaleHeap@4 g) last@2 (MapType1Select ExhaleHeap@4 last@2 next)) (=> (= (ControlFlow 0 167) 165) anon125_correct))))))
(let ((anon258_Then_correct  (=> (not (= (MapType1Select ExhaleHeap@4 last@2 next) null)) (and (=> (= (ControlFlow 0 170) 167) anon259_Then_correct) (=> (= (ControlFlow 0 170) 169) anon259_Else_correct)))))
(let ((anon258_Else_correct  (=> (and (= (MapType1Select ExhaleHeap@4 last@2 next) null) (= (ControlFlow 0 166) 165)) anon125_correct)))
(let ((anon256_Else_correct  (=> (forall ((n_34_1 T@U) ) (!  (=> (and (= (type n_34_1) RefType) (U_2_bool (MapType0Select g n_34_1))) (or (not (exists_path ($$ ExhaleHeap@4 g) x_1@@1 n_34_1)) (not (exists_path ($$ ExhaleHeap@4 g) y@@7 n_34_1))))
 :qid |stdinbpl.5039:28|
 :skolemid |530|
 :pattern ( (MapType0Select g n_34_1))
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| ExhaleHeap@4 g))) g) x_1@@1 n_34_1))
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| ExhaleHeap@4 g))) g) y@@7 n_34_1))
)) (and (=> (= (ControlFlow 0 171) (- 0 175)) (acyclic_graph ($$ ExhaleHeap@4 g))) (=> (acyclic_graph ($$ ExhaleHeap@4 g)) (and (=> (= (ControlFlow 0 171) (- 0 174)) (unshared_graph ($$ ExhaleHeap@4 g))) (=> (unshared_graph ($$ ExhaleHeap@4 g)) (and (=> (= (ControlFlow 0 171) (- 0 173)) (|Set#Equal| ($$ ExhaleHeap@4 g) old_g@0)) (=> (|Set#Equal| ($$ ExhaleHeap@4 g) old_g@0) (and (=> (= (ControlFlow 0 171) (- 0 172)) (exists_path ($$ ExhaleHeap@4 g) x_1@@1 last@2)) (=> (exists_path ($$ ExhaleHeap@4 g) x_1@@1 last@2) (and (=> (= (ControlFlow 0 171) 170) anon258_Then_correct) (=> (= (ControlFlow 0 171) 166) anon258_Else_correct)))))))))))))
(let ((anon121_correct true))
(let ((anon257_Else_correct  (=> (and (not (U_2_bool (MapType0Select g n_33))) (= (ControlFlow 0 164) 161)) anon121_correct)))
(let ((anon257_Then_correct  (=> (U_2_bool (MapType0Select g n_33)) (and (=> (= (ControlFlow 0 162) (- 0 163)) (or (not (exists_path ($$ ExhaleHeap@4 g) x_1@@1 n_33)) (not (exists_path ($$ ExhaleHeap@4 g) y@@7 n_33)))) (=> (or (not (exists_path ($$ ExhaleHeap@4 g) x_1@@1 n_33)) (not (exists_path ($$ ExhaleHeap@4 g) y@@7 n_33))) (=> (= (ControlFlow 0 162) 161) anon121_correct))))))
(let ((anon254_Else_correct  (=> (forall ((n_32_1 T@U) ) (!  (=> (and (= (type n_32_1) RefType) (U_2_bool (MapType0Select g n_32_1))) (or (exists_path ($$ ExhaleHeap@4 g) x_1@@1 n_32_1) (exists_path ($$ ExhaleHeap@4 g) y@@7 n_32_1)))
 :qid |stdinbpl.5028:28|
 :skolemid |529|
 :pattern ( (MapType0Select g n_32_1))
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| ExhaleHeap@4 g))) g) x_1@@1 n_32_1))
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| ExhaleHeap@4 g))) g) y@@7 n_32_1))
)) (and (and (=> (= (ControlFlow 0 176) 171) anon256_Else_correct) (=> (= (ControlFlow 0 176) 162) anon257_Then_correct)) (=> (= (ControlFlow 0 176) 164) anon257_Else_correct)))))
(let ((anon117_correct true))
(let ((anon255_Else_correct  (=> (and (not (U_2_bool (MapType0Select g n_31))) (= (ControlFlow 0 160) 157)) anon117_correct)))
(let ((anon255_Then_correct  (=> (U_2_bool (MapType0Select g n_31)) (and (=> (= (ControlFlow 0 158) (- 0 159)) (or (exists_path ($$ ExhaleHeap@4 g) x_1@@1 n_31) (exists_path ($$ ExhaleHeap@4 g) y@@7 n_31))) (=> (or (exists_path ($$ ExhaleHeap@4 g) x_1@@1 n_31) (exists_path ($$ ExhaleHeap@4 g) y@@7 n_31)) (=> (= (ControlFlow 0 158) 157) anon117_correct))))))
(let ((anon252_Else_correct  (=> (forall ((n$2_6_1 T@U) ) (!  (=> (= (type n$2_6_1) RefType) (=> (and (U_2_bool (MapType0Select g n$2_6_1)) (not (= (MapType1Select ExhaleHeap@4 n$2_6_1 next) null))) (U_2_bool (MapType0Select g (MapType1Select ExhaleHeap@4 n$2_6_1 next)))))
 :qid |stdinbpl.5011:28|
 :skolemid |528|
 :pattern ( (MapType0Select g (MapType1Select ExhaleHeap@4 n$2_6_1 next)))
 :pattern ( (MapType0Select g n$2_6_1) (MapType1Select ExhaleHeap@4 n$2_6_1 next))
)) (and (=> (= (ControlFlow 0 177) (- 0 180)) (U_2_bool (MapType0Select g last@2))) (=> (U_2_bool (MapType0Select g last@2)) (and (=> (= (ControlFlow 0 177) (- 0 179)) (U_2_bool (MapType0Select g x_1@@1))) (=> (U_2_bool (MapType0Select g x_1@@1)) (and (=> (= (ControlFlow 0 177) (- 0 178)) (U_2_bool (MapType0Select g y@@7))) (=> (U_2_bool (MapType0Select g y@@7)) (and (and (=> (= (ControlFlow 0 177) 176) anon254_Else_correct) (=> (= (ControlFlow 0 177) 158) anon255_Then_correct)) (=> (= (ControlFlow 0 177) 160) anon255_Else_correct)))))))))))
(let ((anon113_correct true))
(let ((anon253_Else_correct  (=> (and (not (and (U_2_bool (MapType0Select g n$2_5_1)) (not (= (MapType1Select ExhaleHeap@4 n$2_5_1 next) null)))) (= (ControlFlow 0 156) 153)) anon113_correct)))
(let ((anon253_Then_correct  (=> (and (U_2_bool (MapType0Select g n$2_5_1)) (not (= (MapType1Select ExhaleHeap@4 n$2_5_1 next) null))) (and (=> (= (ControlFlow 0 154) (- 0 155)) (U_2_bool (MapType0Select g (MapType1Select ExhaleHeap@4 n$2_5_1 next)))) (=> (U_2_bool (MapType0Select g (MapType1Select ExhaleHeap@4 n$2_5_1 next))) (=> (= (ControlFlow 0 154) 153) anon113_correct))))))
(let ((anon110_correct  (=> (and (state ExhaleHeap@4 QPMask@6) (state ExhaleHeap@4 QPMask@6)) (and (=> (= (ControlFlow 0 181) (- 0 185)) (HasDirectPerm QPMask@6 last@0 next)) (=> (HasDirectPerm QPMask@6 last@0 next) (=> (and (= last@2 (MapType1Select ExhaleHeap@4 last@0 next)) (state ExhaleHeap@4 QPMask@6)) (and (=> (= (ControlFlow 0 181) (- 0 184)) (not (U_2_bool (MapType0Select g null)))) (=> (not (U_2_bool (MapType0Select g null))) (and (=> (= (ControlFlow 0 181) (- 0 183)) (forall ((n$1_4 T@U) (n$1_4_1 T@U) ) (!  (=> (and (= (type n$1_4) RefType) (= (type n$1_4_1) RefType)) (=> (and (and (and (and (not (= n$1_4 n$1_4_1)) (U_2_bool (MapType0Select g n$1_4))) (U_2_bool (MapType0Select g n$1_4_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$1_4 n$1_4_1))))
 :qid |stdinbpl.4970:25|
 :skolemid |522|
 :pattern ( (neverTriggered64 n$1_4) (neverTriggered64 n$1_4_1))
))) (=> (forall ((n$1_4@@0 T@U) (n$1_4_1@@0 T@U) ) (!  (=> (and (= (type n$1_4@@0) RefType) (= (type n$1_4_1@@0) RefType)) (=> (and (and (and (and (not (= n$1_4@@0 n$1_4_1@@0)) (U_2_bool (MapType0Select g n$1_4@@0))) (U_2_bool (MapType0Select g n$1_4_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$1_4@@0 n$1_4_1@@0))))
 :qid |stdinbpl.4970:25|
 :skolemid |522|
 :pattern ( (neverTriggered64 n$1_4@@0) (neverTriggered64 n$1_4_1@@0))
)) (and (=> (= (ControlFlow 0 181) (- 0 182)) (forall ((n$1_4@@1 T@U) ) (!  (=> (and (= (type n$1_4@@1) RefType) (U_2_bool (MapType0Select g n$1_4@@1))) (>= (U_2_real (MapType2Select QPMask@6 n$1_4@@1 next)) FullPerm))
 :qid |stdinbpl.4977:25|
 :skolemid |523|
 :pattern ( (MapType1Select ExhaleHeap@4 n$1_4@@1 next))
 :pattern ( (MapType2Select QPMask@24 n$1_4@@1 next))
 :pattern ( (MapType1Select ExhaleHeap@4 n$1_4@@1 next))
))) (=> (forall ((n$1_4@@2 T@U) ) (!  (=> (and (= (type n$1_4@@2) RefType) (U_2_bool (MapType0Select g n$1_4@@2))) (>= (U_2_real (MapType2Select QPMask@6 n$1_4@@2 next)) FullPerm))
 :qid |stdinbpl.4977:25|
 :skolemid |523|
 :pattern ( (MapType1Select ExhaleHeap@4 n$1_4@@2 next))
 :pattern ( (MapType2Select QPMask@24 n$1_4@@2 next))
 :pattern ( (MapType1Select ExhaleHeap@4 n$1_4@@2 next))
)) (=> (and (and (forall ((n$1_4@@3 T@U) ) (!  (=> (= (type n$1_4@@3) RefType) (=> (and (U_2_bool (MapType0Select g n$1_4@@3)) (< NoPerm FullPerm)) (and (qpRange64 n$1_4@@3) (= (invRecv64 n$1_4@@3) n$1_4@@3))))
 :qid |stdinbpl.4983:30|
 :skolemid |524|
 :pattern ( (MapType1Select ExhaleHeap@4 n$1_4@@3 next))
 :pattern ( (MapType2Select QPMask@24 n$1_4@@3 next))
 :pattern ( (MapType1Select ExhaleHeap@4 n$1_4@@3 next))
)) (forall ((o_3@@2 T@U) ) (!  (=> (= (type o_3@@2) RefType) (=> (and (U_2_bool (MapType0Select g (invRecv64 o_3@@2))) (and (< NoPerm FullPerm) (qpRange64 o_3@@2))) (= (invRecv64 o_3@@2) o_3@@2)))
 :qid |stdinbpl.4987:30|
 :skolemid |525|
 :pattern ( (invRecv64 o_3@@2))
))) (and (forall ((o_3@@3 T@U) ) (!  (=> (= (type o_3@@3) RefType) (and (=> (and (U_2_bool (MapType0Select g (invRecv64 o_3@@3))) (and (< NoPerm FullPerm) (qpRange64 o_3@@3))) (and (= (invRecv64 o_3@@3) o_3@@3) (= (U_2_real (MapType2Select QPMask@24 o_3@@3 next)) (- (U_2_real (MapType2Select QPMask@6 o_3@@3 next)) FullPerm)))) (=> (not (and (U_2_bool (MapType0Select g (invRecv64 o_3@@3))) (and (< NoPerm FullPerm) (qpRange64 o_3@@3)))) (= (U_2_real (MapType2Select QPMask@24 o_3@@3 next)) (U_2_real (MapType2Select QPMask@6 o_3@@3 next))))))
 :qid |stdinbpl.4993:30|
 :skolemid |526|
 :pattern ( (MapType2Select QPMask@24 o_3@@3 next))
)) (forall ((o_3@@4 T@U) (f_5@@0 T@U) ) (! (let ((B@@12 (FieldTypeInv1 (type f_5@@0))))
(let ((A@@13 (FieldTypeInv0 (type f_5@@0))))
 (=> (and (and (= (type o_3@@4) RefType) (= (type f_5@@0) (FieldType A@@13 B@@12))) (not (= f_5@@0 next))) (= (U_2_real (MapType2Select QPMask@6 o_3@@4 f_5@@0)) (U_2_real (MapType2Select QPMask@24 o_3@@4 f_5@@0))))))
 :qid |stdinbpl.4999:37|
 :skolemid |527|
 :pattern ( (MapType2Select QPMask@24 o_3@@4 f_5@@0))
)))) (and (and (=> (= (ControlFlow 0 181) 177) anon252_Else_correct) (=> (= (ControlFlow 0 181) 154) anon253_Then_correct)) (=> (= (ControlFlow 0 181) 156) anon253_Else_correct)))))))))))))))
(let ((anon251_Else_correct  (=> (and (apply_IND ($$ ExhaleHeap@4 g) (|Set#Singleton| x_1@@1) (inst_uReach_2 ($$ ExhaleHeap@4 g) x_1@@1)) (= (ControlFlow 0 193) 181)) anon110_correct)))
(let ((anon249_Then_correct  (=> (and (not (= (MapType1Select ExhaleHeap@4 last@0 next) null)) (state ExhaleHeap@4 QPMask@6)) (and (and (=> (= (ControlFlow 0 194) 188) anon250_Then_correct) (=> (= (ControlFlow 0 194) 191) anon251_Then_correct)) (=> (= (ControlFlow 0 194) 193) anon251_Else_correct)))))
(let ((anon249_Else_correct  (=> (and (= (MapType1Select ExhaleHeap@4 last@0 next) null) (= (ControlFlow 0 186) 181)) anon110_correct)))
(let ((anon104_correct  (=> (and (state ExhaleHeap@4 QPMask@6) (state ExhaleHeap@4 QPMask@6)) (and (=> (= (ControlFlow 0 195) (- 0 196)) (HasDirectPerm QPMask@6 last@0 next)) (=> (HasDirectPerm QPMask@6 last@0 next) (and (=> (= (ControlFlow 0 195) 194) anon249_Then_correct) (=> (= (ControlFlow 0 195) 186) anon249_Else_correct)))))))
(let ((anon248_Else_correct  (and (=> (= (ControlFlow 0 204) (- 0 205)) (HasDirectPerm QPMask@6 last@0 next)) (=> (HasDirectPerm QPMask@6 last@0 next) (=> (and (apply_IND_2 ($$ ExhaleHeap@4 g) (|Set#Singleton| last@0) (inst_uReach_rev ($$ ExhaleHeap@4 g) (MapType1Select ExhaleHeap@4 last@0 next))) (= (ControlFlow 0 204) 195)) anon104_correct)))))
(let ((anon246_Then_correct  (=> (and (not (= (MapType1Select ExhaleHeap@4 last@0 next) null)) (state ExhaleHeap@4 QPMask@6)) (and (and (=> (= (ControlFlow 0 206) 199) anon247_Then_correct) (=> (= (ControlFlow 0 206) 202) anon248_Then_correct)) (=> (= (ControlFlow 0 206) 204) anon248_Else_correct)))))
(let ((anon246_Else_correct  (=> (and (= (MapType1Select ExhaleHeap@4 last@0 next) null) (= (ControlFlow 0 197) 195)) anon104_correct)))
(let ((anon98_correct  (=> (state ExhaleHeap@4 QPMask@6) (and (=> (= (ControlFlow 0 207) (- 0 209)) (HasDirectPerm QPMask@6 last@0 next)) (=> (HasDirectPerm QPMask@6 last@0 next) (=> (and (not (= (MapType1Select ExhaleHeap@4 last@0 next) null)) (state ExhaleHeap@4 QPMask@6)) (and (=> (= (ControlFlow 0 207) (- 0 208)) (HasDirectPerm QPMask@6 last@0 next)) (=> (HasDirectPerm QPMask@6 last@0 next) (and (=> (= (ControlFlow 0 207) 206) anon246_Then_correct) (=> (= (ControlFlow 0 207) 197) anon246_Else_correct))))))))))
(let ((anon245_Else_correct  (=> (and (not (and (edge ($$ ExhaleHeap@4 g) last@0 (MapType1Select ExhaleHeap@4 last@0 next)) (exists_path ($$ ExhaleHeap@4 g) (MapType1Select ExhaleHeap@4 last@0 next) (MapType1Select ExhaleHeap@4 last@0 next)))) (= (ControlFlow 0 212) 207)) anon98_correct)))
(let ((anon245_Then_correct  (=> (and (and (and (edge ($$ ExhaleHeap@4 g) last@0 (MapType1Select ExhaleHeap@4 last@0 next)) (exists_path ($$ ExhaleHeap@4 g) (MapType1Select ExhaleHeap@4 last@0 next) (MapType1Select ExhaleHeap@4 last@0 next))) (state ExhaleHeap@4 QPMask@6)) (and (exists_path ($$ ExhaleHeap@4 g) last@0 (MapType1Select ExhaleHeap@4 last@0 next)) (= (ControlFlow 0 211) 207))) anon98_correct)))
(let ((anon244_Then_correct  (=> (not (= (MapType1Select ExhaleHeap@4 last@0 next) null)) (and (=> (= (ControlFlow 0 213) 211) anon245_Then_correct) (=> (= (ControlFlow 0 213) 212) anon245_Else_correct)))))
(let ((anon244_Else_correct  (=> (and (= (MapType1Select ExhaleHeap@4 last@0 next) null) (= (ControlFlow 0 210) 207)) anon98_correct)))
(let ((anon243_Then_correct  (=> (and (state ExhaleHeap@4 ZeroMask) (not (U_2_bool (MapType0Select g null)))) (and (=> (= (ControlFlow 0 214) (- 0 215)) (forall ((n$1_3 T@U) (n$1_3_1 T@U) ) (!  (=> (and (= (type n$1_3) RefType) (= (type n$1_3_1) RefType)) (=> (and (and (and (and (not (= n$1_3 n$1_3_1)) (U_2_bool (MapType0Select g n$1_3))) (U_2_bool (MapType0Select g n$1_3_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$1_3 n$1_3_1))))
 :qid |stdinbpl.4637:23|
 :skolemid |489|
 :no-pattern (type n$1_3)
 :no-pattern (type n$1_3_1)
 :no-pattern (U_2_int n$1_3)
 :no-pattern (U_2_bool n$1_3)
 :no-pattern (U_2_int n$1_3_1)
 :no-pattern (U_2_bool n$1_3_1)
))) (=> (forall ((n$1_3@@0 T@U) (n$1_3_1@@0 T@U) ) (!  (=> (and (= (type n$1_3@@0) RefType) (= (type n$1_3_1@@0) RefType)) (=> (and (and (and (and (not (= n$1_3@@0 n$1_3_1@@0)) (U_2_bool (MapType0Select g n$1_3@@0))) (U_2_bool (MapType0Select g n$1_3_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$1_3@@0 n$1_3_1@@0))))
 :qid |stdinbpl.4637:23|
 :skolemid |489|
 :no-pattern (type n$1_3@@0)
 :no-pattern (type n$1_3_1@@0)
 :no-pattern (U_2_int n$1_3@@0)
 :no-pattern (U_2_bool n$1_3@@0)
 :no-pattern (U_2_int n$1_3_1@@0)
 :no-pattern (U_2_bool n$1_3_1@@0)
)) (=> (and (forall ((n$1_3@@1 T@U) ) (!  (=> (= (type n$1_3@@1) RefType) (=> (and (U_2_bool (MapType0Select g n$1_3@@1)) (< NoPerm FullPerm)) (and (qpRange59 n$1_3@@1) (= (invRecv59 n$1_3@@1) n$1_3@@1))))
 :qid |stdinbpl.4643:30|
 :skolemid |490|
 :pattern ( (MapType1Select ExhaleHeap@4 n$1_3@@1 next))
 :pattern ( (MapType2Select QPMask@6 n$1_3@@1 next))
 :pattern ( (MapType1Select ExhaleHeap@4 n$1_3@@1 next))
)) (forall ((o_3@@5 T@U) ) (!  (=> (= (type o_3@@5) RefType) (=> (and (and (U_2_bool (MapType0Select g (invRecv59 o_3@@5))) (< NoPerm FullPerm)) (qpRange59 o_3@@5)) (= (invRecv59 o_3@@5) o_3@@5)))
 :qid |stdinbpl.4647:30|
 :skolemid |491|
 :pattern ( (invRecv59 o_3@@5))
))) (=> (and (and (forall ((n$1_3@@2 T@U) ) (!  (=> (and (= (type n$1_3@@2) RefType) (U_2_bool (MapType0Select g n$1_3@@2))) (not (= n$1_3@@2 null)))
 :qid |stdinbpl.4653:30|
 :skolemid |492|
 :pattern ( (MapType1Select ExhaleHeap@4 n$1_3@@2 next))
 :pattern ( (MapType2Select QPMask@6 n$1_3@@2 next))
 :pattern ( (MapType1Select ExhaleHeap@4 n$1_3@@2 next))
)) (forall ((o_3@@6 T@U) ) (!  (=> (= (type o_3@@6) RefType) (and (=> (and (and (U_2_bool (MapType0Select g (invRecv59 o_3@@6))) (< NoPerm FullPerm)) (qpRange59 o_3@@6)) (and (=> (< NoPerm FullPerm) (= (invRecv59 o_3@@6) o_3@@6)) (= (U_2_real (MapType2Select QPMask@6 o_3@@6 next)) (+ (U_2_real (MapType2Select ZeroMask o_3@@6 next)) FullPerm)))) (=> (not (and (and (U_2_bool (MapType0Select g (invRecv59 o_3@@6))) (< NoPerm FullPerm)) (qpRange59 o_3@@6))) (= (U_2_real (MapType2Select QPMask@6 o_3@@6 next)) (U_2_real (MapType2Select ZeroMask o_3@@6 next))))))
 :qid |stdinbpl.4659:30|
 :skolemid |493|
 :pattern ( (MapType2Select QPMask@6 o_3@@6 next))
))) (and (forall ((o_3@@7 T@U) (f_5@@1 T@U) ) (! (let ((B@@13 (FieldTypeInv1 (type f_5@@1))))
(let ((A@@14 (FieldTypeInv0 (type f_5@@1))))
 (=> (and (and (= (type o_3@@7) RefType) (= (type f_5@@1) (FieldType A@@14 B@@13))) (not (= f_5@@1 next))) (= (U_2_real (MapType2Select ZeroMask o_3@@7 f_5@@1)) (U_2_real (MapType2Select QPMask@6 o_3@@7 f_5@@1))))))
 :qid |stdinbpl.4663:37|
 :skolemid |494|
 :pattern ( (MapType2Select ZeroMask o_3@@7 f_5@@1))
 :pattern ( (MapType2Select QPMask@6 o_3@@7 f_5@@1))
)) (state ExhaleHeap@4 QPMask@6))) (=> (and (and (and (and (forall ((n$2_4_1 T@U) ) (!  (=> (= (type n$2_4_1) RefType) (=> (and (U_2_bool (MapType0Select g n$2_4_1)) (not (= (MapType1Select ExhaleHeap@4 n$2_4_1 next) null))) (U_2_bool (MapType0Select g (MapType1Select ExhaleHeap@4 n$2_4_1 next)))))
 :qid |stdinbpl.4669:28|
 :skolemid |495|
 :pattern ( (MapType0Select g (MapType1Select ExhaleHeap@4 n$2_4_1 next)))
 :pattern ( (MapType0Select g n$2_4_1) (MapType1Select ExhaleHeap@4 n$2_4_1 next))
)) (U_2_bool (MapType0Select g last@0))) (and (U_2_bool (MapType0Select g x_1@@1)) (U_2_bool (MapType0Select g y@@7)))) (and (and (state ExhaleHeap@4 QPMask@6) (forall ((n_25 T@U) ) (!  (=> (and (= (type n_25) RefType) (U_2_bool (MapType0Select g n_25))) (or (exists_path ($$ ExhaleHeap@4 g) x_1@@1 n_25) (exists_path ($$ ExhaleHeap@4 g) y@@7 n_25)))
 :qid |stdinbpl.4677:28|
 :skolemid |496|
 :pattern ( (MapType0Select g n_25))
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| ExhaleHeap@4 g))) g) x_1@@1 n_25))
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| ExhaleHeap@4 g))) g) y@@7 n_25))
))) (and (state ExhaleHeap@4 QPMask@6) (forall ((n_26 T@U) ) (!  (=> (and (= (type n_26) RefType) (U_2_bool (MapType0Select g n_26))) (or (not (exists_path ($$ ExhaleHeap@4 g) x_1@@1 n_26)) (not (exists_path ($$ ExhaleHeap@4 g) y@@7 n_26))))
 :qid |stdinbpl.4682:28|
 :skolemid |497|
 :pattern ( (MapType0Select g n_26))
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| ExhaleHeap@4 g))) g) x_1@@1 n_26))
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| ExhaleHeap@4 g))) g) y@@7 n_26))
))))) (and (and (and (state ExhaleHeap@4 QPMask@6) (acyclic_graph ($$ ExhaleHeap@4 g))) (and (state ExhaleHeap@4 QPMask@6) (unshared_graph ($$ ExhaleHeap@4 g)))) (and (and (state ExhaleHeap@4 QPMask@6) (|Set#Equal| ($$ ExhaleHeap@4 g) old_g@0)) (and (state ExhaleHeap@4 QPMask@6) (exists_path ($$ ExhaleHeap@4 g) x_1@@1 last@0))))) (and (=> (= (ControlFlow 0 214) 213) anon244_Then_correct) (=> (= (ControlFlow 0 214) 210) anon244_Else_correct))))))))))
(let ((anon292_Else_correct true))
(let ((anon292_Then_correct  (and (=> (= (ControlFlow 0 115) (- 0 116)) (forall ((n_47 T@U) (n_47_1 T@U) ) (!  (=> (and (= (type n_47) RefType) (= (type n_47_1) RefType)) (=> (and (and (and (and (not (= n_47 n_47_1)) (U_2_bool (MapType0Select g n_47))) (U_2_bool (MapType0Select g n_47_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_47 n_47_1))))
 :qid |stdinbpl.5891:23|
 :skolemid |615|
 :pattern ( (neverTriggered77 n_47) (neverTriggered77 n_47_1))
))) (=> (forall ((n_47@@0 T@U) (n_47_1@@0 T@U) ) (!  (=> (and (= (type n_47@@0) RefType) (= (type n_47_1@@0) RefType)) (=> (and (and (and (and (not (= n_47@@0 n_47_1@@0)) (U_2_bool (MapType0Select g n_47@@0))) (U_2_bool (MapType0Select g n_47_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_47@@0 n_47_1@@0))))
 :qid |stdinbpl.5891:23|
 :skolemid |615|
 :pattern ( (neverTriggered77 n_47@@0) (neverTriggered77 n_47_1@@0))
)) (=> (= (ControlFlow 0 115) (- 0 114)) (forall ((n_47@@1 T@U) ) (!  (=> (and (= (type n_47@@1) RefType) (U_2_bool (MapType0Select g n_47@@1))) (>= (U_2_real (MapType2Select Mask@0 n_47@@1 next)) FullPerm))
 :qid |stdinbpl.5898:23|
 :skolemid |616|
 :pattern ( (MapType1Select Heap@0 n_47@@1 next))
 :pattern ( (MapType2Select QPMask@13 n_47@@1 next))
 :pattern ( (MapType1Select Heap@0 n_47@@1 next))
)))))))
(let ((anon293_Else_correct true))
(let ((anon293_Then_correct  (=> (= (ControlFlow 0 112) (- 0 111)) (= (edge ($$ Heap@0 g) u_10 v_7)  (or (edge old_g@0 u_10 v_7) (and (= u_10 last@1) (= v_7 y@@7)))))))
(let ((anon290_Else_correct  (=> (and (forall ((u_8_1 T@U) ) (!  (=> (= (type u_8_1) RefType) (= (exists_path ($$ Heap@0 g) x_1@@1 u_8_1)  (or (exists_path old_g@0 x_1@@1 u_8_1) (exists_path old_g@0 y@@7 u_8_1))))
 :qid |stdinbpl.5865:20|
 :skolemid |614|
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| Heap@0 g))) g) x_1@@1 u_8_1))
 :pattern ( (exists_path old_g@0 x_1@@1 u_8_1))
 :pattern ( (exists_path old_g@0 y@@7 u_8_1))
)) (state Heap@0 Mask@0)) (and (and (and (=> (= (ControlFlow 0 118) 112) anon293_Then_correct) (=> (= (ControlFlow 0 118) 113) anon293_Else_correct)) (=> (= (ControlFlow 0 118) 115) anon292_Then_correct)) (=> (= (ControlFlow 0 118) 117) anon292_Else_correct)))))
(let ((anon289_Else_correct true))
(let ((anon289_Then_correct  (and (=> (= (ControlFlow 0 108) (- 0 109)) (forall ((n_46 T@U) (n_46_1 T@U) ) (!  (=> (and (= (type n_46) RefType) (= (type n_46_1) RefType)) (=> (and (and (and (and (not (= n_46 n_46_1)) (U_2_bool (MapType0Select g n_46))) (U_2_bool (MapType0Select g n_46_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_46 n_46_1))))
 :qid |stdinbpl.5817:23|
 :skolemid |608|
 :pattern ( (neverTriggered76 n_46) (neverTriggered76 n_46_1))
))) (=> (forall ((n_46@@0 T@U) (n_46_1@@0 T@U) ) (!  (=> (and (= (type n_46@@0) RefType) (= (type n_46_1@@0) RefType)) (=> (and (and (and (and (not (= n_46@@0 n_46_1@@0)) (U_2_bool (MapType0Select g n_46@@0))) (U_2_bool (MapType0Select g n_46_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_46@@0 n_46_1@@0))))
 :qid |stdinbpl.5817:23|
 :skolemid |608|
 :pattern ( (neverTriggered76 n_46@@0) (neverTriggered76 n_46_1@@0))
)) (=> (= (ControlFlow 0 108) (- 0 107)) (forall ((n_46@@1 T@U) ) (!  (=> (and (= (type n_46@@1) RefType) (U_2_bool (MapType0Select g n_46@@1))) (>= (U_2_real (MapType2Select Mask@0 n_46@@1 next)) FullPerm))
 :qid |stdinbpl.5824:23|
 :skolemid |609|
 :pattern ( (MapType1Select Heap@0 n_46@@1 next))
 :pattern ( (MapType2Select QPMask@14 n_46@@1 next))
 :pattern ( (MapType1Select Heap@0 n_46@@1 next))
)))))))
(let ((anon290_Then_correct  (=> (= (ControlFlow 0 106) (- 0 105)) (= (exists_path ($$ Heap@0 g) x_1@@1 u_7)  (or (exists_path old_g@0 x_1@@1 u_7) (exists_path old_g@0 y@@7 u_7))))))
(let ((anon287_Else_correct  (and (=> (= (ControlFlow 0 119) (- 0 120)) (unshared_graph ($$ Heap@0 g))) (=> (unshared_graph ($$ Heap@0 g)) (=> (state Heap@0 Mask@0) (and (and (and (=> (= (ControlFlow 0 119) 106) anon290_Then_correct) (=> (= (ControlFlow 0 119) 118) anon290_Else_correct)) (=> (= (ControlFlow 0 119) 108) anon289_Then_correct)) (=> (= (ControlFlow 0 119) 110) anon289_Else_correct)))))))
(let ((anon287_Then_correct  (and (=> (= (ControlFlow 0 103) (- 0 104)) (forall ((n_45 T@U) (n_45_1 T@U) ) (!  (=> (and (= (type n_45) RefType) (= (type n_45_1) RefType)) (=> (and (and (and (and (not (= n_45 n_45_1)) (U_2_bool (MapType0Select g n_45))) (U_2_bool (MapType0Select g n_45_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_45 n_45_1))))
 :qid |stdinbpl.5750:21|
 :skolemid |602|
 :pattern ( (neverTriggered75 n_45) (neverTriggered75 n_45_1))
))) (=> (forall ((n_45@@0 T@U) (n_45_1@@0 T@U) ) (!  (=> (and (= (type n_45@@0) RefType) (= (type n_45_1@@0) RefType)) (=> (and (and (and (and (not (= n_45@@0 n_45_1@@0)) (U_2_bool (MapType0Select g n_45@@0))) (U_2_bool (MapType0Select g n_45_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_45@@0 n_45_1@@0))))
 :qid |stdinbpl.5750:21|
 :skolemid |602|
 :pattern ( (neverTriggered75 n_45@@0) (neverTriggered75 n_45_1@@0))
)) (=> (= (ControlFlow 0 103) (- 0 102)) (forall ((n_45@@1 T@U) ) (!  (=> (and (= (type n_45@@1) RefType) (U_2_bool (MapType0Select g n_45@@1))) (>= (U_2_real (MapType2Select Mask@0 n_45@@1 next)) FullPerm))
 :qid |stdinbpl.5757:21|
 :skolemid |603|
 :pattern ( (MapType1Select Heap@0 n_45@@1 next))
 :pattern ( (MapType2Select QPMask@12 n_45@@1 next))
 :pattern ( (MapType1Select Heap@0 n_45@@1 next))
)))))))
(let ((anon286_Else_correct  (and (=> (= (ControlFlow 0 121) (- 0 122)) (acyclic_graph ($$ Heap@0 g))) (=> (acyclic_graph ($$ Heap@0 g)) (=> (state Heap@0 Mask@0) (and (=> (= (ControlFlow 0 121) 103) anon287_Then_correct) (=> (= (ControlFlow 0 121) 119) anon287_Else_correct)))))))
(let ((anon286_Then_correct  (and (=> (= (ControlFlow 0 100) (- 0 101)) (forall ((n_44 T@U) (n_44_1 T@U) ) (!  (=> (and (= (type n_44) RefType) (= (type n_44_1) RefType)) (=> (and (and (and (and (not (= n_44 n_44_1)) (U_2_bool (MapType0Select g n_44))) (U_2_bool (MapType0Select g n_44_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_44 n_44_1))))
 :qid |stdinbpl.5689:21|
 :skolemid |596|
 :pattern ( (neverTriggered74 n_44) (neverTriggered74 n_44_1))
))) (=> (forall ((n_44@@0 T@U) (n_44_1@@0 T@U) ) (!  (=> (and (= (type n_44@@0) RefType) (= (type n_44_1@@0) RefType)) (=> (and (and (and (and (not (= n_44@@0 n_44_1@@0)) (U_2_bool (MapType0Select g n_44@@0))) (U_2_bool (MapType0Select g n_44_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_44@@0 n_44_1@@0))))
 :qid |stdinbpl.5689:21|
 :skolemid |596|
 :pattern ( (neverTriggered74 n_44@@0) (neverTriggered74 n_44_1@@0))
)) (=> (= (ControlFlow 0 100) (- 0 99)) (forall ((n_44@@1 T@U) ) (!  (=> (and (= (type n_44@@1) RefType) (U_2_bool (MapType0Select g n_44@@1))) (>= (U_2_real (MapType2Select Mask@0 n_44@@1 next)) FullPerm))
 :qid |stdinbpl.5696:21|
 :skolemid |597|
 :pattern ( (MapType1Select Heap@0 n_44@@1 next))
 :pattern ( (MapType2Select QPMask@11 n_44@@1 next))
 :pattern ( (MapType1Select Heap@0 n_44@@1 next))
)))))))
(let ((anon285_Else_correct  (and (=> (= (ControlFlow 0 123) (- 0 124)) (func_graph ($$ Heap@0 g))) (=> (func_graph ($$ Heap@0 g)) (=> (state Heap@0 Mask@0) (and (=> (= (ControlFlow 0 123) 100) anon286_Then_correct) (=> (= (ControlFlow 0 123) 121) anon286_Else_correct)))))))
(let ((anon285_Then_correct  (and (=> (= (ControlFlow 0 97) (- 0 98)) (forall ((n_43 T@U) (n_43_1 T@U) ) (!  (=> (and (= (type n_43) RefType) (= (type n_43_1) RefType)) (=> (and (and (and (and (not (= n_43 n_43_1)) (U_2_bool (MapType0Select g n_43))) (U_2_bool (MapType0Select g n_43_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_43 n_43_1))))
 :qid |stdinbpl.5628:21|
 :skolemid |590|
 :pattern ( (neverTriggered73 n_43) (neverTriggered73 n_43_1))
))) (=> (forall ((n_43@@0 T@U) (n_43_1@@0 T@U) ) (!  (=> (and (= (type n_43@@0) RefType) (= (type n_43_1@@0) RefType)) (=> (and (and (and (and (not (= n_43@@0 n_43_1@@0)) (U_2_bool (MapType0Select g n_43@@0))) (U_2_bool (MapType0Select g n_43_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_43@@0 n_43_1@@0))))
 :qid |stdinbpl.5628:21|
 :skolemid |590|
 :pattern ( (neverTriggered73 n_43@@0) (neverTriggered73 n_43_1@@0))
)) (=> (= (ControlFlow 0 97) (- 0 96)) (forall ((n_43@@1 T@U) ) (!  (=> (and (= (type n_43@@1) RefType) (U_2_bool (MapType0Select g n_43@@1))) (>= (U_2_real (MapType2Select Mask@0 n_43@@1 next)) FullPerm))
 :qid |stdinbpl.5635:21|
 :skolemid |591|
 :pattern ( (MapType1Select Heap@0 n_43@@1 next))
 :pattern ( (MapType2Select QPMask@10 n_43@@1 next))
 :pattern ( (MapType1Select Heap@0 n_43@@1 next))
)))))))
(let ((anon172_correct  (=> (and (state Heap@0 Mask@0) (state Heap@0 Mask@0)) (and (=> (= (ControlFlow 0 125) 97) anon285_Then_correct) (=> (= (ControlFlow 0 125) 123) anon285_Else_correct)))))
(let ((anon283_Else_correct  (=> (and (forall ((u_5_1 T@U) (v_5_1 T@U) ) (!  (=> (and (and (= (type u_5_1) RefType) (= (type v_5_1) RefType)) (not (exists_path ($$ ExhaleHeap@5 g) u_5_1 v_5_1))) (not (edge ($$ ExhaleHeap@5 g) u_5_1 v_5_1)))
 :qid |stdinbpl.5600:24|
 :skolemid |589|
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| ExhaleHeap@5 g))) g) u_5_1 v_5_1))
 :pattern ( (edge (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| ExhaleHeap@5 g))) g) u_5_1 v_5_1))
)) (state ExhaleHeap@5 QPMask@9)) (=> (and (and (= Heap@0 ExhaleHeap@5) (= Mask@0 QPMask@9)) (and (= last@1 last@0) (= (ControlFlow 0 127) 125))) anon172_correct))))
(let ((anon209_Then_correct  (=> (and (= x_1@@1 null) (state Heap@@13 QPMask@0)) (=> (and (and (= Heap@0 Heap@@13) (= Mask@0 QPMask@0)) (and (= last@1 x_1@@1) (= (ControlFlow 0 126) 125))) anon172_correct))))
(let ((anon170_correct true))
(let ((anon284_Else_correct  (=> (and (exists_path ($$ ExhaleHeap@5 g) u_4 v_4_1) (= (ControlFlow 0 95) 92)) anon170_correct)))
(let ((anon284_Then_correct  (=> (not (exists_path ($$ ExhaleHeap@5 g) u_4 v_4_1)) (and (=> (= (ControlFlow 0 93) (- 0 94)) (not (edge ($$ ExhaleHeap@5 g) u_4 v_4_1))) (=> (not (edge ($$ ExhaleHeap@5 g) u_4 v_4_1)) (=> (= (ControlFlow 0 93) 92) anon170_correct))))))
(let ((anon282_Then_correct  (and (=> (= (ControlFlow 0 89) (- 0 90)) (forall ((n_42 T@U) (n_42_1 T@U) ) (!  (=> (and (= (type n_42) RefType) (= (type n_42_1) RefType)) (=> (and (and (and (and (not (= n_42 n_42_1)) (U_2_bool (MapType0Select g n_42))) (U_2_bool (MapType0Select g n_42_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_42 n_42_1))))
 :qid |stdinbpl.5549:29|
 :skolemid |583|
 :pattern ( (neverTriggered72 n_42) (neverTriggered72 n_42_1))
))) (=> (forall ((n_42@@0 T@U) (n_42_1@@0 T@U) ) (!  (=> (and (= (type n_42@@0) RefType) (= (type n_42_1@@0) RefType)) (=> (and (and (and (and (not (= n_42@@0 n_42_1@@0)) (U_2_bool (MapType0Select g n_42@@0))) (U_2_bool (MapType0Select g n_42_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_42@@0 n_42_1@@0))))
 :qid |stdinbpl.5549:29|
 :skolemid |583|
 :pattern ( (neverTriggered72 n_42@@0) (neverTriggered72 n_42_1@@0))
)) (=> (= (ControlFlow 0 89) (- 0 88)) (forall ((n_42@@1 T@U) ) (!  (=> (and (= (type n_42@@1) RefType) (U_2_bool (MapType0Select g n_42@@1))) (>= (U_2_real (MapType2Select QPMask@9 n_42@@1 next)) FullPerm))
 :qid |stdinbpl.5556:29|
 :skolemid |584|
 :pattern ( (MapType1Select ExhaleHeap@5 n_42@@1 next))
 :pattern ( (MapType2Select QPMask@16 n_42@@1 next))
 :pattern ( (MapType1Select ExhaleHeap@5 n_42@@1 next))
)))))))
(let ((anon166_correct true))
(let ((anon281_Then_correct  (=> (not (exists_path ($$ ExhaleHeap@5 g) u_3 v_4)) (and (=> (= (ControlFlow 0 91) 89) anon282_Then_correct) (=> (= (ControlFlow 0 91) 86) anon166_correct)))))
(let ((anon281_Else_correct  (=> (and (exists_path ($$ ExhaleHeap@5 g) u_3 v_4) (= (ControlFlow 0 87) 86)) anon166_correct)))
(let ((anon280_Then_correct  (and (=> (= (ControlFlow 0 84) (- 0 85)) (forall ((n_41 T@U) (n_41_1 T@U) ) (!  (=> (and (= (type n_41) RefType) (= (type n_41_1) RefType)) (=> (and (and (and (and (not (= n_41 n_41_1)) (U_2_bool (MapType0Select g n_41))) (U_2_bool (MapType0Select g n_41_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_41 n_41_1))))
 :qid |stdinbpl.5496:27|
 :skolemid |577|
 :pattern ( (neverTriggered71 n_41) (neverTriggered71 n_41_1))
))) (=> (forall ((n_41@@0 T@U) (n_41_1@@0 T@U) ) (!  (=> (and (= (type n_41@@0) RefType) (= (type n_41_1@@0) RefType)) (=> (and (and (and (and (not (= n_41@@0 n_41_1@@0)) (U_2_bool (MapType0Select g n_41@@0))) (U_2_bool (MapType0Select g n_41_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_41@@0 n_41_1@@0))))
 :qid |stdinbpl.5496:27|
 :skolemid |577|
 :pattern ( (neverTriggered71 n_41@@0) (neverTriggered71 n_41_1@@0))
)) (=> (= (ControlFlow 0 84) (- 0 83)) (forall ((n_41@@1 T@U) ) (!  (=> (and (= (type n_41@@1) RefType) (U_2_bool (MapType0Select g n_41@@1))) (>= (U_2_real (MapType2Select QPMask@9 n_41@@1 next)) FullPerm))
 :qid |stdinbpl.5503:27|
 :skolemid |578|
 :pattern ( (MapType1Select ExhaleHeap@5 n_41@@1 next))
 :pattern ( (MapType2Select QPMask@15 n_41@@1 next))
 :pattern ( (MapType1Select ExhaleHeap@5 n_41@@1 next))
)))))))
(let ((anon276_Else_correct  (=> (and (forall ((u_2_1 T@U) (v_2_1 T@U) ) (!  (=> (and (and (= (type u_2_1) RefType) (= (type v_2_1) RefType)) (not (exists_path ($$ ExhaleHeap@5 g) u_2_1 v_2_1))) (and (not (= u_2_1 v_2_1)) (forall ((w_3_1 T@U) ) (!  (=> (= (type w_3_1) RefType) (or (not (edge ($$ ExhaleHeap@5 g) u_2_1 w_3_1)) (not (exists_path ($$ ExhaleHeap@5 g) w_3_1 v_2_1))))
 :qid |stdinbpl.5469:89|
 :skolemid |575|
 :pattern ( (edge (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| ExhaleHeap@5 g))) g) u_2_1 w_3_1))
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| ExhaleHeap@5 g))) g) w_3_1 v_2_1))
))))
 :qid |stdinbpl.5467:24|
 :skolemid |576|
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| ExhaleHeap@5 g))) g) u_2_1 v_2_1))
)) (state ExhaleHeap@5 QPMask@9)) (and (and (and (and (and (=> (= (ControlFlow 0 128) 127) anon283_Else_correct) (=> (= (ControlFlow 0 128) 93) anon284_Then_correct)) (=> (= (ControlFlow 0 128) 95) anon284_Else_correct)) (=> (= (ControlFlow 0 128) 84) anon280_Then_correct)) (=> (= (ControlFlow 0 128) 91) anon281_Then_correct)) (=> (= (ControlFlow 0 128) 87) anon281_Else_correct)))))
(let ((anon278_Then_correct  (=> (= (ControlFlow 0 79) (- 0 78)) (or (not (edge ($$ ExhaleHeap@5 g) u_1_1@@1 w_1_1)) (not (exists_path ($$ ExhaleHeap@5 g) w_1_1 v_1_1))))))
(let ((anon159_correct true))
(let ((anon278_Else_correct  (=> (and (forall ((w_2_1 T@U) ) (!  (=> (= (type w_2_1) RefType) (or (not (edge ($$ ExhaleHeap@5 g) u_1_1@@1 w_2_1)) (not (exists_path ($$ ExhaleHeap@5 g) w_2_1 v_1_1))))
 :qid |stdinbpl.5460:28|
 :skolemid |574|
 :pattern ( (edge (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| ExhaleHeap@5 g))) g) u_1_1@@1 w_2_1))
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| ExhaleHeap@5 g))) g) w_2_1 v_1_1))
)) (= (ControlFlow 0 80) 76)) anon159_correct)))
(let ((anon277_Then_correct  (=> (not (exists_path ($$ ExhaleHeap@5 g) u_1_1@@1 v_1_1)) (and (=> (= (ControlFlow 0 81) (- 0 82)) (not (= u_1_1@@1 v_1_1))) (=> (not (= u_1_1@@1 v_1_1)) (and (=> (= (ControlFlow 0 81) 79) anon278_Then_correct) (=> (= (ControlFlow 0 81) 80) anon278_Else_correct)))))))
(let ((anon277_Else_correct  (=> (and (exists_path ($$ ExhaleHeap@5 g) u_1_1@@1 v_1_1) (= (ControlFlow 0 77) 76)) anon159_correct)))
(let ((anon275_Then_correct  (and (=> (= (ControlFlow 0 71) (- 0 72)) (forall ((n_40 T@U) (n_40_1 T@U) ) (!  (=> (and (= (type n_40) RefType) (= (type n_40_1) RefType)) (=> (and (and (and (and (not (= n_40 n_40_1)) (U_2_bool (MapType0Select g n_40))) (U_2_bool (MapType0Select g n_40_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_40 n_40_1))))
 :qid |stdinbpl.5403:35|
 :skolemid |568|
 :pattern ( (neverTriggered70 n_40) (neverTriggered70 n_40_1))
))) (=> (forall ((n_40@@0 T@U) (n_40_1@@0 T@U) ) (!  (=> (and (= (type n_40@@0) RefType) (= (type n_40_1@@0) RefType)) (=> (and (and (and (and (not (= n_40@@0 n_40_1@@0)) (U_2_bool (MapType0Select g n_40@@0))) (U_2_bool (MapType0Select g n_40_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_40@@0 n_40_1@@0))))
 :qid |stdinbpl.5403:35|
 :skolemid |568|
 :pattern ( (neverTriggered70 n_40@@0) (neverTriggered70 n_40_1@@0))
)) (=> (= (ControlFlow 0 71) (- 0 70)) (forall ((n_40@@1 T@U) ) (!  (=> (and (= (type n_40@@1) RefType) (U_2_bool (MapType0Select g n_40@@1))) (>= (U_2_real (MapType2Select QPMask@9 n_40@@1 next)) FullPerm))
 :qid |stdinbpl.5410:35|
 :skolemid |569|
 :pattern ( (MapType1Select ExhaleHeap@5 n_40@@1 next))
 :pattern ( (MapType2Select QPMask@19 n_40@@1 next))
 :pattern ( (MapType1Select ExhaleHeap@5 n_40@@1 next))
)))))))
(let ((anon152_correct true))
(let ((anon274_Then_correct  (=> (edge ($$ ExhaleHeap@5 g) u_2 w_3) (and (=> (= (ControlFlow 0 73) 71) anon275_Then_correct) (=> (= (ControlFlow 0 73) 68) anon152_correct)))))
(let ((anon274_Else_correct  (=> (and (not (edge ($$ ExhaleHeap@5 g) u_2 w_3)) (= (ControlFlow 0 69) 68)) anon152_correct)))
(let ((anon273_Then_correct  (and (=> (= (ControlFlow 0 66) (- 0 67)) (forall ((n_39 T@U) (n_39_1 T@U) ) (!  (=> (and (= (type n_39) RefType) (= (type n_39_1) RefType)) (=> (and (and (and (and (not (= n_39 n_39_1)) (U_2_bool (MapType0Select g n_39))) (U_2_bool (MapType0Select g n_39_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_39 n_39_1))))
 :qid |stdinbpl.5350:33|
 :skolemid |562|
 :pattern ( (neverTriggered69 n_39) (neverTriggered69 n_39_1))
))) (=> (forall ((n_39@@0 T@U) (n_39_1@@0 T@U) ) (!  (=> (and (= (type n_39@@0) RefType) (= (type n_39_1@@0) RefType)) (=> (and (and (and (and (not (= n_39@@0 n_39_1@@0)) (U_2_bool (MapType0Select g n_39@@0))) (U_2_bool (MapType0Select g n_39_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_39@@0 n_39_1@@0))))
 :qid |stdinbpl.5350:33|
 :skolemid |562|
 :pattern ( (neverTriggered69 n_39@@0) (neverTriggered69 n_39_1@@0))
)) (=> (= (ControlFlow 0 66) (- 0 65)) (forall ((n_39@@1 T@U) ) (!  (=> (and (= (type n_39@@1) RefType) (U_2_bool (MapType0Select g n_39@@1))) (>= (U_2_real (MapType2Select QPMask@9 n_39@@1 next)) FullPerm))
 :qid |stdinbpl.5357:33|
 :skolemid |563|
 :pattern ( (MapType1Select ExhaleHeap@5 n_39@@1 next))
 :pattern ( (MapType2Select QPMask@18 n_39@@1 next))
 :pattern ( (MapType1Select ExhaleHeap@5 n_39@@1 next))
)))))))
(let ((anon153_correct true))
(let ((anon271_Then_correct  (=> (not (= u_2 v_3)) (and (and (and (=> (= (ControlFlow 0 74) 62) anon153_correct) (=> (= (ControlFlow 0 74) 66) anon273_Then_correct)) (=> (= (ControlFlow 0 74) 73) anon274_Then_correct)) (=> (= (ControlFlow 0 74) 69) anon274_Else_correct)))))
(let ((anon271_Else_correct  (=> (and (= u_2 v_3) (= (ControlFlow 0 64) 62)) anon153_correct)))
(let ((anon270_Then_correct  (=> (not (exists_path ($$ ExhaleHeap@5 g) u_2 v_3)) (and (=> (= (ControlFlow 0 75) 74) anon271_Then_correct) (=> (= (ControlFlow 0 75) 64) anon271_Else_correct)))))
(let ((anon270_Else_correct  (=> (and (exists_path ($$ ExhaleHeap@5 g) u_2 v_3) (= (ControlFlow 0 63) 62)) anon153_correct)))
(let ((anon269_Then_correct  (and (=> (= (ControlFlow 0 60) (- 0 61)) (forall ((n_38 T@U) (n_38_1 T@U) ) (!  (=> (and (= (type n_38) RefType) (= (type n_38_1) RefType)) (=> (and (and (and (and (not (= n_38 n_38_1)) (U_2_bool (MapType0Select g n_38))) (U_2_bool (MapType0Select g n_38_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_38 n_38_1))))
 :qid |stdinbpl.5295:27|
 :skolemid |556|
 :pattern ( (neverTriggered68 n_38) (neverTriggered68 n_38_1))
))) (=> (forall ((n_38@@0 T@U) (n_38_1@@0 T@U) ) (!  (=> (and (= (type n_38@@0) RefType) (= (type n_38_1@@0) RefType)) (=> (and (and (and (and (not (= n_38@@0 n_38_1@@0)) (U_2_bool (MapType0Select g n_38@@0))) (U_2_bool (MapType0Select g n_38_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_38@@0 n_38_1@@0))))
 :qid |stdinbpl.5295:27|
 :skolemid |556|
 :pattern ( (neverTriggered68 n_38@@0) (neverTriggered68 n_38_1@@0))
)) (=> (= (ControlFlow 0 60) (- 0 59)) (forall ((n_38@@1 T@U) ) (!  (=> (and (= (type n_38@@1) RefType) (U_2_bool (MapType0Select g n_38@@1))) (>= (U_2_real (MapType2Select QPMask@9 n_38@@1 next)) FullPerm))
 :qid |stdinbpl.5302:27|
 :skolemid |557|
 :pattern ( (MapType1Select ExhaleHeap@5 n_38@@1 next))
 :pattern ( (MapType2Select QPMask@17 n_38@@1 next))
 :pattern ( (MapType1Select ExhaleHeap@5 n_38@@1 next))
)))))))
(let ((anon141_correct  (=> (and (state ExhaleHeap@5 QPMask@9) (state ExhaleHeap@5 QPMask@9)) (and (and (and (and (and (=> (= (ControlFlow 0 129) 128) anon276_Else_correct) (=> (= (ControlFlow 0 129) 81) anon277_Then_correct)) (=> (= (ControlFlow 0 129) 77) anon277_Else_correct)) (=> (= (ControlFlow 0 129) 60) anon269_Then_correct)) (=> (= (ControlFlow 0 129) 75) anon270_Then_correct)) (=> (= (ControlFlow 0 129) 63) anon270_Else_correct)))))
(let ((anon267_Else_correct  (=> (and (= y@@7 null) (= (ControlFlow 0 131) 129)) anon141_correct)))
(let ((anon267_Then_correct  (=> (and (and (not (= y@@7 null)) (state ExhaleHeap@5 QPMask@9)) (and (forall ((v1_1 T@U) (v2_1 T@U) ) (!  (=> (and (= (type v1_1) RefType) (= (type v2_1) RefType)) (= (exists_path ($$ ExhaleHeap@5 g) v1_1 v2_1)  (or (exists_path ($$ ExhaleHeap@4 g) v1_1 v2_1) (and (exists_path ($$ ExhaleHeap@4 g) v1_1 last@0) (exists_path ($$ ExhaleHeap@4 g) y@@7 v2_1)))))
 :qid |stdinbpl.5263:28|
 :skolemid |555|
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| ExhaleHeap@5 g))) g) v1_1 v2_1))
)) (= (ControlFlow 0 130) 129))) anon141_correct)))
(let ((anon266_Else_correct  (=> (= y@@7 null) (and (=> (= (ControlFlow 0 133) 130) anon267_Then_correct) (=> (= (ControlFlow 0 133) 131) anon267_Else_correct)))))
(let ((anon266_Then_correct  (=> (not (= y@@7 null)) (=> (and (state ExhaleHeap@5 QPMask@9) (forall ((v1@@2 T@U) (v2@@2 T@U) ) (!  (=> (and (= (type v1@@2) RefType) (= (type v2@@2) RefType)) (= (edge ($$ ExhaleHeap@5 g) v1@@2 v2@@2)  (or (edge ($$ ExhaleHeap@4 g) v1@@2 v2@@2) (and (= v1@@2 last@0) (= v2@@2 y@@7)))))
 :qid |stdinbpl.5256:28|
 :skolemid |554|
 :pattern ( (edge (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| ExhaleHeap@4 g))) g) v1@@2 v2@@2))
))) (and (=> (= (ControlFlow 0 132) 130) anon267_Then_correct) (=> (= (ControlFlow 0 132) 131) anon267_Else_correct))))))
(let ((anon265_Else_correct  (=> (not (= y@@7 null)) (and (=> (= (ControlFlow 0 135) 132) anon266_Then_correct) (=> (= (ControlFlow 0 135) 133) anon266_Else_correct)))))
(let ((anon265_Then_correct  (=> (= y@@7 null) (=> (and (state ExhaleHeap@5 QPMask@9) (|Set#Equal| ($$ ExhaleHeap@5 g) ($$ ExhaleHeap@4 g))) (and (=> (= (ControlFlow 0 134) 132) anon266_Then_correct) (=> (= (ControlFlow 0 134) 133) anon266_Else_correct))))))
(let ((anon263_Else_correct  (=> (forall ((n$0_11_1 T@U) ) (!  (=> (= (type n$0_11_1) RefType) (=> (and (U_2_bool (MapType0Select g n$0_11_1)) (not (= (MapType1Select ExhaleHeap@4 n$0_11_1 next) null))) (U_2_bool (MapType0Select g (MapType1Select ExhaleHeap@4 n$0_11_1 next)))))
 :qid |stdinbpl.5200:26|
 :skolemid |546|
 :pattern ( (MapType0Select g (MapType1Select ExhaleHeap@4 n$0_11_1 next)))
 :pattern ( (MapType0Select g n$0_11_1) (MapType1Select ExhaleHeap@4 n$0_11_1 next))
)) (=> (and (IdenticalOnKnownLocations ExhaleHeap@4 ExhaleHeap@5 QPMask@8) (not (U_2_bool (MapType0Select g null)))) (and (=> (= (ControlFlow 0 136) (- 0 137)) (forall ((n$1_6 T@U) (n$1_6_1 T@U) ) (!  (=> (and (= (type n$1_6) RefType) (= (type n$1_6_1) RefType)) (=> (and (and (and (and (not (= n$1_6 n$1_6_1)) (U_2_bool (MapType0Select g n$1_6))) (U_2_bool (MapType0Select g n$1_6_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$1_6 n$1_6_1))))
 :qid |stdinbpl.5213:21|
 :skolemid |547|
 :no-pattern (type n$1_6)
 :no-pattern (type n$1_6_1)
 :no-pattern (U_2_int n$1_6)
 :no-pattern (U_2_bool n$1_6)
 :no-pattern (U_2_int n$1_6_1)
 :no-pattern (U_2_bool n$1_6_1)
))) (=> (forall ((n$1_6@@0 T@U) (n$1_6_1@@0 T@U) ) (!  (=> (and (= (type n$1_6@@0) RefType) (= (type n$1_6_1@@0) RefType)) (=> (and (and (and (and (not (= n$1_6@@0 n$1_6_1@@0)) (U_2_bool (MapType0Select g n$1_6@@0))) (U_2_bool (MapType0Select g n$1_6_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$1_6@@0 n$1_6_1@@0))))
 :qid |stdinbpl.5213:21|
 :skolemid |547|
 :no-pattern (type n$1_6@@0)
 :no-pattern (type n$1_6_1@@0)
 :no-pattern (U_2_int n$1_6@@0)
 :no-pattern (U_2_bool n$1_6@@0)
 :no-pattern (U_2_int n$1_6_1@@0)
 :no-pattern (U_2_bool n$1_6_1@@0)
)) (=> (and (and (and (forall ((n$1_6@@1 T@U) ) (!  (=> (= (type n$1_6@@1) RefType) (=> (and (U_2_bool (MapType0Select g n$1_6@@1)) (< NoPerm FullPerm)) (and (qpRange67 n$1_6@@1) (= (invRecv67 n$1_6@@1) n$1_6@@1))))
 :qid |stdinbpl.5219:28|
 :skolemid |548|
 :pattern ( (MapType1Select ExhaleHeap@5 n$1_6@@1 next))
 :pattern ( (MapType2Select QPMask@9 n$1_6@@1 next))
 :pattern ( (MapType1Select ExhaleHeap@5 n$1_6@@1 next))
)) (forall ((o_3@@8 T@U) ) (!  (=> (= (type o_3@@8) RefType) (=> (and (and (U_2_bool (MapType0Select g (invRecv67 o_3@@8))) (< NoPerm FullPerm)) (qpRange67 o_3@@8)) (= (invRecv67 o_3@@8) o_3@@8)))
 :qid |stdinbpl.5223:28|
 :skolemid |549|
 :pattern ( (invRecv67 o_3@@8))
))) (and (forall ((n$1_6@@2 T@U) ) (!  (=> (and (= (type n$1_6@@2) RefType) (U_2_bool (MapType0Select g n$1_6@@2))) (not (= n$1_6@@2 null)))
 :qid |stdinbpl.5229:28|
 :skolemid |550|
 :pattern ( (MapType1Select ExhaleHeap@5 n$1_6@@2 next))
 :pattern ( (MapType2Select QPMask@9 n$1_6@@2 next))
 :pattern ( (MapType1Select ExhaleHeap@5 n$1_6@@2 next))
)) (forall ((o_3@@9 T@U) ) (!  (=> (= (type o_3@@9) RefType) (and (=> (and (and (U_2_bool (MapType0Select g (invRecv67 o_3@@9))) (< NoPerm FullPerm)) (qpRange67 o_3@@9)) (and (=> (< NoPerm FullPerm) (= (invRecv67 o_3@@9) o_3@@9)) (= (U_2_real (MapType2Select QPMask@9 o_3@@9 next)) (+ (U_2_real (MapType2Select QPMask@8 o_3@@9 next)) FullPerm)))) (=> (not (and (and (U_2_bool (MapType0Select g (invRecv67 o_3@@9))) (< NoPerm FullPerm)) (qpRange67 o_3@@9))) (= (U_2_real (MapType2Select QPMask@9 o_3@@9 next)) (U_2_real (MapType2Select QPMask@8 o_3@@9 next))))))
 :qid |stdinbpl.5235:28|
 :skolemid |551|
 :pattern ( (MapType2Select QPMask@9 o_3@@9 next))
)))) (and (and (forall ((o_3@@10 T@U) (f_5@@2 T@U) ) (! (let ((B@@14 (FieldTypeInv1 (type f_5@@2))))
(let ((A@@15 (FieldTypeInv0 (type f_5@@2))))
 (=> (and (and (= (type o_3@@10) RefType) (= (type f_5@@2) (FieldType A@@15 B@@14))) (not (= f_5@@2 next))) (= (U_2_real (MapType2Select QPMask@8 o_3@@10 f_5@@2)) (U_2_real (MapType2Select QPMask@9 o_3@@10 f_5@@2))))))
 :qid |stdinbpl.5239:35|
 :skolemid |552|
 :pattern ( (MapType2Select QPMask@8 o_3@@10 f_5@@2))
 :pattern ( (MapType2Select QPMask@9 o_3@@10 f_5@@2))
)) (state ExhaleHeap@5 QPMask@9)) (and (forall ((n$2_8 T@U) ) (!  (=> (= (type n$2_8) RefType) (=> (and (U_2_bool (MapType0Select g n$2_8)) (not (= (MapType1Select ExhaleHeap@5 n$2_8 next) null))) (U_2_bool (MapType0Select g (MapType1Select ExhaleHeap@5 n$2_8 next)))))
 :qid |stdinbpl.5245:26|
 :skolemid |553|
 :pattern ( (MapType0Select g (MapType1Select ExhaleHeap@5 n$2_8 next)))
 :pattern ( (MapType0Select g n$2_8) (MapType1Select ExhaleHeap@5 n$2_8 next))
)) (= (MapType1Select ExhaleHeap@5 last@0 next) y@@7)))) (and (=> (= (ControlFlow 0 136) 134) anon265_Then_correct) (=> (= (ControlFlow 0 136) 135) anon265_Else_correct)))))))))
(let ((anon134_correct true))
(let ((anon264_Else_correct  (=> (and (not (and (U_2_bool (MapType0Select g n$0_10_1)) (not (= (MapType1Select ExhaleHeap@4 n$0_10_1 next) null)))) (= (ControlFlow 0 58) 55)) anon134_correct)))
(let ((anon264_Then_correct  (=> (and (U_2_bool (MapType0Select g n$0_10_1)) (not (= (MapType1Select ExhaleHeap@4 n$0_10_1 next) null))) (and (=> (= (ControlFlow 0 56) (- 0 57)) (U_2_bool (MapType0Select g (MapType1Select ExhaleHeap@4 n$0_10_1 next)))) (=> (U_2_bool (MapType0Select g (MapType1Select ExhaleHeap@4 n$0_10_1 next))) (=> (= (ControlFlow 0 56) 55) anon134_correct))))))
(let ((anon131_correct  (and (=> (= (ControlFlow 0 138) (- 0 141)) (not (U_2_bool (MapType0Select g null)))) (=> (not (U_2_bool (MapType0Select g null))) (and (=> (= (ControlFlow 0 138) (- 0 140)) (forall ((n_37 T@U) (n_37_1 T@U) ) (!  (=> (and (= (type n_37) RefType) (= (type n_37_1) RefType)) (=> (and (and (and (and (not (= n_37 n_37_1)) (U_2_bool (MapType0Select g n_37))) (U_2_bool (MapType0Select g n_37_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_37 n_37_1))))
 :qid |stdinbpl.5159:23|
 :skolemid |540|
 :pattern ( (neverTriggered66 n_37) (neverTriggered66 n_37_1))
))) (=> (forall ((n_37@@0 T@U) (n_37_1@@0 T@U) ) (!  (=> (and (= (type n_37@@0) RefType) (= (type n_37_1@@0) RefType)) (=> (and (and (and (and (not (= n_37@@0 n_37_1@@0)) (U_2_bool (MapType0Select g n_37@@0))) (U_2_bool (MapType0Select g n_37_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_37@@0 n_37_1@@0))))
 :qid |stdinbpl.5159:23|
 :skolemid |540|
 :pattern ( (neverTriggered66 n_37@@0) (neverTriggered66 n_37_1@@0))
)) (and (=> (= (ControlFlow 0 138) (- 0 139)) (forall ((n_37@@1 T@U) ) (!  (=> (and (= (type n_37@@1) RefType) (U_2_bool (MapType0Select g n_37@@1))) (>= (U_2_real (MapType2Select QPMask@7 n_37@@1 next)) FullPerm))
 :qid |stdinbpl.5166:23|
 :skolemid |541|
 :pattern ( (MapType1Select ExhaleHeap@4 n_37@@1 next))
 :pattern ( (MapType2Select QPMask@8 n_37@@1 next))
 :pattern ( (MapType1Select ExhaleHeap@4 n_37@@1 next))
))) (=> (forall ((n_37@@2 T@U) ) (!  (=> (and (= (type n_37@@2) RefType) (U_2_bool (MapType0Select g n_37@@2))) (>= (U_2_real (MapType2Select QPMask@7 n_37@@2 next)) FullPerm))
 :qid |stdinbpl.5166:23|
 :skolemid |541|
 :pattern ( (MapType1Select ExhaleHeap@4 n_37@@2 next))
 :pattern ( (MapType2Select QPMask@8 n_37@@2 next))
 :pattern ( (MapType1Select ExhaleHeap@4 n_37@@2 next))
)) (=> (and (and (forall ((n_37@@3 T@U) ) (!  (=> (= (type n_37@@3) RefType) (=> (and (U_2_bool (MapType0Select g n_37@@3)) (< NoPerm FullPerm)) (and (qpRange66 n_37@@3) (= (invRecv66 n_37@@3) n_37@@3))))
 :qid |stdinbpl.5172:28|
 :skolemid |542|
 :pattern ( (MapType1Select ExhaleHeap@4 n_37@@3 next))
 :pattern ( (MapType2Select QPMask@8 n_37@@3 next))
 :pattern ( (MapType1Select ExhaleHeap@4 n_37@@3 next))
)) (forall ((o_3@@11 T@U) ) (!  (=> (= (type o_3@@11) RefType) (=> (and (U_2_bool (MapType0Select g (invRecv66 o_3@@11))) (and (< NoPerm FullPerm) (qpRange66 o_3@@11))) (= (invRecv66 o_3@@11) o_3@@11)))
 :qid |stdinbpl.5176:28|
 :skolemid |543|
 :pattern ( (invRecv66 o_3@@11))
))) (and (forall ((o_3@@12 T@U) ) (!  (=> (= (type o_3@@12) RefType) (and (=> (and (U_2_bool (MapType0Select g (invRecv66 o_3@@12))) (and (< NoPerm FullPerm) (qpRange66 o_3@@12))) (and (= (invRecv66 o_3@@12) o_3@@12) (= (U_2_real (MapType2Select QPMask@8 o_3@@12 next)) (- (U_2_real (MapType2Select QPMask@7 o_3@@12 next)) FullPerm)))) (=> (not (and (U_2_bool (MapType0Select g (invRecv66 o_3@@12))) (and (< NoPerm FullPerm) (qpRange66 o_3@@12)))) (= (U_2_real (MapType2Select QPMask@8 o_3@@12 next)) (U_2_real (MapType2Select QPMask@7 o_3@@12 next))))))
 :qid |stdinbpl.5182:28|
 :skolemid |544|
 :pattern ( (MapType2Select QPMask@8 o_3@@12 next))
)) (forall ((o_3@@13 T@U) (f_5@@3 T@U) ) (! (let ((B@@15 (FieldTypeInv1 (type f_5@@3))))
(let ((A@@16 (FieldTypeInv0 (type f_5@@3))))
 (=> (and (and (= (type o_3@@13) RefType) (= (type f_5@@3) (FieldType A@@16 B@@15))) (not (= f_5@@3 next))) (= (U_2_real (MapType2Select QPMask@7 o_3@@13 f_5@@3)) (U_2_real (MapType2Select QPMask@8 o_3@@13 f_5@@3))))))
 :qid |stdinbpl.5188:35|
 :skolemid |545|
 :pattern ( (MapType2Select QPMask@8 o_3@@13 f_5@@3))
)))) (and (and (=> (= (ControlFlow 0 138) 136) anon263_Else_correct) (=> (= (ControlFlow 0 138) 56) anon264_Then_correct)) (=> (= (ControlFlow 0 138) 58) anon264_Else_correct)))))))))))
(let ((anon262_Else_correct  (=> (and (= y@@7 null) (= (ControlFlow 0 144) 138)) anon131_correct)))
(let ((anon262_Then_correct  (=> (not (= y@@7 null)) (and (=> (= (ControlFlow 0 142) (- 0 143)) (U_2_bool (MapType0Select g y@@7))) (=> (U_2_bool (MapType0Select g y@@7)) (=> (= (ControlFlow 0 142) 138) anon131_correct))))))
(let ((anon129_correct  (=> (and (state ExhaleHeap@4 QPMask@7) (state ExhaleHeap@4 QPMask@7)) (and (=> (= (ControlFlow 0 145) (- 0 146)) (U_2_bool (MapType0Select g last@0))) (=> (U_2_bool (MapType0Select g last@0)) (and (=> (= (ControlFlow 0 145) 142) anon262_Then_correct) (=> (= (ControlFlow 0 145) 144) anon262_Else_correct)))))))
(let ((anon261_Else_correct  (=> (and (not (and (edge ($$ ExhaleHeap@4 g) last@0 (MapType1Select ExhaleHeap@4 last@0 next)) (exists_path ($$ ExhaleHeap@4 g) (MapType1Select ExhaleHeap@4 last@0 next) (MapType1Select ExhaleHeap@4 last@0 next)))) (= (ControlFlow 0 149) 145)) anon129_correct)))
(let ((anon261_Then_correct  (=> (and (and (and (edge ($$ ExhaleHeap@4 g) last@0 (MapType1Select ExhaleHeap@4 last@0 next)) (exists_path ($$ ExhaleHeap@4 g) (MapType1Select ExhaleHeap@4 last@0 next) (MapType1Select ExhaleHeap@4 last@0 next))) (state ExhaleHeap@4 QPMask@7)) (and (exists_path ($$ ExhaleHeap@4 g) last@0 (MapType1Select ExhaleHeap@4 last@0 next)) (= (ControlFlow 0 148) 145))) anon129_correct)))
(let ((anon260_Then_correct  (=> (not (= (MapType1Select ExhaleHeap@4 last@0 next) null)) (and (=> (= (ControlFlow 0 150) 148) anon261_Then_correct) (=> (= (ControlFlow 0 150) 149) anon261_Else_correct)))))
(let ((anon260_Else_correct  (=> (and (= (MapType1Select ExhaleHeap@4 last@0 next) null) (= (ControlFlow 0 147) 145)) anon129_correct)))
(let ((anon243_Else_correct  (=> (not (not (= (MapType1Select ExhaleHeap@4 last@0 next) null))) (=> (and (state ExhaleHeap@4 QPMask@5) (not (U_2_bool (MapType0Select g null)))) (and (=> (= (ControlFlow 0 151) (- 0 152)) (forall ((n$1_5 T@U) (n$1_5_1 T@U) ) (!  (=> (and (= (type n$1_5) RefType) (= (type n$1_5_1) RefType)) (=> (and (and (and (and (not (= n$1_5 n$1_5_1)) (U_2_bool (MapType0Select g n$1_5))) (U_2_bool (MapType0Select g n$1_5_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$1_5 n$1_5_1))))
 :qid |stdinbpl.5071:21|
 :skolemid |531|
 :no-pattern (type n$1_5)
 :no-pattern (type n$1_5_1)
 :no-pattern (U_2_int n$1_5)
 :no-pattern (U_2_bool n$1_5)
 :no-pattern (U_2_int n$1_5_1)
 :no-pattern (U_2_bool n$1_5_1)
))) (=> (forall ((n$1_5@@0 T@U) (n$1_5_1@@0 T@U) ) (!  (=> (and (= (type n$1_5@@0) RefType) (= (type n$1_5_1@@0) RefType)) (=> (and (and (and (and (not (= n$1_5@@0 n$1_5_1@@0)) (U_2_bool (MapType0Select g n$1_5@@0))) (U_2_bool (MapType0Select g n$1_5_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$1_5@@0 n$1_5_1@@0))))
 :qid |stdinbpl.5071:21|
 :skolemid |531|
 :no-pattern (type n$1_5@@0)
 :no-pattern (type n$1_5_1@@0)
 :no-pattern (U_2_int n$1_5@@0)
 :no-pattern (U_2_bool n$1_5@@0)
 :no-pattern (U_2_int n$1_5_1@@0)
 :no-pattern (U_2_bool n$1_5_1@@0)
)) (=> (and (forall ((n$1_5@@1 T@U) ) (!  (=> (= (type n$1_5@@1) RefType) (=> (and (U_2_bool (MapType0Select g n$1_5@@1)) (< NoPerm FullPerm)) (and (qpRange65 n$1_5@@1) (= (invRecv65 n$1_5@@1) n$1_5@@1))))
 :qid |stdinbpl.5077:28|
 :skolemid |532|
 :pattern ( (MapType1Select ExhaleHeap@4 n$1_5@@1 next))
 :pattern ( (MapType2Select QPMask@7 n$1_5@@1 next))
 :pattern ( (MapType1Select ExhaleHeap@4 n$1_5@@1 next))
)) (forall ((o_3@@14 T@U) ) (!  (=> (= (type o_3@@14) RefType) (=> (and (and (U_2_bool (MapType0Select g (invRecv65 o_3@@14))) (< NoPerm FullPerm)) (qpRange65 o_3@@14)) (= (invRecv65 o_3@@14) o_3@@14)))
 :qid |stdinbpl.5081:28|
 :skolemid |533|
 :pattern ( (invRecv65 o_3@@14))
))) (=> (and (and (forall ((n$1_5@@2 T@U) ) (!  (=> (and (= (type n$1_5@@2) RefType) (U_2_bool (MapType0Select g n$1_5@@2))) (not (= n$1_5@@2 null)))
 :qid |stdinbpl.5087:28|
 :skolemid |534|
 :pattern ( (MapType1Select ExhaleHeap@4 n$1_5@@2 next))
 :pattern ( (MapType2Select QPMask@7 n$1_5@@2 next))
 :pattern ( (MapType1Select ExhaleHeap@4 n$1_5@@2 next))
)) (forall ((o_3@@15 T@U) ) (!  (=> (= (type o_3@@15) RefType) (and (=> (and (and (U_2_bool (MapType0Select g (invRecv65 o_3@@15))) (< NoPerm FullPerm)) (qpRange65 o_3@@15)) (and (=> (< NoPerm FullPerm) (= (invRecv65 o_3@@15) o_3@@15)) (= (U_2_real (MapType2Select QPMask@7 o_3@@15 next)) (+ (U_2_real (MapType2Select QPMask@5 o_3@@15 next)) FullPerm)))) (=> (not (and (and (U_2_bool (MapType0Select g (invRecv65 o_3@@15))) (< NoPerm FullPerm)) (qpRange65 o_3@@15))) (= (U_2_real (MapType2Select QPMask@7 o_3@@15 next)) (U_2_real (MapType2Select QPMask@5 o_3@@15 next))))))
 :qid |stdinbpl.5093:28|
 :skolemid |535|
 :pattern ( (MapType2Select QPMask@7 o_3@@15 next))
))) (and (forall ((o_3@@16 T@U) (f_5@@4 T@U) ) (! (let ((B@@16 (FieldTypeInv1 (type f_5@@4))))
(let ((A@@17 (FieldTypeInv0 (type f_5@@4))))
 (=> (and (and (= (type o_3@@16) RefType) (= (type f_5@@4) (FieldType A@@17 B@@16))) (not (= f_5@@4 next))) (= (U_2_real (MapType2Select QPMask@5 o_3@@16 f_5@@4)) (U_2_real (MapType2Select QPMask@7 o_3@@16 f_5@@4))))))
 :qid |stdinbpl.5097:35|
 :skolemid |536|
 :pattern ( (MapType2Select QPMask@5 o_3@@16 f_5@@4))
 :pattern ( (MapType2Select QPMask@7 o_3@@16 f_5@@4))
)) (state ExhaleHeap@4 QPMask@7))) (=> (and (and (and (and (forall ((n$2_7_1 T@U) ) (!  (=> (= (type n$2_7_1) RefType) (=> (and (U_2_bool (MapType0Select g n$2_7_1)) (not (= (MapType1Select ExhaleHeap@4 n$2_7_1 next) null))) (U_2_bool (MapType0Select g (MapType1Select ExhaleHeap@4 n$2_7_1 next)))))
 :qid |stdinbpl.5103:26|
 :skolemid |537|
 :pattern ( (MapType0Select g (MapType1Select ExhaleHeap@4 n$2_7_1 next)))
 :pattern ( (MapType0Select g n$2_7_1) (MapType1Select ExhaleHeap@4 n$2_7_1 next))
)) (U_2_bool (MapType0Select g last@0))) (and (U_2_bool (MapType0Select g x_1@@1)) (U_2_bool (MapType0Select g y@@7)))) (and (and (state ExhaleHeap@4 QPMask@7) (forall ((n_35 T@U) ) (!  (=> (and (= (type n_35) RefType) (U_2_bool (MapType0Select g n_35))) (or (exists_path ($$ ExhaleHeap@4 g) x_1@@1 n_35) (exists_path ($$ ExhaleHeap@4 g) y@@7 n_35)))
 :qid |stdinbpl.5111:26|
 :skolemid |538|
 :pattern ( (MapType0Select g n_35))
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| ExhaleHeap@4 g))) g) x_1@@1 n_35))
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| ExhaleHeap@4 g))) g) y@@7 n_35))
))) (and (state ExhaleHeap@4 QPMask@7) (forall ((n_36 T@U) ) (!  (=> (and (= (type n_36) RefType) (U_2_bool (MapType0Select g n_36))) (or (not (exists_path ($$ ExhaleHeap@4 g) x_1@@1 n_36)) (not (exists_path ($$ ExhaleHeap@4 g) y@@7 n_36))))
 :qid |stdinbpl.5116:26|
 :skolemid |539|
 :pattern ( (MapType0Select g n_36))
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| ExhaleHeap@4 g))) g) x_1@@1 n_36))
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| ExhaleHeap@4 g))) g) y@@7 n_36))
))))) (and (and (and (state ExhaleHeap@4 QPMask@7) (acyclic_graph ($$ ExhaleHeap@4 g))) (and (state ExhaleHeap@4 QPMask@7) (unshared_graph ($$ ExhaleHeap@4 g)))) (and (and (state ExhaleHeap@4 QPMask@7) (|Set#Equal| ($$ ExhaleHeap@4 g) old_g@0)) (and (state ExhaleHeap@4 QPMask@7) (exists_path ($$ ExhaleHeap@4 g) x_1@@1 last@0))))) (and (=> (= (ControlFlow 0 151) 150) anon260_Then_correct) (=> (= (ControlFlow 0 151) 147) anon260_Else_correct)))))))))))
(let ((anon49_correct  (=> (and (IdenticalOnKnownLocations Heap@@13 ExhaleHeap@4 QPMask@5) (U_2_bool (MapType1Select ExhaleHeap@4 last@0 $allocated))) (and (and (=> (= (ControlFlow 0 292) 291) anon218_Then_correct) (=> (= (ControlFlow 0 292) 214) anon243_Then_correct)) (=> (= (ControlFlow 0 292) 151) anon243_Else_correct)))))
(let ((anon217_Else_correct  (=> (and (not (and (edge ($$ Heap@@13 g) x_1@@1 (MapType1Select Heap@@13 x_1@@1 next)) (exists_path ($$ Heap@@13 g) (MapType1Select Heap@@13 x_1@@1 next) (MapType1Select Heap@@13 x_1@@1 next)))) (= (ControlFlow 0 296) 292)) anon49_correct)))
(let ((anon217_Then_correct  (=> (and (edge ($$ Heap@@13 g) x_1@@1 (MapType1Select Heap@@13 x_1@@1 next)) (exists_path ($$ Heap@@13 g) (MapType1Select Heap@@13 x_1@@1 next) (MapType1Select Heap@@13 x_1@@1 next))) (and (=> (= (ControlFlow 0 294) (- 0 295)) (exists_path ($$ Heap@@13 g) x_1@@1 (MapType1Select Heap@@13 x_1@@1 next))) (=> (exists_path ($$ Heap@@13 g) x_1@@1 (MapType1Select Heap@@13 x_1@@1 next)) (=> (= (ControlFlow 0 294) 292) anon49_correct))))))
(let ((anon216_Then_correct  (=> (not (= (MapType1Select Heap@@13 x_1@@1 next) null)) (and (=> (= (ControlFlow 0 297) 294) anon217_Then_correct) (=> (= (ControlFlow 0 297) 296) anon217_Else_correct)))))
(let ((anon216_Else_correct  (=> (and (= (MapType1Select Heap@@13 x_1@@1 next) null) (= (ControlFlow 0 293) 292)) anon49_correct)))
(let ((anon214_Else_correct  (=> (forall ((n_13_1 T@U) ) (!  (=> (and (= (type n_13_1) RefType) (U_2_bool (MapType0Select g n_13_1))) (or (not (exists_path ($$ Heap@@13 g) x_1@@1 n_13_1)) (not (exists_path ($$ Heap@@13 g) y@@7 n_13_1))))
 :qid |stdinbpl.3885:28|
 :skolemid |413|
 :pattern ( (MapType0Select g n_13_1))
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| Heap@@13 g))) g) x_1@@1 n_13_1))
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| Heap@@13 g))) g) y@@7 n_13_1))
)) (and (=> (= (ControlFlow 0 298) (- 0 302)) (acyclic_graph ($$ Heap@@13 g))) (=> (acyclic_graph ($$ Heap@@13 g)) (and (=> (= (ControlFlow 0 298) (- 0 301)) (unshared_graph ($$ Heap@@13 g))) (=> (unshared_graph ($$ Heap@@13 g)) (and (=> (= (ControlFlow 0 298) (- 0 300)) (|Set#Equal| ($$ Heap@@13 g) old_g@0)) (=> (|Set#Equal| ($$ Heap@@13 g) old_g@0) (and (=> (= (ControlFlow 0 298) (- 0 299)) (exists_path ($$ Heap@@13 g) x_1@@1 x_1@@1)) (=> (exists_path ($$ Heap@@13 g) x_1@@1 x_1@@1) (and (=> (= (ControlFlow 0 298) 297) anon216_Then_correct) (=> (= (ControlFlow 0 298) 293) anon216_Else_correct)))))))))))))
(let ((anon45_correct true))
(let ((anon215_Else_correct  (=> (and (not (U_2_bool (MapType0Select g n_12))) (= (ControlFlow 0 54) 51)) anon45_correct)))
(let ((anon215_Then_correct  (=> (U_2_bool (MapType0Select g n_12)) (and (=> (= (ControlFlow 0 52) (- 0 53)) (or (not (exists_path ($$ Heap@@13 g) x_1@@1 n_12)) (not (exists_path ($$ Heap@@13 g) y@@7 n_12)))) (=> (or (not (exists_path ($$ Heap@@13 g) x_1@@1 n_12)) (not (exists_path ($$ Heap@@13 g) y@@7 n_12))) (=> (= (ControlFlow 0 52) 51) anon45_correct))))))
(let ((anon212_Else_correct  (=> (forall ((n_11_1 T@U) ) (!  (=> (and (= (type n_11_1) RefType) (U_2_bool (MapType0Select g n_11_1))) (or (exists_path ($$ Heap@@13 g) x_1@@1 n_11_1) (exists_path ($$ Heap@@13 g) y@@7 n_11_1)))
 :qid |stdinbpl.3874:28|
 :skolemid |412|
 :pattern ( (MapType0Select g n_11_1))
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| Heap@@13 g))) g) x_1@@1 n_11_1))
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| Heap@@13 g))) g) y@@7 n_11_1))
)) (and (and (=> (= (ControlFlow 0 303) 298) anon214_Else_correct) (=> (= (ControlFlow 0 303) 52) anon215_Then_correct)) (=> (= (ControlFlow 0 303) 54) anon215_Else_correct)))))
(let ((anon41_correct true))
(let ((anon213_Else_correct  (=> (and (not (U_2_bool (MapType0Select g n_10_1))) (= (ControlFlow 0 50) 47)) anon41_correct)))
(let ((anon213_Then_correct  (=> (U_2_bool (MapType0Select g n_10_1)) (and (=> (= (ControlFlow 0 48) (- 0 49)) (or (exists_path ($$ Heap@@13 g) x_1@@1 n_10_1) (exists_path ($$ Heap@@13 g) y@@7 n_10_1))) (=> (or (exists_path ($$ Heap@@13 g) x_1@@1 n_10_1) (exists_path ($$ Heap@@13 g) y@@7 n_10_1)) (=> (= (ControlFlow 0 48) 47) anon41_correct))))))
(let ((anon210_Else_correct  (=> (forall ((n$2_1_1 T@U) ) (!  (=> (= (type n$2_1_1) RefType) (=> (and (U_2_bool (MapType0Select g n$2_1_1)) (not (= (MapType1Select Heap@@13 n$2_1_1 next) null))) (U_2_bool (MapType0Select g (MapType1Select Heap@@13 n$2_1_1 next)))))
 :qid |stdinbpl.3857:28|
 :skolemid |411|
 :pattern ( (MapType0Select g (MapType1Select Heap@@13 n$2_1_1 next)))
 :pattern ( (MapType0Select g n$2_1_1) (MapType1Select Heap@@13 n$2_1_1 next))
)) (and (=> (= (ControlFlow 0 304) (- 0 307)) (U_2_bool (MapType0Select g x_1@@1))) (=> (U_2_bool (MapType0Select g x_1@@1)) (and (=> (= (ControlFlow 0 304) (- 0 306)) (U_2_bool (MapType0Select g x_1@@1))) (=> (U_2_bool (MapType0Select g x_1@@1)) (and (=> (= (ControlFlow 0 304) (- 0 305)) (U_2_bool (MapType0Select g y@@7))) (=> (U_2_bool (MapType0Select g y@@7)) (and (and (=> (= (ControlFlow 0 304) 303) anon212_Else_correct) (=> (= (ControlFlow 0 304) 48) anon213_Then_correct)) (=> (= (ControlFlow 0 304) 50) anon213_Else_correct)))))))))))
(let ((anon37_correct true))
(let ((anon211_Else_correct  (=> (and (not (and (U_2_bool (MapType0Select g n$2_6)) (not (= (MapType1Select Heap@@13 n$2_6 next) null)))) (= (ControlFlow 0 46) 43)) anon37_correct)))
(let ((anon211_Then_correct  (=> (and (U_2_bool (MapType0Select g n$2_6)) (not (= (MapType1Select Heap@@13 n$2_6 next) null))) (and (=> (= (ControlFlow 0 44) (- 0 45)) (U_2_bool (MapType0Select g (MapType1Select Heap@@13 n$2_6 next)))) (=> (U_2_bool (MapType0Select g (MapType1Select Heap@@13 n$2_6 next))) (=> (= (ControlFlow 0 44) 43) anon37_correct))))))
(let ((anon209_Else_correct  (=> (not (= x_1@@1 null)) (and (=> (= (ControlFlow 0 308) (- 0 311)) (not (U_2_bool (MapType0Select g null)))) (=> (not (U_2_bool (MapType0Select g null))) (and (=> (= (ControlFlow 0 308) (- 0 310)) (forall ((n$1 T@U) (n$1_7 T@U) ) (!  (=> (and (= (type n$1) RefType) (= (type n$1_7) RefType)) (=> (and (and (and (and (not (= n$1 n$1_7)) (U_2_bool (MapType0Select g n$1))) (U_2_bool (MapType0Select g n$1_7))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$1 n$1_7))))
 :qid |stdinbpl.3816:25|
 :skolemid |405|
 :pattern ( (neverTriggered46 n$1) (neverTriggered46 n$1_7))
))) (=> (forall ((n$1@@0 T@U) (n$1_7@@0 T@U) ) (!  (=> (and (= (type n$1@@0) RefType) (= (type n$1_7@@0) RefType)) (=> (and (and (and (and (not (= n$1@@0 n$1_7@@0)) (U_2_bool (MapType0Select g n$1@@0))) (U_2_bool (MapType0Select g n$1_7@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$1@@0 n$1_7@@0))))
 :qid |stdinbpl.3816:25|
 :skolemid |405|
 :pattern ( (neverTriggered46 n$1@@0) (neverTriggered46 n$1_7@@0))
)) (and (=> (= (ControlFlow 0 308) (- 0 309)) (forall ((n$1@@1 T@U) ) (!  (=> (and (= (type n$1@@1) RefType) (U_2_bool (MapType0Select g n$1@@1))) (>= (U_2_real (MapType2Select QPMask@0 n$1@@1 next)) FullPerm))
 :qid |stdinbpl.3823:25|
 :skolemid |406|
 :pattern ( (MapType1Select Heap@@13 n$1@@1 next))
 :pattern ( (MapType2Select QPMask@5 n$1@@1 next))
 :pattern ( (MapType1Select Heap@@13 n$1@@1 next))
))) (=> (forall ((n$1@@2 T@U) ) (!  (=> (and (= (type n$1@@2) RefType) (U_2_bool (MapType0Select g n$1@@2))) (>= (U_2_real (MapType2Select QPMask@0 n$1@@2 next)) FullPerm))
 :qid |stdinbpl.3823:25|
 :skolemid |406|
 :pattern ( (MapType1Select Heap@@13 n$1@@2 next))
 :pattern ( (MapType2Select QPMask@5 n$1@@2 next))
 :pattern ( (MapType1Select Heap@@13 n$1@@2 next))
)) (=> (and (and (forall ((n$1@@3 T@U) ) (!  (=> (= (type n$1@@3) RefType) (=> (and (U_2_bool (MapType0Select g n$1@@3)) (< NoPerm FullPerm)) (and (qpRange46 n$1@@3) (= (invRecv46 n$1@@3) n$1@@3))))
 :qid |stdinbpl.3829:30|
 :skolemid |407|
 :pattern ( (MapType1Select Heap@@13 n$1@@3 next))
 :pattern ( (MapType2Select QPMask@5 n$1@@3 next))
 :pattern ( (MapType1Select Heap@@13 n$1@@3 next))
)) (forall ((o_3@@17 T@U) ) (!  (=> (= (type o_3@@17) RefType) (=> (and (U_2_bool (MapType0Select g (invRecv46 o_3@@17))) (and (< NoPerm FullPerm) (qpRange46 o_3@@17))) (= (invRecv46 o_3@@17) o_3@@17)))
 :qid |stdinbpl.3833:30|
 :skolemid |408|
 :pattern ( (invRecv46 o_3@@17))
))) (and (forall ((o_3@@18 T@U) ) (!  (=> (= (type o_3@@18) RefType) (and (=> (and (U_2_bool (MapType0Select g (invRecv46 o_3@@18))) (and (< NoPerm FullPerm) (qpRange46 o_3@@18))) (and (= (invRecv46 o_3@@18) o_3@@18) (= (U_2_real (MapType2Select QPMask@5 o_3@@18 next)) (- (U_2_real (MapType2Select QPMask@0 o_3@@18 next)) FullPerm)))) (=> (not (and (U_2_bool (MapType0Select g (invRecv46 o_3@@18))) (and (< NoPerm FullPerm) (qpRange46 o_3@@18)))) (= (U_2_real (MapType2Select QPMask@5 o_3@@18 next)) (U_2_real (MapType2Select QPMask@0 o_3@@18 next))))))
 :qid |stdinbpl.3839:30|
 :skolemid |409|
 :pattern ( (MapType2Select QPMask@5 o_3@@18 next))
)) (forall ((o_3@@19 T@U) (f_5@@5 T@U) ) (! (let ((B@@17 (FieldTypeInv1 (type f_5@@5))))
(let ((A@@18 (FieldTypeInv0 (type f_5@@5))))
 (=> (and (and (= (type o_3@@19) RefType) (= (type f_5@@5) (FieldType A@@18 B@@17))) (not (= f_5@@5 next))) (= (U_2_real (MapType2Select QPMask@0 o_3@@19 f_5@@5)) (U_2_real (MapType2Select QPMask@5 o_3@@19 f_5@@5))))))
 :qid |stdinbpl.3845:37|
 :skolemid |410|
 :pattern ( (MapType2Select QPMask@5 o_3@@19 f_5@@5))
)))) (and (and (=> (= (ControlFlow 0 308) 304) anon210_Else_correct) (=> (= (ControlFlow 0 308) 44) anon211_Then_correct)) (=> (= (ControlFlow 0 308) 46) anon211_Else_correct))))))))))))
(let ((anon208_Else_correct  (=> (= old_g@0 ($$ Heap@@13 g)) (=> (and (state Heap@@13 QPMask@0) (state Heap@@13 QPMask@0)) (and (=> (= (ControlFlow 0 312) 126) anon209_Then_correct) (=> (= (ControlFlow 0 312) 308) anon209_Else_correct))))))
(let ((anon208_Then_correct  (and (=> (= (ControlFlow 0 41) (- 0 42)) (forall ((n_9 T@U) (n_9_1 T@U) ) (!  (=> (and (= (type n_9) RefType) (= (type n_9_1) RefType)) (=> (and (and (and (and (not (= n_9 n_9_1)) (U_2_bool (MapType0Select g n_9))) (U_2_bool (MapType0Select g n_9_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_9 n_9_1))))
 :qid |stdinbpl.3744:21|
 :skolemid |399|
 :pattern ( (neverTriggered45 n_9) (neverTriggered45 n_9_1))
))) (=> (forall ((n_9@@0 T@U) (n_9_1@@0 T@U) ) (!  (=> (and (= (type n_9@@0) RefType) (= (type n_9_1@@0) RefType)) (=> (and (and (and (and (not (= n_9@@0 n_9_1@@0)) (U_2_bool (MapType0Select g n_9@@0))) (U_2_bool (MapType0Select g n_9_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_9@@0 n_9_1@@0))))
 :qid |stdinbpl.3744:21|
 :skolemid |399|
 :pattern ( (neverTriggered45 n_9@@0) (neverTriggered45 n_9_1@@0))
)) (=> (= (ControlFlow 0 41) (- 0 40)) (forall ((n_9@@1 T@U) ) (!  (=> (and (= (type n_9@@1) RefType) (U_2_bool (MapType0Select g n_9@@1))) (>= (U_2_real (MapType2Select QPMask@0 n_9@@1 next)) FullPerm))
 :qid |stdinbpl.3751:21|
 :skolemid |400|
 :pattern ( (MapType1Select Heap@@13 n_9@@1 next))
 :pattern ( (MapType2Select QPMask@4 n_9@@1 next))
 :pattern ( (MapType1Select Heap@@13 n_9@@1 next))
)))))))
(let ((anon207_Else_correct  (=> (and (unshared_graph ($$ Heap@@13 g)) (state Heap@@13 QPMask@0)) (and (=> (= (ControlFlow 0 313) 41) anon208_Then_correct) (=> (= (ControlFlow 0 313) 312) anon208_Else_correct)))))
(let ((anon207_Then_correct  (and (=> (= (ControlFlow 0 38) (- 0 39)) (forall ((n_8 T@U) (n_8_1 T@U) ) (!  (=> (and (= (type n_8) RefType) (= (type n_8_1) RefType)) (=> (and (and (and (and (not (= n_8 n_8_1)) (U_2_bool (MapType0Select g n_8))) (U_2_bool (MapType0Select g n_8_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_8 n_8_1))))
 :qid |stdinbpl.3680:21|
 :skolemid |393|
 :pattern ( (neverTriggered44 n_8) (neverTriggered44 n_8_1))
))) (=> (forall ((n_8@@0 T@U) (n_8_1@@0 T@U) ) (!  (=> (and (= (type n_8@@0) RefType) (= (type n_8_1@@0) RefType)) (=> (and (and (and (and (not (= n_8@@0 n_8_1@@0)) (U_2_bool (MapType0Select g n_8@@0))) (U_2_bool (MapType0Select g n_8_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_8@@0 n_8_1@@0))))
 :qid |stdinbpl.3680:21|
 :skolemid |393|
 :pattern ( (neverTriggered44 n_8@@0) (neverTriggered44 n_8_1@@0))
)) (=> (= (ControlFlow 0 38) (- 0 37)) (forall ((n_8@@1 T@U) ) (!  (=> (and (= (type n_8@@1) RefType) (U_2_bool (MapType0Select g n_8@@1))) (>= (U_2_real (MapType2Select QPMask@0 n_8@@1 next)) FullPerm))
 :qid |stdinbpl.3687:21|
 :skolemid |394|
 :pattern ( (MapType1Select Heap@@13 n_8@@1 next))
 :pattern ( (MapType2Select QPMask@3 n_8@@1 next))
 :pattern ( (MapType1Select Heap@@13 n_8@@1 next))
)))))))
(let ((anon206_Else_correct  (=> (func_graph ($$ Heap@@13 g)) (=> (and (state Heap@@13 QPMask@0) (state Heap@@13 QPMask@0)) (and (=> (= (ControlFlow 0 314) 38) anon207_Then_correct) (=> (= (ControlFlow 0 314) 313) anon207_Else_correct))))))
(let ((anon206_Then_correct  (and (=> (= (ControlFlow 0 35) (- 0 36)) (forall ((n_7 T@U) (n_7_1 T@U) ) (!  (=> (and (= (type n_7) RefType) (= (type n_7_1) RefType)) (=> (and (and (and (and (not (= n_7 n_7_1)) (U_2_bool (MapType0Select g n_7))) (U_2_bool (MapType0Select g n_7_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_7 n_7_1))))
 :qid |stdinbpl.3623:21|
 :skolemid |387|
 :pattern ( (neverTriggered43 n_7) (neverTriggered43 n_7_1))
))) (=> (forall ((n_7@@0 T@U) (n_7_1@@0 T@U) ) (!  (=> (and (= (type n_7@@0) RefType) (= (type n_7_1@@0) RefType)) (=> (and (and (and (and (not (= n_7@@0 n_7_1@@0)) (U_2_bool (MapType0Select g n_7@@0))) (U_2_bool (MapType0Select g n_7_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_7@@0 n_7_1@@0))))
 :qid |stdinbpl.3623:21|
 :skolemid |387|
 :pattern ( (neverTriggered43 n_7@@0) (neverTriggered43 n_7_1@@0))
)) (=> (= (ControlFlow 0 35) (- 0 34)) (forall ((n_7@@1 T@U) ) (!  (=> (and (= (type n_7@@1) RefType) (U_2_bool (MapType0Select g n_7@@1))) (>= (U_2_real (MapType2Select QPMask@0 n_7@@1 next)) FullPerm))
 :qid |stdinbpl.3630:21|
 :skolemid |388|
 :pattern ( (MapType1Select Heap@@13 n_7@@1 next))
 :pattern ( (MapType2Select QPMask@2 n_7@@1 next))
 :pattern ( (MapType1Select Heap@@13 n_7@@1 next))
)))))))
(let ((anon205_Else_correct  (=> (acyclic_graph ($$ Heap@@13 g)) (=> (and (state Heap@@13 QPMask@0) (state Heap@@13 QPMask@0)) (and (=> (= (ControlFlow 0 315) 35) anon206_Then_correct) (=> (= (ControlFlow 0 315) 314) anon206_Else_correct))))))
(let ((anon205_Then_correct  (and (=> (= (ControlFlow 0 32) (- 0 33)) (forall ((n_6 T@U) (n_6_1 T@U) ) (!  (=> (and (= (type n_6) RefType) (= (type n_6_1) RefType)) (=> (and (and (and (and (not (= n_6 n_6_1)) (U_2_bool (MapType0Select g n_6))) (U_2_bool (MapType0Select g n_6_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_6 n_6_1))))
 :qid |stdinbpl.3566:21|
 :skolemid |381|
 :pattern ( (neverTriggered42 n_6) (neverTriggered42 n_6_1))
))) (=> (forall ((n_6@@0 T@U) (n_6_1@@0 T@U) ) (!  (=> (and (= (type n_6@@0) RefType) (= (type n_6_1@@0) RefType)) (=> (and (and (and (and (not (= n_6@@0 n_6_1@@0)) (U_2_bool (MapType0Select g n_6@@0))) (U_2_bool (MapType0Select g n_6_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_6@@0 n_6_1@@0))))
 :qid |stdinbpl.3566:21|
 :skolemid |381|
 :pattern ( (neverTriggered42 n_6@@0) (neverTriggered42 n_6_1@@0))
)) (=> (= (ControlFlow 0 32) (- 0 31)) (forall ((n_6@@1 T@U) ) (!  (=> (and (= (type n_6@@1) RefType) (U_2_bool (MapType0Select g n_6@@1))) (>= (U_2_real (MapType2Select QPMask@0 n_6@@1 next)) FullPerm))
 :qid |stdinbpl.3573:21|
 :skolemid |382|
 :pattern ( (MapType1Select Heap@@13 n_6@@1 next))
 :pattern ( (MapType2Select QPMask@1 n_6@@1 next))
 :pattern ( (MapType1Select Heap@@13 n_6@@1 next))
)))))))
(let ((anon200_Else_correct  (=> (forall ((n_5 T@U) ) (!  (=> (and (= (type n_5) RefType) (U_2_bool (MapType0Select g n_5))) (or (not (exists_path ($$ Heap@@13 g) x_1@@1 n_5)) (not (exists_path ($$ Heap@@13 g) y@@7 n_5))))
 :qid |stdinbpl.3547:20|
 :skolemid |380|
 :pattern ( (MapType0Select g n_5))
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| Heap@@13 g))) g) x_1@@1 n_5))
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| Heap@@13 g))) g) y@@7 n_5))
)) (=> (and (state Heap@@13 QPMask@0) (state Heap@@13 QPMask@0)) (and (=> (= (ControlFlow 0 316) 32) anon205_Then_correct) (=> (= (ControlFlow 0 316) 315) anon205_Else_correct))))))
(let ((anon204_Then_correct  (and (=> (= (ControlFlow 0 27) (- 0 28)) (forall ((n$0_5 T@U) (n$0_5_1 T@U) ) (!  (=> (and (= (type n$0_5) RefType) (= (type n$0_5_1) RefType)) (=> (and (and (and (and (not (= n$0_5 n$0_5_1)) (U_2_bool (MapType0Select g n$0_5))) (U_2_bool (MapType0Select g n$0_5_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$0_5 n$0_5_1))))
 :qid |stdinbpl.3502:27|
 :skolemid |374|
 :pattern ( (neverTriggered41 n$0_5) (neverTriggered41 n$0_5_1))
))) (=> (forall ((n$0_5@@0 T@U) (n$0_5_1@@0 T@U) ) (!  (=> (and (= (type n$0_5@@0) RefType) (= (type n$0_5_1@@0) RefType)) (=> (and (and (and (and (not (= n$0_5@@0 n$0_5_1@@0)) (U_2_bool (MapType0Select g n$0_5@@0))) (U_2_bool (MapType0Select g n$0_5_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$0_5@@0 n$0_5_1@@0))))
 :qid |stdinbpl.3502:27|
 :skolemid |374|
 :pattern ( (neverTriggered41 n$0_5@@0) (neverTriggered41 n$0_5_1@@0))
)) (=> (= (ControlFlow 0 27) (- 0 26)) (forall ((n$0_5@@1 T@U) ) (!  (=> (and (= (type n$0_5@@1) RefType) (U_2_bool (MapType0Select g n$0_5@@1))) (>= (U_2_real (MapType2Select QPMask@0 n$0_5@@1 next)) FullPerm))
 :qid |stdinbpl.3509:27|
 :skolemid |375|
 :pattern ( (MapType1Select Heap@@13 n$0_5@@1 next))
 :pattern ( (MapType2Select QPMask@38 n$0_5@@1 next))
 :pattern ( (MapType1Select Heap@@13 n$0_5@@1 next))
)))))))
(let ((anon202_Then_correct  (and (=> (= (ControlFlow 0 23) (- 0 24)) (forall ((n$0_4 T@U) (n$0_4_1 T@U) ) (!  (=> (and (= (type n$0_4) RefType) (= (type n$0_4_1) RefType)) (=> (and (and (and (and (not (= n$0_4 n$0_4_1)) (U_2_bool (MapType0Select g n$0_4))) (U_2_bool (MapType0Select g n$0_4_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$0_4 n$0_4_1))))
 :qid |stdinbpl.3449:25|
 :skolemid |368|
 :pattern ( (neverTriggered40 n$0_4) (neverTriggered40 n$0_4_1))
))) (=> (forall ((n$0_4@@0 T@U) (n$0_4_1@@0 T@U) ) (!  (=> (and (= (type n$0_4@@0) RefType) (= (type n$0_4_1@@0) RefType)) (=> (and (and (and (and (not (= n$0_4@@0 n$0_4_1@@0)) (U_2_bool (MapType0Select g n$0_4@@0))) (U_2_bool (MapType0Select g n$0_4_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$0_4@@0 n$0_4_1@@0))))
 :qid |stdinbpl.3449:25|
 :skolemid |368|
 :pattern ( (neverTriggered40 n$0_4@@0) (neverTriggered40 n$0_4_1@@0))
)) (=> (= (ControlFlow 0 23) (- 0 22)) (forall ((n$0_4@@1 T@U) ) (!  (=> (and (= (type n$0_4@@1) RefType) (U_2_bool (MapType0Select g n$0_4@@1))) (>= (U_2_real (MapType2Select QPMask@0 n$0_4@@1 next)) FullPerm))
 :qid |stdinbpl.3456:25|
 :skolemid |369|
 :pattern ( (MapType1Select Heap@@13 n$0_4@@1 next))
 :pattern ( (MapType2Select QPMask@37 n$0_4@@1 next))
 :pattern ( (MapType1Select Heap@@13 n$0_4@@1 next))
)))))))
(let ((anon23_correct true))
(let ((anon203_Then_correct  (=> (exists_path ($$ Heap@@13 g) x_1@@1 n_10) (and (=> (= (ControlFlow 0 29) 27) anon204_Then_correct) (=> (= (ControlFlow 0 29) 20) anon23_correct)))))
(let ((anon203_Else_correct  (=> (and (not (exists_path ($$ Heap@@13 g) x_1@@1 n_10)) (= (ControlFlow 0 25) 20)) anon23_correct)))
(let ((anon201_Then_correct  (=> (U_2_bool (MapType0Select g n_10)) (and (and (=> (= (ControlFlow 0 30) 23) anon202_Then_correct) (=> (= (ControlFlow 0 30) 29) anon203_Then_correct)) (=> (= (ControlFlow 0 30) 25) anon203_Else_correct)))))
(let ((anon201_Else_correct  (=> (and (not (U_2_bool (MapType0Select g n_10))) (= (ControlFlow 0 21) 20)) anon23_correct)))
(let ((anon195_Else_correct  (=> (forall ((n_3 T@U) ) (!  (=> (and (= (type n_3) RefType) (U_2_bool (MapType0Select g n_3))) (or (exists_path ($$ Heap@@13 g) x_1@@1 n_3) (exists_path ($$ Heap@@13 g) y@@7 n_3)))
 :qid |stdinbpl.3428:20|
 :skolemid |367|
 :pattern ( (MapType0Select g n_3))
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| Heap@@13 g))) g) x_1@@1 n_3))
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| Heap@@13 g))) g) y@@7 n_3))
)) (=> (and (state Heap@@13 QPMask@0) (state Heap@@13 QPMask@0)) (and (and (=> (= (ControlFlow 0 317) 316) anon200_Else_correct) (=> (= (ControlFlow 0 317) 30) anon201_Then_correct)) (=> (= (ControlFlow 0 317) 21) anon201_Else_correct))))))
(let ((anon199_Then_correct  (and (=> (= (ControlFlow 0 16) (- 0 17)) (forall ((n$0_3 T@U) (n$0_3_1 T@U) ) (!  (=> (and (= (type n$0_3) RefType) (= (type n$0_3_1) RefType)) (=> (and (and (and (and (not (= n$0_3 n$0_3_1)) (U_2_bool (MapType0Select g n$0_3))) (U_2_bool (MapType0Select g n$0_3_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$0_3 n$0_3_1))))
 :qid |stdinbpl.3383:27|
 :skolemid |361|
 :pattern ( (neverTriggered39 n$0_3) (neverTriggered39 n$0_3_1))
))) (=> (forall ((n$0_3@@0 T@U) (n$0_3_1@@0 T@U) ) (!  (=> (and (= (type n$0_3@@0) RefType) (= (type n$0_3_1@@0) RefType)) (=> (and (and (and (and (not (= n$0_3@@0 n$0_3_1@@0)) (U_2_bool (MapType0Select g n$0_3@@0))) (U_2_bool (MapType0Select g n$0_3_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$0_3@@0 n$0_3_1@@0))))
 :qid |stdinbpl.3383:27|
 :skolemid |361|
 :pattern ( (neverTriggered39 n$0_3@@0) (neverTriggered39 n$0_3_1@@0))
)) (=> (= (ControlFlow 0 16) (- 0 15)) (forall ((n$0_3@@1 T@U) ) (!  (=> (and (= (type n$0_3@@1) RefType) (U_2_bool (MapType0Select g n$0_3@@1))) (>= (U_2_real (MapType2Select QPMask@0 n$0_3@@1 next)) FullPerm))
 :qid |stdinbpl.3390:27|
 :skolemid |362|
 :pattern ( (MapType1Select Heap@@13 n$0_3@@1 next))
 :pattern ( (MapType2Select QPMask@40 n$0_3@@1 next))
 :pattern ( (MapType1Select Heap@@13 n$0_3@@1 next))
)))))))
(let ((anon197_Then_correct  (and (=> (= (ControlFlow 0 12) (- 0 13)) (forall ((n$0_2 T@U) (n$0_2_1 T@U) ) (!  (=> (and (= (type n$0_2) RefType) (= (type n$0_2_1) RefType)) (=> (and (and (and (and (not (= n$0_2 n$0_2_1)) (U_2_bool (MapType0Select g n$0_2))) (U_2_bool (MapType0Select g n$0_2_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$0_2 n$0_2_1))))
 :qid |stdinbpl.3330:25|
 :skolemid |355|
 :pattern ( (neverTriggered38 n$0_2) (neverTriggered38 n$0_2_1))
))) (=> (forall ((n$0_2@@0 T@U) (n$0_2_1@@0 T@U) ) (!  (=> (and (= (type n$0_2@@0) RefType) (= (type n$0_2_1@@0) RefType)) (=> (and (and (and (and (not (= n$0_2@@0 n$0_2_1@@0)) (U_2_bool (MapType0Select g n$0_2@@0))) (U_2_bool (MapType0Select g n$0_2_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$0_2@@0 n$0_2_1@@0))))
 :qid |stdinbpl.3330:25|
 :skolemid |355|
 :pattern ( (neverTriggered38 n$0_2@@0) (neverTriggered38 n$0_2_1@@0))
)) (=> (= (ControlFlow 0 12) (- 0 11)) (forall ((n$0_2@@1 T@U) ) (!  (=> (and (= (type n$0_2@@1) RefType) (U_2_bool (MapType0Select g n$0_2@@1))) (>= (U_2_real (MapType2Select QPMask@0 n$0_2@@1 next)) FullPerm))
 :qid |stdinbpl.3337:25|
 :skolemid |356|
 :pattern ( (MapType1Select Heap@@13 n$0_2@@1 next))
 :pattern ( (MapType2Select QPMask@39 n$0_2@@1 next))
 :pattern ( (MapType1Select Heap@@13 n$0_2@@1 next))
)))))))
(let ((anon15_correct true))
(let ((anon198_Then_correct  (=> (not (exists_path ($$ Heap@@13 g) x_1@@1 n)) (and (=> (= (ControlFlow 0 18) 16) anon199_Then_correct) (=> (= (ControlFlow 0 18) 9) anon15_correct)))))
(let ((anon198_Else_correct  (=> (and (exists_path ($$ Heap@@13 g) x_1@@1 n) (= (ControlFlow 0 14) 9)) anon15_correct)))
(let ((anon196_Then_correct  (=> (U_2_bool (MapType0Select g n)) (and (and (=> (= (ControlFlow 0 19) 12) anon197_Then_correct) (=> (= (ControlFlow 0 19) 18) anon198_Then_correct)) (=> (= (ControlFlow 0 19) 14) anon198_Else_correct)))))
(let ((anon196_Else_correct  (=> (and (not (U_2_bool (MapType0Select g n))) (= (ControlFlow 0 10) 9)) anon15_correct)))
(let ((anon192_Else_correct  (=> (forall ((n$0_1 T@U) ) (!  (=> (= (type n$0_1) RefType) (=> (and (U_2_bool (MapType0Select g n$0_1)) (not (= (MapType1Select Heap@@13 n$0_1 next) null))) (U_2_bool (MapType0Select g (MapType1Select Heap@@13 n$0_1 next)))))
 :qid |stdinbpl.3305:20|
 :skolemid |354|
 :pattern ( (MapType0Select g (MapType1Select Heap@@13 n$0_1 next)))
 :pattern ( (MapType0Select g n$0_1) (MapType1Select Heap@@13 n$0_1 next))
)) (=> (and (state Heap@@13 QPMask@0) (U_2_bool (MapType0Select g x_1@@1))) (=> (and (and (U_2_bool (MapType0Select g y@@7)) (not (= x_1@@1 y@@7))) (and (state Heap@@13 QPMask@0) (state Heap@@13 QPMask@0))) (and (and (=> (= (ControlFlow 0 318) 317) anon195_Else_correct) (=> (= (ControlFlow 0 318) 19) anon196_Then_correct)) (=> (= (ControlFlow 0 318) 10) anon196_Else_correct)))))))
(let ((anon7_correct true))
(let ((anon194_Else_correct  (=> (and (not (and (U_2_bool (MapType0Select g n$0_13)) (not (= (MapType1Select Heap@@13 n$0_13 next) null)))) (= (ControlFlow 0 5) 2)) anon7_correct)))
(let ((anon194_Then_correct  (=> (and (U_2_bool (MapType0Select g n$0_13)) (not (= (MapType1Select Heap@@13 n$0_13 next) null))) (and (=> (= (ControlFlow 0 3) (- 0 4)) (HasDirectPerm QPMask@0 n$0_13 next)) (=> (HasDirectPerm QPMask@0 n$0_13 next) (=> (= (ControlFlow 0 3) 2) anon7_correct))))))
(let ((anon193_Else_correct  (=> (not (U_2_bool (MapType0Select g n$0_13))) (and (=> (= (ControlFlow 0 8) 3) anon194_Then_correct) (=> (= (ControlFlow 0 8) 5) anon194_Else_correct)))))
(let ((anon193_Then_correct  (=> (U_2_bool (MapType0Select g n$0_13)) (and (=> (= (ControlFlow 0 6) (- 0 7)) (HasDirectPerm QPMask@0 n$0_13 next)) (=> (HasDirectPerm QPMask@0 n$0_13 next) (and (=> (= (ControlFlow 0 6) 3) anon194_Then_correct) (=> (= (ControlFlow 0 6) 5) anon194_Else_correct)))))))
(let ((anon191_Else_correct  (and (=> (= (ControlFlow 0 319) (- 0 320)) (forall ((n_1 T@U) (n_1_1 T@U) ) (!  (=> (and (= (type n_1) RefType) (= (type n_1_1) RefType)) (=> (and (and (and (and (not (= n_1 n_1_1)) (U_2_bool (MapType0Select g n_1))) (U_2_bool (MapType0Select g n_1_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_1 n_1_1))))
 :qid |stdinbpl.3260:15|
 :skolemid |348|
 :no-pattern (type n_1)
 :no-pattern (type n_1_1)
 :no-pattern (U_2_int n_1)
 :no-pattern (U_2_bool n_1)
 :no-pattern (U_2_int n_1_1)
 :no-pattern (U_2_bool n_1_1)
))) (=> (forall ((n_1@@0 T@U) (n_1_1@@0 T@U) ) (!  (=> (and (= (type n_1@@0) RefType) (= (type n_1_1@@0) RefType)) (=> (and (and (and (and (not (= n_1@@0 n_1_1@@0)) (U_2_bool (MapType0Select g n_1@@0))) (U_2_bool (MapType0Select g n_1_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_1@@0 n_1_1@@0))))
 :qid |stdinbpl.3260:15|
 :skolemid |348|
 :no-pattern (type n_1@@0)
 :no-pattern (type n_1_1@@0)
 :no-pattern (U_2_int n_1@@0)
 :no-pattern (U_2_bool n_1@@0)
 :no-pattern (U_2_int n_1_1@@0)
 :no-pattern (U_2_bool n_1_1@@0)
)) (=> (and (forall ((n_1@@1 T@U) ) (!  (=> (= (type n_1@@1) RefType) (=> (and (U_2_bool (MapType0Select g n_1@@1)) (< NoPerm FullPerm)) (and (qpRange37 n_1@@1) (= (invRecv37 n_1@@1) n_1@@1))))
 :qid |stdinbpl.3266:22|
 :skolemid |349|
 :pattern ( (MapType1Select Heap@@13 n_1@@1 next))
 :pattern ( (MapType2Select QPMask@0 n_1@@1 next))
 :pattern ( (MapType1Select Heap@@13 n_1@@1 next))
)) (forall ((o_3@@20 T@U) ) (!  (=> (= (type o_3@@20) RefType) (=> (and (and (U_2_bool (MapType0Select g (invRecv37 o_3@@20))) (< NoPerm FullPerm)) (qpRange37 o_3@@20)) (= (invRecv37 o_3@@20) o_3@@20)))
 :qid |stdinbpl.3270:22|
 :skolemid |350|
 :pattern ( (invRecv37 o_3@@20))
))) (=> (and (and (forall ((n_1@@2 T@U) ) (!  (=> (and (= (type n_1@@2) RefType) (U_2_bool (MapType0Select g n_1@@2))) (not (= n_1@@2 null)))
 :qid |stdinbpl.3276:22|
 :skolemid |351|
 :pattern ( (MapType1Select Heap@@13 n_1@@2 next))
 :pattern ( (MapType2Select QPMask@0 n_1@@2 next))
 :pattern ( (MapType1Select Heap@@13 n_1@@2 next))
)) (forall ((o_3@@21 T@U) ) (!  (=> (= (type o_3@@21) RefType) (and (=> (and (and (U_2_bool (MapType0Select g (invRecv37 o_3@@21))) (< NoPerm FullPerm)) (qpRange37 o_3@@21)) (and (=> (< NoPerm FullPerm) (= (invRecv37 o_3@@21) o_3@@21)) (= (U_2_real (MapType2Select QPMask@0 o_3@@21 next)) (+ (U_2_real (MapType2Select ZeroMask o_3@@21 next)) FullPerm)))) (=> (not (and (and (U_2_bool (MapType0Select g (invRecv37 o_3@@21))) (< NoPerm FullPerm)) (qpRange37 o_3@@21))) (= (U_2_real (MapType2Select QPMask@0 o_3@@21 next)) (U_2_real (MapType2Select ZeroMask o_3@@21 next))))))
 :qid |stdinbpl.3282:22|
 :skolemid |352|
 :pattern ( (MapType2Select QPMask@0 o_3@@21 next))
))) (and (forall ((o_3@@22 T@U) (f_5@@6 T@U) ) (! (let ((B@@18 (FieldTypeInv1 (type f_5@@6))))
(let ((A@@19 (FieldTypeInv0 (type f_5@@6))))
 (=> (and (and (= (type o_3@@22) RefType) (= (type f_5@@6) (FieldType A@@19 B@@18))) (not (= f_5@@6 next))) (= (U_2_real (MapType2Select ZeroMask o_3@@22 f_5@@6)) (U_2_real (MapType2Select QPMask@0 o_3@@22 f_5@@6))))))
 :qid |stdinbpl.3286:29|
 :skolemid |353|
 :pattern ( (MapType2Select ZeroMask o_3@@22 f_5@@6))
 :pattern ( (MapType2Select QPMask@0 o_3@@22 f_5@@6))
)) (state Heap@@13 QPMask@0))) (and (and (=> (= (ControlFlow 0 319) 318) anon192_Else_correct) (=> (= (ControlFlow 0 319) 6) anon193_Then_correct)) (=> (= (ControlFlow 0 319) 8) anon193_Else_correct))))))))
(let ((anon191_Then_correct true))
(let ((anon0_correct  (=> (state Heap@@13 ZeroMask) (=> (and (and (= AssumeFunctionsAbove (- 0 1)) (U_2_bool (MapType1Select Heap@@13 x_1@@1 $allocated))) (and (U_2_bool (MapType1Select Heap@@13 y@@7 $allocated)) (not (U_2_bool (MapType0Select g null))))) (and (=> (= (ControlFlow 0 321) 1) anon191_Then_correct) (=> (= (ControlFlow 0 321) 319) anon191_Else_correct))))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 322) 321) anon0_correct)))
PreconditionGeneratedEntry_correct))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
))
(check-sat)
