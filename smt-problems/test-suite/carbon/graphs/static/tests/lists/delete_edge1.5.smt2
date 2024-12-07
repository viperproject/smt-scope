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
(declare-fun inst_uReach (T@U T@U) T@U)
(declare-fun exists_path (T@U T@U T@U) Bool)
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
(declare-fun edge_ (T@U T@U T@U) Bool)
(declare-fun dummyHeap () T@U)
(declare-fun ZeroMask () T@U)
(declare-fun |MultiSet#UnionOne| (T@U T@U) T@U)
(declare-fun |MultiSet#Disjoint| (T@U T@U) Bool)
(declare-fun InsidePredicate (T@U T@U T@U T@U) Bool)
(declare-fun |MultiSet#Singleton| (T@U) T@U)
(declare-fun apply_noExit (T@U T@U T@U) Bool)
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
(declare-fun |MultiSet#Empty| (T@T) T@U)
(declare-fun unshared_graph (T@U) Bool)
(declare-fun func_graph (T@U) Bool)
(declare-fun FullPerm () Real)
(declare-fun |Set#Subset| (T@U T@U) Bool)
(declare-fun |sk_apply_TCFraming#condqp2| (Int Int) T@U)
(declare-fun |sk_apply_TCFraming#condqp3| (Int Int) T@U)
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
 :qid |stdinbpl.633:18|
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
 :qid |stdinbpl.986:15|
 :skolemid |120|
 :pattern ( (|apply_TCFraming'| Heap@@0 g0 g1))
)))
(assert (forall ((a@@0 Int) (b@@0 Int) ) (!  (or (= (|Math#min| a@@0 b@@0) a@@0) (= (|Math#min| a@@0 b@@0) b@@0))
 :qid |stdinbpl.564:15|
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
 :qid |stdinbpl.824:15|
 :skolemid |100|
 :pattern ( (|$$'| Heap@@3 refs))
)))
(assert (forall ((a@@1 T@U) (b@@1 T@U) (y@@1 T@U) ) (! (let ((T@@3 (type y@@1)))
 (=> (and (and (= (type a@@1) (MultiSetType T@@3)) (= (type b@@1) (MultiSetType T@@3))) (<= (|MultiSet#Select| a@@1 y@@1) (|MultiSet#Select| b@@1 y@@1))) (= (|MultiSet#Select| (|MultiSet#Difference| a@@1 b@@1) y@@1) 0)))
 :qid |stdinbpl.631:18|
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
 :qid |stdinbpl.516:18|
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
 :qid |stdinbpl.520:18|
 :skolemid |40|
 :pattern ( (|Set#Intersection| (|Set#Intersection| a@@3 b@@3) b@@3))
)))
(assert (forall ((a@@4 T@U) (b@@4 T@U) ) (! (let ((T@@8 (MultiSetTypeInv0 (type a@@4))))
 (=> (and (= (type a@@4) (MultiSetType T@@8)) (= (type b@@4) (MultiSetType T@@8))) (= (|MultiSet#Intersection| (|MultiSet#Intersection| a@@4 b@@4) b@@4) (|MultiSet#Intersection| a@@4 b@@4))))
 :qid |stdinbpl.622:18|
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
 :qid |stdinbpl.485:18|
 :skolemid |27|
 :pattern ( (MapType2Select (|Set#Singleton| r) o))
)))
(assert (forall ((a@@5 T@U) (b@@5 T@U) ) (! (let ((T@@11 (MapType2TypeInv0 (type a@@5))))
 (=> (and (= (type a@@5) (MapType2Type T@@11 boolType)) (= (type b@@5) (MapType2Type T@@11 boolType))) (= (+ (|Set#Card| (|Set#Union| a@@5 b@@5)) (|Set#Card| (|Set#Intersection| a@@5 b@@5))) (+ (|Set#Card| a@@5) (|Set#Card| b@@5)))))
 :qid |stdinbpl.524:18|
 :skolemid |42|
 :pattern ( (|Set#Card| (|Set#Union| a@@5 b@@5)))
 :pattern ( (|Set#Card| (|Set#Intersection| a@@5 b@@5)))
)))
(assert (forall ((arg0@@40 T@U) (arg1@@20 T@U) ) (! (= (type (inst_uReach arg0@@40 arg1@@20)) (MapType2Type RefType boolType))
 :qid |funType:inst_uReach|
 :pattern ( (inst_uReach arg0@@40 arg1@@20))
)))
(assert (forall ((EG_1 T@U) (x_1 T@U) (v_2 T@U) ) (!  (=> (and (and (= (type EG_1) (MapType2Type EdgeDomainTypeType boolType)) (= (type x_1) RefType)) (= (type v_2) RefType)) (= (U_2_bool (MapType2Select (inst_uReach EG_1 x_1) v_2)) (exists_path EG_1 x_1 v_2)))
 :qid |stdinbpl.745:15|
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
 :qid |stdinbpl.820:15|
 :skolemid |99|
 :pattern ( ($$ Heap@@5 refs@@0))
)))
(assert (forall ((a@@6 Int) ) (!  (=> (<= 0 a@@6) (= (|Math#clip| a@@6) a@@6))
 :qid |stdinbpl.567:15|
 :skolemid |54|
 :pattern ( (|Math#clip| a@@6))
)))
(assert (forall ((EG_1@@0 T@U) (u_1 T@U) (v_2@@0 T@U) (w_1 T@U) ) (!  (=> (and (and (and (and (= (type EG_1@@0) (MapType2Type EdgeDomainTypeType boolType)) (= (type u_1) RefType)) (= (type v_2@@0) RefType)) (= (type w_1) RefType)) (and (exists_path_ EG_1@@0 u_1 w_1) (exists_path_ EG_1@@0 w_1 v_2@@0))) (exists_path_ EG_1@@0 u_1 v_2@@0))
 :qid |stdinbpl.766:15|
 :skolemid |92|
 :pattern ( (exists_path EG_1@@0 u_1 w_1) (exists_path EG_1@@0 w_1 v_2@@0))
)))
(assert (forall ((a@@7 T@U) (b@@6 T@U) (o@@0 T@U) ) (! (let ((T@@12 (type o@@0)))
 (=> (and (= (type a@@7) (MultiSetType T@@12)) (= (type b@@6) (MultiSetType T@@12))) (= (|MultiSet#Select| (|MultiSet#Intersection| a@@7 b@@6) o@@0) (|Math#min| (|MultiSet#Select| a@@7 o@@0) (|MultiSet#Select| b@@6 o@@0)))))
 :qid |stdinbpl.618:18|
 :skolemid |69|
 :pattern ( (|MultiSet#Select| (|MultiSet#Intersection| a@@7 b@@6) o@@0))
)))
(assert (forall ((arg0@@42 T@U) ) (! (= (type (FrameFragment arg0@@42)) FrameTypeType)
 :qid |funType:FrameFragment|
 :pattern ( (FrameFragment arg0@@42))
)))
(assert (forall ((Heap@@6 T@U) (Mask@@3 T@U) (refs@@1 T@U) ) (!  (=> (and (and (and (= (type Heap@@6) (MapType0Type RefType)) (= (type Mask@@3) (MapType1Type RefType realType))) (= (type refs@@1) (MapType2Type RefType boolType))) (and (state Heap@@6 Mask@@3) (or (< AssumeFunctionsAbove 1) (|$$#trigger| (FrameFragment (int_2_U (|$$#condqp1| Heap@@6 refs@@1))) refs@@1)))) (forall ((p_1_1 T@U) (s_1_1 T@U) ) (!  (=> (and (and (= (type p_1_1) RefType) (= (type s_1_1) RefType)) (and (U_2_bool (MapType2Select refs@@1 p_1_1)) (exists_path (|$$'| Heap@@6 refs@@1) p_1_1 s_1_1))) (U_2_bool (MapType2Select refs@@1 s_1_1)))
 :qid |stdinbpl.856:122|
 :skolemid |105|
 :pattern ( (MapType2Select refs@@1 p_1_1) (MapType2Select refs@@1 s_1_1) (exists_path (|$$'| Heap@@6 refs@@1) p_1_1 s_1_1))
)))
 :qid |stdinbpl.854:15|
 :skolemid |106|
 :pattern ( (state Heap@@6 Mask@@3) (|$$'| Heap@@6 refs@@1))
)))
(assert (forall ((Heap@@7 T@U) (Mask@@4 T@U) (refs@@2 T@U) ) (!  (=> (and (and (and (= (type Heap@@7) (MapType0Type RefType)) (= (type Mask@@4) (MapType1Type RefType realType))) (= (type refs@@2) (MapType2Type RefType boolType))) (and (state Heap@@7 Mask@@4) (or (< AssumeFunctionsAbove 1) (|$$#trigger| (FrameFragment (int_2_U (|$$#condqp1| Heap@@7 refs@@2))) refs@@2)))) (forall ((p_2_1 T@U) (s_2 T@U) ) (!  (=> (and (and (= (type p_2_1) RefType) (= (type s_2) RefType)) (and (U_2_bool (MapType2Select refs@@2 s_2)) (exists_path (|$$'| Heap@@7 refs@@2) p_2_1 s_2))) (U_2_bool (MapType2Select refs@@2 p_2_1)))
 :qid |stdinbpl.863:122|
 :skolemid |107|
 :pattern ( (MapType2Select refs@@2 p_2_1) (MapType2Select refs@@2 s_2) (exists_path (|$$'| Heap@@7 refs@@2) p_2_1 s_2))
)))
 :qid |stdinbpl.861:15|
 :skolemid |108|
 :pattern ( (state Heap@@7 Mask@@4) (|$$'| Heap@@7 refs@@2))
)))
(assert (forall ((EG_1@@1 T@U) (start_1 T@U) (end_1 T@U) ) (!  (=> (and (and (= (type EG_1@@1) (MapType2Type EdgeDomainTypeType boolType)) (= (type start_1) RefType)) (= (type end_1) RefType)) (= (exists_path_ EG_1@@1 start_1 end_1)  (or (= start_1 end_1) (exists ((w_1@@0 T@U) ) (!  (and (= (type w_1@@0) RefType) (and (edge EG_1@@1 start_1 w_1@@0) (exists_path_ EG_1@@1 w_1@@0 end_1)))
 :qid |stdinbpl.759:78|
 :skolemid |90|
 :pattern ( (edge EG_1@@1 start_1 w_1@@0))
 :pattern ( (exists_path_ EG_1@@1 w_1@@0 end_1))
)))))
 :qid |stdinbpl.757:15|
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
(assert  (and (and (forall ((arg0@@43 T@U) (arg1@@22 T@U) ) (! (= (type (CombineFrames arg0@@43 arg1@@22)) FrameTypeType)
 :qid |funType:CombineFrames|
 :pattern ( (CombineFrames arg0@@43 arg1@@22))
)) (forall ((T@@13 T@T) ) (! (= (type (|Set#Empty| T@@13)) (MapType2Type T@@13 boolType))
 :qid |funType:Set#Empty|
 :pattern ( (|Set#Empty| T@@13))
))) (forall ((arg0@@44 T@U) (arg1@@23 T@U) ) (! (= (type (|$$#frame| arg0@@44 arg1@@23)) (MapType2Type EdgeDomainTypeType boolType))
 :qid |funType:$$#frame|
 :pattern ( (|$$#frame| arg0@@44 arg1@@23))
))))
(assert (forall ((Heap@@9 T@U) (Mask@@6 T@U) (g0@@0 T@U) (g1@@0 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@9) (MapType0Type RefType)) (= (type Mask@@6) (MapType1Type RefType realType))) (= (type g0@@0) (MapType2Type RefType boolType))) (= (type g1@@0) (MapType2Type RefType boolType))) (and (state Heap@@9 Mask@@6) (or (< AssumeFunctionsAbove 0) (|apply_TCFraming#trigger| (CombineFrames (FrameFragment (int_2_U (|apply_TCFraming#condqp2| Heap@@9 g0@@0 g1@@0))) (FrameFragment (int_2_U (|apply_TCFraming#condqp3| Heap@@9 g0@@0 g1@@0)))) g0@@0 g1@@0)))) (|Set#Equal| (|Set#Intersection| g1@@0 g0@@0) (|Set#Empty| RefType))) (forall ((u_2 T@U) (v_2_1 T@U) ) (!  (=> (and (and (= (type u_2) RefType) (= (type v_2_1) RefType)) (and (U_2_bool (MapType2Select g0@@0 u_2)) (and (U_2_bool (MapType2Select g0@@0 v_2_1)) (not (exists_path ($$ Heap@@9 g0@@0) u_2 v_2_1))))) (not (exists_path ($$ Heap@@9 (|Set#Union| g0@@0 g1@@0)) u_2 v_2_1)))
 :qid |stdinbpl.1039:285|
 :skolemid |129|
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| Heap@@9 g0@@0))) g0@@0) u_2 v_2_1))
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| Heap@@9 (|Set#Union| g0@@0 g1@@0)))) (|Set#Union| g0@@0 g1@@0)) u_2 v_2_1))
)))
 :qid |stdinbpl.1037:15|
 :skolemid |130|
 :pattern ( (state Heap@@9 Mask@@6) (|apply_TCFraming'| Heap@@9 g0@@0 g1@@0))
)))
(assert (forall ((Heap@@10 T@U) (Mask@@7 T@U) (g0@@1 T@U) (g1@@1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@10) (MapType0Type RefType)) (= (type Mask@@7) (MapType1Type RefType realType))) (= (type g0@@1) (MapType2Type RefType boolType))) (= (type g1@@1) (MapType2Type RefType boolType))) (and (state Heap@@10 Mask@@7) (or (< AssumeFunctionsAbove 0) (|apply_TCFraming#trigger| (CombineFrames (FrameFragment (int_2_U (|apply_TCFraming#condqp2| Heap@@10 g0@@1 g1@@1))) (FrameFragment (int_2_U (|apply_TCFraming#condqp3| Heap@@10 g0@@1 g1@@1)))) g0@@1 g1@@1)))) (|Set#Equal| (|Set#Intersection| g1@@1 g0@@1) (|Set#Empty| RefType))) (forall ((u_3 T@U) (v_3 T@U) ) (!  (=> (and (and (= (type u_3) RefType) (= (type v_3) RefType)) (and (U_2_bool (MapType2Select g1@@1 u_3)) (and (U_2_bool (MapType2Select g1@@1 v_3)) (not (exists_path ($$ Heap@@10 g1@@1) u_3 v_3))))) (not (exists_path ($$ Heap@@10 (|Set#Union| g1@@1 g0@@1)) u_3 v_3)))
 :qid |stdinbpl.1046:285|
 :skolemid |131|
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| Heap@@10 g1@@1))) g1@@1) u_3 v_3))
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| Heap@@10 (|Set#Union| g0@@1 g1@@1)))) (|Set#Union| g0@@1 g1@@1)) u_3 v_3))
)))
 :qid |stdinbpl.1044:15|
 :skolemid |132|
 :pattern ( (state Heap@@10 Mask@@7) (|apply_TCFraming'| Heap@@10 g0@@1 g1@@1))
)))
(assert (forall ((arg0@@45 T@U) (arg1@@24 T@U) ) (! (= (type (create_edge arg0@@45 arg1@@24)) EdgeDomainTypeType)
 :qid |funType:create_edge|
 :pattern ( (create_edge arg0@@45 arg1@@24))
)))
(assert (forall ((EG_1@@2 T@U) (p_2 T@U) (s_1 T@U) ) (!  (=> (and (and (= (type EG_1@@2) (MapType2Type EdgeDomainTypeType boolType)) (= (type p_2) RefType)) (= (type s_1) RefType)) (= (edge_ EG_1@@2 p_2 s_1) (U_2_bool (MapType2Select EG_1@@2 (create_edge p_2 s_1)))))
 :qid |stdinbpl.727:15|
 :skolemid |84|
 :pattern ( (MapType2Select EG_1@@2 (create_edge p_2 s_1)))
 :pattern ( (edge EG_1@@2 p_2 s_1))
)))
(assert  (and (= (type dummyHeap) (MapType0Type RefType)) (= (type ZeroMask) (MapType1Type RefType realType))))
(assert (state dummyHeap ZeroMask))
(assert (forall ((arg0@@46 T@U) (arg1@@25 T@U) ) (! (let ((T@@14 (type arg1@@25)))
(= (type (|MultiSet#UnionOne| arg0@@46 arg1@@25)) (MultiSetType T@@14)))
 :qid |funType:MultiSet#UnionOne|
 :pattern ( (|MultiSet#UnionOne| arg0@@46 arg1@@25))
)))
(assert (forall ((a@@8 T@U) (x@@8 T@U) ) (! (let ((T@@15 (type x@@8)))
 (=> (= (type a@@8) (MultiSetType T@@15)) (= (|MultiSet#Card| (|MultiSet#UnionOne| a@@8 x@@8)) (+ (|MultiSet#Card| a@@8) 1))))
 :qid |stdinbpl.604:18|
 :skolemid |65|
 :pattern ( (|MultiSet#Card| (|MultiSet#UnionOne| a@@8 x@@8)))
 :pattern ( (|MultiSet#UnionOne| a@@8 x@@8) (|MultiSet#Card| a@@8))
)))
(assert (forall ((a@@9 T@U) (b@@7 T@U) ) (! (let ((T@@16 (MultiSetTypeInv0 (type a@@9))))
 (=> (and (= (type a@@9) (MultiSetType T@@16)) (= (type b@@7) (MultiSetType T@@16))) (= (|MultiSet#Disjoint| a@@9 b@@7) (forall ((o@@1 T@U) ) (!  (=> (= (type o@@1) T@@16) (or (= (|MultiSet#Select| a@@9 o@@1) 0) (= (|MultiSet#Select| b@@7 o@@1) 0)))
 :qid |stdinbpl.654:39|
 :skolemid |80|
 :pattern ( (|MultiSet#Select| a@@9 o@@1))
 :pattern ( (|MultiSet#Select| b@@7 o@@1))
)))))
 :qid |stdinbpl.653:18|
 :skolemid |81|
 :pattern ( (|MultiSet#Disjoint| a@@9 b@@7))
)))
(assert (forall ((p T@U) (v_1 T@U) (w T@U) ) (! (let ((A@@2 (FieldTypeInv0 (type p))))
 (=> (and (and (= (type p) (FieldType A@@2 FrameTypeType)) (= (type v_1) FrameTypeType)) (= (type w) FrameTypeType)) (not (InsidePredicate p v_1 p w))))
 :qid |stdinbpl.462:19|
 :skolemid |21|
 :pattern ( (InsidePredicate p v_1 p w))
)))
(assert (forall ((arg0@@47 T@U) ) (! (let ((T@@17 (type arg0@@47)))
(= (type (|MultiSet#Singleton| arg0@@47)) (MultiSetType T@@17)))
 :qid |funType:MultiSet#Singleton|
 :pattern ( (|MultiSet#Singleton| arg0@@47))
)))
(assert (forall ((r@@0 T@U) ) (!  (and (= (|MultiSet#Card| (|MultiSet#Singleton| r@@0)) 1) (= (|MultiSet#Select| (|MultiSet#Singleton| r@@0) r@@0) 1))
 :qid |stdinbpl.596:18|
 :skolemid |62|
 :pattern ( (|MultiSet#Singleton| r@@0))
)))
(assert  (not (IsPredicateField next)))
(assert  (not (IsWandField next)))
(assert (forall ((Heap@@11 T@U) (ExhaleHeap@@3 T@U) (Mask@@8 T@U) ) (!  (=> (and (and (and (= (type Heap@@11) (MapType0Type RefType)) (= (type ExhaleHeap@@3) (MapType0Type RefType))) (= (type Mask@@8) (MapType1Type RefType realType))) (IdenticalOnKnownLocations Heap@@11 ExhaleHeap@@3 Mask@@8)) (succHeap Heap@@11 ExhaleHeap@@3))
 :qid |stdinbpl.83:15|
 :skolemid |10|
 :pattern ( (IdenticalOnKnownLocations Heap@@11 ExhaleHeap@@3 Mask@@8))
)))
(assert (forall ((EG_1@@3 T@U) (U_1 T@U) (M_1 T@U) ) (!  (=> (and (and (and (and (= (type EG_1@@3) (MapType2Type EdgeDomainTypeType boolType)) (= (type U_1) (MapType2Type RefType boolType))) (= (type M_1) (MapType2Type RefType boolType))) (apply_noExit EG_1@@3 U_1 M_1)) (forall ((u_1@@0 T@U) (v_2@@1 T@U) ) (!  (=> (and (and (= (type u_1@@0) RefType) (= (type v_2@@1) RefType)) (and (U_2_bool (MapType2Select M_1 u_1@@0)) (and (U_2_bool (MapType2Select U_1 v_2@@1)) (not (U_2_bool (MapType2Select M_1 v_2@@1)))))) (not (edge EG_1@@3 u_1@@0 v_2@@1)))
 :qid |stdinbpl.735:52|
 :skolemid |85|
 :pattern ( (edge EG_1@@3 u_1@@0 v_2@@1))
 :pattern ( (MapType2Select M_1 u_1@@0) (MapType2Select M_1 v_2@@1))
))) (forall ((u_1_1 T@U) (v_1_1 T@U) ) (!  (=> (and (and (= (type u_1_1) RefType) (= (type v_1_1) RefType)) (and (U_2_bool (MapType2Select M_1 u_1_1)) (and (U_2_bool (MapType2Select U_1 v_1_1)) (not (U_2_bool (MapType2Select M_1 v_1_1)))))) (not (exists_path EG_1@@3 u_1_1 v_1_1)))
 :qid |stdinbpl.738:17|
 :skolemid |86|
 :pattern ( (exists_path EG_1@@3 u_1_1 v_1_1))
 :pattern ( (MapType2Select M_1 u_1_1) (MapType2Select M_1 v_1_1))
)))
 :qid |stdinbpl.733:15|
 :skolemid |87|
 :pattern ( (apply_noExit EG_1@@3 U_1 M_1))
)))
(assert (forall ((a@@10 T@U) (b@@8 T@U) ) (! (let ((T@@18 (MapType2TypeInv0 (type a@@10))))
 (=> (and (= (type a@@10) (MapType2Type T@@18 boolType)) (= (type b@@8) (MapType2Type T@@18 boolType))) (= (|Set#Equal| a@@10 b@@8) (forall ((o@@2 T@U) ) (!  (=> (= (type o@@2) T@@18) (= (U_2_bool (MapType2Select a@@10 o@@2)) (U_2_bool (MapType2Select b@@8 o@@2))))
 :qid |stdinbpl.549:31|
 :skolemid |48|
 :pattern ( (MapType2Select a@@10 o@@2))
 :pattern ( (MapType2Select b@@8 o@@2))
)))))
 :qid |stdinbpl.548:17|
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
 :qid |stdinbpl.614:18|
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
 :qid |stdinbpl.450:15|
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
(assert (forall ((p_2@@0 T@U) (s_1@@0 T@U) ) (!  (=> (and (= (type p_2@@0) RefType) (= (type s_1@@0) RefType)) (and (= (edge_pred (create_edge p_2@@0 s_1@@0)) p_2@@0) (= (edge_succ (create_edge p_2@@0 s_1@@0)) s_1@@0)))
 :qid |stdinbpl.678:15|
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
 :qid |stdinbpl.849:122|
 :skolemid |103|
 :pattern ( (create_edge p_2@@1 s_1@@1))
)))
 :qid |stdinbpl.847:15|
 :skolemid |104|
 :pattern ( (state Heap@@12 Mask@@10) (|$$'| Heap@@12 refs@@3))
)))
(assert (forall ((a@@12 T@U) (b@@10 T@U) (o@@3 T@U) ) (! (let ((T@@20 (type o@@3)))
 (=> (and (= (type a@@12) (MapType2Type T@@20 boolType)) (= (type b@@10) (MapType2Type T@@20 boolType))) (= (U_2_bool (MapType2Select (|Set#Intersection| a@@12 b@@10) o@@3))  (and (U_2_bool (MapType2Select a@@12 o@@3)) (U_2_bool (MapType2Select b@@10 o@@3))))))
 :qid |stdinbpl.513:18|
 :skolemid |37|
 :pattern ( (MapType2Select (|Set#Intersection| a@@12 b@@10) o@@3))
 :pattern ( (|Set#Intersection| a@@12 b@@10) (MapType2Select a@@12 o@@3))
 :pattern ( (|Set#Intersection| a@@12 b@@10) (MapType2Select b@@10 o@@3))
)))
(assert (forall ((arg0@@51 T@U) (arg1@@27 T@U) ) (! (let ((T@@21 (MapType2TypeInv0 (type arg0@@51))))
(= (type (|Set#Difference| arg0@@51 arg1@@27)) (MapType2Type T@@21 boolType)))
 :qid |funType:Set#Difference|
 :pattern ( (|Set#Difference| arg0@@51 arg1@@27))
)))
(assert (forall ((a@@13 T@U) (b@@11 T@U) (o@@4 T@U) ) (! (let ((T@@22 (type o@@4)))
 (=> (and (= (type a@@13) (MapType2Type T@@22 boolType)) (= (type b@@11) (MapType2Type T@@22 boolType))) (= (U_2_bool (MapType2Select (|Set#Difference| a@@13 b@@11) o@@4))  (and (U_2_bool (MapType2Select a@@13 o@@4)) (not (U_2_bool (MapType2Select b@@11 o@@4)))))))
 :qid |stdinbpl.528:18|
 :skolemid |43|
 :pattern ( (MapType2Select (|Set#Difference| a@@13 b@@11) o@@4))
 :pattern ( (|Set#Difference| a@@13 b@@11) (MapType2Select a@@13 o@@4))
)))
(assert (forall ((EG_1@@4 T@U) (p_2@@2 T@U) (s_1@@2 T@U) ) (!  (=> (and (and (= (type EG_1@@4) (MapType2Type EdgeDomainTypeType boolType)) (= (type p_2@@2) RefType)) (= (type s_1@@2) RefType)) (= (edge EG_1@@4 p_2@@2 s_1@@2) (edge_ EG_1@@4 p_2@@2 s_1@@2)))
 :qid |stdinbpl.721:15|
 :skolemid |83|
 :pattern ( (edge EG_1@@4 p_2@@2 s_1@@2))
)))
(assert (forall ((EG_1@@5 T@U) (start_1@@0 T@U) (end_1@@0 T@U) ) (!  (=> (and (and (= (type EG_1@@5) (MapType2Type EdgeDomainTypeType boolType)) (= (type start_1@@0) RefType)) (= (type end_1@@0) RefType)) (= (exists_path EG_1@@5 start_1@@0 end_1@@0) (exists_path_ EG_1@@5 start_1@@0 end_1@@0)))
 :qid |stdinbpl.751:15|
 :skolemid |89|
 :pattern ( (exists_path EG_1@@5 start_1@@0 end_1@@0))
)))
(assert (forall ((a@@14 T@U) (b@@12 T@U) ) (! (let ((T@@23 (MapType2TypeInv0 (type a@@14))))
 (=> (and (and (= (type a@@14) (MapType2Type T@@23 boolType)) (= (type b@@12) (MapType2Type T@@23 boolType))) (|Set#Equal| a@@14 b@@12)) (= a@@14 b@@12)))
 :qid |stdinbpl.550:17|
 :skolemid |50|
 :pattern ( (|Set#Equal| a@@14 b@@12))
)))
(assert (forall ((a@@15 T@U) (b@@13 T@U) ) (! (let ((T@@24 (MultiSetTypeInv0 (type a@@15))))
 (=> (and (and (= (type a@@15) (MultiSetType T@@24)) (= (type b@@13) (MultiSetType T@@24))) (|MultiSet#Equal| a@@15 b@@13)) (= a@@15 b@@13)))
 :qid |stdinbpl.649:17|
 :skolemid |79|
 :pattern ( (|MultiSet#Equal| a@@15 b@@13))
)))
(assert (forall ((arg0@@52 T@U) (arg1@@28 T@U) ) (! (let ((T@@25 (type arg1@@28)))
(= (type (|Set#UnionOne| arg0@@52 arg1@@28)) (MapType2Type T@@25 boolType)))
 :qid |funType:Set#UnionOne|
 :pattern ( (|Set#UnionOne| arg0@@52 arg1@@28))
)))
(assert (forall ((a@@16 T@U) (x@@9 T@U) (y@@2 T@U) ) (! (let ((T@@26 (type x@@9)))
 (=> (and (and (= (type a@@16) (MapType2Type T@@26 boolType)) (= (type y@@2) T@@26)) (U_2_bool (MapType2Select a@@16 y@@2))) (U_2_bool (MapType2Select (|Set#UnionOne| a@@16 x@@9) y@@2))))
 :qid |stdinbpl.493:18|
 :skolemid |31|
 :pattern ( (|Set#UnionOne| a@@16 x@@9) (MapType2Select a@@16 y@@2))
)))
(assert (forall ((a@@17 T@U) (b@@14 T@U) (y@@3 T@U) ) (! (let ((T@@27 (type y@@3)))
 (=> (and (and (= (type a@@17) (MapType2Type T@@27 boolType)) (= (type b@@14) (MapType2Type T@@27 boolType))) (U_2_bool (MapType2Select a@@17 y@@3))) (U_2_bool (MapType2Select (|Set#Union| a@@17 b@@14) y@@3))))
 :qid |stdinbpl.503:18|
 :skolemid |35|
 :pattern ( (|Set#Union| a@@17 b@@14) (MapType2Select a@@17 y@@3))
)))
(assert (forall ((a@@18 T@U) (b@@15 T@U) (y@@4 T@U) ) (! (let ((T@@28 (type y@@4)))
 (=> (and (and (= (type a@@18) (MapType2Type T@@28 boolType)) (= (type b@@15) (MapType2Type T@@28 boolType))) (U_2_bool (MapType2Select b@@15 y@@4))) (U_2_bool (MapType2Select (|Set#Union| a@@18 b@@15) y@@4))))
 :qid |stdinbpl.505:18|
 :skolemid |36|
 :pattern ( (|Set#Union| a@@18 b@@15) (MapType2Select b@@15 y@@4))
)))
(assert (forall ((ms T@U) (x@@10 T@U) ) (! (let ((T@@29 (type x@@10)))
 (=> (= (type ms) (MultiSetType T@@29)) (>= (|MultiSet#Select| ms x@@10) 0)))
 :qid |stdinbpl.580:18|
 :skolemid |56|
 :pattern ( (|MultiSet#Select| ms x@@10))
)))
(assert (forall ((a@@19 T@U) (x@@11 T@U) (o@@5 T@U) ) (! (let ((T@@30 (type x@@11)))
 (=> (and (= (type a@@19) (MapType2Type T@@30 boolType)) (= (type o@@5) T@@30)) (= (U_2_bool (MapType2Select (|Set#UnionOne| a@@19 x@@11) o@@5))  (or (= o@@5 x@@11) (U_2_bool (MapType2Select a@@19 o@@5))))))
 :qid |stdinbpl.489:18|
 :skolemid |29|
 :pattern ( (MapType2Select (|Set#UnionOne| a@@19 x@@11) o@@5))
)))
(assert (forall ((a@@20 T@U) (b@@16 T@U) (y@@5 T@U) ) (! (let ((T@@31 (type y@@5)))
 (=> (and (and (= (type a@@20) (MapType2Type T@@31 boolType)) (= (type b@@16) (MapType2Type T@@31 boolType))) (U_2_bool (MapType2Select b@@16 y@@5))) (not (U_2_bool (MapType2Select (|Set#Difference| a@@20 b@@16) y@@5)))))
 :qid |stdinbpl.530:18|
 :skolemid |44|
 :pattern ( (|Set#Difference| a@@20 b@@16) (MapType2Select b@@16 y@@5))
)))
(assert (forall ((arg0@@53 Int) (arg1@@29 Int) ) (! (= (type (|sk_$$#condqp1| arg0@@53 arg1@@29)) RefType)
 :qid |funType:sk_$$#condqp1|
 :pattern ( (|sk_$$#condqp1| arg0@@53 arg1@@29))
)))
(assert (forall ((Heap2Heap T@U) (Heap1Heap T@U) (refs@@4 T@U) ) (!  (=> (and (and (and (= (type Heap2Heap) (MapType0Type RefType)) (= (type Heap1Heap) (MapType0Type RefType))) (= (type refs@@4) (MapType2Type RefType boolType))) (and (=  (and (U_2_bool (MapType2Select refs@@4 (|sk_$$#condqp1| (|$$#condqp1| Heap2Heap refs@@4) (|$$#condqp1| Heap1Heap refs@@4)))) (< NoPerm (/ (to_real 1) (to_real 2))))  (and (U_2_bool (MapType2Select refs@@4 (|sk_$$#condqp1| (|$$#condqp1| Heap2Heap refs@@4) (|$$#condqp1| Heap1Heap refs@@4)))) (< NoPerm (/ (to_real 1) (to_real 2))))) (=> (and (U_2_bool (MapType2Select refs@@4 (|sk_$$#condqp1| (|$$#condqp1| Heap2Heap refs@@4) (|$$#condqp1| Heap1Heap refs@@4)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (= (MapType0Select Heap2Heap (|sk_$$#condqp1| (|$$#condqp1| Heap2Heap refs@@4) (|$$#condqp1| Heap1Heap refs@@4)) next) (MapType0Select Heap1Heap (|sk_$$#condqp1| (|$$#condqp1| Heap2Heap refs@@4) (|$$#condqp1| Heap1Heap refs@@4)) next))))) (= (|$$#condqp1| Heap2Heap refs@@4) (|$$#condqp1| Heap1Heap refs@@4)))
 :qid |stdinbpl.841:15|
 :skolemid |102|
 :pattern ( (|$$#condqp1| Heap2Heap refs@@4) (|$$#condqp1| Heap1Heap refs@@4) (succHeapTrans Heap2Heap Heap1Heap))
)))
(assert (forall ((a@@21 T@U) (b@@17 T@U) ) (! (let ((T@@32 (MapType2TypeInv0 (type a@@21))))
 (=> (and (= (type a@@21) (MapType2Type T@@32 boolType)) (= (type b@@17) (MapType2Type T@@32 boolType))) (and (= (+ (+ (|Set#Card| (|Set#Difference| a@@21 b@@17)) (|Set#Card| (|Set#Difference| b@@17 a@@21))) (|Set#Card| (|Set#Intersection| a@@21 b@@17))) (|Set#Card| (|Set#Union| a@@21 b@@17))) (= (|Set#Card| (|Set#Difference| a@@21 b@@17)) (- (|Set#Card| a@@21) (|Set#Card| (|Set#Intersection| a@@21 b@@17)))))))
 :qid |stdinbpl.532:18|
 :skolemid |45|
 :pattern ( (|Set#Card| (|Set#Difference| a@@21 b@@17)))
)))
(assert (forall ((s T@U) ) (! (let ((T@@33 (MapType2TypeInv0 (type s))))
 (=> (= (type s) (MapType2Type T@@33 boolType)) (<= 0 (|Set#Card| s))))
 :qid |stdinbpl.475:18|
 :skolemid |22|
 :pattern ( (|Set#Card| s))
)))
(assert (forall ((s@@0 T@U) ) (! (let ((T@@34 (MultiSetTypeInv0 (type s@@0))))
 (=> (= (type s@@0) (MultiSetType T@@34)) (<= 0 (|MultiSet#Card| s@@0))))
 :qid |stdinbpl.583:18|
 :skolemid |57|
 :pattern ( (|MultiSet#Card| s@@0))
)))
(assert (forall ((T@@35 T@T) ) (! (= (type (|MultiSet#Empty| T@@35)) (MultiSetType T@@35))
 :qid |funType:MultiSet#Empty|
 :pattern ( (|MultiSet#Empty| T@@35))
)))
(assert (forall ((o@@6 T@U) ) (! (let ((T@@36 (type o@@6)))
(= (|MultiSet#Select| (|MultiSet#Empty| T@@36) o@@6) 0))
 :qid |stdinbpl.588:18|
 :skolemid |58|
 :pattern ( (let ((T@@36 (type o@@6)))
(|MultiSet#Select| (|MultiSet#Empty| T@@36) o@@6)))
)))
(assert (forall ((a@@22 T@U) (x@@12 T@U) ) (! (let ((T@@37 (type x@@12)))
 (=> (= (type a@@22) (MapType2Type T@@37 boolType)) (U_2_bool (MapType2Select (|Set#UnionOne| a@@22 x@@12) x@@12))))
 :qid |stdinbpl.491:18|
 :skolemid |30|
 :pattern ( (|Set#UnionOne| a@@22 x@@12))
)))
(assert (forall ((EG_1@@6 T@U) ) (!  (=> (= (type EG_1@@6) (MapType2Type EdgeDomainTypeType boolType)) (= (unshared_graph EG_1@@6) (forall ((v1 T@U) (v2 T@U) (v_2@@2 T@U) ) (!  (=> (and (and (and (= (type v1) RefType) (= (type v2) RefType)) (= (type v_2@@2) RefType)) (and (edge EG_1@@6 v1 v_2@@2) (edge EG_1@@6 v2 v_2@@2))) (= v1 v2))
 :qid |stdinbpl.783:43|
 :skolemid |95|
 :pattern ( (edge EG_1@@6 v1 v_2@@2) (edge EG_1@@6 v2 v_2@@2))
))))
 :qid |stdinbpl.781:15|
 :skolemid |96|
 :pattern ( (unshared_graph EG_1@@6))
)))
(assert (forall ((EG_1@@7 T@U) ) (!  (=> (= (type EG_1@@7) (MapType2Type EdgeDomainTypeType boolType)) (= (func_graph EG_1@@7) (forall ((v1@@0 T@U) (v2@@0 T@U) (v_2@@3 T@U) ) (!  (=> (and (and (and (= (type v1@@0) RefType) (= (type v2@@0) RefType)) (= (type v_2@@3) RefType)) (and (edge EG_1@@7 v_2@@3 v1@@0) (edge EG_1@@7 v_2@@3 v2@@0))) (= v1@@0 v2@@0))
 :qid |stdinbpl.792:39|
 :skolemid |97|
 :pattern ( (edge EG_1@@7 v_2@@3 v1@@0) (edge EG_1@@7 v_2@@3 v2@@0))
))))
 :qid |stdinbpl.790:15|
 :skolemid |98|
 :pattern ( (func_graph EG_1@@7))
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
 :qid |stdinbpl.495:18|
 :skolemid |32|
 :pattern ( (|Set#Card| (|Set#UnionOne| a@@23 x@@13)))
)))
(assert (forall ((a@@24 T@U) (x@@14 T@U) ) (! (let ((T@@39 (type x@@14)))
 (=> (= (type a@@24) (MultiSetType T@@39)) (and (> (|MultiSet#Select| (|MultiSet#UnionOne| a@@24 x@@14) x@@14) 0) (> (|MultiSet#Card| (|MultiSet#UnionOne| a@@24 x@@14)) 0))))
 :qid |stdinbpl.607:18|
 :skolemid |66|
 :pattern ( (|MultiSet#UnionOne| a@@24 x@@14))
)))
(assert (forall ((r@@1 T@U) ) (! (= (|Set#Card| (|Set#Singleton| r@@1)) 1)
 :qid |stdinbpl.486:18|
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
 :qid |stdinbpl.484:18|
 :skolemid |26|
 :pattern ( (|Set#Singleton| r@@2))
)))
(assert (forall ((Heap@@15 T@U) (Mask@@14 T@U) (g0@@2 T@U) (g1@@2 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@15) (MapType0Type RefType)) (= (type Mask@@14) (MapType1Type RefType realType))) (= (type g0@@2) (MapType2Type RefType boolType))) (= (type g1@@2) (MapType2Type RefType boolType))) (and (state Heap@@15 Mask@@14) (or (< AssumeFunctionsAbove 0) (|apply_TCFraming#trigger| (CombineFrames (FrameFragment (int_2_U (|apply_TCFraming#condqp2| Heap@@15 g0@@2 g1@@2))) (FrameFragment (int_2_U (|apply_TCFraming#condqp3| Heap@@15 g0@@2 g1@@2)))) g0@@2 g1@@2)))) (|Set#Equal| (|Set#Intersection| g1@@2 g0@@2) (|Set#Empty| RefType))) (forall ((u_1@@1 T@U) (v_2@@4 T@U) ) (!  (=> (and (and (= (type u_1@@1) RefType) (= (type v_2@@4) RefType)) (and (U_2_bool (MapType2Select g0@@2 u_1@@1)) (and (U_2_bool (MapType2Select g0@@2 v_2@@4)) (exists_path ($$ Heap@@15 g0@@2) u_1@@1 v_2@@4)))) (exists_path ($$ Heap@@15 (|Set#Union| g0@@2 g1@@2)) u_1@@1 v_2@@4))
 :qid |stdinbpl.1025:285|
 :skolemid |125|
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| Heap@@15 g0@@2))) g0@@2) u_1@@1 v_2@@4))
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| Heap@@15 (|Set#Union| g0@@2 g1@@2)))) (|Set#Union| g0@@2 g1@@2)) u_1@@1 v_2@@4))
)))
 :qid |stdinbpl.1023:15|
 :skolemid |126|
 :pattern ( (state Heap@@15 Mask@@14) (|apply_TCFraming'| Heap@@15 g0@@2 g1@@2))
)))
(assert (forall ((Heap@@16 T@U) (Mask@@15 T@U) (g0@@3 T@U) (g1@@3 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@16) (MapType0Type RefType)) (= (type Mask@@15) (MapType1Type RefType realType))) (= (type g0@@3) (MapType2Type RefType boolType))) (= (type g1@@3) (MapType2Type RefType boolType))) (and (state Heap@@16 Mask@@15) (or (< AssumeFunctionsAbove 0) (|apply_TCFraming#trigger| (CombineFrames (FrameFragment (int_2_U (|apply_TCFraming#condqp2| Heap@@16 g0@@3 g1@@3))) (FrameFragment (int_2_U (|apply_TCFraming#condqp3| Heap@@16 g0@@3 g1@@3)))) g0@@3 g1@@3)))) (|Set#Equal| (|Set#Intersection| g1@@3 g0@@3) (|Set#Empty| RefType))) (forall ((u_1_1@@0 T@U) (v_1_1@@0 T@U) ) (!  (=> (and (and (= (type u_1_1@@0) RefType) (= (type v_1_1@@0) RefType)) (and (U_2_bool (MapType2Select g1@@3 u_1_1@@0)) (and (U_2_bool (MapType2Select g1@@3 v_1_1@@0)) (exists_path ($$ Heap@@16 g1@@3) u_1_1@@0 v_1_1@@0)))) (exists_path ($$ Heap@@16 (|Set#Union| g1@@3 g0@@3)) u_1_1@@0 v_1_1@@0))
 :qid |stdinbpl.1032:285|
 :skolemid |127|
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| Heap@@16 g1@@3))) g1@@3) u_1_1@@0 v_1_1@@0))
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| Heap@@16 (|Set#Union| g1@@3 g0@@3)))) (|Set#Union| g1@@3 g0@@3)) u_1_1@@0 v_1_1@@0))
)))
 :qid |stdinbpl.1030:15|
 :skolemid |128|
 :pattern ( (state Heap@@16 Mask@@15) (|apply_TCFraming'| Heap@@16 g0@@3 g1@@3))
)))
(assert (forall ((a@@25 T@U) (b@@18 T@U) ) (! (let ((T@@40 (MapType2TypeInv0 (type a@@25))))
 (=> (and (= (type a@@25) (MapType2Type T@@40 boolType)) (= (type b@@18) (MapType2Type T@@40 boolType))) (= (|Set#Union| a@@25 (|Set#Union| a@@25 b@@18)) (|Set#Union| a@@25 b@@18))))
 :qid |stdinbpl.518:18|
 :skolemid |39|
 :pattern ( (|Set#Union| a@@25 (|Set#Union| a@@25 b@@18)))
)))
(assert (forall ((a@@26 T@U) (b@@19 T@U) ) (! (let ((T@@41 (MapType2TypeInv0 (type a@@26))))
 (=> (and (= (type a@@26) (MapType2Type T@@41 boolType)) (= (type b@@19) (MapType2Type T@@41 boolType))) (= (|Set#Intersection| a@@26 (|Set#Intersection| a@@26 b@@19)) (|Set#Intersection| a@@26 b@@19))))
 :qid |stdinbpl.522:18|
 :skolemid |41|
 :pattern ( (|Set#Intersection| a@@26 (|Set#Intersection| a@@26 b@@19)))
)))
(assert (forall ((a@@27 T@U) (b@@20 T@U) ) (! (let ((T@@42 (MultiSetTypeInv0 (type a@@27))))
 (=> (and (= (type a@@27) (MultiSetType T@@42)) (= (type b@@20) (MultiSetType T@@42))) (= (|MultiSet#Intersection| a@@27 (|MultiSet#Intersection| a@@27 b@@20)) (|MultiSet#Intersection| a@@27 b@@20))))
 :qid |stdinbpl.624:18|
 :skolemid |71|
 :pattern ( (|MultiSet#Intersection| a@@27 (|MultiSet#Intersection| a@@27 b@@20)))
)))
(assert (forall ((s@@1 T@U) ) (! (let ((T@@43 (MultiSetTypeInv0 (type s@@1))))
 (=> (= (type s@@1) (MultiSetType T@@43)) (and (= (= (|MultiSet#Card| s@@1) 0) (= s@@1 (|MultiSet#Empty| T@@43))) (=> (not (= (|MultiSet#Card| s@@1) 0)) (exists ((x@@15 T@U) ) (!  (and (= (type x@@15) T@@43) (< 0 (|MultiSet#Select| s@@1 x@@15)))
 :qid |stdinbpl.591:38|
 :skolemid |59|
 :no-pattern (type x@@15)
 :no-pattern (U_2_int x@@15)
 :no-pattern (U_2_bool x@@15)
))))))
 :qid |stdinbpl.589:18|
 :skolemid |60|
 :pattern ( (|MultiSet#Card| s@@1))
)))
(assert (forall ((r@@3 T@U) (o@@7 T@U) ) (! (let ((T@@44 (type r@@3)))
 (=> (= (type o@@7) T@@44) (and (= (= (|MultiSet#Select| (|MultiSet#Singleton| r@@3) o@@7) 1) (= r@@3 o@@7)) (= (= (|MultiSet#Select| (|MultiSet#Singleton| r@@3) o@@7) 0) (not (= r@@3 o@@7))))))
 :qid |stdinbpl.594:18|
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
 :qid |stdinbpl.612:18|
 :skolemid |67|
 :pattern ( (|MultiSet#Select| (|MultiSet#Union| a@@28 b@@21) o@@9))
 :pattern ( (|MultiSet#Union| a@@28 b@@21) (|MultiSet#Select| a@@28 o@@9) (|MultiSet#Select| b@@21 o@@9))
)))
(assert (forall ((o@@10 T@U) ) (! (let ((T@@46 (type o@@10)))
 (not (U_2_bool (MapType2Select (|Set#Empty| T@@46) o@@10))))
 :qid |stdinbpl.478:18|
 :skolemid |23|
 :pattern ( (let ((T@@46 (type o@@10)))
(MapType2Select (|Set#Empty| T@@46) o@@10)))
)))
(assert (forall ((r@@4 T@U) ) (! (let ((T@@47 (type r@@4)))
(= (|MultiSet#Singleton| r@@4) (|MultiSet#UnionOne| (|MultiSet#Empty| T@@47) r@@4)))
 :qid |stdinbpl.597:18|
 :skolemid |63|
 :pattern ( (|MultiSet#Singleton| r@@4))
)))
(assert (forall ((a@@29 Int) (b@@22 Int) ) (! (= (<= a@@29 b@@22) (= (|Math#min| a@@29 b@@22) a@@29))
 :qid |stdinbpl.562:15|
 :skolemid |51|
 :pattern ( (|Math#min| a@@29 b@@22))
)))
(assert (forall ((a@@30 Int) (b@@23 Int) ) (! (= (<= b@@23 a@@30) (= (|Math#min| a@@30 b@@23) b@@23))
 :qid |stdinbpl.563:15|
 :skolemid |52|
 :pattern ( (|Math#min| a@@30 b@@23))
)))
(assert (forall ((s@@2 T@U) ) (! (let ((T@@48 (MapType2TypeInv0 (type s@@2))))
 (=> (= (type s@@2) (MapType2Type T@@48 boolType)) (and (= (= (|Set#Card| s@@2) 0) (= s@@2 (|Set#Empty| T@@48))) (=> (not (= (|Set#Card| s@@2) 0)) (exists ((x@@16 T@U) ) (!  (and (= (type x@@16) T@@48) (U_2_bool (MapType2Select s@@2 x@@16)))
 :qid |stdinbpl.481:33|
 :skolemid |24|
 :no-pattern (type x@@16)
 :no-pattern (U_2_int x@@16)
 :no-pattern (U_2_bool x@@16)
))))))
 :qid |stdinbpl.479:18|
 :skolemid |25|
 :pattern ( (|Set#Card| s@@2))
)))
(assert (forall ((Heap@@18 T@U) (Mask@@16 T@U) (g0@@4 T@U) (g1@@4 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@18) (MapType0Type RefType)) (= (type Mask@@16) (MapType1Type RefType realType))) (= (type g0@@4) (MapType2Type RefType boolType))) (= (type g1@@4) (MapType2Type RefType boolType))) (and (state Heap@@18 Mask@@16) (or (< AssumeFunctionsAbove 0) (|apply_TCFraming#trigger| (CombineFrames (FrameFragment (int_2_U (|apply_TCFraming#condqp2| Heap@@18 g0@@4 g1@@4))) (FrameFragment (int_2_U (|apply_TCFraming#condqp3| Heap@@18 g0@@4 g1@@4)))) g0@@4 g1@@4)))) (|Set#Equal| (|Set#Intersection| g1@@4 g0@@4) (|Set#Empty| RefType))) (|Set#Equal| (|Set#Union| g0@@4 g1@@4) (|Set#Union| g1@@4 g0@@4)))
 :qid |stdinbpl.1019:15|
 :skolemid |124|
 :pattern ( (state Heap@@18 Mask@@16) (|apply_TCFraming'| Heap@@18 g0@@4 g1@@4))
)))
(assert (forall ((Heap@@19 T@U) (Mask@@17 T@U) (refs@@5 T@U) ) (!  (=> (and (and (and (= (type Heap@@19) (MapType0Type RefType)) (= (type Mask@@17) (MapType1Type RefType realType))) (= (type refs@@5) (MapType2Type RefType boolType))) (state Heap@@19 Mask@@17)) (= (|$$'| Heap@@19 refs@@5) (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| Heap@@19 refs@@5))) refs@@5)))
 :qid |stdinbpl.831:15|
 :skolemid |101|
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
 :qid |stdinbpl.541:32|
 :skolemid |46|
 :pattern ( (MapType2Select a@@31 o@@12))
 :pattern ( (MapType2Select b@@24 o@@12))
)))))
 :qid |stdinbpl.540:17|
 :skolemid |47|
 :pattern ( (|Set#Subset| a@@31 b@@24))
)))
(assert (forall ((a@@32 T@U) (x@@17 T@U) ) (! (let ((T@@50 (type x@@17)))
 (=> (and (= (type a@@32) (MapType2Type T@@50 boolType)) (not (U_2_bool (MapType2Select a@@32 x@@17)))) (= (|Set#Card| (|Set#UnionOne| a@@32 x@@17)) (+ (|Set#Card| a@@32) 1))))
 :qid |stdinbpl.497:18|
 :skolemid |33|
 :pattern ( (|Set#Card| (|Set#UnionOne| a@@32 x@@17)))
)))
(assert (forall ((a@@33 T@U) (b@@25 T@U) (o@@13 T@U) ) (! (let ((T@@51 (type o@@13)))
 (=> (and (= (type a@@33) (MultiSetType T@@51)) (= (type b@@25) (MultiSetType T@@51))) (= (|MultiSet#Select| (|MultiSet#Difference| a@@33 b@@25) o@@13) (|Math#clip| (- (|MultiSet#Select| a@@33 o@@13) (|MultiSet#Select| b@@25 o@@13))))))
 :qid |stdinbpl.629:18|
 :skolemid |72|
 :pattern ( (|MultiSet#Select| (|MultiSet#Difference| a@@33 b@@25) o@@13))
)))
(assert (forall ((arg0@@54 Int) (arg1@@30 Int) ) (! (= (type (|sk_apply_TCFraming#condqp2| arg0@@54 arg1@@30)) RefType)
 :qid |funType:sk_apply_TCFraming#condqp2|
 :pattern ( (|sk_apply_TCFraming#condqp2| arg0@@54 arg1@@30))
)))
(assert (forall ((Heap2Heap@@0 T@U) (Heap1Heap@@0 T@U) (g0@@5 T@U) (g1@@5 T@U) ) (!  (=> (and (and (and (and (= (type Heap2Heap@@0) (MapType0Type RefType)) (= (type Heap1Heap@@0) (MapType0Type RefType))) (= (type g0@@5) (MapType2Type RefType boolType))) (= (type g1@@5) (MapType2Type RefType boolType))) (and (=  (and (U_2_bool (MapType2Select g0@@5 (|sk_apply_TCFraming#condqp2| (|apply_TCFraming#condqp2| Heap2Heap@@0 g0@@5 g1@@5) (|apply_TCFraming#condqp2| Heap1Heap@@0 g0@@5 g1@@5)))) (< NoPerm FullPerm))  (and (U_2_bool (MapType2Select g0@@5 (|sk_apply_TCFraming#condqp2| (|apply_TCFraming#condqp2| Heap2Heap@@0 g0@@5 g1@@5) (|apply_TCFraming#condqp2| Heap1Heap@@0 g0@@5 g1@@5)))) (< NoPerm FullPerm))) (=> (and (U_2_bool (MapType2Select g0@@5 (|sk_apply_TCFraming#condqp2| (|apply_TCFraming#condqp2| Heap2Heap@@0 g0@@5 g1@@5) (|apply_TCFraming#condqp2| Heap1Heap@@0 g0@@5 g1@@5)))) (< NoPerm FullPerm)) (= (MapType0Select Heap2Heap@@0 (|sk_apply_TCFraming#condqp2| (|apply_TCFraming#condqp2| Heap2Heap@@0 g0@@5 g1@@5) (|apply_TCFraming#condqp2| Heap1Heap@@0 g0@@5 g1@@5)) next) (MapType0Select Heap1Heap@@0 (|sk_apply_TCFraming#condqp2| (|apply_TCFraming#condqp2| Heap2Heap@@0 g0@@5 g1@@5) (|apply_TCFraming#condqp2| Heap1Heap@@0 g0@@5 g1@@5)) next))))) (= (|apply_TCFraming#condqp2| Heap2Heap@@0 g0@@5 g1@@5) (|apply_TCFraming#condqp2| Heap1Heap@@0 g0@@5 g1@@5)))
 :qid |stdinbpl.1003:15|
 :skolemid |122|
 :pattern ( (|apply_TCFraming#condqp2| Heap2Heap@@0 g0@@5 g1@@5) (|apply_TCFraming#condqp2| Heap1Heap@@0 g0@@5 g1@@5) (succHeapTrans Heap2Heap@@0 Heap1Heap@@0))
)))
(assert (forall ((arg0@@55 Int) (arg1@@31 Int) ) (! (= (type (|sk_apply_TCFraming#condqp3| arg0@@55 arg1@@31)) RefType)
 :qid |funType:sk_apply_TCFraming#condqp3|
 :pattern ( (|sk_apply_TCFraming#condqp3| arg0@@55 arg1@@31))
)))
(assert (forall ((Heap2Heap@@1 T@U) (Heap1Heap@@1 T@U) (g0@@6 T@U) (g1@@6 T@U) ) (!  (=> (and (and (and (and (= (type Heap2Heap@@1) (MapType0Type RefType)) (= (type Heap1Heap@@1) (MapType0Type RefType))) (= (type g0@@6) (MapType2Type RefType boolType))) (= (type g1@@6) (MapType2Type RefType boolType))) (and (=  (and (U_2_bool (MapType2Select g1@@6 (|sk_apply_TCFraming#condqp3| (|apply_TCFraming#condqp3| Heap2Heap@@1 g0@@6 g1@@6) (|apply_TCFraming#condqp3| Heap1Heap@@1 g0@@6 g1@@6)))) (< NoPerm FullPerm))  (and (U_2_bool (MapType2Select g1@@6 (|sk_apply_TCFraming#condqp3| (|apply_TCFraming#condqp3| Heap2Heap@@1 g0@@6 g1@@6) (|apply_TCFraming#condqp3| Heap1Heap@@1 g0@@6 g1@@6)))) (< NoPerm FullPerm))) (=> (and (U_2_bool (MapType2Select g1@@6 (|sk_apply_TCFraming#condqp3| (|apply_TCFraming#condqp3| Heap2Heap@@1 g0@@6 g1@@6) (|apply_TCFraming#condqp3| Heap1Heap@@1 g0@@6 g1@@6)))) (< NoPerm FullPerm)) (= (MapType0Select Heap2Heap@@1 (|sk_apply_TCFraming#condqp3| (|apply_TCFraming#condqp3| Heap2Heap@@1 g0@@6 g1@@6) (|apply_TCFraming#condqp3| Heap1Heap@@1 g0@@6 g1@@6)) next) (MapType0Select Heap1Heap@@1 (|sk_apply_TCFraming#condqp3| (|apply_TCFraming#condqp3| Heap2Heap@@1 g0@@6 g1@@6) (|apply_TCFraming#condqp3| Heap1Heap@@1 g0@@6 g1@@6)) next))))) (= (|apply_TCFraming#condqp3| Heap2Heap@@1 g0@@6 g1@@6) (|apply_TCFraming#condqp3| Heap1Heap@@1 g0@@6 g1@@6)))
 :qid |stdinbpl.1013:15|
 :skolemid |123|
 :pattern ( (|apply_TCFraming#condqp3| Heap2Heap@@1 g0@@6 g1@@6) (|apply_TCFraming#condqp3| Heap1Heap@@1 g0@@6 g1@@6) (succHeapTrans Heap2Heap@@1 Heap1Heap@@1))
)))
(assert (forall ((Heap@@21 T@U) (Mask@@18 T@U) (g0@@7 T@U) (g1@@7 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@21) (MapType0Type RefType)) (= (type Mask@@18) (MapType1Type RefType realType))) (= (type g0@@7) (MapType2Type RefType boolType))) (= (type g1@@7) (MapType2Type RefType boolType))) (state Heap@@21 Mask@@18)) (= (|apply_TCFraming'| Heap@@21 g0@@7 g1@@7) (|apply_TCFraming#frame| (CombineFrames (FrameFragment (int_2_U (|apply_TCFraming#condqp2| Heap@@21 g0@@7 g1@@7))) (FrameFragment (int_2_U (|apply_TCFraming#condqp3| Heap@@21 g0@@7 g1@@7)))) g0@@7 g1@@7)))
 :qid |stdinbpl.993:15|
 :skolemid |121|
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
 :qid |stdinbpl.457:25|
 :skolemid |20|
 :pattern ( (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r@@5 u))
)))
(assert (forall ((a@@34 Int) ) (!  (=> (< a@@34 0) (= (|Math#clip| a@@34) 0))
 :qid |stdinbpl.568:15|
 :skolemid |55|
 :pattern ( (|Math#clip| a@@34))
)))
(assert (forall ((EG_1@@8 T@U) ) (!  (=> (= (type EG_1@@8) (MapType2Type EdgeDomainTypeType boolType)) (= (acyclic_graph EG_1@@8) (forall ((v1@@1 T@U) (v2@@1 T@U) ) (!  (=> (and (= (type v1@@1) RefType) (= (type v2@@1) RefType)) (or (not (edge EG_1@@8 v1@@1 v2@@1)) (not (exists_path EG_1@@8 v2@@1 v1@@1))))
 :qid |stdinbpl.774:42|
 :skolemid |93|
 :pattern ( (edge EG_1@@8 v1@@1 v2@@1))
 :pattern ( (exists_path EG_1@@8 v2@@1 v1@@1))
))))
 :qid |stdinbpl.772:15|
 :skolemid |94|
 :pattern ( (acyclic_graph EG_1@@8))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
(assert (forall ((a@@35 T@U) (x@@18 T@U) (o@@14 T@U) ) (! (let ((T@@52 (type x@@18)))
 (=> (and (= (type a@@35) (MultiSetType T@@52)) (= (type o@@14) T@@52)) (= (|MultiSet#Select| (|MultiSet#UnionOne| a@@35 x@@18) o@@14) (ite (= x@@18 o@@14) (+ (|MultiSet#Select| a@@35 o@@14) 1) (|MultiSet#Select| a@@35 o@@14)))))
 :qid |stdinbpl.601:18|
 :skolemid |64|
 :pattern ( (|MultiSet#Select| (|MultiSet#UnionOne| a@@35 x@@18) o@@14))
 :pattern ( (|MultiSet#UnionOne| a@@35 x@@18) (|MultiSet#Select| a@@35 o@@14))
)))
(assert (forall ((a@@36 T@U) (b@@26 T@U) ) (! (let ((T@@53 (MultiSetTypeInv0 (type a@@36))))
 (=> (and (= (type a@@36) (MultiSetType T@@53)) (= (type b@@26) (MultiSetType T@@53))) (= (|MultiSet#Equal| a@@36 b@@26) (forall ((o@@15 T@U) ) (!  (=> (= (type o@@15) T@@53) (= (|MultiSet#Select| a@@36 o@@15) (|MultiSet#Select| b@@26 o@@15)))
 :qid |stdinbpl.647:36|
 :skolemid |77|
 :pattern ( (|MultiSet#Select| a@@36 o@@15))
 :pattern ( (|MultiSet#Select| b@@26 o@@15))
)))))
 :qid |stdinbpl.646:17|
 :skolemid |78|
 :pattern ( (|MultiSet#Equal| a@@36 b@@26))
)))
(assert (forall ((a@@37 T@U) (b@@27 T@U) ) (! (let ((T@@54 (MultiSetTypeInv0 (type a@@37))))
 (=> (and (= (type a@@37) (MultiSetType T@@54)) (= (type b@@27) (MultiSetType T@@54))) (= (|MultiSet#Subset| a@@37 b@@27) (forall ((o@@16 T@U) ) (!  (=> (= (type o@@16) T@@54) (<= (|MultiSet#Select| a@@37 o@@16) (|MultiSet#Select| b@@27 o@@16)))
 :qid |stdinbpl.643:37|
 :skolemid |75|
 :pattern ( (|MultiSet#Select| a@@37 o@@16))
 :pattern ( (|MultiSet#Select| b@@27 o@@16))
)))))
 :qid |stdinbpl.642:17|
 :skolemid |76|
 :pattern ( (|MultiSet#Subset| a@@37 b@@27))
)))
(assert (forall ((a@@38 T@U) (b@@28 T@U) (o@@17 T@U) ) (! (let ((T@@55 (type o@@17)))
 (=> (and (= (type a@@38) (MapType2Type T@@55 boolType)) (= (type b@@28) (MapType2Type T@@55 boolType))) (= (U_2_bool (MapType2Select (|Set#Union| a@@38 b@@28) o@@17))  (or (U_2_bool (MapType2Select a@@38 o@@17)) (U_2_bool (MapType2Select b@@28 o@@17))))))
 :qid |stdinbpl.501:18|
 :skolemid |34|
 :pattern ( (MapType2Select (|Set#Union| a@@38 b@@28) o@@17))
)))
(assert (forall ((Heap@@22 T@U) (g0@@8 T@U) (g1@@8 T@U) ) (!  (=> (and (and (= (type Heap@@22) (MapType0Type RefType)) (= (type g0@@8) (MapType2Type RefType boolType))) (= (type g1@@8) (MapType2Type RefType boolType))) (and (= (apply_TCFraming Heap@@22 g0@@8 g1@@8) (|apply_TCFraming'| Heap@@22 g0@@8 g1@@8)) (dummyFunction (bool_2_U (|apply_TCFraming#triggerStateless| g0@@8 g1@@8)))))
 :qid |stdinbpl.982:15|
 :skolemid |119|
 :pattern ( (apply_TCFraming Heap@@22 g0@@8 g1@@8))
)))
(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun Heap@@23 () T@U)
(declare-fun QPMask@4 () T@U)
(declare-fun g () T@U)
(declare-fun neverTriggered56 (T@U) Bool)
(declare-fun QPMask@0 () T@U)
(declare-fun PostHeap@0 () T@U)
(declare-fun QPMask@3 () T@U)
(declare-fun neverTriggered55 (T@U) Bool)
(declare-fun QPMask@2 () T@U)
(declare-fun v1_8 () T@U)
(declare-fun x_1@@0 () T@U)
(declare-fun v2_8 () T@U)
(declare-fun QPMask@20 () T@U)
(declare-fun neverTriggered58 (T@U) Bool)
(declare-fun QPMask@19 () T@U)
(declare-fun neverTriggered57 (T@U) Bool)
(declare-fun QPMask@10 () T@U)
(declare-fun neverTriggered72 (T@U) Bool)
(declare-fun QPMask@9 () T@U)
(declare-fun neverTriggered71 (T@U) Bool)
(declare-fun QPMask@8 () T@U)
(declare-fun neverTriggered70 (T@U) Bool)
(declare-fun QPMask@7 () T@U)
(declare-fun neverTriggered69 (T@U) Bool)
(declare-fun QPMask@6 () T@U)
(declare-fun neverTriggered68 (T@U) Bool)
(declare-fun v_12 () T@U)
(declare-fun u_12 () T@U)
(declare-fun v1_9 () T@U)
(declare-fun QPMask@12 () T@U)
(declare-fun neverTriggered67 (T@U) Bool)
(declare-fun QPMask@11 () T@U)
(declare-fun neverTriggered66 (T@U) Bool)
(declare-fun n_23 () T@U)
(declare-fun QPMask@16 () T@U)
(declare-fun neverTriggered63 (T@U) Bool)
(declare-fun QPMask@18 () T@U)
(declare-fun neverTriggered65 (T@U) Bool)
(declare-fun QPMask@17 () T@U)
(declare-fun neverTriggered64 (T@U) Bool)
(declare-fun QPMask@15 () T@U)
(declare-fun neverTriggered62 (T@U) Bool)
(declare-fun QPMask@14 () T@U)
(declare-fun neverTriggered61 (T@U) Bool)
(declare-fun n_22 () T@U)
(declare-fun v2_9 () T@U)
(declare-fun QPMask@13 () T@U)
(declare-fun neverTriggered60 (T@U) Bool)
(declare-fun QPMask@5 () T@U)
(declare-fun neverTriggered59 (T@U) Bool)
(declare-fun n_21 () T@U)
(declare-fun n$2_5 () T@U)
(declare-fun qpRange54 (T@U) Bool)
(declare-fun invRecv54 (T@U) T@U)
(declare-fun n$0_12 () T@U)
(declare-fun qpRange53 (T@U) Bool)
(declare-fun invRecv53 (T@U) T@U)
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (= (type g) (MapType2Type RefType boolType)) (= (type n$0_12) RefType)) (= (type Heap@@23) (MapType0Type RefType))) (= (type QPMask@0) (MapType1Type RefType realType))) (= (type n$2_5) RefType)) (= (type PostHeap@0) (MapType0Type RefType))) (= (type QPMask@2) (MapType1Type RefType realType))) (= (type n_21) RefType)) (= (type x_1@@0) RefType)) (= (type QPMask@5) (MapType1Type RefType realType))) (= (type v1_9) RefType)) (= (type v2_9) RefType)) (= (type QPMask@13) (MapType1Type RefType realType))) (= (type n_22) RefType)) (= (type QPMask@14) (MapType1Type RefType realType))) (= (type QPMask@15) (MapType1Type RefType realType))) (= (type QPMask@17) (MapType1Type RefType realType))) (= (type QPMask@18) (MapType1Type RefType realType))) (= (type QPMask@16) (MapType1Type RefType realType))) (= (type n_23) RefType)) (= (type QPMask@11) (MapType1Type RefType realType))) (= (type QPMask@12) (MapType1Type RefType realType))) (= (type u_12) RefType)) (= (type v_12) RefType)) (= (type QPMask@6) (MapType1Type RefType realType))) (= (type QPMask@7) (MapType1Type RefType realType))) (= (type QPMask@8) (MapType1Type RefType realType))) (= (type QPMask@9) (MapType1Type RefType realType))) (= (type QPMask@10) (MapType1Type RefType realType))) (= (type QPMask@19) (MapType1Type RefType realType))) (= (type QPMask@20) (MapType1Type RefType realType))) (= (type v1_8) RefType)) (= (type v2_8) RefType)) (= (type QPMask@3) (MapType1Type RefType realType))) (= (type QPMask@4) (MapType1Type RefType realType))) (forall ((arg0@@56 T@U) ) (! (= (type (invRecv54 arg0@@56)) RefType)
 :qid |funType:invRecv54|
 :pattern ( (invRecv54 arg0@@56))
))) (forall ((arg0@@57 T@U) ) (! (= (type (invRecv53 arg0@@57)) RefType)
 :qid |funType:invRecv53|
 :pattern ( (invRecv53 arg0@@57))
))))
(set-info :boogie-vc-id unlink_dags)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 179) (let ((anon130_Then_correct  (and (=> (= (ControlFlow 0 163) (- 0 165)) (forall ((n_5 T@U) ) (!  (=> (= (type n_5) RefType) (=> (and (U_2_bool (MapType2Select g n_5)) (dummyFunction (MapType0Select Heap@@23 n_5 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.4814:23|
 :skolemid |536|
 :pattern ( (MapType0Select Heap@@23 n_5 next))
 :pattern ( (MapType1Select QPMask@4 n_5 next))
 :pattern ( (MapType0Select Heap@@23 n_5 next))
))) (=> (forall ((n_5@@0 T@U) ) (!  (=> (= (type n_5@@0) RefType) (=> (and (U_2_bool (MapType2Select g n_5@@0)) (dummyFunction (MapType0Select Heap@@23 n_5@@0 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.4814:23|
 :skolemid |536|
 :pattern ( (MapType0Select Heap@@23 n_5@@0 next))
 :pattern ( (MapType1Select QPMask@4 n_5@@0 next))
 :pattern ( (MapType0Select Heap@@23 n_5@@0 next))
)) (and (=> (= (ControlFlow 0 163) (- 0 164)) (forall ((n_5@@1 T@U) (n_5_1 T@U) ) (!  (=> (and (= (type n_5@@1) RefType) (= (type n_5_1) RefType)) (=> (and (and (and (and (not (= n_5@@1 n_5_1)) (U_2_bool (MapType2Select g n_5@@1))) (U_2_bool (MapType2Select g n_5_1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_5@@1 n_5_1))))
 :qid |stdinbpl.4821:23|
 :skolemid |537|
 :pattern ( (neverTriggered56 n_5@@1) (neverTriggered56 n_5_1))
))) (=> (forall ((n_5@@2 T@U) (n_5_1@@0 T@U) ) (!  (=> (and (= (type n_5@@2) RefType) (= (type n_5_1@@0) RefType)) (=> (and (and (and (and (not (= n_5@@2 n_5_1@@0)) (U_2_bool (MapType2Select g n_5@@2))) (U_2_bool (MapType2Select g n_5_1@@0))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_5@@2 n_5_1@@0))))
 :qid |stdinbpl.4821:23|
 :skolemid |537|
 :pattern ( (neverTriggered56 n_5@@2) (neverTriggered56 n_5_1@@0))
)) (=> (= (ControlFlow 0 163) (- 0 162)) (forall ((n_5@@3 T@U) ) (!  (=> (and (= (type n_5@@3) RefType) (U_2_bool (MapType2Select g n_5@@3))) (>= (U_2_real (MapType1Select QPMask@0 n_5@@3 next)) (/ (to_real 1) (to_real 2))))
 :qid |stdinbpl.4828:23|
 :skolemid |538|
 :pattern ( (MapType0Select Heap@@23 n_5@@3 next))
 :pattern ( (MapType1Select QPMask@4 n_5@@3 next))
 :pattern ( (MapType0Select Heap@@23 n_5@@3 next))
)))))))))
(let ((anon129_Then_correct  (and (=> (= (ControlFlow 0 159) (- 0 161)) (forall ((n_4 T@U) ) (!  (=> (= (type n_4) RefType) (=> (and (U_2_bool (MapType2Select g n_4)) (dummyFunction (MapType0Select PostHeap@0 n_4 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.4758:23|
 :skolemid |529|
 :pattern ( (MapType0Select PostHeap@0 n_4 next))
 :pattern ( (MapType1Select QPMask@3 n_4 next))
 :pattern ( (MapType0Select PostHeap@0 n_4 next))
))) (=> (forall ((n_4@@0 T@U) ) (!  (=> (= (type n_4@@0) RefType) (=> (and (U_2_bool (MapType2Select g n_4@@0)) (dummyFunction (MapType0Select PostHeap@0 n_4@@0 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.4758:23|
 :skolemid |529|
 :pattern ( (MapType0Select PostHeap@0 n_4@@0 next))
 :pattern ( (MapType1Select QPMask@3 n_4@@0 next))
 :pattern ( (MapType0Select PostHeap@0 n_4@@0 next))
)) (and (=> (= (ControlFlow 0 159) (- 0 160)) (forall ((n_4@@1 T@U) (n_4_1 T@U) ) (!  (=> (and (= (type n_4@@1) RefType) (= (type n_4_1) RefType)) (=> (and (and (and (and (not (= n_4@@1 n_4_1)) (U_2_bool (MapType2Select g n_4@@1))) (U_2_bool (MapType2Select g n_4_1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_4@@1 n_4_1))))
 :qid |stdinbpl.4765:23|
 :skolemid |530|
 :pattern ( (neverTriggered55 n_4@@1) (neverTriggered55 n_4_1))
))) (=> (forall ((n_4@@2 T@U) (n_4_1@@0 T@U) ) (!  (=> (and (= (type n_4@@2) RefType) (= (type n_4_1@@0) RefType)) (=> (and (and (and (and (not (= n_4@@2 n_4_1@@0)) (U_2_bool (MapType2Select g n_4@@2))) (U_2_bool (MapType2Select g n_4_1@@0))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_4@@2 n_4_1@@0))))
 :qid |stdinbpl.4765:23|
 :skolemid |530|
 :pattern ( (neverTriggered55 n_4@@2) (neverTriggered55 n_4_1@@0))
)) (=> (= (ControlFlow 0 159) (- 0 158)) (forall ((n_4@@3 T@U) ) (!  (=> (and (= (type n_4@@3) RefType) (U_2_bool (MapType2Select g n_4@@3))) (>= (U_2_real (MapType1Select QPMask@2 n_4@@3 next)) (/ (to_real 1) (to_real 2))))
 :qid |stdinbpl.4772:23|
 :skolemid |531|
 :pattern ( (MapType0Select PostHeap@0 n_4@@3 next))
 :pattern ( (MapType1Select QPMask@3 n_4@@3 next))
 :pattern ( (MapType0Select PostHeap@0 n_4@@3 next))
)))))))))
(let ((anon36_correct true))
(let ((anon136_Else_correct  (=> (and (not (= v1_8 x_1@@0)) (= (ControlFlow 0 152) 148)) anon36_correct)))
(let ((anon136_Then_correct  (=> (= v1_8 x_1@@0) (and (=> (= (ControlFlow 0 150) (- 0 151)) (HasDirectPerm QPMask@0 x_1@@0 next)) (=> (HasDirectPerm QPMask@0 x_1@@0 next) (=> (= (ControlFlow 0 150) 148) anon36_correct))))))
(let ((anon135_Then_correct  (=> (edge ($$ Heap@@23 g) v1_8 v2_8) (and (=> (= (ControlFlow 0 153) 150) anon136_Then_correct) (=> (= (ControlFlow 0 153) 152) anon136_Else_correct)))))
(let ((anon135_Else_correct  (=> (and (not (edge ($$ Heap@@23 g) v1_8 v2_8)) (= (ControlFlow 0 149) 148)) anon36_correct)))
(let ((anon134_Then_correct  (and (=> (= (ControlFlow 0 145) (- 0 147)) (forall ((n_7 T@U) ) (!  (=> (= (type n_7) RefType) (=> (and (U_2_bool (MapType2Select g n_7)) (dummyFunction (MapType0Select Heap@@23 n_7 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.4935:25|
 :skolemid |550|
 :pattern ( (MapType0Select Heap@@23 n_7 next))
 :pattern ( (MapType1Select QPMask@20 n_7 next))
 :pattern ( (MapType0Select Heap@@23 n_7 next))
))) (=> (forall ((n_7@@0 T@U) ) (!  (=> (= (type n_7@@0) RefType) (=> (and (U_2_bool (MapType2Select g n_7@@0)) (dummyFunction (MapType0Select Heap@@23 n_7@@0 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.4935:25|
 :skolemid |550|
 :pattern ( (MapType0Select Heap@@23 n_7@@0 next))
 :pattern ( (MapType1Select QPMask@20 n_7@@0 next))
 :pattern ( (MapType0Select Heap@@23 n_7@@0 next))
)) (and (=> (= (ControlFlow 0 145) (- 0 146)) (forall ((n_7@@1 T@U) (n_7_1 T@U) ) (!  (=> (and (= (type n_7@@1) RefType) (= (type n_7_1) RefType)) (=> (and (and (and (and (not (= n_7@@1 n_7_1)) (U_2_bool (MapType2Select g n_7@@1))) (U_2_bool (MapType2Select g n_7_1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_7@@1 n_7_1))))
 :qid |stdinbpl.4942:25|
 :skolemid |551|
 :pattern ( (neverTriggered58 n_7@@1) (neverTriggered58 n_7_1))
))) (=> (forall ((n_7@@2 T@U) (n_7_1@@0 T@U) ) (!  (=> (and (= (type n_7@@2) RefType) (= (type n_7_1@@0) RefType)) (=> (and (and (and (and (not (= n_7@@2 n_7_1@@0)) (U_2_bool (MapType2Select g n_7@@2))) (U_2_bool (MapType2Select g n_7_1@@0))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_7@@2 n_7_1@@0))))
 :qid |stdinbpl.4942:25|
 :skolemid |551|
 :pattern ( (neverTriggered58 n_7@@2) (neverTriggered58 n_7_1@@0))
)) (=> (= (ControlFlow 0 145) (- 0 144)) (forall ((n_7@@3 T@U) ) (!  (=> (and (= (type n_7@@3) RefType) (U_2_bool (MapType2Select g n_7@@3))) (>= (U_2_real (MapType1Select QPMask@0 n_7@@3 next)) (/ (to_real 1) (to_real 2))))
 :qid |stdinbpl.4949:25|
 :skolemid |552|
 :pattern ( (MapType0Select Heap@@23 n_7@@3 next))
 :pattern ( (MapType1Select QPMask@20 n_7@@3 next))
 :pattern ( (MapType0Select Heap@@23 n_7@@3 next))
)))))))))
(let ((anon133_Then_correct  (and (=> (= (ControlFlow 0 141) (- 0 143)) (forall ((n_6 T@U) ) (!  (=> (= (type n_6) RefType) (=> (and (U_2_bool (MapType2Select g n_6)) (dummyFunction (MapType0Select PostHeap@0 n_6 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.4879:25|
 :skolemid |543|
 :pattern ( (MapType0Select PostHeap@0 n_6 next))
 :pattern ( (MapType1Select QPMask@19 n_6 next))
 :pattern ( (MapType0Select PostHeap@0 n_6 next))
))) (=> (forall ((n_6@@0 T@U) ) (!  (=> (= (type n_6@@0) RefType) (=> (and (U_2_bool (MapType2Select g n_6@@0)) (dummyFunction (MapType0Select PostHeap@0 n_6@@0 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.4879:25|
 :skolemid |543|
 :pattern ( (MapType0Select PostHeap@0 n_6@@0 next))
 :pattern ( (MapType1Select QPMask@19 n_6@@0 next))
 :pattern ( (MapType0Select PostHeap@0 n_6@@0 next))
)) (and (=> (= (ControlFlow 0 141) (- 0 142)) (forall ((n_6@@1 T@U) (n_6_1 T@U) ) (!  (=> (and (= (type n_6@@1) RefType) (= (type n_6_1) RefType)) (=> (and (and (and (and (not (= n_6@@1 n_6_1)) (U_2_bool (MapType2Select g n_6@@1))) (U_2_bool (MapType2Select g n_6_1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_6@@1 n_6_1))))
 :qid |stdinbpl.4886:25|
 :skolemid |544|
 :pattern ( (neverTriggered57 n_6@@1) (neverTriggered57 n_6_1))
))) (=> (forall ((n_6@@2 T@U) (n_6_1@@0 T@U) ) (!  (=> (and (= (type n_6@@2) RefType) (= (type n_6_1@@0) RefType)) (=> (and (and (and (and (not (= n_6@@2 n_6_1@@0)) (U_2_bool (MapType2Select g n_6@@2))) (U_2_bool (MapType2Select g n_6_1@@0))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_6@@2 n_6_1@@0))))
 :qid |stdinbpl.4886:25|
 :skolemid |544|
 :pattern ( (neverTriggered57 n_6@@2) (neverTriggered57 n_6_1@@0))
)) (=> (= (ControlFlow 0 141) (- 0 140)) (forall ((n_6@@3 T@U) ) (!  (=> (and (= (type n_6@@3) RefType) (U_2_bool (MapType2Select g n_6@@3))) (>= (U_2_real (MapType1Select QPMask@2 n_6@@3 next)) (/ (to_real 1) (to_real 2))))
 :qid |stdinbpl.4893:25|
 :skolemid |545|
 :pattern ( (MapType0Select PostHeap@0 n_6@@3 next))
 :pattern ( (MapType1Select QPMask@19 n_6@@3 next))
 :pattern ( (MapType0Select PostHeap@0 n_6@@3 next))
)))))))))
(let ((anon173_Then_correct  (and (=> (= (ControlFlow 0 118) (- 0 120)) (forall ((n_17 T@U) ) (!  (=> (= (type n_17) RefType) (=> (and (U_2_bool (MapType2Select g n_17)) (dummyFunction (MapType0Select Heap@@23 n_17 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.5755:45|
 :skolemid |651|
 :pattern ( (MapType0Select Heap@@23 n_17 next))
 :pattern ( (MapType1Select QPMask@10 n_17 next))
 :pattern ( (MapType0Select Heap@@23 n_17 next))
))) (=> (forall ((n_17@@0 T@U) ) (!  (=> (= (type n_17@@0) RefType) (=> (and (U_2_bool (MapType2Select g n_17@@0)) (dummyFunction (MapType0Select Heap@@23 n_17@@0 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.5755:45|
 :skolemid |651|
 :pattern ( (MapType0Select Heap@@23 n_17@@0 next))
 :pattern ( (MapType1Select QPMask@10 n_17@@0 next))
 :pattern ( (MapType0Select Heap@@23 n_17@@0 next))
)) (and (=> (= (ControlFlow 0 118) (- 0 119)) (forall ((n_17@@1 T@U) (n_17_1 T@U) ) (!  (=> (and (= (type n_17@@1) RefType) (= (type n_17_1) RefType)) (=> (and (and (and (and (not (= n_17@@1 n_17_1)) (U_2_bool (MapType2Select g n_17@@1))) (U_2_bool (MapType2Select g n_17_1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_17@@1 n_17_1))))
 :qid |stdinbpl.5762:45|
 :skolemid |652|
 :pattern ( (neverTriggered72 n_17@@1) (neverTriggered72 n_17_1))
))) (=> (forall ((n_17@@2 T@U) (n_17_1@@0 T@U) ) (!  (=> (and (= (type n_17@@2) RefType) (= (type n_17_1@@0) RefType)) (=> (and (and (and (and (not (= n_17@@2 n_17_1@@0)) (U_2_bool (MapType2Select g n_17@@2))) (U_2_bool (MapType2Select g n_17_1@@0))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_17@@2 n_17_1@@0))))
 :qid |stdinbpl.5762:45|
 :skolemid |652|
 :pattern ( (neverTriggered72 n_17@@2) (neverTriggered72 n_17_1@@0))
)) (=> (= (ControlFlow 0 118) (- 0 117)) (forall ((n_17@@3 T@U) ) (!  (=> (and (= (type n_17@@3) RefType) (U_2_bool (MapType2Select g n_17@@3))) (>= (U_2_real (MapType1Select QPMask@0 n_17@@3 next)) (/ (to_real 1) (to_real 2))))
 :qid |stdinbpl.5769:45|
 :skolemid |653|
 :pattern ( (MapType0Select Heap@@23 n_17@@3 next))
 :pattern ( (MapType1Select QPMask@10 n_17@@3 next))
 :pattern ( (MapType0Select Heap@@23 n_17@@3 next))
)))))))))
(let ((anon171_Then_correct  (and (=> (= (ControlFlow 0 113) (- 0 115)) (forall ((n_16 T@U) ) (!  (=> (= (type n_16) RefType) (=> (and (U_2_bool (MapType2Select g n_16)) (dummyFunction (MapType0Select Heap@@23 n_16 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.5699:43|
 :skolemid |644|
 :pattern ( (MapType0Select Heap@@23 n_16 next))
 :pattern ( (MapType1Select QPMask@9 n_16 next))
 :pattern ( (MapType0Select Heap@@23 n_16 next))
))) (=> (forall ((n_16@@0 T@U) ) (!  (=> (= (type n_16@@0) RefType) (=> (and (U_2_bool (MapType2Select g n_16@@0)) (dummyFunction (MapType0Select Heap@@23 n_16@@0 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.5699:43|
 :skolemid |644|
 :pattern ( (MapType0Select Heap@@23 n_16@@0 next))
 :pattern ( (MapType1Select QPMask@9 n_16@@0 next))
 :pattern ( (MapType0Select Heap@@23 n_16@@0 next))
)) (and (=> (= (ControlFlow 0 113) (- 0 114)) (forall ((n_16@@1 T@U) (n_16_1 T@U) ) (!  (=> (and (= (type n_16@@1) RefType) (= (type n_16_1) RefType)) (=> (and (and (and (and (not (= n_16@@1 n_16_1)) (U_2_bool (MapType2Select g n_16@@1))) (U_2_bool (MapType2Select g n_16_1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_16@@1 n_16_1))))
 :qid |stdinbpl.5706:43|
 :skolemid |645|
 :pattern ( (neverTriggered71 n_16@@1) (neverTriggered71 n_16_1))
))) (=> (forall ((n_16@@2 T@U) (n_16_1@@0 T@U) ) (!  (=> (and (= (type n_16@@2) RefType) (= (type n_16_1@@0) RefType)) (=> (and (and (and (and (not (= n_16@@2 n_16_1@@0)) (U_2_bool (MapType2Select g n_16@@2))) (U_2_bool (MapType2Select g n_16_1@@0))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_16@@2 n_16_1@@0))))
 :qid |stdinbpl.5706:43|
 :skolemid |645|
 :pattern ( (neverTriggered71 n_16@@2) (neverTriggered71 n_16_1@@0))
)) (=> (= (ControlFlow 0 113) (- 0 112)) (forall ((n_16@@3 T@U) ) (!  (=> (and (= (type n_16@@3) RefType) (U_2_bool (MapType2Select g n_16@@3))) (>= (U_2_real (MapType1Select QPMask@0 n_16@@3 next)) (/ (to_real 1) (to_real 2))))
 :qid |stdinbpl.5713:43|
 :skolemid |646|
 :pattern ( (MapType0Select Heap@@23 n_16@@3 next))
 :pattern ( (MapType1Select QPMask@9 n_16@@3 next))
 :pattern ( (MapType0Select Heap@@23 n_16@@3 next))
)))))))))
(let ((anon169_Then_correct  (and (=> (= (ControlFlow 0 108) (- 0 110)) (forall ((n_15 T@U) ) (!  (=> (= (type n_15) RefType) (=> (and (U_2_bool (MapType2Select g n_15)) (dummyFunction (MapType0Select Heap@@23 n_15 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.5645:41|
 :skolemid |637|
 :pattern ( (MapType0Select Heap@@23 n_15 next))
 :pattern ( (MapType1Select QPMask@8 n_15 next))
 :pattern ( (MapType0Select Heap@@23 n_15 next))
))) (=> (forall ((n_15@@0 T@U) ) (!  (=> (= (type n_15@@0) RefType) (=> (and (U_2_bool (MapType2Select g n_15@@0)) (dummyFunction (MapType0Select Heap@@23 n_15@@0 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.5645:41|
 :skolemid |637|
 :pattern ( (MapType0Select Heap@@23 n_15@@0 next))
 :pattern ( (MapType1Select QPMask@8 n_15@@0 next))
 :pattern ( (MapType0Select Heap@@23 n_15@@0 next))
)) (and (=> (= (ControlFlow 0 108) (- 0 109)) (forall ((n_15@@1 T@U) (n_15_1 T@U) ) (!  (=> (and (= (type n_15@@1) RefType) (= (type n_15_1) RefType)) (=> (and (and (and (and (not (= n_15@@1 n_15_1)) (U_2_bool (MapType2Select g n_15@@1))) (U_2_bool (MapType2Select g n_15_1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_15@@1 n_15_1))))
 :qid |stdinbpl.5652:41|
 :skolemid |638|
 :pattern ( (neverTriggered70 n_15@@1) (neverTriggered70 n_15_1))
))) (=> (forall ((n_15@@2 T@U) (n_15_1@@0 T@U) ) (!  (=> (and (= (type n_15@@2) RefType) (= (type n_15_1@@0) RefType)) (=> (and (and (and (and (not (= n_15@@2 n_15_1@@0)) (U_2_bool (MapType2Select g n_15@@2))) (U_2_bool (MapType2Select g n_15_1@@0))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_15@@2 n_15_1@@0))))
 :qid |stdinbpl.5652:41|
 :skolemid |638|
 :pattern ( (neverTriggered70 n_15@@2) (neverTriggered70 n_15_1@@0))
)) (=> (= (ControlFlow 0 108) (- 0 107)) (forall ((n_15@@3 T@U) ) (!  (=> (and (= (type n_15@@3) RefType) (U_2_bool (MapType2Select g n_15@@3))) (>= (U_2_real (MapType1Select QPMask@0 n_15@@3 next)) (/ (to_real 1) (to_real 2))))
 :qid |stdinbpl.5659:41|
 :skolemid |639|
 :pattern ( (MapType0Select Heap@@23 n_15@@3 next))
 :pattern ( (MapType1Select QPMask@8 n_15@@3 next))
 :pattern ( (MapType0Select Heap@@23 n_15@@3 next))
)))))))))
(let ((anon167_Then_correct  (and (=> (= (ControlFlow 0 103) (- 0 105)) (forall ((n_14 T@U) ) (!  (=> (= (type n_14) RefType) (=> (and (U_2_bool (MapType2Select g n_14)) (dummyFunction (MapType0Select Heap@@23 n_14 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.5591:39|
 :skolemid |630|
 :pattern ( (MapType0Select Heap@@23 n_14 next))
 :pattern ( (MapType1Select QPMask@7 n_14 next))
 :pattern ( (MapType0Select Heap@@23 n_14 next))
))) (=> (forall ((n_14@@0 T@U) ) (!  (=> (= (type n_14@@0) RefType) (=> (and (U_2_bool (MapType2Select g n_14@@0)) (dummyFunction (MapType0Select Heap@@23 n_14@@0 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.5591:39|
 :skolemid |630|
 :pattern ( (MapType0Select Heap@@23 n_14@@0 next))
 :pattern ( (MapType1Select QPMask@7 n_14@@0 next))
 :pattern ( (MapType0Select Heap@@23 n_14@@0 next))
)) (and (=> (= (ControlFlow 0 103) (- 0 104)) (forall ((n_14@@1 T@U) (n_14_1 T@U) ) (!  (=> (and (= (type n_14@@1) RefType) (= (type n_14_1) RefType)) (=> (and (and (and (and (not (= n_14@@1 n_14_1)) (U_2_bool (MapType2Select g n_14@@1))) (U_2_bool (MapType2Select g n_14_1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_14@@1 n_14_1))))
 :qid |stdinbpl.5598:39|
 :skolemid |631|
 :pattern ( (neverTriggered69 n_14@@1) (neverTriggered69 n_14_1))
))) (=> (forall ((n_14@@2 T@U) (n_14_1@@0 T@U) ) (!  (=> (and (= (type n_14@@2) RefType) (= (type n_14_1@@0) RefType)) (=> (and (and (and (and (not (= n_14@@2 n_14_1@@0)) (U_2_bool (MapType2Select g n_14@@2))) (U_2_bool (MapType2Select g n_14_1@@0))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_14@@2 n_14_1@@0))))
 :qid |stdinbpl.5598:39|
 :skolemid |631|
 :pattern ( (neverTriggered69 n_14@@2) (neverTriggered69 n_14_1@@0))
)) (=> (= (ControlFlow 0 103) (- 0 102)) (forall ((n_14@@3 T@U) ) (!  (=> (and (= (type n_14@@3) RefType) (U_2_bool (MapType2Select g n_14@@3))) (>= (U_2_real (MapType1Select QPMask@0 n_14@@3 next)) (/ (to_real 1) (to_real 2))))
 :qid |stdinbpl.5605:39|
 :skolemid |632|
 :pattern ( (MapType0Select Heap@@23 n_14@@3 next))
 :pattern ( (MapType1Select QPMask@7 n_14@@3 next))
 :pattern ( (MapType0Select Heap@@23 n_14@@3 next))
)))))))))
(let ((anon165_Then_correct  (and (=> (= (ControlFlow 0 98) (- 0 100)) (forall ((n_13 T@U) ) (!  (=> (= (type n_13) RefType) (=> (and (U_2_bool (MapType2Select g n_13)) (dummyFunction (MapType0Select Heap@@23 n_13 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.5537:37|
 :skolemid |623|
 :pattern ( (MapType0Select Heap@@23 n_13 next))
 :pattern ( (MapType1Select QPMask@6 n_13 next))
 :pattern ( (MapType0Select Heap@@23 n_13 next))
))) (=> (forall ((n_13@@0 T@U) ) (!  (=> (= (type n_13@@0) RefType) (=> (and (U_2_bool (MapType2Select g n_13@@0)) (dummyFunction (MapType0Select Heap@@23 n_13@@0 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.5537:37|
 :skolemid |623|
 :pattern ( (MapType0Select Heap@@23 n_13@@0 next))
 :pattern ( (MapType1Select QPMask@6 n_13@@0 next))
 :pattern ( (MapType0Select Heap@@23 n_13@@0 next))
)) (and (=> (= (ControlFlow 0 98) (- 0 99)) (forall ((n_13@@1 T@U) (n_13_1 T@U) ) (!  (=> (and (= (type n_13@@1) RefType) (= (type n_13_1) RefType)) (=> (and (and (and (and (not (= n_13@@1 n_13_1)) (U_2_bool (MapType2Select g n_13@@1))) (U_2_bool (MapType2Select g n_13_1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_13@@1 n_13_1))))
 :qid |stdinbpl.5544:37|
 :skolemid |624|
 :pattern ( (neverTriggered68 n_13@@1) (neverTriggered68 n_13_1))
))) (=> (forall ((n_13@@2 T@U) (n_13_1@@0 T@U) ) (!  (=> (and (= (type n_13@@2) RefType) (= (type n_13_1@@0) RefType)) (=> (and (and (and (and (not (= n_13@@2 n_13_1@@0)) (U_2_bool (MapType2Select g n_13@@2))) (U_2_bool (MapType2Select g n_13_1@@0))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_13@@2 n_13_1@@0))))
 :qid |stdinbpl.5544:37|
 :skolemid |624|
 :pattern ( (neverTriggered68 n_13@@2) (neverTriggered68 n_13_1@@0))
)) (=> (= (ControlFlow 0 98) (- 0 97)) (forall ((n_13@@3 T@U) ) (!  (=> (and (= (type n_13@@3) RefType) (U_2_bool (MapType2Select g n_13@@3))) (>= (U_2_real (MapType1Select QPMask@0 n_13@@3 next)) (/ (to_real 1) (to_real 2))))
 :qid |stdinbpl.5551:37|
 :skolemid |625|
 :pattern ( (MapType0Select Heap@@23 n_13@@3 next))
 :pattern ( (MapType1Select QPMask@6 n_13@@3 next))
 :pattern ( (MapType0Select Heap@@23 n_13@@3 next))
)))))))))
(let ((anon94_correct true))
(let ((anon172_Then_correct  (=> (exists_path ($$ Heap@@23 g) (MapType0Select Heap@@23 x_1@@0 next) v_12) (and (=> (= (ControlFlow 0 121) 118) anon173_Then_correct) (=> (= (ControlFlow 0 121) 95) anon94_correct)))))
(let ((anon172_Else_correct  (=> (and (not (exists_path ($$ Heap@@23 g) (MapType0Select Heap@@23 x_1@@0 next) v_12)) (= (ControlFlow 0 116) 95)) anon94_correct)))
(let ((anon171_Else_correct  (and (=> (= (ControlFlow 0 122) (- 0 123)) (HasDirectPerm QPMask@0 x_1@@0 next)) (=> (HasDirectPerm QPMask@0 x_1@@0 next) (and (=> (= (ControlFlow 0 122) 121) anon172_Then_correct) (=> (= (ControlFlow 0 122) 116) anon172_Else_correct))))))
(let ((anon170_Then_correct  (=> (exists_path ($$ Heap@@23 g) u_12 x_1@@0) (and (=> (= (ControlFlow 0 124) 113) anon171_Then_correct) (=> (= (ControlFlow 0 124) 122) anon171_Else_correct)))))
(let ((anon170_Else_correct  (=> (and (not (exists_path ($$ Heap@@23 g) u_12 x_1@@0)) (= (ControlFlow 0 111) 95)) anon94_correct)))
(let ((anon168_Then_correct  (=> (exists_path ($$ Heap@@23 g) v1_9 u_12) (and (and (=> (= (ControlFlow 0 125) 108) anon169_Then_correct) (=> (= (ControlFlow 0 125) 124) anon170_Then_correct)) (=> (= (ControlFlow 0 125) 111) anon170_Else_correct)))))
(let ((anon168_Else_correct  (=> (and (not (exists_path ($$ Heap@@23 g) v1_9 u_12)) (= (ControlFlow 0 106) 95)) anon94_correct)))
(let ((anon166_Then_correct  (=> (edge ($$ Heap@@23 g) u_12 v_12) (and (and (=> (= (ControlFlow 0 126) 103) anon167_Then_correct) (=> (= (ControlFlow 0 126) 125) anon168_Then_correct)) (=> (= (ControlFlow 0 126) 106) anon168_Else_correct)))))
(let ((anon166_Else_correct  (=> (and (not (edge ($$ Heap@@23 g) u_12 v_12)) (= (ControlFlow 0 101) 95)) anon94_correct)))
(let ((anon164_Then_correct  (=> (or (not (= u_12 x_1@@0)) (not (= v_12 (MapType0Select Heap@@23 x_1@@0 next)))) (and (and (=> (= (ControlFlow 0 127) 98) anon165_Then_correct) (=> (= (ControlFlow 0 127) 126) anon166_Then_correct)) (=> (= (ControlFlow 0 127) 101) anon166_Else_correct)))))
(let ((anon164_Else_correct  (=> (and (not (or (not (= u_12 x_1@@0)) (not (= v_12 (MapType0Select Heap@@23 x_1@@0 next))))) (= (ControlFlow 0 96) 95)) anon94_correct)))
(let ((anon163_Else_correct  (=> (not (= u_12 x_1@@0)) (and (=> (= (ControlFlow 0 130) 127) anon164_Then_correct) (=> (= (ControlFlow 0 130) 96) anon164_Else_correct)))))
(let ((anon163_Then_correct  (=> (not (not (= u_12 x_1@@0))) (and (=> (= (ControlFlow 0 128) (- 0 129)) (HasDirectPerm QPMask@0 x_1@@0 next)) (=> (HasDirectPerm QPMask@0 x_1@@0 next) (and (=> (= (ControlFlow 0 128) 127) anon164_Then_correct) (=> (= (ControlFlow 0 128) 96) anon164_Else_correct)))))))
(let ((anon160_Then_correct  (and (=> (= (ControlFlow 0 86) (- 0 88)) (forall ((n$0_9 T@U) ) (!  (=> (= (type n$0_9) RefType) (=> (and (U_2_bool (MapType2Select g n$0_9)) (dummyFunction (MapType0Select Heap@@23 n$0_9 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.5467:39|
 :skolemid |615|
 :pattern ( (MapType0Select Heap@@23 n$0_9 next))
 :pattern ( (MapType1Select QPMask@12 n$0_9 next))
 :pattern ( (MapType0Select Heap@@23 n$0_9 next))
))) (=> (forall ((n$0_9@@0 T@U) ) (!  (=> (= (type n$0_9@@0) RefType) (=> (and (U_2_bool (MapType2Select g n$0_9@@0)) (dummyFunction (MapType0Select Heap@@23 n$0_9@@0 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.5467:39|
 :skolemid |615|
 :pattern ( (MapType0Select Heap@@23 n$0_9@@0 next))
 :pattern ( (MapType1Select QPMask@12 n$0_9@@0 next))
 :pattern ( (MapType0Select Heap@@23 n$0_9@@0 next))
)) (and (=> (= (ControlFlow 0 86) (- 0 87)) (forall ((n$0_9@@1 T@U) (n$0_9_1 T@U) ) (!  (=> (and (= (type n$0_9@@1) RefType) (= (type n$0_9_1) RefType)) (=> (and (and (and (and (not (= n$0_9@@1 n$0_9_1)) (U_2_bool (MapType2Select g n$0_9@@1))) (U_2_bool (MapType2Select g n$0_9_1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n$0_9@@1 n$0_9_1))))
 :qid |stdinbpl.5474:39|
 :skolemid |616|
 :pattern ( (neverTriggered67 n$0_9@@1) (neverTriggered67 n$0_9_1))
))) (=> (forall ((n$0_9@@2 T@U) (n$0_9_1@@0 T@U) ) (!  (=> (and (= (type n$0_9@@2) RefType) (= (type n$0_9_1@@0) RefType)) (=> (and (and (and (and (not (= n$0_9@@2 n$0_9_1@@0)) (U_2_bool (MapType2Select g n$0_9@@2))) (U_2_bool (MapType2Select g n$0_9_1@@0))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n$0_9@@2 n$0_9_1@@0))))
 :qid |stdinbpl.5474:39|
 :skolemid |616|
 :pattern ( (neverTriggered67 n$0_9@@2) (neverTriggered67 n$0_9_1@@0))
)) (=> (= (ControlFlow 0 86) (- 0 85)) (forall ((n$0_9@@3 T@U) ) (!  (=> (and (= (type n$0_9@@3) RefType) (U_2_bool (MapType2Select g n$0_9@@3))) (>= (U_2_real (MapType1Select QPMask@0 n$0_9@@3 next)) (/ (to_real 1) (to_real 2))))
 :qid |stdinbpl.5481:39|
 :skolemid |617|
 :pattern ( (MapType0Select Heap@@23 n$0_9@@3 next))
 :pattern ( (MapType1Select QPMask@12 n$0_9@@3 next))
 :pattern ( (MapType0Select Heap@@23 n$0_9@@3 next))
)))))))))
(let ((anon158_Then_correct  (and (=> (= (ControlFlow 0 81) (- 0 83)) (forall ((n$0_8 T@U) ) (!  (=> (= (type n$0_8) RefType) (=> (and (U_2_bool (MapType2Select g n$0_8)) (dummyFunction (MapType0Select Heap@@23 n$0_8 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.5413:37|
 :skolemid |608|
 :pattern ( (MapType0Select Heap@@23 n$0_8 next))
 :pattern ( (MapType1Select QPMask@11 n$0_8 next))
 :pattern ( (MapType0Select Heap@@23 n$0_8 next))
))) (=> (forall ((n$0_8@@0 T@U) ) (!  (=> (= (type n$0_8@@0) RefType) (=> (and (U_2_bool (MapType2Select g n$0_8@@0)) (dummyFunction (MapType0Select Heap@@23 n$0_8@@0 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.5413:37|
 :skolemid |608|
 :pattern ( (MapType0Select Heap@@23 n$0_8@@0 next))
 :pattern ( (MapType1Select QPMask@11 n$0_8@@0 next))
 :pattern ( (MapType0Select Heap@@23 n$0_8@@0 next))
)) (and (=> (= (ControlFlow 0 81) (- 0 82)) (forall ((n$0_8@@1 T@U) (n$0_8_1 T@U) ) (!  (=> (and (= (type n$0_8@@1) RefType) (= (type n$0_8_1) RefType)) (=> (and (and (and (and (not (= n$0_8@@1 n$0_8_1)) (U_2_bool (MapType2Select g n$0_8@@1))) (U_2_bool (MapType2Select g n$0_8_1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n$0_8@@1 n$0_8_1))))
 :qid |stdinbpl.5420:37|
 :skolemid |609|
 :pattern ( (neverTriggered66 n$0_8@@1) (neverTriggered66 n$0_8_1))
))) (=> (forall ((n$0_8@@2 T@U) (n$0_8_1@@0 T@U) ) (!  (=> (and (= (type n$0_8@@2) RefType) (= (type n$0_8_1@@0) RefType)) (=> (and (and (and (and (not (= n$0_8@@2 n$0_8_1@@0)) (U_2_bool (MapType2Select g n$0_8@@2))) (U_2_bool (MapType2Select g n$0_8_1@@0))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n$0_8@@2 n$0_8_1@@0))))
 :qid |stdinbpl.5420:37|
 :skolemid |609|
 :pattern ( (neverTriggered66 n$0_8@@2) (neverTriggered66 n$0_8_1@@0))
)) (=> (= (ControlFlow 0 81) (- 0 80)) (forall ((n$0_8@@3 T@U) ) (!  (=> (and (= (type n$0_8@@3) RefType) (U_2_bool (MapType2Select g n$0_8@@3))) (>= (U_2_real (MapType1Select QPMask@0 n$0_8@@3 next)) (/ (to_real 1) (to_real 2))))
 :qid |stdinbpl.5427:37|
 :skolemid |610|
 :pattern ( (MapType0Select Heap@@23 n$0_8@@3 next))
 :pattern ( (MapType1Select QPMask@11 n$0_8@@3 next))
 :pattern ( (MapType0Select Heap@@23 n$0_8@@3 next))
)))))))))
(let ((anon74_correct true))
(let ((anon160_Else_correct  (and (=> (= (ControlFlow 0 89) (- 0 90)) (HasDirectPerm QPMask@0 x_1@@0 next)) (=> (HasDirectPerm QPMask@0 x_1@@0 next) (=> (= (ControlFlow 0 89) 77) anon74_correct)))))
(let ((anon159_Then_correct  (=> (exists_path ($$ Heap@@23 g) x_1@@0 n_23) (and (=> (= (ControlFlow 0 91) 86) anon160_Then_correct) (=> (= (ControlFlow 0 91) 89) anon160_Else_correct)))))
(let ((anon159_Else_correct  (=> (and (not (exists_path ($$ Heap@@23 g) x_1@@0 n_23)) (= (ControlFlow 0 84) 77)) anon74_correct)))
(let ((anon157_Then_correct  (=> (not (= n_23 (MapType0Select Heap@@23 x_1@@0 next))) (and (and (=> (= (ControlFlow 0 92) 81) anon158_Then_correct) (=> (= (ControlFlow 0 92) 91) anon159_Then_correct)) (=> (= (ControlFlow 0 92) 84) anon159_Else_correct)))))
(let ((anon157_Else_correct  (=> (and (= n_23 (MapType0Select Heap@@23 x_1@@0 next)) (= (ControlFlow 0 79) 77)) anon74_correct)))
(let ((anon156_Then_correct  (=> (not (= n_23 x_1@@0)) (and (=> (= (ControlFlow 0 93) (- 0 94)) (HasDirectPerm QPMask@0 x_1@@0 next)) (=> (HasDirectPerm QPMask@0 x_1@@0 next) (and (=> (= (ControlFlow 0 93) 92) anon157_Then_correct) (=> (= (ControlFlow 0 93) 79) anon157_Else_correct)))))))
(let ((anon156_Else_correct  (=> (and (= n_23 x_1@@0) (= (ControlFlow 0 78) 77)) anon74_correct)))
(let ((anon149_Then_correct  (and (=> (= (ControlFlow 0 70) (- 0 72)) (forall ((n$0_5 T@U) ) (!  (=> (= (type n$0_5) RefType) (=> (and (U_2_bool (MapType2Select g n$0_5)) (dummyFunction (MapType0Select Heap@@23 n$0_5 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.5232:37|
 :skolemid |586|
 :pattern ( (MapType0Select Heap@@23 n$0_5 next))
 :pattern ( (MapType1Select QPMask@16 n$0_5 next))
 :pattern ( (MapType0Select Heap@@23 n$0_5 next))
))) (=> (forall ((n$0_5@@0 T@U) ) (!  (=> (= (type n$0_5@@0) RefType) (=> (and (U_2_bool (MapType2Select g n$0_5@@0)) (dummyFunction (MapType0Select Heap@@23 n$0_5@@0 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.5232:37|
 :skolemid |586|
 :pattern ( (MapType0Select Heap@@23 n$0_5@@0 next))
 :pattern ( (MapType1Select QPMask@16 n$0_5@@0 next))
 :pattern ( (MapType0Select Heap@@23 n$0_5@@0 next))
)) (and (=> (= (ControlFlow 0 70) (- 0 71)) (forall ((n$0_5@@1 T@U) (n$0_5_2 T@U) ) (!  (=> (and (= (type n$0_5@@1) RefType) (= (type n$0_5_2) RefType)) (=> (and (and (and (and (not (= n$0_5@@1 n$0_5_2)) (U_2_bool (MapType2Select g n$0_5@@1))) (U_2_bool (MapType2Select g n$0_5_2))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n$0_5@@1 n$0_5_2))))
 :qid |stdinbpl.5239:37|
 :skolemid |587|
 :pattern ( (neverTriggered63 n$0_5@@1) (neverTriggered63 n$0_5_2))
))) (=> (forall ((n$0_5@@2 T@U) (n$0_5_2@@0 T@U) ) (!  (=> (and (= (type n$0_5@@2) RefType) (= (type n$0_5_2@@0) RefType)) (=> (and (and (and (and (not (= n$0_5@@2 n$0_5_2@@0)) (U_2_bool (MapType2Select g n$0_5@@2))) (U_2_bool (MapType2Select g n$0_5_2@@0))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n$0_5@@2 n$0_5_2@@0))))
 :qid |stdinbpl.5239:37|
 :skolemid |587|
 :pattern ( (neverTriggered63 n$0_5@@2) (neverTriggered63 n$0_5_2@@0))
)) (=> (= (ControlFlow 0 70) (- 0 69)) (forall ((n$0_5@@3 T@U) ) (!  (=> (and (= (type n$0_5@@3) RefType) (U_2_bool (MapType2Select g n$0_5@@3))) (>= (U_2_real (MapType1Select QPMask@0 n$0_5@@3 next)) (/ (to_real 1) (to_real 2))))
 :qid |stdinbpl.5246:37|
 :skolemid |588|
 :pattern ( (MapType0Select Heap@@23 n$0_5@@3 next))
 :pattern ( (MapType1Select QPMask@16 n$0_5@@3 next))
 :pattern ( (MapType0Select Heap@@23 n$0_5@@3 next))
)))))))))
(let ((anon153_Then_correct  (and (=> (= (ControlFlow 0 59) (- 0 61)) (forall ((n$0_7 T@U) ) (!  (=> (= (type n$0_7) RefType) (=> (and (U_2_bool (MapType2Select g n$0_7)) (dummyFunction (MapType0Select Heap@@23 n$0_7 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.5343:39|
 :skolemid |600|
 :pattern ( (MapType0Select Heap@@23 n$0_7 next))
 :pattern ( (MapType1Select QPMask@18 n$0_7 next))
 :pattern ( (MapType0Select Heap@@23 n$0_7 next))
))) (=> (forall ((n$0_7@@0 T@U) ) (!  (=> (= (type n$0_7@@0) RefType) (=> (and (U_2_bool (MapType2Select g n$0_7@@0)) (dummyFunction (MapType0Select Heap@@23 n$0_7@@0 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.5343:39|
 :skolemid |600|
 :pattern ( (MapType0Select Heap@@23 n$0_7@@0 next))
 :pattern ( (MapType1Select QPMask@18 n$0_7@@0 next))
 :pattern ( (MapType0Select Heap@@23 n$0_7@@0 next))
)) (and (=> (= (ControlFlow 0 59) (- 0 60)) (forall ((n$0_7@@1 T@U) (n$0_7_1 T@U) ) (!  (=> (and (= (type n$0_7@@1) RefType) (= (type n$0_7_1) RefType)) (=> (and (and (and (and (not (= n$0_7@@1 n$0_7_1)) (U_2_bool (MapType2Select g n$0_7@@1))) (U_2_bool (MapType2Select g n$0_7_1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n$0_7@@1 n$0_7_1))))
 :qid |stdinbpl.5350:39|
 :skolemid |601|
 :pattern ( (neverTriggered65 n$0_7@@1) (neverTriggered65 n$0_7_1))
))) (=> (forall ((n$0_7@@2 T@U) (n$0_7_1@@0 T@U) ) (!  (=> (and (= (type n$0_7@@2) RefType) (= (type n$0_7_1@@0) RefType)) (=> (and (and (and (and (not (= n$0_7@@2 n$0_7_1@@0)) (U_2_bool (MapType2Select g n$0_7@@2))) (U_2_bool (MapType2Select g n$0_7_1@@0))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n$0_7@@2 n$0_7_1@@0))))
 :qid |stdinbpl.5350:39|
 :skolemid |601|
 :pattern ( (neverTriggered65 n$0_7@@2) (neverTriggered65 n$0_7_1@@0))
)) (=> (= (ControlFlow 0 59) (- 0 58)) (forall ((n$0_7@@3 T@U) ) (!  (=> (and (= (type n$0_7@@3) RefType) (U_2_bool (MapType2Select g n$0_7@@3))) (>= (U_2_real (MapType1Select QPMask@0 n$0_7@@3 next)) (/ (to_real 1) (to_real 2))))
 :qid |stdinbpl.5357:39|
 :skolemid |602|
 :pattern ( (MapType0Select Heap@@23 n$0_7@@3 next))
 :pattern ( (MapType1Select QPMask@18 n$0_7@@3 next))
 :pattern ( (MapType0Select Heap@@23 n$0_7@@3 next))
)))))))))
(let ((anon151_Then_correct  (and (=> (= (ControlFlow 0 54) (- 0 56)) (forall ((n$0_6 T@U) ) (!  (=> (= (type n$0_6) RefType) (=> (and (U_2_bool (MapType2Select g n$0_6)) (dummyFunction (MapType0Select Heap@@23 n$0_6 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.5287:37|
 :skolemid |593|
 :pattern ( (MapType0Select Heap@@23 n$0_6 next))
 :pattern ( (MapType1Select QPMask@17 n$0_6 next))
 :pattern ( (MapType0Select Heap@@23 n$0_6 next))
))) (=> (forall ((n$0_6@@0 T@U) ) (!  (=> (= (type n$0_6@@0) RefType) (=> (and (U_2_bool (MapType2Select g n$0_6@@0)) (dummyFunction (MapType0Select Heap@@23 n$0_6@@0 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.5287:37|
 :skolemid |593|
 :pattern ( (MapType0Select Heap@@23 n$0_6@@0 next))
 :pattern ( (MapType1Select QPMask@17 n$0_6@@0 next))
 :pattern ( (MapType0Select Heap@@23 n$0_6@@0 next))
)) (and (=> (= (ControlFlow 0 54) (- 0 55)) (forall ((n$0_6@@1 T@U) (n$0_6_1 T@U) ) (!  (=> (and (= (type n$0_6@@1) RefType) (= (type n$0_6_1) RefType)) (=> (and (and (and (and (not (= n$0_6@@1 n$0_6_1)) (U_2_bool (MapType2Select g n$0_6@@1))) (U_2_bool (MapType2Select g n$0_6_1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n$0_6@@1 n$0_6_1))))
 :qid |stdinbpl.5294:37|
 :skolemid |594|
 :pattern ( (neverTriggered64 n$0_6@@1) (neverTriggered64 n$0_6_1))
))) (=> (forall ((n$0_6@@2 T@U) (n$0_6_1@@0 T@U) ) (!  (=> (and (= (type n$0_6@@2) RefType) (= (type n$0_6_1@@0) RefType)) (=> (and (and (and (and (not (= n$0_6@@2 n$0_6_1@@0)) (U_2_bool (MapType2Select g n$0_6@@2))) (U_2_bool (MapType2Select g n$0_6_1@@0))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n$0_6@@2 n$0_6_1@@0))))
 :qid |stdinbpl.5294:37|
 :skolemid |594|
 :pattern ( (neverTriggered64 n$0_6@@2) (neverTriggered64 n$0_6_1@@0))
)) (=> (= (ControlFlow 0 54) (- 0 53)) (forall ((n$0_6@@3 T@U) ) (!  (=> (and (= (type n$0_6@@3) RefType) (U_2_bool (MapType2Select g n$0_6@@3))) (>= (U_2_real (MapType1Select QPMask@0 n$0_6@@3 next)) (/ (to_real 1) (to_real 2))))
 :qid |stdinbpl.5301:37|
 :skolemid |595|
 :pattern ( (MapType0Select Heap@@23 n$0_6@@3 next))
 :pattern ( (MapType1Select QPMask@17 n$0_6@@3 next))
 :pattern ( (MapType0Select Heap@@23 n$0_6@@3 next))
)))))))))
(let ((anon147_Then_correct  (and (=> (= (ControlFlow 0 49) (- 0 51)) (forall ((n$0_4 T@U) ) (!  (=> (= (type n$0_4) RefType) (=> (and (U_2_bool (MapType2Select g n$0_4)) (dummyFunction (MapType0Select Heap@@23 n$0_4 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.5178:35|
 :skolemid |579|
 :pattern ( (MapType0Select Heap@@23 n$0_4 next))
 :pattern ( (MapType1Select QPMask@15 n$0_4 next))
 :pattern ( (MapType0Select Heap@@23 n$0_4 next))
))) (=> (forall ((n$0_4@@0 T@U) ) (!  (=> (= (type n$0_4@@0) RefType) (=> (and (U_2_bool (MapType2Select g n$0_4@@0)) (dummyFunction (MapType0Select Heap@@23 n$0_4@@0 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.5178:35|
 :skolemid |579|
 :pattern ( (MapType0Select Heap@@23 n$0_4@@0 next))
 :pattern ( (MapType1Select QPMask@15 n$0_4@@0 next))
 :pattern ( (MapType0Select Heap@@23 n$0_4@@0 next))
)) (and (=> (= (ControlFlow 0 49) (- 0 50)) (forall ((n$0_4@@1 T@U) (n$0_4_1 T@U) ) (!  (=> (and (= (type n$0_4@@1) RefType) (= (type n$0_4_1) RefType)) (=> (and (and (and (and (not (= n$0_4@@1 n$0_4_1)) (U_2_bool (MapType2Select g n$0_4@@1))) (U_2_bool (MapType2Select g n$0_4_1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n$0_4@@1 n$0_4_1))))
 :qid |stdinbpl.5185:35|
 :skolemid |580|
 :pattern ( (neverTriggered62 n$0_4@@1) (neverTriggered62 n$0_4_1))
))) (=> (forall ((n$0_4@@2 T@U) (n$0_4_1@@0 T@U) ) (!  (=> (and (= (type n$0_4@@2) RefType) (= (type n$0_4_1@@0) RefType)) (=> (and (and (and (and (not (= n$0_4@@2 n$0_4_1@@0)) (U_2_bool (MapType2Select g n$0_4@@2))) (U_2_bool (MapType2Select g n$0_4_1@@0))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n$0_4@@2 n$0_4_1@@0))))
 :qid |stdinbpl.5185:35|
 :skolemid |580|
 :pattern ( (neverTriggered62 n$0_4@@2) (neverTriggered62 n$0_4_1@@0))
)) (=> (= (ControlFlow 0 49) (- 0 48)) (forall ((n$0_4@@3 T@U) ) (!  (=> (and (= (type n$0_4@@3) RefType) (U_2_bool (MapType2Select g n$0_4@@3))) (>= (U_2_real (MapType1Select QPMask@0 n$0_4@@3 next)) (/ (to_real 1) (to_real 2))))
 :qid |stdinbpl.5192:35|
 :skolemid |581|
 :pattern ( (MapType0Select Heap@@23 n$0_4@@3 next))
 :pattern ( (MapType1Select QPMask@15 n$0_4@@3 next))
 :pattern ( (MapType0Select Heap@@23 n$0_4@@3 next))
)))))))))
(let ((anon145_Then_correct  (and (=> (= (ControlFlow 0 44) (- 0 46)) (forall ((n$0_3 T@U) ) (!  (=> (= (type n$0_3) RefType) (=> (and (U_2_bool (MapType2Select g n$0_3)) (dummyFunction (MapType0Select Heap@@23 n$0_3 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.5124:33|
 :skolemid |572|
 :pattern ( (MapType0Select Heap@@23 n$0_3 next))
 :pattern ( (MapType1Select QPMask@14 n$0_3 next))
 :pattern ( (MapType0Select Heap@@23 n$0_3 next))
))) (=> (forall ((n$0_3@@0 T@U) ) (!  (=> (= (type n$0_3@@0) RefType) (=> (and (U_2_bool (MapType2Select g n$0_3@@0)) (dummyFunction (MapType0Select Heap@@23 n$0_3@@0 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.5124:33|
 :skolemid |572|
 :pattern ( (MapType0Select Heap@@23 n$0_3@@0 next))
 :pattern ( (MapType1Select QPMask@14 n$0_3@@0 next))
 :pattern ( (MapType0Select Heap@@23 n$0_3@@0 next))
)) (and (=> (= (ControlFlow 0 44) (- 0 45)) (forall ((n$0_3@@1 T@U) (n$0_3_1 T@U) ) (!  (=> (and (= (type n$0_3@@1) RefType) (= (type n$0_3_1) RefType)) (=> (and (and (and (and (not (= n$0_3@@1 n$0_3_1)) (U_2_bool (MapType2Select g n$0_3@@1))) (U_2_bool (MapType2Select g n$0_3_1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n$0_3@@1 n$0_3_1))))
 :qid |stdinbpl.5131:33|
 :skolemid |573|
 :pattern ( (neverTriggered61 n$0_3@@1) (neverTriggered61 n$0_3_1))
))) (=> (forall ((n$0_3@@2 T@U) (n$0_3_1@@0 T@U) ) (!  (=> (and (= (type n$0_3@@2) RefType) (= (type n$0_3_1@@0) RefType)) (=> (and (and (and (and (not (= n$0_3@@2 n$0_3_1@@0)) (U_2_bool (MapType2Select g n$0_3@@2))) (U_2_bool (MapType2Select g n$0_3_1@@0))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n$0_3@@2 n$0_3_1@@0))))
 :qid |stdinbpl.5131:33|
 :skolemid |573|
 :pattern ( (neverTriggered61 n$0_3@@2) (neverTriggered61 n$0_3_1@@0))
)) (=> (= (ControlFlow 0 44) (- 0 43)) (forall ((n$0_3@@3 T@U) ) (!  (=> (and (= (type n$0_3@@3) RefType) (U_2_bool (MapType2Select g n$0_3@@3))) (>= (U_2_real (MapType1Select QPMask@0 n$0_3@@3 next)) (/ (to_real 1) (to_real 2))))
 :qid |stdinbpl.5138:33|
 :skolemid |574|
 :pattern ( (MapType0Select Heap@@23 n$0_3@@3 next))
 :pattern ( (MapType1Select QPMask@14 n$0_3@@3 next))
 :pattern ( (MapType0Select Heap@@23 n$0_3@@3 next))
)))))))))
(let ((anon63_correct true))
(let ((anon153_Else_correct  (and (=> (= (ControlFlow 0 62) (- 0 63)) (HasDirectPerm QPMask@0 x_1@@0 next)) (=> (HasDirectPerm QPMask@0 x_1@@0 next) (=> (= (ControlFlow 0 62) 41) anon63_correct)))))
(let ((anon152_Then_correct  (=> (not (exists_path ($$ Heap@@23 g) n_22 (MapType0Select Heap@@23 x_1@@0 next))) (and (=> (= (ControlFlow 0 64) 59) anon153_Then_correct) (=> (= (ControlFlow 0 64) 62) anon153_Else_correct)))))
(let ((anon152_Else_correct  (=> (and (exists_path ($$ Heap@@23 g) n_22 (MapType0Select Heap@@23 x_1@@0 next)) (= (ControlFlow 0 57) 41)) anon63_correct)))
(let ((anon151_Else_correct  (and (=> (= (ControlFlow 0 65) (- 0 66)) (HasDirectPerm QPMask@0 x_1@@0 next)) (=> (HasDirectPerm QPMask@0 x_1@@0 next) (and (=> (= (ControlFlow 0 65) 64) anon152_Then_correct) (=> (= (ControlFlow 0 65) 57) anon152_Else_correct))))))
(let ((anon150_Then_correct  (=> (not (and (not (exists_path ($$ Heap@@23 g) n_22 x_1@@0)) (not (exists_path ($$ Heap@@23 g) x_1@@0 n_22)))) (and (=> (= (ControlFlow 0 67) 54) anon151_Then_correct) (=> (= (ControlFlow 0 67) 65) anon151_Else_correct)))))
(let ((anon150_Else_correct  (=> (and (and (not (exists_path ($$ Heap@@23 g) n_22 x_1@@0)) (not (exists_path ($$ Heap@@23 g) x_1@@0 n_22))) (= (ControlFlow 0 52) 41)) anon63_correct)))
(let ((anon148_Then_correct  (=> (not (exists_path ($$ Heap@@23 g) n_22 x_1@@0)) (and (and (=> (= (ControlFlow 0 73) 70) anon149_Then_correct) (=> (= (ControlFlow 0 73) 67) anon150_Then_correct)) (=> (= (ControlFlow 0 73) 52) anon150_Else_correct)))))
(let ((anon148_Else_correct  (=> (exists_path ($$ Heap@@23 g) n_22 x_1@@0) (and (=> (= (ControlFlow 0 68) 67) anon150_Then_correct) (=> (= (ControlFlow 0 68) 52) anon150_Else_correct)))))
(let ((anon146_Then_correct  (=> (exists_path ($$ Heap@@23 g) n_22 v2_9) (and (and (=> (= (ControlFlow 0 74) 49) anon147_Then_correct) (=> (= (ControlFlow 0 74) 73) anon148_Then_correct)) (=> (= (ControlFlow 0 74) 68) anon148_Else_correct)))))
(let ((anon146_Else_correct  (=> (and (not (exists_path ($$ Heap@@23 g) n_22 v2_9)) (= (ControlFlow 0 47) 41)) anon63_correct)))
(let ((anon144_Then_correct  (=> (exists_path ($$ Heap@@23 g) v1_9 n_22) (and (and (=> (= (ControlFlow 0 75) 44) anon145_Then_correct) (=> (= (ControlFlow 0 75) 74) anon146_Then_correct)) (=> (= (ControlFlow 0 75) 47) anon146_Else_correct)))))
(let ((anon144_Else_correct  (=> (and (not (exists_path ($$ Heap@@23 g) v1_9 n_22)) (= (ControlFlow 0 42) 41)) anon63_correct)))
(let ((anon143_Then_correct  (and (=> (= (ControlFlow 0 38) (- 0 40)) (forall ((n$0_2 T@U) ) (!  (=> (= (type n$0_2) RefType) (=> (and (U_2_bool (MapType2Select g n$0_2)) (dummyFunction (MapType0Select Heap@@23 n$0_2 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.5070:31|
 :skolemid |565|
 :pattern ( (MapType0Select Heap@@23 n$0_2 next))
 :pattern ( (MapType1Select QPMask@13 n$0_2 next))
 :pattern ( (MapType0Select Heap@@23 n$0_2 next))
))) (=> (forall ((n$0_2@@0 T@U) ) (!  (=> (= (type n$0_2@@0) RefType) (=> (and (U_2_bool (MapType2Select g n$0_2@@0)) (dummyFunction (MapType0Select Heap@@23 n$0_2@@0 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.5070:31|
 :skolemid |565|
 :pattern ( (MapType0Select Heap@@23 n$0_2@@0 next))
 :pattern ( (MapType1Select QPMask@13 n$0_2@@0 next))
 :pattern ( (MapType0Select Heap@@23 n$0_2@@0 next))
)) (and (=> (= (ControlFlow 0 38) (- 0 39)) (forall ((n$0_2@@1 T@U) (n$0_2_1 T@U) ) (!  (=> (and (= (type n$0_2@@1) RefType) (= (type n$0_2_1) RefType)) (=> (and (and (and (and (not (= n$0_2@@1 n$0_2_1)) (U_2_bool (MapType2Select g n$0_2@@1))) (U_2_bool (MapType2Select g n$0_2_1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n$0_2@@1 n$0_2_1))))
 :qid |stdinbpl.5077:31|
 :skolemid |566|
 :pattern ( (neverTriggered60 n$0_2@@1) (neverTriggered60 n$0_2_1))
))) (=> (forall ((n$0_2@@2 T@U) (n$0_2_1@@0 T@U) ) (!  (=> (and (= (type n$0_2@@2) RefType) (= (type n$0_2_1@@0) RefType)) (=> (and (and (and (and (not (= n$0_2@@2 n$0_2_1@@0)) (U_2_bool (MapType2Select g n$0_2@@2))) (U_2_bool (MapType2Select g n$0_2_1@@0))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n$0_2@@2 n$0_2_1@@0))))
 :qid |stdinbpl.5077:31|
 :skolemid |566|
 :pattern ( (neverTriggered60 n$0_2@@2) (neverTriggered60 n$0_2_1@@0))
)) (=> (= (ControlFlow 0 38) (- 0 37)) (forall ((n$0_2@@3 T@U) ) (!  (=> (and (= (type n$0_2@@3) RefType) (U_2_bool (MapType2Select g n$0_2@@3))) (>= (U_2_real (MapType1Select QPMask@0 n$0_2@@3 next)) (/ (to_real 1) (to_real 2))))
 :qid |stdinbpl.5084:31|
 :skolemid |567|
 :pattern ( (MapType0Select Heap@@23 n$0_2@@3 next))
 :pattern ( (MapType1Select QPMask@13 n$0_2@@3 next))
 :pattern ( (MapType0Select Heap@@23 n$0_2@@3 next))
)))))))))
(let ((anon95_correct true))
(let ((anon161_Then_correct  (=> (not (exists ((n_12 T@U) ) (!  (and (= (type n_12) RefType) (and (not (= n_12 x_1@@0)) (and (not (= n_12 (MapType0Select Heap@@23 x_1@@0 next))) (and (exists_path ($$ Heap@@23 g) x_1@@0 n_12) (exists_path ($$ Heap@@23 g) n_12 (MapType0Select Heap@@23 x_1@@0 next))))))
 :qid |stdinbpl.5519:30|
 :skolemid |622|
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| Heap@@23 g))) g) x_1@@0 n_12))
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| Heap@@23 g))) g) n_12 (MapType0Select Heap@@23 x_1@@0 next)))
))) (and (and (=> (= (ControlFlow 0 131) 33) anon95_correct) (=> (= (ControlFlow 0 131) 128) anon163_Then_correct)) (=> (= (ControlFlow 0 131) 130) anon163_Else_correct)))))
(let ((anon161_Else_correct  (=> (and (exists ((n_12@@0 T@U) ) (!  (and (= (type n_12@@0) RefType) (and (not (= n_12@@0 x_1@@0)) (and (not (= n_12@@0 (MapType0Select Heap@@23 x_1@@0 next))) (and (exists_path ($$ Heap@@23 g) x_1@@0 n_12@@0) (exists_path ($$ Heap@@23 g) n_12@@0 (MapType0Select Heap@@23 x_1@@0 next))))))
 :qid |stdinbpl.5519:30|
 :skolemid |622|
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| Heap@@23 g))) g) x_1@@0 n_12@@0))
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| Heap@@23 g))) g) n_12@@0 (MapType0Select Heap@@23 x_1@@0 next)))
)) (= (ControlFlow 0 76) 33)) anon95_correct)))
(let ((anon154_Then_correct  (=> (not (exists ((n_10 T@U) ) (!  (and (= (type n_10) RefType) (and (exists_path ($$ Heap@@23 g) v1_9 n_10) (and (exists_path ($$ Heap@@23 g) n_10 v2_9) (or (and (not (exists_path ($$ Heap@@23 g) n_10 x_1@@0)) (not (exists_path ($$ Heap@@23 g) x_1@@0 n_10))) (and (not (exists_path ($$ Heap@@23 g) n_10 (MapType0Select Heap@@23 x_1@@0 next))) (not (exists_path ($$ Heap@@23 g) (MapType0Select Heap@@23 x_1@@0 next) n_10)))))))
 :qid |stdinbpl.5396:28|
 :skolemid |607|
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| Heap@@23 g))) g) v1_9 n_10))
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| Heap@@23 g))) g) n_10 v2_9))
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| Heap@@23 g))) g) n_10 x_1@@0))
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| Heap@@23 g))) g) x_1@@0 n_10))
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| Heap@@23 g))) g) n_10 (MapType0Select Heap@@23 x_1@@0 next)))
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| Heap@@23 g))) g) (MapType0Select Heap@@23 x_1@@0 next) n_10))
))) (and (and (and (=> (= (ControlFlow 0 132) 131) anon161_Then_correct) (=> (= (ControlFlow 0 132) 76) anon161_Else_correct)) (=> (= (ControlFlow 0 132) 93) anon156_Then_correct)) (=> (= (ControlFlow 0 132) 78) anon156_Else_correct)))))
(let ((anon154_Else_correct  (=> (and (exists ((n_10@@0 T@U) ) (!  (and (= (type n_10@@0) RefType) (and (exists_path ($$ Heap@@23 g) v1_9 n_10@@0) (and (exists_path ($$ Heap@@23 g) n_10@@0 v2_9) (or (and (not (exists_path ($$ Heap@@23 g) n_10@@0 x_1@@0)) (not (exists_path ($$ Heap@@23 g) x_1@@0 n_10@@0))) (and (not (exists_path ($$ Heap@@23 g) n_10@@0 (MapType0Select Heap@@23 x_1@@0 next))) (not (exists_path ($$ Heap@@23 g) (MapType0Select Heap@@23 x_1@@0 next) n_10@@0)))))))
 :qid |stdinbpl.5396:28|
 :skolemid |607|
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| Heap@@23 g))) g) v1_9 n_10@@0))
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| Heap@@23 g))) g) n_10@@0 v2_9))
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| Heap@@23 g))) g) n_10@@0 x_1@@0))
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| Heap@@23 g))) g) x_1@@0 n_10@@0))
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| Heap@@23 g))) g) n_10@@0 (MapType0Select Heap@@23 x_1@@0 next)))
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| Heap@@23 g))) g) (MapType0Select Heap@@23 x_1@@0 next) n_10@@0))
)) (= (ControlFlow 0 36) 33)) anon95_correct)))
(let ((anon141_Then_correct  (=> (not (= v1_9 v2_9)) (and (and (and (and (=> (= (ControlFlow 0 133) 132) anon154_Then_correct) (=> (= (ControlFlow 0 133) 36) anon154_Else_correct)) (=> (= (ControlFlow 0 133) 38) anon143_Then_correct)) (=> (= (ControlFlow 0 133) 75) anon144_Then_correct)) (=> (= (ControlFlow 0 133) 42) anon144_Else_correct)))))
(let ((anon141_Else_correct  (=> (and (= v1_9 v2_9) (= (ControlFlow 0 35) 33)) anon95_correct)))
(let ((anon140_Then_correct  (=> (not (= v1_9 v2_9)) (and (=> (= (ControlFlow 0 134) 133) anon141_Then_correct) (=> (= (ControlFlow 0 134) 35) anon141_Else_correct)))))
(let ((anon140_Else_correct  (=> (and (= v1_9 v2_9) (= (ControlFlow 0 34) 33)) anon95_correct)))
(let ((anon139_Then_correct  (and (=> (= (ControlFlow 0 30) (- 0 32)) (forall ((n_8 T@U) ) (!  (=> (= (type n_8) RefType) (=> (and (U_2_bool (MapType2Select g n_8)) (dummyFunction (MapType0Select PostHeap@0 n_8 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.5011:25|
 :skolemid |558|
 :pattern ( (MapType0Select PostHeap@0 n_8 next))
 :pattern ( (MapType1Select QPMask@5 n_8 next))
 :pattern ( (MapType0Select PostHeap@0 n_8 next))
))) (=> (forall ((n_8@@0 T@U) ) (!  (=> (= (type n_8@@0) RefType) (=> (and (U_2_bool (MapType2Select g n_8@@0)) (dummyFunction (MapType0Select PostHeap@0 n_8@@0 next))) (>= (/ (to_real 1) (to_real 2)) NoPerm)))
 :qid |stdinbpl.5011:25|
 :skolemid |558|
 :pattern ( (MapType0Select PostHeap@0 n_8@@0 next))
 :pattern ( (MapType1Select QPMask@5 n_8@@0 next))
 :pattern ( (MapType0Select PostHeap@0 n_8@@0 next))
)) (and (=> (= (ControlFlow 0 30) (- 0 31)) (forall ((n_8@@1 T@U) (n_8_1 T@U) ) (!  (=> (and (= (type n_8@@1) RefType) (= (type n_8_1) RefType)) (=> (and (and (and (and (not (= n_8@@1 n_8_1)) (U_2_bool (MapType2Select g n_8@@1))) (U_2_bool (MapType2Select g n_8_1))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_8@@1 n_8_1))))
 :qid |stdinbpl.5018:25|
 :skolemid |559|
 :pattern ( (neverTriggered59 n_8@@1) (neverTriggered59 n_8_1))
))) (=> (forall ((n_8@@2 T@U) (n_8_1@@0 T@U) ) (!  (=> (and (= (type n_8@@2) RefType) (= (type n_8_1@@0) RefType)) (=> (and (and (and (and (not (= n_8@@2 n_8_1@@0)) (U_2_bool (MapType2Select g n_8@@2))) (U_2_bool (MapType2Select g n_8_1@@0))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= n_8@@2 n_8_1@@0))))
 :qid |stdinbpl.5018:25|
 :skolemid |559|
 :pattern ( (neverTriggered59 n_8@@2) (neverTriggered59 n_8_1@@0))
)) (=> (= (ControlFlow 0 30) (- 0 29)) (forall ((n_8@@3 T@U) ) (!  (=> (and (= (type n_8@@3) RefType) (U_2_bool (MapType2Select g n_8@@3))) (>= (U_2_real (MapType1Select QPMask@2 n_8@@3 next)) (/ (to_real 1) (to_real 2))))
 :qid |stdinbpl.5025:25|
 :skolemid |560|
 :pattern ( (MapType0Select PostHeap@0 n_8@@3 next))
 :pattern ( (MapType1Select QPMask@5 n_8@@3 next))
 :pattern ( (MapType0Select PostHeap@0 n_8@@3 next))
)))))))))
(let ((anon97_correct true))
(let ((anon138_Else_correct  (=> (and (forall ((v1_3 T@U) (v2_3 T@U) ) (!  (=> (and (= (type v1_3) RefType) (= (type v2_3) RefType)) (= (exists_path ($$ PostHeap@0 g) v1_3 v2_3)  (or (= v1_3 v2_3) (and (not (= v1_3 v2_3)) (or (exists ((n_18 T@U) ) (!  (and (= (type n_18) RefType) (and (exists_path ($$ Heap@@23 g) v1_3 n_18) (and (exists_path ($$ Heap@@23 g) n_18 v2_3) (or (and (not (exists_path ($$ Heap@@23 g) n_18 x_1@@0)) (not (exists_path ($$ Heap@@23 g) x_1@@0 n_18))) (and (not (exists_path ($$ Heap@@23 g) n_18 (MapType0Select Heap@@23 x_1@@0 next))) (not (exists_path ($$ Heap@@23 g) (MapType0Select Heap@@23 x_1@@0 next) n_18)))))))
 :qid |stdinbpl.5815:104|
 :skolemid |658|
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| Heap@@23 g))) g) v1_3 n_18))
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| Heap@@23 g))) g) n_18 v2_3))
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| Heap@@23 g))) g) n_18 x_1@@0))
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| Heap@@23 g))) g) x_1@@0 n_18))
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| Heap@@23 g))) g) n_18 (MapType0Select Heap@@23 x_1@@0 next)))
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| Heap@@23 g))) g) (MapType0Select Heap@@23 x_1@@0 next) n_18))
)) (or (exists ((n_19 T@U) ) (!  (and (= (type n_19) RefType) (and (not (= n_19 x_1@@0)) (and (not (= n_19 (MapType0Select Heap@@23 x_1@@0 next))) (and (exists_path ($$ Heap@@23 g) x_1@@0 n_19) (exists_path ($$ Heap@@23 g) n_19 (MapType0Select Heap@@23 x_1@@0 next))))))
 :qid |stdinbpl.5818:23|
 :skolemid |659|
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| Heap@@23 g))) g) x_1@@0 n_19))
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| Heap@@23 g))) g) n_19 (MapType0Select Heap@@23 x_1@@0 next)))
)) (exists ((u_1_1@@1 T@U) (v_1_1@@1 T@U) ) (!  (and (and (= (type u_1_1@@1) RefType) (= (type v_1_1@@1) RefType)) (and (or (not (= u_1_1@@1 x_1@@0)) (not (= v_1_1@@1 (MapType0Select Heap@@23 x_1@@0 next)))) (and (edge ($$ Heap@@23 g) u_1_1@@1 v_1_1@@1) (and (exists_path ($$ Heap@@23 g) v1_3 u_1_1@@1) (and (exists_path ($$ Heap@@23 g) u_1_1@@1 x_1@@0) (and (exists_path ($$ Heap@@23 g) (MapType0Select Heap@@23 x_1@@0 next) v_1_1@@1) (exists_path ($$ Heap@@23 g) v_1_1@@1 v2_3)))))))
 :qid |stdinbpl.5821:22|
 :skolemid |660|
 :pattern ( (edge (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| Heap@@23 g))) g) u_1_1@@1 v_1_1@@1))
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| Heap@@23 g))) g) v1_3 u_1_1@@1) (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| Heap@@23 g))) g) (MapType0Select Heap@@23 x_1@@0 next) v_1_1@@1))
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| Heap@@23 g))) g) v1_3 u_1_1@@1) (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| Heap@@23 g))) g) v_1_1@@1 v2_3))
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| Heap@@23 g))) g) u_1_1@@1 x_1@@0) (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| Heap@@23 g))) g) (MapType0Select Heap@@23 x_1@@0 next) v_1_1@@1))
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| Heap@@23 g))) g) u_1_1@@1 x_1@@0) (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| Heap@@23 g))) g) v_1_1@@1 v2_3))
))))))))
 :qid |stdinbpl.5813:22|
 :skolemid |661|
 :pattern ( (exists_path (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| PostHeap@0 g))) g) v1_3 v2_3))
)) (= (ControlFlow 0 28) 26)) anon97_correct)))
(let ((anon137_Then_correct  (=> (and (not (= (MapType0Select Heap@@23 x_1@@0 next) null)) (state PostHeap@0 QPMask@2)) (and (and (and (=> (= (ControlFlow 0 135) 28) anon138_Else_correct) (=> (= (ControlFlow 0 135) 30) anon139_Then_correct)) (=> (= (ControlFlow 0 135) 134) anon140_Then_correct)) (=> (= (ControlFlow 0 135) 34) anon140_Else_correct)))))
(let ((anon137_Else_correct  (=> (and (= (MapType0Select Heap@@23 x_1@@0 next) null) (= (ControlFlow 0 27) 26)) anon97_correct)))
(let ((anon38_correct  (=> (state PostHeap@0 QPMask@2) (and (=> (= (ControlFlow 0 136) (- 0 137)) (HasDirectPerm QPMask@0 x_1@@0 next)) (=> (HasDirectPerm QPMask@0 x_1@@0 next) (and (=> (= (ControlFlow 0 136) 135) anon137_Then_correct) (=> (= (ControlFlow 0 136) 27) anon137_Else_correct)))))))
(let ((anon132_Else_correct  (=> (and (forall ((v1_1 T@U) (v2_1 T@U) ) (!  (=> (and (= (type v1_1) RefType) (= (type v2_1) RefType)) (= (edge ($$ PostHeap@0 g) v1_1 v2_1)  (and (edge ($$ Heap@@23 g) v1_1 v2_1) (not (and (= v1_1 x_1@@0) (= v2_1 (MapType0Select Heap@@23 x_1@@0 next)))))))
 :qid |stdinbpl.4988:22|
 :skolemid |557|
 :pattern ( (edge (|$$#frame| (FrameFragment (int_2_U (|$$#condqp1| PostHeap@0 g))) g) v1_1 v2_1))
)) (= (ControlFlow 0 139) 136)) anon38_correct)))
(let ((anon131_Then_correct  (=> (and (not (= (MapType0Select Heap@@23 x_1@@0 next) null)) (state PostHeap@0 QPMask@2)) (and (and (and (and (=> (= (ControlFlow 0 154) 139) anon132_Else_correct) (=> (= (ControlFlow 0 154) 141) anon133_Then_correct)) (=> (= (ControlFlow 0 154) 145) anon134_Then_correct)) (=> (= (ControlFlow 0 154) 153) anon135_Then_correct)) (=> (= (ControlFlow 0 154) 149) anon135_Else_correct)))))
(let ((anon131_Else_correct  (=> (and (= (MapType0Select Heap@@23 x_1@@0 next) null) (= (ControlFlow 0 138) 136)) anon38_correct)))
(let ((anon27_correct  (=> (state PostHeap@0 QPMask@2) (and (=> (= (ControlFlow 0 155) (- 0 156)) (HasDirectPerm QPMask@0 x_1@@0 next)) (=> (HasDirectPerm QPMask@0 x_1@@0 next) (and (=> (= (ControlFlow 0 155) 154) anon131_Then_correct) (=> (= (ControlFlow 0 155) 138) anon131_Else_correct)))))))
(let ((anon130_Else_correct  (=> (and (|Set#Equal| ($$ PostHeap@0 g) ($$ Heap@@23 g)) (= (ControlFlow 0 166) 155)) anon27_correct)))
(let ((anon128_Then_correct  (=> (and (= (MapType0Select Heap@@23 x_1@@0 next) null) (state PostHeap@0 QPMask@2)) (and (and (=> (= (ControlFlow 0 167) 159) anon129_Then_correct) (=> (= (ControlFlow 0 167) 163) anon130_Then_correct)) (=> (= (ControlFlow 0 167) 166) anon130_Else_correct)))))
(let ((anon128_Else_correct  (=> (and (not (= (MapType0Select Heap@@23 x_1@@0 next) null)) (= (ControlFlow 0 157) 155)) anon27_correct)))
(let ((anon126_Else_correct  (=> (and (forall ((n_3 T@U) ) (!  (=> (= (type n_3) RefType) (=> (and (U_2_bool (MapType2Select g n_3)) (not (= n_3 x_1@@0))) (= (MapType0Select PostHeap@0 n_3 next) (MapType0Select Heap@@23 n_3 next))))
 :qid |stdinbpl.4737:20|
 :skolemid |528|
 :pattern ( (MapType0Select Heap@@23 n_3 next))
)) (state PostHeap@0 QPMask@2)) (and (=> (= (ControlFlow 0 168) (- 0 169)) (HasDirectPerm QPMask@0 x_1@@0 next)) (=> (HasDirectPerm QPMask@0 x_1@@0 next) (and (=> (= (ControlFlow 0 168) 167) anon128_Then_correct) (=> (= (ControlFlow 0 168) 157) anon128_Else_correct)))))))
(let ((anon20_correct true))
(let ((anon127_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select g n_21)) (not (= n_21 x_1@@0)))) (= (ControlFlow 0 25) 21)) anon20_correct)))
(let ((anon127_Then_correct  (=> (and (U_2_bool (MapType2Select g n_21)) (not (= n_21 x_1@@0))) (and (=> (= (ControlFlow 0 22) (- 0 24)) (HasDirectPerm QPMask@2 n_21 next)) (=> (HasDirectPerm QPMask@2 n_21 next) (and (=> (= (ControlFlow 0 22) (- 0 23)) (HasDirectPerm QPMask@0 n_21 next)) (=> (HasDirectPerm QPMask@0 n_21 next) (=> (= (ControlFlow 0 22) 21) anon20_correct))))))))
(let ((anon123_Else_correct  (=> (and (forall ((n$2_1 T@U) ) (!  (=> (= (type n$2_1) RefType) (=> (and (U_2_bool (MapType2Select g n$2_1)) (not (= (MapType0Select PostHeap@0 n$2_1 next) null))) (U_2_bool (MapType2Select g (MapType0Select PostHeap@0 n$2_1 next)))))
 :qid |stdinbpl.4715:20|
 :skolemid |527|
 :pattern ( (MapType2Select g (MapType0Select PostHeap@0 n$2_1 next)))
 :pattern ( (MapType2Select g n$2_1) (MapType0Select PostHeap@0 n$2_1 next))
)) (state PostHeap@0 QPMask@2)) (and (=> (= (ControlFlow 0 170) (- 0 171)) (HasDirectPerm QPMask@2 x_1@@0 next)) (=> (HasDirectPerm QPMask@2 x_1@@0 next) (=> (and (= (MapType0Select PostHeap@0 x_1@@0 next) null) (state PostHeap@0 QPMask@2)) (and (and (=> (= (ControlFlow 0 170) 168) anon126_Else_correct) (=> (= (ControlFlow 0 170) 22) anon127_Then_correct)) (=> (= (ControlFlow 0 170) 25) anon127_Else_correct))))))))
(let ((anon16_correct true))
(let ((anon125_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select g n$2_5)) (not (= (MapType0Select PostHeap@0 n$2_5 next) null)))) (= (ControlFlow 0 17) 14)) anon16_correct)))
(let ((anon125_Then_correct  (=> (and (U_2_bool (MapType2Select g n$2_5)) (not (= (MapType0Select PostHeap@0 n$2_5 next) null))) (and (=> (= (ControlFlow 0 15) (- 0 16)) (HasDirectPerm QPMask@2 n$2_5 next)) (=> (HasDirectPerm QPMask@2 n$2_5 next) (=> (= (ControlFlow 0 15) 14) anon16_correct))))))
(let ((anon124_Else_correct  (=> (not (U_2_bool (MapType2Select g n$2_5))) (and (=> (= (ControlFlow 0 20) 15) anon125_Then_correct) (=> (= (ControlFlow 0 20) 17) anon125_Else_correct)))))
(let ((anon124_Then_correct  (=> (U_2_bool (MapType2Select g n$2_5)) (and (=> (= (ControlFlow 0 18) (- 0 19)) (HasDirectPerm QPMask@2 n$2_5 next)) (=> (HasDirectPerm QPMask@2 n$2_5 next) (and (=> (= (ControlFlow 0 18) 15) anon125_Then_correct) (=> (= (ControlFlow 0 18) 17) anon125_Else_correct)))))))
(let ((anon122_Else_correct  (and (=> (= (ControlFlow 0 172) (- 0 173)) (forall ((n$1_1 T@U) (n$1_1_1 T@U) ) (!  (=> (and (= (type n$1_1) RefType) (= (type n$1_1_1) RefType)) (=> (and (and (and (and (not (= n$1_1 n$1_1_1)) (U_2_bool (MapType2Select g n$1_1))) (U_2_bool (MapType2Select g n$1_1_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$1_1 n$1_1_1))))
 :qid |stdinbpl.4670:15|
 :skolemid |521|
 :no-pattern (type n$1_1)
 :no-pattern (type n$1_1_1)
 :no-pattern (U_2_int n$1_1)
 :no-pattern (U_2_bool n$1_1)
 :no-pattern (U_2_int n$1_1_1)
 :no-pattern (U_2_bool n$1_1_1)
))) (=> (forall ((n$1_1@@0 T@U) (n$1_1_1@@0 T@U) ) (!  (=> (and (= (type n$1_1@@0) RefType) (= (type n$1_1_1@@0) RefType)) (=> (and (and (and (and (not (= n$1_1@@0 n$1_1_1@@0)) (U_2_bool (MapType2Select g n$1_1@@0))) (U_2_bool (MapType2Select g n$1_1_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$1_1@@0 n$1_1_1@@0))))
 :qid |stdinbpl.4670:15|
 :skolemid |521|
 :no-pattern (type n$1_1@@0)
 :no-pattern (type n$1_1_1@@0)
 :no-pattern (U_2_int n$1_1@@0)
 :no-pattern (U_2_bool n$1_1@@0)
 :no-pattern (U_2_int n$1_1_1@@0)
 :no-pattern (U_2_bool n$1_1_1@@0)
)) (=> (and (forall ((n$1_1@@1 T@U) ) (!  (=> (= (type n$1_1@@1) RefType) (=> (and (U_2_bool (MapType2Select g n$1_1@@1)) (< NoPerm FullPerm)) (and (qpRange54 n$1_1@@1) (= (invRecv54 n$1_1@@1) n$1_1@@1))))
 :qid |stdinbpl.4676:22|
 :skolemid |522|
 :pattern ( (MapType0Select PostHeap@0 n$1_1@@1 next))
 :pattern ( (MapType1Select QPMask@2 n$1_1@@1 next))
 :pattern ( (MapType0Select PostHeap@0 n$1_1@@1 next))
)) (forall ((o_3 T@U) ) (!  (=> (= (type o_3) RefType) (=> (and (and (U_2_bool (MapType2Select g (invRecv54 o_3))) (< NoPerm FullPerm)) (qpRange54 o_3)) (= (invRecv54 o_3) o_3)))
 :qid |stdinbpl.4680:22|
 :skolemid |523|
 :pattern ( (invRecv54 o_3))
))) (=> (and (and (forall ((n$1_1@@2 T@U) ) (!  (=> (and (= (type n$1_1@@2) RefType) (U_2_bool (MapType2Select g n$1_1@@2))) (not (= n$1_1@@2 null)))
 :qid |stdinbpl.4686:22|
 :skolemid |524|
 :pattern ( (MapType0Select PostHeap@0 n$1_1@@2 next))
 :pattern ( (MapType1Select QPMask@2 n$1_1@@2 next))
 :pattern ( (MapType0Select PostHeap@0 n$1_1@@2 next))
)) (forall ((o_3@@0 T@U) ) (!  (=> (= (type o_3@@0) RefType) (and (=> (and (and (U_2_bool (MapType2Select g (invRecv54 o_3@@0))) (< NoPerm FullPerm)) (qpRange54 o_3@@0)) (and (=> (< NoPerm FullPerm) (= (invRecv54 o_3@@0) o_3@@0)) (= (U_2_real (MapType1Select QPMask@2 o_3@@0 next)) (+ (U_2_real (MapType1Select ZeroMask o_3@@0 next)) FullPerm)))) (=> (not (and (and (U_2_bool (MapType2Select g (invRecv54 o_3@@0))) (< NoPerm FullPerm)) (qpRange54 o_3@@0))) (= (U_2_real (MapType1Select QPMask@2 o_3@@0 next)) (U_2_real (MapType1Select ZeroMask o_3@@0 next))))))
 :qid |stdinbpl.4692:22|
 :skolemid |525|
 :pattern ( (MapType1Select QPMask@2 o_3@@0 next))
))) (and (forall ((o_3@@1 T@U) (f_5 T@U) ) (! (let ((B@@11 (FieldTypeInv1 (type f_5))))
(let ((A@@12 (FieldTypeInv0 (type f_5))))
 (=> (and (and (= (type o_3@@1) RefType) (= (type f_5) (FieldType A@@12 B@@11))) (not (= f_5 next))) (= (U_2_real (MapType1Select ZeroMask o_3@@1 f_5)) (U_2_real (MapType1Select QPMask@2 o_3@@1 f_5))))))
 :qid |stdinbpl.4696:29|
 :skolemid |526|
 :pattern ( (MapType1Select ZeroMask o_3@@1 f_5))
 :pattern ( (MapType1Select QPMask@2 o_3@@1 f_5))
)) (state PostHeap@0 QPMask@2))) (and (and (=> (= (ControlFlow 0 172) 170) anon123_Else_correct) (=> (= (ControlFlow 0 172) 18) anon124_Then_correct)) (=> (= (ControlFlow 0 172) 20) anon124_Else_correct))))))))
(let ((anon122_Then_correct true))
(let ((anon121_Then_correct  (=> (and (state PostHeap@0 ZeroMask) (not (U_2_bool (MapType2Select g null)))) (and (=> (= (ControlFlow 0 174) 13) anon122_Then_correct) (=> (= (ControlFlow 0 174) 172) anon122_Else_correct)))))
(let ((anon121_Else_correct true))
(let ((anon118_Else_correct  (=> (and (forall ((n$0_1 T@U) ) (!  (=> (= (type n$0_1) RefType) (=> (and (U_2_bool (MapType2Select g n$0_1)) (not (= (MapType0Select Heap@@23 n$0_1 next) null))) (U_2_bool (MapType2Select g (MapType0Select Heap@@23 n$0_1 next)))))
 :qid |stdinbpl.4646:20|
 :skolemid |520|
 :pattern ( (MapType2Select g (MapType0Select Heap@@23 n$0_1 next)))
 :pattern ( (MapType2Select g n$0_1) (MapType0Select Heap@@23 n$0_1 next))
)) (state Heap@@23 QPMask@0)) (and (=> (= (ControlFlow 0 175) 174) anon121_Then_correct) (=> (= (ControlFlow 0 175) 10) anon121_Else_correct)))))
(let ((anon7_correct true))
(let ((anon120_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select g n$0_12)) (not (= (MapType0Select Heap@@23 n$0_12 next) null)))) (= (ControlFlow 0 5) 2)) anon7_correct)))
(let ((anon120_Then_correct  (=> (and (U_2_bool (MapType2Select g n$0_12)) (not (= (MapType0Select Heap@@23 n$0_12 next) null))) (and (=> (= (ControlFlow 0 3) (- 0 4)) (HasDirectPerm QPMask@0 n$0_12 next)) (=> (HasDirectPerm QPMask@0 n$0_12 next) (=> (= (ControlFlow 0 3) 2) anon7_correct))))))
(let ((anon119_Else_correct  (=> (not (U_2_bool (MapType2Select g n$0_12))) (and (=> (= (ControlFlow 0 8) 3) anon120_Then_correct) (=> (= (ControlFlow 0 8) 5) anon120_Else_correct)))))
(let ((anon119_Then_correct  (=> (U_2_bool (MapType2Select g n$0_12)) (and (=> (= (ControlFlow 0 6) (- 0 7)) (HasDirectPerm QPMask@0 n$0_12 next)) (=> (HasDirectPerm QPMask@0 n$0_12 next) (and (=> (= (ControlFlow 0 6) 3) anon120_Then_correct) (=> (= (ControlFlow 0 6) 5) anon120_Else_correct)))))))
(let ((anon117_Else_correct  (and (=> (= (ControlFlow 0 176) (- 0 177)) (forall ((n_1 T@U) (n_1_1 T@U) ) (!  (=> (and (= (type n_1) RefType) (= (type n_1_1) RefType)) (=> (and (and (and (and (not (= n_1 n_1_1)) (U_2_bool (MapType2Select g n_1))) (U_2_bool (MapType2Select g n_1_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_1 n_1_1))))
 :qid |stdinbpl.4601:15|
 :skolemid |514|
 :no-pattern (type n_1)
 :no-pattern (type n_1_1)
 :no-pattern (U_2_int n_1)
 :no-pattern (U_2_bool n_1)
 :no-pattern (U_2_int n_1_1)
 :no-pattern (U_2_bool n_1_1)
))) (=> (forall ((n_1@@0 T@U) (n_1_1@@0 T@U) ) (!  (=> (and (= (type n_1@@0) RefType) (= (type n_1_1@@0) RefType)) (=> (and (and (and (and (not (= n_1@@0 n_1_1@@0)) (U_2_bool (MapType2Select g n_1@@0))) (U_2_bool (MapType2Select g n_1_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_1@@0 n_1_1@@0))))
 :qid |stdinbpl.4601:15|
 :skolemid |514|
 :no-pattern (type n_1@@0)
 :no-pattern (type n_1_1@@0)
 :no-pattern (U_2_int n_1@@0)
 :no-pattern (U_2_bool n_1@@0)
 :no-pattern (U_2_int n_1_1@@0)
 :no-pattern (U_2_bool n_1_1@@0)
)) (=> (and (forall ((n_1@@1 T@U) ) (!  (=> (= (type n_1@@1) RefType) (=> (and (U_2_bool (MapType2Select g n_1@@1)) (< NoPerm FullPerm)) (and (qpRange53 n_1@@1) (= (invRecv53 n_1@@1) n_1@@1))))
 :qid |stdinbpl.4607:22|
 :skolemid |515|
 :pattern ( (MapType0Select Heap@@23 n_1@@1 next))
 :pattern ( (MapType1Select QPMask@0 n_1@@1 next))
 :pattern ( (MapType0Select Heap@@23 n_1@@1 next))
)) (forall ((o_3@@2 T@U) ) (!  (=> (= (type o_3@@2) RefType) (=> (and (and (U_2_bool (MapType2Select g (invRecv53 o_3@@2))) (< NoPerm FullPerm)) (qpRange53 o_3@@2)) (= (invRecv53 o_3@@2) o_3@@2)))
 :qid |stdinbpl.4611:22|
 :skolemid |516|
 :pattern ( (invRecv53 o_3@@2))
))) (=> (and (and (forall ((n_1@@2 T@U) ) (!  (=> (and (= (type n_1@@2) RefType) (U_2_bool (MapType2Select g n_1@@2))) (not (= n_1@@2 null)))
 :qid |stdinbpl.4617:22|
 :skolemid |517|
 :pattern ( (MapType0Select Heap@@23 n_1@@2 next))
 :pattern ( (MapType1Select QPMask@0 n_1@@2 next))
 :pattern ( (MapType0Select Heap@@23 n_1@@2 next))
)) (forall ((o_3@@3 T@U) ) (!  (=> (= (type o_3@@3) RefType) (and (=> (and (and (U_2_bool (MapType2Select g (invRecv53 o_3@@3))) (< NoPerm FullPerm)) (qpRange53 o_3@@3)) (and (=> (< NoPerm FullPerm) (= (invRecv53 o_3@@3) o_3@@3)) (= (U_2_real (MapType1Select QPMask@0 o_3@@3 next)) (+ (U_2_real (MapType1Select ZeroMask o_3@@3 next)) FullPerm)))) (=> (not (and (and (U_2_bool (MapType2Select g (invRecv53 o_3@@3))) (< NoPerm FullPerm)) (qpRange53 o_3@@3))) (= (U_2_real (MapType1Select QPMask@0 o_3@@3 next)) (U_2_real (MapType1Select ZeroMask o_3@@3 next))))))
 :qid |stdinbpl.4623:22|
 :skolemid |518|
 :pattern ( (MapType1Select QPMask@0 o_3@@3 next))
))) (and (forall ((o_3@@4 T@U) (f_5@@0 T@U) ) (! (let ((B@@12 (FieldTypeInv1 (type f_5@@0))))
(let ((A@@13 (FieldTypeInv0 (type f_5@@0))))
 (=> (and (and (= (type o_3@@4) RefType) (= (type f_5@@0) (FieldType A@@13 B@@12))) (not (= f_5@@0 next))) (= (U_2_real (MapType1Select ZeroMask o_3@@4 f_5@@0)) (U_2_real (MapType1Select QPMask@0 o_3@@4 f_5@@0))))))
 :qid |stdinbpl.4627:29|
 :skolemid |519|
 :pattern ( (MapType1Select ZeroMask o_3@@4 f_5@@0))
 :pattern ( (MapType1Select QPMask@0 o_3@@4 f_5@@0))
)) (state Heap@@23 QPMask@0))) (and (and (=> (= (ControlFlow 0 176) 175) anon118_Else_correct) (=> (= (ControlFlow 0 176) 6) anon119_Then_correct)) (=> (= (ControlFlow 0 176) 8) anon119_Else_correct))))))))
(let ((anon117_Then_correct true))
(let ((anon0_correct  (=> (and (state Heap@@23 ZeroMask) (= AssumeFunctionsAbove (- 0 1))) (=> (and (and (U_2_bool (MapType0Select Heap@@23 x_1@@0 $allocated)) (U_2_bool (MapType2Select g x_1@@0))) (and (state Heap@@23 ZeroMask) (not (U_2_bool (MapType2Select g null))))) (and (=> (= (ControlFlow 0 178) 1) anon117_Then_correct) (=> (= (ControlFlow 0 178) 176) anon117_Else_correct))))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 179) 178) anon0_correct)))
PreconditionGeneratedEntry_correct))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
))
(check-sat)
(pop 1)
; Valid
(get-info :rlimit)
