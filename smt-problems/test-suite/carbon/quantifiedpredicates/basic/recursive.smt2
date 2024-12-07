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
(declare-fun val () T@U)
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
(declare-fun list (T@U Int) T@U)
(declare-fun IsPredicateField (T@U) Bool)
(declare-fun PredicateType_listType () T@T)
(declare-fun FrameTypeType () T@T)
(declare-fun |list#trigger| (T@U T@U) Bool)
(declare-fun |list#everUsed| (T@U) Bool)
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
(declare-fun |Set#Singleton| (T@U) T@U)
(declare-fun |Set#Card| (T@U) Int)
(declare-fun |Math#clip| (Int) Int)
(declare-fun |list#sm| (T@U Int) T@U)
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
(declare-fun NoPerm () Real)
(declare-fun |Set#Difference| (T@U T@U) T@U)
(declare-fun |MultiSet#Equal| (T@U T@U) Bool)
(declare-fun |Set#UnionOne| (T@U T@U) T@U)
(declare-fun |MultiSet#Empty| (T@T) T@U)
(declare-fun getPredWandId (T@U) Int)
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
(assert  (and (and (and (and (and (and (and (forall ((arg0@@11 T@T) (arg1 T@T) ) (! (= (Ctor (FieldType arg0@@11 arg1)) 6)
 :qid |ctor:FieldType|
)) (forall ((arg0@@12 T@T) (arg1@@0 T@T) ) (! (= (FieldTypeInv0 (FieldType arg0@@12 arg1@@0)) arg0@@12)
 :qid |typeInv:FieldTypeInv0|
 :pattern ( (FieldType arg0@@12 arg1@@0))
))) (forall ((arg0@@13 T@T) (arg1@@1 T@T) ) (! (= (FieldTypeInv1 (FieldType arg0@@13 arg1@@1)) arg1@@1)
 :qid |typeInv:FieldTypeInv1|
 :pattern ( (FieldType arg0@@13 arg1@@1))
))) (= (Ctor NormalFieldType) 7)) (= (type $allocated) (FieldType NormalFieldType boolType))) (= (type val) (FieldType NormalFieldType intType))) (= (Ctor RefType) 8)) (= (type next) (FieldType NormalFieldType RefType))))
(assert (distinct $allocated val next)
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
 :qid |stdinbpl.356:18|
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
(assert  (and (and (= (Ctor PredicateType_listType) 12) (= (Ctor FrameTypeType) 13)) (forall ((arg0@@28 T@U) (arg1@@12 Int) ) (! (= (type (list arg0@@28 arg1@@12)) (FieldType PredicateType_listType FrameTypeType))
 :qid |funType:list|
 :pattern ( (list arg0@@28 arg1@@12))
))))
(assert (forall ((r T@U) (i Int) ) (!  (=> (= (type r) RefType) (IsPredicateField (list r i)))
 :qid |stdinbpl.403:15|
 :skolemid |83|
 :pattern ( (list r i))
)))
(assert (forall ((Heap@@0 T@U) (r@@0 T@U) (i@@0 Int) ) (!  (=> (and (= (type Heap@@0) (MapType0Type RefType)) (= (type r@@0) RefType)) (|list#everUsed| (list r@@0 i@@0)))
 :qid |stdinbpl.422:15|
 :skolemid |87|
 :pattern ( (|list#trigger| Heap@@0 (list r@@0 i@@0)))
)))
(assert (forall ((a@@0 Int) (b@@0 Int) ) (!  (or (= (|Math#min| a@@0 b@@0) a@@0) (= (|Math#min| a@@0 b@@0) b@@0))
 :qid |stdinbpl.287:15|
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
 :qid |stdinbpl.354:18|
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
))) (forall ((arg0@@35 T@U) (arg1@@17 T@U) (arg2@@3 T@U) ) (! (let ((aVar1@@3 (type arg2@@3)))
(let ((aVar0@@1 (type arg1@@17)))
(= (type (MapType2Store arg0@@35 arg1@@17 arg2@@3)) (MapType2Type aVar0@@1 aVar1@@3))))
 :qid |funType:MapType2Store|
 :pattern ( (MapType2Store arg0@@35 arg1@@17 arg2@@3))
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
)))) (forall ((arg0@@36 T@U) (arg1@@18 T@U) ) (! (let ((T@@4 (MapType2TypeInv0 (type arg0@@36))))
(= (type (|Set#Union| arg0@@36 arg1@@18)) (MapType2Type T@@4 boolType)))
 :qid |funType:Set#Union|
 :pattern ( (|Set#Union| arg0@@36 arg1@@18))
))))
(assert (forall ((a@@2 T@U) (b@@2 T@U) ) (! (let ((T@@5 (MapType2TypeInv0 (type a@@2))))
 (=> (and (= (type a@@2) (MapType2Type T@@5 boolType)) (= (type b@@2) (MapType2Type T@@5 boolType))) (= (|Set#Union| (|Set#Union| a@@2 b@@2) b@@2) (|Set#Union| a@@2 b@@2))))
 :qid |stdinbpl.239:18|
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
 :qid |stdinbpl.243:18|
 :skolemid |40|
 :pattern ( (|Set#Intersection| (|Set#Intersection| a@@3 b@@3) b@@3))
)))
(assert (forall ((a@@4 T@U) (b@@4 T@U) ) (! (let ((T@@8 (MultiSetTypeInv0 (type a@@4))))
 (=> (and (= (type a@@4) (MultiSetType T@@8)) (= (type b@@4) (MultiSetType T@@8))) (= (|MultiSet#Intersection| (|MultiSet#Intersection| a@@4 b@@4) b@@4) (|MultiSet#Intersection| a@@4 b@@4))))
 :qid |stdinbpl.345:18|
 :skolemid |70|
 :pattern ( (|MultiSet#Intersection| (|MultiSet#Intersection| a@@4 b@@4) b@@4))
)))
(assert (forall ((arg0@@38 T@U) ) (! (let ((T@@9 (type arg0@@38)))
(= (type (|Set#Singleton| arg0@@38)) (MapType2Type T@@9 boolType)))
 :qid |funType:Set#Singleton|
 :pattern ( (|Set#Singleton| arg0@@38))
)))
(assert (forall ((r@@1 T@U) (o T@U) ) (! (let ((T@@10 (type r@@1)))
 (=> (= (type o) T@@10) (= (U_2_bool (MapType2Select (|Set#Singleton| r@@1) o)) (= r@@1 o))))
 :qid |stdinbpl.208:18|
 :skolemid |27|
 :pattern ( (MapType2Select (|Set#Singleton| r@@1) o))
)))
(assert (forall ((a@@5 T@U) (b@@5 T@U) ) (! (let ((T@@11 (MapType2TypeInv0 (type a@@5))))
 (=> (and (= (type a@@5) (MapType2Type T@@11 boolType)) (= (type b@@5) (MapType2Type T@@11 boolType))) (= (+ (|Set#Card| (|Set#Union| a@@5 b@@5)) (|Set#Card| (|Set#Intersection| a@@5 b@@5))) (+ (|Set#Card| a@@5) (|Set#Card| b@@5)))))
 :qid |stdinbpl.247:18|
 :skolemid |42|
 :pattern ( (|Set#Card| (|Set#Union| a@@5 b@@5)))
 :pattern ( (|Set#Card| (|Set#Intersection| a@@5 b@@5)))
)))
(assert (forall ((Heap@@3 T@U) (ExhaleHeap@@1 T@U) (Mask@@2 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@3) (MapType0Type RefType)) (= (type ExhaleHeap@@1) (MapType0Type RefType))) (= (type Mask@@2) (MapType1Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@3 ExhaleHeap@@1 Mask@@2)) (U_2_bool (MapType0Select Heap@@3 o_1 $allocated))) (U_2_bool (MapType0Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.73:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@3 ExhaleHeap@@1 Mask@@2) (MapType0Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert (forall ((a@@6 Int) ) (!  (=> (<= 0 a@@6) (= (|Math#clip| a@@6) a@@6))
 :qid |stdinbpl.290:15|
 :skolemid |54|
 :pattern ( (|Math#clip| a@@6))
)))
(assert (forall ((a@@7 T@U) (b@@6 T@U) (o@@0 T@U) ) (! (let ((T@@12 (type o@@0)))
 (=> (and (= (type a@@7) (MultiSetType T@@12)) (= (type b@@6) (MultiSetType T@@12))) (= (|MultiSet#Select| (|MultiSet#Intersection| a@@7 b@@6) o@@0) (|Math#min| (|MultiSet#Select| a@@7 o@@0) (|MultiSet#Select| b@@6 o@@0)))))
 :qid |stdinbpl.341:18|
 :skolemid |69|
 :pattern ( (|MultiSet#Select| (|MultiSet#Intersection| a@@7 b@@6) o@@0))
)))
(assert (forall ((r@@2 T@U) (i@@1 Int) (r2 T@U) (i2 Int) ) (!  (=> (and (and (= (type r@@2) RefType) (= (type r2) RefType)) (= (list r@@2 i@@1) (list r2 i2))) (and (= r@@2 r2) (= i@@1 i2)))
 :qid |stdinbpl.413:15|
 :skolemid |85|
 :pattern ( (list r@@2 i@@1) (list r2 i2))
)))
(assert (forall ((arg0@@39 T@U) (arg1@@20 Int) ) (! (= (type (|list#sm| arg0@@39 arg1@@20)) (FieldType PredicateType_listType (MapType1Type RefType boolType)))
 :qid |funType:list#sm|
 :pattern ( (|list#sm| arg0@@39 arg1@@20))
)))
(assert (forall ((r@@3 T@U) (i@@2 Int) (r2@@0 T@U) (i2@@0 Int) ) (!  (=> (and (and (= (type r@@3) RefType) (= (type r2@@0) RefType)) (= (|list#sm| r@@3 i@@2) (|list#sm| r2@@0 i2@@0))) (and (= r@@3 r2@@0) (= i@@2 i2@@0)))
 :qid |stdinbpl.417:15|
 :skolemid |86|
 :pattern ( (|list#sm| r@@3 i@@2) (|list#sm| r2@@0 i2@@0))
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
 :qid |stdinbpl.327:18|
 :skolemid |65|
 :pattern ( (|MultiSet#Card| (|MultiSet#UnionOne| a@@8 x@@8)))
 :pattern ( (|MultiSet#UnionOne| a@@8 x@@8) (|MultiSet#Card| a@@8))
)))
(assert (forall ((a@@9 T@U) (b@@7 T@U) ) (! (let ((T@@15 (MultiSetTypeInv0 (type a@@9))))
 (=> (and (= (type a@@9) (MultiSetType T@@15)) (= (type b@@7) (MultiSetType T@@15))) (= (|MultiSet#Disjoint| a@@9 b@@7) (forall ((o@@1 T@U) ) (!  (=> (= (type o@@1) T@@15) (or (= (|MultiSet#Select| a@@9 o@@1) 0) (= (|MultiSet#Select| b@@7 o@@1) 0)))
 :qid |stdinbpl.377:39|
 :skolemid |80|
 :pattern ( (|MultiSet#Select| a@@9 o@@1))
 :pattern ( (|MultiSet#Select| b@@7 o@@1))
)))))
 :qid |stdinbpl.376:18|
 :skolemid |81|
 :pattern ( (|MultiSet#Disjoint| a@@9 b@@7))
)))
(assert (forall ((p T@U) (v_1 T@U) (w T@U) ) (! (let ((A@@2 (FieldTypeInv0 (type p))))
 (=> (and (and (= (type p) (FieldType A@@2 FrameTypeType)) (= (type v_1) FrameTypeType)) (= (type w) FrameTypeType)) (not (InsidePredicate p v_1 p w))))
 :qid |stdinbpl.185:19|
 :skolemid |21|
 :pattern ( (InsidePredicate p v_1 p w))
)))
(assert (forall ((arg0@@41 T@U) ) (! (let ((T@@16 (type arg0@@41)))
(= (type (|MultiSet#Singleton| arg0@@41)) (MultiSetType T@@16)))
 :qid |funType:MultiSet#Singleton|
 :pattern ( (|MultiSet#Singleton| arg0@@41))
)))
(assert (forall ((r@@4 T@U) ) (!  (and (= (|MultiSet#Card| (|MultiSet#Singleton| r@@4)) 1) (= (|MultiSet#Select| (|MultiSet#Singleton| r@@4) r@@4) 1))
 :qid |stdinbpl.319:18|
 :skolemid |62|
 :pattern ( (|MultiSet#Singleton| r@@4))
)))
(assert  (not (IsPredicateField val)))
(assert  (not (IsWandField val)))
(assert  (not (IsPredicateField next)))
(assert  (not (IsWandField next)))
(assert (forall ((Heap@@5 T@U) (ExhaleHeap@@3 T@U) (Mask@@4 T@U) ) (!  (=> (and (and (and (= (type Heap@@5) (MapType0Type RefType)) (= (type ExhaleHeap@@3) (MapType0Type RefType))) (= (type Mask@@4) (MapType1Type RefType realType))) (IdenticalOnKnownLocations Heap@@5 ExhaleHeap@@3 Mask@@4)) (succHeap Heap@@5 ExhaleHeap@@3))
 :qid |stdinbpl.83:15|
 :skolemid |10|
 :pattern ( (IdenticalOnKnownLocations Heap@@5 ExhaleHeap@@3 Mask@@4))
)))
(assert (forall ((a@@10 T@U) (b@@8 T@U) ) (! (let ((T@@17 (MapType2TypeInv0 (type a@@10))))
 (=> (and (= (type a@@10) (MapType2Type T@@17 boolType)) (= (type b@@8) (MapType2Type T@@17 boolType))) (= (|Set#Equal| a@@10 b@@8) (forall ((o@@2 T@U) ) (!  (=> (= (type o@@2) T@@17) (= (U_2_bool (MapType2Select a@@10 o@@2)) (U_2_bool (MapType2Select b@@8 o@@2))))
 :qid |stdinbpl.272:31|
 :skolemid |48|
 :pattern ( (MapType2Select a@@10 o@@2))
 :pattern ( (MapType2Select b@@8 o@@2))
)))))
 :qid |stdinbpl.271:17|
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
 :qid |stdinbpl.337:18|
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
 :qid |stdinbpl.173:15|
 :skolemid |19|
 :pattern ( (ConditionalFrame p@@0 f_6))
)))
(assert (forall ((Mask@@5 T@U) (o_2@@0 T@U) (f_4@@0 T@U) ) (! (let ((B@@3 (FieldTypeInv1 (type f_4@@0))))
(let ((A@@4 (FieldTypeInv0 (type f_4@@0))))
 (=> (and (and (= (type Mask@@5) (MapType1Type RefType realType)) (= (type o_2@@0) RefType)) (= (type f_4@@0) (FieldType A@@4 B@@3))) (= (HasDirectPerm Mask@@5 o_2@@0 f_4@@0) (> (U_2_real (MapType1Select Mask@@5 o_2@@0 f_4@@0)) NoPerm)))))
 :qid |stdinbpl.133:22|
 :skolemid |17|
 :pattern ( (HasDirectPerm Mask@@5 o_2@@0 f_4@@0))
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
 :qid |stdinbpl.236:18|
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
 :qid |stdinbpl.251:18|
 :skolemid |43|
 :pattern ( (MapType2Select (|Set#Difference| a@@13 b@@11) o@@4))
 :pattern ( (|Set#Difference| a@@13 b@@11) (MapType2Select a@@13 o@@4))
)))
(assert (forall ((a@@14 T@U) (b@@12 T@U) ) (! (let ((T@@22 (MapType2TypeInv0 (type a@@14))))
 (=> (and (and (= (type a@@14) (MapType2Type T@@22 boolType)) (= (type b@@12) (MapType2Type T@@22 boolType))) (|Set#Equal| a@@14 b@@12)) (= a@@14 b@@12)))
 :qid |stdinbpl.273:17|
 :skolemid |50|
 :pattern ( (|Set#Equal| a@@14 b@@12))
)))
(assert (forall ((a@@15 T@U) (b@@13 T@U) ) (! (let ((T@@23 (MultiSetTypeInv0 (type a@@15))))
 (=> (and (and (= (type a@@15) (MultiSetType T@@23)) (= (type b@@13) (MultiSetType T@@23))) (|MultiSet#Equal| a@@15 b@@13)) (= a@@15 b@@13)))
 :qid |stdinbpl.372:17|
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
 :qid |stdinbpl.216:18|
 :skolemid |31|
 :pattern ( (|Set#UnionOne| a@@16 x@@9) (MapType2Select a@@16 y@@2))
)))
(assert (forall ((a@@17 T@U) (b@@14 T@U) (y@@3 T@U) ) (! (let ((T@@26 (type y@@3)))
 (=> (and (and (= (type a@@17) (MapType2Type T@@26 boolType)) (= (type b@@14) (MapType2Type T@@26 boolType))) (U_2_bool (MapType2Select a@@17 y@@3))) (U_2_bool (MapType2Select (|Set#Union| a@@17 b@@14) y@@3))))
 :qid |stdinbpl.226:18|
 :skolemid |35|
 :pattern ( (|Set#Union| a@@17 b@@14) (MapType2Select a@@17 y@@3))
)))
(assert (forall ((a@@18 T@U) (b@@15 T@U) (y@@4 T@U) ) (! (let ((T@@27 (type y@@4)))
 (=> (and (and (= (type a@@18) (MapType2Type T@@27 boolType)) (= (type b@@15) (MapType2Type T@@27 boolType))) (U_2_bool (MapType2Select b@@15 y@@4))) (U_2_bool (MapType2Select (|Set#Union| a@@18 b@@15) y@@4))))
 :qid |stdinbpl.228:18|
 :skolemid |36|
 :pattern ( (|Set#Union| a@@18 b@@15) (MapType2Select b@@15 y@@4))
)))
(assert (forall ((ms T@U) (x@@10 T@U) ) (! (let ((T@@28 (type x@@10)))
 (=> (= (type ms) (MultiSetType T@@28)) (>= (|MultiSet#Select| ms x@@10) 0)))
 :qid |stdinbpl.303:18|
 :skolemid |56|
 :pattern ( (|MultiSet#Select| ms x@@10))
)))
(assert (forall ((a@@19 T@U) (x@@11 T@U) (o@@5 T@U) ) (! (let ((T@@29 (type x@@11)))
 (=> (and (= (type a@@19) (MapType2Type T@@29 boolType)) (= (type o@@5) T@@29)) (= (U_2_bool (MapType2Select (|Set#UnionOne| a@@19 x@@11) o@@5))  (or (= o@@5 x@@11) (U_2_bool (MapType2Select a@@19 o@@5))))))
 :qid |stdinbpl.212:18|
 :skolemid |29|
 :pattern ( (MapType2Select (|Set#UnionOne| a@@19 x@@11) o@@5))
)))
(assert (forall ((a@@20 T@U) (b@@16 T@U) (y@@5 T@U) ) (! (let ((T@@30 (type y@@5)))
 (=> (and (and (= (type a@@20) (MapType2Type T@@30 boolType)) (= (type b@@16) (MapType2Type T@@30 boolType))) (U_2_bool (MapType2Select b@@16 y@@5))) (not (U_2_bool (MapType2Select (|Set#Difference| a@@20 b@@16) y@@5)))))
 :qid |stdinbpl.253:18|
 :skolemid |44|
 :pattern ( (|Set#Difference| a@@20 b@@16) (MapType2Select b@@16 y@@5))
)))
(assert (forall ((a@@21 T@U) (b@@17 T@U) ) (! (let ((T@@31 (MapType2TypeInv0 (type a@@21))))
 (=> (and (= (type a@@21) (MapType2Type T@@31 boolType)) (= (type b@@17) (MapType2Type T@@31 boolType))) (and (= (+ (+ (|Set#Card| (|Set#Difference| a@@21 b@@17)) (|Set#Card| (|Set#Difference| b@@17 a@@21))) (|Set#Card| (|Set#Intersection| a@@21 b@@17))) (|Set#Card| (|Set#Union| a@@21 b@@17))) (= (|Set#Card| (|Set#Difference| a@@21 b@@17)) (- (|Set#Card| a@@21) (|Set#Card| (|Set#Intersection| a@@21 b@@17)))))))
 :qid |stdinbpl.255:18|
 :skolemid |45|
 :pattern ( (|Set#Card| (|Set#Difference| a@@21 b@@17)))
)))
(assert (forall ((s T@U) ) (! (let ((T@@32 (MapType2TypeInv0 (type s))))
 (=> (= (type s) (MapType2Type T@@32 boolType)) (<= 0 (|Set#Card| s))))
 :qid |stdinbpl.198:18|
 :skolemid |22|
 :pattern ( (|Set#Card| s))
)))
(assert (forall ((s@@0 T@U) ) (! (let ((T@@33 (MultiSetTypeInv0 (type s@@0))))
 (=> (= (type s@@0) (MultiSetType T@@33)) (<= 0 (|MultiSet#Card| s@@0))))
 :qid |stdinbpl.306:18|
 :skolemid |57|
 :pattern ( (|MultiSet#Card| s@@0))
)))
(assert (forall ((T@@34 T@T) ) (! (= (type (|MultiSet#Empty| T@@34)) (MultiSetType T@@34))
 :qid |funType:MultiSet#Empty|
 :pattern ( (|MultiSet#Empty| T@@34))
)))
(assert (forall ((o@@6 T@U) ) (! (let ((T@@35 (type o@@6)))
(= (|MultiSet#Select| (|MultiSet#Empty| T@@35) o@@6) 0))
 :qid |stdinbpl.311:18|
 :skolemid |58|
 :pattern ( (let ((T@@35 (type o@@6)))
(|MultiSet#Select| (|MultiSet#Empty| T@@35) o@@6)))
)))
(assert (forall ((r@@5 T@U) (i@@3 Int) ) (!  (=> (= (type r@@5) RefType) (= (getPredWandId (list r@@5 i@@3)) 0))
 :qid |stdinbpl.407:15|
 :skolemid |84|
 :pattern ( (list r@@5 i@@3))
)))
(assert (forall ((a@@22 T@U) (x@@12 T@U) ) (! (let ((T@@36 (type x@@12)))
 (=> (= (type a@@22) (MapType2Type T@@36 boolType)) (U_2_bool (MapType2Select (|Set#UnionOne| a@@22 x@@12) x@@12))))
 :qid |stdinbpl.214:18|
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
 :qid |stdinbpl.218:18|
 :skolemid |32|
 :pattern ( (|Set#Card| (|Set#UnionOne| a@@23 x@@13)))
)))
(assert (forall ((a@@24 T@U) (x@@14 T@U) ) (! (let ((T@@38 (type x@@14)))
 (=> (= (type a@@24) (MultiSetType T@@38)) (and (> (|MultiSet#Select| (|MultiSet#UnionOne| a@@24 x@@14) x@@14) 0) (> (|MultiSet#Card| (|MultiSet#UnionOne| a@@24 x@@14)) 0))))
 :qid |stdinbpl.330:18|
 :skolemid |66|
 :pattern ( (|MultiSet#UnionOne| a@@24 x@@14))
)))
(assert (forall ((r@@6 T@U) ) (! (= (|Set#Card| (|Set#Singleton| r@@6)) 1)
 :qid |stdinbpl.209:18|
 :skolemid |28|
 :pattern ( (|Set#Card| (|Set#Singleton| r@@6)))
)))
(assert (forall ((Mask@@8 T@U) (o_2@@2 T@U) (f_4@@2 T@U) ) (! (let ((B@@7 (FieldTypeInv1 (type f_4@@2))))
(let ((A@@8 (FieldTypeInv0 (type f_4@@2))))
 (=> (and (and (and (= (type Mask@@8) (MapType1Type RefType realType)) (= (type o_2@@2) RefType)) (= (type f_4@@2) (FieldType A@@8 B@@7))) (GoodMask Mask@@8)) (and (>= (U_2_real (MapType1Select Mask@@8 o_2@@2 f_4@@2)) NoPerm) (=> (and (and (GoodMask Mask@@8) (not (IsPredicateField f_4@@2))) (not (IsWandField f_4@@2))) (<= (U_2_real (MapType1Select Mask@@8 o_2@@2 f_4@@2)) FullPerm))))))
 :qid |stdinbpl.128:22|
 :skolemid |16|
 :pattern ( (GoodMask Mask@@8) (MapType1Select Mask@@8 o_2@@2 f_4@@2))
)))
(assert (forall ((r@@7 T@U) ) (! (U_2_bool (MapType2Select (|Set#Singleton| r@@7) r@@7))
 :qid |stdinbpl.207:18|
 :skolemid |26|
 :pattern ( (|Set#Singleton| r@@7))
)))
(assert (forall ((a@@25 T@U) (b@@18 T@U) ) (! (let ((T@@39 (MapType2TypeInv0 (type a@@25))))
 (=> (and (= (type a@@25) (MapType2Type T@@39 boolType)) (= (type b@@18) (MapType2Type T@@39 boolType))) (= (|Set#Union| a@@25 (|Set#Union| a@@25 b@@18)) (|Set#Union| a@@25 b@@18))))
 :qid |stdinbpl.241:18|
 :skolemid |39|
 :pattern ( (|Set#Union| a@@25 (|Set#Union| a@@25 b@@18)))
)))
(assert (forall ((a@@26 T@U) (b@@19 T@U) ) (! (let ((T@@40 (MapType2TypeInv0 (type a@@26))))
 (=> (and (= (type a@@26) (MapType2Type T@@40 boolType)) (= (type b@@19) (MapType2Type T@@40 boolType))) (= (|Set#Intersection| a@@26 (|Set#Intersection| a@@26 b@@19)) (|Set#Intersection| a@@26 b@@19))))
 :qid |stdinbpl.245:18|
 :skolemid |41|
 :pattern ( (|Set#Intersection| a@@26 (|Set#Intersection| a@@26 b@@19)))
)))
(assert (forall ((a@@27 T@U) (b@@20 T@U) ) (! (let ((T@@41 (MultiSetTypeInv0 (type a@@27))))
 (=> (and (= (type a@@27) (MultiSetType T@@41)) (= (type b@@20) (MultiSetType T@@41))) (= (|MultiSet#Intersection| a@@27 (|MultiSet#Intersection| a@@27 b@@20)) (|MultiSet#Intersection| a@@27 b@@20))))
 :qid |stdinbpl.347:18|
 :skolemid |71|
 :pattern ( (|MultiSet#Intersection| a@@27 (|MultiSet#Intersection| a@@27 b@@20)))
)))
(assert (forall ((s@@1 T@U) ) (! (let ((T@@42 (MultiSetTypeInv0 (type s@@1))))
 (=> (= (type s@@1) (MultiSetType T@@42)) (and (= (= (|MultiSet#Card| s@@1) 0) (= s@@1 (|MultiSet#Empty| T@@42))) (=> (not (= (|MultiSet#Card| s@@1) 0)) (exists ((x@@15 T@U) ) (!  (and (= (type x@@15) T@@42) (< 0 (|MultiSet#Select| s@@1 x@@15)))
 :qid |stdinbpl.314:38|
 :skolemid |59|
 :no-pattern (type x@@15)
 :no-pattern (U_2_int x@@15)
 :no-pattern (U_2_bool x@@15)
))))))
 :qid |stdinbpl.312:18|
 :skolemid |60|
 :pattern ( (|MultiSet#Card| s@@1))
)))
(assert (forall ((r@@8 T@U) (o@@7 T@U) ) (! (let ((T@@43 (type r@@8)))
 (=> (= (type o@@7) T@@43) (and (= (= (|MultiSet#Select| (|MultiSet#Singleton| r@@8) o@@7) 1) (= r@@8 o@@7)) (= (= (|MultiSet#Select| (|MultiSet#Singleton| r@@8) o@@7) 0) (not (= r@@8 o@@7))))))
 :qid |stdinbpl.317:18|
 :skolemid |61|
 :pattern ( (|MultiSet#Select| (|MultiSet#Singleton| r@@8) o@@7))
)))
(assert (forall ((o@@8 T@U) (f T@U) (Heap@@8 T@U) ) (!  (=> (and (and (and (= (type o@@8) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap@@8) (MapType0Type RefType))) (U_2_bool (MapType0Select Heap@@8 o@@8 $allocated))) (U_2_bool (MapType0Select Heap@@8 (MapType0Select Heap@@8 o@@8 f) $allocated)))
 :qid |stdinbpl.31:15|
 :skolemid |0|
 :pattern ( (MapType0Select Heap@@8 o@@8 f))
)))
(assert (forall ((r@@9 T@U) (i@@4 Int) ) (!  (=> (= (type r@@9) RefType) (= (PredicateMaskField (list r@@9 i@@4)) (|list#sm| r@@9 i@@4)))
 :qid |stdinbpl.399:15|
 :skolemid |82|
 :pattern ( (PredicateMaskField (list r@@9 i@@4)))
)))
(assert (forall ((a@@28 T@U) (b@@21 T@U) (o@@9 T@U) ) (! (let ((T@@44 (type o@@9)))
 (=> (and (= (type a@@28) (MultiSetType T@@44)) (= (type b@@21) (MultiSetType T@@44))) (= (|MultiSet#Select| (|MultiSet#Union| a@@28 b@@21) o@@9) (+ (|MultiSet#Select| a@@28 o@@9) (|MultiSet#Select| b@@21 o@@9)))))
 :qid |stdinbpl.335:18|
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
 :qid |stdinbpl.201:18|
 :skolemid |23|
 :pattern ( (let ((T@@46 (type o@@10)))
(MapType2Select (|Set#Empty| T@@46) o@@10)))
)))
(assert (forall ((r@@10 T@U) ) (! (let ((T@@47 (type r@@10)))
(= (|MultiSet#Singleton| r@@10) (|MultiSet#UnionOne| (|MultiSet#Empty| T@@47) r@@10)))
 :qid |stdinbpl.320:18|
 :skolemid |63|
 :pattern ( (|MultiSet#Singleton| r@@10))
)))
(assert (forall ((a@@29 Int) (b@@22 Int) ) (! (= (<= a@@29 b@@22) (= (|Math#min| a@@29 b@@22) a@@29))
 :qid |stdinbpl.285:15|
 :skolemid |51|
 :pattern ( (|Math#min| a@@29 b@@22))
)))
(assert (forall ((a@@30 Int) (b@@23 Int) ) (! (= (<= b@@23 a@@30) (= (|Math#min| a@@30 b@@23) b@@23))
 :qid |stdinbpl.286:15|
 :skolemid |52|
 :pattern ( (|Math#min| a@@30 b@@23))
)))
(assert (forall ((s@@2 T@U) ) (! (let ((T@@48 (MapType2TypeInv0 (type s@@2))))
 (=> (= (type s@@2) (MapType2Type T@@48 boolType)) (and (= (= (|Set#Card| s@@2) 0) (= s@@2 (|Set#Empty| T@@48))) (=> (not (= (|Set#Card| s@@2) 0)) (exists ((x@@16 T@U) ) (!  (and (= (type x@@16) T@@48) (U_2_bool (MapType2Select s@@2 x@@16)))
 :qid |stdinbpl.204:33|
 :skolemid |24|
 :no-pattern (type x@@16)
 :no-pattern (U_2_int x@@16)
 :no-pattern (U_2_bool x@@16)
))))))
 :qid |stdinbpl.202:18|
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
 :qid |stdinbpl.264:32|
 :skolemid |46|
 :pattern ( (MapType2Select a@@31 o@@12))
 :pattern ( (MapType2Select b@@24 o@@12))
)))))
 :qid |stdinbpl.263:17|
 :skolemid |47|
 :pattern ( (|Set#Subset| a@@31 b@@24))
)))
(assert (forall ((a@@32 T@U) (x@@17 T@U) ) (! (let ((T@@50 (type x@@17)))
 (=> (and (= (type a@@32) (MapType2Type T@@50 boolType)) (not (U_2_bool (MapType2Select a@@32 x@@17)))) (= (|Set#Card| (|Set#UnionOne| a@@32 x@@17)) (+ (|Set#Card| a@@32) 1))))
 :qid |stdinbpl.220:18|
 :skolemid |33|
 :pattern ( (|Set#Card| (|Set#UnionOne| a@@32 x@@17)))
)))
(assert (forall ((a@@33 T@U) (b@@25 T@U) (o@@13 T@U) ) (! (let ((T@@51 (type o@@13)))
 (=> (and (= (type a@@33) (MultiSetType T@@51)) (= (type b@@25) (MultiSetType T@@51))) (= (|MultiSet#Select| (|MultiSet#Difference| a@@33 b@@25) o@@13) (|Math#clip| (- (|MultiSet#Select| a@@33 o@@13) (|MultiSet#Select| b@@25 o@@13))))))
 :qid |stdinbpl.352:18|
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
(assert (forall ((p@@1 T@U) (v_1@@0 T@U) (q T@U) (w@@0 T@U) (r_1 T@U) (u T@U) ) (! (let ((C@@3 (FieldTypeInv0 (type r_1))))
(let ((B@@10 (FieldTypeInv0 (type q))))
(let ((A@@11 (FieldTypeInv0 (type p@@1))))
 (=> (and (and (and (and (and (and (= (type p@@1) (FieldType A@@11 FrameTypeType)) (= (type v_1@@0) FrameTypeType)) (= (type q) (FieldType B@@10 FrameTypeType))) (= (type w@@0) FrameTypeType)) (= (type r_1) (FieldType C@@3 FrameTypeType))) (= (type u) FrameTypeType)) (and (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r_1 u))) (InsidePredicate p@@1 v_1@@0 r_1 u)))))
 :qid |stdinbpl.180:25|
 :skolemid |20|
 :pattern ( (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r_1 u))
)))
(assert (forall ((a@@34 Int) ) (!  (=> (< a@@34 0) (= (|Math#clip| a@@34) 0))
 :qid |stdinbpl.291:15|
 :skolemid |55|
 :pattern ( (|Math#clip| a@@34))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
(assert (forall ((a@@35 T@U) (x@@18 T@U) (o@@14 T@U) ) (! (let ((T@@52 (type x@@18)))
 (=> (and (= (type a@@35) (MultiSetType T@@52)) (= (type o@@14) T@@52)) (= (|MultiSet#Select| (|MultiSet#UnionOne| a@@35 x@@18) o@@14) (ite (= x@@18 o@@14) (+ (|MultiSet#Select| a@@35 o@@14) 1) (|MultiSet#Select| a@@35 o@@14)))))
 :qid |stdinbpl.324:18|
 :skolemid |64|
 :pattern ( (|MultiSet#Select| (|MultiSet#UnionOne| a@@35 x@@18) o@@14))
 :pattern ( (|MultiSet#UnionOne| a@@35 x@@18) (|MultiSet#Select| a@@35 o@@14))
)))
(assert (forall ((a@@36 T@U) (b@@26 T@U) ) (! (let ((T@@53 (MultiSetTypeInv0 (type a@@36))))
 (=> (and (= (type a@@36) (MultiSetType T@@53)) (= (type b@@26) (MultiSetType T@@53))) (= (|MultiSet#Equal| a@@36 b@@26) (forall ((o@@15 T@U) ) (!  (=> (= (type o@@15) T@@53) (= (|MultiSet#Select| a@@36 o@@15) (|MultiSet#Select| b@@26 o@@15)))
 :qid |stdinbpl.370:36|
 :skolemid |77|
 :pattern ( (|MultiSet#Select| a@@36 o@@15))
 :pattern ( (|MultiSet#Select| b@@26 o@@15))
)))))
 :qid |stdinbpl.369:17|
 :skolemid |78|
 :pattern ( (|MultiSet#Equal| a@@36 b@@26))
)))
(assert (forall ((a@@37 T@U) (b@@27 T@U) ) (! (let ((T@@54 (MultiSetTypeInv0 (type a@@37))))
 (=> (and (= (type a@@37) (MultiSetType T@@54)) (= (type b@@27) (MultiSetType T@@54))) (= (|MultiSet#Subset| a@@37 b@@27) (forall ((o@@16 T@U) ) (!  (=> (= (type o@@16) T@@54) (<= (|MultiSet#Select| a@@37 o@@16) (|MultiSet#Select| b@@27 o@@16)))
 :qid |stdinbpl.366:37|
 :skolemid |75|
 :pattern ( (|MultiSet#Select| a@@37 o@@16))
 :pattern ( (|MultiSet#Select| b@@27 o@@16))
)))))
 :qid |stdinbpl.365:17|
 :skolemid |76|
 :pattern ( (|MultiSet#Subset| a@@37 b@@27))
)))
(assert (forall ((a@@38 T@U) (b@@28 T@U) (o@@17 T@U) ) (! (let ((T@@55 (type o@@17)))
 (=> (and (= (type a@@38) (MapType2Type T@@55 boolType)) (= (type b@@28) (MapType2Type T@@55 boolType))) (= (U_2_bool (MapType2Select (|Set#Union| a@@38 b@@28) o@@17))  (or (U_2_bool (MapType2Select a@@38 o@@17)) (U_2_bool (MapType2Select b@@28 o@@17))))))
 :qid |stdinbpl.224:18|
 :skolemid |34|
 :pattern ( (MapType2Select (|Set#Union| a@@38 b@@28) o@@17))
)))
(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun length () Int)
(declare-fun UnfoldingMask@24 () T@U)
(declare-fun UnfoldingMask@20 () T@U)
(declare-fun l1 () T@U)
(declare-fun UnfoldingMask@21 () T@U)
(declare-fun PostHeap@4 () T@U)
(declare-fun UnfoldingMask@22 () T@U)
(declare-fun UnfoldingMask@23 () T@U)
(declare-fun PostMask@1 () T@U)
(declare-fun FrameFragment (T@U) T@U)
(declare-fun CombineFrames (T@U T@U) T@U)
(declare-fun PostHeap@0 () T@U)
(declare-fun PostHeap@1 () T@U)
(declare-fun PostHeap@2 () T@U)
(declare-fun newPMask@4 () T@U)
(declare-fun PostHeap@3 () T@U)
(declare-fun UnfoldingMask@19 () T@U)
(declare-fun UnfoldingMask@15 () T@U)
(declare-fun UnfoldingMask@16 () T@U)
(declare-fun UnfoldingMask@17 () T@U)
(declare-fun UnfoldingMask@18 () T@U)
(declare-fun PostMask@0 () T@U)
(declare-fun l2 () T@U)
(declare-fun Heap@22 () T@U)
(declare-fun Heap@18 () T@U)
(declare-fun Heap@19 () T@U)
(declare-fun Heap@20 () T@U)
(declare-fun newPMask@3 () T@U)
(declare-fun Heap@21 () T@U)
(declare-fun UnfoldingMask@14 () T@U)
(declare-fun v_2 () Int)
(declare-fun UnfoldingMask@10 () T@U)
(declare-fun UnfoldingMask@11 () T@U)
(declare-fun UnfoldingMask@12 () T@U)
(declare-fun UnfoldingMask@13 () T@U)
(declare-fun Mask@12 () T@U)
(declare-fun Mask@14 () T@U)
(declare-fun Mask@13 () T@U)
(declare-fun Heap@14 () T@U)
(declare-fun Heap@15 () T@U)
(declare-fun Heap@16 () T@U)
(declare-fun newPMask@2 () T@U)
(declare-fun Heap@17 () T@U)
(declare-fun Heap@11 () T@U)
(declare-fun Heap@12 () T@U)
(declare-fun Heap@13 () T@U)
(declare-fun freshVersion@0 () T@U)
(declare-fun Mask@11 () T@U)
(declare-fun Mask@10 () T@U)
(declare-fun Mask@9 () T@U)
(declare-fun Mask@8 () T@U)
(declare-fun Mask@7 () T@U)
(declare-fun Heap@10 () T@U)
(declare-fun Mask@6 () T@U)
(declare-fun arg_length@0 () Int)
(declare-fun Heap@6 () T@U)
(declare-fun Heap@7 () T@U)
(declare-fun arg_r@0 () T@U)
(declare-fun Heap@8 () T@U)
(declare-fun newPMask@1 () T@U)
(declare-fun Heap@9 () T@U)
(declare-fun UnfoldingMask@9 () T@U)
(declare-fun UnfoldingMask@5 () T@U)
(declare-fun UnfoldingMask@6 () T@U)
(declare-fun UnfoldingMask@7 () T@U)
(declare-fun UnfoldingMask@8 () T@U)
(declare-fun ExhaleHeap@0 () T@U)
(declare-fun Heap@3 () T@U)
(declare-fun Heap@4 () T@U)
(declare-fun newPMask@0 () T@U)
(declare-fun Heap@5 () T@U)
(declare-fun UnfoldingMask@4 () T@U)
(declare-fun UnfoldingMask@0 () T@U)
(declare-fun UnfoldingMask@1 () T@U)
(declare-fun UnfoldingMask@2 () T@U)
(declare-fun UnfoldingMask@3 () T@U)
(declare-fun Mask@5 () T@U)
(declare-fun Mask@4 () T@U)
(declare-fun Heap@2 () T@U)
(declare-fun Heap@1 () T@U)
(declare-fun Mask@0 () T@U)
(declare-fun Mask@1 () T@U)
(declare-fun Mask@2 () T@U)
(declare-fun Mask@3 () T@U)
(declare-fun Heap@@10 () T@U)
(declare-fun Heap@0 () T@U)
(declare-fun newVersion@0 () T@U)
(declare-fun QPMask@0 () T@U)
(declare-fun neverTriggered1 (T@U) Bool)
(declare-fun invRecv1 (T@U Int) T@U)
(declare-fun qpRange1 (T@U Int) Bool)
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (= (type Heap@19) (MapType0Type RefType)) (= (type Heap@18) (MapType0Type RefType))) (= (type l1) RefType)) (= (type Heap@20) (MapType0Type RefType))) (= (type newPMask@3) (MapType1Type RefType boolType))) (= (type Heap@21) (MapType0Type RefType))) (= (type Heap@22) (MapType0Type RefType))) (= (type UnfoldingMask@14) (MapType1Type RefType realType))) (= (type UnfoldingMask@11) (MapType1Type RefType realType))) (= (type UnfoldingMask@10) (MapType1Type RefType realType))) (= (type UnfoldingMask@12) (MapType1Type RefType realType))) (= (type UnfoldingMask@13) (MapType1Type RefType realType))) (= (type Mask@12) (MapType1Type RefType realType))) (= (type Mask@14) (MapType1Type RefType realType))) (= (type Mask@13) (MapType1Type RefType realType))) (= (type l2) RefType)) (forall ((arg0@@45 T@U) ) (! (= (type (FrameFragment arg0@@45)) FrameTypeType)
 :qid |funType:FrameFragment|
 :pattern ( (FrameFragment arg0@@45))
))) (forall ((arg0@@46 T@U) (arg1@@25 T@U) ) (! (= (type (CombineFrames arg0@@46 arg1@@25)) FrameTypeType)
 :qid |funType:CombineFrames|
 :pattern ( (CombineFrames arg0@@46 arg1@@25))
))) (= (type Heap@15) (MapType0Type RefType))) (= (type Heap@14) (MapType0Type RefType))) (= (type Heap@16) (MapType0Type RefType))) (= (type newPMask@2) (MapType1Type RefType boolType))) (= (type Heap@17) (MapType0Type RefType))) (= (type Heap@12) (MapType0Type RefType))) (= (type Heap@11) (MapType0Type RefType))) (= (type Heap@13) (MapType0Type RefType))) (= (type freshVersion@0) FrameTypeType)) (= (type Mask@11) (MapType1Type RefType realType))) (= (type Mask@7) (MapType1Type RefType realType))) (= (type Mask@10) (MapType1Type RefType realType))) (= (type Mask@9) (MapType1Type RefType realType))) (= (type Mask@8) (MapType1Type RefType realType))) (= (type Mask@4) (MapType1Type RefType realType))) (= (type Heap@2) (MapType0Type RefType))) (= (type Heap@10) (MapType0Type RefType))) (= (type Mask@6) (MapType1Type RefType realType))) (= (type Heap@7) (MapType0Type RefType))) (= (type Heap@6) (MapType0Type RefType))) (= (type arg_r@0) RefType)) (= (type Heap@8) (MapType0Type RefType))) (= (type newPMask@1) (MapType1Type RefType boolType))) (= (type Heap@9) (MapType0Type RefType))) (= (type UnfoldingMask@9) (MapType1Type RefType realType))) (= (type UnfoldingMask@6) (MapType1Type RefType realType))) (= (type UnfoldingMask@5) (MapType1Type RefType realType))) (= (type UnfoldingMask@7) (MapType1Type RefType realType))) (= (type UnfoldingMask@8) (MapType1Type RefType realType))) (= (type Heap@3) (MapType0Type RefType))) (= (type ExhaleHeap@0) (MapType0Type RefType))) (= (type Heap@4) (MapType0Type RefType))) (= (type newPMask@0) (MapType1Type RefType boolType))) (= (type Heap@5) (MapType0Type RefType))) (= (type UnfoldingMask@4) (MapType1Type RefType realType))) (= (type UnfoldingMask@1) (MapType1Type RefType realType))) (= (type UnfoldingMask@0) (MapType1Type RefType realType))) (= (type UnfoldingMask@2) (MapType1Type RefType realType))) (= (type UnfoldingMask@3) (MapType1Type RefType realType))) (= (type Mask@5) (MapType1Type RefType realType))) (= (type Heap@1) (MapType0Type RefType))) (= (type Mask@1) (MapType1Type RefType realType))) (= (type Mask@0) (MapType1Type RefType realType))) (= (type Mask@2) (MapType1Type RefType realType))) (= (type Mask@3) (MapType1Type RefType realType))) (= (type Heap@0) (MapType0Type RefType))) (= (type Heap@@10) (MapType0Type RefType))) (= (type newVersion@0) FrameTypeType)) (= (type QPMask@0) (MapType1Type RefType realType))) (= (type UnfoldingMask@21) (MapType1Type RefType realType))) (= (type UnfoldingMask@20) (MapType1Type RefType realType))) (= (type PostHeap@4) (MapType0Type RefType))) (= (type UnfoldingMask@22) (MapType1Type RefType realType))) (= (type UnfoldingMask@23) (MapType1Type RefType realType))) (= (type UnfoldingMask@24) (MapType1Type RefType realType))) (= (type PostMask@1) (MapType1Type RefType realType))) (= (type PostHeap@1) (MapType0Type RefType))) (= (type PostHeap@0) (MapType0Type RefType))) (= (type PostHeap@2) (MapType0Type RefType))) (= (type newPMask@4) (MapType1Type RefType boolType))) (= (type PostHeap@3) (MapType0Type RefType))) (= (type UnfoldingMask@19) (MapType1Type RefType realType))) (= (type UnfoldingMask@16) (MapType1Type RefType realType))) (= (type UnfoldingMask@15) (MapType1Type RefType realType))) (= (type UnfoldingMask@17) (MapType1Type RefType realType))) (= (type UnfoldingMask@18) (MapType1Type RefType realType))) (= (type PostMask@0) (MapType1Type RefType realType))) (forall ((arg0@@47 T@U) (arg1@@26 Int) ) (! (= (type (invRecv1 arg0@@47 arg1@@26)) RefType)
 :qid |funType:invRecv1|
 :pattern ( (invRecv1 arg0@@47 arg1@@26))
))))
(set-info :boogie-vc-id m2)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 95) (let ((anon11_correct true))
(let ((anon60_Else_correct  (=> (>= 0 length) (=> (and (= UnfoldingMask@24 UnfoldingMask@20) (= (ControlFlow 0 79) 77)) anon11_correct))))
(let ((anon60_Then_correct  (=> (and (and (> length 0) (not (= l1 null))) (and (= UnfoldingMask@21 (MapType1Store UnfoldingMask@20 l1 val (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@20 l1 val)) FullPerm)))) (state PostHeap@4 UnfoldingMask@21))) (=> (and (and (and (not (= l1 null)) (= UnfoldingMask@22 (MapType1Store UnfoldingMask@21 l1 next (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@21 l1 next)) FullPerm))))) (and (state PostHeap@4 UnfoldingMask@22) (= UnfoldingMask@23 (MapType1Store UnfoldingMask@22 null (list (MapType0Select PostHeap@4 l1 next) (- length 1)) (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@22 null (list (MapType0Select PostHeap@4 l1 next) (- length 1)))) FullPerm)))))) (and (and (InsidePredicate (list l1 length) (MapType0Select PostHeap@4 null (list l1 length)) (list (MapType0Select PostHeap@4 l1 next) (- length 1)) (MapType0Select PostHeap@4 null (list (MapType0Select PostHeap@4 l1 next) (- length 1)))) (state PostHeap@4 UnfoldingMask@23)) (and (= UnfoldingMask@24 UnfoldingMask@23) (= (ControlFlow 0 78) 77)))) anon11_correct))))
(let ((anon9_correct  (=> (and (and (state PostHeap@4 PostMask@1) (|list#trigger| PostHeap@4 (list l1 length))) (and (= (MapType0Select PostHeap@4 null (list l1 length)) (FrameFragment (ite (> length 0) (CombineFrames (FrameFragment (MapType0Select PostHeap@4 l1 val)) (CombineFrames (FrameFragment (MapType0Select PostHeap@4 l1 next)) (MapType0Select PostHeap@4 null (list (MapType0Select PostHeap@4 l1 next) (- length 1))))) EmptyFrame))) (= UnfoldingMask@20 (MapType1Store PostMask@1 null (list l1 length) (real_2_U (- (U_2_real (MapType1Select PostMask@1 null (list l1 length))) FullPerm)))))) (and (=> (= (ControlFlow 0 80) 78) anon60_Then_correct) (=> (= (ControlFlow 0 80) 79) anon60_Else_correct)))))
(let ((anon59_Else_correct  (=> (>= 0 length) (=> (and (= PostHeap@4 PostHeap@0) (= (ControlFlow 0 82) 80)) anon9_correct))))
(let ((anon59_Then_correct  (=> (> length 0) (=> (and (= PostHeap@1 (MapType0Store PostHeap@0 null (|list#sm| l1 length) (MapType1Store (MapType0Select PostHeap@0 null (|list#sm| l1 length)) l1 val (bool_2_U true)))) (= PostHeap@2 (MapType0Store PostHeap@1 null (|list#sm| l1 length) (MapType1Store (MapType0Select PostHeap@1 null (|list#sm| l1 length)) l1 next (bool_2_U true))))) (=> (and (and (forall ((o_9 T@U) (f_12 T@U) ) (! (let ((B@@11 (FieldTypeInv1 (type f_12))))
(let ((A@@12 (FieldTypeInv0 (type f_12))))
 (=> (and (and (= (type o_9) RefType) (= (type f_12) (FieldType A@@12 B@@11))) (or (U_2_bool (MapType1Select (MapType0Select PostHeap@2 null (|list#sm| l1 length)) o_9 f_12)) (U_2_bool (MapType1Select (MapType0Select PostHeap@2 null (|list#sm| (MapType0Select PostHeap@2 l1 next) (- length 1))) o_9 f_12)))) (U_2_bool (MapType1Select newPMask@4 o_9 f_12)))))
 :qid |stdinbpl.1010:33|
 :skolemid |99|
 :pattern ( (MapType1Select newPMask@4 o_9 f_12))
)) (= PostHeap@3 (MapType0Store PostHeap@2 null (|list#sm| l1 length) newPMask@4))) (and (= PostHeap@4 PostHeap@3) (= (ControlFlow 0 81) 80))) anon9_correct)))))
(let ((anon7_correct  (=> (state PostHeap@0 UnfoldingMask@19) (and (=> (= (ControlFlow 0 83) (- 0 84)) (HasDirectPerm UnfoldingMask@19 l1 val)) (=> (HasDirectPerm UnfoldingMask@19 l1 val) (and (=> (= (ControlFlow 0 83) 81) anon59_Then_correct) (=> (= (ControlFlow 0 83) 82) anon59_Else_correct)))))))
(let ((anon58_Else_correct  (=> (>= 0 length) (=> (and (= UnfoldingMask@19 UnfoldingMask@15) (= (ControlFlow 0 86) 83)) anon7_correct))))
(let ((anon58_Then_correct  (=> (and (and (> length 0) (not (= l1 null))) (and (= UnfoldingMask@16 (MapType1Store UnfoldingMask@15 l1 val (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@15 l1 val)) FullPerm)))) (state PostHeap@0 UnfoldingMask@16))) (=> (and (and (and (not (= l1 null)) (= UnfoldingMask@17 (MapType1Store UnfoldingMask@16 l1 next (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@16 l1 next)) FullPerm))))) (and (state PostHeap@0 UnfoldingMask@17) (= UnfoldingMask@18 (MapType1Store UnfoldingMask@17 null (list (MapType0Select PostHeap@0 l1 next) (- length 1)) (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@17 null (list (MapType0Select PostHeap@0 l1 next) (- length 1)))) FullPerm)))))) (and (and (InsidePredicate (list l1 length) (MapType0Select PostHeap@0 null (list l1 length)) (list (MapType0Select PostHeap@0 l1 next) (- length 1)) (MapType0Select PostHeap@0 null (list (MapType0Select PostHeap@0 l1 next) (- length 1)))) (state PostHeap@0 UnfoldingMask@18)) (and (= UnfoldingMask@19 UnfoldingMask@18) (= (ControlFlow 0 85) 83)))) anon7_correct))))
(let ((anon5_correct  (=> (= UnfoldingMask@15 (MapType1Store PostMask@1 null (list l1 length) (real_2_U (- (U_2_real (MapType1Select PostMask@1 null (list l1 length))) FullPerm)))) (and (=> (= (ControlFlow 0 87) 85) anon58_Then_correct) (=> (= (ControlFlow 0 87) 86) anon58_Else_correct)))))
(let ((anon57_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 90) 87)) anon5_correct)))
(let ((anon57_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 88) (- 0 89)) (<= FullPerm (U_2_real (MapType1Select PostMask@1 null (list l1 length))))) (=> (<= FullPerm (U_2_real (MapType1Select PostMask@1 null (list l1 length)))) (=> (= (ControlFlow 0 88) 87) anon5_correct))))))
(let ((anon56_Then_correct  (=> (state PostHeap@0 ZeroMask) (=> (and (and (and (= PostMask@0 (MapType1Store ZeroMask null (list l1 length) (real_2_U (+ (U_2_real (MapType1Select ZeroMask null (list l1 length))) FullPerm)))) (state PostHeap@0 PostMask@0)) (and (state PostHeap@0 PostMask@0) (= PostMask@1 (MapType1Store PostMask@0 null (list l2 length) (real_2_U (+ (U_2_real (MapType1Select PostMask@0 null (list l2 length))) FullPerm)))))) (and (and (state PostHeap@0 PostMask@1) (state PostHeap@0 PostMask@1)) (and (|list#trigger| PostHeap@0 (list l1 length)) (= (MapType0Select PostHeap@0 null (list l1 length)) (FrameFragment (ite (> length 0) (CombineFrames (FrameFragment (MapType0Select PostHeap@0 l1 val)) (CombineFrames (FrameFragment (MapType0Select PostHeap@0 l1 next)) (MapType0Select PostHeap@0 null (list (MapType0Select PostHeap@0 l1 next) (- length 1))))) EmptyFrame)))))) (and (=> (= (ControlFlow 0 91) 88) anon57_Then_correct) (=> (= (ControlFlow 0 91) 90) anon57_Else_correct))))))
(let ((anon54_correct true))
(let ((anon81_Else_correct  (=> (>= 0 length) (=> (and (= Heap@22 Heap@18) (= (ControlFlow 0 4) 2)) anon54_correct))))
(let ((anon81_Then_correct  (=> (> length 0) (=> (and (= Heap@19 (MapType0Store Heap@18 null (|list#sm| l1 length) (MapType1Store (MapType0Select Heap@18 null (|list#sm| l1 length)) l1 val (bool_2_U true)))) (= Heap@20 (MapType0Store Heap@19 null (|list#sm| l1 length) (MapType1Store (MapType0Select Heap@19 null (|list#sm| l1 length)) l1 next (bool_2_U true))))) (=> (and (and (forall ((o_13 T@U) (f_16 T@U) ) (! (let ((B@@12 (FieldTypeInv1 (type f_16))))
(let ((A@@13 (FieldTypeInv0 (type f_16))))
 (=> (and (and (= (type o_13) RefType) (= (type f_16) (FieldType A@@13 B@@12))) (or (U_2_bool (MapType1Select (MapType0Select Heap@20 null (|list#sm| l1 length)) o_13 f_16)) (U_2_bool (MapType1Select (MapType0Select Heap@20 null (|list#sm| (MapType0Select Heap@20 l1 next) (- length 1))) o_13 f_16)))) (U_2_bool (MapType1Select newPMask@3 o_13 f_16)))))
 :qid |stdinbpl.1319:31|
 :skolemid |103|
 :pattern ( (MapType1Select newPMask@3 o_13 f_16))
)) (= Heap@21 (MapType0Store Heap@20 null (|list#sm| l1 length) newPMask@3))) (and (= Heap@22 Heap@21) (= (ControlFlow 0 3) 2))) anon54_correct)))))
(let ((anon52_correct  (=> (state Heap@18 UnfoldingMask@14) (and (=> (= (ControlFlow 0 5) (- 0 6)) (= (U_2_int (MapType0Select Heap@18 l1 val)) v_2)) (=> (= (U_2_int (MapType0Select Heap@18 l1 val)) v_2) (and (=> (= (ControlFlow 0 5) 3) anon81_Then_correct) (=> (= (ControlFlow 0 5) 4) anon81_Else_correct)))))))
(let ((anon80_Else_correct  (=> (>= 0 length) (=> (and (= UnfoldingMask@14 UnfoldingMask@10) (= (ControlFlow 0 8) 5)) anon52_correct))))
(let ((anon80_Then_correct  (=> (and (and (> length 0) (not (= l1 null))) (and (= UnfoldingMask@11 (MapType1Store UnfoldingMask@10 l1 val (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@10 l1 val)) FullPerm)))) (state Heap@18 UnfoldingMask@11))) (=> (and (and (and (not (= l1 null)) (= UnfoldingMask@12 (MapType1Store UnfoldingMask@11 l1 next (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@11 l1 next)) FullPerm))))) (and (state Heap@18 UnfoldingMask@12) (= UnfoldingMask@13 (MapType1Store UnfoldingMask@12 null (list (MapType0Select Heap@18 l1 next) (- length 1)) (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@12 null (list (MapType0Select Heap@18 l1 next) (- length 1)))) FullPerm)))))) (and (and (InsidePredicate (list l1 length) (MapType0Select Heap@18 null (list l1 length)) (list (MapType0Select Heap@18 l1 next) (- length 1)) (MapType0Select Heap@18 null (list (MapType0Select Heap@18 l1 next) (- length 1)))) (state Heap@18 UnfoldingMask@13)) (and (= UnfoldingMask@14 UnfoldingMask@13) (= (ControlFlow 0 7) 5)))) anon52_correct))))
(let ((anon50_correct  (=> (= UnfoldingMask@10 (MapType1Store Mask@12 null (list l1 length) (real_2_U (- (U_2_real (MapType1Select Mask@12 null (list l1 length))) FullPerm)))) (and (=> (= (ControlFlow 0 9) 7) anon80_Then_correct) (=> (= (ControlFlow 0 9) 8) anon80_Else_correct)))))
(let ((anon79_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 12) 9)) anon50_correct)))
(let ((anon79_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 10) (- 0 11)) (<= FullPerm (U_2_real (MapType1Select Mask@12 null (list l1 length))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@12 null (list l1 length)))) (=> (= (ControlFlow 0 10) 9) anon50_correct))))))
(let ((anon48_correct  (=> (= Mask@14 (MapType1Store Mask@13 null (list l2 length) (real_2_U (- (U_2_real (MapType1Select Mask@13 null (list l2 length))) FullPerm)))) (=> (and (|list#trigger| Heap@18 (list l1 length)) (= (MapType0Select Heap@18 null (list l1 length)) (FrameFragment (ite (> length 0) (CombineFrames (FrameFragment (MapType0Select Heap@18 l1 val)) (CombineFrames (FrameFragment (MapType0Select Heap@18 l1 next)) (MapType0Select Heap@18 null (list (MapType0Select Heap@18 l1 next) (- length 1))))) EmptyFrame)))) (and (=> (= (ControlFlow 0 13) 10) anon79_Then_correct) (=> (= (ControlFlow 0 13) 12) anon79_Else_correct))))))
(let ((anon78_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 16) 13)) anon48_correct)))
(let ((anon78_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 14) (- 0 15)) (<= FullPerm (U_2_real (MapType1Select Mask@13 null (list l2 length))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@13 null (list l2 length)))) (=> (= (ControlFlow 0 14) 13) anon48_correct))))))
(let ((anon46_correct  (=> (= Mask@13 (MapType1Store Mask@12 null (list l1 length) (real_2_U (- (U_2_real (MapType1Select Mask@12 null (list l1 length))) FullPerm)))) (and (=> (= (ControlFlow 0 17) 14) anon78_Then_correct) (=> (= (ControlFlow 0 17) 16) anon78_Else_correct)))))
(let ((anon77_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 20) 17)) anon46_correct)))
(let ((anon77_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 18) (- 0 19)) (<= FullPerm (U_2_real (MapType1Select Mask@12 null (list l1 length))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@12 null (list l1 length)))) (=> (= (ControlFlow 0 18) 17) anon46_correct))))))
(let ((anon44_correct  (=> (and (state Heap@18 Mask@12) (state Heap@18 Mask@12)) (and (=> (= (ControlFlow 0 21) 18) anon77_Then_correct) (=> (= (ControlFlow 0 21) 20) anon77_Else_correct)))))
(let ((anon76_Else_correct  (=> (>= 0 length) (=> (and (= Heap@18 Heap@14) (= (ControlFlow 0 23) 21)) anon44_correct))))
(let ((anon76_Then_correct  (=> (> length 0) (=> (and (= Heap@15 (MapType0Store Heap@14 null (|list#sm| l1 length) (MapType1Store (MapType0Select Heap@14 null (|list#sm| l1 length)) l1 val (bool_2_U true)))) (= Heap@16 (MapType0Store Heap@15 null (|list#sm| l1 length) (MapType1Store (MapType0Select Heap@15 null (|list#sm| l1 length)) l1 next (bool_2_U true))))) (=> (and (and (forall ((o_12 T@U) (f_15 T@U) ) (! (let ((B@@13 (FieldTypeInv1 (type f_15))))
(let ((A@@14 (FieldTypeInv0 (type f_15))))
 (=> (and (and (= (type o_12) RefType) (= (type f_15) (FieldType A@@14 B@@13))) (or (U_2_bool (MapType1Select (MapType0Select Heap@16 null (|list#sm| l1 length)) o_12 f_15)) (U_2_bool (MapType1Select (MapType0Select Heap@16 null (|list#sm| (MapType0Select Heap@16 l1 next) (- length 1))) o_12 f_15)))) (U_2_bool (MapType1Select newPMask@2 o_12 f_15)))))
 :qid |stdinbpl.1256:29|
 :skolemid |102|
 :pattern ( (MapType1Select newPMask@2 o_12 f_15))
)) (= Heap@17 (MapType0Store Heap@16 null (|list#sm| l1 length) newPMask@2))) (and (= Heap@18 Heap@17) (= (ControlFlow 0 22) 21))) anon44_correct)))))
(let ((anon75_Else_correct  (=> (and (HasDirectPerm Mask@12 null (list l1 length)) (= Heap@14 Heap@11)) (and (=> (= (ControlFlow 0 25) 22) anon76_Then_correct) (=> (= (ControlFlow 0 25) 23) anon76_Else_correct)))))
(let ((anon75_Then_correct  (=> (and (and (not (HasDirectPerm Mask@12 null (list l1 length))) (= Heap@12 (MapType0Store Heap@11 null (|list#sm| l1 length) ZeroPMask))) (and (= Heap@13 (MapType0Store Heap@12 null (list l1 length) freshVersion@0)) (= Heap@14 Heap@13))) (and (=> (= (ControlFlow 0 24) 22) anon76_Then_correct) (=> (= (ControlFlow 0 24) 23) anon76_Else_correct)))))
(let ((anon40_correct  (=> (= Mask@12 (MapType1Store Mask@11 null (list l1 length) (real_2_U (+ (U_2_real (MapType1Select Mask@11 null (list l1 length))) FullPerm)))) (=> (and (and (state Heap@11 Mask@12) (state Heap@11 Mask@12)) (and (|list#trigger| Heap@11 (list l1 length)) (= (MapType0Select Heap@11 null (list l1 length)) (FrameFragment (ite (> length 0) (CombineFrames (FrameFragment (MapType0Select Heap@11 l1 val)) (CombineFrames (FrameFragment (MapType0Select Heap@11 l1 next)) (MapType0Select Heap@11 null (list (MapType0Select Heap@11 l1 next) (- length 1))))) EmptyFrame))))) (and (=> (= (ControlFlow 0 26) 24) anon75_Then_correct) (=> (= (ControlFlow 0 26) 25) anon75_Else_correct))))))
(let ((anon39_correct  (=> (and (and (= Mask@10 (MapType1Store Mask@9 null (list (MapType0Select Heap@11 l1 next) (- length 1)) (real_2_U (- (U_2_real (MapType1Select Mask@9 null (list (MapType0Select Heap@11 l1 next) (- length 1)))) FullPerm)))) (InsidePredicate (list l1 length) (MapType0Select Heap@11 null (list l1 length)) (list (MapType0Select Heap@11 l1 next) (- length 1)) (MapType0Select Heap@11 null (list (MapType0Select Heap@11 l1 next) (- length 1))))) (and (= Mask@11 Mask@10) (= (ControlFlow 0 28) 26))) anon40_correct)))
(let ((anon74_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 31) 28)) anon39_correct)))
(let ((anon74_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 29) (- 0 30)) (<= FullPerm (U_2_real (MapType1Select Mask@9 null (list (MapType0Select Heap@11 l1 next) (- length 1)))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@9 null (list (MapType0Select Heap@11 l1 next) (- length 1))))) (=> (= (ControlFlow 0 29) 28) anon39_correct))))))
(let ((anon37_correct  (=> (= Mask@9 (MapType1Store Mask@8 l1 next (real_2_U (- (U_2_real (MapType1Select Mask@8 l1 next)) FullPerm)))) (and (=> (= (ControlFlow 0 32) 29) anon74_Then_correct) (=> (= (ControlFlow 0 32) 31) anon74_Else_correct)))))
(let ((anon73_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 35) 32)) anon37_correct)))
(let ((anon73_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 33) (- 0 34)) (<= FullPerm (U_2_real (MapType1Select Mask@8 l1 next)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@8 l1 next))) (=> (= (ControlFlow 0 33) 32) anon37_correct))))))
(let ((anon35_correct  (=> (= Mask@8 (MapType1Store Mask@7 l1 val (real_2_U (- (U_2_real (MapType1Select Mask@7 l1 val)) FullPerm)))) (and (=> (= (ControlFlow 0 36) 33) anon73_Then_correct) (=> (= (ControlFlow 0 36) 35) anon73_Else_correct)))))
(let ((anon72_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 39) 36)) anon35_correct)))
(let ((anon72_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 37) (- 0 38)) (<= FullPerm (U_2_real (MapType1Select Mask@7 l1 val)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@7 l1 val))) (=> (= (ControlFlow 0 37) 36) anon35_correct))))))
(let ((anon71_Then_correct  (=> (> length 0) (and (=> (= (ControlFlow 0 40) 37) anon72_Then_correct) (=> (= (ControlFlow 0 40) 39) anon72_Else_correct)))))
(let ((anon71_Else_correct  (=> (>= 0 length) (=> (and (= Mask@11 Mask@7) (= (ControlFlow 0 27) 26)) anon40_correct))))
(let ((anon32_correct  (=> (state Heap@11 Mask@7) (and (=> (= (ControlFlow 0 41) 40) anon71_Then_correct) (=> (= (ControlFlow 0 41) 27) anon71_Else_correct)))))
(let ((anon31_correct  (=> (state Heap@10 Mask@6) (=> (and (and (state Heap@10 Mask@6) (= Mask@7 Mask@6)) (and (= Heap@11 Heap@10) (= (ControlFlow 0 43) 41))) anon32_correct))))
(let ((anon70_Else_correct  (=> (>= 0 arg_length@0) (=> (and (= Heap@10 Heap@6) (= (ControlFlow 0 45) 43)) anon31_correct))))
(let ((anon70_Then_correct  (=> (> arg_length@0 0) (=> (and (= Heap@7 (MapType0Store Heap@6 null (|list#sm| arg_r@0 arg_length@0) (MapType1Store (MapType0Select Heap@6 null (|list#sm| arg_r@0 arg_length@0)) arg_r@0 val (bool_2_U true)))) (= Heap@8 (MapType0Store Heap@7 null (|list#sm| arg_r@0 arg_length@0) (MapType1Store (MapType0Select Heap@7 null (|list#sm| arg_r@0 arg_length@0)) arg_r@0 next (bool_2_U true))))) (=> (and (and (forall ((o_11 T@U) (f_14 T@U) ) (! (let ((B@@14 (FieldTypeInv1 (type f_14))))
(let ((A@@15 (FieldTypeInv0 (type f_14))))
 (=> (and (and (= (type o_11) RefType) (= (type f_14) (FieldType A@@15 B@@14))) (or (U_2_bool (MapType1Select (MapType0Select Heap@8 null (|list#sm| arg_r@0 arg_length@0)) o_11 f_14)) (U_2_bool (MapType1Select (MapType0Select Heap@8 null (|list#sm| (MapType0Select Heap@8 arg_r@0 next) (- arg_length@0 1))) o_11 f_14)))) (U_2_bool (MapType1Select newPMask@1 o_11 f_14)))))
 :qid |stdinbpl.1204:39|
 :skolemid |101|
 :pattern ( (MapType1Select newPMask@1 o_11 f_14))
)) (= Heap@9 (MapType0Store Heap@8 null (|list#sm| arg_r@0 arg_length@0) newPMask@1))) (and (= Heap@10 Heap@9) (= (ControlFlow 0 44) 43))) anon31_correct)))))
(let ((anon29_correct  (=> (state Heap@6 UnfoldingMask@9) (and (=> (= (ControlFlow 0 46) 44) anon70_Then_correct) (=> (= (ControlFlow 0 46) 45) anon70_Else_correct)))))
(let ((anon69_Else_correct  (=> (>= 0 arg_length@0) (=> (and (= UnfoldingMask@9 UnfoldingMask@5) (= (ControlFlow 0 48) 46)) anon29_correct))))
(let ((anon69_Then_correct  (=> (and (and (> arg_length@0 0) (not (= arg_r@0 null))) (and (= UnfoldingMask@6 (MapType1Store UnfoldingMask@5 arg_r@0 val (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@5 arg_r@0 val)) FullPerm)))) (state Heap@6 UnfoldingMask@6))) (=> (and (and (and (not (= arg_r@0 null)) (= UnfoldingMask@7 (MapType1Store UnfoldingMask@6 arg_r@0 next (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@6 arg_r@0 next)) FullPerm))))) (and (state Heap@6 UnfoldingMask@7) (= UnfoldingMask@8 (MapType1Store UnfoldingMask@7 null (list (MapType0Select Heap@6 arg_r@0 next) (- arg_length@0 1)) (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@7 null (list (MapType0Select Heap@6 arg_r@0 next) (- arg_length@0 1)))) FullPerm)))))) (and (and (InsidePredicate (list arg_r@0 arg_length@0) (MapType0Select Heap@6 null (list arg_r@0 arg_length@0)) (list (MapType0Select Heap@6 arg_r@0 next) (- arg_length@0 1)) (MapType0Select Heap@6 null (list (MapType0Select Heap@6 arg_r@0 next) (- arg_length@0 1)))) (state Heap@6 UnfoldingMask@8)) (and (= UnfoldingMask@9 UnfoldingMask@8) (= (ControlFlow 0 47) 46)))) anon29_correct))))
(let ((anon27_correct  (=> (= UnfoldingMask@5 (MapType1Store Mask@6 null (list arg_r@0 arg_length@0) (real_2_U (- (U_2_real (MapType1Select Mask@6 null (list arg_r@0 arg_length@0))) FullPerm)))) (and (=> (= (ControlFlow 0 49) 47) anon69_Then_correct) (=> (= (ControlFlow 0 49) 48) anon69_Else_correct)))))
(let ((anon68_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 52) 49)) anon27_correct)))
(let ((anon68_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 50) (- 0 51)) (<= FullPerm (U_2_real (MapType1Select Mask@6 null (list arg_r@0 arg_length@0))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@6 null (list arg_r@0 arg_length@0)))) (=> (= (ControlFlow 0 50) 49) anon27_correct))))))
(let ((anon25_correct  (=> (and (and (state Heap@6 Mask@6) (state Heap@6 Mask@6)) (and (|list#trigger| Heap@6 (list arg_r@0 arg_length@0)) (= (MapType0Select Heap@6 null (list arg_r@0 arg_length@0)) (FrameFragment (ite (> arg_length@0 0) (CombineFrames (FrameFragment (MapType0Select Heap@6 arg_r@0 val)) (CombineFrames (FrameFragment (MapType0Select Heap@6 arg_r@0 next)) (MapType0Select Heap@6 null (list (MapType0Select Heap@6 arg_r@0 next) (- arg_length@0 1))))) EmptyFrame))))) (and (=> (= (ControlFlow 0 53) 50) anon68_Then_correct) (=> (= (ControlFlow 0 53) 52) anon68_Else_correct)))))
(let ((anon67_Else_correct  (=> (>= 0 arg_length@0) (=> (and (= Heap@6 ExhaleHeap@0) (= (ControlFlow 0 55) 53)) anon25_correct))))
(let ((anon67_Then_correct  (=> (> arg_length@0 0) (=> (and (= Heap@3 (MapType0Store ExhaleHeap@0 null (|list#sm| arg_r@0 arg_length@0) (MapType1Store (MapType0Select ExhaleHeap@0 null (|list#sm| arg_r@0 arg_length@0)) arg_r@0 val (bool_2_U true)))) (= Heap@4 (MapType0Store Heap@3 null (|list#sm| arg_r@0 arg_length@0) (MapType1Store (MapType0Select Heap@3 null (|list#sm| arg_r@0 arg_length@0)) arg_r@0 next (bool_2_U true))))) (=> (and (and (forall ((o_10 T@U) (f_13 T@U) ) (! (let ((B@@15 (FieldTypeInv1 (type f_13))))
(let ((A@@16 (FieldTypeInv0 (type f_13))))
 (=> (and (and (= (type o_10) RefType) (= (type f_13) (FieldType A@@16 B@@15))) (or (U_2_bool (MapType1Select (MapType0Select Heap@4 null (|list#sm| arg_r@0 arg_length@0)) o_10 f_13)) (U_2_bool (MapType1Select (MapType0Select Heap@4 null (|list#sm| (MapType0Select Heap@4 arg_r@0 next) (- arg_length@0 1))) o_10 f_13)))) (U_2_bool (MapType1Select newPMask@0 o_10 f_13)))))
 :qid |stdinbpl.1159:37|
 :skolemid |100|
 :pattern ( (MapType1Select newPMask@0 o_10 f_13))
)) (= Heap@5 (MapType0Store Heap@4 null (|list#sm| arg_r@0 arg_length@0) newPMask@0))) (and (= Heap@6 Heap@5) (= (ControlFlow 0 54) 53))) anon25_correct)))))
(let ((anon23_correct  (=> (and (state ExhaleHeap@0 UnfoldingMask@4) (= (U_2_int (MapType0Select ExhaleHeap@0 arg_r@0 val)) v_2)) (and (=> (= (ControlFlow 0 56) 54) anon67_Then_correct) (=> (= (ControlFlow 0 56) 55) anon67_Else_correct)))))
(let ((anon66_Else_correct  (=> (>= 0 arg_length@0) (=> (and (= UnfoldingMask@4 UnfoldingMask@0) (= (ControlFlow 0 58) 56)) anon23_correct))))
(let ((anon66_Then_correct  (=> (and (and (> arg_length@0 0) (not (= arg_r@0 null))) (and (= UnfoldingMask@1 (MapType1Store UnfoldingMask@0 arg_r@0 val (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@0 arg_r@0 val)) FullPerm)))) (state ExhaleHeap@0 UnfoldingMask@1))) (=> (and (and (and (not (= arg_r@0 null)) (= UnfoldingMask@2 (MapType1Store UnfoldingMask@1 arg_r@0 next (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@1 arg_r@0 next)) FullPerm))))) (and (state ExhaleHeap@0 UnfoldingMask@2) (= UnfoldingMask@3 (MapType1Store UnfoldingMask@2 null (list (MapType0Select ExhaleHeap@0 arg_r@0 next) (- arg_length@0 1)) (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@2 null (list (MapType0Select ExhaleHeap@0 arg_r@0 next) (- arg_length@0 1)))) FullPerm)))))) (and (and (InsidePredicate (list arg_r@0 arg_length@0) (MapType0Select ExhaleHeap@0 null (list arg_r@0 arg_length@0)) (list (MapType0Select ExhaleHeap@0 arg_r@0 next) (- arg_length@0 1)) (MapType0Select ExhaleHeap@0 null (list (MapType0Select ExhaleHeap@0 arg_r@0 next) (- arg_length@0 1)))) (state ExhaleHeap@0 UnfoldingMask@3)) (and (= UnfoldingMask@4 UnfoldingMask@3) (= (ControlFlow 0 57) 56)))) anon23_correct))))
(let ((anon21_correct  (=> (= Mask@5 (MapType1Store Mask@4 null (list arg_r@0 arg_length@0) (real_2_U (- (U_2_real (MapType1Select Mask@4 null (list arg_r@0 arg_length@0))) FullPerm)))) (=> (and (IdenticalOnKnownLocations Heap@2 ExhaleHeap@0 Mask@5) (= Mask@6 (MapType1Store Mask@5 null (list arg_r@0 arg_length@0) (real_2_U (+ (U_2_real (MapType1Select Mask@5 null (list arg_r@0 arg_length@0))) FullPerm))))) (=> (and (and (state ExhaleHeap@0 Mask@6) (|list#trigger| ExhaleHeap@0 (list arg_r@0 arg_length@0))) (and (= (MapType0Select ExhaleHeap@0 null (list arg_r@0 arg_length@0)) (FrameFragment (ite (> arg_length@0 0) (CombineFrames (FrameFragment (MapType0Select ExhaleHeap@0 arg_r@0 val)) (CombineFrames (FrameFragment (MapType0Select ExhaleHeap@0 arg_r@0 next)) (MapType0Select ExhaleHeap@0 null (list (MapType0Select ExhaleHeap@0 arg_r@0 next) (- arg_length@0 1))))) EmptyFrame))) (= UnfoldingMask@0 (MapType1Store Mask@6 null (list arg_r@0 arg_length@0) (real_2_U (- (U_2_real (MapType1Select Mask@6 null (list arg_r@0 arg_length@0))) FullPerm)))))) (and (=> (= (ControlFlow 0 59) 57) anon66_Then_correct) (=> (= (ControlFlow 0 59) 58) anon66_Else_correct)))))))
(let ((anon65_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 62) 59)) anon21_correct)))
(let ((anon65_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 60) (- 0 61)) (<= FullPerm (U_2_real (MapType1Select Mask@4 null (list arg_r@0 arg_length@0))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@4 null (list arg_r@0 arg_length@0)))) (=> (= (ControlFlow 0 60) 59) anon21_correct))))))
(let ((anon64_Then_correct  (=> (> (- length 1) 0) (and (=> (= (ControlFlow 0 63) (- 0 65)) (HasDirectPerm Mask@4 l1 next)) (=> (HasDirectPerm Mask@4 l1 next) (=> (and (= arg_r@0 (MapType0Select Heap@2 l1 next)) (= arg_length@0 (- length 1))) (and (=> (= (ControlFlow 0 63) (- 0 64)) (> arg_length@0 0)) (=> (> arg_length@0 0) (and (=> (= (ControlFlow 0 63) 60) anon65_Then_correct) (=> (= (ControlFlow 0 63) 62) anon65_Else_correct))))))))))
(let ((anon64_Else_correct  (=> (and (and (>= 0 (- length 1)) (= Mask@7 Mask@4)) (and (= Heap@11 Heap@2) (= (ControlFlow 0 42) 41))) anon32_correct)))
(let ((anon18_correct  (=> (and (state Heap@1 Mask@4) (state Heap@1 Mask@4)) (and (=> (= (ControlFlow 0 66) (- 0 67)) (= FullPerm (U_2_real (MapType1Select Mask@4 l1 val)))) (=> (= FullPerm (U_2_real (MapType1Select Mask@4 l1 val))) (=> (and (= Heap@2 (MapType0Store Heap@1 l1 val (int_2_U v_2))) (state Heap@2 Mask@4)) (and (=> (= (ControlFlow 0 66) 63) anon64_Then_correct) (=> (= (ControlFlow 0 66) 42) anon64_Else_correct))))))))
(let ((anon63_Else_correct  (=> (>= 0 length) (=> (and (= Mask@4 Mask@0) (= (ControlFlow 0 69) 66)) anon18_correct))))
(let ((anon63_Then_correct  (=> (and (and (> length 0) (not (= l1 null))) (and (= Mask@1 (MapType1Store Mask@0 l1 val (real_2_U (+ (U_2_real (MapType1Select Mask@0 l1 val)) FullPerm)))) (state Heap@1 Mask@1))) (=> (and (and (and (not (= l1 null)) (= Mask@2 (MapType1Store Mask@1 l1 next (real_2_U (+ (U_2_real (MapType1Select Mask@1 l1 next)) FullPerm))))) (and (state Heap@1 Mask@2) (= Mask@3 (MapType1Store Mask@2 null (list (MapType0Select Heap@1 l1 next) (- length 1)) (real_2_U (+ (U_2_real (MapType1Select Mask@2 null (list (MapType0Select Heap@1 l1 next) (- length 1)))) FullPerm)))))) (and (and (InsidePredicate (list l1 length) (MapType0Select Heap@1 null (list l1 length)) (list (MapType0Select Heap@1 l1 next) (- length 1)) (MapType0Select Heap@1 null (list (MapType0Select Heap@1 l1 next) (- length 1)))) (state Heap@1 Mask@3)) (and (= Mask@4 Mask@3) (= (ControlFlow 0 68) 66)))) anon18_correct))))
(let ((anon62_Else_correct  (=> (and (HasDirectPerm Mask@0 null (list l1 length)) (= Heap@1 Heap@@10)) (and (=> (= (ControlFlow 0 71) 68) anon63_Then_correct) (=> (= (ControlFlow 0 71) 69) anon63_Else_correct)))))
(let ((anon62_Then_correct  (=> (not (HasDirectPerm Mask@0 null (list l1 length))) (=> (and (= Heap@0 (MapType0Store Heap@@10 null (list l1 length) newVersion@0)) (= Heap@1 Heap@0)) (and (=> (= (ControlFlow 0 70) 68) anon63_Then_correct) (=> (= (ControlFlow 0 70) 69) anon63_Else_correct))))))
(let ((anon14_correct  (=> (= Mask@0 (MapType1Store QPMask@0 null (list l1 length) (real_2_U (- (U_2_real (MapType1Select QPMask@0 null (list l1 length))) FullPerm)))) (and (=> (= (ControlFlow 0 72) 70) anon62_Then_correct) (=> (= (ControlFlow 0 72) 71) anon62_Else_correct)))))
(let ((anon61_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 75) 72)) anon14_correct)))
(let ((anon61_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 73) (- 0 74)) (<= FullPerm (U_2_real (MapType1Select QPMask@0 null (list l1 length))))) (=> (<= FullPerm (U_2_real (MapType1Select QPMask@0 null (list l1 length)))) (=> (= (ControlFlow 0 73) 72) anon14_correct))))))
(let ((anon56_Else_correct  (=> (and (|list#trigger| Heap@@10 (list l1 length)) (= (MapType0Select Heap@@10 null (list l1 length)) (FrameFragment (ite (> length 0) (CombineFrames (FrameFragment (MapType0Select Heap@@10 l1 val)) (CombineFrames (FrameFragment (MapType0Select Heap@@10 l1 next)) (MapType0Select Heap@@10 null (list (MapType0Select Heap@@10 l1 next) (- length 1))))) EmptyFrame)))) (and (=> (= (ControlFlow 0 76) 73) anon61_Then_correct) (=> (= (ControlFlow 0 76) 75) anon61_Else_correct)))))
(let ((anon55_Else_correct  (and (=> (= (ControlFlow 0 92) (- 0 93)) (forall ((l_1 T@U) (l_1_1 T@U) ) (!  (=> (and (= (type l_1) RefType) (= (type l_1_1) RefType)) (=> (and (and (and (and (not (= l_1 l_1_1)) (U_2_bool (MapType2Select (|Set#UnionOne| (|Set#Singleton| l2) l1) l_1))) (U_2_bool (MapType2Select (|Set#UnionOne| (|Set#Singleton| l2) l1) l_1_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (or (not (= l_1 l_1_1)) (not (= length length)))))
 :qid |stdinbpl.919:17|
 :skolemid |93|
 :pattern ( (neverTriggered1 l_1) (neverTriggered1 l_1_1))
))) (=> (forall ((l_1@@0 T@U) (l_1_1@@0 T@U) ) (!  (=> (and (= (type l_1@@0) RefType) (= (type l_1_1@@0) RefType)) (=> (and (and (and (and (not (= l_1@@0 l_1_1@@0)) (U_2_bool (MapType2Select (|Set#UnionOne| (|Set#Singleton| l2) l1) l_1@@0))) (U_2_bool (MapType2Select (|Set#UnionOne| (|Set#Singleton| l2) l1) l_1_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (or (not (= l_1@@0 l_1_1@@0)) (not (= length length)))))
 :qid |stdinbpl.919:17|
 :skolemid |93|
 :pattern ( (neverTriggered1 l_1@@0) (neverTriggered1 l_1_1@@0))
)) (=> (forall ((l_1@@1 T@U) ) (!  (=> (= (type l_1@@1) RefType) (=> (and (U_2_bool (MapType2Select (|Set#UnionOne| (|Set#Singleton| l2) l1) l_1@@1)) (< NoPerm FullPerm)) (and (= (invRecv1 l_1@@1 length) l_1@@1) (qpRange1 l_1@@1 length))))
 :qid |stdinbpl.925:22|
 :skolemid |94|
 :pattern ( (MapType0Select Heap@@10 null (list l_1@@1 length)))
 :pattern ( (MapType1Select ZeroMask null (list l_1@@1 length)))
 :pattern ( (MapType2Select (|Set#UnionOne| (|Set#Singleton| l2) l1) l_1@@1))
)) (=> (and (forall ((r@@11 T@U) (i@@5 Int) ) (!  (=> (= (type r@@11) RefType) (=> (and (and (U_2_bool (MapType2Select (|Set#UnionOne| (|Set#Singleton| l2) l1) (invRecv1 r@@11 i@@5))) (< NoPerm FullPerm)) (qpRange1 r@@11 i@@5)) (and (= (invRecv1 r@@11 i@@5) r@@11) (= length i@@5))))
 :qid |stdinbpl.929:22|
 :skolemid |95|
 :pattern ( (invRecv1 r@@11 i@@5))
)) (forall ((r@@12 T@U) (i@@6 Int) ) (!  (=> (= (type r@@12) RefType) (=> (and (and (U_2_bool (MapType2Select (|Set#UnionOne| (|Set#Singleton| l2) l1) (invRecv1 r@@12 i@@6))) (< NoPerm FullPerm)) (qpRange1 r@@12 i@@6)) (and (=> (< NoPerm FullPerm) (and (= (invRecv1 r@@12 i@@6) r@@12) (= length i@@6))) (= (U_2_real (MapType1Select QPMask@0 null (list r@@12 i@@6))) (+ (U_2_real (MapType1Select ZeroMask null (list r@@12 i@@6))) FullPerm)))))
 :qid |stdinbpl.935:22|
 :skolemid |96|
 :pattern ( (MapType1Select QPMask@0 null (list r@@12 i@@6)))
))) (=> (and (and (forall ((o_8 T@U) (f_5 T@U) ) (! (let ((B@@16 (FieldTypeInv1 (type f_5))))
(let ((A@@17 (FieldTypeInv0 (type f_5))))
 (=> (and (and (= (type o_8) RefType) (= (type f_5) (FieldType A@@17 B@@16))) (or (or (not (= o_8 null)) (not (IsPredicateField f_5))) (not (= (getPredWandId f_5) 0)))) (= (U_2_real (MapType1Select ZeroMask o_8 f_5)) (U_2_real (MapType1Select QPMask@0 o_8 f_5))))))
 :qid |stdinbpl.941:29|
 :skolemid |97|
 :pattern ( (MapType1Select ZeroMask o_8 f_5))
 :pattern ( (MapType1Select QPMask@0 o_8 f_5))
)) (forall ((r@@13 T@U) (i@@7 Int) ) (!  (=> (and (= (type r@@13) RefType) (not (and (and (U_2_bool (MapType2Select (|Set#UnionOne| (|Set#Singleton| l2) l1) (invRecv1 r@@13 i@@7))) (< NoPerm FullPerm)) (qpRange1 r@@13 i@@7)))) (= (U_2_real (MapType1Select QPMask@0 null (list r@@13 i@@7))) (U_2_real (MapType1Select ZeroMask null (list r@@13 i@@7)))))
 :qid |stdinbpl.945:22|
 :skolemid |98|
 :pattern ( (MapType1Select QPMask@0 null (list r@@13 i@@7)))
))) (and (state Heap@@10 QPMask@0) (state Heap@@10 QPMask@0))) (and (=> (= (ControlFlow 0 92) 91) anon56_Then_correct) (=> (= (ControlFlow 0 92) 76) anon56_Else_correct)))))))))
(let ((anon55_Then_correct true))
(let ((anon0_correct  (=> (state Heap@@10 ZeroMask) (=> (and (U_2_bool (MapType0Select Heap@@10 l1 $allocated)) (U_2_bool (MapType0Select Heap@@10 l2 $allocated))) (=> (and (and (> length 0) (state Heap@@10 ZeroMask)) (and (not (= l1 l2)) (state Heap@@10 ZeroMask))) (and (=> (= (ControlFlow 0 94) 1) anon55_Then_correct) (=> (= (ControlFlow 0 94) 92) anon55_Else_correct)))))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 95) 94) anon0_correct)))
PreconditionGeneratedEntry_correct))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
))
(check-sat)
(pop 1)
; Valid
(get-info :rlimit)
