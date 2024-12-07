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
(declare-fun q_1 () T@U)
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
(declare-fun |Math#min| (Int Int) Int)
(declare-fun IdenticalOnKnownLocations (T@U T@U T@U) Bool)
(declare-fun IsPredicateField (T@U) Bool)
(declare-fun null () T@U)
(declare-fun PredicateMaskField (T@U) T@U)
(declare-fun FrameTypeType () T@T)
(declare-fun HasDirectPerm (T@U T@U T@U) Bool)
(declare-fun IsWandField (T@U) Bool)
(declare-fun WandMaskField (T@U) T@U)
(declare-fun |P#condqp1| (T@U T@U) Int)
(declare-fun MapType2Select (T@U T@U) T@U)
(declare-fun refs (T@U T@U) T@U)
(declare-fun |sk_P#condqp1| (Int Int) T@U)
(declare-fun Q (T@U) T@U)
(declare-fun MapType2Type (T@T T@T) T@T)
(declare-fun MapType2TypeInv0 (T@T) T@T)
(declare-fun MapType2TypeInv1 (T@T) T@T)
(declare-fun MapType2Store (T@U T@U T@U) T@U)
(declare-fun PredicateType_QType () T@T)
(declare-fun P (T@U) T@U)
(declare-fun PredicateType_PType () T@T)
(declare-fun P2 (T@U) T@U)
(declare-fun PredicateType_P2Type () T@T)
(declare-fun R (T@U) T@U)
(declare-fun PredicateType_RType () T@T)
(declare-fun R2 (T@U) T@U)
(declare-fun PredicateType_R2Type () T@T)
(declare-fun |refs'| (T@U T@U) T@U)
(declare-fun dummyFunction (T@U) Bool)
(declare-fun |refs#triggerStateless| (T@U) T@U)
(declare-fun |get'| (T@U T@U) T@U)
(declare-fun |get#triggerStateless| (T@U) T@U)
(declare-fun |tester'| (T@U T@U) T@U)
(declare-fun |tester#triggerStateless| (T@U) T@U)
(declare-fun |testerFull'| (T@U T@U) T@U)
(declare-fun |testerFull#triggerStateless| (T@U) T@U)
(declare-fun |testerfield'| (T@U T@U) T@U)
(declare-fun |testerfield#triggerStateless| (T@U) T@U)
(declare-fun |testerfieldFull'| (T@U T@U) T@U)
(declare-fun |testerfieldFull#triggerStateless| (T@U) T@U)
(declare-fun |P#trigger| (T@U T@U) Bool)
(declare-fun |P#everUsed| (T@U) Bool)
(declare-fun |P2#trigger| (T@U T@U) Bool)
(declare-fun |P2#everUsed| (T@U) Bool)
(declare-fun |R#trigger| (T@U T@U) Bool)
(declare-fun |R#everUsed| (T@U) Bool)
(declare-fun |R2#trigger| (T@U T@U) Bool)
(declare-fun |R2#everUsed| (T@U) Bool)
(declare-fun |Q#trigger| (T@U T@U) Bool)
(declare-fun |Q#everUsed| (T@U) Bool)
(declare-fun |MultiSet#Select| (T@U T@U) Int)
(declare-fun |Set#Union| (T@U T@U) T@U)
(declare-fun |Set#Intersection| (T@U T@U) T@U)
(declare-fun |Set#Singleton| (T@U) T@U)
(declare-fun |Set#Card| (T@U) Int)
(declare-fun get (T@U T@U) T@U)
(declare-fun tester (T@U T@U) T@U)
(declare-fun testerFull (T@U T@U) T@U)
(declare-fun testerfield (T@U T@U) T@U)
(declare-fun testerfieldFull (T@U T@U) T@U)
(declare-fun |Math#clip| (Int) Int)
(declare-fun |P#sm| (T@U) T@U)
(declare-fun |P2#sm| (T@U) T@U)
(declare-fun |R#sm| (T@U) T@U)
(declare-fun |R2#sm| (T@U) T@U)
(declare-fun |Q#sm| (T@U) T@U)
(declare-fun AssumeFunctionsAbove () Int)
(declare-fun |get#trigger| (T@U T@U) Bool)
(declare-fun EmptyFrame () T@U)
(declare-fun dummyHeap () T@U)
(declare-fun ZeroMask () T@U)
(declare-fun |MultiSet#UnionOne| (T@U T@U) T@U)
(declare-fun |MultiSet#Disjoint| (T@U T@U) Bool)
(declare-fun InsidePredicate (T@U T@U T@U T@U) Bool)
(declare-fun |MultiSet#Singleton| (T@U) T@U)
(declare-fun |Set#Equal| (T@U T@U) Bool)
(declare-fun sumMask (T@U T@U T@U) Bool)
(declare-fun ConditionalFrame (Real T@U) T@U)
(declare-fun NoPerm () Real)
(declare-fun |Set#Difference| (T@U T@U) T@U)
(declare-fun |MultiSet#Equal| (T@U T@U) Bool)
(declare-fun |Set#UnionOne| (T@U T@U) T@U)
(declare-fun |R2#condqp4| (T@U T@U) Int)
(declare-fun |sk_R2#condqp4| (Int Int) T@U)
(declare-fun |MultiSet#Empty| (T@T) T@U)
(declare-fun getPredWandId (T@U) Int)
(declare-fun FullPerm () Real)
(declare-fun |refs#frame| (T@U T@U) T@U)
(declare-fun |get#frame| (T@U T@U) T@U)
(declare-fun |tester#frame| (T@U T@U) T@U)
(declare-fun |testerFull#frame| (T@U T@U) T@U)
(declare-fun |testerfield#frame| (T@U T@U) T@U)
(declare-fun FrameFragment (T@U) T@U)
(declare-fun |testerfieldFull#frame| (T@U T@U) T@U)
(declare-fun |Set#Empty| (T@T) T@U)
(declare-fun |R#condqp3| (T@U T@U) Int)
(declare-fun |sk_R#condqp3| (Int Int) T@U)
(declare-fun |Set#Subset| (T@U T@U) Bool)
(declare-fun ZeroPMask () T@U)
(declare-fun |MultiSet#Subset| (T@U T@U) Bool)
(declare-fun |P2#condqp2| (T@U T@U) Int)
(declare-fun |sk_P2#condqp2| (Int Int) T@U)
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
))) (= (Ctor NormalFieldType) 7)) (= (type $allocated) (FieldType NormalFieldType boolType))) (= (Ctor RefType) 8)) (= (type q_1) (FieldType NormalFieldType RefType))))
(assert (distinct $allocated q_1)
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
 :qid |stdinbpl.445:18|
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
(assert (forall ((a@@0 Int) (b@@0 Int) ) (!  (or (= (|Math#min| a@@0 b@@0) a@@0) (= (|Math#min| a@@0 b@@0) b@@0))
 :qid |stdinbpl.376:15|
 :skolemid |53|
 :pattern ( (|Math#min| a@@0 b@@0))
)))
(assert  (and (and (= (Ctor FrameTypeType) 12) (= (type null) RefType)) (forall ((arg0@@28 T@U) ) (! (let ((A (FieldTypeInv0 (type arg0@@28))))
(= (type (PredicateMaskField arg0@@28)) (FieldType A (MapType1Type RefType boolType))))
 :qid |funType:PredicateMaskField|
 :pattern ( (PredicateMaskField arg0@@28))
))))
(assert (forall ((Heap@@0 T@U) (ExhaleHeap T@U) (Mask@@0 T@U) (pm_f T@U) ) (! (let ((C (FieldTypeInv0 (type pm_f))))
 (=> (and (and (and (and (and (= (type Heap@@0) (MapType0Type RefType)) (= (type ExhaleHeap) (MapType0Type RefType))) (= (type Mask@@0) (MapType1Type RefType realType))) (= (type pm_f) (FieldType C FrameTypeType))) (IdenticalOnKnownLocations Heap@@0 ExhaleHeap Mask@@0)) (and (HasDirectPerm Mask@@0 null pm_f) (IsPredicateField pm_f))) (= (MapType0Select Heap@@0 null (PredicateMaskField pm_f)) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))))
 :qid |stdinbpl.47:19|
 :skolemid |2|
 :pattern ( (IdenticalOnKnownLocations Heap@@0 ExhaleHeap Mask@@0) (IsPredicateField pm_f) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))
)))
(assert (forall ((arg0@@29 T@U) ) (! (let ((A@@0 (FieldTypeInv0 (type arg0@@29))))
(= (type (WandMaskField arg0@@29)) (FieldType A@@0 (MapType1Type RefType boolType))))
 :qid |funType:WandMaskField|
 :pattern ( (WandMaskField arg0@@29))
)))
(assert (forall ((Heap@@1 T@U) (ExhaleHeap@@0 T@U) (Mask@@1 T@U) (pm_f@@0 T@U) ) (! (let ((C@@0 (FieldTypeInv0 (type pm_f@@0))))
 (=> (and (and (and (and (and (= (type Heap@@1) (MapType0Type RefType)) (= (type ExhaleHeap@@0) (MapType0Type RefType))) (= (type Mask@@1) (MapType1Type RefType realType))) (= (type pm_f@@0) (FieldType C@@0 FrameTypeType))) (IdenticalOnKnownLocations Heap@@1 ExhaleHeap@@0 Mask@@1)) (and (HasDirectPerm Mask@@1 null pm_f@@0) (IsWandField pm_f@@0))) (= (MapType0Select Heap@@1 null (WandMaskField pm_f@@0)) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))))
 :qid |stdinbpl.60:19|
 :skolemid |5|
 :pattern ( (IdenticalOnKnownLocations Heap@@1 ExhaleHeap@@0 Mask@@1) (IsWandField pm_f@@0) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))
)))
(assert  (and (and (and (and (and (and (and (and (and (and (forall ((arg0@@30 T@T) (arg1@@12 T@T) ) (! (= (Ctor (MapType2Type arg0@@30 arg1@@12)) 13)
 :qid |ctor:MapType2Type|
)) (forall ((arg0@@31 T@T) (arg1@@13 T@T) ) (! (= (MapType2TypeInv0 (MapType2Type arg0@@31 arg1@@13)) arg0@@31)
 :qid |typeInv:MapType2TypeInv0|
 :pattern ( (MapType2Type arg0@@31 arg1@@13))
))) (forall ((arg0@@32 T@T) (arg1@@14 T@T) ) (! (= (MapType2TypeInv1 (MapType2Type arg0@@32 arg1@@14)) arg1@@14)
 :qid |typeInv:MapType2TypeInv1|
 :pattern ( (MapType2Type arg0@@32 arg1@@14))
))) (forall ((arg0@@33 T@U) (arg1@@15 T@U) ) (! (let ((aVar1@@2 (MapType2TypeInv1 (type arg0@@33))))
(= (type (MapType2Select arg0@@33 arg1@@15)) aVar1@@2))
 :qid |funType:MapType2Select|
 :pattern ( (MapType2Select arg0@@33 arg1@@15))
))) (forall ((arg0@@34 T@U) (arg1@@16 T@U) (arg2@@3 T@U) ) (! (let ((aVar1@@3 (type arg2@@3)))
(let ((aVar0@@1 (type arg1@@16)))
(= (type (MapType2Store arg0@@34 arg1@@16 arg2@@3)) (MapType2Type aVar0@@1 aVar1@@3))))
 :qid |funType:MapType2Store|
 :pattern ( (MapType2Store arg0@@34 arg1@@16 arg2@@3))
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
)))) (forall ((arg0@@35 T@U) (arg1@@17 T@U) ) (! (= (type (refs arg0@@35 arg1@@17)) (MapType2Type RefType boolType))
 :qid |funType:refs|
 :pattern ( (refs arg0@@35 arg1@@17))
))) (forall ((arg0@@36 Int) (arg1@@18 Int) ) (! (= (type (|sk_P#condqp1| arg0@@36 arg1@@18)) RefType)
 :qid |funType:sk_P#condqp1|
 :pattern ( (|sk_P#condqp1| arg0@@36 arg1@@18))
))) (= (Ctor PredicateType_QType) 14)) (forall ((arg0@@37 T@U) ) (! (= (type (Q arg0@@37)) (FieldType PredicateType_QType FrameTypeType))
 :qid |funType:Q|
 :pattern ( (Q arg0@@37))
))))
(assert (forall ((Heap2Heap T@U) (Heap1Heap T@U) (r_1 T@U) ) (!  (=> (and (and (and (= (type Heap2Heap) (MapType0Type RefType)) (= (type Heap1Heap) (MapType0Type RefType))) (= (type r_1) RefType)) (and (= (U_2_bool (MapType2Select (refs Heap2Heap r_1) (|sk_P#condqp1| (|P#condqp1| Heap2Heap r_1) (|P#condqp1| Heap1Heap r_1)))) (U_2_bool (MapType2Select (refs Heap1Heap r_1) (|sk_P#condqp1| (|P#condqp1| Heap2Heap r_1) (|P#condqp1| Heap1Heap r_1))))) (=> (U_2_bool (MapType2Select (refs Heap2Heap r_1) (|sk_P#condqp1| (|P#condqp1| Heap2Heap r_1) (|P#condqp1| Heap1Heap r_1)))) (= (MapType0Select Heap2Heap null (Q (|sk_P#condqp1| (|P#condqp1| Heap2Heap r_1) (|P#condqp1| Heap1Heap r_1)))) (MapType0Select Heap1Heap null (Q (|sk_P#condqp1| (|P#condqp1| Heap2Heap r_1) (|P#condqp1| Heap1Heap r_1)))))))) (= (|P#condqp1| Heap2Heap r_1) (|P#condqp1| Heap1Heap r_1)))
 :qid |stdinbpl.816:15|
 :skolemid |107|
 :pattern ( (|P#condqp1| Heap2Heap r_1) (|P#condqp1| Heap1Heap r_1) (succHeapTrans Heap2Heap Heap1Heap))
)))
(assert  (and (= (Ctor PredicateType_PType) 15) (forall ((arg0@@38 T@U) ) (! (= (type (P arg0@@38)) (FieldType PredicateType_PType FrameTypeType))
 :qid |funType:P|
 :pattern ( (P arg0@@38))
))))
(assert (forall ((r_1@@0 T@U) ) (!  (=> (= (type r_1@@0) RefType) (IsPredicateField (P r_1@@0)))
 :qid |stdinbpl.786:15|
 :skolemid |102|
 :pattern ( (P r_1@@0))
)))
(assert  (and (= (Ctor PredicateType_P2Type) 16) (forall ((arg0@@39 T@U) ) (! (= (type (P2 arg0@@39)) (FieldType PredicateType_P2Type FrameTypeType))
 :qid |funType:P2|
 :pattern ( (P2 arg0@@39))
))))
(assert (forall ((r_1@@1 T@U) ) (!  (=> (= (type r_1@@1) RefType) (IsPredicateField (P2 r_1@@1)))
 :qid |stdinbpl.895:15|
 :skolemid |115|
 :pattern ( (P2 r_1@@1))
)))
(assert  (and (= (Ctor PredicateType_RType) 17) (forall ((arg0@@40 T@U) ) (! (= (type (R arg0@@40)) (FieldType PredicateType_RType FrameTypeType))
 :qid |funType:R|
 :pattern ( (R arg0@@40))
))))
(assert (forall ((r_1@@2 T@U) ) (!  (=> (= (type r_1@@2) RefType) (IsPredicateField (R r_1@@2)))
 :qid |stdinbpl.1008:15|
 :skolemid |129|
 :pattern ( (R r_1@@2))
)))
(assert  (and (= (Ctor PredicateType_R2Type) 18) (forall ((arg0@@41 T@U) ) (! (= (type (R2 arg0@@41)) (FieldType PredicateType_R2Type FrameTypeType))
 :qid |funType:R2|
 :pattern ( (R2 arg0@@41))
))))
(assert (forall ((r_1@@3 T@U) ) (!  (=> (= (type r_1@@3) RefType) (IsPredicateField (R2 r_1@@3)))
 :qid |stdinbpl.1114:15|
 :skolemid |142|
 :pattern ( (R2 r_1@@3))
)))
(assert (forall ((r_1@@4 T@U) ) (!  (=> (= (type r_1@@4) RefType) (IsPredicateField (Q r_1@@4)))
 :qid |stdinbpl.1225:15|
 :skolemid |156|
 :pattern ( (Q r_1@@4))
)))
(assert  (and (forall ((arg0@@42 T@U) (arg1@@19 T@U) ) (! (= (type (|refs'| arg0@@42 arg1@@19)) (MapType2Type RefType boolType))
 :qid |funType:refs'|
 :pattern ( (|refs'| arg0@@42 arg1@@19))
)) (forall ((arg0@@43 T@U) ) (! (= (type (|refs#triggerStateless| arg0@@43)) (MapType2Type RefType boolType))
 :qid |funType:refs#triggerStateless|
 :pattern ( (|refs#triggerStateless| arg0@@43))
))))
(assert (forall ((Heap@@2 T@U) (r_1@@5 T@U) ) (!  (=> (and (= (type Heap@@2) (MapType0Type RefType)) (= (type r_1@@5) RefType)) (dummyFunction (|refs#triggerStateless| r_1@@5)))
 :qid |stdinbpl.489:15|
 :skolemid |83|
 :pattern ( (|refs'| Heap@@2 r_1@@5))
)))
(assert  (and (forall ((arg0@@44 T@U) (arg1@@20 T@U) ) (! (= (type (|get'| arg0@@44 arg1@@20)) RefType)
 :qid |funType:get'|
 :pattern ( (|get'| arg0@@44 arg1@@20))
)) (forall ((arg0@@45 T@U) ) (! (= (type (|get#triggerStateless| arg0@@45)) RefType)
 :qid |funType:get#triggerStateless|
 :pattern ( (|get#triggerStateless| arg0@@45))
))))
(assert (forall ((Heap@@3 T@U) (r_1@@6 T@U) ) (!  (=> (and (= (type Heap@@3) (MapType0Type RefType)) (= (type r_1@@6) RefType)) (dummyFunction (|get#triggerStateless| r_1@@6)))
 :qid |stdinbpl.530:15|
 :skolemid |86|
 :pattern ( (|get'| Heap@@3 r_1@@6))
)))
(assert  (and (forall ((arg0@@46 T@U) (arg1@@21 T@U) ) (! (= (type (|tester'| arg0@@46 arg1@@21)) RefType)
 :qid |funType:tester'|
 :pattern ( (|tester'| arg0@@46 arg1@@21))
)) (forall ((arg0@@47 T@U) ) (! (= (type (|tester#triggerStateless| arg0@@47)) RefType)
 :qid |funType:tester#triggerStateless|
 :pattern ( (|tester#triggerStateless| arg0@@47))
))))
(assert (forall ((Heap@@4 T@U) (r_1@@7 T@U) ) (!  (=> (and (= (type Heap@@4) (MapType0Type RefType)) (= (type r_1@@7) RefType)) (dummyFunction (|tester#triggerStateless| r_1@@7)))
 :qid |stdinbpl.588:15|
 :skolemid |90|
 :pattern ( (|tester'| Heap@@4 r_1@@7))
)))
(assert  (and (forall ((arg0@@48 T@U) (arg1@@22 T@U) ) (! (= (type (|testerFull'| arg0@@48 arg1@@22)) RefType)
 :qid |funType:testerFull'|
 :pattern ( (|testerFull'| arg0@@48 arg1@@22))
)) (forall ((arg0@@49 T@U) ) (! (= (type (|testerFull#triggerStateless| arg0@@49)) RefType)
 :qid |funType:testerFull#triggerStateless|
 :pattern ( (|testerFull#triggerStateless| arg0@@49))
))))
(assert (forall ((Heap@@5 T@U) (r_1@@8 T@U) ) (!  (=> (and (= (type Heap@@5) (MapType0Type RefType)) (= (type r_1@@8) RefType)) (dummyFunction (|testerFull#triggerStateless| r_1@@8)))
 :qid |stdinbpl.638:15|
 :skolemid |93|
 :pattern ( (|testerFull'| Heap@@5 r_1@@8))
)))
(assert  (and (forall ((arg0@@50 T@U) (arg1@@23 T@U) ) (! (= (type (|testerfield'| arg0@@50 arg1@@23)) RefType)
 :qid |funType:testerfield'|
 :pattern ( (|testerfield'| arg0@@50 arg1@@23))
)) (forall ((arg0@@51 T@U) ) (! (= (type (|testerfield#triggerStateless| arg0@@51)) RefType)
 :qid |funType:testerfield#triggerStateless|
 :pattern ( (|testerfield#triggerStateless| arg0@@51))
))))
(assert (forall ((Heap@@6 T@U) (r_1@@9 T@U) ) (!  (=> (and (= (type Heap@@6) (MapType0Type RefType)) (= (type r_1@@9) RefType)) (dummyFunction (|testerfield#triggerStateless| r_1@@9)))
 :qid |stdinbpl.686:15|
 :skolemid |96|
 :pattern ( (|testerfield'| Heap@@6 r_1@@9))
)))
(assert  (and (forall ((arg0@@52 T@U) (arg1@@24 T@U) ) (! (= (type (|testerfieldFull'| arg0@@52 arg1@@24)) RefType)
 :qid |funType:testerfieldFull'|
 :pattern ( (|testerfieldFull'| arg0@@52 arg1@@24))
)) (forall ((arg0@@53 T@U) ) (! (= (type (|testerfieldFull#triggerStateless| arg0@@53)) RefType)
 :qid |funType:testerfieldFull#triggerStateless|
 :pattern ( (|testerfieldFull#triggerStateless| arg0@@53))
))))
(assert (forall ((Heap@@7 T@U) (r_1@@10 T@U) ) (!  (=> (and (= (type Heap@@7) (MapType0Type RefType)) (= (type r_1@@10) RefType)) (dummyFunction (|testerfieldFull#triggerStateless| r_1@@10)))
 :qid |stdinbpl.737:15|
 :skolemid |99|
 :pattern ( (|testerfieldFull'| Heap@@7 r_1@@10))
)))
(assert (forall ((Heap@@8 T@U) (r_1@@11 T@U) ) (!  (=> (and (= (type Heap@@8) (MapType0Type RefType)) (= (type r_1@@11) RefType)) (|P#everUsed| (P r_1@@11)))
 :qid |stdinbpl.805:15|
 :skolemid |106|
 :pattern ( (|P#trigger| Heap@@8 (P r_1@@11)))
)))
(assert (forall ((Heap@@9 T@U) (r_1@@12 T@U) ) (!  (=> (and (= (type Heap@@9) (MapType0Type RefType)) (= (type r_1@@12) RefType)) (|P2#everUsed| (P2 r_1@@12)))
 :qid |stdinbpl.914:15|
 :skolemid |119|
 :pattern ( (|P2#trigger| Heap@@9 (P2 r_1@@12)))
)))
(assert (forall ((Heap@@10 T@U) (r_1@@13 T@U) ) (!  (=> (and (= (type Heap@@10) (MapType0Type RefType)) (= (type r_1@@13) RefType)) (|R#everUsed| (R r_1@@13)))
 :qid |stdinbpl.1027:15|
 :skolemid |133|
 :pattern ( (|R#trigger| Heap@@10 (R r_1@@13)))
)))
(assert (forall ((Heap@@11 T@U) (r_1@@14 T@U) ) (!  (=> (and (= (type Heap@@11) (MapType0Type RefType)) (= (type r_1@@14) RefType)) (|R2#everUsed| (R2 r_1@@14)))
 :qid |stdinbpl.1133:15|
 :skolemid |146|
 :pattern ( (|R2#trigger| Heap@@11 (R2 r_1@@14)))
)))
(assert (forall ((Heap@@12 T@U) (r_1@@15 T@U) ) (!  (=> (and (= (type Heap@@12) (MapType0Type RefType)) (= (type r_1@@15) RefType)) (|Q#everUsed| (Q r_1@@15)))
 :qid |stdinbpl.1244:15|
 :skolemid |160|
 :pattern ( (|Q#trigger| Heap@@12 (Q r_1@@15)))
)))
(assert (forall ((a@@1 T@U) (b@@1 T@U) (y@@1 T@U) ) (! (let ((T@@3 (type y@@1)))
 (=> (and (and (= (type a@@1) (MultiSetType T@@3)) (= (type b@@1) (MultiSetType T@@3))) (<= (|MultiSet#Select| a@@1 y@@1) (|MultiSet#Select| b@@1 y@@1))) (= (|MultiSet#Select| (|MultiSet#Difference| a@@1 b@@1) y@@1) 0)))
 :qid |stdinbpl.443:18|
 :skolemid |73|
 :pattern ( (|MultiSet#Difference| a@@1 b@@1) (|MultiSet#Select| b@@1 y@@1) (|MultiSet#Select| a@@1 y@@1))
)))
(assert (forall ((arg0@@54 T@U) (arg1@@25 T@U) ) (! (let ((T@@4 (MapType2TypeInv0 (type arg0@@54))))
(= (type (|Set#Union| arg0@@54 arg1@@25)) (MapType2Type T@@4 boolType)))
 :qid |funType:Set#Union|
 :pattern ( (|Set#Union| arg0@@54 arg1@@25))
)))
(assert (forall ((a@@2 T@U) (b@@2 T@U) ) (! (let ((T@@5 (MapType2TypeInv0 (type a@@2))))
 (=> (and (= (type a@@2) (MapType2Type T@@5 boolType)) (= (type b@@2) (MapType2Type T@@5 boolType))) (= (|Set#Union| (|Set#Union| a@@2 b@@2) b@@2) (|Set#Union| a@@2 b@@2))))
 :qid |stdinbpl.328:18|
 :skolemid |38|
 :pattern ( (|Set#Union| (|Set#Union| a@@2 b@@2) b@@2))
)))
(assert (forall ((arg0@@55 T@U) (arg1@@26 T@U) ) (! (let ((T@@6 (MapType2TypeInv0 (type arg0@@55))))
(= (type (|Set#Intersection| arg0@@55 arg1@@26)) (MapType2Type T@@6 boolType)))
 :qid |funType:Set#Intersection|
 :pattern ( (|Set#Intersection| arg0@@55 arg1@@26))
)))
(assert (forall ((a@@3 T@U) (b@@3 T@U) ) (! (let ((T@@7 (MapType2TypeInv0 (type a@@3))))
 (=> (and (= (type a@@3) (MapType2Type T@@7 boolType)) (= (type b@@3) (MapType2Type T@@7 boolType))) (= (|Set#Intersection| (|Set#Intersection| a@@3 b@@3) b@@3) (|Set#Intersection| a@@3 b@@3))))
 :qid |stdinbpl.332:18|
 :skolemid |40|
 :pattern ( (|Set#Intersection| (|Set#Intersection| a@@3 b@@3) b@@3))
)))
(assert (forall ((a@@4 T@U) (b@@4 T@U) ) (! (let ((T@@8 (MultiSetTypeInv0 (type a@@4))))
 (=> (and (= (type a@@4) (MultiSetType T@@8)) (= (type b@@4) (MultiSetType T@@8))) (= (|MultiSet#Intersection| (|MultiSet#Intersection| a@@4 b@@4) b@@4) (|MultiSet#Intersection| a@@4 b@@4))))
 :qid |stdinbpl.434:18|
 :skolemid |70|
 :pattern ( (|MultiSet#Intersection| (|MultiSet#Intersection| a@@4 b@@4) b@@4))
)))
(assert (forall ((arg0@@56 T@U) ) (! (let ((T@@9 (type arg0@@56)))
(= (type (|Set#Singleton| arg0@@56)) (MapType2Type T@@9 boolType)))
 :qid |funType:Set#Singleton|
 :pattern ( (|Set#Singleton| arg0@@56))
)))
(assert (forall ((r T@U) (o T@U) ) (! (let ((T@@10 (type r)))
 (=> (= (type o) T@@10) (= (U_2_bool (MapType2Select (|Set#Singleton| r) o)) (= r o))))
 :qid |stdinbpl.297:18|
 :skolemid |27|
 :pattern ( (MapType2Select (|Set#Singleton| r) o))
)))
(assert (forall ((a@@5 T@U) (b@@5 T@U) ) (! (let ((T@@11 (MapType2TypeInv0 (type a@@5))))
 (=> (and (= (type a@@5) (MapType2Type T@@11 boolType)) (= (type b@@5) (MapType2Type T@@11 boolType))) (= (+ (|Set#Card| (|Set#Union| a@@5 b@@5)) (|Set#Card| (|Set#Intersection| a@@5 b@@5))) (+ (|Set#Card| a@@5) (|Set#Card| b@@5)))))
 :qid |stdinbpl.336:18|
 :skolemid |42|
 :pattern ( (|Set#Card| (|Set#Union| a@@5 b@@5)))
 :pattern ( (|Set#Card| (|Set#Intersection| a@@5 b@@5)))
)))
(assert (forall ((Heap@@13 T@U) (ExhaleHeap@@1 T@U) (Mask@@2 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@13) (MapType0Type RefType)) (= (type ExhaleHeap@@1) (MapType0Type RefType))) (= (type Mask@@2) (MapType1Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@13 ExhaleHeap@@1 Mask@@2)) (U_2_bool (MapType0Select Heap@@13 o_1 $allocated))) (U_2_bool (MapType0Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.73:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@13 ExhaleHeap@@1 Mask@@2) (MapType0Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert (forall ((Heap@@14 T@U) (r_1@@16 T@U) ) (!  (=> (and (= (type Heap@@14) (MapType0Type RefType)) (= (type r_1@@16) RefType)) (and (= (refs Heap@@14 r_1@@16) (|refs'| Heap@@14 r_1@@16)) (dummyFunction (|refs#triggerStateless| r_1@@16))))
 :qid |stdinbpl.485:15|
 :skolemid |82|
 :pattern ( (refs Heap@@14 r_1@@16))
)))
(assert (forall ((arg0@@57 T@U) (arg1@@27 T@U) ) (! (= (type (get arg0@@57 arg1@@27)) RefType)
 :qid |funType:get|
 :pattern ( (get arg0@@57 arg1@@27))
)))
(assert (forall ((Heap@@15 T@U) (r_1@@17 T@U) ) (!  (=> (and (= (type Heap@@15) (MapType0Type RefType)) (= (type r_1@@17) RefType)) (and (= (get Heap@@15 r_1@@17) (|get'| Heap@@15 r_1@@17)) (dummyFunction (|get#triggerStateless| r_1@@17))))
 :qid |stdinbpl.526:15|
 :skolemid |85|
 :pattern ( (get Heap@@15 r_1@@17))
)))
(assert (forall ((arg0@@58 T@U) (arg1@@28 T@U) ) (! (= (type (tester arg0@@58 arg1@@28)) RefType)
 :qid |funType:tester|
 :pattern ( (tester arg0@@58 arg1@@28))
)))
(assert (forall ((Heap@@16 T@U) (r_1@@18 T@U) ) (!  (=> (and (= (type Heap@@16) (MapType0Type RefType)) (= (type r_1@@18) RefType)) (and (= (tester Heap@@16 r_1@@18) (|tester'| Heap@@16 r_1@@18)) (dummyFunction (|tester#triggerStateless| r_1@@18))))
 :qid |stdinbpl.584:15|
 :skolemid |89|
 :pattern ( (tester Heap@@16 r_1@@18))
)))
(assert (forall ((arg0@@59 T@U) (arg1@@29 T@U) ) (! (= (type (testerFull arg0@@59 arg1@@29)) RefType)
 :qid |funType:testerFull|
 :pattern ( (testerFull arg0@@59 arg1@@29))
)))
(assert (forall ((Heap@@17 T@U) (r_1@@19 T@U) ) (!  (=> (and (= (type Heap@@17) (MapType0Type RefType)) (= (type r_1@@19) RefType)) (and (= (testerFull Heap@@17 r_1@@19) (|testerFull'| Heap@@17 r_1@@19)) (dummyFunction (|testerFull#triggerStateless| r_1@@19))))
 :qid |stdinbpl.634:15|
 :skolemid |92|
 :pattern ( (testerFull Heap@@17 r_1@@19))
)))
(assert (forall ((arg0@@60 T@U) (arg1@@30 T@U) ) (! (= (type (testerfield arg0@@60 arg1@@30)) RefType)
 :qid |funType:testerfield|
 :pattern ( (testerfield arg0@@60 arg1@@30))
)))
(assert (forall ((Heap@@18 T@U) (r_1@@20 T@U) ) (!  (=> (and (= (type Heap@@18) (MapType0Type RefType)) (= (type r_1@@20) RefType)) (and (= (testerfield Heap@@18 r_1@@20) (|testerfield'| Heap@@18 r_1@@20)) (dummyFunction (|testerfield#triggerStateless| r_1@@20))))
 :qid |stdinbpl.682:15|
 :skolemid |95|
 :pattern ( (testerfield Heap@@18 r_1@@20))
)))
(assert (forall ((arg0@@61 T@U) (arg1@@31 T@U) ) (! (= (type (testerfieldFull arg0@@61 arg1@@31)) RefType)
 :qid |funType:testerfieldFull|
 :pattern ( (testerfieldFull arg0@@61 arg1@@31))
)))
(assert (forall ((Heap@@19 T@U) (r_1@@21 T@U) ) (!  (=> (and (= (type Heap@@19) (MapType0Type RefType)) (= (type r_1@@21) RefType)) (and (= (testerfieldFull Heap@@19 r_1@@21) (|testerfieldFull'| Heap@@19 r_1@@21)) (dummyFunction (|testerfieldFull#triggerStateless| r_1@@21))))
 :qid |stdinbpl.733:15|
 :skolemid |98|
 :pattern ( (testerfieldFull Heap@@19 r_1@@21))
)))
(assert (forall ((a@@6 Int) ) (!  (=> (<= 0 a@@6) (= (|Math#clip| a@@6) a@@6))
 :qid |stdinbpl.379:15|
 :skolemid |54|
 :pattern ( (|Math#clip| a@@6))
)))
(assert (forall ((a@@7 T@U) (b@@6 T@U) (o@@0 T@U) ) (! (let ((T@@12 (type o@@0)))
 (=> (and (= (type a@@7) (MultiSetType T@@12)) (= (type b@@6) (MultiSetType T@@12))) (= (|MultiSet#Select| (|MultiSet#Intersection| a@@7 b@@6) o@@0) (|Math#min| (|MultiSet#Select| a@@7 o@@0) (|MultiSet#Select| b@@6 o@@0)))))
 :qid |stdinbpl.430:18|
 :skolemid |69|
 :pattern ( (|MultiSet#Select| (|MultiSet#Intersection| a@@7 b@@6) o@@0))
)))
(assert (forall ((r_1@@22 T@U) (r2 T@U) ) (!  (=> (and (and (= (type r_1@@22) RefType) (= (type r2) RefType)) (= (P r_1@@22) (P r2))) (= r_1@@22 r2))
 :qid |stdinbpl.796:15|
 :skolemid |104|
 :pattern ( (P r_1@@22) (P r2))
)))
(assert (forall ((arg0@@62 T@U) ) (! (= (type (|P#sm| arg0@@62)) (FieldType PredicateType_PType (MapType1Type RefType boolType)))
 :qid |funType:P#sm|
 :pattern ( (|P#sm| arg0@@62))
)))
(assert (forall ((r_1@@23 T@U) (r2@@0 T@U) ) (!  (=> (and (and (= (type r_1@@23) RefType) (= (type r2@@0) RefType)) (= (|P#sm| r_1@@23) (|P#sm| r2@@0))) (= r_1@@23 r2@@0))
 :qid |stdinbpl.800:15|
 :skolemid |105|
 :pattern ( (|P#sm| r_1@@23) (|P#sm| r2@@0))
)))
(assert (forall ((r_1@@24 T@U) (r2@@1 T@U) ) (!  (=> (and (and (= (type r_1@@24) RefType) (= (type r2@@1) RefType)) (= (P2 r_1@@24) (P2 r2@@1))) (= r_1@@24 r2@@1))
 :qid |stdinbpl.905:15|
 :skolemid |117|
 :pattern ( (P2 r_1@@24) (P2 r2@@1))
)))
(assert (forall ((arg0@@63 T@U) ) (! (= (type (|P2#sm| arg0@@63)) (FieldType PredicateType_P2Type (MapType1Type RefType boolType)))
 :qid |funType:P2#sm|
 :pattern ( (|P2#sm| arg0@@63))
)))
(assert (forall ((r_1@@25 T@U) (r2@@2 T@U) ) (!  (=> (and (and (= (type r_1@@25) RefType) (= (type r2@@2) RefType)) (= (|P2#sm| r_1@@25) (|P2#sm| r2@@2))) (= r_1@@25 r2@@2))
 :qid |stdinbpl.909:15|
 :skolemid |118|
 :pattern ( (|P2#sm| r_1@@25) (|P2#sm| r2@@2))
)))
(assert (forall ((r_1@@26 T@U) (r2@@3 T@U) ) (!  (=> (and (and (= (type r_1@@26) RefType) (= (type r2@@3) RefType)) (= (R r_1@@26) (R r2@@3))) (= r_1@@26 r2@@3))
 :qid |stdinbpl.1018:15|
 :skolemid |131|
 :pattern ( (R r_1@@26) (R r2@@3))
)))
(assert (forall ((arg0@@64 T@U) ) (! (= (type (|R#sm| arg0@@64)) (FieldType PredicateType_RType (MapType1Type RefType boolType)))
 :qid |funType:R#sm|
 :pattern ( (|R#sm| arg0@@64))
)))
(assert (forall ((r_1@@27 T@U) (r2@@4 T@U) ) (!  (=> (and (and (= (type r_1@@27) RefType) (= (type r2@@4) RefType)) (= (|R#sm| r_1@@27) (|R#sm| r2@@4))) (= r_1@@27 r2@@4))
 :qid |stdinbpl.1022:15|
 :skolemid |132|
 :pattern ( (|R#sm| r_1@@27) (|R#sm| r2@@4))
)))
(assert (forall ((r_1@@28 T@U) (r2@@5 T@U) ) (!  (=> (and (and (= (type r_1@@28) RefType) (= (type r2@@5) RefType)) (= (R2 r_1@@28) (R2 r2@@5))) (= r_1@@28 r2@@5))
 :qid |stdinbpl.1124:15|
 :skolemid |144|
 :pattern ( (R2 r_1@@28) (R2 r2@@5))
)))
(assert (forall ((arg0@@65 T@U) ) (! (= (type (|R2#sm| arg0@@65)) (FieldType PredicateType_R2Type (MapType1Type RefType boolType)))
 :qid |funType:R2#sm|
 :pattern ( (|R2#sm| arg0@@65))
)))
(assert (forall ((r_1@@29 T@U) (r2@@6 T@U) ) (!  (=> (and (and (= (type r_1@@29) RefType) (= (type r2@@6) RefType)) (= (|R2#sm| r_1@@29) (|R2#sm| r2@@6))) (= r_1@@29 r2@@6))
 :qid |stdinbpl.1128:15|
 :skolemid |145|
 :pattern ( (|R2#sm| r_1@@29) (|R2#sm| r2@@6))
)))
(assert (forall ((r_1@@30 T@U) (r2@@7 T@U) ) (!  (=> (and (and (= (type r_1@@30) RefType) (= (type r2@@7) RefType)) (= (Q r_1@@30) (Q r2@@7))) (= r_1@@30 r2@@7))
 :qid |stdinbpl.1235:15|
 :skolemid |158|
 :pattern ( (Q r_1@@30) (Q r2@@7))
)))
(assert (forall ((arg0@@66 T@U) ) (! (= (type (|Q#sm| arg0@@66)) (FieldType PredicateType_QType (MapType1Type RefType boolType)))
 :qid |funType:Q#sm|
 :pattern ( (|Q#sm| arg0@@66))
)))
(assert (forall ((r_1@@31 T@U) (r2@@8 T@U) ) (!  (=> (and (and (= (type r_1@@31) RefType) (= (type r2@@8) RefType)) (= (|Q#sm| r_1@@31) (|Q#sm| r2@@8))) (= r_1@@31 r2@@8))
 :qid |stdinbpl.1239:15|
 :skolemid |159|
 :pattern ( (|Q#sm| r_1@@31) (|Q#sm| r2@@8))
)))
(assert (forall ((Heap@@20 T@U) (ExhaleHeap@@2 T@U) (Mask@@3 T@U) (o_1@@0 T@U) (f_2 T@U) ) (! (let ((B@@1 (FieldTypeInv1 (type f_2))))
(let ((A@@1 (FieldTypeInv0 (type f_2))))
 (=> (and (and (and (and (and (and (= (type Heap@@20) (MapType0Type RefType)) (= (type ExhaleHeap@@2) (MapType0Type RefType))) (= (type Mask@@3) (MapType1Type RefType realType))) (= (type o_1@@0) RefType)) (= (type f_2) (FieldType A@@1 B@@1))) (IdenticalOnKnownLocations Heap@@20 ExhaleHeap@@2 Mask@@3)) (HasDirectPerm Mask@@3 o_1@@0 f_2)) (= (MapType0Select Heap@@20 o_1@@0 f_2) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2)))))
 :qid |stdinbpl.42:22|
 :skolemid |1|
 :pattern ( (IdenticalOnKnownLocations Heap@@20 ExhaleHeap@@2 Mask@@3) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2))
)))
(assert (= (type EmptyFrame) FrameTypeType))
(assert (forall ((Heap@@21 T@U) (Mask@@4 T@U) (r_1@@32 T@U) ) (!  (=> (and (and (and (= (type Heap@@21) (MapType0Type RefType)) (= (type Mask@@4) (MapType1Type RefType realType))) (= (type r_1@@32) RefType)) (and (state Heap@@21 Mask@@4) (or (< AssumeFunctionsAbove 3) (|get#trigger| EmptyFrame r_1@@32)))) (U_2_bool (MapType2Select (refs Heap@@21 r_1@@32) (|get'| Heap@@21 r_1@@32))))
 :qid |stdinbpl.543:15|
 :skolemid |88|
 :pattern ( (state Heap@@21 Mask@@4) (|get'| Heap@@21 r_1@@32))
)))
(assert  (and (= (type dummyHeap) (MapType0Type RefType)) (= (type ZeroMask) (MapType1Type RefType realType))))
(assert (state dummyHeap ZeroMask))
(assert (forall ((arg0@@67 T@U) (arg1@@32 T@U) ) (! (let ((T@@13 (type arg1@@32)))
(= (type (|MultiSet#UnionOne| arg0@@67 arg1@@32)) (MultiSetType T@@13)))
 :qid |funType:MultiSet#UnionOne|
 :pattern ( (|MultiSet#UnionOne| arg0@@67 arg1@@32))
)))
(assert (forall ((a@@8 T@U) (x@@8 T@U) ) (! (let ((T@@14 (type x@@8)))
 (=> (= (type a@@8) (MultiSetType T@@14)) (= (|MultiSet#Card| (|MultiSet#UnionOne| a@@8 x@@8)) (+ (|MultiSet#Card| a@@8) 1))))
 :qid |stdinbpl.416:18|
 :skolemid |65|
 :pattern ( (|MultiSet#Card| (|MultiSet#UnionOne| a@@8 x@@8)))
 :pattern ( (|MultiSet#UnionOne| a@@8 x@@8) (|MultiSet#Card| a@@8))
)))
(assert (forall ((a@@9 T@U) (b@@7 T@U) ) (! (let ((T@@15 (MultiSetTypeInv0 (type a@@9))))
 (=> (and (= (type a@@9) (MultiSetType T@@15)) (= (type b@@7) (MultiSetType T@@15))) (= (|MultiSet#Disjoint| a@@9 b@@7) (forall ((o@@1 T@U) ) (!  (=> (= (type o@@1) T@@15) (or (= (|MultiSet#Select| a@@9 o@@1) 0) (= (|MultiSet#Select| b@@7 o@@1) 0)))
 :qid |stdinbpl.466:39|
 :skolemid |80|
 :pattern ( (|MultiSet#Select| a@@9 o@@1))
 :pattern ( (|MultiSet#Select| b@@7 o@@1))
)))))
 :qid |stdinbpl.465:18|
 :skolemid |81|
 :pattern ( (|MultiSet#Disjoint| a@@9 b@@7))
)))
(assert (forall ((p T@U) (v_1 T@U) (w T@U) ) (! (let ((A@@2 (FieldTypeInv0 (type p))))
 (=> (and (and (= (type p) (FieldType A@@2 FrameTypeType)) (= (type v_1) FrameTypeType)) (= (type w) FrameTypeType)) (not (InsidePredicate p v_1 p w))))
 :qid |stdinbpl.274:19|
 :skolemid |21|
 :pattern ( (InsidePredicate p v_1 p w))
)))
(assert (forall ((arg0@@68 T@U) ) (! (let ((T@@16 (type arg0@@68)))
(= (type (|MultiSet#Singleton| arg0@@68)) (MultiSetType T@@16)))
 :qid |funType:MultiSet#Singleton|
 :pattern ( (|MultiSet#Singleton| arg0@@68))
)))
(assert (forall ((r@@0 T@U) ) (!  (and (= (|MultiSet#Card| (|MultiSet#Singleton| r@@0)) 1) (= (|MultiSet#Select| (|MultiSet#Singleton| r@@0) r@@0) 1))
 :qid |stdinbpl.408:18|
 :skolemid |62|
 :pattern ( (|MultiSet#Singleton| r@@0))
)))
(assert  (not (IsPredicateField q_1)))
(assert  (not (IsWandField q_1)))
(assert (forall ((Heap@@22 T@U) (ExhaleHeap@@3 T@U) (Mask@@5 T@U) ) (!  (=> (and (and (and (= (type Heap@@22) (MapType0Type RefType)) (= (type ExhaleHeap@@3) (MapType0Type RefType))) (= (type Mask@@5) (MapType1Type RefType realType))) (IdenticalOnKnownLocations Heap@@22 ExhaleHeap@@3 Mask@@5)) (succHeap Heap@@22 ExhaleHeap@@3))
 :qid |stdinbpl.83:15|
 :skolemid |10|
 :pattern ( (IdenticalOnKnownLocations Heap@@22 ExhaleHeap@@3 Mask@@5))
)))
(assert (forall ((a@@10 T@U) (b@@8 T@U) ) (! (let ((T@@17 (MapType2TypeInv0 (type a@@10))))
 (=> (and (= (type a@@10) (MapType2Type T@@17 boolType)) (= (type b@@8) (MapType2Type T@@17 boolType))) (= (|Set#Equal| a@@10 b@@8) (forall ((o@@2 T@U) ) (!  (=> (= (type o@@2) T@@17) (= (U_2_bool (MapType2Select a@@10 o@@2)) (U_2_bool (MapType2Select b@@8 o@@2))))
 :qid |stdinbpl.361:31|
 :skolemid |48|
 :pattern ( (MapType2Select a@@10 o@@2))
 :pattern ( (MapType2Select b@@8 o@@2))
)))))
 :qid |stdinbpl.360:17|
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
 :qid |stdinbpl.426:18|
 :skolemid |68|
 :pattern ( (|MultiSet#Card| (|MultiSet#Union| a@@11 b@@9)))
 :pattern ( (|MultiSet#Card| a@@11) (|MultiSet#Union| a@@11 b@@9))
 :pattern ( (|MultiSet#Card| b@@9) (|MultiSet#Union| a@@11 b@@9))
)))
(assert (forall ((arg0@@69 Real) (arg1@@33 T@U) ) (! (= (type (ConditionalFrame arg0@@69 arg1@@33)) FrameTypeType)
 :qid |funType:ConditionalFrame|
 :pattern ( (ConditionalFrame arg0@@69 arg1@@33))
)))
(assert (forall ((p@@0 Real) (f_6 T@U) ) (!  (=> (= (type f_6) FrameTypeType) (= (ConditionalFrame p@@0 f_6) (ite (> p@@0 0.0) f_6 EmptyFrame)))
 :qid |stdinbpl.262:15|
 :skolemid |19|
 :pattern ( (ConditionalFrame p@@0 f_6))
)))
(assert (forall ((Mask@@6 T@U) (o_2@@0 T@U) (f_4@@0 T@U) ) (! (let ((B@@3 (FieldTypeInv1 (type f_4@@0))))
(let ((A@@4 (FieldTypeInv0 (type f_4@@0))))
 (=> (and (and (= (type Mask@@6) (MapType1Type RefType realType)) (= (type o_2@@0) RefType)) (= (type f_4@@0) (FieldType A@@4 B@@3))) (= (HasDirectPerm Mask@@6 o_2@@0 f_4@@0) (> (U_2_real (MapType1Select Mask@@6 o_2@@0 f_4@@0)) NoPerm)))))
 :qid |stdinbpl.133:22|
 :skolemid |17|
 :pattern ( (HasDirectPerm Mask@@6 o_2@@0 f_4@@0))
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
 :qid |stdinbpl.325:18|
 :skolemid |37|
 :pattern ( (MapType2Select (|Set#Intersection| a@@12 b@@10) o@@3))
 :pattern ( (|Set#Intersection| a@@12 b@@10) (MapType2Select a@@12 o@@3))
 :pattern ( (|Set#Intersection| a@@12 b@@10) (MapType2Select b@@10 o@@3))
)))
(assert (forall ((arg0@@70 T@U) (arg1@@34 T@U) ) (! (let ((T@@20 (MapType2TypeInv0 (type arg0@@70))))
(= (type (|Set#Difference| arg0@@70 arg1@@34)) (MapType2Type T@@20 boolType)))
 :qid |funType:Set#Difference|
 :pattern ( (|Set#Difference| arg0@@70 arg1@@34))
)))
(assert (forall ((a@@13 T@U) (b@@11 T@U) (o@@4 T@U) ) (! (let ((T@@21 (type o@@4)))
 (=> (and (= (type a@@13) (MapType2Type T@@21 boolType)) (= (type b@@11) (MapType2Type T@@21 boolType))) (= (U_2_bool (MapType2Select (|Set#Difference| a@@13 b@@11) o@@4))  (and (U_2_bool (MapType2Select a@@13 o@@4)) (not (U_2_bool (MapType2Select b@@11 o@@4)))))))
 :qid |stdinbpl.340:18|
 :skolemid |43|
 :pattern ( (MapType2Select (|Set#Difference| a@@13 b@@11) o@@4))
 :pattern ( (|Set#Difference| a@@13 b@@11) (MapType2Select a@@13 o@@4))
)))
(assert (forall ((a@@14 T@U) (b@@12 T@U) ) (! (let ((T@@22 (MapType2TypeInv0 (type a@@14))))
 (=> (and (and (= (type a@@14) (MapType2Type T@@22 boolType)) (= (type b@@12) (MapType2Type T@@22 boolType))) (|Set#Equal| a@@14 b@@12)) (= a@@14 b@@12)))
 :qid |stdinbpl.362:17|
 :skolemid |50|
 :pattern ( (|Set#Equal| a@@14 b@@12))
)))
(assert (forall ((a@@15 T@U) (b@@13 T@U) ) (! (let ((T@@23 (MultiSetTypeInv0 (type a@@15))))
 (=> (and (and (= (type a@@15) (MultiSetType T@@23)) (= (type b@@13) (MultiSetType T@@23))) (|MultiSet#Equal| a@@15 b@@13)) (= a@@15 b@@13)))
 :qid |stdinbpl.461:17|
 :skolemid |79|
 :pattern ( (|MultiSet#Equal| a@@15 b@@13))
)))
(assert (forall ((arg0@@71 T@U) (arg1@@35 T@U) ) (! (let ((T@@24 (type arg1@@35)))
(= (type (|Set#UnionOne| arg0@@71 arg1@@35)) (MapType2Type T@@24 boolType)))
 :qid |funType:Set#UnionOne|
 :pattern ( (|Set#UnionOne| arg0@@71 arg1@@35))
)))
(assert (forall ((a@@16 T@U) (x@@9 T@U) (y@@2 T@U) ) (! (let ((T@@25 (type x@@9)))
 (=> (and (and (= (type a@@16) (MapType2Type T@@25 boolType)) (= (type y@@2) T@@25)) (U_2_bool (MapType2Select a@@16 y@@2))) (U_2_bool (MapType2Select (|Set#UnionOne| a@@16 x@@9) y@@2))))
 :qid |stdinbpl.305:18|
 :skolemid |31|
 :pattern ( (|Set#UnionOne| a@@16 x@@9) (MapType2Select a@@16 y@@2))
)))
(assert (forall ((a@@17 T@U) (b@@14 T@U) (y@@3 T@U) ) (! (let ((T@@26 (type y@@3)))
 (=> (and (and (= (type a@@17) (MapType2Type T@@26 boolType)) (= (type b@@14) (MapType2Type T@@26 boolType))) (U_2_bool (MapType2Select a@@17 y@@3))) (U_2_bool (MapType2Select (|Set#Union| a@@17 b@@14) y@@3))))
 :qid |stdinbpl.315:18|
 :skolemid |35|
 :pattern ( (|Set#Union| a@@17 b@@14) (MapType2Select a@@17 y@@3))
)))
(assert (forall ((a@@18 T@U) (b@@15 T@U) (y@@4 T@U) ) (! (let ((T@@27 (type y@@4)))
 (=> (and (and (= (type a@@18) (MapType2Type T@@27 boolType)) (= (type b@@15) (MapType2Type T@@27 boolType))) (U_2_bool (MapType2Select b@@15 y@@4))) (U_2_bool (MapType2Select (|Set#Union| a@@18 b@@15) y@@4))))
 :qid |stdinbpl.317:18|
 :skolemid |36|
 :pattern ( (|Set#Union| a@@18 b@@15) (MapType2Select b@@15 y@@4))
)))
(assert (forall ((ms T@U) (x@@10 T@U) ) (! (let ((T@@28 (type x@@10)))
 (=> (= (type ms) (MultiSetType T@@28)) (>= (|MultiSet#Select| ms x@@10) 0)))
 :qid |stdinbpl.392:18|
 :skolemid |56|
 :pattern ( (|MultiSet#Select| ms x@@10))
)))
(assert (forall ((a@@19 T@U) (x@@11 T@U) (o@@5 T@U) ) (! (let ((T@@29 (type x@@11)))
 (=> (and (= (type a@@19) (MapType2Type T@@29 boolType)) (= (type o@@5) T@@29)) (= (U_2_bool (MapType2Select (|Set#UnionOne| a@@19 x@@11) o@@5))  (or (= o@@5 x@@11) (U_2_bool (MapType2Select a@@19 o@@5))))))
 :qid |stdinbpl.301:18|
 :skolemid |29|
 :pattern ( (MapType2Select (|Set#UnionOne| a@@19 x@@11) o@@5))
)))
(assert (forall ((a@@20 T@U) (b@@16 T@U) (y@@5 T@U) ) (! (let ((T@@30 (type y@@5)))
 (=> (and (and (= (type a@@20) (MapType2Type T@@30 boolType)) (= (type b@@16) (MapType2Type T@@30 boolType))) (U_2_bool (MapType2Select b@@16 y@@5))) (not (U_2_bool (MapType2Select (|Set#Difference| a@@20 b@@16) y@@5)))))
 :qid |stdinbpl.342:18|
 :skolemid |44|
 :pattern ( (|Set#Difference| a@@20 b@@16) (MapType2Select b@@16 y@@5))
)))
(assert (forall ((a@@21 T@U) (b@@17 T@U) ) (! (let ((T@@31 (MapType2TypeInv0 (type a@@21))))
 (=> (and (= (type a@@21) (MapType2Type T@@31 boolType)) (= (type b@@17) (MapType2Type T@@31 boolType))) (and (= (+ (+ (|Set#Card| (|Set#Difference| a@@21 b@@17)) (|Set#Card| (|Set#Difference| b@@17 a@@21))) (|Set#Card| (|Set#Intersection| a@@21 b@@17))) (|Set#Card| (|Set#Union| a@@21 b@@17))) (= (|Set#Card| (|Set#Difference| a@@21 b@@17)) (- (|Set#Card| a@@21) (|Set#Card| (|Set#Intersection| a@@21 b@@17)))))))
 :qid |stdinbpl.344:18|
 :skolemid |45|
 :pattern ( (|Set#Card| (|Set#Difference| a@@21 b@@17)))
)))
(assert (forall ((arg0@@72 Int) (arg1@@36 Int) ) (! (= (type (|sk_R2#condqp4| arg0@@72 arg1@@36)) RefType)
 :qid |funType:sk_R2#condqp4|
 :pattern ( (|sk_R2#condqp4| arg0@@72 arg1@@36))
)))
(assert (forall ((Heap2Heap@@0 T@U) (Heap1Heap@@0 T@U) (r_1@@33 T@U) ) (!  (=> (and (and (and (= (type Heap2Heap@@0) (MapType0Type RefType)) (= (type Heap1Heap@@0) (MapType0Type RefType))) (= (type r_1@@33) RefType)) (and (=  (and (U_2_bool (MapType2Select (refs Heap2Heap@@0 r_1@@33) (|sk_R2#condqp4| (|R2#condqp4| Heap2Heap@@0 r_1@@33) (|R2#condqp4| Heap1Heap@@0 r_1@@33)))) (< NoPerm (/ (to_real 1) (to_real 2))))  (and (U_2_bool (MapType2Select (refs Heap1Heap@@0 r_1@@33) (|sk_R2#condqp4| (|R2#condqp4| Heap2Heap@@0 r_1@@33) (|R2#condqp4| Heap1Heap@@0 r_1@@33)))) (< NoPerm (/ (to_real 1) (to_real 2))))) (=> (and (U_2_bool (MapType2Select (refs Heap2Heap@@0 r_1@@33) (|sk_R2#condqp4| (|R2#condqp4| Heap2Heap@@0 r_1@@33) (|R2#condqp4| Heap1Heap@@0 r_1@@33)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (= (MapType0Select Heap2Heap@@0 (|sk_R2#condqp4| (|R2#condqp4| Heap2Heap@@0 r_1@@33) (|R2#condqp4| Heap1Heap@@0 r_1@@33)) q_1) (MapType0Select Heap1Heap@@0 (|sk_R2#condqp4| (|R2#condqp4| Heap2Heap@@0 r_1@@33) (|R2#condqp4| Heap1Heap@@0 r_1@@33)) q_1))))) (= (|R2#condqp4| Heap2Heap@@0 r_1@@33) (|R2#condqp4| Heap1Heap@@0 r_1@@33)))
 :qid |stdinbpl.1144:15|
 :skolemid |147|
 :pattern ( (|R2#condqp4| Heap2Heap@@0 r_1@@33) (|R2#condqp4| Heap1Heap@@0 r_1@@33) (succHeapTrans Heap2Heap@@0 Heap1Heap@@0))
)))
(assert (forall ((s T@U) ) (! (let ((T@@32 (MapType2TypeInv0 (type s))))
 (=> (= (type s) (MapType2Type T@@32 boolType)) (<= 0 (|Set#Card| s))))
 :qid |stdinbpl.287:18|
 :skolemid |22|
 :pattern ( (|Set#Card| s))
)))
(assert (forall ((s@@0 T@U) ) (! (let ((T@@33 (MultiSetTypeInv0 (type s@@0))))
 (=> (= (type s@@0) (MultiSetType T@@33)) (<= 0 (|MultiSet#Card| s@@0))))
 :qid |stdinbpl.395:18|
 :skolemid |57|
 :pattern ( (|MultiSet#Card| s@@0))
)))
(assert (forall ((T@@34 T@T) ) (! (= (type (|MultiSet#Empty| T@@34)) (MultiSetType T@@34))
 :qid |funType:MultiSet#Empty|
 :pattern ( (|MultiSet#Empty| T@@34))
)))
(assert (forall ((o@@6 T@U) ) (! (let ((T@@35 (type o@@6)))
(= (|MultiSet#Select| (|MultiSet#Empty| T@@35) o@@6) 0))
 :qid |stdinbpl.400:18|
 :skolemid |58|
 :pattern ( (let ((T@@35 (type o@@6)))
(|MultiSet#Select| (|MultiSet#Empty| T@@35) o@@6)))
)))
(assert (forall ((a@@22 T@U) (x@@12 T@U) ) (! (let ((T@@36 (type x@@12)))
 (=> (= (type a@@22) (MapType2Type T@@36 boolType)) (U_2_bool (MapType2Select (|Set#UnionOne| a@@22 x@@12) x@@12))))
 :qid |stdinbpl.303:18|
 :skolemid |30|
 :pattern ( (|Set#UnionOne| a@@22 x@@12))
)))
(assert (forall ((Heap@@23 T@U) (ExhaleHeap@@4 T@U) (Mask@@7 T@U) (pm_f@@1 T@U) ) (! (let ((C@@1 (FieldTypeInv0 (type pm_f@@1))))
 (=> (and (and (and (and (and (= (type Heap@@23) (MapType0Type RefType)) (= (type ExhaleHeap@@4) (MapType0Type RefType))) (= (type Mask@@7) (MapType1Type RefType realType))) (= (type pm_f@@1) (FieldType C@@1 FrameTypeType))) (IdenticalOnKnownLocations Heap@@23 ExhaleHeap@@4 Mask@@7)) (and (HasDirectPerm Mask@@7 null pm_f@@1) (IsPredicateField pm_f@@1))) (forall ((o2 T@U) (f_2@@0 T@U) ) (! (let ((B@@5 (FieldTypeInv1 (type f_2@@0))))
(let ((A@@6 (FieldTypeInv0 (type f_2@@0))))
 (=> (and (and (= (type o2) RefType) (= (type f_2@@0) (FieldType A@@6 B@@5))) (U_2_bool (MapType1Select (MapType0Select Heap@@23 null (PredicateMaskField pm_f@@1)) o2 f_2@@0))) (= (MapType0Select Heap@@23 o2 f_2@@0) (MapType0Select ExhaleHeap@@4 o2 f_2@@0)))))
 :qid |stdinbpl.54:134|
 :skolemid |3|
 :pattern ( (MapType0Select ExhaleHeap@@4 o2 f_2@@0))
))))
 :qid |stdinbpl.52:19|
 :skolemid |4|
 :pattern ( (IdenticalOnKnownLocations Heap@@23 ExhaleHeap@@4 Mask@@7) (IsPredicateField pm_f@@1))
)))
(assert (forall ((Heap@@24 T@U) (ExhaleHeap@@5 T@U) (Mask@@8 T@U) (pm_f@@2 T@U) ) (! (let ((C@@2 (FieldTypeInv0 (type pm_f@@2))))
 (=> (and (and (and (and (and (= (type Heap@@24) (MapType0Type RefType)) (= (type ExhaleHeap@@5) (MapType0Type RefType))) (= (type Mask@@8) (MapType1Type RefType realType))) (= (type pm_f@@2) (FieldType C@@2 FrameTypeType))) (IdenticalOnKnownLocations Heap@@24 ExhaleHeap@@5 Mask@@8)) (and (HasDirectPerm Mask@@8 null pm_f@@2) (IsWandField pm_f@@2))) (forall ((o2@@0 T@U) (f_2@@1 T@U) ) (! (let ((B@@6 (FieldTypeInv1 (type f_2@@1))))
(let ((A@@7 (FieldTypeInv0 (type f_2@@1))))
 (=> (and (and (= (type o2@@0) RefType) (= (type f_2@@1) (FieldType A@@7 B@@6))) (U_2_bool (MapType1Select (MapType0Select Heap@@24 null (WandMaskField pm_f@@2)) o2@@0 f_2@@1))) (= (MapType0Select Heap@@24 o2@@0 f_2@@1) (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1)))))
 :qid |stdinbpl.67:129|
 :skolemid |6|
 :pattern ( (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1))
))))
 :qid |stdinbpl.65:19|
 :skolemid |7|
 :pattern ( (IdenticalOnKnownLocations Heap@@24 ExhaleHeap@@5 Mask@@8) (IsWandField pm_f@@2))
)))
(assert (forall ((a@@23 T@U) (x@@13 T@U) ) (! (let ((T@@37 (type x@@13)))
 (=> (and (= (type a@@23) (MapType2Type T@@37 boolType)) (U_2_bool (MapType2Select a@@23 x@@13))) (= (|Set#Card| (|Set#UnionOne| a@@23 x@@13)) (|Set#Card| a@@23))))
 :qid |stdinbpl.307:18|
 :skolemid |32|
 :pattern ( (|Set#Card| (|Set#UnionOne| a@@23 x@@13)))
)))
(assert (forall ((a@@24 T@U) (x@@14 T@U) ) (! (let ((T@@38 (type x@@14)))
 (=> (= (type a@@24) (MultiSetType T@@38)) (and (> (|MultiSet#Select| (|MultiSet#UnionOne| a@@24 x@@14) x@@14) 0) (> (|MultiSet#Card| (|MultiSet#UnionOne| a@@24 x@@14)) 0))))
 :qid |stdinbpl.419:18|
 :skolemid |66|
 :pattern ( (|MultiSet#UnionOne| a@@24 x@@14))
)))
(assert (forall ((r_1@@34 T@U) ) (!  (=> (= (type r_1@@34) RefType) (= (getPredWandId (P r_1@@34)) 0))
 :qid |stdinbpl.790:15|
 :skolemid |103|
 :pattern ( (P r_1@@34))
)))
(assert (forall ((r_1@@35 T@U) ) (!  (=> (= (type r_1@@35) RefType) (= (getPredWandId (Q r_1@@35)) 1))
 :qid |stdinbpl.1229:15|
 :skolemid |157|
 :pattern ( (Q r_1@@35))
)))
(assert (forall ((r_1@@36 T@U) ) (!  (=> (= (type r_1@@36) RefType) (= (getPredWandId (P2 r_1@@36)) 2))
 :qid |stdinbpl.899:15|
 :skolemid |116|
 :pattern ( (P2 r_1@@36))
)))
(assert (forall ((r_1@@37 T@U) ) (!  (=> (= (type r_1@@37) RefType) (= (getPredWandId (R r_1@@37)) 3))
 :qid |stdinbpl.1012:15|
 :skolemid |130|
 :pattern ( (R r_1@@37))
)))
(assert (forall ((r_1@@38 T@U) ) (!  (=> (= (type r_1@@38) RefType) (= (getPredWandId (R2 r_1@@38)) 4))
 :qid |stdinbpl.1118:15|
 :skolemid |143|
 :pattern ( (R2 r_1@@38))
)))
(assert (forall ((r@@1 T@U) ) (! (= (|Set#Card| (|Set#Singleton| r@@1)) 1)
 :qid |stdinbpl.298:18|
 :skolemid |28|
 :pattern ( (|Set#Card| (|Set#Singleton| r@@1)))
)))
(assert (forall ((Mask@@9 T@U) (o_2@@2 T@U) (f_4@@2 T@U) ) (! (let ((B@@7 (FieldTypeInv1 (type f_4@@2))))
(let ((A@@8 (FieldTypeInv0 (type f_4@@2))))
 (=> (and (and (and (= (type Mask@@9) (MapType1Type RefType realType)) (= (type o_2@@2) RefType)) (= (type f_4@@2) (FieldType A@@8 B@@7))) (GoodMask Mask@@9)) (and (>= (U_2_real (MapType1Select Mask@@9 o_2@@2 f_4@@2)) NoPerm) (=> (and (and (GoodMask Mask@@9) (not (IsPredicateField f_4@@2))) (not (IsWandField f_4@@2))) (<= (U_2_real (MapType1Select Mask@@9 o_2@@2 f_4@@2)) FullPerm))))))
 :qid |stdinbpl.128:22|
 :skolemid |16|
 :pattern ( (GoodMask Mask@@9) (MapType1Select Mask@@9 o_2@@2 f_4@@2))
)))
(assert (forall ((r@@2 T@U) ) (! (U_2_bool (MapType2Select (|Set#Singleton| r@@2) r@@2))
 :qid |stdinbpl.296:18|
 :skolemid |26|
 :pattern ( (|Set#Singleton| r@@2))
)))
(assert (forall ((arg0@@73 T@U) (arg1@@37 T@U) ) (! (= (type (|refs#frame| arg0@@73 arg1@@37)) (MapType2Type RefType boolType))
 :qid |funType:refs#frame|
 :pattern ( (|refs#frame| arg0@@73 arg1@@37))
)))
(assert (forall ((Heap@@25 T@U) (Mask@@10 T@U) (r_1@@39 T@U) ) (!  (=> (and (and (and (= (type Heap@@25) (MapType0Type RefType)) (= (type Mask@@10) (MapType1Type RefType realType))) (= (type r_1@@39) RefType)) (state Heap@@25 Mask@@10)) (= (|refs'| Heap@@25 r_1@@39) (|refs#frame| EmptyFrame r_1@@39)))
 :qid |stdinbpl.496:15|
 :skolemid |84|
 :pattern ( (state Heap@@25 Mask@@10) (|refs'| Heap@@25 r_1@@39))
)))
(assert (forall ((arg0@@74 T@U) (arg1@@38 T@U) ) (! (= (type (|get#frame| arg0@@74 arg1@@38)) RefType)
 :qid |funType:get#frame|
 :pattern ( (|get#frame| arg0@@74 arg1@@38))
)))
(assert (forall ((Heap@@26 T@U) (Mask@@11 T@U) (r_1@@40 T@U) ) (!  (=> (and (and (and (= (type Heap@@26) (MapType0Type RefType)) (= (type Mask@@11) (MapType1Type RefType realType))) (= (type r_1@@40) RefType)) (state Heap@@26 Mask@@11)) (= (|get'| Heap@@26 r_1@@40) (|get#frame| EmptyFrame r_1@@40)))
 :qid |stdinbpl.537:15|
 :skolemid |87|
 :pattern ( (state Heap@@26 Mask@@11) (|get'| Heap@@26 r_1@@40))
)))
(assert (forall ((a@@25 T@U) (b@@18 T@U) ) (! (let ((T@@39 (MapType2TypeInv0 (type a@@25))))
 (=> (and (= (type a@@25) (MapType2Type T@@39 boolType)) (= (type b@@18) (MapType2Type T@@39 boolType))) (= (|Set#Union| a@@25 (|Set#Union| a@@25 b@@18)) (|Set#Union| a@@25 b@@18))))
 :qid |stdinbpl.330:18|
 :skolemid |39|
 :pattern ( (|Set#Union| a@@25 (|Set#Union| a@@25 b@@18)))
)))
(assert (forall ((a@@26 T@U) (b@@19 T@U) ) (! (let ((T@@40 (MapType2TypeInv0 (type a@@26))))
 (=> (and (= (type a@@26) (MapType2Type T@@40 boolType)) (= (type b@@19) (MapType2Type T@@40 boolType))) (= (|Set#Intersection| a@@26 (|Set#Intersection| a@@26 b@@19)) (|Set#Intersection| a@@26 b@@19))))
 :qid |stdinbpl.334:18|
 :skolemid |41|
 :pattern ( (|Set#Intersection| a@@26 (|Set#Intersection| a@@26 b@@19)))
)))
(assert (forall ((a@@27 T@U) (b@@20 T@U) ) (! (let ((T@@41 (MultiSetTypeInv0 (type a@@27))))
 (=> (and (= (type a@@27) (MultiSetType T@@41)) (= (type b@@20) (MultiSetType T@@41))) (= (|MultiSet#Intersection| a@@27 (|MultiSet#Intersection| a@@27 b@@20)) (|MultiSet#Intersection| a@@27 b@@20))))
 :qid |stdinbpl.436:18|
 :skolemid |71|
 :pattern ( (|MultiSet#Intersection| a@@27 (|MultiSet#Intersection| a@@27 b@@20)))
)))
(assert (forall ((s@@1 T@U) ) (! (let ((T@@42 (MultiSetTypeInv0 (type s@@1))))
 (=> (= (type s@@1) (MultiSetType T@@42)) (and (= (= (|MultiSet#Card| s@@1) 0) (= s@@1 (|MultiSet#Empty| T@@42))) (=> (not (= (|MultiSet#Card| s@@1) 0)) (exists ((x@@15 T@U) ) (!  (and (= (type x@@15) T@@42) (< 0 (|MultiSet#Select| s@@1 x@@15)))
 :qid |stdinbpl.403:38|
 :skolemid |59|
 :no-pattern (type x@@15)
 :no-pattern (U_2_int x@@15)
 :no-pattern (U_2_bool x@@15)
))))))
 :qid |stdinbpl.401:18|
 :skolemid |60|
 :pattern ( (|MultiSet#Card| s@@1))
)))
(assert (forall ((arg0@@75 T@U) (arg1@@39 T@U) ) (! (= (type (|tester#frame| arg0@@75 arg1@@39)) RefType)
 :qid |funType:tester#frame|
 :pattern ( (|tester#frame| arg0@@75 arg1@@39))
)))
(assert (forall ((Heap@@27 T@U) (Mask@@12 T@U) (r_1@@41 T@U) ) (!  (=> (and (and (and (= (type Heap@@27) (MapType0Type RefType)) (= (type Mask@@12) (MapType1Type RefType realType))) (= (type r_1@@41) RefType)) (state Heap@@27 Mask@@12)) (= (|tester'| Heap@@27 r_1@@41) (|tester#frame| (MapType0Select Heap@@27 null (Q r_1@@41)) r_1@@41)))
 :qid |stdinbpl.595:15|
 :skolemid |91|
 :pattern ( (state Heap@@27 Mask@@12) (|tester'| Heap@@27 r_1@@41))
)))
(assert (forall ((arg0@@76 T@U) (arg1@@40 T@U) ) (! (= (type (|testerFull#frame| arg0@@76 arg1@@40)) RefType)
 :qid |funType:testerFull#frame|
 :pattern ( (|testerFull#frame| arg0@@76 arg1@@40))
)))
(assert (forall ((Heap@@28 T@U) (Mask@@13 T@U) (r_1@@42 T@U) ) (!  (=> (and (and (and (= (type Heap@@28) (MapType0Type RefType)) (= (type Mask@@13) (MapType1Type RefType realType))) (= (type r_1@@42) RefType)) (state Heap@@28 Mask@@13)) (= (|testerFull'| Heap@@28 r_1@@42) (|testerFull#frame| (MapType0Select Heap@@28 null (Q r_1@@42)) r_1@@42)))
 :qid |stdinbpl.645:15|
 :skolemid |94|
 :pattern ( (state Heap@@28 Mask@@13) (|testerFull'| Heap@@28 r_1@@42))
)))
(assert  (and (forall ((arg0@@77 T@U) (arg1@@41 T@U) ) (! (= (type (|testerfield#frame| arg0@@77 arg1@@41)) RefType)
 :qid |funType:testerfield#frame|
 :pattern ( (|testerfield#frame| arg0@@77 arg1@@41))
)) (forall ((arg0@@78 T@U) ) (! (= (type (FrameFragment arg0@@78)) FrameTypeType)
 :qid |funType:FrameFragment|
 :pattern ( (FrameFragment arg0@@78))
))))
(assert (forall ((Heap@@29 T@U) (Mask@@14 T@U) (r_1@@43 T@U) ) (!  (=> (and (and (and (= (type Heap@@29) (MapType0Type RefType)) (= (type Mask@@14) (MapType1Type RefType realType))) (= (type r_1@@43) RefType)) (state Heap@@29 Mask@@14)) (= (|testerfield'| Heap@@29 r_1@@43) (|testerfield#frame| (FrameFragment (MapType0Select Heap@@29 r_1@@43 q_1)) r_1@@43)))
 :qid |stdinbpl.693:15|
 :skolemid |97|
 :pattern ( (state Heap@@29 Mask@@14) (|testerfield'| Heap@@29 r_1@@43))
)))
(assert (forall ((arg0@@79 T@U) (arg1@@42 T@U) ) (! (= (type (|testerfieldFull#frame| arg0@@79 arg1@@42)) RefType)
 :qid |funType:testerfieldFull#frame|
 :pattern ( (|testerfieldFull#frame| arg0@@79 arg1@@42))
)))
(assert (forall ((Heap@@30 T@U) (Mask@@15 T@U) (r_1@@44 T@U) ) (!  (=> (and (and (and (= (type Heap@@30) (MapType0Type RefType)) (= (type Mask@@15) (MapType1Type RefType realType))) (= (type r_1@@44) RefType)) (state Heap@@30 Mask@@15)) (= (|testerfieldFull'| Heap@@30 r_1@@44) (|testerfieldFull#frame| (FrameFragment (MapType0Select Heap@@30 r_1@@44 q_1)) r_1@@44)))
 :qid |stdinbpl.744:15|
 :skolemid |100|
 :pattern ( (state Heap@@30 Mask@@15) (|testerfieldFull'| Heap@@30 r_1@@44))
)))
(assert (forall ((r@@3 T@U) (o@@7 T@U) ) (! (let ((T@@43 (type r@@3)))
 (=> (= (type o@@7) T@@43) (and (= (= (|MultiSet#Select| (|MultiSet#Singleton| r@@3) o@@7) 1) (= r@@3 o@@7)) (= (= (|MultiSet#Select| (|MultiSet#Singleton| r@@3) o@@7) 0) (not (= r@@3 o@@7))))))
 :qid |stdinbpl.406:18|
 :skolemid |61|
 :pattern ( (|MultiSet#Select| (|MultiSet#Singleton| r@@3) o@@7))
)))
(assert (forall ((o@@8 T@U) (f T@U) (Heap@@31 T@U) ) (!  (=> (and (and (and (= (type o@@8) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap@@31) (MapType0Type RefType))) (U_2_bool (MapType0Select Heap@@31 o@@8 $allocated))) (U_2_bool (MapType0Select Heap@@31 (MapType0Select Heap@@31 o@@8 f) $allocated)))
 :qid |stdinbpl.31:15|
 :skolemid |0|
 :pattern ( (MapType0Select Heap@@31 o@@8 f))
)))
(assert (forall ((a@@28 T@U) (b@@21 T@U) (o@@9 T@U) ) (! (let ((T@@44 (type o@@9)))
 (=> (and (= (type a@@28) (MultiSetType T@@44)) (= (type b@@21) (MultiSetType T@@44))) (= (|MultiSet#Select| (|MultiSet#Union| a@@28 b@@21) o@@9) (+ (|MultiSet#Select| a@@28 o@@9) (|MultiSet#Select| b@@21 o@@9)))))
 :qid |stdinbpl.424:18|
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
 :qid |stdinbpl.290:18|
 :skolemid |23|
 :pattern ( (let ((T@@46 (type o@@10)))
(MapType2Select (|Set#Empty| T@@46) o@@10)))
)))
(assert (forall ((arg0@@80 Int) (arg1@@43 Int) ) (! (= (type (|sk_R#condqp3| arg0@@80 arg1@@43)) RefType)
 :qid |funType:sk_R#condqp3|
 :pattern ( (|sk_R#condqp3| arg0@@80 arg1@@43))
)))
(assert (forall ((Heap2Heap@@1 T@U) (Heap1Heap@@1 T@U) (r_1@@45 T@U) ) (!  (=> (and (and (and (= (type Heap2Heap@@1) (MapType0Type RefType)) (= (type Heap1Heap@@1) (MapType0Type RefType))) (= (type r_1@@45) RefType)) (and (= (U_2_bool (MapType2Select (refs Heap2Heap@@1 r_1@@45) (|sk_R#condqp3| (|R#condqp3| Heap2Heap@@1 r_1@@45) (|R#condqp3| Heap1Heap@@1 r_1@@45)))) (U_2_bool (MapType2Select (refs Heap1Heap@@1 r_1@@45) (|sk_R#condqp3| (|R#condqp3| Heap2Heap@@1 r_1@@45) (|R#condqp3| Heap1Heap@@1 r_1@@45))))) (=> (U_2_bool (MapType2Select (refs Heap2Heap@@1 r_1@@45) (|sk_R#condqp3| (|R#condqp3| Heap2Heap@@1 r_1@@45) (|R#condqp3| Heap1Heap@@1 r_1@@45)))) (= (MapType0Select Heap2Heap@@1 (|sk_R#condqp3| (|R#condqp3| Heap2Heap@@1 r_1@@45) (|R#condqp3| Heap1Heap@@1 r_1@@45)) q_1) (MapType0Select Heap1Heap@@1 (|sk_R#condqp3| (|R#condqp3| Heap2Heap@@1 r_1@@45) (|R#condqp3| Heap1Heap@@1 r_1@@45)) q_1))))) (= (|R#condqp3| Heap2Heap@@1 r_1@@45) (|R#condqp3| Heap1Heap@@1 r_1@@45)))
 :qid |stdinbpl.1038:15|
 :skolemid |134|
 :pattern ( (|R#condqp3| Heap2Heap@@1 r_1@@45) (|R#condqp3| Heap1Heap@@1 r_1@@45) (succHeapTrans Heap2Heap@@1 Heap1Heap@@1))
)))
(assert (forall ((r_1@@46 T@U) ) (!  (=> (= (type r_1@@46) RefType) (= (PredicateMaskField (P r_1@@46)) (|P#sm| r_1@@46)))
 :qid |stdinbpl.782:15|
 :skolemid |101|
 :pattern ( (PredicateMaskField (P r_1@@46)))
)))
(assert (forall ((r_1@@47 T@U) ) (!  (=> (= (type r_1@@47) RefType) (= (PredicateMaskField (P2 r_1@@47)) (|P2#sm| r_1@@47)))
 :qid |stdinbpl.891:15|
 :skolemid |114|
 :pattern ( (PredicateMaskField (P2 r_1@@47)))
)))
(assert (forall ((r_1@@48 T@U) ) (!  (=> (= (type r_1@@48) RefType) (= (PredicateMaskField (R r_1@@48)) (|R#sm| r_1@@48)))
 :qid |stdinbpl.1004:15|
 :skolemid |128|
 :pattern ( (PredicateMaskField (R r_1@@48)))
)))
(assert (forall ((r_1@@49 T@U) ) (!  (=> (= (type r_1@@49) RefType) (= (PredicateMaskField (R2 r_1@@49)) (|R2#sm| r_1@@49)))
 :qid |stdinbpl.1110:15|
 :skolemid |141|
 :pattern ( (PredicateMaskField (R2 r_1@@49)))
)))
(assert (forall ((r_1@@50 T@U) ) (!  (=> (= (type r_1@@50) RefType) (= (PredicateMaskField (Q r_1@@50)) (|Q#sm| r_1@@50)))
 :qid |stdinbpl.1221:15|
 :skolemid |155|
 :pattern ( (PredicateMaskField (Q r_1@@50)))
)))
(assert (forall ((r@@4 T@U) ) (! (let ((T@@47 (type r@@4)))
(= (|MultiSet#Singleton| r@@4) (|MultiSet#UnionOne| (|MultiSet#Empty| T@@47) r@@4)))
 :qid |stdinbpl.409:18|
 :skolemid |63|
 :pattern ( (|MultiSet#Singleton| r@@4))
)))
(assert (forall ((a@@29 Int) (b@@22 Int) ) (! (= (<= a@@29 b@@22) (= (|Math#min| a@@29 b@@22) a@@29))
 :qid |stdinbpl.374:15|
 :skolemid |51|
 :pattern ( (|Math#min| a@@29 b@@22))
)))
(assert (forall ((a@@30 Int) (b@@23 Int) ) (! (= (<= b@@23 a@@30) (= (|Math#min| a@@30 b@@23) b@@23))
 :qid |stdinbpl.375:15|
 :skolemid |52|
 :pattern ( (|Math#min| a@@30 b@@23))
)))
(assert (forall ((s@@2 T@U) ) (! (let ((T@@48 (MapType2TypeInv0 (type s@@2))))
 (=> (= (type s@@2) (MapType2Type T@@48 boolType)) (and (= (= (|Set#Card| s@@2) 0) (= s@@2 (|Set#Empty| T@@48))) (=> (not (= (|Set#Card| s@@2) 0)) (exists ((x@@16 T@U) ) (!  (and (= (type x@@16) T@@48) (U_2_bool (MapType2Select s@@2 x@@16)))
 :qid |stdinbpl.293:33|
 :skolemid |24|
 :no-pattern (type x@@16)
 :no-pattern (U_2_int x@@16)
 :no-pattern (U_2_bool x@@16)
))))))
 :qid |stdinbpl.291:18|
 :skolemid |25|
 :pattern ( (|Set#Card| s@@2))
)))
(assert (forall ((Heap@@32 T@U) (o@@11 T@U) (f_3 T@U) (v T@U) ) (! (let ((B@@8 (type v)))
(let ((A@@9 (FieldTypeInv0 (type f_3))))
 (=> (and (and (= (type Heap@@32) (MapType0Type RefType)) (= (type o@@11) RefType)) (= (type f_3) (FieldType A@@9 B@@8))) (succHeap Heap@@32 (MapType0Store Heap@@32 o@@11 f_3 v)))))
 :qid |stdinbpl.78:22|
 :skolemid |9|
 :pattern ( (MapType0Store Heap@@32 o@@11 f_3 v))
)))
(assert (forall ((a@@31 T@U) (b@@24 T@U) ) (! (let ((T@@49 (MapType2TypeInv0 (type a@@31))))
 (=> (and (= (type a@@31) (MapType2Type T@@49 boolType)) (= (type b@@24) (MapType2Type T@@49 boolType))) (= (|Set#Subset| a@@31 b@@24) (forall ((o@@12 T@U) ) (!  (=> (and (= (type o@@12) T@@49) (U_2_bool (MapType2Select a@@31 o@@12))) (U_2_bool (MapType2Select b@@24 o@@12)))
 :qid |stdinbpl.353:32|
 :skolemid |46|
 :pattern ( (MapType2Select a@@31 o@@12))
 :pattern ( (MapType2Select b@@24 o@@12))
)))))
 :qid |stdinbpl.352:17|
 :skolemid |47|
 :pattern ( (|Set#Subset| a@@31 b@@24))
)))
(assert (forall ((a@@32 T@U) (x@@17 T@U) ) (! (let ((T@@50 (type x@@17)))
 (=> (and (= (type a@@32) (MapType2Type T@@50 boolType)) (not (U_2_bool (MapType2Select a@@32 x@@17)))) (= (|Set#Card| (|Set#UnionOne| a@@32 x@@17)) (+ (|Set#Card| a@@32) 1))))
 :qid |stdinbpl.309:18|
 :skolemid |33|
 :pattern ( (|Set#Card| (|Set#UnionOne| a@@32 x@@17)))
)))
(assert (forall ((a@@33 T@U) (b@@25 T@U) (o@@13 T@U) ) (! (let ((T@@51 (type o@@13)))
 (=> (and (= (type a@@33) (MultiSetType T@@51)) (= (type b@@25) (MultiSetType T@@51))) (= (|MultiSet#Select| (|MultiSet#Difference| a@@33 b@@25) o@@13) (|Math#clip| (- (|MultiSet#Select| a@@33 o@@13) (|MultiSet#Select| b@@25 o@@13))))))
 :qid |stdinbpl.441:18|
 :skolemid |72|
 :pattern ( (|MultiSet#Select| (|MultiSet#Difference| a@@33 b@@25) o@@13))
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
 :qid |stdinbpl.269:25|
 :skolemid |20|
 :pattern ( (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r@@5 u))
)))
(assert (forall ((a@@34 Int) ) (!  (=> (< a@@34 0) (= (|Math#clip| a@@34) 0))
 :qid |stdinbpl.380:15|
 :skolemid |55|
 :pattern ( (|Math#clip| a@@34))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
(assert (forall ((a@@35 T@U) (x@@18 T@U) (o@@14 T@U) ) (! (let ((T@@52 (type x@@18)))
 (=> (and (= (type a@@35) (MultiSetType T@@52)) (= (type o@@14) T@@52)) (= (|MultiSet#Select| (|MultiSet#UnionOne| a@@35 x@@18) o@@14) (ite (= x@@18 o@@14) (+ (|MultiSet#Select| a@@35 o@@14) 1) (|MultiSet#Select| a@@35 o@@14)))))
 :qid |stdinbpl.413:18|
 :skolemid |64|
 :pattern ( (|MultiSet#Select| (|MultiSet#UnionOne| a@@35 x@@18) o@@14))
 :pattern ( (|MultiSet#UnionOne| a@@35 x@@18) (|MultiSet#Select| a@@35 o@@14))
)))
(assert (forall ((a@@36 T@U) (b@@26 T@U) ) (! (let ((T@@53 (MultiSetTypeInv0 (type a@@36))))
 (=> (and (= (type a@@36) (MultiSetType T@@53)) (= (type b@@26) (MultiSetType T@@53))) (= (|MultiSet#Equal| a@@36 b@@26) (forall ((o@@15 T@U) ) (!  (=> (= (type o@@15) T@@53) (= (|MultiSet#Select| a@@36 o@@15) (|MultiSet#Select| b@@26 o@@15)))
 :qid |stdinbpl.459:36|
 :skolemid |77|
 :pattern ( (|MultiSet#Select| a@@36 o@@15))
 :pattern ( (|MultiSet#Select| b@@26 o@@15))
)))))
 :qid |stdinbpl.458:17|
 :skolemid |78|
 :pattern ( (|MultiSet#Equal| a@@36 b@@26))
)))
(assert (forall ((a@@37 T@U) (b@@27 T@U) ) (! (let ((T@@54 (MultiSetTypeInv0 (type a@@37))))
 (=> (and (= (type a@@37) (MultiSetType T@@54)) (= (type b@@27) (MultiSetType T@@54))) (= (|MultiSet#Subset| a@@37 b@@27) (forall ((o@@16 T@U) ) (!  (=> (= (type o@@16) T@@54) (<= (|MultiSet#Select| a@@37 o@@16) (|MultiSet#Select| b@@27 o@@16)))
 :qid |stdinbpl.455:37|
 :skolemid |75|
 :pattern ( (|MultiSet#Select| a@@37 o@@16))
 :pattern ( (|MultiSet#Select| b@@27 o@@16))
)))))
 :qid |stdinbpl.454:17|
 :skolemid |76|
 :pattern ( (|MultiSet#Subset| a@@37 b@@27))
)))
(assert (forall ((a@@38 T@U) (b@@28 T@U) (o@@17 T@U) ) (! (let ((T@@55 (type o@@17)))
 (=> (and (= (type a@@38) (MapType2Type T@@55 boolType)) (= (type b@@28) (MapType2Type T@@55 boolType))) (= (U_2_bool (MapType2Select (|Set#Union| a@@38 b@@28) o@@17))  (or (U_2_bool (MapType2Select a@@38 o@@17)) (U_2_bool (MapType2Select b@@28 o@@17))))))
 :qid |stdinbpl.313:18|
 :skolemid |34|
 :pattern ( (MapType2Select (|Set#Union| a@@38 b@@28) o@@17))
)))
(assert (forall ((arg0@@81 Int) (arg1@@44 Int) ) (! (= (type (|sk_P2#condqp2| arg0@@81 arg1@@44)) RefType)
 :qid |funType:sk_P2#condqp2|
 :pattern ( (|sk_P2#condqp2| arg0@@81 arg1@@44))
)))
(assert (forall ((Heap2Heap@@2 T@U) (Heap1Heap@@2 T@U) (r_1@@51 T@U) ) (!  (=> (and (and (and (= (type Heap2Heap@@2) (MapType0Type RefType)) (= (type Heap1Heap@@2) (MapType0Type RefType))) (= (type r_1@@51) RefType)) (and (=  (and (U_2_bool (MapType2Select (refs Heap2Heap@@2 r_1@@51) (|sk_P2#condqp2| (|P2#condqp2| Heap2Heap@@2 r_1@@51) (|P2#condqp2| Heap1Heap@@2 r_1@@51)))) (< NoPerm (/ (to_real 1) (to_real 2))))  (and (U_2_bool (MapType2Select (refs Heap1Heap@@2 r_1@@51) (|sk_P2#condqp2| (|P2#condqp2| Heap2Heap@@2 r_1@@51) (|P2#condqp2| Heap1Heap@@2 r_1@@51)))) (< NoPerm (/ (to_real 1) (to_real 2))))) (=> (and (U_2_bool (MapType2Select (refs Heap2Heap@@2 r_1@@51) (|sk_P2#condqp2| (|P2#condqp2| Heap2Heap@@2 r_1@@51) (|P2#condqp2| Heap1Heap@@2 r_1@@51)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (= (MapType0Select Heap2Heap@@2 null (Q (|sk_P2#condqp2| (|P2#condqp2| Heap2Heap@@2 r_1@@51) (|P2#condqp2| Heap1Heap@@2 r_1@@51)))) (MapType0Select Heap1Heap@@2 null (Q (|sk_P2#condqp2| (|P2#condqp2| Heap2Heap@@2 r_1@@51) (|P2#condqp2| Heap1Heap@@2 r_1@@51)))))))) (= (|P2#condqp2| Heap2Heap@@2 r_1@@51) (|P2#condqp2| Heap1Heap@@2 r_1@@51)))
 :qid |stdinbpl.925:15|
 :skolemid |120|
 :pattern ( (|P2#condqp2| Heap2Heap@@2 r_1@@51) (|P2#condqp2| Heap1Heap@@2 r_1@@51) (succHeapTrans Heap2Heap@@2 Heap1Heap@@2))
)))
(push 1)
(declare-fun ControlFlow (Int Int) Int)
(set-info :boogie-vc-id |testerfieldFull#definedness|)
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
(declare-fun q_1 () T@U)
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
(declare-fun |Math#min| (Int Int) Int)
(declare-fun IdenticalOnKnownLocations (T@U T@U T@U) Bool)
(declare-fun IsPredicateField (T@U) Bool)
(declare-fun null () T@U)
(declare-fun PredicateMaskField (T@U) T@U)
(declare-fun FrameTypeType () T@T)
(declare-fun HasDirectPerm (T@U T@U T@U) Bool)
(declare-fun IsWandField (T@U) Bool)
(declare-fun WandMaskField (T@U) T@U)
(declare-fun |P#condqp1| (T@U T@U) Int)
(declare-fun MapType2Select (T@U T@U) T@U)
(declare-fun refs (T@U T@U) T@U)
(declare-fun |sk_P#condqp1| (Int Int) T@U)
(declare-fun Q (T@U) T@U)
(declare-fun MapType2Type (T@T T@T) T@T)
(declare-fun MapType2TypeInv0 (T@T) T@T)
(declare-fun MapType2TypeInv1 (T@T) T@T)
(declare-fun MapType2Store (T@U T@U T@U) T@U)
(declare-fun PredicateType_QType () T@T)
(declare-fun P (T@U) T@U)
(declare-fun PredicateType_PType () T@T)
(declare-fun P2 (T@U) T@U)
(declare-fun PredicateType_P2Type () T@T)
(declare-fun R (T@U) T@U)
(declare-fun PredicateType_RType () T@T)
(declare-fun R2 (T@U) T@U)
(declare-fun PredicateType_R2Type () T@T)
(declare-fun |refs'| (T@U T@U) T@U)
(declare-fun dummyFunction (T@U) Bool)
(declare-fun |refs#triggerStateless| (T@U) T@U)
(declare-fun |get'| (T@U T@U) T@U)
(declare-fun |get#triggerStateless| (T@U) T@U)
(declare-fun |tester'| (T@U T@U) T@U)
(declare-fun |tester#triggerStateless| (T@U) T@U)
(declare-fun |testerFull'| (T@U T@U) T@U)
(declare-fun |testerFull#triggerStateless| (T@U) T@U)
(declare-fun |testerfield'| (T@U T@U) T@U)
(declare-fun |testerfield#triggerStateless| (T@U) T@U)
(declare-fun |testerfieldFull'| (T@U T@U) T@U)
(declare-fun |testerfieldFull#triggerStateless| (T@U) T@U)
(declare-fun |P#trigger| (T@U T@U) Bool)
(declare-fun |P#everUsed| (T@U) Bool)
(declare-fun |P2#trigger| (T@U T@U) Bool)
(declare-fun |P2#everUsed| (T@U) Bool)
(declare-fun |R#trigger| (T@U T@U) Bool)
(declare-fun |R#everUsed| (T@U) Bool)
(declare-fun |R2#trigger| (T@U T@U) Bool)
(declare-fun |R2#everUsed| (T@U) Bool)
(declare-fun |Q#trigger| (T@U T@U) Bool)
(declare-fun |Q#everUsed| (T@U) Bool)
(declare-fun |MultiSet#Select| (T@U T@U) Int)
(declare-fun |Set#Union| (T@U T@U) T@U)
(declare-fun |Set#Intersection| (T@U T@U) T@U)
(declare-fun |Set#Singleton| (T@U) T@U)
(declare-fun |Set#Card| (T@U) Int)
(declare-fun get (T@U T@U) T@U)
(declare-fun tester (T@U T@U) T@U)
(declare-fun testerFull (T@U T@U) T@U)
(declare-fun testerfield (T@U T@U) T@U)
(declare-fun testerfieldFull (T@U T@U) T@U)
(declare-fun |Math#clip| (Int) Int)
(declare-fun |P#sm| (T@U) T@U)
(declare-fun |P2#sm| (T@U) T@U)
(declare-fun |R#sm| (T@U) T@U)
(declare-fun |R2#sm| (T@U) T@U)
(declare-fun |Q#sm| (T@U) T@U)
(declare-fun AssumeFunctionsAbove () Int)
(declare-fun |get#trigger| (T@U T@U) Bool)
(declare-fun EmptyFrame () T@U)
(declare-fun dummyHeap () T@U)
(declare-fun ZeroMask () T@U)
(declare-fun |MultiSet#UnionOne| (T@U T@U) T@U)
(declare-fun |MultiSet#Disjoint| (T@U T@U) Bool)
(declare-fun InsidePredicate (T@U T@U T@U T@U) Bool)
(declare-fun |MultiSet#Singleton| (T@U) T@U)
(declare-fun |Set#Equal| (T@U T@U) Bool)
(declare-fun sumMask (T@U T@U T@U) Bool)
(declare-fun ConditionalFrame (Real T@U) T@U)
(declare-fun NoPerm () Real)
(declare-fun |Set#Difference| (T@U T@U) T@U)
(declare-fun |MultiSet#Equal| (T@U T@U) Bool)
(declare-fun |Set#UnionOne| (T@U T@U) T@U)
(declare-fun |R2#condqp4| (T@U T@U) Int)
(declare-fun |sk_R2#condqp4| (Int Int) T@U)
(declare-fun |MultiSet#Empty| (T@T) T@U)
(declare-fun getPredWandId (T@U) Int)
(declare-fun FullPerm () Real)
(declare-fun |refs#frame| (T@U T@U) T@U)
(declare-fun |get#frame| (T@U T@U) T@U)
(declare-fun |tester#frame| (T@U T@U) T@U)
(declare-fun |testerFull#frame| (T@U T@U) T@U)
(declare-fun |testerfield#frame| (T@U T@U) T@U)
(declare-fun FrameFragment (T@U) T@U)
(declare-fun |testerfieldFull#frame| (T@U T@U) T@U)
(declare-fun |Set#Empty| (T@T) T@U)
(declare-fun |R#condqp3| (T@U T@U) Int)
(declare-fun |sk_R#condqp3| (Int Int) T@U)
(declare-fun |Set#Subset| (T@U T@U) Bool)
(declare-fun ZeroPMask () T@U)
(declare-fun |MultiSet#Subset| (T@U T@U) Bool)
(declare-fun |P2#condqp2| (T@U T@U) Int)
(declare-fun |sk_P2#condqp2| (Int Int) T@U)
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
))) (= (Ctor NormalFieldType) 7)) (= (type $allocated) (FieldType NormalFieldType boolType))) (= (Ctor RefType) 8)) (= (type q_1) (FieldType NormalFieldType RefType))))
(assert (distinct $allocated q_1)
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
 :qid |stdinbpl.445:18|
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
(assert (forall ((a@@0 Int) (b@@0 Int) ) (!  (or (= (|Math#min| a@@0 b@@0) a@@0) (= (|Math#min| a@@0 b@@0) b@@0))
 :qid |stdinbpl.376:15|
 :skolemid |53|
 :pattern ( (|Math#min| a@@0 b@@0))
)))
(assert  (and (and (= (Ctor FrameTypeType) 12) (= (type null) RefType)) (forall ((arg0@@28 T@U) ) (! (let ((A (FieldTypeInv0 (type arg0@@28))))
(= (type (PredicateMaskField arg0@@28)) (FieldType A (MapType1Type RefType boolType))))
 :qid |funType:PredicateMaskField|
 :pattern ( (PredicateMaskField arg0@@28))
))))
(assert (forall ((Heap@@0 T@U) (ExhaleHeap T@U) (Mask@@0 T@U) (pm_f T@U) ) (! (let ((C (FieldTypeInv0 (type pm_f))))
 (=> (and (and (and (and (and (= (type Heap@@0) (MapType0Type RefType)) (= (type ExhaleHeap) (MapType0Type RefType))) (= (type Mask@@0) (MapType1Type RefType realType))) (= (type pm_f) (FieldType C FrameTypeType))) (IdenticalOnKnownLocations Heap@@0 ExhaleHeap Mask@@0)) (and (HasDirectPerm Mask@@0 null pm_f) (IsPredicateField pm_f))) (= (MapType0Select Heap@@0 null (PredicateMaskField pm_f)) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))))
 :qid |stdinbpl.47:19|
 :skolemid |2|
 :pattern ( (IdenticalOnKnownLocations Heap@@0 ExhaleHeap Mask@@0) (IsPredicateField pm_f) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))
)))
(assert (forall ((arg0@@29 T@U) ) (! (let ((A@@0 (FieldTypeInv0 (type arg0@@29))))
(= (type (WandMaskField arg0@@29)) (FieldType A@@0 (MapType1Type RefType boolType))))
 :qid |funType:WandMaskField|
 :pattern ( (WandMaskField arg0@@29))
)))
(assert (forall ((Heap@@1 T@U) (ExhaleHeap@@0 T@U) (Mask@@1 T@U) (pm_f@@0 T@U) ) (! (let ((C@@0 (FieldTypeInv0 (type pm_f@@0))))
 (=> (and (and (and (and (and (= (type Heap@@1) (MapType0Type RefType)) (= (type ExhaleHeap@@0) (MapType0Type RefType))) (= (type Mask@@1) (MapType1Type RefType realType))) (= (type pm_f@@0) (FieldType C@@0 FrameTypeType))) (IdenticalOnKnownLocations Heap@@1 ExhaleHeap@@0 Mask@@1)) (and (HasDirectPerm Mask@@1 null pm_f@@0) (IsWandField pm_f@@0))) (= (MapType0Select Heap@@1 null (WandMaskField pm_f@@0)) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))))
 :qid |stdinbpl.60:19|
 :skolemid |5|
 :pattern ( (IdenticalOnKnownLocations Heap@@1 ExhaleHeap@@0 Mask@@1) (IsWandField pm_f@@0) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))
)))
(assert  (and (and (and (and (and (and (and (and (and (and (forall ((arg0@@30 T@T) (arg1@@12 T@T) ) (! (= (Ctor (MapType2Type arg0@@30 arg1@@12)) 13)
 :qid |ctor:MapType2Type|
)) (forall ((arg0@@31 T@T) (arg1@@13 T@T) ) (! (= (MapType2TypeInv0 (MapType2Type arg0@@31 arg1@@13)) arg0@@31)
 :qid |typeInv:MapType2TypeInv0|
 :pattern ( (MapType2Type arg0@@31 arg1@@13))
))) (forall ((arg0@@32 T@T) (arg1@@14 T@T) ) (! (= (MapType2TypeInv1 (MapType2Type arg0@@32 arg1@@14)) arg1@@14)
 :qid |typeInv:MapType2TypeInv1|
 :pattern ( (MapType2Type arg0@@32 arg1@@14))
))) (forall ((arg0@@33 T@U) (arg1@@15 T@U) ) (! (let ((aVar1@@2 (MapType2TypeInv1 (type arg0@@33))))
(= (type (MapType2Select arg0@@33 arg1@@15)) aVar1@@2))
 :qid |funType:MapType2Select|
 :pattern ( (MapType2Select arg0@@33 arg1@@15))
))) (forall ((arg0@@34 T@U) (arg1@@16 T@U) (arg2@@3 T@U) ) (! (let ((aVar1@@3 (type arg2@@3)))
(let ((aVar0@@1 (type arg1@@16)))
(= (type (MapType2Store arg0@@34 arg1@@16 arg2@@3)) (MapType2Type aVar0@@1 aVar1@@3))))
 :qid |funType:MapType2Store|
 :pattern ( (MapType2Store arg0@@34 arg1@@16 arg2@@3))
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
)))) (forall ((arg0@@35 T@U) (arg1@@17 T@U) ) (! (= (type (refs arg0@@35 arg1@@17)) (MapType2Type RefType boolType))
 :qid |funType:refs|
 :pattern ( (refs arg0@@35 arg1@@17))
))) (forall ((arg0@@36 Int) (arg1@@18 Int) ) (! (= (type (|sk_P#condqp1| arg0@@36 arg1@@18)) RefType)
 :qid |funType:sk_P#condqp1|
 :pattern ( (|sk_P#condqp1| arg0@@36 arg1@@18))
))) (= (Ctor PredicateType_QType) 14)) (forall ((arg0@@37 T@U) ) (! (= (type (Q arg0@@37)) (FieldType PredicateType_QType FrameTypeType))
 :qid |funType:Q|
 :pattern ( (Q arg0@@37))
))))
(assert (forall ((Heap2Heap T@U) (Heap1Heap T@U) (r_1 T@U) ) (!  (=> (and (and (and (= (type Heap2Heap) (MapType0Type RefType)) (= (type Heap1Heap) (MapType0Type RefType))) (= (type r_1) RefType)) (and (= (U_2_bool (MapType2Select (refs Heap2Heap r_1) (|sk_P#condqp1| (|P#condqp1| Heap2Heap r_1) (|P#condqp1| Heap1Heap r_1)))) (U_2_bool (MapType2Select (refs Heap1Heap r_1) (|sk_P#condqp1| (|P#condqp1| Heap2Heap r_1) (|P#condqp1| Heap1Heap r_1))))) (=> (U_2_bool (MapType2Select (refs Heap2Heap r_1) (|sk_P#condqp1| (|P#condqp1| Heap2Heap r_1) (|P#condqp1| Heap1Heap r_1)))) (= (MapType0Select Heap2Heap null (Q (|sk_P#condqp1| (|P#condqp1| Heap2Heap r_1) (|P#condqp1| Heap1Heap r_1)))) (MapType0Select Heap1Heap null (Q (|sk_P#condqp1| (|P#condqp1| Heap2Heap r_1) (|P#condqp1| Heap1Heap r_1)))))))) (= (|P#condqp1| Heap2Heap r_1) (|P#condqp1| Heap1Heap r_1)))
 :qid |stdinbpl.816:15|
 :skolemid |107|
 :pattern ( (|P#condqp1| Heap2Heap r_1) (|P#condqp1| Heap1Heap r_1) (succHeapTrans Heap2Heap Heap1Heap))
)))
(assert  (and (= (Ctor PredicateType_PType) 15) (forall ((arg0@@38 T@U) ) (! (= (type (P arg0@@38)) (FieldType PredicateType_PType FrameTypeType))
 :qid |funType:P|
 :pattern ( (P arg0@@38))
))))
(assert (forall ((r_1@@0 T@U) ) (!  (=> (= (type r_1@@0) RefType) (IsPredicateField (P r_1@@0)))
 :qid |stdinbpl.786:15|
 :skolemid |102|
 :pattern ( (P r_1@@0))
)))
(assert  (and (= (Ctor PredicateType_P2Type) 16) (forall ((arg0@@39 T@U) ) (! (= (type (P2 arg0@@39)) (FieldType PredicateType_P2Type FrameTypeType))
 :qid |funType:P2|
 :pattern ( (P2 arg0@@39))
))))
(assert (forall ((r_1@@1 T@U) ) (!  (=> (= (type r_1@@1) RefType) (IsPredicateField (P2 r_1@@1)))
 :qid |stdinbpl.895:15|
 :skolemid |115|
 :pattern ( (P2 r_1@@1))
)))
(assert  (and (= (Ctor PredicateType_RType) 17) (forall ((arg0@@40 T@U) ) (! (= (type (R arg0@@40)) (FieldType PredicateType_RType FrameTypeType))
 :qid |funType:R|
 :pattern ( (R arg0@@40))
))))
(assert (forall ((r_1@@2 T@U) ) (!  (=> (= (type r_1@@2) RefType) (IsPredicateField (R r_1@@2)))
 :qid |stdinbpl.1008:15|
 :skolemid |129|
 :pattern ( (R r_1@@2))
)))
(assert  (and (= (Ctor PredicateType_R2Type) 18) (forall ((arg0@@41 T@U) ) (! (= (type (R2 arg0@@41)) (FieldType PredicateType_R2Type FrameTypeType))
 :qid |funType:R2|
 :pattern ( (R2 arg0@@41))
))))
(assert (forall ((r_1@@3 T@U) ) (!  (=> (= (type r_1@@3) RefType) (IsPredicateField (R2 r_1@@3)))
 :qid |stdinbpl.1114:15|
 :skolemid |142|
 :pattern ( (R2 r_1@@3))
)))
(assert (forall ((r_1@@4 T@U) ) (!  (=> (= (type r_1@@4) RefType) (IsPredicateField (Q r_1@@4)))
 :qid |stdinbpl.1225:15|
 :skolemid |156|
 :pattern ( (Q r_1@@4))
)))
(assert  (and (forall ((arg0@@42 T@U) (arg1@@19 T@U) ) (! (= (type (|refs'| arg0@@42 arg1@@19)) (MapType2Type RefType boolType))
 :qid |funType:refs'|
 :pattern ( (|refs'| arg0@@42 arg1@@19))
)) (forall ((arg0@@43 T@U) ) (! (= (type (|refs#triggerStateless| arg0@@43)) (MapType2Type RefType boolType))
 :qid |funType:refs#triggerStateless|
 :pattern ( (|refs#triggerStateless| arg0@@43))
))))
(assert (forall ((Heap@@2 T@U) (r_1@@5 T@U) ) (!  (=> (and (= (type Heap@@2) (MapType0Type RefType)) (= (type r_1@@5) RefType)) (dummyFunction (|refs#triggerStateless| r_1@@5)))
 :qid |stdinbpl.489:15|
 :skolemid |83|
 :pattern ( (|refs'| Heap@@2 r_1@@5))
)))
(assert  (and (forall ((arg0@@44 T@U) (arg1@@20 T@U) ) (! (= (type (|get'| arg0@@44 arg1@@20)) RefType)
 :qid |funType:get'|
 :pattern ( (|get'| arg0@@44 arg1@@20))
)) (forall ((arg0@@45 T@U) ) (! (= (type (|get#triggerStateless| arg0@@45)) RefType)
 :qid |funType:get#triggerStateless|
 :pattern ( (|get#triggerStateless| arg0@@45))
))))
(assert (forall ((Heap@@3 T@U) (r_1@@6 T@U) ) (!  (=> (and (= (type Heap@@3) (MapType0Type RefType)) (= (type r_1@@6) RefType)) (dummyFunction (|get#triggerStateless| r_1@@6)))
 :qid |stdinbpl.530:15|
 :skolemid |86|
 :pattern ( (|get'| Heap@@3 r_1@@6))
)))
(assert  (and (forall ((arg0@@46 T@U) (arg1@@21 T@U) ) (! (= (type (|tester'| arg0@@46 arg1@@21)) RefType)
 :qid |funType:tester'|
 :pattern ( (|tester'| arg0@@46 arg1@@21))
)) (forall ((arg0@@47 T@U) ) (! (= (type (|tester#triggerStateless| arg0@@47)) RefType)
 :qid |funType:tester#triggerStateless|
 :pattern ( (|tester#triggerStateless| arg0@@47))
))))
(assert (forall ((Heap@@4 T@U) (r_1@@7 T@U) ) (!  (=> (and (= (type Heap@@4) (MapType0Type RefType)) (= (type r_1@@7) RefType)) (dummyFunction (|tester#triggerStateless| r_1@@7)))
 :qid |stdinbpl.588:15|
 :skolemid |90|
 :pattern ( (|tester'| Heap@@4 r_1@@7))
)))
(assert  (and (forall ((arg0@@48 T@U) (arg1@@22 T@U) ) (! (= (type (|testerFull'| arg0@@48 arg1@@22)) RefType)
 :qid |funType:testerFull'|
 :pattern ( (|testerFull'| arg0@@48 arg1@@22))
)) (forall ((arg0@@49 T@U) ) (! (= (type (|testerFull#triggerStateless| arg0@@49)) RefType)
 :qid |funType:testerFull#triggerStateless|
 :pattern ( (|testerFull#triggerStateless| arg0@@49))
))))
(assert (forall ((Heap@@5 T@U) (r_1@@8 T@U) ) (!  (=> (and (= (type Heap@@5) (MapType0Type RefType)) (= (type r_1@@8) RefType)) (dummyFunction (|testerFull#triggerStateless| r_1@@8)))
 :qid |stdinbpl.638:15|
 :skolemid |93|
 :pattern ( (|testerFull'| Heap@@5 r_1@@8))
)))
(assert  (and (forall ((arg0@@50 T@U) (arg1@@23 T@U) ) (! (= (type (|testerfield'| arg0@@50 arg1@@23)) RefType)
 :qid |funType:testerfield'|
 :pattern ( (|testerfield'| arg0@@50 arg1@@23))
)) (forall ((arg0@@51 T@U) ) (! (= (type (|testerfield#triggerStateless| arg0@@51)) RefType)
 :qid |funType:testerfield#triggerStateless|
 :pattern ( (|testerfield#triggerStateless| arg0@@51))
))))
(assert (forall ((Heap@@6 T@U) (r_1@@9 T@U) ) (!  (=> (and (= (type Heap@@6) (MapType0Type RefType)) (= (type r_1@@9) RefType)) (dummyFunction (|testerfield#triggerStateless| r_1@@9)))
 :qid |stdinbpl.686:15|
 :skolemid |96|
 :pattern ( (|testerfield'| Heap@@6 r_1@@9))
)))
(assert  (and (forall ((arg0@@52 T@U) (arg1@@24 T@U) ) (! (= (type (|testerfieldFull'| arg0@@52 arg1@@24)) RefType)
 :qid |funType:testerfieldFull'|
 :pattern ( (|testerfieldFull'| arg0@@52 arg1@@24))
)) (forall ((arg0@@53 T@U) ) (! (= (type (|testerfieldFull#triggerStateless| arg0@@53)) RefType)
 :qid |funType:testerfieldFull#triggerStateless|
 :pattern ( (|testerfieldFull#triggerStateless| arg0@@53))
))))
(assert (forall ((Heap@@7 T@U) (r_1@@10 T@U) ) (!  (=> (and (= (type Heap@@7) (MapType0Type RefType)) (= (type r_1@@10) RefType)) (dummyFunction (|testerfieldFull#triggerStateless| r_1@@10)))
 :qid |stdinbpl.737:15|
 :skolemid |99|
 :pattern ( (|testerfieldFull'| Heap@@7 r_1@@10))
)))
(assert (forall ((Heap@@8 T@U) (r_1@@11 T@U) ) (!  (=> (and (= (type Heap@@8) (MapType0Type RefType)) (= (type r_1@@11) RefType)) (|P#everUsed| (P r_1@@11)))
 :qid |stdinbpl.805:15|
 :skolemid |106|
 :pattern ( (|P#trigger| Heap@@8 (P r_1@@11)))
)))
(assert (forall ((Heap@@9 T@U) (r_1@@12 T@U) ) (!  (=> (and (= (type Heap@@9) (MapType0Type RefType)) (= (type r_1@@12) RefType)) (|P2#everUsed| (P2 r_1@@12)))
 :qid |stdinbpl.914:15|
 :skolemid |119|
 :pattern ( (|P2#trigger| Heap@@9 (P2 r_1@@12)))
)))
(assert (forall ((Heap@@10 T@U) (r_1@@13 T@U) ) (!  (=> (and (= (type Heap@@10) (MapType0Type RefType)) (= (type r_1@@13) RefType)) (|R#everUsed| (R r_1@@13)))
 :qid |stdinbpl.1027:15|
 :skolemid |133|
 :pattern ( (|R#trigger| Heap@@10 (R r_1@@13)))
)))
(assert (forall ((Heap@@11 T@U) (r_1@@14 T@U) ) (!  (=> (and (= (type Heap@@11) (MapType0Type RefType)) (= (type r_1@@14) RefType)) (|R2#everUsed| (R2 r_1@@14)))
 :qid |stdinbpl.1133:15|
 :skolemid |146|
 :pattern ( (|R2#trigger| Heap@@11 (R2 r_1@@14)))
)))
(assert (forall ((Heap@@12 T@U) (r_1@@15 T@U) ) (!  (=> (and (= (type Heap@@12) (MapType0Type RefType)) (= (type r_1@@15) RefType)) (|Q#everUsed| (Q r_1@@15)))
 :qid |stdinbpl.1244:15|
 :skolemid |160|
 :pattern ( (|Q#trigger| Heap@@12 (Q r_1@@15)))
)))
(assert (forall ((a@@1 T@U) (b@@1 T@U) (y@@1 T@U) ) (! (let ((T@@3 (type y@@1)))
 (=> (and (and (= (type a@@1) (MultiSetType T@@3)) (= (type b@@1) (MultiSetType T@@3))) (<= (|MultiSet#Select| a@@1 y@@1) (|MultiSet#Select| b@@1 y@@1))) (= (|MultiSet#Select| (|MultiSet#Difference| a@@1 b@@1) y@@1) 0)))
 :qid |stdinbpl.443:18|
 :skolemid |73|
 :pattern ( (|MultiSet#Difference| a@@1 b@@1) (|MultiSet#Select| b@@1 y@@1) (|MultiSet#Select| a@@1 y@@1))
)))
(assert (forall ((arg0@@54 T@U) (arg1@@25 T@U) ) (! (let ((T@@4 (MapType2TypeInv0 (type arg0@@54))))
(= (type (|Set#Union| arg0@@54 arg1@@25)) (MapType2Type T@@4 boolType)))
 :qid |funType:Set#Union|
 :pattern ( (|Set#Union| arg0@@54 arg1@@25))
)))
(assert (forall ((a@@2 T@U) (b@@2 T@U) ) (! (let ((T@@5 (MapType2TypeInv0 (type a@@2))))
 (=> (and (= (type a@@2) (MapType2Type T@@5 boolType)) (= (type b@@2) (MapType2Type T@@5 boolType))) (= (|Set#Union| (|Set#Union| a@@2 b@@2) b@@2) (|Set#Union| a@@2 b@@2))))
 :qid |stdinbpl.328:18|
 :skolemid |38|
 :pattern ( (|Set#Union| (|Set#Union| a@@2 b@@2) b@@2))
)))
(assert (forall ((arg0@@55 T@U) (arg1@@26 T@U) ) (! (let ((T@@6 (MapType2TypeInv0 (type arg0@@55))))
(= (type (|Set#Intersection| arg0@@55 arg1@@26)) (MapType2Type T@@6 boolType)))
 :qid |funType:Set#Intersection|
 :pattern ( (|Set#Intersection| arg0@@55 arg1@@26))
)))
(assert (forall ((a@@3 T@U) (b@@3 T@U) ) (! (let ((T@@7 (MapType2TypeInv0 (type a@@3))))
 (=> (and (= (type a@@3) (MapType2Type T@@7 boolType)) (= (type b@@3) (MapType2Type T@@7 boolType))) (= (|Set#Intersection| (|Set#Intersection| a@@3 b@@3) b@@3) (|Set#Intersection| a@@3 b@@3))))
 :qid |stdinbpl.332:18|
 :skolemid |40|
 :pattern ( (|Set#Intersection| (|Set#Intersection| a@@3 b@@3) b@@3))
)))
(assert (forall ((a@@4 T@U) (b@@4 T@U) ) (! (let ((T@@8 (MultiSetTypeInv0 (type a@@4))))
 (=> (and (= (type a@@4) (MultiSetType T@@8)) (= (type b@@4) (MultiSetType T@@8))) (= (|MultiSet#Intersection| (|MultiSet#Intersection| a@@4 b@@4) b@@4) (|MultiSet#Intersection| a@@4 b@@4))))
 :qid |stdinbpl.434:18|
 :skolemid |70|
 :pattern ( (|MultiSet#Intersection| (|MultiSet#Intersection| a@@4 b@@4) b@@4))
)))
(assert (forall ((arg0@@56 T@U) ) (! (let ((T@@9 (type arg0@@56)))
(= (type (|Set#Singleton| arg0@@56)) (MapType2Type T@@9 boolType)))
 :qid |funType:Set#Singleton|
 :pattern ( (|Set#Singleton| arg0@@56))
)))
(assert (forall ((r T@U) (o T@U) ) (! (let ((T@@10 (type r)))
 (=> (= (type o) T@@10) (= (U_2_bool (MapType2Select (|Set#Singleton| r) o)) (= r o))))
 :qid |stdinbpl.297:18|
 :skolemid |27|
 :pattern ( (MapType2Select (|Set#Singleton| r) o))
)))
(assert (forall ((a@@5 T@U) (b@@5 T@U) ) (! (let ((T@@11 (MapType2TypeInv0 (type a@@5))))
 (=> (and (= (type a@@5) (MapType2Type T@@11 boolType)) (= (type b@@5) (MapType2Type T@@11 boolType))) (= (+ (|Set#Card| (|Set#Union| a@@5 b@@5)) (|Set#Card| (|Set#Intersection| a@@5 b@@5))) (+ (|Set#Card| a@@5) (|Set#Card| b@@5)))))
 :qid |stdinbpl.336:18|
 :skolemid |42|
 :pattern ( (|Set#Card| (|Set#Union| a@@5 b@@5)))
 :pattern ( (|Set#Card| (|Set#Intersection| a@@5 b@@5)))
)))
(assert (forall ((Heap@@13 T@U) (ExhaleHeap@@1 T@U) (Mask@@2 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@13) (MapType0Type RefType)) (= (type ExhaleHeap@@1) (MapType0Type RefType))) (= (type Mask@@2) (MapType1Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@13 ExhaleHeap@@1 Mask@@2)) (U_2_bool (MapType0Select Heap@@13 o_1 $allocated))) (U_2_bool (MapType0Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.73:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@13 ExhaleHeap@@1 Mask@@2) (MapType0Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert (forall ((Heap@@14 T@U) (r_1@@16 T@U) ) (!  (=> (and (= (type Heap@@14) (MapType0Type RefType)) (= (type r_1@@16) RefType)) (and (= (refs Heap@@14 r_1@@16) (|refs'| Heap@@14 r_1@@16)) (dummyFunction (|refs#triggerStateless| r_1@@16))))
 :qid |stdinbpl.485:15|
 :skolemid |82|
 :pattern ( (refs Heap@@14 r_1@@16))
)))
(assert (forall ((arg0@@57 T@U) (arg1@@27 T@U) ) (! (= (type (get arg0@@57 arg1@@27)) RefType)
 :qid |funType:get|
 :pattern ( (get arg0@@57 arg1@@27))
)))
(assert (forall ((Heap@@15 T@U) (r_1@@17 T@U) ) (!  (=> (and (= (type Heap@@15) (MapType0Type RefType)) (= (type r_1@@17) RefType)) (and (= (get Heap@@15 r_1@@17) (|get'| Heap@@15 r_1@@17)) (dummyFunction (|get#triggerStateless| r_1@@17))))
 :qid |stdinbpl.526:15|
 :skolemid |85|
 :pattern ( (get Heap@@15 r_1@@17))
)))
(assert (forall ((arg0@@58 T@U) (arg1@@28 T@U) ) (! (= (type (tester arg0@@58 arg1@@28)) RefType)
 :qid |funType:tester|
 :pattern ( (tester arg0@@58 arg1@@28))
)))
(assert (forall ((Heap@@16 T@U) (r_1@@18 T@U) ) (!  (=> (and (= (type Heap@@16) (MapType0Type RefType)) (= (type r_1@@18) RefType)) (and (= (tester Heap@@16 r_1@@18) (|tester'| Heap@@16 r_1@@18)) (dummyFunction (|tester#triggerStateless| r_1@@18))))
 :qid |stdinbpl.584:15|
 :skolemid |89|
 :pattern ( (tester Heap@@16 r_1@@18))
)))
(assert (forall ((arg0@@59 T@U) (arg1@@29 T@U) ) (! (= (type (testerFull arg0@@59 arg1@@29)) RefType)
 :qid |funType:testerFull|
 :pattern ( (testerFull arg0@@59 arg1@@29))
)))
(assert (forall ((Heap@@17 T@U) (r_1@@19 T@U) ) (!  (=> (and (= (type Heap@@17) (MapType0Type RefType)) (= (type r_1@@19) RefType)) (and (= (testerFull Heap@@17 r_1@@19) (|testerFull'| Heap@@17 r_1@@19)) (dummyFunction (|testerFull#triggerStateless| r_1@@19))))
 :qid |stdinbpl.634:15|
 :skolemid |92|
 :pattern ( (testerFull Heap@@17 r_1@@19))
)))
(assert (forall ((arg0@@60 T@U) (arg1@@30 T@U) ) (! (= (type (testerfield arg0@@60 arg1@@30)) RefType)
 :qid |funType:testerfield|
 :pattern ( (testerfield arg0@@60 arg1@@30))
)))
(assert (forall ((Heap@@18 T@U) (r_1@@20 T@U) ) (!  (=> (and (= (type Heap@@18) (MapType0Type RefType)) (= (type r_1@@20) RefType)) (and (= (testerfield Heap@@18 r_1@@20) (|testerfield'| Heap@@18 r_1@@20)) (dummyFunction (|testerfield#triggerStateless| r_1@@20))))
 :qid |stdinbpl.682:15|
 :skolemid |95|
 :pattern ( (testerfield Heap@@18 r_1@@20))
)))
(assert (forall ((arg0@@61 T@U) (arg1@@31 T@U) ) (! (= (type (testerfieldFull arg0@@61 arg1@@31)) RefType)
 :qid |funType:testerfieldFull|
 :pattern ( (testerfieldFull arg0@@61 arg1@@31))
)))
(assert (forall ((Heap@@19 T@U) (r_1@@21 T@U) ) (!  (=> (and (= (type Heap@@19) (MapType0Type RefType)) (= (type r_1@@21) RefType)) (and (= (testerfieldFull Heap@@19 r_1@@21) (|testerfieldFull'| Heap@@19 r_1@@21)) (dummyFunction (|testerfieldFull#triggerStateless| r_1@@21))))
 :qid |stdinbpl.733:15|
 :skolemid |98|
 :pattern ( (testerfieldFull Heap@@19 r_1@@21))
)))
(assert (forall ((a@@6 Int) ) (!  (=> (<= 0 a@@6) (= (|Math#clip| a@@6) a@@6))
 :qid |stdinbpl.379:15|
 :skolemid |54|
 :pattern ( (|Math#clip| a@@6))
)))
(assert (forall ((a@@7 T@U) (b@@6 T@U) (o@@0 T@U) ) (! (let ((T@@12 (type o@@0)))
 (=> (and (= (type a@@7) (MultiSetType T@@12)) (= (type b@@6) (MultiSetType T@@12))) (= (|MultiSet#Select| (|MultiSet#Intersection| a@@7 b@@6) o@@0) (|Math#min| (|MultiSet#Select| a@@7 o@@0) (|MultiSet#Select| b@@6 o@@0)))))
 :qid |stdinbpl.430:18|
 :skolemid |69|
 :pattern ( (|MultiSet#Select| (|MultiSet#Intersection| a@@7 b@@6) o@@0))
)))
(assert (forall ((r_1@@22 T@U) (r2 T@U) ) (!  (=> (and (and (= (type r_1@@22) RefType) (= (type r2) RefType)) (= (P r_1@@22) (P r2))) (= r_1@@22 r2))
 :qid |stdinbpl.796:15|
 :skolemid |104|
 :pattern ( (P r_1@@22) (P r2))
)))
(assert (forall ((arg0@@62 T@U) ) (! (= (type (|P#sm| arg0@@62)) (FieldType PredicateType_PType (MapType1Type RefType boolType)))
 :qid |funType:P#sm|
 :pattern ( (|P#sm| arg0@@62))
)))
(assert (forall ((r_1@@23 T@U) (r2@@0 T@U) ) (!  (=> (and (and (= (type r_1@@23) RefType) (= (type r2@@0) RefType)) (= (|P#sm| r_1@@23) (|P#sm| r2@@0))) (= r_1@@23 r2@@0))
 :qid |stdinbpl.800:15|
 :skolemid |105|
 :pattern ( (|P#sm| r_1@@23) (|P#sm| r2@@0))
)))
(assert (forall ((r_1@@24 T@U) (r2@@1 T@U) ) (!  (=> (and (and (= (type r_1@@24) RefType) (= (type r2@@1) RefType)) (= (P2 r_1@@24) (P2 r2@@1))) (= r_1@@24 r2@@1))
 :qid |stdinbpl.905:15|
 :skolemid |117|
 :pattern ( (P2 r_1@@24) (P2 r2@@1))
)))
(assert (forall ((arg0@@63 T@U) ) (! (= (type (|P2#sm| arg0@@63)) (FieldType PredicateType_P2Type (MapType1Type RefType boolType)))
 :qid |funType:P2#sm|
 :pattern ( (|P2#sm| arg0@@63))
)))
(assert (forall ((r_1@@25 T@U) (r2@@2 T@U) ) (!  (=> (and (and (= (type r_1@@25) RefType) (= (type r2@@2) RefType)) (= (|P2#sm| r_1@@25) (|P2#sm| r2@@2))) (= r_1@@25 r2@@2))
 :qid |stdinbpl.909:15|
 :skolemid |118|
 :pattern ( (|P2#sm| r_1@@25) (|P2#sm| r2@@2))
)))
(assert (forall ((r_1@@26 T@U) (r2@@3 T@U) ) (!  (=> (and (and (= (type r_1@@26) RefType) (= (type r2@@3) RefType)) (= (R r_1@@26) (R r2@@3))) (= r_1@@26 r2@@3))
 :qid |stdinbpl.1018:15|
 :skolemid |131|
 :pattern ( (R r_1@@26) (R r2@@3))
)))
(assert (forall ((arg0@@64 T@U) ) (! (= (type (|R#sm| arg0@@64)) (FieldType PredicateType_RType (MapType1Type RefType boolType)))
 :qid |funType:R#sm|
 :pattern ( (|R#sm| arg0@@64))
)))
(assert (forall ((r_1@@27 T@U) (r2@@4 T@U) ) (!  (=> (and (and (= (type r_1@@27) RefType) (= (type r2@@4) RefType)) (= (|R#sm| r_1@@27) (|R#sm| r2@@4))) (= r_1@@27 r2@@4))
 :qid |stdinbpl.1022:15|
 :skolemid |132|
 :pattern ( (|R#sm| r_1@@27) (|R#sm| r2@@4))
)))
(assert (forall ((r_1@@28 T@U) (r2@@5 T@U) ) (!  (=> (and (and (= (type r_1@@28) RefType) (= (type r2@@5) RefType)) (= (R2 r_1@@28) (R2 r2@@5))) (= r_1@@28 r2@@5))
 :qid |stdinbpl.1124:15|
 :skolemid |144|
 :pattern ( (R2 r_1@@28) (R2 r2@@5))
)))
(assert (forall ((arg0@@65 T@U) ) (! (= (type (|R2#sm| arg0@@65)) (FieldType PredicateType_R2Type (MapType1Type RefType boolType)))
 :qid |funType:R2#sm|
 :pattern ( (|R2#sm| arg0@@65))
)))
(assert (forall ((r_1@@29 T@U) (r2@@6 T@U) ) (!  (=> (and (and (= (type r_1@@29) RefType) (= (type r2@@6) RefType)) (= (|R2#sm| r_1@@29) (|R2#sm| r2@@6))) (= r_1@@29 r2@@6))
 :qid |stdinbpl.1128:15|
 :skolemid |145|
 :pattern ( (|R2#sm| r_1@@29) (|R2#sm| r2@@6))
)))
(assert (forall ((r_1@@30 T@U) (r2@@7 T@U) ) (!  (=> (and (and (= (type r_1@@30) RefType) (= (type r2@@7) RefType)) (= (Q r_1@@30) (Q r2@@7))) (= r_1@@30 r2@@7))
 :qid |stdinbpl.1235:15|
 :skolemid |158|
 :pattern ( (Q r_1@@30) (Q r2@@7))
)))
(assert (forall ((arg0@@66 T@U) ) (! (= (type (|Q#sm| arg0@@66)) (FieldType PredicateType_QType (MapType1Type RefType boolType)))
 :qid |funType:Q#sm|
 :pattern ( (|Q#sm| arg0@@66))
)))
(assert (forall ((r_1@@31 T@U) (r2@@8 T@U) ) (!  (=> (and (and (= (type r_1@@31) RefType) (= (type r2@@8) RefType)) (= (|Q#sm| r_1@@31) (|Q#sm| r2@@8))) (= r_1@@31 r2@@8))
 :qid |stdinbpl.1239:15|
 :skolemid |159|
 :pattern ( (|Q#sm| r_1@@31) (|Q#sm| r2@@8))
)))
(assert (forall ((Heap@@20 T@U) (ExhaleHeap@@2 T@U) (Mask@@3 T@U) (o_1@@0 T@U) (f_2 T@U) ) (! (let ((B@@1 (FieldTypeInv1 (type f_2))))
(let ((A@@1 (FieldTypeInv0 (type f_2))))
 (=> (and (and (and (and (and (and (= (type Heap@@20) (MapType0Type RefType)) (= (type ExhaleHeap@@2) (MapType0Type RefType))) (= (type Mask@@3) (MapType1Type RefType realType))) (= (type o_1@@0) RefType)) (= (type f_2) (FieldType A@@1 B@@1))) (IdenticalOnKnownLocations Heap@@20 ExhaleHeap@@2 Mask@@3)) (HasDirectPerm Mask@@3 o_1@@0 f_2)) (= (MapType0Select Heap@@20 o_1@@0 f_2) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2)))))
 :qid |stdinbpl.42:22|
 :skolemid |1|
 :pattern ( (IdenticalOnKnownLocations Heap@@20 ExhaleHeap@@2 Mask@@3) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2))
)))
(assert (= (type EmptyFrame) FrameTypeType))
(assert (forall ((Heap@@21 T@U) (Mask@@4 T@U) (r_1@@32 T@U) ) (!  (=> (and (and (and (= (type Heap@@21) (MapType0Type RefType)) (= (type Mask@@4) (MapType1Type RefType realType))) (= (type r_1@@32) RefType)) (and (state Heap@@21 Mask@@4) (or (< AssumeFunctionsAbove 3) (|get#trigger| EmptyFrame r_1@@32)))) (U_2_bool (MapType2Select (refs Heap@@21 r_1@@32) (|get'| Heap@@21 r_1@@32))))
 :qid |stdinbpl.543:15|
 :skolemid |88|
 :pattern ( (state Heap@@21 Mask@@4) (|get'| Heap@@21 r_1@@32))
)))
(assert  (and (= (type dummyHeap) (MapType0Type RefType)) (= (type ZeroMask) (MapType1Type RefType realType))))
(assert (state dummyHeap ZeroMask))
(assert (forall ((arg0@@67 T@U) (arg1@@32 T@U) ) (! (let ((T@@13 (type arg1@@32)))
(= (type (|MultiSet#UnionOne| arg0@@67 arg1@@32)) (MultiSetType T@@13)))
 :qid |funType:MultiSet#UnionOne|
 :pattern ( (|MultiSet#UnionOne| arg0@@67 arg1@@32))
)))
(assert (forall ((a@@8 T@U) (x@@8 T@U) ) (! (let ((T@@14 (type x@@8)))
 (=> (= (type a@@8) (MultiSetType T@@14)) (= (|MultiSet#Card| (|MultiSet#UnionOne| a@@8 x@@8)) (+ (|MultiSet#Card| a@@8) 1))))
 :qid |stdinbpl.416:18|
 :skolemid |65|
 :pattern ( (|MultiSet#Card| (|MultiSet#UnionOne| a@@8 x@@8)))
 :pattern ( (|MultiSet#UnionOne| a@@8 x@@8) (|MultiSet#Card| a@@8))
)))
(assert (forall ((a@@9 T@U) (b@@7 T@U) ) (! (let ((T@@15 (MultiSetTypeInv0 (type a@@9))))
 (=> (and (= (type a@@9) (MultiSetType T@@15)) (= (type b@@7) (MultiSetType T@@15))) (= (|MultiSet#Disjoint| a@@9 b@@7) (forall ((o@@1 T@U) ) (!  (=> (= (type o@@1) T@@15) (or (= (|MultiSet#Select| a@@9 o@@1) 0) (= (|MultiSet#Select| b@@7 o@@1) 0)))
 :qid |stdinbpl.466:39|
 :skolemid |80|
 :pattern ( (|MultiSet#Select| a@@9 o@@1))
 :pattern ( (|MultiSet#Select| b@@7 o@@1))
)))))
 :qid |stdinbpl.465:18|
 :skolemid |81|
 :pattern ( (|MultiSet#Disjoint| a@@9 b@@7))
)))
(assert (forall ((p T@U) (v_1 T@U) (w T@U) ) (! (let ((A@@2 (FieldTypeInv0 (type p))))
 (=> (and (and (= (type p) (FieldType A@@2 FrameTypeType)) (= (type v_1) FrameTypeType)) (= (type w) FrameTypeType)) (not (InsidePredicate p v_1 p w))))
 :qid |stdinbpl.274:19|
 :skolemid |21|
 :pattern ( (InsidePredicate p v_1 p w))
)))
(assert (forall ((arg0@@68 T@U) ) (! (let ((T@@16 (type arg0@@68)))
(= (type (|MultiSet#Singleton| arg0@@68)) (MultiSetType T@@16)))
 :qid |funType:MultiSet#Singleton|
 :pattern ( (|MultiSet#Singleton| arg0@@68))
)))
(assert (forall ((r@@0 T@U) ) (!  (and (= (|MultiSet#Card| (|MultiSet#Singleton| r@@0)) 1) (= (|MultiSet#Select| (|MultiSet#Singleton| r@@0) r@@0) 1))
 :qid |stdinbpl.408:18|
 :skolemid |62|
 :pattern ( (|MultiSet#Singleton| r@@0))
)))
(assert  (not (IsPredicateField q_1)))
(assert  (not (IsWandField q_1)))
(assert (forall ((Heap@@22 T@U) (ExhaleHeap@@3 T@U) (Mask@@5 T@U) ) (!  (=> (and (and (and (= (type Heap@@22) (MapType0Type RefType)) (= (type ExhaleHeap@@3) (MapType0Type RefType))) (= (type Mask@@5) (MapType1Type RefType realType))) (IdenticalOnKnownLocations Heap@@22 ExhaleHeap@@3 Mask@@5)) (succHeap Heap@@22 ExhaleHeap@@3))
 :qid |stdinbpl.83:15|
 :skolemid |10|
 :pattern ( (IdenticalOnKnownLocations Heap@@22 ExhaleHeap@@3 Mask@@5))
)))
(assert (forall ((a@@10 T@U) (b@@8 T@U) ) (! (let ((T@@17 (MapType2TypeInv0 (type a@@10))))
 (=> (and (= (type a@@10) (MapType2Type T@@17 boolType)) (= (type b@@8) (MapType2Type T@@17 boolType))) (= (|Set#Equal| a@@10 b@@8) (forall ((o@@2 T@U) ) (!  (=> (= (type o@@2) T@@17) (= (U_2_bool (MapType2Select a@@10 o@@2)) (U_2_bool (MapType2Select b@@8 o@@2))))
 :qid |stdinbpl.361:31|
 :skolemid |48|
 :pattern ( (MapType2Select a@@10 o@@2))
 :pattern ( (MapType2Select b@@8 o@@2))
)))))
 :qid |stdinbpl.360:17|
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
 :qid |stdinbpl.426:18|
 :skolemid |68|
 :pattern ( (|MultiSet#Card| (|MultiSet#Union| a@@11 b@@9)))
 :pattern ( (|MultiSet#Card| a@@11) (|MultiSet#Union| a@@11 b@@9))
 :pattern ( (|MultiSet#Card| b@@9) (|MultiSet#Union| a@@11 b@@9))
)))
(assert (forall ((arg0@@69 Real) (arg1@@33 T@U) ) (! (= (type (ConditionalFrame arg0@@69 arg1@@33)) FrameTypeType)
 :qid |funType:ConditionalFrame|
 :pattern ( (ConditionalFrame arg0@@69 arg1@@33))
)))
(assert (forall ((p@@0 Real) (f_6 T@U) ) (!  (=> (= (type f_6) FrameTypeType) (= (ConditionalFrame p@@0 f_6) (ite (> p@@0 0.0) f_6 EmptyFrame)))
 :qid |stdinbpl.262:15|
 :skolemid |19|
 :pattern ( (ConditionalFrame p@@0 f_6))
)))
(assert (forall ((Mask@@6 T@U) (o_2@@0 T@U) (f_4@@0 T@U) ) (! (let ((B@@3 (FieldTypeInv1 (type f_4@@0))))
(let ((A@@4 (FieldTypeInv0 (type f_4@@0))))
 (=> (and (and (= (type Mask@@6) (MapType1Type RefType realType)) (= (type o_2@@0) RefType)) (= (type f_4@@0) (FieldType A@@4 B@@3))) (= (HasDirectPerm Mask@@6 o_2@@0 f_4@@0) (> (U_2_real (MapType1Select Mask@@6 o_2@@0 f_4@@0)) NoPerm)))))
 :qid |stdinbpl.133:22|
 :skolemid |17|
 :pattern ( (HasDirectPerm Mask@@6 o_2@@0 f_4@@0))
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
 :qid |stdinbpl.325:18|
 :skolemid |37|
 :pattern ( (MapType2Select (|Set#Intersection| a@@12 b@@10) o@@3))
 :pattern ( (|Set#Intersection| a@@12 b@@10) (MapType2Select a@@12 o@@3))
 :pattern ( (|Set#Intersection| a@@12 b@@10) (MapType2Select b@@10 o@@3))
)))
(assert (forall ((arg0@@70 T@U) (arg1@@34 T@U) ) (! (let ((T@@20 (MapType2TypeInv0 (type arg0@@70))))
(= (type (|Set#Difference| arg0@@70 arg1@@34)) (MapType2Type T@@20 boolType)))
 :qid |funType:Set#Difference|
 :pattern ( (|Set#Difference| arg0@@70 arg1@@34))
)))
(assert (forall ((a@@13 T@U) (b@@11 T@U) (o@@4 T@U) ) (! (let ((T@@21 (type o@@4)))
 (=> (and (= (type a@@13) (MapType2Type T@@21 boolType)) (= (type b@@11) (MapType2Type T@@21 boolType))) (= (U_2_bool (MapType2Select (|Set#Difference| a@@13 b@@11) o@@4))  (and (U_2_bool (MapType2Select a@@13 o@@4)) (not (U_2_bool (MapType2Select b@@11 o@@4)))))))
 :qid |stdinbpl.340:18|
 :skolemid |43|
 :pattern ( (MapType2Select (|Set#Difference| a@@13 b@@11) o@@4))
 :pattern ( (|Set#Difference| a@@13 b@@11) (MapType2Select a@@13 o@@4))
)))
(assert (forall ((a@@14 T@U) (b@@12 T@U) ) (! (let ((T@@22 (MapType2TypeInv0 (type a@@14))))
 (=> (and (and (= (type a@@14) (MapType2Type T@@22 boolType)) (= (type b@@12) (MapType2Type T@@22 boolType))) (|Set#Equal| a@@14 b@@12)) (= a@@14 b@@12)))
 :qid |stdinbpl.362:17|
 :skolemid |50|
 :pattern ( (|Set#Equal| a@@14 b@@12))
)))
(assert (forall ((a@@15 T@U) (b@@13 T@U) ) (! (let ((T@@23 (MultiSetTypeInv0 (type a@@15))))
 (=> (and (and (= (type a@@15) (MultiSetType T@@23)) (= (type b@@13) (MultiSetType T@@23))) (|MultiSet#Equal| a@@15 b@@13)) (= a@@15 b@@13)))
 :qid |stdinbpl.461:17|
 :skolemid |79|
 :pattern ( (|MultiSet#Equal| a@@15 b@@13))
)))
(assert (forall ((arg0@@71 T@U) (arg1@@35 T@U) ) (! (let ((T@@24 (type arg1@@35)))
(= (type (|Set#UnionOne| arg0@@71 arg1@@35)) (MapType2Type T@@24 boolType)))
 :qid |funType:Set#UnionOne|
 :pattern ( (|Set#UnionOne| arg0@@71 arg1@@35))
)))
(assert (forall ((a@@16 T@U) (x@@9 T@U) (y@@2 T@U) ) (! (let ((T@@25 (type x@@9)))
 (=> (and (and (= (type a@@16) (MapType2Type T@@25 boolType)) (= (type y@@2) T@@25)) (U_2_bool (MapType2Select a@@16 y@@2))) (U_2_bool (MapType2Select (|Set#UnionOne| a@@16 x@@9) y@@2))))
 :qid |stdinbpl.305:18|
 :skolemid |31|
 :pattern ( (|Set#UnionOne| a@@16 x@@9) (MapType2Select a@@16 y@@2))
)))
(assert (forall ((a@@17 T@U) (b@@14 T@U) (y@@3 T@U) ) (! (let ((T@@26 (type y@@3)))
 (=> (and (and (= (type a@@17) (MapType2Type T@@26 boolType)) (= (type b@@14) (MapType2Type T@@26 boolType))) (U_2_bool (MapType2Select a@@17 y@@3))) (U_2_bool (MapType2Select (|Set#Union| a@@17 b@@14) y@@3))))
 :qid |stdinbpl.315:18|
 :skolemid |35|
 :pattern ( (|Set#Union| a@@17 b@@14) (MapType2Select a@@17 y@@3))
)))
(assert (forall ((a@@18 T@U) (b@@15 T@U) (y@@4 T@U) ) (! (let ((T@@27 (type y@@4)))
 (=> (and (and (= (type a@@18) (MapType2Type T@@27 boolType)) (= (type b@@15) (MapType2Type T@@27 boolType))) (U_2_bool (MapType2Select b@@15 y@@4))) (U_2_bool (MapType2Select (|Set#Union| a@@18 b@@15) y@@4))))
 :qid |stdinbpl.317:18|
 :skolemid |36|
 :pattern ( (|Set#Union| a@@18 b@@15) (MapType2Select b@@15 y@@4))
)))
(assert (forall ((ms T@U) (x@@10 T@U) ) (! (let ((T@@28 (type x@@10)))
 (=> (= (type ms) (MultiSetType T@@28)) (>= (|MultiSet#Select| ms x@@10) 0)))
 :qid |stdinbpl.392:18|
 :skolemid |56|
 :pattern ( (|MultiSet#Select| ms x@@10))
)))
(assert (forall ((a@@19 T@U) (x@@11 T@U) (o@@5 T@U) ) (! (let ((T@@29 (type x@@11)))
 (=> (and (= (type a@@19) (MapType2Type T@@29 boolType)) (= (type o@@5) T@@29)) (= (U_2_bool (MapType2Select (|Set#UnionOne| a@@19 x@@11) o@@5))  (or (= o@@5 x@@11) (U_2_bool (MapType2Select a@@19 o@@5))))))
 :qid |stdinbpl.301:18|
 :skolemid |29|
 :pattern ( (MapType2Select (|Set#UnionOne| a@@19 x@@11) o@@5))
)))
(assert (forall ((a@@20 T@U) (b@@16 T@U) (y@@5 T@U) ) (! (let ((T@@30 (type y@@5)))
 (=> (and (and (= (type a@@20) (MapType2Type T@@30 boolType)) (= (type b@@16) (MapType2Type T@@30 boolType))) (U_2_bool (MapType2Select b@@16 y@@5))) (not (U_2_bool (MapType2Select (|Set#Difference| a@@20 b@@16) y@@5)))))
 :qid |stdinbpl.342:18|
 :skolemid |44|
 :pattern ( (|Set#Difference| a@@20 b@@16) (MapType2Select b@@16 y@@5))
)))
(assert (forall ((a@@21 T@U) (b@@17 T@U) ) (! (let ((T@@31 (MapType2TypeInv0 (type a@@21))))
 (=> (and (= (type a@@21) (MapType2Type T@@31 boolType)) (= (type b@@17) (MapType2Type T@@31 boolType))) (and (= (+ (+ (|Set#Card| (|Set#Difference| a@@21 b@@17)) (|Set#Card| (|Set#Difference| b@@17 a@@21))) (|Set#Card| (|Set#Intersection| a@@21 b@@17))) (|Set#Card| (|Set#Union| a@@21 b@@17))) (= (|Set#Card| (|Set#Difference| a@@21 b@@17)) (- (|Set#Card| a@@21) (|Set#Card| (|Set#Intersection| a@@21 b@@17)))))))
 :qid |stdinbpl.344:18|
 :skolemid |45|
 :pattern ( (|Set#Card| (|Set#Difference| a@@21 b@@17)))
)))
(assert (forall ((arg0@@72 Int) (arg1@@36 Int) ) (! (= (type (|sk_R2#condqp4| arg0@@72 arg1@@36)) RefType)
 :qid |funType:sk_R2#condqp4|
 :pattern ( (|sk_R2#condqp4| arg0@@72 arg1@@36))
)))
(assert (forall ((Heap2Heap@@0 T@U) (Heap1Heap@@0 T@U) (r_1@@33 T@U) ) (!  (=> (and (and (and (= (type Heap2Heap@@0) (MapType0Type RefType)) (= (type Heap1Heap@@0) (MapType0Type RefType))) (= (type r_1@@33) RefType)) (and (=  (and (U_2_bool (MapType2Select (refs Heap2Heap@@0 r_1@@33) (|sk_R2#condqp4| (|R2#condqp4| Heap2Heap@@0 r_1@@33) (|R2#condqp4| Heap1Heap@@0 r_1@@33)))) (< NoPerm (/ (to_real 1) (to_real 2))))  (and (U_2_bool (MapType2Select (refs Heap1Heap@@0 r_1@@33) (|sk_R2#condqp4| (|R2#condqp4| Heap2Heap@@0 r_1@@33) (|R2#condqp4| Heap1Heap@@0 r_1@@33)))) (< NoPerm (/ (to_real 1) (to_real 2))))) (=> (and (U_2_bool (MapType2Select (refs Heap2Heap@@0 r_1@@33) (|sk_R2#condqp4| (|R2#condqp4| Heap2Heap@@0 r_1@@33) (|R2#condqp4| Heap1Heap@@0 r_1@@33)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (= (MapType0Select Heap2Heap@@0 (|sk_R2#condqp4| (|R2#condqp4| Heap2Heap@@0 r_1@@33) (|R2#condqp4| Heap1Heap@@0 r_1@@33)) q_1) (MapType0Select Heap1Heap@@0 (|sk_R2#condqp4| (|R2#condqp4| Heap2Heap@@0 r_1@@33) (|R2#condqp4| Heap1Heap@@0 r_1@@33)) q_1))))) (= (|R2#condqp4| Heap2Heap@@0 r_1@@33) (|R2#condqp4| Heap1Heap@@0 r_1@@33)))
 :qid |stdinbpl.1144:15|
 :skolemid |147|
 :pattern ( (|R2#condqp4| Heap2Heap@@0 r_1@@33) (|R2#condqp4| Heap1Heap@@0 r_1@@33) (succHeapTrans Heap2Heap@@0 Heap1Heap@@0))
)))
(assert (forall ((s T@U) ) (! (let ((T@@32 (MapType2TypeInv0 (type s))))
 (=> (= (type s) (MapType2Type T@@32 boolType)) (<= 0 (|Set#Card| s))))
 :qid |stdinbpl.287:18|
 :skolemid |22|
 :pattern ( (|Set#Card| s))
)))
(assert (forall ((s@@0 T@U) ) (! (let ((T@@33 (MultiSetTypeInv0 (type s@@0))))
 (=> (= (type s@@0) (MultiSetType T@@33)) (<= 0 (|MultiSet#Card| s@@0))))
 :qid |stdinbpl.395:18|
 :skolemid |57|
 :pattern ( (|MultiSet#Card| s@@0))
)))
(assert (forall ((T@@34 T@T) ) (! (= (type (|MultiSet#Empty| T@@34)) (MultiSetType T@@34))
 :qid |funType:MultiSet#Empty|
 :pattern ( (|MultiSet#Empty| T@@34))
)))
(assert (forall ((o@@6 T@U) ) (! (let ((T@@35 (type o@@6)))
(= (|MultiSet#Select| (|MultiSet#Empty| T@@35) o@@6) 0))
 :qid |stdinbpl.400:18|
 :skolemid |58|
 :pattern ( (let ((T@@35 (type o@@6)))
(|MultiSet#Select| (|MultiSet#Empty| T@@35) o@@6)))
)))
(assert (forall ((a@@22 T@U) (x@@12 T@U) ) (! (let ((T@@36 (type x@@12)))
 (=> (= (type a@@22) (MapType2Type T@@36 boolType)) (U_2_bool (MapType2Select (|Set#UnionOne| a@@22 x@@12) x@@12))))
 :qid |stdinbpl.303:18|
 :skolemid |30|
 :pattern ( (|Set#UnionOne| a@@22 x@@12))
)))
(assert (forall ((Heap@@23 T@U) (ExhaleHeap@@4 T@U) (Mask@@7 T@U) (pm_f@@1 T@U) ) (! (let ((C@@1 (FieldTypeInv0 (type pm_f@@1))))
 (=> (and (and (and (and (and (= (type Heap@@23) (MapType0Type RefType)) (= (type ExhaleHeap@@4) (MapType0Type RefType))) (= (type Mask@@7) (MapType1Type RefType realType))) (= (type pm_f@@1) (FieldType C@@1 FrameTypeType))) (IdenticalOnKnownLocations Heap@@23 ExhaleHeap@@4 Mask@@7)) (and (HasDirectPerm Mask@@7 null pm_f@@1) (IsPredicateField pm_f@@1))) (forall ((o2 T@U) (f_2@@0 T@U) ) (! (let ((B@@5 (FieldTypeInv1 (type f_2@@0))))
(let ((A@@6 (FieldTypeInv0 (type f_2@@0))))
 (=> (and (and (= (type o2) RefType) (= (type f_2@@0) (FieldType A@@6 B@@5))) (U_2_bool (MapType1Select (MapType0Select Heap@@23 null (PredicateMaskField pm_f@@1)) o2 f_2@@0))) (= (MapType0Select Heap@@23 o2 f_2@@0) (MapType0Select ExhaleHeap@@4 o2 f_2@@0)))))
 :qid |stdinbpl.54:134|
 :skolemid |3|
 :pattern ( (MapType0Select ExhaleHeap@@4 o2 f_2@@0))
))))
 :qid |stdinbpl.52:19|
 :skolemid |4|
 :pattern ( (IdenticalOnKnownLocations Heap@@23 ExhaleHeap@@4 Mask@@7) (IsPredicateField pm_f@@1))
)))
(assert (forall ((Heap@@24 T@U) (ExhaleHeap@@5 T@U) (Mask@@8 T@U) (pm_f@@2 T@U) ) (! (let ((C@@2 (FieldTypeInv0 (type pm_f@@2))))
 (=> (and (and (and (and (and (= (type Heap@@24) (MapType0Type RefType)) (= (type ExhaleHeap@@5) (MapType0Type RefType))) (= (type Mask@@8) (MapType1Type RefType realType))) (= (type pm_f@@2) (FieldType C@@2 FrameTypeType))) (IdenticalOnKnownLocations Heap@@24 ExhaleHeap@@5 Mask@@8)) (and (HasDirectPerm Mask@@8 null pm_f@@2) (IsWandField pm_f@@2))) (forall ((o2@@0 T@U) (f_2@@1 T@U) ) (! (let ((B@@6 (FieldTypeInv1 (type f_2@@1))))
(let ((A@@7 (FieldTypeInv0 (type f_2@@1))))
 (=> (and (and (= (type o2@@0) RefType) (= (type f_2@@1) (FieldType A@@7 B@@6))) (U_2_bool (MapType1Select (MapType0Select Heap@@24 null (WandMaskField pm_f@@2)) o2@@0 f_2@@1))) (= (MapType0Select Heap@@24 o2@@0 f_2@@1) (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1)))))
 :qid |stdinbpl.67:129|
 :skolemid |6|
 :pattern ( (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1))
))))
 :qid |stdinbpl.65:19|
 :skolemid |7|
 :pattern ( (IdenticalOnKnownLocations Heap@@24 ExhaleHeap@@5 Mask@@8) (IsWandField pm_f@@2))
)))
(assert (forall ((a@@23 T@U) (x@@13 T@U) ) (! (let ((T@@37 (type x@@13)))
 (=> (and (= (type a@@23) (MapType2Type T@@37 boolType)) (U_2_bool (MapType2Select a@@23 x@@13))) (= (|Set#Card| (|Set#UnionOne| a@@23 x@@13)) (|Set#Card| a@@23))))
 :qid |stdinbpl.307:18|
 :skolemid |32|
 :pattern ( (|Set#Card| (|Set#UnionOne| a@@23 x@@13)))
)))
(assert (forall ((a@@24 T@U) (x@@14 T@U) ) (! (let ((T@@38 (type x@@14)))
 (=> (= (type a@@24) (MultiSetType T@@38)) (and (> (|MultiSet#Select| (|MultiSet#UnionOne| a@@24 x@@14) x@@14) 0) (> (|MultiSet#Card| (|MultiSet#UnionOne| a@@24 x@@14)) 0))))
 :qid |stdinbpl.419:18|
 :skolemid |66|
 :pattern ( (|MultiSet#UnionOne| a@@24 x@@14))
)))
(assert (forall ((r_1@@34 T@U) ) (!  (=> (= (type r_1@@34) RefType) (= (getPredWandId (P r_1@@34)) 0))
 :qid |stdinbpl.790:15|
 :skolemid |103|
 :pattern ( (P r_1@@34))
)))
(assert (forall ((r_1@@35 T@U) ) (!  (=> (= (type r_1@@35) RefType) (= (getPredWandId (Q r_1@@35)) 1))
 :qid |stdinbpl.1229:15|
 :skolemid |157|
 :pattern ( (Q r_1@@35))
)))
(assert (forall ((r_1@@36 T@U) ) (!  (=> (= (type r_1@@36) RefType) (= (getPredWandId (P2 r_1@@36)) 2))
 :qid |stdinbpl.899:15|
 :skolemid |116|
 :pattern ( (P2 r_1@@36))
)))
(assert (forall ((r_1@@37 T@U) ) (!  (=> (= (type r_1@@37) RefType) (= (getPredWandId (R r_1@@37)) 3))
 :qid |stdinbpl.1012:15|
 :skolemid |130|
 :pattern ( (R r_1@@37))
)))
(assert (forall ((r_1@@38 T@U) ) (!  (=> (= (type r_1@@38) RefType) (= (getPredWandId (R2 r_1@@38)) 4))
 :qid |stdinbpl.1118:15|
 :skolemid |143|
 :pattern ( (R2 r_1@@38))
)))
(assert (forall ((r@@1 T@U) ) (! (= (|Set#Card| (|Set#Singleton| r@@1)) 1)
 :qid |stdinbpl.298:18|
 :skolemid |28|
 :pattern ( (|Set#Card| (|Set#Singleton| r@@1)))
)))
(assert (forall ((Mask@@9 T@U) (o_2@@2 T@U) (f_4@@2 T@U) ) (! (let ((B@@7 (FieldTypeInv1 (type f_4@@2))))
(let ((A@@8 (FieldTypeInv0 (type f_4@@2))))
 (=> (and (and (and (= (type Mask@@9) (MapType1Type RefType realType)) (= (type o_2@@2) RefType)) (= (type f_4@@2) (FieldType A@@8 B@@7))) (GoodMask Mask@@9)) (and (>= (U_2_real (MapType1Select Mask@@9 o_2@@2 f_4@@2)) NoPerm) (=> (and (and (GoodMask Mask@@9) (not (IsPredicateField f_4@@2))) (not (IsWandField f_4@@2))) (<= (U_2_real (MapType1Select Mask@@9 o_2@@2 f_4@@2)) FullPerm))))))
 :qid |stdinbpl.128:22|
 :skolemid |16|
 :pattern ( (GoodMask Mask@@9) (MapType1Select Mask@@9 o_2@@2 f_4@@2))
)))
(assert (forall ((r@@2 T@U) ) (! (U_2_bool (MapType2Select (|Set#Singleton| r@@2) r@@2))
 :qid |stdinbpl.296:18|
 :skolemid |26|
 :pattern ( (|Set#Singleton| r@@2))
)))
(assert (forall ((arg0@@73 T@U) (arg1@@37 T@U) ) (! (= (type (|refs#frame| arg0@@73 arg1@@37)) (MapType2Type RefType boolType))
 :qid |funType:refs#frame|
 :pattern ( (|refs#frame| arg0@@73 arg1@@37))
)))
(assert (forall ((Heap@@25 T@U) (Mask@@10 T@U) (r_1@@39 T@U) ) (!  (=> (and (and (and (= (type Heap@@25) (MapType0Type RefType)) (= (type Mask@@10) (MapType1Type RefType realType))) (= (type r_1@@39) RefType)) (state Heap@@25 Mask@@10)) (= (|refs'| Heap@@25 r_1@@39) (|refs#frame| EmptyFrame r_1@@39)))
 :qid |stdinbpl.496:15|
 :skolemid |84|
 :pattern ( (state Heap@@25 Mask@@10) (|refs'| Heap@@25 r_1@@39))
)))
(assert (forall ((arg0@@74 T@U) (arg1@@38 T@U) ) (! (= (type (|get#frame| arg0@@74 arg1@@38)) RefType)
 :qid |funType:get#frame|
 :pattern ( (|get#frame| arg0@@74 arg1@@38))
)))
(assert (forall ((Heap@@26 T@U) (Mask@@11 T@U) (r_1@@40 T@U) ) (!  (=> (and (and (and (= (type Heap@@26) (MapType0Type RefType)) (= (type Mask@@11) (MapType1Type RefType realType))) (= (type r_1@@40) RefType)) (state Heap@@26 Mask@@11)) (= (|get'| Heap@@26 r_1@@40) (|get#frame| EmptyFrame r_1@@40)))
 :qid |stdinbpl.537:15|
 :skolemid |87|
 :pattern ( (state Heap@@26 Mask@@11) (|get'| Heap@@26 r_1@@40))
)))
(assert (forall ((a@@25 T@U) (b@@18 T@U) ) (! (let ((T@@39 (MapType2TypeInv0 (type a@@25))))
 (=> (and (= (type a@@25) (MapType2Type T@@39 boolType)) (= (type b@@18) (MapType2Type T@@39 boolType))) (= (|Set#Union| a@@25 (|Set#Union| a@@25 b@@18)) (|Set#Union| a@@25 b@@18))))
 :qid |stdinbpl.330:18|
 :skolemid |39|
 :pattern ( (|Set#Union| a@@25 (|Set#Union| a@@25 b@@18)))
)))
(assert (forall ((a@@26 T@U) (b@@19 T@U) ) (! (let ((T@@40 (MapType2TypeInv0 (type a@@26))))
 (=> (and (= (type a@@26) (MapType2Type T@@40 boolType)) (= (type b@@19) (MapType2Type T@@40 boolType))) (= (|Set#Intersection| a@@26 (|Set#Intersection| a@@26 b@@19)) (|Set#Intersection| a@@26 b@@19))))
 :qid |stdinbpl.334:18|
 :skolemid |41|
 :pattern ( (|Set#Intersection| a@@26 (|Set#Intersection| a@@26 b@@19)))
)))
(assert (forall ((a@@27 T@U) (b@@20 T@U) ) (! (let ((T@@41 (MultiSetTypeInv0 (type a@@27))))
 (=> (and (= (type a@@27) (MultiSetType T@@41)) (= (type b@@20) (MultiSetType T@@41))) (= (|MultiSet#Intersection| a@@27 (|MultiSet#Intersection| a@@27 b@@20)) (|MultiSet#Intersection| a@@27 b@@20))))
 :qid |stdinbpl.436:18|
 :skolemid |71|
 :pattern ( (|MultiSet#Intersection| a@@27 (|MultiSet#Intersection| a@@27 b@@20)))
)))
(assert (forall ((s@@1 T@U) ) (! (let ((T@@42 (MultiSetTypeInv0 (type s@@1))))
 (=> (= (type s@@1) (MultiSetType T@@42)) (and (= (= (|MultiSet#Card| s@@1) 0) (= s@@1 (|MultiSet#Empty| T@@42))) (=> (not (= (|MultiSet#Card| s@@1) 0)) (exists ((x@@15 T@U) ) (!  (and (= (type x@@15) T@@42) (< 0 (|MultiSet#Select| s@@1 x@@15)))
 :qid |stdinbpl.403:38|
 :skolemid |59|
 :no-pattern (type x@@15)
 :no-pattern (U_2_int x@@15)
 :no-pattern (U_2_bool x@@15)
))))))
 :qid |stdinbpl.401:18|
 :skolemid |60|
 :pattern ( (|MultiSet#Card| s@@1))
)))
(assert (forall ((arg0@@75 T@U) (arg1@@39 T@U) ) (! (= (type (|tester#frame| arg0@@75 arg1@@39)) RefType)
 :qid |funType:tester#frame|
 :pattern ( (|tester#frame| arg0@@75 arg1@@39))
)))
(assert (forall ((Heap@@27 T@U) (Mask@@12 T@U) (r_1@@41 T@U) ) (!  (=> (and (and (and (= (type Heap@@27) (MapType0Type RefType)) (= (type Mask@@12) (MapType1Type RefType realType))) (= (type r_1@@41) RefType)) (state Heap@@27 Mask@@12)) (= (|tester'| Heap@@27 r_1@@41) (|tester#frame| (MapType0Select Heap@@27 null (Q r_1@@41)) r_1@@41)))
 :qid |stdinbpl.595:15|
 :skolemid |91|
 :pattern ( (state Heap@@27 Mask@@12) (|tester'| Heap@@27 r_1@@41))
)))
(assert (forall ((arg0@@76 T@U) (arg1@@40 T@U) ) (! (= (type (|testerFull#frame| arg0@@76 arg1@@40)) RefType)
 :qid |funType:testerFull#frame|
 :pattern ( (|testerFull#frame| arg0@@76 arg1@@40))
)))
(assert (forall ((Heap@@28 T@U) (Mask@@13 T@U) (r_1@@42 T@U) ) (!  (=> (and (and (and (= (type Heap@@28) (MapType0Type RefType)) (= (type Mask@@13) (MapType1Type RefType realType))) (= (type r_1@@42) RefType)) (state Heap@@28 Mask@@13)) (= (|testerFull'| Heap@@28 r_1@@42) (|testerFull#frame| (MapType0Select Heap@@28 null (Q r_1@@42)) r_1@@42)))
 :qid |stdinbpl.645:15|
 :skolemid |94|
 :pattern ( (state Heap@@28 Mask@@13) (|testerFull'| Heap@@28 r_1@@42))
)))
(assert  (and (forall ((arg0@@77 T@U) (arg1@@41 T@U) ) (! (= (type (|testerfield#frame| arg0@@77 arg1@@41)) RefType)
 :qid |funType:testerfield#frame|
 :pattern ( (|testerfield#frame| arg0@@77 arg1@@41))
)) (forall ((arg0@@78 T@U) ) (! (= (type (FrameFragment arg0@@78)) FrameTypeType)
 :qid |funType:FrameFragment|
 :pattern ( (FrameFragment arg0@@78))
))))
(assert (forall ((Heap@@29 T@U) (Mask@@14 T@U) (r_1@@43 T@U) ) (!  (=> (and (and (and (= (type Heap@@29) (MapType0Type RefType)) (= (type Mask@@14) (MapType1Type RefType realType))) (= (type r_1@@43) RefType)) (state Heap@@29 Mask@@14)) (= (|testerfield'| Heap@@29 r_1@@43) (|testerfield#frame| (FrameFragment (MapType0Select Heap@@29 r_1@@43 q_1)) r_1@@43)))
 :qid |stdinbpl.693:15|
 :skolemid |97|
 :pattern ( (state Heap@@29 Mask@@14) (|testerfield'| Heap@@29 r_1@@43))
)))
(assert (forall ((arg0@@79 T@U) (arg1@@42 T@U) ) (! (= (type (|testerfieldFull#frame| arg0@@79 arg1@@42)) RefType)
 :qid |funType:testerfieldFull#frame|
 :pattern ( (|testerfieldFull#frame| arg0@@79 arg1@@42))
)))
(assert (forall ((Heap@@30 T@U) (Mask@@15 T@U) (r_1@@44 T@U) ) (!  (=> (and (and (and (= (type Heap@@30) (MapType0Type RefType)) (= (type Mask@@15) (MapType1Type RefType realType))) (= (type r_1@@44) RefType)) (state Heap@@30 Mask@@15)) (= (|testerfieldFull'| Heap@@30 r_1@@44) (|testerfieldFull#frame| (FrameFragment (MapType0Select Heap@@30 r_1@@44 q_1)) r_1@@44)))
 :qid |stdinbpl.744:15|
 :skolemid |100|
 :pattern ( (state Heap@@30 Mask@@15) (|testerfieldFull'| Heap@@30 r_1@@44))
)))
(assert (forall ((r@@3 T@U) (o@@7 T@U) ) (! (let ((T@@43 (type r@@3)))
 (=> (= (type o@@7) T@@43) (and (= (= (|MultiSet#Select| (|MultiSet#Singleton| r@@3) o@@7) 1) (= r@@3 o@@7)) (= (= (|MultiSet#Select| (|MultiSet#Singleton| r@@3) o@@7) 0) (not (= r@@3 o@@7))))))
 :qid |stdinbpl.406:18|
 :skolemid |61|
 :pattern ( (|MultiSet#Select| (|MultiSet#Singleton| r@@3) o@@7))
)))
(assert (forall ((o@@8 T@U) (f T@U) (Heap@@31 T@U) ) (!  (=> (and (and (and (= (type o@@8) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap@@31) (MapType0Type RefType))) (U_2_bool (MapType0Select Heap@@31 o@@8 $allocated))) (U_2_bool (MapType0Select Heap@@31 (MapType0Select Heap@@31 o@@8 f) $allocated)))
 :qid |stdinbpl.31:15|
 :skolemid |0|
 :pattern ( (MapType0Select Heap@@31 o@@8 f))
)))
(assert (forall ((a@@28 T@U) (b@@21 T@U) (o@@9 T@U) ) (! (let ((T@@44 (type o@@9)))
 (=> (and (= (type a@@28) (MultiSetType T@@44)) (= (type b@@21) (MultiSetType T@@44))) (= (|MultiSet#Select| (|MultiSet#Union| a@@28 b@@21) o@@9) (+ (|MultiSet#Select| a@@28 o@@9) (|MultiSet#Select| b@@21 o@@9)))))
 :qid |stdinbpl.424:18|
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
 :qid |stdinbpl.290:18|
 :skolemid |23|
 :pattern ( (let ((T@@46 (type o@@10)))
(MapType2Select (|Set#Empty| T@@46) o@@10)))
)))
(assert (forall ((arg0@@80 Int) (arg1@@43 Int) ) (! (= (type (|sk_R#condqp3| arg0@@80 arg1@@43)) RefType)
 :qid |funType:sk_R#condqp3|
 :pattern ( (|sk_R#condqp3| arg0@@80 arg1@@43))
)))
(assert (forall ((Heap2Heap@@1 T@U) (Heap1Heap@@1 T@U) (r_1@@45 T@U) ) (!  (=> (and (and (and (= (type Heap2Heap@@1) (MapType0Type RefType)) (= (type Heap1Heap@@1) (MapType0Type RefType))) (= (type r_1@@45) RefType)) (and (= (U_2_bool (MapType2Select (refs Heap2Heap@@1 r_1@@45) (|sk_R#condqp3| (|R#condqp3| Heap2Heap@@1 r_1@@45) (|R#condqp3| Heap1Heap@@1 r_1@@45)))) (U_2_bool (MapType2Select (refs Heap1Heap@@1 r_1@@45) (|sk_R#condqp3| (|R#condqp3| Heap2Heap@@1 r_1@@45) (|R#condqp3| Heap1Heap@@1 r_1@@45))))) (=> (U_2_bool (MapType2Select (refs Heap2Heap@@1 r_1@@45) (|sk_R#condqp3| (|R#condqp3| Heap2Heap@@1 r_1@@45) (|R#condqp3| Heap1Heap@@1 r_1@@45)))) (= (MapType0Select Heap2Heap@@1 (|sk_R#condqp3| (|R#condqp3| Heap2Heap@@1 r_1@@45) (|R#condqp3| Heap1Heap@@1 r_1@@45)) q_1) (MapType0Select Heap1Heap@@1 (|sk_R#condqp3| (|R#condqp3| Heap2Heap@@1 r_1@@45) (|R#condqp3| Heap1Heap@@1 r_1@@45)) q_1))))) (= (|R#condqp3| Heap2Heap@@1 r_1@@45) (|R#condqp3| Heap1Heap@@1 r_1@@45)))
 :qid |stdinbpl.1038:15|
 :skolemid |134|
 :pattern ( (|R#condqp3| Heap2Heap@@1 r_1@@45) (|R#condqp3| Heap1Heap@@1 r_1@@45) (succHeapTrans Heap2Heap@@1 Heap1Heap@@1))
)))
(assert (forall ((r_1@@46 T@U) ) (!  (=> (= (type r_1@@46) RefType) (= (PredicateMaskField (P r_1@@46)) (|P#sm| r_1@@46)))
 :qid |stdinbpl.782:15|
 :skolemid |101|
 :pattern ( (PredicateMaskField (P r_1@@46)))
)))
(assert (forall ((r_1@@47 T@U) ) (!  (=> (= (type r_1@@47) RefType) (= (PredicateMaskField (P2 r_1@@47)) (|P2#sm| r_1@@47)))
 :qid |stdinbpl.891:15|
 :skolemid |114|
 :pattern ( (PredicateMaskField (P2 r_1@@47)))
)))
(assert (forall ((r_1@@48 T@U) ) (!  (=> (= (type r_1@@48) RefType) (= (PredicateMaskField (R r_1@@48)) (|R#sm| r_1@@48)))
 :qid |stdinbpl.1004:15|
 :skolemid |128|
 :pattern ( (PredicateMaskField (R r_1@@48)))
)))
(assert (forall ((r_1@@49 T@U) ) (!  (=> (= (type r_1@@49) RefType) (= (PredicateMaskField (R2 r_1@@49)) (|R2#sm| r_1@@49)))
 :qid |stdinbpl.1110:15|
 :skolemid |141|
 :pattern ( (PredicateMaskField (R2 r_1@@49)))
)))
(assert (forall ((r_1@@50 T@U) ) (!  (=> (= (type r_1@@50) RefType) (= (PredicateMaskField (Q r_1@@50)) (|Q#sm| r_1@@50)))
 :qid |stdinbpl.1221:15|
 :skolemid |155|
 :pattern ( (PredicateMaskField (Q r_1@@50)))
)))
(assert (forall ((r@@4 T@U) ) (! (let ((T@@47 (type r@@4)))
(= (|MultiSet#Singleton| r@@4) (|MultiSet#UnionOne| (|MultiSet#Empty| T@@47) r@@4)))
 :qid |stdinbpl.409:18|
 :skolemid |63|
 :pattern ( (|MultiSet#Singleton| r@@4))
)))
(assert (forall ((a@@29 Int) (b@@22 Int) ) (! (= (<= a@@29 b@@22) (= (|Math#min| a@@29 b@@22) a@@29))
 :qid |stdinbpl.374:15|
 :skolemid |51|
 :pattern ( (|Math#min| a@@29 b@@22))
)))
(assert (forall ((a@@30 Int) (b@@23 Int) ) (! (= (<= b@@23 a@@30) (= (|Math#min| a@@30 b@@23) b@@23))
 :qid |stdinbpl.375:15|
 :skolemid |52|
 :pattern ( (|Math#min| a@@30 b@@23))
)))
(assert (forall ((s@@2 T@U) ) (! (let ((T@@48 (MapType2TypeInv0 (type s@@2))))
 (=> (= (type s@@2) (MapType2Type T@@48 boolType)) (and (= (= (|Set#Card| s@@2) 0) (= s@@2 (|Set#Empty| T@@48))) (=> (not (= (|Set#Card| s@@2) 0)) (exists ((x@@16 T@U) ) (!  (and (= (type x@@16) T@@48) (U_2_bool (MapType2Select s@@2 x@@16)))
 :qid |stdinbpl.293:33|
 :skolemid |24|
 :no-pattern (type x@@16)
 :no-pattern (U_2_int x@@16)
 :no-pattern (U_2_bool x@@16)
))))))
 :qid |stdinbpl.291:18|
 :skolemid |25|
 :pattern ( (|Set#Card| s@@2))
)))
(assert (forall ((Heap@@32 T@U) (o@@11 T@U) (f_3 T@U) (v T@U) ) (! (let ((B@@8 (type v)))
(let ((A@@9 (FieldTypeInv0 (type f_3))))
 (=> (and (and (= (type Heap@@32) (MapType0Type RefType)) (= (type o@@11) RefType)) (= (type f_3) (FieldType A@@9 B@@8))) (succHeap Heap@@32 (MapType0Store Heap@@32 o@@11 f_3 v)))))
 :qid |stdinbpl.78:22|
 :skolemid |9|
 :pattern ( (MapType0Store Heap@@32 o@@11 f_3 v))
)))
(assert (forall ((a@@31 T@U) (b@@24 T@U) ) (! (let ((T@@49 (MapType2TypeInv0 (type a@@31))))
 (=> (and (= (type a@@31) (MapType2Type T@@49 boolType)) (= (type b@@24) (MapType2Type T@@49 boolType))) (= (|Set#Subset| a@@31 b@@24) (forall ((o@@12 T@U) ) (!  (=> (and (= (type o@@12) T@@49) (U_2_bool (MapType2Select a@@31 o@@12))) (U_2_bool (MapType2Select b@@24 o@@12)))
 :qid |stdinbpl.353:32|
 :skolemid |46|
 :pattern ( (MapType2Select a@@31 o@@12))
 :pattern ( (MapType2Select b@@24 o@@12))
)))))
 :qid |stdinbpl.352:17|
 :skolemid |47|
 :pattern ( (|Set#Subset| a@@31 b@@24))
)))
(assert (forall ((a@@32 T@U) (x@@17 T@U) ) (! (let ((T@@50 (type x@@17)))
 (=> (and (= (type a@@32) (MapType2Type T@@50 boolType)) (not (U_2_bool (MapType2Select a@@32 x@@17)))) (= (|Set#Card| (|Set#UnionOne| a@@32 x@@17)) (+ (|Set#Card| a@@32) 1))))
 :qid |stdinbpl.309:18|
 :skolemid |33|
 :pattern ( (|Set#Card| (|Set#UnionOne| a@@32 x@@17)))
)))
(assert (forall ((a@@33 T@U) (b@@25 T@U) (o@@13 T@U) ) (! (let ((T@@51 (type o@@13)))
 (=> (and (= (type a@@33) (MultiSetType T@@51)) (= (type b@@25) (MultiSetType T@@51))) (= (|MultiSet#Select| (|MultiSet#Difference| a@@33 b@@25) o@@13) (|Math#clip| (- (|MultiSet#Select| a@@33 o@@13) (|MultiSet#Select| b@@25 o@@13))))))
 :qid |stdinbpl.441:18|
 :skolemid |72|
 :pattern ( (|MultiSet#Select| (|MultiSet#Difference| a@@33 b@@25) o@@13))
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
 :qid |stdinbpl.269:25|
 :skolemid |20|
 :pattern ( (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r@@5 u))
)))
(assert (forall ((a@@34 Int) ) (!  (=> (< a@@34 0) (= (|Math#clip| a@@34) 0))
 :qid |stdinbpl.380:15|
 :skolemid |55|
 :pattern ( (|Math#clip| a@@34))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
(assert (forall ((a@@35 T@U) (x@@18 T@U) (o@@14 T@U) ) (! (let ((T@@52 (type x@@18)))
 (=> (and (= (type a@@35) (MultiSetType T@@52)) (= (type o@@14) T@@52)) (= (|MultiSet#Select| (|MultiSet#UnionOne| a@@35 x@@18) o@@14) (ite (= x@@18 o@@14) (+ (|MultiSet#Select| a@@35 o@@14) 1) (|MultiSet#Select| a@@35 o@@14)))))
 :qid |stdinbpl.413:18|
 :skolemid |64|
 :pattern ( (|MultiSet#Select| (|MultiSet#UnionOne| a@@35 x@@18) o@@14))
 :pattern ( (|MultiSet#UnionOne| a@@35 x@@18) (|MultiSet#Select| a@@35 o@@14))
)))
(assert (forall ((a@@36 T@U) (b@@26 T@U) ) (! (let ((T@@53 (MultiSetTypeInv0 (type a@@36))))
 (=> (and (= (type a@@36) (MultiSetType T@@53)) (= (type b@@26) (MultiSetType T@@53))) (= (|MultiSet#Equal| a@@36 b@@26) (forall ((o@@15 T@U) ) (!  (=> (= (type o@@15) T@@53) (= (|MultiSet#Select| a@@36 o@@15) (|MultiSet#Select| b@@26 o@@15)))
 :qid |stdinbpl.459:36|
 :skolemid |77|
 :pattern ( (|MultiSet#Select| a@@36 o@@15))
 :pattern ( (|MultiSet#Select| b@@26 o@@15))
)))))
 :qid |stdinbpl.458:17|
 :skolemid |78|
 :pattern ( (|MultiSet#Equal| a@@36 b@@26))
)))
(assert (forall ((a@@37 T@U) (b@@27 T@U) ) (! (let ((T@@54 (MultiSetTypeInv0 (type a@@37))))
 (=> (and (= (type a@@37) (MultiSetType T@@54)) (= (type b@@27) (MultiSetType T@@54))) (= (|MultiSet#Subset| a@@37 b@@27) (forall ((o@@16 T@U) ) (!  (=> (= (type o@@16) T@@54) (<= (|MultiSet#Select| a@@37 o@@16) (|MultiSet#Select| b@@27 o@@16)))
 :qid |stdinbpl.455:37|
 :skolemid |75|
 :pattern ( (|MultiSet#Select| a@@37 o@@16))
 :pattern ( (|MultiSet#Select| b@@27 o@@16))
)))))
 :qid |stdinbpl.454:17|
 :skolemid |76|
 :pattern ( (|MultiSet#Subset| a@@37 b@@27))
)))
(assert (forall ((a@@38 T@U) (b@@28 T@U) (o@@17 T@U) ) (! (let ((T@@55 (type o@@17)))
 (=> (and (= (type a@@38) (MapType2Type T@@55 boolType)) (= (type b@@28) (MapType2Type T@@55 boolType))) (= (U_2_bool (MapType2Select (|Set#Union| a@@38 b@@28) o@@17))  (or (U_2_bool (MapType2Select a@@38 o@@17)) (U_2_bool (MapType2Select b@@28 o@@17))))))
 :qid |stdinbpl.313:18|
 :skolemid |34|
 :pattern ( (MapType2Select (|Set#Union| a@@38 b@@28) o@@17))
)))
(assert (forall ((arg0@@81 Int) (arg1@@44 Int) ) (! (= (type (|sk_P2#condqp2| arg0@@81 arg1@@44)) RefType)
 :qid |funType:sk_P2#condqp2|
 :pattern ( (|sk_P2#condqp2| arg0@@81 arg1@@44))
)))
(assert (forall ((Heap2Heap@@2 T@U) (Heap1Heap@@2 T@U) (r_1@@51 T@U) ) (!  (=> (and (and (and (= (type Heap2Heap@@2) (MapType0Type RefType)) (= (type Heap1Heap@@2) (MapType0Type RefType))) (= (type r_1@@51) RefType)) (and (=  (and (U_2_bool (MapType2Select (refs Heap2Heap@@2 r_1@@51) (|sk_P2#condqp2| (|P2#condqp2| Heap2Heap@@2 r_1@@51) (|P2#condqp2| Heap1Heap@@2 r_1@@51)))) (< NoPerm (/ (to_real 1) (to_real 2))))  (and (U_2_bool (MapType2Select (refs Heap1Heap@@2 r_1@@51) (|sk_P2#condqp2| (|P2#condqp2| Heap2Heap@@2 r_1@@51) (|P2#condqp2| Heap1Heap@@2 r_1@@51)))) (< NoPerm (/ (to_real 1) (to_real 2))))) (=> (and (U_2_bool (MapType2Select (refs Heap2Heap@@2 r_1@@51) (|sk_P2#condqp2| (|P2#condqp2| Heap2Heap@@2 r_1@@51) (|P2#condqp2| Heap1Heap@@2 r_1@@51)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (= (MapType0Select Heap2Heap@@2 null (Q (|sk_P2#condqp2| (|P2#condqp2| Heap2Heap@@2 r_1@@51) (|P2#condqp2| Heap1Heap@@2 r_1@@51)))) (MapType0Select Heap1Heap@@2 null (Q (|sk_P2#condqp2| (|P2#condqp2| Heap2Heap@@2 r_1@@51) (|P2#condqp2| Heap1Heap@@2 r_1@@51)))))))) (= (|P2#condqp2| Heap2Heap@@2 r_1@@51) (|P2#condqp2| Heap1Heap@@2 r_1@@51)))
 :qid |stdinbpl.925:15|
 :skolemid |120|
 :pattern ( (|P2#condqp2| Heap2Heap@@2 r_1@@51) (|P2#condqp2| Heap1Heap@@2 r_1@@51) (succHeapTrans Heap2Heap@@2 Heap1Heap@@2))
)))
; Valid

(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun QPMask@2 () T@U)
(declare-fun Heap@7 () T@U)
(declare-fun r_1@@52 () T@U)
(declare-fun r2@0 () T@U)
(declare-fun Mask@3 () T@U)
(declare-fun wildcard@0 () Real)
(declare-fun qpRange25 (T@U) Bool)
(declare-fun invRecv25 (T@U) T@U)
(declare-fun Heap@5 () T@U)
(declare-fun Heap@6 () T@U)
(declare-fun newVersion@1 () T@U)
(declare-fun Mask@2 () T@U)
(declare-fun perm@2 () Real)
(declare-fun newPMask@0 () T@U)
(declare-fun Heap@4 () T@U)
(declare-fun Heap@1 () T@U)
(declare-fun Heap@2 () T@U)
(declare-fun Heap@3 () T@U)
(declare-fun freshVersion@0 () T@U)
(declare-fun Mask@1 () T@U)
(declare-fun wildcard () Real)
(declare-fun QPMask@0 () T@U)
(declare-fun qpRange23 (T@U) Bool)
(declare-fun invRecv23 (T@U) T@U)
(declare-fun QPMask@1 () T@U)
(declare-fun neverTriggered24 (T@U) Bool)
(declare-fun qpRange24 (T@U) Bool)
(declare-fun invRecv24 (T@U) T@U)
(declare-fun perm@1 () Real)
(declare-fun Heap@@33 () T@U)
(declare-fun Heap@0 () T@U)
(declare-fun newVersion@0 () T@U)
(declare-fun Mask@0 () T@U)
(declare-fun perm@0 () Real)
(declare-fun r2@@9 () T@U)
(declare-fun r3 () T@U)
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (= (type QPMask@2) (MapType1Type RefType realType)) (= (type Heap@7) (MapType0Type RefType))) (= (type r_1@@52) RefType)) (= (type r2@0) RefType)) (= (type Mask@3) (MapType1Type RefType realType))) (forall ((arg0@@82 T@U) ) (! (= (type (invRecv25 arg0@@82)) RefType)
 :qid |funType:invRecv25|
 :pattern ( (invRecv25 arg0@@82))
))) (= (type Heap@6) (MapType0Type RefType))) (= (type Heap@5) (MapType0Type RefType))) (= (type newVersion@1) FrameTypeType)) (= (type Mask@2) (MapType1Type RefType realType))) (= (type newPMask@0) (MapType1Type RefType boolType))) (= (type Heap@4) (MapType0Type RefType))) (= (type Heap@2) (MapType0Type RefType))) (= (type Heap@1) (MapType0Type RefType))) (= (type Heap@3) (MapType0Type RefType))) (= (type freshVersion@0) FrameTypeType)) (= (type Mask@1) (MapType1Type RefType realType))) (= (type QPMask@0) (MapType1Type RefType realType))) (forall ((arg0@@83 T@U) ) (! (= (type (invRecv23 arg0@@83)) RefType)
 :qid |funType:invRecv23|
 :pattern ( (invRecv23 arg0@@83))
))) (= (type QPMask@1) (MapType1Type RefType realType))) (forall ((arg0@@84 T@U) ) (! (= (type (invRecv24 arg0@@84)) RefType)
 :qid |funType:invRecv24|
 :pattern ( (invRecv24 arg0@@84))
))) (= (type Heap@0) (MapType0Type RefType))) (= (type Heap@@33) (MapType0Type RefType))) (= (type newVersion@0) FrameTypeType)) (= (type Mask@0) (MapType1Type RefType realType))) (= (type r2@@9) RefType)) (= (type r3) RefType)))
(set-info :boogie-vc-id func3)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 38) (let ((anon19_correct true))
(let ((anon30_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 9) 6)) anon19_correct)))
(let ((anon30_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 7) (- 0 8)) (<= FullPerm (U_2_real (MapType1Select QPMask@2 (get Heap@7 r_1@@52) q_1)))) (=> (<= FullPerm (U_2_real (MapType1Select QPMask@2 (get Heap@7 r_1@@52) q_1))) (=> (= (ControlFlow 0 7) 6) anon19_correct))))))
(let ((anon29_Else_correct true))
(let ((anon28_Then_correct true))
(let ((anon27_Else_correct  (=> (and (= r2@0 (testerfield Heap@7 (get Heap@7 r_1@@52))) (state Heap@7 QPMask@2)) (and (and (and (=> (= (ControlFlow 0 10) 4) anon28_Then_correct) (=> (= (ControlFlow 0 10) 5) anon29_Else_correct)) (=> (= (ControlFlow 0 10) 7) anon30_Then_correct)) (=> (= (ControlFlow 0 10) 9) anon30_Else_correct)))))
(let ((anon27_Then_correct  (=> (= (ControlFlow 0 3) (- 0 2)) (> (U_2_real (MapType1Select QPMask@2 (get Heap@7 r_1@@52) q_1)) NoPerm))))
(let ((anon26_Then_correct true))
(let ((anon10_correct  (=> (state Heap@7 Mask@3) (and (=> (= (ControlFlow 0 11) (- 0 12)) (forall ((e_3 T@U) (e_3_1 T@U) ) (!  (=> (and (= (type e_3) RefType) (= (type e_3_1) RefType)) (=> (and (and (and (and (not (= e_3 e_3_1)) (U_2_bool (MapType2Select (refs Heap@7 r_1@@52) e_3))) (U_2_bool (MapType2Select (refs Heap@7 r_1@@52) e_3_1))) (< NoPerm wildcard@0)) (< NoPerm wildcard@0)) (not (= e_3 e_3_1))))
 :qid |stdinbpl.3214:15|
 :skolemid |312|
 :no-pattern (type e_3)
 :no-pattern (type e_3_1)
 :no-pattern (U_2_int e_3)
 :no-pattern (U_2_bool e_3)
 :no-pattern (U_2_int e_3_1)
 :no-pattern (U_2_bool e_3_1)
))) (=> (forall ((e_3@@0 T@U) (e_3_1@@0 T@U) ) (!  (=> (and (= (type e_3@@0) RefType) (= (type e_3_1@@0) RefType)) (=> (and (and (and (and (not (= e_3@@0 e_3_1@@0)) (U_2_bool (MapType2Select (refs Heap@7 r_1@@52) e_3@@0))) (U_2_bool (MapType2Select (refs Heap@7 r_1@@52) e_3_1@@0))) (< NoPerm wildcard@0)) (< NoPerm wildcard@0)) (not (= e_3@@0 e_3_1@@0))))
 :qid |stdinbpl.3214:15|
 :skolemid |312|
 :no-pattern (type e_3@@0)
 :no-pattern (type e_3_1@@0)
 :no-pattern (U_2_int e_3@@0)
 :no-pattern (U_2_bool e_3@@0)
 :no-pattern (U_2_int e_3_1@@0)
 :no-pattern (U_2_bool e_3_1@@0)
)) (=> (and (and (and (forall ((e_3@@1 T@U) ) (!  (=> (and (= (type e_3@@1) RefType) (U_2_bool (MapType2Select (refs Heap@7 r_1@@52) e_3@@1))) (and (qpRange25 e_3@@1) (= (invRecv25 e_3@@1) e_3@@1)))
 :qid |stdinbpl.3220:22|
 :skolemid |313|
 :pattern ( (MapType0Select Heap@7 e_3@@1 q_1))
 :pattern ( (MapType1Select QPMask@2 e_3@@1 q_1))
 :pattern ( (MapType2Select (|refs#frame| EmptyFrame r_1@@52) e_3@@1))
)) (forall ((o_3 T@U) ) (!  (=> (= (type o_3) RefType) (=> (and (U_2_bool (MapType2Select (refs Heap@7 r_1@@52) (invRecv25 o_3))) (qpRange25 o_3)) (= (invRecv25 o_3) o_3)))
 :qid |stdinbpl.3224:22|
 :skolemid |314|
 :pattern ( (invRecv25 o_3))
))) (and (forall ((e_3@@2 T@U) ) (!  (=> (= (type e_3@@2) RefType) (=> (and (U_2_bool (MapType2Select (refs Heap@7 r_1@@52) e_3@@2)) (> wildcard@0 NoPerm)) (not (= e_3@@2 null))))
 :qid |stdinbpl.3230:22|
 :skolemid |315|
 :pattern ( (MapType0Select Heap@7 e_3@@2 q_1))
 :pattern ( (MapType1Select QPMask@2 e_3@@2 q_1))
 :pattern ( (MapType2Select (|refs#frame| EmptyFrame r_1@@52) e_3@@2))
)) (forall ((o_3@@0 T@U) ) (!  (=> (= (type o_3@@0) RefType) (and (=> (and (U_2_bool (MapType2Select (refs Heap@7 r_1@@52) (invRecv25 o_3@@0))) (qpRange25 o_3@@0)) (and (= (invRecv25 o_3@@0) o_3@@0) (< (U_2_real (MapType1Select Mask@3 o_3@@0 q_1)) (U_2_real (MapType1Select QPMask@2 o_3@@0 q_1))))) (=> (not (and (U_2_bool (MapType2Select (refs Heap@7 r_1@@52) (invRecv25 o_3@@0))) (qpRange25 o_3@@0))) (= (U_2_real (MapType1Select QPMask@2 o_3@@0 q_1)) (U_2_real (MapType1Select Mask@3 o_3@@0 q_1))))))
 :qid |stdinbpl.3236:22|
 :skolemid |316|
 :pattern ( (MapType1Select QPMask@2 o_3@@0 q_1))
)))) (and (and (forall ((o_3@@1 T@U) (f_5 T@U) ) (! (let ((B@@11 (FieldTypeInv1 (type f_5))))
(let ((A@@12 (FieldTypeInv0 (type f_5))))
 (=> (and (and (= (type o_3@@1) RefType) (= (type f_5) (FieldType A@@12 B@@11))) (not (= f_5 q_1))) (= (U_2_real (MapType1Select Mask@3 o_3@@1 f_5)) (U_2_real (MapType1Select QPMask@2 o_3@@1 f_5))))))
 :qid |stdinbpl.3240:29|
 :skolemid |317|
 :pattern ( (MapType1Select Mask@3 o_3@@1 f_5))
 :pattern ( (MapType1Select QPMask@2 o_3@@1 f_5))
)) (state Heap@7 QPMask@2)) (and (state Heap@7 QPMask@2) (state Heap@7 QPMask@2)))) (and (and (=> (= (ControlFlow 0 11) 1) anon26_Then_correct) (=> (= (ControlFlow 0 11) 3) anon27_Then_correct)) (=> (= (ControlFlow 0 11) 10) anon27_Else_correct))))))))
(let ((anon25_Else_correct  (=> (HasDirectPerm Mask@3 null (R r_1@@52)) (=> (and (= Heap@7 Heap@5) (= (ControlFlow 0 14) 11)) anon10_correct))))
(let ((anon25_Then_correct  (=> (and (and (not (HasDirectPerm Mask@3 null (R r_1@@52))) (= Heap@6 (MapType0Store Heap@5 null (R r_1@@52) newVersion@1))) (and (= Heap@7 Heap@6) (= (ControlFlow 0 13) 11))) anon10_correct)))
(let ((anon8_correct  (=> (= Mask@3 (MapType1Store Mask@2 null (R r_1@@52) (real_2_U (- (U_2_real (MapType1Select Mask@2 null (R r_1@@52))) perm@2)))) (and (=> (= (ControlFlow 0 15) 13) anon25_Then_correct) (=> (= (ControlFlow 0 15) 14) anon25_Else_correct)))))
(let ((anon24_Else_correct  (=> (and (= perm@2 NoPerm) (= (ControlFlow 0 18) 15)) anon8_correct)))
(let ((anon24_Then_correct  (=> (not (= perm@2 NoPerm)) (and (=> (= (ControlFlow 0 16) (- 0 17)) (<= perm@2 (U_2_real (MapType1Select Mask@2 null (R r_1@@52))))) (=> (<= perm@2 (U_2_real (MapType1Select Mask@2 null (R r_1@@52)))) (=> (= (ControlFlow 0 16) 15) anon8_correct))))))
(let ((anon6_correct  (=> (and (and (and (forall ((o_6 T@U) (f_9 T@U) ) (! (let ((B@@12 (FieldTypeInv1 (type f_9))))
(let ((A@@13 (FieldTypeInv0 (type f_9))))
 (=> (and (and (= (type o_6) RefType) (= (type f_9) (FieldType A@@13 B@@12))) (U_2_bool (MapType1Select (MapType0Select Heap@4 null (|R#sm| r_1@@52)) o_6 f_9))) (U_2_bool (MapType1Select newPMask@0 o_6 f_9)))))
 :qid |stdinbpl.3180:27|
 :skolemid |310|
 :pattern ( (MapType1Select newPMask@0 o_6 f_9))
)) (forall ((e_2 T@U) ) (!  (=> (and (= (type e_2) RefType) (U_2_bool (MapType2Select (refs Heap@4 r_1@@52) e_2))) (U_2_bool (MapType1Select newPMask@0 e_2 q_1)))
 :qid |stdinbpl.3184:20|
 :skolemid |311|
 :no-pattern (type e_2)
 :no-pattern (U_2_int e_2)
 :no-pattern (U_2_bool e_2)
))) (and (= Heap@5 (MapType0Store Heap@4 null (|R#sm| r_1@@52) newPMask@0)) (state Heap@5 Mask@2))) (and (and (state Heap@5 Mask@2) (|R#trigger| Heap@5 (R r_1@@52))) (and (= (MapType0Select Heap@5 null (R r_1@@52)) (FrameFragment (int_2_U (|R#condqp3| Heap@5 r_1@@52)))) (= perm@2 (/ (to_real 1) (to_real 2)))))) (and (=> (= (ControlFlow 0 19) (- 0 20)) (>= perm@2 NoPerm)) (=> (>= perm@2 NoPerm) (and (=> (= (ControlFlow 0 19) 16) anon24_Then_correct) (=> (= (ControlFlow 0 19) 18) anon24_Else_correct)))))))
(let ((anon23_Else_correct  (=> (HasDirectPerm Mask@2 null (R r_1@@52)) (=> (and (= Heap@4 Heap@1) (= (ControlFlow 0 22) 19)) anon6_correct))))
(let ((anon23_Then_correct  (=> (not (HasDirectPerm Mask@2 null (R r_1@@52))) (=> (and (and (= Heap@2 (MapType0Store Heap@1 null (|R#sm| r_1@@52) ZeroPMask)) (= Heap@3 (MapType0Store Heap@2 null (R r_1@@52) freshVersion@0))) (and (= Heap@4 Heap@3) (= (ControlFlow 0 21) 19))) anon6_correct))))
(let ((anon4_correct  (=> (state Heap@1 Mask@1) (and (=> (= (ControlFlow 0 23) (- 0 29)) (forall ((e T@U) (e_4 T@U) ) (!  (=> (and (= (type e) RefType) (= (type e_4) RefType)) (=> (and (and (and (and (not (= e e_4)) (U_2_bool (MapType2Select (refs Heap@1 r_1@@52) e))) (U_2_bool (MapType2Select (refs Heap@1 r_1@@52) e_4))) (< NoPerm wildcard)) (< NoPerm wildcard)) (not (= e e_4))))
 :qid |stdinbpl.3071:15|
 :skolemid |295|
 :no-pattern (type e)
 :no-pattern (type e_4)
 :no-pattern (U_2_int e)
 :no-pattern (U_2_bool e)
 :no-pattern (U_2_int e_4)
 :no-pattern (U_2_bool e_4)
))) (=> (forall ((e@@0 T@U) (e_4@@0 T@U) ) (!  (=> (and (= (type e@@0) RefType) (= (type e_4@@0) RefType)) (=> (and (and (and (and (not (= e@@0 e_4@@0)) (U_2_bool (MapType2Select (refs Heap@1 r_1@@52) e@@0))) (U_2_bool (MapType2Select (refs Heap@1 r_1@@52) e_4@@0))) (< NoPerm wildcard)) (< NoPerm wildcard)) (not (= e@@0 e_4@@0))))
 :qid |stdinbpl.3071:15|
 :skolemid |295|
 :no-pattern (type e@@0)
 :no-pattern (type e_4@@0)
 :no-pattern (U_2_int e@@0)
 :no-pattern (U_2_bool e@@0)
 :no-pattern (U_2_int e_4@@0)
 :no-pattern (U_2_bool e_4@@0)
)) (=> (forall ((e@@1 T@U) ) (!  (=> (and (= (type e@@1) RefType) (U_2_bool (MapType2Select (refs Heap@1 r_1@@52) e@@1))) (and (qpRange23 e@@1) (= (invRecv23 e@@1) e@@1)))
 :qid |stdinbpl.3077:22|
 :skolemid |296|
 :pattern ( (MapType0Select Heap@1 e@@1 q_1))
 :pattern ( (MapType1Select QPMask@0 e@@1 q_1))
 :pattern ( (MapType2Select (|refs#frame| EmptyFrame r_1@@52) e@@1))
)) (=> (and (and (and (forall ((o_3@@2 T@U) ) (!  (=> (= (type o_3@@2) RefType) (=> (and (U_2_bool (MapType2Select (refs Heap@1 r_1@@52) (invRecv23 o_3@@2))) (qpRange23 o_3@@2)) (= (invRecv23 o_3@@2) o_3@@2)))
 :qid |stdinbpl.3081:22|
 :skolemid |297|
 :pattern ( (invRecv23 o_3@@2))
)) (forall ((e@@2 T@U) ) (!  (=> (= (type e@@2) RefType) (=> (and (U_2_bool (MapType2Select (refs Heap@1 r_1@@52) e@@2)) (> wildcard NoPerm)) (not (= e@@2 null))))
 :qid |stdinbpl.3087:22|
 :skolemid |298|
 :pattern ( (MapType0Select Heap@1 e@@2 q_1))
 :pattern ( (MapType1Select QPMask@0 e@@2 q_1))
 :pattern ( (MapType2Select (|refs#frame| EmptyFrame r_1@@52) e@@2))
))) (and (forall ((o_3@@3 T@U) ) (!  (=> (= (type o_3@@3) RefType) (and (=> (and (U_2_bool (MapType2Select (refs Heap@1 r_1@@52) (invRecv23 o_3@@3))) (qpRange23 o_3@@3)) (and (= (invRecv23 o_3@@3) o_3@@3) (< (U_2_real (MapType1Select Mask@1 o_3@@3 q_1)) (U_2_real (MapType1Select QPMask@0 o_3@@3 q_1))))) (=> (not (and (U_2_bool (MapType2Select (refs Heap@1 r_1@@52) (invRecv23 o_3@@3))) (qpRange23 o_3@@3))) (= (U_2_real (MapType1Select QPMask@0 o_3@@3 q_1)) (U_2_real (MapType1Select Mask@1 o_3@@3 q_1))))))
 :qid |stdinbpl.3093:22|
 :skolemid |299|
 :pattern ( (MapType1Select QPMask@0 o_3@@3 q_1))
)) (forall ((o_3@@4 T@U) (f_5@@0 T@U) ) (! (let ((B@@13 (FieldTypeInv1 (type f_5@@0))))
(let ((A@@14 (FieldTypeInv0 (type f_5@@0))))
 (=> (and (and (= (type o_3@@4) RefType) (= (type f_5@@0) (FieldType A@@14 B@@13))) (not (= f_5@@0 q_1))) (= (U_2_real (MapType1Select Mask@1 o_3@@4 f_5@@0)) (U_2_real (MapType1Select QPMask@0 o_3@@4 f_5@@0))))))
 :qid |stdinbpl.3097:29|
 :skolemid |300|
 :pattern ( (MapType1Select Mask@1 o_3@@4 f_5@@0))
 :pattern ( (MapType1Select QPMask@0 o_3@@4 f_5@@0))
)))) (and (and (state Heap@1 QPMask@0) (state Heap@1 QPMask@0)) (and (state Heap@1 QPMask@0) (> wildcard@0 NoPerm)))) (and (=> (= (ControlFlow 0 23) (- 0 28)) (forall ((e_1 T@U) ) (!  (=> (and (= (type e_1) RefType) (U_2_bool (MapType2Select (refs Heap@1 r_1@@52) e_1))) (> (U_2_real (MapType1Select QPMask@0 e_1 q_1)) NoPerm))
 :qid |stdinbpl.3113:15|
 :skolemid |301|
 :no-pattern (type e_1)
 :no-pattern (U_2_int e_1)
 :no-pattern (U_2_bool e_1)
))) (=> (forall ((e_1@@0 T@U) ) (!  (=> (and (= (type e_1@@0) RefType) (U_2_bool (MapType2Select (refs Heap@1 r_1@@52) e_1@@0))) (> (U_2_real (MapType1Select QPMask@0 e_1@@0 q_1)) NoPerm))
 :qid |stdinbpl.3113:15|
 :skolemid |301|
 :no-pattern (type e_1@@0)
 :no-pattern (U_2_int e_1@@0)
 :no-pattern (U_2_bool e_1@@0)
)) (=> (forall ((e_1@@1 T@U) ) (!  (=> (and (= (type e_1@@1) RefType) (U_2_bool (MapType2Select (refs Heap@1 r_1@@52) e_1@@1))) (< wildcard@0 (U_2_real (MapType1Select QPMask@0 e_1@@1 q_1))))
 :qid |stdinbpl.3117:20|
 :skolemid |302|
 :no-pattern (type e_1@@1)
 :no-pattern (U_2_int e_1@@1)
 :no-pattern (U_2_bool e_1@@1)
)) (and (=> (= (ControlFlow 0 23) (- 0 27)) (forall ((e_1@@2 T@U) ) (!  (=> (= (type e_1@@2) RefType) (=> (and (U_2_bool (MapType2Select (refs Heap@1 r_1@@52) e_1@@2)) (dummyFunction (MapType0Select Heap@1 e_1@@2 q_1))) (>= wildcard@0 NoPerm)))
 :qid |stdinbpl.3124:17|
 :skolemid |303|
 :pattern ( (MapType0Select Heap@1 e_1@@2 q_1))
 :pattern ( (MapType1Select QPMask@1 e_1@@2 q_1))
 :pattern ( (MapType2Select (|refs#frame| EmptyFrame r_1@@52) e_1@@2))
))) (=> (forall ((e_1@@3 T@U) ) (!  (=> (= (type e_1@@3) RefType) (=> (and (U_2_bool (MapType2Select (refs Heap@1 r_1@@52) e_1@@3)) (dummyFunction (MapType0Select Heap@1 e_1@@3 q_1))) (>= wildcard@0 NoPerm)))
 :qid |stdinbpl.3124:17|
 :skolemid |303|
 :pattern ( (MapType0Select Heap@1 e_1@@3 q_1))
 :pattern ( (MapType1Select QPMask@1 e_1@@3 q_1))
 :pattern ( (MapType2Select (|refs#frame| EmptyFrame r_1@@52) e_1@@3))
)) (and (=> (= (ControlFlow 0 23) (- 0 26)) (forall ((e_1@@4 T@U) (e_1_1 T@U) ) (!  (=> (and (= (type e_1@@4) RefType) (= (type e_1_1) RefType)) (=> (and (and (and (and (not (= e_1@@4 e_1_1)) (U_2_bool (MapType2Select (refs Heap@1 r_1@@52) e_1@@4))) (U_2_bool (MapType2Select (refs Heap@1 r_1@@52) e_1_1))) (< NoPerm wildcard@0)) (< NoPerm wildcard@0)) (not (= e_1@@4 e_1_1))))
 :qid |stdinbpl.3131:17|
 :skolemid |304|
 :pattern ( (neverTriggered24 e_1@@4) (neverTriggered24 e_1_1))
))) (=> (forall ((e_1@@5 T@U) (e_1_1@@0 T@U) ) (!  (=> (and (= (type e_1@@5) RefType) (= (type e_1_1@@0) RefType)) (=> (and (and (and (and (not (= e_1@@5 e_1_1@@0)) (U_2_bool (MapType2Select (refs Heap@1 r_1@@52) e_1@@5))) (U_2_bool (MapType2Select (refs Heap@1 r_1@@52) e_1_1@@0))) (< NoPerm wildcard@0)) (< NoPerm wildcard@0)) (not (= e_1@@5 e_1_1@@0))))
 :qid |stdinbpl.3131:17|
 :skolemid |304|
 :pattern ( (neverTriggered24 e_1@@5) (neverTriggered24 e_1_1@@0))
)) (and (=> (= (ControlFlow 0 23) (- 0 25)) (forall ((e_1@@6 T@U) ) (!  (=> (and (= (type e_1@@6) RefType) (U_2_bool (MapType2Select (refs Heap@1 r_1@@52) e_1@@6))) (> (U_2_real (MapType1Select QPMask@0 e_1@@6 q_1)) NoPerm))
 :qid |stdinbpl.3138:17|
 :skolemid |305|
 :pattern ( (MapType0Select Heap@1 e_1@@6 q_1))
 :pattern ( (MapType1Select QPMask@1 e_1@@6 q_1))
 :pattern ( (MapType2Select (|refs#frame| EmptyFrame r_1@@52) e_1@@6))
))) (=> (forall ((e_1@@7 T@U) ) (!  (=> (and (= (type e_1@@7) RefType) (U_2_bool (MapType2Select (refs Heap@1 r_1@@52) e_1@@7))) (> (U_2_real (MapType1Select QPMask@0 e_1@@7 q_1)) NoPerm))
 :qid |stdinbpl.3138:17|
 :skolemid |305|
 :pattern ( (MapType0Select Heap@1 e_1@@7 q_1))
 :pattern ( (MapType1Select QPMask@1 e_1@@7 q_1))
 :pattern ( (MapType2Select (|refs#frame| EmptyFrame r_1@@52) e_1@@7))
)) (=> (forall ((e_1@@8 T@U) ) (!  (=> (= (type e_1@@8) RefType) (=> (and (U_2_bool (MapType2Select (refs Heap@1 r_1@@52) e_1@@8)) (< NoPerm wildcard@0)) (and (qpRange24 e_1@@8) (= (invRecv24 e_1@@8) e_1@@8))))
 :qid |stdinbpl.3144:22|
 :skolemid |306|
 :pattern ( (MapType0Select Heap@1 e_1@@8 q_1))
 :pattern ( (MapType1Select QPMask@1 e_1@@8 q_1))
 :pattern ( (MapType2Select (|refs#frame| EmptyFrame r_1@@52) e_1@@8))
)) (=> (and (and (forall ((o_3@@5 T@U) ) (!  (=> (= (type o_3@@5) RefType) (=> (and (U_2_bool (MapType2Select (refs Heap@1 r_1@@52) (invRecv24 o_3@@5))) (and (< NoPerm wildcard@0) (qpRange24 o_3@@5))) (= (invRecv24 o_3@@5) o_3@@5)))
 :qid |stdinbpl.3148:22|
 :skolemid |307|
 :pattern ( (invRecv24 o_3@@5))
)) (forall ((o_3@@6 T@U) ) (!  (=> (= (type o_3@@6) RefType) (and (=> (and (U_2_bool (MapType2Select (refs Heap@1 r_1@@52) (invRecv24 o_3@@6))) (and (< NoPerm wildcard@0) (qpRange24 o_3@@6))) (and (= (invRecv24 o_3@@6) o_3@@6) (= (U_2_real (MapType1Select QPMask@1 o_3@@6 q_1)) (- (U_2_real (MapType1Select QPMask@0 o_3@@6 q_1)) wildcard@0)))) (=> (not (and (U_2_bool (MapType2Select (refs Heap@1 r_1@@52) (invRecv24 o_3@@6))) (and (< NoPerm wildcard@0) (qpRange24 o_3@@6)))) (= (U_2_real (MapType1Select QPMask@1 o_3@@6 q_1)) (U_2_real (MapType1Select QPMask@0 o_3@@6 q_1))))))
 :qid |stdinbpl.3154:22|
 :skolemid |308|
 :pattern ( (MapType1Select QPMask@1 o_3@@6 q_1))
))) (and (forall ((o_3@@7 T@U) (f_5@@1 T@U) ) (! (let ((B@@14 (FieldTypeInv1 (type f_5@@1))))
(let ((A@@15 (FieldTypeInv0 (type f_5@@1))))
 (=> (and (and (= (type o_3@@7) RefType) (= (type f_5@@1) (FieldType A@@15 B@@14))) (not (= f_5@@1 q_1))) (= (U_2_real (MapType1Select QPMask@0 o_3@@7 f_5@@1)) (U_2_real (MapType1Select QPMask@1 o_3@@7 f_5@@1))))))
 :qid |stdinbpl.3160:29|
 :skolemid |309|
 :pattern ( (MapType1Select QPMask@1 o_3@@7 f_5@@1))
)) (= perm@1 (/ (to_real 1) (to_real 2))))) (and (=> (= (ControlFlow 0 23) (- 0 24)) (>= perm@1 NoPerm)) (=> (>= perm@1 NoPerm) (=> (= Mask@2 (MapType1Store QPMask@1 null (R r_1@@52) (real_2_U (+ (U_2_real (MapType1Select QPMask@1 null (R r_1@@52))) perm@1)))) (=> (and (and (state Heap@1 Mask@2) (state Heap@1 Mask@2)) (and (|R#trigger| Heap@1 (R r_1@@52)) (= (MapType0Select Heap@1 null (R r_1@@52)) (FrameFragment (int_2_U (|R#condqp3| Heap@1 r_1@@52)))))) (and (=> (= (ControlFlow 0 23) 21) anon23_Then_correct) (=> (= (ControlFlow 0 23) 22) anon23_Else_correct))))))))))))))))))))))))
(let ((anon22_Else_correct  (=> (HasDirectPerm Mask@1 null (R r_1@@52)) (=> (and (= Heap@1 Heap@@33) (= (ControlFlow 0 31) 23)) anon4_correct))))
(let ((anon22_Then_correct  (=> (and (and (not (HasDirectPerm Mask@1 null (R r_1@@52))) (= Heap@0 (MapType0Store Heap@@33 null (R r_1@@52) newVersion@0))) (and (= Heap@1 Heap@0) (= (ControlFlow 0 30) 23))) anon4_correct)))
(let ((anon2_correct  (=> (= Mask@1 (MapType1Store Mask@0 null (R r_1@@52) (real_2_U (- (U_2_real (MapType1Select Mask@0 null (R r_1@@52))) perm@0)))) (and (=> (= (ControlFlow 0 32) 30) anon22_Then_correct) (=> (= (ControlFlow 0 32) 31) anon22_Else_correct)))))
(let ((anon21_Else_correct  (=> (and (= perm@0 NoPerm) (= (ControlFlow 0 35) 32)) anon2_correct)))
(let ((anon21_Then_correct  (=> (not (= perm@0 NoPerm)) (and (=> (= (ControlFlow 0 33) (- 0 34)) (<= perm@0 (U_2_real (MapType1Select Mask@0 null (R r_1@@52))))) (=> (<= perm@0 (U_2_real (MapType1Select Mask@0 null (R r_1@@52)))) (=> (= (ControlFlow 0 33) 32) anon2_correct))))))
(let ((anon0_correct  (=> (state Heap@@33 ZeroMask) (=> (and (= AssumeFunctionsAbove (- 0 1)) (U_2_bool (MapType0Select Heap@@33 r_1@@52 $allocated))) (=> (and (and (and (= Mask@0 (MapType1Store ZeroMask null (R r_1@@52) (real_2_U (+ (U_2_real (MapType1Select ZeroMask null (R r_1@@52))) FullPerm)))) (state Heap@@33 Mask@0)) (and (state Heap@@33 Mask@0) (U_2_bool (MapType0Select Heap@@33 r2@@9 $allocated)))) (and (and (U_2_bool (MapType0Select Heap@@33 r3 $allocated)) (|R#trigger| Heap@@33 (R r_1@@52))) (and (= (MapType0Select Heap@@33 null (R r_1@@52)) (FrameFragment (int_2_U (|R#condqp3| Heap@@33 r_1@@52)))) (= perm@0 (/ (to_real 1) (to_real 2)))))) (and (=> (= (ControlFlow 0 36) (- 0 37)) (>= perm@0 NoPerm)) (=> (>= perm@0 NoPerm) (and (=> (= (ControlFlow 0 36) 33) anon21_Then_correct) (=> (= (ControlFlow 0 36) 35) anon21_Else_correct)))))))))
(let ((PreconditionGeneratedEntry_correct  (=> (and (and (> wildcard NoPerm) true) (= (ControlFlow 0 38) 36)) anon0_correct)))
PreconditionGeneratedEntry_correct))))))))))))))))))))))))))
))
(check-sat)
(get-info :reason-unknown)
(assert (not (= (ControlFlow 0 7) (- 8))))
(check-sat)
(pop 1)
; Invalid
(get-info :rlimit)
