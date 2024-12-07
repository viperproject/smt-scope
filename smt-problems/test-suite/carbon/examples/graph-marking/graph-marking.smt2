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
(declare-fun left () T@U)
(declare-fun right () T@U)
(declare-fun is_marked () T@U)
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
(assert  (and (and (and (and (and (and (and (and (forall ((arg0@@11 T@T) (arg1 T@T) ) (! (= (Ctor (FieldType arg0@@11 arg1)) 6)
 :qid |ctor:FieldType|
)) (forall ((arg0@@12 T@T) (arg1@@0 T@T) ) (! (= (FieldTypeInv0 (FieldType arg0@@12 arg1@@0)) arg0@@12)
 :qid |typeInv:FieldTypeInv0|
 :pattern ( (FieldType arg0@@12 arg1@@0))
))) (forall ((arg0@@13 T@T) (arg1@@1 T@T) ) (! (= (FieldTypeInv1 (FieldType arg0@@13 arg1@@1)) arg1@@1)
 :qid |typeInv:FieldTypeInv1|
 :pattern ( (FieldType arg0@@13 arg1@@1))
))) (= (Ctor NormalFieldType) 7)) (= (type $allocated) (FieldType NormalFieldType boolType))) (= (Ctor RefType) 8)) (= (type left) (FieldType NormalFieldType RefType))) (= (type right) (FieldType NormalFieldType RefType))) (= (type is_marked) (FieldType NormalFieldType boolType))))
(assert (distinct $allocated left right is_marked)
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
 :qid |stdinbpl.452:18|
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
 :qid |stdinbpl.383:15|
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
(assert (forall ((a@@1 T@U) (b@@1 T@U) (y@@1 T@U) ) (! (let ((T@@3 (type y@@1)))
 (=> (and (and (= (type a@@1) (MultiSetType T@@3)) (= (type b@@1) (MultiSetType T@@3))) (<= (|MultiSet#Select| a@@1 y@@1) (|MultiSet#Select| b@@1 y@@1))) (= (|MultiSet#Select| (|MultiSet#Difference| a@@1 b@@1) y@@1) 0)))
 :qid |stdinbpl.450:18|
 :skolemid |73|
 :pattern ( (|MultiSet#Difference| a@@1 b@@1) (|MultiSet#Select| b@@1 y@@1) (|MultiSet#Select| a@@1 y@@1))
)))
(assert  (and (and (and (and (and (and (and (forall ((arg0@@30 T@T) (arg1@@12 T@T) ) (! (= (Ctor (MapType2Type arg0@@30 arg1@@12)) 13)
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
)))) (forall ((arg0@@35 T@U) (arg1@@17 T@U) ) (! (let ((T@@4 (MapType2TypeInv0 (type arg0@@35))))
(= (type (|Set#Union| arg0@@35 arg1@@17)) (MapType2Type T@@4 boolType)))
 :qid |funType:Set#Union|
 :pattern ( (|Set#Union| arg0@@35 arg1@@17))
))))
(assert (forall ((a@@2 T@U) (b@@2 T@U) ) (! (let ((T@@5 (MapType2TypeInv0 (type a@@2))))
 (=> (and (= (type a@@2) (MapType2Type T@@5 boolType)) (= (type b@@2) (MapType2Type T@@5 boolType))) (= (|Set#Union| (|Set#Union| a@@2 b@@2) b@@2) (|Set#Union| a@@2 b@@2))))
 :qid |stdinbpl.335:18|
 :skolemid |38|
 :pattern ( (|Set#Union| (|Set#Union| a@@2 b@@2) b@@2))
)))
(assert (forall ((arg0@@36 T@U) (arg1@@18 T@U) ) (! (let ((T@@6 (MapType2TypeInv0 (type arg0@@36))))
(= (type (|Set#Intersection| arg0@@36 arg1@@18)) (MapType2Type T@@6 boolType)))
 :qid |funType:Set#Intersection|
 :pattern ( (|Set#Intersection| arg0@@36 arg1@@18))
)))
(assert (forall ((a@@3 T@U) (b@@3 T@U) ) (! (let ((T@@7 (MapType2TypeInv0 (type a@@3))))
 (=> (and (= (type a@@3) (MapType2Type T@@7 boolType)) (= (type b@@3) (MapType2Type T@@7 boolType))) (= (|Set#Intersection| (|Set#Intersection| a@@3 b@@3) b@@3) (|Set#Intersection| a@@3 b@@3))))
 :qid |stdinbpl.339:18|
 :skolemid |40|
 :pattern ( (|Set#Intersection| (|Set#Intersection| a@@3 b@@3) b@@3))
)))
(assert (forall ((a@@4 T@U) (b@@4 T@U) ) (! (let ((T@@8 (MultiSetTypeInv0 (type a@@4))))
 (=> (and (= (type a@@4) (MultiSetType T@@8)) (= (type b@@4) (MultiSetType T@@8))) (= (|MultiSet#Intersection| (|MultiSet#Intersection| a@@4 b@@4) b@@4) (|MultiSet#Intersection| a@@4 b@@4))))
 :qid |stdinbpl.441:18|
 :skolemid |70|
 :pattern ( (|MultiSet#Intersection| (|MultiSet#Intersection| a@@4 b@@4) b@@4))
)))
(assert (forall ((arg0@@37 T@U) ) (! (let ((T@@9 (type arg0@@37)))
(= (type (|Set#Singleton| arg0@@37)) (MapType2Type T@@9 boolType)))
 :qid |funType:Set#Singleton|
 :pattern ( (|Set#Singleton| arg0@@37))
)))
(assert (forall ((r T@U) (o T@U) ) (! (let ((T@@10 (type r)))
 (=> (= (type o) T@@10) (= (U_2_bool (MapType2Select (|Set#Singleton| r) o)) (= r o))))
 :qid |stdinbpl.304:18|
 :skolemid |27|
 :pattern ( (MapType2Select (|Set#Singleton| r) o))
)))
(assert (forall ((a@@5 T@U) (b@@5 T@U) ) (! (let ((T@@11 (MapType2TypeInv0 (type a@@5))))
 (=> (and (= (type a@@5) (MapType2Type T@@11 boolType)) (= (type b@@5) (MapType2Type T@@11 boolType))) (= (+ (|Set#Card| (|Set#Union| a@@5 b@@5)) (|Set#Card| (|Set#Intersection| a@@5 b@@5))) (+ (|Set#Card| a@@5) (|Set#Card| b@@5)))))
 :qid |stdinbpl.343:18|
 :skolemid |42|
 :pattern ( (|Set#Card| (|Set#Union| a@@5 b@@5)))
 :pattern ( (|Set#Card| (|Set#Intersection| a@@5 b@@5)))
)))
(assert (forall ((Heap@@2 T@U) (ExhaleHeap@@1 T@U) (Mask@@2 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@2) (MapType0Type RefType)) (= (type ExhaleHeap@@1) (MapType0Type RefType))) (= (type Mask@@2) (MapType1Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@2 ExhaleHeap@@1 Mask@@2)) (U_2_bool (MapType0Select Heap@@2 o_1 $allocated))) (U_2_bool (MapType0Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.73:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@2 ExhaleHeap@@1 Mask@@2) (MapType0Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert (forall ((a@@6 Int) ) (!  (=> (<= 0 a@@6) (= (|Math#clip| a@@6) a@@6))
 :qid |stdinbpl.386:15|
 :skolemid |54|
 :pattern ( (|Math#clip| a@@6))
)))
(assert (forall ((a@@7 T@U) (b@@6 T@U) (o@@0 T@U) ) (! (let ((T@@12 (type o@@0)))
 (=> (and (= (type a@@7) (MultiSetType T@@12)) (= (type b@@6) (MultiSetType T@@12))) (= (|MultiSet#Select| (|MultiSet#Intersection| a@@7 b@@6) o@@0) (|Math#min| (|MultiSet#Select| a@@7 o@@0) (|MultiSet#Select| b@@6 o@@0)))))
 :qid |stdinbpl.437:18|
 :skolemid |69|
 :pattern ( (|MultiSet#Select| (|MultiSet#Intersection| a@@7 b@@6) o@@0))
)))
(assert (forall ((Heap@@3 T@U) (ExhaleHeap@@2 T@U) (Mask@@3 T@U) (o_1@@0 T@U) (f_2 T@U) ) (! (let ((B@@1 (FieldTypeInv1 (type f_2))))
(let ((A@@1 (FieldTypeInv0 (type f_2))))
 (=> (and (and (and (and (and (and (= (type Heap@@3) (MapType0Type RefType)) (= (type ExhaleHeap@@2) (MapType0Type RefType))) (= (type Mask@@3) (MapType1Type RefType realType))) (= (type o_1@@0) RefType)) (= (type f_2) (FieldType A@@1 B@@1))) (IdenticalOnKnownLocations Heap@@3 ExhaleHeap@@2 Mask@@3)) (HasDirectPerm Mask@@3 o_1@@0 f_2)) (= (MapType0Select Heap@@3 o_1@@0 f_2) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2)))))
 :qid |stdinbpl.42:22|
 :skolemid |1|
 :pattern ( (IdenticalOnKnownLocations Heap@@3 ExhaleHeap@@2 Mask@@3) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2))
)))
(assert  (and (= (type dummyHeap) (MapType0Type RefType)) (= (type ZeroMask) (MapType1Type RefType realType))))
(assert (state dummyHeap ZeroMask))
(assert (forall ((arg0@@38 T@U) (arg1@@19 T@U) ) (! (let ((T@@13 (type arg1@@19)))
(= (type (|MultiSet#UnionOne| arg0@@38 arg1@@19)) (MultiSetType T@@13)))
 :qid |funType:MultiSet#UnionOne|
 :pattern ( (|MultiSet#UnionOne| arg0@@38 arg1@@19))
)))
(assert (forall ((a@@8 T@U) (x@@8 T@U) ) (! (let ((T@@14 (type x@@8)))
 (=> (= (type a@@8) (MultiSetType T@@14)) (= (|MultiSet#Card| (|MultiSet#UnionOne| a@@8 x@@8)) (+ (|MultiSet#Card| a@@8) 1))))
 :qid |stdinbpl.423:18|
 :skolemid |65|
 :pattern ( (|MultiSet#Card| (|MultiSet#UnionOne| a@@8 x@@8)))
 :pattern ( (|MultiSet#UnionOne| a@@8 x@@8) (|MultiSet#Card| a@@8))
)))
(assert (forall ((a@@9 T@U) (b@@7 T@U) ) (! (let ((T@@15 (MultiSetTypeInv0 (type a@@9))))
 (=> (and (= (type a@@9) (MultiSetType T@@15)) (= (type b@@7) (MultiSetType T@@15))) (= (|MultiSet#Disjoint| a@@9 b@@7) (forall ((o@@1 T@U) ) (!  (=> (= (type o@@1) T@@15) (or (= (|MultiSet#Select| a@@9 o@@1) 0) (= (|MultiSet#Select| b@@7 o@@1) 0)))
 :qid |stdinbpl.473:39|
 :skolemid |80|
 :pattern ( (|MultiSet#Select| a@@9 o@@1))
 :pattern ( (|MultiSet#Select| b@@7 o@@1))
)))))
 :qid |stdinbpl.472:18|
 :skolemid |81|
 :pattern ( (|MultiSet#Disjoint| a@@9 b@@7))
)))
(assert (forall ((p T@U) (v_1 T@U) (w T@U) ) (! (let ((A@@2 (FieldTypeInv0 (type p))))
 (=> (and (and (= (type p) (FieldType A@@2 FrameTypeType)) (= (type v_1) FrameTypeType)) (= (type w) FrameTypeType)) (not (InsidePredicate p v_1 p w))))
 :qid |stdinbpl.281:19|
 :skolemid |21|
 :pattern ( (InsidePredicate p v_1 p w))
)))
(assert (forall ((arg0@@39 T@U) ) (! (let ((T@@16 (type arg0@@39)))
(= (type (|MultiSet#Singleton| arg0@@39)) (MultiSetType T@@16)))
 :qid |funType:MultiSet#Singleton|
 :pattern ( (|MultiSet#Singleton| arg0@@39))
)))
(assert (forall ((r@@0 T@U) ) (!  (and (= (|MultiSet#Card| (|MultiSet#Singleton| r@@0)) 1) (= (|MultiSet#Select| (|MultiSet#Singleton| r@@0) r@@0) 1))
 :qid |stdinbpl.415:18|
 :skolemid |62|
 :pattern ( (|MultiSet#Singleton| r@@0))
)))
(assert  (not (IsPredicateField left)))
(assert  (not (IsWandField left)))
(assert  (not (IsPredicateField right)))
(assert  (not (IsWandField right)))
(assert  (not (IsPredicateField is_marked)))
(assert  (not (IsWandField is_marked)))
(assert (forall ((Heap@@4 T@U) (ExhaleHeap@@3 T@U) (Mask@@4 T@U) ) (!  (=> (and (and (and (= (type Heap@@4) (MapType0Type RefType)) (= (type ExhaleHeap@@3) (MapType0Type RefType))) (= (type Mask@@4) (MapType1Type RefType realType))) (IdenticalOnKnownLocations Heap@@4 ExhaleHeap@@3 Mask@@4)) (succHeap Heap@@4 ExhaleHeap@@3))
 :qid |stdinbpl.83:15|
 :skolemid |10|
 :pattern ( (IdenticalOnKnownLocations Heap@@4 ExhaleHeap@@3 Mask@@4))
)))
(assert (forall ((a@@10 T@U) (b@@8 T@U) ) (! (let ((T@@17 (MapType2TypeInv0 (type a@@10))))
 (=> (and (= (type a@@10) (MapType2Type T@@17 boolType)) (= (type b@@8) (MapType2Type T@@17 boolType))) (= (|Set#Equal| a@@10 b@@8) (forall ((o@@2 T@U) ) (!  (=> (= (type o@@2) T@@17) (= (U_2_bool (MapType2Select a@@10 o@@2)) (U_2_bool (MapType2Select b@@8 o@@2))))
 :qid |stdinbpl.368:31|
 :skolemid |48|
 :pattern ( (MapType2Select a@@10 o@@2))
 :pattern ( (MapType2Select b@@8 o@@2))
)))))
 :qid |stdinbpl.367:17|
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
 :qid |stdinbpl.433:18|
 :skolemid |68|
 :pattern ( (|MultiSet#Card| (|MultiSet#Union| a@@11 b@@9)))
 :pattern ( (|MultiSet#Card| a@@11) (|MultiSet#Union| a@@11 b@@9))
 :pattern ( (|MultiSet#Card| b@@9) (|MultiSet#Union| a@@11 b@@9))
)))
(assert  (and (forall ((arg0@@40 Real) (arg1@@20 T@U) ) (! (= (type (ConditionalFrame arg0@@40 arg1@@20)) FrameTypeType)
 :qid |funType:ConditionalFrame|
 :pattern ( (ConditionalFrame arg0@@40 arg1@@20))
)) (= (type EmptyFrame) FrameTypeType)))
(assert (forall ((p@@0 Real) (f_6 T@U) ) (!  (=> (= (type f_6) FrameTypeType) (= (ConditionalFrame p@@0 f_6) (ite (> p@@0 0.0) f_6 EmptyFrame)))
 :qid |stdinbpl.269:15|
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
 :qid |stdinbpl.332:18|
 :skolemid |37|
 :pattern ( (MapType2Select (|Set#Intersection| a@@12 b@@10) o@@3))
 :pattern ( (|Set#Intersection| a@@12 b@@10) (MapType2Select a@@12 o@@3))
 :pattern ( (|Set#Intersection| a@@12 b@@10) (MapType2Select b@@10 o@@3))
)))
(assert (forall ((arg0@@41 T@U) (arg1@@21 T@U) ) (! (let ((T@@20 (MapType2TypeInv0 (type arg0@@41))))
(= (type (|Set#Difference| arg0@@41 arg1@@21)) (MapType2Type T@@20 boolType)))
 :qid |funType:Set#Difference|
 :pattern ( (|Set#Difference| arg0@@41 arg1@@21))
)))
(assert (forall ((a@@13 T@U) (b@@11 T@U) (o@@4 T@U) ) (! (let ((T@@21 (type o@@4)))
 (=> (and (= (type a@@13) (MapType2Type T@@21 boolType)) (= (type b@@11) (MapType2Type T@@21 boolType))) (= (U_2_bool (MapType2Select (|Set#Difference| a@@13 b@@11) o@@4))  (and (U_2_bool (MapType2Select a@@13 o@@4)) (not (U_2_bool (MapType2Select b@@11 o@@4)))))))
 :qid |stdinbpl.347:18|
 :skolemid |43|
 :pattern ( (MapType2Select (|Set#Difference| a@@13 b@@11) o@@4))
 :pattern ( (|Set#Difference| a@@13 b@@11) (MapType2Select a@@13 o@@4))
)))
(assert (forall ((a@@14 T@U) (b@@12 T@U) ) (! (let ((T@@22 (MapType2TypeInv0 (type a@@14))))
 (=> (and (and (= (type a@@14) (MapType2Type T@@22 boolType)) (= (type b@@12) (MapType2Type T@@22 boolType))) (|Set#Equal| a@@14 b@@12)) (= a@@14 b@@12)))
 :qid |stdinbpl.369:17|
 :skolemid |50|
 :pattern ( (|Set#Equal| a@@14 b@@12))
)))
(assert (forall ((a@@15 T@U) (b@@13 T@U) ) (! (let ((T@@23 (MultiSetTypeInv0 (type a@@15))))
 (=> (and (and (= (type a@@15) (MultiSetType T@@23)) (= (type b@@13) (MultiSetType T@@23))) (|MultiSet#Equal| a@@15 b@@13)) (= a@@15 b@@13)))
 :qid |stdinbpl.468:17|
 :skolemid |79|
 :pattern ( (|MultiSet#Equal| a@@15 b@@13))
)))
(assert (forall ((arg0@@42 T@U) (arg1@@22 T@U) ) (! (let ((T@@24 (type arg1@@22)))
(= (type (|Set#UnionOne| arg0@@42 arg1@@22)) (MapType2Type T@@24 boolType)))
 :qid |funType:Set#UnionOne|
 :pattern ( (|Set#UnionOne| arg0@@42 arg1@@22))
)))
(assert (forall ((a@@16 T@U) (x@@9 T@U) (y@@2 T@U) ) (! (let ((T@@25 (type x@@9)))
 (=> (and (and (= (type a@@16) (MapType2Type T@@25 boolType)) (= (type y@@2) T@@25)) (U_2_bool (MapType2Select a@@16 y@@2))) (U_2_bool (MapType2Select (|Set#UnionOne| a@@16 x@@9) y@@2))))
 :qid |stdinbpl.312:18|
 :skolemid |31|
 :pattern ( (|Set#UnionOne| a@@16 x@@9) (MapType2Select a@@16 y@@2))
)))
(assert (forall ((a@@17 T@U) (b@@14 T@U) (y@@3 T@U) ) (! (let ((T@@26 (type y@@3)))
 (=> (and (and (= (type a@@17) (MapType2Type T@@26 boolType)) (= (type b@@14) (MapType2Type T@@26 boolType))) (U_2_bool (MapType2Select a@@17 y@@3))) (U_2_bool (MapType2Select (|Set#Union| a@@17 b@@14) y@@3))))
 :qid |stdinbpl.322:18|
 :skolemid |35|
 :pattern ( (|Set#Union| a@@17 b@@14) (MapType2Select a@@17 y@@3))
)))
(assert (forall ((a@@18 T@U) (b@@15 T@U) (y@@4 T@U) ) (! (let ((T@@27 (type y@@4)))
 (=> (and (and (= (type a@@18) (MapType2Type T@@27 boolType)) (= (type b@@15) (MapType2Type T@@27 boolType))) (U_2_bool (MapType2Select b@@15 y@@4))) (U_2_bool (MapType2Select (|Set#Union| a@@18 b@@15) y@@4))))
 :qid |stdinbpl.324:18|
 :skolemid |36|
 :pattern ( (|Set#Union| a@@18 b@@15) (MapType2Select b@@15 y@@4))
)))
(assert (forall ((ms T@U) (x@@10 T@U) ) (! (let ((T@@28 (type x@@10)))
 (=> (= (type ms) (MultiSetType T@@28)) (>= (|MultiSet#Select| ms x@@10) 0)))
 :qid |stdinbpl.399:18|
 :skolemid |56|
 :pattern ( (|MultiSet#Select| ms x@@10))
)))
(assert (forall ((a@@19 T@U) (x@@11 T@U) (o@@5 T@U) ) (! (let ((T@@29 (type x@@11)))
 (=> (and (= (type a@@19) (MapType2Type T@@29 boolType)) (= (type o@@5) T@@29)) (= (U_2_bool (MapType2Select (|Set#UnionOne| a@@19 x@@11) o@@5))  (or (= o@@5 x@@11) (U_2_bool (MapType2Select a@@19 o@@5))))))
 :qid |stdinbpl.308:18|
 :skolemid |29|
 :pattern ( (MapType2Select (|Set#UnionOne| a@@19 x@@11) o@@5))
)))
(assert (forall ((a@@20 T@U) (b@@16 T@U) (y@@5 T@U) ) (! (let ((T@@30 (type y@@5)))
 (=> (and (and (= (type a@@20) (MapType2Type T@@30 boolType)) (= (type b@@16) (MapType2Type T@@30 boolType))) (U_2_bool (MapType2Select b@@16 y@@5))) (not (U_2_bool (MapType2Select (|Set#Difference| a@@20 b@@16) y@@5)))))
 :qid |stdinbpl.349:18|
 :skolemid |44|
 :pattern ( (|Set#Difference| a@@20 b@@16) (MapType2Select b@@16 y@@5))
)))
(assert (forall ((a@@21 T@U) (b@@17 T@U) ) (! (let ((T@@31 (MapType2TypeInv0 (type a@@21))))
 (=> (and (= (type a@@21) (MapType2Type T@@31 boolType)) (= (type b@@17) (MapType2Type T@@31 boolType))) (and (= (+ (+ (|Set#Card| (|Set#Difference| a@@21 b@@17)) (|Set#Card| (|Set#Difference| b@@17 a@@21))) (|Set#Card| (|Set#Intersection| a@@21 b@@17))) (|Set#Card| (|Set#Union| a@@21 b@@17))) (= (|Set#Card| (|Set#Difference| a@@21 b@@17)) (- (|Set#Card| a@@21) (|Set#Card| (|Set#Intersection| a@@21 b@@17)))))))
 :qid |stdinbpl.351:18|
 :skolemid |45|
 :pattern ( (|Set#Card| (|Set#Difference| a@@21 b@@17)))
)))
(assert (forall ((s T@U) ) (! (let ((T@@32 (MapType2TypeInv0 (type s))))
 (=> (= (type s) (MapType2Type T@@32 boolType)) (<= 0 (|Set#Card| s))))
 :qid |stdinbpl.294:18|
 :skolemid |22|
 :pattern ( (|Set#Card| s))
)))
(assert (forall ((s@@0 T@U) ) (! (let ((T@@33 (MultiSetTypeInv0 (type s@@0))))
 (=> (= (type s@@0) (MultiSetType T@@33)) (<= 0 (|MultiSet#Card| s@@0))))
 :qid |stdinbpl.402:18|
 :skolemid |57|
 :pattern ( (|MultiSet#Card| s@@0))
)))
(assert (forall ((T@@34 T@T) ) (! (= (type (|MultiSet#Empty| T@@34)) (MultiSetType T@@34))
 :qid |funType:MultiSet#Empty|
 :pattern ( (|MultiSet#Empty| T@@34))
)))
(assert (forall ((o@@6 T@U) ) (! (let ((T@@35 (type o@@6)))
(= (|MultiSet#Select| (|MultiSet#Empty| T@@35) o@@6) 0))
 :qid |stdinbpl.407:18|
 :skolemid |58|
 :pattern ( (let ((T@@35 (type o@@6)))
(|MultiSet#Select| (|MultiSet#Empty| T@@35) o@@6)))
)))
(assert (forall ((a@@22 T@U) (x@@12 T@U) ) (! (let ((T@@36 (type x@@12)))
 (=> (= (type a@@22) (MapType2Type T@@36 boolType)) (U_2_bool (MapType2Select (|Set#UnionOne| a@@22 x@@12) x@@12))))
 :qid |stdinbpl.310:18|
 :skolemid |30|
 :pattern ( (|Set#UnionOne| a@@22 x@@12))
)))
(assert (forall ((Heap@@5 T@U) (ExhaleHeap@@4 T@U) (Mask@@6 T@U) (pm_f@@1 T@U) ) (! (let ((C@@1 (FieldTypeInv0 (type pm_f@@1))))
 (=> (and (and (and (and (and (= (type Heap@@5) (MapType0Type RefType)) (= (type ExhaleHeap@@4) (MapType0Type RefType))) (= (type Mask@@6) (MapType1Type RefType realType))) (= (type pm_f@@1) (FieldType C@@1 FrameTypeType))) (IdenticalOnKnownLocations Heap@@5 ExhaleHeap@@4 Mask@@6)) (and (HasDirectPerm Mask@@6 null pm_f@@1) (IsPredicateField pm_f@@1))) (forall ((o2 T@U) (f_2@@0 T@U) ) (! (let ((B@@5 (FieldTypeInv1 (type f_2@@0))))
(let ((A@@6 (FieldTypeInv0 (type f_2@@0))))
 (=> (and (and (= (type o2) RefType) (= (type f_2@@0) (FieldType A@@6 B@@5))) (U_2_bool (MapType1Select (MapType0Select Heap@@5 null (PredicateMaskField pm_f@@1)) o2 f_2@@0))) (= (MapType0Select Heap@@5 o2 f_2@@0) (MapType0Select ExhaleHeap@@4 o2 f_2@@0)))))
 :qid |stdinbpl.54:134|
 :skolemid |3|
 :pattern ( (MapType0Select ExhaleHeap@@4 o2 f_2@@0))
))))
 :qid |stdinbpl.52:19|
 :skolemid |4|
 :pattern ( (IdenticalOnKnownLocations Heap@@5 ExhaleHeap@@4 Mask@@6) (IsPredicateField pm_f@@1))
)))
(assert (forall ((Heap@@6 T@U) (ExhaleHeap@@5 T@U) (Mask@@7 T@U) (pm_f@@2 T@U) ) (! (let ((C@@2 (FieldTypeInv0 (type pm_f@@2))))
 (=> (and (and (and (and (and (= (type Heap@@6) (MapType0Type RefType)) (= (type ExhaleHeap@@5) (MapType0Type RefType))) (= (type Mask@@7) (MapType1Type RefType realType))) (= (type pm_f@@2) (FieldType C@@2 FrameTypeType))) (IdenticalOnKnownLocations Heap@@6 ExhaleHeap@@5 Mask@@7)) (and (HasDirectPerm Mask@@7 null pm_f@@2) (IsWandField pm_f@@2))) (forall ((o2@@0 T@U) (f_2@@1 T@U) ) (! (let ((B@@6 (FieldTypeInv1 (type f_2@@1))))
(let ((A@@7 (FieldTypeInv0 (type f_2@@1))))
 (=> (and (and (= (type o2@@0) RefType) (= (type f_2@@1) (FieldType A@@7 B@@6))) (U_2_bool (MapType1Select (MapType0Select Heap@@6 null (WandMaskField pm_f@@2)) o2@@0 f_2@@1))) (= (MapType0Select Heap@@6 o2@@0 f_2@@1) (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1)))))
 :qid |stdinbpl.67:129|
 :skolemid |6|
 :pattern ( (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1))
))))
 :qid |stdinbpl.65:19|
 :skolemid |7|
 :pattern ( (IdenticalOnKnownLocations Heap@@6 ExhaleHeap@@5 Mask@@7) (IsWandField pm_f@@2))
)))
(assert (forall ((a@@23 T@U) (x@@13 T@U) ) (! (let ((T@@37 (type x@@13)))
 (=> (and (= (type a@@23) (MapType2Type T@@37 boolType)) (U_2_bool (MapType2Select a@@23 x@@13))) (= (|Set#Card| (|Set#UnionOne| a@@23 x@@13)) (|Set#Card| a@@23))))
 :qid |stdinbpl.314:18|
 :skolemid |32|
 :pattern ( (|Set#Card| (|Set#UnionOne| a@@23 x@@13)))
)))
(assert (forall ((a@@24 T@U) (x@@14 T@U) ) (! (let ((T@@38 (type x@@14)))
 (=> (= (type a@@24) (MultiSetType T@@38)) (and (> (|MultiSet#Select| (|MultiSet#UnionOne| a@@24 x@@14) x@@14) 0) (> (|MultiSet#Card| (|MultiSet#UnionOne| a@@24 x@@14)) 0))))
 :qid |stdinbpl.426:18|
 :skolemid |66|
 :pattern ( (|MultiSet#UnionOne| a@@24 x@@14))
)))
(assert (forall ((r@@1 T@U) ) (! (= (|Set#Card| (|Set#Singleton| r@@1)) 1)
 :qid |stdinbpl.305:18|
 :skolemid |28|
 :pattern ( (|Set#Card| (|Set#Singleton| r@@1)))
)))
(assert (forall ((Mask@@8 T@U) (o_2@@2 T@U) (f_4@@2 T@U) ) (! (let ((B@@7 (FieldTypeInv1 (type f_4@@2))))
(let ((A@@8 (FieldTypeInv0 (type f_4@@2))))
 (=> (and (and (and (= (type Mask@@8) (MapType1Type RefType realType)) (= (type o_2@@2) RefType)) (= (type f_4@@2) (FieldType A@@8 B@@7))) (GoodMask Mask@@8)) (and (>= (U_2_real (MapType1Select Mask@@8 o_2@@2 f_4@@2)) NoPerm) (=> (and (and (GoodMask Mask@@8) (not (IsPredicateField f_4@@2))) (not (IsWandField f_4@@2))) (<= (U_2_real (MapType1Select Mask@@8 o_2@@2 f_4@@2)) FullPerm))))))
 :qid |stdinbpl.128:22|
 :skolemid |16|
 :pattern ( (GoodMask Mask@@8) (MapType1Select Mask@@8 o_2@@2 f_4@@2))
)))
(assert (forall ((r@@2 T@U) ) (! (U_2_bool (MapType2Select (|Set#Singleton| r@@2) r@@2))
 :qid |stdinbpl.303:18|
 :skolemid |26|
 :pattern ( (|Set#Singleton| r@@2))
)))
(assert (forall ((a@@25 T@U) (b@@18 T@U) ) (! (let ((T@@39 (MapType2TypeInv0 (type a@@25))))
 (=> (and (= (type a@@25) (MapType2Type T@@39 boolType)) (= (type b@@18) (MapType2Type T@@39 boolType))) (= (|Set#Union| a@@25 (|Set#Union| a@@25 b@@18)) (|Set#Union| a@@25 b@@18))))
 :qid |stdinbpl.337:18|
 :skolemid |39|
 :pattern ( (|Set#Union| a@@25 (|Set#Union| a@@25 b@@18)))
)))
(assert (forall ((a@@26 T@U) (b@@19 T@U) ) (! (let ((T@@40 (MapType2TypeInv0 (type a@@26))))
 (=> (and (= (type a@@26) (MapType2Type T@@40 boolType)) (= (type b@@19) (MapType2Type T@@40 boolType))) (= (|Set#Intersection| a@@26 (|Set#Intersection| a@@26 b@@19)) (|Set#Intersection| a@@26 b@@19))))
 :qid |stdinbpl.341:18|
 :skolemid |41|
 :pattern ( (|Set#Intersection| a@@26 (|Set#Intersection| a@@26 b@@19)))
)))
(assert (forall ((a@@27 T@U) (b@@20 T@U) ) (! (let ((T@@41 (MultiSetTypeInv0 (type a@@27))))
 (=> (and (= (type a@@27) (MultiSetType T@@41)) (= (type b@@20) (MultiSetType T@@41))) (= (|MultiSet#Intersection| a@@27 (|MultiSet#Intersection| a@@27 b@@20)) (|MultiSet#Intersection| a@@27 b@@20))))
 :qid |stdinbpl.443:18|
 :skolemid |71|
 :pattern ( (|MultiSet#Intersection| a@@27 (|MultiSet#Intersection| a@@27 b@@20)))
)))
(assert (forall ((s@@1 T@U) ) (! (let ((T@@42 (MultiSetTypeInv0 (type s@@1))))
 (=> (= (type s@@1) (MultiSetType T@@42)) (and (= (= (|MultiSet#Card| s@@1) 0) (= s@@1 (|MultiSet#Empty| T@@42))) (=> (not (= (|MultiSet#Card| s@@1) 0)) (exists ((x@@15 T@U) ) (!  (and (= (type x@@15) T@@42) (< 0 (|MultiSet#Select| s@@1 x@@15)))
 :qid |stdinbpl.410:38|
 :skolemid |59|
 :no-pattern (type x@@15)
 :no-pattern (U_2_int x@@15)
 :no-pattern (U_2_bool x@@15)
))))))
 :qid |stdinbpl.408:18|
 :skolemid |60|
 :pattern ( (|MultiSet#Card| s@@1))
)))
(assert (forall ((r@@3 T@U) (o@@7 T@U) ) (! (let ((T@@43 (type r@@3)))
 (=> (= (type o@@7) T@@43) (and (= (= (|MultiSet#Select| (|MultiSet#Singleton| r@@3) o@@7) 1) (= r@@3 o@@7)) (= (= (|MultiSet#Select| (|MultiSet#Singleton| r@@3) o@@7) 0) (not (= r@@3 o@@7))))))
 :qid |stdinbpl.413:18|
 :skolemid |61|
 :pattern ( (|MultiSet#Select| (|MultiSet#Singleton| r@@3) o@@7))
)))
(assert (forall ((o@@8 T@U) (f T@U) (Heap@@7 T@U) ) (!  (=> (and (and (and (= (type o@@8) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap@@7) (MapType0Type RefType))) (U_2_bool (MapType0Select Heap@@7 o@@8 $allocated))) (U_2_bool (MapType0Select Heap@@7 (MapType0Select Heap@@7 o@@8 f) $allocated)))
 :qid |stdinbpl.31:15|
 :skolemid |0|
 :pattern ( (MapType0Select Heap@@7 o@@8 f))
)))
(assert (forall ((a@@28 T@U) (b@@21 T@U) (o@@9 T@U) ) (! (let ((T@@44 (type o@@9)))
 (=> (and (= (type a@@28) (MultiSetType T@@44)) (= (type b@@21) (MultiSetType T@@44))) (= (|MultiSet#Select| (|MultiSet#Union| a@@28 b@@21) o@@9) (+ (|MultiSet#Select| a@@28 o@@9) (|MultiSet#Select| b@@21 o@@9)))))
 :qid |stdinbpl.431:18|
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
 :qid |stdinbpl.297:18|
 :skolemid |23|
 :pattern ( (let ((T@@46 (type o@@10)))
(MapType2Select (|Set#Empty| T@@46) o@@10)))
)))
(assert (forall ((r@@4 T@U) ) (! (let ((T@@47 (type r@@4)))
(= (|MultiSet#Singleton| r@@4) (|MultiSet#UnionOne| (|MultiSet#Empty| T@@47) r@@4)))
 :qid |stdinbpl.416:18|
 :skolemid |63|
 :pattern ( (|MultiSet#Singleton| r@@4))
)))
(assert (forall ((a@@29 Int) (b@@22 Int) ) (! (= (<= a@@29 b@@22) (= (|Math#min| a@@29 b@@22) a@@29))
 :qid |stdinbpl.381:15|
 :skolemid |51|
 :pattern ( (|Math#min| a@@29 b@@22))
)))
(assert (forall ((a@@30 Int) (b@@23 Int) ) (! (= (<= b@@23 a@@30) (= (|Math#min| a@@30 b@@23) b@@23))
 :qid |stdinbpl.382:15|
 :skolemid |52|
 :pattern ( (|Math#min| a@@30 b@@23))
)))
(assert (forall ((s@@2 T@U) ) (! (let ((T@@48 (MapType2TypeInv0 (type s@@2))))
 (=> (= (type s@@2) (MapType2Type T@@48 boolType)) (and (= (= (|Set#Card| s@@2) 0) (= s@@2 (|Set#Empty| T@@48))) (=> (not (= (|Set#Card| s@@2) 0)) (exists ((x@@16 T@U) ) (!  (and (= (type x@@16) T@@48) (U_2_bool (MapType2Select s@@2 x@@16)))
 :qid |stdinbpl.300:33|
 :skolemid |24|
 :no-pattern (type x@@16)
 :no-pattern (U_2_int x@@16)
 :no-pattern (U_2_bool x@@16)
))))))
 :qid |stdinbpl.298:18|
 :skolemid |25|
 :pattern ( (|Set#Card| s@@2))
)))
(assert (forall ((Heap@@8 T@U) (o@@11 T@U) (f_3 T@U) (v T@U) ) (! (let ((B@@8 (type v)))
(let ((A@@9 (FieldTypeInv0 (type f_3))))
 (=> (and (and (= (type Heap@@8) (MapType0Type RefType)) (= (type o@@11) RefType)) (= (type f_3) (FieldType A@@9 B@@8))) (succHeap Heap@@8 (MapType0Store Heap@@8 o@@11 f_3 v)))))
 :qid |stdinbpl.78:22|
 :skolemid |9|
 :pattern ( (MapType0Store Heap@@8 o@@11 f_3 v))
)))
(assert (forall ((a@@31 T@U) (b@@24 T@U) ) (! (let ((T@@49 (MapType2TypeInv0 (type a@@31))))
 (=> (and (= (type a@@31) (MapType2Type T@@49 boolType)) (= (type b@@24) (MapType2Type T@@49 boolType))) (= (|Set#Subset| a@@31 b@@24) (forall ((o@@12 T@U) ) (!  (=> (and (= (type o@@12) T@@49) (U_2_bool (MapType2Select a@@31 o@@12))) (U_2_bool (MapType2Select b@@24 o@@12)))
 :qid |stdinbpl.360:32|
 :skolemid |46|
 :pattern ( (MapType2Select a@@31 o@@12))
 :pattern ( (MapType2Select b@@24 o@@12))
)))))
 :qid |stdinbpl.359:17|
 :skolemid |47|
 :pattern ( (|Set#Subset| a@@31 b@@24))
)))
(assert (forall ((a@@32 T@U) (x@@17 T@U) ) (! (let ((T@@50 (type x@@17)))
 (=> (and (= (type a@@32) (MapType2Type T@@50 boolType)) (not (U_2_bool (MapType2Select a@@32 x@@17)))) (= (|Set#Card| (|Set#UnionOne| a@@32 x@@17)) (+ (|Set#Card| a@@32) 1))))
 :qid |stdinbpl.316:18|
 :skolemid |33|
 :pattern ( (|Set#Card| (|Set#UnionOne| a@@32 x@@17)))
)))
(assert (forall ((a@@33 T@U) (b@@25 T@U) (o@@13 T@U) ) (! (let ((T@@51 (type o@@13)))
 (=> (and (= (type a@@33) (MultiSetType T@@51)) (= (type b@@25) (MultiSetType T@@51))) (= (|MultiSet#Select| (|MultiSet#Difference| a@@33 b@@25) o@@13) (|Math#clip| (- (|MultiSet#Select| a@@33 o@@13) (|MultiSet#Select| b@@25 o@@13))))))
 :qid |stdinbpl.448:18|
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
 :qid |stdinbpl.276:25|
 :skolemid |20|
 :pattern ( (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r@@5 u))
)))
(assert (forall ((a@@34 Int) ) (!  (=> (< a@@34 0) (= (|Math#clip| a@@34) 0))
 :qid |stdinbpl.387:15|
 :skolemid |55|
 :pattern ( (|Math#clip| a@@34))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
(assert (forall ((a@@35 T@U) (x@@18 T@U) (o@@14 T@U) ) (! (let ((T@@52 (type x@@18)))
 (=> (and (= (type a@@35) (MultiSetType T@@52)) (= (type o@@14) T@@52)) (= (|MultiSet#Select| (|MultiSet#UnionOne| a@@35 x@@18) o@@14) (ite (= x@@18 o@@14) (+ (|MultiSet#Select| a@@35 o@@14) 1) (|MultiSet#Select| a@@35 o@@14)))))
 :qid |stdinbpl.420:18|
 :skolemid |64|
 :pattern ( (|MultiSet#Select| (|MultiSet#UnionOne| a@@35 x@@18) o@@14))
 :pattern ( (|MultiSet#UnionOne| a@@35 x@@18) (|MultiSet#Select| a@@35 o@@14))
)))
(assert (forall ((a@@36 T@U) (b@@26 T@U) ) (! (let ((T@@53 (MultiSetTypeInv0 (type a@@36))))
 (=> (and (= (type a@@36) (MultiSetType T@@53)) (= (type b@@26) (MultiSetType T@@53))) (= (|MultiSet#Equal| a@@36 b@@26) (forall ((o@@15 T@U) ) (!  (=> (= (type o@@15) T@@53) (= (|MultiSet#Select| a@@36 o@@15) (|MultiSet#Select| b@@26 o@@15)))
 :qid |stdinbpl.466:36|
 :skolemid |77|
 :pattern ( (|MultiSet#Select| a@@36 o@@15))
 :pattern ( (|MultiSet#Select| b@@26 o@@15))
)))))
 :qid |stdinbpl.465:17|
 :skolemid |78|
 :pattern ( (|MultiSet#Equal| a@@36 b@@26))
)))
(assert (forall ((a@@37 T@U) (b@@27 T@U) ) (! (let ((T@@54 (MultiSetTypeInv0 (type a@@37))))
 (=> (and (= (type a@@37) (MultiSetType T@@54)) (= (type b@@27) (MultiSetType T@@54))) (= (|MultiSet#Subset| a@@37 b@@27) (forall ((o@@16 T@U) ) (!  (=> (= (type o@@16) T@@54) (<= (|MultiSet#Select| a@@37 o@@16) (|MultiSet#Select| b@@27 o@@16)))
 :qid |stdinbpl.462:37|
 :skolemid |75|
 :pattern ( (|MultiSet#Select| a@@37 o@@16))
 :pattern ( (|MultiSet#Select| b@@27 o@@16))
)))))
 :qid |stdinbpl.461:17|
 :skolemid |76|
 :pattern ( (|MultiSet#Subset| a@@37 b@@27))
)))
(assert (forall ((a@@38 T@U) (b@@28 T@U) (o@@17 T@U) ) (! (let ((T@@55 (type o@@17)))
 (=> (and (= (type a@@38) (MapType2Type T@@55 boolType)) (= (type b@@28) (MapType2Type T@@55 boolType))) (= (U_2_bool (MapType2Select (|Set#Union| a@@38 b@@28) o@@17))  (or (U_2_bool (MapType2Select a@@38 o@@17)) (U_2_bool (MapType2Select b@@28 o@@17))))))
 :qid |stdinbpl.320:18|
 :skolemid |34|
 :pattern ( (MapType2Select (|Set#Union| a@@38 b@@28) o@@17))
)))
(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun PostHeap@0 () T@U)
(declare-fun n_8 () T@U)
(declare-fun QPMask@20 () T@U)
(declare-fun Heap@@9 () T@U)
(declare-fun nodes () T@U)
(declare-fun QPMask@2 () T@U)
(declare-fun n_6 () T@U)
(declare-fun n_4 () T@U)
(declare-fun n_2 () T@U)
(declare-fun node () T@U)
(declare-fun n () T@U)
(declare-fun n$8 () T@U)
(declare-fun n$7 () T@U)
(declare-fun qpRange6 (T@U) Bool)
(declare-fun invRecv6 (T@U) T@U)
(declare-fun QPMask@19 () T@U)
(declare-fun qpRange5 (T@U) Bool)
(declare-fun invRecv5 (T@U) T@U)
(declare-fun QPMask@18 () T@U)
(declare-fun qpRange4 (T@U) Bool)
(declare-fun invRecv4 (T@U) T@U)
(declare-fun n$3_2 () T@U)
(declare-fun Heap@0 () T@U)
(declare-fun n$2_2 () T@U)
(declare-fun n$3_4 () T@U)
(declare-fun Heap@1 () T@U)
(declare-fun n$2_4 () T@U)
(declare-fun n_20 () T@U)
(declare-fun Heap@2 () T@U)
(declare-fun n_18 () T@U)
(declare-fun n_16 () T@U)
(declare-fun n_14 () T@U)
(declare-fun n_12 () T@U)
(declare-fun n$8_2 () T@U)
(declare-fun n$7_2 () T@U)
(declare-fun Mask@1 () T@U)
(declare-fun neverTriggered7 (T@U) Bool)
(declare-fun QPMask@15 () T@U)
(declare-fun qpRange7 (T@U) Bool)
(declare-fun invRecv7 (T@U) T@U)
(declare-fun neverTriggered8 (T@U) Bool)
(declare-fun QPMask@16 () T@U)
(declare-fun qpRange8 (T@U) Bool)
(declare-fun invRecv8 (T@U) T@U)
(declare-fun neverTriggered9 (T@U) Bool)
(declare-fun QPMask@17 () T@U)
(declare-fun qpRange9 (T@U) Bool)
(declare-fun invRecv9 (T@U) T@U)
(declare-fun arg_node_1@0 () T@U)
(declare-fun ExhaleHeap@1 () T@U)
(declare-fun QPMask@11 () T@U)
(declare-fun QPMask@12 () T@U)
(declare-fun qpRange19 (T@U) Bool)
(declare-fun invRecv19 (T@U) T@U)
(declare-fun QPMask@13 () T@U)
(declare-fun qpRange20 (T@U) Bool)
(declare-fun invRecv20 (T@U) T@U)
(declare-fun QPMask@14 () T@U)
(declare-fun qpRange21 (T@U) Bool)
(declare-fun invRecv21 (T@U) T@U)
(declare-fun Mask@0 () T@U)
(declare-fun neverTriggered16 (T@U) Bool)
(declare-fun QPMask@9 () T@U)
(declare-fun qpRange16 (T@U) Bool)
(declare-fun invRecv16 (T@U) T@U)
(declare-fun neverTriggered17 (T@U) Bool)
(declare-fun QPMask@10 () T@U)
(declare-fun qpRange17 (T@U) Bool)
(declare-fun invRecv17 (T@U) T@U)
(declare-fun neverTriggered18 (T@U) Bool)
(declare-fun qpRange18 (T@U) Bool)
(declare-fun invRecv18 (T@U) T@U)
(declare-fun arg_node@0 () T@U)
(declare-fun ExhaleHeap@0 () T@U)
(declare-fun QPMask@5 () T@U)
(declare-fun QPMask@6 () T@U)
(declare-fun qpRange13 (T@U) Bool)
(declare-fun invRecv13 (T@U) T@U)
(declare-fun QPMask@7 () T@U)
(declare-fun qpRange14 (T@U) Bool)
(declare-fun invRecv14 (T@U) T@U)
(declare-fun QPMask@8 () T@U)
(declare-fun qpRange15 (T@U) Bool)
(declare-fun invRecv15 (T@U) T@U)
(declare-fun neverTriggered10 (T@U) Bool)
(declare-fun QPMask@3 () T@U)
(declare-fun qpRange10 (T@U) Bool)
(declare-fun invRecv10 (T@U) T@U)
(declare-fun neverTriggered11 (T@U) Bool)
(declare-fun QPMask@4 () T@U)
(declare-fun qpRange11 (T@U) Bool)
(declare-fun invRecv11 (T@U) T@U)
(declare-fun neverTriggered12 (T@U) Bool)
(declare-fun qpRange12 (T@U) Bool)
(declare-fun invRecv12 (T@U) T@U)
(declare-fun n$3 () T@U)
(declare-fun n$2 () T@U)
(declare-fun qpRange3 (T@U) Bool)
(declare-fun invRecv3 (T@U) T@U)
(declare-fun QPMask@1 () T@U)
(declare-fun qpRange2 (T@U) Bool)
(declare-fun invRecv2 (T@U) T@U)
(declare-fun QPMask@0 () T@U)
(declare-fun qpRange1 (T@U) Bool)
(declare-fun invRecv1 (T@U) T@U)
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (= (type nodes) (MapType2Type RefType boolType)) (= (type n$2) RefType)) (= (type Heap@@9) (MapType0Type RefType))) (= (type QPMask@2) (MapType1Type RefType realType))) (= (type n$3) RefType)) (= (type n$7_2) RefType)) (= (type Heap@2) (MapType0Type RefType))) (= (type n$8_2) RefType)) (= (type n_12) RefType)) (= (type n_14) RefType)) (= (type n_16) RefType)) (= (type n_18) RefType)) (= (type n_20) RefType)) (= (type node) RefType)) (= (type Mask@1) (MapType1Type RefType realType))) (= (type QPMask@15) (MapType1Type RefType realType))) (forall ((arg0@@43 T@U) ) (! (= (type (invRecv7 arg0@@43)) RefType)
 :qid |funType:invRecv7|
 :pattern ( (invRecv7 arg0@@43))
))) (= (type QPMask@16) (MapType1Type RefType realType))) (forall ((arg0@@44 T@U) ) (! (= (type (invRecv8 arg0@@44)) RefType)
 :qid |funType:invRecv8|
 :pattern ( (invRecv8 arg0@@44))
))) (= (type QPMask@17) (MapType1Type RefType realType))) (forall ((arg0@@45 T@U) ) (! (= (type (invRecv9 arg0@@45)) RefType)
 :qid |funType:invRecv9|
 :pattern ( (invRecv9 arg0@@45))
))) (= (type Heap@1) (MapType0Type RefType))) (= (type Mask@0) (MapType1Type RefType realType))) (= (type n$2_4) RefType)) (= (type arg_node_1@0) RefType)) (= (type ExhaleHeap@1) (MapType0Type RefType))) (= (type QPMask@11) (MapType1Type RefType realType))) (= (type QPMask@12) (MapType1Type RefType realType))) (forall ((arg0@@46 T@U) ) (! (= (type (invRecv19 arg0@@46)) RefType)
 :qid |funType:invRecv19|
 :pattern ( (invRecv19 arg0@@46))
))) (= (type QPMask@13) (MapType1Type RefType realType))) (forall ((arg0@@47 T@U) ) (! (= (type (invRecv20 arg0@@47)) RefType)
 :qid |funType:invRecv20|
 :pattern ( (invRecv20 arg0@@47))
))) (= (type QPMask@14) (MapType1Type RefType realType))) (forall ((arg0@@48 T@U) ) (! (= (type (invRecv21 arg0@@48)) RefType)
 :qid |funType:invRecv21|
 :pattern ( (invRecv21 arg0@@48))
))) (= (type n$3_4) RefType)) (= (type QPMask@9) (MapType1Type RefType realType))) (forall ((arg0@@49 T@U) ) (! (= (type (invRecv16 arg0@@49)) RefType)
 :qid |funType:invRecv16|
 :pattern ( (invRecv16 arg0@@49))
))) (= (type QPMask@10) (MapType1Type RefType realType))) (forall ((arg0@@50 T@U) ) (! (= (type (invRecv17 arg0@@50)) RefType)
 :qid |funType:invRecv17|
 :pattern ( (invRecv17 arg0@@50))
))) (forall ((arg0@@51 T@U) ) (! (= (type (invRecv18 arg0@@51)) RefType)
 :qid |funType:invRecv18|
 :pattern ( (invRecv18 arg0@@51))
))) (= (type Heap@0) (MapType0Type RefType))) (= (type n$2_2) RefType)) (= (type arg_node@0) RefType)) (= (type ExhaleHeap@0) (MapType0Type RefType))) (= (type QPMask@5) (MapType1Type RefType realType))) (= (type QPMask@6) (MapType1Type RefType realType))) (forall ((arg0@@52 T@U) ) (! (= (type (invRecv13 arg0@@52)) RefType)
 :qid |funType:invRecv13|
 :pattern ( (invRecv13 arg0@@52))
))) (= (type QPMask@7) (MapType1Type RefType realType))) (forall ((arg0@@53 T@U) ) (! (= (type (invRecv14 arg0@@53)) RefType)
 :qid |funType:invRecv14|
 :pattern ( (invRecv14 arg0@@53))
))) (= (type QPMask@8) (MapType1Type RefType realType))) (forall ((arg0@@54 T@U) ) (! (= (type (invRecv15 arg0@@54)) RefType)
 :qid |funType:invRecv15|
 :pattern ( (invRecv15 arg0@@54))
))) (= (type n$3_2) RefType)) (= (type QPMask@3) (MapType1Type RefType realType))) (forall ((arg0@@55 T@U) ) (! (= (type (invRecv10 arg0@@55)) RefType)
 :qid |funType:invRecv10|
 :pattern ( (invRecv10 arg0@@55))
))) (= (type QPMask@4) (MapType1Type RefType realType))) (forall ((arg0@@56 T@U) ) (! (= (type (invRecv11 arg0@@56)) RefType)
 :qid |funType:invRecv11|
 :pattern ( (invRecv11 arg0@@56))
))) (forall ((arg0@@57 T@U) ) (! (= (type (invRecv12 arg0@@57)) RefType)
 :qid |funType:invRecv12|
 :pattern ( (invRecv12 arg0@@57))
))) (= (type n$7) RefType)) (= (type PostHeap@0) (MapType0Type RefType))) (= (type QPMask@20) (MapType1Type RefType realType))) (= (type n$8) RefType)) (= (type n) RefType)) (= (type n_2) RefType)) (= (type n_4) RefType)) (= (type n_6) RefType)) (= (type n_8) RefType)) (forall ((arg0@@58 T@U) ) (! (= (type (invRecv6 arg0@@58)) RefType)
 :qid |funType:invRecv6|
 :pattern ( (invRecv6 arg0@@58))
))) (= (type QPMask@19) (MapType1Type RefType realType))) (forall ((arg0@@59 T@U) ) (! (= (type (invRecv5 arg0@@59)) RefType)
 :qid |funType:invRecv5|
 :pattern ( (invRecv5 arg0@@59))
))) (= (type QPMask@18) (MapType1Type RefType realType))) (forall ((arg0@@60 T@U) ) (! (= (type (invRecv4 arg0@@60)) RefType)
 :qid |funType:invRecv4|
 :pattern ( (invRecv4 arg0@@60))
))) (forall ((arg0@@61 T@U) ) (! (= (type (invRecv3 arg0@@61)) RefType)
 :qid |funType:invRecv3|
 :pattern ( (invRecv3 arg0@@61))
))) (= (type QPMask@1) (MapType1Type RefType realType))) (forall ((arg0@@62 T@U) ) (! (= (type (invRecv2 arg0@@62)) RefType)
 :qid |funType:invRecv2|
 :pattern ( (invRecv2 arg0@@62))
))) (= (type QPMask@0) (MapType1Type RefType realType))) (forall ((arg0@@63 T@U) ) (! (= (type (invRecv1 arg0@@63)) RefType)
 :qid |funType:invRecv1|
 :pattern ( (invRecv1 arg0@@63))
))))
(set-info :boogie-vc-id trav_rec)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 219) (let ((anon65_correct true))
(let ((anon158_Else_correct  (=> (and (= (MapType0Select PostHeap@0 n_8 right) null) (= (ControlFlow 0 187) 181)) anon65_correct)))
(let ((anon158_Then_correct  (=> (not (= (MapType0Select PostHeap@0 n_8 right) null)) (and (=> (= (ControlFlow 0 184) (- 0 186)) (HasDirectPerm QPMask@20 n_8 right)) (=> (HasDirectPerm QPMask@20 n_8 right) (and (=> (= (ControlFlow 0 184) (- 0 185)) (HasDirectPerm QPMask@20 (MapType0Select PostHeap@0 n_8 right) is_marked)) (=> (HasDirectPerm QPMask@20 (MapType0Select PostHeap@0 n_8 right) is_marked) (=> (= (ControlFlow 0 184) 181) anon65_correct))))))))
(let ((anon157_Then_correct  (=> (and (not (U_2_bool (MapType0Select Heap@@9 n_8 is_marked))) (U_2_bool (MapType0Select PostHeap@0 n_8 is_marked))) (and (=> (= (ControlFlow 0 188) (- 0 189)) (HasDirectPerm QPMask@20 n_8 right)) (=> (HasDirectPerm QPMask@20 n_8 right) (and (=> (= (ControlFlow 0 188) 184) anon158_Then_correct) (=> (= (ControlFlow 0 188) 187) anon158_Else_correct)))))))
(let ((anon157_Else_correct  (=> (and (not (and (not (U_2_bool (MapType0Select Heap@@9 n_8 is_marked))) (U_2_bool (MapType0Select PostHeap@0 n_8 is_marked)))) (= (ControlFlow 0 183) 181)) anon65_correct)))
(let ((anon156_Else_correct  (=> (U_2_bool (MapType0Select Heap@@9 n_8 is_marked)) (and (=> (= (ControlFlow 0 192) 188) anon157_Then_correct) (=> (= (ControlFlow 0 192) 183) anon157_Else_correct)))))
(let ((anon156_Then_correct  (=> (not (U_2_bool (MapType0Select Heap@@9 n_8 is_marked))) (and (=> (= (ControlFlow 0 190) (- 0 191)) (HasDirectPerm QPMask@20 n_8 is_marked)) (=> (HasDirectPerm QPMask@20 n_8 is_marked) (and (=> (= (ControlFlow 0 190) 188) anon157_Then_correct) (=> (= (ControlFlow 0 190) 183) anon157_Else_correct)))))))
(let ((anon155_Then_correct  (=> (U_2_bool (MapType2Select nodes n_8)) (and (=> (= (ControlFlow 0 193) (- 0 194)) (HasDirectPerm QPMask@2 n_8 is_marked)) (=> (HasDirectPerm QPMask@2 n_8 is_marked) (and (=> (= (ControlFlow 0 193) 190) anon156_Then_correct) (=> (= (ControlFlow 0 193) 192) anon156_Else_correct)))))))
(let ((anon155_Else_correct  (=> (and (not (U_2_bool (MapType2Select nodes n_8))) (= (ControlFlow 0 182) 181)) anon65_correct)))
(let ((anon154_Else_correct true))
(let ((anon149_Else_correct  (=> (and (forall ((n_9 T@U) ) (!  (=> (and (and (= (type n_9) RefType) (U_2_bool (MapType2Select nodes n_9))) (and (not (U_2_bool (MapType0Select Heap@@9 n_9 is_marked))) (U_2_bool (MapType0Select PostHeap@0 n_9 is_marked)))) (or (= (MapType0Select PostHeap@0 n_9 left) null) (U_2_bool (MapType0Select PostHeap@0 (MapType0Select PostHeap@0 n_9 left) is_marked))))
 :qid |stdinbpl.943:20|
 :skolemid |125|
 :pattern ( (MapType2Select nodes n_9) (MapType0Select PostHeap@0 n_9 is_marked))
 :pattern ( (MapType2Select nodes n_9) (MapType0Select PostHeap@0 (MapType0Select PostHeap@0 n_9 left) is_marked))
)) (state PostHeap@0 QPMask@20)) (and (and (=> (= (ControlFlow 0 195) 180) anon154_Else_correct) (=> (= (ControlFlow 0 195) 193) anon155_Then_correct)) (=> (= (ControlFlow 0 195) 182) anon155_Else_correct)))))
(let ((anon57_correct true))
(let ((anon153_Else_correct  (=> (and (= (MapType0Select PostHeap@0 n_6 left) null) (= (ControlFlow 0 172) 166)) anon57_correct)))
(let ((anon153_Then_correct  (=> (not (= (MapType0Select PostHeap@0 n_6 left) null)) (and (=> (= (ControlFlow 0 169) (- 0 171)) (HasDirectPerm QPMask@20 n_6 left)) (=> (HasDirectPerm QPMask@20 n_6 left) (and (=> (= (ControlFlow 0 169) (- 0 170)) (HasDirectPerm QPMask@20 (MapType0Select PostHeap@0 n_6 left) is_marked)) (=> (HasDirectPerm QPMask@20 (MapType0Select PostHeap@0 n_6 left) is_marked) (=> (= (ControlFlow 0 169) 166) anon57_correct))))))))
(let ((anon152_Then_correct  (=> (and (not (U_2_bool (MapType0Select Heap@@9 n_6 is_marked))) (U_2_bool (MapType0Select PostHeap@0 n_6 is_marked))) (and (=> (= (ControlFlow 0 173) (- 0 174)) (HasDirectPerm QPMask@20 n_6 left)) (=> (HasDirectPerm QPMask@20 n_6 left) (and (=> (= (ControlFlow 0 173) 169) anon153_Then_correct) (=> (= (ControlFlow 0 173) 172) anon153_Else_correct)))))))
(let ((anon152_Else_correct  (=> (and (not (and (not (U_2_bool (MapType0Select Heap@@9 n_6 is_marked))) (U_2_bool (MapType0Select PostHeap@0 n_6 is_marked)))) (= (ControlFlow 0 168) 166)) anon57_correct)))
(let ((anon151_Else_correct  (=> (U_2_bool (MapType0Select Heap@@9 n_6 is_marked)) (and (=> (= (ControlFlow 0 177) 173) anon152_Then_correct) (=> (= (ControlFlow 0 177) 168) anon152_Else_correct)))))
(let ((anon151_Then_correct  (=> (not (U_2_bool (MapType0Select Heap@@9 n_6 is_marked))) (and (=> (= (ControlFlow 0 175) (- 0 176)) (HasDirectPerm QPMask@20 n_6 is_marked)) (=> (HasDirectPerm QPMask@20 n_6 is_marked) (and (=> (= (ControlFlow 0 175) 173) anon152_Then_correct) (=> (= (ControlFlow 0 175) 168) anon152_Else_correct)))))))
(let ((anon150_Then_correct  (=> (U_2_bool (MapType2Select nodes n_6)) (and (=> (= (ControlFlow 0 178) (- 0 179)) (HasDirectPerm QPMask@2 n_6 is_marked)) (=> (HasDirectPerm QPMask@2 n_6 is_marked) (and (=> (= (ControlFlow 0 178) 175) anon151_Then_correct) (=> (= (ControlFlow 0 178) 177) anon151_Else_correct)))))))
(let ((anon150_Else_correct  (=> (and (not (U_2_bool (MapType2Select nodes n_6))) (= (ControlFlow 0 167) 166)) anon57_correct)))
(let ((anon147_Else_correct  (=> (and (forall ((n_7 T@U) ) (!  (=> (and (= (type n_7) RefType) (U_2_bool (MapType2Select nodes n_7))) (= (MapType0Select PostHeap@0 n_7 right) (MapType0Select Heap@@9 n_7 right)))
 :qid |stdinbpl.915:20|
 :skolemid |124|
 :pattern ( (MapType2Select nodes n_7) (MapType0Select PostHeap@0 n_7 right))
)) (state PostHeap@0 QPMask@20)) (and (and (=> (= (ControlFlow 0 196) 195) anon149_Else_correct) (=> (= (ControlFlow 0 196) 178) anon150_Then_correct)) (=> (= (ControlFlow 0 196) 167) anon150_Else_correct)))))
(let ((anon49_correct true))
(let ((anon148_Else_correct  (=> (and (not (U_2_bool (MapType2Select nodes n_4))) (= (ControlFlow 0 165) 161)) anon49_correct)))
(let ((anon148_Then_correct  (=> (U_2_bool (MapType2Select nodes n_4)) (and (=> (= (ControlFlow 0 162) (- 0 164)) (HasDirectPerm QPMask@20 n_4 right)) (=> (HasDirectPerm QPMask@20 n_4 right) (and (=> (= (ControlFlow 0 162) (- 0 163)) (HasDirectPerm QPMask@2 n_4 right)) (=> (HasDirectPerm QPMask@2 n_4 right) (=> (= (ControlFlow 0 162) 161) anon49_correct))))))))
(let ((anon145_Else_correct  (=> (and (forall ((n_5 T@U) ) (!  (=> (and (= (type n_5) RefType) (U_2_bool (MapType2Select nodes n_5))) (= (MapType0Select PostHeap@0 n_5 left) (MapType0Select Heap@@9 n_5 left)))
 :qid |stdinbpl.899:20|
 :skolemid |123|
 :pattern ( (MapType2Select nodes n_5) (MapType0Select PostHeap@0 n_5 left))
)) (state PostHeap@0 QPMask@20)) (and (and (=> (= (ControlFlow 0 197) 196) anon147_Else_correct) (=> (= (ControlFlow 0 197) 162) anon148_Then_correct)) (=> (= (ControlFlow 0 197) 165) anon148_Else_correct)))))
(let ((anon45_correct true))
(let ((anon146_Else_correct  (=> (and (not (U_2_bool (MapType2Select nodes n_2))) (= (ControlFlow 0 160) 156)) anon45_correct)))
(let ((anon146_Then_correct  (=> (U_2_bool (MapType2Select nodes n_2)) (and (=> (= (ControlFlow 0 157) (- 0 159)) (HasDirectPerm QPMask@20 n_2 left)) (=> (HasDirectPerm QPMask@20 n_2 left) (and (=> (= (ControlFlow 0 157) (- 0 158)) (HasDirectPerm QPMask@2 n_2 left)) (=> (HasDirectPerm QPMask@2 n_2 left) (=> (= (ControlFlow 0 157) 156) anon45_correct))))))))
(let ((anon142_Else_correct  (=> (and (forall ((n_3 T@U) ) (!  (=> (and (and (= (type n_3) RefType) (U_2_bool (MapType2Select nodes n_3))) (U_2_bool (MapType0Select Heap@@9 n_3 is_marked))) (U_2_bool (MapType0Select PostHeap@0 n_3 is_marked)))
 :qid |stdinbpl.877:20|
 :skolemid |122|
 :pattern ( (MapType2Select nodes n_3) (MapType0Select PostHeap@0 n_3 is_marked))
)) (state PostHeap@0 QPMask@20)) (and (=> (= (ControlFlow 0 198) (- 0 199)) (HasDirectPerm QPMask@20 node is_marked)) (=> (HasDirectPerm QPMask@20 node is_marked) (=> (and (U_2_bool (MapType0Select PostHeap@0 node is_marked)) (state PostHeap@0 QPMask@20)) (and (and (=> (= (ControlFlow 0 198) 197) anon145_Else_correct) (=> (= (ControlFlow 0 198) 157) anon146_Then_correct)) (=> (= (ControlFlow 0 198) 160) anon146_Else_correct))))))))
(let ((anon41_correct true))
(let ((anon144_Else_correct  (=> (and (not (U_2_bool (MapType0Select Heap@@9 n is_marked))) (= (ControlFlow 0 153) 149)) anon41_correct)))
(let ((anon144_Then_correct  (=> (U_2_bool (MapType0Select Heap@@9 n is_marked)) (and (=> (= (ControlFlow 0 151) (- 0 152)) (HasDirectPerm QPMask@20 n is_marked)) (=> (HasDirectPerm QPMask@20 n is_marked) (=> (= (ControlFlow 0 151) 149) anon41_correct))))))
(let ((anon143_Then_correct  (=> (U_2_bool (MapType2Select nodes n)) (and (=> (= (ControlFlow 0 154) (- 0 155)) (HasDirectPerm QPMask@2 n is_marked)) (=> (HasDirectPerm QPMask@2 n is_marked) (and (=> (= (ControlFlow 0 154) 151) anon144_Then_correct) (=> (= (ControlFlow 0 154) 153) anon144_Else_correct)))))))
(let ((anon143_Else_correct  (=> (and (not (U_2_bool (MapType2Select nodes n))) (= (ControlFlow 0 150) 149)) anon41_correct)))
(let ((anon139_Else_correct  (=> (and (forall ((n$8_1 T@U) ) (!  (=> (= (type n$8_1) RefType) (=> (and (U_2_bool (MapType2Select nodes n$8_1)) (not (= (MapType0Select PostHeap@0 n$8_1 right) null))) (U_2_bool (MapType2Select nodes (MapType0Select PostHeap@0 n$8_1 right)))))
 :qid |stdinbpl.859:20|
 :skolemid |121|
 :pattern ( (MapType2Select nodes (MapType0Select PostHeap@0 n$8_1 right)))
 :pattern ( (MapType2Select nodes n$8_1) (MapType0Select PostHeap@0 n$8_1 right))
)) (state PostHeap@0 QPMask@20)) (and (and (=> (= (ControlFlow 0 200) 198) anon142_Else_correct) (=> (= (ControlFlow 0 200) 154) anon143_Then_correct)) (=> (= (ControlFlow 0 200) 150) anon143_Else_correct)))))
(let ((anon36_correct true))
(let ((anon141_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select nodes n$8)) (not (= (MapType0Select PostHeap@0 n$8 right) null)))) (= (ControlFlow 0 145) 142)) anon36_correct)))
(let ((anon141_Then_correct  (=> (and (U_2_bool (MapType2Select nodes n$8)) (not (= (MapType0Select PostHeap@0 n$8 right) null))) (and (=> (= (ControlFlow 0 143) (- 0 144)) (HasDirectPerm QPMask@20 n$8 right)) (=> (HasDirectPerm QPMask@20 n$8 right) (=> (= (ControlFlow 0 143) 142) anon36_correct))))))
(let ((anon140_Else_correct  (=> (not (U_2_bool (MapType2Select nodes n$8))) (and (=> (= (ControlFlow 0 148) 143) anon141_Then_correct) (=> (= (ControlFlow 0 148) 145) anon141_Else_correct)))))
(let ((anon140_Then_correct  (=> (U_2_bool (MapType2Select nodes n$8)) (and (=> (= (ControlFlow 0 146) (- 0 147)) (HasDirectPerm QPMask@20 n$8 right)) (=> (HasDirectPerm QPMask@20 n$8 right) (and (=> (= (ControlFlow 0 146) 143) anon141_Then_correct) (=> (= (ControlFlow 0 146) 145) anon141_Else_correct)))))))
(let ((anon136_Else_correct  (=> (forall ((n$7_1 T@U) ) (!  (=> (= (type n$7_1) RefType) (=> (and (U_2_bool (MapType2Select nodes n$7_1)) (not (= (MapType0Select PostHeap@0 n$7_1 left) null))) (U_2_bool (MapType2Select nodes (MapType0Select PostHeap@0 n$7_1 left)))))
 :qid |stdinbpl.842:20|
 :skolemid |120|
 :pattern ( (MapType2Select nodes (MapType0Select PostHeap@0 n$7_1 left)))
 :pattern ( (MapType2Select nodes n$7_1) (MapType0Select PostHeap@0 n$7_1 left))
)) (and (and (=> (= (ControlFlow 0 201) 200) anon139_Else_correct) (=> (= (ControlFlow 0 201) 146) anon140_Then_correct)) (=> (= (ControlFlow 0 201) 148) anon140_Else_correct)))))
(let ((anon30_correct true))
(let ((anon138_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select nodes n$7)) (not (= (MapType0Select PostHeap@0 n$7 left) null)))) (= (ControlFlow 0 138) 135)) anon30_correct)))
(let ((anon138_Then_correct  (=> (and (U_2_bool (MapType2Select nodes n$7)) (not (= (MapType0Select PostHeap@0 n$7 left) null))) (and (=> (= (ControlFlow 0 136) (- 0 137)) (HasDirectPerm QPMask@20 n$7 left)) (=> (HasDirectPerm QPMask@20 n$7 left) (=> (= (ControlFlow 0 136) 135) anon30_correct))))))
(let ((anon137_Else_correct  (=> (not (U_2_bool (MapType2Select nodes n$7))) (and (=> (= (ControlFlow 0 141) 136) anon138_Then_correct) (=> (= (ControlFlow 0 141) 138) anon138_Else_correct)))))
(let ((anon137_Then_correct  (=> (U_2_bool (MapType2Select nodes n$7)) (and (=> (= (ControlFlow 0 139) (- 0 140)) (HasDirectPerm QPMask@20 n$7 left)) (=> (HasDirectPerm QPMask@20 n$7 left) (and (=> (= (ControlFlow 0 139) 136) anon138_Then_correct) (=> (= (ControlFlow 0 139) 138) anon138_Else_correct)))))))
(let ((anon135_Else_correct  (and (=> (= (ControlFlow 0 202) (- 0 203)) (forall ((n$6_1 T@U) (n$6_1_1 T@U) ) (!  (=> (and (= (type n$6_1) RefType) (= (type n$6_1_1) RefType)) (=> (and (and (and (and (not (= n$6_1 n$6_1_1)) (U_2_bool (MapType2Select nodes n$6_1))) (U_2_bool (MapType2Select nodes n$6_1_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$6_1 n$6_1_1))))
 :qid |stdinbpl.797:15|
 :skolemid |114|
 :no-pattern (type n$6_1)
 :no-pattern (type n$6_1_1)
 :no-pattern (U_2_int n$6_1)
 :no-pattern (U_2_bool n$6_1)
 :no-pattern (U_2_int n$6_1_1)
 :no-pattern (U_2_bool n$6_1_1)
))) (=> (forall ((n$6_1@@0 T@U) (n$6_1_1@@0 T@U) ) (!  (=> (and (= (type n$6_1@@0) RefType) (= (type n$6_1_1@@0) RefType)) (=> (and (and (and (and (not (= n$6_1@@0 n$6_1_1@@0)) (U_2_bool (MapType2Select nodes n$6_1@@0))) (U_2_bool (MapType2Select nodes n$6_1_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$6_1@@0 n$6_1_1@@0))))
 :qid |stdinbpl.797:15|
 :skolemid |114|
 :no-pattern (type n$6_1@@0)
 :no-pattern (type n$6_1_1@@0)
 :no-pattern (U_2_int n$6_1@@0)
 :no-pattern (U_2_bool n$6_1@@0)
 :no-pattern (U_2_int n$6_1_1@@0)
 :no-pattern (U_2_bool n$6_1_1@@0)
)) (=> (and (forall ((n$6_1@@1 T@U) ) (!  (=> (= (type n$6_1@@1) RefType) (=> (and (U_2_bool (MapType2Select nodes n$6_1@@1)) (< NoPerm FullPerm)) (and (qpRange6 n$6_1@@1) (= (invRecv6 n$6_1@@1) n$6_1@@1))))
 :qid |stdinbpl.803:22|
 :skolemid |115|
 :pattern ( (MapType0Select PostHeap@0 n$6_1@@1 is_marked))
 :pattern ( (MapType1Select QPMask@20 n$6_1@@1 is_marked))
 :pattern ( (MapType2Select nodes n$6_1@@1))
)) (forall ((o_3 T@U) ) (!  (=> (= (type o_3) RefType) (=> (and (and (U_2_bool (MapType2Select nodes (invRecv6 o_3))) (< NoPerm FullPerm)) (qpRange6 o_3)) (= (invRecv6 o_3) o_3)))
 :qid |stdinbpl.807:22|
 :skolemid |116|
 :pattern ( (invRecv6 o_3))
))) (=> (and (and (forall ((n$6_1@@2 T@U) ) (!  (=> (and (= (type n$6_1@@2) RefType) (U_2_bool (MapType2Select nodes n$6_1@@2))) (not (= n$6_1@@2 null)))
 :qid |stdinbpl.813:22|
 :skolemid |117|
 :pattern ( (MapType0Select PostHeap@0 n$6_1@@2 is_marked))
 :pattern ( (MapType1Select QPMask@20 n$6_1@@2 is_marked))
 :pattern ( (MapType2Select nodes n$6_1@@2))
)) (forall ((o_3@@0 T@U) ) (!  (=> (= (type o_3@@0) RefType) (and (=> (and (and (U_2_bool (MapType2Select nodes (invRecv6 o_3@@0))) (< NoPerm FullPerm)) (qpRange6 o_3@@0)) (and (=> (< NoPerm FullPerm) (= (invRecv6 o_3@@0) o_3@@0)) (= (U_2_real (MapType1Select QPMask@20 o_3@@0 is_marked)) (+ (U_2_real (MapType1Select QPMask@19 o_3@@0 is_marked)) FullPerm)))) (=> (not (and (and (U_2_bool (MapType2Select nodes (invRecv6 o_3@@0))) (< NoPerm FullPerm)) (qpRange6 o_3@@0))) (= (U_2_real (MapType1Select QPMask@20 o_3@@0 is_marked)) (U_2_real (MapType1Select QPMask@19 o_3@@0 is_marked))))))
 :qid |stdinbpl.819:22|
 :skolemid |118|
 :pattern ( (MapType1Select QPMask@20 o_3@@0 is_marked))
))) (and (forall ((o_3@@1 T@U) (f_5 T@U) ) (! (let ((B@@11 (FieldTypeInv1 (type f_5))))
(let ((A@@12 (FieldTypeInv0 (type f_5))))
 (=> (and (and (= (type o_3@@1) RefType) (= (type f_5) (FieldType A@@12 B@@11))) (not (= f_5 is_marked))) (= (U_2_real (MapType1Select QPMask@19 o_3@@1 f_5)) (U_2_real (MapType1Select QPMask@20 o_3@@1 f_5))))))
 :qid |stdinbpl.823:29|
 :skolemid |119|
 :pattern ( (MapType1Select QPMask@19 o_3@@1 f_5))
 :pattern ( (MapType1Select QPMask@20 o_3@@1 f_5))
)) (state PostHeap@0 QPMask@20))) (and (and (=> (= (ControlFlow 0 202) 201) anon136_Else_correct) (=> (= (ControlFlow 0 202) 139) anon137_Then_correct)) (=> (= (ControlFlow 0 202) 141) anon137_Else_correct))))))))
(let ((anon135_Then_correct true))
(let ((anon134_Else_correct  (and (=> (= (ControlFlow 0 204) (- 0 205)) (forall ((n$5_1 T@U) (n$5_1_1 T@U) ) (!  (=> (and (= (type n$5_1) RefType) (= (type n$5_1_1) RefType)) (=> (and (and (and (and (not (= n$5_1 n$5_1_1)) (U_2_bool (MapType2Select nodes n$5_1))) (U_2_bool (MapType2Select nodes n$5_1_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$5_1 n$5_1_1))))
 :qid |stdinbpl.758:15|
 :skolemid |108|
 :no-pattern (type n$5_1)
 :no-pattern (type n$5_1_1)
 :no-pattern (U_2_int n$5_1)
 :no-pattern (U_2_bool n$5_1)
 :no-pattern (U_2_int n$5_1_1)
 :no-pattern (U_2_bool n$5_1_1)
))) (=> (forall ((n$5_1@@0 T@U) (n$5_1_1@@0 T@U) ) (!  (=> (and (= (type n$5_1@@0) RefType) (= (type n$5_1_1@@0) RefType)) (=> (and (and (and (and (not (= n$5_1@@0 n$5_1_1@@0)) (U_2_bool (MapType2Select nodes n$5_1@@0))) (U_2_bool (MapType2Select nodes n$5_1_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$5_1@@0 n$5_1_1@@0))))
 :qid |stdinbpl.758:15|
 :skolemid |108|
 :no-pattern (type n$5_1@@0)
 :no-pattern (type n$5_1_1@@0)
 :no-pattern (U_2_int n$5_1@@0)
 :no-pattern (U_2_bool n$5_1@@0)
 :no-pattern (U_2_int n$5_1_1@@0)
 :no-pattern (U_2_bool n$5_1_1@@0)
)) (=> (and (forall ((n$5_1@@1 T@U) ) (!  (=> (= (type n$5_1@@1) RefType) (=> (and (U_2_bool (MapType2Select nodes n$5_1@@1)) (< NoPerm FullPerm)) (and (qpRange5 n$5_1@@1) (= (invRecv5 n$5_1@@1) n$5_1@@1))))
 :qid |stdinbpl.764:22|
 :skolemid |109|
 :pattern ( (MapType0Select PostHeap@0 n$5_1@@1 right))
 :pattern ( (MapType1Select QPMask@19 n$5_1@@1 right))
 :pattern ( (MapType2Select nodes n$5_1@@1))
)) (forall ((o_3@@2 T@U) ) (!  (=> (= (type o_3@@2) RefType) (=> (and (and (U_2_bool (MapType2Select nodes (invRecv5 o_3@@2))) (< NoPerm FullPerm)) (qpRange5 o_3@@2)) (= (invRecv5 o_3@@2) o_3@@2)))
 :qid |stdinbpl.768:22|
 :skolemid |110|
 :pattern ( (invRecv5 o_3@@2))
))) (=> (and (and (forall ((n$5_1@@2 T@U) ) (!  (=> (and (= (type n$5_1@@2) RefType) (U_2_bool (MapType2Select nodes n$5_1@@2))) (not (= n$5_1@@2 null)))
 :qid |stdinbpl.774:22|
 :skolemid |111|
 :pattern ( (MapType0Select PostHeap@0 n$5_1@@2 right))
 :pattern ( (MapType1Select QPMask@19 n$5_1@@2 right))
 :pattern ( (MapType2Select nodes n$5_1@@2))
)) (forall ((o_3@@3 T@U) ) (!  (=> (= (type o_3@@3) RefType) (and (=> (and (and (U_2_bool (MapType2Select nodes (invRecv5 o_3@@3))) (< NoPerm FullPerm)) (qpRange5 o_3@@3)) (and (=> (< NoPerm FullPerm) (= (invRecv5 o_3@@3) o_3@@3)) (= (U_2_real (MapType1Select QPMask@19 o_3@@3 right)) (+ (U_2_real (MapType1Select QPMask@18 o_3@@3 right)) FullPerm)))) (=> (not (and (and (U_2_bool (MapType2Select nodes (invRecv5 o_3@@3))) (< NoPerm FullPerm)) (qpRange5 o_3@@3))) (= (U_2_real (MapType1Select QPMask@19 o_3@@3 right)) (U_2_real (MapType1Select QPMask@18 o_3@@3 right))))))
 :qid |stdinbpl.780:22|
 :skolemid |112|
 :pattern ( (MapType1Select QPMask@19 o_3@@3 right))
))) (and (forall ((o_3@@4 T@U) (f_5@@0 T@U) ) (! (let ((B@@12 (FieldTypeInv1 (type f_5@@0))))
(let ((A@@13 (FieldTypeInv0 (type f_5@@0))))
 (=> (and (and (= (type o_3@@4) RefType) (= (type f_5@@0) (FieldType A@@13 B@@12))) (not (= f_5@@0 right))) (= (U_2_real (MapType1Select QPMask@18 o_3@@4 f_5@@0)) (U_2_real (MapType1Select QPMask@19 o_3@@4 f_5@@0))))))
 :qid |stdinbpl.784:29|
 :skolemid |113|
 :pattern ( (MapType1Select QPMask@18 o_3@@4 f_5@@0))
 :pattern ( (MapType1Select QPMask@19 o_3@@4 f_5@@0))
)) (state PostHeap@0 QPMask@19))) (and (=> (= (ControlFlow 0 204) 134) anon135_Then_correct) (=> (= (ControlFlow 0 204) 202) anon135_Else_correct))))))))
(let ((anon134_Then_correct true))
(let ((anon133_Else_correct  (and (=> (= (ControlFlow 0 206) (- 0 207)) (forall ((n$4_1 T@U) (n$4_1_1 T@U) ) (!  (=> (and (= (type n$4_1) RefType) (= (type n$4_1_1) RefType)) (=> (and (and (and (and (not (= n$4_1 n$4_1_1)) (U_2_bool (MapType2Select nodes n$4_1))) (U_2_bool (MapType2Select nodes n$4_1_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$4_1 n$4_1_1))))
 :qid |stdinbpl.719:15|
 :skolemid |102|
 :no-pattern (type n$4_1)
 :no-pattern (type n$4_1_1)
 :no-pattern (U_2_int n$4_1)
 :no-pattern (U_2_bool n$4_1)
 :no-pattern (U_2_int n$4_1_1)
 :no-pattern (U_2_bool n$4_1_1)
))) (=> (forall ((n$4_1@@0 T@U) (n$4_1_1@@0 T@U) ) (!  (=> (and (= (type n$4_1@@0) RefType) (= (type n$4_1_1@@0) RefType)) (=> (and (and (and (and (not (= n$4_1@@0 n$4_1_1@@0)) (U_2_bool (MapType2Select nodes n$4_1@@0))) (U_2_bool (MapType2Select nodes n$4_1_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$4_1@@0 n$4_1_1@@0))))
 :qid |stdinbpl.719:15|
 :skolemid |102|
 :no-pattern (type n$4_1@@0)
 :no-pattern (type n$4_1_1@@0)
 :no-pattern (U_2_int n$4_1@@0)
 :no-pattern (U_2_bool n$4_1@@0)
 :no-pattern (U_2_int n$4_1_1@@0)
 :no-pattern (U_2_bool n$4_1_1@@0)
)) (=> (and (forall ((n$4_1@@1 T@U) ) (!  (=> (= (type n$4_1@@1) RefType) (=> (and (U_2_bool (MapType2Select nodes n$4_1@@1)) (< NoPerm FullPerm)) (and (qpRange4 n$4_1@@1) (= (invRecv4 n$4_1@@1) n$4_1@@1))))
 :qid |stdinbpl.725:22|
 :skolemid |103|
 :pattern ( (MapType0Select PostHeap@0 n$4_1@@1 left))
 :pattern ( (MapType1Select QPMask@18 n$4_1@@1 left))
 :pattern ( (MapType2Select nodes n$4_1@@1))
)) (forall ((o_3@@5 T@U) ) (!  (=> (= (type o_3@@5) RefType) (=> (and (and (U_2_bool (MapType2Select nodes (invRecv4 o_3@@5))) (< NoPerm FullPerm)) (qpRange4 o_3@@5)) (= (invRecv4 o_3@@5) o_3@@5)))
 :qid |stdinbpl.729:22|
 :skolemid |104|
 :pattern ( (invRecv4 o_3@@5))
))) (=> (and (and (forall ((n$4_1@@2 T@U) ) (!  (=> (and (= (type n$4_1@@2) RefType) (U_2_bool (MapType2Select nodes n$4_1@@2))) (not (= n$4_1@@2 null)))
 :qid |stdinbpl.735:22|
 :skolemid |105|
 :pattern ( (MapType0Select PostHeap@0 n$4_1@@2 left))
 :pattern ( (MapType1Select QPMask@18 n$4_1@@2 left))
 :pattern ( (MapType2Select nodes n$4_1@@2))
)) (forall ((o_3@@6 T@U) ) (!  (=> (= (type o_3@@6) RefType) (and (=> (and (and (U_2_bool (MapType2Select nodes (invRecv4 o_3@@6))) (< NoPerm FullPerm)) (qpRange4 o_3@@6)) (and (=> (< NoPerm FullPerm) (= (invRecv4 o_3@@6) o_3@@6)) (= (U_2_real (MapType1Select QPMask@18 o_3@@6 left)) (+ (U_2_real (MapType1Select ZeroMask o_3@@6 left)) FullPerm)))) (=> (not (and (and (U_2_bool (MapType2Select nodes (invRecv4 o_3@@6))) (< NoPerm FullPerm)) (qpRange4 o_3@@6))) (= (U_2_real (MapType1Select QPMask@18 o_3@@6 left)) (U_2_real (MapType1Select ZeroMask o_3@@6 left))))))
 :qid |stdinbpl.741:22|
 :skolemid |106|
 :pattern ( (MapType1Select QPMask@18 o_3@@6 left))
))) (and (forall ((o_3@@7 T@U) (f_5@@1 T@U) ) (! (let ((B@@13 (FieldTypeInv1 (type f_5@@1))))
(let ((A@@14 (FieldTypeInv0 (type f_5@@1))))
 (=> (and (and (= (type o_3@@7) RefType) (= (type f_5@@1) (FieldType A@@14 B@@13))) (not (= f_5@@1 left))) (= (U_2_real (MapType1Select ZeroMask o_3@@7 f_5@@1)) (U_2_real (MapType1Select QPMask@18 o_3@@7 f_5@@1))))))
 :qid |stdinbpl.745:29|
 :skolemid |107|
 :pattern ( (MapType1Select ZeroMask o_3@@7 f_5@@1))
 :pattern ( (MapType1Select QPMask@18 o_3@@7 f_5@@1))
)) (state PostHeap@0 QPMask@18))) (and (=> (= (ControlFlow 0 206) 133) anon134_Then_correct) (=> (= (ControlFlow 0 206) 204) anon134_Else_correct))))))))
(let ((anon133_Then_correct true))
(let ((anon132_Then_correct  (=> (state PostHeap@0 ZeroMask) (=> (and (U_2_bool (MapType2Select nodes node)) (not (U_2_bool (MapType2Select nodes null)))) (and (=> (= (ControlFlow 0 208) 132) anon133_Then_correct) (=> (= (ControlFlow 0 208) 206) anon133_Else_correct))))))
(let ((anon77_correct true))
(let ((anon164_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select nodes n$3_2)) (not (= (MapType0Select Heap@0 n$3_2 right) null)))) (= (ControlFlow 0 113) 110)) anon77_correct)))
(let ((anon164_Then_correct  (=> (and (U_2_bool (MapType2Select nodes n$3_2)) (not (= (MapType0Select Heap@0 n$3_2 right) null))) (and (=> (= (ControlFlow 0 111) (- 0 112)) (U_2_bool (MapType2Select nodes (MapType0Select Heap@0 n$3_2 right)))) (=> (U_2_bool (MapType2Select nodes (MapType0Select Heap@0 n$3_2 right))) (=> (= (ControlFlow 0 111) 110) anon77_correct))))))
(let ((anon73_correct true))
(let ((anon162_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select nodes n$2_2)) (not (= (MapType0Select Heap@0 n$2_2 left) null)))) (= (ControlFlow 0 104) 101)) anon73_correct)))
(let ((anon162_Then_correct  (=> (and (U_2_bool (MapType2Select nodes n$2_2)) (not (= (MapType0Select Heap@0 n$2_2 left) null))) (and (=> (= (ControlFlow 0 102) (- 0 103)) (U_2_bool (MapType2Select nodes (MapType0Select Heap@0 n$2_2 left)))) (=> (U_2_bool (MapType2Select nodes (MapType0Select Heap@0 n$2_2 left))) (=> (= (ControlFlow 0 102) 101) anon73_correct))))))
(let ((anon89_correct true))
(let ((anon170_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select nodes n$3_4)) (not (= (MapType0Select Heap@1 n$3_4 right) null)))) (= (ControlFlow 0 82) 79)) anon89_correct)))
(let ((anon170_Then_correct  (=> (and (U_2_bool (MapType2Select nodes n$3_4)) (not (= (MapType0Select Heap@1 n$3_4 right) null))) (and (=> (= (ControlFlow 0 80) (- 0 81)) (U_2_bool (MapType2Select nodes (MapType0Select Heap@1 n$3_4 right)))) (=> (U_2_bool (MapType2Select nodes (MapType0Select Heap@1 n$3_4 right))) (=> (= (ControlFlow 0 80) 79) anon89_correct))))))
(let ((anon85_correct true))
(let ((anon168_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select nodes n$2_4)) (not (= (MapType0Select Heap@1 n$2_4 left) null)))) (= (ControlFlow 0 73) 70)) anon85_correct)))
(let ((anon168_Then_correct  (=> (and (U_2_bool (MapType2Select nodes n$2_4)) (not (= (MapType0Select Heap@1 n$2_4 left) null))) (and (=> (= (ControlFlow 0 71) (- 0 72)) (U_2_bool (MapType2Select nodes (MapType0Select Heap@1 n$2_4 left)))) (=> (U_2_bool (MapType2Select nodes (MapType0Select Heap@1 n$2_4 left))) (=> (= (ControlFlow 0 71) 70) anon85_correct))))))
(let ((anon121_correct true))
(let ((anon187_Else_correct  (=> (and (not (and (not (U_2_bool (MapType0Select Heap@@9 n_20 is_marked))) (U_2_bool (MapType0Select Heap@2 n_20 is_marked)))) (= (ControlFlow 0 51) 47)) anon121_correct)))
(let ((anon187_Then_correct  (=> (and (not (U_2_bool (MapType0Select Heap@@9 n_20 is_marked))) (U_2_bool (MapType0Select Heap@2 n_20 is_marked))) (and (=> (= (ControlFlow 0 49) (- 0 50)) (or (= (MapType0Select Heap@2 n_20 right) null) (U_2_bool (MapType0Select Heap@2 (MapType0Select Heap@2 n_20 right) is_marked)))) (=> (or (= (MapType0Select Heap@2 n_20 right) null) (U_2_bool (MapType0Select Heap@2 (MapType0Select Heap@2 n_20 right) is_marked))) (=> (= (ControlFlow 0 49) 47) anon121_correct))))))
(let ((anon186_Then_correct  (=> (U_2_bool (MapType2Select nodes n_20)) (and (=> (= (ControlFlow 0 52) 49) anon187_Then_correct) (=> (= (ControlFlow 0 52) 51) anon187_Else_correct)))))
(let ((anon186_Else_correct  (=> (and (not (U_2_bool (MapType2Select nodes n_20))) (= (ControlFlow 0 48) 47)) anon121_correct)))
(let ((anon185_Else_correct true))
(let ((anon182_Else_correct  (=> (forall ((n_19_1 T@U) ) (!  (=> (and (and (= (type n_19_1) RefType) (U_2_bool (MapType2Select nodes n_19_1))) (and (not (U_2_bool (MapType0Select Heap@@9 n_19_1 is_marked))) (U_2_bool (MapType0Select Heap@2 n_19_1 is_marked)))) (or (= (MapType0Select Heap@2 n_19_1 left) null) (U_2_bool (MapType0Select Heap@2 (MapType0Select Heap@2 n_19_1 left) is_marked))))
 :qid |stdinbpl.1824:20|
 :skolemid |240|
 :pattern ( (MapType2Select nodes n_19_1) (MapType0Select Heap@2 n_19_1 is_marked))
 :pattern ( (MapType2Select nodes n_19_1) (MapType0Select Heap@2 (MapType0Select Heap@2 n_19_1 left) is_marked))
)) (and (and (=> (= (ControlFlow 0 53) 46) anon185_Else_correct) (=> (= (ControlFlow 0 53) 52) anon186_Then_correct)) (=> (= (ControlFlow 0 53) 48) anon186_Else_correct)))))
(let ((anon116_correct true))
(let ((anon184_Else_correct  (=> (and (not (and (not (U_2_bool (MapType0Select Heap@@9 n_18 is_marked))) (U_2_bool (MapType0Select Heap@2 n_18 is_marked)))) (= (ControlFlow 0 44) 40)) anon116_correct)))
(let ((anon184_Then_correct  (=> (and (not (U_2_bool (MapType0Select Heap@@9 n_18 is_marked))) (U_2_bool (MapType0Select Heap@2 n_18 is_marked))) (and (=> (= (ControlFlow 0 42) (- 0 43)) (or (= (MapType0Select Heap@2 n_18 left) null) (U_2_bool (MapType0Select Heap@2 (MapType0Select Heap@2 n_18 left) is_marked)))) (=> (or (= (MapType0Select Heap@2 n_18 left) null) (U_2_bool (MapType0Select Heap@2 (MapType0Select Heap@2 n_18 left) is_marked))) (=> (= (ControlFlow 0 42) 40) anon116_correct))))))
(let ((anon183_Then_correct  (=> (U_2_bool (MapType2Select nodes n_18)) (and (=> (= (ControlFlow 0 45) 42) anon184_Then_correct) (=> (= (ControlFlow 0 45) 44) anon184_Else_correct)))))
(let ((anon183_Else_correct  (=> (and (not (U_2_bool (MapType2Select nodes n_18))) (= (ControlFlow 0 41) 40)) anon116_correct)))
(let ((anon180_Else_correct  (=> (forall ((n_17_1 T@U) ) (!  (=> (and (= (type n_17_1) RefType) (U_2_bool (MapType2Select nodes n_17_1))) (= (MapType0Select Heap@2 n_17_1 right) (MapType0Select Heap@@9 n_17_1 right)))
 :qid |stdinbpl.1811:20|
 :skolemid |239|
 :pattern ( (MapType2Select nodes n_17_1) (MapType0Select Heap@2 n_17_1 right))
)) (and (and (=> (= (ControlFlow 0 54) 53) anon182_Else_correct) (=> (= (ControlFlow 0 54) 45) anon183_Then_correct)) (=> (= (ControlFlow 0 54) 41) anon183_Else_correct)))))
(let ((anon111_correct true))
(let ((anon181_Else_correct  (=> (and (not (U_2_bool (MapType2Select nodes n_16))) (= (ControlFlow 0 39) 36)) anon111_correct)))
(let ((anon181_Then_correct  (=> (U_2_bool (MapType2Select nodes n_16)) (and (=> (= (ControlFlow 0 37) (- 0 38)) (= (MapType0Select Heap@2 n_16 right) (MapType0Select Heap@@9 n_16 right))) (=> (= (MapType0Select Heap@2 n_16 right) (MapType0Select Heap@@9 n_16 right)) (=> (= (ControlFlow 0 37) 36) anon111_correct))))))
(let ((anon178_Else_correct  (=> (forall ((n_15_1 T@U) ) (!  (=> (and (= (type n_15_1) RefType) (U_2_bool (MapType2Select nodes n_15_1))) (= (MapType0Select Heap@2 n_15_1 left) (MapType0Select Heap@@9 n_15_1 left)))
 :qid |stdinbpl.1800:20|
 :skolemid |238|
 :pattern ( (MapType2Select nodes n_15_1) (MapType0Select Heap@2 n_15_1 left))
)) (and (and (=> (= (ControlFlow 0 55) 54) anon180_Else_correct) (=> (= (ControlFlow 0 55) 37) anon181_Then_correct)) (=> (= (ControlFlow 0 55) 39) anon181_Else_correct)))))
(let ((anon107_correct true))
(let ((anon179_Else_correct  (=> (and (not (U_2_bool (MapType2Select nodes n_14))) (= (ControlFlow 0 35) 32)) anon107_correct)))
(let ((anon179_Then_correct  (=> (U_2_bool (MapType2Select nodes n_14)) (and (=> (= (ControlFlow 0 33) (- 0 34)) (= (MapType0Select Heap@2 n_14 left) (MapType0Select Heap@@9 n_14 left))) (=> (= (MapType0Select Heap@2 n_14 left) (MapType0Select Heap@@9 n_14 left)) (=> (= (ControlFlow 0 33) 32) anon107_correct))))))
(let ((anon175_Else_correct  (=> (forall ((n_13_1 T@U) ) (!  (=> (and (and (= (type n_13_1) RefType) (U_2_bool (MapType2Select nodes n_13_1))) (U_2_bool (MapType0Select Heap@@9 n_13_1 is_marked))) (U_2_bool (MapType0Select Heap@2 n_13_1 is_marked)))
 :qid |stdinbpl.1787:20|
 :skolemid |237|
 :pattern ( (MapType2Select nodes n_13_1) (MapType0Select Heap@2 n_13_1 is_marked))
)) (and (=> (= (ControlFlow 0 56) (- 0 57)) (U_2_bool (MapType0Select Heap@2 node is_marked))) (=> (U_2_bool (MapType0Select Heap@2 node is_marked)) (and (and (=> (= (ControlFlow 0 56) 55) anon178_Else_correct) (=> (= (ControlFlow 0 56) 33) anon179_Then_correct)) (=> (= (ControlFlow 0 56) 35) anon179_Else_correct)))))))
(let ((anon103_correct true))
(let ((anon177_Else_correct  (=> (and (not (U_2_bool (MapType0Select Heap@@9 n_12 is_marked))) (= (ControlFlow 0 30) 26)) anon103_correct)))
(let ((anon177_Then_correct  (=> (U_2_bool (MapType0Select Heap@@9 n_12 is_marked)) (and (=> (= (ControlFlow 0 28) (- 0 29)) (U_2_bool (MapType0Select Heap@2 n_12 is_marked))) (=> (U_2_bool (MapType0Select Heap@2 n_12 is_marked)) (=> (= (ControlFlow 0 28) 26) anon103_correct))))))
(let ((anon176_Then_correct  (=> (U_2_bool (MapType2Select nodes n_12)) (and (=> (= (ControlFlow 0 31) 28) anon177_Then_correct) (=> (= (ControlFlow 0 31) 30) anon177_Else_correct)))))
(let ((anon176_Else_correct  (=> (and (not (U_2_bool (MapType2Select nodes n_12))) (= (ControlFlow 0 27) 26)) anon103_correct)))
(let ((anon173_Else_correct  (=> (forall ((n$8_3_1 T@U) ) (!  (=> (= (type n$8_3_1) RefType) (=> (and (U_2_bool (MapType2Select nodes n$8_3_1)) (not (= (MapType0Select Heap@2 n$8_3_1 right) null))) (U_2_bool (MapType2Select nodes (MapType0Select Heap@2 n$8_3_1 right)))))
 :qid |stdinbpl.1774:20|
 :skolemid |236|
 :pattern ( (MapType2Select nodes (MapType0Select Heap@2 n$8_3_1 right)))
 :pattern ( (MapType2Select nodes n$8_3_1) (MapType0Select Heap@2 n$8_3_1 right))
)) (and (and (=> (= (ControlFlow 0 58) 56) anon175_Else_correct) (=> (= (ControlFlow 0 58) 31) anon176_Then_correct)) (=> (= (ControlFlow 0 58) 27) anon176_Else_correct)))))
(let ((anon98_correct true))
(let ((anon174_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select nodes n$8_2)) (not (= (MapType0Select Heap@2 n$8_2 right) null)))) (= (ControlFlow 0 25) 22)) anon98_correct)))
(let ((anon174_Then_correct  (=> (and (U_2_bool (MapType2Select nodes n$8_2)) (not (= (MapType0Select Heap@2 n$8_2 right) null))) (and (=> (= (ControlFlow 0 23) (- 0 24)) (U_2_bool (MapType2Select nodes (MapType0Select Heap@2 n$8_2 right)))) (=> (U_2_bool (MapType2Select nodes (MapType0Select Heap@2 n$8_2 right))) (=> (= (ControlFlow 0 23) 22) anon98_correct))))))
(let ((anon171_Else_correct  (=> (forall ((n$7_3_1 T@U) ) (!  (=> (= (type n$7_3_1) RefType) (=> (and (U_2_bool (MapType2Select nodes n$7_3_1)) (not (= (MapType0Select Heap@2 n$7_3_1 left) null))) (U_2_bool (MapType2Select nodes (MapType0Select Heap@2 n$7_3_1 left)))))
 :qid |stdinbpl.1763:20|
 :skolemid |235|
 :pattern ( (MapType2Select nodes (MapType0Select Heap@2 n$7_3_1 left)))
 :pattern ( (MapType2Select nodes n$7_3_1) (MapType0Select Heap@2 n$7_3_1 left))
)) (and (and (=> (= (ControlFlow 0 59) 58) anon173_Else_correct) (=> (= (ControlFlow 0 59) 23) anon174_Then_correct)) (=> (= (ControlFlow 0 59) 25) anon174_Else_correct)))))
(let ((anon94_correct true))
(let ((anon172_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select nodes n$7_2)) (not (= (MapType0Select Heap@2 n$7_2 left) null)))) (= (ControlFlow 0 21) 18)) anon94_correct)))
(let ((anon172_Then_correct  (=> (and (U_2_bool (MapType2Select nodes n$7_2)) (not (= (MapType0Select Heap@2 n$7_2 left) null))) (and (=> (= (ControlFlow 0 19) (- 0 20)) (U_2_bool (MapType2Select nodes (MapType0Select Heap@2 n$7_2 left)))) (=> (U_2_bool (MapType2Select nodes (MapType0Select Heap@2 n$7_2 left))) (=> (= (ControlFlow 0 19) 18) anon94_correct))))))
(let ((anon91_correct  (=> (state Heap@2 Mask@1) (and (=> (= (ControlFlow 0 60) (- 0 68)) (U_2_bool (MapType2Select nodes node))) (=> (U_2_bool (MapType2Select nodes node)) (and (=> (= (ControlFlow 0 60) (- 0 67)) (not (U_2_bool (MapType2Select nodes null)))) (=> (not (U_2_bool (MapType2Select nodes null))) (and (=> (= (ControlFlow 0 60) (- 0 66)) (forall ((n$4_2 T@U) (n$4_2_1 T@U) ) (!  (=> (and (= (type n$4_2) RefType) (= (type n$4_2_1) RefType)) (=> (and (and (and (and (not (= n$4_2 n$4_2_1)) (U_2_bool (MapType2Select nodes n$4_2))) (U_2_bool (MapType2Select nodes n$4_2_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$4_2 n$4_2_1))))
 :qid |stdinbpl.1640:17|
 :skolemid |217|
 :pattern ( (neverTriggered7 n$4_2) (neverTriggered7 n$4_2_1))
))) (=> (forall ((n$4_2@@0 T@U) (n$4_2_1@@0 T@U) ) (!  (=> (and (= (type n$4_2@@0) RefType) (= (type n$4_2_1@@0) RefType)) (=> (and (and (and (and (not (= n$4_2@@0 n$4_2_1@@0)) (U_2_bool (MapType2Select nodes n$4_2@@0))) (U_2_bool (MapType2Select nodes n$4_2_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$4_2@@0 n$4_2_1@@0))))
 :qid |stdinbpl.1640:17|
 :skolemid |217|
 :pattern ( (neverTriggered7 n$4_2@@0) (neverTriggered7 n$4_2_1@@0))
)) (and (=> (= (ControlFlow 0 60) (- 0 65)) (forall ((n$4_2@@1 T@U) ) (!  (=> (and (= (type n$4_2@@1) RefType) (U_2_bool (MapType2Select nodes n$4_2@@1))) (>= (U_2_real (MapType1Select Mask@1 n$4_2@@1 left)) FullPerm))
 :qid |stdinbpl.1647:17|
 :skolemid |218|
 :pattern ( (MapType0Select Heap@2 n$4_2@@1 left))
 :pattern ( (MapType1Select QPMask@15 n$4_2@@1 left))
 :pattern ( (MapType2Select nodes n$4_2@@1))
))) (=> (forall ((n$4_2@@2 T@U) ) (!  (=> (and (= (type n$4_2@@2) RefType) (U_2_bool (MapType2Select nodes n$4_2@@2))) (>= (U_2_real (MapType1Select Mask@1 n$4_2@@2 left)) FullPerm))
 :qid |stdinbpl.1647:17|
 :skolemid |218|
 :pattern ( (MapType0Select Heap@2 n$4_2@@2 left))
 :pattern ( (MapType1Select QPMask@15 n$4_2@@2 left))
 :pattern ( (MapType2Select nodes n$4_2@@2))
)) (=> (and (and (forall ((n$4_2@@3 T@U) ) (!  (=> (= (type n$4_2@@3) RefType) (=> (and (U_2_bool (MapType2Select nodes n$4_2@@3)) (< NoPerm FullPerm)) (and (qpRange7 n$4_2@@3) (= (invRecv7 n$4_2@@3) n$4_2@@3))))
 :qid |stdinbpl.1653:22|
 :skolemid |219|
 :pattern ( (MapType0Select Heap@2 n$4_2@@3 left))
 :pattern ( (MapType1Select QPMask@15 n$4_2@@3 left))
 :pattern ( (MapType2Select nodes n$4_2@@3))
)) (forall ((o_3@@8 T@U) ) (!  (=> (= (type o_3@@8) RefType) (=> (and (U_2_bool (MapType2Select nodes (invRecv7 o_3@@8))) (and (< NoPerm FullPerm) (qpRange7 o_3@@8))) (= (invRecv7 o_3@@8) o_3@@8)))
 :qid |stdinbpl.1657:22|
 :skolemid |220|
 :pattern ( (invRecv7 o_3@@8))
))) (and (forall ((o_3@@9 T@U) ) (!  (=> (= (type o_3@@9) RefType) (and (=> (and (U_2_bool (MapType2Select nodes (invRecv7 o_3@@9))) (and (< NoPerm FullPerm) (qpRange7 o_3@@9))) (and (= (invRecv7 o_3@@9) o_3@@9) (= (U_2_real (MapType1Select QPMask@15 o_3@@9 left)) (- (U_2_real (MapType1Select Mask@1 o_3@@9 left)) FullPerm)))) (=> (not (and (U_2_bool (MapType2Select nodes (invRecv7 o_3@@9))) (and (< NoPerm FullPerm) (qpRange7 o_3@@9)))) (= (U_2_real (MapType1Select QPMask@15 o_3@@9 left)) (U_2_real (MapType1Select Mask@1 o_3@@9 left))))))
 :qid |stdinbpl.1663:22|
 :skolemid |221|
 :pattern ( (MapType1Select QPMask@15 o_3@@9 left))
)) (forall ((o_3@@10 T@U) (f_5@@2 T@U) ) (! (let ((B@@14 (FieldTypeInv1 (type f_5@@2))))
(let ((A@@15 (FieldTypeInv0 (type f_5@@2))))
 (=> (and (and (= (type o_3@@10) RefType) (= (type f_5@@2) (FieldType A@@15 B@@14))) (not (= f_5@@2 left))) (= (U_2_real (MapType1Select Mask@1 o_3@@10 f_5@@2)) (U_2_real (MapType1Select QPMask@15 o_3@@10 f_5@@2))))))
 :qid |stdinbpl.1669:29|
 :skolemid |222|
 :pattern ( (MapType1Select QPMask@15 o_3@@10 f_5@@2))
)))) (and (=> (= (ControlFlow 0 60) (- 0 64)) (forall ((n$5_2 T@U) (n$5_2_1 T@U) ) (!  (=> (and (= (type n$5_2) RefType) (= (type n$5_2_1) RefType)) (=> (and (and (and (and (not (= n$5_2 n$5_2_1)) (U_2_bool (MapType2Select nodes n$5_2))) (U_2_bool (MapType2Select nodes n$5_2_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$5_2 n$5_2_1))))
 :qid |stdinbpl.1681:17|
 :skolemid |223|
 :pattern ( (neverTriggered8 n$5_2) (neverTriggered8 n$5_2_1))
))) (=> (forall ((n$5_2@@0 T@U) (n$5_2_1@@0 T@U) ) (!  (=> (and (= (type n$5_2@@0) RefType) (= (type n$5_2_1@@0) RefType)) (=> (and (and (and (and (not (= n$5_2@@0 n$5_2_1@@0)) (U_2_bool (MapType2Select nodes n$5_2@@0))) (U_2_bool (MapType2Select nodes n$5_2_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$5_2@@0 n$5_2_1@@0))))
 :qid |stdinbpl.1681:17|
 :skolemid |223|
 :pattern ( (neverTriggered8 n$5_2@@0) (neverTriggered8 n$5_2_1@@0))
)) (and (=> (= (ControlFlow 0 60) (- 0 63)) (forall ((n$5_2@@1 T@U) ) (!  (=> (and (= (type n$5_2@@1) RefType) (U_2_bool (MapType2Select nodes n$5_2@@1))) (>= (U_2_real (MapType1Select QPMask@15 n$5_2@@1 right)) FullPerm))
 :qid |stdinbpl.1688:17|
 :skolemid |224|
 :pattern ( (MapType0Select Heap@2 n$5_2@@1 right))
 :pattern ( (MapType1Select QPMask@16 n$5_2@@1 right))
 :pattern ( (MapType2Select nodes n$5_2@@1))
))) (=> (forall ((n$5_2@@2 T@U) ) (!  (=> (and (= (type n$5_2@@2) RefType) (U_2_bool (MapType2Select nodes n$5_2@@2))) (>= (U_2_real (MapType1Select QPMask@15 n$5_2@@2 right)) FullPerm))
 :qid |stdinbpl.1688:17|
 :skolemid |224|
 :pattern ( (MapType0Select Heap@2 n$5_2@@2 right))
 :pattern ( (MapType1Select QPMask@16 n$5_2@@2 right))
 :pattern ( (MapType2Select nodes n$5_2@@2))
)) (=> (and (and (forall ((n$5_2@@3 T@U) ) (!  (=> (= (type n$5_2@@3) RefType) (=> (and (U_2_bool (MapType2Select nodes n$5_2@@3)) (< NoPerm FullPerm)) (and (qpRange8 n$5_2@@3) (= (invRecv8 n$5_2@@3) n$5_2@@3))))
 :qid |stdinbpl.1694:22|
 :skolemid |225|
 :pattern ( (MapType0Select Heap@2 n$5_2@@3 right))
 :pattern ( (MapType1Select QPMask@16 n$5_2@@3 right))
 :pattern ( (MapType2Select nodes n$5_2@@3))
)) (forall ((o_3@@11 T@U) ) (!  (=> (= (type o_3@@11) RefType) (=> (and (U_2_bool (MapType2Select nodes (invRecv8 o_3@@11))) (and (< NoPerm FullPerm) (qpRange8 o_3@@11))) (= (invRecv8 o_3@@11) o_3@@11)))
 :qid |stdinbpl.1698:22|
 :skolemid |226|
 :pattern ( (invRecv8 o_3@@11))
))) (and (forall ((o_3@@12 T@U) ) (!  (=> (= (type o_3@@12) RefType) (and (=> (and (U_2_bool (MapType2Select nodes (invRecv8 o_3@@12))) (and (< NoPerm FullPerm) (qpRange8 o_3@@12))) (and (= (invRecv8 o_3@@12) o_3@@12) (= (U_2_real (MapType1Select QPMask@16 o_3@@12 right)) (- (U_2_real (MapType1Select QPMask@15 o_3@@12 right)) FullPerm)))) (=> (not (and (U_2_bool (MapType2Select nodes (invRecv8 o_3@@12))) (and (< NoPerm FullPerm) (qpRange8 o_3@@12)))) (= (U_2_real (MapType1Select QPMask@16 o_3@@12 right)) (U_2_real (MapType1Select QPMask@15 o_3@@12 right))))))
 :qid |stdinbpl.1704:22|
 :skolemid |227|
 :pattern ( (MapType1Select QPMask@16 o_3@@12 right))
)) (forall ((o_3@@13 T@U) (f_5@@3 T@U) ) (! (let ((B@@15 (FieldTypeInv1 (type f_5@@3))))
(let ((A@@16 (FieldTypeInv0 (type f_5@@3))))
 (=> (and (and (= (type o_3@@13) RefType) (= (type f_5@@3) (FieldType A@@16 B@@15))) (not (= f_5@@3 right))) (= (U_2_real (MapType1Select QPMask@15 o_3@@13 f_5@@3)) (U_2_real (MapType1Select QPMask@16 o_3@@13 f_5@@3))))))
 :qid |stdinbpl.1710:29|
 :skolemid |228|
 :pattern ( (MapType1Select QPMask@16 o_3@@13 f_5@@3))
)))) (and (=> (= (ControlFlow 0 60) (- 0 62)) (forall ((n$6_2 T@U) (n$6_2_1 T@U) ) (!  (=> (and (= (type n$6_2) RefType) (= (type n$6_2_1) RefType)) (=> (and (and (and (and (not (= n$6_2 n$6_2_1)) (U_2_bool (MapType2Select nodes n$6_2))) (U_2_bool (MapType2Select nodes n$6_2_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$6_2 n$6_2_1))))
 :qid |stdinbpl.1722:17|
 :skolemid |229|
 :pattern ( (neverTriggered9 n$6_2) (neverTriggered9 n$6_2_1))
))) (=> (forall ((n$6_2@@0 T@U) (n$6_2_1@@0 T@U) ) (!  (=> (and (= (type n$6_2@@0) RefType) (= (type n$6_2_1@@0) RefType)) (=> (and (and (and (and (not (= n$6_2@@0 n$6_2_1@@0)) (U_2_bool (MapType2Select nodes n$6_2@@0))) (U_2_bool (MapType2Select nodes n$6_2_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$6_2@@0 n$6_2_1@@0))))
 :qid |stdinbpl.1722:17|
 :skolemid |229|
 :pattern ( (neverTriggered9 n$6_2@@0) (neverTriggered9 n$6_2_1@@0))
)) (and (=> (= (ControlFlow 0 60) (- 0 61)) (forall ((n$6_2@@1 T@U) ) (!  (=> (and (= (type n$6_2@@1) RefType) (U_2_bool (MapType2Select nodes n$6_2@@1))) (>= (U_2_real (MapType1Select QPMask@16 n$6_2@@1 is_marked)) FullPerm))
 :qid |stdinbpl.1729:17|
 :skolemid |230|
 :pattern ( (MapType0Select Heap@2 n$6_2@@1 is_marked))
 :pattern ( (MapType1Select QPMask@17 n$6_2@@1 is_marked))
 :pattern ( (MapType2Select nodes n$6_2@@1))
))) (=> (forall ((n$6_2@@2 T@U) ) (!  (=> (and (= (type n$6_2@@2) RefType) (U_2_bool (MapType2Select nodes n$6_2@@2))) (>= (U_2_real (MapType1Select QPMask@16 n$6_2@@2 is_marked)) FullPerm))
 :qid |stdinbpl.1729:17|
 :skolemid |230|
 :pattern ( (MapType0Select Heap@2 n$6_2@@2 is_marked))
 :pattern ( (MapType1Select QPMask@17 n$6_2@@2 is_marked))
 :pattern ( (MapType2Select nodes n$6_2@@2))
)) (=> (and (and (forall ((n$6_2@@3 T@U) ) (!  (=> (= (type n$6_2@@3) RefType) (=> (and (U_2_bool (MapType2Select nodes n$6_2@@3)) (< NoPerm FullPerm)) (and (qpRange9 n$6_2@@3) (= (invRecv9 n$6_2@@3) n$6_2@@3))))
 :qid |stdinbpl.1735:22|
 :skolemid |231|
 :pattern ( (MapType0Select Heap@2 n$6_2@@3 is_marked))
 :pattern ( (MapType1Select QPMask@17 n$6_2@@3 is_marked))
 :pattern ( (MapType2Select nodes n$6_2@@3))
)) (forall ((o_3@@14 T@U) ) (!  (=> (= (type o_3@@14) RefType) (=> (and (U_2_bool (MapType2Select nodes (invRecv9 o_3@@14))) (and (< NoPerm FullPerm) (qpRange9 o_3@@14))) (= (invRecv9 o_3@@14) o_3@@14)))
 :qid |stdinbpl.1739:22|
 :skolemid |232|
 :pattern ( (invRecv9 o_3@@14))
))) (and (forall ((o_3@@15 T@U) ) (!  (=> (= (type o_3@@15) RefType) (and (=> (and (U_2_bool (MapType2Select nodes (invRecv9 o_3@@15))) (and (< NoPerm FullPerm) (qpRange9 o_3@@15))) (and (= (invRecv9 o_3@@15) o_3@@15) (= (U_2_real (MapType1Select QPMask@17 o_3@@15 is_marked)) (- (U_2_real (MapType1Select QPMask@16 o_3@@15 is_marked)) FullPerm)))) (=> (not (and (U_2_bool (MapType2Select nodes (invRecv9 o_3@@15))) (and (< NoPerm FullPerm) (qpRange9 o_3@@15)))) (= (U_2_real (MapType1Select QPMask@17 o_3@@15 is_marked)) (U_2_real (MapType1Select QPMask@16 o_3@@15 is_marked))))))
 :qid |stdinbpl.1745:22|
 :skolemid |233|
 :pattern ( (MapType1Select QPMask@17 o_3@@15 is_marked))
)) (forall ((o_3@@16 T@U) (f_5@@4 T@U) ) (! (let ((B@@16 (FieldTypeInv1 (type f_5@@4))))
(let ((A@@17 (FieldTypeInv0 (type f_5@@4))))
 (=> (and (and (= (type o_3@@16) RefType) (= (type f_5@@4) (FieldType A@@17 B@@16))) (not (= f_5@@4 is_marked))) (= (U_2_real (MapType1Select QPMask@16 o_3@@16 f_5@@4)) (U_2_real (MapType1Select QPMask@17 o_3@@16 f_5@@4))))))
 :qid |stdinbpl.1751:29|
 :skolemid |234|
 :pattern ( (MapType1Select QPMask@17 o_3@@16 f_5@@4))
)))) (and (and (=> (= (ControlFlow 0 60) 59) anon171_Else_correct) (=> (= (ControlFlow 0 60) 19) anon172_Then_correct)) (=> (= (ControlFlow 0 60) 21) anon172_Else_correct))))))))))))))))))))))))
(let ((anon169_Else_correct  (=> (forall ((n$3_5_1 T@U) ) (!  (=> (= (type n$3_5_1) RefType) (=> (and (U_2_bool (MapType2Select nodes n$3_5_1)) (not (= (MapType0Select Heap@1 n$3_5_1 right) null))) (U_2_bool (MapType2Select nodes (MapType0Select Heap@1 n$3_5_1 right)))))
 :qid |stdinbpl.1476:26|
 :skolemid |191|
 :pattern ( (MapType2Select nodes (MapType0Select Heap@1 n$3_5_1 right)))
 :pattern ( (MapType2Select nodes n$3_5_1) (MapType0Select Heap@1 n$3_5_1 right))
)) (and (=> (= (ControlFlow 0 74) (- 0 78)) (not (U_2_bool (MapType0Select Heap@1 arg_node_1@0 is_marked)))) (=> (not (U_2_bool (MapType0Select Heap@1 arg_node_1@0 is_marked))) (=> (IdenticalOnKnownLocations Heap@1 ExhaleHeap@1 QPMask@11) (=> (and (U_2_bool (MapType2Select nodes arg_node_1@0)) (not (U_2_bool (MapType2Select nodes null)))) (and (=> (= (ControlFlow 0 74) (- 0 77)) (forall ((n$4_4 T@U) (n$4_4_1 T@U) ) (!  (=> (and (= (type n$4_4) RefType) (= (type n$4_4_1) RefType)) (=> (and (and (and (and (not (= n$4_4 n$4_4_1)) (U_2_bool (MapType2Select nodes n$4_4))) (U_2_bool (MapType2Select nodes n$4_4_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$4_4 n$4_4_1))))
 :qid |stdinbpl.1492:21|
 :skolemid |192|
 :no-pattern (type n$4_4)
 :no-pattern (type n$4_4_1)
 :no-pattern (U_2_int n$4_4)
 :no-pattern (U_2_bool n$4_4)
 :no-pattern (U_2_int n$4_4_1)
 :no-pattern (U_2_bool n$4_4_1)
))) (=> (forall ((n$4_4@@0 T@U) (n$4_4_1@@0 T@U) ) (!  (=> (and (= (type n$4_4@@0) RefType) (= (type n$4_4_1@@0) RefType)) (=> (and (and (and (and (not (= n$4_4@@0 n$4_4_1@@0)) (U_2_bool (MapType2Select nodes n$4_4@@0))) (U_2_bool (MapType2Select nodes n$4_4_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$4_4@@0 n$4_4_1@@0))))
 :qid |stdinbpl.1492:21|
 :skolemid |192|
 :no-pattern (type n$4_4@@0)
 :no-pattern (type n$4_4_1@@0)
 :no-pattern (U_2_int n$4_4@@0)
 :no-pattern (U_2_bool n$4_4@@0)
 :no-pattern (U_2_int n$4_4_1@@0)
 :no-pattern (U_2_bool n$4_4_1@@0)
)) (=> (and (forall ((n$4_4@@1 T@U) ) (!  (=> (= (type n$4_4@@1) RefType) (=> (and (U_2_bool (MapType2Select nodes n$4_4@@1)) (< NoPerm FullPerm)) (and (qpRange19 n$4_4@@1) (= (invRecv19 n$4_4@@1) n$4_4@@1))))
 :qid |stdinbpl.1498:28|
 :skolemid |193|
 :pattern ( (MapType0Select ExhaleHeap@1 n$4_4@@1 left))
 :pattern ( (MapType1Select QPMask@12 n$4_4@@1 left))
 :pattern ( (MapType2Select nodes n$4_4@@1))
)) (forall ((o_3@@17 T@U) ) (!  (=> (= (type o_3@@17) RefType) (=> (and (and (U_2_bool (MapType2Select nodes (invRecv19 o_3@@17))) (< NoPerm FullPerm)) (qpRange19 o_3@@17)) (= (invRecv19 o_3@@17) o_3@@17)))
 :qid |stdinbpl.1502:28|
 :skolemid |194|
 :pattern ( (invRecv19 o_3@@17))
))) (=> (and (and (forall ((n$4_4@@2 T@U) ) (!  (=> (and (= (type n$4_4@@2) RefType) (U_2_bool (MapType2Select nodes n$4_4@@2))) (not (= n$4_4@@2 null)))
 :qid |stdinbpl.1508:28|
 :skolemid |195|
 :pattern ( (MapType0Select ExhaleHeap@1 n$4_4@@2 left))
 :pattern ( (MapType1Select QPMask@12 n$4_4@@2 left))
 :pattern ( (MapType2Select nodes n$4_4@@2))
)) (forall ((o_3@@18 T@U) ) (!  (=> (= (type o_3@@18) RefType) (and (=> (and (and (U_2_bool (MapType2Select nodes (invRecv19 o_3@@18))) (< NoPerm FullPerm)) (qpRange19 o_3@@18)) (and (=> (< NoPerm FullPerm) (= (invRecv19 o_3@@18) o_3@@18)) (= (U_2_real (MapType1Select QPMask@12 o_3@@18 left)) (+ (U_2_real (MapType1Select QPMask@11 o_3@@18 left)) FullPerm)))) (=> (not (and (and (U_2_bool (MapType2Select nodes (invRecv19 o_3@@18))) (< NoPerm FullPerm)) (qpRange19 o_3@@18))) (= (U_2_real (MapType1Select QPMask@12 o_3@@18 left)) (U_2_real (MapType1Select QPMask@11 o_3@@18 left))))))
 :qid |stdinbpl.1514:28|
 :skolemid |196|
 :pattern ( (MapType1Select QPMask@12 o_3@@18 left))
))) (and (forall ((o_3@@19 T@U) (f_5@@5 T@U) ) (! (let ((B@@17 (FieldTypeInv1 (type f_5@@5))))
(let ((A@@18 (FieldTypeInv0 (type f_5@@5))))
 (=> (and (and (= (type o_3@@19) RefType) (= (type f_5@@5) (FieldType A@@18 B@@17))) (not (= f_5@@5 left))) (= (U_2_real (MapType1Select QPMask@11 o_3@@19 f_5@@5)) (U_2_real (MapType1Select QPMask@12 o_3@@19 f_5@@5))))))
 :qid |stdinbpl.1518:35|
 :skolemid |197|
 :pattern ( (MapType1Select QPMask@11 o_3@@19 f_5@@5))
 :pattern ( (MapType1Select QPMask@12 o_3@@19 f_5@@5))
)) (state ExhaleHeap@1 QPMask@12))) (and (=> (= (ControlFlow 0 74) (- 0 76)) (forall ((n$5_4 T@U) (n$5_4_1 T@U) ) (!  (=> (and (= (type n$5_4) RefType) (= (type n$5_4_1) RefType)) (=> (and (and (and (and (not (= n$5_4 n$5_4_1)) (U_2_bool (MapType2Select nodes n$5_4))) (U_2_bool (MapType2Select nodes n$5_4_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$5_4 n$5_4_1))))
 :qid |stdinbpl.1526:21|
 :skolemid |198|
 :no-pattern (type n$5_4)
 :no-pattern (type n$5_4_1)
 :no-pattern (U_2_int n$5_4)
 :no-pattern (U_2_bool n$5_4)
 :no-pattern (U_2_int n$5_4_1)
 :no-pattern (U_2_bool n$5_4_1)
))) (=> (forall ((n$5_4@@0 T@U) (n$5_4_1@@0 T@U) ) (!  (=> (and (= (type n$5_4@@0) RefType) (= (type n$5_4_1@@0) RefType)) (=> (and (and (and (and (not (= n$5_4@@0 n$5_4_1@@0)) (U_2_bool (MapType2Select nodes n$5_4@@0))) (U_2_bool (MapType2Select nodes n$5_4_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$5_4@@0 n$5_4_1@@0))))
 :qid |stdinbpl.1526:21|
 :skolemid |198|
 :no-pattern (type n$5_4@@0)
 :no-pattern (type n$5_4_1@@0)
 :no-pattern (U_2_int n$5_4@@0)
 :no-pattern (U_2_bool n$5_4@@0)
 :no-pattern (U_2_int n$5_4_1@@0)
 :no-pattern (U_2_bool n$5_4_1@@0)
)) (=> (and (forall ((n$5_4@@1 T@U) ) (!  (=> (= (type n$5_4@@1) RefType) (=> (and (U_2_bool (MapType2Select nodes n$5_4@@1)) (< NoPerm FullPerm)) (and (qpRange20 n$5_4@@1) (= (invRecv20 n$5_4@@1) n$5_4@@1))))
 :qid |stdinbpl.1532:28|
 :skolemid |199|
 :pattern ( (MapType0Select ExhaleHeap@1 n$5_4@@1 right))
 :pattern ( (MapType1Select QPMask@13 n$5_4@@1 right))
 :pattern ( (MapType2Select nodes n$5_4@@1))
)) (forall ((o_3@@20 T@U) ) (!  (=> (= (type o_3@@20) RefType) (=> (and (and (U_2_bool (MapType2Select nodes (invRecv20 o_3@@20))) (< NoPerm FullPerm)) (qpRange20 o_3@@20)) (= (invRecv20 o_3@@20) o_3@@20)))
 :qid |stdinbpl.1536:28|
 :skolemid |200|
 :pattern ( (invRecv20 o_3@@20))
))) (=> (and (and (forall ((n$5_4@@2 T@U) ) (!  (=> (and (= (type n$5_4@@2) RefType) (U_2_bool (MapType2Select nodes n$5_4@@2))) (not (= n$5_4@@2 null)))
 :qid |stdinbpl.1542:28|
 :skolemid |201|
 :pattern ( (MapType0Select ExhaleHeap@1 n$5_4@@2 right))
 :pattern ( (MapType1Select QPMask@13 n$5_4@@2 right))
 :pattern ( (MapType2Select nodes n$5_4@@2))
)) (forall ((o_3@@21 T@U) ) (!  (=> (= (type o_3@@21) RefType) (and (=> (and (and (U_2_bool (MapType2Select nodes (invRecv20 o_3@@21))) (< NoPerm FullPerm)) (qpRange20 o_3@@21)) (and (=> (< NoPerm FullPerm) (= (invRecv20 o_3@@21) o_3@@21)) (= (U_2_real (MapType1Select QPMask@13 o_3@@21 right)) (+ (U_2_real (MapType1Select QPMask@12 o_3@@21 right)) FullPerm)))) (=> (not (and (and (U_2_bool (MapType2Select nodes (invRecv20 o_3@@21))) (< NoPerm FullPerm)) (qpRange20 o_3@@21))) (= (U_2_real (MapType1Select QPMask@13 o_3@@21 right)) (U_2_real (MapType1Select QPMask@12 o_3@@21 right))))))
 :qid |stdinbpl.1548:28|
 :skolemid |202|
 :pattern ( (MapType1Select QPMask@13 o_3@@21 right))
))) (and (forall ((o_3@@22 T@U) (f_5@@6 T@U) ) (! (let ((B@@18 (FieldTypeInv1 (type f_5@@6))))
(let ((A@@19 (FieldTypeInv0 (type f_5@@6))))
 (=> (and (and (= (type o_3@@22) RefType) (= (type f_5@@6) (FieldType A@@19 B@@18))) (not (= f_5@@6 right))) (= (U_2_real (MapType1Select QPMask@12 o_3@@22 f_5@@6)) (U_2_real (MapType1Select QPMask@13 o_3@@22 f_5@@6))))))
 :qid |stdinbpl.1552:35|
 :skolemid |203|
 :pattern ( (MapType1Select QPMask@12 o_3@@22 f_5@@6))
 :pattern ( (MapType1Select QPMask@13 o_3@@22 f_5@@6))
)) (state ExhaleHeap@1 QPMask@13))) (and (=> (= (ControlFlow 0 74) (- 0 75)) (forall ((n$6_4 T@U) (n$6_4_1 T@U) ) (!  (=> (and (= (type n$6_4) RefType) (= (type n$6_4_1) RefType)) (=> (and (and (and (and (not (= n$6_4 n$6_4_1)) (U_2_bool (MapType2Select nodes n$6_4))) (U_2_bool (MapType2Select nodes n$6_4_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$6_4 n$6_4_1))))
 :qid |stdinbpl.1560:21|
 :skolemid |204|
 :no-pattern (type n$6_4)
 :no-pattern (type n$6_4_1)
 :no-pattern (U_2_int n$6_4)
 :no-pattern (U_2_bool n$6_4)
 :no-pattern (U_2_int n$6_4_1)
 :no-pattern (U_2_bool n$6_4_1)
))) (=> (forall ((n$6_4@@0 T@U) (n$6_4_1@@0 T@U) ) (!  (=> (and (= (type n$6_4@@0) RefType) (= (type n$6_4_1@@0) RefType)) (=> (and (and (and (and (not (= n$6_4@@0 n$6_4_1@@0)) (U_2_bool (MapType2Select nodes n$6_4@@0))) (U_2_bool (MapType2Select nodes n$6_4_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$6_4@@0 n$6_4_1@@0))))
 :qid |stdinbpl.1560:21|
 :skolemid |204|
 :no-pattern (type n$6_4@@0)
 :no-pattern (type n$6_4_1@@0)
 :no-pattern (U_2_int n$6_4@@0)
 :no-pattern (U_2_bool n$6_4@@0)
 :no-pattern (U_2_int n$6_4_1@@0)
 :no-pattern (U_2_bool n$6_4_1@@0)
)) (=> (forall ((n$6_4@@1 T@U) ) (!  (=> (= (type n$6_4@@1) RefType) (=> (and (U_2_bool (MapType2Select nodes n$6_4@@1)) (< NoPerm FullPerm)) (and (qpRange21 n$6_4@@1) (= (invRecv21 n$6_4@@1) n$6_4@@1))))
 :qid |stdinbpl.1566:28|
 :skolemid |205|
 :pattern ( (MapType0Select ExhaleHeap@1 n$6_4@@1 is_marked))
 :pattern ( (MapType1Select QPMask@14 n$6_4@@1 is_marked))
 :pattern ( (MapType2Select nodes n$6_4@@1))
)) (=> (and (forall ((o_3@@23 T@U) ) (!  (=> (= (type o_3@@23) RefType) (=> (and (and (U_2_bool (MapType2Select nodes (invRecv21 o_3@@23))) (< NoPerm FullPerm)) (qpRange21 o_3@@23)) (= (invRecv21 o_3@@23) o_3@@23)))
 :qid |stdinbpl.1570:28|
 :skolemid |206|
 :pattern ( (invRecv21 o_3@@23))
)) (forall ((n$6_4@@2 T@U) ) (!  (=> (and (= (type n$6_4@@2) RefType) (U_2_bool (MapType2Select nodes n$6_4@@2))) (not (= n$6_4@@2 null)))
 :qid |stdinbpl.1576:28|
 :skolemid |207|
 :pattern ( (MapType0Select ExhaleHeap@1 n$6_4@@2 is_marked))
 :pattern ( (MapType1Select QPMask@14 n$6_4@@2 is_marked))
 :pattern ( (MapType2Select nodes n$6_4@@2))
))) (=> (and (and (and (and (forall ((o_3@@24 T@U) ) (!  (=> (= (type o_3@@24) RefType) (and (=> (and (and (U_2_bool (MapType2Select nodes (invRecv21 o_3@@24))) (< NoPerm FullPerm)) (qpRange21 o_3@@24)) (and (=> (< NoPerm FullPerm) (= (invRecv21 o_3@@24) o_3@@24)) (= (U_2_real (MapType1Select QPMask@14 o_3@@24 is_marked)) (+ (U_2_real (MapType1Select QPMask@13 o_3@@24 is_marked)) FullPerm)))) (=> (not (and (and (U_2_bool (MapType2Select nodes (invRecv21 o_3@@24))) (< NoPerm FullPerm)) (qpRange21 o_3@@24))) (= (U_2_real (MapType1Select QPMask@14 o_3@@24 is_marked)) (U_2_real (MapType1Select QPMask@13 o_3@@24 is_marked))))))
 :qid |stdinbpl.1582:28|
 :skolemid |208|
 :pattern ( (MapType1Select QPMask@14 o_3@@24 is_marked))
)) (forall ((o_3@@25 T@U) (f_5@@7 T@U) ) (! (let ((B@@19 (FieldTypeInv1 (type f_5@@7))))
(let ((A@@20 (FieldTypeInv0 (type f_5@@7))))
 (=> (and (and (= (type o_3@@25) RefType) (= (type f_5@@7) (FieldType A@@20 B@@19))) (not (= f_5@@7 is_marked))) (= (U_2_real (MapType1Select QPMask@13 o_3@@25 f_5@@7)) (U_2_real (MapType1Select QPMask@14 o_3@@25 f_5@@7))))))
 :qid |stdinbpl.1586:35|
 :skolemid |209|
 :pattern ( (MapType1Select QPMask@13 o_3@@25 f_5@@7))
 :pattern ( (MapType1Select QPMask@14 o_3@@25 f_5@@7))
))) (and (state ExhaleHeap@1 QPMask@14) (forall ((n$7_5 T@U) ) (!  (=> (= (type n$7_5) RefType) (=> (and (U_2_bool (MapType2Select nodes n$7_5)) (not (= (MapType0Select ExhaleHeap@1 n$7_5 left) null))) (U_2_bool (MapType2Select nodes (MapType0Select ExhaleHeap@1 n$7_5 left)))))
 :qid |stdinbpl.1592:26|
 :skolemid |210|
 :pattern ( (MapType2Select nodes (MapType0Select ExhaleHeap@1 n$7_5 left)))
 :pattern ( (MapType2Select nodes n$7_5) (MapType0Select ExhaleHeap@1 n$7_5 left))
)))) (and (and (forall ((n$8_5 T@U) ) (!  (=> (= (type n$8_5) RefType) (=> (and (U_2_bool (MapType2Select nodes n$8_5)) (not (= (MapType0Select ExhaleHeap@1 n$8_5 right) null))) (U_2_bool (MapType2Select nodes (MapType0Select ExhaleHeap@1 n$8_5 right)))))
 :qid |stdinbpl.1596:26|
 :skolemid |211|
 :pattern ( (MapType2Select nodes (MapType0Select ExhaleHeap@1 n$8_5 right)))
 :pattern ( (MapType2Select nodes n$8_5) (MapType0Select ExhaleHeap@1 n$8_5 right))
)) (forall ((n_29 T@U) ) (!  (=> (and (and (= (type n_29) RefType) (U_2_bool (MapType2Select nodes n_29))) (U_2_bool (MapType0Select Heap@1 n_29 is_marked))) (U_2_bool (MapType0Select ExhaleHeap@1 n_29 is_marked)))
 :qid |stdinbpl.1600:26|
 :skolemid |212|
 :pattern ( (MapType2Select nodes n_29) (MapType0Select ExhaleHeap@1 n_29 is_marked))
))) (and (U_2_bool (MapType0Select ExhaleHeap@1 arg_node_1@0 is_marked)) (forall ((n_30 T@U) ) (!  (=> (and (= (type n_30) RefType) (U_2_bool (MapType2Select nodes n_30))) (= (MapType0Select ExhaleHeap@1 n_30 left) (MapType0Select Heap@1 n_30 left)))
 :qid |stdinbpl.1605:26|
 :skolemid |213|
 :pattern ( (MapType2Select nodes n_30) (MapType0Select ExhaleHeap@1 n_30 left))
))))) (and (and (and (forall ((n_31 T@U) ) (!  (=> (and (= (type n_31) RefType) (U_2_bool (MapType2Select nodes n_31))) (= (MapType0Select ExhaleHeap@1 n_31 right) (MapType0Select Heap@1 n_31 right)))
 :qid |stdinbpl.1609:26|
 :skolemid |214|
 :pattern ( (MapType2Select nodes n_31) (MapType0Select ExhaleHeap@1 n_31 right))
)) (forall ((n_32 T@U) ) (!  (=> (and (and (= (type n_32) RefType) (U_2_bool (MapType2Select nodes n_32))) (and (not (U_2_bool (MapType0Select Heap@1 n_32 is_marked))) (U_2_bool (MapType0Select ExhaleHeap@1 n_32 is_marked)))) (or (= (MapType0Select ExhaleHeap@1 n_32 left) null) (U_2_bool (MapType0Select ExhaleHeap@1 (MapType0Select ExhaleHeap@1 n_32 left) is_marked))))
 :qid |stdinbpl.1613:26|
 :skolemid |215|
 :pattern ( (MapType2Select nodes n_32) (MapType0Select ExhaleHeap@1 n_32 is_marked))
 :pattern ( (MapType2Select nodes n_32) (MapType0Select ExhaleHeap@1 (MapType0Select ExhaleHeap@1 n_32 left) is_marked))
))) (and (forall ((n_33 T@U) ) (!  (=> (and (and (= (type n_33) RefType) (U_2_bool (MapType2Select nodes n_33))) (and (not (U_2_bool (MapType0Select Heap@1 n_33 is_marked))) (U_2_bool (MapType0Select ExhaleHeap@1 n_33 is_marked)))) (or (= (MapType0Select ExhaleHeap@1 n_33 right) null) (U_2_bool (MapType0Select ExhaleHeap@1 (MapType0Select ExhaleHeap@1 n_33 right) is_marked))))
 :qid |stdinbpl.1617:26|
 :skolemid |216|
 :pattern ( (MapType2Select nodes n_33) (MapType0Select ExhaleHeap@1 n_33 is_marked))
 :pattern ( (MapType2Select nodes n_33) (MapType0Select ExhaleHeap@1 (MapType0Select ExhaleHeap@1 n_33 right) is_marked))
)) (state ExhaleHeap@1 QPMask@14))) (and (and (state ExhaleHeap@1 QPMask@14) (= Heap@2 ExhaleHeap@1)) (and (= Mask@1 QPMask@14) (= (ControlFlow 0 74) 60))))) anon91_correct))))))))))))))))))))
(let ((anon167_Else_correct  (=> (forall ((n$2_5_1 T@U) ) (!  (=> (= (type n$2_5_1) RefType) (=> (and (U_2_bool (MapType2Select nodes n$2_5_1)) (not (= (MapType0Select Heap@1 n$2_5_1 left) null))) (U_2_bool (MapType2Select nodes (MapType0Select Heap@1 n$2_5_1 left)))))
 :qid |stdinbpl.1465:26|
 :skolemid |190|
 :pattern ( (MapType2Select nodes (MapType0Select Heap@1 n$2_5_1 left)))
 :pattern ( (MapType2Select nodes n$2_5_1) (MapType0Select Heap@1 n$2_5_1 left))
)) (and (and (=> (= (ControlFlow 0 83) 74) anon169_Else_correct) (=> (= (ControlFlow 0 83) 80) anon170_Then_correct)) (=> (= (ControlFlow 0 83) 82) anon170_Else_correct)))))
(let ((anon166_Then_correct  (=> (and (not (= (MapType0Select Heap@1 node right) null)) (not (U_2_bool (MapType0Select Heap@1 (MapType0Select Heap@1 node right) is_marked)))) (and (=> (= (ControlFlow 0 84) (- 0 93)) (HasDirectPerm Mask@0 node right)) (=> (HasDirectPerm Mask@0 node right) (=> (= arg_node_1@0 (MapType0Select Heap@1 node right)) (and (=> (= (ControlFlow 0 84) (- 0 92)) (U_2_bool (MapType2Select nodes arg_node_1@0))) (=> (U_2_bool (MapType2Select nodes arg_node_1@0)) (and (=> (= (ControlFlow 0 84) (- 0 91)) (not (U_2_bool (MapType2Select nodes null)))) (=> (not (U_2_bool (MapType2Select nodes null))) (and (=> (= (ControlFlow 0 84) (- 0 90)) (forall ((n_28 T@U) (n_28_1 T@U) ) (!  (=> (and (= (type n_28) RefType) (= (type n_28_1) RefType)) (=> (and (and (and (and (not (= n_28 n_28_1)) (U_2_bool (MapType2Select nodes n_28))) (U_2_bool (MapType2Select nodes n_28_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_28 n_28_1))))
 :qid |stdinbpl.1342:23|
 :skolemid |172|
 :pattern ( (neverTriggered16 n_28) (neverTriggered16 n_28_1))
))) (=> (forall ((n_28@@0 T@U) (n_28_1@@0 T@U) ) (!  (=> (and (= (type n_28@@0) RefType) (= (type n_28_1@@0) RefType)) (=> (and (and (and (and (not (= n_28@@0 n_28_1@@0)) (U_2_bool (MapType2Select nodes n_28@@0))) (U_2_bool (MapType2Select nodes n_28_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_28@@0 n_28_1@@0))))
 :qid |stdinbpl.1342:23|
 :skolemid |172|
 :pattern ( (neverTriggered16 n_28@@0) (neverTriggered16 n_28_1@@0))
)) (and (=> (= (ControlFlow 0 84) (- 0 89)) (forall ((n_28@@1 T@U) ) (!  (=> (and (= (type n_28@@1) RefType) (U_2_bool (MapType2Select nodes n_28@@1))) (>= (U_2_real (MapType1Select Mask@0 n_28@@1 left)) FullPerm))
 :qid |stdinbpl.1349:23|
 :skolemid |173|
 :pattern ( (MapType0Select Heap@1 n_28@@1 left))
 :pattern ( (MapType1Select QPMask@9 n_28@@1 left))
 :pattern ( (MapType2Select nodes n_28@@1))
))) (=> (forall ((n_28@@2 T@U) ) (!  (=> (and (= (type n_28@@2) RefType) (U_2_bool (MapType2Select nodes n_28@@2))) (>= (U_2_real (MapType1Select Mask@0 n_28@@2 left)) FullPerm))
 :qid |stdinbpl.1349:23|
 :skolemid |173|
 :pattern ( (MapType0Select Heap@1 n_28@@2 left))
 :pattern ( (MapType1Select QPMask@9 n_28@@2 left))
 :pattern ( (MapType2Select nodes n_28@@2))
)) (=> (and (and (forall ((n_28@@3 T@U) ) (!  (=> (= (type n_28@@3) RefType) (=> (and (U_2_bool (MapType2Select nodes n_28@@3)) (< NoPerm FullPerm)) (and (qpRange16 n_28@@3) (= (invRecv16 n_28@@3) n_28@@3))))
 :qid |stdinbpl.1355:28|
 :skolemid |174|
 :pattern ( (MapType0Select Heap@1 n_28@@3 left))
 :pattern ( (MapType1Select QPMask@9 n_28@@3 left))
 :pattern ( (MapType2Select nodes n_28@@3))
)) (forall ((o_3@@26 T@U) ) (!  (=> (= (type o_3@@26) RefType) (=> (and (U_2_bool (MapType2Select nodes (invRecv16 o_3@@26))) (and (< NoPerm FullPerm) (qpRange16 o_3@@26))) (= (invRecv16 o_3@@26) o_3@@26)))
 :qid |stdinbpl.1359:28|
 :skolemid |175|
 :pattern ( (invRecv16 o_3@@26))
))) (and (forall ((o_3@@27 T@U) ) (!  (=> (= (type o_3@@27) RefType) (and (=> (and (U_2_bool (MapType2Select nodes (invRecv16 o_3@@27))) (and (< NoPerm FullPerm) (qpRange16 o_3@@27))) (and (= (invRecv16 o_3@@27) o_3@@27) (= (U_2_real (MapType1Select QPMask@9 o_3@@27 left)) (- (U_2_real (MapType1Select Mask@0 o_3@@27 left)) FullPerm)))) (=> (not (and (U_2_bool (MapType2Select nodes (invRecv16 o_3@@27))) (and (< NoPerm FullPerm) (qpRange16 o_3@@27)))) (= (U_2_real (MapType1Select QPMask@9 o_3@@27 left)) (U_2_real (MapType1Select Mask@0 o_3@@27 left))))))
 :qid |stdinbpl.1365:28|
 :skolemid |176|
 :pattern ( (MapType1Select QPMask@9 o_3@@27 left))
)) (forall ((o_3@@28 T@U) (f_5@@8 T@U) ) (! (let ((B@@20 (FieldTypeInv1 (type f_5@@8))))
(let ((A@@21 (FieldTypeInv0 (type f_5@@8))))
 (=> (and (and (= (type o_3@@28) RefType) (= (type f_5@@8) (FieldType A@@21 B@@20))) (not (= f_5@@8 left))) (= (U_2_real (MapType1Select Mask@0 o_3@@28 f_5@@8)) (U_2_real (MapType1Select QPMask@9 o_3@@28 f_5@@8))))))
 :qid |stdinbpl.1371:35|
 :skolemid |177|
 :pattern ( (MapType1Select QPMask@9 o_3@@28 f_5@@8))
)))) (and (=> (= (ControlFlow 0 84) (- 0 88)) (forall ((n$0_3 T@U) (n$0_3_1 T@U) ) (!  (=> (and (= (type n$0_3) RefType) (= (type n$0_3_1) RefType)) (=> (and (and (and (and (not (= n$0_3 n$0_3_1)) (U_2_bool (MapType2Select nodes n$0_3))) (U_2_bool (MapType2Select nodes n$0_3_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$0_3 n$0_3_1))))
 :qid |stdinbpl.1383:23|
 :skolemid |178|
 :pattern ( (neverTriggered17 n$0_3) (neverTriggered17 n$0_3_1))
))) (=> (forall ((n$0_3@@0 T@U) (n$0_3_1@@0 T@U) ) (!  (=> (and (= (type n$0_3@@0) RefType) (= (type n$0_3_1@@0) RefType)) (=> (and (and (and (and (not (= n$0_3@@0 n$0_3_1@@0)) (U_2_bool (MapType2Select nodes n$0_3@@0))) (U_2_bool (MapType2Select nodes n$0_3_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$0_3@@0 n$0_3_1@@0))))
 :qid |stdinbpl.1383:23|
 :skolemid |178|
 :pattern ( (neverTriggered17 n$0_3@@0) (neverTriggered17 n$0_3_1@@0))
)) (and (=> (= (ControlFlow 0 84) (- 0 87)) (forall ((n$0_3@@1 T@U) ) (!  (=> (and (= (type n$0_3@@1) RefType) (U_2_bool (MapType2Select nodes n$0_3@@1))) (>= (U_2_real (MapType1Select QPMask@9 n$0_3@@1 right)) FullPerm))
 :qid |stdinbpl.1390:23|
 :skolemid |179|
 :pattern ( (MapType0Select Heap@1 n$0_3@@1 right))
 :pattern ( (MapType1Select QPMask@10 n$0_3@@1 right))
 :pattern ( (MapType2Select nodes n$0_3@@1))
))) (=> (forall ((n$0_3@@2 T@U) ) (!  (=> (and (= (type n$0_3@@2) RefType) (U_2_bool (MapType2Select nodes n$0_3@@2))) (>= (U_2_real (MapType1Select QPMask@9 n$0_3@@2 right)) FullPerm))
 :qid |stdinbpl.1390:23|
 :skolemid |179|
 :pattern ( (MapType0Select Heap@1 n$0_3@@2 right))
 :pattern ( (MapType1Select QPMask@10 n$0_3@@2 right))
 :pattern ( (MapType2Select nodes n$0_3@@2))
)) (=> (and (and (forall ((n$0_3@@3 T@U) ) (!  (=> (= (type n$0_3@@3) RefType) (=> (and (U_2_bool (MapType2Select nodes n$0_3@@3)) (< NoPerm FullPerm)) (and (qpRange17 n$0_3@@3) (= (invRecv17 n$0_3@@3) n$0_3@@3))))
 :qid |stdinbpl.1396:28|
 :skolemid |180|
 :pattern ( (MapType0Select Heap@1 n$0_3@@3 right))
 :pattern ( (MapType1Select QPMask@10 n$0_3@@3 right))
 :pattern ( (MapType2Select nodes n$0_3@@3))
)) (forall ((o_3@@29 T@U) ) (!  (=> (= (type o_3@@29) RefType) (=> (and (U_2_bool (MapType2Select nodes (invRecv17 o_3@@29))) (and (< NoPerm FullPerm) (qpRange17 o_3@@29))) (= (invRecv17 o_3@@29) o_3@@29)))
 :qid |stdinbpl.1400:28|
 :skolemid |181|
 :pattern ( (invRecv17 o_3@@29))
))) (and (forall ((o_3@@30 T@U) ) (!  (=> (= (type o_3@@30) RefType) (and (=> (and (U_2_bool (MapType2Select nodes (invRecv17 o_3@@30))) (and (< NoPerm FullPerm) (qpRange17 o_3@@30))) (and (= (invRecv17 o_3@@30) o_3@@30) (= (U_2_real (MapType1Select QPMask@10 o_3@@30 right)) (- (U_2_real (MapType1Select QPMask@9 o_3@@30 right)) FullPerm)))) (=> (not (and (U_2_bool (MapType2Select nodes (invRecv17 o_3@@30))) (and (< NoPerm FullPerm) (qpRange17 o_3@@30)))) (= (U_2_real (MapType1Select QPMask@10 o_3@@30 right)) (U_2_real (MapType1Select QPMask@9 o_3@@30 right))))))
 :qid |stdinbpl.1406:28|
 :skolemid |182|
 :pattern ( (MapType1Select QPMask@10 o_3@@30 right))
)) (forall ((o_3@@31 T@U) (f_5@@9 T@U) ) (! (let ((B@@21 (FieldTypeInv1 (type f_5@@9))))
(let ((A@@22 (FieldTypeInv0 (type f_5@@9))))
 (=> (and (and (= (type o_3@@31) RefType) (= (type f_5@@9) (FieldType A@@22 B@@21))) (not (= f_5@@9 right))) (= (U_2_real (MapType1Select QPMask@9 o_3@@31 f_5@@9)) (U_2_real (MapType1Select QPMask@10 o_3@@31 f_5@@9))))))
 :qid |stdinbpl.1412:35|
 :skolemid |183|
 :pattern ( (MapType1Select QPMask@10 o_3@@31 f_5@@9))
)))) (and (=> (= (ControlFlow 0 84) (- 0 86)) (forall ((n$1_3 T@U) (n$1_3_1 T@U) ) (!  (=> (and (= (type n$1_3) RefType) (= (type n$1_3_1) RefType)) (=> (and (and (and (and (not (= n$1_3 n$1_3_1)) (U_2_bool (MapType2Select nodes n$1_3))) (U_2_bool (MapType2Select nodes n$1_3_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$1_3 n$1_3_1))))
 :qid |stdinbpl.1424:23|
 :skolemid |184|
 :pattern ( (neverTriggered18 n$1_3) (neverTriggered18 n$1_3_1))
))) (=> (forall ((n$1_3@@0 T@U) (n$1_3_1@@0 T@U) ) (!  (=> (and (= (type n$1_3@@0) RefType) (= (type n$1_3_1@@0) RefType)) (=> (and (and (and (and (not (= n$1_3@@0 n$1_3_1@@0)) (U_2_bool (MapType2Select nodes n$1_3@@0))) (U_2_bool (MapType2Select nodes n$1_3_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$1_3@@0 n$1_3_1@@0))))
 :qid |stdinbpl.1424:23|
 :skolemid |184|
 :pattern ( (neverTriggered18 n$1_3@@0) (neverTriggered18 n$1_3_1@@0))
)) (and (=> (= (ControlFlow 0 84) (- 0 85)) (forall ((n$1_3@@1 T@U) ) (!  (=> (and (= (type n$1_3@@1) RefType) (U_2_bool (MapType2Select nodes n$1_3@@1))) (>= (U_2_real (MapType1Select QPMask@10 n$1_3@@1 is_marked)) FullPerm))
 :qid |stdinbpl.1431:23|
 :skolemid |185|
 :pattern ( (MapType0Select Heap@1 n$1_3@@1 is_marked))
 :pattern ( (MapType1Select QPMask@11 n$1_3@@1 is_marked))
 :pattern ( (MapType2Select nodes n$1_3@@1))
))) (=> (forall ((n$1_3@@2 T@U) ) (!  (=> (and (= (type n$1_3@@2) RefType) (U_2_bool (MapType2Select nodes n$1_3@@2))) (>= (U_2_real (MapType1Select QPMask@10 n$1_3@@2 is_marked)) FullPerm))
 :qid |stdinbpl.1431:23|
 :skolemid |185|
 :pattern ( (MapType0Select Heap@1 n$1_3@@2 is_marked))
 :pattern ( (MapType1Select QPMask@11 n$1_3@@2 is_marked))
 :pattern ( (MapType2Select nodes n$1_3@@2))
)) (=> (and (and (forall ((n$1_3@@3 T@U) ) (!  (=> (= (type n$1_3@@3) RefType) (=> (and (U_2_bool (MapType2Select nodes n$1_3@@3)) (< NoPerm FullPerm)) (and (qpRange18 n$1_3@@3) (= (invRecv18 n$1_3@@3) n$1_3@@3))))
 :qid |stdinbpl.1437:28|
 :skolemid |186|
 :pattern ( (MapType0Select Heap@1 n$1_3@@3 is_marked))
 :pattern ( (MapType1Select QPMask@11 n$1_3@@3 is_marked))
 :pattern ( (MapType2Select nodes n$1_3@@3))
)) (forall ((o_3@@32 T@U) ) (!  (=> (= (type o_3@@32) RefType) (=> (and (U_2_bool (MapType2Select nodes (invRecv18 o_3@@32))) (and (< NoPerm FullPerm) (qpRange18 o_3@@32))) (= (invRecv18 o_3@@32) o_3@@32)))
 :qid |stdinbpl.1441:28|
 :skolemid |187|
 :pattern ( (invRecv18 o_3@@32))
))) (and (forall ((o_3@@33 T@U) ) (!  (=> (= (type o_3@@33) RefType) (and (=> (and (U_2_bool (MapType2Select nodes (invRecv18 o_3@@33))) (and (< NoPerm FullPerm) (qpRange18 o_3@@33))) (and (= (invRecv18 o_3@@33) o_3@@33) (= (U_2_real (MapType1Select QPMask@11 o_3@@33 is_marked)) (- (U_2_real (MapType1Select QPMask@10 o_3@@33 is_marked)) FullPerm)))) (=> (not (and (U_2_bool (MapType2Select nodes (invRecv18 o_3@@33))) (and (< NoPerm FullPerm) (qpRange18 o_3@@33)))) (= (U_2_real (MapType1Select QPMask@11 o_3@@33 is_marked)) (U_2_real (MapType1Select QPMask@10 o_3@@33 is_marked))))))
 :qid |stdinbpl.1447:28|
 :skolemid |188|
 :pattern ( (MapType1Select QPMask@11 o_3@@33 is_marked))
)) (forall ((o_3@@34 T@U) (f_5@@10 T@U) ) (! (let ((B@@22 (FieldTypeInv1 (type f_5@@10))))
(let ((A@@23 (FieldTypeInv0 (type f_5@@10))))
 (=> (and (and (= (type o_3@@34) RefType) (= (type f_5@@10) (FieldType A@@23 B@@22))) (not (= f_5@@10 is_marked))) (= (U_2_real (MapType1Select QPMask@10 o_3@@34 f_5@@10)) (U_2_real (MapType1Select QPMask@11 o_3@@34 f_5@@10))))))
 :qid |stdinbpl.1453:35|
 :skolemid |189|
 :pattern ( (MapType1Select QPMask@11 o_3@@34 f_5@@10))
)))) (and (and (=> (= (ControlFlow 0 84) 83) anon167_Else_correct) (=> (= (ControlFlow 0 84) 71) anon168_Then_correct)) (=> (= (ControlFlow 0 84) 73) anon168_Else_correct)))))))))))))))))))))))))))
(let ((anon166_Else_correct  (=> (and (and (not (and (not (= (MapType0Select Heap@1 node right) null)) (not (U_2_bool (MapType0Select Heap@1 (MapType0Select Heap@1 node right) is_marked))))) (= Heap@2 Heap@1)) (and (= Mask@1 Mask@0) (= (ControlFlow 0 69) 60))) anon91_correct)))
(let ((anon165_Else_correct  (=> (= (MapType0Select Heap@1 node right) null) (and (=> (= (ControlFlow 0 97) 84) anon166_Then_correct) (=> (= (ControlFlow 0 97) 69) anon166_Else_correct)))))
(let ((anon165_Then_correct  (=> (not (= (MapType0Select Heap@1 node right) null)) (and (=> (= (ControlFlow 0 94) (- 0 96)) (HasDirectPerm Mask@0 node right)) (=> (HasDirectPerm Mask@0 node right) (and (=> (= (ControlFlow 0 94) (- 0 95)) (HasDirectPerm Mask@0 (MapType0Select Heap@1 node right) is_marked)) (=> (HasDirectPerm Mask@0 (MapType0Select Heap@1 node right) is_marked) (and (=> (= (ControlFlow 0 94) 84) anon166_Then_correct) (=> (= (ControlFlow 0 94) 69) anon166_Else_correct)))))))))
(let ((anon79_correct  (=> (state Heap@1 Mask@0) (and (=> (= (ControlFlow 0 98) (- 0 99)) (HasDirectPerm Mask@0 node right)) (=> (HasDirectPerm Mask@0 node right) (and (=> (= (ControlFlow 0 98) 94) anon165_Then_correct) (=> (= (ControlFlow 0 98) 97) anon165_Else_correct)))))))
(let ((anon163_Else_correct  (=> (forall ((n$3_3_1 T@U) ) (!  (=> (= (type n$3_3_1) RefType) (=> (and (U_2_bool (MapType2Select nodes n$3_3_1)) (not (= (MapType0Select Heap@0 n$3_3_1 right) null))) (U_2_bool (MapType2Select nodes (MapType0Select Heap@0 n$3_3_1 right)))))
 :qid |stdinbpl.1156:26|
 :skolemid |146|
 :pattern ( (MapType2Select nodes (MapType0Select Heap@0 n$3_3_1 right)))
 :pattern ( (MapType2Select nodes n$3_3_1) (MapType0Select Heap@0 n$3_3_1 right))
)) (and (=> (= (ControlFlow 0 105) (- 0 109)) (not (U_2_bool (MapType0Select Heap@0 arg_node@0 is_marked)))) (=> (not (U_2_bool (MapType0Select Heap@0 arg_node@0 is_marked))) (=> (IdenticalOnKnownLocations Heap@0 ExhaleHeap@0 QPMask@5) (=> (and (U_2_bool (MapType2Select nodes arg_node@0)) (not (U_2_bool (MapType2Select nodes null)))) (and (=> (= (ControlFlow 0 105) (- 0 108)) (forall ((n$4_3 T@U) (n$4_3_1 T@U) ) (!  (=> (and (= (type n$4_3) RefType) (= (type n$4_3_1) RefType)) (=> (and (and (and (and (not (= n$4_3 n$4_3_1)) (U_2_bool (MapType2Select nodes n$4_3))) (U_2_bool (MapType2Select nodes n$4_3_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$4_3 n$4_3_1))))
 :qid |stdinbpl.1172:21|
 :skolemid |147|
 :no-pattern (type n$4_3)
 :no-pattern (type n$4_3_1)
 :no-pattern (U_2_int n$4_3)
 :no-pattern (U_2_bool n$4_3)
 :no-pattern (U_2_int n$4_3_1)
 :no-pattern (U_2_bool n$4_3_1)
))) (=> (forall ((n$4_3@@0 T@U) (n$4_3_1@@0 T@U) ) (!  (=> (and (= (type n$4_3@@0) RefType) (= (type n$4_3_1@@0) RefType)) (=> (and (and (and (and (not (= n$4_3@@0 n$4_3_1@@0)) (U_2_bool (MapType2Select nodes n$4_3@@0))) (U_2_bool (MapType2Select nodes n$4_3_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$4_3@@0 n$4_3_1@@0))))
 :qid |stdinbpl.1172:21|
 :skolemid |147|
 :no-pattern (type n$4_3@@0)
 :no-pattern (type n$4_3_1@@0)
 :no-pattern (U_2_int n$4_3@@0)
 :no-pattern (U_2_bool n$4_3@@0)
 :no-pattern (U_2_int n$4_3_1@@0)
 :no-pattern (U_2_bool n$4_3_1@@0)
)) (=> (and (forall ((n$4_3@@1 T@U) ) (!  (=> (= (type n$4_3@@1) RefType) (=> (and (U_2_bool (MapType2Select nodes n$4_3@@1)) (< NoPerm FullPerm)) (and (qpRange13 n$4_3@@1) (= (invRecv13 n$4_3@@1) n$4_3@@1))))
 :qid |stdinbpl.1178:28|
 :skolemid |148|
 :pattern ( (MapType0Select ExhaleHeap@0 n$4_3@@1 left))
 :pattern ( (MapType1Select QPMask@6 n$4_3@@1 left))
 :pattern ( (MapType2Select nodes n$4_3@@1))
)) (forall ((o_3@@35 T@U) ) (!  (=> (= (type o_3@@35) RefType) (=> (and (and (U_2_bool (MapType2Select nodes (invRecv13 o_3@@35))) (< NoPerm FullPerm)) (qpRange13 o_3@@35)) (= (invRecv13 o_3@@35) o_3@@35)))
 :qid |stdinbpl.1182:28|
 :skolemid |149|
 :pattern ( (invRecv13 o_3@@35))
))) (=> (and (and (forall ((n$4_3@@2 T@U) ) (!  (=> (and (= (type n$4_3@@2) RefType) (U_2_bool (MapType2Select nodes n$4_3@@2))) (not (= n$4_3@@2 null)))
 :qid |stdinbpl.1188:28|
 :skolemid |150|
 :pattern ( (MapType0Select ExhaleHeap@0 n$4_3@@2 left))
 :pattern ( (MapType1Select QPMask@6 n$4_3@@2 left))
 :pattern ( (MapType2Select nodes n$4_3@@2))
)) (forall ((o_3@@36 T@U) ) (!  (=> (= (type o_3@@36) RefType) (and (=> (and (and (U_2_bool (MapType2Select nodes (invRecv13 o_3@@36))) (< NoPerm FullPerm)) (qpRange13 o_3@@36)) (and (=> (< NoPerm FullPerm) (= (invRecv13 o_3@@36) o_3@@36)) (= (U_2_real (MapType1Select QPMask@6 o_3@@36 left)) (+ (U_2_real (MapType1Select QPMask@5 o_3@@36 left)) FullPerm)))) (=> (not (and (and (U_2_bool (MapType2Select nodes (invRecv13 o_3@@36))) (< NoPerm FullPerm)) (qpRange13 o_3@@36))) (= (U_2_real (MapType1Select QPMask@6 o_3@@36 left)) (U_2_real (MapType1Select QPMask@5 o_3@@36 left))))))
 :qid |stdinbpl.1194:28|
 :skolemid |151|
 :pattern ( (MapType1Select QPMask@6 o_3@@36 left))
))) (and (forall ((o_3@@37 T@U) (f_5@@11 T@U) ) (! (let ((B@@23 (FieldTypeInv1 (type f_5@@11))))
(let ((A@@24 (FieldTypeInv0 (type f_5@@11))))
 (=> (and (and (= (type o_3@@37) RefType) (= (type f_5@@11) (FieldType A@@24 B@@23))) (not (= f_5@@11 left))) (= (U_2_real (MapType1Select QPMask@5 o_3@@37 f_5@@11)) (U_2_real (MapType1Select QPMask@6 o_3@@37 f_5@@11))))))
 :qid |stdinbpl.1198:35|
 :skolemid |152|
 :pattern ( (MapType1Select QPMask@5 o_3@@37 f_5@@11))
 :pattern ( (MapType1Select QPMask@6 o_3@@37 f_5@@11))
)) (state ExhaleHeap@0 QPMask@6))) (and (=> (= (ControlFlow 0 105) (- 0 107)) (forall ((n$5_3 T@U) (n$5_3_1 T@U) ) (!  (=> (and (= (type n$5_3) RefType) (= (type n$5_3_1) RefType)) (=> (and (and (and (and (not (= n$5_3 n$5_3_1)) (U_2_bool (MapType2Select nodes n$5_3))) (U_2_bool (MapType2Select nodes n$5_3_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$5_3 n$5_3_1))))
 :qid |stdinbpl.1206:21|
 :skolemid |153|
 :no-pattern (type n$5_3)
 :no-pattern (type n$5_3_1)
 :no-pattern (U_2_int n$5_3)
 :no-pattern (U_2_bool n$5_3)
 :no-pattern (U_2_int n$5_3_1)
 :no-pattern (U_2_bool n$5_3_1)
))) (=> (forall ((n$5_3@@0 T@U) (n$5_3_1@@0 T@U) ) (!  (=> (and (= (type n$5_3@@0) RefType) (= (type n$5_3_1@@0) RefType)) (=> (and (and (and (and (not (= n$5_3@@0 n$5_3_1@@0)) (U_2_bool (MapType2Select nodes n$5_3@@0))) (U_2_bool (MapType2Select nodes n$5_3_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$5_3@@0 n$5_3_1@@0))))
 :qid |stdinbpl.1206:21|
 :skolemid |153|
 :no-pattern (type n$5_3@@0)
 :no-pattern (type n$5_3_1@@0)
 :no-pattern (U_2_int n$5_3@@0)
 :no-pattern (U_2_bool n$5_3@@0)
 :no-pattern (U_2_int n$5_3_1@@0)
 :no-pattern (U_2_bool n$5_3_1@@0)
)) (=> (and (forall ((n$5_3@@1 T@U) ) (!  (=> (= (type n$5_3@@1) RefType) (=> (and (U_2_bool (MapType2Select nodes n$5_3@@1)) (< NoPerm FullPerm)) (and (qpRange14 n$5_3@@1) (= (invRecv14 n$5_3@@1) n$5_3@@1))))
 :qid |stdinbpl.1212:28|
 :skolemid |154|
 :pattern ( (MapType0Select ExhaleHeap@0 n$5_3@@1 right))
 :pattern ( (MapType1Select QPMask@7 n$5_3@@1 right))
 :pattern ( (MapType2Select nodes n$5_3@@1))
)) (forall ((o_3@@38 T@U) ) (!  (=> (= (type o_3@@38) RefType) (=> (and (and (U_2_bool (MapType2Select nodes (invRecv14 o_3@@38))) (< NoPerm FullPerm)) (qpRange14 o_3@@38)) (= (invRecv14 o_3@@38) o_3@@38)))
 :qid |stdinbpl.1216:28|
 :skolemid |155|
 :pattern ( (invRecv14 o_3@@38))
))) (=> (and (and (forall ((n$5_3@@2 T@U) ) (!  (=> (and (= (type n$5_3@@2) RefType) (U_2_bool (MapType2Select nodes n$5_3@@2))) (not (= n$5_3@@2 null)))
 :qid |stdinbpl.1222:28|
 :skolemid |156|
 :pattern ( (MapType0Select ExhaleHeap@0 n$5_3@@2 right))
 :pattern ( (MapType1Select QPMask@7 n$5_3@@2 right))
 :pattern ( (MapType2Select nodes n$5_3@@2))
)) (forall ((o_3@@39 T@U) ) (!  (=> (= (type o_3@@39) RefType) (and (=> (and (and (U_2_bool (MapType2Select nodes (invRecv14 o_3@@39))) (< NoPerm FullPerm)) (qpRange14 o_3@@39)) (and (=> (< NoPerm FullPerm) (= (invRecv14 o_3@@39) o_3@@39)) (= (U_2_real (MapType1Select QPMask@7 o_3@@39 right)) (+ (U_2_real (MapType1Select QPMask@6 o_3@@39 right)) FullPerm)))) (=> (not (and (and (U_2_bool (MapType2Select nodes (invRecv14 o_3@@39))) (< NoPerm FullPerm)) (qpRange14 o_3@@39))) (= (U_2_real (MapType1Select QPMask@7 o_3@@39 right)) (U_2_real (MapType1Select QPMask@6 o_3@@39 right))))))
 :qid |stdinbpl.1228:28|
 :skolemid |157|
 :pattern ( (MapType1Select QPMask@7 o_3@@39 right))
))) (and (forall ((o_3@@40 T@U) (f_5@@12 T@U) ) (! (let ((B@@24 (FieldTypeInv1 (type f_5@@12))))
(let ((A@@25 (FieldTypeInv0 (type f_5@@12))))
 (=> (and (and (= (type o_3@@40) RefType) (= (type f_5@@12) (FieldType A@@25 B@@24))) (not (= f_5@@12 right))) (= (U_2_real (MapType1Select QPMask@6 o_3@@40 f_5@@12)) (U_2_real (MapType1Select QPMask@7 o_3@@40 f_5@@12))))))
 :qid |stdinbpl.1232:35|
 :skolemid |158|
 :pattern ( (MapType1Select QPMask@6 o_3@@40 f_5@@12))
 :pattern ( (MapType1Select QPMask@7 o_3@@40 f_5@@12))
)) (state ExhaleHeap@0 QPMask@7))) (and (=> (= (ControlFlow 0 105) (- 0 106)) (forall ((n$6_3 T@U) (n$6_3_1 T@U) ) (!  (=> (and (= (type n$6_3) RefType) (= (type n$6_3_1) RefType)) (=> (and (and (and (and (not (= n$6_3 n$6_3_1)) (U_2_bool (MapType2Select nodes n$6_3))) (U_2_bool (MapType2Select nodes n$6_3_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$6_3 n$6_3_1))))
 :qid |stdinbpl.1240:21|
 :skolemid |159|
 :no-pattern (type n$6_3)
 :no-pattern (type n$6_3_1)
 :no-pattern (U_2_int n$6_3)
 :no-pattern (U_2_bool n$6_3)
 :no-pattern (U_2_int n$6_3_1)
 :no-pattern (U_2_bool n$6_3_1)
))) (=> (forall ((n$6_3@@0 T@U) (n$6_3_1@@0 T@U) ) (!  (=> (and (= (type n$6_3@@0) RefType) (= (type n$6_3_1@@0) RefType)) (=> (and (and (and (and (not (= n$6_3@@0 n$6_3_1@@0)) (U_2_bool (MapType2Select nodes n$6_3@@0))) (U_2_bool (MapType2Select nodes n$6_3_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$6_3@@0 n$6_3_1@@0))))
 :qid |stdinbpl.1240:21|
 :skolemid |159|
 :no-pattern (type n$6_3@@0)
 :no-pattern (type n$6_3_1@@0)
 :no-pattern (U_2_int n$6_3@@0)
 :no-pattern (U_2_bool n$6_3@@0)
 :no-pattern (U_2_int n$6_3_1@@0)
 :no-pattern (U_2_bool n$6_3_1@@0)
)) (=> (forall ((n$6_3@@1 T@U) ) (!  (=> (= (type n$6_3@@1) RefType) (=> (and (U_2_bool (MapType2Select nodes n$6_3@@1)) (< NoPerm FullPerm)) (and (qpRange15 n$6_3@@1) (= (invRecv15 n$6_3@@1) n$6_3@@1))))
 :qid |stdinbpl.1246:28|
 :skolemid |160|
 :pattern ( (MapType0Select ExhaleHeap@0 n$6_3@@1 is_marked))
 :pattern ( (MapType1Select QPMask@8 n$6_3@@1 is_marked))
 :pattern ( (MapType2Select nodes n$6_3@@1))
)) (=> (and (forall ((o_3@@41 T@U) ) (!  (=> (= (type o_3@@41) RefType) (=> (and (and (U_2_bool (MapType2Select nodes (invRecv15 o_3@@41))) (< NoPerm FullPerm)) (qpRange15 o_3@@41)) (= (invRecv15 o_3@@41) o_3@@41)))
 :qid |stdinbpl.1250:28|
 :skolemid |161|
 :pattern ( (invRecv15 o_3@@41))
)) (forall ((n$6_3@@2 T@U) ) (!  (=> (and (= (type n$6_3@@2) RefType) (U_2_bool (MapType2Select nodes n$6_3@@2))) (not (= n$6_3@@2 null)))
 :qid |stdinbpl.1256:28|
 :skolemid |162|
 :pattern ( (MapType0Select ExhaleHeap@0 n$6_3@@2 is_marked))
 :pattern ( (MapType1Select QPMask@8 n$6_3@@2 is_marked))
 :pattern ( (MapType2Select nodes n$6_3@@2))
))) (=> (and (and (and (and (forall ((o_3@@42 T@U) ) (!  (=> (= (type o_3@@42) RefType) (and (=> (and (and (U_2_bool (MapType2Select nodes (invRecv15 o_3@@42))) (< NoPerm FullPerm)) (qpRange15 o_3@@42)) (and (=> (< NoPerm FullPerm) (= (invRecv15 o_3@@42) o_3@@42)) (= (U_2_real (MapType1Select QPMask@8 o_3@@42 is_marked)) (+ (U_2_real (MapType1Select QPMask@7 o_3@@42 is_marked)) FullPerm)))) (=> (not (and (and (U_2_bool (MapType2Select nodes (invRecv15 o_3@@42))) (< NoPerm FullPerm)) (qpRange15 o_3@@42))) (= (U_2_real (MapType1Select QPMask@8 o_3@@42 is_marked)) (U_2_real (MapType1Select QPMask@7 o_3@@42 is_marked))))))
 :qid |stdinbpl.1262:28|
 :skolemid |163|
 :pattern ( (MapType1Select QPMask@8 o_3@@42 is_marked))
)) (forall ((o_3@@43 T@U) (f_5@@13 T@U) ) (! (let ((B@@25 (FieldTypeInv1 (type f_5@@13))))
(let ((A@@26 (FieldTypeInv0 (type f_5@@13))))
 (=> (and (and (= (type o_3@@43) RefType) (= (type f_5@@13) (FieldType A@@26 B@@25))) (not (= f_5@@13 is_marked))) (= (U_2_real (MapType1Select QPMask@7 o_3@@43 f_5@@13)) (U_2_real (MapType1Select QPMask@8 o_3@@43 f_5@@13))))))
 :qid |stdinbpl.1266:35|
 :skolemid |164|
 :pattern ( (MapType1Select QPMask@7 o_3@@43 f_5@@13))
 :pattern ( (MapType1Select QPMask@8 o_3@@43 f_5@@13))
))) (and (state ExhaleHeap@0 QPMask@8) (forall ((n$7_4 T@U) ) (!  (=> (= (type n$7_4) RefType) (=> (and (U_2_bool (MapType2Select nodes n$7_4)) (not (= (MapType0Select ExhaleHeap@0 n$7_4 left) null))) (U_2_bool (MapType2Select nodes (MapType0Select ExhaleHeap@0 n$7_4 left)))))
 :qid |stdinbpl.1272:26|
 :skolemid |165|
 :pattern ( (MapType2Select nodes (MapType0Select ExhaleHeap@0 n$7_4 left)))
 :pattern ( (MapType2Select nodes n$7_4) (MapType0Select ExhaleHeap@0 n$7_4 left))
)))) (and (and (forall ((n$8_4 T@U) ) (!  (=> (= (type n$8_4) RefType) (=> (and (U_2_bool (MapType2Select nodes n$8_4)) (not (= (MapType0Select ExhaleHeap@0 n$8_4 right) null))) (U_2_bool (MapType2Select nodes (MapType0Select ExhaleHeap@0 n$8_4 right)))))
 :qid |stdinbpl.1276:26|
 :skolemid |166|
 :pattern ( (MapType2Select nodes (MapType0Select ExhaleHeap@0 n$8_4 right)))
 :pattern ( (MapType2Select nodes n$8_4) (MapType0Select ExhaleHeap@0 n$8_4 right))
)) (forall ((n_23 T@U) ) (!  (=> (and (and (= (type n_23) RefType) (U_2_bool (MapType2Select nodes n_23))) (U_2_bool (MapType0Select Heap@0 n_23 is_marked))) (U_2_bool (MapType0Select ExhaleHeap@0 n_23 is_marked)))
 :qid |stdinbpl.1280:26|
 :skolemid |167|
 :pattern ( (MapType2Select nodes n_23) (MapType0Select ExhaleHeap@0 n_23 is_marked))
))) (and (U_2_bool (MapType0Select ExhaleHeap@0 arg_node@0 is_marked)) (forall ((n_24 T@U) ) (!  (=> (and (= (type n_24) RefType) (U_2_bool (MapType2Select nodes n_24))) (= (MapType0Select ExhaleHeap@0 n_24 left) (MapType0Select Heap@0 n_24 left)))
 :qid |stdinbpl.1285:26|
 :skolemid |168|
 :pattern ( (MapType2Select nodes n_24) (MapType0Select ExhaleHeap@0 n_24 left))
))))) (and (and (and (forall ((n_25 T@U) ) (!  (=> (and (= (type n_25) RefType) (U_2_bool (MapType2Select nodes n_25))) (= (MapType0Select ExhaleHeap@0 n_25 right) (MapType0Select Heap@0 n_25 right)))
 :qid |stdinbpl.1289:26|
 :skolemid |169|
 :pattern ( (MapType2Select nodes n_25) (MapType0Select ExhaleHeap@0 n_25 right))
)) (forall ((n_26 T@U) ) (!  (=> (and (and (= (type n_26) RefType) (U_2_bool (MapType2Select nodes n_26))) (and (not (U_2_bool (MapType0Select Heap@0 n_26 is_marked))) (U_2_bool (MapType0Select ExhaleHeap@0 n_26 is_marked)))) (or (= (MapType0Select ExhaleHeap@0 n_26 left) null) (U_2_bool (MapType0Select ExhaleHeap@0 (MapType0Select ExhaleHeap@0 n_26 left) is_marked))))
 :qid |stdinbpl.1293:26|
 :skolemid |170|
 :pattern ( (MapType2Select nodes n_26) (MapType0Select ExhaleHeap@0 n_26 is_marked))
 :pattern ( (MapType2Select nodes n_26) (MapType0Select ExhaleHeap@0 (MapType0Select ExhaleHeap@0 n_26 left) is_marked))
))) (and (forall ((n_27 T@U) ) (!  (=> (and (and (= (type n_27) RefType) (U_2_bool (MapType2Select nodes n_27))) (and (not (U_2_bool (MapType0Select Heap@0 n_27 is_marked))) (U_2_bool (MapType0Select ExhaleHeap@0 n_27 is_marked)))) (or (= (MapType0Select ExhaleHeap@0 n_27 right) null) (U_2_bool (MapType0Select ExhaleHeap@0 (MapType0Select ExhaleHeap@0 n_27 right) is_marked))))
 :qid |stdinbpl.1297:26|
 :skolemid |171|
 :pattern ( (MapType2Select nodes n_27) (MapType0Select ExhaleHeap@0 n_27 is_marked))
 :pattern ( (MapType2Select nodes n_27) (MapType0Select ExhaleHeap@0 (MapType0Select ExhaleHeap@0 n_27 right) is_marked))
)) (state ExhaleHeap@0 QPMask@8))) (and (and (state ExhaleHeap@0 QPMask@8) (= Mask@0 QPMask@8)) (and (= Heap@1 ExhaleHeap@0) (= (ControlFlow 0 105) 98))))) anon79_correct))))))))))))))))))))
(let ((anon161_Else_correct  (=> (forall ((n$2_3_1 T@U) ) (!  (=> (= (type n$2_3_1) RefType) (=> (and (U_2_bool (MapType2Select nodes n$2_3_1)) (not (= (MapType0Select Heap@0 n$2_3_1 left) null))) (U_2_bool (MapType2Select nodes (MapType0Select Heap@0 n$2_3_1 left)))))
 :qid |stdinbpl.1145:26|
 :skolemid |145|
 :pattern ( (MapType2Select nodes (MapType0Select Heap@0 n$2_3_1 left)))
 :pattern ( (MapType2Select nodes n$2_3_1) (MapType0Select Heap@0 n$2_3_1 left))
)) (and (and (=> (= (ControlFlow 0 114) 105) anon163_Else_correct) (=> (= (ControlFlow 0 114) 111) anon164_Then_correct)) (=> (= (ControlFlow 0 114) 113) anon164_Else_correct)))))
(let ((anon160_Then_correct  (=> (and (not (= (MapType0Select Heap@0 node left) null)) (not (U_2_bool (MapType0Select Heap@0 (MapType0Select Heap@0 node left) is_marked)))) (and (=> (= (ControlFlow 0 115) (- 0 124)) (HasDirectPerm QPMask@2 node left)) (=> (HasDirectPerm QPMask@2 node left) (=> (= arg_node@0 (MapType0Select Heap@0 node left)) (and (=> (= (ControlFlow 0 115) (- 0 123)) (U_2_bool (MapType2Select nodes arg_node@0))) (=> (U_2_bool (MapType2Select nodes arg_node@0)) (and (=> (= (ControlFlow 0 115) (- 0 122)) (not (U_2_bool (MapType2Select nodes null)))) (=> (not (U_2_bool (MapType2Select nodes null))) (and (=> (= (ControlFlow 0 115) (- 0 121)) (forall ((n_22 T@U) (n_22_1 T@U) ) (!  (=> (and (= (type n_22) RefType) (= (type n_22_1) RefType)) (=> (and (and (and (and (not (= n_22 n_22_1)) (U_2_bool (MapType2Select nodes n_22))) (U_2_bool (MapType2Select nodes n_22_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_22 n_22_1))))
 :qid |stdinbpl.1022:23|
 :skolemid |127|
 :pattern ( (neverTriggered10 n_22) (neverTriggered10 n_22_1))
))) (=> (forall ((n_22@@0 T@U) (n_22_1@@0 T@U) ) (!  (=> (and (= (type n_22@@0) RefType) (= (type n_22_1@@0) RefType)) (=> (and (and (and (and (not (= n_22@@0 n_22_1@@0)) (U_2_bool (MapType2Select nodes n_22@@0))) (U_2_bool (MapType2Select nodes n_22_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_22@@0 n_22_1@@0))))
 :qid |stdinbpl.1022:23|
 :skolemid |127|
 :pattern ( (neverTriggered10 n_22@@0) (neverTriggered10 n_22_1@@0))
)) (and (=> (= (ControlFlow 0 115) (- 0 120)) (forall ((n_22@@1 T@U) ) (!  (=> (and (= (type n_22@@1) RefType) (U_2_bool (MapType2Select nodes n_22@@1))) (>= (U_2_real (MapType1Select QPMask@2 n_22@@1 left)) FullPerm))
 :qid |stdinbpl.1029:23|
 :skolemid |128|
 :pattern ( (MapType0Select Heap@0 n_22@@1 left))
 :pattern ( (MapType1Select QPMask@3 n_22@@1 left))
 :pattern ( (MapType2Select nodes n_22@@1))
))) (=> (forall ((n_22@@2 T@U) ) (!  (=> (and (= (type n_22@@2) RefType) (U_2_bool (MapType2Select nodes n_22@@2))) (>= (U_2_real (MapType1Select QPMask@2 n_22@@2 left)) FullPerm))
 :qid |stdinbpl.1029:23|
 :skolemid |128|
 :pattern ( (MapType0Select Heap@0 n_22@@2 left))
 :pattern ( (MapType1Select QPMask@3 n_22@@2 left))
 :pattern ( (MapType2Select nodes n_22@@2))
)) (=> (and (and (forall ((n_22@@3 T@U) ) (!  (=> (= (type n_22@@3) RefType) (=> (and (U_2_bool (MapType2Select nodes n_22@@3)) (< NoPerm FullPerm)) (and (qpRange10 n_22@@3) (= (invRecv10 n_22@@3) n_22@@3))))
 :qid |stdinbpl.1035:28|
 :skolemid |129|
 :pattern ( (MapType0Select Heap@0 n_22@@3 left))
 :pattern ( (MapType1Select QPMask@3 n_22@@3 left))
 :pattern ( (MapType2Select nodes n_22@@3))
)) (forall ((o_3@@44 T@U) ) (!  (=> (= (type o_3@@44) RefType) (=> (and (U_2_bool (MapType2Select nodes (invRecv10 o_3@@44))) (and (< NoPerm FullPerm) (qpRange10 o_3@@44))) (= (invRecv10 o_3@@44) o_3@@44)))
 :qid |stdinbpl.1039:28|
 :skolemid |130|
 :pattern ( (invRecv10 o_3@@44))
))) (and (forall ((o_3@@45 T@U) ) (!  (=> (= (type o_3@@45) RefType) (and (=> (and (U_2_bool (MapType2Select nodes (invRecv10 o_3@@45))) (and (< NoPerm FullPerm) (qpRange10 o_3@@45))) (and (= (invRecv10 o_3@@45) o_3@@45) (= (U_2_real (MapType1Select QPMask@3 o_3@@45 left)) (- (U_2_real (MapType1Select QPMask@2 o_3@@45 left)) FullPerm)))) (=> (not (and (U_2_bool (MapType2Select nodes (invRecv10 o_3@@45))) (and (< NoPerm FullPerm) (qpRange10 o_3@@45)))) (= (U_2_real (MapType1Select QPMask@3 o_3@@45 left)) (U_2_real (MapType1Select QPMask@2 o_3@@45 left))))))
 :qid |stdinbpl.1045:28|
 :skolemid |131|
 :pattern ( (MapType1Select QPMask@3 o_3@@45 left))
)) (forall ((o_3@@46 T@U) (f_5@@14 T@U) ) (! (let ((B@@26 (FieldTypeInv1 (type f_5@@14))))
(let ((A@@27 (FieldTypeInv0 (type f_5@@14))))
 (=> (and (and (= (type o_3@@46) RefType) (= (type f_5@@14) (FieldType A@@27 B@@26))) (not (= f_5@@14 left))) (= (U_2_real (MapType1Select QPMask@2 o_3@@46 f_5@@14)) (U_2_real (MapType1Select QPMask@3 o_3@@46 f_5@@14))))))
 :qid |stdinbpl.1051:35|
 :skolemid |132|
 :pattern ( (MapType1Select QPMask@3 o_3@@46 f_5@@14))
)))) (and (=> (= (ControlFlow 0 115) (- 0 119)) (forall ((n$0_2 T@U) (n$0_2_1 T@U) ) (!  (=> (and (= (type n$0_2) RefType) (= (type n$0_2_1) RefType)) (=> (and (and (and (and (not (= n$0_2 n$0_2_1)) (U_2_bool (MapType2Select nodes n$0_2))) (U_2_bool (MapType2Select nodes n$0_2_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$0_2 n$0_2_1))))
 :qid |stdinbpl.1063:23|
 :skolemid |133|
 :pattern ( (neverTriggered11 n$0_2) (neverTriggered11 n$0_2_1))
))) (=> (forall ((n$0_2@@0 T@U) (n$0_2_1@@0 T@U) ) (!  (=> (and (= (type n$0_2@@0) RefType) (= (type n$0_2_1@@0) RefType)) (=> (and (and (and (and (not (= n$0_2@@0 n$0_2_1@@0)) (U_2_bool (MapType2Select nodes n$0_2@@0))) (U_2_bool (MapType2Select nodes n$0_2_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$0_2@@0 n$0_2_1@@0))))
 :qid |stdinbpl.1063:23|
 :skolemid |133|
 :pattern ( (neverTriggered11 n$0_2@@0) (neverTriggered11 n$0_2_1@@0))
)) (and (=> (= (ControlFlow 0 115) (- 0 118)) (forall ((n$0_2@@1 T@U) ) (!  (=> (and (= (type n$0_2@@1) RefType) (U_2_bool (MapType2Select nodes n$0_2@@1))) (>= (U_2_real (MapType1Select QPMask@3 n$0_2@@1 right)) FullPerm))
 :qid |stdinbpl.1070:23|
 :skolemid |134|
 :pattern ( (MapType0Select Heap@0 n$0_2@@1 right))
 :pattern ( (MapType1Select QPMask@4 n$0_2@@1 right))
 :pattern ( (MapType2Select nodes n$0_2@@1))
))) (=> (forall ((n$0_2@@2 T@U) ) (!  (=> (and (= (type n$0_2@@2) RefType) (U_2_bool (MapType2Select nodes n$0_2@@2))) (>= (U_2_real (MapType1Select QPMask@3 n$0_2@@2 right)) FullPerm))
 :qid |stdinbpl.1070:23|
 :skolemid |134|
 :pattern ( (MapType0Select Heap@0 n$0_2@@2 right))
 :pattern ( (MapType1Select QPMask@4 n$0_2@@2 right))
 :pattern ( (MapType2Select nodes n$0_2@@2))
)) (=> (and (and (forall ((n$0_2@@3 T@U) ) (!  (=> (= (type n$0_2@@3) RefType) (=> (and (U_2_bool (MapType2Select nodes n$0_2@@3)) (< NoPerm FullPerm)) (and (qpRange11 n$0_2@@3) (= (invRecv11 n$0_2@@3) n$0_2@@3))))
 :qid |stdinbpl.1076:28|
 :skolemid |135|
 :pattern ( (MapType0Select Heap@0 n$0_2@@3 right))
 :pattern ( (MapType1Select QPMask@4 n$0_2@@3 right))
 :pattern ( (MapType2Select nodes n$0_2@@3))
)) (forall ((o_3@@47 T@U) ) (!  (=> (= (type o_3@@47) RefType) (=> (and (U_2_bool (MapType2Select nodes (invRecv11 o_3@@47))) (and (< NoPerm FullPerm) (qpRange11 o_3@@47))) (= (invRecv11 o_3@@47) o_3@@47)))
 :qid |stdinbpl.1080:28|
 :skolemid |136|
 :pattern ( (invRecv11 o_3@@47))
))) (and (forall ((o_3@@48 T@U) ) (!  (=> (= (type o_3@@48) RefType) (and (=> (and (U_2_bool (MapType2Select nodes (invRecv11 o_3@@48))) (and (< NoPerm FullPerm) (qpRange11 o_3@@48))) (and (= (invRecv11 o_3@@48) o_3@@48) (= (U_2_real (MapType1Select QPMask@4 o_3@@48 right)) (- (U_2_real (MapType1Select QPMask@3 o_3@@48 right)) FullPerm)))) (=> (not (and (U_2_bool (MapType2Select nodes (invRecv11 o_3@@48))) (and (< NoPerm FullPerm) (qpRange11 o_3@@48)))) (= (U_2_real (MapType1Select QPMask@4 o_3@@48 right)) (U_2_real (MapType1Select QPMask@3 o_3@@48 right))))))
 :qid |stdinbpl.1086:28|
 :skolemid |137|
 :pattern ( (MapType1Select QPMask@4 o_3@@48 right))
)) (forall ((o_3@@49 T@U) (f_5@@15 T@U) ) (! (let ((B@@27 (FieldTypeInv1 (type f_5@@15))))
(let ((A@@28 (FieldTypeInv0 (type f_5@@15))))
 (=> (and (and (= (type o_3@@49) RefType) (= (type f_5@@15) (FieldType A@@28 B@@27))) (not (= f_5@@15 right))) (= (U_2_real (MapType1Select QPMask@3 o_3@@49 f_5@@15)) (U_2_real (MapType1Select QPMask@4 o_3@@49 f_5@@15))))))
 :qid |stdinbpl.1092:35|
 :skolemid |138|
 :pattern ( (MapType1Select QPMask@4 o_3@@49 f_5@@15))
)))) (and (=> (= (ControlFlow 0 115) (- 0 117)) (forall ((n$1_2 T@U) (n$1_2_1 T@U) ) (!  (=> (and (= (type n$1_2) RefType) (= (type n$1_2_1) RefType)) (=> (and (and (and (and (not (= n$1_2 n$1_2_1)) (U_2_bool (MapType2Select nodes n$1_2))) (U_2_bool (MapType2Select nodes n$1_2_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$1_2 n$1_2_1))))
 :qid |stdinbpl.1104:23|
 :skolemid |139|
 :pattern ( (neverTriggered12 n$1_2) (neverTriggered12 n$1_2_1))
))) (=> (forall ((n$1_2@@0 T@U) (n$1_2_1@@0 T@U) ) (!  (=> (and (= (type n$1_2@@0) RefType) (= (type n$1_2_1@@0) RefType)) (=> (and (and (and (and (not (= n$1_2@@0 n$1_2_1@@0)) (U_2_bool (MapType2Select nodes n$1_2@@0))) (U_2_bool (MapType2Select nodes n$1_2_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$1_2@@0 n$1_2_1@@0))))
 :qid |stdinbpl.1104:23|
 :skolemid |139|
 :pattern ( (neverTriggered12 n$1_2@@0) (neverTriggered12 n$1_2_1@@0))
)) (and (=> (= (ControlFlow 0 115) (- 0 116)) (forall ((n$1_2@@1 T@U) ) (!  (=> (and (= (type n$1_2@@1) RefType) (U_2_bool (MapType2Select nodes n$1_2@@1))) (>= (U_2_real (MapType1Select QPMask@4 n$1_2@@1 is_marked)) FullPerm))
 :qid |stdinbpl.1111:23|
 :skolemid |140|
 :pattern ( (MapType0Select Heap@0 n$1_2@@1 is_marked))
 :pattern ( (MapType1Select QPMask@5 n$1_2@@1 is_marked))
 :pattern ( (MapType2Select nodes n$1_2@@1))
))) (=> (forall ((n$1_2@@2 T@U) ) (!  (=> (and (= (type n$1_2@@2) RefType) (U_2_bool (MapType2Select nodes n$1_2@@2))) (>= (U_2_real (MapType1Select QPMask@4 n$1_2@@2 is_marked)) FullPerm))
 :qid |stdinbpl.1111:23|
 :skolemid |140|
 :pattern ( (MapType0Select Heap@0 n$1_2@@2 is_marked))
 :pattern ( (MapType1Select QPMask@5 n$1_2@@2 is_marked))
 :pattern ( (MapType2Select nodes n$1_2@@2))
)) (=> (and (and (forall ((n$1_2@@3 T@U) ) (!  (=> (= (type n$1_2@@3) RefType) (=> (and (U_2_bool (MapType2Select nodes n$1_2@@3)) (< NoPerm FullPerm)) (and (qpRange12 n$1_2@@3) (= (invRecv12 n$1_2@@3) n$1_2@@3))))
 :qid |stdinbpl.1117:28|
 :skolemid |141|
 :pattern ( (MapType0Select Heap@0 n$1_2@@3 is_marked))
 :pattern ( (MapType1Select QPMask@5 n$1_2@@3 is_marked))
 :pattern ( (MapType2Select nodes n$1_2@@3))
)) (forall ((o_3@@50 T@U) ) (!  (=> (= (type o_3@@50) RefType) (=> (and (U_2_bool (MapType2Select nodes (invRecv12 o_3@@50))) (and (< NoPerm FullPerm) (qpRange12 o_3@@50))) (= (invRecv12 o_3@@50) o_3@@50)))
 :qid |stdinbpl.1121:28|
 :skolemid |142|
 :pattern ( (invRecv12 o_3@@50))
))) (and (forall ((o_3@@51 T@U) ) (!  (=> (= (type o_3@@51) RefType) (and (=> (and (U_2_bool (MapType2Select nodes (invRecv12 o_3@@51))) (and (< NoPerm FullPerm) (qpRange12 o_3@@51))) (and (= (invRecv12 o_3@@51) o_3@@51) (= (U_2_real (MapType1Select QPMask@5 o_3@@51 is_marked)) (- (U_2_real (MapType1Select QPMask@4 o_3@@51 is_marked)) FullPerm)))) (=> (not (and (U_2_bool (MapType2Select nodes (invRecv12 o_3@@51))) (and (< NoPerm FullPerm) (qpRange12 o_3@@51)))) (= (U_2_real (MapType1Select QPMask@5 o_3@@51 is_marked)) (U_2_real (MapType1Select QPMask@4 o_3@@51 is_marked))))))
 :qid |stdinbpl.1127:28|
 :skolemid |143|
 :pattern ( (MapType1Select QPMask@5 o_3@@51 is_marked))
)) (forall ((o_3@@52 T@U) (f_5@@16 T@U) ) (! (let ((B@@28 (FieldTypeInv1 (type f_5@@16))))
(let ((A@@29 (FieldTypeInv0 (type f_5@@16))))
 (=> (and (and (= (type o_3@@52) RefType) (= (type f_5@@16) (FieldType A@@29 B@@28))) (not (= f_5@@16 is_marked))) (= (U_2_real (MapType1Select QPMask@4 o_3@@52 f_5@@16)) (U_2_real (MapType1Select QPMask@5 o_3@@52 f_5@@16))))))
 :qid |stdinbpl.1133:35|
 :skolemid |144|
 :pattern ( (MapType1Select QPMask@5 o_3@@52 f_5@@16))
)))) (and (and (=> (= (ControlFlow 0 115) 114) anon161_Else_correct) (=> (= (ControlFlow 0 115) 102) anon162_Then_correct)) (=> (= (ControlFlow 0 115) 104) anon162_Else_correct)))))))))))))))))))))))))))
(let ((anon160_Else_correct  (=> (and (and (not (and (not (= (MapType0Select Heap@0 node left) null)) (not (U_2_bool (MapType0Select Heap@0 (MapType0Select Heap@0 node left) is_marked))))) (= Mask@0 QPMask@2)) (and (= Heap@1 Heap@0) (= (ControlFlow 0 100) 98))) anon79_correct)))
(let ((anon159_Else_correct  (=> (= (MapType0Select Heap@0 node left) null) (and (=> (= (ControlFlow 0 128) 115) anon160_Then_correct) (=> (= (ControlFlow 0 128) 100) anon160_Else_correct)))))
(let ((anon159_Then_correct  (=> (not (= (MapType0Select Heap@0 node left) null)) (and (=> (= (ControlFlow 0 125) (- 0 127)) (HasDirectPerm QPMask@2 node left)) (=> (HasDirectPerm QPMask@2 node left) (and (=> (= (ControlFlow 0 125) (- 0 126)) (HasDirectPerm QPMask@2 (MapType0Select Heap@0 node left) is_marked)) (=> (HasDirectPerm QPMask@2 (MapType0Select Heap@0 node left) is_marked) (and (=> (= (ControlFlow 0 125) 115) anon160_Then_correct) (=> (= (ControlFlow 0 125) 100) anon160_Else_correct)))))))))
(let ((anon132_Else_correct  (and (=> (= (ControlFlow 0 129) (- 0 131)) (= FullPerm (U_2_real (MapType1Select QPMask@2 node is_marked)))) (=> (= FullPerm (U_2_real (MapType1Select QPMask@2 node is_marked))) (=> (and (= Heap@0 (MapType0Store Heap@@9 node is_marked (bool_2_U true))) (state Heap@0 QPMask@2)) (and (=> (= (ControlFlow 0 129) (- 0 130)) (HasDirectPerm QPMask@2 node left)) (=> (HasDirectPerm QPMask@2 node left) (and (=> (= (ControlFlow 0 129) 125) anon159_Then_correct) (=> (= (ControlFlow 0 129) 128) anon159_Else_correct)))))))))
(let ((anon129_Else_correct  (=> (and (forall ((n$3_1 T@U) ) (!  (=> (= (type n$3_1) RefType) (=> (and (U_2_bool (MapType2Select nodes n$3_1)) (not (= (MapType0Select Heap@@9 n$3_1 right) null))) (U_2_bool (MapType2Select nodes (MapType0Select Heap@@9 n$3_1 right)))))
 :qid |stdinbpl.688:20|
 :skolemid |101|
 :pattern ( (MapType2Select nodes (MapType0Select Heap@@9 n$3_1 right)))
 :pattern ( (MapType2Select nodes n$3_1) (MapType0Select Heap@@9 n$3_1 right))
)) (state Heap@@9 QPMask@2)) (and (=> (= (ControlFlow 0 209) (- 0 210)) (HasDirectPerm QPMask@2 node is_marked)) (=> (HasDirectPerm QPMask@2 node is_marked) (=> (and (not (U_2_bool (MapType0Select Heap@@9 node is_marked))) (state Heap@@9 QPMask@2)) (and (=> (= (ControlFlow 0 209) 208) anon132_Then_correct) (=> (= (ControlFlow 0 209) 129) anon132_Else_correct))))))))
(let ((anon17_correct true))
(let ((anon131_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select nodes n$3)) (not (= (MapType0Select Heap@@9 n$3 right) null)))) (= (ControlFlow 0 14) 11)) anon17_correct)))
(let ((anon131_Then_correct  (=> (and (U_2_bool (MapType2Select nodes n$3)) (not (= (MapType0Select Heap@@9 n$3 right) null))) (and (=> (= (ControlFlow 0 12) (- 0 13)) (HasDirectPerm QPMask@2 n$3 right)) (=> (HasDirectPerm QPMask@2 n$3 right) (=> (= (ControlFlow 0 12) 11) anon17_correct))))))
(let ((anon130_Else_correct  (=> (not (U_2_bool (MapType2Select nodes n$3))) (and (=> (= (ControlFlow 0 17) 12) anon131_Then_correct) (=> (= (ControlFlow 0 17) 14) anon131_Else_correct)))))
(let ((anon130_Then_correct  (=> (U_2_bool (MapType2Select nodes n$3)) (and (=> (= (ControlFlow 0 15) (- 0 16)) (HasDirectPerm QPMask@2 n$3 right)) (=> (HasDirectPerm QPMask@2 n$3 right) (and (=> (= (ControlFlow 0 15) 12) anon131_Then_correct) (=> (= (ControlFlow 0 15) 14) anon131_Else_correct)))))))
(let ((anon126_Else_correct  (=> (forall ((n$2_1 T@U) ) (!  (=> (= (type n$2_1) RefType) (=> (and (U_2_bool (MapType2Select nodes n$2_1)) (not (= (MapType0Select Heap@@9 n$2_1 left) null))) (U_2_bool (MapType2Select nodes (MapType0Select Heap@@9 n$2_1 left)))))
 :qid |stdinbpl.671:20|
 :skolemid |100|
 :pattern ( (MapType2Select nodes (MapType0Select Heap@@9 n$2_1 left)))
 :pattern ( (MapType2Select nodes n$2_1) (MapType0Select Heap@@9 n$2_1 left))
)) (and (and (=> (= (ControlFlow 0 211) 209) anon129_Else_correct) (=> (= (ControlFlow 0 211) 15) anon130_Then_correct)) (=> (= (ControlFlow 0 211) 17) anon130_Else_correct)))))
(let ((anon11_correct true))
(let ((anon128_Else_correct  (=> (and (not (and (U_2_bool (MapType2Select nodes n$2)) (not (= (MapType0Select Heap@@9 n$2 left) null)))) (= (ControlFlow 0 7) 4)) anon11_correct)))
(let ((anon128_Then_correct  (=> (and (U_2_bool (MapType2Select nodes n$2)) (not (= (MapType0Select Heap@@9 n$2 left) null))) (and (=> (= (ControlFlow 0 5) (- 0 6)) (HasDirectPerm QPMask@2 n$2 left)) (=> (HasDirectPerm QPMask@2 n$2 left) (=> (= (ControlFlow 0 5) 4) anon11_correct))))))
(let ((anon127_Else_correct  (=> (not (U_2_bool (MapType2Select nodes n$2))) (and (=> (= (ControlFlow 0 10) 5) anon128_Then_correct) (=> (= (ControlFlow 0 10) 7) anon128_Else_correct)))))
(let ((anon127_Then_correct  (=> (U_2_bool (MapType2Select nodes n$2)) (and (=> (= (ControlFlow 0 8) (- 0 9)) (HasDirectPerm QPMask@2 n$2 left)) (=> (HasDirectPerm QPMask@2 n$2 left) (and (=> (= (ControlFlow 0 8) 5) anon128_Then_correct) (=> (= (ControlFlow 0 8) 7) anon128_Else_correct)))))))
(let ((anon125_Else_correct  (and (=> (= (ControlFlow 0 212) (- 0 213)) (forall ((n$1_1 T@U) (n$1_1_1 T@U) ) (!  (=> (and (= (type n$1_1) RefType) (= (type n$1_1_1) RefType)) (=> (and (and (and (and (not (= n$1_1 n$1_1_1)) (U_2_bool (MapType2Select nodes n$1_1))) (U_2_bool (MapType2Select nodes n$1_1_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$1_1 n$1_1_1))))
 :qid |stdinbpl.626:15|
 :skolemid |94|
 :no-pattern (type n$1_1)
 :no-pattern (type n$1_1_1)
 :no-pattern (U_2_int n$1_1)
 :no-pattern (U_2_bool n$1_1)
 :no-pattern (U_2_int n$1_1_1)
 :no-pattern (U_2_bool n$1_1_1)
))) (=> (forall ((n$1_1@@0 T@U) (n$1_1_1@@0 T@U) ) (!  (=> (and (= (type n$1_1@@0) RefType) (= (type n$1_1_1@@0) RefType)) (=> (and (and (and (and (not (= n$1_1@@0 n$1_1_1@@0)) (U_2_bool (MapType2Select nodes n$1_1@@0))) (U_2_bool (MapType2Select nodes n$1_1_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$1_1@@0 n$1_1_1@@0))))
 :qid |stdinbpl.626:15|
 :skolemid |94|
 :no-pattern (type n$1_1@@0)
 :no-pattern (type n$1_1_1@@0)
 :no-pattern (U_2_int n$1_1@@0)
 :no-pattern (U_2_bool n$1_1@@0)
 :no-pattern (U_2_int n$1_1_1@@0)
 :no-pattern (U_2_bool n$1_1_1@@0)
)) (=> (and (forall ((n$1_1@@1 T@U) ) (!  (=> (= (type n$1_1@@1) RefType) (=> (and (U_2_bool (MapType2Select nodes n$1_1@@1)) (< NoPerm FullPerm)) (and (qpRange3 n$1_1@@1) (= (invRecv3 n$1_1@@1) n$1_1@@1))))
 :qid |stdinbpl.632:22|
 :skolemid |95|
 :pattern ( (MapType0Select Heap@@9 n$1_1@@1 is_marked))
 :pattern ( (MapType1Select QPMask@2 n$1_1@@1 is_marked))
 :pattern ( (MapType2Select nodes n$1_1@@1))
)) (forall ((o_3@@53 T@U) ) (!  (=> (= (type o_3@@53) RefType) (=> (and (and (U_2_bool (MapType2Select nodes (invRecv3 o_3@@53))) (< NoPerm FullPerm)) (qpRange3 o_3@@53)) (= (invRecv3 o_3@@53) o_3@@53)))
 :qid |stdinbpl.636:22|
 :skolemid |96|
 :pattern ( (invRecv3 o_3@@53))
))) (=> (and (and (forall ((n$1_1@@2 T@U) ) (!  (=> (and (= (type n$1_1@@2) RefType) (U_2_bool (MapType2Select nodes n$1_1@@2))) (not (= n$1_1@@2 null)))
 :qid |stdinbpl.642:22|
 :skolemid |97|
 :pattern ( (MapType0Select Heap@@9 n$1_1@@2 is_marked))
 :pattern ( (MapType1Select QPMask@2 n$1_1@@2 is_marked))
 :pattern ( (MapType2Select nodes n$1_1@@2))
)) (forall ((o_3@@54 T@U) ) (!  (=> (= (type o_3@@54) RefType) (and (=> (and (and (U_2_bool (MapType2Select nodes (invRecv3 o_3@@54))) (< NoPerm FullPerm)) (qpRange3 o_3@@54)) (and (=> (< NoPerm FullPerm) (= (invRecv3 o_3@@54) o_3@@54)) (= (U_2_real (MapType1Select QPMask@2 o_3@@54 is_marked)) (+ (U_2_real (MapType1Select QPMask@1 o_3@@54 is_marked)) FullPerm)))) (=> (not (and (and (U_2_bool (MapType2Select nodes (invRecv3 o_3@@54))) (< NoPerm FullPerm)) (qpRange3 o_3@@54))) (= (U_2_real (MapType1Select QPMask@2 o_3@@54 is_marked)) (U_2_real (MapType1Select QPMask@1 o_3@@54 is_marked))))))
 :qid |stdinbpl.648:22|
 :skolemid |98|
 :pattern ( (MapType1Select QPMask@2 o_3@@54 is_marked))
))) (and (forall ((o_3@@55 T@U) (f_5@@17 T@U) ) (! (let ((B@@29 (FieldTypeInv1 (type f_5@@17))))
(let ((A@@30 (FieldTypeInv0 (type f_5@@17))))
 (=> (and (and (= (type o_3@@55) RefType) (= (type f_5@@17) (FieldType A@@30 B@@29))) (not (= f_5@@17 is_marked))) (= (U_2_real (MapType1Select QPMask@1 o_3@@55 f_5@@17)) (U_2_real (MapType1Select QPMask@2 o_3@@55 f_5@@17))))))
 :qid |stdinbpl.652:29|
 :skolemid |99|
 :pattern ( (MapType1Select QPMask@1 o_3@@55 f_5@@17))
 :pattern ( (MapType1Select QPMask@2 o_3@@55 f_5@@17))
)) (state Heap@@9 QPMask@2))) (and (and (=> (= (ControlFlow 0 212) 211) anon126_Else_correct) (=> (= (ControlFlow 0 212) 8) anon127_Then_correct)) (=> (= (ControlFlow 0 212) 10) anon127_Else_correct))))))))
(let ((anon125_Then_correct true))
(let ((anon124_Else_correct  (and (=> (= (ControlFlow 0 214) (- 0 215)) (forall ((n$0_1 T@U) (n$0_1_1 T@U) ) (!  (=> (and (= (type n$0_1) RefType) (= (type n$0_1_1) RefType)) (=> (and (and (and (and (not (= n$0_1 n$0_1_1)) (U_2_bool (MapType2Select nodes n$0_1))) (U_2_bool (MapType2Select nodes n$0_1_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$0_1 n$0_1_1))))
 :qid |stdinbpl.587:15|
 :skolemid |88|
 :no-pattern (type n$0_1)
 :no-pattern (type n$0_1_1)
 :no-pattern (U_2_int n$0_1)
 :no-pattern (U_2_bool n$0_1)
 :no-pattern (U_2_int n$0_1_1)
 :no-pattern (U_2_bool n$0_1_1)
))) (=> (forall ((n$0_1@@0 T@U) (n$0_1_1@@0 T@U) ) (!  (=> (and (= (type n$0_1@@0) RefType) (= (type n$0_1_1@@0) RefType)) (=> (and (and (and (and (not (= n$0_1@@0 n$0_1_1@@0)) (U_2_bool (MapType2Select nodes n$0_1@@0))) (U_2_bool (MapType2Select nodes n$0_1_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n$0_1@@0 n$0_1_1@@0))))
 :qid |stdinbpl.587:15|
 :skolemid |88|
 :no-pattern (type n$0_1@@0)
 :no-pattern (type n$0_1_1@@0)
 :no-pattern (U_2_int n$0_1@@0)
 :no-pattern (U_2_bool n$0_1@@0)
 :no-pattern (U_2_int n$0_1_1@@0)
 :no-pattern (U_2_bool n$0_1_1@@0)
)) (=> (and (forall ((n$0_1@@1 T@U) ) (!  (=> (= (type n$0_1@@1) RefType) (=> (and (U_2_bool (MapType2Select nodes n$0_1@@1)) (< NoPerm FullPerm)) (and (qpRange2 n$0_1@@1) (= (invRecv2 n$0_1@@1) n$0_1@@1))))
 :qid |stdinbpl.593:22|
 :skolemid |89|
 :pattern ( (MapType0Select Heap@@9 n$0_1@@1 right))
 :pattern ( (MapType1Select QPMask@1 n$0_1@@1 right))
 :pattern ( (MapType2Select nodes n$0_1@@1))
)) (forall ((o_3@@56 T@U) ) (!  (=> (= (type o_3@@56) RefType) (=> (and (and (U_2_bool (MapType2Select nodes (invRecv2 o_3@@56))) (< NoPerm FullPerm)) (qpRange2 o_3@@56)) (= (invRecv2 o_3@@56) o_3@@56)))
 :qid |stdinbpl.597:22|
 :skolemid |90|
 :pattern ( (invRecv2 o_3@@56))
))) (=> (and (and (forall ((n$0_1@@2 T@U) ) (!  (=> (and (= (type n$0_1@@2) RefType) (U_2_bool (MapType2Select nodes n$0_1@@2))) (not (= n$0_1@@2 null)))
 :qid |stdinbpl.603:22|
 :skolemid |91|
 :pattern ( (MapType0Select Heap@@9 n$0_1@@2 right))
 :pattern ( (MapType1Select QPMask@1 n$0_1@@2 right))
 :pattern ( (MapType2Select nodes n$0_1@@2))
)) (forall ((o_3@@57 T@U) ) (!  (=> (= (type o_3@@57) RefType) (and (=> (and (and (U_2_bool (MapType2Select nodes (invRecv2 o_3@@57))) (< NoPerm FullPerm)) (qpRange2 o_3@@57)) (and (=> (< NoPerm FullPerm) (= (invRecv2 o_3@@57) o_3@@57)) (= (U_2_real (MapType1Select QPMask@1 o_3@@57 right)) (+ (U_2_real (MapType1Select QPMask@0 o_3@@57 right)) FullPerm)))) (=> (not (and (and (U_2_bool (MapType2Select nodes (invRecv2 o_3@@57))) (< NoPerm FullPerm)) (qpRange2 o_3@@57))) (= (U_2_real (MapType1Select QPMask@1 o_3@@57 right)) (U_2_real (MapType1Select QPMask@0 o_3@@57 right))))))
 :qid |stdinbpl.609:22|
 :skolemid |92|
 :pattern ( (MapType1Select QPMask@1 o_3@@57 right))
))) (and (forall ((o_3@@58 T@U) (f_5@@18 T@U) ) (! (let ((B@@30 (FieldTypeInv1 (type f_5@@18))))
(let ((A@@31 (FieldTypeInv0 (type f_5@@18))))
 (=> (and (and (= (type o_3@@58) RefType) (= (type f_5@@18) (FieldType A@@31 B@@30))) (not (= f_5@@18 right))) (= (U_2_real (MapType1Select QPMask@0 o_3@@58 f_5@@18)) (U_2_real (MapType1Select QPMask@1 o_3@@58 f_5@@18))))))
 :qid |stdinbpl.613:29|
 :skolemid |93|
 :pattern ( (MapType1Select QPMask@0 o_3@@58 f_5@@18))
 :pattern ( (MapType1Select QPMask@1 o_3@@58 f_5@@18))
)) (state Heap@@9 QPMask@1))) (and (=> (= (ControlFlow 0 214) 3) anon125_Then_correct) (=> (= (ControlFlow 0 214) 212) anon125_Else_correct))))))))
(let ((anon124_Then_correct true))
(let ((anon123_Else_correct  (and (=> (= (ControlFlow 0 216) (- 0 217)) (forall ((n_1 T@U) (n_1_1 T@U) ) (!  (=> (and (= (type n_1) RefType) (= (type n_1_1) RefType)) (=> (and (and (and (and (not (= n_1 n_1_1)) (U_2_bool (MapType2Select nodes n_1))) (U_2_bool (MapType2Select nodes n_1_1))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_1 n_1_1))))
 :qid |stdinbpl.548:15|
 :skolemid |82|
 :no-pattern (type n_1)
 :no-pattern (type n_1_1)
 :no-pattern (U_2_int n_1)
 :no-pattern (U_2_bool n_1)
 :no-pattern (U_2_int n_1_1)
 :no-pattern (U_2_bool n_1_1)
))) (=> (forall ((n_1@@0 T@U) (n_1_1@@0 T@U) ) (!  (=> (and (= (type n_1@@0) RefType) (= (type n_1_1@@0) RefType)) (=> (and (and (and (and (not (= n_1@@0 n_1_1@@0)) (U_2_bool (MapType2Select nodes n_1@@0))) (U_2_bool (MapType2Select nodes n_1_1@@0))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= n_1@@0 n_1_1@@0))))
 :qid |stdinbpl.548:15|
 :skolemid |82|
 :no-pattern (type n_1@@0)
 :no-pattern (type n_1_1@@0)
 :no-pattern (U_2_int n_1@@0)
 :no-pattern (U_2_bool n_1@@0)
 :no-pattern (U_2_int n_1_1@@0)
 :no-pattern (U_2_bool n_1_1@@0)
)) (=> (and (forall ((n_1@@1 T@U) ) (!  (=> (= (type n_1@@1) RefType) (=> (and (U_2_bool (MapType2Select nodes n_1@@1)) (< NoPerm FullPerm)) (and (qpRange1 n_1@@1) (= (invRecv1 n_1@@1) n_1@@1))))
 :qid |stdinbpl.554:22|
 :skolemid |83|
 :pattern ( (MapType0Select Heap@@9 n_1@@1 left))
 :pattern ( (MapType1Select QPMask@0 n_1@@1 left))
 :pattern ( (MapType2Select nodes n_1@@1))
)) (forall ((o_3@@59 T@U) ) (!  (=> (= (type o_3@@59) RefType) (=> (and (and (U_2_bool (MapType2Select nodes (invRecv1 o_3@@59))) (< NoPerm FullPerm)) (qpRange1 o_3@@59)) (= (invRecv1 o_3@@59) o_3@@59)))
 :qid |stdinbpl.558:22|
 :skolemid |84|
 :pattern ( (invRecv1 o_3@@59))
))) (=> (and (and (forall ((n_1@@2 T@U) ) (!  (=> (and (= (type n_1@@2) RefType) (U_2_bool (MapType2Select nodes n_1@@2))) (not (= n_1@@2 null)))
 :qid |stdinbpl.564:22|
 :skolemid |85|
 :pattern ( (MapType0Select Heap@@9 n_1@@2 left))
 :pattern ( (MapType1Select QPMask@0 n_1@@2 left))
 :pattern ( (MapType2Select nodes n_1@@2))
)) (forall ((o_3@@60 T@U) ) (!  (=> (= (type o_3@@60) RefType) (and (=> (and (and (U_2_bool (MapType2Select nodes (invRecv1 o_3@@60))) (< NoPerm FullPerm)) (qpRange1 o_3@@60)) (and (=> (< NoPerm FullPerm) (= (invRecv1 o_3@@60) o_3@@60)) (= (U_2_real (MapType1Select QPMask@0 o_3@@60 left)) (+ (U_2_real (MapType1Select ZeroMask o_3@@60 left)) FullPerm)))) (=> (not (and (and (U_2_bool (MapType2Select nodes (invRecv1 o_3@@60))) (< NoPerm FullPerm)) (qpRange1 o_3@@60))) (= (U_2_real (MapType1Select QPMask@0 o_3@@60 left)) (U_2_real (MapType1Select ZeroMask o_3@@60 left))))))
 :qid |stdinbpl.570:22|
 :skolemid |86|
 :pattern ( (MapType1Select QPMask@0 o_3@@60 left))
))) (and (forall ((o_3@@61 T@U) (f_5@@19 T@U) ) (! (let ((B@@31 (FieldTypeInv1 (type f_5@@19))))
(let ((A@@32 (FieldTypeInv0 (type f_5@@19))))
 (=> (and (and (= (type o_3@@61) RefType) (= (type f_5@@19) (FieldType A@@32 B@@31))) (not (= f_5@@19 left))) (= (U_2_real (MapType1Select ZeroMask o_3@@61 f_5@@19)) (U_2_real (MapType1Select QPMask@0 o_3@@61 f_5@@19))))))
 :qid |stdinbpl.574:29|
 :skolemid |87|
 :pattern ( (MapType1Select ZeroMask o_3@@61 f_5@@19))
 :pattern ( (MapType1Select QPMask@0 o_3@@61 f_5@@19))
)) (state Heap@@9 QPMask@0))) (and (=> (= (ControlFlow 0 216) 2) anon124_Then_correct) (=> (= (ControlFlow 0 216) 214) anon124_Else_correct))))))))
(let ((anon123_Then_correct true))
(let ((anon0_correct  (=> (and (and (state Heap@@9 ZeroMask) (U_2_bool (MapType0Select Heap@@9 node $allocated))) (and (U_2_bool (MapType2Select nodes node)) (not (U_2_bool (MapType2Select nodes null))))) (and (=> (= (ControlFlow 0 218) 1) anon123_Then_correct) (=> (= (ControlFlow 0 218) 216) anon123_Else_correct)))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 219) 218) anon0_correct)))
PreconditionGeneratedEntry_correct)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
))
(check-sat)
(pop 1)
; Valid
(get-info :rlimit)
