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
(declare-fun __left__ () T@U)
(declare-fun __right__ () T@U)
(declare-fun l () T@U)
(declare-fun r_1 () T@U)
(declare-fun marker () T@U)
(declare-fun FieldType (T@T T@T) T@T)
(declare-fun FieldTypeInv0 (T@T) T@T)
(declare-fun FieldTypeInv1 (T@T) T@T)
(declare-fun NormalFieldType () T@T)
(declare-fun __FieldEnum__DomainTypeType () T@T)
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
(declare-fun |apply_TCFraming'| (T@U T@U T@U) Bool)
(declare-fun MapType2Type (T@T T@T) T@T)
(declare-fun dummyFunction (T@U) Bool)
(declare-fun |apply_TCFraming#triggerStateless| (T@U T@U) Bool)
(declare-fun MapType2TypeInv0 (T@T) T@T)
(declare-fun MapType2TypeInv1 (T@T) T@T)
(declare-fun MapType2Select (T@U T@U) T@U)
(declare-fun MapType2Store (T@U T@U T@U) T@U)
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
(declare-fun |$$#triggerStateless| (T@U) T@U)
(declare-fun EdgeDomainTypeType () T@T)
(declare-fun |MultiSet#Select| (T@U T@U) Int)
(declare-fun |Set#Union| (T@U T@U) T@U)
(declare-fun |Set#Intersection| (T@U T@U) T@U)
(declare-fun |Set#Singleton| (T@U) T@U)
(declare-fun |Set#Card| (T@U) Int)
(declare-fun inst_uReach (T@U T@U) T@U)
(declare-fun exists_path (T@U T@U T@U) Bool)
(declare-fun $$ (T@U T@U) T@U)
(declare-fun |Math#clip| (Int) Int)
(declare-fun exists_path_ (T@U T@U T@U) Bool)
(declare-fun AssumeFunctionsAbove () Int)
(declare-fun |apply_TCFraming#trigger| (T@U T@U T@U) Bool)
(declare-fun CombineFrames (T@U T@U) T@U)
(declare-fun FrameFragment (T@U) T@U)
(declare-fun |apply_TCFraming#condqp3| (T@U T@U T@U) Int)
(declare-fun |apply_TCFraming#condqp4| (T@U T@U T@U) Int)
(declare-fun |apply_TCFraming#condqp5| (T@U T@U T@U) Int)
(declare-fun |apply_TCFraming#condqp6| (T@U T@U T@U) Int)
(declare-fun |$$#frame| (T@U T@U) T@U)
(declare-fun |$$#condqp1| (T@U T@U) Int)
(declare-fun |$$#condqp2| (T@U T@U) Int)
(declare-fun edge (T@U T@U T@U) Bool)
(declare-fun create_edge (T@U T@U) T@U)
(declare-fun edge_ (T@U T@U T@U) Bool)
(declare-fun dummyHeap () T@U)
(declare-fun ZeroMask () T@U)
(declare-fun |MultiSet#UnionOne| (T@U T@U) T@U)
(declare-fun |MultiSet#Disjoint| (T@U T@U) Bool)
(declare-fun InsidePredicate (T@U T@U T@U T@U) Bool)
(declare-fun |$$#trigger| (T@U T@U) Bool)
(declare-fun |MultiSet#Singleton| (T@U) T@U)
(declare-fun apply_noExit (T@U T@U T@U) Bool)
(declare-fun |Set#Equal| (T@U T@U) Bool)
(declare-fun sumMask (T@U T@U T@U) Bool)
(declare-fun ConditionalFrame (Real T@U) T@U)
(declare-fun EmptyFrame () T@U)
(declare-fun NoPerm () Real)
(declare-fun edge_pred (T@U) T@U)
(declare-fun edge_succ (T@U) T@U)
(declare-fun |Set#Difference| (T@U T@U) T@U)
(declare-fun |MultiSet#Equal| (T@U T@U) Bool)
(declare-fun |Set#UnionOne| (T@U T@U) T@U)
(declare-fun |sk_$$#condqp1| (Int Int) T@U)
(declare-fun |sk_$$#condqp2| (Int Int) T@U)
(declare-fun |MultiSet#Empty| (T@T) T@U)
(declare-fun unshared_graph (T@U) Bool)
(declare-fun func_graph (T@U) Bool)
(declare-fun FullPerm () Real)
(declare-fun |apply_TCFraming#frame| (T@U T@U T@U) Bool)
(declare-fun |Set#Empty| (T@T) T@U)
(declare-fun |Set#Subset| (T@U T@U) Bool)
(declare-fun |sk_apply_TCFraming#condqp3| (Int Int) T@U)
(declare-fun |sk_apply_TCFraming#condqp4| (Int Int) T@U)
(declare-fun |sk_apply_TCFraming#condqp5| (Int Int) T@U)
(declare-fun |sk_apply_TCFraming#condqp6| (Int Int) T@U)
(declare-fun ZeroPMask () T@U)
(declare-fun acyclic_graph (T@U) Bool)
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
(assert  (and (and (and (and (and (and (and (and (and (and (and (forall ((arg0@@11 T@T) (arg1 T@T) ) (! (= (Ctor (FieldType arg0@@11 arg1)) 6)
 :qid |ctor:FieldType|
)) (forall ((arg0@@12 T@T) (arg1@@0 T@T) ) (! (= (FieldTypeInv0 (FieldType arg0@@12 arg1@@0)) arg0@@12)
 :qid |typeInv:FieldTypeInv0|
 :pattern ( (FieldType arg0@@12 arg1@@0))
))) (forall ((arg0@@13 T@T) (arg1@@1 T@T) ) (! (= (FieldTypeInv1 (FieldType arg0@@13 arg1@@1)) arg1@@1)
 :qid |typeInv:FieldTypeInv1|
 :pattern ( (FieldType arg0@@13 arg1@@1))
))) (= (Ctor NormalFieldType) 7)) (= (type $allocated) (FieldType NormalFieldType boolType))) (= (Ctor __FieldEnum__DomainTypeType) 8)) (= (type __left__) __FieldEnum__DomainTypeType)) (= (type __right__) __FieldEnum__DomainTypeType)) (= (Ctor RefType) 9)) (= (type l) (FieldType NormalFieldType RefType))) (= (type r_1) (FieldType NormalFieldType RefType))) (= (type marker) (FieldType NormalFieldType boolType))))
(assert (distinct $allocated __left__ __right__ l r_1 marker)
)
(assert  (and (and (and (and (and (forall ((arg0@@14 T@T) ) (! (= (Ctor (MapType0Type arg0@@14)) 10)
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
(assert  (and (and (and (and (forall ((arg0@@18 T@T) ) (! (= (Ctor (MultiSetType arg0@@18)) 11)
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
 :qid |stdinbpl.909:18|
 :skolemid |74|
 :pattern ( (|MultiSet#Card| (|MultiSet#Difference| a b)))
)))
(assert  (and (and (and (and (and (and (forall ((arg0@@23 T@T) (arg1@@7 T@T) ) (! (= (Ctor (MapType1Type arg0@@23 arg1@@7)) 12)
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
(assert  (and (and (and (and (and (and (forall ((arg0@@28 T@T) (arg1@@12 T@T) ) (! (= (Ctor (MapType2Type arg0@@28 arg1@@12)) 13)
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
(assert (forall ((Heap@@0 T@U) (g0 T@U) (g1 T@U) ) (!  (=> (and (and (= (type Heap@@0) (MapType0Type RefType)) (= (type g0) (MapType2Type RefType boolType))) (= (type g1) (MapType2Type RefType boolType))) (dummyFunction (bool_2_U (|apply_TCFraming#triggerStateless| g0 g1))))
 :qid |stdinbpl.1334:15|
 :skolemid |128|
 :pattern ( (|apply_TCFraming'| Heap@@0 g0 g1))
)))
(assert (forall ((a@@0 Int) (b@@0 Int) ) (!  (or (= (|Math#min| a@@0 b@@0) a@@0) (= (|Math#min| a@@0 b@@0) b@@0))
 :qid |stdinbpl.840:15|
 :skolemid |53|
 :pattern ( (|Math#min| a@@0 b@@0))
)))
(assert  (and (and (= (Ctor FrameTypeType) 14) (= (type null) RefType)) (forall ((arg0@@33 T@U) ) (! (let ((A (FieldTypeInv0 (type arg0@@33))))
(= (type (PredicateMaskField arg0@@33)) (FieldType A (MapType1Type RefType boolType))))
 :qid |funType:PredicateMaskField|
 :pattern ( (PredicateMaskField arg0@@33))
))))
(assert (forall ((Heap@@1 T@U) (ExhaleHeap T@U) (Mask@@0 T@U) (pm_f T@U) ) (! (let ((C (FieldTypeInv0 (type pm_f))))
 (=> (and (and (and (and (and (= (type Heap@@1) (MapType0Type RefType)) (= (type ExhaleHeap) (MapType0Type RefType))) (= (type Mask@@0) (MapType1Type RefType realType))) (= (type pm_f) (FieldType C FrameTypeType))) (IdenticalOnKnownLocations Heap@@1 ExhaleHeap Mask@@0)) (and (HasDirectPerm Mask@@0 null pm_f) (IsPredicateField pm_f))) (= (MapType0Select Heap@@1 null (PredicateMaskField pm_f)) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))))
 :qid |stdinbpl.47:19|
 :skolemid |2|
 :pattern ( (IdenticalOnKnownLocations Heap@@1 ExhaleHeap Mask@@0) (IsPredicateField pm_f) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))
)))
(assert (forall ((arg0@@34 T@U) ) (! (let ((A@@0 (FieldTypeInv0 (type arg0@@34))))
(= (type (WandMaskField arg0@@34)) (FieldType A@@0 (MapType1Type RefType boolType))))
 :qid |funType:WandMaskField|
 :pattern ( (WandMaskField arg0@@34))
)))
(assert (forall ((Heap@@2 T@U) (ExhaleHeap@@0 T@U) (Mask@@1 T@U) (pm_f@@0 T@U) ) (! (let ((C@@0 (FieldTypeInv0 (type pm_f@@0))))
 (=> (and (and (and (and (and (= (type Heap@@2) (MapType0Type RefType)) (= (type ExhaleHeap@@0) (MapType0Type RefType))) (= (type Mask@@1) (MapType1Type RefType realType))) (= (type pm_f@@0) (FieldType C@@0 FrameTypeType))) (IdenticalOnKnownLocations Heap@@2 ExhaleHeap@@0 Mask@@1)) (and (HasDirectPerm Mask@@1 null pm_f@@0) (IsWandField pm_f@@0))) (= (MapType0Select Heap@@2 null (WandMaskField pm_f@@0)) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))))
 :qid |stdinbpl.60:19|
 :skolemid |5|
 :pattern ( (IdenticalOnKnownLocations Heap@@2 ExhaleHeap@@0 Mask@@1) (IsWandField pm_f@@0) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))
)))
(assert  (and (and (= (Ctor EdgeDomainTypeType) 15) (forall ((arg0@@35 T@U) (arg1@@17 T@U) ) (! (= (type (|$$'| arg0@@35 arg1@@17)) (MapType2Type EdgeDomainTypeType boolType))
 :qid |funType:$$'|
 :pattern ( (|$$'| arg0@@35 arg1@@17))
))) (forall ((arg0@@36 T@U) ) (! (= (type (|$$#triggerStateless| arg0@@36)) (MapType2Type EdgeDomainTypeType boolType))
 :qid |funType:$$#triggerStateless|
 :pattern ( (|$$#triggerStateless| arg0@@36))
))))
(assert (forall ((Heap@@3 T@U) (refs T@U) ) (!  (=> (and (= (type Heap@@3) (MapType0Type RefType)) (= (type refs) (MapType2Type RefType boolType))) (dummyFunction (|$$#triggerStateless| refs)))
 :qid |stdinbpl.1112:15|
 :skolemid |100|
 :pattern ( (|$$'| Heap@@3 refs))
)))
(assert (forall ((a@@1 T@U) (b@@1 T@U) (y@@1 T@U) ) (! (let ((T@@3 (type y@@1)))
 (=> (and (and (= (type a@@1) (MultiSetType T@@3)) (= (type b@@1) (MultiSetType T@@3))) (<= (|MultiSet#Select| a@@1 y@@1) (|MultiSet#Select| b@@1 y@@1))) (= (|MultiSet#Select| (|MultiSet#Difference| a@@1 b@@1) y@@1) 0)))
 :qid |stdinbpl.907:18|
 :skolemid |73|
 :pattern ( (|MultiSet#Difference| a@@1 b@@1) (|MultiSet#Select| b@@1 y@@1) (|MultiSet#Select| a@@1 y@@1))
)))
(assert (forall ((arg0@@37 T@U) (arg1@@18 T@U) ) (! (let ((T@@4 (MapType2TypeInv0 (type arg0@@37))))
(= (type (|Set#Union| arg0@@37 arg1@@18)) (MapType2Type T@@4 boolType)))
 :qid |funType:Set#Union|
 :pattern ( (|Set#Union| arg0@@37 arg1@@18))
)))
(assert (forall ((a@@2 T@U) (b@@2 T@U) ) (! (let ((T@@5 (MapType2TypeInv0 (type a@@2))))
 (=> (and (= (type a@@2) (MapType2Type T@@5 boolType)) (= (type b@@2) (MapType2Type T@@5 boolType))) (= (|Set#Union| (|Set#Union| a@@2 b@@2) b@@2) (|Set#Union| a@@2 b@@2))))
 :qid |stdinbpl.792:18|
 :skolemid |38|
 :pattern ( (|Set#Union| (|Set#Union| a@@2 b@@2) b@@2))
)))
(assert (forall ((arg0@@38 T@U) (arg1@@19 T@U) ) (! (let ((T@@6 (MapType2TypeInv0 (type arg0@@38))))
(= (type (|Set#Intersection| arg0@@38 arg1@@19)) (MapType2Type T@@6 boolType)))
 :qid |funType:Set#Intersection|
 :pattern ( (|Set#Intersection| arg0@@38 arg1@@19))
)))
(assert (forall ((a@@3 T@U) (b@@3 T@U) ) (! (let ((T@@7 (MapType2TypeInv0 (type a@@3))))
 (=> (and (= (type a@@3) (MapType2Type T@@7 boolType)) (= (type b@@3) (MapType2Type T@@7 boolType))) (= (|Set#Intersection| (|Set#Intersection| a@@3 b@@3) b@@3) (|Set#Intersection| a@@3 b@@3))))
 :qid |stdinbpl.796:18|
 :skolemid |40|
 :pattern ( (|Set#Intersection| (|Set#Intersection| a@@3 b@@3) b@@3))
)))
(assert (forall ((a@@4 T@U) (b@@4 T@U) ) (! (let ((T@@8 (MultiSetTypeInv0 (type a@@4))))
 (=> (and (= (type a@@4) (MultiSetType T@@8)) (= (type b@@4) (MultiSetType T@@8))) (= (|MultiSet#Intersection| (|MultiSet#Intersection| a@@4 b@@4) b@@4) (|MultiSet#Intersection| a@@4 b@@4))))
 :qid |stdinbpl.898:18|
 :skolemid |70|
 :pattern ( (|MultiSet#Intersection| (|MultiSet#Intersection| a@@4 b@@4) b@@4))
)))
(assert (forall ((arg0@@39 T@U) ) (! (let ((T@@9 (type arg0@@39)))
(= (type (|Set#Singleton| arg0@@39)) (MapType2Type T@@9 boolType)))
 :qid |funType:Set#Singleton|
 :pattern ( (|Set#Singleton| arg0@@39))
)))
(assert (forall ((r T@U) (o T@U) ) (! (let ((T@@10 (type r)))
 (=> (= (type o) T@@10) (= (U_2_bool (MapType2Select (|Set#Singleton| r) o)) (= r o))))
 :qid |stdinbpl.761:18|
 :skolemid |27|
 :pattern ( (MapType2Select (|Set#Singleton| r) o))
)))
(assert (forall ((a@@5 T@U) (b@@5 T@U) ) (! (let ((T@@11 (MapType2TypeInv0 (type a@@5))))
 (=> (and (= (type a@@5) (MapType2Type T@@11 boolType)) (= (type b@@5) (MapType2Type T@@11 boolType))) (= (+ (|Set#Card| (|Set#Union| a@@5 b@@5)) (|Set#Card| (|Set#Intersection| a@@5 b@@5))) (+ (|Set#Card| a@@5) (|Set#Card| b@@5)))))
 :qid |stdinbpl.800:18|
 :skolemid |42|
 :pattern ( (|Set#Card| (|Set#Union| a@@5 b@@5)))
 :pattern ( (|Set#Card| (|Set#Intersection| a@@5 b@@5)))
)))
(assert (forall ((arg0@@40 T@U) (arg1@@20 T@U) ) (! (= (type (inst_uReach arg0@@40 arg1@@20)) (MapType2Type RefType boolType))
 :qid |funType:inst_uReach|
 :pattern ( (inst_uReach arg0@@40 arg1@@20))
)))
(assert (forall ((EG_1 T@U) (x_1 T@U) (v_2 T@U) ) (!  (=> (and (and (= (type EG_1) (MapType2Type EdgeDomainTypeType boolType)) (= (type x_1) RefType)) (= (type v_2) RefType)) (= (U_2_bool (MapType2Select (inst_uReach EG_1 x_1) v_2)) (exists_path EG_1 x_1 v_2)))
 :qid |stdinbpl.1021:15|
 :skolemid |88|
 :pattern ( (MapType2Select (inst_uReach EG_1 x_1) v_2))
 :pattern ( (exists_path EG_1 x_1 v_2))
)))
(assert (forall ((Heap@@4 T@U) (ExhaleHeap@@1 T@U) (Mask@@2 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@4) (MapType0Type RefType)) (= (type ExhaleHeap@@1) (MapType0Type RefType))) (= (type Mask@@2) (MapType1Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@4 ExhaleHeap@@1 Mask@@2)) (U_2_bool (MapType0Select Heap@@4 o_1 $allocated))) (U_2_bool (MapType0Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.73:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@4 ExhaleHeap@@1 Mask@@2) (MapType0Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert (forall ((arg0@@41 T@U) (arg1@@21 T@U) ) (! (= (type ($$ arg0@@41 arg1@@21)) (MapType2Type EdgeDomainTypeType boolType))
 :qid |funType:$$|
 :pattern ( ($$ arg0@@41 arg1@@21))
)))
(assert (forall ((Heap@@5 T@U) (refs@@0 T@U) ) (!  (=> (and (= (type Heap@@5) (MapType0Type RefType)) (= (type refs@@0) (MapType2Type RefType boolType))) (and (= ($$ Heap@@5 refs@@0) (|$$'| Heap@@5 refs@@0)) (dummyFunction (|$$#triggerStateless| refs@@0))))
 :qid |stdinbpl.1108:15|
 :skolemid |99|
 :pattern ( ($$ Heap@@5 refs@@0))
)))
(assert (forall ((a@@6 Int) ) (!  (=> (<= 0 a@@6) (= (|Math#clip| a@@6) a@@6))
 :qid |stdinbpl.843:15|
 :skolemid |54|
 :pattern ( (|Math#clip| a@@6))
)))
(assert (forall ((EG_1@@0 T@U) (u_1 T@U) (v_2@@0 T@U) (w_1 T@U) ) (!  (=> (and (and (and (and (= (type EG_1@@0) (MapType2Type EdgeDomainTypeType boolType)) (= (type u_1) RefType)) (= (type v_2@@0) RefType)) (= (type w_1) RefType)) (and (exists_path_ EG_1@@0 u_1 w_1) (exists_path_ EG_1@@0 w_1 v_2@@0))) (exists_path_ EG_1@@0 u_1 v_2@@0))
 :qid |stdinbpl.1042:15|
 :skolemid |92|
 :pattern ( (exists_path EG_1@@0 u_1 w_1) (exists_path EG_1@@0 w_1 v_2@@0))
)))
(assert  (and (and (forall ((arg0@@42 T@U) (arg1@@22 T@U) ) (! (= (type (CombineFrames arg0@@42 arg1@@22)) FrameTypeType)
 :qid |funType:CombineFrames|
 :pattern ( (CombineFrames arg0@@42 arg1@@22))
)) (forall ((arg0@@43 T@U) ) (! (= (type (FrameFragment arg0@@43)) FrameTypeType)
 :qid |funType:FrameFragment|
 :pattern ( (FrameFragment arg0@@43))
))) (forall ((arg0@@44 T@U) (arg1@@23 T@U) ) (! (= (type (|$$#frame| arg0@@44 arg1@@23)) (MapType2Type EdgeDomainTypeType boolType))
 :qid |funType:$$#frame|
 :pattern ( (|$$#frame| arg0@@44 arg1@@23))
))))
(assert (forall ((Heap@@6 T@U) (Mask@@3 T@U) (g0@@0 T@U) (g1@@0 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@6) (MapType0Type RefType)) (= (type Mask@@3) (MapType1Type RefType realType))) (= (type g0@@0) (MapType2Type RefType boolType))) (= (type g1@@0) (MapType2Type RefType boolType))) (and (state Heap@@6 Mask@@3) (or (< AssumeFunctionsAbove 0) (|apply_TCFraming#trigger| (CombineFrames (FrameFragment (int_2_U (|apply_TCFraming#condqp3| Heap@@6 g0@@0 g1@@0))) (CombineFrames (FrameFragment (int_2_U (|apply_TCFraming#condqp4| Heap@@6 g0@@0 g1@@0))) (CombineFrames (FrameFragment (int_2_U (|apply_TCFraming#condqp5| Heap@@6 g0@@0 g1@@0))) (FrameFragment (int_2_U (|apply_TCFraming#condqp6| Heap@@6 g0@@0 g1@@0)))))) g0@@0 g1@@0)))) (and (forall ((n$0 T@U) ) (!  (=> (and (= (type n$0) RefType) (U_2_bool (MapType2Select g0@@0 n$0))) (not (U_2_bool (MapType2Select g1@@0 n$0))))
 :qid |stdinbpl.1425:359|
 :skolemid |145|
 :pattern ( (MapType2Select g0@@0 n$0) (MapType2Select g1@@0 n$0))
)) (forall ((n$1 T@U) ) (!  (=> (and (= (type n$1) RefType) (U_2_bool (MapType2Select g1@@0 n$1))) (not (U_2_bool (MapType2Select g0@@0 n$1))))
 :qid |stdinbpl.1428:16|
 :skolemid |146|
 :pattern ( (MapType2Select g0@@0 n$1) (MapType2Select g1@@0 n$1))
)))) (forall ((u_2 T@U) (v_2_1 T@U) ) (!  (=> (and (and (= (type u_2) RefType) (= (type v_2_1) RefType)) (and (U_2_bool (MapType2Select g0@@0 u_2)) (and (U_2_bool (MapType2Select g0@@0 v_2_1)) (not (exists_path ($$ Heap@@6 g0@@0) u_2 v_2_1))))) (not (exists_path ($$ Heap@@6 (|Set#Union| g0@@0 g1@@0)) u_2 v_2_1)))
 :qid |stdinbpl.1431:17|
 :skolemid |147|
 :pattern ( (exists_path (|$$#frame| (CombineFrames (FrameFragment (int_2_U (|$$#condqp1| Heap@@6 g0@@0))) (FrameFragment (int_2_U (|$$#condqp2| Heap@@6 g0@@0)))) g0@@0) u_2 v_2_1))
 :pattern ( (exists_path (|$$#frame| (CombineFrames (FrameFragment (int_2_U (|$$#condqp1| Heap@@6 (|Set#Union| g0@@0 g1@@0)))) (FrameFragment (int_2_U (|$$#condqp2| Heap@@6 (|Set#Union| g0@@0 g1@@0))))) (|Set#Union| g0@@0 g1@@0)) u_2 v_2_1))
)))
 :qid |stdinbpl.1423:15|
 :skolemid |148|
 :pattern ( (state Heap@@6 Mask@@3) (|apply_TCFraming'| Heap@@6 g0@@0 g1@@0))
)))
(assert (forall ((Heap@@7 T@U) (Mask@@4 T@U) (g0@@1 T@U) (g1@@1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@7) (MapType0Type RefType)) (= (type Mask@@4) (MapType1Type RefType realType))) (= (type g0@@1) (MapType2Type RefType boolType))) (= (type g1@@1) (MapType2Type RefType boolType))) (and (state Heap@@7 Mask@@4) (or (< AssumeFunctionsAbove 0) (|apply_TCFraming#trigger| (CombineFrames (FrameFragment (int_2_U (|apply_TCFraming#condqp3| Heap@@7 g0@@1 g1@@1))) (CombineFrames (FrameFragment (int_2_U (|apply_TCFraming#condqp4| Heap@@7 g0@@1 g1@@1))) (CombineFrames (FrameFragment (int_2_U (|apply_TCFraming#condqp5| Heap@@7 g0@@1 g1@@1))) (FrameFragment (int_2_U (|apply_TCFraming#condqp6| Heap@@7 g0@@1 g1@@1)))))) g0@@1 g1@@1)))) (and (forall ((n$0@@0 T@U) ) (!  (=> (and (= (type n$0@@0) RefType) (U_2_bool (MapType2Select g0@@1 n$0@@0))) (not (U_2_bool (MapType2Select g1@@1 n$0@@0))))
 :qid |stdinbpl.1438:359|
 :skolemid |149|
 :pattern ( (MapType2Select g0@@1 n$0@@0) (MapType2Select g1@@1 n$0@@0))
)) (forall ((n$1@@0 T@U) ) (!  (=> (and (= (type n$1@@0) RefType) (U_2_bool (MapType2Select g1@@1 n$1@@0))) (not (U_2_bool (MapType2Select g0@@1 n$1@@0))))
 :qid |stdinbpl.1441:16|
 :skolemid |150|
 :pattern ( (MapType2Select g0@@1 n$1@@0) (MapType2Select g1@@1 n$1@@0))
)))) (forall ((u_3 T@U) (v_3 T@U) ) (!  (=> (and (and (= (type u_3) RefType) (= (type v_3) RefType)) (and (U_2_bool (MapType2Select g1@@1 u_3)) (and (U_2_bool (MapType2Select g1@@1 v_3)) (not (exists_path ($$ Heap@@7 g1@@1) u_3 v_3))))) (not (exists_path ($$ Heap@@7 (|Set#Union| g1@@1 g0@@1)) u_3 v_3)))
 :qid |stdinbpl.1444:17|
 :skolemid |151|
 :pattern ( (exists_path (|$$#frame| (CombineFrames (FrameFragment (int_2_U (|$$#condqp1| Heap@@7 g1@@1))) (FrameFragment (int_2_U (|$$#condqp2| Heap@@7 g1@@1)))) g1@@1) u_3 v_3))
 :pattern ( (exists_path (|$$#frame| (CombineFrames (FrameFragment (int_2_U (|$$#condqp1| Heap@@7 (|Set#Union| g0@@1 g1@@1)))) (FrameFragment (int_2_U (|$$#condqp2| Heap@@7 (|Set#Union| g0@@1 g1@@1))))) (|Set#Union| g0@@1 g1@@1)) u_3 v_3))
)))
 :qid |stdinbpl.1436:15|
 :skolemid |152|
 :pattern ( (state Heap@@7 Mask@@4) (|apply_TCFraming'| Heap@@7 g0@@1 g1@@1))
)))
(assert (forall ((a@@7 T@U) (b@@6 T@U) (o@@0 T@U) ) (! (let ((T@@12 (type o@@0)))
 (=> (and (= (type a@@7) (MultiSetType T@@12)) (= (type b@@6) (MultiSetType T@@12))) (= (|MultiSet#Select| (|MultiSet#Intersection| a@@7 b@@6) o@@0) (|Math#min| (|MultiSet#Select| a@@7 o@@0) (|MultiSet#Select| b@@6 o@@0)))))
 :qid |stdinbpl.894:18|
 :skolemid |69|
 :pattern ( (|MultiSet#Select| (|MultiSet#Intersection| a@@7 b@@6) o@@0))
)))
(assert (forall ((EG_1@@1 T@U) (start_1 T@U) (end_1 T@U) ) (!  (=> (and (and (= (type EG_1@@1) (MapType2Type EdgeDomainTypeType boolType)) (= (type start_1) RefType)) (= (type end_1) RefType)) (= (exists_path_ EG_1@@1 start_1 end_1)  (or (= start_1 end_1) (exists ((w_1@@0 T@U) ) (!  (and (= (type w_1@@0) RefType) (and (edge EG_1@@1 start_1 w_1@@0) (exists_path_ EG_1@@1 w_1@@0 end_1)))
 :qid |stdinbpl.1035:78|
 :skolemid |90|
 :pattern ( (edge EG_1@@1 start_1 w_1@@0))
 :pattern ( (exists_path_ EG_1@@1 w_1@@0 end_1))
)))))
 :qid |stdinbpl.1033:15|
 :skolemid |91|
 :pattern ( (exists_path EG_1@@1 start_1 end_1))
 :pattern ( (edge EG_1@@1 start_1 end_1))
)))
(assert (forall ((Heap@@8 T@U) (ExhaleHeap@@2 T@U) (Mask@@5 T@U) (o_1@@0 T@U) (f_2 T@U) ) (! (let ((B@@1 (FieldTypeInv1 (type f_2))))
(let ((A@@1 (FieldTypeInv0 (type f_2))))
 (=> (and (and (and (and (and (and (= (type Heap@@8) (MapType0Type RefType)) (= (type ExhaleHeap@@2) (MapType0Type RefType))) (= (type Mask@@5) (MapType1Type RefType realType))) (= (type o_1@@0) RefType)) (= (type f_2) (FieldType A@@1 B@@1))) (IdenticalOnKnownLocations Heap@@8 ExhaleHeap@@2 Mask@@5)) (HasDirectPerm Mask@@5 o_1@@0 f_2)) (= (MapType0Select Heap@@8 o_1@@0 f_2) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2)))))
 :qid |stdinbpl.42:22|
 :skolemid |1|
 :pattern ( (IdenticalOnKnownLocations Heap@@8 ExhaleHeap@@2 Mask@@5) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2))
)))
(assert (forall ((arg0@@45 T@U) (arg1@@24 T@U) ) (! (= (type (create_edge arg0@@45 arg1@@24)) EdgeDomainTypeType)
 :qid |funType:create_edge|
 :pattern ( (create_edge arg0@@45 arg1@@24))
)))
(assert (forall ((EG_1@@2 T@U) (p_2 T@U) (s_1 T@U) ) (!  (=> (and (and (= (type EG_1@@2) (MapType2Type EdgeDomainTypeType boolType)) (= (type p_2) RefType)) (= (type s_1) RefType)) (= (edge_ EG_1@@2 p_2 s_1) (U_2_bool (MapType2Select EG_1@@2 (create_edge p_2 s_1)))))
 :qid |stdinbpl.1003:15|
 :skolemid |84|
 :pattern ( (MapType2Select EG_1@@2 (create_edge p_2 s_1)))
 :pattern ( (edge EG_1@@2 p_2 s_1))
)))
(assert  (and (= (type dummyHeap) (MapType0Type RefType)) (= (type ZeroMask) (MapType1Type RefType realType))))
(assert (state dummyHeap ZeroMask))
(assert (forall ((arg0@@46 T@U) (arg1@@25 T@U) ) (! (let ((T@@13 (type arg1@@25)))
(= (type (|MultiSet#UnionOne| arg0@@46 arg1@@25)) (MultiSetType T@@13)))
 :qid |funType:MultiSet#UnionOne|
 :pattern ( (|MultiSet#UnionOne| arg0@@46 arg1@@25))
)))
(assert (forall ((a@@8 T@U) (x@@8 T@U) ) (! (let ((T@@14 (type x@@8)))
 (=> (= (type a@@8) (MultiSetType T@@14)) (= (|MultiSet#Card| (|MultiSet#UnionOne| a@@8 x@@8)) (+ (|MultiSet#Card| a@@8) 1))))
 :qid |stdinbpl.880:18|
 :skolemid |65|
 :pattern ( (|MultiSet#Card| (|MultiSet#UnionOne| a@@8 x@@8)))
 :pattern ( (|MultiSet#UnionOne| a@@8 x@@8) (|MultiSet#Card| a@@8))
)))
(assert (forall ((a@@9 T@U) (b@@7 T@U) ) (! (let ((T@@15 (MultiSetTypeInv0 (type a@@9))))
 (=> (and (= (type a@@9) (MultiSetType T@@15)) (= (type b@@7) (MultiSetType T@@15))) (= (|MultiSet#Disjoint| a@@9 b@@7) (forall ((o@@1 T@U) ) (!  (=> (= (type o@@1) T@@15) (or (= (|MultiSet#Select| a@@9 o@@1) 0) (= (|MultiSet#Select| b@@7 o@@1) 0)))
 :qid |stdinbpl.930:39|
 :skolemid |80|
 :pattern ( (|MultiSet#Select| a@@9 o@@1))
 :pattern ( (|MultiSet#Select| b@@7 o@@1))
)))))
 :qid |stdinbpl.929:18|
 :skolemid |81|
 :pattern ( (|MultiSet#Disjoint| a@@9 b@@7))
)))
(assert (forall ((Heap@@9 T@U) (Mask@@6 T@U) (refs@@1 T@U) ) (!  (=> (and (and (and (= (type Heap@@9) (MapType0Type RefType)) (= (type Mask@@6) (MapType1Type RefType realType))) (= (type refs@@1) (MapType2Type RefType boolType))) (state Heap@@9 Mask@@6)) (= (|$$'| Heap@@9 refs@@1) (|$$#frame| (CombineFrames (FrameFragment (int_2_U (|$$#condqp1| Heap@@9 refs@@1))) (FrameFragment (int_2_U (|$$#condqp2| Heap@@9 refs@@1)))) refs@@1)))
 :qid |stdinbpl.1119:15|
 :skolemid |101|
 :pattern ( (state Heap@@9 Mask@@6) (|$$'| Heap@@9 refs@@1))
)))
(assert (forall ((p T@U) (v_1 T@U) (w T@U) ) (! (let ((A@@2 (FieldTypeInv0 (type p))))
 (=> (and (and (= (type p) (FieldType A@@2 FrameTypeType)) (= (type v_1) FrameTypeType)) (= (type w) FrameTypeType)) (not (InsidePredicate p v_1 p w))))
 :qid |stdinbpl.738:19|
 :skolemid |21|
 :pattern ( (InsidePredicate p v_1 p w))
)))
(assert (forall ((Heap@@10 T@U) (Mask@@7 T@U) (refs@@2 T@U) ) (!  (=> (and (and (and (= (type Heap@@10) (MapType0Type RefType)) (= (type Mask@@7) (MapType1Type RefType realType))) (= (type refs@@2) (MapType2Type RefType boolType))) (and (state Heap@@10 Mask@@7) (or (< AssumeFunctionsAbove 1) (|$$#trigger| (CombineFrames (FrameFragment (int_2_U (|$$#condqp1| Heap@@10 refs@@2))) (FrameFragment (int_2_U (|$$#condqp2| Heap@@10 refs@@2)))) refs@@2)))) (forall ((p_2@@0 T@U) (s_1@@0 T@U) ) (!  (=> (and (= (type p_2@@0) RefType) (= (type s_1@@0) RefType)) (=  (and (U_2_bool (MapType2Select refs@@2 p_2@@0)) (and (U_2_bool (MapType2Select refs@@2 s_1@@0)) (or (= (MapType0Select Heap@@10 p_2@@0 l) s_1@@0) (= (MapType0Select Heap@@10 p_2@@0 r_1) s_1@@0)))) (U_2_bool (MapType2Select (|$$'| Heap@@10 refs@@2) (create_edge p_2@@0 s_1@@0)))))
 :qid |stdinbpl.1147:176|
 :skolemid |104|
 :pattern ( (create_edge p_2@@0 s_1@@0))
)))
 :qid |stdinbpl.1145:15|
 :skolemid |105|
 :pattern ( (state Heap@@10 Mask@@7) (|$$'| Heap@@10 refs@@2))
)))
(assert (forall ((arg0@@47 T@U) ) (! (let ((T@@16 (type arg0@@47)))
(= (type (|MultiSet#Singleton| arg0@@47)) (MultiSetType T@@16)))
 :qid |funType:MultiSet#Singleton|
 :pattern ( (|MultiSet#Singleton| arg0@@47))
)))
(assert (forall ((r@@0 T@U) ) (!  (and (= (|MultiSet#Card| (|MultiSet#Singleton| r@@0)) 1) (= (|MultiSet#Select| (|MultiSet#Singleton| r@@0) r@@0) 1))
 :qid |stdinbpl.872:18|
 :skolemid |62|
 :pattern ( (|MultiSet#Singleton| r@@0))
)))
(assert  (not (IsPredicateField l)))
(assert  (not (IsWandField l)))
(assert  (not (IsPredicateField r_1)))
(assert  (not (IsWandField r_1)))
(assert  (not (IsPredicateField marker)))
(assert  (not (IsWandField marker)))
(assert (forall ((Heap@@11 T@U) (ExhaleHeap@@3 T@U) (Mask@@8 T@U) ) (!  (=> (and (and (and (= (type Heap@@11) (MapType0Type RefType)) (= (type ExhaleHeap@@3) (MapType0Type RefType))) (= (type Mask@@8) (MapType1Type RefType realType))) (IdenticalOnKnownLocations Heap@@11 ExhaleHeap@@3 Mask@@8)) (succHeap Heap@@11 ExhaleHeap@@3))
 :qid |stdinbpl.83:15|
 :skolemid |10|
 :pattern ( (IdenticalOnKnownLocations Heap@@11 ExhaleHeap@@3 Mask@@8))
)))
(assert (forall ((EG_1@@3 T@U) (U_1 T@U) (M_1 T@U) ) (!  (=> (and (and (and (and (= (type EG_1@@3) (MapType2Type EdgeDomainTypeType boolType)) (= (type U_1) (MapType2Type RefType boolType))) (= (type M_1) (MapType2Type RefType boolType))) (apply_noExit EG_1@@3 U_1 M_1)) (forall ((u_1@@0 T@U) (v_2@@1 T@U) ) (!  (=> (and (and (= (type u_1@@0) RefType) (= (type v_2@@1) RefType)) (and (U_2_bool (MapType2Select M_1 u_1@@0)) (and (U_2_bool (MapType2Select U_1 v_2@@1)) (not (U_2_bool (MapType2Select M_1 v_2@@1)))))) (not (edge EG_1@@3 u_1@@0 v_2@@1)))
 :qid |stdinbpl.1011:52|
 :skolemid |85|
 :pattern ( (edge EG_1@@3 u_1@@0 v_2@@1))
 :pattern ( (MapType2Select M_1 u_1@@0) (MapType2Select M_1 v_2@@1))
))) (forall ((u_1_1 T@U) (v_1_1 T@U) ) (!  (=> (and (and (= (type u_1_1) RefType) (= (type v_1_1) RefType)) (and (U_2_bool (MapType2Select M_1 u_1_1)) (and (U_2_bool (MapType2Select U_1 v_1_1)) (not (U_2_bool (MapType2Select M_1 v_1_1)))))) (not (exists_path EG_1@@3 u_1_1 v_1_1)))
 :qid |stdinbpl.1014:17|
 :skolemid |86|
 :pattern ( (exists_path EG_1@@3 u_1_1 v_1_1))
 :pattern ( (MapType2Select M_1 u_1_1) (MapType2Select M_1 v_1_1))
)))
 :qid |stdinbpl.1009:15|
 :skolemid |87|
 :pattern ( (apply_noExit EG_1@@3 U_1 M_1))
)))
(assert (forall ((a@@10 T@U) (b@@8 T@U) ) (! (let ((T@@17 (MapType2TypeInv0 (type a@@10))))
 (=> (and (= (type a@@10) (MapType2Type T@@17 boolType)) (= (type b@@8) (MapType2Type T@@17 boolType))) (= (|Set#Equal| a@@10 b@@8) (forall ((o@@2 T@U) ) (!  (=> (= (type o@@2) T@@17) (= (U_2_bool (MapType2Select a@@10 o@@2)) (U_2_bool (MapType2Select b@@8 o@@2))))
 :qid |stdinbpl.825:31|
 :skolemid |48|
 :pattern ( (MapType2Select a@@10 o@@2))
 :pattern ( (MapType2Select b@@8 o@@2))
)))))
 :qid |stdinbpl.824:17|
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
 :qid |stdinbpl.890:18|
 :skolemid |68|
 :pattern ( (|MultiSet#Card| (|MultiSet#Union| a@@11 b@@9)))
 :pattern ( (|MultiSet#Card| a@@11) (|MultiSet#Union| a@@11 b@@9))
 :pattern ( (|MultiSet#Card| b@@9) (|MultiSet#Union| a@@11 b@@9))
)))
(assert  (and (forall ((arg0@@48 Real) (arg1@@26 T@U) ) (! (= (type (ConditionalFrame arg0@@48 arg1@@26)) FrameTypeType)
 :qid |funType:ConditionalFrame|
 :pattern ( (ConditionalFrame arg0@@48 arg1@@26))
)) (= (type EmptyFrame) FrameTypeType)))
(assert (forall ((p@@0 Real) (f_6 T@U) ) (!  (=> (= (type f_6) FrameTypeType) (= (ConditionalFrame p@@0 f_6) (ite (> p@@0 0.0) f_6 EmptyFrame)))
 :qid |stdinbpl.726:15|
 :skolemid |19|
 :pattern ( (ConditionalFrame p@@0 f_6))
)))
(assert (forall ((Mask@@9 T@U) (o_2@@0 T@U) (f_4@@0 T@U) ) (! (let ((B@@3 (FieldTypeInv1 (type f_4@@0))))
(let ((A@@4 (FieldTypeInv0 (type f_4@@0))))
 (=> (and (and (= (type Mask@@9) (MapType1Type RefType realType)) (= (type o_2@@0) RefType)) (= (type f_4@@0) (FieldType A@@4 B@@3))) (= (HasDirectPerm Mask@@9 o_2@@0 f_4@@0) (> (U_2_real (MapType1Select Mask@@9 o_2@@0 f_4@@0)) NoPerm)))))
 :qid |stdinbpl.133:22|
 :skolemid |17|
 :pattern ( (HasDirectPerm Mask@@9 o_2@@0 f_4@@0))
)))
(assert  (and (forall ((arg0@@49 T@U) ) (! (= (type (edge_pred arg0@@49)) RefType)
 :qid |funType:edge_pred|
 :pattern ( (edge_pred arg0@@49))
)) (forall ((arg0@@50 T@U) ) (! (= (type (edge_succ arg0@@50)) RefType)
 :qid |funType:edge_succ|
 :pattern ( (edge_succ arg0@@50))
))))
(assert (forall ((p_2@@1 T@U) (s_1@@1 T@U) ) (!  (=> (and (= (type p_2@@1) RefType) (= (type s_1@@1) RefType)) (and (= (edge_pred (create_edge p_2@@1 s_1@@1)) p_2@@1) (= (edge_succ (create_edge p_2@@1 s_1@@1)) s_1@@1)))
 :qid |stdinbpl.954:15|
 :skolemid |82|
 :pattern ( (create_edge p_2@@1 s_1@@1))
)))
(assert (forall ((Heap@@12 T@U) (Mask@@10 T@U) (refs@@3 T@U) ) (!  (=> (and (and (and (= (type Heap@@12) (MapType0Type RefType)) (= (type Mask@@10) (MapType1Type RefType realType))) (= (type refs@@3) (MapType2Type RefType boolType))) (and (state Heap@@12 Mask@@10) (or (< AssumeFunctionsAbove 1) (|$$#trigger| (CombineFrames (FrameFragment (int_2_U (|$$#condqp1| Heap@@12 refs@@3))) (FrameFragment (int_2_U (|$$#condqp2| Heap@@12 refs@@3)))) refs@@3)))) (forall ((p_1_1 T@U) (s_1_1 T@U) ) (!  (=> (and (and (= (type p_1_1) RefType) (= (type s_1_1) RefType)) (and (U_2_bool (MapType2Select refs@@3 p_1_1)) (exists_path (|$$'| Heap@@12 refs@@3) p_1_1 s_1_1))) (U_2_bool (MapType2Select refs@@3 s_1_1)))
 :qid |stdinbpl.1154:176|
 :skolemid |106|
 :pattern ( (MapType2Select refs@@3 p_1_1) (MapType2Select refs@@3 s_1_1) (exists_path (|$$'| Heap@@12 refs@@3) p_1_1 s_1_1))
)))
 :qid |stdinbpl.1152:15|
 :skolemid |107|
 :pattern ( (state Heap@@12 Mask@@10) (|$$'| Heap@@12 refs@@3))
)))
(assert (forall ((Heap@@13 T@U) (Mask@@11 T@U) (refs@@4 T@U) ) (!  (=> (and (and (and (= (type Heap@@13) (MapType0Type RefType)) (= (type Mask@@11) (MapType1Type RefType realType))) (= (type refs@@4) (MapType2Type RefType boolType))) (and (state Heap@@13 Mask@@11) (or (< AssumeFunctionsAbove 1) (|$$#trigger| (CombineFrames (FrameFragment (int_2_U (|$$#condqp1| Heap@@13 refs@@4))) (FrameFragment (int_2_U (|$$#condqp2| Heap@@13 refs@@4)))) refs@@4)))) (forall ((p_2_1 T@U) (s_2 T@U) ) (!  (=> (and (and (= (type p_2_1) RefType) (= (type s_2) RefType)) (and (U_2_bool (MapType2Select refs@@4 s_2)) (exists_path (|$$'| Heap@@13 refs@@4) p_2_1 s_2))) (U_2_bool (MapType2Select refs@@4 p_2_1)))
 :qid |stdinbpl.1161:176|
 :skolemid |108|
 :pattern ( (MapType2Select refs@@4 p_2_1) (MapType2Select refs@@4 s_2) (exists_path (|$$'| Heap@@13 refs@@4) p_2_1 s_2))
)))
 :qid |stdinbpl.1159:15|
 :skolemid |109|
 :pattern ( (state Heap@@13 Mask@@11) (|$$'| Heap@@13 refs@@4))
)))
(assert (forall ((o_2@@1 T@U) (f_4@@1 T@U) ) (! (let ((B@@4 (FieldTypeInv1 (type f_4@@1))))
(let ((A@@5 (FieldTypeInv0 (type f_4@@1))))
 (=> (and (= (type o_2@@1) RefType) (= (type f_4@@1) (FieldType A@@5 B@@4))) (= (U_2_real (MapType1Select ZeroMask o_2@@1 f_4@@1)) NoPerm))))
 :qid |stdinbpl.106:22|
 :skolemid |13|
 :pattern ( (MapType1Select ZeroMask o_2@@1 f_4@@1))
)))
(assert (forall ((a@@12 T@U) (b@@10 T@U) (o@@3 T@U) ) (! (let ((T@@19 (type o@@3)))
 (=> (and (= (type a@@12) (MapType2Type T@@19 boolType)) (= (type b@@10) (MapType2Type T@@19 boolType))) (= (U_2_bool (MapType2Select (|Set#Intersection| a@@12 b@@10) o@@3))  (and (U_2_bool (MapType2Select a@@12 o@@3)) (U_2_bool (MapType2Select b@@10 o@@3))))))
 :qid |stdinbpl.789:18|
 :skolemid |37|
 :pattern ( (MapType2Select (|Set#Intersection| a@@12 b@@10) o@@3))
 :pattern ( (|Set#Intersection| a@@12 b@@10) (MapType2Select a@@12 o@@3))
 :pattern ( (|Set#Intersection| a@@12 b@@10) (MapType2Select b@@10 o@@3))
)))
(assert (forall ((arg0@@51 T@U) (arg1@@27 T@U) ) (! (let ((T@@20 (MapType2TypeInv0 (type arg0@@51))))
(= (type (|Set#Difference| arg0@@51 arg1@@27)) (MapType2Type T@@20 boolType)))
 :qid |funType:Set#Difference|
 :pattern ( (|Set#Difference| arg0@@51 arg1@@27))
)))
(assert (forall ((a@@13 T@U) (b@@11 T@U) (o@@4 T@U) ) (! (let ((T@@21 (type o@@4)))
 (=> (and (= (type a@@13) (MapType2Type T@@21 boolType)) (= (type b@@11) (MapType2Type T@@21 boolType))) (= (U_2_bool (MapType2Select (|Set#Difference| a@@13 b@@11) o@@4))  (and (U_2_bool (MapType2Select a@@13 o@@4)) (not (U_2_bool (MapType2Select b@@11 o@@4)))))))
 :qid |stdinbpl.804:18|
 :skolemid |43|
 :pattern ( (MapType2Select (|Set#Difference| a@@13 b@@11) o@@4))
 :pattern ( (|Set#Difference| a@@13 b@@11) (MapType2Select a@@13 o@@4))
)))
(assert (forall ((EG_1@@4 T@U) (p_2@@2 T@U) (s_1@@2 T@U) ) (!  (=> (and (and (= (type EG_1@@4) (MapType2Type EdgeDomainTypeType boolType)) (= (type p_2@@2) RefType)) (= (type s_1@@2) RefType)) (= (edge EG_1@@4 p_2@@2 s_1@@2) (edge_ EG_1@@4 p_2@@2 s_1@@2)))
 :qid |stdinbpl.997:15|
 :skolemid |83|
 :pattern ( (edge EG_1@@4 p_2@@2 s_1@@2))
)))
(assert (forall ((EG_1@@5 T@U) (start_1@@0 T@U) (end_1@@0 T@U) ) (!  (=> (and (and (= (type EG_1@@5) (MapType2Type EdgeDomainTypeType boolType)) (= (type start_1@@0) RefType)) (= (type end_1@@0) RefType)) (= (exists_path EG_1@@5 start_1@@0 end_1@@0) (exists_path_ EG_1@@5 start_1@@0 end_1@@0)))
 :qid |stdinbpl.1027:15|
 :skolemid |89|
 :pattern ( (exists_path EG_1@@5 start_1@@0 end_1@@0))
)))
(assert (forall ((a@@14 T@U) (b@@12 T@U) ) (! (let ((T@@22 (MapType2TypeInv0 (type a@@14))))
 (=> (and (and (= (type a@@14) (MapType2Type T@@22 boolType)) (= (type b@@12) (MapType2Type T@@22 boolType))) (|Set#Equal| a@@14 b@@12)) (= a@@14 b@@12)))
 :qid |stdinbpl.826:17|
 :skolemid |50|
 :pattern ( (|Set#Equal| a@@14 b@@12))
)))
(assert (forall ((a@@15 T@U) (b@@13 T@U) ) (! (let ((T@@23 (MultiSetTypeInv0 (type a@@15))))
 (=> (and (and (= (type a@@15) (MultiSetType T@@23)) (= (type b@@13) (MultiSetType T@@23))) (|MultiSet#Equal| a@@15 b@@13)) (= a@@15 b@@13)))
 :qid |stdinbpl.925:17|
 :skolemid |79|
 :pattern ( (|MultiSet#Equal| a@@15 b@@13))
)))
(assert (forall ((arg0@@52 T@U) (arg1@@28 T@U) ) (! (let ((T@@24 (type arg1@@28)))
(= (type (|Set#UnionOne| arg0@@52 arg1@@28)) (MapType2Type T@@24 boolType)))
 :qid |funType:Set#UnionOne|
 :pattern ( (|Set#UnionOne| arg0@@52 arg1@@28))
)))
(assert (forall ((a@@16 T@U) (x@@9 T@U) (y@@2 T@U) ) (! (let ((T@@25 (type x@@9)))
 (=> (and (and (= (type a@@16) (MapType2Type T@@25 boolType)) (= (type y@@2) T@@25)) (U_2_bool (MapType2Select a@@16 y@@2))) (U_2_bool (MapType2Select (|Set#UnionOne| a@@16 x@@9) y@@2))))
 :qid |stdinbpl.769:18|
 :skolemid |31|
 :pattern ( (|Set#UnionOne| a@@16 x@@9) (MapType2Select a@@16 y@@2))
)))
(assert (forall ((a@@17 T@U) (b@@14 T@U) (y@@3 T@U) ) (! (let ((T@@26 (type y@@3)))
 (=> (and (and (= (type a@@17) (MapType2Type T@@26 boolType)) (= (type b@@14) (MapType2Type T@@26 boolType))) (U_2_bool (MapType2Select a@@17 y@@3))) (U_2_bool (MapType2Select (|Set#Union| a@@17 b@@14) y@@3))))
 :qid |stdinbpl.779:18|
 :skolemid |35|
 :pattern ( (|Set#Union| a@@17 b@@14) (MapType2Select a@@17 y@@3))
)))
(assert (forall ((a@@18 T@U) (b@@15 T@U) (y@@4 T@U) ) (! (let ((T@@27 (type y@@4)))
 (=> (and (and (= (type a@@18) (MapType2Type T@@27 boolType)) (= (type b@@15) (MapType2Type T@@27 boolType))) (U_2_bool (MapType2Select b@@15 y@@4))) (U_2_bool (MapType2Select (|Set#Union| a@@18 b@@15) y@@4))))
 :qid |stdinbpl.781:18|
 :skolemid |36|
 :pattern ( (|Set#Union| a@@18 b@@15) (MapType2Select b@@15 y@@4))
)))
(assert (forall ((ms T@U) (x@@10 T@U) ) (! (let ((T@@28 (type x@@10)))
 (=> (= (type ms) (MultiSetType T@@28)) (>= (|MultiSet#Select| ms x@@10) 0)))
 :qid |stdinbpl.856:18|
 :skolemid |56|
 :pattern ( (|MultiSet#Select| ms x@@10))
)))
(assert (forall ((Heap@@14 T@U) (Mask@@12 T@U) (g0@@2 T@U) (g1@@2 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@14) (MapType0Type RefType)) (= (type Mask@@12) (MapType1Type RefType realType))) (= (type g0@@2) (MapType2Type RefType boolType))) (= (type g1@@2) (MapType2Type RefType boolType))) (and (state Heap@@14 Mask@@12) (or (< AssumeFunctionsAbove 0) (|apply_TCFraming#trigger| (CombineFrames (FrameFragment (int_2_U (|apply_TCFraming#condqp3| Heap@@14 g0@@2 g1@@2))) (CombineFrames (FrameFragment (int_2_U (|apply_TCFraming#condqp4| Heap@@14 g0@@2 g1@@2))) (CombineFrames (FrameFragment (int_2_U (|apply_TCFraming#condqp5| Heap@@14 g0@@2 g1@@2))) (FrameFragment (int_2_U (|apply_TCFraming#condqp6| Heap@@14 g0@@2 g1@@2)))))) g0@@2 g1@@2)))) (and (forall ((n$0@@1 T@U) ) (!  (=> (and (= (type n$0@@1) RefType) (U_2_bool (MapType2Select g0@@2 n$0@@1))) (not (U_2_bool (MapType2Select g1@@2 n$0@@1))))
 :qid |stdinbpl.1399:359|
 :skolemid |137|
 :pattern ( (MapType2Select g0@@2 n$0@@1) (MapType2Select g1@@2 n$0@@1))
)) (forall ((n$1@@1 T@U) ) (!  (=> (and (= (type n$1@@1) RefType) (U_2_bool (MapType2Select g1@@2 n$1@@1))) (not (U_2_bool (MapType2Select g0@@2 n$1@@1))))
 :qid |stdinbpl.1402:16|
 :skolemid |138|
 :pattern ( (MapType2Select g0@@2 n$1@@1) (MapType2Select g1@@2 n$1@@1))
)))) (forall ((u_1@@1 T@U) (v_2@@2 T@U) ) (!  (=> (and (and (= (type u_1@@1) RefType) (= (type v_2@@2) RefType)) (and (U_2_bool (MapType2Select g0@@2 u_1@@1)) (and (U_2_bool (MapType2Select g0@@2 v_2@@2)) (exists_path ($$ Heap@@14 g0@@2) u_1@@1 v_2@@2)))) (exists_path ($$ Heap@@14 (|Set#Union| g0@@2 g1@@2)) u_1@@1 v_2@@2))
 :qid |stdinbpl.1405:17|
 :skolemid |139|
 :pattern ( (exists_path (|$$#frame| (CombineFrames (FrameFragment (int_2_U (|$$#condqp1| Heap@@14 g0@@2))) (FrameFragment (int_2_U (|$$#condqp2| Heap@@14 g0@@2)))) g0@@2) u_1@@1 v_2@@2))
 :pattern ( (exists_path (|$$#frame| (CombineFrames (FrameFragment (int_2_U (|$$#condqp1| Heap@@14 (|Set#Union| g0@@2 g1@@2)))) (FrameFragment (int_2_U (|$$#condqp2| Heap@@14 (|Set#Union| g0@@2 g1@@2))))) (|Set#Union| g0@@2 g1@@2)) u_1@@1 v_2@@2))
)))
 :qid |stdinbpl.1397:15|
 :skolemid |140|
 :pattern ( (state Heap@@14 Mask@@12) (|apply_TCFraming'| Heap@@14 g0@@2 g1@@2))
)))
(assert (forall ((Heap@@15 T@U) (Mask@@13 T@U) (g0@@3 T@U) (g1@@3 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@15) (MapType0Type RefType)) (= (type Mask@@13) (MapType1Type RefType realType))) (= (type g0@@3) (MapType2Type RefType boolType))) (= (type g1@@3) (MapType2Type RefType boolType))) (and (state Heap@@15 Mask@@13) (or (< AssumeFunctionsAbove 0) (|apply_TCFraming#trigger| (CombineFrames (FrameFragment (int_2_U (|apply_TCFraming#condqp3| Heap@@15 g0@@3 g1@@3))) (CombineFrames (FrameFragment (int_2_U (|apply_TCFraming#condqp4| Heap@@15 g0@@3 g1@@3))) (CombineFrames (FrameFragment (int_2_U (|apply_TCFraming#condqp5| Heap@@15 g0@@3 g1@@3))) (FrameFragment (int_2_U (|apply_TCFraming#condqp6| Heap@@15 g0@@3 g1@@3)))))) g0@@3 g1@@3)))) (and (forall ((n$0@@2 T@U) ) (!  (=> (and (= (type n$0@@2) RefType) (U_2_bool (MapType2Select g0@@3 n$0@@2))) (not (U_2_bool (MapType2Select g1@@3 n$0@@2))))
 :qid |stdinbpl.1412:359|
 :skolemid |141|
 :pattern ( (MapType2Select g0@@3 n$0@@2) (MapType2Select g1@@3 n$0@@2))
)) (forall ((n$1@@2 T@U) ) (!  (=> (and (= (type n$1@@2) RefType) (U_2_bool (MapType2Select g1@@3 n$1@@2))) (not (U_2_bool (MapType2Select g0@@3 n$1@@2))))
 :qid |stdinbpl.1415:16|
 :skolemid |142|
 :pattern ( (MapType2Select g0@@3 n$1@@2) (MapType2Select g1@@3 n$1@@2))
)))) (forall ((u_1_1@@0 T@U) (v_1_1@@0 T@U) ) (!  (=> (and (and (= (type u_1_1@@0) RefType) (= (type v_1_1@@0) RefType)) (and (U_2_bool (MapType2Select g1@@3 u_1_1@@0)) (and (U_2_bool (MapType2Select g1@@3 v_1_1@@0)) (exists_path ($$ Heap@@15 g1@@3) u_1_1@@0 v_1_1@@0)))) (exists_path ($$ Heap@@15 (|Set#Union| g1@@3 g0@@3)) u_1_1@@0 v_1_1@@0))
 :qid |stdinbpl.1418:17|
 :skolemid |143|
 :pattern ( (exists_path (|$$#frame| (CombineFrames (FrameFragment (int_2_U (|$$#condqp1| Heap@@15 g1@@3))) (FrameFragment (int_2_U (|$$#condqp2| Heap@@15 g1@@3)))) g1@@3) u_1_1@@0 v_1_1@@0))
 :pattern ( (exists_path (|$$#frame| (CombineFrames (FrameFragment (int_2_U (|$$#condqp1| Heap@@15 (|Set#Union| g1@@3 g0@@3)))) (FrameFragment (int_2_U (|$$#condqp2| Heap@@15 (|Set#Union| g1@@3 g0@@3))))) (|Set#Union| g1@@3 g0@@3)) u_1_1@@0 v_1_1@@0))
)))
 :qid |stdinbpl.1410:15|
 :skolemid |144|
 :pattern ( (state Heap@@15 Mask@@13) (|apply_TCFraming'| Heap@@15 g0@@3 g1@@3))
)))
(assert (forall ((a@@19 T@U) (x@@11 T@U) (o@@5 T@U) ) (! (let ((T@@29 (type x@@11)))
 (=> (and (= (type a@@19) (MapType2Type T@@29 boolType)) (= (type o@@5) T@@29)) (= (U_2_bool (MapType2Select (|Set#UnionOne| a@@19 x@@11) o@@5))  (or (= o@@5 x@@11) (U_2_bool (MapType2Select a@@19 o@@5))))))
 :qid |stdinbpl.765:18|
 :skolemid |29|
 :pattern ( (MapType2Select (|Set#UnionOne| a@@19 x@@11) o@@5))
)))
(assert (forall ((a@@20 T@U) (b@@16 T@U) (y@@5 T@U) ) (! (let ((T@@30 (type y@@5)))
 (=> (and (and (= (type a@@20) (MapType2Type T@@30 boolType)) (= (type b@@16) (MapType2Type T@@30 boolType))) (U_2_bool (MapType2Select b@@16 y@@5))) (not (U_2_bool (MapType2Select (|Set#Difference| a@@20 b@@16) y@@5)))))
 :qid |stdinbpl.806:18|
 :skolemid |44|
 :pattern ( (|Set#Difference| a@@20 b@@16) (MapType2Select b@@16 y@@5))
)))
(assert (forall ((arg0@@53 Int) (arg1@@29 Int) ) (! (= (type (|sk_$$#condqp1| arg0@@53 arg1@@29)) RefType)
 :qid |funType:sk_$$#condqp1|
 :pattern ( (|sk_$$#condqp1| arg0@@53 arg1@@29))
)))
(assert (forall ((Heap2Heap T@U) (Heap1Heap T@U) (refs@@5 T@U) ) (!  (=> (and (and (and (= (type Heap2Heap) (MapType0Type RefType)) (= (type Heap1Heap) (MapType0Type RefType))) (= (type refs@@5) (MapType2Type RefType boolType))) (and (=  (and (U_2_bool (MapType2Select refs@@5 (|sk_$$#condqp1| (|$$#condqp1| Heap2Heap refs@@5) (|$$#condqp1| Heap1Heap refs@@5)))) (< NoPerm (/ (to_real 1) (to_real 2))))  (and (U_2_bool (MapType2Select refs@@5 (|sk_$$#condqp1| (|$$#condqp1| Heap2Heap refs@@5) (|$$#condqp1| Heap1Heap refs@@5)))) (< NoPerm (/ (to_real 1) (to_real 2))))) (=> (and (U_2_bool (MapType2Select refs@@5 (|sk_$$#condqp1| (|$$#condqp1| Heap2Heap refs@@5) (|$$#condqp1| Heap1Heap refs@@5)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (= (MapType0Select Heap2Heap (|sk_$$#condqp1| (|$$#condqp1| Heap2Heap refs@@5) (|$$#condqp1| Heap1Heap refs@@5)) l) (MapType0Select Heap1Heap (|sk_$$#condqp1| (|$$#condqp1| Heap2Heap refs@@5) (|$$#condqp1| Heap1Heap refs@@5)) l))))) (= (|$$#condqp1| Heap2Heap refs@@5) (|$$#condqp1| Heap1Heap refs@@5)))
 :qid |stdinbpl.1129:15|
 :skolemid |102|
 :pattern ( (|$$#condqp1| Heap2Heap refs@@5) (|$$#condqp1| Heap1Heap refs@@5) (succHeapTrans Heap2Heap Heap1Heap))
)))
(assert (forall ((arg0@@54 Int) (arg1@@30 Int) ) (! (= (type (|sk_$$#condqp2| arg0@@54 arg1@@30)) RefType)
 :qid |funType:sk_$$#condqp2|
 :pattern ( (|sk_$$#condqp2| arg0@@54 arg1@@30))
)))
(assert (forall ((Heap2Heap@@0 T@U) (Heap1Heap@@0 T@U) (refs@@6 T@U) ) (!  (=> (and (and (and (= (type Heap2Heap@@0) (MapType0Type RefType)) (= (type Heap1Heap@@0) (MapType0Type RefType))) (= (type refs@@6) (MapType2Type RefType boolType))) (and (=  (and (U_2_bool (MapType2Select refs@@6 (|sk_$$#condqp2| (|$$#condqp2| Heap2Heap@@0 refs@@6) (|$$#condqp2| Heap1Heap@@0 refs@@6)))) (< NoPerm (/ (to_real 1) (to_real 2))))  (and (U_2_bool (MapType2Select refs@@6 (|sk_$$#condqp2| (|$$#condqp2| Heap2Heap@@0 refs@@6) (|$$#condqp2| Heap1Heap@@0 refs@@6)))) (< NoPerm (/ (to_real 1) (to_real 2))))) (=> (and (U_2_bool (MapType2Select refs@@6 (|sk_$$#condqp2| (|$$#condqp2| Heap2Heap@@0 refs@@6) (|$$#condqp2| Heap1Heap@@0 refs@@6)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (= (MapType0Select Heap2Heap@@0 (|sk_$$#condqp2| (|$$#condqp2| Heap2Heap@@0 refs@@6) (|$$#condqp2| Heap1Heap@@0 refs@@6)) r_1) (MapType0Select Heap1Heap@@0 (|sk_$$#condqp2| (|$$#condqp2| Heap2Heap@@0 refs@@6) (|$$#condqp2| Heap1Heap@@0 refs@@6)) r_1))))) (= (|$$#condqp2| Heap2Heap@@0 refs@@6) (|$$#condqp2| Heap1Heap@@0 refs@@6)))
 :qid |stdinbpl.1139:15|
 :skolemid |103|
 :pattern ( (|$$#condqp2| Heap2Heap@@0 refs@@6) (|$$#condqp2| Heap1Heap@@0 refs@@6) (succHeapTrans Heap2Heap@@0 Heap1Heap@@0))
)))
(assert (forall ((a@@21 T@U) (b@@17 T@U) ) (! (let ((T@@31 (MapType2TypeInv0 (type a@@21))))
 (=> (and (= (type a@@21) (MapType2Type T@@31 boolType)) (= (type b@@17) (MapType2Type T@@31 boolType))) (and (= (+ (+ (|Set#Card| (|Set#Difference| a@@21 b@@17)) (|Set#Card| (|Set#Difference| b@@17 a@@21))) (|Set#Card| (|Set#Intersection| a@@21 b@@17))) (|Set#Card| (|Set#Union| a@@21 b@@17))) (= (|Set#Card| (|Set#Difference| a@@21 b@@17)) (- (|Set#Card| a@@21) (|Set#Card| (|Set#Intersection| a@@21 b@@17)))))))
 :qid |stdinbpl.808:18|
 :skolemid |45|
 :pattern ( (|Set#Card| (|Set#Difference| a@@21 b@@17)))
)))
(assert (forall ((s T@U) ) (! (let ((T@@32 (MapType2TypeInv0 (type s))))
 (=> (= (type s) (MapType2Type T@@32 boolType)) (<= 0 (|Set#Card| s))))
 :qid |stdinbpl.751:18|
 :skolemid |22|
 :pattern ( (|Set#Card| s))
)))
(assert (forall ((s@@0 T@U) ) (! (let ((T@@33 (MultiSetTypeInv0 (type s@@0))))
 (=> (= (type s@@0) (MultiSetType T@@33)) (<= 0 (|MultiSet#Card| s@@0))))
 :qid |stdinbpl.859:18|
 :skolemid |57|
 :pattern ( (|MultiSet#Card| s@@0))
)))
(assert (forall ((T@@34 T@T) ) (! (= (type (|MultiSet#Empty| T@@34)) (MultiSetType T@@34))
 :qid |funType:MultiSet#Empty|
 :pattern ( (|MultiSet#Empty| T@@34))
)))
(assert (forall ((o@@6 T@U) ) (! (let ((T@@35 (type o@@6)))
(= (|MultiSet#Select| (|MultiSet#Empty| T@@35) o@@6) 0))
 :qid |stdinbpl.864:18|
 :skolemid |58|
 :pattern ( (let ((T@@35 (type o@@6)))
(|MultiSet#Select| (|MultiSet#Empty| T@@35) o@@6)))
)))
(assert (forall ((a@@22 T@U) (x@@12 T@U) ) (! (let ((T@@36 (type x@@12)))
 (=> (= (type a@@22) (MapType2Type T@@36 boolType)) (U_2_bool (MapType2Select (|Set#UnionOne| a@@22 x@@12) x@@12))))
 :qid |stdinbpl.767:18|
 :skolemid |30|
 :pattern ( (|Set#UnionOne| a@@22 x@@12))
)))
(assert (forall ((EG_1@@6 T@U) ) (!  (=> (= (type EG_1@@6) (MapType2Type EdgeDomainTypeType boolType)) (= (unshared_graph EG_1@@6) (forall ((v1 T@U) (v2 T@U) (v_2@@3 T@U) ) (!  (=> (and (and (and (= (type v1) RefType) (= (type v2) RefType)) (= (type v_2@@3) RefType)) (and (edge EG_1@@6 v1 v_2@@3) (edge EG_1@@6 v2 v_2@@3))) (= v1 v2))
 :qid |stdinbpl.1059:43|
 :skolemid |95|
 :pattern ( (edge EG_1@@6 v1 v_2@@3) (edge EG_1@@6 v2 v_2@@3))
))))
 :qid |stdinbpl.1057:15|
 :skolemid |96|
 :pattern ( (unshared_graph EG_1@@6))
)))
(assert (forall ((EG_1@@7 T@U) ) (!  (=> (= (type EG_1@@7) (MapType2Type EdgeDomainTypeType boolType)) (= (func_graph EG_1@@7) (forall ((v1@@0 T@U) (v2@@0 T@U) (v_2@@4 T@U) ) (!  (=> (and (and (and (= (type v1@@0) RefType) (= (type v2@@0) RefType)) (= (type v_2@@4) RefType)) (and (edge EG_1@@7 v_2@@4 v1@@0) (edge EG_1@@7 v_2@@4 v2@@0))) (= v1@@0 v2@@0))
 :qid |stdinbpl.1068:39|
 :skolemid |97|
 :pattern ( (edge EG_1@@7 v_2@@4 v1@@0) (edge EG_1@@7 v_2@@4 v2@@0))
))))
 :qid |stdinbpl.1066:15|
 :skolemid |98|
 :pattern ( (func_graph EG_1@@7))
)))
(assert (forall ((Heap@@16 T@U) (ExhaleHeap@@4 T@U) (Mask@@14 T@U) (pm_f@@1 T@U) ) (! (let ((C@@1 (FieldTypeInv0 (type pm_f@@1))))
 (=> (and (and (and (and (and (= (type Heap@@16) (MapType0Type RefType)) (= (type ExhaleHeap@@4) (MapType0Type RefType))) (= (type Mask@@14) (MapType1Type RefType realType))) (= (type pm_f@@1) (FieldType C@@1 FrameTypeType))) (IdenticalOnKnownLocations Heap@@16 ExhaleHeap@@4 Mask@@14)) (and (HasDirectPerm Mask@@14 null pm_f@@1) (IsPredicateField pm_f@@1))) (forall ((o2 T@U) (f_2@@0 T@U) ) (! (let ((B@@5 (FieldTypeInv1 (type f_2@@0))))
(let ((A@@6 (FieldTypeInv0 (type f_2@@0))))
 (=> (and (and (= (type o2) RefType) (= (type f_2@@0) (FieldType A@@6 B@@5))) (U_2_bool (MapType1Select (MapType0Select Heap@@16 null (PredicateMaskField pm_f@@1)) o2 f_2@@0))) (= (MapType0Select Heap@@16 o2 f_2@@0) (MapType0Select ExhaleHeap@@4 o2 f_2@@0)))))
 :qid |stdinbpl.54:134|
 :skolemid |3|
 :pattern ( (MapType0Select ExhaleHeap@@4 o2 f_2@@0))
))))
 :qid |stdinbpl.52:19|
 :skolemid |4|
 :pattern ( (IdenticalOnKnownLocations Heap@@16 ExhaleHeap@@4 Mask@@14) (IsPredicateField pm_f@@1))
)))
(assert (forall ((Heap@@17 T@U) (ExhaleHeap@@5 T@U) (Mask@@15 T@U) (pm_f@@2 T@U) ) (! (let ((C@@2 (FieldTypeInv0 (type pm_f@@2))))
 (=> (and (and (and (and (and (= (type Heap@@17) (MapType0Type RefType)) (= (type ExhaleHeap@@5) (MapType0Type RefType))) (= (type Mask@@15) (MapType1Type RefType realType))) (= (type pm_f@@2) (FieldType C@@2 FrameTypeType))) (IdenticalOnKnownLocations Heap@@17 ExhaleHeap@@5 Mask@@15)) (and (HasDirectPerm Mask@@15 null pm_f@@2) (IsWandField pm_f@@2))) (forall ((o2@@0 T@U) (f_2@@1 T@U) ) (! (let ((B@@6 (FieldTypeInv1 (type f_2@@1))))
(let ((A@@7 (FieldTypeInv0 (type f_2@@1))))
 (=> (and (and (= (type o2@@0) RefType) (= (type f_2@@1) (FieldType A@@7 B@@6))) (U_2_bool (MapType1Select (MapType0Select Heap@@17 null (WandMaskField pm_f@@2)) o2@@0 f_2@@1))) (= (MapType0Select Heap@@17 o2@@0 f_2@@1) (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1)))))
 :qid |stdinbpl.67:129|
 :skolemid |6|
 :pattern ( (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1))
))))
 :qid |stdinbpl.65:19|
 :skolemid |7|
 :pattern ( (IdenticalOnKnownLocations Heap@@17 ExhaleHeap@@5 Mask@@15) (IsWandField pm_f@@2))
)))
(assert (forall ((a@@23 T@U) (x@@13 T@U) ) (! (let ((T@@37 (type x@@13)))
 (=> (and (= (type a@@23) (MapType2Type T@@37 boolType)) (U_2_bool (MapType2Select a@@23 x@@13))) (= (|Set#Card| (|Set#UnionOne| a@@23 x@@13)) (|Set#Card| a@@23))))
 :qid |stdinbpl.771:18|
 :skolemid |32|
 :pattern ( (|Set#Card| (|Set#UnionOne| a@@23 x@@13)))
)))
(assert (forall ((a@@24 T@U) (x@@14 T@U) ) (! (let ((T@@38 (type x@@14)))
 (=> (= (type a@@24) (MultiSetType T@@38)) (and (> (|MultiSet#Select| (|MultiSet#UnionOne| a@@24 x@@14) x@@14) 0) (> (|MultiSet#Card| (|MultiSet#UnionOne| a@@24 x@@14)) 0))))
 :qid |stdinbpl.883:18|
 :skolemid |66|
 :pattern ( (|MultiSet#UnionOne| a@@24 x@@14))
)))
(assert (forall ((r@@1 T@U) ) (! (= (|Set#Card| (|Set#Singleton| r@@1)) 1)
 :qid |stdinbpl.762:18|
 :skolemid |28|
 :pattern ( (|Set#Card| (|Set#Singleton| r@@1)))
)))
(assert (forall ((Mask@@16 T@U) (o_2@@2 T@U) (f_4@@2 T@U) ) (! (let ((B@@7 (FieldTypeInv1 (type f_4@@2))))
(let ((A@@8 (FieldTypeInv0 (type f_4@@2))))
 (=> (and (and (and (= (type Mask@@16) (MapType1Type RefType realType)) (= (type o_2@@2) RefType)) (= (type f_4@@2) (FieldType A@@8 B@@7))) (GoodMask Mask@@16)) (and (>= (U_2_real (MapType1Select Mask@@16 o_2@@2 f_4@@2)) NoPerm) (=> (and (and (GoodMask Mask@@16) (not (IsPredicateField f_4@@2))) (not (IsWandField f_4@@2))) (<= (U_2_real (MapType1Select Mask@@16 o_2@@2 f_4@@2)) FullPerm))))))
 :qid |stdinbpl.128:22|
 :skolemid |16|
 :pattern ( (GoodMask Mask@@16) (MapType1Select Mask@@16 o_2@@2 f_4@@2))
)))
(assert (forall ((r@@2 T@U) ) (! (U_2_bool (MapType2Select (|Set#Singleton| r@@2) r@@2))
 :qid |stdinbpl.760:18|
 :skolemid |26|
 :pattern ( (|Set#Singleton| r@@2))
)))
(assert (forall ((Heap@@18 T@U) (Mask@@17 T@U) (g0@@4 T@U) (g1@@4 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@18) (MapType0Type RefType)) (= (type Mask@@17) (MapType1Type RefType realType))) (= (type g0@@4) (MapType2Type RefType boolType))) (= (type g1@@4) (MapType2Type RefType boolType))) (and (state Heap@@18 Mask@@17) (or (< AssumeFunctionsAbove 0) (|apply_TCFraming#trigger| (CombineFrames (FrameFragment (int_2_U (|apply_TCFraming#condqp3| Heap@@18 g0@@4 g1@@4))) (CombineFrames (FrameFragment (int_2_U (|apply_TCFraming#condqp4| Heap@@18 g0@@4 g1@@4))) (CombineFrames (FrameFragment (int_2_U (|apply_TCFraming#condqp5| Heap@@18 g0@@4 g1@@4))) (FrameFragment (int_2_U (|apply_TCFraming#condqp6| Heap@@18 g0@@4 g1@@4)))))) g0@@4 g1@@4)))) (and (forall ((n$0@@3 T@U) ) (!  (=> (and (= (type n$0@@3) RefType) (U_2_bool (MapType2Select g0@@4 n$0@@3))) (not (U_2_bool (MapType2Select g1@@4 n$0@@3))))
 :qid |stdinbpl.1389:359|
 :skolemid |134|
 :pattern ( (MapType2Select g0@@4 n$0@@3) (MapType2Select g1@@4 n$0@@3))
)) (forall ((n$1@@3 T@U) ) (!  (=> (and (= (type n$1@@3) RefType) (U_2_bool (MapType2Select g1@@4 n$1@@3))) (not (U_2_bool (MapType2Select g0@@4 n$1@@3))))
 :qid |stdinbpl.1392:16|
 :skolemid |135|
 :pattern ( (MapType2Select g0@@4 n$1@@3) (MapType2Select g1@@4 n$1@@3))
)))) (|Set#Equal| (|Set#Union| g0@@4 g1@@4) (|Set#Union| g1@@4 g0@@4)))
 :qid |stdinbpl.1387:15|
 :skolemid |136|
 :pattern ( (state Heap@@18 Mask@@17) (|apply_TCFraming'| Heap@@18 g0@@4 g1@@4))
)))
(assert (forall ((a@@25 T@U) (b@@18 T@U) ) (! (let ((T@@39 (MapType2TypeInv0 (type a@@25))))
 (=> (and (= (type a@@25) (MapType2Type T@@39 boolType)) (= (type b@@18) (MapType2Type T@@39 boolType))) (= (|Set#Union| a@@25 (|Set#Union| a@@25 b@@18)) (|Set#Union| a@@25 b@@18))))
 :qid |stdinbpl.794:18|
 :skolemid |39|
 :pattern ( (|Set#Union| a@@25 (|Set#Union| a@@25 b@@18)))
)))
(assert (forall ((a@@26 T@U) (b@@19 T@U) ) (! (let ((T@@40 (MapType2TypeInv0 (type a@@26))))
 (=> (and (= (type a@@26) (MapType2Type T@@40 boolType)) (= (type b@@19) (MapType2Type T@@40 boolType))) (= (|Set#Intersection| a@@26 (|Set#Intersection| a@@26 b@@19)) (|Set#Intersection| a@@26 b@@19))))
 :qid |stdinbpl.798:18|
 :skolemid |41|
 :pattern ( (|Set#Intersection| a@@26 (|Set#Intersection| a@@26 b@@19)))
)))
(assert (forall ((a@@27 T@U) (b@@20 T@U) ) (! (let ((T@@41 (MultiSetTypeInv0 (type a@@27))))
 (=> (and (= (type a@@27) (MultiSetType T@@41)) (= (type b@@20) (MultiSetType T@@41))) (= (|MultiSet#Intersection| a@@27 (|MultiSet#Intersection| a@@27 b@@20)) (|MultiSet#Intersection| a@@27 b@@20))))
 :qid |stdinbpl.900:18|
 :skolemid |71|
 :pattern ( (|MultiSet#Intersection| a@@27 (|MultiSet#Intersection| a@@27 b@@20)))
)))
(assert (forall ((Heap@@19 T@U) (Mask@@18 T@U) (g0@@5 T@U) (g1@@5 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@19) (MapType0Type RefType)) (= (type Mask@@18) (MapType1Type RefType realType))) (= (type g0@@5) (MapType2Type RefType boolType))) (= (type g1@@5) (MapType2Type RefType boolType))) (state Heap@@19 Mask@@18)) (= (|apply_TCFraming'| Heap@@19 g0@@5 g1@@5) (|apply_TCFraming#frame| (CombineFrames (FrameFragment (int_2_U (|apply_TCFraming#condqp3| Heap@@19 g0@@5 g1@@5))) (CombineFrames (FrameFragment (int_2_U (|apply_TCFraming#condqp4| Heap@@19 g0@@5 g1@@5))) (CombineFrames (FrameFragment (int_2_U (|apply_TCFraming#condqp5| Heap@@19 g0@@5 g1@@5))) (FrameFragment (int_2_U (|apply_TCFraming#condqp6| Heap@@19 g0@@5 g1@@5)))))) g0@@5 g1@@5)))
 :qid |stdinbpl.1341:15|
 :skolemid |129|
 :pattern ( (state Heap@@19 Mask@@18) (|apply_TCFraming'| Heap@@19 g0@@5 g1@@5))
)))
(assert (forall ((s@@1 T@U) ) (! (let ((T@@42 (MultiSetTypeInv0 (type s@@1))))
 (=> (= (type s@@1) (MultiSetType T@@42)) (and (= (= (|MultiSet#Card| s@@1) 0) (= s@@1 (|MultiSet#Empty| T@@42))) (=> (not (= (|MultiSet#Card| s@@1) 0)) (exists ((x@@15 T@U) ) (!  (and (= (type x@@15) T@@42) (< 0 (|MultiSet#Select| s@@1 x@@15)))
 :qid |stdinbpl.867:38|
 :skolemid |59|
 :no-pattern (type x@@15)
 :no-pattern (U_2_int x@@15)
 :no-pattern (U_2_bool x@@15)
))))))
 :qid |stdinbpl.865:18|
 :skolemid |60|
 :pattern ( (|MultiSet#Card| s@@1))
)))
(assert (forall ((r@@3 T@U) (o@@7 T@U) ) (! (let ((T@@43 (type r@@3)))
 (=> (= (type o@@7) T@@43) (and (= (= (|MultiSet#Select| (|MultiSet#Singleton| r@@3) o@@7) 1) (= r@@3 o@@7)) (= (= (|MultiSet#Select| (|MultiSet#Singleton| r@@3) o@@7) 0) (not (= r@@3 o@@7))))))
 :qid |stdinbpl.870:18|
 :skolemid |61|
 :pattern ( (|MultiSet#Select| (|MultiSet#Singleton| r@@3) o@@7))
)))
(assert (forall ((o@@8 T@U) (f T@U) (Heap@@20 T@U) ) (!  (=> (and (and (and (= (type o@@8) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap@@20) (MapType0Type RefType))) (U_2_bool (MapType0Select Heap@@20 o@@8 $allocated))) (U_2_bool (MapType0Select Heap@@20 (MapType0Select Heap@@20 o@@8 f) $allocated)))
 :qid |stdinbpl.31:15|
 :skolemid |0|
 :pattern ( (MapType0Select Heap@@20 o@@8 f))
)))
(assert (forall ((a@@28 T@U) (b@@21 T@U) (o@@9 T@U) ) (! (let ((T@@44 (type o@@9)))
 (=> (and (= (type a@@28) (MultiSetType T@@44)) (= (type b@@21) (MultiSetType T@@44))) (= (|MultiSet#Select| (|MultiSet#Union| a@@28 b@@21) o@@9) (+ (|MultiSet#Select| a@@28 o@@9) (|MultiSet#Select| b@@21 o@@9)))))
 :qid |stdinbpl.888:18|
 :skolemid |67|
 :pattern ( (|MultiSet#Select| (|MultiSet#Union| a@@28 b@@21) o@@9))
 :pattern ( (|MultiSet#Union| a@@28 b@@21) (|MultiSet#Select| a@@28 o@@9) (|MultiSet#Select| b@@21 o@@9))
)))
(assert (forall ((T@@45 T@T) ) (! (= (type (|Set#Empty| T@@45)) (MapType2Type T@@45 boolType))
 :qid |funType:Set#Empty|
 :pattern ( (|Set#Empty| T@@45))
)))
(assert (forall ((o@@10 T@U) ) (! (let ((T@@46 (type o@@10)))
 (not (U_2_bool (MapType2Select (|Set#Empty| T@@46) o@@10))))
 :qid |stdinbpl.754:18|
 :skolemid |23|
 :pattern ( (let ((T@@46 (type o@@10)))
(MapType2Select (|Set#Empty| T@@46) o@@10)))
)))
(assert (forall ((r@@4 T@U) ) (! (let ((T@@47 (type r@@4)))
(= (|MultiSet#Singleton| r@@4) (|MultiSet#UnionOne| (|MultiSet#Empty| T@@47) r@@4)))
 :qid |stdinbpl.873:18|
 :skolemid |63|
 :pattern ( (|MultiSet#Singleton| r@@4))
)))
(assert (forall ((a@@29 Int) (b@@22 Int) ) (! (= (<= a@@29 b@@22) (= (|Math#min| a@@29 b@@22) a@@29))
 :qid |stdinbpl.838:15|
 :skolemid |51|
 :pattern ( (|Math#min| a@@29 b@@22))
)))
(assert (forall ((a@@30 Int) (b@@23 Int) ) (! (= (<= b@@23 a@@30) (= (|Math#min| a@@30 b@@23) b@@23))
 :qid |stdinbpl.839:15|
 :skolemid |52|
 :pattern ( (|Math#min| a@@30 b@@23))
)))
(assert (forall ((s@@2 T@U) ) (! (let ((T@@48 (MapType2TypeInv0 (type s@@2))))
 (=> (= (type s@@2) (MapType2Type T@@48 boolType)) (and (= (= (|Set#Card| s@@2) 0) (= s@@2 (|Set#Empty| T@@48))) (=> (not (= (|Set#Card| s@@2) 0)) (exists ((x@@16 T@U) ) (!  (and (= (type x@@16) T@@48) (U_2_bool (MapType2Select s@@2 x@@16)))
 :qid |stdinbpl.757:33|
 :skolemid |24|
 :no-pattern (type x@@16)
 :no-pattern (U_2_int x@@16)
 :no-pattern (U_2_bool x@@16)
))))))
 :qid |stdinbpl.755:18|
 :skolemid |25|
 :pattern ( (|Set#Card| s@@2))
)))
(assert (forall ((Heap@@21 T@U) (o@@11 T@U) (f_3 T@U) (v T@U) ) (! (let ((B@@8 (type v)))
(let ((A@@9 (FieldTypeInv0 (type f_3))))
 (=> (and (and (= (type Heap@@21) (MapType0Type RefType)) (= (type o@@11) RefType)) (= (type f_3) (FieldType A@@9 B@@8))) (succHeap Heap@@21 (MapType0Store Heap@@21 o@@11 f_3 v)))))
 :qid |stdinbpl.78:22|
 :skolemid |9|
 :pattern ( (MapType0Store Heap@@21 o@@11 f_3 v))
)))
(assert (forall ((a@@31 T@U) (b@@24 T@U) ) (! (let ((T@@49 (MapType2TypeInv0 (type a@@31))))
 (=> (and (= (type a@@31) (MapType2Type T@@49 boolType)) (= (type b@@24) (MapType2Type T@@49 boolType))) (= (|Set#Subset| a@@31 b@@24) (forall ((o@@12 T@U) ) (!  (=> (and (= (type o@@12) T@@49) (U_2_bool (MapType2Select a@@31 o@@12))) (U_2_bool (MapType2Select b@@24 o@@12)))
 :qid |stdinbpl.817:32|
 :skolemid |46|
 :pattern ( (MapType2Select a@@31 o@@12))
 :pattern ( (MapType2Select b@@24 o@@12))
)))))
 :qid |stdinbpl.816:17|
 :skolemid |47|
 :pattern ( (|Set#Subset| a@@31 b@@24))
)))
(assert (forall ((a@@32 T@U) (x@@17 T@U) ) (! (let ((T@@50 (type x@@17)))
 (=> (and (= (type a@@32) (MapType2Type T@@50 boolType)) (not (U_2_bool (MapType2Select a@@32 x@@17)))) (= (|Set#Card| (|Set#UnionOne| a@@32 x@@17)) (+ (|Set#Card| a@@32) 1))))
 :qid |stdinbpl.773:18|
 :skolemid |33|
 :pattern ( (|Set#Card| (|Set#UnionOne| a@@32 x@@17)))
)))
(assert (forall ((a@@33 T@U) (b@@25 T@U) (o@@13 T@U) ) (! (let ((T@@51 (type o@@13)))
 (=> (and (= (type a@@33) (MultiSetType T@@51)) (= (type b@@25) (MultiSetType T@@51))) (= (|MultiSet#Select| (|MultiSet#Difference| a@@33 b@@25) o@@13) (|Math#clip| (- (|MultiSet#Select| a@@33 o@@13) (|MultiSet#Select| b@@25 o@@13))))))
 :qid |stdinbpl.905:18|
 :skolemid |72|
 :pattern ( (|MultiSet#Select| (|MultiSet#Difference| a@@33 b@@25) o@@13))
)))
(assert (forall ((arg0@@55 Int) (arg1@@31 Int) ) (! (= (type (|sk_apply_TCFraming#condqp3| arg0@@55 arg1@@31)) RefType)
 :qid |funType:sk_apply_TCFraming#condqp3|
 :pattern ( (|sk_apply_TCFraming#condqp3| arg0@@55 arg1@@31))
)))
(assert (forall ((Heap2Heap@@1 T@U) (Heap1Heap@@1 T@U) (g0@@6 T@U) (g1@@6 T@U) ) (!  (=> (and (and (and (and (= (type Heap2Heap@@1) (MapType0Type RefType)) (= (type Heap1Heap@@1) (MapType0Type RefType))) (= (type g0@@6) (MapType2Type RefType boolType))) (= (type g1@@6) (MapType2Type RefType boolType))) (and (=  (and (U_2_bool (MapType2Select g0@@6 (|sk_apply_TCFraming#condqp3| (|apply_TCFraming#condqp3| Heap2Heap@@1 g0@@6 g1@@6) (|apply_TCFraming#condqp3| Heap1Heap@@1 g0@@6 g1@@6)))) (< NoPerm FullPerm))  (and (U_2_bool (MapType2Select g0@@6 (|sk_apply_TCFraming#condqp3| (|apply_TCFraming#condqp3| Heap2Heap@@1 g0@@6 g1@@6) (|apply_TCFraming#condqp3| Heap1Heap@@1 g0@@6 g1@@6)))) (< NoPerm FullPerm))) (=> (and (U_2_bool (MapType2Select g0@@6 (|sk_apply_TCFraming#condqp3| (|apply_TCFraming#condqp3| Heap2Heap@@1 g0@@6 g1@@6) (|apply_TCFraming#condqp3| Heap1Heap@@1 g0@@6 g1@@6)))) (< NoPerm FullPerm)) (= (MapType0Select Heap2Heap@@1 (|sk_apply_TCFraming#condqp3| (|apply_TCFraming#condqp3| Heap2Heap@@1 g0@@6 g1@@6) (|apply_TCFraming#condqp3| Heap1Heap@@1 g0@@6 g1@@6)) l) (MapType0Select Heap1Heap@@1 (|sk_apply_TCFraming#condqp3| (|apply_TCFraming#condqp3| Heap2Heap@@1 g0@@6 g1@@6) (|apply_TCFraming#condqp3| Heap1Heap@@1 g0@@6 g1@@6)) l))))) (= (|apply_TCFraming#condqp3| Heap2Heap@@1 g0@@6 g1@@6) (|apply_TCFraming#condqp3| Heap1Heap@@1 g0@@6 g1@@6)))
 :qid |stdinbpl.1351:15|
 :skolemid |130|
 :pattern ( (|apply_TCFraming#condqp3| Heap2Heap@@1 g0@@6 g1@@6) (|apply_TCFraming#condqp3| Heap1Heap@@1 g0@@6 g1@@6) (succHeapTrans Heap2Heap@@1 Heap1Heap@@1))
)))
(assert (forall ((arg0@@56 Int) (arg1@@32 Int) ) (! (= (type (|sk_apply_TCFraming#condqp4| arg0@@56 arg1@@32)) RefType)
 :qid |funType:sk_apply_TCFraming#condqp4|
 :pattern ( (|sk_apply_TCFraming#condqp4| arg0@@56 arg1@@32))
)))
(assert (forall ((Heap2Heap@@2 T@U) (Heap1Heap@@2 T@U) (g0@@7 T@U) (g1@@7 T@U) ) (!  (=> (and (and (and (and (= (type Heap2Heap@@2) (MapType0Type RefType)) (= (type Heap1Heap@@2) (MapType0Type RefType))) (= (type g0@@7) (MapType2Type RefType boolType))) (= (type g1@@7) (MapType2Type RefType boolType))) (and (=  (and (U_2_bool (MapType2Select g0@@7 (|sk_apply_TCFraming#condqp4| (|apply_TCFraming#condqp4| Heap2Heap@@2 g0@@7 g1@@7) (|apply_TCFraming#condqp4| Heap1Heap@@2 g0@@7 g1@@7)))) (< NoPerm FullPerm))  (and (U_2_bool (MapType2Select g0@@7 (|sk_apply_TCFraming#condqp4| (|apply_TCFraming#condqp4| Heap2Heap@@2 g0@@7 g1@@7) (|apply_TCFraming#condqp4| Heap1Heap@@2 g0@@7 g1@@7)))) (< NoPerm FullPerm))) (=> (and (U_2_bool (MapType2Select g0@@7 (|sk_apply_TCFraming#condqp4| (|apply_TCFraming#condqp4| Heap2Heap@@2 g0@@7 g1@@7) (|apply_TCFraming#condqp4| Heap1Heap@@2 g0@@7 g1@@7)))) (< NoPerm FullPerm)) (= (MapType0Select Heap2Heap@@2 (|sk_apply_TCFraming#condqp4| (|apply_TCFraming#condqp4| Heap2Heap@@2 g0@@7 g1@@7) (|apply_TCFraming#condqp4| Heap1Heap@@2 g0@@7 g1@@7)) r_1) (MapType0Select Heap1Heap@@2 (|sk_apply_TCFraming#condqp4| (|apply_TCFraming#condqp4| Heap2Heap@@2 g0@@7 g1@@7) (|apply_TCFraming#condqp4| Heap1Heap@@2 g0@@7 g1@@7)) r_1))))) (= (|apply_TCFraming#condqp4| Heap2Heap@@2 g0@@7 g1@@7) (|apply_TCFraming#condqp4| Heap1Heap@@2 g0@@7 g1@@7)))
 :qid |stdinbpl.1361:15|
 :skolemid |131|
 :pattern ( (|apply_TCFraming#condqp4| Heap2Heap@@2 g0@@7 g1@@7) (|apply_TCFraming#condqp4| Heap1Heap@@2 g0@@7 g1@@7) (succHeapTrans Heap2Heap@@2 Heap1Heap@@2))
)))
(assert (forall ((arg0@@57 Int) (arg1@@33 Int) ) (! (= (type (|sk_apply_TCFraming#condqp5| arg0@@57 arg1@@33)) RefType)
 :qid |funType:sk_apply_TCFraming#condqp5|
 :pattern ( (|sk_apply_TCFraming#condqp5| arg0@@57 arg1@@33))
)))
(assert (forall ((Heap2Heap@@3 T@U) (Heap1Heap@@3 T@U) (g0@@8 T@U) (g1@@8 T@U) ) (!  (=> (and (and (and (and (= (type Heap2Heap@@3) (MapType0Type RefType)) (= (type Heap1Heap@@3) (MapType0Type RefType))) (= (type g0@@8) (MapType2Type RefType boolType))) (= (type g1@@8) (MapType2Type RefType boolType))) (and (=  (and (U_2_bool (MapType2Select g1@@8 (|sk_apply_TCFraming#condqp5| (|apply_TCFraming#condqp5| Heap2Heap@@3 g0@@8 g1@@8) (|apply_TCFraming#condqp5| Heap1Heap@@3 g0@@8 g1@@8)))) (< NoPerm FullPerm))  (and (U_2_bool (MapType2Select g1@@8 (|sk_apply_TCFraming#condqp5| (|apply_TCFraming#condqp5| Heap2Heap@@3 g0@@8 g1@@8) (|apply_TCFraming#condqp5| Heap1Heap@@3 g0@@8 g1@@8)))) (< NoPerm FullPerm))) (=> (and (U_2_bool (MapType2Select g1@@8 (|sk_apply_TCFraming#condqp5| (|apply_TCFraming#condqp5| Heap2Heap@@3 g0@@8 g1@@8) (|apply_TCFraming#condqp5| Heap1Heap@@3 g0@@8 g1@@8)))) (< NoPerm FullPerm)) (= (MapType0Select Heap2Heap@@3 (|sk_apply_TCFraming#condqp5| (|apply_TCFraming#condqp5| Heap2Heap@@3 g0@@8 g1@@8) (|apply_TCFraming#condqp5| Heap1Heap@@3 g0@@8 g1@@8)) l) (MapType0Select Heap1Heap@@3 (|sk_apply_TCFraming#condqp5| (|apply_TCFraming#condqp5| Heap2Heap@@3 g0@@8 g1@@8) (|apply_TCFraming#condqp5| Heap1Heap@@3 g0@@8 g1@@8)) l))))) (= (|apply_TCFraming#condqp5| Heap2Heap@@3 g0@@8 g1@@8) (|apply_TCFraming#condqp5| Heap1Heap@@3 g0@@8 g1@@8)))
 :qid |stdinbpl.1371:15|
 :skolemid |132|
 :pattern ( (|apply_TCFraming#condqp5| Heap2Heap@@3 g0@@8 g1@@8) (|apply_TCFraming#condqp5| Heap1Heap@@3 g0@@8 g1@@8) (succHeapTrans Heap2Heap@@3 Heap1Heap@@3))
)))
(assert (forall ((arg0@@58 Int) (arg1@@34 Int) ) (! (= (type (|sk_apply_TCFraming#condqp6| arg0@@58 arg1@@34)) RefType)
 :qid |funType:sk_apply_TCFraming#condqp6|
 :pattern ( (|sk_apply_TCFraming#condqp6| arg0@@58 arg1@@34))
)))
(assert (forall ((Heap2Heap@@4 T@U) (Heap1Heap@@4 T@U) (g0@@9 T@U) (g1@@9 T@U) ) (!  (=> (and (and (and (and (= (type Heap2Heap@@4) (MapType0Type RefType)) (= (type Heap1Heap@@4) (MapType0Type RefType))) (= (type g0@@9) (MapType2Type RefType boolType))) (= (type g1@@9) (MapType2Type RefType boolType))) (and (=  (and (U_2_bool (MapType2Select g1@@9 (|sk_apply_TCFraming#condqp6| (|apply_TCFraming#condqp6| Heap2Heap@@4 g0@@9 g1@@9) (|apply_TCFraming#condqp6| Heap1Heap@@4 g0@@9 g1@@9)))) (< NoPerm FullPerm))  (and (U_2_bool (MapType2Select g1@@9 (|sk_apply_TCFraming#condqp6| (|apply_TCFraming#condqp6| Heap2Heap@@4 g0@@9 g1@@9) (|apply_TCFraming#condqp6| Heap1Heap@@4 g0@@9 g1@@9)))) (< NoPerm FullPerm))) (=> (and (U_2_bool (MapType2Select g1@@9 (|sk_apply_TCFraming#condqp6| (|apply_TCFraming#condqp6| Heap2Heap@@4 g0@@9 g1@@9) (|apply_TCFraming#condqp6| Heap1Heap@@4 g0@@9 g1@@9)))) (< NoPerm FullPerm)) (= (MapType0Select Heap2Heap@@4 (|sk_apply_TCFraming#condqp6| (|apply_TCFraming#condqp6| Heap2Heap@@4 g0@@9 g1@@9) (|apply_TCFraming#condqp6| Heap1Heap@@4 g0@@9 g1@@9)) r_1) (MapType0Select Heap1Heap@@4 (|sk_apply_TCFraming#condqp6| (|apply_TCFraming#condqp6| Heap2Heap@@4 g0@@9 g1@@9) (|apply_TCFraming#condqp6| Heap1Heap@@4 g0@@9 g1@@9)) r_1))))) (= (|apply_TCFraming#condqp6| Heap2Heap@@4 g0@@9 g1@@9) (|apply_TCFraming#condqp6| Heap1Heap@@4 g0@@9 g1@@9)))
 :qid |stdinbpl.1381:15|
 :skolemid |133|
 :pattern ( (|apply_TCFraming#condqp6| Heap2Heap@@4 g0@@9 g1@@9) (|apply_TCFraming#condqp6| Heap1Heap@@4 g0@@9 g1@@9) (succHeapTrans Heap2Heap@@4 Heap1Heap@@4))
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
 :qid |stdinbpl.733:25|
 :skolemid |20|
 :pattern ( (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r@@5 u))
)))
(assert (forall ((a@@34 Int) ) (!  (=> (< a@@34 0) (= (|Math#clip| a@@34) 0))
 :qid |stdinbpl.844:15|
 :skolemid |55|
 :pattern ( (|Math#clip| a@@34))
)))
(assert (forall ((EG_1@@8 T@U) ) (!  (=> (= (type EG_1@@8) (MapType2Type EdgeDomainTypeType boolType)) (= (acyclic_graph EG_1@@8) (forall ((v1@@1 T@U) (v2@@1 T@U) ) (!  (=> (and (= (type v1@@1) RefType) (= (type v2@@1) RefType)) (or (not (edge EG_1@@8 v1@@1 v2@@1)) (not (exists_path EG_1@@8 v2@@1 v1@@1))))
 :qid |stdinbpl.1050:42|
 :skolemid |93|
 :pattern ( (edge EG_1@@8 v1@@1 v2@@1))
 :pattern ( (exists_path EG_1@@8 v2@@1 v1@@1))
))))
 :qid |stdinbpl.1048:15|
 :skolemid |94|
 :pattern ( (acyclic_graph EG_1@@8))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
(assert (forall ((a@@35 T@U) (x@@18 T@U) (o@@14 T@U) ) (! (let ((T@@52 (type x@@18)))
 (=> (and (= (type a@@35) (MultiSetType T@@52)) (= (type o@@14) T@@52)) (= (|MultiSet#Select| (|MultiSet#UnionOne| a@@35 x@@18) o@@14) (ite (= x@@18 o@@14) (+ (|MultiSet#Select| a@@35 o@@14) 1) (|MultiSet#Select| a@@35 o@@14)))))
 :qid |stdinbpl.877:18|
 :skolemid |64|
 :pattern ( (|MultiSet#Select| (|MultiSet#UnionOne| a@@35 x@@18) o@@14))
 :pattern ( (|MultiSet#UnionOne| a@@35 x@@18) (|MultiSet#Select| a@@35 o@@14))
)))
(assert (forall ((a@@36 T@U) (b@@26 T@U) ) (! (let ((T@@53 (MultiSetTypeInv0 (type a@@36))))
 (=> (and (= (type a@@36) (MultiSetType T@@53)) (= (type b@@26) (MultiSetType T@@53))) (= (|MultiSet#Equal| a@@36 b@@26) (forall ((o@@15 T@U) ) (!  (=> (= (type o@@15) T@@53) (= (|MultiSet#Select| a@@36 o@@15) (|MultiSet#Select| b@@26 o@@15)))
 :qid |stdinbpl.923:36|
 :skolemid |77|
 :pattern ( (|MultiSet#Select| a@@36 o@@15))
 :pattern ( (|MultiSet#Select| b@@26 o@@15))
)))))
 :qid |stdinbpl.922:17|
 :skolemid |78|
 :pattern ( (|MultiSet#Equal| a@@36 b@@26))
)))
(assert (forall ((a@@37 T@U) (b@@27 T@U) ) (! (let ((T@@54 (MultiSetTypeInv0 (type a@@37))))
 (=> (and (= (type a@@37) (MultiSetType T@@54)) (= (type b@@27) (MultiSetType T@@54))) (= (|MultiSet#Subset| a@@37 b@@27) (forall ((o@@16 T@U) ) (!  (=> (= (type o@@16) T@@54) (<= (|MultiSet#Select| a@@37 o@@16) (|MultiSet#Select| b@@27 o@@16)))
 :qid |stdinbpl.919:37|
 :skolemid |75|
 :pattern ( (|MultiSet#Select| a@@37 o@@16))
 :pattern ( (|MultiSet#Select| b@@27 o@@16))
)))))
 :qid |stdinbpl.918:17|
 :skolemid |76|
 :pattern ( (|MultiSet#Subset| a@@37 b@@27))
)))
(assert (forall ((a@@38 T@U) (b@@28 T@U) (o@@17 T@U) ) (! (let ((T@@55 (type o@@17)))
 (=> (and (= (type a@@38) (MapType2Type T@@55 boolType)) (= (type b@@28) (MapType2Type T@@55 boolType))) (= (U_2_bool (MapType2Select (|Set#Union| a@@38 b@@28) o@@17))  (or (U_2_bool (MapType2Select a@@38 o@@17)) (U_2_bool (MapType2Select b@@28 o@@17))))))
 :qid |stdinbpl.777:18|
 :skolemid |34|
 :pattern ( (MapType2Select (|Set#Union| a@@38 b@@28) o@@17))
)))
(assert (forall ((Heap@@22 T@U) (g0@@10 T@U) (g1@@10 T@U) ) (!  (=> (and (and (= (type Heap@@22) (MapType0Type RefType)) (= (type g0@@10) (MapType2Type RefType boolType))) (= (type g1@@10) (MapType2Type RefType boolType))) (and (= (apply_TCFraming Heap@@22 g0@@10 g1@@10) (|apply_TCFraming'| Heap@@22 g0@@10 g1@@10)) (dummyFunction (bool_2_U (|apply_TCFraming#triggerStateless| g0@@10 g1@@10)))))
 :qid |stdinbpl.1330:15|
 :skolemid |127|
 :pattern ( (apply_TCFraming Heap@@22 g0@@10 g1@@10))
)))
(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun refs@@7 () T@U)
(declare-fun Result () T@U)
(declare-fun Heap@@23 () T@U)
(declare-fun QPMask@1 () T@U)
(declare-fun p_3 () T@U)
(declare-fun s_3 () T@U)
(declare-fun qpRange2 (T@U) Bool)
(declare-fun invRecv2 (T@U) T@U)
(declare-fun QPMask@0 () T@U)
(declare-fun qpRange1 (T@U) Bool)
(declare-fun invRecv1 (T@U) T@U)
(assert  (and (and (and (and (and (and (and (and (= (type refs@@7) (MapType2Type RefType boolType)) (= (type p_3) RefType)) (= (type s_3) RefType)) (= (type Heap@@23) (MapType0Type RefType))) (= (type QPMask@1) (MapType1Type RefType realType))) (= (type Result) (MapType2Type EdgeDomainTypeType boolType))) (forall ((arg0@@59 T@U) ) (! (= (type (invRecv2 arg0@@59)) RefType)
 :qid |funType:invRecv2|
 :pattern ( (invRecv2 arg0@@59))
))) (= (type QPMask@0) (MapType1Type RefType realType))) (forall ((arg0@@60 T@U) ) (! (= (type (invRecv1 arg0@@60)) RefType)
 :qid |funType:invRecv1|
 :pattern ( (invRecv1 arg0@@60))
))))
(set-info :boogie-vc-id |$$#definedness|)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 24) (let ((anon22_Else_correct true))
(let ((anon22_Then_correct true))
(let ((anon21_Else_correct  (=> (and (forall ((p_6 T@U) (s_6 T@U) ) (!  (=> (and (and (= (type p_6) RefType) (= (type s_6) RefType)) (and (U_2_bool (MapType2Select refs@@7 p_6)) (exists_path Result p_6 s_6))) (U_2_bool (MapType2Select refs@@7 s_6)))
 :qid |stdinbpl.1306:20|
 :skolemid |125|
 :pattern ( (MapType2Select refs@@7 p_6) (MapType2Select refs@@7 s_6) (exists_path Result p_6 s_6))
)) (state Heap@@23 QPMask@1)) (and (=> (= (ControlFlow 0 15) 13) anon22_Then_correct) (=> (= (ControlFlow 0 15) 14) anon22_Else_correct)))))
(let ((anon21_Then_correct true))
(let ((anon17_Else_correct  (=> (and (forall ((p_4 T@U) (s_4 T@U) ) (!  (=> (and (= (type p_4) RefType) (= (type s_4) RefType)) (=  (and (U_2_bool (MapType2Select refs@@7 p_4)) (and (U_2_bool (MapType2Select refs@@7 s_4)) (or (= (MapType0Select Heap@@23 p_4 l) s_4) (= (MapType0Select Heap@@23 p_4 r_1) s_4)))) (U_2_bool (MapType2Select Result (create_edge p_4 s_4)))))
 :qid |stdinbpl.1296:20|
 :skolemid |124|
 :pattern ( (create_edge p_4 s_4))
)) (state Heap@@23 QPMask@1)) (and (=> (= (ControlFlow 0 16) 12) anon21_Then_correct) (=> (= (ControlFlow 0 16) 15) anon21_Else_correct)))))
(let ((anon9_correct true))
(let ((anon20_Else_correct  (=> (and (= (MapType0Select Heap@@23 p_3 l) s_3) (= (ControlFlow 0 8) 3)) anon9_correct)))
(let ((anon20_Then_correct  (=> (not (= (MapType0Select Heap@@23 p_3 l) s_3)) (and (=> (= (ControlFlow 0 6) (- 0 7)) (HasDirectPerm QPMask@1 p_3 r_1)) (=> (HasDirectPerm QPMask@1 p_3 r_1) (=> (= (ControlFlow 0 6) 3) anon9_correct))))))
(let ((anon19_Then_correct  (=> (U_2_bool (MapType2Select refs@@7 s_3)) (and (=> (= (ControlFlow 0 9) (- 0 10)) (HasDirectPerm QPMask@1 p_3 l)) (=> (HasDirectPerm QPMask@1 p_3 l) (and (=> (= (ControlFlow 0 9) 6) anon20_Then_correct) (=> (= (ControlFlow 0 9) 8) anon20_Else_correct)))))))
(let ((anon19_Else_correct  (=> (and (not (U_2_bool (MapType2Select refs@@7 s_3))) (= (ControlFlow 0 5) 3)) anon9_correct)))
(let ((anon18_Then_correct  (=> (U_2_bool (MapType2Select refs@@7 p_3)) (and (=> (= (ControlFlow 0 11) 9) anon19_Then_correct) (=> (= (ControlFlow 0 11) 5) anon19_Else_correct)))))
(let ((anon18_Else_correct  (=> (and (not (U_2_bool (MapType2Select refs@@7 p_3))) (= (ControlFlow 0 4) 3)) anon9_correct)))
(let ((anon16_Else_correct  (and (=> (= (ControlFlow 0 17) (- 0 19)) (forall ((n_7 T@U) (n_7_1 T@U) ) (!  (=> (and (= (type n_7) RefType) (= (type n_7_1) RefType)) (=> (and (and (and (and (not (= n_7 n_7_1)) (U_2_bool (MapType2Select refs@@7 n_7))) (U_2_bool (MapType2Select refs@@7 n_7_1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_7 n_7_1))))
 :qid |stdinbpl.1240:15|
 :skolemid |117|
 :no-pattern (type n_7)
 :no-pattern (type n_7_1)
 :no-pattern (U_2_int n_7)
 :no-pattern (U_2_bool n_7)
 :no-pattern (U_2_int n_7_1)
 :no-pattern (U_2_bool n_7_1)
))) (=> (forall ((n_7@@0 T@U) (n_7_1@@0 T@U) ) (!  (=> (and (= (type n_7@@0) RefType) (= (type n_7_1@@0) RefType)) (=> (and (and (and (and (not (= n_7@@0 n_7_1@@0)) (U_2_bool (MapType2Select refs@@7 n_7@@0))) (U_2_bool (MapType2Select refs@@7 n_7_1@@0))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_7@@0 n_7_1@@0))))
 :qid |stdinbpl.1240:15|
 :skolemid |117|
 :no-pattern (type n_7@@0)
 :no-pattern (type n_7_1@@0)
 :no-pattern (U_2_int n_7@@0)
 :no-pattern (U_2_bool n_7@@0)
 :no-pattern (U_2_int n_7_1@@0)
 :no-pattern (U_2_bool n_7_1@@0)
)) (=> (and (forall ((n_7@@1 T@U) ) (!  (=> (= (type n_7@@1) RefType) (=> (and (U_2_bool (MapType2Select refs@@7 n_7@@1)) (< NoPerm (/ (to_real 1) (to_real 2)))) (and (qpRange2 n_7@@1) (= (invRecv2 n_7@@1) n_7@@1))))
 :qid |stdinbpl.1246:22|
 :skolemid |118|
 :pattern ( (MapType0Select Heap@@23 n_7@@1 r_1))
 :pattern ( (MapType1Select QPMask@1 n_7@@1 r_1))
 :pattern ( (MapType0Select Heap@@23 n_7@@1 r_1))
)) (forall ((o_3 T@U) ) (!  (=> (= (type o_3) RefType) (=> (and (and (U_2_bool (MapType2Select refs@@7 (invRecv2 o_3))) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange2 o_3)) (= (invRecv2 o_3) o_3)))
 :qid |stdinbpl.1250:22|
 :skolemid |119|
 :pattern ( (invRecv2 o_3))
))) (and (=> (= (ControlFlow 0 17) (- 0 18)) (forall ((n_7@@2 T@U) ) (!  (=> (and (= (type n_7@@2) RefType) (U_2_bool (MapType2Select refs@@7 n_7@@2))) (>= (/ (to_real 1) (to_real 2)) NoPerm))
 :qid |stdinbpl.1256:15|
 :skolemid |120|
 :pattern ( (MapType0Select Heap@@23 n_7@@2 r_1))
 :pattern ( (MapType1Select QPMask@1 n_7@@2 r_1))
 :pattern ( (MapType0Select Heap@@23 n_7@@2 r_1))
))) (=> (forall ((n_7@@3 T@U) ) (!  (=> (and (= (type n_7@@3) RefType) (U_2_bool (MapType2Select refs@@7 n_7@@3))) (>= (/ (to_real 1) (to_real 2)) NoPerm))
 :qid |stdinbpl.1256:15|
 :skolemid |120|
 :pattern ( (MapType0Select Heap@@23 n_7@@3 r_1))
 :pattern ( (MapType1Select QPMask@1 n_7@@3 r_1))
 :pattern ( (MapType0Select Heap@@23 n_7@@3 r_1))
)) (=> (forall ((n_7@@4 T@U) ) (!  (=> (= (type n_7@@4) RefType) (=> (and (U_2_bool (MapType2Select refs@@7 n_7@@4)) (> (/ (to_real 1) (to_real 2)) NoPerm)) (not (= n_7@@4 null))))
 :qid |stdinbpl.1262:22|
 :skolemid |121|
 :pattern ( (MapType0Select Heap@@23 n_7@@4 r_1))
 :pattern ( (MapType1Select QPMask@1 n_7@@4 r_1))
 :pattern ( (MapType0Select Heap@@23 n_7@@4 r_1))
)) (=> (and (and (forall ((o_3@@0 T@U) ) (!  (=> (= (type o_3@@0) RefType) (and (=> (and (and (U_2_bool (MapType2Select refs@@7 (invRecv2 o_3@@0))) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange2 o_3@@0)) (and (=> (< NoPerm (/ (to_real 1) (to_real 2))) (= (invRecv2 o_3@@0) o_3@@0)) (= (U_2_real (MapType1Select QPMask@1 o_3@@0 r_1)) (+ (U_2_real (MapType1Select QPMask@0 o_3@@0 r_1)) (/ (to_real 1) (to_real 2)))))) (=> (not (and (and (U_2_bool (MapType2Select refs@@7 (invRecv2 o_3@@0))) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange2 o_3@@0))) (= (U_2_real (MapType1Select QPMask@1 o_3@@0 r_1)) (U_2_real (MapType1Select QPMask@0 o_3@@0 r_1))))))
 :qid |stdinbpl.1268:22|
 :skolemid |122|
 :pattern ( (MapType1Select QPMask@1 o_3@@0 r_1))
)) (forall ((o_3@@1 T@U) (f_5 T@U) ) (! (let ((B@@11 (FieldTypeInv1 (type f_5))))
(let ((A@@12 (FieldTypeInv0 (type f_5))))
 (=> (and (and (= (type o_3@@1) RefType) (= (type f_5) (FieldType A@@12 B@@11))) (not (= f_5 r_1))) (= (U_2_real (MapType1Select QPMask@0 o_3@@1 f_5)) (U_2_real (MapType1Select QPMask@1 o_3@@1 f_5))))))
 :qid |stdinbpl.1272:29|
 :skolemid |123|
 :pattern ( (MapType1Select QPMask@0 o_3@@1 f_5))
 :pattern ( (MapType1Select QPMask@1 o_3@@1 f_5))
))) (and (state Heap@@23 QPMask@1) (state Heap@@23 QPMask@1))) (and (and (=> (= (ControlFlow 0 17) 16) anon17_Else_correct) (=> (= (ControlFlow 0 17) 11) anon18_Then_correct)) (=> (= (ControlFlow 0 17) 4) anon18_Else_correct)))))))))))
(let ((anon16_Then_correct true))
(let ((anon15_Else_correct  (and (=> (= (ControlFlow 0 20) (- 0 22)) (forall ((n_5 T@U) (n_5_1 T@U) ) (!  (=> (and (= (type n_5) RefType) (= (type n_5_1) RefType)) (=> (and (and (and (and (not (= n_5 n_5_1)) (U_2_bool (MapType2Select refs@@7 n_5))) (U_2_bool (MapType2Select refs@@7 n_5_1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_5 n_5_1))))
 :qid |stdinbpl.1194:15|
 :skolemid |110|
 :no-pattern (type n_5)
 :no-pattern (type n_5_1)
 :no-pattern (U_2_int n_5)
 :no-pattern (U_2_bool n_5)
 :no-pattern (U_2_int n_5_1)
 :no-pattern (U_2_bool n_5_1)
))) (=> (forall ((n_5@@0 T@U) (n_5_1@@0 T@U) ) (!  (=> (and (= (type n_5@@0) RefType) (= (type n_5_1@@0) RefType)) (=> (and (and (and (and (not (= n_5@@0 n_5_1@@0)) (U_2_bool (MapType2Select refs@@7 n_5@@0))) (U_2_bool (MapType2Select refs@@7 n_5_1@@0))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_5@@0 n_5_1@@0))))
 :qid |stdinbpl.1194:15|
 :skolemid |110|
 :no-pattern (type n_5@@0)
 :no-pattern (type n_5_1@@0)
 :no-pattern (U_2_int n_5@@0)
 :no-pattern (U_2_bool n_5@@0)
 :no-pattern (U_2_int n_5_1@@0)
 :no-pattern (U_2_bool n_5_1@@0)
)) (=> (and (forall ((n_5@@1 T@U) ) (!  (=> (= (type n_5@@1) RefType) (=> (and (U_2_bool (MapType2Select refs@@7 n_5@@1)) (< NoPerm (/ (to_real 1) (to_real 2)))) (and (qpRange1 n_5@@1) (= (invRecv1 n_5@@1) n_5@@1))))
 :qid |stdinbpl.1200:22|
 :skolemid |111|
 :pattern ( (MapType0Select Heap@@23 n_5@@1 l))
 :pattern ( (MapType1Select QPMask@0 n_5@@1 l))
 :pattern ( (MapType0Select Heap@@23 n_5@@1 l))
)) (forall ((o_3@@2 T@U) ) (!  (=> (= (type o_3@@2) RefType) (=> (and (and (U_2_bool (MapType2Select refs@@7 (invRecv1 o_3@@2))) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange1 o_3@@2)) (= (invRecv1 o_3@@2) o_3@@2)))
 :qid |stdinbpl.1204:22|
 :skolemid |112|
 :pattern ( (invRecv1 o_3@@2))
))) (and (=> (= (ControlFlow 0 20) (- 0 21)) (forall ((n_5@@2 T@U) ) (!  (=> (and (= (type n_5@@2) RefType) (U_2_bool (MapType2Select refs@@7 n_5@@2))) (>= (/ (to_real 1) (to_real 2)) NoPerm))
 :qid |stdinbpl.1210:15|
 :skolemid |113|
 :pattern ( (MapType0Select Heap@@23 n_5@@2 l))
 :pattern ( (MapType1Select QPMask@0 n_5@@2 l))
 :pattern ( (MapType0Select Heap@@23 n_5@@2 l))
))) (=> (forall ((n_5@@3 T@U) ) (!  (=> (and (= (type n_5@@3) RefType) (U_2_bool (MapType2Select refs@@7 n_5@@3))) (>= (/ (to_real 1) (to_real 2)) NoPerm))
 :qid |stdinbpl.1210:15|
 :skolemid |113|
 :pattern ( (MapType0Select Heap@@23 n_5@@3 l))
 :pattern ( (MapType1Select QPMask@0 n_5@@3 l))
 :pattern ( (MapType0Select Heap@@23 n_5@@3 l))
)) (=> (forall ((n_5@@4 T@U) ) (!  (=> (= (type n_5@@4) RefType) (=> (and (U_2_bool (MapType2Select refs@@7 n_5@@4)) (> (/ (to_real 1) (to_real 2)) NoPerm)) (not (= n_5@@4 null))))
 :qid |stdinbpl.1216:22|
 :skolemid |114|
 :pattern ( (MapType0Select Heap@@23 n_5@@4 l))
 :pattern ( (MapType1Select QPMask@0 n_5@@4 l))
 :pattern ( (MapType0Select Heap@@23 n_5@@4 l))
)) (=> (and (and (forall ((o_3@@3 T@U) ) (!  (=> (= (type o_3@@3) RefType) (and (=> (and (and (U_2_bool (MapType2Select refs@@7 (invRecv1 o_3@@3))) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange1 o_3@@3)) (and (=> (< NoPerm (/ (to_real 1) (to_real 2))) (= (invRecv1 o_3@@3) o_3@@3)) (= (U_2_real (MapType1Select QPMask@0 o_3@@3 l)) (+ (U_2_real (MapType1Select ZeroMask o_3@@3 l)) (/ (to_real 1) (to_real 2)))))) (=> (not (and (and (U_2_bool (MapType2Select refs@@7 (invRecv1 o_3@@3))) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange1 o_3@@3))) (= (U_2_real (MapType1Select QPMask@0 o_3@@3 l)) (U_2_real (MapType1Select ZeroMask o_3@@3 l))))))
 :qid |stdinbpl.1222:22|
 :skolemid |115|
 :pattern ( (MapType1Select QPMask@0 o_3@@3 l))
)) (forall ((o_3@@4 T@U) (f_5@@0 T@U) ) (! (let ((B@@12 (FieldTypeInv1 (type f_5@@0))))
(let ((A@@13 (FieldTypeInv0 (type f_5@@0))))
 (=> (and (and (= (type o_3@@4) RefType) (= (type f_5@@0) (FieldType A@@13 B@@12))) (not (= f_5@@0 l))) (= (U_2_real (MapType1Select ZeroMask o_3@@4 f_5@@0)) (U_2_real (MapType1Select QPMask@0 o_3@@4 f_5@@0))))))
 :qid |stdinbpl.1226:29|
 :skolemid |116|
 :pattern ( (MapType1Select ZeroMask o_3@@4 f_5@@0))
 :pattern ( (MapType1Select QPMask@0 o_3@@4 f_5@@0))
))) (and (state Heap@@23 QPMask@0) (state Heap@@23 QPMask@0))) (and (=> (= (ControlFlow 0 20) 2) anon16_Then_correct) (=> (= (ControlFlow 0 20) 17) anon16_Else_correct)))))))))))
(let ((anon15_Then_correct true))
(let ((anon0_correct  (=> (and (state Heap@@23 ZeroMask) (= AssumeFunctionsAbove 1)) (and (=> (= (ControlFlow 0 23) 1) anon15_Then_correct) (=> (= (ControlFlow 0 23) 20) anon15_Else_correct)))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 24) 23) anon0_correct)))
PreconditionGeneratedEntry_correct)))))))))))))))))))
))
(check-sat)
(pop 1)
; Valid
(get-info :rlimit)
