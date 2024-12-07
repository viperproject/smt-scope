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
(declare-fun PostHeap@0 () T@U)
(declare-fun QPMask@36 () T@U)
(declare-fun g0@@11 () T@U)
(declare-fun g1@@11 () T@U)
(declare-fun neverTriggered157 (T@U) Bool)
(declare-fun QPMask@35 () T@U)
(declare-fun qpRange157 (T@U) Bool)
(declare-fun invRecv157 (T@U) T@U)
(declare-fun QPMask@37 () T@U)
(declare-fun neverTriggered158 (T@U) Bool)
(declare-fun x_1@@0 () T@U)
(declare-fun QPMask@38 () T@U)
(declare-fun neverTriggered155 (T@U) Bool)
(declare-fun qpRange155 (T@U) Bool)
(declare-fun invRecv155 (T@U) T@U)
(declare-fun QPMask@39 () T@U)
(declare-fun neverTriggered156 (T@U) Bool)
(declare-fun n_40 () T@U)
(declare-fun n$12_3 () T@U)
(declare-fun n$11_3 () T@U)
(declare-fun qpRange154 (T@U) Bool)
(declare-fun invRecv154 (T@U) T@U)
(declare-fun QPMask@34 () T@U)
(declare-fun qpRange153 (T@U) Bool)
(declare-fun invRecv153 (T@U) T@U)
(declare-fun n$1_2 () T@U)
(declare-fun n$0_8 () T@U)
(declare-fun neverTriggered169 (T@U) Bool)
(declare-fun Heap@@23 () T@U)
(declare-fun QPMask@8 () T@U)
(declare-fun QPMask@5 () T@U)
(declare-fun qpRange169 (T@U) Bool)
(declare-fun invRecv169 (T@U) T@U)
(declare-fun neverTriggered170 (T@U) Bool)
(declare-fun QPMask@9 () T@U)
(declare-fun qpRange170 (T@U) Bool)
(declare-fun invRecv170 (T@U) T@U)
(declare-fun neverTriggered171 (T@U) Bool)
(declare-fun QPMask@10 () T@U)
(declare-fun qpRange171 (T@U) Bool)
(declare-fun invRecv171 (T@U) T@U)
(declare-fun neverTriggered172 (T@U) Bool)
(declare-fun QPMask@11 () T@U)
(declare-fun qpRange172 (T@U) Bool)
(declare-fun invRecv172 (T@U) T@U)
(declare-fun n$1_4_1 () T@U)
(declare-fun n$0_10 () T@U)
(declare-fun neverTriggered173 (T@U) Bool)
(declare-fun QPMask@12 () T@U)
(declare-fun qpRange173 (T@U) Bool)
(declare-fun invRecv173 (T@U) T@U)
(declare-fun neverTriggered174 (T@U) Bool)
(declare-fun QPMask@13 () T@U)
(declare-fun qpRange174 (T@U) Bool)
(declare-fun invRecv174 (T@U) T@U)
(declare-fun neverTriggered175 (T@U) Bool)
(declare-fun QPMask@14 () T@U)
(declare-fun qpRange175 (T@U) Bool)
(declare-fun invRecv175 (T@U) T@U)
(declare-fun neverTriggered176 (T@U) Bool)
(declare-fun QPMask@15 () T@U)
(declare-fun qpRange176 (T@U) Bool)
(declare-fun invRecv176 (T@U) T@U)
(declare-fun arg_g@0 () T@U)
(declare-fun n$2_2_1 () T@U)
(declare-fun n$1_6_1 () T@U)
(declare-fun n_16 () T@U)
(declare-fun Heap@0 () T@U)
(declare-fun n$12_2 () T@U)
(declare-fun n$11_2 () T@U)
(declare-fun Mask@8 () T@U)
(declare-fun neverTriggered159 (T@U) Bool)
(declare-fun QPMask@24 () T@U)
(declare-fun qpRange159 (T@U) Bool)
(declare-fun invRecv159 (T@U) T@U)
(declare-fun neverTriggered160 (T@U) Bool)
(declare-fun QPMask@25 () T@U)
(declare-fun qpRange160 (T@U) Bool)
(declare-fun invRecv160 (T@U) T@U)
(declare-fun ExhaleHeap@3 () T@U)
(declare-fun QPMask@23 () T@U)
(declare-fun x1@@7 () T@U)
(declare-fun x0@@10 () T@U)
(declare-fun QPMask@21 () T@U)
(declare-fun perm@6 () Real)
(declare-fun Mask@6 () T@U)
(declare-fun perm@7 () Real)
(declare-fun Mask@7 () T@U)
(declare-fun QPMask@22 () T@U)
(declare-fun qpRange179 (T@U) Bool)
(declare-fun invRecv179 (T@U) T@U)
(declare-fun qpRange180 (T@U) Bool)
(declare-fun invRecv180 (T@U) T@U)
(declare-fun Mask@5 () T@U)
(declare-fun Mask@4 () T@U)
(declare-fun perm@5 () Real)
(declare-fun QPMask@20 () T@U)
(declare-fun neverTriggered177 (T@U) Bool)
(declare-fun qpRange177 (T@U) Bool)
(declare-fun invRecv177 (T@U) T@U)
(declare-fun neverTriggered178 (T@U) Bool)
(declare-fun qpRange178 (T@U) Bool)
(declare-fun invRecv178 (T@U) T@U)
(declare-fun perm@4 () Real)
(declare-fun ExhaleHeap@2 () T@U)
(declare-fun QPMask@19 () T@U)
(declare-fun arg_g_1@0 () T@U)
(declare-fun QPMask@17 () T@U)
(declare-fun perm@2 () Real)
(declare-fun Mask@2 () T@U)
(declare-fun perm@3 () Real)
(declare-fun Mask@3 () T@U)
(declare-fun QPMask@18 () T@U)
(declare-fun qpRange183 (T@U) Bool)
(declare-fun invRecv183 (T@U) T@U)
(declare-fun qpRange184 (T@U) Bool)
(declare-fun invRecv184 (T@U) T@U)
(declare-fun n$2_4_1 () T@U)
(declare-fun n$1_8 () T@U)
(declare-fun Mask@1 () T@U)
(declare-fun Mask@0 () T@U)
(declare-fun perm@1 () Real)
(declare-fun QPMask@16 () T@U)
(declare-fun neverTriggered181 (T@U) Bool)
(declare-fun qpRange181 (T@U) Bool)
(declare-fun invRecv181 (T@U) T@U)
(declare-fun neverTriggered182 (T@U) Bool)
(declare-fun qpRange182 (T@U) Bool)
(declare-fun invRecv182 (T@U) T@U)
(declare-fun perm@0 () Real)
(declare-fun QPMask@26 () T@U)
(declare-fun neverTriggered167 (T@U) Bool)
(declare-fun qpRange167 (T@U) Bool)
(declare-fun invRecv167 (T@U) T@U)
(declare-fun QPMask@27 () T@U)
(declare-fun neverTriggered168 (T@U) Bool)
(declare-fun u$2 () T@U)
(declare-fun v$2 () T@U)
(declare-fun QPMask@28 () T@U)
(declare-fun neverTriggered165 (T@U) Bool)
(declare-fun qpRange165 (T@U) Bool)
(declare-fun invRecv165 (T@U) T@U)
(declare-fun QPMask@29 () T@U)
(declare-fun neverTriggered166 (T@U) Bool)
(declare-fun u$1 () T@U)
(declare-fun v$1 () T@U)
(declare-fun QPMask@30 () T@U)
(declare-fun neverTriggered163 (T@U) Bool)
(declare-fun qpRange163 (T@U) Bool)
(declare-fun invRecv163 (T@U) T@U)
(declare-fun QPMask@31 () T@U)
(declare-fun neverTriggered164 (T@U) Bool)
(declare-fun u$0 () T@U)
(declare-fun v$0 () T@U)
(declare-fun QPMask@32 () T@U)
(declare-fun neverTriggered161 (T@U) Bool)
(declare-fun qpRange161 (T@U) Bool)
(declare-fun invRecv161 (T@U) T@U)
(declare-fun QPMask@33 () T@U)
(declare-fun neverTriggered162 (T@U) Bool)
(declare-fun u_12 () T@U)
(declare-fun v_12 () T@U)
(declare-fun QPMask@40 () T@U)
(declare-fun neverTriggered151 (T@U) Bool)
(declare-fun qpRange151 (T@U) Bool)
(declare-fun invRecv151 (T@U) T@U)
(declare-fun QPMask@41 () T@U)
(declare-fun neverTriggered152 (T@U) Bool)
(declare-fun m_2 () T@U)
(declare-fun QPMask@42 () T@U)
(declare-fun neverTriggered149 (T@U) Bool)
(declare-fun qpRange149 (T@U) Bool)
(declare-fun invRecv149 (T@U) T@U)
(declare-fun QPMask@43 () T@U)
(declare-fun neverTriggered150 (T@U) Bool)
(declare-fun n_39 () T@U)
(declare-fun QPMask@44 () T@U)
(declare-fun neverTriggered147 (T@U) Bool)
(declare-fun qpRange147 (T@U) Bool)
(declare-fun invRecv147 (T@U) T@U)
(declare-fun QPMask@45 () T@U)
(declare-fun neverTriggered148 (T@U) Bool)
(declare-fun n_38 () T@U)
(declare-fun QPMask@6 () T@U)
(declare-fun neverTriggered145 (T@U) Bool)
(declare-fun qpRange145 (T@U) Bool)
(declare-fun invRecv145 (T@U) T@U)
(declare-fun QPMask@7 () T@U)
(declare-fun neverTriggered146 (T@U) Bool)
(declare-fun n$6_7 () T@U)
(declare-fun n$5_7 () T@U)
(declare-fun qpRange144 (T@U) Bool)
(declare-fun invRecv144 (T@U) T@U)
(declare-fun QPMask@4 () T@U)
(declare-fun qpRange143 (T@U) Bool)
(declare-fun invRecv143 (T@U) T@U)
(declare-fun QPMask@1 () T@U)
(declare-fun QPMask@2 () T@U)
(declare-fun neverTriggered141 (T@U) Bool)
(declare-fun qpRange141 (T@U) Bool)
(declare-fun invRecv141 (T@U) T@U)
(declare-fun QPMask@3 () T@U)
(declare-fun neverTriggered142 (T@U) Bool)
(declare-fun n$2_6 () T@U)
(declare-fun n$1_7 () T@U)
(declare-fun qpRange140 (T@U) Bool)
(declare-fun invRecv140 (T@U) T@U)
(declare-fun QPMask@0 () T@U)
(declare-fun qpRange139 (T@U) Bool)
(declare-fun invRecv139 (T@U) T@U)
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (= (type g0@@11) (MapType2Type RefType boolType)) (= (type n$1_7) RefType)) (= (type Heap@@23) (MapType0Type RefType))) (= (type QPMask@1) (MapType1Type RefType realType))) (= (type n$2_6) RefType)) (= (type QPMask@2) (MapType1Type RefType realType))) (forall ((arg0@@59 T@U) ) (! (= (type (invRecv141 arg0@@59)) RefType)
 :qid |funType:invRecv141|
 :pattern ( (invRecv141 arg0@@59))
))) (= (type QPMask@3) (MapType1Type RefType realType))) (= (type g1@@11) (MapType2Type RefType boolType))) (= (type n$5_7) RefType)) (= (type QPMask@5) (MapType1Type RefType realType))) (= (type n$6_7) RefType)) (= (type QPMask@6) (MapType1Type RefType realType))) (forall ((arg0@@60 T@U) ) (! (= (type (invRecv145 arg0@@60)) RefType)
 :qid |funType:invRecv145|
 :pattern ( (invRecv145 arg0@@60))
))) (= (type QPMask@7) (MapType1Type RefType realType))) (= (type n_38) RefType)) (= (type QPMask@44) (MapType1Type RefType realType))) (forall ((arg0@@61 T@U) ) (! (= (type (invRecv147 arg0@@61)) RefType)
 :qid |funType:invRecv147|
 :pattern ( (invRecv147 arg0@@61))
))) (= (type QPMask@45) (MapType1Type RefType realType))) (= (type n_39) RefType)) (= (type QPMask@42) (MapType1Type RefType realType))) (forall ((arg0@@62 T@U) ) (! (= (type (invRecv149 arg0@@62)) RefType)
 :qid |funType:invRecv149|
 :pattern ( (invRecv149 arg0@@62))
))) (= (type QPMask@43) (MapType1Type RefType realType))) (= (type m_2) RefType)) (= (type QPMask@40) (MapType1Type RefType realType))) (forall ((arg0@@63 T@U) ) (! (= (type (invRecv151 arg0@@63)) RefType)
 :qid |funType:invRecv151|
 :pattern ( (invRecv151 arg0@@63))
))) (= (type QPMask@41) (MapType1Type RefType realType))) (= (type u_12) RefType)) (= (type v_12) RefType)) (= (type QPMask@32) (MapType1Type RefType realType))) (forall ((arg0@@64 T@U) ) (! (= (type (invRecv161 arg0@@64)) RefType)
 :qid |funType:invRecv161|
 :pattern ( (invRecv161 arg0@@64))
))) (= (type QPMask@33) (MapType1Type RefType realType))) (= (type u$0) RefType)) (= (type v$0) RefType)) (= (type QPMask@30) (MapType1Type RefType realType))) (forall ((arg0@@65 T@U) ) (! (= (type (invRecv163 arg0@@65)) RefType)
 :qid |funType:invRecv163|
 :pattern ( (invRecv163 arg0@@65))
))) (= (type QPMask@31) (MapType1Type RefType realType))) (= (type u$1) RefType)) (= (type v$1) RefType)) (= (type QPMask@28) (MapType1Type RefType realType))) (forall ((arg0@@66 T@U) ) (! (= (type (invRecv165 arg0@@66)) RefType)
 :qid |funType:invRecv165|
 :pattern ( (invRecv165 arg0@@66))
))) (= (type QPMask@29) (MapType1Type RefType realType))) (= (type u$2) RefType)) (= (type v$2) RefType)) (= (type QPMask@26) (MapType1Type RefType realType))) (forall ((arg0@@67 T@U) ) (! (= (type (invRecv167 arg0@@67)) RefType)
 :qid |funType:invRecv167|
 :pattern ( (invRecv167 arg0@@67))
))) (= (type QPMask@27) (MapType1Type RefType realType))) (= (type arg_g_1@0) (MapType2Type RefType boolType))) (= (type n$1_8) RefType)) (= (type n$2_4_1) RefType)) (= (type n$11_2) RefType)) (= (type Heap@0) (MapType0Type RefType))) (= (type n$12_2) RefType)) (= (type x_1@@0) RefType)) (= (type n_16) RefType)) (= (type Mask@8) (MapType1Type RefType realType))) (= (type QPMask@24) (MapType1Type RefType realType))) (forall ((arg0@@68 T@U) ) (! (= (type (invRecv159 arg0@@68)) RefType)
 :qid |funType:invRecv159|
 :pattern ( (invRecv159 arg0@@68))
))) (= (type QPMask@25) (MapType1Type RefType realType))) (forall ((arg0@@69 T@U) ) (! (= (type (invRecv160 arg0@@69)) RefType)
 :qid |funType:invRecv160|
 :pattern ( (invRecv160 arg0@@69))
))) (= (type ExhaleHeap@2) (MapType0Type RefType))) (= (type QPMask@19) (MapType1Type RefType realType))) (= (type x1@@7) RefType)) (= (type x0@@10) RefType)) (= (type QPMask@17) (MapType1Type RefType realType))) (= (type Mask@2) (MapType1Type RefType realType))) (= (type Mask@3) (MapType1Type RefType realType))) (= (type QPMask@18) (MapType1Type RefType realType))) (forall ((arg0@@70 T@U) ) (! (= (type (invRecv183 arg0@@70)) RefType)
 :qid |funType:invRecv183|
 :pattern ( (invRecv183 arg0@@70))
))) (forall ((arg0@@71 T@U) ) (! (= (type (invRecv184 arg0@@71)) RefType)
 :qid |funType:invRecv184|
 :pattern ( (invRecv184 arg0@@71))
))) (= (type Mask@1) (MapType1Type RefType realType))) (= (type Mask@0) (MapType1Type RefType realType))) (= (type QPMask@16) (MapType1Type RefType realType))) (forall ((arg0@@72 T@U) ) (! (= (type (invRecv181 arg0@@72)) RefType)
 :qid |funType:invRecv181|
 :pattern ( (invRecv181 arg0@@72))
))) (forall ((arg0@@73 T@U) ) (! (= (type (invRecv182 arg0@@73)) RefType)
 :qid |funType:invRecv182|
 :pattern ( (invRecv182 arg0@@73))
))) (= (type arg_g@0) (MapType2Type RefType boolType))) (= (type n$1_6_1) RefType)) (= (type n$2_2_1) RefType)) (= (type ExhaleHeap@3) (MapType0Type RefType))) (= (type QPMask@23) (MapType1Type RefType realType))) (= (type QPMask@21) (MapType1Type RefType realType))) (= (type Mask@6) (MapType1Type RefType realType))) (= (type Mask@7) (MapType1Type RefType realType))) (= (type QPMask@22) (MapType1Type RefType realType))) (forall ((arg0@@74 T@U) ) (! (= (type (invRecv179 arg0@@74)) RefType)
 :qid |funType:invRecv179|
 :pattern ( (invRecv179 arg0@@74))
))) (forall ((arg0@@75 T@U) ) (! (= (type (invRecv180 arg0@@75)) RefType)
 :qid |funType:invRecv180|
 :pattern ( (invRecv180 arg0@@75))
))) (= (type Mask@5) (MapType1Type RefType realType))) (= (type Mask@4) (MapType1Type RefType realType))) (= (type QPMask@20) (MapType1Type RefType realType))) (forall ((arg0@@76 T@U) ) (! (= (type (invRecv177 arg0@@76)) RefType)
 :qid |funType:invRecv177|
 :pattern ( (invRecv177 arg0@@76))
))) (forall ((arg0@@77 T@U) ) (! (= (type (invRecv178 arg0@@77)) RefType)
 :qid |funType:invRecv178|
 :pattern ( (invRecv178 arg0@@77))
))) (= (type n$0_10) RefType)) (= (type n$1_4_1) RefType)) (= (type QPMask@12) (MapType1Type RefType realType))) (forall ((arg0@@78 T@U) ) (! (= (type (invRecv173 arg0@@78)) RefType)
 :qid |funType:invRecv173|
 :pattern ( (invRecv173 arg0@@78))
))) (= (type QPMask@13) (MapType1Type RefType realType))) (forall ((arg0@@79 T@U) ) (! (= (type (invRecv174 arg0@@79)) RefType)
 :qid |funType:invRecv174|
 :pattern ( (invRecv174 arg0@@79))
))) (= (type QPMask@14) (MapType1Type RefType realType))) (forall ((arg0@@80 T@U) ) (! (= (type (invRecv175 arg0@@80)) RefType)
 :qid |funType:invRecv175|
 :pattern ( (invRecv175 arg0@@80))
))) (= (type QPMask@15) (MapType1Type RefType realType))) (forall ((arg0@@81 T@U) ) (! (= (type (invRecv176 arg0@@81)) RefType)
 :qid |funType:invRecv176|
 :pattern ( (invRecv176 arg0@@81))
))) (= (type n$0_8) RefType)) (= (type n$1_2) RefType)) (= (type QPMask@8) (MapType1Type RefType realType))) (forall ((arg0@@82 T@U) ) (! (= (type (invRecv169 arg0@@82)) RefType)
 :qid |funType:invRecv169|
 :pattern ( (invRecv169 arg0@@82))
))) (= (type QPMask@9) (MapType1Type RefType realType))) (forall ((arg0@@83 T@U) ) (! (= (type (invRecv170 arg0@@83)) RefType)
 :qid |funType:invRecv170|
 :pattern ( (invRecv170 arg0@@83))
))) (= (type QPMask@10) (MapType1Type RefType realType))) (forall ((arg0@@84 T@U) ) (! (= (type (invRecv171 arg0@@84)) RefType)
 :qid |funType:invRecv171|
 :pattern ( (invRecv171 arg0@@84))
))) (= (type QPMask@11) (MapType1Type RefType realType))) (forall ((arg0@@85 T@U) ) (! (= (type (invRecv172 arg0@@85)) RefType)
 :qid |funType:invRecv172|
 :pattern ( (invRecv172 arg0@@85))
))) (= (type n$11_3) RefType)) (= (type PostHeap@0) (MapType0Type RefType))) (= (type QPMask@35) (MapType1Type RefType realType))) (= (type n$12_3) RefType)) (= (type n_40) RefType)) (= (type QPMask@38) (MapType1Type RefType realType))) (forall ((arg0@@86 T@U) ) (! (= (type (invRecv155 arg0@@86)) RefType)
 :qid |funType:invRecv155|
 :pattern ( (invRecv155 arg0@@86))
))) (= (type QPMask@39) (MapType1Type RefType realType))) (= (type QPMask@36) (MapType1Type RefType realType))) (forall ((arg0@@87 T@U) ) (! (= (type (invRecv157 arg0@@87)) RefType)
 :qid |funType:invRecv157|
 :pattern ( (invRecv157 arg0@@87))
))) (= (type QPMask@37) (MapType1Type RefType realType))) (forall ((arg0@@88 T@U) ) (! (= (type (invRecv154 arg0@@88)) RefType)
 :qid |funType:invRecv154|
 :pattern ( (invRecv154 arg0@@88))
))) (= (type QPMask@34) (MapType1Type RefType realType))) (forall ((arg0@@89 T@U) ) (! (= (type (invRecv153 arg0@@89)) RefType)
 :qid |funType:invRecv153|
 :pattern ( (invRecv153 arg0@@89))
))) (forall ((arg0@@90 T@U) ) (! (= (type (invRecv144 arg0@@90)) RefType)
 :qid |funType:invRecv144|
 :pattern ( (invRecv144 arg0@@90))
))) (= (type QPMask@4) (MapType1Type RefType realType))) (forall ((arg0@@91 T@U) ) (! (= (type (invRecv143 arg0@@91)) RefType)
 :qid |funType:invRecv143|
 :pattern ( (invRecv143 arg0@@91))
))) (forall ((arg0@@92 T@U) ) (! (= (type (invRecv140 arg0@@92)) RefType)
 :qid |funType:invRecv140|
 :pattern ( (invRecv140 arg0@@92))
))) (= (type QPMask@0) (MapType1Type RefType realType))) (forall ((arg0@@93 T@U) ) (! (= (type (invRecv139 arg0@@93)) RefType)
 :qid |funType:invRecv139|
 :pattern ( (invRecv139 arg0@@93))
))))
(set-info :boogie-vc-id connect_DAGs)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 350) (let ((anon220_Else_correct true))
(let ((anon220_Then_correct  (and (=> (= (ControlFlow 0 310) (- 0 315)) (forall ((n_14 T@U) ) (!  (=> (= (type n_14) RefType) (=> (and (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) n_14)) (dummyFunction (MapType0Select PostHeap@0 n_14 l))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.10918:21|
 :skolemid |1296|
 :pattern ( (MapType0Select PostHeap@0 n_14 l))
 :pattern ( (MapType1Select QPMask@36 n_14 l))
 :pattern ( (MapType0Select PostHeap@0 n_14 l))
))) (=> (forall ((n_14@@0 T@U) ) (!  (=> (= (type n_14@@0) RefType) (=> (and (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) n_14@@0)) (dummyFunction (MapType0Select PostHeap@0 n_14@@0 l))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.10918:21|
 :skolemid |1296|
 :pattern ( (MapType0Select PostHeap@0 n_14@@0 l))
 :pattern ( (MapType1Select QPMask@36 n_14@@0 l))
 :pattern ( (MapType0Select PostHeap@0 n_14@@0 l))
)) (and (=> (= (ControlFlow 0 310) (- 0 314)) (forall ((n_14@@1 T@U) (n_14_1 T@U) ) (!  (=> (and (= (type n_14@@1) RefType) (= (type n_14_1) RefType)) (=> (and (and (and (and (not (= n_14@@1 n_14_1)) (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) n_14@@1))) (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) n_14_1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_14@@1 n_14_1))))
 :qid |stdinbpl.10925:21|
 :skolemid |1297|
 :pattern ( (neverTriggered157 n_14@@1) (neverTriggered157 n_14_1))
))) (=> (forall ((n_14@@2 T@U) (n_14_1@@0 T@U) ) (!  (=> (and (= (type n_14@@2) RefType) (= (type n_14_1@@0) RefType)) (=> (and (and (and (and (not (= n_14@@2 n_14_1@@0)) (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) n_14@@2))) (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) n_14_1@@0))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_14@@2 n_14_1@@0))))
 :qid |stdinbpl.10925:21|
 :skolemid |1297|
 :pattern ( (neverTriggered157 n_14@@2) (neverTriggered157 n_14_1@@0))
)) (and (=> (= (ControlFlow 0 310) (- 0 313)) (forall ((n_14@@3 T@U) ) (!  (=> (and (= (type n_14@@3) RefType) (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) n_14@@3))) (>= (U_2_real (MapType1Select QPMask@35 n_14@@3 l)) (/ (to_real 1) (to_real 2))))
 :qid |stdinbpl.10932:21|
 :skolemid |1298|
 :pattern ( (MapType0Select PostHeap@0 n_14@@3 l))
 :pattern ( (MapType1Select QPMask@36 n_14@@3 l))
 :pattern ( (MapType0Select PostHeap@0 n_14@@3 l))
))) (=> (forall ((n_14@@4 T@U) ) (!  (=> (and (= (type n_14@@4) RefType) (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) n_14@@4))) (>= (U_2_real (MapType1Select QPMask@35 n_14@@4 l)) (/ (to_real 1) (to_real 2))))
 :qid |stdinbpl.10932:21|
 :skolemid |1298|
 :pattern ( (MapType0Select PostHeap@0 n_14@@4 l))
 :pattern ( (MapType1Select QPMask@36 n_14@@4 l))
 :pattern ( (MapType0Select PostHeap@0 n_14@@4 l))
)) (=> (and (and (forall ((n_14@@5 T@U) ) (!  (=> (= (type n_14@@5) RefType) (=> (and (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) n_14@@5)) (< NoPerm (/ (to_real 1) (to_real 2)))) (and (qpRange157 n_14@@5) (= (invRecv157 n_14@@5) n_14@@5))))
 :qid |stdinbpl.10938:26|
 :skolemid |1299|
 :pattern ( (MapType0Select PostHeap@0 n_14@@5 l))
 :pattern ( (MapType1Select QPMask@36 n_14@@5 l))
 :pattern ( (MapType0Select PostHeap@0 n_14@@5 l))
)) (forall ((o_3 T@U) ) (!  (=> (= (type o_3) RefType) (=> (and (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) (invRecv157 o_3))) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange157 o_3))) (= (invRecv157 o_3) o_3)))
 :qid |stdinbpl.10942:26|
 :skolemid |1300|
 :pattern ( (invRecv157 o_3))
))) (and (forall ((o_3@@0 T@U) ) (!  (=> (= (type o_3@@0) RefType) (and (=> (and (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) (invRecv157 o_3@@0))) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange157 o_3@@0))) (and (= (invRecv157 o_3@@0) o_3@@0) (= (U_2_real (MapType1Select QPMask@36 o_3@@0 l)) (- (U_2_real (MapType1Select QPMask@35 o_3@@0 l)) (/ (to_real 1) (to_real 2)))))) (=> (not (and (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) (invRecv157 o_3@@0))) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange157 o_3@@0)))) (= (U_2_real (MapType1Select QPMask@36 o_3@@0 l)) (U_2_real (MapType1Select QPMask@35 o_3@@0 l))))))
 :qid |stdinbpl.10948:26|
 :skolemid |1301|
 :pattern ( (MapType1Select QPMask@36 o_3@@0 l))
)) (forall ((o_3@@1 T@U) (f_5 T@U) ) (! (let ((B@@11 (FieldTypeInv1 (type f_5))))
(let ((A@@12 (FieldTypeInv0 (type f_5))))
 (=> (and (and (= (type o_3@@1) RefType) (= (type f_5) (FieldType A@@12 B@@11))) (not (= f_5 l))) (= (U_2_real (MapType1Select QPMask@35 o_3@@1 f_5)) (U_2_real (MapType1Select QPMask@36 o_3@@1 f_5))))))
 :qid |stdinbpl.10954:33|
 :skolemid |1302|
 :pattern ( (MapType1Select QPMask@36 o_3@@1 f_5))
)))) (and (=> (= (ControlFlow 0 310) (- 0 312)) (forall ((n_15 T@U) ) (!  (=> (= (type n_15) RefType) (=> (and (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) n_15)) (dummyFunction (MapType0Select PostHeap@0 n_15 r_1))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.10963:21|
 :skolemid |1303|
 :pattern ( (MapType0Select PostHeap@0 n_15 r_1))
 :pattern ( (MapType1Select QPMask@37 n_15 r_1))
 :pattern ( (MapType0Select PostHeap@0 n_15 r_1))
))) (=> (forall ((n_15@@0 T@U) ) (!  (=> (= (type n_15@@0) RefType) (=> (and (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) n_15@@0)) (dummyFunction (MapType0Select PostHeap@0 n_15@@0 r_1))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.10963:21|
 :skolemid |1303|
 :pattern ( (MapType0Select PostHeap@0 n_15@@0 r_1))
 :pattern ( (MapType1Select QPMask@37 n_15@@0 r_1))
 :pattern ( (MapType0Select PostHeap@0 n_15@@0 r_1))
)) (and (=> (= (ControlFlow 0 310) (- 0 311)) (forall ((n_15@@1 T@U) (n_15_1 T@U) ) (!  (=> (and (= (type n_15@@1) RefType) (= (type n_15_1) RefType)) (=> (and (and (and (and (not (= n_15@@1 n_15_1)) (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) n_15@@1))) (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) n_15_1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_15@@1 n_15_1))))
 :qid |stdinbpl.10970:21|
 :skolemid |1304|
 :pattern ( (neverTriggered158 n_15@@1) (neverTriggered158 n_15_1))
))) (=> (forall ((n_15@@2 T@U) (n_15_1@@0 T@U) ) (!  (=> (and (= (type n_15@@2) RefType) (= (type n_15_1@@0) RefType)) (=> (and (and (and (and (not (= n_15@@2 n_15_1@@0)) (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) n_15@@2))) (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) n_15_1@@0))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_15@@2 n_15_1@@0))))
 :qid |stdinbpl.10970:21|
 :skolemid |1304|
 :pattern ( (neverTriggered158 n_15@@2) (neverTriggered158 n_15_1@@0))
)) (=> (= (ControlFlow 0 310) (- 0 309)) (forall ((n_15@@3 T@U) ) (!  (=> (and (= (type n_15@@3) RefType) (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) n_15@@3))) (>= (U_2_real (MapType1Select QPMask@36 n_15@@3 r_1)) (/ (to_real 1) (to_real 2))))
 :qid |stdinbpl.10977:21|
 :skolemid |1305|
 :pattern ( (MapType0Select PostHeap@0 n_15@@3 r_1))
 :pattern ( (MapType1Select QPMask@37 n_15@@3 r_1))
 :pattern ( (MapType0Select PostHeap@0 n_15@@3 r_1))
))))))))))))))))
(let ((anon217_Else_correct  (=> (forall ((n_13 T@U) ) (!  (=> (and (= (type n_13) RefType) (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) n_13))) (exists_path ($$ PostHeap@0 (|Set#Union| g0@@11 g1@@11)) x_1@@0 n_13))
 :qid |stdinbpl.10902:20|
 :skolemid |1295|
 :pattern ( (exists_path (|$$#frame| (CombineFrames (FrameFragment (int_2_U (|$$#condqp1| PostHeap@0 (|Set#Union| g0@@11 g1@@11)))) (FrameFragment (int_2_U (|$$#condqp2| PostHeap@0 (|Set#Union| g0@@11 g1@@11))))) (|Set#Union| g0@@11 g1@@11)) x_1@@0 n_13))
)) (=> (and (state PostHeap@0 QPMask@35) (state PostHeap@0 QPMask@35)) (and (=> (= (ControlFlow 0 317) 310) anon220_Then_correct) (=> (= (ControlFlow 0 317) 316) anon220_Else_correct))))))
(let ((anon219_Then_correct  (and (=> (= (ControlFlow 0 302) (- 0 307)) (forall ((n$0_6 T@U) ) (!  (=> (= (type n$0_6) RefType) (=> (and (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) n$0_6)) (dummyFunction (MapType0Select PostHeap@0 n$0_6 l))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.10806:25|
 :skolemid |1281|
 :pattern ( (MapType0Select PostHeap@0 n$0_6 l))
 :pattern ( (MapType1Select QPMask@38 n$0_6 l))
 :pattern ( (MapType0Select PostHeap@0 n$0_6 l))
))) (=> (forall ((n$0_6@@0 T@U) ) (!  (=> (= (type n$0_6@@0) RefType) (=> (and (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) n$0_6@@0)) (dummyFunction (MapType0Select PostHeap@0 n$0_6@@0 l))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.10806:25|
 :skolemid |1281|
 :pattern ( (MapType0Select PostHeap@0 n$0_6@@0 l))
 :pattern ( (MapType1Select QPMask@38 n$0_6@@0 l))
 :pattern ( (MapType0Select PostHeap@0 n$0_6@@0 l))
)) (and (=> (= (ControlFlow 0 302) (- 0 306)) (forall ((n$0_6@@1 T@U) (n$0_6_1 T@U) ) (!  (=> (and (= (type n$0_6@@1) RefType) (= (type n$0_6_1) RefType)) (=> (and (and (and (and (not (= n$0_6@@1 n$0_6_1)) (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) n$0_6@@1))) (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) n$0_6_1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n$0_6@@1 n$0_6_1))))
 :qid |stdinbpl.10813:25|
 :skolemid |1282|
 :pattern ( (neverTriggered155 n$0_6@@1) (neverTriggered155 n$0_6_1))
))) (=> (forall ((n$0_6@@2 T@U) (n$0_6_1@@0 T@U) ) (!  (=> (and (= (type n$0_6@@2) RefType) (= (type n$0_6_1@@0) RefType)) (=> (and (and (and (and (not (= n$0_6@@2 n$0_6_1@@0)) (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) n$0_6@@2))) (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) n$0_6_1@@0))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n$0_6@@2 n$0_6_1@@0))))
 :qid |stdinbpl.10813:25|
 :skolemid |1282|
 :pattern ( (neverTriggered155 n$0_6@@2) (neverTriggered155 n$0_6_1@@0))
)) (and (=> (= (ControlFlow 0 302) (- 0 305)) (forall ((n$0_6@@3 T@U) ) (!  (=> (and (= (type n$0_6@@3) RefType) (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) n$0_6@@3))) (>= (U_2_real (MapType1Select QPMask@35 n$0_6@@3 l)) (/ (to_real 1) (to_real 2))))
 :qid |stdinbpl.10820:25|
 :skolemid |1283|
 :pattern ( (MapType0Select PostHeap@0 n$0_6@@3 l))
 :pattern ( (MapType1Select QPMask@38 n$0_6@@3 l))
 :pattern ( (MapType0Select PostHeap@0 n$0_6@@3 l))
))) (=> (forall ((n$0_6@@4 T@U) ) (!  (=> (and (= (type n$0_6@@4) RefType) (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) n$0_6@@4))) (>= (U_2_real (MapType1Select QPMask@35 n$0_6@@4 l)) (/ (to_real 1) (to_real 2))))
 :qid |stdinbpl.10820:25|
 :skolemid |1283|
 :pattern ( (MapType0Select PostHeap@0 n$0_6@@4 l))
 :pattern ( (MapType1Select QPMask@38 n$0_6@@4 l))
 :pattern ( (MapType0Select PostHeap@0 n$0_6@@4 l))
)) (=> (and (and (forall ((n$0_6@@5 T@U) ) (!  (=> (= (type n$0_6@@5) RefType) (=> (and (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) n$0_6@@5)) (< NoPerm (/ (to_real 1) (to_real 2)))) (and (qpRange155 n$0_6@@5) (= (invRecv155 n$0_6@@5) n$0_6@@5))))
 :qid |stdinbpl.10826:30|
 :skolemid |1284|
 :pattern ( (MapType0Select PostHeap@0 n$0_6@@5 l))
 :pattern ( (MapType1Select QPMask@38 n$0_6@@5 l))
 :pattern ( (MapType0Select PostHeap@0 n$0_6@@5 l))
)) (forall ((o_3@@2 T@U) ) (!  (=> (= (type o_3@@2) RefType) (=> (and (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) (invRecv155 o_3@@2))) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange155 o_3@@2))) (= (invRecv155 o_3@@2) o_3@@2)))
 :qid |stdinbpl.10830:30|
 :skolemid |1285|
 :pattern ( (invRecv155 o_3@@2))
))) (and (forall ((o_3@@3 T@U) ) (!  (=> (= (type o_3@@3) RefType) (and (=> (and (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) (invRecv155 o_3@@3))) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange155 o_3@@3))) (and (= (invRecv155 o_3@@3) o_3@@3) (= (U_2_real (MapType1Select QPMask@38 o_3@@3 l)) (- (U_2_real (MapType1Select QPMask@35 o_3@@3 l)) (/ (to_real 1) (to_real 2)))))) (=> (not (and (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) (invRecv155 o_3@@3))) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange155 o_3@@3)))) (= (U_2_real (MapType1Select QPMask@38 o_3@@3 l)) (U_2_real (MapType1Select QPMask@35 o_3@@3 l))))))
 :qid |stdinbpl.10836:30|
 :skolemid |1286|
 :pattern ( (MapType1Select QPMask@38 o_3@@3 l))
)) (forall ((o_3@@4 T@U) (f_5@@0 T@U) ) (! (let ((B@@12 (FieldTypeInv1 (type f_5@@0))))
(let ((A@@13 (FieldTypeInv0 (type f_5@@0))))
 (=> (and (and (= (type o_3@@4) RefType) (= (type f_5@@0) (FieldType A@@13 B@@12))) (not (= f_5@@0 l))) (= (U_2_real (MapType1Select QPMask@35 o_3@@4 f_5@@0)) (U_2_real (MapType1Select QPMask@38 o_3@@4 f_5@@0))))))
 :qid |stdinbpl.10842:37|
 :skolemid |1287|
 :pattern ( (MapType1Select QPMask@38 o_3@@4 f_5@@0))
)))) (and (=> (= (ControlFlow 0 302) (- 0 304)) (forall ((n$0_7 T@U) ) (!  (=> (= (type n$0_7) RefType) (=> (and (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) n$0_7)) (dummyFunction (MapType0Select PostHeap@0 n$0_7 r_1))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.10851:25|
 :skolemid |1288|
 :pattern ( (MapType0Select PostHeap@0 n$0_7 r_1))
 :pattern ( (MapType1Select QPMask@39 n$0_7 r_1))
 :pattern ( (MapType0Select PostHeap@0 n$0_7 r_1))
))) (=> (forall ((n$0_7@@0 T@U) ) (!  (=> (= (type n$0_7@@0) RefType) (=> (and (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) n$0_7@@0)) (dummyFunction (MapType0Select PostHeap@0 n$0_7@@0 r_1))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.10851:25|
 :skolemid |1288|
 :pattern ( (MapType0Select PostHeap@0 n$0_7@@0 r_1))
 :pattern ( (MapType1Select QPMask@39 n$0_7@@0 r_1))
 :pattern ( (MapType0Select PostHeap@0 n$0_7@@0 r_1))
)) (and (=> (= (ControlFlow 0 302) (- 0 303)) (forall ((n$0_7@@1 T@U) (n$0_7_1 T@U) ) (!  (=> (and (= (type n$0_7@@1) RefType) (= (type n$0_7_1) RefType)) (=> (and (and (and (and (not (= n$0_7@@1 n$0_7_1)) (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) n$0_7@@1))) (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) n$0_7_1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n$0_7@@1 n$0_7_1))))
 :qid |stdinbpl.10858:25|
 :skolemid |1289|
 :pattern ( (neverTriggered156 n$0_7@@1) (neverTriggered156 n$0_7_1))
))) (=> (forall ((n$0_7@@2 T@U) (n$0_7_1@@0 T@U) ) (!  (=> (and (= (type n$0_7@@2) RefType) (= (type n$0_7_1@@0) RefType)) (=> (and (and (and (and (not (= n$0_7@@2 n$0_7_1@@0)) (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) n$0_7@@2))) (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) n$0_7_1@@0))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n$0_7@@2 n$0_7_1@@0))))
 :qid |stdinbpl.10858:25|
 :skolemid |1289|
 :pattern ( (neverTriggered156 n$0_7@@2) (neverTriggered156 n$0_7_1@@0))
)) (=> (= (ControlFlow 0 302) (- 0 301)) (forall ((n$0_7@@3 T@U) ) (!  (=> (and (= (type n$0_7@@3) RefType) (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) n$0_7@@3))) (>= (U_2_real (MapType1Select QPMask@38 n$0_7@@3 r_1)) (/ (to_real 1) (to_real 2))))
 :qid |stdinbpl.10865:25|
 :skolemid |1290|
 :pattern ( (MapType0Select PostHeap@0 n$0_7@@3 r_1))
 :pattern ( (MapType1Select QPMask@39 n$0_7@@3 r_1))
 :pattern ( (MapType0Select PostHeap@0 n$0_7@@3 r_1))
))))))))))))))))
(let ((anon78_correct true))
(let ((anon218_Then_correct  (=> (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) n_40)) (and (=> (= (ControlFlow 0 308) 302) anon219_Then_correct) (=> (= (ControlFlow 0 308) 299) anon78_correct)))))
(let ((anon218_Else_correct  (=> (and (not (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) n_40))) (= (ControlFlow 0 300) 299)) anon78_correct)))
(let ((anon214_Else_correct  (=> (forall ((n$12_1 T@U) ) (!  (=> (= (type n$12_1) RefType) (=> (and (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) n$12_1)) (not (= (MapType0Select PostHeap@0 n$12_1 r_1) null))) (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) (MapType0Select PostHeap@0 n$12_1 r_1)))))
 :qid |stdinbpl.10788:20|
 :skolemid |1280|
 :pattern ( (MapType2Select (|Set#Union| g0@@11 g1@@11) (MapType0Select PostHeap@0 n$12_1 r_1)))
 :pattern ( (MapType2Select (|Set#Union| g0@@11 g1@@11) n$12_1) (MapType0Select PostHeap@0 n$12_1 r_1))
)) (=> (and (state PostHeap@0 QPMask@35) (state PostHeap@0 QPMask@35)) (and (and (=> (= (ControlFlow 0 318) 317) anon217_Else_correct) (=> (= (ControlFlow 0 318) 308) anon218_Then_correct)) (=> (= (ControlFlow 0 318) 300) anon218_Else_correct))))))
(let ((anon73_correct true))
(let ((anon216_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) n$12_3)) (not (= (MapType0Select PostHeap@0 n$12_3 r_1) null)))) (= (ControlFlow 0 295) 292)) anon73_correct)))
(let ((anon216_Then_correct  (=> (and (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) n$12_3)) (not (= (MapType0Select PostHeap@0 n$12_3 r_1) null))) (and (=> (= (ControlFlow 0 293) (- 0 294)) (HasDirectPerm QPMask@35 n$12_3 r_1)) (=> (HasDirectPerm QPMask@35 n$12_3 r_1) (=> (= (ControlFlow 0 293) 292) anon73_correct))))))
(let ((anon215_Else_correct  (=> (not (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) n$12_3))) (and (=> (= (ControlFlow 0 298) 293) anon216_Then_correct) (=> (= (ControlFlow 0 298) 295) anon216_Else_correct)))))
(let ((anon215_Then_correct  (=> (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) n$12_3)) (and (=> (= (ControlFlow 0 296) (- 0 297)) (HasDirectPerm QPMask@35 n$12_3 r_1)) (=> (HasDirectPerm QPMask@35 n$12_3 r_1) (and (=> (= (ControlFlow 0 296) 293) anon216_Then_correct) (=> (= (ControlFlow 0 296) 295) anon216_Else_correct)))))))
(let ((anon211_Else_correct  (=> (forall ((n$11_1 T@U) ) (!  (=> (= (type n$11_1) RefType) (=> (and (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) n$11_1)) (not (= (MapType0Select PostHeap@0 n$11_1 l) null))) (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) (MapType0Select PostHeap@0 n$11_1 l)))))
 :qid |stdinbpl.10771:20|
 :skolemid |1279|
 :pattern ( (MapType2Select (|Set#Union| g0@@11 g1@@11) (MapType0Select PostHeap@0 n$11_1 l)))
 :pattern ( (MapType2Select (|Set#Union| g0@@11 g1@@11) n$11_1) (MapType0Select PostHeap@0 n$11_1 l))
)) (and (and (=> (= (ControlFlow 0 319) 318) anon214_Else_correct) (=> (= (ControlFlow 0 319) 296) anon215_Then_correct)) (=> (= (ControlFlow 0 319) 298) anon215_Else_correct)))))
(let ((anon67_correct true))
(let ((anon213_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) n$11_3)) (not (= (MapType0Select PostHeap@0 n$11_3 l) null)))) (= (ControlFlow 0 288) 285)) anon67_correct)))
(let ((anon213_Then_correct  (=> (and (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) n$11_3)) (not (= (MapType0Select PostHeap@0 n$11_3 l) null))) (and (=> (= (ControlFlow 0 286) (- 0 287)) (HasDirectPerm QPMask@35 n$11_3 l)) (=> (HasDirectPerm QPMask@35 n$11_3 l) (=> (= (ControlFlow 0 286) 285) anon67_correct))))))
(let ((anon212_Else_correct  (=> (not (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) n$11_3))) (and (=> (= (ControlFlow 0 291) 286) anon213_Then_correct) (=> (= (ControlFlow 0 291) 288) anon213_Else_correct)))))
(let ((anon212_Then_correct  (=> (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) n$11_3)) (and (=> (= (ControlFlow 0 289) (- 0 290)) (HasDirectPerm QPMask@35 n$11_3 l)) (=> (HasDirectPerm QPMask@35 n$11_3 l) (and (=> (= (ControlFlow 0 289) 286) anon213_Then_correct) (=> (= (ControlFlow 0 289) 288) anon213_Else_correct)))))))
(let ((anon210_Else_correct  (and (=> (= (ControlFlow 0 320) (- 0 321)) (forall ((n$10_1 T@U) (n$10_1_1 T@U) ) (!  (=> (and (= (type n$10_1) RefType) (= (type n$10_1_1) RefType)) (=> (and (and (and (and (not (= n$10_1 n$10_1_1)) (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) n$10_1))) (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) n$10_1_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$10_1 n$10_1_1))))
 :qid |stdinbpl.10726:15|
 :skolemid |1273|
 :no-pattern (type n$10_1)
 :no-pattern (type n$10_1_1)
 :no-pattern (U_2_int n$10_1)
 :no-pattern (U_2_bool n$10_1)
 :no-pattern (U_2_int n$10_1_1)
 :no-pattern (U_2_bool n$10_1_1)
))) (=> (forall ((n$10_1@@0 T@U) (n$10_1_1@@0 T@U) ) (!  (=> (and (= (type n$10_1@@0) RefType) (= (type n$10_1_1@@0) RefType)) (=> (and (and (and (and (not (= n$10_1@@0 n$10_1_1@@0)) (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) n$10_1@@0))) (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) n$10_1_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$10_1@@0 n$10_1_1@@0))))
 :qid |stdinbpl.10726:15|
 :skolemid |1273|
 :no-pattern (type n$10_1@@0)
 :no-pattern (type n$10_1_1@@0)
 :no-pattern (U_2_int n$10_1@@0)
 :no-pattern (U_2_bool n$10_1@@0)
 :no-pattern (U_2_int n$10_1_1@@0)
 :no-pattern (U_2_bool n$10_1_1@@0)
)) (=> (and (forall ((n$10_1@@1 T@U) ) (!  (=> (= (type n$10_1@@1) RefType) (=> (and (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) n$10_1@@1)) (< NoPerm FullPerm)) (and (qpRange154 n$10_1@@1) (= (invRecv154 n$10_1@@1) n$10_1@@1))))
 :qid |stdinbpl.10732:22|
 :skolemid |1274|
 :pattern ( (MapType0Select PostHeap@0 n$10_1@@1 r_1))
 :pattern ( (MapType1Select QPMask@35 n$10_1@@1 r_1))
 :pattern ( (MapType0Select PostHeap@0 n$10_1@@1 r_1))
)) (forall ((o_3@@5 T@U) ) (!  (=> (= (type o_3@@5) RefType) (=> (and (and (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) (invRecv154 o_3@@5))) (< NoPerm FullPerm)) (qpRange154 o_3@@5)) (= (invRecv154 o_3@@5) o_3@@5)))
 :qid |stdinbpl.10736:22|
 :skolemid |1275|
 :pattern ( (invRecv154 o_3@@5))
))) (=> (and (and (forall ((n$10_1@@2 T@U) ) (!  (=> (and (= (type n$10_1@@2) RefType) (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) n$10_1@@2))) (not (= n$10_1@@2 null)))
 :qid |stdinbpl.10742:22|
 :skolemid |1276|
 :pattern ( (MapType0Select PostHeap@0 n$10_1@@2 r_1))
 :pattern ( (MapType1Select QPMask@35 n$10_1@@2 r_1))
 :pattern ( (MapType0Select PostHeap@0 n$10_1@@2 r_1))
)) (forall ((o_3@@6 T@U) ) (!  (=> (= (type o_3@@6) RefType) (and (=> (and (and (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) (invRecv154 o_3@@6))) (< NoPerm FullPerm)) (qpRange154 o_3@@6)) (and (=> (< NoPerm FullPerm) (= (invRecv154 o_3@@6) o_3@@6)) (= (U_2_real (MapType1Select QPMask@35 o_3@@6 r_1)) (+ (U_2_real (MapType1Select QPMask@34 o_3@@6 r_1)) FullPerm)))) (=> (not (and (and (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) (invRecv154 o_3@@6))) (< NoPerm FullPerm)) (qpRange154 o_3@@6))) (= (U_2_real (MapType1Select QPMask@35 o_3@@6 r_1)) (U_2_real (MapType1Select QPMask@34 o_3@@6 r_1))))))
 :qid |stdinbpl.10748:22|
 :skolemid |1277|
 :pattern ( (MapType1Select QPMask@35 o_3@@6 r_1))
))) (and (forall ((o_3@@7 T@U) (f_5@@1 T@U) ) (! (let ((B@@13 (FieldTypeInv1 (type f_5@@1))))
(let ((A@@14 (FieldTypeInv0 (type f_5@@1))))
 (=> (and (and (= (type o_3@@7) RefType) (= (type f_5@@1) (FieldType A@@14 B@@13))) (not (= f_5@@1 r_1))) (= (U_2_real (MapType1Select QPMask@34 o_3@@7 f_5@@1)) (U_2_real (MapType1Select QPMask@35 o_3@@7 f_5@@1))))))
 :qid |stdinbpl.10752:29|
 :skolemid |1278|
 :pattern ( (MapType1Select QPMask@34 o_3@@7 f_5@@1))
 :pattern ( (MapType1Select QPMask@35 o_3@@7 f_5@@1))
)) (state PostHeap@0 QPMask@35))) (and (and (=> (= (ControlFlow 0 320) 319) anon211_Else_correct) (=> (= (ControlFlow 0 320) 289) anon212_Then_correct)) (=> (= (ControlFlow 0 320) 291) anon212_Else_correct))))))))
(let ((anon210_Then_correct true))
(let ((anon209_Else_correct  (and (=> (= (ControlFlow 0 322) (- 0 323)) (forall ((n$9_1 T@U) (n$9_1_1 T@U) ) (!  (=> (and (= (type n$9_1) RefType) (= (type n$9_1_1) RefType)) (=> (and (and (and (and (not (= n$9_1 n$9_1_1)) (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) n$9_1))) (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) n$9_1_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$9_1 n$9_1_1))))
 :qid |stdinbpl.10687:15|
 :skolemid |1267|
 :no-pattern (type n$9_1)
 :no-pattern (type n$9_1_1)
 :no-pattern (U_2_int n$9_1)
 :no-pattern (U_2_bool n$9_1)
 :no-pattern (U_2_int n$9_1_1)
 :no-pattern (U_2_bool n$9_1_1)
))) (=> (forall ((n$9_1@@0 T@U) (n$9_1_1@@0 T@U) ) (!  (=> (and (= (type n$9_1@@0) RefType) (= (type n$9_1_1@@0) RefType)) (=> (and (and (and (and (not (= n$9_1@@0 n$9_1_1@@0)) (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) n$9_1@@0))) (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) n$9_1_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$9_1@@0 n$9_1_1@@0))))
 :qid |stdinbpl.10687:15|
 :skolemid |1267|
 :no-pattern (type n$9_1@@0)
 :no-pattern (type n$9_1_1@@0)
 :no-pattern (U_2_int n$9_1@@0)
 :no-pattern (U_2_bool n$9_1@@0)
 :no-pattern (U_2_int n$9_1_1@@0)
 :no-pattern (U_2_bool n$9_1_1@@0)
)) (=> (and (forall ((n$9_1@@1 T@U) ) (!  (=> (= (type n$9_1@@1) RefType) (=> (and (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) n$9_1@@1)) (< NoPerm FullPerm)) (and (qpRange153 n$9_1@@1) (= (invRecv153 n$9_1@@1) n$9_1@@1))))
 :qid |stdinbpl.10693:22|
 :skolemid |1268|
 :pattern ( (MapType0Select PostHeap@0 n$9_1@@1 l))
 :pattern ( (MapType1Select QPMask@34 n$9_1@@1 l))
 :pattern ( (MapType0Select PostHeap@0 n$9_1@@1 l))
)) (forall ((o_3@@8 T@U) ) (!  (=> (= (type o_3@@8) RefType) (=> (and (and (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) (invRecv153 o_3@@8))) (< NoPerm FullPerm)) (qpRange153 o_3@@8)) (= (invRecv153 o_3@@8) o_3@@8)))
 :qid |stdinbpl.10697:22|
 :skolemid |1269|
 :pattern ( (invRecv153 o_3@@8))
))) (=> (and (and (forall ((n$9_1@@2 T@U) ) (!  (=> (and (= (type n$9_1@@2) RefType) (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) n$9_1@@2))) (not (= n$9_1@@2 null)))
 :qid |stdinbpl.10703:22|
 :skolemid |1270|
 :pattern ( (MapType0Select PostHeap@0 n$9_1@@2 l))
 :pattern ( (MapType1Select QPMask@34 n$9_1@@2 l))
 :pattern ( (MapType0Select PostHeap@0 n$9_1@@2 l))
)) (forall ((o_3@@9 T@U) ) (!  (=> (= (type o_3@@9) RefType) (and (=> (and (and (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) (invRecv153 o_3@@9))) (< NoPerm FullPerm)) (qpRange153 o_3@@9)) (and (=> (< NoPerm FullPerm) (= (invRecv153 o_3@@9) o_3@@9)) (= (U_2_real (MapType1Select QPMask@34 o_3@@9 l)) (+ (U_2_real (MapType1Select ZeroMask o_3@@9 l)) FullPerm)))) (=> (not (and (and (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) (invRecv153 o_3@@9))) (< NoPerm FullPerm)) (qpRange153 o_3@@9))) (= (U_2_real (MapType1Select QPMask@34 o_3@@9 l)) (U_2_real (MapType1Select ZeroMask o_3@@9 l))))))
 :qid |stdinbpl.10709:22|
 :skolemid |1271|
 :pattern ( (MapType1Select QPMask@34 o_3@@9 l))
))) (and (forall ((o_3@@10 T@U) (f_5@@2 T@U) ) (! (let ((B@@14 (FieldTypeInv1 (type f_5@@2))))
(let ((A@@15 (FieldTypeInv0 (type f_5@@2))))
 (=> (and (and (= (type o_3@@10) RefType) (= (type f_5@@2) (FieldType A@@15 B@@14))) (not (= f_5@@2 l))) (= (U_2_real (MapType1Select ZeroMask o_3@@10 f_5@@2)) (U_2_real (MapType1Select QPMask@34 o_3@@10 f_5@@2))))))
 :qid |stdinbpl.10713:29|
 :skolemid |1272|
 :pattern ( (MapType1Select ZeroMask o_3@@10 f_5@@2))
 :pattern ( (MapType1Select QPMask@34 o_3@@10 f_5@@2))
)) (state PostHeap@0 QPMask@34))) (and (=> (= (ControlFlow 0 322) 284) anon210_Then_correct) (=> (= (ControlFlow 0 322) 320) anon210_Else_correct))))))))
(let ((anon209_Then_correct true))
(let ((anon208_Then_correct  (=> (and (state PostHeap@0 ZeroMask) (not (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) null)))) (and (=> (= (ControlFlow 0 324) 283) anon209_Then_correct) (=> (= (ControlFlow 0 324) 322) anon209_Else_correct)))))
(let ((anon110_correct true))
(let ((anon237_Else_correct  (=> (and (not (U_2_bool (MapType2Select g1@@11 n$1_2))) (= (ControlFlow 0 267) 264)) anon110_correct)))
(let ((anon237_Then_correct  (=> (U_2_bool (MapType2Select g1@@11 n$1_2)) (and (=> (= (ControlFlow 0 265) (- 0 266)) (not (U_2_bool (MapType2Select g0@@11 n$1_2)))) (=> (not (U_2_bool (MapType2Select g0@@11 n$1_2))) (=> (= (ControlFlow 0 265) 264) anon110_correct))))))
(let ((anon236_Else_correct true))
(let ((anon234_Else_correct  (=> (forall ((n$0_9_1 T@U) ) (!  (=> (and (= (type n$0_9_1) RefType) (U_2_bool (MapType2Select g0@@11 n$0_9_1))) (not (U_2_bool (MapType2Select g1@@11 n$0_9_1))))
 :qid |stdinbpl.11675:24|
 :skolemid |1394|
 :pattern ( (MapType2Select g0@@11 n$0_9_1) (MapType2Select g1@@11 n$0_9_1))
)) (and (and (=> (= (ControlFlow 0 268) 263) anon236_Else_correct) (=> (= (ControlFlow 0 268) 265) anon237_Then_correct)) (=> (= (ControlFlow 0 268) 267) anon237_Else_correct)))))
(let ((anon106_correct true))
(let ((anon235_Else_correct  (=> (and (not (U_2_bool (MapType2Select g0@@11 n$0_8))) (= (ControlFlow 0 262) 259)) anon106_correct)))
(let ((anon235_Then_correct  (=> (U_2_bool (MapType2Select g0@@11 n$0_8)) (and (=> (= (ControlFlow 0 260) (- 0 261)) (not (U_2_bool (MapType2Select g1@@11 n$0_8)))) (=> (not (U_2_bool (MapType2Select g1@@11 n$0_8))) (=> (= (ControlFlow 0 260) 259) anon106_correct))))))
(let ((anon233_Then_correct  (and (=> (= (ControlFlow 0 269) (- 0 277)) (forall ((n_26 T@U) (n_26_1 T@U) ) (!  (=> (and (= (type n_26) RefType) (= (type n_26_1) RefType)) (=> (and (and (and (and (not (= n_26 n_26_1)) (U_2_bool (MapType2Select g0@@11 n_26))) (U_2_bool (MapType2Select g0@@11 n_26_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_26 n_26_1))))
 :qid |stdinbpl.11511:21|
 :skolemid |1370|
 :pattern ( (neverTriggered169 n_26) (neverTriggered169 n_26_1))
))) (=> (forall ((n_26@@0 T@U) (n_26_1@@0 T@U) ) (!  (=> (and (= (type n_26@@0) RefType) (= (type n_26_1@@0) RefType)) (=> (and (and (and (and (not (= n_26@@0 n_26_1@@0)) (U_2_bool (MapType2Select g0@@11 n_26@@0))) (U_2_bool (MapType2Select g0@@11 n_26_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_26@@0 n_26_1@@0))))
 :qid |stdinbpl.11511:21|
 :skolemid |1370|
 :pattern ( (neverTriggered169 n_26@@0) (neverTriggered169 n_26_1@@0))
)) (and (=> (= (ControlFlow 0 269) (- 0 276)) (forall ((n_26@@1 T@U) ) (!  (=> (and (= (type n_26@@1) RefType) (U_2_bool (MapType2Select g0@@11 n_26@@1))) (>= (U_2_real (MapType1Select QPMask@5 n_26@@1 l)) FullPerm))
 :qid |stdinbpl.11518:21|
 :skolemid |1371|
 :pattern ( (MapType0Select Heap@@23 n_26@@1 l))
 :pattern ( (MapType1Select QPMask@8 n_26@@1 l))
 :pattern ( (MapType0Select Heap@@23 n_26@@1 l))
))) (=> (forall ((n_26@@2 T@U) ) (!  (=> (and (= (type n_26@@2) RefType) (U_2_bool (MapType2Select g0@@11 n_26@@2))) (>= (U_2_real (MapType1Select QPMask@5 n_26@@2 l)) FullPerm))
 :qid |stdinbpl.11518:21|
 :skolemid |1371|
 :pattern ( (MapType0Select Heap@@23 n_26@@2 l))
 :pattern ( (MapType1Select QPMask@8 n_26@@2 l))
 :pattern ( (MapType0Select Heap@@23 n_26@@2 l))
)) (=> (and (and (forall ((n_26@@3 T@U) ) (!  (=> (= (type n_26@@3) RefType) (=> (and (U_2_bool (MapType2Select g0@@11 n_26@@3)) (< NoPerm FullPerm)) (and (qpRange169 n_26@@3) (= (invRecv169 n_26@@3) n_26@@3))))
 :qid |stdinbpl.11524:26|
 :skolemid |1372|
 :pattern ( (MapType0Select Heap@@23 n_26@@3 l))
 :pattern ( (MapType1Select QPMask@8 n_26@@3 l))
 :pattern ( (MapType0Select Heap@@23 n_26@@3 l))
)) (forall ((o_3@@11 T@U) ) (!  (=> (= (type o_3@@11) RefType) (=> (and (U_2_bool (MapType2Select g0@@11 (invRecv169 o_3@@11))) (and (< NoPerm FullPerm) (qpRange169 o_3@@11))) (= (invRecv169 o_3@@11) o_3@@11)))
 :qid |stdinbpl.11528:26|
 :skolemid |1373|
 :pattern ( (invRecv169 o_3@@11))
))) (and (forall ((o_3@@12 T@U) ) (!  (=> (= (type o_3@@12) RefType) (and (=> (and (U_2_bool (MapType2Select g0@@11 (invRecv169 o_3@@12))) (and (< NoPerm FullPerm) (qpRange169 o_3@@12))) (and (= (invRecv169 o_3@@12) o_3@@12) (= (U_2_real (MapType1Select QPMask@8 o_3@@12 l)) (- (U_2_real (MapType1Select QPMask@5 o_3@@12 l)) FullPerm)))) (=> (not (and (U_2_bool (MapType2Select g0@@11 (invRecv169 o_3@@12))) (and (< NoPerm FullPerm) (qpRange169 o_3@@12)))) (= (U_2_real (MapType1Select QPMask@8 o_3@@12 l)) (U_2_real (MapType1Select QPMask@5 o_3@@12 l))))))
 :qid |stdinbpl.11534:26|
 :skolemid |1374|
 :pattern ( (MapType1Select QPMask@8 o_3@@12 l))
)) (forall ((o_3@@13 T@U) (f_5@@3 T@U) ) (! (let ((B@@15 (FieldTypeInv1 (type f_5@@3))))
(let ((A@@16 (FieldTypeInv0 (type f_5@@3))))
 (=> (and (and (= (type o_3@@13) RefType) (= (type f_5@@3) (FieldType A@@16 B@@15))) (not (= f_5@@3 l))) (= (U_2_real (MapType1Select QPMask@5 o_3@@13 f_5@@3)) (U_2_real (MapType1Select QPMask@8 o_3@@13 f_5@@3))))))
 :qid |stdinbpl.11540:33|
 :skolemid |1375|
 :pattern ( (MapType1Select QPMask@8 o_3@@13 f_5@@3))
)))) (and (=> (= (ControlFlow 0 269) (- 0 275)) (forall ((n_27 T@U) (n_27_1 T@U) ) (!  (=> (and (= (type n_27) RefType) (= (type n_27_1) RefType)) (=> (and (and (and (and (not (= n_27 n_27_1)) (U_2_bool (MapType2Select g0@@11 n_27))) (U_2_bool (MapType2Select g0@@11 n_27_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_27 n_27_1))))
 :qid |stdinbpl.11552:21|
 :skolemid |1376|
 :pattern ( (neverTriggered170 n_27) (neverTriggered170 n_27_1))
))) (=> (forall ((n_27@@0 T@U) (n_27_1@@0 T@U) ) (!  (=> (and (= (type n_27@@0) RefType) (= (type n_27_1@@0) RefType)) (=> (and (and (and (and (not (= n_27@@0 n_27_1@@0)) (U_2_bool (MapType2Select g0@@11 n_27@@0))) (U_2_bool (MapType2Select g0@@11 n_27_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_27@@0 n_27_1@@0))))
 :qid |stdinbpl.11552:21|
 :skolemid |1376|
 :pattern ( (neverTriggered170 n_27@@0) (neverTriggered170 n_27_1@@0))
)) (and (=> (= (ControlFlow 0 269) (- 0 274)) (forall ((n_27@@1 T@U) ) (!  (=> (and (= (type n_27@@1) RefType) (U_2_bool (MapType2Select g0@@11 n_27@@1))) (>= (U_2_real (MapType1Select QPMask@8 n_27@@1 r_1)) FullPerm))
 :qid |stdinbpl.11559:21|
 :skolemid |1377|
 :pattern ( (MapType0Select Heap@@23 n_27@@1 r_1))
 :pattern ( (MapType1Select QPMask@9 n_27@@1 r_1))
 :pattern ( (MapType0Select Heap@@23 n_27@@1 r_1))
))) (=> (forall ((n_27@@2 T@U) ) (!  (=> (and (= (type n_27@@2) RefType) (U_2_bool (MapType2Select g0@@11 n_27@@2))) (>= (U_2_real (MapType1Select QPMask@8 n_27@@2 r_1)) FullPerm))
 :qid |stdinbpl.11559:21|
 :skolemid |1377|
 :pattern ( (MapType0Select Heap@@23 n_27@@2 r_1))
 :pattern ( (MapType1Select QPMask@9 n_27@@2 r_1))
 :pattern ( (MapType0Select Heap@@23 n_27@@2 r_1))
)) (=> (and (and (forall ((n_27@@3 T@U) ) (!  (=> (= (type n_27@@3) RefType) (=> (and (U_2_bool (MapType2Select g0@@11 n_27@@3)) (< NoPerm FullPerm)) (and (qpRange170 n_27@@3) (= (invRecv170 n_27@@3) n_27@@3))))
 :qid |stdinbpl.11565:26|
 :skolemid |1378|
 :pattern ( (MapType0Select Heap@@23 n_27@@3 r_1))
 :pattern ( (MapType1Select QPMask@9 n_27@@3 r_1))
 :pattern ( (MapType0Select Heap@@23 n_27@@3 r_1))
)) (forall ((o_3@@14 T@U) ) (!  (=> (= (type o_3@@14) RefType) (=> (and (U_2_bool (MapType2Select g0@@11 (invRecv170 o_3@@14))) (and (< NoPerm FullPerm) (qpRange170 o_3@@14))) (= (invRecv170 o_3@@14) o_3@@14)))
 :qid |stdinbpl.11569:26|
 :skolemid |1379|
 :pattern ( (invRecv170 o_3@@14))
))) (and (forall ((o_3@@15 T@U) ) (!  (=> (= (type o_3@@15) RefType) (and (=> (and (U_2_bool (MapType2Select g0@@11 (invRecv170 o_3@@15))) (and (< NoPerm FullPerm) (qpRange170 o_3@@15))) (and (= (invRecv170 o_3@@15) o_3@@15) (= (U_2_real (MapType1Select QPMask@9 o_3@@15 r_1)) (- (U_2_real (MapType1Select QPMask@8 o_3@@15 r_1)) FullPerm)))) (=> (not (and (U_2_bool (MapType2Select g0@@11 (invRecv170 o_3@@15))) (and (< NoPerm FullPerm) (qpRange170 o_3@@15)))) (= (U_2_real (MapType1Select QPMask@9 o_3@@15 r_1)) (U_2_real (MapType1Select QPMask@8 o_3@@15 r_1))))))
 :qid |stdinbpl.11575:26|
 :skolemid |1380|
 :pattern ( (MapType1Select QPMask@9 o_3@@15 r_1))
)) (forall ((o_3@@16 T@U) (f_5@@4 T@U) ) (! (let ((B@@16 (FieldTypeInv1 (type f_5@@4))))
(let ((A@@17 (FieldTypeInv0 (type f_5@@4))))
 (=> (and (and (= (type o_3@@16) RefType) (= (type f_5@@4) (FieldType A@@17 B@@16))) (not (= f_5@@4 r_1))) (= (U_2_real (MapType1Select QPMask@8 o_3@@16 f_5@@4)) (U_2_real (MapType1Select QPMask@9 o_3@@16 f_5@@4))))))
 :qid |stdinbpl.11581:33|
 :skolemid |1381|
 :pattern ( (MapType1Select QPMask@9 o_3@@16 f_5@@4))
)))) (and (=> (= (ControlFlow 0 269) (- 0 273)) (forall ((n_28 T@U) (n_28_1 T@U) ) (!  (=> (and (= (type n_28) RefType) (= (type n_28_1) RefType)) (=> (and (and (and (and (not (= n_28 n_28_1)) (U_2_bool (MapType2Select g1@@11 n_28))) (U_2_bool (MapType2Select g1@@11 n_28_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_28 n_28_1))))
 :qid |stdinbpl.11593:21|
 :skolemid |1382|
 :pattern ( (neverTriggered171 n_28) (neverTriggered171 n_28_1))
))) (=> (forall ((n_28@@0 T@U) (n_28_1@@0 T@U) ) (!  (=> (and (= (type n_28@@0) RefType) (= (type n_28_1@@0) RefType)) (=> (and (and (and (and (not (= n_28@@0 n_28_1@@0)) (U_2_bool (MapType2Select g1@@11 n_28@@0))) (U_2_bool (MapType2Select g1@@11 n_28_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_28@@0 n_28_1@@0))))
 :qid |stdinbpl.11593:21|
 :skolemid |1382|
 :pattern ( (neverTriggered171 n_28@@0) (neverTriggered171 n_28_1@@0))
)) (and (=> (= (ControlFlow 0 269) (- 0 272)) (forall ((n_28@@1 T@U) ) (!  (=> (and (= (type n_28@@1) RefType) (U_2_bool (MapType2Select g1@@11 n_28@@1))) (>= (U_2_real (MapType1Select QPMask@9 n_28@@1 l)) FullPerm))
 :qid |stdinbpl.11600:21|
 :skolemid |1383|
 :pattern ( (MapType0Select Heap@@23 n_28@@1 l))
 :pattern ( (MapType1Select QPMask@10 n_28@@1 l))
 :pattern ( (MapType0Select Heap@@23 n_28@@1 l))
))) (=> (forall ((n_28@@2 T@U) ) (!  (=> (and (= (type n_28@@2) RefType) (U_2_bool (MapType2Select g1@@11 n_28@@2))) (>= (U_2_real (MapType1Select QPMask@9 n_28@@2 l)) FullPerm))
 :qid |stdinbpl.11600:21|
 :skolemid |1383|
 :pattern ( (MapType0Select Heap@@23 n_28@@2 l))
 :pattern ( (MapType1Select QPMask@10 n_28@@2 l))
 :pattern ( (MapType0Select Heap@@23 n_28@@2 l))
)) (=> (and (and (forall ((n_28@@3 T@U) ) (!  (=> (= (type n_28@@3) RefType) (=> (and (U_2_bool (MapType2Select g1@@11 n_28@@3)) (< NoPerm FullPerm)) (and (qpRange171 n_28@@3) (= (invRecv171 n_28@@3) n_28@@3))))
 :qid |stdinbpl.11606:26|
 :skolemid |1384|
 :pattern ( (MapType0Select Heap@@23 n_28@@3 l))
 :pattern ( (MapType1Select QPMask@10 n_28@@3 l))
 :pattern ( (MapType0Select Heap@@23 n_28@@3 l))
)) (forall ((o_3@@17 T@U) ) (!  (=> (= (type o_3@@17) RefType) (=> (and (U_2_bool (MapType2Select g1@@11 (invRecv171 o_3@@17))) (and (< NoPerm FullPerm) (qpRange171 o_3@@17))) (= (invRecv171 o_3@@17) o_3@@17)))
 :qid |stdinbpl.11610:26|
 :skolemid |1385|
 :pattern ( (invRecv171 o_3@@17))
))) (and (forall ((o_3@@18 T@U) ) (!  (=> (= (type o_3@@18) RefType) (and (=> (and (U_2_bool (MapType2Select g1@@11 (invRecv171 o_3@@18))) (and (< NoPerm FullPerm) (qpRange171 o_3@@18))) (and (= (invRecv171 o_3@@18) o_3@@18) (= (U_2_real (MapType1Select QPMask@10 o_3@@18 l)) (- (U_2_real (MapType1Select QPMask@9 o_3@@18 l)) FullPerm)))) (=> (not (and (U_2_bool (MapType2Select g1@@11 (invRecv171 o_3@@18))) (and (< NoPerm FullPerm) (qpRange171 o_3@@18)))) (= (U_2_real (MapType1Select QPMask@10 o_3@@18 l)) (U_2_real (MapType1Select QPMask@9 o_3@@18 l))))))
 :qid |stdinbpl.11616:26|
 :skolemid |1386|
 :pattern ( (MapType1Select QPMask@10 o_3@@18 l))
)) (forall ((o_3@@19 T@U) (f_5@@5 T@U) ) (! (let ((B@@17 (FieldTypeInv1 (type f_5@@5))))
(let ((A@@18 (FieldTypeInv0 (type f_5@@5))))
 (=> (and (and (= (type o_3@@19) RefType) (= (type f_5@@5) (FieldType A@@18 B@@17))) (not (= f_5@@5 l))) (= (U_2_real (MapType1Select QPMask@9 o_3@@19 f_5@@5)) (U_2_real (MapType1Select QPMask@10 o_3@@19 f_5@@5))))))
 :qid |stdinbpl.11622:33|
 :skolemid |1387|
 :pattern ( (MapType1Select QPMask@10 o_3@@19 f_5@@5))
)))) (and (=> (= (ControlFlow 0 269) (- 0 271)) (forall ((n_29 T@U) (n_29_1 T@U) ) (!  (=> (and (= (type n_29) RefType) (= (type n_29_1) RefType)) (=> (and (and (and (and (not (= n_29 n_29_1)) (U_2_bool (MapType2Select g1@@11 n_29))) (U_2_bool (MapType2Select g1@@11 n_29_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_29 n_29_1))))
 :qid |stdinbpl.11634:21|
 :skolemid |1388|
 :pattern ( (neverTriggered172 n_29) (neverTriggered172 n_29_1))
))) (=> (forall ((n_29@@0 T@U) (n_29_1@@0 T@U) ) (!  (=> (and (= (type n_29@@0) RefType) (= (type n_29_1@@0) RefType)) (=> (and (and (and (and (not (= n_29@@0 n_29_1@@0)) (U_2_bool (MapType2Select g1@@11 n_29@@0))) (U_2_bool (MapType2Select g1@@11 n_29_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_29@@0 n_29_1@@0))))
 :qid |stdinbpl.11634:21|
 :skolemid |1388|
 :pattern ( (neverTriggered172 n_29@@0) (neverTriggered172 n_29_1@@0))
)) (and (=> (= (ControlFlow 0 269) (- 0 270)) (forall ((n_29@@1 T@U) ) (!  (=> (and (= (type n_29@@1) RefType) (U_2_bool (MapType2Select g1@@11 n_29@@1))) (>= (U_2_real (MapType1Select QPMask@10 n_29@@1 r_1)) FullPerm))
 :qid |stdinbpl.11641:21|
 :skolemid |1389|
 :pattern ( (MapType0Select Heap@@23 n_29@@1 r_1))
 :pattern ( (MapType1Select QPMask@11 n_29@@1 r_1))
 :pattern ( (MapType0Select Heap@@23 n_29@@1 r_1))
))) (=> (forall ((n_29@@2 T@U) ) (!  (=> (and (= (type n_29@@2) RefType) (U_2_bool (MapType2Select g1@@11 n_29@@2))) (>= (U_2_real (MapType1Select QPMask@10 n_29@@2 r_1)) FullPerm))
 :qid |stdinbpl.11641:21|
 :skolemid |1389|
 :pattern ( (MapType0Select Heap@@23 n_29@@2 r_1))
 :pattern ( (MapType1Select QPMask@11 n_29@@2 r_1))
 :pattern ( (MapType0Select Heap@@23 n_29@@2 r_1))
)) (=> (and (and (forall ((n_29@@3 T@U) ) (!  (=> (= (type n_29@@3) RefType) (=> (and (U_2_bool (MapType2Select g1@@11 n_29@@3)) (< NoPerm FullPerm)) (and (qpRange172 n_29@@3) (= (invRecv172 n_29@@3) n_29@@3))))
 :qid |stdinbpl.11647:26|
 :skolemid |1390|
 :pattern ( (MapType0Select Heap@@23 n_29@@3 r_1))
 :pattern ( (MapType1Select QPMask@11 n_29@@3 r_1))
 :pattern ( (MapType0Select Heap@@23 n_29@@3 r_1))
)) (forall ((o_3@@20 T@U) ) (!  (=> (= (type o_3@@20) RefType) (=> (and (U_2_bool (MapType2Select g1@@11 (invRecv172 o_3@@20))) (and (< NoPerm FullPerm) (qpRange172 o_3@@20))) (= (invRecv172 o_3@@20) o_3@@20)))
 :qid |stdinbpl.11651:26|
 :skolemid |1391|
 :pattern ( (invRecv172 o_3@@20))
))) (and (forall ((o_3@@21 T@U) ) (!  (=> (= (type o_3@@21) RefType) (and (=> (and (U_2_bool (MapType2Select g1@@11 (invRecv172 o_3@@21))) (and (< NoPerm FullPerm) (qpRange172 o_3@@21))) (and (= (invRecv172 o_3@@21) o_3@@21) (= (U_2_real (MapType1Select QPMask@11 o_3@@21 r_1)) (- (U_2_real (MapType1Select QPMask@10 o_3@@21 r_1)) FullPerm)))) (=> (not (and (U_2_bool (MapType2Select g1@@11 (invRecv172 o_3@@21))) (and (< NoPerm FullPerm) (qpRange172 o_3@@21)))) (= (U_2_real (MapType1Select QPMask@11 o_3@@21 r_1)) (U_2_real (MapType1Select QPMask@10 o_3@@21 r_1))))))
 :qid |stdinbpl.11657:26|
 :skolemid |1392|
 :pattern ( (MapType1Select QPMask@11 o_3@@21 r_1))
)) (forall ((o_3@@22 T@U) (f_5@@6 T@U) ) (! (let ((B@@18 (FieldTypeInv1 (type f_5@@6))))
(let ((A@@19 (FieldTypeInv0 (type f_5@@6))))
 (=> (and (and (= (type o_3@@22) RefType) (= (type f_5@@6) (FieldType A@@19 B@@18))) (not (= f_5@@6 r_1))) (= (U_2_real (MapType1Select QPMask@10 o_3@@22 f_5@@6)) (U_2_real (MapType1Select QPMask@11 o_3@@22 f_5@@6))))))
 :qid |stdinbpl.11663:33|
 :skolemid |1393|
 :pattern ( (MapType1Select QPMask@11 o_3@@22 f_5@@6))
)))) (and (and (=> (= (ControlFlow 0 269) 268) anon234_Else_correct) (=> (= (ControlFlow 0 269) 260) anon235_Then_correct)) (=> (= (ControlFlow 0 269) 262) anon235_Else_correct))))))))))))))))))))))))
(let ((anon120_correct true))
(let ((anon242_Else_correct  (=> (and (not (U_2_bool (MapType2Select g0@@11 n$1_4_1))) (= (ControlFlow 0 247) 244)) anon120_correct)))
(let ((anon242_Then_correct  (=> (U_2_bool (MapType2Select g0@@11 n$1_4_1)) (and (=> (= (ControlFlow 0 245) (- 0 246)) (not (U_2_bool (MapType2Select g1@@11 n$1_4_1)))) (=> (not (U_2_bool (MapType2Select g1@@11 n$1_4_1))) (=> (= (ControlFlow 0 245) 244) anon120_correct))))))
(let ((anon241_Else_correct true))
(let ((anon239_Else_correct  (=> (forall ((n$0_11_1_1 T@U) ) (!  (=> (and (= (type n$0_11_1_1) RefType) (U_2_bool (MapType2Select g1@@11 n$0_11_1_1))) (not (U_2_bool (MapType2Select g0@@11 n$0_11_1_1))))
 :qid |stdinbpl.11880:24|
 :skolemid |1420|
 :pattern ( (MapType2Select g1@@11 n$0_11_1_1) (MapType2Select g0@@11 n$0_11_1_1))
)) (and (and (=> (= (ControlFlow 0 248) 243) anon241_Else_correct) (=> (= (ControlFlow 0 248) 245) anon242_Then_correct)) (=> (= (ControlFlow 0 248) 247) anon242_Else_correct)))))
(let ((anon116_correct true))
(let ((anon240_Else_correct  (=> (and (not (U_2_bool (MapType2Select g1@@11 n$0_10))) (= (ControlFlow 0 242) 239)) anon116_correct)))
(let ((anon240_Then_correct  (=> (U_2_bool (MapType2Select g1@@11 n$0_10)) (and (=> (= (ControlFlow 0 240) (- 0 241)) (not (U_2_bool (MapType2Select g0@@11 n$0_10)))) (=> (not (U_2_bool (MapType2Select g0@@11 n$0_10))) (=> (= (ControlFlow 0 240) 239) anon116_correct))))))
(let ((anon238_Then_correct  (and (=> (= (ControlFlow 0 249) (- 0 257)) (forall ((n_30 T@U) (n_30_1 T@U) ) (!  (=> (and (= (type n_30) RefType) (= (type n_30_1) RefType)) (=> (and (and (and (and (not (= n_30 n_30_1)) (U_2_bool (MapType2Select g1@@11 n_30))) (U_2_bool (MapType2Select g1@@11 n_30_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_30 n_30_1))))
 :qid |stdinbpl.11716:21|
 :skolemid |1396|
 :pattern ( (neverTriggered173 n_30) (neverTriggered173 n_30_1))
))) (=> (forall ((n_30@@0 T@U) (n_30_1@@0 T@U) ) (!  (=> (and (= (type n_30@@0) RefType) (= (type n_30_1@@0) RefType)) (=> (and (and (and (and (not (= n_30@@0 n_30_1@@0)) (U_2_bool (MapType2Select g1@@11 n_30@@0))) (U_2_bool (MapType2Select g1@@11 n_30_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_30@@0 n_30_1@@0))))
 :qid |stdinbpl.11716:21|
 :skolemid |1396|
 :pattern ( (neverTriggered173 n_30@@0) (neverTriggered173 n_30_1@@0))
)) (and (=> (= (ControlFlow 0 249) (- 0 256)) (forall ((n_30@@1 T@U) ) (!  (=> (and (= (type n_30@@1) RefType) (U_2_bool (MapType2Select g1@@11 n_30@@1))) (>= (U_2_real (MapType1Select QPMask@5 n_30@@1 l)) FullPerm))
 :qid |stdinbpl.11723:21|
 :skolemid |1397|
 :pattern ( (MapType0Select Heap@@23 n_30@@1 l))
 :pattern ( (MapType1Select QPMask@12 n_30@@1 l))
 :pattern ( (MapType0Select Heap@@23 n_30@@1 l))
))) (=> (forall ((n_30@@2 T@U) ) (!  (=> (and (= (type n_30@@2) RefType) (U_2_bool (MapType2Select g1@@11 n_30@@2))) (>= (U_2_real (MapType1Select QPMask@5 n_30@@2 l)) FullPerm))
 :qid |stdinbpl.11723:21|
 :skolemid |1397|
 :pattern ( (MapType0Select Heap@@23 n_30@@2 l))
 :pattern ( (MapType1Select QPMask@12 n_30@@2 l))
 :pattern ( (MapType0Select Heap@@23 n_30@@2 l))
)) (=> (and (and (forall ((n_30@@3 T@U) ) (!  (=> (= (type n_30@@3) RefType) (=> (and (U_2_bool (MapType2Select g1@@11 n_30@@3)) (< NoPerm FullPerm)) (and (qpRange173 n_30@@3) (= (invRecv173 n_30@@3) n_30@@3))))
 :qid |stdinbpl.11729:26|
 :skolemid |1398|
 :pattern ( (MapType0Select Heap@@23 n_30@@3 l))
 :pattern ( (MapType1Select QPMask@12 n_30@@3 l))
 :pattern ( (MapType0Select Heap@@23 n_30@@3 l))
)) (forall ((o_3@@23 T@U) ) (!  (=> (= (type o_3@@23) RefType) (=> (and (U_2_bool (MapType2Select g1@@11 (invRecv173 o_3@@23))) (and (< NoPerm FullPerm) (qpRange173 o_3@@23))) (= (invRecv173 o_3@@23) o_3@@23)))
 :qid |stdinbpl.11733:26|
 :skolemid |1399|
 :pattern ( (invRecv173 o_3@@23))
))) (and (forall ((o_3@@24 T@U) ) (!  (=> (= (type o_3@@24) RefType) (and (=> (and (U_2_bool (MapType2Select g1@@11 (invRecv173 o_3@@24))) (and (< NoPerm FullPerm) (qpRange173 o_3@@24))) (and (= (invRecv173 o_3@@24) o_3@@24) (= (U_2_real (MapType1Select QPMask@12 o_3@@24 l)) (- (U_2_real (MapType1Select QPMask@5 o_3@@24 l)) FullPerm)))) (=> (not (and (U_2_bool (MapType2Select g1@@11 (invRecv173 o_3@@24))) (and (< NoPerm FullPerm) (qpRange173 o_3@@24)))) (= (U_2_real (MapType1Select QPMask@12 o_3@@24 l)) (U_2_real (MapType1Select QPMask@5 o_3@@24 l))))))
 :qid |stdinbpl.11739:26|
 :skolemid |1400|
 :pattern ( (MapType1Select QPMask@12 o_3@@24 l))
)) (forall ((o_3@@25 T@U) (f_5@@7 T@U) ) (! (let ((B@@19 (FieldTypeInv1 (type f_5@@7))))
(let ((A@@20 (FieldTypeInv0 (type f_5@@7))))
 (=> (and (and (= (type o_3@@25) RefType) (= (type f_5@@7) (FieldType A@@20 B@@19))) (not (= f_5@@7 l))) (= (U_2_real (MapType1Select QPMask@5 o_3@@25 f_5@@7)) (U_2_real (MapType1Select QPMask@12 o_3@@25 f_5@@7))))))
 :qid |stdinbpl.11745:33|
 :skolemid |1401|
 :pattern ( (MapType1Select QPMask@12 o_3@@25 f_5@@7))
)))) (and (=> (= (ControlFlow 0 249) (- 0 255)) (forall ((n_31 T@U) (n_31_1 T@U) ) (!  (=> (and (= (type n_31) RefType) (= (type n_31_1) RefType)) (=> (and (and (and (and (not (= n_31 n_31_1)) (U_2_bool (MapType2Select g1@@11 n_31))) (U_2_bool (MapType2Select g1@@11 n_31_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_31 n_31_1))))
 :qid |stdinbpl.11757:21|
 :skolemid |1402|
 :pattern ( (neverTriggered174 n_31) (neverTriggered174 n_31_1))
))) (=> (forall ((n_31@@0 T@U) (n_31_1@@0 T@U) ) (!  (=> (and (= (type n_31@@0) RefType) (= (type n_31_1@@0) RefType)) (=> (and (and (and (and (not (= n_31@@0 n_31_1@@0)) (U_2_bool (MapType2Select g1@@11 n_31@@0))) (U_2_bool (MapType2Select g1@@11 n_31_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_31@@0 n_31_1@@0))))
 :qid |stdinbpl.11757:21|
 :skolemid |1402|
 :pattern ( (neverTriggered174 n_31@@0) (neverTriggered174 n_31_1@@0))
)) (and (=> (= (ControlFlow 0 249) (- 0 254)) (forall ((n_31@@1 T@U) ) (!  (=> (and (= (type n_31@@1) RefType) (U_2_bool (MapType2Select g1@@11 n_31@@1))) (>= (U_2_real (MapType1Select QPMask@12 n_31@@1 r_1)) FullPerm))
 :qid |stdinbpl.11764:21|
 :skolemid |1403|
 :pattern ( (MapType0Select Heap@@23 n_31@@1 r_1))
 :pattern ( (MapType1Select QPMask@13 n_31@@1 r_1))
 :pattern ( (MapType0Select Heap@@23 n_31@@1 r_1))
))) (=> (forall ((n_31@@2 T@U) ) (!  (=> (and (= (type n_31@@2) RefType) (U_2_bool (MapType2Select g1@@11 n_31@@2))) (>= (U_2_real (MapType1Select QPMask@12 n_31@@2 r_1)) FullPerm))
 :qid |stdinbpl.11764:21|
 :skolemid |1403|
 :pattern ( (MapType0Select Heap@@23 n_31@@2 r_1))
 :pattern ( (MapType1Select QPMask@13 n_31@@2 r_1))
 :pattern ( (MapType0Select Heap@@23 n_31@@2 r_1))
)) (=> (and (and (forall ((n_31@@3 T@U) ) (!  (=> (= (type n_31@@3) RefType) (=> (and (U_2_bool (MapType2Select g1@@11 n_31@@3)) (< NoPerm FullPerm)) (and (qpRange174 n_31@@3) (= (invRecv174 n_31@@3) n_31@@3))))
 :qid |stdinbpl.11770:26|
 :skolemid |1404|
 :pattern ( (MapType0Select Heap@@23 n_31@@3 r_1))
 :pattern ( (MapType1Select QPMask@13 n_31@@3 r_1))
 :pattern ( (MapType0Select Heap@@23 n_31@@3 r_1))
)) (forall ((o_3@@26 T@U) ) (!  (=> (= (type o_3@@26) RefType) (=> (and (U_2_bool (MapType2Select g1@@11 (invRecv174 o_3@@26))) (and (< NoPerm FullPerm) (qpRange174 o_3@@26))) (= (invRecv174 o_3@@26) o_3@@26)))
 :qid |stdinbpl.11774:26|
 :skolemid |1405|
 :pattern ( (invRecv174 o_3@@26))
))) (and (forall ((o_3@@27 T@U) ) (!  (=> (= (type o_3@@27) RefType) (and (=> (and (U_2_bool (MapType2Select g1@@11 (invRecv174 o_3@@27))) (and (< NoPerm FullPerm) (qpRange174 o_3@@27))) (and (= (invRecv174 o_3@@27) o_3@@27) (= (U_2_real (MapType1Select QPMask@13 o_3@@27 r_1)) (- (U_2_real (MapType1Select QPMask@12 o_3@@27 r_1)) FullPerm)))) (=> (not (and (U_2_bool (MapType2Select g1@@11 (invRecv174 o_3@@27))) (and (< NoPerm FullPerm) (qpRange174 o_3@@27)))) (= (U_2_real (MapType1Select QPMask@13 o_3@@27 r_1)) (U_2_real (MapType1Select QPMask@12 o_3@@27 r_1))))))
 :qid |stdinbpl.11780:26|
 :skolemid |1406|
 :pattern ( (MapType1Select QPMask@13 o_3@@27 r_1))
)) (forall ((o_3@@28 T@U) (f_5@@8 T@U) ) (! (let ((B@@20 (FieldTypeInv1 (type f_5@@8))))
(let ((A@@21 (FieldTypeInv0 (type f_5@@8))))
 (=> (and (and (= (type o_3@@28) RefType) (= (type f_5@@8) (FieldType A@@21 B@@20))) (not (= f_5@@8 r_1))) (= (U_2_real (MapType1Select QPMask@12 o_3@@28 f_5@@8)) (U_2_real (MapType1Select QPMask@13 o_3@@28 f_5@@8))))))
 :qid |stdinbpl.11786:33|
 :skolemid |1407|
 :pattern ( (MapType1Select QPMask@13 o_3@@28 f_5@@8))
)))) (and (=> (= (ControlFlow 0 249) (- 0 253)) (forall ((n_32 T@U) (n_32_1 T@U) ) (!  (=> (and (= (type n_32) RefType) (= (type n_32_1) RefType)) (=> (and (and (and (and (not (= n_32 n_32_1)) (U_2_bool (MapType2Select g0@@11 n_32))) (U_2_bool (MapType2Select g0@@11 n_32_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_32 n_32_1))))
 :qid |stdinbpl.11798:21|
 :skolemid |1408|
 :pattern ( (neverTriggered175 n_32) (neverTriggered175 n_32_1))
))) (=> (forall ((n_32@@0 T@U) (n_32_1@@0 T@U) ) (!  (=> (and (= (type n_32@@0) RefType) (= (type n_32_1@@0) RefType)) (=> (and (and (and (and (not (= n_32@@0 n_32_1@@0)) (U_2_bool (MapType2Select g0@@11 n_32@@0))) (U_2_bool (MapType2Select g0@@11 n_32_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_32@@0 n_32_1@@0))))
 :qid |stdinbpl.11798:21|
 :skolemid |1408|
 :pattern ( (neverTriggered175 n_32@@0) (neverTriggered175 n_32_1@@0))
)) (and (=> (= (ControlFlow 0 249) (- 0 252)) (forall ((n_32@@1 T@U) ) (!  (=> (and (= (type n_32@@1) RefType) (U_2_bool (MapType2Select g0@@11 n_32@@1))) (>= (U_2_real (MapType1Select QPMask@13 n_32@@1 l)) FullPerm))
 :qid |stdinbpl.11805:21|
 :skolemid |1409|
 :pattern ( (MapType0Select Heap@@23 n_32@@1 l))
 :pattern ( (MapType1Select QPMask@14 n_32@@1 l))
 :pattern ( (MapType0Select Heap@@23 n_32@@1 l))
))) (=> (forall ((n_32@@2 T@U) ) (!  (=> (and (= (type n_32@@2) RefType) (U_2_bool (MapType2Select g0@@11 n_32@@2))) (>= (U_2_real (MapType1Select QPMask@13 n_32@@2 l)) FullPerm))
 :qid |stdinbpl.11805:21|
 :skolemid |1409|
 :pattern ( (MapType0Select Heap@@23 n_32@@2 l))
 :pattern ( (MapType1Select QPMask@14 n_32@@2 l))
 :pattern ( (MapType0Select Heap@@23 n_32@@2 l))
)) (=> (and (and (forall ((n_32@@3 T@U) ) (!  (=> (= (type n_32@@3) RefType) (=> (and (U_2_bool (MapType2Select g0@@11 n_32@@3)) (< NoPerm FullPerm)) (and (qpRange175 n_32@@3) (= (invRecv175 n_32@@3) n_32@@3))))
 :qid |stdinbpl.11811:26|
 :skolemid |1410|
 :pattern ( (MapType0Select Heap@@23 n_32@@3 l))
 :pattern ( (MapType1Select QPMask@14 n_32@@3 l))
 :pattern ( (MapType0Select Heap@@23 n_32@@3 l))
)) (forall ((o_3@@29 T@U) ) (!  (=> (= (type o_3@@29) RefType) (=> (and (U_2_bool (MapType2Select g0@@11 (invRecv175 o_3@@29))) (and (< NoPerm FullPerm) (qpRange175 o_3@@29))) (= (invRecv175 o_3@@29) o_3@@29)))
 :qid |stdinbpl.11815:26|
 :skolemid |1411|
 :pattern ( (invRecv175 o_3@@29))
))) (and (forall ((o_3@@30 T@U) ) (!  (=> (= (type o_3@@30) RefType) (and (=> (and (U_2_bool (MapType2Select g0@@11 (invRecv175 o_3@@30))) (and (< NoPerm FullPerm) (qpRange175 o_3@@30))) (and (= (invRecv175 o_3@@30) o_3@@30) (= (U_2_real (MapType1Select QPMask@14 o_3@@30 l)) (- (U_2_real (MapType1Select QPMask@13 o_3@@30 l)) FullPerm)))) (=> (not (and (U_2_bool (MapType2Select g0@@11 (invRecv175 o_3@@30))) (and (< NoPerm FullPerm) (qpRange175 o_3@@30)))) (= (U_2_real (MapType1Select QPMask@14 o_3@@30 l)) (U_2_real (MapType1Select QPMask@13 o_3@@30 l))))))
 :qid |stdinbpl.11821:26|
 :skolemid |1412|
 :pattern ( (MapType1Select QPMask@14 o_3@@30 l))
)) (forall ((o_3@@31 T@U) (f_5@@9 T@U) ) (! (let ((B@@21 (FieldTypeInv1 (type f_5@@9))))
(let ((A@@22 (FieldTypeInv0 (type f_5@@9))))
 (=> (and (and (= (type o_3@@31) RefType) (= (type f_5@@9) (FieldType A@@22 B@@21))) (not (= f_5@@9 l))) (= (U_2_real (MapType1Select QPMask@13 o_3@@31 f_5@@9)) (U_2_real (MapType1Select QPMask@14 o_3@@31 f_5@@9))))))
 :qid |stdinbpl.11827:33|
 :skolemid |1413|
 :pattern ( (MapType1Select QPMask@14 o_3@@31 f_5@@9))
)))) (and (=> (= (ControlFlow 0 249) (- 0 251)) (forall ((n_33 T@U) (n_33_1 T@U) ) (!  (=> (and (= (type n_33) RefType) (= (type n_33_1) RefType)) (=> (and (and (and (and (not (= n_33 n_33_1)) (U_2_bool (MapType2Select g0@@11 n_33))) (U_2_bool (MapType2Select g0@@11 n_33_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_33 n_33_1))))
 :qid |stdinbpl.11839:21|
 :skolemid |1414|
 :pattern ( (neverTriggered176 n_33) (neverTriggered176 n_33_1))
))) (=> (forall ((n_33@@0 T@U) (n_33_1@@0 T@U) ) (!  (=> (and (= (type n_33@@0) RefType) (= (type n_33_1@@0) RefType)) (=> (and (and (and (and (not (= n_33@@0 n_33_1@@0)) (U_2_bool (MapType2Select g0@@11 n_33@@0))) (U_2_bool (MapType2Select g0@@11 n_33_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_33@@0 n_33_1@@0))))
 :qid |stdinbpl.11839:21|
 :skolemid |1414|
 :pattern ( (neverTriggered176 n_33@@0) (neverTriggered176 n_33_1@@0))
)) (and (=> (= (ControlFlow 0 249) (- 0 250)) (forall ((n_33@@1 T@U) ) (!  (=> (and (= (type n_33@@1) RefType) (U_2_bool (MapType2Select g0@@11 n_33@@1))) (>= (U_2_real (MapType1Select QPMask@14 n_33@@1 r_1)) FullPerm))
 :qid |stdinbpl.11846:21|
 :skolemid |1415|
 :pattern ( (MapType0Select Heap@@23 n_33@@1 r_1))
 :pattern ( (MapType1Select QPMask@15 n_33@@1 r_1))
 :pattern ( (MapType0Select Heap@@23 n_33@@1 r_1))
))) (=> (forall ((n_33@@2 T@U) ) (!  (=> (and (= (type n_33@@2) RefType) (U_2_bool (MapType2Select g0@@11 n_33@@2))) (>= (U_2_real (MapType1Select QPMask@14 n_33@@2 r_1)) FullPerm))
 :qid |stdinbpl.11846:21|
 :skolemid |1415|
 :pattern ( (MapType0Select Heap@@23 n_33@@2 r_1))
 :pattern ( (MapType1Select QPMask@15 n_33@@2 r_1))
 :pattern ( (MapType0Select Heap@@23 n_33@@2 r_1))
)) (=> (and (and (forall ((n_33@@3 T@U) ) (!  (=> (= (type n_33@@3) RefType) (=> (and (U_2_bool (MapType2Select g0@@11 n_33@@3)) (< NoPerm FullPerm)) (and (qpRange176 n_33@@3) (= (invRecv176 n_33@@3) n_33@@3))))
 :qid |stdinbpl.11852:26|
 :skolemid |1416|
 :pattern ( (MapType0Select Heap@@23 n_33@@3 r_1))
 :pattern ( (MapType1Select QPMask@15 n_33@@3 r_1))
 :pattern ( (MapType0Select Heap@@23 n_33@@3 r_1))
)) (forall ((o_3@@32 T@U) ) (!  (=> (= (type o_3@@32) RefType) (=> (and (U_2_bool (MapType2Select g0@@11 (invRecv176 o_3@@32))) (and (< NoPerm FullPerm) (qpRange176 o_3@@32))) (= (invRecv176 o_3@@32) o_3@@32)))
 :qid |stdinbpl.11856:26|
 :skolemid |1417|
 :pattern ( (invRecv176 o_3@@32))
))) (and (forall ((o_3@@33 T@U) ) (!  (=> (= (type o_3@@33) RefType) (and (=> (and (U_2_bool (MapType2Select g0@@11 (invRecv176 o_3@@33))) (and (< NoPerm FullPerm) (qpRange176 o_3@@33))) (and (= (invRecv176 o_3@@33) o_3@@33) (= (U_2_real (MapType1Select QPMask@15 o_3@@33 r_1)) (- (U_2_real (MapType1Select QPMask@14 o_3@@33 r_1)) FullPerm)))) (=> (not (and (U_2_bool (MapType2Select g0@@11 (invRecv176 o_3@@33))) (and (< NoPerm FullPerm) (qpRange176 o_3@@33)))) (= (U_2_real (MapType1Select QPMask@15 o_3@@33 r_1)) (U_2_real (MapType1Select QPMask@14 o_3@@33 r_1))))))
 :qid |stdinbpl.11862:26|
 :skolemid |1418|
 :pattern ( (MapType1Select QPMask@15 o_3@@33 r_1))
)) (forall ((o_3@@34 T@U) (f_5@@10 T@U) ) (! (let ((B@@22 (FieldTypeInv1 (type f_5@@10))))
(let ((A@@23 (FieldTypeInv0 (type f_5@@10))))
 (=> (and (and (= (type o_3@@34) RefType) (= (type f_5@@10) (FieldType A@@23 B@@22))) (not (= f_5@@10 r_1))) (= (U_2_real (MapType1Select QPMask@14 o_3@@34 f_5@@10)) (U_2_real (MapType1Select QPMask@15 o_3@@34 f_5@@10))))))
 :qid |stdinbpl.11868:33|
 :skolemid |1419|
 :pattern ( (MapType1Select QPMask@15 o_3@@34 f_5@@10))
)))) (and (and (=> (= (ControlFlow 0 249) 248) anon239_Else_correct) (=> (= (ControlFlow 0 249) 240) anon240_Then_correct)) (=> (= (ControlFlow 0 249) 242) anon240_Else_correct))))))))))))))))))))))))
(let ((anon136_correct true))
(let ((anon250_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select arg_g@0 n$2_2_1)) (not (= (MapType0Select Heap@@23 n$2_2_1 r_1) null)))) (= (ControlFlow 0 196) 193)) anon136_correct)))
(let ((anon250_Then_correct  (=> (and (U_2_bool (MapType2Select arg_g@0 n$2_2_1)) (not (= (MapType0Select Heap@@23 n$2_2_1 r_1) null))) (and (=> (= (ControlFlow 0 194) (- 0 195)) (U_2_bool (MapType2Select arg_g@0 (MapType0Select Heap@@23 n$2_2_1 r_1)))) (=> (U_2_bool (MapType2Select arg_g@0 (MapType0Select Heap@@23 n$2_2_1 r_1))) (=> (= (ControlFlow 0 194) 193) anon136_correct))))))
(let ((anon132_correct true))
(let ((anon248_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select arg_g@0 n$1_6_1)) (not (= (MapType0Select Heap@@23 n$1_6_1 l) null)))) (= (ControlFlow 0 192) 189)) anon132_correct)))
(let ((anon248_Then_correct  (=> (and (U_2_bool (MapType2Select arg_g@0 n$1_6_1)) (not (= (MapType0Select Heap@@23 n$1_6_1 l) null))) (and (=> (= (ControlFlow 0 190) (- 0 191)) (U_2_bool (MapType2Select arg_g@0 (MapType0Select Heap@@23 n$1_6_1 l)))) (=> (U_2_bool (MapType2Select arg_g@0 (MapType0Select Heap@@23 n$1_6_1 l))) (=> (= (ControlFlow 0 190) 189) anon132_correct))))))
(let ((anon176_correct true))
(let ((anon269_Else_correct  (=> (and (not (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) n_16))) (= (ControlFlow 0 140) 137)) anon176_correct)))
(let ((anon269_Then_correct  (=> (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) n_16)) (and (=> (= (ControlFlow 0 138) (- 0 139)) (exists_path ($$ Heap@0 (|Set#Union| g0@@11 g1@@11)) x_1@@0 n_16)) (=> (exists_path ($$ Heap@0 (|Set#Union| g0@@11 g1@@11)) x_1@@0 n_16) (=> (= (ControlFlow 0 138) 137) anon176_correct))))))
(let ((anon268_Else_correct  (=> (and (forall ((n_17_1_1 T@U) ) (!  (=> (and (= (type n_17_1_1) RefType) (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) n_17_1_1))) (exists_path ($$ Heap@0 (|Set#Union| g0@@11 g1@@11)) x_1@@0 n_17_1_1))
 :qid |stdinbpl.12588:20|
 :skolemid |1504|
 :pattern ( (exists_path (|$$#frame| (CombineFrames (FrameFragment (int_2_U (|$$#condqp1| Heap@0 (|Set#Union| g0@@11 g1@@11)))) (FrameFragment (int_2_U (|$$#condqp2| Heap@0 (|Set#Union| g0@@11 g1@@11))))) (|Set#Union| g0@@11 g1@@11)) x_1@@0 n_17_1_1))
)) (= (ControlFlow 0 136) (- 0 135))) (acyclic_graph ($$ Heap@0 (|Set#Union| g0@@11 g1@@11))))))
(let ((anon266_Else_correct  (=> (forall ((n$12_3_1 T@U) ) (!  (=> (= (type n$12_3_1) RefType) (=> (and (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) n$12_3_1)) (not (= (MapType0Select Heap@0 n$12_3_1 r_1) null))) (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) (MapType0Select Heap@0 n$12_3_1 r_1)))))
 :qid |stdinbpl.12577:20|
 :skolemid |1503|
 :pattern ( (MapType2Select (|Set#Union| g0@@11 g1@@11) (MapType0Select Heap@0 n$12_3_1 r_1)))
 :pattern ( (MapType2Select (|Set#Union| g0@@11 g1@@11) n$12_3_1) (MapType0Select Heap@0 n$12_3_1 r_1))
)) (and (and (=> (= (ControlFlow 0 141) 136) anon268_Else_correct) (=> (= (ControlFlow 0 141) 138) anon269_Then_correct)) (=> (= (ControlFlow 0 141) 140) anon269_Else_correct)))))
(let ((anon172_correct true))
(let ((anon267_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) n$12_2)) (not (= (MapType0Select Heap@0 n$12_2 r_1) null)))) (= (ControlFlow 0 134) 131)) anon172_correct)))
(let ((anon267_Then_correct  (=> (and (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) n$12_2)) (not (= (MapType0Select Heap@0 n$12_2 r_1) null))) (and (=> (= (ControlFlow 0 132) (- 0 133)) (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) (MapType0Select Heap@0 n$12_2 r_1)))) (=> (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) (MapType0Select Heap@0 n$12_2 r_1))) (=> (= (ControlFlow 0 132) 131) anon172_correct))))))
(let ((anon264_Else_correct  (=> (forall ((n$11_3_1 T@U) ) (!  (=> (= (type n$11_3_1) RefType) (=> (and (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) n$11_3_1)) (not (= (MapType0Select Heap@0 n$11_3_1 l) null))) (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) (MapType0Select Heap@0 n$11_3_1 l)))))
 :qid |stdinbpl.12566:20|
 :skolemid |1502|
 :pattern ( (MapType2Select (|Set#Union| g0@@11 g1@@11) (MapType0Select Heap@0 n$11_3_1 l)))
 :pattern ( (MapType2Select (|Set#Union| g0@@11 g1@@11) n$11_3_1) (MapType0Select Heap@0 n$11_3_1 l))
)) (and (and (=> (= (ControlFlow 0 142) 141) anon266_Else_correct) (=> (= (ControlFlow 0 142) 132) anon267_Then_correct)) (=> (= (ControlFlow 0 142) 134) anon267_Else_correct)))))
(let ((anon168_correct true))
(let ((anon265_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) n$11_2)) (not (= (MapType0Select Heap@0 n$11_2 l) null)))) (= (ControlFlow 0 130) 127)) anon168_correct)))
(let ((anon265_Then_correct  (=> (and (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) n$11_2)) (not (= (MapType0Select Heap@0 n$11_2 l) null))) (and (=> (= (ControlFlow 0 128) (- 0 129)) (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) (MapType0Select Heap@0 n$11_2 l)))) (=> (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) (MapType0Select Heap@0 n$11_2 l))) (=> (= (ControlFlow 0 128) 127) anon168_correct))))))
(let ((anon165_correct  (=> (state Heap@0 Mask@8) (and (=> (= (ControlFlow 0 143) (- 0 148)) (not (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) null)))) (=> (not (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) null))) (and (=> (= (ControlFlow 0 143) (- 0 147)) (forall ((n$9_2 T@U) (n$9_2_1 T@U) ) (!  (=> (and (= (type n$9_2) RefType) (= (type n$9_2_1) RefType)) (=> (and (and (and (and (not (= n$9_2 n$9_2_1)) (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) n$9_2))) (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) n$9_2_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$9_2 n$9_2_1))))
 :qid |stdinbpl.12484:17|
 :skolemid |1490|
 :pattern ( (neverTriggered159 n$9_2) (neverTriggered159 n$9_2_1))
))) (=> (forall ((n$9_2@@0 T@U) (n$9_2_1@@0 T@U) ) (!  (=> (and (= (type n$9_2@@0) RefType) (= (type n$9_2_1@@0) RefType)) (=> (and (and (and (and (not (= n$9_2@@0 n$9_2_1@@0)) (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) n$9_2@@0))) (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) n$9_2_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$9_2@@0 n$9_2_1@@0))))
 :qid |stdinbpl.12484:17|
 :skolemid |1490|
 :pattern ( (neverTriggered159 n$9_2@@0) (neverTriggered159 n$9_2_1@@0))
)) (and (=> (= (ControlFlow 0 143) (- 0 146)) (forall ((n$9_2@@1 T@U) ) (!  (=> (and (= (type n$9_2@@1) RefType) (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) n$9_2@@1))) (>= (U_2_real (MapType1Select Mask@8 n$9_2@@1 l)) FullPerm))
 :qid |stdinbpl.12491:17|
 :skolemid |1491|
 :pattern ( (MapType0Select Heap@0 n$9_2@@1 l))
 :pattern ( (MapType1Select QPMask@24 n$9_2@@1 l))
 :pattern ( (MapType0Select Heap@0 n$9_2@@1 l))
))) (=> (forall ((n$9_2@@2 T@U) ) (!  (=> (and (= (type n$9_2@@2) RefType) (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) n$9_2@@2))) (>= (U_2_real (MapType1Select Mask@8 n$9_2@@2 l)) FullPerm))
 :qid |stdinbpl.12491:17|
 :skolemid |1491|
 :pattern ( (MapType0Select Heap@0 n$9_2@@2 l))
 :pattern ( (MapType1Select QPMask@24 n$9_2@@2 l))
 :pattern ( (MapType0Select Heap@0 n$9_2@@2 l))
)) (=> (and (and (forall ((n$9_2@@3 T@U) ) (!  (=> (= (type n$9_2@@3) RefType) (=> (and (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) n$9_2@@3)) (< NoPerm FullPerm)) (and (qpRange159 n$9_2@@3) (= (invRecv159 n$9_2@@3) n$9_2@@3))))
 :qid |stdinbpl.12497:22|
 :skolemid |1492|
 :pattern ( (MapType0Select Heap@0 n$9_2@@3 l))
 :pattern ( (MapType1Select QPMask@24 n$9_2@@3 l))
 :pattern ( (MapType0Select Heap@0 n$9_2@@3 l))
)) (forall ((o_3@@35 T@U) ) (!  (=> (= (type o_3@@35) RefType) (=> (and (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) (invRecv159 o_3@@35))) (and (< NoPerm FullPerm) (qpRange159 o_3@@35))) (= (invRecv159 o_3@@35) o_3@@35)))
 :qid |stdinbpl.12501:22|
 :skolemid |1493|
 :pattern ( (invRecv159 o_3@@35))
))) (and (forall ((o_3@@36 T@U) ) (!  (=> (= (type o_3@@36) RefType) (and (=> (and (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) (invRecv159 o_3@@36))) (and (< NoPerm FullPerm) (qpRange159 o_3@@36))) (and (= (invRecv159 o_3@@36) o_3@@36) (= (U_2_real (MapType1Select QPMask@24 o_3@@36 l)) (- (U_2_real (MapType1Select Mask@8 o_3@@36 l)) FullPerm)))) (=> (not (and (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) (invRecv159 o_3@@36))) (and (< NoPerm FullPerm) (qpRange159 o_3@@36)))) (= (U_2_real (MapType1Select QPMask@24 o_3@@36 l)) (U_2_real (MapType1Select Mask@8 o_3@@36 l))))))
 :qid |stdinbpl.12507:22|
 :skolemid |1494|
 :pattern ( (MapType1Select QPMask@24 o_3@@36 l))
)) (forall ((o_3@@37 T@U) (f_5@@11 T@U) ) (! (let ((B@@23 (FieldTypeInv1 (type f_5@@11))))
(let ((A@@24 (FieldTypeInv0 (type f_5@@11))))
 (=> (and (and (= (type o_3@@37) RefType) (= (type f_5@@11) (FieldType A@@24 B@@23))) (not (= f_5@@11 l))) (= (U_2_real (MapType1Select Mask@8 o_3@@37 f_5@@11)) (U_2_real (MapType1Select QPMask@24 o_3@@37 f_5@@11))))))
 :qid |stdinbpl.12513:29|
 :skolemid |1495|
 :pattern ( (MapType1Select QPMask@24 o_3@@37 f_5@@11))
)))) (and (=> (= (ControlFlow 0 143) (- 0 145)) (forall ((n$10_2 T@U) (n$10_2_1 T@U) ) (!  (=> (and (= (type n$10_2) RefType) (= (type n$10_2_1) RefType)) (=> (and (and (and (and (not (= n$10_2 n$10_2_1)) (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) n$10_2))) (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) n$10_2_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$10_2 n$10_2_1))))
 :qid |stdinbpl.12525:17|
 :skolemid |1496|
 :pattern ( (neverTriggered160 n$10_2) (neverTriggered160 n$10_2_1))
))) (=> (forall ((n$10_2@@0 T@U) (n$10_2_1@@0 T@U) ) (!  (=> (and (= (type n$10_2@@0) RefType) (= (type n$10_2_1@@0) RefType)) (=> (and (and (and (and (not (= n$10_2@@0 n$10_2_1@@0)) (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) n$10_2@@0))) (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) n$10_2_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$10_2@@0 n$10_2_1@@0))))
 :qid |stdinbpl.12525:17|
 :skolemid |1496|
 :pattern ( (neverTriggered160 n$10_2@@0) (neverTriggered160 n$10_2_1@@0))
)) (and (=> (= (ControlFlow 0 143) (- 0 144)) (forall ((n$10_2@@1 T@U) ) (!  (=> (and (= (type n$10_2@@1) RefType) (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) n$10_2@@1))) (>= (U_2_real (MapType1Select QPMask@24 n$10_2@@1 r_1)) FullPerm))
 :qid |stdinbpl.12532:17|
 :skolemid |1497|
 :pattern ( (MapType0Select Heap@0 n$10_2@@1 r_1))
 :pattern ( (MapType1Select QPMask@25 n$10_2@@1 r_1))
 :pattern ( (MapType0Select Heap@0 n$10_2@@1 r_1))
))) (=> (forall ((n$10_2@@2 T@U) ) (!  (=> (and (= (type n$10_2@@2) RefType) (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) n$10_2@@2))) (>= (U_2_real (MapType1Select QPMask@24 n$10_2@@2 r_1)) FullPerm))
 :qid |stdinbpl.12532:17|
 :skolemid |1497|
 :pattern ( (MapType0Select Heap@0 n$10_2@@2 r_1))
 :pattern ( (MapType1Select QPMask@25 n$10_2@@2 r_1))
 :pattern ( (MapType0Select Heap@0 n$10_2@@2 r_1))
)) (=> (and (and (forall ((n$10_2@@3 T@U) ) (!  (=> (= (type n$10_2@@3) RefType) (=> (and (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) n$10_2@@3)) (< NoPerm FullPerm)) (and (qpRange160 n$10_2@@3) (= (invRecv160 n$10_2@@3) n$10_2@@3))))
 :qid |stdinbpl.12538:22|
 :skolemid |1498|
 :pattern ( (MapType0Select Heap@0 n$10_2@@3 r_1))
 :pattern ( (MapType1Select QPMask@25 n$10_2@@3 r_1))
 :pattern ( (MapType0Select Heap@0 n$10_2@@3 r_1))
)) (forall ((o_3@@38 T@U) ) (!  (=> (= (type o_3@@38) RefType) (=> (and (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) (invRecv160 o_3@@38))) (and (< NoPerm FullPerm) (qpRange160 o_3@@38))) (= (invRecv160 o_3@@38) o_3@@38)))
 :qid |stdinbpl.12542:22|
 :skolemid |1499|
 :pattern ( (invRecv160 o_3@@38))
))) (and (forall ((o_3@@39 T@U) ) (!  (=> (= (type o_3@@39) RefType) (and (=> (and (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) (invRecv160 o_3@@39))) (and (< NoPerm FullPerm) (qpRange160 o_3@@39))) (and (= (invRecv160 o_3@@39) o_3@@39) (= (U_2_real (MapType1Select QPMask@25 o_3@@39 r_1)) (- (U_2_real (MapType1Select QPMask@24 o_3@@39 r_1)) FullPerm)))) (=> (not (and (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) (invRecv160 o_3@@39))) (and (< NoPerm FullPerm) (qpRange160 o_3@@39)))) (= (U_2_real (MapType1Select QPMask@25 o_3@@39 r_1)) (U_2_real (MapType1Select QPMask@24 o_3@@39 r_1))))))
 :qid |stdinbpl.12548:22|
 :skolemid |1500|
 :pattern ( (MapType1Select QPMask@25 o_3@@39 r_1))
)) (forall ((o_3@@40 T@U) (f_5@@12 T@U) ) (! (let ((B@@24 (FieldTypeInv1 (type f_5@@12))))
(let ((A@@25 (FieldTypeInv0 (type f_5@@12))))
 (=> (and (and (= (type o_3@@40) RefType) (= (type f_5@@12) (FieldType A@@25 B@@24))) (not (= f_5@@12 r_1))) (= (U_2_real (MapType1Select QPMask@24 o_3@@40 f_5@@12)) (U_2_real (MapType1Select QPMask@25 o_3@@40 f_5@@12))))))
 :qid |stdinbpl.12554:29|
 :skolemid |1501|
 :pattern ( (MapType1Select QPMask@25 o_3@@40 f_5@@12))
)))) (and (and (=> (= (ControlFlow 0 143) 142) anon264_Else_correct) (=> (= (ControlFlow 0 143) 128) anon265_Then_correct)) (=> (= (ControlFlow 0 143) 130) anon265_Else_correct)))))))))))))))))
(let ((anon143_correct  (=> (state ExhaleHeap@3 QPMask@23) (=> (and (and (state ExhaleHeap@3 QPMask@23) (= Mask@8 QPMask@23)) (and (= Heap@0 ExhaleHeap@3) (= (ControlFlow 0 197) 143))) anon165_correct))))
(let ((anon253_Else_correct  (=> (and (= x1@@7 null) (= (ControlFlow 0 199) 197)) anon143_correct)))
(let ((anon253_Then_correct  (=> (and (and (not (= x1@@7 null)) (state ExhaleHeap@3 QPMask@23)) (and (forall ((v1_1 T@U) (v2_1 T@U) ) (!  (=> (and (and (= (type v1_1) RefType) (= (type v2_1) RefType)) (not (= v1_1 v2_1))) (= (exists_path ($$ ExhaleHeap@3 arg_g@0) v1_1 v2_1)  (or (exists_path ($$ Heap@@23 arg_g@0) v1_1 v2_1) (and (exists_path ($$ Heap@@23 arg_g@0) v1_1 x0@@10) (exists_path ($$ Heap@@23 arg_g@0) x1@@7 v2_1)))))
 :qid |stdinbpl.12183:28|
 :skolemid |1455|
 :pattern ( (exists_path (|$$#frame| (CombineFrames (FrameFragment (int_2_U (|$$#condqp1| ExhaleHeap@3 arg_g@0))) (FrameFragment (int_2_U (|$$#condqp2| ExhaleHeap@3 arg_g@0)))) arg_g@0) v1_1 v2_1))
)) (= (ControlFlow 0 198) 197))) anon143_correct)))
(let ((anon252_Else_correct  (=> (= x1@@7 null) (and (=> (= (ControlFlow 0 201) 198) anon253_Then_correct) (=> (= (ControlFlow 0 201) 199) anon253_Else_correct)))))
(let ((anon252_Then_correct  (=> (not (= x1@@7 null)) (=> (and (state ExhaleHeap@3 QPMask@23) (forall ((v1@@2 T@U) (v2@@2 T@U) ) (!  (=> (and (= (type v1@@2) RefType) (= (type v2@@2) RefType)) (= (edge ($$ ExhaleHeap@3 arg_g@0) v1@@2 v2@@2)  (or (edge ($$ Heap@@23 arg_g@0) v1@@2 v2@@2) (and (= v1@@2 x0@@10) (= v2@@2 x1@@7)))))
 :qid |stdinbpl.12176:28|
 :skolemid |1454|
 :pattern ( (edge (|$$#frame| (CombineFrames (FrameFragment (int_2_U (|$$#condqp1| Heap@@23 arg_g@0))) (FrameFragment (int_2_U (|$$#condqp2| Heap@@23 arg_g@0)))) arg_g@0) v1@@2 v2@@2))
))) (and (=> (= (ControlFlow 0 200) 198) anon253_Then_correct) (=> (= (ControlFlow 0 200) 199) anon253_Else_correct))))))
(let ((anon251_Else_correct  (=> (not (= x1@@7 null)) (and (=> (= (ControlFlow 0 203) 200) anon252_Then_correct) (=> (= (ControlFlow 0 203) 201) anon252_Else_correct)))))
(let ((anon251_Then_correct  (=> (= x1@@7 null) (=> (and (state ExhaleHeap@3 QPMask@23) (|Set#Equal| ($$ ExhaleHeap@3 arg_g@0) ($$ Heap@@23 arg_g@0))) (and (=> (= (ControlFlow 0 202) 200) anon252_Then_correct) (=> (= (ControlFlow 0 202) 201) anon252_Else_correct))))))
(let ((anon249_Else_correct  (=> (forall ((n$2_3_1 T@U) ) (!  (=> (= (type n$2_3_1) RefType) (=> (and (U_2_bool (MapType2Select arg_g@0 n$2_3_1)) (not (= (MapType0Select Heap@@23 n$2_3_1 r_1) null))) (U_2_bool (MapType2Select arg_g@0 (MapType0Select Heap@@23 n$2_3_1 r_1)))))
 :qid |stdinbpl.12055:26|
 :skolemid |1437|
 :pattern ( (MapType2Select arg_g@0 (MapType0Select Heap@@23 n$2_3_1 r_1)))
 :pattern ( (MapType2Select arg_g@0 n$2_3_1) (MapType0Select Heap@@23 n$2_3_1 r_1))
)) (and (=> (= (ControlFlow 0 204) (- 0 211)) (= (MapType0Select Heap@@23 x0@@10 l) null)) (=> (= (MapType0Select Heap@@23 x0@@10 l) null) (=> (and (and (IdenticalOnKnownLocations Heap@@23 ExhaleHeap@3 QPMask@21) (not (U_2_bool (MapType2Select arg_g@0 null)))) (and (U_2_bool (MapType2Select arg_g@0 x0@@10)) (= perm@6 (ite (= __left__ __left__) FullPerm (/ (to_real 1) (to_real 2)))))) (and (=> (= (ControlFlow 0 204) (- 0 210)) (>= perm@6 NoPerm)) (=> (>= perm@6 NoPerm) (=> (and (and (=> (> perm@6 NoPerm) (not (= x0@@10 null))) (= Mask@6 (MapType1Store QPMask@21 x0@@10 l (real_2_U (+ (U_2_real (MapType1Select QPMask@21 x0@@10 l)) perm@6))))) (and (state ExhaleHeap@3 Mask@6) (= perm@7 (ite (= __left__ __right__) FullPerm (/ (to_real 1) (to_real 2)))))) (and (=> (= (ControlFlow 0 204) (- 0 209)) (>= perm@7 NoPerm)) (=> (>= perm@7 NoPerm) (=> (=> (> perm@7 NoPerm) (not (= x0@@10 null))) (=> (and (= Mask@7 (MapType1Store Mask@6 x0@@10 r_1 (real_2_U (+ (U_2_real (MapType1Select Mask@6 x0@@10 r_1)) perm@7)))) (state ExhaleHeap@3 Mask@7)) (and (=> (= (ControlFlow 0 204) (- 0 208)) (forall ((n$3_2 T@U) (n$3_2_1 T@U) ) (!  (=> (and (= (type n$3_2) RefType) (= (type n$3_2_1) RefType)) (=> (and (and (and (and (not (= n$3_2 n$3_2_1)) (and (U_2_bool (MapType2Select arg_g@0 n$3_2)) (not (= n$3_2 x0@@10)))) (and (U_2_bool (MapType2Select arg_g@0 n$3_2_1)) (not (= n$3_2_1 x0@@10)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n$3_2 n$3_2_1))))
 :qid |stdinbpl.12083:21|
 :skolemid |1438|
 :no-pattern (type n$3_2)
 :no-pattern (type n$3_2_1)
 :no-pattern (U_2_int n$3_2)
 :no-pattern (U_2_bool n$3_2)
 :no-pattern (U_2_int n$3_2_1)
 :no-pattern (U_2_bool n$3_2_1)
))) (=> (forall ((n$3_2@@0 T@U) (n$3_2_1@@0 T@U) ) (!  (=> (and (= (type n$3_2@@0) RefType) (= (type n$3_2_1@@0) RefType)) (=> (and (and (and (and (not (= n$3_2@@0 n$3_2_1@@0)) (and (U_2_bool (MapType2Select arg_g@0 n$3_2@@0)) (not (= n$3_2@@0 x0@@10)))) (and (U_2_bool (MapType2Select arg_g@0 n$3_2_1@@0)) (not (= n$3_2_1@@0 x0@@10)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n$3_2@@0 n$3_2_1@@0))))
 :qid |stdinbpl.12083:21|
 :skolemid |1438|
 :no-pattern (type n$3_2@@0)
 :no-pattern (type n$3_2_1@@0)
 :no-pattern (U_2_int n$3_2@@0)
 :no-pattern (U_2_bool n$3_2@@0)
 :no-pattern (U_2_int n$3_2_1@@0)
 :no-pattern (U_2_bool n$3_2_1@@0)
)) (=> (and (forall ((n$3_2@@1 T@U) ) (!  (=> (= (type n$3_2@@1) RefType) (=> (and (and (U_2_bool (MapType2Select arg_g@0 n$3_2@@1)) (not (= n$3_2@@1 x0@@10))) (< NoPerm (/ (to_real 1) (to_real 2)))) (and (qpRange179 n$3_2@@1) (= (invRecv179 n$3_2@@1) n$3_2@@1))))
 :qid |stdinbpl.12089:28|
 :skolemid |1439|
 :pattern ( (MapType0Select ExhaleHeap@3 n$3_2@@1 l))
 :pattern ( (MapType1Select QPMask@22 n$3_2@@1 l))
 :pattern ( (MapType0Select ExhaleHeap@3 n$3_2@@1 l))
)) (forall ((o_3@@41 T@U) ) (!  (=> (= (type o_3@@41) RefType) (=> (and (and (and (U_2_bool (MapType2Select arg_g@0 (invRecv179 o_3@@41))) (not (= (invRecv179 o_3@@41) x0@@10))) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange179 o_3@@41)) (= (invRecv179 o_3@@41) o_3@@41)))
 :qid |stdinbpl.12093:28|
 :skolemid |1440|
 :pattern ( (invRecv179 o_3@@41))
))) (and (=> (= (ControlFlow 0 204) (- 0 207)) (forall ((n$3_2@@2 T@U) ) (!  (=> (= (type n$3_2@@2) RefType) (=> (and (U_2_bool (MapType2Select arg_g@0 n$3_2@@2)) (not (= n$3_2@@2 x0@@10))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.12099:21|
 :skolemid |1441|
 :pattern ( (MapType0Select ExhaleHeap@3 n$3_2@@2 l))
 :pattern ( (MapType1Select QPMask@22 n$3_2@@2 l))
 :pattern ( (MapType0Select ExhaleHeap@3 n$3_2@@2 l))
))) (=> (forall ((n$3_2@@3 T@U) ) (!  (=> (= (type n$3_2@@3) RefType) (=> (and (U_2_bool (MapType2Select arg_g@0 n$3_2@@3)) (not (= n$3_2@@3 x0@@10))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.12099:21|
 :skolemid |1441|
 :pattern ( (MapType0Select ExhaleHeap@3 n$3_2@@3 l))
 :pattern ( (MapType1Select QPMask@22 n$3_2@@3 l))
 :pattern ( (MapType0Select ExhaleHeap@3 n$3_2@@3 l))
)) (=> (and (and (forall ((n$3_2@@4 T@U) ) (!  (=> (= (type n$3_2@@4) RefType) (=> (and (and (U_2_bool (MapType2Select arg_g@0 n$3_2@@4)) (not (= n$3_2@@4 x0@@10))) (> (/ (to_real 1) (to_real 2)) NoPerm)) (not (= n$3_2@@4 null))))
 :qid |stdinbpl.12105:28|
 :skolemid |1442|
 :pattern ( (MapType0Select ExhaleHeap@3 n$3_2@@4 l))
 :pattern ( (MapType1Select QPMask@22 n$3_2@@4 l))
 :pattern ( (MapType0Select ExhaleHeap@3 n$3_2@@4 l))
)) (forall ((o_3@@42 T@U) ) (!  (=> (= (type o_3@@42) RefType) (and (=> (and (and (and (U_2_bool (MapType2Select arg_g@0 (invRecv179 o_3@@42))) (not (= (invRecv179 o_3@@42) x0@@10))) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange179 o_3@@42)) (and (=> (< NoPerm (/ (to_real 1) (to_real 2))) (= (invRecv179 o_3@@42) o_3@@42)) (= (U_2_real (MapType1Select QPMask@22 o_3@@42 l)) (+ (U_2_real (MapType1Select Mask@7 o_3@@42 l)) (/ (to_real 1) (to_real 2)))))) (=> (not (and (and (and (U_2_bool (MapType2Select arg_g@0 (invRecv179 o_3@@42))) (not (= (invRecv179 o_3@@42) x0@@10))) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange179 o_3@@42))) (= (U_2_real (MapType1Select QPMask@22 o_3@@42 l)) (U_2_real (MapType1Select Mask@7 o_3@@42 l))))))
 :qid |stdinbpl.12111:28|
 :skolemid |1443|
 :pattern ( (MapType1Select QPMask@22 o_3@@42 l))
))) (and (forall ((o_3@@43 T@U) (f_5@@13 T@U) ) (! (let ((B@@25 (FieldTypeInv1 (type f_5@@13))))
(let ((A@@26 (FieldTypeInv0 (type f_5@@13))))
 (=> (and (and (= (type o_3@@43) RefType) (= (type f_5@@13) (FieldType A@@26 B@@25))) (not (= f_5@@13 l))) (= (U_2_real (MapType1Select Mask@7 o_3@@43 f_5@@13)) (U_2_real (MapType1Select QPMask@22 o_3@@43 f_5@@13))))))
 :qid |stdinbpl.12115:35|
 :skolemid |1444|
 :pattern ( (MapType1Select Mask@7 o_3@@43 f_5@@13))
 :pattern ( (MapType1Select QPMask@22 o_3@@43 f_5@@13))
)) (state ExhaleHeap@3 QPMask@22))) (and (=> (= (ControlFlow 0 204) (- 0 206)) (forall ((n$4_2 T@U) (n$4_2_1 T@U) ) (!  (=> (and (= (type n$4_2) RefType) (= (type n$4_2_1) RefType)) (=> (and (and (and (and (not (= n$4_2 n$4_2_1)) (and (U_2_bool (MapType2Select arg_g@0 n$4_2)) (not (= n$4_2 x0@@10)))) (and (U_2_bool (MapType2Select arg_g@0 n$4_2_1)) (not (= n$4_2_1 x0@@10)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n$4_2 n$4_2_1))))
 :qid |stdinbpl.12123:21|
 :skolemid |1445|
 :no-pattern (type n$4_2)
 :no-pattern (type n$4_2_1)
 :no-pattern (U_2_int n$4_2)
 :no-pattern (U_2_bool n$4_2)
 :no-pattern (U_2_int n$4_2_1)
 :no-pattern (U_2_bool n$4_2_1)
))) (=> (forall ((n$4_2@@0 T@U) (n$4_2_1@@0 T@U) ) (!  (=> (and (= (type n$4_2@@0) RefType) (= (type n$4_2_1@@0) RefType)) (=> (and (and (and (and (not (= n$4_2@@0 n$4_2_1@@0)) (and (U_2_bool (MapType2Select arg_g@0 n$4_2@@0)) (not (= n$4_2@@0 x0@@10)))) (and (U_2_bool (MapType2Select arg_g@0 n$4_2_1@@0)) (not (= n$4_2_1@@0 x0@@10)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n$4_2@@0 n$4_2_1@@0))))
 :qid |stdinbpl.12123:21|
 :skolemid |1445|
 :no-pattern (type n$4_2@@0)
 :no-pattern (type n$4_2_1@@0)
 :no-pattern (U_2_int n$4_2@@0)
 :no-pattern (U_2_bool n$4_2@@0)
 :no-pattern (U_2_int n$4_2_1@@0)
 :no-pattern (U_2_bool n$4_2_1@@0)
)) (=> (and (forall ((n$4_2@@1 T@U) ) (!  (=> (= (type n$4_2@@1) RefType) (=> (and (and (U_2_bool (MapType2Select arg_g@0 n$4_2@@1)) (not (= n$4_2@@1 x0@@10))) (< NoPerm (/ (to_real 1) (to_real 2)))) (and (qpRange180 n$4_2@@1) (= (invRecv180 n$4_2@@1) n$4_2@@1))))
 :qid |stdinbpl.12129:28|
 :skolemid |1446|
 :pattern ( (MapType0Select ExhaleHeap@3 n$4_2@@1 r_1))
 :pattern ( (MapType1Select QPMask@23 n$4_2@@1 r_1))
 :pattern ( (MapType0Select ExhaleHeap@3 n$4_2@@1 r_1))
)) (forall ((o_3@@44 T@U) ) (!  (=> (= (type o_3@@44) RefType) (=> (and (and (and (U_2_bool (MapType2Select arg_g@0 (invRecv180 o_3@@44))) (not (= (invRecv180 o_3@@44) x0@@10))) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange180 o_3@@44)) (= (invRecv180 o_3@@44) o_3@@44)))
 :qid |stdinbpl.12133:28|
 :skolemid |1447|
 :pattern ( (invRecv180 o_3@@44))
))) (and (=> (= (ControlFlow 0 204) (- 0 205)) (forall ((n$4_2@@2 T@U) ) (!  (=> (= (type n$4_2@@2) RefType) (=> (and (U_2_bool (MapType2Select arg_g@0 n$4_2@@2)) (not (= n$4_2@@2 x0@@10))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.12139:21|
 :skolemid |1448|
 :pattern ( (MapType0Select ExhaleHeap@3 n$4_2@@2 r_1))
 :pattern ( (MapType1Select QPMask@23 n$4_2@@2 r_1))
 :pattern ( (MapType0Select ExhaleHeap@3 n$4_2@@2 r_1))
))) (=> (forall ((n$4_2@@3 T@U) ) (!  (=> (= (type n$4_2@@3) RefType) (=> (and (U_2_bool (MapType2Select arg_g@0 n$4_2@@3)) (not (= n$4_2@@3 x0@@10))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.12139:21|
 :skolemid |1448|
 :pattern ( (MapType0Select ExhaleHeap@3 n$4_2@@3 r_1))
 :pattern ( (MapType1Select QPMask@23 n$4_2@@3 r_1))
 :pattern ( (MapType0Select ExhaleHeap@3 n$4_2@@3 r_1))
)) (=> (forall ((n$4_2@@4 T@U) ) (!  (=> (= (type n$4_2@@4) RefType) (=> (and (and (U_2_bool (MapType2Select arg_g@0 n$4_2@@4)) (not (= n$4_2@@4 x0@@10))) (> (/ (to_real 1) (to_real 2)) NoPerm)) (not (= n$4_2@@4 null))))
 :qid |stdinbpl.12145:28|
 :skolemid |1449|
 :pattern ( (MapType0Select ExhaleHeap@3 n$4_2@@4 r_1))
 :pattern ( (MapType1Select QPMask@23 n$4_2@@4 r_1))
 :pattern ( (MapType0Select ExhaleHeap@3 n$4_2@@4 r_1))
)) (=> (and (forall ((o_3@@45 T@U) ) (!  (=> (= (type o_3@@45) RefType) (and (=> (and (and (and (U_2_bool (MapType2Select arg_g@0 (invRecv180 o_3@@45))) (not (= (invRecv180 o_3@@45) x0@@10))) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange180 o_3@@45)) (and (=> (< NoPerm (/ (to_real 1) (to_real 2))) (= (invRecv180 o_3@@45) o_3@@45)) (= (U_2_real (MapType1Select QPMask@23 o_3@@45 r_1)) (+ (U_2_real (MapType1Select QPMask@22 o_3@@45 r_1)) (/ (to_real 1) (to_real 2)))))) (=> (not (and (and (and (U_2_bool (MapType2Select arg_g@0 (invRecv180 o_3@@45))) (not (= (invRecv180 o_3@@45) x0@@10))) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange180 o_3@@45))) (= (U_2_real (MapType1Select QPMask@23 o_3@@45 r_1)) (U_2_real (MapType1Select QPMask@22 o_3@@45 r_1))))))
 :qid |stdinbpl.12151:28|
 :skolemid |1450|
 :pattern ( (MapType1Select QPMask@23 o_3@@45 r_1))
)) (forall ((o_3@@46 T@U) (f_5@@14 T@U) ) (! (let ((B@@26 (FieldTypeInv1 (type f_5@@14))))
(let ((A@@27 (FieldTypeInv0 (type f_5@@14))))
 (=> (and (and (= (type o_3@@46) RefType) (= (type f_5@@14) (FieldType A@@27 B@@26))) (not (= f_5@@14 r_1))) (= (U_2_real (MapType1Select QPMask@22 o_3@@46 f_5@@14)) (U_2_real (MapType1Select QPMask@23 o_3@@46 f_5@@14))))))
 :qid |stdinbpl.12155:35|
 :skolemid |1451|
 :pattern ( (MapType1Select QPMask@22 o_3@@46 f_5@@14))
 :pattern ( (MapType1Select QPMask@23 o_3@@46 f_5@@14))
))) (=> (and (and (state ExhaleHeap@3 QPMask@23) (forall ((n$5_2 T@U) ) (!  (=> (= (type n$5_2) RefType) (=> (and (U_2_bool (MapType2Select arg_g@0 n$5_2)) (not (= (MapType0Select ExhaleHeap@3 n$5_2 l) null))) (U_2_bool (MapType2Select arg_g@0 (MapType0Select ExhaleHeap@3 n$5_2 l)))))
 :qid |stdinbpl.12161:26|
 :skolemid |1452|
 :pattern ( (MapType2Select arg_g@0 (MapType0Select ExhaleHeap@3 n$5_2 l)))
 :pattern ( (MapType2Select arg_g@0 n$5_2) (MapType0Select ExhaleHeap@3 n$5_2 l))
))) (and (forall ((n$6_2 T@U) ) (!  (=> (= (type n$6_2) RefType) (=> (and (U_2_bool (MapType2Select arg_g@0 n$6_2)) (not (= (MapType0Select ExhaleHeap@3 n$6_2 r_1) null))) (U_2_bool (MapType2Select arg_g@0 (MapType0Select ExhaleHeap@3 n$6_2 r_1)))))
 :qid |stdinbpl.12165:26|
 :skolemid |1453|
 :pattern ( (MapType2Select arg_g@0 (MapType0Select ExhaleHeap@3 n$6_2 r_1)))
 :pattern ( (MapType2Select arg_g@0 n$6_2) (MapType0Select ExhaleHeap@3 n$6_2 r_1))
)) (= (MapType0Select ExhaleHeap@3 x0@@10 l) x1@@7))) (and (=> (= (ControlFlow 0 204) 202) anon251_Then_correct) (=> (= (ControlFlow 0 204) 203) anon251_Else_correct)))))))))))))))))))))))))))))
(let ((anon247_Else_correct  (=> (forall ((n$1_7_1 T@U) ) (!  (=> (= (type n$1_7_1) RefType) (=> (and (U_2_bool (MapType2Select arg_g@0 n$1_7_1)) (not (= (MapType0Select Heap@@23 n$1_7_1 l) null))) (U_2_bool (MapType2Select arg_g@0 (MapType0Select Heap@@23 n$1_7_1 l)))))
 :qid |stdinbpl.12044:26|
 :skolemid |1436|
 :pattern ( (MapType2Select arg_g@0 (MapType0Select Heap@@23 n$1_7_1 l)))
 :pattern ( (MapType2Select arg_g@0 n$1_7_1) (MapType0Select Heap@@23 n$1_7_1 l))
)) (and (and (=> (= (ControlFlow 0 212) 204) anon249_Else_correct) (=> (= (ControlFlow 0 212) 194) anon250_Then_correct)) (=> (= (ControlFlow 0 212) 196) anon250_Else_correct)))))
(let ((anon129_correct  (=> (= Mask@5 (MapType1Store Mask@4 x0@@10 r_1 (real_2_U (- (U_2_real (MapType1Select Mask@4 x0@@10 r_1)) perm@5)))) (and (=> (= (ControlFlow 0 213) (- 0 219)) (forall ((n_34 T@U) ) (!  (=> (= (type n_34) RefType) (=> (and (and (U_2_bool (MapType2Select arg_g@0 n_34)) (not (= n_34 x0@@10))) (dummyFunction (MapType0Select Heap@@23 n_34 l))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.11951:23|
 :skolemid |1422|
 :pattern ( (MapType0Select Heap@@23 n_34 l))
 :pattern ( (MapType1Select QPMask@20 n_34 l))
 :pattern ( (MapType0Select Heap@@23 n_34 l))
))) (=> (forall ((n_34@@0 T@U) ) (!  (=> (= (type n_34@@0) RefType) (=> (and (and (U_2_bool (MapType2Select arg_g@0 n_34@@0)) (not (= n_34@@0 x0@@10))) (dummyFunction (MapType0Select Heap@@23 n_34@@0 l))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.11951:23|
 :skolemid |1422|
 :pattern ( (MapType0Select Heap@@23 n_34@@0 l))
 :pattern ( (MapType1Select QPMask@20 n_34@@0 l))
 :pattern ( (MapType0Select Heap@@23 n_34@@0 l))
)) (and (=> (= (ControlFlow 0 213) (- 0 218)) (forall ((n_34@@1 T@U) (n_34_1 T@U) ) (!  (=> (and (= (type n_34@@1) RefType) (= (type n_34_1) RefType)) (=> (and (and (and (and (not (= n_34@@1 n_34_1)) (and (U_2_bool (MapType2Select arg_g@0 n_34@@1)) (not (= n_34@@1 x0@@10)))) (and (U_2_bool (MapType2Select arg_g@0 n_34_1)) (not (= n_34_1 x0@@10)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_34@@1 n_34_1))))
 :qid |stdinbpl.11958:23|
 :skolemid |1423|
 :pattern ( (neverTriggered177 n_34@@1) (neverTriggered177 n_34_1))
))) (=> (forall ((n_34@@2 T@U) (n_34_1@@0 T@U) ) (!  (=> (and (= (type n_34@@2) RefType) (= (type n_34_1@@0) RefType)) (=> (and (and (and (and (not (= n_34@@2 n_34_1@@0)) (and (U_2_bool (MapType2Select arg_g@0 n_34@@2)) (not (= n_34@@2 x0@@10)))) (and (U_2_bool (MapType2Select arg_g@0 n_34_1@@0)) (not (= n_34_1@@0 x0@@10)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_34@@2 n_34_1@@0))))
 :qid |stdinbpl.11958:23|
 :skolemid |1423|
 :pattern ( (neverTriggered177 n_34@@2) (neverTriggered177 n_34_1@@0))
)) (and (=> (= (ControlFlow 0 213) (- 0 217)) (forall ((n_34@@3 T@U) ) (!  (=> (= (type n_34@@3) RefType) (=> (and (U_2_bool (MapType2Select arg_g@0 n_34@@3)) (not (= n_34@@3 x0@@10))) (>= (U_2_real (MapType1Select Mask@5 n_34@@3 l)) (/ (to_real 1) (to_real 2)))))
 :qid |stdinbpl.11965:23|
 :skolemid |1424|
 :pattern ( (MapType0Select Heap@@23 n_34@@3 l))
 :pattern ( (MapType1Select QPMask@20 n_34@@3 l))
 :pattern ( (MapType0Select Heap@@23 n_34@@3 l))
))) (=> (forall ((n_34@@4 T@U) ) (!  (=> (= (type n_34@@4) RefType) (=> (and (U_2_bool (MapType2Select arg_g@0 n_34@@4)) (not (= n_34@@4 x0@@10))) (>= (U_2_real (MapType1Select Mask@5 n_34@@4 l)) (/ (to_real 1) (to_real 2)))))
 :qid |stdinbpl.11965:23|
 :skolemid |1424|
 :pattern ( (MapType0Select Heap@@23 n_34@@4 l))
 :pattern ( (MapType1Select QPMask@20 n_34@@4 l))
 :pattern ( (MapType0Select Heap@@23 n_34@@4 l))
)) (=> (and (and (forall ((n_34@@5 T@U) ) (!  (=> (= (type n_34@@5) RefType) (=> (and (and (U_2_bool (MapType2Select arg_g@0 n_34@@5)) (not (= n_34@@5 x0@@10))) (< NoPerm (/ (to_real 1) (to_real 2)))) (and (qpRange177 n_34@@5) (= (invRecv177 n_34@@5) n_34@@5))))
 :qid |stdinbpl.11971:28|
 :skolemid |1425|
 :pattern ( (MapType0Select Heap@@23 n_34@@5 l))
 :pattern ( (MapType1Select QPMask@20 n_34@@5 l))
 :pattern ( (MapType0Select Heap@@23 n_34@@5 l))
)) (forall ((o_3@@47 T@U) ) (!  (=> (= (type o_3@@47) RefType) (=> (and (and (U_2_bool (MapType2Select arg_g@0 (invRecv177 o_3@@47))) (not (= (invRecv177 o_3@@47) x0@@10))) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange177 o_3@@47))) (= (invRecv177 o_3@@47) o_3@@47)))
 :qid |stdinbpl.11975:28|
 :skolemid |1426|
 :pattern ( (invRecv177 o_3@@47))
))) (and (forall ((o_3@@48 T@U) ) (!  (=> (= (type o_3@@48) RefType) (and (=> (and (and (U_2_bool (MapType2Select arg_g@0 (invRecv177 o_3@@48))) (not (= (invRecv177 o_3@@48) x0@@10))) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange177 o_3@@48))) (and (= (invRecv177 o_3@@48) o_3@@48) (= (U_2_real (MapType1Select QPMask@20 o_3@@48 l)) (- (U_2_real (MapType1Select Mask@5 o_3@@48 l)) (/ (to_real 1) (to_real 2)))))) (=> (not (and (and (U_2_bool (MapType2Select arg_g@0 (invRecv177 o_3@@48))) (not (= (invRecv177 o_3@@48) x0@@10))) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange177 o_3@@48)))) (= (U_2_real (MapType1Select QPMask@20 o_3@@48 l)) (U_2_real (MapType1Select Mask@5 o_3@@48 l))))))
 :qid |stdinbpl.11981:28|
 :skolemid |1427|
 :pattern ( (MapType1Select QPMask@20 o_3@@48 l))
)) (forall ((o_3@@49 T@U) (f_5@@15 T@U) ) (! (let ((B@@27 (FieldTypeInv1 (type f_5@@15))))
(let ((A@@28 (FieldTypeInv0 (type f_5@@15))))
 (=> (and (and (= (type o_3@@49) RefType) (= (type f_5@@15) (FieldType A@@28 B@@27))) (not (= f_5@@15 l))) (= (U_2_real (MapType1Select Mask@5 o_3@@49 f_5@@15)) (U_2_real (MapType1Select QPMask@20 o_3@@49 f_5@@15))))))
 :qid |stdinbpl.11987:35|
 :skolemid |1428|
 :pattern ( (MapType1Select QPMask@20 o_3@@49 f_5@@15))
)))) (and (=> (= (ControlFlow 0 213) (- 0 216)) (forall ((n$0_12 T@U) ) (!  (=> (= (type n$0_12) RefType) (=> (and (and (U_2_bool (MapType2Select arg_g@0 n$0_12)) (not (= n$0_12 x0@@10))) (dummyFunction (MapType0Select Heap@@23 n$0_12 r_1))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.11996:23|
 :skolemid |1429|
 :pattern ( (MapType0Select Heap@@23 n$0_12 r_1))
 :pattern ( (MapType1Select QPMask@21 n$0_12 r_1))
 :pattern ( (MapType0Select Heap@@23 n$0_12 r_1))
))) (=> (forall ((n$0_12@@0 T@U) ) (!  (=> (= (type n$0_12@@0) RefType) (=> (and (and (U_2_bool (MapType2Select arg_g@0 n$0_12@@0)) (not (= n$0_12@@0 x0@@10))) (dummyFunction (MapType0Select Heap@@23 n$0_12@@0 r_1))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.11996:23|
 :skolemid |1429|
 :pattern ( (MapType0Select Heap@@23 n$0_12@@0 r_1))
 :pattern ( (MapType1Select QPMask@21 n$0_12@@0 r_1))
 :pattern ( (MapType0Select Heap@@23 n$0_12@@0 r_1))
)) (and (=> (= (ControlFlow 0 213) (- 0 215)) (forall ((n$0_12@@1 T@U) (n$0_12_1 T@U) ) (!  (=> (and (= (type n$0_12@@1) RefType) (= (type n$0_12_1) RefType)) (=> (and (and (and (and (not (= n$0_12@@1 n$0_12_1)) (and (U_2_bool (MapType2Select arg_g@0 n$0_12@@1)) (not (= n$0_12@@1 x0@@10)))) (and (U_2_bool (MapType2Select arg_g@0 n$0_12_1)) (not (= n$0_12_1 x0@@10)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n$0_12@@1 n$0_12_1))))
 :qid |stdinbpl.12003:23|
 :skolemid |1430|
 :pattern ( (neverTriggered178 n$0_12@@1) (neverTriggered178 n$0_12_1))
))) (=> (forall ((n$0_12@@2 T@U) (n$0_12_1@@0 T@U) ) (!  (=> (and (= (type n$0_12@@2) RefType) (= (type n$0_12_1@@0) RefType)) (=> (and (and (and (and (not (= n$0_12@@2 n$0_12_1@@0)) (and (U_2_bool (MapType2Select arg_g@0 n$0_12@@2)) (not (= n$0_12@@2 x0@@10)))) (and (U_2_bool (MapType2Select arg_g@0 n$0_12_1@@0)) (not (= n$0_12_1@@0 x0@@10)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n$0_12@@2 n$0_12_1@@0))))
 :qid |stdinbpl.12003:23|
 :skolemid |1430|
 :pattern ( (neverTriggered178 n$0_12@@2) (neverTriggered178 n$0_12_1@@0))
)) (and (=> (= (ControlFlow 0 213) (- 0 214)) (forall ((n$0_12@@3 T@U) ) (!  (=> (= (type n$0_12@@3) RefType) (=> (and (U_2_bool (MapType2Select arg_g@0 n$0_12@@3)) (not (= n$0_12@@3 x0@@10))) (>= (U_2_real (MapType1Select QPMask@20 n$0_12@@3 r_1)) (/ (to_real 1) (to_real 2)))))
 :qid |stdinbpl.12010:23|
 :skolemid |1431|
 :pattern ( (MapType0Select Heap@@23 n$0_12@@3 r_1))
 :pattern ( (MapType1Select QPMask@21 n$0_12@@3 r_1))
 :pattern ( (MapType0Select Heap@@23 n$0_12@@3 r_1))
))) (=> (forall ((n$0_12@@4 T@U) ) (!  (=> (= (type n$0_12@@4) RefType) (=> (and (U_2_bool (MapType2Select arg_g@0 n$0_12@@4)) (not (= n$0_12@@4 x0@@10))) (>= (U_2_real (MapType1Select QPMask@20 n$0_12@@4 r_1)) (/ (to_real 1) (to_real 2)))))
 :qid |stdinbpl.12010:23|
 :skolemid |1431|
 :pattern ( (MapType0Select Heap@@23 n$0_12@@4 r_1))
 :pattern ( (MapType1Select QPMask@21 n$0_12@@4 r_1))
 :pattern ( (MapType0Select Heap@@23 n$0_12@@4 r_1))
)) (=> (and (and (forall ((n$0_12@@5 T@U) ) (!  (=> (= (type n$0_12@@5) RefType) (=> (and (and (U_2_bool (MapType2Select arg_g@0 n$0_12@@5)) (not (= n$0_12@@5 x0@@10))) (< NoPerm (/ (to_real 1) (to_real 2)))) (and (qpRange178 n$0_12@@5) (= (invRecv178 n$0_12@@5) n$0_12@@5))))
 :qid |stdinbpl.12016:28|
 :skolemid |1432|
 :pattern ( (MapType0Select Heap@@23 n$0_12@@5 r_1))
 :pattern ( (MapType1Select QPMask@21 n$0_12@@5 r_1))
 :pattern ( (MapType0Select Heap@@23 n$0_12@@5 r_1))
)) (forall ((o_3@@50 T@U) ) (!  (=> (= (type o_3@@50) RefType) (=> (and (and (U_2_bool (MapType2Select arg_g@0 (invRecv178 o_3@@50))) (not (= (invRecv178 o_3@@50) x0@@10))) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange178 o_3@@50))) (= (invRecv178 o_3@@50) o_3@@50)))
 :qid |stdinbpl.12020:28|
 :skolemid |1433|
 :pattern ( (invRecv178 o_3@@50))
))) (and (forall ((o_3@@51 T@U) ) (!  (=> (= (type o_3@@51) RefType) (and (=> (and (and (U_2_bool (MapType2Select arg_g@0 (invRecv178 o_3@@51))) (not (= (invRecv178 o_3@@51) x0@@10))) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange178 o_3@@51))) (and (= (invRecv178 o_3@@51) o_3@@51) (= (U_2_real (MapType1Select QPMask@21 o_3@@51 r_1)) (- (U_2_real (MapType1Select QPMask@20 o_3@@51 r_1)) (/ (to_real 1) (to_real 2)))))) (=> (not (and (and (U_2_bool (MapType2Select arg_g@0 (invRecv178 o_3@@51))) (not (= (invRecv178 o_3@@51) x0@@10))) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange178 o_3@@51)))) (= (U_2_real (MapType1Select QPMask@21 o_3@@51 r_1)) (U_2_real (MapType1Select QPMask@20 o_3@@51 r_1))))))
 :qid |stdinbpl.12026:28|
 :skolemid |1434|
 :pattern ( (MapType1Select QPMask@21 o_3@@51 r_1))
)) (forall ((o_3@@52 T@U) (f_5@@16 T@U) ) (! (let ((B@@28 (FieldTypeInv1 (type f_5@@16))))
(let ((A@@29 (FieldTypeInv0 (type f_5@@16))))
 (=> (and (and (= (type o_3@@52) RefType) (= (type f_5@@16) (FieldType A@@29 B@@28))) (not (= f_5@@16 r_1))) (= (U_2_real (MapType1Select QPMask@20 o_3@@52 f_5@@16)) (U_2_real (MapType1Select QPMask@21 o_3@@52 f_5@@16))))))
 :qid |stdinbpl.12032:35|
 :skolemid |1435|
 :pattern ( (MapType1Select QPMask@21 o_3@@52 f_5@@16))
)))) (and (and (=> (= (ControlFlow 0 213) 212) anon247_Else_correct) (=> (= (ControlFlow 0 213) 190) anon248_Then_correct)) (=> (= (ControlFlow 0 213) 192) anon248_Else_correct)))))))))))))))))))
(let ((anon246_Else_correct  (=> (and (= perm@5 NoPerm) (= (ControlFlow 0 222) 213)) anon129_correct)))
(let ((anon246_Then_correct  (=> (not (= perm@5 NoPerm)) (and (=> (= (ControlFlow 0 220) (- 0 221)) (<= perm@5 (U_2_real (MapType1Select Mask@4 x0@@10 r_1)))) (=> (<= perm@5 (U_2_real (MapType1Select Mask@4 x0@@10 r_1))) (=> (= (ControlFlow 0 220) 213) anon129_correct))))))
(let ((anon127_correct  (=> (and (= Mask@4 (MapType1Store QPMask@5 x0@@10 l (real_2_U (- (U_2_real (MapType1Select QPMask@5 x0@@10 l)) perm@4)))) (= perm@5 (ite (= __left__ __right__) FullPerm (/ (to_real 1) (to_real 2))))) (and (=> (= (ControlFlow 0 223) (- 0 224)) (>= perm@5 NoPerm)) (=> (>= perm@5 NoPerm) (and (=> (= (ControlFlow 0 223) 220) anon246_Then_correct) (=> (= (ControlFlow 0 223) 222) anon246_Else_correct)))))))
(let ((anon245_Else_correct  (=> (and (= perm@4 NoPerm) (= (ControlFlow 0 227) 223)) anon127_correct)))
(let ((anon245_Then_correct  (=> (not (= perm@4 NoPerm)) (and (=> (= (ControlFlow 0 225) (- 0 226)) (<= perm@4 (U_2_real (MapType1Select QPMask@5 x0@@10 l)))) (=> (<= perm@4 (U_2_real (MapType1Select QPMask@5 x0@@10 l))) (=> (= (ControlFlow 0 225) 223) anon127_correct))))))
(let ((anon125_correct  (and (=> (= (ControlFlow 0 228) (- 0 231)) (not (U_2_bool (MapType2Select arg_g@0 null)))) (=> (not (U_2_bool (MapType2Select arg_g@0 null))) (and (=> (= (ControlFlow 0 228) (- 0 230)) (U_2_bool (MapType2Select arg_g@0 x0@@10))) (=> (U_2_bool (MapType2Select arg_g@0 x0@@10)) (=> (= perm@4 (ite (= __left__ __left__) FullPerm (/ (to_real 1) (to_real 2)))) (and (=> (= (ControlFlow 0 228) (- 0 229)) (>= perm@4 NoPerm)) (=> (>= perm@4 NoPerm) (and (=> (= (ControlFlow 0 228) 225) anon245_Then_correct) (=> (= (ControlFlow 0 228) 227) anon245_Else_correct)))))))))))
(let ((anon244_Else_correct  (=> (and (= x1@@7 null) (= (ControlFlow 0 234) 228)) anon125_correct)))
(let ((anon244_Then_correct  (=> (not (= x1@@7 null)) (and (=> (= (ControlFlow 0 232) (- 0 233)) (U_2_bool (MapType2Select arg_g@0 x1@@7))) (=> (U_2_bool (MapType2Select arg_g@0 x1@@7)) (=> (= (ControlFlow 0 232) 228) anon125_correct))))))
(let ((anon243_Then_correct  (=> (and (= (MapType0Select Heap@@23 x0@@10 l) null) (= arg_g@0 (|Set#Union| g0@@11 g1@@11))) (and (=> (= (ControlFlow 0 235) (- 0 236)) (U_2_bool (MapType2Select arg_g@0 x0@@10))) (=> (U_2_bool (MapType2Select arg_g@0 x0@@10)) (and (=> (= (ControlFlow 0 235) 232) anon244_Then_correct) (=> (= (ControlFlow 0 235) 234) anon244_Else_correct)))))))
(let ((anon164_correct  (=> (state ExhaleHeap@2 QPMask@19) (=> (and (and (state ExhaleHeap@2 QPMask@19) (= Mask@8 QPMask@19)) (and (= Heap@0 ExhaleHeap@2) (= (ControlFlow 0 149) 143))) anon165_correct))))
(let ((anon263_Else_correct  (=> (and (= x1@@7 null) (= (ControlFlow 0 151) 149)) anon164_correct)))
(let ((anon263_Then_correct  (=> (and (and (not (= x1@@7 null)) (state ExhaleHeap@2 QPMask@19)) (and (forall ((v1_3 T@U) (v2_3 T@U) ) (!  (=> (and (and (= (type v1_3) RefType) (= (type v2_3) RefType)) (not (= v1_3 v2_3))) (= (exists_path ($$ ExhaleHeap@2 arg_g_1@0) v1_3 v2_3)  (or (exists_path ($$ Heap@@23 arg_g_1@0) v1_3 v2_3) (and (exists_path ($$ Heap@@23 arg_g_1@0) v1_3 x0@@10) (exists_path ($$ Heap@@23 arg_g_1@0) x1@@7 v2_3)))))
 :qid |stdinbpl.12462:28|
 :skolemid |1489|
 :pattern ( (exists_path (|$$#frame| (CombineFrames (FrameFragment (int_2_U (|$$#condqp1| ExhaleHeap@2 arg_g_1@0))) (FrameFragment (int_2_U (|$$#condqp2| ExhaleHeap@2 arg_g_1@0)))) arg_g_1@0) v1_3 v2_3))
)) (= (ControlFlow 0 150) 149))) anon164_correct)))
(let ((anon262_Else_correct  (=> (= x1@@7 null) (and (=> (= (ControlFlow 0 153) 150) anon263_Then_correct) (=> (= (ControlFlow 0 153) 151) anon263_Else_correct)))))
(let ((anon262_Then_correct  (=> (not (= x1@@7 null)) (=> (and (state ExhaleHeap@2 QPMask@19) (forall ((v1_2_1 T@U) (v2_2_1 T@U) ) (!  (=> (and (= (type v1_2_1) RefType) (= (type v2_2_1) RefType)) (= (edge ($$ ExhaleHeap@2 arg_g_1@0) v1_2_1 v2_2_1)  (or (edge ($$ Heap@@23 arg_g_1@0) v1_2_1 v2_2_1) (and (= v1_2_1 x0@@10) (= v2_2_1 x1@@7)))))
 :qid |stdinbpl.12455:28|
 :skolemid |1488|
 :pattern ( (edge (|$$#frame| (CombineFrames (FrameFragment (int_2_U (|$$#condqp1| Heap@@23 arg_g_1@0))) (FrameFragment (int_2_U (|$$#condqp2| Heap@@23 arg_g_1@0)))) arg_g_1@0) v1_2_1 v2_2_1))
))) (and (=> (= (ControlFlow 0 152) 150) anon263_Then_correct) (=> (= (ControlFlow 0 152) 151) anon263_Else_correct))))))
(let ((anon261_Else_correct  (=> (not (= x1@@7 null)) (and (=> (= (ControlFlow 0 155) 152) anon262_Then_correct) (=> (= (ControlFlow 0 155) 153) anon262_Else_correct)))))
(let ((anon261_Then_correct  (=> (= x1@@7 null) (=> (and (state ExhaleHeap@2 QPMask@19) (|Set#Equal| ($$ ExhaleHeap@2 arg_g_1@0) ($$ Heap@@23 arg_g_1@0))) (and (=> (= (ControlFlow 0 154) 152) anon262_Then_correct) (=> (= (ControlFlow 0 154) 153) anon262_Else_correct))))))
(let ((anon259_Else_correct  (=> (forall ((n$2_5_1 T@U) ) (!  (=> (= (type n$2_5_1) RefType) (=> (and (U_2_bool (MapType2Select arg_g_1@0 n$2_5_1)) (not (= (MapType0Select Heap@@23 n$2_5_1 r_1) null))) (U_2_bool (MapType2Select arg_g_1@0 (MapType0Select Heap@@23 n$2_5_1 r_1)))))
 :qid |stdinbpl.12334:26|
 :skolemid |1471|
 :pattern ( (MapType2Select arg_g_1@0 (MapType0Select Heap@@23 n$2_5_1 r_1)))
 :pattern ( (MapType2Select arg_g_1@0 n$2_5_1) (MapType0Select Heap@@23 n$2_5_1 r_1))
)) (and (=> (= (ControlFlow 0 156) (- 0 163)) (= (MapType0Select Heap@@23 x0@@10 r_1) null)) (=> (= (MapType0Select Heap@@23 x0@@10 r_1) null) (=> (and (and (IdenticalOnKnownLocations Heap@@23 ExhaleHeap@2 QPMask@17) (not (U_2_bool (MapType2Select arg_g_1@0 null)))) (and (U_2_bool (MapType2Select arg_g_1@0 x0@@10)) (= perm@2 (ite (= __right__ __left__) FullPerm (/ (to_real 1) (to_real 2)))))) (and (=> (= (ControlFlow 0 156) (- 0 162)) (>= perm@2 NoPerm)) (=> (>= perm@2 NoPerm) (=> (and (and (=> (> perm@2 NoPerm) (not (= x0@@10 null))) (= Mask@2 (MapType1Store QPMask@17 x0@@10 l (real_2_U (+ (U_2_real (MapType1Select QPMask@17 x0@@10 l)) perm@2))))) (and (state ExhaleHeap@2 Mask@2) (= perm@3 (ite (= __right__ __right__) FullPerm (/ (to_real 1) (to_real 2)))))) (and (=> (= (ControlFlow 0 156) (- 0 161)) (>= perm@3 NoPerm)) (=> (>= perm@3 NoPerm) (=> (=> (> perm@3 NoPerm) (not (= x0@@10 null))) (=> (and (= Mask@3 (MapType1Store Mask@2 x0@@10 r_1 (real_2_U (+ (U_2_real (MapType1Select Mask@2 x0@@10 r_1)) perm@3)))) (state ExhaleHeap@2 Mask@3)) (and (=> (= (ControlFlow 0 156) (- 0 160)) (forall ((n$3_3 T@U) (n$3_3_1 T@U) ) (!  (=> (and (= (type n$3_3) RefType) (= (type n$3_3_1) RefType)) (=> (and (and (and (and (not (= n$3_3 n$3_3_1)) (and (U_2_bool (MapType2Select arg_g_1@0 n$3_3)) (not (= n$3_3 x0@@10)))) (and (U_2_bool (MapType2Select arg_g_1@0 n$3_3_1)) (not (= n$3_3_1 x0@@10)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n$3_3 n$3_3_1))))
 :qid |stdinbpl.12362:21|
 :skolemid |1472|
 :no-pattern (type n$3_3)
 :no-pattern (type n$3_3_1)
 :no-pattern (U_2_int n$3_3)
 :no-pattern (U_2_bool n$3_3)
 :no-pattern (U_2_int n$3_3_1)
 :no-pattern (U_2_bool n$3_3_1)
))) (=> (forall ((n$3_3@@0 T@U) (n$3_3_1@@0 T@U) ) (!  (=> (and (= (type n$3_3@@0) RefType) (= (type n$3_3_1@@0) RefType)) (=> (and (and (and (and (not (= n$3_3@@0 n$3_3_1@@0)) (and (U_2_bool (MapType2Select arg_g_1@0 n$3_3@@0)) (not (= n$3_3@@0 x0@@10)))) (and (U_2_bool (MapType2Select arg_g_1@0 n$3_3_1@@0)) (not (= n$3_3_1@@0 x0@@10)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n$3_3@@0 n$3_3_1@@0))))
 :qid |stdinbpl.12362:21|
 :skolemid |1472|
 :no-pattern (type n$3_3@@0)
 :no-pattern (type n$3_3_1@@0)
 :no-pattern (U_2_int n$3_3@@0)
 :no-pattern (U_2_bool n$3_3@@0)
 :no-pattern (U_2_int n$3_3_1@@0)
 :no-pattern (U_2_bool n$3_3_1@@0)
)) (=> (and (forall ((n$3_3@@1 T@U) ) (!  (=> (= (type n$3_3@@1) RefType) (=> (and (and (U_2_bool (MapType2Select arg_g_1@0 n$3_3@@1)) (not (= n$3_3@@1 x0@@10))) (< NoPerm (/ (to_real 1) (to_real 2)))) (and (qpRange183 n$3_3@@1) (= (invRecv183 n$3_3@@1) n$3_3@@1))))
 :qid |stdinbpl.12368:28|
 :skolemid |1473|
 :pattern ( (MapType0Select ExhaleHeap@2 n$3_3@@1 l))
 :pattern ( (MapType1Select QPMask@18 n$3_3@@1 l))
 :pattern ( (MapType0Select ExhaleHeap@2 n$3_3@@1 l))
)) (forall ((o_3@@53 T@U) ) (!  (=> (= (type o_3@@53) RefType) (=> (and (and (and (U_2_bool (MapType2Select arg_g_1@0 (invRecv183 o_3@@53))) (not (= (invRecv183 o_3@@53) x0@@10))) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange183 o_3@@53)) (= (invRecv183 o_3@@53) o_3@@53)))
 :qid |stdinbpl.12372:28|
 :skolemid |1474|
 :pattern ( (invRecv183 o_3@@53))
))) (and (=> (= (ControlFlow 0 156) (- 0 159)) (forall ((n$3_3@@2 T@U) ) (!  (=> (= (type n$3_3@@2) RefType) (=> (and (U_2_bool (MapType2Select arg_g_1@0 n$3_3@@2)) (not (= n$3_3@@2 x0@@10))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.12378:21|
 :skolemid |1475|
 :pattern ( (MapType0Select ExhaleHeap@2 n$3_3@@2 l))
 :pattern ( (MapType1Select QPMask@18 n$3_3@@2 l))
 :pattern ( (MapType0Select ExhaleHeap@2 n$3_3@@2 l))
))) (=> (forall ((n$3_3@@3 T@U) ) (!  (=> (= (type n$3_3@@3) RefType) (=> (and (U_2_bool (MapType2Select arg_g_1@0 n$3_3@@3)) (not (= n$3_3@@3 x0@@10))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.12378:21|
 :skolemid |1475|
 :pattern ( (MapType0Select ExhaleHeap@2 n$3_3@@3 l))
 :pattern ( (MapType1Select QPMask@18 n$3_3@@3 l))
 :pattern ( (MapType0Select ExhaleHeap@2 n$3_3@@3 l))
)) (=> (and (and (forall ((n$3_3@@4 T@U) ) (!  (=> (= (type n$3_3@@4) RefType) (=> (and (and (U_2_bool (MapType2Select arg_g_1@0 n$3_3@@4)) (not (= n$3_3@@4 x0@@10))) (> (/ (to_real 1) (to_real 2)) NoPerm)) (not (= n$3_3@@4 null))))
 :qid |stdinbpl.12384:28|
 :skolemid |1476|
 :pattern ( (MapType0Select ExhaleHeap@2 n$3_3@@4 l))
 :pattern ( (MapType1Select QPMask@18 n$3_3@@4 l))
 :pattern ( (MapType0Select ExhaleHeap@2 n$3_3@@4 l))
)) (forall ((o_3@@54 T@U) ) (!  (=> (= (type o_3@@54) RefType) (and (=> (and (and (and (U_2_bool (MapType2Select arg_g_1@0 (invRecv183 o_3@@54))) (not (= (invRecv183 o_3@@54) x0@@10))) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange183 o_3@@54)) (and (=> (< NoPerm (/ (to_real 1) (to_real 2))) (= (invRecv183 o_3@@54) o_3@@54)) (= (U_2_real (MapType1Select QPMask@18 o_3@@54 l)) (+ (U_2_real (MapType1Select Mask@3 o_3@@54 l)) (/ (to_real 1) (to_real 2)))))) (=> (not (and (and (and (U_2_bool (MapType2Select arg_g_1@0 (invRecv183 o_3@@54))) (not (= (invRecv183 o_3@@54) x0@@10))) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange183 o_3@@54))) (= (U_2_real (MapType1Select QPMask@18 o_3@@54 l)) (U_2_real (MapType1Select Mask@3 o_3@@54 l))))))
 :qid |stdinbpl.12390:28|
 :skolemid |1477|
 :pattern ( (MapType1Select QPMask@18 o_3@@54 l))
))) (and (forall ((o_3@@55 T@U) (f_5@@17 T@U) ) (! (let ((B@@29 (FieldTypeInv1 (type f_5@@17))))
(let ((A@@30 (FieldTypeInv0 (type f_5@@17))))
 (=> (and (and (= (type o_3@@55) RefType) (= (type f_5@@17) (FieldType A@@30 B@@29))) (not (= f_5@@17 l))) (= (U_2_real (MapType1Select Mask@3 o_3@@55 f_5@@17)) (U_2_real (MapType1Select QPMask@18 o_3@@55 f_5@@17))))))
 :qid |stdinbpl.12394:35|
 :skolemid |1478|
 :pattern ( (MapType1Select Mask@3 o_3@@55 f_5@@17))
 :pattern ( (MapType1Select QPMask@18 o_3@@55 f_5@@17))
)) (state ExhaleHeap@2 QPMask@18))) (and (=> (= (ControlFlow 0 156) (- 0 158)) (forall ((n$4_3 T@U) (n$4_3_1 T@U) ) (!  (=> (and (= (type n$4_3) RefType) (= (type n$4_3_1) RefType)) (=> (and (and (and (and (not (= n$4_3 n$4_3_1)) (and (U_2_bool (MapType2Select arg_g_1@0 n$4_3)) (not (= n$4_3 x0@@10)))) (and (U_2_bool (MapType2Select arg_g_1@0 n$4_3_1)) (not (= n$4_3_1 x0@@10)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n$4_3 n$4_3_1))))
 :qid |stdinbpl.12402:21|
 :skolemid |1479|
 :no-pattern (type n$4_3)
 :no-pattern (type n$4_3_1)
 :no-pattern (U_2_int n$4_3)
 :no-pattern (U_2_bool n$4_3)
 :no-pattern (U_2_int n$4_3_1)
 :no-pattern (U_2_bool n$4_3_1)
))) (=> (forall ((n$4_3@@0 T@U) (n$4_3_1@@0 T@U) ) (!  (=> (and (= (type n$4_3@@0) RefType) (= (type n$4_3_1@@0) RefType)) (=> (and (and (and (and (not (= n$4_3@@0 n$4_3_1@@0)) (and (U_2_bool (MapType2Select arg_g_1@0 n$4_3@@0)) (not (= n$4_3@@0 x0@@10)))) (and (U_2_bool (MapType2Select arg_g_1@0 n$4_3_1@@0)) (not (= n$4_3_1@@0 x0@@10)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n$4_3@@0 n$4_3_1@@0))))
 :qid |stdinbpl.12402:21|
 :skolemid |1479|
 :no-pattern (type n$4_3@@0)
 :no-pattern (type n$4_3_1@@0)
 :no-pattern (U_2_int n$4_3@@0)
 :no-pattern (U_2_bool n$4_3@@0)
 :no-pattern (U_2_int n$4_3_1@@0)
 :no-pattern (U_2_bool n$4_3_1@@0)
)) (=> (and (forall ((n$4_3@@1 T@U) ) (!  (=> (= (type n$4_3@@1) RefType) (=> (and (and (U_2_bool (MapType2Select arg_g_1@0 n$4_3@@1)) (not (= n$4_3@@1 x0@@10))) (< NoPerm (/ (to_real 1) (to_real 2)))) (and (qpRange184 n$4_3@@1) (= (invRecv184 n$4_3@@1) n$4_3@@1))))
 :qid |stdinbpl.12408:28|
 :skolemid |1480|
 :pattern ( (MapType0Select ExhaleHeap@2 n$4_3@@1 r_1))
 :pattern ( (MapType1Select QPMask@19 n$4_3@@1 r_1))
 :pattern ( (MapType0Select ExhaleHeap@2 n$4_3@@1 r_1))
)) (forall ((o_3@@56 T@U) ) (!  (=> (= (type o_3@@56) RefType) (=> (and (and (and (U_2_bool (MapType2Select arg_g_1@0 (invRecv184 o_3@@56))) (not (= (invRecv184 o_3@@56) x0@@10))) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange184 o_3@@56)) (= (invRecv184 o_3@@56) o_3@@56)))
 :qid |stdinbpl.12412:28|
 :skolemid |1481|
 :pattern ( (invRecv184 o_3@@56))
))) (and (=> (= (ControlFlow 0 156) (- 0 157)) (forall ((n$4_3@@2 T@U) ) (!  (=> (= (type n$4_3@@2) RefType) (=> (and (U_2_bool (MapType2Select arg_g_1@0 n$4_3@@2)) (not (= n$4_3@@2 x0@@10))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.12418:21|
 :skolemid |1482|
 :pattern ( (MapType0Select ExhaleHeap@2 n$4_3@@2 r_1))
 :pattern ( (MapType1Select QPMask@19 n$4_3@@2 r_1))
 :pattern ( (MapType0Select ExhaleHeap@2 n$4_3@@2 r_1))
))) (=> (forall ((n$4_3@@3 T@U) ) (!  (=> (= (type n$4_3@@3) RefType) (=> (and (U_2_bool (MapType2Select arg_g_1@0 n$4_3@@3)) (not (= n$4_3@@3 x0@@10))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.12418:21|
 :skolemid |1482|
 :pattern ( (MapType0Select ExhaleHeap@2 n$4_3@@3 r_1))
 :pattern ( (MapType1Select QPMask@19 n$4_3@@3 r_1))
 :pattern ( (MapType0Select ExhaleHeap@2 n$4_3@@3 r_1))
)) (=> (forall ((n$4_3@@4 T@U) ) (!  (=> (= (type n$4_3@@4) RefType) (=> (and (and (U_2_bool (MapType2Select arg_g_1@0 n$4_3@@4)) (not (= n$4_3@@4 x0@@10))) (> (/ (to_real 1) (to_real 2)) NoPerm)) (not (= n$4_3@@4 null))))
 :qid |stdinbpl.12424:28|
 :skolemid |1483|
 :pattern ( (MapType0Select ExhaleHeap@2 n$4_3@@4 r_1))
 :pattern ( (MapType1Select QPMask@19 n$4_3@@4 r_1))
 :pattern ( (MapType0Select ExhaleHeap@2 n$4_3@@4 r_1))
)) (=> (and (forall ((o_3@@57 T@U) ) (!  (=> (= (type o_3@@57) RefType) (and (=> (and (and (and (U_2_bool (MapType2Select arg_g_1@0 (invRecv184 o_3@@57))) (not (= (invRecv184 o_3@@57) x0@@10))) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange184 o_3@@57)) (and (=> (< NoPerm (/ (to_real 1) (to_real 2))) (= (invRecv184 o_3@@57) o_3@@57)) (= (U_2_real (MapType1Select QPMask@19 o_3@@57 r_1)) (+ (U_2_real (MapType1Select QPMask@18 o_3@@57 r_1)) (/ (to_real 1) (to_real 2)))))) (=> (not (and (and (and (U_2_bool (MapType2Select arg_g_1@0 (invRecv184 o_3@@57))) (not (= (invRecv184 o_3@@57) x0@@10))) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange184 o_3@@57))) (= (U_2_real (MapType1Select QPMask@19 o_3@@57 r_1)) (U_2_real (MapType1Select QPMask@18 o_3@@57 r_1))))))
 :qid |stdinbpl.12430:28|
 :skolemid |1484|
 :pattern ( (MapType1Select QPMask@19 o_3@@57 r_1))
)) (forall ((o_3@@58 T@U) (f_5@@18 T@U) ) (! (let ((B@@30 (FieldTypeInv1 (type f_5@@18))))
(let ((A@@31 (FieldTypeInv0 (type f_5@@18))))
 (=> (and (and (= (type o_3@@58) RefType) (= (type f_5@@18) (FieldType A@@31 B@@30))) (not (= f_5@@18 r_1))) (= (U_2_real (MapType1Select QPMask@18 o_3@@58 f_5@@18)) (U_2_real (MapType1Select QPMask@19 o_3@@58 f_5@@18))))))
 :qid |stdinbpl.12434:35|
 :skolemid |1485|
 :pattern ( (MapType1Select QPMask@18 o_3@@58 f_5@@18))
 :pattern ( (MapType1Select QPMask@19 o_3@@58 f_5@@18))
))) (=> (and (and (state ExhaleHeap@2 QPMask@19) (forall ((n$5_3_2 T@U) ) (!  (=> (= (type n$5_3_2) RefType) (=> (and (U_2_bool (MapType2Select arg_g_1@0 n$5_3_2)) (not (= (MapType0Select ExhaleHeap@2 n$5_3_2 l) null))) (U_2_bool (MapType2Select arg_g_1@0 (MapType0Select ExhaleHeap@2 n$5_3_2 l)))))
 :qid |stdinbpl.12440:26|
 :skolemid |1486|
 :pattern ( (MapType2Select arg_g_1@0 (MapType0Select ExhaleHeap@2 n$5_3_2 l)))
 :pattern ( (MapType2Select arg_g_1@0 n$5_3_2) (MapType0Select ExhaleHeap@2 n$5_3_2 l))
))) (and (forall ((n$6_3_2 T@U) ) (!  (=> (= (type n$6_3_2) RefType) (=> (and (U_2_bool (MapType2Select arg_g_1@0 n$6_3_2)) (not (= (MapType0Select ExhaleHeap@2 n$6_3_2 r_1) null))) (U_2_bool (MapType2Select arg_g_1@0 (MapType0Select ExhaleHeap@2 n$6_3_2 r_1)))))
 :qid |stdinbpl.12444:26|
 :skolemid |1487|
 :pattern ( (MapType2Select arg_g_1@0 (MapType0Select ExhaleHeap@2 n$6_3_2 r_1)))
 :pattern ( (MapType2Select arg_g_1@0 n$6_3_2) (MapType0Select ExhaleHeap@2 n$6_3_2 r_1))
)) (= (MapType0Select ExhaleHeap@2 x0@@10 r_1) x1@@7))) (and (=> (= (ControlFlow 0 156) 154) anon261_Then_correct) (=> (= (ControlFlow 0 156) 155) anon261_Else_correct)))))))))))))))))))))))))))))
(let ((anon157_correct true))
(let ((anon260_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select arg_g_1@0 n$2_4_1)) (not (= (MapType0Select Heap@@23 n$2_4_1 r_1) null)))) (= (ControlFlow 0 126) 123)) anon157_correct)))
(let ((anon260_Then_correct  (=> (and (U_2_bool (MapType2Select arg_g_1@0 n$2_4_1)) (not (= (MapType0Select Heap@@23 n$2_4_1 r_1) null))) (and (=> (= (ControlFlow 0 124) (- 0 125)) (U_2_bool (MapType2Select arg_g_1@0 (MapType0Select Heap@@23 n$2_4_1 r_1)))) (=> (U_2_bool (MapType2Select arg_g_1@0 (MapType0Select Heap@@23 n$2_4_1 r_1))) (=> (= (ControlFlow 0 124) 123) anon157_correct))))))
(let ((anon257_Else_correct  (=> (forall ((n$1_9_1 T@U) ) (!  (=> (= (type n$1_9_1) RefType) (=> (and (U_2_bool (MapType2Select arg_g_1@0 n$1_9_1)) (not (= (MapType0Select Heap@@23 n$1_9_1 l) null))) (U_2_bool (MapType2Select arg_g_1@0 (MapType0Select Heap@@23 n$1_9_1 l)))))
 :qid |stdinbpl.12323:26|
 :skolemid |1470|
 :pattern ( (MapType2Select arg_g_1@0 (MapType0Select Heap@@23 n$1_9_1 l)))
 :pattern ( (MapType2Select arg_g_1@0 n$1_9_1) (MapType0Select Heap@@23 n$1_9_1 l))
)) (and (and (=> (= (ControlFlow 0 164) 156) anon259_Else_correct) (=> (= (ControlFlow 0 164) 124) anon260_Then_correct)) (=> (= (ControlFlow 0 164) 126) anon260_Else_correct)))))
(let ((anon153_correct true))
(let ((anon258_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select arg_g_1@0 n$1_8)) (not (= (MapType0Select Heap@@23 n$1_8 l) null)))) (= (ControlFlow 0 122) 119)) anon153_correct)))
(let ((anon258_Then_correct  (=> (and (U_2_bool (MapType2Select arg_g_1@0 n$1_8)) (not (= (MapType0Select Heap@@23 n$1_8 l) null))) (and (=> (= (ControlFlow 0 120) (- 0 121)) (U_2_bool (MapType2Select arg_g_1@0 (MapType0Select Heap@@23 n$1_8 l)))) (=> (U_2_bool (MapType2Select arg_g_1@0 (MapType0Select Heap@@23 n$1_8 l))) (=> (= (ControlFlow 0 120) 119) anon153_correct))))))
(let ((anon150_correct  (=> (= Mask@1 (MapType1Store Mask@0 x0@@10 r_1 (real_2_U (- (U_2_real (MapType1Select Mask@0 x0@@10 r_1)) perm@1)))) (and (=> (= (ControlFlow 0 165) (- 0 171)) (forall ((n_35 T@U) ) (!  (=> (= (type n_35) RefType) (=> (and (and (U_2_bool (MapType2Select arg_g_1@0 n_35)) (not (= n_35 x0@@10))) (dummyFunction (MapType0Select Heap@@23 n_35 l))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.12230:23|
 :skolemid |1456|
 :pattern ( (MapType0Select Heap@@23 n_35 l))
 :pattern ( (MapType1Select QPMask@16 n_35 l))
 :pattern ( (MapType0Select Heap@@23 n_35 l))
))) (=> (forall ((n_35@@0 T@U) ) (!  (=> (= (type n_35@@0) RefType) (=> (and (and (U_2_bool (MapType2Select arg_g_1@0 n_35@@0)) (not (= n_35@@0 x0@@10))) (dummyFunction (MapType0Select Heap@@23 n_35@@0 l))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.12230:23|
 :skolemid |1456|
 :pattern ( (MapType0Select Heap@@23 n_35@@0 l))
 :pattern ( (MapType1Select QPMask@16 n_35@@0 l))
 :pattern ( (MapType0Select Heap@@23 n_35@@0 l))
)) (and (=> (= (ControlFlow 0 165) (- 0 170)) (forall ((n_35@@1 T@U) (n_35_1 T@U) ) (!  (=> (and (= (type n_35@@1) RefType) (= (type n_35_1) RefType)) (=> (and (and (and (and (not (= n_35@@1 n_35_1)) (and (U_2_bool (MapType2Select arg_g_1@0 n_35@@1)) (not (= n_35@@1 x0@@10)))) (and (U_2_bool (MapType2Select arg_g_1@0 n_35_1)) (not (= n_35_1 x0@@10)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_35@@1 n_35_1))))
 :qid |stdinbpl.12237:23|
 :skolemid |1457|
 :pattern ( (neverTriggered181 n_35@@1) (neverTriggered181 n_35_1))
))) (=> (forall ((n_35@@2 T@U) (n_35_1@@0 T@U) ) (!  (=> (and (= (type n_35@@2) RefType) (= (type n_35_1@@0) RefType)) (=> (and (and (and (and (not (= n_35@@2 n_35_1@@0)) (and (U_2_bool (MapType2Select arg_g_1@0 n_35@@2)) (not (= n_35@@2 x0@@10)))) (and (U_2_bool (MapType2Select arg_g_1@0 n_35_1@@0)) (not (= n_35_1@@0 x0@@10)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_35@@2 n_35_1@@0))))
 :qid |stdinbpl.12237:23|
 :skolemid |1457|
 :pattern ( (neverTriggered181 n_35@@2) (neverTriggered181 n_35_1@@0))
)) (and (=> (= (ControlFlow 0 165) (- 0 169)) (forall ((n_35@@3 T@U) ) (!  (=> (= (type n_35@@3) RefType) (=> (and (U_2_bool (MapType2Select arg_g_1@0 n_35@@3)) (not (= n_35@@3 x0@@10))) (>= (U_2_real (MapType1Select Mask@1 n_35@@3 l)) (/ (to_real 1) (to_real 2)))))
 :qid |stdinbpl.12244:23|
 :skolemid |1458|
 :pattern ( (MapType0Select Heap@@23 n_35@@3 l))
 :pattern ( (MapType1Select QPMask@16 n_35@@3 l))
 :pattern ( (MapType0Select Heap@@23 n_35@@3 l))
))) (=> (forall ((n_35@@4 T@U) ) (!  (=> (= (type n_35@@4) RefType) (=> (and (U_2_bool (MapType2Select arg_g_1@0 n_35@@4)) (not (= n_35@@4 x0@@10))) (>= (U_2_real (MapType1Select Mask@1 n_35@@4 l)) (/ (to_real 1) (to_real 2)))))
 :qid |stdinbpl.12244:23|
 :skolemid |1458|
 :pattern ( (MapType0Select Heap@@23 n_35@@4 l))
 :pattern ( (MapType1Select QPMask@16 n_35@@4 l))
 :pattern ( (MapType0Select Heap@@23 n_35@@4 l))
)) (=> (and (and (forall ((n_35@@5 T@U) ) (!  (=> (= (type n_35@@5) RefType) (=> (and (and (U_2_bool (MapType2Select arg_g_1@0 n_35@@5)) (not (= n_35@@5 x0@@10))) (< NoPerm (/ (to_real 1) (to_real 2)))) (and (qpRange181 n_35@@5) (= (invRecv181 n_35@@5) n_35@@5))))
 :qid |stdinbpl.12250:28|
 :skolemid |1459|
 :pattern ( (MapType0Select Heap@@23 n_35@@5 l))
 :pattern ( (MapType1Select QPMask@16 n_35@@5 l))
 :pattern ( (MapType0Select Heap@@23 n_35@@5 l))
)) (forall ((o_3@@59 T@U) ) (!  (=> (= (type o_3@@59) RefType) (=> (and (and (U_2_bool (MapType2Select arg_g_1@0 (invRecv181 o_3@@59))) (not (= (invRecv181 o_3@@59) x0@@10))) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange181 o_3@@59))) (= (invRecv181 o_3@@59) o_3@@59)))
 :qid |stdinbpl.12254:28|
 :skolemid |1460|
 :pattern ( (invRecv181 o_3@@59))
))) (and (forall ((o_3@@60 T@U) ) (!  (=> (= (type o_3@@60) RefType) (and (=> (and (and (U_2_bool (MapType2Select arg_g_1@0 (invRecv181 o_3@@60))) (not (= (invRecv181 o_3@@60) x0@@10))) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange181 o_3@@60))) (and (= (invRecv181 o_3@@60) o_3@@60) (= (U_2_real (MapType1Select QPMask@16 o_3@@60 l)) (- (U_2_real (MapType1Select Mask@1 o_3@@60 l)) (/ (to_real 1) (to_real 2)))))) (=> (not (and (and (U_2_bool (MapType2Select arg_g_1@0 (invRecv181 o_3@@60))) (not (= (invRecv181 o_3@@60) x0@@10))) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange181 o_3@@60)))) (= (U_2_real (MapType1Select QPMask@16 o_3@@60 l)) (U_2_real (MapType1Select Mask@1 o_3@@60 l))))))
 :qid |stdinbpl.12260:28|
 :skolemid |1461|
 :pattern ( (MapType1Select QPMask@16 o_3@@60 l))
)) (forall ((o_3@@61 T@U) (f_5@@19 T@U) ) (! (let ((B@@31 (FieldTypeInv1 (type f_5@@19))))
(let ((A@@32 (FieldTypeInv0 (type f_5@@19))))
 (=> (and (and (= (type o_3@@61) RefType) (= (type f_5@@19) (FieldType A@@32 B@@31))) (not (= f_5@@19 l))) (= (U_2_real (MapType1Select Mask@1 o_3@@61 f_5@@19)) (U_2_real (MapType1Select QPMask@16 o_3@@61 f_5@@19))))))
 :qid |stdinbpl.12266:35|
 :skolemid |1462|
 :pattern ( (MapType1Select QPMask@16 o_3@@61 f_5@@19))
)))) (and (=> (= (ControlFlow 0 165) (- 0 168)) (forall ((n$0_13 T@U) ) (!  (=> (= (type n$0_13) RefType) (=> (and (and (U_2_bool (MapType2Select arg_g_1@0 n$0_13)) (not (= n$0_13 x0@@10))) (dummyFunction (MapType0Select Heap@@23 n$0_13 r_1))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.12275:23|
 :skolemid |1463|
 :pattern ( (MapType0Select Heap@@23 n$0_13 r_1))
 :pattern ( (MapType1Select QPMask@17 n$0_13 r_1))
 :pattern ( (MapType0Select Heap@@23 n$0_13 r_1))
))) (=> (forall ((n$0_13@@0 T@U) ) (!  (=> (= (type n$0_13@@0) RefType) (=> (and (and (U_2_bool (MapType2Select arg_g_1@0 n$0_13@@0)) (not (= n$0_13@@0 x0@@10))) (dummyFunction (MapType0Select Heap@@23 n$0_13@@0 r_1))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.12275:23|
 :skolemid |1463|
 :pattern ( (MapType0Select Heap@@23 n$0_13@@0 r_1))
 :pattern ( (MapType1Select QPMask@17 n$0_13@@0 r_1))
 :pattern ( (MapType0Select Heap@@23 n$0_13@@0 r_1))
)) (and (=> (= (ControlFlow 0 165) (- 0 167)) (forall ((n$0_13@@1 T@U) (n$0_13_1 T@U) ) (!  (=> (and (= (type n$0_13@@1) RefType) (= (type n$0_13_1) RefType)) (=> (and (and (and (and (not (= n$0_13@@1 n$0_13_1)) (and (U_2_bool (MapType2Select arg_g_1@0 n$0_13@@1)) (not (= n$0_13@@1 x0@@10)))) (and (U_2_bool (MapType2Select arg_g_1@0 n$0_13_1)) (not (= n$0_13_1 x0@@10)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n$0_13@@1 n$0_13_1))))
 :qid |stdinbpl.12282:23|
 :skolemid |1464|
 :pattern ( (neverTriggered182 n$0_13@@1) (neverTriggered182 n$0_13_1))
))) (=> (forall ((n$0_13@@2 T@U) (n$0_13_1@@0 T@U) ) (!  (=> (and (= (type n$0_13@@2) RefType) (= (type n$0_13_1@@0) RefType)) (=> (and (and (and (and (not (= n$0_13@@2 n$0_13_1@@0)) (and (U_2_bool (MapType2Select arg_g_1@0 n$0_13@@2)) (not (= n$0_13@@2 x0@@10)))) (and (U_2_bool (MapType2Select arg_g_1@0 n$0_13_1@@0)) (not (= n$0_13_1@@0 x0@@10)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n$0_13@@2 n$0_13_1@@0))))
 :qid |stdinbpl.12282:23|
 :skolemid |1464|
 :pattern ( (neverTriggered182 n$0_13@@2) (neverTriggered182 n$0_13_1@@0))
)) (and (=> (= (ControlFlow 0 165) (- 0 166)) (forall ((n$0_13@@3 T@U) ) (!  (=> (= (type n$0_13@@3) RefType) (=> (and (U_2_bool (MapType2Select arg_g_1@0 n$0_13@@3)) (not (= n$0_13@@3 x0@@10))) (>= (U_2_real (MapType1Select QPMask@16 n$0_13@@3 r_1)) (/ (to_real 1) (to_real 2)))))
 :qid |stdinbpl.12289:23|
 :skolemid |1465|
 :pattern ( (MapType0Select Heap@@23 n$0_13@@3 r_1))
 :pattern ( (MapType1Select QPMask@17 n$0_13@@3 r_1))
 :pattern ( (MapType0Select Heap@@23 n$0_13@@3 r_1))
))) (=> (forall ((n$0_13@@4 T@U) ) (!  (=> (= (type n$0_13@@4) RefType) (=> (and (U_2_bool (MapType2Select arg_g_1@0 n$0_13@@4)) (not (= n$0_13@@4 x0@@10))) (>= (U_2_real (MapType1Select QPMask@16 n$0_13@@4 r_1)) (/ (to_real 1) (to_real 2)))))
 :qid |stdinbpl.12289:23|
 :skolemid |1465|
 :pattern ( (MapType0Select Heap@@23 n$0_13@@4 r_1))
 :pattern ( (MapType1Select QPMask@17 n$0_13@@4 r_1))
 :pattern ( (MapType0Select Heap@@23 n$0_13@@4 r_1))
)) (=> (and (and (forall ((n$0_13@@5 T@U) ) (!  (=> (= (type n$0_13@@5) RefType) (=> (and (and (U_2_bool (MapType2Select arg_g_1@0 n$0_13@@5)) (not (= n$0_13@@5 x0@@10))) (< NoPerm (/ (to_real 1) (to_real 2)))) (and (qpRange182 n$0_13@@5) (= (invRecv182 n$0_13@@5) n$0_13@@5))))
 :qid |stdinbpl.12295:28|
 :skolemid |1466|
 :pattern ( (MapType0Select Heap@@23 n$0_13@@5 r_1))
 :pattern ( (MapType1Select QPMask@17 n$0_13@@5 r_1))
 :pattern ( (MapType0Select Heap@@23 n$0_13@@5 r_1))
)) (forall ((o_3@@62 T@U) ) (!  (=> (= (type o_3@@62) RefType) (=> (and (and (U_2_bool (MapType2Select arg_g_1@0 (invRecv182 o_3@@62))) (not (= (invRecv182 o_3@@62) x0@@10))) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange182 o_3@@62))) (= (invRecv182 o_3@@62) o_3@@62)))
 :qid |stdinbpl.12299:28|
 :skolemid |1467|
 :pattern ( (invRecv182 o_3@@62))
))) (and (forall ((o_3@@63 T@U) ) (!  (=> (= (type o_3@@63) RefType) (and (=> (and (and (U_2_bool (MapType2Select arg_g_1@0 (invRecv182 o_3@@63))) (not (= (invRecv182 o_3@@63) x0@@10))) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange182 o_3@@63))) (and (= (invRecv182 o_3@@63) o_3@@63) (= (U_2_real (MapType1Select QPMask@17 o_3@@63 r_1)) (- (U_2_real (MapType1Select QPMask@16 o_3@@63 r_1)) (/ (to_real 1) (to_real 2)))))) (=> (not (and (and (U_2_bool (MapType2Select arg_g_1@0 (invRecv182 o_3@@63))) (not (= (invRecv182 o_3@@63) x0@@10))) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange182 o_3@@63)))) (= (U_2_real (MapType1Select QPMask@17 o_3@@63 r_1)) (U_2_real (MapType1Select QPMask@16 o_3@@63 r_1))))))
 :qid |stdinbpl.12305:28|
 :skolemid |1468|
 :pattern ( (MapType1Select QPMask@17 o_3@@63 r_1))
)) (forall ((o_3@@64 T@U) (f_5@@20 T@U) ) (! (let ((B@@32 (FieldTypeInv1 (type f_5@@20))))
(let ((A@@33 (FieldTypeInv0 (type f_5@@20))))
 (=> (and (and (= (type o_3@@64) RefType) (= (type f_5@@20) (FieldType A@@33 B@@32))) (not (= f_5@@20 r_1))) (= (U_2_real (MapType1Select QPMask@16 o_3@@64 f_5@@20)) (U_2_real (MapType1Select QPMask@17 o_3@@64 f_5@@20))))))
 :qid |stdinbpl.12311:35|
 :skolemid |1469|
 :pattern ( (MapType1Select QPMask@17 o_3@@64 f_5@@20))
)))) (and (and (=> (= (ControlFlow 0 165) 164) anon257_Else_correct) (=> (= (ControlFlow 0 165) 120) anon258_Then_correct)) (=> (= (ControlFlow 0 165) 122) anon258_Else_correct)))))))))))))))))))
(let ((anon256_Else_correct  (=> (and (= perm@1 NoPerm) (= (ControlFlow 0 174) 165)) anon150_correct)))
(let ((anon256_Then_correct  (=> (not (= perm@1 NoPerm)) (and (=> (= (ControlFlow 0 172) (- 0 173)) (<= perm@1 (U_2_real (MapType1Select Mask@0 x0@@10 r_1)))) (=> (<= perm@1 (U_2_real (MapType1Select Mask@0 x0@@10 r_1))) (=> (= (ControlFlow 0 172) 165) anon150_correct))))))
(let ((anon148_correct  (=> (and (= Mask@0 (MapType1Store QPMask@5 x0@@10 l (real_2_U (- (U_2_real (MapType1Select QPMask@5 x0@@10 l)) perm@0)))) (= perm@1 (ite (= __right__ __right__) FullPerm (/ (to_real 1) (to_real 2))))) (and (=> (= (ControlFlow 0 175) (- 0 176)) (>= perm@1 NoPerm)) (=> (>= perm@1 NoPerm) (and (=> (= (ControlFlow 0 175) 172) anon256_Then_correct) (=> (= (ControlFlow 0 175) 174) anon256_Else_correct)))))))
(let ((anon255_Else_correct  (=> (and (= perm@0 NoPerm) (= (ControlFlow 0 179) 175)) anon148_correct)))
(let ((anon255_Then_correct  (=> (not (= perm@0 NoPerm)) (and (=> (= (ControlFlow 0 177) (- 0 178)) (<= perm@0 (U_2_real (MapType1Select QPMask@5 x0@@10 l)))) (=> (<= perm@0 (U_2_real (MapType1Select QPMask@5 x0@@10 l))) (=> (= (ControlFlow 0 177) 175) anon148_correct))))))
(let ((anon146_correct  (and (=> (= (ControlFlow 0 180) (- 0 183)) (not (U_2_bool (MapType2Select arg_g_1@0 null)))) (=> (not (U_2_bool (MapType2Select arg_g_1@0 null))) (and (=> (= (ControlFlow 0 180) (- 0 182)) (U_2_bool (MapType2Select arg_g_1@0 x0@@10))) (=> (U_2_bool (MapType2Select arg_g_1@0 x0@@10)) (=> (= perm@0 (ite (= __right__ __left__) FullPerm (/ (to_real 1) (to_real 2)))) (and (=> (= (ControlFlow 0 180) (- 0 181)) (>= perm@0 NoPerm)) (=> (>= perm@0 NoPerm) (and (=> (= (ControlFlow 0 180) 177) anon255_Then_correct) (=> (= (ControlFlow 0 180) 179) anon255_Else_correct)))))))))))
(let ((anon254_Else_correct  (=> (and (= x1@@7 null) (= (ControlFlow 0 186) 180)) anon146_correct)))
(let ((anon254_Then_correct  (=> (not (= x1@@7 null)) (and (=> (= (ControlFlow 0 184) (- 0 185)) (U_2_bool (MapType2Select arg_g_1@0 x1@@7))) (=> (U_2_bool (MapType2Select arg_g_1@0 x1@@7)) (=> (= (ControlFlow 0 184) 180) anon146_correct))))))
(let ((anon243_Else_correct  (=> (and (not (= (MapType0Select Heap@@23 x0@@10 l) null)) (= arg_g_1@0 (|Set#Union| g0@@11 g1@@11))) (and (=> (= (ControlFlow 0 187) (- 0 188)) (U_2_bool (MapType2Select arg_g_1@0 x0@@10))) (=> (U_2_bool (MapType2Select arg_g_1@0 x0@@10)) (and (=> (= (ControlFlow 0 187) 184) anon254_Then_correct) (=> (= (ControlFlow 0 187) 186) anon254_Else_correct)))))))
(let ((anon238_Else_correct  (=> (apply_TCFraming Heap@@23 g1@@11 g0@@11) (=> (and (state Heap@@23 QPMask@5) (state Heap@@23 QPMask@5)) (and (=> (= (ControlFlow 0 237) (- 0 238)) (HasDirectPerm QPMask@5 x0@@10 l)) (=> (HasDirectPerm QPMask@5 x0@@10 l) (and (=> (= (ControlFlow 0 237) 235) anon243_Then_correct) (=> (= (ControlFlow 0 237) 187) anon243_Else_correct))))))))
(let ((anon233_Else_correct  (=> (and (and (apply_TCFraming Heap@@23 g0@@11 g1@@11) (state Heap@@23 QPMask@5)) (and (state Heap@@23 QPMask@5) (state Heap@@23 QPMask@5))) (and (=> (= (ControlFlow 0 258) 249) anon238_Then_correct) (=> (= (ControlFlow 0 258) 237) anon238_Else_correct)))))
(let ((anon230_Else_correct  (=> (and (and (forall ((u$2_1 T@U) (v$2_1 T@U) ) (!  (=> (and (and (= (type u$2_1) RefType) (= (type v$2_1) RefType)) (and (U_2_bool (MapType2Select g0@@11 u$2_1)) (not (U_2_bool (MapType2Select g0@@11 v$2_1))))) (not (exists_path ($$ Heap@@23 (|Set#Union| g1@@11 g0@@11)) u$2_1 v$2_1)))
 :qid |stdinbpl.11489:20|
 :skolemid |1369|
 :pattern ( (exists_path (|$$#frame| (CombineFrames (FrameFragment (int_2_U (|$$#condqp1| Heap@@23 (|Set#Union| g1@@11 g0@@11)))) (FrameFragment (int_2_U (|$$#condqp2| Heap@@23 (|Set#Union| g1@@11 g0@@11))))) (|Set#Union| g1@@11 g0@@11)) u$2_1 v$2_1) (MapType2Select g0@@11 u$2_1) (MapType2Select g0@@11 v$2_1))
)) (state Heap@@23 QPMask@5)) (and (state Heap@@23 QPMask@5) (state Heap@@23 QPMask@5))) (and (=> (= (ControlFlow 0 278) 269) anon233_Then_correct) (=> (= (ControlFlow 0 278) 258) anon233_Else_correct)))))
(let ((anon232_Then_correct  (and (=> (= (ControlFlow 0 112) (- 0 117)) (forall ((n_24 T@U) ) (!  (=> (= (type n_24) RefType) (=> (and (U_2_bool (MapType2Select (|Set#Union| g1@@11 g0@@11) n_24)) (dummyFunction (MapType0Select Heap@@23 n_24 l))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.11393:25|
 :skolemid |1355|
 :pattern ( (MapType0Select Heap@@23 n_24 l))
 :pattern ( (MapType1Select QPMask@26 n_24 l))
 :pattern ( (MapType0Select Heap@@23 n_24 l))
))) (=> (forall ((n_24@@0 T@U) ) (!  (=> (= (type n_24@@0) RefType) (=> (and (U_2_bool (MapType2Select (|Set#Union| g1@@11 g0@@11) n_24@@0)) (dummyFunction (MapType0Select Heap@@23 n_24@@0 l))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.11393:25|
 :skolemid |1355|
 :pattern ( (MapType0Select Heap@@23 n_24@@0 l))
 :pattern ( (MapType1Select QPMask@26 n_24@@0 l))
 :pattern ( (MapType0Select Heap@@23 n_24@@0 l))
)) (and (=> (= (ControlFlow 0 112) (- 0 116)) (forall ((n_24@@1 T@U) (n_24_1 T@U) ) (!  (=> (and (= (type n_24@@1) RefType) (= (type n_24_1) RefType)) (=> (and (and (and (and (not (= n_24@@1 n_24_1)) (U_2_bool (MapType2Select (|Set#Union| g1@@11 g0@@11) n_24@@1))) (U_2_bool (MapType2Select (|Set#Union| g1@@11 g0@@11) n_24_1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_24@@1 n_24_1))))
 :qid |stdinbpl.11400:25|
 :skolemid |1356|
 :pattern ( (neverTriggered167 n_24@@1) (neverTriggered167 n_24_1))
))) (=> (forall ((n_24@@2 T@U) (n_24_1@@0 T@U) ) (!  (=> (and (= (type n_24@@2) RefType) (= (type n_24_1@@0) RefType)) (=> (and (and (and (and (not (= n_24@@2 n_24_1@@0)) (U_2_bool (MapType2Select (|Set#Union| g1@@11 g0@@11) n_24@@2))) (U_2_bool (MapType2Select (|Set#Union| g1@@11 g0@@11) n_24_1@@0))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_24@@2 n_24_1@@0))))
 :qid |stdinbpl.11400:25|
 :skolemid |1356|
 :pattern ( (neverTriggered167 n_24@@2) (neverTriggered167 n_24_1@@0))
)) (and (=> (= (ControlFlow 0 112) (- 0 115)) (forall ((n_24@@3 T@U) ) (!  (=> (and (= (type n_24@@3) RefType) (U_2_bool (MapType2Select (|Set#Union| g1@@11 g0@@11) n_24@@3))) (>= (U_2_real (MapType1Select QPMask@5 n_24@@3 l)) (/ (to_real 1) (to_real 2))))
 :qid |stdinbpl.11407:25|
 :skolemid |1357|
 :pattern ( (MapType0Select Heap@@23 n_24@@3 l))
 :pattern ( (MapType1Select QPMask@26 n_24@@3 l))
 :pattern ( (MapType0Select Heap@@23 n_24@@3 l))
))) (=> (forall ((n_24@@4 T@U) ) (!  (=> (and (= (type n_24@@4) RefType) (U_2_bool (MapType2Select (|Set#Union| g1@@11 g0@@11) n_24@@4))) (>= (U_2_real (MapType1Select QPMask@5 n_24@@4 l)) (/ (to_real 1) (to_real 2))))
 :qid |stdinbpl.11407:25|
 :skolemid |1357|
 :pattern ( (MapType0Select Heap@@23 n_24@@4 l))
 :pattern ( (MapType1Select QPMask@26 n_24@@4 l))
 :pattern ( (MapType0Select Heap@@23 n_24@@4 l))
)) (=> (and (and (forall ((n_24@@5 T@U) ) (!  (=> (= (type n_24@@5) RefType) (=> (and (U_2_bool (MapType2Select (|Set#Union| g1@@11 g0@@11) n_24@@5)) (< NoPerm (/ (to_real 1) (to_real 2)))) (and (qpRange167 n_24@@5) (= (invRecv167 n_24@@5) n_24@@5))))
 :qid |stdinbpl.11413:30|
 :skolemid |1358|
 :pattern ( (MapType0Select Heap@@23 n_24@@5 l))
 :pattern ( (MapType1Select QPMask@26 n_24@@5 l))
 :pattern ( (MapType0Select Heap@@23 n_24@@5 l))
)) (forall ((o_3@@65 T@U) ) (!  (=> (= (type o_3@@65) RefType) (=> (and (U_2_bool (MapType2Select (|Set#Union| g1@@11 g0@@11) (invRecv167 o_3@@65))) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange167 o_3@@65))) (= (invRecv167 o_3@@65) o_3@@65)))
 :qid |stdinbpl.11417:30|
 :skolemid |1359|
 :pattern ( (invRecv167 o_3@@65))
))) (and (forall ((o_3@@66 T@U) ) (!  (=> (= (type o_3@@66) RefType) (and (=> (and (U_2_bool (MapType2Select (|Set#Union| g1@@11 g0@@11) (invRecv167 o_3@@66))) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange167 o_3@@66))) (and (= (invRecv167 o_3@@66) o_3@@66) (= (U_2_real (MapType1Select QPMask@26 o_3@@66 l)) (- (U_2_real (MapType1Select QPMask@5 o_3@@66 l)) (/ (to_real 1) (to_real 2)))))) (=> (not (and (U_2_bool (MapType2Select (|Set#Union| g1@@11 g0@@11) (invRecv167 o_3@@66))) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange167 o_3@@66)))) (= (U_2_real (MapType1Select QPMask@26 o_3@@66 l)) (U_2_real (MapType1Select QPMask@5 o_3@@66 l))))))
 :qid |stdinbpl.11423:30|
 :skolemid |1360|
 :pattern ( (MapType1Select QPMask@26 o_3@@66 l))
)) (forall ((o_3@@67 T@U) (f_5@@21 T@U) ) (! (let ((B@@33 (FieldTypeInv1 (type f_5@@21))))
(let ((A@@34 (FieldTypeInv0 (type f_5@@21))))
 (=> (and (and (= (type o_3@@67) RefType) (= (type f_5@@21) (FieldType A@@34 B@@33))) (not (= f_5@@21 l))) (= (U_2_real (MapType1Select QPMask@5 o_3@@67 f_5@@21)) (U_2_real (MapType1Select QPMask@26 o_3@@67 f_5@@21))))))
 :qid |stdinbpl.11429:37|
 :skolemid |1361|
 :pattern ( (MapType1Select QPMask@26 o_3@@67 f_5@@21))
)))) (and (=> (= (ControlFlow 0 112) (- 0 114)) (forall ((n_25 T@U) ) (!  (=> (= (type n_25) RefType) (=> (and (U_2_bool (MapType2Select (|Set#Union| g1@@11 g0@@11) n_25)) (dummyFunction (MapType0Select Heap@@23 n_25 r_1))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.11438:25|
 :skolemid |1362|
 :pattern ( (MapType0Select Heap@@23 n_25 r_1))
 :pattern ( (MapType1Select QPMask@27 n_25 r_1))
 :pattern ( (MapType0Select Heap@@23 n_25 r_1))
))) (=> (forall ((n_25@@0 T@U) ) (!  (=> (= (type n_25@@0) RefType) (=> (and (U_2_bool (MapType2Select (|Set#Union| g1@@11 g0@@11) n_25@@0)) (dummyFunction (MapType0Select Heap@@23 n_25@@0 r_1))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.11438:25|
 :skolemid |1362|
 :pattern ( (MapType0Select Heap@@23 n_25@@0 r_1))
 :pattern ( (MapType1Select QPMask@27 n_25@@0 r_1))
 :pattern ( (MapType0Select Heap@@23 n_25@@0 r_1))
)) (and (=> (= (ControlFlow 0 112) (- 0 113)) (forall ((n_25@@1 T@U) (n_25_1 T@U) ) (!  (=> (and (= (type n_25@@1) RefType) (= (type n_25_1) RefType)) (=> (and (and (and (and (not (= n_25@@1 n_25_1)) (U_2_bool (MapType2Select (|Set#Union| g1@@11 g0@@11) n_25@@1))) (U_2_bool (MapType2Select (|Set#Union| g1@@11 g0@@11) n_25_1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_25@@1 n_25_1))))
 :qid |stdinbpl.11445:25|
 :skolemid |1363|
 :pattern ( (neverTriggered168 n_25@@1) (neverTriggered168 n_25_1))
))) (=> (forall ((n_25@@2 T@U) (n_25_1@@0 T@U) ) (!  (=> (and (= (type n_25@@2) RefType) (= (type n_25_1@@0) RefType)) (=> (and (and (and (and (not (= n_25@@2 n_25_1@@0)) (U_2_bool (MapType2Select (|Set#Union| g1@@11 g0@@11) n_25@@2))) (U_2_bool (MapType2Select (|Set#Union| g1@@11 g0@@11) n_25_1@@0))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_25@@2 n_25_1@@0))))
 :qid |stdinbpl.11445:25|
 :skolemid |1363|
 :pattern ( (neverTriggered168 n_25@@2) (neverTriggered168 n_25_1@@0))
)) (=> (= (ControlFlow 0 112) (- 0 111)) (forall ((n_25@@3 T@U) ) (!  (=> (and (= (type n_25@@3) RefType) (U_2_bool (MapType2Select (|Set#Union| g1@@11 g0@@11) n_25@@3))) (>= (U_2_real (MapType1Select QPMask@26 n_25@@3 r_1)) (/ (to_real 1) (to_real 2))))
 :qid |stdinbpl.11452:25|
 :skolemid |1364|
 :pattern ( (MapType0Select Heap@@23 n_25@@3 r_1))
 :pattern ( (MapType1Select QPMask@27 n_25@@3 r_1))
 :pattern ( (MapType0Select Heap@@23 n_25@@3 r_1))
))))))))))))))))
(let ((anon101_correct true))
(let ((anon231_Then_correct  (=> (and (U_2_bool (MapType2Select g0@@11 u$2)) (not (U_2_bool (MapType2Select g0@@11 v$2)))) (and (=> (= (ControlFlow 0 118) 112) anon232_Then_correct) (=> (= (ControlFlow 0 118) 109) anon101_correct)))))
(let ((anon231_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select g0@@11 u$2)) (not (U_2_bool (MapType2Select g0@@11 v$2))))) (= (ControlFlow 0 110) 109)) anon101_correct)))
(let ((anon227_Else_correct  (=> (and (and (forall ((u$1_1 T@U) (v$1_1 T@U) ) (!  (=> (and (and (= (type u$1_1) RefType) (= (type v$1_1) RefType)) (and (U_2_bool (MapType2Select g1@@11 u$1_1)) (not (U_2_bool (MapType2Select g1@@11 v$1_1))))) (not (exists_path ($$ Heap@@23 (|Set#Union| g1@@11 g0@@11)) u$1_1 v$1_1)))
 :qid |stdinbpl.11369:20|
 :skolemid |1354|
 :pattern ( (exists_path (|$$#frame| (CombineFrames (FrameFragment (int_2_U (|$$#condqp1| Heap@@23 (|Set#Union| g1@@11 g0@@11)))) (FrameFragment (int_2_U (|$$#condqp2| Heap@@23 (|Set#Union| g1@@11 g0@@11))))) (|Set#Union| g1@@11 g0@@11)) u$1_1 v$1_1) (MapType2Select g1@@11 u$1_1) (MapType2Select g1@@11 v$1_1))
)) (state Heap@@23 QPMask@5)) (and (state Heap@@23 QPMask@5) (state Heap@@23 QPMask@5))) (and (and (=> (= (ControlFlow 0 279) 278) anon230_Else_correct) (=> (= (ControlFlow 0 279) 118) anon231_Then_correct)) (=> (= (ControlFlow 0 279) 110) anon231_Else_correct)))))
(let ((anon229_Then_correct  (and (=> (= (ControlFlow 0 102) (- 0 107)) (forall ((n_22 T@U) ) (!  (=> (= (type n_22) RefType) (=> (and (U_2_bool (MapType2Select (|Set#Union| g1@@11 g0@@11) n_22)) (dummyFunction (MapType0Select Heap@@23 n_22 l))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.11273:25|
 :skolemid |1340|
 :pattern ( (MapType0Select Heap@@23 n_22 l))
 :pattern ( (MapType1Select QPMask@28 n_22 l))
 :pattern ( (MapType0Select Heap@@23 n_22 l))
))) (=> (forall ((n_22@@0 T@U) ) (!  (=> (= (type n_22@@0) RefType) (=> (and (U_2_bool (MapType2Select (|Set#Union| g1@@11 g0@@11) n_22@@0)) (dummyFunction (MapType0Select Heap@@23 n_22@@0 l))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.11273:25|
 :skolemid |1340|
 :pattern ( (MapType0Select Heap@@23 n_22@@0 l))
 :pattern ( (MapType1Select QPMask@28 n_22@@0 l))
 :pattern ( (MapType0Select Heap@@23 n_22@@0 l))
)) (and (=> (= (ControlFlow 0 102) (- 0 106)) (forall ((n_22@@1 T@U) (n_22_1 T@U) ) (!  (=> (and (= (type n_22@@1) RefType) (= (type n_22_1) RefType)) (=> (and (and (and (and (not (= n_22@@1 n_22_1)) (U_2_bool (MapType2Select (|Set#Union| g1@@11 g0@@11) n_22@@1))) (U_2_bool (MapType2Select (|Set#Union| g1@@11 g0@@11) n_22_1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_22@@1 n_22_1))))
 :qid |stdinbpl.11280:25|
 :skolemid |1341|
 :pattern ( (neverTriggered165 n_22@@1) (neverTriggered165 n_22_1))
))) (=> (forall ((n_22@@2 T@U) (n_22_1@@0 T@U) ) (!  (=> (and (= (type n_22@@2) RefType) (= (type n_22_1@@0) RefType)) (=> (and (and (and (and (not (= n_22@@2 n_22_1@@0)) (U_2_bool (MapType2Select (|Set#Union| g1@@11 g0@@11) n_22@@2))) (U_2_bool (MapType2Select (|Set#Union| g1@@11 g0@@11) n_22_1@@0))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_22@@2 n_22_1@@0))))
 :qid |stdinbpl.11280:25|
 :skolemid |1341|
 :pattern ( (neverTriggered165 n_22@@2) (neverTriggered165 n_22_1@@0))
)) (and (=> (= (ControlFlow 0 102) (- 0 105)) (forall ((n_22@@3 T@U) ) (!  (=> (and (= (type n_22@@3) RefType) (U_2_bool (MapType2Select (|Set#Union| g1@@11 g0@@11) n_22@@3))) (>= (U_2_real (MapType1Select QPMask@5 n_22@@3 l)) (/ (to_real 1) (to_real 2))))
 :qid |stdinbpl.11287:25|
 :skolemid |1342|
 :pattern ( (MapType0Select Heap@@23 n_22@@3 l))
 :pattern ( (MapType1Select QPMask@28 n_22@@3 l))
 :pattern ( (MapType0Select Heap@@23 n_22@@3 l))
))) (=> (forall ((n_22@@4 T@U) ) (!  (=> (and (= (type n_22@@4) RefType) (U_2_bool (MapType2Select (|Set#Union| g1@@11 g0@@11) n_22@@4))) (>= (U_2_real (MapType1Select QPMask@5 n_22@@4 l)) (/ (to_real 1) (to_real 2))))
 :qid |stdinbpl.11287:25|
 :skolemid |1342|
 :pattern ( (MapType0Select Heap@@23 n_22@@4 l))
 :pattern ( (MapType1Select QPMask@28 n_22@@4 l))
 :pattern ( (MapType0Select Heap@@23 n_22@@4 l))
)) (=> (and (and (forall ((n_22@@5 T@U) ) (!  (=> (= (type n_22@@5) RefType) (=> (and (U_2_bool (MapType2Select (|Set#Union| g1@@11 g0@@11) n_22@@5)) (< NoPerm (/ (to_real 1) (to_real 2)))) (and (qpRange165 n_22@@5) (= (invRecv165 n_22@@5) n_22@@5))))
 :qid |stdinbpl.11293:30|
 :skolemid |1343|
 :pattern ( (MapType0Select Heap@@23 n_22@@5 l))
 :pattern ( (MapType1Select QPMask@28 n_22@@5 l))
 :pattern ( (MapType0Select Heap@@23 n_22@@5 l))
)) (forall ((o_3@@68 T@U) ) (!  (=> (= (type o_3@@68) RefType) (=> (and (U_2_bool (MapType2Select (|Set#Union| g1@@11 g0@@11) (invRecv165 o_3@@68))) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange165 o_3@@68))) (= (invRecv165 o_3@@68) o_3@@68)))
 :qid |stdinbpl.11297:30|
 :skolemid |1344|
 :pattern ( (invRecv165 o_3@@68))
))) (and (forall ((o_3@@69 T@U) ) (!  (=> (= (type o_3@@69) RefType) (and (=> (and (U_2_bool (MapType2Select (|Set#Union| g1@@11 g0@@11) (invRecv165 o_3@@69))) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange165 o_3@@69))) (and (= (invRecv165 o_3@@69) o_3@@69) (= (U_2_real (MapType1Select QPMask@28 o_3@@69 l)) (- (U_2_real (MapType1Select QPMask@5 o_3@@69 l)) (/ (to_real 1) (to_real 2)))))) (=> (not (and (U_2_bool (MapType2Select (|Set#Union| g1@@11 g0@@11) (invRecv165 o_3@@69))) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange165 o_3@@69)))) (= (U_2_real (MapType1Select QPMask@28 o_3@@69 l)) (U_2_real (MapType1Select QPMask@5 o_3@@69 l))))))
 :qid |stdinbpl.11303:30|
 :skolemid |1345|
 :pattern ( (MapType1Select QPMask@28 o_3@@69 l))
)) (forall ((o_3@@70 T@U) (f_5@@22 T@U) ) (! (let ((B@@34 (FieldTypeInv1 (type f_5@@22))))
(let ((A@@35 (FieldTypeInv0 (type f_5@@22))))
 (=> (and (and (= (type o_3@@70) RefType) (= (type f_5@@22) (FieldType A@@35 B@@34))) (not (= f_5@@22 l))) (= (U_2_real (MapType1Select QPMask@5 o_3@@70 f_5@@22)) (U_2_real (MapType1Select QPMask@28 o_3@@70 f_5@@22))))))
 :qid |stdinbpl.11309:37|
 :skolemid |1346|
 :pattern ( (MapType1Select QPMask@28 o_3@@70 f_5@@22))
)))) (and (=> (= (ControlFlow 0 102) (- 0 104)) (forall ((n_23 T@U) ) (!  (=> (= (type n_23) RefType) (=> (and (U_2_bool (MapType2Select (|Set#Union| g1@@11 g0@@11) n_23)) (dummyFunction (MapType0Select Heap@@23 n_23 r_1))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.11318:25|
 :skolemid |1347|
 :pattern ( (MapType0Select Heap@@23 n_23 r_1))
 :pattern ( (MapType1Select QPMask@29 n_23 r_1))
 :pattern ( (MapType0Select Heap@@23 n_23 r_1))
))) (=> (forall ((n_23@@0 T@U) ) (!  (=> (= (type n_23@@0) RefType) (=> (and (U_2_bool (MapType2Select (|Set#Union| g1@@11 g0@@11) n_23@@0)) (dummyFunction (MapType0Select Heap@@23 n_23@@0 r_1))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.11318:25|
 :skolemid |1347|
 :pattern ( (MapType0Select Heap@@23 n_23@@0 r_1))
 :pattern ( (MapType1Select QPMask@29 n_23@@0 r_1))
 :pattern ( (MapType0Select Heap@@23 n_23@@0 r_1))
)) (and (=> (= (ControlFlow 0 102) (- 0 103)) (forall ((n_23@@1 T@U) (n_23_1 T@U) ) (!  (=> (and (= (type n_23@@1) RefType) (= (type n_23_1) RefType)) (=> (and (and (and (and (not (= n_23@@1 n_23_1)) (U_2_bool (MapType2Select (|Set#Union| g1@@11 g0@@11) n_23@@1))) (U_2_bool (MapType2Select (|Set#Union| g1@@11 g0@@11) n_23_1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_23@@1 n_23_1))))
 :qid |stdinbpl.11325:25|
 :skolemid |1348|
 :pattern ( (neverTriggered166 n_23@@1) (neverTriggered166 n_23_1))
))) (=> (forall ((n_23@@2 T@U) (n_23_1@@0 T@U) ) (!  (=> (and (= (type n_23@@2) RefType) (= (type n_23_1@@0) RefType)) (=> (and (and (and (and (not (= n_23@@2 n_23_1@@0)) (U_2_bool (MapType2Select (|Set#Union| g1@@11 g0@@11) n_23@@2))) (U_2_bool (MapType2Select (|Set#Union| g1@@11 g0@@11) n_23_1@@0))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_23@@2 n_23_1@@0))))
 :qid |stdinbpl.11325:25|
 :skolemid |1348|
 :pattern ( (neverTriggered166 n_23@@2) (neverTriggered166 n_23_1@@0))
)) (=> (= (ControlFlow 0 102) (- 0 101)) (forall ((n_23@@3 T@U) ) (!  (=> (and (= (type n_23@@3) RefType) (U_2_bool (MapType2Select (|Set#Union| g1@@11 g0@@11) n_23@@3))) (>= (U_2_real (MapType1Select QPMask@28 n_23@@3 r_1)) (/ (to_real 1) (to_real 2))))
 :qid |stdinbpl.11332:25|
 :skolemid |1349|
 :pattern ( (MapType0Select Heap@@23 n_23@@3 r_1))
 :pattern ( (MapType1Select QPMask@29 n_23@@3 r_1))
 :pattern ( (MapType0Select Heap@@23 n_23@@3 r_1))
))))))))))))))))
(let ((anon96_correct true))
(let ((anon228_Then_correct  (=> (and (U_2_bool (MapType2Select g1@@11 u$1)) (not (U_2_bool (MapType2Select g1@@11 v$1)))) (and (=> (= (ControlFlow 0 108) 102) anon229_Then_correct) (=> (= (ControlFlow 0 108) 99) anon96_correct)))))
(let ((anon228_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select g1@@11 u$1)) (not (U_2_bool (MapType2Select g1@@11 v$1))))) (= (ControlFlow 0 100) 99)) anon96_correct)))
(let ((anon224_Else_correct  (=> (and (and (forall ((u$0_1 T@U) (v$0_1 T@U) ) (!  (=> (and (and (= (type u$0_1) RefType) (= (type v$0_1) RefType)) (and (U_2_bool (MapType2Select g1@@11 u$0_1)) (not (U_2_bool (MapType2Select g1@@11 v$0_1))))) (not (exists_path ($$ Heap@@23 (|Set#Union| g0@@11 g1@@11)) u$0_1 v$0_1)))
 :qid |stdinbpl.11249:20|
 :skolemid |1339|
 :pattern ( (exists_path (|$$#frame| (CombineFrames (FrameFragment (int_2_U (|$$#condqp1| Heap@@23 (|Set#Union| g0@@11 g1@@11)))) (FrameFragment (int_2_U (|$$#condqp2| Heap@@23 (|Set#Union| g0@@11 g1@@11))))) (|Set#Union| g0@@11 g1@@11)) u$0_1 v$0_1) (MapType2Select g1@@11 u$0_1) (MapType2Select g1@@11 v$0_1))
)) (state Heap@@23 QPMask@5)) (and (state Heap@@23 QPMask@5) (state Heap@@23 QPMask@5))) (and (and (=> (= (ControlFlow 0 280) 279) anon227_Else_correct) (=> (= (ControlFlow 0 280) 108) anon228_Then_correct)) (=> (= (ControlFlow 0 280) 100) anon228_Else_correct)))))
(let ((anon226_Then_correct  (and (=> (= (ControlFlow 0 92) (- 0 97)) (forall ((n_20 T@U) ) (!  (=> (= (type n_20) RefType) (=> (and (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) n_20)) (dummyFunction (MapType0Select Heap@@23 n_20 l))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.11153:25|
 :skolemid |1325|
 :pattern ( (MapType0Select Heap@@23 n_20 l))
 :pattern ( (MapType1Select QPMask@30 n_20 l))
 :pattern ( (MapType0Select Heap@@23 n_20 l))
))) (=> (forall ((n_20@@0 T@U) ) (!  (=> (= (type n_20@@0) RefType) (=> (and (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) n_20@@0)) (dummyFunction (MapType0Select Heap@@23 n_20@@0 l))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.11153:25|
 :skolemid |1325|
 :pattern ( (MapType0Select Heap@@23 n_20@@0 l))
 :pattern ( (MapType1Select QPMask@30 n_20@@0 l))
 :pattern ( (MapType0Select Heap@@23 n_20@@0 l))
)) (and (=> (= (ControlFlow 0 92) (- 0 96)) (forall ((n_20@@1 T@U) (n_20_1 T@U) ) (!  (=> (and (= (type n_20@@1) RefType) (= (type n_20_1) RefType)) (=> (and (and (and (and (not (= n_20@@1 n_20_1)) (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) n_20@@1))) (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) n_20_1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_20@@1 n_20_1))))
 :qid |stdinbpl.11160:25|
 :skolemid |1326|
 :pattern ( (neverTriggered163 n_20@@1) (neverTriggered163 n_20_1))
))) (=> (forall ((n_20@@2 T@U) (n_20_1@@0 T@U) ) (!  (=> (and (= (type n_20@@2) RefType) (= (type n_20_1@@0) RefType)) (=> (and (and (and (and (not (= n_20@@2 n_20_1@@0)) (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) n_20@@2))) (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) n_20_1@@0))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_20@@2 n_20_1@@0))))
 :qid |stdinbpl.11160:25|
 :skolemid |1326|
 :pattern ( (neverTriggered163 n_20@@2) (neverTriggered163 n_20_1@@0))
)) (and (=> (= (ControlFlow 0 92) (- 0 95)) (forall ((n_20@@3 T@U) ) (!  (=> (and (= (type n_20@@3) RefType) (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) n_20@@3))) (>= (U_2_real (MapType1Select QPMask@5 n_20@@3 l)) (/ (to_real 1) (to_real 2))))
 :qid |stdinbpl.11167:25|
 :skolemid |1327|
 :pattern ( (MapType0Select Heap@@23 n_20@@3 l))
 :pattern ( (MapType1Select QPMask@30 n_20@@3 l))
 :pattern ( (MapType0Select Heap@@23 n_20@@3 l))
))) (=> (forall ((n_20@@4 T@U) ) (!  (=> (and (= (type n_20@@4) RefType) (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) n_20@@4))) (>= (U_2_real (MapType1Select QPMask@5 n_20@@4 l)) (/ (to_real 1) (to_real 2))))
 :qid |stdinbpl.11167:25|
 :skolemid |1327|
 :pattern ( (MapType0Select Heap@@23 n_20@@4 l))
 :pattern ( (MapType1Select QPMask@30 n_20@@4 l))
 :pattern ( (MapType0Select Heap@@23 n_20@@4 l))
)) (=> (and (and (forall ((n_20@@5 T@U) ) (!  (=> (= (type n_20@@5) RefType) (=> (and (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) n_20@@5)) (< NoPerm (/ (to_real 1) (to_real 2)))) (and (qpRange163 n_20@@5) (= (invRecv163 n_20@@5) n_20@@5))))
 :qid |stdinbpl.11173:30|
 :skolemid |1328|
 :pattern ( (MapType0Select Heap@@23 n_20@@5 l))
 :pattern ( (MapType1Select QPMask@30 n_20@@5 l))
 :pattern ( (MapType0Select Heap@@23 n_20@@5 l))
)) (forall ((o_3@@71 T@U) ) (!  (=> (= (type o_3@@71) RefType) (=> (and (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) (invRecv163 o_3@@71))) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange163 o_3@@71))) (= (invRecv163 o_3@@71) o_3@@71)))
 :qid |stdinbpl.11177:30|
 :skolemid |1329|
 :pattern ( (invRecv163 o_3@@71))
))) (and (forall ((o_3@@72 T@U) ) (!  (=> (= (type o_3@@72) RefType) (and (=> (and (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) (invRecv163 o_3@@72))) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange163 o_3@@72))) (and (= (invRecv163 o_3@@72) o_3@@72) (= (U_2_real (MapType1Select QPMask@30 o_3@@72 l)) (- (U_2_real (MapType1Select QPMask@5 o_3@@72 l)) (/ (to_real 1) (to_real 2)))))) (=> (not (and (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) (invRecv163 o_3@@72))) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange163 o_3@@72)))) (= (U_2_real (MapType1Select QPMask@30 o_3@@72 l)) (U_2_real (MapType1Select QPMask@5 o_3@@72 l))))))
 :qid |stdinbpl.11183:30|
 :skolemid |1330|
 :pattern ( (MapType1Select QPMask@30 o_3@@72 l))
)) (forall ((o_3@@73 T@U) (f_5@@23 T@U) ) (! (let ((B@@35 (FieldTypeInv1 (type f_5@@23))))
(let ((A@@36 (FieldTypeInv0 (type f_5@@23))))
 (=> (and (and (= (type o_3@@73) RefType) (= (type f_5@@23) (FieldType A@@36 B@@35))) (not (= f_5@@23 l))) (= (U_2_real (MapType1Select QPMask@5 o_3@@73 f_5@@23)) (U_2_real (MapType1Select QPMask@30 o_3@@73 f_5@@23))))))
 :qid |stdinbpl.11189:37|
 :skolemid |1331|
 :pattern ( (MapType1Select QPMask@30 o_3@@73 f_5@@23))
)))) (and (=> (= (ControlFlow 0 92) (- 0 94)) (forall ((n_21 T@U) ) (!  (=> (= (type n_21) RefType) (=> (and (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) n_21)) (dummyFunction (MapType0Select Heap@@23 n_21 r_1))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.11198:25|
 :skolemid |1332|
 :pattern ( (MapType0Select Heap@@23 n_21 r_1))
 :pattern ( (MapType1Select QPMask@31 n_21 r_1))
 :pattern ( (MapType0Select Heap@@23 n_21 r_1))
))) (=> (forall ((n_21@@0 T@U) ) (!  (=> (= (type n_21@@0) RefType) (=> (and (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) n_21@@0)) (dummyFunction (MapType0Select Heap@@23 n_21@@0 r_1))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.11198:25|
 :skolemid |1332|
 :pattern ( (MapType0Select Heap@@23 n_21@@0 r_1))
 :pattern ( (MapType1Select QPMask@31 n_21@@0 r_1))
 :pattern ( (MapType0Select Heap@@23 n_21@@0 r_1))
)) (and (=> (= (ControlFlow 0 92) (- 0 93)) (forall ((n_21@@1 T@U) (n_21_1 T@U) ) (!  (=> (and (= (type n_21@@1) RefType) (= (type n_21_1) RefType)) (=> (and (and (and (and (not (= n_21@@1 n_21_1)) (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) n_21@@1))) (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) n_21_1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_21@@1 n_21_1))))
 :qid |stdinbpl.11205:25|
 :skolemid |1333|
 :pattern ( (neverTriggered164 n_21@@1) (neverTriggered164 n_21_1))
))) (=> (forall ((n_21@@2 T@U) (n_21_1@@0 T@U) ) (!  (=> (and (= (type n_21@@2) RefType) (= (type n_21_1@@0) RefType)) (=> (and (and (and (and (not (= n_21@@2 n_21_1@@0)) (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) n_21@@2))) (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) n_21_1@@0))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_21@@2 n_21_1@@0))))
 :qid |stdinbpl.11205:25|
 :skolemid |1333|
 :pattern ( (neverTriggered164 n_21@@2) (neverTriggered164 n_21_1@@0))
)) (=> (= (ControlFlow 0 92) (- 0 91)) (forall ((n_21@@3 T@U) ) (!  (=> (and (= (type n_21@@3) RefType) (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) n_21@@3))) (>= (U_2_real (MapType1Select QPMask@30 n_21@@3 r_1)) (/ (to_real 1) (to_real 2))))
 :qid |stdinbpl.11212:25|
 :skolemid |1334|
 :pattern ( (MapType0Select Heap@@23 n_21@@3 r_1))
 :pattern ( (MapType1Select QPMask@31 n_21@@3 r_1))
 :pattern ( (MapType0Select Heap@@23 n_21@@3 r_1))
))))))))))))))))
(let ((anon91_correct true))
(let ((anon225_Then_correct  (=> (and (U_2_bool (MapType2Select g1@@11 u$0)) (not (U_2_bool (MapType2Select g1@@11 v$0)))) (and (=> (= (ControlFlow 0 98) 92) anon226_Then_correct) (=> (= (ControlFlow 0 98) 89) anon91_correct)))))
(let ((anon225_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select g1@@11 u$0)) (not (U_2_bool (MapType2Select g1@@11 v$0))))) (= (ControlFlow 0 90) 89)) anon91_correct)))
(let ((anon221_Else_correct  (=> (and (and (forall ((u_1_1@@1 T@U) (v_1_1@@1 T@U) ) (!  (=> (and (and (= (type u_1_1@@1) RefType) (= (type v_1_1@@1) RefType)) (and (U_2_bool (MapType2Select g0@@11 u_1_1@@1)) (not (U_2_bool (MapType2Select g0@@11 v_1_1@@1))))) (not (exists_path ($$ Heap@@23 (|Set#Union| g0@@11 g1@@11)) u_1_1@@1 v_1_1@@1)))
 :qid |stdinbpl.11129:20|
 :skolemid |1324|
 :pattern ( (exists_path (|$$#frame| (CombineFrames (FrameFragment (int_2_U (|$$#condqp1| Heap@@23 (|Set#Union| g0@@11 g1@@11)))) (FrameFragment (int_2_U (|$$#condqp2| Heap@@23 (|Set#Union| g0@@11 g1@@11))))) (|Set#Union| g0@@11 g1@@11)) u_1_1@@1 v_1_1@@1) (MapType2Select g0@@11 u_1_1@@1) (MapType2Select g0@@11 v_1_1@@1))
)) (state Heap@@23 QPMask@5)) (and (state Heap@@23 QPMask@5) (state Heap@@23 QPMask@5))) (and (and (=> (= (ControlFlow 0 281) 280) anon224_Else_correct) (=> (= (ControlFlow 0 281) 98) anon225_Then_correct)) (=> (= (ControlFlow 0 281) 90) anon225_Else_correct)))))
(let ((anon223_Then_correct  (and (=> (= (ControlFlow 0 82) (- 0 87)) (forall ((n_18 T@U) ) (!  (=> (= (type n_18) RefType) (=> (and (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) n_18)) (dummyFunction (MapType0Select Heap@@23 n_18 l))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.11033:25|
 :skolemid |1310|
 :pattern ( (MapType0Select Heap@@23 n_18 l))
 :pattern ( (MapType1Select QPMask@32 n_18 l))
 :pattern ( (MapType0Select Heap@@23 n_18 l))
))) (=> (forall ((n_18@@0 T@U) ) (!  (=> (= (type n_18@@0) RefType) (=> (and (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) n_18@@0)) (dummyFunction (MapType0Select Heap@@23 n_18@@0 l))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.11033:25|
 :skolemid |1310|
 :pattern ( (MapType0Select Heap@@23 n_18@@0 l))
 :pattern ( (MapType1Select QPMask@32 n_18@@0 l))
 :pattern ( (MapType0Select Heap@@23 n_18@@0 l))
)) (and (=> (= (ControlFlow 0 82) (- 0 86)) (forall ((n_18@@1 T@U) (n_18_1 T@U) ) (!  (=> (and (= (type n_18@@1) RefType) (= (type n_18_1) RefType)) (=> (and (and (and (and (not (= n_18@@1 n_18_1)) (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) n_18@@1))) (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) n_18_1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_18@@1 n_18_1))))
 :qid |stdinbpl.11040:25|
 :skolemid |1311|
 :pattern ( (neverTriggered161 n_18@@1) (neverTriggered161 n_18_1))
))) (=> (forall ((n_18@@2 T@U) (n_18_1@@0 T@U) ) (!  (=> (and (= (type n_18@@2) RefType) (= (type n_18_1@@0) RefType)) (=> (and (and (and (and (not (= n_18@@2 n_18_1@@0)) (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) n_18@@2))) (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) n_18_1@@0))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_18@@2 n_18_1@@0))))
 :qid |stdinbpl.11040:25|
 :skolemid |1311|
 :pattern ( (neverTriggered161 n_18@@2) (neverTriggered161 n_18_1@@0))
)) (and (=> (= (ControlFlow 0 82) (- 0 85)) (forall ((n_18@@3 T@U) ) (!  (=> (and (= (type n_18@@3) RefType) (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) n_18@@3))) (>= (U_2_real (MapType1Select QPMask@5 n_18@@3 l)) (/ (to_real 1) (to_real 2))))
 :qid |stdinbpl.11047:25|
 :skolemid |1312|
 :pattern ( (MapType0Select Heap@@23 n_18@@3 l))
 :pattern ( (MapType1Select QPMask@32 n_18@@3 l))
 :pattern ( (MapType0Select Heap@@23 n_18@@3 l))
))) (=> (forall ((n_18@@4 T@U) ) (!  (=> (and (= (type n_18@@4) RefType) (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) n_18@@4))) (>= (U_2_real (MapType1Select QPMask@5 n_18@@4 l)) (/ (to_real 1) (to_real 2))))
 :qid |stdinbpl.11047:25|
 :skolemid |1312|
 :pattern ( (MapType0Select Heap@@23 n_18@@4 l))
 :pattern ( (MapType1Select QPMask@32 n_18@@4 l))
 :pattern ( (MapType0Select Heap@@23 n_18@@4 l))
)) (=> (and (and (forall ((n_18@@5 T@U) ) (!  (=> (= (type n_18@@5) RefType) (=> (and (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) n_18@@5)) (< NoPerm (/ (to_real 1) (to_real 2)))) (and (qpRange161 n_18@@5) (= (invRecv161 n_18@@5) n_18@@5))))
 :qid |stdinbpl.11053:30|
 :skolemid |1313|
 :pattern ( (MapType0Select Heap@@23 n_18@@5 l))
 :pattern ( (MapType1Select QPMask@32 n_18@@5 l))
 :pattern ( (MapType0Select Heap@@23 n_18@@5 l))
)) (forall ((o_3@@74 T@U) ) (!  (=> (= (type o_3@@74) RefType) (=> (and (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) (invRecv161 o_3@@74))) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange161 o_3@@74))) (= (invRecv161 o_3@@74) o_3@@74)))
 :qid |stdinbpl.11057:30|
 :skolemid |1314|
 :pattern ( (invRecv161 o_3@@74))
))) (and (forall ((o_3@@75 T@U) ) (!  (=> (= (type o_3@@75) RefType) (and (=> (and (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) (invRecv161 o_3@@75))) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange161 o_3@@75))) (and (= (invRecv161 o_3@@75) o_3@@75) (= (U_2_real (MapType1Select QPMask@32 o_3@@75 l)) (- (U_2_real (MapType1Select QPMask@5 o_3@@75 l)) (/ (to_real 1) (to_real 2)))))) (=> (not (and (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) (invRecv161 o_3@@75))) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange161 o_3@@75)))) (= (U_2_real (MapType1Select QPMask@32 o_3@@75 l)) (U_2_real (MapType1Select QPMask@5 o_3@@75 l))))))
 :qid |stdinbpl.11063:30|
 :skolemid |1315|
 :pattern ( (MapType1Select QPMask@32 o_3@@75 l))
)) (forall ((o_3@@76 T@U) (f_5@@24 T@U) ) (! (let ((B@@36 (FieldTypeInv1 (type f_5@@24))))
(let ((A@@37 (FieldTypeInv0 (type f_5@@24))))
 (=> (and (and (= (type o_3@@76) RefType) (= (type f_5@@24) (FieldType A@@37 B@@36))) (not (= f_5@@24 l))) (= (U_2_real (MapType1Select QPMask@5 o_3@@76 f_5@@24)) (U_2_real (MapType1Select QPMask@32 o_3@@76 f_5@@24))))))
 :qid |stdinbpl.11069:37|
 :skolemid |1316|
 :pattern ( (MapType1Select QPMask@32 o_3@@76 f_5@@24))
)))) (and (=> (= (ControlFlow 0 82) (- 0 84)) (forall ((n_19 T@U) ) (!  (=> (= (type n_19) RefType) (=> (and (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) n_19)) (dummyFunction (MapType0Select Heap@@23 n_19 r_1))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.11078:25|
 :skolemid |1317|
 :pattern ( (MapType0Select Heap@@23 n_19 r_1))
 :pattern ( (MapType1Select QPMask@33 n_19 r_1))
 :pattern ( (MapType0Select Heap@@23 n_19 r_1))
))) (=> (forall ((n_19@@0 T@U) ) (!  (=> (= (type n_19@@0) RefType) (=> (and (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) n_19@@0)) (dummyFunction (MapType0Select Heap@@23 n_19@@0 r_1))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.11078:25|
 :skolemid |1317|
 :pattern ( (MapType0Select Heap@@23 n_19@@0 r_1))
 :pattern ( (MapType1Select QPMask@33 n_19@@0 r_1))
 :pattern ( (MapType0Select Heap@@23 n_19@@0 r_1))
)) (and (=> (= (ControlFlow 0 82) (- 0 83)) (forall ((n_19@@1 T@U) (n_19_1 T@U) ) (!  (=> (and (= (type n_19@@1) RefType) (= (type n_19_1) RefType)) (=> (and (and (and (and (not (= n_19@@1 n_19_1)) (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) n_19@@1))) (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) n_19_1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_19@@1 n_19_1))))
 :qid |stdinbpl.11085:25|
 :skolemid |1318|
 :pattern ( (neverTriggered162 n_19@@1) (neverTriggered162 n_19_1))
))) (=> (forall ((n_19@@2 T@U) (n_19_1@@0 T@U) ) (!  (=> (and (= (type n_19@@2) RefType) (= (type n_19_1@@0) RefType)) (=> (and (and (and (and (not (= n_19@@2 n_19_1@@0)) (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) n_19@@2))) (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) n_19_1@@0))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_19@@2 n_19_1@@0))))
 :qid |stdinbpl.11085:25|
 :skolemid |1318|
 :pattern ( (neverTriggered162 n_19@@2) (neverTriggered162 n_19_1@@0))
)) (=> (= (ControlFlow 0 82) (- 0 81)) (forall ((n_19@@3 T@U) ) (!  (=> (and (= (type n_19@@3) RefType) (U_2_bool (MapType2Select (|Set#Union| g0@@11 g1@@11) n_19@@3))) (>= (U_2_real (MapType1Select QPMask@32 n_19@@3 r_1)) (/ (to_real 1) (to_real 2))))
 :qid |stdinbpl.11092:25|
 :skolemid |1319|
 :pattern ( (MapType0Select Heap@@23 n_19@@3 r_1))
 :pattern ( (MapType1Select QPMask@33 n_19@@3 r_1))
 :pattern ( (MapType0Select Heap@@23 n_19@@3 r_1))
))))))))))))))))
(let ((anon86_correct true))
(let ((anon222_Then_correct  (=> (and (U_2_bool (MapType2Select g0@@11 u_12)) (not (U_2_bool (MapType2Select g0@@11 v_12)))) (and (=> (= (ControlFlow 0 88) 82) anon223_Then_correct) (=> (= (ControlFlow 0 88) 79) anon86_correct)))))
(let ((anon222_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select g0@@11 u_12)) (not (U_2_bool (MapType2Select g0@@11 v_12))))) (= (ControlFlow 0 80) 79)) anon86_correct)))
(let ((anon208_Else_correct  (=> (state Heap@@23 QPMask@5) (and (and (=> (= (ControlFlow 0 282) 281) anon221_Else_correct) (=> (= (ControlFlow 0 282) 88) anon222_Then_correct)) (=> (= (ControlFlow 0 282) 80) anon222_Else_correct)))))
(let ((anon207_Else_correct  (=> (and (forall ((n$8_1 T@U) ) (!  (=> (and (= (type n$8_1) RefType) (U_2_bool (MapType2Select g1@@11 n$8_1))) (not (U_2_bool (MapType2Select g0@@11 n$8_1))))
 :qid |stdinbpl.10663:20|
 :skolemid |1266|
 :pattern ( (MapType2Select g0@@11 n$8_1) (MapType2Select g1@@11 n$8_1))
)) (state Heap@@23 QPMask@5)) (and (=> (= (ControlFlow 0 325) 324) anon208_Then_correct) (=> (= (ControlFlow 0 325) 282) anon208_Else_correct)))))
(let ((anon207_Then_correct true))
(let ((anon206_Else_correct  (=> (forall ((n$7_1 T@U) ) (!  (=> (and (= (type n$7_1) RefType) (U_2_bool (MapType2Select g0@@11 n$7_1))) (not (U_2_bool (MapType2Select g1@@11 n$7_1))))
 :qid |stdinbpl.10654:20|
 :skolemid |1265|
 :pattern ( (MapType2Select g0@@11 n$7_1) (MapType2Select g1@@11 n$7_1))
)) (and (=> (= (ControlFlow 0 326) 78) anon207_Then_correct) (=> (= (ControlFlow 0 326) 325) anon207_Else_correct)))))
(let ((anon206_Then_correct true))
(let ((anon53_correct  (=> (and (or (= (MapType0Select Heap@@23 x0@@10 l) null) (= (MapType0Select Heap@@23 x0@@10 r_1) null)) (state Heap@@23 QPMask@5)) (and (=> (= (ControlFlow 0 327) 77) anon206_Then_correct) (=> (= (ControlFlow 0 327) 326) anon206_Else_correct)))))
(let ((anon205_Else_correct  (=> (and (= (MapType0Select Heap@@23 x0@@10 l) null) (= (ControlFlow 0 330) 327)) anon53_correct)))
(let ((anon205_Then_correct  (=> (not (= (MapType0Select Heap@@23 x0@@10 l) null)) (and (=> (= (ControlFlow 0 328) (- 0 329)) (HasDirectPerm QPMask@5 x0@@10 r_1)) (=> (HasDirectPerm QPMask@5 x0@@10 r_1) (=> (= (ControlFlow 0 328) 327) anon53_correct))))))
(let ((anon202_Else_correct  (=> (and (forall ((m_1 T@U) ) (!  (=> (and (= (type m_1) RefType) (U_2_bool (MapType2Select g1@@11 m_1))) (exists_path ($$ Heap@@23 g1@@11) x1@@7 m_1))
 :qid |stdinbpl.10634:20|
 :skolemid |1264|
 :pattern ( (exists_path (|$$#frame| (CombineFrames (FrameFragment (int_2_U (|$$#condqp1| Heap@@23 g1@@11))) (FrameFragment (int_2_U (|$$#condqp2| Heap@@23 g1@@11)))) g1@@11) x1@@7 m_1))
)) (state Heap@@23 QPMask@5)) (and (=> (= (ControlFlow 0 331) (- 0 332)) (HasDirectPerm QPMask@5 x0@@10 l)) (=> (HasDirectPerm QPMask@5 x0@@10 l) (and (=> (= (ControlFlow 0 331) 328) anon205_Then_correct) (=> (= (ControlFlow 0 331) 330) anon205_Else_correct)))))))
(let ((anon204_Then_correct  (and (=> (= (ControlFlow 0 70) (- 0 75)) (forall ((n_10 T@U) ) (!  (=> (= (type n_10) RefType) (=> (and (U_2_bool (MapType2Select g1@@11 n_10)) (dummyFunction (MapType0Select Heap@@23 n_10 l))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.10538:25|
 :skolemid |1250|
 :pattern ( (MapType0Select Heap@@23 n_10 l))
 :pattern ( (MapType1Select QPMask@40 n_10 l))
 :pattern ( (MapType0Select Heap@@23 n_10 l))
))) (=> (forall ((n_10@@0 T@U) ) (!  (=> (= (type n_10@@0) RefType) (=> (and (U_2_bool (MapType2Select g1@@11 n_10@@0)) (dummyFunction (MapType0Select Heap@@23 n_10@@0 l))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.10538:25|
 :skolemid |1250|
 :pattern ( (MapType0Select Heap@@23 n_10@@0 l))
 :pattern ( (MapType1Select QPMask@40 n_10@@0 l))
 :pattern ( (MapType0Select Heap@@23 n_10@@0 l))
)) (and (=> (= (ControlFlow 0 70) (- 0 74)) (forall ((n_10@@1 T@U) (n_10_1 T@U) ) (!  (=> (and (= (type n_10@@1) RefType) (= (type n_10_1) RefType)) (=> (and (and (and (and (not (= n_10@@1 n_10_1)) (U_2_bool (MapType2Select g1@@11 n_10@@1))) (U_2_bool (MapType2Select g1@@11 n_10_1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_10@@1 n_10_1))))
 :qid |stdinbpl.10545:25|
 :skolemid |1251|
 :pattern ( (neverTriggered151 n_10@@1) (neverTriggered151 n_10_1))
))) (=> (forall ((n_10@@2 T@U) (n_10_1@@0 T@U) ) (!  (=> (and (= (type n_10@@2) RefType) (= (type n_10_1@@0) RefType)) (=> (and (and (and (and (not (= n_10@@2 n_10_1@@0)) (U_2_bool (MapType2Select g1@@11 n_10@@2))) (U_2_bool (MapType2Select g1@@11 n_10_1@@0))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_10@@2 n_10_1@@0))))
 :qid |stdinbpl.10545:25|
 :skolemid |1251|
 :pattern ( (neverTriggered151 n_10@@2) (neverTriggered151 n_10_1@@0))
)) (and (=> (= (ControlFlow 0 70) (- 0 73)) (forall ((n_10@@3 T@U) ) (!  (=> (and (= (type n_10@@3) RefType) (U_2_bool (MapType2Select g1@@11 n_10@@3))) (>= (U_2_real (MapType1Select QPMask@5 n_10@@3 l)) (/ (to_real 1) (to_real 2))))
 :qid |stdinbpl.10552:25|
 :skolemid |1252|
 :pattern ( (MapType0Select Heap@@23 n_10@@3 l))
 :pattern ( (MapType1Select QPMask@40 n_10@@3 l))
 :pattern ( (MapType0Select Heap@@23 n_10@@3 l))
))) (=> (forall ((n_10@@4 T@U) ) (!  (=> (and (= (type n_10@@4) RefType) (U_2_bool (MapType2Select g1@@11 n_10@@4))) (>= (U_2_real (MapType1Select QPMask@5 n_10@@4 l)) (/ (to_real 1) (to_real 2))))
 :qid |stdinbpl.10552:25|
 :skolemid |1252|
 :pattern ( (MapType0Select Heap@@23 n_10@@4 l))
 :pattern ( (MapType1Select QPMask@40 n_10@@4 l))
 :pattern ( (MapType0Select Heap@@23 n_10@@4 l))
)) (=> (and (and (forall ((n_10@@5 T@U) ) (!  (=> (= (type n_10@@5) RefType) (=> (and (U_2_bool (MapType2Select g1@@11 n_10@@5)) (< NoPerm (/ (to_real 1) (to_real 2)))) (and (qpRange151 n_10@@5) (= (invRecv151 n_10@@5) n_10@@5))))
 :qid |stdinbpl.10558:30|
 :skolemid |1253|
 :pattern ( (MapType0Select Heap@@23 n_10@@5 l))
 :pattern ( (MapType1Select QPMask@40 n_10@@5 l))
 :pattern ( (MapType0Select Heap@@23 n_10@@5 l))
)) (forall ((o_3@@77 T@U) ) (!  (=> (= (type o_3@@77) RefType) (=> (and (U_2_bool (MapType2Select g1@@11 (invRecv151 o_3@@77))) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange151 o_3@@77))) (= (invRecv151 o_3@@77) o_3@@77)))
 :qid |stdinbpl.10562:30|
 :skolemid |1254|
 :pattern ( (invRecv151 o_3@@77))
))) (and (forall ((o_3@@78 T@U) ) (!  (=> (= (type o_3@@78) RefType) (and (=> (and (U_2_bool (MapType2Select g1@@11 (invRecv151 o_3@@78))) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange151 o_3@@78))) (and (= (invRecv151 o_3@@78) o_3@@78) (= (U_2_real (MapType1Select QPMask@40 o_3@@78 l)) (- (U_2_real (MapType1Select QPMask@5 o_3@@78 l)) (/ (to_real 1) (to_real 2)))))) (=> (not (and (U_2_bool (MapType2Select g1@@11 (invRecv151 o_3@@78))) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange151 o_3@@78)))) (= (U_2_real (MapType1Select QPMask@40 o_3@@78 l)) (U_2_real (MapType1Select QPMask@5 o_3@@78 l))))))
 :qid |stdinbpl.10568:30|
 :skolemid |1255|
 :pattern ( (MapType1Select QPMask@40 o_3@@78 l))
)) (forall ((o_3@@79 T@U) (f_5@@25 T@U) ) (! (let ((B@@37 (FieldTypeInv1 (type f_5@@25))))
(let ((A@@38 (FieldTypeInv0 (type f_5@@25))))
 (=> (and (and (= (type o_3@@79) RefType) (= (type f_5@@25) (FieldType A@@38 B@@37))) (not (= f_5@@25 l))) (= (U_2_real (MapType1Select QPMask@5 o_3@@79 f_5@@25)) (U_2_real (MapType1Select QPMask@40 o_3@@79 f_5@@25))))))
 :qid |stdinbpl.10574:37|
 :skolemid |1256|
 :pattern ( (MapType1Select QPMask@40 o_3@@79 f_5@@25))
)))) (and (=> (= (ControlFlow 0 70) (- 0 72)) (forall ((n_11 T@U) ) (!  (=> (= (type n_11) RefType) (=> (and (U_2_bool (MapType2Select g1@@11 n_11)) (dummyFunction (MapType0Select Heap@@23 n_11 r_1))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.10583:25|
 :skolemid |1257|
 :pattern ( (MapType0Select Heap@@23 n_11 r_1))
 :pattern ( (MapType1Select QPMask@41 n_11 r_1))
 :pattern ( (MapType0Select Heap@@23 n_11 r_1))
))) (=> (forall ((n_11@@0 T@U) ) (!  (=> (= (type n_11@@0) RefType) (=> (and (U_2_bool (MapType2Select g1@@11 n_11@@0)) (dummyFunction (MapType0Select Heap@@23 n_11@@0 r_1))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.10583:25|
 :skolemid |1257|
 :pattern ( (MapType0Select Heap@@23 n_11@@0 r_1))
 :pattern ( (MapType1Select QPMask@41 n_11@@0 r_1))
 :pattern ( (MapType0Select Heap@@23 n_11@@0 r_1))
)) (and (=> (= (ControlFlow 0 70) (- 0 71)) (forall ((n_11@@1 T@U) (n_11_1 T@U) ) (!  (=> (and (= (type n_11@@1) RefType) (= (type n_11_1) RefType)) (=> (and (and (and (and (not (= n_11@@1 n_11_1)) (U_2_bool (MapType2Select g1@@11 n_11@@1))) (U_2_bool (MapType2Select g1@@11 n_11_1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_11@@1 n_11_1))))
 :qid |stdinbpl.10590:25|
 :skolemid |1258|
 :pattern ( (neverTriggered152 n_11@@1) (neverTriggered152 n_11_1))
))) (=> (forall ((n_11@@2 T@U) (n_11_1@@0 T@U) ) (!  (=> (and (= (type n_11@@2) RefType) (= (type n_11_1@@0) RefType)) (=> (and (and (and (and (not (= n_11@@2 n_11_1@@0)) (U_2_bool (MapType2Select g1@@11 n_11@@2))) (U_2_bool (MapType2Select g1@@11 n_11_1@@0))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_11@@2 n_11_1@@0))))
 :qid |stdinbpl.10590:25|
 :skolemid |1258|
 :pattern ( (neverTriggered152 n_11@@2) (neverTriggered152 n_11_1@@0))
)) (=> (= (ControlFlow 0 70) (- 0 69)) (forall ((n_11@@3 T@U) ) (!  (=> (and (= (type n_11@@3) RefType) (U_2_bool (MapType2Select g1@@11 n_11@@3))) (>= (U_2_real (MapType1Select QPMask@40 n_11@@3 r_1)) (/ (to_real 1) (to_real 2))))
 :qid |stdinbpl.10597:25|
 :skolemid |1259|
 :pattern ( (MapType0Select Heap@@23 n_11@@3 r_1))
 :pattern ( (MapType1Select QPMask@41 n_11@@3 r_1))
 :pattern ( (MapType0Select Heap@@23 n_11@@3 r_1))
))))))))))))))))
(let ((anon50_correct true))
(let ((anon203_Then_correct  (=> (U_2_bool (MapType2Select g1@@11 m_2)) (and (=> (= (ControlFlow 0 76) 70) anon204_Then_correct) (=> (= (ControlFlow 0 76) 67) anon50_correct)))))
(let ((anon203_Else_correct  (=> (and (not (U_2_bool (MapType2Select g1@@11 m_2))) (= (ControlFlow 0 68) 67)) anon50_correct)))
(let ((anon199_Else_correct  (=> (forall ((n_9 T@U) ) (!  (=> (and (= (type n_9) RefType) (U_2_bool (MapType2Select g0@@11 n_9))) (exists_path ($$ Heap@@23 g0@@11) n_9 x0@@10))
 :qid |stdinbpl.10520:20|
 :skolemid |1249|
 :pattern ( (exists_path (|$$#frame| (CombineFrames (FrameFragment (int_2_U (|$$#condqp1| Heap@@23 g0@@11))) (FrameFragment (int_2_U (|$$#condqp2| Heap@@23 g0@@11)))) g0@@11) n_9 x0@@10))
)) (=> (and (state Heap@@23 QPMask@5) (state Heap@@23 QPMask@5)) (and (and (=> (= (ControlFlow 0 333) 331) anon202_Else_correct) (=> (= (ControlFlow 0 333) 76) anon203_Then_correct)) (=> (= (ControlFlow 0 333) 68) anon203_Else_correct))))))
(let ((anon201_Then_correct  (and (=> (= (ControlFlow 0 60) (- 0 65)) (forall ((n$0_4 T@U) ) (!  (=> (= (type n$0_4) RefType) (=> (and (U_2_bool (MapType2Select g0@@11 n$0_4)) (dummyFunction (MapType0Select Heap@@23 n$0_4 l))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.10424:25|
 :skolemid |1235|
 :pattern ( (MapType0Select Heap@@23 n$0_4 l))
 :pattern ( (MapType1Select QPMask@42 n$0_4 l))
 :pattern ( (MapType0Select Heap@@23 n$0_4 l))
))) (=> (forall ((n$0_4@@0 T@U) ) (!  (=> (= (type n$0_4@@0) RefType) (=> (and (U_2_bool (MapType2Select g0@@11 n$0_4@@0)) (dummyFunction (MapType0Select Heap@@23 n$0_4@@0 l))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.10424:25|
 :skolemid |1235|
 :pattern ( (MapType0Select Heap@@23 n$0_4@@0 l))
 :pattern ( (MapType1Select QPMask@42 n$0_4@@0 l))
 :pattern ( (MapType0Select Heap@@23 n$0_4@@0 l))
)) (and (=> (= (ControlFlow 0 60) (- 0 64)) (forall ((n$0_4@@1 T@U) (n$0_4_1 T@U) ) (!  (=> (and (= (type n$0_4@@1) RefType) (= (type n$0_4_1) RefType)) (=> (and (and (and (and (not (= n$0_4@@1 n$0_4_1)) (U_2_bool (MapType2Select g0@@11 n$0_4@@1))) (U_2_bool (MapType2Select g0@@11 n$0_4_1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n$0_4@@1 n$0_4_1))))
 :qid |stdinbpl.10431:25|
 :skolemid |1236|
 :pattern ( (neverTriggered149 n$0_4@@1) (neverTriggered149 n$0_4_1))
))) (=> (forall ((n$0_4@@2 T@U) (n$0_4_1@@0 T@U) ) (!  (=> (and (= (type n$0_4@@2) RefType) (= (type n$0_4_1@@0) RefType)) (=> (and (and (and (and (not (= n$0_4@@2 n$0_4_1@@0)) (U_2_bool (MapType2Select g0@@11 n$0_4@@2))) (U_2_bool (MapType2Select g0@@11 n$0_4_1@@0))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n$0_4@@2 n$0_4_1@@0))))
 :qid |stdinbpl.10431:25|
 :skolemid |1236|
 :pattern ( (neverTriggered149 n$0_4@@2) (neverTriggered149 n$0_4_1@@0))
)) (and (=> (= (ControlFlow 0 60) (- 0 63)) (forall ((n$0_4@@3 T@U) ) (!  (=> (and (= (type n$0_4@@3) RefType) (U_2_bool (MapType2Select g0@@11 n$0_4@@3))) (>= (U_2_real (MapType1Select QPMask@5 n$0_4@@3 l)) (/ (to_real 1) (to_real 2))))
 :qid |stdinbpl.10438:25|
 :skolemid |1237|
 :pattern ( (MapType0Select Heap@@23 n$0_4@@3 l))
 :pattern ( (MapType1Select QPMask@42 n$0_4@@3 l))
 :pattern ( (MapType0Select Heap@@23 n$0_4@@3 l))
))) (=> (forall ((n$0_4@@4 T@U) ) (!  (=> (and (= (type n$0_4@@4) RefType) (U_2_bool (MapType2Select g0@@11 n$0_4@@4))) (>= (U_2_real (MapType1Select QPMask@5 n$0_4@@4 l)) (/ (to_real 1) (to_real 2))))
 :qid |stdinbpl.10438:25|
 :skolemid |1237|
 :pattern ( (MapType0Select Heap@@23 n$0_4@@4 l))
 :pattern ( (MapType1Select QPMask@42 n$0_4@@4 l))
 :pattern ( (MapType0Select Heap@@23 n$0_4@@4 l))
)) (=> (and (and (forall ((n$0_4@@5 T@U) ) (!  (=> (= (type n$0_4@@5) RefType) (=> (and (U_2_bool (MapType2Select g0@@11 n$0_4@@5)) (< NoPerm (/ (to_real 1) (to_real 2)))) (and (qpRange149 n$0_4@@5) (= (invRecv149 n$0_4@@5) n$0_4@@5))))
 :qid |stdinbpl.10444:30|
 :skolemid |1238|
 :pattern ( (MapType0Select Heap@@23 n$0_4@@5 l))
 :pattern ( (MapType1Select QPMask@42 n$0_4@@5 l))
 :pattern ( (MapType0Select Heap@@23 n$0_4@@5 l))
)) (forall ((o_3@@80 T@U) ) (!  (=> (= (type o_3@@80) RefType) (=> (and (U_2_bool (MapType2Select g0@@11 (invRecv149 o_3@@80))) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange149 o_3@@80))) (= (invRecv149 o_3@@80) o_3@@80)))
 :qid |stdinbpl.10448:30|
 :skolemid |1239|
 :pattern ( (invRecv149 o_3@@80))
))) (and (forall ((o_3@@81 T@U) ) (!  (=> (= (type o_3@@81) RefType) (and (=> (and (U_2_bool (MapType2Select g0@@11 (invRecv149 o_3@@81))) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange149 o_3@@81))) (and (= (invRecv149 o_3@@81) o_3@@81) (= (U_2_real (MapType1Select QPMask@42 o_3@@81 l)) (- (U_2_real (MapType1Select QPMask@5 o_3@@81 l)) (/ (to_real 1) (to_real 2)))))) (=> (not (and (U_2_bool (MapType2Select g0@@11 (invRecv149 o_3@@81))) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange149 o_3@@81)))) (= (U_2_real (MapType1Select QPMask@42 o_3@@81 l)) (U_2_real (MapType1Select QPMask@5 o_3@@81 l))))))
 :qid |stdinbpl.10454:30|
 :skolemid |1240|
 :pattern ( (MapType1Select QPMask@42 o_3@@81 l))
)) (forall ((o_3@@82 T@U) (f_5@@26 T@U) ) (! (let ((B@@38 (FieldTypeInv1 (type f_5@@26))))
(let ((A@@39 (FieldTypeInv0 (type f_5@@26))))
 (=> (and (and (= (type o_3@@82) RefType) (= (type f_5@@26) (FieldType A@@39 B@@38))) (not (= f_5@@26 l))) (= (U_2_real (MapType1Select QPMask@5 o_3@@82 f_5@@26)) (U_2_real (MapType1Select QPMask@42 o_3@@82 f_5@@26))))))
 :qid |stdinbpl.10460:37|
 :skolemid |1241|
 :pattern ( (MapType1Select QPMask@42 o_3@@82 f_5@@26))
)))) (and (=> (= (ControlFlow 0 60) (- 0 62)) (forall ((n$0_5 T@U) ) (!  (=> (= (type n$0_5) RefType) (=> (and (U_2_bool (MapType2Select g0@@11 n$0_5)) (dummyFunction (MapType0Select Heap@@23 n$0_5 r_1))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.10469:25|
 :skolemid |1242|
 :pattern ( (MapType0Select Heap@@23 n$0_5 r_1))
 :pattern ( (MapType1Select QPMask@43 n$0_5 r_1))
 :pattern ( (MapType0Select Heap@@23 n$0_5 r_1))
))) (=> (forall ((n$0_5@@0 T@U) ) (!  (=> (= (type n$0_5@@0) RefType) (=> (and (U_2_bool (MapType2Select g0@@11 n$0_5@@0)) (dummyFunction (MapType0Select Heap@@23 n$0_5@@0 r_1))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.10469:25|
 :skolemid |1242|
 :pattern ( (MapType0Select Heap@@23 n$0_5@@0 r_1))
 :pattern ( (MapType1Select QPMask@43 n$0_5@@0 r_1))
 :pattern ( (MapType0Select Heap@@23 n$0_5@@0 r_1))
)) (and (=> (= (ControlFlow 0 60) (- 0 61)) (forall ((n$0_5@@1 T@U) (n$0_5_1 T@U) ) (!  (=> (and (= (type n$0_5@@1) RefType) (= (type n$0_5_1) RefType)) (=> (and (and (and (and (not (= n$0_5@@1 n$0_5_1)) (U_2_bool (MapType2Select g0@@11 n$0_5@@1))) (U_2_bool (MapType2Select g0@@11 n$0_5_1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n$0_5@@1 n$0_5_1))))
 :qid |stdinbpl.10476:25|
 :skolemid |1243|
 :pattern ( (neverTriggered150 n$0_5@@1) (neverTriggered150 n$0_5_1))
))) (=> (forall ((n$0_5@@2 T@U) (n$0_5_1@@0 T@U) ) (!  (=> (and (= (type n$0_5@@2) RefType) (= (type n$0_5_1@@0) RefType)) (=> (and (and (and (and (not (= n$0_5@@2 n$0_5_1@@0)) (U_2_bool (MapType2Select g0@@11 n$0_5@@2))) (U_2_bool (MapType2Select g0@@11 n$0_5_1@@0))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n$0_5@@2 n$0_5_1@@0))))
 :qid |stdinbpl.10476:25|
 :skolemid |1243|
 :pattern ( (neverTriggered150 n$0_5@@2) (neverTriggered150 n$0_5_1@@0))
)) (=> (= (ControlFlow 0 60) (- 0 59)) (forall ((n$0_5@@3 T@U) ) (!  (=> (and (= (type n$0_5@@3) RefType) (U_2_bool (MapType2Select g0@@11 n$0_5@@3))) (>= (U_2_real (MapType1Select QPMask@42 n$0_5@@3 r_1)) (/ (to_real 1) (to_real 2))))
 :qid |stdinbpl.10483:25|
 :skolemid |1244|
 :pattern ( (MapType0Select Heap@@23 n$0_5@@3 r_1))
 :pattern ( (MapType1Select QPMask@43 n$0_5@@3 r_1))
 :pattern ( (MapType0Select Heap@@23 n$0_5@@3 r_1))
))))))))))))))))
(let ((anon45_correct true))
(let ((anon200_Then_correct  (=> (U_2_bool (MapType2Select g0@@11 n_39)) (and (=> (= (ControlFlow 0 66) 60) anon201_Then_correct) (=> (= (ControlFlow 0 66) 57) anon45_correct)))))
(let ((anon200_Else_correct  (=> (and (not (U_2_bool (MapType2Select g0@@11 n_39))) (= (ControlFlow 0 58) 57)) anon45_correct)))
(let ((anon196_Else_correct  (=> (forall ((n_7 T@U) ) (!  (=> (and (= (type n_7) RefType) (U_2_bool (MapType2Select g0@@11 n_7))) (exists_path ($$ Heap@@23 g0@@11) x_1@@0 n_7))
 :qid |stdinbpl.10406:20|
 :skolemid |1234|
 :pattern ( (exists_path (|$$#frame| (CombineFrames (FrameFragment (int_2_U (|$$#condqp1| Heap@@23 g0@@11))) (FrameFragment (int_2_U (|$$#condqp2| Heap@@23 g0@@11)))) g0@@11) x_1@@0 n_7))
)) (=> (and (state Heap@@23 QPMask@5) (state Heap@@23 QPMask@5)) (and (and (=> (= (ControlFlow 0 334) 333) anon199_Else_correct) (=> (= (ControlFlow 0 334) 66) anon200_Then_correct)) (=> (= (ControlFlow 0 334) 58) anon200_Else_correct))))))
(let ((anon198_Then_correct  (and (=> (= (ControlFlow 0 50) (- 0 55)) (forall ((n$0_2 T@U) ) (!  (=> (= (type n$0_2) RefType) (=> (and (U_2_bool (MapType2Select g0@@11 n$0_2)) (dummyFunction (MapType0Select Heap@@23 n$0_2 l))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.10310:25|
 :skolemid |1220|
 :pattern ( (MapType0Select Heap@@23 n$0_2 l))
 :pattern ( (MapType1Select QPMask@44 n$0_2 l))
 :pattern ( (MapType0Select Heap@@23 n$0_2 l))
))) (=> (forall ((n$0_2@@0 T@U) ) (!  (=> (= (type n$0_2@@0) RefType) (=> (and (U_2_bool (MapType2Select g0@@11 n$0_2@@0)) (dummyFunction (MapType0Select Heap@@23 n$0_2@@0 l))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.10310:25|
 :skolemid |1220|
 :pattern ( (MapType0Select Heap@@23 n$0_2@@0 l))
 :pattern ( (MapType1Select QPMask@44 n$0_2@@0 l))
 :pattern ( (MapType0Select Heap@@23 n$0_2@@0 l))
)) (and (=> (= (ControlFlow 0 50) (- 0 54)) (forall ((n$0_2@@1 T@U) (n$0_2_1 T@U) ) (!  (=> (and (= (type n$0_2@@1) RefType) (= (type n$0_2_1) RefType)) (=> (and (and (and (and (not (= n$0_2@@1 n$0_2_1)) (U_2_bool (MapType2Select g0@@11 n$0_2@@1))) (U_2_bool (MapType2Select g0@@11 n$0_2_1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n$0_2@@1 n$0_2_1))))
 :qid |stdinbpl.10317:25|
 :skolemid |1221|
 :pattern ( (neverTriggered147 n$0_2@@1) (neverTriggered147 n$0_2_1))
))) (=> (forall ((n$0_2@@2 T@U) (n$0_2_1@@0 T@U) ) (!  (=> (and (= (type n$0_2@@2) RefType) (= (type n$0_2_1@@0) RefType)) (=> (and (and (and (and (not (= n$0_2@@2 n$0_2_1@@0)) (U_2_bool (MapType2Select g0@@11 n$0_2@@2))) (U_2_bool (MapType2Select g0@@11 n$0_2_1@@0))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n$0_2@@2 n$0_2_1@@0))))
 :qid |stdinbpl.10317:25|
 :skolemid |1221|
 :pattern ( (neverTriggered147 n$0_2@@2) (neverTriggered147 n$0_2_1@@0))
)) (and (=> (= (ControlFlow 0 50) (- 0 53)) (forall ((n$0_2@@3 T@U) ) (!  (=> (and (= (type n$0_2@@3) RefType) (U_2_bool (MapType2Select g0@@11 n$0_2@@3))) (>= (U_2_real (MapType1Select QPMask@5 n$0_2@@3 l)) (/ (to_real 1) (to_real 2))))
 :qid |stdinbpl.10324:25|
 :skolemid |1222|
 :pattern ( (MapType0Select Heap@@23 n$0_2@@3 l))
 :pattern ( (MapType1Select QPMask@44 n$0_2@@3 l))
 :pattern ( (MapType0Select Heap@@23 n$0_2@@3 l))
))) (=> (forall ((n$0_2@@4 T@U) ) (!  (=> (and (= (type n$0_2@@4) RefType) (U_2_bool (MapType2Select g0@@11 n$0_2@@4))) (>= (U_2_real (MapType1Select QPMask@5 n$0_2@@4 l)) (/ (to_real 1) (to_real 2))))
 :qid |stdinbpl.10324:25|
 :skolemid |1222|
 :pattern ( (MapType0Select Heap@@23 n$0_2@@4 l))
 :pattern ( (MapType1Select QPMask@44 n$0_2@@4 l))
 :pattern ( (MapType0Select Heap@@23 n$0_2@@4 l))
)) (=> (and (and (forall ((n$0_2@@5 T@U) ) (!  (=> (= (type n$0_2@@5) RefType) (=> (and (U_2_bool (MapType2Select g0@@11 n$0_2@@5)) (< NoPerm (/ (to_real 1) (to_real 2)))) (and (qpRange147 n$0_2@@5) (= (invRecv147 n$0_2@@5) n$0_2@@5))))
 :qid |stdinbpl.10330:30|
 :skolemid |1223|
 :pattern ( (MapType0Select Heap@@23 n$0_2@@5 l))
 :pattern ( (MapType1Select QPMask@44 n$0_2@@5 l))
 :pattern ( (MapType0Select Heap@@23 n$0_2@@5 l))
)) (forall ((o_3@@83 T@U) ) (!  (=> (= (type o_3@@83) RefType) (=> (and (U_2_bool (MapType2Select g0@@11 (invRecv147 o_3@@83))) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange147 o_3@@83))) (= (invRecv147 o_3@@83) o_3@@83)))
 :qid |stdinbpl.10334:30|
 :skolemid |1224|
 :pattern ( (invRecv147 o_3@@83))
))) (and (forall ((o_3@@84 T@U) ) (!  (=> (= (type o_3@@84) RefType) (and (=> (and (U_2_bool (MapType2Select g0@@11 (invRecv147 o_3@@84))) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange147 o_3@@84))) (and (= (invRecv147 o_3@@84) o_3@@84) (= (U_2_real (MapType1Select QPMask@44 o_3@@84 l)) (- (U_2_real (MapType1Select QPMask@5 o_3@@84 l)) (/ (to_real 1) (to_real 2)))))) (=> (not (and (U_2_bool (MapType2Select g0@@11 (invRecv147 o_3@@84))) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange147 o_3@@84)))) (= (U_2_real (MapType1Select QPMask@44 o_3@@84 l)) (U_2_real (MapType1Select QPMask@5 o_3@@84 l))))))
 :qid |stdinbpl.10340:30|
 :skolemid |1225|
 :pattern ( (MapType1Select QPMask@44 o_3@@84 l))
)) (forall ((o_3@@85 T@U) (f_5@@27 T@U) ) (! (let ((B@@39 (FieldTypeInv1 (type f_5@@27))))
(let ((A@@40 (FieldTypeInv0 (type f_5@@27))))
 (=> (and (and (= (type o_3@@85) RefType) (= (type f_5@@27) (FieldType A@@40 B@@39))) (not (= f_5@@27 l))) (= (U_2_real (MapType1Select QPMask@5 o_3@@85 f_5@@27)) (U_2_real (MapType1Select QPMask@44 o_3@@85 f_5@@27))))))
 :qid |stdinbpl.10346:37|
 :skolemid |1226|
 :pattern ( (MapType1Select QPMask@44 o_3@@85 f_5@@27))
)))) (and (=> (= (ControlFlow 0 50) (- 0 52)) (forall ((n$0_3 T@U) ) (!  (=> (= (type n$0_3) RefType) (=> (and (U_2_bool (MapType2Select g0@@11 n$0_3)) (dummyFunction (MapType0Select Heap@@23 n$0_3 r_1))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.10355:25|
 :skolemid |1227|
 :pattern ( (MapType0Select Heap@@23 n$0_3 r_1))
 :pattern ( (MapType1Select QPMask@45 n$0_3 r_1))
 :pattern ( (MapType0Select Heap@@23 n$0_3 r_1))
))) (=> (forall ((n$0_3@@0 T@U) ) (!  (=> (= (type n$0_3@@0) RefType) (=> (and (U_2_bool (MapType2Select g0@@11 n$0_3@@0)) (dummyFunction (MapType0Select Heap@@23 n$0_3@@0 r_1))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.10355:25|
 :skolemid |1227|
 :pattern ( (MapType0Select Heap@@23 n$0_3@@0 r_1))
 :pattern ( (MapType1Select QPMask@45 n$0_3@@0 r_1))
 :pattern ( (MapType0Select Heap@@23 n$0_3@@0 r_1))
)) (and (=> (= (ControlFlow 0 50) (- 0 51)) (forall ((n$0_3@@1 T@U) (n$0_3_1 T@U) ) (!  (=> (and (= (type n$0_3@@1) RefType) (= (type n$0_3_1) RefType)) (=> (and (and (and (and (not (= n$0_3@@1 n$0_3_1)) (U_2_bool (MapType2Select g0@@11 n$0_3@@1))) (U_2_bool (MapType2Select g0@@11 n$0_3_1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n$0_3@@1 n$0_3_1))))
 :qid |stdinbpl.10362:25|
 :skolemid |1228|
 :pattern ( (neverTriggered148 n$0_3@@1) (neverTriggered148 n$0_3_1))
))) (=> (forall ((n$0_3@@2 T@U) (n$0_3_1@@0 T@U) ) (!  (=> (and (= (type n$0_3@@2) RefType) (= (type n$0_3_1@@0) RefType)) (=> (and (and (and (and (not (= n$0_3@@2 n$0_3_1@@0)) (U_2_bool (MapType2Select g0@@11 n$0_3@@2))) (U_2_bool (MapType2Select g0@@11 n$0_3_1@@0))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n$0_3@@2 n$0_3_1@@0))))
 :qid |stdinbpl.10362:25|
 :skolemid |1228|
 :pattern ( (neverTriggered148 n$0_3@@2) (neverTriggered148 n$0_3_1@@0))
)) (=> (= (ControlFlow 0 50) (- 0 49)) (forall ((n$0_3@@3 T@U) ) (!  (=> (and (= (type n$0_3@@3) RefType) (U_2_bool (MapType2Select g0@@11 n$0_3@@3))) (>= (U_2_real (MapType1Select QPMask@44 n$0_3@@3 r_1)) (/ (to_real 1) (to_real 2))))
 :qid |stdinbpl.10369:25|
 :skolemid |1229|
 :pattern ( (MapType0Select Heap@@23 n$0_3@@3 r_1))
 :pattern ( (MapType1Select QPMask@45 n$0_3@@3 r_1))
 :pattern ( (MapType0Select Heap@@23 n$0_3@@3 r_1))
))))))))))))))))
(let ((anon40_correct true))
(let ((anon197_Then_correct  (=> (U_2_bool (MapType2Select g0@@11 n_38)) (and (=> (= (ControlFlow 0 56) 50) anon198_Then_correct) (=> (= (ControlFlow 0 56) 47) anon40_correct)))))
(let ((anon197_Else_correct  (=> (and (not (U_2_bool (MapType2Select g0@@11 n_38))) (= (ControlFlow 0 48) 47)) anon40_correct)))
(let ((anon195_Else_correct  (=> (acyclic_graph ($$ Heap@@23 g1@@11)) (=> (and (and (state Heap@@23 QPMask@5) (U_2_bool (MapType2Select g1@@11 x1@@7))) (and (state Heap@@23 QPMask@5) (state Heap@@23 QPMask@5))) (and (and (=> (= (ControlFlow 0 335) 334) anon196_Else_correct) (=> (= (ControlFlow 0 335) 56) anon197_Then_correct)) (=> (= (ControlFlow 0 335) 48) anon197_Else_correct))))))
(let ((anon195_Then_correct  (and (=> (= (ControlFlow 0 41) (- 0 46)) (forall ((n_4 T@U) ) (!  (=> (= (type n_4) RefType) (=> (and (U_2_bool (MapType2Select g1@@11 n_4)) (dummyFunction (MapType0Select Heap@@23 n_4 l))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.10200:21|
 :skolemid |1206|
 :pattern ( (MapType0Select Heap@@23 n_4 l))
 :pattern ( (MapType1Select QPMask@6 n_4 l))
 :pattern ( (MapType0Select Heap@@23 n_4 l))
))) (=> (forall ((n_4@@0 T@U) ) (!  (=> (= (type n_4@@0) RefType) (=> (and (U_2_bool (MapType2Select g1@@11 n_4@@0)) (dummyFunction (MapType0Select Heap@@23 n_4@@0 l))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.10200:21|
 :skolemid |1206|
 :pattern ( (MapType0Select Heap@@23 n_4@@0 l))
 :pattern ( (MapType1Select QPMask@6 n_4@@0 l))
 :pattern ( (MapType0Select Heap@@23 n_4@@0 l))
)) (and (=> (= (ControlFlow 0 41) (- 0 45)) (forall ((n_4@@1 T@U) (n_4_1 T@U) ) (!  (=> (and (= (type n_4@@1) RefType) (= (type n_4_1) RefType)) (=> (and (and (and (and (not (= n_4@@1 n_4_1)) (U_2_bool (MapType2Select g1@@11 n_4@@1))) (U_2_bool (MapType2Select g1@@11 n_4_1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_4@@1 n_4_1))))
 :qid |stdinbpl.10207:21|
 :skolemid |1207|
 :pattern ( (neverTriggered145 n_4@@1) (neverTriggered145 n_4_1))
))) (=> (forall ((n_4@@2 T@U) (n_4_1@@0 T@U) ) (!  (=> (and (= (type n_4@@2) RefType) (= (type n_4_1@@0) RefType)) (=> (and (and (and (and (not (= n_4@@2 n_4_1@@0)) (U_2_bool (MapType2Select g1@@11 n_4@@2))) (U_2_bool (MapType2Select g1@@11 n_4_1@@0))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_4@@2 n_4_1@@0))))
 :qid |stdinbpl.10207:21|
 :skolemid |1207|
 :pattern ( (neverTriggered145 n_4@@2) (neverTriggered145 n_4_1@@0))
)) (and (=> (= (ControlFlow 0 41) (- 0 44)) (forall ((n_4@@3 T@U) ) (!  (=> (and (= (type n_4@@3) RefType) (U_2_bool (MapType2Select g1@@11 n_4@@3))) (>= (U_2_real (MapType1Select QPMask@5 n_4@@3 l)) (/ (to_real 1) (to_real 2))))
 :qid |stdinbpl.10214:21|
 :skolemid |1208|
 :pattern ( (MapType0Select Heap@@23 n_4@@3 l))
 :pattern ( (MapType1Select QPMask@6 n_4@@3 l))
 :pattern ( (MapType0Select Heap@@23 n_4@@3 l))
))) (=> (forall ((n_4@@4 T@U) ) (!  (=> (and (= (type n_4@@4) RefType) (U_2_bool (MapType2Select g1@@11 n_4@@4))) (>= (U_2_real (MapType1Select QPMask@5 n_4@@4 l)) (/ (to_real 1) (to_real 2))))
 :qid |stdinbpl.10214:21|
 :skolemid |1208|
 :pattern ( (MapType0Select Heap@@23 n_4@@4 l))
 :pattern ( (MapType1Select QPMask@6 n_4@@4 l))
 :pattern ( (MapType0Select Heap@@23 n_4@@4 l))
)) (=> (and (and (forall ((n_4@@5 T@U) ) (!  (=> (= (type n_4@@5) RefType) (=> (and (U_2_bool (MapType2Select g1@@11 n_4@@5)) (< NoPerm (/ (to_real 1) (to_real 2)))) (and (qpRange145 n_4@@5) (= (invRecv145 n_4@@5) n_4@@5))))
 :qid |stdinbpl.10220:26|
 :skolemid |1209|
 :pattern ( (MapType0Select Heap@@23 n_4@@5 l))
 :pattern ( (MapType1Select QPMask@6 n_4@@5 l))
 :pattern ( (MapType0Select Heap@@23 n_4@@5 l))
)) (forall ((o_3@@86 T@U) ) (!  (=> (= (type o_3@@86) RefType) (=> (and (U_2_bool (MapType2Select g1@@11 (invRecv145 o_3@@86))) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange145 o_3@@86))) (= (invRecv145 o_3@@86) o_3@@86)))
 :qid |stdinbpl.10224:26|
 :skolemid |1210|
 :pattern ( (invRecv145 o_3@@86))
))) (and (forall ((o_3@@87 T@U) ) (!  (=> (= (type o_3@@87) RefType) (and (=> (and (U_2_bool (MapType2Select g1@@11 (invRecv145 o_3@@87))) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange145 o_3@@87))) (and (= (invRecv145 o_3@@87) o_3@@87) (= (U_2_real (MapType1Select QPMask@6 o_3@@87 l)) (- (U_2_real (MapType1Select QPMask@5 o_3@@87 l)) (/ (to_real 1) (to_real 2)))))) (=> (not (and (U_2_bool (MapType2Select g1@@11 (invRecv145 o_3@@87))) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange145 o_3@@87)))) (= (U_2_real (MapType1Select QPMask@6 o_3@@87 l)) (U_2_real (MapType1Select QPMask@5 o_3@@87 l))))))
 :qid |stdinbpl.10230:26|
 :skolemid |1211|
 :pattern ( (MapType1Select QPMask@6 o_3@@87 l))
)) (forall ((o_3@@88 T@U) (f_5@@28 T@U) ) (! (let ((B@@40 (FieldTypeInv1 (type f_5@@28))))
(let ((A@@41 (FieldTypeInv0 (type f_5@@28))))
 (=> (and (and (= (type o_3@@88) RefType) (= (type f_5@@28) (FieldType A@@41 B@@40))) (not (= f_5@@28 l))) (= (U_2_real (MapType1Select QPMask@5 o_3@@88 f_5@@28)) (U_2_real (MapType1Select QPMask@6 o_3@@88 f_5@@28))))))
 :qid |stdinbpl.10236:33|
 :skolemid |1212|
 :pattern ( (MapType1Select QPMask@6 o_3@@88 f_5@@28))
)))) (and (=> (= (ControlFlow 0 41) (- 0 43)) (forall ((n_5 T@U) ) (!  (=> (= (type n_5) RefType) (=> (and (U_2_bool (MapType2Select g1@@11 n_5)) (dummyFunction (MapType0Select Heap@@23 n_5 r_1))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.10245:21|
 :skolemid |1213|
 :pattern ( (MapType0Select Heap@@23 n_5 r_1))
 :pattern ( (MapType1Select QPMask@7 n_5 r_1))
 :pattern ( (MapType0Select Heap@@23 n_5 r_1))
))) (=> (forall ((n_5@@0 T@U) ) (!  (=> (= (type n_5@@0) RefType) (=> (and (U_2_bool (MapType2Select g1@@11 n_5@@0)) (dummyFunction (MapType0Select Heap@@23 n_5@@0 r_1))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.10245:21|
 :skolemid |1213|
 :pattern ( (MapType0Select Heap@@23 n_5@@0 r_1))
 :pattern ( (MapType1Select QPMask@7 n_5@@0 r_1))
 :pattern ( (MapType0Select Heap@@23 n_5@@0 r_1))
)) (and (=> (= (ControlFlow 0 41) (- 0 42)) (forall ((n_5@@1 T@U) (n_5_1 T@U) ) (!  (=> (and (= (type n_5@@1) RefType) (= (type n_5_1) RefType)) (=> (and (and (and (and (not (= n_5@@1 n_5_1)) (U_2_bool (MapType2Select g1@@11 n_5@@1))) (U_2_bool (MapType2Select g1@@11 n_5_1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_5@@1 n_5_1))))
 :qid |stdinbpl.10252:21|
 :skolemid |1214|
 :pattern ( (neverTriggered146 n_5@@1) (neverTriggered146 n_5_1))
))) (=> (forall ((n_5@@2 T@U) (n_5_1@@0 T@U) ) (!  (=> (and (= (type n_5@@2) RefType) (= (type n_5_1@@0) RefType)) (=> (and (and (and (and (not (= n_5@@2 n_5_1@@0)) (U_2_bool (MapType2Select g1@@11 n_5@@2))) (U_2_bool (MapType2Select g1@@11 n_5_1@@0))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_5@@2 n_5_1@@0))))
 :qid |stdinbpl.10252:21|
 :skolemid |1214|
 :pattern ( (neverTriggered146 n_5@@2) (neverTriggered146 n_5_1@@0))
)) (=> (= (ControlFlow 0 41) (- 0 40)) (forall ((n_5@@3 T@U) ) (!  (=> (and (= (type n_5@@3) RefType) (U_2_bool (MapType2Select g1@@11 n_5@@3))) (>= (U_2_real (MapType1Select QPMask@6 n_5@@3 r_1)) (/ (to_real 1) (to_real 2))))
 :qid |stdinbpl.10259:21|
 :skolemid |1215|
 :pattern ( (MapType0Select Heap@@23 n_5@@3 r_1))
 :pattern ( (MapType1Select QPMask@7 n_5@@3 r_1))
 :pattern ( (MapType0Select Heap@@23 n_5@@3 r_1))
))))))))))))))))
(let ((anon192_Else_correct  (=> (forall ((n$6_1 T@U) ) (!  (=> (= (type n$6_1) RefType) (=> (and (U_2_bool (MapType2Select g1@@11 n$6_1)) (not (= (MapType0Select Heap@@23 n$6_1 r_1) null))) (U_2_bool (MapType2Select g1@@11 (MapType0Select Heap@@23 n$6_1 r_1)))))
 :qid |stdinbpl.10184:20|
 :skolemid |1205|
 :pattern ( (MapType2Select g1@@11 (MapType0Select Heap@@23 n$6_1 r_1)))
 :pattern ( (MapType2Select g1@@11 n$6_1) (MapType0Select Heap@@23 n$6_1 r_1))
)) (=> (and (state Heap@@23 QPMask@5) (state Heap@@23 QPMask@5)) (and (=> (= (ControlFlow 0 336) 41) anon195_Then_correct) (=> (= (ControlFlow 0 336) 335) anon195_Else_correct))))))
(let ((anon33_correct true))
(let ((anon194_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select g1@@11 n$6_7)) (not (= (MapType0Select Heap@@23 n$6_7 r_1) null)))) (= (ControlFlow 0 36) 33)) anon33_correct)))
(let ((anon194_Then_correct  (=> (and (U_2_bool (MapType2Select g1@@11 n$6_7)) (not (= (MapType0Select Heap@@23 n$6_7 r_1) null))) (and (=> (= (ControlFlow 0 34) (- 0 35)) (HasDirectPerm QPMask@5 n$6_7 r_1)) (=> (HasDirectPerm QPMask@5 n$6_7 r_1) (=> (= (ControlFlow 0 34) 33) anon33_correct))))))
(let ((anon193_Else_correct  (=> (not (U_2_bool (MapType2Select g1@@11 n$6_7))) (and (=> (= (ControlFlow 0 39) 34) anon194_Then_correct) (=> (= (ControlFlow 0 39) 36) anon194_Else_correct)))))
(let ((anon193_Then_correct  (=> (U_2_bool (MapType2Select g1@@11 n$6_7)) (and (=> (= (ControlFlow 0 37) (- 0 38)) (HasDirectPerm QPMask@5 n$6_7 r_1)) (=> (HasDirectPerm QPMask@5 n$6_7 r_1) (and (=> (= (ControlFlow 0 37) 34) anon194_Then_correct) (=> (= (ControlFlow 0 37) 36) anon194_Else_correct)))))))
(let ((anon189_Else_correct  (=> (forall ((n$5_1 T@U) ) (!  (=> (= (type n$5_1) RefType) (=> (and (U_2_bool (MapType2Select g1@@11 n$5_1)) (not (= (MapType0Select Heap@@23 n$5_1 l) null))) (U_2_bool (MapType2Select g1@@11 (MapType0Select Heap@@23 n$5_1 l)))))
 :qid |stdinbpl.10167:20|
 :skolemid |1204|
 :pattern ( (MapType2Select g1@@11 (MapType0Select Heap@@23 n$5_1 l)))
 :pattern ( (MapType2Select g1@@11 n$5_1) (MapType0Select Heap@@23 n$5_1 l))
)) (and (and (=> (= (ControlFlow 0 337) 336) anon192_Else_correct) (=> (= (ControlFlow 0 337) 37) anon193_Then_correct)) (=> (= (ControlFlow 0 337) 39) anon193_Else_correct)))))
(let ((anon27_correct true))
(let ((anon191_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select g1@@11 n$5_7)) (not (= (MapType0Select Heap@@23 n$5_7 l) null)))) (= (ControlFlow 0 29) 26)) anon27_correct)))
(let ((anon191_Then_correct  (=> (and (U_2_bool (MapType2Select g1@@11 n$5_7)) (not (= (MapType0Select Heap@@23 n$5_7 l) null))) (and (=> (= (ControlFlow 0 27) (- 0 28)) (HasDirectPerm QPMask@5 n$5_7 l)) (=> (HasDirectPerm QPMask@5 n$5_7 l) (=> (= (ControlFlow 0 27) 26) anon27_correct))))))
(let ((anon190_Else_correct  (=> (not (U_2_bool (MapType2Select g1@@11 n$5_7))) (and (=> (= (ControlFlow 0 32) 27) anon191_Then_correct) (=> (= (ControlFlow 0 32) 29) anon191_Else_correct)))))
(let ((anon190_Then_correct  (=> (U_2_bool (MapType2Select g1@@11 n$5_7)) (and (=> (= (ControlFlow 0 30) (- 0 31)) (HasDirectPerm QPMask@5 n$5_7 l)) (=> (HasDirectPerm QPMask@5 n$5_7 l) (and (=> (= (ControlFlow 0 30) 27) anon191_Then_correct) (=> (= (ControlFlow 0 30) 29) anon191_Else_correct)))))))
(let ((anon188_Else_correct  (and (=> (= (ControlFlow 0 338) (- 0 339)) (forall ((n$4_1 T@U) (n$4_1_1 T@U) ) (!  (=> (and (= (type n$4_1) RefType) (= (type n$4_1_1) RefType)) (=> (and (and (and (and (not (= n$4_1 n$4_1_1)) (U_2_bool (MapType2Select g1@@11 n$4_1))) (U_2_bool (MapType2Select g1@@11 n$4_1_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$4_1 n$4_1_1))))
 :qid |stdinbpl.10122:15|
 :skolemid |1198|
 :no-pattern (type n$4_1)
 :no-pattern (type n$4_1_1)
 :no-pattern (U_2_int n$4_1)
 :no-pattern (U_2_bool n$4_1)
 :no-pattern (U_2_int n$4_1_1)
 :no-pattern (U_2_bool n$4_1_1)
))) (=> (forall ((n$4_1@@0 T@U) (n$4_1_1@@0 T@U) ) (!  (=> (and (= (type n$4_1@@0) RefType) (= (type n$4_1_1@@0) RefType)) (=> (and (and (and (and (not (= n$4_1@@0 n$4_1_1@@0)) (U_2_bool (MapType2Select g1@@11 n$4_1@@0))) (U_2_bool (MapType2Select g1@@11 n$4_1_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$4_1@@0 n$4_1_1@@0))))
 :qid |stdinbpl.10122:15|
 :skolemid |1198|
 :no-pattern (type n$4_1@@0)
 :no-pattern (type n$4_1_1@@0)
 :no-pattern (U_2_int n$4_1@@0)
 :no-pattern (U_2_bool n$4_1@@0)
 :no-pattern (U_2_int n$4_1_1@@0)
 :no-pattern (U_2_bool n$4_1_1@@0)
)) (=> (and (forall ((n$4_1@@1 T@U) ) (!  (=> (= (type n$4_1@@1) RefType) (=> (and (U_2_bool (MapType2Select g1@@11 n$4_1@@1)) (< NoPerm FullPerm)) (and (qpRange144 n$4_1@@1) (= (invRecv144 n$4_1@@1) n$4_1@@1))))
 :qid |stdinbpl.10128:22|
 :skolemid |1199|
 :pattern ( (MapType0Select Heap@@23 n$4_1@@1 r_1))
 :pattern ( (MapType1Select QPMask@5 n$4_1@@1 r_1))
 :pattern ( (MapType0Select Heap@@23 n$4_1@@1 r_1))
)) (forall ((o_3@@89 T@U) ) (!  (=> (= (type o_3@@89) RefType) (=> (and (and (U_2_bool (MapType2Select g1@@11 (invRecv144 o_3@@89))) (< NoPerm FullPerm)) (qpRange144 o_3@@89)) (= (invRecv144 o_3@@89) o_3@@89)))
 :qid |stdinbpl.10132:22|
 :skolemid |1200|
 :pattern ( (invRecv144 o_3@@89))
))) (=> (and (and (forall ((n$4_1@@2 T@U) ) (!  (=> (and (= (type n$4_1@@2) RefType) (U_2_bool (MapType2Select g1@@11 n$4_1@@2))) (not (= n$4_1@@2 null)))
 :qid |stdinbpl.10138:22|
 :skolemid |1201|
 :pattern ( (MapType0Select Heap@@23 n$4_1@@2 r_1))
 :pattern ( (MapType1Select QPMask@5 n$4_1@@2 r_1))
 :pattern ( (MapType0Select Heap@@23 n$4_1@@2 r_1))
)) (forall ((o_3@@90 T@U) ) (!  (=> (= (type o_3@@90) RefType) (and (=> (and (and (U_2_bool (MapType2Select g1@@11 (invRecv144 o_3@@90))) (< NoPerm FullPerm)) (qpRange144 o_3@@90)) (and (=> (< NoPerm FullPerm) (= (invRecv144 o_3@@90) o_3@@90)) (= (U_2_real (MapType1Select QPMask@5 o_3@@90 r_1)) (+ (U_2_real (MapType1Select QPMask@4 o_3@@90 r_1)) FullPerm)))) (=> (not (and (and (U_2_bool (MapType2Select g1@@11 (invRecv144 o_3@@90))) (< NoPerm FullPerm)) (qpRange144 o_3@@90))) (= (U_2_real (MapType1Select QPMask@5 o_3@@90 r_1)) (U_2_real (MapType1Select QPMask@4 o_3@@90 r_1))))))
 :qid |stdinbpl.10144:22|
 :skolemid |1202|
 :pattern ( (MapType1Select QPMask@5 o_3@@90 r_1))
))) (and (forall ((o_3@@91 T@U) (f_5@@29 T@U) ) (! (let ((B@@41 (FieldTypeInv1 (type f_5@@29))))
(let ((A@@42 (FieldTypeInv0 (type f_5@@29))))
 (=> (and (and (= (type o_3@@91) RefType) (= (type f_5@@29) (FieldType A@@42 B@@41))) (not (= f_5@@29 r_1))) (= (U_2_real (MapType1Select QPMask@4 o_3@@91 f_5@@29)) (U_2_real (MapType1Select QPMask@5 o_3@@91 f_5@@29))))))
 :qid |stdinbpl.10148:29|
 :skolemid |1203|
 :pattern ( (MapType1Select QPMask@4 o_3@@91 f_5@@29))
 :pattern ( (MapType1Select QPMask@5 o_3@@91 f_5@@29))
)) (state Heap@@23 QPMask@5))) (and (and (=> (= (ControlFlow 0 338) 337) anon189_Else_correct) (=> (= (ControlFlow 0 338) 30) anon190_Then_correct)) (=> (= (ControlFlow 0 338) 32) anon190_Else_correct))))))))
(let ((anon188_Then_correct true))
(let ((anon187_Else_correct  (and (=> (= (ControlFlow 0 340) (- 0 341)) (forall ((n$3_1 T@U) (n$3_1_1 T@U) ) (!  (=> (and (= (type n$3_1) RefType) (= (type n$3_1_1) RefType)) (=> (and (and (and (and (not (= n$3_1 n$3_1_1)) (U_2_bool (MapType2Select g1@@11 n$3_1))) (U_2_bool (MapType2Select g1@@11 n$3_1_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$3_1 n$3_1_1))))
 :qid |stdinbpl.10083:15|
 :skolemid |1192|
 :no-pattern (type n$3_1)
 :no-pattern (type n$3_1_1)
 :no-pattern (U_2_int n$3_1)
 :no-pattern (U_2_bool n$3_1)
 :no-pattern (U_2_int n$3_1_1)
 :no-pattern (U_2_bool n$3_1_1)
))) (=> (forall ((n$3_1@@0 T@U) (n$3_1_1@@0 T@U) ) (!  (=> (and (= (type n$3_1@@0) RefType) (= (type n$3_1_1@@0) RefType)) (=> (and (and (and (and (not (= n$3_1@@0 n$3_1_1@@0)) (U_2_bool (MapType2Select g1@@11 n$3_1@@0))) (U_2_bool (MapType2Select g1@@11 n$3_1_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$3_1@@0 n$3_1_1@@0))))
 :qid |stdinbpl.10083:15|
 :skolemid |1192|
 :no-pattern (type n$3_1@@0)
 :no-pattern (type n$3_1_1@@0)
 :no-pattern (U_2_int n$3_1@@0)
 :no-pattern (U_2_bool n$3_1@@0)
 :no-pattern (U_2_int n$3_1_1@@0)
 :no-pattern (U_2_bool n$3_1_1@@0)
)) (=> (and (forall ((n$3_1@@1 T@U) ) (!  (=> (= (type n$3_1@@1) RefType) (=> (and (U_2_bool (MapType2Select g1@@11 n$3_1@@1)) (< NoPerm FullPerm)) (and (qpRange143 n$3_1@@1) (= (invRecv143 n$3_1@@1) n$3_1@@1))))
 :qid |stdinbpl.10089:22|
 :skolemid |1193|
 :pattern ( (MapType0Select Heap@@23 n$3_1@@1 l))
 :pattern ( (MapType1Select QPMask@4 n$3_1@@1 l))
 :pattern ( (MapType0Select Heap@@23 n$3_1@@1 l))
)) (forall ((o_3@@92 T@U) ) (!  (=> (= (type o_3@@92) RefType) (=> (and (and (U_2_bool (MapType2Select g1@@11 (invRecv143 o_3@@92))) (< NoPerm FullPerm)) (qpRange143 o_3@@92)) (= (invRecv143 o_3@@92) o_3@@92)))
 :qid |stdinbpl.10093:22|
 :skolemid |1194|
 :pattern ( (invRecv143 o_3@@92))
))) (=> (and (and (forall ((n$3_1@@2 T@U) ) (!  (=> (and (= (type n$3_1@@2) RefType) (U_2_bool (MapType2Select g1@@11 n$3_1@@2))) (not (= n$3_1@@2 null)))
 :qid |stdinbpl.10099:22|
 :skolemid |1195|
 :pattern ( (MapType0Select Heap@@23 n$3_1@@2 l))
 :pattern ( (MapType1Select QPMask@4 n$3_1@@2 l))
 :pattern ( (MapType0Select Heap@@23 n$3_1@@2 l))
)) (forall ((o_3@@93 T@U) ) (!  (=> (= (type o_3@@93) RefType) (and (=> (and (and (U_2_bool (MapType2Select g1@@11 (invRecv143 o_3@@93))) (< NoPerm FullPerm)) (qpRange143 o_3@@93)) (and (=> (< NoPerm FullPerm) (= (invRecv143 o_3@@93) o_3@@93)) (= (U_2_real (MapType1Select QPMask@4 o_3@@93 l)) (+ (U_2_real (MapType1Select QPMask@1 o_3@@93 l)) FullPerm)))) (=> (not (and (and (U_2_bool (MapType2Select g1@@11 (invRecv143 o_3@@93))) (< NoPerm FullPerm)) (qpRange143 o_3@@93))) (= (U_2_real (MapType1Select QPMask@4 o_3@@93 l)) (U_2_real (MapType1Select QPMask@1 o_3@@93 l))))))
 :qid |stdinbpl.10105:22|
 :skolemid |1196|
 :pattern ( (MapType1Select QPMask@4 o_3@@93 l))
))) (and (forall ((o_3@@94 T@U) (f_5@@30 T@U) ) (! (let ((B@@42 (FieldTypeInv1 (type f_5@@30))))
(let ((A@@43 (FieldTypeInv0 (type f_5@@30))))
 (=> (and (and (= (type o_3@@94) RefType) (= (type f_5@@30) (FieldType A@@43 B@@42))) (not (= f_5@@30 l))) (= (U_2_real (MapType1Select QPMask@1 o_3@@94 f_5@@30)) (U_2_real (MapType1Select QPMask@4 o_3@@94 f_5@@30))))))
 :qid |stdinbpl.10109:29|
 :skolemid |1197|
 :pattern ( (MapType1Select QPMask@1 o_3@@94 f_5@@30))
 :pattern ( (MapType1Select QPMask@4 o_3@@94 f_5@@30))
)) (state Heap@@23 QPMask@4))) (and (=> (= (ControlFlow 0 340) 25) anon188_Then_correct) (=> (= (ControlFlow 0 340) 338) anon188_Else_correct))))))))
(let ((anon187_Then_correct true))
(let ((anon186_Else_correct  (=> (acyclic_graph ($$ Heap@@23 g0@@11)) (=> (and (state Heap@@23 QPMask@1) (U_2_bool (MapType2Select g0@@11 x0@@10))) (=> (and (and (state Heap@@23 QPMask@1) (U_2_bool (MapType2Select g0@@11 x_1@@0))) (and (state Heap@@23 QPMask@1) (not (U_2_bool (MapType2Select g1@@11 null))))) (and (=> (= (ControlFlow 0 342) 24) anon187_Then_correct) (=> (= (ControlFlow 0 342) 340) anon187_Else_correct)))))))
(let ((anon186_Then_correct  (and (=> (= (ControlFlow 0 18) (- 0 23)) (forall ((n_2 T@U) ) (!  (=> (= (type n_2) RefType) (=> (and (U_2_bool (MapType2Select g0@@11 n_2)) (dummyFunction (MapType0Select Heap@@23 n_2 l))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.9976:21|
 :skolemid |1178|
 :pattern ( (MapType0Select Heap@@23 n_2 l))
 :pattern ( (MapType1Select QPMask@2 n_2 l))
 :pattern ( (MapType0Select Heap@@23 n_2 l))
))) (=> (forall ((n_2@@0 T@U) ) (!  (=> (= (type n_2@@0) RefType) (=> (and (U_2_bool (MapType2Select g0@@11 n_2@@0)) (dummyFunction (MapType0Select Heap@@23 n_2@@0 l))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.9976:21|
 :skolemid |1178|
 :pattern ( (MapType0Select Heap@@23 n_2@@0 l))
 :pattern ( (MapType1Select QPMask@2 n_2@@0 l))
 :pattern ( (MapType0Select Heap@@23 n_2@@0 l))
)) (and (=> (= (ControlFlow 0 18) (- 0 22)) (forall ((n_2@@1 T@U) (n_2_1 T@U) ) (!  (=> (and (= (type n_2@@1) RefType) (= (type n_2_1) RefType)) (=> (and (and (and (and (not (= n_2@@1 n_2_1)) (U_2_bool (MapType2Select g0@@11 n_2@@1))) (U_2_bool (MapType2Select g0@@11 n_2_1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_2@@1 n_2_1))))
 :qid |stdinbpl.9983:21|
 :skolemid |1179|
 :pattern ( (neverTriggered141 n_2@@1) (neverTriggered141 n_2_1))
))) (=> (forall ((n_2@@2 T@U) (n_2_1@@0 T@U) ) (!  (=> (and (= (type n_2@@2) RefType) (= (type n_2_1@@0) RefType)) (=> (and (and (and (and (not (= n_2@@2 n_2_1@@0)) (U_2_bool (MapType2Select g0@@11 n_2@@2))) (U_2_bool (MapType2Select g0@@11 n_2_1@@0))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_2@@2 n_2_1@@0))))
 :qid |stdinbpl.9983:21|
 :skolemid |1179|
 :pattern ( (neverTriggered141 n_2@@2) (neverTriggered141 n_2_1@@0))
)) (and (=> (= (ControlFlow 0 18) (- 0 21)) (forall ((n_2@@3 T@U) ) (!  (=> (and (= (type n_2@@3) RefType) (U_2_bool (MapType2Select g0@@11 n_2@@3))) (>= (U_2_real (MapType1Select QPMask@1 n_2@@3 l)) (/ (to_real 1) (to_real 2))))
 :qid |stdinbpl.9990:21|
 :skolemid |1180|
 :pattern ( (MapType0Select Heap@@23 n_2@@3 l))
 :pattern ( (MapType1Select QPMask@2 n_2@@3 l))
 :pattern ( (MapType0Select Heap@@23 n_2@@3 l))
))) (=> (forall ((n_2@@4 T@U) ) (!  (=> (and (= (type n_2@@4) RefType) (U_2_bool (MapType2Select g0@@11 n_2@@4))) (>= (U_2_real (MapType1Select QPMask@1 n_2@@4 l)) (/ (to_real 1) (to_real 2))))
 :qid |stdinbpl.9990:21|
 :skolemid |1180|
 :pattern ( (MapType0Select Heap@@23 n_2@@4 l))
 :pattern ( (MapType1Select QPMask@2 n_2@@4 l))
 :pattern ( (MapType0Select Heap@@23 n_2@@4 l))
)) (=> (and (and (forall ((n_2@@5 T@U) ) (!  (=> (= (type n_2@@5) RefType) (=> (and (U_2_bool (MapType2Select g0@@11 n_2@@5)) (< NoPerm (/ (to_real 1) (to_real 2)))) (and (qpRange141 n_2@@5) (= (invRecv141 n_2@@5) n_2@@5))))
 :qid |stdinbpl.9996:26|
 :skolemid |1181|
 :pattern ( (MapType0Select Heap@@23 n_2@@5 l))
 :pattern ( (MapType1Select QPMask@2 n_2@@5 l))
 :pattern ( (MapType0Select Heap@@23 n_2@@5 l))
)) (forall ((o_3@@95 T@U) ) (!  (=> (= (type o_3@@95) RefType) (=> (and (U_2_bool (MapType2Select g0@@11 (invRecv141 o_3@@95))) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange141 o_3@@95))) (= (invRecv141 o_3@@95) o_3@@95)))
 :qid |stdinbpl.10000:26|
 :skolemid |1182|
 :pattern ( (invRecv141 o_3@@95))
))) (and (forall ((o_3@@96 T@U) ) (!  (=> (= (type o_3@@96) RefType) (and (=> (and (U_2_bool (MapType2Select g0@@11 (invRecv141 o_3@@96))) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange141 o_3@@96))) (and (= (invRecv141 o_3@@96) o_3@@96) (= (U_2_real (MapType1Select QPMask@2 o_3@@96 l)) (- (U_2_real (MapType1Select QPMask@1 o_3@@96 l)) (/ (to_real 1) (to_real 2)))))) (=> (not (and (U_2_bool (MapType2Select g0@@11 (invRecv141 o_3@@96))) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange141 o_3@@96)))) (= (U_2_real (MapType1Select QPMask@2 o_3@@96 l)) (U_2_real (MapType1Select QPMask@1 o_3@@96 l))))))
 :qid |stdinbpl.10006:26|
 :skolemid |1183|
 :pattern ( (MapType1Select QPMask@2 o_3@@96 l))
)) (forall ((o_3@@97 T@U) (f_5@@31 T@U) ) (! (let ((B@@43 (FieldTypeInv1 (type f_5@@31))))
(let ((A@@44 (FieldTypeInv0 (type f_5@@31))))
 (=> (and (and (= (type o_3@@97) RefType) (= (type f_5@@31) (FieldType A@@44 B@@43))) (not (= f_5@@31 l))) (= (U_2_real (MapType1Select QPMask@1 o_3@@97 f_5@@31)) (U_2_real (MapType1Select QPMask@2 o_3@@97 f_5@@31))))))
 :qid |stdinbpl.10012:33|
 :skolemid |1184|
 :pattern ( (MapType1Select QPMask@2 o_3@@97 f_5@@31))
)))) (and (=> (= (ControlFlow 0 18) (- 0 20)) (forall ((n_3 T@U) ) (!  (=> (= (type n_3) RefType) (=> (and (U_2_bool (MapType2Select g0@@11 n_3)) (dummyFunction (MapType0Select Heap@@23 n_3 r_1))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.10021:21|
 :skolemid |1185|
 :pattern ( (MapType0Select Heap@@23 n_3 r_1))
 :pattern ( (MapType1Select QPMask@3 n_3 r_1))
 :pattern ( (MapType0Select Heap@@23 n_3 r_1))
))) (=> (forall ((n_3@@0 T@U) ) (!  (=> (= (type n_3@@0) RefType) (=> (and (U_2_bool (MapType2Select g0@@11 n_3@@0)) (dummyFunction (MapType0Select Heap@@23 n_3@@0 r_1))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.10021:21|
 :skolemid |1185|
 :pattern ( (MapType0Select Heap@@23 n_3@@0 r_1))
 :pattern ( (MapType1Select QPMask@3 n_3@@0 r_1))
 :pattern ( (MapType0Select Heap@@23 n_3@@0 r_1))
)) (and (=> (= (ControlFlow 0 18) (- 0 19)) (forall ((n_3@@1 T@U) (n_3_1 T@U) ) (!  (=> (and (= (type n_3@@1) RefType) (= (type n_3_1) RefType)) (=> (and (and (and (and (not (= n_3@@1 n_3_1)) (U_2_bool (MapType2Select g0@@11 n_3@@1))) (U_2_bool (MapType2Select g0@@11 n_3_1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_3@@1 n_3_1))))
 :qid |stdinbpl.10028:21|
 :skolemid |1186|
 :pattern ( (neverTriggered142 n_3@@1) (neverTriggered142 n_3_1))
))) (=> (forall ((n_3@@2 T@U) (n_3_1@@0 T@U) ) (!  (=> (and (= (type n_3@@2) RefType) (= (type n_3_1@@0) RefType)) (=> (and (and (and (and (not (= n_3@@2 n_3_1@@0)) (U_2_bool (MapType2Select g0@@11 n_3@@2))) (U_2_bool (MapType2Select g0@@11 n_3_1@@0))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_3@@2 n_3_1@@0))))
 :qid |stdinbpl.10028:21|
 :skolemid |1186|
 :pattern ( (neverTriggered142 n_3@@2) (neverTriggered142 n_3_1@@0))
)) (=> (= (ControlFlow 0 18) (- 0 17)) (forall ((n_3@@3 T@U) ) (!  (=> (and (= (type n_3@@3) RefType) (U_2_bool (MapType2Select g0@@11 n_3@@3))) (>= (U_2_real (MapType1Select QPMask@2 n_3@@3 r_1)) (/ (to_real 1) (to_real 2))))
 :qid |stdinbpl.10035:21|
 :skolemid |1187|
 :pattern ( (MapType0Select Heap@@23 n_3@@3 r_1))
 :pattern ( (MapType1Select QPMask@3 n_3@@3 r_1))
 :pattern ( (MapType0Select Heap@@23 n_3@@3 r_1))
))))))))))))))))
(let ((anon183_Else_correct  (=> (forall ((n$2_1 T@U) ) (!  (=> (= (type n$2_1) RefType) (=> (and (U_2_bool (MapType2Select g0@@11 n$2_1)) (not (= (MapType0Select Heap@@23 n$2_1 r_1) null))) (U_2_bool (MapType2Select g0@@11 (MapType0Select Heap@@23 n$2_1 r_1)))))
 :qid |stdinbpl.9960:20|
 :skolemid |1177|
 :pattern ( (MapType2Select g0@@11 (MapType0Select Heap@@23 n$2_1 r_1)))
 :pattern ( (MapType2Select g0@@11 n$2_1) (MapType0Select Heap@@23 n$2_1 r_1))
)) (=> (and (state Heap@@23 QPMask@1) (state Heap@@23 QPMask@1)) (and (=> (= (ControlFlow 0 343) 18) anon186_Then_correct) (=> (= (ControlFlow 0 343) 342) anon186_Else_correct))))))
(let ((anon15_correct true))
(let ((anon185_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select g0@@11 n$2_6)) (not (= (MapType0Select Heap@@23 n$2_6 r_1) null)))) (= (ControlFlow 0 13) 10)) anon15_correct)))
(let ((anon185_Then_correct  (=> (and (U_2_bool (MapType2Select g0@@11 n$2_6)) (not (= (MapType0Select Heap@@23 n$2_6 r_1) null))) (and (=> (= (ControlFlow 0 11) (- 0 12)) (HasDirectPerm QPMask@1 n$2_6 r_1)) (=> (HasDirectPerm QPMask@1 n$2_6 r_1) (=> (= (ControlFlow 0 11) 10) anon15_correct))))))
(let ((anon184_Else_correct  (=> (not (U_2_bool (MapType2Select g0@@11 n$2_6))) (and (=> (= (ControlFlow 0 16) 11) anon185_Then_correct) (=> (= (ControlFlow 0 16) 13) anon185_Else_correct)))))
(let ((anon184_Then_correct  (=> (U_2_bool (MapType2Select g0@@11 n$2_6)) (and (=> (= (ControlFlow 0 14) (- 0 15)) (HasDirectPerm QPMask@1 n$2_6 r_1)) (=> (HasDirectPerm QPMask@1 n$2_6 r_1) (and (=> (= (ControlFlow 0 14) 11) anon185_Then_correct) (=> (= (ControlFlow 0 14) 13) anon185_Else_correct)))))))
(let ((anon180_Else_correct  (=> (forall ((n$1_1_1 T@U) ) (!  (=> (= (type n$1_1_1) RefType) (=> (and (U_2_bool (MapType2Select g0@@11 n$1_1_1)) (not (= (MapType0Select Heap@@23 n$1_1_1 l) null))) (U_2_bool (MapType2Select g0@@11 (MapType0Select Heap@@23 n$1_1_1 l)))))
 :qid |stdinbpl.9943:20|
 :skolemid |1176|
 :pattern ( (MapType2Select g0@@11 (MapType0Select Heap@@23 n$1_1_1 l)))
 :pattern ( (MapType2Select g0@@11 n$1_1_1) (MapType0Select Heap@@23 n$1_1_1 l))
)) (and (and (=> (= (ControlFlow 0 344) 343) anon183_Else_correct) (=> (= (ControlFlow 0 344) 14) anon184_Then_correct)) (=> (= (ControlFlow 0 344) 16) anon184_Else_correct)))))
(let ((anon9_correct true))
(let ((anon182_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select g0@@11 n$1_7)) (not (= (MapType0Select Heap@@23 n$1_7 l) null)))) (= (ControlFlow 0 6) 3)) anon9_correct)))
(let ((anon182_Then_correct  (=> (and (U_2_bool (MapType2Select g0@@11 n$1_7)) (not (= (MapType0Select Heap@@23 n$1_7 l) null))) (and (=> (= (ControlFlow 0 4) (- 0 5)) (HasDirectPerm QPMask@1 n$1_7 l)) (=> (HasDirectPerm QPMask@1 n$1_7 l) (=> (= (ControlFlow 0 4) 3) anon9_correct))))))
(let ((anon181_Else_correct  (=> (not (U_2_bool (MapType2Select g0@@11 n$1_7))) (and (=> (= (ControlFlow 0 9) 4) anon182_Then_correct) (=> (= (ControlFlow 0 9) 6) anon182_Else_correct)))))
(let ((anon181_Then_correct  (=> (U_2_bool (MapType2Select g0@@11 n$1_7)) (and (=> (= (ControlFlow 0 7) (- 0 8)) (HasDirectPerm QPMask@1 n$1_7 l)) (=> (HasDirectPerm QPMask@1 n$1_7 l) (and (=> (= (ControlFlow 0 7) 4) anon182_Then_correct) (=> (= (ControlFlow 0 7) 6) anon182_Else_correct)))))))
(let ((anon179_Else_correct  (and (=> (= (ControlFlow 0 345) (- 0 346)) (forall ((n$0_1 T@U) (n$0_1_1 T@U) ) (!  (=> (and (= (type n$0_1) RefType) (= (type n$0_1_1) RefType)) (=> (and (and (and (and (not (= n$0_1 n$0_1_1)) (U_2_bool (MapType2Select g0@@11 n$0_1))) (U_2_bool (MapType2Select g0@@11 n$0_1_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$0_1 n$0_1_1))))
 :qid |stdinbpl.9898:15|
 :skolemid |1170|
 :no-pattern (type n$0_1)
 :no-pattern (type n$0_1_1)
 :no-pattern (U_2_int n$0_1)
 :no-pattern (U_2_bool n$0_1)
 :no-pattern (U_2_int n$0_1_1)
 :no-pattern (U_2_bool n$0_1_1)
))) (=> (forall ((n$0_1@@0 T@U) (n$0_1_1@@0 T@U) ) (!  (=> (and (= (type n$0_1@@0) RefType) (= (type n$0_1_1@@0) RefType)) (=> (and (and (and (and (not (= n$0_1@@0 n$0_1_1@@0)) (U_2_bool (MapType2Select g0@@11 n$0_1@@0))) (U_2_bool (MapType2Select g0@@11 n$0_1_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$0_1@@0 n$0_1_1@@0))))
 :qid |stdinbpl.9898:15|
 :skolemid |1170|
 :no-pattern (type n$0_1@@0)
 :no-pattern (type n$0_1_1@@0)
 :no-pattern (U_2_int n$0_1@@0)
 :no-pattern (U_2_bool n$0_1@@0)
 :no-pattern (U_2_int n$0_1_1@@0)
 :no-pattern (U_2_bool n$0_1_1@@0)
)) (=> (and (forall ((n$0_1@@1 T@U) ) (!  (=> (= (type n$0_1@@1) RefType) (=> (and (U_2_bool (MapType2Select g0@@11 n$0_1@@1)) (< NoPerm FullPerm)) (and (qpRange140 n$0_1@@1) (= (invRecv140 n$0_1@@1) n$0_1@@1))))
 :qid |stdinbpl.9904:22|
 :skolemid |1171|
 :pattern ( (MapType0Select Heap@@23 n$0_1@@1 r_1))
 :pattern ( (MapType1Select QPMask@1 n$0_1@@1 r_1))
 :pattern ( (MapType0Select Heap@@23 n$0_1@@1 r_1))
)) (forall ((o_3@@98 T@U) ) (!  (=> (= (type o_3@@98) RefType) (=> (and (and (U_2_bool (MapType2Select g0@@11 (invRecv140 o_3@@98))) (< NoPerm FullPerm)) (qpRange140 o_3@@98)) (= (invRecv140 o_3@@98) o_3@@98)))
 :qid |stdinbpl.9908:22|
 :skolemid |1172|
 :pattern ( (invRecv140 o_3@@98))
))) (=> (and (and (forall ((n$0_1@@2 T@U) ) (!  (=> (and (= (type n$0_1@@2) RefType) (U_2_bool (MapType2Select g0@@11 n$0_1@@2))) (not (= n$0_1@@2 null)))
 :qid |stdinbpl.9914:22|
 :skolemid |1173|
 :pattern ( (MapType0Select Heap@@23 n$0_1@@2 r_1))
 :pattern ( (MapType1Select QPMask@1 n$0_1@@2 r_1))
 :pattern ( (MapType0Select Heap@@23 n$0_1@@2 r_1))
)) (forall ((o_3@@99 T@U) ) (!  (=> (= (type o_3@@99) RefType) (and (=> (and (and (U_2_bool (MapType2Select g0@@11 (invRecv140 o_3@@99))) (< NoPerm FullPerm)) (qpRange140 o_3@@99)) (and (=> (< NoPerm FullPerm) (= (invRecv140 o_3@@99) o_3@@99)) (= (U_2_real (MapType1Select QPMask@1 o_3@@99 r_1)) (+ (U_2_real (MapType1Select QPMask@0 o_3@@99 r_1)) FullPerm)))) (=> (not (and (and (U_2_bool (MapType2Select g0@@11 (invRecv140 o_3@@99))) (< NoPerm FullPerm)) (qpRange140 o_3@@99))) (= (U_2_real (MapType1Select QPMask@1 o_3@@99 r_1)) (U_2_real (MapType1Select QPMask@0 o_3@@99 r_1))))))
 :qid |stdinbpl.9920:22|
 :skolemid |1174|
 :pattern ( (MapType1Select QPMask@1 o_3@@99 r_1))
))) (and (forall ((o_3@@100 T@U) (f_5@@32 T@U) ) (! (let ((B@@44 (FieldTypeInv1 (type f_5@@32))))
(let ((A@@45 (FieldTypeInv0 (type f_5@@32))))
 (=> (and (and (= (type o_3@@100) RefType) (= (type f_5@@32) (FieldType A@@45 B@@44))) (not (= f_5@@32 r_1))) (= (U_2_real (MapType1Select QPMask@0 o_3@@100 f_5@@32)) (U_2_real (MapType1Select QPMask@1 o_3@@100 f_5@@32))))))
 :qid |stdinbpl.9924:29|
 :skolemid |1175|
 :pattern ( (MapType1Select QPMask@0 o_3@@100 f_5@@32))
 :pattern ( (MapType1Select QPMask@1 o_3@@100 f_5@@32))
)) (state Heap@@23 QPMask@1))) (and (and (=> (= (ControlFlow 0 345) 344) anon180_Else_correct) (=> (= (ControlFlow 0 345) 7) anon181_Then_correct)) (=> (= (ControlFlow 0 345) 9) anon181_Else_correct))))))))
(let ((anon179_Then_correct true))
(let ((anon178_Else_correct  (and (=> (= (ControlFlow 0 347) (- 0 348)) (forall ((n_1 T@U) (n_1_1 T@U) ) (!  (=> (and (= (type n_1) RefType) (= (type n_1_1) RefType)) (=> (and (and (and (and (not (= n_1 n_1_1)) (U_2_bool (MapType2Select g0@@11 n_1))) (U_2_bool (MapType2Select g0@@11 n_1_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_1 n_1_1))))
 :qid |stdinbpl.9859:15|
 :skolemid |1164|
 :no-pattern (type n_1)
 :no-pattern (type n_1_1)
 :no-pattern (U_2_int n_1)
 :no-pattern (U_2_bool n_1)
 :no-pattern (U_2_int n_1_1)
 :no-pattern (U_2_bool n_1_1)
))) (=> (forall ((n_1@@0 T@U) (n_1_1@@0 T@U) ) (!  (=> (and (= (type n_1@@0) RefType) (= (type n_1_1@@0) RefType)) (=> (and (and (and (and (not (= n_1@@0 n_1_1@@0)) (U_2_bool (MapType2Select g0@@11 n_1@@0))) (U_2_bool (MapType2Select g0@@11 n_1_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_1@@0 n_1_1@@0))))
 :qid |stdinbpl.9859:15|
 :skolemid |1164|
 :no-pattern (type n_1@@0)
 :no-pattern (type n_1_1@@0)
 :no-pattern (U_2_int n_1@@0)
 :no-pattern (U_2_bool n_1@@0)
 :no-pattern (U_2_int n_1_1@@0)
 :no-pattern (U_2_bool n_1_1@@0)
)) (=> (and (forall ((n_1@@1 T@U) ) (!  (=> (= (type n_1@@1) RefType) (=> (and (U_2_bool (MapType2Select g0@@11 n_1@@1)) (< NoPerm FullPerm)) (and (qpRange139 n_1@@1) (= (invRecv139 n_1@@1) n_1@@1))))
 :qid |stdinbpl.9865:22|
 :skolemid |1165|
 :pattern ( (MapType0Select Heap@@23 n_1@@1 l))
 :pattern ( (MapType1Select QPMask@0 n_1@@1 l))
 :pattern ( (MapType0Select Heap@@23 n_1@@1 l))
)) (forall ((o_3@@101 T@U) ) (!  (=> (= (type o_3@@101) RefType) (=> (and (and (U_2_bool (MapType2Select g0@@11 (invRecv139 o_3@@101))) (< NoPerm FullPerm)) (qpRange139 o_3@@101)) (= (invRecv139 o_3@@101) o_3@@101)))
 :qid |stdinbpl.9869:22|
 :skolemid |1166|
 :pattern ( (invRecv139 o_3@@101))
))) (=> (and (and (forall ((n_1@@2 T@U) ) (!  (=> (and (= (type n_1@@2) RefType) (U_2_bool (MapType2Select g0@@11 n_1@@2))) (not (= n_1@@2 null)))
 :qid |stdinbpl.9875:22|
 :skolemid |1167|
 :pattern ( (MapType0Select Heap@@23 n_1@@2 l))
 :pattern ( (MapType1Select QPMask@0 n_1@@2 l))
 :pattern ( (MapType0Select Heap@@23 n_1@@2 l))
)) (forall ((o_3@@102 T@U) ) (!  (=> (= (type o_3@@102) RefType) (and (=> (and (and (U_2_bool (MapType2Select g0@@11 (invRecv139 o_3@@102))) (< NoPerm FullPerm)) (qpRange139 o_3@@102)) (and (=> (< NoPerm FullPerm) (= (invRecv139 o_3@@102) o_3@@102)) (= (U_2_real (MapType1Select QPMask@0 o_3@@102 l)) (+ (U_2_real (MapType1Select ZeroMask o_3@@102 l)) FullPerm)))) (=> (not (and (and (U_2_bool (MapType2Select g0@@11 (invRecv139 o_3@@102))) (< NoPerm FullPerm)) (qpRange139 o_3@@102))) (= (U_2_real (MapType1Select QPMask@0 o_3@@102 l)) (U_2_real (MapType1Select ZeroMask o_3@@102 l))))))
 :qid |stdinbpl.9881:22|
 :skolemid |1168|
 :pattern ( (MapType1Select QPMask@0 o_3@@102 l))
))) (and (forall ((o_3@@103 T@U) (f_5@@33 T@U) ) (! (let ((B@@45 (FieldTypeInv1 (type f_5@@33))))
(let ((A@@46 (FieldTypeInv0 (type f_5@@33))))
 (=> (and (and (= (type o_3@@103) RefType) (= (type f_5@@33) (FieldType A@@46 B@@45))) (not (= f_5@@33 l))) (= (U_2_real (MapType1Select ZeroMask o_3@@103 f_5@@33)) (U_2_real (MapType1Select QPMask@0 o_3@@103 f_5@@33))))))
 :qid |stdinbpl.9885:29|
 :skolemid |1169|
 :pattern ( (MapType1Select ZeroMask o_3@@103 f_5@@33))
 :pattern ( (MapType1Select QPMask@0 o_3@@103 f_5@@33))
)) (state Heap@@23 QPMask@0))) (and (=> (= (ControlFlow 0 347) 2) anon179_Then_correct) (=> (= (ControlFlow 0 347) 345) anon179_Else_correct))))))))
(let ((anon178_Then_correct true))
(let ((anon0_correct  (=> (and (state Heap@@23 ZeroMask) (= AssumeFunctionsAbove (- 0 1))) (=> (and (and (U_2_bool (MapType0Select Heap@@23 x0@@10 $allocated)) (U_2_bool (MapType0Select Heap@@23 x1@@7 $allocated))) (and (U_2_bool (MapType0Select Heap@@23 x_1@@0 $allocated)) (not (U_2_bool (MapType2Select g0@@11 null))))) (and (=> (= (ControlFlow 0 349) 1) anon178_Then_correct) (=> (= (ControlFlow 0 349) 347) anon178_Else_correct))))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 350) 349) anon0_correct)))
PreconditionGeneratedEntry_correct)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
))
(check-sat)
(get-info :reason-unknown)
(assert (not (= (ControlFlow 0 136) (- 135))))
(check-sat)
(pop 1)
; Invalid
(get-info :rlimit)
