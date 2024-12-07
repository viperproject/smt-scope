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
(declare-fun wand (T@U Real T@U Real) T@U)
(declare-fun getPredWandId (T@U) Int)
(declare-fun WandType_wandType () T@T)
(declare-fun wand_1 (T@U Real T@U Real) T@U)
(declare-fun MapType1Type (T@T T@T) T@T)
(declare-fun MapType1TypeInv0 (T@T) T@T)
(declare-fun MapType1TypeInv1 (T@T) T@T)
(declare-fun MapType1Select (T@U T@U) T@U)
(declare-fun MapType1Store (T@U T@U T@U) T@U)
(declare-fun WandType_wand_1Type () T@T)
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
(declare-fun P (T@U Int) T@U)
(declare-fun IsPredicateField (T@U) Bool)
(declare-fun PredicateType_PType () T@T)
(declare-fun FrameTypeType () T@T)
(declare-fun p2 (T@U T@U) T@U)
(declare-fun PredicateType_p2Type () T@T)
(declare-fun |P#trigger| (T@U T@U) Bool)
(declare-fun |P#everUsed| (T@U) Bool)
(declare-fun |p2#trigger| (T@U T@U) Bool)
(declare-fun |p2#everUsed| (T@U) Bool)
(declare-fun |Math#min| (Int Int) Int)
(declare-fun IdenticalOnKnownLocations (T@U T@U T@U) Bool)
(declare-fun null () T@U)
(declare-fun PredicateMaskField (T@U) T@U)
(declare-fun HasDirectPerm (T@U T@U T@U) Bool)
(declare-fun IsWandField (T@U) Bool)
(declare-fun WandMaskField (T@U) T@U)
(declare-fun |MultiSet#Select| (T@U T@U) Int)
(declare-fun |Set#Union| (T@U T@U) T@U)
(declare-fun |Set#Intersection| (T@U T@U) T@U)
(declare-fun |Set#Singleton| (T@U) T@U)
(declare-fun |Set#Card| (T@U) Int)
(declare-fun |Math#clip| (Int) Int)
(declare-fun |P#sm| (T@U Int) T@U)
(declare-fun |p2#sm| (T@U T@U) T@U)
(declare-fun dummyHeap () T@U)
(declare-fun ZeroMask () T@U)
(declare-fun |MultiSet#UnionOne| (T@U T@U) T@U)
(declare-fun |MultiSet#Disjoint| (T@U T@U) Bool)
(declare-fun InsidePredicate (T@U T@U T@U T@U) Bool)
(declare-fun |MultiSet#Singleton| (T@U) T@U)
(declare-fun |Set#Equal| (T@U T@U) Bool)
(declare-fun sumMask (T@U T@U T@U) Bool)
(declare-fun |wand#ft| (T@U Real T@U Real) T@U)
(declare-fun |wand_1#ft| (T@U Real T@U Real) T@U)
(declare-fun ConditionalFrame (Real T@U) T@U)
(declare-fun EmptyFrame () T@U)
(declare-fun NoPerm () Real)
(declare-fun |wand#sm| (T@U Real T@U Real) T@U)
(declare-fun |wand_1#sm| (T@U Real T@U Real) T@U)
(declare-fun |Set#Difference| (T@U T@U) T@U)
(declare-fun |MultiSet#Equal| (T@U T@U) Bool)
(declare-fun |Set#UnionOne| (T@U T@U) T@U)
(declare-fun |MultiSet#Empty| (T@T) T@U)
(declare-fun FullPerm () Real)
(declare-fun |Set#Empty| (T@T) T@U)
(declare-fun |Set#Subset| (T@U T@U) Bool)
(declare-fun ZeroPMask () T@U)
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
(assert  (and (= (Ctor WandType_wandType) 10) (forall ((arg0@@18 T@U) (arg1@@4 Real) (arg2@@1 T@U) (arg3@@0 Real) ) (! (= (type (wand arg0@@18 arg1@@4 arg2@@1 arg3@@0)) (FieldType WandType_wandType intType))
 :qid |funType:wand|
 :pattern ( (wand arg0@@18 arg1@@4 arg2@@1 arg3@@0))
))))
(assert (forall ((arg1@@5 T@U) (arg2@@2 Real) (arg3@@1 T@U) (arg4 Real) ) (!  (=> (and (= (type arg1@@5) RefType) (= (type arg3@@1) RefType)) (= (getPredWandId (wand arg1@@5 arg2@@2 arg3@@1 arg4)) 2))
 :qid |stdinbpl.454:15|
 :skolemid |87|
 :pattern ( (wand arg1@@5 arg2@@2 arg3@@1 arg4))
)))
(assert  (and (and (and (and (and (and (and (and (forall ((arg0@@19 T@T) (arg1@@6 T@T) ) (! (= (Ctor (MapType1Type arg0@@19 arg1@@6)) 11)
 :qid |ctor:MapType1Type|
)) (forall ((arg0@@20 T@T) (arg1@@7 T@T) ) (! (= (MapType1TypeInv0 (MapType1Type arg0@@20 arg1@@7)) arg0@@20)
 :qid |typeInv:MapType1TypeInv0|
 :pattern ( (MapType1Type arg0@@20 arg1@@7))
))) (forall ((arg0@@21 T@T) (arg1@@8 T@T) ) (! (= (MapType1TypeInv1 (MapType1Type arg0@@21 arg1@@8)) arg1@@8)
 :qid |typeInv:MapType1TypeInv1|
 :pattern ( (MapType1Type arg0@@21 arg1@@8))
))) (forall ((arg0@@22 T@U) (arg1@@9 T@U) ) (! (let ((aVar1 (MapType1TypeInv1 (type arg0@@22))))
(= (type (MapType1Select arg0@@22 arg1@@9)) aVar1))
 :qid |funType:MapType1Select|
 :pattern ( (MapType1Select arg0@@22 arg1@@9))
))) (forall ((arg0@@23 T@U) (arg1@@10 T@U) (arg2@@3 T@U) ) (! (let ((aVar1@@0 (type arg2@@3)))
(let ((aVar0@@0 (type arg1@@10)))
(= (type (MapType1Store arg0@@23 arg1@@10 arg2@@3)) (MapType1Type aVar0@@0 aVar1@@0))))
 :qid |funType:MapType1Store|
 :pattern ( (MapType1Store arg0@@23 arg1@@10 arg2@@3))
))) (forall ((m@@3 T@U) (x0@@3 T@U) (val@@3 T@U) ) (! (let ((aVar1@@1 (MapType1TypeInv1 (type m@@3))))
 (=> (= (type val@@3) aVar1@@1) (= (MapType1Select (MapType1Store m@@3 x0@@3 val@@3) x0@@3) val@@3)))
 :qid |mapAx0:MapType1Select|
 :weight 0
))) (and (forall ((val@@4 T@U) (m@@4 T@U) (x0@@4 T@U) (y0@@2 T@U) ) (!  (or (= x0@@4 y0@@2) (= (MapType1Select (MapType1Store m@@4 x0@@4 val@@4) y0@@2) (MapType1Select m@@4 y0@@2)))
 :qid |mapAx1:MapType1Select:0|
 :weight 0
)) (forall ((val@@5 T@U) (m@@5 T@U) (x0@@5 T@U) (y0@@3 T@U) ) (!  (or true (= (MapType1Select (MapType1Store m@@5 x0@@5 val@@5) y0@@3) (MapType1Select m@@5 y0@@3)))
 :qid |mapAx2:MapType1Select|
 :weight 0
)))) (= (Ctor WandType_wand_1Type) 12)) (forall ((arg0@@24 T@U) (arg1@@11 Real) (arg2@@4 T@U) (arg3@@2 Real) ) (! (= (type (wand_1 arg0@@24 arg1@@11 arg2@@4 arg3@@2)) (FieldType WandType_wand_1Type intType))
 :qid |funType:wand_1|
 :pattern ( (wand_1 arg0@@24 arg1@@11 arg2@@4 arg3@@2))
))))
(assert (forall ((arg1@@12 T@U) (arg2@@5 Real) (arg3@@3 T@U) (arg4@@0 Real) ) (!  (=> (and (= (type arg1@@12) (MapType1Type RefType boolType)) (= (type arg3@@3) (MapType1Type RefType boolType))) (= (getPredWandId (wand_1 arg1@@12 arg2@@5 arg3@@3 arg4@@0)) 3))
 :qid |stdinbpl.486:15|
 :skolemid |94|
 :pattern ( (wand_1 arg1@@12 arg2@@5 arg3@@3 arg4@@0))
)))
(assert  (and (and (and (and (forall ((arg0@@25 T@T) ) (! (= (Ctor (MultiSetType arg0@@25)) 13)
 :qid |ctor:MultiSetType|
)) (forall ((arg0@@26 T@T) ) (! (= (MultiSetTypeInv0 (MultiSetType arg0@@26)) arg0@@26)
 :qid |typeInv:MultiSetTypeInv0|
 :pattern ( (MultiSetType arg0@@26))
))) (forall ((arg0@@27 T@U) (arg1@@13 T@U) ) (! (let ((T (MultiSetTypeInv0 (type arg0@@27))))
(= (type (|MultiSet#Difference| arg0@@27 arg1@@13)) (MultiSetType T)))
 :qid |funType:MultiSet#Difference|
 :pattern ( (|MultiSet#Difference| arg0@@27 arg1@@13))
))) (forall ((arg0@@28 T@U) (arg1@@14 T@U) ) (! (let ((T@@0 (MultiSetTypeInv0 (type arg0@@28))))
(= (type (|MultiSet#Intersection| arg0@@28 arg1@@14)) (MultiSetType T@@0)))
 :qid |funType:MultiSet#Intersection|
 :pattern ( (|MultiSet#Intersection| arg0@@28 arg1@@14))
))) (forall ((arg0@@29 T@U) (arg1@@15 T@U) ) (! (let ((T@@1 (MultiSetTypeInv0 (type arg0@@29))))
(= (type (|MultiSet#Union| arg0@@29 arg1@@15)) (MultiSetType T@@1)))
 :qid |funType:MultiSet#Union|
 :pattern ( (|MultiSet#Union| arg0@@29 arg1@@15))
))))
(assert (forall ((a T@U) (b T@U) ) (! (let ((T@@2 (MultiSetTypeInv0 (type a))))
 (=> (and (= (type a) (MultiSetType T@@2)) (= (type b) (MultiSetType T@@2))) (and (= (+ (+ (|MultiSet#Card| (|MultiSet#Difference| a b)) (|MultiSet#Card| (|MultiSet#Difference| b a))) (* 2 (|MultiSet#Card| (|MultiSet#Intersection| a b)))) (|MultiSet#Card| (|MultiSet#Union| a b))) (= (|MultiSet#Card| (|MultiSet#Difference| a b)) (- (|MultiSet#Card| a) (|MultiSet#Card| (|MultiSet#Intersection| a b)))))))
 :qid |stdinbpl.401:18|
 :skolemid |74|
 :pattern ( (|MultiSet#Card| (|MultiSet#Difference| a b)))
)))
(assert  (and (and (and (and (and (and (forall ((arg0@@30 T@T) (arg1@@16 T@T) ) (! (= (Ctor (MapType2Type arg0@@30 arg1@@16)) 14)
 :qid |ctor:MapType2Type|
)) (forall ((arg0@@31 T@T) (arg1@@17 T@T) ) (! (= (MapType2TypeInv0 (MapType2Type arg0@@31 arg1@@17)) arg0@@31)
 :qid |typeInv:MapType2TypeInv0|
 :pattern ( (MapType2Type arg0@@31 arg1@@17))
))) (forall ((arg0@@32 T@T) (arg1@@18 T@T) ) (! (= (MapType2TypeInv1 (MapType2Type arg0@@32 arg1@@18)) arg1@@18)
 :qid |typeInv:MapType2TypeInv1|
 :pattern ( (MapType2Type arg0@@32 arg1@@18))
))) (forall ((arg0@@33 T@U) (arg1@@19 T@U) (arg2@@6 T@U) ) (! (let ((aVar1@@2 (MapType2TypeInv1 (type arg0@@33))))
(= (type (MapType2Select arg0@@33 arg1@@19 arg2@@6)) aVar1@@2))
 :qid |funType:MapType2Select|
 :pattern ( (MapType2Select arg0@@33 arg1@@19 arg2@@6))
))) (forall ((arg0@@34 T@U) (arg1@@20 T@U) (arg2@@7 T@U) (arg3@@4 T@U) ) (! (let ((aVar1@@3 (type arg3@@4)))
(let ((aVar0@@1 (type arg1@@20)))
(= (type (MapType2Store arg0@@34 arg1@@20 arg2@@7 arg3@@4)) (MapType2Type aVar0@@1 aVar1@@3))))
 :qid |funType:MapType2Store|
 :pattern ( (MapType2Store arg0@@34 arg1@@20 arg2@@7 arg3@@4))
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
(assert (forall ((Heap T@U) (Mask T@U) ) (!  (=> (and (and (= (type Heap) (MapType0Type RefType)) (= (type Mask) (MapType2Type RefType realType))) (state Heap Mask)) (GoodMask Mask))
 :qid |stdinbpl.124:15|
 :skolemid |15|
 :pattern ( (state Heap Mask))
)))
(assert (forall ((Heap0@@0 T@U) (Heap1@@0 T@U) (Heap2 T@U) ) (!  (=> (and (and (and (= (type Heap0@@0) (MapType0Type RefType)) (= (type Heap1@@0) (MapType0Type RefType))) (= (type Heap2) (MapType0Type RefType))) (and (succHeapTrans Heap0@@0 Heap1@@0) (succHeap Heap1@@0 Heap2))) (succHeapTrans Heap0@@0 Heap2))
 :qid |stdinbpl.93:15|
 :skolemid |12|
 :pattern ( (succHeapTrans Heap0@@0 Heap1@@0) (succHeap Heap1@@0 Heap2))
)))
(assert  (and (and (= (Ctor PredicateType_PType) 15) (= (Ctor FrameTypeType) 16)) (forall ((arg0@@35 T@U) (arg1@@21 Int) ) (! (= (type (P arg0@@35 arg1@@21)) (FieldType PredicateType_PType FrameTypeType))
 :qid |funType:P|
 :pattern ( (P arg0@@35 arg1@@21))
))))
(assert (forall ((x@@8 T@U) (i Int) ) (!  (=> (= (type x@@8) RefType) (IsPredicateField (P x@@8 i)))
 :qid |stdinbpl.514:15|
 :skolemid |97|
 :pattern ( (P x@@8 i))
)))
(assert  (and (= (Ctor PredicateType_p2Type) 17) (forall ((arg0@@36 T@U) (arg1@@22 T@U) ) (! (= (type (p2 arg0@@36 arg1@@22)) (FieldType PredicateType_p2Type FrameTypeType))
 :qid |funType:p2|
 :pattern ( (p2 arg0@@36 arg1@@22))
))))
(assert (forall ((x@@9 T@U) (y@@1 T@U) ) (!  (=> (and (= (type x@@9) RefType) (= (type y@@1) RefType)) (IsPredicateField (p2 x@@9 y@@1)))
 :qid |stdinbpl.572:15|
 :skolemid |103|
 :pattern ( (p2 x@@9 y@@1))
)))
(assert (forall ((Heap@@0 T@U) (x@@10 T@U) (i@@0 Int) ) (!  (=> (and (= (type Heap@@0) (MapType0Type RefType)) (= (type x@@10) RefType)) (|P#everUsed| (P x@@10 i@@0)))
 :qid |stdinbpl.533:15|
 :skolemid |101|
 :pattern ( (|P#trigger| Heap@@0 (P x@@10 i@@0)))
)))
(assert (forall ((Heap@@1 T@U) (x@@11 T@U) (y@@2 T@U) ) (!  (=> (and (and (= (type Heap@@1) (MapType0Type RefType)) (= (type x@@11) RefType)) (= (type y@@2) RefType)) (|p2#everUsed| (p2 x@@11 y@@2)))
 :qid |stdinbpl.591:15|
 :skolemid |107|
 :pattern ( (|p2#trigger| Heap@@1 (p2 x@@11 y@@2)))
)))
(assert (forall ((a@@0 Int) (b@@0 Int) ) (!  (or (= (|Math#min| a@@0 b@@0) a@@0) (= (|Math#min| a@@0 b@@0) b@@0))
 :qid |stdinbpl.332:15|
 :skolemid |53|
 :pattern ( (|Math#min| a@@0 b@@0))
)))
(assert  (and (= (type null) RefType) (forall ((arg0@@37 T@U) ) (! (let ((A (FieldTypeInv0 (type arg0@@37))))
(= (type (PredicateMaskField arg0@@37)) (FieldType A (MapType2Type RefType boolType))))
 :qid |funType:PredicateMaskField|
 :pattern ( (PredicateMaskField arg0@@37))
))))
(assert (forall ((Heap@@2 T@U) (ExhaleHeap T@U) (Mask@@0 T@U) (pm_f T@U) ) (! (let ((C (FieldTypeInv0 (type pm_f))))
 (=> (and (and (and (and (and (= (type Heap@@2) (MapType0Type RefType)) (= (type ExhaleHeap) (MapType0Type RefType))) (= (type Mask@@0) (MapType2Type RefType realType))) (= (type pm_f) (FieldType C FrameTypeType))) (IdenticalOnKnownLocations Heap@@2 ExhaleHeap Mask@@0)) (and (HasDirectPerm Mask@@0 null pm_f) (IsPredicateField pm_f))) (= (MapType0Select Heap@@2 null (PredicateMaskField pm_f)) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))))
 :qid |stdinbpl.47:19|
 :skolemid |2|
 :pattern ( (IdenticalOnKnownLocations Heap@@2 ExhaleHeap Mask@@0) (IsPredicateField pm_f) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))
)))
(assert (forall ((arg0@@38 T@U) ) (! (let ((A@@0 (FieldTypeInv0 (type arg0@@38))))
(= (type (WandMaskField arg0@@38)) (FieldType A@@0 (MapType2Type RefType boolType))))
 :qid |funType:WandMaskField|
 :pattern ( (WandMaskField arg0@@38))
)))
(assert (forall ((Heap@@3 T@U) (ExhaleHeap@@0 T@U) (Mask@@1 T@U) (pm_f@@0 T@U) ) (! (let ((C@@0 (FieldTypeInv0 (type pm_f@@0))))
 (=> (and (and (and (and (and (= (type Heap@@3) (MapType0Type RefType)) (= (type ExhaleHeap@@0) (MapType0Type RefType))) (= (type Mask@@1) (MapType2Type RefType realType))) (= (type pm_f@@0) (FieldType C@@0 FrameTypeType))) (IdenticalOnKnownLocations Heap@@3 ExhaleHeap@@0 Mask@@1)) (and (HasDirectPerm Mask@@1 null pm_f@@0) (IsWandField pm_f@@0))) (= (MapType0Select Heap@@3 null (WandMaskField pm_f@@0)) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))))
 :qid |stdinbpl.60:19|
 :skolemid |5|
 :pattern ( (IdenticalOnKnownLocations Heap@@3 ExhaleHeap@@0 Mask@@1) (IsWandField pm_f@@0) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))
)))
(assert (forall ((a@@1 T@U) (b@@1 T@U) (y@@3 T@U) ) (! (let ((T@@3 (type y@@3)))
 (=> (and (and (= (type a@@1) (MultiSetType T@@3)) (= (type b@@1) (MultiSetType T@@3))) (<= (|MultiSet#Select| a@@1 y@@3) (|MultiSet#Select| b@@1 y@@3))) (= (|MultiSet#Select| (|MultiSet#Difference| a@@1 b@@1) y@@3) 0)))
 :qid |stdinbpl.399:18|
 :skolemid |73|
 :pattern ( (|MultiSet#Difference| a@@1 b@@1) (|MultiSet#Select| b@@1 y@@3) (|MultiSet#Select| a@@1 y@@3))
)))
(assert (forall ((arg0@@39 T@U) (arg1@@23 T@U) ) (! (let ((T@@4 (MapType1TypeInv0 (type arg0@@39))))
(= (type (|Set#Union| arg0@@39 arg1@@23)) (MapType1Type T@@4 boolType)))
 :qid |funType:Set#Union|
 :pattern ( (|Set#Union| arg0@@39 arg1@@23))
)))
(assert (forall ((a@@2 T@U) (b@@2 T@U) ) (! (let ((T@@5 (MapType1TypeInv0 (type a@@2))))
 (=> (and (= (type a@@2) (MapType1Type T@@5 boolType)) (= (type b@@2) (MapType1Type T@@5 boolType))) (= (|Set#Union| (|Set#Union| a@@2 b@@2) b@@2) (|Set#Union| a@@2 b@@2))))
 :qid |stdinbpl.284:18|
 :skolemid |38|
 :pattern ( (|Set#Union| (|Set#Union| a@@2 b@@2) b@@2))
)))
(assert (forall ((arg0@@40 T@U) (arg1@@24 T@U) ) (! (let ((T@@6 (MapType1TypeInv0 (type arg0@@40))))
(= (type (|Set#Intersection| arg0@@40 arg1@@24)) (MapType1Type T@@6 boolType)))
 :qid |funType:Set#Intersection|
 :pattern ( (|Set#Intersection| arg0@@40 arg1@@24))
)))
(assert (forall ((a@@3 T@U) (b@@3 T@U) ) (! (let ((T@@7 (MapType1TypeInv0 (type a@@3))))
 (=> (and (= (type a@@3) (MapType1Type T@@7 boolType)) (= (type b@@3) (MapType1Type T@@7 boolType))) (= (|Set#Intersection| (|Set#Intersection| a@@3 b@@3) b@@3) (|Set#Intersection| a@@3 b@@3))))
 :qid |stdinbpl.288:18|
 :skolemid |40|
 :pattern ( (|Set#Intersection| (|Set#Intersection| a@@3 b@@3) b@@3))
)))
(assert (forall ((a@@4 T@U) (b@@4 T@U) ) (! (let ((T@@8 (MultiSetTypeInv0 (type a@@4))))
 (=> (and (= (type a@@4) (MultiSetType T@@8)) (= (type b@@4) (MultiSetType T@@8))) (= (|MultiSet#Intersection| (|MultiSet#Intersection| a@@4 b@@4) b@@4) (|MultiSet#Intersection| a@@4 b@@4))))
 :qid |stdinbpl.390:18|
 :skolemid |70|
 :pattern ( (|MultiSet#Intersection| (|MultiSet#Intersection| a@@4 b@@4) b@@4))
)))
(assert (forall ((arg0@@41 T@U) ) (! (let ((T@@9 (type arg0@@41)))
(= (type (|Set#Singleton| arg0@@41)) (MapType1Type T@@9 boolType)))
 :qid |funType:Set#Singleton|
 :pattern ( (|Set#Singleton| arg0@@41))
)))
(assert (forall ((r T@U) (o T@U) ) (! (let ((T@@10 (type r)))
 (=> (= (type o) T@@10) (= (U_2_bool (MapType1Select (|Set#Singleton| r) o)) (= r o))))
 :qid |stdinbpl.253:18|
 :skolemid |27|
 :pattern ( (MapType1Select (|Set#Singleton| r) o))
)))
(assert (forall ((a@@5 T@U) (b@@5 T@U) ) (! (let ((T@@11 (MapType1TypeInv0 (type a@@5))))
 (=> (and (= (type a@@5) (MapType1Type T@@11 boolType)) (= (type b@@5) (MapType1Type T@@11 boolType))) (= (+ (|Set#Card| (|Set#Union| a@@5 b@@5)) (|Set#Card| (|Set#Intersection| a@@5 b@@5))) (+ (|Set#Card| a@@5) (|Set#Card| b@@5)))))
 :qid |stdinbpl.292:18|
 :skolemid |42|
 :pattern ( (|Set#Card| (|Set#Union| a@@5 b@@5)))
 :pattern ( (|Set#Card| (|Set#Intersection| a@@5 b@@5)))
)))
(assert (forall ((Heap@@4 T@U) (ExhaleHeap@@1 T@U) (Mask@@2 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@4) (MapType0Type RefType)) (= (type ExhaleHeap@@1) (MapType0Type RefType))) (= (type Mask@@2) (MapType2Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@4 ExhaleHeap@@1 Mask@@2)) (U_2_bool (MapType0Select Heap@@4 o_1 $allocated))) (U_2_bool (MapType0Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.73:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@4 ExhaleHeap@@1 Mask@@2) (MapType0Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert (forall ((a@@6 Int) ) (!  (=> (<= 0 a@@6) (= (|Math#clip| a@@6) a@@6))
 :qid |stdinbpl.335:15|
 :skolemid |54|
 :pattern ( (|Math#clip| a@@6))
)))
(assert (forall ((a@@7 T@U) (b@@6 T@U) (o@@0 T@U) ) (! (let ((T@@12 (type o@@0)))
 (=> (and (= (type a@@7) (MultiSetType T@@12)) (= (type b@@6) (MultiSetType T@@12))) (= (|MultiSet#Select| (|MultiSet#Intersection| a@@7 b@@6) o@@0) (|Math#min| (|MultiSet#Select| a@@7 o@@0) (|MultiSet#Select| b@@6 o@@0)))))
 :qid |stdinbpl.386:18|
 :skolemid |69|
 :pattern ( (|MultiSet#Select| (|MultiSet#Intersection| a@@7 b@@6) o@@0))
)))
(assert (forall ((x@@12 T@U) (i@@1 Int) (x2 T@U) (i2 Int) ) (!  (=> (and (and (= (type x@@12) RefType) (= (type x2) RefType)) (= (P x@@12 i@@1) (P x2 i2))) (and (= x@@12 x2) (= i@@1 i2)))
 :qid |stdinbpl.524:15|
 :skolemid |99|
 :pattern ( (P x@@12 i@@1) (P x2 i2))
)))
(assert (forall ((arg0@@42 T@U) (arg1@@25 Int) ) (! (= (type (|P#sm| arg0@@42 arg1@@25)) (FieldType PredicateType_PType (MapType2Type RefType boolType)))
 :qid |funType:P#sm|
 :pattern ( (|P#sm| arg0@@42 arg1@@25))
)))
(assert (forall ((x@@13 T@U) (i@@2 Int) (x2@@0 T@U) (i2@@0 Int) ) (!  (=> (and (and (= (type x@@13) RefType) (= (type x2@@0) RefType)) (= (|P#sm| x@@13 i@@2) (|P#sm| x2@@0 i2@@0))) (and (= x@@13 x2@@0) (= i@@2 i2@@0)))
 :qid |stdinbpl.528:15|
 :skolemid |100|
 :pattern ( (|P#sm| x@@13 i@@2) (|P#sm| x2@@0 i2@@0))
)))
(assert (forall ((x@@14 T@U) (y@@4 T@U) (x2@@1 T@U) (y2 T@U) ) (!  (=> (and (and (and (and (= (type x@@14) RefType) (= (type y@@4) RefType)) (= (type x2@@1) RefType)) (= (type y2) RefType)) (= (p2 x@@14 y@@4) (p2 x2@@1 y2))) (and (= x@@14 x2@@1) (= y@@4 y2)))
 :qid |stdinbpl.582:15|
 :skolemid |105|
 :pattern ( (p2 x@@14 y@@4) (p2 x2@@1 y2))
)))
(assert (forall ((arg0@@43 T@U) (arg1@@26 T@U) ) (! (= (type (|p2#sm| arg0@@43 arg1@@26)) (FieldType PredicateType_p2Type (MapType2Type RefType boolType)))
 :qid |funType:p2#sm|
 :pattern ( (|p2#sm| arg0@@43 arg1@@26))
)))
(assert (forall ((x@@15 T@U) (y@@5 T@U) (x2@@2 T@U) (y2@@0 T@U) ) (!  (=> (and (and (and (and (= (type x@@15) RefType) (= (type y@@5) RefType)) (= (type x2@@2) RefType)) (= (type y2@@0) RefType)) (= (|p2#sm| x@@15 y@@5) (|p2#sm| x2@@2 y2@@0))) (and (= x@@15 x2@@2) (= y@@5 y2@@0)))
 :qid |stdinbpl.586:15|
 :skolemid |106|
 :pattern ( (|p2#sm| x@@15 y@@5) (|p2#sm| x2@@2 y2@@0))
)))
(assert (forall ((Heap@@5 T@U) (ExhaleHeap@@2 T@U) (Mask@@3 T@U) (o_1@@0 T@U) (f_2 T@U) ) (! (let ((B@@1 (FieldTypeInv1 (type f_2))))
(let ((A@@1 (FieldTypeInv0 (type f_2))))
 (=> (and (and (and (and (and (and (= (type Heap@@5) (MapType0Type RefType)) (= (type ExhaleHeap@@2) (MapType0Type RefType))) (= (type Mask@@3) (MapType2Type RefType realType))) (= (type o_1@@0) RefType)) (= (type f_2) (FieldType A@@1 B@@1))) (IdenticalOnKnownLocations Heap@@5 ExhaleHeap@@2 Mask@@3)) (HasDirectPerm Mask@@3 o_1@@0 f_2)) (= (MapType0Select Heap@@5 o_1@@0 f_2) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2)))))
 :qid |stdinbpl.42:22|
 :skolemid |1|
 :pattern ( (IdenticalOnKnownLocations Heap@@5 ExhaleHeap@@2 Mask@@3) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2))
)))
(assert  (and (= (type dummyHeap) (MapType0Type RefType)) (= (type ZeroMask) (MapType2Type RefType realType))))
(assert (state dummyHeap ZeroMask))
(assert (forall ((arg0@@44 T@U) (arg1@@27 T@U) ) (! (let ((T@@13 (type arg1@@27)))
(= (type (|MultiSet#UnionOne| arg0@@44 arg1@@27)) (MultiSetType T@@13)))
 :qid |funType:MultiSet#UnionOne|
 :pattern ( (|MultiSet#UnionOne| arg0@@44 arg1@@27))
)))
(assert (forall ((a@@8 T@U) (x@@16 T@U) ) (! (let ((T@@14 (type x@@16)))
 (=> (= (type a@@8) (MultiSetType T@@14)) (= (|MultiSet#Card| (|MultiSet#UnionOne| a@@8 x@@16)) (+ (|MultiSet#Card| a@@8) 1))))
 :qid |stdinbpl.372:18|
 :skolemid |65|
 :pattern ( (|MultiSet#Card| (|MultiSet#UnionOne| a@@8 x@@16)))
 :pattern ( (|MultiSet#UnionOne| a@@8 x@@16) (|MultiSet#Card| a@@8))
)))
(assert (forall ((a@@9 T@U) (b@@7 T@U) ) (! (let ((T@@15 (MultiSetTypeInv0 (type a@@9))))
 (=> (and (= (type a@@9) (MultiSetType T@@15)) (= (type b@@7) (MultiSetType T@@15))) (= (|MultiSet#Disjoint| a@@9 b@@7) (forall ((o@@1 T@U) ) (!  (=> (= (type o@@1) T@@15) (or (= (|MultiSet#Select| a@@9 o@@1) 0) (= (|MultiSet#Select| b@@7 o@@1) 0)))
 :qid |stdinbpl.422:39|
 :skolemid |80|
 :pattern ( (|MultiSet#Select| a@@9 o@@1))
 :pattern ( (|MultiSet#Select| b@@7 o@@1))
)))))
 :qid |stdinbpl.421:18|
 :skolemid |81|
 :pattern ( (|MultiSet#Disjoint| a@@9 b@@7))
)))
(assert (forall ((p T@U) (v_1 T@U) (w T@U) ) (! (let ((A@@2 (FieldTypeInv0 (type p))))
 (=> (and (and (= (type p) (FieldType A@@2 FrameTypeType)) (= (type v_1) FrameTypeType)) (= (type w) FrameTypeType)) (not (InsidePredicate p v_1 p w))))
 :qid |stdinbpl.230:19|
 :skolemid |21|
 :pattern ( (InsidePredicate p v_1 p w))
)))
(assert (forall ((arg0@@45 T@U) ) (! (let ((T@@16 (type arg0@@45)))
(= (type (|MultiSet#Singleton| arg0@@45)) (MultiSetType T@@16)))
 :qid |funType:MultiSet#Singleton|
 :pattern ( (|MultiSet#Singleton| arg0@@45))
)))
(assert (forall ((r@@0 T@U) ) (!  (and (= (|MultiSet#Card| (|MultiSet#Singleton| r@@0)) 1) (= (|MultiSet#Select| (|MultiSet#Singleton| r@@0) r@@0) 1))
 :qid |stdinbpl.364:18|
 :skolemid |62|
 :pattern ( (|MultiSet#Singleton| r@@0))
)))
(assert  (not (IsPredicateField f_7)))
(assert  (not (IsWandField f_7)))
(assert (forall ((Heap@@6 T@U) (ExhaleHeap@@3 T@U) (Mask@@4 T@U) ) (!  (=> (and (and (and (= (type Heap@@6) (MapType0Type RefType)) (= (type ExhaleHeap@@3) (MapType0Type RefType))) (= (type Mask@@4) (MapType2Type RefType realType))) (IdenticalOnKnownLocations Heap@@6 ExhaleHeap@@3 Mask@@4)) (succHeap Heap@@6 ExhaleHeap@@3))
 :qid |stdinbpl.83:15|
 :skolemid |10|
 :pattern ( (IdenticalOnKnownLocations Heap@@6 ExhaleHeap@@3 Mask@@4))
)))
(assert (forall ((a@@10 T@U) (b@@8 T@U) ) (! (let ((T@@17 (MapType1TypeInv0 (type a@@10))))
 (=> (and (= (type a@@10) (MapType1Type T@@17 boolType)) (= (type b@@8) (MapType1Type T@@17 boolType))) (= (|Set#Equal| a@@10 b@@8) (forall ((o@@2 T@U) ) (!  (=> (= (type o@@2) T@@17) (= (U_2_bool (MapType1Select a@@10 o@@2)) (U_2_bool (MapType1Select b@@8 o@@2))))
 :qid |stdinbpl.317:31|
 :skolemid |48|
 :pattern ( (MapType1Select a@@10 o@@2))
 :pattern ( (MapType1Select b@@8 o@@2))
)))))
 :qid |stdinbpl.316:17|
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
(assert (forall ((arg1@@28 T@U) (arg2@@8 Real) (arg3@@5 T@U) (arg4@@1 Real) ) (!  (=> (and (= (type arg1@@28) RefType) (= (type arg3@@5) RefType)) (IsWandField (wand arg1@@28 arg2@@8 arg3@@5 arg4@@1)))
 :qid |stdinbpl.434:15|
 :skolemid |82|
 :pattern ( (wand arg1@@28 arg2@@8 arg3@@5 arg4@@1))
)))
(assert (forall ((arg0@@46 T@U) (arg1@@29 Real) (arg2@@9 T@U) (arg3@@6 Real) ) (! (= (type (|wand#ft| arg0@@46 arg1@@29 arg2@@9 arg3@@6)) (FieldType WandType_wandType FrameTypeType))
 :qid |funType:wand#ft|
 :pattern ( (|wand#ft| arg0@@46 arg1@@29 arg2@@9 arg3@@6))
)))
(assert (forall ((arg1@@30 T@U) (arg2@@10 Real) (arg3@@7 T@U) (arg4@@2 Real) ) (!  (=> (and (= (type arg1@@30) RefType) (= (type arg3@@7) RefType)) (IsWandField (|wand#ft| arg1@@30 arg2@@10 arg3@@7 arg4@@2)))
 :qid |stdinbpl.438:15|
 :skolemid |83|
 :pattern ( (|wand#ft| arg1@@30 arg2@@10 arg3@@7 arg4@@2))
)))
(assert (forall ((arg1@@31 T@U) (arg2@@11 Real) (arg3@@8 T@U) (arg4@@3 Real) ) (!  (=> (and (= (type arg1@@31) (MapType1Type RefType boolType)) (= (type arg3@@8) (MapType1Type RefType boolType))) (IsWandField (wand_1 arg1@@31 arg2@@11 arg3@@8 arg4@@3)))
 :qid |stdinbpl.466:15|
 :skolemid |89|
 :pattern ( (wand_1 arg1@@31 arg2@@11 arg3@@8 arg4@@3))
)))
(assert (forall ((arg0@@47 T@U) (arg1@@32 Real) (arg2@@12 T@U) (arg3@@9 Real) ) (! (= (type (|wand_1#ft| arg0@@47 arg1@@32 arg2@@12 arg3@@9)) (FieldType WandType_wand_1Type FrameTypeType))
 :qid |funType:wand_1#ft|
 :pattern ( (|wand_1#ft| arg0@@47 arg1@@32 arg2@@12 arg3@@9))
)))
(assert (forall ((arg1@@33 T@U) (arg2@@13 Real) (arg3@@10 T@U) (arg4@@4 Real) ) (!  (=> (and (= (type arg1@@33) (MapType1Type RefType boolType)) (= (type arg3@@10) (MapType1Type RefType boolType))) (IsWandField (|wand_1#ft| arg1@@33 arg2@@13 arg3@@10 arg4@@4)))
 :qid |stdinbpl.470:15|
 :skolemid |90|
 :pattern ( (|wand_1#ft| arg1@@33 arg2@@13 arg3@@10 arg4@@4))
)))
(assert (forall ((a@@11 T@U) (b@@9 T@U) ) (! (let ((T@@18 (MultiSetTypeInv0 (type a@@11))))
 (=> (and (= (type a@@11) (MultiSetType T@@18)) (= (type b@@9) (MultiSetType T@@18))) (= (|MultiSet#Card| (|MultiSet#Union| a@@11 b@@9)) (+ (|MultiSet#Card| a@@11) (|MultiSet#Card| b@@9)))))
 :qid |stdinbpl.382:18|
 :skolemid |68|
 :pattern ( (|MultiSet#Card| (|MultiSet#Union| a@@11 b@@9)))
 :pattern ( (|MultiSet#Card| a@@11) (|MultiSet#Union| a@@11 b@@9))
 :pattern ( (|MultiSet#Card| b@@9) (|MultiSet#Union| a@@11 b@@9))
)))
(assert  (and (forall ((arg0@@48 Real) (arg1@@34 T@U) ) (! (= (type (ConditionalFrame arg0@@48 arg1@@34)) FrameTypeType)
 :qid |funType:ConditionalFrame|
 :pattern ( (ConditionalFrame arg0@@48 arg1@@34))
)) (= (type EmptyFrame) FrameTypeType)))
(assert (forall ((p@@0 Real) (f_6 T@U) ) (!  (=> (= (type f_6) FrameTypeType) (= (ConditionalFrame p@@0 f_6) (ite (> p@@0 0.0) f_6 EmptyFrame)))
 :qid |stdinbpl.218:15|
 :skolemid |19|
 :pattern ( (ConditionalFrame p@@0 f_6))
)))
(assert (forall ((arg1@@35 T@U) (arg2@@14 Real) (arg3@@11 T@U) (arg4@@5 Real) ) (!  (=> (and (= (type arg1@@35) RefType) (= (type arg3@@11) RefType)) (not (IsPredicateField (wand arg1@@35 arg2@@14 arg3@@11 arg4@@5))))
 :qid |stdinbpl.442:15|
 :skolemid |84|
 :pattern ( (wand arg1@@35 arg2@@14 arg3@@11 arg4@@5))
)))
(assert (forall ((arg1@@36 T@U) (arg2@@15 Real) (arg3@@12 T@U) (arg4@@6 Real) ) (!  (=> (and (= (type arg1@@36) RefType) (= (type arg3@@12) RefType)) (not (IsPredicateField (|wand#ft| arg1@@36 arg2@@15 arg3@@12 arg4@@6))))
 :qid |stdinbpl.446:15|
 :skolemid |85|
 :pattern ( (|wand#ft| arg1@@36 arg2@@15 arg3@@12 arg4@@6))
)))
(assert (forall ((arg1@@37 T@U) (arg2@@16 Real) (arg3@@13 T@U) (arg4@@7 Real) ) (!  (=> (and (= (type arg1@@37) (MapType1Type RefType boolType)) (= (type arg3@@13) (MapType1Type RefType boolType))) (not (IsPredicateField (wand_1 arg1@@37 arg2@@16 arg3@@13 arg4@@7))))
 :qid |stdinbpl.474:15|
 :skolemid |91|
 :pattern ( (wand_1 arg1@@37 arg2@@16 arg3@@13 arg4@@7))
)))
(assert (forall ((arg1@@38 T@U) (arg2@@17 Real) (arg3@@14 T@U) (arg4@@8 Real) ) (!  (=> (and (= (type arg1@@38) (MapType1Type RefType boolType)) (= (type arg3@@14) (MapType1Type RefType boolType))) (not (IsPredicateField (|wand_1#ft| arg1@@38 arg2@@17 arg3@@14 arg4@@8))))
 :qid |stdinbpl.478:15|
 :skolemid |92|
 :pattern ( (|wand_1#ft| arg1@@38 arg2@@17 arg3@@14 arg4@@8))
)))
(assert (forall ((Mask@@5 T@U) (o_2@@0 T@U) (f_4@@0 T@U) ) (! (let ((B@@3 (FieldTypeInv1 (type f_4@@0))))
(let ((A@@4 (FieldTypeInv0 (type f_4@@0))))
 (=> (and (and (= (type Mask@@5) (MapType2Type RefType realType)) (= (type o_2@@0) RefType)) (= (type f_4@@0) (FieldType A@@4 B@@3))) (= (HasDirectPerm Mask@@5 o_2@@0 f_4@@0) (> (U_2_real (MapType2Select Mask@@5 o_2@@0 f_4@@0)) NoPerm)))))
 :qid |stdinbpl.133:22|
 :skolemid |17|
 :pattern ( (HasDirectPerm Mask@@5 o_2@@0 f_4@@0))
)))
(assert (forall ((arg0@@49 T@U) (arg1@@39 Real) (arg2@@18 T@U) (arg3@@15 Real) ) (! (= (type (|wand#sm| arg0@@49 arg1@@39 arg2@@18 arg3@@15)) (FieldType WandType_wandType (MapType2Type RefType boolType)))
 :qid |funType:wand#sm|
 :pattern ( (|wand#sm| arg0@@49 arg1@@39 arg2@@18 arg3@@15))
)))
(assert (forall ((arg1@@40 T@U) (arg2@@19 Real) (arg3@@16 T@U) (arg4@@9 Real) ) (!  (=> (and (= (type arg1@@40) RefType) (= (type arg3@@16) RefType)) (= (|wand#sm| arg1@@40 arg2@@19 arg3@@16 arg4@@9) (WandMaskField (|wand#ft| arg1@@40 arg2@@19 arg3@@16 arg4@@9))))
 :qid |stdinbpl.450:15|
 :skolemid |86|
 :pattern ( (WandMaskField (|wand#ft| arg1@@40 arg2@@19 arg3@@16 arg4@@9)))
)))
(assert (forall ((arg0@@50 T@U) (arg1@@41 Real) (arg2@@20 T@U) (arg3@@17 Real) ) (! (= (type (|wand_1#sm| arg0@@50 arg1@@41 arg2@@20 arg3@@17)) (FieldType WandType_wand_1Type (MapType2Type RefType boolType)))
 :qid |funType:wand_1#sm|
 :pattern ( (|wand_1#sm| arg0@@50 arg1@@41 arg2@@20 arg3@@17))
)))
(assert (forall ((arg1@@42 T@U) (arg2@@21 Real) (arg3@@18 T@U) (arg4@@10 Real) ) (!  (=> (and (= (type arg1@@42) (MapType1Type RefType boolType)) (= (type arg3@@18) (MapType1Type RefType boolType))) (= (|wand_1#sm| arg1@@42 arg2@@21 arg3@@18 arg4@@10) (WandMaskField (|wand_1#ft| arg1@@42 arg2@@21 arg3@@18 arg4@@10))))
 :qid |stdinbpl.482:15|
 :skolemid |93|
 :pattern ( (WandMaskField (|wand_1#ft| arg1@@42 arg2@@21 arg3@@18 arg4@@10)))
)))
(assert (forall ((o_2@@1 T@U) (f_4@@1 T@U) ) (! (let ((B@@4 (FieldTypeInv1 (type f_4@@1))))
(let ((A@@5 (FieldTypeInv0 (type f_4@@1))))
 (=> (and (= (type o_2@@1) RefType) (= (type f_4@@1) (FieldType A@@5 B@@4))) (= (U_2_real (MapType2Select ZeroMask o_2@@1 f_4@@1)) NoPerm))))
 :qid |stdinbpl.106:22|
 :skolemid |13|
 :pattern ( (MapType2Select ZeroMask o_2@@1 f_4@@1))
)))
(assert (forall ((a@@12 T@U) (b@@10 T@U) (o@@3 T@U) ) (! (let ((T@@19 (type o@@3)))
 (=> (and (= (type a@@12) (MapType1Type T@@19 boolType)) (= (type b@@10) (MapType1Type T@@19 boolType))) (= (U_2_bool (MapType1Select (|Set#Intersection| a@@12 b@@10) o@@3))  (and (U_2_bool (MapType1Select a@@12 o@@3)) (U_2_bool (MapType1Select b@@10 o@@3))))))
 :qid |stdinbpl.281:18|
 :skolemid |37|
 :pattern ( (MapType1Select (|Set#Intersection| a@@12 b@@10) o@@3))
 :pattern ( (|Set#Intersection| a@@12 b@@10) (MapType1Select a@@12 o@@3))
 :pattern ( (|Set#Intersection| a@@12 b@@10) (MapType1Select b@@10 o@@3))
)))
(assert (forall ((arg0@@51 T@U) (arg1@@43 T@U) ) (! (let ((T@@20 (MapType1TypeInv0 (type arg0@@51))))
(= (type (|Set#Difference| arg0@@51 arg1@@43)) (MapType1Type T@@20 boolType)))
 :qid |funType:Set#Difference|
 :pattern ( (|Set#Difference| arg0@@51 arg1@@43))
)))
(assert (forall ((a@@13 T@U) (b@@11 T@U) (o@@4 T@U) ) (! (let ((T@@21 (type o@@4)))
 (=> (and (= (type a@@13) (MapType1Type T@@21 boolType)) (= (type b@@11) (MapType1Type T@@21 boolType))) (= (U_2_bool (MapType1Select (|Set#Difference| a@@13 b@@11) o@@4))  (and (U_2_bool (MapType1Select a@@13 o@@4)) (not (U_2_bool (MapType1Select b@@11 o@@4)))))))
 :qid |stdinbpl.296:18|
 :skolemid |43|
 :pattern ( (MapType1Select (|Set#Difference| a@@13 b@@11) o@@4))
 :pattern ( (|Set#Difference| a@@13 b@@11) (MapType1Select a@@13 o@@4))
)))
(assert (forall ((a@@14 T@U) (b@@12 T@U) ) (! (let ((T@@22 (MapType1TypeInv0 (type a@@14))))
 (=> (and (and (= (type a@@14) (MapType1Type T@@22 boolType)) (= (type b@@12) (MapType1Type T@@22 boolType))) (|Set#Equal| a@@14 b@@12)) (= a@@14 b@@12)))
 :qid |stdinbpl.318:17|
 :skolemid |50|
 :pattern ( (|Set#Equal| a@@14 b@@12))
)))
(assert (forall ((a@@15 T@U) (b@@13 T@U) ) (! (let ((T@@23 (MultiSetTypeInv0 (type a@@15))))
 (=> (and (and (= (type a@@15) (MultiSetType T@@23)) (= (type b@@13) (MultiSetType T@@23))) (|MultiSet#Equal| a@@15 b@@13)) (= a@@15 b@@13)))
 :qid |stdinbpl.417:17|
 :skolemid |79|
 :pattern ( (|MultiSet#Equal| a@@15 b@@13))
)))
(assert (forall ((arg0@@52 T@U) (arg1@@44 T@U) ) (! (let ((T@@24 (type arg1@@44)))
(= (type (|Set#UnionOne| arg0@@52 arg1@@44)) (MapType1Type T@@24 boolType)))
 :qid |funType:Set#UnionOne|
 :pattern ( (|Set#UnionOne| arg0@@52 arg1@@44))
)))
(assert (forall ((a@@16 T@U) (x@@17 T@U) (y@@6 T@U) ) (! (let ((T@@25 (type x@@17)))
 (=> (and (and (= (type a@@16) (MapType1Type T@@25 boolType)) (= (type y@@6) T@@25)) (U_2_bool (MapType1Select a@@16 y@@6))) (U_2_bool (MapType1Select (|Set#UnionOne| a@@16 x@@17) y@@6))))
 :qid |stdinbpl.261:18|
 :skolemid |31|
 :pattern ( (|Set#UnionOne| a@@16 x@@17) (MapType1Select a@@16 y@@6))
)))
(assert (forall ((a@@17 T@U) (b@@14 T@U) (y@@7 T@U) ) (! (let ((T@@26 (type y@@7)))
 (=> (and (and (= (type a@@17) (MapType1Type T@@26 boolType)) (= (type b@@14) (MapType1Type T@@26 boolType))) (U_2_bool (MapType1Select a@@17 y@@7))) (U_2_bool (MapType1Select (|Set#Union| a@@17 b@@14) y@@7))))
 :qid |stdinbpl.271:18|
 :skolemid |35|
 :pattern ( (|Set#Union| a@@17 b@@14) (MapType1Select a@@17 y@@7))
)))
(assert (forall ((a@@18 T@U) (b@@15 T@U) (y@@8 T@U) ) (! (let ((T@@27 (type y@@8)))
 (=> (and (and (= (type a@@18) (MapType1Type T@@27 boolType)) (= (type b@@15) (MapType1Type T@@27 boolType))) (U_2_bool (MapType1Select b@@15 y@@8))) (U_2_bool (MapType1Select (|Set#Union| a@@18 b@@15) y@@8))))
 :qid |stdinbpl.273:18|
 :skolemid |36|
 :pattern ( (|Set#Union| a@@18 b@@15) (MapType1Select b@@15 y@@8))
)))
(assert (forall ((ms T@U) (x@@18 T@U) ) (! (let ((T@@28 (type x@@18)))
 (=> (= (type ms) (MultiSetType T@@28)) (>= (|MultiSet#Select| ms x@@18) 0)))
 :qid |stdinbpl.348:18|
 :skolemid |56|
 :pattern ( (|MultiSet#Select| ms x@@18))
)))
(assert (forall ((a@@19 T@U) (x@@19 T@U) (o@@5 T@U) ) (! (let ((T@@29 (type x@@19)))
 (=> (and (= (type a@@19) (MapType1Type T@@29 boolType)) (= (type o@@5) T@@29)) (= (U_2_bool (MapType1Select (|Set#UnionOne| a@@19 x@@19) o@@5))  (or (= o@@5 x@@19) (U_2_bool (MapType1Select a@@19 o@@5))))))
 :qid |stdinbpl.257:18|
 :skolemid |29|
 :pattern ( (MapType1Select (|Set#UnionOne| a@@19 x@@19) o@@5))
)))
(assert (forall ((a@@20 T@U) (b@@16 T@U) (y@@9 T@U) ) (! (let ((T@@30 (type y@@9)))
 (=> (and (and (= (type a@@20) (MapType1Type T@@30 boolType)) (= (type b@@16) (MapType1Type T@@30 boolType))) (U_2_bool (MapType1Select b@@16 y@@9))) (not (U_2_bool (MapType1Select (|Set#Difference| a@@20 b@@16) y@@9)))))
 :qid |stdinbpl.298:18|
 :skolemid |44|
 :pattern ( (|Set#Difference| a@@20 b@@16) (MapType1Select b@@16 y@@9))
)))
(assert (forall ((a@@21 T@U) (b@@17 T@U) ) (! (let ((T@@31 (MapType1TypeInv0 (type a@@21))))
 (=> (and (= (type a@@21) (MapType1Type T@@31 boolType)) (= (type b@@17) (MapType1Type T@@31 boolType))) (and (= (+ (+ (|Set#Card| (|Set#Difference| a@@21 b@@17)) (|Set#Card| (|Set#Difference| b@@17 a@@21))) (|Set#Card| (|Set#Intersection| a@@21 b@@17))) (|Set#Card| (|Set#Union| a@@21 b@@17))) (= (|Set#Card| (|Set#Difference| a@@21 b@@17)) (- (|Set#Card| a@@21) (|Set#Card| (|Set#Intersection| a@@21 b@@17)))))))
 :qid |stdinbpl.300:18|
 :skolemid |45|
 :pattern ( (|Set#Card| (|Set#Difference| a@@21 b@@17)))
)))
(assert (forall ((s T@U) ) (! (let ((T@@32 (MapType1TypeInv0 (type s))))
 (=> (= (type s) (MapType1Type T@@32 boolType)) (<= 0 (|Set#Card| s))))
 :qid |stdinbpl.243:18|
 :skolemid |22|
 :pattern ( (|Set#Card| s))
)))
(assert (forall ((s@@0 T@U) ) (! (let ((T@@33 (MultiSetTypeInv0 (type s@@0))))
 (=> (= (type s@@0) (MultiSetType T@@33)) (<= 0 (|MultiSet#Card| s@@0))))
 :qid |stdinbpl.351:18|
 :skolemid |57|
 :pattern ( (|MultiSet#Card| s@@0))
)))
(assert (forall ((T@@34 T@T) ) (! (= (type (|MultiSet#Empty| T@@34)) (MultiSetType T@@34))
 :qid |funType:MultiSet#Empty|
 :pattern ( (|MultiSet#Empty| T@@34))
)))
(assert (forall ((o@@6 T@U) ) (! (let ((T@@35 (type o@@6)))
(= (|MultiSet#Select| (|MultiSet#Empty| T@@35) o@@6) 0))
 :qid |stdinbpl.356:18|
 :skolemid |58|
 :pattern ( (let ((T@@35 (type o@@6)))
(|MultiSet#Select| (|MultiSet#Empty| T@@35) o@@6)))
)))
(assert (forall ((x@@20 T@U) (i@@3 Int) ) (!  (=> (= (type x@@20) RefType) (= (getPredWandId (P x@@20 i@@3)) 0))
 :qid |stdinbpl.518:15|
 :skolemid |98|
 :pattern ( (P x@@20 i@@3))
)))
(assert (forall ((x@@21 T@U) (y@@10 T@U) ) (!  (=> (and (= (type x@@21) RefType) (= (type y@@10) RefType)) (= (getPredWandId (p2 x@@21 y@@10)) 1))
 :qid |stdinbpl.576:15|
 :skolemid |104|
 :pattern ( (p2 x@@21 y@@10))
)))
(assert (forall ((a@@22 T@U) (x@@22 T@U) ) (! (let ((T@@36 (type x@@22)))
 (=> (= (type a@@22) (MapType1Type T@@36 boolType)) (U_2_bool (MapType1Select (|Set#UnionOne| a@@22 x@@22) x@@22))))
 :qid |stdinbpl.259:18|
 :skolemid |30|
 :pattern ( (|Set#UnionOne| a@@22 x@@22))
)))
(assert (forall ((Heap@@7 T@U) (ExhaleHeap@@4 T@U) (Mask@@6 T@U) (pm_f@@1 T@U) ) (! (let ((C@@1 (FieldTypeInv0 (type pm_f@@1))))
 (=> (and (and (and (and (and (= (type Heap@@7) (MapType0Type RefType)) (= (type ExhaleHeap@@4) (MapType0Type RefType))) (= (type Mask@@6) (MapType2Type RefType realType))) (= (type pm_f@@1) (FieldType C@@1 FrameTypeType))) (IdenticalOnKnownLocations Heap@@7 ExhaleHeap@@4 Mask@@6)) (and (HasDirectPerm Mask@@6 null pm_f@@1) (IsPredicateField pm_f@@1))) (forall ((o2 T@U) (f_2@@0 T@U) ) (! (let ((B@@5 (FieldTypeInv1 (type f_2@@0))))
(let ((A@@6 (FieldTypeInv0 (type f_2@@0))))
 (=> (and (and (= (type o2) RefType) (= (type f_2@@0) (FieldType A@@6 B@@5))) (U_2_bool (MapType2Select (MapType0Select Heap@@7 null (PredicateMaskField pm_f@@1)) o2 f_2@@0))) (= (MapType0Select Heap@@7 o2 f_2@@0) (MapType0Select ExhaleHeap@@4 o2 f_2@@0)))))
 :qid |stdinbpl.54:134|
 :skolemid |3|
 :pattern ( (MapType0Select ExhaleHeap@@4 o2 f_2@@0))
))))
 :qid |stdinbpl.52:19|
 :skolemid |4|
 :pattern ( (IdenticalOnKnownLocations Heap@@7 ExhaleHeap@@4 Mask@@6) (IsPredicateField pm_f@@1))
)))
(assert (forall ((Heap@@8 T@U) (ExhaleHeap@@5 T@U) (Mask@@7 T@U) (pm_f@@2 T@U) ) (! (let ((C@@2 (FieldTypeInv0 (type pm_f@@2))))
 (=> (and (and (and (and (and (= (type Heap@@8) (MapType0Type RefType)) (= (type ExhaleHeap@@5) (MapType0Type RefType))) (= (type Mask@@7) (MapType2Type RefType realType))) (= (type pm_f@@2) (FieldType C@@2 FrameTypeType))) (IdenticalOnKnownLocations Heap@@8 ExhaleHeap@@5 Mask@@7)) (and (HasDirectPerm Mask@@7 null pm_f@@2) (IsWandField pm_f@@2))) (forall ((o2@@0 T@U) (f_2@@1 T@U) ) (! (let ((B@@6 (FieldTypeInv1 (type f_2@@1))))
(let ((A@@7 (FieldTypeInv0 (type f_2@@1))))
 (=> (and (and (= (type o2@@0) RefType) (= (type f_2@@1) (FieldType A@@7 B@@6))) (U_2_bool (MapType2Select (MapType0Select Heap@@8 null (WandMaskField pm_f@@2)) o2@@0 f_2@@1))) (= (MapType0Select Heap@@8 o2@@0 f_2@@1) (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1)))))
 :qid |stdinbpl.67:129|
 :skolemid |6|
 :pattern ( (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1))
))))
 :qid |stdinbpl.65:19|
 :skolemid |7|
 :pattern ( (IdenticalOnKnownLocations Heap@@8 ExhaleHeap@@5 Mask@@7) (IsWandField pm_f@@2))
)))
(assert (forall ((a@@23 T@U) (x@@23 T@U) ) (! (let ((T@@37 (type x@@23)))
 (=> (and (= (type a@@23) (MapType1Type T@@37 boolType)) (U_2_bool (MapType1Select a@@23 x@@23))) (= (|Set#Card| (|Set#UnionOne| a@@23 x@@23)) (|Set#Card| a@@23))))
 :qid |stdinbpl.263:18|
 :skolemid |32|
 :pattern ( (|Set#Card| (|Set#UnionOne| a@@23 x@@23)))
)))
(assert (forall ((a@@24 T@U) (x@@24 T@U) ) (! (let ((T@@38 (type x@@24)))
 (=> (= (type a@@24) (MultiSetType T@@38)) (and (> (|MultiSet#Select| (|MultiSet#UnionOne| a@@24 x@@24) x@@24) 0) (> (|MultiSet#Card| (|MultiSet#UnionOne| a@@24 x@@24)) 0))))
 :qid |stdinbpl.375:18|
 :skolemid |66|
 :pattern ( (|MultiSet#UnionOne| a@@24 x@@24))
)))
(assert (forall ((r@@1 T@U) ) (! (= (|Set#Card| (|Set#Singleton| r@@1)) 1)
 :qid |stdinbpl.254:18|
 :skolemid |28|
 :pattern ( (|Set#Card| (|Set#Singleton| r@@1)))
)))
(assert (forall ((Mask@@8 T@U) (o_2@@2 T@U) (f_4@@2 T@U) ) (! (let ((B@@7 (FieldTypeInv1 (type f_4@@2))))
(let ((A@@8 (FieldTypeInv0 (type f_4@@2))))
 (=> (and (and (and (= (type Mask@@8) (MapType2Type RefType realType)) (= (type o_2@@2) RefType)) (= (type f_4@@2) (FieldType A@@8 B@@7))) (GoodMask Mask@@8)) (and (>= (U_2_real (MapType2Select Mask@@8 o_2@@2 f_4@@2)) NoPerm) (=> (and (and (GoodMask Mask@@8) (not (IsPredicateField f_4@@2))) (not (IsWandField f_4@@2))) (<= (U_2_real (MapType2Select Mask@@8 o_2@@2 f_4@@2)) FullPerm))))))
 :qid |stdinbpl.128:22|
 :skolemid |16|
 :pattern ( (GoodMask Mask@@8) (MapType2Select Mask@@8 o_2@@2 f_4@@2))
)))
(assert (forall ((r@@2 T@U) ) (! (U_2_bool (MapType1Select (|Set#Singleton| r@@2) r@@2))
 :qid |stdinbpl.252:18|
 :skolemid |26|
 :pattern ( (|Set#Singleton| r@@2))
)))
(assert (forall ((a@@25 T@U) (b@@18 T@U) ) (! (let ((T@@39 (MapType1TypeInv0 (type a@@25))))
 (=> (and (= (type a@@25) (MapType1Type T@@39 boolType)) (= (type b@@18) (MapType1Type T@@39 boolType))) (= (|Set#Union| a@@25 (|Set#Union| a@@25 b@@18)) (|Set#Union| a@@25 b@@18))))
 :qid |stdinbpl.286:18|
 :skolemid |39|
 :pattern ( (|Set#Union| a@@25 (|Set#Union| a@@25 b@@18)))
)))
(assert (forall ((a@@26 T@U) (b@@19 T@U) ) (! (let ((T@@40 (MapType1TypeInv0 (type a@@26))))
 (=> (and (= (type a@@26) (MapType1Type T@@40 boolType)) (= (type b@@19) (MapType1Type T@@40 boolType))) (= (|Set#Intersection| a@@26 (|Set#Intersection| a@@26 b@@19)) (|Set#Intersection| a@@26 b@@19))))
 :qid |stdinbpl.290:18|
 :skolemid |41|
 :pattern ( (|Set#Intersection| a@@26 (|Set#Intersection| a@@26 b@@19)))
)))
(assert (forall ((a@@27 T@U) (b@@20 T@U) ) (! (let ((T@@41 (MultiSetTypeInv0 (type a@@27))))
 (=> (and (= (type a@@27) (MultiSetType T@@41)) (= (type b@@20) (MultiSetType T@@41))) (= (|MultiSet#Intersection| a@@27 (|MultiSet#Intersection| a@@27 b@@20)) (|MultiSet#Intersection| a@@27 b@@20))))
 :qid |stdinbpl.392:18|
 :skolemid |71|
 :pattern ( (|MultiSet#Intersection| a@@27 (|MultiSet#Intersection| a@@27 b@@20)))
)))
(assert (forall ((s@@1 T@U) ) (! (let ((T@@42 (MultiSetTypeInv0 (type s@@1))))
 (=> (= (type s@@1) (MultiSetType T@@42)) (and (= (= (|MultiSet#Card| s@@1) 0) (= s@@1 (|MultiSet#Empty| T@@42))) (=> (not (= (|MultiSet#Card| s@@1) 0)) (exists ((x@@25 T@U) ) (!  (and (= (type x@@25) T@@42) (< 0 (|MultiSet#Select| s@@1 x@@25)))
 :qid |stdinbpl.359:38|
 :skolemid |59|
 :no-pattern (type x@@25)
 :no-pattern (U_2_int x@@25)
 :no-pattern (U_2_bool x@@25)
))))))
 :qid |stdinbpl.357:18|
 :skolemid |60|
 :pattern ( (|MultiSet#Card| s@@1))
)))
(assert (forall ((r@@3 T@U) (o@@7 T@U) ) (! (let ((T@@43 (type r@@3)))
 (=> (= (type o@@7) T@@43) (and (= (= (|MultiSet#Select| (|MultiSet#Singleton| r@@3) o@@7) 1) (= r@@3 o@@7)) (= (= (|MultiSet#Select| (|MultiSet#Singleton| r@@3) o@@7) 0) (not (= r@@3 o@@7))))))
 :qid |stdinbpl.362:18|
 :skolemid |61|
 :pattern ( (|MultiSet#Select| (|MultiSet#Singleton| r@@3) o@@7))
)))
(assert (forall ((o@@8 T@U) (f T@U) (Heap@@9 T@U) ) (!  (=> (and (and (and (= (type o@@8) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap@@9) (MapType0Type RefType))) (U_2_bool (MapType0Select Heap@@9 o@@8 $allocated))) (U_2_bool (MapType0Select Heap@@9 (MapType0Select Heap@@9 o@@8 f) $allocated)))
 :qid |stdinbpl.31:15|
 :skolemid |0|
 :pattern ( (MapType0Select Heap@@9 o@@8 f))
)))
(assert (forall ((x@@26 T@U) (i@@4 Int) ) (!  (=> (= (type x@@26) RefType) (= (PredicateMaskField (P x@@26 i@@4)) (|P#sm| x@@26 i@@4)))
 :qid |stdinbpl.510:15|
 :skolemid |96|
 :pattern ( (PredicateMaskField (P x@@26 i@@4)))
)))
(assert (forall ((x@@27 T@U) (y@@11 T@U) ) (!  (=> (and (= (type x@@27) RefType) (= (type y@@11) RefType)) (= (PredicateMaskField (p2 x@@27 y@@11)) (|p2#sm| x@@27 y@@11)))
 :qid |stdinbpl.568:15|
 :skolemid |102|
 :pattern ( (PredicateMaskField (p2 x@@27 y@@11)))
)))
(assert (forall ((a@@28 T@U) (b@@21 T@U) (o@@9 T@U) ) (! (let ((T@@44 (type o@@9)))
 (=> (and (= (type a@@28) (MultiSetType T@@44)) (= (type b@@21) (MultiSetType T@@44))) (= (|MultiSet#Select| (|MultiSet#Union| a@@28 b@@21) o@@9) (+ (|MultiSet#Select| a@@28 o@@9) (|MultiSet#Select| b@@21 o@@9)))))
 :qid |stdinbpl.380:18|
 :skolemid |67|
 :pattern ( (|MultiSet#Select| (|MultiSet#Union| a@@28 b@@21) o@@9))
 :pattern ( (|MultiSet#Union| a@@28 b@@21) (|MultiSet#Select| a@@28 o@@9) (|MultiSet#Select| b@@21 o@@9))
)))
(assert (forall ((T@@45 T@T) ) (! (= (type (|Set#Empty| T@@45)) (MapType1Type T@@45 boolType))
 :qid |funType:Set#Empty|
 :pattern ( (|Set#Empty| T@@45))
)))
(assert (forall ((o@@10 T@U) ) (! (let ((T@@46 (type o@@10)))
 (not (U_2_bool (MapType1Select (|Set#Empty| T@@46) o@@10))))
 :qid |stdinbpl.246:18|
 :skolemid |23|
 :pattern ( (let ((T@@46 (type o@@10)))
(MapType1Select (|Set#Empty| T@@46) o@@10)))
)))
(assert (forall ((r@@4 T@U) ) (! (let ((T@@47 (type r@@4)))
(= (|MultiSet#Singleton| r@@4) (|MultiSet#UnionOne| (|MultiSet#Empty| T@@47) r@@4)))
 :qid |stdinbpl.365:18|
 :skolemid |63|
 :pattern ( (|MultiSet#Singleton| r@@4))
)))
(assert (forall ((a@@29 Int) (b@@22 Int) ) (! (= (<= a@@29 b@@22) (= (|Math#min| a@@29 b@@22) a@@29))
 :qid |stdinbpl.330:15|
 :skolemid |51|
 :pattern ( (|Math#min| a@@29 b@@22))
)))
(assert (forall ((a@@30 Int) (b@@23 Int) ) (! (= (<= b@@23 a@@30) (= (|Math#min| a@@30 b@@23) b@@23))
 :qid |stdinbpl.331:15|
 :skolemid |52|
 :pattern ( (|Math#min| a@@30 b@@23))
)))
(assert (forall ((s@@2 T@U) ) (! (let ((T@@48 (MapType1TypeInv0 (type s@@2))))
 (=> (= (type s@@2) (MapType1Type T@@48 boolType)) (and (= (= (|Set#Card| s@@2) 0) (= s@@2 (|Set#Empty| T@@48))) (=> (not (= (|Set#Card| s@@2) 0)) (exists ((x@@28 T@U) ) (!  (and (= (type x@@28) T@@48) (U_2_bool (MapType1Select s@@2 x@@28)))
 :qid |stdinbpl.249:33|
 :skolemid |24|
 :no-pattern (type x@@28)
 :no-pattern (U_2_int x@@28)
 :no-pattern (U_2_bool x@@28)
))))))
 :qid |stdinbpl.247:18|
 :skolemid |25|
 :pattern ( (|Set#Card| s@@2))
)))
(assert (forall ((Heap@@10 T@U) (o@@11 T@U) (f_3 T@U) (v T@U) ) (! (let ((B@@8 (type v)))
(let ((A@@9 (FieldTypeInv0 (type f_3))))
 (=> (and (and (= (type Heap@@10) (MapType0Type RefType)) (= (type o@@11) RefType)) (= (type f_3) (FieldType A@@9 B@@8))) (succHeap Heap@@10 (MapType0Store Heap@@10 o@@11 f_3 v)))))
 :qid |stdinbpl.78:22|
 :skolemid |9|
 :pattern ( (MapType0Store Heap@@10 o@@11 f_3 v))
)))
(assert (forall ((a@@31 T@U) (b@@24 T@U) ) (! (let ((T@@49 (MapType1TypeInv0 (type a@@31))))
 (=> (and (= (type a@@31) (MapType1Type T@@49 boolType)) (= (type b@@24) (MapType1Type T@@49 boolType))) (= (|Set#Subset| a@@31 b@@24) (forall ((o@@12 T@U) ) (!  (=> (and (= (type o@@12) T@@49) (U_2_bool (MapType1Select a@@31 o@@12))) (U_2_bool (MapType1Select b@@24 o@@12)))
 :qid |stdinbpl.309:32|
 :skolemid |46|
 :pattern ( (MapType1Select a@@31 o@@12))
 :pattern ( (MapType1Select b@@24 o@@12))
)))))
 :qid |stdinbpl.308:17|
 :skolemid |47|
 :pattern ( (|Set#Subset| a@@31 b@@24))
)))
(assert (forall ((a@@32 T@U) (x@@29 T@U) ) (! (let ((T@@50 (type x@@29)))
 (=> (and (= (type a@@32) (MapType1Type T@@50 boolType)) (not (U_2_bool (MapType1Select a@@32 x@@29)))) (= (|Set#Card| (|Set#UnionOne| a@@32 x@@29)) (+ (|Set#Card| a@@32) 1))))
 :qid |stdinbpl.265:18|
 :skolemid |33|
 :pattern ( (|Set#Card| (|Set#UnionOne| a@@32 x@@29)))
)))
(assert (forall ((a@@33 T@U) (b@@25 T@U) (o@@13 T@U) ) (! (let ((T@@51 (type o@@13)))
 (=> (and (= (type a@@33) (MultiSetType T@@51)) (= (type b@@25) (MultiSetType T@@51))) (= (|MultiSet#Select| (|MultiSet#Difference| a@@33 b@@25) o@@13) (|Math#clip| (- (|MultiSet#Select| a@@33 o@@13) (|MultiSet#Select| b@@25 o@@13))))))
 :qid |stdinbpl.397:18|
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
 :qid |stdinbpl.225:25|
 :skolemid |20|
 :pattern ( (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r@@5 u))
)))
(assert (forall ((a@@34 Int) ) (!  (=> (< a@@34 0) (= (|Math#clip| a@@34) 0))
 :qid |stdinbpl.336:15|
 :skolemid |55|
 :pattern ( (|Math#clip| a@@34))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
(assert (forall ((a@@35 T@U) (x@@30 T@U) (o@@14 T@U) ) (! (let ((T@@52 (type x@@30)))
 (=> (and (= (type a@@35) (MultiSetType T@@52)) (= (type o@@14) T@@52)) (= (|MultiSet#Select| (|MultiSet#UnionOne| a@@35 x@@30) o@@14) (ite (= x@@30 o@@14) (+ (|MultiSet#Select| a@@35 o@@14) 1) (|MultiSet#Select| a@@35 o@@14)))))
 :qid |stdinbpl.369:18|
 :skolemid |64|
 :pattern ( (|MultiSet#Select| (|MultiSet#UnionOne| a@@35 x@@30) o@@14))
 :pattern ( (|MultiSet#UnionOne| a@@35 x@@30) (|MultiSet#Select| a@@35 o@@14))
)))
(assert (forall ((a@@36 T@U) (b@@26 T@U) ) (! (let ((T@@53 (MultiSetTypeInv0 (type a@@36))))
 (=> (and (= (type a@@36) (MultiSetType T@@53)) (= (type b@@26) (MultiSetType T@@53))) (= (|MultiSet#Equal| a@@36 b@@26) (forall ((o@@15 T@U) ) (!  (=> (= (type o@@15) T@@53) (= (|MultiSet#Select| a@@36 o@@15) (|MultiSet#Select| b@@26 o@@15)))
 :qid |stdinbpl.415:36|
 :skolemid |77|
 :pattern ( (|MultiSet#Select| a@@36 o@@15))
 :pattern ( (|MultiSet#Select| b@@26 o@@15))
)))))
 :qid |stdinbpl.414:17|
 :skolemid |78|
 :pattern ( (|MultiSet#Equal| a@@36 b@@26))
)))
(assert (forall ((a@@37 T@U) (b@@27 T@U) ) (! (let ((T@@54 (MultiSetTypeInv0 (type a@@37))))
 (=> (and (= (type a@@37) (MultiSetType T@@54)) (= (type b@@27) (MultiSetType T@@54))) (= (|MultiSet#Subset| a@@37 b@@27) (forall ((o@@16 T@U) ) (!  (=> (= (type o@@16) T@@54) (<= (|MultiSet#Select| a@@37 o@@16) (|MultiSet#Select| b@@27 o@@16)))
 :qid |stdinbpl.411:37|
 :skolemid |75|
 :pattern ( (|MultiSet#Select| a@@37 o@@16))
 :pattern ( (|MultiSet#Select| b@@27 o@@16))
)))))
 :qid |stdinbpl.410:17|
 :skolemid |76|
 :pattern ( (|MultiSet#Subset| a@@37 b@@27))
)))
(assert (forall ((a@@38 T@U) (b@@28 T@U) (o@@17 T@U) ) (! (let ((T@@55 (type o@@17)))
 (=> (and (= (type a@@38) (MapType1Type T@@55 boolType)) (= (type b@@28) (MapType1Type T@@55 boolType))) (= (U_2_bool (MapType1Select (|Set#Union| a@@38 b@@28) o@@17))  (or (U_2_bool (MapType1Select a@@38 o@@17)) (U_2_bool (MapType1Select b@@28 o@@17))))))
 :qid |stdinbpl.269:18|
 :skolemid |34|
 :pattern ( (MapType1Select (|Set#Union| a@@38 b@@28) o@@17))
)))
(assert (forall ((arg1@@45 T@U) (arg2@@22 Real) (arg3@@19 T@U) (arg4@@11 Real) (arg1_2 T@U) (arg2_2 Real) (arg3_2 T@U) (arg4_2 Real) ) (!  (=> (and (and (and (and (= (type arg1@@45) RefType) (= (type arg3@@19) RefType)) (= (type arg1_2) RefType)) (= (type arg3_2) RefType)) (= (wand arg1@@45 arg2@@22 arg3@@19 arg4@@11) (wand arg1_2 arg2_2 arg3_2 arg4_2))) (and (= arg1@@45 arg1_2) (and (= arg2@@22 arg2_2) (and (= arg3@@19 arg3_2) (= arg4@@11 arg4_2)))))
 :qid |stdinbpl.458:15|
 :skolemid |88|
 :pattern ( (wand arg1@@45 arg2@@22 arg3@@19 arg4@@11) (wand arg1_2 arg2_2 arg3_2 arg4_2))
)))
(assert (forall ((arg1@@46 T@U) (arg2@@23 Real) (arg3@@20 T@U) (arg4@@12 Real) (arg1_2@@0 T@U) (arg2_2@@0 Real) (arg3_2@@0 T@U) (arg4_2@@0 Real) ) (!  (=> (and (and (and (and (= (type arg1@@46) (MapType1Type RefType boolType)) (= (type arg3@@20) (MapType1Type RefType boolType))) (= (type arg1_2@@0) (MapType1Type RefType boolType))) (= (type arg3_2@@0) (MapType1Type RefType boolType))) (= (wand_1 arg1@@46 arg2@@23 arg3@@20 arg4@@12) (wand_1 arg1_2@@0 arg2_2@@0 arg3_2@@0 arg4_2@@0))) (and (= arg1@@46 arg1_2@@0) (and (= arg2@@23 arg2_2@@0) (and (= arg3@@20 arg3_2@@0) (= arg4@@12 arg4_2@@0)))))
 :qid |stdinbpl.490:15|
 :skolemid |95|
 :pattern ( (wand_1 arg1@@46 arg2@@23 arg3@@20 arg4@@12) (wand_1 arg1_2@@0 arg2_2@@0 arg3_2@@0 arg4_2@@0))
)))
(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun ys () T@U)
(declare-fun a_20 () Real)
(declare-fun WandDefRHSHeap@0 () T@U)
(declare-fun QPMask@1 () T@U)
(declare-fun qpRange16 (T@U) Bool)
(declare-fun invRecv16 (T@U) T@U)
(declare-fun xs () T@U)
(declare-fun WandDefLHSHeap@2 () T@U)
(declare-fun QPMask@0 () T@U)
(declare-fun qpRange15 (T@U) Bool)
(declare-fun invRecv15 (T@U) T@U)
(declare-fun Mask@1 () T@U)
(declare-fun Heap@@11 () T@U)
(declare-fun Mask@0 () T@U)
(declare-fun zs () T@U)
(declare-fun WandDefLHSHeap@1 () T@U)
(declare-fun QPMask@2 () T@U)
(declare-fun qpRange13 (T@U) Bool)
(declare-fun invRecv13 (T@U) T@U)
(declare-fun WandDefLHSHeap@0 () T@U)
(declare-fun QPMask@4 () T@U)
(declare-fun qpRange11 (T@U) Bool)
(declare-fun invRecv11 (T@U) T@U)
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (= (type ys) (MapType1Type RefType boolType)) (= (type xs) (MapType1Type RefType boolType))) (= (type WandDefLHSHeap@0) (MapType0Type RefType))) (= (type QPMask@4) (MapType2Type RefType realType))) (forall ((arg0@@53 T@U) ) (! (= (type (invRecv11 arg0@@53)) RefType)
 :qid |funType:invRecv11|
 :pattern ( (invRecv11 arg0@@53))
))) (= (type zs) (MapType1Type RefType boolType))) (= (type WandDefLHSHeap@1) (MapType0Type RefType))) (= (type QPMask@2) (MapType2Type RefType realType))) (forall ((arg0@@54 T@U) ) (! (= (type (invRecv13 arg0@@54)) RefType)
 :qid |funType:invRecv13|
 :pattern ( (invRecv13 arg0@@54))
))) (= (type Mask@1) (MapType2Type RefType realType))) (= (type Heap@@11) (MapType0Type RefType))) (= (type WandDefRHSHeap@0) (MapType0Type RefType))) (= (type QPMask@1) (MapType2Type RefType realType))) (forall ((arg0@@55 T@U) ) (! (= (type (invRecv16 arg0@@55)) RefType)
 :qid |funType:invRecv16|
 :pattern ( (invRecv16 arg0@@55))
))) (= (type WandDefLHSHeap@2) (MapType0Type RefType))) (= (type QPMask@0) (MapType2Type RefType realType))) (forall ((arg0@@56 T@U) ) (! (= (type (invRecv15 arg0@@56)) RefType)
 :qid |funType:invRecv15|
 :pattern ( (invRecv15 arg0@@56))
))) (= (type Mask@0) (MapType2Type RefType realType))))
(set-info :boogie-vc-id m7)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 29) (let ((anon32_Else_correct  (and (=> (= (ControlFlow 0 20) (- 0 21)) (forall ((y_5 T@U) (y_5_1 T@U) ) (!  (=> (and (= (type y_5) RefType) (= (type y_5_1) RefType)) (=> (and (and (and (and (not (= y_5 y_5_1)) (U_2_bool (MapType1Select ys y_5))) (U_2_bool (MapType1Select ys y_5_1))) (< NoPerm a_20)) (< NoPerm a_20)) (not (= y_5 y_5_1))))
 :qid |stdinbpl.1999:23|
 :skolemid |212|
 :no-pattern (type y_5)
 :no-pattern (type y_5_1)
 :no-pattern (U_2_int y_5)
 :no-pattern (U_2_bool y_5)
 :no-pattern (U_2_int y_5_1)
 :no-pattern (U_2_bool y_5_1)
))) (=> (forall ((y_5@@0 T@U) (y_5_1@@0 T@U) ) (!  (=> (and (= (type y_5@@0) RefType) (= (type y_5_1@@0) RefType)) (=> (and (and (and (and (not (= y_5@@0 y_5_1@@0)) (U_2_bool (MapType1Select ys y_5@@0))) (U_2_bool (MapType1Select ys y_5_1@@0))) (< NoPerm a_20)) (< NoPerm a_20)) (not (= y_5@@0 y_5_1@@0))))
 :qid |stdinbpl.1999:23|
 :skolemid |212|
 :no-pattern (type y_5@@0)
 :no-pattern (type y_5_1@@0)
 :no-pattern (U_2_int y_5@@0)
 :no-pattern (U_2_bool y_5@@0)
 :no-pattern (U_2_int y_5_1@@0)
 :no-pattern (U_2_bool y_5_1@@0)
)) (=> (forall ((y_5@@1 T@U) ) (!  (=> (= (type y_5@@1) RefType) (=> (and (U_2_bool (MapType1Select ys y_5@@1)) (< NoPerm a_20)) (and (qpRange16 y_5@@1) (= (invRecv16 y_5@@1) y_5@@1))))
 :qid |stdinbpl.2005:30|
 :skolemid |213|
 :pattern ( (MapType0Select WandDefRHSHeap@0 y_5@@1 f_7))
 :pattern ( (MapType2Select QPMask@1 y_5@@1 f_7))
 :pattern ( (MapType1Select ys y_5@@1))
)) (=> (and (forall ((o_3 T@U) ) (!  (=> (= (type o_3) RefType) (=> (and (and (U_2_bool (MapType1Select ys (invRecv16 o_3))) (< NoPerm a_20)) (qpRange16 o_3)) (= (invRecv16 o_3) o_3)))
 :qid |stdinbpl.2009:30|
 :skolemid |214|
 :pattern ( (invRecv16 o_3))
)) (= (ControlFlow 0 20) (- 0 19))) (forall ((y_5@@2 T@U) ) (!  (=> (and (= (type y_5@@2) RefType) (U_2_bool (MapType1Select ys y_5@@2))) (>= a_20 NoPerm))
 :qid |stdinbpl.2015:23|
 :skolemid |215|
 :pattern ( (MapType0Select WandDefRHSHeap@0 y_5@@2 f_7))
 :pattern ( (MapType2Select QPMask@1 y_5@@2 f_7))
 :pattern ( (MapType1Select ys y_5@@2))
))))))))
(let ((anon32_Then_correct true))
(let ((anon31_Else_correct  (and (=> (= (ControlFlow 0 22) (- 0 24)) (forall ((x_3 T@U) (x_3_2 T@U) ) (!  (=> (and (= (type x_3) RefType) (= (type x_3_2) RefType)) (=> (and (and (and (and (not (= x_3 x_3_2)) (U_2_bool (MapType1Select xs x_3))) (U_2_bool (MapType1Select xs x_3_2))) (< NoPerm a_20)) (< NoPerm a_20)) (not (= x_3 x_3_2))))
 :qid |stdinbpl.1945:23|
 :skolemid |205|
 :no-pattern (type x_3)
 :no-pattern (type x_3_2)
 :no-pattern (U_2_int x_3)
 :no-pattern (U_2_bool x_3)
 :no-pattern (U_2_int x_3_2)
 :no-pattern (U_2_bool x_3_2)
))) (=> (forall ((x_3@@0 T@U) (x_3_2@@0 T@U) ) (!  (=> (and (= (type x_3@@0) RefType) (= (type x_3_2@@0) RefType)) (=> (and (and (and (and (not (= x_3@@0 x_3_2@@0)) (U_2_bool (MapType1Select xs x_3@@0))) (U_2_bool (MapType1Select xs x_3_2@@0))) (< NoPerm a_20)) (< NoPerm a_20)) (not (= x_3@@0 x_3_2@@0))))
 :qid |stdinbpl.1945:23|
 :skolemid |205|
 :no-pattern (type x_3@@0)
 :no-pattern (type x_3_2@@0)
 :no-pattern (U_2_int x_3@@0)
 :no-pattern (U_2_bool x_3@@0)
 :no-pattern (U_2_int x_3_2@@0)
 :no-pattern (U_2_bool x_3_2@@0)
)) (=> (and (forall ((x_3@@1 T@U) ) (!  (=> (= (type x_3@@1) RefType) (=> (and (U_2_bool (MapType1Select xs x_3@@1)) (< NoPerm a_20)) (and (qpRange15 x_3@@1) (= (invRecv15 x_3@@1) x_3@@1))))
 :qid |stdinbpl.1951:30|
 :skolemid |206|
 :pattern ( (MapType0Select WandDefLHSHeap@2 x_3@@1 f_7))
 :pattern ( (MapType2Select QPMask@0 x_3@@1 f_7))
 :pattern ( (MapType1Select xs x_3@@1))
)) (forall ((o_3@@0 T@U) ) (!  (=> (= (type o_3@@0) RefType) (=> (and (and (U_2_bool (MapType1Select xs (invRecv15 o_3@@0))) (< NoPerm a_20)) (qpRange15 o_3@@0)) (= (invRecv15 o_3@@0) o_3@@0)))
 :qid |stdinbpl.1955:30|
 :skolemid |207|
 :pattern ( (invRecv15 o_3@@0))
))) (and (=> (= (ControlFlow 0 22) (- 0 23)) (forall ((x_3@@2 T@U) ) (!  (=> (and (= (type x_3@@2) RefType) (U_2_bool (MapType1Select xs x_3@@2))) (>= a_20 NoPerm))
 :qid |stdinbpl.1961:23|
 :skolemid |208|
 :pattern ( (MapType0Select WandDefLHSHeap@2 x_3@@2 f_7))
 :pattern ( (MapType2Select QPMask@0 x_3@@2 f_7))
 :pattern ( (MapType1Select xs x_3@@2))
))) (=> (forall ((x_3@@3 T@U) ) (!  (=> (and (= (type x_3@@3) RefType) (U_2_bool (MapType1Select xs x_3@@3))) (>= a_20 NoPerm))
 :qid |stdinbpl.1961:23|
 :skolemid |208|
 :pattern ( (MapType0Select WandDefLHSHeap@2 x_3@@3 f_7))
 :pattern ( (MapType2Select QPMask@0 x_3@@3 f_7))
 :pattern ( (MapType1Select xs x_3@@3))
)) (=> (and (forall ((x_3@@4 T@U) ) (!  (=> (= (type x_3@@4) RefType) (=> (and (U_2_bool (MapType1Select xs x_3@@4)) (> a_20 NoPerm)) (not (= x_3@@4 null))))
 :qid |stdinbpl.1967:30|
 :skolemid |209|
 :pattern ( (MapType0Select WandDefLHSHeap@2 x_3@@4 f_7))
 :pattern ( (MapType2Select QPMask@0 x_3@@4 f_7))
 :pattern ( (MapType1Select xs x_3@@4))
)) (forall ((o_3@@1 T@U) ) (!  (=> (= (type o_3@@1) RefType) (and (=> (and (and (U_2_bool (MapType1Select xs (invRecv15 o_3@@1))) (< NoPerm a_20)) (qpRange15 o_3@@1)) (and (=> (< NoPerm a_20) (= (invRecv15 o_3@@1) o_3@@1)) (= (U_2_real (MapType2Select QPMask@0 o_3@@1 f_7)) (+ (U_2_real (MapType2Select ZeroMask o_3@@1 f_7)) a_20)))) (=> (not (and (and (U_2_bool (MapType1Select xs (invRecv15 o_3@@1))) (< NoPerm a_20)) (qpRange15 o_3@@1))) (= (U_2_real (MapType2Select QPMask@0 o_3@@1 f_7)) (U_2_real (MapType2Select ZeroMask o_3@@1 f_7))))))
 :qid |stdinbpl.1973:30|
 :skolemid |210|
 :pattern ( (MapType2Select QPMask@0 o_3@@1 f_7))
))) (=> (and (and (forall ((o_3@@2 T@U) (f_5 T@U) ) (! (let ((B@@11 (FieldTypeInv1 (type f_5))))
(let ((A@@12 (FieldTypeInv0 (type f_5))))
 (=> (and (and (= (type o_3@@2) RefType) (= (type f_5) (FieldType A@@12 B@@11))) (not (= f_5 f_7))) (= (U_2_real (MapType2Select ZeroMask o_3@@2 f_5)) (U_2_real (MapType2Select QPMask@0 o_3@@2 f_5))))))
 :qid |stdinbpl.1977:37|
 :skolemid |211|
 :pattern ( (MapType2Select ZeroMask o_3@@2 f_5))
 :pattern ( (MapType2Select QPMask@0 o_3@@2 f_5))
)) (state WandDefLHSHeap@2 QPMask@0)) (and (state WandDefLHSHeap@2 QPMask@0) (state WandDefLHSHeap@2 QPMask@0))) (and (=> (= (ControlFlow 0 22) 18) anon32_Then_correct) (=> (= (ControlFlow 0 22) 20) anon32_Else_correct)))))))))))
(let ((anon31_Then_correct true))
(let ((anon20_correct true))
(let ((anon29_Then_correct  (=> (HasDirectPerm Mask@1 null (wand_1 xs a_20 ys a_20)) (and (and (=> (= (ControlFlow 0 25) 15) anon20_correct) (=> (= (ControlFlow 0 25) 17) anon31_Then_correct)) (=> (= (ControlFlow 0 25) 22) anon31_Else_correct)))))
(let ((anon29_Else_correct  (=> (and (not (HasDirectPerm Mask@1 null (wand_1 xs a_20 ys a_20))) (= (ControlFlow 0 16) 15)) anon20_correct)))
(let ((anon28_Else_correct  (=> (= (ControlFlow 0 14) (- 0 13)) (forall ((a_1 Real) ) (!  (=> (HasDirectPerm Mask@1 null (wand_1 xs a_1 ys a_1)) (= a_1 FullPerm))
 :qid |stdinbpl.2044:15|
 :skolemid |219|
 :pattern ( (MapType2Select Mask@1 null (wand_1 xs a_1 ys a_1)))
 :pattern ( (MapType0Select Heap@@11 null (wand_1 xs a_1 ys a_1)))
)))))
(let ((anon25_Else_correct  (=> (and (and (= Mask@1 (MapType2Store Mask@0 null (wand_1 zs FullPerm ys FullPerm) (real_2_U (+ (U_2_real (MapType2Select Mask@0 null (wand_1 zs FullPerm ys FullPerm))) FullPerm)))) (state Heap@@11 Mask@1)) (and (state Heap@@11 Mask@1) (state Heap@@11 Mask@1))) (and (and (=> (= (ControlFlow 0 26) 14) anon28_Else_correct) (=> (= (ControlFlow 0 26) 25) anon29_Then_correct)) (=> (= (ControlFlow 0 26) 16) anon29_Else_correct)))))
(let ((anon27_Else_correct  (=> (= (ControlFlow 0 10) (- 0 9)) (forall ((y_3 T@U) (y_3_1 T@U) ) (!  (=> (and (= (type y_3) RefType) (= (type y_3_1) RefType)) (=> (and (and (and (and (not (= y_3 y_3_1)) (U_2_bool (MapType1Select ys y_3))) (U_2_bool (MapType1Select ys y_3_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= y_3 y_3_1))))
 :qid |stdinbpl.1885:19|
 :skolemid |199|
 :no-pattern (type y_3)
 :no-pattern (type y_3_1)
 :no-pattern (U_2_int y_3)
 :no-pattern (U_2_bool y_3)
 :no-pattern (U_2_int y_3_1)
 :no-pattern (U_2_bool y_3_1)
)))))
(let ((anon27_Then_correct true))
(let ((anon26_Else_correct  (and (=> (= (ControlFlow 0 11) (- 0 12)) (forall ((z_1 T@U) (z_1_1 T@U) ) (!  (=> (and (= (type z_1) RefType) (= (type z_1_1) RefType)) (=> (and (and (and (and (not (= z_1 z_1_1)) (U_2_bool (MapType1Select zs z_1))) (U_2_bool (MapType1Select zs z_1_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= z_1 z_1_1))))
 :qid |stdinbpl.1837:19|
 :skolemid |193|
 :no-pattern (type z_1)
 :no-pattern (type z_1_1)
 :no-pattern (U_2_int z_1)
 :no-pattern (U_2_bool z_1)
 :no-pattern (U_2_int z_1_1)
 :no-pattern (U_2_bool z_1_1)
))) (=> (forall ((z_1@@0 T@U) (z_1_1@@0 T@U) ) (!  (=> (and (= (type z_1@@0) RefType) (= (type z_1_1@@0) RefType)) (=> (and (and (and (and (not (= z_1@@0 z_1_1@@0)) (U_2_bool (MapType1Select zs z_1@@0))) (U_2_bool (MapType1Select zs z_1_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= z_1@@0 z_1_1@@0))))
 :qid |stdinbpl.1837:19|
 :skolemid |193|
 :no-pattern (type z_1@@0)
 :no-pattern (type z_1_1@@0)
 :no-pattern (U_2_int z_1@@0)
 :no-pattern (U_2_bool z_1@@0)
 :no-pattern (U_2_int z_1_1@@0)
 :no-pattern (U_2_bool z_1_1@@0)
)) (=> (and (and (and (forall ((z_1@@1 T@U) ) (!  (=> (= (type z_1@@1) RefType) (=> (and (U_2_bool (MapType1Select zs z_1@@1)) (< NoPerm FullPerm)) (and (qpRange13 z_1@@1) (= (invRecv13 z_1@@1) z_1@@1))))
 :qid |stdinbpl.1843:26|
 :skolemid |194|
 :pattern ( (MapType0Select WandDefLHSHeap@1 z_1@@1 f_7))
 :pattern ( (MapType2Select QPMask@2 z_1@@1 f_7))
 :pattern ( (MapType1Select zs z_1@@1))
)) (forall ((o_3@@3 T@U) ) (!  (=> (= (type o_3@@3) RefType) (=> (and (and (U_2_bool (MapType1Select zs (invRecv13 o_3@@3))) (< NoPerm FullPerm)) (qpRange13 o_3@@3)) (= (invRecv13 o_3@@3) o_3@@3)))
 :qid |stdinbpl.1847:26|
 :skolemid |195|
 :pattern ( (invRecv13 o_3@@3))
))) (and (forall ((z_1@@2 T@U) ) (!  (=> (and (= (type z_1@@2) RefType) (U_2_bool (MapType1Select zs z_1@@2))) (not (= z_1@@2 null)))
 :qid |stdinbpl.1853:26|
 :skolemid |196|
 :pattern ( (MapType0Select WandDefLHSHeap@1 z_1@@2 f_7))
 :pattern ( (MapType2Select QPMask@2 z_1@@2 f_7))
 :pattern ( (MapType1Select zs z_1@@2))
)) (forall ((o_3@@4 T@U) ) (!  (=> (= (type o_3@@4) RefType) (and (=> (and (and (U_2_bool (MapType1Select zs (invRecv13 o_3@@4))) (< NoPerm FullPerm)) (qpRange13 o_3@@4)) (and (=> (< NoPerm FullPerm) (= (invRecv13 o_3@@4) o_3@@4)) (= (U_2_real (MapType2Select QPMask@2 o_3@@4 f_7)) (+ (U_2_real (MapType2Select ZeroMask o_3@@4 f_7)) FullPerm)))) (=> (not (and (and (U_2_bool (MapType1Select zs (invRecv13 o_3@@4))) (< NoPerm FullPerm)) (qpRange13 o_3@@4))) (= (U_2_real (MapType2Select QPMask@2 o_3@@4 f_7)) (U_2_real (MapType2Select ZeroMask o_3@@4 f_7))))))
 :qid |stdinbpl.1859:26|
 :skolemid |197|
 :pattern ( (MapType2Select QPMask@2 o_3@@4 f_7))
)))) (and (and (forall ((o_3@@5 T@U) (f_5@@0 T@U) ) (! (let ((B@@12 (FieldTypeInv1 (type f_5@@0))))
(let ((A@@13 (FieldTypeInv0 (type f_5@@0))))
 (=> (and (and (= (type o_3@@5) RefType) (= (type f_5@@0) (FieldType A@@13 B@@12))) (not (= f_5@@0 f_7))) (= (U_2_real (MapType2Select ZeroMask o_3@@5 f_5@@0)) (U_2_real (MapType2Select QPMask@2 o_3@@5 f_5@@0))))))
 :qid |stdinbpl.1863:33|
 :skolemid |198|
 :pattern ( (MapType2Select ZeroMask o_3@@5 f_5@@0))
 :pattern ( (MapType2Select QPMask@2 o_3@@5 f_5@@0))
)) (state WandDefLHSHeap@1 QPMask@2)) (and (state WandDefLHSHeap@1 QPMask@2) (state WandDefLHSHeap@1 QPMask@2)))) (and (=> (= (ControlFlow 0 11) 8) anon27_Then_correct) (=> (= (ControlFlow 0 11) 10) anon27_Else_correct)))))))
(let ((anon26_Then_correct true))
(let ((anon22_Else_correct  (=> (and (and (= Mask@0 (MapType2Store ZeroMask null (wand_1 xs FullPerm ys FullPerm) (real_2_U (+ (U_2_real (MapType2Select ZeroMask null (wand_1 xs FullPerm ys FullPerm))) FullPerm)))) (state Heap@@11 Mask@0)) (and (state Heap@@11 Mask@0) (state Heap@@11 Mask@0))) (and (and (=> (= (ControlFlow 0 27) 26) anon25_Else_correct) (=> (= (ControlFlow 0 27) 7) anon26_Then_correct)) (=> (= (ControlFlow 0 27) 11) anon26_Else_correct)))))
(let ((anon24_Else_correct  (=> (= (ControlFlow 0 4) (- 0 3)) (forall ((y_1 T@U) (y_1_2 T@U) ) (!  (=> (and (= (type y_1) RefType) (= (type y_1_2) RefType)) (=> (and (and (and (and (not (= y_1 y_1_2)) (U_2_bool (MapType1Select ys y_1))) (U_2_bool (MapType1Select ys y_1_2))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= y_1 y_1_2))))
 :qid |stdinbpl.1783:19|
 :skolemid |187|
 :no-pattern (type y_1)
 :no-pattern (type y_1_2)
 :no-pattern (U_2_int y_1)
 :no-pattern (U_2_bool y_1)
 :no-pattern (U_2_int y_1_2)
 :no-pattern (U_2_bool y_1_2)
)))))
(let ((anon24_Then_correct true))
(let ((anon23_Else_correct  (and (=> (= (ControlFlow 0 5) (- 0 6)) (forall ((x_1 T@U) (x_1_2 T@U) ) (!  (=> (and (= (type x_1) RefType) (= (type x_1_2) RefType)) (=> (and (and (and (and (not (= x_1 x_1_2)) (U_2_bool (MapType1Select xs x_1))) (U_2_bool (MapType1Select xs x_1_2))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= x_1 x_1_2))))
 :qid |stdinbpl.1735:19|
 :skolemid |181|
 :no-pattern (type x_1)
 :no-pattern (type x_1_2)
 :no-pattern (U_2_int x_1)
 :no-pattern (U_2_bool x_1)
 :no-pattern (U_2_int x_1_2)
 :no-pattern (U_2_bool x_1_2)
))) (=> (forall ((x_1@@0 T@U) (x_1_2@@0 T@U) ) (!  (=> (and (= (type x_1@@0) RefType) (= (type x_1_2@@0) RefType)) (=> (and (and (and (and (not (= x_1@@0 x_1_2@@0)) (U_2_bool (MapType1Select xs x_1@@0))) (U_2_bool (MapType1Select xs x_1_2@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= x_1@@0 x_1_2@@0))))
 :qid |stdinbpl.1735:19|
 :skolemid |181|
 :no-pattern (type x_1@@0)
 :no-pattern (type x_1_2@@0)
 :no-pattern (U_2_int x_1@@0)
 :no-pattern (U_2_bool x_1@@0)
 :no-pattern (U_2_int x_1_2@@0)
 :no-pattern (U_2_bool x_1_2@@0)
)) (=> (and (and (and (forall ((x_1@@1 T@U) ) (!  (=> (= (type x_1@@1) RefType) (=> (and (U_2_bool (MapType1Select xs x_1@@1)) (< NoPerm FullPerm)) (and (qpRange11 x_1@@1) (= (invRecv11 x_1@@1) x_1@@1))))
 :qid |stdinbpl.1741:26|
 :skolemid |182|
 :pattern ( (MapType0Select WandDefLHSHeap@0 x_1@@1 f_7))
 :pattern ( (MapType2Select QPMask@4 x_1@@1 f_7))
 :pattern ( (MapType1Select xs x_1@@1))
)) (forall ((o_3@@6 T@U) ) (!  (=> (= (type o_3@@6) RefType) (=> (and (and (U_2_bool (MapType1Select xs (invRecv11 o_3@@6))) (< NoPerm FullPerm)) (qpRange11 o_3@@6)) (= (invRecv11 o_3@@6) o_3@@6)))
 :qid |stdinbpl.1745:26|
 :skolemid |183|
 :pattern ( (invRecv11 o_3@@6))
))) (and (forall ((x_1@@2 T@U) ) (!  (=> (and (= (type x_1@@2) RefType) (U_2_bool (MapType1Select xs x_1@@2))) (not (= x_1@@2 null)))
 :qid |stdinbpl.1751:26|
 :skolemid |184|
 :pattern ( (MapType0Select WandDefLHSHeap@0 x_1@@2 f_7))
 :pattern ( (MapType2Select QPMask@4 x_1@@2 f_7))
 :pattern ( (MapType1Select xs x_1@@2))
)) (forall ((o_3@@7 T@U) ) (!  (=> (= (type o_3@@7) RefType) (and (=> (and (and (U_2_bool (MapType1Select xs (invRecv11 o_3@@7))) (< NoPerm FullPerm)) (qpRange11 o_3@@7)) (and (=> (< NoPerm FullPerm) (= (invRecv11 o_3@@7) o_3@@7)) (= (U_2_real (MapType2Select QPMask@4 o_3@@7 f_7)) (+ (U_2_real (MapType2Select ZeroMask o_3@@7 f_7)) FullPerm)))) (=> (not (and (and (U_2_bool (MapType1Select xs (invRecv11 o_3@@7))) (< NoPerm FullPerm)) (qpRange11 o_3@@7))) (= (U_2_real (MapType2Select QPMask@4 o_3@@7 f_7)) (U_2_real (MapType2Select ZeroMask o_3@@7 f_7))))))
 :qid |stdinbpl.1757:26|
 :skolemid |185|
 :pattern ( (MapType2Select QPMask@4 o_3@@7 f_7))
)))) (and (and (forall ((o_3@@8 T@U) (f_5@@1 T@U) ) (! (let ((B@@13 (FieldTypeInv1 (type f_5@@1))))
(let ((A@@14 (FieldTypeInv0 (type f_5@@1))))
 (=> (and (and (= (type o_3@@8) RefType) (= (type f_5@@1) (FieldType A@@14 B@@13))) (not (= f_5@@1 f_7))) (= (U_2_real (MapType2Select ZeroMask o_3@@8 f_5@@1)) (U_2_real (MapType2Select QPMask@4 o_3@@8 f_5@@1))))))
 :qid |stdinbpl.1761:33|
 :skolemid |186|
 :pattern ( (MapType2Select ZeroMask o_3@@8 f_5@@1))
 :pattern ( (MapType2Select QPMask@4 o_3@@8 f_5@@1))
)) (state WandDefLHSHeap@0 QPMask@4)) (and (state WandDefLHSHeap@0 QPMask@4) (state WandDefLHSHeap@0 QPMask@4)))) (and (=> (= (ControlFlow 0 5) 2) anon24_Then_correct) (=> (= (ControlFlow 0 5) 4) anon24_Else_correct)))))))
(let ((anon23_Then_correct true))
(let ((anon0_correct  (=> (state Heap@@11 ZeroMask) (and (and (=> (= (ControlFlow 0 28) 27) anon22_Else_correct) (=> (= (ControlFlow 0 28) 1) anon23_Then_correct)) (=> (= (ControlFlow 0 28) 5) anon23_Else_correct)))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 29) 28) anon0_correct)))
PreconditionGeneratedEntry_correct)))))))))))))))))))))
))
(check-sat)
(pop 1)
; Valid
(get-info :rlimit)
