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
(declare-fun succHeap (T@U T@U) Bool)
(declare-fun MapType0Type (T@T) T@T)
(declare-fun succHeapTrans (T@U T@U) Bool)
(declare-fun MapType0TypeInv0 (T@T) T@T)
(declare-fun MapType0Select (T@U T@U T@U) T@U)
(declare-fun MapType0Store (T@U T@U T@U T@U) T@U)
(declare-fun |MultiSet#Card| (T@U) Int)
(declare-fun |MultiSet#Difference| (T@U T@U) T@U)
(declare-fun MultiSetTypeInv0 (T@T) T@T)
(declare-fun MultiSetType (T@T) T@T)
(declare-fun |MultiSet#Intersection| (T@U T@U) T@U)
(declare-fun |MultiSet#Union| (T@U T@U) T@U)
(declare-fun state (T@U T@U) Bool)
(declare-fun MapType1Type (T@T T@T) T@T)
(declare-fun GoodMask (T@U) Bool)
(declare-fun MapType1TypeInv0 (T@T) T@T)
(declare-fun MapType1TypeInv1 (T@T) T@T)
(declare-fun MapType1Select (T@U T@U T@U) T@U)
(declare-fun MapType1Store (T@U T@U T@U T@U) T@U)
(declare-fun |is_global_sroot'| (T@U T@U T@U) Bool)
(declare-fun MapType2Type (T@T T@T) T@T)
(declare-fun dummyFunction (T@U) Bool)
(declare-fun |is_global_sroot#triggerStateless| (T@U T@U) Bool)
(declare-fun MapType2TypeInv0 (T@T) T@T)
(declare-fun MapType2TypeInv1 (T@T) T@T)
(declare-fun MapType2Select (T@U T@U) T@U)
(declare-fun MapType2Store (T@U T@U T@U) T@U)
(declare-fun |apply_TCFraming'| (T@U T@U T@U) Bool)
(declare-fun |apply_TCFraming#triggerStateless| (T@U T@U) Bool)
(declare-fun |Math#min| (Int Int) Int)
(declare-fun IdenticalOnKnownLocations (T@U T@U T@U) Bool)
(declare-fun IsPredicateField (T@U) Bool)
(declare-fun null () T@U)
(declare-fun PredicateMaskField (T@U) T@U)
(declare-fun FrameTypeType () T@T)
(declare-fun HasDirectPerm (T@U T@U T@U) Bool)
(declare-fun IsWandField (T@U) Bool)
(declare-fun WandMaskField (T@U) T@U)
(declare-fun EdgeDomainTypeType () T@T)
(declare-fun create_edge (T@U T@U) T@U)
(declare-fun edge_pred (T@U) T@U)
(declare-fun edge_succ (T@U) T@U)
(declare-fun |$$'| (T@U T@U) T@U)
(declare-fun |$$#triggerStateless| (T@U) T@U)
(declare-fun |acyclic_list_segment'| (T@U T@U) Bool)
(declare-fun |acyclic_list_segment#triggerStateless| (T@U) Bool)
(declare-fun |acyclic_list_segment#condqp3| (T@U T@U) Int)
(declare-fun |sk_acyclic_list_segment#condqp3| (Int Int) T@U)
(declare-fun NoPerm () Real)
(declare-fun FullPerm () Real)
(declare-fun |MultiSet#Select| (T@U T@U) Int)
(declare-fun |Set#Union| (T@U T@U) T@U)
(declare-fun |Set#Intersection| (T@U T@U) T@U)
(declare-fun |Set#Singleton| (T@U) T@U)
(declare-fun exists_spath (T@U T@U T@U) Bool)
(declare-fun exists_path (T@U T@U T@U) Bool)
(declare-fun |Set#Card| (T@U) Int)
(declare-fun inst_uReach (T@U T@U) T@U)
(declare-fun $$ (T@U T@U) T@U)
(declare-fun |Math#clip| (Int) Int)
(declare-fun exists_path_ (T@U T@U T@U) Bool)
(declare-fun edge (T@U T@U T@U) Bool)
(declare-fun edge_ (T@U T@U T@U) Bool)
(declare-fun dummyHeap () T@U)
(declare-fun ZeroMask () T@U)
(declare-fun |MultiSet#UnionOne| (T@U T@U) T@U)
(declare-fun |MultiSet#Disjoint| (T@U T@U) Bool)
(declare-fun InsidePredicate (T@U T@U T@U T@U) Bool)
(declare-fun |MultiSet#Singleton| (T@U) T@U)
(declare-fun apply_noExit (T@U T@U T@U) Bool)
(declare-fun acyclic_list_segment (T@U T@U) Bool)
(declare-fun AssumeFunctionsAbove () Int)
(declare-fun acyclic_graph (T@U) Bool)
(declare-fun func_graph (T@U) Bool)
(declare-fun unshared_graph (T@U) Bool)
(declare-fun |is_global_sroot#frame| (T@U T@U T@U) Bool)
(declare-fun FrameFragment (T@U) T@U)
(declare-fun |is_global_sroot#condqp2| (T@U T@U T@U) Int)
(declare-fun |Set#Equal| (T@U T@U) Bool)
(declare-fun sumMask (T@U T@U T@U) Bool)
(declare-fun ConditionalFrame (Real T@U) T@U)
(declare-fun EmptyFrame () T@U)
(declare-fun |$$#trigger| (T@U T@U) Bool)
(declare-fun |$$#condqp1| (T@U T@U) Int)
(declare-fun |Set#Difference| (T@U T@U) T@U)
(declare-fun |MultiSet#Equal| (T@U T@U) Bool)
(declare-fun |Set#Empty| (T@T) T@U)
(declare-fun |Set#UnionOne| (T@U T@U) T@U)
(declare-fun |apply_TCFraming#trigger| (T@U T@U T@U) Bool)
(declare-fun CombineFrames (T@U T@U) T@U)
(declare-fun |apply_TCFraming#condqp4| (T@U T@U T@U) Int)
(declare-fun |apply_TCFraming#condqp5| (T@U T@U T@U) Int)
(declare-fun |$$#frame| (T@U T@U) T@U)
(declare-fun |sk_$$#condqp1| (Int Int) T@U)
(declare-fun |MultiSet#Empty| (T@T) T@U)
(declare-fun |acyclic_list_segment#frame| (T@U T@U) Bool)
(declare-fun is_global_sroot (T@U T@U T@U) Bool)
(declare-fun |Set#Subset| (T@U T@U) Bool)
(declare-fun |sk_is_global_sroot#condqp2| (Int Int) T@U)
(declare-fun |sk_apply_TCFraming#condqp4| (Int Int) T@U)
(declare-fun |sk_apply_TCFraming#condqp5| (Int Int) T@U)
(declare-fun |apply_TCFraming#frame| (T@U T@U T@U) Bool)
(declare-fun ZeroPMask () T@U)
(declare-fun |MultiSet#Subset| (T@U T@U) Bool)
(declare-fun apply_TCFraming (T@U T@U T@U) Bool)
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
(assert  (and (and (and (and (forall ((arg0@@18 T@T) ) (! (= (Ctor (MultiSetType arg0@@18)) 10)
 :qid |ctor:MultiSetType|
)) (forall ((arg0@@19 T@T) ) (! (= (MultiSetTypeInv0 (MultiSetType arg0@@19)) arg0@@19)
 :qid |typeInv:MultiSetTypeInv0|
 :pattern ( (MultiSetType arg0@@19))
))) (forall ((arg0@@20 T@U) (arg1@@4 T@U) ) (! (let ((T (MultiSetTypeInv0 (type arg0@@20))))
(= (type (|MultiSet#Difference| arg0@@20 arg1@@4)) (MultiSetType T)))
 :qid |funType:MultiSet#Difference|
 :pattern ( (|MultiSet#Difference| arg0@@20 arg1@@4))
))) (forall ((arg0@@21 T@U) (arg1@@5 T@U) ) (! (let ((T@@0 (MultiSetTypeInv0 (type arg0@@21))))
(= (type (|MultiSet#Intersection| arg0@@21 arg1@@5)) (MultiSetType T@@0)))
 :qid |funType:MultiSet#Intersection|
 :pattern ( (|MultiSet#Intersection| arg0@@21 arg1@@5))
))) (forall ((arg0@@22 T@U) (arg1@@6 T@U) ) (! (let ((T@@1 (MultiSetTypeInv0 (type arg0@@22))))
(= (type (|MultiSet#Union| arg0@@22 arg1@@6)) (MultiSetType T@@1)))
 :qid |funType:MultiSet#Union|
 :pattern ( (|MultiSet#Union| arg0@@22 arg1@@6))
))))
(assert (forall ((a T@U) (b T@U) ) (! (let ((T@@2 (MultiSetTypeInv0 (type a))))
 (=> (and (= (type a) (MultiSetType T@@2)) (= (type b) (MultiSetType T@@2))) (and (= (+ (+ (|MultiSet#Card| (|MultiSet#Difference| a b)) (|MultiSet#Card| (|MultiSet#Difference| b a))) (* 2 (|MultiSet#Card| (|MultiSet#Intersection| a b)))) (|MultiSet#Card| (|MultiSet#Union| a b))) (= (|MultiSet#Card| (|MultiSet#Difference| a b)) (- (|MultiSet#Card| a) (|MultiSet#Card| (|MultiSet#Intersection| a b)))))))
 :qid |stdinbpl.539:18|
 :skolemid |74|
 :pattern ( (|MultiSet#Card| (|MultiSet#Difference| a b)))
)))
(assert  (and (and (and (and (and (and (forall ((arg0@@23 T@T) (arg1@@7 T@T) ) (! (= (Ctor (MapType1Type arg0@@23 arg1@@7)) 11)
 :qid |ctor:MapType1Type|
)) (forall ((arg0@@24 T@T) (arg1@@8 T@T) ) (! (= (MapType1TypeInv0 (MapType1Type arg0@@24 arg1@@8)) arg0@@24)
 :qid |typeInv:MapType1TypeInv0|
 :pattern ( (MapType1Type arg0@@24 arg1@@8))
))) (forall ((arg0@@25 T@T) (arg1@@9 T@T) ) (! (= (MapType1TypeInv1 (MapType1Type arg0@@25 arg1@@9)) arg1@@9)
 :qid |typeInv:MapType1TypeInv1|
 :pattern ( (MapType1Type arg0@@25 arg1@@9))
))) (forall ((arg0@@26 T@U) (arg1@@10 T@U) (arg2@@1 T@U) ) (! (let ((aVar1 (MapType1TypeInv1 (type arg0@@26))))
(= (type (MapType1Select arg0@@26 arg1@@10 arg2@@1)) aVar1))
 :qid |funType:MapType1Select|
 :pattern ( (MapType1Select arg0@@26 arg1@@10 arg2@@1))
))) (forall ((arg0@@27 T@U) (arg1@@11 T@U) (arg2@@2 T@U) (arg3@@0 T@U) ) (! (let ((aVar1@@0 (type arg3@@0)))
(let ((aVar0@@0 (type arg1@@11)))
(= (type (MapType1Store arg0@@27 arg1@@11 arg2@@2 arg3@@0)) (MapType1Type aVar0@@0 aVar1@@0))))
 :qid |funType:MapType1Store|
 :pattern ( (MapType1Store arg0@@27 arg1@@11 arg2@@2 arg3@@0))
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
(assert  (and (and (and (and (and (and (forall ((arg0@@28 T@T) (arg1@@12 T@T) ) (! (= (Ctor (MapType2Type arg0@@28 arg1@@12)) 12)
 :qid |ctor:MapType2Type|
)) (forall ((arg0@@29 T@T) (arg1@@13 T@T) ) (! (= (MapType2TypeInv0 (MapType2Type arg0@@29 arg1@@13)) arg0@@29)
 :qid |typeInv:MapType2TypeInv0|
 :pattern ( (MapType2Type arg0@@29 arg1@@13))
))) (forall ((arg0@@30 T@T) (arg1@@14 T@T) ) (! (= (MapType2TypeInv1 (MapType2Type arg0@@30 arg1@@14)) arg1@@14)
 :qid |typeInv:MapType2TypeInv1|
 :pattern ( (MapType2Type arg0@@30 arg1@@14))
))) (forall ((arg0@@31 T@U) (arg1@@15 T@U) ) (! (let ((aVar1@@2 (MapType2TypeInv1 (type arg0@@31))))
(= (type (MapType2Select arg0@@31 arg1@@15)) aVar1@@2))
 :qid |funType:MapType2Select|
 :pattern ( (MapType2Select arg0@@31 arg1@@15))
))) (forall ((arg0@@32 T@U) (arg1@@16 T@U) (arg2@@3 T@U) ) (! (let ((aVar1@@3 (type arg2@@3)))
(let ((aVar0@@1 (type arg1@@16)))
(= (type (MapType2Store arg0@@32 arg1@@16 arg2@@3)) (MapType2Type aVar0@@1 aVar1@@3))))
 :qid |funType:MapType2Store|
 :pattern ( (MapType2Store arg0@@32 arg1@@16 arg2@@3))
))) (forall ((m@@7 T@U) (x0@@7 T@U) (val@@7 T@U) ) (! (let ((aVar1@@4 (MapType2TypeInv1 (type m@@7))))
 (=> (= (type val@@7) aVar1@@4) (= (MapType2Select (MapType2Store m@@7 x0@@7 val@@7) x0@@7) val@@7)))
 :qid |mapAx0:MapType2Select|
 :weight 0
))) (and (forall ((val@@8 T@U) (m@@8 T@U) (x0@@8 T@U) (y0@@5 T@U) ) (!  (or (= x0@@8 y0@@5) (= (MapType2Select (MapType2Store m@@8 x0@@8 val@@8) y0@@5) (MapType2Select m@@8 y0@@5)))
 :qid |mapAx1:MapType2Select:0|
 :weight 0
)) (forall ((val@@9 T@U) (m@@9 T@U) (x0@@9 T@U) (y0@@6 T@U) ) (!  (or true (= (MapType2Select (MapType2Store m@@9 x0@@9 val@@9) y0@@6) (MapType2Select m@@9 y0@@6)))
 :qid |mapAx2:MapType2Select|
 :weight 0
)))))
(assert (forall ((Heap@@0 T@U) (g T@U) (roots T@U) ) (!  (=> (and (and (= (type Heap@@0) (MapType0Type RefType)) (= (type g) (MapType2Type RefType boolType))) (= (type roots) (MapType2Type RefType boolType))) (dummyFunction (bool_2_U (|is_global_sroot#triggerStateless| g roots))))
 :qid |stdinbpl.882:15|
 :skolemid |119|
 :pattern ( (|is_global_sroot'| Heap@@0 g roots))
)))
(assert (forall ((Heap@@1 T@U) (g0 T@U) (g1 T@U) ) (!  (=> (and (and (= (type Heap@@1) (MapType0Type RefType)) (= (type g0) (MapType2Type RefType boolType))) (= (type g1) (MapType2Type RefType boolType))) (dummyFunction (bool_2_U (|apply_TCFraming#triggerStateless| g0 g1))))
 :qid |stdinbpl.1386:15|
 :skolemid |175|
 :pattern ( (|apply_TCFraming'| Heap@@1 g0 g1))
)))
(assert (forall ((a@@0 Int) (b@@0 Int) ) (!  (or (= (|Math#min| a@@0 b@@0) a@@0) (= (|Math#min| a@@0 b@@0) b@@0))
 :qid |stdinbpl.470:15|
 :skolemid |53|
 :pattern ( (|Math#min| a@@0 b@@0))
)))
(assert  (and (and (= (Ctor FrameTypeType) 13) (= (type null) RefType)) (forall ((arg0@@33 T@U) ) (! (let ((A (FieldTypeInv0 (type arg0@@33))))
(= (type (PredicateMaskField arg0@@33)) (FieldType A (MapType1Type RefType boolType))))
 :qid |funType:PredicateMaskField|
 :pattern ( (PredicateMaskField arg0@@33))
))))
(assert (forall ((Heap@@2 T@U) (ExhaleHeap T@U) (Mask@@0 T@U) (pm_f T@U) ) (! (let ((C (FieldTypeInv0 (type pm_f))))
 (=> (and (and (and (and (and (= (type Heap@@2) (MapType0Type RefType)) (= (type ExhaleHeap) (MapType0Type RefType))) (= (type Mask@@0) (MapType1Type RefType realType))) (= (type pm_f) (FieldType C FrameTypeType))) (IdenticalOnKnownLocations Heap@@2 ExhaleHeap Mask@@0)) (and (HasDirectPerm Mask@@0 null pm_f) (IsPredicateField pm_f))) (= (MapType0Select Heap@@2 null (PredicateMaskField pm_f)) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))))
 :qid |stdinbpl.47:19|
 :skolemid |2|
 :pattern ( (IdenticalOnKnownLocations Heap@@2 ExhaleHeap Mask@@0) (IsPredicateField pm_f) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))
)))
(assert (forall ((arg0@@34 T@U) ) (! (let ((A@@0 (FieldTypeInv0 (type arg0@@34))))
(= (type (WandMaskField arg0@@34)) (FieldType A@@0 (MapType1Type RefType boolType))))
 :qid |funType:WandMaskField|
 :pattern ( (WandMaskField arg0@@34))
)))
(assert (forall ((Heap@@3 T@U) (ExhaleHeap@@0 T@U) (Mask@@1 T@U) (pm_f@@0 T@U) ) (! (let ((C@@0 (FieldTypeInv0 (type pm_f@@0))))
 (=> (and (and (and (and (and (= (type Heap@@3) (MapType0Type RefType)) (= (type ExhaleHeap@@0) (MapType0Type RefType))) (= (type Mask@@1) (MapType1Type RefType realType))) (= (type pm_f@@0) (FieldType C@@0 FrameTypeType))) (IdenticalOnKnownLocations Heap@@3 ExhaleHeap@@0 Mask@@1)) (and (HasDirectPerm Mask@@1 null pm_f@@0) (IsWandField pm_f@@0))) (= (MapType0Select Heap@@3 null (WandMaskField pm_f@@0)) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))))
 :qid |stdinbpl.60:19|
 :skolemid |5|
 :pattern ( (IdenticalOnKnownLocations Heap@@3 ExhaleHeap@@0 Mask@@1) (IsWandField pm_f@@0) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))
)))
(assert  (and (and (and (= (Ctor EdgeDomainTypeType) 14) (forall ((arg0@@35 T@U) (arg1@@17 T@U) ) (! (= (type (create_edge arg0@@35 arg1@@17)) EdgeDomainTypeType)
 :qid |funType:create_edge|
 :pattern ( (create_edge arg0@@35 arg1@@17))
))) (forall ((arg0@@36 T@U) ) (! (= (type (edge_pred arg0@@36)) RefType)
 :qid |funType:edge_pred|
 :pattern ( (edge_pred arg0@@36))
))) (forall ((arg0@@37 T@U) ) (! (= (type (edge_succ arg0@@37)) RefType)
 :qid |funType:edge_succ|
 :pattern ( (edge_succ arg0@@37))
))))
(assert (forall ((g@@0 T@U) (e_1 T@U) ) (!  (=> (and (and (= (type g@@0) (MapType2Type EdgeDomainTypeType boolType)) (= (type e_1) EdgeDomainTypeType)) (U_2_bool (MapType2Select g@@0 e_1))) (= (create_edge (edge_pred e_1) (edge_succ e_1)) e_1))
 :qid |stdinbpl.730:15|
 :skolemid |103|
 :pattern ( (MapType2Select g@@0 e_1))
)))
(assert  (and (forall ((arg0@@38 T@U) (arg1@@18 T@U) ) (! (= (type (|$$'| arg0@@38 arg1@@18)) (MapType2Type EdgeDomainTypeType boolType))
 :qid |funType:$$'|
 :pattern ( (|$$'| arg0@@38 arg1@@18))
)) (forall ((arg0@@39 T@U) ) (! (= (type (|$$#triggerStateless| arg0@@39)) (MapType2Type EdgeDomainTypeType boolType))
 :qid |funType:$$#triggerStateless|
 :pattern ( (|$$#triggerStateless| arg0@@39))
))))
(assert (forall ((Heap@@4 T@U) (refs T@U) ) (!  (=> (and (= (type Heap@@4) (MapType0Type RefType)) (= (type refs) (MapType2Type RefType boolType))) (dummyFunction (|$$#triggerStateless| refs)))
 :qid |stdinbpl.754:15|
 :skolemid |105|
 :pattern ( (|$$'| Heap@@4 refs))
)))
(assert (forall ((Heap@@5 T@U) (g@@1 T@U) ) (!  (=> (and (= (type Heap@@5) (MapType0Type RefType)) (= (type g@@1) (MapType2Type RefType boolType))) (dummyFunction (bool_2_U (|acyclic_list_segment#triggerStateless| g@@1))))
 :qid |stdinbpl.1083:15|
 :skolemid |141|
 :pattern ( (|acyclic_list_segment'| Heap@@5 g@@1))
)))
(assert (forall ((arg0@@40 Int) (arg1@@19 Int) ) (! (= (type (|sk_acyclic_list_segment#condqp3| arg0@@40 arg1@@19)) RefType)
 :qid |funType:sk_acyclic_list_segment#condqp3|
 :pattern ( (|sk_acyclic_list_segment#condqp3| arg0@@40 arg1@@19))
)))
(assert (forall ((Heap2Heap T@U) (Heap1Heap T@U) (g@@2 T@U) ) (!  (=> (and (and (and (= (type Heap2Heap) (MapType0Type RefType)) (= (type Heap1Heap) (MapType0Type RefType))) (= (type g@@2) (MapType2Type RefType boolType))) (and (=  (and (U_2_bool (MapType2Select g@@2 (|sk_acyclic_list_segment#condqp3| (|acyclic_list_segment#condqp3| Heap2Heap g@@2) (|acyclic_list_segment#condqp3| Heap1Heap g@@2)))) (< NoPerm FullPerm))  (and (U_2_bool (MapType2Select g@@2 (|sk_acyclic_list_segment#condqp3| (|acyclic_list_segment#condqp3| Heap2Heap g@@2) (|acyclic_list_segment#condqp3| Heap1Heap g@@2)))) (< NoPerm FullPerm))) (=> (and (U_2_bool (MapType2Select g@@2 (|sk_acyclic_list_segment#condqp3| (|acyclic_list_segment#condqp3| Heap2Heap g@@2) (|acyclic_list_segment#condqp3| Heap1Heap g@@2)))) (< NoPerm FullPerm)) (= (MapType0Select Heap2Heap (|sk_acyclic_list_segment#condqp3| (|acyclic_list_segment#condqp3| Heap2Heap g@@2) (|acyclic_list_segment#condqp3| Heap1Heap g@@2)) next) (MapType0Select Heap1Heap (|sk_acyclic_list_segment#condqp3| (|acyclic_list_segment#condqp3| Heap2Heap g@@2) (|acyclic_list_segment#condqp3| Heap1Heap g@@2)) next))))) (= (|acyclic_list_segment#condqp3| Heap2Heap g@@2) (|acyclic_list_segment#condqp3| Heap1Heap g@@2)))
 :qid |stdinbpl.1109:15|
 :skolemid |145|
 :pattern ( (|acyclic_list_segment#condqp3| Heap2Heap g@@2) (|acyclic_list_segment#condqp3| Heap1Heap g@@2) (succHeapTrans Heap2Heap Heap1Heap))
)))
(assert (forall ((a@@1 T@U) (b@@1 T@U) (y@@1 T@U) ) (! (let ((T@@3 (type y@@1)))
 (=> (and (and (= (type a@@1) (MultiSetType T@@3)) (= (type b@@1) (MultiSetType T@@3))) (<= (|MultiSet#Select| a@@1 y@@1) (|MultiSet#Select| b@@1 y@@1))) (= (|MultiSet#Select| (|MultiSet#Difference| a@@1 b@@1) y@@1) 0)))
 :qid |stdinbpl.537:18|
 :skolemid |73|
 :pattern ( (|MultiSet#Difference| a@@1 b@@1) (|MultiSet#Select| b@@1 y@@1) (|MultiSet#Select| a@@1 y@@1))
)))
(assert (forall ((arg0@@41 T@U) (arg1@@20 T@U) ) (! (let ((T@@4 (MapType2TypeInv0 (type arg0@@41))))
(= (type (|Set#Union| arg0@@41 arg1@@20)) (MapType2Type T@@4 boolType)))
 :qid |funType:Set#Union|
 :pattern ( (|Set#Union| arg0@@41 arg1@@20))
)))
(assert (forall ((a@@2 T@U) (b@@2 T@U) ) (! (let ((T@@5 (MapType2TypeInv0 (type a@@2))))
 (=> (and (= (type a@@2) (MapType2Type T@@5 boolType)) (= (type b@@2) (MapType2Type T@@5 boolType))) (= (|Set#Union| (|Set#Union| a@@2 b@@2) b@@2) (|Set#Union| a@@2 b@@2))))
 :qid |stdinbpl.422:18|
 :skolemid |38|
 :pattern ( (|Set#Union| (|Set#Union| a@@2 b@@2) b@@2))
)))
(assert (forall ((arg0@@42 T@U) (arg1@@21 T@U) ) (! (let ((T@@6 (MapType2TypeInv0 (type arg0@@42))))
(= (type (|Set#Intersection| arg0@@42 arg1@@21)) (MapType2Type T@@6 boolType)))
 :qid |funType:Set#Intersection|
 :pattern ( (|Set#Intersection| arg0@@42 arg1@@21))
)))
(assert (forall ((a@@3 T@U) (b@@3 T@U) ) (! (let ((T@@7 (MapType2TypeInv0 (type a@@3))))
 (=> (and (= (type a@@3) (MapType2Type T@@7 boolType)) (= (type b@@3) (MapType2Type T@@7 boolType))) (= (|Set#Intersection| (|Set#Intersection| a@@3 b@@3) b@@3) (|Set#Intersection| a@@3 b@@3))))
 :qid |stdinbpl.426:18|
 :skolemid |40|
 :pattern ( (|Set#Intersection| (|Set#Intersection| a@@3 b@@3) b@@3))
)))
(assert (forall ((a@@4 T@U) (b@@4 T@U) ) (! (let ((T@@8 (MultiSetTypeInv0 (type a@@4))))
 (=> (and (= (type a@@4) (MultiSetType T@@8)) (= (type b@@4) (MultiSetType T@@8))) (= (|MultiSet#Intersection| (|MultiSet#Intersection| a@@4 b@@4) b@@4) (|MultiSet#Intersection| a@@4 b@@4))))
 :qid |stdinbpl.528:18|
 :skolemid |70|
 :pattern ( (|MultiSet#Intersection| (|MultiSet#Intersection| a@@4 b@@4) b@@4))
)))
(assert (forall ((arg0@@43 T@U) ) (! (let ((T@@9 (type arg0@@43)))
(= (type (|Set#Singleton| arg0@@43)) (MapType2Type T@@9 boolType)))
 :qid |funType:Set#Singleton|
 :pattern ( (|Set#Singleton| arg0@@43))
)))
(assert (forall ((r T@U) (o T@U) ) (! (let ((T@@10 (type r)))
 (=> (= (type o) T@@10) (= (U_2_bool (MapType2Select (|Set#Singleton| r) o)) (= r o))))
 :qid |stdinbpl.391:18|
 :skolemid |27|
 :pattern ( (MapType2Select (|Set#Singleton| r) o))
)))
(assert (forall ((EG_1 T@U) (from_1 T@U) (to_1 T@U) ) (!  (=> (and (and (= (type EG_1) (MapType2Type EdgeDomainTypeType boolType)) (= (type from_1) (MapType2Type RefType boolType))) (= (type to_1) RefType)) (= (exists_spath EG_1 from_1 to_1) (exists ((f_7 T@U) ) (!  (and (= (type f_7) RefType) (and (U_2_bool (MapType2Select from_1 f_7)) (exists_path EG_1 f_7 to_1)))
 :qid |stdinbpl.707:55|
 :skolemid |99|
 :pattern ( (MapType2Select from_1 f_7))
 :pattern ( (exists_path EG_1 f_7 to_1))
))))
 :qid |stdinbpl.705:15|
 :skolemid |100|
 :pattern ( (exists_spath EG_1 from_1 to_1))
)))
(assert (forall ((a@@5 T@U) (b@@5 T@U) ) (! (let ((T@@11 (MapType2TypeInv0 (type a@@5))))
 (=> (and (= (type a@@5) (MapType2Type T@@11 boolType)) (= (type b@@5) (MapType2Type T@@11 boolType))) (= (+ (|Set#Card| (|Set#Union| a@@5 b@@5)) (|Set#Card| (|Set#Intersection| a@@5 b@@5))) (+ (|Set#Card| a@@5) (|Set#Card| b@@5)))))
 :qid |stdinbpl.430:18|
 :skolemid |42|
 :pattern ( (|Set#Card| (|Set#Union| a@@5 b@@5)))
 :pattern ( (|Set#Card| (|Set#Intersection| a@@5 b@@5)))
)))
(assert (forall ((arg0@@44 T@U) (arg1@@22 T@U) ) (! (= (type (inst_uReach arg0@@44 arg1@@22)) (MapType2Type RefType boolType))
 :qid |funType:inst_uReach|
 :pattern ( (inst_uReach arg0@@44 arg1@@22))
)))
(assert (forall ((EG_1@@0 T@U) (x_1 T@U) (v_2 T@U) ) (!  (=> (and (and (= (type EG_1@@0) (MapType2Type EdgeDomainTypeType boolType)) (= (type x_1) RefType)) (= (type v_2) RefType)) (= (U_2_bool (MapType2Select (inst_uReach EG_1@@0 x_1) v_2)) (exists_path EG_1@@0 x_1 v_2)))
 :qid |stdinbpl.651:15|
 :skolemid |88|
 :pattern ( (MapType2Select (inst_uReach EG_1@@0 x_1) v_2))
 :pattern ( (exists_path EG_1@@0 x_1 v_2))
)))
(assert (forall ((Heap@@6 T@U) (ExhaleHeap@@1 T@U) (Mask@@2 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@6) (MapType0Type RefType)) (= (type ExhaleHeap@@1) (MapType0Type RefType))) (= (type Mask@@2) (MapType1Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@6 ExhaleHeap@@1 Mask@@2)) (U_2_bool (MapType0Select Heap@@6 o_1 $allocated))) (U_2_bool (MapType0Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.73:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@6 ExhaleHeap@@1 Mask@@2) (MapType0Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert (forall ((arg0@@45 T@U) (arg1@@23 T@U) ) (! (= (type ($$ arg0@@45 arg1@@23)) (MapType2Type EdgeDomainTypeType boolType))
 :qid |funType:$$|
 :pattern ( ($$ arg0@@45 arg1@@23))
)))
(assert (forall ((Heap@@7 T@U) (refs@@0 T@U) ) (!  (=> (and (= (type Heap@@7) (MapType0Type RefType)) (= (type refs@@0) (MapType2Type RefType boolType))) (and (= ($$ Heap@@7 refs@@0) (|$$'| Heap@@7 refs@@0)) (dummyFunction (|$$#triggerStateless| refs@@0))))
 :qid |stdinbpl.750:15|
 :skolemid |104|
 :pattern ( ($$ Heap@@7 refs@@0))
)))
(assert (forall ((a@@6 Int) ) (!  (=> (<= 0 a@@6) (= (|Math#clip| a@@6) a@@6))
 :qid |stdinbpl.473:15|
 :skolemid |54|
 :pattern ( (|Math#clip| a@@6))
)))
(assert (forall ((EG_1@@1 T@U) (u_1 T@U) (v_2@@0 T@U) (w_1 T@U) ) (!  (=> (and (and (and (and (= (type EG_1@@1) (MapType2Type EdgeDomainTypeType boolType)) (= (type u_1) RefType)) (= (type v_2@@0) RefType)) (= (type w_1) RefType)) (and (exists_path_ EG_1@@1 u_1 w_1) (exists_path_ EG_1@@1 w_1 v_2@@0))) (exists_path_ EG_1@@1 u_1 v_2@@0))
 :qid |stdinbpl.672:15|
 :skolemid |92|
 :pattern ( (exists_path EG_1@@1 u_1 w_1) (exists_path EG_1@@1 w_1 v_2@@0))
)))
(assert (forall ((a@@7 T@U) (b@@6 T@U) (o@@0 T@U) ) (! (let ((T@@12 (type o@@0)))
 (=> (and (= (type a@@7) (MultiSetType T@@12)) (= (type b@@6) (MultiSetType T@@12))) (= (|MultiSet#Select| (|MultiSet#Intersection| a@@7 b@@6) o@@0) (|Math#min| (|MultiSet#Select| a@@7 o@@0) (|MultiSet#Select| b@@6 o@@0)))))
 :qid |stdinbpl.524:18|
 :skolemid |69|
 :pattern ( (|MultiSet#Select| (|MultiSet#Intersection| a@@7 b@@6) o@@0))
)))
(assert (forall ((EG_1@@2 T@U) (start_1 T@U) (end_1 T@U) ) (!  (=> (and (and (= (type EG_1@@2) (MapType2Type EdgeDomainTypeType boolType)) (= (type start_1) RefType)) (= (type end_1) RefType)) (= (exists_path_ EG_1@@2 start_1 end_1)  (or (= start_1 end_1) (exists ((w_1@@0 T@U) ) (!  (and (= (type w_1@@0) RefType) (and (edge EG_1@@2 start_1 w_1@@0) (exists_path_ EG_1@@2 w_1@@0 end_1)))
 :qid |stdinbpl.665:78|
 :skolemid |90|
 :pattern ( (edge EG_1@@2 start_1 w_1@@0))
 :pattern ( (exists_path_ EG_1@@2 w_1@@0 end_1))
)))))
 :qid |stdinbpl.663:15|
 :skolemid |91|
 :pattern ( (exists_path EG_1@@2 start_1 end_1))
 :pattern ( (edge EG_1@@2 start_1 end_1))
)))
(assert (forall ((Heap@@8 T@U) (ExhaleHeap@@2 T@U) (Mask@@3 T@U) (o_1@@0 T@U) (f_2 T@U) ) (! (let ((B@@1 (FieldTypeInv1 (type f_2))))
(let ((A@@1 (FieldTypeInv0 (type f_2))))
 (=> (and (and (and (and (and (and (= (type Heap@@8) (MapType0Type RefType)) (= (type ExhaleHeap@@2) (MapType0Type RefType))) (= (type Mask@@3) (MapType1Type RefType realType))) (= (type o_1@@0) RefType)) (= (type f_2) (FieldType A@@1 B@@1))) (IdenticalOnKnownLocations Heap@@8 ExhaleHeap@@2 Mask@@3)) (HasDirectPerm Mask@@3 o_1@@0 f_2)) (= (MapType0Select Heap@@8 o_1@@0 f_2) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2)))))
 :qid |stdinbpl.42:22|
 :skolemid |1|
 :pattern ( (IdenticalOnKnownLocations Heap@@8 ExhaleHeap@@2 Mask@@3) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2))
)))
(assert (forall ((EG_1@@3 T@U) (p_2 T@U) (s_1 T@U) ) (!  (=> (and (and (= (type EG_1@@3) (MapType2Type EdgeDomainTypeType boolType)) (= (type p_2) RefType)) (= (type s_1) RefType)) (= (edge_ EG_1@@3 p_2 s_1) (U_2_bool (MapType2Select EG_1@@3 (create_edge p_2 s_1)))))
 :qid |stdinbpl.633:15|
 :skolemid |84|
 :pattern ( (MapType2Select EG_1@@3 (create_edge p_2 s_1)))
 :pattern ( (edge EG_1@@3 p_2 s_1))
)))
(assert  (and (= (type dummyHeap) (MapType0Type RefType)) (= (type ZeroMask) (MapType1Type RefType realType))))
(assert (state dummyHeap ZeroMask))
(assert (forall ((arg0@@46 T@U) (arg1@@24 T@U) ) (! (let ((T@@13 (type arg1@@24)))
(= (type (|MultiSet#UnionOne| arg0@@46 arg1@@24)) (MultiSetType T@@13)))
 :qid |funType:MultiSet#UnionOne|
 :pattern ( (|MultiSet#UnionOne| arg0@@46 arg1@@24))
)))
(assert (forall ((a@@8 T@U) (x@@8 T@U) ) (! (let ((T@@14 (type x@@8)))
 (=> (= (type a@@8) (MultiSetType T@@14)) (= (|MultiSet#Card| (|MultiSet#UnionOne| a@@8 x@@8)) (+ (|MultiSet#Card| a@@8) 1))))
 :qid |stdinbpl.510:18|
 :skolemid |65|
 :pattern ( (|MultiSet#Card| (|MultiSet#UnionOne| a@@8 x@@8)))
 :pattern ( (|MultiSet#UnionOne| a@@8 x@@8) (|MultiSet#Card| a@@8))
)))
(assert (forall ((a@@9 T@U) (b@@7 T@U) ) (! (let ((T@@15 (MultiSetTypeInv0 (type a@@9))))
 (=> (and (= (type a@@9) (MultiSetType T@@15)) (= (type b@@7) (MultiSetType T@@15))) (= (|MultiSet#Disjoint| a@@9 b@@7) (forall ((o@@1 T@U) ) (!  (=> (= (type o@@1) T@@15) (or (= (|MultiSet#Select| a@@9 o@@1) 0) (= (|MultiSet#Select| b@@7 o@@1) 0)))
 :qid |stdinbpl.560:39|
 :skolemid |80|
 :pattern ( (|MultiSet#Select| a@@9 o@@1))
 :pattern ( (|MultiSet#Select| b@@7 o@@1))
)))))
 :qid |stdinbpl.559:18|
 :skolemid |81|
 :pattern ( (|MultiSet#Disjoint| a@@9 b@@7))
)))
(assert (forall ((p T@U) (v_1 T@U) (w T@U) ) (! (let ((A@@2 (FieldTypeInv0 (type p))))
 (=> (and (and (= (type p) (FieldType A@@2 FrameTypeType)) (= (type v_1) FrameTypeType)) (= (type w) FrameTypeType)) (not (InsidePredicate p v_1 p w))))
 :qid |stdinbpl.368:19|
 :skolemid |21|
 :pattern ( (InsidePredicate p v_1 p w))
)))
(assert (forall ((arg0@@47 T@U) ) (! (let ((T@@16 (type arg0@@47)))
(= (type (|MultiSet#Singleton| arg0@@47)) (MultiSetType T@@16)))
 :qid |funType:MultiSet#Singleton|
 :pattern ( (|MultiSet#Singleton| arg0@@47))
)))
(assert (forall ((r@@0 T@U) ) (!  (and (= (|MultiSet#Card| (|MultiSet#Singleton| r@@0)) 1) (= (|MultiSet#Select| (|MultiSet#Singleton| r@@0) r@@0) 1))
 :qid |stdinbpl.502:18|
 :skolemid |62|
 :pattern ( (|MultiSet#Singleton| r@@0))
)))
(assert  (not (IsPredicateField next)))
(assert  (not (IsWandField next)))
(assert (forall ((Heap@@9 T@U) (ExhaleHeap@@3 T@U) (Mask@@4 T@U) ) (!  (=> (and (and (and (= (type Heap@@9) (MapType0Type RefType)) (= (type ExhaleHeap@@3) (MapType0Type RefType))) (= (type Mask@@4) (MapType1Type RefType realType))) (IdenticalOnKnownLocations Heap@@9 ExhaleHeap@@3 Mask@@4)) (succHeap Heap@@9 ExhaleHeap@@3))
 :qid |stdinbpl.83:15|
 :skolemid |10|
 :pattern ( (IdenticalOnKnownLocations Heap@@9 ExhaleHeap@@3 Mask@@4))
)))
(assert (forall ((EG_1@@4 T@U) (U_1 T@U) (M_1 T@U) ) (!  (=> (and (and (and (and (= (type EG_1@@4) (MapType2Type EdgeDomainTypeType boolType)) (= (type U_1) (MapType2Type RefType boolType))) (= (type M_1) (MapType2Type RefType boolType))) (apply_noExit EG_1@@4 U_1 M_1)) (forall ((u_1@@0 T@U) (v_2@@1 T@U) ) (!  (=> (and (and (= (type u_1@@0) RefType) (= (type v_2@@1) RefType)) (and (U_2_bool (MapType2Select M_1 u_1@@0)) (and (U_2_bool (MapType2Select U_1 v_2@@1)) (not (U_2_bool (MapType2Select M_1 v_2@@1)))))) (not (edge EG_1@@4 u_1@@0 v_2@@1)))
 :qid |stdinbpl.641:52|
 :skolemid |85|
 :pattern ( (edge EG_1@@4 u_1@@0 v_2@@1))
 :pattern ( (MapType2Select M_1 u_1@@0) (MapType2Select M_1 v_2@@1))
))) (forall ((u_1_1 T@U) (v_1_1 T@U) ) (!  (=> (and (and (= (type u_1_1) RefType) (= (type v_1_1) RefType)) (and (U_2_bool (MapType2Select M_1 u_1_1)) (and (U_2_bool (MapType2Select U_1 v_1_1)) (not (U_2_bool (MapType2Select M_1 v_1_1)))))) (not (exists_path EG_1@@4 u_1_1 v_1_1)))
 :qid |stdinbpl.644:17|
 :skolemid |86|
 :pattern ( (exists_path EG_1@@4 u_1_1 v_1_1))
 :pattern ( (MapType2Select M_1 u_1_1) (MapType2Select M_1 v_1_1))
)))
 :qid |stdinbpl.639:15|
 :skolemid |87|
 :pattern ( (apply_noExit EG_1@@4 U_1 M_1))
)))
(assert (forall ((Heap@@10 T@U) (Mask@@5 T@U) (g@@3 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@10) (MapType0Type RefType)) (= (type Mask@@5) (MapType1Type RefType realType))) (= (type g@@3) (MapType2Type RefType boolType))) (and (state Heap@@10 Mask@@5) (< AssumeFunctionsAbove 2))) (and (not (U_2_bool (MapType2Select g@@3 null))) (forall ((n$0 T@U) ) (!  (=> (= (type n$0) RefType) (=> (and (U_2_bool (MapType2Select g@@3 n$0)) (not (= (MapType0Select Heap@@10 n$0 next) null))) (U_2_bool (MapType2Select g@@3 (MapType0Select Heap@@10 n$0 next)))))
 :qid |stdinbpl.1091:73|
 :skolemid |142|
 :pattern ( (MapType2Select g@@3 (MapType0Select Heap@@10 n$0 next)))
 :pattern ( (MapType2Select g@@3 n$0) (MapType0Select Heap@@10 n$0 next))
)))) (= (acyclic_list_segment Heap@@10 g@@3)  (and (acyclic_graph ($$ Heap@@10 g@@3)) (and (func_graph ($$ Heap@@10 g@@3)) (unshared_graph ($$ Heap@@10 g@@3))))))
 :qid |stdinbpl.1089:15|
 :skolemid |143|
 :pattern ( (state Heap@@10 Mask@@5) (acyclic_list_segment Heap@@10 g@@3))
)))
(assert (forall ((arg0@@48 T@U) ) (! (= (type (FrameFragment arg0@@48)) FrameTypeType)
 :qid |funType:FrameFragment|
 :pattern ( (FrameFragment arg0@@48))
)))
(assert (forall ((Heap@@11 T@U) (Mask@@6 T@U) (g@@4 T@U) (roots@@0 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@11) (MapType0Type RefType)) (= (type Mask@@6) (MapType1Type RefType realType))) (= (type g@@4) (MapType2Type RefType boolType))) (= (type roots@@0) (MapType2Type RefType boolType))) (state Heap@@11 Mask@@6)) (= (|is_global_sroot'| Heap@@11 g@@4 roots@@0) (|is_global_sroot#frame| (FrameFragment (int_2_U (|is_global_sroot#condqp2| Heap@@11 g@@4 roots@@0))) g@@4 roots@@0)))
 :qid |stdinbpl.901:15|
 :skolemid |123|
 :pattern ( (state Heap@@11 Mask@@6) (|is_global_sroot'| Heap@@11 g@@4 roots@@0))
)))
(assert (forall ((a@@10 T@U) (b@@8 T@U) ) (! (let ((T@@17 (MapType2TypeInv0 (type a@@10))))
 (=> (and (= (type a@@10) (MapType2Type T@@17 boolType)) (= (type b@@8) (MapType2Type T@@17 boolType))) (= (|Set#Equal| a@@10 b@@8) (forall ((o@@2 T@U) ) (!  (=> (= (type o@@2) T@@17) (= (U_2_bool (MapType2Select a@@10 o@@2)) (U_2_bool (MapType2Select b@@8 o@@2))))
 :qid |stdinbpl.455:31|
 :skolemid |48|
 :pattern ( (MapType2Select a@@10 o@@2))
 :pattern ( (MapType2Select b@@8 o@@2))
)))))
 :qid |stdinbpl.454:17|
 :skolemid |49|
 :pattern ( (|Set#Equal| a@@10 b@@8))
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
(assert (forall ((a@@11 T@U) (b@@9 T@U) ) (! (let ((T@@18 (MultiSetTypeInv0 (type a@@11))))
 (=> (and (= (type a@@11) (MultiSetType T@@18)) (= (type b@@9) (MultiSetType T@@18))) (= (|MultiSet#Card| (|MultiSet#Union| a@@11 b@@9)) (+ (|MultiSet#Card| a@@11) (|MultiSet#Card| b@@9)))))
 :qid |stdinbpl.520:18|
 :skolemid |68|
 :pattern ( (|MultiSet#Card| (|MultiSet#Union| a@@11 b@@9)))
 :pattern ( (|MultiSet#Card| a@@11) (|MultiSet#Union| a@@11 b@@9))
 :pattern ( (|MultiSet#Card| b@@9) (|MultiSet#Union| a@@11 b@@9))
)))
(assert  (and (forall ((arg0@@49 Real) (arg1@@25 T@U) ) (! (= (type (ConditionalFrame arg0@@49 arg1@@25)) FrameTypeType)
 :qid |funType:ConditionalFrame|
 :pattern ( (ConditionalFrame arg0@@49 arg1@@25))
)) (= (type EmptyFrame) FrameTypeType)))
(assert (forall ((p@@0 Real) (f_6 T@U) ) (!  (=> (= (type f_6) FrameTypeType) (= (ConditionalFrame p@@0 f_6) (ite (> p@@0 0.0) f_6 EmptyFrame)))
 :qid |stdinbpl.356:15|
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
(assert (forall ((p_2@@0 T@U) (s_1@@0 T@U) ) (!  (=> (and (= (type p_2@@0) RefType) (= (type s_1@@0) RefType)) (and (= (edge_pred (create_edge p_2@@0 s_1@@0)) p_2@@0) (= (edge_succ (create_edge p_2@@0 s_1@@0)) s_1@@0)))
 :qid |stdinbpl.584:15|
 :skolemid |82|
 :pattern ( (create_edge p_2@@0 s_1@@0))
)))
(assert (forall ((o_2@@1 T@U) (f_4@@1 T@U) ) (! (let ((B@@4 (FieldTypeInv1 (type f_4@@1))))
(let ((A@@5 (FieldTypeInv0 (type f_4@@1))))
 (=> (and (= (type o_2@@1) RefType) (= (type f_4@@1) (FieldType A@@5 B@@4))) (= (U_2_real (MapType1Select ZeroMask o_2@@1 f_4@@1)) NoPerm))))
 :qid |stdinbpl.106:22|
 :skolemid |13|
 :pattern ( (MapType1Select ZeroMask o_2@@1 f_4@@1))
)))
(assert (forall ((Heap@@12 T@U) (Mask@@8 T@U) (refs@@1 T@U) ) (!  (=> (and (and (and (= (type Heap@@12) (MapType0Type RefType)) (= (type Mask@@8) (MapType1Type RefType realType))) (= (type refs@@1) (MapType2Type RefType boolType))) (and (state Heap@@12 Mask@@8) (or (< AssumeFunctionsAbove 3) (|$$#trigger| (FrameFragment (int_2_U (|$$#condqp1| Heap@@12 refs@@1))) refs@@1)))) (forall ((p_2@@1 T@U) (s_1@@1 T@U) ) (!  (=> (and (= (type p_2@@1) RefType) (= (type s_1@@1) RefType)) (=  (and (U_2_bool (MapType2Select refs@@1 p_2@@1)) (and (U_2_bool (MapType2Select refs@@1 s_1@@1)) (= (MapType0Select Heap@@12 p_2@@1 next) s_1@@1))) (U_2_bool (MapType2Select (|$$'| Heap@@12 refs@@1) (create_edge p_2@@1 s_1@@1)))))
 :qid |stdinbpl.779:122|
 :skolemid |108|
 :pattern ( (create_edge p_2@@1 s_1@@1))
)))
 :qid |stdinbpl.777:15|
 :skolemid |109|
 :pattern ( (state Heap@@12 Mask@@8) (|$$'| Heap@@12 refs@@1))
)))
(assert (forall ((a@@12 T@U) (b@@10 T@U) (o@@3 T@U) ) (! (let ((T@@19 (type o@@3)))
 (=> (and (= (type a@@12) (MapType2Type T@@19 boolType)) (= (type b@@10) (MapType2Type T@@19 boolType))) (= (U_2_bool (MapType2Select (|Set#Intersection| a@@12 b@@10) o@@3))  (and (U_2_bool (MapType2Select a@@12 o@@3)) (U_2_bool (MapType2Select b@@10 o@@3))))))
 :qid |stdinbpl.419:18|
 :skolemid |37|
 :pattern ( (MapType2Select (|Set#Intersection| a@@12 b@@10) o@@3))
 :pattern ( (|Set#Intersection| a@@12 b@@10) (MapType2Select a@@12 o@@3))
 :pattern ( (|Set#Intersection| a@@12 b@@10) (MapType2Select b@@10 o@@3))
)))
(assert (forall ((arg0@@50 T@U) (arg1@@26 T@U) ) (! (let ((T@@20 (MapType2TypeInv0 (type arg0@@50))))
(= (type (|Set#Difference| arg0@@50 arg1@@26)) (MapType2Type T@@20 boolType)))
 :qid |funType:Set#Difference|
 :pattern ( (|Set#Difference| arg0@@50 arg1@@26))
)))
(assert (forall ((a@@13 T@U) (b@@11 T@U) (o@@4 T@U) ) (! (let ((T@@21 (type o@@4)))
 (=> (and (= (type a@@13) (MapType2Type T@@21 boolType)) (= (type b@@11) (MapType2Type T@@21 boolType))) (= (U_2_bool (MapType2Select (|Set#Difference| a@@13 b@@11) o@@4))  (and (U_2_bool (MapType2Select a@@13 o@@4)) (not (U_2_bool (MapType2Select b@@11 o@@4)))))))
 :qid |stdinbpl.434:18|
 :skolemid |43|
 :pattern ( (MapType2Select (|Set#Difference| a@@13 b@@11) o@@4))
 :pattern ( (|Set#Difference| a@@13 b@@11) (MapType2Select a@@13 o@@4))
)))
(assert (forall ((EG_1@@5 T@U) (p_2@@2 T@U) (s_1@@2 T@U) ) (!  (=> (and (and (= (type EG_1@@5) (MapType2Type EdgeDomainTypeType boolType)) (= (type p_2@@2) RefType)) (= (type s_1@@2) RefType)) (= (edge EG_1@@5 p_2@@2 s_1@@2) (edge_ EG_1@@5 p_2@@2 s_1@@2)))
 :qid |stdinbpl.627:15|
 :skolemid |83|
 :pattern ( (edge EG_1@@5 p_2@@2 s_1@@2))
)))
(assert (forall ((EG_1@@6 T@U) (start_1@@0 T@U) (end_1@@0 T@U) ) (!  (=> (and (and (= (type EG_1@@6) (MapType2Type EdgeDomainTypeType boolType)) (= (type start_1@@0) RefType)) (= (type end_1@@0) RefType)) (= (exists_path EG_1@@6 start_1@@0 end_1@@0) (exists_path_ EG_1@@6 start_1@@0 end_1@@0)))
 :qid |stdinbpl.657:15|
 :skolemid |89|
 :pattern ( (exists_path EG_1@@6 start_1@@0 end_1@@0))
)))
(assert (forall ((a@@14 T@U) (b@@12 T@U) ) (! (let ((T@@22 (MapType2TypeInv0 (type a@@14))))
 (=> (and (and (= (type a@@14) (MapType2Type T@@22 boolType)) (= (type b@@12) (MapType2Type T@@22 boolType))) (|Set#Equal| a@@14 b@@12)) (= a@@14 b@@12)))
 :qid |stdinbpl.456:17|
 :skolemid |50|
 :pattern ( (|Set#Equal| a@@14 b@@12))
)))
(assert (forall ((a@@15 T@U) (b@@13 T@U) ) (! (let ((T@@23 (MultiSetTypeInv0 (type a@@15))))
 (=> (and (and (= (type a@@15) (MultiSetType T@@23)) (= (type b@@13) (MultiSetType T@@23))) (|MultiSet#Equal| a@@15 b@@13)) (= a@@15 b@@13)))
 :qid |stdinbpl.555:17|
 :skolemid |79|
 :pattern ( (|MultiSet#Equal| a@@15 b@@13))
)))
(assert (forall ((T@@24 T@T) ) (! (= (type (|Set#Empty| T@@24)) (MapType2Type T@@24 boolType))
 :qid |funType:Set#Empty|
 :pattern ( (|Set#Empty| T@@24))
)))
(assert (forall ((g0@@0 T@U) (g1@@0 T@U) ) (!  (=> (and (and (= (type g0@@0) (MapType2Type RefType boolType)) (= (type g1@@0) (MapType2Type RefType boolType))) (|Set#Equal| (|Set#Intersection| g0@@0 g1@@0) (|Set#Empty| RefType))) (forall ((r_1 T@U) ) (!  (=> (= (type r_1) RefType) (=> (and (U_2_bool (MapType2Select g0@@0 r_1)) (U_2_bool (MapType2Select g1@@0 r_1))) (U_2_bool (MapType2Select (|Set#Empty| RefType) r_1))))
 :qid |stdinbpl.723:75|
 :skolemid |101|
 :pattern ( (MapType2Select g0@@0 r_1) (MapType2Select g1@@0 r_1))
)))
 :qid |stdinbpl.721:15|
 :skolemid |102|
 :pattern ( (|Set#Intersection| g0@@0 g1@@0))
)))
(assert (forall ((arg0@@51 T@U) (arg1@@27 T@U) ) (! (let ((T@@25 (type arg1@@27)))
(= (type (|Set#UnionOne| arg0@@51 arg1@@27)) (MapType2Type T@@25 boolType)))
 :qid |funType:Set#UnionOne|
 :pattern ( (|Set#UnionOne| arg0@@51 arg1@@27))
)))
(assert (forall ((a@@16 T@U) (x@@9 T@U) (y@@2 T@U) ) (! (let ((T@@26 (type x@@9)))
 (=> (and (and (= (type a@@16) (MapType2Type T@@26 boolType)) (= (type y@@2) T@@26)) (U_2_bool (MapType2Select a@@16 y@@2))) (U_2_bool (MapType2Select (|Set#UnionOne| a@@16 x@@9) y@@2))))
 :qid |stdinbpl.399:18|
 :skolemid |31|
 :pattern ( (|Set#UnionOne| a@@16 x@@9) (MapType2Select a@@16 y@@2))
)))
(assert (forall ((a@@17 T@U) (b@@14 T@U) (y@@3 T@U) ) (! (let ((T@@27 (type y@@3)))
 (=> (and (and (= (type a@@17) (MapType2Type T@@27 boolType)) (= (type b@@14) (MapType2Type T@@27 boolType))) (U_2_bool (MapType2Select a@@17 y@@3))) (U_2_bool (MapType2Select (|Set#Union| a@@17 b@@14) y@@3))))
 :qid |stdinbpl.409:18|
 :skolemid |35|
 :pattern ( (|Set#Union| a@@17 b@@14) (MapType2Select a@@17 y@@3))
)))
(assert (forall ((a@@18 T@U) (b@@15 T@U) (y@@4 T@U) ) (! (let ((T@@28 (type y@@4)))
 (=> (and (and (= (type a@@18) (MapType2Type T@@28 boolType)) (= (type b@@15) (MapType2Type T@@28 boolType))) (U_2_bool (MapType2Select b@@15 y@@4))) (U_2_bool (MapType2Select (|Set#Union| a@@18 b@@15) y@@4))))
 :qid |stdinbpl.411:18|
 :skolemid |36|
 :pattern ( (|Set#Union| a@@18 b@@15) (MapType2Select b@@15 y@@4))
)))
(assert (forall ((ms T@U) (x@@10 T@U) ) (! (let ((T@@29 (type x@@10)))
 (=> (= (type ms) (MultiSetType T@@29)) (>= (|MultiSet#Select| ms x@@10) 0)))
 :qid |stdinbpl.486:18|
 :skolemid |56|
 :pattern ( (|MultiSet#Select| ms x@@10))
)))
(assert (forall ((a@@19 T@U) (x@@11 T@U) (o@@5 T@U) ) (! (let ((T@@30 (type x@@11)))
 (=> (and (= (type a@@19) (MapType2Type T@@30 boolType)) (= (type o@@5) T@@30)) (= (U_2_bool (MapType2Select (|Set#UnionOne| a@@19 x@@11) o@@5))  (or (= o@@5 x@@11) (U_2_bool (MapType2Select a@@19 o@@5))))))
 :qid |stdinbpl.395:18|
 :skolemid |29|
 :pattern ( (MapType2Select (|Set#UnionOne| a@@19 x@@11) o@@5))
)))
(assert  (and (forall ((arg0@@52 T@U) (arg1@@28 T@U) ) (! (= (type (CombineFrames arg0@@52 arg1@@28)) FrameTypeType)
 :qid |funType:CombineFrames|
 :pattern ( (CombineFrames arg0@@52 arg1@@28))
)) (forall ((arg0@@53 T@U) (arg1@@29 T@U) ) (! (= (type (|$$#frame| arg0@@53 arg1@@29)) (MapType2Type EdgeDomainTypeType boolType))
 :qid |funType:$$#frame|
 :pattern ( (|$$#frame| arg0@@53 arg1@@29))
))))
(assert (forall ((Heap@@13 T@U) (Mask@@9 T@U) (g0@@1 T@U) (g1@@1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@13) (MapType0Type RefType)) (= (type Mask@@9) (MapType1Type RefType realType))) (= (type g0@@1) (MapType2Type RefType boolType))) (= (type g1@@1) (MapType2Type RefType boolType))) (and (state Heap@@13 Mask@@9) (or (< AssumeFunctionsAbove 0) (|apply_TCFraming#trigger| (CombineFrames (FrameFragment (int_2_U (|apply_TCFraming#condqp4| Heap@@13 g0@@1 g1@@1))) (FrameFragment (int_2_U (|apply_TCFraming#condqp5| Heap@@13 g0@@1 g1@@1)))) g0@@1 g1@@1)))) (and (and (and (not (U_2_bool (MapType2Select g0@@1 null))) (forall ((n$0@@0 T@U) ) (!  (=> (= (type n$0@@0) RefType) (=> (and (U_2_bool (MapType2Select g0@@1 n$0@@0)) (not (= (MapType0Select Heap@@13 n$0@@0 next) null))) (U_2_bool (MapType2Select g0@@1 (MapType0Select Heap@@13 n$0@@0 next)))))
 :qid |stdinbpl.1431:236|
 :skolemid |182|
 :pattern ( (MapType2Select g0@@1 (MapType0Select Heap@@13 n$0@@0 next)))
 :pattern ( (MapType2Select g0@@1 n$0@@0) (MapType0Select Heap@@13 n$0@@0 next))
))) (and (not (U_2_bool (MapType2Select g1@@1 null))) (forall ((n$2 T@U) ) (!  (=> (= (type n$2) RefType) (=> (and (U_2_bool (MapType2Select g1@@1 n$2)) (not (= (MapType0Select Heap@@13 n$2 next) null))) (U_2_bool (MapType2Select g1@@1 (MapType0Select Heap@@13 n$2 next)))))
 :qid |stdinbpl.1434:31|
 :skolemid |183|
 :pattern ( (MapType2Select g1@@1 (MapType0Select Heap@@13 n$2 next)))
 :pattern ( (MapType2Select g1@@1 n$2) (MapType0Select Heap@@13 n$2 next))
)))) (|Set#Equal| (|Set#Intersection| g1@@1 g0@@1) (|Set#Empty| RefType)))) (forall ((u_1@@1 T@U) (v_2@@2 T@U) ) (!  (=> (and (and (= (type u_1@@1) RefType) (= (type v_2@@2) RefType)) (and (U_2_bool (MapType2Select g0@@1 u_1@@1)) (U_2_bool (MapType2Select g0@@1 v_2@@2)))) (= (exists_path ($$ Heap@@13 g0@@1) u_1@@1 v_2@@2) (exists_path ($$ Heap@@13 (|Set#Union| g0@@1 g1@@1)) u_1@@1 v_2@@2)))
 :qid |stdinbpl.1437:82|
 :skolemid |184|
 :pattern ( (MapType2Select g0@@1 u_1@@1) (MapType2Select g0@@1 v_2@@2))
 :pattern ( (MapType2Select g0@@1 u_1@@1) (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| Heap@@13 g0@@1))) g0@@1) u_1@@1 v_2@@2))
 :pattern ( (MapType2Select g0@@1 u_1@@1) (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| Heap@@13 (|Set#Union| g0@@1 g1@@1)))) (|Set#Union| g0@@1 g1@@1)) u_1@@1 v_2@@2))
 :pattern ( (MapType2Select g0@@1 v_2@@2) (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| Heap@@13 g0@@1))) g0@@1) u_1@@1 v_2@@2))
 :pattern ( (MapType2Select g0@@1 v_2@@2) (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| Heap@@13 (|Set#Union| g0@@1 g1@@1)))) (|Set#Union| g0@@1 g1@@1)) u_1@@1 v_2@@2))
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| Heap@@13 g0@@1))) g0@@1) u_1@@1 v_2@@2))
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| Heap@@13 (|Set#Union| g0@@1 g1@@1)))) (|Set#Union| g0@@1 g1@@1)) u_1@@1 v_2@@2))
)))
 :qid |stdinbpl.1429:15|
 :skolemid |185|
 :pattern ( (state Heap@@13 Mask@@9) (|apply_TCFraming'| Heap@@13 g0@@1 g1@@1))
)))
(assert (forall ((Heap@@14 T@U) (Mask@@10 T@U) (g0@@2 T@U) (g1@@2 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@14) (MapType0Type RefType)) (= (type Mask@@10) (MapType1Type RefType realType))) (= (type g0@@2) (MapType2Type RefType boolType))) (= (type g1@@2) (MapType2Type RefType boolType))) (and (state Heap@@14 Mask@@10) (or (< AssumeFunctionsAbove 0) (|apply_TCFraming#trigger| (CombineFrames (FrameFragment (int_2_U (|apply_TCFraming#condqp4| Heap@@14 g0@@2 g1@@2))) (FrameFragment (int_2_U (|apply_TCFraming#condqp5| Heap@@14 g0@@2 g1@@2)))) g0@@2 g1@@2)))) (and (and (and (not (U_2_bool (MapType2Select g0@@2 null))) (forall ((n$0@@1 T@U) ) (!  (=> (= (type n$0@@1) RefType) (=> (and (U_2_bool (MapType2Select g0@@2 n$0@@1)) (not (= (MapType0Select Heap@@14 n$0@@1 next) null))) (U_2_bool (MapType2Select g0@@2 (MapType0Select Heap@@14 n$0@@1 next)))))
 :qid |stdinbpl.1444:236|
 :skolemid |186|
 :pattern ( (MapType2Select g0@@2 (MapType0Select Heap@@14 n$0@@1 next)))
 :pattern ( (MapType2Select g0@@2 n$0@@1) (MapType0Select Heap@@14 n$0@@1 next))
))) (and (not (U_2_bool (MapType2Select g1@@2 null))) (forall ((n$2@@0 T@U) ) (!  (=> (= (type n$2@@0) RefType) (=> (and (U_2_bool (MapType2Select g1@@2 n$2@@0)) (not (= (MapType0Select Heap@@14 n$2@@0 next) null))) (U_2_bool (MapType2Select g1@@2 (MapType0Select Heap@@14 n$2@@0 next)))))
 :qid |stdinbpl.1447:31|
 :skolemid |187|
 :pattern ( (MapType2Select g1@@2 (MapType0Select Heap@@14 n$2@@0 next)))
 :pattern ( (MapType2Select g1@@2 n$2@@0) (MapType0Select Heap@@14 n$2@@0 next))
)))) (|Set#Equal| (|Set#Intersection| g1@@2 g0@@2) (|Set#Empty| RefType)))) (forall ((u_1_1@@0 T@U) (v_1_1@@0 T@U) ) (!  (=> (and (and (= (type u_1_1@@0) RefType) (= (type v_1_1@@0) RefType)) (and (U_2_bool (MapType2Select g1@@2 u_1_1@@0)) (U_2_bool (MapType2Select g1@@2 v_1_1@@0)))) (= (exists_path ($$ Heap@@14 g1@@2) u_1_1@@0 v_1_1@@0) (exists_path ($$ Heap@@14 (|Set#Union| g1@@2 g0@@2)) u_1_1@@0 v_1_1@@0)))
 :qid |stdinbpl.1450:82|
 :skolemid |188|
 :pattern ( (MapType2Select g1@@2 u_1_1@@0) (MapType2Select g1@@2 v_1_1@@0))
 :pattern ( (MapType2Select g1@@2 u_1_1@@0) (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| Heap@@14 g1@@2))) g1@@2) u_1_1@@0 v_1_1@@0))
 :pattern ( (MapType2Select g1@@2 u_1_1@@0) (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| Heap@@14 (|Set#Union| g1@@2 g0@@2)))) (|Set#Union| g1@@2 g0@@2)) u_1_1@@0 v_1_1@@0))
 :pattern ( (MapType2Select g1@@2 v_1_1@@0) (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| Heap@@14 g1@@2))) g1@@2) u_1_1@@0 v_1_1@@0))
 :pattern ( (MapType2Select g1@@2 v_1_1@@0) (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| Heap@@14 (|Set#Union| g1@@2 g0@@2)))) (|Set#Union| g1@@2 g0@@2)) u_1_1@@0 v_1_1@@0))
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| Heap@@14 g1@@2))) g1@@2) u_1_1@@0 v_1_1@@0))
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| Heap@@14 (|Set#Union| g1@@2 g0@@2)))) (|Set#Union| g1@@2 g0@@2)) u_1_1@@0 v_1_1@@0))
)))
 :qid |stdinbpl.1442:15|
 :skolemid |189|
 :pattern ( (state Heap@@14 Mask@@10) (|apply_TCFraming'| Heap@@14 g0@@2 g1@@2))
)))
(assert (forall ((a@@20 T@U) (b@@16 T@U) (y@@5 T@U) ) (! (let ((T@@31 (type y@@5)))
 (=> (and (and (= (type a@@20) (MapType2Type T@@31 boolType)) (= (type b@@16) (MapType2Type T@@31 boolType))) (U_2_bool (MapType2Select b@@16 y@@5))) (not (U_2_bool (MapType2Select (|Set#Difference| a@@20 b@@16) y@@5)))))
 :qid |stdinbpl.436:18|
 :skolemid |44|
 :pattern ( (|Set#Difference| a@@20 b@@16) (MapType2Select b@@16 y@@5))
)))
(assert (forall ((arg0@@54 Int) (arg1@@30 Int) ) (! (= (type (|sk_$$#condqp1| arg0@@54 arg1@@30)) RefType)
 :qid |funType:sk_$$#condqp1|
 :pattern ( (|sk_$$#condqp1| arg0@@54 arg1@@30))
)))
(assert (forall ((Heap2Heap@@0 T@U) (Heap1Heap@@0 T@U) (refs@@2 T@U) ) (!  (=> (and (and (and (= (type Heap2Heap@@0) (MapType0Type RefType)) (= (type Heap1Heap@@0) (MapType0Type RefType))) (= (type refs@@2) (MapType2Type RefType boolType))) (and (=  (and (U_2_bool (MapType2Select refs@@2 (|sk_$$#condqp1| (|$$#condqp1| Heap2Heap@@0 refs@@2) (|$$#condqp1| Heap1Heap@@0 refs@@2)))) (< NoPerm (/ (to_real 1) (to_real 2))))  (and (U_2_bool (MapType2Select refs@@2 (|sk_$$#condqp1| (|$$#condqp1| Heap2Heap@@0 refs@@2) (|$$#condqp1| Heap1Heap@@0 refs@@2)))) (< NoPerm (/ (to_real 1) (to_real 2))))) (=> (and (U_2_bool (MapType2Select refs@@2 (|sk_$$#condqp1| (|$$#condqp1| Heap2Heap@@0 refs@@2) (|$$#condqp1| Heap1Heap@@0 refs@@2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (= (MapType0Select Heap2Heap@@0 (|sk_$$#condqp1| (|$$#condqp1| Heap2Heap@@0 refs@@2) (|$$#condqp1| Heap1Heap@@0 refs@@2)) next) (MapType0Select Heap1Heap@@0 (|sk_$$#condqp1| (|$$#condqp1| Heap2Heap@@0 refs@@2) (|$$#condqp1| Heap1Heap@@0 refs@@2)) next))))) (= (|$$#condqp1| Heap2Heap@@0 refs@@2) (|$$#condqp1| Heap1Heap@@0 refs@@2)))
 :qid |stdinbpl.771:15|
 :skolemid |107|
 :pattern ( (|$$#condqp1| Heap2Heap@@0 refs@@2) (|$$#condqp1| Heap1Heap@@0 refs@@2) (succHeapTrans Heap2Heap@@0 Heap1Heap@@0))
)))
(assert (forall ((a@@21 T@U) (b@@17 T@U) ) (! (let ((T@@32 (MapType2TypeInv0 (type a@@21))))
 (=> (and (= (type a@@21) (MapType2Type T@@32 boolType)) (= (type b@@17) (MapType2Type T@@32 boolType))) (and (= (+ (+ (|Set#Card| (|Set#Difference| a@@21 b@@17)) (|Set#Card| (|Set#Difference| b@@17 a@@21))) (|Set#Card| (|Set#Intersection| a@@21 b@@17))) (|Set#Card| (|Set#Union| a@@21 b@@17))) (= (|Set#Card| (|Set#Difference| a@@21 b@@17)) (- (|Set#Card| a@@21) (|Set#Card| (|Set#Intersection| a@@21 b@@17)))))))
 :qid |stdinbpl.438:18|
 :skolemid |45|
 :pattern ( (|Set#Card| (|Set#Difference| a@@21 b@@17)))
)))
(assert (forall ((s T@U) ) (! (let ((T@@33 (MapType2TypeInv0 (type s))))
 (=> (= (type s) (MapType2Type T@@33 boolType)) (<= 0 (|Set#Card| s))))
 :qid |stdinbpl.381:18|
 :skolemid |22|
 :pattern ( (|Set#Card| s))
)))
(assert (forall ((s@@0 T@U) ) (! (let ((T@@34 (MultiSetTypeInv0 (type s@@0))))
 (=> (= (type s@@0) (MultiSetType T@@34)) (<= 0 (|MultiSet#Card| s@@0))))
 :qid |stdinbpl.489:18|
 :skolemid |57|
 :pattern ( (|MultiSet#Card| s@@0))
)))
(assert (forall ((Heap@@15 T@U) (g@@5 T@U) ) (!  (=> (and (= (type Heap@@15) (MapType0Type RefType)) (= (type g@@5) (MapType2Type RefType boolType))) (and (= (acyclic_list_segment Heap@@15 g@@5) (|acyclic_list_segment'| Heap@@15 g@@5)) (dummyFunction (bool_2_U (|acyclic_list_segment#triggerStateless| g@@5)))))
 :qid |stdinbpl.1079:15|
 :skolemid |140|
 :pattern ( (acyclic_list_segment Heap@@15 g@@5))
)))
(assert (forall ((T@@35 T@T) ) (! (= (type (|MultiSet#Empty| T@@35)) (MultiSetType T@@35))
 :qid |funType:MultiSet#Empty|
 :pattern ( (|MultiSet#Empty| T@@35))
)))
(assert (forall ((o@@6 T@U) ) (! (let ((T@@36 (type o@@6)))
(= (|MultiSet#Select| (|MultiSet#Empty| T@@36) o@@6) 0))
 :qid |stdinbpl.494:18|
 :skolemid |58|
 :pattern ( (let ((T@@36 (type o@@6)))
(|MultiSet#Select| (|MultiSet#Empty| T@@36) o@@6)))
)))
(assert (forall ((a@@22 T@U) (x@@12 T@U) ) (! (let ((T@@37 (type x@@12)))
 (=> (= (type a@@22) (MapType2Type T@@37 boolType)) (U_2_bool (MapType2Select (|Set#UnionOne| a@@22 x@@12) x@@12))))
 :qid |stdinbpl.397:18|
 :skolemid |30|
 :pattern ( (|Set#UnionOne| a@@22 x@@12))
)))
(assert (forall ((EG_1@@7 T@U) ) (!  (=> (= (type EG_1@@7) (MapType2Type EdgeDomainTypeType boolType)) (= (unshared_graph EG_1@@7) (forall ((v1 T@U) (v2 T@U) (v_2@@3 T@U) ) (!  (=> (and (and (and (= (type v1) RefType) (= (type v2) RefType)) (= (type v_2@@3) RefType)) (and (edge EG_1@@7 v1 v_2@@3) (edge EG_1@@7 v2 v_2@@3))) (= v1 v2))
 :qid |stdinbpl.689:43|
 :skolemid |95|
 :pattern ( (edge EG_1@@7 v1 v_2@@3) (edge EG_1@@7 v2 v_2@@3))
))))
 :qid |stdinbpl.687:15|
 :skolemid |96|
 :pattern ( (unshared_graph EG_1@@7))
)))
(assert (forall ((EG_1@@8 T@U) ) (!  (=> (= (type EG_1@@8) (MapType2Type EdgeDomainTypeType boolType)) (= (func_graph EG_1@@8) (forall ((v1@@0 T@U) (v2@@0 T@U) (v_2@@4 T@U) ) (!  (=> (and (and (and (= (type v1@@0) RefType) (= (type v2@@0) RefType)) (= (type v_2@@4) RefType)) (and (edge EG_1@@8 v_2@@4 v1@@0) (edge EG_1@@8 v_2@@4 v2@@0))) (= v1@@0 v2@@0))
 :qid |stdinbpl.698:39|
 :skolemid |97|
 :pattern ( (edge EG_1@@8 v_2@@4 v1@@0) (edge EG_1@@8 v_2@@4 v2@@0))
))))
 :qid |stdinbpl.696:15|
 :skolemid |98|
 :pattern ( (func_graph EG_1@@8))
)))
(assert (forall ((Heap@@16 T@U) (ExhaleHeap@@4 T@U) (Mask@@11 T@U) (pm_f@@1 T@U) ) (! (let ((C@@1 (FieldTypeInv0 (type pm_f@@1))))
 (=> (and (and (and (and (and (= (type Heap@@16) (MapType0Type RefType)) (= (type ExhaleHeap@@4) (MapType0Type RefType))) (= (type Mask@@11) (MapType1Type RefType realType))) (= (type pm_f@@1) (FieldType C@@1 FrameTypeType))) (IdenticalOnKnownLocations Heap@@16 ExhaleHeap@@4 Mask@@11)) (and (HasDirectPerm Mask@@11 null pm_f@@1) (IsPredicateField pm_f@@1))) (forall ((o2 T@U) (f_2@@0 T@U) ) (! (let ((B@@5 (FieldTypeInv1 (type f_2@@0))))
(let ((A@@6 (FieldTypeInv0 (type f_2@@0))))
 (=> (and (and (= (type o2) RefType) (= (type f_2@@0) (FieldType A@@6 B@@5))) (U_2_bool (MapType1Select (MapType0Select Heap@@16 null (PredicateMaskField pm_f@@1)) o2 f_2@@0))) (= (MapType0Select Heap@@16 o2 f_2@@0) (MapType0Select ExhaleHeap@@4 o2 f_2@@0)))))
 :qid |stdinbpl.54:134|
 :skolemid |3|
 :pattern ( (MapType0Select ExhaleHeap@@4 o2 f_2@@0))
))))
 :qid |stdinbpl.52:19|
 :skolemid |4|
 :pattern ( (IdenticalOnKnownLocations Heap@@16 ExhaleHeap@@4 Mask@@11) (IsPredicateField pm_f@@1))
)))
(assert (forall ((Heap@@17 T@U) (ExhaleHeap@@5 T@U) (Mask@@12 T@U) (pm_f@@2 T@U) ) (! (let ((C@@2 (FieldTypeInv0 (type pm_f@@2))))
 (=> (and (and (and (and (and (= (type Heap@@17) (MapType0Type RefType)) (= (type ExhaleHeap@@5) (MapType0Type RefType))) (= (type Mask@@12) (MapType1Type RefType realType))) (= (type pm_f@@2) (FieldType C@@2 FrameTypeType))) (IdenticalOnKnownLocations Heap@@17 ExhaleHeap@@5 Mask@@12)) (and (HasDirectPerm Mask@@12 null pm_f@@2) (IsWandField pm_f@@2))) (forall ((o2@@0 T@U) (f_2@@1 T@U) ) (! (let ((B@@6 (FieldTypeInv1 (type f_2@@1))))
(let ((A@@7 (FieldTypeInv0 (type f_2@@1))))
 (=> (and (and (= (type o2@@0) RefType) (= (type f_2@@1) (FieldType A@@7 B@@6))) (U_2_bool (MapType1Select (MapType0Select Heap@@17 null (WandMaskField pm_f@@2)) o2@@0 f_2@@1))) (= (MapType0Select Heap@@17 o2@@0 f_2@@1) (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1)))))
 :qid |stdinbpl.67:129|
 :skolemid |6|
 :pattern ( (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1))
))))
 :qid |stdinbpl.65:19|
 :skolemid |7|
 :pattern ( (IdenticalOnKnownLocations Heap@@17 ExhaleHeap@@5 Mask@@12) (IsWandField pm_f@@2))
)))
(assert (forall ((a@@23 T@U) (x@@13 T@U) ) (! (let ((T@@38 (type x@@13)))
 (=> (and (= (type a@@23) (MapType2Type T@@38 boolType)) (U_2_bool (MapType2Select a@@23 x@@13))) (= (|Set#Card| (|Set#UnionOne| a@@23 x@@13)) (|Set#Card| a@@23))))
 :qid |stdinbpl.401:18|
 :skolemid |32|
 :pattern ( (|Set#Card| (|Set#UnionOne| a@@23 x@@13)))
)))
(assert (forall ((a@@24 T@U) (x@@14 T@U) ) (! (let ((T@@39 (type x@@14)))
 (=> (= (type a@@24) (MultiSetType T@@39)) (and (> (|MultiSet#Select| (|MultiSet#UnionOne| a@@24 x@@14) x@@14) 0) (> (|MultiSet#Card| (|MultiSet#UnionOne| a@@24 x@@14)) 0))))
 :qid |stdinbpl.513:18|
 :skolemid |66|
 :pattern ( (|MultiSet#UnionOne| a@@24 x@@14))
)))
(assert (forall ((r@@1 T@U) ) (! (= (|Set#Card| (|Set#Singleton| r@@1)) 1)
 :qid |stdinbpl.392:18|
 :skolemid |28|
 :pattern ( (|Set#Card| (|Set#Singleton| r@@1)))
)))
(assert (forall ((Mask@@13 T@U) (o_2@@2 T@U) (f_4@@2 T@U) ) (! (let ((B@@7 (FieldTypeInv1 (type f_4@@2))))
(let ((A@@8 (FieldTypeInv0 (type f_4@@2))))
 (=> (and (and (and (= (type Mask@@13) (MapType1Type RefType realType)) (= (type o_2@@2) RefType)) (= (type f_4@@2) (FieldType A@@8 B@@7))) (GoodMask Mask@@13)) (and (>= (U_2_real (MapType1Select Mask@@13 o_2@@2 f_4@@2)) NoPerm) (=> (and (and (GoodMask Mask@@13) (not (IsPredicateField f_4@@2))) (not (IsWandField f_4@@2))) (<= (U_2_real (MapType1Select Mask@@13 o_2@@2 f_4@@2)) FullPerm))))))
 :qid |stdinbpl.128:22|
 :skolemid |16|
 :pattern ( (GoodMask Mask@@13) (MapType1Select Mask@@13 o_2@@2 f_4@@2))
)))
(assert (forall ((r@@2 T@U) ) (! (U_2_bool (MapType2Select (|Set#Singleton| r@@2) r@@2))
 :qid |stdinbpl.390:18|
 :skolemid |26|
 :pattern ( (|Set#Singleton| r@@2))
)))
(assert (forall ((a@@25 T@U) (b@@18 T@U) ) (! (let ((T@@40 (MapType2TypeInv0 (type a@@25))))
 (=> (and (= (type a@@25) (MapType2Type T@@40 boolType)) (= (type b@@18) (MapType2Type T@@40 boolType))) (= (|Set#Union| a@@25 (|Set#Union| a@@25 b@@18)) (|Set#Union| a@@25 b@@18))))
 :qid |stdinbpl.424:18|
 :skolemid |39|
 :pattern ( (|Set#Union| a@@25 (|Set#Union| a@@25 b@@18)))
)))
(assert (forall ((a@@26 T@U) (b@@19 T@U) ) (! (let ((T@@41 (MapType2TypeInv0 (type a@@26))))
 (=> (and (= (type a@@26) (MapType2Type T@@41 boolType)) (= (type b@@19) (MapType2Type T@@41 boolType))) (= (|Set#Intersection| a@@26 (|Set#Intersection| a@@26 b@@19)) (|Set#Intersection| a@@26 b@@19))))
 :qid |stdinbpl.428:18|
 :skolemid |41|
 :pattern ( (|Set#Intersection| a@@26 (|Set#Intersection| a@@26 b@@19)))
)))
(assert (forall ((a@@27 T@U) (b@@20 T@U) ) (! (let ((T@@42 (MultiSetTypeInv0 (type a@@27))))
 (=> (and (= (type a@@27) (MultiSetType T@@42)) (= (type b@@20) (MultiSetType T@@42))) (= (|MultiSet#Intersection| a@@27 (|MultiSet#Intersection| a@@27 b@@20)) (|MultiSet#Intersection| a@@27 b@@20))))
 :qid |stdinbpl.530:18|
 :skolemid |71|
 :pattern ( (|MultiSet#Intersection| a@@27 (|MultiSet#Intersection| a@@27 b@@20)))
)))
(assert (forall ((s@@1 T@U) ) (! (let ((T@@43 (MultiSetTypeInv0 (type s@@1))))
 (=> (= (type s@@1) (MultiSetType T@@43)) (and (= (= (|MultiSet#Card| s@@1) 0) (= s@@1 (|MultiSet#Empty| T@@43))) (=> (not (= (|MultiSet#Card| s@@1) 0)) (exists ((x@@15 T@U) ) (!  (and (= (type x@@15) T@@43) (< 0 (|MultiSet#Select| s@@1 x@@15)))
 :qid |stdinbpl.497:38|
 :skolemid |59|
 :no-pattern (type x@@15)
 :no-pattern (U_2_int x@@15)
 :no-pattern (U_2_bool x@@15)
))))))
 :qid |stdinbpl.495:18|
 :skolemid |60|
 :pattern ( (|MultiSet#Card| s@@1))
)))
(assert (forall ((r@@3 T@U) (o@@7 T@U) ) (! (let ((T@@44 (type r@@3)))
 (=> (= (type o@@7) T@@44) (and (= (= (|MultiSet#Select| (|MultiSet#Singleton| r@@3) o@@7) 1) (= r@@3 o@@7)) (= (= (|MultiSet#Select| (|MultiSet#Singleton| r@@3) o@@7) 0) (not (= r@@3 o@@7))))))
 :qid |stdinbpl.500:18|
 :skolemid |61|
 :pattern ( (|MultiSet#Select| (|MultiSet#Singleton| r@@3) o@@7))
)))
(assert (forall ((Heap@@18 T@U) (Mask@@14 T@U) (g@@6 T@U) ) (!  (=> (and (and (and (= (type Heap@@18) (MapType0Type RefType)) (= (type Mask@@14) (MapType1Type RefType realType))) (= (type g@@6) (MapType2Type RefType boolType))) (state Heap@@18 Mask@@14)) (= (|acyclic_list_segment'| Heap@@18 g@@6) (|acyclic_list_segment#frame| (FrameFragment (int_2_U (|acyclic_list_segment#condqp3| Heap@@18 g@@6))) g@@6)))
 :qid |stdinbpl.1099:15|
 :skolemid |144|
 :pattern ( (state Heap@@18 Mask@@14) (|acyclic_list_segment'| Heap@@18 g@@6))
)))
(assert (forall ((o@@8 T@U) (f T@U) (Heap@@19 T@U) ) (!  (=> (and (and (and (= (type o@@8) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap@@19) (MapType0Type RefType))) (U_2_bool (MapType0Select Heap@@19 o@@8 $allocated))) (U_2_bool (MapType0Select Heap@@19 (MapType0Select Heap@@19 o@@8 f) $allocated)))
 :qid |stdinbpl.31:15|
 :skolemid |0|
 :pattern ( (MapType0Select Heap@@19 o@@8 f))
)))
(assert (forall ((a@@28 T@U) (b@@21 T@U) (o@@9 T@U) ) (! (let ((T@@45 (type o@@9)))
 (=> (and (= (type a@@28) (MultiSetType T@@45)) (= (type b@@21) (MultiSetType T@@45))) (= (|MultiSet#Select| (|MultiSet#Union| a@@28 b@@21) o@@9) (+ (|MultiSet#Select| a@@28 o@@9) (|MultiSet#Select| b@@21 o@@9)))))
 :qid |stdinbpl.518:18|
 :skolemid |67|
 :pattern ( (|MultiSet#Select| (|MultiSet#Union| a@@28 b@@21) o@@9))
 :pattern ( (|MultiSet#Union| a@@28 b@@21) (|MultiSet#Select| a@@28 o@@9) (|MultiSet#Select| b@@21 o@@9))
)))
(assert (forall ((o@@10 T@U) ) (! (let ((T@@46 (type o@@10)))
 (not (U_2_bool (MapType2Select (|Set#Empty| T@@46) o@@10))))
 :qid |stdinbpl.384:18|
 :skolemid |23|
 :pattern ( (let ((T@@46 (type o@@10)))
(MapType2Select (|Set#Empty| T@@46) o@@10)))
)))
(assert (forall ((Heap@@20 T@U) (Mask@@15 T@U) (g0@@3 T@U) (g1@@3 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@20) (MapType0Type RefType)) (= (type Mask@@15) (MapType1Type RefType realType))) (= (type g0@@3) (MapType2Type RefType boolType))) (= (type g1@@3) (MapType2Type RefType boolType))) (and (state Heap@@20 Mask@@15) (or (< AssumeFunctionsAbove 0) (|apply_TCFraming#trigger| (CombineFrames (FrameFragment (int_2_U (|apply_TCFraming#condqp4| Heap@@20 g0@@3 g1@@3))) (FrameFragment (int_2_U (|apply_TCFraming#condqp5| Heap@@20 g0@@3 g1@@3)))) g0@@3 g1@@3)))) (and (and (and (not (U_2_bool (MapType2Select g0@@3 null))) (forall ((n$0@@2 T@U) ) (!  (=> (= (type n$0@@2) RefType) (=> (and (U_2_bool (MapType2Select g0@@3 n$0@@2)) (not (= (MapType0Select Heap@@20 n$0@@2 next) null))) (U_2_bool (MapType2Select g0@@3 (MapType0Select Heap@@20 n$0@@2 next)))))
 :qid |stdinbpl.1421:236|
 :skolemid |179|
 :pattern ( (MapType2Select g0@@3 (MapType0Select Heap@@20 n$0@@2 next)))
 :pattern ( (MapType2Select g0@@3 n$0@@2) (MapType0Select Heap@@20 n$0@@2 next))
))) (and (not (U_2_bool (MapType2Select g1@@3 null))) (forall ((n$2@@1 T@U) ) (!  (=> (= (type n$2@@1) RefType) (=> (and (U_2_bool (MapType2Select g1@@3 n$2@@1)) (not (= (MapType0Select Heap@@20 n$2@@1 next) null))) (U_2_bool (MapType2Select g1@@3 (MapType0Select Heap@@20 n$2@@1 next)))))
 :qid |stdinbpl.1424:31|
 :skolemid |180|
 :pattern ( (MapType2Select g1@@3 (MapType0Select Heap@@20 n$2@@1 next)))
 :pattern ( (MapType2Select g1@@3 n$2@@1) (MapType0Select Heap@@20 n$2@@1 next))
)))) (|Set#Equal| (|Set#Intersection| g1@@3 g0@@3) (|Set#Empty| RefType)))) (|Set#Equal| (|Set#Union| g0@@3 g1@@3) (|Set#Union| g1@@3 g0@@3)))
 :qid |stdinbpl.1419:15|
 :skolemid |181|
 :pattern ( (state Heap@@20 Mask@@15) (|apply_TCFraming'| Heap@@20 g0@@3 g1@@3))
)))
(assert (forall ((Heap@@21 T@U) (Mask@@16 T@U) (g@@7 T@U) (roots@@1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@21) (MapType0Type RefType)) (= (type Mask@@16) (MapType1Type RefType realType))) (= (type g@@7) (MapType2Type RefType boolType))) (= (type roots@@1) (MapType2Type RefType boolType))) (and (state Heap@@21 Mask@@16) (< AssumeFunctionsAbove 1))) (and (and (not (U_2_bool (MapType2Select g@@7 null))) (forall ((n$1 T@U) ) (!  (=> (= (type n$1) RefType) (=> (and (U_2_bool (MapType2Select g@@7 n$1)) (not (= (MapType0Select Heap@@21 n$1 next) null))) (U_2_bool (MapType2Select g@@7 (MapType0Select Heap@@21 n$1 next)))))
 :qid |stdinbpl.890:74|
 :skolemid |120|
 :pattern ( (MapType2Select g@@7 (MapType0Select Heap@@21 n$1 next)))
 :pattern ( (MapType2Select g@@7 n$1) (MapType0Select Heap@@21 n$1 next))
))) (|Set#Subset| roots@@1 g@@7))) (= (is_global_sroot Heap@@21 g@@7 roots@@1) (forall ((n T@U) ) (!  (=> (and (= (type n) RefType) (U_2_bool (MapType2Select g@@7 n))) (exists_spath ($$ Heap@@21 g@@7) roots@@1 n))
 :qid |stdinbpl.893:77|
 :skolemid |121|
 :pattern ( (MapType2Select g@@7 n))
 :pattern ( (exists_spath (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| Heap@@21 g@@7))) g@@7) roots@@1 n))
))))
 :qid |stdinbpl.888:15|
 :skolemid |122|
 :pattern ( (state Heap@@21 Mask@@16) (is_global_sroot Heap@@21 g@@7 roots@@1))
)))
(assert (forall ((r@@4 T@U) ) (! (let ((T@@47 (type r@@4)))
(= (|MultiSet#Singleton| r@@4) (|MultiSet#UnionOne| (|MultiSet#Empty| T@@47) r@@4)))
 :qid |stdinbpl.503:18|
 :skolemid |63|
 :pattern ( (|MultiSet#Singleton| r@@4))
)))
(assert (forall ((a@@29 Int) (b@@22 Int) ) (! (= (<= a@@29 b@@22) (= (|Math#min| a@@29 b@@22) a@@29))
 :qid |stdinbpl.468:15|
 :skolemid |51|
 :pattern ( (|Math#min| a@@29 b@@22))
)))
(assert (forall ((a@@30 Int) (b@@23 Int) ) (! (= (<= b@@23 a@@30) (= (|Math#min| a@@30 b@@23) b@@23))
 :qid |stdinbpl.469:15|
 :skolemid |52|
 :pattern ( (|Math#min| a@@30 b@@23))
)))
(assert (forall ((s@@2 T@U) ) (! (let ((T@@48 (MapType2TypeInv0 (type s@@2))))
 (=> (= (type s@@2) (MapType2Type T@@48 boolType)) (and (= (= (|Set#Card| s@@2) 0) (= s@@2 (|Set#Empty| T@@48))) (=> (not (= (|Set#Card| s@@2) 0)) (exists ((x@@16 T@U) ) (!  (and (= (type x@@16) T@@48) (U_2_bool (MapType2Select s@@2 x@@16)))
 :qid |stdinbpl.387:33|
 :skolemid |24|
 :no-pattern (type x@@16)
 :no-pattern (U_2_int x@@16)
 :no-pattern (U_2_bool x@@16)
))))))
 :qid |stdinbpl.385:18|
 :skolemid |25|
 :pattern ( (|Set#Card| s@@2))
)))
(assert (forall ((Heap@@22 T@U) (Mask@@17 T@U) (refs@@3 T@U) ) (!  (=> (and (and (and (= (type Heap@@22) (MapType0Type RefType)) (= (type Mask@@17) (MapType1Type RefType realType))) (= (type refs@@3) (MapType2Type RefType boolType))) (state Heap@@22 Mask@@17)) (= (|$$'| Heap@@22 refs@@3) (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| Heap@@22 refs@@3))) refs@@3)))
 :qid |stdinbpl.761:15|
 :skolemid |106|
 :pattern ( (state Heap@@22 Mask@@17) (|$$'| Heap@@22 refs@@3))
)))
(assert (forall ((Heap@@23 T@U) (o@@11 T@U) (f_3 T@U) (v T@U) ) (! (let ((B@@8 (type v)))
(let ((A@@9 (FieldTypeInv0 (type f_3))))
 (=> (and (and (= (type Heap@@23) (MapType0Type RefType)) (= (type o@@11) RefType)) (= (type f_3) (FieldType A@@9 B@@8))) (succHeap Heap@@23 (MapType0Store Heap@@23 o@@11 f_3 v)))))
 :qid |stdinbpl.78:22|
 :skolemid |9|
 :pattern ( (MapType0Store Heap@@23 o@@11 f_3 v))
)))
(assert (forall ((a@@31 T@U) (b@@24 T@U) ) (! (let ((T@@49 (MapType2TypeInv0 (type a@@31))))
 (=> (and (= (type a@@31) (MapType2Type T@@49 boolType)) (= (type b@@24) (MapType2Type T@@49 boolType))) (= (|Set#Subset| a@@31 b@@24) (forall ((o@@12 T@U) ) (!  (=> (and (= (type o@@12) T@@49) (U_2_bool (MapType2Select a@@31 o@@12))) (U_2_bool (MapType2Select b@@24 o@@12)))
 :qid |stdinbpl.447:32|
 :skolemid |46|
 :pattern ( (MapType2Select a@@31 o@@12))
 :pattern ( (MapType2Select b@@24 o@@12))
)))))
 :qid |stdinbpl.446:17|
 :skolemid |47|
 :pattern ( (|Set#Subset| a@@31 b@@24))
)))
(assert (forall ((a@@32 T@U) (x@@17 T@U) ) (! (let ((T@@50 (type x@@17)))
 (=> (and (= (type a@@32) (MapType2Type T@@50 boolType)) (not (U_2_bool (MapType2Select a@@32 x@@17)))) (= (|Set#Card| (|Set#UnionOne| a@@32 x@@17)) (+ (|Set#Card| a@@32) 1))))
 :qid |stdinbpl.403:18|
 :skolemid |33|
 :pattern ( (|Set#Card| (|Set#UnionOne| a@@32 x@@17)))
)))
(assert (forall ((a@@33 T@U) (b@@25 T@U) (o@@13 T@U) ) (! (let ((T@@51 (type o@@13)))
 (=> (and (= (type a@@33) (MultiSetType T@@51)) (= (type b@@25) (MultiSetType T@@51))) (= (|MultiSet#Select| (|MultiSet#Difference| a@@33 b@@25) o@@13) (|Math#clip| (- (|MultiSet#Select| a@@33 o@@13) (|MultiSet#Select| b@@25 o@@13))))))
 :qid |stdinbpl.535:18|
 :skolemid |72|
 :pattern ( (|MultiSet#Select| (|MultiSet#Difference| a@@33 b@@25) o@@13))
)))
(assert (forall ((arg0@@55 Int) (arg1@@31 Int) ) (! (= (type (|sk_is_global_sroot#condqp2| arg0@@55 arg1@@31)) RefType)
 :qid |funType:sk_is_global_sroot#condqp2|
 :pattern ( (|sk_is_global_sroot#condqp2| arg0@@55 arg1@@31))
)))
(assert (forall ((Heap2Heap@@1 T@U) (Heap1Heap@@1 T@U) (g@@8 T@U) (roots@@2 T@U) ) (!  (=> (and (and (and (and (= (type Heap2Heap@@1) (MapType0Type RefType)) (= (type Heap1Heap@@1) (MapType0Type RefType))) (= (type g@@8) (MapType2Type RefType boolType))) (= (type roots@@2) (MapType2Type RefType boolType))) (and (=  (and (U_2_bool (MapType2Select g@@8 (|sk_is_global_sroot#condqp2| (|is_global_sroot#condqp2| Heap2Heap@@1 g@@8 roots@@2) (|is_global_sroot#condqp2| Heap1Heap@@1 g@@8 roots@@2)))) (< NoPerm FullPerm))  (and (U_2_bool (MapType2Select g@@8 (|sk_is_global_sroot#condqp2| (|is_global_sroot#condqp2| Heap2Heap@@1 g@@8 roots@@2) (|is_global_sroot#condqp2| Heap1Heap@@1 g@@8 roots@@2)))) (< NoPerm FullPerm))) (=> (and (U_2_bool (MapType2Select g@@8 (|sk_is_global_sroot#condqp2| (|is_global_sroot#condqp2| Heap2Heap@@1 g@@8 roots@@2) (|is_global_sroot#condqp2| Heap1Heap@@1 g@@8 roots@@2)))) (< NoPerm FullPerm)) (= (MapType0Select Heap2Heap@@1 (|sk_is_global_sroot#condqp2| (|is_global_sroot#condqp2| Heap2Heap@@1 g@@8 roots@@2) (|is_global_sroot#condqp2| Heap1Heap@@1 g@@8 roots@@2)) next) (MapType0Select Heap1Heap@@1 (|sk_is_global_sroot#condqp2| (|is_global_sroot#condqp2| Heap2Heap@@1 g@@8 roots@@2) (|is_global_sroot#condqp2| Heap1Heap@@1 g@@8 roots@@2)) next))))) (= (|is_global_sroot#condqp2| Heap2Heap@@1 g@@8 roots@@2) (|is_global_sroot#condqp2| Heap1Heap@@1 g@@8 roots@@2)))
 :qid |stdinbpl.911:15|
 :skolemid |124|
 :pattern ( (|is_global_sroot#condqp2| Heap2Heap@@1 g@@8 roots@@2) (|is_global_sroot#condqp2| Heap1Heap@@1 g@@8 roots@@2) (succHeapTrans Heap2Heap@@1 Heap1Heap@@1))
)))
(assert (forall ((arg0@@56 Int) (arg1@@32 Int) ) (! (= (type (|sk_apply_TCFraming#condqp4| arg0@@56 arg1@@32)) RefType)
 :qid |funType:sk_apply_TCFraming#condqp4|
 :pattern ( (|sk_apply_TCFraming#condqp4| arg0@@56 arg1@@32))
)))
(assert (forall ((Heap2Heap@@2 T@U) (Heap1Heap@@2 T@U) (g0@@4 T@U) (g1@@4 T@U) ) (!  (=> (and (and (and (and (= (type Heap2Heap@@2) (MapType0Type RefType)) (= (type Heap1Heap@@2) (MapType0Type RefType))) (= (type g0@@4) (MapType2Type RefType boolType))) (= (type g1@@4) (MapType2Type RefType boolType))) (and (=  (and (U_2_bool (MapType2Select g0@@4 (|sk_apply_TCFraming#condqp4| (|apply_TCFraming#condqp4| Heap2Heap@@2 g0@@4 g1@@4) (|apply_TCFraming#condqp4| Heap1Heap@@2 g0@@4 g1@@4)))) (< NoPerm FullPerm))  (and (U_2_bool (MapType2Select g0@@4 (|sk_apply_TCFraming#condqp4| (|apply_TCFraming#condqp4| Heap2Heap@@2 g0@@4 g1@@4) (|apply_TCFraming#condqp4| Heap1Heap@@2 g0@@4 g1@@4)))) (< NoPerm FullPerm))) (=> (and (U_2_bool (MapType2Select g0@@4 (|sk_apply_TCFraming#condqp4| (|apply_TCFraming#condqp4| Heap2Heap@@2 g0@@4 g1@@4) (|apply_TCFraming#condqp4| Heap1Heap@@2 g0@@4 g1@@4)))) (< NoPerm FullPerm)) (= (MapType0Select Heap2Heap@@2 (|sk_apply_TCFraming#condqp4| (|apply_TCFraming#condqp4| Heap2Heap@@2 g0@@4 g1@@4) (|apply_TCFraming#condqp4| Heap1Heap@@2 g0@@4 g1@@4)) next) (MapType0Select Heap1Heap@@2 (|sk_apply_TCFraming#condqp4| (|apply_TCFraming#condqp4| Heap2Heap@@2 g0@@4 g1@@4) (|apply_TCFraming#condqp4| Heap1Heap@@2 g0@@4 g1@@4)) next))))) (= (|apply_TCFraming#condqp4| Heap2Heap@@2 g0@@4 g1@@4) (|apply_TCFraming#condqp4| Heap1Heap@@2 g0@@4 g1@@4)))
 :qid |stdinbpl.1403:15|
 :skolemid |177|
 :pattern ( (|apply_TCFraming#condqp4| Heap2Heap@@2 g0@@4 g1@@4) (|apply_TCFraming#condqp4| Heap1Heap@@2 g0@@4 g1@@4) (succHeapTrans Heap2Heap@@2 Heap1Heap@@2))
)))
(assert (forall ((arg0@@57 Int) (arg1@@33 Int) ) (! (= (type (|sk_apply_TCFraming#condqp5| arg0@@57 arg1@@33)) RefType)
 :qid |funType:sk_apply_TCFraming#condqp5|
 :pattern ( (|sk_apply_TCFraming#condqp5| arg0@@57 arg1@@33))
)))
(assert (forall ((Heap2Heap@@3 T@U) (Heap1Heap@@3 T@U) (g0@@5 T@U) (g1@@5 T@U) ) (!  (=> (and (and (and (and (= (type Heap2Heap@@3) (MapType0Type RefType)) (= (type Heap1Heap@@3) (MapType0Type RefType))) (= (type g0@@5) (MapType2Type RefType boolType))) (= (type g1@@5) (MapType2Type RefType boolType))) (and (=  (and (U_2_bool (MapType2Select g1@@5 (|sk_apply_TCFraming#condqp5| (|apply_TCFraming#condqp5| Heap2Heap@@3 g0@@5 g1@@5) (|apply_TCFraming#condqp5| Heap1Heap@@3 g0@@5 g1@@5)))) (< NoPerm FullPerm))  (and (U_2_bool (MapType2Select g1@@5 (|sk_apply_TCFraming#condqp5| (|apply_TCFraming#condqp5| Heap2Heap@@3 g0@@5 g1@@5) (|apply_TCFraming#condqp5| Heap1Heap@@3 g0@@5 g1@@5)))) (< NoPerm FullPerm))) (=> (and (U_2_bool (MapType2Select g1@@5 (|sk_apply_TCFraming#condqp5| (|apply_TCFraming#condqp5| Heap2Heap@@3 g0@@5 g1@@5) (|apply_TCFraming#condqp5| Heap1Heap@@3 g0@@5 g1@@5)))) (< NoPerm FullPerm)) (= (MapType0Select Heap2Heap@@3 (|sk_apply_TCFraming#condqp5| (|apply_TCFraming#condqp5| Heap2Heap@@3 g0@@5 g1@@5) (|apply_TCFraming#condqp5| Heap1Heap@@3 g0@@5 g1@@5)) next) (MapType0Select Heap1Heap@@3 (|sk_apply_TCFraming#condqp5| (|apply_TCFraming#condqp5| Heap2Heap@@3 g0@@5 g1@@5) (|apply_TCFraming#condqp5| Heap1Heap@@3 g0@@5 g1@@5)) next))))) (= (|apply_TCFraming#condqp5| Heap2Heap@@3 g0@@5 g1@@5) (|apply_TCFraming#condqp5| Heap1Heap@@3 g0@@5 g1@@5)))
 :qid |stdinbpl.1413:15|
 :skolemid |178|
 :pattern ( (|apply_TCFraming#condqp5| Heap2Heap@@3 g0@@5 g1@@5) (|apply_TCFraming#condqp5| Heap1Heap@@3 g0@@5 g1@@5) (succHeapTrans Heap2Heap@@3 Heap1Heap@@3))
)))
(assert (forall ((Heap@@24 T@U) (Mask@@18 T@U) (g0@@6 T@U) (g1@@6 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@24) (MapType0Type RefType)) (= (type Mask@@18) (MapType1Type RefType realType))) (= (type g0@@6) (MapType2Type RefType boolType))) (= (type g1@@6) (MapType2Type RefType boolType))) (state Heap@@24 Mask@@18)) (= (|apply_TCFraming'| Heap@@24 g0@@6 g1@@6) (|apply_TCFraming#frame| (CombineFrames (FrameFragment (int_2_U (|apply_TCFraming#condqp4| Heap@@24 g0@@6 g1@@6))) (FrameFragment (int_2_U (|apply_TCFraming#condqp5| Heap@@24 g0@@6 g1@@6)))) g0@@6 g1@@6)))
 :qid |stdinbpl.1393:15|
 :skolemid |176|
 :pattern ( (state Heap@@24 Mask@@18) (|apply_TCFraming'| Heap@@24 g0@@6 g1@@6))
)))
(assert (= (type ZeroPMask) (MapType1Type RefType boolType)))
(assert (forall ((o_2@@3 T@U) (f_4@@3 T@U) ) (! (let ((B@@9 (FieldTypeInv1 (type f_4@@3))))
(let ((A@@10 (FieldTypeInv0 (type f_4@@3))))
 (=> (and (= (type o_2@@3) RefType) (= (type f_4@@3) (FieldType A@@10 B@@9))) (not (U_2_bool (MapType1Select ZeroPMask o_2@@3 f_4@@3))))))
 :qid |stdinbpl.112:22|
 :skolemid |14|
 :pattern ( (MapType1Select ZeroPMask o_2@@3 f_4@@3))
)))
(assert (forall ((p@@1 T@U) (v_1@@0 T@U) (q T@U) (w@@0 T@U) (r@@5 T@U) (u T@U) ) (! (let ((C@@3 (FieldTypeInv0 (type r@@5))))
(let ((B@@10 (FieldTypeInv0 (type q))))
(let ((A@@11 (FieldTypeInv0 (type p@@1))))
 (=> (and (and (and (and (and (and (= (type p@@1) (FieldType A@@11 FrameTypeType)) (= (type v_1@@0) FrameTypeType)) (= (type q) (FieldType B@@10 FrameTypeType))) (= (type w@@0) FrameTypeType)) (= (type r@@5) (FieldType C@@3 FrameTypeType))) (= (type u) FrameTypeType)) (and (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r@@5 u))) (InsidePredicate p@@1 v_1@@0 r@@5 u)))))
 :qid |stdinbpl.363:25|
 :skolemid |20|
 :pattern ( (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r@@5 u))
)))
(assert (forall ((a@@34 Int) ) (!  (=> (< a@@34 0) (= (|Math#clip| a@@34) 0))
 :qid |stdinbpl.474:15|
 :skolemid |55|
 :pattern ( (|Math#clip| a@@34))
)))
(assert (forall ((EG_1@@9 T@U) ) (!  (=> (= (type EG_1@@9) (MapType2Type EdgeDomainTypeType boolType)) (= (acyclic_graph EG_1@@9) (forall ((v1@@1 T@U) (v2@@1 T@U) ) (!  (=> (and (= (type v1@@1) RefType) (= (type v2@@1) RefType)) (or (not (edge EG_1@@9 v1@@1 v2@@1)) (not (exists_path EG_1@@9 v2@@1 v1@@1))))
 :qid |stdinbpl.680:42|
 :skolemid |93|
 :pattern ( (edge EG_1@@9 v1@@1 v2@@1))
 :pattern ( (exists_path EG_1@@9 v2@@1 v1@@1))
))))
 :qid |stdinbpl.678:15|
 :skolemid |94|
 :pattern ( (acyclic_graph EG_1@@9))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
(assert (forall ((a@@35 T@U) (x@@18 T@U) (o@@14 T@U) ) (! (let ((T@@52 (type x@@18)))
 (=> (and (= (type a@@35) (MultiSetType T@@52)) (= (type o@@14) T@@52)) (= (|MultiSet#Select| (|MultiSet#UnionOne| a@@35 x@@18) o@@14) (ite (= x@@18 o@@14) (+ (|MultiSet#Select| a@@35 o@@14) 1) (|MultiSet#Select| a@@35 o@@14)))))
 :qid |stdinbpl.507:18|
 :skolemid |64|
 :pattern ( (|MultiSet#Select| (|MultiSet#UnionOne| a@@35 x@@18) o@@14))
 :pattern ( (|MultiSet#UnionOne| a@@35 x@@18) (|MultiSet#Select| a@@35 o@@14))
)))
(assert (forall ((a@@36 T@U) (b@@26 T@U) ) (! (let ((T@@53 (MultiSetTypeInv0 (type a@@36))))
 (=> (and (= (type a@@36) (MultiSetType T@@53)) (= (type b@@26) (MultiSetType T@@53))) (= (|MultiSet#Equal| a@@36 b@@26) (forall ((o@@15 T@U) ) (!  (=> (= (type o@@15) T@@53) (= (|MultiSet#Select| a@@36 o@@15) (|MultiSet#Select| b@@26 o@@15)))
 :qid |stdinbpl.553:36|
 :skolemid |77|
 :pattern ( (|MultiSet#Select| a@@36 o@@15))
 :pattern ( (|MultiSet#Select| b@@26 o@@15))
)))))
 :qid |stdinbpl.552:17|
 :skolemid |78|
 :pattern ( (|MultiSet#Equal| a@@36 b@@26))
)))
(assert (forall ((a@@37 T@U) (b@@27 T@U) ) (! (let ((T@@54 (MultiSetTypeInv0 (type a@@37))))
 (=> (and (= (type a@@37) (MultiSetType T@@54)) (= (type b@@27) (MultiSetType T@@54))) (= (|MultiSet#Subset| a@@37 b@@27) (forall ((o@@16 T@U) ) (!  (=> (= (type o@@16) T@@54) (<= (|MultiSet#Select| a@@37 o@@16) (|MultiSet#Select| b@@27 o@@16)))
 :qid |stdinbpl.549:37|
 :skolemid |75|
 :pattern ( (|MultiSet#Select| a@@37 o@@16))
 :pattern ( (|MultiSet#Select| b@@27 o@@16))
)))))
 :qid |stdinbpl.548:17|
 :skolemid |76|
 :pattern ( (|MultiSet#Subset| a@@37 b@@27))
)))
(assert (forall ((a@@38 T@U) (b@@28 T@U) (o@@17 T@U) ) (! (let ((T@@55 (type o@@17)))
 (=> (and (= (type a@@38) (MapType2Type T@@55 boolType)) (= (type b@@28) (MapType2Type T@@55 boolType))) (= (U_2_bool (MapType2Select (|Set#Union| a@@38 b@@28) o@@17))  (or (U_2_bool (MapType2Select a@@38 o@@17)) (U_2_bool (MapType2Select b@@28 o@@17))))))
 :qid |stdinbpl.407:18|
 :skolemid |34|
 :pattern ( (MapType2Select (|Set#Union| a@@38 b@@28) o@@17))
)))
(assert (forall ((Heap@@25 T@U) (g@@9 T@U) (roots@@3 T@U) ) (!  (=> (and (and (= (type Heap@@25) (MapType0Type RefType)) (= (type g@@9) (MapType2Type RefType boolType))) (= (type roots@@3) (MapType2Type RefType boolType))) (and (= (is_global_sroot Heap@@25 g@@9 roots@@3) (|is_global_sroot'| Heap@@25 g@@9 roots@@3)) (dummyFunction (bool_2_U (|is_global_sroot#triggerStateless| g@@9 roots@@3)))))
 :qid |stdinbpl.878:15|
 :skolemid |118|
 :pattern ( (is_global_sroot Heap@@25 g@@9 roots@@3))
)))
(assert (forall ((Heap@@26 T@U) (g0@@7 T@U) (g1@@7 T@U) ) (!  (=> (and (and (= (type Heap@@26) (MapType0Type RefType)) (= (type g0@@7) (MapType2Type RefType boolType))) (= (type g1@@7) (MapType2Type RefType boolType))) (and (= (apply_TCFraming Heap@@26 g0@@7 g1@@7) (|apply_TCFraming'| Heap@@26 g0@@7 g1@@7)) (dummyFunction (bool_2_U (|apply_TCFraming#triggerStateless| g0@@7 g1@@7)))))
 :qid |stdinbpl.1382:15|
 :skolemid |174|
 :pattern ( (apply_TCFraming Heap@@26 g0@@7 g1@@7))
)))
(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun g0@@8 () T@U)
(declare-fun n$0_2_1 () T@U)
(declare-fun Heap@@27 () T@U)
(declare-fun neverTriggered50 (T@U) Bool)
(declare-fun QPMask@2 () T@U)
(declare-fun QPMask@1 () T@U)
(declare-fun qpRange50 (T@U) Bool)
(declare-fun invRecv50 (T@U) T@U)
(declare-fun g1@@8 () T@U)
(declare-fun n$0_4 () T@U)
(declare-fun neverTriggered51 (T@U) Bool)
(declare-fun QPMask@3 () T@U)
(declare-fun qpRange51 (T@U) Bool)
(declare-fun invRecv51 (T@U) T@U)
(declare-fun n$1_2 () T@U)
(declare-fun PostHeap@0 () T@U)
(declare-fun x1@@7 () T@U)
(declare-fun x0@@10 () T@U)
(declare-fun neverTriggered53 (T@U) Bool)
(declare-fun QPMask@11 () T@U)
(declare-fun QPMask@10 () T@U)
(declare-fun qpRange53 (T@U) Bool)
(declare-fun invRecv53 (T@U) T@U)
(declare-fun n$0_7_1 () T@U)
(declare-fun neverTriggered54 (T@U) Bool)
(declare-fun QPMask@12 () T@U)
(declare-fun qpRange54 (T@U) Bool)
(declare-fun invRecv54 (T@U) T@U)
(declare-fun n$6 () T@U)
(declare-fun qpRange52 (T@U) Bool)
(declare-fun invRecv52 (T@U) T@U)
(declare-fun n$2_2 () T@U)
(declare-fun neverTriggered57 (T@U) Bool)
(declare-fun QPMask@9 () T@U)
(declare-fun QPMask@4 () T@U)
(declare-fun qpRange57 (T@U) Bool)
(declare-fun invRecv57 (T@U) T@U)
(declare-fun n$0_9_1 () T@U)
(declare-fun neverTriggered56 (T@U) Bool)
(declare-fun qpRange56 (T@U) Bool)
(declare-fun invRecv56 (T@U) T@U)
(declare-fun r$2_2 () T@U)
(declare-fun r$1_2 () T@U)
(declare-fun n$6_2 () T@U)
(declare-fun neverTriggered55 (T@U) Bool)
(declare-fun QPMask@8 () T@U)
(declare-fun qpRange55 (T@U) Bool)
(declare-fun invRecv55 (T@U) T@U)
(declare-fun QPMask@7 () T@U)
(declare-fun neverTriggered60 (T@U) Bool)
(declare-fun QPMask@6 () T@U)
(declare-fun neverTriggered59 (T@U) Bool)
(declare-fun QPMask@5 () T@U)
(declare-fun neverTriggered58 (T@U) Bool)
(declare-fun QPMask@13 () T@U)
(declare-fun neverTriggered49 (T@U) Bool)
(declare-fun n$4_4 () T@U)
(declare-fun QPMask@14 () T@U)
(declare-fun neverTriggered48 (T@U) Bool)
(declare-fun n$3 () T@U)
(declare-fun n$2_7 () T@U)
(declare-fun qpRange47 (T@U) Bool)
(declare-fun invRecv47 (T@U) T@U)
(declare-fun QPMask@0 () T@U)
(declare-fun n$0_11 () T@U)
(declare-fun qpRange46 (T@U) Bool)
(declare-fun invRecv46 (T@U) T@U)
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (= (type g0@@8) (MapType2Type RefType boolType)) (= (type n$0_11) RefType)) (= (type Heap@@27) (MapType0Type RefType))) (= (type QPMask@0) (MapType1Type RefType realType))) (= (type g1@@8) (MapType2Type RefType boolType))) (= (type n$2_7) RefType)) (= (type QPMask@1) (MapType1Type RefType realType))) (= (type n$3) RefType)) (= (type QPMask@14) (MapType1Type RefType realType))) (= (type n$4_4) RefType)) (= (type QPMask@13) (MapType1Type RefType realType))) (= (type QPMask@5) (MapType1Type RefType realType))) (= (type QPMask@6) (MapType1Type RefType realType))) (= (type QPMask@7) (MapType1Type RefType realType))) (= (type n$6_2) RefType)) (= (type r$1_2) RefType)) (= (type r$2_2) RefType)) (= (type x1@@7) RefType)) (= (type x0@@10) RefType)) (= (type QPMask@8) (MapType1Type RefType realType))) (forall ((arg0@@58 T@U) ) (! (= (type (invRecv55 arg0@@58)) RefType)
 :qid |funType:invRecv55|
 :pattern ( (invRecv55 arg0@@58))
))) (= (type n$0_9_1) RefType)) (= (type n$2_2) RefType)) (= (type QPMask@9) (MapType1Type RefType realType))) (= (type QPMask@4) (MapType1Type RefType realType))) (forall ((arg0@@59 T@U) ) (! (= (type (invRecv57 arg0@@59)) RefType)
 :qid |funType:invRecv57|
 :pattern ( (invRecv57 arg0@@59))
))) (forall ((arg0@@60 T@U) ) (! (= (type (invRecv56 arg0@@60)) RefType)
 :qid |funType:invRecv56|
 :pattern ( (invRecv56 arg0@@60))
))) (= (type n$6) RefType)) (= (type PostHeap@0) (MapType0Type RefType))) (= (type QPMask@10) (MapType1Type RefType realType))) (= (type n$0_7_1) RefType)) (= (type QPMask@12) (MapType1Type RefType realType))) (forall ((arg0@@61 T@U) ) (! (= (type (invRecv54 arg0@@61)) RefType)
 :qid |funType:invRecv54|
 :pattern ( (invRecv54 arg0@@61))
))) (= (type n$1_2) RefType)) (= (type QPMask@11) (MapType1Type RefType realType))) (forall ((arg0@@62 T@U) ) (! (= (type (invRecv53 arg0@@62)) RefType)
 :qid |funType:invRecv53|
 :pattern ( (invRecv53 arg0@@62))
))) (forall ((arg0@@63 T@U) ) (! (= (type (invRecv52 arg0@@63)) RefType)
 :qid |funType:invRecv52|
 :pattern ( (invRecv52 arg0@@63))
))) (= (type n$0_4) RefType)) (= (type QPMask@3) (MapType1Type RefType realType))) (forall ((arg0@@64 T@U) ) (! (= (type (invRecv51 arg0@@64)) RefType)
 :qid |funType:invRecv51|
 :pattern ( (invRecv51 arg0@@64))
))) (= (type n$0_2_1) RefType)) (= (type QPMask@2) (MapType1Type RefType realType))) (forall ((arg0@@65 T@U) ) (! (= (type (invRecv50 arg0@@65)) RefType)
 :qid |funType:invRecv50|
 :pattern ( (invRecv50 arg0@@65))
))) (forall ((arg0@@66 T@U) ) (! (= (type (invRecv47 arg0@@66)) RefType)
 :qid |funType:invRecv47|
 :pattern ( (invRecv47 arg0@@66))
))) (forall ((arg0@@67 T@U) ) (! (= (type (invRecv46 arg0@@67)) RefType)
 :qid |funType:invRecv46|
 :pattern ( (invRecv46 arg0@@67))
))))
(set-info :boogie-vc-id test_union)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 159) (let ((anon34_correct true))
(let ((anon115_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select g0@@8 n$0_2_1)) (not (= (MapType0Select Heap@@27 n$0_2_1 next) null)))) (= (ControlFlow 0 143) 140)) anon34_correct)))
(let ((anon115_Then_correct  (=> (and (U_2_bool (MapType2Select g0@@8 n$0_2_1)) (not (= (MapType0Select Heap@@27 n$0_2_1 next) null))) (and (=> (= (ControlFlow 0 141) (- 0 142)) (U_2_bool (MapType2Select g0@@8 (MapType0Select Heap@@27 n$0_2_1 next)))) (=> (U_2_bool (MapType2Select g0@@8 (MapType0Select Heap@@27 n$0_2_1 next))) (=> (= (ControlFlow 0 141) 140) anon34_correct))))))
(let ((anon114_Else_correct true))
(let ((anon113_Then_correct  (and (=> (= (ControlFlow 0 144) (- 0 147)) (not (U_2_bool (MapType2Select g0@@8 null)))) (=> (not (U_2_bool (MapType2Select g0@@8 null))) (and (=> (= (ControlFlow 0 144) (- 0 146)) (forall ((n_4 T@U) (n_4_1 T@U) ) (!  (=> (and (= (type n_4) RefType) (= (type n_4_1) RefType)) (=> (and (and (and (and (not (= n_4 n_4_1)) (U_2_bool (MapType2Select g0@@8 n_4))) (U_2_bool (MapType2Select g0@@8 n_4_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_4 n_4_1))))
 :qid |stdinbpl.4434:21|
 :skolemid |501|
 :pattern ( (neverTriggered50 n_4) (neverTriggered50 n_4_1))
))) (=> (forall ((n_4@@0 T@U) (n_4_1@@0 T@U) ) (!  (=> (and (= (type n_4@@0) RefType) (= (type n_4_1@@0) RefType)) (=> (and (and (and (and (not (= n_4@@0 n_4_1@@0)) (U_2_bool (MapType2Select g0@@8 n_4@@0))) (U_2_bool (MapType2Select g0@@8 n_4_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_4@@0 n_4_1@@0))))
 :qid |stdinbpl.4434:21|
 :skolemid |501|
 :pattern ( (neverTriggered50 n_4@@0) (neverTriggered50 n_4_1@@0))
)) (and (=> (= (ControlFlow 0 144) (- 0 145)) (forall ((n_4@@1 T@U) ) (!  (=> (and (= (type n_4@@1) RefType) (U_2_bool (MapType2Select g0@@8 n_4@@1))) (>= (U_2_real (MapType1Select QPMask@1 n_4@@1 next)) FullPerm))
 :qid |stdinbpl.4441:21|
 :skolemid |502|
 :pattern ( (MapType0Select Heap@@27 n_4@@1 next))
 :pattern ( (MapType1Select QPMask@2 n_4@@1 next))
 :pattern ( (MapType0Select Heap@@27 n_4@@1 next))
))) (=> (forall ((n_4@@2 T@U) ) (!  (=> (and (= (type n_4@@2) RefType) (U_2_bool (MapType2Select g0@@8 n_4@@2))) (>= (U_2_real (MapType1Select QPMask@1 n_4@@2 next)) FullPerm))
 :qid |stdinbpl.4441:21|
 :skolemid |502|
 :pattern ( (MapType0Select Heap@@27 n_4@@2 next))
 :pattern ( (MapType1Select QPMask@2 n_4@@2 next))
 :pattern ( (MapType0Select Heap@@27 n_4@@2 next))
)) (=> (and (and (forall ((n_4@@3 T@U) ) (!  (=> (= (type n_4@@3) RefType) (=> (and (U_2_bool (MapType2Select g0@@8 n_4@@3)) (< NoPerm FullPerm)) (and (qpRange50 n_4@@3) (= (invRecv50 n_4@@3) n_4@@3))))
 :qid |stdinbpl.4447:26|
 :skolemid |503|
 :pattern ( (MapType0Select Heap@@27 n_4@@3 next))
 :pattern ( (MapType1Select QPMask@2 n_4@@3 next))
 :pattern ( (MapType0Select Heap@@27 n_4@@3 next))
)) (forall ((o_3 T@U) ) (!  (=> (= (type o_3) RefType) (=> (and (U_2_bool (MapType2Select g0@@8 (invRecv50 o_3))) (and (< NoPerm FullPerm) (qpRange50 o_3))) (= (invRecv50 o_3) o_3)))
 :qid |stdinbpl.4451:26|
 :skolemid |504|
 :pattern ( (invRecv50 o_3))
))) (and (forall ((o_3@@0 T@U) ) (!  (=> (= (type o_3@@0) RefType) (and (=> (and (U_2_bool (MapType2Select g0@@8 (invRecv50 o_3@@0))) (and (< NoPerm FullPerm) (qpRange50 o_3@@0))) (and (= (invRecv50 o_3@@0) o_3@@0) (= (U_2_real (MapType1Select QPMask@2 o_3@@0 next)) (- (U_2_real (MapType1Select QPMask@1 o_3@@0 next)) FullPerm)))) (=> (not (and (U_2_bool (MapType2Select g0@@8 (invRecv50 o_3@@0))) (and (< NoPerm FullPerm) (qpRange50 o_3@@0)))) (= (U_2_real (MapType1Select QPMask@2 o_3@@0 next)) (U_2_real (MapType1Select QPMask@1 o_3@@0 next))))))
 :qid |stdinbpl.4457:26|
 :skolemid |505|
 :pattern ( (MapType1Select QPMask@2 o_3@@0 next))
)) (forall ((o_3@@1 T@U) (f_5 T@U) ) (! (let ((B@@11 (FieldTypeInv1 (type f_5))))
(let ((A@@12 (FieldTypeInv0 (type f_5))))
 (=> (and (and (= (type o_3@@1) RefType) (= (type f_5) (FieldType A@@12 B@@11))) (not (= f_5 next))) (= (U_2_real (MapType1Select QPMask@1 o_3@@1 f_5)) (U_2_real (MapType1Select QPMask@2 o_3@@1 f_5))))))
 :qid |stdinbpl.4463:33|
 :skolemid |506|
 :pattern ( (MapType1Select QPMask@2 o_3@@1 f_5))
)))) (and (and (=> (= (ControlFlow 0 144) 139) anon114_Else_correct) (=> (= (ControlFlow 0 144) 141) anon115_Then_correct)) (=> (= (ControlFlow 0 144) 143) anon115_Else_correct)))))))))))
(let ((anon40_correct true))
(let ((anon118_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select g1@@8 n$0_4)) (not (= (MapType0Select Heap@@27 n$0_4 next) null)))) (= (ControlFlow 0 133) 130)) anon40_correct)))
(let ((anon118_Then_correct  (=> (and (U_2_bool (MapType2Select g1@@8 n$0_4)) (not (= (MapType0Select Heap@@27 n$0_4 next) null))) (and (=> (= (ControlFlow 0 131) (- 0 132)) (U_2_bool (MapType2Select g1@@8 (MapType0Select Heap@@27 n$0_4 next)))) (=> (U_2_bool (MapType2Select g1@@8 (MapType0Select Heap@@27 n$0_4 next))) (=> (= (ControlFlow 0 131) 130) anon40_correct))))))
(let ((anon117_Else_correct true))
(let ((anon116_Then_correct  (and (=> (= (ControlFlow 0 134) (- 0 137)) (not (U_2_bool (MapType2Select g1@@8 null)))) (=> (not (U_2_bool (MapType2Select g1@@8 null))) (and (=> (= (ControlFlow 0 134) (- 0 136)) (forall ((n_5 T@U) (n_5_1 T@U) ) (!  (=> (and (= (type n_5) RefType) (= (type n_5_1) RefType)) (=> (and (and (and (and (not (= n_5 n_5_1)) (U_2_bool (MapType2Select g1@@8 n_5))) (U_2_bool (MapType2Select g1@@8 n_5_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_5 n_5_1))))
 :qid |stdinbpl.4504:21|
 :skolemid |508|
 :pattern ( (neverTriggered51 n_5) (neverTriggered51 n_5_1))
))) (=> (forall ((n_5@@0 T@U) (n_5_1@@0 T@U) ) (!  (=> (and (= (type n_5@@0) RefType) (= (type n_5_1@@0) RefType)) (=> (and (and (and (and (not (= n_5@@0 n_5_1@@0)) (U_2_bool (MapType2Select g1@@8 n_5@@0))) (U_2_bool (MapType2Select g1@@8 n_5_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_5@@0 n_5_1@@0))))
 :qid |stdinbpl.4504:21|
 :skolemid |508|
 :pattern ( (neverTriggered51 n_5@@0) (neverTriggered51 n_5_1@@0))
)) (and (=> (= (ControlFlow 0 134) (- 0 135)) (forall ((n_5@@1 T@U) ) (!  (=> (and (= (type n_5@@1) RefType) (U_2_bool (MapType2Select g1@@8 n_5@@1))) (>= (U_2_real (MapType1Select QPMask@1 n_5@@1 next)) FullPerm))
 :qid |stdinbpl.4511:21|
 :skolemid |509|
 :pattern ( (MapType0Select Heap@@27 n_5@@1 next))
 :pattern ( (MapType1Select QPMask@3 n_5@@1 next))
 :pattern ( (MapType0Select Heap@@27 n_5@@1 next))
))) (=> (forall ((n_5@@2 T@U) ) (!  (=> (and (= (type n_5@@2) RefType) (U_2_bool (MapType2Select g1@@8 n_5@@2))) (>= (U_2_real (MapType1Select QPMask@1 n_5@@2 next)) FullPerm))
 :qid |stdinbpl.4511:21|
 :skolemid |509|
 :pattern ( (MapType0Select Heap@@27 n_5@@2 next))
 :pattern ( (MapType1Select QPMask@3 n_5@@2 next))
 :pattern ( (MapType0Select Heap@@27 n_5@@2 next))
)) (=> (and (and (forall ((n_5@@3 T@U) ) (!  (=> (= (type n_5@@3) RefType) (=> (and (U_2_bool (MapType2Select g1@@8 n_5@@3)) (< NoPerm FullPerm)) (and (qpRange51 n_5@@3) (= (invRecv51 n_5@@3) n_5@@3))))
 :qid |stdinbpl.4517:26|
 :skolemid |510|
 :pattern ( (MapType0Select Heap@@27 n_5@@3 next))
 :pattern ( (MapType1Select QPMask@3 n_5@@3 next))
 :pattern ( (MapType0Select Heap@@27 n_5@@3 next))
)) (forall ((o_3@@2 T@U) ) (!  (=> (= (type o_3@@2) RefType) (=> (and (U_2_bool (MapType2Select g1@@8 (invRecv51 o_3@@2))) (and (< NoPerm FullPerm) (qpRange51 o_3@@2))) (= (invRecv51 o_3@@2) o_3@@2)))
 :qid |stdinbpl.4521:26|
 :skolemid |511|
 :pattern ( (invRecv51 o_3@@2))
))) (and (forall ((o_3@@3 T@U) ) (!  (=> (= (type o_3@@3) RefType) (and (=> (and (U_2_bool (MapType2Select g1@@8 (invRecv51 o_3@@3))) (and (< NoPerm FullPerm) (qpRange51 o_3@@3))) (and (= (invRecv51 o_3@@3) o_3@@3) (= (U_2_real (MapType1Select QPMask@3 o_3@@3 next)) (- (U_2_real (MapType1Select QPMask@1 o_3@@3 next)) FullPerm)))) (=> (not (and (U_2_bool (MapType2Select g1@@8 (invRecv51 o_3@@3))) (and (< NoPerm FullPerm) (qpRange51 o_3@@3)))) (= (U_2_real (MapType1Select QPMask@3 o_3@@3 next)) (U_2_real (MapType1Select QPMask@1 o_3@@3 next))))))
 :qid |stdinbpl.4527:26|
 :skolemid |512|
 :pattern ( (MapType1Select QPMask@3 o_3@@3 next))
)) (forall ((o_3@@4 T@U) (f_5@@0 T@U) ) (! (let ((B@@12 (FieldTypeInv1 (type f_5@@0))))
(let ((A@@13 (FieldTypeInv0 (type f_5@@0))))
 (=> (and (and (= (type o_3@@4) RefType) (= (type f_5@@0) (FieldType A@@13 B@@12))) (not (= f_5@@0 next))) (= (U_2_real (MapType1Select QPMask@1 o_3@@4 f_5@@0)) (U_2_real (MapType1Select QPMask@3 o_3@@4 f_5@@0))))))
 :qid |stdinbpl.4533:33|
 :skolemid |513|
 :pattern ( (MapType1Select QPMask@3 o_3@@4 f_5@@0))
)))) (and (and (=> (= (ControlFlow 0 134) 129) anon117_Else_correct) (=> (= (ControlFlow 0 134) 131) anon118_Then_correct)) (=> (= (ControlFlow 0 134) 133) anon118_Else_correct)))))))))))
(let ((anon55_correct true))
(let ((anon126_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select (|Set#Union| g0@@8 g1@@8) n$1_2)) (not (= (MapType0Select PostHeap@0 n$1_2 next) null)))) (= (ControlFlow 0 119) 116)) anon55_correct)))
(let ((anon126_Then_correct  (=> (and (U_2_bool (MapType2Select (|Set#Union| g0@@8 g1@@8) n$1_2)) (not (= (MapType0Select PostHeap@0 n$1_2 next) null))) (and (=> (= (ControlFlow 0 117) (- 0 118)) (U_2_bool (MapType2Select (|Set#Union| g0@@8 g1@@8) (MapType0Select PostHeap@0 n$1_2 next)))) (=> (U_2_bool (MapType2Select (|Set#Union| g0@@8 g1@@8) (MapType0Select PostHeap@0 n$1_2 next))) (=> (= (ControlFlow 0 117) 116) anon55_correct))))))
(let ((anon125_Else_correct  (=> (and (forall ((n$1_3_1_1 T@U) ) (!  (=> (= (type n$1_3_1_1) RefType) (=> (and (U_2_bool (MapType2Select (|Set#Union| g0@@8 g1@@8) n$1_3_1_1)) (not (= (MapType0Select PostHeap@0 n$1_3_1_1 next) null))) (U_2_bool (MapType2Select (|Set#Union| g0@@8 g1@@8) (MapType0Select PostHeap@0 n$1_3_1_1 next)))))
 :qid |stdinbpl.4684:24|
 :skolemid |528|
 :pattern ( (MapType2Select (|Set#Union| g0@@8 g1@@8) (MapType0Select PostHeap@0 n$1_3_1_1 next)))
 :pattern ( (MapType2Select (|Set#Union| g0@@8 g1@@8) n$1_3_1_1) (MapType0Select PostHeap@0 n$1_3_1_1 next))
)) (= (ControlFlow 0 115) (- 0 114))) (|Set#Subset| (|Set#UnionOne| (|Set#Singleton| x1@@7) x0@@10) (|Set#Union| g0@@8 g1@@8)))))
(let ((anon124_Then_correct  (and (=> (= (ControlFlow 0 120) (- 0 123)) (not (U_2_bool (MapType2Select (|Set#Union| g0@@8 g1@@8) null)))) (=> (not (U_2_bool (MapType2Select (|Set#Union| g0@@8 g1@@8) null))) (and (=> (= (ControlFlow 0 120) (- 0 122)) (forall ((n$0_6 T@U) (n$0_6_1 T@U) ) (!  (=> (and (= (type n$0_6) RefType) (= (type n$0_6_1) RefType)) (=> (and (and (and (and (not (= n$0_6 n$0_6_1)) (U_2_bool (MapType2Select (|Set#Union| g0@@8 g1@@8) n$0_6))) (U_2_bool (MapType2Select (|Set#Union| g0@@8 g1@@8) n$0_6_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$0_6 n$0_6_1))))
 :qid |stdinbpl.4643:21|
 :skolemid |522|
 :pattern ( (neverTriggered53 n$0_6) (neverTriggered53 n$0_6_1))
))) (=> (forall ((n$0_6@@0 T@U) (n$0_6_1@@0 T@U) ) (!  (=> (and (= (type n$0_6@@0) RefType) (= (type n$0_6_1@@0) RefType)) (=> (and (and (and (and (not (= n$0_6@@0 n$0_6_1@@0)) (U_2_bool (MapType2Select (|Set#Union| g0@@8 g1@@8) n$0_6@@0))) (U_2_bool (MapType2Select (|Set#Union| g0@@8 g1@@8) n$0_6_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$0_6@@0 n$0_6_1@@0))))
 :qid |stdinbpl.4643:21|
 :skolemid |522|
 :pattern ( (neverTriggered53 n$0_6@@0) (neverTriggered53 n$0_6_1@@0))
)) (and (=> (= (ControlFlow 0 120) (- 0 121)) (forall ((n$0_6@@1 T@U) ) (!  (=> (and (= (type n$0_6@@1) RefType) (U_2_bool (MapType2Select (|Set#Union| g0@@8 g1@@8) n$0_6@@1))) (>= (U_2_real (MapType1Select QPMask@10 n$0_6@@1 next)) FullPerm))
 :qid |stdinbpl.4650:21|
 :skolemid |523|
 :pattern ( (MapType0Select PostHeap@0 n$0_6@@1 next))
 :pattern ( (MapType1Select QPMask@11 n$0_6@@1 next))
 :pattern ( (MapType0Select PostHeap@0 n$0_6@@1 next))
))) (=> (forall ((n$0_6@@2 T@U) ) (!  (=> (and (= (type n$0_6@@2) RefType) (U_2_bool (MapType2Select (|Set#Union| g0@@8 g1@@8) n$0_6@@2))) (>= (U_2_real (MapType1Select QPMask@10 n$0_6@@2 next)) FullPerm))
 :qid |stdinbpl.4650:21|
 :skolemid |523|
 :pattern ( (MapType0Select PostHeap@0 n$0_6@@2 next))
 :pattern ( (MapType1Select QPMask@11 n$0_6@@2 next))
 :pattern ( (MapType0Select PostHeap@0 n$0_6@@2 next))
)) (=> (and (and (forall ((n$0_6@@3 T@U) ) (!  (=> (= (type n$0_6@@3) RefType) (=> (and (U_2_bool (MapType2Select (|Set#Union| g0@@8 g1@@8) n$0_6@@3)) (< NoPerm FullPerm)) (and (qpRange53 n$0_6@@3) (= (invRecv53 n$0_6@@3) n$0_6@@3))))
 :qid |stdinbpl.4656:26|
 :skolemid |524|
 :pattern ( (MapType0Select PostHeap@0 n$0_6@@3 next))
 :pattern ( (MapType1Select QPMask@11 n$0_6@@3 next))
 :pattern ( (MapType0Select PostHeap@0 n$0_6@@3 next))
)) (forall ((o_3@@5 T@U) ) (!  (=> (= (type o_3@@5) RefType) (=> (and (U_2_bool (MapType2Select (|Set#Union| g0@@8 g1@@8) (invRecv53 o_3@@5))) (and (< NoPerm FullPerm) (qpRange53 o_3@@5))) (= (invRecv53 o_3@@5) o_3@@5)))
 :qid |stdinbpl.4660:26|
 :skolemid |525|
 :pattern ( (invRecv53 o_3@@5))
))) (and (forall ((o_3@@6 T@U) ) (!  (=> (= (type o_3@@6) RefType) (and (=> (and (U_2_bool (MapType2Select (|Set#Union| g0@@8 g1@@8) (invRecv53 o_3@@6))) (and (< NoPerm FullPerm) (qpRange53 o_3@@6))) (and (= (invRecv53 o_3@@6) o_3@@6) (= (U_2_real (MapType1Select QPMask@11 o_3@@6 next)) (- (U_2_real (MapType1Select QPMask@10 o_3@@6 next)) FullPerm)))) (=> (not (and (U_2_bool (MapType2Select (|Set#Union| g0@@8 g1@@8) (invRecv53 o_3@@6))) (and (< NoPerm FullPerm) (qpRange53 o_3@@6)))) (= (U_2_real (MapType1Select QPMask@11 o_3@@6 next)) (U_2_real (MapType1Select QPMask@10 o_3@@6 next))))))
 :qid |stdinbpl.4666:26|
 :skolemid |526|
 :pattern ( (MapType1Select QPMask@11 o_3@@6 next))
)) (forall ((o_3@@7 T@U) (f_5@@1 T@U) ) (! (let ((B@@13 (FieldTypeInv1 (type f_5@@1))))
(let ((A@@14 (FieldTypeInv0 (type f_5@@1))))
 (=> (and (and (= (type o_3@@7) RefType) (= (type f_5@@1) (FieldType A@@14 B@@13))) (not (= f_5@@1 next))) (= (U_2_real (MapType1Select QPMask@10 o_3@@7 f_5@@1)) (U_2_real (MapType1Select QPMask@11 o_3@@7 f_5@@1))))))
 :qid |stdinbpl.4672:33|
 :skolemid |527|
 :pattern ( (MapType1Select QPMask@11 o_3@@7 f_5@@1))
)))) (and (and (=> (= (ControlFlow 0 120) 115) anon125_Else_correct) (=> (= (ControlFlow 0 120) 117) anon126_Then_correct)) (=> (= (ControlFlow 0 120) 119) anon126_Else_correct)))))))))))
(let ((anon61_correct true))
(let ((anon129_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select (|Set#Union| g0@@8 g1@@8) n$0_7_1)) (not (= (MapType0Select PostHeap@0 n$0_7_1 next) null)))) (= (ControlFlow 0 108) 105)) anon61_correct)))
(let ((anon129_Then_correct  (=> (and (U_2_bool (MapType2Select (|Set#Union| g0@@8 g1@@8) n$0_7_1)) (not (= (MapType0Select PostHeap@0 n$0_7_1 next) null))) (and (=> (= (ControlFlow 0 106) (- 0 107)) (U_2_bool (MapType2Select (|Set#Union| g0@@8 g1@@8) (MapType0Select PostHeap@0 n$0_7_1 next)))) (=> (U_2_bool (MapType2Select (|Set#Union| g0@@8 g1@@8) (MapType0Select PostHeap@0 n$0_7_1 next))) (=> (= (ControlFlow 0 106) 105) anon61_correct))))))
(let ((anon128_Else_correct true))
(let ((anon127_Then_correct  (and (=> (= (ControlFlow 0 109) (- 0 112)) (not (U_2_bool (MapType2Select (|Set#Union| g0@@8 g1@@8) null)))) (=> (not (U_2_bool (MapType2Select (|Set#Union| g0@@8 g1@@8) null))) (and (=> (= (ControlFlow 0 109) (- 0 111)) (forall ((n_6 T@U) (n_6_1 T@U) ) (!  (=> (and (= (type n_6) RefType) (= (type n_6_1) RefType)) (=> (and (and (and (and (not (= n_6 n_6_1)) (U_2_bool (MapType2Select (|Set#Union| g0@@8 g1@@8) n_6))) (U_2_bool (MapType2Select (|Set#Union| g0@@8 g1@@8) n_6_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_6 n_6_1))))
 :qid |stdinbpl.4715:21|
 :skolemid |529|
 :pattern ( (neverTriggered54 n_6) (neverTriggered54 n_6_1))
))) (=> (forall ((n_6@@0 T@U) (n_6_1@@0 T@U) ) (!  (=> (and (= (type n_6@@0) RefType) (= (type n_6_1@@0) RefType)) (=> (and (and (and (and (not (= n_6@@0 n_6_1@@0)) (U_2_bool (MapType2Select (|Set#Union| g0@@8 g1@@8) n_6@@0))) (U_2_bool (MapType2Select (|Set#Union| g0@@8 g1@@8) n_6_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_6@@0 n_6_1@@0))))
 :qid |stdinbpl.4715:21|
 :skolemid |529|
 :pattern ( (neverTriggered54 n_6@@0) (neverTriggered54 n_6_1@@0))
)) (and (=> (= (ControlFlow 0 109) (- 0 110)) (forall ((n_6@@1 T@U) ) (!  (=> (and (= (type n_6@@1) RefType) (U_2_bool (MapType2Select (|Set#Union| g0@@8 g1@@8) n_6@@1))) (>= (U_2_real (MapType1Select QPMask@10 n_6@@1 next)) FullPerm))
 :qid |stdinbpl.4722:21|
 :skolemid |530|
 :pattern ( (MapType0Select PostHeap@0 n_6@@1 next))
 :pattern ( (MapType1Select QPMask@12 n_6@@1 next))
 :pattern ( (MapType0Select PostHeap@0 n_6@@1 next))
))) (=> (forall ((n_6@@2 T@U) ) (!  (=> (and (= (type n_6@@2) RefType) (U_2_bool (MapType2Select (|Set#Union| g0@@8 g1@@8) n_6@@2))) (>= (U_2_real (MapType1Select QPMask@10 n_6@@2 next)) FullPerm))
 :qid |stdinbpl.4722:21|
 :skolemid |530|
 :pattern ( (MapType0Select PostHeap@0 n_6@@2 next))
 :pattern ( (MapType1Select QPMask@12 n_6@@2 next))
 :pattern ( (MapType0Select PostHeap@0 n_6@@2 next))
)) (=> (and (and (forall ((n_6@@3 T@U) ) (!  (=> (= (type n_6@@3) RefType) (=> (and (U_2_bool (MapType2Select (|Set#Union| g0@@8 g1@@8) n_6@@3)) (< NoPerm FullPerm)) (and (qpRange54 n_6@@3) (= (invRecv54 n_6@@3) n_6@@3))))
 :qid |stdinbpl.4728:26|
 :skolemid |531|
 :pattern ( (MapType0Select PostHeap@0 n_6@@3 next))
 :pattern ( (MapType1Select QPMask@12 n_6@@3 next))
 :pattern ( (MapType0Select PostHeap@0 n_6@@3 next))
)) (forall ((o_3@@8 T@U) ) (!  (=> (= (type o_3@@8) RefType) (=> (and (U_2_bool (MapType2Select (|Set#Union| g0@@8 g1@@8) (invRecv54 o_3@@8))) (and (< NoPerm FullPerm) (qpRange54 o_3@@8))) (= (invRecv54 o_3@@8) o_3@@8)))
 :qid |stdinbpl.4732:26|
 :skolemid |532|
 :pattern ( (invRecv54 o_3@@8))
))) (and (forall ((o_3@@9 T@U) ) (!  (=> (= (type o_3@@9) RefType) (and (=> (and (U_2_bool (MapType2Select (|Set#Union| g0@@8 g1@@8) (invRecv54 o_3@@9))) (and (< NoPerm FullPerm) (qpRange54 o_3@@9))) (and (= (invRecv54 o_3@@9) o_3@@9) (= (U_2_real (MapType1Select QPMask@12 o_3@@9 next)) (- (U_2_real (MapType1Select QPMask@10 o_3@@9 next)) FullPerm)))) (=> (not (and (U_2_bool (MapType2Select (|Set#Union| g0@@8 g1@@8) (invRecv54 o_3@@9))) (and (< NoPerm FullPerm) (qpRange54 o_3@@9)))) (= (U_2_real (MapType1Select QPMask@12 o_3@@9 next)) (U_2_real (MapType1Select QPMask@10 o_3@@9 next))))))
 :qid |stdinbpl.4738:26|
 :skolemid |533|
 :pattern ( (MapType1Select QPMask@12 o_3@@9 next))
)) (forall ((o_3@@10 T@U) (f_5@@2 T@U) ) (! (let ((B@@14 (FieldTypeInv1 (type f_5@@2))))
(let ((A@@15 (FieldTypeInv0 (type f_5@@2))))
 (=> (and (and (= (type o_3@@10) RefType) (= (type f_5@@2) (FieldType A@@15 B@@14))) (not (= f_5@@2 next))) (= (U_2_real (MapType1Select QPMask@10 o_3@@10 f_5@@2)) (U_2_real (MapType1Select QPMask@12 o_3@@10 f_5@@2))))))
 :qid |stdinbpl.4744:33|
 :skolemid |534|
 :pattern ( (MapType1Select QPMask@12 o_3@@10 f_5@@2))
)))) (and (and (=> (= (ControlFlow 0 109) 104) anon128_Else_correct) (=> (= (ControlFlow 0 109) 106) anon129_Then_correct)) (=> (= (ControlFlow 0 109) 108) anon129_Else_correct)))))))))))
(let ((anon131_Else_correct true))
(let ((anon131_Then_correct true))
(let ((anon130_Else_correct  (=> (forall ((r$1_1 T@U) ) (!  (=> (and (= (type r$1_1) RefType) (U_2_bool (MapType2Select g0@@8 r$1_1))) (not (U_2_bool (MapType2Select g1@@8 r$1_1))))
 :qid |stdinbpl.4774:20|
 :skolemid |536|
 :pattern ( (MapType2Select g0@@8 r$1_1) (MapType2Select g1@@8 r$1_1))
)) (and (=> (= (ControlFlow 0 102) 100) anon131_Then_correct) (=> (= (ControlFlow 0 102) 101) anon131_Else_correct)))))
(let ((anon130_Then_correct true))
(let ((anon127_Else_correct  (=> (and (acyclic_list_segment PostHeap@0 (|Set#Union| g0@@8 g1@@8)) (state PostHeap@0 QPMask@10)) (and (=> (= (ControlFlow 0 103) 99) anon130_Then_correct) (=> (= (ControlFlow 0 103) 102) anon130_Else_correct)))))
(let ((anon124_Else_correct  (=> (is_global_sroot PostHeap@0 (|Set#Union| g0@@8 g1@@8) (|Set#UnionOne| (|Set#Singleton| x1@@7) x0@@10)) (=> (and (state PostHeap@0 QPMask@10) (state PostHeap@0 QPMask@10)) (and (=> (= (ControlFlow 0 113) 109) anon127_Then_correct) (=> (= (ControlFlow 0 113) 103) anon127_Else_correct))))))
(let ((anon121_Else_correct  (=> (forall ((n$6_1 T@U) ) (!  (=> (= (type n$6_1) RefType) (=> (and (U_2_bool (MapType2Select (|Set#Union| g0@@8 g1@@8) n$6_1)) (not (= (MapType0Select PostHeap@0 n$6_1 next) null))) (U_2_bool (MapType2Select (|Set#Union| g0@@8 g1@@8) (MapType0Select PostHeap@0 n$6_1 next)))))
 :qid |stdinbpl.4622:20|
 :skolemid |521|
 :pattern ( (MapType2Select (|Set#Union| g0@@8 g1@@8) (MapType0Select PostHeap@0 n$6_1 next)))
 :pattern ( (MapType2Select (|Set#Union| g0@@8 g1@@8) n$6_1) (MapType0Select PostHeap@0 n$6_1 next))
)) (=> (and (state PostHeap@0 QPMask@10) (state PostHeap@0 QPMask@10)) (and (=> (= (ControlFlow 0 124) 120) anon124_Then_correct) (=> (= (ControlFlow 0 124) 113) anon124_Else_correct))))))
(let ((anon50_correct true))
(let ((anon123_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select (|Set#Union| g0@@8 g1@@8) n$6)) (not (= (MapType0Select PostHeap@0 n$6 next) null)))) (= (ControlFlow 0 95) 92)) anon50_correct)))
(let ((anon123_Then_correct  (=> (and (U_2_bool (MapType2Select (|Set#Union| g0@@8 g1@@8) n$6)) (not (= (MapType0Select PostHeap@0 n$6 next) null))) (and (=> (= (ControlFlow 0 93) (- 0 94)) (HasDirectPerm QPMask@10 n$6 next)) (=> (HasDirectPerm QPMask@10 n$6 next) (=> (= (ControlFlow 0 93) 92) anon50_correct))))))
(let ((anon122_Else_correct  (=> (not (U_2_bool (MapType2Select (|Set#Union| g0@@8 g1@@8) n$6))) (and (=> (= (ControlFlow 0 98) 93) anon123_Then_correct) (=> (= (ControlFlow 0 98) 95) anon123_Else_correct)))))
(let ((anon122_Then_correct  (=> (U_2_bool (MapType2Select (|Set#Union| g0@@8 g1@@8) n$6)) (and (=> (= (ControlFlow 0 96) (- 0 97)) (HasDirectPerm QPMask@10 n$6 next)) (=> (HasDirectPerm QPMask@10 n$6 next) (and (=> (= (ControlFlow 0 96) 93) anon123_Then_correct) (=> (= (ControlFlow 0 96) 95) anon123_Else_correct)))))))
(let ((anon120_Else_correct  (and (=> (= (ControlFlow 0 125) (- 0 126)) (forall ((n$5_1 T@U) (n$5_1_1 T@U) ) (!  (=> (and (= (type n$5_1) RefType) (= (type n$5_1_1) RefType)) (=> (and (and (and (and (not (= n$5_1 n$5_1_1)) (U_2_bool (MapType2Select (|Set#Union| g0@@8 g1@@8) n$5_1))) (U_2_bool (MapType2Select (|Set#Union| g0@@8 g1@@8) n$5_1_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$5_1 n$5_1_1))))
 :qid |stdinbpl.4577:15|
 :skolemid |515|
 :no-pattern (type n$5_1)
 :no-pattern (type n$5_1_1)
 :no-pattern (U_2_int n$5_1)
 :no-pattern (U_2_bool n$5_1)
 :no-pattern (U_2_int n$5_1_1)
 :no-pattern (U_2_bool n$5_1_1)
))) (=> (forall ((n$5_1@@0 T@U) (n$5_1_1@@0 T@U) ) (!  (=> (and (= (type n$5_1@@0) RefType) (= (type n$5_1_1@@0) RefType)) (=> (and (and (and (and (not (= n$5_1@@0 n$5_1_1@@0)) (U_2_bool (MapType2Select (|Set#Union| g0@@8 g1@@8) n$5_1@@0))) (U_2_bool (MapType2Select (|Set#Union| g0@@8 g1@@8) n$5_1_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$5_1@@0 n$5_1_1@@0))))
 :qid |stdinbpl.4577:15|
 :skolemid |515|
 :no-pattern (type n$5_1@@0)
 :no-pattern (type n$5_1_1@@0)
 :no-pattern (U_2_int n$5_1@@0)
 :no-pattern (U_2_bool n$5_1@@0)
 :no-pattern (U_2_int n$5_1_1@@0)
 :no-pattern (U_2_bool n$5_1_1@@0)
)) (=> (and (forall ((n$5_1@@1 T@U) ) (!  (=> (= (type n$5_1@@1) RefType) (=> (and (U_2_bool (MapType2Select (|Set#Union| g0@@8 g1@@8) n$5_1@@1)) (< NoPerm FullPerm)) (and (qpRange52 n$5_1@@1) (= (invRecv52 n$5_1@@1) n$5_1@@1))))
 :qid |stdinbpl.4583:22|
 :skolemid |516|
 :pattern ( (MapType0Select PostHeap@0 n$5_1@@1 next))
 :pattern ( (MapType1Select QPMask@10 n$5_1@@1 next))
 :pattern ( (MapType0Select PostHeap@0 n$5_1@@1 next))
)) (forall ((o_3@@11 T@U) ) (!  (=> (= (type o_3@@11) RefType) (=> (and (and (U_2_bool (MapType2Select (|Set#Union| g0@@8 g1@@8) (invRecv52 o_3@@11))) (< NoPerm FullPerm)) (qpRange52 o_3@@11)) (= (invRecv52 o_3@@11) o_3@@11)))
 :qid |stdinbpl.4587:22|
 :skolemid |517|
 :pattern ( (invRecv52 o_3@@11))
))) (=> (and (and (forall ((n$5_1@@2 T@U) ) (!  (=> (and (= (type n$5_1@@2) RefType) (U_2_bool (MapType2Select (|Set#Union| g0@@8 g1@@8) n$5_1@@2))) (not (= n$5_1@@2 null)))
 :qid |stdinbpl.4593:22|
 :skolemid |518|
 :pattern ( (MapType0Select PostHeap@0 n$5_1@@2 next))
 :pattern ( (MapType1Select QPMask@10 n$5_1@@2 next))
 :pattern ( (MapType0Select PostHeap@0 n$5_1@@2 next))
)) (forall ((o_3@@12 T@U) ) (!  (=> (= (type o_3@@12) RefType) (and (=> (and (and (U_2_bool (MapType2Select (|Set#Union| g0@@8 g1@@8) (invRecv52 o_3@@12))) (< NoPerm FullPerm)) (qpRange52 o_3@@12)) (and (=> (< NoPerm FullPerm) (= (invRecv52 o_3@@12) o_3@@12)) (= (U_2_real (MapType1Select QPMask@10 o_3@@12 next)) (+ (U_2_real (MapType1Select ZeroMask o_3@@12 next)) FullPerm)))) (=> (not (and (and (U_2_bool (MapType2Select (|Set#Union| g0@@8 g1@@8) (invRecv52 o_3@@12))) (< NoPerm FullPerm)) (qpRange52 o_3@@12))) (= (U_2_real (MapType1Select QPMask@10 o_3@@12 next)) (U_2_real (MapType1Select ZeroMask o_3@@12 next))))))
 :qid |stdinbpl.4599:22|
 :skolemid |519|
 :pattern ( (MapType1Select QPMask@10 o_3@@12 next))
))) (and (forall ((o_3@@13 T@U) (f_5@@3 T@U) ) (! (let ((B@@15 (FieldTypeInv1 (type f_5@@3))))
(let ((A@@16 (FieldTypeInv0 (type f_5@@3))))
 (=> (and (and (= (type o_3@@13) RefType) (= (type f_5@@3) (FieldType A@@16 B@@15))) (not (= f_5@@3 next))) (= (U_2_real (MapType1Select ZeroMask o_3@@13 f_5@@3)) (U_2_real (MapType1Select QPMask@10 o_3@@13 f_5@@3))))))
 :qid |stdinbpl.4603:29|
 :skolemid |520|
 :pattern ( (MapType1Select ZeroMask o_3@@13 f_5@@3))
 :pattern ( (MapType1Select QPMask@10 o_3@@13 f_5@@3))
)) (state PostHeap@0 QPMask@10))) (and (and (=> (= (ControlFlow 0 125) 124) anon121_Else_correct) (=> (= (ControlFlow 0 125) 96) anon122_Then_correct)) (=> (= (ControlFlow 0 125) 98) anon122_Else_correct))))))))
(let ((anon120_Then_correct true))
(let ((anon119_Then_correct  (=> (and (state PostHeap@0 ZeroMask) (not (U_2_bool (MapType2Select (|Set#Union| g0@@8 g1@@8) null)))) (and (=> (= (ControlFlow 0 127) 91) anon120_Then_correct) (=> (= (ControlFlow 0 127) 125) anon120_Else_correct)))))
(let ((anon76_correct true))
(let ((anon136_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select g1@@8 n$2_2)) (not (= (MapType0Select Heap@@27 n$2_2 next) null)))) (= (ControlFlow 0 81) 78)) anon76_correct)))
(let ((anon136_Then_correct  (=> (and (U_2_bool (MapType2Select g1@@8 n$2_2)) (not (= (MapType0Select Heap@@27 n$2_2 next) null))) (and (=> (= (ControlFlow 0 79) (- 0 80)) (U_2_bool (MapType2Select g1@@8 (MapType0Select Heap@@27 n$2_2 next)))) (=> (U_2_bool (MapType2Select g1@@8 (MapType0Select Heap@@27 n$2_2 next))) (=> (= (ControlFlow 0 79) 78) anon76_correct))))))
(let ((anon135_Else_correct  (=> (and (forall ((n$2_3_1 T@U) ) (!  (=> (= (type n$2_3_1) RefType) (=> (and (U_2_bool (MapType2Select g1@@8 n$2_3_1)) (not (= (MapType0Select Heap@@27 n$2_3_1 next) null))) (U_2_bool (MapType2Select g1@@8 (MapType0Select Heap@@27 n$2_3_1 next)))))
 :qid |stdinbpl.4904:24|
 :skolemid |551|
 :pattern ( (MapType2Select g1@@8 (MapType0Select Heap@@27 n$2_3_1 next)))
 :pattern ( (MapType2Select g1@@8 n$2_3_1) (MapType0Select Heap@@27 n$2_3_1 next))
)) (= (ControlFlow 0 77) (- 0 76))) (|Set#Equal| (|Set#Intersection| g1@@8 g0@@8) (|Set#Empty| RefType)))))
(let ((anon133_Else_correct  (=> (forall ((n$0_10_1 T@U) ) (!  (=> (= (type n$0_10_1) RefType) (=> (and (U_2_bool (MapType2Select g0@@8 n$0_10_1)) (not (= (MapType0Select Heap@@27 n$0_10_1 next) null))) (U_2_bool (MapType2Select g0@@8 (MapType0Select Heap@@27 n$0_10_1 next)))))
 :qid |stdinbpl.4850:24|
 :skolemid |544|
 :pattern ( (MapType2Select g0@@8 (MapType0Select Heap@@27 n$0_10_1 next)))
 :pattern ( (MapType2Select g0@@8 n$0_10_1) (MapType0Select Heap@@27 n$0_10_1 next))
)) (and (=> (= (ControlFlow 0 82) (- 0 85)) (not (U_2_bool (MapType2Select g1@@8 null)))) (=> (not (U_2_bool (MapType2Select g1@@8 null))) (and (=> (= (ControlFlow 0 82) (- 0 84)) (forall ((n$1_4 T@U) (n$1_4_1 T@U) ) (!  (=> (and (= (type n$1_4) RefType) (= (type n$1_4_1) RefType)) (=> (and (and (and (and (not (= n$1_4 n$1_4_1)) (U_2_bool (MapType2Select g1@@8 n$1_4))) (U_2_bool (MapType2Select g1@@8 n$1_4_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$1_4 n$1_4_1))))
 :qid |stdinbpl.4863:21|
 :skolemid |545|
 :pattern ( (neverTriggered57 n$1_4) (neverTriggered57 n$1_4_1))
))) (=> (forall ((n$1_4@@0 T@U) (n$1_4_1@@0 T@U) ) (!  (=> (and (= (type n$1_4@@0) RefType) (= (type n$1_4_1@@0) RefType)) (=> (and (and (and (and (not (= n$1_4@@0 n$1_4_1@@0)) (U_2_bool (MapType2Select g1@@8 n$1_4@@0))) (U_2_bool (MapType2Select g1@@8 n$1_4_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$1_4@@0 n$1_4_1@@0))))
 :qid |stdinbpl.4863:21|
 :skolemid |545|
 :pattern ( (neverTriggered57 n$1_4@@0) (neverTriggered57 n$1_4_1@@0))
)) (and (=> (= (ControlFlow 0 82) (- 0 83)) (forall ((n$1_4@@1 T@U) ) (!  (=> (and (= (type n$1_4@@1) RefType) (U_2_bool (MapType2Select g1@@8 n$1_4@@1))) (>= (U_2_real (MapType1Select QPMask@4 n$1_4@@1 next)) FullPerm))
 :qid |stdinbpl.4870:21|
 :skolemid |546|
 :pattern ( (MapType0Select Heap@@27 n$1_4@@1 next))
 :pattern ( (MapType1Select QPMask@9 n$1_4@@1 next))
 :pattern ( (MapType0Select Heap@@27 n$1_4@@1 next))
))) (=> (forall ((n$1_4@@2 T@U) ) (!  (=> (and (= (type n$1_4@@2) RefType) (U_2_bool (MapType2Select g1@@8 n$1_4@@2))) (>= (U_2_real (MapType1Select QPMask@4 n$1_4@@2 next)) FullPerm))
 :qid |stdinbpl.4870:21|
 :skolemid |546|
 :pattern ( (MapType0Select Heap@@27 n$1_4@@2 next))
 :pattern ( (MapType1Select QPMask@9 n$1_4@@2 next))
 :pattern ( (MapType0Select Heap@@27 n$1_4@@2 next))
)) (=> (and (and (forall ((n$1_4@@3 T@U) ) (!  (=> (= (type n$1_4@@3) RefType) (=> (and (U_2_bool (MapType2Select g1@@8 n$1_4@@3)) (< NoPerm FullPerm)) (and (qpRange57 n$1_4@@3) (= (invRecv57 n$1_4@@3) n$1_4@@3))))
 :qid |stdinbpl.4876:26|
 :skolemid |547|
 :pattern ( (MapType0Select Heap@@27 n$1_4@@3 next))
 :pattern ( (MapType1Select QPMask@9 n$1_4@@3 next))
 :pattern ( (MapType0Select Heap@@27 n$1_4@@3 next))
)) (forall ((o_3@@14 T@U) ) (!  (=> (= (type o_3@@14) RefType) (=> (and (U_2_bool (MapType2Select g1@@8 (invRecv57 o_3@@14))) (and (< NoPerm FullPerm) (qpRange57 o_3@@14))) (= (invRecv57 o_3@@14) o_3@@14)))
 :qid |stdinbpl.4880:26|
 :skolemid |548|
 :pattern ( (invRecv57 o_3@@14))
))) (and (forall ((o_3@@15 T@U) ) (!  (=> (= (type o_3@@15) RefType) (and (=> (and (U_2_bool (MapType2Select g1@@8 (invRecv57 o_3@@15))) (and (< NoPerm FullPerm) (qpRange57 o_3@@15))) (and (= (invRecv57 o_3@@15) o_3@@15) (= (U_2_real (MapType1Select QPMask@9 o_3@@15 next)) (- (U_2_real (MapType1Select QPMask@4 o_3@@15 next)) FullPerm)))) (=> (not (and (U_2_bool (MapType2Select g1@@8 (invRecv57 o_3@@15))) (and (< NoPerm FullPerm) (qpRange57 o_3@@15)))) (= (U_2_real (MapType1Select QPMask@9 o_3@@15 next)) (U_2_real (MapType1Select QPMask@4 o_3@@15 next))))))
 :qid |stdinbpl.4886:26|
 :skolemid |549|
 :pattern ( (MapType1Select QPMask@9 o_3@@15 next))
)) (forall ((o_3@@16 T@U) (f_5@@4 T@U) ) (! (let ((B@@16 (FieldTypeInv1 (type f_5@@4))))
(let ((A@@17 (FieldTypeInv0 (type f_5@@4))))
 (=> (and (and (= (type o_3@@16) RefType) (= (type f_5@@4) (FieldType A@@17 B@@16))) (not (= f_5@@4 next))) (= (U_2_real (MapType1Select QPMask@4 o_3@@16 f_5@@4)) (U_2_real (MapType1Select QPMask@9 o_3@@16 f_5@@4))))))
 :qid |stdinbpl.4892:33|
 :skolemid |550|
 :pattern ( (MapType1Select QPMask@9 o_3@@16 f_5@@4))
)))) (and (and (=> (= (ControlFlow 0 82) 77) anon135_Else_correct) (=> (= (ControlFlow 0 82) 79) anon136_Then_correct)) (=> (= (ControlFlow 0 82) 81) anon136_Else_correct))))))))))))
(let ((anon72_correct true))
(let ((anon134_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select g0@@8 n$0_9_1)) (not (= (MapType0Select Heap@@27 n$0_9_1 next) null)))) (= (ControlFlow 0 75) 72)) anon72_correct)))
(let ((anon134_Then_correct  (=> (and (U_2_bool (MapType2Select g0@@8 n$0_9_1)) (not (= (MapType0Select Heap@@27 n$0_9_1 next) null))) (and (=> (= (ControlFlow 0 73) (- 0 74)) (U_2_bool (MapType2Select g0@@8 (MapType0Select Heap@@27 n$0_9_1 next)))) (=> (U_2_bool (MapType2Select g0@@8 (MapType0Select Heap@@27 n$0_9_1 next))) (=> (= (ControlFlow 0 73) 72) anon72_correct))))))
(let ((anon132_Then_correct  (and (=> (= (ControlFlow 0 86) (- 0 89)) (not (U_2_bool (MapType2Select g0@@8 null)))) (=> (not (U_2_bool (MapType2Select g0@@8 null))) (and (=> (= (ControlFlow 0 86) (- 0 88)) (forall ((n_7 T@U) (n_7_1 T@U) ) (!  (=> (and (= (type n_7) RefType) (= (type n_7_1) RefType)) (=> (and (and (and (and (not (= n_7 n_7_1)) (U_2_bool (MapType2Select g0@@8 n_7))) (U_2_bool (MapType2Select g0@@8 n_7_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_7 n_7_1))))
 :qid |stdinbpl.4809:21|
 :skolemid |538|
 :pattern ( (neverTriggered56 n_7) (neverTriggered56 n_7_1))
))) (=> (forall ((n_7@@0 T@U) (n_7_1@@0 T@U) ) (!  (=> (and (= (type n_7@@0) RefType) (= (type n_7_1@@0) RefType)) (=> (and (and (and (and (not (= n_7@@0 n_7_1@@0)) (U_2_bool (MapType2Select g0@@8 n_7@@0))) (U_2_bool (MapType2Select g0@@8 n_7_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_7@@0 n_7_1@@0))))
 :qid |stdinbpl.4809:21|
 :skolemid |538|
 :pattern ( (neverTriggered56 n_7@@0) (neverTriggered56 n_7_1@@0))
)) (and (=> (= (ControlFlow 0 86) (- 0 87)) (forall ((n_7@@1 T@U) ) (!  (=> (and (= (type n_7@@1) RefType) (U_2_bool (MapType2Select g0@@8 n_7@@1))) (>= (U_2_real (MapType1Select QPMask@1 n_7@@1 next)) FullPerm))
 :qid |stdinbpl.4816:21|
 :skolemid |539|
 :pattern ( (MapType0Select Heap@@27 n_7@@1 next))
 :pattern ( (MapType1Select QPMask@4 n_7@@1 next))
 :pattern ( (MapType0Select Heap@@27 n_7@@1 next))
))) (=> (forall ((n_7@@2 T@U) ) (!  (=> (and (= (type n_7@@2) RefType) (U_2_bool (MapType2Select g0@@8 n_7@@2))) (>= (U_2_real (MapType1Select QPMask@1 n_7@@2 next)) FullPerm))
 :qid |stdinbpl.4816:21|
 :skolemid |539|
 :pattern ( (MapType0Select Heap@@27 n_7@@2 next))
 :pattern ( (MapType1Select QPMask@4 n_7@@2 next))
 :pattern ( (MapType0Select Heap@@27 n_7@@2 next))
)) (=> (and (and (forall ((n_7@@3 T@U) ) (!  (=> (= (type n_7@@3) RefType) (=> (and (U_2_bool (MapType2Select g0@@8 n_7@@3)) (< NoPerm FullPerm)) (and (qpRange56 n_7@@3) (= (invRecv56 n_7@@3) n_7@@3))))
 :qid |stdinbpl.4822:26|
 :skolemid |540|
 :pattern ( (MapType0Select Heap@@27 n_7@@3 next))
 :pattern ( (MapType1Select QPMask@4 n_7@@3 next))
 :pattern ( (MapType0Select Heap@@27 n_7@@3 next))
)) (forall ((o_3@@17 T@U) ) (!  (=> (= (type o_3@@17) RefType) (=> (and (U_2_bool (MapType2Select g0@@8 (invRecv56 o_3@@17))) (and (< NoPerm FullPerm) (qpRange56 o_3@@17))) (= (invRecv56 o_3@@17) o_3@@17)))
 :qid |stdinbpl.4826:26|
 :skolemid |541|
 :pattern ( (invRecv56 o_3@@17))
))) (and (forall ((o_3@@18 T@U) ) (!  (=> (= (type o_3@@18) RefType) (and (=> (and (U_2_bool (MapType2Select g0@@8 (invRecv56 o_3@@18))) (and (< NoPerm FullPerm) (qpRange56 o_3@@18))) (and (= (invRecv56 o_3@@18) o_3@@18) (= (U_2_real (MapType1Select QPMask@4 o_3@@18 next)) (- (U_2_real (MapType1Select QPMask@1 o_3@@18 next)) FullPerm)))) (=> (not (and (U_2_bool (MapType2Select g0@@8 (invRecv56 o_3@@18))) (and (< NoPerm FullPerm) (qpRange56 o_3@@18)))) (= (U_2_real (MapType1Select QPMask@4 o_3@@18 next)) (U_2_real (MapType1Select QPMask@1 o_3@@18 next))))))
 :qid |stdinbpl.4832:26|
 :skolemid |542|
 :pattern ( (MapType1Select QPMask@4 o_3@@18 next))
)) (forall ((o_3@@19 T@U) (f_5@@5 T@U) ) (! (let ((B@@17 (FieldTypeInv1 (type f_5@@5))))
(let ((A@@18 (FieldTypeInv0 (type f_5@@5))))
 (=> (and (and (= (type o_3@@19) RefType) (= (type f_5@@5) (FieldType A@@18 B@@17))) (not (= f_5@@5 next))) (= (U_2_real (MapType1Select QPMask@1 o_3@@19 f_5@@5)) (U_2_real (MapType1Select QPMask@4 o_3@@19 f_5@@5))))))
 :qid |stdinbpl.4838:33|
 :skolemid |543|
 :pattern ( (MapType1Select QPMask@4 o_3@@19 f_5@@5))
)))) (and (and (=> (= (ControlFlow 0 86) 82) anon133_Else_correct) (=> (= (ControlFlow 0 86) 73) anon134_Then_correct)) (=> (= (ControlFlow 0 86) 75) anon134_Else_correct)))))))))))
(let ((anon95_correct true))
(let ((anon145_Else_correct  (=> (and (not (U_2_bool (MapType2Select g1@@8 r$2_2))) (= (ControlFlow 0 57) 54)) anon95_correct)))
(let ((anon145_Then_correct  (=> (U_2_bool (MapType2Select g1@@8 r$2_2)) (and (=> (= (ControlFlow 0 55) (- 0 56)) (not (U_2_bool (MapType2Select g0@@8 r$2_2)))) (=> (not (U_2_bool (MapType2Select g0@@8 r$2_2))) (=> (= (ControlFlow 0 55) 54) anon95_correct))))))
(let ((anon144_Else_correct true))
(let ((anon142_Else_correct  (=> (forall ((r$1_3_1 T@U) ) (!  (=> (and (= (type r$1_3_1) RefType) (U_2_bool (MapType2Select g0@@8 r$1_3_1))) (not (U_2_bool (MapType2Select g1@@8 r$1_3_1))))
 :qid |stdinbpl.5184:20|
 :skolemid |580|
 :pattern ( (MapType2Select g0@@8 r$1_3_1) (MapType2Select g1@@8 r$1_3_1))
)) (and (and (=> (= (ControlFlow 0 58) 53) anon144_Else_correct) (=> (= (ControlFlow 0 58) 55) anon145_Then_correct)) (=> (= (ControlFlow 0 58) 57) anon145_Else_correct)))))
(let ((anon91_correct true))
(let ((anon143_Else_correct  (=> (and (not (U_2_bool (MapType2Select g0@@8 r$1_2))) (= (ControlFlow 0 52) 49)) anon91_correct)))
(let ((anon143_Then_correct  (=> (U_2_bool (MapType2Select g0@@8 r$1_2)) (and (=> (= (ControlFlow 0 50) (- 0 51)) (not (U_2_bool (MapType2Select g1@@8 r$1_2)))) (=> (not (U_2_bool (MapType2Select g1@@8 r$1_2))) (=> (= (ControlFlow 0 50) 49) anon91_correct))))))
(let ((anon140_Else_correct  (=> (forall ((n$6_3_1 T@U) ) (!  (=> (= (type n$6_3_1) RefType) (=> (and (U_2_bool (MapType2Select (|Set#Union| g0@@8 g1@@8) n$6_3_1)) (not (= (MapType0Select Heap@@27 n$6_3_1 next) null))) (U_2_bool (MapType2Select (|Set#Union| g0@@8 g1@@8) (MapType0Select Heap@@27 n$6_3_1 next)))))
 :qid |stdinbpl.5169:20|
 :skolemid |579|
 :pattern ( (MapType2Select (|Set#Union| g0@@8 g1@@8) (MapType0Select Heap@@27 n$6_3_1 next)))
 :pattern ( (MapType2Select (|Set#Union| g0@@8 g1@@8) n$6_3_1) (MapType0Select Heap@@27 n$6_3_1 next))
)) (and (=> (= (ControlFlow 0 59) (- 0 61)) (is_global_sroot Heap@@27 (|Set#Union| g0@@8 g1@@8) (|Set#UnionOne| (|Set#Singleton| x1@@7) x0@@10))) (=> (is_global_sroot Heap@@27 (|Set#Union| g0@@8 g1@@8) (|Set#UnionOne| (|Set#Singleton| x1@@7) x0@@10)) (and (=> (= (ControlFlow 0 59) (- 0 60)) (acyclic_list_segment Heap@@27 (|Set#Union| g0@@8 g1@@8))) (=> (acyclic_list_segment Heap@@27 (|Set#Union| g0@@8 g1@@8)) (and (and (=> (= (ControlFlow 0 59) 58) anon142_Else_correct) (=> (= (ControlFlow 0 59) 50) anon143_Then_correct)) (=> (= (ControlFlow 0 59) 52) anon143_Else_correct)))))))))
(let ((anon87_correct true))
(let ((anon141_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select (|Set#Union| g0@@8 g1@@8) n$6_2)) (not (= (MapType0Select Heap@@27 n$6_2 next) null)))) (= (ControlFlow 0 48) 45)) anon87_correct)))
(let ((anon141_Then_correct  (=> (and (U_2_bool (MapType2Select (|Set#Union| g0@@8 g1@@8) n$6_2)) (not (= (MapType0Select Heap@@27 n$6_2 next) null))) (and (=> (= (ControlFlow 0 46) (- 0 47)) (U_2_bool (MapType2Select (|Set#Union| g0@@8 g1@@8) (MapType0Select Heap@@27 n$6_2 next)))) (=> (U_2_bool (MapType2Select (|Set#Union| g0@@8 g1@@8) (MapType0Select Heap@@27 n$6_2 next))) (=> (= (ControlFlow 0 46) 45) anon87_correct))))))
(let ((anon139_Else_correct  (and (=> (= (ControlFlow 0 62) (- 0 66)) (unshared_graph ($$ Heap@@27 (|Set#Union| g0@@8 g1@@8)))) (=> (unshared_graph ($$ Heap@@27 (|Set#Union| g0@@8 g1@@8))) (=> (state Heap@@27 QPMask@1) (and (=> (= (ControlFlow 0 62) (- 0 65)) (not (U_2_bool (MapType2Select (|Set#Union| g0@@8 g1@@8) null)))) (=> (not (U_2_bool (MapType2Select (|Set#Union| g0@@8 g1@@8) null))) (and (=> (= (ControlFlow 0 62) (- 0 64)) (forall ((n$5_2 T@U) (n$5_2_1 T@U) ) (!  (=> (and (= (type n$5_2) RefType) (= (type n$5_2_1) RefType)) (=> (and (and (and (and (not (= n$5_2 n$5_2_1)) (U_2_bool (MapType2Select (|Set#Union| g0@@8 g1@@8) n$5_2))) (U_2_bool (MapType2Select (|Set#Union| g0@@8 g1@@8) n$5_2_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$5_2 n$5_2_1))))
 :qid |stdinbpl.5128:17|
 :skolemid |573|
 :pattern ( (neverTriggered55 n$5_2) (neverTriggered55 n$5_2_1))
))) (=> (forall ((n$5_2@@0 T@U) (n$5_2_1@@0 T@U) ) (!  (=> (and (= (type n$5_2@@0) RefType) (= (type n$5_2_1@@0) RefType)) (=> (and (and (and (and (not (= n$5_2@@0 n$5_2_1@@0)) (U_2_bool (MapType2Select (|Set#Union| g0@@8 g1@@8) n$5_2@@0))) (U_2_bool (MapType2Select (|Set#Union| g0@@8 g1@@8) n$5_2_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$5_2@@0 n$5_2_1@@0))))
 :qid |stdinbpl.5128:17|
 :skolemid |573|
 :pattern ( (neverTriggered55 n$5_2@@0) (neverTriggered55 n$5_2_1@@0))
)) (and (=> (= (ControlFlow 0 62) (- 0 63)) (forall ((n$5_2@@1 T@U) ) (!  (=> (and (= (type n$5_2@@1) RefType) (U_2_bool (MapType2Select (|Set#Union| g0@@8 g1@@8) n$5_2@@1))) (>= (U_2_real (MapType1Select QPMask@1 n$5_2@@1 next)) FullPerm))
 :qid |stdinbpl.5135:17|
 :skolemid |574|
 :pattern ( (MapType0Select Heap@@27 n$5_2@@1 next))
 :pattern ( (MapType1Select QPMask@8 n$5_2@@1 next))
 :pattern ( (MapType0Select Heap@@27 n$5_2@@1 next))
))) (=> (forall ((n$5_2@@2 T@U) ) (!  (=> (and (= (type n$5_2@@2) RefType) (U_2_bool (MapType2Select (|Set#Union| g0@@8 g1@@8) n$5_2@@2))) (>= (U_2_real (MapType1Select QPMask@1 n$5_2@@2 next)) FullPerm))
 :qid |stdinbpl.5135:17|
 :skolemid |574|
 :pattern ( (MapType0Select Heap@@27 n$5_2@@2 next))
 :pattern ( (MapType1Select QPMask@8 n$5_2@@2 next))
 :pattern ( (MapType0Select Heap@@27 n$5_2@@2 next))
)) (=> (and (and (forall ((n$5_2@@3 T@U) ) (!  (=> (= (type n$5_2@@3) RefType) (=> (and (U_2_bool (MapType2Select (|Set#Union| g0@@8 g1@@8) n$5_2@@3)) (< NoPerm FullPerm)) (and (qpRange55 n$5_2@@3) (= (invRecv55 n$5_2@@3) n$5_2@@3))))
 :qid |stdinbpl.5141:22|
 :skolemid |575|
 :pattern ( (MapType0Select Heap@@27 n$5_2@@3 next))
 :pattern ( (MapType1Select QPMask@8 n$5_2@@3 next))
 :pattern ( (MapType0Select Heap@@27 n$5_2@@3 next))
)) (forall ((o_3@@20 T@U) ) (!  (=> (= (type o_3@@20) RefType) (=> (and (U_2_bool (MapType2Select (|Set#Union| g0@@8 g1@@8) (invRecv55 o_3@@20))) (and (< NoPerm FullPerm) (qpRange55 o_3@@20))) (= (invRecv55 o_3@@20) o_3@@20)))
 :qid |stdinbpl.5145:22|
 :skolemid |576|
 :pattern ( (invRecv55 o_3@@20))
))) (and (forall ((o_3@@21 T@U) ) (!  (=> (= (type o_3@@21) RefType) (and (=> (and (U_2_bool (MapType2Select (|Set#Union| g0@@8 g1@@8) (invRecv55 o_3@@21))) (and (< NoPerm FullPerm) (qpRange55 o_3@@21))) (and (= (invRecv55 o_3@@21) o_3@@21) (= (U_2_real (MapType1Select QPMask@8 o_3@@21 next)) (- (U_2_real (MapType1Select QPMask@1 o_3@@21 next)) FullPerm)))) (=> (not (and (U_2_bool (MapType2Select (|Set#Union| g0@@8 g1@@8) (invRecv55 o_3@@21))) (and (< NoPerm FullPerm) (qpRange55 o_3@@21)))) (= (U_2_real (MapType1Select QPMask@8 o_3@@21 next)) (U_2_real (MapType1Select QPMask@1 o_3@@21 next))))))
 :qid |stdinbpl.5151:22|
 :skolemid |577|
 :pattern ( (MapType1Select QPMask@8 o_3@@21 next))
)) (forall ((o_3@@22 T@U) (f_5@@6 T@U) ) (! (let ((B@@18 (FieldTypeInv1 (type f_5@@6))))
(let ((A@@19 (FieldTypeInv0 (type f_5@@6))))
 (=> (and (and (= (type o_3@@22) RefType) (= (type f_5@@6) (FieldType A@@19 B@@18))) (not (= f_5@@6 next))) (= (U_2_real (MapType1Select QPMask@1 o_3@@22 f_5@@6)) (U_2_real (MapType1Select QPMask@8 o_3@@22 f_5@@6))))))
 :qid |stdinbpl.5157:29|
 :skolemid |578|
 :pattern ( (MapType1Select QPMask@8 o_3@@22 f_5@@6))
)))) (and (and (=> (= (ControlFlow 0 62) 59) anon140_Else_correct) (=> (= (ControlFlow 0 62) 46) anon141_Then_correct)) (=> (= (ControlFlow 0 62) 48) anon141_Else_correct))))))))))))))
(let ((anon139_Then_correct  (and (=> (= (ControlFlow 0 42) (- 0 44)) (forall ((n_10 T@U) ) (!  (=> (= (type n_10) RefType) (=> (and (U_2_bool (MapType2Select (|Set#Union| g0@@8 g1@@8) n_10)) (dummyFunction (MapType0Select Heap@@27 n_10 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.5064:21|
 :skolemid |566|
 :pattern ( (MapType0Select Heap@@27 n_10 next))
 :pattern ( (MapType1Select QPMask@7 n_10 next))
 :pattern ( (MapType0Select Heap@@27 n_10 next))
))) (=> (forall ((n_10@@0 T@U) ) (!  (=> (= (type n_10@@0) RefType) (=> (and (U_2_bool (MapType2Select (|Set#Union| g0@@8 g1@@8) n_10@@0)) (dummyFunction (MapType0Select Heap@@27 n_10@@0 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.5064:21|
 :skolemid |566|
 :pattern ( (MapType0Select Heap@@27 n_10@@0 next))
 :pattern ( (MapType1Select QPMask@7 n_10@@0 next))
 :pattern ( (MapType0Select Heap@@27 n_10@@0 next))
)) (and (=> (= (ControlFlow 0 42) (- 0 43)) (forall ((n_10@@1 T@U) (n_10_1 T@U) ) (!  (=> (and (= (type n_10@@1) RefType) (= (type n_10_1) RefType)) (=> (and (and (and (and (not (= n_10@@1 n_10_1)) (U_2_bool (MapType2Select (|Set#Union| g0@@8 g1@@8) n_10@@1))) (U_2_bool (MapType2Select (|Set#Union| g0@@8 g1@@8) n_10_1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_10@@1 n_10_1))))
 :qid |stdinbpl.5071:21|
 :skolemid |567|
 :pattern ( (neverTriggered60 n_10@@1) (neverTriggered60 n_10_1))
))) (=> (forall ((n_10@@2 T@U) (n_10_1@@0 T@U) ) (!  (=> (and (= (type n_10@@2) RefType) (= (type n_10_1@@0) RefType)) (=> (and (and (and (and (not (= n_10@@2 n_10_1@@0)) (U_2_bool (MapType2Select (|Set#Union| g0@@8 g1@@8) n_10@@2))) (U_2_bool (MapType2Select (|Set#Union| g0@@8 g1@@8) n_10_1@@0))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_10@@2 n_10_1@@0))))
 :qid |stdinbpl.5071:21|
 :skolemid |567|
 :pattern ( (neverTriggered60 n_10@@2) (neverTriggered60 n_10_1@@0))
)) (=> (= (ControlFlow 0 42) (- 0 41)) (forall ((n_10@@3 T@U) ) (!  (=> (and (= (type n_10@@3) RefType) (U_2_bool (MapType2Select (|Set#Union| g0@@8 g1@@8) n_10@@3))) (>= (U_2_real (MapType1Select QPMask@1 n_10@@3 next)) (/ (to_real 1) (to_real 2))))
 :qid |stdinbpl.5078:21|
 :skolemid |568|
 :pattern ( (MapType0Select Heap@@27 n_10@@3 next))
 :pattern ( (MapType1Select QPMask@7 n_10@@3 next))
 :pattern ( (MapType0Select Heap@@27 n_10@@3 next))
)))))))))
(let ((anon138_Else_correct  (and (=> (= (ControlFlow 0 67) (- 0 68)) (func_graph ($$ Heap@@27 (|Set#Union| g0@@8 g1@@8)))) (=> (func_graph ($$ Heap@@27 (|Set#Union| g0@@8 g1@@8))) (=> (state Heap@@27 QPMask@1) (and (=> (= (ControlFlow 0 67) 42) anon139_Then_correct) (=> (= (ControlFlow 0 67) 62) anon139_Else_correct)))))))
(let ((anon138_Then_correct  (and (=> (= (ControlFlow 0 38) (- 0 40)) (forall ((n_9 T@U) ) (!  (=> (= (type n_9) RefType) (=> (and (U_2_bool (MapType2Select (|Set#Union| g0@@8 g1@@8) n_9)) (dummyFunction (MapType0Select Heap@@27 n_9 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.4999:21|
 :skolemid |559|
 :pattern ( (MapType0Select Heap@@27 n_9 next))
 :pattern ( (MapType1Select QPMask@6 n_9 next))
 :pattern ( (MapType0Select Heap@@27 n_9 next))
))) (=> (forall ((n_9@@0 T@U) ) (!  (=> (= (type n_9@@0) RefType) (=> (and (U_2_bool (MapType2Select (|Set#Union| g0@@8 g1@@8) n_9@@0)) (dummyFunction (MapType0Select Heap@@27 n_9@@0 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.4999:21|
 :skolemid |559|
 :pattern ( (MapType0Select Heap@@27 n_9@@0 next))
 :pattern ( (MapType1Select QPMask@6 n_9@@0 next))
 :pattern ( (MapType0Select Heap@@27 n_9@@0 next))
)) (and (=> (= (ControlFlow 0 38) (- 0 39)) (forall ((n_9@@1 T@U) (n_9_1 T@U) ) (!  (=> (and (= (type n_9@@1) RefType) (= (type n_9_1) RefType)) (=> (and (and (and (and (not (= n_9@@1 n_9_1)) (U_2_bool (MapType2Select (|Set#Union| g0@@8 g1@@8) n_9@@1))) (U_2_bool (MapType2Select (|Set#Union| g0@@8 g1@@8) n_9_1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_9@@1 n_9_1))))
 :qid |stdinbpl.5006:21|
 :skolemid |560|
 :pattern ( (neverTriggered59 n_9@@1) (neverTriggered59 n_9_1))
))) (=> (forall ((n_9@@2 T@U) (n_9_1@@0 T@U) ) (!  (=> (and (= (type n_9@@2) RefType) (= (type n_9_1@@0) RefType)) (=> (and (and (and (and (not (= n_9@@2 n_9_1@@0)) (U_2_bool (MapType2Select (|Set#Union| g0@@8 g1@@8) n_9@@2))) (U_2_bool (MapType2Select (|Set#Union| g0@@8 g1@@8) n_9_1@@0))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_9@@2 n_9_1@@0))))
 :qid |stdinbpl.5006:21|
 :skolemid |560|
 :pattern ( (neverTriggered59 n_9@@2) (neverTriggered59 n_9_1@@0))
)) (=> (= (ControlFlow 0 38) (- 0 37)) (forall ((n_9@@3 T@U) ) (!  (=> (and (= (type n_9@@3) RefType) (U_2_bool (MapType2Select (|Set#Union| g0@@8 g1@@8) n_9@@3))) (>= (U_2_real (MapType1Select QPMask@1 n_9@@3 next)) (/ (to_real 1) (to_real 2))))
 :qid |stdinbpl.5013:21|
 :skolemid |561|
 :pattern ( (MapType0Select Heap@@27 n_9@@3 next))
 :pattern ( (MapType1Select QPMask@6 n_9@@3 next))
 :pattern ( (MapType0Select Heap@@27 n_9@@3 next))
)))))))))
(let ((anon137_Else_correct  (and (=> (= (ControlFlow 0 69) (- 0 70)) (acyclic_graph ($$ Heap@@27 (|Set#Union| g0@@8 g1@@8)))) (=> (acyclic_graph ($$ Heap@@27 (|Set#Union| g0@@8 g1@@8))) (=> (state Heap@@27 QPMask@1) (and (=> (= (ControlFlow 0 69) 38) anon138_Then_correct) (=> (= (ControlFlow 0 69) 67) anon138_Else_correct)))))))
(let ((anon137_Then_correct  (and (=> (= (ControlFlow 0 34) (- 0 36)) (forall ((n_8 T@U) ) (!  (=> (= (type n_8) RefType) (=> (and (U_2_bool (MapType2Select (|Set#Union| g0@@8 g1@@8) n_8)) (dummyFunction (MapType0Select Heap@@27 n_8 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.4934:21|
 :skolemid |552|
 :pattern ( (MapType0Select Heap@@27 n_8 next))
 :pattern ( (MapType1Select QPMask@5 n_8 next))
 :pattern ( (MapType0Select Heap@@27 n_8 next))
))) (=> (forall ((n_8@@0 T@U) ) (!  (=> (= (type n_8@@0) RefType) (=> (and (U_2_bool (MapType2Select (|Set#Union| g0@@8 g1@@8) n_8@@0)) (dummyFunction (MapType0Select Heap@@27 n_8@@0 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.4934:21|
 :skolemid |552|
 :pattern ( (MapType0Select Heap@@27 n_8@@0 next))
 :pattern ( (MapType1Select QPMask@5 n_8@@0 next))
 :pattern ( (MapType0Select Heap@@27 n_8@@0 next))
)) (and (=> (= (ControlFlow 0 34) (- 0 35)) (forall ((n_8@@1 T@U) (n_8_1 T@U) ) (!  (=> (and (= (type n_8@@1) RefType) (= (type n_8_1) RefType)) (=> (and (and (and (and (not (= n_8@@1 n_8_1)) (U_2_bool (MapType2Select (|Set#Union| g0@@8 g1@@8) n_8@@1))) (U_2_bool (MapType2Select (|Set#Union| g0@@8 g1@@8) n_8_1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_8@@1 n_8_1))))
 :qid |stdinbpl.4941:21|
 :skolemid |553|
 :pattern ( (neverTriggered58 n_8@@1) (neverTriggered58 n_8_1))
))) (=> (forall ((n_8@@2 T@U) (n_8_1@@0 T@U) ) (!  (=> (and (= (type n_8@@2) RefType) (= (type n_8_1@@0) RefType)) (=> (and (and (and (and (not (= n_8@@2 n_8_1@@0)) (U_2_bool (MapType2Select (|Set#Union| g0@@8 g1@@8) n_8@@2))) (U_2_bool (MapType2Select (|Set#Union| g0@@8 g1@@8) n_8_1@@0))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_8@@2 n_8_1@@0))))
 :qid |stdinbpl.4941:21|
 :skolemid |553|
 :pattern ( (neverTriggered58 n_8@@2) (neverTriggered58 n_8_1@@0))
)) (=> (= (ControlFlow 0 34) (- 0 33)) (forall ((n_8@@3 T@U) ) (!  (=> (and (= (type n_8@@3) RefType) (U_2_bool (MapType2Select (|Set#Union| g0@@8 g1@@8) n_8@@3))) (>= (U_2_real (MapType1Select QPMask@1 n_8@@3 next)) (/ (to_real 1) (to_real 2))))
 :qid |stdinbpl.4948:21|
 :skolemid |554|
 :pattern ( (MapType0Select Heap@@27 n_8@@3 next))
 :pattern ( (MapType1Select QPMask@5 n_8@@3 next))
 :pattern ( (MapType0Select Heap@@27 n_8@@3 next))
)))))))))
(let ((anon132_Else_correct  (=> (apply_TCFraming Heap@@27 g0@@8 g1@@8) (=> (and (state Heap@@27 QPMask@1) (state Heap@@27 QPMask@1)) (and (=> (= (ControlFlow 0 71) 34) anon137_Then_correct) (=> (= (ControlFlow 0 71) 69) anon137_Else_correct))))))
(let ((anon119_Else_correct  (=> (state Heap@@27 QPMask@1) (and (=> (= (ControlFlow 0 90) 86) anon132_Then_correct) (=> (= (ControlFlow 0 90) 71) anon132_Else_correct)))))
(let ((anon116_Else_correct  (=> (and (acyclic_list_segment Heap@@27 g1@@8) (state Heap@@27 QPMask@1)) (and (=> (= (ControlFlow 0 128) 127) anon119_Then_correct) (=> (= (ControlFlow 0 128) 90) anon119_Else_correct)))))
(let ((anon113_Else_correct  (=> (acyclic_list_segment Heap@@27 g0@@8) (=> (and (state Heap@@27 QPMask@1) (state Heap@@27 QPMask@1)) (and (=> (= (ControlFlow 0 138) 134) anon116_Then_correct) (=> (= (ControlFlow 0 138) 128) anon116_Else_correct))))))
(let ((anon110_Else_correct  (=> (forall ((n$4_1 T@U) ) (!  (=> (and (= (type n$4_1) RefType) (U_2_bool (MapType2Select g1@@8 n$4_1))) (exists_path ($$ Heap@@27 g1@@8) x1@@7 n$4_1))
 :qid |stdinbpl.4413:20|
 :skolemid |500|
 :pattern ( (MapType2Select g1@@8 n$4_1))
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| Heap@@27 g1@@8))) g1@@8) x1@@7 n$4_1))
)) (=> (and (state Heap@@27 QPMask@1) (state Heap@@27 QPMask@1)) (and (=> (= (ControlFlow 0 148) 144) anon113_Then_correct) (=> (= (ControlFlow 0 148) 138) anon113_Else_correct))))))
(let ((anon112_Then_correct  (and (=> (= (ControlFlow 0 29) (- 0 31)) (forall ((n_3 T@U) ) (!  (=> (= (type n_3) RefType) (=> (and (U_2_bool (MapType2Select g1@@8 n_3)) (dummyFunction (MapType0Select Heap@@27 n_3 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.4362:25|
 :skolemid |493|
 :pattern ( (MapType0Select Heap@@27 n_3 next))
 :pattern ( (MapType1Select QPMask@13 n_3 next))
 :pattern ( (MapType0Select Heap@@27 n_3 next))
))) (=> (forall ((n_3@@0 T@U) ) (!  (=> (= (type n_3@@0) RefType) (=> (and (U_2_bool (MapType2Select g1@@8 n_3@@0)) (dummyFunction (MapType0Select Heap@@27 n_3@@0 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.4362:25|
 :skolemid |493|
 :pattern ( (MapType0Select Heap@@27 n_3@@0 next))
 :pattern ( (MapType1Select QPMask@13 n_3@@0 next))
 :pattern ( (MapType0Select Heap@@27 n_3@@0 next))
)) (and (=> (= (ControlFlow 0 29) (- 0 30)) (forall ((n_3@@1 T@U) (n_3_1 T@U) ) (!  (=> (and (= (type n_3@@1) RefType) (= (type n_3_1) RefType)) (=> (and (and (and (and (not (= n_3@@1 n_3_1)) (U_2_bool (MapType2Select g1@@8 n_3@@1))) (U_2_bool (MapType2Select g1@@8 n_3_1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_3@@1 n_3_1))))
 :qid |stdinbpl.4369:25|
 :skolemid |494|
 :pattern ( (neverTriggered49 n_3@@1) (neverTriggered49 n_3_1))
))) (=> (forall ((n_3@@2 T@U) (n_3_1@@0 T@U) ) (!  (=> (and (= (type n_3@@2) RefType) (= (type n_3_1@@0) RefType)) (=> (and (and (and (and (not (= n_3@@2 n_3_1@@0)) (U_2_bool (MapType2Select g1@@8 n_3@@2))) (U_2_bool (MapType2Select g1@@8 n_3_1@@0))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_3@@2 n_3_1@@0))))
 :qid |stdinbpl.4369:25|
 :skolemid |494|
 :pattern ( (neverTriggered49 n_3@@2) (neverTriggered49 n_3_1@@0))
)) (=> (= (ControlFlow 0 29) (- 0 28)) (forall ((n_3@@3 T@U) ) (!  (=> (and (= (type n_3@@3) RefType) (U_2_bool (MapType2Select g1@@8 n_3@@3))) (>= (U_2_real (MapType1Select QPMask@1 n_3@@3 next)) (/ (to_real 1) (to_real 2))))
 :qid |stdinbpl.4376:25|
 :skolemid |495|
 :pattern ( (MapType0Select Heap@@27 n_3@@3 next))
 :pattern ( (MapType1Select QPMask@13 n_3@@3 next))
 :pattern ( (MapType0Select Heap@@27 n_3@@3 next))
)))))))))
(let ((anon29_correct true))
(let ((anon111_Then_correct  (=> (U_2_bool (MapType2Select g1@@8 n$4_4)) (and (=> (= (ControlFlow 0 32) 29) anon112_Then_correct) (=> (= (ControlFlow 0 32) 26) anon29_correct)))))
(let ((anon111_Else_correct  (=> (and (not (U_2_bool (MapType2Select g1@@8 n$4_4))) (= (ControlFlow 0 27) 26)) anon29_correct)))
(let ((anon107_Else_correct  (=> (forall ((n$3_1 T@U) ) (!  (=> (and (= (type n$3_1) RefType) (U_2_bool (MapType2Select g0@@8 n$3_1))) (exists_path ($$ Heap@@27 g0@@8) x0@@10 n$3_1))
 :qid |stdinbpl.4344:20|
 :skolemid |492|
 :pattern ( (MapType2Select g0@@8 n$3_1))
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| Heap@@27 g0@@8))) g0@@8) x0@@10 n$3_1))
)) (=> (and (state Heap@@27 QPMask@1) (state Heap@@27 QPMask@1)) (and (and (=> (= (ControlFlow 0 149) 148) anon110_Else_correct) (=> (= (ControlFlow 0 149) 32) anon111_Then_correct)) (=> (= (ControlFlow 0 149) 27) anon111_Else_correct))))))
(let ((anon109_Then_correct  (and (=> (= (ControlFlow 0 22) (- 0 24)) (forall ((n_2 T@U) ) (!  (=> (= (type n_2) RefType) (=> (and (U_2_bool (MapType2Select g0@@8 n_2)) (dummyFunction (MapType0Select Heap@@27 n_2 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.4293:25|
 :skolemid |485|
 :pattern ( (MapType0Select Heap@@27 n_2 next))
 :pattern ( (MapType1Select QPMask@14 n_2 next))
 :pattern ( (MapType0Select Heap@@27 n_2 next))
))) (=> (forall ((n_2@@0 T@U) ) (!  (=> (= (type n_2@@0) RefType) (=> (and (U_2_bool (MapType2Select g0@@8 n_2@@0)) (dummyFunction (MapType0Select Heap@@27 n_2@@0 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.4293:25|
 :skolemid |485|
 :pattern ( (MapType0Select Heap@@27 n_2@@0 next))
 :pattern ( (MapType1Select QPMask@14 n_2@@0 next))
 :pattern ( (MapType0Select Heap@@27 n_2@@0 next))
)) (and (=> (= (ControlFlow 0 22) (- 0 23)) (forall ((n_2@@1 T@U) (n_2_1 T@U) ) (!  (=> (and (= (type n_2@@1) RefType) (= (type n_2_1) RefType)) (=> (and (and (and (and (not (= n_2@@1 n_2_1)) (U_2_bool (MapType2Select g0@@8 n_2@@1))) (U_2_bool (MapType2Select g0@@8 n_2_1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_2@@1 n_2_1))))
 :qid |stdinbpl.4300:25|
 :skolemid |486|
 :pattern ( (neverTriggered48 n_2@@1) (neverTriggered48 n_2_1))
))) (=> (forall ((n_2@@2 T@U) (n_2_1@@0 T@U) ) (!  (=> (and (= (type n_2@@2) RefType) (= (type n_2_1@@0) RefType)) (=> (and (and (and (and (not (= n_2@@2 n_2_1@@0)) (U_2_bool (MapType2Select g0@@8 n_2@@2))) (U_2_bool (MapType2Select g0@@8 n_2_1@@0))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_2@@2 n_2_1@@0))))
 :qid |stdinbpl.4300:25|
 :skolemid |486|
 :pattern ( (neverTriggered48 n_2@@2) (neverTriggered48 n_2_1@@0))
)) (=> (= (ControlFlow 0 22) (- 0 21)) (forall ((n_2@@3 T@U) ) (!  (=> (and (= (type n_2@@3) RefType) (U_2_bool (MapType2Select g0@@8 n_2@@3))) (>= (U_2_real (MapType1Select QPMask@1 n_2@@3 next)) (/ (to_real 1) (to_real 2))))
 :qid |stdinbpl.4307:25|
 :skolemid |487|
 :pattern ( (MapType0Select Heap@@27 n_2@@3 next))
 :pattern ( (MapType1Select QPMask@14 n_2@@3 next))
 :pattern ( (MapType0Select Heap@@27 n_2@@3 next))
)))))))))
(let ((anon24_correct true))
(let ((anon108_Then_correct  (=> (U_2_bool (MapType2Select g0@@8 n$3)) (and (=> (= (ControlFlow 0 25) 22) anon109_Then_correct) (=> (= (ControlFlow 0 25) 19) anon24_correct)))))
(let ((anon108_Else_correct  (=> (and (not (U_2_bool (MapType2Select g0@@8 n$3))) (= (ControlFlow 0 20) 19)) anon24_correct)))
(let ((anon106_Else_correct  (=> (forall ((r$0_1 T@U) ) (!  (=> (and (= (type r$0_1) RefType) (U_2_bool (MapType2Select g1@@8 r$0_1))) (not (U_2_bool (MapType2Select g0@@8 r$0_1))))
 :qid |stdinbpl.4275:20|
 :skolemid |484|
 :pattern ( (MapType2Select g0@@8 r$0_1) (MapType2Select g1@@8 r$0_1))
)) (=> (and (state Heap@@27 QPMask@1) (state Heap@@27 QPMask@1)) (and (and (=> (= (ControlFlow 0 150) 149) anon107_Else_correct) (=> (= (ControlFlow 0 150) 25) anon108_Then_correct)) (=> (= (ControlFlow 0 150) 20) anon108_Else_correct))))))
(let ((anon106_Then_correct true))
(let ((anon105_Else_correct  (=> (forall ((r_1_1 T@U) ) (!  (=> (and (= (type r_1_1) RefType) (U_2_bool (MapType2Select g0@@8 r_1_1))) (not (U_2_bool (MapType2Select g1@@8 r_1_1))))
 :qid |stdinbpl.4266:20|
 :skolemid |483|
 :pattern ( (MapType2Select g0@@8 r_1_1) (MapType2Select g1@@8 r_1_1))
)) (and (=> (= (ControlFlow 0 151) 18) anon106_Then_correct) (=> (= (ControlFlow 0 151) 150) anon106_Else_correct)))))
(let ((anon105_Then_correct true))
(let ((anon102_Else_correct  (=> (and (forall ((n$2_1_1 T@U) ) (!  (=> (= (type n$2_1_1) RefType) (=> (and (U_2_bool (MapType2Select g1@@8 n$2_1_1)) (not (= (MapType0Select Heap@@27 n$2_1_1 next) null))) (U_2_bool (MapType2Select g1@@8 (MapType0Select Heap@@27 n$2_1_1 next)))))
 :qid |stdinbpl.4252:20|
 :skolemid |482|
 :pattern ( (MapType2Select g1@@8 (MapType0Select Heap@@27 n$2_1_1 next)))
 :pattern ( (MapType2Select g1@@8 n$2_1_1) (MapType0Select Heap@@27 n$2_1_1 next))
)) (state Heap@@27 QPMask@1)) (=> (and (and (U_2_bool (MapType2Select g0@@8 x0@@10)) (state Heap@@27 QPMask@1)) (and (U_2_bool (MapType2Select g1@@8 x1@@7)) (state Heap@@27 QPMask@1))) (and (=> (= (ControlFlow 0 152) 17) anon105_Then_correct) (=> (= (ControlFlow 0 152) 151) anon105_Else_correct))))))
(let ((anon15_correct true))
(let ((anon104_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select g1@@8 n$2_7)) (not (= (MapType0Select Heap@@27 n$2_7 next) null)))) (= (ControlFlow 0 13) 10)) anon15_correct)))
(let ((anon104_Then_correct  (=> (and (U_2_bool (MapType2Select g1@@8 n$2_7)) (not (= (MapType0Select Heap@@27 n$2_7 next) null))) (and (=> (= (ControlFlow 0 11) (- 0 12)) (HasDirectPerm QPMask@1 n$2_7 next)) (=> (HasDirectPerm QPMask@1 n$2_7 next) (=> (= (ControlFlow 0 11) 10) anon15_correct))))))
(let ((anon103_Else_correct  (=> (not (U_2_bool (MapType2Select g1@@8 n$2_7))) (and (=> (= (ControlFlow 0 16) 11) anon104_Then_correct) (=> (= (ControlFlow 0 16) 13) anon104_Else_correct)))))
(let ((anon103_Then_correct  (=> (U_2_bool (MapType2Select g1@@8 n$2_7)) (and (=> (= (ControlFlow 0 14) (- 0 15)) (HasDirectPerm QPMask@1 n$2_7 next)) (=> (HasDirectPerm QPMask@1 n$2_7 next) (and (=> (= (ControlFlow 0 14) 11) anon104_Then_correct) (=> (= (ControlFlow 0 14) 13) anon104_Else_correct)))))))
(let ((anon101_Else_correct  (and (=> (= (ControlFlow 0 153) (- 0 154)) (forall ((n$1_1 T@U) (n$1_1_1 T@U) ) (!  (=> (and (= (type n$1_1) RefType) (= (type n$1_1_1) RefType)) (=> (and (and (and (and (not (= n$1_1 n$1_1_1)) (U_2_bool (MapType2Select g1@@8 n$1_1))) (U_2_bool (MapType2Select g1@@8 n$1_1_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$1_1 n$1_1_1))))
 :qid |stdinbpl.4207:15|
 :skolemid |476|
 :no-pattern (type n$1_1)
 :no-pattern (type n$1_1_1)
 :no-pattern (U_2_int n$1_1)
 :no-pattern (U_2_bool n$1_1)
 :no-pattern (U_2_int n$1_1_1)
 :no-pattern (U_2_bool n$1_1_1)
))) (=> (forall ((n$1_1@@0 T@U) (n$1_1_1@@0 T@U) ) (!  (=> (and (= (type n$1_1@@0) RefType) (= (type n$1_1_1@@0) RefType)) (=> (and (and (and (and (not (= n$1_1@@0 n$1_1_1@@0)) (U_2_bool (MapType2Select g1@@8 n$1_1@@0))) (U_2_bool (MapType2Select g1@@8 n$1_1_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$1_1@@0 n$1_1_1@@0))))
 :qid |stdinbpl.4207:15|
 :skolemid |476|
 :no-pattern (type n$1_1@@0)
 :no-pattern (type n$1_1_1@@0)
 :no-pattern (U_2_int n$1_1@@0)
 :no-pattern (U_2_bool n$1_1@@0)
 :no-pattern (U_2_int n$1_1_1@@0)
 :no-pattern (U_2_bool n$1_1_1@@0)
)) (=> (and (forall ((n$1_1@@1 T@U) ) (!  (=> (= (type n$1_1@@1) RefType) (=> (and (U_2_bool (MapType2Select g1@@8 n$1_1@@1)) (< NoPerm FullPerm)) (and (qpRange47 n$1_1@@1) (= (invRecv47 n$1_1@@1) n$1_1@@1))))
 :qid |stdinbpl.4213:22|
 :skolemid |477|
 :pattern ( (MapType0Select Heap@@27 n$1_1@@1 next))
 :pattern ( (MapType1Select QPMask@1 n$1_1@@1 next))
 :pattern ( (MapType0Select Heap@@27 n$1_1@@1 next))
)) (forall ((o_3@@23 T@U) ) (!  (=> (= (type o_3@@23) RefType) (=> (and (and (U_2_bool (MapType2Select g1@@8 (invRecv47 o_3@@23))) (< NoPerm FullPerm)) (qpRange47 o_3@@23)) (= (invRecv47 o_3@@23) o_3@@23)))
 :qid |stdinbpl.4217:22|
 :skolemid |478|
 :pattern ( (invRecv47 o_3@@23))
))) (=> (and (and (forall ((n$1_1@@2 T@U) ) (!  (=> (and (= (type n$1_1@@2) RefType) (U_2_bool (MapType2Select g1@@8 n$1_1@@2))) (not (= n$1_1@@2 null)))
 :qid |stdinbpl.4223:22|
 :skolemid |479|
 :pattern ( (MapType0Select Heap@@27 n$1_1@@2 next))
 :pattern ( (MapType1Select QPMask@1 n$1_1@@2 next))
 :pattern ( (MapType0Select Heap@@27 n$1_1@@2 next))
)) (forall ((o_3@@24 T@U) ) (!  (=> (= (type o_3@@24) RefType) (and (=> (and (and (U_2_bool (MapType2Select g1@@8 (invRecv47 o_3@@24))) (< NoPerm FullPerm)) (qpRange47 o_3@@24)) (and (=> (< NoPerm FullPerm) (= (invRecv47 o_3@@24) o_3@@24)) (= (U_2_real (MapType1Select QPMask@1 o_3@@24 next)) (+ (U_2_real (MapType1Select QPMask@0 o_3@@24 next)) FullPerm)))) (=> (not (and (and (U_2_bool (MapType2Select g1@@8 (invRecv47 o_3@@24))) (< NoPerm FullPerm)) (qpRange47 o_3@@24))) (= (U_2_real (MapType1Select QPMask@1 o_3@@24 next)) (U_2_real (MapType1Select QPMask@0 o_3@@24 next))))))
 :qid |stdinbpl.4229:22|
 :skolemid |480|
 :pattern ( (MapType1Select QPMask@1 o_3@@24 next))
))) (and (forall ((o_3@@25 T@U) (f_5@@7 T@U) ) (! (let ((B@@19 (FieldTypeInv1 (type f_5@@7))))
(let ((A@@20 (FieldTypeInv0 (type f_5@@7))))
 (=> (and (and (= (type o_3@@25) RefType) (= (type f_5@@7) (FieldType A@@20 B@@19))) (not (= f_5@@7 next))) (= (U_2_real (MapType1Select QPMask@0 o_3@@25 f_5@@7)) (U_2_real (MapType1Select QPMask@1 o_3@@25 f_5@@7))))))
 :qid |stdinbpl.4233:29|
 :skolemid |481|
 :pattern ( (MapType1Select QPMask@0 o_3@@25 f_5@@7))
 :pattern ( (MapType1Select QPMask@1 o_3@@25 f_5@@7))
)) (state Heap@@27 QPMask@1))) (and (and (=> (= (ControlFlow 0 153) 152) anon102_Else_correct) (=> (= (ControlFlow 0 153) 14) anon103_Then_correct)) (=> (= (ControlFlow 0 153) 16) anon103_Else_correct))))))))
(let ((anon101_Then_correct true))
(let ((anon98_Else_correct  (=> (and (forall ((n$0_1_1 T@U) ) (!  (=> (= (type n$0_1_1) RefType) (=> (and (U_2_bool (MapType2Select g0@@8 n$0_1_1)) (not (= (MapType0Select Heap@@27 n$0_1_1 next) null))) (U_2_bool (MapType2Select g0@@8 (MapType0Select Heap@@27 n$0_1_1 next)))))
 :qid |stdinbpl.4195:20|
 :skolemid |475|
 :pattern ( (MapType2Select g0@@8 (MapType0Select Heap@@27 n$0_1_1 next)))
 :pattern ( (MapType2Select g0@@8 n$0_1_1) (MapType0Select Heap@@27 n$0_1_1 next))
)) (not (U_2_bool (MapType2Select g1@@8 null)))) (and (=> (= (ControlFlow 0 155) 9) anon101_Then_correct) (=> (= (ControlFlow 0 155) 153) anon101_Else_correct)))))
(let ((anon7_correct true))
(let ((anon100_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select g0@@8 n$0_11)) (not (= (MapType0Select Heap@@27 n$0_11 next) null)))) (= (ControlFlow 0 5) 2)) anon7_correct)))
(let ((anon100_Then_correct  (=> (and (U_2_bool (MapType2Select g0@@8 n$0_11)) (not (= (MapType0Select Heap@@27 n$0_11 next) null))) (and (=> (= (ControlFlow 0 3) (- 0 4)) (HasDirectPerm QPMask@0 n$0_11 next)) (=> (HasDirectPerm QPMask@0 n$0_11 next) (=> (= (ControlFlow 0 3) 2) anon7_correct))))))
(let ((anon99_Else_correct  (=> (not (U_2_bool (MapType2Select g0@@8 n$0_11))) (and (=> (= (ControlFlow 0 8) 3) anon100_Then_correct) (=> (= (ControlFlow 0 8) 5) anon100_Else_correct)))))
(let ((anon99_Then_correct  (=> (U_2_bool (MapType2Select g0@@8 n$0_11)) (and (=> (= (ControlFlow 0 6) (- 0 7)) (HasDirectPerm QPMask@0 n$0_11 next)) (=> (HasDirectPerm QPMask@0 n$0_11 next) (and (=> (= (ControlFlow 0 6) 3) anon100_Then_correct) (=> (= (ControlFlow 0 6) 5) anon100_Else_correct)))))))
(let ((anon97_Else_correct  (and (=> (= (ControlFlow 0 156) (- 0 157)) (forall ((n_1 T@U) (n_1_1 T@U) ) (!  (=> (and (= (type n_1) RefType) (= (type n_1_1) RefType)) (=> (and (and (and (and (not (= n_1 n_1_1)) (U_2_bool (MapType2Select g0@@8 n_1))) (U_2_bool (MapType2Select g0@@8 n_1_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_1 n_1_1))))
 :qid |stdinbpl.4150:15|
 :skolemid |469|
 :no-pattern (type n_1)
 :no-pattern (type n_1_1)
 :no-pattern (U_2_int n_1)
 :no-pattern (U_2_bool n_1)
 :no-pattern (U_2_int n_1_1)
 :no-pattern (U_2_bool n_1_1)
))) (=> (forall ((n_1@@0 T@U) (n_1_1@@0 T@U) ) (!  (=> (and (= (type n_1@@0) RefType) (= (type n_1_1@@0) RefType)) (=> (and (and (and (and (not (= n_1@@0 n_1_1@@0)) (U_2_bool (MapType2Select g0@@8 n_1@@0))) (U_2_bool (MapType2Select g0@@8 n_1_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_1@@0 n_1_1@@0))))
 :qid |stdinbpl.4150:15|
 :skolemid |469|
 :no-pattern (type n_1@@0)
 :no-pattern (type n_1_1@@0)
 :no-pattern (U_2_int n_1@@0)
 :no-pattern (U_2_bool n_1@@0)
 :no-pattern (U_2_int n_1_1@@0)
 :no-pattern (U_2_bool n_1_1@@0)
)) (=> (and (forall ((n_1@@1 T@U) ) (!  (=> (= (type n_1@@1) RefType) (=> (and (U_2_bool (MapType2Select g0@@8 n_1@@1)) (< NoPerm FullPerm)) (and (qpRange46 n_1@@1) (= (invRecv46 n_1@@1) n_1@@1))))
 :qid |stdinbpl.4156:22|
 :skolemid |470|
 :pattern ( (MapType0Select Heap@@27 n_1@@1 next))
 :pattern ( (MapType1Select QPMask@0 n_1@@1 next))
 :pattern ( (MapType0Select Heap@@27 n_1@@1 next))
)) (forall ((o_3@@26 T@U) ) (!  (=> (= (type o_3@@26) RefType) (=> (and (and (U_2_bool (MapType2Select g0@@8 (invRecv46 o_3@@26))) (< NoPerm FullPerm)) (qpRange46 o_3@@26)) (= (invRecv46 o_3@@26) o_3@@26)))
 :qid |stdinbpl.4160:22|
 :skolemid |471|
 :pattern ( (invRecv46 o_3@@26))
))) (=> (and (and (forall ((n_1@@2 T@U) ) (!  (=> (and (= (type n_1@@2) RefType) (U_2_bool (MapType2Select g0@@8 n_1@@2))) (not (= n_1@@2 null)))
 :qid |stdinbpl.4166:22|
 :skolemid |472|
 :pattern ( (MapType0Select Heap@@27 n_1@@2 next))
 :pattern ( (MapType1Select QPMask@0 n_1@@2 next))
 :pattern ( (MapType0Select Heap@@27 n_1@@2 next))
)) (forall ((o_3@@27 T@U) ) (!  (=> (= (type o_3@@27) RefType) (and (=> (and (and (U_2_bool (MapType2Select g0@@8 (invRecv46 o_3@@27))) (< NoPerm FullPerm)) (qpRange46 o_3@@27)) (and (=> (< NoPerm FullPerm) (= (invRecv46 o_3@@27) o_3@@27)) (= (U_2_real (MapType1Select QPMask@0 o_3@@27 next)) (+ (U_2_real (MapType1Select ZeroMask o_3@@27 next)) FullPerm)))) (=> (not (and (and (U_2_bool (MapType2Select g0@@8 (invRecv46 o_3@@27))) (< NoPerm FullPerm)) (qpRange46 o_3@@27))) (= (U_2_real (MapType1Select QPMask@0 o_3@@27 next)) (U_2_real (MapType1Select ZeroMask o_3@@27 next))))))
 :qid |stdinbpl.4172:22|
 :skolemid |473|
 :pattern ( (MapType1Select QPMask@0 o_3@@27 next))
))) (and (forall ((o_3@@28 T@U) (f_5@@8 T@U) ) (! (let ((B@@20 (FieldTypeInv1 (type f_5@@8))))
(let ((A@@21 (FieldTypeInv0 (type f_5@@8))))
 (=> (and (and (= (type o_3@@28) RefType) (= (type f_5@@8) (FieldType A@@21 B@@20))) (not (= f_5@@8 next))) (= (U_2_real (MapType1Select ZeroMask o_3@@28 f_5@@8)) (U_2_real (MapType1Select QPMask@0 o_3@@28 f_5@@8))))))
 :qid |stdinbpl.4176:29|
 :skolemid |474|
 :pattern ( (MapType1Select ZeroMask o_3@@28 f_5@@8))
 :pattern ( (MapType1Select QPMask@0 o_3@@28 f_5@@8))
)) (state Heap@@27 QPMask@0))) (and (and (=> (= (ControlFlow 0 156) 155) anon98_Else_correct) (=> (= (ControlFlow 0 156) 6) anon99_Then_correct)) (=> (= (ControlFlow 0 156) 8) anon99_Else_correct))))))))
(let ((anon97_Then_correct true))
(let ((anon0_correct  (=> (state Heap@@27 ZeroMask) (=> (and (and (= AssumeFunctionsAbove (- 0 1)) (U_2_bool (MapType0Select Heap@@27 x0@@10 $allocated))) (and (U_2_bool (MapType0Select Heap@@27 x1@@7 $allocated)) (not (U_2_bool (MapType2Select g0@@8 null))))) (and (=> (= (ControlFlow 0 158) 1) anon97_Then_correct) (=> (= (ControlFlow 0 158) 156) anon97_Else_correct))))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 159) 158) anon0_correct)))
PreconditionGeneratedEntry_correct)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
))
(check-sat)
(pop 1)
; Valid
(get-info :rlimit)
