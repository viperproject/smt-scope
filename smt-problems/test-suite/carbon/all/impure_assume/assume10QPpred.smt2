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
(declare-fun f_7 () T@U)
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
(declare-fun p_11 (T@U T@U T@U) T@U)
(declare-fun IsPredicateField (T@U) Bool)
(declare-fun PredicateType_pType () T@T)
(declare-fun FrameTypeType () T@T)
(declare-fun |p#trigger| (T@U T@U) Bool)
(declare-fun |p#everUsed| (T@U) Bool)
(declare-fun getPredWandId (T@U) Int)
(declare-fun __iar__assume_helper_3 (Bool Bool Bool Real Real Real Real) Real)
(declare-fun NoPerm () Real)
(declare-fun |Math#min| (Int Int) Int)
(declare-fun IdenticalOnKnownLocations (T@U T@U T@U) Bool)
(declare-fun null () T@U)
(declare-fun PredicateMaskField (T@U) T@U)
(declare-fun HasDirectPerm (T@U T@U T@U) Bool)
(declare-fun IsWandField (T@U) Bool)
(declare-fun WandMaskField (T@U) T@U)
(declare-fun |MultiSet#Select| (T@U T@U) Int)
(declare-fun |Set#Union| (T@U T@U) T@U)
(declare-fun MapType2TypeInv0 (T@T) T@T)
(declare-fun MapType2Type (T@T T@T) T@T)
(declare-fun MapType2TypeInv1 (T@T) T@T)
(declare-fun MapType2Select (T@U T@U) T@U)
(declare-fun MapType2Store (T@U T@U T@U) T@U)
(declare-fun |Set#Intersection| (T@U T@U) T@U)
(declare-fun |p#sm| (T@U T@U T@U) T@U)
(declare-fun |Set#Singleton| (T@U) T@U)
(declare-fun __iar__assume_helper_10 (Bool Bool Bool Bool Bool Bool Bool Bool Bool Bool Real Real Real Real Real Real Real Real Real Real Real) Real)
(declare-fun |Set#Card| (T@U) Int)
(declare-fun |Math#clip| (Int) Int)
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
(declare-fun __iar__assume_helper_4 (Bool Bool Bool Bool Real Real Real Real Real) Real)
(declare-fun __iar__assume_helper_5 (Bool Bool Bool Bool Bool Real Real Real Real Real Real) Real)
(declare-fun |Set#Difference| (T@U T@U) T@U)
(declare-fun __iar__assume_helper_8 (Bool Bool Bool Bool Bool Bool Bool Bool Real Real Real Real Real Real Real Real Real) Real)
(declare-fun |MultiSet#Equal| (T@U T@U) Bool)
(declare-fun |Set#UnionOne| (T@U T@U) T@U)
(declare-fun __iar__assume_helper_1 (Bool Real Real) Real)
(declare-fun |MultiSet#Empty| (T@T) T@U)
(declare-fun __iar__assume_helper_7 (Bool Bool Bool Bool Bool Bool Bool Real Real Real Real Real Real Real Real) Real)
(declare-fun FullPerm () Real)
(declare-fun |Set#Empty| (T@T) T@U)
(declare-fun __iar__assume_helper_6 (Bool Bool Bool Bool Bool Bool Real Real Real Real Real Real Real) Real)
(declare-fun |Set#Subset| (T@U T@U) Bool)
(declare-fun ZeroPMask () T@U)
(declare-fun __iar__assume_helper_9 (Bool Bool Bool Bool Bool Bool Bool Bool Bool Real Real Real Real Real Real Real Real Real Real) Real)
(declare-fun |MultiSet#Subset| (T@U T@U) Bool)
(declare-fun __iar__assume_helper_2 (Bool Bool Real Real Real) Real)
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
(assert  (and (and (and (and (and (forall ((arg0@@11 T@T) (arg1 T@T) ) (! (= (Ctor (FieldType arg0@@11 arg1)) 6)
 :qid |ctor:FieldType|
)) (forall ((arg0@@12 T@T) (arg1@@0 T@T) ) (! (= (FieldTypeInv0 (FieldType arg0@@12 arg1@@0)) arg0@@12)
 :qid |typeInv:FieldTypeInv0|
 :pattern ( (FieldType arg0@@12 arg1@@0))
))) (forall ((arg0@@13 T@T) (arg1@@1 T@T) ) (! (= (FieldTypeInv1 (FieldType arg0@@13 arg1@@1)) arg1@@1)
 :qid |typeInv:FieldTypeInv1|
 :pattern ( (FieldType arg0@@13 arg1@@1))
))) (= (Ctor NormalFieldType) 7)) (= (type $allocated) (FieldType NormalFieldType boolType))) (= (type f_7) (FieldType NormalFieldType intType))))
(assert (distinct $allocated f_7)
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
 :qid |stdinbpl.358:18|
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
(assert  (and (and (= (Ctor PredicateType_pType) 12) (= (Ctor FrameTypeType) 13)) (forall ((arg0@@28 T@U) (arg1@@12 T@U) (arg2@@3 T@U) ) (! (= (type (p_11 arg0@@28 arg1@@12 arg2@@3)) (FieldType PredicateType_pType FrameTypeType))
 :qid |funType:p_11|
 :pattern ( (p_11 arg0@@28 arg1@@12 arg2@@3))
))))
(assert (forall ((x_2 T@U) (y_2 T@U) (z_2 T@U) ) (!  (=> (and (and (= (type x_2) RefType) (= (type y_2) RefType)) (= (type z_2) RefType)) (IsPredicateField (p_11 x_2 y_2 z_2)))
 :qid |stdinbpl.675:15|
 :skolemid |93|
 :pattern ( (p_11 x_2 y_2 z_2))
)))
(assert (forall ((Heap@@0 T@U) (x_2@@0 T@U) (y_2@@0 T@U) (z_2@@0 T@U) ) (!  (=> (and (and (and (= (type Heap@@0) (MapType0Type RefType)) (= (type x_2@@0) RefType)) (= (type y_2@@0) RefType)) (= (type z_2@@0) RefType)) (|p#everUsed| (p_11 x_2@@0 y_2@@0 z_2@@0)))
 :qid |stdinbpl.694:15|
 :skolemid |97|
 :pattern ( (|p#trigger| Heap@@0 (p_11 x_2@@0 y_2@@0 z_2@@0)))
)))
(assert (forall ((x_2@@1 T@U) (y_2@@1 T@U) (z_2@@1 T@U) ) (!  (=> (and (and (= (type x_2@@1) RefType) (= (type y_2@@1) RefType)) (= (type z_2@@1) RefType)) (= (getPredWandId (p_11 x_2@@1 y_2@@1 z_2@@1)) 0))
 :qid |stdinbpl.679:15|
 :skolemid |94|
 :pattern ( (p_11 x_2@@1 y_2@@1 z_2@@1))
)))
(assert (forall ((c_3_1 Bool) (c_2_1 Bool) (c_1_1 Bool) (p_3_1 Real) (p_2_1 Real) (p_1_1 Real) (p_0_1 Real) ) (! (= (__iar__assume_helper_3 c_3_1 c_2_1 c_1_1 p_3_1 p_2_1 p_1_1 p_0_1) (+ (+ (+ p_0_1 (ite c_1_1 p_1_1 NoPerm)) (ite c_2_1 p_2_1 NoPerm)) (ite c_3_1 p_3_1 NoPerm)))
 :qid |stdinbpl.609:15|
 :skolemid |84|
 :pattern ( (__iar__assume_helper_3 c_3_1 c_2_1 c_1_1 p_3_1 p_2_1 p_1_1 p_0_1))
)))
(assert (forall ((a@@0 Int) (b@@0 Int) ) (!  (or (= (|Math#min| a@@0 b@@0) a@@0) (= (|Math#min| a@@0 b@@0) b@@0))
 :qid |stdinbpl.289:15|
 :skolemid |53|
 :pattern ( (|Math#min| a@@0 b@@0))
)))
(assert  (and (= (type null) RefType) (forall ((arg0@@29 T@U) ) (! (let ((A (FieldTypeInv0 (type arg0@@29))))
(= (type (PredicateMaskField arg0@@29)) (FieldType A (MapType1Type RefType boolType))))
 :qid |funType:PredicateMaskField|
 :pattern ( (PredicateMaskField arg0@@29))
))))
(assert (forall ((Heap@@1 T@U) (ExhaleHeap T@U) (Mask@@0 T@U) (pm_f T@U) ) (! (let ((C (FieldTypeInv0 (type pm_f))))
 (=> (and (and (and (and (and (= (type Heap@@1) (MapType0Type RefType)) (= (type ExhaleHeap) (MapType0Type RefType))) (= (type Mask@@0) (MapType1Type RefType realType))) (= (type pm_f) (FieldType C FrameTypeType))) (IdenticalOnKnownLocations Heap@@1 ExhaleHeap Mask@@0)) (and (HasDirectPerm Mask@@0 null pm_f) (IsPredicateField pm_f))) (= (MapType0Select Heap@@1 null (PredicateMaskField pm_f)) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))))
 :qid |stdinbpl.47:19|
 :skolemid |2|
 :pattern ( (IdenticalOnKnownLocations Heap@@1 ExhaleHeap Mask@@0) (IsPredicateField pm_f) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))
)))
(assert (forall ((arg0@@30 T@U) ) (! (let ((A@@0 (FieldTypeInv0 (type arg0@@30))))
(= (type (WandMaskField arg0@@30)) (FieldType A@@0 (MapType1Type RefType boolType))))
 :qid |funType:WandMaskField|
 :pattern ( (WandMaskField arg0@@30))
)))
(assert (forall ((Heap@@2 T@U) (ExhaleHeap@@0 T@U) (Mask@@1 T@U) (pm_f@@0 T@U) ) (! (let ((C@@0 (FieldTypeInv0 (type pm_f@@0))))
 (=> (and (and (and (and (and (= (type Heap@@2) (MapType0Type RefType)) (= (type ExhaleHeap@@0) (MapType0Type RefType))) (= (type Mask@@1) (MapType1Type RefType realType))) (= (type pm_f@@0) (FieldType C@@0 FrameTypeType))) (IdenticalOnKnownLocations Heap@@2 ExhaleHeap@@0 Mask@@1)) (and (HasDirectPerm Mask@@1 null pm_f@@0) (IsWandField pm_f@@0))) (= (MapType0Select Heap@@2 null (WandMaskField pm_f@@0)) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))))
 :qid |stdinbpl.60:19|
 :skolemid |5|
 :pattern ( (IdenticalOnKnownLocations Heap@@2 ExhaleHeap@@0 Mask@@1) (IsWandField pm_f@@0) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))
)))
(assert (forall ((a@@1 T@U) (b@@1 T@U) (y@@1 T@U) ) (! (let ((T@@3 (type y@@1)))
 (=> (and (and (= (type a@@1) (MultiSetType T@@3)) (= (type b@@1) (MultiSetType T@@3))) (<= (|MultiSet#Select| a@@1 y@@1) (|MultiSet#Select| b@@1 y@@1))) (= (|MultiSet#Select| (|MultiSet#Difference| a@@1 b@@1) y@@1) 0)))
 :qid |stdinbpl.356:18|
 :skolemid |73|
 :pattern ( (|MultiSet#Difference| a@@1 b@@1) (|MultiSet#Select| b@@1 y@@1) (|MultiSet#Select| a@@1 y@@1))
)))
(assert  (and (and (and (and (and (and (and (forall ((arg0@@31 T@T) (arg1@@13 T@T) ) (! (= (Ctor (MapType2Type arg0@@31 arg1@@13)) 14)
 :qid |ctor:MapType2Type|
)) (forall ((arg0@@32 T@T) (arg1@@14 T@T) ) (! (= (MapType2TypeInv0 (MapType2Type arg0@@32 arg1@@14)) arg0@@32)
 :qid |typeInv:MapType2TypeInv0|
 :pattern ( (MapType2Type arg0@@32 arg1@@14))
))) (forall ((arg0@@33 T@T) (arg1@@15 T@T) ) (! (= (MapType2TypeInv1 (MapType2Type arg0@@33 arg1@@15)) arg1@@15)
 :qid |typeInv:MapType2TypeInv1|
 :pattern ( (MapType2Type arg0@@33 arg1@@15))
))) (forall ((arg0@@34 T@U) (arg1@@16 T@U) ) (! (let ((aVar1@@2 (MapType2TypeInv1 (type arg0@@34))))
(= (type (MapType2Select arg0@@34 arg1@@16)) aVar1@@2))
 :qid |funType:MapType2Select|
 :pattern ( (MapType2Select arg0@@34 arg1@@16))
))) (forall ((arg0@@35 T@U) (arg1@@17 T@U) (arg2@@4 T@U) ) (! (let ((aVar1@@3 (type arg2@@4)))
(let ((aVar0@@1 (type arg1@@17)))
(= (type (MapType2Store arg0@@35 arg1@@17 arg2@@4)) (MapType2Type aVar0@@1 aVar1@@3))))
 :qid |funType:MapType2Store|
 :pattern ( (MapType2Store arg0@@35 arg1@@17 arg2@@4))
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
)))) (forall ((arg0@@36 T@U) (arg1@@18 T@U) ) (! (let ((T@@4 (MapType2TypeInv0 (type arg0@@36))))
(= (type (|Set#Union| arg0@@36 arg1@@18)) (MapType2Type T@@4 boolType)))
 :qid |funType:Set#Union|
 :pattern ( (|Set#Union| arg0@@36 arg1@@18))
))))
(assert (forall ((a@@2 T@U) (b@@2 T@U) ) (! (let ((T@@5 (MapType2TypeInv0 (type a@@2))))
 (=> (and (= (type a@@2) (MapType2Type T@@5 boolType)) (= (type b@@2) (MapType2Type T@@5 boolType))) (= (|Set#Union| (|Set#Union| a@@2 b@@2) b@@2) (|Set#Union| a@@2 b@@2))))
 :qid |stdinbpl.241:18|
 :skolemid |38|
 :pattern ( (|Set#Union| (|Set#Union| a@@2 b@@2) b@@2))
)))
(assert (forall ((arg0@@37 T@U) (arg1@@19 T@U) ) (! (let ((T@@6 (MapType2TypeInv0 (type arg0@@37))))
(= (type (|Set#Intersection| arg0@@37 arg1@@19)) (MapType2Type T@@6 boolType)))
 :qid |funType:Set#Intersection|
 :pattern ( (|Set#Intersection| arg0@@37 arg1@@19))
)))
(assert (forall ((a@@3 T@U) (b@@3 T@U) ) (! (let ((T@@7 (MapType2TypeInv0 (type a@@3))))
 (=> (and (= (type a@@3) (MapType2Type T@@7 boolType)) (= (type b@@3) (MapType2Type T@@7 boolType))) (= (|Set#Intersection| (|Set#Intersection| a@@3 b@@3) b@@3) (|Set#Intersection| a@@3 b@@3))))
 :qid |stdinbpl.245:18|
 :skolemid |40|
 :pattern ( (|Set#Intersection| (|Set#Intersection| a@@3 b@@3) b@@3))
)))
(assert (forall ((a@@4 T@U) (b@@4 T@U) ) (! (let ((T@@8 (MultiSetTypeInv0 (type a@@4))))
 (=> (and (= (type a@@4) (MultiSetType T@@8)) (= (type b@@4) (MultiSetType T@@8))) (= (|MultiSet#Intersection| (|MultiSet#Intersection| a@@4 b@@4) b@@4) (|MultiSet#Intersection| a@@4 b@@4))))
 :qid |stdinbpl.347:18|
 :skolemid |70|
 :pattern ( (|MultiSet#Intersection| (|MultiSet#Intersection| a@@4 b@@4) b@@4))
)))
(assert (forall ((arg0@@38 T@U) (arg1@@20 T@U) (arg2@@5 T@U) ) (! (= (type (|p#sm| arg0@@38 arg1@@20 arg2@@5)) (FieldType PredicateType_pType (MapType1Type RefType boolType)))
 :qid |funType:p#sm|
 :pattern ( (|p#sm| arg0@@38 arg1@@20 arg2@@5))
)))
(assert (forall ((x_2@@2 T@U) (y_2@@2 T@U) (z_2@@2 T@U) ) (!  (=> (and (and (= (type x_2@@2) RefType) (= (type y_2@@2) RefType)) (= (type z_2@@2) RefType)) (= (PredicateMaskField (p_11 x_2@@2 y_2@@2 z_2@@2)) (|p#sm| x_2@@2 y_2@@2 z_2@@2)))
 :qid |stdinbpl.671:15|
 :skolemid |92|
 :pattern ( (PredicateMaskField (p_11 x_2@@2 y_2@@2 z_2@@2)))
)))
(assert (forall ((arg0@@39 T@U) ) (! (let ((T@@9 (type arg0@@39)))
(= (type (|Set#Singleton| arg0@@39)) (MapType2Type T@@9 boolType)))
 :qid |funType:Set#Singleton|
 :pattern ( (|Set#Singleton| arg0@@39))
)))
(assert (forall ((r T@U) (o T@U) ) (! (let ((T@@10 (type r)))
 (=> (= (type o) T@@10) (= (U_2_bool (MapType2Select (|Set#Singleton| r) o)) (= r o))))
 :qid |stdinbpl.210:18|
 :skolemid |27|
 :pattern ( (MapType2Select (|Set#Singleton| r) o))
)))
(assert (forall ((c_10_1 Bool) (c_9_1 Bool) (c_8_1 Bool) (c_7_1 Bool) (c_6_1 Bool) (c_5_1 Bool) (c_4_1 Bool) (c_3_1@@0 Bool) (c_2_1@@0 Bool) (c_1_1@@0 Bool) (p_10_1 Real) (p_9_1 Real) (p_8_1 Real) (p_7_1 Real) (p_6_1 Real) (p_5_1 Real) (p_4_1 Real) (p_3_1@@0 Real) (p_2_1@@0 Real) (p_1_1@@0 Real) (p_0_1@@0 Real) ) (! (= (__iar__assume_helper_10 c_10_1 c_9_1 c_8_1 c_7_1 c_6_1 c_5_1 c_4_1 c_3_1@@0 c_2_1@@0 c_1_1@@0 p_10_1 p_9_1 p_8_1 p_7_1 p_6_1 p_5_1 p_4_1 p_3_1@@0 p_2_1@@0 p_1_1@@0 p_0_1@@0) (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ p_0_1@@0 (ite c_1_1@@0 p_1_1@@0 NoPerm)) (ite c_2_1@@0 p_2_1@@0 NoPerm)) (ite c_3_1@@0 p_3_1@@0 NoPerm)) (ite c_4_1 p_4_1 NoPerm)) (ite c_5_1 p_5_1 NoPerm)) (ite c_6_1 p_6_1 NoPerm)) (ite c_7_1 p_7_1 NoPerm)) (ite c_8_1 p_8_1 NoPerm)) (ite c_9_1 p_9_1 NoPerm)) (ite c_10_1 p_10_1 NoPerm)))
 :qid |stdinbpl.651:15|
 :skolemid |91|
 :pattern ( (__iar__assume_helper_10 c_10_1 c_9_1 c_8_1 c_7_1 c_6_1 c_5_1 c_4_1 c_3_1@@0 c_2_1@@0 c_1_1@@0 p_10_1 p_9_1 p_8_1 p_7_1 p_6_1 p_5_1 p_4_1 p_3_1@@0 p_2_1@@0 p_1_1@@0 p_0_1@@0))
)))
(assert (forall ((a@@5 T@U) (b@@5 T@U) ) (! (let ((T@@11 (MapType2TypeInv0 (type a@@5))))
 (=> (and (= (type a@@5) (MapType2Type T@@11 boolType)) (= (type b@@5) (MapType2Type T@@11 boolType))) (= (+ (|Set#Card| (|Set#Union| a@@5 b@@5)) (|Set#Card| (|Set#Intersection| a@@5 b@@5))) (+ (|Set#Card| a@@5) (|Set#Card| b@@5)))))
 :qid |stdinbpl.249:18|
 :skolemid |42|
 :pattern ( (|Set#Card| (|Set#Union| a@@5 b@@5)))
 :pattern ( (|Set#Card| (|Set#Intersection| a@@5 b@@5)))
)))
(assert (forall ((Heap@@3 T@U) (ExhaleHeap@@1 T@U) (Mask@@2 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@3) (MapType0Type RefType)) (= (type ExhaleHeap@@1) (MapType0Type RefType))) (= (type Mask@@2) (MapType1Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@3 ExhaleHeap@@1 Mask@@2)) (U_2_bool (MapType0Select Heap@@3 o_1 $allocated))) (U_2_bool (MapType0Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.73:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@3 ExhaleHeap@@1 Mask@@2) (MapType0Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert (forall ((x_2@@3 T@U) (y_2@@3 T@U) (z_2@@3 T@U) (x2 T@U) (y2 T@U) (z2 T@U) ) (!  (=> (and (and (and (and (and (and (= (type x_2@@3) RefType) (= (type y_2@@3) RefType)) (= (type z_2@@3) RefType)) (= (type x2) RefType)) (= (type y2) RefType)) (= (type z2) RefType)) (= (p_11 x_2@@3 y_2@@3 z_2@@3) (p_11 x2 y2 z2))) (and (= x_2@@3 x2) (and (= y_2@@3 y2) (= z_2@@3 z2))))
 :qid |stdinbpl.685:15|
 :skolemid |95|
 :pattern ( (p_11 x_2@@3 y_2@@3 z_2@@3) (p_11 x2 y2 z2))
)))
(assert (forall ((x_2@@4 T@U) (y_2@@4 T@U) (z_2@@4 T@U) (x2@@0 T@U) (y2@@0 T@U) (z2@@0 T@U) ) (!  (=> (and (and (and (and (and (and (= (type x_2@@4) RefType) (= (type y_2@@4) RefType)) (= (type z_2@@4) RefType)) (= (type x2@@0) RefType)) (= (type y2@@0) RefType)) (= (type z2@@0) RefType)) (= (|p#sm| x_2@@4 y_2@@4 z_2@@4) (|p#sm| x2@@0 y2@@0 z2@@0))) (and (= x_2@@4 x2@@0) (and (= y_2@@4 y2@@0) (= z_2@@4 z2@@0))))
 :qid |stdinbpl.689:15|
 :skolemid |96|
 :pattern ( (|p#sm| x_2@@4 y_2@@4 z_2@@4) (|p#sm| x2@@0 y2@@0 z2@@0))
)))
(assert (forall ((a@@6 Int) ) (!  (=> (<= 0 a@@6) (= (|Math#clip| a@@6) a@@6))
 :qid |stdinbpl.292:15|
 :skolemid |54|
 :pattern ( (|Math#clip| a@@6))
)))
(assert (forall ((a@@7 T@U) (b@@6 T@U) (o@@0 T@U) ) (! (let ((T@@12 (type o@@0)))
 (=> (and (= (type a@@7) (MultiSetType T@@12)) (= (type b@@6) (MultiSetType T@@12))) (= (|MultiSet#Select| (|MultiSet#Intersection| a@@7 b@@6) o@@0) (|Math#min| (|MultiSet#Select| a@@7 o@@0) (|MultiSet#Select| b@@6 o@@0)))))
 :qid |stdinbpl.343:18|
 :skolemid |69|
 :pattern ( (|MultiSet#Select| (|MultiSet#Intersection| a@@7 b@@6) o@@0))
)))
(assert (forall ((Heap@@4 T@U) (ExhaleHeap@@2 T@U) (Mask@@3 T@U) (o_1@@0 T@U) (f_2 T@U) ) (! (let ((B@@1 (FieldTypeInv1 (type f_2))))
(let ((A@@1 (FieldTypeInv0 (type f_2))))
 (=> (and (and (and (and (and (and (= (type Heap@@4) (MapType0Type RefType)) (= (type ExhaleHeap@@2) (MapType0Type RefType))) (= (type Mask@@3) (MapType1Type RefType realType))) (= (type o_1@@0) RefType)) (= (type f_2) (FieldType A@@1 B@@1))) (IdenticalOnKnownLocations Heap@@4 ExhaleHeap@@2 Mask@@3)) (HasDirectPerm Mask@@3 o_1@@0 f_2)) (= (MapType0Select Heap@@4 o_1@@0 f_2) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2)))))
 :qid |stdinbpl.42:22|
 :skolemid |1|
 :pattern ( (IdenticalOnKnownLocations Heap@@4 ExhaleHeap@@2 Mask@@3) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2))
)))
(assert  (and (= (type dummyHeap) (MapType0Type RefType)) (= (type ZeroMask) (MapType1Type RefType realType))))
(assert (state dummyHeap ZeroMask))
(assert (forall ((arg0@@40 T@U) (arg1@@21 T@U) ) (! (let ((T@@13 (type arg1@@21)))
(= (type (|MultiSet#UnionOne| arg0@@40 arg1@@21)) (MultiSetType T@@13)))
 :qid |funType:MultiSet#UnionOne|
 :pattern ( (|MultiSet#UnionOne| arg0@@40 arg1@@21))
)))
(assert (forall ((a@@8 T@U) (x@@8 T@U) ) (! (let ((T@@14 (type x@@8)))
 (=> (= (type a@@8) (MultiSetType T@@14)) (= (|MultiSet#Card| (|MultiSet#UnionOne| a@@8 x@@8)) (+ (|MultiSet#Card| a@@8) 1))))
 :qid |stdinbpl.329:18|
 :skolemid |65|
 :pattern ( (|MultiSet#Card| (|MultiSet#UnionOne| a@@8 x@@8)))
 :pattern ( (|MultiSet#UnionOne| a@@8 x@@8) (|MultiSet#Card| a@@8))
)))
(assert (forall ((a@@9 T@U) (b@@7 T@U) ) (! (let ((T@@15 (MultiSetTypeInv0 (type a@@9))))
 (=> (and (= (type a@@9) (MultiSetType T@@15)) (= (type b@@7) (MultiSetType T@@15))) (= (|MultiSet#Disjoint| a@@9 b@@7) (forall ((o@@1 T@U) ) (!  (=> (= (type o@@1) T@@15) (or (= (|MultiSet#Select| a@@9 o@@1) 0) (= (|MultiSet#Select| b@@7 o@@1) 0)))
 :qid |stdinbpl.379:39|
 :skolemid |80|
 :pattern ( (|MultiSet#Select| a@@9 o@@1))
 :pattern ( (|MultiSet#Select| b@@7 o@@1))
)))))
 :qid |stdinbpl.378:18|
 :skolemid |81|
 :pattern ( (|MultiSet#Disjoint| a@@9 b@@7))
)))
(assert (forall ((p T@U) (v_1 T@U) (w T@U) ) (! (let ((A@@2 (FieldTypeInv0 (type p))))
 (=> (and (and (= (type p) (FieldType A@@2 FrameTypeType)) (= (type v_1) FrameTypeType)) (= (type w) FrameTypeType)) (not (InsidePredicate p v_1 p w))))
 :qid |stdinbpl.187:19|
 :skolemid |21|
 :pattern ( (InsidePredicate p v_1 p w))
)))
(assert (forall ((arg0@@41 T@U) ) (! (let ((T@@16 (type arg0@@41)))
(= (type (|MultiSet#Singleton| arg0@@41)) (MultiSetType T@@16)))
 :qid |funType:MultiSet#Singleton|
 :pattern ( (|MultiSet#Singleton| arg0@@41))
)))
(assert (forall ((r@@0 T@U) ) (!  (and (= (|MultiSet#Card| (|MultiSet#Singleton| r@@0)) 1) (= (|MultiSet#Select| (|MultiSet#Singleton| r@@0) r@@0) 1))
 :qid |stdinbpl.321:18|
 :skolemid |62|
 :pattern ( (|MultiSet#Singleton| r@@0))
)))
(assert  (not (IsPredicateField f_7)))
(assert  (not (IsWandField f_7)))
(assert (forall ((Heap@@5 T@U) (ExhaleHeap@@3 T@U) (Mask@@4 T@U) ) (!  (=> (and (and (and (= (type Heap@@5) (MapType0Type RefType)) (= (type ExhaleHeap@@3) (MapType0Type RefType))) (= (type Mask@@4) (MapType1Type RefType realType))) (IdenticalOnKnownLocations Heap@@5 ExhaleHeap@@3 Mask@@4)) (succHeap Heap@@5 ExhaleHeap@@3))
 :qid |stdinbpl.83:15|
 :skolemid |10|
 :pattern ( (IdenticalOnKnownLocations Heap@@5 ExhaleHeap@@3 Mask@@4))
)))
(assert (forall ((a@@10 T@U) (b@@8 T@U) ) (! (let ((T@@17 (MapType2TypeInv0 (type a@@10))))
 (=> (and (= (type a@@10) (MapType2Type T@@17 boolType)) (= (type b@@8) (MapType2Type T@@17 boolType))) (= (|Set#Equal| a@@10 b@@8) (forall ((o@@2 T@U) ) (!  (=> (= (type o@@2) T@@17) (= (U_2_bool (MapType2Select a@@10 o@@2)) (U_2_bool (MapType2Select b@@8 o@@2))))
 :qid |stdinbpl.274:31|
 :skolemid |48|
 :pattern ( (MapType2Select a@@10 o@@2))
 :pattern ( (MapType2Select b@@8 o@@2))
)))))
 :qid |stdinbpl.273:17|
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
 :qid |stdinbpl.339:18|
 :skolemid |68|
 :pattern ( (|MultiSet#Card| (|MultiSet#Union| a@@11 b@@9)))
 :pattern ( (|MultiSet#Card| a@@11) (|MultiSet#Union| a@@11 b@@9))
 :pattern ( (|MultiSet#Card| b@@9) (|MultiSet#Union| a@@11 b@@9))
)))
(assert  (and (forall ((arg0@@42 Real) (arg1@@22 T@U) ) (! (= (type (ConditionalFrame arg0@@42 arg1@@22)) FrameTypeType)
 :qid |funType:ConditionalFrame|
 :pattern ( (ConditionalFrame arg0@@42 arg1@@22))
)) (= (type EmptyFrame) FrameTypeType)))
(assert (forall ((p@@0 Real) (f_6 T@U) ) (!  (=> (= (type f_6) FrameTypeType) (= (ConditionalFrame p@@0 f_6) (ite (> p@@0 0.0) f_6 EmptyFrame)))
 :qid |stdinbpl.175:15|
 :skolemid |19|
 :pattern ( (ConditionalFrame p@@0 f_6))
)))
(assert (forall ((c_4_1@@0 Bool) (c_3_1@@1 Bool) (c_2_1@@1 Bool) (c_1_1@@1 Bool) (p_4_1@@0 Real) (p_3_1@@1 Real) (p_2_1@@1 Real) (p_1_1@@1 Real) (p_0_1@@1 Real) ) (! (= (__iar__assume_helper_4 c_4_1@@0 c_3_1@@1 c_2_1@@1 c_1_1@@1 p_4_1@@0 p_3_1@@1 p_2_1@@1 p_1_1@@1 p_0_1@@1) (+ (+ (+ (+ p_0_1@@1 (ite c_1_1@@1 p_1_1@@1 NoPerm)) (ite c_2_1@@1 p_2_1@@1 NoPerm)) (ite c_3_1@@1 p_3_1@@1 NoPerm)) (ite c_4_1@@0 p_4_1@@0 NoPerm)))
 :qid |stdinbpl.615:15|
 :skolemid |85|
 :pattern ( (__iar__assume_helper_4 c_4_1@@0 c_3_1@@1 c_2_1@@1 c_1_1@@1 p_4_1@@0 p_3_1@@1 p_2_1@@1 p_1_1@@1 p_0_1@@1))
)))
(assert (forall ((Mask@@5 T@U) (o_2@@0 T@U) (f_4@@0 T@U) ) (! (let ((B@@3 (FieldTypeInv1 (type f_4@@0))))
(let ((A@@4 (FieldTypeInv0 (type f_4@@0))))
 (=> (and (and (= (type Mask@@5) (MapType1Type RefType realType)) (= (type o_2@@0) RefType)) (= (type f_4@@0) (FieldType A@@4 B@@3))) (= (HasDirectPerm Mask@@5 o_2@@0 f_4@@0) (> (U_2_real (MapType1Select Mask@@5 o_2@@0 f_4@@0)) NoPerm)))))
 :qid |stdinbpl.133:22|
 :skolemid |17|
 :pattern ( (HasDirectPerm Mask@@5 o_2@@0 f_4@@0))
)))
(assert (forall ((c_5_1@@0 Bool) (c_4_1@@1 Bool) (c_3_1@@2 Bool) (c_2_1@@2 Bool) (c_1_1@@2 Bool) (p_5_1@@0 Real) (p_4_1@@1 Real) (p_3_1@@2 Real) (p_2_1@@2 Real) (p_1_1@@2 Real) (p_0_1@@2 Real) ) (! (= (__iar__assume_helper_5 c_5_1@@0 c_4_1@@1 c_3_1@@2 c_2_1@@2 c_1_1@@2 p_5_1@@0 p_4_1@@1 p_3_1@@2 p_2_1@@2 p_1_1@@2 p_0_1@@2) (+ (+ (+ (+ (+ p_0_1@@2 (ite c_1_1@@2 p_1_1@@2 NoPerm)) (ite c_2_1@@2 p_2_1@@2 NoPerm)) (ite c_3_1@@2 p_3_1@@2 NoPerm)) (ite c_4_1@@1 p_4_1@@1 NoPerm)) (ite c_5_1@@0 p_5_1@@0 NoPerm)))
 :qid |stdinbpl.621:15|
 :skolemid |86|
 :pattern ( (__iar__assume_helper_5 c_5_1@@0 c_4_1@@1 c_3_1@@2 c_2_1@@2 c_1_1@@2 p_5_1@@0 p_4_1@@1 p_3_1@@2 p_2_1@@2 p_1_1@@2 p_0_1@@2))
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
 :qid |stdinbpl.238:18|
 :skolemid |37|
 :pattern ( (MapType2Select (|Set#Intersection| a@@12 b@@10) o@@3))
 :pattern ( (|Set#Intersection| a@@12 b@@10) (MapType2Select a@@12 o@@3))
 :pattern ( (|Set#Intersection| a@@12 b@@10) (MapType2Select b@@10 o@@3))
)))
(assert (forall ((arg0@@43 T@U) (arg1@@23 T@U) ) (! (let ((T@@20 (MapType2TypeInv0 (type arg0@@43))))
(= (type (|Set#Difference| arg0@@43 arg1@@23)) (MapType2Type T@@20 boolType)))
 :qid |funType:Set#Difference|
 :pattern ( (|Set#Difference| arg0@@43 arg1@@23))
)))
(assert (forall ((a@@13 T@U) (b@@11 T@U) (o@@4 T@U) ) (! (let ((T@@21 (type o@@4)))
 (=> (and (= (type a@@13) (MapType2Type T@@21 boolType)) (= (type b@@11) (MapType2Type T@@21 boolType))) (= (U_2_bool (MapType2Select (|Set#Difference| a@@13 b@@11) o@@4))  (and (U_2_bool (MapType2Select a@@13 o@@4)) (not (U_2_bool (MapType2Select b@@11 o@@4)))))))
 :qid |stdinbpl.253:18|
 :skolemid |43|
 :pattern ( (MapType2Select (|Set#Difference| a@@13 b@@11) o@@4))
 :pattern ( (|Set#Difference| a@@13 b@@11) (MapType2Select a@@13 o@@4))
)))
(assert (forall ((c_8_1@@0 Bool) (c_7_1@@0 Bool) (c_6_1@@0 Bool) (c_5_1@@1 Bool) (c_4_1@@2 Bool) (c_3_1@@3 Bool) (c_2_1@@3 Bool) (c_1_1@@3 Bool) (p_8_1@@0 Real) (p_7_1@@0 Real) (p_6_1@@0 Real) (p_5_1@@1 Real) (p_4_1@@2 Real) (p_3_1@@3 Real) (p_2_1@@3 Real) (p_1_1@@3 Real) (p_0_1@@3 Real) ) (! (= (__iar__assume_helper_8 c_8_1@@0 c_7_1@@0 c_6_1@@0 c_5_1@@1 c_4_1@@2 c_3_1@@3 c_2_1@@3 c_1_1@@3 p_8_1@@0 p_7_1@@0 p_6_1@@0 p_5_1@@1 p_4_1@@2 p_3_1@@3 p_2_1@@3 p_1_1@@3 p_0_1@@3) (+ (+ (+ (+ (+ (+ (+ (+ p_0_1@@3 (ite c_1_1@@3 p_1_1@@3 NoPerm)) (ite c_2_1@@3 p_2_1@@3 NoPerm)) (ite c_3_1@@3 p_3_1@@3 NoPerm)) (ite c_4_1@@2 p_4_1@@2 NoPerm)) (ite c_5_1@@1 p_5_1@@1 NoPerm)) (ite c_6_1@@0 p_6_1@@0 NoPerm)) (ite c_7_1@@0 p_7_1@@0 NoPerm)) (ite c_8_1@@0 p_8_1@@0 NoPerm)))
 :qid |stdinbpl.639:15|
 :skolemid |89|
 :pattern ( (__iar__assume_helper_8 c_8_1@@0 c_7_1@@0 c_6_1@@0 c_5_1@@1 c_4_1@@2 c_3_1@@3 c_2_1@@3 c_1_1@@3 p_8_1@@0 p_7_1@@0 p_6_1@@0 p_5_1@@1 p_4_1@@2 p_3_1@@3 p_2_1@@3 p_1_1@@3 p_0_1@@3))
)))
(assert (forall ((a@@14 T@U) (b@@12 T@U) ) (! (let ((T@@22 (MapType2TypeInv0 (type a@@14))))
 (=> (and (and (= (type a@@14) (MapType2Type T@@22 boolType)) (= (type b@@12) (MapType2Type T@@22 boolType))) (|Set#Equal| a@@14 b@@12)) (= a@@14 b@@12)))
 :qid |stdinbpl.275:17|
 :skolemid |50|
 :pattern ( (|Set#Equal| a@@14 b@@12))
)))
(assert (forall ((a@@15 T@U) (b@@13 T@U) ) (! (let ((T@@23 (MultiSetTypeInv0 (type a@@15))))
 (=> (and (and (= (type a@@15) (MultiSetType T@@23)) (= (type b@@13) (MultiSetType T@@23))) (|MultiSet#Equal| a@@15 b@@13)) (= a@@15 b@@13)))
 :qid |stdinbpl.374:17|
 :skolemid |79|
 :pattern ( (|MultiSet#Equal| a@@15 b@@13))
)))
(assert (forall ((arg0@@44 T@U) (arg1@@24 T@U) ) (! (let ((T@@24 (type arg1@@24)))
(= (type (|Set#UnionOne| arg0@@44 arg1@@24)) (MapType2Type T@@24 boolType)))
 :qid |funType:Set#UnionOne|
 :pattern ( (|Set#UnionOne| arg0@@44 arg1@@24))
)))
(assert (forall ((a@@16 T@U) (x@@9 T@U) (y@@2 T@U) ) (! (let ((T@@25 (type x@@9)))
 (=> (and (and (= (type a@@16) (MapType2Type T@@25 boolType)) (= (type y@@2) T@@25)) (U_2_bool (MapType2Select a@@16 y@@2))) (U_2_bool (MapType2Select (|Set#UnionOne| a@@16 x@@9) y@@2))))
 :qid |stdinbpl.218:18|
 :skolemid |31|
 :pattern ( (|Set#UnionOne| a@@16 x@@9) (MapType2Select a@@16 y@@2))
)))
(assert (forall ((a@@17 T@U) (b@@14 T@U) (y@@3 T@U) ) (! (let ((T@@26 (type y@@3)))
 (=> (and (and (= (type a@@17) (MapType2Type T@@26 boolType)) (= (type b@@14) (MapType2Type T@@26 boolType))) (U_2_bool (MapType2Select a@@17 y@@3))) (U_2_bool (MapType2Select (|Set#Union| a@@17 b@@14) y@@3))))
 :qid |stdinbpl.228:18|
 :skolemid |35|
 :pattern ( (|Set#Union| a@@17 b@@14) (MapType2Select a@@17 y@@3))
)))
(assert (forall ((a@@18 T@U) (b@@15 T@U) (y@@4 T@U) ) (! (let ((T@@27 (type y@@4)))
 (=> (and (and (= (type a@@18) (MapType2Type T@@27 boolType)) (= (type b@@15) (MapType2Type T@@27 boolType))) (U_2_bool (MapType2Select b@@15 y@@4))) (U_2_bool (MapType2Select (|Set#Union| a@@18 b@@15) y@@4))))
 :qid |stdinbpl.230:18|
 :skolemid |36|
 :pattern ( (|Set#Union| a@@18 b@@15) (MapType2Select b@@15 y@@4))
)))
(assert (forall ((ms T@U) (x@@10 T@U) ) (! (let ((T@@28 (type x@@10)))
 (=> (= (type ms) (MultiSetType T@@28)) (>= (|MultiSet#Select| ms x@@10) 0)))
 :qid |stdinbpl.305:18|
 :skolemid |56|
 :pattern ( (|MultiSet#Select| ms x@@10))
)))
(assert (forall ((a@@19 T@U) (x@@11 T@U) (o@@5 T@U) ) (! (let ((T@@29 (type x@@11)))
 (=> (and (= (type a@@19) (MapType2Type T@@29 boolType)) (= (type o@@5) T@@29)) (= (U_2_bool (MapType2Select (|Set#UnionOne| a@@19 x@@11) o@@5))  (or (= o@@5 x@@11) (U_2_bool (MapType2Select a@@19 o@@5))))))
 :qid |stdinbpl.214:18|
 :skolemid |29|
 :pattern ( (MapType2Select (|Set#UnionOne| a@@19 x@@11) o@@5))
)))
(assert (forall ((c_1_1@@4 Bool) (p_1_1@@4 Real) (p_0_1@@4 Real) ) (! (= (__iar__assume_helper_1 c_1_1@@4 p_1_1@@4 p_0_1@@4) (+ p_0_1@@4 (ite c_1_1@@4 p_1_1@@4 NoPerm)))
 :qid |stdinbpl.597:15|
 :skolemid |82|
 :pattern ( (__iar__assume_helper_1 c_1_1@@4 p_1_1@@4 p_0_1@@4))
)))
(assert (forall ((a@@20 T@U) (b@@16 T@U) (y@@5 T@U) ) (! (let ((T@@30 (type y@@5)))
 (=> (and (and (= (type a@@20) (MapType2Type T@@30 boolType)) (= (type b@@16) (MapType2Type T@@30 boolType))) (U_2_bool (MapType2Select b@@16 y@@5))) (not (U_2_bool (MapType2Select (|Set#Difference| a@@20 b@@16) y@@5)))))
 :qid |stdinbpl.255:18|
 :skolemid |44|
 :pattern ( (|Set#Difference| a@@20 b@@16) (MapType2Select b@@16 y@@5))
)))
(assert (forall ((a@@21 T@U) (b@@17 T@U) ) (! (let ((T@@31 (MapType2TypeInv0 (type a@@21))))
 (=> (and (= (type a@@21) (MapType2Type T@@31 boolType)) (= (type b@@17) (MapType2Type T@@31 boolType))) (and (= (+ (+ (|Set#Card| (|Set#Difference| a@@21 b@@17)) (|Set#Card| (|Set#Difference| b@@17 a@@21))) (|Set#Card| (|Set#Intersection| a@@21 b@@17))) (|Set#Card| (|Set#Union| a@@21 b@@17))) (= (|Set#Card| (|Set#Difference| a@@21 b@@17)) (- (|Set#Card| a@@21) (|Set#Card| (|Set#Intersection| a@@21 b@@17)))))))
 :qid |stdinbpl.257:18|
 :skolemid |45|
 :pattern ( (|Set#Card| (|Set#Difference| a@@21 b@@17)))
)))
(assert (forall ((s T@U) ) (! (let ((T@@32 (MapType2TypeInv0 (type s))))
 (=> (= (type s) (MapType2Type T@@32 boolType)) (<= 0 (|Set#Card| s))))
 :qid |stdinbpl.200:18|
 :skolemid |22|
 :pattern ( (|Set#Card| s))
)))
(assert (forall ((s@@0 T@U) ) (! (let ((T@@33 (MultiSetTypeInv0 (type s@@0))))
 (=> (= (type s@@0) (MultiSetType T@@33)) (<= 0 (|MultiSet#Card| s@@0))))
 :qid |stdinbpl.308:18|
 :skolemid |57|
 :pattern ( (|MultiSet#Card| s@@0))
)))
(assert (forall ((T@@34 T@T) ) (! (= (type (|MultiSet#Empty| T@@34)) (MultiSetType T@@34))
 :qid |funType:MultiSet#Empty|
 :pattern ( (|MultiSet#Empty| T@@34))
)))
(assert (forall ((o@@6 T@U) ) (! (let ((T@@35 (type o@@6)))
(= (|MultiSet#Select| (|MultiSet#Empty| T@@35) o@@6) 0))
 :qid |stdinbpl.313:18|
 :skolemid |58|
 :pattern ( (let ((T@@35 (type o@@6)))
(|MultiSet#Select| (|MultiSet#Empty| T@@35) o@@6)))
)))
(assert (forall ((a@@22 T@U) (x@@12 T@U) ) (! (let ((T@@36 (type x@@12)))
 (=> (= (type a@@22) (MapType2Type T@@36 boolType)) (U_2_bool (MapType2Select (|Set#UnionOne| a@@22 x@@12) x@@12))))
 :qid |stdinbpl.216:18|
 :skolemid |30|
 :pattern ( (|Set#UnionOne| a@@22 x@@12))
)))
(assert (forall ((Heap@@6 T@U) (ExhaleHeap@@4 T@U) (Mask@@6 T@U) (pm_f@@1 T@U) ) (! (let ((C@@1 (FieldTypeInv0 (type pm_f@@1))))
 (=> (and (and (and (and (and (= (type Heap@@6) (MapType0Type RefType)) (= (type ExhaleHeap@@4) (MapType0Type RefType))) (= (type Mask@@6) (MapType1Type RefType realType))) (= (type pm_f@@1) (FieldType C@@1 FrameTypeType))) (IdenticalOnKnownLocations Heap@@6 ExhaleHeap@@4 Mask@@6)) (and (HasDirectPerm Mask@@6 null pm_f@@1) (IsPredicateField pm_f@@1))) (forall ((o2 T@U) (f_2@@0 T@U) ) (! (let ((B@@5 (FieldTypeInv1 (type f_2@@0))))
(let ((A@@6 (FieldTypeInv0 (type f_2@@0))))
 (=> (and (and (= (type o2) RefType) (= (type f_2@@0) (FieldType A@@6 B@@5))) (U_2_bool (MapType1Select (MapType0Select Heap@@6 null (PredicateMaskField pm_f@@1)) o2 f_2@@0))) (= (MapType0Select Heap@@6 o2 f_2@@0) (MapType0Select ExhaleHeap@@4 o2 f_2@@0)))))
 :qid |stdinbpl.54:134|
 :skolemid |3|
 :pattern ( (MapType0Select ExhaleHeap@@4 o2 f_2@@0))
))))
 :qid |stdinbpl.52:19|
 :skolemid |4|
 :pattern ( (IdenticalOnKnownLocations Heap@@6 ExhaleHeap@@4 Mask@@6) (IsPredicateField pm_f@@1))
)))
(assert (forall ((Heap@@7 T@U) (ExhaleHeap@@5 T@U) (Mask@@7 T@U) (pm_f@@2 T@U) ) (! (let ((C@@2 (FieldTypeInv0 (type pm_f@@2))))
 (=> (and (and (and (and (and (= (type Heap@@7) (MapType0Type RefType)) (= (type ExhaleHeap@@5) (MapType0Type RefType))) (= (type Mask@@7) (MapType1Type RefType realType))) (= (type pm_f@@2) (FieldType C@@2 FrameTypeType))) (IdenticalOnKnownLocations Heap@@7 ExhaleHeap@@5 Mask@@7)) (and (HasDirectPerm Mask@@7 null pm_f@@2) (IsWandField pm_f@@2))) (forall ((o2@@0 T@U) (f_2@@1 T@U) ) (! (let ((B@@6 (FieldTypeInv1 (type f_2@@1))))
(let ((A@@7 (FieldTypeInv0 (type f_2@@1))))
 (=> (and (and (= (type o2@@0) RefType) (= (type f_2@@1) (FieldType A@@7 B@@6))) (U_2_bool (MapType1Select (MapType0Select Heap@@7 null (WandMaskField pm_f@@2)) o2@@0 f_2@@1))) (= (MapType0Select Heap@@7 o2@@0 f_2@@1) (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1)))))
 :qid |stdinbpl.67:129|
 :skolemid |6|
 :pattern ( (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1))
))))
 :qid |stdinbpl.65:19|
 :skolemid |7|
 :pattern ( (IdenticalOnKnownLocations Heap@@7 ExhaleHeap@@5 Mask@@7) (IsWandField pm_f@@2))
)))
(assert (forall ((a@@23 T@U) (x@@13 T@U) ) (! (let ((T@@37 (type x@@13)))
 (=> (and (= (type a@@23) (MapType2Type T@@37 boolType)) (U_2_bool (MapType2Select a@@23 x@@13))) (= (|Set#Card| (|Set#UnionOne| a@@23 x@@13)) (|Set#Card| a@@23))))
 :qid |stdinbpl.220:18|
 :skolemid |32|
 :pattern ( (|Set#Card| (|Set#UnionOne| a@@23 x@@13)))
)))
(assert (forall ((a@@24 T@U) (x@@14 T@U) ) (! (let ((T@@38 (type x@@14)))
 (=> (= (type a@@24) (MultiSetType T@@38)) (and (> (|MultiSet#Select| (|MultiSet#UnionOne| a@@24 x@@14) x@@14) 0) (> (|MultiSet#Card| (|MultiSet#UnionOne| a@@24 x@@14)) 0))))
 :qid |stdinbpl.332:18|
 :skolemid |66|
 :pattern ( (|MultiSet#UnionOne| a@@24 x@@14))
)))
(assert (forall ((r@@1 T@U) ) (! (= (|Set#Card| (|Set#Singleton| r@@1)) 1)
 :qid |stdinbpl.211:18|
 :skolemid |28|
 :pattern ( (|Set#Card| (|Set#Singleton| r@@1)))
)))
(assert (forall ((c_7_1@@1 Bool) (c_6_1@@1 Bool) (c_5_1@@2 Bool) (c_4_1@@3 Bool) (c_3_1@@4 Bool) (c_2_1@@4 Bool) (c_1_1@@5 Bool) (p_7_1@@1 Real) (p_6_1@@1 Real) (p_5_1@@2 Real) (p_4_1@@3 Real) (p_3_1@@4 Real) (p_2_1@@4 Real) (p_1_1@@5 Real) (p_0_1@@5 Real) ) (! (= (__iar__assume_helper_7 c_7_1@@1 c_6_1@@1 c_5_1@@2 c_4_1@@3 c_3_1@@4 c_2_1@@4 c_1_1@@5 p_7_1@@1 p_6_1@@1 p_5_1@@2 p_4_1@@3 p_3_1@@4 p_2_1@@4 p_1_1@@5 p_0_1@@5) (+ (+ (+ (+ (+ (+ (+ p_0_1@@5 (ite c_1_1@@5 p_1_1@@5 NoPerm)) (ite c_2_1@@4 p_2_1@@4 NoPerm)) (ite c_3_1@@4 p_3_1@@4 NoPerm)) (ite c_4_1@@3 p_4_1@@3 NoPerm)) (ite c_5_1@@2 p_5_1@@2 NoPerm)) (ite c_6_1@@1 p_6_1@@1 NoPerm)) (ite c_7_1@@1 p_7_1@@1 NoPerm)))
 :qid |stdinbpl.633:15|
 :skolemid |88|
 :pattern ( (__iar__assume_helper_7 c_7_1@@1 c_6_1@@1 c_5_1@@2 c_4_1@@3 c_3_1@@4 c_2_1@@4 c_1_1@@5 p_7_1@@1 p_6_1@@1 p_5_1@@2 p_4_1@@3 p_3_1@@4 p_2_1@@4 p_1_1@@5 p_0_1@@5))
)))
(assert (forall ((Mask@@8 T@U) (o_2@@2 T@U) (f_4@@2 T@U) ) (! (let ((B@@7 (FieldTypeInv1 (type f_4@@2))))
(let ((A@@8 (FieldTypeInv0 (type f_4@@2))))
 (=> (and (and (and (= (type Mask@@8) (MapType1Type RefType realType)) (= (type o_2@@2) RefType)) (= (type f_4@@2) (FieldType A@@8 B@@7))) (GoodMask Mask@@8)) (and (>= (U_2_real (MapType1Select Mask@@8 o_2@@2 f_4@@2)) NoPerm) (=> (and (and (GoodMask Mask@@8) (not (IsPredicateField f_4@@2))) (not (IsWandField f_4@@2))) (<= (U_2_real (MapType1Select Mask@@8 o_2@@2 f_4@@2)) FullPerm))))))
 :qid |stdinbpl.128:22|
 :skolemid |16|
 :pattern ( (GoodMask Mask@@8) (MapType1Select Mask@@8 o_2@@2 f_4@@2))
)))
(assert (forall ((r@@2 T@U) ) (! (U_2_bool (MapType2Select (|Set#Singleton| r@@2) r@@2))
 :qid |stdinbpl.209:18|
 :skolemid |26|
 :pattern ( (|Set#Singleton| r@@2))
)))
(assert (forall ((a@@25 T@U) (b@@18 T@U) ) (! (let ((T@@39 (MapType2TypeInv0 (type a@@25))))
 (=> (and (= (type a@@25) (MapType2Type T@@39 boolType)) (= (type b@@18) (MapType2Type T@@39 boolType))) (= (|Set#Union| a@@25 (|Set#Union| a@@25 b@@18)) (|Set#Union| a@@25 b@@18))))
 :qid |stdinbpl.243:18|
 :skolemid |39|
 :pattern ( (|Set#Union| a@@25 (|Set#Union| a@@25 b@@18)))
)))
(assert (forall ((a@@26 T@U) (b@@19 T@U) ) (! (let ((T@@40 (MapType2TypeInv0 (type a@@26))))
 (=> (and (= (type a@@26) (MapType2Type T@@40 boolType)) (= (type b@@19) (MapType2Type T@@40 boolType))) (= (|Set#Intersection| a@@26 (|Set#Intersection| a@@26 b@@19)) (|Set#Intersection| a@@26 b@@19))))
 :qid |stdinbpl.247:18|
 :skolemid |41|
 :pattern ( (|Set#Intersection| a@@26 (|Set#Intersection| a@@26 b@@19)))
)))
(assert (forall ((a@@27 T@U) (b@@20 T@U) ) (! (let ((T@@41 (MultiSetTypeInv0 (type a@@27))))
 (=> (and (= (type a@@27) (MultiSetType T@@41)) (= (type b@@20) (MultiSetType T@@41))) (= (|MultiSet#Intersection| a@@27 (|MultiSet#Intersection| a@@27 b@@20)) (|MultiSet#Intersection| a@@27 b@@20))))
 :qid |stdinbpl.349:18|
 :skolemid |71|
 :pattern ( (|MultiSet#Intersection| a@@27 (|MultiSet#Intersection| a@@27 b@@20)))
)))
(assert (forall ((s@@1 T@U) ) (! (let ((T@@42 (MultiSetTypeInv0 (type s@@1))))
 (=> (= (type s@@1) (MultiSetType T@@42)) (and (= (= (|MultiSet#Card| s@@1) 0) (= s@@1 (|MultiSet#Empty| T@@42))) (=> (not (= (|MultiSet#Card| s@@1) 0)) (exists ((x@@15 T@U) ) (!  (and (= (type x@@15) T@@42) (< 0 (|MultiSet#Select| s@@1 x@@15)))
 :qid |stdinbpl.316:38|
 :skolemid |59|
 :no-pattern (type x@@15)
 :no-pattern (U_2_int x@@15)
 :no-pattern (U_2_bool x@@15)
))))))
 :qid |stdinbpl.314:18|
 :skolemid |60|
 :pattern ( (|MultiSet#Card| s@@1))
)))
(assert (forall ((r@@3 T@U) (o@@7 T@U) ) (! (let ((T@@43 (type r@@3)))
 (=> (= (type o@@7) T@@43) (and (= (= (|MultiSet#Select| (|MultiSet#Singleton| r@@3) o@@7) 1) (= r@@3 o@@7)) (= (= (|MultiSet#Select| (|MultiSet#Singleton| r@@3) o@@7) 0) (not (= r@@3 o@@7))))))
 :qid |stdinbpl.319:18|
 :skolemid |61|
 :pattern ( (|MultiSet#Select| (|MultiSet#Singleton| r@@3) o@@7))
)))
(assert (forall ((o@@8 T@U) (f T@U) (Heap@@8 T@U) ) (!  (=> (and (and (and (= (type o@@8) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap@@8) (MapType0Type RefType))) (U_2_bool (MapType0Select Heap@@8 o@@8 $allocated))) (U_2_bool (MapType0Select Heap@@8 (MapType0Select Heap@@8 o@@8 f) $allocated)))
 :qid |stdinbpl.31:15|
 :skolemid |0|
 :pattern ( (MapType0Select Heap@@8 o@@8 f))
)))
(assert (forall ((a@@28 T@U) (b@@21 T@U) (o@@9 T@U) ) (! (let ((T@@44 (type o@@9)))
 (=> (and (= (type a@@28) (MultiSetType T@@44)) (= (type b@@21) (MultiSetType T@@44))) (= (|MultiSet#Select| (|MultiSet#Union| a@@28 b@@21) o@@9) (+ (|MultiSet#Select| a@@28 o@@9) (|MultiSet#Select| b@@21 o@@9)))))
 :qid |stdinbpl.337:18|
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
 :qid |stdinbpl.203:18|
 :skolemid |23|
 :pattern ( (let ((T@@46 (type o@@10)))
(MapType2Select (|Set#Empty| T@@46) o@@10)))
)))
(assert (forall ((c_6_1@@2 Bool) (c_5_1@@3 Bool) (c_4_1@@4 Bool) (c_3_1@@5 Bool) (c_2_1@@5 Bool) (c_1_1@@6 Bool) (p_6_1@@2 Real) (p_5_1@@3 Real) (p_4_1@@4 Real) (p_3_1@@5 Real) (p_2_1@@5 Real) (p_1_1@@6 Real) (p_0_1@@6 Real) ) (! (= (__iar__assume_helper_6 c_6_1@@2 c_5_1@@3 c_4_1@@4 c_3_1@@5 c_2_1@@5 c_1_1@@6 p_6_1@@2 p_5_1@@3 p_4_1@@4 p_3_1@@5 p_2_1@@5 p_1_1@@6 p_0_1@@6) (+ (+ (+ (+ (+ (+ p_0_1@@6 (ite c_1_1@@6 p_1_1@@6 NoPerm)) (ite c_2_1@@5 p_2_1@@5 NoPerm)) (ite c_3_1@@5 p_3_1@@5 NoPerm)) (ite c_4_1@@4 p_4_1@@4 NoPerm)) (ite c_5_1@@3 p_5_1@@3 NoPerm)) (ite c_6_1@@2 p_6_1@@2 NoPerm)))
 :qid |stdinbpl.627:15|
 :skolemid |87|
 :pattern ( (__iar__assume_helper_6 c_6_1@@2 c_5_1@@3 c_4_1@@4 c_3_1@@5 c_2_1@@5 c_1_1@@6 p_6_1@@2 p_5_1@@3 p_4_1@@4 p_3_1@@5 p_2_1@@5 p_1_1@@6 p_0_1@@6))
)))
(assert (forall ((r@@4 T@U) ) (! (let ((T@@47 (type r@@4)))
(= (|MultiSet#Singleton| r@@4) (|MultiSet#UnionOne| (|MultiSet#Empty| T@@47) r@@4)))
 :qid |stdinbpl.322:18|
 :skolemid |63|
 :pattern ( (|MultiSet#Singleton| r@@4))
)))
(assert (forall ((a@@29 Int) (b@@22 Int) ) (! (= (<= a@@29 b@@22) (= (|Math#min| a@@29 b@@22) a@@29))
 :qid |stdinbpl.287:15|
 :skolemid |51|
 :pattern ( (|Math#min| a@@29 b@@22))
)))
(assert (forall ((a@@30 Int) (b@@23 Int) ) (! (= (<= b@@23 a@@30) (= (|Math#min| a@@30 b@@23) b@@23))
 :qid |stdinbpl.288:15|
 :skolemid |52|
 :pattern ( (|Math#min| a@@30 b@@23))
)))
(assert (forall ((s@@2 T@U) ) (! (let ((T@@48 (MapType2TypeInv0 (type s@@2))))
 (=> (= (type s@@2) (MapType2Type T@@48 boolType)) (and (= (= (|Set#Card| s@@2) 0) (= s@@2 (|Set#Empty| T@@48))) (=> (not (= (|Set#Card| s@@2) 0)) (exists ((x@@16 T@U) ) (!  (and (= (type x@@16) T@@48) (U_2_bool (MapType2Select s@@2 x@@16)))
 :qid |stdinbpl.206:33|
 :skolemid |24|
 :no-pattern (type x@@16)
 :no-pattern (U_2_int x@@16)
 :no-pattern (U_2_bool x@@16)
))))))
 :qid |stdinbpl.204:18|
 :skolemid |25|
 :pattern ( (|Set#Card| s@@2))
)))
(assert (forall ((Heap@@9 T@U) (o@@11 T@U) (f_3 T@U) (v T@U) ) (! (let ((B@@8 (type v)))
(let ((A@@9 (FieldTypeInv0 (type f_3))))
 (=> (and (and (= (type Heap@@9) (MapType0Type RefType)) (= (type o@@11) RefType)) (= (type f_3) (FieldType A@@9 B@@8))) (succHeap Heap@@9 (MapType0Store Heap@@9 o@@11 f_3 v)))))
 :qid |stdinbpl.78:22|
 :skolemid |9|
 :pattern ( (MapType0Store Heap@@9 o@@11 f_3 v))
)))
(assert (forall ((a@@31 T@U) (b@@24 T@U) ) (! (let ((T@@49 (MapType2TypeInv0 (type a@@31))))
 (=> (and (= (type a@@31) (MapType2Type T@@49 boolType)) (= (type b@@24) (MapType2Type T@@49 boolType))) (= (|Set#Subset| a@@31 b@@24) (forall ((o@@12 T@U) ) (!  (=> (and (= (type o@@12) T@@49) (U_2_bool (MapType2Select a@@31 o@@12))) (U_2_bool (MapType2Select b@@24 o@@12)))
 :qid |stdinbpl.266:32|
 :skolemid |46|
 :pattern ( (MapType2Select a@@31 o@@12))
 :pattern ( (MapType2Select b@@24 o@@12))
)))))
 :qid |stdinbpl.265:17|
 :skolemid |47|
 :pattern ( (|Set#Subset| a@@31 b@@24))
)))
(assert (forall ((a@@32 T@U) (x@@17 T@U) ) (! (let ((T@@50 (type x@@17)))
 (=> (and (= (type a@@32) (MapType2Type T@@50 boolType)) (not (U_2_bool (MapType2Select a@@32 x@@17)))) (= (|Set#Card| (|Set#UnionOne| a@@32 x@@17)) (+ (|Set#Card| a@@32) 1))))
 :qid |stdinbpl.222:18|
 :skolemid |33|
 :pattern ( (|Set#Card| (|Set#UnionOne| a@@32 x@@17)))
)))
(assert (forall ((a@@33 T@U) (b@@25 T@U) (o@@13 T@U) ) (! (let ((T@@51 (type o@@13)))
 (=> (and (= (type a@@33) (MultiSetType T@@51)) (= (type b@@25) (MultiSetType T@@51))) (= (|MultiSet#Select| (|MultiSet#Difference| a@@33 b@@25) o@@13) (|Math#clip| (- (|MultiSet#Select| a@@33 o@@13) (|MultiSet#Select| b@@25 o@@13))))))
 :qid |stdinbpl.354:18|
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
 :qid |stdinbpl.182:25|
 :skolemid |20|
 :pattern ( (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r@@5 u))
)))
(assert (forall ((a@@34 Int) ) (!  (=> (< a@@34 0) (= (|Math#clip| a@@34) 0))
 :qid |stdinbpl.293:15|
 :skolemid |55|
 :pattern ( (|Math#clip| a@@34))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
(assert (forall ((c_9_1@@0 Bool) (c_8_1@@1 Bool) (c_7_1@@2 Bool) (c_6_1@@3 Bool) (c_5_1@@4 Bool) (c_4_1@@5 Bool) (c_3_1@@6 Bool) (c_2_1@@6 Bool) (c_1_1@@7 Bool) (p_9_1@@0 Real) (p_8_1@@1 Real) (p_7_1@@2 Real) (p_6_1@@3 Real) (p_5_1@@4 Real) (p_4_1@@5 Real) (p_3_1@@6 Real) (p_2_1@@6 Real) (p_1_1@@7 Real) (p_0_1@@7 Real) ) (! (= (__iar__assume_helper_9 c_9_1@@0 c_8_1@@1 c_7_1@@2 c_6_1@@3 c_5_1@@4 c_4_1@@5 c_3_1@@6 c_2_1@@6 c_1_1@@7 p_9_1@@0 p_8_1@@1 p_7_1@@2 p_6_1@@3 p_5_1@@4 p_4_1@@5 p_3_1@@6 p_2_1@@6 p_1_1@@7 p_0_1@@7) (+ (+ (+ (+ (+ (+ (+ (+ (+ p_0_1@@7 (ite c_1_1@@7 p_1_1@@7 NoPerm)) (ite c_2_1@@6 p_2_1@@6 NoPerm)) (ite c_3_1@@6 p_3_1@@6 NoPerm)) (ite c_4_1@@5 p_4_1@@5 NoPerm)) (ite c_5_1@@4 p_5_1@@4 NoPerm)) (ite c_6_1@@3 p_6_1@@3 NoPerm)) (ite c_7_1@@2 p_7_1@@2 NoPerm)) (ite c_8_1@@1 p_8_1@@1 NoPerm)) (ite c_9_1@@0 p_9_1@@0 NoPerm)))
 :qid |stdinbpl.645:15|
 :skolemid |90|
 :pattern ( (__iar__assume_helper_9 c_9_1@@0 c_8_1@@1 c_7_1@@2 c_6_1@@3 c_5_1@@4 c_4_1@@5 c_3_1@@6 c_2_1@@6 c_1_1@@7 p_9_1@@0 p_8_1@@1 p_7_1@@2 p_6_1@@3 p_5_1@@4 p_4_1@@5 p_3_1@@6 p_2_1@@6 p_1_1@@7 p_0_1@@7))
)))
(assert (forall ((a@@35 T@U) (x@@18 T@U) (o@@14 T@U) ) (! (let ((T@@52 (type x@@18)))
 (=> (and (= (type a@@35) (MultiSetType T@@52)) (= (type o@@14) T@@52)) (= (|MultiSet#Select| (|MultiSet#UnionOne| a@@35 x@@18) o@@14) (ite (= x@@18 o@@14) (+ (|MultiSet#Select| a@@35 o@@14) 1) (|MultiSet#Select| a@@35 o@@14)))))
 :qid |stdinbpl.326:18|
 :skolemid |64|
 :pattern ( (|MultiSet#Select| (|MultiSet#UnionOne| a@@35 x@@18) o@@14))
 :pattern ( (|MultiSet#UnionOne| a@@35 x@@18) (|MultiSet#Select| a@@35 o@@14))
)))
(assert (forall ((a@@36 T@U) (b@@26 T@U) ) (! (let ((T@@53 (MultiSetTypeInv0 (type a@@36))))
 (=> (and (= (type a@@36) (MultiSetType T@@53)) (= (type b@@26) (MultiSetType T@@53))) (= (|MultiSet#Equal| a@@36 b@@26) (forall ((o@@15 T@U) ) (!  (=> (= (type o@@15) T@@53) (= (|MultiSet#Select| a@@36 o@@15) (|MultiSet#Select| b@@26 o@@15)))
 :qid |stdinbpl.372:36|
 :skolemid |77|
 :pattern ( (|MultiSet#Select| a@@36 o@@15))
 :pattern ( (|MultiSet#Select| b@@26 o@@15))
)))))
 :qid |stdinbpl.371:17|
 :skolemid |78|
 :pattern ( (|MultiSet#Equal| a@@36 b@@26))
)))
(assert (forall ((a@@37 T@U) (b@@27 T@U) ) (! (let ((T@@54 (MultiSetTypeInv0 (type a@@37))))
 (=> (and (= (type a@@37) (MultiSetType T@@54)) (= (type b@@27) (MultiSetType T@@54))) (= (|MultiSet#Subset| a@@37 b@@27) (forall ((o@@16 T@U) ) (!  (=> (= (type o@@16) T@@54) (<= (|MultiSet#Select| a@@37 o@@16) (|MultiSet#Select| b@@27 o@@16)))
 :qid |stdinbpl.368:37|
 :skolemid |75|
 :pattern ( (|MultiSet#Select| a@@37 o@@16))
 :pattern ( (|MultiSet#Select| b@@27 o@@16))
)))))
 :qid |stdinbpl.367:17|
 :skolemid |76|
 :pattern ( (|MultiSet#Subset| a@@37 b@@27))
)))
(assert (forall ((c_2_1@@7 Bool) (c_1_1@@8 Bool) (p_2_1@@7 Real) (p_1_1@@8 Real) (p_0_1@@8 Real) ) (! (= (__iar__assume_helper_2 c_2_1@@7 c_1_1@@8 p_2_1@@7 p_1_1@@8 p_0_1@@8) (+ (+ p_0_1@@8 (ite c_1_1@@8 p_1_1@@8 NoPerm)) (ite c_2_1@@7 p_2_1@@7 NoPerm)))
 :qid |stdinbpl.603:15|
 :skolemid |83|
 :pattern ( (__iar__assume_helper_2 c_2_1@@7 c_1_1@@8 p_2_1@@7 p_1_1@@8 p_0_1@@8))
)))
(assert (forall ((a@@38 T@U) (b@@28 T@U) (o@@17 T@U) ) (! (let ((T@@55 (type o@@17)))
 (=> (and (= (type a@@38) (MapType2Type T@@55 boolType)) (= (type b@@28) (MapType2Type T@@55 boolType))) (= (U_2_bool (MapType2Select (|Set#Union| a@@38 b@@28) o@@17))  (or (U_2_bool (MapType2Select a@@38 o@@17)) (U_2_bool (MapType2Select b@@28 o@@17))))))
 :qid |stdinbpl.226:18|
 :skolemid |34|
 :pattern ( (MapType2Select (|Set#Union| a@@38 b@@28) o@@17))
)))
(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun q_1 () Real)
(declare-fun AssertMask@0 () T@U)
(declare-fun QPMask@0 () T@U)
(declare-fun a_2 () T@U)
(declare-fun b_2 () T@U)
(declare-fun c () T@U)
(declare-fun Heap@@10 () T@U)
(declare-fun inv_10_0 (T@U T@U T@U) T@U)
(declare-fun inv_10_1 (T@U T@U T@U) T@U)
(declare-fun inv_10_2 (T@U T@U T@U) T@U)
(declare-fun xs11 () T@U)
(declare-fun ys11 () T@U)
(declare-fun zs11 () T@U)
(declare-fun xs1 () T@U)
(declare-fun inv_0_0 (T@U T@U T@U) T@U)
(declare-fun ys1 () T@U)
(declare-fun inv_0_1 (T@U T@U T@U) T@U)
(declare-fun zs1 () T@U)
(declare-fun inv_0_2 (T@U T@U T@U) T@U)
(declare-fun xs2 () T@U)
(declare-fun inv_1_0 (T@U T@U T@U) T@U)
(declare-fun ys2 () T@U)
(declare-fun inv_1_1 (T@U T@U T@U) T@U)
(declare-fun zs2 () T@U)
(declare-fun inv_1_2 (T@U T@U T@U) T@U)
(declare-fun xs3 () T@U)
(declare-fun inv_2_0 (T@U T@U T@U) T@U)
(declare-fun ys3 () T@U)
(declare-fun inv_2_1 (T@U T@U T@U) T@U)
(declare-fun zs3 () T@U)
(declare-fun inv_2_2 (T@U T@U T@U) T@U)
(declare-fun xs4 () T@U)
(declare-fun inv_3_0 (T@U T@U T@U) T@U)
(declare-fun ys4 () T@U)
(declare-fun inv_3_1 (T@U T@U T@U) T@U)
(declare-fun zs4 () T@U)
(declare-fun inv_3_2 (T@U T@U T@U) T@U)
(declare-fun xs5 () T@U)
(declare-fun inv_4_0 (T@U T@U T@U) T@U)
(declare-fun ys5 () T@U)
(declare-fun inv_4_1 (T@U T@U T@U) T@U)
(declare-fun zs5 () T@U)
(declare-fun inv_4_2 (T@U T@U T@U) T@U)
(declare-fun xs6 () T@U)
(declare-fun inv_5_0 (T@U T@U T@U) T@U)
(declare-fun ys6 () T@U)
(declare-fun inv_5_1 (T@U T@U T@U) T@U)
(declare-fun zs6 () T@U)
(declare-fun inv_5_2 (T@U T@U T@U) T@U)
(declare-fun xs7 () T@U)
(declare-fun inv_6_0 (T@U T@U T@U) T@U)
(declare-fun ys7 () T@U)
(declare-fun inv_6_1 (T@U T@U T@U) T@U)
(declare-fun zs7 () T@U)
(declare-fun inv_6_2 (T@U T@U T@U) T@U)
(declare-fun xs8 () T@U)
(declare-fun inv_7_0 (T@U T@U T@U) T@U)
(declare-fun ys8 () T@U)
(declare-fun inv_7_1 (T@U T@U T@U) T@U)
(declare-fun zs8 () T@U)
(declare-fun inv_7_2 (T@U T@U T@U) T@U)
(declare-fun xs9 () T@U)
(declare-fun inv_8_0 (T@U T@U T@U) T@U)
(declare-fun ys9 () T@U)
(declare-fun inv_8_1 (T@U T@U T@U) T@U)
(declare-fun zs9 () T@U)
(declare-fun inv_8_2 (T@U T@U T@U) T@U)
(declare-fun xs10 () T@U)
(declare-fun inv_9_0 (T@U T@U T@U) T@U)
(declare-fun ys10 () T@U)
(declare-fun inv_9_1 (T@U T@U T@U) T@U)
(declare-fun zs10 () T@U)
(declare-fun inv_9_2 (T@U T@U T@U) T@U)
(declare-fun neverTriggered3 (T@U T@U T@U) Bool)
(declare-fun xs () T@U)
(declare-fun ys () T@U)
(declare-fun zs () T@U)
(declare-fun invRecv1 (T@U T@U T@U) T@U)
(declare-fun invRecv2 (T@U T@U T@U) T@U)
(declare-fun invRecv3 (T@U T@U T@U) T@U)
(declare-fun qpRange3 (T@U T@U T@U) Bool)
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (= (type AssertMask@0) (MapType1Type RefType realType)) (= (type QPMask@0) (MapType1Type RefType realType))) (= (type a_2) RefType)) (= (type b_2) RefType)) (= (type c) RefType)) (= (type Heap@@10) (MapType0Type RefType))) (forall ((arg0@@45 T@U) (arg1@@25 T@U) (arg2@@6 T@U) ) (! (= (type (inv_10_0 arg0@@45 arg1@@25 arg2@@6)) RefType)
 :qid |funType:inv_10_0|
 :pattern ( (inv_10_0 arg0@@45 arg1@@25 arg2@@6))
))) (forall ((arg0@@46 T@U) (arg1@@26 T@U) (arg2@@7 T@U) ) (! (= (type (inv_10_1 arg0@@46 arg1@@26 arg2@@7)) RefType)
 :qid |funType:inv_10_1|
 :pattern ( (inv_10_1 arg0@@46 arg1@@26 arg2@@7))
))) (forall ((arg0@@47 T@U) (arg1@@27 T@U) (arg2@@8 T@U) ) (! (= (type (inv_10_2 arg0@@47 arg1@@27 arg2@@8)) RefType)
 :qid |funType:inv_10_2|
 :pattern ( (inv_10_2 arg0@@47 arg1@@27 arg2@@8))
))) (= (type xs11) (MapType2Type RefType boolType))) (= (type ys11) (MapType2Type RefType boolType))) (= (type zs11) (MapType2Type RefType boolType))) (= (type xs1) (MapType2Type RefType boolType))) (forall ((arg0@@48 T@U) (arg1@@28 T@U) (arg2@@9 T@U) ) (! (= (type (inv_0_0 arg0@@48 arg1@@28 arg2@@9)) RefType)
 :qid |funType:inv_0_0|
 :pattern ( (inv_0_0 arg0@@48 arg1@@28 arg2@@9))
))) (= (type ys1) (MapType2Type RefType boolType))) (forall ((arg0@@49 T@U) (arg1@@29 T@U) (arg2@@10 T@U) ) (! (= (type (inv_0_1 arg0@@49 arg1@@29 arg2@@10)) RefType)
 :qid |funType:inv_0_1|
 :pattern ( (inv_0_1 arg0@@49 arg1@@29 arg2@@10))
))) (= (type zs1) (MapType2Type RefType boolType))) (forall ((arg0@@50 T@U) (arg1@@30 T@U) (arg2@@11 T@U) ) (! (= (type (inv_0_2 arg0@@50 arg1@@30 arg2@@11)) RefType)
 :qid |funType:inv_0_2|
 :pattern ( (inv_0_2 arg0@@50 arg1@@30 arg2@@11))
))) (= (type xs2) (MapType2Type RefType boolType))) (forall ((arg0@@51 T@U) (arg1@@31 T@U) (arg2@@12 T@U) ) (! (= (type (inv_1_0 arg0@@51 arg1@@31 arg2@@12)) RefType)
 :qid |funType:inv_1_0|
 :pattern ( (inv_1_0 arg0@@51 arg1@@31 arg2@@12))
))) (= (type ys2) (MapType2Type RefType boolType))) (forall ((arg0@@52 T@U) (arg1@@32 T@U) (arg2@@13 T@U) ) (! (= (type (inv_1_1 arg0@@52 arg1@@32 arg2@@13)) RefType)
 :qid |funType:inv_1_1|
 :pattern ( (inv_1_1 arg0@@52 arg1@@32 arg2@@13))
))) (= (type zs2) (MapType2Type RefType boolType))) (forall ((arg0@@53 T@U) (arg1@@33 T@U) (arg2@@14 T@U) ) (! (= (type (inv_1_2 arg0@@53 arg1@@33 arg2@@14)) RefType)
 :qid |funType:inv_1_2|
 :pattern ( (inv_1_2 arg0@@53 arg1@@33 arg2@@14))
))) (= (type xs3) (MapType2Type RefType boolType))) (forall ((arg0@@54 T@U) (arg1@@34 T@U) (arg2@@15 T@U) ) (! (= (type (inv_2_0 arg0@@54 arg1@@34 arg2@@15)) RefType)
 :qid |funType:inv_2_0|
 :pattern ( (inv_2_0 arg0@@54 arg1@@34 arg2@@15))
))) (= (type ys3) (MapType2Type RefType boolType))) (forall ((arg0@@55 T@U) (arg1@@35 T@U) (arg2@@16 T@U) ) (! (= (type (inv_2_1 arg0@@55 arg1@@35 arg2@@16)) RefType)
 :qid |funType:inv_2_1|
 :pattern ( (inv_2_1 arg0@@55 arg1@@35 arg2@@16))
))) (= (type zs3) (MapType2Type RefType boolType))) (forall ((arg0@@56 T@U) (arg1@@36 T@U) (arg2@@17 T@U) ) (! (= (type (inv_2_2 arg0@@56 arg1@@36 arg2@@17)) RefType)
 :qid |funType:inv_2_2|
 :pattern ( (inv_2_2 arg0@@56 arg1@@36 arg2@@17))
))) (= (type xs4) (MapType2Type RefType boolType))) (forall ((arg0@@57 T@U) (arg1@@37 T@U) (arg2@@18 T@U) ) (! (= (type (inv_3_0 arg0@@57 arg1@@37 arg2@@18)) RefType)
 :qid |funType:inv_3_0|
 :pattern ( (inv_3_0 arg0@@57 arg1@@37 arg2@@18))
))) (= (type ys4) (MapType2Type RefType boolType))) (forall ((arg0@@58 T@U) (arg1@@38 T@U) (arg2@@19 T@U) ) (! (= (type (inv_3_1 arg0@@58 arg1@@38 arg2@@19)) RefType)
 :qid |funType:inv_3_1|
 :pattern ( (inv_3_1 arg0@@58 arg1@@38 arg2@@19))
))) (= (type zs4) (MapType2Type RefType boolType))) (forall ((arg0@@59 T@U) (arg1@@39 T@U) (arg2@@20 T@U) ) (! (= (type (inv_3_2 arg0@@59 arg1@@39 arg2@@20)) RefType)
 :qid |funType:inv_3_2|
 :pattern ( (inv_3_2 arg0@@59 arg1@@39 arg2@@20))
))) (= (type xs5) (MapType2Type RefType boolType))) (forall ((arg0@@60 T@U) (arg1@@40 T@U) (arg2@@21 T@U) ) (! (= (type (inv_4_0 arg0@@60 arg1@@40 arg2@@21)) RefType)
 :qid |funType:inv_4_0|
 :pattern ( (inv_4_0 arg0@@60 arg1@@40 arg2@@21))
))) (= (type ys5) (MapType2Type RefType boolType))) (forall ((arg0@@61 T@U) (arg1@@41 T@U) (arg2@@22 T@U) ) (! (= (type (inv_4_1 arg0@@61 arg1@@41 arg2@@22)) RefType)
 :qid |funType:inv_4_1|
 :pattern ( (inv_4_1 arg0@@61 arg1@@41 arg2@@22))
))) (= (type zs5) (MapType2Type RefType boolType))) (forall ((arg0@@62 T@U) (arg1@@42 T@U) (arg2@@23 T@U) ) (! (= (type (inv_4_2 arg0@@62 arg1@@42 arg2@@23)) RefType)
 :qid |funType:inv_4_2|
 :pattern ( (inv_4_2 arg0@@62 arg1@@42 arg2@@23))
))) (= (type xs6) (MapType2Type RefType boolType))) (forall ((arg0@@63 T@U) (arg1@@43 T@U) (arg2@@24 T@U) ) (! (= (type (inv_5_0 arg0@@63 arg1@@43 arg2@@24)) RefType)
 :qid |funType:inv_5_0|
 :pattern ( (inv_5_0 arg0@@63 arg1@@43 arg2@@24))
))) (= (type ys6) (MapType2Type RefType boolType))) (forall ((arg0@@64 T@U) (arg1@@44 T@U) (arg2@@25 T@U) ) (! (= (type (inv_5_1 arg0@@64 arg1@@44 arg2@@25)) RefType)
 :qid |funType:inv_5_1|
 :pattern ( (inv_5_1 arg0@@64 arg1@@44 arg2@@25))
))) (= (type zs6) (MapType2Type RefType boolType))) (forall ((arg0@@65 T@U) (arg1@@45 T@U) (arg2@@26 T@U) ) (! (= (type (inv_5_2 arg0@@65 arg1@@45 arg2@@26)) RefType)
 :qid |funType:inv_5_2|
 :pattern ( (inv_5_2 arg0@@65 arg1@@45 arg2@@26))
))) (= (type xs7) (MapType2Type RefType boolType))) (forall ((arg0@@66 T@U) (arg1@@46 T@U) (arg2@@27 T@U) ) (! (= (type (inv_6_0 arg0@@66 arg1@@46 arg2@@27)) RefType)
 :qid |funType:inv_6_0|
 :pattern ( (inv_6_0 arg0@@66 arg1@@46 arg2@@27))
))) (= (type ys7) (MapType2Type RefType boolType))) (forall ((arg0@@67 T@U) (arg1@@47 T@U) (arg2@@28 T@U) ) (! (= (type (inv_6_1 arg0@@67 arg1@@47 arg2@@28)) RefType)
 :qid |funType:inv_6_1|
 :pattern ( (inv_6_1 arg0@@67 arg1@@47 arg2@@28))
))) (= (type zs7) (MapType2Type RefType boolType))) (forall ((arg0@@68 T@U) (arg1@@48 T@U) (arg2@@29 T@U) ) (! (= (type (inv_6_2 arg0@@68 arg1@@48 arg2@@29)) RefType)
 :qid |funType:inv_6_2|
 :pattern ( (inv_6_2 arg0@@68 arg1@@48 arg2@@29))
))) (= (type xs8) (MapType2Type RefType boolType))) (forall ((arg0@@69 T@U) (arg1@@49 T@U) (arg2@@30 T@U) ) (! (= (type (inv_7_0 arg0@@69 arg1@@49 arg2@@30)) RefType)
 :qid |funType:inv_7_0|
 :pattern ( (inv_7_0 arg0@@69 arg1@@49 arg2@@30))
))) (= (type ys8) (MapType2Type RefType boolType))) (forall ((arg0@@70 T@U) (arg1@@50 T@U) (arg2@@31 T@U) ) (! (= (type (inv_7_1 arg0@@70 arg1@@50 arg2@@31)) RefType)
 :qid |funType:inv_7_1|
 :pattern ( (inv_7_1 arg0@@70 arg1@@50 arg2@@31))
))) (= (type zs8) (MapType2Type RefType boolType))) (forall ((arg0@@71 T@U) (arg1@@51 T@U) (arg2@@32 T@U) ) (! (= (type (inv_7_2 arg0@@71 arg1@@51 arg2@@32)) RefType)
 :qid |funType:inv_7_2|
 :pattern ( (inv_7_2 arg0@@71 arg1@@51 arg2@@32))
))) (= (type xs9) (MapType2Type RefType boolType))) (forall ((arg0@@72 T@U) (arg1@@52 T@U) (arg2@@33 T@U) ) (! (= (type (inv_8_0 arg0@@72 arg1@@52 arg2@@33)) RefType)
 :qid |funType:inv_8_0|
 :pattern ( (inv_8_0 arg0@@72 arg1@@52 arg2@@33))
))) (= (type ys9) (MapType2Type RefType boolType))) (forall ((arg0@@73 T@U) (arg1@@53 T@U) (arg2@@34 T@U) ) (! (= (type (inv_8_1 arg0@@73 arg1@@53 arg2@@34)) RefType)
 :qid |funType:inv_8_1|
 :pattern ( (inv_8_1 arg0@@73 arg1@@53 arg2@@34))
))) (= (type zs9) (MapType2Type RefType boolType))) (forall ((arg0@@74 T@U) (arg1@@54 T@U) (arg2@@35 T@U) ) (! (= (type (inv_8_2 arg0@@74 arg1@@54 arg2@@35)) RefType)
 :qid |funType:inv_8_2|
 :pattern ( (inv_8_2 arg0@@74 arg1@@54 arg2@@35))
))) (= (type xs10) (MapType2Type RefType boolType))) (forall ((arg0@@75 T@U) (arg1@@55 T@U) (arg2@@36 T@U) ) (! (= (type (inv_9_0 arg0@@75 arg1@@55 arg2@@36)) RefType)
 :qid |funType:inv_9_0|
 :pattern ( (inv_9_0 arg0@@75 arg1@@55 arg2@@36))
))) (= (type ys10) (MapType2Type RefType boolType))) (forall ((arg0@@76 T@U) (arg1@@56 T@U) (arg2@@37 T@U) ) (! (= (type (inv_9_1 arg0@@76 arg1@@56 arg2@@37)) RefType)
 :qid |funType:inv_9_1|
 :pattern ( (inv_9_1 arg0@@76 arg1@@56 arg2@@37))
))) (= (type zs10) (MapType2Type RefType boolType))) (forall ((arg0@@77 T@U) (arg1@@57 T@U) (arg2@@38 T@U) ) (! (= (type (inv_9_2 arg0@@77 arg1@@57 arg2@@38)) RefType)
 :qid |funType:inv_9_2|
 :pattern ( (inv_9_2 arg0@@77 arg1@@57 arg2@@38))
))) (= (type xs) (MapType2Type RefType boolType))) (= (type ys) (MapType2Type RefType boolType))) (= (type zs) (MapType2Type RefType boolType))) (forall ((arg0@@78 T@U) (arg1@@58 T@U) (arg2@@39 T@U) ) (! (= (type (invRecv1 arg0@@78 arg1@@58 arg2@@39)) RefType)
 :qid |funType:invRecv1|
 :pattern ( (invRecv1 arg0@@78 arg1@@58 arg2@@39))
))) (forall ((arg0@@79 T@U) (arg1@@59 T@U) (arg2@@40 T@U) ) (! (= (type (invRecv2 arg0@@79 arg1@@59 arg2@@40)) RefType)
 :qid |funType:invRecv2|
 :pattern ( (invRecv2 arg0@@79 arg1@@59 arg2@@40))
))) (forall ((arg0@@80 T@U) (arg1@@60 T@U) (arg2@@41 T@U) ) (! (= (type (invRecv3 arg0@@80 arg1@@60 arg2@@41)) RefType)
 :qid |funType:invRecv3|
 :pattern ( (invRecv3 arg0@@80 arg1@@60 arg2@@41))
))))
(set-info :boogie-vc-id m)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 80) (let ((anon108_Else_correct true))
(let ((anon108_Then_correct  (=> (and (< NoPerm q_1) (= (ControlFlow 0 36) (- 0 35))) false)))
(let ((anon70_correct  (=> (and (= AssertMask@0 (MapType1Store QPMask@0 null (p_11 a_2 b_2 c) (real_2_U (- (U_2_real (MapType1Select QPMask@0 null (p_11 a_2 b_2 c))) q_1)))) (state Heap@@10 QPMask@0)) (and (=> (= (ControlFlow 0 38) 36) anon108_Then_correct) (=> (= (ControlFlow 0 38) 37) anon108_Else_correct)))))
(let ((anon107_Else_correct  (=> (and (= q_1 NoPerm) (= (ControlFlow 0 41) 38)) anon70_correct)))
(let ((anon107_Then_correct  (=> (not (= q_1 NoPerm)) (and (=> (= (ControlFlow 0 39) (- 0 40)) (<= q_1 (U_2_real (MapType1Select QPMask@0 null (p_11 a_2 b_2 c))))) (=> (<= q_1 (U_2_real (MapType1Select QPMask@0 null (p_11 a_2 b_2 c)))) (=> (= (ControlFlow 0 39) 38) anon70_correct))))))
(let ((anon106_Else_correct  (=> (forall ((x_47 T@U) (y_47 T@U) (z_47 T@U) ) (!  (=> (and (and (and (= (type x_47) RefType) (= (type y_47) RefType)) (= (type z_47) RefType)) (and (U_2_bool (MapType2Select xs11 (inv_10_0 x_47 y_47 z_47))) (and (U_2_bool (MapType2Select ys11 (inv_10_1 x_47 y_47 z_47))) (U_2_bool (MapType2Select zs11 (inv_10_2 x_47 y_47 z_47)))))) (<= (__iar__assume_helper_10  (and (and (U_2_bool (MapType2Select xs1 (inv_0_0 x_47 y_47 z_47))) (and (U_2_bool (MapType2Select ys1 (inv_0_1 x_47 y_47 z_47))) (U_2_bool (MapType2Select zs1 (inv_0_2 x_47 y_47 z_47))))) (and (and (= x_47 x_47) (= y_47 y_47)) (= z_47 z_47)))  (and (and (U_2_bool (MapType2Select xs2 (inv_1_0 x_47 y_47 z_47))) (and (U_2_bool (MapType2Select ys2 (inv_1_1 x_47 y_47 z_47))) (U_2_bool (MapType2Select zs2 (inv_1_2 x_47 y_47 z_47))))) (and (and (= x_47 x_47) (= y_47 y_47)) (= z_47 z_47)))  (and (and (U_2_bool (MapType2Select xs3 (inv_2_0 x_47 y_47 z_47))) (and (U_2_bool (MapType2Select ys3 (inv_2_1 x_47 y_47 z_47))) (U_2_bool (MapType2Select zs3 (inv_2_2 x_47 y_47 z_47))))) (and (and (= x_47 x_47) (= y_47 y_47)) (= z_47 z_47)))  (and (and (U_2_bool (MapType2Select xs4 (inv_3_0 x_47 y_47 z_47))) (and (U_2_bool (MapType2Select ys4 (inv_3_1 x_47 y_47 z_47))) (U_2_bool (MapType2Select zs4 (inv_3_2 x_47 y_47 z_47))))) (and (and (= x_47 x_47) (= y_47 y_47)) (= z_47 z_47)))  (and (and (U_2_bool (MapType2Select xs5 (inv_4_0 x_47 y_47 z_47))) (and (U_2_bool (MapType2Select ys5 (inv_4_1 x_47 y_47 z_47))) (U_2_bool (MapType2Select zs5 (inv_4_2 x_47 y_47 z_47))))) (and (and (= x_47 x_47) (= y_47 y_47)) (= z_47 z_47)))  (and (and (U_2_bool (MapType2Select xs6 (inv_5_0 x_47 y_47 z_47))) (and (U_2_bool (MapType2Select ys6 (inv_5_1 x_47 y_47 z_47))) (U_2_bool (MapType2Select zs6 (inv_5_2 x_47 y_47 z_47))))) (and (and (= x_47 x_47) (= y_47 y_47)) (= z_47 z_47)))  (and (and (U_2_bool (MapType2Select xs7 (inv_6_0 x_47 y_47 z_47))) (and (U_2_bool (MapType2Select ys7 (inv_6_1 x_47 y_47 z_47))) (U_2_bool (MapType2Select zs7 (inv_6_2 x_47 y_47 z_47))))) (and (and (= x_47 x_47) (= y_47 y_47)) (= z_47 z_47)))  (and (and (U_2_bool (MapType2Select xs8 (inv_7_0 x_47 y_47 z_47))) (and (U_2_bool (MapType2Select ys8 (inv_7_1 x_47 y_47 z_47))) (U_2_bool (MapType2Select zs8 (inv_7_2 x_47 y_47 z_47))))) (and (and (= x_47 x_47) (= y_47 y_47)) (= z_47 z_47)))  (and (and (U_2_bool (MapType2Select xs9 (inv_8_0 x_47 y_47 z_47))) (and (U_2_bool (MapType2Select ys9 (inv_8_1 x_47 y_47 z_47))) (U_2_bool (MapType2Select zs9 (inv_8_2 x_47 y_47 z_47))))) (and (and (= x_47 x_47) (= y_47 y_47)) (= z_47 z_47)))  (and (and (U_2_bool (MapType2Select xs10 (inv_9_0 x_47 y_47 z_47))) (and (U_2_bool (MapType2Select ys10 (inv_9_1 x_47 y_47 z_47))) (U_2_bool (MapType2Select zs10 (inv_9_2 x_47 y_47 z_47))))) (and (and (= x_47 x_47) (= y_47 y_47)) (= z_47 z_47))) q_1 q_1 q_1 q_1 q_1 q_1 q_1 q_1 q_1 q_1 q_1) (U_2_real (MapType1Select QPMask@0 null (p_11 x_47 y_47 z_47)))))
 :qid |stdinbpl.1466:20|
 :skolemid |137|
 :pattern ( (inv_10_0 x_47 y_47 z_47) (inv_10_1 x_47 y_47 z_47) (inv_10_2 x_47 y_47 z_47))
)) (=> (and (and (state Heap@@10 QPMask@0) (state Heap@@10 QPMask@0)) (and (U_2_bool (MapType2Select xs1 a_2)) (state Heap@@10 QPMask@0))) (=> (and (and (and (and (state Heap@@10 QPMask@0) (U_2_bool (MapType2Select ys1 b_2))) (and (state Heap@@10 QPMask@0) (state Heap@@10 QPMask@0))) (and (and (U_2_bool (MapType2Select zs1 c)) (state Heap@@10 QPMask@0)) (and (state Heap@@10 QPMask@0) (U_2_bool (MapType2Select xs2 a_2))))) (and (and (and (state Heap@@10 QPMask@0) (state Heap@@10 QPMask@0)) (and (U_2_bool (MapType2Select ys2 b_2)) (state Heap@@10 QPMask@0))) (and (and (state Heap@@10 QPMask@0) (U_2_bool (MapType2Select zs2 c))) (and (state Heap@@10 QPMask@0) (state Heap@@10 QPMask@0))))) (and (=> (= (ControlFlow 0 42) (- 0 43)) (>= q_1 NoPerm)) (=> (>= q_1 NoPerm) (and (=> (= (ControlFlow 0 42) 39) anon107_Then_correct) (=> (= (ControlFlow 0 42) 41) anon107_Else_correct)))))))))
(let ((anon106_Then_correct true))
(let ((anon105_Else_correct  (=> (forall ((x_45 T@U) (y_45 T@U) (z_45 T@U) ) (!  (=> (and (and (and (= (type x_45) RefType) (= (type y_45) RefType)) (= (type z_45) RefType)) (and (U_2_bool (MapType2Select xs11 (inv_10_0 x_45 y_45 z_45))) (and (U_2_bool (MapType2Select ys11 (inv_10_1 x_45 y_45 z_45))) (U_2_bool (MapType2Select zs11 (inv_10_2 x_45 y_45 z_45)))))) (and (and (= (inv_10_0 x_45 y_45 z_45) x_45) (= (inv_10_1 x_45 y_45 z_45) y_45)) (= (inv_10_2 x_45 y_45 z_45) z_45)))
 :qid |stdinbpl.1428:20|
 :skolemid |136|
 :pattern ( (inv_10_0 x_45 y_45 z_45) (inv_10_1 x_45 y_45 z_45) (inv_10_2 x_45 y_45 z_45))
)) (=> (and (state Heap@@10 QPMask@0) (state Heap@@10 QPMask@0)) (and (=> (= (ControlFlow 0 44) 34) anon106_Then_correct) (=> (= (ControlFlow 0 44) 42) anon106_Else_correct))))))
(let ((anon105_Then_correct true))
(let ((anon104_Else_correct  (=> (forall ((x11_1 T@U) (y11_1 T@U) (z11_1 T@U) ) (!  (=> (and (and (and (= (type x11_1) RefType) (= (type y11_1) RefType)) (= (type z11_1) RefType)) (and (U_2_bool (MapType2Select xs11 x11_1)) (and (U_2_bool (MapType2Select ys11 y11_1)) (U_2_bool (MapType2Select zs11 z11_1))))) (and (and (= (inv_10_0 x11_1 y11_1 z11_1) x11_1) (= (inv_10_1 x11_1 y11_1 z11_1) y11_1)) (= (inv_10_2 x11_1 y11_1 z11_1) z11_1)))
 :qid |stdinbpl.1410:20|
 :skolemid |135|
 :pattern ( (MapType0Select Heap@@10 null (p_11 x11_1 y11_1 z11_1)))
)) (=> (and (state Heap@@10 QPMask@0) (state Heap@@10 QPMask@0)) (and (=> (= (ControlFlow 0 45) 33) anon105_Then_correct) (=> (= (ControlFlow 0 45) 44) anon105_Else_correct))))))
(let ((anon104_Then_correct true))
(let ((anon103_Else_correct  (=> (forall ((x_43 T@U) (y_43 T@U) (z_43 T@U) ) (!  (=> (and (and (and (= (type x_43) RefType) (= (type y_43) RefType)) (= (type z_43) RefType)) (and (U_2_bool (MapType2Select xs10 (inv_9_0 x_43 y_43 z_43))) (and (U_2_bool (MapType2Select ys10 (inv_9_1 x_43 y_43 z_43))) (U_2_bool (MapType2Select zs10 (inv_9_2 x_43 y_43 z_43)))))) (<= (__iar__assume_helper_9  (and (and (U_2_bool (MapType2Select xs1 (inv_0_0 x_43 y_43 z_43))) (and (U_2_bool (MapType2Select ys1 (inv_0_1 x_43 y_43 z_43))) (U_2_bool (MapType2Select zs1 (inv_0_2 x_43 y_43 z_43))))) (and (and (= x_43 x_43) (= y_43 y_43)) (= z_43 z_43)))  (and (and (U_2_bool (MapType2Select xs2 (inv_1_0 x_43 y_43 z_43))) (and (U_2_bool (MapType2Select ys2 (inv_1_1 x_43 y_43 z_43))) (U_2_bool (MapType2Select zs2 (inv_1_2 x_43 y_43 z_43))))) (and (and (= x_43 x_43) (= y_43 y_43)) (= z_43 z_43)))  (and (and (U_2_bool (MapType2Select xs3 (inv_2_0 x_43 y_43 z_43))) (and (U_2_bool (MapType2Select ys3 (inv_2_1 x_43 y_43 z_43))) (U_2_bool (MapType2Select zs3 (inv_2_2 x_43 y_43 z_43))))) (and (and (= x_43 x_43) (= y_43 y_43)) (= z_43 z_43)))  (and (and (U_2_bool (MapType2Select xs4 (inv_3_0 x_43 y_43 z_43))) (and (U_2_bool (MapType2Select ys4 (inv_3_1 x_43 y_43 z_43))) (U_2_bool (MapType2Select zs4 (inv_3_2 x_43 y_43 z_43))))) (and (and (= x_43 x_43) (= y_43 y_43)) (= z_43 z_43)))  (and (and (U_2_bool (MapType2Select xs5 (inv_4_0 x_43 y_43 z_43))) (and (U_2_bool (MapType2Select ys5 (inv_4_1 x_43 y_43 z_43))) (U_2_bool (MapType2Select zs5 (inv_4_2 x_43 y_43 z_43))))) (and (and (= x_43 x_43) (= y_43 y_43)) (= z_43 z_43)))  (and (and (U_2_bool (MapType2Select xs6 (inv_5_0 x_43 y_43 z_43))) (and (U_2_bool (MapType2Select ys6 (inv_5_1 x_43 y_43 z_43))) (U_2_bool (MapType2Select zs6 (inv_5_2 x_43 y_43 z_43))))) (and (and (= x_43 x_43) (= y_43 y_43)) (= z_43 z_43)))  (and (and (U_2_bool (MapType2Select xs7 (inv_6_0 x_43 y_43 z_43))) (and (U_2_bool (MapType2Select ys7 (inv_6_1 x_43 y_43 z_43))) (U_2_bool (MapType2Select zs7 (inv_6_2 x_43 y_43 z_43))))) (and (and (= x_43 x_43) (= y_43 y_43)) (= z_43 z_43)))  (and (and (U_2_bool (MapType2Select xs8 (inv_7_0 x_43 y_43 z_43))) (and (U_2_bool (MapType2Select ys8 (inv_7_1 x_43 y_43 z_43))) (U_2_bool (MapType2Select zs8 (inv_7_2 x_43 y_43 z_43))))) (and (and (= x_43 x_43) (= y_43 y_43)) (= z_43 z_43)))  (and (and (U_2_bool (MapType2Select xs9 (inv_8_0 x_43 y_43 z_43))) (and (U_2_bool (MapType2Select ys9 (inv_8_1 x_43 y_43 z_43))) (U_2_bool (MapType2Select zs9 (inv_8_2 x_43 y_43 z_43))))) (and (and (= x_43 x_43) (= y_43 y_43)) (= z_43 z_43))) q_1 q_1 q_1 q_1 q_1 q_1 q_1 q_1 q_1 q_1) (U_2_real (MapType1Select QPMask@0 null (p_11 x_43 y_43 z_43)))))
 :qid |stdinbpl.1393:20|
 :skolemid |134|
 :pattern ( (inv_9_0 x_43 y_43 z_43) (inv_9_1 x_43 y_43 z_43) (inv_9_2 x_43 y_43 z_43))
)) (=> (and (state Heap@@10 QPMask@0) (state Heap@@10 QPMask@0)) (and (=> (= (ControlFlow 0 46) 32) anon104_Then_correct) (=> (= (ControlFlow 0 46) 45) anon104_Else_correct))))))
(let ((anon103_Then_correct true))
(let ((anon102_Else_correct  (=> (forall ((x_41 T@U) (y_41 T@U) (z_41 T@U) ) (!  (=> (and (and (and (= (type x_41) RefType) (= (type y_41) RefType)) (= (type z_41) RefType)) (and (U_2_bool (MapType2Select xs10 (inv_9_0 x_41 y_41 z_41))) (and (U_2_bool (MapType2Select ys10 (inv_9_1 x_41 y_41 z_41))) (U_2_bool (MapType2Select zs10 (inv_9_2 x_41 y_41 z_41)))))) (and (and (= (inv_9_0 x_41 y_41 z_41) x_41) (= (inv_9_1 x_41 y_41 z_41) y_41)) (= (inv_9_2 x_41 y_41 z_41) z_41)))
 :qid |stdinbpl.1357:20|
 :skolemid |133|
 :pattern ( (inv_9_0 x_41 y_41 z_41) (inv_9_1 x_41 y_41 z_41) (inv_9_2 x_41 y_41 z_41))
)) (=> (and (state Heap@@10 QPMask@0) (state Heap@@10 QPMask@0)) (and (=> (= (ControlFlow 0 47) 31) anon103_Then_correct) (=> (= (ControlFlow 0 47) 46) anon103_Else_correct))))))
(let ((anon102_Then_correct true))
(let ((anon101_Else_correct  (=> (forall ((x10_1 T@U) (y10_1 T@U) (z10_1 T@U) ) (!  (=> (and (and (and (= (type x10_1) RefType) (= (type y10_1) RefType)) (= (type z10_1) RefType)) (and (U_2_bool (MapType2Select xs10 x10_1)) (and (U_2_bool (MapType2Select ys10 y10_1)) (U_2_bool (MapType2Select zs10 z10_1))))) (and (and (= (inv_9_0 x10_1 y10_1 z10_1) x10_1) (= (inv_9_1 x10_1 y10_1 z10_1) y10_1)) (= (inv_9_2 x10_1 y10_1 z10_1) z10_1)))
 :qid |stdinbpl.1340:20|
 :skolemid |132|
 :pattern ( (MapType0Select Heap@@10 null (p_11 x10_1 y10_1 z10_1)))
)) (=> (and (state Heap@@10 QPMask@0) (state Heap@@10 QPMask@0)) (and (=> (= (ControlFlow 0 48) 30) anon102_Then_correct) (=> (= (ControlFlow 0 48) 47) anon102_Else_correct))))))
(let ((anon101_Then_correct true))
(let ((anon100_Else_correct  (=> (forall ((x_39 T@U) (y_39 T@U) (z_39 T@U) ) (!  (=> (and (and (and (= (type x_39) RefType) (= (type y_39) RefType)) (= (type z_39) RefType)) (and (U_2_bool (MapType2Select xs9 (inv_8_0 x_39 y_39 z_39))) (and (U_2_bool (MapType2Select ys9 (inv_8_1 x_39 y_39 z_39))) (U_2_bool (MapType2Select zs9 (inv_8_2 x_39 y_39 z_39)))))) (<= (__iar__assume_helper_8  (and (and (U_2_bool (MapType2Select xs1 (inv_0_0 x_39 y_39 z_39))) (and (U_2_bool (MapType2Select ys1 (inv_0_1 x_39 y_39 z_39))) (U_2_bool (MapType2Select zs1 (inv_0_2 x_39 y_39 z_39))))) (and (and (= x_39 x_39) (= y_39 y_39)) (= z_39 z_39)))  (and (and (U_2_bool (MapType2Select xs2 (inv_1_0 x_39 y_39 z_39))) (and (U_2_bool (MapType2Select ys2 (inv_1_1 x_39 y_39 z_39))) (U_2_bool (MapType2Select zs2 (inv_1_2 x_39 y_39 z_39))))) (and (and (= x_39 x_39) (= y_39 y_39)) (= z_39 z_39)))  (and (and (U_2_bool (MapType2Select xs3 (inv_2_0 x_39 y_39 z_39))) (and (U_2_bool (MapType2Select ys3 (inv_2_1 x_39 y_39 z_39))) (U_2_bool (MapType2Select zs3 (inv_2_2 x_39 y_39 z_39))))) (and (and (= x_39 x_39) (= y_39 y_39)) (= z_39 z_39)))  (and (and (U_2_bool (MapType2Select xs4 (inv_3_0 x_39 y_39 z_39))) (and (U_2_bool (MapType2Select ys4 (inv_3_1 x_39 y_39 z_39))) (U_2_bool (MapType2Select zs4 (inv_3_2 x_39 y_39 z_39))))) (and (and (= x_39 x_39) (= y_39 y_39)) (= z_39 z_39)))  (and (and (U_2_bool (MapType2Select xs5 (inv_4_0 x_39 y_39 z_39))) (and (U_2_bool (MapType2Select ys5 (inv_4_1 x_39 y_39 z_39))) (U_2_bool (MapType2Select zs5 (inv_4_2 x_39 y_39 z_39))))) (and (and (= x_39 x_39) (= y_39 y_39)) (= z_39 z_39)))  (and (and (U_2_bool (MapType2Select xs6 (inv_5_0 x_39 y_39 z_39))) (and (U_2_bool (MapType2Select ys6 (inv_5_1 x_39 y_39 z_39))) (U_2_bool (MapType2Select zs6 (inv_5_2 x_39 y_39 z_39))))) (and (and (= x_39 x_39) (= y_39 y_39)) (= z_39 z_39)))  (and (and (U_2_bool (MapType2Select xs7 (inv_6_0 x_39 y_39 z_39))) (and (U_2_bool (MapType2Select ys7 (inv_6_1 x_39 y_39 z_39))) (U_2_bool (MapType2Select zs7 (inv_6_2 x_39 y_39 z_39))))) (and (and (= x_39 x_39) (= y_39 y_39)) (= z_39 z_39)))  (and (and (U_2_bool (MapType2Select xs8 (inv_7_0 x_39 y_39 z_39))) (and (U_2_bool (MapType2Select ys8 (inv_7_1 x_39 y_39 z_39))) (U_2_bool (MapType2Select zs8 (inv_7_2 x_39 y_39 z_39))))) (and (and (= x_39 x_39) (= y_39 y_39)) (= z_39 z_39))) q_1 q_1 q_1 q_1 q_1 q_1 q_1 q_1 q_1) (U_2_real (MapType1Select QPMask@0 null (p_11 x_39 y_39 z_39)))))
 :qid |stdinbpl.1323:20|
 :skolemid |131|
 :pattern ( (inv_8_0 x_39 y_39 z_39) (inv_8_1 x_39 y_39 z_39) (inv_8_2 x_39 y_39 z_39))
)) (=> (and (state Heap@@10 QPMask@0) (state Heap@@10 QPMask@0)) (and (=> (= (ControlFlow 0 49) 29) anon101_Then_correct) (=> (= (ControlFlow 0 49) 48) anon101_Else_correct))))))
(let ((anon100_Then_correct true))
(let ((anon99_Else_correct  (=> (forall ((x_37 T@U) (y_37 T@U) (z_37 T@U) ) (!  (=> (and (and (and (= (type x_37) RefType) (= (type y_37) RefType)) (= (type z_37) RefType)) (and (U_2_bool (MapType2Select xs9 (inv_8_0 x_37 y_37 z_37))) (and (U_2_bool (MapType2Select ys9 (inv_8_1 x_37 y_37 z_37))) (U_2_bool (MapType2Select zs9 (inv_8_2 x_37 y_37 z_37)))))) (and (and (= (inv_8_0 x_37 y_37 z_37) x_37) (= (inv_8_1 x_37 y_37 z_37) y_37)) (= (inv_8_2 x_37 y_37 z_37) z_37)))
 :qid |stdinbpl.1289:20|
 :skolemid |130|
 :pattern ( (inv_8_0 x_37 y_37 z_37) (inv_8_1 x_37 y_37 z_37) (inv_8_2 x_37 y_37 z_37))
)) (=> (and (state Heap@@10 QPMask@0) (state Heap@@10 QPMask@0)) (and (=> (= (ControlFlow 0 50) 28) anon100_Then_correct) (=> (= (ControlFlow 0 50) 49) anon100_Else_correct))))))
(let ((anon99_Then_correct true))
(let ((anon98_Else_correct  (=> (forall ((x9_1 T@U) (y9_1 T@U) (z9_1 T@U) ) (!  (=> (and (and (and (= (type x9_1) RefType) (= (type y9_1) RefType)) (= (type z9_1) RefType)) (and (U_2_bool (MapType2Select xs9 x9_1)) (and (U_2_bool (MapType2Select ys9 y9_1)) (U_2_bool (MapType2Select zs9 z9_1))))) (and (and (= (inv_8_0 x9_1 y9_1 z9_1) x9_1) (= (inv_8_1 x9_1 y9_1 z9_1) y9_1)) (= (inv_8_2 x9_1 y9_1 z9_1) z9_1)))
 :qid |stdinbpl.1272:20|
 :skolemid |129|
 :pattern ( (MapType0Select Heap@@10 null (p_11 x9_1 y9_1 z9_1)))
)) (=> (and (state Heap@@10 QPMask@0) (state Heap@@10 QPMask@0)) (and (=> (= (ControlFlow 0 51) 27) anon99_Then_correct) (=> (= (ControlFlow 0 51) 50) anon99_Else_correct))))))
(let ((anon98_Then_correct true))
(let ((anon97_Else_correct  (=> (forall ((x_35 T@U) (y_35 T@U) (z_35 T@U) ) (!  (=> (and (and (and (= (type x_35) RefType) (= (type y_35) RefType)) (= (type z_35) RefType)) (and (U_2_bool (MapType2Select xs8 (inv_7_0 x_35 y_35 z_35))) (and (U_2_bool (MapType2Select ys8 (inv_7_1 x_35 y_35 z_35))) (U_2_bool (MapType2Select zs8 (inv_7_2 x_35 y_35 z_35)))))) (<= (__iar__assume_helper_7  (and (and (U_2_bool (MapType2Select xs1 (inv_0_0 x_35 y_35 z_35))) (and (U_2_bool (MapType2Select ys1 (inv_0_1 x_35 y_35 z_35))) (U_2_bool (MapType2Select zs1 (inv_0_2 x_35 y_35 z_35))))) (and (and (= x_35 x_35) (= y_35 y_35)) (= z_35 z_35)))  (and (and (U_2_bool (MapType2Select xs2 (inv_1_0 x_35 y_35 z_35))) (and (U_2_bool (MapType2Select ys2 (inv_1_1 x_35 y_35 z_35))) (U_2_bool (MapType2Select zs2 (inv_1_2 x_35 y_35 z_35))))) (and (and (= x_35 x_35) (= y_35 y_35)) (= z_35 z_35)))  (and (and (U_2_bool (MapType2Select xs3 (inv_2_0 x_35 y_35 z_35))) (and (U_2_bool (MapType2Select ys3 (inv_2_1 x_35 y_35 z_35))) (U_2_bool (MapType2Select zs3 (inv_2_2 x_35 y_35 z_35))))) (and (and (= x_35 x_35) (= y_35 y_35)) (= z_35 z_35)))  (and (and (U_2_bool (MapType2Select xs4 (inv_3_0 x_35 y_35 z_35))) (and (U_2_bool (MapType2Select ys4 (inv_3_1 x_35 y_35 z_35))) (U_2_bool (MapType2Select zs4 (inv_3_2 x_35 y_35 z_35))))) (and (and (= x_35 x_35) (= y_35 y_35)) (= z_35 z_35)))  (and (and (U_2_bool (MapType2Select xs5 (inv_4_0 x_35 y_35 z_35))) (and (U_2_bool (MapType2Select ys5 (inv_4_1 x_35 y_35 z_35))) (U_2_bool (MapType2Select zs5 (inv_4_2 x_35 y_35 z_35))))) (and (and (= x_35 x_35) (= y_35 y_35)) (= z_35 z_35)))  (and (and (U_2_bool (MapType2Select xs6 (inv_5_0 x_35 y_35 z_35))) (and (U_2_bool (MapType2Select ys6 (inv_5_1 x_35 y_35 z_35))) (U_2_bool (MapType2Select zs6 (inv_5_2 x_35 y_35 z_35))))) (and (and (= x_35 x_35) (= y_35 y_35)) (= z_35 z_35)))  (and (and (U_2_bool (MapType2Select xs7 (inv_6_0 x_35 y_35 z_35))) (and (U_2_bool (MapType2Select ys7 (inv_6_1 x_35 y_35 z_35))) (U_2_bool (MapType2Select zs7 (inv_6_2 x_35 y_35 z_35))))) (and (and (= x_35 x_35) (= y_35 y_35)) (= z_35 z_35))) q_1 q_1 q_1 q_1 q_1 q_1 q_1 q_1) (U_2_real (MapType1Select QPMask@0 null (p_11 x_35 y_35 z_35)))))
 :qid |stdinbpl.1255:20|
 :skolemid |128|
 :pattern ( (inv_7_0 x_35 y_35 z_35) (inv_7_1 x_35 y_35 z_35) (inv_7_2 x_35 y_35 z_35))
)) (=> (and (state Heap@@10 QPMask@0) (state Heap@@10 QPMask@0)) (and (=> (= (ControlFlow 0 52) 26) anon98_Then_correct) (=> (= (ControlFlow 0 52) 51) anon98_Else_correct))))))
(let ((anon97_Then_correct true))
(let ((anon96_Else_correct  (=> (forall ((x_33 T@U) (y_33 T@U) (z_33 T@U) ) (!  (=> (and (and (and (= (type x_33) RefType) (= (type y_33) RefType)) (= (type z_33) RefType)) (and (U_2_bool (MapType2Select xs8 (inv_7_0 x_33 y_33 z_33))) (and (U_2_bool (MapType2Select ys8 (inv_7_1 x_33 y_33 z_33))) (U_2_bool (MapType2Select zs8 (inv_7_2 x_33 y_33 z_33)))))) (and (and (= (inv_7_0 x_33 y_33 z_33) x_33) (= (inv_7_1 x_33 y_33 z_33) y_33)) (= (inv_7_2 x_33 y_33 z_33) z_33)))
 :qid |stdinbpl.1223:20|
 :skolemid |127|
 :pattern ( (inv_7_0 x_33 y_33 z_33) (inv_7_1 x_33 y_33 z_33) (inv_7_2 x_33 y_33 z_33))
)) (=> (and (state Heap@@10 QPMask@0) (state Heap@@10 QPMask@0)) (and (=> (= (ControlFlow 0 53) 25) anon97_Then_correct) (=> (= (ControlFlow 0 53) 52) anon97_Else_correct))))))
(let ((anon96_Then_correct true))
(let ((anon95_Else_correct  (=> (forall ((x8_1 T@U) (y8_1 T@U) (z8_1 T@U) ) (!  (=> (and (and (and (= (type x8_1) RefType) (= (type y8_1) RefType)) (= (type z8_1) RefType)) (and (U_2_bool (MapType2Select xs8 x8_1)) (and (U_2_bool (MapType2Select ys8 y8_1)) (U_2_bool (MapType2Select zs8 z8_1))))) (and (and (= (inv_7_0 x8_1 y8_1 z8_1) x8_1) (= (inv_7_1 x8_1 y8_1 z8_1) y8_1)) (= (inv_7_2 x8_1 y8_1 z8_1) z8_1)))
 :qid |stdinbpl.1206:20|
 :skolemid |126|
 :pattern ( (MapType0Select Heap@@10 null (p_11 x8_1 y8_1 z8_1)))
)) (=> (and (state Heap@@10 QPMask@0) (state Heap@@10 QPMask@0)) (and (=> (= (ControlFlow 0 54) 24) anon96_Then_correct) (=> (= (ControlFlow 0 54) 53) anon96_Else_correct))))))
(let ((anon95_Then_correct true))
(let ((anon94_Else_correct  (=> (forall ((x_31 T@U) (y_31 T@U) (z_31 T@U) ) (!  (=> (and (and (and (= (type x_31) RefType) (= (type y_31) RefType)) (= (type z_31) RefType)) (and (U_2_bool (MapType2Select xs7 (inv_6_0 x_31 y_31 z_31))) (and (U_2_bool (MapType2Select ys7 (inv_6_1 x_31 y_31 z_31))) (U_2_bool (MapType2Select zs7 (inv_6_2 x_31 y_31 z_31)))))) (<= (__iar__assume_helper_6  (and (and (U_2_bool (MapType2Select xs1 (inv_0_0 x_31 y_31 z_31))) (and (U_2_bool (MapType2Select ys1 (inv_0_1 x_31 y_31 z_31))) (U_2_bool (MapType2Select zs1 (inv_0_2 x_31 y_31 z_31))))) (and (and (= x_31 x_31) (= y_31 y_31)) (= z_31 z_31)))  (and (and (U_2_bool (MapType2Select xs2 (inv_1_0 x_31 y_31 z_31))) (and (U_2_bool (MapType2Select ys2 (inv_1_1 x_31 y_31 z_31))) (U_2_bool (MapType2Select zs2 (inv_1_2 x_31 y_31 z_31))))) (and (and (= x_31 x_31) (= y_31 y_31)) (= z_31 z_31)))  (and (and (U_2_bool (MapType2Select xs3 (inv_2_0 x_31 y_31 z_31))) (and (U_2_bool (MapType2Select ys3 (inv_2_1 x_31 y_31 z_31))) (U_2_bool (MapType2Select zs3 (inv_2_2 x_31 y_31 z_31))))) (and (and (= x_31 x_31) (= y_31 y_31)) (= z_31 z_31)))  (and (and (U_2_bool (MapType2Select xs4 (inv_3_0 x_31 y_31 z_31))) (and (U_2_bool (MapType2Select ys4 (inv_3_1 x_31 y_31 z_31))) (U_2_bool (MapType2Select zs4 (inv_3_2 x_31 y_31 z_31))))) (and (and (= x_31 x_31) (= y_31 y_31)) (= z_31 z_31)))  (and (and (U_2_bool (MapType2Select xs5 (inv_4_0 x_31 y_31 z_31))) (and (U_2_bool (MapType2Select ys5 (inv_4_1 x_31 y_31 z_31))) (U_2_bool (MapType2Select zs5 (inv_4_2 x_31 y_31 z_31))))) (and (and (= x_31 x_31) (= y_31 y_31)) (= z_31 z_31)))  (and (and (U_2_bool (MapType2Select xs6 (inv_5_0 x_31 y_31 z_31))) (and (U_2_bool (MapType2Select ys6 (inv_5_1 x_31 y_31 z_31))) (U_2_bool (MapType2Select zs6 (inv_5_2 x_31 y_31 z_31))))) (and (and (= x_31 x_31) (= y_31 y_31)) (= z_31 z_31))) q_1 q_1 q_1 q_1 q_1 q_1 q_1) (U_2_real (MapType1Select QPMask@0 null (p_11 x_31 y_31 z_31)))))
 :qid |stdinbpl.1189:20|
 :skolemid |125|
 :pattern ( (inv_6_0 x_31 y_31 z_31) (inv_6_1 x_31 y_31 z_31) (inv_6_2 x_31 y_31 z_31))
)) (=> (and (state Heap@@10 QPMask@0) (state Heap@@10 QPMask@0)) (and (=> (= (ControlFlow 0 55) 23) anon95_Then_correct) (=> (= (ControlFlow 0 55) 54) anon95_Else_correct))))))
(let ((anon94_Then_correct true))
(let ((anon93_Else_correct  (=> (forall ((x_29 T@U) (y_29 T@U) (z_29 T@U) ) (!  (=> (and (and (and (= (type x_29) RefType) (= (type y_29) RefType)) (= (type z_29) RefType)) (and (U_2_bool (MapType2Select xs7 (inv_6_0 x_29 y_29 z_29))) (and (U_2_bool (MapType2Select ys7 (inv_6_1 x_29 y_29 z_29))) (U_2_bool (MapType2Select zs7 (inv_6_2 x_29 y_29 z_29)))))) (and (and (= (inv_6_0 x_29 y_29 z_29) x_29) (= (inv_6_1 x_29 y_29 z_29) y_29)) (= (inv_6_2 x_29 y_29 z_29) z_29)))
 :qid |stdinbpl.1159:20|
 :skolemid |124|
 :pattern ( (inv_6_0 x_29 y_29 z_29) (inv_6_1 x_29 y_29 z_29) (inv_6_2 x_29 y_29 z_29))
)) (=> (and (state Heap@@10 QPMask@0) (state Heap@@10 QPMask@0)) (and (=> (= (ControlFlow 0 56) 22) anon94_Then_correct) (=> (= (ControlFlow 0 56) 55) anon94_Else_correct))))))
(let ((anon93_Then_correct true))
(let ((anon92_Else_correct  (=> (forall ((x7_1 T@U) (y7_1 T@U) (z7_1 T@U) ) (!  (=> (and (and (and (= (type x7_1) RefType) (= (type y7_1) RefType)) (= (type z7_1) RefType)) (and (U_2_bool (MapType2Select xs7 x7_1)) (and (U_2_bool (MapType2Select ys7 y7_1)) (U_2_bool (MapType2Select zs7 z7_1))))) (and (and (= (inv_6_0 x7_1 y7_1 z7_1) x7_1) (= (inv_6_1 x7_1 y7_1 z7_1) y7_1)) (= (inv_6_2 x7_1 y7_1 z7_1) z7_1)))
 :qid |stdinbpl.1142:20|
 :skolemid |123|
 :pattern ( (MapType0Select Heap@@10 null (p_11 x7_1 y7_1 z7_1)))
)) (=> (and (state Heap@@10 QPMask@0) (state Heap@@10 QPMask@0)) (and (=> (= (ControlFlow 0 57) 21) anon93_Then_correct) (=> (= (ControlFlow 0 57) 56) anon93_Else_correct))))))
(let ((anon92_Then_correct true))
(let ((anon91_Else_correct  (=> (forall ((x_27 T@U) (y_27 T@U) (z_27 T@U) ) (!  (=> (and (and (and (= (type x_27) RefType) (= (type y_27) RefType)) (= (type z_27) RefType)) (and (U_2_bool (MapType2Select xs6 (inv_5_0 x_27 y_27 z_27))) (and (U_2_bool (MapType2Select ys6 (inv_5_1 x_27 y_27 z_27))) (U_2_bool (MapType2Select zs6 (inv_5_2 x_27 y_27 z_27)))))) (<= (__iar__assume_helper_5  (and (and (U_2_bool (MapType2Select xs1 (inv_0_0 x_27 y_27 z_27))) (and (U_2_bool (MapType2Select ys1 (inv_0_1 x_27 y_27 z_27))) (U_2_bool (MapType2Select zs1 (inv_0_2 x_27 y_27 z_27))))) (and (and (= x_27 x_27) (= y_27 y_27)) (= z_27 z_27)))  (and (and (U_2_bool (MapType2Select xs2 (inv_1_0 x_27 y_27 z_27))) (and (U_2_bool (MapType2Select ys2 (inv_1_1 x_27 y_27 z_27))) (U_2_bool (MapType2Select zs2 (inv_1_2 x_27 y_27 z_27))))) (and (and (= x_27 x_27) (= y_27 y_27)) (= z_27 z_27)))  (and (and (U_2_bool (MapType2Select xs3 (inv_2_0 x_27 y_27 z_27))) (and (U_2_bool (MapType2Select ys3 (inv_2_1 x_27 y_27 z_27))) (U_2_bool (MapType2Select zs3 (inv_2_2 x_27 y_27 z_27))))) (and (and (= x_27 x_27) (= y_27 y_27)) (= z_27 z_27)))  (and (and (U_2_bool (MapType2Select xs4 (inv_3_0 x_27 y_27 z_27))) (and (U_2_bool (MapType2Select ys4 (inv_3_1 x_27 y_27 z_27))) (U_2_bool (MapType2Select zs4 (inv_3_2 x_27 y_27 z_27))))) (and (and (= x_27 x_27) (= y_27 y_27)) (= z_27 z_27)))  (and (and (U_2_bool (MapType2Select xs5 (inv_4_0 x_27 y_27 z_27))) (and (U_2_bool (MapType2Select ys5 (inv_4_1 x_27 y_27 z_27))) (U_2_bool (MapType2Select zs5 (inv_4_2 x_27 y_27 z_27))))) (and (and (= x_27 x_27) (= y_27 y_27)) (= z_27 z_27))) q_1 q_1 q_1 q_1 q_1 q_1) (U_2_real (MapType1Select QPMask@0 null (p_11 x_27 y_27 z_27)))))
 :qid |stdinbpl.1125:20|
 :skolemid |122|
 :pattern ( (inv_5_0 x_27 y_27 z_27) (inv_5_1 x_27 y_27 z_27) (inv_5_2 x_27 y_27 z_27))
)) (=> (and (state Heap@@10 QPMask@0) (state Heap@@10 QPMask@0)) (and (=> (= (ControlFlow 0 58) 20) anon92_Then_correct) (=> (= (ControlFlow 0 58) 57) anon92_Else_correct))))))
(let ((anon91_Then_correct true))
(let ((anon90_Else_correct  (=> (forall ((x_25 T@U) (y_25 T@U) (z_25 T@U) ) (!  (=> (and (and (and (= (type x_25) RefType) (= (type y_25) RefType)) (= (type z_25) RefType)) (and (U_2_bool (MapType2Select xs6 (inv_5_0 x_25 y_25 z_25))) (and (U_2_bool (MapType2Select ys6 (inv_5_1 x_25 y_25 z_25))) (U_2_bool (MapType2Select zs6 (inv_5_2 x_25 y_25 z_25)))))) (and (and (= (inv_5_0 x_25 y_25 z_25) x_25) (= (inv_5_1 x_25 y_25 z_25) y_25)) (= (inv_5_2 x_25 y_25 z_25) z_25)))
 :qid |stdinbpl.1097:20|
 :skolemid |121|
 :pattern ( (inv_5_0 x_25 y_25 z_25) (inv_5_1 x_25 y_25 z_25) (inv_5_2 x_25 y_25 z_25))
)) (=> (and (state Heap@@10 QPMask@0) (state Heap@@10 QPMask@0)) (and (=> (= (ControlFlow 0 59) 19) anon91_Then_correct) (=> (= (ControlFlow 0 59) 58) anon91_Else_correct))))))
(let ((anon90_Then_correct true))
(let ((anon89_Else_correct  (=> (forall ((x6_1 T@U) (y6_1 T@U) (z6_1 T@U) ) (!  (=> (and (and (and (= (type x6_1) RefType) (= (type y6_1) RefType)) (= (type z6_1) RefType)) (and (U_2_bool (MapType2Select xs6 x6_1)) (and (U_2_bool (MapType2Select ys6 y6_1)) (U_2_bool (MapType2Select zs6 z6_1))))) (and (and (= (inv_5_0 x6_1 y6_1 z6_1) x6_1) (= (inv_5_1 x6_1 y6_1 z6_1) y6_1)) (= (inv_5_2 x6_1 y6_1 z6_1) z6_1)))
 :qid |stdinbpl.1080:20|
 :skolemid |120|
 :pattern ( (MapType0Select Heap@@10 null (p_11 x6_1 y6_1 z6_1)))
)) (=> (and (state Heap@@10 QPMask@0) (state Heap@@10 QPMask@0)) (and (=> (= (ControlFlow 0 60) 18) anon90_Then_correct) (=> (= (ControlFlow 0 60) 59) anon90_Else_correct))))))
(let ((anon89_Then_correct true))
(let ((anon88_Else_correct  (=> (forall ((x_23 T@U) (y_23 T@U) (z_23 T@U) ) (!  (=> (and (and (and (= (type x_23) RefType) (= (type y_23) RefType)) (= (type z_23) RefType)) (and (U_2_bool (MapType2Select xs5 (inv_4_0 x_23 y_23 z_23))) (and (U_2_bool (MapType2Select ys5 (inv_4_1 x_23 y_23 z_23))) (U_2_bool (MapType2Select zs5 (inv_4_2 x_23 y_23 z_23)))))) (<= (__iar__assume_helper_4  (and (and (U_2_bool (MapType2Select xs1 (inv_0_0 x_23 y_23 z_23))) (and (U_2_bool (MapType2Select ys1 (inv_0_1 x_23 y_23 z_23))) (U_2_bool (MapType2Select zs1 (inv_0_2 x_23 y_23 z_23))))) (and (and (= x_23 x_23) (= y_23 y_23)) (= z_23 z_23)))  (and (and (U_2_bool (MapType2Select xs2 (inv_1_0 x_23 y_23 z_23))) (and (U_2_bool (MapType2Select ys2 (inv_1_1 x_23 y_23 z_23))) (U_2_bool (MapType2Select zs2 (inv_1_2 x_23 y_23 z_23))))) (and (and (= x_23 x_23) (= y_23 y_23)) (= z_23 z_23)))  (and (and (U_2_bool (MapType2Select xs3 (inv_2_0 x_23 y_23 z_23))) (and (U_2_bool (MapType2Select ys3 (inv_2_1 x_23 y_23 z_23))) (U_2_bool (MapType2Select zs3 (inv_2_2 x_23 y_23 z_23))))) (and (and (= x_23 x_23) (= y_23 y_23)) (= z_23 z_23)))  (and (and (U_2_bool (MapType2Select xs4 (inv_3_0 x_23 y_23 z_23))) (and (U_2_bool (MapType2Select ys4 (inv_3_1 x_23 y_23 z_23))) (U_2_bool (MapType2Select zs4 (inv_3_2 x_23 y_23 z_23))))) (and (and (= x_23 x_23) (= y_23 y_23)) (= z_23 z_23))) q_1 q_1 q_1 q_1 q_1) (U_2_real (MapType1Select QPMask@0 null (p_11 x_23 y_23 z_23)))))
 :qid |stdinbpl.1063:20|
 :skolemid |119|
 :pattern ( (inv_4_0 x_23 y_23 z_23) (inv_4_1 x_23 y_23 z_23) (inv_4_2 x_23 y_23 z_23))
)) (=> (and (state Heap@@10 QPMask@0) (state Heap@@10 QPMask@0)) (and (=> (= (ControlFlow 0 61) 17) anon89_Then_correct) (=> (= (ControlFlow 0 61) 60) anon89_Else_correct))))))
(let ((anon88_Then_correct true))
(let ((anon87_Else_correct  (=> (forall ((x_21 T@U) (y_21 T@U) (z_21 T@U) ) (!  (=> (and (and (and (= (type x_21) RefType) (= (type y_21) RefType)) (= (type z_21) RefType)) (and (U_2_bool (MapType2Select xs5 (inv_4_0 x_21 y_21 z_21))) (and (U_2_bool (MapType2Select ys5 (inv_4_1 x_21 y_21 z_21))) (U_2_bool (MapType2Select zs5 (inv_4_2 x_21 y_21 z_21)))))) (and (and (= (inv_4_0 x_21 y_21 z_21) x_21) (= (inv_4_1 x_21 y_21 z_21) y_21)) (= (inv_4_2 x_21 y_21 z_21) z_21)))
 :qid |stdinbpl.1037:20|
 :skolemid |118|
 :pattern ( (inv_4_0 x_21 y_21 z_21) (inv_4_1 x_21 y_21 z_21) (inv_4_2 x_21 y_21 z_21))
)) (=> (and (state Heap@@10 QPMask@0) (state Heap@@10 QPMask@0)) (and (=> (= (ControlFlow 0 62) 16) anon88_Then_correct) (=> (= (ControlFlow 0 62) 61) anon88_Else_correct))))))
(let ((anon87_Then_correct true))
(let ((anon86_Else_correct  (=> (forall ((x5_1 T@U) (y5_1 T@U) (z5_1 T@U) ) (!  (=> (and (and (and (= (type x5_1) RefType) (= (type y5_1) RefType)) (= (type z5_1) RefType)) (and (U_2_bool (MapType2Select xs5 x5_1)) (and (U_2_bool (MapType2Select ys5 y5_1)) (U_2_bool (MapType2Select zs5 z5_1))))) (and (and (= (inv_4_0 x5_1 y5_1 z5_1) x5_1) (= (inv_4_1 x5_1 y5_1 z5_1) y5_1)) (= (inv_4_2 x5_1 y5_1 z5_1) z5_1)))
 :qid |stdinbpl.1020:20|
 :skolemid |117|
 :pattern ( (MapType0Select Heap@@10 null (p_11 x5_1 y5_1 z5_1)))
)) (=> (and (state Heap@@10 QPMask@0) (state Heap@@10 QPMask@0)) (and (=> (= (ControlFlow 0 63) 15) anon87_Then_correct) (=> (= (ControlFlow 0 63) 62) anon87_Else_correct))))))
(let ((anon86_Then_correct true))
(let ((anon85_Else_correct  (=> (forall ((x_19 T@U) (y_19 T@U) (z_19 T@U) ) (!  (=> (and (and (and (= (type x_19) RefType) (= (type y_19) RefType)) (= (type z_19) RefType)) (and (U_2_bool (MapType2Select xs4 (inv_3_0 x_19 y_19 z_19))) (and (U_2_bool (MapType2Select ys4 (inv_3_1 x_19 y_19 z_19))) (U_2_bool (MapType2Select zs4 (inv_3_2 x_19 y_19 z_19)))))) (<= (__iar__assume_helper_3  (and (and (U_2_bool (MapType2Select xs1 (inv_0_0 x_19 y_19 z_19))) (and (U_2_bool (MapType2Select ys1 (inv_0_1 x_19 y_19 z_19))) (U_2_bool (MapType2Select zs1 (inv_0_2 x_19 y_19 z_19))))) (and (and (= x_19 x_19) (= y_19 y_19)) (= z_19 z_19)))  (and (and (U_2_bool (MapType2Select xs2 (inv_1_0 x_19 y_19 z_19))) (and (U_2_bool (MapType2Select ys2 (inv_1_1 x_19 y_19 z_19))) (U_2_bool (MapType2Select zs2 (inv_1_2 x_19 y_19 z_19))))) (and (and (= x_19 x_19) (= y_19 y_19)) (= z_19 z_19)))  (and (and (U_2_bool (MapType2Select xs3 (inv_2_0 x_19 y_19 z_19))) (and (U_2_bool (MapType2Select ys3 (inv_2_1 x_19 y_19 z_19))) (U_2_bool (MapType2Select zs3 (inv_2_2 x_19 y_19 z_19))))) (and (and (= x_19 x_19) (= y_19 y_19)) (= z_19 z_19))) q_1 q_1 q_1 q_1) (U_2_real (MapType1Select QPMask@0 null (p_11 x_19 y_19 z_19)))))
 :qid |stdinbpl.1003:20|
 :skolemid |116|
 :pattern ( (inv_3_0 x_19 y_19 z_19) (inv_3_1 x_19 y_19 z_19) (inv_3_2 x_19 y_19 z_19))
)) (=> (and (state Heap@@10 QPMask@0) (state Heap@@10 QPMask@0)) (and (=> (= (ControlFlow 0 64) 14) anon86_Then_correct) (=> (= (ControlFlow 0 64) 63) anon86_Else_correct))))))
(let ((anon85_Then_correct true))
(let ((anon84_Else_correct  (=> (forall ((x_17 T@U) (y_17 T@U) (z_17 T@U) ) (!  (=> (and (and (and (= (type x_17) RefType) (= (type y_17) RefType)) (= (type z_17) RefType)) (and (U_2_bool (MapType2Select xs4 (inv_3_0 x_17 y_17 z_17))) (and (U_2_bool (MapType2Select ys4 (inv_3_1 x_17 y_17 z_17))) (U_2_bool (MapType2Select zs4 (inv_3_2 x_17 y_17 z_17)))))) (and (and (= (inv_3_0 x_17 y_17 z_17) x_17) (= (inv_3_1 x_17 y_17 z_17) y_17)) (= (inv_3_2 x_17 y_17 z_17) z_17)))
 :qid |stdinbpl.979:20|
 :skolemid |115|
 :pattern ( (inv_3_0 x_17 y_17 z_17) (inv_3_1 x_17 y_17 z_17) (inv_3_2 x_17 y_17 z_17))
)) (=> (and (state Heap@@10 QPMask@0) (state Heap@@10 QPMask@0)) (and (=> (= (ControlFlow 0 65) 13) anon85_Then_correct) (=> (= (ControlFlow 0 65) 64) anon85_Else_correct))))))
(let ((anon84_Then_correct true))
(let ((anon83_Else_correct  (=> (forall ((x4_1 T@U) (y4_1 T@U) (z4_1 T@U) ) (!  (=> (and (and (and (= (type x4_1) RefType) (= (type y4_1) RefType)) (= (type z4_1) RefType)) (and (U_2_bool (MapType2Select xs4 x4_1)) (and (U_2_bool (MapType2Select ys4 y4_1)) (U_2_bool (MapType2Select zs4 z4_1))))) (and (and (= (inv_3_0 x4_1 y4_1 z4_1) x4_1) (= (inv_3_1 x4_1 y4_1 z4_1) y4_1)) (= (inv_3_2 x4_1 y4_1 z4_1) z4_1)))
 :qid |stdinbpl.962:20|
 :skolemid |114|
 :pattern ( (MapType0Select Heap@@10 null (p_11 x4_1 y4_1 z4_1)))
)) (=> (and (state Heap@@10 QPMask@0) (state Heap@@10 QPMask@0)) (and (=> (= (ControlFlow 0 66) 12) anon84_Then_correct) (=> (= (ControlFlow 0 66) 65) anon84_Else_correct))))))
(let ((anon83_Then_correct true))
(let ((anon82_Else_correct  (=> (forall ((x_15 T@U) (y_15 T@U) (z_15 T@U) ) (!  (=> (and (and (and (= (type x_15) RefType) (= (type y_15) RefType)) (= (type z_15) RefType)) (and (U_2_bool (MapType2Select xs3 (inv_2_0 x_15 y_15 z_15))) (and (U_2_bool (MapType2Select ys3 (inv_2_1 x_15 y_15 z_15))) (U_2_bool (MapType2Select zs3 (inv_2_2 x_15 y_15 z_15)))))) (<= (__iar__assume_helper_2  (and (and (U_2_bool (MapType2Select xs1 (inv_0_0 x_15 y_15 z_15))) (and (U_2_bool (MapType2Select ys1 (inv_0_1 x_15 y_15 z_15))) (U_2_bool (MapType2Select zs1 (inv_0_2 x_15 y_15 z_15))))) (and (and (= x_15 x_15) (= y_15 y_15)) (= z_15 z_15)))  (and (and (U_2_bool (MapType2Select xs2 (inv_1_0 x_15 y_15 z_15))) (and (U_2_bool (MapType2Select ys2 (inv_1_1 x_15 y_15 z_15))) (U_2_bool (MapType2Select zs2 (inv_1_2 x_15 y_15 z_15))))) (and (and (= x_15 x_15) (= y_15 y_15)) (= z_15 z_15))) q_1 q_1 q_1) (U_2_real (MapType1Select QPMask@0 null (p_11 x_15 y_15 z_15)))))
 :qid |stdinbpl.945:20|
 :skolemid |113|
 :pattern ( (inv_2_0 x_15 y_15 z_15) (inv_2_1 x_15 y_15 z_15) (inv_2_2 x_15 y_15 z_15))
)) (=> (and (state Heap@@10 QPMask@0) (state Heap@@10 QPMask@0)) (and (=> (= (ControlFlow 0 67) 11) anon83_Then_correct) (=> (= (ControlFlow 0 67) 66) anon83_Else_correct))))))
(let ((anon82_Then_correct true))
(let ((anon81_Else_correct  (=> (forall ((x_13 T@U) (y_13 T@U) (z_13 T@U) ) (!  (=> (and (and (and (= (type x_13) RefType) (= (type y_13) RefType)) (= (type z_13) RefType)) (and (U_2_bool (MapType2Select xs3 (inv_2_0 x_13 y_13 z_13))) (and (U_2_bool (MapType2Select ys3 (inv_2_1 x_13 y_13 z_13))) (U_2_bool (MapType2Select zs3 (inv_2_2 x_13 y_13 z_13)))))) (and (and (= (inv_2_0 x_13 y_13 z_13) x_13) (= (inv_2_1 x_13 y_13 z_13) y_13)) (= (inv_2_2 x_13 y_13 z_13) z_13)))
 :qid |stdinbpl.923:20|
 :skolemid |112|
 :pattern ( (inv_2_0 x_13 y_13 z_13) (inv_2_1 x_13 y_13 z_13) (inv_2_2 x_13 y_13 z_13))
)) (=> (and (state Heap@@10 QPMask@0) (state Heap@@10 QPMask@0)) (and (=> (= (ControlFlow 0 68) 10) anon82_Then_correct) (=> (= (ControlFlow 0 68) 67) anon82_Else_correct))))))
(let ((anon81_Then_correct true))
(let ((anon80_Else_correct  (=> (forall ((x3_1 T@U) (y3_1 T@U) (z3_1 T@U) ) (!  (=> (and (and (and (= (type x3_1) RefType) (= (type y3_1) RefType)) (= (type z3_1) RefType)) (and (U_2_bool (MapType2Select xs3 x3_1)) (and (U_2_bool (MapType2Select ys3 y3_1)) (U_2_bool (MapType2Select zs3 z3_1))))) (and (and (= (inv_2_0 x3_1 y3_1 z3_1) x3_1) (= (inv_2_1 x3_1 y3_1 z3_1) y3_1)) (= (inv_2_2 x3_1 y3_1 z3_1) z3_1)))
 :qid |stdinbpl.906:20|
 :skolemid |111|
 :pattern ( (MapType0Select Heap@@10 null (p_11 x3_1 y3_1 z3_1)))
)) (=> (and (state Heap@@10 QPMask@0) (state Heap@@10 QPMask@0)) (and (=> (= (ControlFlow 0 69) 9) anon81_Then_correct) (=> (= (ControlFlow 0 69) 68) anon81_Else_correct))))))
(let ((anon80_Then_correct true))
(let ((anon79_Else_correct  (=> (forall ((x_11 T@U) (y_11 T@U) (z_11 T@U) ) (!  (=> (and (and (and (= (type x_11) RefType) (= (type y_11) RefType)) (= (type z_11) RefType)) (and (U_2_bool (MapType2Select xs2 (inv_1_0 x_11 y_11 z_11))) (and (U_2_bool (MapType2Select ys2 (inv_1_1 x_11 y_11 z_11))) (U_2_bool (MapType2Select zs2 (inv_1_2 x_11 y_11 z_11)))))) (<= (__iar__assume_helper_1  (and (and (U_2_bool (MapType2Select xs1 (inv_0_0 x_11 y_11 z_11))) (and (U_2_bool (MapType2Select ys1 (inv_0_1 x_11 y_11 z_11))) (U_2_bool (MapType2Select zs1 (inv_0_2 x_11 y_11 z_11))))) (and (and (= x_11 x_11) (= y_11 y_11)) (= z_11 z_11))) q_1 q_1) (U_2_real (MapType1Select QPMask@0 null (p_11 x_11 y_11 z_11)))))
 :qid |stdinbpl.889:20|
 :skolemid |110|
 :pattern ( (inv_1_0 x_11 y_11 z_11) (inv_1_1 x_11 y_11 z_11) (inv_1_2 x_11 y_11 z_11))
)) (=> (and (state Heap@@10 QPMask@0) (state Heap@@10 QPMask@0)) (and (=> (= (ControlFlow 0 70) 8) anon80_Then_correct) (=> (= (ControlFlow 0 70) 69) anon80_Else_correct))))))
(let ((anon79_Then_correct true))
(let ((anon78_Else_correct  (=> (forall ((x_9 T@U) (y_9 T@U) (z_9 T@U) ) (!  (=> (and (and (and (= (type x_9) RefType) (= (type y_9) RefType)) (= (type z_9) RefType)) (and (U_2_bool (MapType2Select xs2 (inv_1_0 x_9 y_9 z_9))) (and (U_2_bool (MapType2Select ys2 (inv_1_1 x_9 y_9 z_9))) (U_2_bool (MapType2Select zs2 (inv_1_2 x_9 y_9 z_9)))))) (and (and (= (inv_1_0 x_9 y_9 z_9) x_9) (= (inv_1_1 x_9 y_9 z_9) y_9)) (= (inv_1_2 x_9 y_9 z_9) z_9)))
 :qid |stdinbpl.869:20|
 :skolemid |109|
 :pattern ( (inv_1_0 x_9 y_9 z_9) (inv_1_1 x_9 y_9 z_9) (inv_1_2 x_9 y_9 z_9))
)) (=> (and (state Heap@@10 QPMask@0) (state Heap@@10 QPMask@0)) (and (=> (= (ControlFlow 0 71) 7) anon79_Then_correct) (=> (= (ControlFlow 0 71) 70) anon79_Else_correct))))))
(let ((anon78_Then_correct true))
(let ((anon77_Else_correct  (=> (forall ((x2_1 T@U) (y2_1 T@U) (z2_1 T@U) ) (!  (=> (and (and (and (= (type x2_1) RefType) (= (type y2_1) RefType)) (= (type z2_1) RefType)) (and (U_2_bool (MapType2Select xs2 x2_1)) (and (U_2_bool (MapType2Select ys2 y2_1)) (U_2_bool (MapType2Select zs2 z2_1))))) (and (and (= (inv_1_0 x2_1 y2_1 z2_1) x2_1) (= (inv_1_1 x2_1 y2_1 z2_1) y2_1)) (= (inv_1_2 x2_1 y2_1 z2_1) z2_1)))
 :qid |stdinbpl.852:20|
 :skolemid |108|
 :pattern ( (MapType0Select Heap@@10 null (p_11 x2_1 y2_1 z2_1)))
)) (=> (and (state Heap@@10 QPMask@0) (state Heap@@10 QPMask@0)) (and (=> (= (ControlFlow 0 72) 6) anon78_Then_correct) (=> (= (ControlFlow 0 72) 71) anon78_Else_correct))))))
(let ((anon77_Then_correct true))
(let ((anon76_Else_correct  (=> (forall ((x_7 T@U) (y_7 T@U) (z_7 T@U) ) (!  (=> (and (and (and (= (type x_7) RefType) (= (type y_7) RefType)) (= (type z_7) RefType)) (and (U_2_bool (MapType2Select xs1 (inv_0_0 x_7 y_7 z_7))) (and (U_2_bool (MapType2Select ys1 (inv_0_1 x_7 y_7 z_7))) (U_2_bool (MapType2Select zs1 (inv_0_2 x_7 y_7 z_7)))))) (<= q_1 (U_2_real (MapType1Select QPMask@0 null (p_11 x_7 y_7 z_7)))))
 :qid |stdinbpl.835:20|
 :skolemid |107|
 :pattern ( (inv_0_0 x_7 y_7 z_7) (inv_0_1 x_7 y_7 z_7) (inv_0_2 x_7 y_7 z_7))
)) (=> (and (state Heap@@10 QPMask@0) (state Heap@@10 QPMask@0)) (and (=> (= (ControlFlow 0 73) 5) anon77_Then_correct) (=> (= (ControlFlow 0 73) 72) anon77_Else_correct))))))
(let ((anon76_Then_correct true))
(let ((anon75_Else_correct  (=> (forall ((x_5 T@U) (y_5 T@U) (z_5 T@U) ) (!  (=> (and (and (and (= (type x_5) RefType) (= (type y_5) RefType)) (= (type z_5) RefType)) (and (U_2_bool (MapType2Select xs1 (inv_0_0 x_5 y_5 z_5))) (and (U_2_bool (MapType2Select ys1 (inv_0_1 x_5 y_5 z_5))) (U_2_bool (MapType2Select zs1 (inv_0_2 x_5 y_5 z_5)))))) (and (and (= (inv_0_0 x_5 y_5 z_5) x_5) (= (inv_0_1 x_5 y_5 z_5) y_5)) (= (inv_0_2 x_5 y_5 z_5) z_5)))
 :qid |stdinbpl.818:20|
 :skolemid |106|
 :pattern ( (inv_0_0 x_5 y_5 z_5) (inv_0_1 x_5 y_5 z_5) (inv_0_2 x_5 y_5 z_5))
)) (=> (and (state Heap@@10 QPMask@0) (state Heap@@10 QPMask@0)) (and (=> (= (ControlFlow 0 74) 4) anon76_Then_correct) (=> (= (ControlFlow 0 74) 73) anon76_Else_correct))))))
(let ((anon75_Then_correct true))
(let ((anon74_Else_correct  (=> (forall ((x1_1 T@U) (y1_1 T@U) (z1_1 T@U) ) (!  (=> (and (and (and (= (type x1_1) RefType) (= (type y1_1) RefType)) (= (type z1_1) RefType)) (and (U_2_bool (MapType2Select xs1 x1_1)) (and (U_2_bool (MapType2Select ys1 y1_1)) (U_2_bool (MapType2Select zs1 z1_1))))) (and (and (= (inv_0_0 x1_1 y1_1 z1_1) x1_1) (= (inv_0_1 x1_1 y1_1 z1_1) y1_1)) (= (inv_0_2 x1_1 y1_1 z1_1) z1_1)))
 :qid |stdinbpl.801:20|
 :skolemid |105|
 :pattern ( (MapType0Select Heap@@10 null (p_11 x1_1 y1_1 z1_1)))
)) (=> (and (state Heap@@10 QPMask@0) (state Heap@@10 QPMask@0)) (and (=> (= (ControlFlow 0 75) 3) anon75_Then_correct) (=> (= (ControlFlow 0 75) 74) anon75_Else_correct))))))
(let ((anon74_Then_correct true))
(let ((anon73_Else_correct  (and (=> (= (ControlFlow 0 76) (- 0 78)) (forall ((x_1 T@U) (y_1 T@U) (z_1 T@U) (x_1_1 T@U) (y_1_1 T@U) (z_1_1 T@U) ) (!  (=> (and (and (and (and (and (= (type x_1) RefType) (= (type y_1) RefType)) (= (type z_1) RefType)) (= (type x_1_1) RefType)) (= (type y_1_1) RefType)) (= (type z_1_1) RefType)) (=> (and (and (and (and (and (and (not (= x_1 x_1_1)) (not (= y_1 y_1_1))) (not (= z_1 z_1_1))) (and (U_2_bool (MapType2Select xs x_1)) (and (U_2_bool (MapType2Select ys y_1)) (U_2_bool (MapType2Select zs z_1))))) (and (U_2_bool (MapType2Select xs x_1_1)) (and (U_2_bool (MapType2Select ys y_1_1)) (U_2_bool (MapType2Select zs z_1_1))))) (< NoPerm q_1)) (< NoPerm q_1)) (or (or (not (= x_1 x_1_1)) (not (= y_1 y_1_1))) (not (= z_1 z_1_1)))))
 :qid |stdinbpl.750:17|
 :skolemid |98|
 :pattern ( (neverTriggered3 x_1 y_1 z_1) (neverTriggered3 x_1_1 y_1_1 z_1_1))
))) (=> (forall ((x_1@@0 T@U) (y_1@@0 T@U) (z_1@@0 T@U) (x_1_1@@0 T@U) (y_1_1@@0 T@U) (z_1_1@@0 T@U) ) (!  (=> (and (and (and (and (and (= (type x_1@@0) RefType) (= (type y_1@@0) RefType)) (= (type z_1@@0) RefType)) (= (type x_1_1@@0) RefType)) (= (type y_1_1@@0) RefType)) (= (type z_1_1@@0) RefType)) (=> (and (and (and (and (and (and (not (= x_1@@0 x_1_1@@0)) (not (= y_1@@0 y_1_1@@0))) (not (= z_1@@0 z_1_1@@0))) (and (U_2_bool (MapType2Select xs x_1@@0)) (and (U_2_bool (MapType2Select ys y_1@@0)) (U_2_bool (MapType2Select zs z_1@@0))))) (and (U_2_bool (MapType2Select xs x_1_1@@0)) (and (U_2_bool (MapType2Select ys y_1_1@@0)) (U_2_bool (MapType2Select zs z_1_1@@0))))) (< NoPerm q_1)) (< NoPerm q_1)) (or (or (not (= x_1@@0 x_1_1@@0)) (not (= y_1@@0 y_1_1@@0))) (not (= z_1@@0 z_1_1@@0)))))
 :qid |stdinbpl.750:17|
 :skolemid |98|
 :pattern ( (neverTriggered3 x_1@@0 y_1@@0 z_1@@0) (neverTriggered3 x_1_1@@0 y_1_1@@0 z_1_1@@0))
)) (=> (and (forall ((x_1@@1 T@U) (y_1@@1 T@U) (z_1@@1 T@U) ) (!  (=> (and (and (and (= (type x_1@@1) RefType) (= (type y_1@@1) RefType)) (= (type z_1@@1) RefType)) (and (and (U_2_bool (MapType2Select xs x_1@@1)) (and (U_2_bool (MapType2Select ys y_1@@1)) (U_2_bool (MapType2Select zs z_1@@1)))) (< NoPerm q_1))) (and (and (and (= (invRecv1 x_1@@1 y_1@@1 z_1@@1) x_1@@1) (= (invRecv2 x_1@@1 y_1@@1 z_1@@1) y_1@@1)) (= (invRecv3 x_1@@1 y_1@@1 z_1@@1) z_1@@1)) (qpRange3 x_1@@1 y_1@@1 z_1@@1)))
 :qid |stdinbpl.756:22|
 :skolemid |99|
 :pattern ( (MapType0Select Heap@@10 null (p_11 x_1@@1 y_1@@1 z_1@@1)))
 :pattern ( (MapType1Select ZeroMask null (p_11 x_1@@1 y_1@@1 z_1@@1)))
 :pattern ( (MapType2Select xs x_1@@1) (MapType2Select ys y_1@@1) (MapType2Select zs z_1@@1))
)) (forall ((x_2_1 T@U) (y_2_1 T@U) (z_2_1 T@U) ) (!  (=> (and (and (= (type x_2_1) RefType) (= (type y_2_1) RefType)) (= (type z_2_1) RefType)) (=> (and (and (and (U_2_bool (MapType2Select xs (invRecv1 x_2_1 y_2_1 z_2_1))) (and (U_2_bool (MapType2Select ys (invRecv2 x_2_1 y_2_1 z_2_1))) (U_2_bool (MapType2Select zs (invRecv3 x_2_1 y_2_1 z_2_1))))) (< NoPerm q_1)) (qpRange3 x_2_1 y_2_1 z_2_1)) (and (and (= (invRecv1 x_2_1 y_2_1 z_2_1) x_2_1) (= (invRecv2 x_2_1 y_2_1 z_2_1) y_2_1)) (= (invRecv3 x_2_1 y_2_1 z_2_1) z_2_1))))
 :qid |stdinbpl.760:22|
 :skolemid |100|
 :pattern ( (invRecv1 x_2_1 y_2_1 z_2_1) (invRecv2 x_2_1 y_2_1 z_2_1) (invRecv3 x_2_1 y_2_1 z_2_1))
))) (and (=> (= (ControlFlow 0 76) (- 0 77)) (forall ((x_1@@2 T@U) (y_1@@2 T@U) (z_1@@2 T@U) ) (!  (=> (and (and (and (= (type x_1@@2) RefType) (= (type y_1@@2) RefType)) (= (type z_1@@2) RefType)) (and (U_2_bool (MapType2Select xs x_1@@2)) (and (U_2_bool (MapType2Select ys y_1@@2)) (U_2_bool (MapType2Select zs z_1@@2))))) (>= q_1 NoPerm))
 :qid |stdinbpl.766:15|
 :skolemid |101|
 :pattern ( (MapType0Select Heap@@10 null (p_11 x_1@@2 y_1@@2 z_1@@2)))
 :pattern ( (MapType1Select ZeroMask null (p_11 x_1@@2 y_1@@2 z_1@@2)))
 :pattern ( (MapType2Select xs x_1@@2) (MapType2Select ys y_1@@2) (MapType2Select zs z_1@@2))
))) (=> (forall ((x_1@@3 T@U) (y_1@@3 T@U) (z_1@@3 T@U) ) (!  (=> (and (and (and (= (type x_1@@3) RefType) (= (type y_1@@3) RefType)) (= (type z_1@@3) RefType)) (and (U_2_bool (MapType2Select xs x_1@@3)) (and (U_2_bool (MapType2Select ys y_1@@3)) (U_2_bool (MapType2Select zs z_1@@3))))) (>= q_1 NoPerm))
 :qid |stdinbpl.766:15|
 :skolemid |101|
 :pattern ( (MapType0Select Heap@@10 null (p_11 x_1@@3 y_1@@3 z_1@@3)))
 :pattern ( (MapType1Select ZeroMask null (p_11 x_1@@3 y_1@@3 z_1@@3)))
 :pattern ( (MapType2Select xs x_1@@3) (MapType2Select ys y_1@@3) (MapType2Select zs z_1@@3))
)) (=> (and (forall ((x_2_1@@0 T@U) (y_2_1@@0 T@U) (z_2_1@@0 T@U) ) (!  (=> (and (and (= (type x_2_1@@0) RefType) (= (type y_2_1@@0) RefType)) (= (type z_2_1@@0) RefType)) (=> (and (and (and (U_2_bool (MapType2Select xs (invRecv1 x_2_1@@0 y_2_1@@0 z_2_1@@0))) (and (U_2_bool (MapType2Select ys (invRecv2 x_2_1@@0 y_2_1@@0 z_2_1@@0))) (U_2_bool (MapType2Select zs (invRecv3 x_2_1@@0 y_2_1@@0 z_2_1@@0))))) (< NoPerm q_1)) (qpRange3 x_2_1@@0 y_2_1@@0 z_2_1@@0)) (and (=> (< NoPerm q_1) (and (and (= (invRecv1 x_2_1@@0 y_2_1@@0 z_2_1@@0) x_2_1@@0) (= (invRecv2 x_2_1@@0 y_2_1@@0 z_2_1@@0) y_2_1@@0)) (= (invRecv3 x_2_1@@0 y_2_1@@0 z_2_1@@0) z_2_1@@0))) (= (U_2_real (MapType1Select QPMask@0 null (p_11 x_2_1@@0 y_2_1@@0 z_2_1@@0))) (+ (U_2_real (MapType1Select ZeroMask null (p_11 x_2_1@@0 y_2_1@@0 z_2_1@@0))) q_1)))))
 :qid |stdinbpl.772:22|
 :skolemid |102|
 :pattern ( (MapType1Select QPMask@0 null (p_11 x_2_1@@0 y_2_1@@0 z_2_1@@0)))
)) (forall ((o_3 T@U) (f_5 T@U) ) (! (let ((B@@11 (FieldTypeInv1 (type f_5))))
(let ((A@@12 (FieldTypeInv0 (type f_5))))
 (=> (and (and (= (type o_3) RefType) (= (type f_5) (FieldType A@@12 B@@11))) (or (or (not (= o_3 null)) (not (IsPredicateField f_5))) (not (= (getPredWandId f_5) 0)))) (= (U_2_real (MapType1Select ZeroMask o_3 f_5)) (U_2_real (MapType1Select QPMask@0 o_3 f_5))))))
 :qid |stdinbpl.778:29|
 :skolemid |103|
 :pattern ( (MapType1Select ZeroMask o_3 f_5))
 :pattern ( (MapType1Select QPMask@0 o_3 f_5))
))) (=> (and (and (forall ((x_2_1@@1 T@U) (y_2_1@@1 T@U) (z_2_1@@1 T@U) ) (!  (=> (and (and (and (= (type x_2_1@@1) RefType) (= (type y_2_1@@1) RefType)) (= (type z_2_1@@1) RefType)) (not (and (and (and (U_2_bool (MapType2Select xs (invRecv1 x_2_1@@1 y_2_1@@1 z_2_1@@1))) (and (U_2_bool (MapType2Select ys (invRecv2 x_2_1@@1 y_2_1@@1 z_2_1@@1))) (U_2_bool (MapType2Select zs (invRecv3 x_2_1@@1 y_2_1@@1 z_2_1@@1))))) (< NoPerm q_1)) (qpRange3 x_2_1@@1 y_2_1@@1 z_2_1@@1)))) (= (U_2_real (MapType1Select QPMask@0 null (p_11 x_2_1@@1 y_2_1@@1 z_2_1@@1))) (U_2_real (MapType1Select ZeroMask null (p_11 x_2_1@@1 y_2_1@@1 z_2_1@@1)))))
 :qid |stdinbpl.782:22|
 :skolemid |104|
 :pattern ( (MapType1Select QPMask@0 null (p_11 x_2_1@@1 y_2_1@@1 z_2_1@@1)))
)) (state Heap@@10 QPMask@0)) (and (state Heap@@10 QPMask@0) (state Heap@@10 QPMask@0))) (and (=> (= (ControlFlow 0 76) 2) anon74_Then_correct) (=> (= (ControlFlow 0 76) 75) anon74_Else_correct)))))))))))
(let ((anon73_Then_correct true))
(let ((anon0_correct  (=> (state Heap@@10 ZeroMask) (=> (and (U_2_bool (MapType0Select Heap@@10 a_2 $allocated)) (U_2_bool (MapType0Select Heap@@10 b_2 $allocated))) (=> (and (and (U_2_bool (MapType0Select Heap@@10 c $allocated)) (<= NoPerm q_1)) (and (state Heap@@10 ZeroMask) (state Heap@@10 ZeroMask))) (and (=> (= (ControlFlow 0 79) 1) anon73_Then_correct) (=> (= (ControlFlow 0 79) 76) anon73_Else_correct)))))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 80) 79) anon0_correct)))
PreconditionGeneratedEntry_correct))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
))
(check-sat)
(get-info :reason-unknown)
(assert (not (= (ControlFlow 0 39) (- 40))))
(check-sat)
(get-info :reason-unknown)
(assert (not (= (ControlFlow 0 36) (- 35))))
(check-sat)
(pop 1)
; Invalid
(get-info :rlimit)
