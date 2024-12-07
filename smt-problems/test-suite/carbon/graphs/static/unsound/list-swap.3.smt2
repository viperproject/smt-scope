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
(declare-fun succs (T@U T@U) T@U)
(declare-fun edge_ (T@U T@U T@U) Bool)
(declare-fun inst_uReach (T@U T@U) T@U)
(declare-fun exists_path (T@U T@U T@U) Bool)
(declare-fun inst_uReach_rev (T@U T@U) T@U)
(declare-fun $$ (T@U T@U) T@U)
(declare-fun |Math#clip| (Int) Int)
(declare-fun exists_path_ (T@U T@U T@U) Bool)
(declare-fun AssumeFunctionsAbove () Int)
(declare-fun |$$#trigger| (T@U T@U) Bool)
(declare-fun FrameFragment (T@U) T@U)
(declare-fun |$$#condqp1| (T@U T@U) Int)
(declare-fun edge (T@U T@U T@U) Bool)
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
 :qid |stdinbpl.573:18|
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
(assert (forall ((Heap@@0 T@U) (g0 T@U) (g1 T@U) ) (!  (=> (and (and (= (type Heap@@0) (MapType0Type RefType)) (= (type g0) (MapType2Type RefType boolType))) (= (type g1) (MapType2Type RefType boolType))) (dummyFunction (bool_2_U (|apply_TCFraming#triggerStateless| g0 g1))))
 :qid |stdinbpl.937:15|
 :skolemid |122|
 :pattern ( (|apply_TCFraming'| Heap@@0 g0 g1))
)))
(assert (forall ((a@@0 Int) (b@@0 Int) ) (!  (or (= (|Math#min| a@@0 b@@0) a@@0) (= (|Math#min| a@@0 b@@0) b@@0))
 :qid |stdinbpl.504:15|
 :skolemid |53|
 :pattern ( (|Math#min| a@@0 b@@0))
)))
(assert  (and (and (= (Ctor FrameTypeType) 13) (= (type null) RefType)) (forall ((arg0@@33 T@U) ) (! (let ((A (FieldTypeInv0 (type arg0@@33))))
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
(assert  (and (and (= (Ctor EdgeDomainTypeType) 14) (forall ((arg0@@35 T@U) (arg1@@17 T@U) ) (! (= (type (|$$'| arg0@@35 arg1@@17)) (MapType2Type EdgeDomainTypeType boolType))
 :qid |funType:$$'|
 :pattern ( (|$$'| arg0@@35 arg1@@17))
))) (forall ((arg0@@36 T@U) ) (! (= (type (|$$#triggerStateless| arg0@@36)) (MapType2Type EdgeDomainTypeType boolType))
 :qid |funType:$$#triggerStateless|
 :pattern ( (|$$#triggerStateless| arg0@@36))
))))
(assert (forall ((Heap@@3 T@U) (refs T@U) ) (!  (=> (and (= (type Heap@@3) (MapType0Type RefType)) (= (type refs) (MapType2Type RefType boolType))) (dummyFunction (|$$#triggerStateless| refs)))
 :qid |stdinbpl.775:15|
 :skolemid |102|
 :pattern ( (|$$'| Heap@@3 refs))
)))
(assert (forall ((a@@1 T@U) (b@@1 T@U) (y@@1 T@U) ) (! (let ((T@@3 (type y@@1)))
 (=> (and (and (= (type a@@1) (MultiSetType T@@3)) (= (type b@@1) (MultiSetType T@@3))) (<= (|MultiSet#Select| a@@1 y@@1) (|MultiSet#Select| b@@1 y@@1))) (= (|MultiSet#Select| (|MultiSet#Difference| a@@1 b@@1) y@@1) 0)))
 :qid |stdinbpl.571:18|
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
 :qid |stdinbpl.456:18|
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
 :qid |stdinbpl.460:18|
 :skolemid |40|
 :pattern ( (|Set#Intersection| (|Set#Intersection| a@@3 b@@3) b@@3))
)))
(assert (forall ((a@@4 T@U) (b@@4 T@U) ) (! (let ((T@@8 (MultiSetTypeInv0 (type a@@4))))
 (=> (and (= (type a@@4) (MultiSetType T@@8)) (= (type b@@4) (MultiSetType T@@8))) (= (|MultiSet#Intersection| (|MultiSet#Intersection| a@@4 b@@4) b@@4) (|MultiSet#Intersection| a@@4 b@@4))))
 :qid |stdinbpl.562:18|
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
 :qid |stdinbpl.425:18|
 :skolemid |27|
 :pattern ( (MapType2Select (|Set#Singleton| r) o))
)))
(assert (forall ((a@@5 T@U) (b@@5 T@U) ) (! (let ((T@@11 (MapType2TypeInv0 (type a@@5))))
 (=> (and (= (type a@@5) (MapType2Type T@@11 boolType)) (= (type b@@5) (MapType2Type T@@11 boolType))) (= (+ (|Set#Card| (|Set#Union| a@@5 b@@5)) (|Set#Card| (|Set#Intersection| a@@5 b@@5))) (+ (|Set#Card| a@@5) (|Set#Card| b@@5)))))
 :qid |stdinbpl.464:18|
 :skolemid |42|
 :pattern ( (|Set#Card| (|Set#Union| a@@5 b@@5)))
 :pattern ( (|Set#Card| (|Set#Intersection| a@@5 b@@5)))
)))
(assert (forall ((arg0@@40 T@U) (arg1@@20 T@U) ) (! (= (type (succs arg0@@40 arg1@@20)) (MapType2Type RefType boolType))
 :qid |funType:succs|
 :pattern ( (succs arg0@@40 arg1@@20))
)))
(assert (forall ((EG_1 T@U) (pred_1 T@U) (succ T@U) ) (!  (=> (and (and (= (type EG_1) (MapType2Type EdgeDomainTypeType boolType)) (= (type pred_1) RefType)) (= (type succ) RefType)) (= (U_2_bool (MapType2Select (succs EG_1 pred_1) succ)) (edge_ EG_1 pred_1 succ)))
 :qid |stdinbpl.667:15|
 :skolemid |83|
 :pattern ( (MapType2Select (succs EG_1 pred_1) succ))
)))
(assert (forall ((arg0@@41 T@U) (arg1@@21 T@U) ) (! (= (type (inst_uReach arg0@@41 arg1@@21)) (MapType2Type RefType boolType))
 :qid |funType:inst_uReach|
 :pattern ( (inst_uReach arg0@@41 arg1@@21))
)))
(assert (forall ((EG_1@@0 T@U) (x_1 T@U) (v_2 T@U) ) (!  (=> (and (and (= (type EG_1@@0) (MapType2Type EdgeDomainTypeType boolType)) (= (type x_1) RefType)) (= (type v_2) RefType)) (= (U_2_bool (MapType2Select (inst_uReach EG_1@@0 x_1) v_2)) (exists_path EG_1@@0 x_1 v_2)))
 :qid |stdinbpl.697:15|
 :skolemid |89|
 :pattern ( (MapType2Select (inst_uReach EG_1@@0 x_1) v_2))
 :pattern ( (exists_path EG_1@@0 x_1 v_2))
)))
(assert (forall ((arg0@@42 T@U) (arg1@@22 T@U) ) (! (= (type (inst_uReach_rev arg0@@42 arg1@@22)) (MapType2Type RefType boolType))
 :qid |funType:inst_uReach_rev|
 :pattern ( (inst_uReach_rev arg0@@42 arg1@@22))
)))
(assert (forall ((EG_1@@1 T@U) (u_1 T@U) (y@@2 T@U) ) (!  (=> (and (and (= (type EG_1@@1) (MapType2Type EdgeDomainTypeType boolType)) (= (type u_1) RefType)) (= (type y@@2) RefType)) (= (U_2_bool (MapType2Select (inst_uReach_rev EG_1@@1 y@@2) u_1)) (exists_path EG_1@@1 u_1 y@@2)))
 :qid |stdinbpl.703:15|
 :skolemid |90|
 :pattern ( (MapType2Select (inst_uReach_rev EG_1@@1 y@@2) u_1))
 :pattern ( (exists_path EG_1@@1 u_1 y@@2))
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
 :qid |stdinbpl.771:15|
 :skolemid |101|
 :pattern ( ($$ Heap@@5 refs@@0))
)))
(assert (forall ((a@@6 Int) ) (!  (=> (<= 0 a@@6) (= (|Math#clip| a@@6) a@@6))
 :qid |stdinbpl.507:15|
 :skolemid |54|
 :pattern ( (|Math#clip| a@@6))
)))
(assert (forall ((EG_1@@2 T@U) (u_1@@0 T@U) (v_2@@0 T@U) (w_1 T@U) ) (!  (=> (and (and (and (and (= (type EG_1@@2) (MapType2Type EdgeDomainTypeType boolType)) (= (type u_1@@0) RefType)) (= (type v_2@@0) RefType)) (= (type w_1) RefType)) (and (exists_path_ EG_1@@2 u_1@@0 w_1) (exists_path_ EG_1@@2 w_1 v_2@@0))) (exists_path_ EG_1@@2 u_1@@0 v_2@@0))
 :qid |stdinbpl.724:15|
 :skolemid |94|
 :pattern ( (exists_path EG_1@@2 u_1@@0 w_1) (exists_path EG_1@@2 w_1 v_2@@0))
)))
(assert (forall ((a@@7 T@U) (b@@6 T@U) (o@@0 T@U) ) (! (let ((T@@12 (type o@@0)))
 (=> (and (= (type a@@7) (MultiSetType T@@12)) (= (type b@@6) (MultiSetType T@@12))) (= (|MultiSet#Select| (|MultiSet#Intersection| a@@7 b@@6) o@@0) (|Math#min| (|MultiSet#Select| a@@7 o@@0) (|MultiSet#Select| b@@6 o@@0)))))
 :qid |stdinbpl.558:18|
 :skolemid |69|
 :pattern ( (|MultiSet#Select| (|MultiSet#Intersection| a@@7 b@@6) o@@0))
)))
(assert (forall ((arg0@@44 T@U) ) (! (= (type (FrameFragment arg0@@44)) FrameTypeType)
 :qid |funType:FrameFragment|
 :pattern ( (FrameFragment arg0@@44))
)))
(assert (forall ((Heap@@6 T@U) (Mask@@3 T@U) (refs@@1 T@U) ) (!  (=> (and (and (and (= (type Heap@@6) (MapType0Type RefType)) (= (type Mask@@3) (MapType1Type RefType realType))) (= (type refs@@1) (MapType2Type RefType boolType))) (and (state Heap@@6 Mask@@3) (or (< AssumeFunctionsAbove 1) (|$$#trigger| (FrameFragment (int_2_U (|$$#condqp1| Heap@@6 refs@@1))) refs@@1)))) (forall ((p_1_1 T@U) (s_1_1 T@U) ) (!  (=> (and (and (= (type p_1_1) RefType) (= (type s_1_1) RefType)) (and (U_2_bool (MapType2Select refs@@1 p_1_1)) (exists_path (|$$'| Heap@@6 refs@@1) p_1_1 s_1_1))) (U_2_bool (MapType2Select refs@@1 s_1_1)))
 :qid |stdinbpl.807:122|
 :skolemid |107|
 :pattern ( (MapType2Select refs@@1 p_1_1) (MapType2Select refs@@1 s_1_1) (exists_path (|$$'| Heap@@6 refs@@1) p_1_1 s_1_1))
)))
 :qid |stdinbpl.805:15|
 :skolemid |108|
 :pattern ( (state Heap@@6 Mask@@3) (|$$'| Heap@@6 refs@@1))
)))
(assert (forall ((Heap@@7 T@U) (Mask@@4 T@U) (refs@@2 T@U) ) (!  (=> (and (and (and (= (type Heap@@7) (MapType0Type RefType)) (= (type Mask@@4) (MapType1Type RefType realType))) (= (type refs@@2) (MapType2Type RefType boolType))) (and (state Heap@@7 Mask@@4) (or (< AssumeFunctionsAbove 1) (|$$#trigger| (FrameFragment (int_2_U (|$$#condqp1| Heap@@7 refs@@2))) refs@@2)))) (forall ((p_2_1 T@U) (s_2 T@U) ) (!  (=> (and (and (= (type p_2_1) RefType) (= (type s_2) RefType)) (and (U_2_bool (MapType2Select refs@@2 s_2)) (exists_path (|$$'| Heap@@7 refs@@2) p_2_1 s_2))) (U_2_bool (MapType2Select refs@@2 p_2_1)))
 :qid |stdinbpl.814:122|
 :skolemid |109|
 :pattern ( (MapType2Select refs@@2 p_2_1) (MapType2Select refs@@2 s_2) (exists_path (|$$'| Heap@@7 refs@@2) p_2_1 s_2))
)))
 :qid |stdinbpl.812:15|
 :skolemid |110|
 :pattern ( (state Heap@@7 Mask@@4) (|$$'| Heap@@7 refs@@2))
)))
(assert (forall ((EG_1@@3 T@U) (start_1 T@U) (end_1 T@U) ) (!  (=> (and (and (= (type EG_1@@3) (MapType2Type EdgeDomainTypeType boolType)) (= (type start_1) RefType)) (= (type end_1) RefType)) (= (exists_path_ EG_1@@3 start_1 end_1)  (or (= start_1 end_1) (exists ((w_1@@0 T@U) ) (!  (and (= (type w_1@@0) RefType) (and (edge EG_1@@3 start_1 w_1@@0) (exists_path_ EG_1@@3 w_1@@0 end_1)))
 :qid |stdinbpl.717:78|
 :skolemid |92|
 :pattern ( (edge EG_1@@3 start_1 w_1@@0))
 :pattern ( (exists_path_ EG_1@@3 w_1@@0 end_1))
)))))
 :qid |stdinbpl.715:15|
 :skolemid |93|
 :pattern ( (exists_path EG_1@@3 start_1 end_1))
 :pattern ( (edge EG_1@@3 start_1 end_1))
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
(assert (forall ((Heap@@9 T@U) (Mask@@6 T@U) (g0@@0 T@U) (g1@@0 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@9) (MapType0Type RefType)) (= (type Mask@@6) (MapType1Type RefType realType))) (= (type g0@@0) (MapType2Type RefType boolType))) (= (type g1@@0) (MapType2Type RefType boolType))) (and (state Heap@@9 Mask@@6) (or (< AssumeFunctionsAbove 0) (|apply_TCFraming#trigger| (CombineFrames (FrameFragment (int_2_U (|apply_TCFraming#condqp2| Heap@@9 g0@@0 g1@@0))) (FrameFragment (int_2_U (|apply_TCFraming#condqp3| Heap@@9 g0@@0 g1@@0)))) g0@@0 g1@@0)))) (|Set#Equal| (|Set#Intersection| g1@@0 g0@@0) (|Set#Empty| RefType))) (forall ((u_2 T@U) (v_2_1 T@U) ) (!  (=> (and (and (= (type u_2) RefType) (= (type v_2_1) RefType)) (and (U_2_bool (MapType2Select g0@@0 u_2)) (and (U_2_bool (MapType2Select g0@@0 v_2_1)) (not (exists_path ($$ Heap@@9 g0@@0) u_2 v_2_1))))) (not (exists_path ($$ Heap@@9 (|Set#Union| g0@@0 g1@@0)) u_2 v_2_1)))
 :qid |stdinbpl.990:285|
 :skolemid |131|
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| Heap@@9 g0@@0))) g0@@0) u_2 v_2_1))
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| Heap@@9 (|Set#Union| g0@@0 g1@@0)))) (|Set#Union| g0@@0 g1@@0)) u_2 v_2_1))
)))
 :qid |stdinbpl.988:15|
 :skolemid |132|
 :pattern ( (state Heap@@9 Mask@@6) (|apply_TCFraming'| Heap@@9 g0@@0 g1@@0))
)))
(assert (forall ((Heap@@10 T@U) (Mask@@7 T@U) (g0@@1 T@U) (g1@@1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@10) (MapType0Type RefType)) (= (type Mask@@7) (MapType1Type RefType realType))) (= (type g0@@1) (MapType2Type RefType boolType))) (= (type g1@@1) (MapType2Type RefType boolType))) (and (state Heap@@10 Mask@@7) (or (< AssumeFunctionsAbove 0) (|apply_TCFraming#trigger| (CombineFrames (FrameFragment (int_2_U (|apply_TCFraming#condqp2| Heap@@10 g0@@1 g1@@1))) (FrameFragment (int_2_U (|apply_TCFraming#condqp3| Heap@@10 g0@@1 g1@@1)))) g0@@1 g1@@1)))) (|Set#Equal| (|Set#Intersection| g1@@1 g0@@1) (|Set#Empty| RefType))) (forall ((u_3 T@U) (v_3 T@U) ) (!  (=> (and (and (= (type u_3) RefType) (= (type v_3) RefType)) (and (U_2_bool (MapType2Select g1@@1 u_3)) (and (U_2_bool (MapType2Select g1@@1 v_3)) (not (exists_path ($$ Heap@@10 g1@@1) u_3 v_3))))) (not (exists_path ($$ Heap@@10 (|Set#Union| g1@@1 g0@@1)) u_3 v_3)))
 :qid |stdinbpl.997:285|
 :skolemid |133|
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| Heap@@10 g1@@1))) g1@@1) u_3 v_3))
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| Heap@@10 (|Set#Union| g0@@1 g1@@1)))) (|Set#Union| g0@@1 g1@@1)) u_3 v_3))
)))
 :qid |stdinbpl.995:15|
 :skolemid |134|
 :pattern ( (state Heap@@10 Mask@@7) (|apply_TCFraming'| Heap@@10 g0@@1 g1@@1))
)))
(assert (forall ((arg0@@47 T@U) (arg1@@26 T@U) ) (! (= (type (create_edge arg0@@47 arg1@@26)) EdgeDomainTypeType)
 :qid |funType:create_edge|
 :pattern ( (create_edge arg0@@47 arg1@@26))
)))
(assert (forall ((EG_1@@4 T@U) (p_2 T@U) (s_1 T@U) ) (!  (=> (and (and (= (type EG_1@@4) (MapType2Type EdgeDomainTypeType boolType)) (= (type p_2) RefType)) (= (type s_1) RefType)) (= (edge_ EG_1@@4 p_2 s_1) (U_2_bool (MapType2Select EG_1@@4 (create_edge p_2 s_1)))))
 :qid |stdinbpl.679:15|
 :skolemid |85|
 :pattern ( (MapType2Select EG_1@@4 (create_edge p_2 s_1)))
 :pattern ( (edge EG_1@@4 p_2 s_1))
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
 :qid |stdinbpl.544:18|
 :skolemid |65|
 :pattern ( (|MultiSet#Card| (|MultiSet#UnionOne| a@@8 x@@8)))
 :pattern ( (|MultiSet#UnionOne| a@@8 x@@8) (|MultiSet#Card| a@@8))
)))
(assert (forall ((a@@9 T@U) (b@@7 T@U) ) (! (let ((T@@16 (MultiSetTypeInv0 (type a@@9))))
 (=> (and (= (type a@@9) (MultiSetType T@@16)) (= (type b@@7) (MultiSetType T@@16))) (= (|MultiSet#Disjoint| a@@9 b@@7) (forall ((o@@1 T@U) ) (!  (=> (= (type o@@1) T@@16) (or (= (|MultiSet#Select| a@@9 o@@1) 0) (= (|MultiSet#Select| b@@7 o@@1) 0)))
 :qid |stdinbpl.594:39|
 :skolemid |80|
 :pattern ( (|MultiSet#Select| a@@9 o@@1))
 :pattern ( (|MultiSet#Select| b@@7 o@@1))
)))))
 :qid |stdinbpl.593:18|
 :skolemid |81|
 :pattern ( (|MultiSet#Disjoint| a@@9 b@@7))
)))
(assert (forall ((p T@U) (v_1 T@U) (w T@U) ) (! (let ((A@@2 (FieldTypeInv0 (type p))))
 (=> (and (and (= (type p) (FieldType A@@2 FrameTypeType)) (= (type v_1) FrameTypeType)) (= (type w) FrameTypeType)) (not (InsidePredicate p v_1 p w))))
 :qid |stdinbpl.402:19|
 :skolemid |21|
 :pattern ( (InsidePredicate p v_1 p w))
)))
(assert (forall ((arg0@@49 T@U) ) (! (let ((T@@17 (type arg0@@49)))
(= (type (|MultiSet#Singleton| arg0@@49)) (MultiSetType T@@17)))
 :qid |funType:MultiSet#Singleton|
 :pattern ( (|MultiSet#Singleton| arg0@@49))
)))
(assert (forall ((r@@0 T@U) ) (!  (and (= (|MultiSet#Card| (|MultiSet#Singleton| r@@0)) 1) (= (|MultiSet#Select| (|MultiSet#Singleton| r@@0) r@@0) 1))
 :qid |stdinbpl.536:18|
 :skolemid |62|
 :pattern ( (|MultiSet#Singleton| r@@0))
)))
(assert (forall ((arg0@@50 Int) (arg1@@28 Int) ) (! (= (type (|sk_apply_TCFraming#condqp2| arg0@@50 arg1@@28)) RefType)
 :qid |funType:sk_apply_TCFraming#condqp2|
 :pattern ( (|sk_apply_TCFraming#condqp2| arg0@@50 arg1@@28))
)))
(assert (forall ((Heap2Heap T@U) (Heap1Heap T@U) (g0@@2 T@U) (g1@@2 T@U) ) (!  (=> (and (and (and (and (= (type Heap2Heap) (MapType0Type RefType)) (= (type Heap1Heap) (MapType0Type RefType))) (= (type g0@@2) (MapType2Type RefType boolType))) (= (type g1@@2) (MapType2Type RefType boolType))) (and (=  (and (U_2_bool (MapType2Select g0@@2 (|sk_apply_TCFraming#condqp2| (|apply_TCFraming#condqp2| Heap2Heap g0@@2 g1@@2) (|apply_TCFraming#condqp2| Heap1Heap g0@@2 g1@@2)))) (< NoPerm (/ (to_real 1) (to_real 2))))  (and (U_2_bool (MapType2Select g0@@2 (|sk_apply_TCFraming#condqp2| (|apply_TCFraming#condqp2| Heap2Heap g0@@2 g1@@2) (|apply_TCFraming#condqp2| Heap1Heap g0@@2 g1@@2)))) (< NoPerm (/ (to_real 1) (to_real 2))))) (=> (and (U_2_bool (MapType2Select g0@@2 (|sk_apply_TCFraming#condqp2| (|apply_TCFraming#condqp2| Heap2Heap g0@@2 g1@@2) (|apply_TCFraming#condqp2| Heap1Heap g0@@2 g1@@2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (= (MapType0Select Heap2Heap (|sk_apply_TCFraming#condqp2| (|apply_TCFraming#condqp2| Heap2Heap g0@@2 g1@@2) (|apply_TCFraming#condqp2| Heap1Heap g0@@2 g1@@2)) next) (MapType0Select Heap1Heap (|sk_apply_TCFraming#condqp2| (|apply_TCFraming#condqp2| Heap2Heap g0@@2 g1@@2) (|apply_TCFraming#condqp2| Heap1Heap g0@@2 g1@@2)) next))))) (= (|apply_TCFraming#condqp2| Heap2Heap g0@@2 g1@@2) (|apply_TCFraming#condqp2| Heap1Heap g0@@2 g1@@2)))
 :qid |stdinbpl.954:15|
 :skolemid |124|
 :pattern ( (|apply_TCFraming#condqp2| Heap2Heap g0@@2 g1@@2) (|apply_TCFraming#condqp2| Heap1Heap g0@@2 g1@@2) (succHeapTrans Heap2Heap Heap1Heap))
)))
(assert (forall ((arg0@@51 Int) (arg1@@29 Int) ) (! (= (type (|sk_apply_TCFraming#condqp3| arg0@@51 arg1@@29)) RefType)
 :qid |funType:sk_apply_TCFraming#condqp3|
 :pattern ( (|sk_apply_TCFraming#condqp3| arg0@@51 arg1@@29))
)))
(assert (forall ((Heap2Heap@@0 T@U) (Heap1Heap@@0 T@U) (g0@@3 T@U) (g1@@3 T@U) ) (!  (=> (and (and (and (and (= (type Heap2Heap@@0) (MapType0Type RefType)) (= (type Heap1Heap@@0) (MapType0Type RefType))) (= (type g0@@3) (MapType2Type RefType boolType))) (= (type g1@@3) (MapType2Type RefType boolType))) (and (=  (and (U_2_bool (MapType2Select g1@@3 (|sk_apply_TCFraming#condqp3| (|apply_TCFraming#condqp3| Heap2Heap@@0 g0@@3 g1@@3) (|apply_TCFraming#condqp3| Heap1Heap@@0 g0@@3 g1@@3)))) (< NoPerm (/ (to_real 1) (to_real 2))))  (and (U_2_bool (MapType2Select g1@@3 (|sk_apply_TCFraming#condqp3| (|apply_TCFraming#condqp3| Heap2Heap@@0 g0@@3 g1@@3) (|apply_TCFraming#condqp3| Heap1Heap@@0 g0@@3 g1@@3)))) (< NoPerm (/ (to_real 1) (to_real 2))))) (=> (and (U_2_bool (MapType2Select g1@@3 (|sk_apply_TCFraming#condqp3| (|apply_TCFraming#condqp3| Heap2Heap@@0 g0@@3 g1@@3) (|apply_TCFraming#condqp3| Heap1Heap@@0 g0@@3 g1@@3)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (= (MapType0Select Heap2Heap@@0 (|sk_apply_TCFraming#condqp3| (|apply_TCFraming#condqp3| Heap2Heap@@0 g0@@3 g1@@3) (|apply_TCFraming#condqp3| Heap1Heap@@0 g0@@3 g1@@3)) next) (MapType0Select Heap1Heap@@0 (|sk_apply_TCFraming#condqp3| (|apply_TCFraming#condqp3| Heap2Heap@@0 g0@@3 g1@@3) (|apply_TCFraming#condqp3| Heap1Heap@@0 g0@@3 g1@@3)) next))))) (= (|apply_TCFraming#condqp3| Heap2Heap@@0 g0@@3 g1@@3) (|apply_TCFraming#condqp3| Heap1Heap@@0 g0@@3 g1@@3)))
 :qid |stdinbpl.964:15|
 :skolemid |125|
 :pattern ( (|apply_TCFraming#condqp3| Heap2Heap@@0 g0@@3 g1@@3) (|apply_TCFraming#condqp3| Heap1Heap@@0 g0@@3 g1@@3) (succHeapTrans Heap2Heap@@0 Heap1Heap@@0))
)))
(assert  (not (IsPredicateField next)))
(assert  (not (IsWandField next)))
(assert (forall ((Heap@@11 T@U) (ExhaleHeap@@3 T@U) (Mask@@8 T@U) ) (!  (=> (and (and (and (= (type Heap@@11) (MapType0Type RefType)) (= (type ExhaleHeap@@3) (MapType0Type RefType))) (= (type Mask@@8) (MapType1Type RefType realType))) (IdenticalOnKnownLocations Heap@@11 ExhaleHeap@@3 Mask@@8)) (succHeap Heap@@11 ExhaleHeap@@3))
 :qid |stdinbpl.83:15|
 :skolemid |10|
 :pattern ( (IdenticalOnKnownLocations Heap@@11 ExhaleHeap@@3 Mask@@8))
)))
(assert (forall ((EG_1@@5 T@U) (U_1 T@U) (M_1 T@U) ) (!  (=> (and (and (and (and (= (type EG_1@@5) (MapType2Type EdgeDomainTypeType boolType)) (= (type U_1) (MapType2Type RefType boolType))) (= (type M_1) (MapType2Type RefType boolType))) (apply_noExit EG_1@@5 U_1 M_1)) (forall ((u_1@@1 T@U) (v_2@@1 T@U) ) (!  (=> (and (and (= (type u_1@@1) RefType) (= (type v_2@@1) RefType)) (and (U_2_bool (MapType2Select M_1 u_1@@1)) (and (U_2_bool (MapType2Select U_1 v_2@@1)) (not (U_2_bool (MapType2Select M_1 v_2@@1)))))) (not (edge EG_1@@5 u_1@@1 v_2@@1)))
 :qid |stdinbpl.687:52|
 :skolemid |86|
 :pattern ( (edge EG_1@@5 u_1@@1 v_2@@1))
 :pattern ( (MapType2Select M_1 u_1@@1) (MapType2Select M_1 v_2@@1))
))) (forall ((u_1_1 T@U) (v_1_1 T@U) ) (!  (=> (and (and (= (type u_1_1) RefType) (= (type v_1_1) RefType)) (and (U_2_bool (MapType2Select M_1 u_1_1)) (and (U_2_bool (MapType2Select U_1 v_1_1)) (not (U_2_bool (MapType2Select M_1 v_1_1)))))) (not (exists_path EG_1@@5 u_1_1 v_1_1)))
 :qid |stdinbpl.690:17|
 :skolemid |87|
 :pattern ( (exists_path EG_1@@5 u_1_1 v_1_1))
 :pattern ( (MapType2Select M_1 u_1_1) (MapType2Select M_1 v_1_1))
)))
 :qid |stdinbpl.685:15|
 :skolemid |88|
 :pattern ( (apply_noExit EG_1@@5 U_1 M_1))
)))
(assert (forall ((a@@10 T@U) (b@@8 T@U) ) (! (let ((T@@18 (MapType2TypeInv0 (type a@@10))))
 (=> (and (= (type a@@10) (MapType2Type T@@18 boolType)) (= (type b@@8) (MapType2Type T@@18 boolType))) (= (|Set#Equal| a@@10 b@@8) (forall ((o@@2 T@U) ) (!  (=> (= (type o@@2) T@@18) (= (U_2_bool (MapType2Select a@@10 o@@2)) (U_2_bool (MapType2Select b@@8 o@@2))))
 :qid |stdinbpl.489:31|
 :skolemid |48|
 :pattern ( (MapType2Select a@@10 o@@2))
 :pattern ( (MapType2Select b@@8 o@@2))
)))))
 :qid |stdinbpl.488:17|
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
 :qid |stdinbpl.554:18|
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
 :qid |stdinbpl.390:15|
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
 :qid |stdinbpl.618:15|
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
(assert (forall ((Heap@@12 T@U) (Mask@@10 T@U) (refs@@3 T@U) ) (!  (=> (and (and (and (= (type Heap@@12) (MapType0Type RefType)) (= (type Mask@@10) (MapType1Type RefType realType))) (= (type refs@@3) (MapType2Type RefType boolType))) (and (state Heap@@12 Mask@@10) (or (< AssumeFunctionsAbove 1) (|$$#trigger| (FrameFragment (int_2_U (|$$#condqp1| Heap@@12 refs@@3))) refs@@3)))) (forall ((p_2@@1 T@U) (s_1@@1 T@U) ) (!  (=> (and (= (type p_2@@1) RefType) (= (type s_1@@1) RefType)) (=  (and (U_2_bool (MapType2Select refs@@3 p_2@@1)) (and (U_2_bool (MapType2Select refs@@3 s_1@@1)) (= (MapType0Select Heap@@12 p_2@@1 next) s_1@@1))) (U_2_bool (MapType2Select (|$$'| Heap@@12 refs@@3) (create_edge p_2@@1 s_1@@1)))))
 :qid |stdinbpl.800:122|
 :skolemid |105|
 :pattern ( (create_edge p_2@@1 s_1@@1))
)))
 :qid |stdinbpl.798:15|
 :skolemid |106|
 :pattern ( (state Heap@@12 Mask@@10) (|$$'| Heap@@12 refs@@3))
)))
(assert (forall ((a@@12 T@U) (b@@10 T@U) (o@@3 T@U) ) (! (let ((T@@20 (type o@@3)))
 (=> (and (= (type a@@12) (MapType2Type T@@20 boolType)) (= (type b@@10) (MapType2Type T@@20 boolType))) (= (U_2_bool (MapType2Select (|Set#Intersection| a@@12 b@@10) o@@3))  (and (U_2_bool (MapType2Select a@@12 o@@3)) (U_2_bool (MapType2Select b@@10 o@@3))))))
 :qid |stdinbpl.453:18|
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
 :qid |stdinbpl.468:18|
 :skolemid |43|
 :pattern ( (MapType2Select (|Set#Difference| a@@13 b@@11) o@@4))
 :pattern ( (|Set#Difference| a@@13 b@@11) (MapType2Select a@@13 o@@4))
)))
(assert (forall ((EG_1@@6 T@U) (p_2@@2 T@U) (s_1@@2 T@U) ) (!  (=> (and (and (= (type EG_1@@6) (MapType2Type EdgeDomainTypeType boolType)) (= (type p_2@@2) RefType)) (= (type s_1@@2) RefType)) (= (edge EG_1@@6 p_2@@2 s_1@@2) (edge_ EG_1@@6 p_2@@2 s_1@@2)))
 :qid |stdinbpl.673:15|
 :skolemid |84|
 :pattern ( (edge EG_1@@6 p_2@@2 s_1@@2))
)))
(assert (forall ((EG_1@@7 T@U) (start_1@@0 T@U) (end_1@@0 T@U) ) (!  (=> (and (and (= (type EG_1@@7) (MapType2Type EdgeDomainTypeType boolType)) (= (type start_1@@0) RefType)) (= (type end_1@@0) RefType)) (= (exists_path EG_1@@7 start_1@@0 end_1@@0) (exists_path_ EG_1@@7 start_1@@0 end_1@@0)))
 :qid |stdinbpl.709:15|
 :skolemid |91|
 :pattern ( (exists_path EG_1@@7 start_1@@0 end_1@@0))
)))
(assert (forall ((a@@14 T@U) (b@@12 T@U) ) (! (let ((T@@23 (MapType2TypeInv0 (type a@@14))))
 (=> (and (and (= (type a@@14) (MapType2Type T@@23 boolType)) (= (type b@@12) (MapType2Type T@@23 boolType))) (|Set#Equal| a@@14 b@@12)) (= a@@14 b@@12)))
 :qid |stdinbpl.490:17|
 :skolemid |50|
 :pattern ( (|Set#Equal| a@@14 b@@12))
)))
(assert (forall ((a@@15 T@U) (b@@13 T@U) ) (! (let ((T@@24 (MultiSetTypeInv0 (type a@@15))))
 (=> (and (and (= (type a@@15) (MultiSetType T@@24)) (= (type b@@13) (MultiSetType T@@24))) (|MultiSet#Equal| a@@15 b@@13)) (= a@@15 b@@13)))
 :qid |stdinbpl.589:17|
 :skolemid |79|
 :pattern ( (|MultiSet#Equal| a@@15 b@@13))
)))
(assert (forall ((arg0@@56 T@U) (arg1@@32 T@U) ) (! (let ((T@@25 (type arg1@@32)))
(= (type (|Set#UnionOne| arg0@@56 arg1@@32)) (MapType2Type T@@25 boolType)))
 :qid |funType:Set#UnionOne|
 :pattern ( (|Set#UnionOne| arg0@@56 arg1@@32))
)))
(assert (forall ((a@@16 T@U) (x@@9 T@U) (y@@3 T@U) ) (! (let ((T@@26 (type x@@9)))
 (=> (and (and (= (type a@@16) (MapType2Type T@@26 boolType)) (= (type y@@3) T@@26)) (U_2_bool (MapType2Select a@@16 y@@3))) (U_2_bool (MapType2Select (|Set#UnionOne| a@@16 x@@9) y@@3))))
 :qid |stdinbpl.433:18|
 :skolemid |31|
 :pattern ( (|Set#UnionOne| a@@16 x@@9) (MapType2Select a@@16 y@@3))
)))
(assert (forall ((a@@17 T@U) (b@@14 T@U) (y@@4 T@U) ) (! (let ((T@@27 (type y@@4)))
 (=> (and (and (= (type a@@17) (MapType2Type T@@27 boolType)) (= (type b@@14) (MapType2Type T@@27 boolType))) (U_2_bool (MapType2Select a@@17 y@@4))) (U_2_bool (MapType2Select (|Set#Union| a@@17 b@@14) y@@4))))
 :qid |stdinbpl.443:18|
 :skolemid |35|
 :pattern ( (|Set#Union| a@@17 b@@14) (MapType2Select a@@17 y@@4))
)))
(assert (forall ((a@@18 T@U) (b@@15 T@U) (y@@5 T@U) ) (! (let ((T@@28 (type y@@5)))
 (=> (and (and (= (type a@@18) (MapType2Type T@@28 boolType)) (= (type b@@15) (MapType2Type T@@28 boolType))) (U_2_bool (MapType2Select b@@15 y@@5))) (U_2_bool (MapType2Select (|Set#Union| a@@18 b@@15) y@@5))))
 :qid |stdinbpl.445:18|
 :skolemid |36|
 :pattern ( (|Set#Union| a@@18 b@@15) (MapType2Select b@@15 y@@5))
)))
(assert (forall ((ms T@U) (x@@10 T@U) ) (! (let ((T@@29 (type x@@10)))
 (=> (= (type ms) (MultiSetType T@@29)) (>= (|MultiSet#Select| ms x@@10) 0)))
 :qid |stdinbpl.520:18|
 :skolemid |56|
 :pattern ( (|MultiSet#Select| ms x@@10))
)))
(assert (forall ((a@@19 T@U) (x@@11 T@U) (o@@5 T@U) ) (! (let ((T@@30 (type x@@11)))
 (=> (and (= (type a@@19) (MapType2Type T@@30 boolType)) (= (type o@@5) T@@30)) (= (U_2_bool (MapType2Select (|Set#UnionOne| a@@19 x@@11) o@@5))  (or (= o@@5 x@@11) (U_2_bool (MapType2Select a@@19 o@@5))))))
 :qid |stdinbpl.429:18|
 :skolemid |29|
 :pattern ( (MapType2Select (|Set#UnionOne| a@@19 x@@11) o@@5))
)))
(assert (forall ((a@@20 T@U) (b@@16 T@U) (y@@6 T@U) ) (! (let ((T@@31 (type y@@6)))
 (=> (and (and (= (type a@@20) (MapType2Type T@@31 boolType)) (= (type b@@16) (MapType2Type T@@31 boolType))) (U_2_bool (MapType2Select b@@16 y@@6))) (not (U_2_bool (MapType2Select (|Set#Difference| a@@20 b@@16) y@@6)))))
 :qid |stdinbpl.470:18|
 :skolemid |44|
 :pattern ( (|Set#Difference| a@@20 b@@16) (MapType2Select b@@16 y@@6))
)))
(assert (forall ((arg0@@57 Int) (arg1@@33 Int) ) (! (= (type (|sk_$$#condqp1| arg0@@57 arg1@@33)) RefType)
 :qid |funType:sk_$$#condqp1|
 :pattern ( (|sk_$$#condqp1| arg0@@57 arg1@@33))
)))
(assert (forall ((Heap2Heap@@1 T@U) (Heap1Heap@@1 T@U) (refs@@4 T@U) ) (!  (=> (and (and (and (= (type Heap2Heap@@1) (MapType0Type RefType)) (= (type Heap1Heap@@1) (MapType0Type RefType))) (= (type refs@@4) (MapType2Type RefType boolType))) (and (=  (and (U_2_bool (MapType2Select refs@@4 (|sk_$$#condqp1| (|$$#condqp1| Heap2Heap@@1 refs@@4) (|$$#condqp1| Heap1Heap@@1 refs@@4)))) (< NoPerm (/ (to_real 1) (to_real 2))))  (and (U_2_bool (MapType2Select refs@@4 (|sk_$$#condqp1| (|$$#condqp1| Heap2Heap@@1 refs@@4) (|$$#condqp1| Heap1Heap@@1 refs@@4)))) (< NoPerm (/ (to_real 1) (to_real 2))))) (=> (and (U_2_bool (MapType2Select refs@@4 (|sk_$$#condqp1| (|$$#condqp1| Heap2Heap@@1 refs@@4) (|$$#condqp1| Heap1Heap@@1 refs@@4)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (= (MapType0Select Heap2Heap@@1 (|sk_$$#condqp1| (|$$#condqp1| Heap2Heap@@1 refs@@4) (|$$#condqp1| Heap1Heap@@1 refs@@4)) next) (MapType0Select Heap1Heap@@1 (|sk_$$#condqp1| (|$$#condqp1| Heap2Heap@@1 refs@@4) (|$$#condqp1| Heap1Heap@@1 refs@@4)) next))))) (= (|$$#condqp1| Heap2Heap@@1 refs@@4) (|$$#condqp1| Heap1Heap@@1 refs@@4)))
 :qid |stdinbpl.792:15|
 :skolemid |104|
 :pattern ( (|$$#condqp1| Heap2Heap@@1 refs@@4) (|$$#condqp1| Heap1Heap@@1 refs@@4) (succHeapTrans Heap2Heap@@1 Heap1Heap@@1))
)))
(assert (forall ((a@@21 T@U) (b@@17 T@U) ) (! (let ((T@@32 (MapType2TypeInv0 (type a@@21))))
 (=> (and (= (type a@@21) (MapType2Type T@@32 boolType)) (= (type b@@17) (MapType2Type T@@32 boolType))) (and (= (+ (+ (|Set#Card| (|Set#Difference| a@@21 b@@17)) (|Set#Card| (|Set#Difference| b@@17 a@@21))) (|Set#Card| (|Set#Intersection| a@@21 b@@17))) (|Set#Card| (|Set#Union| a@@21 b@@17))) (= (|Set#Card| (|Set#Difference| a@@21 b@@17)) (- (|Set#Card| a@@21) (|Set#Card| (|Set#Intersection| a@@21 b@@17)))))))
 :qid |stdinbpl.472:18|
 :skolemid |45|
 :pattern ( (|Set#Card| (|Set#Difference| a@@21 b@@17)))
)))
(assert (forall ((s T@U) ) (! (let ((T@@33 (MapType2TypeInv0 (type s))))
 (=> (= (type s) (MapType2Type T@@33 boolType)) (<= 0 (|Set#Card| s))))
 :qid |stdinbpl.415:18|
 :skolemid |22|
 :pattern ( (|Set#Card| s))
)))
(assert (forall ((s@@0 T@U) ) (! (let ((T@@34 (MultiSetTypeInv0 (type s@@0))))
 (=> (= (type s@@0) (MultiSetType T@@34)) (<= 0 (|MultiSet#Card| s@@0))))
 :qid |stdinbpl.523:18|
 :skolemid |57|
 :pattern ( (|MultiSet#Card| s@@0))
)))
(assert (forall ((T@@35 T@T) ) (! (= (type (|MultiSet#Empty| T@@35)) (MultiSetType T@@35))
 :qid |funType:MultiSet#Empty|
 :pattern ( (|MultiSet#Empty| T@@35))
)))
(assert (forall ((o@@6 T@U) ) (! (let ((T@@36 (type o@@6)))
(= (|MultiSet#Select| (|MultiSet#Empty| T@@36) o@@6) 0))
 :qid |stdinbpl.528:18|
 :skolemid |58|
 :pattern ( (let ((T@@36 (type o@@6)))
(|MultiSet#Select| (|MultiSet#Empty| T@@36) o@@6)))
)))
(assert (forall ((a@@22 T@U) (x@@12 T@U) ) (! (let ((T@@37 (type x@@12)))
 (=> (= (type a@@22) (MapType2Type T@@37 boolType)) (U_2_bool (MapType2Select (|Set#UnionOne| a@@22 x@@12) x@@12))))
 :qid |stdinbpl.431:18|
 :skolemid |30|
 :pattern ( (|Set#UnionOne| a@@22 x@@12))
)))
(assert (forall ((EG_1@@8 T@U) ) (!  (=> (= (type EG_1@@8) (MapType2Type EdgeDomainTypeType boolType)) (= (unshared_graph EG_1@@8) (forall ((v1 T@U) (v2 T@U) (v_2@@2 T@U) ) (!  (=> (and (and (and (= (type v1) RefType) (= (type v2) RefType)) (= (type v_2@@2) RefType)) (and (edge EG_1@@8 v1 v_2@@2) (edge EG_1@@8 v2 v_2@@2))) (= v1 v2))
 :qid |stdinbpl.741:43|
 :skolemid |97|
 :pattern ( (edge EG_1@@8 v1 v_2@@2) (edge EG_1@@8 v2 v_2@@2))
))))
 :qid |stdinbpl.739:15|
 :skolemid |98|
 :pattern ( (unshared_graph EG_1@@8))
)))
(assert (forall ((EG_1@@9 T@U) ) (!  (=> (= (type EG_1@@9) (MapType2Type EdgeDomainTypeType boolType)) (= (func_graph EG_1@@9) (forall ((v1@@0 T@U) (v2@@0 T@U) (v_2@@3 T@U) ) (!  (=> (and (and (and (= (type v1@@0) RefType) (= (type v2@@0) RefType)) (= (type v_2@@3) RefType)) (and (edge EG_1@@9 v_2@@3 v1@@0) (edge EG_1@@9 v_2@@3 v2@@0))) (= v1@@0 v2@@0))
 :qid |stdinbpl.750:39|
 :skolemid |99|
 :pattern ( (edge EG_1@@9 v_2@@3 v1@@0) (edge EG_1@@9 v_2@@3 v2@@0))
))))
 :qid |stdinbpl.748:15|
 :skolemid |100|
 :pattern ( (func_graph EG_1@@9))
)))
(assert (forall ((Heap@@13 T@U) (ExhaleHeap@@4 T@U) (Mask@@11 T@U) (pm_f@@1 T@U) ) (! (let ((C@@1 (FieldTypeInv0 (type pm_f@@1))))
 (=> (and (and (and (and (and (= (type Heap@@13) (MapType0Type RefType)) (= (type ExhaleHeap@@4) (MapType0Type RefType))) (= (type Mask@@11) (MapType1Type RefType realType))) (= (type pm_f@@1) (FieldType C@@1 FrameTypeType))) (IdenticalOnKnownLocations Heap@@13 ExhaleHeap@@4 Mask@@11)) (and (HasDirectPerm Mask@@11 null pm_f@@1) (IsPredicateField pm_f@@1))) (forall ((o2 T@U) (f_2@@0 T@U) ) (! (let ((B@@5 (FieldTypeInv1 (type f_2@@0))))
(let ((A@@6 (FieldTypeInv0 (type f_2@@0))))
 (=> (and (and (= (type o2) RefType) (= (type f_2@@0) (FieldType A@@6 B@@5))) (U_2_bool (MapType1Select (MapType0Select Heap@@13 null (PredicateMaskField pm_f@@1)) o2 f_2@@0))) (= (MapType0Select Heap@@13 o2 f_2@@0) (MapType0Select ExhaleHeap@@4 o2 f_2@@0)))))
 :qid |stdinbpl.54:134|
 :skolemid |3|
 :pattern ( (MapType0Select ExhaleHeap@@4 o2 f_2@@0))
))))
 :qid |stdinbpl.52:19|
 :skolemid |4|
 :pattern ( (IdenticalOnKnownLocations Heap@@13 ExhaleHeap@@4 Mask@@11) (IsPredicateField pm_f@@1))
)))
(assert (forall ((Heap@@14 T@U) (ExhaleHeap@@5 T@U) (Mask@@12 T@U) (pm_f@@2 T@U) ) (! (let ((C@@2 (FieldTypeInv0 (type pm_f@@2))))
 (=> (and (and (and (and (and (= (type Heap@@14) (MapType0Type RefType)) (= (type ExhaleHeap@@5) (MapType0Type RefType))) (= (type Mask@@12) (MapType1Type RefType realType))) (= (type pm_f@@2) (FieldType C@@2 FrameTypeType))) (IdenticalOnKnownLocations Heap@@14 ExhaleHeap@@5 Mask@@12)) (and (HasDirectPerm Mask@@12 null pm_f@@2) (IsWandField pm_f@@2))) (forall ((o2@@0 T@U) (f_2@@1 T@U) ) (! (let ((B@@6 (FieldTypeInv1 (type f_2@@1))))
(let ((A@@7 (FieldTypeInv0 (type f_2@@1))))
 (=> (and (and (= (type o2@@0) RefType) (= (type f_2@@1) (FieldType A@@7 B@@6))) (U_2_bool (MapType1Select (MapType0Select Heap@@14 null (WandMaskField pm_f@@2)) o2@@0 f_2@@1))) (= (MapType0Select Heap@@14 o2@@0 f_2@@1) (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1)))))
 :qid |stdinbpl.67:129|
 :skolemid |6|
 :pattern ( (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1))
))))
 :qid |stdinbpl.65:19|
 :skolemid |7|
 :pattern ( (IdenticalOnKnownLocations Heap@@14 ExhaleHeap@@5 Mask@@12) (IsWandField pm_f@@2))
)))
(assert (forall ((a@@23 T@U) (x@@13 T@U) ) (! (let ((T@@38 (type x@@13)))
 (=> (and (= (type a@@23) (MapType2Type T@@38 boolType)) (U_2_bool (MapType2Select a@@23 x@@13))) (= (|Set#Card| (|Set#UnionOne| a@@23 x@@13)) (|Set#Card| a@@23))))
 :qid |stdinbpl.435:18|
 :skolemid |32|
 :pattern ( (|Set#Card| (|Set#UnionOne| a@@23 x@@13)))
)))
(assert (forall ((a@@24 T@U) (x@@14 T@U) ) (! (let ((T@@39 (type x@@14)))
 (=> (= (type a@@24) (MultiSetType T@@39)) (and (> (|MultiSet#Select| (|MultiSet#UnionOne| a@@24 x@@14) x@@14) 0) (> (|MultiSet#Card| (|MultiSet#UnionOne| a@@24 x@@14)) 0))))
 :qid |stdinbpl.547:18|
 :skolemid |66|
 :pattern ( (|MultiSet#UnionOne| a@@24 x@@14))
)))
(assert (forall ((r@@1 T@U) ) (! (= (|Set#Card| (|Set#Singleton| r@@1)) 1)
 :qid |stdinbpl.426:18|
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
 :qid |stdinbpl.424:18|
 :skolemid |26|
 :pattern ( (|Set#Singleton| r@@2))
)))
(assert (forall ((Heap@@15 T@U) (Mask@@14 T@U) (g0@@4 T@U) (g1@@4 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@15) (MapType0Type RefType)) (= (type Mask@@14) (MapType1Type RefType realType))) (= (type g0@@4) (MapType2Type RefType boolType))) (= (type g1@@4) (MapType2Type RefType boolType))) (and (state Heap@@15 Mask@@14) (or (< AssumeFunctionsAbove 0) (|apply_TCFraming#trigger| (CombineFrames (FrameFragment (int_2_U (|apply_TCFraming#condqp2| Heap@@15 g0@@4 g1@@4))) (FrameFragment (int_2_U (|apply_TCFraming#condqp3| Heap@@15 g0@@4 g1@@4)))) g0@@4 g1@@4)))) (|Set#Equal| (|Set#Intersection| g1@@4 g0@@4) (|Set#Empty| RefType))) (forall ((u_1@@2 T@U) (v_2@@4 T@U) ) (!  (=> (and (and (= (type u_1@@2) RefType) (= (type v_2@@4) RefType)) (and (U_2_bool (MapType2Select g0@@4 u_1@@2)) (and (U_2_bool (MapType2Select g0@@4 v_2@@4)) (exists_path ($$ Heap@@15 g0@@4) u_1@@2 v_2@@4)))) (exists_path ($$ Heap@@15 (|Set#Union| g0@@4 g1@@4)) u_1@@2 v_2@@4))
 :qid |stdinbpl.976:285|
 :skolemid |127|
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| Heap@@15 g0@@4))) g0@@4) u_1@@2 v_2@@4))
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| Heap@@15 (|Set#Union| g0@@4 g1@@4)))) (|Set#Union| g0@@4 g1@@4)) u_1@@2 v_2@@4))
)))
 :qid |stdinbpl.974:15|
 :skolemid |128|
 :pattern ( (state Heap@@15 Mask@@14) (|apply_TCFraming'| Heap@@15 g0@@4 g1@@4))
)))
(assert (forall ((Heap@@16 T@U) (Mask@@15 T@U) (g0@@5 T@U) (g1@@5 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@16) (MapType0Type RefType)) (= (type Mask@@15) (MapType1Type RefType realType))) (= (type g0@@5) (MapType2Type RefType boolType))) (= (type g1@@5) (MapType2Type RefType boolType))) (and (state Heap@@16 Mask@@15) (or (< AssumeFunctionsAbove 0) (|apply_TCFraming#trigger| (CombineFrames (FrameFragment (int_2_U (|apply_TCFraming#condqp2| Heap@@16 g0@@5 g1@@5))) (FrameFragment (int_2_U (|apply_TCFraming#condqp3| Heap@@16 g0@@5 g1@@5)))) g0@@5 g1@@5)))) (|Set#Equal| (|Set#Intersection| g1@@5 g0@@5) (|Set#Empty| RefType))) (forall ((u_1_1@@0 T@U) (v_1_1@@0 T@U) ) (!  (=> (and (and (= (type u_1_1@@0) RefType) (= (type v_1_1@@0) RefType)) (and (U_2_bool (MapType2Select g1@@5 u_1_1@@0)) (and (U_2_bool (MapType2Select g1@@5 v_1_1@@0)) (exists_path ($$ Heap@@16 g1@@5) u_1_1@@0 v_1_1@@0)))) (exists_path ($$ Heap@@16 (|Set#Union| g1@@5 g0@@5)) u_1_1@@0 v_1_1@@0))
 :qid |stdinbpl.983:285|
 :skolemid |129|
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| Heap@@16 g1@@5))) g1@@5) u_1_1@@0 v_1_1@@0))
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| Heap@@16 (|Set#Union| g1@@5 g0@@5)))) (|Set#Union| g1@@5 g0@@5)) u_1_1@@0 v_1_1@@0))
)))
 :qid |stdinbpl.981:15|
 :skolemid |130|
 :pattern ( (state Heap@@16 Mask@@15) (|apply_TCFraming'| Heap@@16 g0@@5 g1@@5))
)))
(assert (forall ((a@@25 T@U) (b@@18 T@U) ) (! (let ((T@@40 (MapType2TypeInv0 (type a@@25))))
 (=> (and (= (type a@@25) (MapType2Type T@@40 boolType)) (= (type b@@18) (MapType2Type T@@40 boolType))) (= (|Set#Union| a@@25 (|Set#Union| a@@25 b@@18)) (|Set#Union| a@@25 b@@18))))
 :qid |stdinbpl.458:18|
 :skolemid |39|
 :pattern ( (|Set#Union| a@@25 (|Set#Union| a@@25 b@@18)))
)))
(assert (forall ((a@@26 T@U) (b@@19 T@U) ) (! (let ((T@@41 (MapType2TypeInv0 (type a@@26))))
 (=> (and (= (type a@@26) (MapType2Type T@@41 boolType)) (= (type b@@19) (MapType2Type T@@41 boolType))) (= (|Set#Intersection| a@@26 (|Set#Intersection| a@@26 b@@19)) (|Set#Intersection| a@@26 b@@19))))
 :qid |stdinbpl.462:18|
 :skolemid |41|
 :pattern ( (|Set#Intersection| a@@26 (|Set#Intersection| a@@26 b@@19)))
)))
(assert (forall ((a@@27 T@U) (b@@20 T@U) ) (! (let ((T@@42 (MultiSetTypeInv0 (type a@@27))))
 (=> (and (= (type a@@27) (MultiSetType T@@42)) (= (type b@@20) (MultiSetType T@@42))) (= (|MultiSet#Intersection| a@@27 (|MultiSet#Intersection| a@@27 b@@20)) (|MultiSet#Intersection| a@@27 b@@20))))
 :qid |stdinbpl.564:18|
 :skolemid |71|
 :pattern ( (|MultiSet#Intersection| a@@27 (|MultiSet#Intersection| a@@27 b@@20)))
)))
(assert (forall ((s@@1 T@U) ) (! (let ((T@@43 (MultiSetTypeInv0 (type s@@1))))
 (=> (= (type s@@1) (MultiSetType T@@43)) (and (= (= (|MultiSet#Card| s@@1) 0) (= s@@1 (|MultiSet#Empty| T@@43))) (=> (not (= (|MultiSet#Card| s@@1) 0)) (exists ((x@@15 T@U) ) (!  (and (= (type x@@15) T@@43) (< 0 (|MultiSet#Select| s@@1 x@@15)))
 :qid |stdinbpl.531:38|
 :skolemid |59|
 :no-pattern (type x@@15)
 :no-pattern (U_2_int x@@15)
 :no-pattern (U_2_bool x@@15)
))))))
 :qid |stdinbpl.529:18|
 :skolemid |60|
 :pattern ( (|MultiSet#Card| s@@1))
)))
(assert (forall ((r@@3 T@U) (o@@7 T@U) ) (! (let ((T@@44 (type r@@3)))
 (=> (= (type o@@7) T@@44) (and (= (= (|MultiSet#Select| (|MultiSet#Singleton| r@@3) o@@7) 1) (= r@@3 o@@7)) (= (= (|MultiSet#Select| (|MultiSet#Singleton| r@@3) o@@7) 0) (not (= r@@3 o@@7))))))
 :qid |stdinbpl.534:18|
 :skolemid |61|
 :pattern ( (|MultiSet#Select| (|MultiSet#Singleton| r@@3) o@@7))
)))
(assert (forall ((o@@8 T@U) (f T@U) (Heap@@17 T@U) ) (!  (=> (and (and (and (= (type o@@8) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap@@17) (MapType0Type RefType))) (U_2_bool (MapType0Select Heap@@17 o@@8 $allocated))) (U_2_bool (MapType0Select Heap@@17 (MapType0Select Heap@@17 o@@8 f) $allocated)))
 :qid |stdinbpl.31:15|
 :skolemid |0|
 :pattern ( (MapType0Select Heap@@17 o@@8 f))
)))
(assert (forall ((a@@28 T@U) (b@@21 T@U) (o@@9 T@U) ) (! (let ((T@@45 (type o@@9)))
 (=> (and (= (type a@@28) (MultiSetType T@@45)) (= (type b@@21) (MultiSetType T@@45))) (= (|MultiSet#Select| (|MultiSet#Union| a@@28 b@@21) o@@9) (+ (|MultiSet#Select| a@@28 o@@9) (|MultiSet#Select| b@@21 o@@9)))))
 :qid |stdinbpl.552:18|
 :skolemid |67|
 :pattern ( (|MultiSet#Select| (|MultiSet#Union| a@@28 b@@21) o@@9))
 :pattern ( (|MultiSet#Union| a@@28 b@@21) (|MultiSet#Select| a@@28 o@@9) (|MultiSet#Select| b@@21 o@@9))
)))
(assert (forall ((o@@10 T@U) ) (! (let ((T@@46 (type o@@10)))
 (not (U_2_bool (MapType2Select (|Set#Empty| T@@46) o@@10))))
 :qid |stdinbpl.418:18|
 :skolemid |23|
 :pattern ( (let ((T@@46 (type o@@10)))
(MapType2Select (|Set#Empty| T@@46) o@@10)))
)))
(assert (forall ((r@@4 T@U) ) (! (let ((T@@47 (type r@@4)))
(= (|MultiSet#Singleton| r@@4) (|MultiSet#UnionOne| (|MultiSet#Empty| T@@47) r@@4)))
 :qid |stdinbpl.537:18|
 :skolemid |63|
 :pattern ( (|MultiSet#Singleton| r@@4))
)))
(assert (forall ((a@@29 Int) (b@@22 Int) ) (! (= (<= a@@29 b@@22) (= (|Math#min| a@@29 b@@22) a@@29))
 :qid |stdinbpl.502:15|
 :skolemid |51|
 :pattern ( (|Math#min| a@@29 b@@22))
)))
(assert (forall ((a@@30 Int) (b@@23 Int) ) (! (= (<= b@@23 a@@30) (= (|Math#min| a@@30 b@@23) b@@23))
 :qid |stdinbpl.503:15|
 :skolemid |52|
 :pattern ( (|Math#min| a@@30 b@@23))
)))
(assert (forall ((s@@2 T@U) ) (! (let ((T@@48 (MapType2TypeInv0 (type s@@2))))
 (=> (= (type s@@2) (MapType2Type T@@48 boolType)) (and (= (= (|Set#Card| s@@2) 0) (= s@@2 (|Set#Empty| T@@48))) (=> (not (= (|Set#Card| s@@2) 0)) (exists ((x@@16 T@U) ) (!  (and (= (type x@@16) T@@48) (U_2_bool (MapType2Select s@@2 x@@16)))
 :qid |stdinbpl.421:33|
 :skolemid |24|
 :no-pattern (type x@@16)
 :no-pattern (U_2_int x@@16)
 :no-pattern (U_2_bool x@@16)
))))))
 :qid |stdinbpl.419:18|
 :skolemid |25|
 :pattern ( (|Set#Card| s@@2))
)))
(assert (forall ((Heap@@18 T@U) (Mask@@16 T@U) (g0@@6 T@U) (g1@@6 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@18) (MapType0Type RefType)) (= (type Mask@@16) (MapType1Type RefType realType))) (= (type g0@@6) (MapType2Type RefType boolType))) (= (type g1@@6) (MapType2Type RefType boolType))) (and (state Heap@@18 Mask@@16) (or (< AssumeFunctionsAbove 0) (|apply_TCFraming#trigger| (CombineFrames (FrameFragment (int_2_U (|apply_TCFraming#condqp2| Heap@@18 g0@@6 g1@@6))) (FrameFragment (int_2_U (|apply_TCFraming#condqp3| Heap@@18 g0@@6 g1@@6)))) g0@@6 g1@@6)))) (|Set#Equal| (|Set#Intersection| g1@@6 g0@@6) (|Set#Empty| RefType))) (|Set#Equal| (|Set#Union| g0@@6 g1@@6) (|Set#Union| g1@@6 g0@@6)))
 :qid |stdinbpl.970:15|
 :skolemid |126|
 :pattern ( (state Heap@@18 Mask@@16) (|apply_TCFraming'| Heap@@18 g0@@6 g1@@6))
)))
(assert (forall ((Heap@@19 T@U) (Mask@@17 T@U) (refs@@5 T@U) ) (!  (=> (and (and (and (= (type Heap@@19) (MapType0Type RefType)) (= (type Mask@@17) (MapType1Type RefType realType))) (= (type refs@@5) (MapType2Type RefType boolType))) (state Heap@@19 Mask@@17)) (= (|$$'| Heap@@19 refs@@5) (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| Heap@@19 refs@@5))) refs@@5)))
 :qid |stdinbpl.782:15|
 :skolemid |103|
 :pattern ( (state Heap@@19 Mask@@17) (|$$'| Heap@@19 refs@@5))
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
 :qid |stdinbpl.481:32|
 :skolemid |46|
 :pattern ( (MapType2Select a@@31 o@@12))
 :pattern ( (MapType2Select b@@24 o@@12))
)))))
 :qid |stdinbpl.480:17|
 :skolemid |47|
 :pattern ( (|Set#Subset| a@@31 b@@24))
)))
(assert (forall ((a@@32 T@U) (x@@17 T@U) ) (! (let ((T@@50 (type x@@17)))
 (=> (and (= (type a@@32) (MapType2Type T@@50 boolType)) (not (U_2_bool (MapType2Select a@@32 x@@17)))) (= (|Set#Card| (|Set#UnionOne| a@@32 x@@17)) (+ (|Set#Card| a@@32) 1))))
 :qid |stdinbpl.437:18|
 :skolemid |33|
 :pattern ( (|Set#Card| (|Set#UnionOne| a@@32 x@@17)))
)))
(assert (forall ((a@@33 T@U) (b@@25 T@U) (o@@13 T@U) ) (! (let ((T@@51 (type o@@13)))
 (=> (and (= (type a@@33) (MultiSetType T@@51)) (= (type b@@25) (MultiSetType T@@51))) (= (|MultiSet#Select| (|MultiSet#Difference| a@@33 b@@25) o@@13) (|Math#clip| (- (|MultiSet#Select| a@@33 o@@13) (|MultiSet#Select| b@@25 o@@13))))))
 :qid |stdinbpl.569:18|
 :skolemid |72|
 :pattern ( (|MultiSet#Select| (|MultiSet#Difference| a@@33 b@@25) o@@13))
)))
(assert (forall ((Heap@@21 T@U) (Mask@@18 T@U) (g0@@7 T@U) (g1@@7 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@21) (MapType0Type RefType)) (= (type Mask@@18) (MapType1Type RefType realType))) (= (type g0@@7) (MapType2Type RefType boolType))) (= (type g1@@7) (MapType2Type RefType boolType))) (state Heap@@21 Mask@@18)) (= (|apply_TCFraming'| Heap@@21 g0@@7 g1@@7) (|apply_TCFraming#frame| (CombineFrames (FrameFragment (int_2_U (|apply_TCFraming#condqp2| Heap@@21 g0@@7 g1@@7))) (FrameFragment (int_2_U (|apply_TCFraming#condqp3| Heap@@21 g0@@7 g1@@7)))) g0@@7 g1@@7)))
 :qid |stdinbpl.944:15|
 :skolemid |123|
 :pattern ( (state Heap@@21 Mask@@18) (|apply_TCFraming'| Heap@@21 g0@@7 g1@@7))
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
 :qid |stdinbpl.397:25|
 :skolemid |20|
 :pattern ( (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r@@5 u))
)))
(assert (forall ((a@@34 Int) ) (!  (=> (< a@@34 0) (= (|Math#clip| a@@34) 0))
 :qid |stdinbpl.508:15|
 :skolemid |55|
 :pattern ( (|Math#clip| a@@34))
)))
(assert (forall ((EG_1@@10 T@U) ) (!  (=> (= (type EG_1@@10) (MapType2Type EdgeDomainTypeType boolType)) (= (acyclic_graph EG_1@@10) (forall ((v1@@1 T@U) (v2@@1 T@U) ) (!  (=> (and (= (type v1@@1) RefType) (= (type v2@@1) RefType)) (or (not (edge EG_1@@10 v1@@1 v2@@1)) (not (exists_path EG_1@@10 v2@@1 v1@@1))))
 :qid |stdinbpl.732:42|
 :skolemid |95|
 :pattern ( (edge EG_1@@10 v1@@1 v2@@1))
 :pattern ( (exists_path EG_1@@10 v2@@1 v1@@1))
))))
 :qid |stdinbpl.730:15|
 :skolemid |96|
 :pattern ( (acyclic_graph EG_1@@10))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
(assert (forall ((a@@35 T@U) (x@@18 T@U) (o@@14 T@U) ) (! (let ((T@@52 (type x@@18)))
 (=> (and (= (type a@@35) (MultiSetType T@@52)) (= (type o@@14) T@@52)) (= (|MultiSet#Select| (|MultiSet#UnionOne| a@@35 x@@18) o@@14) (ite (= x@@18 o@@14) (+ (|MultiSet#Select| a@@35 o@@14) 1) (|MultiSet#Select| a@@35 o@@14)))))
 :qid |stdinbpl.541:18|
 :skolemid |64|
 :pattern ( (|MultiSet#Select| (|MultiSet#UnionOne| a@@35 x@@18) o@@14))
 :pattern ( (|MultiSet#UnionOne| a@@35 x@@18) (|MultiSet#Select| a@@35 o@@14))
)))
(assert (forall ((a@@36 T@U) (b@@26 T@U) ) (! (let ((T@@53 (MultiSetTypeInv0 (type a@@36))))
 (=> (and (= (type a@@36) (MultiSetType T@@53)) (= (type b@@26) (MultiSetType T@@53))) (= (|MultiSet#Equal| a@@36 b@@26) (forall ((o@@15 T@U) ) (!  (=> (= (type o@@15) T@@53) (= (|MultiSet#Select| a@@36 o@@15) (|MultiSet#Select| b@@26 o@@15)))
 :qid |stdinbpl.587:36|
 :skolemid |77|
 :pattern ( (|MultiSet#Select| a@@36 o@@15))
 :pattern ( (|MultiSet#Select| b@@26 o@@15))
)))))
 :qid |stdinbpl.586:17|
 :skolemid |78|
 :pattern ( (|MultiSet#Equal| a@@36 b@@26))
)))
(assert (forall ((a@@37 T@U) (b@@27 T@U) ) (! (let ((T@@54 (MultiSetTypeInv0 (type a@@37))))
 (=> (and (= (type a@@37) (MultiSetType T@@54)) (= (type b@@27) (MultiSetType T@@54))) (= (|MultiSet#Subset| a@@37 b@@27) (forall ((o@@16 T@U) ) (!  (=> (= (type o@@16) T@@54) (<= (|MultiSet#Select| a@@37 o@@16) (|MultiSet#Select| b@@27 o@@16)))
 :qid |stdinbpl.583:37|
 :skolemid |75|
 :pattern ( (|MultiSet#Select| a@@37 o@@16))
 :pattern ( (|MultiSet#Select| b@@27 o@@16))
)))))
 :qid |stdinbpl.582:17|
 :skolemid |76|
 :pattern ( (|MultiSet#Subset| a@@37 b@@27))
)))
(assert (forall ((a@@38 T@U) (b@@28 T@U) (o@@17 T@U) ) (! (let ((T@@55 (type o@@17)))
 (=> (and (= (type a@@38) (MapType2Type T@@55 boolType)) (= (type b@@28) (MapType2Type T@@55 boolType))) (= (U_2_bool (MapType2Select (|Set#Union| a@@38 b@@28) o@@17))  (or (U_2_bool (MapType2Select a@@38 o@@17)) (U_2_bool (MapType2Select b@@28 o@@17))))))
 :qid |stdinbpl.441:18|
 :skolemid |34|
 :pattern ( (MapType2Select (|Set#Union| a@@38 b@@28) o@@17))
)))
(assert (forall ((Heap@@22 T@U) (g0@@8 T@U) (g1@@8 T@U) ) (!  (=> (and (and (= (type Heap@@22) (MapType0Type RefType)) (= (type g0@@8) (MapType2Type RefType boolType))) (= (type g1@@8) (MapType2Type RefType boolType))) (and (= (apply_TCFraming Heap@@22 g0@@8 g1@@8) (|apply_TCFraming'| Heap@@22 g0@@8 g1@@8)) (dummyFunction (bool_2_U (|apply_TCFraming#triggerStateless| g0@@8 g1@@8)))))
 :qid |stdinbpl.933:15|
 :skolemid |121|
 :pattern ( (apply_TCFraming Heap@@22 g0@@8 g1@@8))
)))
(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun ExhaleHeap@3 () T@U)
(declare-fun QPMask@34 () T@U)
(declare-fun g () T@U)
(declare-fun neverTriggered45 (T@U) Bool)
(declare-fun QPMask@30 () T@U)
(declare-fun QPMask@35 () T@U)
(declare-fun neverTriggered46 (T@U) Bool)
(declare-fun QPMask@36 () T@U)
(declare-fun neverTriggered47 (T@U) Bool)
(declare-fun prev_node@0 () T@U)
(declare-fun node@1 () T@U)
(declare-fun node_i@0 () T@U)
(declare-fun prev_i@0 () T@U)
(declare-fun x_1@@0 () T@U)
(declare-fun QPMask@37 () T@U)
(declare-fun neverTriggered44 (T@U) Bool)
(declare-fun n$4_1 () T@U)
(declare-fun QPMask@33 () T@U)
(declare-fun neverTriggered43 (T@U) Bool)
(declare-fun QPMask@32 () T@U)
(declare-fun neverTriggered42 (T@U) Bool)
(declare-fun QPMask@31 () T@U)
(declare-fun neverTriggered41 (T@U) Bool)
(declare-fun j () Int)
(declare-fun count@0 () Int)
(declare-fun i () Int)
(declare-fun n$3_1 () T@U)
(declare-fun qpRange40 (T@U) Bool)
(declare-fun invRecv40 (T@U) T@U)
(declare-fun QPMask@4 () T@U)
(declare-fun n$0_12 () T@U)
(declare-fun ExhaleHeap@10 () T@U)
(declare-fun n$0_10 () T@U)
(declare-fun ExhaleHeap@9 () T@U)
(declare-fun n$0_8 () T@U)
(declare-fun ExhaleHeap@8 () T@U)
(declare-fun n$0_6 () T@U)
(declare-fun ExhaleHeap@5 () T@U)
(declare-fun n$0_20 () T@U)
(declare-fun ExhaleHeap@12 () T@U)
(declare-fun n$0_18 () T@U)
(declare-fun Heap@0 () T@U)
(declare-fun n$0_16 () T@U)
(declare-fun ExhaleHeap@6 () T@U)
(declare-fun n$0_14 () T@U)
(declare-fun n$0_4 () T@U)
(declare-fun ExhaleHeap@4 () T@U)
(declare-fun n$0_2_1 () T@U)
(declare-fun Heap@1 () T@U)
(declare-fun QPMask@28 () T@U)
(declare-fun neverTriggered70 (T@U) Bool)
(declare-fun Mask@21 () T@U)
(declare-fun QPMask@27 () T@U)
(declare-fun neverTriggered69 (T@U) Bool)
(declare-fun node@2 () T@U)
(declare-fun node_i@1 () T@U)
(declare-fun prev_i@1 () T@U)
(declare-fun n$4_5 () T@U)
(declare-fun count@1 () Int)
(declare-fun n$3_5 () T@U)
(declare-fun neverTriggered71 (T@U) Bool)
(declare-fun QPMask@29 () T@U)
(declare-fun qpRange71 (T@U) Bool)
(declare-fun invRecv71 (T@U) T@U)
(declare-fun ExhaleHeap@13 () T@U)
(declare-fun QPMask@26 () T@U)
(declare-fun vexit@0 () T@U)
(declare-fun QPMask@25 () T@U)
(declare-fun Mask@20 () T@U)
(declare-fun qpRange68 (T@U) Bool)
(declare-fun invRecv68 (T@U) T@U)
(declare-fun Mask@19 () T@U)
(declare-fun QPMask@24 () T@U)
(declare-fun neverTriggered67 (T@U) Bool)
(declare-fun qpRange67 (T@U) Bool)
(declare-fun invRecv67 (T@U) T@U)
(declare-fun QPMask@23 () T@U)
(declare-fun Mask@18 () T@U)
(declare-fun qpRange66 (T@U) Bool)
(declare-fun invRecv66 (T@U) T@U)
(declare-fun Mask@17 () T@U)
(declare-fun Mask@16 () T@U)
(declare-fun neverTriggered65 (T@U) Bool)
(declare-fun qpRange65 (T@U) Bool)
(declare-fun invRecv65 (T@U) T@U)
(declare-fun ExhaleHeap@11 () T@U)
(declare-fun QPMask@22 () T@U)
(declare-fun QPMask@21 () T@U)
(declare-fun Mask@15 () T@U)
(declare-fun qpRange60 (T@U) Bool)
(declare-fun invRecv60 (T@U) T@U)
(declare-fun Mask@14 () T@U)
(declare-fun QPMask@20 () T@U)
(declare-fun neverTriggered59 (T@U) Bool)
(declare-fun qpRange59 (T@U) Bool)
(declare-fun invRecv59 (T@U) T@U)
(declare-fun QPMask@19 () T@U)
(declare-fun Mask@13 () T@U)
(declare-fun qpRange58 (T@U) Bool)
(declare-fun invRecv58 (T@U) T@U)
(declare-fun Mask@12 () T@U)
(declare-fun QPMask@18 () T@U)
(declare-fun neverTriggered57 (T@U) Bool)
(declare-fun qpRange57 (T@U) Bool)
(declare-fun invRecv57 (T@U) T@U)
(declare-fun arg_y@0 () T@U)
(declare-fun QPMask@17 () T@U)
(declare-fun Mask@11 () T@U)
(declare-fun qpRange56 (T@U) Bool)
(declare-fun invRecv56 (T@U) T@U)
(declare-fun Mask@10 () T@U)
(declare-fun QPMask@16 () T@U)
(declare-fun neverTriggered55 (T@U) Bool)
(declare-fun qpRange55 (T@U) Bool)
(declare-fun invRecv55 (T@U) T@U)
(declare-fun QPMask@15 () T@U)
(declare-fun Mask@9 () T@U)
(declare-fun qpRange54 (T@U) Bool)
(declare-fun invRecv54 (T@U) T@U)
(declare-fun Mask@8 () T@U)
(declare-fun QPMask@10 () T@U)
(declare-fun neverTriggered53 (T@U) Bool)
(declare-fun qpRange53 (T@U) Bool)
(declare-fun invRecv53 (T@U) T@U)
(declare-fun ExhaleHeap@7 () T@U)
(declare-fun QPMask@14 () T@U)
(declare-fun QPMask@13 () T@U)
(declare-fun Mask@7 () T@U)
(declare-fun qpRange64 (T@U) Bool)
(declare-fun invRecv64 (T@U) T@U)
(declare-fun Mask@6 () T@U)
(declare-fun QPMask@12 () T@U)
(declare-fun neverTriggered63 (T@U) Bool)
(declare-fun qpRange63 (T@U) Bool)
(declare-fun invRecv63 (T@U) T@U)
(declare-fun QPMask@11 () T@U)
(declare-fun Mask@5 () T@U)
(declare-fun qpRange62 (T@U) Bool)
(declare-fun invRecv62 (T@U) T@U)
(declare-fun Mask@4 () T@U)
(declare-fun neverTriggered61 (T@U) Bool)
(declare-fun qpRange61 (T@U) Bool)
(declare-fun invRecv61 (T@U) T@U)
(declare-fun QPMask@9 () T@U)
(declare-fun Mask@3 () T@U)
(declare-fun qpRange52 (T@U) Bool)
(declare-fun invRecv52 (T@U) T@U)
(declare-fun Mask@2 () T@U)
(declare-fun QPMask@8 () T@U)
(declare-fun neverTriggered51 (T@U) Bool)
(declare-fun qpRange51 (T@U) Bool)
(declare-fun invRecv51 (T@U) T@U)
(declare-fun QPMask@7 () T@U)
(declare-fun Mask@1 () T@U)
(declare-fun qpRange50 (T@U) Bool)
(declare-fun invRecv50 (T@U) T@U)
(declare-fun Mask@0 () T@U)
(declare-fun QPMask@5 () T@U)
(declare-fun neverTriggered49 (T@U) Bool)
(declare-fun qpRange49 (T@U) Bool)
(declare-fun invRecv49 (T@U) T@U)
(declare-fun node_j () T@U)
(declare-fun prev_j () T@U)
(declare-fun vexit () T@U)
(declare-fun qpRange48 (T@U) Bool)
(declare-fun invRecv48 (T@U) T@U)
(declare-fun QPMask@6 () T@U)
(declare-fun qpRange72 (T@U) Bool)
(declare-fun invRecv72 (T@U) T@U)
(declare-fun Heap@@23 () T@U)
(declare-fun node@0 () T@U)
(declare-fun n$4 () T@U)
(declare-fun n$3 () T@U)
(declare-fun QPMask@0 () T@U)
(declare-fun prev_node () T@U)
(declare-fun node () T@U)
(declare-fun prev_i () T@U)
(declare-fun node_i () T@U)
(declare-fun neverTriggered39 (T@U) Bool)
(declare-fun qpRange39 (T@U) Bool)
(declare-fun invRecv39 (T@U) T@U)
(declare-fun QPMask@38 () T@U)
(declare-fun neverTriggered38 (T@U) Bool)
(declare-fun n$1 () T@U)
(declare-fun QPMask@3 () T@U)
(declare-fun neverTriggered37 (T@U) Bool)
(declare-fun QPMask@2 () T@U)
(declare-fun neverTriggered36 (T@U) Bool)
(declare-fun QPMask@1 () T@U)
(declare-fun neverTriggered35 (T@U) Bool)
(declare-fun n$0_3 () T@U)
(declare-fun qpRange34 (T@U) Bool)
(declare-fun invRecv34 (T@U) T@U)
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (= (type g) (MapType2Type RefType boolType)) (= (type n$0_3) RefType)) (= (type Heap@@23) (MapType0Type RefType))) (= (type QPMask@0) (MapType1Type RefType realType))) (= (type QPMask@1) (MapType1Type RefType realType))) (= (type QPMask@2) (MapType1Type RefType realType))) (= (type QPMask@3) (MapType1Type RefType realType))) (= (type n$1) RefType)) (= (type QPMask@38) (MapType1Type RefType realType))) (= (type n$3) RefType)) (= (type n$4) RefType)) (= (type x_1@@0) RefType)) (= (type node@1) RefType)) (= (type ExhaleHeap@3) (MapType0Type RefType))) (= (type QPMask@6) (MapType1Type RefType realType))) (= (type prev_node@0) RefType)) (= (type node_i@0) RefType)) (= (type prev_i@0) RefType)) (= (type QPMask@4) (MapType1Type RefType realType))) (forall ((arg0@@58 T@U) ) (! (= (type (invRecv72 arg0@@58)) RefType)
 :qid |funType:invRecv72|
 :pattern ( (invRecv72 arg0@@58))
))) (= (type n$3_5) RefType)) (= (type Heap@1) (MapType0Type RefType))) (= (type n$4_5) RefType)) (= (type node@2) RefType)) (= (type node_i@1) RefType)) (= (type prev_i@1) RefType)) (= (type Mask@21) (MapType1Type RefType realType))) (= (type QPMask@29) (MapType1Type RefType realType))) (forall ((arg0@@59 T@U) ) (! (= (type (invRecv71 arg0@@59)) RefType)
 :qid |funType:invRecv71|
 :pattern ( (invRecv71 arg0@@59))
))) (= (type QPMask@27) (MapType1Type RefType realType))) (= (type QPMask@28) (MapType1Type RefType realType))) (= (type QPMask@5) (MapType1Type RefType realType))) (= (type n$0_2_1) RefType)) (= (type n$0_4) RefType)) (= (type ExhaleHeap@4) (MapType0Type RefType))) (= (type n$0_14) RefType)) (= (type ExhaleHeap@5) (MapType0Type RefType))) (= (type n$0_16) RefType)) (= (type ExhaleHeap@6) (MapType0Type RefType))) (= (type n$0_18) RefType)) (= (type Heap@0) (MapType0Type RefType))) (= (type n$0_20) RefType)) (= (type ExhaleHeap@12) (MapType0Type RefType))) (= (type ExhaleHeap@13) (MapType0Type RefType))) (= (type QPMask@26) (MapType1Type RefType realType))) (= (type vexit@0) RefType)) (= (type QPMask@25) (MapType1Type RefType realType))) (= (type Mask@20) (MapType1Type RefType realType))) (forall ((arg0@@60 T@U) ) (! (= (type (invRecv68 arg0@@60)) RefType)
 :qid |funType:invRecv68|
 :pattern ( (invRecv68 arg0@@60))
))) (= (type Mask@19) (MapType1Type RefType realType))) (= (type QPMask@24) (MapType1Type RefType realType))) (forall ((arg0@@61 T@U) ) (! (= (type (invRecv67 arg0@@61)) RefType)
 :qid |funType:invRecv67|
 :pattern ( (invRecv67 arg0@@61))
))) (= (type QPMask@23) (MapType1Type RefType realType))) (= (type Mask@18) (MapType1Type RefType realType))) (forall ((arg0@@62 T@U) ) (! (= (type (invRecv66 arg0@@62)) RefType)
 :qid |funType:invRecv66|
 :pattern ( (invRecv66 arg0@@62))
))) (= (type Mask@17) (MapType1Type RefType realType))) (= (type Mask@16) (MapType1Type RefType realType))) (forall ((arg0@@63 T@U) ) (! (= (type (invRecv65 arg0@@63)) RefType)
 :qid |funType:invRecv65|
 :pattern ( (invRecv65 arg0@@63))
))) (= (type ExhaleHeap@7) (MapType0Type RefType))) (= (type QPMask@14) (MapType1Type RefType realType))) (= (type QPMask@13) (MapType1Type RefType realType))) (= (type Mask@7) (MapType1Type RefType realType))) (forall ((arg0@@64 T@U) ) (! (= (type (invRecv64 arg0@@64)) RefType)
 :qid |funType:invRecv64|
 :pattern ( (invRecv64 arg0@@64))
))) (= (type Mask@6) (MapType1Type RefType realType))) (= (type QPMask@12) (MapType1Type RefType realType))) (forall ((arg0@@65 T@U) ) (! (= (type (invRecv63 arg0@@65)) RefType)
 :qid |funType:invRecv63|
 :pattern ( (invRecv63 arg0@@65))
))) (= (type QPMask@11) (MapType1Type RefType realType))) (= (type Mask@5) (MapType1Type RefType realType))) (forall ((arg0@@66 T@U) ) (! (= (type (invRecv62 arg0@@66)) RefType)
 :qid |funType:invRecv62|
 :pattern ( (invRecv62 arg0@@66))
))) (= (type Mask@4) (MapType1Type RefType realType))) (= (type QPMask@10) (MapType1Type RefType realType))) (forall ((arg0@@67 T@U) ) (! (= (type (invRecv61 arg0@@67)) RefType)
 :qid |funType:invRecv61|
 :pattern ( (invRecv61 arg0@@67))
))) (= (type n$0_6) RefType)) (= (type n$0_8) RefType)) (= (type ExhaleHeap@8) (MapType0Type RefType))) (= (type n$0_10) RefType)) (= (type ExhaleHeap@9) (MapType0Type RefType))) (= (type n$0_12) RefType)) (= (type ExhaleHeap@10) (MapType0Type RefType))) (= (type ExhaleHeap@11) (MapType0Type RefType))) (= (type QPMask@22) (MapType1Type RefType realType))) (= (type QPMask@21) (MapType1Type RefType realType))) (= (type Mask@15) (MapType1Type RefType realType))) (forall ((arg0@@68 T@U) ) (! (= (type (invRecv60 arg0@@68)) RefType)
 :qid |funType:invRecv60|
 :pattern ( (invRecv60 arg0@@68))
))) (= (type Mask@14) (MapType1Type RefType realType))) (= (type QPMask@20) (MapType1Type RefType realType))) (forall ((arg0@@69 T@U) ) (! (= (type (invRecv59 arg0@@69)) RefType)
 :qid |funType:invRecv59|
 :pattern ( (invRecv59 arg0@@69))
))) (= (type QPMask@19) (MapType1Type RefType realType))) (= (type Mask@13) (MapType1Type RefType realType))) (forall ((arg0@@70 T@U) ) (! (= (type (invRecv58 arg0@@70)) RefType)
 :qid |funType:invRecv58|
 :pattern ( (invRecv58 arg0@@70))
))) (= (type Mask@12) (MapType1Type RefType realType))) (= (type QPMask@18) (MapType1Type RefType realType))) (forall ((arg0@@71 T@U) ) (! (= (type (invRecv57 arg0@@71)) RefType)
 :qid |funType:invRecv57|
 :pattern ( (invRecv57 arg0@@71))
))) (= (type arg_y@0) RefType)) (= (type QPMask@17) (MapType1Type RefType realType))) (= (type Mask@11) (MapType1Type RefType realType))) (forall ((arg0@@72 T@U) ) (! (= (type (invRecv56 arg0@@72)) RefType)
 :qid |funType:invRecv56|
 :pattern ( (invRecv56 arg0@@72))
))) (= (type Mask@10) (MapType1Type RefType realType))) (= (type QPMask@16) (MapType1Type RefType realType))) (forall ((arg0@@73 T@U) ) (! (= (type (invRecv55 arg0@@73)) RefType)
 :qid |funType:invRecv55|
 :pattern ( (invRecv55 arg0@@73))
))) (= (type QPMask@15) (MapType1Type RefType realType))) (= (type Mask@9) (MapType1Type RefType realType))) (forall ((arg0@@74 T@U) ) (! (= (type (invRecv54 arg0@@74)) RefType)
 :qid |funType:invRecv54|
 :pattern ( (invRecv54 arg0@@74))
))) (= (type Mask@8) (MapType1Type RefType realType))) (forall ((arg0@@75 T@U) ) (! (= (type (invRecv53 arg0@@75)) RefType)
 :qid |funType:invRecv53|
 :pattern ( (invRecv53 arg0@@75))
))) (= (type QPMask@9) (MapType1Type RefType realType))) (= (type Mask@3) (MapType1Type RefType realType))) (forall ((arg0@@76 T@U) ) (! (= (type (invRecv52 arg0@@76)) RefType)
 :qid |funType:invRecv52|
 :pattern ( (invRecv52 arg0@@76))
))) (= (type Mask@2) (MapType1Type RefType realType))) (= (type QPMask@8) (MapType1Type RefType realType))) (forall ((arg0@@77 T@U) ) (! (= (type (invRecv51 arg0@@77)) RefType)
 :qid |funType:invRecv51|
 :pattern ( (invRecv51 arg0@@77))
))) (= (type QPMask@7) (MapType1Type RefType realType))) (= (type Mask@1) (MapType1Type RefType realType))) (forall ((arg0@@78 T@U) ) (! (= (type (invRecv50 arg0@@78)) RefType)
 :qid |funType:invRecv50|
 :pattern ( (invRecv50 arg0@@78))
))) (= (type Mask@0) (MapType1Type RefType realType))) (forall ((arg0@@79 T@U) ) (! (= (type (invRecv49 arg0@@79)) RefType)
 :qid |funType:invRecv49|
 :pattern ( (invRecv49 arg0@@79))
))) (= (type node_j) RefType)) (= (type prev_j) RefType)) (= (type vexit) RefType)) (forall ((arg0@@80 T@U) ) (! (= (type (invRecv48 arg0@@80)) RefType)
 :qid |funType:invRecv48|
 :pattern ( (invRecv48 arg0@@80))
))) (= (type n$3_1) RefType)) (= (type QPMask@30) (MapType1Type RefType realType))) (= (type QPMask@31) (MapType1Type RefType realType))) (= (type QPMask@32) (MapType1Type RefType realType))) (= (type QPMask@33) (MapType1Type RefType realType))) (= (type n$4_1) RefType)) (= (type QPMask@37) (MapType1Type RefType realType))) (= (type QPMask@36) (MapType1Type RefType realType))) (= (type QPMask@35) (MapType1Type RefType realType))) (= (type QPMask@34) (MapType1Type RefType realType))) (forall ((arg0@@81 T@U) ) (! (= (type (invRecv40 arg0@@81)) RefType)
 :qid |funType:invRecv40|
 :pattern ( (invRecv40 arg0@@81))
))) (= (type node@0) RefType)) (= (type prev_node) RefType)) (= (type node) RefType)) (= (type prev_i) RefType)) (= (type node_i) RefType)) (forall ((arg0@@82 T@U) ) (! (= (type (invRecv39 arg0@@82)) RefType)
 :qid |funType:invRecv39|
 :pattern ( (invRecv39 arg0@@82))
))) (forall ((arg0@@83 T@U) ) (! (= (type (invRecv34 arg0@@83)) RefType)
 :qid |funType:invRecv34|
 :pattern ( (invRecv34 arg0@@83))
))))
(set-info :boogie-vc-id swap)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 526) (let ((anon315_Then_correct  (and (=> (= (ControlFlow 0 455) (- 0 457)) (forall ((n_10 T@U) ) (!  (=> (= (type n_10) RefType) (=> (and (U_2_bool (MapType2Select g n_10)) (dummyFunction (MapType0Select ExhaleHeap@3 n_10 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.4122:27|
 :skolemid |457|
 :pattern ( (MapType0Select ExhaleHeap@3 n_10 next))
 :pattern ( (MapType1Select QPMask@34 n_10 next))
 :pattern ( (MapType0Select ExhaleHeap@3 n_10 next))
))) (=> (forall ((n_10@@0 T@U) ) (!  (=> (= (type n_10@@0) RefType) (=> (and (U_2_bool (MapType2Select g n_10@@0)) (dummyFunction (MapType0Select ExhaleHeap@3 n_10@@0 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.4122:27|
 :skolemid |457|
 :pattern ( (MapType0Select ExhaleHeap@3 n_10@@0 next))
 :pattern ( (MapType1Select QPMask@34 n_10@@0 next))
 :pattern ( (MapType0Select ExhaleHeap@3 n_10@@0 next))
)) (and (=> (= (ControlFlow 0 455) (- 0 456)) (forall ((n_10@@1 T@U) (n_10_1 T@U) ) (!  (=> (and (= (type n_10@@1) RefType) (= (type n_10_1) RefType)) (=> (and (and (and (and (not (= n_10@@1 n_10_1)) (U_2_bool (MapType2Select g n_10@@1))) (U_2_bool (MapType2Select g n_10_1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_10@@1 n_10_1))))
 :qid |stdinbpl.4129:27|
 :skolemid |458|
 :pattern ( (neverTriggered45 n_10@@1) (neverTriggered45 n_10_1))
))) (=> (forall ((n_10@@2 T@U) (n_10_1@@0 T@U) ) (!  (=> (and (= (type n_10@@2) RefType) (= (type n_10_1@@0) RefType)) (=> (and (and (and (and (not (= n_10@@2 n_10_1@@0)) (U_2_bool (MapType2Select g n_10@@2))) (U_2_bool (MapType2Select g n_10_1@@0))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_10@@2 n_10_1@@0))))
 :qid |stdinbpl.4129:27|
 :skolemid |458|
 :pattern ( (neverTriggered45 n_10@@2) (neverTriggered45 n_10_1@@0))
)) (=> (= (ControlFlow 0 455) (- 0 454)) (forall ((n_10@@3 T@U) ) (!  (=> (and (= (type n_10@@3) RefType) (U_2_bool (MapType2Select g n_10@@3))) (>= (U_2_real (MapType1Select QPMask@30 n_10@@3 next)) (/ (to_real 1) (to_real 2))))
 :qid |stdinbpl.4136:27|
 :skolemid |459|
 :pattern ( (MapType0Select ExhaleHeap@3 n_10@@3 next))
 :pattern ( (MapType1Select QPMask@34 n_10@@3 next))
 :pattern ( (MapType0Select ExhaleHeap@3 n_10@@3 next))
)))))))))
(let ((anon317_Then_correct  (and (=> (= (ControlFlow 0 447) (- 0 449)) (forall ((n_11 T@U) ) (!  (=> (= (type n_11) RefType) (=> (and (U_2_bool (MapType2Select g n_11)) (dummyFunction (MapType0Select ExhaleHeap@3 n_11 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.4185:27|
 :skolemid |464|
 :pattern ( (MapType0Select ExhaleHeap@3 n_11 next))
 :pattern ( (MapType1Select QPMask@35 n_11 next))
 :pattern ( (MapType0Select ExhaleHeap@3 n_11 next))
))) (=> (forall ((n_11@@0 T@U) ) (!  (=> (= (type n_11@@0) RefType) (=> (and (U_2_bool (MapType2Select g n_11@@0)) (dummyFunction (MapType0Select ExhaleHeap@3 n_11@@0 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.4185:27|
 :skolemid |464|
 :pattern ( (MapType0Select ExhaleHeap@3 n_11@@0 next))
 :pattern ( (MapType1Select QPMask@35 n_11@@0 next))
 :pattern ( (MapType0Select ExhaleHeap@3 n_11@@0 next))
)) (and (=> (= (ControlFlow 0 447) (- 0 448)) (forall ((n_11@@1 T@U) (n_11_1 T@U) ) (!  (=> (and (= (type n_11@@1) RefType) (= (type n_11_1) RefType)) (=> (and (and (and (and (not (= n_11@@1 n_11_1)) (U_2_bool (MapType2Select g n_11@@1))) (U_2_bool (MapType2Select g n_11_1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_11@@1 n_11_1))))
 :qid |stdinbpl.4192:27|
 :skolemid |465|
 :pattern ( (neverTriggered46 n_11@@1) (neverTriggered46 n_11_1))
))) (=> (forall ((n_11@@2 T@U) (n_11_1@@0 T@U) ) (!  (=> (and (= (type n_11@@2) RefType) (= (type n_11_1@@0) RefType)) (=> (and (and (and (and (not (= n_11@@2 n_11_1@@0)) (U_2_bool (MapType2Select g n_11@@2))) (U_2_bool (MapType2Select g n_11_1@@0))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_11@@2 n_11_1@@0))))
 :qid |stdinbpl.4192:27|
 :skolemid |465|
 :pattern ( (neverTriggered46 n_11@@2) (neverTriggered46 n_11_1@@0))
)) (=> (= (ControlFlow 0 447) (- 0 446)) (forall ((n_11@@3 T@U) ) (!  (=> (and (= (type n_11@@3) RefType) (U_2_bool (MapType2Select g n_11@@3))) (>= (U_2_real (MapType1Select QPMask@30 n_11@@3 next)) (/ (to_real 1) (to_real 2))))
 :qid |stdinbpl.4199:27|
 :skolemid |466|
 :pattern ( (MapType0Select ExhaleHeap@3 n_11@@3 next))
 :pattern ( (MapType1Select QPMask@35 n_11@@3 next))
 :pattern ( (MapType0Select ExhaleHeap@3 n_11@@3 next))
)))))))))
(let ((anon319_Then_correct  (and (=> (= (ControlFlow 0 439) (- 0 441)) (forall ((n_12 T@U) ) (!  (=> (= (type n_12) RefType) (=> (and (U_2_bool (MapType2Select g n_12)) (dummyFunction (MapType0Select ExhaleHeap@3 n_12 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.4248:27|
 :skolemid |471|
 :pattern ( (MapType0Select ExhaleHeap@3 n_12 next))
 :pattern ( (MapType1Select QPMask@36 n_12 next))
 :pattern ( (MapType0Select ExhaleHeap@3 n_12 next))
))) (=> (forall ((n_12@@0 T@U) ) (!  (=> (= (type n_12@@0) RefType) (=> (and (U_2_bool (MapType2Select g n_12@@0)) (dummyFunction (MapType0Select ExhaleHeap@3 n_12@@0 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.4248:27|
 :skolemid |471|
 :pattern ( (MapType0Select ExhaleHeap@3 n_12@@0 next))
 :pattern ( (MapType1Select QPMask@36 n_12@@0 next))
 :pattern ( (MapType0Select ExhaleHeap@3 n_12@@0 next))
)) (and (=> (= (ControlFlow 0 439) (- 0 440)) (forall ((n_12@@1 T@U) (n_12_1 T@U) ) (!  (=> (and (= (type n_12@@1) RefType) (= (type n_12_1) RefType)) (=> (and (and (and (and (not (= n_12@@1 n_12_1)) (U_2_bool (MapType2Select g n_12@@1))) (U_2_bool (MapType2Select g n_12_1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_12@@1 n_12_1))))
 :qid |stdinbpl.4255:27|
 :skolemid |472|
 :pattern ( (neverTriggered47 n_12@@1) (neverTriggered47 n_12_1))
))) (=> (forall ((n_12@@2 T@U) (n_12_1@@0 T@U) ) (!  (=> (and (= (type n_12@@2) RefType) (= (type n_12_1@@0) RefType)) (=> (and (and (and (and (not (= n_12@@2 n_12_1@@0)) (U_2_bool (MapType2Select g n_12@@2))) (U_2_bool (MapType2Select g n_12_1@@0))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_12@@2 n_12_1@@0))))
 :qid |stdinbpl.4255:27|
 :skolemid |472|
 :pattern ( (neverTriggered47 n_12@@2) (neverTriggered47 n_12_1@@0))
)) (=> (= (ControlFlow 0 439) (- 0 438)) (forall ((n_12@@3 T@U) ) (!  (=> (and (= (type n_12@@3) RefType) (U_2_bool (MapType2Select g n_12@@3))) (>= (U_2_real (MapType1Select QPMask@30 n_12@@3 next)) (/ (to_real 1) (to_real 2))))
 :qid |stdinbpl.4262:27|
 :skolemid |473|
 :pattern ( (MapType0Select ExhaleHeap@3 n_12@@3 next))
 :pattern ( (MapType1Select QPMask@36 n_12@@3 next))
 :pattern ( (MapType0Select ExhaleHeap@3 n_12@@3 next))
)))))))))
(let ((anon81_correct true))
(let ((anon319_Else_correct  (=> (and (exists_path ($$ ExhaleHeap@3 g) prev_node@0 node@1) (= (ControlFlow 0 442) 436)) anon81_correct)))
(let ((anon318_Then_correct  (=> (and (not (= node@1 null)) (state ExhaleHeap@3 QPMask@30)) (and (=> (= (ControlFlow 0 443) 439) anon319_Then_correct) (=> (= (ControlFlow 0 443) 442) anon319_Else_correct)))))
(let ((anon318_Else_correct  (=> (and (= node@1 null) (= (ControlFlow 0 437) 436)) anon81_correct)))
(let ((anon77_correct  (=> (state ExhaleHeap@3 QPMask@30) (and (=> (= (ControlFlow 0 444) 443) anon318_Then_correct) (=> (= (ControlFlow 0 444) 437) anon318_Else_correct)))))
(let ((anon317_Else_correct  (=> (and (exists_path ($$ ExhaleHeap@3 g) node_i@0 prev_node@0) (= (ControlFlow 0 450) 444)) anon77_correct)))
(let ((anon316_Then_correct  (=> (and (not (= node_i@0 null)) (state ExhaleHeap@3 QPMask@30)) (and (=> (= (ControlFlow 0 451) 447) anon317_Then_correct) (=> (= (ControlFlow 0 451) 450) anon317_Else_correct)))))
(let ((anon316_Else_correct  (=> (and (= node_i@0 null) (= (ControlFlow 0 445) 444)) anon77_correct)))
(let ((anon73_correct  (=> (state ExhaleHeap@3 QPMask@30) (and (=> (= (ControlFlow 0 452) 451) anon316_Then_correct) (=> (= (ControlFlow 0 452) 445) anon316_Else_correct)))))
(let ((anon315_Else_correct  (=> (and (exists_path ($$ ExhaleHeap@3 g) prev_i@0 node_i@0) (= (ControlFlow 0 458) 452)) anon73_correct)))
(let ((anon314_Then_correct  (=> (and (not (= node_i@0 null)) (state ExhaleHeap@3 QPMask@30)) (and (=> (= (ControlFlow 0 459) 455) anon315_Then_correct) (=> (= (ControlFlow 0 459) 458) anon315_Else_correct)))))
(let ((anon314_Else_correct  (=> (and (= node_i@0 null) (= (ControlFlow 0 453) 452)) anon73_correct)))
(let ((anon311_Else_correct  (=> (and (forall ((n$4_3 T@U) ) (!  (=> (and (= (type n$4_3) RefType) (U_2_bool (MapType2Select g n$4_3))) (exists_path ($$ ExhaleHeap@3 g) x_1@@0 n$4_3))
 :qid |stdinbpl.4105:24|
 :skolemid |456|
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| ExhaleHeap@3 g))) g) x_1@@0 n$4_3))
)) (state ExhaleHeap@3 QPMask@30)) (and (=> (= (ControlFlow 0 460) 459) anon314_Then_correct) (=> (= (ControlFlow 0 460) 453) anon314_Else_correct)))))
(let ((anon313_Then_correct  (and (=> (= (ControlFlow 0 432) (- 0 434)) (forall ((n_9 T@U) ) (!  (=> (= (type n_9) RefType) (=> (and (U_2_bool (MapType2Select g n_9)) (dummyFunction (MapType0Select ExhaleHeap@3 n_9 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.4054:29|
 :skolemid |449|
 :pattern ( (MapType0Select ExhaleHeap@3 n_9 next))
 :pattern ( (MapType1Select QPMask@37 n_9 next))
 :pattern ( (MapType0Select ExhaleHeap@3 n_9 next))
))) (=> (forall ((n_9@@0 T@U) ) (!  (=> (= (type n_9@@0) RefType) (=> (and (U_2_bool (MapType2Select g n_9@@0)) (dummyFunction (MapType0Select ExhaleHeap@3 n_9@@0 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.4054:29|
 :skolemid |449|
 :pattern ( (MapType0Select ExhaleHeap@3 n_9@@0 next))
 :pattern ( (MapType1Select QPMask@37 n_9@@0 next))
 :pattern ( (MapType0Select ExhaleHeap@3 n_9@@0 next))
)) (and (=> (= (ControlFlow 0 432) (- 0 433)) (forall ((n_9@@1 T@U) (n_9_1 T@U) ) (!  (=> (and (= (type n_9@@1) RefType) (= (type n_9_1) RefType)) (=> (and (and (and (and (not (= n_9@@1 n_9_1)) (U_2_bool (MapType2Select g n_9@@1))) (U_2_bool (MapType2Select g n_9_1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_9@@1 n_9_1))))
 :qid |stdinbpl.4061:29|
 :skolemid |450|
 :pattern ( (neverTriggered44 n_9@@1) (neverTriggered44 n_9_1))
))) (=> (forall ((n_9@@2 T@U) (n_9_1@@0 T@U) ) (!  (=> (and (= (type n_9@@2) RefType) (= (type n_9_1@@0) RefType)) (=> (and (and (and (and (not (= n_9@@2 n_9_1@@0)) (U_2_bool (MapType2Select g n_9@@2))) (U_2_bool (MapType2Select g n_9_1@@0))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_9@@2 n_9_1@@0))))
 :qid |stdinbpl.4061:29|
 :skolemid |450|
 :pattern ( (neverTriggered44 n_9@@2) (neverTriggered44 n_9_1@@0))
)) (=> (= (ControlFlow 0 432) (- 0 431)) (forall ((n_9@@3 T@U) ) (!  (=> (and (= (type n_9@@3) RefType) (U_2_bool (MapType2Select g n_9@@3))) (>= (U_2_real (MapType1Select QPMask@30 n_9@@3 next)) (/ (to_real 1) (to_real 2))))
 :qid |stdinbpl.4068:29|
 :skolemid |451|
 :pattern ( (MapType0Select ExhaleHeap@3 n_9@@3 next))
 :pattern ( (MapType1Select QPMask@37 n_9@@3 next))
 :pattern ( (MapType0Select ExhaleHeap@3 n_9@@3 next))
)))))))))
(let ((anon68_correct true))
(let ((anon312_Then_correct  (=> (U_2_bool (MapType2Select g n$4_1)) (and (=> (= (ControlFlow 0 435) 432) anon313_Then_correct) (=> (= (ControlFlow 0 435) 429) anon68_correct)))))
(let ((anon312_Else_correct  (=> (and (not (U_2_bool (MapType2Select g n$4_1))) (= (ControlFlow 0 430) 429)) anon68_correct)))
(let ((anon310_Else_correct  (=> (unshared_graph ($$ ExhaleHeap@3 g)) (=> (and (state ExhaleHeap@3 QPMask@30) (state ExhaleHeap@3 QPMask@30)) (and (and (=> (= (ControlFlow 0 461) 460) anon311_Else_correct) (=> (= (ControlFlow 0 461) 435) anon312_Then_correct)) (=> (= (ControlFlow 0 461) 430) anon312_Else_correct))))))
(let ((anon310_Then_correct  (and (=> (= (ControlFlow 0 426) (- 0 428)) (forall ((n_8 T@U) ) (!  (=> (= (type n_8) RefType) (=> (and (U_2_bool (MapType2Select g n_8)) (dummyFunction (MapType0Select ExhaleHeap@3 n_8 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.3991:25|
 :skolemid |442|
 :pattern ( (MapType0Select ExhaleHeap@3 n_8 next))
 :pattern ( (MapType1Select QPMask@33 n_8 next))
 :pattern ( (MapType0Select ExhaleHeap@3 n_8 next))
))) (=> (forall ((n_8@@0 T@U) ) (!  (=> (= (type n_8@@0) RefType) (=> (and (U_2_bool (MapType2Select g n_8@@0)) (dummyFunction (MapType0Select ExhaleHeap@3 n_8@@0 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.3991:25|
 :skolemid |442|
 :pattern ( (MapType0Select ExhaleHeap@3 n_8@@0 next))
 :pattern ( (MapType1Select QPMask@33 n_8@@0 next))
 :pattern ( (MapType0Select ExhaleHeap@3 n_8@@0 next))
)) (and (=> (= (ControlFlow 0 426) (- 0 427)) (forall ((n_8@@1 T@U) (n_8_1 T@U) ) (!  (=> (and (= (type n_8@@1) RefType) (= (type n_8_1) RefType)) (=> (and (and (and (and (not (= n_8@@1 n_8_1)) (U_2_bool (MapType2Select g n_8@@1))) (U_2_bool (MapType2Select g n_8_1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_8@@1 n_8_1))))
 :qid |stdinbpl.3998:25|
 :skolemid |443|
 :pattern ( (neverTriggered43 n_8@@1) (neverTriggered43 n_8_1))
))) (=> (forall ((n_8@@2 T@U) (n_8_1@@0 T@U) ) (!  (=> (and (= (type n_8@@2) RefType) (= (type n_8_1@@0) RefType)) (=> (and (and (and (and (not (= n_8@@2 n_8_1@@0)) (U_2_bool (MapType2Select g n_8@@2))) (U_2_bool (MapType2Select g n_8_1@@0))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_8@@2 n_8_1@@0))))
 :qid |stdinbpl.3998:25|
 :skolemid |443|
 :pattern ( (neverTriggered43 n_8@@2) (neverTriggered43 n_8_1@@0))
)) (=> (= (ControlFlow 0 426) (- 0 425)) (forall ((n_8@@3 T@U) ) (!  (=> (and (= (type n_8@@3) RefType) (U_2_bool (MapType2Select g n_8@@3))) (>= (U_2_real (MapType1Select QPMask@30 n_8@@3 next)) (/ (to_real 1) (to_real 2))))
 :qid |stdinbpl.4005:25|
 :skolemid |444|
 :pattern ( (MapType0Select ExhaleHeap@3 n_8@@3 next))
 :pattern ( (MapType1Select QPMask@33 n_8@@3 next))
 :pattern ( (MapType0Select ExhaleHeap@3 n_8@@3 next))
)))))))))
(let ((anon309_Else_correct  (=> (and (func_graph ($$ ExhaleHeap@3 g)) (state ExhaleHeap@3 QPMask@30)) (and (=> (= (ControlFlow 0 462) 426) anon310_Then_correct) (=> (= (ControlFlow 0 462) 461) anon310_Else_correct)))))
(let ((anon309_Then_correct  (and (=> (= (ControlFlow 0 422) (- 0 424)) (forall ((n_7 T@U) ) (!  (=> (= (type n_7) RefType) (=> (and (U_2_bool (MapType2Select g n_7)) (dummyFunction (MapType0Select ExhaleHeap@3 n_7 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.3931:25|
 :skolemid |435|
 :pattern ( (MapType0Select ExhaleHeap@3 n_7 next))
 :pattern ( (MapType1Select QPMask@32 n_7 next))
 :pattern ( (MapType0Select ExhaleHeap@3 n_7 next))
))) (=> (forall ((n_7@@0 T@U) ) (!  (=> (= (type n_7@@0) RefType) (=> (and (U_2_bool (MapType2Select g n_7@@0)) (dummyFunction (MapType0Select ExhaleHeap@3 n_7@@0 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.3931:25|
 :skolemid |435|
 :pattern ( (MapType0Select ExhaleHeap@3 n_7@@0 next))
 :pattern ( (MapType1Select QPMask@32 n_7@@0 next))
 :pattern ( (MapType0Select ExhaleHeap@3 n_7@@0 next))
)) (and (=> (= (ControlFlow 0 422) (- 0 423)) (forall ((n_7@@1 T@U) (n_7_1 T@U) ) (!  (=> (and (= (type n_7@@1) RefType) (= (type n_7_1) RefType)) (=> (and (and (and (and (not (= n_7@@1 n_7_1)) (U_2_bool (MapType2Select g n_7@@1))) (U_2_bool (MapType2Select g n_7_1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_7@@1 n_7_1))))
 :qid |stdinbpl.3938:25|
 :skolemid |436|
 :pattern ( (neverTriggered42 n_7@@1) (neverTriggered42 n_7_1))
))) (=> (forall ((n_7@@2 T@U) (n_7_1@@0 T@U) ) (!  (=> (and (= (type n_7@@2) RefType) (= (type n_7_1@@0) RefType)) (=> (and (and (and (and (not (= n_7@@2 n_7_1@@0)) (U_2_bool (MapType2Select g n_7@@2))) (U_2_bool (MapType2Select g n_7_1@@0))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_7@@2 n_7_1@@0))))
 :qid |stdinbpl.3938:25|
 :skolemid |436|
 :pattern ( (neverTriggered42 n_7@@2) (neverTriggered42 n_7_1@@0))
)) (=> (= (ControlFlow 0 422) (- 0 421)) (forall ((n_7@@3 T@U) ) (!  (=> (and (= (type n_7@@3) RefType) (U_2_bool (MapType2Select g n_7@@3))) (>= (U_2_real (MapType1Select QPMask@30 n_7@@3 next)) (/ (to_real 1) (to_real 2))))
 :qid |stdinbpl.3945:25|
 :skolemid |437|
 :pattern ( (MapType0Select ExhaleHeap@3 n_7@@3 next))
 :pattern ( (MapType1Select QPMask@32 n_7@@3 next))
 :pattern ( (MapType0Select ExhaleHeap@3 n_7@@3 next))
)))))))))
(let ((anon308_Else_correct  (=> (and (acyclic_graph ($$ ExhaleHeap@3 g)) (state ExhaleHeap@3 QPMask@30)) (and (=> (= (ControlFlow 0 463) 422) anon309_Then_correct) (=> (= (ControlFlow 0 463) 462) anon309_Else_correct)))))
(let ((anon308_Then_correct  (and (=> (= (ControlFlow 0 418) (- 0 420)) (forall ((n_6 T@U) ) (!  (=> (= (type n_6) RefType) (=> (and (U_2_bool (MapType2Select g n_6)) (dummyFunction (MapType0Select ExhaleHeap@3 n_6 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.3871:25|
 :skolemid |428|
 :pattern ( (MapType0Select ExhaleHeap@3 n_6 next))
 :pattern ( (MapType1Select QPMask@31 n_6 next))
 :pattern ( (MapType0Select ExhaleHeap@3 n_6 next))
))) (=> (forall ((n_6@@0 T@U) ) (!  (=> (= (type n_6@@0) RefType) (=> (and (U_2_bool (MapType2Select g n_6@@0)) (dummyFunction (MapType0Select ExhaleHeap@3 n_6@@0 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.3871:25|
 :skolemid |428|
 :pattern ( (MapType0Select ExhaleHeap@3 n_6@@0 next))
 :pattern ( (MapType1Select QPMask@31 n_6@@0 next))
 :pattern ( (MapType0Select ExhaleHeap@3 n_6@@0 next))
)) (and (=> (= (ControlFlow 0 418) (- 0 419)) (forall ((n_6@@1 T@U) (n_6_1 T@U) ) (!  (=> (and (= (type n_6@@1) RefType) (= (type n_6_1) RefType)) (=> (and (and (and (and (not (= n_6@@1 n_6_1)) (U_2_bool (MapType2Select g n_6@@1))) (U_2_bool (MapType2Select g n_6_1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_6@@1 n_6_1))))
 :qid |stdinbpl.3878:25|
 :skolemid |429|
 :pattern ( (neverTriggered41 n_6@@1) (neverTriggered41 n_6_1))
))) (=> (forall ((n_6@@2 T@U) (n_6_1@@0 T@U) ) (!  (=> (and (= (type n_6@@2) RefType) (= (type n_6_1@@0) RefType)) (=> (and (and (and (and (not (= n_6@@2 n_6_1@@0)) (U_2_bool (MapType2Select g n_6@@2))) (U_2_bool (MapType2Select g n_6_1@@0))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_6@@2 n_6_1@@0))))
 :qid |stdinbpl.3878:25|
 :skolemid |429|
 :pattern ( (neverTriggered41 n_6@@2) (neverTriggered41 n_6_1@@0))
)) (=> (= (ControlFlow 0 418) (- 0 417)) (forall ((n_6@@3 T@U) ) (!  (=> (and (= (type n_6@@3) RefType) (U_2_bool (MapType2Select g n_6@@3))) (>= (U_2_real (MapType1Select QPMask@30 n_6@@3 next)) (/ (to_real 1) (to_real 2))))
 :qid |stdinbpl.3885:25|
 :skolemid |430|
 :pattern ( (MapType0Select ExhaleHeap@3 n_6@@3 next))
 :pattern ( (MapType1Select QPMask@31 n_6@@3 next))
 :pattern ( (MapType0Select ExhaleHeap@3 n_6@@3 next))
)))))))))
(let ((anon58_correct  (=> (and (state ExhaleHeap@3 QPMask@30) (state ExhaleHeap@3 QPMask@30)) (and (=> (= (ControlFlow 0 464) 418) anon308_Then_correct) (=> (= (ControlFlow 0 464) 463) anon308_Else_correct)))))
(let ((anon307_Else_correct  (=> (and (< j count@0) (= (ControlFlow 0 467) 464)) anon58_correct)))
(let ((anon307_Then_correct  (=> (<= count@0 j) (and (=> (= (ControlFlow 0 465) (- 0 466)) (HasDirectPerm QPMask@30 prev_node@0 next)) (=> (HasDirectPerm QPMask@30 prev_node@0 next) (=> (and (= (MapType0Select ExhaleHeap@3 prev_node@0 next) node@1) (= (ControlFlow 0 465) 464)) anon58_correct))))))
(let ((anon56_correct  (=> (state ExhaleHeap@3 QPMask@30) (and (=> (= (ControlFlow 0 468) 465) anon307_Then_correct) (=> (= (ControlFlow 0 468) 467) anon307_Else_correct)))))
(let ((anon306_Else_correct  (=> (and (<= count@0 i) (= (ControlFlow 0 470) 468)) anon56_correct)))
(let ((anon306_Then_correct  (=> (and (and (< i count@0) (U_2_bool (MapType2Select g node_i@0))) (and (U_2_bool (MapType2Select g prev_i@0)) (= (ControlFlow 0 469) 468))) anon56_correct)))
(let ((anon54_correct  (=> (state ExhaleHeap@3 QPMask@30) (and (=> (= (ControlFlow 0 471) 469) anon306_Then_correct) (=> (= (ControlFlow 0 471) 470) anon306_Else_correct)))))
(let ((anon305_Else_correct  (=> (and (< j count@0) (= (ControlFlow 0 473) 471)) anon54_correct)))
(let ((anon305_Then_correct  (=> (<= count@0 j) (=> (and (U_2_bool (MapType2Select g prev_node@0)) (= (ControlFlow 0 472) 471)) anon54_correct))))
(let ((anon52_correct  (=> (state ExhaleHeap@3 QPMask@30) (and (=> (= (ControlFlow 0 474) 472) anon305_Then_correct) (=> (= (ControlFlow 0 474) 473) anon305_Else_correct)))))
(let ((anon304_Else_correct  (=> (and (= node@1 null) (= (ControlFlow 0 476) 474)) anon52_correct)))
(let ((anon304_Then_correct  (=> (not (= node@1 null)) (=> (and (U_2_bool (MapType2Select g node@1)) (= (ControlFlow 0 475) 474)) anon52_correct))))
(let ((anon301_Else_correct  (=> (and (forall ((n$3_3 T@U) ) (!  (=> (= (type n$3_3) RefType) (=> (and (U_2_bool (MapType2Select g n$3_3)) (not (= (MapType0Select ExhaleHeap@3 n$3_3 next) null))) (U_2_bool (MapType2Select g (MapType0Select ExhaleHeap@3 n$3_3 next)))))
 :qid |stdinbpl.3834:24|
 :skolemid |427|
 :pattern ( (MapType2Select g (MapType0Select ExhaleHeap@3 n$3_3 next)))
 :pattern ( (MapType2Select g n$3_3) (MapType0Select ExhaleHeap@3 n$3_3 next))
)) (state ExhaleHeap@3 QPMask@30)) (and (=> (= (ControlFlow 0 477) 475) anon304_Then_correct) (=> (= (ControlFlow 0 477) 476) anon304_Else_correct)))))
(let ((anon49_correct true))
(let ((anon303_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select g n$3_1)) (not (= (MapType0Select ExhaleHeap@3 n$3_1 next) null)))) (= (ControlFlow 0 413) 410)) anon49_correct)))
(let ((anon303_Then_correct  (=> (and (U_2_bool (MapType2Select g n$3_1)) (not (= (MapType0Select ExhaleHeap@3 n$3_1 next) null))) (and (=> (= (ControlFlow 0 411) (- 0 412)) (HasDirectPerm QPMask@30 n$3_1 next)) (=> (HasDirectPerm QPMask@30 n$3_1 next) (=> (= (ControlFlow 0 411) 410) anon49_correct))))))
(let ((anon302_Else_correct  (=> (not (U_2_bool (MapType2Select g n$3_1))) (and (=> (= (ControlFlow 0 416) 411) anon303_Then_correct) (=> (= (ControlFlow 0 416) 413) anon303_Else_correct)))))
(let ((anon302_Then_correct  (=> (U_2_bool (MapType2Select g n$3_1)) (and (=> (= (ControlFlow 0 414) (- 0 415)) (HasDirectPerm QPMask@30 n$3_1 next)) (=> (HasDirectPerm QPMask@30 n$3_1 next) (and (=> (= (ControlFlow 0 414) 411) anon303_Then_correct) (=> (= (ControlFlow 0 414) 413) anon303_Else_correct)))))))
(let ((anon300_Else_correct  (and (=> (= (ControlFlow 0 478) (- 0 479)) (forall ((n$2_2 T@U) (n$2_2_1 T@U) ) (!  (=> (and (= (type n$2_2) RefType) (= (type n$2_2_1) RefType)) (=> (and (and (and (and (not (= n$2_2 n$2_2_1)) (U_2_bool (MapType2Select g n$2_2))) (U_2_bool (MapType2Select g n$2_2_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$2_2 n$2_2_1))))
 :qid |stdinbpl.3789:19|
 :skolemid |421|
 :no-pattern (type n$2_2)
 :no-pattern (type n$2_2_1)
 :no-pattern (U_2_int n$2_2)
 :no-pattern (U_2_bool n$2_2)
 :no-pattern (U_2_int n$2_2_1)
 :no-pattern (U_2_bool n$2_2_1)
))) (=> (forall ((n$2_2@@0 T@U) (n$2_2_1@@0 T@U) ) (!  (=> (and (= (type n$2_2@@0) RefType) (= (type n$2_2_1@@0) RefType)) (=> (and (and (and (and (not (= n$2_2@@0 n$2_2_1@@0)) (U_2_bool (MapType2Select g n$2_2@@0))) (U_2_bool (MapType2Select g n$2_2_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$2_2@@0 n$2_2_1@@0))))
 :qid |stdinbpl.3789:19|
 :skolemid |421|
 :no-pattern (type n$2_2@@0)
 :no-pattern (type n$2_2_1@@0)
 :no-pattern (U_2_int n$2_2@@0)
 :no-pattern (U_2_bool n$2_2@@0)
 :no-pattern (U_2_int n$2_2_1@@0)
 :no-pattern (U_2_bool n$2_2_1@@0)
)) (=> (and (forall ((n$2_2@@1 T@U) ) (!  (=> (= (type n$2_2@@1) RefType) (=> (and (U_2_bool (MapType2Select g n$2_2@@1)) (< NoPerm FullPerm)) (and (qpRange40 n$2_2@@1) (= (invRecv40 n$2_2@@1) n$2_2@@1))))
 :qid |stdinbpl.3795:26|
 :skolemid |422|
 :pattern ( (MapType0Select ExhaleHeap@3 n$2_2@@1 next))
 :pattern ( (MapType1Select QPMask@30 n$2_2@@1 next))
 :pattern ( (MapType0Select ExhaleHeap@3 n$2_2@@1 next))
)) (forall ((o_3 T@U) ) (!  (=> (= (type o_3) RefType) (=> (and (and (U_2_bool (MapType2Select g (invRecv40 o_3))) (< NoPerm FullPerm)) (qpRange40 o_3)) (= (invRecv40 o_3) o_3)))
 :qid |stdinbpl.3799:26|
 :skolemid |423|
 :pattern ( (invRecv40 o_3))
))) (=> (and (and (forall ((n$2_2@@2 T@U) ) (!  (=> (and (= (type n$2_2@@2) RefType) (U_2_bool (MapType2Select g n$2_2@@2))) (not (= n$2_2@@2 null)))
 :qid |stdinbpl.3805:26|
 :skolemid |424|
 :pattern ( (MapType0Select ExhaleHeap@3 n$2_2@@2 next))
 :pattern ( (MapType1Select QPMask@30 n$2_2@@2 next))
 :pattern ( (MapType0Select ExhaleHeap@3 n$2_2@@2 next))
)) (forall ((o_3@@0 T@U) ) (!  (=> (= (type o_3@@0) RefType) (and (=> (and (and (U_2_bool (MapType2Select g (invRecv40 o_3@@0))) (< NoPerm FullPerm)) (qpRange40 o_3@@0)) (and (=> (< NoPerm FullPerm) (= (invRecv40 o_3@@0) o_3@@0)) (= (U_2_real (MapType1Select QPMask@30 o_3@@0 next)) (+ (U_2_real (MapType1Select QPMask@4 o_3@@0 next)) FullPerm)))) (=> (not (and (and (U_2_bool (MapType2Select g (invRecv40 o_3@@0))) (< NoPerm FullPerm)) (qpRange40 o_3@@0))) (= (U_2_real (MapType1Select QPMask@30 o_3@@0 next)) (U_2_real (MapType1Select QPMask@4 o_3@@0 next))))))
 :qid |stdinbpl.3811:26|
 :skolemid |425|
 :pattern ( (MapType1Select QPMask@30 o_3@@0 next))
))) (and (forall ((o_3@@1 T@U) (f_5 T@U) ) (! (let ((B@@11 (FieldTypeInv1 (type f_5))))
(let ((A@@12 (FieldTypeInv0 (type f_5))))
 (=> (and (and (= (type o_3@@1) RefType) (= (type f_5) (FieldType A@@12 B@@11))) (not (= f_5 next))) (= (U_2_real (MapType1Select QPMask@4 o_3@@1 f_5)) (U_2_real (MapType1Select QPMask@30 o_3@@1 f_5))))))
 :qid |stdinbpl.3815:33|
 :skolemid |426|
 :pattern ( (MapType1Select QPMask@4 o_3@@1 f_5))
 :pattern ( (MapType1Select QPMask@30 o_3@@1 f_5))
)) (state ExhaleHeap@3 QPMask@30))) (and (and (=> (= (ControlFlow 0 478) 477) anon301_Else_correct) (=> (= (ControlFlow 0 478) 414) anon302_Then_correct)) (=> (= (ControlFlow 0 478) 416) anon302_Else_correct))))))))
(let ((anon300_Then_correct true))
(let ((anon299_Then_correct  (=> (and (and (and (<= 0 i) (< i j)) (and (state ExhaleHeap@3 QPMask@4) (<= 0 count@0))) (and (and (state ExhaleHeap@3 QPMask@4) (U_2_bool (MapType2Select g x_1@@0))) (and (state ExhaleHeap@3 QPMask@4) (not (U_2_bool (MapType2Select g null)))))) (and (=> (= (ControlFlow 0 480) 409) anon300_Then_correct) (=> (= (ControlFlow 0 480) 478) anon300_Else_correct)))))
(let ((anon172_correct true))
(let ((anon366_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select g n$0_12)) (not (= (MapType0Select ExhaleHeap@10 n$0_12 next) null)))) (= (ControlFlow 0 247) 244)) anon172_correct)))
(let ((anon366_Then_correct  (=> (and (U_2_bool (MapType2Select g n$0_12)) (not (= (MapType0Select ExhaleHeap@10 n$0_12 next) null))) (and (=> (= (ControlFlow 0 245) (- 0 246)) (U_2_bool (MapType2Select g (MapType0Select ExhaleHeap@10 n$0_12 next)))) (=> (U_2_bool (MapType2Select g (MapType0Select ExhaleHeap@10 n$0_12 next))) (=> (= (ControlFlow 0 245) 244) anon172_correct))))))
(let ((anon158_correct true))
(let ((anon359_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select g n$0_10)) (not (= (MapType0Select ExhaleHeap@9 n$0_10 next) null)))) (= (ControlFlow 0 243) 240)) anon158_correct)))
(let ((anon359_Then_correct  (=> (and (U_2_bool (MapType2Select g n$0_10)) (not (= (MapType0Select ExhaleHeap@9 n$0_10 next) null))) (and (=> (= (ControlFlow 0 241) (- 0 242)) (U_2_bool (MapType2Select g (MapType0Select ExhaleHeap@9 n$0_10 next)))) (=> (U_2_bool (MapType2Select g (MapType0Select ExhaleHeap@9 n$0_10 next))) (=> (= (ControlFlow 0 241) 240) anon158_correct))))))
(let ((anon146_correct true))
(let ((anon353_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select g n$0_8)) (not (= (MapType0Select ExhaleHeap@8 n$0_8 next) null)))) (= (ControlFlow 0 239) 236)) anon146_correct)))
(let ((anon353_Then_correct  (=> (and (U_2_bool (MapType2Select g n$0_8)) (not (= (MapType0Select ExhaleHeap@8 n$0_8 next) null))) (and (=> (= (ControlFlow 0 237) (- 0 238)) (U_2_bool (MapType2Select g (MapType0Select ExhaleHeap@8 n$0_8 next)))) (=> (U_2_bool (MapType2Select g (MapType0Select ExhaleHeap@8 n$0_8 next))) (=> (= (ControlFlow 0 237) 236) anon146_correct))))))
(let ((anon132_correct true))
(let ((anon346_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select g n$0_6)) (not (= (MapType0Select ExhaleHeap@5 n$0_6 next) null)))) (= (ControlFlow 0 235) 232)) anon132_correct)))
(let ((anon346_Then_correct  (=> (and (U_2_bool (MapType2Select g n$0_6)) (not (= (MapType0Select ExhaleHeap@5 n$0_6 next) null))) (and (=> (= (ControlFlow 0 233) (- 0 234)) (U_2_bool (MapType2Select g (MapType0Select ExhaleHeap@5 n$0_6 next)))) (=> (U_2_bool (MapType2Select g (MapType0Select ExhaleHeap@5 n$0_6 next))) (=> (= (ControlFlow 0 233) 232) anon132_correct))))))
(let ((anon226_correct true))
(let ((anon392_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select g n$0_20)) (not (= (MapType0Select ExhaleHeap@12 n$0_20 next) null)))) (= (ControlFlow 0 139) 136)) anon226_correct)))
(let ((anon392_Then_correct  (=> (and (U_2_bool (MapType2Select g n$0_20)) (not (= (MapType0Select ExhaleHeap@12 n$0_20 next) null))) (and (=> (= (ControlFlow 0 137) (- 0 138)) (U_2_bool (MapType2Select g (MapType0Select ExhaleHeap@12 n$0_20 next)))) (=> (U_2_bool (MapType2Select g (MapType0Select ExhaleHeap@12 n$0_20 next))) (=> (= (ControlFlow 0 137) 136) anon226_correct))))))
(let ((anon212_correct true))
(let ((anon385_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select g n$0_18)) (not (= (MapType0Select Heap@0 n$0_18 next) null)))) (= (ControlFlow 0 135) 132)) anon212_correct)))
(let ((anon385_Then_correct  (=> (and (U_2_bool (MapType2Select g n$0_18)) (not (= (MapType0Select Heap@0 n$0_18 next) null))) (and (=> (= (ControlFlow 0 133) (- 0 134)) (U_2_bool (MapType2Select g (MapType0Select Heap@0 n$0_18 next)))) (=> (U_2_bool (MapType2Select g (MapType0Select Heap@0 n$0_18 next))) (=> (= (ControlFlow 0 133) 132) anon212_correct))))))
(let ((anon199_correct true))
(let ((anon379_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select g n$0_16)) (not (= (MapType0Select ExhaleHeap@6 n$0_16 next) null)))) (= (ControlFlow 0 131) 128)) anon199_correct)))
(let ((anon379_Then_correct  (=> (and (U_2_bool (MapType2Select g n$0_16)) (not (= (MapType0Select ExhaleHeap@6 n$0_16 next) null))) (and (=> (= (ControlFlow 0 129) (- 0 130)) (U_2_bool (MapType2Select g (MapType0Select ExhaleHeap@6 n$0_16 next)))) (=> (U_2_bool (MapType2Select g (MapType0Select ExhaleHeap@6 n$0_16 next))) (=> (= (ControlFlow 0 129) 128) anon199_correct))))))
(let ((anon185_correct true))
(let ((anon372_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select g n$0_14)) (not (= (MapType0Select ExhaleHeap@5 n$0_14 next) null)))) (= (ControlFlow 0 127) 124)) anon185_correct)))
(let ((anon372_Then_correct  (=> (and (U_2_bool (MapType2Select g n$0_14)) (not (= (MapType0Select ExhaleHeap@5 n$0_14 next) null))) (and (=> (= (ControlFlow 0 125) (- 0 126)) (U_2_bool (MapType2Select g (MapType0Select ExhaleHeap@5 n$0_14 next)))) (=> (U_2_bool (MapType2Select g (MapType0Select ExhaleHeap@5 n$0_14 next))) (=> (= (ControlFlow 0 125) 124) anon185_correct))))))
(let ((anon119_correct true))
(let ((anon339_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select g n$0_4)) (not (= (MapType0Select ExhaleHeap@4 n$0_4 next) null)))) (= (ControlFlow 0 123) 120)) anon119_correct)))
(let ((anon339_Then_correct  (=> (and (U_2_bool (MapType2Select g n$0_4)) (not (= (MapType0Select ExhaleHeap@4 n$0_4 next) null))) (and (=> (= (ControlFlow 0 121) (- 0 122)) (U_2_bool (MapType2Select g (MapType0Select ExhaleHeap@4 n$0_4 next)))) (=> (U_2_bool (MapType2Select g (MapType0Select ExhaleHeap@4 n$0_4 next))) (=> (= (ControlFlow 0 121) 120) anon119_correct))))))
(let ((anon105_correct true))
(let ((anon332_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select g n$0_2_1)) (not (= (MapType0Select ExhaleHeap@3 n$0_2_1 next) null)))) (= (ControlFlow 0 119) 116)) anon105_correct)))
(let ((anon332_Then_correct  (=> (and (U_2_bool (MapType2Select g n$0_2_1)) (not (= (MapType0Select ExhaleHeap@3 n$0_2_1 next) null))) (and (=> (= (ControlFlow 0 117) (- 0 118)) (U_2_bool (MapType2Select g (MapType0Select ExhaleHeap@3 n$0_2_1 next)))) (=> (U_2_bool (MapType2Select g (MapType0Select ExhaleHeap@3 n$0_2_1 next))) (=> (= (ControlFlow 0 117) 116) anon105_correct))))))
(let ((anon398_Then_correct  (and (=> (= (ControlFlow 0 105) (- 0 107)) (forall ((n_24 T@U) ) (!  (=> (= (type n_24) RefType) (=> (and (U_2_bool (MapType2Select g n_24)) (dummyFunction (MapType0Select Heap@1 n_24 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.6101:31|
 :skolemid |673|
 :pattern ( (MapType0Select Heap@1 n_24 next))
 :pattern ( (MapType1Select QPMask@28 n_24 next))
 :pattern ( (MapType0Select Heap@1 n_24 next))
))) (=> (forall ((n_24@@0 T@U) ) (!  (=> (= (type n_24@@0) RefType) (=> (and (U_2_bool (MapType2Select g n_24@@0)) (dummyFunction (MapType0Select Heap@1 n_24@@0 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.6101:31|
 :skolemid |673|
 :pattern ( (MapType0Select Heap@1 n_24@@0 next))
 :pattern ( (MapType1Select QPMask@28 n_24@@0 next))
 :pattern ( (MapType0Select Heap@1 n_24@@0 next))
)) (and (=> (= (ControlFlow 0 105) (- 0 106)) (forall ((n_24@@1 T@U) (n_24_1 T@U) ) (!  (=> (and (= (type n_24@@1) RefType) (= (type n_24_1) RefType)) (=> (and (and (and (and (not (= n_24@@1 n_24_1)) (U_2_bool (MapType2Select g n_24@@1))) (U_2_bool (MapType2Select g n_24_1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_24@@1 n_24_1))))
 :qid |stdinbpl.6108:31|
 :skolemid |674|
 :pattern ( (neverTriggered70 n_24@@1) (neverTriggered70 n_24_1))
))) (=> (forall ((n_24@@2 T@U) (n_24_1@@0 T@U) ) (!  (=> (and (= (type n_24@@2) RefType) (= (type n_24_1@@0) RefType)) (=> (and (and (and (and (not (= n_24@@2 n_24_1@@0)) (U_2_bool (MapType2Select g n_24@@2))) (U_2_bool (MapType2Select g n_24_1@@0))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_24@@2 n_24_1@@0))))
 :qid |stdinbpl.6108:31|
 :skolemid |674|
 :pattern ( (neverTriggered70 n_24@@2) (neverTriggered70 n_24_1@@0))
)) (=> (= (ControlFlow 0 105) (- 0 104)) (forall ((n_24@@3 T@U) ) (!  (=> (and (= (type n_24@@3) RefType) (U_2_bool (MapType2Select g n_24@@3))) (>= (U_2_real (MapType1Select Mask@21 n_24@@3 next)) (/ (to_real 1) (to_real 2))))
 :qid |stdinbpl.6115:31|
 :skolemid |675|
 :pattern ( (MapType0Select Heap@1 n_24@@3 next))
 :pattern ( (MapType1Select QPMask@28 n_24@@3 next))
 :pattern ( (MapType0Select Heap@1 n_24@@3 next))
)))))))))
(let ((anon397_Then_correct  (and (=> (= (ControlFlow 0 101) (- 0 103)) (forall ((n_23 T@U) ) (!  (=> (= (type n_23) RefType) (=> (and (U_2_bool (MapType2Select g n_23)) (dummyFunction (MapType0Select Heap@1 n_23 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.6041:31|
 :skolemid |666|
 :pattern ( (MapType0Select Heap@1 n_23 next))
 :pattern ( (MapType1Select QPMask@27 n_23 next))
 :pattern ( (MapType0Select Heap@1 n_23 next))
))) (=> (forall ((n_23@@0 T@U) ) (!  (=> (= (type n_23@@0) RefType) (=> (and (U_2_bool (MapType2Select g n_23@@0)) (dummyFunction (MapType0Select Heap@1 n_23@@0 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.6041:31|
 :skolemid |666|
 :pattern ( (MapType0Select Heap@1 n_23@@0 next))
 :pattern ( (MapType1Select QPMask@27 n_23@@0 next))
 :pattern ( (MapType0Select Heap@1 n_23@@0 next))
)) (and (=> (= (ControlFlow 0 101) (- 0 102)) (forall ((n_23@@1 T@U) (n_23_1 T@U) ) (!  (=> (and (= (type n_23@@1) RefType) (= (type n_23_1) RefType)) (=> (and (and (and (and (not (= n_23@@1 n_23_1)) (U_2_bool (MapType2Select g n_23@@1))) (U_2_bool (MapType2Select g n_23_1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_23@@1 n_23_1))))
 :qid |stdinbpl.6048:31|
 :skolemid |667|
 :pattern ( (neverTriggered69 n_23@@1) (neverTriggered69 n_23_1))
))) (=> (forall ((n_23@@2 T@U) (n_23_1@@0 T@U) ) (!  (=> (and (= (type n_23@@2) RefType) (= (type n_23_1@@0) RefType)) (=> (and (and (and (and (not (= n_23@@2 n_23_1@@0)) (U_2_bool (MapType2Select g n_23@@2))) (U_2_bool (MapType2Select g n_23_1@@0))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_23@@2 n_23_1@@0))))
 :qid |stdinbpl.6048:31|
 :skolemid |667|
 :pattern ( (neverTriggered69 n_23@@2) (neverTriggered69 n_23_1@@0))
)) (=> (= (ControlFlow 0 101) (- 0 100)) (forall ((n_23@@3 T@U) ) (!  (=> (and (= (type n_23@@3) RefType) (U_2_bool (MapType2Select g n_23@@3))) (>= (U_2_real (MapType1Select Mask@21 n_23@@3 next)) (/ (to_real 1) (to_real 2))))
 :qid |stdinbpl.6055:31|
 :skolemid |668|
 :pattern ( (MapType0Select Heap@1 n_23@@3 next))
 :pattern ( (MapType1Select QPMask@27 n_23@@3 next))
 :pattern ( (MapType0Select Heap@1 n_23@@3 next))
)))))))))
(let ((anon262_correct true))
(let ((anon409_Else_correct  (=> (and (= node@2 null) (= (ControlFlow 0 65) 62)) anon262_correct)))
(let ((anon409_Then_correct  (=> (not (= node@2 null)) (and (=> (= (ControlFlow 0 63) (- 0 64)) (exists_path ($$ Heap@1 g) node@1 node@2)) (=> (exists_path ($$ Heap@1 g) node@1 node@2) (=> (= (ControlFlow 0 63) 62) anon262_correct))))))
(let ((anon408_Else_correct  (=> (= node_i@1 null) (and (=> (= (ControlFlow 0 68) 63) anon409_Then_correct) (=> (= (ControlFlow 0 68) 65) anon409_Else_correct)))))
(let ((anon408_Then_correct  (=> (not (= node_i@1 null)) (and (=> (= (ControlFlow 0 66) (- 0 67)) (exists_path ($$ Heap@1 g) node_i@1 node@1)) (=> (exists_path ($$ Heap@1 g) node_i@1 node@1) (and (=> (= (ControlFlow 0 66) 63) anon409_Then_correct) (=> (= (ControlFlow 0 66) 65) anon409_Else_correct)))))))
(let ((anon407_Else_correct  (=> (= node_i@1 null) (and (=> (= (ControlFlow 0 71) 66) anon408_Then_correct) (=> (= (ControlFlow 0 71) 68) anon408_Else_correct)))))
(let ((anon407_Then_correct  (=> (not (= node_i@1 null)) (and (=> (= (ControlFlow 0 69) (- 0 70)) (exists_path ($$ Heap@1 g) prev_i@1 node_i@1)) (=> (exists_path ($$ Heap@1 g) prev_i@1 node_i@1) (and (=> (= (ControlFlow 0 69) 66) anon408_Then_correct) (=> (= (ControlFlow 0 69) 68) anon408_Else_correct)))))))
(let ((anon405_Else_correct  (=> (forall ((n$4_6_1 T@U) ) (!  (=> (and (= (type n$4_6_1) RefType) (U_2_bool (MapType2Select g n$4_6_1))) (exists_path ($$ Heap@1 g) x_1@@0 n$4_6_1))
 :qid |stdinbpl.6249:24|
 :skolemid |687|
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| Heap@1 g))) g) x_1@@0 n$4_6_1))
)) (and (=> (= (ControlFlow 0 72) 69) anon407_Then_correct) (=> (= (ControlFlow 0 72) 71) anon407_Else_correct)))))
(let ((anon255_correct true))
(let ((anon406_Else_correct  (=> (and (not (U_2_bool (MapType2Select g n$4_5))) (= (ControlFlow 0 61) 58)) anon255_correct)))
(let ((anon406_Then_correct  (=> (U_2_bool (MapType2Select g n$4_5)) (and (=> (= (ControlFlow 0 59) (- 0 60)) (exists_path ($$ Heap@1 g) x_1@@0 n$4_5)) (=> (exists_path ($$ Heap@1 g) x_1@@0 n$4_5) (=> (= (ControlFlow 0 59) 58) anon255_correct))))))
(let ((anon252_correct  (and (=> (= (ControlFlow 0 73) (- 0 76)) (acyclic_graph ($$ Heap@1 g))) (=> (acyclic_graph ($$ Heap@1 g)) (and (=> (= (ControlFlow 0 73) (- 0 75)) (func_graph ($$ Heap@1 g))) (=> (func_graph ($$ Heap@1 g)) (and (=> (= (ControlFlow 0 73) (- 0 74)) (unshared_graph ($$ Heap@1 g))) (=> (unshared_graph ($$ Heap@1 g)) (and (and (=> (= (ControlFlow 0 73) 72) anon405_Else_correct) (=> (= (ControlFlow 0 73) 59) anon406_Then_correct)) (=> (= (ControlFlow 0 73) 61) anon406_Else_correct))))))))))
(let ((anon404_Else_correct  (=> (and (< j count@1) (= (ControlFlow 0 79) 73)) anon252_correct)))
(let ((anon404_Then_correct  (=> (<= count@1 j) (and (=> (= (ControlFlow 0 77) (- 0 78)) (= (MapType0Select Heap@1 node@1 next) node@2)) (=> (= (MapType0Select Heap@1 node@1 next) node@2) (=> (= (ControlFlow 0 77) 73) anon252_correct))))))
(let ((anon403_Else_correct  (=> (<= count@1 i) (and (=> (= (ControlFlow 0 83) 77) anon404_Then_correct) (=> (= (ControlFlow 0 83) 79) anon404_Else_correct)))))
(let ((anon403_Then_correct  (=> (< i count@1) (and (=> (= (ControlFlow 0 80) (- 0 82)) (U_2_bool (MapType2Select g node_i@1))) (=> (U_2_bool (MapType2Select g node_i@1)) (and (=> (= (ControlFlow 0 80) (- 0 81)) (U_2_bool (MapType2Select g prev_i@1))) (=> (U_2_bool (MapType2Select g prev_i@1)) (and (=> (= (ControlFlow 0 80) 77) anon404_Then_correct) (=> (= (ControlFlow 0 80) 79) anon404_Else_correct)))))))))
(let ((anon402_Else_correct  (=> (< j count@1) (and (=> (= (ControlFlow 0 86) 80) anon403_Then_correct) (=> (= (ControlFlow 0 86) 83) anon403_Else_correct)))))
(let ((anon402_Then_correct  (=> (<= count@1 j) (and (=> (= (ControlFlow 0 84) (- 0 85)) (U_2_bool (MapType2Select g node@1))) (=> (U_2_bool (MapType2Select g node@1)) (and (=> (= (ControlFlow 0 84) 80) anon403_Then_correct) (=> (= (ControlFlow 0 84) 83) anon403_Else_correct)))))))
(let ((anon401_Else_correct  (=> (= node@2 null) (and (=> (= (ControlFlow 0 89) 84) anon402_Then_correct) (=> (= (ControlFlow 0 89) 86) anon402_Else_correct)))))
(let ((anon401_Then_correct  (=> (not (= node@2 null)) (and (=> (= (ControlFlow 0 87) (- 0 88)) (U_2_bool (MapType2Select g node@2))) (=> (U_2_bool (MapType2Select g node@2)) (and (=> (= (ControlFlow 0 87) 84) anon402_Then_correct) (=> (= (ControlFlow 0 87) 86) anon402_Else_correct)))))))
(let ((anon399_Else_correct  (=> (forall ((n$3_6_1 T@U) ) (!  (=> (= (type n$3_6_1) RefType) (=> (and (U_2_bool (MapType2Select g n$3_6_1)) (not (= (MapType0Select Heap@1 n$3_6_1 next) null))) (U_2_bool (MapType2Select g (MapType0Select Heap@1 n$3_6_1 next)))))
 :qid |stdinbpl.6214:24|
 :skolemid |686|
 :pattern ( (MapType2Select g (MapType0Select Heap@1 n$3_6_1 next)))
 :pattern ( (MapType2Select g n$3_6_1) (MapType0Select Heap@1 n$3_6_1 next))
)) (and (=> (= (ControlFlow 0 90) 87) anon401_Then_correct) (=> (= (ControlFlow 0 90) 89) anon401_Else_correct)))))
(let ((anon243_correct true))
(let ((anon400_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select g n$3_5)) (not (= (MapType0Select Heap@1 n$3_5 next) null)))) (= (ControlFlow 0 57) 54)) anon243_correct)))
(let ((anon400_Then_correct  (=> (and (U_2_bool (MapType2Select g n$3_5)) (not (= (MapType0Select Heap@1 n$3_5 next) null))) (and (=> (= (ControlFlow 0 55) (- 0 56)) (U_2_bool (MapType2Select g (MapType0Select Heap@1 n$3_5 next)))) (=> (U_2_bool (MapType2Select g (MapType0Select Heap@1 n$3_5 next))) (=> (= (ControlFlow 0 55) 54) anon243_correct))))))
(let ((anon240_correct  (=> (state Heap@1 Mask@21) (and (=> (= (ControlFlow 0 91) (- 0 98)) (<= 0 i)) (=> (<= 0 i) (and (=> (= (ControlFlow 0 91) (- 0 97)) (< i j)) (=> (< i j) (and (=> (= (ControlFlow 0 91) (- 0 96)) (<= 0 count@1)) (=> (<= 0 count@1) (and (=> (= (ControlFlow 0 91) (- 0 95)) (U_2_bool (MapType2Select g x_1@@0))) (=> (U_2_bool (MapType2Select g x_1@@0)) (and (=> (= (ControlFlow 0 91) (- 0 94)) (not (U_2_bool (MapType2Select g null)))) (=> (not (U_2_bool (MapType2Select g null))) (and (=> (= (ControlFlow 0 91) (- 0 93)) (forall ((n$2_14 T@U) (n$2_14_1 T@U) ) (!  (=> (and (= (type n$2_14) RefType) (= (type n$2_14_1) RefType)) (=> (and (and (and (and (not (= n$2_14 n$2_14_1)) (U_2_bool (MapType2Select g n$2_14))) (U_2_bool (MapType2Select g n$2_14_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$2_14 n$2_14_1))))
 :qid |stdinbpl.6173:21|
 :skolemid |680|
 :pattern ( (neverTriggered71 n$2_14) (neverTriggered71 n$2_14_1))
))) (=> (forall ((n$2_14@@0 T@U) (n$2_14_1@@0 T@U) ) (!  (=> (and (= (type n$2_14@@0) RefType) (= (type n$2_14_1@@0) RefType)) (=> (and (and (and (and (not (= n$2_14@@0 n$2_14_1@@0)) (U_2_bool (MapType2Select g n$2_14@@0))) (U_2_bool (MapType2Select g n$2_14_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$2_14@@0 n$2_14_1@@0))))
 :qid |stdinbpl.6173:21|
 :skolemid |680|
 :pattern ( (neverTriggered71 n$2_14@@0) (neverTriggered71 n$2_14_1@@0))
)) (and (=> (= (ControlFlow 0 91) (- 0 92)) (forall ((n$2_14@@1 T@U) ) (!  (=> (and (= (type n$2_14@@1) RefType) (U_2_bool (MapType2Select g n$2_14@@1))) (>= (U_2_real (MapType1Select Mask@21 n$2_14@@1 next)) FullPerm))
 :qid |stdinbpl.6180:21|
 :skolemid |681|
 :pattern ( (MapType0Select Heap@1 n$2_14@@1 next))
 :pattern ( (MapType1Select QPMask@29 n$2_14@@1 next))
 :pattern ( (MapType0Select Heap@1 n$2_14@@1 next))
))) (=> (forall ((n$2_14@@2 T@U) ) (!  (=> (and (= (type n$2_14@@2) RefType) (U_2_bool (MapType2Select g n$2_14@@2))) (>= (U_2_real (MapType1Select Mask@21 n$2_14@@2 next)) FullPerm))
 :qid |stdinbpl.6180:21|
 :skolemid |681|
 :pattern ( (MapType0Select Heap@1 n$2_14@@2 next))
 :pattern ( (MapType1Select QPMask@29 n$2_14@@2 next))
 :pattern ( (MapType0Select Heap@1 n$2_14@@2 next))
)) (=> (and (and (forall ((n$2_14@@3 T@U) ) (!  (=> (= (type n$2_14@@3) RefType) (=> (and (U_2_bool (MapType2Select g n$2_14@@3)) (< NoPerm FullPerm)) (and (qpRange71 n$2_14@@3) (= (invRecv71 n$2_14@@3) n$2_14@@3))))
 :qid |stdinbpl.6186:26|
 :skolemid |682|
 :pattern ( (MapType0Select Heap@1 n$2_14@@3 next))
 :pattern ( (MapType1Select QPMask@29 n$2_14@@3 next))
 :pattern ( (MapType0Select Heap@1 n$2_14@@3 next))
)) (forall ((o_3@@2 T@U) ) (!  (=> (= (type o_3@@2) RefType) (=> (and (U_2_bool (MapType2Select g (invRecv71 o_3@@2))) (and (< NoPerm FullPerm) (qpRange71 o_3@@2))) (= (invRecv71 o_3@@2) o_3@@2)))
 :qid |stdinbpl.6190:26|
 :skolemid |683|
 :pattern ( (invRecv71 o_3@@2))
))) (and (forall ((o_3@@3 T@U) ) (!  (=> (= (type o_3@@3) RefType) (and (=> (and (U_2_bool (MapType2Select g (invRecv71 o_3@@3))) (and (< NoPerm FullPerm) (qpRange71 o_3@@3))) (and (= (invRecv71 o_3@@3) o_3@@3) (= (U_2_real (MapType1Select QPMask@29 o_3@@3 next)) (- (U_2_real (MapType1Select Mask@21 o_3@@3 next)) FullPerm)))) (=> (not (and (U_2_bool (MapType2Select g (invRecv71 o_3@@3))) (and (< NoPerm FullPerm) (qpRange71 o_3@@3)))) (= (U_2_real (MapType1Select QPMask@29 o_3@@3 next)) (U_2_real (MapType1Select Mask@21 o_3@@3 next))))))
 :qid |stdinbpl.6196:26|
 :skolemid |684|
 :pattern ( (MapType1Select QPMask@29 o_3@@3 next))
)) (forall ((o_3@@4 T@U) (f_5@@0 T@U) ) (! (let ((B@@12 (FieldTypeInv1 (type f_5@@0))))
(let ((A@@13 (FieldTypeInv0 (type f_5@@0))))
 (=> (and (and (= (type o_3@@4) RefType) (= (type f_5@@0) (FieldType A@@13 B@@12))) (not (= f_5@@0 next))) (= (U_2_real (MapType1Select Mask@21 o_3@@4 f_5@@0)) (U_2_real (MapType1Select QPMask@29 o_3@@4 f_5@@0))))))
 :qid |stdinbpl.6202:33|
 :skolemid |685|
 :pattern ( (MapType1Select QPMask@29 o_3@@4 f_5@@0))
)))) (and (and (=> (= (ControlFlow 0 91) 90) anon399_Else_correct) (=> (= (ControlFlow 0 91) 55) anon400_Then_correct)) (=> (= (ControlFlow 0 91) 57) anon400_Else_correct))))))))))))))))))))
(let ((anon398_Else_correct  (and (=> (= (ControlFlow 0 108) (- 0 109)) (exists_path ($$ Heap@1 g) node@1 node@2)) (=> (exists_path ($$ Heap@1 g) node@1 node@2) (=> (= (ControlFlow 0 108) 91) anon240_correct)))))
(let ((anon397_Else_correct  (and (=> (= (ControlFlow 0 110) (- 0 111)) (exists_path ($$ Heap@1 g) node@2 node@2)) (=> (exists_path ($$ Heap@1 g) node@2 node@2) (and (=> (= (ControlFlow 0 110) 105) anon398_Then_correct) (=> (= (ControlFlow 0 110) 108) anon398_Else_correct))))))
(let ((anon396_Then_correct  (=> (not (= node@2 null)) (and (=> (= (ControlFlow 0 112) 101) anon397_Then_correct) (=> (= (ControlFlow 0 112) 110) anon397_Else_correct)))))
(let ((anon396_Else_correct  (=> (and (= node@2 null) (= (ControlFlow 0 99) 91)) anon240_correct)))
(let ((anon234_correct  (=> (and (state Heap@1 Mask@21) (state Heap@1 Mask@21)) (and (=> (= (ControlFlow 0 113) (- 0 114)) (HasDirectPerm Mask@21 node@1 next)) (=> (HasDirectPerm Mask@21 node@1 next) (=> (and (and (= node@2 (MapType0Select Heap@1 node@1 next)) (state Heap@1 Mask@21)) (and (= count@1 (+ count@0 1)) (state Heap@1 Mask@21))) (and (=> (= (ControlFlow 0 113) 112) anon396_Then_correct) (=> (= (ControlFlow 0 113) 99) anon396_Else_correct))))))))
(let ((anon233_correct  (=> (state ExhaleHeap@13 QPMask@26) (=> (and (and (state ExhaleHeap@13 QPMask@26) (= Heap@1 ExhaleHeap@13)) (and (= Mask@21 QPMask@26) (= (ControlFlow 0 140) 113))) anon234_correct))))
(let ((anon395_Else_correct  (=> (and (= vexit@0 null) (= (ControlFlow 0 142) 140)) anon233_correct)))
(let ((anon395_Then_correct  (=> (and (and (not (= vexit@0 null)) (state ExhaleHeap@13 QPMask@26)) (and (forall ((v1_19 T@U) (v2_19 T@U) ) (!  (=> (and (and (= (type v1_19) RefType) (= (type v2_19) RefType)) (not (= v1_19 v2_19))) (= (exists_path ($$ ExhaleHeap@13 g) v1_19 v2_19)  (or (exists_path ($$ ExhaleHeap@12 g) v1_19 v2_19) (and (exists_path ($$ ExhaleHeap@12 g) v1_19 node_i@1) (exists_path ($$ ExhaleHeap@12 g) vexit@0 v2_19)))))
 :qid |stdinbpl.6000:36|
 :skolemid |665|
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| ExhaleHeap@13 g))) g) v1_19 v2_19))
)) (= (ControlFlow 0 141) 140))) anon233_correct)))
(let ((anon394_Else_correct  (=> (= vexit@0 null) (and (=> (= (ControlFlow 0 144) 141) anon395_Then_correct) (=> (= (ControlFlow 0 144) 142) anon395_Else_correct)))))
(let ((anon394_Then_correct  (=> (not (= vexit@0 null)) (=> (and (state ExhaleHeap@13 QPMask@26) (forall ((v1_18 T@U) (v2_18 T@U) ) (!  (=> (and (= (type v1_18) RefType) (= (type v2_18) RefType)) (= (edge ($$ ExhaleHeap@13 g) v1_18 v2_18)  (or (edge ($$ ExhaleHeap@12 g) v1_18 v2_18) (and (= v1_18 node_i@1) (= v2_18 vexit@0)))))
 :qid |stdinbpl.5993:36|
 :skolemid |664|
 :pattern ( (edge (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| ExhaleHeap@12 g))) g) v1_18 v2_18))
))) (and (=> (= (ControlFlow 0 143) 141) anon395_Then_correct) (=> (= (ControlFlow 0 143) 142) anon395_Else_correct))))))
(let ((anon393_Else_correct  (=> (not (= vexit@0 null)) (and (=> (= (ControlFlow 0 146) 143) anon394_Then_correct) (=> (= (ControlFlow 0 146) 144) anon394_Else_correct)))))
(let ((anon393_Then_correct  (=> (= vexit@0 null) (=> (and (state ExhaleHeap@13 QPMask@26) (|Set#Equal| ($$ ExhaleHeap@13 g) ($$ ExhaleHeap@12 g))) (and (=> (= (ControlFlow 0 145) 143) anon394_Then_correct) (=> (= (ControlFlow 0 145) 144) anon394_Else_correct))))))
(let ((anon391_Else_correct  (=> (forall ((n$0_21_1 T@U) ) (!  (=> (= (type n$0_21_1) RefType) (=> (and (U_2_bool (MapType2Select g n$0_21_1)) (not (= (MapType0Select ExhaleHeap@12 n$0_21_1 next) null))) (U_2_bool (MapType2Select g (MapType0Select ExhaleHeap@12 n$0_21_1 next)))))
 :qid |stdinbpl.5924:34|
 :skolemid |655|
 :pattern ( (MapType2Select g (MapType0Select ExhaleHeap@12 n$0_21_1 next)))
 :pattern ( (MapType2Select g n$0_21_1) (MapType0Select ExhaleHeap@12 n$0_21_1 next))
)) (and (=> (= (ControlFlow 0 147) (- 0 150)) (= (MapType0Select ExhaleHeap@12 node_i@1 next) null)) (=> (= (MapType0Select ExhaleHeap@12 node_i@1 next) null) (=> (and (IdenticalOnKnownLocations ExhaleHeap@12 ExhaleHeap@13 QPMask@25) (not (U_2_bool (MapType2Select g null)))) (=> (and (and (U_2_bool (MapType2Select g node_i@1)) (not (= node_i@1 null))) (and (= Mask@20 (MapType1Store QPMask@25 node_i@1 next (real_2_U (+ (U_2_real (MapType1Select QPMask@25 node_i@1 next)) FullPerm)))) (state ExhaleHeap@13 Mask@20))) (and (=> (= (ControlFlow 0 147) (- 0 149)) (forall ((n$1_11 T@U) (n$1_11_1 T@U) ) (!  (=> (and (= (type n$1_11) RefType) (= (type n$1_11_1) RefType)) (=> (and (and (and (and (not (= n$1_11 n$1_11_1)) (and (U_2_bool (MapType2Select g n$1_11)) (not (= n$1_11 node_i@1)))) (and (U_2_bool (MapType2Select g n$1_11_1)) (not (= n$1_11_1 node_i@1)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n$1_11 n$1_11_1))))
 :qid |stdinbpl.5944:29|
 :skolemid |656|
 :no-pattern (type n$1_11)
 :no-pattern (type n$1_11_1)
 :no-pattern (U_2_int n$1_11)
 :no-pattern (U_2_bool n$1_11)
 :no-pattern (U_2_int n$1_11_1)
 :no-pattern (U_2_bool n$1_11_1)
))) (=> (forall ((n$1_11@@0 T@U) (n$1_11_1@@0 T@U) ) (!  (=> (and (= (type n$1_11@@0) RefType) (= (type n$1_11_1@@0) RefType)) (=> (and (and (and (and (not (= n$1_11@@0 n$1_11_1@@0)) (and (U_2_bool (MapType2Select g n$1_11@@0)) (not (= n$1_11@@0 node_i@1)))) (and (U_2_bool (MapType2Select g n$1_11_1@@0)) (not (= n$1_11_1@@0 node_i@1)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n$1_11@@0 n$1_11_1@@0))))
 :qid |stdinbpl.5944:29|
 :skolemid |656|
 :no-pattern (type n$1_11@@0)
 :no-pattern (type n$1_11_1@@0)
 :no-pattern (U_2_int n$1_11@@0)
 :no-pattern (U_2_bool n$1_11@@0)
 :no-pattern (U_2_int n$1_11_1@@0)
 :no-pattern (U_2_bool n$1_11_1@@0)
)) (=> (and (forall ((n$1_11@@1 T@U) ) (!  (=> (= (type n$1_11@@1) RefType) (=> (and (and (U_2_bool (MapType2Select g n$1_11@@1)) (not (= n$1_11@@1 node_i@1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (and (qpRange68 n$1_11@@1) (= (invRecv68 n$1_11@@1) n$1_11@@1))))
 :qid |stdinbpl.5950:36|
 :skolemid |657|
 :pattern ( (MapType0Select ExhaleHeap@13 n$1_11@@1 next))
 :pattern ( (MapType1Select QPMask@26 n$1_11@@1 next))
 :pattern ( (MapType0Select ExhaleHeap@13 n$1_11@@1 next))
)) (forall ((o_3@@5 T@U) ) (!  (=> (= (type o_3@@5) RefType) (=> (and (and (and (U_2_bool (MapType2Select g (invRecv68 o_3@@5))) (not (= (invRecv68 o_3@@5) node_i@1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange68 o_3@@5)) (= (invRecv68 o_3@@5) o_3@@5)))
 :qid |stdinbpl.5954:36|
 :skolemid |658|
 :pattern ( (invRecv68 o_3@@5))
))) (and (=> (= (ControlFlow 0 147) (- 0 148)) (forall ((n$1_11@@2 T@U) ) (!  (=> (= (type n$1_11@@2) RefType) (=> (and (U_2_bool (MapType2Select g n$1_11@@2)) (not (= n$1_11@@2 node_i@1))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.5960:29|
 :skolemid |659|
 :pattern ( (MapType0Select ExhaleHeap@13 n$1_11@@2 next))
 :pattern ( (MapType1Select QPMask@26 n$1_11@@2 next))
 :pattern ( (MapType0Select ExhaleHeap@13 n$1_11@@2 next))
))) (=> (forall ((n$1_11@@3 T@U) ) (!  (=> (= (type n$1_11@@3) RefType) (=> (and (U_2_bool (MapType2Select g n$1_11@@3)) (not (= n$1_11@@3 node_i@1))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.5960:29|
 :skolemid |659|
 :pattern ( (MapType0Select ExhaleHeap@13 n$1_11@@3 next))
 :pattern ( (MapType1Select QPMask@26 n$1_11@@3 next))
 :pattern ( (MapType0Select ExhaleHeap@13 n$1_11@@3 next))
)) (=> (and (forall ((n$1_11@@4 T@U) ) (!  (=> (= (type n$1_11@@4) RefType) (=> (and (and (U_2_bool (MapType2Select g n$1_11@@4)) (not (= n$1_11@@4 node_i@1))) (> (/ (to_real 1) (to_real 2)) NoPerm)) (not (= n$1_11@@4 null))))
 :qid |stdinbpl.5966:36|
 :skolemid |660|
 :pattern ( (MapType0Select ExhaleHeap@13 n$1_11@@4 next))
 :pattern ( (MapType1Select QPMask@26 n$1_11@@4 next))
 :pattern ( (MapType0Select ExhaleHeap@13 n$1_11@@4 next))
)) (forall ((o_3@@6 T@U) ) (!  (=> (= (type o_3@@6) RefType) (and (=> (and (and (and (U_2_bool (MapType2Select g (invRecv68 o_3@@6))) (not (= (invRecv68 o_3@@6) node_i@1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange68 o_3@@6)) (and (=> (< NoPerm (/ (to_real 1) (to_real 2))) (= (invRecv68 o_3@@6) o_3@@6)) (= (U_2_real (MapType1Select QPMask@26 o_3@@6 next)) (+ (U_2_real (MapType1Select Mask@20 o_3@@6 next)) (/ (to_real 1) (to_real 2)))))) (=> (not (and (and (and (U_2_bool (MapType2Select g (invRecv68 o_3@@6))) (not (= (invRecv68 o_3@@6) node_i@1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange68 o_3@@6))) (= (U_2_real (MapType1Select QPMask@26 o_3@@6 next)) (U_2_real (MapType1Select Mask@20 o_3@@6 next))))))
 :qid |stdinbpl.5972:36|
 :skolemid |661|
 :pattern ( (MapType1Select QPMask@26 o_3@@6 next))
))) (=> (and (and (forall ((o_3@@7 T@U) (f_5@@1 T@U) ) (! (let ((B@@13 (FieldTypeInv1 (type f_5@@1))))
(let ((A@@14 (FieldTypeInv0 (type f_5@@1))))
 (=> (and (and (= (type o_3@@7) RefType) (= (type f_5@@1) (FieldType A@@14 B@@13))) (not (= f_5@@1 next))) (= (U_2_real (MapType1Select Mask@20 o_3@@7 f_5@@1)) (U_2_real (MapType1Select QPMask@26 o_3@@7 f_5@@1))))))
 :qid |stdinbpl.5976:43|
 :skolemid |662|
 :pattern ( (MapType1Select Mask@20 o_3@@7 f_5@@1))
 :pattern ( (MapType1Select QPMask@26 o_3@@7 f_5@@1))
)) (state ExhaleHeap@13 QPMask@26)) (and (forall ((n$2_13 T@U) ) (!  (=> (= (type n$2_13) RefType) (=> (and (U_2_bool (MapType2Select g n$2_13)) (not (= (MapType0Select ExhaleHeap@13 n$2_13 next) null))) (U_2_bool (MapType2Select g (MapType0Select ExhaleHeap@13 n$2_13 next)))))
 :qid |stdinbpl.5982:34|
 :skolemid |663|
 :pattern ( (MapType2Select g (MapType0Select ExhaleHeap@13 n$2_13 next)))
 :pattern ( (MapType2Select g n$2_13) (MapType0Select ExhaleHeap@13 n$2_13 next))
)) (= (MapType0Select ExhaleHeap@13 node_i@1 next) vexit@0))) (and (=> (= (ControlFlow 0 147) 145) anon393_Then_correct) (=> (= (ControlFlow 0 147) 146) anon393_Else_correct))))))))))))))))
(let ((anon223_correct  (=> (= Mask@19 (MapType1Store QPMask@24 node_i@1 next (real_2_U (- (U_2_real (MapType1Select QPMask@24 node_i@1 next)) FullPerm)))) (and (=> (= (ControlFlow 0 151) (- 0 154)) (forall ((n_22 T@U) ) (!  (=> (= (type n_22) RefType) (=> (and (and (U_2_bool (MapType2Select g n_22)) (not (= n_22 node_i@1))) (dummyFunction (MapType0Select ExhaleHeap@12 n_22 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.5876:31|
 :skolemid |648|
 :pattern ( (MapType0Select ExhaleHeap@12 n_22 next))
 :pattern ( (MapType1Select QPMask@25 n_22 next))
 :pattern ( (MapType0Select ExhaleHeap@12 n_22 next))
))) (=> (forall ((n_22@@0 T@U) ) (!  (=> (= (type n_22@@0) RefType) (=> (and (and (U_2_bool (MapType2Select g n_22@@0)) (not (= n_22@@0 node_i@1))) (dummyFunction (MapType0Select ExhaleHeap@12 n_22@@0 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.5876:31|
 :skolemid |648|
 :pattern ( (MapType0Select ExhaleHeap@12 n_22@@0 next))
 :pattern ( (MapType1Select QPMask@25 n_22@@0 next))
 :pattern ( (MapType0Select ExhaleHeap@12 n_22@@0 next))
)) (and (=> (= (ControlFlow 0 151) (- 0 153)) (forall ((n_22@@1 T@U) (n_22_1 T@U) ) (!  (=> (and (= (type n_22@@1) RefType) (= (type n_22_1) RefType)) (=> (and (and (and (and (not (= n_22@@1 n_22_1)) (and (U_2_bool (MapType2Select g n_22@@1)) (not (= n_22@@1 node_i@1)))) (and (U_2_bool (MapType2Select g n_22_1)) (not (= n_22_1 node_i@1)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_22@@1 n_22_1))))
 :qid |stdinbpl.5883:31|
 :skolemid |649|
 :pattern ( (neverTriggered67 n_22@@1) (neverTriggered67 n_22_1))
))) (=> (forall ((n_22@@2 T@U) (n_22_1@@0 T@U) ) (!  (=> (and (= (type n_22@@2) RefType) (= (type n_22_1@@0) RefType)) (=> (and (and (and (and (not (= n_22@@2 n_22_1@@0)) (and (U_2_bool (MapType2Select g n_22@@2)) (not (= n_22@@2 node_i@1)))) (and (U_2_bool (MapType2Select g n_22_1@@0)) (not (= n_22_1@@0 node_i@1)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_22@@2 n_22_1@@0))))
 :qid |stdinbpl.5883:31|
 :skolemid |649|
 :pattern ( (neverTriggered67 n_22@@2) (neverTriggered67 n_22_1@@0))
)) (and (=> (= (ControlFlow 0 151) (- 0 152)) (forall ((n_22@@3 T@U) ) (!  (=> (= (type n_22@@3) RefType) (=> (and (U_2_bool (MapType2Select g n_22@@3)) (not (= n_22@@3 node_i@1))) (>= (U_2_real (MapType1Select Mask@19 n_22@@3 next)) (/ (to_real 1) (to_real 2)))))
 :qid |stdinbpl.5890:31|
 :skolemid |650|
 :pattern ( (MapType0Select ExhaleHeap@12 n_22@@3 next))
 :pattern ( (MapType1Select QPMask@25 n_22@@3 next))
 :pattern ( (MapType0Select ExhaleHeap@12 n_22@@3 next))
))) (=> (forall ((n_22@@4 T@U) ) (!  (=> (= (type n_22@@4) RefType) (=> (and (U_2_bool (MapType2Select g n_22@@4)) (not (= n_22@@4 node_i@1))) (>= (U_2_real (MapType1Select Mask@19 n_22@@4 next)) (/ (to_real 1) (to_real 2)))))
 :qid |stdinbpl.5890:31|
 :skolemid |650|
 :pattern ( (MapType0Select ExhaleHeap@12 n_22@@4 next))
 :pattern ( (MapType1Select QPMask@25 n_22@@4 next))
 :pattern ( (MapType0Select ExhaleHeap@12 n_22@@4 next))
)) (=> (and (and (forall ((n_22@@5 T@U) ) (!  (=> (= (type n_22@@5) RefType) (=> (and (and (U_2_bool (MapType2Select g n_22@@5)) (not (= n_22@@5 node_i@1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (and (qpRange67 n_22@@5) (= (invRecv67 n_22@@5) n_22@@5))))
 :qid |stdinbpl.5896:36|
 :skolemid |651|
 :pattern ( (MapType0Select ExhaleHeap@12 n_22@@5 next))
 :pattern ( (MapType1Select QPMask@25 n_22@@5 next))
 :pattern ( (MapType0Select ExhaleHeap@12 n_22@@5 next))
)) (forall ((o_3@@8 T@U) ) (!  (=> (= (type o_3@@8) RefType) (=> (and (and (U_2_bool (MapType2Select g (invRecv67 o_3@@8))) (not (= (invRecv67 o_3@@8) node_i@1))) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange67 o_3@@8))) (= (invRecv67 o_3@@8) o_3@@8)))
 :qid |stdinbpl.5900:36|
 :skolemid |652|
 :pattern ( (invRecv67 o_3@@8))
))) (and (forall ((o_3@@9 T@U) ) (!  (=> (= (type o_3@@9) RefType) (and (=> (and (and (U_2_bool (MapType2Select g (invRecv67 o_3@@9))) (not (= (invRecv67 o_3@@9) node_i@1))) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange67 o_3@@9))) (and (= (invRecv67 o_3@@9) o_3@@9) (= (U_2_real (MapType1Select QPMask@25 o_3@@9 next)) (- (U_2_real (MapType1Select Mask@19 o_3@@9 next)) (/ (to_real 1) (to_real 2)))))) (=> (not (and (and (U_2_bool (MapType2Select g (invRecv67 o_3@@9))) (not (= (invRecv67 o_3@@9) node_i@1))) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange67 o_3@@9)))) (= (U_2_real (MapType1Select QPMask@25 o_3@@9 next)) (U_2_real (MapType1Select Mask@19 o_3@@9 next))))))
 :qid |stdinbpl.5906:36|
 :skolemid |653|
 :pattern ( (MapType1Select QPMask@25 o_3@@9 next))
)) (forall ((o_3@@10 T@U) (f_5@@2 T@U) ) (! (let ((B@@14 (FieldTypeInv1 (type f_5@@2))))
(let ((A@@15 (FieldTypeInv0 (type f_5@@2))))
 (=> (and (and (= (type o_3@@10) RefType) (= (type f_5@@2) (FieldType A@@15 B@@14))) (not (= f_5@@2 next))) (= (U_2_real (MapType1Select Mask@19 o_3@@10 f_5@@2)) (U_2_real (MapType1Select QPMask@25 o_3@@10 f_5@@2))))))
 :qid |stdinbpl.5912:43|
 :skolemid |654|
 :pattern ( (MapType1Select QPMask@25 o_3@@10 f_5@@2))
)))) (and (and (=> (= (ControlFlow 0 151) 147) anon391_Else_correct) (=> (= (ControlFlow 0 151) 137) anon392_Then_correct)) (=> (= (ControlFlow 0 151) 139) anon392_Else_correct))))))))))))
(let ((anon390_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 157) 151)) anon223_correct)))
(let ((anon390_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 155) (- 0 156)) (<= FullPerm (U_2_real (MapType1Select QPMask@24 node_i@1 next)))) (=> (<= FullPerm (U_2_real (MapType1Select QPMask@24 node_i@1 next))) (=> (= (ControlFlow 0 155) 151) anon223_correct))))))
(let ((anon221_correct  (and (=> (= (ControlFlow 0 158) (- 0 160)) (not (U_2_bool (MapType2Select g null)))) (=> (not (U_2_bool (MapType2Select g null))) (and (=> (= (ControlFlow 0 158) (- 0 159)) (U_2_bool (MapType2Select g node_i@1))) (=> (U_2_bool (MapType2Select g node_i@1)) (and (=> (= (ControlFlow 0 158) 155) anon390_Then_correct) (=> (= (ControlFlow 0 158) 157) anon390_Else_correct))))))))
(let ((anon389_Else_correct  (=> (and (= vexit@0 null) (= (ControlFlow 0 163) 158)) anon221_correct)))
(let ((anon389_Then_correct  (=> (not (= vexit@0 null)) (and (=> (= (ControlFlow 0 161) (- 0 162)) (U_2_bool (MapType2Select g vexit@0))) (=> (U_2_bool (MapType2Select g vexit@0)) (=> (= (ControlFlow 0 161) 158) anon221_correct))))))
(let ((anon219_correct  (=> (and (state ExhaleHeap@12 QPMask@24) (state ExhaleHeap@12 QPMask@24)) (and (=> (= (ControlFlow 0 164) (- 0 165)) (U_2_bool (MapType2Select g node_i@1))) (=> (U_2_bool (MapType2Select g node_i@1)) (and (=> (= (ControlFlow 0 164) 161) anon389_Then_correct) (=> (= (ControlFlow 0 164) 163) anon389_Else_correct)))))))
(let ((anon388_Else_correct  (=> (and (= (MapType0Select Heap@0 node_i@1 next) null) (= (ControlFlow 0 167) 164)) anon219_correct)))
(let ((anon388_Then_correct  (=> (and (and (not (= (MapType0Select Heap@0 node_i@1 next) null)) (state ExhaleHeap@12 QPMask@24)) (and (forall ((v1_17 T@U) (v2_17 T@U) ) (!  (=> (and (and (= (type v1_17) RefType) (= (type v2_17) RefType)) (not (= v1_17 v2_17))) (= (exists_path ($$ ExhaleHeap@12 g) v1_17 v2_17)  (and (exists_path ($$ Heap@0 g) v1_17 v2_17) (not (and (exists_path ($$ Heap@0 g) v1_17 node_i@1) (exists_path ($$ Heap@0 g) (MapType0Select Heap@0 node_i@1 next) v2_17))))))
 :qid |stdinbpl.5841:36|
 :skolemid |647|
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| ExhaleHeap@12 g))) g) v1_17 v2_17))
)) (= (ControlFlow 0 166) 164))) anon219_correct)))
(let ((anon387_Else_correct  (=> (= (MapType0Select Heap@0 node_i@1 next) null) (and (=> (= (ControlFlow 0 169) 166) anon388_Then_correct) (=> (= (ControlFlow 0 169) 167) anon388_Else_correct)))))
(let ((anon387_Then_correct  (=> (not (= (MapType0Select Heap@0 node_i@1 next) null)) (=> (and (state ExhaleHeap@12 QPMask@24) (forall ((v1_16 T@U) (v2_16 T@U) ) (!  (=> (and (= (type v1_16) RefType) (= (type v2_16) RefType)) (= (edge ($$ ExhaleHeap@12 g) v1_16 v2_16)  (and (edge ($$ Heap@0 g) v1_16 v2_16) (not (and (= v1_16 node_i@1) (= v2_16 (MapType0Select Heap@0 node_i@1 next)))))))
 :qid |stdinbpl.5834:36|
 :skolemid |646|
 :pattern ( (edge (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| ExhaleHeap@12 g))) g) v1_16 v2_16))
))) (and (=> (= (ControlFlow 0 168) 166) anon388_Then_correct) (=> (= (ControlFlow 0 168) 167) anon388_Else_correct))))))
(let ((anon386_Else_correct  (=> (not (= (MapType0Select Heap@0 node_i@1 next) null)) (and (=> (= (ControlFlow 0 171) 168) anon387_Then_correct) (=> (= (ControlFlow 0 171) 169) anon387_Else_correct)))))
(let ((anon386_Then_correct  (=> (= (MapType0Select Heap@0 node_i@1 next) null) (=> (and (state ExhaleHeap@12 QPMask@24) (|Set#Equal| ($$ ExhaleHeap@12 g) ($$ Heap@0 g))) (and (=> (= (ControlFlow 0 170) 168) anon387_Then_correct) (=> (= (ControlFlow 0 170) 169) anon387_Else_correct))))))
(let ((anon384_Else_correct  (=> (forall ((n$0_19_1 T@U) ) (!  (=> (= (type n$0_19_1) RefType) (=> (and (U_2_bool (MapType2Select g n$0_19_1)) (not (= (MapType0Select Heap@0 n$0_19_1 next) null))) (U_2_bool (MapType2Select g (MapType0Select Heap@0 n$0_19_1 next)))))
 :qid |stdinbpl.5767:34|
 :skolemid |637|
 :pattern ( (MapType2Select g (MapType0Select Heap@0 n$0_19_1 next)))
 :pattern ( (MapType2Select g n$0_19_1) (MapType0Select Heap@0 n$0_19_1 next))
)) (=> (and (IdenticalOnKnownLocations Heap@0 ExhaleHeap@12 QPMask@23) (not (U_2_bool (MapType2Select g null)))) (=> (and (and (U_2_bool (MapType2Select g node_i@1)) (not (= node_i@1 null))) (and (= Mask@18 (MapType1Store QPMask@23 node_i@1 next (real_2_U (+ (U_2_real (MapType1Select QPMask@23 node_i@1 next)) FullPerm)))) (state ExhaleHeap@12 Mask@18))) (and (=> (= (ControlFlow 0 172) (- 0 174)) (forall ((n$1_10 T@U) (n$1_10_1 T@U) ) (!  (=> (and (= (type n$1_10) RefType) (= (type n$1_10_1) RefType)) (=> (and (and (and (and (not (= n$1_10 n$1_10_1)) (and (U_2_bool (MapType2Select g n$1_10)) (not (= n$1_10 node_i@1)))) (and (U_2_bool (MapType2Select g n$1_10_1)) (not (= n$1_10_1 node_i@1)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n$1_10 n$1_10_1))))
 :qid |stdinbpl.5785:29|
 :skolemid |638|
 :no-pattern (type n$1_10)
 :no-pattern (type n$1_10_1)
 :no-pattern (U_2_int n$1_10)
 :no-pattern (U_2_bool n$1_10)
 :no-pattern (U_2_int n$1_10_1)
 :no-pattern (U_2_bool n$1_10_1)
))) (=> (forall ((n$1_10@@0 T@U) (n$1_10_1@@0 T@U) ) (!  (=> (and (= (type n$1_10@@0) RefType) (= (type n$1_10_1@@0) RefType)) (=> (and (and (and (and (not (= n$1_10@@0 n$1_10_1@@0)) (and (U_2_bool (MapType2Select g n$1_10@@0)) (not (= n$1_10@@0 node_i@1)))) (and (U_2_bool (MapType2Select g n$1_10_1@@0)) (not (= n$1_10_1@@0 node_i@1)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n$1_10@@0 n$1_10_1@@0))))
 :qid |stdinbpl.5785:29|
 :skolemid |638|
 :no-pattern (type n$1_10@@0)
 :no-pattern (type n$1_10_1@@0)
 :no-pattern (U_2_int n$1_10@@0)
 :no-pattern (U_2_bool n$1_10@@0)
 :no-pattern (U_2_int n$1_10_1@@0)
 :no-pattern (U_2_bool n$1_10_1@@0)
)) (=> (and (forall ((n$1_10@@1 T@U) ) (!  (=> (= (type n$1_10@@1) RefType) (=> (and (and (U_2_bool (MapType2Select g n$1_10@@1)) (not (= n$1_10@@1 node_i@1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (and (qpRange66 n$1_10@@1) (= (invRecv66 n$1_10@@1) n$1_10@@1))))
 :qid |stdinbpl.5791:36|
 :skolemid |639|
 :pattern ( (MapType0Select ExhaleHeap@12 n$1_10@@1 next))
 :pattern ( (MapType1Select QPMask@24 n$1_10@@1 next))
 :pattern ( (MapType0Select ExhaleHeap@12 n$1_10@@1 next))
)) (forall ((o_3@@11 T@U) ) (!  (=> (= (type o_3@@11) RefType) (=> (and (and (and (U_2_bool (MapType2Select g (invRecv66 o_3@@11))) (not (= (invRecv66 o_3@@11) node_i@1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange66 o_3@@11)) (= (invRecv66 o_3@@11) o_3@@11)))
 :qid |stdinbpl.5795:36|
 :skolemid |640|
 :pattern ( (invRecv66 o_3@@11))
))) (and (=> (= (ControlFlow 0 172) (- 0 173)) (forall ((n$1_10@@2 T@U) ) (!  (=> (= (type n$1_10@@2) RefType) (=> (and (U_2_bool (MapType2Select g n$1_10@@2)) (not (= n$1_10@@2 node_i@1))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.5801:29|
 :skolemid |641|
 :pattern ( (MapType0Select ExhaleHeap@12 n$1_10@@2 next))
 :pattern ( (MapType1Select QPMask@24 n$1_10@@2 next))
 :pattern ( (MapType0Select ExhaleHeap@12 n$1_10@@2 next))
))) (=> (forall ((n$1_10@@3 T@U) ) (!  (=> (= (type n$1_10@@3) RefType) (=> (and (U_2_bool (MapType2Select g n$1_10@@3)) (not (= n$1_10@@3 node_i@1))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.5801:29|
 :skolemid |641|
 :pattern ( (MapType0Select ExhaleHeap@12 n$1_10@@3 next))
 :pattern ( (MapType1Select QPMask@24 n$1_10@@3 next))
 :pattern ( (MapType0Select ExhaleHeap@12 n$1_10@@3 next))
)) (=> (and (forall ((n$1_10@@4 T@U) ) (!  (=> (= (type n$1_10@@4) RefType) (=> (and (and (U_2_bool (MapType2Select g n$1_10@@4)) (not (= n$1_10@@4 node_i@1))) (> (/ (to_real 1) (to_real 2)) NoPerm)) (not (= n$1_10@@4 null))))
 :qid |stdinbpl.5807:36|
 :skolemid |642|
 :pattern ( (MapType0Select ExhaleHeap@12 n$1_10@@4 next))
 :pattern ( (MapType1Select QPMask@24 n$1_10@@4 next))
 :pattern ( (MapType0Select ExhaleHeap@12 n$1_10@@4 next))
)) (forall ((o_3@@12 T@U) ) (!  (=> (= (type o_3@@12) RefType) (and (=> (and (and (and (U_2_bool (MapType2Select g (invRecv66 o_3@@12))) (not (= (invRecv66 o_3@@12) node_i@1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange66 o_3@@12)) (and (=> (< NoPerm (/ (to_real 1) (to_real 2))) (= (invRecv66 o_3@@12) o_3@@12)) (= (U_2_real (MapType1Select QPMask@24 o_3@@12 next)) (+ (U_2_real (MapType1Select Mask@18 o_3@@12 next)) (/ (to_real 1) (to_real 2)))))) (=> (not (and (and (and (U_2_bool (MapType2Select g (invRecv66 o_3@@12))) (not (= (invRecv66 o_3@@12) node_i@1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange66 o_3@@12))) (= (U_2_real (MapType1Select QPMask@24 o_3@@12 next)) (U_2_real (MapType1Select Mask@18 o_3@@12 next))))))
 :qid |stdinbpl.5813:36|
 :skolemid |643|
 :pattern ( (MapType1Select QPMask@24 o_3@@12 next))
))) (=> (and (and (forall ((o_3@@13 T@U) (f_5@@3 T@U) ) (! (let ((B@@15 (FieldTypeInv1 (type f_5@@3))))
(let ((A@@16 (FieldTypeInv0 (type f_5@@3))))
 (=> (and (and (= (type o_3@@13) RefType) (= (type f_5@@3) (FieldType A@@16 B@@15))) (not (= f_5@@3 next))) (= (U_2_real (MapType1Select Mask@18 o_3@@13 f_5@@3)) (U_2_real (MapType1Select QPMask@24 o_3@@13 f_5@@3))))))
 :qid |stdinbpl.5817:43|
 :skolemid |644|
 :pattern ( (MapType1Select Mask@18 o_3@@13 f_5@@3))
 :pattern ( (MapType1Select QPMask@24 o_3@@13 f_5@@3))
)) (state ExhaleHeap@12 QPMask@24)) (and (forall ((n$2_12 T@U) ) (!  (=> (= (type n$2_12) RefType) (=> (and (U_2_bool (MapType2Select g n$2_12)) (not (= (MapType0Select ExhaleHeap@12 n$2_12 next) null))) (U_2_bool (MapType2Select g (MapType0Select ExhaleHeap@12 n$2_12 next)))))
 :qid |stdinbpl.5823:34|
 :skolemid |645|
 :pattern ( (MapType2Select g (MapType0Select ExhaleHeap@12 n$2_12 next)))
 :pattern ( (MapType2Select g n$2_12) (MapType0Select ExhaleHeap@12 n$2_12 next))
)) (= (MapType0Select ExhaleHeap@12 node_i@1 next) null))) (and (=> (= (ControlFlow 0 172) 170) anon386_Then_correct) (=> (= (ControlFlow 0 172) 171) anon386_Else_correct))))))))))))))
(let ((anon209_correct  (=> (= Mask@17 (MapType1Store Mask@16 node_i@1 next (real_2_U (- (U_2_real (MapType1Select Mask@16 node_i@1 next)) FullPerm)))) (and (=> (= (ControlFlow 0 175) (- 0 178)) (forall ((n_21 T@U) ) (!  (=> (= (type n_21) RefType) (=> (and (and (U_2_bool (MapType2Select g n_21)) (not (= n_21 node_i@1))) (dummyFunction (MapType0Select Heap@0 n_21 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.5719:31|
 :skolemid |630|
 :pattern ( (MapType0Select Heap@0 n_21 next))
 :pattern ( (MapType1Select QPMask@23 n_21 next))
 :pattern ( (MapType0Select Heap@0 n_21 next))
))) (=> (forall ((n_21@@0 T@U) ) (!  (=> (= (type n_21@@0) RefType) (=> (and (and (U_2_bool (MapType2Select g n_21@@0)) (not (= n_21@@0 node_i@1))) (dummyFunction (MapType0Select Heap@0 n_21@@0 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.5719:31|
 :skolemid |630|
 :pattern ( (MapType0Select Heap@0 n_21@@0 next))
 :pattern ( (MapType1Select QPMask@23 n_21@@0 next))
 :pattern ( (MapType0Select Heap@0 n_21@@0 next))
)) (and (=> (= (ControlFlow 0 175) (- 0 177)) (forall ((n_21@@1 T@U) (n_21_1 T@U) ) (!  (=> (and (= (type n_21@@1) RefType) (= (type n_21_1) RefType)) (=> (and (and (and (and (not (= n_21@@1 n_21_1)) (and (U_2_bool (MapType2Select g n_21@@1)) (not (= n_21@@1 node_i@1)))) (and (U_2_bool (MapType2Select g n_21_1)) (not (= n_21_1 node_i@1)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_21@@1 n_21_1))))
 :qid |stdinbpl.5726:31|
 :skolemid |631|
 :pattern ( (neverTriggered65 n_21@@1) (neverTriggered65 n_21_1))
))) (=> (forall ((n_21@@2 T@U) (n_21_1@@0 T@U) ) (!  (=> (and (= (type n_21@@2) RefType) (= (type n_21_1@@0) RefType)) (=> (and (and (and (and (not (= n_21@@2 n_21_1@@0)) (and (U_2_bool (MapType2Select g n_21@@2)) (not (= n_21@@2 node_i@1)))) (and (U_2_bool (MapType2Select g n_21_1@@0)) (not (= n_21_1@@0 node_i@1)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_21@@2 n_21_1@@0))))
 :qid |stdinbpl.5726:31|
 :skolemid |631|
 :pattern ( (neverTriggered65 n_21@@2) (neverTriggered65 n_21_1@@0))
)) (and (=> (= (ControlFlow 0 175) (- 0 176)) (forall ((n_21@@3 T@U) ) (!  (=> (= (type n_21@@3) RefType) (=> (and (U_2_bool (MapType2Select g n_21@@3)) (not (= n_21@@3 node_i@1))) (>= (U_2_real (MapType1Select Mask@17 n_21@@3 next)) (/ (to_real 1) (to_real 2)))))
 :qid |stdinbpl.5733:31|
 :skolemid |632|
 :pattern ( (MapType0Select Heap@0 n_21@@3 next))
 :pattern ( (MapType1Select QPMask@23 n_21@@3 next))
 :pattern ( (MapType0Select Heap@0 n_21@@3 next))
))) (=> (forall ((n_21@@4 T@U) ) (!  (=> (= (type n_21@@4) RefType) (=> (and (U_2_bool (MapType2Select g n_21@@4)) (not (= n_21@@4 node_i@1))) (>= (U_2_real (MapType1Select Mask@17 n_21@@4 next)) (/ (to_real 1) (to_real 2)))))
 :qid |stdinbpl.5733:31|
 :skolemid |632|
 :pattern ( (MapType0Select Heap@0 n_21@@4 next))
 :pattern ( (MapType1Select QPMask@23 n_21@@4 next))
 :pattern ( (MapType0Select Heap@0 n_21@@4 next))
)) (=> (and (and (forall ((n_21@@5 T@U) ) (!  (=> (= (type n_21@@5) RefType) (=> (and (and (U_2_bool (MapType2Select g n_21@@5)) (not (= n_21@@5 node_i@1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (and (qpRange65 n_21@@5) (= (invRecv65 n_21@@5) n_21@@5))))
 :qid |stdinbpl.5739:36|
 :skolemid |633|
 :pattern ( (MapType0Select Heap@0 n_21@@5 next))
 :pattern ( (MapType1Select QPMask@23 n_21@@5 next))
 :pattern ( (MapType0Select Heap@0 n_21@@5 next))
)) (forall ((o_3@@14 T@U) ) (!  (=> (= (type o_3@@14) RefType) (=> (and (and (U_2_bool (MapType2Select g (invRecv65 o_3@@14))) (not (= (invRecv65 o_3@@14) node_i@1))) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange65 o_3@@14))) (= (invRecv65 o_3@@14) o_3@@14)))
 :qid |stdinbpl.5743:36|
 :skolemid |634|
 :pattern ( (invRecv65 o_3@@14))
))) (and (forall ((o_3@@15 T@U) ) (!  (=> (= (type o_3@@15) RefType) (and (=> (and (and (U_2_bool (MapType2Select g (invRecv65 o_3@@15))) (not (= (invRecv65 o_3@@15) node_i@1))) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange65 o_3@@15))) (and (= (invRecv65 o_3@@15) o_3@@15) (= (U_2_real (MapType1Select QPMask@23 o_3@@15 next)) (- (U_2_real (MapType1Select Mask@17 o_3@@15 next)) (/ (to_real 1) (to_real 2)))))) (=> (not (and (and (U_2_bool (MapType2Select g (invRecv65 o_3@@15))) (not (= (invRecv65 o_3@@15) node_i@1))) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange65 o_3@@15)))) (= (U_2_real (MapType1Select QPMask@23 o_3@@15 next)) (U_2_real (MapType1Select Mask@17 o_3@@15 next))))))
 :qid |stdinbpl.5749:36|
 :skolemid |635|
 :pattern ( (MapType1Select QPMask@23 o_3@@15 next))
)) (forall ((o_3@@16 T@U) (f_5@@4 T@U) ) (! (let ((B@@16 (FieldTypeInv1 (type f_5@@4))))
(let ((A@@17 (FieldTypeInv0 (type f_5@@4))))
 (=> (and (and (= (type o_3@@16) RefType) (= (type f_5@@4) (FieldType A@@17 B@@16))) (not (= f_5@@4 next))) (= (U_2_real (MapType1Select Mask@17 o_3@@16 f_5@@4)) (U_2_real (MapType1Select QPMask@23 o_3@@16 f_5@@4))))))
 :qid |stdinbpl.5755:43|
 :skolemid |636|
 :pattern ( (MapType1Select QPMask@23 o_3@@16 f_5@@4))
)))) (and (and (=> (= (ControlFlow 0 175) 172) anon384_Else_correct) (=> (= (ControlFlow 0 175) 133) anon385_Then_correct)) (=> (= (ControlFlow 0 175) 135) anon385_Else_correct))))))))))))
(let ((anon383_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 181) 175)) anon209_correct)))
(let ((anon383_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 179) (- 0 180)) (<= FullPerm (U_2_real (MapType1Select Mask@16 node_i@1 next)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@16 node_i@1 next))) (=> (= (ControlFlow 0 179) 175) anon209_correct))))))
(let ((anon207_correct  (=> (state Heap@0 Mask@16) (and (=> (= (ControlFlow 0 182) (- 0 185)) (U_2_bool (MapType2Select g node_i@1))) (=> (U_2_bool (MapType2Select g node_i@1)) (and (=> (= (ControlFlow 0 182) (- 0 184)) (not (U_2_bool (MapType2Select g null)))) (=> (not (U_2_bool (MapType2Select g null))) (and (=> (= (ControlFlow 0 182) (- 0 183)) (U_2_bool (MapType2Select g node_i@1))) (=> (U_2_bool (MapType2Select g node_i@1)) (and (=> (= (ControlFlow 0 182) 179) anon383_Then_correct) (=> (= (ControlFlow 0 182) 181) anon383_Else_correct)))))))))))
(let ((anon179_correct  (=> (state ExhaleHeap@11 QPMask@22) (=> (and (and (state ExhaleHeap@11 QPMask@22) (= Mask@16 QPMask@22)) (and (= Heap@0 ExhaleHeap@11) (= (ControlFlow 0 248) 182))) anon207_correct))))
(let ((anon369_Else_correct  (=> (and (= node_i@1 null) (= (ControlFlow 0 250) 248)) anon179_correct)))
(let ((anon369_Then_correct  (=> (and (and (not (= node_i@1 null)) (state ExhaleHeap@11 QPMask@22)) (and (forall ((v1_11 T@U) (v2_11 T@U) ) (!  (=> (and (and (= (type v1_11) RefType) (= (type v2_11) RefType)) (not (= v1_11 v2_11))) (= (exists_path ($$ ExhaleHeap@11 g) v1_11 v2_11)  (or (exists_path ($$ ExhaleHeap@10 g) v1_11 v2_11) (and (exists_path ($$ ExhaleHeap@10 g) v1_11 prev_node@0) (exists_path ($$ ExhaleHeap@10 g) node_i@1 v2_11)))))
 :qid |stdinbpl.5373:40|
 :skolemid |593|
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| ExhaleHeap@11 g))) g) v1_11 v2_11))
)) (= (ControlFlow 0 249) 248))) anon179_correct)))
(let ((anon368_Else_correct  (=> (= node_i@1 null) (and (=> (= (ControlFlow 0 252) 249) anon369_Then_correct) (=> (= (ControlFlow 0 252) 250) anon369_Else_correct)))))
(let ((anon368_Then_correct  (=> (not (= node_i@1 null)) (=> (and (state ExhaleHeap@11 QPMask@22) (forall ((v1_10 T@U) (v2_10 T@U) ) (!  (=> (and (= (type v1_10) RefType) (= (type v2_10) RefType)) (= (edge ($$ ExhaleHeap@11 g) v1_10 v2_10)  (or (edge ($$ ExhaleHeap@10 g) v1_10 v2_10) (and (= v1_10 prev_node@0) (= v2_10 node_i@1)))))
 :qid |stdinbpl.5366:40|
 :skolemid |592|
 :pattern ( (edge (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| ExhaleHeap@10 g))) g) v1_10 v2_10))
))) (and (=> (= (ControlFlow 0 251) 249) anon369_Then_correct) (=> (= (ControlFlow 0 251) 250) anon369_Else_correct))))))
(let ((anon367_Else_correct  (=> (not (= node_i@1 null)) (and (=> (= (ControlFlow 0 254) 251) anon368_Then_correct) (=> (= (ControlFlow 0 254) 252) anon368_Else_correct)))))
(let ((anon367_Then_correct  (=> (= node_i@1 null) (=> (and (state ExhaleHeap@11 QPMask@22) (|Set#Equal| ($$ ExhaleHeap@11 g) ($$ ExhaleHeap@10 g))) (and (=> (= (ControlFlow 0 253) 251) anon368_Then_correct) (=> (= (ControlFlow 0 253) 252) anon368_Else_correct))))))
(let ((anon365_Else_correct  (=> (forall ((n$0_13_1 T@U) ) (!  (=> (= (type n$0_13_1) RefType) (=> (and (U_2_bool (MapType2Select g n$0_13_1)) (not (= (MapType0Select ExhaleHeap@10 n$0_13_1 next) null))) (U_2_bool (MapType2Select g (MapType0Select ExhaleHeap@10 n$0_13_1 next)))))
 :qid |stdinbpl.5297:38|
 :skolemid |583|
 :pattern ( (MapType2Select g (MapType0Select ExhaleHeap@10 n$0_13_1 next)))
 :pattern ( (MapType2Select g n$0_13_1) (MapType0Select ExhaleHeap@10 n$0_13_1 next))
)) (and (=> (= (ControlFlow 0 255) (- 0 258)) (= (MapType0Select ExhaleHeap@10 prev_node@0 next) null)) (=> (= (MapType0Select ExhaleHeap@10 prev_node@0 next) null) (=> (and (IdenticalOnKnownLocations ExhaleHeap@10 ExhaleHeap@11 QPMask@21) (not (U_2_bool (MapType2Select g null)))) (=> (and (and (U_2_bool (MapType2Select g prev_node@0)) (not (= prev_node@0 null))) (and (= Mask@15 (MapType1Store QPMask@21 prev_node@0 next (real_2_U (+ (U_2_real (MapType1Select QPMask@21 prev_node@0 next)) FullPerm)))) (state ExhaleHeap@11 Mask@15))) (and (=> (= (ControlFlow 0 255) (- 0 257)) (forall ((n$1_7 T@U) (n$1_7_1 T@U) ) (!  (=> (and (= (type n$1_7) RefType) (= (type n$1_7_1) RefType)) (=> (and (and (and (and (not (= n$1_7 n$1_7_1)) (and (U_2_bool (MapType2Select g n$1_7)) (not (= n$1_7 prev_node@0)))) (and (U_2_bool (MapType2Select g n$1_7_1)) (not (= n$1_7_1 prev_node@0)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n$1_7 n$1_7_1))))
 :qid |stdinbpl.5317:33|
 :skolemid |584|
 :no-pattern (type n$1_7)
 :no-pattern (type n$1_7_1)
 :no-pattern (U_2_int n$1_7)
 :no-pattern (U_2_bool n$1_7)
 :no-pattern (U_2_int n$1_7_1)
 :no-pattern (U_2_bool n$1_7_1)
))) (=> (forall ((n$1_7@@0 T@U) (n$1_7_1@@0 T@U) ) (!  (=> (and (= (type n$1_7@@0) RefType) (= (type n$1_7_1@@0) RefType)) (=> (and (and (and (and (not (= n$1_7@@0 n$1_7_1@@0)) (and (U_2_bool (MapType2Select g n$1_7@@0)) (not (= n$1_7@@0 prev_node@0)))) (and (U_2_bool (MapType2Select g n$1_7_1@@0)) (not (= n$1_7_1@@0 prev_node@0)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n$1_7@@0 n$1_7_1@@0))))
 :qid |stdinbpl.5317:33|
 :skolemid |584|
 :no-pattern (type n$1_7@@0)
 :no-pattern (type n$1_7_1@@0)
 :no-pattern (U_2_int n$1_7@@0)
 :no-pattern (U_2_bool n$1_7@@0)
 :no-pattern (U_2_int n$1_7_1@@0)
 :no-pattern (U_2_bool n$1_7_1@@0)
)) (=> (and (forall ((n$1_7@@1 T@U) ) (!  (=> (= (type n$1_7@@1) RefType) (=> (and (and (U_2_bool (MapType2Select g n$1_7@@1)) (not (= n$1_7@@1 prev_node@0))) (< NoPerm (/ (to_real 1) (to_real 2)))) (and (qpRange60 n$1_7@@1) (= (invRecv60 n$1_7@@1) n$1_7@@1))))
 :qid |stdinbpl.5323:40|
 :skolemid |585|
 :pattern ( (MapType0Select ExhaleHeap@11 n$1_7@@1 next))
 :pattern ( (MapType1Select QPMask@22 n$1_7@@1 next))
 :pattern ( (MapType0Select ExhaleHeap@11 n$1_7@@1 next))
)) (forall ((o_3@@17 T@U) ) (!  (=> (= (type o_3@@17) RefType) (=> (and (and (and (U_2_bool (MapType2Select g (invRecv60 o_3@@17))) (not (= (invRecv60 o_3@@17) prev_node@0))) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange60 o_3@@17)) (= (invRecv60 o_3@@17) o_3@@17)))
 :qid |stdinbpl.5327:40|
 :skolemid |586|
 :pattern ( (invRecv60 o_3@@17))
))) (and (=> (= (ControlFlow 0 255) (- 0 256)) (forall ((n$1_7@@2 T@U) ) (!  (=> (= (type n$1_7@@2) RefType) (=> (and (U_2_bool (MapType2Select g n$1_7@@2)) (not (= n$1_7@@2 prev_node@0))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.5333:33|
 :skolemid |587|
 :pattern ( (MapType0Select ExhaleHeap@11 n$1_7@@2 next))
 :pattern ( (MapType1Select QPMask@22 n$1_7@@2 next))
 :pattern ( (MapType0Select ExhaleHeap@11 n$1_7@@2 next))
))) (=> (forall ((n$1_7@@3 T@U) ) (!  (=> (= (type n$1_7@@3) RefType) (=> (and (U_2_bool (MapType2Select g n$1_7@@3)) (not (= n$1_7@@3 prev_node@0))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.5333:33|
 :skolemid |587|
 :pattern ( (MapType0Select ExhaleHeap@11 n$1_7@@3 next))
 :pattern ( (MapType1Select QPMask@22 n$1_7@@3 next))
 :pattern ( (MapType0Select ExhaleHeap@11 n$1_7@@3 next))
)) (=> (and (forall ((n$1_7@@4 T@U) ) (!  (=> (= (type n$1_7@@4) RefType) (=> (and (and (U_2_bool (MapType2Select g n$1_7@@4)) (not (= n$1_7@@4 prev_node@0))) (> (/ (to_real 1) (to_real 2)) NoPerm)) (not (= n$1_7@@4 null))))
 :qid |stdinbpl.5339:40|
 :skolemid |588|
 :pattern ( (MapType0Select ExhaleHeap@11 n$1_7@@4 next))
 :pattern ( (MapType1Select QPMask@22 n$1_7@@4 next))
 :pattern ( (MapType0Select ExhaleHeap@11 n$1_7@@4 next))
)) (forall ((o_3@@18 T@U) ) (!  (=> (= (type o_3@@18) RefType) (and (=> (and (and (and (U_2_bool (MapType2Select g (invRecv60 o_3@@18))) (not (= (invRecv60 o_3@@18) prev_node@0))) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange60 o_3@@18)) (and (=> (< NoPerm (/ (to_real 1) (to_real 2))) (= (invRecv60 o_3@@18) o_3@@18)) (= (U_2_real (MapType1Select QPMask@22 o_3@@18 next)) (+ (U_2_real (MapType1Select Mask@15 o_3@@18 next)) (/ (to_real 1) (to_real 2)))))) (=> (not (and (and (and (U_2_bool (MapType2Select g (invRecv60 o_3@@18))) (not (= (invRecv60 o_3@@18) prev_node@0))) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange60 o_3@@18))) (= (U_2_real (MapType1Select QPMask@22 o_3@@18 next)) (U_2_real (MapType1Select Mask@15 o_3@@18 next))))))
 :qid |stdinbpl.5345:40|
 :skolemid |589|
 :pattern ( (MapType1Select QPMask@22 o_3@@18 next))
))) (=> (and (and (forall ((o_3@@19 T@U) (f_5@@5 T@U) ) (! (let ((B@@17 (FieldTypeInv1 (type f_5@@5))))
(let ((A@@18 (FieldTypeInv0 (type f_5@@5))))
 (=> (and (and (= (type o_3@@19) RefType) (= (type f_5@@5) (FieldType A@@18 B@@17))) (not (= f_5@@5 next))) (= (U_2_real (MapType1Select Mask@15 o_3@@19 f_5@@5)) (U_2_real (MapType1Select QPMask@22 o_3@@19 f_5@@5))))))
 :qid |stdinbpl.5349:47|
 :skolemid |590|
 :pattern ( (MapType1Select Mask@15 o_3@@19 f_5@@5))
 :pattern ( (MapType1Select QPMask@22 o_3@@19 f_5@@5))
)) (state ExhaleHeap@11 QPMask@22)) (and (forall ((n$2_9 T@U) ) (!  (=> (= (type n$2_9) RefType) (=> (and (U_2_bool (MapType2Select g n$2_9)) (not (= (MapType0Select ExhaleHeap@11 n$2_9 next) null))) (U_2_bool (MapType2Select g (MapType0Select ExhaleHeap@11 n$2_9 next)))))
 :qid |stdinbpl.5355:38|
 :skolemid |591|
 :pattern ( (MapType2Select g (MapType0Select ExhaleHeap@11 n$2_9 next)))
 :pattern ( (MapType2Select g n$2_9) (MapType0Select ExhaleHeap@11 n$2_9 next))
)) (= (MapType0Select ExhaleHeap@11 prev_node@0 next) node_i@1))) (and (=> (= (ControlFlow 0 255) 253) anon367_Then_correct) (=> (= (ControlFlow 0 255) 254) anon367_Else_correct))))))))))))))))
(let ((anon169_correct  (=> (= Mask@14 (MapType1Store QPMask@20 prev_node@0 next (real_2_U (- (U_2_real (MapType1Select QPMask@20 prev_node@0 next)) FullPerm)))) (and (=> (= (ControlFlow 0 259) (- 0 262)) (forall ((n_18 T@U) ) (!  (=> (= (type n_18) RefType) (=> (and (and (U_2_bool (MapType2Select g n_18)) (not (= n_18 prev_node@0))) (dummyFunction (MapType0Select ExhaleHeap@10 n_18 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.5249:35|
 :skolemid |576|
 :pattern ( (MapType0Select ExhaleHeap@10 n_18 next))
 :pattern ( (MapType1Select QPMask@21 n_18 next))
 :pattern ( (MapType0Select ExhaleHeap@10 n_18 next))
))) (=> (forall ((n_18@@0 T@U) ) (!  (=> (= (type n_18@@0) RefType) (=> (and (and (U_2_bool (MapType2Select g n_18@@0)) (not (= n_18@@0 prev_node@0))) (dummyFunction (MapType0Select ExhaleHeap@10 n_18@@0 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.5249:35|
 :skolemid |576|
 :pattern ( (MapType0Select ExhaleHeap@10 n_18@@0 next))
 :pattern ( (MapType1Select QPMask@21 n_18@@0 next))
 :pattern ( (MapType0Select ExhaleHeap@10 n_18@@0 next))
)) (and (=> (= (ControlFlow 0 259) (- 0 261)) (forall ((n_18@@1 T@U) (n_18_1 T@U) ) (!  (=> (and (= (type n_18@@1) RefType) (= (type n_18_1) RefType)) (=> (and (and (and (and (not (= n_18@@1 n_18_1)) (and (U_2_bool (MapType2Select g n_18@@1)) (not (= n_18@@1 prev_node@0)))) (and (U_2_bool (MapType2Select g n_18_1)) (not (= n_18_1 prev_node@0)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_18@@1 n_18_1))))
 :qid |stdinbpl.5256:35|
 :skolemid |577|
 :pattern ( (neverTriggered59 n_18@@1) (neverTriggered59 n_18_1))
))) (=> (forall ((n_18@@2 T@U) (n_18_1@@0 T@U) ) (!  (=> (and (= (type n_18@@2) RefType) (= (type n_18_1@@0) RefType)) (=> (and (and (and (and (not (= n_18@@2 n_18_1@@0)) (and (U_2_bool (MapType2Select g n_18@@2)) (not (= n_18@@2 prev_node@0)))) (and (U_2_bool (MapType2Select g n_18_1@@0)) (not (= n_18_1@@0 prev_node@0)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_18@@2 n_18_1@@0))))
 :qid |stdinbpl.5256:35|
 :skolemid |577|
 :pattern ( (neverTriggered59 n_18@@2) (neverTriggered59 n_18_1@@0))
)) (and (=> (= (ControlFlow 0 259) (- 0 260)) (forall ((n_18@@3 T@U) ) (!  (=> (= (type n_18@@3) RefType) (=> (and (U_2_bool (MapType2Select g n_18@@3)) (not (= n_18@@3 prev_node@0))) (>= (U_2_real (MapType1Select Mask@14 n_18@@3 next)) (/ (to_real 1) (to_real 2)))))
 :qid |stdinbpl.5263:35|
 :skolemid |578|
 :pattern ( (MapType0Select ExhaleHeap@10 n_18@@3 next))
 :pattern ( (MapType1Select QPMask@21 n_18@@3 next))
 :pattern ( (MapType0Select ExhaleHeap@10 n_18@@3 next))
))) (=> (forall ((n_18@@4 T@U) ) (!  (=> (= (type n_18@@4) RefType) (=> (and (U_2_bool (MapType2Select g n_18@@4)) (not (= n_18@@4 prev_node@0))) (>= (U_2_real (MapType1Select Mask@14 n_18@@4 next)) (/ (to_real 1) (to_real 2)))))
 :qid |stdinbpl.5263:35|
 :skolemid |578|
 :pattern ( (MapType0Select ExhaleHeap@10 n_18@@4 next))
 :pattern ( (MapType1Select QPMask@21 n_18@@4 next))
 :pattern ( (MapType0Select ExhaleHeap@10 n_18@@4 next))
)) (=> (and (and (forall ((n_18@@5 T@U) ) (!  (=> (= (type n_18@@5) RefType) (=> (and (and (U_2_bool (MapType2Select g n_18@@5)) (not (= n_18@@5 prev_node@0))) (< NoPerm (/ (to_real 1) (to_real 2)))) (and (qpRange59 n_18@@5) (= (invRecv59 n_18@@5) n_18@@5))))
 :qid |stdinbpl.5269:40|
 :skolemid |579|
 :pattern ( (MapType0Select ExhaleHeap@10 n_18@@5 next))
 :pattern ( (MapType1Select QPMask@21 n_18@@5 next))
 :pattern ( (MapType0Select ExhaleHeap@10 n_18@@5 next))
)) (forall ((o_3@@20 T@U) ) (!  (=> (= (type o_3@@20) RefType) (=> (and (and (U_2_bool (MapType2Select g (invRecv59 o_3@@20))) (not (= (invRecv59 o_3@@20) prev_node@0))) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange59 o_3@@20))) (= (invRecv59 o_3@@20) o_3@@20)))
 :qid |stdinbpl.5273:40|
 :skolemid |580|
 :pattern ( (invRecv59 o_3@@20))
))) (and (forall ((o_3@@21 T@U) ) (!  (=> (= (type o_3@@21) RefType) (and (=> (and (and (U_2_bool (MapType2Select g (invRecv59 o_3@@21))) (not (= (invRecv59 o_3@@21) prev_node@0))) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange59 o_3@@21))) (and (= (invRecv59 o_3@@21) o_3@@21) (= (U_2_real (MapType1Select QPMask@21 o_3@@21 next)) (- (U_2_real (MapType1Select Mask@14 o_3@@21 next)) (/ (to_real 1) (to_real 2)))))) (=> (not (and (and (U_2_bool (MapType2Select g (invRecv59 o_3@@21))) (not (= (invRecv59 o_3@@21) prev_node@0))) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange59 o_3@@21)))) (= (U_2_real (MapType1Select QPMask@21 o_3@@21 next)) (U_2_real (MapType1Select Mask@14 o_3@@21 next))))))
 :qid |stdinbpl.5279:40|
 :skolemid |581|
 :pattern ( (MapType1Select QPMask@21 o_3@@21 next))
)) (forall ((o_3@@22 T@U) (f_5@@6 T@U) ) (! (let ((B@@18 (FieldTypeInv1 (type f_5@@6))))
(let ((A@@19 (FieldTypeInv0 (type f_5@@6))))
 (=> (and (and (= (type o_3@@22) RefType) (= (type f_5@@6) (FieldType A@@19 B@@18))) (not (= f_5@@6 next))) (= (U_2_real (MapType1Select Mask@14 o_3@@22 f_5@@6)) (U_2_real (MapType1Select QPMask@21 o_3@@22 f_5@@6))))))
 :qid |stdinbpl.5285:47|
 :skolemid |582|
 :pattern ( (MapType1Select QPMask@21 o_3@@22 f_5@@6))
)))) (and (and (=> (= (ControlFlow 0 259) 255) anon365_Else_correct) (=> (= (ControlFlow 0 259) 245) anon366_Then_correct)) (=> (= (ControlFlow 0 259) 247) anon366_Else_correct))))))))))))
(let ((anon364_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 265) 259)) anon169_correct)))
(let ((anon364_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 263) (- 0 264)) (<= FullPerm (U_2_real (MapType1Select QPMask@20 prev_node@0 next)))) (=> (<= FullPerm (U_2_real (MapType1Select QPMask@20 prev_node@0 next))) (=> (= (ControlFlow 0 263) 259) anon169_correct))))))
(let ((anon167_correct  (and (=> (= (ControlFlow 0 266) (- 0 268)) (not (U_2_bool (MapType2Select g null)))) (=> (not (U_2_bool (MapType2Select g null))) (and (=> (= (ControlFlow 0 266) (- 0 267)) (U_2_bool (MapType2Select g prev_node@0))) (=> (U_2_bool (MapType2Select g prev_node@0)) (and (=> (= (ControlFlow 0 266) 263) anon364_Then_correct) (=> (= (ControlFlow 0 266) 265) anon364_Else_correct))))))))
(let ((anon363_Else_correct  (=> (and (= node_i@1 null) (= (ControlFlow 0 271) 266)) anon167_correct)))
(let ((anon363_Then_correct  (=> (not (= node_i@1 null)) (and (=> (= (ControlFlow 0 269) (- 0 270)) (U_2_bool (MapType2Select g node_i@1))) (=> (U_2_bool (MapType2Select g node_i@1)) (=> (= (ControlFlow 0 269) 266) anon167_correct))))))
(let ((anon165_correct  (=> (and (state ExhaleHeap@10 QPMask@20) (state ExhaleHeap@10 QPMask@20)) (and (=> (= (ControlFlow 0 272) (- 0 273)) (U_2_bool (MapType2Select g prev_node@0))) (=> (U_2_bool (MapType2Select g prev_node@0)) (and (=> (= (ControlFlow 0 272) 269) anon363_Then_correct) (=> (= (ControlFlow 0 272) 271) anon363_Else_correct)))))))
(let ((anon362_Else_correct  (=> (and (= (MapType0Select ExhaleHeap@9 prev_node@0 next) null) (= (ControlFlow 0 275) 272)) anon165_correct)))
(let ((anon362_Then_correct  (=> (and (and (not (= (MapType0Select ExhaleHeap@9 prev_node@0 next) null)) (state ExhaleHeap@10 QPMask@20)) (and (forall ((v1_9 T@U) (v2_9 T@U) ) (!  (=> (and (and (= (type v1_9) RefType) (= (type v2_9) RefType)) (not (= v1_9 v2_9))) (= (exists_path ($$ ExhaleHeap@10 g) v1_9 v2_9)  (and (exists_path ($$ ExhaleHeap@9 g) v1_9 v2_9) (not (and (exists_path ($$ ExhaleHeap@9 g) v1_9 prev_node@0) (exists_path ($$ ExhaleHeap@9 g) (MapType0Select ExhaleHeap@9 prev_node@0 next) v2_9))))))
 :qid |stdinbpl.5214:40|
 :skolemid |575|
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| ExhaleHeap@10 g))) g) v1_9 v2_9))
)) (= (ControlFlow 0 274) 272))) anon165_correct)))
(let ((anon361_Else_correct  (=> (= (MapType0Select ExhaleHeap@9 prev_node@0 next) null) (and (=> (= (ControlFlow 0 277) 274) anon362_Then_correct) (=> (= (ControlFlow 0 277) 275) anon362_Else_correct)))))
(let ((anon361_Then_correct  (=> (not (= (MapType0Select ExhaleHeap@9 prev_node@0 next) null)) (=> (and (state ExhaleHeap@10 QPMask@20) (forall ((v1_8 T@U) (v2_8 T@U) ) (!  (=> (and (= (type v1_8) RefType) (= (type v2_8) RefType)) (= (edge ($$ ExhaleHeap@10 g) v1_8 v2_8)  (and (edge ($$ ExhaleHeap@9 g) v1_8 v2_8) (not (and (= v1_8 prev_node@0) (= v2_8 (MapType0Select ExhaleHeap@9 prev_node@0 next)))))))
 :qid |stdinbpl.5207:40|
 :skolemid |574|
 :pattern ( (edge (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| ExhaleHeap@10 g))) g) v1_8 v2_8))
))) (and (=> (= (ControlFlow 0 276) 274) anon362_Then_correct) (=> (= (ControlFlow 0 276) 275) anon362_Else_correct))))))
(let ((anon360_Else_correct  (=> (not (= (MapType0Select ExhaleHeap@9 prev_node@0 next) null)) (and (=> (= (ControlFlow 0 279) 276) anon361_Then_correct) (=> (= (ControlFlow 0 279) 277) anon361_Else_correct)))))
(let ((anon360_Then_correct  (=> (= (MapType0Select ExhaleHeap@9 prev_node@0 next) null) (=> (and (state ExhaleHeap@10 QPMask@20) (|Set#Equal| ($$ ExhaleHeap@10 g) ($$ ExhaleHeap@9 g))) (and (=> (= (ControlFlow 0 278) 276) anon361_Then_correct) (=> (= (ControlFlow 0 278) 277) anon361_Else_correct))))))
(let ((anon358_Else_correct  (=> (forall ((n$0_11_1 T@U) ) (!  (=> (= (type n$0_11_1) RefType) (=> (and (U_2_bool (MapType2Select g n$0_11_1)) (not (= (MapType0Select ExhaleHeap@9 n$0_11_1 next) null))) (U_2_bool (MapType2Select g (MapType0Select ExhaleHeap@9 n$0_11_1 next)))))
 :qid |stdinbpl.5140:38|
 :skolemid |565|
 :pattern ( (MapType2Select g (MapType0Select ExhaleHeap@9 n$0_11_1 next)))
 :pattern ( (MapType2Select g n$0_11_1) (MapType0Select ExhaleHeap@9 n$0_11_1 next))
)) (=> (and (IdenticalOnKnownLocations ExhaleHeap@9 ExhaleHeap@10 QPMask@19) (not (U_2_bool (MapType2Select g null)))) (=> (and (and (U_2_bool (MapType2Select g prev_node@0)) (not (= prev_node@0 null))) (and (= Mask@13 (MapType1Store QPMask@19 prev_node@0 next (real_2_U (+ (U_2_real (MapType1Select QPMask@19 prev_node@0 next)) FullPerm)))) (state ExhaleHeap@10 Mask@13))) (and (=> (= (ControlFlow 0 280) (- 0 282)) (forall ((n$1_6 T@U) (n$1_6_1 T@U) ) (!  (=> (and (= (type n$1_6) RefType) (= (type n$1_6_1) RefType)) (=> (and (and (and (and (not (= n$1_6 n$1_6_1)) (and (U_2_bool (MapType2Select g n$1_6)) (not (= n$1_6 prev_node@0)))) (and (U_2_bool (MapType2Select g n$1_6_1)) (not (= n$1_6_1 prev_node@0)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n$1_6 n$1_6_1))))
 :qid |stdinbpl.5158:33|
 :skolemid |566|
 :no-pattern (type n$1_6)
 :no-pattern (type n$1_6_1)
 :no-pattern (U_2_int n$1_6)
 :no-pattern (U_2_bool n$1_6)
 :no-pattern (U_2_int n$1_6_1)
 :no-pattern (U_2_bool n$1_6_1)
))) (=> (forall ((n$1_6@@0 T@U) (n$1_6_1@@0 T@U) ) (!  (=> (and (= (type n$1_6@@0) RefType) (= (type n$1_6_1@@0) RefType)) (=> (and (and (and (and (not (= n$1_6@@0 n$1_6_1@@0)) (and (U_2_bool (MapType2Select g n$1_6@@0)) (not (= n$1_6@@0 prev_node@0)))) (and (U_2_bool (MapType2Select g n$1_6_1@@0)) (not (= n$1_6_1@@0 prev_node@0)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n$1_6@@0 n$1_6_1@@0))))
 :qid |stdinbpl.5158:33|
 :skolemid |566|
 :no-pattern (type n$1_6@@0)
 :no-pattern (type n$1_6_1@@0)
 :no-pattern (U_2_int n$1_6@@0)
 :no-pattern (U_2_bool n$1_6@@0)
 :no-pattern (U_2_int n$1_6_1@@0)
 :no-pattern (U_2_bool n$1_6_1@@0)
)) (=> (and (forall ((n$1_6@@1 T@U) ) (!  (=> (= (type n$1_6@@1) RefType) (=> (and (and (U_2_bool (MapType2Select g n$1_6@@1)) (not (= n$1_6@@1 prev_node@0))) (< NoPerm (/ (to_real 1) (to_real 2)))) (and (qpRange58 n$1_6@@1) (= (invRecv58 n$1_6@@1) n$1_6@@1))))
 :qid |stdinbpl.5164:40|
 :skolemid |567|
 :pattern ( (MapType0Select ExhaleHeap@10 n$1_6@@1 next))
 :pattern ( (MapType1Select QPMask@20 n$1_6@@1 next))
 :pattern ( (MapType0Select ExhaleHeap@10 n$1_6@@1 next))
)) (forall ((o_3@@23 T@U) ) (!  (=> (= (type o_3@@23) RefType) (=> (and (and (and (U_2_bool (MapType2Select g (invRecv58 o_3@@23))) (not (= (invRecv58 o_3@@23) prev_node@0))) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange58 o_3@@23)) (= (invRecv58 o_3@@23) o_3@@23)))
 :qid |stdinbpl.5168:40|
 :skolemid |568|
 :pattern ( (invRecv58 o_3@@23))
))) (and (=> (= (ControlFlow 0 280) (- 0 281)) (forall ((n$1_6@@2 T@U) ) (!  (=> (= (type n$1_6@@2) RefType) (=> (and (U_2_bool (MapType2Select g n$1_6@@2)) (not (= n$1_6@@2 prev_node@0))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.5174:33|
 :skolemid |569|
 :pattern ( (MapType0Select ExhaleHeap@10 n$1_6@@2 next))
 :pattern ( (MapType1Select QPMask@20 n$1_6@@2 next))
 :pattern ( (MapType0Select ExhaleHeap@10 n$1_6@@2 next))
))) (=> (forall ((n$1_6@@3 T@U) ) (!  (=> (= (type n$1_6@@3) RefType) (=> (and (U_2_bool (MapType2Select g n$1_6@@3)) (not (= n$1_6@@3 prev_node@0))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.5174:33|
 :skolemid |569|
 :pattern ( (MapType0Select ExhaleHeap@10 n$1_6@@3 next))
 :pattern ( (MapType1Select QPMask@20 n$1_6@@3 next))
 :pattern ( (MapType0Select ExhaleHeap@10 n$1_6@@3 next))
)) (=> (and (forall ((n$1_6@@4 T@U) ) (!  (=> (= (type n$1_6@@4) RefType) (=> (and (and (U_2_bool (MapType2Select g n$1_6@@4)) (not (= n$1_6@@4 prev_node@0))) (> (/ (to_real 1) (to_real 2)) NoPerm)) (not (= n$1_6@@4 null))))
 :qid |stdinbpl.5180:40|
 :skolemid |570|
 :pattern ( (MapType0Select ExhaleHeap@10 n$1_6@@4 next))
 :pattern ( (MapType1Select QPMask@20 n$1_6@@4 next))
 :pattern ( (MapType0Select ExhaleHeap@10 n$1_6@@4 next))
)) (forall ((o_3@@24 T@U) ) (!  (=> (= (type o_3@@24) RefType) (and (=> (and (and (and (U_2_bool (MapType2Select g (invRecv58 o_3@@24))) (not (= (invRecv58 o_3@@24) prev_node@0))) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange58 o_3@@24)) (and (=> (< NoPerm (/ (to_real 1) (to_real 2))) (= (invRecv58 o_3@@24) o_3@@24)) (= (U_2_real (MapType1Select QPMask@20 o_3@@24 next)) (+ (U_2_real (MapType1Select Mask@13 o_3@@24 next)) (/ (to_real 1) (to_real 2)))))) (=> (not (and (and (and (U_2_bool (MapType2Select g (invRecv58 o_3@@24))) (not (= (invRecv58 o_3@@24) prev_node@0))) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange58 o_3@@24))) (= (U_2_real (MapType1Select QPMask@20 o_3@@24 next)) (U_2_real (MapType1Select Mask@13 o_3@@24 next))))))
 :qid |stdinbpl.5186:40|
 :skolemid |571|
 :pattern ( (MapType1Select QPMask@20 o_3@@24 next))
))) (=> (and (and (forall ((o_3@@25 T@U) (f_5@@7 T@U) ) (! (let ((B@@19 (FieldTypeInv1 (type f_5@@7))))
(let ((A@@20 (FieldTypeInv0 (type f_5@@7))))
 (=> (and (and (= (type o_3@@25) RefType) (= (type f_5@@7) (FieldType A@@20 B@@19))) (not (= f_5@@7 next))) (= (U_2_real (MapType1Select Mask@13 o_3@@25 f_5@@7)) (U_2_real (MapType1Select QPMask@20 o_3@@25 f_5@@7))))))
 :qid |stdinbpl.5190:47|
 :skolemid |572|
 :pattern ( (MapType1Select Mask@13 o_3@@25 f_5@@7))
 :pattern ( (MapType1Select QPMask@20 o_3@@25 f_5@@7))
)) (state ExhaleHeap@10 QPMask@20)) (and (forall ((n$2_8 T@U) ) (!  (=> (= (type n$2_8) RefType) (=> (and (U_2_bool (MapType2Select g n$2_8)) (not (= (MapType0Select ExhaleHeap@10 n$2_8 next) null))) (U_2_bool (MapType2Select g (MapType0Select ExhaleHeap@10 n$2_8 next)))))
 :qid |stdinbpl.5196:38|
 :skolemid |573|
 :pattern ( (MapType2Select g (MapType0Select ExhaleHeap@10 n$2_8 next)))
 :pattern ( (MapType2Select g n$2_8) (MapType0Select ExhaleHeap@10 n$2_8 next))
)) (= (MapType0Select ExhaleHeap@10 prev_node@0 next) null))) (and (=> (= (ControlFlow 0 280) 278) anon360_Then_correct) (=> (= (ControlFlow 0 280) 279) anon360_Else_correct))))))))))))))
(let ((anon155_correct  (=> (= Mask@12 (MapType1Store QPMask@18 prev_node@0 next (real_2_U (- (U_2_real (MapType1Select QPMask@18 prev_node@0 next)) FullPerm)))) (and (=> (= (ControlFlow 0 283) (- 0 286)) (forall ((n_17 T@U) ) (!  (=> (= (type n_17) RefType) (=> (and (and (U_2_bool (MapType2Select g n_17)) (not (= n_17 prev_node@0))) (dummyFunction (MapType0Select ExhaleHeap@9 n_17 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.5092:35|
 :skolemid |558|
 :pattern ( (MapType0Select ExhaleHeap@9 n_17 next))
 :pattern ( (MapType1Select QPMask@19 n_17 next))
 :pattern ( (MapType0Select ExhaleHeap@9 n_17 next))
))) (=> (forall ((n_17@@0 T@U) ) (!  (=> (= (type n_17@@0) RefType) (=> (and (and (U_2_bool (MapType2Select g n_17@@0)) (not (= n_17@@0 prev_node@0))) (dummyFunction (MapType0Select ExhaleHeap@9 n_17@@0 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.5092:35|
 :skolemid |558|
 :pattern ( (MapType0Select ExhaleHeap@9 n_17@@0 next))
 :pattern ( (MapType1Select QPMask@19 n_17@@0 next))
 :pattern ( (MapType0Select ExhaleHeap@9 n_17@@0 next))
)) (and (=> (= (ControlFlow 0 283) (- 0 285)) (forall ((n_17@@1 T@U) (n_17_1 T@U) ) (!  (=> (and (= (type n_17@@1) RefType) (= (type n_17_1) RefType)) (=> (and (and (and (and (not (= n_17@@1 n_17_1)) (and (U_2_bool (MapType2Select g n_17@@1)) (not (= n_17@@1 prev_node@0)))) (and (U_2_bool (MapType2Select g n_17_1)) (not (= n_17_1 prev_node@0)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_17@@1 n_17_1))))
 :qid |stdinbpl.5099:35|
 :skolemid |559|
 :pattern ( (neverTriggered57 n_17@@1) (neverTriggered57 n_17_1))
))) (=> (forall ((n_17@@2 T@U) (n_17_1@@0 T@U) ) (!  (=> (and (= (type n_17@@2) RefType) (= (type n_17_1@@0) RefType)) (=> (and (and (and (and (not (= n_17@@2 n_17_1@@0)) (and (U_2_bool (MapType2Select g n_17@@2)) (not (= n_17@@2 prev_node@0)))) (and (U_2_bool (MapType2Select g n_17_1@@0)) (not (= n_17_1@@0 prev_node@0)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_17@@2 n_17_1@@0))))
 :qid |stdinbpl.5099:35|
 :skolemid |559|
 :pattern ( (neverTriggered57 n_17@@2) (neverTriggered57 n_17_1@@0))
)) (and (=> (= (ControlFlow 0 283) (- 0 284)) (forall ((n_17@@3 T@U) ) (!  (=> (= (type n_17@@3) RefType) (=> (and (U_2_bool (MapType2Select g n_17@@3)) (not (= n_17@@3 prev_node@0))) (>= (U_2_real (MapType1Select Mask@12 n_17@@3 next)) (/ (to_real 1) (to_real 2)))))
 :qid |stdinbpl.5106:35|
 :skolemid |560|
 :pattern ( (MapType0Select ExhaleHeap@9 n_17@@3 next))
 :pattern ( (MapType1Select QPMask@19 n_17@@3 next))
 :pattern ( (MapType0Select ExhaleHeap@9 n_17@@3 next))
))) (=> (forall ((n_17@@4 T@U) ) (!  (=> (= (type n_17@@4) RefType) (=> (and (U_2_bool (MapType2Select g n_17@@4)) (not (= n_17@@4 prev_node@0))) (>= (U_2_real (MapType1Select Mask@12 n_17@@4 next)) (/ (to_real 1) (to_real 2)))))
 :qid |stdinbpl.5106:35|
 :skolemid |560|
 :pattern ( (MapType0Select ExhaleHeap@9 n_17@@4 next))
 :pattern ( (MapType1Select QPMask@19 n_17@@4 next))
 :pattern ( (MapType0Select ExhaleHeap@9 n_17@@4 next))
)) (=> (and (and (forall ((n_17@@5 T@U) ) (!  (=> (= (type n_17@@5) RefType) (=> (and (and (U_2_bool (MapType2Select g n_17@@5)) (not (= n_17@@5 prev_node@0))) (< NoPerm (/ (to_real 1) (to_real 2)))) (and (qpRange57 n_17@@5) (= (invRecv57 n_17@@5) n_17@@5))))
 :qid |stdinbpl.5112:40|
 :skolemid |561|
 :pattern ( (MapType0Select ExhaleHeap@9 n_17@@5 next))
 :pattern ( (MapType1Select QPMask@19 n_17@@5 next))
 :pattern ( (MapType0Select ExhaleHeap@9 n_17@@5 next))
)) (forall ((o_3@@26 T@U) ) (!  (=> (= (type o_3@@26) RefType) (=> (and (and (U_2_bool (MapType2Select g (invRecv57 o_3@@26))) (not (= (invRecv57 o_3@@26) prev_node@0))) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange57 o_3@@26))) (= (invRecv57 o_3@@26) o_3@@26)))
 :qid |stdinbpl.5116:40|
 :skolemid |562|
 :pattern ( (invRecv57 o_3@@26))
))) (and (forall ((o_3@@27 T@U) ) (!  (=> (= (type o_3@@27) RefType) (and (=> (and (and (U_2_bool (MapType2Select g (invRecv57 o_3@@27))) (not (= (invRecv57 o_3@@27) prev_node@0))) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange57 o_3@@27))) (and (= (invRecv57 o_3@@27) o_3@@27) (= (U_2_real (MapType1Select QPMask@19 o_3@@27 next)) (- (U_2_real (MapType1Select Mask@12 o_3@@27 next)) (/ (to_real 1) (to_real 2)))))) (=> (not (and (and (U_2_bool (MapType2Select g (invRecv57 o_3@@27))) (not (= (invRecv57 o_3@@27) prev_node@0))) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange57 o_3@@27)))) (= (U_2_real (MapType1Select QPMask@19 o_3@@27 next)) (U_2_real (MapType1Select Mask@12 o_3@@27 next))))))
 :qid |stdinbpl.5122:40|
 :skolemid |563|
 :pattern ( (MapType1Select QPMask@19 o_3@@27 next))
)) (forall ((o_3@@28 T@U) (f_5@@8 T@U) ) (! (let ((B@@20 (FieldTypeInv1 (type f_5@@8))))
(let ((A@@21 (FieldTypeInv0 (type f_5@@8))))
 (=> (and (and (= (type o_3@@28) RefType) (= (type f_5@@8) (FieldType A@@21 B@@20))) (not (= f_5@@8 next))) (= (U_2_real (MapType1Select Mask@12 o_3@@28 f_5@@8)) (U_2_real (MapType1Select QPMask@19 o_3@@28 f_5@@8))))))
 :qid |stdinbpl.5128:47|
 :skolemid |564|
 :pattern ( (MapType1Select QPMask@19 o_3@@28 f_5@@8))
)))) (and (and (=> (= (ControlFlow 0 283) 280) anon358_Else_correct) (=> (= (ControlFlow 0 283) 241) anon359_Then_correct)) (=> (= (ControlFlow 0 283) 243) anon359_Else_correct))))))))))))
(let ((anon357_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 289) 283)) anon155_correct)))
(let ((anon357_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 287) (- 0 288)) (<= FullPerm (U_2_real (MapType1Select QPMask@18 prev_node@0 next)))) (=> (<= FullPerm (U_2_real (MapType1Select QPMask@18 prev_node@0 next))) (=> (= (ControlFlow 0 287) 283) anon155_correct))))))
(let ((anon153_correct  (=> (and (state ExhaleHeap@9 QPMask@18) (state ExhaleHeap@9 QPMask@18)) (and (=> (= (ControlFlow 0 290) (- 0 293)) (U_2_bool (MapType2Select g prev_node@0))) (=> (U_2_bool (MapType2Select g prev_node@0)) (and (=> (= (ControlFlow 0 290) (- 0 292)) (not (U_2_bool (MapType2Select g null)))) (=> (not (U_2_bool (MapType2Select g null))) (and (=> (= (ControlFlow 0 290) (- 0 291)) (U_2_bool (MapType2Select g prev_node@0))) (=> (U_2_bool (MapType2Select g prev_node@0)) (and (=> (= (ControlFlow 0 290) 287) anon357_Then_correct) (=> (= (ControlFlow 0 290) 289) anon357_Else_correct)))))))))))
(let ((anon356_Else_correct  (=> (and (= arg_y@0 null) (= (ControlFlow 0 295) 290)) anon153_correct)))
(let ((anon356_Then_correct  (=> (and (and (not (= arg_y@0 null)) (state ExhaleHeap@9 QPMask@18)) (and (forall ((v1_7_2 T@U) (v2_7_2 T@U) ) (!  (=> (and (and (= (type v1_7_2) RefType) (= (type v2_7_2) RefType)) (not (= v1_7_2 v2_7_2))) (= (exists_path ($$ ExhaleHeap@9 g) v1_7_2 v2_7_2)  (or (exists_path ($$ ExhaleHeap@8 g) v1_7_2 v2_7_2) (and (exists_path ($$ ExhaleHeap@8 g) v1_7_2 node@1) (exists_path ($$ ExhaleHeap@8 g) arg_y@0 v2_7_2)))))
 :qid |stdinbpl.5061:40|
 :skolemid |557|
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| ExhaleHeap@9 g))) g) v1_7_2 v2_7_2))
)) (= (ControlFlow 0 294) 290))) anon153_correct)))
(let ((anon355_Else_correct  (=> (= arg_y@0 null) (and (=> (= (ControlFlow 0 297) 294) anon356_Then_correct) (=> (= (ControlFlow 0 297) 295) anon356_Else_correct)))))
(let ((anon355_Then_correct  (=> (not (= arg_y@0 null)) (=> (and (state ExhaleHeap@9 QPMask@18) (forall ((v1_6 T@U) (v2_6 T@U) ) (!  (=> (and (= (type v1_6) RefType) (= (type v2_6) RefType)) (= (edge ($$ ExhaleHeap@9 g) v1_6 v2_6)  (or (edge ($$ ExhaleHeap@8 g) v1_6 v2_6) (and (= v1_6 node@1) (= v2_6 arg_y@0)))))
 :qid |stdinbpl.5054:40|
 :skolemid |556|
 :pattern ( (edge (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| ExhaleHeap@8 g))) g) v1_6 v2_6))
))) (and (=> (= (ControlFlow 0 296) 294) anon356_Then_correct) (=> (= (ControlFlow 0 296) 295) anon356_Else_correct))))))
(let ((anon354_Else_correct  (=> (not (= arg_y@0 null)) (and (=> (= (ControlFlow 0 299) 296) anon355_Then_correct) (=> (= (ControlFlow 0 299) 297) anon355_Else_correct)))))
(let ((anon354_Then_correct  (=> (= arg_y@0 null) (=> (and (state ExhaleHeap@9 QPMask@18) (|Set#Equal| ($$ ExhaleHeap@9 g) ($$ ExhaleHeap@8 g))) (and (=> (= (ControlFlow 0 298) 296) anon355_Then_correct) (=> (= (ControlFlow 0 298) 297) anon355_Else_correct))))))
(let ((anon352_Else_correct  (=> (forall ((n$0_9_1 T@U) ) (!  (=> (= (type n$0_9_1) RefType) (=> (and (U_2_bool (MapType2Select g n$0_9_1)) (not (= (MapType0Select ExhaleHeap@8 n$0_9_1 next) null))) (U_2_bool (MapType2Select g (MapType0Select ExhaleHeap@8 n$0_9_1 next)))))
 :qid |stdinbpl.4985:38|
 :skolemid |547|
 :pattern ( (MapType2Select g (MapType0Select ExhaleHeap@8 n$0_9_1 next)))
 :pattern ( (MapType2Select g n$0_9_1) (MapType0Select ExhaleHeap@8 n$0_9_1 next))
)) (and (=> (= (ControlFlow 0 300) (- 0 303)) (= (MapType0Select ExhaleHeap@8 node@1 next) null)) (=> (= (MapType0Select ExhaleHeap@8 node@1 next) null) (=> (and (IdenticalOnKnownLocations ExhaleHeap@8 ExhaleHeap@9 QPMask@17) (not (U_2_bool (MapType2Select g null)))) (=> (and (and (U_2_bool (MapType2Select g node@1)) (not (= node@1 null))) (and (= Mask@11 (MapType1Store QPMask@17 node@1 next (real_2_U (+ (U_2_real (MapType1Select QPMask@17 node@1 next)) FullPerm)))) (state ExhaleHeap@9 Mask@11))) (and (=> (= (ControlFlow 0 300) (- 0 302)) (forall ((n$1_5 T@U) (n$1_5_1 T@U) ) (!  (=> (and (= (type n$1_5) RefType) (= (type n$1_5_1) RefType)) (=> (and (and (and (and (not (= n$1_5 n$1_5_1)) (and (U_2_bool (MapType2Select g n$1_5)) (not (= n$1_5 node@1)))) (and (U_2_bool (MapType2Select g n$1_5_1)) (not (= n$1_5_1 node@1)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n$1_5 n$1_5_1))))
 :qid |stdinbpl.5005:33|
 :skolemid |548|
 :no-pattern (type n$1_5)
 :no-pattern (type n$1_5_1)
 :no-pattern (U_2_int n$1_5)
 :no-pattern (U_2_bool n$1_5)
 :no-pattern (U_2_int n$1_5_1)
 :no-pattern (U_2_bool n$1_5_1)
))) (=> (forall ((n$1_5@@0 T@U) (n$1_5_1@@0 T@U) ) (!  (=> (and (= (type n$1_5@@0) RefType) (= (type n$1_5_1@@0) RefType)) (=> (and (and (and (and (not (= n$1_5@@0 n$1_5_1@@0)) (and (U_2_bool (MapType2Select g n$1_5@@0)) (not (= n$1_5@@0 node@1)))) (and (U_2_bool (MapType2Select g n$1_5_1@@0)) (not (= n$1_5_1@@0 node@1)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n$1_5@@0 n$1_5_1@@0))))
 :qid |stdinbpl.5005:33|
 :skolemid |548|
 :no-pattern (type n$1_5@@0)
 :no-pattern (type n$1_5_1@@0)
 :no-pattern (U_2_int n$1_5@@0)
 :no-pattern (U_2_bool n$1_5@@0)
 :no-pattern (U_2_int n$1_5_1@@0)
 :no-pattern (U_2_bool n$1_5_1@@0)
)) (=> (and (forall ((n$1_5@@1 T@U) ) (!  (=> (= (type n$1_5@@1) RefType) (=> (and (and (U_2_bool (MapType2Select g n$1_5@@1)) (not (= n$1_5@@1 node@1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (and (qpRange56 n$1_5@@1) (= (invRecv56 n$1_5@@1) n$1_5@@1))))
 :qid |stdinbpl.5011:40|
 :skolemid |549|
 :pattern ( (MapType0Select ExhaleHeap@9 n$1_5@@1 next))
 :pattern ( (MapType1Select QPMask@18 n$1_5@@1 next))
 :pattern ( (MapType0Select ExhaleHeap@9 n$1_5@@1 next))
)) (forall ((o_3@@29 T@U) ) (!  (=> (= (type o_3@@29) RefType) (=> (and (and (and (U_2_bool (MapType2Select g (invRecv56 o_3@@29))) (not (= (invRecv56 o_3@@29) node@1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange56 o_3@@29)) (= (invRecv56 o_3@@29) o_3@@29)))
 :qid |stdinbpl.5015:40|
 :skolemid |550|
 :pattern ( (invRecv56 o_3@@29))
))) (and (=> (= (ControlFlow 0 300) (- 0 301)) (forall ((n$1_5@@2 T@U) ) (!  (=> (= (type n$1_5@@2) RefType) (=> (and (U_2_bool (MapType2Select g n$1_5@@2)) (not (= n$1_5@@2 node@1))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.5021:33|
 :skolemid |551|
 :pattern ( (MapType0Select ExhaleHeap@9 n$1_5@@2 next))
 :pattern ( (MapType1Select QPMask@18 n$1_5@@2 next))
 :pattern ( (MapType0Select ExhaleHeap@9 n$1_5@@2 next))
))) (=> (forall ((n$1_5@@3 T@U) ) (!  (=> (= (type n$1_5@@3) RefType) (=> (and (U_2_bool (MapType2Select g n$1_5@@3)) (not (= n$1_5@@3 node@1))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.5021:33|
 :skolemid |551|
 :pattern ( (MapType0Select ExhaleHeap@9 n$1_5@@3 next))
 :pattern ( (MapType1Select QPMask@18 n$1_5@@3 next))
 :pattern ( (MapType0Select ExhaleHeap@9 n$1_5@@3 next))
)) (=> (and (forall ((n$1_5@@4 T@U) ) (!  (=> (= (type n$1_5@@4) RefType) (=> (and (and (U_2_bool (MapType2Select g n$1_5@@4)) (not (= n$1_5@@4 node@1))) (> (/ (to_real 1) (to_real 2)) NoPerm)) (not (= n$1_5@@4 null))))
 :qid |stdinbpl.5027:40|
 :skolemid |552|
 :pattern ( (MapType0Select ExhaleHeap@9 n$1_5@@4 next))
 :pattern ( (MapType1Select QPMask@18 n$1_5@@4 next))
 :pattern ( (MapType0Select ExhaleHeap@9 n$1_5@@4 next))
)) (forall ((o_3@@30 T@U) ) (!  (=> (= (type o_3@@30) RefType) (and (=> (and (and (and (U_2_bool (MapType2Select g (invRecv56 o_3@@30))) (not (= (invRecv56 o_3@@30) node@1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange56 o_3@@30)) (and (=> (< NoPerm (/ (to_real 1) (to_real 2))) (= (invRecv56 o_3@@30) o_3@@30)) (= (U_2_real (MapType1Select QPMask@18 o_3@@30 next)) (+ (U_2_real (MapType1Select Mask@11 o_3@@30 next)) (/ (to_real 1) (to_real 2)))))) (=> (not (and (and (and (U_2_bool (MapType2Select g (invRecv56 o_3@@30))) (not (= (invRecv56 o_3@@30) node@1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange56 o_3@@30))) (= (U_2_real (MapType1Select QPMask@18 o_3@@30 next)) (U_2_real (MapType1Select Mask@11 o_3@@30 next))))))
 :qid |stdinbpl.5033:40|
 :skolemid |553|
 :pattern ( (MapType1Select QPMask@18 o_3@@30 next))
))) (=> (and (and (forall ((o_3@@31 T@U) (f_5@@9 T@U) ) (! (let ((B@@21 (FieldTypeInv1 (type f_5@@9))))
(let ((A@@22 (FieldTypeInv0 (type f_5@@9))))
 (=> (and (and (= (type o_3@@31) RefType) (= (type f_5@@9) (FieldType A@@22 B@@21))) (not (= f_5@@9 next))) (= (U_2_real (MapType1Select Mask@11 o_3@@31 f_5@@9)) (U_2_real (MapType1Select QPMask@18 o_3@@31 f_5@@9))))))
 :qid |stdinbpl.5037:47|
 :skolemid |554|
 :pattern ( (MapType1Select Mask@11 o_3@@31 f_5@@9))
 :pattern ( (MapType1Select QPMask@18 o_3@@31 f_5@@9))
)) (state ExhaleHeap@9 QPMask@18)) (and (forall ((n$2_7 T@U) ) (!  (=> (= (type n$2_7) RefType) (=> (and (U_2_bool (MapType2Select g n$2_7)) (not (= (MapType0Select ExhaleHeap@9 n$2_7 next) null))) (U_2_bool (MapType2Select g (MapType0Select ExhaleHeap@9 n$2_7 next)))))
 :qid |stdinbpl.5043:38|
 :skolemid |555|
 :pattern ( (MapType2Select g (MapType0Select ExhaleHeap@9 n$2_7 next)))
 :pattern ( (MapType2Select g n$2_7) (MapType0Select ExhaleHeap@9 n$2_7 next))
)) (= (MapType0Select ExhaleHeap@9 node@1 next) arg_y@0))) (and (=> (= (ControlFlow 0 300) 298) anon354_Then_correct) (=> (= (ControlFlow 0 300) 299) anon354_Else_correct))))))))))))))))
(let ((anon143_correct  (=> (= Mask@10 (MapType1Store QPMask@16 node@1 next (real_2_U (- (U_2_real (MapType1Select QPMask@16 node@1 next)) FullPerm)))) (and (=> (= (ControlFlow 0 304) (- 0 307)) (forall ((n_16 T@U) ) (!  (=> (= (type n_16) RefType) (=> (and (and (U_2_bool (MapType2Select g n_16)) (not (= n_16 node@1))) (dummyFunction (MapType0Select ExhaleHeap@8 n_16 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.4937:35|
 :skolemid |540|
 :pattern ( (MapType0Select ExhaleHeap@8 n_16 next))
 :pattern ( (MapType1Select QPMask@17 n_16 next))
 :pattern ( (MapType0Select ExhaleHeap@8 n_16 next))
))) (=> (forall ((n_16@@0 T@U) ) (!  (=> (= (type n_16@@0) RefType) (=> (and (and (U_2_bool (MapType2Select g n_16@@0)) (not (= n_16@@0 node@1))) (dummyFunction (MapType0Select ExhaleHeap@8 n_16@@0 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.4937:35|
 :skolemid |540|
 :pattern ( (MapType0Select ExhaleHeap@8 n_16@@0 next))
 :pattern ( (MapType1Select QPMask@17 n_16@@0 next))
 :pattern ( (MapType0Select ExhaleHeap@8 n_16@@0 next))
)) (and (=> (= (ControlFlow 0 304) (- 0 306)) (forall ((n_16@@1 T@U) (n_16_1 T@U) ) (!  (=> (and (= (type n_16@@1) RefType) (= (type n_16_1) RefType)) (=> (and (and (and (and (not (= n_16@@1 n_16_1)) (and (U_2_bool (MapType2Select g n_16@@1)) (not (= n_16@@1 node@1)))) (and (U_2_bool (MapType2Select g n_16_1)) (not (= n_16_1 node@1)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_16@@1 n_16_1))))
 :qid |stdinbpl.4944:35|
 :skolemid |541|
 :pattern ( (neverTriggered55 n_16@@1) (neverTriggered55 n_16_1))
))) (=> (forall ((n_16@@2 T@U) (n_16_1@@0 T@U) ) (!  (=> (and (= (type n_16@@2) RefType) (= (type n_16_1@@0) RefType)) (=> (and (and (and (and (not (= n_16@@2 n_16_1@@0)) (and (U_2_bool (MapType2Select g n_16@@2)) (not (= n_16@@2 node@1)))) (and (U_2_bool (MapType2Select g n_16_1@@0)) (not (= n_16_1@@0 node@1)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_16@@2 n_16_1@@0))))
 :qid |stdinbpl.4944:35|
 :skolemid |541|
 :pattern ( (neverTriggered55 n_16@@2) (neverTriggered55 n_16_1@@0))
)) (and (=> (= (ControlFlow 0 304) (- 0 305)) (forall ((n_16@@3 T@U) ) (!  (=> (= (type n_16@@3) RefType) (=> (and (U_2_bool (MapType2Select g n_16@@3)) (not (= n_16@@3 node@1))) (>= (U_2_real (MapType1Select Mask@10 n_16@@3 next)) (/ (to_real 1) (to_real 2)))))
 :qid |stdinbpl.4951:35|
 :skolemid |542|
 :pattern ( (MapType0Select ExhaleHeap@8 n_16@@3 next))
 :pattern ( (MapType1Select QPMask@17 n_16@@3 next))
 :pattern ( (MapType0Select ExhaleHeap@8 n_16@@3 next))
))) (=> (forall ((n_16@@4 T@U) ) (!  (=> (= (type n_16@@4) RefType) (=> (and (U_2_bool (MapType2Select g n_16@@4)) (not (= n_16@@4 node@1))) (>= (U_2_real (MapType1Select Mask@10 n_16@@4 next)) (/ (to_real 1) (to_real 2)))))
 :qid |stdinbpl.4951:35|
 :skolemid |542|
 :pattern ( (MapType0Select ExhaleHeap@8 n_16@@4 next))
 :pattern ( (MapType1Select QPMask@17 n_16@@4 next))
 :pattern ( (MapType0Select ExhaleHeap@8 n_16@@4 next))
)) (=> (and (and (forall ((n_16@@5 T@U) ) (!  (=> (= (type n_16@@5) RefType) (=> (and (and (U_2_bool (MapType2Select g n_16@@5)) (not (= n_16@@5 node@1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (and (qpRange55 n_16@@5) (= (invRecv55 n_16@@5) n_16@@5))))
 :qid |stdinbpl.4957:40|
 :skolemid |543|
 :pattern ( (MapType0Select ExhaleHeap@8 n_16@@5 next))
 :pattern ( (MapType1Select QPMask@17 n_16@@5 next))
 :pattern ( (MapType0Select ExhaleHeap@8 n_16@@5 next))
)) (forall ((o_3@@32 T@U) ) (!  (=> (= (type o_3@@32) RefType) (=> (and (and (U_2_bool (MapType2Select g (invRecv55 o_3@@32))) (not (= (invRecv55 o_3@@32) node@1))) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange55 o_3@@32))) (= (invRecv55 o_3@@32) o_3@@32)))
 :qid |stdinbpl.4961:40|
 :skolemid |544|
 :pattern ( (invRecv55 o_3@@32))
))) (and (forall ((o_3@@33 T@U) ) (!  (=> (= (type o_3@@33) RefType) (and (=> (and (and (U_2_bool (MapType2Select g (invRecv55 o_3@@33))) (not (= (invRecv55 o_3@@33) node@1))) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange55 o_3@@33))) (and (= (invRecv55 o_3@@33) o_3@@33) (= (U_2_real (MapType1Select QPMask@17 o_3@@33 next)) (- (U_2_real (MapType1Select Mask@10 o_3@@33 next)) (/ (to_real 1) (to_real 2)))))) (=> (not (and (and (U_2_bool (MapType2Select g (invRecv55 o_3@@33))) (not (= (invRecv55 o_3@@33) node@1))) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange55 o_3@@33)))) (= (U_2_real (MapType1Select QPMask@17 o_3@@33 next)) (U_2_real (MapType1Select Mask@10 o_3@@33 next))))))
 :qid |stdinbpl.4967:40|
 :skolemid |545|
 :pattern ( (MapType1Select QPMask@17 o_3@@33 next))
)) (forall ((o_3@@34 T@U) (f_5@@10 T@U) ) (! (let ((B@@22 (FieldTypeInv1 (type f_5@@10))))
(let ((A@@23 (FieldTypeInv0 (type f_5@@10))))
 (=> (and (and (= (type o_3@@34) RefType) (= (type f_5@@10) (FieldType A@@23 B@@22))) (not (= f_5@@10 next))) (= (U_2_real (MapType1Select Mask@10 o_3@@34 f_5@@10)) (U_2_real (MapType1Select QPMask@17 o_3@@34 f_5@@10))))))
 :qid |stdinbpl.4973:47|
 :skolemid |546|
 :pattern ( (MapType1Select QPMask@17 o_3@@34 f_5@@10))
)))) (and (and (=> (= (ControlFlow 0 304) 300) anon352_Else_correct) (=> (= (ControlFlow 0 304) 237) anon353_Then_correct)) (=> (= (ControlFlow 0 304) 239) anon353_Else_correct))))))))))))
(let ((anon351_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 310) 304)) anon143_correct)))
(let ((anon351_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 308) (- 0 309)) (<= FullPerm (U_2_real (MapType1Select QPMask@16 node@1 next)))) (=> (<= FullPerm (U_2_real (MapType1Select QPMask@16 node@1 next))) (=> (= (ControlFlow 0 308) 304) anon143_correct))))))
(let ((anon141_correct  (and (=> (= (ControlFlow 0 311) (- 0 313)) (not (U_2_bool (MapType2Select g null)))) (=> (not (U_2_bool (MapType2Select g null))) (and (=> (= (ControlFlow 0 311) (- 0 312)) (U_2_bool (MapType2Select g node@1))) (=> (U_2_bool (MapType2Select g node@1)) (and (=> (= (ControlFlow 0 311) 308) anon351_Then_correct) (=> (= (ControlFlow 0 311) 310) anon351_Else_correct))))))))
(let ((anon350_Else_correct  (=> (and (= arg_y@0 null) (= (ControlFlow 0 316) 311)) anon141_correct)))
(let ((anon350_Then_correct  (=> (not (= arg_y@0 null)) (and (=> (= (ControlFlow 0 314) (- 0 315)) (U_2_bool (MapType2Select g arg_y@0))) (=> (U_2_bool (MapType2Select g arg_y@0)) (=> (= (ControlFlow 0 314) 311) anon141_correct))))))
(let ((anon139_correct  (=> (and (state ExhaleHeap@8 QPMask@16) (state ExhaleHeap@8 QPMask@16)) (and (=> (= (ControlFlow 0 317) (- 0 319)) (HasDirectPerm QPMask@16 node_i@1 next)) (=> (HasDirectPerm QPMask@16 node_i@1 next) (=> (= arg_y@0 (MapType0Select ExhaleHeap@8 node_i@1 next)) (and (=> (= (ControlFlow 0 317) (- 0 318)) (U_2_bool (MapType2Select g node@1))) (=> (U_2_bool (MapType2Select g node@1)) (and (=> (= (ControlFlow 0 317) 314) anon350_Then_correct) (=> (= (ControlFlow 0 317) 316) anon350_Else_correct))))))))))
(let ((anon349_Else_correct  (=> (and (= (MapType0Select ExhaleHeap@5 node@1 next) null) (= (ControlFlow 0 321) 317)) anon139_correct)))
(let ((anon349_Then_correct  (=> (and (and (not (= (MapType0Select ExhaleHeap@5 node@1 next) null)) (state ExhaleHeap@8 QPMask@16)) (and (forall ((v1_5_2 T@U) (v2_5_2 T@U) ) (!  (=> (and (and (= (type v1_5_2) RefType) (= (type v2_5_2) RefType)) (not (= v1_5_2 v2_5_2))) (= (exists_path ($$ ExhaleHeap@8 g) v1_5_2 v2_5_2)  (and (exists_path ($$ ExhaleHeap@5 g) v1_5_2 v2_5_2) (not (and (exists_path ($$ ExhaleHeap@5 g) v1_5_2 node@1) (exists_path ($$ ExhaleHeap@5 g) (MapType0Select ExhaleHeap@5 node@1 next) v2_5_2))))))
 :qid |stdinbpl.4897:40|
 :skolemid |539|
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| ExhaleHeap@8 g))) g) v1_5_2 v2_5_2))
)) (= (ControlFlow 0 320) 317))) anon139_correct)))
(let ((anon348_Else_correct  (=> (= (MapType0Select ExhaleHeap@5 node@1 next) null) (and (=> (= (ControlFlow 0 323) 320) anon349_Then_correct) (=> (= (ControlFlow 0 323) 321) anon349_Else_correct)))))
(let ((anon348_Then_correct  (=> (not (= (MapType0Select ExhaleHeap@5 node@1 next) null)) (=> (and (state ExhaleHeap@8 QPMask@16) (forall ((v1_4 T@U) (v2_4 T@U) ) (!  (=> (and (= (type v1_4) RefType) (= (type v2_4) RefType)) (= (edge ($$ ExhaleHeap@8 g) v1_4 v2_4)  (and (edge ($$ ExhaleHeap@5 g) v1_4 v2_4) (not (and (= v1_4 node@1) (= v2_4 (MapType0Select ExhaleHeap@5 node@1 next)))))))
 :qid |stdinbpl.4890:40|
 :skolemid |538|
 :pattern ( (edge (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| ExhaleHeap@8 g))) g) v1_4 v2_4))
))) (and (=> (= (ControlFlow 0 322) 320) anon349_Then_correct) (=> (= (ControlFlow 0 322) 321) anon349_Else_correct))))))
(let ((anon347_Else_correct  (=> (not (= (MapType0Select ExhaleHeap@5 node@1 next) null)) (and (=> (= (ControlFlow 0 325) 322) anon348_Then_correct) (=> (= (ControlFlow 0 325) 323) anon348_Else_correct)))))
(let ((anon347_Then_correct  (=> (= (MapType0Select ExhaleHeap@5 node@1 next) null) (=> (and (state ExhaleHeap@8 QPMask@16) (|Set#Equal| ($$ ExhaleHeap@8 g) ($$ ExhaleHeap@5 g))) (and (=> (= (ControlFlow 0 324) 322) anon348_Then_correct) (=> (= (ControlFlow 0 324) 323) anon348_Else_correct))))))
(let ((anon345_Else_correct  (=> (forall ((n$0_7_1 T@U) ) (!  (=> (= (type n$0_7_1) RefType) (=> (and (U_2_bool (MapType2Select g n$0_7_1)) (not (= (MapType0Select ExhaleHeap@5 n$0_7_1 next) null))) (U_2_bool (MapType2Select g (MapType0Select ExhaleHeap@5 n$0_7_1 next)))))
 :qid |stdinbpl.4823:38|
 :skolemid |529|
 :pattern ( (MapType2Select g (MapType0Select ExhaleHeap@5 n$0_7_1 next)))
 :pattern ( (MapType2Select g n$0_7_1) (MapType0Select ExhaleHeap@5 n$0_7_1 next))
)) (=> (and (IdenticalOnKnownLocations ExhaleHeap@5 ExhaleHeap@8 QPMask@15) (not (U_2_bool (MapType2Select g null)))) (=> (and (and (U_2_bool (MapType2Select g node@1)) (not (= node@1 null))) (and (= Mask@9 (MapType1Store QPMask@15 node@1 next (real_2_U (+ (U_2_real (MapType1Select QPMask@15 node@1 next)) FullPerm)))) (state ExhaleHeap@8 Mask@9))) (and (=> (= (ControlFlow 0 326) (- 0 328)) (forall ((n$1_4 T@U) (n$1_4_1 T@U) ) (!  (=> (and (= (type n$1_4) RefType) (= (type n$1_4_1) RefType)) (=> (and (and (and (and (not (= n$1_4 n$1_4_1)) (and (U_2_bool (MapType2Select g n$1_4)) (not (= n$1_4 node@1)))) (and (U_2_bool (MapType2Select g n$1_4_1)) (not (= n$1_4_1 node@1)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n$1_4 n$1_4_1))))
 :qid |stdinbpl.4841:33|
 :skolemid |530|
 :no-pattern (type n$1_4)
 :no-pattern (type n$1_4_1)
 :no-pattern (U_2_int n$1_4)
 :no-pattern (U_2_bool n$1_4)
 :no-pattern (U_2_int n$1_4_1)
 :no-pattern (U_2_bool n$1_4_1)
))) (=> (forall ((n$1_4@@0 T@U) (n$1_4_1@@0 T@U) ) (!  (=> (and (= (type n$1_4@@0) RefType) (= (type n$1_4_1@@0) RefType)) (=> (and (and (and (and (not (= n$1_4@@0 n$1_4_1@@0)) (and (U_2_bool (MapType2Select g n$1_4@@0)) (not (= n$1_4@@0 node@1)))) (and (U_2_bool (MapType2Select g n$1_4_1@@0)) (not (= n$1_4_1@@0 node@1)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n$1_4@@0 n$1_4_1@@0))))
 :qid |stdinbpl.4841:33|
 :skolemid |530|
 :no-pattern (type n$1_4@@0)
 :no-pattern (type n$1_4_1@@0)
 :no-pattern (U_2_int n$1_4@@0)
 :no-pattern (U_2_bool n$1_4@@0)
 :no-pattern (U_2_int n$1_4_1@@0)
 :no-pattern (U_2_bool n$1_4_1@@0)
)) (=> (and (forall ((n$1_4@@1 T@U) ) (!  (=> (= (type n$1_4@@1) RefType) (=> (and (and (U_2_bool (MapType2Select g n$1_4@@1)) (not (= n$1_4@@1 node@1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (and (qpRange54 n$1_4@@1) (= (invRecv54 n$1_4@@1) n$1_4@@1))))
 :qid |stdinbpl.4847:40|
 :skolemid |531|
 :pattern ( (MapType0Select ExhaleHeap@8 n$1_4@@1 next))
 :pattern ( (MapType1Select QPMask@16 n$1_4@@1 next))
 :pattern ( (MapType0Select ExhaleHeap@8 n$1_4@@1 next))
)) (forall ((o_3@@35 T@U) ) (!  (=> (= (type o_3@@35) RefType) (=> (and (and (and (U_2_bool (MapType2Select g (invRecv54 o_3@@35))) (not (= (invRecv54 o_3@@35) node@1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange54 o_3@@35)) (= (invRecv54 o_3@@35) o_3@@35)))
 :qid |stdinbpl.4851:40|
 :skolemid |532|
 :pattern ( (invRecv54 o_3@@35))
))) (and (=> (= (ControlFlow 0 326) (- 0 327)) (forall ((n$1_4@@2 T@U) ) (!  (=> (= (type n$1_4@@2) RefType) (=> (and (U_2_bool (MapType2Select g n$1_4@@2)) (not (= n$1_4@@2 node@1))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.4857:33|
 :skolemid |533|
 :pattern ( (MapType0Select ExhaleHeap@8 n$1_4@@2 next))
 :pattern ( (MapType1Select QPMask@16 n$1_4@@2 next))
 :pattern ( (MapType0Select ExhaleHeap@8 n$1_4@@2 next))
))) (=> (forall ((n$1_4@@3 T@U) ) (!  (=> (= (type n$1_4@@3) RefType) (=> (and (U_2_bool (MapType2Select g n$1_4@@3)) (not (= n$1_4@@3 node@1))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.4857:33|
 :skolemid |533|
 :pattern ( (MapType0Select ExhaleHeap@8 n$1_4@@3 next))
 :pattern ( (MapType1Select QPMask@16 n$1_4@@3 next))
 :pattern ( (MapType0Select ExhaleHeap@8 n$1_4@@3 next))
)) (=> (and (forall ((n$1_4@@4 T@U) ) (!  (=> (= (type n$1_4@@4) RefType) (=> (and (and (U_2_bool (MapType2Select g n$1_4@@4)) (not (= n$1_4@@4 node@1))) (> (/ (to_real 1) (to_real 2)) NoPerm)) (not (= n$1_4@@4 null))))
 :qid |stdinbpl.4863:40|
 :skolemid |534|
 :pattern ( (MapType0Select ExhaleHeap@8 n$1_4@@4 next))
 :pattern ( (MapType1Select QPMask@16 n$1_4@@4 next))
 :pattern ( (MapType0Select ExhaleHeap@8 n$1_4@@4 next))
)) (forall ((o_3@@36 T@U) ) (!  (=> (= (type o_3@@36) RefType) (and (=> (and (and (and (U_2_bool (MapType2Select g (invRecv54 o_3@@36))) (not (= (invRecv54 o_3@@36) node@1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange54 o_3@@36)) (and (=> (< NoPerm (/ (to_real 1) (to_real 2))) (= (invRecv54 o_3@@36) o_3@@36)) (= (U_2_real (MapType1Select QPMask@16 o_3@@36 next)) (+ (U_2_real (MapType1Select Mask@9 o_3@@36 next)) (/ (to_real 1) (to_real 2)))))) (=> (not (and (and (and (U_2_bool (MapType2Select g (invRecv54 o_3@@36))) (not (= (invRecv54 o_3@@36) node@1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange54 o_3@@36))) (= (U_2_real (MapType1Select QPMask@16 o_3@@36 next)) (U_2_real (MapType1Select Mask@9 o_3@@36 next))))))
 :qid |stdinbpl.4869:40|
 :skolemid |535|
 :pattern ( (MapType1Select QPMask@16 o_3@@36 next))
))) (=> (and (and (forall ((o_3@@37 T@U) (f_5@@11 T@U) ) (! (let ((B@@23 (FieldTypeInv1 (type f_5@@11))))
(let ((A@@24 (FieldTypeInv0 (type f_5@@11))))
 (=> (and (and (= (type o_3@@37) RefType) (= (type f_5@@11) (FieldType A@@24 B@@23))) (not (= f_5@@11 next))) (= (U_2_real (MapType1Select Mask@9 o_3@@37 f_5@@11)) (U_2_real (MapType1Select QPMask@16 o_3@@37 f_5@@11))))))
 :qid |stdinbpl.4873:47|
 :skolemid |536|
 :pattern ( (MapType1Select Mask@9 o_3@@37 f_5@@11))
 :pattern ( (MapType1Select QPMask@16 o_3@@37 f_5@@11))
)) (state ExhaleHeap@8 QPMask@16)) (and (forall ((n$2_6 T@U) ) (!  (=> (= (type n$2_6) RefType) (=> (and (U_2_bool (MapType2Select g n$2_6)) (not (= (MapType0Select ExhaleHeap@8 n$2_6 next) null))) (U_2_bool (MapType2Select g (MapType0Select ExhaleHeap@8 n$2_6 next)))))
 :qid |stdinbpl.4879:38|
 :skolemid |537|
 :pattern ( (MapType2Select g (MapType0Select ExhaleHeap@8 n$2_6 next)))
 :pattern ( (MapType2Select g n$2_6) (MapType0Select ExhaleHeap@8 n$2_6 next))
)) (= (MapType0Select ExhaleHeap@8 node@1 next) null))) (and (=> (= (ControlFlow 0 326) 324) anon347_Then_correct) (=> (= (ControlFlow 0 326) 325) anon347_Else_correct))))))))))))))
(let ((anon129_correct  (=> (= Mask@8 (MapType1Store QPMask@10 node@1 next (real_2_U (- (U_2_real (MapType1Select QPMask@10 node@1 next)) FullPerm)))) (and (=> (= (ControlFlow 0 329) (- 0 332)) (forall ((n_15 T@U) ) (!  (=> (= (type n_15) RefType) (=> (and (and (U_2_bool (MapType2Select g n_15)) (not (= n_15 node@1))) (dummyFunction (MapType0Select ExhaleHeap@5 n_15 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.4775:35|
 :skolemid |522|
 :pattern ( (MapType0Select ExhaleHeap@5 n_15 next))
 :pattern ( (MapType1Select QPMask@15 n_15 next))
 :pattern ( (MapType0Select ExhaleHeap@5 n_15 next))
))) (=> (forall ((n_15@@0 T@U) ) (!  (=> (= (type n_15@@0) RefType) (=> (and (and (U_2_bool (MapType2Select g n_15@@0)) (not (= n_15@@0 node@1))) (dummyFunction (MapType0Select ExhaleHeap@5 n_15@@0 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.4775:35|
 :skolemid |522|
 :pattern ( (MapType0Select ExhaleHeap@5 n_15@@0 next))
 :pattern ( (MapType1Select QPMask@15 n_15@@0 next))
 :pattern ( (MapType0Select ExhaleHeap@5 n_15@@0 next))
)) (and (=> (= (ControlFlow 0 329) (- 0 331)) (forall ((n_15@@1 T@U) (n_15_1 T@U) ) (!  (=> (and (= (type n_15@@1) RefType) (= (type n_15_1) RefType)) (=> (and (and (and (and (not (= n_15@@1 n_15_1)) (and (U_2_bool (MapType2Select g n_15@@1)) (not (= n_15@@1 node@1)))) (and (U_2_bool (MapType2Select g n_15_1)) (not (= n_15_1 node@1)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_15@@1 n_15_1))))
 :qid |stdinbpl.4782:35|
 :skolemid |523|
 :pattern ( (neverTriggered53 n_15@@1) (neverTriggered53 n_15_1))
))) (=> (forall ((n_15@@2 T@U) (n_15_1@@0 T@U) ) (!  (=> (and (= (type n_15@@2) RefType) (= (type n_15_1@@0) RefType)) (=> (and (and (and (and (not (= n_15@@2 n_15_1@@0)) (and (U_2_bool (MapType2Select g n_15@@2)) (not (= n_15@@2 node@1)))) (and (U_2_bool (MapType2Select g n_15_1@@0)) (not (= n_15_1@@0 node@1)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_15@@2 n_15_1@@0))))
 :qid |stdinbpl.4782:35|
 :skolemid |523|
 :pattern ( (neverTriggered53 n_15@@2) (neverTriggered53 n_15_1@@0))
)) (and (=> (= (ControlFlow 0 329) (- 0 330)) (forall ((n_15@@3 T@U) ) (!  (=> (= (type n_15@@3) RefType) (=> (and (U_2_bool (MapType2Select g n_15@@3)) (not (= n_15@@3 node@1))) (>= (U_2_real (MapType1Select Mask@8 n_15@@3 next)) (/ (to_real 1) (to_real 2)))))
 :qid |stdinbpl.4789:35|
 :skolemid |524|
 :pattern ( (MapType0Select ExhaleHeap@5 n_15@@3 next))
 :pattern ( (MapType1Select QPMask@15 n_15@@3 next))
 :pattern ( (MapType0Select ExhaleHeap@5 n_15@@3 next))
))) (=> (forall ((n_15@@4 T@U) ) (!  (=> (= (type n_15@@4) RefType) (=> (and (U_2_bool (MapType2Select g n_15@@4)) (not (= n_15@@4 node@1))) (>= (U_2_real (MapType1Select Mask@8 n_15@@4 next)) (/ (to_real 1) (to_real 2)))))
 :qid |stdinbpl.4789:35|
 :skolemid |524|
 :pattern ( (MapType0Select ExhaleHeap@5 n_15@@4 next))
 :pattern ( (MapType1Select QPMask@15 n_15@@4 next))
 :pattern ( (MapType0Select ExhaleHeap@5 n_15@@4 next))
)) (=> (and (and (forall ((n_15@@5 T@U) ) (!  (=> (= (type n_15@@5) RefType) (=> (and (and (U_2_bool (MapType2Select g n_15@@5)) (not (= n_15@@5 node@1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (and (qpRange53 n_15@@5) (= (invRecv53 n_15@@5) n_15@@5))))
 :qid |stdinbpl.4795:40|
 :skolemid |525|
 :pattern ( (MapType0Select ExhaleHeap@5 n_15@@5 next))
 :pattern ( (MapType1Select QPMask@15 n_15@@5 next))
 :pattern ( (MapType0Select ExhaleHeap@5 n_15@@5 next))
)) (forall ((o_3@@38 T@U) ) (!  (=> (= (type o_3@@38) RefType) (=> (and (and (U_2_bool (MapType2Select g (invRecv53 o_3@@38))) (not (= (invRecv53 o_3@@38) node@1))) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange53 o_3@@38))) (= (invRecv53 o_3@@38) o_3@@38)))
 :qid |stdinbpl.4799:40|
 :skolemid |526|
 :pattern ( (invRecv53 o_3@@38))
))) (and (forall ((o_3@@39 T@U) ) (!  (=> (= (type o_3@@39) RefType) (and (=> (and (and (U_2_bool (MapType2Select g (invRecv53 o_3@@39))) (not (= (invRecv53 o_3@@39) node@1))) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange53 o_3@@39))) (and (= (invRecv53 o_3@@39) o_3@@39) (= (U_2_real (MapType1Select QPMask@15 o_3@@39 next)) (- (U_2_real (MapType1Select Mask@8 o_3@@39 next)) (/ (to_real 1) (to_real 2)))))) (=> (not (and (and (U_2_bool (MapType2Select g (invRecv53 o_3@@39))) (not (= (invRecv53 o_3@@39) node@1))) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange53 o_3@@39)))) (= (U_2_real (MapType1Select QPMask@15 o_3@@39 next)) (U_2_real (MapType1Select Mask@8 o_3@@39 next))))))
 :qid |stdinbpl.4805:40|
 :skolemid |527|
 :pattern ( (MapType1Select QPMask@15 o_3@@39 next))
)) (forall ((o_3@@40 T@U) (f_5@@12 T@U) ) (! (let ((B@@24 (FieldTypeInv1 (type f_5@@12))))
(let ((A@@25 (FieldTypeInv0 (type f_5@@12))))
 (=> (and (and (= (type o_3@@40) RefType) (= (type f_5@@12) (FieldType A@@25 B@@24))) (not (= f_5@@12 next))) (= (U_2_real (MapType1Select Mask@8 o_3@@40 f_5@@12)) (U_2_real (MapType1Select QPMask@15 o_3@@40 f_5@@12))))))
 :qid |stdinbpl.4811:47|
 :skolemid |528|
 :pattern ( (MapType1Select QPMask@15 o_3@@40 f_5@@12))
)))) (and (and (=> (= (ControlFlow 0 329) 326) anon345_Else_correct) (=> (= (ControlFlow 0 329) 233) anon346_Then_correct)) (=> (= (ControlFlow 0 329) 235) anon346_Else_correct))))))))))))
(let ((anon344_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 335) 329)) anon129_correct)))
(let ((anon344_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 333) (- 0 334)) (<= FullPerm (U_2_real (MapType1Select QPMask@10 node@1 next)))) (=> (<= FullPerm (U_2_real (MapType1Select QPMask@10 node@1 next))) (=> (= (ControlFlow 0 333) 329) anon129_correct))))))
(let ((anon343_Then_correct  (=> (not (= (MapType0Select ExhaleHeap@5 node_i@1 next) node@1)) (and (=> (= (ControlFlow 0 336) (- 0 339)) (U_2_bool (MapType2Select g node@1))) (=> (U_2_bool (MapType2Select g node@1)) (and (=> (= (ControlFlow 0 336) (- 0 338)) (not (U_2_bool (MapType2Select g null)))) (=> (not (U_2_bool (MapType2Select g null))) (and (=> (= (ControlFlow 0 336) (- 0 337)) (U_2_bool (MapType2Select g node@1))) (=> (U_2_bool (MapType2Select g node@1)) (and (=> (= (ControlFlow 0 336) 333) anon344_Then_correct) (=> (= (ControlFlow 0 336) 335) anon344_Else_correct)))))))))))
(let ((anon206_correct  (=> (state ExhaleHeap@7 QPMask@14) (=> (and (and (state ExhaleHeap@7 QPMask@14) (= Mask@16 QPMask@14)) (and (= Heap@0 ExhaleHeap@7) (= (ControlFlow 0 186) 182))) anon207_correct))))
(let ((anon382_Else_correct  (=> (and (= node_i@1 null) (= (ControlFlow 0 188) 186)) anon206_correct)))
(let ((anon382_Then_correct  (=> (and (and (not (= node_i@1 null)) (state ExhaleHeap@7 QPMask@14)) (and (forall ((v1_15 T@U) (v2_15 T@U) ) (!  (=> (and (and (= (type v1_15) RefType) (= (type v2_15) RefType)) (not (= v1_15 v2_15))) (= (exists_path ($$ ExhaleHeap@7 g) v1_15 v2_15)  (or (exists_path ($$ ExhaleHeap@6 g) v1_15 v2_15) (and (exists_path ($$ ExhaleHeap@6 g) v1_15 node@1) (exists_path ($$ ExhaleHeap@6 g) node_i@1 v2_15)))))
 :qid |stdinbpl.5686:40|
 :skolemid |629|
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| ExhaleHeap@7 g))) g) v1_15 v2_15))
)) (= (ControlFlow 0 187) 186))) anon206_correct)))
(let ((anon381_Else_correct  (=> (= node_i@1 null) (and (=> (= (ControlFlow 0 190) 187) anon382_Then_correct) (=> (= (ControlFlow 0 190) 188) anon382_Else_correct)))))
(let ((anon381_Then_correct  (=> (not (= node_i@1 null)) (=> (and (state ExhaleHeap@7 QPMask@14) (forall ((v1_14 T@U) (v2_14 T@U) ) (!  (=> (and (= (type v1_14) RefType) (= (type v2_14) RefType)) (= (edge ($$ ExhaleHeap@7 g) v1_14 v2_14)  (or (edge ($$ ExhaleHeap@6 g) v1_14 v2_14) (and (= v1_14 node@1) (= v2_14 node_i@1)))))
 :qid |stdinbpl.5679:40|
 :skolemid |628|
 :pattern ( (edge (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| ExhaleHeap@6 g))) g) v1_14 v2_14))
))) (and (=> (= (ControlFlow 0 189) 187) anon382_Then_correct) (=> (= (ControlFlow 0 189) 188) anon382_Else_correct))))))
(let ((anon380_Else_correct  (=> (not (= node_i@1 null)) (and (=> (= (ControlFlow 0 192) 189) anon381_Then_correct) (=> (= (ControlFlow 0 192) 190) anon381_Else_correct)))))
(let ((anon380_Then_correct  (=> (= node_i@1 null) (=> (and (state ExhaleHeap@7 QPMask@14) (|Set#Equal| ($$ ExhaleHeap@7 g) ($$ ExhaleHeap@6 g))) (and (=> (= (ControlFlow 0 191) 189) anon381_Then_correct) (=> (= (ControlFlow 0 191) 190) anon381_Else_correct))))))
(let ((anon378_Else_correct  (=> (forall ((n$0_17_1 T@U) ) (!  (=> (= (type n$0_17_1) RefType) (=> (and (U_2_bool (MapType2Select g n$0_17_1)) (not (= (MapType0Select ExhaleHeap@6 n$0_17_1 next) null))) (U_2_bool (MapType2Select g (MapType0Select ExhaleHeap@6 n$0_17_1 next)))))
 :qid |stdinbpl.5610:38|
 :skolemid |619|
 :pattern ( (MapType2Select g (MapType0Select ExhaleHeap@6 n$0_17_1 next)))
 :pattern ( (MapType2Select g n$0_17_1) (MapType0Select ExhaleHeap@6 n$0_17_1 next))
)) (and (=> (= (ControlFlow 0 193) (- 0 196)) (= (MapType0Select ExhaleHeap@6 node@1 next) null)) (=> (= (MapType0Select ExhaleHeap@6 node@1 next) null) (=> (and (IdenticalOnKnownLocations ExhaleHeap@6 ExhaleHeap@7 QPMask@13) (not (U_2_bool (MapType2Select g null)))) (=> (and (and (U_2_bool (MapType2Select g node@1)) (not (= node@1 null))) (and (= Mask@7 (MapType1Store QPMask@13 node@1 next (real_2_U (+ (U_2_real (MapType1Select QPMask@13 node@1 next)) FullPerm)))) (state ExhaleHeap@7 Mask@7))) (and (=> (= (ControlFlow 0 193) (- 0 195)) (forall ((n$1_9 T@U) (n$1_9_1 T@U) ) (!  (=> (and (= (type n$1_9) RefType) (= (type n$1_9_1) RefType)) (=> (and (and (and (and (not (= n$1_9 n$1_9_1)) (and (U_2_bool (MapType2Select g n$1_9)) (not (= n$1_9 node@1)))) (and (U_2_bool (MapType2Select g n$1_9_1)) (not (= n$1_9_1 node@1)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n$1_9 n$1_9_1))))
 :qid |stdinbpl.5630:33|
 :skolemid |620|
 :no-pattern (type n$1_9)
 :no-pattern (type n$1_9_1)
 :no-pattern (U_2_int n$1_9)
 :no-pattern (U_2_bool n$1_9)
 :no-pattern (U_2_int n$1_9_1)
 :no-pattern (U_2_bool n$1_9_1)
))) (=> (forall ((n$1_9@@0 T@U) (n$1_9_1@@0 T@U) ) (!  (=> (and (= (type n$1_9@@0) RefType) (= (type n$1_9_1@@0) RefType)) (=> (and (and (and (and (not (= n$1_9@@0 n$1_9_1@@0)) (and (U_2_bool (MapType2Select g n$1_9@@0)) (not (= n$1_9@@0 node@1)))) (and (U_2_bool (MapType2Select g n$1_9_1@@0)) (not (= n$1_9_1@@0 node@1)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n$1_9@@0 n$1_9_1@@0))))
 :qid |stdinbpl.5630:33|
 :skolemid |620|
 :no-pattern (type n$1_9@@0)
 :no-pattern (type n$1_9_1@@0)
 :no-pattern (U_2_int n$1_9@@0)
 :no-pattern (U_2_bool n$1_9@@0)
 :no-pattern (U_2_int n$1_9_1@@0)
 :no-pattern (U_2_bool n$1_9_1@@0)
)) (=> (and (forall ((n$1_9@@1 T@U) ) (!  (=> (= (type n$1_9@@1) RefType) (=> (and (and (U_2_bool (MapType2Select g n$1_9@@1)) (not (= n$1_9@@1 node@1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (and (qpRange64 n$1_9@@1) (= (invRecv64 n$1_9@@1) n$1_9@@1))))
 :qid |stdinbpl.5636:40|
 :skolemid |621|
 :pattern ( (MapType0Select ExhaleHeap@7 n$1_9@@1 next))
 :pattern ( (MapType1Select QPMask@14 n$1_9@@1 next))
 :pattern ( (MapType0Select ExhaleHeap@7 n$1_9@@1 next))
)) (forall ((o_3@@41 T@U) ) (!  (=> (= (type o_3@@41) RefType) (=> (and (and (and (U_2_bool (MapType2Select g (invRecv64 o_3@@41))) (not (= (invRecv64 o_3@@41) node@1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange64 o_3@@41)) (= (invRecv64 o_3@@41) o_3@@41)))
 :qid |stdinbpl.5640:40|
 :skolemid |622|
 :pattern ( (invRecv64 o_3@@41))
))) (and (=> (= (ControlFlow 0 193) (- 0 194)) (forall ((n$1_9@@2 T@U) ) (!  (=> (= (type n$1_9@@2) RefType) (=> (and (U_2_bool (MapType2Select g n$1_9@@2)) (not (= n$1_9@@2 node@1))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.5646:33|
 :skolemid |623|
 :pattern ( (MapType0Select ExhaleHeap@7 n$1_9@@2 next))
 :pattern ( (MapType1Select QPMask@14 n$1_9@@2 next))
 :pattern ( (MapType0Select ExhaleHeap@7 n$1_9@@2 next))
))) (=> (forall ((n$1_9@@3 T@U) ) (!  (=> (= (type n$1_9@@3) RefType) (=> (and (U_2_bool (MapType2Select g n$1_9@@3)) (not (= n$1_9@@3 node@1))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.5646:33|
 :skolemid |623|
 :pattern ( (MapType0Select ExhaleHeap@7 n$1_9@@3 next))
 :pattern ( (MapType1Select QPMask@14 n$1_9@@3 next))
 :pattern ( (MapType0Select ExhaleHeap@7 n$1_9@@3 next))
)) (=> (and (forall ((n$1_9@@4 T@U) ) (!  (=> (= (type n$1_9@@4) RefType) (=> (and (and (U_2_bool (MapType2Select g n$1_9@@4)) (not (= n$1_9@@4 node@1))) (> (/ (to_real 1) (to_real 2)) NoPerm)) (not (= n$1_9@@4 null))))
 :qid |stdinbpl.5652:40|
 :skolemid |624|
 :pattern ( (MapType0Select ExhaleHeap@7 n$1_9@@4 next))
 :pattern ( (MapType1Select QPMask@14 n$1_9@@4 next))
 :pattern ( (MapType0Select ExhaleHeap@7 n$1_9@@4 next))
)) (forall ((o_3@@42 T@U) ) (!  (=> (= (type o_3@@42) RefType) (and (=> (and (and (and (U_2_bool (MapType2Select g (invRecv64 o_3@@42))) (not (= (invRecv64 o_3@@42) node@1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange64 o_3@@42)) (and (=> (< NoPerm (/ (to_real 1) (to_real 2))) (= (invRecv64 o_3@@42) o_3@@42)) (= (U_2_real (MapType1Select QPMask@14 o_3@@42 next)) (+ (U_2_real (MapType1Select Mask@7 o_3@@42 next)) (/ (to_real 1) (to_real 2)))))) (=> (not (and (and (and (U_2_bool (MapType2Select g (invRecv64 o_3@@42))) (not (= (invRecv64 o_3@@42) node@1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange64 o_3@@42))) (= (U_2_real (MapType1Select QPMask@14 o_3@@42 next)) (U_2_real (MapType1Select Mask@7 o_3@@42 next))))))
 :qid |stdinbpl.5658:40|
 :skolemid |625|
 :pattern ( (MapType1Select QPMask@14 o_3@@42 next))
))) (=> (and (and (forall ((o_3@@43 T@U) (f_5@@13 T@U) ) (! (let ((B@@25 (FieldTypeInv1 (type f_5@@13))))
(let ((A@@26 (FieldTypeInv0 (type f_5@@13))))
 (=> (and (and (= (type o_3@@43) RefType) (= (type f_5@@13) (FieldType A@@26 B@@25))) (not (= f_5@@13 next))) (= (U_2_real (MapType1Select Mask@7 o_3@@43 f_5@@13)) (U_2_real (MapType1Select QPMask@14 o_3@@43 f_5@@13))))))
 :qid |stdinbpl.5662:47|
 :skolemid |626|
 :pattern ( (MapType1Select Mask@7 o_3@@43 f_5@@13))
 :pattern ( (MapType1Select QPMask@14 o_3@@43 f_5@@13))
)) (state ExhaleHeap@7 QPMask@14)) (and (forall ((n$2_11 T@U) ) (!  (=> (= (type n$2_11) RefType) (=> (and (U_2_bool (MapType2Select g n$2_11)) (not (= (MapType0Select ExhaleHeap@7 n$2_11 next) null))) (U_2_bool (MapType2Select g (MapType0Select ExhaleHeap@7 n$2_11 next)))))
 :qid |stdinbpl.5668:38|
 :skolemid |627|
 :pattern ( (MapType2Select g (MapType0Select ExhaleHeap@7 n$2_11 next)))
 :pattern ( (MapType2Select g n$2_11) (MapType0Select ExhaleHeap@7 n$2_11 next))
)) (= (MapType0Select ExhaleHeap@7 node@1 next) node_i@1))) (and (=> (= (ControlFlow 0 193) 191) anon380_Then_correct) (=> (= (ControlFlow 0 193) 192) anon380_Else_correct))))))))))))))))
(let ((anon196_correct  (=> (= Mask@6 (MapType1Store QPMask@12 node@1 next (real_2_U (- (U_2_real (MapType1Select QPMask@12 node@1 next)) FullPerm)))) (and (=> (= (ControlFlow 0 197) (- 0 200)) (forall ((n_20 T@U) ) (!  (=> (= (type n_20) RefType) (=> (and (and (U_2_bool (MapType2Select g n_20)) (not (= n_20 node@1))) (dummyFunction (MapType0Select ExhaleHeap@6 n_20 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.5562:35|
 :skolemid |612|
 :pattern ( (MapType0Select ExhaleHeap@6 n_20 next))
 :pattern ( (MapType1Select QPMask@13 n_20 next))
 :pattern ( (MapType0Select ExhaleHeap@6 n_20 next))
))) (=> (forall ((n_20@@0 T@U) ) (!  (=> (= (type n_20@@0) RefType) (=> (and (and (U_2_bool (MapType2Select g n_20@@0)) (not (= n_20@@0 node@1))) (dummyFunction (MapType0Select ExhaleHeap@6 n_20@@0 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.5562:35|
 :skolemid |612|
 :pattern ( (MapType0Select ExhaleHeap@6 n_20@@0 next))
 :pattern ( (MapType1Select QPMask@13 n_20@@0 next))
 :pattern ( (MapType0Select ExhaleHeap@6 n_20@@0 next))
)) (and (=> (= (ControlFlow 0 197) (- 0 199)) (forall ((n_20@@1 T@U) (n_20_1 T@U) ) (!  (=> (and (= (type n_20@@1) RefType) (= (type n_20_1) RefType)) (=> (and (and (and (and (not (= n_20@@1 n_20_1)) (and (U_2_bool (MapType2Select g n_20@@1)) (not (= n_20@@1 node@1)))) (and (U_2_bool (MapType2Select g n_20_1)) (not (= n_20_1 node@1)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_20@@1 n_20_1))))
 :qid |stdinbpl.5569:35|
 :skolemid |613|
 :pattern ( (neverTriggered63 n_20@@1) (neverTriggered63 n_20_1))
))) (=> (forall ((n_20@@2 T@U) (n_20_1@@0 T@U) ) (!  (=> (and (= (type n_20@@2) RefType) (= (type n_20_1@@0) RefType)) (=> (and (and (and (and (not (= n_20@@2 n_20_1@@0)) (and (U_2_bool (MapType2Select g n_20@@2)) (not (= n_20@@2 node@1)))) (and (U_2_bool (MapType2Select g n_20_1@@0)) (not (= n_20_1@@0 node@1)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_20@@2 n_20_1@@0))))
 :qid |stdinbpl.5569:35|
 :skolemid |613|
 :pattern ( (neverTriggered63 n_20@@2) (neverTriggered63 n_20_1@@0))
)) (and (=> (= (ControlFlow 0 197) (- 0 198)) (forall ((n_20@@3 T@U) ) (!  (=> (= (type n_20@@3) RefType) (=> (and (U_2_bool (MapType2Select g n_20@@3)) (not (= n_20@@3 node@1))) (>= (U_2_real (MapType1Select Mask@6 n_20@@3 next)) (/ (to_real 1) (to_real 2)))))
 :qid |stdinbpl.5576:35|
 :skolemid |614|
 :pattern ( (MapType0Select ExhaleHeap@6 n_20@@3 next))
 :pattern ( (MapType1Select QPMask@13 n_20@@3 next))
 :pattern ( (MapType0Select ExhaleHeap@6 n_20@@3 next))
))) (=> (forall ((n_20@@4 T@U) ) (!  (=> (= (type n_20@@4) RefType) (=> (and (U_2_bool (MapType2Select g n_20@@4)) (not (= n_20@@4 node@1))) (>= (U_2_real (MapType1Select Mask@6 n_20@@4 next)) (/ (to_real 1) (to_real 2)))))
 :qid |stdinbpl.5576:35|
 :skolemid |614|
 :pattern ( (MapType0Select ExhaleHeap@6 n_20@@4 next))
 :pattern ( (MapType1Select QPMask@13 n_20@@4 next))
 :pattern ( (MapType0Select ExhaleHeap@6 n_20@@4 next))
)) (=> (and (and (forall ((n_20@@5 T@U) ) (!  (=> (= (type n_20@@5) RefType) (=> (and (and (U_2_bool (MapType2Select g n_20@@5)) (not (= n_20@@5 node@1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (and (qpRange63 n_20@@5) (= (invRecv63 n_20@@5) n_20@@5))))
 :qid |stdinbpl.5582:40|
 :skolemid |615|
 :pattern ( (MapType0Select ExhaleHeap@6 n_20@@5 next))
 :pattern ( (MapType1Select QPMask@13 n_20@@5 next))
 :pattern ( (MapType0Select ExhaleHeap@6 n_20@@5 next))
)) (forall ((o_3@@44 T@U) ) (!  (=> (= (type o_3@@44) RefType) (=> (and (and (U_2_bool (MapType2Select g (invRecv63 o_3@@44))) (not (= (invRecv63 o_3@@44) node@1))) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange63 o_3@@44))) (= (invRecv63 o_3@@44) o_3@@44)))
 :qid |stdinbpl.5586:40|
 :skolemid |616|
 :pattern ( (invRecv63 o_3@@44))
))) (and (forall ((o_3@@45 T@U) ) (!  (=> (= (type o_3@@45) RefType) (and (=> (and (and (U_2_bool (MapType2Select g (invRecv63 o_3@@45))) (not (= (invRecv63 o_3@@45) node@1))) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange63 o_3@@45))) (and (= (invRecv63 o_3@@45) o_3@@45) (= (U_2_real (MapType1Select QPMask@13 o_3@@45 next)) (- (U_2_real (MapType1Select Mask@6 o_3@@45 next)) (/ (to_real 1) (to_real 2)))))) (=> (not (and (and (U_2_bool (MapType2Select g (invRecv63 o_3@@45))) (not (= (invRecv63 o_3@@45) node@1))) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange63 o_3@@45)))) (= (U_2_real (MapType1Select QPMask@13 o_3@@45 next)) (U_2_real (MapType1Select Mask@6 o_3@@45 next))))))
 :qid |stdinbpl.5592:40|
 :skolemid |617|
 :pattern ( (MapType1Select QPMask@13 o_3@@45 next))
)) (forall ((o_3@@46 T@U) (f_5@@14 T@U) ) (! (let ((B@@26 (FieldTypeInv1 (type f_5@@14))))
(let ((A@@27 (FieldTypeInv0 (type f_5@@14))))
 (=> (and (and (= (type o_3@@46) RefType) (= (type f_5@@14) (FieldType A@@27 B@@26))) (not (= f_5@@14 next))) (= (U_2_real (MapType1Select Mask@6 o_3@@46 f_5@@14)) (U_2_real (MapType1Select QPMask@13 o_3@@46 f_5@@14))))))
 :qid |stdinbpl.5598:47|
 :skolemid |618|
 :pattern ( (MapType1Select QPMask@13 o_3@@46 f_5@@14))
)))) (and (and (=> (= (ControlFlow 0 197) 193) anon378_Else_correct) (=> (= (ControlFlow 0 197) 129) anon379_Then_correct)) (=> (= (ControlFlow 0 197) 131) anon379_Else_correct))))))))))))
(let ((anon377_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 203) 197)) anon196_correct)))
(let ((anon377_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 201) (- 0 202)) (<= FullPerm (U_2_real (MapType1Select QPMask@12 node@1 next)))) (=> (<= FullPerm (U_2_real (MapType1Select QPMask@12 node@1 next))) (=> (= (ControlFlow 0 201) 197) anon196_correct))))))
(let ((anon194_correct  (and (=> (= (ControlFlow 0 204) (- 0 206)) (not (U_2_bool (MapType2Select g null)))) (=> (not (U_2_bool (MapType2Select g null))) (and (=> (= (ControlFlow 0 204) (- 0 205)) (U_2_bool (MapType2Select g node@1))) (=> (U_2_bool (MapType2Select g node@1)) (and (=> (= (ControlFlow 0 204) 201) anon377_Then_correct) (=> (= (ControlFlow 0 204) 203) anon377_Else_correct))))))))
(let ((anon376_Else_correct  (=> (and (= node_i@1 null) (= (ControlFlow 0 209) 204)) anon194_correct)))
(let ((anon376_Then_correct  (=> (not (= node_i@1 null)) (and (=> (= (ControlFlow 0 207) (- 0 208)) (U_2_bool (MapType2Select g node_i@1))) (=> (U_2_bool (MapType2Select g node_i@1)) (=> (= (ControlFlow 0 207) 204) anon194_correct))))))
(let ((anon192_correct  (=> (and (state ExhaleHeap@6 QPMask@12) (state ExhaleHeap@6 QPMask@12)) (and (=> (= (ControlFlow 0 210) (- 0 211)) (U_2_bool (MapType2Select g node@1))) (=> (U_2_bool (MapType2Select g node@1)) (and (=> (= (ControlFlow 0 210) 207) anon376_Then_correct) (=> (= (ControlFlow 0 210) 209) anon376_Else_correct)))))))
(let ((anon375_Else_correct  (=> (and (= (MapType0Select ExhaleHeap@5 node@1 next) null) (= (ControlFlow 0 213) 210)) anon192_correct)))
(let ((anon375_Then_correct  (=> (and (and (not (= (MapType0Select ExhaleHeap@5 node@1 next) null)) (state ExhaleHeap@6 QPMask@12)) (and (forall ((v1_13 T@U) (v2_13 T@U) ) (!  (=> (and (and (= (type v1_13) RefType) (= (type v2_13) RefType)) (not (= v1_13 v2_13))) (= (exists_path ($$ ExhaleHeap@6 g) v1_13 v2_13)  (and (exists_path ($$ ExhaleHeap@5 g) v1_13 v2_13) (not (and (exists_path ($$ ExhaleHeap@5 g) v1_13 node@1) (exists_path ($$ ExhaleHeap@5 g) (MapType0Select ExhaleHeap@5 node@1 next) v2_13))))))
 :qid |stdinbpl.5527:40|
 :skolemid |611|
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| ExhaleHeap@6 g))) g) v1_13 v2_13))
)) (= (ControlFlow 0 212) 210))) anon192_correct)))
(let ((anon374_Else_correct  (=> (= (MapType0Select ExhaleHeap@5 node@1 next) null) (and (=> (= (ControlFlow 0 215) 212) anon375_Then_correct) (=> (= (ControlFlow 0 215) 213) anon375_Else_correct)))))
(let ((anon374_Then_correct  (=> (not (= (MapType0Select ExhaleHeap@5 node@1 next) null)) (=> (and (state ExhaleHeap@6 QPMask@12) (forall ((v1_12 T@U) (v2_12 T@U) ) (!  (=> (and (= (type v1_12) RefType) (= (type v2_12) RefType)) (= (edge ($$ ExhaleHeap@6 g) v1_12 v2_12)  (and (edge ($$ ExhaleHeap@5 g) v1_12 v2_12) (not (and (= v1_12 node@1) (= v2_12 (MapType0Select ExhaleHeap@5 node@1 next)))))))
 :qid |stdinbpl.5520:40|
 :skolemid |610|
 :pattern ( (edge (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| ExhaleHeap@6 g))) g) v1_12 v2_12))
))) (and (=> (= (ControlFlow 0 214) 212) anon375_Then_correct) (=> (= (ControlFlow 0 214) 213) anon375_Else_correct))))))
(let ((anon373_Else_correct  (=> (not (= (MapType0Select ExhaleHeap@5 node@1 next) null)) (and (=> (= (ControlFlow 0 217) 214) anon374_Then_correct) (=> (= (ControlFlow 0 217) 215) anon374_Else_correct)))))
(let ((anon373_Then_correct  (=> (= (MapType0Select ExhaleHeap@5 node@1 next) null) (=> (and (state ExhaleHeap@6 QPMask@12) (|Set#Equal| ($$ ExhaleHeap@6 g) ($$ ExhaleHeap@5 g))) (and (=> (= (ControlFlow 0 216) 214) anon374_Then_correct) (=> (= (ControlFlow 0 216) 215) anon374_Else_correct))))))
(let ((anon371_Else_correct  (=> (forall ((n$0_15_1 T@U) ) (!  (=> (= (type n$0_15_1) RefType) (=> (and (U_2_bool (MapType2Select g n$0_15_1)) (not (= (MapType0Select ExhaleHeap@5 n$0_15_1 next) null))) (U_2_bool (MapType2Select g (MapType0Select ExhaleHeap@5 n$0_15_1 next)))))
 :qid |stdinbpl.5453:38|
 :skolemid |601|
 :pattern ( (MapType2Select g (MapType0Select ExhaleHeap@5 n$0_15_1 next)))
 :pattern ( (MapType2Select g n$0_15_1) (MapType0Select ExhaleHeap@5 n$0_15_1 next))
)) (=> (and (IdenticalOnKnownLocations ExhaleHeap@5 ExhaleHeap@6 QPMask@11) (not (U_2_bool (MapType2Select g null)))) (=> (and (and (U_2_bool (MapType2Select g node@1)) (not (= node@1 null))) (and (= Mask@5 (MapType1Store QPMask@11 node@1 next (real_2_U (+ (U_2_real (MapType1Select QPMask@11 node@1 next)) FullPerm)))) (state ExhaleHeap@6 Mask@5))) (and (=> (= (ControlFlow 0 218) (- 0 220)) (forall ((n$1_8 T@U) (n$1_8_1 T@U) ) (!  (=> (and (= (type n$1_8) RefType) (= (type n$1_8_1) RefType)) (=> (and (and (and (and (not (= n$1_8 n$1_8_1)) (and (U_2_bool (MapType2Select g n$1_8)) (not (= n$1_8 node@1)))) (and (U_2_bool (MapType2Select g n$1_8_1)) (not (= n$1_8_1 node@1)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n$1_8 n$1_8_1))))
 :qid |stdinbpl.5471:33|
 :skolemid |602|
 :no-pattern (type n$1_8)
 :no-pattern (type n$1_8_1)
 :no-pattern (U_2_int n$1_8)
 :no-pattern (U_2_bool n$1_8)
 :no-pattern (U_2_int n$1_8_1)
 :no-pattern (U_2_bool n$1_8_1)
))) (=> (forall ((n$1_8@@0 T@U) (n$1_8_1@@0 T@U) ) (!  (=> (and (= (type n$1_8@@0) RefType) (= (type n$1_8_1@@0) RefType)) (=> (and (and (and (and (not (= n$1_8@@0 n$1_8_1@@0)) (and (U_2_bool (MapType2Select g n$1_8@@0)) (not (= n$1_8@@0 node@1)))) (and (U_2_bool (MapType2Select g n$1_8_1@@0)) (not (= n$1_8_1@@0 node@1)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n$1_8@@0 n$1_8_1@@0))))
 :qid |stdinbpl.5471:33|
 :skolemid |602|
 :no-pattern (type n$1_8@@0)
 :no-pattern (type n$1_8_1@@0)
 :no-pattern (U_2_int n$1_8@@0)
 :no-pattern (U_2_bool n$1_8@@0)
 :no-pattern (U_2_int n$1_8_1@@0)
 :no-pattern (U_2_bool n$1_8_1@@0)
)) (=> (and (forall ((n$1_8@@1 T@U) ) (!  (=> (= (type n$1_8@@1) RefType) (=> (and (and (U_2_bool (MapType2Select g n$1_8@@1)) (not (= n$1_8@@1 node@1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (and (qpRange62 n$1_8@@1) (= (invRecv62 n$1_8@@1) n$1_8@@1))))
 :qid |stdinbpl.5477:40|
 :skolemid |603|
 :pattern ( (MapType0Select ExhaleHeap@6 n$1_8@@1 next))
 :pattern ( (MapType1Select QPMask@12 n$1_8@@1 next))
 :pattern ( (MapType0Select ExhaleHeap@6 n$1_8@@1 next))
)) (forall ((o_3@@47 T@U) ) (!  (=> (= (type o_3@@47) RefType) (=> (and (and (and (U_2_bool (MapType2Select g (invRecv62 o_3@@47))) (not (= (invRecv62 o_3@@47) node@1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange62 o_3@@47)) (= (invRecv62 o_3@@47) o_3@@47)))
 :qid |stdinbpl.5481:40|
 :skolemid |604|
 :pattern ( (invRecv62 o_3@@47))
))) (and (=> (= (ControlFlow 0 218) (- 0 219)) (forall ((n$1_8@@2 T@U) ) (!  (=> (= (type n$1_8@@2) RefType) (=> (and (U_2_bool (MapType2Select g n$1_8@@2)) (not (= n$1_8@@2 node@1))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.5487:33|
 :skolemid |605|
 :pattern ( (MapType0Select ExhaleHeap@6 n$1_8@@2 next))
 :pattern ( (MapType1Select QPMask@12 n$1_8@@2 next))
 :pattern ( (MapType0Select ExhaleHeap@6 n$1_8@@2 next))
))) (=> (forall ((n$1_8@@3 T@U) ) (!  (=> (= (type n$1_8@@3) RefType) (=> (and (U_2_bool (MapType2Select g n$1_8@@3)) (not (= n$1_8@@3 node@1))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.5487:33|
 :skolemid |605|
 :pattern ( (MapType0Select ExhaleHeap@6 n$1_8@@3 next))
 :pattern ( (MapType1Select QPMask@12 n$1_8@@3 next))
 :pattern ( (MapType0Select ExhaleHeap@6 n$1_8@@3 next))
)) (=> (and (forall ((n$1_8@@4 T@U) ) (!  (=> (= (type n$1_8@@4) RefType) (=> (and (and (U_2_bool (MapType2Select g n$1_8@@4)) (not (= n$1_8@@4 node@1))) (> (/ (to_real 1) (to_real 2)) NoPerm)) (not (= n$1_8@@4 null))))
 :qid |stdinbpl.5493:40|
 :skolemid |606|
 :pattern ( (MapType0Select ExhaleHeap@6 n$1_8@@4 next))
 :pattern ( (MapType1Select QPMask@12 n$1_8@@4 next))
 :pattern ( (MapType0Select ExhaleHeap@6 n$1_8@@4 next))
)) (forall ((o_3@@48 T@U) ) (!  (=> (= (type o_3@@48) RefType) (and (=> (and (and (and (U_2_bool (MapType2Select g (invRecv62 o_3@@48))) (not (= (invRecv62 o_3@@48) node@1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange62 o_3@@48)) (and (=> (< NoPerm (/ (to_real 1) (to_real 2))) (= (invRecv62 o_3@@48) o_3@@48)) (= (U_2_real (MapType1Select QPMask@12 o_3@@48 next)) (+ (U_2_real (MapType1Select Mask@5 o_3@@48 next)) (/ (to_real 1) (to_real 2)))))) (=> (not (and (and (and (U_2_bool (MapType2Select g (invRecv62 o_3@@48))) (not (= (invRecv62 o_3@@48) node@1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange62 o_3@@48))) (= (U_2_real (MapType1Select QPMask@12 o_3@@48 next)) (U_2_real (MapType1Select Mask@5 o_3@@48 next))))))
 :qid |stdinbpl.5499:40|
 :skolemid |607|
 :pattern ( (MapType1Select QPMask@12 o_3@@48 next))
))) (=> (and (and (forall ((o_3@@49 T@U) (f_5@@15 T@U) ) (! (let ((B@@27 (FieldTypeInv1 (type f_5@@15))))
(let ((A@@28 (FieldTypeInv0 (type f_5@@15))))
 (=> (and (and (= (type o_3@@49) RefType) (= (type f_5@@15) (FieldType A@@28 B@@27))) (not (= f_5@@15 next))) (= (U_2_real (MapType1Select Mask@5 o_3@@49 f_5@@15)) (U_2_real (MapType1Select QPMask@12 o_3@@49 f_5@@15))))))
 :qid |stdinbpl.5503:47|
 :skolemid |608|
 :pattern ( (MapType1Select Mask@5 o_3@@49 f_5@@15))
 :pattern ( (MapType1Select QPMask@12 o_3@@49 f_5@@15))
)) (state ExhaleHeap@6 QPMask@12)) (and (forall ((n$2_10 T@U) ) (!  (=> (= (type n$2_10) RefType) (=> (and (U_2_bool (MapType2Select g n$2_10)) (not (= (MapType0Select ExhaleHeap@6 n$2_10 next) null))) (U_2_bool (MapType2Select g (MapType0Select ExhaleHeap@6 n$2_10 next)))))
 :qid |stdinbpl.5509:38|
 :skolemid |609|
 :pattern ( (MapType2Select g (MapType0Select ExhaleHeap@6 n$2_10 next)))
 :pattern ( (MapType2Select g n$2_10) (MapType0Select ExhaleHeap@6 n$2_10 next))
)) (= (MapType0Select ExhaleHeap@6 node@1 next) null))) (and (=> (= (ControlFlow 0 218) 216) anon373_Then_correct) (=> (= (ControlFlow 0 218) 217) anon373_Else_correct))))))))))))))
(let ((anon182_correct  (=> (= Mask@4 (MapType1Store QPMask@10 node@1 next (real_2_U (- (U_2_real (MapType1Select QPMask@10 node@1 next)) FullPerm)))) (and (=> (= (ControlFlow 0 221) (- 0 224)) (forall ((n_19 T@U) ) (!  (=> (= (type n_19) RefType) (=> (and (and (U_2_bool (MapType2Select g n_19)) (not (= n_19 node@1))) (dummyFunction (MapType0Select ExhaleHeap@5 n_19 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.5405:35|
 :skolemid |594|
 :pattern ( (MapType0Select ExhaleHeap@5 n_19 next))
 :pattern ( (MapType1Select QPMask@11 n_19 next))
 :pattern ( (MapType0Select ExhaleHeap@5 n_19 next))
))) (=> (forall ((n_19@@0 T@U) ) (!  (=> (= (type n_19@@0) RefType) (=> (and (and (U_2_bool (MapType2Select g n_19@@0)) (not (= n_19@@0 node@1))) (dummyFunction (MapType0Select ExhaleHeap@5 n_19@@0 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.5405:35|
 :skolemid |594|
 :pattern ( (MapType0Select ExhaleHeap@5 n_19@@0 next))
 :pattern ( (MapType1Select QPMask@11 n_19@@0 next))
 :pattern ( (MapType0Select ExhaleHeap@5 n_19@@0 next))
)) (and (=> (= (ControlFlow 0 221) (- 0 223)) (forall ((n_19@@1 T@U) (n_19_1 T@U) ) (!  (=> (and (= (type n_19@@1) RefType) (= (type n_19_1) RefType)) (=> (and (and (and (and (not (= n_19@@1 n_19_1)) (and (U_2_bool (MapType2Select g n_19@@1)) (not (= n_19@@1 node@1)))) (and (U_2_bool (MapType2Select g n_19_1)) (not (= n_19_1 node@1)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_19@@1 n_19_1))))
 :qid |stdinbpl.5412:35|
 :skolemid |595|
 :pattern ( (neverTriggered61 n_19@@1) (neverTriggered61 n_19_1))
))) (=> (forall ((n_19@@2 T@U) (n_19_1@@0 T@U) ) (!  (=> (and (= (type n_19@@2) RefType) (= (type n_19_1@@0) RefType)) (=> (and (and (and (and (not (= n_19@@2 n_19_1@@0)) (and (U_2_bool (MapType2Select g n_19@@2)) (not (= n_19@@2 node@1)))) (and (U_2_bool (MapType2Select g n_19_1@@0)) (not (= n_19_1@@0 node@1)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_19@@2 n_19_1@@0))))
 :qid |stdinbpl.5412:35|
 :skolemid |595|
 :pattern ( (neverTriggered61 n_19@@2) (neverTriggered61 n_19_1@@0))
)) (and (=> (= (ControlFlow 0 221) (- 0 222)) (forall ((n_19@@3 T@U) ) (!  (=> (= (type n_19@@3) RefType) (=> (and (U_2_bool (MapType2Select g n_19@@3)) (not (= n_19@@3 node@1))) (>= (U_2_real (MapType1Select Mask@4 n_19@@3 next)) (/ (to_real 1) (to_real 2)))))
 :qid |stdinbpl.5419:35|
 :skolemid |596|
 :pattern ( (MapType0Select ExhaleHeap@5 n_19@@3 next))
 :pattern ( (MapType1Select QPMask@11 n_19@@3 next))
 :pattern ( (MapType0Select ExhaleHeap@5 n_19@@3 next))
))) (=> (forall ((n_19@@4 T@U) ) (!  (=> (= (type n_19@@4) RefType) (=> (and (U_2_bool (MapType2Select g n_19@@4)) (not (= n_19@@4 node@1))) (>= (U_2_real (MapType1Select Mask@4 n_19@@4 next)) (/ (to_real 1) (to_real 2)))))
 :qid |stdinbpl.5419:35|
 :skolemid |596|
 :pattern ( (MapType0Select ExhaleHeap@5 n_19@@4 next))
 :pattern ( (MapType1Select QPMask@11 n_19@@4 next))
 :pattern ( (MapType0Select ExhaleHeap@5 n_19@@4 next))
)) (=> (and (and (forall ((n_19@@5 T@U) ) (!  (=> (= (type n_19@@5) RefType) (=> (and (and (U_2_bool (MapType2Select g n_19@@5)) (not (= n_19@@5 node@1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (and (qpRange61 n_19@@5) (= (invRecv61 n_19@@5) n_19@@5))))
 :qid |stdinbpl.5425:40|
 :skolemid |597|
 :pattern ( (MapType0Select ExhaleHeap@5 n_19@@5 next))
 :pattern ( (MapType1Select QPMask@11 n_19@@5 next))
 :pattern ( (MapType0Select ExhaleHeap@5 n_19@@5 next))
)) (forall ((o_3@@50 T@U) ) (!  (=> (= (type o_3@@50) RefType) (=> (and (and (U_2_bool (MapType2Select g (invRecv61 o_3@@50))) (not (= (invRecv61 o_3@@50) node@1))) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange61 o_3@@50))) (= (invRecv61 o_3@@50) o_3@@50)))
 :qid |stdinbpl.5429:40|
 :skolemid |598|
 :pattern ( (invRecv61 o_3@@50))
))) (and (forall ((o_3@@51 T@U) ) (!  (=> (= (type o_3@@51) RefType) (and (=> (and (and (U_2_bool (MapType2Select g (invRecv61 o_3@@51))) (not (= (invRecv61 o_3@@51) node@1))) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange61 o_3@@51))) (and (= (invRecv61 o_3@@51) o_3@@51) (= (U_2_real (MapType1Select QPMask@11 o_3@@51 next)) (- (U_2_real (MapType1Select Mask@4 o_3@@51 next)) (/ (to_real 1) (to_real 2)))))) (=> (not (and (and (U_2_bool (MapType2Select g (invRecv61 o_3@@51))) (not (= (invRecv61 o_3@@51) node@1))) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange61 o_3@@51)))) (= (U_2_real (MapType1Select QPMask@11 o_3@@51 next)) (U_2_real (MapType1Select Mask@4 o_3@@51 next))))))
 :qid |stdinbpl.5435:40|
 :skolemid |599|
 :pattern ( (MapType1Select QPMask@11 o_3@@51 next))
)) (forall ((o_3@@52 T@U) (f_5@@16 T@U) ) (! (let ((B@@28 (FieldTypeInv1 (type f_5@@16))))
(let ((A@@29 (FieldTypeInv0 (type f_5@@16))))
 (=> (and (and (= (type o_3@@52) RefType) (= (type f_5@@16) (FieldType A@@29 B@@28))) (not (= f_5@@16 next))) (= (U_2_real (MapType1Select Mask@4 o_3@@52 f_5@@16)) (U_2_real (MapType1Select QPMask@11 o_3@@52 f_5@@16))))))
 :qid |stdinbpl.5441:47|
 :skolemid |600|
 :pattern ( (MapType1Select QPMask@11 o_3@@52 f_5@@16))
)))) (and (and (=> (= (ControlFlow 0 221) 218) anon371_Else_correct) (=> (= (ControlFlow 0 221) 125) anon372_Then_correct)) (=> (= (ControlFlow 0 221) 127) anon372_Else_correct))))))))))))
(let ((anon370_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 227) 221)) anon182_correct)))
(let ((anon370_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 225) (- 0 226)) (<= FullPerm (U_2_real (MapType1Select QPMask@10 node@1 next)))) (=> (<= FullPerm (U_2_real (MapType1Select QPMask@10 node@1 next))) (=> (= (ControlFlow 0 225) 221) anon182_correct))))))
(let ((anon343_Else_correct  (=> (= (MapType0Select ExhaleHeap@5 node_i@1 next) node@1) (and (=> (= (ControlFlow 0 228) (- 0 231)) (U_2_bool (MapType2Select g node@1))) (=> (U_2_bool (MapType2Select g node@1)) (and (=> (= (ControlFlow 0 228) (- 0 230)) (not (U_2_bool (MapType2Select g null)))) (=> (not (U_2_bool (MapType2Select g null))) (and (=> (= (ControlFlow 0 228) (- 0 229)) (U_2_bool (MapType2Select g node@1))) (=> (U_2_bool (MapType2Select g node@1)) (and (=> (= (ControlFlow 0 228) 225) anon370_Then_correct) (=> (= (ControlFlow 0 228) 227) anon370_Else_correct)))))))))))
(let ((anon126_correct  (=> (and (state ExhaleHeap@5 QPMask@10) (state ExhaleHeap@5 QPMask@10)) (and (=> (= (ControlFlow 0 340) (- 0 341)) (HasDirectPerm QPMask@10 node_i@1 next)) (=> (HasDirectPerm QPMask@10 node_i@1 next) (and (=> (= (ControlFlow 0 340) 336) anon343_Then_correct) (=> (= (ControlFlow 0 340) 228) anon343_Else_correct)))))))
(let ((anon342_Else_correct  (=> (and (= node@1 null) (= (ControlFlow 0 343) 340)) anon126_correct)))
(let ((anon342_Then_correct  (=> (and (and (not (= node@1 null)) (state ExhaleHeap@5 QPMask@10)) (and (forall ((v1_3 T@U) (v2_3 T@U) ) (!  (=> (and (and (= (type v1_3) RefType) (= (type v2_3) RefType)) (not (= v1_3 v2_3))) (= (exists_path ($$ ExhaleHeap@5 g) v1_3 v2_3)  (or (exists_path ($$ ExhaleHeap@4 g) v1_3 v2_3) (and (exists_path ($$ ExhaleHeap@4 g) v1_3 prev_i@1) (exists_path ($$ ExhaleHeap@4 g) node@1 v2_3)))))
 :qid |stdinbpl.4737:36|
 :skolemid |521|
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| ExhaleHeap@5 g))) g) v1_3 v2_3))
)) (= (ControlFlow 0 342) 340))) anon126_correct)))
(let ((anon341_Else_correct  (=> (= node@1 null) (and (=> (= (ControlFlow 0 345) 342) anon342_Then_correct) (=> (= (ControlFlow 0 345) 343) anon342_Else_correct)))))
(let ((anon341_Then_correct  (=> (not (= node@1 null)) (=> (and (state ExhaleHeap@5 QPMask@10) (forall ((v1_2_1 T@U) (v2_2_1 T@U) ) (!  (=> (and (= (type v1_2_1) RefType) (= (type v2_2_1) RefType)) (= (edge ($$ ExhaleHeap@5 g) v1_2_1 v2_2_1)  (or (edge ($$ ExhaleHeap@4 g) v1_2_1 v2_2_1) (and (= v1_2_1 prev_i@1) (= v2_2_1 node@1)))))
 :qid |stdinbpl.4730:36|
 :skolemid |520|
 :pattern ( (edge (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| ExhaleHeap@4 g))) g) v1_2_1 v2_2_1))
))) (and (=> (= (ControlFlow 0 344) 342) anon342_Then_correct) (=> (= (ControlFlow 0 344) 343) anon342_Else_correct))))))
(let ((anon340_Else_correct  (=> (not (= node@1 null)) (and (=> (= (ControlFlow 0 347) 344) anon341_Then_correct) (=> (= (ControlFlow 0 347) 345) anon341_Else_correct)))))
(let ((anon340_Then_correct  (=> (= node@1 null) (=> (and (state ExhaleHeap@5 QPMask@10) (|Set#Equal| ($$ ExhaleHeap@5 g) ($$ ExhaleHeap@4 g))) (and (=> (= (ControlFlow 0 346) 344) anon341_Then_correct) (=> (= (ControlFlow 0 346) 345) anon341_Else_correct))))))
(let ((anon338_Else_correct  (=> (forall ((n$0_5_1 T@U) ) (!  (=> (= (type n$0_5_1) RefType) (=> (and (U_2_bool (MapType2Select g n$0_5_1)) (not (= (MapType0Select ExhaleHeap@4 n$0_5_1 next) null))) (U_2_bool (MapType2Select g (MapType0Select ExhaleHeap@4 n$0_5_1 next)))))
 :qid |stdinbpl.4661:34|
 :skolemid |511|
 :pattern ( (MapType2Select g (MapType0Select ExhaleHeap@4 n$0_5_1 next)))
 :pattern ( (MapType2Select g n$0_5_1) (MapType0Select ExhaleHeap@4 n$0_5_1 next))
)) (and (=> (= (ControlFlow 0 348) (- 0 351)) (= (MapType0Select ExhaleHeap@4 prev_i@1 next) null)) (=> (= (MapType0Select ExhaleHeap@4 prev_i@1 next) null) (=> (and (IdenticalOnKnownLocations ExhaleHeap@4 ExhaleHeap@5 QPMask@9) (not (U_2_bool (MapType2Select g null)))) (=> (and (and (U_2_bool (MapType2Select g prev_i@1)) (not (= prev_i@1 null))) (and (= Mask@3 (MapType1Store QPMask@9 prev_i@1 next (real_2_U (+ (U_2_real (MapType1Select QPMask@9 prev_i@1 next)) FullPerm)))) (state ExhaleHeap@5 Mask@3))) (and (=> (= (ControlFlow 0 348) (- 0 350)) (forall ((n$1_3 T@U) (n$1_3_1 T@U) ) (!  (=> (and (= (type n$1_3) RefType) (= (type n$1_3_1) RefType)) (=> (and (and (and (and (not (= n$1_3 n$1_3_1)) (and (U_2_bool (MapType2Select g n$1_3)) (not (= n$1_3 prev_i@1)))) (and (U_2_bool (MapType2Select g n$1_3_1)) (not (= n$1_3_1 prev_i@1)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n$1_3 n$1_3_1))))
 :qid |stdinbpl.4681:29|
 :skolemid |512|
 :no-pattern (type n$1_3)
 :no-pattern (type n$1_3_1)
 :no-pattern (U_2_int n$1_3)
 :no-pattern (U_2_bool n$1_3)
 :no-pattern (U_2_int n$1_3_1)
 :no-pattern (U_2_bool n$1_3_1)
))) (=> (forall ((n$1_3@@0 T@U) (n$1_3_1@@0 T@U) ) (!  (=> (and (= (type n$1_3@@0) RefType) (= (type n$1_3_1@@0) RefType)) (=> (and (and (and (and (not (= n$1_3@@0 n$1_3_1@@0)) (and (U_2_bool (MapType2Select g n$1_3@@0)) (not (= n$1_3@@0 prev_i@1)))) (and (U_2_bool (MapType2Select g n$1_3_1@@0)) (not (= n$1_3_1@@0 prev_i@1)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n$1_3@@0 n$1_3_1@@0))))
 :qid |stdinbpl.4681:29|
 :skolemid |512|
 :no-pattern (type n$1_3@@0)
 :no-pattern (type n$1_3_1@@0)
 :no-pattern (U_2_int n$1_3@@0)
 :no-pattern (U_2_bool n$1_3@@0)
 :no-pattern (U_2_int n$1_3_1@@0)
 :no-pattern (U_2_bool n$1_3_1@@0)
)) (=> (and (forall ((n$1_3@@1 T@U) ) (!  (=> (= (type n$1_3@@1) RefType) (=> (and (and (U_2_bool (MapType2Select g n$1_3@@1)) (not (= n$1_3@@1 prev_i@1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (and (qpRange52 n$1_3@@1) (= (invRecv52 n$1_3@@1) n$1_3@@1))))
 :qid |stdinbpl.4687:36|
 :skolemid |513|
 :pattern ( (MapType0Select ExhaleHeap@5 n$1_3@@1 next))
 :pattern ( (MapType1Select QPMask@10 n$1_3@@1 next))
 :pattern ( (MapType0Select ExhaleHeap@5 n$1_3@@1 next))
)) (forall ((o_3@@53 T@U) ) (!  (=> (= (type o_3@@53) RefType) (=> (and (and (and (U_2_bool (MapType2Select g (invRecv52 o_3@@53))) (not (= (invRecv52 o_3@@53) prev_i@1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange52 o_3@@53)) (= (invRecv52 o_3@@53) o_3@@53)))
 :qid |stdinbpl.4691:36|
 :skolemid |514|
 :pattern ( (invRecv52 o_3@@53))
))) (and (=> (= (ControlFlow 0 348) (- 0 349)) (forall ((n$1_3@@2 T@U) ) (!  (=> (= (type n$1_3@@2) RefType) (=> (and (U_2_bool (MapType2Select g n$1_3@@2)) (not (= n$1_3@@2 prev_i@1))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.4697:29|
 :skolemid |515|
 :pattern ( (MapType0Select ExhaleHeap@5 n$1_3@@2 next))
 :pattern ( (MapType1Select QPMask@10 n$1_3@@2 next))
 :pattern ( (MapType0Select ExhaleHeap@5 n$1_3@@2 next))
))) (=> (forall ((n$1_3@@3 T@U) ) (!  (=> (= (type n$1_3@@3) RefType) (=> (and (U_2_bool (MapType2Select g n$1_3@@3)) (not (= n$1_3@@3 prev_i@1))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.4697:29|
 :skolemid |515|
 :pattern ( (MapType0Select ExhaleHeap@5 n$1_3@@3 next))
 :pattern ( (MapType1Select QPMask@10 n$1_3@@3 next))
 :pattern ( (MapType0Select ExhaleHeap@5 n$1_3@@3 next))
)) (=> (and (forall ((n$1_3@@4 T@U) ) (!  (=> (= (type n$1_3@@4) RefType) (=> (and (and (U_2_bool (MapType2Select g n$1_3@@4)) (not (= n$1_3@@4 prev_i@1))) (> (/ (to_real 1) (to_real 2)) NoPerm)) (not (= n$1_3@@4 null))))
 :qid |stdinbpl.4703:36|
 :skolemid |516|
 :pattern ( (MapType0Select ExhaleHeap@5 n$1_3@@4 next))
 :pattern ( (MapType1Select QPMask@10 n$1_3@@4 next))
 :pattern ( (MapType0Select ExhaleHeap@5 n$1_3@@4 next))
)) (forall ((o_3@@54 T@U) ) (!  (=> (= (type o_3@@54) RefType) (and (=> (and (and (and (U_2_bool (MapType2Select g (invRecv52 o_3@@54))) (not (= (invRecv52 o_3@@54) prev_i@1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange52 o_3@@54)) (and (=> (< NoPerm (/ (to_real 1) (to_real 2))) (= (invRecv52 o_3@@54) o_3@@54)) (= (U_2_real (MapType1Select QPMask@10 o_3@@54 next)) (+ (U_2_real (MapType1Select Mask@3 o_3@@54 next)) (/ (to_real 1) (to_real 2)))))) (=> (not (and (and (and (U_2_bool (MapType2Select g (invRecv52 o_3@@54))) (not (= (invRecv52 o_3@@54) prev_i@1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange52 o_3@@54))) (= (U_2_real (MapType1Select QPMask@10 o_3@@54 next)) (U_2_real (MapType1Select Mask@3 o_3@@54 next))))))
 :qid |stdinbpl.4709:36|
 :skolemid |517|
 :pattern ( (MapType1Select QPMask@10 o_3@@54 next))
))) (=> (and (and (forall ((o_3@@55 T@U) (f_5@@17 T@U) ) (! (let ((B@@29 (FieldTypeInv1 (type f_5@@17))))
(let ((A@@30 (FieldTypeInv0 (type f_5@@17))))
 (=> (and (and (= (type o_3@@55) RefType) (= (type f_5@@17) (FieldType A@@30 B@@29))) (not (= f_5@@17 next))) (= (U_2_real (MapType1Select Mask@3 o_3@@55 f_5@@17)) (U_2_real (MapType1Select QPMask@10 o_3@@55 f_5@@17))))))
 :qid |stdinbpl.4713:43|
 :skolemid |518|
 :pattern ( (MapType1Select Mask@3 o_3@@55 f_5@@17))
 :pattern ( (MapType1Select QPMask@10 o_3@@55 f_5@@17))
)) (state ExhaleHeap@5 QPMask@10)) (and (forall ((n$2_5_1 T@U) ) (!  (=> (= (type n$2_5_1) RefType) (=> (and (U_2_bool (MapType2Select g n$2_5_1)) (not (= (MapType0Select ExhaleHeap@5 n$2_5_1 next) null))) (U_2_bool (MapType2Select g (MapType0Select ExhaleHeap@5 n$2_5_1 next)))))
 :qid |stdinbpl.4719:34|
 :skolemid |519|
 :pattern ( (MapType2Select g (MapType0Select ExhaleHeap@5 n$2_5_1 next)))
 :pattern ( (MapType2Select g n$2_5_1) (MapType0Select ExhaleHeap@5 n$2_5_1 next))
)) (= (MapType0Select ExhaleHeap@5 prev_i@1 next) node@1))) (and (=> (= (ControlFlow 0 348) 346) anon340_Then_correct) (=> (= (ControlFlow 0 348) 347) anon340_Else_correct))))))))))))))))
(let ((anon116_correct  (=> (= Mask@2 (MapType1Store QPMask@8 prev_i@1 next (real_2_U (- (U_2_real (MapType1Select QPMask@8 prev_i@1 next)) FullPerm)))) (and (=> (= (ControlFlow 0 352) (- 0 355)) (forall ((n_14 T@U) ) (!  (=> (= (type n_14) RefType) (=> (and (and (U_2_bool (MapType2Select g n_14)) (not (= n_14 prev_i@1))) (dummyFunction (MapType0Select ExhaleHeap@4 n_14 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.4613:31|
 :skolemid |504|
 :pattern ( (MapType0Select ExhaleHeap@4 n_14 next))
 :pattern ( (MapType1Select QPMask@9 n_14 next))
 :pattern ( (MapType0Select ExhaleHeap@4 n_14 next))
))) (=> (forall ((n_14@@0 T@U) ) (!  (=> (= (type n_14@@0) RefType) (=> (and (and (U_2_bool (MapType2Select g n_14@@0)) (not (= n_14@@0 prev_i@1))) (dummyFunction (MapType0Select ExhaleHeap@4 n_14@@0 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.4613:31|
 :skolemid |504|
 :pattern ( (MapType0Select ExhaleHeap@4 n_14@@0 next))
 :pattern ( (MapType1Select QPMask@9 n_14@@0 next))
 :pattern ( (MapType0Select ExhaleHeap@4 n_14@@0 next))
)) (and (=> (= (ControlFlow 0 352) (- 0 354)) (forall ((n_14@@1 T@U) (n_14_1 T@U) ) (!  (=> (and (= (type n_14@@1) RefType) (= (type n_14_1) RefType)) (=> (and (and (and (and (not (= n_14@@1 n_14_1)) (and (U_2_bool (MapType2Select g n_14@@1)) (not (= n_14@@1 prev_i@1)))) (and (U_2_bool (MapType2Select g n_14_1)) (not (= n_14_1 prev_i@1)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_14@@1 n_14_1))))
 :qid |stdinbpl.4620:31|
 :skolemid |505|
 :pattern ( (neverTriggered51 n_14@@1) (neverTriggered51 n_14_1))
))) (=> (forall ((n_14@@2 T@U) (n_14_1@@0 T@U) ) (!  (=> (and (= (type n_14@@2) RefType) (= (type n_14_1@@0) RefType)) (=> (and (and (and (and (not (= n_14@@2 n_14_1@@0)) (and (U_2_bool (MapType2Select g n_14@@2)) (not (= n_14@@2 prev_i@1)))) (and (U_2_bool (MapType2Select g n_14_1@@0)) (not (= n_14_1@@0 prev_i@1)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_14@@2 n_14_1@@0))))
 :qid |stdinbpl.4620:31|
 :skolemid |505|
 :pattern ( (neverTriggered51 n_14@@2) (neverTriggered51 n_14_1@@0))
)) (and (=> (= (ControlFlow 0 352) (- 0 353)) (forall ((n_14@@3 T@U) ) (!  (=> (= (type n_14@@3) RefType) (=> (and (U_2_bool (MapType2Select g n_14@@3)) (not (= n_14@@3 prev_i@1))) (>= (U_2_real (MapType1Select Mask@2 n_14@@3 next)) (/ (to_real 1) (to_real 2)))))
 :qid |stdinbpl.4627:31|
 :skolemid |506|
 :pattern ( (MapType0Select ExhaleHeap@4 n_14@@3 next))
 :pattern ( (MapType1Select QPMask@9 n_14@@3 next))
 :pattern ( (MapType0Select ExhaleHeap@4 n_14@@3 next))
))) (=> (forall ((n_14@@4 T@U) ) (!  (=> (= (type n_14@@4) RefType) (=> (and (U_2_bool (MapType2Select g n_14@@4)) (not (= n_14@@4 prev_i@1))) (>= (U_2_real (MapType1Select Mask@2 n_14@@4 next)) (/ (to_real 1) (to_real 2)))))
 :qid |stdinbpl.4627:31|
 :skolemid |506|
 :pattern ( (MapType0Select ExhaleHeap@4 n_14@@4 next))
 :pattern ( (MapType1Select QPMask@9 n_14@@4 next))
 :pattern ( (MapType0Select ExhaleHeap@4 n_14@@4 next))
)) (=> (and (and (forall ((n_14@@5 T@U) ) (!  (=> (= (type n_14@@5) RefType) (=> (and (and (U_2_bool (MapType2Select g n_14@@5)) (not (= n_14@@5 prev_i@1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (and (qpRange51 n_14@@5) (= (invRecv51 n_14@@5) n_14@@5))))
 :qid |stdinbpl.4633:36|
 :skolemid |507|
 :pattern ( (MapType0Select ExhaleHeap@4 n_14@@5 next))
 :pattern ( (MapType1Select QPMask@9 n_14@@5 next))
 :pattern ( (MapType0Select ExhaleHeap@4 n_14@@5 next))
)) (forall ((o_3@@56 T@U) ) (!  (=> (= (type o_3@@56) RefType) (=> (and (and (U_2_bool (MapType2Select g (invRecv51 o_3@@56))) (not (= (invRecv51 o_3@@56) prev_i@1))) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange51 o_3@@56))) (= (invRecv51 o_3@@56) o_3@@56)))
 :qid |stdinbpl.4637:36|
 :skolemid |508|
 :pattern ( (invRecv51 o_3@@56))
))) (and (forall ((o_3@@57 T@U) ) (!  (=> (= (type o_3@@57) RefType) (and (=> (and (and (U_2_bool (MapType2Select g (invRecv51 o_3@@57))) (not (= (invRecv51 o_3@@57) prev_i@1))) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange51 o_3@@57))) (and (= (invRecv51 o_3@@57) o_3@@57) (= (U_2_real (MapType1Select QPMask@9 o_3@@57 next)) (- (U_2_real (MapType1Select Mask@2 o_3@@57 next)) (/ (to_real 1) (to_real 2)))))) (=> (not (and (and (U_2_bool (MapType2Select g (invRecv51 o_3@@57))) (not (= (invRecv51 o_3@@57) prev_i@1))) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange51 o_3@@57)))) (= (U_2_real (MapType1Select QPMask@9 o_3@@57 next)) (U_2_real (MapType1Select Mask@2 o_3@@57 next))))))
 :qid |stdinbpl.4643:36|
 :skolemid |509|
 :pattern ( (MapType1Select QPMask@9 o_3@@57 next))
)) (forall ((o_3@@58 T@U) (f_5@@18 T@U) ) (! (let ((B@@30 (FieldTypeInv1 (type f_5@@18))))
(let ((A@@31 (FieldTypeInv0 (type f_5@@18))))
 (=> (and (and (= (type o_3@@58) RefType) (= (type f_5@@18) (FieldType A@@31 B@@30))) (not (= f_5@@18 next))) (= (U_2_real (MapType1Select Mask@2 o_3@@58 f_5@@18)) (U_2_real (MapType1Select QPMask@9 o_3@@58 f_5@@18))))))
 :qid |stdinbpl.4649:43|
 :skolemid |510|
 :pattern ( (MapType1Select QPMask@9 o_3@@58 f_5@@18))
)))) (and (and (=> (= (ControlFlow 0 352) 348) anon338_Else_correct) (=> (= (ControlFlow 0 352) 121) anon339_Then_correct)) (=> (= (ControlFlow 0 352) 123) anon339_Else_correct))))))))))))
(let ((anon337_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 358) 352)) anon116_correct)))
(let ((anon337_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 356) (- 0 357)) (<= FullPerm (U_2_real (MapType1Select QPMask@8 prev_i@1 next)))) (=> (<= FullPerm (U_2_real (MapType1Select QPMask@8 prev_i@1 next))) (=> (= (ControlFlow 0 356) 352) anon116_correct))))))
(let ((anon114_correct  (and (=> (= (ControlFlow 0 359) (- 0 361)) (not (U_2_bool (MapType2Select g null)))) (=> (not (U_2_bool (MapType2Select g null))) (and (=> (= (ControlFlow 0 359) (- 0 360)) (U_2_bool (MapType2Select g prev_i@1))) (=> (U_2_bool (MapType2Select g prev_i@1)) (and (=> (= (ControlFlow 0 359) 356) anon337_Then_correct) (=> (= (ControlFlow 0 359) 358) anon337_Else_correct))))))))
(let ((anon336_Else_correct  (=> (and (= node@1 null) (= (ControlFlow 0 364) 359)) anon114_correct)))
(let ((anon336_Then_correct  (=> (not (= node@1 null)) (and (=> (= (ControlFlow 0 362) (- 0 363)) (U_2_bool (MapType2Select g node@1))) (=> (U_2_bool (MapType2Select g node@1)) (=> (= (ControlFlow 0 362) 359) anon114_correct))))))
(let ((anon112_correct  (=> (and (state ExhaleHeap@4 QPMask@8) (state ExhaleHeap@4 QPMask@8)) (and (=> (= (ControlFlow 0 365) (- 0 366)) (U_2_bool (MapType2Select g prev_i@1))) (=> (U_2_bool (MapType2Select g prev_i@1)) (and (=> (= (ControlFlow 0 365) 362) anon336_Then_correct) (=> (= (ControlFlow 0 365) 364) anon336_Else_correct)))))))
(let ((anon335_Else_correct  (=> (and (= (MapType0Select ExhaleHeap@3 prev_i@1 next) null) (= (ControlFlow 0 368) 365)) anon112_correct)))
(let ((anon335_Then_correct  (=> (and (and (not (= (MapType0Select ExhaleHeap@3 prev_i@1 next) null)) (state ExhaleHeap@4 QPMask@8)) (and (forall ((v1_1 T@U) (v2_1 T@U) ) (!  (=> (and (and (= (type v1_1) RefType) (= (type v2_1) RefType)) (not (= v1_1 v2_1))) (= (exists_path ($$ ExhaleHeap@4 g) v1_1 v2_1)  (and (exists_path ($$ ExhaleHeap@3 g) v1_1 v2_1) (not (and (exists_path ($$ ExhaleHeap@3 g) v1_1 prev_i@1) (exists_path ($$ ExhaleHeap@3 g) (MapType0Select ExhaleHeap@3 prev_i@1 next) v2_1))))))
 :qid |stdinbpl.4578:36|
 :skolemid |503|
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| ExhaleHeap@4 g))) g) v1_1 v2_1))
)) (= (ControlFlow 0 367) 365))) anon112_correct)))
(let ((anon334_Else_correct  (=> (= (MapType0Select ExhaleHeap@3 prev_i@1 next) null) (and (=> (= (ControlFlow 0 370) 367) anon335_Then_correct) (=> (= (ControlFlow 0 370) 368) anon335_Else_correct)))))
(let ((anon334_Then_correct  (=> (not (= (MapType0Select ExhaleHeap@3 prev_i@1 next) null)) (=> (and (state ExhaleHeap@4 QPMask@8) (forall ((v1@@2 T@U) (v2@@2 T@U) ) (!  (=> (and (= (type v1@@2) RefType) (= (type v2@@2) RefType)) (= (edge ($$ ExhaleHeap@4 g) v1@@2 v2@@2)  (and (edge ($$ ExhaleHeap@3 g) v1@@2 v2@@2) (not (and (= v1@@2 prev_i@1) (= v2@@2 (MapType0Select ExhaleHeap@3 prev_i@1 next)))))))
 :qid |stdinbpl.4571:36|
 :skolemid |502|
 :pattern ( (edge (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| ExhaleHeap@4 g))) g) v1@@2 v2@@2))
))) (and (=> (= (ControlFlow 0 369) 367) anon335_Then_correct) (=> (= (ControlFlow 0 369) 368) anon335_Else_correct))))))
(let ((anon333_Else_correct  (=> (not (= (MapType0Select ExhaleHeap@3 prev_i@1 next) null)) (and (=> (= (ControlFlow 0 372) 369) anon334_Then_correct) (=> (= (ControlFlow 0 372) 370) anon334_Else_correct)))))
(let ((anon333_Then_correct  (=> (= (MapType0Select ExhaleHeap@3 prev_i@1 next) null) (=> (and (state ExhaleHeap@4 QPMask@8) (|Set#Equal| ($$ ExhaleHeap@4 g) ($$ ExhaleHeap@3 g))) (and (=> (= (ControlFlow 0 371) 369) anon334_Then_correct) (=> (= (ControlFlow 0 371) 370) anon334_Else_correct))))))
(let ((anon331_Else_correct  (=> (forall ((n$0_3_1 T@U) ) (!  (=> (= (type n$0_3_1) RefType) (=> (and (U_2_bool (MapType2Select g n$0_3_1)) (not (= (MapType0Select ExhaleHeap@3 n$0_3_1 next) null))) (U_2_bool (MapType2Select g (MapType0Select ExhaleHeap@3 n$0_3_1 next)))))
 :qid |stdinbpl.4504:34|
 :skolemid |493|
 :pattern ( (MapType2Select g (MapType0Select ExhaleHeap@3 n$0_3_1 next)))
 :pattern ( (MapType2Select g n$0_3_1) (MapType0Select ExhaleHeap@3 n$0_3_1 next))
)) (=> (and (IdenticalOnKnownLocations ExhaleHeap@3 ExhaleHeap@4 QPMask@7) (not (U_2_bool (MapType2Select g null)))) (=> (and (and (U_2_bool (MapType2Select g prev_i@1)) (not (= prev_i@1 null))) (and (= Mask@1 (MapType1Store QPMask@7 prev_i@1 next (real_2_U (+ (U_2_real (MapType1Select QPMask@7 prev_i@1 next)) FullPerm)))) (state ExhaleHeap@4 Mask@1))) (and (=> (= (ControlFlow 0 373) (- 0 375)) (forall ((n$1_2 T@U) (n$1_2_1 T@U) ) (!  (=> (and (= (type n$1_2) RefType) (= (type n$1_2_1) RefType)) (=> (and (and (and (and (not (= n$1_2 n$1_2_1)) (and (U_2_bool (MapType2Select g n$1_2)) (not (= n$1_2 prev_i@1)))) (and (U_2_bool (MapType2Select g n$1_2_1)) (not (= n$1_2_1 prev_i@1)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n$1_2 n$1_2_1))))
 :qid |stdinbpl.4522:29|
 :skolemid |494|
 :no-pattern (type n$1_2)
 :no-pattern (type n$1_2_1)
 :no-pattern (U_2_int n$1_2)
 :no-pattern (U_2_bool n$1_2)
 :no-pattern (U_2_int n$1_2_1)
 :no-pattern (U_2_bool n$1_2_1)
))) (=> (forall ((n$1_2@@0 T@U) (n$1_2_1@@0 T@U) ) (!  (=> (and (= (type n$1_2@@0) RefType) (= (type n$1_2_1@@0) RefType)) (=> (and (and (and (and (not (= n$1_2@@0 n$1_2_1@@0)) (and (U_2_bool (MapType2Select g n$1_2@@0)) (not (= n$1_2@@0 prev_i@1)))) (and (U_2_bool (MapType2Select g n$1_2_1@@0)) (not (= n$1_2_1@@0 prev_i@1)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n$1_2@@0 n$1_2_1@@0))))
 :qid |stdinbpl.4522:29|
 :skolemid |494|
 :no-pattern (type n$1_2@@0)
 :no-pattern (type n$1_2_1@@0)
 :no-pattern (U_2_int n$1_2@@0)
 :no-pattern (U_2_bool n$1_2@@0)
 :no-pattern (U_2_int n$1_2_1@@0)
 :no-pattern (U_2_bool n$1_2_1@@0)
)) (=> (and (forall ((n$1_2@@1 T@U) ) (!  (=> (= (type n$1_2@@1) RefType) (=> (and (and (U_2_bool (MapType2Select g n$1_2@@1)) (not (= n$1_2@@1 prev_i@1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (and (qpRange50 n$1_2@@1) (= (invRecv50 n$1_2@@1) n$1_2@@1))))
 :qid |stdinbpl.4528:36|
 :skolemid |495|
 :pattern ( (MapType0Select ExhaleHeap@4 n$1_2@@1 next))
 :pattern ( (MapType1Select QPMask@8 n$1_2@@1 next))
 :pattern ( (MapType0Select ExhaleHeap@4 n$1_2@@1 next))
)) (forall ((o_3@@59 T@U) ) (!  (=> (= (type o_3@@59) RefType) (=> (and (and (and (U_2_bool (MapType2Select g (invRecv50 o_3@@59))) (not (= (invRecv50 o_3@@59) prev_i@1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange50 o_3@@59)) (= (invRecv50 o_3@@59) o_3@@59)))
 :qid |stdinbpl.4532:36|
 :skolemid |496|
 :pattern ( (invRecv50 o_3@@59))
))) (and (=> (= (ControlFlow 0 373) (- 0 374)) (forall ((n$1_2@@2 T@U) ) (!  (=> (= (type n$1_2@@2) RefType) (=> (and (U_2_bool (MapType2Select g n$1_2@@2)) (not (= n$1_2@@2 prev_i@1))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.4538:29|
 :skolemid |497|
 :pattern ( (MapType0Select ExhaleHeap@4 n$1_2@@2 next))
 :pattern ( (MapType1Select QPMask@8 n$1_2@@2 next))
 :pattern ( (MapType0Select ExhaleHeap@4 n$1_2@@2 next))
))) (=> (forall ((n$1_2@@3 T@U) ) (!  (=> (= (type n$1_2@@3) RefType) (=> (and (U_2_bool (MapType2Select g n$1_2@@3)) (not (= n$1_2@@3 prev_i@1))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.4538:29|
 :skolemid |497|
 :pattern ( (MapType0Select ExhaleHeap@4 n$1_2@@3 next))
 :pattern ( (MapType1Select QPMask@8 n$1_2@@3 next))
 :pattern ( (MapType0Select ExhaleHeap@4 n$1_2@@3 next))
)) (=> (and (forall ((n$1_2@@4 T@U) ) (!  (=> (= (type n$1_2@@4) RefType) (=> (and (and (U_2_bool (MapType2Select g n$1_2@@4)) (not (= n$1_2@@4 prev_i@1))) (> (/ (to_real 1) (to_real 2)) NoPerm)) (not (= n$1_2@@4 null))))
 :qid |stdinbpl.4544:36|
 :skolemid |498|
 :pattern ( (MapType0Select ExhaleHeap@4 n$1_2@@4 next))
 :pattern ( (MapType1Select QPMask@8 n$1_2@@4 next))
 :pattern ( (MapType0Select ExhaleHeap@4 n$1_2@@4 next))
)) (forall ((o_3@@60 T@U) ) (!  (=> (= (type o_3@@60) RefType) (and (=> (and (and (and (U_2_bool (MapType2Select g (invRecv50 o_3@@60))) (not (= (invRecv50 o_3@@60) prev_i@1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange50 o_3@@60)) (and (=> (< NoPerm (/ (to_real 1) (to_real 2))) (= (invRecv50 o_3@@60) o_3@@60)) (= (U_2_real (MapType1Select QPMask@8 o_3@@60 next)) (+ (U_2_real (MapType1Select Mask@1 o_3@@60 next)) (/ (to_real 1) (to_real 2)))))) (=> (not (and (and (and (U_2_bool (MapType2Select g (invRecv50 o_3@@60))) (not (= (invRecv50 o_3@@60) prev_i@1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange50 o_3@@60))) (= (U_2_real (MapType1Select QPMask@8 o_3@@60 next)) (U_2_real (MapType1Select Mask@1 o_3@@60 next))))))
 :qid |stdinbpl.4550:36|
 :skolemid |499|
 :pattern ( (MapType1Select QPMask@8 o_3@@60 next))
))) (=> (and (and (forall ((o_3@@61 T@U) (f_5@@19 T@U) ) (! (let ((B@@31 (FieldTypeInv1 (type f_5@@19))))
(let ((A@@32 (FieldTypeInv0 (type f_5@@19))))
 (=> (and (and (= (type o_3@@61) RefType) (= (type f_5@@19) (FieldType A@@32 B@@31))) (not (= f_5@@19 next))) (= (U_2_real (MapType1Select Mask@1 o_3@@61 f_5@@19)) (U_2_real (MapType1Select QPMask@8 o_3@@61 f_5@@19))))))
 :qid |stdinbpl.4554:43|
 :skolemid |500|
 :pattern ( (MapType1Select Mask@1 o_3@@61 f_5@@19))
 :pattern ( (MapType1Select QPMask@8 o_3@@61 f_5@@19))
)) (state ExhaleHeap@4 QPMask@8)) (and (forall ((n$2_4_1 T@U) ) (!  (=> (= (type n$2_4_1) RefType) (=> (and (U_2_bool (MapType2Select g n$2_4_1)) (not (= (MapType0Select ExhaleHeap@4 n$2_4_1 next) null))) (U_2_bool (MapType2Select g (MapType0Select ExhaleHeap@4 n$2_4_1 next)))))
 :qid |stdinbpl.4560:34|
 :skolemid |501|
 :pattern ( (MapType2Select g (MapType0Select ExhaleHeap@4 n$2_4_1 next)))
 :pattern ( (MapType2Select g n$2_4_1) (MapType0Select ExhaleHeap@4 n$2_4_1 next))
)) (= (MapType0Select ExhaleHeap@4 prev_i@1 next) null))) (and (=> (= (ControlFlow 0 373) 371) anon333_Then_correct) (=> (= (ControlFlow 0 373) 372) anon333_Else_correct))))))))))))))
(let ((anon102_correct  (=> (= Mask@0 (MapType1Store QPMask@5 prev_i@1 next (real_2_U (- (U_2_real (MapType1Select QPMask@5 prev_i@1 next)) FullPerm)))) (and (=> (= (ControlFlow 0 376) (- 0 379)) (forall ((n_13 T@U) ) (!  (=> (= (type n_13) RefType) (=> (and (and (U_2_bool (MapType2Select g n_13)) (not (= n_13 prev_i@1))) (dummyFunction (MapType0Select ExhaleHeap@3 n_13 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.4456:31|
 :skolemid |486|
 :pattern ( (MapType0Select ExhaleHeap@3 n_13 next))
 :pattern ( (MapType1Select QPMask@7 n_13 next))
 :pattern ( (MapType0Select ExhaleHeap@3 n_13 next))
))) (=> (forall ((n_13@@0 T@U) ) (!  (=> (= (type n_13@@0) RefType) (=> (and (and (U_2_bool (MapType2Select g n_13@@0)) (not (= n_13@@0 prev_i@1))) (dummyFunction (MapType0Select ExhaleHeap@3 n_13@@0 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.4456:31|
 :skolemid |486|
 :pattern ( (MapType0Select ExhaleHeap@3 n_13@@0 next))
 :pattern ( (MapType1Select QPMask@7 n_13@@0 next))
 :pattern ( (MapType0Select ExhaleHeap@3 n_13@@0 next))
)) (and (=> (= (ControlFlow 0 376) (- 0 378)) (forall ((n_13@@1 T@U) (n_13_1 T@U) ) (!  (=> (and (= (type n_13@@1) RefType) (= (type n_13_1) RefType)) (=> (and (and (and (and (not (= n_13@@1 n_13_1)) (and (U_2_bool (MapType2Select g n_13@@1)) (not (= n_13@@1 prev_i@1)))) (and (U_2_bool (MapType2Select g n_13_1)) (not (= n_13_1 prev_i@1)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_13@@1 n_13_1))))
 :qid |stdinbpl.4463:31|
 :skolemid |487|
 :pattern ( (neverTriggered49 n_13@@1) (neverTriggered49 n_13_1))
))) (=> (forall ((n_13@@2 T@U) (n_13_1@@0 T@U) ) (!  (=> (and (= (type n_13@@2) RefType) (= (type n_13_1@@0) RefType)) (=> (and (and (and (and (not (= n_13@@2 n_13_1@@0)) (and (U_2_bool (MapType2Select g n_13@@2)) (not (= n_13@@2 prev_i@1)))) (and (U_2_bool (MapType2Select g n_13_1@@0)) (not (= n_13_1@@0 prev_i@1)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_13@@2 n_13_1@@0))))
 :qid |stdinbpl.4463:31|
 :skolemid |487|
 :pattern ( (neverTriggered49 n_13@@2) (neverTriggered49 n_13_1@@0))
)) (and (=> (= (ControlFlow 0 376) (- 0 377)) (forall ((n_13@@3 T@U) ) (!  (=> (= (type n_13@@3) RefType) (=> (and (U_2_bool (MapType2Select g n_13@@3)) (not (= n_13@@3 prev_i@1))) (>= (U_2_real (MapType1Select Mask@0 n_13@@3 next)) (/ (to_real 1) (to_real 2)))))
 :qid |stdinbpl.4470:31|
 :skolemid |488|
 :pattern ( (MapType0Select ExhaleHeap@3 n_13@@3 next))
 :pattern ( (MapType1Select QPMask@7 n_13@@3 next))
 :pattern ( (MapType0Select ExhaleHeap@3 n_13@@3 next))
))) (=> (forall ((n_13@@4 T@U) ) (!  (=> (= (type n_13@@4) RefType) (=> (and (U_2_bool (MapType2Select g n_13@@4)) (not (= n_13@@4 prev_i@1))) (>= (U_2_real (MapType1Select Mask@0 n_13@@4 next)) (/ (to_real 1) (to_real 2)))))
 :qid |stdinbpl.4470:31|
 :skolemid |488|
 :pattern ( (MapType0Select ExhaleHeap@3 n_13@@4 next))
 :pattern ( (MapType1Select QPMask@7 n_13@@4 next))
 :pattern ( (MapType0Select ExhaleHeap@3 n_13@@4 next))
)) (=> (and (and (forall ((n_13@@5 T@U) ) (!  (=> (= (type n_13@@5) RefType) (=> (and (and (U_2_bool (MapType2Select g n_13@@5)) (not (= n_13@@5 prev_i@1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (and (qpRange49 n_13@@5) (= (invRecv49 n_13@@5) n_13@@5))))
 :qid |stdinbpl.4476:36|
 :skolemid |489|
 :pattern ( (MapType0Select ExhaleHeap@3 n_13@@5 next))
 :pattern ( (MapType1Select QPMask@7 n_13@@5 next))
 :pattern ( (MapType0Select ExhaleHeap@3 n_13@@5 next))
)) (forall ((o_3@@62 T@U) ) (!  (=> (= (type o_3@@62) RefType) (=> (and (and (U_2_bool (MapType2Select g (invRecv49 o_3@@62))) (not (= (invRecv49 o_3@@62) prev_i@1))) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange49 o_3@@62))) (= (invRecv49 o_3@@62) o_3@@62)))
 :qid |stdinbpl.4480:36|
 :skolemid |490|
 :pattern ( (invRecv49 o_3@@62))
))) (and (forall ((o_3@@63 T@U) ) (!  (=> (= (type o_3@@63) RefType) (and (=> (and (and (U_2_bool (MapType2Select g (invRecv49 o_3@@63))) (not (= (invRecv49 o_3@@63) prev_i@1))) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange49 o_3@@63))) (and (= (invRecv49 o_3@@63) o_3@@63) (= (U_2_real (MapType1Select QPMask@7 o_3@@63 next)) (- (U_2_real (MapType1Select Mask@0 o_3@@63 next)) (/ (to_real 1) (to_real 2)))))) (=> (not (and (and (U_2_bool (MapType2Select g (invRecv49 o_3@@63))) (not (= (invRecv49 o_3@@63) prev_i@1))) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange49 o_3@@63)))) (= (U_2_real (MapType1Select QPMask@7 o_3@@63 next)) (U_2_real (MapType1Select Mask@0 o_3@@63 next))))))
 :qid |stdinbpl.4486:36|
 :skolemid |491|
 :pattern ( (MapType1Select QPMask@7 o_3@@63 next))
)) (forall ((o_3@@64 T@U) (f_5@@20 T@U) ) (! (let ((B@@32 (FieldTypeInv1 (type f_5@@20))))
(let ((A@@33 (FieldTypeInv0 (type f_5@@20))))
 (=> (and (and (= (type o_3@@64) RefType) (= (type f_5@@20) (FieldType A@@33 B@@32))) (not (= f_5@@20 next))) (= (U_2_real (MapType1Select Mask@0 o_3@@64 f_5@@20)) (U_2_real (MapType1Select QPMask@7 o_3@@64 f_5@@20))))))
 :qid |stdinbpl.4492:43|
 :skolemid |492|
 :pattern ( (MapType1Select QPMask@7 o_3@@64 f_5@@20))
)))) (and (and (=> (= (ControlFlow 0 376) 373) anon331_Else_correct) (=> (= (ControlFlow 0 376) 117) anon332_Then_correct)) (=> (= (ControlFlow 0 376) 119) anon332_Else_correct))))))))))))
(let ((anon330_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 382) 376)) anon102_correct)))
(let ((anon330_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 380) (- 0 381)) (<= FullPerm (U_2_real (MapType1Select QPMask@5 prev_i@1 next)))) (=> (<= FullPerm (U_2_real (MapType1Select QPMask@5 prev_i@1 next))) (=> (= (ControlFlow 0 380) 376) anon102_correct))))))
(let ((anon329_Then_correct  (=> (and (= count@0 j) (U_2_bool (MapType0Select ExhaleHeap@3 node_j $allocated))) (=> (and (and (U_2_bool (MapType0Select ExhaleHeap@3 prev_j $allocated)) (U_2_bool (MapType0Select ExhaleHeap@3 vexit $allocated))) (and (state ExhaleHeap@3 QPMask@5) (state ExhaleHeap@3 QPMask@5))) (and (=> (= (ControlFlow 0 383) (- 0 387)) (HasDirectPerm QPMask@5 node@1 next)) (=> (HasDirectPerm QPMask@5 node@1 next) (=> (and (= vexit@0 (MapType0Select ExhaleHeap@3 node@1 next)) (state ExhaleHeap@3 QPMask@5)) (and (=> (= (ControlFlow 0 383) (- 0 386)) (U_2_bool (MapType2Select g prev_i@1))) (=> (U_2_bool (MapType2Select g prev_i@1)) (and (=> (= (ControlFlow 0 383) (- 0 385)) (not (U_2_bool (MapType2Select g null)))) (=> (not (U_2_bool (MapType2Select g null))) (and (=> (= (ControlFlow 0 383) (- 0 384)) (U_2_bool (MapType2Select g prev_i@1))) (=> (U_2_bool (MapType2Select g prev_i@1)) (and (=> (= (ControlFlow 0 383) 380) anon330_Then_correct) (=> (= (ControlFlow 0 383) 382) anon330_Else_correct)))))))))))))))
(let ((anon329_Else_correct  (=> (and (and (not (= count@0 j)) (= Heap@1 ExhaleHeap@3)) (and (= Mask@21 QPMask@5) (= (ControlFlow 0 115) 113))) anon234_correct)))
(let ((anon99_correct  (=> (state ExhaleHeap@3 QPMask@5) (and (=> (= (ControlFlow 0 388) 383) anon329_Then_correct) (=> (= (ControlFlow 0 388) 115) anon329_Else_correct)))))
(let ((anon328_Else_correct  (=> (and (and (not (= count@0 i)) (= prev_i@1 prev_i@0)) (and (= node_i@1 node_i@0) (= (ControlFlow 0 390) 388))) anon99_correct)))
(let ((anon328_Then_correct  (=> (and (= count@0 i) (state ExhaleHeap@3 QPMask@5)) (=> (and (and (state ExhaleHeap@3 QPMask@5) (= prev_i@1 prev_node@0)) (and (= node_i@1 node@1) (= (ControlFlow 0 389) 388))) anon99_correct))))
(let ((anon97_correct  (=> (state ExhaleHeap@3 QPMask@5) (=> (and (and (not (= node@1 null)) (<= count@0 j)) (state ExhaleHeap@3 QPMask@5)) (and (=> (= (ControlFlow 0 391) 389) anon328_Then_correct) (=> (= (ControlFlow 0 391) 390) anon328_Else_correct))))))
(let ((anon327_Else_correct  (=> (and (= node@1 null) (= (ControlFlow 0 393) 391)) anon97_correct)))
(let ((anon327_Then_correct  (=> (and (and (not (= node@1 null)) (state ExhaleHeap@3 QPMask@5)) (and (exists_path ($$ ExhaleHeap@3 g) prev_node@0 node@1) (= (ControlFlow 0 392) 391))) anon97_correct)))
(let ((anon326_Else_correct  (=> (= node_i@0 null) (and (=> (= (ControlFlow 0 395) 392) anon327_Then_correct) (=> (= (ControlFlow 0 395) 393) anon327_Else_correct)))))
(let ((anon326_Then_correct  (=> (not (= node_i@0 null)) (=> (and (state ExhaleHeap@3 QPMask@5) (exists_path ($$ ExhaleHeap@3 g) node_i@0 prev_node@0)) (and (=> (= (ControlFlow 0 394) 392) anon327_Then_correct) (=> (= (ControlFlow 0 394) 393) anon327_Else_correct))))))
(let ((anon325_Else_correct  (=> (= node_i@0 null) (and (=> (= (ControlFlow 0 397) 394) anon326_Then_correct) (=> (= (ControlFlow 0 397) 395) anon326_Else_correct)))))
(let ((anon325_Then_correct  (=> (not (= node_i@0 null)) (=> (and (state ExhaleHeap@3 QPMask@5) (exists_path ($$ ExhaleHeap@3 g) prev_i@0 node_i@0)) (and (=> (= (ControlFlow 0 396) 394) anon326_Then_correct) (=> (= (ControlFlow 0 396) 395) anon326_Else_correct))))))
(let ((anon91_correct  (=> (and (and (and (state ExhaleHeap@3 QPMask@5) (acyclic_graph ($$ ExhaleHeap@3 g))) (and (state ExhaleHeap@3 QPMask@5) (func_graph ($$ ExhaleHeap@3 g)))) (and (and (state ExhaleHeap@3 QPMask@5) (unshared_graph ($$ ExhaleHeap@3 g))) (and (state ExhaleHeap@3 QPMask@5) (forall ((n$4_4 T@U) ) (!  (=> (and (= (type n$4_4) RefType) (U_2_bool (MapType2Select g n$4_4))) (exists_path ($$ ExhaleHeap@3 g) x_1@@0 n$4_4))
 :qid |stdinbpl.4373:24|
 :skolemid |485|
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| ExhaleHeap@3 g))) g) x_1@@0 n$4_4))
))))) (and (=> (= (ControlFlow 0 398) 396) anon325_Then_correct) (=> (= (ControlFlow 0 398) 397) anon325_Else_correct)))))
(let ((anon324_Else_correct  (=> (and (< j count@0) (= (ControlFlow 0 400) 398)) anon91_correct)))
(let ((anon324_Then_correct  (=> (<= count@0 j) (=> (and (= (MapType0Select ExhaleHeap@3 prev_node@0 next) node@1) (= (ControlFlow 0 399) 398)) anon91_correct))))
(let ((anon323_Else_correct  (=> (<= count@0 i) (and (=> (= (ControlFlow 0 402) 399) anon324_Then_correct) (=> (= (ControlFlow 0 402) 400) anon324_Else_correct)))))
(let ((anon323_Then_correct  (=> (< i count@0) (=> (and (U_2_bool (MapType2Select g node_i@0)) (U_2_bool (MapType2Select g prev_i@0))) (and (=> (= (ControlFlow 0 401) 399) anon324_Then_correct) (=> (= (ControlFlow 0 401) 400) anon324_Else_correct))))))
(let ((anon322_Else_correct  (=> (< j count@0) (and (=> (= (ControlFlow 0 404) 401) anon323_Then_correct) (=> (= (ControlFlow 0 404) 402) anon323_Else_correct)))))
(let ((anon322_Then_correct  (=> (and (<= count@0 j) (U_2_bool (MapType2Select g prev_node@0))) (and (=> (= (ControlFlow 0 403) 401) anon323_Then_correct) (=> (= (ControlFlow 0 403) 402) anon323_Else_correct)))))
(let ((anon321_Else_correct  (=> (= node@1 null) (and (=> (= (ControlFlow 0 406) 403) anon322_Then_correct) (=> (= (ControlFlow 0 406) 404) anon322_Else_correct)))))
(let ((anon321_Then_correct  (=> (and (not (= node@1 null)) (U_2_bool (MapType2Select g node@1))) (and (=> (= (ControlFlow 0 405) 403) anon322_Then_correct) (=> (= (ControlFlow 0 405) 404) anon322_Else_correct)))))
(let ((anon320_Then_correct  (=> (and (state ExhaleHeap@3 ZeroMask) (<= 0 i)) (=> (and (and (< i j) (<= 0 count@0)) (and (U_2_bool (MapType2Select g x_1@@0)) (not (U_2_bool (MapType2Select g null))))) (and (=> (= (ControlFlow 0 407) (- 0 408)) (forall ((n$2_3 T@U) (n$2_3_2 T@U) ) (!  (=> (and (= (type n$2_3) RefType) (= (type n$2_3_2) RefType)) (=> (and (and (and (and (not (= n$2_3 n$2_3_2)) (U_2_bool (MapType2Select g n$2_3))) (U_2_bool (MapType2Select g n$2_3_2))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$2_3 n$2_3_2))))
 :qid |stdinbpl.4317:19|
 :skolemid |478|
 :no-pattern (type n$2_3)
 :no-pattern (type n$2_3_2)
 :no-pattern (U_2_int n$2_3)
 :no-pattern (U_2_bool n$2_3)
 :no-pattern (U_2_int n$2_3_2)
 :no-pattern (U_2_bool n$2_3_2)
))) (=> (forall ((n$2_3@@0 T@U) (n$2_3_2@@0 T@U) ) (!  (=> (and (= (type n$2_3@@0) RefType) (= (type n$2_3_2@@0) RefType)) (=> (and (and (and (and (not (= n$2_3@@0 n$2_3_2@@0)) (U_2_bool (MapType2Select g n$2_3@@0))) (U_2_bool (MapType2Select g n$2_3_2@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$2_3@@0 n$2_3_2@@0))))
 :qid |stdinbpl.4317:19|
 :skolemid |478|
 :no-pattern (type n$2_3@@0)
 :no-pattern (type n$2_3_2@@0)
 :no-pattern (U_2_int n$2_3@@0)
 :no-pattern (U_2_bool n$2_3@@0)
 :no-pattern (U_2_int n$2_3_2@@0)
 :no-pattern (U_2_bool n$2_3_2@@0)
)) (=> (forall ((n$2_3@@1 T@U) ) (!  (=> (= (type n$2_3@@1) RefType) (=> (and (U_2_bool (MapType2Select g n$2_3@@1)) (< NoPerm FullPerm)) (and (qpRange48 n$2_3@@1) (= (invRecv48 n$2_3@@1) n$2_3@@1))))
 :qid |stdinbpl.4323:26|
 :skolemid |479|
 :pattern ( (MapType0Select ExhaleHeap@3 n$2_3@@1 next))
 :pattern ( (MapType1Select QPMask@5 n$2_3@@1 next))
 :pattern ( (MapType0Select ExhaleHeap@3 n$2_3@@1 next))
)) (=> (and (forall ((o_3@@65 T@U) ) (!  (=> (= (type o_3@@65) RefType) (=> (and (and (U_2_bool (MapType2Select g (invRecv48 o_3@@65))) (< NoPerm FullPerm)) (qpRange48 o_3@@65)) (= (invRecv48 o_3@@65) o_3@@65)))
 :qid |stdinbpl.4327:26|
 :skolemid |480|
 :pattern ( (invRecv48 o_3@@65))
)) (forall ((n$2_3@@2 T@U) ) (!  (=> (and (= (type n$2_3@@2) RefType) (U_2_bool (MapType2Select g n$2_3@@2))) (not (= n$2_3@@2 null)))
 :qid |stdinbpl.4333:26|
 :skolemid |481|
 :pattern ( (MapType0Select ExhaleHeap@3 n$2_3@@2 next))
 :pattern ( (MapType1Select QPMask@5 n$2_3@@2 next))
 :pattern ( (MapType0Select ExhaleHeap@3 n$2_3@@2 next))
))) (=> (and (and (forall ((o_3@@66 T@U) ) (!  (=> (= (type o_3@@66) RefType) (and (=> (and (and (U_2_bool (MapType2Select g (invRecv48 o_3@@66))) (< NoPerm FullPerm)) (qpRange48 o_3@@66)) (and (=> (< NoPerm FullPerm) (= (invRecv48 o_3@@66) o_3@@66)) (= (U_2_real (MapType1Select QPMask@5 o_3@@66 next)) (+ (U_2_real (MapType1Select ZeroMask o_3@@66 next)) FullPerm)))) (=> (not (and (and (U_2_bool (MapType2Select g (invRecv48 o_3@@66))) (< NoPerm FullPerm)) (qpRange48 o_3@@66))) (= (U_2_real (MapType1Select QPMask@5 o_3@@66 next)) (U_2_real (MapType1Select ZeroMask o_3@@66 next))))))
 :qid |stdinbpl.4339:26|
 :skolemid |482|
 :pattern ( (MapType1Select QPMask@5 o_3@@66 next))
)) (forall ((o_3@@67 T@U) (f_5@@21 T@U) ) (! (let ((B@@33 (FieldTypeInv1 (type f_5@@21))))
(let ((A@@34 (FieldTypeInv0 (type f_5@@21))))
 (=> (and (and (= (type o_3@@67) RefType) (= (type f_5@@21) (FieldType A@@34 B@@33))) (not (= f_5@@21 next))) (= (U_2_real (MapType1Select ZeroMask o_3@@67 f_5@@21)) (U_2_real (MapType1Select QPMask@5 o_3@@67 f_5@@21))))))
 :qid |stdinbpl.4343:33|
 :skolemid |483|
 :pattern ( (MapType1Select ZeroMask o_3@@67 f_5@@21))
 :pattern ( (MapType1Select QPMask@5 o_3@@67 f_5@@21))
))) (and (state ExhaleHeap@3 QPMask@5) (forall ((n$3_4 T@U) ) (!  (=> (= (type n$3_4) RefType) (=> (and (U_2_bool (MapType2Select g n$3_4)) (not (= (MapType0Select ExhaleHeap@3 n$3_4 next) null))) (U_2_bool (MapType2Select g (MapType0Select ExhaleHeap@3 n$3_4 next)))))
 :qid |stdinbpl.4349:24|
 :skolemid |484|
 :pattern ( (MapType2Select g (MapType0Select ExhaleHeap@3 n$3_4 next)))
 :pattern ( (MapType2Select g n$3_4) (MapType0Select ExhaleHeap@3 n$3_4 next))
)))) (and (=> (= (ControlFlow 0 407) 405) anon321_Then_correct) (=> (= (ControlFlow 0 407) 406) anon321_Else_correct)))))))))))
(let ((anon277_correct true))
(let ((anon416_Else_correct  (=> (and (= node@1 null) (= (ControlFlow 0 38) 36)) anon277_correct)))
(let ((anon416_Then_correct  (=> (and (and (not (= node@1 null)) (state ExhaleHeap@3 QPMask@6)) (and (exists_path ($$ ExhaleHeap@3 g) prev_node@0 node@1) (= (ControlFlow 0 37) 36))) anon277_correct)))
(let ((anon415_Else_correct  (=> (= node_i@0 null) (and (=> (= (ControlFlow 0 40) 37) anon416_Then_correct) (=> (= (ControlFlow 0 40) 38) anon416_Else_correct)))))
(let ((anon415_Then_correct  (=> (not (= node_i@0 null)) (=> (and (state ExhaleHeap@3 QPMask@6) (exists_path ($$ ExhaleHeap@3 g) node_i@0 prev_node@0)) (and (=> (= (ControlFlow 0 39) 37) anon416_Then_correct) (=> (= (ControlFlow 0 39) 38) anon416_Else_correct))))))
(let ((anon414_Else_correct  (=> (= node_i@0 null) (and (=> (= (ControlFlow 0 42) 39) anon415_Then_correct) (=> (= (ControlFlow 0 42) 40) anon415_Else_correct)))))
(let ((anon414_Then_correct  (=> (not (= node_i@0 null)) (=> (and (state ExhaleHeap@3 QPMask@6) (exists_path ($$ ExhaleHeap@3 g) prev_i@0 node_i@0)) (and (=> (= (ControlFlow 0 41) 39) anon415_Then_correct) (=> (= (ControlFlow 0 41) 40) anon415_Else_correct))))))
(let ((anon271_correct  (=> (and (and (and (state ExhaleHeap@3 QPMask@6) (acyclic_graph ($$ ExhaleHeap@3 g))) (and (state ExhaleHeap@3 QPMask@6) (func_graph ($$ ExhaleHeap@3 g)))) (and (and (state ExhaleHeap@3 QPMask@6) (unshared_graph ($$ ExhaleHeap@3 g))) (and (state ExhaleHeap@3 QPMask@6) (forall ((n$4_7 T@U) ) (!  (=> (and (= (type n$4_7) RefType) (U_2_bool (MapType2Select g n$4_7))) (exists_path ($$ ExhaleHeap@3 g) x_1@@0 n$4_7))
 :qid |stdinbpl.6339:22|
 :skolemid |695|
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| ExhaleHeap@3 g))) g) x_1@@0 n$4_7))
))))) (and (=> (= (ControlFlow 0 43) 41) anon414_Then_correct) (=> (= (ControlFlow 0 43) 42) anon414_Else_correct)))))
(let ((anon413_Else_correct  (=> (and (< j count@0) (= (ControlFlow 0 45) 43)) anon271_correct)))
(let ((anon413_Then_correct  (=> (<= count@0 j) (=> (and (= (MapType0Select ExhaleHeap@3 prev_node@0 next) node@1) (= (ControlFlow 0 44) 43)) anon271_correct))))
(let ((anon412_Else_correct  (=> (<= count@0 i) (and (=> (= (ControlFlow 0 47) 44) anon413_Then_correct) (=> (= (ControlFlow 0 47) 45) anon413_Else_correct)))))
(let ((anon412_Then_correct  (=> (< i count@0) (=> (and (U_2_bool (MapType2Select g node_i@0)) (U_2_bool (MapType2Select g prev_i@0))) (and (=> (= (ControlFlow 0 46) 44) anon413_Then_correct) (=> (= (ControlFlow 0 46) 45) anon413_Else_correct))))))
(let ((anon411_Else_correct  (=> (< j count@0) (and (=> (= (ControlFlow 0 49) 46) anon412_Then_correct) (=> (= (ControlFlow 0 49) 47) anon412_Else_correct)))))
(let ((anon411_Then_correct  (=> (and (<= count@0 j) (U_2_bool (MapType2Select g prev_node@0))) (and (=> (= (ControlFlow 0 48) 46) anon412_Then_correct) (=> (= (ControlFlow 0 48) 47) anon412_Else_correct)))))
(let ((anon410_Else_correct  (=> (= node@1 null) (and (=> (= (ControlFlow 0 51) 48) anon411_Then_correct) (=> (= (ControlFlow 0 51) 49) anon411_Else_correct)))))
(let ((anon410_Then_correct  (=> (and (not (= node@1 null)) (U_2_bool (MapType2Select g node@1))) (and (=> (= (ControlFlow 0 50) 48) anon411_Then_correct) (=> (= (ControlFlow 0 50) 49) anon411_Else_correct)))))
(let ((anon320_Else_correct  (=> (not (and (not (= node@1 null)) (<= count@0 j))) (=> (and (state ExhaleHeap@3 QPMask@4) (<= 0 i)) (=> (and (and (< i j) (<= 0 count@0)) (and (U_2_bool (MapType2Select g x_1@@0)) (not (U_2_bool (MapType2Select g null))))) (and (=> (= (ControlFlow 0 52) (- 0 53)) (forall ((n$2_15 T@U) (n$2_15_1 T@U) ) (!  (=> (and (= (type n$2_15) RefType) (= (type n$2_15_1) RefType)) (=> (and (and (and (and (not (= n$2_15 n$2_15_1)) (U_2_bool (MapType2Select g n$2_15))) (U_2_bool (MapType2Select g n$2_15_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$2_15 n$2_15_1))))
 :qid |stdinbpl.6283:17|
 :skolemid |688|
 :no-pattern (type n$2_15)
 :no-pattern (type n$2_15_1)
 :no-pattern (U_2_int n$2_15)
 :no-pattern (U_2_bool n$2_15)
 :no-pattern (U_2_int n$2_15_1)
 :no-pattern (U_2_bool n$2_15_1)
))) (=> (forall ((n$2_15@@0 T@U) (n$2_15_1@@0 T@U) ) (!  (=> (and (= (type n$2_15@@0) RefType) (= (type n$2_15_1@@0) RefType)) (=> (and (and (and (and (not (= n$2_15@@0 n$2_15_1@@0)) (U_2_bool (MapType2Select g n$2_15@@0))) (U_2_bool (MapType2Select g n$2_15_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$2_15@@0 n$2_15_1@@0))))
 :qid |stdinbpl.6283:17|
 :skolemid |688|
 :no-pattern (type n$2_15@@0)
 :no-pattern (type n$2_15_1@@0)
 :no-pattern (U_2_int n$2_15@@0)
 :no-pattern (U_2_bool n$2_15@@0)
 :no-pattern (U_2_int n$2_15_1@@0)
 :no-pattern (U_2_bool n$2_15_1@@0)
)) (=> (forall ((n$2_15@@1 T@U) ) (!  (=> (= (type n$2_15@@1) RefType) (=> (and (U_2_bool (MapType2Select g n$2_15@@1)) (< NoPerm FullPerm)) (and (qpRange72 n$2_15@@1) (= (invRecv72 n$2_15@@1) n$2_15@@1))))
 :qid |stdinbpl.6289:24|
 :skolemid |689|
 :pattern ( (MapType0Select ExhaleHeap@3 n$2_15@@1 next))
 :pattern ( (MapType1Select QPMask@6 n$2_15@@1 next))
 :pattern ( (MapType0Select ExhaleHeap@3 n$2_15@@1 next))
)) (=> (and (forall ((o_3@@68 T@U) ) (!  (=> (= (type o_3@@68) RefType) (=> (and (and (U_2_bool (MapType2Select g (invRecv72 o_3@@68))) (< NoPerm FullPerm)) (qpRange72 o_3@@68)) (= (invRecv72 o_3@@68) o_3@@68)))
 :qid |stdinbpl.6293:24|
 :skolemid |690|
 :pattern ( (invRecv72 o_3@@68))
)) (forall ((n$2_15@@2 T@U) ) (!  (=> (and (= (type n$2_15@@2) RefType) (U_2_bool (MapType2Select g n$2_15@@2))) (not (= n$2_15@@2 null)))
 :qid |stdinbpl.6299:24|
 :skolemid |691|
 :pattern ( (MapType0Select ExhaleHeap@3 n$2_15@@2 next))
 :pattern ( (MapType1Select QPMask@6 n$2_15@@2 next))
 :pattern ( (MapType0Select ExhaleHeap@3 n$2_15@@2 next))
))) (=> (and (and (forall ((o_3@@69 T@U) ) (!  (=> (= (type o_3@@69) RefType) (and (=> (and (and (U_2_bool (MapType2Select g (invRecv72 o_3@@69))) (< NoPerm FullPerm)) (qpRange72 o_3@@69)) (and (=> (< NoPerm FullPerm) (= (invRecv72 o_3@@69) o_3@@69)) (= (U_2_real (MapType1Select QPMask@6 o_3@@69 next)) (+ (U_2_real (MapType1Select QPMask@4 o_3@@69 next)) FullPerm)))) (=> (not (and (and (U_2_bool (MapType2Select g (invRecv72 o_3@@69))) (< NoPerm FullPerm)) (qpRange72 o_3@@69))) (= (U_2_real (MapType1Select QPMask@6 o_3@@69 next)) (U_2_real (MapType1Select QPMask@4 o_3@@69 next))))))
 :qid |stdinbpl.6305:24|
 :skolemid |692|
 :pattern ( (MapType1Select QPMask@6 o_3@@69 next))
)) (forall ((o_3@@70 T@U) (f_5@@22 T@U) ) (! (let ((B@@34 (FieldTypeInv1 (type f_5@@22))))
(let ((A@@35 (FieldTypeInv0 (type f_5@@22))))
 (=> (and (and (= (type o_3@@70) RefType) (= (type f_5@@22) (FieldType A@@35 B@@34))) (not (= f_5@@22 next))) (= (U_2_real (MapType1Select QPMask@4 o_3@@70 f_5@@22)) (U_2_real (MapType1Select QPMask@6 o_3@@70 f_5@@22))))))
 :qid |stdinbpl.6309:31|
 :skolemid |693|
 :pattern ( (MapType1Select QPMask@4 o_3@@70 f_5@@22))
 :pattern ( (MapType1Select QPMask@6 o_3@@70 f_5@@22))
))) (and (state ExhaleHeap@3 QPMask@6) (forall ((n$3_7 T@U) ) (!  (=> (= (type n$3_7) RefType) (=> (and (U_2_bool (MapType2Select g n$3_7)) (not (= (MapType0Select ExhaleHeap@3 n$3_7 next) null))) (U_2_bool (MapType2Select g (MapType0Select ExhaleHeap@3 n$3_7 next)))))
 :qid |stdinbpl.6315:22|
 :skolemid |694|
 :pattern ( (MapType2Select g (MapType0Select ExhaleHeap@3 n$3_7 next)))
 :pattern ( (MapType2Select g n$3_7) (MapType0Select ExhaleHeap@3 n$3_7 next))
)))) (and (=> (= (ControlFlow 0 52) 50) anon410_Then_correct) (=> (= (ControlFlow 0 52) 51) anon410_Else_correct))))))))))))
(let ((anon41_correct  (=> (IdenticalOnKnownLocations Heap@@23 ExhaleHeap@3 QPMask@4) (=> (and (and (U_2_bool (MapType0Select ExhaleHeap@3 node@1 $allocated)) (U_2_bool (MapType0Select ExhaleHeap@3 prev_node@0 $allocated))) (and (U_2_bool (MapType0Select ExhaleHeap@3 prev_i@0 $allocated)) (U_2_bool (MapType0Select ExhaleHeap@3 node_i@0 $allocated)))) (and (and (=> (= (ControlFlow 0 481) 480) anon299_Then_correct) (=> (= (ControlFlow 0 481) 407) anon320_Then_correct)) (=> (= (ControlFlow 0 481) 52) anon320_Else_correct))))))
(let ((anon298_Else_correct  (=> (and (= node@0 null) (= (ControlFlow 0 484) 481)) anon41_correct)))
(let ((anon298_Then_correct  (=> (not (= node@0 null)) (and (=> (= (ControlFlow 0 482) (- 0 483)) (exists_path ($$ Heap@@23 g) x_1@@0 node@0)) (=> (exists_path ($$ Heap@@23 g) x_1@@0 node@0) (=> (= (ControlFlow 0 482) 481) anon41_correct))))))
(let ((anon297_Else_correct  (=> (= null null) (and (=> (= (ControlFlow 0 487) 482) anon298_Then_correct) (=> (= (ControlFlow 0 487) 484) anon298_Else_correct)))))
(let ((anon297_Then_correct  (=> (not (= null null)) (and (=> (= (ControlFlow 0 485) (- 0 486)) (exists_path ($$ Heap@@23 g) null x_1@@0)) (=> (exists_path ($$ Heap@@23 g) null x_1@@0) (and (=> (= (ControlFlow 0 485) 482) anon298_Then_correct) (=> (= (ControlFlow 0 485) 484) anon298_Else_correct)))))))
(let ((anon296_Else_correct  (=> (= null null) (and (=> (= (ControlFlow 0 490) 485) anon297_Then_correct) (=> (= (ControlFlow 0 490) 487) anon297_Else_correct)))))
(let ((anon296_Then_correct  (=> (not (= null null)) (and (=> (= (ControlFlow 0 488) (- 0 489)) (exists_path ($$ Heap@@23 g) null null)) (=> (exists_path ($$ Heap@@23 g) null null) (and (=> (= (ControlFlow 0 488) 485) anon297_Then_correct) (=> (= (ControlFlow 0 488) 487) anon297_Else_correct)))))))
(let ((anon294_Else_correct  (=> (forall ((n$4_1_1 T@U) ) (!  (=> (and (= (type n$4_1_1) RefType) (U_2_bool (MapType2Select g n$4_1_1))) (exists_path ($$ Heap@@23 g) x_1@@0 n$4_1_1))
 :qid |stdinbpl.3744:24|
 :skolemid |420|
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| Heap@@23 g))) g) x_1@@0 n$4_1_1))
)) (and (=> (= (ControlFlow 0 491) 488) anon296_Then_correct) (=> (= (ControlFlow 0 491) 490) anon296_Else_correct)))))
(let ((anon34_correct true))
(let ((anon295_Else_correct  (=> (and (not (U_2_bool (MapType2Select g n$4))) (= (ControlFlow 0 35) 32)) anon34_correct)))
(let ((anon295_Then_correct  (=> (U_2_bool (MapType2Select g n$4)) (and (=> (= (ControlFlow 0 33) (- 0 34)) (exists_path ($$ Heap@@23 g) x_1@@0 n$4)) (=> (exists_path ($$ Heap@@23 g) x_1@@0 n$4) (=> (= (ControlFlow 0 33) 32) anon34_correct))))))
(let ((anon31_correct  (and (=> (= (ControlFlow 0 492) (- 0 495)) (acyclic_graph ($$ Heap@@23 g))) (=> (acyclic_graph ($$ Heap@@23 g)) (and (=> (= (ControlFlow 0 492) (- 0 494)) (func_graph ($$ Heap@@23 g))) (=> (func_graph ($$ Heap@@23 g)) (and (=> (= (ControlFlow 0 492) (- 0 493)) (unshared_graph ($$ Heap@@23 g))) (=> (unshared_graph ($$ Heap@@23 g)) (and (and (=> (= (ControlFlow 0 492) 491) anon294_Else_correct) (=> (= (ControlFlow 0 492) 33) anon295_Then_correct)) (=> (= (ControlFlow 0 492) 35) anon295_Else_correct))))))))))
(let ((anon293_Else_correct  (=> (and (< j 0) (= (ControlFlow 0 498) 492)) anon31_correct)))
(let ((anon293_Then_correct  (=> (<= 0 j) (and (=> (= (ControlFlow 0 496) (- 0 497)) (= (MapType0Select Heap@@23 x_1@@0 next) node@0)) (=> (= (MapType0Select Heap@@23 x_1@@0 next) node@0) (=> (= (ControlFlow 0 496) 492) anon31_correct))))))
(let ((anon292_Else_correct  (=> (<= 0 i) (and (=> (= (ControlFlow 0 502) 496) anon293_Then_correct) (=> (= (ControlFlow 0 502) 498) anon293_Else_correct)))))
(let ((anon292_Then_correct  (=> (< i 0) (and (=> (= (ControlFlow 0 499) (- 0 501)) (U_2_bool (MapType2Select g null))) (=> (U_2_bool (MapType2Select g null)) (and (=> (= (ControlFlow 0 499) (- 0 500)) (U_2_bool (MapType2Select g null))) (=> (U_2_bool (MapType2Select g null)) (and (=> (= (ControlFlow 0 499) 496) anon293_Then_correct) (=> (= (ControlFlow 0 499) 498) anon293_Else_correct)))))))))
(let ((anon291_Else_correct  (=> (< j 0) (and (=> (= (ControlFlow 0 505) 499) anon292_Then_correct) (=> (= (ControlFlow 0 505) 502) anon292_Else_correct)))))
(let ((anon291_Then_correct  (=> (<= 0 j) (and (=> (= (ControlFlow 0 503) (- 0 504)) (U_2_bool (MapType2Select g x_1@@0))) (=> (U_2_bool (MapType2Select g x_1@@0)) (and (=> (= (ControlFlow 0 503) 499) anon292_Then_correct) (=> (= (ControlFlow 0 503) 502) anon292_Else_correct)))))))
(let ((anon290_Else_correct  (=> (= node@0 null) (and (=> (= (ControlFlow 0 508) 503) anon291_Then_correct) (=> (= (ControlFlow 0 508) 505) anon291_Else_correct)))))
(let ((anon290_Then_correct  (=> (not (= node@0 null)) (and (=> (= (ControlFlow 0 506) (- 0 507)) (U_2_bool (MapType2Select g node@0))) (=> (U_2_bool (MapType2Select g node@0)) (and (=> (= (ControlFlow 0 506) 503) anon291_Then_correct) (=> (= (ControlFlow 0 506) 505) anon291_Else_correct)))))))
(let ((anon288_Else_correct  (=> (forall ((n$3_1_1 T@U) ) (!  (=> (= (type n$3_1_1) RefType) (=> (and (U_2_bool (MapType2Select g n$3_1_1)) (not (= (MapType0Select Heap@@23 n$3_1_1 next) null))) (U_2_bool (MapType2Select g (MapType0Select Heap@@23 n$3_1_1 next)))))
 :qid |stdinbpl.3709:24|
 :skolemid |419|
 :pattern ( (MapType2Select g (MapType0Select Heap@@23 n$3_1_1 next)))
 :pattern ( (MapType2Select g n$3_1_1) (MapType0Select Heap@@23 n$3_1_1 next))
)) (and (=> (= (ControlFlow 0 509) 506) anon290_Then_correct) (=> (= (ControlFlow 0 509) 508) anon290_Else_correct)))))
(let ((anon22_correct true))
(let ((anon289_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select g n$3)) (not (= (MapType0Select Heap@@23 n$3 next) null)))) (= (ControlFlow 0 31) 28)) anon22_correct)))
(let ((anon289_Then_correct  (=> (and (U_2_bool (MapType2Select g n$3)) (not (= (MapType0Select Heap@@23 n$3 next) null))) (and (=> (= (ControlFlow 0 29) (- 0 30)) (U_2_bool (MapType2Select g (MapType0Select Heap@@23 n$3 next)))) (=> (U_2_bool (MapType2Select g (MapType0Select Heap@@23 n$3 next))) (=> (= (ControlFlow 0 29) 28) anon22_correct))))))
(let ((anon285_Else_correct  (=> (and (and (and (forall ((n$1_1 T@U) ) (!  (=> (and (= (type n$1_1) RefType) (U_2_bool (MapType2Select g n$1_1))) (exists_path ($$ Heap@@23 g) x_1@@0 n$1_1))
 :qid |stdinbpl.3602:20|
 :skolemid |412|
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| Heap@@23 g))) g) x_1@@0 n$1_1))
)) (state Heap@@23 QPMask@0)) (and (U_2_bool (MapType0Select Heap@@23 prev_node $allocated)) (U_2_bool (MapType0Select Heap@@23 node $allocated)))) (and (and (U_2_bool (MapType0Select Heap@@23 prev_i $allocated)) (U_2_bool (MapType0Select Heap@@23 node_i $allocated))) (and (state Heap@@23 QPMask@0) (state Heap@@23 QPMask@0)))) (and (=> (= (ControlFlow 0 510) (- 0 518)) (HasDirectPerm QPMask@0 x_1@@0 next)) (=> (HasDirectPerm QPMask@0 x_1@@0 next) (=> (and (and (= node@0 (MapType0Select Heap@@23 x_1@@0 next)) (state Heap@@23 QPMask@0)) (and (state Heap@@23 QPMask@0) (state Heap@@23 QPMask@0))) (and (=> (= (ControlFlow 0 510) (- 0 517)) (<= 0 i)) (=> (<= 0 i) (and (=> (= (ControlFlow 0 510) (- 0 516)) (< i j)) (=> (< i j) (and (=> (= (ControlFlow 0 510) (- 0 515)) (<= 0 0)) (=> (<= 0 0) (and (=> (= (ControlFlow 0 510) (- 0 514)) (U_2_bool (MapType2Select g x_1@@0))) (=> (U_2_bool (MapType2Select g x_1@@0)) (and (=> (= (ControlFlow 0 510) (- 0 513)) (not (U_2_bool (MapType2Select g null)))) (=> (not (U_2_bool (MapType2Select g null))) (and (=> (= (ControlFlow 0 510) (- 0 512)) (forall ((n$2 T@U) (n$2_5 T@U) ) (!  (=> (and (= (type n$2) RefType) (= (type n$2_5) RefType)) (=> (and (and (and (and (not (= n$2 n$2_5)) (U_2_bool (MapType2Select g n$2))) (U_2_bool (MapType2Select g n$2_5))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$2 n$2_5))))
 :qid |stdinbpl.3668:21|
 :skolemid |413|
 :pattern ( (neverTriggered39 n$2) (neverTriggered39 n$2_5))
))) (=> (forall ((n$2@@0 T@U) (n$2_5@@0 T@U) ) (!  (=> (and (= (type n$2@@0) RefType) (= (type n$2_5@@0) RefType)) (=> (and (and (and (and (not (= n$2@@0 n$2_5@@0)) (U_2_bool (MapType2Select g n$2@@0))) (U_2_bool (MapType2Select g n$2_5@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$2@@0 n$2_5@@0))))
 :qid |stdinbpl.3668:21|
 :skolemid |413|
 :pattern ( (neverTriggered39 n$2@@0) (neverTriggered39 n$2_5@@0))
)) (and (=> (= (ControlFlow 0 510) (- 0 511)) (forall ((n$2@@1 T@U) ) (!  (=> (and (= (type n$2@@1) RefType) (U_2_bool (MapType2Select g n$2@@1))) (>= (U_2_real (MapType1Select QPMask@0 n$2@@1 next)) FullPerm))
 :qid |stdinbpl.3675:21|
 :skolemid |414|
 :pattern ( (MapType0Select Heap@@23 n$2@@1 next))
 :pattern ( (MapType1Select QPMask@4 n$2@@1 next))
 :pattern ( (MapType0Select Heap@@23 n$2@@1 next))
))) (=> (forall ((n$2@@2 T@U) ) (!  (=> (and (= (type n$2@@2) RefType) (U_2_bool (MapType2Select g n$2@@2))) (>= (U_2_real (MapType1Select QPMask@0 n$2@@2 next)) FullPerm))
 :qid |stdinbpl.3675:21|
 :skolemid |414|
 :pattern ( (MapType0Select Heap@@23 n$2@@2 next))
 :pattern ( (MapType1Select QPMask@4 n$2@@2 next))
 :pattern ( (MapType0Select Heap@@23 n$2@@2 next))
)) (=> (and (and (forall ((n$2@@3 T@U) ) (!  (=> (= (type n$2@@3) RefType) (=> (and (U_2_bool (MapType2Select g n$2@@3)) (< NoPerm FullPerm)) (and (qpRange39 n$2@@3) (= (invRecv39 n$2@@3) n$2@@3))))
 :qid |stdinbpl.3681:26|
 :skolemid |415|
 :pattern ( (MapType0Select Heap@@23 n$2@@3 next))
 :pattern ( (MapType1Select QPMask@4 n$2@@3 next))
 :pattern ( (MapType0Select Heap@@23 n$2@@3 next))
)) (forall ((o_3@@71 T@U) ) (!  (=> (= (type o_3@@71) RefType) (=> (and (U_2_bool (MapType2Select g (invRecv39 o_3@@71))) (and (< NoPerm FullPerm) (qpRange39 o_3@@71))) (= (invRecv39 o_3@@71) o_3@@71)))
 :qid |stdinbpl.3685:26|
 :skolemid |416|
 :pattern ( (invRecv39 o_3@@71))
))) (and (forall ((o_3@@72 T@U) ) (!  (=> (= (type o_3@@72) RefType) (and (=> (and (U_2_bool (MapType2Select g (invRecv39 o_3@@72))) (and (< NoPerm FullPerm) (qpRange39 o_3@@72))) (and (= (invRecv39 o_3@@72) o_3@@72) (= (U_2_real (MapType1Select QPMask@4 o_3@@72 next)) (- (U_2_real (MapType1Select QPMask@0 o_3@@72 next)) FullPerm)))) (=> (not (and (U_2_bool (MapType2Select g (invRecv39 o_3@@72))) (and (< NoPerm FullPerm) (qpRange39 o_3@@72)))) (= (U_2_real (MapType1Select QPMask@4 o_3@@72 next)) (U_2_real (MapType1Select QPMask@0 o_3@@72 next))))))
 :qid |stdinbpl.3691:26|
 :skolemid |417|
 :pattern ( (MapType1Select QPMask@4 o_3@@72 next))
)) (forall ((o_3@@73 T@U) (f_5@@23 T@U) ) (! (let ((B@@35 (FieldTypeInv1 (type f_5@@23))))
(let ((A@@36 (FieldTypeInv0 (type f_5@@23))))
 (=> (and (and (= (type o_3@@73) RefType) (= (type f_5@@23) (FieldType A@@36 B@@35))) (not (= f_5@@23 next))) (= (U_2_real (MapType1Select QPMask@0 o_3@@73 f_5@@23)) (U_2_real (MapType1Select QPMask@4 o_3@@73 f_5@@23))))))
 :qid |stdinbpl.3697:33|
 :skolemid |418|
 :pattern ( (MapType1Select QPMask@4 o_3@@73 f_5@@23))
)))) (and (and (=> (= (ControlFlow 0 510) 509) anon288_Else_correct) (=> (= (ControlFlow 0 510) 29) anon289_Then_correct)) (=> (= (ControlFlow 0 510) 31) anon289_Else_correct)))))))))))))))))))))))
(let ((anon287_Then_correct  (and (=> (= (ControlFlow 0 24) (- 0 26)) (forall ((n_5 T@U) ) (!  (=> (= (type n_5) RefType) (=> (and (U_2_bool (MapType2Select g n_5)) (dummyFunction (MapType0Select Heap@@23 n_5 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.3551:25|
 :skolemid |405|
 :pattern ( (MapType0Select Heap@@23 n_5 next))
 :pattern ( (MapType1Select QPMask@38 n_5 next))
 :pattern ( (MapType0Select Heap@@23 n_5 next))
))) (=> (forall ((n_5@@0 T@U) ) (!  (=> (= (type n_5@@0) RefType) (=> (and (U_2_bool (MapType2Select g n_5@@0)) (dummyFunction (MapType0Select Heap@@23 n_5@@0 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.3551:25|
 :skolemid |405|
 :pattern ( (MapType0Select Heap@@23 n_5@@0 next))
 :pattern ( (MapType1Select QPMask@38 n_5@@0 next))
 :pattern ( (MapType0Select Heap@@23 n_5@@0 next))
)) (and (=> (= (ControlFlow 0 24) (- 0 25)) (forall ((n_5@@1 T@U) (n_5_1 T@U) ) (!  (=> (and (= (type n_5@@1) RefType) (= (type n_5_1) RefType)) (=> (and (and (and (and (not (= n_5@@1 n_5_1)) (U_2_bool (MapType2Select g n_5@@1))) (U_2_bool (MapType2Select g n_5_1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_5@@1 n_5_1))))
 :qid |stdinbpl.3558:25|
 :skolemid |406|
 :pattern ( (neverTriggered38 n_5@@1) (neverTriggered38 n_5_1))
))) (=> (forall ((n_5@@2 T@U) (n_5_1@@0 T@U) ) (!  (=> (and (= (type n_5@@2) RefType) (= (type n_5_1@@0) RefType)) (=> (and (and (and (and (not (= n_5@@2 n_5_1@@0)) (U_2_bool (MapType2Select g n_5@@2))) (U_2_bool (MapType2Select g n_5_1@@0))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_5@@2 n_5_1@@0))))
 :qid |stdinbpl.3558:25|
 :skolemid |406|
 :pattern ( (neverTriggered38 n_5@@2) (neverTriggered38 n_5_1@@0))
)) (=> (= (ControlFlow 0 24) (- 0 23)) (forall ((n_5@@3 T@U) ) (!  (=> (and (= (type n_5@@3) RefType) (U_2_bool (MapType2Select g n_5@@3))) (>= (U_2_real (MapType1Select QPMask@0 n_5@@3 next)) (/ (to_real 1) (to_real 2))))
 :qid |stdinbpl.3565:25|
 :skolemid |407|
 :pattern ( (MapType0Select Heap@@23 n_5@@3 next))
 :pattern ( (MapType1Select QPMask@38 n_5@@3 next))
 :pattern ( (MapType0Select Heap@@23 n_5@@3 next))
)))))))))
(let ((anon18_correct true))
(let ((anon286_Then_correct  (=> (U_2_bool (MapType2Select g n$1)) (and (=> (= (ControlFlow 0 27) 24) anon287_Then_correct) (=> (= (ControlFlow 0 27) 21) anon18_correct)))))
(let ((anon286_Else_correct  (=> (and (not (U_2_bool (MapType2Select g n$1))) (= (ControlFlow 0 22) 21)) anon18_correct)))
(let ((anon284_Else_correct  (=> (unshared_graph ($$ Heap@@23 g)) (=> (and (state Heap@@23 QPMask@0) (state Heap@@23 QPMask@0)) (and (and (=> (= (ControlFlow 0 519) 510) anon285_Else_correct) (=> (= (ControlFlow 0 519) 27) anon286_Then_correct)) (=> (= (ControlFlow 0 519) 22) anon286_Else_correct))))))
(let ((anon284_Then_correct  (and (=> (= (ControlFlow 0 18) (- 0 20)) (forall ((n_4 T@U) ) (!  (=> (= (type n_4) RefType) (=> (and (U_2_bool (MapType2Select g n_4)) (dummyFunction (MapType0Select Heap@@23 n_4 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.3488:21|
 :skolemid |398|
 :pattern ( (MapType0Select Heap@@23 n_4 next))
 :pattern ( (MapType1Select QPMask@3 n_4 next))
 :pattern ( (MapType0Select Heap@@23 n_4 next))
))) (=> (forall ((n_4@@0 T@U) ) (!  (=> (= (type n_4@@0) RefType) (=> (and (U_2_bool (MapType2Select g n_4@@0)) (dummyFunction (MapType0Select Heap@@23 n_4@@0 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.3488:21|
 :skolemid |398|
 :pattern ( (MapType0Select Heap@@23 n_4@@0 next))
 :pattern ( (MapType1Select QPMask@3 n_4@@0 next))
 :pattern ( (MapType0Select Heap@@23 n_4@@0 next))
)) (and (=> (= (ControlFlow 0 18) (- 0 19)) (forall ((n_4@@1 T@U) (n_4_1 T@U) ) (!  (=> (and (= (type n_4@@1) RefType) (= (type n_4_1) RefType)) (=> (and (and (and (and (not (= n_4@@1 n_4_1)) (U_2_bool (MapType2Select g n_4@@1))) (U_2_bool (MapType2Select g n_4_1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_4@@1 n_4_1))))
 :qid |stdinbpl.3495:21|
 :skolemid |399|
 :pattern ( (neverTriggered37 n_4@@1) (neverTriggered37 n_4_1))
))) (=> (forall ((n_4@@2 T@U) (n_4_1@@0 T@U) ) (!  (=> (and (= (type n_4@@2) RefType) (= (type n_4_1@@0) RefType)) (=> (and (and (and (and (not (= n_4@@2 n_4_1@@0)) (U_2_bool (MapType2Select g n_4@@2))) (U_2_bool (MapType2Select g n_4_1@@0))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_4@@2 n_4_1@@0))))
 :qid |stdinbpl.3495:21|
 :skolemid |399|
 :pattern ( (neverTriggered37 n_4@@2) (neverTriggered37 n_4_1@@0))
)) (=> (= (ControlFlow 0 18) (- 0 17)) (forall ((n_4@@3 T@U) ) (!  (=> (and (= (type n_4@@3) RefType) (U_2_bool (MapType2Select g n_4@@3))) (>= (U_2_real (MapType1Select QPMask@0 n_4@@3 next)) (/ (to_real 1) (to_real 2))))
 :qid |stdinbpl.3502:21|
 :skolemid |400|
 :pattern ( (MapType0Select Heap@@23 n_4@@3 next))
 :pattern ( (MapType1Select QPMask@3 n_4@@3 next))
 :pattern ( (MapType0Select Heap@@23 n_4@@3 next))
)))))))))
(let ((anon283_Else_correct  (=> (and (func_graph ($$ Heap@@23 g)) (state Heap@@23 QPMask@0)) (and (=> (= (ControlFlow 0 520) 18) anon284_Then_correct) (=> (= (ControlFlow 0 520) 519) anon284_Else_correct)))))
(let ((anon283_Then_correct  (and (=> (= (ControlFlow 0 14) (- 0 16)) (forall ((n_3 T@U) ) (!  (=> (= (type n_3) RefType) (=> (and (U_2_bool (MapType2Select g n_3)) (dummyFunction (MapType0Select Heap@@23 n_3 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.3428:21|
 :skolemid |391|
 :pattern ( (MapType0Select Heap@@23 n_3 next))
 :pattern ( (MapType1Select QPMask@2 n_3 next))
 :pattern ( (MapType0Select Heap@@23 n_3 next))
))) (=> (forall ((n_3@@0 T@U) ) (!  (=> (= (type n_3@@0) RefType) (=> (and (U_2_bool (MapType2Select g n_3@@0)) (dummyFunction (MapType0Select Heap@@23 n_3@@0 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.3428:21|
 :skolemid |391|
 :pattern ( (MapType0Select Heap@@23 n_3@@0 next))
 :pattern ( (MapType1Select QPMask@2 n_3@@0 next))
 :pattern ( (MapType0Select Heap@@23 n_3@@0 next))
)) (and (=> (= (ControlFlow 0 14) (- 0 15)) (forall ((n_3@@1 T@U) (n_3_1 T@U) ) (!  (=> (and (= (type n_3@@1) RefType) (= (type n_3_1) RefType)) (=> (and (and (and (and (not (= n_3@@1 n_3_1)) (U_2_bool (MapType2Select g n_3@@1))) (U_2_bool (MapType2Select g n_3_1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_3@@1 n_3_1))))
 :qid |stdinbpl.3435:21|
 :skolemid |392|
 :pattern ( (neverTriggered36 n_3@@1) (neverTriggered36 n_3_1))
))) (=> (forall ((n_3@@2 T@U) (n_3_1@@0 T@U) ) (!  (=> (and (= (type n_3@@2) RefType) (= (type n_3_1@@0) RefType)) (=> (and (and (and (and (not (= n_3@@2 n_3_1@@0)) (U_2_bool (MapType2Select g n_3@@2))) (U_2_bool (MapType2Select g n_3_1@@0))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_3@@2 n_3_1@@0))))
 :qid |stdinbpl.3435:21|
 :skolemid |392|
 :pattern ( (neverTriggered36 n_3@@2) (neverTriggered36 n_3_1@@0))
)) (=> (= (ControlFlow 0 14) (- 0 13)) (forall ((n_3@@3 T@U) ) (!  (=> (and (= (type n_3@@3) RefType) (U_2_bool (MapType2Select g n_3@@3))) (>= (U_2_real (MapType1Select QPMask@0 n_3@@3 next)) (/ (to_real 1) (to_real 2))))
 :qid |stdinbpl.3442:21|
 :skolemid |393|
 :pattern ( (MapType0Select Heap@@23 n_3@@3 next))
 :pattern ( (MapType1Select QPMask@2 n_3@@3 next))
 :pattern ( (MapType0Select Heap@@23 n_3@@3 next))
)))))))))
(let ((anon282_Else_correct  (=> (and (acyclic_graph ($$ Heap@@23 g)) (state Heap@@23 QPMask@0)) (and (=> (= (ControlFlow 0 521) 14) anon283_Then_correct) (=> (= (ControlFlow 0 521) 520) anon283_Else_correct)))))
(let ((anon282_Then_correct  (and (=> (= (ControlFlow 0 10) (- 0 12)) (forall ((n_2 T@U) ) (!  (=> (= (type n_2) RefType) (=> (and (U_2_bool (MapType2Select g n_2)) (dummyFunction (MapType0Select Heap@@23 n_2 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.3368:21|
 :skolemid |384|
 :pattern ( (MapType0Select Heap@@23 n_2 next))
 :pattern ( (MapType1Select QPMask@1 n_2 next))
 :pattern ( (MapType0Select Heap@@23 n_2 next))
))) (=> (forall ((n_2@@0 T@U) ) (!  (=> (= (type n_2@@0) RefType) (=> (and (U_2_bool (MapType2Select g n_2@@0)) (dummyFunction (MapType0Select Heap@@23 n_2@@0 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.3368:21|
 :skolemid |384|
 :pattern ( (MapType0Select Heap@@23 n_2@@0 next))
 :pattern ( (MapType1Select QPMask@1 n_2@@0 next))
 :pattern ( (MapType0Select Heap@@23 n_2@@0 next))
)) (and (=> (= (ControlFlow 0 10) (- 0 11)) (forall ((n_2@@1 T@U) (n_2_1 T@U) ) (!  (=> (and (= (type n_2@@1) RefType) (= (type n_2_1) RefType)) (=> (and (and (and (and (not (= n_2@@1 n_2_1)) (U_2_bool (MapType2Select g n_2@@1))) (U_2_bool (MapType2Select g n_2_1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_2@@1 n_2_1))))
 :qid |stdinbpl.3375:21|
 :skolemid |385|
 :pattern ( (neverTriggered35 n_2@@1) (neverTriggered35 n_2_1))
))) (=> (forall ((n_2@@2 T@U) (n_2_1@@0 T@U) ) (!  (=> (and (= (type n_2@@2) RefType) (= (type n_2_1@@0) RefType)) (=> (and (and (and (and (not (= n_2@@2 n_2_1@@0)) (U_2_bool (MapType2Select g n_2@@2))) (U_2_bool (MapType2Select g n_2_1@@0))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_2@@2 n_2_1@@0))))
 :qid |stdinbpl.3375:21|
 :skolemid |385|
 :pattern ( (neverTriggered35 n_2@@2) (neverTriggered35 n_2_1@@0))
)) (=> (= (ControlFlow 0 10) (- 0 9)) (forall ((n_2@@3 T@U) ) (!  (=> (and (= (type n_2@@3) RefType) (U_2_bool (MapType2Select g n_2@@3))) (>= (U_2_real (MapType1Select QPMask@0 n_2@@3 next)) (/ (to_real 1) (to_real 2))))
 :qid |stdinbpl.3382:21|
 :skolemid |386|
 :pattern ( (MapType0Select Heap@@23 n_2@@3 next))
 :pattern ( (MapType1Select QPMask@1 n_2@@3 next))
 :pattern ( (MapType0Select Heap@@23 n_2@@3 next))
)))))))))
(let ((anon279_Else_correct  (=> (forall ((n$0_1 T@U) ) (!  (=> (= (type n$0_1) RefType) (=> (and (U_2_bool (MapType2Select g n$0_1)) (not (= (MapType0Select Heap@@23 n$0_1 next) null))) (U_2_bool (MapType2Select g (MapType0Select Heap@@23 n$0_1 next)))))
 :qid |stdinbpl.3352:20|
 :skolemid |383|
 :pattern ( (MapType2Select g (MapType0Select Heap@@23 n$0_1 next)))
 :pattern ( (MapType2Select g n$0_1) (MapType0Select Heap@@23 n$0_1 next))
)) (=> (and (state Heap@@23 QPMask@0) (state Heap@@23 QPMask@0)) (and (=> (= (ControlFlow 0 522) 10) anon282_Then_correct) (=> (= (ControlFlow 0 522) 521) anon282_Else_correct))))))
(let ((anon7_correct true))
(let ((anon281_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select g n$0_3)) (not (= (MapType0Select Heap@@23 n$0_3 next) null)))) (= (ControlFlow 0 5) 2)) anon7_correct)))
(let ((anon281_Then_correct  (=> (and (U_2_bool (MapType2Select g n$0_3)) (not (= (MapType0Select Heap@@23 n$0_3 next) null))) (and (=> (= (ControlFlow 0 3) (- 0 4)) (HasDirectPerm QPMask@0 n$0_3 next)) (=> (HasDirectPerm QPMask@0 n$0_3 next) (=> (= (ControlFlow 0 3) 2) anon7_correct))))))
(let ((anon280_Else_correct  (=> (not (U_2_bool (MapType2Select g n$0_3))) (and (=> (= (ControlFlow 0 8) 3) anon281_Then_correct) (=> (= (ControlFlow 0 8) 5) anon281_Else_correct)))))
(let ((anon280_Then_correct  (=> (U_2_bool (MapType2Select g n$0_3)) (and (=> (= (ControlFlow 0 6) (- 0 7)) (HasDirectPerm QPMask@0 n$0_3 next)) (=> (HasDirectPerm QPMask@0 n$0_3 next) (and (=> (= (ControlFlow 0 6) 3) anon281_Then_correct) (=> (= (ControlFlow 0 6) 5) anon281_Else_correct)))))))
(let ((anon278_Else_correct  (and (=> (= (ControlFlow 0 523) (- 0 524)) (forall ((n_1 T@U) (n_1_1 T@U) ) (!  (=> (and (= (type n_1) RefType) (= (type n_1_1) RefType)) (=> (and (and (and (and (not (= n_1 n_1_1)) (U_2_bool (MapType2Select g n_1))) (U_2_bool (MapType2Select g n_1_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_1 n_1_1))))
 :qid |stdinbpl.3307:15|
 :skolemid |377|
 :no-pattern (type n_1)
 :no-pattern (type n_1_1)
 :no-pattern (U_2_int n_1)
 :no-pattern (U_2_bool n_1)
 :no-pattern (U_2_int n_1_1)
 :no-pattern (U_2_bool n_1_1)
))) (=> (forall ((n_1@@0 T@U) (n_1_1@@0 T@U) ) (!  (=> (and (= (type n_1@@0) RefType) (= (type n_1_1@@0) RefType)) (=> (and (and (and (and (not (= n_1@@0 n_1_1@@0)) (U_2_bool (MapType2Select g n_1@@0))) (U_2_bool (MapType2Select g n_1_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_1@@0 n_1_1@@0))))
 :qid |stdinbpl.3307:15|
 :skolemid |377|
 :no-pattern (type n_1@@0)
 :no-pattern (type n_1_1@@0)
 :no-pattern (U_2_int n_1@@0)
 :no-pattern (U_2_bool n_1@@0)
 :no-pattern (U_2_int n_1_1@@0)
 :no-pattern (U_2_bool n_1_1@@0)
)) (=> (and (forall ((n_1@@1 T@U) ) (!  (=> (= (type n_1@@1) RefType) (=> (and (U_2_bool (MapType2Select g n_1@@1)) (< NoPerm FullPerm)) (and (qpRange34 n_1@@1) (= (invRecv34 n_1@@1) n_1@@1))))
 :qid |stdinbpl.3313:22|
 :skolemid |378|
 :pattern ( (MapType0Select Heap@@23 n_1@@1 next))
 :pattern ( (MapType1Select QPMask@0 n_1@@1 next))
 :pattern ( (MapType0Select Heap@@23 n_1@@1 next))
)) (forall ((o_3@@74 T@U) ) (!  (=> (= (type o_3@@74) RefType) (=> (and (and (U_2_bool (MapType2Select g (invRecv34 o_3@@74))) (< NoPerm FullPerm)) (qpRange34 o_3@@74)) (= (invRecv34 o_3@@74) o_3@@74)))
 :qid |stdinbpl.3317:22|
 :skolemid |379|
 :pattern ( (invRecv34 o_3@@74))
))) (=> (and (and (forall ((n_1@@2 T@U) ) (!  (=> (and (= (type n_1@@2) RefType) (U_2_bool (MapType2Select g n_1@@2))) (not (= n_1@@2 null)))
 :qid |stdinbpl.3323:22|
 :skolemid |380|
 :pattern ( (MapType0Select Heap@@23 n_1@@2 next))
 :pattern ( (MapType1Select QPMask@0 n_1@@2 next))
 :pattern ( (MapType0Select Heap@@23 n_1@@2 next))
)) (forall ((o_3@@75 T@U) ) (!  (=> (= (type o_3@@75) RefType) (and (=> (and (and (U_2_bool (MapType2Select g (invRecv34 o_3@@75))) (< NoPerm FullPerm)) (qpRange34 o_3@@75)) (and (=> (< NoPerm FullPerm) (= (invRecv34 o_3@@75) o_3@@75)) (= (U_2_real (MapType1Select QPMask@0 o_3@@75 next)) (+ (U_2_real (MapType1Select ZeroMask o_3@@75 next)) FullPerm)))) (=> (not (and (and (U_2_bool (MapType2Select g (invRecv34 o_3@@75))) (< NoPerm FullPerm)) (qpRange34 o_3@@75))) (= (U_2_real (MapType1Select QPMask@0 o_3@@75 next)) (U_2_real (MapType1Select ZeroMask o_3@@75 next))))))
 :qid |stdinbpl.3329:22|
 :skolemid |381|
 :pattern ( (MapType1Select QPMask@0 o_3@@75 next))
))) (and (forall ((o_3@@76 T@U) (f_5@@24 T@U) ) (! (let ((B@@36 (FieldTypeInv1 (type f_5@@24))))
(let ((A@@37 (FieldTypeInv0 (type f_5@@24))))
 (=> (and (and (= (type o_3@@76) RefType) (= (type f_5@@24) (FieldType A@@37 B@@36))) (not (= f_5@@24 next))) (= (U_2_real (MapType1Select ZeroMask o_3@@76 f_5@@24)) (U_2_real (MapType1Select QPMask@0 o_3@@76 f_5@@24))))))
 :qid |stdinbpl.3333:29|
 :skolemid |382|
 :pattern ( (MapType1Select ZeroMask o_3@@76 f_5@@24))
 :pattern ( (MapType1Select QPMask@0 o_3@@76 f_5@@24))
)) (state Heap@@23 QPMask@0))) (and (and (=> (= (ControlFlow 0 523) 522) anon279_Else_correct) (=> (= (ControlFlow 0 523) 6) anon280_Then_correct)) (=> (= (ControlFlow 0 523) 8) anon280_Else_correct))))))))
(let ((anon278_Then_correct true))
(let ((anon0_correct  (=> (state Heap@@23 ZeroMask) (=> (and (and (and (= AssumeFunctionsAbove (- 0 1)) (U_2_bool (MapType0Select Heap@@23 x_1@@0 $allocated))) (and (<= 0 i) (< i j))) (and (and (state Heap@@23 ZeroMask) (U_2_bool (MapType2Select g x_1@@0))) (and (state Heap@@23 ZeroMask) (not (U_2_bool (MapType2Select g null)))))) (and (=> (= (ControlFlow 0 525) 1) anon278_Then_correct) (=> (= (ControlFlow 0 525) 523) anon278_Else_correct))))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 526) 525) anon0_correct)))
PreconditionGeneratedEntry_correct))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
))
(check-sat)
(pop 1)
; Valid
(get-info :rlimit)
