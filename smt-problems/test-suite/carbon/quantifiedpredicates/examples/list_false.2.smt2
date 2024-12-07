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
(declare-fun allSet (T@U T@U Int Int) Bool)
(declare-fun |allSet#triggerStateless| (T@U Int Int) Bool)
(declare-fun |list#trigger| (T@U T@U) Bool)
(declare-fun list (T@U Int) T@U)
(declare-fun AssumeFunctionsAbove () Int)
(declare-fun |allSet'| (T@U T@U Int Int) Bool)
(declare-fun PredicateType_listType () T@T)
(declare-fun FrameTypeType () T@T)
(declare-fun dummyFunction (T@U) Bool)
(declare-fun IsPredicateField (T@U) Bool)
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
(declare-fun |allSet#frame| (T@U T@U Int Int) Bool)
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
 :qid |stdinbpl.491:18|
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
(assert  (and (and (= (Ctor PredicateType_listType) 12) (= (Ctor FrameTypeType) 13)) (forall ((arg0@@28 T@U) (arg1@@12 Int) ) (! (= (type (list arg0@@28 arg1@@12)) (FieldType PredicateType_listType FrameTypeType))
 :qid |funType:list|
 :pattern ( (list arg0@@28 arg1@@12))
))))
(assert (forall ((Heap@@0 T@U) (Mask@@0 T@U) (r_2 T@U) (i Int) (v_2 Int) ) (!  (=> (and (and (and (= (type Heap@@0) (MapType0Type RefType)) (= (type Mask@@0) (MapType1Type RefType realType))) (= (type r_2) RefType)) (and (state Heap@@0 Mask@@0) (< AssumeFunctionsAbove 0))) (= (allSet Heap@@0 r_2 i v_2)  (or (<= i 0) (and (= (U_2_int (MapType0Select Heap@@0 r_2 val)) v_2) (|allSet'| Heap@@0 (MapType0Select Heap@@0 r_2 next) (- i 1) v_2)))))
 :qid |stdinbpl.544:15|
 :skolemid |84|
 :pattern ( (state Heap@@0 Mask@@0) (allSet Heap@@0 r_2 i v_2))
 :pattern ( (state Heap@@0 Mask@@0) (|allSet#triggerStateless| r_2 i v_2) (|list#trigger| Heap@@0 (list r_2 i)))
)))
(assert (forall ((Heap0@@0 T@U) (Heap1@@0 T@U) (Heap2 T@U) ) (!  (=> (and (and (and (= (type Heap0@@0) (MapType0Type RefType)) (= (type Heap1@@0) (MapType0Type RefType))) (= (type Heap2) (MapType0Type RefType))) (and (succHeapTrans Heap0@@0 Heap1@@0) (succHeap Heap1@@0 Heap2))) (succHeapTrans Heap0@@0 Heap2))
 :qid |stdinbpl.93:15|
 :skolemid |12|
 :pattern ( (succHeapTrans Heap0@@0 Heap1@@0) (succHeap Heap1@@0 Heap2))
)))
(assert (forall ((Heap@@1 T@U) (r_2@@0 T@U) (i@@0 Int) (v_2@@0 Int) ) (!  (=> (and (= (type Heap@@1) (MapType0Type RefType)) (= (type r_2@@0) RefType)) (dummyFunction (bool_2_U (|allSet#triggerStateless| r_2@@0 i@@0 v_2@@0))))
 :qid |stdinbpl.538:15|
 :skolemid |83|
 :pattern ( (|allSet'| Heap@@1 r_2@@0 i@@0 v_2@@0))
)))
(assert (forall ((r_2@@1 T@U) (i@@1 Int) ) (!  (=> (= (type r_2@@1) RefType) (IsPredicateField (list r_2@@1 i@@1)))
 :qid |stdinbpl.676:15|
 :skolemid |88|
 :pattern ( (list r_2@@1 i@@1))
)))
(assert (forall ((Heap@@2 T@U) (r_2@@2 T@U) (i@@2 Int) ) (!  (=> (and (= (type Heap@@2) (MapType0Type RefType)) (= (type r_2@@2) RefType)) (|list#everUsed| (list r_2@@2 i@@2)))
 :qid |stdinbpl.695:15|
 :skolemid |92|
 :pattern ( (|list#trigger| Heap@@2 (list r_2@@2 i@@2)))
)))
(assert (forall ((a@@0 Int) (b@@0 Int) ) (!  (or (= (|Math#min| a@@0 b@@0) a@@0) (= (|Math#min| a@@0 b@@0) b@@0))
 :qid |stdinbpl.422:15|
 :skolemid |53|
 :pattern ( (|Math#min| a@@0 b@@0))
)))
(assert  (and (= (type null) RefType) (forall ((arg0@@29 T@U) ) (! (let ((A (FieldTypeInv0 (type arg0@@29))))
(= (type (PredicateMaskField arg0@@29)) (FieldType A (MapType1Type RefType boolType))))
 :qid |funType:PredicateMaskField|
 :pattern ( (PredicateMaskField arg0@@29))
))))
(assert (forall ((Heap@@3 T@U) (ExhaleHeap T@U) (Mask@@1 T@U) (pm_f T@U) ) (! (let ((C (FieldTypeInv0 (type pm_f))))
 (=> (and (and (and (and (and (= (type Heap@@3) (MapType0Type RefType)) (= (type ExhaleHeap) (MapType0Type RefType))) (= (type Mask@@1) (MapType1Type RefType realType))) (= (type pm_f) (FieldType C FrameTypeType))) (IdenticalOnKnownLocations Heap@@3 ExhaleHeap Mask@@1)) (and (HasDirectPerm Mask@@1 null pm_f) (IsPredicateField pm_f))) (= (MapType0Select Heap@@3 null (PredicateMaskField pm_f)) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))))
 :qid |stdinbpl.47:19|
 :skolemid |2|
 :pattern ( (IdenticalOnKnownLocations Heap@@3 ExhaleHeap Mask@@1) (IsPredicateField pm_f) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))
)))
(assert (forall ((arg0@@30 T@U) ) (! (let ((A@@0 (FieldTypeInv0 (type arg0@@30))))
(= (type (WandMaskField arg0@@30)) (FieldType A@@0 (MapType1Type RefType boolType))))
 :qid |funType:WandMaskField|
 :pattern ( (WandMaskField arg0@@30))
)))
(assert (forall ((Heap@@4 T@U) (ExhaleHeap@@0 T@U) (Mask@@2 T@U) (pm_f@@0 T@U) ) (! (let ((C@@0 (FieldTypeInv0 (type pm_f@@0))))
 (=> (and (and (and (and (and (= (type Heap@@4) (MapType0Type RefType)) (= (type ExhaleHeap@@0) (MapType0Type RefType))) (= (type Mask@@2) (MapType1Type RefType realType))) (= (type pm_f@@0) (FieldType C@@0 FrameTypeType))) (IdenticalOnKnownLocations Heap@@4 ExhaleHeap@@0 Mask@@2)) (and (HasDirectPerm Mask@@2 null pm_f@@0) (IsWandField pm_f@@0))) (= (MapType0Select Heap@@4 null (WandMaskField pm_f@@0)) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))))
 :qid |stdinbpl.60:19|
 :skolemid |5|
 :pattern ( (IdenticalOnKnownLocations Heap@@4 ExhaleHeap@@0 Mask@@2) (IsWandField pm_f@@0) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))
)))
(assert (forall ((Heap@@5 T@U) (r_2@@3 T@U) (i@@3 Int) (v_2@@1 Int) ) (!  (=> (and (= (type Heap@@5) (MapType0Type RefType)) (= (type r_2@@3) RefType)) (and (= (allSet Heap@@5 r_2@@3 i@@3 v_2@@1) (|allSet'| Heap@@5 r_2@@3 i@@3 v_2@@1)) (dummyFunction (bool_2_U (|allSet#triggerStateless| r_2@@3 i@@3 v_2@@1)))))
 :qid |stdinbpl.534:15|
 :skolemid |82|
 :pattern ( (allSet Heap@@5 r_2@@3 i@@3 v_2@@1))
)))
(assert (forall ((a@@1 T@U) (b@@1 T@U) (y@@1 T@U) ) (! (let ((T@@3 (type y@@1)))
 (=> (and (and (= (type a@@1) (MultiSetType T@@3)) (= (type b@@1) (MultiSetType T@@3))) (<= (|MultiSet#Select| a@@1 y@@1) (|MultiSet#Select| b@@1 y@@1))) (= (|MultiSet#Select| (|MultiSet#Difference| a@@1 b@@1) y@@1) 0)))
 :qid |stdinbpl.489:18|
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
 :qid |stdinbpl.374:18|
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
 :qid |stdinbpl.378:18|
 :skolemid |40|
 :pattern ( (|Set#Intersection| (|Set#Intersection| a@@3 b@@3) b@@3))
)))
(assert (forall ((a@@4 T@U) (b@@4 T@U) ) (! (let ((T@@8 (MultiSetTypeInv0 (type a@@4))))
 (=> (and (= (type a@@4) (MultiSetType T@@8)) (= (type b@@4) (MultiSetType T@@8))) (= (|MultiSet#Intersection| (|MultiSet#Intersection| a@@4 b@@4) b@@4) (|MultiSet#Intersection| a@@4 b@@4))))
 :qid |stdinbpl.480:18|
 :skolemid |70|
 :pattern ( (|MultiSet#Intersection| (|MultiSet#Intersection| a@@4 b@@4) b@@4))
)))
(assert (forall ((arg0@@38 T@U) ) (! (let ((T@@9 (type arg0@@38)))
(= (type (|Set#Singleton| arg0@@38)) (MapType2Type T@@9 boolType)))
 :qid |funType:Set#Singleton|
 :pattern ( (|Set#Singleton| arg0@@38))
)))
(assert (forall ((r T@U) (o T@U) ) (! (let ((T@@10 (type r)))
 (=> (= (type o) T@@10) (= (U_2_bool (MapType2Select (|Set#Singleton| r) o)) (= r o))))
 :qid |stdinbpl.343:18|
 :skolemid |27|
 :pattern ( (MapType2Select (|Set#Singleton| r) o))
)))
(assert (forall ((a@@5 T@U) (b@@5 T@U) ) (! (let ((T@@11 (MapType2TypeInv0 (type a@@5))))
 (=> (and (= (type a@@5) (MapType2Type T@@11 boolType)) (= (type b@@5) (MapType2Type T@@11 boolType))) (= (+ (|Set#Card| (|Set#Union| a@@5 b@@5)) (|Set#Card| (|Set#Intersection| a@@5 b@@5))) (+ (|Set#Card| a@@5) (|Set#Card| b@@5)))))
 :qid |stdinbpl.382:18|
 :skolemid |42|
 :pattern ( (|Set#Card| (|Set#Union| a@@5 b@@5)))
 :pattern ( (|Set#Card| (|Set#Intersection| a@@5 b@@5)))
)))
(assert (forall ((Heap@@6 T@U) (ExhaleHeap@@1 T@U) (Mask@@3 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@6) (MapType0Type RefType)) (= (type ExhaleHeap@@1) (MapType0Type RefType))) (= (type Mask@@3) (MapType1Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@6 ExhaleHeap@@1 Mask@@3)) (U_2_bool (MapType0Select Heap@@6 o_1 $allocated))) (U_2_bool (MapType0Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.73:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@6 ExhaleHeap@@1 Mask@@3) (MapType0Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert (forall ((a@@6 Int) ) (!  (=> (<= 0 a@@6) (= (|Math#clip| a@@6) a@@6))
 :qid |stdinbpl.425:15|
 :skolemid |54|
 :pattern ( (|Math#clip| a@@6))
)))
(assert (forall ((a@@7 T@U) (b@@6 T@U) (o@@0 T@U) ) (! (let ((T@@12 (type o@@0)))
 (=> (and (= (type a@@7) (MultiSetType T@@12)) (= (type b@@6) (MultiSetType T@@12))) (= (|MultiSet#Select| (|MultiSet#Intersection| a@@7 b@@6) o@@0) (|Math#min| (|MultiSet#Select| a@@7 o@@0) (|MultiSet#Select| b@@6 o@@0)))))
 :qid |stdinbpl.476:18|
 :skolemid |69|
 :pattern ( (|MultiSet#Select| (|MultiSet#Intersection| a@@7 b@@6) o@@0))
)))
(assert (forall ((r_2@@4 T@U) (i@@4 Int) (r2 T@U) (i2 Int) ) (!  (=> (and (and (= (type r_2@@4) RefType) (= (type r2) RefType)) (= (list r_2@@4 i@@4) (list r2 i2))) (and (= r_2@@4 r2) (= i@@4 i2)))
 :qid |stdinbpl.686:15|
 :skolemid |90|
 :pattern ( (list r_2@@4 i@@4) (list r2 i2))
)))
(assert (forall ((arg0@@39 T@U) (arg1@@20 Int) ) (! (= (type (|list#sm| arg0@@39 arg1@@20)) (FieldType PredicateType_listType (MapType1Type RefType boolType)))
 :qid |funType:list#sm|
 :pattern ( (|list#sm| arg0@@39 arg1@@20))
)))
(assert (forall ((r_2@@5 T@U) (i@@5 Int) (r2@@0 T@U) (i2@@0 Int) ) (!  (=> (and (and (= (type r_2@@5) RefType) (= (type r2@@0) RefType)) (= (|list#sm| r_2@@5 i@@5) (|list#sm| r2@@0 i2@@0))) (and (= r_2@@5 r2@@0) (= i@@5 i2@@0)))
 :qid |stdinbpl.690:15|
 :skolemid |91|
 :pattern ( (|list#sm| r_2@@5 i@@5) (|list#sm| r2@@0 i2@@0))
)))
(assert (forall ((Heap@@7 T@U) (ExhaleHeap@@2 T@U) (Mask@@4 T@U) (o_1@@0 T@U) (f_2 T@U) ) (! (let ((B@@1 (FieldTypeInv1 (type f_2))))
(let ((A@@1 (FieldTypeInv0 (type f_2))))
 (=> (and (and (and (and (and (and (= (type Heap@@7) (MapType0Type RefType)) (= (type ExhaleHeap@@2) (MapType0Type RefType))) (= (type Mask@@4) (MapType1Type RefType realType))) (= (type o_1@@0) RefType)) (= (type f_2) (FieldType A@@1 B@@1))) (IdenticalOnKnownLocations Heap@@7 ExhaleHeap@@2 Mask@@4)) (HasDirectPerm Mask@@4 o_1@@0 f_2)) (= (MapType0Select Heap@@7 o_1@@0 f_2) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2)))))
 :qid |stdinbpl.42:22|
 :skolemid |1|
 :pattern ( (IdenticalOnKnownLocations Heap@@7 ExhaleHeap@@2 Mask@@4) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2))
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
 :qid |stdinbpl.462:18|
 :skolemid |65|
 :pattern ( (|MultiSet#Card| (|MultiSet#UnionOne| a@@8 x@@8)))
 :pattern ( (|MultiSet#UnionOne| a@@8 x@@8) (|MultiSet#Card| a@@8))
)))
(assert (forall ((a@@9 T@U) (b@@7 T@U) ) (! (let ((T@@15 (MultiSetTypeInv0 (type a@@9))))
 (=> (and (= (type a@@9) (MultiSetType T@@15)) (= (type b@@7) (MultiSetType T@@15))) (= (|MultiSet#Disjoint| a@@9 b@@7) (forall ((o@@1 T@U) ) (!  (=> (= (type o@@1) T@@15) (or (= (|MultiSet#Select| a@@9 o@@1) 0) (= (|MultiSet#Select| b@@7 o@@1) 0)))
 :qid |stdinbpl.512:39|
 :skolemid |80|
 :pattern ( (|MultiSet#Select| a@@9 o@@1))
 :pattern ( (|MultiSet#Select| b@@7 o@@1))
)))))
 :qid |stdinbpl.511:18|
 :skolemid |81|
 :pattern ( (|MultiSet#Disjoint| a@@9 b@@7))
)))
(assert (forall ((p T@U) (v_1 T@U) (w T@U) ) (! (let ((A@@2 (FieldTypeInv0 (type p))))
 (=> (and (and (= (type p) (FieldType A@@2 FrameTypeType)) (= (type v_1) FrameTypeType)) (= (type w) FrameTypeType)) (not (InsidePredicate p v_1 p w))))
 :qid |stdinbpl.320:19|
 :skolemid |21|
 :pattern ( (InsidePredicate p v_1 p w))
)))
(assert (forall ((arg0@@41 T@U) ) (! (let ((T@@16 (type arg0@@41)))
(= (type (|MultiSet#Singleton| arg0@@41)) (MultiSetType T@@16)))
 :qid |funType:MultiSet#Singleton|
 :pattern ( (|MultiSet#Singleton| arg0@@41))
)))
(assert (forall ((r@@0 T@U) ) (!  (and (= (|MultiSet#Card| (|MultiSet#Singleton| r@@0)) 1) (= (|MultiSet#Select| (|MultiSet#Singleton| r@@0) r@@0) 1))
 :qid |stdinbpl.454:18|
 :skolemid |62|
 :pattern ( (|MultiSet#Singleton| r@@0))
)))
(assert  (not (IsPredicateField val)))
(assert  (not (IsWandField val)))
(assert  (not (IsPredicateField next)))
(assert  (not (IsWandField next)))
(assert (forall ((Heap@@8 T@U) (ExhaleHeap@@3 T@U) (Mask@@5 T@U) ) (!  (=> (and (and (and (= (type Heap@@8) (MapType0Type RefType)) (= (type ExhaleHeap@@3) (MapType0Type RefType))) (= (type Mask@@5) (MapType1Type RefType realType))) (IdenticalOnKnownLocations Heap@@8 ExhaleHeap@@3 Mask@@5)) (succHeap Heap@@8 ExhaleHeap@@3))
 :qid |stdinbpl.83:15|
 :skolemid |10|
 :pattern ( (IdenticalOnKnownLocations Heap@@8 ExhaleHeap@@3 Mask@@5))
)))
(assert (forall ((a@@10 T@U) (b@@8 T@U) ) (! (let ((T@@17 (MapType2TypeInv0 (type a@@10))))
 (=> (and (= (type a@@10) (MapType2Type T@@17 boolType)) (= (type b@@8) (MapType2Type T@@17 boolType))) (= (|Set#Equal| a@@10 b@@8) (forall ((o@@2 T@U) ) (!  (=> (= (type o@@2) T@@17) (= (U_2_bool (MapType2Select a@@10 o@@2)) (U_2_bool (MapType2Select b@@8 o@@2))))
 :qid |stdinbpl.407:31|
 :skolemid |48|
 :pattern ( (MapType2Select a@@10 o@@2))
 :pattern ( (MapType2Select b@@8 o@@2))
)))))
 :qid |stdinbpl.406:17|
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
 :qid |stdinbpl.472:18|
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
 :qid |stdinbpl.308:15|
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
(assert (forall ((Heap@@9 T@U) (Mask@@7 T@U) (r_2@@6 T@U) (i@@6 Int) (v_2@@2 Int) ) (!  (=> (and (and (and (= (type Heap@@9) (MapType0Type RefType)) (= (type Mask@@7) (MapType1Type RefType realType))) (= (type r_2@@6) RefType)) (state Heap@@9 Mask@@7)) (= (|allSet'| Heap@@9 r_2@@6 i@@6 v_2@@2) (|allSet#frame| (MapType0Select Heap@@9 null (list r_2@@6 i@@6)) r_2@@6 i@@6 v_2@@2)))
 :qid |stdinbpl.551:15|
 :skolemid |85|
 :pattern ( (state Heap@@9 Mask@@7) (|allSet'| Heap@@9 r_2@@6 i@@6 v_2@@2))
 :pattern ( (state Heap@@9 Mask@@7) (|allSet#triggerStateless| r_2@@6 i@@6 v_2@@2) (|list#trigger| Heap@@9 (list r_2@@6 i@@6)))
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
 :qid |stdinbpl.371:18|
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
 :qid |stdinbpl.386:18|
 :skolemid |43|
 :pattern ( (MapType2Select (|Set#Difference| a@@13 b@@11) o@@4))
 :pattern ( (|Set#Difference| a@@13 b@@11) (MapType2Select a@@13 o@@4))
)))
(assert (forall ((a@@14 T@U) (b@@12 T@U) ) (! (let ((T@@22 (MapType2TypeInv0 (type a@@14))))
 (=> (and (and (= (type a@@14) (MapType2Type T@@22 boolType)) (= (type b@@12) (MapType2Type T@@22 boolType))) (|Set#Equal| a@@14 b@@12)) (= a@@14 b@@12)))
 :qid |stdinbpl.408:17|
 :skolemid |50|
 :pattern ( (|Set#Equal| a@@14 b@@12))
)))
(assert (forall ((a@@15 T@U) (b@@13 T@U) ) (! (let ((T@@23 (MultiSetTypeInv0 (type a@@15))))
 (=> (and (and (= (type a@@15) (MultiSetType T@@23)) (= (type b@@13) (MultiSetType T@@23))) (|MultiSet#Equal| a@@15 b@@13)) (= a@@15 b@@13)))
 :qid |stdinbpl.507:17|
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
 :qid |stdinbpl.351:18|
 :skolemid |31|
 :pattern ( (|Set#UnionOne| a@@16 x@@9) (MapType2Select a@@16 y@@2))
)))
(assert (forall ((a@@17 T@U) (b@@14 T@U) (y@@3 T@U) ) (! (let ((T@@26 (type y@@3)))
 (=> (and (and (= (type a@@17) (MapType2Type T@@26 boolType)) (= (type b@@14) (MapType2Type T@@26 boolType))) (U_2_bool (MapType2Select a@@17 y@@3))) (U_2_bool (MapType2Select (|Set#Union| a@@17 b@@14) y@@3))))
 :qid |stdinbpl.361:18|
 :skolemid |35|
 :pattern ( (|Set#Union| a@@17 b@@14) (MapType2Select a@@17 y@@3))
)))
(assert (forall ((a@@18 T@U) (b@@15 T@U) (y@@4 T@U) ) (! (let ((T@@27 (type y@@4)))
 (=> (and (and (= (type a@@18) (MapType2Type T@@27 boolType)) (= (type b@@15) (MapType2Type T@@27 boolType))) (U_2_bool (MapType2Select b@@15 y@@4))) (U_2_bool (MapType2Select (|Set#Union| a@@18 b@@15) y@@4))))
 :qid |stdinbpl.363:18|
 :skolemid |36|
 :pattern ( (|Set#Union| a@@18 b@@15) (MapType2Select b@@15 y@@4))
)))
(assert (forall ((ms T@U) (x@@10 T@U) ) (! (let ((T@@28 (type x@@10)))
 (=> (= (type ms) (MultiSetType T@@28)) (>= (|MultiSet#Select| ms x@@10) 0)))
 :qid |stdinbpl.438:18|
 :skolemid |56|
 :pattern ( (|MultiSet#Select| ms x@@10))
)))
(assert (forall ((a@@19 T@U) (x@@11 T@U) (o@@5 T@U) ) (! (let ((T@@29 (type x@@11)))
 (=> (and (= (type a@@19) (MapType2Type T@@29 boolType)) (= (type o@@5) T@@29)) (= (U_2_bool (MapType2Select (|Set#UnionOne| a@@19 x@@11) o@@5))  (or (= o@@5 x@@11) (U_2_bool (MapType2Select a@@19 o@@5))))))
 :qid |stdinbpl.347:18|
 :skolemid |29|
 :pattern ( (MapType2Select (|Set#UnionOne| a@@19 x@@11) o@@5))
)))
(assert (forall ((a@@20 T@U) (b@@16 T@U) (y@@5 T@U) ) (! (let ((T@@30 (type y@@5)))
 (=> (and (and (= (type a@@20) (MapType2Type T@@30 boolType)) (= (type b@@16) (MapType2Type T@@30 boolType))) (U_2_bool (MapType2Select b@@16 y@@5))) (not (U_2_bool (MapType2Select (|Set#Difference| a@@20 b@@16) y@@5)))))
 :qid |stdinbpl.388:18|
 :skolemid |44|
 :pattern ( (|Set#Difference| a@@20 b@@16) (MapType2Select b@@16 y@@5))
)))
(assert (forall ((a@@21 T@U) (b@@17 T@U) ) (! (let ((T@@31 (MapType2TypeInv0 (type a@@21))))
 (=> (and (= (type a@@21) (MapType2Type T@@31 boolType)) (= (type b@@17) (MapType2Type T@@31 boolType))) (and (= (+ (+ (|Set#Card| (|Set#Difference| a@@21 b@@17)) (|Set#Card| (|Set#Difference| b@@17 a@@21))) (|Set#Card| (|Set#Intersection| a@@21 b@@17))) (|Set#Card| (|Set#Union| a@@21 b@@17))) (= (|Set#Card| (|Set#Difference| a@@21 b@@17)) (- (|Set#Card| a@@21) (|Set#Card| (|Set#Intersection| a@@21 b@@17)))))))
 :qid |stdinbpl.390:18|
 :skolemid |45|
 :pattern ( (|Set#Card| (|Set#Difference| a@@21 b@@17)))
)))
(assert (forall ((s T@U) ) (! (let ((T@@32 (MapType2TypeInv0 (type s))))
 (=> (= (type s) (MapType2Type T@@32 boolType)) (<= 0 (|Set#Card| s))))
 :qid |stdinbpl.333:18|
 :skolemid |22|
 :pattern ( (|Set#Card| s))
)))
(assert (forall ((s@@0 T@U) ) (! (let ((T@@33 (MultiSetTypeInv0 (type s@@0))))
 (=> (= (type s@@0) (MultiSetType T@@33)) (<= 0 (|MultiSet#Card| s@@0))))
 :qid |stdinbpl.441:18|
 :skolemid |57|
 :pattern ( (|MultiSet#Card| s@@0))
)))
(assert (forall ((T@@34 T@T) ) (! (= (type (|MultiSet#Empty| T@@34)) (MultiSetType T@@34))
 :qid |funType:MultiSet#Empty|
 :pattern ( (|MultiSet#Empty| T@@34))
)))
(assert (forall ((o@@6 T@U) ) (! (let ((T@@35 (type o@@6)))
(= (|MultiSet#Select| (|MultiSet#Empty| T@@35) o@@6) 0))
 :qid |stdinbpl.446:18|
 :skolemid |58|
 :pattern ( (let ((T@@35 (type o@@6)))
(|MultiSet#Select| (|MultiSet#Empty| T@@35) o@@6)))
)))
(assert (forall ((r_2@@7 T@U) (i@@7 Int) ) (!  (=> (= (type r_2@@7) RefType) (= (getPredWandId (list r_2@@7 i@@7)) 0))
 :qid |stdinbpl.680:15|
 :skolemid |89|
 :pattern ( (list r_2@@7 i@@7))
)))
(assert (forall ((a@@22 T@U) (x@@12 T@U) ) (! (let ((T@@36 (type x@@12)))
 (=> (= (type a@@22) (MapType2Type T@@36 boolType)) (U_2_bool (MapType2Select (|Set#UnionOne| a@@22 x@@12) x@@12))))
 :qid |stdinbpl.349:18|
 :skolemid |30|
 :pattern ( (|Set#UnionOne| a@@22 x@@12))
)))
(assert (forall ((Heap@@10 T@U) (ExhaleHeap@@4 T@U) (Mask@@8 T@U) (pm_f@@1 T@U) ) (! (let ((C@@1 (FieldTypeInv0 (type pm_f@@1))))
 (=> (and (and (and (and (and (= (type Heap@@10) (MapType0Type RefType)) (= (type ExhaleHeap@@4) (MapType0Type RefType))) (= (type Mask@@8) (MapType1Type RefType realType))) (= (type pm_f@@1) (FieldType C@@1 FrameTypeType))) (IdenticalOnKnownLocations Heap@@10 ExhaleHeap@@4 Mask@@8)) (and (HasDirectPerm Mask@@8 null pm_f@@1) (IsPredicateField pm_f@@1))) (forall ((o2 T@U) (f_2@@0 T@U) ) (! (let ((B@@5 (FieldTypeInv1 (type f_2@@0))))
(let ((A@@6 (FieldTypeInv0 (type f_2@@0))))
 (=> (and (and (= (type o2) RefType) (= (type f_2@@0) (FieldType A@@6 B@@5))) (U_2_bool (MapType1Select (MapType0Select Heap@@10 null (PredicateMaskField pm_f@@1)) o2 f_2@@0))) (= (MapType0Select Heap@@10 o2 f_2@@0) (MapType0Select ExhaleHeap@@4 o2 f_2@@0)))))
 :qid |stdinbpl.54:134|
 :skolemid |3|
 :pattern ( (MapType0Select ExhaleHeap@@4 o2 f_2@@0))
))))
 :qid |stdinbpl.52:19|
 :skolemid |4|
 :pattern ( (IdenticalOnKnownLocations Heap@@10 ExhaleHeap@@4 Mask@@8) (IsPredicateField pm_f@@1))
)))
(assert (forall ((Heap@@11 T@U) (ExhaleHeap@@5 T@U) (Mask@@9 T@U) (pm_f@@2 T@U) ) (! (let ((C@@2 (FieldTypeInv0 (type pm_f@@2))))
 (=> (and (and (and (and (and (= (type Heap@@11) (MapType0Type RefType)) (= (type ExhaleHeap@@5) (MapType0Type RefType))) (= (type Mask@@9) (MapType1Type RefType realType))) (= (type pm_f@@2) (FieldType C@@2 FrameTypeType))) (IdenticalOnKnownLocations Heap@@11 ExhaleHeap@@5 Mask@@9)) (and (HasDirectPerm Mask@@9 null pm_f@@2) (IsWandField pm_f@@2))) (forall ((o2@@0 T@U) (f_2@@1 T@U) ) (! (let ((B@@6 (FieldTypeInv1 (type f_2@@1))))
(let ((A@@7 (FieldTypeInv0 (type f_2@@1))))
 (=> (and (and (= (type o2@@0) RefType) (= (type f_2@@1) (FieldType A@@7 B@@6))) (U_2_bool (MapType1Select (MapType0Select Heap@@11 null (WandMaskField pm_f@@2)) o2@@0 f_2@@1))) (= (MapType0Select Heap@@11 o2@@0 f_2@@1) (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1)))))
 :qid |stdinbpl.67:129|
 :skolemid |6|
 :pattern ( (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1))
))))
 :qid |stdinbpl.65:19|
 :skolemid |7|
 :pattern ( (IdenticalOnKnownLocations Heap@@11 ExhaleHeap@@5 Mask@@9) (IsWandField pm_f@@2))
)))
(assert (forall ((a@@23 T@U) (x@@13 T@U) ) (! (let ((T@@37 (type x@@13)))
 (=> (and (= (type a@@23) (MapType2Type T@@37 boolType)) (U_2_bool (MapType2Select a@@23 x@@13))) (= (|Set#Card| (|Set#UnionOne| a@@23 x@@13)) (|Set#Card| a@@23))))
 :qid |stdinbpl.353:18|
 :skolemid |32|
 :pattern ( (|Set#Card| (|Set#UnionOne| a@@23 x@@13)))
)))
(assert (forall ((a@@24 T@U) (x@@14 T@U) ) (! (let ((T@@38 (type x@@14)))
 (=> (= (type a@@24) (MultiSetType T@@38)) (and (> (|MultiSet#Select| (|MultiSet#UnionOne| a@@24 x@@14) x@@14) 0) (> (|MultiSet#Card| (|MultiSet#UnionOne| a@@24 x@@14)) 0))))
 :qid |stdinbpl.465:18|
 :skolemid |66|
 :pattern ( (|MultiSet#UnionOne| a@@24 x@@14))
)))
(assert (forall ((r@@1 T@U) ) (! (= (|Set#Card| (|Set#Singleton| r@@1)) 1)
 :qid |stdinbpl.344:18|
 :skolemid |28|
 :pattern ( (|Set#Card| (|Set#Singleton| r@@1)))
)))
(assert (forall ((Mask@@10 T@U) (o_2@@2 T@U) (f_4@@2 T@U) ) (! (let ((B@@7 (FieldTypeInv1 (type f_4@@2))))
(let ((A@@8 (FieldTypeInv0 (type f_4@@2))))
 (=> (and (and (and (= (type Mask@@10) (MapType1Type RefType realType)) (= (type o_2@@2) RefType)) (= (type f_4@@2) (FieldType A@@8 B@@7))) (GoodMask Mask@@10)) (and (>= (U_2_real (MapType1Select Mask@@10 o_2@@2 f_4@@2)) NoPerm) (=> (and (and (GoodMask Mask@@10) (not (IsPredicateField f_4@@2))) (not (IsWandField f_4@@2))) (<= (U_2_real (MapType1Select Mask@@10 o_2@@2 f_4@@2)) FullPerm))))))
 :qid |stdinbpl.128:22|
 :skolemid |16|
 :pattern ( (GoodMask Mask@@10) (MapType1Select Mask@@10 o_2@@2 f_4@@2))
)))
(assert (forall ((r@@2 T@U) ) (! (U_2_bool (MapType2Select (|Set#Singleton| r@@2) r@@2))
 :qid |stdinbpl.342:18|
 :skolemid |26|
 :pattern ( (|Set#Singleton| r@@2))
)))
(assert (forall ((a@@25 T@U) (b@@18 T@U) ) (! (let ((T@@39 (MapType2TypeInv0 (type a@@25))))
 (=> (and (= (type a@@25) (MapType2Type T@@39 boolType)) (= (type b@@18) (MapType2Type T@@39 boolType))) (= (|Set#Union| a@@25 (|Set#Union| a@@25 b@@18)) (|Set#Union| a@@25 b@@18))))
 :qid |stdinbpl.376:18|
 :skolemid |39|
 :pattern ( (|Set#Union| a@@25 (|Set#Union| a@@25 b@@18)))
)))
(assert (forall ((a@@26 T@U) (b@@19 T@U) ) (! (let ((T@@40 (MapType2TypeInv0 (type a@@26))))
 (=> (and (= (type a@@26) (MapType2Type T@@40 boolType)) (= (type b@@19) (MapType2Type T@@40 boolType))) (= (|Set#Intersection| a@@26 (|Set#Intersection| a@@26 b@@19)) (|Set#Intersection| a@@26 b@@19))))
 :qid |stdinbpl.380:18|
 :skolemid |41|
 :pattern ( (|Set#Intersection| a@@26 (|Set#Intersection| a@@26 b@@19)))
)))
(assert (forall ((a@@27 T@U) (b@@20 T@U) ) (! (let ((T@@41 (MultiSetTypeInv0 (type a@@27))))
 (=> (and (= (type a@@27) (MultiSetType T@@41)) (= (type b@@20) (MultiSetType T@@41))) (= (|MultiSet#Intersection| a@@27 (|MultiSet#Intersection| a@@27 b@@20)) (|MultiSet#Intersection| a@@27 b@@20))))
 :qid |stdinbpl.482:18|
 :skolemid |71|
 :pattern ( (|MultiSet#Intersection| a@@27 (|MultiSet#Intersection| a@@27 b@@20)))
)))
(assert (forall ((s@@1 T@U) ) (! (let ((T@@42 (MultiSetTypeInv0 (type s@@1))))
 (=> (= (type s@@1) (MultiSetType T@@42)) (and (= (= (|MultiSet#Card| s@@1) 0) (= s@@1 (|MultiSet#Empty| T@@42))) (=> (not (= (|MultiSet#Card| s@@1) 0)) (exists ((x@@15 T@U) ) (!  (and (= (type x@@15) T@@42) (< 0 (|MultiSet#Select| s@@1 x@@15)))
 :qid |stdinbpl.449:38|
 :skolemid |59|
 :no-pattern (type x@@15)
 :no-pattern (U_2_int x@@15)
 :no-pattern (U_2_bool x@@15)
))))))
 :qid |stdinbpl.447:18|
 :skolemid |60|
 :pattern ( (|MultiSet#Card| s@@1))
)))
(assert (forall ((r@@3 T@U) (o@@7 T@U) ) (! (let ((T@@43 (type r@@3)))
 (=> (= (type o@@7) T@@43) (and (= (= (|MultiSet#Select| (|MultiSet#Singleton| r@@3) o@@7) 1) (= r@@3 o@@7)) (= (= (|MultiSet#Select| (|MultiSet#Singleton| r@@3) o@@7) 0) (not (= r@@3 o@@7))))))
 :qid |stdinbpl.452:18|
 :skolemid |61|
 :pattern ( (|MultiSet#Select| (|MultiSet#Singleton| r@@3) o@@7))
)))
(assert (forall ((o@@8 T@U) (f T@U) (Heap@@12 T@U) ) (!  (=> (and (and (and (= (type o@@8) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap@@12) (MapType0Type RefType))) (U_2_bool (MapType0Select Heap@@12 o@@8 $allocated))) (U_2_bool (MapType0Select Heap@@12 (MapType0Select Heap@@12 o@@8 f) $allocated)))
 :qid |stdinbpl.31:15|
 :skolemid |0|
 :pattern ( (MapType0Select Heap@@12 o@@8 f))
)))
(assert (forall ((r_2@@8 T@U) (i@@8 Int) ) (!  (=> (= (type r_2@@8) RefType) (= (PredicateMaskField (list r_2@@8 i@@8)) (|list#sm| r_2@@8 i@@8)))
 :qid |stdinbpl.672:15|
 :skolemid |87|
 :pattern ( (PredicateMaskField (list r_2@@8 i@@8)))
)))
(assert (forall ((a@@28 T@U) (b@@21 T@U) (o@@9 T@U) ) (! (let ((T@@44 (type o@@9)))
 (=> (and (= (type a@@28) (MultiSetType T@@44)) (= (type b@@21) (MultiSetType T@@44))) (= (|MultiSet#Select| (|MultiSet#Union| a@@28 b@@21) o@@9) (+ (|MultiSet#Select| a@@28 o@@9) (|MultiSet#Select| b@@21 o@@9)))))
 :qid |stdinbpl.470:18|
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
 :qid |stdinbpl.336:18|
 :skolemid |23|
 :pattern ( (let ((T@@46 (type o@@10)))
(MapType2Select (|Set#Empty| T@@46) o@@10)))
)))
(assert (forall ((r@@4 T@U) ) (! (let ((T@@47 (type r@@4)))
(= (|MultiSet#Singleton| r@@4) (|MultiSet#UnionOne| (|MultiSet#Empty| T@@47) r@@4)))
 :qid |stdinbpl.455:18|
 :skolemid |63|
 :pattern ( (|MultiSet#Singleton| r@@4))
)))
(assert (forall ((a@@29 Int) (b@@22 Int) ) (! (= (<= a@@29 b@@22) (= (|Math#min| a@@29 b@@22) a@@29))
 :qid |stdinbpl.420:15|
 :skolemid |51|
 :pattern ( (|Math#min| a@@29 b@@22))
)))
(assert (forall ((a@@30 Int) (b@@23 Int) ) (! (= (<= b@@23 a@@30) (= (|Math#min| a@@30 b@@23) b@@23))
 :qid |stdinbpl.421:15|
 :skolemid |52|
 :pattern ( (|Math#min| a@@30 b@@23))
)))
(assert (forall ((s@@2 T@U) ) (! (let ((T@@48 (MapType2TypeInv0 (type s@@2))))
 (=> (= (type s@@2) (MapType2Type T@@48 boolType)) (and (= (= (|Set#Card| s@@2) 0) (= s@@2 (|Set#Empty| T@@48))) (=> (not (= (|Set#Card| s@@2) 0)) (exists ((x@@16 T@U) ) (!  (and (= (type x@@16) T@@48) (U_2_bool (MapType2Select s@@2 x@@16)))
 :qid |stdinbpl.339:33|
 :skolemid |24|
 :no-pattern (type x@@16)
 :no-pattern (U_2_int x@@16)
 :no-pattern (U_2_bool x@@16)
))))))
 :qid |stdinbpl.337:18|
 :skolemid |25|
 :pattern ( (|Set#Card| s@@2))
)))
(assert (forall ((Heap@@13 T@U) (o@@11 T@U) (f_3 T@U) (v T@U) ) (! (let ((B@@8 (type v)))
(let ((A@@9 (FieldTypeInv0 (type f_3))))
 (=> (and (and (= (type Heap@@13) (MapType0Type RefType)) (= (type o@@11) RefType)) (= (type f_3) (FieldType A@@9 B@@8))) (succHeap Heap@@13 (MapType0Store Heap@@13 o@@11 f_3 v)))))
 :qid |stdinbpl.78:22|
 :skolemid |9|
 :pattern ( (MapType0Store Heap@@13 o@@11 f_3 v))
)))
(assert (forall ((a@@31 T@U) (b@@24 T@U) ) (! (let ((T@@49 (MapType2TypeInv0 (type a@@31))))
 (=> (and (= (type a@@31) (MapType2Type T@@49 boolType)) (= (type b@@24) (MapType2Type T@@49 boolType))) (= (|Set#Subset| a@@31 b@@24) (forall ((o@@12 T@U) ) (!  (=> (and (= (type o@@12) T@@49) (U_2_bool (MapType2Select a@@31 o@@12))) (U_2_bool (MapType2Select b@@24 o@@12)))
 :qid |stdinbpl.399:32|
 :skolemid |46|
 :pattern ( (MapType2Select a@@31 o@@12))
 :pattern ( (MapType2Select b@@24 o@@12))
)))))
 :qid |stdinbpl.398:17|
 :skolemid |47|
 :pattern ( (|Set#Subset| a@@31 b@@24))
)))
(assert (forall ((a@@32 T@U) (x@@17 T@U) ) (! (let ((T@@50 (type x@@17)))
 (=> (and (= (type a@@32) (MapType2Type T@@50 boolType)) (not (U_2_bool (MapType2Select a@@32 x@@17)))) (= (|Set#Card| (|Set#UnionOne| a@@32 x@@17)) (+ (|Set#Card| a@@32) 1))))
 :qid |stdinbpl.355:18|
 :skolemid |33|
 :pattern ( (|Set#Card| (|Set#UnionOne| a@@32 x@@17)))
)))
(assert (forall ((a@@33 T@U) (b@@25 T@U) (o@@13 T@U) ) (! (let ((T@@51 (type o@@13)))
 (=> (and (= (type a@@33) (MultiSetType T@@51)) (= (type b@@25) (MultiSetType T@@51))) (= (|MultiSet#Select| (|MultiSet#Difference| a@@33 b@@25) o@@13) (|Math#clip| (- (|MultiSet#Select| a@@33 o@@13) (|MultiSet#Select| b@@25 o@@13))))))
 :qid |stdinbpl.487:18|
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
 :qid |stdinbpl.315:25|
 :skolemid |20|
 :pattern ( (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r@@5 u))
)))
(assert (forall ((a@@34 Int) ) (!  (=> (< a@@34 0) (= (|Math#clip| a@@34) 0))
 :qid |stdinbpl.426:15|
 :skolemid |55|
 :pattern ( (|Math#clip| a@@34))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
(assert (forall ((a@@35 T@U) (x@@18 T@U) (o@@14 T@U) ) (! (let ((T@@52 (type x@@18)))
 (=> (and (= (type a@@35) (MultiSetType T@@52)) (= (type o@@14) T@@52)) (= (|MultiSet#Select| (|MultiSet#UnionOne| a@@35 x@@18) o@@14) (ite (= x@@18 o@@14) (+ (|MultiSet#Select| a@@35 o@@14) 1) (|MultiSet#Select| a@@35 o@@14)))))
 :qid |stdinbpl.459:18|
 :skolemid |64|
 :pattern ( (|MultiSet#Select| (|MultiSet#UnionOne| a@@35 x@@18) o@@14))
 :pattern ( (|MultiSet#UnionOne| a@@35 x@@18) (|MultiSet#Select| a@@35 o@@14))
)))
(assert (forall ((a@@36 T@U) (b@@26 T@U) ) (! (let ((T@@53 (MultiSetTypeInv0 (type a@@36))))
 (=> (and (= (type a@@36) (MultiSetType T@@53)) (= (type b@@26) (MultiSetType T@@53))) (= (|MultiSet#Equal| a@@36 b@@26) (forall ((o@@15 T@U) ) (!  (=> (= (type o@@15) T@@53) (= (|MultiSet#Select| a@@36 o@@15) (|MultiSet#Select| b@@26 o@@15)))
 :qid |stdinbpl.505:36|
 :skolemid |77|
 :pattern ( (|MultiSet#Select| a@@36 o@@15))
 :pattern ( (|MultiSet#Select| b@@26 o@@15))
)))))
 :qid |stdinbpl.504:17|
 :skolemid |78|
 :pattern ( (|MultiSet#Equal| a@@36 b@@26))
)))
(assert (forall ((a@@37 T@U) (b@@27 T@U) ) (! (let ((T@@54 (MultiSetTypeInv0 (type a@@37))))
 (=> (and (= (type a@@37) (MultiSetType T@@54)) (= (type b@@27) (MultiSetType T@@54))) (= (|MultiSet#Subset| a@@37 b@@27) (forall ((o@@16 T@U) ) (!  (=> (= (type o@@16) T@@54) (<= (|MultiSet#Select| a@@37 o@@16) (|MultiSet#Select| b@@27 o@@16)))
 :qid |stdinbpl.501:37|
 :skolemid |75|
 :pattern ( (|MultiSet#Select| a@@37 o@@16))
 :pattern ( (|MultiSet#Select| b@@27 o@@16))
)))))
 :qid |stdinbpl.500:17|
 :skolemid |76|
 :pattern ( (|MultiSet#Subset| a@@37 b@@27))
)))
(assert (forall ((a@@38 T@U) (b@@28 T@U) (o@@17 T@U) ) (! (let ((T@@55 (type o@@17)))
 (=> (and (= (type a@@38) (MapType2Type T@@55 boolType)) (= (type b@@28) (MapType2Type T@@55 boolType))) (= (U_2_bool (MapType2Select (|Set#Union| a@@38 b@@28) o@@17))  (or (U_2_bool (MapType2Select a@@38 o@@17)) (U_2_bool (MapType2Select b@@28 o@@17))))))
 :qid |stdinbpl.359:18|
 :skolemid |34|
 :pattern ( (MapType2Select (|Set#Union| a@@38 b@@28) o@@17))
)))
(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun QPMask@44 () T@U)
(declare-fun r_3 () T@U)
(declare-fun length () Int)
(declare-fun lists () T@U)
(declare-fun neverTriggered2 (T@U) Bool)
(declare-fun PostHeap@0 () T@U)
(declare-fun invRecv2 (T@U Int) T@U)
(declare-fun qpRange2 (T@U Int) Bool)
(declare-fun r1_5 () T@U)
(declare-fun s@3 () T@U)
(declare-fun r2_5 () T@U)
(declare-fun Heap@10 () T@U)
(declare-fun sNext@2 () T@U)
(declare-fun r_60 () T@U)
(declare-fun v_2@@3 () Int)
(declare-fun r_58 () T@U)
(declare-fun s@0 () T@U)
(declare-fun Heap@9 () T@U)
(declare-fun l () T@U)
(declare-fun Mask@12 () T@U)
(declare-fun sNext@1 () T@U)
(declare-fun neverTriggered16 (T@U) Bool)
(declare-fun invRecv16 (T@U Int) T@U)
(declare-fun qpRange16 (T@U Int) Bool)
(declare-fun QPMask@36 () T@U)
(declare-fun neverTriggered17 (T@U) Bool)
(declare-fun QPMask@37 () T@U)
(declare-fun qpRange17 (T@U) Bool)
(declare-fun invRecv17 (T@U) T@U)
(declare-fun neverTriggered18 (T@U) Bool)
(declare-fun invRecv18 (T@U Int) T@U)
(declare-fun qpRange18 (T@U Int) Bool)
(declare-fun QPMask@38 () T@U)
(declare-fun neverTriggered19 (T@U) Bool)
(declare-fun QPMask@39 () T@U)
(declare-fun qpRange19 (T@U) Bool)
(declare-fun invRecv19 (T@U) T@U)
(declare-fun r_7 () T@U)
(declare-fun Mask@8 () T@U)
(declare-fun Mask@9 () T@U)
(declare-fun Mask@10 () T@U)
(declare-fun Mask@11 () T@U)
(declare-fun ExhaleHeap@0 () T@U)
(declare-fun Heap@8 () T@U)
(declare-fun newVersion@0 () T@U)
(declare-fun QPMask@8 () T@U)
(declare-fun neverTriggered12 (T@U) Bool)
(declare-fun invRecv12 (T@U Int) T@U)
(declare-fun qpRange12 (T@U Int) Bool)
(declare-fun QPMask@5 () T@U)
(declare-fun QPMask@6 () T@U)
(declare-fun qpRange13 (T@U) Bool)
(declare-fun invRecv13 (T@U) T@U)
(declare-fun neverTriggered14 (T@U) Bool)
(declare-fun invRecv14 (T@U Int) T@U)
(declare-fun qpRange14 (T@U Int) Bool)
(declare-fun QPMask@7 () T@U)
(declare-fun qpRange15 (T@U) Bool)
(declare-fun invRecv15 (T@U) T@U)
(declare-fun FrameFragment (T@U) T@U)
(declare-fun CombineFrames (T@U T@U) T@U)
(declare-fun s@2 () T@U)
(declare-fun r_129 () T@U)
(declare-fun Heap@7 () T@U)
(declare-fun neverTriggered41 (T@U) Bool)
(declare-fun QPMask@30 () T@U)
(declare-fun invRecv41 (T@U Int) T@U)
(declare-fun qpRange41 (T@U Int) Bool)
(declare-fun QPMask@31 () T@U)
(declare-fun r1_13 () T@U)
(declare-fun r2_13 () T@U)
(declare-fun neverTriggered40 (T@U) Bool)
(declare-fun QPMask@29 () T@U)
(declare-fun qpRange40 (T@U) Bool)
(declare-fun invRecv40 (T@U) T@U)
(declare-fun r_124 () T@U)
(declare-fun neverTriggered39 (T@U) Bool)
(declare-fun QPMask@28 () T@U)
(declare-fun qpRange39 (T@U) Bool)
(declare-fun invRecv39 (T@U) T@U)
(declare-fun r_121 () T@U)
(declare-fun Mask@5 () T@U)
(declare-fun s@1 () T@U)
(declare-fun l2 () T@U)
(declare-fun neverTriggered38 (T@U) Bool)
(declare-fun invRecv38 (T@U Int) T@U)
(declare-fun qpRange38 (T@U Int) Bool)
(declare-fun Heap@3 () T@U)
(declare-fun Heap@4 () T@U)
(declare-fun Heap@5 () T@U)
(declare-fun newPMask@0 () T@U)
(declare-fun Heap@6 () T@U)
(declare-fun ExhaleHeap@2 () T@U)
(declare-fun Heap@1 () T@U)
(declare-fun Heap@2 () T@U)
(declare-fun freshVersion@0 () T@U)
(declare-fun Mask@4 () T@U)
(declare-fun Mask@3 () T@U)
(declare-fun Mask@2 () T@U)
(declare-fun Mask@1 () T@U)
(declare-fun QPMask@22 () T@U)
(declare-fun neverTriggered34 (T@U) Bool)
(declare-fun invRecv34 (T@U Int) T@U)
(declare-fun qpRange34 (T@U Int) Bool)
(declare-fun QPMask@19 () T@U)
(declare-fun QPMask@20 () T@U)
(declare-fun qpRange35 (T@U) Bool)
(declare-fun invRecv35 (T@U) T@U)
(declare-fun QPMask@21 () T@U)
(declare-fun qpRange36 (T@U) Bool)
(declare-fun invRecv36 (T@U) T@U)
(declare-fun neverTriggered37 (T@U) Bool)
(declare-fun invRecv37 (T@U Int) T@U)
(declare-fun qpRange37 (T@U Int) Bool)
(declare-fun QPMask@35 () T@U)
(declare-fun r_13 () T@U)
(declare-fun neverTriggered33 (T@U) Bool)
(declare-fun invRecv33 (T@U Int) T@U)
(declare-fun qpRange33 (T@U Int) Bool)
(declare-fun QPMask@34 () T@U)
(declare-fun r_12 () T@U)
(declare-fun r1_2 () T@U)
(declare-fun r2_2 () T@U)
(declare-fun qpRange32 (T@U) Bool)
(declare-fun invRecv32 (T@U) T@U)
(declare-fun QPMask@33 () T@U)
(declare-fun r_11 () T@U)
(declare-fun qpRange31 (T@U) Bool)
(declare-fun invRecv31 (T@U) T@U)
(declare-fun QPMask@32 () T@U)
(declare-fun r_8 () T@U)
(declare-fun neverTriggered30 (T@U) Bool)
(declare-fun QPMask@18 () T@U)
(declare-fun invRecv30 (T@U Int) T@U)
(declare-fun qpRange30 (T@U Int) Bool)
(declare-fun neverTriggered42 (T@U) Bool)
(declare-fun invRecv42 (T@U Int) T@U)
(declare-fun qpRange42 (T@U Int) Bool)
(declare-fun QPMask@23 () T@U)
(declare-fun QPMask@24 () T@U)
(declare-fun qpRange43 (T@U) Bool)
(declare-fun invRecv43 (T@U) T@U)
(declare-fun QPMask@25 () T@U)
(declare-fun qpRange44 (T@U) Bool)
(declare-fun invRecv44 (T@U) T@U)
(declare-fun neverTriggered45 (T@U) Bool)
(declare-fun invRecv45 (T@U Int) T@U)
(declare-fun qpRange45 (T@U Int) Bool)
(declare-fun QPMask@26 () T@U)
(declare-fun Heap@0 () T@U)
(declare-fun r_88 () T@U)
(declare-fun neverTriggered29 (T@U) Bool)
(declare-fun QPMask@17 () T@U)
(declare-fun invRecv29 (T@U Int) T@U)
(declare-fun qpRange29 (T@U Int) Bool)
(declare-fun r1_8 () T@U)
(declare-fun r2_8 () T@U)
(declare-fun neverTriggered28 (T@U) Bool)
(declare-fun QPMask@16 () T@U)
(declare-fun qpRange28 (T@U) Bool)
(declare-fun invRecv28 (T@U) T@U)
(declare-fun r_83 () T@U)
(declare-fun neverTriggered27 (T@U) Bool)
(declare-fun QPMask@15 () T@U)
(declare-fun qpRange27 (T@U) Bool)
(declare-fun invRecv27 (T@U) T@U)
(declare-fun r_80 () T@U)
(declare-fun Mask@0 () T@U)
(declare-fun neverTriggered26 (T@U) Bool)
(declare-fun invRecv26 (T@U Int) T@U)
(declare-fun qpRange26 (T@U Int) Bool)
(declare-fun QPMask@12 () T@U)
(declare-fun arg_length@0 () Int)
(declare-fun neverTriggered24 (T@U) Bool)
(declare-fun invRecv24 (T@U Int) T@U)
(declare-fun qpRange24 (T@U Int) Bool)
(declare-fun QPMask@13 () T@U)
(declare-fun ExhaleHeap@1 () T@U)
(declare-fun neverTriggered25 (T@U) Bool)
(declare-fun invRecv25 (T@U Int) T@U)
(declare-fun qpRange25 (T@U Int) Bool)
(declare-fun QPMask@14 () T@U)
(declare-fun QPMask@4 () T@U)
(declare-fun neverTriggered20 (T@U) Bool)
(declare-fun invRecv20 (T@U Int) T@U)
(declare-fun qpRange20 (T@U Int) Bool)
(declare-fun QPMask@9 () T@U)
(declare-fun QPMask@10 () T@U)
(declare-fun qpRange21 (T@U) Bool)
(declare-fun invRecv21 (T@U) T@U)
(declare-fun neverTriggered22 (T@U) Bool)
(declare-fun invRecv22 (T@U Int) T@U)
(declare-fun qpRange22 (T@U Int) Bool)
(declare-fun QPMask@11 () T@U)
(declare-fun qpRange23 (T@U) Bool)
(declare-fun invRecv23 (T@U) T@U)
(declare-fun r1_1 () T@U)
(declare-fun r2_1 () T@U)
(declare-fun QPMask@43 () T@U)
(declare-fun r_6 () T@U)
(declare-fun r_4 () T@U)
(declare-fun qpRange11 (T@U) Bool)
(declare-fun invRecv11 (T@U) T@U)
(declare-fun QPMask@42 () T@U)
(declare-fun neverTriggered10 (T@U) Bool)
(declare-fun invRecv10 (T@U Int) T@U)
(declare-fun qpRange10 (T@U Int) Bool)
(declare-fun QPMask@41 () T@U)
(declare-fun qpRange9 (T@U) Bool)
(declare-fun invRecv9 (T@U) T@U)
(declare-fun QPMask@40 () T@U)
(declare-fun neverTriggered8 (T@U) Bool)
(declare-fun invRecv8 (T@U Int) T@U)
(declare-fun qpRange8 (T@U Int) Bool)
(declare-fun Heap@@14 () T@U)
(declare-fun r1 () T@U)
(declare-fun r2@@1 () T@U)
(declare-fun sNext@0 () T@U)
(declare-fun r_22 () T@U)
(declare-fun r_20 () T@U)
(declare-fun QPMask@0 () T@U)
(declare-fun neverTriggered4 (T@U) Bool)
(declare-fun invRecv4 (T@U Int) T@U)
(declare-fun qpRange4 (T@U Int) Bool)
(declare-fun QPMask@1 () T@U)
(declare-fun neverTriggered5 (T@U) Bool)
(declare-fun QPMask@2 () T@U)
(declare-fun qpRange5 (T@U) Bool)
(declare-fun invRecv5 (T@U) T@U)
(declare-fun neverTriggered6 (T@U) Bool)
(declare-fun invRecv6 (T@U Int) T@U)
(declare-fun qpRange6 (T@U Int) Bool)
(declare-fun QPMask@3 () T@U)
(declare-fun neverTriggered7 (T@U) Bool)
(declare-fun qpRange7 (T@U) Bool)
(declare-fun invRecv7 (T@U) T@U)
(declare-fun neverTriggered1 (T@U) Bool)
(declare-fun invRecv1 (T@U Int) T@U)
(declare-fun qpRange1 (T@U Int) Bool)
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (= (type lists) (MapType2Type RefType boolType)) (= (type r_20) RefType)) (= (type Heap@@14) (MapType0Type RefType))) (= (type r_22) RefType)) (= (type sNext@0) (MapType2Type RefType boolType))) (= (type r1) RefType)) (= (type r2@@1) RefType)) (= (type r_4) RefType)) (= (type s@0) (MapType2Type RefType boolType))) (= (type QPMask@43) (MapType1Type RefType realType))) (= (type r_6) RefType)) (= (type r1_1) RefType)) (= (type r2_1) RefType)) (= (type sNext@1) (MapType2Type RefType boolType))) (= (type ExhaleHeap@0) (MapType0Type RefType))) (forall ((arg0@@45 T@U) ) (! (= (type (invRecv11 arg0@@45)) RefType)
 :qid |funType:invRecv11|
 :pattern ( (invRecv11 arg0@@45))
))) (= (type QPMask@42) (MapType1Type RefType realType))) (forall ((arg0@@46 T@U) (arg1@@25 Int) ) (! (= (type (invRecv10 arg0@@46 arg1@@25)) RefType)
 :qid |funType:invRecv10|
 :pattern ( (invRecv10 arg0@@46 arg1@@25))
))) (= (type QPMask@41) (MapType1Type RefType realType))) (forall ((arg0@@47 T@U) ) (! (= (type (invRecv9 arg0@@47)) RefType)
 :qid |funType:invRecv9|
 :pattern ( (invRecv9 arg0@@47))
))) (= (type QPMask@40) (MapType1Type RefType realType))) (= (type QPMask@4) (MapType1Type RefType realType))) (forall ((arg0@@48 T@U) (arg1@@26 Int) ) (! (= (type (invRecv8 arg0@@48 arg1@@26)) RefType)
 :qid |funType:invRecv8|
 :pattern ( (invRecv8 arg0@@48 arg1@@26))
))) (= (type r_80) RefType)) (= (type Heap@0) (MapType0Type RefType))) (= (type r_83) RefType)) (= (type r1_8) RefType)) (= (type r2_8) RefType)) (= (type r_88) RefType)) (= (type s@1) (MapType2Type RefType boolType))) (= (type ExhaleHeap@2) (MapType0Type RefType))) (= (type QPMask@18) (MapType1Type RefType realType))) (forall ((arg0@@49 T@U) (arg1@@27 Int) ) (! (= (type (invRecv42 arg0@@49 arg1@@27)) RefType)
 :qid |funType:invRecv42|
 :pattern ( (invRecv42 arg0@@49 arg1@@27))
))) (= (type QPMask@23) (MapType1Type RefType realType))) (= (type QPMask@24) (MapType1Type RefType realType))) (forall ((arg0@@50 T@U) ) (! (= (type (invRecv43 arg0@@50)) RefType)
 :qid |funType:invRecv43|
 :pattern ( (invRecv43 arg0@@50))
))) (= (type QPMask@25) (MapType1Type RefType realType))) (forall ((arg0@@51 T@U) ) (! (= (type (invRecv44 arg0@@51)) RefType)
 :qid |funType:invRecv44|
 :pattern ( (invRecv44 arg0@@51))
))) (forall ((arg0@@52 T@U) (arg1@@28 Int) ) (! (= (type (invRecv45 arg0@@52 arg1@@28)) RefType)
 :qid |funType:invRecv45|
 :pattern ( (invRecv45 arg0@@52 arg1@@28))
))) (= (type QPMask@26) (MapType1Type RefType realType))) (= (type r_8) RefType)) (= (type QPMask@32) (MapType1Type RefType realType))) (= (type r_11) RefType)) (= (type QPMask@33) (MapType1Type RefType realType))) (= (type r1_2) RefType)) (= (type r2_2) RefType)) (= (type QPMask@34) (MapType1Type RefType realType))) (= (type r_12) RefType)) (= (type r_13) RefType)) (= (type QPMask@35) (MapType1Type RefType realType))) (forall ((arg0@@53 T@U) (arg1@@29 Int) ) (! (= (type (invRecv33 arg0@@53 arg1@@29)) RefType)
 :qid |funType:invRecv33|
 :pattern ( (invRecv33 arg0@@53 arg1@@29))
))) (forall ((arg0@@54 T@U) ) (! (= (type (invRecv32 arg0@@54)) RefType)
 :qid |funType:invRecv32|
 :pattern ( (invRecv32 arg0@@54))
))) (forall ((arg0@@55 T@U) ) (! (= (type (invRecv31 arg0@@55)) RefType)
 :qid |funType:invRecv31|
 :pattern ( (invRecv31 arg0@@55))
))) (forall ((arg0@@56 T@U) (arg1@@30 Int) ) (! (= (type (invRecv30 arg0@@56 arg1@@30)) RefType)
 :qid |funType:invRecv30|
 :pattern ( (invRecv30 arg0@@56 arg1@@30))
))) (= (type r_121) RefType)) (= (type s@2) (MapType2Type RefType boolType))) (= (type Heap@7) (MapType0Type RefType))) (= (type r_124) RefType)) (= (type r1_13) RefType)) (= (type r2_13) RefType)) (= (type r_129) RefType)) (= (type QPMask@30) (MapType1Type RefType realType))) (forall ((arg0@@57 T@U) (arg1@@31 Int) ) (! (= (type (invRecv41 arg0@@57 arg1@@31)) RefType)
 :qid |funType:invRecv41|
 :pattern ( (invRecv41 arg0@@57 arg1@@31))
))) (= (type QPMask@31) (MapType1Type RefType realType))) (= (type QPMask@29) (MapType1Type RefType realType))) (forall ((arg0@@58 T@U) ) (! (= (type (invRecv40 arg0@@58)) RefType)
 :qid |funType:invRecv40|
 :pattern ( (invRecv40 arg0@@58))
))) (= (type QPMask@28) (MapType1Type RefType realType))) (forall ((arg0@@59 T@U) ) (! (= (type (invRecv39 arg0@@59)) RefType)
 :qid |funType:invRecv39|
 :pattern ( (invRecv39 arg0@@59))
))) (= (type Mask@5) (MapType1Type RefType realType))) (= (type l2) RefType)) (forall ((arg0@@60 T@U) (arg1@@32 Int) ) (! (= (type (invRecv38 arg0@@60 arg1@@32)) RefType)
 :qid |funType:invRecv38|
 :pattern ( (invRecv38 arg0@@60 arg1@@32))
))) (= (type Heap@4) (MapType0Type RefType))) (= (type Heap@3) (MapType0Type RefType))) (= (type Heap@5) (MapType0Type RefType))) (= (type newPMask@0) (MapType1Type RefType boolType))) (= (type Heap@6) (MapType0Type RefType))) (= (type Heap@1) (MapType0Type RefType))) (= (type Heap@2) (MapType0Type RefType))) (= (type freshVersion@0) FrameTypeType)) (= (type Mask@4) (MapType1Type RefType realType))) (forall ((arg0@@61 T@U) ) (! (= (type (FrameFragment arg0@@61)) FrameTypeType)
 :qid |funType:FrameFragment|
 :pattern ( (FrameFragment arg0@@61))
))) (forall ((arg0@@62 T@U) (arg1@@33 T@U) ) (! (= (type (CombineFrames arg0@@62 arg1@@33)) FrameTypeType)
 :qid |funType:CombineFrames|
 :pattern ( (CombineFrames arg0@@62 arg1@@33))
))) (= (type QPMask@22) (MapType1Type RefType realType))) (= (type Mask@3) (MapType1Type RefType realType))) (= (type Mask@2) (MapType1Type RefType realType))) (= (type Mask@1) (MapType1Type RefType realType))) (forall ((arg0@@63 T@U) (arg1@@34 Int) ) (! (= (type (invRecv34 arg0@@63 arg1@@34)) RefType)
 :qid |funType:invRecv34|
 :pattern ( (invRecv34 arg0@@63 arg1@@34))
))) (= (type QPMask@19) (MapType1Type RefType realType))) (= (type QPMask@20) (MapType1Type RefType realType))) (forall ((arg0@@64 T@U) ) (! (= (type (invRecv35 arg0@@64)) RefType)
 :qid |funType:invRecv35|
 :pattern ( (invRecv35 arg0@@64))
))) (= (type QPMask@21) (MapType1Type RefType realType))) (forall ((arg0@@65 T@U) ) (! (= (type (invRecv36 arg0@@65)) RefType)
 :qid |funType:invRecv36|
 :pattern ( (invRecv36 arg0@@65))
))) (forall ((arg0@@66 T@U) (arg1@@35 Int) ) (! (= (type (invRecv37 arg0@@66 arg1@@35)) RefType)
 :qid |funType:invRecv37|
 :pattern ( (invRecv37 arg0@@66 arg1@@35))
))) (= (type QPMask@17) (MapType1Type RefType realType))) (forall ((arg0@@67 T@U) (arg1@@36 Int) ) (! (= (type (invRecv29 arg0@@67 arg1@@36)) RefType)
 :qid |funType:invRecv29|
 :pattern ( (invRecv29 arg0@@67 arg1@@36))
))) (= (type QPMask@16) (MapType1Type RefType realType))) (forall ((arg0@@68 T@U) ) (! (= (type (invRecv28 arg0@@68)) RefType)
 :qid |funType:invRecv28|
 :pattern ( (invRecv28 arg0@@68))
))) (= (type QPMask@15) (MapType1Type RefType realType))) (forall ((arg0@@69 T@U) ) (! (= (type (invRecv27 arg0@@69)) RefType)
 :qid |funType:invRecv27|
 :pattern ( (invRecv27 arg0@@69))
))) (= (type Mask@0) (MapType1Type RefType realType))) (forall ((arg0@@70 T@U) (arg1@@37 Int) ) (! (= (type (invRecv26 arg0@@70 arg1@@37)) RefType)
 :qid |funType:invRecv26|
 :pattern ( (invRecv26 arg0@@70 arg1@@37))
))) (= (type QPMask@12) (MapType1Type RefType realType))) (forall ((arg0@@71 T@U) (arg1@@38 Int) ) (! (= (type (invRecv24 arg0@@71 arg1@@38)) RefType)
 :qid |funType:invRecv24|
 :pattern ( (invRecv24 arg0@@71 arg1@@38))
))) (= (type QPMask@13) (MapType1Type RefType realType))) (= (type ExhaleHeap@1) (MapType0Type RefType))) (forall ((arg0@@72 T@U) (arg1@@39 Int) ) (! (= (type (invRecv25 arg0@@72 arg1@@39)) RefType)
 :qid |funType:invRecv25|
 :pattern ( (invRecv25 arg0@@72 arg1@@39))
))) (= (type QPMask@14) (MapType1Type RefType realType))) (forall ((arg0@@73 T@U) (arg1@@40 Int) ) (! (= (type (invRecv20 arg0@@73 arg1@@40)) RefType)
 :qid |funType:invRecv20|
 :pattern ( (invRecv20 arg0@@73 arg1@@40))
))) (= (type QPMask@9) (MapType1Type RefType realType))) (= (type QPMask@10) (MapType1Type RefType realType))) (forall ((arg0@@74 T@U) ) (! (= (type (invRecv21 arg0@@74)) RefType)
 :qid |funType:invRecv21|
 :pattern ( (invRecv21 arg0@@74))
))) (forall ((arg0@@75 T@U) (arg1@@41 Int) ) (! (= (type (invRecv22 arg0@@75 arg1@@41)) RefType)
 :qid |funType:invRecv22|
 :pattern ( (invRecv22 arg0@@75 arg1@@41))
))) (= (type QPMask@11) (MapType1Type RefType realType))) (forall ((arg0@@76 T@U) ) (! (= (type (invRecv23 arg0@@76)) RefType)
 :qid |funType:invRecv23|
 :pattern ( (invRecv23 arg0@@76))
))) (= (type r_7) RefType)) (= (type Mask@12) (MapType1Type RefType realType))) (= (type l) RefType)) (= (type r_58) RefType)) (= (type s@3) (MapType2Type RefType boolType))) (= (type Heap@10) (MapType0Type RefType))) (= (type r_60) RefType)) (= (type sNext@2) (MapType2Type RefType boolType))) (= (type r1_5) RefType)) (= (type r2_5) RefType)) (= (type Heap@9) (MapType0Type RefType))) (forall ((arg0@@77 T@U) (arg1@@42 Int) ) (! (= (type (invRecv16 arg0@@77 arg1@@42)) RefType)
 :qid |funType:invRecv16|
 :pattern ( (invRecv16 arg0@@77 arg1@@42))
))) (= (type QPMask@36) (MapType1Type RefType realType))) (= (type QPMask@37) (MapType1Type RefType realType))) (forall ((arg0@@78 T@U) ) (! (= (type (invRecv17 arg0@@78)) RefType)
 :qid |funType:invRecv17|
 :pattern ( (invRecv17 arg0@@78))
))) (forall ((arg0@@79 T@U) (arg1@@43 Int) ) (! (= (type (invRecv18 arg0@@79 arg1@@43)) RefType)
 :qid |funType:invRecv18|
 :pattern ( (invRecv18 arg0@@79 arg1@@43))
))) (= (type QPMask@38) (MapType1Type RefType realType))) (= (type QPMask@39) (MapType1Type RefType realType))) (forall ((arg0@@80 T@U) ) (! (= (type (invRecv19 arg0@@80)) RefType)
 :qid |funType:invRecv19|
 :pattern ( (invRecv19 arg0@@80))
))) (= (type Mask@9) (MapType1Type RefType realType))) (= (type Mask@8) (MapType1Type RefType realType))) (= (type Mask@10) (MapType1Type RefType realType))) (= (type Mask@11) (MapType1Type RefType realType))) (= (type Heap@8) (MapType0Type RefType))) (= (type newVersion@0) FrameTypeType)) (= (type QPMask@8) (MapType1Type RefType realType))) (forall ((arg0@@81 T@U) (arg1@@44 Int) ) (! (= (type (invRecv12 arg0@@81 arg1@@44)) RefType)
 :qid |funType:invRecv12|
 :pattern ( (invRecv12 arg0@@81 arg1@@44))
))) (= (type QPMask@5) (MapType1Type RefType realType))) (= (type QPMask@6) (MapType1Type RefType realType))) (forall ((arg0@@82 T@U) ) (! (= (type (invRecv13 arg0@@82)) RefType)
 :qid |funType:invRecv13|
 :pattern ( (invRecv13 arg0@@82))
))) (forall ((arg0@@83 T@U) (arg1@@45 Int) ) (! (= (type (invRecv14 arg0@@83 arg1@@45)) RefType)
 :qid |funType:invRecv14|
 :pattern ( (invRecv14 arg0@@83 arg1@@45))
))) (= (type QPMask@7) (MapType1Type RefType realType))) (forall ((arg0@@84 T@U) ) (! (= (type (invRecv15 arg0@@84)) RefType)
 :qid |funType:invRecv15|
 :pattern ( (invRecv15 arg0@@84))
))) (= (type QPMask@0) (MapType1Type RefType realType))) (forall ((arg0@@85 T@U) (arg1@@46 Int) ) (! (= (type (invRecv4 arg0@@85 arg1@@46)) RefType)
 :qid |funType:invRecv4|
 :pattern ( (invRecv4 arg0@@85 arg1@@46))
))) (= (type QPMask@1) (MapType1Type RefType realType))) (= (type QPMask@2) (MapType1Type RefType realType))) (forall ((arg0@@86 T@U) ) (! (= (type (invRecv5 arg0@@86)) RefType)
 :qid |funType:invRecv5|
 :pattern ( (invRecv5 arg0@@86))
))) (forall ((arg0@@87 T@U) (arg1@@47 Int) ) (! (= (type (invRecv6 arg0@@87 arg1@@47)) RefType)
 :qid |funType:invRecv6|
 :pattern ( (invRecv6 arg0@@87 arg1@@47))
))) (= (type QPMask@3) (MapType1Type RefType realType))) (forall ((arg0@@88 T@U) ) (! (= (type (invRecv7 arg0@@88)) RefType)
 :qid |funType:invRecv7|
 :pattern ( (invRecv7 arg0@@88))
))) (= (type r_3) RefType)) (= (type QPMask@44) (MapType1Type RefType realType))) (= (type PostHeap@0) (MapType0Type RefType))) (forall ((arg0@@89 T@U) (arg1@@48 Int) ) (! (= (type (invRecv2 arg0@@89 arg1@@48)) RefType)
 :qid |funType:invRecv2|
 :pattern ( (invRecv2 arg0@@89 arg1@@48))
))) (forall ((arg0@@90 T@U) (arg1@@49 Int) ) (! (= (type (invRecv1 arg0@@90 arg1@@49)) RefType)
 :qid |funType:invRecv1|
 :pattern ( (invRecv1 arg0@@90 arg1@@49))
))))
(set-info :boogie-vc-id m1)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 258) (let ((anon10_correct true))
(let ((anon164_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 250) 247)) anon10_correct)))
(let ((anon164_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 248) (- 0 249)) (<= FullPerm (U_2_real (MapType1Select QPMask@44 null (list r_3 length))))) (=> (<= FullPerm (U_2_real (MapType1Select QPMask@44 null (list r_3 length)))) (=> (= (ControlFlow 0 248) 247) anon10_correct))))))
(let ((anon11_correct true))
(let ((anon162_Then_correct  (=> (U_2_bool (MapType2Select lists r_3)) (and (and (=> (= (ControlFlow 0 251) 245) anon11_correct) (=> (= (ControlFlow 0 251) 248) anon164_Then_correct)) (=> (= (ControlFlow 0 251) 250) anon164_Else_correct)))))
(let ((anon162_Else_correct  (=> (and (not (U_2_bool (MapType2Select lists r_3))) (= (ControlFlow 0 246) 245)) anon11_correct)))
(let ((anon161_Else_correct true))
(let ((anon160_Else_correct  (and (=> (= (ControlFlow 0 252) (- 0 253)) (forall ((r_5 T@U) (r_5_1 T@U) ) (!  (=> (and (= (type r_5) RefType) (= (type r_5_1) RefType)) (=> (and (and (and (and (not (= r_5 r_5_1)) (U_2_bool (MapType2Select lists r_5))) (U_2_bool (MapType2Select lists r_5_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (or (not (= r_5 r_5_1)) (not (= length length)))))
 :qid |stdinbpl.862:17|
 :skolemid |99|
 :pattern ( (neverTriggered2 r_5) (neverTriggered2 r_5_1))
))) (=> (forall ((r_5@@0 T@U) (r_5_1@@0 T@U) ) (!  (=> (and (= (type r_5@@0) RefType) (= (type r_5_1@@0) RefType)) (=> (and (and (and (and (not (= r_5@@0 r_5_1@@0)) (U_2_bool (MapType2Select lists r_5@@0))) (U_2_bool (MapType2Select lists r_5_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (or (not (= r_5@@0 r_5_1@@0)) (not (= length length)))))
 :qid |stdinbpl.862:17|
 :skolemid |99|
 :pattern ( (neverTriggered2 r_5@@0) (neverTriggered2 r_5_1@@0))
)) (=> (forall ((r_5@@1 T@U) ) (!  (=> (= (type r_5@@1) RefType) (=> (and (U_2_bool (MapType2Select lists r_5@@1)) (< NoPerm FullPerm)) (and (= (invRecv2 r_5@@1 length) r_5@@1) (qpRange2 r_5@@1 length))))
 :qid |stdinbpl.868:22|
 :skolemid |100|
 :pattern ( (MapType0Select PostHeap@0 null (list r_5@@1 length)))
 :pattern ( (MapType1Select ZeroMask null (list r_5@@1 length)))
 :pattern ( (MapType2Select lists r_5@@1))
)) (=> (and (forall ((r_6_1 T@U) (i_1 Int) ) (!  (=> (= (type r_6_1) RefType) (=> (and (and (U_2_bool (MapType2Select lists (invRecv2 r_6_1 i_1))) (< NoPerm FullPerm)) (qpRange2 r_6_1 i_1)) (and (= (invRecv2 r_6_1 i_1) r_6_1) (= length i_1))))
 :qid |stdinbpl.872:22|
 :skolemid |101|
 :pattern ( (invRecv2 r_6_1 i_1))
)) (forall ((r_6_1@@0 T@U) (i_1@@0 Int) ) (!  (=> (= (type r_6_1@@0) RefType) (=> (and (and (U_2_bool (MapType2Select lists (invRecv2 r_6_1@@0 i_1@@0))) (< NoPerm FullPerm)) (qpRange2 r_6_1@@0 i_1@@0)) (and (=> (< NoPerm FullPerm) (and (= (invRecv2 r_6_1@@0 i_1@@0) r_6_1@@0) (= length i_1@@0))) (= (U_2_real (MapType1Select QPMask@44 null (list r_6_1@@0 i_1@@0))) (+ (U_2_real (MapType1Select ZeroMask null (list r_6_1@@0 i_1@@0))) FullPerm)))))
 :qid |stdinbpl.878:22|
 :skolemid |102|
 :pattern ( (MapType1Select QPMask@44 null (list r_6_1@@0 i_1@@0)))
))) (=> (and (and (forall ((o_4 T@U) (f_5 T@U) ) (! (let ((B@@11 (FieldTypeInv1 (type f_5))))
(let ((A@@12 (FieldTypeInv0 (type f_5))))
 (=> (and (and (= (type o_4) RefType) (= (type f_5) (FieldType A@@12 B@@11))) (or (or (not (= o_4 null)) (not (IsPredicateField f_5))) (not (= (getPredWandId f_5) 0)))) (= (U_2_real (MapType1Select ZeroMask o_4 f_5)) (U_2_real (MapType1Select QPMask@44 o_4 f_5))))))
 :qid |stdinbpl.884:29|
 :skolemid |103|
 :pattern ( (MapType1Select ZeroMask o_4 f_5))
 :pattern ( (MapType1Select QPMask@44 o_4 f_5))
)) (forall ((r_6_1@@1 T@U) (i_1@@1 Int) ) (!  (=> (and (= (type r_6_1@@1) RefType) (not (and (and (U_2_bool (MapType2Select lists (invRecv2 r_6_1@@1 i_1@@1))) (< NoPerm FullPerm)) (qpRange2 r_6_1@@1 i_1@@1)))) (= (U_2_real (MapType1Select QPMask@44 null (list r_6_1@@1 i_1@@1))) (U_2_real (MapType1Select ZeroMask null (list r_6_1@@1 i_1@@1)))))
 :qid |stdinbpl.888:22|
 :skolemid |104|
 :pattern ( (MapType1Select QPMask@44 null (list r_6_1@@1 i_1@@1)))
))) (and (state PostHeap@0 QPMask@44) (state PostHeap@0 QPMask@44))) (and (and (=> (= (ControlFlow 0 252) 244) anon161_Else_correct) (=> (= (ControlFlow 0 252) 251) anon162_Then_correct)) (=> (= (ControlFlow 0 252) 246) anon162_Else_correct)))))))))
(let ((anon160_Then_correct true))
(let ((anon159_Then_correct  (=> (state PostHeap@0 ZeroMask) (and (=> (= (ControlFlow 0 254) 243) anon160_Then_correct) (=> (= (ControlFlow 0 254) 252) anon160_Else_correct)))))
(let ((anon69_correct true))
(let ((anon193_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select lists r1_5)) (and (not (U_2_bool (MapType2Select s@3 r1_5))) (and (U_2_bool (MapType2Select lists r2_5)) (and (not (U_2_bool (MapType2Select s@3 r2_5))) (not (= r1_5 r2_5))))))) (= (ControlFlow 0 203) 200)) anon69_correct)))
(let ((anon193_Then_correct  (=> (and (U_2_bool (MapType2Select lists r1_5)) (and (not (U_2_bool (MapType2Select s@3 r1_5))) (and (U_2_bool (MapType2Select lists r2_5)) (and (not (U_2_bool (MapType2Select s@3 r2_5))) (not (= r1_5 r2_5)))))) (and (=> (= (ControlFlow 0 201) (- 0 202)) (not (= (MapType0Select Heap@10 r1_5 next) (MapType0Select Heap@10 r2_5 next)))) (=> (not (= (MapType0Select Heap@10 r1_5 next) (MapType0Select Heap@10 r2_5 next))) (=> (= (ControlFlow 0 201) 200) anon69_correct))))))
(let ((anon192_Else_correct true))
(let ((anon190_Else_correct  (=> (forall ((r_61_1 T@U) ) (!  (=> (= (type r_61_1) RefType) (=> (and (U_2_bool (MapType2Select lists r_61_1)) (not (U_2_bool (MapType2Select s@3 r_61_1)))) (U_2_bool (MapType2Select sNext@2 (MapType0Select Heap@10 r_61_1 next)))))
 :qid |stdinbpl.1811:24|
 :skolemid |217|
 :pattern ( (MapType2Select lists r_61_1))
 :pattern ( (MapType2Select s@3 r_61_1))
 :pattern ( (MapType2Select sNext@2 (MapType0Select Heap@10 r_61_1 next)))
)) (and (and (=> (= (ControlFlow 0 204) 199) anon192_Else_correct) (=> (= (ControlFlow 0 204) 201) anon193_Then_correct)) (=> (= (ControlFlow 0 204) 203) anon193_Else_correct)))))
(let ((anon65_correct true))
(let ((anon191_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select lists r_60)) (not (U_2_bool (MapType2Select s@3 r_60))))) (= (ControlFlow 0 198) 195)) anon65_correct)))
(let ((anon191_Then_correct  (=> (and (U_2_bool (MapType2Select lists r_60)) (not (U_2_bool (MapType2Select s@3 r_60)))) (and (=> (= (ControlFlow 0 196) (- 0 197)) (U_2_bool (MapType2Select sNext@2 (MapType0Select Heap@10 r_60 next)))) (=> (U_2_bool (MapType2Select sNext@2 (MapType0Select Heap@10 r_60 next))) (=> (= (ControlFlow 0 196) 195) anon65_correct))))))
(let ((anon188_Else_correct  (=> (forall ((r_59_1 T@U) ) (!  (=> (= (type r_59_1) RefType) (=> (and (U_2_bool (MapType2Select lists r_59_1)) (not (U_2_bool (MapType2Select s@3 r_59_1)))) (= (U_2_int (MapType0Select Heap@10 r_59_1 val)) v_2@@3)))
 :qid |stdinbpl.1800:24|
 :skolemid |216|
 :pattern ( (MapType2Select lists r_59_1))
 :pattern ( (MapType2Select s@3 r_59_1))
)) (and (and (=> (= (ControlFlow 0 205) 204) anon190_Else_correct) (=> (= (ControlFlow 0 205) 196) anon191_Then_correct)) (=> (= (ControlFlow 0 205) 198) anon191_Else_correct)))))
(let ((anon61_correct true))
(let ((anon189_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select lists r_58)) (not (U_2_bool (MapType2Select s@3 r_58))))) (= (ControlFlow 0 194) 191)) anon61_correct)))
(let ((anon189_Then_correct  (=> (and (U_2_bool (MapType2Select lists r_58)) (not (U_2_bool (MapType2Select s@3 r_58)))) (and (=> (= (ControlFlow 0 192) (- 0 193)) (= (U_2_int (MapType0Select Heap@10 r_58 val)) v_2@@3)) (=> (= (U_2_int (MapType0Select Heap@10 r_58 val)) v_2@@3) (=> (= (ControlFlow 0 192) 191) anon61_correct))))))
(let ((anon186_Else_correct  (=> (forall ((r_51 T@U) ) (!  (=> (= (type r_51) RefType) (=> (and (U_2_bool (MapType2Select lists r_51)) (not (U_2_bool (MapType2Select s@0 r_51)))) (not (= (MapType0Select Heap@9 r_51 next) (MapType0Select Heap@9 l next)))))
 :qid |stdinbpl.1594:28|
 :skolemid |189|
 :pattern ( (MapType2Select lists r_51))
 :pattern ( (MapType2Select s@0 r_51))
)) (=> (and (and (state Heap@9 Mask@12) (state Heap@9 Mask@12)) (and (= s@3 (|Set#Difference| s@0 (|Set#Singleton| l))) (state Heap@9 Mask@12))) (and (=> (= (ControlFlow 0 206) (- 0 216)) (HasDirectPerm Mask@12 l next)) (=> (HasDirectPerm Mask@12 l next) (=> (and (= sNext@2 (|Set#Union| sNext@1 (|Set#Singleton| (MapType0Select Heap@9 l next)))) (state Heap@9 Mask@12)) (and (=> (= (ControlFlow 0 206) (- 0 215)) (= FullPerm (U_2_real (MapType1Select Mask@12 l val)))) (=> (= FullPerm (U_2_real (MapType1Select Mask@12 l val))) (=> (and (= Heap@10 (MapType0Store Heap@9 l val (int_2_U v_2@@3))) (state Heap@10 Mask@12)) (and (=> (= (ControlFlow 0 206) (- 0 214)) (forall ((r_52 T@U) (r_52_1 T@U) ) (!  (=> (and (= (type r_52) RefType) (= (type r_52_1) RefType)) (=> (and (and (and (and (not (= r_52 r_52_1)) (U_2_bool (MapType2Select s@3 r_52))) (U_2_bool (MapType2Select s@3 r_52_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (or (not (= r_52 r_52_1)) (not (= length length)))))
 :qid |stdinbpl.1628:21|
 :skolemid |190|
 :pattern ( (neverTriggered16 r_52) (neverTriggered16 r_52_1))
))) (=> (forall ((r_52@@0 T@U) (r_52_1@@0 T@U) ) (!  (=> (and (= (type r_52@@0) RefType) (= (type r_52_1@@0) RefType)) (=> (and (and (and (and (not (= r_52@@0 r_52_1@@0)) (U_2_bool (MapType2Select s@3 r_52@@0))) (U_2_bool (MapType2Select s@3 r_52_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (or (not (= r_52@@0 r_52_1@@0)) (not (= length length)))))
 :qid |stdinbpl.1628:21|
 :skolemid |190|
 :pattern ( (neverTriggered16 r_52@@0) (neverTriggered16 r_52_1@@0))
)) (and (=> (= (ControlFlow 0 206) (- 0 213)) (forall ((r_52@@1 T@U) ) (!  (=> (and (= (type r_52@@1) RefType) (U_2_bool (MapType2Select s@3 r_52@@1))) (>= (U_2_real (MapType1Select Mask@12 null (list r_52@@1 length))) FullPerm))
 :qid |stdinbpl.1635:21|
 :skolemid |191|
 :pattern ( (MapType0Select Heap@10 null (list r_52@@1 length)))
 :pattern ( (MapType1Select Mask@12 null (list r_52@@1 length)))
 :pattern ( (MapType2Select s@3 r_52@@1))
))) (=> (forall ((r_52@@2 T@U) ) (!  (=> (and (= (type r_52@@2) RefType) (U_2_bool (MapType2Select s@3 r_52@@2))) (>= (U_2_real (MapType1Select Mask@12 null (list r_52@@2 length))) FullPerm))
 :qid |stdinbpl.1635:21|
 :skolemid |191|
 :pattern ( (MapType0Select Heap@10 null (list r_52@@2 length)))
 :pattern ( (MapType1Select Mask@12 null (list r_52@@2 length)))
 :pattern ( (MapType2Select s@3 r_52@@2))
)) (=> (forall ((r_52@@3 T@U) ) (!  (=> (= (type r_52@@3) RefType) (=> (and (U_2_bool (MapType2Select s@3 r_52@@3)) (< NoPerm FullPerm)) (and (= (invRecv16 r_52@@3 length) r_52@@3) (qpRange16 r_52@@3 length))))
 :qid |stdinbpl.1641:26|
 :skolemid |192|
 :pattern ( (MapType0Select Heap@10 null (list r_52@@3 length)))
 :pattern ( (MapType1Select Mask@12 null (list r_52@@3 length)))
 :pattern ( (MapType2Select s@3 r_52@@3))
)) (=> (and (and (forall ((r_53_1 T@U) (i_9 Int) ) (!  (=> (= (type r_53_1) RefType) (=> (and (and (U_2_bool (MapType2Select s@3 (invRecv16 r_53_1 i_9))) (< NoPerm FullPerm)) (qpRange16 r_53_1 i_9)) (and (= (invRecv16 r_53_1 i_9) r_53_1) (= length i_9))))
 :qid |stdinbpl.1645:26|
 :skolemid |193|
 :pattern ( (invRecv16 r_53_1 i_9))
)) (forall ((r_53_1@@0 T@U) (i_9@@0 Int) ) (!  (=> (= (type r_53_1@@0) RefType) (=> (and (and (U_2_bool (MapType2Select s@3 (invRecv16 r_53_1@@0 i_9@@0))) (< NoPerm FullPerm)) (qpRange16 r_53_1@@0 i_9@@0)) (and (and (= (invRecv16 r_53_1@@0 i_9@@0) r_53_1@@0) (= length i_9@@0)) (= (U_2_real (MapType1Select QPMask@36 null (list r_53_1@@0 i_9@@0))) (- (U_2_real (MapType1Select Mask@12 null (list r_53_1@@0 i_9@@0))) FullPerm)))))
 :qid |stdinbpl.1651:26|
 :skolemid |194|
 :pattern ( (MapType1Select QPMask@36 null (list r_53_1@@0 i_9@@0)))
))) (and (forall ((r_53_1@@1 T@U) (i_9@@1 Int) ) (!  (=> (and (= (type r_53_1@@1) RefType) (not (and (and (U_2_bool (MapType2Select s@3 (invRecv16 r_53_1@@1 i_9@@1))) (< NoPerm FullPerm)) (qpRange16 r_53_1@@1 i_9@@1)))) (= (U_2_real (MapType1Select QPMask@36 null (list r_53_1@@1 i_9@@1))) (U_2_real (MapType1Select Mask@12 null (list r_53_1@@1 i_9@@1)))))
 :qid |stdinbpl.1655:26|
 :skolemid |195|
 :pattern ( (MapType1Select QPMask@36 null (list r_53_1@@1 i_9@@1)))
)) (forall ((o_4@@0 T@U) (f_5@@0 T@U) ) (! (let ((B@@12 (FieldTypeInv1 (type f_5@@0))))
(let ((A@@13 (FieldTypeInv0 (type f_5@@0))))
 (=> (and (and (= (type o_4@@0) RefType) (= (type f_5@@0) (FieldType A@@13 B@@12))) (or (or (not (= o_4@@0 null)) (not (IsPredicateField f_5@@0))) (not (= (getPredWandId f_5@@0) 0)))) (= (U_2_real (MapType1Select Mask@12 o_4@@0 f_5@@0)) (U_2_real (MapType1Select QPMask@36 o_4@@0 f_5@@0))))))
 :qid |stdinbpl.1661:33|
 :skolemid |196|
 :pattern ( (MapType1Select Mask@12 o_4@@0 f_5@@0))
 :pattern ( (MapType1Select QPMask@36 o_4@@0 f_5@@0))
)))) (and (=> (= (ControlFlow 0 206) (- 0 212)) (forall ((r_54 T@U) (r_54_1 T@U) ) (!  (=> (and (= (type r_54) RefType) (= (type r_54_1) RefType)) (=> (and (and (and (and (not (= r_54 r_54_1)) (and (U_2_bool (MapType2Select lists r_54)) (not (U_2_bool (MapType2Select s@3 r_54))))) (and (U_2_bool (MapType2Select lists r_54_1)) (not (U_2_bool (MapType2Select s@3 r_54_1))))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= r_54 r_54_1))))
 :qid |stdinbpl.1673:21|
 :skolemid |197|
 :pattern ( (neverTriggered17 r_54) (neverTriggered17 r_54_1))
))) (=> (forall ((r_54@@0 T@U) (r_54_1@@0 T@U) ) (!  (=> (and (= (type r_54@@0) RefType) (= (type r_54_1@@0) RefType)) (=> (and (and (and (and (not (= r_54@@0 r_54_1@@0)) (and (U_2_bool (MapType2Select lists r_54@@0)) (not (U_2_bool (MapType2Select s@3 r_54@@0))))) (and (U_2_bool (MapType2Select lists r_54_1@@0)) (not (U_2_bool (MapType2Select s@3 r_54_1@@0))))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= r_54@@0 r_54_1@@0))))
 :qid |stdinbpl.1673:21|
 :skolemid |197|
 :pattern ( (neverTriggered17 r_54@@0) (neverTriggered17 r_54_1@@0))
)) (and (=> (= (ControlFlow 0 206) (- 0 211)) (forall ((r_54@@1 T@U) ) (!  (=> (= (type r_54@@1) RefType) (=> (and (U_2_bool (MapType2Select lists r_54@@1)) (not (U_2_bool (MapType2Select s@3 r_54@@1)))) (>= (U_2_real (MapType1Select QPMask@36 r_54@@1 next)) FullPerm)))
 :qid |stdinbpl.1680:21|
 :skolemid |198|
 :pattern ( (MapType0Select Heap@10 r_54@@1 next))
 :pattern ( (MapType1Select QPMask@37 r_54@@1 next))
 :pattern ( (MapType2Select lists r_54@@1))
 :pattern ( (MapType2Select s@3 r_54@@1))
))) (=> (forall ((r_54@@2 T@U) ) (!  (=> (= (type r_54@@2) RefType) (=> (and (U_2_bool (MapType2Select lists r_54@@2)) (not (U_2_bool (MapType2Select s@3 r_54@@2)))) (>= (U_2_real (MapType1Select QPMask@36 r_54@@2 next)) FullPerm)))
 :qid |stdinbpl.1680:21|
 :skolemid |198|
 :pattern ( (MapType0Select Heap@10 r_54@@2 next))
 :pattern ( (MapType1Select QPMask@37 r_54@@2 next))
 :pattern ( (MapType2Select lists r_54@@2))
 :pattern ( (MapType2Select s@3 r_54@@2))
)) (=> (and (and (forall ((r_54@@3 T@U) ) (!  (=> (= (type r_54@@3) RefType) (=> (and (and (U_2_bool (MapType2Select lists r_54@@3)) (not (U_2_bool (MapType2Select s@3 r_54@@3)))) (< NoPerm FullPerm)) (and (qpRange17 r_54@@3) (= (invRecv17 r_54@@3) r_54@@3))))
 :qid |stdinbpl.1686:26|
 :skolemid |199|
 :pattern ( (MapType0Select Heap@10 r_54@@3 next))
 :pattern ( (MapType1Select QPMask@37 r_54@@3 next))
 :pattern ( (MapType2Select lists r_54@@3))
 :pattern ( (MapType2Select s@3 r_54@@3))
)) (forall ((o_4@@1 T@U) ) (!  (=> (= (type o_4@@1) RefType) (=> (and (and (U_2_bool (MapType2Select lists (invRecv17 o_4@@1))) (not (U_2_bool (MapType2Select s@3 (invRecv17 o_4@@1))))) (and (< NoPerm FullPerm) (qpRange17 o_4@@1))) (= (invRecv17 o_4@@1) o_4@@1)))
 :qid |stdinbpl.1690:26|
 :skolemid |200|
 :pattern ( (invRecv17 o_4@@1))
))) (and (forall ((o_4@@2 T@U) ) (!  (=> (= (type o_4@@2) RefType) (and (=> (and (and (U_2_bool (MapType2Select lists (invRecv17 o_4@@2))) (not (U_2_bool (MapType2Select s@3 (invRecv17 o_4@@2))))) (and (< NoPerm FullPerm) (qpRange17 o_4@@2))) (and (= (invRecv17 o_4@@2) o_4@@2) (= (U_2_real (MapType1Select QPMask@37 o_4@@2 next)) (- (U_2_real (MapType1Select QPMask@36 o_4@@2 next)) FullPerm)))) (=> (not (and (and (U_2_bool (MapType2Select lists (invRecv17 o_4@@2))) (not (U_2_bool (MapType2Select s@3 (invRecv17 o_4@@2))))) (and (< NoPerm FullPerm) (qpRange17 o_4@@2)))) (= (U_2_real (MapType1Select QPMask@37 o_4@@2 next)) (U_2_real (MapType1Select QPMask@36 o_4@@2 next))))))
 :qid |stdinbpl.1696:26|
 :skolemid |201|
 :pattern ( (MapType1Select QPMask@37 o_4@@2 next))
)) (forall ((o_4@@3 T@U) (f_5@@1 T@U) ) (! (let ((B@@13 (FieldTypeInv1 (type f_5@@1))))
(let ((A@@14 (FieldTypeInv0 (type f_5@@1))))
 (=> (and (and (= (type o_4@@3) RefType) (= (type f_5@@1) (FieldType A@@14 B@@13))) (not (= f_5@@1 next))) (= (U_2_real (MapType1Select QPMask@36 o_4@@3 f_5@@1)) (U_2_real (MapType1Select QPMask@37 o_4@@3 f_5@@1))))))
 :qid |stdinbpl.1702:33|
 :skolemid |202|
 :pattern ( (MapType1Select QPMask@37 o_4@@3 f_5@@1))
)))) (and (=> (= (ControlFlow 0 206) (- 0 210)) (forall ((r_55 T@U) (r_55_1 T@U) ) (!  (=> (and (= (type r_55) RefType) (= (type r_55_1) RefType)) (=> (and (and (and (and (not (= r_55 r_55_1)) (U_2_bool (MapType2Select sNext@2 r_55))) (U_2_bool (MapType2Select sNext@2 r_55_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (or (not (= r_55 r_55_1)) (not (= (- length 1) (- length 1))))))
 :qid |stdinbpl.1714:21|
 :skolemid |203|
 :pattern ( (neverTriggered18 r_55) (neverTriggered18 r_55_1))
))) (=> (forall ((r_55@@0 T@U) (r_55_1@@0 T@U) ) (!  (=> (and (= (type r_55@@0) RefType) (= (type r_55_1@@0) RefType)) (=> (and (and (and (and (not (= r_55@@0 r_55_1@@0)) (U_2_bool (MapType2Select sNext@2 r_55@@0))) (U_2_bool (MapType2Select sNext@2 r_55_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (or (not (= r_55@@0 r_55_1@@0)) (not (= (- length 1) (- length 1))))))
 :qid |stdinbpl.1714:21|
 :skolemid |203|
 :pattern ( (neverTriggered18 r_55@@0) (neverTriggered18 r_55_1@@0))
)) (and (=> (= (ControlFlow 0 206) (- 0 209)) (forall ((r_55@@1 T@U) ) (!  (=> (and (= (type r_55@@1) RefType) (U_2_bool (MapType2Select sNext@2 r_55@@1))) (>= (U_2_real (MapType1Select QPMask@37 null (list r_55@@1 (- length 1)))) FullPerm))
 :qid |stdinbpl.1721:21|
 :skolemid |204|
 :pattern ( (MapType2Select sNext@2 r_55@@1))
))) (=> (forall ((r_55@@2 T@U) ) (!  (=> (and (= (type r_55@@2) RefType) (U_2_bool (MapType2Select sNext@2 r_55@@2))) (>= (U_2_real (MapType1Select QPMask@37 null (list r_55@@2 (- length 1)))) FullPerm))
 :qid |stdinbpl.1721:21|
 :skolemid |204|
 :pattern ( (MapType2Select sNext@2 r_55@@2))
)) (=> (forall ((r_55@@3 T@U) ) (!  (=> (= (type r_55@@3) RefType) (=> (and (U_2_bool (MapType2Select sNext@2 r_55@@3)) (< NoPerm FullPerm)) (and (= (invRecv18 r_55@@3 (- length 1)) r_55@@3) (qpRange18 r_55@@3 (- length 1)))))
 :qid |stdinbpl.1727:26|
 :skolemid |205|
 :pattern ( (MapType2Select sNext@2 r_55@@3))
)) (=> (and (and (forall ((r_56_1 T@U) (i_10 Int) ) (!  (=> (= (type r_56_1) RefType) (=> (and (and (U_2_bool (MapType2Select sNext@2 (invRecv18 r_56_1 i_10))) (< NoPerm FullPerm)) (qpRange18 r_56_1 i_10)) (and (= (invRecv18 r_56_1 i_10) r_56_1) (= (- length 1) i_10))))
 :qid |stdinbpl.1731:26|
 :skolemid |206|
 :pattern ( (invRecv18 r_56_1 i_10))
)) (forall ((r_56_1@@0 T@U) (i_10@@0 Int) ) (!  (=> (= (type r_56_1@@0) RefType) (=> (and (and (U_2_bool (MapType2Select sNext@2 (invRecv18 r_56_1@@0 i_10@@0))) (< NoPerm FullPerm)) (qpRange18 r_56_1@@0 i_10@@0)) (and (and (= (invRecv18 r_56_1@@0 i_10@@0) r_56_1@@0) (= (- length 1) i_10@@0)) (= (U_2_real (MapType1Select QPMask@38 null (list r_56_1@@0 i_10@@0))) (- (U_2_real (MapType1Select QPMask@37 null (list r_56_1@@0 i_10@@0))) FullPerm)))))
 :qid |stdinbpl.1737:26|
 :skolemid |207|
 :pattern ( (MapType1Select QPMask@38 null (list r_56_1@@0 i_10@@0)))
))) (and (forall ((r_56_1@@1 T@U) (i_10@@1 Int) ) (!  (=> (and (= (type r_56_1@@1) RefType) (not (and (and (U_2_bool (MapType2Select sNext@2 (invRecv18 r_56_1@@1 i_10@@1))) (< NoPerm FullPerm)) (qpRange18 r_56_1@@1 i_10@@1)))) (= (U_2_real (MapType1Select QPMask@38 null (list r_56_1@@1 i_10@@1))) (U_2_real (MapType1Select QPMask@37 null (list r_56_1@@1 i_10@@1)))))
 :qid |stdinbpl.1741:26|
 :skolemid |208|
 :pattern ( (MapType1Select QPMask@38 null (list r_56_1@@1 i_10@@1)))
)) (forall ((o_4@@4 T@U) (f_5@@2 T@U) ) (! (let ((B@@14 (FieldTypeInv1 (type f_5@@2))))
(let ((A@@15 (FieldTypeInv0 (type f_5@@2))))
 (=> (and (and (= (type o_4@@4) RefType) (= (type f_5@@2) (FieldType A@@15 B@@14))) (or (or (not (= o_4@@4 null)) (not (IsPredicateField f_5@@2))) (not (= (getPredWandId f_5@@2) 0)))) (= (U_2_real (MapType1Select QPMask@37 o_4@@4 f_5@@2)) (U_2_real (MapType1Select QPMask@38 o_4@@4 f_5@@2))))))
 :qid |stdinbpl.1747:33|
 :skolemid |209|
 :pattern ( (MapType1Select QPMask@37 o_4@@4 f_5@@2))
 :pattern ( (MapType1Select QPMask@38 o_4@@4 f_5@@2))
)))) (and (=> (= (ControlFlow 0 206) (- 0 208)) (forall ((r_57 T@U) (r_57_1 T@U) ) (!  (=> (and (= (type r_57) RefType) (= (type r_57_1) RefType)) (=> (and (and (and (and (not (= r_57 r_57_1)) (and (U_2_bool (MapType2Select lists r_57)) (not (U_2_bool (MapType2Select s@3 r_57))))) (and (U_2_bool (MapType2Select lists r_57_1)) (not (U_2_bool (MapType2Select s@3 r_57_1))))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= r_57 r_57_1))))
 :qid |stdinbpl.1759:21|
 :skolemid |210|
 :pattern ( (neverTriggered19 r_57) (neverTriggered19 r_57_1))
))) (=> (forall ((r_57@@0 T@U) (r_57_1@@0 T@U) ) (!  (=> (and (= (type r_57@@0) RefType) (= (type r_57_1@@0) RefType)) (=> (and (and (and (and (not (= r_57@@0 r_57_1@@0)) (and (U_2_bool (MapType2Select lists r_57@@0)) (not (U_2_bool (MapType2Select s@3 r_57@@0))))) (and (U_2_bool (MapType2Select lists r_57_1@@0)) (not (U_2_bool (MapType2Select s@3 r_57_1@@0))))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= r_57@@0 r_57_1@@0))))
 :qid |stdinbpl.1759:21|
 :skolemid |210|
 :pattern ( (neverTriggered19 r_57@@0) (neverTriggered19 r_57_1@@0))
)) (and (=> (= (ControlFlow 0 206) (- 0 207)) (forall ((r_57@@1 T@U) ) (!  (=> (= (type r_57@@1) RefType) (=> (and (U_2_bool (MapType2Select lists r_57@@1)) (not (U_2_bool (MapType2Select s@3 r_57@@1)))) (>= (U_2_real (MapType1Select QPMask@38 r_57@@1 val)) FullPerm)))
 :qid |stdinbpl.1766:21|
 :skolemid |211|
 :pattern ( (MapType0Select Heap@10 r_57@@1 val))
 :pattern ( (MapType1Select QPMask@39 r_57@@1 val))
 :pattern ( (MapType2Select lists r_57@@1))
 :pattern ( (MapType2Select s@3 r_57@@1))
))) (=> (forall ((r_57@@2 T@U) ) (!  (=> (= (type r_57@@2) RefType) (=> (and (U_2_bool (MapType2Select lists r_57@@2)) (not (U_2_bool (MapType2Select s@3 r_57@@2)))) (>= (U_2_real (MapType1Select QPMask@38 r_57@@2 val)) FullPerm)))
 :qid |stdinbpl.1766:21|
 :skolemid |211|
 :pattern ( (MapType0Select Heap@10 r_57@@2 val))
 :pattern ( (MapType1Select QPMask@39 r_57@@2 val))
 :pattern ( (MapType2Select lists r_57@@2))
 :pattern ( (MapType2Select s@3 r_57@@2))
)) (=> (and (and (forall ((r_57@@3 T@U) ) (!  (=> (= (type r_57@@3) RefType) (=> (and (and (U_2_bool (MapType2Select lists r_57@@3)) (not (U_2_bool (MapType2Select s@3 r_57@@3)))) (< NoPerm FullPerm)) (and (qpRange19 r_57@@3) (= (invRecv19 r_57@@3) r_57@@3))))
 :qid |stdinbpl.1772:26|
 :skolemid |212|
 :pattern ( (MapType0Select Heap@10 r_57@@3 val))
 :pattern ( (MapType1Select QPMask@39 r_57@@3 val))
 :pattern ( (MapType2Select lists r_57@@3))
 :pattern ( (MapType2Select s@3 r_57@@3))
)) (forall ((o_4@@5 T@U) ) (!  (=> (= (type o_4@@5) RefType) (=> (and (and (U_2_bool (MapType2Select lists (invRecv19 o_4@@5))) (not (U_2_bool (MapType2Select s@3 (invRecv19 o_4@@5))))) (and (< NoPerm FullPerm) (qpRange19 o_4@@5))) (= (invRecv19 o_4@@5) o_4@@5)))
 :qid |stdinbpl.1776:26|
 :skolemid |213|
 :pattern ( (invRecv19 o_4@@5))
))) (and (forall ((o_4@@6 T@U) ) (!  (=> (= (type o_4@@6) RefType) (and (=> (and (and (U_2_bool (MapType2Select lists (invRecv19 o_4@@6))) (not (U_2_bool (MapType2Select s@3 (invRecv19 o_4@@6))))) (and (< NoPerm FullPerm) (qpRange19 o_4@@6))) (and (= (invRecv19 o_4@@6) o_4@@6) (= (U_2_real (MapType1Select QPMask@39 o_4@@6 val)) (- (U_2_real (MapType1Select QPMask@38 o_4@@6 val)) FullPerm)))) (=> (not (and (and (U_2_bool (MapType2Select lists (invRecv19 o_4@@6))) (not (U_2_bool (MapType2Select s@3 (invRecv19 o_4@@6))))) (and (< NoPerm FullPerm) (qpRange19 o_4@@6)))) (= (U_2_real (MapType1Select QPMask@39 o_4@@6 val)) (U_2_real (MapType1Select QPMask@38 o_4@@6 val))))))
 :qid |stdinbpl.1782:26|
 :skolemid |214|
 :pattern ( (MapType1Select QPMask@39 o_4@@6 val))
)) (forall ((o_4@@7 T@U) (f_5@@3 T@U) ) (! (let ((B@@15 (FieldTypeInv1 (type f_5@@3))))
(let ((A@@16 (FieldTypeInv0 (type f_5@@3))))
 (=> (and (and (= (type o_4@@7) RefType) (= (type f_5@@3) (FieldType A@@16 B@@15))) (not (= f_5@@3 val))) (= (U_2_real (MapType1Select QPMask@38 o_4@@7 f_5@@3)) (U_2_real (MapType1Select QPMask@39 o_4@@7 f_5@@3))))))
 :qid |stdinbpl.1788:33|
 :skolemid |215|
 :pattern ( (MapType1Select QPMask@39 o_4@@7 f_5@@3))
)))) (and (and (=> (= (ControlFlow 0 206) 205) anon188_Else_correct) (=> (= (ControlFlow 0 206) 192) anon189_Then_correct)) (=> (= (ControlFlow 0 206) 194) anon189_Else_correct))))))))))))))))))))))))))))))))))
(let ((anon57_correct true))
(let ((anon187_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select lists r_7)) (not (U_2_bool (MapType2Select s@0 r_7))))) (= (ControlFlow 0 190) 186)) anon57_correct)))
(let ((anon187_Then_correct  (=> (and (U_2_bool (MapType2Select lists r_7)) (not (U_2_bool (MapType2Select s@0 r_7)))) (and (=> (= (ControlFlow 0 187) (- 0 189)) (HasDirectPerm Mask@12 r_7 next)) (=> (HasDirectPerm Mask@12 r_7 next) (and (=> (= (ControlFlow 0 187) (- 0 188)) (HasDirectPerm Mask@12 l next)) (=> (HasDirectPerm Mask@12 l next) (=> (= (ControlFlow 0 187) 186) anon57_correct))))))))
(let ((anon54_correct  (=> (and (state Heap@9 Mask@12) (state Heap@9 Mask@12)) (and (and (=> (= (ControlFlow 0 217) 206) anon186_Else_correct) (=> (= (ControlFlow 0 217) 187) anon187_Then_correct)) (=> (= (ControlFlow 0 217) 190) anon187_Else_correct)))))
(let ((anon185_Else_correct  (=> (>= 0 length) (=> (and (= Mask@12 Mask@8) (= (ControlFlow 0 219) 217)) anon54_correct))))
(let ((anon185_Then_correct  (=> (and (and (> length 0) (not (= l null))) (and (= Mask@9 (MapType1Store Mask@8 l val (real_2_U (+ (U_2_real (MapType1Select Mask@8 l val)) FullPerm)))) (state Heap@9 Mask@9))) (=> (and (and (and (not (= l null)) (= Mask@10 (MapType1Store Mask@9 l next (real_2_U (+ (U_2_real (MapType1Select Mask@9 l next)) FullPerm))))) (and (state Heap@9 Mask@10) (= Mask@11 (MapType1Store Mask@10 null (list (MapType0Select Heap@9 l next) (- length 1)) (real_2_U (+ (U_2_real (MapType1Select Mask@10 null (list (MapType0Select Heap@9 l next) (- length 1)))) FullPerm)))))) (and (and (InsidePredicate (list l length) (MapType0Select Heap@9 null (list l length)) (list (MapType0Select Heap@9 l next) (- length 1)) (MapType0Select Heap@9 null (list (MapType0Select Heap@9 l next) (- length 1)))) (state Heap@9 Mask@11)) (and (= Mask@12 Mask@11) (= (ControlFlow 0 218) 217)))) anon54_correct))))
(let ((anon184_Else_correct  (=> (and (HasDirectPerm Mask@8 null (list l length)) (= Heap@9 ExhaleHeap@0)) (and (=> (= (ControlFlow 0 221) 218) anon185_Then_correct) (=> (= (ControlFlow 0 221) 219) anon185_Else_correct)))))
(let ((anon184_Then_correct  (=> (not (HasDirectPerm Mask@8 null (list l length))) (=> (and (= Heap@8 (MapType0Store ExhaleHeap@0 null (list l length) newVersion@0)) (= Heap@9 Heap@8)) (and (=> (= (ControlFlow 0 220) 218) anon185_Then_correct) (=> (= (ControlFlow 0 220) 219) anon185_Else_correct))))))
(let ((anon50_correct  (=> (= Mask@8 (MapType1Store QPMask@8 null (list l length) (real_2_U (- (U_2_real (MapType1Select QPMask@8 null (list l length))) FullPerm)))) (and (=> (= (ControlFlow 0 222) 220) anon184_Then_correct) (=> (= (ControlFlow 0 222) 221) anon184_Else_correct)))))
(let ((anon183_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 225) 222)) anon50_correct)))
(let ((anon183_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 223) (- 0 224)) (<= FullPerm (U_2_real (MapType1Select QPMask@8 null (list l length))))) (=> (<= FullPerm (U_2_real (MapType1Select QPMask@8 null (list l length)))) (=> (= (ControlFlow 0 223) 222) anon50_correct))))))
(let ((anon182_Then_correct  (=> (state ExhaleHeap@0 ZeroMask) (and (=> (= (ControlFlow 0 226) (- 0 230)) (forall ((r_40 T@U) (r_40_1 T@U) ) (!  (=> (and (= (type r_40) RefType) (= (type r_40_1) RefType)) (=> (and (and (and (and (not (= r_40 r_40_1)) (U_2_bool (MapType2Select s@0 r_40))) (U_2_bool (MapType2Select s@0 r_40_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (or (not (= r_40 r_40_1)) (not (= length length)))))
 :qid |stdinbpl.1380:21|
 :skolemid |162|
 :pattern ( (neverTriggered12 r_40) (neverTriggered12 r_40_1))
))) (=> (forall ((r_40@@0 T@U) (r_40_1@@0 T@U) ) (!  (=> (and (= (type r_40@@0) RefType) (= (type r_40_1@@0) RefType)) (=> (and (and (and (and (not (= r_40@@0 r_40_1@@0)) (U_2_bool (MapType2Select s@0 r_40@@0))) (U_2_bool (MapType2Select s@0 r_40_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (or (not (= r_40@@0 r_40_1@@0)) (not (= length length)))))
 :qid |stdinbpl.1380:21|
 :skolemid |162|
 :pattern ( (neverTriggered12 r_40@@0) (neverTriggered12 r_40_1@@0))
)) (=> (and (forall ((r_40@@1 T@U) ) (!  (=> (= (type r_40@@1) RefType) (=> (and (U_2_bool (MapType2Select s@0 r_40@@1)) (< NoPerm FullPerm)) (and (= (invRecv12 r_40@@1 length) r_40@@1) (qpRange12 r_40@@1 length))))
 :qid |stdinbpl.1386:26|
 :skolemid |163|
 :pattern ( (MapType0Select ExhaleHeap@0 null (list r_40@@1 length)))
 :pattern ( (MapType1Select ZeroMask null (list r_40@@1 length)))
 :pattern ( (MapType2Select s@0 r_40@@1))
)) (forall ((r_41_1 T@U) (i_7 Int) ) (!  (=> (= (type r_41_1) RefType) (=> (and (and (U_2_bool (MapType2Select s@0 (invRecv12 r_41_1 i_7))) (< NoPerm FullPerm)) (qpRange12 r_41_1 i_7)) (and (= (invRecv12 r_41_1 i_7) r_41_1) (= length i_7))))
 :qid |stdinbpl.1390:26|
 :skolemid |164|
 :pattern ( (invRecv12 r_41_1 i_7))
))) (=> (and (and (forall ((r_41_1@@0 T@U) (i_7@@0 Int) ) (!  (=> (= (type r_41_1@@0) RefType) (=> (and (and (U_2_bool (MapType2Select s@0 (invRecv12 r_41_1@@0 i_7@@0))) (< NoPerm FullPerm)) (qpRange12 r_41_1@@0 i_7@@0)) (and (=> (< NoPerm FullPerm) (and (= (invRecv12 r_41_1@@0 i_7@@0) r_41_1@@0) (= length i_7@@0))) (= (U_2_real (MapType1Select QPMask@5 null (list r_41_1@@0 i_7@@0))) (+ (U_2_real (MapType1Select ZeroMask null (list r_41_1@@0 i_7@@0))) FullPerm)))))
 :qid |stdinbpl.1396:26|
 :skolemid |165|
 :pattern ( (MapType1Select QPMask@5 null (list r_41_1@@0 i_7@@0)))
)) (forall ((o_4@@8 T@U) (f_5@@4 T@U) ) (! (let ((B@@16 (FieldTypeInv1 (type f_5@@4))))
(let ((A@@17 (FieldTypeInv0 (type f_5@@4))))
 (=> (and (and (= (type o_4@@8) RefType) (= (type f_5@@4) (FieldType A@@17 B@@16))) (or (or (not (= o_4@@8 null)) (not (IsPredicateField f_5@@4))) (not (= (getPredWandId f_5@@4) 0)))) (= (U_2_real (MapType1Select ZeroMask o_4@@8 f_5@@4)) (U_2_real (MapType1Select QPMask@5 o_4@@8 f_5@@4))))))
 :qid |stdinbpl.1402:33|
 :skolemid |166|
 :pattern ( (MapType1Select ZeroMask o_4@@8 f_5@@4))
 :pattern ( (MapType1Select QPMask@5 o_4@@8 f_5@@4))
))) (and (forall ((r_41_1@@1 T@U) (i_7@@1 Int) ) (!  (=> (and (= (type r_41_1@@1) RefType) (not (and (and (U_2_bool (MapType2Select s@0 (invRecv12 r_41_1@@1 i_7@@1))) (< NoPerm FullPerm)) (qpRange12 r_41_1@@1 i_7@@1)))) (= (U_2_real (MapType1Select QPMask@5 null (list r_41_1@@1 i_7@@1))) (U_2_real (MapType1Select ZeroMask null (list r_41_1@@1 i_7@@1)))))
 :qid |stdinbpl.1406:26|
 :skolemid |167|
 :pattern ( (MapType1Select QPMask@5 null (list r_41_1@@1 i_7@@1)))
)) (state ExhaleHeap@0 QPMask@5))) (and (=> (= (ControlFlow 0 226) (- 0 229)) (forall ((r_43 T@U) (r_43_1 T@U) ) (!  (=> (and (= (type r_43) RefType) (= (type r_43_1) RefType)) (=> (and (and (and (and (not (= r_43 r_43_1)) (and (U_2_bool (MapType2Select lists r_43)) (not (U_2_bool (MapType2Select s@0 r_43))))) (and (U_2_bool (MapType2Select lists r_43_1)) (not (U_2_bool (MapType2Select s@0 r_43_1))))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= r_43 r_43_1))))
 :qid |stdinbpl.1414:19|
 :skolemid |168|
 :no-pattern (type r_43)
 :no-pattern (type r_43_1)
 :no-pattern (U_2_int r_43)
 :no-pattern (U_2_bool r_43)
 :no-pattern (U_2_int r_43_1)
 :no-pattern (U_2_bool r_43_1)
))) (=> (forall ((r_43@@0 T@U) (r_43_1@@0 T@U) ) (!  (=> (and (= (type r_43@@0) RefType) (= (type r_43_1@@0) RefType)) (=> (and (and (and (and (not (= r_43@@0 r_43_1@@0)) (and (U_2_bool (MapType2Select lists r_43@@0)) (not (U_2_bool (MapType2Select s@0 r_43@@0))))) (and (U_2_bool (MapType2Select lists r_43_1@@0)) (not (U_2_bool (MapType2Select s@0 r_43_1@@0))))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= r_43@@0 r_43_1@@0))))
 :qid |stdinbpl.1414:19|
 :skolemid |168|
 :no-pattern (type r_43@@0)
 :no-pattern (type r_43_1@@0)
 :no-pattern (U_2_int r_43@@0)
 :no-pattern (U_2_bool r_43@@0)
 :no-pattern (U_2_int r_43_1@@0)
 :no-pattern (U_2_bool r_43_1@@0)
)) (=> (and (forall ((r_43@@1 T@U) ) (!  (=> (= (type r_43@@1) RefType) (=> (and (and (U_2_bool (MapType2Select lists r_43@@1)) (not (U_2_bool (MapType2Select s@0 r_43@@1)))) (< NoPerm FullPerm)) (and (qpRange13 r_43@@1) (= (invRecv13 r_43@@1) r_43@@1))))
 :qid |stdinbpl.1420:26|
 :skolemid |169|
 :pattern ( (MapType0Select ExhaleHeap@0 r_43@@1 next))
 :pattern ( (MapType1Select QPMask@6 r_43@@1 next))
 :pattern ( (MapType2Select lists r_43@@1))
 :pattern ( (MapType2Select s@0 r_43@@1))
)) (forall ((o_4@@9 T@U) ) (!  (=> (= (type o_4@@9) RefType) (=> (and (and (and (U_2_bool (MapType2Select lists (invRecv13 o_4@@9))) (not (U_2_bool (MapType2Select s@0 (invRecv13 o_4@@9))))) (< NoPerm FullPerm)) (qpRange13 o_4@@9)) (= (invRecv13 o_4@@9) o_4@@9)))
 :qid |stdinbpl.1424:26|
 :skolemid |170|
 :pattern ( (invRecv13 o_4@@9))
))) (=> (and (and (forall ((r_43@@2 T@U) ) (!  (=> (= (type r_43@@2) RefType) (=> (and (U_2_bool (MapType2Select lists r_43@@2)) (not (U_2_bool (MapType2Select s@0 r_43@@2)))) (not (= r_43@@2 null))))
 :qid |stdinbpl.1430:26|
 :skolemid |171|
 :pattern ( (MapType0Select ExhaleHeap@0 r_43@@2 next))
 :pattern ( (MapType1Select QPMask@6 r_43@@2 next))
 :pattern ( (MapType2Select lists r_43@@2))
 :pattern ( (MapType2Select s@0 r_43@@2))
)) (forall ((o_4@@10 T@U) ) (!  (=> (= (type o_4@@10) RefType) (and (=> (and (and (and (U_2_bool (MapType2Select lists (invRecv13 o_4@@10))) (not (U_2_bool (MapType2Select s@0 (invRecv13 o_4@@10))))) (< NoPerm FullPerm)) (qpRange13 o_4@@10)) (and (=> (< NoPerm FullPerm) (= (invRecv13 o_4@@10) o_4@@10)) (= (U_2_real (MapType1Select QPMask@6 o_4@@10 next)) (+ (U_2_real (MapType1Select QPMask@5 o_4@@10 next)) FullPerm)))) (=> (not (and (and (and (U_2_bool (MapType2Select lists (invRecv13 o_4@@10))) (not (U_2_bool (MapType2Select s@0 (invRecv13 o_4@@10))))) (< NoPerm FullPerm)) (qpRange13 o_4@@10))) (= (U_2_real (MapType1Select QPMask@6 o_4@@10 next)) (U_2_real (MapType1Select QPMask@5 o_4@@10 next))))))
 :qid |stdinbpl.1436:26|
 :skolemid |172|
 :pattern ( (MapType1Select QPMask@6 o_4@@10 next))
))) (and (forall ((o_4@@11 T@U) (f_5@@5 T@U) ) (! (let ((B@@17 (FieldTypeInv1 (type f_5@@5))))
(let ((A@@18 (FieldTypeInv0 (type f_5@@5))))
 (=> (and (and (= (type o_4@@11) RefType) (= (type f_5@@5) (FieldType A@@18 B@@17))) (not (= f_5@@5 next))) (= (U_2_real (MapType1Select QPMask@5 o_4@@11 f_5@@5)) (U_2_real (MapType1Select QPMask@6 o_4@@11 f_5@@5))))))
 :qid |stdinbpl.1440:33|
 :skolemid |173|
 :pattern ( (MapType1Select QPMask@5 o_4@@11 f_5@@5))
 :pattern ( (MapType1Select QPMask@6 o_4@@11 f_5@@5))
)) (state ExhaleHeap@0 QPMask@6))) (and (=> (= (ControlFlow 0 226) (- 0 228)) (forall ((r_44 T@U) (r_44_1 T@U) ) (!  (=> (and (= (type r_44) RefType) (= (type r_44_1) RefType)) (=> (and (and (and (and (not (= r_44 r_44_1)) (U_2_bool (MapType2Select sNext@1 r_44))) (U_2_bool (MapType2Select sNext@1 r_44_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (or (not (= r_44 r_44_1)) (not (= (- length 1) (- length 1))))))
 :qid |stdinbpl.1450:21|
 :skolemid |174|
 :pattern ( (neverTriggered14 r_44) (neverTriggered14 r_44_1))
))) (=> (forall ((r_44@@0 T@U) (r_44_1@@0 T@U) ) (!  (=> (and (= (type r_44@@0) RefType) (= (type r_44_1@@0) RefType)) (=> (and (and (and (and (not (= r_44@@0 r_44_1@@0)) (U_2_bool (MapType2Select sNext@1 r_44@@0))) (U_2_bool (MapType2Select sNext@1 r_44_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (or (not (= r_44@@0 r_44_1@@0)) (not (= (- length 1) (- length 1))))))
 :qid |stdinbpl.1450:21|
 :skolemid |174|
 :pattern ( (neverTriggered14 r_44@@0) (neverTriggered14 r_44_1@@0))
)) (=> (and (forall ((r_44@@1 T@U) ) (!  (=> (= (type r_44@@1) RefType) (=> (and (U_2_bool (MapType2Select sNext@1 r_44@@1)) (< NoPerm FullPerm)) (and (= (invRecv14 r_44@@1 (- length 1)) r_44@@1) (qpRange14 r_44@@1 (- length 1)))))
 :qid |stdinbpl.1456:26|
 :skolemid |175|
 :pattern ( (MapType2Select sNext@1 r_44@@1))
)) (forall ((r_45_1 T@U) (i_8 Int) ) (!  (=> (= (type r_45_1) RefType) (=> (and (and (U_2_bool (MapType2Select sNext@1 (invRecv14 r_45_1 i_8))) (< NoPerm FullPerm)) (qpRange14 r_45_1 i_8)) (and (= (invRecv14 r_45_1 i_8) r_45_1) (= (- length 1) i_8))))
 :qid |stdinbpl.1460:26|
 :skolemid |176|
 :pattern ( (invRecv14 r_45_1 i_8))
))) (=> (and (and (forall ((r_45_1@@0 T@U) (i_8@@0 Int) ) (!  (=> (= (type r_45_1@@0) RefType) (=> (and (and (U_2_bool (MapType2Select sNext@1 (invRecv14 r_45_1@@0 i_8@@0))) (< NoPerm FullPerm)) (qpRange14 r_45_1@@0 i_8@@0)) (and (=> (< NoPerm FullPerm) (and (= (invRecv14 r_45_1@@0 i_8@@0) r_45_1@@0) (= (- length 1) i_8@@0))) (= (U_2_real (MapType1Select QPMask@7 null (list r_45_1@@0 i_8@@0))) (+ (U_2_real (MapType1Select QPMask@6 null (list r_45_1@@0 i_8@@0))) FullPerm)))))
 :qid |stdinbpl.1466:26|
 :skolemid |177|
 :pattern ( (MapType1Select QPMask@7 null (list r_45_1@@0 i_8@@0)))
)) (forall ((o_4@@12 T@U) (f_5@@6 T@U) ) (! (let ((B@@18 (FieldTypeInv1 (type f_5@@6))))
(let ((A@@19 (FieldTypeInv0 (type f_5@@6))))
 (=> (and (and (= (type o_4@@12) RefType) (= (type f_5@@6) (FieldType A@@19 B@@18))) (or (or (not (= o_4@@12 null)) (not (IsPredicateField f_5@@6))) (not (= (getPredWandId f_5@@6) 0)))) (= (U_2_real (MapType1Select QPMask@6 o_4@@12 f_5@@6)) (U_2_real (MapType1Select QPMask@7 o_4@@12 f_5@@6))))))
 :qid |stdinbpl.1472:33|
 :skolemid |178|
 :pattern ( (MapType1Select QPMask@6 o_4@@12 f_5@@6))
 :pattern ( (MapType1Select QPMask@7 o_4@@12 f_5@@6))
))) (and (forall ((r_45_1@@1 T@U) (i_8@@1 Int) ) (!  (=> (and (= (type r_45_1@@1) RefType) (not (and (and (U_2_bool (MapType2Select sNext@1 (invRecv14 r_45_1@@1 i_8@@1))) (< NoPerm FullPerm)) (qpRange14 r_45_1@@1 i_8@@1)))) (= (U_2_real (MapType1Select QPMask@7 null (list r_45_1@@1 i_8@@1))) (U_2_real (MapType1Select QPMask@6 null (list r_45_1@@1 i_8@@1)))))
 :qid |stdinbpl.1476:26|
 :skolemid |179|
 :pattern ( (MapType1Select QPMask@7 null (list r_45_1@@1 i_8@@1)))
)) (state ExhaleHeap@0 QPMask@7))) (and (=> (= (ControlFlow 0 226) (- 0 227)) (forall ((r_47 T@U) (r_47_1 T@U) ) (!  (=> (and (= (type r_47) RefType) (= (type r_47_1) RefType)) (=> (and (and (and (and (not (= r_47 r_47_1)) (and (U_2_bool (MapType2Select lists r_47)) (not (U_2_bool (MapType2Select s@0 r_47))))) (and (U_2_bool (MapType2Select lists r_47_1)) (not (U_2_bool (MapType2Select s@0 r_47_1))))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= r_47 r_47_1))))
 :qid |stdinbpl.1484:19|
 :skolemid |180|
 :no-pattern (type r_47)
 :no-pattern (type r_47_1)
 :no-pattern (U_2_int r_47)
 :no-pattern (U_2_bool r_47)
 :no-pattern (U_2_int r_47_1)
 :no-pattern (U_2_bool r_47_1)
))) (=> (forall ((r_47@@0 T@U) (r_47_1@@0 T@U) ) (!  (=> (and (= (type r_47@@0) RefType) (= (type r_47_1@@0) RefType)) (=> (and (and (and (and (not (= r_47@@0 r_47_1@@0)) (and (U_2_bool (MapType2Select lists r_47@@0)) (not (U_2_bool (MapType2Select s@0 r_47@@0))))) (and (U_2_bool (MapType2Select lists r_47_1@@0)) (not (U_2_bool (MapType2Select s@0 r_47_1@@0))))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= r_47@@0 r_47_1@@0))))
 :qid |stdinbpl.1484:19|
 :skolemid |180|
 :no-pattern (type r_47@@0)
 :no-pattern (type r_47_1@@0)
 :no-pattern (U_2_int r_47@@0)
 :no-pattern (U_2_bool r_47@@0)
 :no-pattern (U_2_int r_47_1@@0)
 :no-pattern (U_2_bool r_47_1@@0)
)) (=> (and (forall ((r_47@@1 T@U) ) (!  (=> (= (type r_47@@1) RefType) (=> (and (and (U_2_bool (MapType2Select lists r_47@@1)) (not (U_2_bool (MapType2Select s@0 r_47@@1)))) (< NoPerm FullPerm)) (and (qpRange15 r_47@@1) (= (invRecv15 r_47@@1) r_47@@1))))
 :qid |stdinbpl.1490:26|
 :skolemid |181|
 :pattern ( (MapType0Select ExhaleHeap@0 r_47@@1 val))
 :pattern ( (MapType1Select QPMask@8 r_47@@1 val))
 :pattern ( (MapType2Select lists r_47@@1))
 :pattern ( (MapType2Select s@0 r_47@@1))
)) (forall ((o_4@@13 T@U) ) (!  (=> (= (type o_4@@13) RefType) (=> (and (and (and (U_2_bool (MapType2Select lists (invRecv15 o_4@@13))) (not (U_2_bool (MapType2Select s@0 (invRecv15 o_4@@13))))) (< NoPerm FullPerm)) (qpRange15 o_4@@13)) (= (invRecv15 o_4@@13) o_4@@13)))
 :qid |stdinbpl.1494:26|
 :skolemid |182|
 :pattern ( (invRecv15 o_4@@13))
))) (=> (and (and (and (and (forall ((r_47@@2 T@U) ) (!  (=> (= (type r_47@@2) RefType) (=> (and (U_2_bool (MapType2Select lists r_47@@2)) (not (U_2_bool (MapType2Select s@0 r_47@@2)))) (not (= r_47@@2 null))))
 :qid |stdinbpl.1500:26|
 :skolemid |183|
 :pattern ( (MapType0Select ExhaleHeap@0 r_47@@2 val))
 :pattern ( (MapType1Select QPMask@8 r_47@@2 val))
 :pattern ( (MapType2Select lists r_47@@2))
 :pattern ( (MapType2Select s@0 r_47@@2))
)) (forall ((o_4@@14 T@U) ) (!  (=> (= (type o_4@@14) RefType) (and (=> (and (and (and (U_2_bool (MapType2Select lists (invRecv15 o_4@@14))) (not (U_2_bool (MapType2Select s@0 (invRecv15 o_4@@14))))) (< NoPerm FullPerm)) (qpRange15 o_4@@14)) (and (=> (< NoPerm FullPerm) (= (invRecv15 o_4@@14) o_4@@14)) (= (U_2_real (MapType1Select QPMask@8 o_4@@14 val)) (+ (U_2_real (MapType1Select QPMask@7 o_4@@14 val)) FullPerm)))) (=> (not (and (and (and (U_2_bool (MapType2Select lists (invRecv15 o_4@@14))) (not (U_2_bool (MapType2Select s@0 (invRecv15 o_4@@14))))) (< NoPerm FullPerm)) (qpRange15 o_4@@14))) (= (U_2_real (MapType1Select QPMask@8 o_4@@14 val)) (U_2_real (MapType1Select QPMask@7 o_4@@14 val))))))
 :qid |stdinbpl.1506:26|
 :skolemid |184|
 :pattern ( (MapType1Select QPMask@8 o_4@@14 val))
))) (and (forall ((o_4@@15 T@U) (f_5@@7 T@U) ) (! (let ((B@@19 (FieldTypeInv1 (type f_5@@7))))
(let ((A@@20 (FieldTypeInv0 (type f_5@@7))))
 (=> (and (and (= (type o_4@@15) RefType) (= (type f_5@@7) (FieldType A@@20 B@@19))) (not (= f_5@@7 val))) (= (U_2_real (MapType1Select QPMask@7 o_4@@15 f_5@@7)) (U_2_real (MapType1Select QPMask@8 o_4@@15 f_5@@7))))))
 :qid |stdinbpl.1510:33|
 :skolemid |185|
 :pattern ( (MapType1Select QPMask@7 o_4@@15 f_5@@7))
 :pattern ( (MapType1Select QPMask@8 o_4@@15 f_5@@7))
)) (state ExhaleHeap@0 QPMask@8))) (and (and (forall ((r_48 T@U) ) (!  (=> (= (type r_48) RefType) (=> (and (U_2_bool (MapType2Select lists r_48)) (not (U_2_bool (MapType2Select s@0 r_48)))) (= (U_2_int (MapType0Select ExhaleHeap@0 r_48 val)) v_2@@3)))
 :qid |stdinbpl.1516:24|
 :skolemid |186|
 :pattern ( (MapType2Select lists r_48))
 :pattern ( (MapType2Select s@0 r_48))
)) (forall ((r_49 T@U) ) (!  (=> (= (type r_49) RefType) (=> (and (U_2_bool (MapType2Select lists r_49)) (not (U_2_bool (MapType2Select s@0 r_49)))) (U_2_bool (MapType2Select sNext@1 (MapType0Select ExhaleHeap@0 r_49 next)))))
 :qid |stdinbpl.1520:24|
 :skolemid |187|
 :pattern ( (MapType2Select lists r_49))
 :pattern ( (MapType2Select s@0 r_49))
 :pattern ( (MapType2Select sNext@1 (MapType0Select ExhaleHeap@0 r_49 next)))
))) (and (forall ((r1_4 T@U) (r2_4 T@U) ) (!  (=> (and (and (= (type r1_4) RefType) (= (type r2_4) RefType)) (and (U_2_bool (MapType2Select lists r1_4)) (and (not (U_2_bool (MapType2Select s@0 r1_4))) (and (U_2_bool (MapType2Select lists r2_4)) (and (not (U_2_bool (MapType2Select s@0 r2_4))) (not (= r1_4 r2_4))))))) (not (= (MapType0Select ExhaleHeap@0 r1_4 next) (MapType0Select ExhaleHeap@0 r2_4 next))))
 :qid |stdinbpl.1524:24|
 :skolemid |188|
 :pattern ( (MapType2Select lists r1_4) (MapType2Select lists r2_4))
 :pattern ( (MapType2Select lists r1_4) (MapType2Select s@0 r2_4))
 :pattern ( (MapType2Select s@0 r1_4) (MapType2Select lists r2_4))
 :pattern ( (MapType2Select s@0 r1_4) (MapType2Select s@0 r2_4))
)) (state ExhaleHeap@0 QPMask@8)))) (and (and (and (> (|Set#Card| s@0) 0) (state ExhaleHeap@0 QPMask@8)) (and (U_2_bool (MapType0Select ExhaleHeap@0 l $allocated)) (U_2_bool (MapType2Select s@0 l)))) (and (and (state ExhaleHeap@0 QPMask@8) (state ExhaleHeap@0 QPMask@8)) (and (|list#trigger| ExhaleHeap@0 (list l length)) (= (MapType0Select ExhaleHeap@0 null (list l length)) (FrameFragment (ite (> length 0) (CombineFrames (FrameFragment (MapType0Select ExhaleHeap@0 l val)) (CombineFrames (FrameFragment (MapType0Select ExhaleHeap@0 l next)) (MapType0Select ExhaleHeap@0 null (list (MapType0Select ExhaleHeap@0 l next) (- length 1))))) EmptyFrame))))))) (and (=> (= (ControlFlow 0 226) 223) anon183_Then_correct) (=> (= (ControlFlow 0 226) 225) anon183_Else_correct)))))))))))))))))))))
(let ((anon151_correct true))
(let ((anon235_Else_correct  (=> (and (not (U_2_bool (MapType2Select s@2 r_129))) (= (ControlFlow 0 125) 122)) anon151_correct)))
(let ((anon235_Then_correct  (=> (U_2_bool (MapType2Select s@2 r_129)) (and (=> (= (ControlFlow 0 123) (- 0 124)) (allSet Heap@7 (MapType0Select Heap@7 r_129 next) (- length 1) v_2@@3)) (=> (allSet Heap@7 (MapType0Select Heap@7 r_129 next) (- length 1) v_2@@3) (=> (= (ControlFlow 0 123) 122) anon151_correct))))))
(let ((anon234_Else_correct true))
(let ((anon232_Else_correct  (=> (forall ((r1_14_1 T@U) (r2_14_1 T@U) ) (!  (=> (and (and (= (type r1_14_1) RefType) (= (type r2_14_1) RefType)) (and (U_2_bool (MapType2Select s@2 r1_14_1)) (and (U_2_bool (MapType2Select s@2 r2_14_1)) (not (= r1_14_1 r2_14_1))))) (not (= (MapType0Select Heap@7 r1_14_1 next) (MapType0Select Heap@7 r2_14_1 next))))
 :qid |stdinbpl.2993:24|
 :skolemid |368|
 :pattern ( (MapType2Select s@2 r1_14_1) (MapType2Select s@2 r2_14_1))
)) (and (=> (= (ControlFlow 0 126) (- 0 128)) (forall ((r_127 T@U) (r_127_1 T@U) ) (!  (=> (and (= (type r_127) RefType) (= (type r_127_1) RefType)) (=> (and (and (and (and (not (= r_127 r_127_1)) (U_2_bool (MapType2Select s@2 r_127))) (U_2_bool (MapType2Select s@2 r_127_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (or (not (= (MapType0Select Heap@7 r_127 next) (MapType0Select Heap@7 r_127_1 next))) (not (= (- length 1) (- length 1))))))
 :qid |stdinbpl.3004:21|
 :skolemid |369|
 :pattern ( (neverTriggered41 r_127) (neverTriggered41 r_127_1))
))) (=> (forall ((r_127@@0 T@U) (r_127_1@@0 T@U) ) (!  (=> (and (= (type r_127@@0) RefType) (= (type r_127_1@@0) RefType)) (=> (and (and (and (and (not (= r_127@@0 r_127_1@@0)) (U_2_bool (MapType2Select s@2 r_127@@0))) (U_2_bool (MapType2Select s@2 r_127_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (or (not (= (MapType0Select Heap@7 r_127@@0 next) (MapType0Select Heap@7 r_127_1@@0 next))) (not (= (- length 1) (- length 1))))))
 :qid |stdinbpl.3004:21|
 :skolemid |369|
 :pattern ( (neverTriggered41 r_127@@0) (neverTriggered41 r_127_1@@0))
)) (and (=> (= (ControlFlow 0 126) (- 0 127)) (forall ((r_127@@1 T@U) ) (!  (=> (and (= (type r_127@@1) RefType) (U_2_bool (MapType2Select s@2 r_127@@1))) (>= (U_2_real (MapType1Select QPMask@30 null (list (MapType0Select Heap@7 r_127@@1 next) (- length 1)))) FullPerm))
 :qid |stdinbpl.3011:21|
 :skolemid |370|
 :pattern ( (MapType2Select s@2 r_127@@1))
))) (=> (forall ((r_127@@2 T@U) ) (!  (=> (and (= (type r_127@@2) RefType) (U_2_bool (MapType2Select s@2 r_127@@2))) (>= (U_2_real (MapType1Select QPMask@30 null (list (MapType0Select Heap@7 r_127@@2 next) (- length 1)))) FullPerm))
 :qid |stdinbpl.3011:21|
 :skolemid |370|
 :pattern ( (MapType2Select s@2 r_127@@2))
)) (=> (forall ((r_127@@3 T@U) ) (!  (=> (= (type r_127@@3) RefType) (=> (and (U_2_bool (MapType2Select s@2 r_127@@3)) (< NoPerm FullPerm)) (and (= (invRecv41 (MapType0Select Heap@7 r_127@@3 next) (- length 1)) r_127@@3) (qpRange41 (MapType0Select Heap@7 r_127@@3 next) (- length 1)))))
 :qid |stdinbpl.3017:26|
 :skolemid |371|
 :pattern ( (MapType2Select s@2 r_127@@3))
)) (=> (and (and (forall ((r_128_1 T@U) (i_22 Int) ) (!  (=> (= (type r_128_1) RefType) (=> (and (and (U_2_bool (MapType2Select s@2 (invRecv41 r_128_1 i_22))) (< NoPerm FullPerm)) (qpRange41 r_128_1 i_22)) (and (= (MapType0Select Heap@7 (invRecv41 r_128_1 i_22) next) r_128_1) (= (- length 1) i_22))))
 :qid |stdinbpl.3021:26|
 :skolemid |372|
 :pattern ( (invRecv41 r_128_1 i_22))
)) (forall ((r_128_1@@0 T@U) (i_22@@0 Int) ) (!  (=> (= (type r_128_1@@0) RefType) (=> (and (and (U_2_bool (MapType2Select s@2 (invRecv41 r_128_1@@0 i_22@@0))) (< NoPerm FullPerm)) (qpRange41 r_128_1@@0 i_22@@0)) (and (and (= (MapType0Select Heap@7 (invRecv41 r_128_1@@0 i_22@@0) next) r_128_1@@0) (= (- length 1) i_22@@0)) (= (U_2_real (MapType1Select QPMask@31 null (list r_128_1@@0 i_22@@0))) (- (U_2_real (MapType1Select QPMask@30 null (list r_128_1@@0 i_22@@0))) FullPerm)))))
 :qid |stdinbpl.3027:26|
 :skolemid |373|
 :pattern ( (MapType1Select QPMask@31 null (list r_128_1@@0 i_22@@0)))
))) (and (forall ((r_128_1@@1 T@U) (i_22@@1 Int) ) (!  (=> (and (= (type r_128_1@@1) RefType) (not (and (and (U_2_bool (MapType2Select s@2 (invRecv41 r_128_1@@1 i_22@@1))) (< NoPerm FullPerm)) (qpRange41 r_128_1@@1 i_22@@1)))) (= (U_2_real (MapType1Select QPMask@31 null (list r_128_1@@1 i_22@@1))) (U_2_real (MapType1Select QPMask@30 null (list r_128_1@@1 i_22@@1)))))
 :qid |stdinbpl.3031:26|
 :skolemid |374|
 :pattern ( (MapType1Select QPMask@31 null (list r_128_1@@1 i_22@@1)))
)) (forall ((o_4@@16 T@U) (f_5@@8 T@U) ) (! (let ((B@@20 (FieldTypeInv1 (type f_5@@8))))
(let ((A@@21 (FieldTypeInv0 (type f_5@@8))))
 (=> (and (and (= (type o_4@@16) RefType) (= (type f_5@@8) (FieldType A@@21 B@@20))) (or (or (not (= o_4@@16 null)) (not (IsPredicateField f_5@@8))) (not (= (getPredWandId f_5@@8) 0)))) (= (U_2_real (MapType1Select QPMask@30 o_4@@16 f_5@@8)) (U_2_real (MapType1Select QPMask@31 o_4@@16 f_5@@8))))))
 :qid |stdinbpl.3037:33|
 :skolemid |375|
 :pattern ( (MapType1Select QPMask@30 o_4@@16 f_5@@8))
 :pattern ( (MapType1Select QPMask@31 o_4@@16 f_5@@8))
)))) (and (and (=> (= (ControlFlow 0 126) 121) anon234_Else_correct) (=> (= (ControlFlow 0 126) 123) anon235_Then_correct)) (=> (= (ControlFlow 0 126) 125) anon235_Else_correct)))))))))))
(let ((anon147_correct true))
(let ((anon233_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select s@2 r1_13)) (and (U_2_bool (MapType2Select s@2 r2_13)) (not (= r1_13 r2_13))))) (= (ControlFlow 0 120) 117)) anon147_correct)))
(let ((anon233_Then_correct  (=> (and (U_2_bool (MapType2Select s@2 r1_13)) (and (U_2_bool (MapType2Select s@2 r2_13)) (not (= r1_13 r2_13)))) (and (=> (= (ControlFlow 0 118) (- 0 119)) (not (= (MapType0Select Heap@7 r1_13 next) (MapType0Select Heap@7 r2_13 next)))) (=> (not (= (MapType0Select Heap@7 r1_13 next) (MapType0Select Heap@7 r2_13 next))) (=> (= (ControlFlow 0 118) 117) anon147_correct))))))
(let ((anon230_Else_correct  (=> (forall ((r_125_1 T@U) ) (!  (=> (and (= (type r_125_1) RefType) (U_2_bool (MapType2Select s@2 r_125_1))) (= (U_2_int (MapType0Select Heap@7 r_125_1 val)) v_2@@3))
 :qid |stdinbpl.2941:24|
 :skolemid |361|
 :pattern ( (MapType2Select s@2 r_125_1))
)) (and (=> (= (ControlFlow 0 129) (- 0 131)) (forall ((r_126 T@U) (r_126_1 T@U) ) (!  (=> (and (= (type r_126) RefType) (= (type r_126_1) RefType)) (=> (and (and (and (and (not (= r_126 r_126_1)) (U_2_bool (MapType2Select s@2 r_126))) (U_2_bool (MapType2Select s@2 r_126_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= r_126 r_126_1))))
 :qid |stdinbpl.2952:21|
 :skolemid |362|
 :pattern ( (neverTriggered40 r_126) (neverTriggered40 r_126_1))
))) (=> (forall ((r_126@@0 T@U) (r_126_1@@0 T@U) ) (!  (=> (and (= (type r_126@@0) RefType) (= (type r_126_1@@0) RefType)) (=> (and (and (and (and (not (= r_126@@0 r_126_1@@0)) (U_2_bool (MapType2Select s@2 r_126@@0))) (U_2_bool (MapType2Select s@2 r_126_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= r_126@@0 r_126_1@@0))))
 :qid |stdinbpl.2952:21|
 :skolemid |362|
 :pattern ( (neverTriggered40 r_126@@0) (neverTriggered40 r_126_1@@0))
)) (and (=> (= (ControlFlow 0 129) (- 0 130)) (forall ((r_126@@1 T@U) ) (!  (=> (and (= (type r_126@@1) RefType) (U_2_bool (MapType2Select s@2 r_126@@1))) (>= (U_2_real (MapType1Select QPMask@29 r_126@@1 next)) FullPerm))
 :qid |stdinbpl.2959:21|
 :skolemid |363|
 :pattern ( (MapType0Select Heap@7 r_126@@1 next))
 :pattern ( (MapType1Select QPMask@30 r_126@@1 next))
 :pattern ( (MapType2Select s@2 r_126@@1))
))) (=> (forall ((r_126@@2 T@U) ) (!  (=> (and (= (type r_126@@2) RefType) (U_2_bool (MapType2Select s@2 r_126@@2))) (>= (U_2_real (MapType1Select QPMask@29 r_126@@2 next)) FullPerm))
 :qid |stdinbpl.2959:21|
 :skolemid |363|
 :pattern ( (MapType0Select Heap@7 r_126@@2 next))
 :pattern ( (MapType1Select QPMask@30 r_126@@2 next))
 :pattern ( (MapType2Select s@2 r_126@@2))
)) (=> (and (and (forall ((r_126@@3 T@U) ) (!  (=> (= (type r_126@@3) RefType) (=> (and (U_2_bool (MapType2Select s@2 r_126@@3)) (< NoPerm FullPerm)) (and (qpRange40 r_126@@3) (= (invRecv40 r_126@@3) r_126@@3))))
 :qid |stdinbpl.2965:26|
 :skolemid |364|
 :pattern ( (MapType0Select Heap@7 r_126@@3 next))
 :pattern ( (MapType1Select QPMask@30 r_126@@3 next))
 :pattern ( (MapType2Select s@2 r_126@@3))
)) (forall ((o_4@@17 T@U) ) (!  (=> (= (type o_4@@17) RefType) (=> (and (U_2_bool (MapType2Select s@2 (invRecv40 o_4@@17))) (and (< NoPerm FullPerm) (qpRange40 o_4@@17))) (= (invRecv40 o_4@@17) o_4@@17)))
 :qid |stdinbpl.2969:26|
 :skolemid |365|
 :pattern ( (invRecv40 o_4@@17))
))) (and (forall ((o_4@@18 T@U) ) (!  (=> (= (type o_4@@18) RefType) (and (=> (and (U_2_bool (MapType2Select s@2 (invRecv40 o_4@@18))) (and (< NoPerm FullPerm) (qpRange40 o_4@@18))) (and (= (invRecv40 o_4@@18) o_4@@18) (= (U_2_real (MapType1Select QPMask@30 o_4@@18 next)) (- (U_2_real (MapType1Select QPMask@29 o_4@@18 next)) FullPerm)))) (=> (not (and (U_2_bool (MapType2Select s@2 (invRecv40 o_4@@18))) (and (< NoPerm FullPerm) (qpRange40 o_4@@18)))) (= (U_2_real (MapType1Select QPMask@30 o_4@@18 next)) (U_2_real (MapType1Select QPMask@29 o_4@@18 next))))))
 :qid |stdinbpl.2975:26|
 :skolemid |366|
 :pattern ( (MapType1Select QPMask@30 o_4@@18 next))
)) (forall ((o_4@@19 T@U) (f_5@@9 T@U) ) (! (let ((B@@21 (FieldTypeInv1 (type f_5@@9))))
(let ((A@@22 (FieldTypeInv0 (type f_5@@9))))
 (=> (and (and (= (type o_4@@19) RefType) (= (type f_5@@9) (FieldType A@@22 B@@21))) (not (= f_5@@9 next))) (= (U_2_real (MapType1Select QPMask@29 o_4@@19 f_5@@9)) (U_2_real (MapType1Select QPMask@30 o_4@@19 f_5@@9))))))
 :qid |stdinbpl.2981:33|
 :skolemid |367|
 :pattern ( (MapType1Select QPMask@30 o_4@@19 f_5@@9))
)))) (and (and (=> (= (ControlFlow 0 129) 126) anon232_Else_correct) (=> (= (ControlFlow 0 129) 118) anon233_Then_correct)) (=> (= (ControlFlow 0 129) 120) anon233_Else_correct))))))))))
(let ((anon143_correct true))
(let ((anon231_Else_correct  (=> (and (not (U_2_bool (MapType2Select s@2 r_124))) (= (ControlFlow 0 116) 113)) anon143_correct)))
(let ((anon231_Then_correct  (=> (U_2_bool (MapType2Select s@2 r_124)) (and (=> (= (ControlFlow 0 114) (- 0 115)) (= (U_2_int (MapType0Select Heap@7 r_124 val)) v_2@@3)) (=> (= (U_2_int (MapType0Select Heap@7 r_124 val)) v_2@@3) (=> (= (ControlFlow 0 114) 113) anon143_correct))))))
(let ((anon228_Else_correct  (=> (forall ((r_122_1 T@U) ) (!  (=> (= (type r_122_1) RefType) (=> (and (U_2_bool (MapType2Select lists r_122_1)) (not (U_2_bool (MapType2Select s@2 r_122_1)))) (allSet Heap@7 r_122_1 length v_2@@3)))
 :qid |stdinbpl.2889:24|
 :skolemid |354|
 :pattern ( (MapType2Select lists r_122_1))
 :pattern ( (MapType2Select s@2 r_122_1))
 :pattern ( (|allSet#frame| (MapType0Select Heap@7 null (list r_122_1 length)) r_122_1 length v_2@@3))
)) (and (=> (= (ControlFlow 0 132) (- 0 134)) (forall ((r_123 T@U) (r_123_1 T@U) ) (!  (=> (and (= (type r_123) RefType) (= (type r_123_1) RefType)) (=> (and (and (and (and (not (= r_123 r_123_1)) (U_2_bool (MapType2Select s@2 r_123))) (U_2_bool (MapType2Select s@2 r_123_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= r_123 r_123_1))))
 :qid |stdinbpl.2900:21|
 :skolemid |355|
 :pattern ( (neverTriggered39 r_123) (neverTriggered39 r_123_1))
))) (=> (forall ((r_123@@0 T@U) (r_123_1@@0 T@U) ) (!  (=> (and (= (type r_123@@0) RefType) (= (type r_123_1@@0) RefType)) (=> (and (and (and (and (not (= r_123@@0 r_123_1@@0)) (U_2_bool (MapType2Select s@2 r_123@@0))) (U_2_bool (MapType2Select s@2 r_123_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= r_123@@0 r_123_1@@0))))
 :qid |stdinbpl.2900:21|
 :skolemid |355|
 :pattern ( (neverTriggered39 r_123@@0) (neverTriggered39 r_123_1@@0))
)) (and (=> (= (ControlFlow 0 132) (- 0 133)) (forall ((r_123@@1 T@U) ) (!  (=> (and (= (type r_123@@1) RefType) (U_2_bool (MapType2Select s@2 r_123@@1))) (>= (U_2_real (MapType1Select QPMask@28 r_123@@1 val)) FullPerm))
 :qid |stdinbpl.2907:21|
 :skolemid |356|
 :pattern ( (MapType0Select Heap@7 r_123@@1 val))
 :pattern ( (MapType1Select QPMask@29 r_123@@1 val))
 :pattern ( (MapType2Select s@2 r_123@@1))
))) (=> (forall ((r_123@@2 T@U) ) (!  (=> (and (= (type r_123@@2) RefType) (U_2_bool (MapType2Select s@2 r_123@@2))) (>= (U_2_real (MapType1Select QPMask@28 r_123@@2 val)) FullPerm))
 :qid |stdinbpl.2907:21|
 :skolemid |356|
 :pattern ( (MapType0Select Heap@7 r_123@@2 val))
 :pattern ( (MapType1Select QPMask@29 r_123@@2 val))
 :pattern ( (MapType2Select s@2 r_123@@2))
)) (=> (and (and (forall ((r_123@@3 T@U) ) (!  (=> (= (type r_123@@3) RefType) (=> (and (U_2_bool (MapType2Select s@2 r_123@@3)) (< NoPerm FullPerm)) (and (qpRange39 r_123@@3) (= (invRecv39 r_123@@3) r_123@@3))))
 :qid |stdinbpl.2913:26|
 :skolemid |357|
 :pattern ( (MapType0Select Heap@7 r_123@@3 val))
 :pattern ( (MapType1Select QPMask@29 r_123@@3 val))
 :pattern ( (MapType2Select s@2 r_123@@3))
)) (forall ((o_4@@20 T@U) ) (!  (=> (= (type o_4@@20) RefType) (=> (and (U_2_bool (MapType2Select s@2 (invRecv39 o_4@@20))) (and (< NoPerm FullPerm) (qpRange39 o_4@@20))) (= (invRecv39 o_4@@20) o_4@@20)))
 :qid |stdinbpl.2917:26|
 :skolemid |358|
 :pattern ( (invRecv39 o_4@@20))
))) (and (forall ((o_4@@21 T@U) ) (!  (=> (= (type o_4@@21) RefType) (and (=> (and (U_2_bool (MapType2Select s@2 (invRecv39 o_4@@21))) (and (< NoPerm FullPerm) (qpRange39 o_4@@21))) (and (= (invRecv39 o_4@@21) o_4@@21) (= (U_2_real (MapType1Select QPMask@29 o_4@@21 val)) (- (U_2_real (MapType1Select QPMask@28 o_4@@21 val)) FullPerm)))) (=> (not (and (U_2_bool (MapType2Select s@2 (invRecv39 o_4@@21))) (and (< NoPerm FullPerm) (qpRange39 o_4@@21)))) (= (U_2_real (MapType1Select QPMask@29 o_4@@21 val)) (U_2_real (MapType1Select QPMask@28 o_4@@21 val))))))
 :qid |stdinbpl.2923:26|
 :skolemid |359|
 :pattern ( (MapType1Select QPMask@29 o_4@@21 val))
)) (forall ((o_4@@22 T@U) (f_5@@10 T@U) ) (! (let ((B@@22 (FieldTypeInv1 (type f_5@@10))))
(let ((A@@23 (FieldTypeInv0 (type f_5@@10))))
 (=> (and (and (= (type o_4@@22) RefType) (= (type f_5@@10) (FieldType A@@23 B@@22))) (not (= f_5@@10 val))) (= (U_2_real (MapType1Select QPMask@28 o_4@@22 f_5@@10)) (U_2_real (MapType1Select QPMask@29 o_4@@22 f_5@@10))))))
 :qid |stdinbpl.2929:33|
 :skolemid |360|
 :pattern ( (MapType1Select QPMask@29 o_4@@22 f_5@@10))
)))) (and (and (=> (= (ControlFlow 0 132) 129) anon230_Else_correct) (=> (= (ControlFlow 0 132) 114) anon231_Then_correct)) (=> (= (ControlFlow 0 132) 116) anon231_Else_correct))))))))))
(let ((anon139_correct true))
(let ((anon229_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select lists r_121)) (not (U_2_bool (MapType2Select s@2 r_121))))) (= (ControlFlow 0 112) 109)) anon139_correct)))
(let ((anon229_Then_correct  (=> (and (U_2_bool (MapType2Select lists r_121)) (not (U_2_bool (MapType2Select s@2 r_121)))) (and (=> (= (ControlFlow 0 110) (- 0 111)) (allSet Heap@7 r_121 length v_2@@3)) (=> (allSet Heap@7 r_121 length v_2@@3) (=> (= (ControlFlow 0 110) 109) anon139_correct))))))
(let ((anon136_correct  (=> (and (and (state Heap@7 Mask@5) (state Heap@7 Mask@5)) (and (= s@2 (|Set#Difference| s@1 (|Set#Singleton| l2))) (state Heap@7 Mask@5))) (and (=> (= (ControlFlow 0 135) (- 0 137)) (forall ((r_119 T@U) (r_119_1 T@U) ) (!  (=> (and (= (type r_119) RefType) (= (type r_119_1) RefType)) (=> (and (and (and (and (not (= r_119 r_119_1)) (and (U_2_bool (MapType2Select lists r_119)) (not (U_2_bool (MapType2Select s@2 r_119))))) (and (U_2_bool (MapType2Select lists r_119_1)) (not (U_2_bool (MapType2Select s@2 r_119_1))))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (or (not (= r_119 r_119_1)) (not (= length length)))))
 :qid |stdinbpl.2844:21|
 :skolemid |347|
 :pattern ( (neverTriggered38 r_119) (neverTriggered38 r_119_1))
))) (=> (forall ((r_119@@0 T@U) (r_119_1@@0 T@U) ) (!  (=> (and (= (type r_119@@0) RefType) (= (type r_119_1@@0) RefType)) (=> (and (and (and (and (not (= r_119@@0 r_119_1@@0)) (and (U_2_bool (MapType2Select lists r_119@@0)) (not (U_2_bool (MapType2Select s@2 r_119@@0))))) (and (U_2_bool (MapType2Select lists r_119_1@@0)) (not (U_2_bool (MapType2Select s@2 r_119_1@@0))))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (or (not (= r_119@@0 r_119_1@@0)) (not (= length length)))))
 :qid |stdinbpl.2844:21|
 :skolemid |347|
 :pattern ( (neverTriggered38 r_119@@0) (neverTriggered38 r_119_1@@0))
)) (and (=> (= (ControlFlow 0 135) (- 0 136)) (forall ((r_119@@1 T@U) ) (!  (=> (= (type r_119@@1) RefType) (=> (and (U_2_bool (MapType2Select lists r_119@@1)) (not (U_2_bool (MapType2Select s@2 r_119@@1)))) (>= (U_2_real (MapType1Select Mask@5 null (list r_119@@1 length))) FullPerm)))
 :qid |stdinbpl.2851:21|
 :skolemid |348|
 :pattern ( (MapType0Select Heap@7 null (list r_119@@1 length)))
 :pattern ( (MapType1Select Mask@5 null (list r_119@@1 length)))
 :pattern ( (MapType2Select lists r_119@@1))
 :pattern ( (MapType2Select s@2 r_119@@1))
))) (=> (forall ((r_119@@2 T@U) ) (!  (=> (= (type r_119@@2) RefType) (=> (and (U_2_bool (MapType2Select lists r_119@@2)) (not (U_2_bool (MapType2Select s@2 r_119@@2)))) (>= (U_2_real (MapType1Select Mask@5 null (list r_119@@2 length))) FullPerm)))
 :qid |stdinbpl.2851:21|
 :skolemid |348|
 :pattern ( (MapType0Select Heap@7 null (list r_119@@2 length)))
 :pattern ( (MapType1Select Mask@5 null (list r_119@@2 length)))
 :pattern ( (MapType2Select lists r_119@@2))
 :pattern ( (MapType2Select s@2 r_119@@2))
)) (=> (forall ((r_119@@3 T@U) ) (!  (=> (= (type r_119@@3) RefType) (=> (and (and (U_2_bool (MapType2Select lists r_119@@3)) (not (U_2_bool (MapType2Select s@2 r_119@@3)))) (< NoPerm FullPerm)) (and (= (invRecv38 r_119@@3 length) r_119@@3) (qpRange38 r_119@@3 length))))
 :qid |stdinbpl.2857:26|
 :skolemid |349|
 :pattern ( (MapType0Select Heap@7 null (list r_119@@3 length)))
 :pattern ( (MapType1Select Mask@5 null (list r_119@@3 length)))
 :pattern ( (MapType2Select lists r_119@@3))
 :pattern ( (MapType2Select s@2 r_119@@3))
)) (=> (and (and (forall ((r_120_1 T@U) (i_21 Int) ) (!  (=> (= (type r_120_1) RefType) (=> (and (and (and (U_2_bool (MapType2Select lists (invRecv38 r_120_1 i_21))) (not (U_2_bool (MapType2Select s@2 (invRecv38 r_120_1 i_21))))) (< NoPerm FullPerm)) (qpRange38 r_120_1 i_21)) (and (= (invRecv38 r_120_1 i_21) r_120_1) (= length i_21))))
 :qid |stdinbpl.2861:26|
 :skolemid |350|
 :pattern ( (invRecv38 r_120_1 i_21))
)) (forall ((r_120_1@@0 T@U) (i_21@@0 Int) ) (!  (=> (= (type r_120_1@@0) RefType) (=> (and (and (and (U_2_bool (MapType2Select lists (invRecv38 r_120_1@@0 i_21@@0))) (not (U_2_bool (MapType2Select s@2 (invRecv38 r_120_1@@0 i_21@@0))))) (< NoPerm FullPerm)) (qpRange38 r_120_1@@0 i_21@@0)) (and (and (= (invRecv38 r_120_1@@0 i_21@@0) r_120_1@@0) (= length i_21@@0)) (= (U_2_real (MapType1Select QPMask@28 null (list r_120_1@@0 i_21@@0))) (- (U_2_real (MapType1Select Mask@5 null (list r_120_1@@0 i_21@@0))) FullPerm)))))
 :qid |stdinbpl.2867:26|
 :skolemid |351|
 :pattern ( (MapType1Select QPMask@28 null (list r_120_1@@0 i_21@@0)))
))) (and (forall ((r_120_1@@1 T@U) (i_21@@1 Int) ) (!  (=> (and (= (type r_120_1@@1) RefType) (not (and (and (and (U_2_bool (MapType2Select lists (invRecv38 r_120_1@@1 i_21@@1))) (not (U_2_bool (MapType2Select s@2 (invRecv38 r_120_1@@1 i_21@@1))))) (< NoPerm FullPerm)) (qpRange38 r_120_1@@1 i_21@@1)))) (= (U_2_real (MapType1Select QPMask@28 null (list r_120_1@@1 i_21@@1))) (U_2_real (MapType1Select Mask@5 null (list r_120_1@@1 i_21@@1)))))
 :qid |stdinbpl.2871:26|
 :skolemid |352|
 :pattern ( (MapType1Select QPMask@28 null (list r_120_1@@1 i_21@@1)))
)) (forall ((o_4@@23 T@U) (f_5@@11 T@U) ) (! (let ((B@@23 (FieldTypeInv1 (type f_5@@11))))
(let ((A@@24 (FieldTypeInv0 (type f_5@@11))))
 (=> (and (and (= (type o_4@@23) RefType) (= (type f_5@@11) (FieldType A@@24 B@@23))) (or (or (not (= o_4@@23 null)) (not (IsPredicateField f_5@@11))) (not (= (getPredWandId f_5@@11) 0)))) (= (U_2_real (MapType1Select Mask@5 o_4@@23 f_5@@11)) (U_2_real (MapType1Select QPMask@28 o_4@@23 f_5@@11))))))
 :qid |stdinbpl.2877:33|
 :skolemid |353|
 :pattern ( (MapType1Select Mask@5 o_4@@23 f_5@@11))
 :pattern ( (MapType1Select QPMask@28 o_4@@23 f_5@@11))
)))) (and (and (=> (= (ControlFlow 0 135) 132) anon228_Else_correct) (=> (= (ControlFlow 0 135) 110) anon229_Then_correct)) (=> (= (ControlFlow 0 135) 112) anon229_Else_correct)))))))))))
(let ((anon227_Else_correct  (=> (>= 0 length) (=> (and (= Heap@7 Heap@3) (= (ControlFlow 0 139) 135)) anon136_correct))))
(let ((anon227_Then_correct  (=> (> length 0) (=> (and (= Heap@4 (MapType0Store Heap@3 null (|list#sm| l2 length) (MapType1Store (MapType0Select Heap@3 null (|list#sm| l2 length)) l2 val (bool_2_U true)))) (= Heap@5 (MapType0Store Heap@4 null (|list#sm| l2 length) (MapType1Store (MapType0Select Heap@4 null (|list#sm| l2 length)) l2 next (bool_2_U true))))) (=> (and (and (forall ((o_5 T@U) (f_8 T@U) ) (! (let ((B@@24 (FieldTypeInv1 (type f_8))))
(let ((A@@25 (FieldTypeInv0 (type f_8))))
 (=> (and (and (= (type o_5) RefType) (= (type f_8) (FieldType A@@25 B@@24))) (or (U_2_bool (MapType1Select (MapType0Select Heap@5 null (|list#sm| l2 length)) o_5 f_8)) (U_2_bool (MapType1Select (MapType0Select Heap@5 null (|list#sm| (MapType0Select Heap@5 l2 next) (- length 1))) o_5 f_8)))) (U_2_bool (MapType1Select newPMask@0 o_5 f_8)))))
 :qid |stdinbpl.2822:37|
 :skolemid |346|
 :pattern ( (MapType1Select newPMask@0 o_5 f_8))
)) (= Heap@6 (MapType0Store Heap@5 null (|list#sm| l2 length) newPMask@0))) (and (= Heap@7 Heap@6) (= (ControlFlow 0 138) 135))) anon136_correct)))))
(let ((anon226_Else_correct  (=> (and (HasDirectPerm Mask@5 null (list l2 length)) (= Heap@3 ExhaleHeap@2)) (and (=> (= (ControlFlow 0 141) 138) anon227_Then_correct) (=> (= (ControlFlow 0 141) 139) anon227_Else_correct)))))
(let ((anon226_Then_correct  (=> (and (and (not (HasDirectPerm Mask@5 null (list l2 length))) (= Heap@1 (MapType0Store ExhaleHeap@2 null (|list#sm| l2 length) ZeroPMask))) (and (= Heap@2 (MapType0Store Heap@1 null (list l2 length) freshVersion@0)) (= Heap@3 Heap@2))) (and (=> (= (ControlFlow 0 140) 138) anon227_Then_correct) (=> (= (ControlFlow 0 140) 139) anon227_Else_correct)))))
(let ((anon132_correct  (=> (= Mask@5 (MapType1Store Mask@4 null (list l2 length) (real_2_U (+ (U_2_real (MapType1Select Mask@4 null (list l2 length))) FullPerm)))) (=> (and (and (state ExhaleHeap@2 Mask@5) (state ExhaleHeap@2 Mask@5)) (and (|list#trigger| ExhaleHeap@2 (list l2 length)) (= (MapType0Select ExhaleHeap@2 null (list l2 length)) (FrameFragment (ite (> length 0) (CombineFrames (FrameFragment (MapType0Select ExhaleHeap@2 l2 val)) (CombineFrames (FrameFragment (MapType0Select ExhaleHeap@2 l2 next)) (MapType0Select ExhaleHeap@2 null (list (MapType0Select ExhaleHeap@2 l2 next) (- length 1))))) EmptyFrame))))) (and (=> (= (ControlFlow 0 142) 140) anon226_Then_correct) (=> (= (ControlFlow 0 142) 141) anon226_Else_correct))))))
(let ((anon131_correct  (=> (and (and (= Mask@3 (MapType1Store Mask@2 null (list (MapType0Select ExhaleHeap@2 l2 next) (- length 1)) (real_2_U (- (U_2_real (MapType1Select Mask@2 null (list (MapType0Select ExhaleHeap@2 l2 next) (- length 1)))) FullPerm)))) (InsidePredicate (list l2 length) (MapType0Select ExhaleHeap@2 null (list l2 length)) (list (MapType0Select ExhaleHeap@2 l2 next) (- length 1)) (MapType0Select ExhaleHeap@2 null (list (MapType0Select ExhaleHeap@2 l2 next) (- length 1))))) (and (= Mask@4 Mask@3) (= (ControlFlow 0 144) 142))) anon132_correct)))
(let ((anon225_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 147) 144)) anon131_correct)))
(let ((anon225_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 145) (- 0 146)) (<= FullPerm (U_2_real (MapType1Select Mask@2 null (list (MapType0Select ExhaleHeap@2 l2 next) (- length 1)))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@2 null (list (MapType0Select ExhaleHeap@2 l2 next) (- length 1))))) (=> (= (ControlFlow 0 145) 144) anon131_correct))))))
(let ((anon129_correct  (=> (= Mask@2 (MapType1Store Mask@1 l2 next (real_2_U (- (U_2_real (MapType1Select Mask@1 l2 next)) FullPerm)))) (and (=> (= (ControlFlow 0 148) 145) anon225_Then_correct) (=> (= (ControlFlow 0 148) 147) anon225_Else_correct)))))
(let ((anon224_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 151) 148)) anon129_correct)))
(let ((anon224_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 149) (- 0 150)) (<= FullPerm (U_2_real (MapType1Select Mask@1 l2 next)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@1 l2 next))) (=> (= (ControlFlow 0 149) 148) anon129_correct))))))
(let ((anon127_correct  (=> (= Mask@1 (MapType1Store QPMask@22 l2 val (real_2_U (- (U_2_real (MapType1Select QPMask@22 l2 val)) FullPerm)))) (and (=> (= (ControlFlow 0 152) 149) anon224_Then_correct) (=> (= (ControlFlow 0 152) 151) anon224_Else_correct)))))
(let ((anon223_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 155) 152)) anon127_correct)))
(let ((anon223_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 153) (- 0 154)) (<= FullPerm (U_2_real (MapType1Select QPMask@22 l2 val)))) (=> (<= FullPerm (U_2_real (MapType1Select QPMask@22 l2 val))) (=> (= (ControlFlow 0 153) 152) anon127_correct))))))
(let ((anon222_Then_correct  (=> (> length 0) (and (=> (= (ControlFlow 0 156) 153) anon223_Then_correct) (=> (= (ControlFlow 0 156) 155) anon223_Else_correct)))))
(let ((anon222_Else_correct  (=> (>= 0 length) (=> (and (= Mask@4 QPMask@22) (= (ControlFlow 0 143) 142)) anon132_correct))))
(let ((anon221_Then_correct  (=> (state ExhaleHeap@2 ZeroMask) (and (=> (= (ControlFlow 0 157) (- 0 161)) (forall ((r_108 T@U) (r_108_1 T@U) ) (!  (=> (and (= (type r_108) RefType) (= (type r_108_1) RefType)) (=> (and (and (and (and (not (= r_108 r_108_1)) (and (U_2_bool (MapType2Select lists r_108)) (not (U_2_bool (MapType2Select s@1 r_108))))) (and (U_2_bool (MapType2Select lists r_108_1)) (not (U_2_bool (MapType2Select s@1 r_108_1))))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (or (not (= r_108 r_108_1)) (not (= length length)))))
 :qid |stdinbpl.2612:21|
 :skolemid |318|
 :pattern ( (neverTriggered34 r_108) (neverTriggered34 r_108_1))
))) (=> (forall ((r_108@@0 T@U) (r_108_1@@0 T@U) ) (!  (=> (and (= (type r_108@@0) RefType) (= (type r_108_1@@0) RefType)) (=> (and (and (and (and (not (= r_108@@0 r_108_1@@0)) (and (U_2_bool (MapType2Select lists r_108@@0)) (not (U_2_bool (MapType2Select s@1 r_108@@0))))) (and (U_2_bool (MapType2Select lists r_108_1@@0)) (not (U_2_bool (MapType2Select s@1 r_108_1@@0))))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (or (not (= r_108@@0 r_108_1@@0)) (not (= length length)))))
 :qid |stdinbpl.2612:21|
 :skolemid |318|
 :pattern ( (neverTriggered34 r_108@@0) (neverTriggered34 r_108_1@@0))
)) (=> (and (and (and (forall ((r_108@@1 T@U) ) (!  (=> (= (type r_108@@1) RefType) (=> (and (and (U_2_bool (MapType2Select lists r_108@@1)) (not (U_2_bool (MapType2Select s@1 r_108@@1)))) (< NoPerm FullPerm)) (and (= (invRecv34 r_108@@1 length) r_108@@1) (qpRange34 r_108@@1 length))))
 :qid |stdinbpl.2618:26|
 :skolemid |319|
 :pattern ( (MapType0Select ExhaleHeap@2 null (list r_108@@1 length)))
 :pattern ( (MapType1Select ZeroMask null (list r_108@@1 length)))
 :pattern ( (MapType2Select lists r_108@@1))
 :pattern ( (MapType2Select s@1 r_108@@1))
)) (forall ((r_109_1 T@U) (i_19 Int) ) (!  (=> (= (type r_109_1) RefType) (=> (and (and (and (U_2_bool (MapType2Select lists (invRecv34 r_109_1 i_19))) (not (U_2_bool (MapType2Select s@1 (invRecv34 r_109_1 i_19))))) (< NoPerm FullPerm)) (qpRange34 r_109_1 i_19)) (and (= (invRecv34 r_109_1 i_19) r_109_1) (= length i_19))))
 :qid |stdinbpl.2622:26|
 :skolemid |320|
 :pattern ( (invRecv34 r_109_1 i_19))
))) (and (forall ((r_109_1@@0 T@U) (i_19@@0 Int) ) (!  (=> (= (type r_109_1@@0) RefType) (=> (and (and (and (U_2_bool (MapType2Select lists (invRecv34 r_109_1@@0 i_19@@0))) (not (U_2_bool (MapType2Select s@1 (invRecv34 r_109_1@@0 i_19@@0))))) (< NoPerm FullPerm)) (qpRange34 r_109_1@@0 i_19@@0)) (and (=> (< NoPerm FullPerm) (and (= (invRecv34 r_109_1@@0 i_19@@0) r_109_1@@0) (= length i_19@@0))) (= (U_2_real (MapType1Select QPMask@19 null (list r_109_1@@0 i_19@@0))) (+ (U_2_real (MapType1Select ZeroMask null (list r_109_1@@0 i_19@@0))) FullPerm)))))
 :qid |stdinbpl.2628:26|
 :skolemid |321|
 :pattern ( (MapType1Select QPMask@19 null (list r_109_1@@0 i_19@@0)))
)) (forall ((o_4@@24 T@U) (f_5@@12 T@U) ) (! (let ((B@@25 (FieldTypeInv1 (type f_5@@12))))
(let ((A@@26 (FieldTypeInv0 (type f_5@@12))))
 (=> (and (and (= (type o_4@@24) RefType) (= (type f_5@@12) (FieldType A@@26 B@@25))) (or (or (not (= o_4@@24 null)) (not (IsPredicateField f_5@@12))) (not (= (getPredWandId f_5@@12) 0)))) (= (U_2_real (MapType1Select ZeroMask o_4@@24 f_5@@12)) (U_2_real (MapType1Select QPMask@19 o_4@@24 f_5@@12))))))
 :qid |stdinbpl.2634:33|
 :skolemid |322|
 :pattern ( (MapType1Select ZeroMask o_4@@24 f_5@@12))
 :pattern ( (MapType1Select QPMask@19 o_4@@24 f_5@@12))
)))) (and (and (forall ((r_109_1@@1 T@U) (i_19@@1 Int) ) (!  (=> (and (= (type r_109_1@@1) RefType) (not (and (and (and (U_2_bool (MapType2Select lists (invRecv34 r_109_1@@1 i_19@@1))) (not (U_2_bool (MapType2Select s@1 (invRecv34 r_109_1@@1 i_19@@1))))) (< NoPerm FullPerm)) (qpRange34 r_109_1@@1 i_19@@1)))) (= (U_2_real (MapType1Select QPMask@19 null (list r_109_1@@1 i_19@@1))) (U_2_real (MapType1Select ZeroMask null (list r_109_1@@1 i_19@@1)))))
 :qid |stdinbpl.2638:26|
 :skolemid |323|
 :pattern ( (MapType1Select QPMask@19 null (list r_109_1@@1 i_19@@1)))
)) (state ExhaleHeap@2 QPMask@19)) (and (state ExhaleHeap@2 QPMask@19) (forall ((r_111 T@U) ) (!  (=> (= (type r_111) RefType) (=> (and (U_2_bool (MapType2Select lists r_111)) (not (U_2_bool (MapType2Select s@1 r_111)))) (allSet ExhaleHeap@2 r_111 length v_2@@3)))
 :qid |stdinbpl.2645:24|
 :skolemid |324|
 :pattern ( (MapType2Select lists r_111))
 :pattern ( (MapType2Select s@1 r_111))
 :pattern ( (|allSet#frame| (MapType0Select ExhaleHeap@2 null (list r_111 length)) r_111 length v_2@@3))
))))) (and (=> (= (ControlFlow 0 157) (- 0 160)) (forall ((r_112 T@U) (r_112_1 T@U) ) (!  (=> (and (= (type r_112) RefType) (= (type r_112_1) RefType)) (=> (and (and (and (and (not (= r_112 r_112_1)) (U_2_bool (MapType2Select s@1 r_112))) (U_2_bool (MapType2Select s@1 r_112_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= r_112 r_112_1))))
 :qid |stdinbpl.2651:19|
 :skolemid |325|
 :no-pattern (type r_112)
 :no-pattern (type r_112_1)
 :no-pattern (U_2_int r_112)
 :no-pattern (U_2_bool r_112)
 :no-pattern (U_2_int r_112_1)
 :no-pattern (U_2_bool r_112_1)
))) (=> (forall ((r_112@@0 T@U) (r_112_1@@0 T@U) ) (!  (=> (and (= (type r_112@@0) RefType) (= (type r_112_1@@0) RefType)) (=> (and (and (and (and (not (= r_112@@0 r_112_1@@0)) (U_2_bool (MapType2Select s@1 r_112@@0))) (U_2_bool (MapType2Select s@1 r_112_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= r_112@@0 r_112_1@@0))))
 :qid |stdinbpl.2651:19|
 :skolemid |325|
 :no-pattern (type r_112@@0)
 :no-pattern (type r_112_1@@0)
 :no-pattern (U_2_int r_112@@0)
 :no-pattern (U_2_bool r_112@@0)
 :no-pattern (U_2_int r_112_1@@0)
 :no-pattern (U_2_bool r_112_1@@0)
)) (=> (forall ((r_112@@1 T@U) ) (!  (=> (= (type r_112@@1) RefType) (=> (and (U_2_bool (MapType2Select s@1 r_112@@1)) (< NoPerm FullPerm)) (and (qpRange35 r_112@@1) (= (invRecv35 r_112@@1) r_112@@1))))
 :qid |stdinbpl.2657:26|
 :skolemid |326|
 :pattern ( (MapType0Select ExhaleHeap@2 r_112@@1 val))
 :pattern ( (MapType1Select QPMask@20 r_112@@1 val))
 :pattern ( (MapType2Select s@1 r_112@@1))
)) (=> (and (forall ((o_4@@25 T@U) ) (!  (=> (= (type o_4@@25) RefType) (=> (and (and (U_2_bool (MapType2Select s@1 (invRecv35 o_4@@25))) (< NoPerm FullPerm)) (qpRange35 o_4@@25)) (= (invRecv35 o_4@@25) o_4@@25)))
 :qid |stdinbpl.2661:26|
 :skolemid |327|
 :pattern ( (invRecv35 o_4@@25))
)) (forall ((r_112@@2 T@U) ) (!  (=> (and (= (type r_112@@2) RefType) (U_2_bool (MapType2Select s@1 r_112@@2))) (not (= r_112@@2 null)))
 :qid |stdinbpl.2667:26|
 :skolemid |328|
 :pattern ( (MapType0Select ExhaleHeap@2 r_112@@2 val))
 :pattern ( (MapType1Select QPMask@20 r_112@@2 val))
 :pattern ( (MapType2Select s@1 r_112@@2))
))) (=> (and (and (forall ((o_4@@26 T@U) ) (!  (=> (= (type o_4@@26) RefType) (and (=> (and (and (U_2_bool (MapType2Select s@1 (invRecv35 o_4@@26))) (< NoPerm FullPerm)) (qpRange35 o_4@@26)) (and (=> (< NoPerm FullPerm) (= (invRecv35 o_4@@26) o_4@@26)) (= (U_2_real (MapType1Select QPMask@20 o_4@@26 val)) (+ (U_2_real (MapType1Select QPMask@19 o_4@@26 val)) FullPerm)))) (=> (not (and (and (U_2_bool (MapType2Select s@1 (invRecv35 o_4@@26))) (< NoPerm FullPerm)) (qpRange35 o_4@@26))) (= (U_2_real (MapType1Select QPMask@20 o_4@@26 val)) (U_2_real (MapType1Select QPMask@19 o_4@@26 val))))))
 :qid |stdinbpl.2673:26|
 :skolemid |329|
 :pattern ( (MapType1Select QPMask@20 o_4@@26 val))
)) (forall ((o_4@@27 T@U) (f_5@@13 T@U) ) (! (let ((B@@26 (FieldTypeInv1 (type f_5@@13))))
(let ((A@@27 (FieldTypeInv0 (type f_5@@13))))
 (=> (and (and (= (type o_4@@27) RefType) (= (type f_5@@13) (FieldType A@@27 B@@26))) (not (= f_5@@13 val))) (= (U_2_real (MapType1Select QPMask@19 o_4@@27 f_5@@13)) (U_2_real (MapType1Select QPMask@20 o_4@@27 f_5@@13))))))
 :qid |stdinbpl.2677:33|
 :skolemid |330|
 :pattern ( (MapType1Select QPMask@19 o_4@@27 f_5@@13))
 :pattern ( (MapType1Select QPMask@20 o_4@@27 f_5@@13))
))) (and (state ExhaleHeap@2 QPMask@20) (forall ((r_113 T@U) ) (!  (=> (and (= (type r_113) RefType) (U_2_bool (MapType2Select s@1 r_113))) (= (U_2_int (MapType0Select ExhaleHeap@2 r_113 val)) v_2@@3))
 :qid |stdinbpl.2683:24|
 :skolemid |331|
 :pattern ( (MapType2Select s@1 r_113))
)))) (and (=> (= (ControlFlow 0 157) (- 0 159)) (forall ((r_114 T@U) (r_114_1 T@U) ) (!  (=> (and (= (type r_114) RefType) (= (type r_114_1) RefType)) (=> (and (and (and (and (not (= r_114 r_114_1)) (U_2_bool (MapType2Select s@1 r_114))) (U_2_bool (MapType2Select s@1 r_114_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= r_114 r_114_1))))
 :qid |stdinbpl.2689:19|
 :skolemid |332|
 :no-pattern (type r_114)
 :no-pattern (type r_114_1)
 :no-pattern (U_2_int r_114)
 :no-pattern (U_2_bool r_114)
 :no-pattern (U_2_int r_114_1)
 :no-pattern (U_2_bool r_114_1)
))) (=> (forall ((r_114@@0 T@U) (r_114_1@@0 T@U) ) (!  (=> (and (= (type r_114@@0) RefType) (= (type r_114_1@@0) RefType)) (=> (and (and (and (and (not (= r_114@@0 r_114_1@@0)) (U_2_bool (MapType2Select s@1 r_114@@0))) (U_2_bool (MapType2Select s@1 r_114_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= r_114@@0 r_114_1@@0))))
 :qid |stdinbpl.2689:19|
 :skolemid |332|
 :no-pattern (type r_114@@0)
 :no-pattern (type r_114_1@@0)
 :no-pattern (U_2_int r_114@@0)
 :no-pattern (U_2_bool r_114@@0)
 :no-pattern (U_2_int r_114_1@@0)
 :no-pattern (U_2_bool r_114_1@@0)
)) (=> (forall ((r_114@@1 T@U) ) (!  (=> (= (type r_114@@1) RefType) (=> (and (U_2_bool (MapType2Select s@1 r_114@@1)) (< NoPerm FullPerm)) (and (qpRange36 r_114@@1) (= (invRecv36 r_114@@1) r_114@@1))))
 :qid |stdinbpl.2695:26|
 :skolemid |333|
 :pattern ( (MapType0Select ExhaleHeap@2 r_114@@1 next))
 :pattern ( (MapType1Select QPMask@21 r_114@@1 next))
 :pattern ( (MapType2Select s@1 r_114@@1))
)) (=> (and (forall ((o_4@@28 T@U) ) (!  (=> (= (type o_4@@28) RefType) (=> (and (and (U_2_bool (MapType2Select s@1 (invRecv36 o_4@@28))) (< NoPerm FullPerm)) (qpRange36 o_4@@28)) (= (invRecv36 o_4@@28) o_4@@28)))
 :qid |stdinbpl.2699:26|
 :skolemid |334|
 :pattern ( (invRecv36 o_4@@28))
)) (forall ((r_114@@2 T@U) ) (!  (=> (and (= (type r_114@@2) RefType) (U_2_bool (MapType2Select s@1 r_114@@2))) (not (= r_114@@2 null)))
 :qid |stdinbpl.2705:26|
 :skolemid |335|
 :pattern ( (MapType0Select ExhaleHeap@2 r_114@@2 next))
 :pattern ( (MapType1Select QPMask@21 r_114@@2 next))
 :pattern ( (MapType2Select s@1 r_114@@2))
))) (=> (and (and (forall ((o_4@@29 T@U) ) (!  (=> (= (type o_4@@29) RefType) (and (=> (and (and (U_2_bool (MapType2Select s@1 (invRecv36 o_4@@29))) (< NoPerm FullPerm)) (qpRange36 o_4@@29)) (and (=> (< NoPerm FullPerm) (= (invRecv36 o_4@@29) o_4@@29)) (= (U_2_real (MapType1Select QPMask@21 o_4@@29 next)) (+ (U_2_real (MapType1Select QPMask@20 o_4@@29 next)) FullPerm)))) (=> (not (and (and (U_2_bool (MapType2Select s@1 (invRecv36 o_4@@29))) (< NoPerm FullPerm)) (qpRange36 o_4@@29))) (= (U_2_real (MapType1Select QPMask@21 o_4@@29 next)) (U_2_real (MapType1Select QPMask@20 o_4@@29 next))))))
 :qid |stdinbpl.2711:26|
 :skolemid |336|
 :pattern ( (MapType1Select QPMask@21 o_4@@29 next))
)) (forall ((o_4@@30 T@U) (f_5@@14 T@U) ) (! (let ((B@@27 (FieldTypeInv1 (type f_5@@14))))
(let ((A@@28 (FieldTypeInv0 (type f_5@@14))))
 (=> (and (and (= (type o_4@@30) RefType) (= (type f_5@@14) (FieldType A@@28 B@@27))) (not (= f_5@@14 next))) (= (U_2_real (MapType1Select QPMask@20 o_4@@30 f_5@@14)) (U_2_real (MapType1Select QPMask@21 o_4@@30 f_5@@14))))))
 :qid |stdinbpl.2715:33|
 :skolemid |337|
 :pattern ( (MapType1Select QPMask@20 o_4@@30 f_5@@14))
 :pattern ( (MapType1Select QPMask@21 o_4@@30 f_5@@14))
))) (and (state ExhaleHeap@2 QPMask@21) (forall ((r1_12 T@U) (r2_12 T@U) ) (!  (=> (and (and (= (type r1_12) RefType) (= (type r2_12) RefType)) (and (U_2_bool (MapType2Select s@1 r1_12)) (and (U_2_bool (MapType2Select s@1 r2_12)) (not (= r1_12 r2_12))))) (not (= (MapType0Select ExhaleHeap@2 r1_12 next) (MapType0Select ExhaleHeap@2 r2_12 next))))
 :qid |stdinbpl.2721:24|
 :skolemid |338|
 :pattern ( (MapType2Select s@1 r1_12) (MapType2Select s@1 r2_12))
)))) (and (=> (= (ControlFlow 0 157) (- 0 158)) (forall ((r_115 T@U) (r_115_1 T@U) ) (!  (=> (and (= (type r_115) RefType) (= (type r_115_1) RefType)) (=> (and (and (and (and (not (= r_115 r_115_1)) (U_2_bool (MapType2Select s@1 r_115))) (U_2_bool (MapType2Select s@1 r_115_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (or (not (= (MapType0Select ExhaleHeap@2 r_115 next) (MapType0Select ExhaleHeap@2 r_115_1 next))) (not (= (- length 1) (- length 1))))))
 :qid |stdinbpl.2729:21|
 :skolemid |339|
 :pattern ( (neverTriggered37 r_115) (neverTriggered37 r_115_1))
))) (=> (forall ((r_115@@0 T@U) (r_115_1@@0 T@U) ) (!  (=> (and (= (type r_115@@0) RefType) (= (type r_115_1@@0) RefType)) (=> (and (and (and (and (not (= r_115@@0 r_115_1@@0)) (U_2_bool (MapType2Select s@1 r_115@@0))) (U_2_bool (MapType2Select s@1 r_115_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (or (not (= (MapType0Select ExhaleHeap@2 r_115@@0 next) (MapType0Select ExhaleHeap@2 r_115_1@@0 next))) (not (= (- length 1) (- length 1))))))
 :qid |stdinbpl.2729:21|
 :skolemid |339|
 :pattern ( (neverTriggered37 r_115@@0) (neverTriggered37 r_115_1@@0))
)) (=> (forall ((r_115@@1 T@U) ) (!  (=> (= (type r_115@@1) RefType) (=> (and (U_2_bool (MapType2Select s@1 r_115@@1)) (< NoPerm FullPerm)) (and (= (invRecv37 (MapType0Select ExhaleHeap@2 r_115@@1 next) (- length 1)) r_115@@1) (qpRange37 (MapType0Select ExhaleHeap@2 r_115@@1 next) (- length 1)))))
 :qid |stdinbpl.2735:26|
 :skolemid |340|
 :pattern ( (MapType2Select s@1 r_115@@1))
)) (=> (and (forall ((r_116_1 T@U) (i_20 Int) ) (!  (=> (= (type r_116_1) RefType) (=> (and (and (U_2_bool (MapType2Select s@1 (invRecv37 r_116_1 i_20))) (< NoPerm FullPerm)) (qpRange37 r_116_1 i_20)) (and (= (MapType0Select ExhaleHeap@2 (invRecv37 r_116_1 i_20) next) r_116_1) (= (- length 1) i_20))))
 :qid |stdinbpl.2739:26|
 :skolemid |341|
 :pattern ( (invRecv37 r_116_1 i_20))
)) (forall ((r_116_1@@0 T@U) (i_20@@0 Int) ) (!  (=> (= (type r_116_1@@0) RefType) (=> (and (and (U_2_bool (MapType2Select s@1 (invRecv37 r_116_1@@0 i_20@@0))) (< NoPerm FullPerm)) (qpRange37 r_116_1@@0 i_20@@0)) (and (=> (< NoPerm FullPerm) (and (= (MapType0Select ExhaleHeap@2 (invRecv37 r_116_1@@0 i_20@@0) next) r_116_1@@0) (= (- length 1) i_20@@0))) (= (U_2_real (MapType1Select QPMask@22 null (list r_116_1@@0 i_20@@0))) (+ (U_2_real (MapType1Select QPMask@21 null (list r_116_1@@0 i_20@@0))) FullPerm)))))
 :qid |stdinbpl.2745:26|
 :skolemid |342|
 :pattern ( (MapType1Select QPMask@22 null (list r_116_1@@0 i_20@@0)))
))) (=> (and (and (forall ((o_4@@31 T@U) (f_5@@15 T@U) ) (! (let ((B@@28 (FieldTypeInv1 (type f_5@@15))))
(let ((A@@29 (FieldTypeInv0 (type f_5@@15))))
 (=> (and (and (= (type o_4@@31) RefType) (= (type f_5@@15) (FieldType A@@29 B@@28))) (or (or (not (= o_4@@31 null)) (not (IsPredicateField f_5@@15))) (not (= (getPredWandId f_5@@15) 0)))) (= (U_2_real (MapType1Select QPMask@21 o_4@@31 f_5@@15)) (U_2_real (MapType1Select QPMask@22 o_4@@31 f_5@@15))))))
 :qid |stdinbpl.2751:33|
 :skolemid |343|
 :pattern ( (MapType1Select QPMask@21 o_4@@31 f_5@@15))
 :pattern ( (MapType1Select QPMask@22 o_4@@31 f_5@@15))
)) (forall ((r_116_1@@1 T@U) (i_20@@1 Int) ) (!  (=> (and (= (type r_116_1@@1) RefType) (not (and (and (U_2_bool (MapType2Select s@1 (invRecv37 r_116_1@@1 i_20@@1))) (< NoPerm FullPerm)) (qpRange37 r_116_1@@1 i_20@@1)))) (= (U_2_real (MapType1Select QPMask@22 null (list r_116_1@@1 i_20@@1))) (U_2_real (MapType1Select QPMask@21 null (list r_116_1@@1 i_20@@1)))))
 :qid |stdinbpl.2755:26|
 :skolemid |344|
 :pattern ( (MapType1Select QPMask@22 null (list r_116_1@@1 i_20@@1)))
))) (and (state ExhaleHeap@2 QPMask@22) (state ExhaleHeap@2 QPMask@22))) (=> (and (and (and (forall ((r_118 T@U) ) (!  (=> (and (= (type r_118) RefType) (U_2_bool (MapType2Select s@1 r_118))) (allSet ExhaleHeap@2 (MapType0Select ExhaleHeap@2 r_118 next) (- length 1) v_2@@3))
 :qid |stdinbpl.2762:24|
 :skolemid |345|
 :pattern ( (MapType2Select s@1 r_118))
)) (state ExhaleHeap@2 QPMask@22)) (and (> (|Set#Card| s@1) 0) (state ExhaleHeap@2 QPMask@22))) (and (and (U_2_bool (MapType0Select ExhaleHeap@2 l2 $allocated)) (U_2_bool (MapType2Select s@1 l2))) (and (state ExhaleHeap@2 QPMask@22) (state ExhaleHeap@2 QPMask@22)))) (and (=> (= (ControlFlow 0 157) 156) anon222_Then_correct) (=> (= (ControlFlow 0 157) 143) anon222_Else_correct))))))))))))))))))))))))
(let ((anon120_correct true))
(let ((anon220_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 95) 92)) anon120_correct)))
(let ((anon220_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 93) (- 0 94)) (<= FullPerm (U_2_real (MapType1Select QPMask@35 null (list (MapType0Select ExhaleHeap@2 r_13 next) (- length 1)))))) (=> (<= FullPerm (U_2_real (MapType1Select QPMask@35 null (list (MapType0Select ExhaleHeap@2 r_13 next) (- length 1))))) (=> (= (ControlFlow 0 93) 92) anon120_correct))))))
(let ((anon121_correct true))
(let ((anon218_Then_correct  (=> (U_2_bool (MapType2Select s@1 r_13)) (and (=> (= (ControlFlow 0 96) (- 0 97)) (HasDirectPerm QPMask@35 r_13 next)) (=> (HasDirectPerm QPMask@35 r_13 next) (and (and (=> (= (ControlFlow 0 96) 90) anon121_correct) (=> (= (ControlFlow 0 96) 93) anon220_Then_correct)) (=> (= (ControlFlow 0 96) 95) anon220_Else_correct)))))))
(let ((anon218_Else_correct  (=> (and (not (U_2_bool (MapType2Select s@1 r_13))) (= (ControlFlow 0 91) 90)) anon121_correct)))
(let ((anon217_Else_correct true))
(let ((anon215_Else_correct  (and (=> (= (ControlFlow 0 98) (- 0 99)) (forall ((r_103 T@U) (r_103_1 T@U) ) (!  (=> (and (= (type r_103) RefType) (= (type r_103_1) RefType)) (=> (and (and (and (and (not (= r_103 r_103_1)) (U_2_bool (MapType2Select s@1 r_103))) (U_2_bool (MapType2Select s@1 r_103_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (or (not (= (MapType0Select ExhaleHeap@2 r_103 next) (MapType0Select ExhaleHeap@2 r_103_1 next))) (not (= (- length 1) (- length 1))))))
 :qid |stdinbpl.2532:21|
 :skolemid |311|
 :pattern ( (neverTriggered33 r_103) (neverTriggered33 r_103_1))
))) (=> (forall ((r_103@@0 T@U) (r_103_1@@0 T@U) ) (!  (=> (and (= (type r_103@@0) RefType) (= (type r_103_1@@0) RefType)) (=> (and (and (and (and (not (= r_103@@0 r_103_1@@0)) (U_2_bool (MapType2Select s@1 r_103@@0))) (U_2_bool (MapType2Select s@1 r_103_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (or (not (= (MapType0Select ExhaleHeap@2 r_103@@0 next) (MapType0Select ExhaleHeap@2 r_103_1@@0 next))) (not (= (- length 1) (- length 1))))))
 :qid |stdinbpl.2532:21|
 :skolemid |311|
 :pattern ( (neverTriggered33 r_103@@0) (neverTriggered33 r_103_1@@0))
)) (=> (and (and (and (forall ((r_103@@1 T@U) ) (!  (=> (= (type r_103@@1) RefType) (=> (and (U_2_bool (MapType2Select s@1 r_103@@1)) (< NoPerm FullPerm)) (and (= (invRecv33 (MapType0Select ExhaleHeap@2 r_103@@1 next) (- length 1)) r_103@@1) (qpRange33 (MapType0Select ExhaleHeap@2 r_103@@1 next) (- length 1)))))
 :qid |stdinbpl.2538:26|
 :skolemid |312|
 :pattern ( (MapType2Select s@1 r_103@@1))
)) (forall ((r_104_1 T@U) (i_18 Int) ) (!  (=> (= (type r_104_1) RefType) (=> (and (and (U_2_bool (MapType2Select s@1 (invRecv33 r_104_1 i_18))) (< NoPerm FullPerm)) (qpRange33 r_104_1 i_18)) (and (= (MapType0Select ExhaleHeap@2 (invRecv33 r_104_1 i_18) next) r_104_1) (= (- length 1) i_18))))
 :qid |stdinbpl.2542:26|
 :skolemid |313|
 :pattern ( (invRecv33 r_104_1 i_18))
))) (and (forall ((r_104_1@@0 T@U) (i_18@@0 Int) ) (!  (=> (= (type r_104_1@@0) RefType) (=> (and (and (U_2_bool (MapType2Select s@1 (invRecv33 r_104_1@@0 i_18@@0))) (< NoPerm FullPerm)) (qpRange33 r_104_1@@0 i_18@@0)) (and (=> (< NoPerm FullPerm) (and (= (MapType0Select ExhaleHeap@2 (invRecv33 r_104_1@@0 i_18@@0) next) r_104_1@@0) (= (- length 1) i_18@@0))) (= (U_2_real (MapType1Select QPMask@35 null (list r_104_1@@0 i_18@@0))) (+ (U_2_real (MapType1Select QPMask@34 null (list r_104_1@@0 i_18@@0))) FullPerm)))))
 :qid |stdinbpl.2548:26|
 :skolemid |314|
 :pattern ( (MapType1Select QPMask@35 null (list r_104_1@@0 i_18@@0)))
)) (forall ((o_4@@32 T@U) (f_5@@16 T@U) ) (! (let ((B@@29 (FieldTypeInv1 (type f_5@@16))))
(let ((A@@30 (FieldTypeInv0 (type f_5@@16))))
 (=> (and (and (= (type o_4@@32) RefType) (= (type f_5@@16) (FieldType A@@30 B@@29))) (or (or (not (= o_4@@32 null)) (not (IsPredicateField f_5@@16))) (not (= (getPredWandId f_5@@16) 0)))) (= (U_2_real (MapType1Select QPMask@34 o_4@@32 f_5@@16)) (U_2_real (MapType1Select QPMask@35 o_4@@32 f_5@@16))))))
 :qid |stdinbpl.2554:33|
 :skolemid |315|
 :pattern ( (MapType1Select QPMask@34 o_4@@32 f_5@@16))
 :pattern ( (MapType1Select QPMask@35 o_4@@32 f_5@@16))
)))) (and (and (forall ((r_104_1@@1 T@U) (i_18@@1 Int) ) (!  (=> (and (= (type r_104_1@@1) RefType) (not (and (and (U_2_bool (MapType2Select s@1 (invRecv33 r_104_1@@1 i_18@@1))) (< NoPerm FullPerm)) (qpRange33 r_104_1@@1 i_18@@1)))) (= (U_2_real (MapType1Select QPMask@35 null (list r_104_1@@1 i_18@@1))) (U_2_real (MapType1Select QPMask@34 null (list r_104_1@@1 i_18@@1)))))
 :qid |stdinbpl.2558:26|
 :skolemid |316|
 :pattern ( (MapType1Select QPMask@35 null (list r_104_1@@1 i_18@@1)))
)) (state ExhaleHeap@2 QPMask@35)) (and (state ExhaleHeap@2 QPMask@35) (state ExhaleHeap@2 QPMask@35)))) (and (and (=> (= (ControlFlow 0 98) 89) anon217_Else_correct) (=> (= (ControlFlow 0 98) 96) anon218_Then_correct)) (=> (= (ControlFlow 0 98) 91) anon218_Else_correct)))))))
(let ((anon114_correct true))
(let ((anon216_Else_correct  (=> (and (not (U_2_bool (MapType2Select s@1 r_12))) (= (ControlFlow 0 88) 85)) anon114_correct)))
(let ((anon216_Then_correct  (=> (U_2_bool (MapType2Select s@1 r_12)) (and (=> (= (ControlFlow 0 86) (- 0 87)) (HasDirectPerm QPMask@34 r_12 next)) (=> (HasDirectPerm QPMask@34 r_12 next) (=> (= (ControlFlow 0 86) 85) anon114_correct))))))
(let ((anon213_Else_correct  (=> (and (forall ((r1_11 T@U) (r2_11 T@U) ) (!  (=> (and (and (= (type r1_11) RefType) (= (type r2_11) RefType)) (and (U_2_bool (MapType2Select s@1 r1_11)) (and (U_2_bool (MapType2Select s@1 r2_11)) (not (= r1_11 r2_11))))) (not (= (MapType0Select ExhaleHeap@2 r1_11 next) (MapType0Select ExhaleHeap@2 r2_11 next))))
 :qid |stdinbpl.2514:24|
 :skolemid |310|
 :pattern ( (MapType2Select s@1 r1_11) (MapType2Select s@1 r2_11))
)) (state ExhaleHeap@2 QPMask@34)) (and (and (=> (= (ControlFlow 0 100) 98) anon215_Else_correct) (=> (= (ControlFlow 0 100) 86) anon216_Then_correct)) (=> (= (ControlFlow 0 100) 88) anon216_Else_correct)))))
(let ((anon110_correct true))
(let ((anon214_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select s@1 r1_2)) (and (U_2_bool (MapType2Select s@1 r2_2)) (not (= r1_2 r2_2))))) (= (ControlFlow 0 84) 80)) anon110_correct)))
(let ((anon214_Then_correct  (=> (and (U_2_bool (MapType2Select s@1 r1_2)) (and (U_2_bool (MapType2Select s@1 r2_2)) (not (= r1_2 r2_2)))) (and (=> (= (ControlFlow 0 81) (- 0 83)) (HasDirectPerm QPMask@34 r1_2 next)) (=> (HasDirectPerm QPMask@34 r1_2 next) (and (=> (= (ControlFlow 0 81) (- 0 82)) (HasDirectPerm QPMask@34 r2_2 next)) (=> (HasDirectPerm QPMask@34 r2_2 next) (=> (= (ControlFlow 0 81) 80) anon110_correct))))))))
(let ((anon212_Else_correct  (and (=> (= (ControlFlow 0 101) (- 0 102)) (forall ((r_101 T@U) (r_101_1 T@U) ) (!  (=> (and (= (type r_101) RefType) (= (type r_101_1) RefType)) (=> (and (and (and (and (not (= r_101 r_101_1)) (U_2_bool (MapType2Select s@1 r_101))) (U_2_bool (MapType2Select s@1 r_101_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= r_101 r_101_1))))
 :qid |stdinbpl.2470:19|
 :skolemid |304|
 :no-pattern (type r_101)
 :no-pattern (type r_101_1)
 :no-pattern (U_2_int r_101)
 :no-pattern (U_2_bool r_101)
 :no-pattern (U_2_int r_101_1)
 :no-pattern (U_2_bool r_101_1)
))) (=> (forall ((r_101@@0 T@U) (r_101_1@@0 T@U) ) (!  (=> (and (= (type r_101@@0) RefType) (= (type r_101_1@@0) RefType)) (=> (and (and (and (and (not (= r_101@@0 r_101_1@@0)) (U_2_bool (MapType2Select s@1 r_101@@0))) (U_2_bool (MapType2Select s@1 r_101_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= r_101@@0 r_101_1@@0))))
 :qid |stdinbpl.2470:19|
 :skolemid |304|
 :no-pattern (type r_101@@0)
 :no-pattern (type r_101_1@@0)
 :no-pattern (U_2_int r_101@@0)
 :no-pattern (U_2_bool r_101@@0)
 :no-pattern (U_2_int r_101_1@@0)
 :no-pattern (U_2_bool r_101_1@@0)
)) (=> (forall ((r_101@@1 T@U) ) (!  (=> (= (type r_101@@1) RefType) (=> (and (U_2_bool (MapType2Select s@1 r_101@@1)) (< NoPerm FullPerm)) (and (qpRange32 r_101@@1) (= (invRecv32 r_101@@1) r_101@@1))))
 :qid |stdinbpl.2476:26|
 :skolemid |305|
 :pattern ( (MapType0Select ExhaleHeap@2 r_101@@1 next))
 :pattern ( (MapType1Select QPMask@34 r_101@@1 next))
 :pattern ( (MapType2Select s@1 r_101@@1))
)) (=> (and (forall ((o_4@@33 T@U) ) (!  (=> (= (type o_4@@33) RefType) (=> (and (and (U_2_bool (MapType2Select s@1 (invRecv32 o_4@@33))) (< NoPerm FullPerm)) (qpRange32 o_4@@33)) (= (invRecv32 o_4@@33) o_4@@33)))
 :qid |stdinbpl.2480:26|
 :skolemid |306|
 :pattern ( (invRecv32 o_4@@33))
)) (forall ((r_101@@2 T@U) ) (!  (=> (and (= (type r_101@@2) RefType) (U_2_bool (MapType2Select s@1 r_101@@2))) (not (= r_101@@2 null)))
 :qid |stdinbpl.2486:26|
 :skolemid |307|
 :pattern ( (MapType0Select ExhaleHeap@2 r_101@@2 next))
 :pattern ( (MapType1Select QPMask@34 r_101@@2 next))
 :pattern ( (MapType2Select s@1 r_101@@2))
))) (=> (and (and (forall ((o_4@@34 T@U) ) (!  (=> (= (type o_4@@34) RefType) (and (=> (and (and (U_2_bool (MapType2Select s@1 (invRecv32 o_4@@34))) (< NoPerm FullPerm)) (qpRange32 o_4@@34)) (and (=> (< NoPerm FullPerm) (= (invRecv32 o_4@@34) o_4@@34)) (= (U_2_real (MapType1Select QPMask@34 o_4@@34 next)) (+ (U_2_real (MapType1Select QPMask@33 o_4@@34 next)) FullPerm)))) (=> (not (and (and (U_2_bool (MapType2Select s@1 (invRecv32 o_4@@34))) (< NoPerm FullPerm)) (qpRange32 o_4@@34))) (= (U_2_real (MapType1Select QPMask@34 o_4@@34 next)) (U_2_real (MapType1Select QPMask@33 o_4@@34 next))))))
 :qid |stdinbpl.2492:26|
 :skolemid |308|
 :pattern ( (MapType1Select QPMask@34 o_4@@34 next))
)) (forall ((o_4@@35 T@U) (f_5@@17 T@U) ) (! (let ((B@@30 (FieldTypeInv1 (type f_5@@17))))
(let ((A@@31 (FieldTypeInv0 (type f_5@@17))))
 (=> (and (and (= (type o_4@@35) RefType) (= (type f_5@@17) (FieldType A@@31 B@@30))) (not (= f_5@@17 next))) (= (U_2_real (MapType1Select QPMask@33 o_4@@35 f_5@@17)) (U_2_real (MapType1Select QPMask@34 o_4@@35 f_5@@17))))))
 :qid |stdinbpl.2496:33|
 :skolemid |309|
 :pattern ( (MapType1Select QPMask@33 o_4@@35 f_5@@17))
 :pattern ( (MapType1Select QPMask@34 o_4@@35 f_5@@17))
))) (and (state ExhaleHeap@2 QPMask@34) (state ExhaleHeap@2 QPMask@34))) (and (and (=> (= (ControlFlow 0 101) 100) anon213_Else_correct) (=> (= (ControlFlow 0 101) 81) anon214_Then_correct)) (=> (= (ControlFlow 0 101) 84) anon214_Else_correct)))))))))
(let ((anon212_Then_correct true))
(let ((anon210_Else_correct  (=> (forall ((r_99 T@U) ) (!  (=> (and (= (type r_99) RefType) (U_2_bool (MapType2Select s@1 r_99))) (= (U_2_int (MapType0Select ExhaleHeap@2 r_99 val)) v_2@@3))
 :qid |stdinbpl.2459:24|
 :skolemid |303|
 :pattern ( (MapType2Select s@1 r_99))
)) (and (=> (= (ControlFlow 0 103) 79) anon212_Then_correct) (=> (= (ControlFlow 0 103) 101) anon212_Else_correct)))))
(let ((anon104_correct true))
(let ((anon211_Else_correct  (=> (and (not (U_2_bool (MapType2Select s@1 r_11))) (= (ControlFlow 0 78) 75)) anon104_correct)))
(let ((anon211_Then_correct  (=> (U_2_bool (MapType2Select s@1 r_11)) (and (=> (= (ControlFlow 0 76) (- 0 77)) (HasDirectPerm QPMask@33 r_11 val)) (=> (HasDirectPerm QPMask@33 r_11 val) (=> (= (ControlFlow 0 76) 75) anon104_correct))))))
(let ((anon209_Else_correct  (and (=> (= (ControlFlow 0 104) (- 0 105)) (forall ((r_97 T@U) (r_97_1 T@U) ) (!  (=> (and (= (type r_97) RefType) (= (type r_97_1) RefType)) (=> (and (and (and (and (not (= r_97 r_97_1)) (U_2_bool (MapType2Select s@1 r_97))) (U_2_bool (MapType2Select s@1 r_97_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= r_97 r_97_1))))
 :qid |stdinbpl.2418:19|
 :skolemid |297|
 :no-pattern (type r_97)
 :no-pattern (type r_97_1)
 :no-pattern (U_2_int r_97)
 :no-pattern (U_2_bool r_97)
 :no-pattern (U_2_int r_97_1)
 :no-pattern (U_2_bool r_97_1)
))) (=> (forall ((r_97@@0 T@U) (r_97_1@@0 T@U) ) (!  (=> (and (= (type r_97@@0) RefType) (= (type r_97_1@@0) RefType)) (=> (and (and (and (and (not (= r_97@@0 r_97_1@@0)) (U_2_bool (MapType2Select s@1 r_97@@0))) (U_2_bool (MapType2Select s@1 r_97_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= r_97@@0 r_97_1@@0))))
 :qid |stdinbpl.2418:19|
 :skolemid |297|
 :no-pattern (type r_97@@0)
 :no-pattern (type r_97_1@@0)
 :no-pattern (U_2_int r_97@@0)
 :no-pattern (U_2_bool r_97@@0)
 :no-pattern (U_2_int r_97_1@@0)
 :no-pattern (U_2_bool r_97_1@@0)
)) (=> (and (forall ((r_97@@1 T@U) ) (!  (=> (= (type r_97@@1) RefType) (=> (and (U_2_bool (MapType2Select s@1 r_97@@1)) (< NoPerm FullPerm)) (and (qpRange31 r_97@@1) (= (invRecv31 r_97@@1) r_97@@1))))
 :qid |stdinbpl.2424:26|
 :skolemid |298|
 :pattern ( (MapType0Select ExhaleHeap@2 r_97@@1 val))
 :pattern ( (MapType1Select QPMask@33 r_97@@1 val))
 :pattern ( (MapType2Select s@1 r_97@@1))
)) (forall ((o_4@@36 T@U) ) (!  (=> (= (type o_4@@36) RefType) (=> (and (and (U_2_bool (MapType2Select s@1 (invRecv31 o_4@@36))) (< NoPerm FullPerm)) (qpRange31 o_4@@36)) (= (invRecv31 o_4@@36) o_4@@36)))
 :qid |stdinbpl.2428:26|
 :skolemid |299|
 :pattern ( (invRecv31 o_4@@36))
))) (=> (and (and (forall ((r_97@@2 T@U) ) (!  (=> (and (= (type r_97@@2) RefType) (U_2_bool (MapType2Select s@1 r_97@@2))) (not (= r_97@@2 null)))
 :qid |stdinbpl.2434:26|
 :skolemid |300|
 :pattern ( (MapType0Select ExhaleHeap@2 r_97@@2 val))
 :pattern ( (MapType1Select QPMask@33 r_97@@2 val))
 :pattern ( (MapType2Select s@1 r_97@@2))
)) (forall ((o_4@@37 T@U) ) (!  (=> (= (type o_4@@37) RefType) (and (=> (and (and (U_2_bool (MapType2Select s@1 (invRecv31 o_4@@37))) (< NoPerm FullPerm)) (qpRange31 o_4@@37)) (and (=> (< NoPerm FullPerm) (= (invRecv31 o_4@@37) o_4@@37)) (= (U_2_real (MapType1Select QPMask@33 o_4@@37 val)) (+ (U_2_real (MapType1Select QPMask@32 o_4@@37 val)) FullPerm)))) (=> (not (and (and (U_2_bool (MapType2Select s@1 (invRecv31 o_4@@37))) (< NoPerm FullPerm)) (qpRange31 o_4@@37))) (= (U_2_real (MapType1Select QPMask@33 o_4@@37 val)) (U_2_real (MapType1Select QPMask@32 o_4@@37 val))))))
 :qid |stdinbpl.2440:26|
 :skolemid |301|
 :pattern ( (MapType1Select QPMask@33 o_4@@37 val))
))) (and (forall ((o_4@@38 T@U) (f_5@@18 T@U) ) (! (let ((B@@31 (FieldTypeInv1 (type f_5@@18))))
(let ((A@@32 (FieldTypeInv0 (type f_5@@18))))
 (=> (and (and (= (type o_4@@38) RefType) (= (type f_5@@18) (FieldType A@@32 B@@31))) (not (= f_5@@18 val))) (= (U_2_real (MapType1Select QPMask@32 o_4@@38 f_5@@18)) (U_2_real (MapType1Select QPMask@33 o_4@@38 f_5@@18))))))
 :qid |stdinbpl.2444:33|
 :skolemid |302|
 :pattern ( (MapType1Select QPMask@32 o_4@@38 f_5@@18))
 :pattern ( (MapType1Select QPMask@33 o_4@@38 f_5@@18))
)) (state ExhaleHeap@2 QPMask@33))) (and (and (=> (= (ControlFlow 0 104) 103) anon210_Else_correct) (=> (= (ControlFlow 0 104) 76) anon211_Then_correct)) (=> (= (ControlFlow 0 104) 78) anon211_Else_correct))))))))
(let ((anon209_Then_correct true))
(let ((anon205_Else_correct  (=> (and (forall ((r_95 T@U) ) (!  (=> (= (type r_95) RefType) (=> (and (U_2_bool (MapType2Select lists r_95)) (not (U_2_bool (MapType2Select s@1 r_95)))) (allSet ExhaleHeap@2 r_95 length v_2@@3)))
 :qid |stdinbpl.2406:24|
 :skolemid |296|
 :pattern ( (MapType2Select lists r_95))
 :pattern ( (MapType2Select s@1 r_95))
 :pattern ( (|allSet#frame| (MapType0Select ExhaleHeap@2 null (list r_95 length)) r_95 length v_2@@3))
)) (state ExhaleHeap@2 QPMask@32)) (and (=> (= (ControlFlow 0 106) 74) anon209_Then_correct) (=> (= (ControlFlow 0 106) 104) anon209_Else_correct)))))
(let ((anon97_correct true))
(let ((anon208_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 72) 69)) anon97_correct)))
(let ((anon208_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 70) (- 0 71)) (<= FullPerm (U_2_real (MapType1Select QPMask@32 null (list r_8 length))))) (=> (<= FullPerm (U_2_real (MapType1Select QPMask@32 null (list r_8 length)))) (=> (= (ControlFlow 0 70) 69) anon97_correct))))))
(let ((anon98_correct true))
(let ((anon206_Then_correct  (=> (and (U_2_bool (MapType2Select lists r_8)) (not (U_2_bool (MapType2Select s@1 r_8)))) (and (and (=> (= (ControlFlow 0 73) 67) anon98_correct) (=> (= (ControlFlow 0 73) 70) anon208_Then_correct)) (=> (= (ControlFlow 0 73) 72) anon208_Else_correct)))))
(let ((anon206_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select lists r_8)) (not (U_2_bool (MapType2Select s@1 r_8))))) (= (ControlFlow 0 68) 67)) anon98_correct)))
(let ((anon204_Else_correct  (and (=> (= (ControlFlow 0 107) (- 0 108)) (forall ((r_91 T@U) (r_91_1 T@U) ) (!  (=> (and (= (type r_91) RefType) (= (type r_91_1) RefType)) (=> (and (and (and (and (not (= r_91 r_91_1)) (and (U_2_bool (MapType2Select lists r_91)) (not (U_2_bool (MapType2Select s@1 r_91))))) (and (U_2_bool (MapType2Select lists r_91_1)) (not (U_2_bool (MapType2Select s@1 r_91_1))))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (or (not (= r_91 r_91_1)) (not (= length length)))))
 :qid |stdinbpl.2348:21|
 :skolemid |290|
 :pattern ( (neverTriggered30 r_91) (neverTriggered30 r_91_1))
))) (=> (forall ((r_91@@0 T@U) (r_91_1@@0 T@U) ) (!  (=> (and (= (type r_91@@0) RefType) (= (type r_91_1@@0) RefType)) (=> (and (and (and (and (not (= r_91@@0 r_91_1@@0)) (and (U_2_bool (MapType2Select lists r_91@@0)) (not (U_2_bool (MapType2Select s@1 r_91@@0))))) (and (U_2_bool (MapType2Select lists r_91_1@@0)) (not (U_2_bool (MapType2Select s@1 r_91_1@@0))))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (or (not (= r_91@@0 r_91_1@@0)) (not (= length length)))))
 :qid |stdinbpl.2348:21|
 :skolemid |290|
 :pattern ( (neverTriggered30 r_91@@0) (neverTriggered30 r_91_1@@0))
)) (=> (and (and (and (forall ((r_91@@1 T@U) ) (!  (=> (= (type r_91@@1) RefType) (=> (and (and (U_2_bool (MapType2Select lists r_91@@1)) (not (U_2_bool (MapType2Select s@1 r_91@@1)))) (< NoPerm FullPerm)) (and (= (invRecv30 r_91@@1 length) r_91@@1) (qpRange30 r_91@@1 length))))
 :qid |stdinbpl.2354:26|
 :skolemid |291|
 :pattern ( (MapType0Select ExhaleHeap@2 null (list r_91@@1 length)))
 :pattern ( (MapType1Select QPMask@18 null (list r_91@@1 length)))
 :pattern ( (MapType2Select lists r_91@@1))
 :pattern ( (MapType2Select s@1 r_91@@1))
)) (forall ((r_92_1 T@U) (i_17 Int) ) (!  (=> (= (type r_92_1) RefType) (=> (and (and (and (U_2_bool (MapType2Select lists (invRecv30 r_92_1 i_17))) (not (U_2_bool (MapType2Select s@1 (invRecv30 r_92_1 i_17))))) (< NoPerm FullPerm)) (qpRange30 r_92_1 i_17)) (and (= (invRecv30 r_92_1 i_17) r_92_1) (= length i_17))))
 :qid |stdinbpl.2358:26|
 :skolemid |292|
 :pattern ( (invRecv30 r_92_1 i_17))
))) (and (forall ((r_92_1@@0 T@U) (i_17@@0 Int) ) (!  (=> (= (type r_92_1@@0) RefType) (=> (and (and (and (U_2_bool (MapType2Select lists (invRecv30 r_92_1@@0 i_17@@0))) (not (U_2_bool (MapType2Select s@1 (invRecv30 r_92_1@@0 i_17@@0))))) (< NoPerm FullPerm)) (qpRange30 r_92_1@@0 i_17@@0)) (and (=> (< NoPerm FullPerm) (and (= (invRecv30 r_92_1@@0 i_17@@0) r_92_1@@0) (= length i_17@@0))) (= (U_2_real (MapType1Select QPMask@32 null (list r_92_1@@0 i_17@@0))) (+ (U_2_real (MapType1Select QPMask@18 null (list r_92_1@@0 i_17@@0))) FullPerm)))))
 :qid |stdinbpl.2364:26|
 :skolemid |293|
 :pattern ( (MapType1Select QPMask@32 null (list r_92_1@@0 i_17@@0)))
)) (forall ((o_4@@39 T@U) (f_5@@19 T@U) ) (! (let ((B@@32 (FieldTypeInv1 (type f_5@@19))))
(let ((A@@33 (FieldTypeInv0 (type f_5@@19))))
 (=> (and (and (= (type o_4@@39) RefType) (= (type f_5@@19) (FieldType A@@33 B@@32))) (or (or (not (= o_4@@39 null)) (not (IsPredicateField f_5@@19))) (not (= (getPredWandId f_5@@19) 0)))) (= (U_2_real (MapType1Select QPMask@18 o_4@@39 f_5@@19)) (U_2_real (MapType1Select QPMask@32 o_4@@39 f_5@@19))))))
 :qid |stdinbpl.2370:33|
 :skolemid |294|
 :pattern ( (MapType1Select QPMask@18 o_4@@39 f_5@@19))
 :pattern ( (MapType1Select QPMask@32 o_4@@39 f_5@@19))
)))) (and (and (forall ((r_92_1@@1 T@U) (i_17@@1 Int) ) (!  (=> (and (= (type r_92_1@@1) RefType) (not (and (and (and (U_2_bool (MapType2Select lists (invRecv30 r_92_1@@1 i_17@@1))) (not (U_2_bool (MapType2Select s@1 (invRecv30 r_92_1@@1 i_17@@1))))) (< NoPerm FullPerm)) (qpRange30 r_92_1@@1 i_17@@1)))) (= (U_2_real (MapType1Select QPMask@32 null (list r_92_1@@1 i_17@@1))) (U_2_real (MapType1Select QPMask@18 null (list r_92_1@@1 i_17@@1)))))
 :qid |stdinbpl.2374:26|
 :skolemid |295|
 :pattern ( (MapType1Select QPMask@32 null (list r_92_1@@1 i_17@@1)))
)) (state ExhaleHeap@2 QPMask@32)) (and (state ExhaleHeap@2 QPMask@32) (state ExhaleHeap@2 QPMask@32)))) (and (and (=> (= (ControlFlow 0 107) 106) anon205_Else_correct) (=> (= (ControlFlow 0 107) 73) anon206_Then_correct)) (=> (= (ControlFlow 0 107) 68) anon206_Else_correct)))))))
(let ((anon204_Then_correct true))
(let ((anon221_Else_correct  (=> (and (not (> (|Set#Card| s@1) 0)) (state ExhaleHeap@2 QPMask@18)) (and (=> (= (ControlFlow 0 59) (- 0 65)) (forall ((r_131 T@U) (r_131_1 T@U) ) (!  (=> (and (= (type r_131) RefType) (= (type r_131_1) RefType)) (=> (and (and (and (and (not (= r_131 r_131_1)) (and (U_2_bool (MapType2Select lists r_131)) (not (U_2_bool (MapType2Select s@1 r_131))))) (and (U_2_bool (MapType2Select lists r_131_1)) (not (U_2_bool (MapType2Select s@1 r_131_1))))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (or (not (= r_131 r_131_1)) (not (= length length)))))
 :qid |stdinbpl.3068:19|
 :skolemid |377|
 :pattern ( (neverTriggered42 r_131) (neverTriggered42 r_131_1))
))) (=> (forall ((r_131@@0 T@U) (r_131_1@@0 T@U) ) (!  (=> (and (= (type r_131@@0) RefType) (= (type r_131_1@@0) RefType)) (=> (and (and (and (and (not (= r_131@@0 r_131_1@@0)) (and (U_2_bool (MapType2Select lists r_131@@0)) (not (U_2_bool (MapType2Select s@1 r_131@@0))))) (and (U_2_bool (MapType2Select lists r_131_1@@0)) (not (U_2_bool (MapType2Select s@1 r_131_1@@0))))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (or (not (= r_131@@0 r_131_1@@0)) (not (= length length)))))
 :qid |stdinbpl.3068:19|
 :skolemid |377|
 :pattern ( (neverTriggered42 r_131@@0) (neverTriggered42 r_131_1@@0))
)) (=> (and (and (and (forall ((r_131@@1 T@U) ) (!  (=> (= (type r_131@@1) RefType) (=> (and (and (U_2_bool (MapType2Select lists r_131@@1)) (not (U_2_bool (MapType2Select s@1 r_131@@1)))) (< NoPerm FullPerm)) (and (= (invRecv42 r_131@@1 length) r_131@@1) (qpRange42 r_131@@1 length))))
 :qid |stdinbpl.3074:24|
 :skolemid |378|
 :pattern ( (MapType0Select ExhaleHeap@2 null (list r_131@@1 length)))
 :pattern ( (MapType1Select QPMask@18 null (list r_131@@1 length)))
 :pattern ( (MapType2Select lists r_131@@1))
 :pattern ( (MapType2Select s@1 r_131@@1))
)) (forall ((r_132_1 T@U) (i_23 Int) ) (!  (=> (= (type r_132_1) RefType) (=> (and (and (and (U_2_bool (MapType2Select lists (invRecv42 r_132_1 i_23))) (not (U_2_bool (MapType2Select s@1 (invRecv42 r_132_1 i_23))))) (< NoPerm FullPerm)) (qpRange42 r_132_1 i_23)) (and (= (invRecv42 r_132_1 i_23) r_132_1) (= length i_23))))
 :qid |stdinbpl.3078:24|
 :skolemid |379|
 :pattern ( (invRecv42 r_132_1 i_23))
))) (and (forall ((r_132_1@@0 T@U) (i_23@@0 Int) ) (!  (=> (= (type r_132_1@@0) RefType) (=> (and (and (and (U_2_bool (MapType2Select lists (invRecv42 r_132_1@@0 i_23@@0))) (not (U_2_bool (MapType2Select s@1 (invRecv42 r_132_1@@0 i_23@@0))))) (< NoPerm FullPerm)) (qpRange42 r_132_1@@0 i_23@@0)) (and (=> (< NoPerm FullPerm) (and (= (invRecv42 r_132_1@@0 i_23@@0) r_132_1@@0) (= length i_23@@0))) (= (U_2_real (MapType1Select QPMask@23 null (list r_132_1@@0 i_23@@0))) (+ (U_2_real (MapType1Select QPMask@18 null (list r_132_1@@0 i_23@@0))) FullPerm)))))
 :qid |stdinbpl.3084:24|
 :skolemid |380|
 :pattern ( (MapType1Select QPMask@23 null (list r_132_1@@0 i_23@@0)))
)) (forall ((o_4@@40 T@U) (f_5@@20 T@U) ) (! (let ((B@@33 (FieldTypeInv1 (type f_5@@20))))
(let ((A@@34 (FieldTypeInv0 (type f_5@@20))))
 (=> (and (and (= (type o_4@@40) RefType) (= (type f_5@@20) (FieldType A@@34 B@@33))) (or (or (not (= o_4@@40 null)) (not (IsPredicateField f_5@@20))) (not (= (getPredWandId f_5@@20) 0)))) (= (U_2_real (MapType1Select QPMask@18 o_4@@40 f_5@@20)) (U_2_real (MapType1Select QPMask@23 o_4@@40 f_5@@20))))))
 :qid |stdinbpl.3090:31|
 :skolemid |381|
 :pattern ( (MapType1Select QPMask@18 o_4@@40 f_5@@20))
 :pattern ( (MapType1Select QPMask@23 o_4@@40 f_5@@20))
)))) (and (and (forall ((r_132_1@@1 T@U) (i_23@@1 Int) ) (!  (=> (and (= (type r_132_1@@1) RefType) (not (and (and (and (U_2_bool (MapType2Select lists (invRecv42 r_132_1@@1 i_23@@1))) (not (U_2_bool (MapType2Select s@1 (invRecv42 r_132_1@@1 i_23@@1))))) (< NoPerm FullPerm)) (qpRange42 r_132_1@@1 i_23@@1)))) (= (U_2_real (MapType1Select QPMask@23 null (list r_132_1@@1 i_23@@1))) (U_2_real (MapType1Select QPMask@18 null (list r_132_1@@1 i_23@@1)))))
 :qid |stdinbpl.3094:24|
 :skolemid |382|
 :pattern ( (MapType1Select QPMask@23 null (list r_132_1@@1 i_23@@1)))
)) (state ExhaleHeap@2 QPMask@23)) (and (state ExhaleHeap@2 QPMask@23) (forall ((r_134 T@U) ) (!  (=> (= (type r_134) RefType) (=> (and (U_2_bool (MapType2Select lists r_134)) (not (U_2_bool (MapType2Select s@1 r_134)))) (allSet ExhaleHeap@2 r_134 length v_2@@3)))
 :qid |stdinbpl.3101:22|
 :skolemid |383|
 :pattern ( (MapType2Select lists r_134))
 :pattern ( (MapType2Select s@1 r_134))
 :pattern ( (|allSet#frame| (MapType0Select ExhaleHeap@2 null (list r_134 length)) r_134 length v_2@@3))
))))) (and (=> (= (ControlFlow 0 59) (- 0 64)) (forall ((r_135 T@U) (r_135_1 T@U) ) (!  (=> (and (= (type r_135) RefType) (= (type r_135_1) RefType)) (=> (and (and (and (and (not (= r_135 r_135_1)) (U_2_bool (MapType2Select s@1 r_135))) (U_2_bool (MapType2Select s@1 r_135_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= r_135 r_135_1))))
 :qid |stdinbpl.3107:17|
 :skolemid |384|
 :no-pattern (type r_135)
 :no-pattern (type r_135_1)
 :no-pattern (U_2_int r_135)
 :no-pattern (U_2_bool r_135)
 :no-pattern (U_2_int r_135_1)
 :no-pattern (U_2_bool r_135_1)
))) (=> (forall ((r_135@@0 T@U) (r_135_1@@0 T@U) ) (!  (=> (and (= (type r_135@@0) RefType) (= (type r_135_1@@0) RefType)) (=> (and (and (and (and (not (= r_135@@0 r_135_1@@0)) (U_2_bool (MapType2Select s@1 r_135@@0))) (U_2_bool (MapType2Select s@1 r_135_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= r_135@@0 r_135_1@@0))))
 :qid |stdinbpl.3107:17|
 :skolemid |384|
 :no-pattern (type r_135@@0)
 :no-pattern (type r_135_1@@0)
 :no-pattern (U_2_int r_135@@0)
 :no-pattern (U_2_bool r_135@@0)
 :no-pattern (U_2_int r_135_1@@0)
 :no-pattern (U_2_bool r_135_1@@0)
)) (=> (forall ((r_135@@1 T@U) ) (!  (=> (= (type r_135@@1) RefType) (=> (and (U_2_bool (MapType2Select s@1 r_135@@1)) (< NoPerm FullPerm)) (and (qpRange43 r_135@@1) (= (invRecv43 r_135@@1) r_135@@1))))
 :qid |stdinbpl.3113:24|
 :skolemid |385|
 :pattern ( (MapType0Select ExhaleHeap@2 r_135@@1 val))
 :pattern ( (MapType1Select QPMask@24 r_135@@1 val))
 :pattern ( (MapType2Select s@1 r_135@@1))
)) (=> (and (forall ((o_4@@41 T@U) ) (!  (=> (= (type o_4@@41) RefType) (=> (and (and (U_2_bool (MapType2Select s@1 (invRecv43 o_4@@41))) (< NoPerm FullPerm)) (qpRange43 o_4@@41)) (= (invRecv43 o_4@@41) o_4@@41)))
 :qid |stdinbpl.3117:24|
 :skolemid |386|
 :pattern ( (invRecv43 o_4@@41))
)) (forall ((r_135@@2 T@U) ) (!  (=> (and (= (type r_135@@2) RefType) (U_2_bool (MapType2Select s@1 r_135@@2))) (not (= r_135@@2 null)))
 :qid |stdinbpl.3123:24|
 :skolemid |387|
 :pattern ( (MapType0Select ExhaleHeap@2 r_135@@2 val))
 :pattern ( (MapType1Select QPMask@24 r_135@@2 val))
 :pattern ( (MapType2Select s@1 r_135@@2))
))) (=> (and (and (forall ((o_4@@42 T@U) ) (!  (=> (= (type o_4@@42) RefType) (and (=> (and (and (U_2_bool (MapType2Select s@1 (invRecv43 o_4@@42))) (< NoPerm FullPerm)) (qpRange43 o_4@@42)) (and (=> (< NoPerm FullPerm) (= (invRecv43 o_4@@42) o_4@@42)) (= (U_2_real (MapType1Select QPMask@24 o_4@@42 val)) (+ (U_2_real (MapType1Select QPMask@23 o_4@@42 val)) FullPerm)))) (=> (not (and (and (U_2_bool (MapType2Select s@1 (invRecv43 o_4@@42))) (< NoPerm FullPerm)) (qpRange43 o_4@@42))) (= (U_2_real (MapType1Select QPMask@24 o_4@@42 val)) (U_2_real (MapType1Select QPMask@23 o_4@@42 val))))))
 :qid |stdinbpl.3129:24|
 :skolemid |388|
 :pattern ( (MapType1Select QPMask@24 o_4@@42 val))
)) (forall ((o_4@@43 T@U) (f_5@@21 T@U) ) (! (let ((B@@34 (FieldTypeInv1 (type f_5@@21))))
(let ((A@@35 (FieldTypeInv0 (type f_5@@21))))
 (=> (and (and (= (type o_4@@43) RefType) (= (type f_5@@21) (FieldType A@@35 B@@34))) (not (= f_5@@21 val))) (= (U_2_real (MapType1Select QPMask@23 o_4@@43 f_5@@21)) (U_2_real (MapType1Select QPMask@24 o_4@@43 f_5@@21))))))
 :qid |stdinbpl.3133:31|
 :skolemid |389|
 :pattern ( (MapType1Select QPMask@23 o_4@@43 f_5@@21))
 :pattern ( (MapType1Select QPMask@24 o_4@@43 f_5@@21))
))) (and (state ExhaleHeap@2 QPMask@24) (forall ((r_136 T@U) ) (!  (=> (and (= (type r_136) RefType) (U_2_bool (MapType2Select s@1 r_136))) (= (U_2_int (MapType0Select ExhaleHeap@2 r_136 val)) v_2@@3))
 :qid |stdinbpl.3139:22|
 :skolemid |390|
 :pattern ( (MapType2Select s@1 r_136))
)))) (and (=> (= (ControlFlow 0 59) (- 0 63)) (forall ((r_137 T@U) (r_137_1 T@U) ) (!  (=> (and (= (type r_137) RefType) (= (type r_137_1) RefType)) (=> (and (and (and (and (not (= r_137 r_137_1)) (U_2_bool (MapType2Select s@1 r_137))) (U_2_bool (MapType2Select s@1 r_137_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= r_137 r_137_1))))
 :qid |stdinbpl.3145:17|
 :skolemid |391|
 :no-pattern (type r_137)
 :no-pattern (type r_137_1)
 :no-pattern (U_2_int r_137)
 :no-pattern (U_2_bool r_137)
 :no-pattern (U_2_int r_137_1)
 :no-pattern (U_2_bool r_137_1)
))) (=> (forall ((r_137@@0 T@U) (r_137_1@@0 T@U) ) (!  (=> (and (= (type r_137@@0) RefType) (= (type r_137_1@@0) RefType)) (=> (and (and (and (and (not (= r_137@@0 r_137_1@@0)) (U_2_bool (MapType2Select s@1 r_137@@0))) (U_2_bool (MapType2Select s@1 r_137_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= r_137@@0 r_137_1@@0))))
 :qid |stdinbpl.3145:17|
 :skolemid |391|
 :no-pattern (type r_137@@0)
 :no-pattern (type r_137_1@@0)
 :no-pattern (U_2_int r_137@@0)
 :no-pattern (U_2_bool r_137@@0)
 :no-pattern (U_2_int r_137_1@@0)
 :no-pattern (U_2_bool r_137_1@@0)
)) (=> (forall ((r_137@@1 T@U) ) (!  (=> (= (type r_137@@1) RefType) (=> (and (U_2_bool (MapType2Select s@1 r_137@@1)) (< NoPerm FullPerm)) (and (qpRange44 r_137@@1) (= (invRecv44 r_137@@1) r_137@@1))))
 :qid |stdinbpl.3151:24|
 :skolemid |392|
 :pattern ( (MapType0Select ExhaleHeap@2 r_137@@1 next))
 :pattern ( (MapType1Select QPMask@25 r_137@@1 next))
 :pattern ( (MapType2Select s@1 r_137@@1))
)) (=> (and (forall ((o_4@@44 T@U) ) (!  (=> (= (type o_4@@44) RefType) (=> (and (and (U_2_bool (MapType2Select s@1 (invRecv44 o_4@@44))) (< NoPerm FullPerm)) (qpRange44 o_4@@44)) (= (invRecv44 o_4@@44) o_4@@44)))
 :qid |stdinbpl.3155:24|
 :skolemid |393|
 :pattern ( (invRecv44 o_4@@44))
)) (forall ((r_137@@2 T@U) ) (!  (=> (and (= (type r_137@@2) RefType) (U_2_bool (MapType2Select s@1 r_137@@2))) (not (= r_137@@2 null)))
 :qid |stdinbpl.3161:24|
 :skolemid |394|
 :pattern ( (MapType0Select ExhaleHeap@2 r_137@@2 next))
 :pattern ( (MapType1Select QPMask@25 r_137@@2 next))
 :pattern ( (MapType2Select s@1 r_137@@2))
))) (=> (and (and (forall ((o_4@@45 T@U) ) (!  (=> (= (type o_4@@45) RefType) (and (=> (and (and (U_2_bool (MapType2Select s@1 (invRecv44 o_4@@45))) (< NoPerm FullPerm)) (qpRange44 o_4@@45)) (and (=> (< NoPerm FullPerm) (= (invRecv44 o_4@@45) o_4@@45)) (= (U_2_real (MapType1Select QPMask@25 o_4@@45 next)) (+ (U_2_real (MapType1Select QPMask@24 o_4@@45 next)) FullPerm)))) (=> (not (and (and (U_2_bool (MapType2Select s@1 (invRecv44 o_4@@45))) (< NoPerm FullPerm)) (qpRange44 o_4@@45))) (= (U_2_real (MapType1Select QPMask@25 o_4@@45 next)) (U_2_real (MapType1Select QPMask@24 o_4@@45 next))))))
 :qid |stdinbpl.3167:24|
 :skolemid |395|
 :pattern ( (MapType1Select QPMask@25 o_4@@45 next))
)) (forall ((o_4@@46 T@U) (f_5@@22 T@U) ) (! (let ((B@@35 (FieldTypeInv1 (type f_5@@22))))
(let ((A@@36 (FieldTypeInv0 (type f_5@@22))))
 (=> (and (and (= (type o_4@@46) RefType) (= (type f_5@@22) (FieldType A@@36 B@@35))) (not (= f_5@@22 next))) (= (U_2_real (MapType1Select QPMask@24 o_4@@46 f_5@@22)) (U_2_real (MapType1Select QPMask@25 o_4@@46 f_5@@22))))))
 :qid |stdinbpl.3171:31|
 :skolemid |396|
 :pattern ( (MapType1Select QPMask@24 o_4@@46 f_5@@22))
 :pattern ( (MapType1Select QPMask@25 o_4@@46 f_5@@22))
))) (and (state ExhaleHeap@2 QPMask@25) (forall ((r1_15 T@U) (r2_15 T@U) ) (!  (=> (and (and (= (type r1_15) RefType) (= (type r2_15) RefType)) (and (U_2_bool (MapType2Select s@1 r1_15)) (and (U_2_bool (MapType2Select s@1 r2_15)) (not (= r1_15 r2_15))))) (not (= (MapType0Select ExhaleHeap@2 r1_15 next) (MapType0Select ExhaleHeap@2 r2_15 next))))
 :qid |stdinbpl.3177:22|
 :skolemid |397|
 :pattern ( (MapType2Select s@1 r1_15) (MapType2Select s@1 r2_15))
)))) (and (=> (= (ControlFlow 0 59) (- 0 62)) (forall ((r_138 T@U) (r_138_1 T@U) ) (!  (=> (and (= (type r_138) RefType) (= (type r_138_1) RefType)) (=> (and (and (and (and (not (= r_138 r_138_1)) (U_2_bool (MapType2Select s@1 r_138))) (U_2_bool (MapType2Select s@1 r_138_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (or (not (= (MapType0Select ExhaleHeap@2 r_138 next) (MapType0Select ExhaleHeap@2 r_138_1 next))) (not (= (- length 1) (- length 1))))))
 :qid |stdinbpl.3185:19|
 :skolemid |398|
 :pattern ( (neverTriggered45 r_138) (neverTriggered45 r_138_1))
))) (=> (forall ((r_138@@0 T@U) (r_138_1@@0 T@U) ) (!  (=> (and (= (type r_138@@0) RefType) (= (type r_138_1@@0) RefType)) (=> (and (and (and (and (not (= r_138@@0 r_138_1@@0)) (U_2_bool (MapType2Select s@1 r_138@@0))) (U_2_bool (MapType2Select s@1 r_138_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (or (not (= (MapType0Select ExhaleHeap@2 r_138@@0 next) (MapType0Select ExhaleHeap@2 r_138_1@@0 next))) (not (= (- length 1) (- length 1))))))
 :qid |stdinbpl.3185:19|
 :skolemid |398|
 :pattern ( (neverTriggered45 r_138@@0) (neverTriggered45 r_138_1@@0))
)) (=> (forall ((r_138@@1 T@U) ) (!  (=> (= (type r_138@@1) RefType) (=> (and (U_2_bool (MapType2Select s@1 r_138@@1)) (< NoPerm FullPerm)) (and (= (invRecv45 (MapType0Select ExhaleHeap@2 r_138@@1 next) (- length 1)) r_138@@1) (qpRange45 (MapType0Select ExhaleHeap@2 r_138@@1 next) (- length 1)))))
 :qid |stdinbpl.3191:24|
 :skolemid |399|
 :pattern ( (MapType2Select s@1 r_138@@1))
)) (=> (and (forall ((r_139_1 T@U) (i_24 Int) ) (!  (=> (= (type r_139_1) RefType) (=> (and (and (U_2_bool (MapType2Select s@1 (invRecv45 r_139_1 i_24))) (< NoPerm FullPerm)) (qpRange45 r_139_1 i_24)) (and (= (MapType0Select ExhaleHeap@2 (invRecv45 r_139_1 i_24) next) r_139_1) (= (- length 1) i_24))))
 :qid |stdinbpl.3195:24|
 :skolemid |400|
 :pattern ( (invRecv45 r_139_1 i_24))
)) (forall ((r_139_1@@0 T@U) (i_24@@0 Int) ) (!  (=> (= (type r_139_1@@0) RefType) (=> (and (and (U_2_bool (MapType2Select s@1 (invRecv45 r_139_1@@0 i_24@@0))) (< NoPerm FullPerm)) (qpRange45 r_139_1@@0 i_24@@0)) (and (=> (< NoPerm FullPerm) (and (= (MapType0Select ExhaleHeap@2 (invRecv45 r_139_1@@0 i_24@@0) next) r_139_1@@0) (= (- length 1) i_24@@0))) (= (U_2_real (MapType1Select QPMask@26 null (list r_139_1@@0 i_24@@0))) (+ (U_2_real (MapType1Select QPMask@25 null (list r_139_1@@0 i_24@@0))) FullPerm)))))
 :qid |stdinbpl.3201:24|
 :skolemid |401|
 :pattern ( (MapType1Select QPMask@26 null (list r_139_1@@0 i_24@@0)))
))) (=> (and (and (and (forall ((o_4@@47 T@U) (f_5@@23 T@U) ) (! (let ((B@@36 (FieldTypeInv1 (type f_5@@23))))
(let ((A@@37 (FieldTypeInv0 (type f_5@@23))))
 (=> (and (and (= (type o_4@@47) RefType) (= (type f_5@@23) (FieldType A@@37 B@@36))) (or (or (not (= o_4@@47 null)) (not (IsPredicateField f_5@@23))) (not (= (getPredWandId f_5@@23) 0)))) (= (U_2_real (MapType1Select QPMask@25 o_4@@47 f_5@@23)) (U_2_real (MapType1Select QPMask@26 o_4@@47 f_5@@23))))))
 :qid |stdinbpl.3207:31|
 :skolemid |402|
 :pattern ( (MapType1Select QPMask@25 o_4@@47 f_5@@23))
 :pattern ( (MapType1Select QPMask@26 o_4@@47 f_5@@23))
)) (forall ((r_139_1@@1 T@U) (i_24@@1 Int) ) (!  (=> (and (= (type r_139_1@@1) RefType) (not (and (and (U_2_bool (MapType2Select s@1 (invRecv45 r_139_1@@1 i_24@@1))) (< NoPerm FullPerm)) (qpRange45 r_139_1@@1 i_24@@1)))) (= (U_2_real (MapType1Select QPMask@26 null (list r_139_1@@1 i_24@@1))) (U_2_real (MapType1Select QPMask@25 null (list r_139_1@@1 i_24@@1)))))
 :qid |stdinbpl.3211:24|
 :skolemid |403|
 :pattern ( (MapType1Select QPMask@26 null (list r_139_1@@1 i_24@@1)))
))) (and (state ExhaleHeap@2 QPMask@26) (state ExhaleHeap@2 QPMask@26))) (and (and (forall ((r_141 T@U) ) (!  (=> (and (= (type r_141) RefType) (U_2_bool (MapType2Select s@1 r_141))) (allSet ExhaleHeap@2 (MapType0Select ExhaleHeap@2 r_141 next) (- length 1) v_2@@3))
 :qid |stdinbpl.3218:22|
 :skolemid |404|
 :pattern ( (MapType2Select s@1 r_141))
)) (state ExhaleHeap@2 QPMask@26)) (and (state ExhaleHeap@2 QPMask@26) (= (ControlFlow 0 59) (- 0 61))))) false)))))))))))))))))))))
(let ((anon201_Else_correct  (=> (and (forall ((r_89_1 T@U) ) (!  (=> (and (= (type r_89_1) RefType) (U_2_bool (MapType2Select lists r_89_1))) (allSet Heap@0 (MapType0Select Heap@0 r_89_1 next) (- length 1) v_2@@3))
 :qid |stdinbpl.2325:24|
 :skolemid |289|
 :pattern ( (MapType2Select lists r_89_1))
)) (IdenticalOnKnownLocations Heap@0 ExhaleHeap@2 QPMask@18)) (and (and (and (=> (= (ControlFlow 0 162) 157) anon221_Then_correct) (=> (= (ControlFlow 0 162) 59) anon221_Else_correct)) (=> (= (ControlFlow 0 162) 66) anon204_Then_correct)) (=> (= (ControlFlow 0 162) 107) anon204_Else_correct)))))
(let ((anon88_correct true))
(let ((anon202_Else_correct  (=> (and (not (U_2_bool (MapType2Select lists r_88))) (= (ControlFlow 0 57) 54)) anon88_correct)))
(let ((anon202_Then_correct  (=> (U_2_bool (MapType2Select lists r_88)) (and (=> (= (ControlFlow 0 55) (- 0 56)) (allSet Heap@0 (MapType0Select Heap@0 r_88 next) (- length 1) v_2@@3)) (=> (allSet Heap@0 (MapType0Select Heap@0 r_88 next) (- length 1) v_2@@3) (=> (= (ControlFlow 0 55) 54) anon88_correct))))))
(let ((anon199_Else_correct  (=> (forall ((r1_9_1 T@U) (r2_9_1 T@U) ) (!  (=> (and (and (= (type r1_9_1) RefType) (= (type r2_9_1) RefType)) (and (U_2_bool (MapType2Select lists r1_9_1)) (and (U_2_bool (MapType2Select lists r2_9_1)) (not (= r1_9_1 r2_9_1))))) (not (= (MapType0Select Heap@0 r1_9_1 next) (MapType0Select Heap@0 r2_9_1 next))))
 :qid |stdinbpl.2269:24|
 :skolemid |281|
 :pattern ( (MapType2Select lists r1_9_1) (MapType2Select lists r2_9_1))
)) (and (=> (= (ControlFlow 0 163) (- 0 165)) (forall ((r_86 T@U) (r_86_1 T@U) ) (!  (=> (and (= (type r_86) RefType) (= (type r_86_1) RefType)) (=> (and (and (and (and (not (= r_86 r_86_1)) (U_2_bool (MapType2Select lists r_86))) (U_2_bool (MapType2Select lists r_86_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (or (not (= (MapType0Select Heap@0 r_86 next) (MapType0Select Heap@0 r_86_1 next))) (not (= (- length 1) (- length 1))))))
 :qid |stdinbpl.2280:21|
 :skolemid |282|
 :pattern ( (neverTriggered29 r_86) (neverTriggered29 r_86_1))
))) (=> (forall ((r_86@@0 T@U) (r_86_1@@0 T@U) ) (!  (=> (and (= (type r_86@@0) RefType) (= (type r_86_1@@0) RefType)) (=> (and (and (and (and (not (= r_86@@0 r_86_1@@0)) (U_2_bool (MapType2Select lists r_86@@0))) (U_2_bool (MapType2Select lists r_86_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (or (not (= (MapType0Select Heap@0 r_86@@0 next) (MapType0Select Heap@0 r_86_1@@0 next))) (not (= (- length 1) (- length 1))))))
 :qid |stdinbpl.2280:21|
 :skolemid |282|
 :pattern ( (neverTriggered29 r_86@@0) (neverTriggered29 r_86_1@@0))
)) (and (=> (= (ControlFlow 0 163) (- 0 164)) (forall ((r_86@@1 T@U) ) (!  (=> (and (= (type r_86@@1) RefType) (U_2_bool (MapType2Select lists r_86@@1))) (>= (U_2_real (MapType1Select QPMask@17 null (list (MapType0Select Heap@0 r_86@@1 next) (- length 1)))) FullPerm))
 :qid |stdinbpl.2287:21|
 :skolemid |283|
 :pattern ( (MapType2Select lists r_86@@1))
))) (=> (forall ((r_86@@2 T@U) ) (!  (=> (and (= (type r_86@@2) RefType) (U_2_bool (MapType2Select lists r_86@@2))) (>= (U_2_real (MapType1Select QPMask@17 null (list (MapType0Select Heap@0 r_86@@2 next) (- length 1)))) FullPerm))
 :qid |stdinbpl.2287:21|
 :skolemid |283|
 :pattern ( (MapType2Select lists r_86@@2))
)) (=> (forall ((r_86@@3 T@U) ) (!  (=> (= (type r_86@@3) RefType) (=> (and (U_2_bool (MapType2Select lists r_86@@3)) (< NoPerm FullPerm)) (and (= (invRecv29 (MapType0Select Heap@0 r_86@@3 next) (- length 1)) r_86@@3) (qpRange29 (MapType0Select Heap@0 r_86@@3 next) (- length 1)))))
 :qid |stdinbpl.2293:26|
 :skolemid |284|
 :pattern ( (MapType2Select lists r_86@@3))
)) (=> (and (and (forall ((r_87_1 T@U) (i_16 Int) ) (!  (=> (= (type r_87_1) RefType) (=> (and (and (U_2_bool (MapType2Select lists (invRecv29 r_87_1 i_16))) (< NoPerm FullPerm)) (qpRange29 r_87_1 i_16)) (and (= (MapType0Select Heap@0 (invRecv29 r_87_1 i_16) next) r_87_1) (= (- length 1) i_16))))
 :qid |stdinbpl.2297:26|
 :skolemid |285|
 :pattern ( (invRecv29 r_87_1 i_16))
)) (forall ((r_87_1@@0 T@U) (i_16@@0 Int) ) (!  (=> (= (type r_87_1@@0) RefType) (=> (and (and (U_2_bool (MapType2Select lists (invRecv29 r_87_1@@0 i_16@@0))) (< NoPerm FullPerm)) (qpRange29 r_87_1@@0 i_16@@0)) (and (and (= (MapType0Select Heap@0 (invRecv29 r_87_1@@0 i_16@@0) next) r_87_1@@0) (= (- length 1) i_16@@0)) (= (U_2_real (MapType1Select QPMask@18 null (list r_87_1@@0 i_16@@0))) (- (U_2_real (MapType1Select QPMask@17 null (list r_87_1@@0 i_16@@0))) FullPerm)))))
 :qid |stdinbpl.2303:26|
 :skolemid |286|
 :pattern ( (MapType1Select QPMask@18 null (list r_87_1@@0 i_16@@0)))
))) (and (forall ((r_87_1@@1 T@U) (i_16@@1 Int) ) (!  (=> (and (= (type r_87_1@@1) RefType) (not (and (and (U_2_bool (MapType2Select lists (invRecv29 r_87_1@@1 i_16@@1))) (< NoPerm FullPerm)) (qpRange29 r_87_1@@1 i_16@@1)))) (= (U_2_real (MapType1Select QPMask@18 null (list r_87_1@@1 i_16@@1))) (U_2_real (MapType1Select QPMask@17 null (list r_87_1@@1 i_16@@1)))))
 :qid |stdinbpl.2307:26|
 :skolemid |287|
 :pattern ( (MapType1Select QPMask@18 null (list r_87_1@@1 i_16@@1)))
)) (forall ((o_4@@48 T@U) (f_5@@24 T@U) ) (! (let ((B@@37 (FieldTypeInv1 (type f_5@@24))))
(let ((A@@38 (FieldTypeInv0 (type f_5@@24))))
 (=> (and (and (= (type o_4@@48) RefType) (= (type f_5@@24) (FieldType A@@38 B@@37))) (or (or (not (= o_4@@48 null)) (not (IsPredicateField f_5@@24))) (not (= (getPredWandId f_5@@24) 0)))) (= (U_2_real (MapType1Select QPMask@17 o_4@@48 f_5@@24)) (U_2_real (MapType1Select QPMask@18 o_4@@48 f_5@@24))))))
 :qid |stdinbpl.2313:33|
 :skolemid |288|
 :pattern ( (MapType1Select QPMask@17 o_4@@48 f_5@@24))
 :pattern ( (MapType1Select QPMask@18 o_4@@48 f_5@@24))
)))) (and (and (=> (= (ControlFlow 0 163) 162) anon201_Else_correct) (=> (= (ControlFlow 0 163) 55) anon202_Then_correct)) (=> (= (ControlFlow 0 163) 57) anon202_Else_correct)))))))))))
(let ((anon84_correct true))
(let ((anon200_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select lists r1_8)) (and (U_2_bool (MapType2Select lists r2_8)) (not (= r1_8 r2_8))))) (= (ControlFlow 0 53) 50)) anon84_correct)))
(let ((anon200_Then_correct  (=> (and (U_2_bool (MapType2Select lists r1_8)) (and (U_2_bool (MapType2Select lists r2_8)) (not (= r1_8 r2_8)))) (and (=> (= (ControlFlow 0 51) (- 0 52)) (not (= (MapType0Select Heap@0 r1_8 next) (MapType0Select Heap@0 r2_8 next)))) (=> (not (= (MapType0Select Heap@0 r1_8 next) (MapType0Select Heap@0 r2_8 next))) (=> (= (ControlFlow 0 51) 50) anon84_correct))))))
(let ((anon197_Else_correct  (=> (forall ((r_84_1 T@U) ) (!  (=> (and (= (type r_84_1) RefType) (U_2_bool (MapType2Select lists r_84_1))) (= (U_2_int (MapType0Select Heap@0 r_84_1 val)) v_2@@3))
 :qid |stdinbpl.2217:24|
 :skolemid |274|
 :pattern ( (MapType2Select lists r_84_1))
)) (and (=> (= (ControlFlow 0 166) (- 0 168)) (forall ((r_85 T@U) (r_85_1 T@U) ) (!  (=> (and (= (type r_85) RefType) (= (type r_85_1) RefType)) (=> (and (and (and (and (not (= r_85 r_85_1)) (U_2_bool (MapType2Select lists r_85))) (U_2_bool (MapType2Select lists r_85_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= r_85 r_85_1))))
 :qid |stdinbpl.2228:21|
 :skolemid |275|
 :pattern ( (neverTriggered28 r_85) (neverTriggered28 r_85_1))
))) (=> (forall ((r_85@@0 T@U) (r_85_1@@0 T@U) ) (!  (=> (and (= (type r_85@@0) RefType) (= (type r_85_1@@0) RefType)) (=> (and (and (and (and (not (= r_85@@0 r_85_1@@0)) (U_2_bool (MapType2Select lists r_85@@0))) (U_2_bool (MapType2Select lists r_85_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= r_85@@0 r_85_1@@0))))
 :qid |stdinbpl.2228:21|
 :skolemid |275|
 :pattern ( (neverTriggered28 r_85@@0) (neverTriggered28 r_85_1@@0))
)) (and (=> (= (ControlFlow 0 166) (- 0 167)) (forall ((r_85@@1 T@U) ) (!  (=> (and (= (type r_85@@1) RefType) (U_2_bool (MapType2Select lists r_85@@1))) (>= (U_2_real (MapType1Select QPMask@16 r_85@@1 next)) FullPerm))
 :qid |stdinbpl.2235:21|
 :skolemid |276|
 :pattern ( (MapType0Select Heap@0 r_85@@1 next))
 :pattern ( (MapType1Select QPMask@17 r_85@@1 next))
 :pattern ( (MapType2Select lists r_85@@1))
))) (=> (forall ((r_85@@2 T@U) ) (!  (=> (and (= (type r_85@@2) RefType) (U_2_bool (MapType2Select lists r_85@@2))) (>= (U_2_real (MapType1Select QPMask@16 r_85@@2 next)) FullPerm))
 :qid |stdinbpl.2235:21|
 :skolemid |276|
 :pattern ( (MapType0Select Heap@0 r_85@@2 next))
 :pattern ( (MapType1Select QPMask@17 r_85@@2 next))
 :pattern ( (MapType2Select lists r_85@@2))
)) (=> (and (and (forall ((r_85@@3 T@U) ) (!  (=> (= (type r_85@@3) RefType) (=> (and (U_2_bool (MapType2Select lists r_85@@3)) (< NoPerm FullPerm)) (and (qpRange28 r_85@@3) (= (invRecv28 r_85@@3) r_85@@3))))
 :qid |stdinbpl.2241:26|
 :skolemid |277|
 :pattern ( (MapType0Select Heap@0 r_85@@3 next))
 :pattern ( (MapType1Select QPMask@17 r_85@@3 next))
 :pattern ( (MapType2Select lists r_85@@3))
)) (forall ((o_4@@49 T@U) ) (!  (=> (= (type o_4@@49) RefType) (=> (and (U_2_bool (MapType2Select lists (invRecv28 o_4@@49))) (and (< NoPerm FullPerm) (qpRange28 o_4@@49))) (= (invRecv28 o_4@@49) o_4@@49)))
 :qid |stdinbpl.2245:26|
 :skolemid |278|
 :pattern ( (invRecv28 o_4@@49))
))) (and (forall ((o_4@@50 T@U) ) (!  (=> (= (type o_4@@50) RefType) (and (=> (and (U_2_bool (MapType2Select lists (invRecv28 o_4@@50))) (and (< NoPerm FullPerm) (qpRange28 o_4@@50))) (and (= (invRecv28 o_4@@50) o_4@@50) (= (U_2_real (MapType1Select QPMask@17 o_4@@50 next)) (- (U_2_real (MapType1Select QPMask@16 o_4@@50 next)) FullPerm)))) (=> (not (and (U_2_bool (MapType2Select lists (invRecv28 o_4@@50))) (and (< NoPerm FullPerm) (qpRange28 o_4@@50)))) (= (U_2_real (MapType1Select QPMask@17 o_4@@50 next)) (U_2_real (MapType1Select QPMask@16 o_4@@50 next))))))
 :qid |stdinbpl.2251:26|
 :skolemid |279|
 :pattern ( (MapType1Select QPMask@17 o_4@@50 next))
)) (forall ((o_4@@51 T@U) (f_5@@25 T@U) ) (! (let ((B@@38 (FieldTypeInv1 (type f_5@@25))))
(let ((A@@39 (FieldTypeInv0 (type f_5@@25))))
 (=> (and (and (= (type o_4@@51) RefType) (= (type f_5@@25) (FieldType A@@39 B@@38))) (not (= f_5@@25 next))) (= (U_2_real (MapType1Select QPMask@16 o_4@@51 f_5@@25)) (U_2_real (MapType1Select QPMask@17 o_4@@51 f_5@@25))))))
 :qid |stdinbpl.2257:33|
 :skolemid |280|
 :pattern ( (MapType1Select QPMask@17 o_4@@51 f_5@@25))
)))) (and (and (=> (= (ControlFlow 0 166) 163) anon199_Else_correct) (=> (= (ControlFlow 0 166) 51) anon200_Then_correct)) (=> (= (ControlFlow 0 166) 53) anon200_Else_correct))))))))))
(let ((anon80_correct true))
(let ((anon198_Else_correct  (=> (and (not (U_2_bool (MapType2Select lists r_83))) (= (ControlFlow 0 49) 46)) anon80_correct)))
(let ((anon198_Then_correct  (=> (U_2_bool (MapType2Select lists r_83)) (and (=> (= (ControlFlow 0 47) (- 0 48)) (= (U_2_int (MapType0Select Heap@0 r_83 val)) v_2@@3)) (=> (= (U_2_int (MapType0Select Heap@0 r_83 val)) v_2@@3) (=> (= (ControlFlow 0 47) 46) anon80_correct))))))
(let ((anon195_Else_correct  (=> (forall ((r_81_1 T@U) ) (!  (=> (= (type r_81_1) RefType) (=> (and (U_2_bool (MapType2Select lists r_81_1)) (not (U_2_bool (MapType2Select lists r_81_1)))) (allSet Heap@0 r_81_1 length v_2@@3)))
 :qid |stdinbpl.2165:24|
 :skolemid |267|
 :pattern ( (MapType2Select lists r_81_1))
 :pattern ( (MapType2Select lists r_81_1))
 :pattern ( (|allSet#frame| (MapType0Select Heap@0 null (list r_81_1 length)) r_81_1 length v_2@@3))
)) (and (=> (= (ControlFlow 0 169) (- 0 171)) (forall ((r_82 T@U) (r_82_1 T@U) ) (!  (=> (and (= (type r_82) RefType) (= (type r_82_1) RefType)) (=> (and (and (and (and (not (= r_82 r_82_1)) (U_2_bool (MapType2Select lists r_82))) (U_2_bool (MapType2Select lists r_82_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= r_82 r_82_1))))
 :qid |stdinbpl.2176:21|
 :skolemid |268|
 :pattern ( (neverTriggered27 r_82) (neverTriggered27 r_82_1))
))) (=> (forall ((r_82@@0 T@U) (r_82_1@@0 T@U) ) (!  (=> (and (= (type r_82@@0) RefType) (= (type r_82_1@@0) RefType)) (=> (and (and (and (and (not (= r_82@@0 r_82_1@@0)) (U_2_bool (MapType2Select lists r_82@@0))) (U_2_bool (MapType2Select lists r_82_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= r_82@@0 r_82_1@@0))))
 :qid |stdinbpl.2176:21|
 :skolemid |268|
 :pattern ( (neverTriggered27 r_82@@0) (neverTriggered27 r_82_1@@0))
)) (and (=> (= (ControlFlow 0 169) (- 0 170)) (forall ((r_82@@1 T@U) ) (!  (=> (and (= (type r_82@@1) RefType) (U_2_bool (MapType2Select lists r_82@@1))) (>= (U_2_real (MapType1Select QPMask@15 r_82@@1 val)) FullPerm))
 :qid |stdinbpl.2183:21|
 :skolemid |269|
 :pattern ( (MapType0Select Heap@0 r_82@@1 val))
 :pattern ( (MapType1Select QPMask@16 r_82@@1 val))
 :pattern ( (MapType2Select lists r_82@@1))
))) (=> (forall ((r_82@@2 T@U) ) (!  (=> (and (= (type r_82@@2) RefType) (U_2_bool (MapType2Select lists r_82@@2))) (>= (U_2_real (MapType1Select QPMask@15 r_82@@2 val)) FullPerm))
 :qid |stdinbpl.2183:21|
 :skolemid |269|
 :pattern ( (MapType0Select Heap@0 r_82@@2 val))
 :pattern ( (MapType1Select QPMask@16 r_82@@2 val))
 :pattern ( (MapType2Select lists r_82@@2))
)) (=> (and (and (forall ((r_82@@3 T@U) ) (!  (=> (= (type r_82@@3) RefType) (=> (and (U_2_bool (MapType2Select lists r_82@@3)) (< NoPerm FullPerm)) (and (qpRange27 r_82@@3) (= (invRecv27 r_82@@3) r_82@@3))))
 :qid |stdinbpl.2189:26|
 :skolemid |270|
 :pattern ( (MapType0Select Heap@0 r_82@@3 val))
 :pattern ( (MapType1Select QPMask@16 r_82@@3 val))
 :pattern ( (MapType2Select lists r_82@@3))
)) (forall ((o_4@@52 T@U) ) (!  (=> (= (type o_4@@52) RefType) (=> (and (U_2_bool (MapType2Select lists (invRecv27 o_4@@52))) (and (< NoPerm FullPerm) (qpRange27 o_4@@52))) (= (invRecv27 o_4@@52) o_4@@52)))
 :qid |stdinbpl.2193:26|
 :skolemid |271|
 :pattern ( (invRecv27 o_4@@52))
))) (and (forall ((o_4@@53 T@U) ) (!  (=> (= (type o_4@@53) RefType) (and (=> (and (U_2_bool (MapType2Select lists (invRecv27 o_4@@53))) (and (< NoPerm FullPerm) (qpRange27 o_4@@53))) (and (= (invRecv27 o_4@@53) o_4@@53) (= (U_2_real (MapType1Select QPMask@16 o_4@@53 val)) (- (U_2_real (MapType1Select QPMask@15 o_4@@53 val)) FullPerm)))) (=> (not (and (U_2_bool (MapType2Select lists (invRecv27 o_4@@53))) (and (< NoPerm FullPerm) (qpRange27 o_4@@53)))) (= (U_2_real (MapType1Select QPMask@16 o_4@@53 val)) (U_2_real (MapType1Select QPMask@15 o_4@@53 val))))))
 :qid |stdinbpl.2199:26|
 :skolemid |272|
 :pattern ( (MapType1Select QPMask@16 o_4@@53 val))
)) (forall ((o_4@@54 T@U) (f_5@@26 T@U) ) (! (let ((B@@39 (FieldTypeInv1 (type f_5@@26))))
(let ((A@@40 (FieldTypeInv0 (type f_5@@26))))
 (=> (and (and (= (type o_4@@54) RefType) (= (type f_5@@26) (FieldType A@@40 B@@39))) (not (= f_5@@26 val))) (= (U_2_real (MapType1Select QPMask@15 o_4@@54 f_5@@26)) (U_2_real (MapType1Select QPMask@16 o_4@@54 f_5@@26))))))
 :qid |stdinbpl.2205:33|
 :skolemid |273|
 :pattern ( (MapType1Select QPMask@16 o_4@@54 f_5@@26))
)))) (and (and (=> (= (ControlFlow 0 169) 166) anon197_Else_correct) (=> (= (ControlFlow 0 169) 47) anon198_Then_correct)) (=> (= (ControlFlow 0 169) 49) anon198_Else_correct))))))))))
(let ((anon76_correct true))
(let ((anon196_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select lists r_80)) (not (U_2_bool (MapType2Select lists r_80))))) (= (ControlFlow 0 45) 42)) anon76_correct)))
(let ((anon196_Then_correct  (=> (and (U_2_bool (MapType2Select lists r_80)) (not (U_2_bool (MapType2Select lists r_80)))) (and (=> (= (ControlFlow 0 43) (- 0 44)) (allSet Heap@0 r_80 length v_2@@3)) (=> (allSet Heap@0 r_80 length v_2@@3) (=> (= (ControlFlow 0 43) 42) anon76_correct))))))
(let ((anon73_correct  (=> (and (state Heap@0 Mask@0) (state Heap@0 Mask@0)) (and (=> (= (ControlFlow 0 172) (- 0 174)) (forall ((r_78 T@U) (r_78_1 T@U) ) (!  (=> (and (= (type r_78) RefType) (= (type r_78_1) RefType)) (=> (and (and (and (and (not (= r_78 r_78_1)) (and (U_2_bool (MapType2Select lists r_78)) (not (U_2_bool (MapType2Select lists r_78))))) (and (U_2_bool (MapType2Select lists r_78_1)) (not (U_2_bool (MapType2Select lists r_78_1))))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (or (not (= r_78 r_78_1)) (not (= length length)))))
 :qid |stdinbpl.2120:21|
 :skolemid |260|
 :pattern ( (neverTriggered26 r_78) (neverTriggered26 r_78_1))
))) (=> (forall ((r_78@@0 T@U) (r_78_1@@0 T@U) ) (!  (=> (and (= (type r_78@@0) RefType) (= (type r_78_1@@0) RefType)) (=> (and (and (and (and (not (= r_78@@0 r_78_1@@0)) (and (U_2_bool (MapType2Select lists r_78@@0)) (not (U_2_bool (MapType2Select lists r_78@@0))))) (and (U_2_bool (MapType2Select lists r_78_1@@0)) (not (U_2_bool (MapType2Select lists r_78_1@@0))))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (or (not (= r_78@@0 r_78_1@@0)) (not (= length length)))))
 :qid |stdinbpl.2120:21|
 :skolemid |260|
 :pattern ( (neverTriggered26 r_78@@0) (neverTriggered26 r_78_1@@0))
)) (and (=> (= (ControlFlow 0 172) (- 0 173)) (forall ((r_78@@1 T@U) ) (!  (=> (= (type r_78@@1) RefType) (=> (and (U_2_bool (MapType2Select lists r_78@@1)) (not (U_2_bool (MapType2Select lists r_78@@1)))) (>= (U_2_real (MapType1Select Mask@0 null (list r_78@@1 length))) FullPerm)))
 :qid |stdinbpl.2127:21|
 :skolemid |261|
 :pattern ( (MapType0Select Heap@0 null (list r_78@@1 length)))
 :pattern ( (MapType1Select Mask@0 null (list r_78@@1 length)))
 :pattern ( (MapType2Select lists r_78@@1))
 :pattern ( (MapType2Select lists r_78@@1))
))) (=> (forall ((r_78@@2 T@U) ) (!  (=> (= (type r_78@@2) RefType) (=> (and (U_2_bool (MapType2Select lists r_78@@2)) (not (U_2_bool (MapType2Select lists r_78@@2)))) (>= (U_2_real (MapType1Select Mask@0 null (list r_78@@2 length))) FullPerm)))
 :qid |stdinbpl.2127:21|
 :skolemid |261|
 :pattern ( (MapType0Select Heap@0 null (list r_78@@2 length)))
 :pattern ( (MapType1Select Mask@0 null (list r_78@@2 length)))
 :pattern ( (MapType2Select lists r_78@@2))
 :pattern ( (MapType2Select lists r_78@@2))
)) (=> (forall ((r_78@@3 T@U) ) (!  (=> (= (type r_78@@3) RefType) (=> (and (and (U_2_bool (MapType2Select lists r_78@@3)) (not (U_2_bool (MapType2Select lists r_78@@3)))) (< NoPerm FullPerm)) (and (= (invRecv26 r_78@@3 length) r_78@@3) (qpRange26 r_78@@3 length))))
 :qid |stdinbpl.2133:26|
 :skolemid |262|
 :pattern ( (MapType0Select Heap@0 null (list r_78@@3 length)))
 :pattern ( (MapType1Select Mask@0 null (list r_78@@3 length)))
 :pattern ( (MapType2Select lists r_78@@3))
 :pattern ( (MapType2Select lists r_78@@3))
)) (=> (and (and (forall ((r_79_1 T@U) (i_15 Int) ) (!  (=> (= (type r_79_1) RefType) (=> (and (and (and (U_2_bool (MapType2Select lists (invRecv26 r_79_1 i_15))) (not (U_2_bool (MapType2Select lists (invRecv26 r_79_1 i_15))))) (< NoPerm FullPerm)) (qpRange26 r_79_1 i_15)) (and (= (invRecv26 r_79_1 i_15) r_79_1) (= length i_15))))
 :qid |stdinbpl.2137:26|
 :skolemid |263|
 :pattern ( (invRecv26 r_79_1 i_15))
)) (forall ((r_79_1@@0 T@U) (i_15@@0 Int) ) (!  (=> (= (type r_79_1@@0) RefType) (=> (and (and (and (U_2_bool (MapType2Select lists (invRecv26 r_79_1@@0 i_15@@0))) (not (U_2_bool (MapType2Select lists (invRecv26 r_79_1@@0 i_15@@0))))) (< NoPerm FullPerm)) (qpRange26 r_79_1@@0 i_15@@0)) (and (and (= (invRecv26 r_79_1@@0 i_15@@0) r_79_1@@0) (= length i_15@@0)) (= (U_2_real (MapType1Select QPMask@15 null (list r_79_1@@0 i_15@@0))) (- (U_2_real (MapType1Select Mask@0 null (list r_79_1@@0 i_15@@0))) FullPerm)))))
 :qid |stdinbpl.2143:26|
 :skolemid |264|
 :pattern ( (MapType1Select QPMask@15 null (list r_79_1@@0 i_15@@0)))
))) (and (forall ((r_79_1@@1 T@U) (i_15@@1 Int) ) (!  (=> (and (= (type r_79_1@@1) RefType) (not (and (and (and (U_2_bool (MapType2Select lists (invRecv26 r_79_1@@1 i_15@@1))) (not (U_2_bool (MapType2Select lists (invRecv26 r_79_1@@1 i_15@@1))))) (< NoPerm FullPerm)) (qpRange26 r_79_1@@1 i_15@@1)))) (= (U_2_real (MapType1Select QPMask@15 null (list r_79_1@@1 i_15@@1))) (U_2_real (MapType1Select Mask@0 null (list r_79_1@@1 i_15@@1)))))
 :qid |stdinbpl.2147:26|
 :skolemid |265|
 :pattern ( (MapType1Select QPMask@15 null (list r_79_1@@1 i_15@@1)))
)) (forall ((o_4@@55 T@U) (f_5@@27 T@U) ) (! (let ((B@@40 (FieldTypeInv1 (type f_5@@27))))
(let ((A@@41 (FieldTypeInv0 (type f_5@@27))))
 (=> (and (and (= (type o_4@@55) RefType) (= (type f_5@@27) (FieldType A@@41 B@@40))) (or (or (not (= o_4@@55 null)) (not (IsPredicateField f_5@@27))) (not (= (getPredWandId f_5@@27) 0)))) (= (U_2_real (MapType1Select Mask@0 o_4@@55 f_5@@27)) (U_2_real (MapType1Select QPMask@15 o_4@@55 f_5@@27))))))
 :qid |stdinbpl.2153:33|
 :skolemid |266|
 :pattern ( (MapType1Select Mask@0 o_4@@55 f_5@@27))
 :pattern ( (MapType1Select QPMask@15 o_4@@55 f_5@@27))
)))) (and (and (=> (= (ControlFlow 0 172) 169) anon195_Else_correct) (=> (= (ControlFlow 0 172) 43) anon196_Then_correct)) (=> (= (ControlFlow 0 172) 45) anon196_Else_correct)))))))))))
(let ((anon194_Else_correct  (=> (and (and (>= 0 (- length 1)) (= Mask@0 QPMask@12)) (and (= Heap@0 ExhaleHeap@0) (= (ControlFlow 0 180) 172))) anon73_correct)))
(let ((anon194_Then_correct  (=> (and (> (- length 1) 0) (= arg_length@0 (- length 1))) (and (=> (= (ControlFlow 0 175) (- 0 179)) (> arg_length@0 0)) (=> (> arg_length@0 0) (and (=> (= (ControlFlow 0 175) (- 0 178)) (forall ((r_72 T@U) (r_72_1 T@U) ) (!  (=> (and (= (type r_72) RefType) (= (type r_72_1) RefType)) (=> (and (and (and (and (not (= r_72 r_72_1)) (U_2_bool (MapType2Select sNext@1 r_72))) (U_2_bool (MapType2Select sNext@1 r_72_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (or (not (= r_72 r_72_1)) (not (= arg_length@0 arg_length@0)))))
 :qid |stdinbpl.2012:23|
 :skolemid |246|
 :pattern ( (neverTriggered24 r_72) (neverTriggered24 r_72_1))
))) (=> (forall ((r_72@@0 T@U) (r_72_1@@0 T@U) ) (!  (=> (and (= (type r_72@@0) RefType) (= (type r_72_1@@0) RefType)) (=> (and (and (and (and (not (= r_72@@0 r_72_1@@0)) (U_2_bool (MapType2Select sNext@1 r_72@@0))) (U_2_bool (MapType2Select sNext@1 r_72_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (or (not (= r_72@@0 r_72_1@@0)) (not (= arg_length@0 arg_length@0)))))
 :qid |stdinbpl.2012:23|
 :skolemid |246|
 :pattern ( (neverTriggered24 r_72@@0) (neverTriggered24 r_72_1@@0))
)) (and (=> (= (ControlFlow 0 175) (- 0 177)) (forall ((r_72@@1 T@U) ) (!  (=> (and (= (type r_72@@1) RefType) (U_2_bool (MapType2Select sNext@1 r_72@@1))) (>= (U_2_real (MapType1Select QPMask@12 null (list r_72@@1 arg_length@0))) FullPerm))
 :qid |stdinbpl.2019:23|
 :skolemid |247|
 :pattern ( (MapType0Select ExhaleHeap@0 null (list r_72@@1 arg_length@0)))
 :pattern ( (MapType1Select QPMask@12 null (list r_72@@1 arg_length@0)))
 :pattern ( (MapType2Select sNext@1 r_72@@1))
))) (=> (forall ((r_72@@2 T@U) ) (!  (=> (and (= (type r_72@@2) RefType) (U_2_bool (MapType2Select sNext@1 r_72@@2))) (>= (U_2_real (MapType1Select QPMask@12 null (list r_72@@2 arg_length@0))) FullPerm))
 :qid |stdinbpl.2019:23|
 :skolemid |247|
 :pattern ( (MapType0Select ExhaleHeap@0 null (list r_72@@2 arg_length@0)))
 :pattern ( (MapType1Select QPMask@12 null (list r_72@@2 arg_length@0)))
 :pattern ( (MapType2Select sNext@1 r_72@@2))
)) (=> (and (forall ((r_72@@3 T@U) ) (!  (=> (= (type r_72@@3) RefType) (=> (and (U_2_bool (MapType2Select sNext@1 r_72@@3)) (< NoPerm FullPerm)) (and (= (invRecv24 r_72@@3 arg_length@0) r_72@@3) (qpRange24 r_72@@3 arg_length@0))))
 :qid |stdinbpl.2025:28|
 :skolemid |248|
 :pattern ( (MapType0Select ExhaleHeap@0 null (list r_72@@3 arg_length@0)))
 :pattern ( (MapType1Select QPMask@12 null (list r_72@@3 arg_length@0)))
 :pattern ( (MapType2Select sNext@1 r_72@@3))
)) (forall ((r_73_1 T@U) (i_13 Int) ) (!  (=> (= (type r_73_1) RefType) (=> (and (and (U_2_bool (MapType2Select sNext@1 (invRecv24 r_73_1 i_13))) (< NoPerm FullPerm)) (qpRange24 r_73_1 i_13)) (and (= (invRecv24 r_73_1 i_13) r_73_1) (= arg_length@0 i_13))))
 :qid |stdinbpl.2029:28|
 :skolemid |249|
 :pattern ( (invRecv24 r_73_1 i_13))
))) (=> (and (and (forall ((r_73_1@@0 T@U) (i_13@@0 Int) ) (!  (=> (= (type r_73_1@@0) RefType) (=> (and (and (U_2_bool (MapType2Select sNext@1 (invRecv24 r_73_1@@0 i_13@@0))) (< NoPerm FullPerm)) (qpRange24 r_73_1@@0 i_13@@0)) (and (and (= (invRecv24 r_73_1@@0 i_13@@0) r_73_1@@0) (= arg_length@0 i_13@@0)) (= (U_2_real (MapType1Select QPMask@13 null (list r_73_1@@0 i_13@@0))) (- (U_2_real (MapType1Select QPMask@12 null (list r_73_1@@0 i_13@@0))) FullPerm)))))
 :qid |stdinbpl.2035:28|
 :skolemid |250|
 :pattern ( (MapType1Select QPMask@13 null (list r_73_1@@0 i_13@@0)))
)) (forall ((r_73_1@@1 T@U) (i_13@@1 Int) ) (!  (=> (and (= (type r_73_1@@1) RefType) (not (and (and (U_2_bool (MapType2Select sNext@1 (invRecv24 r_73_1@@1 i_13@@1))) (< NoPerm FullPerm)) (qpRange24 r_73_1@@1 i_13@@1)))) (= (U_2_real (MapType1Select QPMask@13 null (list r_73_1@@1 i_13@@1))) (U_2_real (MapType1Select QPMask@12 null (list r_73_1@@1 i_13@@1)))))
 :qid |stdinbpl.2039:28|
 :skolemid |251|
 :pattern ( (MapType1Select QPMask@13 null (list r_73_1@@1 i_13@@1)))
))) (and (forall ((o_4@@56 T@U) (f_5@@28 T@U) ) (! (let ((B@@41 (FieldTypeInv1 (type f_5@@28))))
(let ((A@@42 (FieldTypeInv0 (type f_5@@28))))
 (=> (and (and (= (type o_4@@56) RefType) (= (type f_5@@28) (FieldType A@@42 B@@41))) (or (or (not (= o_4@@56 null)) (not (IsPredicateField f_5@@28))) (not (= (getPredWandId f_5@@28) 0)))) (= (U_2_real (MapType1Select QPMask@12 o_4@@56 f_5@@28)) (U_2_real (MapType1Select QPMask@13 o_4@@56 f_5@@28))))))
 :qid |stdinbpl.2045:35|
 :skolemid |252|
 :pattern ( (MapType1Select QPMask@12 o_4@@56 f_5@@28))
 :pattern ( (MapType1Select QPMask@13 o_4@@56 f_5@@28))
)) (IdenticalOnKnownLocations ExhaleHeap@0 ExhaleHeap@1 QPMask@13))) (and (=> (= (ControlFlow 0 175) (- 0 176)) (forall ((r_74 T@U) (r_74_1 T@U) ) (!  (=> (and (= (type r_74) RefType) (= (type r_74_1) RefType)) (=> (and (and (and (and (not (= r_74 r_74_1)) (U_2_bool (MapType2Select sNext@1 r_74))) (U_2_bool (MapType2Select sNext@1 r_74_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (or (not (= r_74 r_74_1)) (not (= arg_length@0 arg_length@0)))))
 :qid |stdinbpl.2060:23|
 :skolemid |253|
 :pattern ( (neverTriggered25 r_74) (neverTriggered25 r_74_1))
))) (=> (forall ((r_74@@0 T@U) (r_74_1@@0 T@U) ) (!  (=> (and (= (type r_74@@0) RefType) (= (type r_74_1@@0) RefType)) (=> (and (and (and (and (not (= r_74@@0 r_74_1@@0)) (U_2_bool (MapType2Select sNext@1 r_74@@0))) (U_2_bool (MapType2Select sNext@1 r_74_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (or (not (= r_74@@0 r_74_1@@0)) (not (= arg_length@0 arg_length@0)))))
 :qid |stdinbpl.2060:23|
 :skolemid |253|
 :pattern ( (neverTriggered25 r_74@@0) (neverTriggered25 r_74_1@@0))
)) (=> (forall ((r_74@@1 T@U) ) (!  (=> (= (type r_74@@1) RefType) (=> (and (U_2_bool (MapType2Select sNext@1 r_74@@1)) (< NoPerm FullPerm)) (and (= (invRecv25 r_74@@1 arg_length@0) r_74@@1) (qpRange25 r_74@@1 arg_length@0))))
 :qid |stdinbpl.2066:28|
 :skolemid |254|
 :pattern ( (MapType0Select ExhaleHeap@1 null (list r_74@@1 arg_length@0)))
 :pattern ( (MapType1Select QPMask@13 null (list r_74@@1 arg_length@0)))
 :pattern ( (MapType2Select sNext@1 r_74@@1))
)) (=> (and (and (forall ((r_75_1 T@U) (i_14 Int) ) (!  (=> (= (type r_75_1) RefType) (=> (and (and (U_2_bool (MapType2Select sNext@1 (invRecv25 r_75_1 i_14))) (< NoPerm FullPerm)) (qpRange25 r_75_1 i_14)) (and (= (invRecv25 r_75_1 i_14) r_75_1) (= arg_length@0 i_14))))
 :qid |stdinbpl.2070:28|
 :skolemid |255|
 :pattern ( (invRecv25 r_75_1 i_14))
)) (forall ((r_75_1@@0 T@U) (i_14@@0 Int) ) (!  (=> (= (type r_75_1@@0) RefType) (=> (and (and (U_2_bool (MapType2Select sNext@1 (invRecv25 r_75_1@@0 i_14@@0))) (< NoPerm FullPerm)) (qpRange25 r_75_1@@0 i_14@@0)) (and (=> (< NoPerm FullPerm) (and (= (invRecv25 r_75_1@@0 i_14@@0) r_75_1@@0) (= arg_length@0 i_14@@0))) (= (U_2_real (MapType1Select QPMask@14 null (list r_75_1@@0 i_14@@0))) (+ (U_2_real (MapType1Select QPMask@13 null (list r_75_1@@0 i_14@@0))) FullPerm)))))
 :qid |stdinbpl.2076:28|
 :skolemid |256|
 :pattern ( (MapType1Select QPMask@14 null (list r_75_1@@0 i_14@@0)))
))) (and (forall ((o_4@@57 T@U) (f_5@@29 T@U) ) (! (let ((B@@42 (FieldTypeInv1 (type f_5@@29))))
(let ((A@@43 (FieldTypeInv0 (type f_5@@29))))
 (=> (and (and (= (type o_4@@57) RefType) (= (type f_5@@29) (FieldType A@@43 B@@42))) (or (or (not (= o_4@@57 null)) (not (IsPredicateField f_5@@29))) (not (= (getPredWandId f_5@@29) 0)))) (= (U_2_real (MapType1Select QPMask@13 o_4@@57 f_5@@29)) (U_2_real (MapType1Select QPMask@14 o_4@@57 f_5@@29))))))
 :qid |stdinbpl.2082:35|
 :skolemid |257|
 :pattern ( (MapType1Select QPMask@13 o_4@@57 f_5@@29))
 :pattern ( (MapType1Select QPMask@14 o_4@@57 f_5@@29))
)) (forall ((r_75_1@@1 T@U) (i_14@@1 Int) ) (!  (=> (and (= (type r_75_1@@1) RefType) (not (and (and (U_2_bool (MapType2Select sNext@1 (invRecv25 r_75_1@@1 i_14@@1))) (< NoPerm FullPerm)) (qpRange25 r_75_1@@1 i_14@@1)))) (= (U_2_real (MapType1Select QPMask@14 null (list r_75_1@@1 i_14@@1))) (U_2_real (MapType1Select QPMask@13 null (list r_75_1@@1 i_14@@1)))))
 :qid |stdinbpl.2086:28|
 :skolemid |258|
 :pattern ( (MapType1Select QPMask@14 null (list r_75_1@@1 i_14@@1)))
)))) (=> (and (and (and (state ExhaleHeap@1 QPMask@14) (state ExhaleHeap@1 QPMask@14)) (and (forall ((r_77 T@U) ) (!  (=> (and (= (type r_77) RefType) (U_2_bool (MapType2Select sNext@1 r_77))) (allSet ExhaleHeap@1 r_77 arg_length@0 v_2@@3))
 :qid |stdinbpl.2093:26|
 :skolemid |259|
 :pattern ( (MapType2Select sNext@1 r_77))
 :pattern ( (|allSet#frame| (MapType0Select ExhaleHeap@1 null (list r_77 arg_length@0)) r_77 arg_length@0 v_2@@3))
)) (state ExhaleHeap@1 QPMask@14))) (and (and (state ExhaleHeap@1 QPMask@14) (= Mask@0 QPMask@14)) (and (= Heap@0 ExhaleHeap@1) (= (ControlFlow 0 175) 172)))) anon73_correct))))))))))))))))
(let ((anon182_Else_correct  (=> (and (not (> (|Set#Card| s@0) 0)) (state ExhaleHeap@0 QPMask@4)) (and (=> (= (ControlFlow 0 181) (- 0 185)) (forall ((r_62 T@U) (r_62_1 T@U) ) (!  (=> (and (= (type r_62) RefType) (= (type r_62_1) RefType)) (=> (and (and (and (and (not (= r_62 r_62_1)) (U_2_bool (MapType2Select s@0 r_62))) (U_2_bool (MapType2Select s@0 r_62_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (or (not (= r_62 r_62_1)) (not (= length length)))))
 :qid |stdinbpl.1841:19|
 :skolemid |219|
 :pattern ( (neverTriggered20 r_62) (neverTriggered20 r_62_1))
))) (=> (forall ((r_62@@0 T@U) (r_62_1@@0 T@U) ) (!  (=> (and (= (type r_62@@0) RefType) (= (type r_62_1@@0) RefType)) (=> (and (and (and (and (not (= r_62@@0 r_62_1@@0)) (U_2_bool (MapType2Select s@0 r_62@@0))) (U_2_bool (MapType2Select s@0 r_62_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (or (not (= r_62@@0 r_62_1@@0)) (not (= length length)))))
 :qid |stdinbpl.1841:19|
 :skolemid |219|
 :pattern ( (neverTriggered20 r_62@@0) (neverTriggered20 r_62_1@@0))
)) (=> (and (forall ((r_62@@1 T@U) ) (!  (=> (= (type r_62@@1) RefType) (=> (and (U_2_bool (MapType2Select s@0 r_62@@1)) (< NoPerm FullPerm)) (and (= (invRecv20 r_62@@1 length) r_62@@1) (qpRange20 r_62@@1 length))))
 :qid |stdinbpl.1847:24|
 :skolemid |220|
 :pattern ( (MapType0Select ExhaleHeap@0 null (list r_62@@1 length)))
 :pattern ( (MapType1Select QPMask@4 null (list r_62@@1 length)))
 :pattern ( (MapType2Select s@0 r_62@@1))
)) (forall ((r_63_1 T@U) (i_11 Int) ) (!  (=> (= (type r_63_1) RefType) (=> (and (and (U_2_bool (MapType2Select s@0 (invRecv20 r_63_1 i_11))) (< NoPerm FullPerm)) (qpRange20 r_63_1 i_11)) (and (= (invRecv20 r_63_1 i_11) r_63_1) (= length i_11))))
 :qid |stdinbpl.1851:24|
 :skolemid |221|
 :pattern ( (invRecv20 r_63_1 i_11))
))) (=> (and (and (forall ((r_63_1@@0 T@U) (i_11@@0 Int) ) (!  (=> (= (type r_63_1@@0) RefType) (=> (and (and (U_2_bool (MapType2Select s@0 (invRecv20 r_63_1@@0 i_11@@0))) (< NoPerm FullPerm)) (qpRange20 r_63_1@@0 i_11@@0)) (and (=> (< NoPerm FullPerm) (and (= (invRecv20 r_63_1@@0 i_11@@0) r_63_1@@0) (= length i_11@@0))) (= (U_2_real (MapType1Select QPMask@9 null (list r_63_1@@0 i_11@@0))) (+ (U_2_real (MapType1Select QPMask@4 null (list r_63_1@@0 i_11@@0))) FullPerm)))))
 :qid |stdinbpl.1857:24|
 :skolemid |222|
 :pattern ( (MapType1Select QPMask@9 null (list r_63_1@@0 i_11@@0)))
)) (forall ((o_4@@58 T@U) (f_5@@30 T@U) ) (! (let ((B@@43 (FieldTypeInv1 (type f_5@@30))))
(let ((A@@44 (FieldTypeInv0 (type f_5@@30))))
 (=> (and (and (= (type o_4@@58) RefType) (= (type f_5@@30) (FieldType A@@44 B@@43))) (or (or (not (= o_4@@58 null)) (not (IsPredicateField f_5@@30))) (not (= (getPredWandId f_5@@30) 0)))) (= (U_2_real (MapType1Select QPMask@4 o_4@@58 f_5@@30)) (U_2_real (MapType1Select QPMask@9 o_4@@58 f_5@@30))))))
 :qid |stdinbpl.1863:31|
 :skolemid |223|
 :pattern ( (MapType1Select QPMask@4 o_4@@58 f_5@@30))
 :pattern ( (MapType1Select QPMask@9 o_4@@58 f_5@@30))
))) (and (forall ((r_63_1@@1 T@U) (i_11@@1 Int) ) (!  (=> (and (= (type r_63_1@@1) RefType) (not (and (and (U_2_bool (MapType2Select s@0 (invRecv20 r_63_1@@1 i_11@@1))) (< NoPerm FullPerm)) (qpRange20 r_63_1@@1 i_11@@1)))) (= (U_2_real (MapType1Select QPMask@9 null (list r_63_1@@1 i_11@@1))) (U_2_real (MapType1Select QPMask@4 null (list r_63_1@@1 i_11@@1)))))
 :qid |stdinbpl.1867:24|
 :skolemid |224|
 :pattern ( (MapType1Select QPMask@9 null (list r_63_1@@1 i_11@@1)))
)) (state ExhaleHeap@0 QPMask@9))) (and (=> (= (ControlFlow 0 181) (- 0 184)) (forall ((r_65 T@U) (r_65_1 T@U) ) (!  (=> (and (= (type r_65) RefType) (= (type r_65_1) RefType)) (=> (and (and (and (and (not (= r_65 r_65_1)) (and (U_2_bool (MapType2Select lists r_65)) (not (U_2_bool (MapType2Select s@0 r_65))))) (and (U_2_bool (MapType2Select lists r_65_1)) (not (U_2_bool (MapType2Select s@0 r_65_1))))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= r_65 r_65_1))))
 :qid |stdinbpl.1875:17|
 :skolemid |225|
 :no-pattern (type r_65)
 :no-pattern (type r_65_1)
 :no-pattern (U_2_int r_65)
 :no-pattern (U_2_bool r_65)
 :no-pattern (U_2_int r_65_1)
 :no-pattern (U_2_bool r_65_1)
))) (=> (forall ((r_65@@0 T@U) (r_65_1@@0 T@U) ) (!  (=> (and (= (type r_65@@0) RefType) (= (type r_65_1@@0) RefType)) (=> (and (and (and (and (not (= r_65@@0 r_65_1@@0)) (and (U_2_bool (MapType2Select lists r_65@@0)) (not (U_2_bool (MapType2Select s@0 r_65@@0))))) (and (U_2_bool (MapType2Select lists r_65_1@@0)) (not (U_2_bool (MapType2Select s@0 r_65_1@@0))))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= r_65@@0 r_65_1@@0))))
 :qid |stdinbpl.1875:17|
 :skolemid |225|
 :no-pattern (type r_65@@0)
 :no-pattern (type r_65_1@@0)
 :no-pattern (U_2_int r_65@@0)
 :no-pattern (U_2_bool r_65@@0)
 :no-pattern (U_2_int r_65_1@@0)
 :no-pattern (U_2_bool r_65_1@@0)
)) (=> (and (forall ((r_65@@1 T@U) ) (!  (=> (= (type r_65@@1) RefType) (=> (and (and (U_2_bool (MapType2Select lists r_65@@1)) (not (U_2_bool (MapType2Select s@0 r_65@@1)))) (< NoPerm FullPerm)) (and (qpRange21 r_65@@1) (= (invRecv21 r_65@@1) r_65@@1))))
 :qid |stdinbpl.1881:24|
 :skolemid |226|
 :pattern ( (MapType0Select ExhaleHeap@0 r_65@@1 next))
 :pattern ( (MapType1Select QPMask@10 r_65@@1 next))
 :pattern ( (MapType2Select lists r_65@@1))
 :pattern ( (MapType2Select s@0 r_65@@1))
)) (forall ((o_4@@59 T@U) ) (!  (=> (= (type o_4@@59) RefType) (=> (and (and (and (U_2_bool (MapType2Select lists (invRecv21 o_4@@59))) (not (U_2_bool (MapType2Select s@0 (invRecv21 o_4@@59))))) (< NoPerm FullPerm)) (qpRange21 o_4@@59)) (= (invRecv21 o_4@@59) o_4@@59)))
 :qid |stdinbpl.1885:24|
 :skolemid |227|
 :pattern ( (invRecv21 o_4@@59))
))) (=> (and (and (forall ((r_65@@2 T@U) ) (!  (=> (= (type r_65@@2) RefType) (=> (and (U_2_bool (MapType2Select lists r_65@@2)) (not (U_2_bool (MapType2Select s@0 r_65@@2)))) (not (= r_65@@2 null))))
 :qid |stdinbpl.1891:24|
 :skolemid |228|
 :pattern ( (MapType0Select ExhaleHeap@0 r_65@@2 next))
 :pattern ( (MapType1Select QPMask@10 r_65@@2 next))
 :pattern ( (MapType2Select lists r_65@@2))
 :pattern ( (MapType2Select s@0 r_65@@2))
)) (forall ((o_4@@60 T@U) ) (!  (=> (= (type o_4@@60) RefType) (and (=> (and (and (and (U_2_bool (MapType2Select lists (invRecv21 o_4@@60))) (not (U_2_bool (MapType2Select s@0 (invRecv21 o_4@@60))))) (< NoPerm FullPerm)) (qpRange21 o_4@@60)) (and (=> (< NoPerm FullPerm) (= (invRecv21 o_4@@60) o_4@@60)) (= (U_2_real (MapType1Select QPMask@10 o_4@@60 next)) (+ (U_2_real (MapType1Select QPMask@9 o_4@@60 next)) FullPerm)))) (=> (not (and (and (and (U_2_bool (MapType2Select lists (invRecv21 o_4@@60))) (not (U_2_bool (MapType2Select s@0 (invRecv21 o_4@@60))))) (< NoPerm FullPerm)) (qpRange21 o_4@@60))) (= (U_2_real (MapType1Select QPMask@10 o_4@@60 next)) (U_2_real (MapType1Select QPMask@9 o_4@@60 next))))))
 :qid |stdinbpl.1897:24|
 :skolemid |229|
 :pattern ( (MapType1Select QPMask@10 o_4@@60 next))
))) (and (forall ((o_4@@61 T@U) (f_5@@31 T@U) ) (! (let ((B@@44 (FieldTypeInv1 (type f_5@@31))))
(let ((A@@45 (FieldTypeInv0 (type f_5@@31))))
 (=> (and (and (= (type o_4@@61) RefType) (= (type f_5@@31) (FieldType A@@45 B@@44))) (not (= f_5@@31 next))) (= (U_2_real (MapType1Select QPMask@9 o_4@@61 f_5@@31)) (U_2_real (MapType1Select QPMask@10 o_4@@61 f_5@@31))))))
 :qid |stdinbpl.1901:31|
 :skolemid |230|
 :pattern ( (MapType1Select QPMask@9 o_4@@61 f_5@@31))
 :pattern ( (MapType1Select QPMask@10 o_4@@61 f_5@@31))
)) (state ExhaleHeap@0 QPMask@10))) (and (=> (= (ControlFlow 0 181) (- 0 183)) (forall ((r_66 T@U) (r_66_1 T@U) ) (!  (=> (and (= (type r_66) RefType) (= (type r_66_1) RefType)) (=> (and (and (and (and (not (= r_66 r_66_1)) (U_2_bool (MapType2Select sNext@1 r_66))) (U_2_bool (MapType2Select sNext@1 r_66_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (or (not (= r_66 r_66_1)) (not (= (- length 1) (- length 1))))))
 :qid |stdinbpl.1911:19|
 :skolemid |231|
 :pattern ( (neverTriggered22 r_66) (neverTriggered22 r_66_1))
))) (=> (forall ((r_66@@0 T@U) (r_66_1@@0 T@U) ) (!  (=> (and (= (type r_66@@0) RefType) (= (type r_66_1@@0) RefType)) (=> (and (and (and (and (not (= r_66@@0 r_66_1@@0)) (U_2_bool (MapType2Select sNext@1 r_66@@0))) (U_2_bool (MapType2Select sNext@1 r_66_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (or (not (= r_66@@0 r_66_1@@0)) (not (= (- length 1) (- length 1))))))
 :qid |stdinbpl.1911:19|
 :skolemid |231|
 :pattern ( (neverTriggered22 r_66@@0) (neverTriggered22 r_66_1@@0))
)) (=> (and (forall ((r_66@@1 T@U) ) (!  (=> (= (type r_66@@1) RefType) (=> (and (U_2_bool (MapType2Select sNext@1 r_66@@1)) (< NoPerm FullPerm)) (and (= (invRecv22 r_66@@1 (- length 1)) r_66@@1) (qpRange22 r_66@@1 (- length 1)))))
 :qid |stdinbpl.1917:24|
 :skolemid |232|
 :pattern ( (MapType2Select sNext@1 r_66@@1))
)) (forall ((r_67_1 T@U) (i_12 Int) ) (!  (=> (= (type r_67_1) RefType) (=> (and (and (U_2_bool (MapType2Select sNext@1 (invRecv22 r_67_1 i_12))) (< NoPerm FullPerm)) (qpRange22 r_67_1 i_12)) (and (= (invRecv22 r_67_1 i_12) r_67_1) (= (- length 1) i_12))))
 :qid |stdinbpl.1921:24|
 :skolemid |233|
 :pattern ( (invRecv22 r_67_1 i_12))
))) (=> (and (and (forall ((r_67_1@@0 T@U) (i_12@@0 Int) ) (!  (=> (= (type r_67_1@@0) RefType) (=> (and (and (U_2_bool (MapType2Select sNext@1 (invRecv22 r_67_1@@0 i_12@@0))) (< NoPerm FullPerm)) (qpRange22 r_67_1@@0 i_12@@0)) (and (=> (< NoPerm FullPerm) (and (= (invRecv22 r_67_1@@0 i_12@@0) r_67_1@@0) (= (- length 1) i_12@@0))) (= (U_2_real (MapType1Select QPMask@11 null (list r_67_1@@0 i_12@@0))) (+ (U_2_real (MapType1Select QPMask@10 null (list r_67_1@@0 i_12@@0))) FullPerm)))))
 :qid |stdinbpl.1927:24|
 :skolemid |234|
 :pattern ( (MapType1Select QPMask@11 null (list r_67_1@@0 i_12@@0)))
)) (forall ((o_4@@62 T@U) (f_5@@32 T@U) ) (! (let ((B@@45 (FieldTypeInv1 (type f_5@@32))))
(let ((A@@46 (FieldTypeInv0 (type f_5@@32))))
 (=> (and (and (= (type o_4@@62) RefType) (= (type f_5@@32) (FieldType A@@46 B@@45))) (or (or (not (= o_4@@62 null)) (not (IsPredicateField f_5@@32))) (not (= (getPredWandId f_5@@32) 0)))) (= (U_2_real (MapType1Select QPMask@10 o_4@@62 f_5@@32)) (U_2_real (MapType1Select QPMask@11 o_4@@62 f_5@@32))))))
 :qid |stdinbpl.1933:31|
 :skolemid |235|
 :pattern ( (MapType1Select QPMask@10 o_4@@62 f_5@@32))
 :pattern ( (MapType1Select QPMask@11 o_4@@62 f_5@@32))
))) (and (forall ((r_67_1@@1 T@U) (i_12@@1 Int) ) (!  (=> (and (= (type r_67_1@@1) RefType) (not (and (and (U_2_bool (MapType2Select sNext@1 (invRecv22 r_67_1@@1 i_12@@1))) (< NoPerm FullPerm)) (qpRange22 r_67_1@@1 i_12@@1)))) (= (U_2_real (MapType1Select QPMask@11 null (list r_67_1@@1 i_12@@1))) (U_2_real (MapType1Select QPMask@10 null (list r_67_1@@1 i_12@@1)))))
 :qid |stdinbpl.1937:24|
 :skolemid |236|
 :pattern ( (MapType1Select QPMask@11 null (list r_67_1@@1 i_12@@1)))
)) (state ExhaleHeap@0 QPMask@11))) (and (=> (= (ControlFlow 0 181) (- 0 182)) (forall ((r_69 T@U) (r_69_1 T@U) ) (!  (=> (and (= (type r_69) RefType) (= (type r_69_1) RefType)) (=> (and (and (and (and (not (= r_69 r_69_1)) (and (U_2_bool (MapType2Select lists r_69)) (not (U_2_bool (MapType2Select s@0 r_69))))) (and (U_2_bool (MapType2Select lists r_69_1)) (not (U_2_bool (MapType2Select s@0 r_69_1))))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= r_69 r_69_1))))
 :qid |stdinbpl.1945:17|
 :skolemid |237|
 :no-pattern (type r_69)
 :no-pattern (type r_69_1)
 :no-pattern (U_2_int r_69)
 :no-pattern (U_2_bool r_69)
 :no-pattern (U_2_int r_69_1)
 :no-pattern (U_2_bool r_69_1)
))) (=> (forall ((r_69@@0 T@U) (r_69_1@@0 T@U) ) (!  (=> (and (= (type r_69@@0) RefType) (= (type r_69_1@@0) RefType)) (=> (and (and (and (and (not (= r_69@@0 r_69_1@@0)) (and (U_2_bool (MapType2Select lists r_69@@0)) (not (U_2_bool (MapType2Select s@0 r_69@@0))))) (and (U_2_bool (MapType2Select lists r_69_1@@0)) (not (U_2_bool (MapType2Select s@0 r_69_1@@0))))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= r_69@@0 r_69_1@@0))))
 :qid |stdinbpl.1945:17|
 :skolemid |237|
 :no-pattern (type r_69@@0)
 :no-pattern (type r_69_1@@0)
 :no-pattern (U_2_int r_69@@0)
 :no-pattern (U_2_bool r_69@@0)
 :no-pattern (U_2_int r_69_1@@0)
 :no-pattern (U_2_bool r_69_1@@0)
)) (=> (forall ((r_69@@1 T@U) ) (!  (=> (= (type r_69@@1) RefType) (=> (and (and (U_2_bool (MapType2Select lists r_69@@1)) (not (U_2_bool (MapType2Select s@0 r_69@@1)))) (< NoPerm FullPerm)) (and (qpRange23 r_69@@1) (= (invRecv23 r_69@@1) r_69@@1))))
 :qid |stdinbpl.1951:24|
 :skolemid |238|
 :pattern ( (MapType0Select ExhaleHeap@0 r_69@@1 val))
 :pattern ( (MapType1Select QPMask@12 r_69@@1 val))
 :pattern ( (MapType2Select lists r_69@@1))
 :pattern ( (MapType2Select s@0 r_69@@1))
)) (=> (and (forall ((o_4@@63 T@U) ) (!  (=> (= (type o_4@@63) RefType) (=> (and (and (and (U_2_bool (MapType2Select lists (invRecv23 o_4@@63))) (not (U_2_bool (MapType2Select s@0 (invRecv23 o_4@@63))))) (< NoPerm FullPerm)) (qpRange23 o_4@@63)) (= (invRecv23 o_4@@63) o_4@@63)))
 :qid |stdinbpl.1955:24|
 :skolemid |239|
 :pattern ( (invRecv23 o_4@@63))
)) (forall ((r_69@@2 T@U) ) (!  (=> (= (type r_69@@2) RefType) (=> (and (U_2_bool (MapType2Select lists r_69@@2)) (not (U_2_bool (MapType2Select s@0 r_69@@2)))) (not (= r_69@@2 null))))
 :qid |stdinbpl.1961:24|
 :skolemid |240|
 :pattern ( (MapType0Select ExhaleHeap@0 r_69@@2 val))
 :pattern ( (MapType1Select QPMask@12 r_69@@2 val))
 :pattern ( (MapType2Select lists r_69@@2))
 :pattern ( (MapType2Select s@0 r_69@@2))
))) (=> (and (and (and (forall ((o_4@@64 T@U) ) (!  (=> (= (type o_4@@64) RefType) (and (=> (and (and (and (U_2_bool (MapType2Select lists (invRecv23 o_4@@64))) (not (U_2_bool (MapType2Select s@0 (invRecv23 o_4@@64))))) (< NoPerm FullPerm)) (qpRange23 o_4@@64)) (and (=> (< NoPerm FullPerm) (= (invRecv23 o_4@@64) o_4@@64)) (= (U_2_real (MapType1Select QPMask@12 o_4@@64 val)) (+ (U_2_real (MapType1Select QPMask@11 o_4@@64 val)) FullPerm)))) (=> (not (and (and (and (U_2_bool (MapType2Select lists (invRecv23 o_4@@64))) (not (U_2_bool (MapType2Select s@0 (invRecv23 o_4@@64))))) (< NoPerm FullPerm)) (qpRange23 o_4@@64))) (= (U_2_real (MapType1Select QPMask@12 o_4@@64 val)) (U_2_real (MapType1Select QPMask@11 o_4@@64 val))))))
 :qid |stdinbpl.1967:24|
 :skolemid |241|
 :pattern ( (MapType1Select QPMask@12 o_4@@64 val))
)) (forall ((o_4@@65 T@U) (f_5@@33 T@U) ) (! (let ((B@@46 (FieldTypeInv1 (type f_5@@33))))
(let ((A@@47 (FieldTypeInv0 (type f_5@@33))))
 (=> (and (and (= (type o_4@@65) RefType) (= (type f_5@@33) (FieldType A@@47 B@@46))) (not (= f_5@@33 val))) (= (U_2_real (MapType1Select QPMask@11 o_4@@65 f_5@@33)) (U_2_real (MapType1Select QPMask@12 o_4@@65 f_5@@33))))))
 :qid |stdinbpl.1971:31|
 :skolemid |242|
 :pattern ( (MapType1Select QPMask@11 o_4@@65 f_5@@33))
 :pattern ( (MapType1Select QPMask@12 o_4@@65 f_5@@33))
))) (and (state ExhaleHeap@0 QPMask@12) (forall ((r_70 T@U) ) (!  (=> (= (type r_70) RefType) (=> (and (U_2_bool (MapType2Select lists r_70)) (not (U_2_bool (MapType2Select s@0 r_70)))) (= (U_2_int (MapType0Select ExhaleHeap@0 r_70 val)) v_2@@3)))
 :qid |stdinbpl.1977:22|
 :skolemid |243|
 :pattern ( (MapType2Select lists r_70))
 :pattern ( (MapType2Select s@0 r_70))
)))) (and (and (forall ((r_71 T@U) ) (!  (=> (= (type r_71) RefType) (=> (and (U_2_bool (MapType2Select lists r_71)) (not (U_2_bool (MapType2Select s@0 r_71)))) (U_2_bool (MapType2Select sNext@1 (MapType0Select ExhaleHeap@0 r_71 next)))))
 :qid |stdinbpl.1981:22|
 :skolemid |244|
 :pattern ( (MapType2Select lists r_71))
 :pattern ( (MapType2Select s@0 r_71))
 :pattern ( (MapType2Select sNext@1 (MapType0Select ExhaleHeap@0 r_71 next)))
)) (forall ((r1_7 T@U) (r2_7 T@U) ) (!  (=> (and (and (= (type r1_7) RefType) (= (type r2_7) RefType)) (and (U_2_bool (MapType2Select lists r1_7)) (and (not (U_2_bool (MapType2Select s@0 r1_7))) (and (U_2_bool (MapType2Select lists r2_7)) (and (not (U_2_bool (MapType2Select s@0 r2_7))) (not (= r1_7 r2_7))))))) (not (= (MapType0Select ExhaleHeap@0 r1_7 next) (MapType0Select ExhaleHeap@0 r2_7 next))))
 :qid |stdinbpl.1985:22|
 :skolemid |245|
 :pattern ( (MapType2Select lists r1_7) (MapType2Select lists r2_7))
 :pattern ( (MapType2Select lists r1_7) (MapType2Select s@0 r2_7))
 :pattern ( (MapType2Select s@0 r1_7) (MapType2Select lists r2_7))
 :pattern ( (MapType2Select s@0 r1_7) (MapType2Select s@0 r2_7))
))) (and (state ExhaleHeap@0 QPMask@12) (state ExhaleHeap@0 QPMask@12)))) (and (=> (= (ControlFlow 0 181) 175) anon194_Then_correct) (=> (= (ControlFlow 0 181) 180) anon194_Else_correct))))))))))))))))))))))
(let ((anon45_correct true))
(let ((anon181_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select lists r1_1)) (and (not (U_2_bool (MapType2Select s@0 r1_1))) (and (U_2_bool (MapType2Select lists r2_1)) (and (not (U_2_bool (MapType2Select s@0 r2_1))) (not (= r1_1 r2_1))))))) (= (ControlFlow 0 31) 27)) anon45_correct)))
(let ((anon181_Then_correct  (=> (and (U_2_bool (MapType2Select lists r1_1)) (and (not (U_2_bool (MapType2Select s@0 r1_1))) (and (U_2_bool (MapType2Select lists r2_1)) (and (not (U_2_bool (MapType2Select s@0 r2_1))) (not (= r1_1 r2_1)))))) (and (=> (= (ControlFlow 0 28) (- 0 30)) (HasDirectPerm QPMask@43 r1_1 next)) (=> (HasDirectPerm QPMask@43 r1_1 next) (and (=> (= (ControlFlow 0 28) (- 0 29)) (HasDirectPerm QPMask@43 r2_1 next)) (=> (HasDirectPerm QPMask@43 r2_1 next) (=> (= (ControlFlow 0 28) 27) anon45_correct))))))))
(let ((anon180_Else_correct true))
(let ((anon178_Else_correct  (=> (and (forall ((r_39 T@U) ) (!  (=> (= (type r_39) RefType) (=> (and (U_2_bool (MapType2Select lists r_39)) (not (U_2_bool (MapType2Select s@0 r_39)))) (U_2_bool (MapType2Select sNext@1 (MapType0Select ExhaleHeap@0 r_39 next)))))
 :qid |stdinbpl.1344:24|
 :skolemid |160|
 :pattern ( (MapType2Select lists r_39))
 :pattern ( (MapType2Select s@0 r_39))
 :pattern ( (MapType2Select sNext@1 (MapType0Select ExhaleHeap@0 r_39 next)))
)) (state ExhaleHeap@0 QPMask@43)) (and (and (=> (= (ControlFlow 0 32) 26) anon180_Else_correct) (=> (= (ControlFlow 0 32) 28) anon181_Then_correct)) (=> (= (ControlFlow 0 32) 31) anon181_Else_correct)))))
(let ((anon41_correct true))
(let ((anon179_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select lists r_6)) (not (U_2_bool (MapType2Select s@0 r_6))))) (= (ControlFlow 0 25) 22)) anon41_correct)))
(let ((anon179_Then_correct  (=> (and (U_2_bool (MapType2Select lists r_6)) (not (U_2_bool (MapType2Select s@0 r_6)))) (and (=> (= (ControlFlow 0 23) (- 0 24)) (HasDirectPerm QPMask@43 r_6 next)) (=> (HasDirectPerm QPMask@43 r_6 next) (=> (= (ControlFlow 0 23) 22) anon41_correct))))))
(let ((anon176_Else_correct  (=> (and (forall ((r_37 T@U) ) (!  (=> (= (type r_37) RefType) (=> (and (U_2_bool (MapType2Select lists r_37)) (not (U_2_bool (MapType2Select s@0 r_37)))) (= (U_2_int (MapType0Select ExhaleHeap@0 r_37 val)) v_2@@3)))
 :qid |stdinbpl.1330:24|
 :skolemid |159|
 :pattern ( (MapType2Select lists r_37))
 :pattern ( (MapType2Select s@0 r_37))
)) (state ExhaleHeap@0 QPMask@43)) (and (and (=> (= (ControlFlow 0 33) 32) anon178_Else_correct) (=> (= (ControlFlow 0 33) 23) anon179_Then_correct)) (=> (= (ControlFlow 0 33) 25) anon179_Else_correct)))))
(let ((anon37_correct true))
(let ((anon177_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select lists r_4)) (not (U_2_bool (MapType2Select s@0 r_4))))) (= (ControlFlow 0 21) 18)) anon37_correct)))
(let ((anon177_Then_correct  (=> (and (U_2_bool (MapType2Select lists r_4)) (not (U_2_bool (MapType2Select s@0 r_4)))) (and (=> (= (ControlFlow 0 19) (- 0 20)) (HasDirectPerm QPMask@43 r_4 val)) (=> (HasDirectPerm QPMask@43 r_4 val) (=> (= (ControlFlow 0 19) 18) anon37_correct))))))
(let ((anon175_Else_correct  (and (=> (= (ControlFlow 0 34) (- 0 35)) (forall ((r_35 T@U) (r_35_1 T@U) ) (!  (=> (and (= (type r_35) RefType) (= (type r_35_1) RefType)) (=> (and (and (and (and (not (= r_35 r_35_1)) (and (U_2_bool (MapType2Select lists r_35)) (not (U_2_bool (MapType2Select s@0 r_35))))) (and (U_2_bool (MapType2Select lists r_35_1)) (not (U_2_bool (MapType2Select s@0 r_35_1))))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= r_35 r_35_1))))
 :qid |stdinbpl.1289:19|
 :skolemid |153|
 :no-pattern (type r_35)
 :no-pattern (type r_35_1)
 :no-pattern (U_2_int r_35)
 :no-pattern (U_2_bool r_35)
 :no-pattern (U_2_int r_35_1)
 :no-pattern (U_2_bool r_35_1)
))) (=> (forall ((r_35@@0 T@U) (r_35_1@@0 T@U) ) (!  (=> (and (= (type r_35@@0) RefType) (= (type r_35_1@@0) RefType)) (=> (and (and (and (and (not (= r_35@@0 r_35_1@@0)) (and (U_2_bool (MapType2Select lists r_35@@0)) (not (U_2_bool (MapType2Select s@0 r_35@@0))))) (and (U_2_bool (MapType2Select lists r_35_1@@0)) (not (U_2_bool (MapType2Select s@0 r_35_1@@0))))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= r_35@@0 r_35_1@@0))))
 :qid |stdinbpl.1289:19|
 :skolemid |153|
 :no-pattern (type r_35@@0)
 :no-pattern (type r_35_1@@0)
 :no-pattern (U_2_int r_35@@0)
 :no-pattern (U_2_bool r_35@@0)
 :no-pattern (U_2_int r_35_1@@0)
 :no-pattern (U_2_bool r_35_1@@0)
)) (=> (and (forall ((r_35@@1 T@U) ) (!  (=> (= (type r_35@@1) RefType) (=> (and (and (U_2_bool (MapType2Select lists r_35@@1)) (not (U_2_bool (MapType2Select s@0 r_35@@1)))) (< NoPerm FullPerm)) (and (qpRange11 r_35@@1) (= (invRecv11 r_35@@1) r_35@@1))))
 :qid |stdinbpl.1295:26|
 :skolemid |154|
 :pattern ( (MapType0Select ExhaleHeap@0 r_35@@1 val))
 :pattern ( (MapType1Select QPMask@43 r_35@@1 val))
 :pattern ( (MapType2Select lists r_35@@1))
 :pattern ( (MapType2Select s@0 r_35@@1))
)) (forall ((o_4@@66 T@U) ) (!  (=> (= (type o_4@@66) RefType) (=> (and (and (and (U_2_bool (MapType2Select lists (invRecv11 o_4@@66))) (not (U_2_bool (MapType2Select s@0 (invRecv11 o_4@@66))))) (< NoPerm FullPerm)) (qpRange11 o_4@@66)) (= (invRecv11 o_4@@66) o_4@@66)))
 :qid |stdinbpl.1299:26|
 :skolemid |155|
 :pattern ( (invRecv11 o_4@@66))
))) (=> (and (and (forall ((r_35@@2 T@U) ) (!  (=> (= (type r_35@@2) RefType) (=> (and (U_2_bool (MapType2Select lists r_35@@2)) (not (U_2_bool (MapType2Select s@0 r_35@@2)))) (not (= r_35@@2 null))))
 :qid |stdinbpl.1305:26|
 :skolemid |156|
 :pattern ( (MapType0Select ExhaleHeap@0 r_35@@2 val))
 :pattern ( (MapType1Select QPMask@43 r_35@@2 val))
 :pattern ( (MapType2Select lists r_35@@2))
 :pattern ( (MapType2Select s@0 r_35@@2))
)) (forall ((o_4@@67 T@U) ) (!  (=> (= (type o_4@@67) RefType) (and (=> (and (and (and (U_2_bool (MapType2Select lists (invRecv11 o_4@@67))) (not (U_2_bool (MapType2Select s@0 (invRecv11 o_4@@67))))) (< NoPerm FullPerm)) (qpRange11 o_4@@67)) (and (=> (< NoPerm FullPerm) (= (invRecv11 o_4@@67) o_4@@67)) (= (U_2_real (MapType1Select QPMask@43 o_4@@67 val)) (+ (U_2_real (MapType1Select QPMask@42 o_4@@67 val)) FullPerm)))) (=> (not (and (and (and (U_2_bool (MapType2Select lists (invRecv11 o_4@@67))) (not (U_2_bool (MapType2Select s@0 (invRecv11 o_4@@67))))) (< NoPerm FullPerm)) (qpRange11 o_4@@67))) (= (U_2_real (MapType1Select QPMask@43 o_4@@67 val)) (U_2_real (MapType1Select QPMask@42 o_4@@67 val))))))
 :qid |stdinbpl.1311:26|
 :skolemid |157|
 :pattern ( (MapType1Select QPMask@43 o_4@@67 val))
))) (and (forall ((o_4@@68 T@U) (f_5@@34 T@U) ) (! (let ((B@@47 (FieldTypeInv1 (type f_5@@34))))
(let ((A@@48 (FieldTypeInv0 (type f_5@@34))))
 (=> (and (and (= (type o_4@@68) RefType) (= (type f_5@@34) (FieldType A@@48 B@@47))) (not (= f_5@@34 val))) (= (U_2_real (MapType1Select QPMask@42 o_4@@68 f_5@@34)) (U_2_real (MapType1Select QPMask@43 o_4@@68 f_5@@34))))))
 :qid |stdinbpl.1315:33|
 :skolemid |158|
 :pattern ( (MapType1Select QPMask@42 o_4@@68 f_5@@34))
 :pattern ( (MapType1Select QPMask@43 o_4@@68 f_5@@34))
)) (state ExhaleHeap@0 QPMask@43))) (and (and (=> (= (ControlFlow 0 34) 33) anon176_Else_correct) (=> (= (ControlFlow 0 34) 19) anon177_Then_correct)) (=> (= (ControlFlow 0 34) 21) anon177_Else_correct))))))))
(let ((anon175_Then_correct true))
(let ((anon174_Else_correct  (and (=> (= (ControlFlow 0 36) (- 0 37)) (forall ((r_31 T@U) (r_31_1 T@U) ) (!  (=> (and (= (type r_31) RefType) (= (type r_31_1) RefType)) (=> (and (and (and (and (not (= r_31 r_31_1)) (U_2_bool (MapType2Select sNext@1 r_31))) (U_2_bool (MapType2Select sNext@1 r_31_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (or (not (= r_31 r_31_1)) (not (= (- length 1) (- length 1))))))
 :qid |stdinbpl.1249:21|
 :skolemid |147|
 :pattern ( (neverTriggered10 r_31) (neverTriggered10 r_31_1))
))) (=> (forall ((r_31@@0 T@U) (r_31_1@@0 T@U) ) (!  (=> (and (= (type r_31@@0) RefType) (= (type r_31_1@@0) RefType)) (=> (and (and (and (and (not (= r_31@@0 r_31_1@@0)) (U_2_bool (MapType2Select sNext@1 r_31@@0))) (U_2_bool (MapType2Select sNext@1 r_31_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (or (not (= r_31@@0 r_31_1@@0)) (not (= (- length 1) (- length 1))))))
 :qid |stdinbpl.1249:21|
 :skolemid |147|
 :pattern ( (neverTriggered10 r_31@@0) (neverTriggered10 r_31_1@@0))
)) (=> (forall ((r_31@@1 T@U) ) (!  (=> (= (type r_31@@1) RefType) (=> (and (U_2_bool (MapType2Select sNext@1 r_31@@1)) (< NoPerm FullPerm)) (and (= (invRecv10 r_31@@1 (- length 1)) r_31@@1) (qpRange10 r_31@@1 (- length 1)))))
 :qid |stdinbpl.1255:26|
 :skolemid |148|
 :pattern ( (MapType2Select sNext@1 r_31@@1))
)) (=> (and (forall ((r_32_1 T@U) (i_6 Int) ) (!  (=> (= (type r_32_1) RefType) (=> (and (and (U_2_bool (MapType2Select sNext@1 (invRecv10 r_32_1 i_6))) (< NoPerm FullPerm)) (qpRange10 r_32_1 i_6)) (and (= (invRecv10 r_32_1 i_6) r_32_1) (= (- length 1) i_6))))
 :qid |stdinbpl.1259:26|
 :skolemid |149|
 :pattern ( (invRecv10 r_32_1 i_6))
)) (forall ((r_32_1@@0 T@U) (i_6@@0 Int) ) (!  (=> (= (type r_32_1@@0) RefType) (=> (and (and (U_2_bool (MapType2Select sNext@1 (invRecv10 r_32_1@@0 i_6@@0))) (< NoPerm FullPerm)) (qpRange10 r_32_1@@0 i_6@@0)) (and (=> (< NoPerm FullPerm) (and (= (invRecv10 r_32_1@@0 i_6@@0) r_32_1@@0) (= (- length 1) i_6@@0))) (= (U_2_real (MapType1Select QPMask@42 null (list r_32_1@@0 i_6@@0))) (+ (U_2_real (MapType1Select QPMask@41 null (list r_32_1@@0 i_6@@0))) FullPerm)))))
 :qid |stdinbpl.1265:26|
 :skolemid |150|
 :pattern ( (MapType1Select QPMask@42 null (list r_32_1@@0 i_6@@0)))
))) (=> (and (and (forall ((o_4@@69 T@U) (f_5@@35 T@U) ) (! (let ((B@@48 (FieldTypeInv1 (type f_5@@35))))
(let ((A@@49 (FieldTypeInv0 (type f_5@@35))))
 (=> (and (and (= (type o_4@@69) RefType) (= (type f_5@@35) (FieldType A@@49 B@@48))) (or (or (not (= o_4@@69 null)) (not (IsPredicateField f_5@@35))) (not (= (getPredWandId f_5@@35) 0)))) (= (U_2_real (MapType1Select QPMask@41 o_4@@69 f_5@@35)) (U_2_real (MapType1Select QPMask@42 o_4@@69 f_5@@35))))))
 :qid |stdinbpl.1271:33|
 :skolemid |151|
 :pattern ( (MapType1Select QPMask@41 o_4@@69 f_5@@35))
 :pattern ( (MapType1Select QPMask@42 o_4@@69 f_5@@35))
)) (forall ((r_32_1@@1 T@U) (i_6@@1 Int) ) (!  (=> (and (= (type r_32_1@@1) RefType) (not (and (and (U_2_bool (MapType2Select sNext@1 (invRecv10 r_32_1@@1 i_6@@1))) (< NoPerm FullPerm)) (qpRange10 r_32_1@@1 i_6@@1)))) (= (U_2_real (MapType1Select QPMask@42 null (list r_32_1@@1 i_6@@1))) (U_2_real (MapType1Select QPMask@41 null (list r_32_1@@1 i_6@@1)))))
 :qid |stdinbpl.1275:26|
 :skolemid |152|
 :pattern ( (MapType1Select QPMask@42 null (list r_32_1@@1 i_6@@1)))
))) (and (state ExhaleHeap@0 QPMask@42) (state ExhaleHeap@0 QPMask@42))) (and (=> (= (ControlFlow 0 36) 17) anon175_Then_correct) (=> (= (ControlFlow 0 36) 34) anon175_Else_correct)))))))))
(let ((anon174_Then_correct true))
(let ((anon173_Else_correct  (and (=> (= (ControlFlow 0 38) (- 0 39)) (forall ((r_29 T@U) (r_29_1 T@U) ) (!  (=> (and (= (type r_29) RefType) (= (type r_29_1) RefType)) (=> (and (and (and (and (not (= r_29 r_29_1)) (and (U_2_bool (MapType2Select lists r_29)) (not (U_2_bool (MapType2Select s@0 r_29))))) (and (U_2_bool (MapType2Select lists r_29_1)) (not (U_2_bool (MapType2Select s@0 r_29_1))))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= r_29 r_29_1))))
 :qid |stdinbpl.1207:19|
 :skolemid |141|
 :no-pattern (type r_29)
 :no-pattern (type r_29_1)
 :no-pattern (U_2_int r_29)
 :no-pattern (U_2_bool r_29)
 :no-pattern (U_2_int r_29_1)
 :no-pattern (U_2_bool r_29_1)
))) (=> (forall ((r_29@@0 T@U) (r_29_1@@0 T@U) ) (!  (=> (and (= (type r_29@@0) RefType) (= (type r_29_1@@0) RefType)) (=> (and (and (and (and (not (= r_29@@0 r_29_1@@0)) (and (U_2_bool (MapType2Select lists r_29@@0)) (not (U_2_bool (MapType2Select s@0 r_29@@0))))) (and (U_2_bool (MapType2Select lists r_29_1@@0)) (not (U_2_bool (MapType2Select s@0 r_29_1@@0))))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= r_29@@0 r_29_1@@0))))
 :qid |stdinbpl.1207:19|
 :skolemid |141|
 :no-pattern (type r_29@@0)
 :no-pattern (type r_29_1@@0)
 :no-pattern (U_2_int r_29@@0)
 :no-pattern (U_2_bool r_29@@0)
 :no-pattern (U_2_int r_29_1@@0)
 :no-pattern (U_2_bool r_29_1@@0)
)) (=> (forall ((r_29@@1 T@U) ) (!  (=> (= (type r_29@@1) RefType) (=> (and (and (U_2_bool (MapType2Select lists r_29@@1)) (not (U_2_bool (MapType2Select s@0 r_29@@1)))) (< NoPerm FullPerm)) (and (qpRange9 r_29@@1) (= (invRecv9 r_29@@1) r_29@@1))))
 :qid |stdinbpl.1213:26|
 :skolemid |142|
 :pattern ( (MapType0Select ExhaleHeap@0 r_29@@1 next))
 :pattern ( (MapType1Select QPMask@41 r_29@@1 next))
 :pattern ( (MapType2Select lists r_29@@1))
 :pattern ( (MapType2Select s@0 r_29@@1))
)) (=> (and (forall ((o_4@@70 T@U) ) (!  (=> (= (type o_4@@70) RefType) (=> (and (and (and (U_2_bool (MapType2Select lists (invRecv9 o_4@@70))) (not (U_2_bool (MapType2Select s@0 (invRecv9 o_4@@70))))) (< NoPerm FullPerm)) (qpRange9 o_4@@70)) (= (invRecv9 o_4@@70) o_4@@70)))
 :qid |stdinbpl.1217:26|
 :skolemid |143|
 :pattern ( (invRecv9 o_4@@70))
)) (forall ((r_29@@2 T@U) ) (!  (=> (= (type r_29@@2) RefType) (=> (and (U_2_bool (MapType2Select lists r_29@@2)) (not (U_2_bool (MapType2Select s@0 r_29@@2)))) (not (= r_29@@2 null))))
 :qid |stdinbpl.1223:26|
 :skolemid |144|
 :pattern ( (MapType0Select ExhaleHeap@0 r_29@@2 next))
 :pattern ( (MapType1Select QPMask@41 r_29@@2 next))
 :pattern ( (MapType2Select lists r_29@@2))
 :pattern ( (MapType2Select s@0 r_29@@2))
))) (=> (and (and (forall ((o_4@@71 T@U) ) (!  (=> (= (type o_4@@71) RefType) (and (=> (and (and (and (U_2_bool (MapType2Select lists (invRecv9 o_4@@71))) (not (U_2_bool (MapType2Select s@0 (invRecv9 o_4@@71))))) (< NoPerm FullPerm)) (qpRange9 o_4@@71)) (and (=> (< NoPerm FullPerm) (= (invRecv9 o_4@@71) o_4@@71)) (= (U_2_real (MapType1Select QPMask@41 o_4@@71 next)) (+ (U_2_real (MapType1Select QPMask@40 o_4@@71 next)) FullPerm)))) (=> (not (and (and (and (U_2_bool (MapType2Select lists (invRecv9 o_4@@71))) (not (U_2_bool (MapType2Select s@0 (invRecv9 o_4@@71))))) (< NoPerm FullPerm)) (qpRange9 o_4@@71))) (= (U_2_real (MapType1Select QPMask@41 o_4@@71 next)) (U_2_real (MapType1Select QPMask@40 o_4@@71 next))))))
 :qid |stdinbpl.1229:26|
 :skolemid |145|
 :pattern ( (MapType1Select QPMask@41 o_4@@71 next))
)) (forall ((o_4@@72 T@U) (f_5@@36 T@U) ) (! (let ((B@@49 (FieldTypeInv1 (type f_5@@36))))
(let ((A@@50 (FieldTypeInv0 (type f_5@@36))))
 (=> (and (and (= (type o_4@@72) RefType) (= (type f_5@@36) (FieldType A@@50 B@@49))) (not (= f_5@@36 next))) (= (U_2_real (MapType1Select QPMask@40 o_4@@72 f_5@@36)) (U_2_real (MapType1Select QPMask@41 o_4@@72 f_5@@36))))))
 :qid |stdinbpl.1233:33|
 :skolemid |146|
 :pattern ( (MapType1Select QPMask@40 o_4@@72 f_5@@36))
 :pattern ( (MapType1Select QPMask@41 o_4@@72 f_5@@36))
))) (and (state ExhaleHeap@0 QPMask@41) (state ExhaleHeap@0 QPMask@41))) (and (=> (= (ControlFlow 0 38) 16) anon174_Then_correct) (=> (= (ControlFlow 0 38) 36) anon174_Else_correct)))))))))
(let ((anon173_Then_correct true))
(let ((anon172_Else_correct  (and (=> (= (ControlFlow 0 40) (- 0 41)) (forall ((r_25 T@U) (r_25_1 T@U) ) (!  (=> (and (= (type r_25) RefType) (= (type r_25_1) RefType)) (=> (and (and (and (and (not (= r_25 r_25_1)) (U_2_bool (MapType2Select s@0 r_25))) (U_2_bool (MapType2Select s@0 r_25_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (or (not (= r_25 r_25_1)) (not (= length length)))))
 :qid |stdinbpl.1167:21|
 :skolemid |135|
 :pattern ( (neverTriggered8 r_25) (neverTriggered8 r_25_1))
))) (=> (forall ((r_25@@0 T@U) (r_25_1@@0 T@U) ) (!  (=> (and (= (type r_25@@0) RefType) (= (type r_25_1@@0) RefType)) (=> (and (and (and (and (not (= r_25@@0 r_25_1@@0)) (U_2_bool (MapType2Select s@0 r_25@@0))) (U_2_bool (MapType2Select s@0 r_25_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (or (not (= r_25@@0 r_25_1@@0)) (not (= length length)))))
 :qid |stdinbpl.1167:21|
 :skolemid |135|
 :pattern ( (neverTriggered8 r_25@@0) (neverTriggered8 r_25_1@@0))
)) (=> (forall ((r_25@@1 T@U) ) (!  (=> (= (type r_25@@1) RefType) (=> (and (U_2_bool (MapType2Select s@0 r_25@@1)) (< NoPerm FullPerm)) (and (= (invRecv8 r_25@@1 length) r_25@@1) (qpRange8 r_25@@1 length))))
 :qid |stdinbpl.1173:26|
 :skolemid |136|
 :pattern ( (MapType0Select ExhaleHeap@0 null (list r_25@@1 length)))
 :pattern ( (MapType1Select QPMask@4 null (list r_25@@1 length)))
 :pattern ( (MapType2Select s@0 r_25@@1))
)) (=> (and (forall ((r_26_1 T@U) (i_5 Int) ) (!  (=> (= (type r_26_1) RefType) (=> (and (and (U_2_bool (MapType2Select s@0 (invRecv8 r_26_1 i_5))) (< NoPerm FullPerm)) (qpRange8 r_26_1 i_5)) (and (= (invRecv8 r_26_1 i_5) r_26_1) (= length i_5))))
 :qid |stdinbpl.1177:26|
 :skolemid |137|
 :pattern ( (invRecv8 r_26_1 i_5))
)) (forall ((r_26_1@@0 T@U) (i_5@@0 Int) ) (!  (=> (= (type r_26_1@@0) RefType) (=> (and (and (U_2_bool (MapType2Select s@0 (invRecv8 r_26_1@@0 i_5@@0))) (< NoPerm FullPerm)) (qpRange8 r_26_1@@0 i_5@@0)) (and (=> (< NoPerm FullPerm) (and (= (invRecv8 r_26_1@@0 i_5@@0) r_26_1@@0) (= length i_5@@0))) (= (U_2_real (MapType1Select QPMask@40 null (list r_26_1@@0 i_5@@0))) (+ (U_2_real (MapType1Select QPMask@4 null (list r_26_1@@0 i_5@@0))) FullPerm)))))
 :qid |stdinbpl.1183:26|
 :skolemid |138|
 :pattern ( (MapType1Select QPMask@40 null (list r_26_1@@0 i_5@@0)))
))) (=> (and (and (forall ((o_4@@73 T@U) (f_5@@37 T@U) ) (! (let ((B@@50 (FieldTypeInv1 (type f_5@@37))))
(let ((A@@51 (FieldTypeInv0 (type f_5@@37))))
 (=> (and (and (= (type o_4@@73) RefType) (= (type f_5@@37) (FieldType A@@51 B@@50))) (or (or (not (= o_4@@73 null)) (not (IsPredicateField f_5@@37))) (not (= (getPredWandId f_5@@37) 0)))) (= (U_2_real (MapType1Select QPMask@4 o_4@@73 f_5@@37)) (U_2_real (MapType1Select QPMask@40 o_4@@73 f_5@@37))))))
 :qid |stdinbpl.1189:33|
 :skolemid |139|
 :pattern ( (MapType1Select QPMask@4 o_4@@73 f_5@@37))
 :pattern ( (MapType1Select QPMask@40 o_4@@73 f_5@@37))
)) (forall ((r_26_1@@1 T@U) (i_5@@1 Int) ) (!  (=> (and (= (type r_26_1@@1) RefType) (not (and (and (U_2_bool (MapType2Select s@0 (invRecv8 r_26_1@@1 i_5@@1))) (< NoPerm FullPerm)) (qpRange8 r_26_1@@1 i_5@@1)))) (= (U_2_real (MapType1Select QPMask@40 null (list r_26_1@@1 i_5@@1))) (U_2_real (MapType1Select QPMask@4 null (list r_26_1@@1 i_5@@1)))))
 :qid |stdinbpl.1193:26|
 :skolemid |140|
 :pattern ( (MapType1Select QPMask@40 null (list r_26_1@@1 i_5@@1)))
))) (and (state ExhaleHeap@0 QPMask@40) (state ExhaleHeap@0 QPMask@40))) (and (=> (= (ControlFlow 0 40) 15) anon173_Then_correct) (=> (= (ControlFlow 0 40) 38) anon173_Else_correct)))))))))
(let ((anon172_Then_correct true))
(let ((anon169_Else_correct  (=> (and (forall ((r1_1_1 T@U) (r2_1_1 T@U) ) (!  (=> (and (and (= (type r1_1_1) RefType) (= (type r2_1_1) RefType)) (and (U_2_bool (MapType2Select lists r1_1_1)) (and (not (U_2_bool (MapType2Select lists r1_1_1))) (and (U_2_bool (MapType2Select lists r2_1_1)) (and (not (U_2_bool (MapType2Select lists r2_1_1))) (not (= r1_1_1 r2_1_1))))))) (not (= (MapType0Select Heap@@14 r1_1_1 next) (MapType0Select Heap@@14 r2_1_1 next))))
 :qid |stdinbpl.1144:24|
 :skolemid |134|
 :pattern ( (MapType2Select lists r1_1_1) (MapType2Select lists r2_1_1))
 :pattern ( (MapType2Select lists r1_1_1) (MapType2Select lists r2_1_1))
 :pattern ( (MapType2Select lists r1_1_1) (MapType2Select lists r2_1_1))
 :pattern ( (MapType2Select lists r1_1_1) (MapType2Select lists r2_1_1))
)) (IdenticalOnKnownLocations Heap@@14 ExhaleHeap@0 QPMask@4)) (and (and (and (=> (= (ControlFlow 0 231) 226) anon182_Then_correct) (=> (= (ControlFlow 0 231) 181) anon182_Else_correct)) (=> (= (ControlFlow 0 231) 14) anon172_Then_correct)) (=> (= (ControlFlow 0 231) 40) anon172_Else_correct)))))
(let ((anon24_correct true))
(let ((anon170_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select lists r1)) (and (not (U_2_bool (MapType2Select lists r1))) (and (U_2_bool (MapType2Select lists r2@@1)) (and (not (U_2_bool (MapType2Select lists r2@@1))) (not (= r1 r2@@1))))))) (= (ControlFlow 0 13) 10)) anon24_correct)))
(let ((anon170_Then_correct  (=> (and (U_2_bool (MapType2Select lists r1)) (and (not (U_2_bool (MapType2Select lists r1))) (and (U_2_bool (MapType2Select lists r2@@1)) (and (not (U_2_bool (MapType2Select lists r2@@1))) (not (= r1 r2@@1)))))) (and (=> (= (ControlFlow 0 11) (- 0 12)) (not (= (MapType0Select Heap@@14 r1 next) (MapType0Select Heap@@14 r2@@1 next)))) (=> (not (= (MapType0Select Heap@@14 r1 next) (MapType0Select Heap@@14 r2@@1 next))) (=> (= (ControlFlow 0 11) 10) anon24_correct))))))
(let ((anon167_Else_correct  (=> (forall ((r_23_1 T@U) ) (!  (=> (= (type r_23_1) RefType) (=> (and (U_2_bool (MapType2Select lists r_23_1)) (not (U_2_bool (MapType2Select lists r_23_1)))) (U_2_bool (MapType2Select sNext@0 (MapType0Select Heap@@14 r_23_1 next)))))
 :qid |stdinbpl.1133:24|
 :skolemid |133|
 :pattern ( (MapType2Select lists r_23_1))
 :pattern ( (MapType2Select lists r_23_1))
 :pattern ( (MapType2Select sNext@0 (MapType0Select Heap@@14 r_23_1 next)))
)) (and (and (=> (= (ControlFlow 0 232) 231) anon169_Else_correct) (=> (= (ControlFlow 0 232) 11) anon170_Then_correct)) (=> (= (ControlFlow 0 232) 13) anon170_Else_correct)))))
(let ((anon20_correct true))
(let ((anon168_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select lists r_22)) (not (U_2_bool (MapType2Select lists r_22))))) (= (ControlFlow 0 9) 6)) anon20_correct)))
(let ((anon168_Then_correct  (=> (and (U_2_bool (MapType2Select lists r_22)) (not (U_2_bool (MapType2Select lists r_22)))) (and (=> (= (ControlFlow 0 7) (- 0 8)) (U_2_bool (MapType2Select sNext@0 (MapType0Select Heap@@14 r_22 next)))) (=> (U_2_bool (MapType2Select sNext@0 (MapType0Select Heap@@14 r_22 next))) (=> (= (ControlFlow 0 7) 6) anon20_correct))))))
(let ((anon165_Else_correct  (=> (forall ((r_21_1 T@U) ) (!  (=> (= (type r_21_1) RefType) (=> (and (U_2_bool (MapType2Select lists r_21_1)) (not (U_2_bool (MapType2Select lists r_21_1)))) (= (U_2_int (MapType0Select Heap@@14 r_21_1 val)) v_2@@3)))
 :qid |stdinbpl.1122:24|
 :skolemid |132|
 :pattern ( (MapType2Select lists r_21_1))
 :pattern ( (MapType2Select lists r_21_1))
)) (and (and (=> (= (ControlFlow 0 233) 232) anon167_Else_correct) (=> (= (ControlFlow 0 233) 7) anon168_Then_correct)) (=> (= (ControlFlow 0 233) 9) anon168_Else_correct)))))
(let ((anon16_correct true))
(let ((anon166_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select lists r_20)) (not (U_2_bool (MapType2Select lists r_20))))) (= (ControlFlow 0 5) 2)) anon16_correct)))
(let ((anon166_Then_correct  (=> (and (U_2_bool (MapType2Select lists r_20)) (not (U_2_bool (MapType2Select lists r_20)))) (and (=> (= (ControlFlow 0 3) (- 0 4)) (= (U_2_int (MapType0Select Heap@@14 r_20 val)) v_2@@3)) (=> (= (U_2_int (MapType0Select Heap@@14 r_20 val)) v_2@@3) (=> (= (ControlFlow 0 3) 2) anon16_correct))))))
(let ((anon159_Else_correct  (=> (state Heap@@14 QPMask@0) (=> (and (= sNext@0 (|Set#Empty| RefType)) (state Heap@@14 QPMask@0)) (and (=> (= (ControlFlow 0 234) (- 0 242)) (forall ((r_14 T@U) (r_14_1 T@U) ) (!  (=> (and (= (type r_14) RefType) (= (type r_14_1) RefType)) (=> (and (and (and (and (not (= r_14 r_14_1)) (U_2_bool (MapType2Select lists r_14))) (U_2_bool (MapType2Select lists r_14_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (or (not (= r_14 r_14_1)) (not (= length length)))))
 :qid |stdinbpl.950:21|
 :skolemid |106|
 :pattern ( (neverTriggered4 r_14) (neverTriggered4 r_14_1))
))) (=> (forall ((r_14@@0 T@U) (r_14_1@@0 T@U) ) (!  (=> (and (= (type r_14@@0) RefType) (= (type r_14_1@@0) RefType)) (=> (and (and (and (and (not (= r_14@@0 r_14_1@@0)) (U_2_bool (MapType2Select lists r_14@@0))) (U_2_bool (MapType2Select lists r_14_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (or (not (= r_14@@0 r_14_1@@0)) (not (= length length)))))
 :qid |stdinbpl.950:21|
 :skolemid |106|
 :pattern ( (neverTriggered4 r_14@@0) (neverTriggered4 r_14_1@@0))
)) (and (=> (= (ControlFlow 0 234) (- 0 241)) (forall ((r_14@@1 T@U) ) (!  (=> (and (= (type r_14@@1) RefType) (U_2_bool (MapType2Select lists r_14@@1))) (>= (U_2_real (MapType1Select QPMask@0 null (list r_14@@1 length))) FullPerm))
 :qid |stdinbpl.957:21|
 :skolemid |107|
 :pattern ( (MapType0Select Heap@@14 null (list r_14@@1 length)))
 :pattern ( (MapType1Select QPMask@0 null (list r_14@@1 length)))
 :pattern ( (MapType2Select lists r_14@@1))
))) (=> (forall ((r_14@@2 T@U) ) (!  (=> (and (= (type r_14@@2) RefType) (U_2_bool (MapType2Select lists r_14@@2))) (>= (U_2_real (MapType1Select QPMask@0 null (list r_14@@2 length))) FullPerm))
 :qid |stdinbpl.957:21|
 :skolemid |107|
 :pattern ( (MapType0Select Heap@@14 null (list r_14@@2 length)))
 :pattern ( (MapType1Select QPMask@0 null (list r_14@@2 length)))
 :pattern ( (MapType2Select lists r_14@@2))
)) (=> (forall ((r_14@@3 T@U) ) (!  (=> (= (type r_14@@3) RefType) (=> (and (U_2_bool (MapType2Select lists r_14@@3)) (< NoPerm FullPerm)) (and (= (invRecv4 r_14@@3 length) r_14@@3) (qpRange4 r_14@@3 length))))
 :qid |stdinbpl.963:26|
 :skolemid |108|
 :pattern ( (MapType0Select Heap@@14 null (list r_14@@3 length)))
 :pattern ( (MapType1Select QPMask@0 null (list r_14@@3 length)))
 :pattern ( (MapType2Select lists r_14@@3))
)) (=> (and (and (forall ((r_15_1 T@U) (i_3 Int) ) (!  (=> (= (type r_15_1) RefType) (=> (and (and (U_2_bool (MapType2Select lists (invRecv4 r_15_1 i_3))) (< NoPerm FullPerm)) (qpRange4 r_15_1 i_3)) (and (= (invRecv4 r_15_1 i_3) r_15_1) (= length i_3))))
 :qid |stdinbpl.967:26|
 :skolemid |109|
 :pattern ( (invRecv4 r_15_1 i_3))
)) (forall ((r_15_1@@0 T@U) (i_3@@0 Int) ) (!  (=> (= (type r_15_1@@0) RefType) (=> (and (and (U_2_bool (MapType2Select lists (invRecv4 r_15_1@@0 i_3@@0))) (< NoPerm FullPerm)) (qpRange4 r_15_1@@0 i_3@@0)) (and (and (= (invRecv4 r_15_1@@0 i_3@@0) r_15_1@@0) (= length i_3@@0)) (= (U_2_real (MapType1Select QPMask@1 null (list r_15_1@@0 i_3@@0))) (- (U_2_real (MapType1Select QPMask@0 null (list r_15_1@@0 i_3@@0))) FullPerm)))))
 :qid |stdinbpl.973:26|
 :skolemid |110|
 :pattern ( (MapType1Select QPMask@1 null (list r_15_1@@0 i_3@@0)))
))) (and (forall ((r_15_1@@1 T@U) (i_3@@1 Int) ) (!  (=> (and (= (type r_15_1@@1) RefType) (not (and (and (U_2_bool (MapType2Select lists (invRecv4 r_15_1@@1 i_3@@1))) (< NoPerm FullPerm)) (qpRange4 r_15_1@@1 i_3@@1)))) (= (U_2_real (MapType1Select QPMask@1 null (list r_15_1@@1 i_3@@1))) (U_2_real (MapType1Select QPMask@0 null (list r_15_1@@1 i_3@@1)))))
 :qid |stdinbpl.977:26|
 :skolemid |111|
 :pattern ( (MapType1Select QPMask@1 null (list r_15_1@@1 i_3@@1)))
)) (forall ((o_4@@74 T@U) (f_5@@38 T@U) ) (! (let ((B@@51 (FieldTypeInv1 (type f_5@@38))))
(let ((A@@52 (FieldTypeInv0 (type f_5@@38))))
 (=> (and (and (= (type o_4@@74) RefType) (= (type f_5@@38) (FieldType A@@52 B@@51))) (or (or (not (= o_4@@74 null)) (not (IsPredicateField f_5@@38))) (not (= (getPredWandId f_5@@38) 0)))) (= (U_2_real (MapType1Select QPMask@0 o_4@@74 f_5@@38)) (U_2_real (MapType1Select QPMask@1 o_4@@74 f_5@@38))))))
 :qid |stdinbpl.983:33|
 :skolemid |112|
 :pattern ( (MapType1Select QPMask@0 o_4@@74 f_5@@38))
 :pattern ( (MapType1Select QPMask@1 o_4@@74 f_5@@38))
)))) (and (=> (= (ControlFlow 0 234) (- 0 240)) (forall ((r_16 T@U) (r_16_1 T@U) ) (!  (=> (and (= (type r_16) RefType) (= (type r_16_1) RefType)) (=> (and (and (and (and (not (= r_16 r_16_1)) (and (U_2_bool (MapType2Select lists r_16)) (not (U_2_bool (MapType2Select lists r_16))))) (and (U_2_bool (MapType2Select lists r_16_1)) (not (U_2_bool (MapType2Select lists r_16_1))))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= r_16 r_16_1))))
 :qid |stdinbpl.995:21|
 :skolemid |113|
 :pattern ( (neverTriggered5 r_16) (neverTriggered5 r_16_1))
))) (=> (forall ((r_16@@0 T@U) (r_16_1@@0 T@U) ) (!  (=> (and (= (type r_16@@0) RefType) (= (type r_16_1@@0) RefType)) (=> (and (and (and (and (not (= r_16@@0 r_16_1@@0)) (and (U_2_bool (MapType2Select lists r_16@@0)) (not (U_2_bool (MapType2Select lists r_16@@0))))) (and (U_2_bool (MapType2Select lists r_16_1@@0)) (not (U_2_bool (MapType2Select lists r_16_1@@0))))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= r_16@@0 r_16_1@@0))))
 :qid |stdinbpl.995:21|
 :skolemid |113|
 :pattern ( (neverTriggered5 r_16@@0) (neverTriggered5 r_16_1@@0))
)) (and (=> (= (ControlFlow 0 234) (- 0 239)) (forall ((r_16@@1 T@U) ) (!  (=> (= (type r_16@@1) RefType) (=> (and (U_2_bool (MapType2Select lists r_16@@1)) (not (U_2_bool (MapType2Select lists r_16@@1)))) (>= (U_2_real (MapType1Select QPMask@1 r_16@@1 next)) FullPerm)))
 :qid |stdinbpl.1002:21|
 :skolemid |114|
 :pattern ( (MapType0Select Heap@@14 r_16@@1 next))
 :pattern ( (MapType1Select QPMask@2 r_16@@1 next))
 :pattern ( (MapType2Select lists r_16@@1))
 :pattern ( (MapType2Select lists r_16@@1))
))) (=> (forall ((r_16@@2 T@U) ) (!  (=> (= (type r_16@@2) RefType) (=> (and (U_2_bool (MapType2Select lists r_16@@2)) (not (U_2_bool (MapType2Select lists r_16@@2)))) (>= (U_2_real (MapType1Select QPMask@1 r_16@@2 next)) FullPerm)))
 :qid |stdinbpl.1002:21|
 :skolemid |114|
 :pattern ( (MapType0Select Heap@@14 r_16@@2 next))
 :pattern ( (MapType1Select QPMask@2 r_16@@2 next))
 :pattern ( (MapType2Select lists r_16@@2))
 :pattern ( (MapType2Select lists r_16@@2))
)) (=> (and (and (forall ((r_16@@3 T@U) ) (!  (=> (= (type r_16@@3) RefType) (=> (and (and (U_2_bool (MapType2Select lists r_16@@3)) (not (U_2_bool (MapType2Select lists r_16@@3)))) (< NoPerm FullPerm)) (and (qpRange5 r_16@@3) (= (invRecv5 r_16@@3) r_16@@3))))
 :qid |stdinbpl.1008:26|
 :skolemid |115|
 :pattern ( (MapType0Select Heap@@14 r_16@@3 next))
 :pattern ( (MapType1Select QPMask@2 r_16@@3 next))
 :pattern ( (MapType2Select lists r_16@@3))
 :pattern ( (MapType2Select lists r_16@@3))
)) (forall ((o_4@@75 T@U) ) (!  (=> (= (type o_4@@75) RefType) (=> (and (and (U_2_bool (MapType2Select lists (invRecv5 o_4@@75))) (not (U_2_bool (MapType2Select lists (invRecv5 o_4@@75))))) (and (< NoPerm FullPerm) (qpRange5 o_4@@75))) (= (invRecv5 o_4@@75) o_4@@75)))
 :qid |stdinbpl.1012:26|
 :skolemid |116|
 :pattern ( (invRecv5 o_4@@75))
))) (and (forall ((o_4@@76 T@U) ) (!  (=> (= (type o_4@@76) RefType) (and (=> (and (and (U_2_bool (MapType2Select lists (invRecv5 o_4@@76))) (not (U_2_bool (MapType2Select lists (invRecv5 o_4@@76))))) (and (< NoPerm FullPerm) (qpRange5 o_4@@76))) (and (= (invRecv5 o_4@@76) o_4@@76) (= (U_2_real (MapType1Select QPMask@2 o_4@@76 next)) (- (U_2_real (MapType1Select QPMask@1 o_4@@76 next)) FullPerm)))) (=> (not (and (and (U_2_bool (MapType2Select lists (invRecv5 o_4@@76))) (not (U_2_bool (MapType2Select lists (invRecv5 o_4@@76))))) (and (< NoPerm FullPerm) (qpRange5 o_4@@76)))) (= (U_2_real (MapType1Select QPMask@2 o_4@@76 next)) (U_2_real (MapType1Select QPMask@1 o_4@@76 next))))))
 :qid |stdinbpl.1018:26|
 :skolemid |117|
 :pattern ( (MapType1Select QPMask@2 o_4@@76 next))
)) (forall ((o_4@@77 T@U) (f_5@@39 T@U) ) (! (let ((B@@52 (FieldTypeInv1 (type f_5@@39))))
(let ((A@@53 (FieldTypeInv0 (type f_5@@39))))
 (=> (and (and (= (type o_4@@77) RefType) (= (type f_5@@39) (FieldType A@@53 B@@52))) (not (= f_5@@39 next))) (= (U_2_real (MapType1Select QPMask@1 o_4@@77 f_5@@39)) (U_2_real (MapType1Select QPMask@2 o_4@@77 f_5@@39))))))
 :qid |stdinbpl.1024:33|
 :skolemid |118|
 :pattern ( (MapType1Select QPMask@2 o_4@@77 f_5@@39))
)))) (and (=> (= (ControlFlow 0 234) (- 0 238)) (forall ((r_17 T@U) (r_17_1 T@U) ) (!  (=> (and (= (type r_17) RefType) (= (type r_17_1) RefType)) (=> (and (and (and (and (not (= r_17 r_17_1)) (U_2_bool (MapType2Select sNext@0 r_17))) (U_2_bool (MapType2Select sNext@0 r_17_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (or (not (= r_17 r_17_1)) (not (= (- length 1) (- length 1))))))
 :qid |stdinbpl.1036:21|
 :skolemid |119|
 :pattern ( (neverTriggered6 r_17) (neverTriggered6 r_17_1))
))) (=> (forall ((r_17@@0 T@U) (r_17_1@@0 T@U) ) (!  (=> (and (= (type r_17@@0) RefType) (= (type r_17_1@@0) RefType)) (=> (and (and (and (and (not (= r_17@@0 r_17_1@@0)) (U_2_bool (MapType2Select sNext@0 r_17@@0))) (U_2_bool (MapType2Select sNext@0 r_17_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (or (not (= r_17@@0 r_17_1@@0)) (not (= (- length 1) (- length 1))))))
 :qid |stdinbpl.1036:21|
 :skolemid |119|
 :pattern ( (neverTriggered6 r_17@@0) (neverTriggered6 r_17_1@@0))
)) (and (=> (= (ControlFlow 0 234) (- 0 237)) (forall ((r_17@@1 T@U) ) (!  (=> (and (= (type r_17@@1) RefType) (U_2_bool (MapType2Select sNext@0 r_17@@1))) (>= (U_2_real (MapType1Select QPMask@2 null (list r_17@@1 (- length 1)))) FullPerm))
 :qid |stdinbpl.1043:21|
 :skolemid |120|
 :pattern ( (MapType2Select sNext@0 r_17@@1))
))) (=> (forall ((r_17@@2 T@U) ) (!  (=> (and (= (type r_17@@2) RefType) (U_2_bool (MapType2Select sNext@0 r_17@@2))) (>= (U_2_real (MapType1Select QPMask@2 null (list r_17@@2 (- length 1)))) FullPerm))
 :qid |stdinbpl.1043:21|
 :skolemid |120|
 :pattern ( (MapType2Select sNext@0 r_17@@2))
)) (=> (forall ((r_17@@3 T@U) ) (!  (=> (= (type r_17@@3) RefType) (=> (and (U_2_bool (MapType2Select sNext@0 r_17@@3)) (< NoPerm FullPerm)) (and (= (invRecv6 r_17@@3 (- length 1)) r_17@@3) (qpRange6 r_17@@3 (- length 1)))))
 :qid |stdinbpl.1049:26|
 :skolemid |121|
 :pattern ( (MapType2Select sNext@0 r_17@@3))
)) (=> (and (and (forall ((r_18_1 T@U) (i_4 Int) ) (!  (=> (= (type r_18_1) RefType) (=> (and (and (U_2_bool (MapType2Select sNext@0 (invRecv6 r_18_1 i_4))) (< NoPerm FullPerm)) (qpRange6 r_18_1 i_4)) (and (= (invRecv6 r_18_1 i_4) r_18_1) (= (- length 1) i_4))))
 :qid |stdinbpl.1053:26|
 :skolemid |122|
 :pattern ( (invRecv6 r_18_1 i_4))
)) (forall ((r_18_1@@0 T@U) (i_4@@0 Int) ) (!  (=> (= (type r_18_1@@0) RefType) (=> (and (and (U_2_bool (MapType2Select sNext@0 (invRecv6 r_18_1@@0 i_4@@0))) (< NoPerm FullPerm)) (qpRange6 r_18_1@@0 i_4@@0)) (and (and (= (invRecv6 r_18_1@@0 i_4@@0) r_18_1@@0) (= (- length 1) i_4@@0)) (= (U_2_real (MapType1Select QPMask@3 null (list r_18_1@@0 i_4@@0))) (- (U_2_real (MapType1Select QPMask@2 null (list r_18_1@@0 i_4@@0))) FullPerm)))))
 :qid |stdinbpl.1059:26|
 :skolemid |123|
 :pattern ( (MapType1Select QPMask@3 null (list r_18_1@@0 i_4@@0)))
))) (and (forall ((r_18_1@@1 T@U) (i_4@@1 Int) ) (!  (=> (and (= (type r_18_1@@1) RefType) (not (and (and (U_2_bool (MapType2Select sNext@0 (invRecv6 r_18_1@@1 i_4@@1))) (< NoPerm FullPerm)) (qpRange6 r_18_1@@1 i_4@@1)))) (= (U_2_real (MapType1Select QPMask@3 null (list r_18_1@@1 i_4@@1))) (U_2_real (MapType1Select QPMask@2 null (list r_18_1@@1 i_4@@1)))))
 :qid |stdinbpl.1063:26|
 :skolemid |124|
 :pattern ( (MapType1Select QPMask@3 null (list r_18_1@@1 i_4@@1)))
)) (forall ((o_4@@78 T@U) (f_5@@40 T@U) ) (! (let ((B@@53 (FieldTypeInv1 (type f_5@@40))))
(let ((A@@54 (FieldTypeInv0 (type f_5@@40))))
 (=> (and (and (= (type o_4@@78) RefType) (= (type f_5@@40) (FieldType A@@54 B@@53))) (or (or (not (= o_4@@78 null)) (not (IsPredicateField f_5@@40))) (not (= (getPredWandId f_5@@40) 0)))) (= (U_2_real (MapType1Select QPMask@2 o_4@@78 f_5@@40)) (U_2_real (MapType1Select QPMask@3 o_4@@78 f_5@@40))))))
 :qid |stdinbpl.1069:33|
 :skolemid |125|
 :pattern ( (MapType1Select QPMask@2 o_4@@78 f_5@@40))
 :pattern ( (MapType1Select QPMask@3 o_4@@78 f_5@@40))
)))) (and (=> (= (ControlFlow 0 234) (- 0 236)) (forall ((r_19 T@U) (r_19_1 T@U) ) (!  (=> (and (= (type r_19) RefType) (= (type r_19_1) RefType)) (=> (and (and (and (and (not (= r_19 r_19_1)) (and (U_2_bool (MapType2Select lists r_19)) (not (U_2_bool (MapType2Select lists r_19))))) (and (U_2_bool (MapType2Select lists r_19_1)) (not (U_2_bool (MapType2Select lists r_19_1))))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= r_19 r_19_1))))
 :qid |stdinbpl.1081:21|
 :skolemid |126|
 :pattern ( (neverTriggered7 r_19) (neverTriggered7 r_19_1))
))) (=> (forall ((r_19@@0 T@U) (r_19_1@@0 T@U) ) (!  (=> (and (= (type r_19@@0) RefType) (= (type r_19_1@@0) RefType)) (=> (and (and (and (and (not (= r_19@@0 r_19_1@@0)) (and (U_2_bool (MapType2Select lists r_19@@0)) (not (U_2_bool (MapType2Select lists r_19@@0))))) (and (U_2_bool (MapType2Select lists r_19_1@@0)) (not (U_2_bool (MapType2Select lists r_19_1@@0))))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= r_19@@0 r_19_1@@0))))
 :qid |stdinbpl.1081:21|
 :skolemid |126|
 :pattern ( (neverTriggered7 r_19@@0) (neverTriggered7 r_19_1@@0))
)) (and (=> (= (ControlFlow 0 234) (- 0 235)) (forall ((r_19@@1 T@U) ) (!  (=> (= (type r_19@@1) RefType) (=> (and (U_2_bool (MapType2Select lists r_19@@1)) (not (U_2_bool (MapType2Select lists r_19@@1)))) (>= (U_2_real (MapType1Select QPMask@3 r_19@@1 val)) FullPerm)))
 :qid |stdinbpl.1088:21|
 :skolemid |127|
 :pattern ( (MapType0Select Heap@@14 r_19@@1 val))
 :pattern ( (MapType1Select QPMask@4 r_19@@1 val))
 :pattern ( (MapType2Select lists r_19@@1))
 :pattern ( (MapType2Select lists r_19@@1))
))) (=> (forall ((r_19@@2 T@U) ) (!  (=> (= (type r_19@@2) RefType) (=> (and (U_2_bool (MapType2Select lists r_19@@2)) (not (U_2_bool (MapType2Select lists r_19@@2)))) (>= (U_2_real (MapType1Select QPMask@3 r_19@@2 val)) FullPerm)))
 :qid |stdinbpl.1088:21|
 :skolemid |127|
 :pattern ( (MapType0Select Heap@@14 r_19@@2 val))
 :pattern ( (MapType1Select QPMask@4 r_19@@2 val))
 :pattern ( (MapType2Select lists r_19@@2))
 :pattern ( (MapType2Select lists r_19@@2))
)) (=> (and (and (forall ((r_19@@3 T@U) ) (!  (=> (= (type r_19@@3) RefType) (=> (and (and (U_2_bool (MapType2Select lists r_19@@3)) (not (U_2_bool (MapType2Select lists r_19@@3)))) (< NoPerm FullPerm)) (and (qpRange7 r_19@@3) (= (invRecv7 r_19@@3) r_19@@3))))
 :qid |stdinbpl.1094:26|
 :skolemid |128|
 :pattern ( (MapType0Select Heap@@14 r_19@@3 val))
 :pattern ( (MapType1Select QPMask@4 r_19@@3 val))
 :pattern ( (MapType2Select lists r_19@@3))
 :pattern ( (MapType2Select lists r_19@@3))
)) (forall ((o_4@@79 T@U) ) (!  (=> (= (type o_4@@79) RefType) (=> (and (and (U_2_bool (MapType2Select lists (invRecv7 o_4@@79))) (not (U_2_bool (MapType2Select lists (invRecv7 o_4@@79))))) (and (< NoPerm FullPerm) (qpRange7 o_4@@79))) (= (invRecv7 o_4@@79) o_4@@79)))
 :qid |stdinbpl.1098:26|
 :skolemid |129|
 :pattern ( (invRecv7 o_4@@79))
))) (and (forall ((o_4@@80 T@U) ) (!  (=> (= (type o_4@@80) RefType) (and (=> (and (and (U_2_bool (MapType2Select lists (invRecv7 o_4@@80))) (not (U_2_bool (MapType2Select lists (invRecv7 o_4@@80))))) (and (< NoPerm FullPerm) (qpRange7 o_4@@80))) (and (= (invRecv7 o_4@@80) o_4@@80) (= (U_2_real (MapType1Select QPMask@4 o_4@@80 val)) (- (U_2_real (MapType1Select QPMask@3 o_4@@80 val)) FullPerm)))) (=> (not (and (and (U_2_bool (MapType2Select lists (invRecv7 o_4@@80))) (not (U_2_bool (MapType2Select lists (invRecv7 o_4@@80))))) (and (< NoPerm FullPerm) (qpRange7 o_4@@80)))) (= (U_2_real (MapType1Select QPMask@4 o_4@@80 val)) (U_2_real (MapType1Select QPMask@3 o_4@@80 val))))))
 :qid |stdinbpl.1104:26|
 :skolemid |130|
 :pattern ( (MapType1Select QPMask@4 o_4@@80 val))
)) (forall ((o_4@@81 T@U) (f_5@@41 T@U) ) (! (let ((B@@54 (FieldTypeInv1 (type f_5@@41))))
(let ((A@@55 (FieldTypeInv0 (type f_5@@41))))
 (=> (and (and (= (type o_4@@81) RefType) (= (type f_5@@41) (FieldType A@@55 B@@54))) (not (= f_5@@41 val))) (= (U_2_real (MapType1Select QPMask@3 o_4@@81 f_5@@41)) (U_2_real (MapType1Select QPMask@4 o_4@@81 f_5@@41))))))
 :qid |stdinbpl.1110:33|
 :skolemid |131|
 :pattern ( (MapType1Select QPMask@4 o_4@@81 f_5@@41))
)))) (and (and (=> (= (ControlFlow 0 234) 233) anon165_Else_correct) (=> (= (ControlFlow 0 234) 3) anon166_Then_correct)) (=> (= (ControlFlow 0 234) 5) anon166_Else_correct))))))))))))))))))))))))))))
(let ((anon158_Else_correct  (and (=> (= (ControlFlow 0 255) (- 0 256)) (forall ((r_1 T@U) (r_1_1 T@U) ) (!  (=> (and (= (type r_1) RefType) (= (type r_1_1) RefType)) (=> (and (and (and (and (not (= r_1 r_1_1)) (U_2_bool (MapType2Select lists r_1))) (U_2_bool (MapType2Select lists r_1_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (or (not (= r_1 r_1_1)) (not (= length length)))))
 :qid |stdinbpl.809:17|
 :skolemid |93|
 :pattern ( (neverTriggered1 r_1) (neverTriggered1 r_1_1))
))) (=> (forall ((r_1@@0 T@U) (r_1_1@@0 T@U) ) (!  (=> (and (= (type r_1@@0) RefType) (= (type r_1_1@@0) RefType)) (=> (and (and (and (and (not (= r_1@@0 r_1_1@@0)) (U_2_bool (MapType2Select lists r_1@@0))) (U_2_bool (MapType2Select lists r_1_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (or (not (= r_1@@0 r_1_1@@0)) (not (= length length)))))
 :qid |stdinbpl.809:17|
 :skolemid |93|
 :pattern ( (neverTriggered1 r_1@@0) (neverTriggered1 r_1_1@@0))
)) (=> (forall ((r_1@@1 T@U) ) (!  (=> (= (type r_1@@1) RefType) (=> (and (U_2_bool (MapType2Select lists r_1@@1)) (< NoPerm FullPerm)) (and (= (invRecv1 r_1@@1 length) r_1@@1) (qpRange1 r_1@@1 length))))
 :qid |stdinbpl.815:22|
 :skolemid |94|
 :pattern ( (MapType0Select Heap@@14 null (list r_1@@1 length)))
 :pattern ( (MapType1Select ZeroMask null (list r_1@@1 length)))
 :pattern ( (MapType2Select lists r_1@@1))
)) (=> (and (forall ((r_2_1 T@U) (i@@9 Int) ) (!  (=> (= (type r_2_1) RefType) (=> (and (and (U_2_bool (MapType2Select lists (invRecv1 r_2_1 i@@9))) (< NoPerm FullPerm)) (qpRange1 r_2_1 i@@9)) (and (= (invRecv1 r_2_1 i@@9) r_2_1) (= length i@@9))))
 :qid |stdinbpl.819:22|
 :skolemid |95|
 :pattern ( (invRecv1 r_2_1 i@@9))
)) (forall ((r_2_1@@0 T@U) (i@@10 Int) ) (!  (=> (= (type r_2_1@@0) RefType) (=> (and (and (U_2_bool (MapType2Select lists (invRecv1 r_2_1@@0 i@@10))) (< NoPerm FullPerm)) (qpRange1 r_2_1@@0 i@@10)) (and (=> (< NoPerm FullPerm) (and (= (invRecv1 r_2_1@@0 i@@10) r_2_1@@0) (= length i@@10))) (= (U_2_real (MapType1Select QPMask@0 null (list r_2_1@@0 i@@10))) (+ (U_2_real (MapType1Select ZeroMask null (list r_2_1@@0 i@@10))) FullPerm)))))
 :qid |stdinbpl.825:22|
 :skolemid |96|
 :pattern ( (MapType1Select QPMask@0 null (list r_2_1@@0 i@@10)))
))) (=> (and (and (forall ((o_4@@82 T@U) (f_5@@42 T@U) ) (! (let ((B@@55 (FieldTypeInv1 (type f_5@@42))))
(let ((A@@56 (FieldTypeInv0 (type f_5@@42))))
 (=> (and (and (= (type o_4@@82) RefType) (= (type f_5@@42) (FieldType A@@56 B@@55))) (or (or (not (= o_4@@82 null)) (not (IsPredicateField f_5@@42))) (not (= (getPredWandId f_5@@42) 0)))) (= (U_2_real (MapType1Select ZeroMask o_4@@82 f_5@@42)) (U_2_real (MapType1Select QPMask@0 o_4@@82 f_5@@42))))))
 :qid |stdinbpl.831:29|
 :skolemid |97|
 :pattern ( (MapType1Select ZeroMask o_4@@82 f_5@@42))
 :pattern ( (MapType1Select QPMask@0 o_4@@82 f_5@@42))
)) (forall ((r_2_1@@1 T@U) (i@@11 Int) ) (!  (=> (and (= (type r_2_1@@1) RefType) (not (and (and (U_2_bool (MapType2Select lists (invRecv1 r_2_1@@1 i@@11))) (< NoPerm FullPerm)) (qpRange1 r_2_1@@1 i@@11)))) (= (U_2_real (MapType1Select QPMask@0 null (list r_2_1@@1 i@@11))) (U_2_real (MapType1Select ZeroMask null (list r_2_1@@1 i@@11)))))
 :qid |stdinbpl.835:22|
 :skolemid |98|
 :pattern ( (MapType1Select QPMask@0 null (list r_2_1@@1 i@@11)))
))) (and (state Heap@@14 QPMask@0) (state Heap@@14 QPMask@0))) (and (=> (= (ControlFlow 0 255) 254) anon159_Then_correct) (=> (= (ControlFlow 0 255) 234) anon159_Else_correct)))))))))
(let ((anon158_Then_correct true))
(let ((anon0_correct  (=> (and (and (state Heap@@14 ZeroMask) (= AssumeFunctionsAbove (- 0 1))) (and (> length 0) (state Heap@@14 ZeroMask))) (and (=> (= (ControlFlow 0 257) 1) anon158_Then_correct) (=> (= (ControlFlow 0 257) 255) anon158_Else_correct)))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 258) 257) anon0_correct)))
PreconditionGeneratedEntry_correct))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
))
(check-sat)
(get-info :reason-unknown)
(assert (not (= (ControlFlow 0 59) (- 61))))
(check-sat)
(pop 1)
; Invalid
(get-info :rlimit)
