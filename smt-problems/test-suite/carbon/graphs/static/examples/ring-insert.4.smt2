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
(declare-fun val () T@U)
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
(declare-fun DEP (T@U T@U T@U T@U T@U) Bool)
(declare-fun MapType2Type (T@T T@T) T@T)
(declare-fun EdgeDomainTypeType () T@T)
(declare-fun DEP_ (T@U T@U T@U T@U T@U) Bool)
(declare-fun MapType2TypeInv0 (T@T) T@T)
(declare-fun MapType2TypeInv1 (T@T) T@T)
(declare-fun MapType2Select (T@U T@U) T@U)
(declare-fun MapType2Store (T@U T@U T@U) T@U)
(declare-fun |apply_TCFraming'| (T@U T@U T@U) Bool)
(declare-fun dummyFunction (T@U) Bool)
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
(declare-fun |$$'| (T@U T@U) T@U)
(declare-fun |$$#triggerStateless| (T@U) T@U)
(declare-fun |MultiSet#Select| (T@U T@U) Int)
(declare-fun |Set#Union| (T@U T@U) T@U)
(declare-fun |Set#Intersection| (T@U T@U) T@U)
(declare-fun |Set#Singleton| (T@U) T@U)
(declare-fun exists_path (T@U T@U T@U) Bool)
(declare-fun edge (T@U T@U T@U) Bool)
(declare-fun |Set#Card| (T@U) Int)
(declare-fun succs (T@U T@U) T@U)
(declare-fun edge_ (T@U T@U T@U) Bool)
(declare-fun inst_uReach (T@U T@U) T@U)
(declare-fun inst_uReach_rev (T@U T@U) T@U)
(declare-fun $$ (T@U T@U) T@U)
(declare-fun |Math#clip| (Int) Int)
(declare-fun exists_path_ (T@U T@U T@U) Bool)
(declare-fun AssumeFunctionsAbove () Int)
(declare-fun |$$#trigger| (T@U T@U) Bool)
(declare-fun FrameFragment (T@U) T@U)
(declare-fun |$$#condqp1| (T@U T@U) Int)
(declare-fun |apply_TCFraming#trigger| (T@U T@U T@U) Bool)
(declare-fun CombineFrames (T@U T@U) T@U)
(declare-fun |apply_TCFraming#condqp2| (T@U T@U T@U) Int)
(declare-fun |apply_TCFraming#condqp3| (T@U T@U T@U) Int)
(declare-fun |Set#Equal| (T@U T@U) Bool)
(declare-fun |Set#Empty| (T@T) T@U)
(declare-fun |$$#frame| (T@U T@U) T@U)
(declare-fun create_edge (T@U T@U) T@U)
(declare-fun dummyHeap () T@U)
(declare-fun ZeroMask () T@U)
(declare-fun |MultiSet#UnionOne| (T@U T@U) T@U)
(declare-fun |MultiSet#Disjoint| (T@U T@U) Bool)
(declare-fun InsidePredicate (T@U T@U T@U T@U) Bool)
(declare-fun |MultiSet#Singleton| (T@U) T@U)
(declare-fun |sk_apply_TCFraming#condqp2| (Int Int) T@U)
(declare-fun NoPerm () Real)
(declare-fun |sk_apply_TCFraming#condqp3| (Int Int) T@U)
(declare-fun apply_noExit (T@U T@U T@U) Bool)
(declare-fun sumMask (T@U T@U T@U) Bool)
(declare-fun ConditionalFrame (Real T@U) T@U)
(declare-fun EmptyFrame () T@U)
(declare-fun edge_pred (T@U) T@U)
(declare-fun edge_succ (T@U) T@U)
(declare-fun |Set#Difference| (T@U T@U) T@U)
(declare-fun |MultiSet#Equal| (T@U T@U) Bool)
(declare-fun |Set#UnionOne| (T@U T@U) T@U)
(declare-fun |sk_$$#condqp1| (Int Int) T@U)
(declare-fun |MultiSet#Empty| (T@T) T@U)
(declare-fun unshared_graph (T@U) Bool)
(declare-fun func_graph (T@U) Bool)
(declare-fun FullPerm () Real)
(declare-fun __learn_trigger__ (Bool) Bool)
(declare-fun |Set#Subset| (T@U T@U) Bool)
(declare-fun |apply_TCFraming#frame| (T@U T@U T@U) Bool)
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
(assert  (and (and (and (and (and (and (and (forall ((arg0@@11 T@T) (arg1 T@T) ) (! (= (Ctor (FieldType arg0@@11 arg1)) 6)
 :qid |ctor:FieldType|
)) (forall ((arg0@@12 T@T) (arg1@@0 T@T) ) (! (= (FieldTypeInv0 (FieldType arg0@@12 arg1@@0)) arg0@@12)
 :qid |typeInv:FieldTypeInv0|
 :pattern ( (FieldType arg0@@12 arg1@@0))
))) (forall ((arg0@@13 T@T) (arg1@@1 T@T) ) (! (= (FieldTypeInv1 (FieldType arg0@@13 arg1@@1)) arg1@@1)
 :qid |typeInv:FieldTypeInv1|
 :pattern ( (FieldType arg0@@13 arg1@@1))
))) (= (Ctor NormalFieldType) 7)) (= (type $allocated) (FieldType NormalFieldType boolType))) (= (Ctor RefType) 8)) (= (type next) (FieldType NormalFieldType RefType))) (= (type val) (FieldType NormalFieldType intType))))
(assert (distinct $allocated next val)
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
))) (forall ((m T@U) (x0 T@U) (x1 T@U) (val@@0 T@U) ) (! (let ((B@@0 (FieldTypeInv1 (type x1))))
 (=> (= (type val@@0) B@@0) (= (MapType0Select (MapType0Store m x0 x1 val@@0) x0 x1) val@@0)))
 :qid |mapAx0:MapType0Select|
 :weight 0
))) (and (and (forall ((val@@1 T@U) (m@@0 T@U) (x0@@0 T@U) (x1@@0 T@U) (y0 T@U) (y1 T@U) ) (!  (or (= x0@@0 y0) (= (MapType0Select (MapType0Store m@@0 x0@@0 x1@@0 val@@1) y0 y1) (MapType0Select m@@0 y0 y1)))
 :qid |mapAx1:MapType0Select:0|
 :weight 0
)) (forall ((val@@2 T@U) (m@@1 T@U) (x0@@1 T@U) (x1@@1 T@U) (y0@@0 T@U) (y1@@0 T@U) ) (!  (or (= x1@@1 y1@@0) (= (MapType0Select (MapType0Store m@@1 x0@@1 x1@@1 val@@2) y0@@0 y1@@0) (MapType0Select m@@1 y0@@0 y1@@0)))
 :qid |mapAx1:MapType0Select:1|
 :weight 0
))) (forall ((val@@3 T@U) (m@@2 T@U) (x0@@2 T@U) (x1@@2 T@U) (y0@@1 T@U) (y1@@1 T@U) ) (!  (or true (= (MapType0Select (MapType0Store m@@2 x0@@2 x1@@2 val@@3) y0@@1 y1@@1) (MapType0Select m@@2 y0@@1 y1@@1)))
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
 :qid |stdinbpl.627:18|
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
))) (forall ((m@@3 T@U) (x0@@3 T@U) (x1@@3 T@U) (val@@4 T@U) ) (! (let ((aVar1@@1 (MapType1TypeInv1 (type m@@3))))
 (=> (= (type val@@4) aVar1@@1) (= (MapType1Select (MapType1Store m@@3 x0@@3 x1@@3 val@@4) x0@@3 x1@@3) val@@4)))
 :qid |mapAx0:MapType1Select|
 :weight 0
))) (and (and (forall ((val@@5 T@U) (m@@4 T@U) (x0@@4 T@U) (x1@@4 T@U) (y0@@2 T@U) (y1@@2 T@U) ) (!  (or (= x0@@4 y0@@2) (= (MapType1Select (MapType1Store m@@4 x0@@4 x1@@4 val@@5) y0@@2 y1@@2) (MapType1Select m@@4 y0@@2 y1@@2)))
 :qid |mapAx1:MapType1Select:0|
 :weight 0
)) (forall ((val@@6 T@U) (m@@5 T@U) (x0@@5 T@U) (x1@@5 T@U) (y0@@3 T@U) (y1@@3 T@U) ) (!  (or (= x1@@5 y1@@3) (= (MapType1Select (MapType1Store m@@5 x0@@5 x1@@5 val@@6) y0@@3 y1@@3) (MapType1Select m@@5 y0@@3 y1@@3)))
 :qid |mapAx1:MapType1Select:1|
 :weight 0
))) (forall ((val@@7 T@U) (m@@6 T@U) (x0@@6 T@U) (x1@@6 T@U) (y0@@4 T@U) (y1@@4 T@U) ) (!  (or true (= (MapType1Select (MapType1Store m@@6 x0@@6 x1@@6 val@@7) y0@@4 y1@@4) (MapType1Select m@@6 y0@@4 y1@@4)))
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
(assert  (and (and (and (and (and (and (and (forall ((arg0@@28 T@T) (arg1@@12 T@T) ) (! (= (Ctor (MapType2Type arg0@@28 arg1@@12)) 12)
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
))) (forall ((m@@7 T@U) (x0@@7 T@U) (val@@8 T@U) ) (! (let ((aVar1@@4 (MapType2TypeInv1 (type m@@7))))
 (=> (= (type val@@8) aVar1@@4) (= (MapType2Select (MapType2Store m@@7 x0@@7 val@@8) x0@@7) val@@8)))
 :qid |mapAx0:MapType2Select|
 :weight 0
))) (and (forall ((val@@9 T@U) (m@@8 T@U) (x0@@8 T@U) (y0@@5 T@U) ) (!  (or (= x0@@8 y0@@5) (= (MapType2Select (MapType2Store m@@8 x0@@8 val@@9) y0@@5) (MapType2Select m@@8 y0@@5)))
 :qid |mapAx1:MapType2Select:0|
 :weight 0
)) (forall ((val@@10 T@U) (m@@9 T@U) (x0@@9 T@U) (y0@@6 T@U) ) (!  (or true (= (MapType2Select (MapType2Store m@@9 x0@@9 val@@10) y0@@6) (MapType2Select m@@9 y0@@6)))
 :qid |mapAx2:MapType2Select|
 :weight 0
)))) (= (Ctor EdgeDomainTypeType) 13)))
(assert (forall ((EG_1 T@U) (x_1 T@U) (y@@1 T@U) (u_1 T@U) (v_2 T@U) ) (!  (=> (and (and (and (and (= (type EG_1) (MapType2Type EdgeDomainTypeType boolType)) (= (type x_1) RefType)) (= (type y@@1) RefType)) (= (type u_1) RefType)) (= (type v_2) RefType)) (= (DEP EG_1 x_1 y@@1 u_1 v_2) (DEP_ EG_1 x_1 y@@1 u_1 v_2)))
 :qid |stdinbpl.824:15|
 :skolemid |101|
 :pattern ( (DEP EG_1 x_1 y@@1 u_1 v_2))
)))
(assert (forall ((Heap@@0 T@U) (g0 T@U) (g1 T@U) ) (!  (=> (and (and (= (type Heap@@0) (MapType0Type RefType)) (= (type g0) (MapType2Type RefType boolType))) (= (type g1) (MapType2Type RefType boolType))) (dummyFunction (bool_2_U (|apply_TCFraming#triggerStateless| g0 g1))))
 :qid |stdinbpl.1074:15|
 :skolemid |131|
 :pattern ( (|apply_TCFraming'| Heap@@0 g0 g1))
)))
(assert (forall ((a@@0 Int) (b@@0 Int) ) (!  (or (= (|Math#min| a@@0 b@@0) a@@0) (= (|Math#min| a@@0 b@@0) b@@0))
 :qid |stdinbpl.558:15|
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
(assert  (and (forall ((arg0@@35 T@U) (arg1@@17 T@U) ) (! (= (type (|$$'| arg0@@35 arg1@@17)) (MapType2Type EdgeDomainTypeType boolType))
 :qid |funType:$$'|
 :pattern ( (|$$'| arg0@@35 arg1@@17))
)) (forall ((arg0@@36 T@U) ) (! (= (type (|$$#triggerStateless| arg0@@36)) (MapType2Type EdgeDomainTypeType boolType))
 :qid |funType:$$#triggerStateless|
 :pattern ( (|$$#triggerStateless| arg0@@36))
))))
(assert (forall ((Heap@@3 T@U) (refs T@U) ) (!  (=> (and (= (type Heap@@3) (MapType0Type RefType)) (= (type refs) (MapType2Type RefType boolType))) (dummyFunction (|$$#triggerStateless| refs)))
 :qid |stdinbpl.912:15|
 :skolemid |111|
 :pattern ( (|$$'| Heap@@3 refs))
)))
(assert (forall ((a@@1 T@U) (b@@1 T@U) (y@@2 T@U) ) (! (let ((T@@3 (type y@@2)))
 (=> (and (and (= (type a@@1) (MultiSetType T@@3)) (= (type b@@1) (MultiSetType T@@3))) (<= (|MultiSet#Select| a@@1 y@@2) (|MultiSet#Select| b@@1 y@@2))) (= (|MultiSet#Select| (|MultiSet#Difference| a@@1 b@@1) y@@2) 0)))
 :qid |stdinbpl.625:18|
 :skolemid |73|
 :pattern ( (|MultiSet#Difference| a@@1 b@@1) (|MultiSet#Select| b@@1 y@@2) (|MultiSet#Select| a@@1 y@@2))
)))
(assert (forall ((arg0@@37 T@U) (arg1@@18 T@U) ) (! (let ((T@@4 (MapType2TypeInv0 (type arg0@@37))))
(= (type (|Set#Union| arg0@@37 arg1@@18)) (MapType2Type T@@4 boolType)))
 :qid |funType:Set#Union|
 :pattern ( (|Set#Union| arg0@@37 arg1@@18))
)))
(assert (forall ((a@@2 T@U) (b@@2 T@U) ) (! (let ((T@@5 (MapType2TypeInv0 (type a@@2))))
 (=> (and (= (type a@@2) (MapType2Type T@@5 boolType)) (= (type b@@2) (MapType2Type T@@5 boolType))) (= (|Set#Union| (|Set#Union| a@@2 b@@2) b@@2) (|Set#Union| a@@2 b@@2))))
 :qid |stdinbpl.510:18|
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
 :qid |stdinbpl.514:18|
 :skolemid |40|
 :pattern ( (|Set#Intersection| (|Set#Intersection| a@@3 b@@3) b@@3))
)))
(assert (forall ((a@@4 T@U) (b@@4 T@U) ) (! (let ((T@@8 (MultiSetTypeInv0 (type a@@4))))
 (=> (and (= (type a@@4) (MultiSetType T@@8)) (= (type b@@4) (MultiSetType T@@8))) (= (|MultiSet#Intersection| (|MultiSet#Intersection| a@@4 b@@4) b@@4) (|MultiSet#Intersection| a@@4 b@@4))))
 :qid |stdinbpl.616:18|
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
 :qid |stdinbpl.479:18|
 :skolemid |27|
 :pattern ( (MapType2Select (|Set#Singleton| r) o))
)))
(assert (forall ((EG_1@@0 T@U) (x_1@@0 T@U) (y@@3 T@U) (u_1@@0 T@U) (v_2@@0 T@U) ) (!  (=> (and (and (and (and (and (= (type EG_1@@0) (MapType2Type EdgeDomainTypeType boolType)) (= (type x_1@@0) RefType)) (= (type y@@3) RefType)) (= (type u_1@@0) RefType)) (= (type v_2@@0) RefType)) (DEP EG_1@@0 x_1@@0 y@@3 u_1@@0 v_2@@0)) (and (exists_path EG_1@@0 x_1@@0 y@@3) (edge EG_1@@0 u_1@@0 v_2@@0)))
 :qid |stdinbpl.854:15|
 :skolemid |106|
 :pattern ( (DEP EG_1@@0 x_1@@0 y@@3 u_1@@0 v_2@@0))
)))
(assert (forall ((a@@5 T@U) (b@@5 T@U) ) (! (let ((T@@11 (MapType2TypeInv0 (type a@@5))))
 (=> (and (= (type a@@5) (MapType2Type T@@11 boolType)) (= (type b@@5) (MapType2Type T@@11 boolType))) (= (+ (|Set#Card| (|Set#Union| a@@5 b@@5)) (|Set#Card| (|Set#Intersection| a@@5 b@@5))) (+ (|Set#Card| a@@5) (|Set#Card| b@@5)))))
 :qid |stdinbpl.518:18|
 :skolemid |42|
 :pattern ( (|Set#Card| (|Set#Union| a@@5 b@@5)))
 :pattern ( (|Set#Card| (|Set#Intersection| a@@5 b@@5)))
)))
(assert (forall ((arg0@@40 T@U) (arg1@@20 T@U) ) (! (= (type (succs arg0@@40 arg1@@20)) (MapType2Type RefType boolType))
 :qid |funType:succs|
 :pattern ( (succs arg0@@40 arg1@@20))
)))
(assert (forall ((EG_1@@1 T@U) (pred_1 T@U) (succ T@U) ) (!  (=> (and (and (= (type EG_1@@1) (MapType2Type EdgeDomainTypeType boolType)) (= (type pred_1) RefType)) (= (type succ) RefType)) (= (U_2_bool (MapType2Select (succs EG_1@@1 pred_1) succ)) (edge_ EG_1@@1 pred_1 succ)))
 :qid |stdinbpl.721:15|
 :skolemid |83|
 :pattern ( (MapType2Select (succs EG_1@@1 pred_1) succ))
)))
(assert (forall ((arg0@@41 T@U) (arg1@@21 T@U) ) (! (= (type (inst_uReach arg0@@41 arg1@@21)) (MapType2Type RefType boolType))
 :qid |funType:inst_uReach|
 :pattern ( (inst_uReach arg0@@41 arg1@@21))
)))
(assert (forall ((EG_1@@2 T@U) (x_1@@1 T@U) (v_2@@1 T@U) ) (!  (=> (and (and (= (type EG_1@@2) (MapType2Type EdgeDomainTypeType boolType)) (= (type x_1@@1) RefType)) (= (type v_2@@1) RefType)) (= (U_2_bool (MapType2Select (inst_uReach EG_1@@2 x_1@@1) v_2@@1)) (exists_path EG_1@@2 x_1@@1 v_2@@1)))
 :qid |stdinbpl.751:15|
 :skolemid |89|
 :pattern ( (MapType2Select (inst_uReach EG_1@@2 x_1@@1) v_2@@1))
 :pattern ( (exists_path EG_1@@2 x_1@@1 v_2@@1))
)))
(assert (forall ((arg0@@42 T@U) (arg1@@22 T@U) ) (! (= (type (inst_uReach_rev arg0@@42 arg1@@22)) (MapType2Type RefType boolType))
 :qid |funType:inst_uReach_rev|
 :pattern ( (inst_uReach_rev arg0@@42 arg1@@22))
)))
(assert (forall ((EG_1@@3 T@U) (u_1@@1 T@U) (y@@4 T@U) ) (!  (=> (and (and (= (type EG_1@@3) (MapType2Type EdgeDomainTypeType boolType)) (= (type u_1@@1) RefType)) (= (type y@@4) RefType)) (= (U_2_bool (MapType2Select (inst_uReach_rev EG_1@@3 y@@4) u_1@@1)) (exists_path EG_1@@3 u_1@@1 y@@4)))
 :qid |stdinbpl.757:15|
 :skolemid |90|
 :pattern ( (MapType2Select (inst_uReach_rev EG_1@@3 y@@4) u_1@@1))
 :pattern ( (exists_path EG_1@@3 u_1@@1 y@@4))
)))
(assert (forall ((Heap@@4 T@U) (ExhaleHeap@@1 T@U) (Mask@@2 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@4) (MapType0Type RefType)) (= (type ExhaleHeap@@1) (MapType0Type RefType))) (= (type Mask@@2) (MapType1Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@4 ExhaleHeap@@1 Mask@@2)) (U_2_bool (MapType0Select Heap@@4 o_1 $allocated))) (U_2_bool (MapType0Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.73:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@4 ExhaleHeap@@1 Mask@@2) (MapType0Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert (forall ((arg0@@43 T@U) (arg1@@23 T@U) ) (! (= (type ($$ arg0@@43 arg1@@23)) (MapType2Type EdgeDomainTypeType boolType))
 :qid |funType:$$|
 :pattern ( ($$ arg0@@43 arg1@@23))
)))
(assert (forall ((Heap@@5 T@U) (refs@@0 T@U) ) (!  (=> (and (= (type Heap@@5) (MapType0Type RefType)) (= (type refs@@0) (MapType2Type RefType boolType))) (and (= ($$ Heap@@5 refs@@0) (|$$'| Heap@@5 refs@@0)) (dummyFunction (|$$#triggerStateless| refs@@0))))
 :qid |stdinbpl.908:15|
 :skolemid |110|
 :pattern ( ($$ Heap@@5 refs@@0))
)))
(assert (forall ((a@@6 Int) ) (!  (=> (<= 0 a@@6) (= (|Math#clip| a@@6) a@@6))
 :qid |stdinbpl.561:15|
 :skolemid |54|
 :pattern ( (|Math#clip| a@@6))
)))
(assert (forall ((EG_1@@4 T@U) (u_1@@2 T@U) (v_2@@2 T@U) (w_1 T@U) ) (!  (=> (and (and (and (and (= (type EG_1@@4) (MapType2Type EdgeDomainTypeType boolType)) (= (type u_1@@2) RefType)) (= (type v_2@@2) RefType)) (= (type w_1) RefType)) (and (exists_path EG_1@@4 u_1@@2 w_1) (exists_path EG_1@@4 w_1 v_2@@2))) (exists_path_ EG_1@@4 u_1@@2 v_2@@2))
 :qid |stdinbpl.778:15|
 :skolemid |94|
 :pattern ( (exists_path EG_1@@4 u_1@@2 w_1) (exists_path EG_1@@4 w_1 v_2@@2))
)))
(assert (forall ((a@@7 T@U) (b@@6 T@U) (o@@0 T@U) ) (! (let ((T@@12 (type o@@0)))
 (=> (and (= (type a@@7) (MultiSetType T@@12)) (= (type b@@6) (MultiSetType T@@12))) (= (|MultiSet#Select| (|MultiSet#Intersection| a@@7 b@@6) o@@0) (|Math#min| (|MultiSet#Select| a@@7 o@@0) (|MultiSet#Select| b@@6 o@@0)))))
 :qid |stdinbpl.612:18|
 :skolemid |69|
 :pattern ( (|MultiSet#Select| (|MultiSet#Intersection| a@@7 b@@6) o@@0))
)))
(assert (forall ((arg0@@44 T@U) ) (! (= (type (FrameFragment arg0@@44)) FrameTypeType)
 :qid |funType:FrameFragment|
 :pattern ( (FrameFragment arg0@@44))
)))
(assert (forall ((Heap@@6 T@U) (Mask@@3 T@U) (refs@@1 T@U) ) (!  (=> (and (and (and (= (type Heap@@6) (MapType0Type RefType)) (= (type Mask@@3) (MapType1Type RefType realType))) (= (type refs@@1) (MapType2Type RefType boolType))) (and (state Heap@@6 Mask@@3) (or (< AssumeFunctionsAbove 1) (|$$#trigger| (FrameFragment (int_2_U (|$$#condqp1| Heap@@6 refs@@1))) refs@@1)))) (forall ((p_1_1 T@U) (s_1_1 T@U) ) (!  (=> (and (and (= (type p_1_1) RefType) (= (type s_1_1) RefType)) (and (U_2_bool (MapType2Select refs@@1 p_1_1)) (exists_path (|$$'| Heap@@6 refs@@1) p_1_1 s_1_1))) (U_2_bool (MapType2Select refs@@1 s_1_1)))
 :qid |stdinbpl.944:122|
 :skolemid |116|
 :pattern ( (MapType2Select refs@@1 p_1_1) (MapType2Select refs@@1 s_1_1) (exists_path (|$$'| Heap@@6 refs@@1) p_1_1 s_1_1))
)))
 :qid |stdinbpl.942:15|
 :skolemid |117|
 :pattern ( (state Heap@@6 Mask@@3) (|$$'| Heap@@6 refs@@1))
)))
(assert (forall ((Heap@@7 T@U) (Mask@@4 T@U) (refs@@2 T@U) ) (!  (=> (and (and (and (= (type Heap@@7) (MapType0Type RefType)) (= (type Mask@@4) (MapType1Type RefType realType))) (= (type refs@@2) (MapType2Type RefType boolType))) (and (state Heap@@7 Mask@@4) (or (< AssumeFunctionsAbove 1) (|$$#trigger| (FrameFragment (int_2_U (|$$#condqp1| Heap@@7 refs@@2))) refs@@2)))) (forall ((p_2_1 T@U) (s_2 T@U) ) (!  (=> (and (and (= (type p_2_1) RefType) (= (type s_2) RefType)) (and (U_2_bool (MapType2Select refs@@2 s_2)) (exists_path (|$$'| Heap@@7 refs@@2) p_2_1 s_2))) (U_2_bool (MapType2Select refs@@2 p_2_1)))
 :qid |stdinbpl.951:122|
 :skolemid |118|
 :pattern ( (MapType2Select refs@@2 p_2_1) (MapType2Select refs@@2 s_2) (exists_path (|$$'| Heap@@7 refs@@2) p_2_1 s_2))
)))
 :qid |stdinbpl.949:15|
 :skolemid |119|
 :pattern ( (state Heap@@7 Mask@@4) (|$$'| Heap@@7 refs@@2))
)))
(assert (forall ((EG_1@@5 T@U) (start_1 T@U) (end_1 T@U) ) (!  (=> (and (and (= (type EG_1@@5) (MapType2Type EdgeDomainTypeType boolType)) (= (type start_1) RefType)) (= (type end_1) RefType)) (= (exists_path_ EG_1@@5 start_1 end_1)  (or (= start_1 end_1) (exists ((w_1@@0 T@U) ) (!  (and (= (type w_1@@0) RefType) (and (edge EG_1@@5 start_1 w_1@@0) (exists_path_ EG_1@@5 w_1@@0 end_1)))
 :qid |stdinbpl.771:78|
 :skolemid |92|
 :pattern ( (edge EG_1@@5 start_1 w_1@@0))
 :pattern ( (exists_path_ EG_1@@5 w_1@@0 end_1))
)))))
 :qid |stdinbpl.769:15|
 :skolemid |93|
 :pattern ( (exists_path EG_1@@5 start_1 end_1))
 :pattern ( (edge EG_1@@5 start_1 end_1))
)))
(assert (forall ((Heap@@8 T@U) (ExhaleHeap@@2 T@U) (Mask@@5 T@U) (o_1@@0 T@U) (f_2 T@U) ) (! (let ((B@@1 (FieldTypeInv1 (type f_2))))
(let ((A@@1 (FieldTypeInv0 (type f_2))))
 (=> (and (and (and (and (and (and (= (type Heap@@8) (MapType0Type RefType)) (= (type ExhaleHeap@@2) (MapType0Type RefType))) (= (type Mask@@5) (MapType1Type RefType realType))) (= (type o_1@@0) RefType)) (= (type f_2) (FieldType A@@1 B@@1))) (IdenticalOnKnownLocations Heap@@8 ExhaleHeap@@2 Mask@@5)) (HasDirectPerm Mask@@5 o_1@@0 f_2)) (= (MapType0Select Heap@@8 o_1@@0 f_2) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2)))))
 :qid |stdinbpl.42:22|
 :skolemid |1|
 :pattern ( (IdenticalOnKnownLocations Heap@@8 ExhaleHeap@@2 Mask@@5) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2))
)))
(assert  (and (and (forall ((arg0@@45 T@U) (arg1@@24 T@U) ) (! (= (type (CombineFrames arg0@@45 arg1@@24)) FrameTypeType)
 :qid |funType:CombineFrames|
 :pattern ( (CombineFrames arg0@@45 arg1@@24))
)) (forall ((T@@13 T@T) ) (! (= (type (|Set#Empty| T@@13)) (MapType2Type T@@13 boolType))
 :qid |funType:Set#Empty|
 :pattern ( (|Set#Empty| T@@13))
))) (forall ((arg0@@46 T@U) (arg1@@25 T@U) ) (! (= (type (|$$#frame| arg0@@46 arg1@@25)) (MapType2Type EdgeDomainTypeType boolType))
 :qid |funType:$$#frame|
 :pattern ( (|$$#frame| arg0@@46 arg1@@25))
))))
(assert (forall ((Heap@@9 T@U) (Mask@@6 T@U) (g0@@0 T@U) (g1@@0 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@9) (MapType0Type RefType)) (= (type Mask@@6) (MapType1Type RefType realType))) (= (type g0@@0) (MapType2Type RefType boolType))) (= (type g1@@0) (MapType2Type RefType boolType))) (and (state Heap@@9 Mask@@6) (or (< AssumeFunctionsAbove 0) (|apply_TCFraming#trigger| (CombineFrames (FrameFragment (int_2_U (|apply_TCFraming#condqp2| Heap@@9 g0@@0 g1@@0))) (FrameFragment (int_2_U (|apply_TCFraming#condqp3| Heap@@9 g0@@0 g1@@0)))) g0@@0 g1@@0)))) (|Set#Equal| (|Set#Intersection| g1@@0 g0@@0) (|Set#Empty| RefType))) (forall ((u_2_1 T@U) (v_2_1 T@U) ) (!  (=> (and (and (= (type u_2_1) RefType) (= (type v_2_1) RefType)) (and (U_2_bool (MapType2Select g0@@0 u_2_1)) (and (U_2_bool (MapType2Select g0@@0 v_2_1)) (not (exists_path ($$ Heap@@9 g0@@0) u_2_1 v_2_1))))) (not (exists_path ($$ Heap@@9 (|Set#Union| g0@@0 g1@@0)) u_2_1 v_2_1)))
 :qid |stdinbpl.1127:285|
 :skolemid |140|
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| Heap@@9 g0@@0))) g0@@0) u_2_1 v_2_1))
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| Heap@@9 (|Set#Union| g0@@0 g1@@0)))) (|Set#Union| g0@@0 g1@@0)) u_2_1 v_2_1))
)))
 :qid |stdinbpl.1125:15|
 :skolemid |141|
 :pattern ( (state Heap@@9 Mask@@6) (|apply_TCFraming'| Heap@@9 g0@@0 g1@@0))
)))
(assert (forall ((Heap@@10 T@U) (Mask@@7 T@U) (g0@@1 T@U) (g1@@1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@10) (MapType0Type RefType)) (= (type Mask@@7) (MapType1Type RefType realType))) (= (type g0@@1) (MapType2Type RefType boolType))) (= (type g1@@1) (MapType2Type RefType boolType))) (and (state Heap@@10 Mask@@7) (or (< AssumeFunctionsAbove 0) (|apply_TCFraming#trigger| (CombineFrames (FrameFragment (int_2_U (|apply_TCFraming#condqp2| Heap@@10 g0@@1 g1@@1))) (FrameFragment (int_2_U (|apply_TCFraming#condqp3| Heap@@10 g0@@1 g1@@1)))) g0@@1 g1@@1)))) (|Set#Equal| (|Set#Intersection| g1@@1 g0@@1) (|Set#Empty| RefType))) (forall ((u_3 T@U) (v_3_1 T@U) ) (!  (=> (and (and (= (type u_3) RefType) (= (type v_3_1) RefType)) (and (U_2_bool (MapType2Select g1@@1 u_3)) (and (U_2_bool (MapType2Select g1@@1 v_3_1)) (not (exists_path ($$ Heap@@10 g1@@1) u_3 v_3_1))))) (not (exists_path ($$ Heap@@10 (|Set#Union| g1@@1 g0@@1)) u_3 v_3_1)))
 :qid |stdinbpl.1134:285|
 :skolemid |142|
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| Heap@@10 g1@@1))) g1@@1) u_3 v_3_1))
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| Heap@@10 (|Set#Union| g0@@1 g1@@1)))) (|Set#Union| g0@@1 g1@@1)) u_3 v_3_1))
)))
 :qid |stdinbpl.1132:15|
 :skolemid |143|
 :pattern ( (state Heap@@10 Mask@@7) (|apply_TCFraming'| Heap@@10 g0@@1 g1@@1))
)))
(assert (forall ((arg0@@47 T@U) (arg1@@26 T@U) ) (! (= (type (create_edge arg0@@47 arg1@@26)) EdgeDomainTypeType)
 :qid |funType:create_edge|
 :pattern ( (create_edge arg0@@47 arg1@@26))
)))
(assert (forall ((EG_1@@6 T@U) (p_2 T@U) (s_1 T@U) ) (!  (=> (and (and (= (type EG_1@@6) (MapType2Type EdgeDomainTypeType boolType)) (= (type p_2) RefType)) (= (type s_1) RefType)) (= (edge_ EG_1@@6 p_2 s_1) (U_2_bool (MapType2Select EG_1@@6 (create_edge p_2 s_1)))))
 :qid |stdinbpl.733:15|
 :skolemid |85|
 :pattern ( (MapType2Select EG_1@@6 (create_edge p_2 s_1)))
 :pattern ( (edge EG_1@@6 p_2 s_1))
)))
(assert  (and (= (type dummyHeap) (MapType0Type RefType)) (= (type ZeroMask) (MapType1Type RefType realType))))
(assert (state dummyHeap ZeroMask))
(assert (forall ((arg0@@48 T@U) (arg1@@27 T@U) ) (! (let ((T@@14 (type arg1@@27)))
(= (type (|MultiSet#UnionOne| arg0@@48 arg1@@27)) (MultiSetType T@@14)))
 :qid |funType:MultiSet#UnionOne|
 :pattern ( (|MultiSet#UnionOne| arg0@@48 arg1@@27))
)))
(assert (forall ((a@@8 T@U) (x@@8 T@U) ) (! (let ((T@@15 (type x@@8)))
 (=> (= (type a@@8) (MultiSetType T@@15)) (= (|MultiSet#Card| (|MultiSet#UnionOne| a@@8 x@@8)) (+ (|MultiSet#Card| a@@8) 1))))
 :qid |stdinbpl.598:18|
 :skolemid |65|
 :pattern ( (|MultiSet#Card| (|MultiSet#UnionOne| a@@8 x@@8)))
 :pattern ( (|MultiSet#UnionOne| a@@8 x@@8) (|MultiSet#Card| a@@8))
)))
(assert (forall ((a@@9 T@U) (b@@7 T@U) ) (! (let ((T@@16 (MultiSetTypeInv0 (type a@@9))))
 (=> (and (= (type a@@9) (MultiSetType T@@16)) (= (type b@@7) (MultiSetType T@@16))) (= (|MultiSet#Disjoint| a@@9 b@@7) (forall ((o@@1 T@U) ) (!  (=> (= (type o@@1) T@@16) (or (= (|MultiSet#Select| a@@9 o@@1) 0) (= (|MultiSet#Select| b@@7 o@@1) 0)))
 :qid |stdinbpl.648:39|
 :skolemid |80|
 :pattern ( (|MultiSet#Select| a@@9 o@@1))
 :pattern ( (|MultiSet#Select| b@@7 o@@1))
)))))
 :qid |stdinbpl.647:18|
 :skolemid |81|
 :pattern ( (|MultiSet#Disjoint| a@@9 b@@7))
)))
(assert (forall ((p T@U) (v_1 T@U) (w T@U) ) (! (let ((A@@2 (FieldTypeInv0 (type p))))
 (=> (and (and (= (type p) (FieldType A@@2 FrameTypeType)) (= (type v_1) FrameTypeType)) (= (type w) FrameTypeType)) (not (InsidePredicate p v_1 p w))))
 :qid |stdinbpl.456:19|
 :skolemid |21|
 :pattern ( (InsidePredicate p v_1 p w))
)))
(assert (forall ((arg0@@49 T@U) ) (! (let ((T@@17 (type arg0@@49)))
(= (type (|MultiSet#Singleton| arg0@@49)) (MultiSetType T@@17)))
 :qid |funType:MultiSet#Singleton|
 :pattern ( (|MultiSet#Singleton| arg0@@49))
)))
(assert (forall ((r@@0 T@U) ) (!  (and (= (|MultiSet#Card| (|MultiSet#Singleton| r@@0)) 1) (= (|MultiSet#Select| (|MultiSet#Singleton| r@@0) r@@0) 1))
 :qid |stdinbpl.590:18|
 :skolemid |62|
 :pattern ( (|MultiSet#Singleton| r@@0))
)))
(assert (forall ((arg0@@50 Int) (arg1@@28 Int) ) (! (= (type (|sk_apply_TCFraming#condqp2| arg0@@50 arg1@@28)) RefType)
 :qid |funType:sk_apply_TCFraming#condqp2|
 :pattern ( (|sk_apply_TCFraming#condqp2| arg0@@50 arg1@@28))
)))
(assert (forall ((Heap2Heap T@U) (Heap1Heap T@U) (g0@@2 T@U) (g1@@2 T@U) ) (!  (=> (and (and (and (and (= (type Heap2Heap) (MapType0Type RefType)) (= (type Heap1Heap) (MapType0Type RefType))) (= (type g0@@2) (MapType2Type RefType boolType))) (= (type g1@@2) (MapType2Type RefType boolType))) (and (=  (and (U_2_bool (MapType2Select g0@@2 (|sk_apply_TCFraming#condqp2| (|apply_TCFraming#condqp2| Heap2Heap g0@@2 g1@@2) (|apply_TCFraming#condqp2| Heap1Heap g0@@2 g1@@2)))) (< NoPerm (/ (to_real 1) (to_real 2))))  (and (U_2_bool (MapType2Select g0@@2 (|sk_apply_TCFraming#condqp2| (|apply_TCFraming#condqp2| Heap2Heap g0@@2 g1@@2) (|apply_TCFraming#condqp2| Heap1Heap g0@@2 g1@@2)))) (< NoPerm (/ (to_real 1) (to_real 2))))) (=> (and (U_2_bool (MapType2Select g0@@2 (|sk_apply_TCFraming#condqp2| (|apply_TCFraming#condqp2| Heap2Heap g0@@2 g1@@2) (|apply_TCFraming#condqp2| Heap1Heap g0@@2 g1@@2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (= (MapType0Select Heap2Heap (|sk_apply_TCFraming#condqp2| (|apply_TCFraming#condqp2| Heap2Heap g0@@2 g1@@2) (|apply_TCFraming#condqp2| Heap1Heap g0@@2 g1@@2)) next) (MapType0Select Heap1Heap (|sk_apply_TCFraming#condqp2| (|apply_TCFraming#condqp2| Heap2Heap g0@@2 g1@@2) (|apply_TCFraming#condqp2| Heap1Heap g0@@2 g1@@2)) next))))) (= (|apply_TCFraming#condqp2| Heap2Heap g0@@2 g1@@2) (|apply_TCFraming#condqp2| Heap1Heap g0@@2 g1@@2)))
 :qid |stdinbpl.1091:15|
 :skolemid |133|
 :pattern ( (|apply_TCFraming#condqp2| Heap2Heap g0@@2 g1@@2) (|apply_TCFraming#condqp2| Heap1Heap g0@@2 g1@@2) (succHeapTrans Heap2Heap Heap1Heap))
)))
(assert (forall ((arg0@@51 Int) (arg1@@29 Int) ) (! (= (type (|sk_apply_TCFraming#condqp3| arg0@@51 arg1@@29)) RefType)
 :qid |funType:sk_apply_TCFraming#condqp3|
 :pattern ( (|sk_apply_TCFraming#condqp3| arg0@@51 arg1@@29))
)))
(assert (forall ((Heap2Heap@@0 T@U) (Heap1Heap@@0 T@U) (g0@@3 T@U) (g1@@3 T@U) ) (!  (=> (and (and (and (and (= (type Heap2Heap@@0) (MapType0Type RefType)) (= (type Heap1Heap@@0) (MapType0Type RefType))) (= (type g0@@3) (MapType2Type RefType boolType))) (= (type g1@@3) (MapType2Type RefType boolType))) (and (=  (and (U_2_bool (MapType2Select g1@@3 (|sk_apply_TCFraming#condqp3| (|apply_TCFraming#condqp3| Heap2Heap@@0 g0@@3 g1@@3) (|apply_TCFraming#condqp3| Heap1Heap@@0 g0@@3 g1@@3)))) (< NoPerm (/ (to_real 1) (to_real 2))))  (and (U_2_bool (MapType2Select g1@@3 (|sk_apply_TCFraming#condqp3| (|apply_TCFraming#condqp3| Heap2Heap@@0 g0@@3 g1@@3) (|apply_TCFraming#condqp3| Heap1Heap@@0 g0@@3 g1@@3)))) (< NoPerm (/ (to_real 1) (to_real 2))))) (=> (and (U_2_bool (MapType2Select g1@@3 (|sk_apply_TCFraming#condqp3| (|apply_TCFraming#condqp3| Heap2Heap@@0 g0@@3 g1@@3) (|apply_TCFraming#condqp3| Heap1Heap@@0 g0@@3 g1@@3)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (= (MapType0Select Heap2Heap@@0 (|sk_apply_TCFraming#condqp3| (|apply_TCFraming#condqp3| Heap2Heap@@0 g0@@3 g1@@3) (|apply_TCFraming#condqp3| Heap1Heap@@0 g0@@3 g1@@3)) next) (MapType0Select Heap1Heap@@0 (|sk_apply_TCFraming#condqp3| (|apply_TCFraming#condqp3| Heap2Heap@@0 g0@@3 g1@@3) (|apply_TCFraming#condqp3| Heap1Heap@@0 g0@@3 g1@@3)) next))))) (= (|apply_TCFraming#condqp3| Heap2Heap@@0 g0@@3 g1@@3) (|apply_TCFraming#condqp3| Heap1Heap@@0 g0@@3 g1@@3)))
 :qid |stdinbpl.1101:15|
 :skolemid |134|
 :pattern ( (|apply_TCFraming#condqp3| Heap2Heap@@0 g0@@3 g1@@3) (|apply_TCFraming#condqp3| Heap1Heap@@0 g0@@3 g1@@3) (succHeapTrans Heap2Heap@@0 Heap1Heap@@0))
)))
(assert  (not (IsPredicateField next)))
(assert  (not (IsWandField next)))
(assert  (not (IsPredicateField val)))
(assert  (not (IsWandField val)))
(assert (forall ((Heap@@11 T@U) (ExhaleHeap@@3 T@U) (Mask@@8 T@U) ) (!  (=> (and (and (and (= (type Heap@@11) (MapType0Type RefType)) (= (type ExhaleHeap@@3) (MapType0Type RefType))) (= (type Mask@@8) (MapType1Type RefType realType))) (IdenticalOnKnownLocations Heap@@11 ExhaleHeap@@3 Mask@@8)) (succHeap Heap@@11 ExhaleHeap@@3))
 :qid |stdinbpl.83:15|
 :skolemid |10|
 :pattern ( (IdenticalOnKnownLocations Heap@@11 ExhaleHeap@@3 Mask@@8))
)))
(assert (forall ((EG_1@@7 T@U) (U_1 T@U) (M_1 T@U) ) (!  (=> (and (and (and (and (= (type EG_1@@7) (MapType2Type EdgeDomainTypeType boolType)) (= (type U_1) (MapType2Type RefType boolType))) (= (type M_1) (MapType2Type RefType boolType))) (apply_noExit EG_1@@7 U_1 M_1)) (forall ((u_1@@3 T@U) (v_2@@3 T@U) ) (!  (=> (and (and (= (type u_1@@3) RefType) (= (type v_2@@3) RefType)) (and (U_2_bool (MapType2Select M_1 u_1@@3)) (and (U_2_bool (MapType2Select U_1 v_2@@3)) (not (U_2_bool (MapType2Select M_1 v_2@@3)))))) (not (edge EG_1@@7 u_1@@3 v_2@@3)))
 :qid |stdinbpl.741:52|
 :skolemid |86|
 :pattern ( (edge EG_1@@7 u_1@@3 v_2@@3))
 :pattern ( (MapType2Select M_1 u_1@@3) (MapType2Select M_1 v_2@@3))
))) (forall ((u_1_1 T@U) (v_1_1 T@U) ) (!  (=> (and (and (= (type u_1_1) RefType) (= (type v_1_1) RefType)) (and (U_2_bool (MapType2Select M_1 u_1_1)) (and (U_2_bool (MapType2Select U_1 v_1_1)) (not (U_2_bool (MapType2Select M_1 v_1_1)))))) (not (exists_path EG_1@@7 u_1_1 v_1_1)))
 :qid |stdinbpl.744:17|
 :skolemid |87|
 :pattern ( (exists_path EG_1@@7 u_1_1 v_1_1))
 :pattern ( (MapType2Select M_1 u_1_1) (MapType2Select M_1 v_1_1))
)))
 :qid |stdinbpl.739:15|
 :skolemid |88|
 :pattern ( (apply_noExit EG_1@@7 U_1 M_1))
)))
(assert (forall ((EG_1@@8 T@U) (nu T@U) (n T@U) (mu T@U) (sigma T@U) ) (!  (=> (and (and (and (and (and (= (type EG_1@@8) (MapType2Type EdgeDomainTypeType boolType)) (= (type nu) RefType)) (= (type n) RefType)) (= (type mu) RefType)) (= (type sigma) RefType)) (and (not (= nu n)) (and (not (= n sigma)) (and (not (= nu mu)) (and (edge EG_1@@8 nu sigma) (edge EG_1@@8 mu sigma)))))) (not (DEP_ EG_1@@8 nu n mu sigma)))
 :qid |stdinbpl.872:15|
 :skolemid |109|
 :pattern ( (DEP EG_1@@8 nu n mu sigma))
)))
(assert (forall ((a@@10 T@U) (b@@8 T@U) ) (! (let ((T@@18 (MapType2TypeInv0 (type a@@10))))
 (=> (and (= (type a@@10) (MapType2Type T@@18 boolType)) (= (type b@@8) (MapType2Type T@@18 boolType))) (= (|Set#Equal| a@@10 b@@8) (forall ((o@@2 T@U) ) (!  (=> (= (type o@@2) T@@18) (= (U_2_bool (MapType2Select a@@10 o@@2)) (U_2_bool (MapType2Select b@@8 o@@2))))
 :qid |stdinbpl.543:31|
 :skolemid |48|
 :pattern ( (MapType2Select a@@10 o@@2))
 :pattern ( (MapType2Select b@@8 o@@2))
)))))
 :qid |stdinbpl.542:17|
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
(assert (forall ((a@@11 T@U) (b@@9 T@U) ) (! (let ((T@@19 (MultiSetTypeInv0 (type a@@11))))
 (=> (and (= (type a@@11) (MultiSetType T@@19)) (= (type b@@9) (MultiSetType T@@19))) (= (|MultiSet#Card| (|MultiSet#Union| a@@11 b@@9)) (+ (|MultiSet#Card| a@@11) (|MultiSet#Card| b@@9)))))
 :qid |stdinbpl.608:18|
 :skolemid |68|
 :pattern ( (|MultiSet#Card| (|MultiSet#Union| a@@11 b@@9)))
 :pattern ( (|MultiSet#Card| a@@11) (|MultiSet#Union| a@@11 b@@9))
 :pattern ( (|MultiSet#Card| b@@9) (|MultiSet#Union| a@@11 b@@9))
)))
(assert  (and (forall ((arg0@@52 Real) (arg1@@30 T@U) ) (! (= (type (ConditionalFrame arg0@@52 arg1@@30)) FrameTypeType)
 :qid |funType:ConditionalFrame|
 :pattern ( (ConditionalFrame arg0@@52 arg1@@30))
)) (= (type EmptyFrame) FrameTypeType)))
(assert (forall ((p@@0 Real) (f_6 T@U) ) (!  (=> (= (type f_6) FrameTypeType) (= (ConditionalFrame p@@0 f_6) (ite (> p@@0 0.0) f_6 EmptyFrame)))
 :qid |stdinbpl.444:15|
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
(assert  (and (forall ((arg0@@53 T@U) ) (! (= (type (edge_pred arg0@@53)) RefType)
 :qid |funType:edge_pred|
 :pattern ( (edge_pred arg0@@53))
)) (forall ((arg0@@54 T@U) ) (! (= (type (edge_succ arg0@@54)) RefType)
 :qid |funType:edge_succ|
 :pattern ( (edge_succ arg0@@54))
))))
(assert (forall ((p_2@@0 T@U) (s_1@@0 T@U) ) (!  (=> (and (= (type p_2@@0) RefType) (= (type s_1@@0) RefType)) (and (= (edge_pred (create_edge p_2@@0 s_1@@0)) p_2@@0) (= (edge_succ (create_edge p_2@@0 s_1@@0)) s_1@@0)))
 :qid |stdinbpl.672:15|
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
(assert (forall ((a@@12 T@U) (b@@10 T@U) (o@@3 T@U) ) (! (let ((T@@20 (type o@@3)))
 (=> (and (= (type a@@12) (MapType2Type T@@20 boolType)) (= (type b@@10) (MapType2Type T@@20 boolType))) (= (U_2_bool (MapType2Select (|Set#Intersection| a@@12 b@@10) o@@3))  (and (U_2_bool (MapType2Select a@@12 o@@3)) (U_2_bool (MapType2Select b@@10 o@@3))))))
 :qid |stdinbpl.507:18|
 :skolemid |37|
 :pattern ( (MapType2Select (|Set#Intersection| a@@12 b@@10) o@@3))
 :pattern ( (|Set#Intersection| a@@12 b@@10) (MapType2Select a@@12 o@@3))
 :pattern ( (|Set#Intersection| a@@12 b@@10) (MapType2Select b@@10 o@@3))
)))
(assert (forall ((arg0@@55 T@U) (arg1@@31 T@U) ) (! (let ((T@@21 (MapType2TypeInv0 (type arg0@@55))))
(= (type (|Set#Difference| arg0@@55 arg1@@31)) (MapType2Type T@@21 boolType)))
 :qid |funType:Set#Difference|
 :pattern ( (|Set#Difference| arg0@@55 arg1@@31))
)))
(assert (forall ((a@@13 T@U) (b@@11 T@U) (o@@4 T@U) ) (! (let ((T@@22 (type o@@4)))
 (=> (and (= (type a@@13) (MapType2Type T@@22 boolType)) (= (type b@@11) (MapType2Type T@@22 boolType))) (= (U_2_bool (MapType2Select (|Set#Difference| a@@13 b@@11) o@@4))  (and (U_2_bool (MapType2Select a@@13 o@@4)) (not (U_2_bool (MapType2Select b@@11 o@@4)))))))
 :qid |stdinbpl.522:18|
 :skolemid |43|
 :pattern ( (MapType2Select (|Set#Difference| a@@13 b@@11) o@@4))
 :pattern ( (|Set#Difference| a@@13 b@@11) (MapType2Select a@@13 o@@4))
)))
(assert (forall ((EG_1@@9 T@U) (p_2@@1 T@U) (s_1@@1 T@U) ) (!  (=> (and (and (= (type EG_1@@9) (MapType2Type EdgeDomainTypeType boolType)) (= (type p_2@@1) RefType)) (= (type s_1@@1) RefType)) (= (edge EG_1@@9 p_2@@1 s_1@@1) (edge_ EG_1@@9 p_2@@1 s_1@@1)))
 :qid |stdinbpl.727:15|
 :skolemid |84|
 :pattern ( (edge EG_1@@9 p_2@@1 s_1@@1))
)))
(assert (forall ((EG_1@@10 T@U) (start_1@@0 T@U) (end_1@@0 T@U) ) (!  (=> (and (and (= (type EG_1@@10) (MapType2Type EdgeDomainTypeType boolType)) (= (type start_1@@0) RefType)) (= (type end_1@@0) RefType)) (= (exists_path EG_1@@10 start_1@@0 end_1@@0) (exists_path_ EG_1@@10 start_1@@0 end_1@@0)))
 :qid |stdinbpl.763:15|
 :skolemid |91|
 :pattern ( (exists_path EG_1@@10 start_1@@0 end_1@@0))
)))
(assert (forall ((a@@14 T@U) (b@@12 T@U) ) (! (let ((T@@23 (MapType2TypeInv0 (type a@@14))))
 (=> (and (and (= (type a@@14) (MapType2Type T@@23 boolType)) (= (type b@@12) (MapType2Type T@@23 boolType))) (|Set#Equal| a@@14 b@@12)) (= a@@14 b@@12)))
 :qid |stdinbpl.544:17|
 :skolemid |50|
 :pattern ( (|Set#Equal| a@@14 b@@12))
)))
(assert (forall ((a@@15 T@U) (b@@13 T@U) ) (! (let ((T@@24 (MultiSetTypeInv0 (type a@@15))))
 (=> (and (and (= (type a@@15) (MultiSetType T@@24)) (= (type b@@13) (MultiSetType T@@24))) (|MultiSet#Equal| a@@15 b@@13)) (= a@@15 b@@13)))
 :qid |stdinbpl.643:17|
 :skolemid |79|
 :pattern ( (|MultiSet#Equal| a@@15 b@@13))
)))
(assert (forall ((arg0@@56 T@U) (arg1@@32 T@U) ) (! (let ((T@@25 (type arg1@@32)))
(= (type (|Set#UnionOne| arg0@@56 arg1@@32)) (MapType2Type T@@25 boolType)))
 :qid |funType:Set#UnionOne|
 :pattern ( (|Set#UnionOne| arg0@@56 arg1@@32))
)))
(assert (forall ((a@@16 T@U) (x@@9 T@U) (y@@5 T@U) ) (! (let ((T@@26 (type x@@9)))
 (=> (and (and (= (type a@@16) (MapType2Type T@@26 boolType)) (= (type y@@5) T@@26)) (U_2_bool (MapType2Select a@@16 y@@5))) (U_2_bool (MapType2Select (|Set#UnionOne| a@@16 x@@9) y@@5))))
 :qid |stdinbpl.487:18|
 :skolemid |31|
 :pattern ( (|Set#UnionOne| a@@16 x@@9) (MapType2Select a@@16 y@@5))
)))
(assert (forall ((a@@17 T@U) (b@@14 T@U) (y@@6 T@U) ) (! (let ((T@@27 (type y@@6)))
 (=> (and (and (= (type a@@17) (MapType2Type T@@27 boolType)) (= (type b@@14) (MapType2Type T@@27 boolType))) (U_2_bool (MapType2Select a@@17 y@@6))) (U_2_bool (MapType2Select (|Set#Union| a@@17 b@@14) y@@6))))
 :qid |stdinbpl.497:18|
 :skolemid |35|
 :pattern ( (|Set#Union| a@@17 b@@14) (MapType2Select a@@17 y@@6))
)))
(assert (forall ((a@@18 T@U) (b@@15 T@U) (y@@7 T@U) ) (! (let ((T@@28 (type y@@7)))
 (=> (and (and (= (type a@@18) (MapType2Type T@@28 boolType)) (= (type b@@15) (MapType2Type T@@28 boolType))) (U_2_bool (MapType2Select b@@15 y@@7))) (U_2_bool (MapType2Select (|Set#Union| a@@18 b@@15) y@@7))))
 :qid |stdinbpl.499:18|
 :skolemid |36|
 :pattern ( (|Set#Union| a@@18 b@@15) (MapType2Select b@@15 y@@7))
)))
(assert (forall ((ms T@U) (x@@10 T@U) ) (! (let ((T@@29 (type x@@10)))
 (=> (= (type ms) (MultiSetType T@@29)) (>= (|MultiSet#Select| ms x@@10) 0)))
 :qid |stdinbpl.574:18|
 :skolemid |56|
 :pattern ( (|MultiSet#Select| ms x@@10))
)))
(assert (forall ((a@@19 T@U) (x@@11 T@U) (o@@5 T@U) ) (! (let ((T@@30 (type x@@11)))
 (=> (and (= (type a@@19) (MapType2Type T@@30 boolType)) (= (type o@@5) T@@30)) (= (U_2_bool (MapType2Select (|Set#UnionOne| a@@19 x@@11) o@@5))  (or (= o@@5 x@@11) (U_2_bool (MapType2Select a@@19 o@@5))))))
 :qid |stdinbpl.483:18|
 :skolemid |29|
 :pattern ( (MapType2Select (|Set#UnionOne| a@@19 x@@11) o@@5))
)))
(assert (forall ((a@@20 T@U) (b@@16 T@U) (y@@8 T@U) ) (! (let ((T@@31 (type y@@8)))
 (=> (and (and (= (type a@@20) (MapType2Type T@@31 boolType)) (= (type b@@16) (MapType2Type T@@31 boolType))) (U_2_bool (MapType2Select b@@16 y@@8))) (not (U_2_bool (MapType2Select (|Set#Difference| a@@20 b@@16) y@@8)))))
 :qid |stdinbpl.524:18|
 :skolemid |44|
 :pattern ( (|Set#Difference| a@@20 b@@16) (MapType2Select b@@16 y@@8))
)))
(assert (forall ((arg0@@57 Int) (arg1@@33 Int) ) (! (= (type (|sk_$$#condqp1| arg0@@57 arg1@@33)) RefType)
 :qid |funType:sk_$$#condqp1|
 :pattern ( (|sk_$$#condqp1| arg0@@57 arg1@@33))
)))
(assert (forall ((Heap2Heap@@1 T@U) (Heap1Heap@@1 T@U) (refs@@3 T@U) ) (!  (=> (and (and (and (= (type Heap2Heap@@1) (MapType0Type RefType)) (= (type Heap1Heap@@1) (MapType0Type RefType))) (= (type refs@@3) (MapType2Type RefType boolType))) (and (=  (and (U_2_bool (MapType2Select refs@@3 (|sk_$$#condqp1| (|$$#condqp1| Heap2Heap@@1 refs@@3) (|$$#condqp1| Heap1Heap@@1 refs@@3)))) (< NoPerm (/ (to_real 1) (to_real 2))))  (and (U_2_bool (MapType2Select refs@@3 (|sk_$$#condqp1| (|$$#condqp1| Heap2Heap@@1 refs@@3) (|$$#condqp1| Heap1Heap@@1 refs@@3)))) (< NoPerm (/ (to_real 1) (to_real 2))))) (=> (and (U_2_bool (MapType2Select refs@@3 (|sk_$$#condqp1| (|$$#condqp1| Heap2Heap@@1 refs@@3) (|$$#condqp1| Heap1Heap@@1 refs@@3)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (= (MapType0Select Heap2Heap@@1 (|sk_$$#condqp1| (|$$#condqp1| Heap2Heap@@1 refs@@3) (|$$#condqp1| Heap1Heap@@1 refs@@3)) next) (MapType0Select Heap1Heap@@1 (|sk_$$#condqp1| (|$$#condqp1| Heap2Heap@@1 refs@@3) (|$$#condqp1| Heap1Heap@@1 refs@@3)) next))))) (= (|$$#condqp1| Heap2Heap@@1 refs@@3) (|$$#condqp1| Heap1Heap@@1 refs@@3)))
 :qid |stdinbpl.929:15|
 :skolemid |113|
 :pattern ( (|$$#condqp1| Heap2Heap@@1 refs@@3) (|$$#condqp1| Heap1Heap@@1 refs@@3) (succHeapTrans Heap2Heap@@1 Heap1Heap@@1))
)))
(assert (forall ((a@@21 T@U) (b@@17 T@U) ) (! (let ((T@@32 (MapType2TypeInv0 (type a@@21))))
 (=> (and (= (type a@@21) (MapType2Type T@@32 boolType)) (= (type b@@17) (MapType2Type T@@32 boolType))) (and (= (+ (+ (|Set#Card| (|Set#Difference| a@@21 b@@17)) (|Set#Card| (|Set#Difference| b@@17 a@@21))) (|Set#Card| (|Set#Intersection| a@@21 b@@17))) (|Set#Card| (|Set#Union| a@@21 b@@17))) (= (|Set#Card| (|Set#Difference| a@@21 b@@17)) (- (|Set#Card| a@@21) (|Set#Card| (|Set#Intersection| a@@21 b@@17)))))))
 :qid |stdinbpl.526:18|
 :skolemid |45|
 :pattern ( (|Set#Card| (|Set#Difference| a@@21 b@@17)))
)))
(assert (forall ((s T@U) ) (! (let ((T@@33 (MapType2TypeInv0 (type s))))
 (=> (= (type s) (MapType2Type T@@33 boolType)) (<= 0 (|Set#Card| s))))
 :qid |stdinbpl.469:18|
 :skolemid |22|
 :pattern ( (|Set#Card| s))
)))
(assert (forall ((s@@0 T@U) ) (! (let ((T@@34 (MultiSetTypeInv0 (type s@@0))))
 (=> (= (type s@@0) (MultiSetType T@@34)) (<= 0 (|MultiSet#Card| s@@0))))
 :qid |stdinbpl.577:18|
 :skolemid |57|
 :pattern ( (|MultiSet#Card| s@@0))
)))
(assert (forall ((T@@35 T@T) ) (! (= (type (|MultiSet#Empty| T@@35)) (MultiSetType T@@35))
 :qid |funType:MultiSet#Empty|
 :pattern ( (|MultiSet#Empty| T@@35))
)))
(assert (forall ((o@@6 T@U) ) (! (let ((T@@36 (type o@@6)))
(= (|MultiSet#Select| (|MultiSet#Empty| T@@36) o@@6) 0))
 :qid |stdinbpl.582:18|
 :skolemid |58|
 :pattern ( (let ((T@@36 (type o@@6)))
(|MultiSet#Select| (|MultiSet#Empty| T@@36) o@@6)))
)))
(assert (forall ((a@@22 T@U) (x@@12 T@U) ) (! (let ((T@@37 (type x@@12)))
 (=> (= (type a@@22) (MapType2Type T@@37 boolType)) (U_2_bool (MapType2Select (|Set#UnionOne| a@@22 x@@12) x@@12))))
 :qid |stdinbpl.485:18|
 :skolemid |30|
 :pattern ( (|Set#UnionOne| a@@22 x@@12))
)))
(assert (forall ((EG_1@@11 T@U) ) (!  (=> (= (type EG_1@@11) (MapType2Type EdgeDomainTypeType boolType)) (= (unshared_graph EG_1@@11) (forall ((v1 T@U) (v2 T@U) (v_2@@4 T@U) ) (!  (=> (and (and (and (= (type v1) RefType) (= (type v2) RefType)) (= (type v_2@@4) RefType)) (and (edge EG_1@@11 v1 v_2@@4) (edge EG_1@@11 v2 v_2@@4))) (= v1 v2))
 :qid |stdinbpl.795:43|
 :skolemid |97|
 :pattern ( (edge EG_1@@11 v1 v_2@@4) (edge EG_1@@11 v2 v_2@@4))
))))
 :qid |stdinbpl.793:15|
 :skolemid |98|
 :pattern ( (unshared_graph EG_1@@11))
)))
(assert (forall ((EG_1@@12 T@U) ) (!  (=> (= (type EG_1@@12) (MapType2Type EdgeDomainTypeType boolType)) (= (func_graph EG_1@@12) (forall ((v1@@0 T@U) (v2@@0 T@U) (v_2@@5 T@U) ) (!  (=> (and (and (and (= (type v1@@0) RefType) (= (type v2@@0) RefType)) (= (type v_2@@5) RefType)) (and (edge EG_1@@12 v_2@@5 v1@@0) (edge EG_1@@12 v_2@@5 v2@@0))) (= v1@@0 v2@@0))
 :qid |stdinbpl.804:39|
 :skolemid |99|
 :pattern ( (edge EG_1@@12 v_2@@5 v1@@0) (edge EG_1@@12 v_2@@5 v2@@0))
))))
 :qid |stdinbpl.802:15|
 :skolemid |100|
 :pattern ( (func_graph EG_1@@12))
)))
(assert (forall ((Heap@@12 T@U) (ExhaleHeap@@4 T@U) (Mask@@10 T@U) (pm_f@@1 T@U) ) (! (let ((C@@1 (FieldTypeInv0 (type pm_f@@1))))
 (=> (and (and (and (and (and (= (type Heap@@12) (MapType0Type RefType)) (= (type ExhaleHeap@@4) (MapType0Type RefType))) (= (type Mask@@10) (MapType1Type RefType realType))) (= (type pm_f@@1) (FieldType C@@1 FrameTypeType))) (IdenticalOnKnownLocations Heap@@12 ExhaleHeap@@4 Mask@@10)) (and (HasDirectPerm Mask@@10 null pm_f@@1) (IsPredicateField pm_f@@1))) (forall ((o2 T@U) (f_2@@0 T@U) ) (! (let ((B@@5 (FieldTypeInv1 (type f_2@@0))))
(let ((A@@6 (FieldTypeInv0 (type f_2@@0))))
 (=> (and (and (= (type o2) RefType) (= (type f_2@@0) (FieldType A@@6 B@@5))) (U_2_bool (MapType1Select (MapType0Select Heap@@12 null (PredicateMaskField pm_f@@1)) o2 f_2@@0))) (= (MapType0Select Heap@@12 o2 f_2@@0) (MapType0Select ExhaleHeap@@4 o2 f_2@@0)))))
 :qid |stdinbpl.54:134|
 :skolemid |3|
 :pattern ( (MapType0Select ExhaleHeap@@4 o2 f_2@@0))
))))
 :qid |stdinbpl.52:19|
 :skolemid |4|
 :pattern ( (IdenticalOnKnownLocations Heap@@12 ExhaleHeap@@4 Mask@@10) (IsPredicateField pm_f@@1))
)))
(assert (forall ((Heap@@13 T@U) (ExhaleHeap@@5 T@U) (Mask@@11 T@U) (pm_f@@2 T@U) ) (! (let ((C@@2 (FieldTypeInv0 (type pm_f@@2))))
 (=> (and (and (and (and (and (= (type Heap@@13) (MapType0Type RefType)) (= (type ExhaleHeap@@5) (MapType0Type RefType))) (= (type Mask@@11) (MapType1Type RefType realType))) (= (type pm_f@@2) (FieldType C@@2 FrameTypeType))) (IdenticalOnKnownLocations Heap@@13 ExhaleHeap@@5 Mask@@11)) (and (HasDirectPerm Mask@@11 null pm_f@@2) (IsWandField pm_f@@2))) (forall ((o2@@0 T@U) (f_2@@1 T@U) ) (! (let ((B@@6 (FieldTypeInv1 (type f_2@@1))))
(let ((A@@7 (FieldTypeInv0 (type f_2@@1))))
 (=> (and (and (= (type o2@@0) RefType) (= (type f_2@@1) (FieldType A@@7 B@@6))) (U_2_bool (MapType1Select (MapType0Select Heap@@13 null (WandMaskField pm_f@@2)) o2@@0 f_2@@1))) (= (MapType0Select Heap@@13 o2@@0 f_2@@1) (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1)))))
 :qid |stdinbpl.67:129|
 :skolemid |6|
 :pattern ( (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1))
))))
 :qid |stdinbpl.65:19|
 :skolemid |7|
 :pattern ( (IdenticalOnKnownLocations Heap@@13 ExhaleHeap@@5 Mask@@11) (IsWandField pm_f@@2))
)))
(assert (forall ((a@@23 T@U) (x@@13 T@U) ) (! (let ((T@@38 (type x@@13)))
 (=> (and (= (type a@@23) (MapType2Type T@@38 boolType)) (U_2_bool (MapType2Select a@@23 x@@13))) (= (|Set#Card| (|Set#UnionOne| a@@23 x@@13)) (|Set#Card| a@@23))))
 :qid |stdinbpl.489:18|
 :skolemid |32|
 :pattern ( (|Set#Card| (|Set#UnionOne| a@@23 x@@13)))
)))
(assert (forall ((a@@24 T@U) (x@@14 T@U) ) (! (let ((T@@39 (type x@@14)))
 (=> (= (type a@@24) (MultiSetType T@@39)) (and (> (|MultiSet#Select| (|MultiSet#UnionOne| a@@24 x@@14) x@@14) 0) (> (|MultiSet#Card| (|MultiSet#UnionOne| a@@24 x@@14)) 0))))
 :qid |stdinbpl.601:18|
 :skolemid |66|
 :pattern ( (|MultiSet#UnionOne| a@@24 x@@14))
)))
(assert (forall ((r@@1 T@U) ) (! (= (|Set#Card| (|Set#Singleton| r@@1)) 1)
 :qid |stdinbpl.480:18|
 :skolemid |28|
 :pattern ( (|Set#Card| (|Set#Singleton| r@@1)))
)))
(assert (forall ((Mask@@12 T@U) (o_2@@2 T@U) (f_4@@2 T@U) ) (! (let ((B@@7 (FieldTypeInv1 (type f_4@@2))))
(let ((A@@8 (FieldTypeInv0 (type f_4@@2))))
 (=> (and (and (and (= (type Mask@@12) (MapType1Type RefType realType)) (= (type o_2@@2) RefType)) (= (type f_4@@2) (FieldType A@@8 B@@7))) (GoodMask Mask@@12)) (and (>= (U_2_real (MapType1Select Mask@@12 o_2@@2 f_4@@2)) NoPerm) (=> (and (and (GoodMask Mask@@12) (not (IsPredicateField f_4@@2))) (not (IsWandField f_4@@2))) (<= (U_2_real (MapType1Select Mask@@12 o_2@@2 f_4@@2)) FullPerm))))))
 :qid |stdinbpl.128:22|
 :skolemid |16|
 :pattern ( (GoodMask Mask@@12) (MapType1Select Mask@@12 o_2@@2 f_4@@2))
)))
(assert (forall ((r@@2 T@U) ) (! (U_2_bool (MapType2Select (|Set#Singleton| r@@2) r@@2))
 :qid |stdinbpl.478:18|
 :skolemid |26|
 :pattern ( (|Set#Singleton| r@@2))
)))
(assert (forall ((Heap@@14 T@U) (Mask@@13 T@U) (g0@@4 T@U) (g1@@4 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@14) (MapType0Type RefType)) (= (type Mask@@13) (MapType1Type RefType realType))) (= (type g0@@4) (MapType2Type RefType boolType))) (= (type g1@@4) (MapType2Type RefType boolType))) (and (state Heap@@14 Mask@@13) (or (< AssumeFunctionsAbove 0) (|apply_TCFraming#trigger| (CombineFrames (FrameFragment (int_2_U (|apply_TCFraming#condqp2| Heap@@14 g0@@4 g1@@4))) (FrameFragment (int_2_U (|apply_TCFraming#condqp3| Heap@@14 g0@@4 g1@@4)))) g0@@4 g1@@4)))) (|Set#Equal| (|Set#Intersection| g1@@4 g0@@4) (|Set#Empty| RefType))) (forall ((u_1@@4 T@U) (v_2@@6 T@U) ) (!  (=> (and (and (= (type u_1@@4) RefType) (= (type v_2@@6) RefType)) (and (U_2_bool (MapType2Select g0@@4 u_1@@4)) (and (U_2_bool (MapType2Select g0@@4 v_2@@6)) (exists_path ($$ Heap@@14 g0@@4) u_1@@4 v_2@@6)))) (exists_path ($$ Heap@@14 (|Set#Union| g0@@4 g1@@4)) u_1@@4 v_2@@6))
 :qid |stdinbpl.1113:285|
 :skolemid |136|
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| Heap@@14 g0@@4))) g0@@4) u_1@@4 v_2@@6))
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| Heap@@14 (|Set#Union| g0@@4 g1@@4)))) (|Set#Union| g0@@4 g1@@4)) u_1@@4 v_2@@6))
)))
 :qid |stdinbpl.1111:15|
 :skolemid |137|
 :pattern ( (state Heap@@14 Mask@@13) (|apply_TCFraming'| Heap@@14 g0@@4 g1@@4))
)))
(assert (forall ((Heap@@15 T@U) (Mask@@14 T@U) (g0@@5 T@U) (g1@@5 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@15) (MapType0Type RefType)) (= (type Mask@@14) (MapType1Type RefType realType))) (= (type g0@@5) (MapType2Type RefType boolType))) (= (type g1@@5) (MapType2Type RefType boolType))) (and (state Heap@@15 Mask@@14) (or (< AssumeFunctionsAbove 0) (|apply_TCFraming#trigger| (CombineFrames (FrameFragment (int_2_U (|apply_TCFraming#condqp2| Heap@@15 g0@@5 g1@@5))) (FrameFragment (int_2_U (|apply_TCFraming#condqp3| Heap@@15 g0@@5 g1@@5)))) g0@@5 g1@@5)))) (|Set#Equal| (|Set#Intersection| g1@@5 g0@@5) (|Set#Empty| RefType))) (forall ((u_1_1@@0 T@U) (v_1_1@@0 T@U) ) (!  (=> (and (and (= (type u_1_1@@0) RefType) (= (type v_1_1@@0) RefType)) (and (U_2_bool (MapType2Select g1@@5 u_1_1@@0)) (and (U_2_bool (MapType2Select g1@@5 v_1_1@@0)) (exists_path ($$ Heap@@15 g1@@5) u_1_1@@0 v_1_1@@0)))) (exists_path ($$ Heap@@15 (|Set#Union| g1@@5 g0@@5)) u_1_1@@0 v_1_1@@0))
 :qid |stdinbpl.1120:285|
 :skolemid |138|
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| Heap@@15 g1@@5))) g1@@5) u_1_1@@0 v_1_1@@0))
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| Heap@@15 (|Set#Union| g1@@5 g0@@5)))) (|Set#Union| g1@@5 g0@@5)) u_1_1@@0 v_1_1@@0))
)))
 :qid |stdinbpl.1118:15|
 :skolemid |139|
 :pattern ( (state Heap@@15 Mask@@14) (|apply_TCFraming'| Heap@@15 g0@@5 g1@@5))
)))
(assert (forall ((a@@25 T@U) (b@@18 T@U) ) (! (let ((T@@40 (MapType2TypeInv0 (type a@@25))))
 (=> (and (= (type a@@25) (MapType2Type T@@40 boolType)) (= (type b@@18) (MapType2Type T@@40 boolType))) (= (|Set#Union| a@@25 (|Set#Union| a@@25 b@@18)) (|Set#Union| a@@25 b@@18))))
 :qid |stdinbpl.512:18|
 :skolemid |39|
 :pattern ( (|Set#Union| a@@25 (|Set#Union| a@@25 b@@18)))
)))
(assert (forall ((a@@26 T@U) (b@@19 T@U) ) (! (let ((T@@41 (MapType2TypeInv0 (type a@@26))))
 (=> (and (= (type a@@26) (MapType2Type T@@41 boolType)) (= (type b@@19) (MapType2Type T@@41 boolType))) (= (|Set#Intersection| a@@26 (|Set#Intersection| a@@26 b@@19)) (|Set#Intersection| a@@26 b@@19))))
 :qid |stdinbpl.516:18|
 :skolemid |41|
 :pattern ( (|Set#Intersection| a@@26 (|Set#Intersection| a@@26 b@@19)))
)))
(assert (forall ((a@@27 T@U) (b@@20 T@U) ) (! (let ((T@@42 (MultiSetTypeInv0 (type a@@27))))
 (=> (and (= (type a@@27) (MultiSetType T@@42)) (= (type b@@20) (MultiSetType T@@42))) (= (|MultiSet#Intersection| a@@27 (|MultiSet#Intersection| a@@27 b@@20)) (|MultiSet#Intersection| a@@27 b@@20))))
 :qid |stdinbpl.618:18|
 :skolemid |71|
 :pattern ( (|MultiSet#Intersection| a@@27 (|MultiSet#Intersection| a@@27 b@@20)))
)))
(assert (forall ((s@@1 T@U) ) (! (let ((T@@43 (MultiSetTypeInv0 (type s@@1))))
 (=> (= (type s@@1) (MultiSetType T@@43)) (and (= (= (|MultiSet#Card| s@@1) 0) (= s@@1 (|MultiSet#Empty| T@@43))) (=> (not (= (|MultiSet#Card| s@@1) 0)) (exists ((x@@15 T@U) ) (!  (and (= (type x@@15) T@@43) (< 0 (|MultiSet#Select| s@@1 x@@15)))
 :qid |stdinbpl.585:38|
 :skolemid |59|
 :no-pattern (type x@@15)
 :no-pattern (U_2_int x@@15)
 :no-pattern (U_2_bool x@@15)
))))))
 :qid |stdinbpl.583:18|
 :skolemid |60|
 :pattern ( (|MultiSet#Card| s@@1))
)))
(assert (forall ((r@@3 T@U) (o@@7 T@U) ) (! (let ((T@@44 (type r@@3)))
 (=> (= (type o@@7) T@@44) (and (= (= (|MultiSet#Select| (|MultiSet#Singleton| r@@3) o@@7) 1) (= r@@3 o@@7)) (= (= (|MultiSet#Select| (|MultiSet#Singleton| r@@3) o@@7) 0) (not (= r@@3 o@@7))))))
 :qid |stdinbpl.588:18|
 :skolemid |61|
 :pattern ( (|MultiSet#Select| (|MultiSet#Singleton| r@@3) o@@7))
)))
(assert (forall ((o@@8 T@U) (f T@U) (Heap@@16 T@U) ) (!  (=> (and (and (and (= (type o@@8) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap@@16) (MapType0Type RefType))) (U_2_bool (MapType0Select Heap@@16 o@@8 $allocated))) (U_2_bool (MapType0Select Heap@@16 (MapType0Select Heap@@16 o@@8 f) $allocated)))
 :qid |stdinbpl.31:15|
 :skolemid |0|
 :pattern ( (MapType0Select Heap@@16 o@@8 f))
)))
(assert (forall ((a@@28 T@U) (b@@21 T@U) (o@@9 T@U) ) (! (let ((T@@45 (type o@@9)))
 (=> (and (= (type a@@28) (MultiSetType T@@45)) (= (type b@@21) (MultiSetType T@@45))) (= (|MultiSet#Select| (|MultiSet#Union| a@@28 b@@21) o@@9) (+ (|MultiSet#Select| a@@28 o@@9) (|MultiSet#Select| b@@21 o@@9)))))
 :qid |stdinbpl.606:18|
 :skolemid |67|
 :pattern ( (|MultiSet#Select| (|MultiSet#Union| a@@28 b@@21) o@@9))
 :pattern ( (|MultiSet#Union| a@@28 b@@21) (|MultiSet#Select| a@@28 o@@9) (|MultiSet#Select| b@@21 o@@9))
)))
(assert (forall ((o@@10 T@U) ) (! (let ((T@@46 (type o@@10)))
 (not (U_2_bool (MapType2Select (|Set#Empty| T@@46) o@@10))))
 :qid |stdinbpl.472:18|
 :skolemid |23|
 :pattern ( (let ((T@@46 (type o@@10)))
(MapType2Select (|Set#Empty| T@@46) o@@10)))
)))
(assert (forall ((EG_1@@13 T@U) (x_1@@2 T@U) (y@@9 T@U) (v_2@@7 T@U) ) (!  (=> (and (and (and (and (= (type EG_1@@13) (MapType2Type EdgeDomainTypeType boolType)) (= (type x_1@@2) RefType)) (= (type y@@9) RefType)) (= (type v_2@@7) RefType)) (and (exists_path_ EG_1@@13 x_1@@2 y@@9) (and (edge EG_1@@13 x_1@@2 v_2@@7) (exists_path_ EG_1@@13 v_2@@7 y@@9)))) (DEP_ EG_1@@13 x_1@@2 y@@9 x_1@@2 v_2@@7))
 :qid |stdinbpl.836:15|
 :skolemid |103|
 :pattern ( (DEP EG_1@@13 x_1@@2 y@@9 x_1@@2 v_2@@7))
 :pattern ( (exists_path_ EG_1@@13 x_1@@2 y@@9) (exists_path EG_1@@13 v_2@@7 y@@9))
 :pattern ( (edge EG_1@@13 x_1@@2 v_2@@7) (exists_path_ EG_1@@13 v_2@@7 y@@9))
)))
(assert (forall ((EG_1@@14 T@U) (x_1@@3 T@U) (y@@10 T@U) (u_1@@5 T@U) ) (!  (=> (and (and (and (and (= (type EG_1@@14) (MapType2Type EdgeDomainTypeType boolType)) (= (type x_1@@3) RefType)) (= (type y@@10) RefType)) (= (type u_1@@5) RefType)) (and (exists_path_ EG_1@@14 x_1@@3 y@@10) (and (exists_path_ EG_1@@14 x_1@@3 u_1@@5) (edge EG_1@@14 u_1@@5 y@@10)))) (DEP_ EG_1@@14 x_1@@3 y@@10 u_1@@5 y@@10))
 :qid |stdinbpl.842:15|
 :skolemid |104|
 :pattern ( (DEP EG_1@@14 x_1@@3 y@@10 u_1@@5 y@@10))
 :pattern ( (exists_path_ EG_1@@14 x_1@@3 y@@10) (exists_path EG_1@@14 x_1@@3 u_1@@5))
 :pattern ( (edge EG_1@@14 u_1@@5 y@@10) (exists_path_ EG_1@@14 x_1@@3 u_1@@5))
)))
(assert (forall ((r@@4 T@U) ) (! (let ((T@@47 (type r@@4)))
(= (|MultiSet#Singleton| r@@4) (|MultiSet#UnionOne| (|MultiSet#Empty| T@@47) r@@4)))
 :qid |stdinbpl.591:18|
 :skolemid |63|
 :pattern ( (|MultiSet#Singleton| r@@4))
)))
(assert (forall ((a@@29 Int) (b@@22 Int) ) (! (= (<= a@@29 b@@22) (= (|Math#min| a@@29 b@@22) a@@29))
 :qid |stdinbpl.556:15|
 :skolemid |51|
 :pattern ( (|Math#min| a@@29 b@@22))
)))
(assert (forall ((a@@30 Int) (b@@23 Int) ) (! (= (<= b@@23 a@@30) (= (|Math#min| a@@30 b@@23) b@@23))
 :qid |stdinbpl.557:15|
 :skolemid |52|
 :pattern ( (|Math#min| a@@30 b@@23))
)))
(assert (forall ((Heap@@17 T@U) (Mask@@15 T@U) (g0@@6 T@U) (g1@@6 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@17) (MapType0Type RefType)) (= (type Mask@@15) (MapType1Type RefType realType))) (= (type g0@@6) (MapType2Type RefType boolType))) (= (type g1@@6) (MapType2Type RefType boolType))) (and (state Heap@@17 Mask@@15) (or (< AssumeFunctionsAbove 0) (|apply_TCFraming#trigger| (CombineFrames (FrameFragment (int_2_U (|apply_TCFraming#condqp2| Heap@@17 g0@@6 g1@@6))) (FrameFragment (int_2_U (|apply_TCFraming#condqp3| Heap@@17 g0@@6 g1@@6)))) g0@@6 g1@@6)))) (|Set#Equal| (|Set#Intersection| g1@@6 g0@@6) (|Set#Empty| RefType))) (forall ((u_4 T@U) (v_4 T@U) ) (!  (=> (and (and (= (type u_4) RefType) (= (type v_4) RefType)) (and (U_2_bool (MapType2Select g0@@6 u_4)) (U_2_bool (MapType2Select g0@@6 v_4)))) (__learn_trigger__ (exists_path ($$ Heap@@17 (|Set#Union| g0@@6 g1@@6)) u_4 v_4)))
 :qid |stdinbpl.1141:285|
 :skolemid |144|
 :pattern ( (DEP (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| Heap@@17 (|Set#Union| g0@@6 g1@@6)))) (|Set#Union| g0@@6 g1@@6)) u_4 v_4 u_4 (MapType0Select Heap@@17 u_4 next)))
 :pattern ( (DEP (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| Heap@@17 (|Set#Union| g0@@6 g1@@6)))) (|Set#Union| g0@@6 g1@@6)) u_4 (MapType0Select Heap@@17 v_4 next) v_4 (MapType0Select Heap@@17 v_4 next)))
)))
 :qid |stdinbpl.1139:15|
 :skolemid |145|
 :pattern ( (state Heap@@17 Mask@@15) (|apply_TCFraming'| Heap@@17 g0@@6 g1@@6))
)))
(assert (forall ((s@@2 T@U) ) (! (let ((T@@48 (MapType2TypeInv0 (type s@@2))))
 (=> (= (type s@@2) (MapType2Type T@@48 boolType)) (and (= (= (|Set#Card| s@@2) 0) (= s@@2 (|Set#Empty| T@@48))) (=> (not (= (|Set#Card| s@@2) 0)) (exists ((x@@16 T@U) ) (!  (and (= (type x@@16) T@@48) (U_2_bool (MapType2Select s@@2 x@@16)))
 :qid |stdinbpl.475:33|
 :skolemid |24|
 :no-pattern (type x@@16)
 :no-pattern (U_2_int x@@16)
 :no-pattern (U_2_bool x@@16)
))))))
 :qid |stdinbpl.473:18|
 :skolemid |25|
 :pattern ( (|Set#Card| s@@2))
)))
(assert (forall ((Heap@@18 T@U) (Mask@@16 T@U) (g0@@7 T@U) (g1@@7 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@18) (MapType0Type RefType)) (= (type Mask@@16) (MapType1Type RefType realType))) (= (type g0@@7) (MapType2Type RefType boolType))) (= (type g1@@7) (MapType2Type RefType boolType))) (and (state Heap@@18 Mask@@16) (or (< AssumeFunctionsAbove 0) (|apply_TCFraming#trigger| (CombineFrames (FrameFragment (int_2_U (|apply_TCFraming#condqp2| Heap@@18 g0@@7 g1@@7))) (FrameFragment (int_2_U (|apply_TCFraming#condqp3| Heap@@18 g0@@7 g1@@7)))) g0@@7 g1@@7)))) (|Set#Equal| (|Set#Intersection| g1@@7 g0@@7) (|Set#Empty| RefType))) (|Set#Equal| (|Set#Union| g0@@7 g1@@7) (|Set#Union| g1@@7 g0@@7)))
 :qid |stdinbpl.1107:15|
 :skolemid |135|
 :pattern ( (state Heap@@18 Mask@@16) (|apply_TCFraming'| Heap@@18 g0@@7 g1@@7))
)))
(assert (forall ((Heap@@19 T@U) (Mask@@17 T@U) (refs@@4 T@U) ) (!  (=> (and (and (and (= (type Heap@@19) (MapType0Type RefType)) (= (type Mask@@17) (MapType1Type RefType realType))) (= (type refs@@4) (MapType2Type RefType boolType))) (state Heap@@19 Mask@@17)) (= (|$$'| Heap@@19 refs@@4) (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| Heap@@19 refs@@4))) refs@@4)))
 :qid |stdinbpl.919:15|
 :skolemid |112|
 :pattern ( (state Heap@@19 Mask@@17) (|$$'| Heap@@19 refs@@4))
)))
(assert (forall ((Heap@@20 T@U) (o@@11 T@U) (f_3 T@U) (v T@U) ) (! (let ((B@@8 (type v)))
(let ((A@@9 (FieldTypeInv0 (type f_3))))
 (=> (and (and (= (type Heap@@20) (MapType0Type RefType)) (= (type o@@11) RefType)) (= (type f_3) (FieldType A@@9 B@@8))) (succHeap Heap@@20 (MapType0Store Heap@@20 o@@11 f_3 v)))))
 :qid |stdinbpl.78:22|
 :skolemid |9|
 :pattern ( (MapType0Store Heap@@20 o@@11 f_3 v))
)))
(assert (forall ((a@@31 T@U) (b@@24 T@U) ) (! (let ((T@@49 (MapType2TypeInv0 (type a@@31))))
 (=> (and (= (type a@@31) (MapType2Type T@@49 boolType)) (= (type b@@24) (MapType2Type T@@49 boolType))) (= (|Set#Subset| a@@31 b@@24) (forall ((o@@12 T@U) ) (!  (=> (and (= (type o@@12) T@@49) (U_2_bool (MapType2Select a@@31 o@@12))) (U_2_bool (MapType2Select b@@24 o@@12)))
 :qid |stdinbpl.535:32|
 :skolemid |46|
 :pattern ( (MapType2Select a@@31 o@@12))
 :pattern ( (MapType2Select b@@24 o@@12))
)))))
 :qid |stdinbpl.534:17|
 :skolemid |47|
 :pattern ( (|Set#Subset| a@@31 b@@24))
)))
(assert (forall ((Heap@@21 T@U) (Mask@@18 T@U) (refs@@5 T@U) ) (!  (=> (and (and (and (= (type Heap@@21) (MapType0Type RefType)) (= (type Mask@@18) (MapType1Type RefType realType))) (= (type refs@@5) (MapType2Type RefType boolType))) (and (state Heap@@21 Mask@@18) (or (< AssumeFunctionsAbove 1) (|$$#trigger| (FrameFragment (int_2_U (|$$#condqp1| Heap@@21 refs@@5))) refs@@5)))) (forall ((p_2@@2 T@U) (s_1@@2 T@U) ) (!  (=> (and (= (type p_2@@2) RefType) (= (type s_1@@2) RefType)) (=  (and (U_2_bool (MapType2Select refs@@5 p_2@@2)) (and (U_2_bool (MapType2Select refs@@5 s_1@@2)) (and (= (MapType0Select Heap@@21 p_2@@2 next) s_1@@2) (not (= p_2@@2 s_1@@2))))) (U_2_bool (MapType2Select (|$$'| Heap@@21 refs@@5) (create_edge p_2@@2 s_1@@2)))))
 :qid |stdinbpl.937:122|
 :skolemid |114|
 :pattern ( (create_edge p_2@@2 s_1@@2))
)))
 :qid |stdinbpl.935:15|
 :skolemid |115|
 :pattern ( (state Heap@@21 Mask@@18) (|$$'| Heap@@21 refs@@5))
)))
(assert (forall ((a@@32 T@U) (x@@17 T@U) ) (! (let ((T@@50 (type x@@17)))
 (=> (and (= (type a@@32) (MapType2Type T@@50 boolType)) (not (U_2_bool (MapType2Select a@@32 x@@17)))) (= (|Set#Card| (|Set#UnionOne| a@@32 x@@17)) (+ (|Set#Card| a@@32) 1))))
 :qid |stdinbpl.491:18|
 :skolemid |33|
 :pattern ( (|Set#Card| (|Set#UnionOne| a@@32 x@@17)))
)))
(assert (forall ((a@@33 T@U) (b@@25 T@U) (o@@13 T@U) ) (! (let ((T@@51 (type o@@13)))
 (=> (and (= (type a@@33) (MultiSetType T@@51)) (= (type b@@25) (MultiSetType T@@51))) (= (|MultiSet#Select| (|MultiSet#Difference| a@@33 b@@25) o@@13) (|Math#clip| (- (|MultiSet#Select| a@@33 o@@13) (|MultiSet#Select| b@@25 o@@13))))))
 :qid |stdinbpl.623:18|
 :skolemid |72|
 :pattern ( (|MultiSet#Select| (|MultiSet#Difference| a@@33 b@@25) o@@13))
)))
(assert (forall ((Heap@@22 T@U) (Mask@@19 T@U) (g0@@8 T@U) (g1@@8 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@22) (MapType0Type RefType)) (= (type Mask@@19) (MapType1Type RefType realType))) (= (type g0@@8) (MapType2Type RefType boolType))) (= (type g1@@8) (MapType2Type RefType boolType))) (state Heap@@22 Mask@@19)) (= (|apply_TCFraming'| Heap@@22 g0@@8 g1@@8) (|apply_TCFraming#frame| (CombineFrames (FrameFragment (int_2_U (|apply_TCFraming#condqp2| Heap@@22 g0@@8 g1@@8))) (FrameFragment (int_2_U (|apply_TCFraming#condqp3| Heap@@22 g0@@8 g1@@8)))) g0@@8 g1@@8)))
 :qid |stdinbpl.1081:15|
 :skolemid |132|
 :pattern ( (state Heap@@22 Mask@@19) (|apply_TCFraming'| Heap@@22 g0@@8 g1@@8))
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
 :qid |stdinbpl.451:25|
 :skolemid |20|
 :pattern ( (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r@@5 u))
)))
(assert (forall ((a@@34 Int) ) (!  (=> (< a@@34 0) (= (|Math#clip| a@@34) 0))
 :qid |stdinbpl.562:15|
 :skolemid |55|
 :pattern ( (|Math#clip| a@@34))
)))
(assert (forall ((EG_1@@15 T@U) ) (!  (=> (= (type EG_1@@15) (MapType2Type EdgeDomainTypeType boolType)) (= (acyclic_graph EG_1@@15) (forall ((v1@@1 T@U) (v2@@1 T@U) ) (!  (=> (and (= (type v1@@1) RefType) (= (type v2@@1) RefType)) (or (not (edge EG_1@@15 v1@@1 v2@@1)) (not (exists_path EG_1@@15 v2@@1 v1@@1))))
 :qid |stdinbpl.786:42|
 :skolemid |95|
 :pattern ( (edge EG_1@@15 v1@@1 v2@@1))
 :pattern ( (exists_path EG_1@@15 v2@@1 v1@@1))
))))
 :qid |stdinbpl.784:15|
 :skolemid |96|
 :pattern ( (acyclic_graph EG_1@@15))
)))
(assert (forall ((EG_1@@16 T@U) (x_1@@4 T@U) (y@@11 T@U) ) (!  (=> (and (and (= (type EG_1@@16) (MapType2Type EdgeDomainTypeType boolType)) (= (type x_1@@4) RefType)) (= (type y@@11) RefType)) (= (edge EG_1@@16 x_1@@4 y@@11) (DEP_ EG_1@@16 x_1@@4 y@@11 x_1@@4 y@@11)))
 :qid |stdinbpl.830:15|
 :skolemid |102|
 :pattern ( (DEP EG_1@@16 x_1@@4 y@@11 x_1@@4 y@@11))
 :pattern ( (edge EG_1@@16 x_1@@4 y@@11))
)))
(assert (forall ((EG_1@@17 T@U) (x_1@@5 T@U) (y@@12 T@U) (n@@0 T@U) ) (!  (=> (and (and (and (and (= (type EG_1@@17) (MapType2Type EdgeDomainTypeType boolType)) (= (type x_1@@5) RefType)) (= (type y@@12) RefType)) (= (type n@@0) RefType)) (not (= n@@0 y@@12))) (not (DEP_ EG_1@@17 y@@12 n@@0 x_1@@5 y@@12)))
 :qid |stdinbpl.860:15|
 :skolemid |107|
 :pattern ( (DEP EG_1@@17 y@@12 n@@0 x_1@@5 y@@12))
)))
(assert (forall ((EG_1@@18 T@U) (x_1@@6 T@U) (y@@13 T@U) (n@@1 T@U) ) (!  (=> (and (and (and (and (= (type EG_1@@18) (MapType2Type EdgeDomainTypeType boolType)) (= (type x_1@@6) RefType)) (= (type y@@13) RefType)) (= (type n@@1) RefType)) (not (= n@@1 x_1@@6))) (not (DEP_ EG_1@@18 n@@1 x_1@@6 x_1@@6 y@@13)))
 :qid |stdinbpl.866:15|
 :skolemid |108|
 :pattern ( (DEP EG_1@@18 n@@1 x_1@@6 x_1@@6 y@@13))
)))
(assert (forall ((EG_1@@19 T@U) (x_1@@7 T@U) (y@@14 T@U) (u_1@@6 T@U) (v_2@@8 T@U) ) (!  (=> (and (and (and (and (and (= (type EG_1@@19) (MapType2Type EdgeDomainTypeType boolType)) (= (type x_1@@7) RefType)) (= (type y@@14) RefType)) (= (type u_1@@6) RefType)) (= (type v_2@@8) RefType)) (not (edge EG_1@@19 u_1@@6 v_2@@8))) (not (DEP_ EG_1@@19 x_1@@7 y@@14 u_1@@6 v_2@@8)))
 :qid |stdinbpl.848:15|
 :skolemid |105|
 :pattern ( (DEP EG_1@@19 x_1@@7 y@@14 u_1@@6 v_2@@8))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
(assert (forall ((a@@35 T@U) (x@@18 T@U) (o@@14 T@U) ) (! (let ((T@@52 (type x@@18)))
 (=> (and (= (type a@@35) (MultiSetType T@@52)) (= (type o@@14) T@@52)) (= (|MultiSet#Select| (|MultiSet#UnionOne| a@@35 x@@18) o@@14) (ite (= x@@18 o@@14) (+ (|MultiSet#Select| a@@35 o@@14) 1) (|MultiSet#Select| a@@35 o@@14)))))
 :qid |stdinbpl.595:18|
 :skolemid |64|
 :pattern ( (|MultiSet#Select| (|MultiSet#UnionOne| a@@35 x@@18) o@@14))
 :pattern ( (|MultiSet#UnionOne| a@@35 x@@18) (|MultiSet#Select| a@@35 o@@14))
)))
(assert (forall ((a@@36 T@U) (b@@26 T@U) ) (! (let ((T@@53 (MultiSetTypeInv0 (type a@@36))))
 (=> (and (= (type a@@36) (MultiSetType T@@53)) (= (type b@@26) (MultiSetType T@@53))) (= (|MultiSet#Equal| a@@36 b@@26) (forall ((o@@15 T@U) ) (!  (=> (= (type o@@15) T@@53) (= (|MultiSet#Select| a@@36 o@@15) (|MultiSet#Select| b@@26 o@@15)))
 :qid |stdinbpl.641:36|
 :skolemid |77|
 :pattern ( (|MultiSet#Select| a@@36 o@@15))
 :pattern ( (|MultiSet#Select| b@@26 o@@15))
)))))
 :qid |stdinbpl.640:17|
 :skolemid |78|
 :pattern ( (|MultiSet#Equal| a@@36 b@@26))
)))
(assert (forall ((a@@37 T@U) (b@@27 T@U) ) (! (let ((T@@54 (MultiSetTypeInv0 (type a@@37))))
 (=> (and (= (type a@@37) (MultiSetType T@@54)) (= (type b@@27) (MultiSetType T@@54))) (= (|MultiSet#Subset| a@@37 b@@27) (forall ((o@@16 T@U) ) (!  (=> (= (type o@@16) T@@54) (<= (|MultiSet#Select| a@@37 o@@16) (|MultiSet#Select| b@@27 o@@16)))
 :qid |stdinbpl.637:37|
 :skolemid |75|
 :pattern ( (|MultiSet#Select| a@@37 o@@16))
 :pattern ( (|MultiSet#Select| b@@27 o@@16))
)))))
 :qid |stdinbpl.636:17|
 :skolemid |76|
 :pattern ( (|MultiSet#Subset| a@@37 b@@27))
)))
(assert (forall ((a@@38 T@U) (b@@28 T@U) (o@@17 T@U) ) (! (let ((T@@55 (type o@@17)))
 (=> (and (= (type a@@38) (MapType2Type T@@55 boolType)) (= (type b@@28) (MapType2Type T@@55 boolType))) (= (U_2_bool (MapType2Select (|Set#Union| a@@38 b@@28) o@@17))  (or (U_2_bool (MapType2Select a@@38 o@@17)) (U_2_bool (MapType2Select b@@28 o@@17))))))
 :qid |stdinbpl.495:18|
 :skolemid |34|
 :pattern ( (MapType2Select (|Set#Union| a@@38 b@@28) o@@17))
)))
(assert (forall ((Heap@@23 T@U) (g0@@9 T@U) (g1@@9 T@U) ) (!  (=> (and (and (= (type Heap@@23) (MapType0Type RefType)) (= (type g0@@9) (MapType2Type RefType boolType))) (= (type g1@@9) (MapType2Type RefType boolType))) (and (= (apply_TCFraming Heap@@23 g0@@9 g1@@9) (|apply_TCFraming'| Heap@@23 g0@@9 g1@@9)) (dummyFunction (bool_2_U (|apply_TCFraming#triggerStateless| g0@@9 g1@@9)))))
 :qid |stdinbpl.1070:15|
 :skolemid |130|
 :pattern ( (apply_TCFraming Heap@@23 g0@@9 g1@@9))
)))
(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun PostHeap@0 () T@U)
(declare-fun QPMask@31 () T@U)
(declare-fun new_g () T@U)
(declare-fun neverTriggered57 (T@U) Bool)
(declare-fun QPMask@29 () T@U)
(declare-fun QPMask@30 () T@U)
(declare-fun neverTriggered56 (T@U) Bool)
(declare-fun n_38 () T@U)
(declare-fun m_2 () T@U)
(declare-fun new_start () T@U)
(declare-fun n_37 () T@U)
(declare-fun n_36 () T@U)
(declare-fun qpRange55 (T@U) Bool)
(declare-fun invRecv55 (T@U) T@U)
(declare-fun QPMask@28 () T@U)
(declare-fun g () T@U)
(declare-fun new_node () T@U)
(declare-fun x_1@@8 () Int)
(declare-fun v$2 () T@U)
(declare-fun v1$0 () T@U)
(declare-fun v$1 () T@U)
(declare-fun v2$0 () T@U)
(declare-fun n$2_4 () T@U)
(declare-fun qpRange54 (T@U) Bool)
(declare-fun invRecv54 (T@U) T@U)
(declare-fun n_42 () T@U)
(declare-fun ExhaleHeap@0 () T@U)
(declare-fun start_1@@1 () T@U)
(declare-fun QPMask@25 () T@U)
(declare-fun n_40 () T@U)
(declare-fun qpRange65 (T@U) Bool)
(declare-fun invRecv65 (T@U) T@U)
(declare-fun QPMask@24 () T@U)
(declare-fun QPMask@27 () T@U)
(declare-fun neverTriggered64 (T@U) Bool)
(declare-fun QPMask@26 () T@U)
(declare-fun neverTriggered63 (T@U) Bool)
(declare-fun n_39 () T@U)
(declare-fun m_4 () T@U)
(declare-fun node@0 () T@U)
(declare-fun v$4_1 () T@U)
(declare-fun v1$1_1 () T@U)
(declare-fun v$3_1 () T@U)
(declare-fun v2$1_1 () T@U)
(declare-fun n$4_1 () T@U)
(declare-fun qpRange62 (T@U) Bool)
(declare-fun invRecv62 (T@U) T@U)
(declare-fun QPMask@3 () T@U)
(declare-fun n_49 () T@U)
(declare-fun n_47 () T@U)
(declare-fun neverTriggered69 (T@U) Bool)
(declare-fun QPMask@23 () T@U)
(declare-fun QPMask@22 () T@U)
(declare-fun qpRange69 (T@U) Bool)
(declare-fun invRecv69 (T@U) T@U)
(declare-fun n_44 () T@U)
(declare-fun m_11 () T@U)
(declare-fun node@1 () T@U)
(declare-fun v$4_5 () T@U)
(declare-fun v1$1_5 () T@U)
(declare-fun v$3_5 () T@U)
(declare-fun v2$1_5 () T@U)
(declare-fun n$4_5 () T@U)
(declare-fun QPMask@5 () T@U)
(declare-fun neverTriggered68 (T@U) Bool)
(declare-fun qpRange68 (T@U) Bool)
(declare-fun invRecv68 (T@U) T@U)
(declare-fun QPMask@4 () T@U)
(declare-fun qpRange66 (T@U) Bool)
(declare-fun invRecv66 (T@U) T@U)
(declare-fun qpRange67 (T@U) Bool)
(declare-fun invRecv67 (T@U) T@U)
(declare-fun new_g@0 () T@U)
(declare-fun n$0_8_1 () T@U)
(declare-fun n$0_12 () T@U)
(declare-fun ExhaleHeap@3 () T@U)
(declare-fun n_23_1 () T@U)
(declare-fun m_4_1 () T@U)
(declare-fun ExhaleHeap@5 () T@U)
(declare-fun new_start@0 () T@U)
(declare-fun n_21_1 () T@U)
(declare-fun n_19 () T@U)
(declare-fun neverTriggered59 (T@U) Bool)
(declare-fun QPMask@19 () T@U)
(declare-fun QPMask@18 () T@U)
(declare-fun qpRange59 (T@U) Bool)
(declare-fun invRecv59 (T@U) T@U)
(declare-fun new_node@0 () T@U)
(declare-fun v$2_2 () T@U)
(declare-fun v1$0_2 () T@U)
(declare-fun v$1_2 () T@U)
(declare-fun v2$0_2 () T@U)
(declare-fun n$2_2 () T@U)
(declare-fun QPMask@17 () T@U)
(declare-fun neverTriggered58 (T@U) Bool)
(declare-fun qpRange58 (T@U) Bool)
(declare-fun invRecv58 (T@U) T@U)
(declare-fun n_70 () T@U)
(declare-fun m_15 () T@U)
(declare-fun QPMask@21 () T@U)
(declare-fun neverTriggered83 (T@U) Bool)
(declare-fun QPMask@20 () T@U)
(declare-fun neverTriggered82 (T@U) Bool)
(declare-fun n_45 () T@U)
(declare-fun m_5 () T@U)
(declare-fun Heap@1 () T@U)
(declare-fun QPMask@16 () T@U)
(declare-fun Mask@11 () T@U)
(declare-fun qpRange81 (T@U) Bool)
(declare-fun invRecv81 (T@U) T@U)
(declare-fun n$0_14 () T@U)
(declare-fun Mask@10 () T@U)
(declare-fun Mask@9 () T@U)
(declare-fun neverTriggered80 (T@U) Bool)
(declare-fun qpRange80 (T@U) Bool)
(declare-fun invRecv80 (T@U) T@U)
(declare-fun ExhaleHeap@4 () T@U)
(declare-fun QPMask@15 () T@U)
(declare-fun QPMask@14 () T@U)
(declare-fun Mask@8 () T@U)
(declare-fun qpRange79 (T@U) Bool)
(declare-fun invRecv79 (T@U) T@U)
(declare-fun Mask@7 () T@U)
(declare-fun QPMask@13 () T@U)
(declare-fun neverTriggered78 (T@U) Bool)
(declare-fun qpRange78 (T@U) Bool)
(declare-fun invRecv78 (T@U) T@U)
(declare-fun arg_to@0 () T@U)
(declare-fun Heap@0 () T@U)
(declare-fun QPMask@12 () T@U)
(declare-fun Mask@6 () T@U)
(declare-fun qpRange77 (T@U) Bool)
(declare-fun invRecv77 (T@U) T@U)
(declare-fun n$0_10 () T@U)
(declare-fun Mask@5 () T@U)
(declare-fun Mask@4 () T@U)
(declare-fun neverTriggered76 (T@U) Bool)
(declare-fun qpRange76 (T@U) Bool)
(declare-fun invRecv76 (T@U) T@U)
(declare-fun ExhaleHeap@2 () T@U)
(declare-fun QPMask@11 () T@U)
(declare-fun QPMask@10 () T@U)
(declare-fun Mask@3 () T@U)
(declare-fun qpRange75 (T@U) Bool)
(declare-fun invRecv75 (T@U) T@U)
(declare-fun Mask@2 () T@U)
(declare-fun QPMask@7 () T@U)
(declare-fun neverTriggered74 (T@U) Bool)
(declare-fun qpRange74 (T@U) Bool)
(declare-fun invRecv74 (T@U) T@U)
(declare-fun QPMask@8 () T@U)
(declare-fun neverTriggered72 (T@U) Bool)
(declare-fun qpRange72 (T@U) Bool)
(declare-fun invRecv72 (T@U) T@U)
(declare-fun QPMask@9 () T@U)
(declare-fun neverTriggered73 (T@U) Bool)
(declare-fun qpRange73 (T@U) Bool)
(declare-fun invRecv73 (T@U) T@U)
(declare-fun QPMask@6 () T@U)
(declare-fun qpRange70 (T@U) Bool)
(declare-fun invRecv70 (T@U) T@U)
(declare-fun qpRange71 (T@U) Bool)
(declare-fun invRecv71 (T@U) T@U)
(declare-fun Heap@@24 () T@U)
(declare-fun n_30_2 () T@U)
(declare-fun n_28_1 () T@U)
(declare-fun neverTriggered61 (T@U) Bool)
(declare-fun QPMask@2 () T@U)
(declare-fun qpRange61 (T@U) Bool)
(declare-fun invRecv61 (T@U) T@U)
(declare-fun n_25_1 () T@U)
(declare-fun m_6 () T@U)
(declare-fun v$4 () T@U)
(declare-fun v1$1 () T@U)
(declare-fun v$3 () T@U)
(declare-fun v2$1 () T@U)
(declare-fun n$4 () T@U)
(declare-fun node () T@U)
(declare-fun Mask@0 () T@U)
(declare-fun QPMask@1 () T@U)
(declare-fun Mask@1 () T@U)
(declare-fun neverTriggered60 (T@U) Bool)
(declare-fun qpRange60 (T@U) Bool)
(declare-fun invRecv60 (T@U) T@U)
(declare-fun n_34 () T@U)
(declare-fun n_32 () T@U)
(declare-fun qpRange53 (T@U) Bool)
(declare-fun invRecv53 (T@U) T@U)
(declare-fun QPMask@0 () T@U)
(declare-fun QPMask@33 () T@U)
(declare-fun neverTriggered52 (T@U) Bool)
(declare-fun QPMask@32 () T@U)
(declare-fun neverTriggered51 (T@U) Bool)
(declare-fun n_30 () T@U)
(declare-fun m@@10 () T@U)
(declare-fun v$0 () T@U)
(declare-fun v1_3 () T@U)
(declare-fun v_18 () T@U)
(declare-fun v2_3 () T@U)
(declare-fun n$0_9 () T@U)
(declare-fun qpRange50 (T@U) Bool)
(declare-fun invRecv50 (T@U) T@U)
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (= (type g) (MapType2Type RefType boolType)) (= (type n$0_9) RefType)) (= (type QPMask@0) (MapType1Type RefType realType))) (= (type v1_3) RefType)) (= (type v2_3) RefType)) (= (type v_18) RefType)) (= (type Heap@@24) (MapType0Type RefType))) (= (type v$0) RefType)) (= (type n_30) RefType)) (= (type m@@10) RefType)) (= (type QPMask@32) (MapType1Type RefType realType))) (= (type QPMask@33) (MapType1Type RefType realType))) (= (type n_32) RefType)) (= (type start_1@@1) RefType)) (= (type QPMask@1) (MapType1Type RefType realType))) (= (type n_34) RefType)) (= (type n$4) RefType)) (= (type v1$1) RefType)) (= (type v2$1) RefType)) (= (type v$3) RefType)) (= (type v$4) RefType)) (= (type n_25_1) RefType)) (= (type m_6) RefType)) (= (type n_28_1) RefType)) (= (type n_30_2) RefType)) (= (type ExhaleHeap@0) (MapType0Type RefType))) (= (type QPMask@8) (MapType1Type RefType realType))) (= (type QPMask@7) (MapType1Type RefType realType))) (forall ((arg0@@58 T@U) ) (! (= (type (invRecv72 arg0@@58)) RefType)
 :qid |funType:invRecv72|
 :pattern ( (invRecv72 arg0@@58))
))) (= (type QPMask@9) (MapType1Type RefType realType))) (= (type new_node@0) RefType)) (forall ((arg0@@59 T@U) ) (! (= (type (invRecv73 arg0@@59)) RefType)
 :qid |funType:invRecv73|
 :pattern ( (invRecv73 arg0@@59))
))) (= (type new_g@0) (MapType2Type RefType boolType))) (= (type n$0_10) RefType)) (= (type Heap@0) (MapType0Type RefType))) (= (type n$0_14) RefType)) (= (type Heap@1) (MapType0Type RefType))) (= (type n_45) RefType)) (= (type m_5) RefType)) (= (type ExhaleHeap@5) (MapType0Type RefType))) (= (type QPMask@20) (MapType1Type RefType realType))) (= (type QPMask@17) (MapType1Type RefType realType))) (= (type node@0) RefType)) (= (type QPMask@21) (MapType1Type RefType realType))) (= (type n_70) RefType)) (= (type m_15) RefType)) (= (type n$2_2) RefType)) (= (type v1$0_2) RefType)) (= (type v2$0_2) RefType)) (= (type v$1_2) RefType)) (= (type v$2_2) RefType)) (= (type n_19) RefType)) (= (type new_start@0) RefType)) (= (type n_21_1) RefType)) (= (type n_23_1) RefType)) (= (type m_4_1) RefType)) (= (type QPMask@19) (MapType1Type RefType realType))) (= (type QPMask@18) (MapType1Type RefType realType))) (forall ((arg0@@60 T@U) ) (! (= (type (invRecv59 arg0@@60)) RefType)
 :qid |funType:invRecv59|
 :pattern ( (invRecv59 arg0@@60))
))) (forall ((arg0@@61 T@U) ) (! (= (type (invRecv58 arg0@@61)) RefType)
 :qid |funType:invRecv58|
 :pattern ( (invRecv58 arg0@@61))
))) (= (type QPMask@16) (MapType1Type RefType realType))) (= (type Mask@11) (MapType1Type RefType realType))) (forall ((arg0@@62 T@U) ) (! (= (type (invRecv81 arg0@@62)) RefType)
 :qid |funType:invRecv81|
 :pattern ( (invRecv81 arg0@@62))
))) (= (type Mask@10) (MapType1Type RefType realType))) (= (type Mask@9) (MapType1Type RefType realType))) (forall ((arg0@@63 T@U) ) (! (= (type (invRecv80 arg0@@63)) RefType)
 :qid |funType:invRecv80|
 :pattern ( (invRecv80 arg0@@63))
))) (= (type ExhaleHeap@3) (MapType0Type RefType))) (= (type QPMask@13) (MapType1Type RefType realType))) (= (type n$0_12) RefType)) (= (type ExhaleHeap@4) (MapType0Type RefType))) (= (type QPMask@15) (MapType1Type RefType realType))) (= (type QPMask@14) (MapType1Type RefType realType))) (= (type Mask@8) (MapType1Type RefType realType))) (forall ((arg0@@64 T@U) ) (! (= (type (invRecv79 arg0@@64)) RefType)
 :qid |funType:invRecv79|
 :pattern ( (invRecv79 arg0@@64))
))) (= (type Mask@7) (MapType1Type RefType realType))) (forall ((arg0@@65 T@U) ) (! (= (type (invRecv78 arg0@@65)) RefType)
 :qid |funType:invRecv78|
 :pattern ( (invRecv78 arg0@@65))
))) (= (type arg_to@0) RefType)) (= (type QPMask@12) (MapType1Type RefType realType))) (= (type Mask@6) (MapType1Type RefType realType))) (forall ((arg0@@66 T@U) ) (! (= (type (invRecv77 arg0@@66)) RefType)
 :qid |funType:invRecv77|
 :pattern ( (invRecv77 arg0@@66))
))) (= (type Mask@5) (MapType1Type RefType realType))) (= (type Mask@4) (MapType1Type RefType realType))) (forall ((arg0@@67 T@U) ) (! (= (type (invRecv76 arg0@@67)) RefType)
 :qid |funType:invRecv76|
 :pattern ( (invRecv76 arg0@@67))
))) (= (type n$0_8_1) RefType)) (= (type ExhaleHeap@2) (MapType0Type RefType))) (= (type QPMask@11) (MapType1Type RefType realType))) (= (type QPMask@10) (MapType1Type RefType realType))) (= (type Mask@3) (MapType1Type RefType realType))) (forall ((arg0@@68 T@U) ) (! (= (type (invRecv75 arg0@@68)) RefType)
 :qid |funType:invRecv75|
 :pattern ( (invRecv75 arg0@@68))
))) (= (type Mask@2) (MapType1Type RefType realType))) (forall ((arg0@@69 T@U) ) (! (= (type (invRecv74 arg0@@69)) RefType)
 :qid |funType:invRecv74|
 :pattern ( (invRecv74 arg0@@69))
))) (= (type QPMask@3) (MapType1Type RefType realType))) (= (type QPMask@6) (MapType1Type RefType realType))) (forall ((arg0@@70 T@U) ) (! (= (type (invRecv70 arg0@@70)) RefType)
 :qid |funType:invRecv70|
 :pattern ( (invRecv70 arg0@@70))
))) (forall ((arg0@@71 T@U) ) (! (= (type (invRecv71 arg0@@71)) RefType)
 :qid |funType:invRecv71|
 :pattern ( (invRecv71 arg0@@71))
))) (= (type n$4_5) RefType)) (= (type v1$1_5) RefType)) (= (type v2$1_5) RefType)) (= (type v$3_5) RefType)) (= (type v$4_5) RefType)) (= (type n_44) RefType)) (= (type m_11) RefType)) (= (type n_47) RefType)) (= (type n_49) RefType)) (= (type QPMask@23) (MapType1Type RefType realType))) (= (type QPMask@22) (MapType1Type RefType realType))) (forall ((arg0@@72 T@U) ) (! (= (type (invRecv69 arg0@@72)) RefType)
 :qid |funType:invRecv69|
 :pattern ( (invRecv69 arg0@@72))
))) (= (type node@1) RefType)) (= (type QPMask@5) (MapType1Type RefType realType))) (forall ((arg0@@73 T@U) ) (! (= (type (invRecv68 arg0@@73)) RefType)
 :qid |funType:invRecv68|
 :pattern ( (invRecv68 arg0@@73))
))) (= (type QPMask@4) (MapType1Type RefType realType))) (forall ((arg0@@74 T@U) ) (! (= (type (invRecv66 arg0@@74)) RefType)
 :qid |funType:invRecv66|
 :pattern ( (invRecv66 arg0@@74))
))) (forall ((arg0@@75 T@U) ) (! (= (type (invRecv67 arg0@@75)) RefType)
 :qid |funType:invRecv67|
 :pattern ( (invRecv67 arg0@@75))
))) (= (type n$4_1) RefType)) (= (type QPMask@24) (MapType1Type RefType realType))) (= (type v1$1_1) RefType)) (= (type v2$1_1) RefType)) (= (type v$3_1) RefType)) (= (type v$4_1) RefType)) (= (type n_39) RefType)) (= (type m_4) RefType)) (= (type QPMask@26) (MapType1Type RefType realType))) (= (type QPMask@27) (MapType1Type RefType realType))) (= (type n_40) RefType)) (= (type QPMask@25) (MapType1Type RefType realType))) (= (type n_42) RefType)) (forall ((arg0@@76 T@U) ) (! (= (type (invRecv65 arg0@@76)) RefType)
 :qid |funType:invRecv65|
 :pattern ( (invRecv65 arg0@@76))
))) (forall ((arg0@@77 T@U) ) (! (= (type (invRecv62 arg0@@77)) RefType)
 :qid |funType:invRecv62|
 :pattern ( (invRecv62 arg0@@77))
))) (= (type QPMask@2) (MapType1Type RefType realType))) (forall ((arg0@@78 T@U) ) (! (= (type (invRecv61 arg0@@78)) RefType)
 :qid |funType:invRecv61|
 :pattern ( (invRecv61 arg0@@78))
))) (= (type node) RefType)) (= (type Mask@0) (MapType1Type RefType realType))) (= (type Mask@1) (MapType1Type RefType realType))) (forall ((arg0@@79 T@U) ) (! (= (type (invRecv60 arg0@@79)) RefType)
 :qid |funType:invRecv60|
 :pattern ( (invRecv60 arg0@@79))
))) (= (type new_g) (MapType2Type RefType boolType))) (= (type n$2_4) RefType)) (= (type QPMask@28) (MapType1Type RefType realType))) (= (type v1$0) RefType)) (= (type v2$0) RefType)) (= (type v$1) RefType)) (= (type PostHeap@0) (MapType0Type RefType))) (= (type v$2) RefType)) (= (type n_36) RefType)) (= (type new_start) RefType)) (= (type QPMask@29) (MapType1Type RefType realType))) (= (type n_37) RefType)) (= (type n_38) RefType)) (= (type m_2) RefType)) (= (type QPMask@30) (MapType1Type RefType realType))) (= (type QPMask@31) (MapType1Type RefType realType))) (forall ((arg0@@80 T@U) ) (! (= (type (invRecv55 arg0@@80)) RefType)
 :qid |funType:invRecv55|
 :pattern ( (invRecv55 arg0@@80))
))) (= (type new_node) RefType)) (forall ((arg0@@81 T@U) ) (! (= (type (invRecv54 arg0@@81)) RefType)
 :qid |funType:invRecv54|
 :pattern ( (invRecv54 arg0@@81))
))) (forall ((arg0@@82 T@U) ) (! (= (type (invRecv53 arg0@@82)) RefType)
 :qid |funType:invRecv53|
 :pattern ( (invRecv53 arg0@@82))
))) (forall ((arg0@@83 T@U) ) (! (= (type (invRecv50 arg0@@83)) RefType)
 :qid |funType:invRecv50|
 :pattern ( (invRecv50 arg0@@83))
))))
(set-info :boogie-vc-id ringInsert)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 472) (let ((anon314_Then_correct  (and (=> (= (ControlFlow 0 445) (- 0 447)) (forall ((n$0_5 T@U) ) (!  (=> (= (type n$0_5) RefType) (=> (and (U_2_bool (MapType2Select new_g n$0_5)) (dummyFunction (MapType0Select PostHeap@0 n$0_5 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.5317:27|
 :skolemid |598|
 :pattern ( (MapType0Select PostHeap@0 n$0_5 next))
 :pattern ( (MapType1Select QPMask@31 n$0_5 next))
 :pattern ( (MapType0Select PostHeap@0 n$0_5 next))
))) (=> (forall ((n$0_5@@0 T@U) ) (!  (=> (= (type n$0_5@@0) RefType) (=> (and (U_2_bool (MapType2Select new_g n$0_5@@0)) (dummyFunction (MapType0Select PostHeap@0 n$0_5@@0 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.5317:27|
 :skolemid |598|
 :pattern ( (MapType0Select PostHeap@0 n$0_5@@0 next))
 :pattern ( (MapType1Select QPMask@31 n$0_5@@0 next))
 :pattern ( (MapType0Select PostHeap@0 n$0_5@@0 next))
)) (and (=> (= (ControlFlow 0 445) (- 0 446)) (forall ((n$0_5@@1 T@U) (n$0_5_1 T@U) ) (!  (=> (and (= (type n$0_5@@1) RefType) (= (type n$0_5_1) RefType)) (=> (and (and (and (and (not (= n$0_5@@1 n$0_5_1)) (U_2_bool (MapType2Select new_g n$0_5@@1))) (U_2_bool (MapType2Select new_g n$0_5_1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n$0_5@@1 n$0_5_1))))
 :qid |stdinbpl.5324:27|
 :skolemid |599|
 :pattern ( (neverTriggered57 n$0_5@@1) (neverTriggered57 n$0_5_1))
))) (=> (forall ((n$0_5@@2 T@U) (n$0_5_1@@0 T@U) ) (!  (=> (and (= (type n$0_5@@2) RefType) (= (type n$0_5_1@@0) RefType)) (=> (and (and (and (and (not (= n$0_5@@2 n$0_5_1@@0)) (U_2_bool (MapType2Select new_g n$0_5@@2))) (U_2_bool (MapType2Select new_g n$0_5_1@@0))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n$0_5@@2 n$0_5_1@@0))))
 :qid |stdinbpl.5324:27|
 :skolemid |599|
 :pattern ( (neverTriggered57 n$0_5@@2) (neverTriggered57 n$0_5_1@@0))
)) (=> (= (ControlFlow 0 445) (- 0 444)) (forall ((n$0_5@@3 T@U) ) (!  (=> (and (= (type n$0_5@@3) RefType) (U_2_bool (MapType2Select new_g n$0_5@@3))) (>= (U_2_real (MapType1Select QPMask@29 n$0_5@@3 next)) (/ (to_real 1) (to_real 2))))
 :qid |stdinbpl.5331:27|
 :skolemid |600|
 :pattern ( (MapType0Select PostHeap@0 n$0_5@@3 next))
 :pattern ( (MapType1Select QPMask@31 n$0_5@@3 next))
 :pattern ( (MapType0Select PostHeap@0 n$0_5@@3 next))
)))))))))
(let ((anon312_Then_correct  (and (=> (= (ControlFlow 0 440) (- 0 442)) (forall ((n$0_4 T@U) ) (!  (=> (= (type n$0_4) RefType) (=> (and (U_2_bool (MapType2Select new_g n$0_4)) (dummyFunction (MapType0Select PostHeap@0 n$0_4 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.5260:25|
 :skolemid |591|
 :pattern ( (MapType0Select PostHeap@0 n$0_4 next))
 :pattern ( (MapType1Select QPMask@30 n$0_4 next))
 :pattern ( (MapType0Select PostHeap@0 n$0_4 next))
))) (=> (forall ((n$0_4@@0 T@U) ) (!  (=> (= (type n$0_4@@0) RefType) (=> (and (U_2_bool (MapType2Select new_g n$0_4@@0)) (dummyFunction (MapType0Select PostHeap@0 n$0_4@@0 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.5260:25|
 :skolemid |591|
 :pattern ( (MapType0Select PostHeap@0 n$0_4@@0 next))
 :pattern ( (MapType1Select QPMask@30 n$0_4@@0 next))
 :pattern ( (MapType0Select PostHeap@0 n$0_4@@0 next))
)) (and (=> (= (ControlFlow 0 440) (- 0 441)) (forall ((n$0_4@@1 T@U) (n$0_4_1 T@U) ) (!  (=> (and (= (type n$0_4@@1) RefType) (= (type n$0_4_1) RefType)) (=> (and (and (and (and (not (= n$0_4@@1 n$0_4_1)) (U_2_bool (MapType2Select new_g n$0_4@@1))) (U_2_bool (MapType2Select new_g n$0_4_1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n$0_4@@1 n$0_4_1))))
 :qid |stdinbpl.5267:25|
 :skolemid |592|
 :pattern ( (neverTriggered56 n$0_4@@1) (neverTriggered56 n$0_4_1))
))) (=> (forall ((n$0_4@@2 T@U) (n$0_4_1@@0 T@U) ) (!  (=> (and (= (type n$0_4@@2) RefType) (= (type n$0_4_1@@0) RefType)) (=> (and (and (and (and (not (= n$0_4@@2 n$0_4_1@@0)) (U_2_bool (MapType2Select new_g n$0_4@@2))) (U_2_bool (MapType2Select new_g n$0_4_1@@0))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n$0_4@@2 n$0_4_1@@0))))
 :qid |stdinbpl.5267:25|
 :skolemid |592|
 :pattern ( (neverTriggered56 n$0_4@@2) (neverTriggered56 n$0_4_1@@0))
)) (=> (= (ControlFlow 0 440) (- 0 439)) (forall ((n$0_4@@3 T@U) ) (!  (=> (and (= (type n$0_4@@3) RefType) (U_2_bool (MapType2Select new_g n$0_4@@3))) (>= (U_2_real (MapType1Select QPMask@29 n$0_4@@3 next)) (/ (to_real 1) (to_real 2))))
 :qid |stdinbpl.5274:25|
 :skolemid |593|
 :pattern ( (MapType0Select PostHeap@0 n$0_4@@3 next))
 :pattern ( (MapType1Select QPMask@30 n$0_4@@3 next))
 :pattern ( (MapType0Select PostHeap@0 n$0_4@@3 next))
)))))))))
(let ((anon74_correct true))
(let ((anon313_Then_correct  (=> (exists_path ($$ PostHeap@0 new_g) n_38 m_2) (and (=> (= (ControlFlow 0 448) 445) anon314_Then_correct) (=> (= (ControlFlow 0 448) 437) anon74_correct)))))
(let ((anon313_Else_correct  (=> (and (not (exists_path ($$ PostHeap@0 new_g) n_38 m_2)) (= (ControlFlow 0 443) 437)) anon74_correct)))
(let ((anon311_Then_correct  (=> (and (U_2_bool (MapType2Select new_g n_38)) (U_2_bool (MapType2Select new_g m_2))) (and (and (=> (= (ControlFlow 0 449) 440) anon312_Then_correct) (=> (= (ControlFlow 0 449) 448) anon313_Then_correct)) (=> (= (ControlFlow 0 449) 443) anon313_Else_correct)))))
(let ((anon311_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select new_g n_38)) (U_2_bool (MapType2Select new_g m_2)))) (= (ControlFlow 0 438) 437)) anon74_correct)))
(let ((anon310_Else_correct true))
(let ((anon307_Else_correct  (=> (forall ((n_15 T@U) ) (!  (=> (= (type n_15) RefType) (=> (and (U_2_bool (MapType2Select new_g n_15)) (= (MapType0Select PostHeap@0 n_15 next) new_start)) (<= (U_2_int (MapType0Select PostHeap@0 (MapType0Select PostHeap@0 n_15 next) val)) (U_2_int (MapType0Select PostHeap@0 n_15 val)))))
 :qid |stdinbpl.5242:20|
 :skolemid |590|
 :pattern ( (MapType0Select PostHeap@0 (MapType0Select PostHeap@0 n_15 next) val))
)) (=> (and (state PostHeap@0 QPMask@29) (state PostHeap@0 QPMask@29)) (and (and (=> (= (ControlFlow 0 450) 436) anon310_Else_correct) (=> (= (ControlFlow 0 450) 449) anon311_Then_correct)) (=> (= (ControlFlow 0 450) 438) anon311_Else_correct))))))
(let ((anon66_correct true))
(let ((anon309_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select new_g n_37)) (= (MapType0Select PostHeap@0 n_37 next) new_start))) (= (ControlFlow 0 432) 427)) anon66_correct)))
(let ((anon309_Then_correct  (=> (and (U_2_bool (MapType2Select new_g n_37)) (= (MapType0Select PostHeap@0 n_37 next) new_start)) (and (=> (= (ControlFlow 0 428) (- 0 431)) (HasDirectPerm QPMask@29 n_37 next)) (=> (HasDirectPerm QPMask@29 n_37 next) (and (=> (= (ControlFlow 0 428) (- 0 430)) (HasDirectPerm QPMask@29 (MapType0Select PostHeap@0 n_37 next) val)) (=> (HasDirectPerm QPMask@29 (MapType0Select PostHeap@0 n_37 next) val) (and (=> (= (ControlFlow 0 428) (- 0 429)) (HasDirectPerm QPMask@29 n_37 val)) (=> (HasDirectPerm QPMask@29 n_37 val) (=> (= (ControlFlow 0 428) 427) anon66_correct))))))))))
(let ((anon308_Else_correct  (=> (not (U_2_bool (MapType2Select new_g n_37))) (and (=> (= (ControlFlow 0 435) 428) anon309_Then_correct) (=> (= (ControlFlow 0 435) 432) anon309_Else_correct)))))
(let ((anon308_Then_correct  (=> (U_2_bool (MapType2Select new_g n_37)) (and (=> (= (ControlFlow 0 433) (- 0 434)) (HasDirectPerm QPMask@29 n_37 next)) (=> (HasDirectPerm QPMask@29 n_37 next) (and (=> (= (ControlFlow 0 433) 428) anon309_Then_correct) (=> (= (ControlFlow 0 433) 432) anon309_Else_correct)))))))
(let ((anon304_Else_correct  (=> (and (forall ((n_13 T@U) ) (!  (=> (= (type n_13) RefType) (=> (and (U_2_bool (MapType2Select new_g n_13)) (not (= (MapType0Select PostHeap@0 n_13 next) new_start))) (<= (U_2_int (MapType0Select PostHeap@0 n_13 val)) (U_2_int (MapType0Select PostHeap@0 (MapType0Select PostHeap@0 n_13 next) val)))))
 :qid |stdinbpl.5220:20|
 :skolemid |589|
 :pattern ( (MapType0Select PostHeap@0 (MapType0Select PostHeap@0 n_13 next) val))
)) (state PostHeap@0 QPMask@29)) (and (and (=> (= (ControlFlow 0 451) 450) anon307_Else_correct) (=> (= (ControlFlow 0 451) 433) anon308_Then_correct)) (=> (= (ControlFlow 0 451) 435) anon308_Else_correct)))))
(let ((anon60_correct true))
(let ((anon306_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select new_g n_36)) (not (= (MapType0Select PostHeap@0 n_36 next) new_start)))) (= (ControlFlow 0 423) 418)) anon60_correct)))
(let ((anon306_Then_correct  (=> (and (U_2_bool (MapType2Select new_g n_36)) (not (= (MapType0Select PostHeap@0 n_36 next) new_start))) (and (=> (= (ControlFlow 0 419) (- 0 422)) (HasDirectPerm QPMask@29 n_36 val)) (=> (HasDirectPerm QPMask@29 n_36 val) (and (=> (= (ControlFlow 0 419) (- 0 421)) (HasDirectPerm QPMask@29 n_36 next)) (=> (HasDirectPerm QPMask@29 n_36 next) (and (=> (= (ControlFlow 0 419) (- 0 420)) (HasDirectPerm QPMask@29 (MapType0Select PostHeap@0 n_36 next) val)) (=> (HasDirectPerm QPMask@29 (MapType0Select PostHeap@0 n_36 next) val) (=> (= (ControlFlow 0 419) 418) anon60_correct))))))))))
(let ((anon305_Else_correct  (=> (not (U_2_bool (MapType2Select new_g n_36))) (and (=> (= (ControlFlow 0 426) 419) anon306_Then_correct) (=> (= (ControlFlow 0 426) 423) anon306_Else_correct)))))
(let ((anon305_Then_correct  (=> (U_2_bool (MapType2Select new_g n_36)) (and (=> (= (ControlFlow 0 424) (- 0 425)) (HasDirectPerm QPMask@29 n_36 next)) (=> (HasDirectPerm QPMask@29 n_36 next) (and (=> (= (ControlFlow 0 424) 419) anon306_Then_correct) (=> (= (ControlFlow 0 424) 423) anon306_Else_correct)))))))
(let ((anon303_Else_correct  (and (=> (= (ControlFlow 0 452) (- 0 454)) (forall ((n_11 T@U) (n_11_1 T@U) ) (!  (=> (and (= (type n_11) RefType) (= (type n_11_1) RefType)) (=> (and (and (and (and (not (= n_11 n_11_1)) (U_2_bool (MapType2Select new_g n_11))) (U_2_bool (MapType2Select new_g n_11_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_11 n_11_1))))
 :qid |stdinbpl.5161:15|
 :skolemid |583|
 :no-pattern (type n_11)
 :no-pattern (type n_11_1)
 :no-pattern (U_2_int n_11)
 :no-pattern (U_2_bool n_11)
 :no-pattern (U_2_int n_11_1)
 :no-pattern (U_2_bool n_11_1)
))) (=> (forall ((n_11@@0 T@U) (n_11_1@@0 T@U) ) (!  (=> (and (= (type n_11@@0) RefType) (= (type n_11_1@@0) RefType)) (=> (and (and (and (and (not (= n_11@@0 n_11_1@@0)) (U_2_bool (MapType2Select new_g n_11@@0))) (U_2_bool (MapType2Select new_g n_11_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_11@@0 n_11_1@@0))))
 :qid |stdinbpl.5161:15|
 :skolemid |583|
 :no-pattern (type n_11@@0)
 :no-pattern (type n_11_1@@0)
 :no-pattern (U_2_int n_11@@0)
 :no-pattern (U_2_bool n_11@@0)
 :no-pattern (U_2_int n_11_1@@0)
 :no-pattern (U_2_bool n_11_1@@0)
)) (=> (and (forall ((n_11@@1 T@U) ) (!  (=> (= (type n_11@@1) RefType) (=> (and (U_2_bool (MapType2Select new_g n_11@@1)) (< NoPerm FullPerm)) (and (qpRange55 n_11@@1) (= (invRecv55 n_11@@1) n_11@@1))))
 :qid |stdinbpl.5167:22|
 :skolemid |584|
 :pattern ( (MapType0Select PostHeap@0 n_11@@1 val))
 :pattern ( (MapType1Select QPMask@29 n_11@@1 val))
 :pattern ( (MapType0Select PostHeap@0 n_11@@1 val))
)) (forall ((o_3 T@U) ) (!  (=> (= (type o_3) RefType) (=> (and (and (U_2_bool (MapType2Select new_g (invRecv55 o_3))) (< NoPerm FullPerm)) (qpRange55 o_3)) (= (invRecv55 o_3) o_3)))
 :qid |stdinbpl.5171:22|
 :skolemid |585|
 :pattern ( (invRecv55 o_3))
))) (=> (and (and (and (forall ((n_11@@2 T@U) ) (!  (=> (and (= (type n_11@@2) RefType) (U_2_bool (MapType2Select new_g n_11@@2))) (not (= n_11@@2 null)))
 :qid |stdinbpl.5177:22|
 :skolemid |586|
 :pattern ( (MapType0Select PostHeap@0 n_11@@2 val))
 :pattern ( (MapType1Select QPMask@29 n_11@@2 val))
 :pattern ( (MapType0Select PostHeap@0 n_11@@2 val))
)) (forall ((o_3@@0 T@U) ) (!  (=> (= (type o_3@@0) RefType) (and (=> (and (and (U_2_bool (MapType2Select new_g (invRecv55 o_3@@0))) (< NoPerm FullPerm)) (qpRange55 o_3@@0)) (and (=> (< NoPerm FullPerm) (= (invRecv55 o_3@@0) o_3@@0)) (= (U_2_real (MapType1Select QPMask@29 o_3@@0 val)) (+ (U_2_real (MapType1Select QPMask@28 o_3@@0 val)) FullPerm)))) (=> (not (and (and (U_2_bool (MapType2Select new_g (invRecv55 o_3@@0))) (< NoPerm FullPerm)) (qpRange55 o_3@@0))) (= (U_2_real (MapType1Select QPMask@29 o_3@@0 val)) (U_2_real (MapType1Select QPMask@28 o_3@@0 val))))))
 :qid |stdinbpl.5183:22|
 :skolemid |587|
 :pattern ( (MapType1Select QPMask@29 o_3@@0 val))
))) (and (forall ((o_3@@1 T@U) (f_5 T@U) ) (! (let ((B@@11 (FieldTypeInv1 (type f_5))))
(let ((A@@12 (FieldTypeInv0 (type f_5))))
 (=> (and (and (= (type o_3@@1) RefType) (= (type f_5) (FieldType A@@12 B@@11))) (not (= f_5 val))) (= (U_2_real (MapType1Select QPMask@28 o_3@@1 f_5)) (U_2_real (MapType1Select QPMask@29 o_3@@1 f_5))))))
 :qid |stdinbpl.5187:29|
 :skolemid |588|
 :pattern ( (MapType1Select QPMask@28 o_3@@1 f_5))
 :pattern ( (MapType1Select QPMask@29 o_3@@1 f_5))
)) (state PostHeap@0 QPMask@29))) (and (and (state PostHeap@0 QPMask@29) (not (U_2_bool (MapType2Select g new_node)))) (and (U_2_bool (MapType2Select new_g new_node)) (state PostHeap@0 QPMask@29)))) (and (=> (= (ControlFlow 0 452) (- 0 453)) (HasDirectPerm QPMask@29 new_node val)) (=> (HasDirectPerm QPMask@29 new_node val) (=> (and (= (U_2_int (MapType0Select PostHeap@0 new_node val)) x_1@@8) (state PostHeap@0 QPMask@29)) (and (and (=> (= (ControlFlow 0 452) 451) anon304_Else_correct) (=> (= (ControlFlow 0 452) 424) anon305_Then_correct)) (=> (= (ControlFlow 0 452) 426) anon305_Else_correct)))))))))))
(let ((anon303_Then_correct true))
(let ((anon301_Else_correct  (=> (and (and (forall ((v$2_1 T@U) ) (!  (=> (and (= (type v$2_1) RefType) (U_2_bool (MapType2Select new_g v$2_1))) (= (= v$2_1 (MapType0Select PostHeap@0 v$2_1 next)) (|Set#Equal| new_g (|Set#Singleton| v$2_1))))
 :qid |stdinbpl.5147:20|
 :skolemid |582|
 :pattern ( (MapType0Select PostHeap@0 v$2_1 next))
)) (state PostHeap@0 QPMask@28)) (and (U_2_bool (MapType2Select new_g new_start)) (state PostHeap@0 QPMask@28))) (and (=> (= (ControlFlow 0 455) 417) anon303_Then_correct) (=> (= (ControlFlow 0 455) 452) anon303_Else_correct)))))
(let ((anon52_correct true))
(let ((anon302_Else_correct  (=> (and (not (U_2_bool (MapType2Select new_g v$2))) (= (ControlFlow 0 416) 413)) anon52_correct)))
(let ((anon302_Then_correct  (=> (U_2_bool (MapType2Select new_g v$2)) (and (=> (= (ControlFlow 0 414) (- 0 415)) (HasDirectPerm QPMask@28 v$2 next)) (=> (HasDirectPerm QPMask@28 v$2 next) (=> (= (ControlFlow 0 414) 413) anon52_correct))))))
(let ((anon298_Else_correct  (=> (forall ((v1$0_1 T@U) (v2$0_1 T@U) (v$1_1 T@U) ) (!  (=> (and (and (and (and (= (type v1$0_1) RefType) (= (type v2$0_1) RefType)) (= (type v$1_1) RefType)) (and (U_2_bool (MapType2Select new_g v1$0_1)) (and (U_2_bool (MapType2Select new_g v2$0_1)) (U_2_bool (MapType2Select new_g v$1_1))))) (and (= (MapType0Select PostHeap@0 v1$0_1 next) v$1_1) (= (MapType0Select PostHeap@0 v2$0_1 next) v$1_1))) (= v1$0_1 v2$0_1))
 :qid |stdinbpl.5134:20|
 :skolemid |581|
 :pattern ( (MapType2Select new_g v$1_1) (MapType0Select PostHeap@0 v1$0_1 next) (MapType0Select PostHeap@0 v2$0_1 next))
)) (and (and (=> (= (ControlFlow 0 456) 455) anon301_Else_correct) (=> (= (ControlFlow 0 456) 414) anon302_Then_correct)) (=> (= (ControlFlow 0 456) 416) anon302_Else_correct)))))
(let ((anon48_correct true))
(let ((anon300_Else_correct  (=> (and (not (= (MapType0Select PostHeap@0 v1$0 next) v$1)) (= (ControlFlow 0 410) 406)) anon48_correct)))
(let ((anon300_Then_correct  (=> (= (MapType0Select PostHeap@0 v1$0 next) v$1) (and (=> (= (ControlFlow 0 408) (- 0 409)) (HasDirectPerm QPMask@28 v2$0 next)) (=> (HasDirectPerm QPMask@28 v2$0 next) (=> (= (ControlFlow 0 408) 406) anon48_correct))))))
(let ((anon299_Then_correct  (=> (and (U_2_bool (MapType2Select new_g v1$0)) (and (U_2_bool (MapType2Select new_g v2$0)) (U_2_bool (MapType2Select new_g v$1)))) (and (=> (= (ControlFlow 0 411) (- 0 412)) (HasDirectPerm QPMask@28 v1$0 next)) (=> (HasDirectPerm QPMask@28 v1$0 next) (and (=> (= (ControlFlow 0 411) 408) anon300_Then_correct) (=> (= (ControlFlow 0 411) 410) anon300_Else_correct)))))))
(let ((anon299_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select new_g v1$0)) (and (U_2_bool (MapType2Select new_g v2$0)) (U_2_bool (MapType2Select new_g v$1))))) (= (ControlFlow 0 407) 406)) anon48_correct)))
(let ((anon296_Else_correct  (=> (and (forall ((n$2_1 T@U) ) (!  (=> (and (= (type n$2_1) RefType) (U_2_bool (MapType2Select new_g n$2_1))) (U_2_bool (MapType2Select new_g (MapType0Select PostHeap@0 n$2_1 next))))
 :qid |stdinbpl.5116:20|
 :skolemid |580|
 :pattern ( (MapType2Select new_g (MapType0Select PostHeap@0 n$2_1 next)))
 :pattern ( (MapType2Select new_g n$2_1) (MapType0Select PostHeap@0 n$2_1 next))
)) (state PostHeap@0 QPMask@28)) (and (and (=> (= (ControlFlow 0 457) 456) anon298_Else_correct) (=> (= (ControlFlow 0 457) 411) anon299_Then_correct)) (=> (= (ControlFlow 0 457) 407) anon299_Else_correct)))))
(let ((anon43_correct true))
(let ((anon297_Else_correct  (=> (and (not (U_2_bool (MapType2Select new_g n$2_4))) (= (ControlFlow 0 405) 402)) anon43_correct)))
(let ((anon297_Then_correct  (=> (U_2_bool (MapType2Select new_g n$2_4)) (and (=> (= (ControlFlow 0 403) (- 0 404)) (HasDirectPerm QPMask@28 n$2_4 next)) (=> (HasDirectPerm QPMask@28 n$2_4 next) (=> (= (ControlFlow 0 403) 402) anon43_correct))))))
(let ((anon295_Else_correct  (and (=> (= (ControlFlow 0 458) (- 0 459)) (forall ((n$1_1 T@U) (n$1_1_1 T@U) ) (!  (=> (and (= (type n$1_1) RefType) (= (type n$1_1_1) RefType)) (=> (and (and (and (and (not (= n$1_1 n$1_1_1)) (U_2_bool (MapType2Select new_g n$1_1))) (U_2_bool (MapType2Select new_g n$1_1_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$1_1 n$1_1_1))))
 :qid |stdinbpl.5075:15|
 :skolemid |574|
 :no-pattern (type n$1_1)
 :no-pattern (type n$1_1_1)
 :no-pattern (U_2_int n$1_1)
 :no-pattern (U_2_bool n$1_1)
 :no-pattern (U_2_int n$1_1_1)
 :no-pattern (U_2_bool n$1_1_1)
))) (=> (forall ((n$1_1@@0 T@U) (n$1_1_1@@0 T@U) ) (!  (=> (and (= (type n$1_1@@0) RefType) (= (type n$1_1_1@@0) RefType)) (=> (and (and (and (and (not (= n$1_1@@0 n$1_1_1@@0)) (U_2_bool (MapType2Select new_g n$1_1@@0))) (U_2_bool (MapType2Select new_g n$1_1_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$1_1@@0 n$1_1_1@@0))))
 :qid |stdinbpl.5075:15|
 :skolemid |574|
 :no-pattern (type n$1_1@@0)
 :no-pattern (type n$1_1_1@@0)
 :no-pattern (U_2_int n$1_1@@0)
 :no-pattern (U_2_bool n$1_1@@0)
 :no-pattern (U_2_int n$1_1_1@@0)
 :no-pattern (U_2_bool n$1_1_1@@0)
)) (=> (and (forall ((n$1_1@@1 T@U) ) (!  (=> (= (type n$1_1@@1) RefType) (=> (and (U_2_bool (MapType2Select new_g n$1_1@@1)) (< NoPerm FullPerm)) (and (qpRange54 n$1_1@@1) (= (invRecv54 n$1_1@@1) n$1_1@@1))))
 :qid |stdinbpl.5081:22|
 :skolemid |575|
 :pattern ( (MapType0Select PostHeap@0 n$1_1@@1 next))
 :pattern ( (MapType1Select QPMask@28 n$1_1@@1 next))
 :pattern ( (MapType0Select PostHeap@0 n$1_1@@1 next))
)) (forall ((o_3@@2 T@U) ) (!  (=> (= (type o_3@@2) RefType) (=> (and (and (U_2_bool (MapType2Select new_g (invRecv54 o_3@@2))) (< NoPerm FullPerm)) (qpRange54 o_3@@2)) (= (invRecv54 o_3@@2) o_3@@2)))
 :qid |stdinbpl.5085:22|
 :skolemid |576|
 :pattern ( (invRecv54 o_3@@2))
))) (=> (and (and (forall ((n$1_1@@2 T@U) ) (!  (=> (and (= (type n$1_1@@2) RefType) (U_2_bool (MapType2Select new_g n$1_1@@2))) (not (= n$1_1@@2 null)))
 :qid |stdinbpl.5091:22|
 :skolemid |577|
 :pattern ( (MapType0Select PostHeap@0 n$1_1@@2 next))
 :pattern ( (MapType1Select QPMask@28 n$1_1@@2 next))
 :pattern ( (MapType0Select PostHeap@0 n$1_1@@2 next))
)) (forall ((o_3@@3 T@U) ) (!  (=> (= (type o_3@@3) RefType) (and (=> (and (and (U_2_bool (MapType2Select new_g (invRecv54 o_3@@3))) (< NoPerm FullPerm)) (qpRange54 o_3@@3)) (and (=> (< NoPerm FullPerm) (= (invRecv54 o_3@@3) o_3@@3)) (= (U_2_real (MapType1Select QPMask@28 o_3@@3 next)) (+ (U_2_real (MapType1Select ZeroMask o_3@@3 next)) FullPerm)))) (=> (not (and (and (U_2_bool (MapType2Select new_g (invRecv54 o_3@@3))) (< NoPerm FullPerm)) (qpRange54 o_3@@3))) (= (U_2_real (MapType1Select QPMask@28 o_3@@3 next)) (U_2_real (MapType1Select ZeroMask o_3@@3 next))))))
 :qid |stdinbpl.5097:22|
 :skolemid |578|
 :pattern ( (MapType1Select QPMask@28 o_3@@3 next))
))) (and (forall ((o_3@@4 T@U) (f_5@@0 T@U) ) (! (let ((B@@12 (FieldTypeInv1 (type f_5@@0))))
(let ((A@@13 (FieldTypeInv0 (type f_5@@0))))
 (=> (and (and (= (type o_3@@4) RefType) (= (type f_5@@0) (FieldType A@@13 B@@12))) (not (= f_5@@0 next))) (= (U_2_real (MapType1Select ZeroMask o_3@@4 f_5@@0)) (U_2_real (MapType1Select QPMask@28 o_3@@4 f_5@@0))))))
 :qid |stdinbpl.5101:29|
 :skolemid |579|
 :pattern ( (MapType1Select ZeroMask o_3@@4 f_5@@0))
 :pattern ( (MapType1Select QPMask@28 o_3@@4 f_5@@0))
)) (state PostHeap@0 QPMask@28))) (and (and (=> (= (ControlFlow 0 458) 457) anon296_Else_correct) (=> (= (ControlFlow 0 458) 403) anon297_Then_correct)) (=> (= (ControlFlow 0 458) 405) anon297_Else_correct))))))))
(let ((anon295_Then_correct true))
(let ((anon294_Then_correct  (=> (and (state PostHeap@0 ZeroMask) (not (U_2_bool (MapType2Select new_g null)))) (and (=> (= (ControlFlow 0 460) 401) anon295_Then_correct) (=> (= (ControlFlow 0 460) 458) anon295_Else_correct)))))
(let ((anon138_correct true))
(let ((anon348_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select g n_42)) (= (MapType0Select ExhaleHeap@0 n_42 next) start_1@@1))) (= (ControlFlow 0 374) 369)) anon138_correct)))
(let ((anon348_Then_correct  (=> (and (U_2_bool (MapType2Select g n_42)) (= (MapType0Select ExhaleHeap@0 n_42 next) start_1@@1)) (and (=> (= (ControlFlow 0 370) (- 0 373)) (HasDirectPerm QPMask@25 n_42 next)) (=> (HasDirectPerm QPMask@25 n_42 next) (and (=> (= (ControlFlow 0 370) (- 0 372)) (HasDirectPerm QPMask@25 (MapType0Select ExhaleHeap@0 n_42 next) val)) (=> (HasDirectPerm QPMask@25 (MapType0Select ExhaleHeap@0 n_42 next) val) (and (=> (= (ControlFlow 0 370) (- 0 371)) (HasDirectPerm QPMask@25 n_42 val)) (=> (HasDirectPerm QPMask@25 n_42 val) (=> (= (ControlFlow 0 370) 369) anon138_correct))))))))))
(let ((anon347_Else_correct  (=> (not (U_2_bool (MapType2Select g n_42))) (and (=> (= (ControlFlow 0 377) 370) anon348_Then_correct) (=> (= (ControlFlow 0 377) 374) anon348_Else_correct)))))
(let ((anon347_Then_correct  (=> (U_2_bool (MapType2Select g n_42)) (and (=> (= (ControlFlow 0 375) (- 0 376)) (HasDirectPerm QPMask@25 n_42 next)) (=> (HasDirectPerm QPMask@25 n_42 next) (and (=> (= (ControlFlow 0 375) 370) anon348_Then_correct) (=> (= (ControlFlow 0 375) 374) anon348_Else_correct)))))))
(let ((anon346_Else_correct true))
(let ((anon343_Else_correct  (=> (and (forall ((n_37_1 T@U) ) (!  (=> (= (type n_37_1) RefType) (=> (and (U_2_bool (MapType2Select g n_37_1)) (not (= (MapType0Select ExhaleHeap@0 n_37_1 next) start_1@@1))) (<= (U_2_int (MapType0Select ExhaleHeap@0 n_37_1 val)) (U_2_int (MapType0Select ExhaleHeap@0 (MapType0Select ExhaleHeap@0 n_37_1 next) val)))))
 :qid |stdinbpl.5854:24|
 :skolemid |654|
 :pattern ( (MapType0Select ExhaleHeap@0 (MapType0Select ExhaleHeap@0 n_37_1 next) val))
)) (state ExhaleHeap@0 QPMask@25)) (and (and (=> (= (ControlFlow 0 378) 368) anon346_Else_correct) (=> (= (ControlFlow 0 378) 375) anon347_Then_correct)) (=> (= (ControlFlow 0 378) 377) anon347_Else_correct)))))
(let ((anon132_correct true))
(let ((anon345_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select g n_40)) (not (= (MapType0Select ExhaleHeap@0 n_40 next) start_1@@1)))) (= (ControlFlow 0 364) 359)) anon132_correct)))
(let ((anon345_Then_correct  (=> (and (U_2_bool (MapType2Select g n_40)) (not (= (MapType0Select ExhaleHeap@0 n_40 next) start_1@@1))) (and (=> (= (ControlFlow 0 360) (- 0 363)) (HasDirectPerm QPMask@25 n_40 val)) (=> (HasDirectPerm QPMask@25 n_40 val) (and (=> (= (ControlFlow 0 360) (- 0 362)) (HasDirectPerm QPMask@25 n_40 next)) (=> (HasDirectPerm QPMask@25 n_40 next) (and (=> (= (ControlFlow 0 360) (- 0 361)) (HasDirectPerm QPMask@25 (MapType0Select ExhaleHeap@0 n_40 next) val)) (=> (HasDirectPerm QPMask@25 (MapType0Select ExhaleHeap@0 n_40 next) val) (=> (= (ControlFlow 0 360) 359) anon132_correct))))))))))
(let ((anon344_Else_correct  (=> (not (U_2_bool (MapType2Select g n_40))) (and (=> (= (ControlFlow 0 367) 360) anon345_Then_correct) (=> (= (ControlFlow 0 367) 364) anon345_Else_correct)))))
(let ((anon344_Then_correct  (=> (U_2_bool (MapType2Select g n_40)) (and (=> (= (ControlFlow 0 365) (- 0 366)) (HasDirectPerm QPMask@25 n_40 next)) (=> (HasDirectPerm QPMask@25 n_40 next) (and (=> (= (ControlFlow 0 365) 360) anon345_Then_correct) (=> (= (ControlFlow 0 365) 364) anon345_Else_correct)))))))
(let ((anon342_Else_correct  (and (=> (= (ControlFlow 0 379) (- 0 380)) (forall ((n_35 T@U) (n_35_1 T@U) ) (!  (=> (and (= (type n_35) RefType) (= (type n_35_1) RefType)) (=> (and (and (and (and (not (= n_35 n_35_1)) (U_2_bool (MapType2Select g n_35))) (U_2_bool (MapType2Select g n_35_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_35 n_35_1))))
 :qid |stdinbpl.5804:19|
 :skolemid |648|
 :no-pattern (type n_35)
 :no-pattern (type n_35_1)
 :no-pattern (U_2_int n_35)
 :no-pattern (U_2_bool n_35)
 :no-pattern (U_2_int n_35_1)
 :no-pattern (U_2_bool n_35_1)
))) (=> (forall ((n_35@@0 T@U) (n_35_1@@0 T@U) ) (!  (=> (and (= (type n_35@@0) RefType) (= (type n_35_1@@0) RefType)) (=> (and (and (and (and (not (= n_35@@0 n_35_1@@0)) (U_2_bool (MapType2Select g n_35@@0))) (U_2_bool (MapType2Select g n_35_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_35@@0 n_35_1@@0))))
 :qid |stdinbpl.5804:19|
 :skolemid |648|
 :no-pattern (type n_35@@0)
 :no-pattern (type n_35_1@@0)
 :no-pattern (U_2_int n_35@@0)
 :no-pattern (U_2_bool n_35@@0)
 :no-pattern (U_2_int n_35_1@@0)
 :no-pattern (U_2_bool n_35_1@@0)
)) (=> (forall ((n_35@@1 T@U) ) (!  (=> (= (type n_35@@1) RefType) (=> (and (U_2_bool (MapType2Select g n_35@@1)) (< NoPerm FullPerm)) (and (qpRange65 n_35@@1) (= (invRecv65 n_35@@1) n_35@@1))))
 :qid |stdinbpl.5810:26|
 :skolemid |649|
 :pattern ( (MapType0Select ExhaleHeap@0 n_35@@1 val))
 :pattern ( (MapType1Select QPMask@25 n_35@@1 val))
 :pattern ( (MapType0Select ExhaleHeap@0 n_35@@1 val))
)) (=> (and (forall ((o_3@@5 T@U) ) (!  (=> (= (type o_3@@5) RefType) (=> (and (and (U_2_bool (MapType2Select g (invRecv65 o_3@@5))) (< NoPerm FullPerm)) (qpRange65 o_3@@5)) (= (invRecv65 o_3@@5) o_3@@5)))
 :qid |stdinbpl.5814:26|
 :skolemid |650|
 :pattern ( (invRecv65 o_3@@5))
)) (forall ((n_35@@2 T@U) ) (!  (=> (and (= (type n_35@@2) RefType) (U_2_bool (MapType2Select g n_35@@2))) (not (= n_35@@2 null)))
 :qid |stdinbpl.5820:26|
 :skolemid |651|
 :pattern ( (MapType0Select ExhaleHeap@0 n_35@@2 val))
 :pattern ( (MapType1Select QPMask@25 n_35@@2 val))
 :pattern ( (MapType0Select ExhaleHeap@0 n_35@@2 val))
))) (=> (and (and (forall ((o_3@@6 T@U) ) (!  (=> (= (type o_3@@6) RefType) (and (=> (and (and (U_2_bool (MapType2Select g (invRecv65 o_3@@6))) (< NoPerm FullPerm)) (qpRange65 o_3@@6)) (and (=> (< NoPerm FullPerm) (= (invRecv65 o_3@@6) o_3@@6)) (= (U_2_real (MapType1Select QPMask@25 o_3@@6 val)) (+ (U_2_real (MapType1Select QPMask@24 o_3@@6 val)) FullPerm)))) (=> (not (and (and (U_2_bool (MapType2Select g (invRecv65 o_3@@6))) (< NoPerm FullPerm)) (qpRange65 o_3@@6))) (= (U_2_real (MapType1Select QPMask@25 o_3@@6 val)) (U_2_real (MapType1Select QPMask@24 o_3@@6 val))))))
 :qid |stdinbpl.5826:26|
 :skolemid |652|
 :pattern ( (MapType1Select QPMask@25 o_3@@6 val))
)) (forall ((o_3@@7 T@U) (f_5@@1 T@U) ) (! (let ((B@@13 (FieldTypeInv1 (type f_5@@1))))
(let ((A@@14 (FieldTypeInv0 (type f_5@@1))))
 (=> (and (and (= (type o_3@@7) RefType) (= (type f_5@@1) (FieldType A@@14 B@@13))) (not (= f_5@@1 val))) (= (U_2_real (MapType1Select QPMask@24 o_3@@7 f_5@@1)) (U_2_real (MapType1Select QPMask@25 o_3@@7 f_5@@1))))))
 :qid |stdinbpl.5830:33|
 :skolemid |653|
 :pattern ( (MapType1Select QPMask@24 o_3@@7 f_5@@1))
 :pattern ( (MapType1Select QPMask@25 o_3@@7 f_5@@1))
))) (and (state ExhaleHeap@0 QPMask@25) (state ExhaleHeap@0 QPMask@25))) (and (and (=> (= (ControlFlow 0 379) 378) anon343_Else_correct) (=> (= (ControlFlow 0 379) 365) anon344_Then_correct)) (=> (= (ControlFlow 0 379) 367) anon344_Else_correct)))))))))
(let ((anon342_Then_correct true))
(let ((anon337_Else_correct  (=> (and (forall ((n_33 T@U) (m_9 T@U) ) (!  (=> (and (and (= (type n_33) RefType) (= (type m_9) RefType)) (and (U_2_bool (MapType2Select g n_33)) (U_2_bool (MapType2Select g m_9)))) (and (exists_path ($$ ExhaleHeap@0 g) n_33 m_9) (exists_path ($$ ExhaleHeap@0 g) m_9 n_33)))
 :qid |stdinbpl.5792:24|
 :skolemid |647|
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| ExhaleHeap@0 g))) g) n_33 m_9))
)) (state ExhaleHeap@0 QPMask@24)) (and (=> (= (ControlFlow 0 381) 358) anon342_Then_correct) (=> (= (ControlFlow 0 381) 379) anon342_Else_correct)))))
(let ((anon341_Then_correct  (and (=> (= (ControlFlow 0 353) (- 0 355)) (forall ((n$0_7 T@U) ) (!  (=> (= (type n$0_7) RefType) (=> (and (U_2_bool (MapType2Select g n$0_7)) (dummyFunction (MapType0Select ExhaleHeap@0 n$0_7 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.5740:31|
 :skolemid |640|
 :pattern ( (MapType0Select ExhaleHeap@0 n$0_7 next))
 :pattern ( (MapType1Select QPMask@27 n$0_7 next))
 :pattern ( (MapType0Select ExhaleHeap@0 n$0_7 next))
))) (=> (forall ((n$0_7@@0 T@U) ) (!  (=> (= (type n$0_7@@0) RefType) (=> (and (U_2_bool (MapType2Select g n$0_7@@0)) (dummyFunction (MapType0Select ExhaleHeap@0 n$0_7@@0 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.5740:31|
 :skolemid |640|
 :pattern ( (MapType0Select ExhaleHeap@0 n$0_7@@0 next))
 :pattern ( (MapType1Select QPMask@27 n$0_7@@0 next))
 :pattern ( (MapType0Select ExhaleHeap@0 n$0_7@@0 next))
)) (and (=> (= (ControlFlow 0 353) (- 0 354)) (forall ((n$0_7@@1 T@U) (n$0_7_1 T@U) ) (!  (=> (and (= (type n$0_7@@1) RefType) (= (type n$0_7_1) RefType)) (=> (and (and (and (and (not (= n$0_7@@1 n$0_7_1)) (U_2_bool (MapType2Select g n$0_7@@1))) (U_2_bool (MapType2Select g n$0_7_1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n$0_7@@1 n$0_7_1))))
 :qid |stdinbpl.5747:31|
 :skolemid |641|
 :pattern ( (neverTriggered64 n$0_7@@1) (neverTriggered64 n$0_7_1))
))) (=> (forall ((n$0_7@@2 T@U) (n$0_7_1@@0 T@U) ) (!  (=> (and (= (type n$0_7@@2) RefType) (= (type n$0_7_1@@0) RefType)) (=> (and (and (and (and (not (= n$0_7@@2 n$0_7_1@@0)) (U_2_bool (MapType2Select g n$0_7@@2))) (U_2_bool (MapType2Select g n$0_7_1@@0))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n$0_7@@2 n$0_7_1@@0))))
 :qid |stdinbpl.5747:31|
 :skolemid |641|
 :pattern ( (neverTriggered64 n$0_7@@2) (neverTriggered64 n$0_7_1@@0))
)) (=> (= (ControlFlow 0 353) (- 0 352)) (forall ((n$0_7@@3 T@U) ) (!  (=> (and (= (type n$0_7@@3) RefType) (U_2_bool (MapType2Select g n$0_7@@3))) (>= (U_2_real (MapType1Select QPMask@24 n$0_7@@3 next)) (/ (to_real 1) (to_real 2))))
 :qid |stdinbpl.5754:31|
 :skolemid |642|
 :pattern ( (MapType0Select ExhaleHeap@0 n$0_7@@3 next))
 :pattern ( (MapType1Select QPMask@27 n$0_7@@3 next))
 :pattern ( (MapType0Select ExhaleHeap@0 n$0_7@@3 next))
)))))))))
(let ((anon339_Then_correct  (and (=> (= (ControlFlow 0 348) (- 0 350)) (forall ((n$0_6 T@U) ) (!  (=> (= (type n$0_6) RefType) (=> (and (U_2_bool (MapType2Select g n$0_6)) (dummyFunction (MapType0Select ExhaleHeap@0 n$0_6 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.5683:29|
 :skolemid |633|
 :pattern ( (MapType0Select ExhaleHeap@0 n$0_6 next))
 :pattern ( (MapType1Select QPMask@26 n$0_6 next))
 :pattern ( (MapType0Select ExhaleHeap@0 n$0_6 next))
))) (=> (forall ((n$0_6@@0 T@U) ) (!  (=> (= (type n$0_6@@0) RefType) (=> (and (U_2_bool (MapType2Select g n$0_6@@0)) (dummyFunction (MapType0Select ExhaleHeap@0 n$0_6@@0 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.5683:29|
 :skolemid |633|
 :pattern ( (MapType0Select ExhaleHeap@0 n$0_6@@0 next))
 :pattern ( (MapType1Select QPMask@26 n$0_6@@0 next))
 :pattern ( (MapType0Select ExhaleHeap@0 n$0_6@@0 next))
)) (and (=> (= (ControlFlow 0 348) (- 0 349)) (forall ((n$0_6@@1 T@U) (n$0_6_1 T@U) ) (!  (=> (and (= (type n$0_6@@1) RefType) (= (type n$0_6_1) RefType)) (=> (and (and (and (and (not (= n$0_6@@1 n$0_6_1)) (U_2_bool (MapType2Select g n$0_6@@1))) (U_2_bool (MapType2Select g n$0_6_1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n$0_6@@1 n$0_6_1))))
 :qid |stdinbpl.5690:29|
 :skolemid |634|
 :pattern ( (neverTriggered63 n$0_6@@1) (neverTriggered63 n$0_6_1))
))) (=> (forall ((n$0_6@@2 T@U) (n$0_6_1@@0 T@U) ) (!  (=> (and (= (type n$0_6@@2) RefType) (= (type n$0_6_1@@0) RefType)) (=> (and (and (and (and (not (= n$0_6@@2 n$0_6_1@@0)) (U_2_bool (MapType2Select g n$0_6@@2))) (U_2_bool (MapType2Select g n$0_6_1@@0))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n$0_6@@2 n$0_6_1@@0))))
 :qid |stdinbpl.5690:29|
 :skolemid |634|
 :pattern ( (neverTriggered63 n$0_6@@2) (neverTriggered63 n$0_6_1@@0))
)) (=> (= (ControlFlow 0 348) (- 0 347)) (forall ((n$0_6@@3 T@U) ) (!  (=> (and (= (type n$0_6@@3) RefType) (U_2_bool (MapType2Select g n$0_6@@3))) (>= (U_2_real (MapType1Select QPMask@24 n$0_6@@3 next)) (/ (to_real 1) (to_real 2))))
 :qid |stdinbpl.5697:29|
 :skolemid |635|
 :pattern ( (MapType0Select ExhaleHeap@0 n$0_6@@3 next))
 :pattern ( (MapType1Select QPMask@26 n$0_6@@3 next))
 :pattern ( (MapType0Select ExhaleHeap@0 n$0_6@@3 next))
)))))))))
(let ((anon124_correct true))
(let ((anon340_Then_correct  (=> (exists_path ($$ ExhaleHeap@0 g) n_39 m_4) (and (=> (= (ControlFlow 0 356) 353) anon341_Then_correct) (=> (= (ControlFlow 0 356) 345) anon124_correct)))))
(let ((anon340_Else_correct  (=> (and (not (exists_path ($$ ExhaleHeap@0 g) n_39 m_4)) (= (ControlFlow 0 351) 345)) anon124_correct)))
(let ((anon338_Then_correct  (=> (and (U_2_bool (MapType2Select g n_39)) (U_2_bool (MapType2Select g m_4))) (and (and (=> (= (ControlFlow 0 357) 348) anon339_Then_correct) (=> (= (ControlFlow 0 357) 356) anon340_Then_correct)) (=> (= (ControlFlow 0 357) 351) anon340_Else_correct)))))
(let ((anon338_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select g n_39)) (U_2_bool (MapType2Select g m_4)))) (= (ControlFlow 0 346) 345)) anon124_correct)))
(let ((anon335_Else_correct  (=> (forall ((v$4_3 T@U) ) (!  (=> (and (= (type v$4_3) RefType) (U_2_bool (MapType2Select g v$4_3))) (= (= v$4_3 (MapType0Select ExhaleHeap@0 v$4_3 next)) (|Set#Equal| g (|Set#Singleton| v$4_3))))
 :qid |stdinbpl.5663:24|
 :skolemid |632|
 :pattern ( (MapType0Select ExhaleHeap@0 v$4_3 next))
)) (=> (and (and (state ExhaleHeap@0 QPMask@24) (U_2_bool (MapType2Select g node@0))) (and (state ExhaleHeap@0 QPMask@24) (state ExhaleHeap@0 QPMask@24))) (and (and (=> (= (ControlFlow 0 382) 381) anon337_Else_correct) (=> (= (ControlFlow 0 382) 357) anon338_Then_correct)) (=> (= (ControlFlow 0 382) 346) anon338_Else_correct))))))
(let ((anon116_correct true))
(let ((anon336_Else_correct  (=> (and (not (U_2_bool (MapType2Select g v$4_1))) (= (ControlFlow 0 344) 341)) anon116_correct)))
(let ((anon336_Then_correct  (=> (U_2_bool (MapType2Select g v$4_1)) (and (=> (= (ControlFlow 0 342) (- 0 343)) (HasDirectPerm QPMask@24 v$4_1 next)) (=> (HasDirectPerm QPMask@24 v$4_1 next) (=> (= (ControlFlow 0 342) 341) anon116_correct))))))
(let ((anon332_Else_correct  (=> (forall ((v1$1_3 T@U) (v2$1_3 T@U) (v$3_3 T@U) ) (!  (=> (and (and (and (and (= (type v1$1_3) RefType) (= (type v2$1_3) RefType)) (= (type v$3_3) RefType)) (and (U_2_bool (MapType2Select g v1$1_3)) (and (U_2_bool (MapType2Select g v2$1_3)) (U_2_bool (MapType2Select g v$3_3))))) (and (= (MapType0Select ExhaleHeap@0 v1$1_3 next) v$3_3) (= (MapType0Select ExhaleHeap@0 v2$1_3 next) v$3_3))) (= v1$1_3 v2$1_3))
 :qid |stdinbpl.5650:24|
 :skolemid |631|
 :pattern ( (MapType2Select g v$3_3) (MapType0Select ExhaleHeap@0 v1$1_3 next) (MapType0Select ExhaleHeap@0 v2$1_3 next))
)) (and (and (=> (= (ControlFlow 0 383) 382) anon335_Else_correct) (=> (= (ControlFlow 0 383) 342) anon336_Then_correct)) (=> (= (ControlFlow 0 383) 344) anon336_Else_correct)))))
(let ((anon112_correct true))
(let ((anon334_Else_correct  (=> (and (not (= (MapType0Select ExhaleHeap@0 v1$1_1 next) v$3_1)) (= (ControlFlow 0 338) 334)) anon112_correct)))
(let ((anon334_Then_correct  (=> (= (MapType0Select ExhaleHeap@0 v1$1_1 next) v$3_1) (and (=> (= (ControlFlow 0 336) (- 0 337)) (HasDirectPerm QPMask@24 v2$1_1 next)) (=> (HasDirectPerm QPMask@24 v2$1_1 next) (=> (= (ControlFlow 0 336) 334) anon112_correct))))))
(let ((anon333_Then_correct  (=> (and (U_2_bool (MapType2Select g v1$1_1)) (and (U_2_bool (MapType2Select g v2$1_1)) (U_2_bool (MapType2Select g v$3_1)))) (and (=> (= (ControlFlow 0 339) (- 0 340)) (HasDirectPerm QPMask@24 v1$1_1 next)) (=> (HasDirectPerm QPMask@24 v1$1_1 next) (and (=> (= (ControlFlow 0 339) 336) anon334_Then_correct) (=> (= (ControlFlow 0 339) 338) anon334_Else_correct)))))))
(let ((anon333_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select g v1$1_1)) (and (U_2_bool (MapType2Select g v2$1_1)) (U_2_bool (MapType2Select g v$3_1))))) (= (ControlFlow 0 335) 334)) anon112_correct)))
(let ((anon330_Else_correct  (=> (and (forall ((n$4_3 T@U) ) (!  (=> (and (= (type n$4_3) RefType) (U_2_bool (MapType2Select g n$4_3))) (U_2_bool (MapType2Select g (MapType0Select ExhaleHeap@0 n$4_3 next))))
 :qid |stdinbpl.5632:24|
 :skolemid |630|
 :pattern ( (MapType2Select g (MapType0Select ExhaleHeap@0 n$4_3 next)))
 :pattern ( (MapType2Select g n$4_3) (MapType0Select ExhaleHeap@0 n$4_3 next))
)) (state ExhaleHeap@0 QPMask@24)) (and (and (=> (= (ControlFlow 0 384) 383) anon332_Else_correct) (=> (= (ControlFlow 0 384) 339) anon333_Then_correct)) (=> (= (ControlFlow 0 384) 335) anon333_Else_correct)))))
(let ((anon107_correct true))
(let ((anon331_Else_correct  (=> (and (not (U_2_bool (MapType2Select g n$4_1))) (= (ControlFlow 0 333) 330)) anon107_correct)))
(let ((anon331_Then_correct  (=> (U_2_bool (MapType2Select g n$4_1)) (and (=> (= (ControlFlow 0 331) (- 0 332)) (HasDirectPerm QPMask@24 n$4_1 next)) (=> (HasDirectPerm QPMask@24 n$4_1 next) (=> (= (ControlFlow 0 331) 330) anon107_correct))))))
(let ((anon329_Else_correct  (and (=> (= (ControlFlow 0 385) (- 0 386)) (forall ((n$3_2 T@U) (n$3_2_1 T@U) ) (!  (=> (and (= (type n$3_2) RefType) (= (type n$3_2_1) RefType)) (=> (and (and (and (and (not (= n$3_2 n$3_2_1)) (U_2_bool (MapType2Select g n$3_2))) (U_2_bool (MapType2Select g n$3_2_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$3_2 n$3_2_1))))
 :qid |stdinbpl.5591:19|
 :skolemid |624|
 :no-pattern (type n$3_2)
 :no-pattern (type n$3_2_1)
 :no-pattern (U_2_int n$3_2)
 :no-pattern (U_2_bool n$3_2)
 :no-pattern (U_2_int n$3_2_1)
 :no-pattern (U_2_bool n$3_2_1)
))) (=> (forall ((n$3_2@@0 T@U) (n$3_2_1@@0 T@U) ) (!  (=> (and (= (type n$3_2@@0) RefType) (= (type n$3_2_1@@0) RefType)) (=> (and (and (and (and (not (= n$3_2@@0 n$3_2_1@@0)) (U_2_bool (MapType2Select g n$3_2@@0))) (U_2_bool (MapType2Select g n$3_2_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$3_2@@0 n$3_2_1@@0))))
 :qid |stdinbpl.5591:19|
 :skolemid |624|
 :no-pattern (type n$3_2@@0)
 :no-pattern (type n$3_2_1@@0)
 :no-pattern (U_2_int n$3_2@@0)
 :no-pattern (U_2_bool n$3_2@@0)
 :no-pattern (U_2_int n$3_2_1@@0)
 :no-pattern (U_2_bool n$3_2_1@@0)
)) (=> (and (forall ((n$3_2@@1 T@U) ) (!  (=> (= (type n$3_2@@1) RefType) (=> (and (U_2_bool (MapType2Select g n$3_2@@1)) (< NoPerm FullPerm)) (and (qpRange62 n$3_2@@1) (= (invRecv62 n$3_2@@1) n$3_2@@1))))
 :qid |stdinbpl.5597:26|
 :skolemid |625|
 :pattern ( (MapType0Select ExhaleHeap@0 n$3_2@@1 next))
 :pattern ( (MapType1Select QPMask@24 n$3_2@@1 next))
 :pattern ( (MapType0Select ExhaleHeap@0 n$3_2@@1 next))
)) (forall ((o_3@@8 T@U) ) (!  (=> (= (type o_3@@8) RefType) (=> (and (and (U_2_bool (MapType2Select g (invRecv62 o_3@@8))) (< NoPerm FullPerm)) (qpRange62 o_3@@8)) (= (invRecv62 o_3@@8) o_3@@8)))
 :qid |stdinbpl.5601:26|
 :skolemid |626|
 :pattern ( (invRecv62 o_3@@8))
))) (=> (and (and (forall ((n$3_2@@2 T@U) ) (!  (=> (and (= (type n$3_2@@2) RefType) (U_2_bool (MapType2Select g n$3_2@@2))) (not (= n$3_2@@2 null)))
 :qid |stdinbpl.5607:26|
 :skolemid |627|
 :pattern ( (MapType0Select ExhaleHeap@0 n$3_2@@2 next))
 :pattern ( (MapType1Select QPMask@24 n$3_2@@2 next))
 :pattern ( (MapType0Select ExhaleHeap@0 n$3_2@@2 next))
)) (forall ((o_3@@9 T@U) ) (!  (=> (= (type o_3@@9) RefType) (and (=> (and (and (U_2_bool (MapType2Select g (invRecv62 o_3@@9))) (< NoPerm FullPerm)) (qpRange62 o_3@@9)) (and (=> (< NoPerm FullPerm) (= (invRecv62 o_3@@9) o_3@@9)) (= (U_2_real (MapType1Select QPMask@24 o_3@@9 next)) (+ (U_2_real (MapType1Select QPMask@3 o_3@@9 next)) FullPerm)))) (=> (not (and (and (U_2_bool (MapType2Select g (invRecv62 o_3@@9))) (< NoPerm FullPerm)) (qpRange62 o_3@@9))) (= (U_2_real (MapType1Select QPMask@24 o_3@@9 next)) (U_2_real (MapType1Select QPMask@3 o_3@@9 next))))))
 :qid |stdinbpl.5613:26|
 :skolemid |628|
 :pattern ( (MapType1Select QPMask@24 o_3@@9 next))
))) (and (forall ((o_3@@10 T@U) (f_5@@2 T@U) ) (! (let ((B@@14 (FieldTypeInv1 (type f_5@@2))))
(let ((A@@15 (FieldTypeInv0 (type f_5@@2))))
 (=> (and (and (= (type o_3@@10) RefType) (= (type f_5@@2) (FieldType A@@15 B@@14))) (not (= f_5@@2 next))) (= (U_2_real (MapType1Select QPMask@3 o_3@@10 f_5@@2)) (U_2_real (MapType1Select QPMask@24 o_3@@10 f_5@@2))))))
 :qid |stdinbpl.5617:33|
 :skolemid |629|
 :pattern ( (MapType1Select QPMask@3 o_3@@10 f_5@@2))
 :pattern ( (MapType1Select QPMask@24 o_3@@10 f_5@@2))
)) (state ExhaleHeap@0 QPMask@24))) (and (and (=> (= (ControlFlow 0 385) 384) anon330_Else_correct) (=> (= (ControlFlow 0 385) 331) anon331_Then_correct)) (=> (= (ControlFlow 0 385) 333) anon331_Else_correct))))))))
(let ((anon329_Then_correct true))
(let ((anon328_Then_correct  (=> (not (U_2_bool (MapType2Select g null))) (and (=> (= (ControlFlow 0 387) 329) anon329_Then_correct) (=> (= (ControlFlow 0 387) 385) anon329_Else_correct)))))
(let ((anon171_correct true))
(let ((anon366_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select g n_49)) (= (MapType0Select ExhaleHeap@0 n_49 next) start_1@@1))) (= (ControlFlow 0 298) 295)) anon171_correct)))
(let ((anon366_Then_correct  (=> (and (U_2_bool (MapType2Select g n_49)) (= (MapType0Select ExhaleHeap@0 n_49 next) start_1@@1)) (and (=> (= (ControlFlow 0 296) (- 0 297)) (<= (U_2_int (MapType0Select ExhaleHeap@0 (MapType0Select ExhaleHeap@0 n_49 next) val)) (U_2_int (MapType0Select ExhaleHeap@0 n_49 val)))) (=> (<= (U_2_int (MapType0Select ExhaleHeap@0 (MapType0Select ExhaleHeap@0 n_49 next) val)) (U_2_int (MapType0Select ExhaleHeap@0 n_49 val))) (=> (= (ControlFlow 0 296) 295) anon171_correct))))))
(let ((anon365_Else_correct true))
(let ((anon363_Else_correct  (=> (forall ((n_48_1 T@U) ) (!  (=> (= (type n_48_1) RefType) (=> (and (U_2_bool (MapType2Select g n_48_1)) (not (= (MapType0Select ExhaleHeap@0 n_48_1 next) start_1@@1))) (<= (U_2_int (MapType0Select ExhaleHeap@0 n_48_1 val)) (U_2_int (MapType0Select ExhaleHeap@0 (MapType0Select ExhaleHeap@0 n_48_1 next) val)))))
 :qid |stdinbpl.6167:24|
 :skolemid |690|
 :pattern ( (MapType0Select ExhaleHeap@0 (MapType0Select ExhaleHeap@0 n_48_1 next) val))
)) (and (and (=> (= (ControlFlow 0 299) 294) anon365_Else_correct) (=> (= (ControlFlow 0 299) 296) anon366_Then_correct)) (=> (= (ControlFlow 0 299) 298) anon366_Else_correct)))))
(let ((anon167_correct true))
(let ((anon364_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select g n_47)) (not (= (MapType0Select ExhaleHeap@0 n_47 next) start_1@@1)))) (= (ControlFlow 0 293) 290)) anon167_correct)))
(let ((anon364_Then_correct  (=> (and (U_2_bool (MapType2Select g n_47)) (not (= (MapType0Select ExhaleHeap@0 n_47 next) start_1@@1))) (and (=> (= (ControlFlow 0 291) (- 0 292)) (<= (U_2_int (MapType0Select ExhaleHeap@0 n_47 val)) (U_2_int (MapType0Select ExhaleHeap@0 (MapType0Select ExhaleHeap@0 n_47 next) val)))) (=> (<= (U_2_int (MapType0Select ExhaleHeap@0 n_47 val)) (U_2_int (MapType0Select ExhaleHeap@0 (MapType0Select ExhaleHeap@0 n_47 next) val))) (=> (= (ControlFlow 0 291) 290) anon167_correct))))))
(let ((anon361_Else_correct  (=> (forall ((n_45_1 T@U) (m_12_1 T@U) ) (!  (=> (and (and (= (type n_45_1) RefType) (= (type m_12_1) RefType)) (and (U_2_bool (MapType2Select g n_45_1)) (U_2_bool (MapType2Select g m_12_1)))) (and (exists_path ($$ ExhaleHeap@0 g) n_45_1 m_12_1) (exists_path ($$ ExhaleHeap@0 g) m_12_1 n_45_1)))
 :qid |stdinbpl.6115:24|
 :skolemid |683|
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| ExhaleHeap@0 g))) g) n_45_1 m_12_1))
)) (and (=> (= (ControlFlow 0 300) (- 0 302)) (forall ((n_46 T@U) (n_46_1 T@U) ) (!  (=> (and (= (type n_46) RefType) (= (type n_46_1) RefType)) (=> (and (and (and (and (not (= n_46 n_46_1)) (U_2_bool (MapType2Select g n_46))) (U_2_bool (MapType2Select g n_46_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_46 n_46_1))))
 :qid |stdinbpl.6126:21|
 :skolemid |684|
 :pattern ( (neverTriggered69 n_46) (neverTriggered69 n_46_1))
))) (=> (forall ((n_46@@0 T@U) (n_46_1@@0 T@U) ) (!  (=> (and (= (type n_46@@0) RefType) (= (type n_46_1@@0) RefType)) (=> (and (and (and (and (not (= n_46@@0 n_46_1@@0)) (U_2_bool (MapType2Select g n_46@@0))) (U_2_bool (MapType2Select g n_46_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_46@@0 n_46_1@@0))))
 :qid |stdinbpl.6126:21|
 :skolemid |684|
 :pattern ( (neverTriggered69 n_46@@0) (neverTriggered69 n_46_1@@0))
)) (and (=> (= (ControlFlow 0 300) (- 0 301)) (forall ((n_46@@1 T@U) ) (!  (=> (and (= (type n_46@@1) RefType) (U_2_bool (MapType2Select g n_46@@1))) (>= (U_2_real (MapType1Select QPMask@22 n_46@@1 val)) FullPerm))
 :qid |stdinbpl.6133:21|
 :skolemid |685|
 :pattern ( (MapType0Select ExhaleHeap@0 n_46@@1 val))
 :pattern ( (MapType1Select QPMask@23 n_46@@1 val))
 :pattern ( (MapType0Select ExhaleHeap@0 n_46@@1 val))
))) (=> (forall ((n_46@@2 T@U) ) (!  (=> (and (= (type n_46@@2) RefType) (U_2_bool (MapType2Select g n_46@@2))) (>= (U_2_real (MapType1Select QPMask@22 n_46@@2 val)) FullPerm))
 :qid |stdinbpl.6133:21|
 :skolemid |685|
 :pattern ( (MapType0Select ExhaleHeap@0 n_46@@2 val))
 :pattern ( (MapType1Select QPMask@23 n_46@@2 val))
 :pattern ( (MapType0Select ExhaleHeap@0 n_46@@2 val))
)) (=> (and (and (forall ((n_46@@3 T@U) ) (!  (=> (= (type n_46@@3) RefType) (=> (and (U_2_bool (MapType2Select g n_46@@3)) (< NoPerm FullPerm)) (and (qpRange69 n_46@@3) (= (invRecv69 n_46@@3) n_46@@3))))
 :qid |stdinbpl.6139:26|
 :skolemid |686|
 :pattern ( (MapType0Select ExhaleHeap@0 n_46@@3 val))
 :pattern ( (MapType1Select QPMask@23 n_46@@3 val))
 :pattern ( (MapType0Select ExhaleHeap@0 n_46@@3 val))
)) (forall ((o_3@@11 T@U) ) (!  (=> (= (type o_3@@11) RefType) (=> (and (U_2_bool (MapType2Select g (invRecv69 o_3@@11))) (and (< NoPerm FullPerm) (qpRange69 o_3@@11))) (= (invRecv69 o_3@@11) o_3@@11)))
 :qid |stdinbpl.6143:26|
 :skolemid |687|
 :pattern ( (invRecv69 o_3@@11))
))) (and (forall ((o_3@@12 T@U) ) (!  (=> (= (type o_3@@12) RefType) (and (=> (and (U_2_bool (MapType2Select g (invRecv69 o_3@@12))) (and (< NoPerm FullPerm) (qpRange69 o_3@@12))) (and (= (invRecv69 o_3@@12) o_3@@12) (= (U_2_real (MapType1Select QPMask@23 o_3@@12 val)) (- (U_2_real (MapType1Select QPMask@22 o_3@@12 val)) FullPerm)))) (=> (not (and (U_2_bool (MapType2Select g (invRecv69 o_3@@12))) (and (< NoPerm FullPerm) (qpRange69 o_3@@12)))) (= (U_2_real (MapType1Select QPMask@23 o_3@@12 val)) (U_2_real (MapType1Select QPMask@22 o_3@@12 val))))))
 :qid |stdinbpl.6149:26|
 :skolemid |688|
 :pattern ( (MapType1Select QPMask@23 o_3@@12 val))
)) (forall ((o_3@@13 T@U) (f_5@@3 T@U) ) (! (let ((B@@15 (FieldTypeInv1 (type f_5@@3))))
(let ((A@@16 (FieldTypeInv0 (type f_5@@3))))
 (=> (and (and (= (type o_3@@13) RefType) (= (type f_5@@3) (FieldType A@@16 B@@15))) (not (= f_5@@3 val))) (= (U_2_real (MapType1Select QPMask@22 o_3@@13 f_5@@3)) (U_2_real (MapType1Select QPMask@23 o_3@@13 f_5@@3))))))
 :qid |stdinbpl.6155:33|
 :skolemid |689|
 :pattern ( (MapType1Select QPMask@23 o_3@@13 f_5@@3))
)))) (and (and (=> (= (ControlFlow 0 300) 299) anon363_Else_correct) (=> (= (ControlFlow 0 300) 291) anon364_Then_correct)) (=> (= (ControlFlow 0 300) 293) anon364_Else_correct))))))))))
(let ((anon163_correct true))
(let ((anon362_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select g n_44)) (U_2_bool (MapType2Select g m_11)))) (= (ControlFlow 0 289) 285)) anon163_correct)))
(let ((anon362_Then_correct  (=> (and (U_2_bool (MapType2Select g n_44)) (U_2_bool (MapType2Select g m_11))) (and (=> (= (ControlFlow 0 286) (- 0 288)) (exists_path ($$ ExhaleHeap@0 g) n_44 m_11)) (=> (exists_path ($$ ExhaleHeap@0 g) n_44 m_11) (and (=> (= (ControlFlow 0 286) (- 0 287)) (exists_path ($$ ExhaleHeap@0 g) m_11 n_44)) (=> (exists_path ($$ ExhaleHeap@0 g) m_11 n_44) (=> (= (ControlFlow 0 286) 285) anon163_correct))))))))
(let ((anon359_Else_correct  (=> (forall ((v$4_6_1 T@U) ) (!  (=> (and (= (type v$4_6_1) RefType) (U_2_bool (MapType2Select g v$4_6_1))) (= (= v$4_6_1 (MapType0Select ExhaleHeap@0 v$4_6_1 next)) (|Set#Equal| g (|Set#Singleton| v$4_6_1))))
 :qid |stdinbpl.6100:24|
 :skolemid |682|
 :pattern ( (MapType0Select ExhaleHeap@0 v$4_6_1 next))
)) (and (=> (= (ControlFlow 0 303) (- 0 304)) (U_2_bool (MapType2Select g node@1))) (=> (U_2_bool (MapType2Select g node@1)) (and (and (=> (= (ControlFlow 0 303) 300) anon361_Else_correct) (=> (= (ControlFlow 0 303) 286) anon362_Then_correct)) (=> (= (ControlFlow 0 303) 289) anon362_Else_correct)))))))
(let ((anon159_correct true))
(let ((anon360_Else_correct  (=> (and (not (U_2_bool (MapType2Select g v$4_5))) (= (ControlFlow 0 284) 281)) anon159_correct)))
(let ((anon360_Then_correct  (=> (U_2_bool (MapType2Select g v$4_5)) (and (=> (= (ControlFlow 0 282) (- 0 283)) (= (= v$4_5 (MapType0Select ExhaleHeap@0 v$4_5 next)) (|Set#Equal| g (|Set#Singleton| v$4_5)))) (=> (= (= v$4_5 (MapType0Select ExhaleHeap@0 v$4_5 next)) (|Set#Equal| g (|Set#Singleton| v$4_5))) (=> (= (ControlFlow 0 282) 281) anon159_correct))))))
(let ((anon356_Else_correct  (=> (forall ((v1$1_6_1 T@U) (v2$1_6_1 T@U) (v$3_6_1 T@U) ) (!  (=> (and (and (and (and (= (type v1$1_6_1) RefType) (= (type v2$1_6_1) RefType)) (= (type v$3_6_1) RefType)) (and (U_2_bool (MapType2Select g v1$1_6_1)) (and (U_2_bool (MapType2Select g v2$1_6_1)) (U_2_bool (MapType2Select g v$3_6_1))))) (and (= (MapType0Select ExhaleHeap@0 v1$1_6_1 next) v$3_6_1) (= (MapType0Select ExhaleHeap@0 v2$1_6_1 next) v$3_6_1))) (= v1$1_6_1 v2$1_6_1))
 :qid |stdinbpl.6089:24|
 :skolemid |681|
 :pattern ( (MapType2Select g v$3_6_1) (MapType0Select ExhaleHeap@0 v1$1_6_1 next) (MapType0Select ExhaleHeap@0 v2$1_6_1 next))
)) (and (and (=> (= (ControlFlow 0 305) 303) anon359_Else_correct) (=> (= (ControlFlow 0 305) 282) anon360_Then_correct)) (=> (= (ControlFlow 0 305) 284) anon360_Else_correct)))))
(let ((anon155_correct true))
(let ((anon358_Else_correct  (=> (and (not (and (= (MapType0Select ExhaleHeap@0 v1$1_5 next) v$3_5) (= (MapType0Select ExhaleHeap@0 v2$1_5 next) v$3_5))) (= (ControlFlow 0 279) 275)) anon155_correct)))
(let ((anon358_Then_correct  (=> (and (= (MapType0Select ExhaleHeap@0 v1$1_5 next) v$3_5) (= (MapType0Select ExhaleHeap@0 v2$1_5 next) v$3_5)) (and (=> (= (ControlFlow 0 277) (- 0 278)) (= v1$1_5 v2$1_5)) (=> (= v1$1_5 v2$1_5) (=> (= (ControlFlow 0 277) 275) anon155_correct))))))
(let ((anon357_Then_correct  (=> (and (U_2_bool (MapType2Select g v1$1_5)) (and (U_2_bool (MapType2Select g v2$1_5)) (U_2_bool (MapType2Select g v$3_5)))) (and (=> (= (ControlFlow 0 280) 277) anon358_Then_correct) (=> (= (ControlFlow 0 280) 279) anon358_Else_correct)))))
(let ((anon357_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select g v1$1_5)) (and (U_2_bool (MapType2Select g v2$1_5)) (U_2_bool (MapType2Select g v$3_5))))) (= (ControlFlow 0 276) 275)) anon155_correct)))
(let ((anon354_Else_correct  (=> (forall ((n$4_6_1 T@U) ) (!  (=> (and (= (type n$4_6_1) RefType) (U_2_bool (MapType2Select g n$4_6_1))) (U_2_bool (MapType2Select g (MapType0Select ExhaleHeap@0 n$4_6_1 next))))
 :qid |stdinbpl.6076:24|
 :skolemid |680|
 :pattern ( (MapType2Select g (MapType0Select ExhaleHeap@0 n$4_6_1 next)))
 :pattern ( (MapType2Select g n$4_6_1) (MapType0Select ExhaleHeap@0 n$4_6_1 next))
)) (and (and (=> (= (ControlFlow 0 306) 305) anon356_Else_correct) (=> (= (ControlFlow 0 306) 280) anon357_Then_correct)) (=> (= (ControlFlow 0 306) 276) anon357_Else_correct)))))
(let ((anon150_correct true))
(let ((anon355_Else_correct  (=> (and (not (U_2_bool (MapType2Select g n$4_5))) (= (ControlFlow 0 274) 271)) anon150_correct)))
(let ((anon355_Then_correct  (=> (U_2_bool (MapType2Select g n$4_5)) (and (=> (= (ControlFlow 0 272) (- 0 273)) (U_2_bool (MapType2Select g (MapType0Select ExhaleHeap@0 n$4_5 next)))) (=> (U_2_bool (MapType2Select g (MapType0Select ExhaleHeap@0 n$4_5 next))) (=> (= (ControlFlow 0 272) 271) anon150_correct))))))
(let ((anon147_correct  (=> (and (not (or (and (<= (U_2_int (MapType0Select ExhaleHeap@0 node@0 val)) x_1@@8) (< x_1@@8 (U_2_int (MapType0Select ExhaleHeap@0 (MapType0Select ExhaleHeap@0 node@0 next) val)))) (and (= (MapType0Select ExhaleHeap@0 node@0 next) start_1@@1) (or (<= (U_2_int (MapType0Select ExhaleHeap@0 node@0 val)) x_1@@8) (< x_1@@8 (U_2_int (MapType0Select ExhaleHeap@0 start_1@@1 val))))))) (state ExhaleHeap@0 QPMask@5)) (and (=> (= (ControlFlow 0 307) (- 0 311)) (HasDirectPerm QPMask@5 node@0 next)) (=> (HasDirectPerm QPMask@5 node@0 next) (=> (and (= node@1 (MapType0Select ExhaleHeap@0 node@0 next)) (state ExhaleHeap@0 QPMask@5)) (and (=> (= (ControlFlow 0 307) (- 0 310)) (not (U_2_bool (MapType2Select g null)))) (=> (not (U_2_bool (MapType2Select g null))) (and (=> (= (ControlFlow 0 307) (- 0 309)) (forall ((n$3_4 T@U) (n$3_4_1 T@U) ) (!  (=> (and (= (type n$3_4) RefType) (= (type n$3_4_1) RefType)) (=> (and (and (and (and (not (= n$3_4 n$3_4_1)) (U_2_bool (MapType2Select g n$3_4))) (U_2_bool (MapType2Select g n$3_4_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$3_4 n$3_4_1))))
 :qid |stdinbpl.6035:21|
 :skolemid |674|
 :pattern ( (neverTriggered68 n$3_4) (neverTriggered68 n$3_4_1))
))) (=> (forall ((n$3_4@@0 T@U) (n$3_4_1@@0 T@U) ) (!  (=> (and (= (type n$3_4@@0) RefType) (= (type n$3_4_1@@0) RefType)) (=> (and (and (and (and (not (= n$3_4@@0 n$3_4_1@@0)) (U_2_bool (MapType2Select g n$3_4@@0))) (U_2_bool (MapType2Select g n$3_4_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$3_4@@0 n$3_4_1@@0))))
 :qid |stdinbpl.6035:21|
 :skolemid |674|
 :pattern ( (neverTriggered68 n$3_4@@0) (neverTriggered68 n$3_4_1@@0))
)) (and (=> (= (ControlFlow 0 307) (- 0 308)) (forall ((n$3_4@@1 T@U) ) (!  (=> (and (= (type n$3_4@@1) RefType) (U_2_bool (MapType2Select g n$3_4@@1))) (>= (U_2_real (MapType1Select QPMask@5 n$3_4@@1 next)) FullPerm))
 :qid |stdinbpl.6042:21|
 :skolemid |675|
 :pattern ( (MapType0Select ExhaleHeap@0 n$3_4@@1 next))
 :pattern ( (MapType1Select QPMask@22 n$3_4@@1 next))
 :pattern ( (MapType0Select ExhaleHeap@0 n$3_4@@1 next))
))) (=> (forall ((n$3_4@@2 T@U) ) (!  (=> (and (= (type n$3_4@@2) RefType) (U_2_bool (MapType2Select g n$3_4@@2))) (>= (U_2_real (MapType1Select QPMask@5 n$3_4@@2 next)) FullPerm))
 :qid |stdinbpl.6042:21|
 :skolemid |675|
 :pattern ( (MapType0Select ExhaleHeap@0 n$3_4@@2 next))
 :pattern ( (MapType1Select QPMask@22 n$3_4@@2 next))
 :pattern ( (MapType0Select ExhaleHeap@0 n$3_4@@2 next))
)) (=> (and (and (forall ((n$3_4@@3 T@U) ) (!  (=> (= (type n$3_4@@3) RefType) (=> (and (U_2_bool (MapType2Select g n$3_4@@3)) (< NoPerm FullPerm)) (and (qpRange68 n$3_4@@3) (= (invRecv68 n$3_4@@3) n$3_4@@3))))
 :qid |stdinbpl.6048:26|
 :skolemid |676|
 :pattern ( (MapType0Select ExhaleHeap@0 n$3_4@@3 next))
 :pattern ( (MapType1Select QPMask@22 n$3_4@@3 next))
 :pattern ( (MapType0Select ExhaleHeap@0 n$3_4@@3 next))
)) (forall ((o_3@@14 T@U) ) (!  (=> (= (type o_3@@14) RefType) (=> (and (U_2_bool (MapType2Select g (invRecv68 o_3@@14))) (and (< NoPerm FullPerm) (qpRange68 o_3@@14))) (= (invRecv68 o_3@@14) o_3@@14)))
 :qid |stdinbpl.6052:26|
 :skolemid |677|
 :pattern ( (invRecv68 o_3@@14))
))) (and (forall ((o_3@@15 T@U) ) (!  (=> (= (type o_3@@15) RefType) (and (=> (and (U_2_bool (MapType2Select g (invRecv68 o_3@@15))) (and (< NoPerm FullPerm) (qpRange68 o_3@@15))) (and (= (invRecv68 o_3@@15) o_3@@15) (= (U_2_real (MapType1Select QPMask@22 o_3@@15 next)) (- (U_2_real (MapType1Select QPMask@5 o_3@@15 next)) FullPerm)))) (=> (not (and (U_2_bool (MapType2Select g (invRecv68 o_3@@15))) (and (< NoPerm FullPerm) (qpRange68 o_3@@15)))) (= (U_2_real (MapType1Select QPMask@22 o_3@@15 next)) (U_2_real (MapType1Select QPMask@5 o_3@@15 next))))))
 :qid |stdinbpl.6058:26|
 :skolemid |678|
 :pattern ( (MapType1Select QPMask@22 o_3@@15 next))
)) (forall ((o_3@@16 T@U) (f_5@@4 T@U) ) (! (let ((B@@16 (FieldTypeInv1 (type f_5@@4))))
(let ((A@@17 (FieldTypeInv0 (type f_5@@4))))
 (=> (and (and (= (type o_3@@16) RefType) (= (type f_5@@4) (FieldType A@@17 B@@16))) (not (= f_5@@4 next))) (= (U_2_real (MapType1Select QPMask@5 o_3@@16 f_5@@4)) (U_2_real (MapType1Select QPMask@22 o_3@@16 f_5@@4))))))
 :qid |stdinbpl.6064:33|
 :skolemid |679|
 :pattern ( (MapType1Select QPMask@22 o_3@@16 f_5@@4))
)))) (and (and (=> (= (ControlFlow 0 307) 306) anon354_Else_correct) (=> (= (ControlFlow 0 307) 272) anon355_Then_correct)) (=> (= (ControlFlow 0 307) 274) anon355_Else_correct)))))))))))))))
(let ((anon353_Else_correct  (=> (and (<= (U_2_int (MapType0Select ExhaleHeap@0 node@0 val)) x_1@@8) (= (ControlFlow 0 316) 307)) anon147_correct)))
(let ((anon353_Then_correct  (=> (not (<= (U_2_int (MapType0Select ExhaleHeap@0 node@0 val)) x_1@@8)) (and (=> (= (ControlFlow 0 314) (- 0 315)) (HasDirectPerm QPMask@5 start_1@@1 val)) (=> (HasDirectPerm QPMask@5 start_1@@1 val) (=> (= (ControlFlow 0 314) 307) anon147_correct))))))
(let ((anon352_Then_correct  (=> (= (MapType0Select ExhaleHeap@0 node@0 next) start_1@@1) (and (=> (= (ControlFlow 0 317) (- 0 318)) (HasDirectPerm QPMask@5 node@0 val)) (=> (HasDirectPerm QPMask@5 node@0 val) (and (=> (= (ControlFlow 0 317) 314) anon353_Then_correct) (=> (= (ControlFlow 0 317) 316) anon353_Else_correct)))))))
(let ((anon352_Else_correct  (=> (and (not (= (MapType0Select ExhaleHeap@0 node@0 next) start_1@@1)) (= (ControlFlow 0 313) 307)) anon147_correct)))
(let ((anon351_Then_correct  (=> (not (and (<= (U_2_int (MapType0Select ExhaleHeap@0 node@0 val)) x_1@@8) (< x_1@@8 (U_2_int (MapType0Select ExhaleHeap@0 (MapType0Select ExhaleHeap@0 node@0 next) val))))) (and (=> (= (ControlFlow 0 319) (- 0 320)) (HasDirectPerm QPMask@5 node@0 next)) (=> (HasDirectPerm QPMask@5 node@0 next) (and (=> (= (ControlFlow 0 319) 317) anon352_Then_correct) (=> (= (ControlFlow 0 319) 313) anon352_Else_correct)))))))
(let ((anon351_Else_correct  (=> (and (and (<= (U_2_int (MapType0Select ExhaleHeap@0 node@0 val)) x_1@@8) (< x_1@@8 (U_2_int (MapType0Select ExhaleHeap@0 (MapType0Select ExhaleHeap@0 node@0 next) val)))) (= (ControlFlow 0 312) 307)) anon147_correct)))
(let ((anon350_Else_correct  (=> (< x_1@@8 (U_2_int (MapType0Select ExhaleHeap@0 node@0 val))) (and (=> (= (ControlFlow 0 324) 319) anon351_Then_correct) (=> (= (ControlFlow 0 324) 312) anon351_Else_correct)))))
(let ((anon350_Then_correct  (=> (<= (U_2_int (MapType0Select ExhaleHeap@0 node@0 val)) x_1@@8) (and (=> (= (ControlFlow 0 321) (- 0 323)) (HasDirectPerm QPMask@5 node@0 next)) (=> (HasDirectPerm QPMask@5 node@0 next) (and (=> (= (ControlFlow 0 321) (- 0 322)) (HasDirectPerm QPMask@5 (MapType0Select ExhaleHeap@0 node@0 next) val)) (=> (HasDirectPerm QPMask@5 (MapType0Select ExhaleHeap@0 node@0 next) val) (and (=> (= (ControlFlow 0 321) 319) anon351_Then_correct) (=> (= (ControlFlow 0 321) 312) anon351_Else_correct)))))))))
(let ((anon349_Then_correct  (=> (and (state ExhaleHeap@0 ZeroMask) (not (U_2_bool (MapType2Select g null)))) (and (=> (= (ControlFlow 0 325) (- 0 328)) (forall ((n$3_3 T@U) (n$3_3_1 T@U) ) (!  (=> (and (= (type n$3_3) RefType) (= (type n$3_3_1) RefType)) (=> (and (and (and (and (not (= n$3_3 n$3_3_1)) (U_2_bool (MapType2Select g n$3_3))) (U_2_bool (MapType2Select g n$3_3_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$3_3 n$3_3_1))))
 :qid |stdinbpl.5895:19|
 :skolemid |656|
 :no-pattern (type n$3_3)
 :no-pattern (type n$3_3_1)
 :no-pattern (U_2_int n$3_3)
 :no-pattern (U_2_bool n$3_3)
 :no-pattern (U_2_int n$3_3_1)
 :no-pattern (U_2_bool n$3_3_1)
))) (=> (forall ((n$3_3@@0 T@U) (n$3_3_1@@0 T@U) ) (!  (=> (and (= (type n$3_3@@0) RefType) (= (type n$3_3_1@@0) RefType)) (=> (and (and (and (and (not (= n$3_3@@0 n$3_3_1@@0)) (U_2_bool (MapType2Select g n$3_3@@0))) (U_2_bool (MapType2Select g n$3_3_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$3_3@@0 n$3_3_1@@0))))
 :qid |stdinbpl.5895:19|
 :skolemid |656|
 :no-pattern (type n$3_3@@0)
 :no-pattern (type n$3_3_1@@0)
 :no-pattern (U_2_int n$3_3@@0)
 :no-pattern (U_2_bool n$3_3@@0)
 :no-pattern (U_2_int n$3_3_1@@0)
 :no-pattern (U_2_bool n$3_3_1@@0)
)) (=> (and (and (forall ((n$3_3@@1 T@U) ) (!  (=> (= (type n$3_3@@1) RefType) (=> (and (U_2_bool (MapType2Select g n$3_3@@1)) (< NoPerm FullPerm)) (and (qpRange66 n$3_3@@1) (= (invRecv66 n$3_3@@1) n$3_3@@1))))
 :qid |stdinbpl.5901:26|
 :skolemid |657|
 :pattern ( (MapType0Select ExhaleHeap@0 n$3_3@@1 next))
 :pattern ( (MapType1Select QPMask@4 n$3_3@@1 next))
 :pattern ( (MapType0Select ExhaleHeap@0 n$3_3@@1 next))
)) (forall ((o_3@@17 T@U) ) (!  (=> (= (type o_3@@17) RefType) (=> (and (and (U_2_bool (MapType2Select g (invRecv66 o_3@@17))) (< NoPerm FullPerm)) (qpRange66 o_3@@17)) (= (invRecv66 o_3@@17) o_3@@17)))
 :qid |stdinbpl.5905:26|
 :skolemid |658|
 :pattern ( (invRecv66 o_3@@17))
))) (and (forall ((n$3_3@@2 T@U) ) (!  (=> (and (= (type n$3_3@@2) RefType) (U_2_bool (MapType2Select g n$3_3@@2))) (not (= n$3_3@@2 null)))
 :qid |stdinbpl.5911:26|
 :skolemid |659|
 :pattern ( (MapType0Select ExhaleHeap@0 n$3_3@@2 next))
 :pattern ( (MapType1Select QPMask@4 n$3_3@@2 next))
 :pattern ( (MapType0Select ExhaleHeap@0 n$3_3@@2 next))
)) (forall ((o_3@@18 T@U) ) (!  (=> (= (type o_3@@18) RefType) (and (=> (and (and (U_2_bool (MapType2Select g (invRecv66 o_3@@18))) (< NoPerm FullPerm)) (qpRange66 o_3@@18)) (and (=> (< NoPerm FullPerm) (= (invRecv66 o_3@@18) o_3@@18)) (= (U_2_real (MapType1Select QPMask@4 o_3@@18 next)) (+ (U_2_real (MapType1Select ZeroMask o_3@@18 next)) FullPerm)))) (=> (not (and (and (U_2_bool (MapType2Select g (invRecv66 o_3@@18))) (< NoPerm FullPerm)) (qpRange66 o_3@@18))) (= (U_2_real (MapType1Select QPMask@4 o_3@@18 next)) (U_2_real (MapType1Select ZeroMask o_3@@18 next))))))
 :qid |stdinbpl.5917:26|
 :skolemid |660|
 :pattern ( (MapType1Select QPMask@4 o_3@@18 next))
)))) (=> (and (and (and (forall ((o_3@@19 T@U) (f_5@@5 T@U) ) (! (let ((B@@17 (FieldTypeInv1 (type f_5@@5))))
(let ((A@@18 (FieldTypeInv0 (type f_5@@5))))
 (=> (and (and (= (type o_3@@19) RefType) (= (type f_5@@5) (FieldType A@@18 B@@17))) (not (= f_5@@5 next))) (= (U_2_real (MapType1Select ZeroMask o_3@@19 f_5@@5)) (U_2_real (MapType1Select QPMask@4 o_3@@19 f_5@@5))))))
 :qid |stdinbpl.5921:33|
 :skolemid |661|
 :pattern ( (MapType1Select ZeroMask o_3@@19 f_5@@5))
 :pattern ( (MapType1Select QPMask@4 o_3@@19 f_5@@5))
)) (state ExhaleHeap@0 QPMask@4)) (and (forall ((n$4_4 T@U) ) (!  (=> (and (= (type n$4_4) RefType) (U_2_bool (MapType2Select g n$4_4))) (U_2_bool (MapType2Select g (MapType0Select ExhaleHeap@0 n$4_4 next))))
 :qid |stdinbpl.5927:24|
 :skolemid |662|
 :pattern ( (MapType2Select g (MapType0Select ExhaleHeap@0 n$4_4 next)))
 :pattern ( (MapType2Select g n$4_4) (MapType0Select ExhaleHeap@0 n$4_4 next))
)) (forall ((v1$1_4 T@U) (v2$1_4 T@U) (v$3_4 T@U) ) (!  (=> (and (and (and (and (= (type v1$1_4) RefType) (= (type v2$1_4) RefType)) (= (type v$3_4) RefType)) (and (U_2_bool (MapType2Select g v1$1_4)) (and (U_2_bool (MapType2Select g v2$1_4)) (U_2_bool (MapType2Select g v$3_4))))) (and (= (MapType0Select ExhaleHeap@0 v1$1_4 next) v$3_4) (= (MapType0Select ExhaleHeap@0 v2$1_4 next) v$3_4))) (= v1$1_4 v2$1_4))
 :qid |stdinbpl.5931:24|
 :skolemid |663|
 :pattern ( (MapType2Select g v$3_4) (MapType0Select ExhaleHeap@0 v1$1_4 next) (MapType0Select ExhaleHeap@0 v2$1_4 next))
)))) (and (and (forall ((v$4_4 T@U) ) (!  (=> (and (= (type v$4_4) RefType) (U_2_bool (MapType2Select g v$4_4))) (= (= v$4_4 (MapType0Select ExhaleHeap@0 v$4_4 next)) (|Set#Equal| g (|Set#Singleton| v$4_4))))
 :qid |stdinbpl.5935:24|
 :skolemid |664|
 :pattern ( (MapType0Select ExhaleHeap@0 v$4_4 next))
)) (U_2_bool (MapType2Select g node@0))) (and (state ExhaleHeap@0 QPMask@4) (forall ((n_40_1 T@U) (m_10 T@U) ) (!  (=> (and (and (= (type n_40_1) RefType) (= (type m_10) RefType)) (and (U_2_bool (MapType2Select g n_40_1)) (U_2_bool (MapType2Select g m_10)))) (and (exists_path ($$ ExhaleHeap@0 g) n_40_1 m_10) (exists_path ($$ ExhaleHeap@0 g) m_10 n_40_1)))
 :qid |stdinbpl.5941:24|
 :skolemid |665|
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| ExhaleHeap@0 g))) g) n_40_1 m_10))
))))) (and (=> (= (ControlFlow 0 325) (- 0 327)) (forall ((n_41 T@U) (n_41_1 T@U) ) (!  (=> (and (= (type n_41) RefType) (= (type n_41_1) RefType)) (=> (and (and (and (and (not (= n_41 n_41_1)) (U_2_bool (MapType2Select g n_41))) (U_2_bool (MapType2Select g n_41_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_41 n_41_1))))
 :qid |stdinbpl.5947:19|
 :skolemid |666|
 :no-pattern (type n_41)
 :no-pattern (type n_41_1)
 :no-pattern (U_2_int n_41)
 :no-pattern (U_2_bool n_41)
 :no-pattern (U_2_int n_41_1)
 :no-pattern (U_2_bool n_41_1)
))) (=> (forall ((n_41@@0 T@U) (n_41_1@@0 T@U) ) (!  (=> (and (= (type n_41@@0) RefType) (= (type n_41_1@@0) RefType)) (=> (and (and (and (and (not (= n_41@@0 n_41_1@@0)) (U_2_bool (MapType2Select g n_41@@0))) (U_2_bool (MapType2Select g n_41_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_41@@0 n_41_1@@0))))
 :qid |stdinbpl.5947:19|
 :skolemid |666|
 :no-pattern (type n_41@@0)
 :no-pattern (type n_41_1@@0)
 :no-pattern (U_2_int n_41@@0)
 :no-pattern (U_2_bool n_41@@0)
 :no-pattern (U_2_int n_41_1@@0)
 :no-pattern (U_2_bool n_41_1@@0)
)) (=> (forall ((n_41@@1 T@U) ) (!  (=> (= (type n_41@@1) RefType) (=> (and (U_2_bool (MapType2Select g n_41@@1)) (< NoPerm FullPerm)) (and (qpRange67 n_41@@1) (= (invRecv67 n_41@@1) n_41@@1))))
 :qid |stdinbpl.5953:26|
 :skolemid |667|
 :pattern ( (MapType0Select ExhaleHeap@0 n_41@@1 val))
 :pattern ( (MapType1Select QPMask@5 n_41@@1 val))
 :pattern ( (MapType0Select ExhaleHeap@0 n_41@@1 val))
)) (=> (and (and (and (forall ((o_3@@20 T@U) ) (!  (=> (= (type o_3@@20) RefType) (=> (and (and (U_2_bool (MapType2Select g (invRecv67 o_3@@20))) (< NoPerm FullPerm)) (qpRange67 o_3@@20)) (= (invRecv67 o_3@@20) o_3@@20)))
 :qid |stdinbpl.5957:26|
 :skolemid |668|
 :pattern ( (invRecv67 o_3@@20))
)) (forall ((n_41@@2 T@U) ) (!  (=> (and (= (type n_41@@2) RefType) (U_2_bool (MapType2Select g n_41@@2))) (not (= n_41@@2 null)))
 :qid |stdinbpl.5963:26|
 :skolemid |669|
 :pattern ( (MapType0Select ExhaleHeap@0 n_41@@2 val))
 :pattern ( (MapType1Select QPMask@5 n_41@@2 val))
 :pattern ( (MapType0Select ExhaleHeap@0 n_41@@2 val))
))) (and (forall ((o_3@@21 T@U) ) (!  (=> (= (type o_3@@21) RefType) (and (=> (and (and (U_2_bool (MapType2Select g (invRecv67 o_3@@21))) (< NoPerm FullPerm)) (qpRange67 o_3@@21)) (and (=> (< NoPerm FullPerm) (= (invRecv67 o_3@@21) o_3@@21)) (= (U_2_real (MapType1Select QPMask@5 o_3@@21 val)) (+ (U_2_real (MapType1Select QPMask@4 o_3@@21 val)) FullPerm)))) (=> (not (and (and (U_2_bool (MapType2Select g (invRecv67 o_3@@21))) (< NoPerm FullPerm)) (qpRange67 o_3@@21))) (= (U_2_real (MapType1Select QPMask@5 o_3@@21 val)) (U_2_real (MapType1Select QPMask@4 o_3@@21 val))))))
 :qid |stdinbpl.5969:26|
 :skolemid |670|
 :pattern ( (MapType1Select QPMask@5 o_3@@21 val))
)) (forall ((o_3@@22 T@U) (f_5@@6 T@U) ) (! (let ((B@@18 (FieldTypeInv1 (type f_5@@6))))
(let ((A@@19 (FieldTypeInv0 (type f_5@@6))))
 (=> (and (and (= (type o_3@@22) RefType) (= (type f_5@@6) (FieldType A@@19 B@@18))) (not (= f_5@@6 val))) (= (U_2_real (MapType1Select QPMask@4 o_3@@22 f_5@@6)) (U_2_real (MapType1Select QPMask@5 o_3@@22 f_5@@6))))))
 :qid |stdinbpl.5973:33|
 :skolemid |671|
 :pattern ( (MapType1Select QPMask@4 o_3@@22 f_5@@6))
 :pattern ( (MapType1Select QPMask@5 o_3@@22 f_5@@6))
)))) (and (and (state ExhaleHeap@0 QPMask@5) (forall ((n_42_1 T@U) ) (!  (=> (= (type n_42_1) RefType) (=> (and (U_2_bool (MapType2Select g n_42_1)) (not (= (MapType0Select ExhaleHeap@0 n_42_1 next) start_1@@1))) (<= (U_2_int (MapType0Select ExhaleHeap@0 n_42_1 val)) (U_2_int (MapType0Select ExhaleHeap@0 (MapType0Select ExhaleHeap@0 n_42_1 next) val)))))
 :qid |stdinbpl.5979:24|
 :skolemid |672|
 :pattern ( (MapType0Select ExhaleHeap@0 (MapType0Select ExhaleHeap@0 n_42_1 next) val))
))) (and (forall ((n_43 T@U) ) (!  (=> (= (type n_43) RefType) (=> (and (U_2_bool (MapType2Select g n_43)) (= (MapType0Select ExhaleHeap@0 n_43 next) start_1@@1)) (<= (U_2_int (MapType0Select ExhaleHeap@0 (MapType0Select ExhaleHeap@0 n_43 next) val)) (U_2_int (MapType0Select ExhaleHeap@0 n_43 val)))))
 :qid |stdinbpl.5983:24|
 :skolemid |673|
 :pattern ( (MapType0Select ExhaleHeap@0 (MapType0Select ExhaleHeap@0 n_43 next) val))
)) (state ExhaleHeap@0 QPMask@5)))) (and (=> (= (ControlFlow 0 325) (- 0 326)) (HasDirectPerm QPMask@5 node@0 val)) (=> (HasDirectPerm QPMask@5 node@0 val) (and (=> (= (ControlFlow 0 325) 321) anon350_Then_correct) (=> (= (ControlFlow 0 325) 324) anon350_Else_correct)))))))))))))))
(let ((anon186_correct true))
(let ((anon373_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select new_g@0 n$0_8_1)) (not (= (MapType0Select ExhaleHeap@0 n$0_8_1 next) null)))) (= (ControlFlow 0 237) 234)) anon186_correct)))
(let ((anon373_Then_correct  (=> (and (U_2_bool (MapType2Select new_g@0 n$0_8_1)) (not (= (MapType0Select ExhaleHeap@0 n$0_8_1 next) null))) (and (=> (= (ControlFlow 0 235) (- 0 236)) (U_2_bool (MapType2Select new_g@0 (MapType0Select ExhaleHeap@0 n$0_8_1 next)))) (=> (U_2_bool (MapType2Select new_g@0 (MapType0Select ExhaleHeap@0 n$0_8_1 next))) (=> (= (ControlFlow 0 235) 234) anon186_correct))))))
(let ((anon214_correct true))
(let ((anon387_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select new_g@0 n$0_12)) (not (= (MapType0Select ExhaleHeap@3 n$0_12 next) null)))) (= (ControlFlow 0 183) 180)) anon214_correct)))
(let ((anon387_Then_correct  (=> (and (U_2_bool (MapType2Select new_g@0 n$0_12)) (not (= (MapType0Select ExhaleHeap@3 n$0_12 next) null))) (and (=> (= (ControlFlow 0 181) (- 0 182)) (U_2_bool (MapType2Select new_g@0 (MapType0Select ExhaleHeap@3 n$0_12 next)))) (=> (U_2_bool (MapType2Select new_g@0 (MapType0Select ExhaleHeap@3 n$0_12 next))) (=> (= (ControlFlow 0 181) 180) anon214_correct))))))
(let ((anon272_correct true))
(let ((anon417_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select new_g@0 n_23_1)) (U_2_bool (MapType2Select new_g@0 m_4_1)))) (= (ControlFlow 0 137) 133)) anon272_correct)))
(let ((anon417_Then_correct  (=> (and (U_2_bool (MapType2Select new_g@0 n_23_1)) (U_2_bool (MapType2Select new_g@0 m_4_1))) (and (=> (= (ControlFlow 0 134) (- 0 136)) (exists_path ($$ ExhaleHeap@5 new_g@0) n_23_1 m_4_1)) (=> (exists_path ($$ ExhaleHeap@5 new_g@0) n_23_1 m_4_1) (and (=> (= (ControlFlow 0 134) (- 0 135)) (exists_path ($$ ExhaleHeap@5 new_g@0) m_4_1 n_23_1)) (=> (exists_path ($$ ExhaleHeap@5 new_g@0) m_4_1 n_23_1) (=> (= (ControlFlow 0 134) 133) anon272_correct))))))))
(let ((anon416_Else_correct true))
(let ((anon414_Else_correct  (=> (forall ((n_22_1 T@U) ) (!  (=> (= (type n_22_1) RefType) (=> (and (U_2_bool (MapType2Select new_g@0 n_22_1)) (= (MapType0Select ExhaleHeap@5 n_22_1 next) new_start@0)) (<= (U_2_int (MapType0Select ExhaleHeap@5 (MapType0Select ExhaleHeap@5 n_22_1 next) val)) (U_2_int (MapType0Select ExhaleHeap@5 n_22_1 val)))))
 :qid |stdinbpl.7451:20|
 :skolemid |849|
 :pattern ( (MapType0Select ExhaleHeap@5 (MapType0Select ExhaleHeap@5 n_22_1 next) val))
)) (and (and (=> (= (ControlFlow 0 138) 132) anon416_Else_correct) (=> (= (ControlFlow 0 138) 134) anon417_Then_correct)) (=> (= (ControlFlow 0 138) 137) anon417_Else_correct)))))
(let ((anon268_correct true))
(let ((anon415_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select new_g@0 n_21_1)) (= (MapType0Select ExhaleHeap@5 n_21_1 next) new_start@0))) (= (ControlFlow 0 131) 128)) anon268_correct)))
(let ((anon415_Then_correct  (=> (and (U_2_bool (MapType2Select new_g@0 n_21_1)) (= (MapType0Select ExhaleHeap@5 n_21_1 next) new_start@0)) (and (=> (= (ControlFlow 0 129) (- 0 130)) (<= (U_2_int (MapType0Select ExhaleHeap@5 (MapType0Select ExhaleHeap@5 n_21_1 next) val)) (U_2_int (MapType0Select ExhaleHeap@5 n_21_1 val)))) (=> (<= (U_2_int (MapType0Select ExhaleHeap@5 (MapType0Select ExhaleHeap@5 n_21_1 next) val)) (U_2_int (MapType0Select ExhaleHeap@5 n_21_1 val))) (=> (= (ControlFlow 0 129) 128) anon268_correct))))))
(let ((anon412_Else_correct  (=> (forall ((n_20_1_1 T@U) ) (!  (=> (= (type n_20_1_1) RefType) (=> (and (U_2_bool (MapType2Select new_g@0 n_20_1_1)) (not (= (MapType0Select ExhaleHeap@5 n_20_1_1 next) new_start@0))) (<= (U_2_int (MapType0Select ExhaleHeap@5 n_20_1_1 val)) (U_2_int (MapType0Select ExhaleHeap@5 (MapType0Select ExhaleHeap@5 n_20_1_1 next) val)))))
 :qid |stdinbpl.7440:20|
 :skolemid |848|
 :pattern ( (MapType0Select ExhaleHeap@5 (MapType0Select ExhaleHeap@5 n_20_1_1 next) val))
)) (and (and (=> (= (ControlFlow 0 139) 138) anon414_Else_correct) (=> (= (ControlFlow 0 139) 129) anon415_Then_correct)) (=> (= (ControlFlow 0 139) 131) anon415_Else_correct)))))
(let ((anon264_correct true))
(let ((anon413_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select new_g@0 n_19)) (not (= (MapType0Select ExhaleHeap@5 n_19 next) new_start@0)))) (= (ControlFlow 0 127) 124)) anon264_correct)))
(let ((anon413_Then_correct  (=> (and (U_2_bool (MapType2Select new_g@0 n_19)) (not (= (MapType0Select ExhaleHeap@5 n_19 next) new_start@0))) (and (=> (= (ControlFlow 0 125) (- 0 126)) (<= (U_2_int (MapType0Select ExhaleHeap@5 n_19 val)) (U_2_int (MapType0Select ExhaleHeap@5 (MapType0Select ExhaleHeap@5 n_19 next) val)))) (=> (<= (U_2_int (MapType0Select ExhaleHeap@5 n_19 val)) (U_2_int (MapType0Select ExhaleHeap@5 (MapType0Select ExhaleHeap@5 n_19 next) val))) (=> (= (ControlFlow 0 125) 124) anon264_correct))))))
(let ((anon410_Else_correct  (=> (forall ((v$2_3_1 T@U) ) (!  (=> (and (= (type v$2_3_1) RefType) (U_2_bool (MapType2Select new_g@0 v$2_3_1))) (= (= v$2_3_1 (MapType0Select ExhaleHeap@5 v$2_3_1 next)) (|Set#Equal| new_g@0 (|Set#Singleton| v$2_3_1))))
 :qid |stdinbpl.7380:20|
 :skolemid |841|
 :pattern ( (MapType0Select ExhaleHeap@5 v$2_3_1 next))
)) (and (=> (= (ControlFlow 0 140) (- 0 146)) (U_2_bool (MapType2Select new_g@0 new_start@0))) (=> (U_2_bool (MapType2Select new_g@0 new_start@0)) (and (=> (= (ControlFlow 0 140) (- 0 145)) (forall ((n_18 T@U) (n_18_1 T@U) ) (!  (=> (and (= (type n_18) RefType) (= (type n_18_1) RefType)) (=> (and (and (and (and (not (= n_18 n_18_1)) (U_2_bool (MapType2Select new_g@0 n_18))) (U_2_bool (MapType2Select new_g@0 n_18_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_18 n_18_1))))
 :qid |stdinbpl.7393:17|
 :skolemid |842|
 :pattern ( (neverTriggered59 n_18) (neverTriggered59 n_18_1))
))) (=> (forall ((n_18@@0 T@U) (n_18_1@@0 T@U) ) (!  (=> (and (= (type n_18@@0) RefType) (= (type n_18_1@@0) RefType)) (=> (and (and (and (and (not (= n_18@@0 n_18_1@@0)) (U_2_bool (MapType2Select new_g@0 n_18@@0))) (U_2_bool (MapType2Select new_g@0 n_18_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_18@@0 n_18_1@@0))))
 :qid |stdinbpl.7393:17|
 :skolemid |842|
 :pattern ( (neverTriggered59 n_18@@0) (neverTriggered59 n_18_1@@0))
)) (and (=> (= (ControlFlow 0 140) (- 0 144)) (forall ((n_18@@1 T@U) ) (!  (=> (and (= (type n_18@@1) RefType) (U_2_bool (MapType2Select new_g@0 n_18@@1))) (>= (U_2_real (MapType1Select QPMask@18 n_18@@1 val)) FullPerm))
 :qid |stdinbpl.7400:17|
 :skolemid |843|
 :pattern ( (MapType0Select ExhaleHeap@5 n_18@@1 val))
 :pattern ( (MapType1Select QPMask@19 n_18@@1 val))
 :pattern ( (MapType0Select ExhaleHeap@5 n_18@@1 val))
))) (=> (forall ((n_18@@2 T@U) ) (!  (=> (and (= (type n_18@@2) RefType) (U_2_bool (MapType2Select new_g@0 n_18@@2))) (>= (U_2_real (MapType1Select QPMask@18 n_18@@2 val)) FullPerm))
 :qid |stdinbpl.7400:17|
 :skolemid |843|
 :pattern ( (MapType0Select ExhaleHeap@5 n_18@@2 val))
 :pattern ( (MapType1Select QPMask@19 n_18@@2 val))
 :pattern ( (MapType0Select ExhaleHeap@5 n_18@@2 val))
)) (=> (and (and (forall ((n_18@@3 T@U) ) (!  (=> (= (type n_18@@3) RefType) (=> (and (U_2_bool (MapType2Select new_g@0 n_18@@3)) (< NoPerm FullPerm)) (and (qpRange59 n_18@@3) (= (invRecv59 n_18@@3) n_18@@3))))
 :qid |stdinbpl.7406:22|
 :skolemid |844|
 :pattern ( (MapType0Select ExhaleHeap@5 n_18@@3 val))
 :pattern ( (MapType1Select QPMask@19 n_18@@3 val))
 :pattern ( (MapType0Select ExhaleHeap@5 n_18@@3 val))
)) (forall ((o_3@@23 T@U) ) (!  (=> (= (type o_3@@23) RefType) (=> (and (U_2_bool (MapType2Select new_g@0 (invRecv59 o_3@@23))) (and (< NoPerm FullPerm) (qpRange59 o_3@@23))) (= (invRecv59 o_3@@23) o_3@@23)))
 :qid |stdinbpl.7410:22|
 :skolemid |845|
 :pattern ( (invRecv59 o_3@@23))
))) (and (forall ((o_3@@24 T@U) ) (!  (=> (= (type o_3@@24) RefType) (and (=> (and (U_2_bool (MapType2Select new_g@0 (invRecv59 o_3@@24))) (and (< NoPerm FullPerm) (qpRange59 o_3@@24))) (and (= (invRecv59 o_3@@24) o_3@@24) (= (U_2_real (MapType1Select QPMask@19 o_3@@24 val)) (- (U_2_real (MapType1Select QPMask@18 o_3@@24 val)) FullPerm)))) (=> (not (and (U_2_bool (MapType2Select new_g@0 (invRecv59 o_3@@24))) (and (< NoPerm FullPerm) (qpRange59 o_3@@24)))) (= (U_2_real (MapType1Select QPMask@19 o_3@@24 val)) (U_2_real (MapType1Select QPMask@18 o_3@@24 val))))))
 :qid |stdinbpl.7416:22|
 :skolemid |846|
 :pattern ( (MapType1Select QPMask@19 o_3@@24 val))
)) (forall ((o_3@@25 T@U) (f_5@@7 T@U) ) (! (let ((B@@19 (FieldTypeInv1 (type f_5@@7))))
(let ((A@@20 (FieldTypeInv0 (type f_5@@7))))
 (=> (and (and (= (type o_3@@25) RefType) (= (type f_5@@7) (FieldType A@@20 B@@19))) (not (= f_5@@7 val))) (= (U_2_real (MapType1Select QPMask@18 o_3@@25 f_5@@7)) (U_2_real (MapType1Select QPMask@19 o_3@@25 f_5@@7))))))
 :qid |stdinbpl.7422:29|
 :skolemid |847|
 :pattern ( (MapType1Select QPMask@19 o_3@@25 f_5@@7))
)))) (and (=> (= (ControlFlow 0 140) (- 0 143)) (not (U_2_bool (MapType2Select g new_node@0)))) (=> (not (U_2_bool (MapType2Select g new_node@0))) (and (=> (= (ControlFlow 0 140) (- 0 142)) (U_2_bool (MapType2Select new_g@0 new_node@0))) (=> (U_2_bool (MapType2Select new_g@0 new_node@0)) (and (=> (= (ControlFlow 0 140) (- 0 141)) (= (U_2_int (MapType0Select ExhaleHeap@5 new_node@0 val)) x_1@@8)) (=> (= (U_2_int (MapType0Select ExhaleHeap@5 new_node@0 val)) x_1@@8) (and (and (=> (= (ControlFlow 0 140) 139) anon412_Else_correct) (=> (= (ControlFlow 0 140) 125) anon413_Then_correct)) (=> (= (ControlFlow 0 140) 127) anon413_Else_correct))))))))))))))))))
(let ((anon260_correct true))
(let ((anon411_Else_correct  (=> (and (not (U_2_bool (MapType2Select new_g@0 v$2_2))) (= (ControlFlow 0 123) 120)) anon260_correct)))
(let ((anon411_Then_correct  (=> (U_2_bool (MapType2Select new_g@0 v$2_2)) (and (=> (= (ControlFlow 0 121) (- 0 122)) (= (= v$2_2 (MapType0Select ExhaleHeap@5 v$2_2 next)) (|Set#Equal| new_g@0 (|Set#Singleton| v$2_2)))) (=> (= (= v$2_2 (MapType0Select ExhaleHeap@5 v$2_2 next)) (|Set#Equal| new_g@0 (|Set#Singleton| v$2_2))) (=> (= (ControlFlow 0 121) 120) anon260_correct))))))
(let ((anon407_Else_correct  (=> (forall ((v1$0_3_1 T@U) (v2$0_3_1 T@U) (v$1_3_1 T@U) ) (!  (=> (and (and (and (and (= (type v1$0_3_1) RefType) (= (type v2$0_3_1) RefType)) (= (type v$1_3_1) RefType)) (and (U_2_bool (MapType2Select new_g@0 v1$0_3_1)) (and (U_2_bool (MapType2Select new_g@0 v2$0_3_1)) (U_2_bool (MapType2Select new_g@0 v$1_3_1))))) (and (= (MapType0Select ExhaleHeap@5 v1$0_3_1 next) v$1_3_1) (= (MapType0Select ExhaleHeap@5 v2$0_3_1 next) v$1_3_1))) (= v1$0_3_1 v2$0_3_1))
 :qid |stdinbpl.7369:20|
 :skolemid |840|
 :pattern ( (MapType2Select new_g@0 v$1_3_1) (MapType0Select ExhaleHeap@5 v1$0_3_1 next) (MapType0Select ExhaleHeap@5 v2$0_3_1 next))
)) (and (and (=> (= (ControlFlow 0 147) 140) anon410_Else_correct) (=> (= (ControlFlow 0 147) 121) anon411_Then_correct)) (=> (= (ControlFlow 0 147) 123) anon411_Else_correct)))))
(let ((anon256_correct true))
(let ((anon409_Else_correct  (=> (and (not (and (= (MapType0Select ExhaleHeap@5 v1$0_2 next) v$1_2) (= (MapType0Select ExhaleHeap@5 v2$0_2 next) v$1_2))) (= (ControlFlow 0 118) 114)) anon256_correct)))
(let ((anon409_Then_correct  (=> (and (= (MapType0Select ExhaleHeap@5 v1$0_2 next) v$1_2) (= (MapType0Select ExhaleHeap@5 v2$0_2 next) v$1_2)) (and (=> (= (ControlFlow 0 116) (- 0 117)) (= v1$0_2 v2$0_2)) (=> (= v1$0_2 v2$0_2) (=> (= (ControlFlow 0 116) 114) anon256_correct))))))
(let ((anon408_Then_correct  (=> (and (U_2_bool (MapType2Select new_g@0 v1$0_2)) (and (U_2_bool (MapType2Select new_g@0 v2$0_2)) (U_2_bool (MapType2Select new_g@0 v$1_2)))) (and (=> (= (ControlFlow 0 119) 116) anon409_Then_correct) (=> (= (ControlFlow 0 119) 118) anon409_Else_correct)))))
(let ((anon408_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select new_g@0 v1$0_2)) (and (U_2_bool (MapType2Select new_g@0 v2$0_2)) (U_2_bool (MapType2Select new_g@0 v$1_2))))) (= (ControlFlow 0 115) 114)) anon256_correct)))
(let ((anon405_Else_correct  (=> (forall ((n$2_3_1 T@U) ) (!  (=> (and (= (type n$2_3_1) RefType) (U_2_bool (MapType2Select new_g@0 n$2_3_1))) (U_2_bool (MapType2Select new_g@0 (MapType0Select ExhaleHeap@5 n$2_3_1 next))))
 :qid |stdinbpl.7356:20|
 :skolemid |839|
 :pattern ( (MapType2Select new_g@0 (MapType0Select ExhaleHeap@5 n$2_3_1 next)))
 :pattern ( (MapType2Select new_g@0 n$2_3_1) (MapType0Select ExhaleHeap@5 n$2_3_1 next))
)) (and (and (=> (= (ControlFlow 0 148) 147) anon407_Else_correct) (=> (= (ControlFlow 0 148) 119) anon408_Then_correct)) (=> (= (ControlFlow 0 148) 115) anon408_Else_correct)))))
(let ((anon251_correct true))
(let ((anon406_Else_correct  (=> (and (not (U_2_bool (MapType2Select new_g@0 n$2_2))) (= (ControlFlow 0 113) 110)) anon251_correct)))
(let ((anon406_Then_correct  (=> (U_2_bool (MapType2Select new_g@0 n$2_2)) (and (=> (= (ControlFlow 0 111) (- 0 112)) (U_2_bool (MapType2Select new_g@0 (MapType0Select ExhaleHeap@5 n$2_2 next)))) (=> (U_2_bool (MapType2Select new_g@0 (MapType0Select ExhaleHeap@5 n$2_2 next))) (=> (= (ControlFlow 0 111) 110) anon251_correct))))))
(let ((anon403_Else_correct  (=> (and (forall ((n_71_1 T@U) (m_16_1 T@U) ) (!  (=> (and (and (= (type n_71_1) RefType) (= (type m_16_1) RefType)) (and (U_2_bool (MapType2Select new_g@0 n_71_1)) (U_2_bool (MapType2Select new_g@0 m_16_1)))) (and (exists_path ($$ ExhaleHeap@5 new_g@0) n_71_1 node@0) (exists_path ($$ ExhaleHeap@5 new_g@0) node@0 m_16_1)))
 :qid |stdinbpl.7297:20|
 :skolemid |832|
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| ExhaleHeap@5 new_g@0))) new_g@0) n_71_1 m_16_1))
)) (state ExhaleHeap@5 QPMask@17)) (and (=> (= (ControlFlow 0 149) (- 0 152)) (not (U_2_bool (MapType2Select new_g@0 null)))) (=> (not (U_2_bool (MapType2Select new_g@0 null))) (and (=> (= (ControlFlow 0 149) (- 0 151)) (forall ((n$1_2 T@U) (n$1_2_1 T@U) ) (!  (=> (and (= (type n$1_2) RefType) (= (type n$1_2_1) RefType)) (=> (and (and (and (and (not (= n$1_2 n$1_2_1)) (U_2_bool (MapType2Select new_g@0 n$1_2))) (U_2_bool (MapType2Select new_g@0 n$1_2_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$1_2 n$1_2_1))))
 :qid |stdinbpl.7315:17|
 :skolemid |833|
 :pattern ( (neverTriggered58 n$1_2) (neverTriggered58 n$1_2_1))
))) (=> (forall ((n$1_2@@0 T@U) (n$1_2_1@@0 T@U) ) (!  (=> (and (= (type n$1_2@@0) RefType) (= (type n$1_2_1@@0) RefType)) (=> (and (and (and (and (not (= n$1_2@@0 n$1_2_1@@0)) (U_2_bool (MapType2Select new_g@0 n$1_2@@0))) (U_2_bool (MapType2Select new_g@0 n$1_2_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$1_2@@0 n$1_2_1@@0))))
 :qid |stdinbpl.7315:17|
 :skolemid |833|
 :pattern ( (neverTriggered58 n$1_2@@0) (neverTriggered58 n$1_2_1@@0))
)) (and (=> (= (ControlFlow 0 149) (- 0 150)) (forall ((n$1_2@@1 T@U) ) (!  (=> (and (= (type n$1_2@@1) RefType) (U_2_bool (MapType2Select new_g@0 n$1_2@@1))) (>= (U_2_real (MapType1Select QPMask@17 n$1_2@@1 next)) FullPerm))
 :qid |stdinbpl.7322:17|
 :skolemid |834|
 :pattern ( (MapType0Select ExhaleHeap@5 n$1_2@@1 next))
 :pattern ( (MapType1Select QPMask@18 n$1_2@@1 next))
 :pattern ( (MapType0Select ExhaleHeap@5 n$1_2@@1 next))
))) (=> (forall ((n$1_2@@2 T@U) ) (!  (=> (and (= (type n$1_2@@2) RefType) (U_2_bool (MapType2Select new_g@0 n$1_2@@2))) (>= (U_2_real (MapType1Select QPMask@17 n$1_2@@2 next)) FullPerm))
 :qid |stdinbpl.7322:17|
 :skolemid |834|
 :pattern ( (MapType0Select ExhaleHeap@5 n$1_2@@2 next))
 :pattern ( (MapType1Select QPMask@18 n$1_2@@2 next))
 :pattern ( (MapType0Select ExhaleHeap@5 n$1_2@@2 next))
)) (=> (and (and (forall ((n$1_2@@3 T@U) ) (!  (=> (= (type n$1_2@@3) RefType) (=> (and (U_2_bool (MapType2Select new_g@0 n$1_2@@3)) (< NoPerm FullPerm)) (and (qpRange58 n$1_2@@3) (= (invRecv58 n$1_2@@3) n$1_2@@3))))
 :qid |stdinbpl.7328:22|
 :skolemid |835|
 :pattern ( (MapType0Select ExhaleHeap@5 n$1_2@@3 next))
 :pattern ( (MapType1Select QPMask@18 n$1_2@@3 next))
 :pattern ( (MapType0Select ExhaleHeap@5 n$1_2@@3 next))
)) (forall ((o_3@@26 T@U) ) (!  (=> (= (type o_3@@26) RefType) (=> (and (U_2_bool (MapType2Select new_g@0 (invRecv58 o_3@@26))) (and (< NoPerm FullPerm) (qpRange58 o_3@@26))) (= (invRecv58 o_3@@26) o_3@@26)))
 :qid |stdinbpl.7332:22|
 :skolemid |836|
 :pattern ( (invRecv58 o_3@@26))
))) (and (forall ((o_3@@27 T@U) ) (!  (=> (= (type o_3@@27) RefType) (and (=> (and (U_2_bool (MapType2Select new_g@0 (invRecv58 o_3@@27))) (and (< NoPerm FullPerm) (qpRange58 o_3@@27))) (and (= (invRecv58 o_3@@27) o_3@@27) (= (U_2_real (MapType1Select QPMask@18 o_3@@27 next)) (- (U_2_real (MapType1Select QPMask@17 o_3@@27 next)) FullPerm)))) (=> (not (and (U_2_bool (MapType2Select new_g@0 (invRecv58 o_3@@27))) (and (< NoPerm FullPerm) (qpRange58 o_3@@27)))) (= (U_2_real (MapType1Select QPMask@18 o_3@@27 next)) (U_2_real (MapType1Select QPMask@17 o_3@@27 next))))))
 :qid |stdinbpl.7338:22|
 :skolemid |837|
 :pattern ( (MapType1Select QPMask@18 o_3@@27 next))
)) (forall ((o_3@@28 T@U) (f_5@@8 T@U) ) (! (let ((B@@20 (FieldTypeInv1 (type f_5@@8))))
(let ((A@@21 (FieldTypeInv0 (type f_5@@8))))
 (=> (and (and (= (type o_3@@28) RefType) (= (type f_5@@8) (FieldType A@@21 B@@20))) (not (= f_5@@8 next))) (= (U_2_real (MapType1Select QPMask@17 o_3@@28 f_5@@8)) (U_2_real (MapType1Select QPMask@18 o_3@@28 f_5@@8))))))
 :qid |stdinbpl.7344:29|
 :skolemid |838|
 :pattern ( (MapType1Select QPMask@18 o_3@@28 f_5@@8))
)))) (and (and (=> (= (ControlFlow 0 149) 148) anon405_Else_correct) (=> (= (ControlFlow 0 149) 111) anon406_Then_correct)) (=> (= (ControlFlow 0 149) 113) anon406_Else_correct))))))))))))
(let ((anon247_correct true))
(let ((anon404_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select new_g@0 n_70)) (U_2_bool (MapType2Select new_g@0 m_15)))) (= (ControlFlow 0 109) 105)) anon247_correct)))
(let ((anon404_Then_correct  (=> (and (U_2_bool (MapType2Select new_g@0 n_70)) (U_2_bool (MapType2Select new_g@0 m_15))) (and (=> (= (ControlFlow 0 106) (- 0 108)) (exists_path ($$ ExhaleHeap@5 new_g@0) n_70 node@0)) (=> (exists_path ($$ ExhaleHeap@5 new_g@0) n_70 node@0) (and (=> (= (ControlFlow 0 106) (- 0 107)) (exists_path ($$ ExhaleHeap@5 new_g@0) node@0 m_15)) (=> (exists_path ($$ ExhaleHeap@5 new_g@0) node@0 m_15) (=> (= (ControlFlow 0 106) 105) anon247_correct))))))))
(let ((anon402_Then_correct  (and (=> (= (ControlFlow 0 100) (- 0 102)) (forall ((n$0_17 T@U) ) (!  (=> (= (type n$0_17) RefType) (=> (and (U_2_bool (MapType2Select new_g@0 n$0_17)) (dummyFunction (MapType0Select ExhaleHeap@5 n$0_17 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.7236:27|
 :skolemid |825|
 :pattern ( (MapType0Select ExhaleHeap@5 n$0_17 next))
 :pattern ( (MapType1Select QPMask@21 n$0_17 next))
 :pattern ( (MapType0Select ExhaleHeap@5 n$0_17 next))
))) (=> (forall ((n$0_17@@0 T@U) ) (!  (=> (= (type n$0_17@@0) RefType) (=> (and (U_2_bool (MapType2Select new_g@0 n$0_17@@0)) (dummyFunction (MapType0Select ExhaleHeap@5 n$0_17@@0 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.7236:27|
 :skolemid |825|
 :pattern ( (MapType0Select ExhaleHeap@5 n$0_17@@0 next))
 :pattern ( (MapType1Select QPMask@21 n$0_17@@0 next))
 :pattern ( (MapType0Select ExhaleHeap@5 n$0_17@@0 next))
)) (and (=> (= (ControlFlow 0 100) (- 0 101)) (forall ((n$0_17@@1 T@U) (n$0_17_1 T@U) ) (!  (=> (and (= (type n$0_17@@1) RefType) (= (type n$0_17_1) RefType)) (=> (and (and (and (and (not (= n$0_17@@1 n$0_17_1)) (U_2_bool (MapType2Select new_g@0 n$0_17@@1))) (U_2_bool (MapType2Select new_g@0 n$0_17_1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n$0_17@@1 n$0_17_1))))
 :qid |stdinbpl.7243:27|
 :skolemid |826|
 :pattern ( (neverTriggered83 n$0_17@@1) (neverTriggered83 n$0_17_1))
))) (=> (forall ((n$0_17@@2 T@U) (n$0_17_1@@0 T@U) ) (!  (=> (and (= (type n$0_17@@2) RefType) (= (type n$0_17_1@@0) RefType)) (=> (and (and (and (and (not (= n$0_17@@2 n$0_17_1@@0)) (U_2_bool (MapType2Select new_g@0 n$0_17@@2))) (U_2_bool (MapType2Select new_g@0 n$0_17_1@@0))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n$0_17@@2 n$0_17_1@@0))))
 :qid |stdinbpl.7243:27|
 :skolemid |826|
 :pattern ( (neverTriggered83 n$0_17@@2) (neverTriggered83 n$0_17_1@@0))
)) (=> (= (ControlFlow 0 100) (- 0 99)) (forall ((n$0_17@@3 T@U) ) (!  (=> (and (= (type n$0_17@@3) RefType) (U_2_bool (MapType2Select new_g@0 n$0_17@@3))) (>= (U_2_real (MapType1Select QPMask@17 n$0_17@@3 next)) (/ (to_real 1) (to_real 2))))
 :qid |stdinbpl.7250:27|
 :skolemid |827|
 :pattern ( (MapType0Select ExhaleHeap@5 n$0_17@@3 next))
 :pattern ( (MapType1Select QPMask@21 n$0_17@@3 next))
 :pattern ( (MapType0Select ExhaleHeap@5 n$0_17@@3 next))
)))))))))
(let ((anon400_Then_correct  (and (=> (= (ControlFlow 0 95) (- 0 97)) (forall ((n$0_16 T@U) ) (!  (=> (= (type n$0_16) RefType) (=> (and (U_2_bool (MapType2Select new_g@0 n$0_16)) (dummyFunction (MapType0Select ExhaleHeap@5 n$0_16 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.7179:25|
 :skolemid |818|
 :pattern ( (MapType0Select ExhaleHeap@5 n$0_16 next))
 :pattern ( (MapType1Select QPMask@20 n$0_16 next))
 :pattern ( (MapType0Select ExhaleHeap@5 n$0_16 next))
))) (=> (forall ((n$0_16@@0 T@U) ) (!  (=> (= (type n$0_16@@0) RefType) (=> (and (U_2_bool (MapType2Select new_g@0 n$0_16@@0)) (dummyFunction (MapType0Select ExhaleHeap@5 n$0_16@@0 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.7179:25|
 :skolemid |818|
 :pattern ( (MapType0Select ExhaleHeap@5 n$0_16@@0 next))
 :pattern ( (MapType1Select QPMask@20 n$0_16@@0 next))
 :pattern ( (MapType0Select ExhaleHeap@5 n$0_16@@0 next))
)) (and (=> (= (ControlFlow 0 95) (- 0 96)) (forall ((n$0_16@@1 T@U) (n$0_16_1 T@U) ) (!  (=> (and (= (type n$0_16@@1) RefType) (= (type n$0_16_1) RefType)) (=> (and (and (and (and (not (= n$0_16@@1 n$0_16_1)) (U_2_bool (MapType2Select new_g@0 n$0_16@@1))) (U_2_bool (MapType2Select new_g@0 n$0_16_1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n$0_16@@1 n$0_16_1))))
 :qid |stdinbpl.7186:25|
 :skolemid |819|
 :pattern ( (neverTriggered82 n$0_16@@1) (neverTriggered82 n$0_16_1))
))) (=> (forall ((n$0_16@@2 T@U) (n$0_16_1@@0 T@U) ) (!  (=> (and (= (type n$0_16@@2) RefType) (= (type n$0_16_1@@0) RefType)) (=> (and (and (and (and (not (= n$0_16@@2 n$0_16_1@@0)) (U_2_bool (MapType2Select new_g@0 n$0_16@@2))) (U_2_bool (MapType2Select new_g@0 n$0_16_1@@0))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n$0_16@@2 n$0_16_1@@0))))
 :qid |stdinbpl.7186:25|
 :skolemid |819|
 :pattern ( (neverTriggered82 n$0_16@@2) (neverTriggered82 n$0_16_1@@0))
)) (=> (= (ControlFlow 0 95) (- 0 94)) (forall ((n$0_16@@3 T@U) ) (!  (=> (and (= (type n$0_16@@3) RefType) (U_2_bool (MapType2Select new_g@0 n$0_16@@3))) (>= (U_2_real (MapType1Select QPMask@17 n$0_16@@3 next)) (/ (to_real 1) (to_real 2))))
 :qid |stdinbpl.7193:25|
 :skolemid |820|
 :pattern ( (MapType0Select ExhaleHeap@5 n$0_16@@3 next))
 :pattern ( (MapType1Select QPMask@20 n$0_16@@3 next))
 :pattern ( (MapType0Select ExhaleHeap@5 n$0_16@@3 next))
)))))))))
(let ((anon243_correct true))
(let ((anon401_Then_correct  (=> (exists_path ($$ ExhaleHeap@5 new_g@0) n_45 node@0) (and (=> (= (ControlFlow 0 103) 100) anon402_Then_correct) (=> (= (ControlFlow 0 103) 92) anon243_correct)))))
(let ((anon401_Else_correct  (=> (and (not (exists_path ($$ ExhaleHeap@5 new_g@0) n_45 node@0)) (= (ControlFlow 0 98) 92)) anon243_correct)))
(let ((anon399_Then_correct  (=> (and (U_2_bool (MapType2Select new_g@0 n_45)) (U_2_bool (MapType2Select new_g@0 m_5))) (and (and (=> (= (ControlFlow 0 104) 95) anon400_Then_correct) (=> (= (ControlFlow 0 104) 103) anon401_Then_correct)) (=> (= (ControlFlow 0 104) 98) anon401_Else_correct)))))
(let ((anon399_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select new_g@0 n_45)) (U_2_bool (MapType2Select new_g@0 m_5)))) (= (ControlFlow 0 93) 92)) anon243_correct)))
(let ((anon236_correct  (=> (and (state ExhaleHeap@5 QPMask@17) (forall ((n_65 T@U) ) (!  (=> (= (type n_65) RefType) (=> (and (U_2_bool (MapType2Select new_g@0 n_65)) (not (= n_65 node@0))) (__learn_trigger__ (DEP ($$ ExhaleHeap@5 new_g@0) node@0 n_65 node@0 (MapType0Select ExhaleHeap@5 node@0 next)))))
 :qid |stdinbpl.7139:22|
 :skolemid |814|
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| ExhaleHeap@5 new_g@0))) new_g@0) new_node@0 n_65))
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| ExhaleHeap@5 new_g@0))) new_g@0) node@0 n_65))
))) (=> (and (and (and (state ExhaleHeap@5 QPMask@17) (forall ((n_66 T@U) ) (!  (=> (= (type n_66) RefType) (=> (and (U_2_bool (MapType2Select new_g@0 n_66)) (not (= n_66 new_node@0))) (__learn_trigger__ (DEP ($$ ExhaleHeap@5 new_g@0) new_node@0 n_66 new_node@0 (MapType0Select ExhaleHeap@5 new_node@0 next)))))
 :qid |stdinbpl.7144:22|
 :skolemid |815|
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| ExhaleHeap@5 new_g@0))) new_g@0) new_node@0 n_66))
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| ExhaleHeap@5 new_g@0))) new_g@0) node@0 n_66))
))) (and (state ExhaleHeap@5 QPMask@17) (forall ((n_67 T@U) ) (!  (=> (= (type n_67) RefType) (=> (and (U_2_bool (MapType2Select new_g@0 n_67)) (not (= n_67 node@0))) (__learn_trigger__ (DEP ($$ ExhaleHeap@5 new_g@0) n_67 node@0 n_67 (MapType0Select ExhaleHeap@5 n_67 next)))))
 :qid |stdinbpl.7149:22|
 :skolemid |816|
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| ExhaleHeap@5 new_g@0))) new_g@0) n_67 new_node@0))
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| ExhaleHeap@5 new_g@0))) new_g@0) n_67 node@0))
)))) (and (and (state ExhaleHeap@5 QPMask@17) (forall ((n_68 T@U) ) (!  (=> (and (= (type n_68) RefType) (U_2_bool (MapType2Select new_g@0 n_68))) (and (__learn_trigger__ (exists_path ($$ ExhaleHeap@5 new_g@0) new_node@0 n_68)) (__learn_trigger__ (exists_path ($$ Heap@1 new_g@0) new_node@0 n_68))))
 :qid |stdinbpl.7154:22|
 :skolemid |817|
 :pattern ( (DEP (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| ExhaleHeap@5 new_g@0))) new_g@0) new_node@0 n_68 new_node@0 (MapType0Select ExhaleHeap@5 new_node@0 next)))
 :pattern ( (DEP (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| ExhaleHeap@5 new_g@0))) new_g@0) node@0 n_68 node@0 (MapType0Select ExhaleHeap@5 node@0 next)))
))) (and (state ExhaleHeap@5 QPMask@17) (state ExhaleHeap@5 QPMask@17)))) (and (and (and (and (=> (= (ControlFlow 0 153) 149) anon403_Else_correct) (=> (= (ControlFlow 0 153) 106) anon404_Then_correct)) (=> (= (ControlFlow 0 153) 109) anon404_Else_correct)) (=> (= (ControlFlow 0 153) 104) anon399_Then_correct)) (=> (= (ControlFlow 0 153) 93) anon399_Else_correct))))))
(let ((anon397_Else_correct  (=> (and (= new_node@0 null) (= (ControlFlow 0 155) 153)) anon236_correct)))
(let ((anon397_Then_correct  (=> (and (and (not (= new_node@0 null)) (state ExhaleHeap@5 QPMask@17)) (and (forall ((x$0_5 T@U) (y_5 T@U) (u_5_2 T@U) (v_7_2 T@U) ) (!  (=> (and (and (and (and (= (type x$0_5) RefType) (= (type y_5) RefType)) (= (type u_5_2) RefType)) (= (type v_7_2) RefType)) (and (DEP ($$ ExhaleHeap@5 new_g@0) x$0_5 y_5 u_5_2 v_7_2) (not (DEP ($$ ExhaleHeap@5 new_g@0) x$0_5 y_5 node@0 new_node@0)))) (DEP ($$ Heap@1 new_g@0) x$0_5 y_5 u_5_2 v_7_2))
 :qid |stdinbpl.7133:24|
 :skolemid |813|
 :pattern ( (DEP (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| ExhaleHeap@5 new_g@0))) new_g@0) x$0_5 y_5 u_5_2 v_7_2))
 :pattern ( (DEP (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| Heap@1 new_g@0))) new_g@0) x$0_5 y_5 u_5_2 v_7_2))
)) (= (ControlFlow 0 154) 153))) anon236_correct)))
(let ((anon396_Else_correct  (=> (= new_node@0 null) (and (=> (= (ControlFlow 0 157) 154) anon397_Then_correct) (=> (= (ControlFlow 0 157) 155) anon397_Else_correct)))))
(let ((anon396_Then_correct  (=> (not (= new_node@0 null)) (=> (and (state ExhaleHeap@5 QPMask@17) (forall ((x$0_4 T@U) (y_4_1 T@U) (u_4@@0 T@U) (v_6 T@U) ) (!  (=> (and (and (and (and (and (= (type x$0_4) RefType) (= (type y_4_1) RefType)) (= (type u_4@@0) RefType)) (= (type v_6) RefType)) (and (not (= node@0 new_node@0)) (and (not (= u_4@@0 v_6)) (not (= x$0_4 y_4_1))))) (or (DEP ($$ Heap@1 new_g@0) x$0_4 y_4_1 u_4@@0 v_6) (or (and (= x$0_4 node@0) (and (= u_4@@0 node@0) (and (= y_4_1 new_node@0) (= v_6 new_node@0)))) (or (exists ((w_2 T@U) (z_2 T@U) ) (!  (and (and (= (type w_2) RefType) (= (type z_2) RefType)) (and (forall ((u__3 T@U) (v__3 T@U) ) (!  (=> (and (= (type u__3) RefType) (= (type v__3) RefType)) (not (DEP ($$ Heap@1 new_g@0) x$0_4 y_4_1 u__3 v__3)))
 :qid |stdinbpl.7112:21|
 :skolemid |806|
 :pattern ( (DEP (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| Heap@1 new_g@0))) new_g@0) x$0_4 y_4_1 u__3 v__3))
)) (and (or (and (DEP ($$ Heap@1 new_g@0) x$0_4 node@0 u_4@@0 v_6) (not (= x$0_4 node@0))) (and (= x$0_4 u_4@@0) (and (= u_4@@0 node@0) (= v_6 new_node@0)))) (or (and (DEP ($$ Heap@1 new_g@0) new_node@0 y_4_1 w_2 z_2) (not (= new_node@0 y_4_1))) (and (= node@0 w_2) (and (= new_node@0 z_2) (= z_2 y_4_1)))))))
 :qid |stdinbpl.7110:217|
 :skolemid |807|
 :pattern ( (DEP (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| Heap@1 new_g@0))) new_g@0) new_node@0 y_4_1 w_2 z_2))
)) (or (exists ((U_2_1 T@U) (V_2_1 T@U) ) (!  (and (and (= (type U_2_1) RefType) (= (type V_2_1) RefType)) (and (forall ((u__4 T@U) (v__4 T@U) ) (!  (=> (and (= (type u__4) RefType) (= (type v__4) RefType)) (not (DEP ($$ Heap@1 new_g@0) x$0_4 y_4_1 u__4 v__4)))
 :qid |stdinbpl.7118:21|
 :skolemid |808|
 :pattern ( (DEP (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| Heap@1 new_g@0))) new_g@0) x$0_4 y_4_1 u__4 v__4))
)) (and (or (and (DEP ($$ Heap@1 new_g@0) x$0_4 node@0 U_2_1 V_2_1) (not (= x$0_4 node@0))) (and (= x$0_4 U_2_1) (and (= U_2_1 node@0) (= V_2_1 new_node@0)))) (or (and (DEP ($$ Heap@1 new_g@0) new_node@0 y_4_1 u_4@@0 v_6) (not (= new_node@0 y_4_1))) (and (= node@0 u_4@@0) (and (= new_node@0 v_6) (= v_6 y_4_1)))))))
 :qid |stdinbpl.7116:25|
 :skolemid |809|
 :pattern ( (DEP (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| Heap@1 new_g@0))) new_g@0) x$0_4 node@0 U_2_1 V_2_1))
)) (and (= u_4@@0 node@0) (and (= v_6 new_node@0) (exists ((U_3_1 T@U) (V_3 T@U) (w_3 T@U) (z_3 T@U) ) (!  (and (and (and (and (= (type U_3_1) RefType) (= (type V_3) RefType)) (= (type w_3) RefType)) (= (type z_3) RefType)) (and (forall ((u__5 T@U) (v__5 T@U) ) (!  (=> (and (= (type u__5) RefType) (= (type v__5) RefType)) (not (DEP ($$ Heap@1 new_g@0) x$0_4 y_4_1 u__5 v__5)))
 :qid |stdinbpl.7124:21|
 :skolemid |810|
 :pattern ( (DEP (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| Heap@1 new_g@0))) new_g@0) x$0_4 y_4_1 u__5 v__5))
)) (and (or (and (DEP ($$ Heap@1 new_g@0) x$0_4 node@0 U_3_1 V_3) (not (= x$0_4 node@0))) (and (= x$0_4 U_3_1) (and (= U_3_1 node@0) (= V_3 new_node@0)))) (or (and (DEP ($$ Heap@1 new_g@0) new_node@0 y_4_1 w_3 z_3) (not (= new_node@0 y_4_1))) (and (= node@0 w_3) (and (= new_node@0 z_3) (= z_3 y_4_1)))))))
 :qid |stdinbpl.7122:60|
 :skolemid |811|
 :pattern ( (DEP (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| Heap@1 new_g@0))) new_g@0) x$0_4 node@0 U_3_1 V_3) (DEP (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| Heap@1 new_g@0))) new_g@0) new_node@0 y_4_1 w_3 z_3))
))))))))) (DEP ($$ ExhaleHeap@5 new_g@0) x$0_4 y_4_1 u_4@@0 v_6))
 :qid |stdinbpl.7108:24|
 :skolemid |812|
 :pattern ( (DEP (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| ExhaleHeap@5 new_g@0))) new_g@0) x$0_4 y_4_1 u_4@@0 v_6))
 :pattern ( (DEP (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| Heap@1 new_g@0))) new_g@0) x$0_4 y_4_1 u_4@@0 v_6))
))) (and (=> (= (ControlFlow 0 156) 154) anon397_Then_correct) (=> (= (ControlFlow 0 156) 155) anon397_Else_correct))))))
(let ((anon395_Else_correct  (=> (= new_node@0 null) (and (=> (= (ControlFlow 0 159) 156) anon396_Then_correct) (=> (= (ControlFlow 0 159) 157) anon396_Else_correct)))))
(let ((anon395_Then_correct  (=> (not (= new_node@0 null)) (=> (and (state ExhaleHeap@5 QPMask@17) (forall ((v1_5 T@U) (v2_5 T@U) ) (!  (=> (and (= (type v1_5) RefType) (= (type v2_5) RefType)) (= (edge ($$ ExhaleHeap@5 new_g@0) v1_5 v2_5)  (or (edge ($$ Heap@1 new_g@0) v1_5 v2_5) (and (= v1_5 node@0) (= v2_5 new_node@0)))))
 :qid |stdinbpl.7101:24|
 :skolemid |805|
 :pattern ( (edge (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| ExhaleHeap@5 new_g@0))) new_g@0) v1_5 v2_5))
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| ExhaleHeap@5 new_g@0))) new_g@0) v1_5 v2_5))
))) (and (=> (= (ControlFlow 0 158) 156) anon396_Then_correct) (=> (= (ControlFlow 0 158) 157) anon396_Else_correct))))))
(let ((anon394_Else_correct  (=> (not (= new_node@0 null)) (and (=> (= (ControlFlow 0 161) 158) anon395_Then_correct) (=> (= (ControlFlow 0 161) 159) anon395_Else_correct)))))
(let ((anon394_Then_correct  (=> (= new_node@0 null) (=> (and (state ExhaleHeap@5 QPMask@17) (|Set#Equal| ($$ ExhaleHeap@5 new_g@0) ($$ Heap@1 new_g@0))) (and (=> (= (ControlFlow 0 160) 158) anon395_Then_correct) (=> (= (ControlFlow 0 160) 159) anon395_Else_correct))))))
(let ((anon392_Else_correct  (=> (forall ((n$0_15_1 T@U) ) (!  (=> (= (type n$0_15_1) RefType) (=> (and (U_2_bool (MapType2Select new_g@0 n$0_15_1)) (not (= (MapType0Select Heap@1 n$0_15_1 next) null))) (U_2_bool (MapType2Select new_g@0 (MapType0Select Heap@1 n$0_15_1 next)))))
 :qid |stdinbpl.7030:22|
 :skolemid |796|
 :pattern ( (MapType2Select new_g@0 (MapType0Select Heap@1 n$0_15_1 next)))
 :pattern ( (MapType2Select new_g@0 n$0_15_1) (MapType0Select Heap@1 n$0_15_1 next))
)) (and (=> (= (ControlFlow 0 162) (- 0 166)) (= (MapType0Select Heap@1 node@0 next) null)) (=> (= (MapType0Select Heap@1 node@0 next) null) (and (=> (= (ControlFlow 0 162) (- 0 165)) (not (exists_path ($$ Heap@1 new_g@0) node@0 new_node@0))) (=> (not (exists_path ($$ Heap@1 new_g@0) node@0 new_node@0)) (=> (and (IdenticalOnKnownLocations Heap@1 ExhaleHeap@5 QPMask@16) (not (U_2_bool (MapType2Select new_g@0 null)))) (=> (and (and (U_2_bool (MapType2Select new_g@0 node@0)) (not (= node@0 null))) (and (= Mask@11 (MapType1Store QPMask@16 node@0 next (real_2_U (+ (U_2_real (MapType1Select QPMask@16 node@0 next)) FullPerm)))) (state ExhaleHeap@5 Mask@11))) (and (=> (= (ControlFlow 0 162) (- 0 164)) (forall ((n$1_6 T@U) (n$1_6_1 T@U) ) (!  (=> (and (= (type n$1_6) RefType) (= (type n$1_6_1) RefType)) (=> (and (and (and (and (not (= n$1_6 n$1_6_1)) (and (U_2_bool (MapType2Select new_g@0 n$1_6)) (not (= n$1_6 node@0)))) (and (U_2_bool (MapType2Select new_g@0 n$1_6_1)) (not (= n$1_6_1 node@0)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n$1_6 n$1_6_1))))
 :qid |stdinbpl.7052:17|
 :skolemid |797|
 :no-pattern (type n$1_6)
 :no-pattern (type n$1_6_1)
 :no-pattern (U_2_int n$1_6)
 :no-pattern (U_2_bool n$1_6)
 :no-pattern (U_2_int n$1_6_1)
 :no-pattern (U_2_bool n$1_6_1)
))) (=> (forall ((n$1_6@@0 T@U) (n$1_6_1@@0 T@U) ) (!  (=> (and (= (type n$1_6@@0) RefType) (= (type n$1_6_1@@0) RefType)) (=> (and (and (and (and (not (= n$1_6@@0 n$1_6_1@@0)) (and (U_2_bool (MapType2Select new_g@0 n$1_6@@0)) (not (= n$1_6@@0 node@0)))) (and (U_2_bool (MapType2Select new_g@0 n$1_6_1@@0)) (not (= n$1_6_1@@0 node@0)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n$1_6@@0 n$1_6_1@@0))))
 :qid |stdinbpl.7052:17|
 :skolemid |797|
 :no-pattern (type n$1_6@@0)
 :no-pattern (type n$1_6_1@@0)
 :no-pattern (U_2_int n$1_6@@0)
 :no-pattern (U_2_bool n$1_6@@0)
 :no-pattern (U_2_int n$1_6_1@@0)
 :no-pattern (U_2_bool n$1_6_1@@0)
)) (=> (and (forall ((n$1_6@@1 T@U) ) (!  (=> (= (type n$1_6@@1) RefType) (=> (and (and (U_2_bool (MapType2Select new_g@0 n$1_6@@1)) (not (= n$1_6@@1 node@0))) (< NoPerm (/ (to_real 1) (to_real 2)))) (and (qpRange81 n$1_6@@1) (= (invRecv81 n$1_6@@1) n$1_6@@1))))
 :qid |stdinbpl.7058:24|
 :skolemid |798|
 :pattern ( (MapType0Select ExhaleHeap@5 n$1_6@@1 next))
 :pattern ( (MapType1Select QPMask@17 n$1_6@@1 next))
 :pattern ( (MapType0Select ExhaleHeap@5 n$1_6@@1 next))
)) (forall ((o_3@@29 T@U) ) (!  (=> (= (type o_3@@29) RefType) (=> (and (and (and (U_2_bool (MapType2Select new_g@0 (invRecv81 o_3@@29))) (not (= (invRecv81 o_3@@29) node@0))) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange81 o_3@@29)) (= (invRecv81 o_3@@29) o_3@@29)))
 :qid |stdinbpl.7062:24|
 :skolemid |799|
 :pattern ( (invRecv81 o_3@@29))
))) (and (=> (= (ControlFlow 0 162) (- 0 163)) (forall ((n$1_6@@2 T@U) ) (!  (=> (= (type n$1_6@@2) RefType) (=> (and (U_2_bool (MapType2Select new_g@0 n$1_6@@2)) (not (= n$1_6@@2 node@0))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.7068:17|
 :skolemid |800|
 :pattern ( (MapType0Select ExhaleHeap@5 n$1_6@@2 next))
 :pattern ( (MapType1Select QPMask@17 n$1_6@@2 next))
 :pattern ( (MapType0Select ExhaleHeap@5 n$1_6@@2 next))
))) (=> (forall ((n$1_6@@3 T@U) ) (!  (=> (= (type n$1_6@@3) RefType) (=> (and (U_2_bool (MapType2Select new_g@0 n$1_6@@3)) (not (= n$1_6@@3 node@0))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.7068:17|
 :skolemid |800|
 :pattern ( (MapType0Select ExhaleHeap@5 n$1_6@@3 next))
 :pattern ( (MapType1Select QPMask@17 n$1_6@@3 next))
 :pattern ( (MapType0Select ExhaleHeap@5 n$1_6@@3 next))
)) (=> (and (forall ((n$1_6@@4 T@U) ) (!  (=> (= (type n$1_6@@4) RefType) (=> (and (and (U_2_bool (MapType2Select new_g@0 n$1_6@@4)) (not (= n$1_6@@4 node@0))) (> (/ (to_real 1) (to_real 2)) NoPerm)) (not (= n$1_6@@4 null))))
 :qid |stdinbpl.7074:24|
 :skolemid |801|
 :pattern ( (MapType0Select ExhaleHeap@5 n$1_6@@4 next))
 :pattern ( (MapType1Select QPMask@17 n$1_6@@4 next))
 :pattern ( (MapType0Select ExhaleHeap@5 n$1_6@@4 next))
)) (forall ((o_3@@30 T@U) ) (!  (=> (= (type o_3@@30) RefType) (and (=> (and (and (and (U_2_bool (MapType2Select new_g@0 (invRecv81 o_3@@30))) (not (= (invRecv81 o_3@@30) node@0))) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange81 o_3@@30)) (and (=> (< NoPerm (/ (to_real 1) (to_real 2))) (= (invRecv81 o_3@@30) o_3@@30)) (= (U_2_real (MapType1Select QPMask@17 o_3@@30 next)) (+ (U_2_real (MapType1Select Mask@11 o_3@@30 next)) (/ (to_real 1) (to_real 2)))))) (=> (not (and (and (and (U_2_bool (MapType2Select new_g@0 (invRecv81 o_3@@30))) (not (= (invRecv81 o_3@@30) node@0))) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange81 o_3@@30))) (= (U_2_real (MapType1Select QPMask@17 o_3@@30 next)) (U_2_real (MapType1Select Mask@11 o_3@@30 next))))))
 :qid |stdinbpl.7080:24|
 :skolemid |802|
 :pattern ( (MapType1Select QPMask@17 o_3@@30 next))
))) (=> (and (and (forall ((o_3@@31 T@U) (f_5@@9 T@U) ) (! (let ((B@@21 (FieldTypeInv1 (type f_5@@9))))
(let ((A@@22 (FieldTypeInv0 (type f_5@@9))))
 (=> (and (and (= (type o_3@@31) RefType) (= (type f_5@@9) (FieldType A@@22 B@@21))) (not (= f_5@@9 next))) (= (U_2_real (MapType1Select Mask@11 o_3@@31 f_5@@9)) (U_2_real (MapType1Select QPMask@17 o_3@@31 f_5@@9))))))
 :qid |stdinbpl.7084:31|
 :skolemid |803|
 :pattern ( (MapType1Select Mask@11 o_3@@31 f_5@@9))
 :pattern ( (MapType1Select QPMask@17 o_3@@31 f_5@@9))
)) (state ExhaleHeap@5 QPMask@17)) (and (forall ((n$2_7 T@U) ) (!  (=> (= (type n$2_7) RefType) (=> (and (U_2_bool (MapType2Select new_g@0 n$2_7)) (not (= (MapType0Select ExhaleHeap@5 n$2_7 next) null))) (U_2_bool (MapType2Select new_g@0 (MapType0Select ExhaleHeap@5 n$2_7 next)))))
 :qid |stdinbpl.7090:22|
 :skolemid |804|
 :pattern ( (MapType2Select new_g@0 (MapType0Select ExhaleHeap@5 n$2_7 next)))
 :pattern ( (MapType2Select new_g@0 n$2_7) (MapType0Select ExhaleHeap@5 n$2_7 next))
)) (= (MapType0Select ExhaleHeap@5 node@0 next) new_node@0))) (and (=> (= (ControlFlow 0 162) 160) anon394_Then_correct) (=> (= (ControlFlow 0 162) 161) anon394_Else_correct))))))))))))))))))
(let ((anon227_correct true))
(let ((anon393_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select new_g@0 n$0_14)) (not (= (MapType0Select Heap@1 n$0_14 next) null)))) (= (ControlFlow 0 91) 88)) anon227_correct)))
(let ((anon393_Then_correct  (=> (and (U_2_bool (MapType2Select new_g@0 n$0_14)) (not (= (MapType0Select Heap@1 n$0_14 next) null))) (and (=> (= (ControlFlow 0 89) (- 0 90)) (U_2_bool (MapType2Select new_g@0 (MapType0Select Heap@1 n$0_14 next)))) (=> (U_2_bool (MapType2Select new_g@0 (MapType0Select Heap@1 n$0_14 next))) (=> (= (ControlFlow 0 89) 88) anon227_correct))))))
(let ((anon224_correct  (=> (= Mask@10 (MapType1Store Mask@9 node@0 next (real_2_U (- (U_2_real (MapType1Select Mask@9 node@0 next)) FullPerm)))) (and (=> (= (ControlFlow 0 167) (- 0 170)) (forall ((n_64 T@U) ) (!  (=> (= (type n_64) RefType) (=> (and (and (U_2_bool (MapType2Select new_g@0 n_64)) (not (= n_64 node@0))) (dummyFunction (MapType0Select Heap@1 n_64 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.6982:19|
 :skolemid |789|
 :pattern ( (MapType0Select Heap@1 n_64 next))
 :pattern ( (MapType1Select QPMask@16 n_64 next))
 :pattern ( (MapType0Select Heap@1 n_64 next))
))) (=> (forall ((n_64@@0 T@U) ) (!  (=> (= (type n_64@@0) RefType) (=> (and (and (U_2_bool (MapType2Select new_g@0 n_64@@0)) (not (= n_64@@0 node@0))) (dummyFunction (MapType0Select Heap@1 n_64@@0 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.6982:19|
 :skolemid |789|
 :pattern ( (MapType0Select Heap@1 n_64@@0 next))
 :pattern ( (MapType1Select QPMask@16 n_64@@0 next))
 :pattern ( (MapType0Select Heap@1 n_64@@0 next))
)) (and (=> (= (ControlFlow 0 167) (- 0 169)) (forall ((n_64@@1 T@U) (n_64_1 T@U) ) (!  (=> (and (= (type n_64@@1) RefType) (= (type n_64_1) RefType)) (=> (and (and (and (and (not (= n_64@@1 n_64_1)) (and (U_2_bool (MapType2Select new_g@0 n_64@@1)) (not (= n_64@@1 node@0)))) (and (U_2_bool (MapType2Select new_g@0 n_64_1)) (not (= n_64_1 node@0)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_64@@1 n_64_1))))
 :qid |stdinbpl.6989:19|
 :skolemid |790|
 :pattern ( (neverTriggered80 n_64@@1) (neverTriggered80 n_64_1))
))) (=> (forall ((n_64@@2 T@U) (n_64_1@@0 T@U) ) (!  (=> (and (= (type n_64@@2) RefType) (= (type n_64_1@@0) RefType)) (=> (and (and (and (and (not (= n_64@@2 n_64_1@@0)) (and (U_2_bool (MapType2Select new_g@0 n_64@@2)) (not (= n_64@@2 node@0)))) (and (U_2_bool (MapType2Select new_g@0 n_64_1@@0)) (not (= n_64_1@@0 node@0)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_64@@2 n_64_1@@0))))
 :qid |stdinbpl.6989:19|
 :skolemid |790|
 :pattern ( (neverTriggered80 n_64@@2) (neverTriggered80 n_64_1@@0))
)) (and (=> (= (ControlFlow 0 167) (- 0 168)) (forall ((n_64@@3 T@U) ) (!  (=> (= (type n_64@@3) RefType) (=> (and (U_2_bool (MapType2Select new_g@0 n_64@@3)) (not (= n_64@@3 node@0))) (>= (U_2_real (MapType1Select Mask@10 n_64@@3 next)) (/ (to_real 1) (to_real 2)))))
 :qid |stdinbpl.6996:19|
 :skolemid |791|
 :pattern ( (MapType0Select Heap@1 n_64@@3 next))
 :pattern ( (MapType1Select QPMask@16 n_64@@3 next))
 :pattern ( (MapType0Select Heap@1 n_64@@3 next))
))) (=> (forall ((n_64@@4 T@U) ) (!  (=> (= (type n_64@@4) RefType) (=> (and (U_2_bool (MapType2Select new_g@0 n_64@@4)) (not (= n_64@@4 node@0))) (>= (U_2_real (MapType1Select Mask@10 n_64@@4 next)) (/ (to_real 1) (to_real 2)))))
 :qid |stdinbpl.6996:19|
 :skolemid |791|
 :pattern ( (MapType0Select Heap@1 n_64@@4 next))
 :pattern ( (MapType1Select QPMask@16 n_64@@4 next))
 :pattern ( (MapType0Select Heap@1 n_64@@4 next))
)) (=> (and (and (forall ((n_64@@5 T@U) ) (!  (=> (= (type n_64@@5) RefType) (=> (and (and (U_2_bool (MapType2Select new_g@0 n_64@@5)) (not (= n_64@@5 node@0))) (< NoPerm (/ (to_real 1) (to_real 2)))) (and (qpRange80 n_64@@5) (= (invRecv80 n_64@@5) n_64@@5))))
 :qid |stdinbpl.7002:24|
 :skolemid |792|
 :pattern ( (MapType0Select Heap@1 n_64@@5 next))
 :pattern ( (MapType1Select QPMask@16 n_64@@5 next))
 :pattern ( (MapType0Select Heap@1 n_64@@5 next))
)) (forall ((o_3@@32 T@U) ) (!  (=> (= (type o_3@@32) RefType) (=> (and (and (U_2_bool (MapType2Select new_g@0 (invRecv80 o_3@@32))) (not (= (invRecv80 o_3@@32) node@0))) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange80 o_3@@32))) (= (invRecv80 o_3@@32) o_3@@32)))
 :qid |stdinbpl.7006:24|
 :skolemid |793|
 :pattern ( (invRecv80 o_3@@32))
))) (and (forall ((o_3@@33 T@U) ) (!  (=> (= (type o_3@@33) RefType) (and (=> (and (and (U_2_bool (MapType2Select new_g@0 (invRecv80 o_3@@33))) (not (= (invRecv80 o_3@@33) node@0))) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange80 o_3@@33))) (and (= (invRecv80 o_3@@33) o_3@@33) (= (U_2_real (MapType1Select QPMask@16 o_3@@33 next)) (- (U_2_real (MapType1Select Mask@10 o_3@@33 next)) (/ (to_real 1) (to_real 2)))))) (=> (not (and (and (U_2_bool (MapType2Select new_g@0 (invRecv80 o_3@@33))) (not (= (invRecv80 o_3@@33) node@0))) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange80 o_3@@33)))) (= (U_2_real (MapType1Select QPMask@16 o_3@@33 next)) (U_2_real (MapType1Select Mask@10 o_3@@33 next))))))
 :qid |stdinbpl.7012:24|
 :skolemid |794|
 :pattern ( (MapType1Select QPMask@16 o_3@@33 next))
)) (forall ((o_3@@34 T@U) (f_5@@10 T@U) ) (! (let ((B@@22 (FieldTypeInv1 (type f_5@@10))))
(let ((A@@23 (FieldTypeInv0 (type f_5@@10))))
 (=> (and (and (= (type o_3@@34) RefType) (= (type f_5@@10) (FieldType A@@23 B@@22))) (not (= f_5@@10 next))) (= (U_2_real (MapType1Select Mask@10 o_3@@34 f_5@@10)) (U_2_real (MapType1Select QPMask@16 o_3@@34 f_5@@10))))))
 :qid |stdinbpl.7018:31|
 :skolemid |795|
 :pattern ( (MapType1Select QPMask@16 o_3@@34 f_5@@10))
)))) (and (and (=> (= (ControlFlow 0 167) 162) anon392_Else_correct) (=> (= (ControlFlow 0 167) 89) anon393_Then_correct)) (=> (= (ControlFlow 0 167) 91) anon393_Else_correct))))))))))))
(let ((anon391_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 173) 167)) anon224_correct)))
(let ((anon391_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 171) (- 0 172)) (<= FullPerm (U_2_real (MapType1Select Mask@9 node@0 next)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@9 node@0 next))) (=> (= (ControlFlow 0 171) 167) anon224_correct))))))
(let ((anon222_correct  (=> (state Heap@1 Mask@9) (and (=> (= (ControlFlow 0 174) (- 0 178)) (U_2_bool (MapType2Select new_g@0 node@0))) (=> (U_2_bool (MapType2Select new_g@0 node@0)) (and (=> (= (ControlFlow 0 174) (- 0 177)) (not (= new_node@0 null))) (=> (not (= new_node@0 null)) (and (=> (= (ControlFlow 0 174) (- 0 176)) (not (U_2_bool (MapType2Select new_g@0 null)))) (=> (not (U_2_bool (MapType2Select new_g@0 null))) (and (=> (= (ControlFlow 0 174) (- 0 175)) (U_2_bool (MapType2Select new_g@0 node@0))) (=> (U_2_bool (MapType2Select new_g@0 node@0)) (and (=> (= (ControlFlow 0 174) 171) anon391_Then_correct) (=> (= (ControlFlow 0 174) 173) anon391_Else_correct)))))))))))))
(let ((anon221_correct  (=> (state ExhaleHeap@4 QPMask@15) (=> (and (and (state ExhaleHeap@4 QPMask@15) (= Heap@1 ExhaleHeap@4)) (and (= Mask@9 QPMask@15) (= (ControlFlow 0 184) 174))) anon222_correct))))
(let ((anon390_Else_correct  (=> (and (= (MapType0Select ExhaleHeap@3 node@0 next) null) (= (ControlFlow 0 186) 184)) anon221_correct)))
(let ((anon390_Then_correct  (=> (and (and (not (= (MapType0Select ExhaleHeap@3 node@0 next) null)) (state ExhaleHeap@4 QPMask@15)) (and (forall ((x$0_3 T@U) (y_3_2 T@U) (u_3@@0 T@U) (v_5_2 T@U) ) (!  (=> (and (and (and (and (= (type x$0_3) RefType) (= (type y_3_2) RefType)) (= (type u_3@@0) RefType)) (= (type v_5_2) RefType)) (and (DEP ($$ ExhaleHeap@3 new_g@0) x$0_3 y_3_2 u_3@@0 v_5_2) (not (DEP ($$ ExhaleHeap@3 new_g@0) x$0_3 y_3_2 node@0 (MapType0Select ExhaleHeap@3 node@0 next))))) (DEP ($$ ExhaleHeap@4 new_g@0) x$0_3 y_3_2 u_3@@0 v_5_2))
 :qid |stdinbpl.6947:28|
 :skolemid |788|
 :pattern ( (DEP (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| ExhaleHeap@4 new_g@0))) new_g@0) x$0_3 y_3_2 u_3@@0 v_5_2))
 :pattern ( (DEP (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| ExhaleHeap@3 new_g@0))) new_g@0) x$0_3 y_3_2 u_3@@0 v_5_2))
)) (= (ControlFlow 0 185) 184))) anon221_correct)))
(let ((anon389_Else_correct  (=> (= (MapType0Select ExhaleHeap@3 node@0 next) null) (and (=> (= (ControlFlow 0 188) 185) anon390_Then_correct) (=> (= (ControlFlow 0 188) 186) anon390_Else_correct)))))
(let ((anon389_Then_correct  (=> (not (= (MapType0Select ExhaleHeap@3 node@0 next) null)) (=> (and (state ExhaleHeap@4 QPMask@15) (forall ((v1_4 T@U) (v2_4 T@U) ) (!  (=> (and (= (type v1_4) RefType) (= (type v2_4) RefType)) (= (edge ($$ ExhaleHeap@4 new_g@0) v1_4 v2_4)  (and (edge ($$ ExhaleHeap@3 new_g@0) v1_4 v2_4) (not (and (= v1_4 node@0) (= v2_4 (MapType0Select ExhaleHeap@3 node@0 next)))))))
 :qid |stdinbpl.6940:28|
 :skolemid |787|
 :pattern ( (edge (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| ExhaleHeap@4 new_g@0))) new_g@0) v1_4 v2_4))
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| ExhaleHeap@4 new_g@0))) new_g@0) v1_4 v2_4))
))) (and (=> (= (ControlFlow 0 187) 185) anon390_Then_correct) (=> (= (ControlFlow 0 187) 186) anon390_Else_correct))))))
(let ((anon388_Else_correct  (=> (not (= (MapType0Select ExhaleHeap@3 node@0 next) null)) (and (=> (= (ControlFlow 0 190) 187) anon389_Then_correct) (=> (= (ControlFlow 0 190) 188) anon389_Else_correct)))))
(let ((anon388_Then_correct  (=> (= (MapType0Select ExhaleHeap@3 node@0 next) null) (=> (and (state ExhaleHeap@4 QPMask@15) (|Set#Equal| ($$ ExhaleHeap@4 new_g@0) ($$ ExhaleHeap@3 new_g@0))) (and (=> (= (ControlFlow 0 189) 187) anon389_Then_correct) (=> (= (ControlFlow 0 189) 188) anon389_Else_correct))))))
(let ((anon386_Else_correct  (=> (forall ((n$0_13_1 T@U) ) (!  (=> (= (type n$0_13_1) RefType) (=> (and (U_2_bool (MapType2Select new_g@0 n$0_13_1)) (not (= (MapType0Select ExhaleHeap@3 n$0_13_1 next) null))) (U_2_bool (MapType2Select new_g@0 (MapType0Select ExhaleHeap@3 n$0_13_1 next)))))
 :qid |stdinbpl.6873:26|
 :skolemid |778|
 :pattern ( (MapType2Select new_g@0 (MapType0Select ExhaleHeap@3 n$0_13_1 next)))
 :pattern ( (MapType2Select new_g@0 n$0_13_1) (MapType0Select ExhaleHeap@3 n$0_13_1 next))
)) (=> (and (IdenticalOnKnownLocations ExhaleHeap@3 ExhaleHeap@4 QPMask@14) (not (U_2_bool (MapType2Select new_g@0 null)))) (=> (and (and (U_2_bool (MapType2Select new_g@0 node@0)) (not (= node@0 null))) (and (= Mask@8 (MapType1Store QPMask@14 node@0 next (real_2_U (+ (U_2_real (MapType1Select QPMask@14 node@0 next)) FullPerm)))) (state ExhaleHeap@4 Mask@8))) (and (=> (= (ControlFlow 0 191) (- 0 193)) (forall ((n$1_5 T@U) (n$1_5_1 T@U) ) (!  (=> (and (= (type n$1_5) RefType) (= (type n$1_5_1) RefType)) (=> (and (and (and (and (not (= n$1_5 n$1_5_1)) (and (U_2_bool (MapType2Select new_g@0 n$1_5)) (not (= n$1_5 node@0)))) (and (U_2_bool (MapType2Select new_g@0 n$1_5_1)) (not (= n$1_5_1 node@0)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n$1_5 n$1_5_1))))
 :qid |stdinbpl.6891:21|
 :skolemid |779|
 :no-pattern (type n$1_5)
 :no-pattern (type n$1_5_1)
 :no-pattern (U_2_int n$1_5)
 :no-pattern (U_2_bool n$1_5)
 :no-pattern (U_2_int n$1_5_1)
 :no-pattern (U_2_bool n$1_5_1)
))) (=> (forall ((n$1_5@@0 T@U) (n$1_5_1@@0 T@U) ) (!  (=> (and (= (type n$1_5@@0) RefType) (= (type n$1_5_1@@0) RefType)) (=> (and (and (and (and (not (= n$1_5@@0 n$1_5_1@@0)) (and (U_2_bool (MapType2Select new_g@0 n$1_5@@0)) (not (= n$1_5@@0 node@0)))) (and (U_2_bool (MapType2Select new_g@0 n$1_5_1@@0)) (not (= n$1_5_1@@0 node@0)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n$1_5@@0 n$1_5_1@@0))))
 :qid |stdinbpl.6891:21|
 :skolemid |779|
 :no-pattern (type n$1_5@@0)
 :no-pattern (type n$1_5_1@@0)
 :no-pattern (U_2_int n$1_5@@0)
 :no-pattern (U_2_bool n$1_5@@0)
 :no-pattern (U_2_int n$1_5_1@@0)
 :no-pattern (U_2_bool n$1_5_1@@0)
)) (=> (and (forall ((n$1_5@@1 T@U) ) (!  (=> (= (type n$1_5@@1) RefType) (=> (and (and (U_2_bool (MapType2Select new_g@0 n$1_5@@1)) (not (= n$1_5@@1 node@0))) (< NoPerm (/ (to_real 1) (to_real 2)))) (and (qpRange79 n$1_5@@1) (= (invRecv79 n$1_5@@1) n$1_5@@1))))
 :qid |stdinbpl.6897:28|
 :skolemid |780|
 :pattern ( (MapType0Select ExhaleHeap@4 n$1_5@@1 next))
 :pattern ( (MapType1Select QPMask@15 n$1_5@@1 next))
 :pattern ( (MapType0Select ExhaleHeap@4 n$1_5@@1 next))
)) (forall ((o_3@@35 T@U) ) (!  (=> (= (type o_3@@35) RefType) (=> (and (and (and (U_2_bool (MapType2Select new_g@0 (invRecv79 o_3@@35))) (not (= (invRecv79 o_3@@35) node@0))) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange79 o_3@@35)) (= (invRecv79 o_3@@35) o_3@@35)))
 :qid |stdinbpl.6901:28|
 :skolemid |781|
 :pattern ( (invRecv79 o_3@@35))
))) (and (=> (= (ControlFlow 0 191) (- 0 192)) (forall ((n$1_5@@2 T@U) ) (!  (=> (= (type n$1_5@@2) RefType) (=> (and (U_2_bool (MapType2Select new_g@0 n$1_5@@2)) (not (= n$1_5@@2 node@0))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.6907:21|
 :skolemid |782|
 :pattern ( (MapType0Select ExhaleHeap@4 n$1_5@@2 next))
 :pattern ( (MapType1Select QPMask@15 n$1_5@@2 next))
 :pattern ( (MapType0Select ExhaleHeap@4 n$1_5@@2 next))
))) (=> (forall ((n$1_5@@3 T@U) ) (!  (=> (= (type n$1_5@@3) RefType) (=> (and (U_2_bool (MapType2Select new_g@0 n$1_5@@3)) (not (= n$1_5@@3 node@0))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.6907:21|
 :skolemid |782|
 :pattern ( (MapType0Select ExhaleHeap@4 n$1_5@@3 next))
 :pattern ( (MapType1Select QPMask@15 n$1_5@@3 next))
 :pattern ( (MapType0Select ExhaleHeap@4 n$1_5@@3 next))
)) (=> (and (forall ((n$1_5@@4 T@U) ) (!  (=> (= (type n$1_5@@4) RefType) (=> (and (and (U_2_bool (MapType2Select new_g@0 n$1_5@@4)) (not (= n$1_5@@4 node@0))) (> (/ (to_real 1) (to_real 2)) NoPerm)) (not (= n$1_5@@4 null))))
 :qid |stdinbpl.6913:28|
 :skolemid |783|
 :pattern ( (MapType0Select ExhaleHeap@4 n$1_5@@4 next))
 :pattern ( (MapType1Select QPMask@15 n$1_5@@4 next))
 :pattern ( (MapType0Select ExhaleHeap@4 n$1_5@@4 next))
)) (forall ((o_3@@36 T@U) ) (!  (=> (= (type o_3@@36) RefType) (and (=> (and (and (and (U_2_bool (MapType2Select new_g@0 (invRecv79 o_3@@36))) (not (= (invRecv79 o_3@@36) node@0))) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange79 o_3@@36)) (and (=> (< NoPerm (/ (to_real 1) (to_real 2))) (= (invRecv79 o_3@@36) o_3@@36)) (= (U_2_real (MapType1Select QPMask@15 o_3@@36 next)) (+ (U_2_real (MapType1Select Mask@8 o_3@@36 next)) (/ (to_real 1) (to_real 2)))))) (=> (not (and (and (and (U_2_bool (MapType2Select new_g@0 (invRecv79 o_3@@36))) (not (= (invRecv79 o_3@@36) node@0))) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange79 o_3@@36))) (= (U_2_real (MapType1Select QPMask@15 o_3@@36 next)) (U_2_real (MapType1Select Mask@8 o_3@@36 next))))))
 :qid |stdinbpl.6919:28|
 :skolemid |784|
 :pattern ( (MapType1Select QPMask@15 o_3@@36 next))
))) (=> (and (and (forall ((o_3@@37 T@U) (f_5@@11 T@U) ) (! (let ((B@@23 (FieldTypeInv1 (type f_5@@11))))
(let ((A@@24 (FieldTypeInv0 (type f_5@@11))))
 (=> (and (and (= (type o_3@@37) RefType) (= (type f_5@@11) (FieldType A@@24 B@@23))) (not (= f_5@@11 next))) (= (U_2_real (MapType1Select Mask@8 o_3@@37 f_5@@11)) (U_2_real (MapType1Select QPMask@15 o_3@@37 f_5@@11))))))
 :qid |stdinbpl.6923:35|
 :skolemid |785|
 :pattern ( (MapType1Select Mask@8 o_3@@37 f_5@@11))
 :pattern ( (MapType1Select QPMask@15 o_3@@37 f_5@@11))
)) (state ExhaleHeap@4 QPMask@15)) (and (forall ((n$2_6 T@U) ) (!  (=> (= (type n$2_6) RefType) (=> (and (U_2_bool (MapType2Select new_g@0 n$2_6)) (not (= (MapType0Select ExhaleHeap@4 n$2_6 next) null))) (U_2_bool (MapType2Select new_g@0 (MapType0Select ExhaleHeap@4 n$2_6 next)))))
 :qid |stdinbpl.6929:26|
 :skolemid |786|
 :pattern ( (MapType2Select new_g@0 (MapType0Select ExhaleHeap@4 n$2_6 next)))
 :pattern ( (MapType2Select new_g@0 n$2_6) (MapType0Select ExhaleHeap@4 n$2_6 next))
)) (= (MapType0Select ExhaleHeap@4 node@0 next) null))) (and (=> (= (ControlFlow 0 191) 189) anon388_Then_correct) (=> (= (ControlFlow 0 191) 190) anon388_Else_correct))))))))))))))
(let ((anon211_correct  (=> (= Mask@7 (MapType1Store QPMask@13 node@0 next (real_2_U (- (U_2_real (MapType1Select QPMask@13 node@0 next)) FullPerm)))) (and (=> (= (ControlFlow 0 194) (- 0 197)) (forall ((n_63 T@U) ) (!  (=> (= (type n_63) RefType) (=> (and (and (U_2_bool (MapType2Select new_g@0 n_63)) (not (= n_63 node@0))) (dummyFunction (MapType0Select ExhaleHeap@3 n_63 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.6825:23|
 :skolemid |771|
 :pattern ( (MapType0Select ExhaleHeap@3 n_63 next))
 :pattern ( (MapType1Select QPMask@14 n_63 next))
 :pattern ( (MapType0Select ExhaleHeap@3 n_63 next))
))) (=> (forall ((n_63@@0 T@U) ) (!  (=> (= (type n_63@@0) RefType) (=> (and (and (U_2_bool (MapType2Select new_g@0 n_63@@0)) (not (= n_63@@0 node@0))) (dummyFunction (MapType0Select ExhaleHeap@3 n_63@@0 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.6825:23|
 :skolemid |771|
 :pattern ( (MapType0Select ExhaleHeap@3 n_63@@0 next))
 :pattern ( (MapType1Select QPMask@14 n_63@@0 next))
 :pattern ( (MapType0Select ExhaleHeap@3 n_63@@0 next))
)) (and (=> (= (ControlFlow 0 194) (- 0 196)) (forall ((n_63@@1 T@U) (n_63_1 T@U) ) (!  (=> (and (= (type n_63@@1) RefType) (= (type n_63_1) RefType)) (=> (and (and (and (and (not (= n_63@@1 n_63_1)) (and (U_2_bool (MapType2Select new_g@0 n_63@@1)) (not (= n_63@@1 node@0)))) (and (U_2_bool (MapType2Select new_g@0 n_63_1)) (not (= n_63_1 node@0)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_63@@1 n_63_1))))
 :qid |stdinbpl.6832:23|
 :skolemid |772|
 :pattern ( (neverTriggered78 n_63@@1) (neverTriggered78 n_63_1))
))) (=> (forall ((n_63@@2 T@U) (n_63_1@@0 T@U) ) (!  (=> (and (= (type n_63@@2) RefType) (= (type n_63_1@@0) RefType)) (=> (and (and (and (and (not (= n_63@@2 n_63_1@@0)) (and (U_2_bool (MapType2Select new_g@0 n_63@@2)) (not (= n_63@@2 node@0)))) (and (U_2_bool (MapType2Select new_g@0 n_63_1@@0)) (not (= n_63_1@@0 node@0)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_63@@2 n_63_1@@0))))
 :qid |stdinbpl.6832:23|
 :skolemid |772|
 :pattern ( (neverTriggered78 n_63@@2) (neverTriggered78 n_63_1@@0))
)) (and (=> (= (ControlFlow 0 194) (- 0 195)) (forall ((n_63@@3 T@U) ) (!  (=> (= (type n_63@@3) RefType) (=> (and (U_2_bool (MapType2Select new_g@0 n_63@@3)) (not (= n_63@@3 node@0))) (>= (U_2_real (MapType1Select Mask@7 n_63@@3 next)) (/ (to_real 1) (to_real 2)))))
 :qid |stdinbpl.6839:23|
 :skolemid |773|
 :pattern ( (MapType0Select ExhaleHeap@3 n_63@@3 next))
 :pattern ( (MapType1Select QPMask@14 n_63@@3 next))
 :pattern ( (MapType0Select ExhaleHeap@3 n_63@@3 next))
))) (=> (forall ((n_63@@4 T@U) ) (!  (=> (= (type n_63@@4) RefType) (=> (and (U_2_bool (MapType2Select new_g@0 n_63@@4)) (not (= n_63@@4 node@0))) (>= (U_2_real (MapType1Select Mask@7 n_63@@4 next)) (/ (to_real 1) (to_real 2)))))
 :qid |stdinbpl.6839:23|
 :skolemid |773|
 :pattern ( (MapType0Select ExhaleHeap@3 n_63@@4 next))
 :pattern ( (MapType1Select QPMask@14 n_63@@4 next))
 :pattern ( (MapType0Select ExhaleHeap@3 n_63@@4 next))
)) (=> (and (and (forall ((n_63@@5 T@U) ) (!  (=> (= (type n_63@@5) RefType) (=> (and (and (U_2_bool (MapType2Select new_g@0 n_63@@5)) (not (= n_63@@5 node@0))) (< NoPerm (/ (to_real 1) (to_real 2)))) (and (qpRange78 n_63@@5) (= (invRecv78 n_63@@5) n_63@@5))))
 :qid |stdinbpl.6845:28|
 :skolemid |774|
 :pattern ( (MapType0Select ExhaleHeap@3 n_63@@5 next))
 :pattern ( (MapType1Select QPMask@14 n_63@@5 next))
 :pattern ( (MapType0Select ExhaleHeap@3 n_63@@5 next))
)) (forall ((o_3@@38 T@U) ) (!  (=> (= (type o_3@@38) RefType) (=> (and (and (U_2_bool (MapType2Select new_g@0 (invRecv78 o_3@@38))) (not (= (invRecv78 o_3@@38) node@0))) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange78 o_3@@38))) (= (invRecv78 o_3@@38) o_3@@38)))
 :qid |stdinbpl.6849:28|
 :skolemid |775|
 :pattern ( (invRecv78 o_3@@38))
))) (and (forall ((o_3@@39 T@U) ) (!  (=> (= (type o_3@@39) RefType) (and (=> (and (and (U_2_bool (MapType2Select new_g@0 (invRecv78 o_3@@39))) (not (= (invRecv78 o_3@@39) node@0))) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange78 o_3@@39))) (and (= (invRecv78 o_3@@39) o_3@@39) (= (U_2_real (MapType1Select QPMask@14 o_3@@39 next)) (- (U_2_real (MapType1Select Mask@7 o_3@@39 next)) (/ (to_real 1) (to_real 2)))))) (=> (not (and (and (U_2_bool (MapType2Select new_g@0 (invRecv78 o_3@@39))) (not (= (invRecv78 o_3@@39) node@0))) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange78 o_3@@39)))) (= (U_2_real (MapType1Select QPMask@14 o_3@@39 next)) (U_2_real (MapType1Select Mask@7 o_3@@39 next))))))
 :qid |stdinbpl.6855:28|
 :skolemid |776|
 :pattern ( (MapType1Select QPMask@14 o_3@@39 next))
)) (forall ((o_3@@40 T@U) (f_5@@12 T@U) ) (! (let ((B@@24 (FieldTypeInv1 (type f_5@@12))))
(let ((A@@25 (FieldTypeInv0 (type f_5@@12))))
 (=> (and (and (= (type o_3@@40) RefType) (= (type f_5@@12) (FieldType A@@25 B@@24))) (not (= f_5@@12 next))) (= (U_2_real (MapType1Select Mask@7 o_3@@40 f_5@@12)) (U_2_real (MapType1Select QPMask@14 o_3@@40 f_5@@12))))))
 :qid |stdinbpl.6861:35|
 :skolemid |777|
 :pattern ( (MapType1Select QPMask@14 o_3@@40 f_5@@12))
)))) (and (and (=> (= (ControlFlow 0 194) 191) anon386_Else_correct) (=> (= (ControlFlow 0 194) 181) anon387_Then_correct)) (=> (= (ControlFlow 0 194) 183) anon387_Else_correct))))))))))))
(let ((anon385_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 200) 194)) anon211_correct)))
(let ((anon385_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 198) (- 0 199)) (<= FullPerm (U_2_real (MapType1Select QPMask@13 node@0 next)))) (=> (<= FullPerm (U_2_real (MapType1Select QPMask@13 node@0 next))) (=> (= (ControlFlow 0 198) 194) anon211_correct))))))
(let ((anon384_Then_correct  (=> (not (= (MapType0Select ExhaleHeap@3 node@0 next) null)) (and (=> (= (ControlFlow 0 201) (- 0 204)) (U_2_bool (MapType2Select new_g@0 node@0))) (=> (U_2_bool (MapType2Select new_g@0 node@0)) (and (=> (= (ControlFlow 0 201) (- 0 203)) (not (U_2_bool (MapType2Select new_g@0 null)))) (=> (not (U_2_bool (MapType2Select new_g@0 null))) (and (=> (= (ControlFlow 0 201) (- 0 202)) (U_2_bool (MapType2Select new_g@0 node@0))) (=> (U_2_bool (MapType2Select new_g@0 node@0)) (and (=> (= (ControlFlow 0 201) 198) anon385_Then_correct) (=> (= (ControlFlow 0 201) 200) anon385_Else_correct)))))))))))
(let ((anon384_Else_correct  (=> (and (and (= (MapType0Select ExhaleHeap@3 node@0 next) null) (= Heap@1 ExhaleHeap@3)) (and (= Mask@9 QPMask@13) (= (ControlFlow 0 179) 174))) anon222_correct)))
(let ((anon208_correct  (=> (and (state ExhaleHeap@3 QPMask@13) (forall ((n_59 T@U) ) (!  (=> (= (type n_59) RefType) (=> (and (U_2_bool (MapType2Select new_g@0 n_59)) (not (= n_59 new_node@0))) (__learn_trigger__ (DEP ($$ ExhaleHeap@3 new_g@0) new_node@0 n_59 new_node@0 (MapType0Select ExhaleHeap@3 new_node@0 next)))))
 :qid |stdinbpl.6773:22|
 :skolemid |767|
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| ExhaleHeap@3 new_g@0))) new_g@0) arg_to@0 n_59))
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| ExhaleHeap@3 new_g@0))) new_g@0) new_node@0 n_59))
))) (=> (and (and (and (state ExhaleHeap@3 QPMask@13) (forall ((n_60 T@U) ) (!  (=> (= (type n_60) RefType) (=> (and (U_2_bool (MapType2Select new_g@0 n_60)) (not (= n_60 arg_to@0))) (__learn_trigger__ (DEP ($$ ExhaleHeap@3 new_g@0) arg_to@0 n_60 arg_to@0 (MapType0Select ExhaleHeap@3 arg_to@0 next)))))
 :qid |stdinbpl.6778:22|
 :skolemid |768|
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| ExhaleHeap@3 new_g@0))) new_g@0) arg_to@0 n_60))
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| ExhaleHeap@3 new_g@0))) new_g@0) new_node@0 n_60))
))) (and (state ExhaleHeap@3 QPMask@13) (forall ((n_61 T@U) ) (!  (=> (= (type n_61) RefType) (=> (and (U_2_bool (MapType2Select new_g@0 n_61)) (not (= n_61 new_node@0))) (__learn_trigger__ (DEP ($$ ExhaleHeap@3 new_g@0) n_61 new_node@0 n_61 (MapType0Select ExhaleHeap@3 n_61 next)))))
 :qid |stdinbpl.6783:22|
 :skolemid |769|
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| ExhaleHeap@3 new_g@0))) new_g@0) n_61 arg_to@0))
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| ExhaleHeap@3 new_g@0))) new_g@0) n_61 new_node@0))
)))) (and (and (state ExhaleHeap@3 QPMask@13) (forall ((n_62 T@U) ) (!  (=> (and (= (type n_62) RefType) (U_2_bool (MapType2Select new_g@0 n_62))) (and (__learn_trigger__ (exists_path ($$ ExhaleHeap@3 new_g@0) arg_to@0 n_62)) (__learn_trigger__ (exists_path ($$ Heap@0 new_g@0) arg_to@0 n_62))))
 :qid |stdinbpl.6788:22|
 :skolemid |770|
 :pattern ( (DEP (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| ExhaleHeap@3 new_g@0))) new_g@0) arg_to@0 n_62 arg_to@0 (MapType0Select ExhaleHeap@3 arg_to@0 next)))
 :pattern ( (DEP (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| ExhaleHeap@3 new_g@0))) new_g@0) new_node@0 n_62 new_node@0 (MapType0Select ExhaleHeap@3 new_node@0 next)))
))) (and (state ExhaleHeap@3 QPMask@13) (state ExhaleHeap@3 QPMask@13)))) (and (=> (= (ControlFlow 0 205) (- 0 206)) (HasDirectPerm QPMask@13 node@0 next)) (=> (HasDirectPerm QPMask@13 node@0 next) (and (=> (= (ControlFlow 0 205) 201) anon384_Then_correct) (=> (= (ControlFlow 0 205) 179) anon384_Else_correct))))))))
(let ((anon383_Else_correct  (=> (and (= arg_to@0 null) (= (ControlFlow 0 208) 205)) anon208_correct)))
(let ((anon383_Then_correct  (=> (and (and (not (= arg_to@0 null)) (state ExhaleHeap@3 QPMask@13)) (and (forall ((x$0_2 T@U) (y_2_1 T@U) (u_2_1@@0 T@U) (v_4@@0 T@U) ) (!  (=> (and (and (and (and (= (type x$0_2) RefType) (= (type y_2_1) RefType)) (= (type u_2_1@@0) RefType)) (= (type v_4@@0) RefType)) (and (DEP ($$ ExhaleHeap@3 new_g@0) x$0_2 y_2_1 u_2_1@@0 v_4@@0) (not (DEP ($$ ExhaleHeap@3 new_g@0) x$0_2 y_2_1 new_node@0 arg_to@0)))) (DEP ($$ Heap@0 new_g@0) x$0_2 y_2_1 u_2_1@@0 v_4@@0))
 :qid |stdinbpl.6767:24|
 :skolemid |766|
 :pattern ( (DEP (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| ExhaleHeap@3 new_g@0))) new_g@0) x$0_2 y_2_1 u_2_1@@0 v_4@@0))
 :pattern ( (DEP (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| Heap@0 new_g@0))) new_g@0) x$0_2 y_2_1 u_2_1@@0 v_4@@0))
)) (= (ControlFlow 0 207) 205))) anon208_correct)))
(let ((anon382_Else_correct  (=> (= arg_to@0 null) (and (=> (= (ControlFlow 0 210) 207) anon383_Then_correct) (=> (= (ControlFlow 0 210) 208) anon383_Else_correct)))))
(let ((anon382_Then_correct  (=> (not (= arg_to@0 null)) (=> (and (state ExhaleHeap@3 QPMask@13) (forall ((x$0_1 T@U) (y_1_1 T@U) (u_1_1@@1 T@U) (v_3_1@@0 T@U) ) (!  (=> (and (and (and (and (and (= (type x$0_1) RefType) (= (type y_1_1) RefType)) (= (type u_1_1@@1) RefType)) (= (type v_3_1@@0) RefType)) (and (not (= new_node@0 arg_to@0)) (and (not (= u_1_1@@1 v_3_1@@0)) (not (= x$0_1 y_1_1))))) (or (DEP ($$ Heap@0 new_g@0) x$0_1 y_1_1 u_1_1@@1 v_3_1@@0) (or (and (= x$0_1 new_node@0) (and (= u_1_1@@1 new_node@0) (and (= y_1_1 arg_to@0) (= v_3_1@@0 arg_to@0)))) (or (exists ((w_1@@1 T@U) (z@@0 T@U) ) (!  (and (and (= (type w_1@@1) RefType) (= (type z@@0) RefType)) (and (forall ((u_ T@U) (v_ T@U) ) (!  (=> (and (= (type u_) RefType) (= (type v_) RefType)) (not (DEP ($$ Heap@0 new_g@0) x$0_1 y_1_1 u_ v_)))
 :qid |stdinbpl.6746:21|
 :skolemid |759|
 :pattern ( (DEP (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| Heap@0 new_g@0))) new_g@0) x$0_1 y_1_1 u_ v_))
)) (and (or (and (DEP ($$ Heap@0 new_g@0) x$0_1 new_node@0 u_1_1@@1 v_3_1@@0) (not (= x$0_1 new_node@0))) (and (= x$0_1 u_1_1@@1) (and (= u_1_1@@1 new_node@0) (= v_3_1@@0 arg_to@0)))) (or (and (DEP ($$ Heap@0 new_g@0) arg_to@0 y_1_1 w_1@@1 z@@0) (not (= arg_to@0 y_1_1))) (and (= new_node@0 w_1@@1) (and (= arg_to@0 z@@0) (= z@@0 y_1_1)))))))
 :qid |stdinbpl.6744:235|
 :skolemid |760|
 :pattern ( (DEP (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| Heap@0 new_g@0))) new_g@0) arg_to@0 y_1_1 w_1@@1 z@@0))
)) (or (exists ((U_1@@0 T@U) (V_11 T@U) ) (!  (and (and (= (type U_1@@0) RefType) (= (type V_11) RefType)) (and (forall ((u__1 T@U) (v__1 T@U) ) (!  (=> (and (= (type u__1) RefType) (= (type v__1) RefType)) (not (DEP ($$ Heap@0 new_g@0) x$0_1 y_1_1 u__1 v__1)))
 :qid |stdinbpl.6752:21|
 :skolemid |761|
 :pattern ( (DEP (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| Heap@0 new_g@0))) new_g@0) x$0_1 y_1_1 u__1 v__1))
)) (and (or (and (DEP ($$ Heap@0 new_g@0) x$0_1 new_node@0 U_1@@0 V_11) (not (= x$0_1 new_node@0))) (and (= x$0_1 U_1@@0) (and (= U_1@@0 new_node@0) (= V_11 arg_to@0)))) (or (and (DEP ($$ Heap@0 new_g@0) arg_to@0 y_1_1 u_1_1@@1 v_3_1@@0) (not (= arg_to@0 y_1_1))) (and (= new_node@0 u_1_1@@1) (and (= arg_to@0 v_3_1@@0) (= v_3_1@@0 y_1_1)))))))
 :qid |stdinbpl.6750:25|
 :skolemid |762|
 :pattern ( (DEP (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| Heap@0 new_g@0))) new_g@0) x$0_1 new_node@0 U_1@@0 V_11))
)) (and (= u_1_1@@1 new_node@0) (and (= v_3_1@@0 arg_to@0) (exists ((U_1_1 T@U) (V_1 T@U) (w_1_1 T@U) (z_1 T@U) ) (!  (and (and (and (and (= (type U_1_1) RefType) (= (type V_1) RefType)) (= (type w_1_1) RefType)) (= (type z_1) RefType)) (and (forall ((u__2 T@U) (v__2 T@U) ) (!  (=> (and (= (type u__2) RefType) (= (type v__2) RefType)) (not (DEP ($$ Heap@0 new_g@0) x$0_1 y_1_1 u__2 v__2)))
 :qid |stdinbpl.6758:21|
 :skolemid |763|
 :pattern ( (DEP (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| Heap@0 new_g@0))) new_g@0) x$0_1 y_1_1 u__2 v__2))
)) (and (or (and (DEP ($$ Heap@0 new_g@0) x$0_1 new_node@0 U_1_1 V_1) (not (= x$0_1 new_node@0))) (and (= x$0_1 U_1_1) (and (= U_1_1 new_node@0) (= V_1 arg_to@0)))) (or (and (DEP ($$ Heap@0 new_g@0) arg_to@0 y_1_1 w_1_1 z_1) (not (= arg_to@0 y_1_1))) (and (= new_node@0 w_1_1) (and (= arg_to@0 z_1) (= z_1 y_1_1)))))))
 :qid |stdinbpl.6756:66|
 :skolemid |764|
 :pattern ( (DEP (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| Heap@0 new_g@0))) new_g@0) x$0_1 new_node@0 U_1_1 V_1) (DEP (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| Heap@0 new_g@0))) new_g@0) arg_to@0 y_1_1 w_1_1 z_1))
))))))))) (DEP ($$ ExhaleHeap@3 new_g@0) x$0_1 y_1_1 u_1_1@@1 v_3_1@@0))
 :qid |stdinbpl.6742:24|
 :skolemid |765|
 :pattern ( (DEP (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| ExhaleHeap@3 new_g@0))) new_g@0) x$0_1 y_1_1 u_1_1@@1 v_3_1@@0))
 :pattern ( (DEP (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| Heap@0 new_g@0))) new_g@0) x$0_1 y_1_1 u_1_1@@1 v_3_1@@0))
))) (and (=> (= (ControlFlow 0 209) 207) anon383_Then_correct) (=> (= (ControlFlow 0 209) 208) anon383_Else_correct))))))
(let ((anon381_Else_correct  (=> (= arg_to@0 null) (and (=> (= (ControlFlow 0 212) 209) anon382_Then_correct) (=> (= (ControlFlow 0 212) 210) anon382_Else_correct)))))
(let ((anon381_Then_correct  (=> (not (= arg_to@0 null)) (=> (and (state ExhaleHeap@3 QPMask@13) (forall ((v1_3_2 T@U) (v2_3_2 T@U) ) (!  (=> (and (= (type v1_3_2) RefType) (= (type v2_3_2) RefType)) (= (edge ($$ ExhaleHeap@3 new_g@0) v1_3_2 v2_3_2)  (or (edge ($$ Heap@0 new_g@0) v1_3_2 v2_3_2) (and (= v1_3_2 new_node@0) (= v2_3_2 arg_to@0)))))
 :qid |stdinbpl.6735:24|
 :skolemid |758|
 :pattern ( (edge (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| ExhaleHeap@3 new_g@0))) new_g@0) v1_3_2 v2_3_2))
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| ExhaleHeap@3 new_g@0))) new_g@0) v1_3_2 v2_3_2))
))) (and (=> (= (ControlFlow 0 211) 209) anon382_Then_correct) (=> (= (ControlFlow 0 211) 210) anon382_Else_correct))))))
(let ((anon380_Else_correct  (=> (not (= arg_to@0 null)) (and (=> (= (ControlFlow 0 214) 211) anon381_Then_correct) (=> (= (ControlFlow 0 214) 212) anon381_Else_correct)))))
(let ((anon380_Then_correct  (=> (= arg_to@0 null) (=> (and (state ExhaleHeap@3 QPMask@13) (|Set#Equal| ($$ ExhaleHeap@3 new_g@0) ($$ Heap@0 new_g@0))) (and (=> (= (ControlFlow 0 213) 211) anon381_Then_correct) (=> (= (ControlFlow 0 213) 212) anon381_Else_correct))))))
(let ((anon378_Else_correct  (=> (forall ((n$0_11_1 T@U) ) (!  (=> (= (type n$0_11_1) RefType) (=> (and (U_2_bool (MapType2Select new_g@0 n$0_11_1)) (not (= (MapType0Select Heap@0 n$0_11_1 next) null))) (U_2_bool (MapType2Select new_g@0 (MapType0Select Heap@0 n$0_11_1 next)))))
 :qid |stdinbpl.6664:22|
 :skolemid |749|
 :pattern ( (MapType2Select new_g@0 (MapType0Select Heap@0 n$0_11_1 next)))
 :pattern ( (MapType2Select new_g@0 n$0_11_1) (MapType0Select Heap@0 n$0_11_1 next))
)) (and (=> (= (ControlFlow 0 215) (- 0 219)) (= (MapType0Select Heap@0 new_node@0 next) null)) (=> (= (MapType0Select Heap@0 new_node@0 next) null) (and (=> (= (ControlFlow 0 215) (- 0 218)) (not (exists_path ($$ Heap@0 new_g@0) new_node@0 arg_to@0))) (=> (not (exists_path ($$ Heap@0 new_g@0) new_node@0 arg_to@0)) (=> (and (IdenticalOnKnownLocations Heap@0 ExhaleHeap@3 QPMask@12) (not (U_2_bool (MapType2Select new_g@0 null)))) (=> (and (and (U_2_bool (MapType2Select new_g@0 new_node@0)) (not (= new_node@0 null))) (and (= Mask@6 (MapType1Store QPMask@12 new_node@0 next (real_2_U (+ (U_2_real (MapType1Select QPMask@12 new_node@0 next)) FullPerm)))) (state ExhaleHeap@3 Mask@6))) (and (=> (= (ControlFlow 0 215) (- 0 217)) (forall ((n$1_4 T@U) (n$1_4_1 T@U) ) (!  (=> (and (= (type n$1_4) RefType) (= (type n$1_4_1) RefType)) (=> (and (and (and (and (not (= n$1_4 n$1_4_1)) (and (U_2_bool (MapType2Select new_g@0 n$1_4)) (not (= n$1_4 new_node@0)))) (and (U_2_bool (MapType2Select new_g@0 n$1_4_1)) (not (= n$1_4_1 new_node@0)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n$1_4 n$1_4_1))))
 :qid |stdinbpl.6686:17|
 :skolemid |750|
 :no-pattern (type n$1_4)
 :no-pattern (type n$1_4_1)
 :no-pattern (U_2_int n$1_4)
 :no-pattern (U_2_bool n$1_4)
 :no-pattern (U_2_int n$1_4_1)
 :no-pattern (U_2_bool n$1_4_1)
))) (=> (forall ((n$1_4@@0 T@U) (n$1_4_1@@0 T@U) ) (!  (=> (and (= (type n$1_4@@0) RefType) (= (type n$1_4_1@@0) RefType)) (=> (and (and (and (and (not (= n$1_4@@0 n$1_4_1@@0)) (and (U_2_bool (MapType2Select new_g@0 n$1_4@@0)) (not (= n$1_4@@0 new_node@0)))) (and (U_2_bool (MapType2Select new_g@0 n$1_4_1@@0)) (not (= n$1_4_1@@0 new_node@0)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n$1_4@@0 n$1_4_1@@0))))
 :qid |stdinbpl.6686:17|
 :skolemid |750|
 :no-pattern (type n$1_4@@0)
 :no-pattern (type n$1_4_1@@0)
 :no-pattern (U_2_int n$1_4@@0)
 :no-pattern (U_2_bool n$1_4@@0)
 :no-pattern (U_2_int n$1_4_1@@0)
 :no-pattern (U_2_bool n$1_4_1@@0)
)) (=> (and (forall ((n$1_4@@1 T@U) ) (!  (=> (= (type n$1_4@@1) RefType) (=> (and (and (U_2_bool (MapType2Select new_g@0 n$1_4@@1)) (not (= n$1_4@@1 new_node@0))) (< NoPerm (/ (to_real 1) (to_real 2)))) (and (qpRange77 n$1_4@@1) (= (invRecv77 n$1_4@@1) n$1_4@@1))))
 :qid |stdinbpl.6692:24|
 :skolemid |751|
 :pattern ( (MapType0Select ExhaleHeap@3 n$1_4@@1 next))
 :pattern ( (MapType1Select QPMask@13 n$1_4@@1 next))
 :pattern ( (MapType0Select ExhaleHeap@3 n$1_4@@1 next))
)) (forall ((o_3@@41 T@U) ) (!  (=> (= (type o_3@@41) RefType) (=> (and (and (and (U_2_bool (MapType2Select new_g@0 (invRecv77 o_3@@41))) (not (= (invRecv77 o_3@@41) new_node@0))) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange77 o_3@@41)) (= (invRecv77 o_3@@41) o_3@@41)))
 :qid |stdinbpl.6696:24|
 :skolemid |752|
 :pattern ( (invRecv77 o_3@@41))
))) (and (=> (= (ControlFlow 0 215) (- 0 216)) (forall ((n$1_4@@2 T@U) ) (!  (=> (= (type n$1_4@@2) RefType) (=> (and (U_2_bool (MapType2Select new_g@0 n$1_4@@2)) (not (= n$1_4@@2 new_node@0))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.6702:17|
 :skolemid |753|
 :pattern ( (MapType0Select ExhaleHeap@3 n$1_4@@2 next))
 :pattern ( (MapType1Select QPMask@13 n$1_4@@2 next))
 :pattern ( (MapType0Select ExhaleHeap@3 n$1_4@@2 next))
))) (=> (forall ((n$1_4@@3 T@U) ) (!  (=> (= (type n$1_4@@3) RefType) (=> (and (U_2_bool (MapType2Select new_g@0 n$1_4@@3)) (not (= n$1_4@@3 new_node@0))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.6702:17|
 :skolemid |753|
 :pattern ( (MapType0Select ExhaleHeap@3 n$1_4@@3 next))
 :pattern ( (MapType1Select QPMask@13 n$1_4@@3 next))
 :pattern ( (MapType0Select ExhaleHeap@3 n$1_4@@3 next))
)) (=> (and (forall ((n$1_4@@4 T@U) ) (!  (=> (= (type n$1_4@@4) RefType) (=> (and (and (U_2_bool (MapType2Select new_g@0 n$1_4@@4)) (not (= n$1_4@@4 new_node@0))) (> (/ (to_real 1) (to_real 2)) NoPerm)) (not (= n$1_4@@4 null))))
 :qid |stdinbpl.6708:24|
 :skolemid |754|
 :pattern ( (MapType0Select ExhaleHeap@3 n$1_4@@4 next))
 :pattern ( (MapType1Select QPMask@13 n$1_4@@4 next))
 :pattern ( (MapType0Select ExhaleHeap@3 n$1_4@@4 next))
)) (forall ((o_3@@42 T@U) ) (!  (=> (= (type o_3@@42) RefType) (and (=> (and (and (and (U_2_bool (MapType2Select new_g@0 (invRecv77 o_3@@42))) (not (= (invRecv77 o_3@@42) new_node@0))) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange77 o_3@@42)) (and (=> (< NoPerm (/ (to_real 1) (to_real 2))) (= (invRecv77 o_3@@42) o_3@@42)) (= (U_2_real (MapType1Select QPMask@13 o_3@@42 next)) (+ (U_2_real (MapType1Select Mask@6 o_3@@42 next)) (/ (to_real 1) (to_real 2)))))) (=> (not (and (and (and (U_2_bool (MapType2Select new_g@0 (invRecv77 o_3@@42))) (not (= (invRecv77 o_3@@42) new_node@0))) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange77 o_3@@42))) (= (U_2_real (MapType1Select QPMask@13 o_3@@42 next)) (U_2_real (MapType1Select Mask@6 o_3@@42 next))))))
 :qid |stdinbpl.6714:24|
 :skolemid |755|
 :pattern ( (MapType1Select QPMask@13 o_3@@42 next))
))) (=> (and (and (forall ((o_3@@43 T@U) (f_5@@13 T@U) ) (! (let ((B@@25 (FieldTypeInv1 (type f_5@@13))))
(let ((A@@26 (FieldTypeInv0 (type f_5@@13))))
 (=> (and (and (= (type o_3@@43) RefType) (= (type f_5@@13) (FieldType A@@26 B@@25))) (not (= f_5@@13 next))) (= (U_2_real (MapType1Select Mask@6 o_3@@43 f_5@@13)) (U_2_real (MapType1Select QPMask@13 o_3@@43 f_5@@13))))))
 :qid |stdinbpl.6718:31|
 :skolemid |756|
 :pattern ( (MapType1Select Mask@6 o_3@@43 f_5@@13))
 :pattern ( (MapType1Select QPMask@13 o_3@@43 f_5@@13))
)) (state ExhaleHeap@3 QPMask@13)) (and (forall ((n$2_5 T@U) ) (!  (=> (= (type n$2_5) RefType) (=> (and (U_2_bool (MapType2Select new_g@0 n$2_5)) (not (= (MapType0Select ExhaleHeap@3 n$2_5 next) null))) (U_2_bool (MapType2Select new_g@0 (MapType0Select ExhaleHeap@3 n$2_5 next)))))
 :qid |stdinbpl.6724:22|
 :skolemid |757|
 :pattern ( (MapType2Select new_g@0 (MapType0Select ExhaleHeap@3 n$2_5 next)))
 :pattern ( (MapType2Select new_g@0 n$2_5) (MapType0Select ExhaleHeap@3 n$2_5 next))
)) (= (MapType0Select ExhaleHeap@3 new_node@0 next) arg_to@0))) (and (=> (= (ControlFlow 0 215) 213) anon380_Then_correct) (=> (= (ControlFlow 0 215) 214) anon380_Else_correct))))))))))))))))))
(let ((anon199_correct true))
(let ((anon379_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select new_g@0 n$0_10)) (not (= (MapType0Select Heap@0 n$0_10 next) null)))) (= (ControlFlow 0 87) 84)) anon199_correct)))
(let ((anon379_Then_correct  (=> (and (U_2_bool (MapType2Select new_g@0 n$0_10)) (not (= (MapType0Select Heap@0 n$0_10 next) null))) (and (=> (= (ControlFlow 0 85) (- 0 86)) (U_2_bool (MapType2Select new_g@0 (MapType0Select Heap@0 n$0_10 next)))) (=> (U_2_bool (MapType2Select new_g@0 (MapType0Select Heap@0 n$0_10 next))) (=> (= (ControlFlow 0 85) 84) anon199_correct))))))
(let ((anon196_correct  (=> (= Mask@5 (MapType1Store Mask@4 new_node@0 next (real_2_U (- (U_2_real (MapType1Select Mask@4 new_node@0 next)) FullPerm)))) (and (=> (= (ControlFlow 0 220) (- 0 223)) (forall ((n_58 T@U) ) (!  (=> (= (type n_58) RefType) (=> (and (and (U_2_bool (MapType2Select new_g@0 n_58)) (not (= n_58 new_node@0))) (dummyFunction (MapType0Select Heap@0 n_58 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.6616:19|
 :skolemid |742|
 :pattern ( (MapType0Select Heap@0 n_58 next))
 :pattern ( (MapType1Select QPMask@12 n_58 next))
 :pattern ( (MapType0Select Heap@0 n_58 next))
))) (=> (forall ((n_58@@0 T@U) ) (!  (=> (= (type n_58@@0) RefType) (=> (and (and (U_2_bool (MapType2Select new_g@0 n_58@@0)) (not (= n_58@@0 new_node@0))) (dummyFunction (MapType0Select Heap@0 n_58@@0 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.6616:19|
 :skolemid |742|
 :pattern ( (MapType0Select Heap@0 n_58@@0 next))
 :pattern ( (MapType1Select QPMask@12 n_58@@0 next))
 :pattern ( (MapType0Select Heap@0 n_58@@0 next))
)) (and (=> (= (ControlFlow 0 220) (- 0 222)) (forall ((n_58@@1 T@U) (n_58_1 T@U) ) (!  (=> (and (= (type n_58@@1) RefType) (= (type n_58_1) RefType)) (=> (and (and (and (and (not (= n_58@@1 n_58_1)) (and (U_2_bool (MapType2Select new_g@0 n_58@@1)) (not (= n_58@@1 new_node@0)))) (and (U_2_bool (MapType2Select new_g@0 n_58_1)) (not (= n_58_1 new_node@0)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_58@@1 n_58_1))))
 :qid |stdinbpl.6623:19|
 :skolemid |743|
 :pattern ( (neverTriggered76 n_58@@1) (neverTriggered76 n_58_1))
))) (=> (forall ((n_58@@2 T@U) (n_58_1@@0 T@U) ) (!  (=> (and (= (type n_58@@2) RefType) (= (type n_58_1@@0) RefType)) (=> (and (and (and (and (not (= n_58@@2 n_58_1@@0)) (and (U_2_bool (MapType2Select new_g@0 n_58@@2)) (not (= n_58@@2 new_node@0)))) (and (U_2_bool (MapType2Select new_g@0 n_58_1@@0)) (not (= n_58_1@@0 new_node@0)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_58@@2 n_58_1@@0))))
 :qid |stdinbpl.6623:19|
 :skolemid |743|
 :pattern ( (neverTriggered76 n_58@@2) (neverTriggered76 n_58_1@@0))
)) (and (=> (= (ControlFlow 0 220) (- 0 221)) (forall ((n_58@@3 T@U) ) (!  (=> (= (type n_58@@3) RefType) (=> (and (U_2_bool (MapType2Select new_g@0 n_58@@3)) (not (= n_58@@3 new_node@0))) (>= (U_2_real (MapType1Select Mask@5 n_58@@3 next)) (/ (to_real 1) (to_real 2)))))
 :qid |stdinbpl.6630:19|
 :skolemid |744|
 :pattern ( (MapType0Select Heap@0 n_58@@3 next))
 :pattern ( (MapType1Select QPMask@12 n_58@@3 next))
 :pattern ( (MapType0Select Heap@0 n_58@@3 next))
))) (=> (forall ((n_58@@4 T@U) ) (!  (=> (= (type n_58@@4) RefType) (=> (and (U_2_bool (MapType2Select new_g@0 n_58@@4)) (not (= n_58@@4 new_node@0))) (>= (U_2_real (MapType1Select Mask@5 n_58@@4 next)) (/ (to_real 1) (to_real 2)))))
 :qid |stdinbpl.6630:19|
 :skolemid |744|
 :pattern ( (MapType0Select Heap@0 n_58@@4 next))
 :pattern ( (MapType1Select QPMask@12 n_58@@4 next))
 :pattern ( (MapType0Select Heap@0 n_58@@4 next))
)) (=> (and (and (forall ((n_58@@5 T@U) ) (!  (=> (= (type n_58@@5) RefType) (=> (and (and (U_2_bool (MapType2Select new_g@0 n_58@@5)) (not (= n_58@@5 new_node@0))) (< NoPerm (/ (to_real 1) (to_real 2)))) (and (qpRange76 n_58@@5) (= (invRecv76 n_58@@5) n_58@@5))))
 :qid |stdinbpl.6636:24|
 :skolemid |745|
 :pattern ( (MapType0Select Heap@0 n_58@@5 next))
 :pattern ( (MapType1Select QPMask@12 n_58@@5 next))
 :pattern ( (MapType0Select Heap@0 n_58@@5 next))
)) (forall ((o_3@@44 T@U) ) (!  (=> (= (type o_3@@44) RefType) (=> (and (and (U_2_bool (MapType2Select new_g@0 (invRecv76 o_3@@44))) (not (= (invRecv76 o_3@@44) new_node@0))) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange76 o_3@@44))) (= (invRecv76 o_3@@44) o_3@@44)))
 :qid |stdinbpl.6640:24|
 :skolemid |746|
 :pattern ( (invRecv76 o_3@@44))
))) (and (forall ((o_3@@45 T@U) ) (!  (=> (= (type o_3@@45) RefType) (and (=> (and (and (U_2_bool (MapType2Select new_g@0 (invRecv76 o_3@@45))) (not (= (invRecv76 o_3@@45) new_node@0))) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange76 o_3@@45))) (and (= (invRecv76 o_3@@45) o_3@@45) (= (U_2_real (MapType1Select QPMask@12 o_3@@45 next)) (- (U_2_real (MapType1Select Mask@5 o_3@@45 next)) (/ (to_real 1) (to_real 2)))))) (=> (not (and (and (U_2_bool (MapType2Select new_g@0 (invRecv76 o_3@@45))) (not (= (invRecv76 o_3@@45) new_node@0))) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange76 o_3@@45)))) (= (U_2_real (MapType1Select QPMask@12 o_3@@45 next)) (U_2_real (MapType1Select Mask@5 o_3@@45 next))))))
 :qid |stdinbpl.6646:24|
 :skolemid |747|
 :pattern ( (MapType1Select QPMask@12 o_3@@45 next))
)) (forall ((o_3@@46 T@U) (f_5@@14 T@U) ) (! (let ((B@@26 (FieldTypeInv1 (type f_5@@14))))
(let ((A@@27 (FieldTypeInv0 (type f_5@@14))))
 (=> (and (and (= (type o_3@@46) RefType) (= (type f_5@@14) (FieldType A@@27 B@@26))) (not (= f_5@@14 next))) (= (U_2_real (MapType1Select Mask@5 o_3@@46 f_5@@14)) (U_2_real (MapType1Select QPMask@12 o_3@@46 f_5@@14))))))
 :qid |stdinbpl.6652:31|
 :skolemid |748|
 :pattern ( (MapType1Select QPMask@12 o_3@@46 f_5@@14))
)))) (and (and (=> (= (ControlFlow 0 220) 215) anon378_Else_correct) (=> (= (ControlFlow 0 220) 85) anon379_Then_correct)) (=> (= (ControlFlow 0 220) 87) anon379_Else_correct))))))))))))
(let ((anon377_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 226) 220)) anon196_correct)))
(let ((anon377_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 224) (- 0 225)) (<= FullPerm (U_2_real (MapType1Select Mask@4 new_node@0 next)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@4 new_node@0 next))) (=> (= (ControlFlow 0 224) 220) anon196_correct))))))
(let ((anon194_correct  (=> (state Heap@0 Mask@4) (and (=> (= (ControlFlow 0 227) (- 0 232)) (HasDirectPerm Mask@4 node@0 next)) (=> (HasDirectPerm Mask@4 node@0 next) (=> (= arg_to@0 (MapType0Select Heap@0 node@0 next)) (and (=> (= (ControlFlow 0 227) (- 0 231)) (U_2_bool (MapType2Select new_g@0 new_node@0))) (=> (U_2_bool (MapType2Select new_g@0 new_node@0)) (and (=> (= (ControlFlow 0 227) (- 0 230)) (not (= arg_to@0 null))) (=> (not (= arg_to@0 null)) (and (=> (= (ControlFlow 0 227) (- 0 229)) (not (U_2_bool (MapType2Select new_g@0 null)))) (=> (not (U_2_bool (MapType2Select new_g@0 null))) (and (=> (= (ControlFlow 0 227) (- 0 228)) (U_2_bool (MapType2Select new_g@0 new_node@0))) (=> (U_2_bool (MapType2Select new_g@0 new_node@0)) (and (=> (= (ControlFlow 0 227) 224) anon377_Then_correct) (=> (= (ControlFlow 0 227) 226) anon377_Else_correct))))))))))))))))
(let ((anon193_correct  (=> (state ExhaleHeap@2 QPMask@11) (=> (and (and (state ExhaleHeap@2 QPMask@11) (= Mask@4 QPMask@11)) (and (= Heap@0 ExhaleHeap@2) (= (ControlFlow 0 238) 227))) anon194_correct))))
(let ((anon376_Else_correct  (=> (and (= (MapType0Select ExhaleHeap@0 new_node@0 next) null) (= (ControlFlow 0 240) 238)) anon193_correct)))
(let ((anon376_Then_correct  (=> (and (and (not (= (MapType0Select ExhaleHeap@0 new_node@0 next) null)) (state ExhaleHeap@2 QPMask@11)) (and (forall ((x$0 T@U) (y@@15 T@U) (u_1@@7 T@U) (v_2_1@@0 T@U) ) (!  (=> (and (and (and (and (= (type x$0) RefType) (= (type y@@15) RefType)) (= (type u_1@@7) RefType)) (= (type v_2_1@@0) RefType)) (and (DEP ($$ ExhaleHeap@0 new_g@0) x$0 y@@15 u_1@@7 v_2_1@@0) (not (DEP ($$ ExhaleHeap@0 new_g@0) x$0 y@@15 new_node@0 (MapType0Select ExhaleHeap@0 new_node@0 next))))) (DEP ($$ ExhaleHeap@2 new_g@0) x$0 y@@15 u_1@@7 v_2_1@@0))
 :qid |stdinbpl.6576:28|
 :skolemid |741|
 :pattern ( (DEP (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| ExhaleHeap@2 new_g@0))) new_g@0) x$0 y@@15 u_1@@7 v_2_1@@0))
 :pattern ( (DEP (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| ExhaleHeap@0 new_g@0))) new_g@0) x$0 y@@15 u_1@@7 v_2_1@@0))
)) (= (ControlFlow 0 239) 238))) anon193_correct)))
(let ((anon375_Else_correct  (=> (= (MapType0Select ExhaleHeap@0 new_node@0 next) null) (and (=> (= (ControlFlow 0 242) 239) anon376_Then_correct) (=> (= (ControlFlow 0 242) 240) anon376_Else_correct)))))
(let ((anon375_Then_correct  (=> (not (= (MapType0Select ExhaleHeap@0 new_node@0 next) null)) (=> (and (state ExhaleHeap@2 QPMask@11) (forall ((v1_2 T@U) (v2_2 T@U) ) (!  (=> (and (= (type v1_2) RefType) (= (type v2_2) RefType)) (= (edge ($$ ExhaleHeap@2 new_g@0) v1_2 v2_2)  (and (edge ($$ ExhaleHeap@0 new_g@0) v1_2 v2_2) (not (and (= v1_2 new_node@0) (= v2_2 (MapType0Select ExhaleHeap@0 new_node@0 next)))))))
 :qid |stdinbpl.6569:28|
 :skolemid |740|
 :pattern ( (edge (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| ExhaleHeap@2 new_g@0))) new_g@0) v1_2 v2_2))
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| ExhaleHeap@2 new_g@0))) new_g@0) v1_2 v2_2))
))) (and (=> (= (ControlFlow 0 241) 239) anon376_Then_correct) (=> (= (ControlFlow 0 241) 240) anon376_Else_correct))))))
(let ((anon374_Else_correct  (=> (not (= (MapType0Select ExhaleHeap@0 new_node@0 next) null)) (and (=> (= (ControlFlow 0 244) 241) anon375_Then_correct) (=> (= (ControlFlow 0 244) 242) anon375_Else_correct)))))
(let ((anon374_Then_correct  (=> (= (MapType0Select ExhaleHeap@0 new_node@0 next) null) (=> (and (state ExhaleHeap@2 QPMask@11) (|Set#Equal| ($$ ExhaleHeap@2 new_g@0) ($$ ExhaleHeap@0 new_g@0))) (and (=> (= (ControlFlow 0 243) 241) anon375_Then_correct) (=> (= (ControlFlow 0 243) 242) anon375_Else_correct))))))
(let ((anon372_Else_correct  (=> (forall ((n$0_9_1 T@U) ) (!  (=> (= (type n$0_9_1) RefType) (=> (and (U_2_bool (MapType2Select new_g@0 n$0_9_1)) (not (= (MapType0Select ExhaleHeap@0 n$0_9_1 next) null))) (U_2_bool (MapType2Select new_g@0 (MapType0Select ExhaleHeap@0 n$0_9_1 next)))))
 :qid |stdinbpl.6502:26|
 :skolemid |731|
 :pattern ( (MapType2Select new_g@0 (MapType0Select ExhaleHeap@0 n$0_9_1 next)))
 :pattern ( (MapType2Select new_g@0 n$0_9_1) (MapType0Select ExhaleHeap@0 n$0_9_1 next))
)) (=> (and (IdenticalOnKnownLocations ExhaleHeap@0 ExhaleHeap@2 QPMask@10) (not (U_2_bool (MapType2Select new_g@0 null)))) (=> (and (and (U_2_bool (MapType2Select new_g@0 new_node@0)) (not (= new_node@0 null))) (and (= Mask@3 (MapType1Store QPMask@10 new_node@0 next (real_2_U (+ (U_2_real (MapType1Select QPMask@10 new_node@0 next)) FullPerm)))) (state ExhaleHeap@2 Mask@3))) (and (=> (= (ControlFlow 0 245) (- 0 247)) (forall ((n$1_3 T@U) (n$1_3_1 T@U) ) (!  (=> (and (= (type n$1_3) RefType) (= (type n$1_3_1) RefType)) (=> (and (and (and (and (not (= n$1_3 n$1_3_1)) (and (U_2_bool (MapType2Select new_g@0 n$1_3)) (not (= n$1_3 new_node@0)))) (and (U_2_bool (MapType2Select new_g@0 n$1_3_1)) (not (= n$1_3_1 new_node@0)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n$1_3 n$1_3_1))))
 :qid |stdinbpl.6520:21|
 :skolemid |732|
 :no-pattern (type n$1_3)
 :no-pattern (type n$1_3_1)
 :no-pattern (U_2_int n$1_3)
 :no-pattern (U_2_bool n$1_3)
 :no-pattern (U_2_int n$1_3_1)
 :no-pattern (U_2_bool n$1_3_1)
))) (=> (forall ((n$1_3@@0 T@U) (n$1_3_1@@0 T@U) ) (!  (=> (and (= (type n$1_3@@0) RefType) (= (type n$1_3_1@@0) RefType)) (=> (and (and (and (and (not (= n$1_3@@0 n$1_3_1@@0)) (and (U_2_bool (MapType2Select new_g@0 n$1_3@@0)) (not (= n$1_3@@0 new_node@0)))) (and (U_2_bool (MapType2Select new_g@0 n$1_3_1@@0)) (not (= n$1_3_1@@0 new_node@0)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n$1_3@@0 n$1_3_1@@0))))
 :qid |stdinbpl.6520:21|
 :skolemid |732|
 :no-pattern (type n$1_3@@0)
 :no-pattern (type n$1_3_1@@0)
 :no-pattern (U_2_int n$1_3@@0)
 :no-pattern (U_2_bool n$1_3@@0)
 :no-pattern (U_2_int n$1_3_1@@0)
 :no-pattern (U_2_bool n$1_3_1@@0)
)) (=> (and (forall ((n$1_3@@1 T@U) ) (!  (=> (= (type n$1_3@@1) RefType) (=> (and (and (U_2_bool (MapType2Select new_g@0 n$1_3@@1)) (not (= n$1_3@@1 new_node@0))) (< NoPerm (/ (to_real 1) (to_real 2)))) (and (qpRange75 n$1_3@@1) (= (invRecv75 n$1_3@@1) n$1_3@@1))))
 :qid |stdinbpl.6526:28|
 :skolemid |733|
 :pattern ( (MapType0Select ExhaleHeap@2 n$1_3@@1 next))
 :pattern ( (MapType1Select QPMask@11 n$1_3@@1 next))
 :pattern ( (MapType0Select ExhaleHeap@2 n$1_3@@1 next))
)) (forall ((o_3@@47 T@U) ) (!  (=> (= (type o_3@@47) RefType) (=> (and (and (and (U_2_bool (MapType2Select new_g@0 (invRecv75 o_3@@47))) (not (= (invRecv75 o_3@@47) new_node@0))) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange75 o_3@@47)) (= (invRecv75 o_3@@47) o_3@@47)))
 :qid |stdinbpl.6530:28|
 :skolemid |734|
 :pattern ( (invRecv75 o_3@@47))
))) (and (=> (= (ControlFlow 0 245) (- 0 246)) (forall ((n$1_3@@2 T@U) ) (!  (=> (= (type n$1_3@@2) RefType) (=> (and (U_2_bool (MapType2Select new_g@0 n$1_3@@2)) (not (= n$1_3@@2 new_node@0))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.6536:21|
 :skolemid |735|
 :pattern ( (MapType0Select ExhaleHeap@2 n$1_3@@2 next))
 :pattern ( (MapType1Select QPMask@11 n$1_3@@2 next))
 :pattern ( (MapType0Select ExhaleHeap@2 n$1_3@@2 next))
))) (=> (forall ((n$1_3@@3 T@U) ) (!  (=> (= (type n$1_3@@3) RefType) (=> (and (U_2_bool (MapType2Select new_g@0 n$1_3@@3)) (not (= n$1_3@@3 new_node@0))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.6536:21|
 :skolemid |735|
 :pattern ( (MapType0Select ExhaleHeap@2 n$1_3@@3 next))
 :pattern ( (MapType1Select QPMask@11 n$1_3@@3 next))
 :pattern ( (MapType0Select ExhaleHeap@2 n$1_3@@3 next))
)) (=> (and (forall ((n$1_3@@4 T@U) ) (!  (=> (= (type n$1_3@@4) RefType) (=> (and (and (U_2_bool (MapType2Select new_g@0 n$1_3@@4)) (not (= n$1_3@@4 new_node@0))) (> (/ (to_real 1) (to_real 2)) NoPerm)) (not (= n$1_3@@4 null))))
 :qid |stdinbpl.6542:28|
 :skolemid |736|
 :pattern ( (MapType0Select ExhaleHeap@2 n$1_3@@4 next))
 :pattern ( (MapType1Select QPMask@11 n$1_3@@4 next))
 :pattern ( (MapType0Select ExhaleHeap@2 n$1_3@@4 next))
)) (forall ((o_3@@48 T@U) ) (!  (=> (= (type o_3@@48) RefType) (and (=> (and (and (and (U_2_bool (MapType2Select new_g@0 (invRecv75 o_3@@48))) (not (= (invRecv75 o_3@@48) new_node@0))) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange75 o_3@@48)) (and (=> (< NoPerm (/ (to_real 1) (to_real 2))) (= (invRecv75 o_3@@48) o_3@@48)) (= (U_2_real (MapType1Select QPMask@11 o_3@@48 next)) (+ (U_2_real (MapType1Select Mask@3 o_3@@48 next)) (/ (to_real 1) (to_real 2)))))) (=> (not (and (and (and (U_2_bool (MapType2Select new_g@0 (invRecv75 o_3@@48))) (not (= (invRecv75 o_3@@48) new_node@0))) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange75 o_3@@48))) (= (U_2_real (MapType1Select QPMask@11 o_3@@48 next)) (U_2_real (MapType1Select Mask@3 o_3@@48 next))))))
 :qid |stdinbpl.6548:28|
 :skolemid |737|
 :pattern ( (MapType1Select QPMask@11 o_3@@48 next))
))) (=> (and (and (forall ((o_3@@49 T@U) (f_5@@15 T@U) ) (! (let ((B@@27 (FieldTypeInv1 (type f_5@@15))))
(let ((A@@28 (FieldTypeInv0 (type f_5@@15))))
 (=> (and (and (= (type o_3@@49) RefType) (= (type f_5@@15) (FieldType A@@28 B@@27))) (not (= f_5@@15 next))) (= (U_2_real (MapType1Select Mask@3 o_3@@49 f_5@@15)) (U_2_real (MapType1Select QPMask@11 o_3@@49 f_5@@15))))))
 :qid |stdinbpl.6552:35|
 :skolemid |738|
 :pattern ( (MapType1Select Mask@3 o_3@@49 f_5@@15))
 :pattern ( (MapType1Select QPMask@11 o_3@@49 f_5@@15))
)) (state ExhaleHeap@2 QPMask@11)) (and (forall ((n$2_4_1 T@U) ) (!  (=> (= (type n$2_4_1) RefType) (=> (and (U_2_bool (MapType2Select new_g@0 n$2_4_1)) (not (= (MapType0Select ExhaleHeap@2 n$2_4_1 next) null))) (U_2_bool (MapType2Select new_g@0 (MapType0Select ExhaleHeap@2 n$2_4_1 next)))))
 :qid |stdinbpl.6558:26|
 :skolemid |739|
 :pattern ( (MapType2Select new_g@0 (MapType0Select ExhaleHeap@2 n$2_4_1 next)))
 :pattern ( (MapType2Select new_g@0 n$2_4_1) (MapType0Select ExhaleHeap@2 n$2_4_1 next))
)) (= (MapType0Select ExhaleHeap@2 new_node@0 next) null))) (and (=> (= (ControlFlow 0 245) 243) anon374_Then_correct) (=> (= (ControlFlow 0 245) 244) anon374_Else_correct))))))))))))))
(let ((anon183_correct  (=> (= Mask@2 (MapType1Store QPMask@7 new_node@0 next (real_2_U (- (U_2_real (MapType1Select QPMask@7 new_node@0 next)) FullPerm)))) (and (=> (= (ControlFlow 0 248) (- 0 251)) (forall ((n_57 T@U) ) (!  (=> (= (type n_57) RefType) (=> (and (and (U_2_bool (MapType2Select new_g@0 n_57)) (not (= n_57 new_node@0))) (dummyFunction (MapType0Select ExhaleHeap@0 n_57 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.6454:23|
 :skolemid |724|
 :pattern ( (MapType0Select ExhaleHeap@0 n_57 next))
 :pattern ( (MapType1Select QPMask@10 n_57 next))
 :pattern ( (MapType0Select ExhaleHeap@0 n_57 next))
))) (=> (forall ((n_57@@0 T@U) ) (!  (=> (= (type n_57@@0) RefType) (=> (and (and (U_2_bool (MapType2Select new_g@0 n_57@@0)) (not (= n_57@@0 new_node@0))) (dummyFunction (MapType0Select ExhaleHeap@0 n_57@@0 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.6454:23|
 :skolemid |724|
 :pattern ( (MapType0Select ExhaleHeap@0 n_57@@0 next))
 :pattern ( (MapType1Select QPMask@10 n_57@@0 next))
 :pattern ( (MapType0Select ExhaleHeap@0 n_57@@0 next))
)) (and (=> (= (ControlFlow 0 248) (- 0 250)) (forall ((n_57@@1 T@U) (n_57_1 T@U) ) (!  (=> (and (= (type n_57@@1) RefType) (= (type n_57_1) RefType)) (=> (and (and (and (and (not (= n_57@@1 n_57_1)) (and (U_2_bool (MapType2Select new_g@0 n_57@@1)) (not (= n_57@@1 new_node@0)))) (and (U_2_bool (MapType2Select new_g@0 n_57_1)) (not (= n_57_1 new_node@0)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_57@@1 n_57_1))))
 :qid |stdinbpl.6461:23|
 :skolemid |725|
 :pattern ( (neverTriggered74 n_57@@1) (neverTriggered74 n_57_1))
))) (=> (forall ((n_57@@2 T@U) (n_57_1@@0 T@U) ) (!  (=> (and (= (type n_57@@2) RefType) (= (type n_57_1@@0) RefType)) (=> (and (and (and (and (not (= n_57@@2 n_57_1@@0)) (and (U_2_bool (MapType2Select new_g@0 n_57@@2)) (not (= n_57@@2 new_node@0)))) (and (U_2_bool (MapType2Select new_g@0 n_57_1@@0)) (not (= n_57_1@@0 new_node@0)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_57@@2 n_57_1@@0))))
 :qid |stdinbpl.6461:23|
 :skolemid |725|
 :pattern ( (neverTriggered74 n_57@@2) (neverTriggered74 n_57_1@@0))
)) (and (=> (= (ControlFlow 0 248) (- 0 249)) (forall ((n_57@@3 T@U) ) (!  (=> (= (type n_57@@3) RefType) (=> (and (U_2_bool (MapType2Select new_g@0 n_57@@3)) (not (= n_57@@3 new_node@0))) (>= (U_2_real (MapType1Select Mask@2 n_57@@3 next)) (/ (to_real 1) (to_real 2)))))
 :qid |stdinbpl.6468:23|
 :skolemid |726|
 :pattern ( (MapType0Select ExhaleHeap@0 n_57@@3 next))
 :pattern ( (MapType1Select QPMask@10 n_57@@3 next))
 :pattern ( (MapType0Select ExhaleHeap@0 n_57@@3 next))
))) (=> (forall ((n_57@@4 T@U) ) (!  (=> (= (type n_57@@4) RefType) (=> (and (U_2_bool (MapType2Select new_g@0 n_57@@4)) (not (= n_57@@4 new_node@0))) (>= (U_2_real (MapType1Select Mask@2 n_57@@4 next)) (/ (to_real 1) (to_real 2)))))
 :qid |stdinbpl.6468:23|
 :skolemid |726|
 :pattern ( (MapType0Select ExhaleHeap@0 n_57@@4 next))
 :pattern ( (MapType1Select QPMask@10 n_57@@4 next))
 :pattern ( (MapType0Select ExhaleHeap@0 n_57@@4 next))
)) (=> (and (and (forall ((n_57@@5 T@U) ) (!  (=> (= (type n_57@@5) RefType) (=> (and (and (U_2_bool (MapType2Select new_g@0 n_57@@5)) (not (= n_57@@5 new_node@0))) (< NoPerm (/ (to_real 1) (to_real 2)))) (and (qpRange74 n_57@@5) (= (invRecv74 n_57@@5) n_57@@5))))
 :qid |stdinbpl.6474:28|
 :skolemid |727|
 :pattern ( (MapType0Select ExhaleHeap@0 n_57@@5 next))
 :pattern ( (MapType1Select QPMask@10 n_57@@5 next))
 :pattern ( (MapType0Select ExhaleHeap@0 n_57@@5 next))
)) (forall ((o_3@@50 T@U) ) (!  (=> (= (type o_3@@50) RefType) (=> (and (and (U_2_bool (MapType2Select new_g@0 (invRecv74 o_3@@50))) (not (= (invRecv74 o_3@@50) new_node@0))) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange74 o_3@@50))) (= (invRecv74 o_3@@50) o_3@@50)))
 :qid |stdinbpl.6478:28|
 :skolemid |728|
 :pattern ( (invRecv74 o_3@@50))
))) (and (forall ((o_3@@51 T@U) ) (!  (=> (= (type o_3@@51) RefType) (and (=> (and (and (U_2_bool (MapType2Select new_g@0 (invRecv74 o_3@@51))) (not (= (invRecv74 o_3@@51) new_node@0))) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange74 o_3@@51))) (and (= (invRecv74 o_3@@51) o_3@@51) (= (U_2_real (MapType1Select QPMask@10 o_3@@51 next)) (- (U_2_real (MapType1Select Mask@2 o_3@@51 next)) (/ (to_real 1) (to_real 2)))))) (=> (not (and (and (U_2_bool (MapType2Select new_g@0 (invRecv74 o_3@@51))) (not (= (invRecv74 o_3@@51) new_node@0))) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange74 o_3@@51)))) (= (U_2_real (MapType1Select QPMask@10 o_3@@51 next)) (U_2_real (MapType1Select Mask@2 o_3@@51 next))))))
 :qid |stdinbpl.6484:28|
 :skolemid |729|
 :pattern ( (MapType1Select QPMask@10 o_3@@51 next))
)) (forall ((o_3@@52 T@U) (f_5@@16 T@U) ) (! (let ((B@@28 (FieldTypeInv1 (type f_5@@16))))
(let ((A@@29 (FieldTypeInv0 (type f_5@@16))))
 (=> (and (and (= (type o_3@@52) RefType) (= (type f_5@@16) (FieldType A@@29 B@@28))) (not (= f_5@@16 next))) (= (U_2_real (MapType1Select Mask@2 o_3@@52 f_5@@16)) (U_2_real (MapType1Select QPMask@10 o_3@@52 f_5@@16))))))
 :qid |stdinbpl.6490:35|
 :skolemid |730|
 :pattern ( (MapType1Select QPMask@10 o_3@@52 f_5@@16))
)))) (and (and (=> (= (ControlFlow 0 248) 245) anon372_Else_correct) (=> (= (ControlFlow 0 248) 235) anon373_Then_correct)) (=> (= (ControlFlow 0 248) 237) anon373_Else_correct))))))))))))
(let ((anon371_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 254) 248)) anon183_correct)))
(let ((anon371_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 252) (- 0 253)) (<= FullPerm (U_2_real (MapType1Select QPMask@7 new_node@0 next)))) (=> (<= FullPerm (U_2_real (MapType1Select QPMask@7 new_node@0 next))) (=> (= (ControlFlow 0 252) 248) anon183_correct))))))
(let ((anon370_Then_correct  (=> (not (= (MapType0Select ExhaleHeap@0 new_node@0 next) null)) (and (=> (= (ControlFlow 0 255) (- 0 258)) (U_2_bool (MapType2Select new_g@0 new_node@0))) (=> (U_2_bool (MapType2Select new_g@0 new_node@0)) (and (=> (= (ControlFlow 0 255) (- 0 257)) (not (U_2_bool (MapType2Select new_g@0 null)))) (=> (not (U_2_bool (MapType2Select new_g@0 null))) (and (=> (= (ControlFlow 0 255) (- 0 256)) (U_2_bool (MapType2Select new_g@0 new_node@0))) (=> (U_2_bool (MapType2Select new_g@0 new_node@0)) (and (=> (= (ControlFlow 0 255) 252) anon371_Then_correct) (=> (= (ControlFlow 0 255) 254) anon371_Else_correct)))))))))))
(let ((anon370_Else_correct  (=> (and (and (= (MapType0Select ExhaleHeap@0 new_node@0 next) null) (= Mask@4 QPMask@7)) (and (= Heap@0 ExhaleHeap@0) (= (ControlFlow 0 233) 227))) anon194_correct)))
(let ((anon369_Else_correct  (=> (apply_TCFraming ExhaleHeap@0 g (|Set#Singleton| new_node@0)) (=> (and (state ExhaleHeap@0 QPMask@7) (state ExhaleHeap@0 QPMask@7)) (and (=> (= (ControlFlow 0 259) (- 0 260)) (HasDirectPerm QPMask@7 new_node@0 next)) (=> (HasDirectPerm QPMask@7 new_node@0 next) (and (=> (= (ControlFlow 0 259) 255) anon370_Then_correct) (=> (= (ControlFlow 0 259) 233) anon370_Else_correct))))))))
(let ((anon369_Then_correct  (and (=> (= (ControlFlow 0 77) (- 0 83)) (forall ((n_55 T@U) ) (!  (=> (= (type n_55) RefType) (=> (and (U_2_bool (MapType2Select g n_55)) (dummyFunction (MapType0Select ExhaleHeap@0 n_55 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.6325:21|
 :skolemid |710|
 :pattern ( (MapType0Select ExhaleHeap@0 n_55 next))
 :pattern ( (MapType1Select QPMask@8 n_55 next))
 :pattern ( (MapType0Select ExhaleHeap@0 n_55 next))
))) (=> (forall ((n_55@@0 T@U) ) (!  (=> (= (type n_55@@0) RefType) (=> (and (U_2_bool (MapType2Select g n_55@@0)) (dummyFunction (MapType0Select ExhaleHeap@0 n_55@@0 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.6325:21|
 :skolemid |710|
 :pattern ( (MapType0Select ExhaleHeap@0 n_55@@0 next))
 :pattern ( (MapType1Select QPMask@8 n_55@@0 next))
 :pattern ( (MapType0Select ExhaleHeap@0 n_55@@0 next))
)) (and (=> (= (ControlFlow 0 77) (- 0 82)) (forall ((n_55@@1 T@U) (n_55_1 T@U) ) (!  (=> (and (= (type n_55@@1) RefType) (= (type n_55_1) RefType)) (=> (and (and (and (and (not (= n_55@@1 n_55_1)) (U_2_bool (MapType2Select g n_55@@1))) (U_2_bool (MapType2Select g n_55_1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_55@@1 n_55_1))))
 :qid |stdinbpl.6332:21|
 :skolemid |711|
 :pattern ( (neverTriggered72 n_55@@1) (neverTriggered72 n_55_1))
))) (=> (forall ((n_55@@2 T@U) (n_55_1@@0 T@U) ) (!  (=> (and (= (type n_55@@2) RefType) (= (type n_55_1@@0) RefType)) (=> (and (and (and (and (not (= n_55@@2 n_55_1@@0)) (U_2_bool (MapType2Select g n_55@@2))) (U_2_bool (MapType2Select g n_55_1@@0))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_55@@2 n_55_1@@0))))
 :qid |stdinbpl.6332:21|
 :skolemid |711|
 :pattern ( (neverTriggered72 n_55@@2) (neverTriggered72 n_55_1@@0))
)) (and (=> (= (ControlFlow 0 77) (- 0 81)) (forall ((n_55@@3 T@U) ) (!  (=> (and (= (type n_55@@3) RefType) (U_2_bool (MapType2Select g n_55@@3))) (>= (U_2_real (MapType1Select QPMask@7 n_55@@3 next)) (/ (to_real 1) (to_real 2))))
 :qid |stdinbpl.6339:21|
 :skolemid |712|
 :pattern ( (MapType0Select ExhaleHeap@0 n_55@@3 next))
 :pattern ( (MapType1Select QPMask@8 n_55@@3 next))
 :pattern ( (MapType0Select ExhaleHeap@0 n_55@@3 next))
))) (=> (forall ((n_55@@4 T@U) ) (!  (=> (and (= (type n_55@@4) RefType) (U_2_bool (MapType2Select g n_55@@4))) (>= (U_2_real (MapType1Select QPMask@7 n_55@@4 next)) (/ (to_real 1) (to_real 2))))
 :qid |stdinbpl.6339:21|
 :skolemid |712|
 :pattern ( (MapType0Select ExhaleHeap@0 n_55@@4 next))
 :pattern ( (MapType1Select QPMask@8 n_55@@4 next))
 :pattern ( (MapType0Select ExhaleHeap@0 n_55@@4 next))
)) (=> (and (and (forall ((n_55@@5 T@U) ) (!  (=> (= (type n_55@@5) RefType) (=> (and (U_2_bool (MapType2Select g n_55@@5)) (< NoPerm (/ (to_real 1) (to_real 2)))) (and (qpRange72 n_55@@5) (= (invRecv72 n_55@@5) n_55@@5))))
 :qid |stdinbpl.6345:26|
 :skolemid |713|
 :pattern ( (MapType0Select ExhaleHeap@0 n_55@@5 next))
 :pattern ( (MapType1Select QPMask@8 n_55@@5 next))
 :pattern ( (MapType0Select ExhaleHeap@0 n_55@@5 next))
)) (forall ((o_3@@53 T@U) ) (!  (=> (= (type o_3@@53) RefType) (=> (and (U_2_bool (MapType2Select g (invRecv72 o_3@@53))) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange72 o_3@@53))) (= (invRecv72 o_3@@53) o_3@@53)))
 :qid |stdinbpl.6349:26|
 :skolemid |714|
 :pattern ( (invRecv72 o_3@@53))
))) (and (forall ((o_3@@54 T@U) ) (!  (=> (= (type o_3@@54) RefType) (and (=> (and (U_2_bool (MapType2Select g (invRecv72 o_3@@54))) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange72 o_3@@54))) (and (= (invRecv72 o_3@@54) o_3@@54) (= (U_2_real (MapType1Select QPMask@8 o_3@@54 next)) (- (U_2_real (MapType1Select QPMask@7 o_3@@54 next)) (/ (to_real 1) (to_real 2)))))) (=> (not (and (U_2_bool (MapType2Select g (invRecv72 o_3@@54))) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange72 o_3@@54)))) (= (U_2_real (MapType1Select QPMask@8 o_3@@54 next)) (U_2_real (MapType1Select QPMask@7 o_3@@54 next))))))
 :qid |stdinbpl.6355:26|
 :skolemid |715|
 :pattern ( (MapType1Select QPMask@8 o_3@@54 next))
)) (forall ((o_3@@55 T@U) (f_5@@17 T@U) ) (! (let ((B@@29 (FieldTypeInv1 (type f_5@@17))))
(let ((A@@30 (FieldTypeInv0 (type f_5@@17))))
 (=> (and (and (= (type o_3@@55) RefType) (= (type f_5@@17) (FieldType A@@30 B@@29))) (not (= f_5@@17 next))) (= (U_2_real (MapType1Select QPMask@7 o_3@@55 f_5@@17)) (U_2_real (MapType1Select QPMask@8 o_3@@55 f_5@@17))))))
 :qid |stdinbpl.6361:33|
 :skolemid |716|
 :pattern ( (MapType1Select QPMask@8 o_3@@55 f_5@@17))
)))) (and (=> (= (ControlFlow 0 77) (- 0 80)) (forall ((n_56 T@U) ) (!  (=> (= (type n_56) RefType) (=> (and (U_2_bool (MapType2Select (|Set#Singleton| new_node@0) n_56)) (dummyFunction (MapType0Select ExhaleHeap@0 n_56 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.6370:21|
 :skolemid |717|
 :pattern ( (MapType0Select ExhaleHeap@0 n_56 next))
 :pattern ( (MapType1Select QPMask@9 n_56 next))
 :pattern ( (MapType0Select ExhaleHeap@0 n_56 next))
))) (=> (forall ((n_56@@0 T@U) ) (!  (=> (= (type n_56@@0) RefType) (=> (and (U_2_bool (MapType2Select (|Set#Singleton| new_node@0) n_56@@0)) (dummyFunction (MapType0Select ExhaleHeap@0 n_56@@0 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.6370:21|
 :skolemid |717|
 :pattern ( (MapType0Select ExhaleHeap@0 n_56@@0 next))
 :pattern ( (MapType1Select QPMask@9 n_56@@0 next))
 :pattern ( (MapType0Select ExhaleHeap@0 n_56@@0 next))
)) (and (=> (= (ControlFlow 0 77) (- 0 79)) (forall ((n_56@@1 T@U) (n_56_1 T@U) ) (!  (=> (and (= (type n_56@@1) RefType) (= (type n_56_1) RefType)) (=> (and (and (and (and (not (= n_56@@1 n_56_1)) (U_2_bool (MapType2Select (|Set#Singleton| new_node@0) n_56@@1))) (U_2_bool (MapType2Select (|Set#Singleton| new_node@0) n_56_1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_56@@1 n_56_1))))
 :qid |stdinbpl.6377:21|
 :skolemid |718|
 :pattern ( (neverTriggered73 n_56@@1) (neverTriggered73 n_56_1))
))) (=> (forall ((n_56@@2 T@U) (n_56_1@@0 T@U) ) (!  (=> (and (= (type n_56@@2) RefType) (= (type n_56_1@@0) RefType)) (=> (and (and (and (and (not (= n_56@@2 n_56_1@@0)) (U_2_bool (MapType2Select (|Set#Singleton| new_node@0) n_56@@2))) (U_2_bool (MapType2Select (|Set#Singleton| new_node@0) n_56_1@@0))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_56@@2 n_56_1@@0))))
 :qid |stdinbpl.6377:21|
 :skolemid |718|
 :pattern ( (neverTriggered73 n_56@@2) (neverTriggered73 n_56_1@@0))
)) (and (=> (= (ControlFlow 0 77) (- 0 78)) (forall ((n_56@@3 T@U) ) (!  (=> (and (= (type n_56@@3) RefType) (U_2_bool (MapType2Select (|Set#Singleton| new_node@0) n_56@@3))) (>= (U_2_real (MapType1Select QPMask@8 n_56@@3 next)) (/ (to_real 1) (to_real 2))))
 :qid |stdinbpl.6384:21|
 :skolemid |719|
 :pattern ( (MapType0Select ExhaleHeap@0 n_56@@3 next))
 :pattern ( (MapType1Select QPMask@9 n_56@@3 next))
 :pattern ( (MapType0Select ExhaleHeap@0 n_56@@3 next))
))) (=> (forall ((n_56@@4 T@U) ) (!  (=> (and (= (type n_56@@4) RefType) (U_2_bool (MapType2Select (|Set#Singleton| new_node@0) n_56@@4))) (>= (U_2_real (MapType1Select QPMask@8 n_56@@4 next)) (/ (to_real 1) (to_real 2))))
 :qid |stdinbpl.6384:21|
 :skolemid |719|
 :pattern ( (MapType0Select ExhaleHeap@0 n_56@@4 next))
 :pattern ( (MapType1Select QPMask@9 n_56@@4 next))
 :pattern ( (MapType0Select ExhaleHeap@0 n_56@@4 next))
)) (=> (forall ((n_56@@5 T@U) ) (!  (=> (= (type n_56@@5) RefType) (=> (and (U_2_bool (MapType2Select (|Set#Singleton| new_node@0) n_56@@5)) (< NoPerm (/ (to_real 1) (to_real 2)))) (and (qpRange73 n_56@@5) (= (invRecv73 n_56@@5) n_56@@5))))
 :qid |stdinbpl.6390:26|
 :skolemid |720|
 :pattern ( (MapType0Select ExhaleHeap@0 n_56@@5 next))
 :pattern ( (MapType1Select QPMask@9 n_56@@5 next))
 :pattern ( (MapType0Select ExhaleHeap@0 n_56@@5 next))
)) (=> (and (and (forall ((o_3@@56 T@U) ) (!  (=> (= (type o_3@@56) RefType) (=> (and (U_2_bool (MapType2Select (|Set#Singleton| new_node@0) (invRecv73 o_3@@56))) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange73 o_3@@56))) (= (invRecv73 o_3@@56) o_3@@56)))
 :qid |stdinbpl.6394:26|
 :skolemid |721|
 :pattern ( (invRecv73 o_3@@56))
)) (forall ((o_3@@57 T@U) ) (!  (=> (= (type o_3@@57) RefType) (and (=> (and (U_2_bool (MapType2Select (|Set#Singleton| new_node@0) (invRecv73 o_3@@57))) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange73 o_3@@57))) (and (= (invRecv73 o_3@@57) o_3@@57) (= (U_2_real (MapType1Select QPMask@9 o_3@@57 next)) (- (U_2_real (MapType1Select QPMask@8 o_3@@57 next)) (/ (to_real 1) (to_real 2)))))) (=> (not (and (U_2_bool (MapType2Select (|Set#Singleton| new_node@0) (invRecv73 o_3@@57))) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange73 o_3@@57)))) (= (U_2_real (MapType1Select QPMask@9 o_3@@57 next)) (U_2_real (MapType1Select QPMask@8 o_3@@57 next))))))
 :qid |stdinbpl.6400:26|
 :skolemid |722|
 :pattern ( (MapType1Select QPMask@9 o_3@@57 next))
))) (and (forall ((o_3@@58 T@U) (f_5@@18 T@U) ) (! (let ((B@@30 (FieldTypeInv1 (type f_5@@18))))
(let ((A@@31 (FieldTypeInv0 (type f_5@@18))))
 (=> (and (and (= (type o_3@@58) RefType) (= (type f_5@@18) (FieldType A@@31 B@@30))) (not (= f_5@@18 next))) (= (U_2_real (MapType1Select QPMask@8 o_3@@58 f_5@@18)) (U_2_real (MapType1Select QPMask@9 o_3@@58 f_5@@18))))))
 :qid |stdinbpl.6406:33|
 :skolemid |723|
 :pattern ( (MapType1Select QPMask@9 o_3@@58 f_5@@18))
)) (= (ControlFlow 0 77) (- 0 76)))) (|Set#Equal| (|Set#Intersection| (|Set#Singleton| new_node@0) g) (|Set#Empty| RefType)))))))))))))))))))
(let ((anon178_correct  (=> (and (state ExhaleHeap@0 QPMask@7) (state ExhaleHeap@0 QPMask@7)) (and (=> (= (ControlFlow 0 261) 77) anon369_Then_correct) (=> (= (ControlFlow 0 261) 259) anon369_Else_correct)))))
(let ((anon368_Else_correct  (=> (and (and (not (and (= (MapType0Select ExhaleHeap@0 node@0 next) start_1@@1) (< x_1@@8 (U_2_int (MapType0Select ExhaleHeap@0 start_1@@1 val))))) (state ExhaleHeap@0 QPMask@7)) (and (= new_start@0 start_1@@1) (= (ControlFlow 0 263) 261))) anon178_correct)))
(let ((anon368_Then_correct  (=> (and (and (and (= (MapType0Select ExhaleHeap@0 node@0 next) start_1@@1) (< x_1@@8 (U_2_int (MapType0Select ExhaleHeap@0 start_1@@1 val)))) (state ExhaleHeap@0 QPMask@7)) (and (= new_start@0 new_node@0) (= (ControlFlow 0 262) 261))) anon178_correct)))
(let ((anon367_Else_correct  (=> (not (= (MapType0Select ExhaleHeap@0 node@0 next) start_1@@1)) (and (=> (= (ControlFlow 0 266) 262) anon368_Then_correct) (=> (= (ControlFlow 0 266) 263) anon368_Else_correct)))))
(let ((anon367_Then_correct  (=> (= (MapType0Select ExhaleHeap@0 node@0 next) start_1@@1) (and (=> (= (ControlFlow 0 264) (- 0 265)) (HasDirectPerm QPMask@7 start_1@@1 val)) (=> (HasDirectPerm QPMask@7 start_1@@1 val) (and (=> (= (ControlFlow 0 264) 262) anon368_Then_correct) (=> (= (ControlFlow 0 264) 263) anon368_Else_correct)))))))
(let ((anon349_Else_correct  (=> (or (and (<= (U_2_int (MapType0Select ExhaleHeap@0 node@0 val)) x_1@@8) (< x_1@@8 (U_2_int (MapType0Select ExhaleHeap@0 (MapType0Select ExhaleHeap@0 node@0 next) val)))) (and (= (MapType0Select ExhaleHeap@0 node@0 next) start_1@@1) (or (<= (U_2_int (MapType0Select ExhaleHeap@0 node@0 val)) x_1@@8) (< x_1@@8 (U_2_int (MapType0Select ExhaleHeap@0 start_1@@1 val)))))) (=> (and (state ExhaleHeap@0 QPMask@3) (not (U_2_bool (MapType2Select g null)))) (and (=> (= (ControlFlow 0 267) (- 0 270)) (forall ((n$3_5 T@U) (n$3_5_1 T@U) ) (!  (=> (and (= (type n$3_5) RefType) (= (type n$3_5_1) RefType)) (=> (and (and (and (and (not (= n$3_5 n$3_5_1)) (U_2_bool (MapType2Select g n$3_5))) (U_2_bool (MapType2Select g n$3_5_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$3_5 n$3_5_1))))
 :qid |stdinbpl.6196:17|
 :skolemid |692|
 :no-pattern (type n$3_5)
 :no-pattern (type n$3_5_1)
 :no-pattern (U_2_int n$3_5)
 :no-pattern (U_2_bool n$3_5)
 :no-pattern (U_2_int n$3_5_1)
 :no-pattern (U_2_bool n$3_5_1)
))) (=> (forall ((n$3_5@@0 T@U) (n$3_5_1@@0 T@U) ) (!  (=> (and (= (type n$3_5@@0) RefType) (= (type n$3_5_1@@0) RefType)) (=> (and (and (and (and (not (= n$3_5@@0 n$3_5_1@@0)) (U_2_bool (MapType2Select g n$3_5@@0))) (U_2_bool (MapType2Select g n$3_5_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$3_5@@0 n$3_5_1@@0))))
 :qid |stdinbpl.6196:17|
 :skolemid |692|
 :no-pattern (type n$3_5@@0)
 :no-pattern (type n$3_5_1@@0)
 :no-pattern (U_2_int n$3_5@@0)
 :no-pattern (U_2_bool n$3_5@@0)
 :no-pattern (U_2_int n$3_5_1@@0)
 :no-pattern (U_2_bool n$3_5_1@@0)
)) (=> (and (and (forall ((n$3_5@@1 T@U) ) (!  (=> (= (type n$3_5@@1) RefType) (=> (and (U_2_bool (MapType2Select g n$3_5@@1)) (< NoPerm FullPerm)) (and (qpRange70 n$3_5@@1) (= (invRecv70 n$3_5@@1) n$3_5@@1))))
 :qid |stdinbpl.6202:24|
 :skolemid |693|
 :pattern ( (MapType0Select ExhaleHeap@0 n$3_5@@1 next))
 :pattern ( (MapType1Select QPMask@6 n$3_5@@1 next))
 :pattern ( (MapType0Select ExhaleHeap@0 n$3_5@@1 next))
)) (forall ((o_3@@59 T@U) ) (!  (=> (= (type o_3@@59) RefType) (=> (and (and (U_2_bool (MapType2Select g (invRecv70 o_3@@59))) (< NoPerm FullPerm)) (qpRange70 o_3@@59)) (= (invRecv70 o_3@@59) o_3@@59)))
 :qid |stdinbpl.6206:24|
 :skolemid |694|
 :pattern ( (invRecv70 o_3@@59))
))) (and (forall ((n$3_5@@2 T@U) ) (!  (=> (and (= (type n$3_5@@2) RefType) (U_2_bool (MapType2Select g n$3_5@@2))) (not (= n$3_5@@2 null)))
 :qid |stdinbpl.6212:24|
 :skolemid |695|
 :pattern ( (MapType0Select ExhaleHeap@0 n$3_5@@2 next))
 :pattern ( (MapType1Select QPMask@6 n$3_5@@2 next))
 :pattern ( (MapType0Select ExhaleHeap@0 n$3_5@@2 next))
)) (forall ((o_3@@60 T@U) ) (!  (=> (= (type o_3@@60) RefType) (and (=> (and (and (U_2_bool (MapType2Select g (invRecv70 o_3@@60))) (< NoPerm FullPerm)) (qpRange70 o_3@@60)) (and (=> (< NoPerm FullPerm) (= (invRecv70 o_3@@60) o_3@@60)) (= (U_2_real (MapType1Select QPMask@6 o_3@@60 next)) (+ (U_2_real (MapType1Select QPMask@3 o_3@@60 next)) FullPerm)))) (=> (not (and (and (U_2_bool (MapType2Select g (invRecv70 o_3@@60))) (< NoPerm FullPerm)) (qpRange70 o_3@@60))) (= (U_2_real (MapType1Select QPMask@6 o_3@@60 next)) (U_2_real (MapType1Select QPMask@3 o_3@@60 next))))))
 :qid |stdinbpl.6218:24|
 :skolemid |696|
 :pattern ( (MapType1Select QPMask@6 o_3@@60 next))
)))) (=> (and (and (and (forall ((o_3@@61 T@U) (f_5@@19 T@U) ) (! (let ((B@@31 (FieldTypeInv1 (type f_5@@19))))
(let ((A@@32 (FieldTypeInv0 (type f_5@@19))))
 (=> (and (and (= (type o_3@@61) RefType) (= (type f_5@@19) (FieldType A@@32 B@@31))) (not (= f_5@@19 next))) (= (U_2_real (MapType1Select QPMask@3 o_3@@61 f_5@@19)) (U_2_real (MapType1Select QPMask@6 o_3@@61 f_5@@19))))))
 :qid |stdinbpl.6222:31|
 :skolemid |697|
 :pattern ( (MapType1Select QPMask@3 o_3@@61 f_5@@19))
 :pattern ( (MapType1Select QPMask@6 o_3@@61 f_5@@19))
)) (state ExhaleHeap@0 QPMask@6)) (and (forall ((n$4_7 T@U) ) (!  (=> (and (= (type n$4_7) RefType) (U_2_bool (MapType2Select g n$4_7))) (U_2_bool (MapType2Select g (MapType0Select ExhaleHeap@0 n$4_7 next))))
 :qid |stdinbpl.6228:22|
 :skolemid |698|
 :pattern ( (MapType2Select g (MapType0Select ExhaleHeap@0 n$4_7 next)))
 :pattern ( (MapType2Select g n$4_7) (MapType0Select ExhaleHeap@0 n$4_7 next))
)) (forall ((v1$1_7 T@U) (v2$1_7 T@U) (v$3_7 T@U) ) (!  (=> (and (and (and (and (= (type v1$1_7) RefType) (= (type v2$1_7) RefType)) (= (type v$3_7) RefType)) (and (U_2_bool (MapType2Select g v1$1_7)) (and (U_2_bool (MapType2Select g v2$1_7)) (U_2_bool (MapType2Select g v$3_7))))) (and (= (MapType0Select ExhaleHeap@0 v1$1_7 next) v$3_7) (= (MapType0Select ExhaleHeap@0 v2$1_7 next) v$3_7))) (= v1$1_7 v2$1_7))
 :qid |stdinbpl.6232:22|
 :skolemid |699|
 :pattern ( (MapType2Select g v$3_7) (MapType0Select ExhaleHeap@0 v1$1_7 next) (MapType0Select ExhaleHeap@0 v2$1_7 next))
)))) (and (and (forall ((v$4_7 T@U) ) (!  (=> (and (= (type v$4_7) RefType) (U_2_bool (MapType2Select g v$4_7))) (= (= v$4_7 (MapType0Select ExhaleHeap@0 v$4_7 next)) (|Set#Equal| g (|Set#Singleton| v$4_7))))
 :qid |stdinbpl.6236:22|
 :skolemid |700|
 :pattern ( (MapType0Select ExhaleHeap@0 v$4_7 next))
)) (U_2_bool (MapType2Select g node@0))) (and (state ExhaleHeap@0 QPMask@6) (forall ((n_51 T@U) (m_13 T@U) ) (!  (=> (and (and (= (type n_51) RefType) (= (type m_13) RefType)) (and (U_2_bool (MapType2Select g n_51)) (U_2_bool (MapType2Select g m_13)))) (and (exists_path ($$ ExhaleHeap@0 g) n_51 m_13) (exists_path ($$ ExhaleHeap@0 g) m_13 n_51)))
 :qid |stdinbpl.6242:22|
 :skolemid |701|
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| ExhaleHeap@0 g))) g) n_51 m_13))
))))) (and (=> (= (ControlFlow 0 267) (- 0 269)) (forall ((n_52 T@U) (n_52_1 T@U) ) (!  (=> (and (= (type n_52) RefType) (= (type n_52_1) RefType)) (=> (and (and (and (and (not (= n_52 n_52_1)) (U_2_bool (MapType2Select g n_52))) (U_2_bool (MapType2Select g n_52_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_52 n_52_1))))
 :qid |stdinbpl.6248:17|
 :skolemid |702|
 :no-pattern (type n_52)
 :no-pattern (type n_52_1)
 :no-pattern (U_2_int n_52)
 :no-pattern (U_2_bool n_52)
 :no-pattern (U_2_int n_52_1)
 :no-pattern (U_2_bool n_52_1)
))) (=> (forall ((n_52@@0 T@U) (n_52_1@@0 T@U) ) (!  (=> (and (= (type n_52@@0) RefType) (= (type n_52_1@@0) RefType)) (=> (and (and (and (and (not (= n_52@@0 n_52_1@@0)) (U_2_bool (MapType2Select g n_52@@0))) (U_2_bool (MapType2Select g n_52_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_52@@0 n_52_1@@0))))
 :qid |stdinbpl.6248:17|
 :skolemid |702|
 :no-pattern (type n_52@@0)
 :no-pattern (type n_52_1@@0)
 :no-pattern (U_2_int n_52@@0)
 :no-pattern (U_2_bool n_52@@0)
 :no-pattern (U_2_int n_52_1@@0)
 :no-pattern (U_2_bool n_52_1@@0)
)) (=> (and (forall ((n_52@@1 T@U) ) (!  (=> (= (type n_52@@1) RefType) (=> (and (U_2_bool (MapType2Select g n_52@@1)) (< NoPerm FullPerm)) (and (qpRange71 n_52@@1) (= (invRecv71 n_52@@1) n_52@@1))))
 :qid |stdinbpl.6254:24|
 :skolemid |703|
 :pattern ( (MapType0Select ExhaleHeap@0 n_52@@1 val))
 :pattern ( (MapType1Select QPMask@7 n_52@@1 val))
 :pattern ( (MapType0Select ExhaleHeap@0 n_52@@1 val))
)) (forall ((o_3@@62 T@U) ) (!  (=> (= (type o_3@@62) RefType) (=> (and (and (U_2_bool (MapType2Select g (invRecv71 o_3@@62))) (< NoPerm FullPerm)) (qpRange71 o_3@@62)) (= (invRecv71 o_3@@62) o_3@@62)))
 :qid |stdinbpl.6258:24|
 :skolemid |704|
 :pattern ( (invRecv71 o_3@@62))
))) (=> (and (and (and (forall ((n_52@@2 T@U) ) (!  (=> (and (= (type n_52@@2) RefType) (U_2_bool (MapType2Select g n_52@@2))) (not (= n_52@@2 null)))
 :qid |stdinbpl.6264:24|
 :skolemid |705|
 :pattern ( (MapType0Select ExhaleHeap@0 n_52@@2 val))
 :pattern ( (MapType1Select QPMask@7 n_52@@2 val))
 :pattern ( (MapType0Select ExhaleHeap@0 n_52@@2 val))
)) (forall ((o_3@@63 T@U) ) (!  (=> (= (type o_3@@63) RefType) (and (=> (and (and (U_2_bool (MapType2Select g (invRecv71 o_3@@63))) (< NoPerm FullPerm)) (qpRange71 o_3@@63)) (and (=> (< NoPerm FullPerm) (= (invRecv71 o_3@@63) o_3@@63)) (= (U_2_real (MapType1Select QPMask@7 o_3@@63 val)) (+ (U_2_real (MapType1Select QPMask@6 o_3@@63 val)) FullPerm)))) (=> (not (and (and (U_2_bool (MapType2Select g (invRecv71 o_3@@63))) (< NoPerm FullPerm)) (qpRange71 o_3@@63))) (= (U_2_real (MapType1Select QPMask@7 o_3@@63 val)) (U_2_real (MapType1Select QPMask@6 o_3@@63 val))))))
 :qid |stdinbpl.6270:24|
 :skolemid |706|
 :pattern ( (MapType1Select QPMask@7 o_3@@63 val))
))) (and (forall ((o_3@@64 T@U) (f_5@@20 T@U) ) (! (let ((B@@32 (FieldTypeInv1 (type f_5@@20))))
(let ((A@@33 (FieldTypeInv0 (type f_5@@20))))
 (=> (and (and (= (type o_3@@64) RefType) (= (type f_5@@20) (FieldType A@@33 B@@32))) (not (= f_5@@20 val))) (= (U_2_real (MapType1Select QPMask@6 o_3@@64 f_5@@20)) (U_2_real (MapType1Select QPMask@7 o_3@@64 f_5@@20))))))
 :qid |stdinbpl.6274:31|
 :skolemid |707|
 :pattern ( (MapType1Select QPMask@6 o_3@@64 f_5@@20))
 :pattern ( (MapType1Select QPMask@7 o_3@@64 f_5@@20))
)) (state ExhaleHeap@0 QPMask@7))) (and (and (forall ((n_53 T@U) ) (!  (=> (= (type n_53) RefType) (=> (and (U_2_bool (MapType2Select g n_53)) (not (= (MapType0Select ExhaleHeap@0 n_53 next) start_1@@1))) (<= (U_2_int (MapType0Select ExhaleHeap@0 n_53 val)) (U_2_int (MapType0Select ExhaleHeap@0 (MapType0Select ExhaleHeap@0 n_53 next) val)))))
 :qid |stdinbpl.6280:22|
 :skolemid |708|
 :pattern ( (MapType0Select ExhaleHeap@0 (MapType0Select ExhaleHeap@0 n_53 next) val))
)) (forall ((n_54 T@U) ) (!  (=> (= (type n_54) RefType) (=> (and (U_2_bool (MapType2Select g n_54)) (= (MapType0Select ExhaleHeap@0 n_54 next) start_1@@1)) (<= (U_2_int (MapType0Select ExhaleHeap@0 (MapType0Select ExhaleHeap@0 n_54 next) val)) (U_2_int (MapType0Select ExhaleHeap@0 n_54 val)))))
 :qid |stdinbpl.6284:22|
 :skolemid |709|
 :pattern ( (MapType0Select ExhaleHeap@0 (MapType0Select ExhaleHeap@0 n_54 next) val))
))) (and (state ExhaleHeap@0 QPMask@7) (state ExhaleHeap@0 QPMask@7)))) (and (=> (= (ControlFlow 0 267) (- 0 268)) (HasDirectPerm QPMask@7 node@0 next)) (=> (HasDirectPerm QPMask@7 node@0 next) (and (=> (= (ControlFlow 0 267) 264) anon367_Then_correct) (=> (= (ControlFlow 0 267) 266) anon367_Else_correct))))))))))))))))
(let ((anon326_Else_correct  (=> (forall ((n_31_1 T@U) ) (!  (=> (= (type n_31_1) RefType) (=> (and (U_2_bool (MapType2Select g n_31_1)) (= (MapType0Select Heap@@24 n_31_1 next) start_1@@1)) (<= (U_2_int (MapType0Select Heap@@24 (MapType0Select Heap@@24 n_31_1 next) val)) (U_2_int (MapType0Select Heap@@24 n_31_1 val)))))
 :qid |stdinbpl.5568:24|
 :skolemid |623|
 :pattern ( (MapType0Select Heap@@24 (MapType0Select Heap@@24 n_31_1 next) val))
)) (=> (and (IdenticalOnKnownLocations Heap@@24 ExhaleHeap@0 QPMask@3) (U_2_bool (MapType0Select ExhaleHeap@0 node@0 $allocated))) (and (and (=> (= (ControlFlow 0 388) 387) anon328_Then_correct) (=> (= (ControlFlow 0 388) 325) anon349_Then_correct)) (=> (= (ControlFlow 0 388) 267) anon349_Else_correct))))))
(let ((anon100_correct true))
(let ((anon327_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select g n_30_2)) (= (MapType0Select Heap@@24 n_30_2 next) start_1@@1))) (= (ControlFlow 0 75) 72)) anon100_correct)))
(let ((anon327_Then_correct  (=> (and (U_2_bool (MapType2Select g n_30_2)) (= (MapType0Select Heap@@24 n_30_2 next) start_1@@1)) (and (=> (= (ControlFlow 0 73) (- 0 74)) (<= (U_2_int (MapType0Select Heap@@24 (MapType0Select Heap@@24 n_30_2 next) val)) (U_2_int (MapType0Select Heap@@24 n_30_2 val)))) (=> (<= (U_2_int (MapType0Select Heap@@24 (MapType0Select Heap@@24 n_30_2 next) val)) (U_2_int (MapType0Select Heap@@24 n_30_2 val))) (=> (= (ControlFlow 0 73) 72) anon100_correct))))))
(let ((anon324_Else_correct  (=> (forall ((n_29_1 T@U) ) (!  (=> (= (type n_29_1) RefType) (=> (and (U_2_bool (MapType2Select g n_29_1)) (not (= (MapType0Select Heap@@24 n_29_1 next) start_1@@1))) (<= (U_2_int (MapType0Select Heap@@24 n_29_1 val)) (U_2_int (MapType0Select Heap@@24 (MapType0Select Heap@@24 n_29_1 next) val)))))
 :qid |stdinbpl.5557:24|
 :skolemid |622|
 :pattern ( (MapType0Select Heap@@24 (MapType0Select Heap@@24 n_29_1 next) val))
)) (and (and (=> (= (ControlFlow 0 389) 388) anon326_Else_correct) (=> (= (ControlFlow 0 389) 73) anon327_Then_correct)) (=> (= (ControlFlow 0 389) 75) anon327_Else_correct)))))
(let ((anon96_correct true))
(let ((anon325_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select g n_28_1)) (not (= (MapType0Select Heap@@24 n_28_1 next) start_1@@1)))) (= (ControlFlow 0 71) 68)) anon96_correct)))
(let ((anon325_Then_correct  (=> (and (U_2_bool (MapType2Select g n_28_1)) (not (= (MapType0Select Heap@@24 n_28_1 next) start_1@@1))) (and (=> (= (ControlFlow 0 69) (- 0 70)) (<= (U_2_int (MapType0Select Heap@@24 n_28_1 val)) (U_2_int (MapType0Select Heap@@24 (MapType0Select Heap@@24 n_28_1 next) val)))) (=> (<= (U_2_int (MapType0Select Heap@@24 n_28_1 val)) (U_2_int (MapType0Select Heap@@24 (MapType0Select Heap@@24 n_28_1 next) val))) (=> (= (ControlFlow 0 69) 68) anon96_correct))))))
(let ((anon322_Else_correct  (=> (forall ((n_26_1 T@U) (m_7_1 T@U) ) (!  (=> (and (and (= (type n_26_1) RefType) (= (type m_7_1) RefType)) (and (U_2_bool (MapType2Select g n_26_1)) (U_2_bool (MapType2Select g m_7_1)))) (and (exists_path ($$ Heap@@24 g) n_26_1 m_7_1) (exists_path ($$ Heap@@24 g) m_7_1 n_26_1)))
 :qid |stdinbpl.5505:24|
 :skolemid |615|
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| Heap@@24 g))) g) n_26_1 m_7_1))
)) (and (=> (= (ControlFlow 0 390) (- 0 392)) (forall ((n_27 T@U) (n_27_1 T@U) ) (!  (=> (and (= (type n_27) RefType) (= (type n_27_1) RefType)) (=> (and (and (and (and (not (= n_27 n_27_1)) (U_2_bool (MapType2Select g n_27))) (U_2_bool (MapType2Select g n_27_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_27 n_27_1))))
 :qid |stdinbpl.5516:21|
 :skolemid |616|
 :pattern ( (neverTriggered61 n_27) (neverTriggered61 n_27_1))
))) (=> (forall ((n_27@@0 T@U) (n_27_1@@0 T@U) ) (!  (=> (and (= (type n_27@@0) RefType) (= (type n_27_1@@0) RefType)) (=> (and (and (and (and (not (= n_27@@0 n_27_1@@0)) (U_2_bool (MapType2Select g n_27@@0))) (U_2_bool (MapType2Select g n_27_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_27@@0 n_27_1@@0))))
 :qid |stdinbpl.5516:21|
 :skolemid |616|
 :pattern ( (neverTriggered61 n_27@@0) (neverTriggered61 n_27_1@@0))
)) (and (=> (= (ControlFlow 0 390) (- 0 391)) (forall ((n_27@@1 T@U) ) (!  (=> (and (= (type n_27@@1) RefType) (U_2_bool (MapType2Select g n_27@@1))) (>= (U_2_real (MapType1Select QPMask@2 n_27@@1 val)) FullPerm))
 :qid |stdinbpl.5523:21|
 :skolemid |617|
 :pattern ( (MapType0Select Heap@@24 n_27@@1 val))
 :pattern ( (MapType1Select QPMask@3 n_27@@1 val))
 :pattern ( (MapType0Select Heap@@24 n_27@@1 val))
))) (=> (forall ((n_27@@2 T@U) ) (!  (=> (and (= (type n_27@@2) RefType) (U_2_bool (MapType2Select g n_27@@2))) (>= (U_2_real (MapType1Select QPMask@2 n_27@@2 val)) FullPerm))
 :qid |stdinbpl.5523:21|
 :skolemid |617|
 :pattern ( (MapType0Select Heap@@24 n_27@@2 val))
 :pattern ( (MapType1Select QPMask@3 n_27@@2 val))
 :pattern ( (MapType0Select Heap@@24 n_27@@2 val))
)) (=> (and (and (forall ((n_27@@3 T@U) ) (!  (=> (= (type n_27@@3) RefType) (=> (and (U_2_bool (MapType2Select g n_27@@3)) (< NoPerm FullPerm)) (and (qpRange61 n_27@@3) (= (invRecv61 n_27@@3) n_27@@3))))
 :qid |stdinbpl.5529:26|
 :skolemid |618|
 :pattern ( (MapType0Select Heap@@24 n_27@@3 val))
 :pattern ( (MapType1Select QPMask@3 n_27@@3 val))
 :pattern ( (MapType0Select Heap@@24 n_27@@3 val))
)) (forall ((o_3@@65 T@U) ) (!  (=> (= (type o_3@@65) RefType) (=> (and (U_2_bool (MapType2Select g (invRecv61 o_3@@65))) (and (< NoPerm FullPerm) (qpRange61 o_3@@65))) (= (invRecv61 o_3@@65) o_3@@65)))
 :qid |stdinbpl.5533:26|
 :skolemid |619|
 :pattern ( (invRecv61 o_3@@65))
))) (and (forall ((o_3@@66 T@U) ) (!  (=> (= (type o_3@@66) RefType) (and (=> (and (U_2_bool (MapType2Select g (invRecv61 o_3@@66))) (and (< NoPerm FullPerm) (qpRange61 o_3@@66))) (and (= (invRecv61 o_3@@66) o_3@@66) (= (U_2_real (MapType1Select QPMask@3 o_3@@66 val)) (- (U_2_real (MapType1Select QPMask@2 o_3@@66 val)) FullPerm)))) (=> (not (and (U_2_bool (MapType2Select g (invRecv61 o_3@@66))) (and (< NoPerm FullPerm) (qpRange61 o_3@@66)))) (= (U_2_real (MapType1Select QPMask@3 o_3@@66 val)) (U_2_real (MapType1Select QPMask@2 o_3@@66 val))))))
 :qid |stdinbpl.5539:26|
 :skolemid |620|
 :pattern ( (MapType1Select QPMask@3 o_3@@66 val))
)) (forall ((o_3@@67 T@U) (f_5@@21 T@U) ) (! (let ((B@@33 (FieldTypeInv1 (type f_5@@21))))
(let ((A@@34 (FieldTypeInv0 (type f_5@@21))))
 (=> (and (and (= (type o_3@@67) RefType) (= (type f_5@@21) (FieldType A@@34 B@@33))) (not (= f_5@@21 val))) (= (U_2_real (MapType1Select QPMask@2 o_3@@67 f_5@@21)) (U_2_real (MapType1Select QPMask@3 o_3@@67 f_5@@21))))))
 :qid |stdinbpl.5545:33|
 :skolemid |621|
 :pattern ( (MapType1Select QPMask@3 o_3@@67 f_5@@21))
)))) (and (and (=> (= (ControlFlow 0 390) 389) anon324_Else_correct) (=> (= (ControlFlow 0 390) 69) anon325_Then_correct)) (=> (= (ControlFlow 0 390) 71) anon325_Else_correct))))))))))
(let ((anon92_correct true))
(let ((anon323_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select g n_25_1)) (U_2_bool (MapType2Select g m_6)))) (= (ControlFlow 0 67) 63)) anon92_correct)))
(let ((anon323_Then_correct  (=> (and (U_2_bool (MapType2Select g n_25_1)) (U_2_bool (MapType2Select g m_6))) (and (=> (= (ControlFlow 0 64) (- 0 66)) (exists_path ($$ Heap@@24 g) n_25_1 m_6)) (=> (exists_path ($$ Heap@@24 g) n_25_1 m_6) (and (=> (= (ControlFlow 0 64) (- 0 65)) (exists_path ($$ Heap@@24 g) m_6 n_25_1)) (=> (exists_path ($$ Heap@@24 g) m_6 n_25_1) (=> (= (ControlFlow 0 64) 63) anon92_correct))))))))
(let ((anon320_Else_correct  (=> (forall ((v$4_1_1 T@U) ) (!  (=> (and (= (type v$4_1_1) RefType) (U_2_bool (MapType2Select g v$4_1_1))) (= (= v$4_1_1 (MapType0Select Heap@@24 v$4_1_1 next)) (|Set#Equal| g (|Set#Singleton| v$4_1_1))))
 :qid |stdinbpl.5490:24|
 :skolemid |614|
 :pattern ( (MapType0Select Heap@@24 v$4_1_1 next))
)) (and (=> (= (ControlFlow 0 393) (- 0 394)) (U_2_bool (MapType2Select g start_1@@1))) (=> (U_2_bool (MapType2Select g start_1@@1)) (and (and (=> (= (ControlFlow 0 393) 390) anon322_Else_correct) (=> (= (ControlFlow 0 393) 64) anon323_Then_correct)) (=> (= (ControlFlow 0 393) 67) anon323_Else_correct)))))))
(let ((anon88_correct true))
(let ((anon321_Else_correct  (=> (and (not (U_2_bool (MapType2Select g v$4))) (= (ControlFlow 0 62) 59)) anon88_correct)))
(let ((anon321_Then_correct  (=> (U_2_bool (MapType2Select g v$4)) (and (=> (= (ControlFlow 0 60) (- 0 61)) (= (= v$4 (MapType0Select Heap@@24 v$4 next)) (|Set#Equal| g (|Set#Singleton| v$4)))) (=> (= (= v$4 (MapType0Select Heap@@24 v$4 next)) (|Set#Equal| g (|Set#Singleton| v$4))) (=> (= (ControlFlow 0 60) 59) anon88_correct))))))
(let ((anon317_Else_correct  (=> (forall ((v1$1_1_1 T@U) (v2$1_1_1 T@U) (v$3_1_1 T@U) ) (!  (=> (and (and (and (and (= (type v1$1_1_1) RefType) (= (type v2$1_1_1) RefType)) (= (type v$3_1_1) RefType)) (and (U_2_bool (MapType2Select g v1$1_1_1)) (and (U_2_bool (MapType2Select g v2$1_1_1)) (U_2_bool (MapType2Select g v$3_1_1))))) (and (= (MapType0Select Heap@@24 v1$1_1_1 next) v$3_1_1) (= (MapType0Select Heap@@24 v2$1_1_1 next) v$3_1_1))) (= v1$1_1_1 v2$1_1_1))
 :qid |stdinbpl.5479:24|
 :skolemid |613|
 :pattern ( (MapType2Select g v$3_1_1) (MapType0Select Heap@@24 v1$1_1_1 next) (MapType0Select Heap@@24 v2$1_1_1 next))
)) (and (and (=> (= (ControlFlow 0 395) 393) anon320_Else_correct) (=> (= (ControlFlow 0 395) 60) anon321_Then_correct)) (=> (= (ControlFlow 0 395) 62) anon321_Else_correct)))))
(let ((anon84_correct true))
(let ((anon319_Else_correct  (=> (and (not (and (= (MapType0Select Heap@@24 v1$1 next) v$3) (= (MapType0Select Heap@@24 v2$1 next) v$3))) (= (ControlFlow 0 57) 53)) anon84_correct)))
(let ((anon319_Then_correct  (=> (and (= (MapType0Select Heap@@24 v1$1 next) v$3) (= (MapType0Select Heap@@24 v2$1 next) v$3)) (and (=> (= (ControlFlow 0 55) (- 0 56)) (= v1$1 v2$1)) (=> (= v1$1 v2$1) (=> (= (ControlFlow 0 55) 53) anon84_correct))))))
(let ((anon318_Then_correct  (=> (and (U_2_bool (MapType2Select g v1$1)) (and (U_2_bool (MapType2Select g v2$1)) (U_2_bool (MapType2Select g v$3)))) (and (=> (= (ControlFlow 0 58) 55) anon319_Then_correct) (=> (= (ControlFlow 0 58) 57) anon319_Else_correct)))))
(let ((anon318_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select g v1$1)) (and (U_2_bool (MapType2Select g v2$1)) (U_2_bool (MapType2Select g v$3))))) (= (ControlFlow 0 54) 53)) anon84_correct)))
(let ((anon315_Else_correct  (=> (forall ((n$4_1_1 T@U) ) (!  (=> (and (= (type n$4_1_1) RefType) (U_2_bool (MapType2Select g n$4_1_1))) (U_2_bool (MapType2Select g (MapType0Select Heap@@24 n$4_1_1 next))))
 :qid |stdinbpl.5466:24|
 :skolemid |612|
 :pattern ( (MapType2Select g (MapType0Select Heap@@24 n$4_1_1 next)))
 :pattern ( (MapType2Select g n$4_1_1) (MapType0Select Heap@@24 n$4_1_1 next))
)) (and (and (=> (= (ControlFlow 0 396) 395) anon317_Else_correct) (=> (= (ControlFlow 0 396) 58) anon318_Then_correct)) (=> (= (ControlFlow 0 396) 54) anon318_Else_correct)))))
(let ((anon79_correct true))
(let ((anon316_Else_correct  (=> (and (not (U_2_bool (MapType2Select g n$4))) (= (ControlFlow 0 52) 49)) anon79_correct)))
(let ((anon316_Then_correct  (=> (U_2_bool (MapType2Select g n$4)) (and (=> (= (ControlFlow 0 50) (- 0 51)) (U_2_bool (MapType2Select g (MapType0Select Heap@@24 n$4 next)))) (=> (U_2_bool (MapType2Select g (MapType0Select Heap@@24 n$4 next))) (=> (= (ControlFlow 0 50) 49) anon79_correct))))))
(let ((anon294_Else_correct  (=> (U_2_bool (MapType0Select Heap@@24 node $allocated)) (=> (and (not (U_2_bool (MapType2Select g new_node@0))) (|Set#Equal| new_g@0 (|Set#Union| g (|Set#Singleton| new_node@0)))) (=> (and (and (not (= new_node@0 null)) (= Mask@0 (MapType1Store QPMask@1 new_node@0 next (real_2_U (+ (U_2_real (MapType1Select QPMask@1 new_node@0 next)) FullPerm))))) (and (state Heap@@24 Mask@0) (not (= new_node@0 null)))) (=> (and (and (and (= Mask@1 (MapType1Store Mask@0 new_node@0 val (real_2_U (+ (U_2_real (MapType1Select Mask@0 new_node@0 val)) FullPerm)))) (state Heap@@24 Mask@1)) (and (= (MapType0Select Heap@@24 new_node@0 next) null) (= (U_2_int (MapType0Select Heap@@24 new_node@0 val)) x_1@@8))) (and (and (state Heap@@24 Mask@1) (U_2_bool (MapType0Select Heap@@24 new_node@0 $allocated))) (and (state Heap@@24 Mask@1) (state Heap@@24 Mask@1)))) (and (=> (= (ControlFlow 0 397) (- 0 400)) (not (U_2_bool (MapType2Select g null)))) (=> (not (U_2_bool (MapType2Select g null))) (and (=> (= (ControlFlow 0 397) (- 0 399)) (forall ((n$3 T@U) (n$3_1 T@U) ) (!  (=> (and (= (type n$3) RefType) (= (type n$3_1) RefType)) (=> (and (and (and (and (not (= n$3 n$3_1)) (U_2_bool (MapType2Select g n$3))) (U_2_bool (MapType2Select g n$3_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$3 n$3_1))))
 :qid |stdinbpl.5425:21|
 :skolemid |606|
 :pattern ( (neverTriggered60 n$3) (neverTriggered60 n$3_1))
))) (=> (forall ((n$3@@0 T@U) (n$3_1@@0 T@U) ) (!  (=> (and (= (type n$3@@0) RefType) (= (type n$3_1@@0) RefType)) (=> (and (and (and (and (not (= n$3@@0 n$3_1@@0)) (U_2_bool (MapType2Select g n$3@@0))) (U_2_bool (MapType2Select g n$3_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$3@@0 n$3_1@@0))))
 :qid |stdinbpl.5425:21|
 :skolemid |606|
 :pattern ( (neverTriggered60 n$3@@0) (neverTriggered60 n$3_1@@0))
)) (and (=> (= (ControlFlow 0 397) (- 0 398)) (forall ((n$3@@1 T@U) ) (!  (=> (and (= (type n$3@@1) RefType) (U_2_bool (MapType2Select g n$3@@1))) (>= (U_2_real (MapType1Select Mask@1 n$3@@1 next)) FullPerm))
 :qid |stdinbpl.5432:21|
 :skolemid |607|
 :pattern ( (MapType0Select Heap@@24 n$3@@1 next))
 :pattern ( (MapType1Select QPMask@2 n$3@@1 next))
 :pattern ( (MapType0Select Heap@@24 n$3@@1 next))
))) (=> (forall ((n$3@@2 T@U) ) (!  (=> (and (= (type n$3@@2) RefType) (U_2_bool (MapType2Select g n$3@@2))) (>= (U_2_real (MapType1Select Mask@1 n$3@@2 next)) FullPerm))
 :qid |stdinbpl.5432:21|
 :skolemid |607|
 :pattern ( (MapType0Select Heap@@24 n$3@@2 next))
 :pattern ( (MapType1Select QPMask@2 n$3@@2 next))
 :pattern ( (MapType0Select Heap@@24 n$3@@2 next))
)) (=> (and (and (forall ((n$3@@3 T@U) ) (!  (=> (= (type n$3@@3) RefType) (=> (and (U_2_bool (MapType2Select g n$3@@3)) (< NoPerm FullPerm)) (and (qpRange60 n$3@@3) (= (invRecv60 n$3@@3) n$3@@3))))
 :qid |stdinbpl.5438:26|
 :skolemid |608|
 :pattern ( (MapType0Select Heap@@24 n$3@@3 next))
 :pattern ( (MapType1Select QPMask@2 n$3@@3 next))
 :pattern ( (MapType0Select Heap@@24 n$3@@3 next))
)) (forall ((o_3@@68 T@U) ) (!  (=> (= (type o_3@@68) RefType) (=> (and (U_2_bool (MapType2Select g (invRecv60 o_3@@68))) (and (< NoPerm FullPerm) (qpRange60 o_3@@68))) (= (invRecv60 o_3@@68) o_3@@68)))
 :qid |stdinbpl.5442:26|
 :skolemid |609|
 :pattern ( (invRecv60 o_3@@68))
))) (and (forall ((o_3@@69 T@U) ) (!  (=> (= (type o_3@@69) RefType) (and (=> (and (U_2_bool (MapType2Select g (invRecv60 o_3@@69))) (and (< NoPerm FullPerm) (qpRange60 o_3@@69))) (and (= (invRecv60 o_3@@69) o_3@@69) (= (U_2_real (MapType1Select QPMask@2 o_3@@69 next)) (- (U_2_real (MapType1Select Mask@1 o_3@@69 next)) FullPerm)))) (=> (not (and (U_2_bool (MapType2Select g (invRecv60 o_3@@69))) (and (< NoPerm FullPerm) (qpRange60 o_3@@69)))) (= (U_2_real (MapType1Select QPMask@2 o_3@@69 next)) (U_2_real (MapType1Select Mask@1 o_3@@69 next))))))
 :qid |stdinbpl.5448:26|
 :skolemid |610|
 :pattern ( (MapType1Select QPMask@2 o_3@@69 next))
)) (forall ((o_3@@70 T@U) (f_5@@22 T@U) ) (! (let ((B@@34 (FieldTypeInv1 (type f_5@@22))))
(let ((A@@35 (FieldTypeInv0 (type f_5@@22))))
 (=> (and (and (= (type o_3@@70) RefType) (= (type f_5@@22) (FieldType A@@35 B@@34))) (not (= f_5@@22 next))) (= (U_2_real (MapType1Select Mask@1 o_3@@70 f_5@@22)) (U_2_real (MapType1Select QPMask@2 o_3@@70 f_5@@22))))))
 :qid |stdinbpl.5454:33|
 :skolemid |611|
 :pattern ( (MapType1Select QPMask@2 o_3@@70 f_5@@22))
)))) (and (and (=> (= (ControlFlow 0 397) 396) anon315_Else_correct) (=> (= (ControlFlow 0 397) 50) anon316_Then_correct)) (=> (= (ControlFlow 0 397) 52) anon316_Else_correct)))))))))))))))
(let ((anon291_Else_correct  (=> (and (forall ((n_9 T@U) ) (!  (=> (= (type n_9) RefType) (=> (and (U_2_bool (MapType2Select g n_9)) (= (MapType0Select Heap@@24 n_9 next) start_1@@1)) (<= (U_2_int (MapType0Select Heap@@24 (MapType0Select Heap@@24 n_9 next) val)) (U_2_int (MapType0Select Heap@@24 n_9 val)))))
 :qid |stdinbpl.5051:20|
 :skolemid |573|
 :pattern ( (MapType0Select Heap@@24 (MapType0Select Heap@@24 n_9 next) val))
)) (state Heap@@24 QPMask@1)) (and (=> (= (ControlFlow 0 461) 460) anon294_Then_correct) (=> (= (ControlFlow 0 461) 397) anon294_Else_correct)))))
(let ((anon36_correct true))
(let ((anon293_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select g n_34)) (= (MapType0Select Heap@@24 n_34 next) start_1@@1))) (= (ControlFlow 0 45) 40)) anon36_correct)))
(let ((anon293_Then_correct  (=> (and (U_2_bool (MapType2Select g n_34)) (= (MapType0Select Heap@@24 n_34 next) start_1@@1)) (and (=> (= (ControlFlow 0 41) (- 0 44)) (HasDirectPerm QPMask@1 n_34 next)) (=> (HasDirectPerm QPMask@1 n_34 next) (and (=> (= (ControlFlow 0 41) (- 0 43)) (HasDirectPerm QPMask@1 (MapType0Select Heap@@24 n_34 next) val)) (=> (HasDirectPerm QPMask@1 (MapType0Select Heap@@24 n_34 next) val) (and (=> (= (ControlFlow 0 41) (- 0 42)) (HasDirectPerm QPMask@1 n_34 val)) (=> (HasDirectPerm QPMask@1 n_34 val) (=> (= (ControlFlow 0 41) 40) anon36_correct))))))))))
(let ((anon292_Else_correct  (=> (not (U_2_bool (MapType2Select g n_34))) (and (=> (= (ControlFlow 0 48) 41) anon293_Then_correct) (=> (= (ControlFlow 0 48) 45) anon293_Else_correct)))))
(let ((anon292_Then_correct  (=> (U_2_bool (MapType2Select g n_34)) (and (=> (= (ControlFlow 0 46) (- 0 47)) (HasDirectPerm QPMask@1 n_34 next)) (=> (HasDirectPerm QPMask@1 n_34 next) (and (=> (= (ControlFlow 0 46) 41) anon293_Then_correct) (=> (= (ControlFlow 0 46) 45) anon293_Else_correct)))))))
(let ((anon288_Else_correct  (=> (and (forall ((n_7 T@U) ) (!  (=> (= (type n_7) RefType) (=> (and (U_2_bool (MapType2Select g n_7)) (not (= (MapType0Select Heap@@24 n_7 next) start_1@@1))) (<= (U_2_int (MapType0Select Heap@@24 n_7 val)) (U_2_int (MapType0Select Heap@@24 (MapType0Select Heap@@24 n_7 next) val)))))
 :qid |stdinbpl.5029:20|
 :skolemid |572|
 :pattern ( (MapType0Select Heap@@24 (MapType0Select Heap@@24 n_7 next) val))
)) (state Heap@@24 QPMask@1)) (and (and (=> (= (ControlFlow 0 462) 461) anon291_Else_correct) (=> (= (ControlFlow 0 462) 46) anon292_Then_correct)) (=> (= (ControlFlow 0 462) 48) anon292_Else_correct)))))
(let ((anon30_correct true))
(let ((anon290_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select g n_32)) (not (= (MapType0Select Heap@@24 n_32 next) start_1@@1)))) (= (ControlFlow 0 36) 31)) anon30_correct)))
(let ((anon290_Then_correct  (=> (and (U_2_bool (MapType2Select g n_32)) (not (= (MapType0Select Heap@@24 n_32 next) start_1@@1))) (and (=> (= (ControlFlow 0 32) (- 0 35)) (HasDirectPerm QPMask@1 n_32 val)) (=> (HasDirectPerm QPMask@1 n_32 val) (and (=> (= (ControlFlow 0 32) (- 0 34)) (HasDirectPerm QPMask@1 n_32 next)) (=> (HasDirectPerm QPMask@1 n_32 next) (and (=> (= (ControlFlow 0 32) (- 0 33)) (HasDirectPerm QPMask@1 (MapType0Select Heap@@24 n_32 next) val)) (=> (HasDirectPerm QPMask@1 (MapType0Select Heap@@24 n_32 next) val) (=> (= (ControlFlow 0 32) 31) anon30_correct))))))))))
(let ((anon289_Else_correct  (=> (not (U_2_bool (MapType2Select g n_32))) (and (=> (= (ControlFlow 0 39) 32) anon290_Then_correct) (=> (= (ControlFlow 0 39) 36) anon290_Else_correct)))))
(let ((anon289_Then_correct  (=> (U_2_bool (MapType2Select g n_32)) (and (=> (= (ControlFlow 0 37) (- 0 38)) (HasDirectPerm QPMask@1 n_32 next)) (=> (HasDirectPerm QPMask@1 n_32 next) (and (=> (= (ControlFlow 0 37) 32) anon290_Then_correct) (=> (= (ControlFlow 0 37) 36) anon290_Else_correct)))))))
(let ((anon287_Else_correct  (and (=> (= (ControlFlow 0 463) (- 0 464)) (forall ((n_5 T@U) (n_5_1 T@U) ) (!  (=> (and (= (type n_5) RefType) (= (type n_5_1) RefType)) (=> (and (and (and (and (not (= n_5 n_5_1)) (U_2_bool (MapType2Select g n_5))) (U_2_bool (MapType2Select g n_5_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_5 n_5_1))))
 :qid |stdinbpl.4979:15|
 :skolemid |566|
 :no-pattern (type n_5)
 :no-pattern (type n_5_1)
 :no-pattern (U_2_int n_5)
 :no-pattern (U_2_bool n_5)
 :no-pattern (U_2_int n_5_1)
 :no-pattern (U_2_bool n_5_1)
))) (=> (forall ((n_5@@0 T@U) (n_5_1@@0 T@U) ) (!  (=> (and (= (type n_5@@0) RefType) (= (type n_5_1@@0) RefType)) (=> (and (and (and (and (not (= n_5@@0 n_5_1@@0)) (U_2_bool (MapType2Select g n_5@@0))) (U_2_bool (MapType2Select g n_5_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_5@@0 n_5_1@@0))))
 :qid |stdinbpl.4979:15|
 :skolemid |566|
 :no-pattern (type n_5@@0)
 :no-pattern (type n_5_1@@0)
 :no-pattern (U_2_int n_5@@0)
 :no-pattern (U_2_bool n_5@@0)
 :no-pattern (U_2_int n_5_1@@0)
 :no-pattern (U_2_bool n_5_1@@0)
)) (=> (forall ((n_5@@1 T@U) ) (!  (=> (= (type n_5@@1) RefType) (=> (and (U_2_bool (MapType2Select g n_5@@1)) (< NoPerm FullPerm)) (and (qpRange53 n_5@@1) (= (invRecv53 n_5@@1) n_5@@1))))
 :qid |stdinbpl.4985:22|
 :skolemid |567|
 :pattern ( (MapType0Select Heap@@24 n_5@@1 val))
 :pattern ( (MapType1Select QPMask@1 n_5@@1 val))
 :pattern ( (MapType0Select Heap@@24 n_5@@1 val))
)) (=> (and (forall ((o_3@@71 T@U) ) (!  (=> (= (type o_3@@71) RefType) (=> (and (and (U_2_bool (MapType2Select g (invRecv53 o_3@@71))) (< NoPerm FullPerm)) (qpRange53 o_3@@71)) (= (invRecv53 o_3@@71) o_3@@71)))
 :qid |stdinbpl.4989:22|
 :skolemid |568|
 :pattern ( (invRecv53 o_3@@71))
)) (forall ((n_5@@2 T@U) ) (!  (=> (and (= (type n_5@@2) RefType) (U_2_bool (MapType2Select g n_5@@2))) (not (= n_5@@2 null)))
 :qid |stdinbpl.4995:22|
 :skolemid |569|
 :pattern ( (MapType0Select Heap@@24 n_5@@2 val))
 :pattern ( (MapType1Select QPMask@1 n_5@@2 val))
 :pattern ( (MapType0Select Heap@@24 n_5@@2 val))
))) (=> (and (and (forall ((o_3@@72 T@U) ) (!  (=> (= (type o_3@@72) RefType) (and (=> (and (and (U_2_bool (MapType2Select g (invRecv53 o_3@@72))) (< NoPerm FullPerm)) (qpRange53 o_3@@72)) (and (=> (< NoPerm FullPerm) (= (invRecv53 o_3@@72) o_3@@72)) (= (U_2_real (MapType1Select QPMask@1 o_3@@72 val)) (+ (U_2_real (MapType1Select QPMask@0 o_3@@72 val)) FullPerm)))) (=> (not (and (and (U_2_bool (MapType2Select g (invRecv53 o_3@@72))) (< NoPerm FullPerm)) (qpRange53 o_3@@72))) (= (U_2_real (MapType1Select QPMask@1 o_3@@72 val)) (U_2_real (MapType1Select QPMask@0 o_3@@72 val))))))
 :qid |stdinbpl.5001:22|
 :skolemid |570|
 :pattern ( (MapType1Select QPMask@1 o_3@@72 val))
)) (forall ((o_3@@73 T@U) (f_5@@23 T@U) ) (! (let ((B@@35 (FieldTypeInv1 (type f_5@@23))))
(let ((A@@36 (FieldTypeInv0 (type f_5@@23))))
 (=> (and (and (= (type o_3@@73) RefType) (= (type f_5@@23) (FieldType A@@36 B@@35))) (not (= f_5@@23 val))) (= (U_2_real (MapType1Select QPMask@0 o_3@@73 f_5@@23)) (U_2_real (MapType1Select QPMask@1 o_3@@73 f_5@@23))))))
 :qid |stdinbpl.5005:29|
 :skolemid |571|
 :pattern ( (MapType1Select QPMask@0 o_3@@73 f_5@@23))
 :pattern ( (MapType1Select QPMask@1 o_3@@73 f_5@@23))
))) (and (state Heap@@24 QPMask@1) (state Heap@@24 QPMask@1))) (and (and (=> (= (ControlFlow 0 463) 462) anon288_Else_correct) (=> (= (ControlFlow 0 463) 37) anon289_Then_correct)) (=> (= (ControlFlow 0 463) 39) anon289_Else_correct)))))))))
(let ((anon287_Then_correct true))
(let ((anon282_Else_correct  (=> (and (forall ((n_3 T@U) (m_1 T@U) ) (!  (=> (and (and (= (type n_3) RefType) (= (type m_1) RefType)) (and (U_2_bool (MapType2Select g n_3)) (U_2_bool (MapType2Select g m_1)))) (and (exists_path ($$ Heap@@24 g) n_3 m_1) (exists_path ($$ Heap@@24 g) m_1 n_3)))
 :qid |stdinbpl.4967:20|
 :skolemid |565|
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| Heap@@24 g))) g) n_3 m_1))
)) (state Heap@@24 QPMask@0)) (and (=> (= (ControlFlow 0 465) 30) anon287_Then_correct) (=> (= (ControlFlow 0 465) 463) anon287_Else_correct)))))
(let ((anon286_Then_correct  (and (=> (= (ControlFlow 0 25) (- 0 27)) (forall ((n$0_3 T@U) ) (!  (=> (= (type n$0_3) RefType) (=> (and (U_2_bool (MapType2Select g n$0_3)) (dummyFunction (MapType0Select Heap@@24 n$0_3 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.4915:27|
 :skolemid |558|
 :pattern ( (MapType0Select Heap@@24 n$0_3 next))
 :pattern ( (MapType1Select QPMask@33 n$0_3 next))
 :pattern ( (MapType0Select Heap@@24 n$0_3 next))
))) (=> (forall ((n$0_3@@0 T@U) ) (!  (=> (= (type n$0_3@@0) RefType) (=> (and (U_2_bool (MapType2Select g n$0_3@@0)) (dummyFunction (MapType0Select Heap@@24 n$0_3@@0 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.4915:27|
 :skolemid |558|
 :pattern ( (MapType0Select Heap@@24 n$0_3@@0 next))
 :pattern ( (MapType1Select QPMask@33 n$0_3@@0 next))
 :pattern ( (MapType0Select Heap@@24 n$0_3@@0 next))
)) (and (=> (= (ControlFlow 0 25) (- 0 26)) (forall ((n$0_3@@1 T@U) (n$0_3_1 T@U) ) (!  (=> (and (= (type n$0_3@@1) RefType) (= (type n$0_3_1) RefType)) (=> (and (and (and (and (not (= n$0_3@@1 n$0_3_1)) (U_2_bool (MapType2Select g n$0_3@@1))) (U_2_bool (MapType2Select g n$0_3_1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n$0_3@@1 n$0_3_1))))
 :qid |stdinbpl.4922:27|
 :skolemid |559|
 :pattern ( (neverTriggered52 n$0_3@@1) (neverTriggered52 n$0_3_1))
))) (=> (forall ((n$0_3@@2 T@U) (n$0_3_1@@0 T@U) ) (!  (=> (and (= (type n$0_3@@2) RefType) (= (type n$0_3_1@@0) RefType)) (=> (and (and (and (and (not (= n$0_3@@2 n$0_3_1@@0)) (U_2_bool (MapType2Select g n$0_3@@2))) (U_2_bool (MapType2Select g n$0_3_1@@0))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n$0_3@@2 n$0_3_1@@0))))
 :qid |stdinbpl.4922:27|
 :skolemid |559|
 :pattern ( (neverTriggered52 n$0_3@@2) (neverTriggered52 n$0_3_1@@0))
)) (=> (= (ControlFlow 0 25) (- 0 24)) (forall ((n$0_3@@3 T@U) ) (!  (=> (and (= (type n$0_3@@3) RefType) (U_2_bool (MapType2Select g n$0_3@@3))) (>= (U_2_real (MapType1Select QPMask@0 n$0_3@@3 next)) (/ (to_real 1) (to_real 2))))
 :qid |stdinbpl.4929:27|
 :skolemid |560|
 :pattern ( (MapType0Select Heap@@24 n$0_3@@3 next))
 :pattern ( (MapType1Select QPMask@33 n$0_3@@3 next))
 :pattern ( (MapType0Select Heap@@24 n$0_3@@3 next))
)))))))))
(let ((anon284_Then_correct  (and (=> (= (ControlFlow 0 20) (- 0 22)) (forall ((n$0_2 T@U) ) (!  (=> (= (type n$0_2) RefType) (=> (and (U_2_bool (MapType2Select g n$0_2)) (dummyFunction (MapType0Select Heap@@24 n$0_2 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.4858:25|
 :skolemid |551|
 :pattern ( (MapType0Select Heap@@24 n$0_2 next))
 :pattern ( (MapType1Select QPMask@32 n$0_2 next))
 :pattern ( (MapType0Select Heap@@24 n$0_2 next))
))) (=> (forall ((n$0_2@@0 T@U) ) (!  (=> (= (type n$0_2@@0) RefType) (=> (and (U_2_bool (MapType2Select g n$0_2@@0)) (dummyFunction (MapType0Select Heap@@24 n$0_2@@0 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.4858:25|
 :skolemid |551|
 :pattern ( (MapType0Select Heap@@24 n$0_2@@0 next))
 :pattern ( (MapType1Select QPMask@32 n$0_2@@0 next))
 :pattern ( (MapType0Select Heap@@24 n$0_2@@0 next))
)) (and (=> (= (ControlFlow 0 20) (- 0 21)) (forall ((n$0_2@@1 T@U) (n$0_2_1 T@U) ) (!  (=> (and (= (type n$0_2@@1) RefType) (= (type n$0_2_1) RefType)) (=> (and (and (and (and (not (= n$0_2@@1 n$0_2_1)) (U_2_bool (MapType2Select g n$0_2@@1))) (U_2_bool (MapType2Select g n$0_2_1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n$0_2@@1 n$0_2_1))))
 :qid |stdinbpl.4865:25|
 :skolemid |552|
 :pattern ( (neverTriggered51 n$0_2@@1) (neverTriggered51 n$0_2_1))
))) (=> (forall ((n$0_2@@2 T@U) (n$0_2_1@@0 T@U) ) (!  (=> (and (= (type n$0_2@@2) RefType) (= (type n$0_2_1@@0) RefType)) (=> (and (and (and (and (not (= n$0_2@@2 n$0_2_1@@0)) (U_2_bool (MapType2Select g n$0_2@@2))) (U_2_bool (MapType2Select g n$0_2_1@@0))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n$0_2@@2 n$0_2_1@@0))))
 :qid |stdinbpl.4865:25|
 :skolemid |552|
 :pattern ( (neverTriggered51 n$0_2@@2) (neverTriggered51 n$0_2_1@@0))
)) (=> (= (ControlFlow 0 20) (- 0 19)) (forall ((n$0_2@@3 T@U) ) (!  (=> (and (= (type n$0_2@@3) RefType) (U_2_bool (MapType2Select g n$0_2@@3))) (>= (U_2_real (MapType1Select QPMask@0 n$0_2@@3 next)) (/ (to_real 1) (to_real 2))))
 :qid |stdinbpl.4872:25|
 :skolemid |553|
 :pattern ( (MapType0Select Heap@@24 n$0_2@@3 next))
 :pattern ( (MapType1Select QPMask@32 n$0_2@@3 next))
 :pattern ( (MapType0Select Heap@@24 n$0_2@@3 next))
)))))))))
(let ((anon22_correct true))
(let ((anon285_Then_correct  (=> (exists_path ($$ Heap@@24 g) n_30 m@@10) (and (=> (= (ControlFlow 0 28) 25) anon286_Then_correct) (=> (= (ControlFlow 0 28) 17) anon22_correct)))))
(let ((anon285_Else_correct  (=> (and (not (exists_path ($$ Heap@@24 g) n_30 m@@10)) (= (ControlFlow 0 23) 17)) anon22_correct)))
(let ((anon283_Then_correct  (=> (and (U_2_bool (MapType2Select g n_30)) (U_2_bool (MapType2Select g m@@10))) (and (and (=> (= (ControlFlow 0 29) 20) anon284_Then_correct) (=> (= (ControlFlow 0 29) 28) anon285_Then_correct)) (=> (= (ControlFlow 0 29) 23) anon285_Else_correct)))))
(let ((anon283_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select g n_30)) (U_2_bool (MapType2Select g m@@10)))) (= (ControlFlow 0 18) 17)) anon22_correct)))
(let ((anon280_Else_correct  (=> (forall ((v$0_1 T@U) ) (!  (=> (and (= (type v$0_1) RefType) (U_2_bool (MapType2Select g v$0_1))) (= (= v$0_1 (MapType0Select Heap@@24 v$0_1 next)) (|Set#Equal| g (|Set#Singleton| v$0_1))))
 :qid |stdinbpl.4838:20|
 :skolemid |550|
 :pattern ( (MapType0Select Heap@@24 v$0_1 next))
)) (=> (and (and (state Heap@@24 QPMask@0) (U_2_bool (MapType2Select g start_1@@1))) (and (state Heap@@24 QPMask@0) (state Heap@@24 QPMask@0))) (and (and (=> (= (ControlFlow 0 466) 465) anon282_Else_correct) (=> (= (ControlFlow 0 466) 29) anon283_Then_correct)) (=> (= (ControlFlow 0 466) 18) anon283_Else_correct))))))
(let ((anon14_correct true))
(let ((anon281_Else_correct  (=> (and (not (U_2_bool (MapType2Select g v$0))) (= (ControlFlow 0 16) 13)) anon14_correct)))
(let ((anon281_Then_correct  (=> (U_2_bool (MapType2Select g v$0)) (and (=> (= (ControlFlow 0 14) (- 0 15)) (HasDirectPerm QPMask@0 v$0 next)) (=> (HasDirectPerm QPMask@0 v$0 next) (=> (= (ControlFlow 0 14) 13) anon14_correct))))))
(let ((anon277_Else_correct  (=> (forall ((v1_1_1 T@U) (v2_1_1 T@U) (v_1_1@@1 T@U) ) (!  (=> (and (and (and (and (= (type v1_1_1) RefType) (= (type v2_1_1) RefType)) (= (type v_1_1@@1) RefType)) (and (U_2_bool (MapType2Select g v1_1_1)) (and (U_2_bool (MapType2Select g v2_1_1)) (U_2_bool (MapType2Select g v_1_1@@1))))) (and (= (MapType0Select Heap@@24 v1_1_1 next) v_1_1@@1) (= (MapType0Select Heap@@24 v2_1_1 next) v_1_1@@1))) (= v1_1_1 v2_1_1))
 :qid |stdinbpl.4825:20|
 :skolemid |549|
 :pattern ( (MapType2Select g v_1_1@@1) (MapType0Select Heap@@24 v1_1_1 next) (MapType0Select Heap@@24 v2_1_1 next))
)) (and (and (=> (= (ControlFlow 0 467) 466) anon280_Else_correct) (=> (= (ControlFlow 0 467) 14) anon281_Then_correct)) (=> (= (ControlFlow 0 467) 16) anon281_Else_correct)))))
(let ((anon10_correct true))
(let ((anon279_Else_correct  (=> (and (not (= (MapType0Select Heap@@24 v1_3 next) v_18)) (= (ControlFlow 0 10) 6)) anon10_correct)))
(let ((anon279_Then_correct  (=> (= (MapType0Select Heap@@24 v1_3 next) v_18) (and (=> (= (ControlFlow 0 8) (- 0 9)) (HasDirectPerm QPMask@0 v2_3 next)) (=> (HasDirectPerm QPMask@0 v2_3 next) (=> (= (ControlFlow 0 8) 6) anon10_correct))))))
(let ((anon278_Then_correct  (=> (and (U_2_bool (MapType2Select g v1_3)) (and (U_2_bool (MapType2Select g v2_3)) (U_2_bool (MapType2Select g v_18)))) (and (=> (= (ControlFlow 0 11) (- 0 12)) (HasDirectPerm QPMask@0 v1_3 next)) (=> (HasDirectPerm QPMask@0 v1_3 next) (and (=> (= (ControlFlow 0 11) 8) anon279_Then_correct) (=> (= (ControlFlow 0 11) 10) anon279_Else_correct)))))))
(let ((anon278_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select g v1_3)) (and (U_2_bool (MapType2Select g v2_3)) (U_2_bool (MapType2Select g v_18))))) (= (ControlFlow 0 7) 6)) anon10_correct)))
(let ((anon275_Else_correct  (=> (and (forall ((n$0_1 T@U) ) (!  (=> (and (= (type n$0_1) RefType) (U_2_bool (MapType2Select g n$0_1))) (U_2_bool (MapType2Select g (MapType0Select Heap@@24 n$0_1 next))))
 :qid |stdinbpl.4807:20|
 :skolemid |548|
 :pattern ( (MapType2Select g (MapType0Select Heap@@24 n$0_1 next)))
 :pattern ( (MapType2Select g n$0_1) (MapType0Select Heap@@24 n$0_1 next))
)) (state Heap@@24 QPMask@0)) (and (and (=> (= (ControlFlow 0 468) 467) anon277_Else_correct) (=> (= (ControlFlow 0 468) 11) anon278_Then_correct)) (=> (= (ControlFlow 0 468) 7) anon278_Else_correct)))))
(let ((anon5_correct true))
(let ((anon276_Else_correct  (=> (and (not (U_2_bool (MapType2Select g n$0_9))) (= (ControlFlow 0 5) 2)) anon5_correct)))
(let ((anon276_Then_correct  (=> (U_2_bool (MapType2Select g n$0_9)) (and (=> (= (ControlFlow 0 3) (- 0 4)) (HasDirectPerm QPMask@0 n$0_9 next)) (=> (HasDirectPerm QPMask@0 n$0_9 next) (=> (= (ControlFlow 0 3) 2) anon5_correct))))))
(let ((anon274_Else_correct  (and (=> (= (ControlFlow 0 469) (- 0 470)) (forall ((n_1 T@U) (n_1_1 T@U) ) (!  (=> (and (= (type n_1) RefType) (= (type n_1_1) RefType)) (=> (and (and (and (and (not (= n_1 n_1_1)) (U_2_bool (MapType2Select g n_1))) (U_2_bool (MapType2Select g n_1_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_1 n_1_1))))
 :qid |stdinbpl.4766:15|
 :skolemid |542|
 :no-pattern (type n_1)
 :no-pattern (type n_1_1)
 :no-pattern (U_2_int n_1)
 :no-pattern (U_2_bool n_1)
 :no-pattern (U_2_int n_1_1)
 :no-pattern (U_2_bool n_1_1)
))) (=> (forall ((n_1@@0 T@U) (n_1_1@@0 T@U) ) (!  (=> (and (= (type n_1@@0) RefType) (= (type n_1_1@@0) RefType)) (=> (and (and (and (and (not (= n_1@@0 n_1_1@@0)) (U_2_bool (MapType2Select g n_1@@0))) (U_2_bool (MapType2Select g n_1_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_1@@0 n_1_1@@0))))
 :qid |stdinbpl.4766:15|
 :skolemid |542|
 :no-pattern (type n_1@@0)
 :no-pattern (type n_1_1@@0)
 :no-pattern (U_2_int n_1@@0)
 :no-pattern (U_2_bool n_1@@0)
 :no-pattern (U_2_int n_1_1@@0)
 :no-pattern (U_2_bool n_1_1@@0)
)) (=> (and (forall ((n_1@@1 T@U) ) (!  (=> (= (type n_1@@1) RefType) (=> (and (U_2_bool (MapType2Select g n_1@@1)) (< NoPerm FullPerm)) (and (qpRange50 n_1@@1) (= (invRecv50 n_1@@1) n_1@@1))))
 :qid |stdinbpl.4772:22|
 :skolemid |543|
 :pattern ( (MapType0Select Heap@@24 n_1@@1 next))
 :pattern ( (MapType1Select QPMask@0 n_1@@1 next))
 :pattern ( (MapType0Select Heap@@24 n_1@@1 next))
)) (forall ((o_3@@74 T@U) ) (!  (=> (= (type o_3@@74) RefType) (=> (and (and (U_2_bool (MapType2Select g (invRecv50 o_3@@74))) (< NoPerm FullPerm)) (qpRange50 o_3@@74)) (= (invRecv50 o_3@@74) o_3@@74)))
 :qid |stdinbpl.4776:22|
 :skolemid |544|
 :pattern ( (invRecv50 o_3@@74))
))) (=> (and (and (forall ((n_1@@2 T@U) ) (!  (=> (and (= (type n_1@@2) RefType) (U_2_bool (MapType2Select g n_1@@2))) (not (= n_1@@2 null)))
 :qid |stdinbpl.4782:22|
 :skolemid |545|
 :pattern ( (MapType0Select Heap@@24 n_1@@2 next))
 :pattern ( (MapType1Select QPMask@0 n_1@@2 next))
 :pattern ( (MapType0Select Heap@@24 n_1@@2 next))
)) (forall ((o_3@@75 T@U) ) (!  (=> (= (type o_3@@75) RefType) (and (=> (and (and (U_2_bool (MapType2Select g (invRecv50 o_3@@75))) (< NoPerm FullPerm)) (qpRange50 o_3@@75)) (and (=> (< NoPerm FullPerm) (= (invRecv50 o_3@@75) o_3@@75)) (= (U_2_real (MapType1Select QPMask@0 o_3@@75 next)) (+ (U_2_real (MapType1Select ZeroMask o_3@@75 next)) FullPerm)))) (=> (not (and (and (U_2_bool (MapType2Select g (invRecv50 o_3@@75))) (< NoPerm FullPerm)) (qpRange50 o_3@@75))) (= (U_2_real (MapType1Select QPMask@0 o_3@@75 next)) (U_2_real (MapType1Select ZeroMask o_3@@75 next))))))
 :qid |stdinbpl.4788:22|
 :skolemid |546|
 :pattern ( (MapType1Select QPMask@0 o_3@@75 next))
))) (and (forall ((o_3@@76 T@U) (f_5@@24 T@U) ) (! (let ((B@@36 (FieldTypeInv1 (type f_5@@24))))
(let ((A@@37 (FieldTypeInv0 (type f_5@@24))))
 (=> (and (and (= (type o_3@@76) RefType) (= (type f_5@@24) (FieldType A@@37 B@@36))) (not (= f_5@@24 next))) (= (U_2_real (MapType1Select ZeroMask o_3@@76 f_5@@24)) (U_2_real (MapType1Select QPMask@0 o_3@@76 f_5@@24))))))
 :qid |stdinbpl.4792:29|
 :skolemid |547|
 :pattern ( (MapType1Select ZeroMask o_3@@76 f_5@@24))
 :pattern ( (MapType1Select QPMask@0 o_3@@76 f_5@@24))
)) (state Heap@@24 QPMask@0))) (and (and (=> (= (ControlFlow 0 469) 468) anon275_Else_correct) (=> (= (ControlFlow 0 469) 3) anon276_Then_correct)) (=> (= (ControlFlow 0 469) 5) anon276_Else_correct))))))))
(let ((anon274_Then_correct true))
(let ((anon0_correct  (=> (and (and (state Heap@@24 ZeroMask) (= AssumeFunctionsAbove (- 0 1))) (and (U_2_bool (MapType0Select Heap@@24 start_1@@1 $allocated)) (not (U_2_bool (MapType2Select g null))))) (and (=> (= (ControlFlow 0 471) 1) anon274_Then_correct) (=> (= (ControlFlow 0 471) 469) anon274_Else_correct)))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 472) 471) anon0_correct)))
PreconditionGeneratedEntry_correct)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
))
(check-sat)
(pop 1)
; Valid
(get-info :rlimit)
