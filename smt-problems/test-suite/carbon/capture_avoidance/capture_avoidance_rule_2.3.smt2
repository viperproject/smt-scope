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
(declare-fun state (T@U T@U) Bool)
(declare-fun |function2'| (T@U Int Int) Bool)
(declare-fun MapType0Type (T@T) T@T)
(declare-fun RefType () T@T)
(declare-fun MapType1Type (T@T T@T) T@T)
(declare-fun |function2#frame| (T@U Int Int) Bool)
(declare-fun EmptyFrame () T@U)
(declare-fun MapType0TypeInv0 (T@T) T@T)
(declare-fun MapType0Select (T@U T@U T@U) T@U)
(declare-fun MapType0Store (T@U T@U T@U T@U) T@U)
(declare-fun MapType1TypeInv0 (T@T) T@T)
(declare-fun MapType1TypeInv1 (T@T) T@T)
(declare-fun MapType1Select (T@U T@U T@U) T@U)
(declare-fun MapType1Store (T@U T@U T@U T@U) T@U)
(declare-fun FrameTypeType () T@T)
(declare-fun |function4'| (T@U Bool Bool) Bool)
(declare-fun |function4#frame| (T@U Bool Bool) Bool)
(declare-fun |function5'| (T@U Int Int) Bool)
(declare-fun |function5#frame| (T@U Int Int) Bool)
(declare-fun |function6'| (T@U Int Int) Bool)
(declare-fun |function6#frame| (T@U Int Int) Bool)
(declare-fun |function7'| (T@U Bool Int) Bool)
(declare-fun |function7#frame| (T@U Bool Int) Bool)
(declare-fun |function8'| (T@U Bool Int) Bool)
(declare-fun |function8#frame| (T@U Bool Int) Bool)
(declare-fun succHeap (T@U T@U) Bool)
(declare-fun succHeapTrans (T@U T@U) Bool)
(declare-fun |MultiSet#Card| (T@U) Int)
(declare-fun |MultiSet#Difference| (T@U T@U) T@U)
(declare-fun MultiSetTypeInv0 (T@T) T@T)
(declare-fun MultiSetType (T@T) T@T)
(declare-fun |MultiSet#Intersection| (T@U T@U) T@U)
(declare-fun |MultiSet#Union| (T@U T@U) T@U)
(declare-fun GoodMask (T@U) Bool)
(declare-fun dummyFunction (T@U) Bool)
(declare-fun |function2#triggerStateless| (Int Int) Bool)
(declare-fun |function4#triggerStateless| (Bool Bool) Bool)
(declare-fun |function5#triggerStateless| (Int Int) Bool)
(declare-fun |function6#triggerStateless| (Int Int) Bool)
(declare-fun |function7#triggerStateless| (Bool Int) Bool)
(declare-fun |function8#triggerStateless| (Bool Int) Bool)
(declare-fun |Math#min| (Int Int) Int)
(declare-fun IdenticalOnKnownLocations (T@U T@U T@U) Bool)
(declare-fun IsPredicateField (T@U) Bool)
(declare-fun null () T@U)
(declare-fun PredicateMaskField (T@U) T@U)
(declare-fun HasDirectPerm (T@U T@U T@U) Bool)
(declare-fun IsWandField (T@U) Bool)
(declare-fun WandMaskField (T@U) T@U)
(declare-fun |function1'| (T@U Int) Bool)
(declare-fun |function1#triggerStateless| (Int) Bool)
(declare-fun |function3'| (T@U Bool) Bool)
(declare-fun |function3#triggerStateless| (Bool) Bool)
(declare-fun |function10'| (T@U Int) Bool)
(declare-fun |function10#triggerStateless| (Int) Bool)
(declare-fun |function11'| (T@U T@U) Bool)
(declare-fun MapType2Type (T@T T@T) T@T)
(declare-fun |function11#triggerStateless| (T@U) Bool)
(declare-fun MapType2TypeInv0 (T@T) T@T)
(declare-fun MapType2TypeInv1 (T@T) T@T)
(declare-fun MapType2Select (T@U T@U) T@U)
(declare-fun MapType2Store (T@U T@U T@U) T@U)
(declare-fun |function11#condqp1| (T@U T@U) Int)
(declare-fun |sk_function11#condqp1| (Int Int) T@U)
(declare-fun NoPerm () Real)
(declare-fun FullPerm () Real)
(declare-fun |MultiSet#Select| (T@U T@U) Int)
(declare-fun |Set#Union| (T@U T@U) T@U)
(declare-fun |Set#Intersection| (T@U T@U) T@U)
(declare-fun |Set#Singleton| (T@U) T@U)
(declare-fun |Set#Card| (T@U) Int)
(declare-fun |Math#clip| (Int) Int)
(declare-fun function11 (T@U T@U) Bool)
(declare-fun AssumeFunctionsAbove () Int)
(declare-fun dummyHeap () T@U)
(declare-fun ZeroMask () T@U)
(declare-fun |MultiSet#UnionOne| (T@U T@U) T@U)
(declare-fun |MultiSet#Disjoint| (T@U T@U) Bool)
(declare-fun InsidePredicate (T@U T@U T@U T@U) Bool)
(declare-fun |MultiSet#Singleton| (T@U) T@U)
(declare-fun |Set#Equal| (T@U T@U) Bool)
(declare-fun sumMask (T@U T@U T@U) Bool)
(declare-fun ConditionalFrame (Real T@U) T@U)
(declare-fun |Set#Difference| (T@U T@U) T@U)
(declare-fun |MultiSet#Equal| (T@U T@U) Bool)
(declare-fun |Set#UnionOne| (T@U T@U) T@U)
(declare-fun |function1#frame| (T@U Int) Bool)
(declare-fun |function3#frame| (T@U Bool) Bool)
(declare-fun |function10#frame| (T@U Int) Bool)
(declare-fun function1 (T@U Int) Bool)
(declare-fun function3 (T@U Bool) Bool)
(declare-fun function10 (T@U Int) Bool)
(declare-fun |MultiSet#Empty| (T@T) T@U)
(declare-fun |function0'| (T@U) Bool)
(declare-fun |function0#frame| (T@U) Bool)
(declare-fun |function9'| (T@U) Bool)
(declare-fun |function9#frame| (T@U) Bool)
(declare-fun |function0#triggerStateless| () Bool)
(declare-fun |function9#triggerStateless| () Bool)
(declare-fun |function11#frame| (T@U T@U) Bool)
(declare-fun FrameFragment (T@U) T@U)
(declare-fun |Set#Empty| (T@T) T@U)
(declare-fun |Set#Subset| (T@U T@U) Bool)
(declare-fun ZeroPMask () T@U)
(declare-fun function0 (T@U) Bool)
(declare-fun function9 (T@U) Bool)
(declare-fun |MultiSet#Subset| (T@U T@U) Bool)
(declare-fun function2 (T@U Int Int) Bool)
(declare-fun function4 (T@U Bool Bool) Bool)
(declare-fun function5 (T@U Int Int) Bool)
(declare-fun function6 (T@U Int Int) Bool)
(declare-fun function7 (T@U Bool Int) Bool)
(declare-fun function8 (T@U Bool Int) Bool)
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
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (forall ((arg0@@14 T@T) ) (! (= (Ctor (MapType0Type arg0@@14)) 8)
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
)))) (= (Ctor RefType) 9)) (forall ((arg0@@18 T@T) (arg1@@4 T@T) ) (! (= (Ctor (MapType1Type arg0@@18 arg1@@4)) 10)
 :qid |ctor:MapType1Type|
))) (forall ((arg0@@19 T@T) (arg1@@5 T@T) ) (! (= (MapType1TypeInv0 (MapType1Type arg0@@19 arg1@@5)) arg0@@19)
 :qid |typeInv:MapType1TypeInv0|
 :pattern ( (MapType1Type arg0@@19 arg1@@5))
))) (forall ((arg0@@20 T@T) (arg1@@6 T@T) ) (! (= (MapType1TypeInv1 (MapType1Type arg0@@20 arg1@@6)) arg1@@6)
 :qid |typeInv:MapType1TypeInv1|
 :pattern ( (MapType1Type arg0@@20 arg1@@6))
))) (forall ((arg0@@21 T@U) (arg1@@7 T@U) (arg2@@1 T@U) ) (! (let ((aVar1 (MapType1TypeInv1 (type arg0@@21))))
(= (type (MapType1Select arg0@@21 arg1@@7 arg2@@1)) aVar1))
 :qid |funType:MapType1Select|
 :pattern ( (MapType1Select arg0@@21 arg1@@7 arg2@@1))
))) (forall ((arg0@@22 T@U) (arg1@@8 T@U) (arg2@@2 T@U) (arg3@@0 T@U) ) (! (let ((aVar1@@0 (type arg3@@0)))
(let ((aVar0@@0 (type arg1@@8)))
(= (type (MapType1Store arg0@@22 arg1@@8 arg2@@2 arg3@@0)) (MapType1Type aVar0@@0 aVar1@@0))))
 :qid |funType:MapType1Store|
 :pattern ( (MapType1Store arg0@@22 arg1@@8 arg2@@2 arg3@@0))
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
)))) (= (Ctor FrameTypeType) 11)) (= (type EmptyFrame) FrameTypeType)))
(assert (forall ((Heap T@U) (Mask T@U) (y@@1 Int) (z@@0 Int) ) (!  (=> (and (and (= (type Heap) (MapType0Type RefType)) (= (type Mask) (MapType1Type RefType realType))) (state Heap Mask)) (= (|function2'| Heap y@@1 z@@0) (|function2#frame| EmptyFrame y@@1 z@@0)))
 :qid |stdinbpl.528:15|
 :skolemid |92|
 :pattern ( (state Heap Mask) (|function2'| Heap y@@1 z@@0))
)))
(assert (forall ((Heap@@0 T@U) (Mask@@0 T@U) (b_2 Bool) (c Bool) ) (!  (=> (and (and (= (type Heap@@0) (MapType0Type RefType)) (= (type Mask@@0) (MapType1Type RefType realType))) (state Heap@@0 Mask@@0)) (= (|function4'| Heap@@0 b_2 c) (|function4#frame| EmptyFrame b_2 c)))
 :qid |stdinbpl.632:15|
 :skolemid |100|
 :pattern ( (state Heap@@0 Mask@@0) (|function4'| Heap@@0 b_2 c))
)))
(assert (forall ((Heap@@1 T@U) (Mask@@1 T@U) (x@@8 Int) (y@@2 Int) ) (!  (=> (and (and (= (type Heap@@1) (MapType0Type RefType)) (= (type Mask@@1) (MapType1Type RefType realType))) (state Heap@@1 Mask@@1)) (= (|function5'| Heap@@1 x@@8 y@@2) (|function5#frame| EmptyFrame x@@8 y@@2)))
 :qid |stdinbpl.684:15|
 :skolemid |104|
 :pattern ( (state Heap@@1 Mask@@1) (|function5'| Heap@@1 x@@8 y@@2))
)))
(assert (forall ((Heap@@2 T@U) (Mask@@2 T@U) (z@@1 Int) (w_1 Int) ) (!  (=> (and (and (= (type Heap@@2) (MapType0Type RefType)) (= (type Mask@@2) (MapType1Type RefType realType))) (state Heap@@2 Mask@@2)) (= (|function6'| Heap@@2 z@@1 w_1) (|function6#frame| EmptyFrame z@@1 w_1)))
 :qid |stdinbpl.728:15|
 :skolemid |107|
 :pattern ( (state Heap@@2 Mask@@2) (|function6'| Heap@@2 z@@1 w_1))
)))
(assert (forall ((Heap@@3 T@U) (Mask@@3 T@U) (b_2@@0 Bool) (z@@2 Int) ) (!  (=> (and (and (= (type Heap@@3) (MapType0Type RefType)) (= (type Mask@@3) (MapType1Type RefType realType))) (state Heap@@3 Mask@@3)) (= (|function7'| Heap@@3 b_2@@0 z@@2) (|function7#frame| EmptyFrame b_2@@0 z@@2)))
 :qid |stdinbpl.789:15|
 :skolemid |112|
 :pattern ( (state Heap@@3 Mask@@3) (|function7'| Heap@@3 b_2@@0 z@@2))
)))
(assert (forall ((Heap@@4 T@U) (Mask@@4 T@U) (b_2@@1 Bool) (z@@3 Int) ) (!  (=> (and (and (= (type Heap@@4) (MapType0Type RefType)) (= (type Mask@@4) (MapType1Type RefType realType))) (state Heap@@4 Mask@@4)) (= (|function8'| Heap@@4 b_2@@1 z@@3) (|function8#frame| EmptyFrame b_2@@1 z@@3)))
 :qid |stdinbpl.834:15|
 :skolemid |115|
 :pattern ( (state Heap@@4 Mask@@4) (|function8'| Heap@@4 b_2@@1 z@@3))
)))
(assert (forall ((Heap0 T@U) (Heap1 T@U) ) (!  (=> (and (and (= (type Heap0) (MapType0Type RefType)) (= (type Heap1) (MapType0Type RefType))) (succHeap Heap0 Heap1)) (succHeapTrans Heap0 Heap1))
 :qid |stdinbpl.88:15|
 :skolemid |11|
 :pattern ( (succHeap Heap0 Heap1))
)))
(assert  (and (and (and (and (forall ((arg0@@23 T@T) ) (! (= (Ctor (MultiSetType arg0@@23)) 12)
 :qid |ctor:MultiSetType|
)) (forall ((arg0@@24 T@T) ) (! (= (MultiSetTypeInv0 (MultiSetType arg0@@24)) arg0@@24)
 :qid |typeInv:MultiSetTypeInv0|
 :pattern ( (MultiSetType arg0@@24))
))) (forall ((arg0@@25 T@U) (arg1@@9 T@U) ) (! (let ((T (MultiSetTypeInv0 (type arg0@@25))))
(= (type (|MultiSet#Difference| arg0@@25 arg1@@9)) (MultiSetType T)))
 :qid |funType:MultiSet#Difference|
 :pattern ( (|MultiSet#Difference| arg0@@25 arg1@@9))
))) (forall ((arg0@@26 T@U) (arg1@@10 T@U) ) (! (let ((T@@0 (MultiSetTypeInv0 (type arg0@@26))))
(= (type (|MultiSet#Intersection| arg0@@26 arg1@@10)) (MultiSetType T@@0)))
 :qid |funType:MultiSet#Intersection|
 :pattern ( (|MultiSet#Intersection| arg0@@26 arg1@@10))
))) (forall ((arg0@@27 T@U) (arg1@@11 T@U) ) (! (let ((T@@1 (MultiSetTypeInv0 (type arg0@@27))))
(= (type (|MultiSet#Union| arg0@@27 arg1@@11)) (MultiSetType T@@1)))
 :qid |funType:MultiSet#Union|
 :pattern ( (|MultiSet#Union| arg0@@27 arg1@@11))
))))
(assert (forall ((a T@U) (b T@U) ) (! (let ((T@@2 (MultiSetTypeInv0 (type a))))
 (=> (and (= (type a) (MultiSetType T@@2)) (= (type b) (MultiSetType T@@2))) (and (= (+ (+ (|MultiSet#Card| (|MultiSet#Difference| a b)) (|MultiSet#Card| (|MultiSet#Difference| b a))) (* 2 (|MultiSet#Card| (|MultiSet#Intersection| a b)))) (|MultiSet#Card| (|MultiSet#Union| a b))) (= (|MultiSet#Card| (|MultiSet#Difference| a b)) (- (|MultiSet#Card| a) (|MultiSet#Card| (|MultiSet#Intersection| a b)))))))
 :qid |stdinbpl.373:18|
 :skolemid |74|
 :pattern ( (|MultiSet#Card| (|MultiSet#Difference| a b)))
)))
(assert (forall ((Heap@@5 T@U) (Mask@@5 T@U) ) (!  (=> (and (and (= (type Heap@@5) (MapType0Type RefType)) (= (type Mask@@5) (MapType1Type RefType realType))) (state Heap@@5 Mask@@5)) (GoodMask Mask@@5))
 :qid |stdinbpl.124:15|
 :skolemid |15|
 :pattern ( (state Heap@@5 Mask@@5))
)))
(assert (forall ((Heap0@@0 T@U) (Heap1@@0 T@U) (Heap2 T@U) ) (!  (=> (and (and (and (= (type Heap0@@0) (MapType0Type RefType)) (= (type Heap1@@0) (MapType0Type RefType))) (= (type Heap2) (MapType0Type RefType))) (and (succHeapTrans Heap0@@0 Heap1@@0) (succHeap Heap1@@0 Heap2))) (succHeapTrans Heap0@@0 Heap2))
 :qid |stdinbpl.93:15|
 :skolemid |12|
 :pattern ( (succHeapTrans Heap0@@0 Heap1@@0) (succHeap Heap1@@0 Heap2))
)))
(assert (forall ((Heap@@6 T@U) (y@@3 Int) (z@@4 Int) ) (!  (=> (= (type Heap@@6) (MapType0Type RefType)) (dummyFunction (bool_2_U (|function2#triggerStateless| y@@3 z@@4))))
 :qid |stdinbpl.521:15|
 :skolemid |91|
 :pattern ( (|function2'| Heap@@6 y@@3 z@@4))
)))
(assert (forall ((Heap@@7 T@U) (b_2@@2 Bool) (c@@0 Bool) ) (!  (=> (= (type Heap@@7) (MapType0Type RefType)) (dummyFunction (bool_2_U (|function4#triggerStateless| b_2@@2 c@@0))))
 :qid |stdinbpl.625:15|
 :skolemid |99|
 :pattern ( (|function4'| Heap@@7 b_2@@2 c@@0))
)))
(assert (forall ((Heap@@8 T@U) (x@@9 Int) (y@@4 Int) ) (!  (=> (= (type Heap@@8) (MapType0Type RefType)) (dummyFunction (bool_2_U (|function5#triggerStateless| x@@9 y@@4))))
 :qid |stdinbpl.677:15|
 :skolemid |103|
 :pattern ( (|function5'| Heap@@8 x@@9 y@@4))
)))
(assert (forall ((Heap@@9 T@U) (z@@5 Int) (w_1@@0 Int) ) (!  (=> (= (type Heap@@9) (MapType0Type RefType)) (dummyFunction (bool_2_U (|function6#triggerStateless| z@@5 w_1@@0))))
 :qid |stdinbpl.721:15|
 :skolemid |106|
 :pattern ( (|function6'| Heap@@9 z@@5 w_1@@0))
)))
(assert (forall ((Heap@@10 T@U) (b_2@@3 Bool) (z@@6 Int) ) (!  (=> (= (type Heap@@10) (MapType0Type RefType)) (dummyFunction (bool_2_U (|function7#triggerStateless| b_2@@3 z@@6))))
 :qid |stdinbpl.782:15|
 :skolemid |111|
 :pattern ( (|function7'| Heap@@10 b_2@@3 z@@6))
)))
(assert (forall ((Heap@@11 T@U) (b_2@@4 Bool) (z@@7 Int) ) (!  (=> (= (type Heap@@11) (MapType0Type RefType)) (dummyFunction (bool_2_U (|function8#triggerStateless| b_2@@4 z@@7))))
 :qid |stdinbpl.827:15|
 :skolemid |114|
 :pattern ( (|function8'| Heap@@11 b_2@@4 z@@7))
)))
(assert (forall ((a@@0 Int) (b@@0 Int) ) (!  (or (= (|Math#min| a@@0 b@@0) a@@0) (= (|Math#min| a@@0 b@@0) b@@0))
 :qid |stdinbpl.304:15|
 :skolemid |53|
 :pattern ( (|Math#min| a@@0 b@@0))
)))
(assert  (and (= (type null) RefType) (forall ((arg0@@28 T@U) ) (! (let ((A (FieldTypeInv0 (type arg0@@28))))
(= (type (PredicateMaskField arg0@@28)) (FieldType A (MapType1Type RefType boolType))))
 :qid |funType:PredicateMaskField|
 :pattern ( (PredicateMaskField arg0@@28))
))))
(assert (forall ((Heap@@12 T@U) (ExhaleHeap T@U) (Mask@@6 T@U) (pm_f T@U) ) (! (let ((C (FieldTypeInv0 (type pm_f))))
 (=> (and (and (and (and (and (= (type Heap@@12) (MapType0Type RefType)) (= (type ExhaleHeap) (MapType0Type RefType))) (= (type Mask@@6) (MapType1Type RefType realType))) (= (type pm_f) (FieldType C FrameTypeType))) (IdenticalOnKnownLocations Heap@@12 ExhaleHeap Mask@@6)) (and (HasDirectPerm Mask@@6 null pm_f) (IsPredicateField pm_f))) (= (MapType0Select Heap@@12 null (PredicateMaskField pm_f)) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))))
 :qid |stdinbpl.47:19|
 :skolemid |2|
 :pattern ( (IdenticalOnKnownLocations Heap@@12 ExhaleHeap Mask@@6) (IsPredicateField pm_f) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))
)))
(assert (forall ((arg0@@29 T@U) ) (! (let ((A@@0 (FieldTypeInv0 (type arg0@@29))))
(= (type (WandMaskField arg0@@29)) (FieldType A@@0 (MapType1Type RefType boolType))))
 :qid |funType:WandMaskField|
 :pattern ( (WandMaskField arg0@@29))
)))
(assert (forall ((Heap@@13 T@U) (ExhaleHeap@@0 T@U) (Mask@@7 T@U) (pm_f@@0 T@U) ) (! (let ((C@@0 (FieldTypeInv0 (type pm_f@@0))))
 (=> (and (and (and (and (and (= (type Heap@@13) (MapType0Type RefType)) (= (type ExhaleHeap@@0) (MapType0Type RefType))) (= (type Mask@@7) (MapType1Type RefType realType))) (= (type pm_f@@0) (FieldType C@@0 FrameTypeType))) (IdenticalOnKnownLocations Heap@@13 ExhaleHeap@@0 Mask@@7)) (and (HasDirectPerm Mask@@7 null pm_f@@0) (IsWandField pm_f@@0))) (= (MapType0Select Heap@@13 null (WandMaskField pm_f@@0)) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))))
 :qid |stdinbpl.60:19|
 :skolemid |5|
 :pattern ( (IdenticalOnKnownLocations Heap@@13 ExhaleHeap@@0 Mask@@7) (IsWandField pm_f@@0) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))
)))
(assert (forall ((Heap@@14 T@U) (z@@8 Int) ) (!  (=> (= (type Heap@@14) (MapType0Type RefType)) (dummyFunction (bool_2_U (|function1#triggerStateless| z@@8))))
 :qid |stdinbpl.469:15|
 :skolemid |87|
 :pattern ( (|function1'| Heap@@14 z@@8))
)))
(assert (forall ((Heap@@15 T@U) (b_2@@5 Bool) ) (!  (=> (= (type Heap@@15) (MapType0Type RefType)) (dummyFunction (bool_2_U (|function3#triggerStateless| b_2@@5))))
 :qid |stdinbpl.573:15|
 :skolemid |95|
 :pattern ( (|function3'| Heap@@15 b_2@@5))
)))
(assert (forall ((Heap@@16 T@U) (z@@9 Int) ) (!  (=> (= (type Heap@@16) (MapType0Type RefType)) (dummyFunction (bool_2_U (|function10#triggerStateless| z@@9))))
 :qid |stdinbpl.931:15|
 :skolemid |122|
 :pattern ( (|function10'| Heap@@16 z@@9))
)))
(assert  (and (and (and (and (and (and (forall ((arg0@@30 T@T) (arg1@@12 T@T) ) (! (= (Ctor (MapType2Type arg0@@30 arg1@@12)) 13)
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
)))))
(assert (forall ((Heap@@17 T@U) (s T@U) ) (!  (=> (and (= (type Heap@@17) (MapType0Type RefType)) (= (type s) (MapType2Type RefType boolType))) (dummyFunction (bool_2_U (|function11#triggerStateless| s))))
 :qid |stdinbpl.983:15|
 :skolemid |126|
 :pattern ( (|function11'| Heap@@17 s))
)))
(assert (forall ((arg0@@35 Int) (arg1@@17 Int) ) (! (= (type (|sk_function11#condqp1| arg0@@35 arg1@@17)) RefType)
 :qid |funType:sk_function11#condqp1|
 :pattern ( (|sk_function11#condqp1| arg0@@35 arg1@@17))
)))
(assert (forall ((Heap2Heap T@U) (Heap1Heap T@U) (s@@0 T@U) ) (!  (=> (and (and (and (= (type Heap2Heap) (MapType0Type RefType)) (= (type Heap1Heap) (MapType0Type RefType))) (= (type s@@0) (MapType2Type RefType boolType))) (and (=  (and (U_2_bool (MapType2Select s@@0 (|sk_function11#condqp1| (|function11#condqp1| Heap2Heap s@@0) (|function11#condqp1| Heap1Heap s@@0)))) (< NoPerm FullPerm))  (and (U_2_bool (MapType2Select s@@0 (|sk_function11#condqp1| (|function11#condqp1| Heap2Heap s@@0) (|function11#condqp1| Heap1Heap s@@0)))) (< NoPerm FullPerm))) (=> (and (U_2_bool (MapType2Select s@@0 (|sk_function11#condqp1| (|function11#condqp1| Heap2Heap s@@0) (|function11#condqp1| Heap1Heap s@@0)))) (< NoPerm FullPerm)) (= (U_2_int (MapType0Select Heap2Heap (|sk_function11#condqp1| (|function11#condqp1| Heap2Heap s@@0) (|function11#condqp1| Heap1Heap s@@0)) f_7)) (U_2_int (MapType0Select Heap1Heap (|sk_function11#condqp1| (|function11#condqp1| Heap2Heap s@@0) (|function11#condqp1| Heap1Heap s@@0)) f_7)))))) (= (|function11#condqp1| Heap2Heap s@@0) (|function11#condqp1| Heap1Heap s@@0)))
 :qid |stdinbpl.1006:15|
 :skolemid |129|
 :pattern ( (|function11#condqp1| Heap2Heap s@@0) (|function11#condqp1| Heap1Heap s@@0) (succHeapTrans Heap2Heap Heap1Heap))
)))
(assert (forall ((a@@1 T@U) (b@@1 T@U) (y@@5 T@U) ) (! (let ((T@@3 (type y@@5)))
 (=> (and (and (= (type a@@1) (MultiSetType T@@3)) (= (type b@@1) (MultiSetType T@@3))) (<= (|MultiSet#Select| a@@1 y@@5) (|MultiSet#Select| b@@1 y@@5))) (= (|MultiSet#Select| (|MultiSet#Difference| a@@1 b@@1) y@@5) 0)))
 :qid |stdinbpl.371:18|
 :skolemid |73|
 :pattern ( (|MultiSet#Difference| a@@1 b@@1) (|MultiSet#Select| b@@1 y@@5) (|MultiSet#Select| a@@1 y@@5))
)))
(assert (forall ((arg0@@36 T@U) (arg1@@18 T@U) ) (! (let ((T@@4 (MapType2TypeInv0 (type arg0@@36))))
(= (type (|Set#Union| arg0@@36 arg1@@18)) (MapType2Type T@@4 boolType)))
 :qid |funType:Set#Union|
 :pattern ( (|Set#Union| arg0@@36 arg1@@18))
)))
(assert (forall ((a@@2 T@U) (b@@2 T@U) ) (! (let ((T@@5 (MapType2TypeInv0 (type a@@2))))
 (=> (and (= (type a@@2) (MapType2Type T@@5 boolType)) (= (type b@@2) (MapType2Type T@@5 boolType))) (= (|Set#Union| (|Set#Union| a@@2 b@@2) b@@2) (|Set#Union| a@@2 b@@2))))
 :qid |stdinbpl.256:18|
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
 :qid |stdinbpl.260:18|
 :skolemid |40|
 :pattern ( (|Set#Intersection| (|Set#Intersection| a@@3 b@@3) b@@3))
)))
(assert (forall ((a@@4 T@U) (b@@4 T@U) ) (! (let ((T@@8 (MultiSetTypeInv0 (type a@@4))))
 (=> (and (= (type a@@4) (MultiSetType T@@8)) (= (type b@@4) (MultiSetType T@@8))) (= (|MultiSet#Intersection| (|MultiSet#Intersection| a@@4 b@@4) b@@4) (|MultiSet#Intersection| a@@4 b@@4))))
 :qid |stdinbpl.362:18|
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
 :qid |stdinbpl.225:18|
 :skolemid |27|
 :pattern ( (MapType2Select (|Set#Singleton| r) o))
)))
(assert (forall ((a@@5 T@U) (b@@5 T@U) ) (! (let ((T@@11 (MapType2TypeInv0 (type a@@5))))
 (=> (and (= (type a@@5) (MapType2Type T@@11 boolType)) (= (type b@@5) (MapType2Type T@@11 boolType))) (= (+ (|Set#Card| (|Set#Union| a@@5 b@@5)) (|Set#Card| (|Set#Intersection| a@@5 b@@5))) (+ (|Set#Card| a@@5) (|Set#Card| b@@5)))))
 :qid |stdinbpl.264:18|
 :skolemid |42|
 :pattern ( (|Set#Card| (|Set#Union| a@@5 b@@5)))
 :pattern ( (|Set#Card| (|Set#Intersection| a@@5 b@@5)))
)))
(assert (forall ((Heap@@18 T@U) (ExhaleHeap@@1 T@U) (Mask@@8 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@18) (MapType0Type RefType)) (= (type ExhaleHeap@@1) (MapType0Type RefType))) (= (type Mask@@8) (MapType1Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@18 ExhaleHeap@@1 Mask@@8)) (U_2_bool (MapType0Select Heap@@18 o_1 $allocated))) (U_2_bool (MapType0Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.73:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@18 ExhaleHeap@@1 Mask@@8) (MapType0Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert (forall ((a@@6 Int) ) (!  (=> (<= 0 a@@6) (= (|Math#clip| a@@6) a@@6))
 :qid |stdinbpl.307:15|
 :skolemid |54|
 :pattern ( (|Math#clip| a@@6))
)))
(assert (forall ((a@@7 T@U) (b@@6 T@U) (o@@0 T@U) ) (! (let ((T@@12 (type o@@0)))
 (=> (and (= (type a@@7) (MultiSetType T@@12)) (= (type b@@6) (MultiSetType T@@12))) (= (|MultiSet#Select| (|MultiSet#Intersection| a@@7 b@@6) o@@0) (|Math#min| (|MultiSet#Select| a@@7 o@@0) (|MultiSet#Select| b@@6 o@@0)))))
 :qid |stdinbpl.358:18|
 :skolemid |69|
 :pattern ( (|MultiSet#Select| (|MultiSet#Intersection| a@@7 b@@6) o@@0))
)))
(assert (forall ((Heap@@19 T@U) (Mask@@9 T@U) (s@@1 T@U) ) (!  (=> (and (and (and (= (type Heap@@19) (MapType0Type RefType)) (= (type Mask@@9) (MapType1Type RefType realType))) (= (type s@@1) (MapType2Type RefType boolType))) (and (state Heap@@19 Mask@@9) (< AssumeFunctionsAbove 6))) (function11 Heap@@19 s@@1))
 :qid |stdinbpl.989:15|
 :skolemid |127|
 :pattern ( (state Heap@@19 Mask@@9) (function11 Heap@@19 s@@1))
)))
(assert (forall ((Heap@@20 T@U) (ExhaleHeap@@2 T@U) (Mask@@10 T@U) (o_1@@0 T@U) (f_2 T@U) ) (! (let ((B@@1 (FieldTypeInv1 (type f_2))))
(let ((A@@1 (FieldTypeInv0 (type f_2))))
 (=> (and (and (and (and (and (and (= (type Heap@@20) (MapType0Type RefType)) (= (type ExhaleHeap@@2) (MapType0Type RefType))) (= (type Mask@@10) (MapType1Type RefType realType))) (= (type o_1@@0) RefType)) (= (type f_2) (FieldType A@@1 B@@1))) (IdenticalOnKnownLocations Heap@@20 ExhaleHeap@@2 Mask@@10)) (HasDirectPerm Mask@@10 o_1@@0 f_2)) (= (MapType0Select Heap@@20 o_1@@0 f_2) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2)))))
 :qid |stdinbpl.42:22|
 :skolemid |1|
 :pattern ( (IdenticalOnKnownLocations Heap@@20 ExhaleHeap@@2 Mask@@10) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2))
)))
(assert  (and (= (type dummyHeap) (MapType0Type RefType)) (= (type ZeroMask) (MapType1Type RefType realType))))
(assert (state dummyHeap ZeroMask))
(assert (forall ((arg0@@39 T@U) (arg1@@20 T@U) ) (! (let ((T@@13 (type arg1@@20)))
(= (type (|MultiSet#UnionOne| arg0@@39 arg1@@20)) (MultiSetType T@@13)))
 :qid |funType:MultiSet#UnionOne|
 :pattern ( (|MultiSet#UnionOne| arg0@@39 arg1@@20))
)))
(assert (forall ((a@@8 T@U) (x@@10 T@U) ) (! (let ((T@@14 (type x@@10)))
 (=> (= (type a@@8) (MultiSetType T@@14)) (= (|MultiSet#Card| (|MultiSet#UnionOne| a@@8 x@@10)) (+ (|MultiSet#Card| a@@8) 1))))
 :qid |stdinbpl.344:18|
 :skolemid |65|
 :pattern ( (|MultiSet#Card| (|MultiSet#UnionOne| a@@8 x@@10)))
 :pattern ( (|MultiSet#UnionOne| a@@8 x@@10) (|MultiSet#Card| a@@8))
)))
(assert (forall ((a@@9 T@U) (b@@7 T@U) ) (! (let ((T@@15 (MultiSetTypeInv0 (type a@@9))))
 (=> (and (= (type a@@9) (MultiSetType T@@15)) (= (type b@@7) (MultiSetType T@@15))) (= (|MultiSet#Disjoint| a@@9 b@@7) (forall ((o@@1 T@U) ) (!  (=> (= (type o@@1) T@@15) (or (= (|MultiSet#Select| a@@9 o@@1) 0) (= (|MultiSet#Select| b@@7 o@@1) 0)))
 :qid |stdinbpl.394:39|
 :skolemid |80|
 :pattern ( (|MultiSet#Select| a@@9 o@@1))
 :pattern ( (|MultiSet#Select| b@@7 o@@1))
)))))
 :qid |stdinbpl.393:18|
 :skolemid |81|
 :pattern ( (|MultiSet#Disjoint| a@@9 b@@7))
)))
(assert (forall ((p T@U) (v_1 T@U) (w T@U) ) (! (let ((A@@2 (FieldTypeInv0 (type p))))
 (=> (and (and (= (type p) (FieldType A@@2 FrameTypeType)) (= (type v_1) FrameTypeType)) (= (type w) FrameTypeType)) (not (InsidePredicate p v_1 p w))))
 :qid |stdinbpl.202:19|
 :skolemid |21|
 :pattern ( (InsidePredicate p v_1 p w))
)))
(assert (forall ((arg0@@40 T@U) ) (! (let ((T@@16 (type arg0@@40)))
(= (type (|MultiSet#Singleton| arg0@@40)) (MultiSetType T@@16)))
 :qid |funType:MultiSet#Singleton|
 :pattern ( (|MultiSet#Singleton| arg0@@40))
)))
(assert (forall ((r@@0 T@U) ) (!  (and (= (|MultiSet#Card| (|MultiSet#Singleton| r@@0)) 1) (= (|MultiSet#Select| (|MultiSet#Singleton| r@@0) r@@0) 1))
 :qid |stdinbpl.336:18|
 :skolemid |62|
 :pattern ( (|MultiSet#Singleton| r@@0))
)))
(assert  (not (IsPredicateField f_7)))
(assert  (not (IsWandField f_7)))
(assert (forall ((Heap@@21 T@U) (ExhaleHeap@@3 T@U) (Mask@@11 T@U) ) (!  (=> (and (and (and (= (type Heap@@21) (MapType0Type RefType)) (= (type ExhaleHeap@@3) (MapType0Type RefType))) (= (type Mask@@11) (MapType1Type RefType realType))) (IdenticalOnKnownLocations Heap@@21 ExhaleHeap@@3 Mask@@11)) (succHeap Heap@@21 ExhaleHeap@@3))
 :qid |stdinbpl.83:15|
 :skolemid |10|
 :pattern ( (IdenticalOnKnownLocations Heap@@21 ExhaleHeap@@3 Mask@@11))
)))
(assert (forall ((a@@10 T@U) (b@@8 T@U) ) (! (let ((T@@17 (MapType2TypeInv0 (type a@@10))))
 (=> (and (= (type a@@10) (MapType2Type T@@17 boolType)) (= (type b@@8) (MapType2Type T@@17 boolType))) (= (|Set#Equal| a@@10 b@@8) (forall ((o@@2 T@U) ) (!  (=> (= (type o@@2) T@@17) (= (U_2_bool (MapType2Select a@@10 o@@2)) (U_2_bool (MapType2Select b@@8 o@@2))))
 :qid |stdinbpl.289:31|
 :skolemid |48|
 :pattern ( (MapType2Select a@@10 o@@2))
 :pattern ( (MapType2Select b@@8 o@@2))
)))))
 :qid |stdinbpl.288:17|
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
 :qid |stdinbpl.354:18|
 :skolemid |68|
 :pattern ( (|MultiSet#Card| (|MultiSet#Union| a@@11 b@@9)))
 :pattern ( (|MultiSet#Card| a@@11) (|MultiSet#Union| a@@11 b@@9))
 :pattern ( (|MultiSet#Card| b@@9) (|MultiSet#Union| a@@11 b@@9))
)))
(assert (forall ((arg0@@41 Real) (arg1@@21 T@U) ) (! (= (type (ConditionalFrame arg0@@41 arg1@@21)) FrameTypeType)
 :qid |funType:ConditionalFrame|
 :pattern ( (ConditionalFrame arg0@@41 arg1@@21))
)))
(assert (forall ((p@@0 Real) (f_6 T@U) ) (!  (=> (= (type f_6) FrameTypeType) (= (ConditionalFrame p@@0 f_6) (ite (> p@@0 0.0) f_6 EmptyFrame)))
 :qid |stdinbpl.190:15|
 :skolemid |19|
 :pattern ( (ConditionalFrame p@@0 f_6))
)))
(assert (forall ((Mask@@12 T@U) (o_2@@0 T@U) (f_4@@0 T@U) ) (! (let ((B@@3 (FieldTypeInv1 (type f_4@@0))))
(let ((A@@4 (FieldTypeInv0 (type f_4@@0))))
 (=> (and (and (= (type Mask@@12) (MapType1Type RefType realType)) (= (type o_2@@0) RefType)) (= (type f_4@@0) (FieldType A@@4 B@@3))) (= (HasDirectPerm Mask@@12 o_2@@0 f_4@@0) (> (U_2_real (MapType1Select Mask@@12 o_2@@0 f_4@@0)) NoPerm)))))
 :qid |stdinbpl.133:22|
 :skolemid |17|
 :pattern ( (HasDirectPerm Mask@@12 o_2@@0 f_4@@0))
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
 :qid |stdinbpl.253:18|
 :skolemid |37|
 :pattern ( (MapType2Select (|Set#Intersection| a@@12 b@@10) o@@3))
 :pattern ( (|Set#Intersection| a@@12 b@@10) (MapType2Select a@@12 o@@3))
 :pattern ( (|Set#Intersection| a@@12 b@@10) (MapType2Select b@@10 o@@3))
)))
(assert (forall ((arg0@@42 T@U) (arg1@@22 T@U) ) (! (let ((T@@20 (MapType2TypeInv0 (type arg0@@42))))
(= (type (|Set#Difference| arg0@@42 arg1@@22)) (MapType2Type T@@20 boolType)))
 :qid |funType:Set#Difference|
 :pattern ( (|Set#Difference| arg0@@42 arg1@@22))
)))
(assert (forall ((a@@13 T@U) (b@@11 T@U) (o@@4 T@U) ) (! (let ((T@@21 (type o@@4)))
 (=> (and (= (type a@@13) (MapType2Type T@@21 boolType)) (= (type b@@11) (MapType2Type T@@21 boolType))) (= (U_2_bool (MapType2Select (|Set#Difference| a@@13 b@@11) o@@4))  (and (U_2_bool (MapType2Select a@@13 o@@4)) (not (U_2_bool (MapType2Select b@@11 o@@4)))))))
 :qid |stdinbpl.268:18|
 :skolemid |43|
 :pattern ( (MapType2Select (|Set#Difference| a@@13 b@@11) o@@4))
 :pattern ( (|Set#Difference| a@@13 b@@11) (MapType2Select a@@13 o@@4))
)))
(assert (forall ((a@@14 T@U) (b@@12 T@U) ) (! (let ((T@@22 (MapType2TypeInv0 (type a@@14))))
 (=> (and (and (= (type a@@14) (MapType2Type T@@22 boolType)) (= (type b@@12) (MapType2Type T@@22 boolType))) (|Set#Equal| a@@14 b@@12)) (= a@@14 b@@12)))
 :qid |stdinbpl.290:17|
 :skolemid |50|
 :pattern ( (|Set#Equal| a@@14 b@@12))
)))
(assert (forall ((a@@15 T@U) (b@@13 T@U) ) (! (let ((T@@23 (MultiSetTypeInv0 (type a@@15))))
 (=> (and (and (= (type a@@15) (MultiSetType T@@23)) (= (type b@@13) (MultiSetType T@@23))) (|MultiSet#Equal| a@@15 b@@13)) (= a@@15 b@@13)))
 :qid |stdinbpl.389:17|
 :skolemid |79|
 :pattern ( (|MultiSet#Equal| a@@15 b@@13))
)))
(assert (forall ((arg0@@43 T@U) (arg1@@23 T@U) ) (! (let ((T@@24 (type arg1@@23)))
(= (type (|Set#UnionOne| arg0@@43 arg1@@23)) (MapType2Type T@@24 boolType)))
 :qid |funType:Set#UnionOne|
 :pattern ( (|Set#UnionOne| arg0@@43 arg1@@23))
)))
(assert (forall ((a@@16 T@U) (x@@11 T@U) (y@@6 T@U) ) (! (let ((T@@25 (type x@@11)))
 (=> (and (and (= (type a@@16) (MapType2Type T@@25 boolType)) (= (type y@@6) T@@25)) (U_2_bool (MapType2Select a@@16 y@@6))) (U_2_bool (MapType2Select (|Set#UnionOne| a@@16 x@@11) y@@6))))
 :qid |stdinbpl.233:18|
 :skolemid |31|
 :pattern ( (|Set#UnionOne| a@@16 x@@11) (MapType2Select a@@16 y@@6))
)))
(assert (forall ((a@@17 T@U) (b@@14 T@U) (y@@7 T@U) ) (! (let ((T@@26 (type y@@7)))
 (=> (and (and (= (type a@@17) (MapType2Type T@@26 boolType)) (= (type b@@14) (MapType2Type T@@26 boolType))) (U_2_bool (MapType2Select a@@17 y@@7))) (U_2_bool (MapType2Select (|Set#Union| a@@17 b@@14) y@@7))))
 :qid |stdinbpl.243:18|
 :skolemid |35|
 :pattern ( (|Set#Union| a@@17 b@@14) (MapType2Select a@@17 y@@7))
)))
(assert (forall ((a@@18 T@U) (b@@15 T@U) (y@@8 T@U) ) (! (let ((T@@27 (type y@@8)))
 (=> (and (and (= (type a@@18) (MapType2Type T@@27 boolType)) (= (type b@@15) (MapType2Type T@@27 boolType))) (U_2_bool (MapType2Select b@@15 y@@8))) (U_2_bool (MapType2Select (|Set#Union| a@@18 b@@15) y@@8))))
 :qid |stdinbpl.245:18|
 :skolemid |36|
 :pattern ( (|Set#Union| a@@18 b@@15) (MapType2Select b@@15 y@@8))
)))
(assert (forall ((ms T@U) (x@@12 T@U) ) (! (let ((T@@28 (type x@@12)))
 (=> (= (type ms) (MultiSetType T@@28)) (>= (|MultiSet#Select| ms x@@12) 0)))
 :qid |stdinbpl.320:18|
 :skolemid |56|
 :pattern ( (|MultiSet#Select| ms x@@12))
)))
(assert (forall ((a@@19 T@U) (x@@13 T@U) (o@@5 T@U) ) (! (let ((T@@29 (type x@@13)))
 (=> (and (= (type a@@19) (MapType2Type T@@29 boolType)) (= (type o@@5) T@@29)) (= (U_2_bool (MapType2Select (|Set#UnionOne| a@@19 x@@13) o@@5))  (or (= o@@5 x@@13) (U_2_bool (MapType2Select a@@19 o@@5))))))
 :qid |stdinbpl.229:18|
 :skolemid |29|
 :pattern ( (MapType2Select (|Set#UnionOne| a@@19 x@@13) o@@5))
)))
(assert (forall ((a@@20 T@U) (b@@16 T@U) (y@@9 T@U) ) (! (let ((T@@30 (type y@@9)))
 (=> (and (and (= (type a@@20) (MapType2Type T@@30 boolType)) (= (type b@@16) (MapType2Type T@@30 boolType))) (U_2_bool (MapType2Select b@@16 y@@9))) (not (U_2_bool (MapType2Select (|Set#Difference| a@@20 b@@16) y@@9)))))
 :qid |stdinbpl.270:18|
 :skolemid |44|
 :pattern ( (|Set#Difference| a@@20 b@@16) (MapType2Select b@@16 y@@9))
)))
(assert (forall ((Heap@@22 T@U) (Mask@@13 T@U) (z@@10 Int) ) (!  (=> (and (and (= (type Heap@@22) (MapType0Type RefType)) (= (type Mask@@13) (MapType1Type RefType realType))) (state Heap@@22 Mask@@13)) (= (|function1'| Heap@@22 z@@10) (|function1#frame| EmptyFrame z@@10)))
 :qid |stdinbpl.476:15|
 :skolemid |88|
 :pattern ( (state Heap@@22 Mask@@13) (|function1'| Heap@@22 z@@10))
)))
(assert (forall ((Heap@@23 T@U) (Mask@@14 T@U) (b_2@@6 Bool) ) (!  (=> (and (and (= (type Heap@@23) (MapType0Type RefType)) (= (type Mask@@14) (MapType1Type RefType realType))) (state Heap@@23 Mask@@14)) (= (|function3'| Heap@@23 b_2@@6) (|function3#frame| EmptyFrame b_2@@6)))
 :qid |stdinbpl.580:15|
 :skolemid |96|
 :pattern ( (state Heap@@23 Mask@@14) (|function3'| Heap@@23 b_2@@6))
)))
(assert (forall ((Heap@@24 T@U) (Mask@@15 T@U) (z@@11 Int) ) (!  (=> (and (and (= (type Heap@@24) (MapType0Type RefType)) (= (type Mask@@15) (MapType1Type RefType realType))) (state Heap@@24 Mask@@15)) (= (|function10'| Heap@@24 z@@11) (|function10#frame| EmptyFrame z@@11)))
 :qid |stdinbpl.938:15|
 :skolemid |123|
 :pattern ( (state Heap@@24 Mask@@15) (|function10'| Heap@@24 z@@11))
)))
(assert (forall ((a@@21 T@U) (b@@17 T@U) ) (! (let ((T@@31 (MapType2TypeInv0 (type a@@21))))
 (=> (and (= (type a@@21) (MapType2Type T@@31 boolType)) (= (type b@@17) (MapType2Type T@@31 boolType))) (and (= (+ (+ (|Set#Card| (|Set#Difference| a@@21 b@@17)) (|Set#Card| (|Set#Difference| b@@17 a@@21))) (|Set#Card| (|Set#Intersection| a@@21 b@@17))) (|Set#Card| (|Set#Union| a@@21 b@@17))) (= (|Set#Card| (|Set#Difference| a@@21 b@@17)) (- (|Set#Card| a@@21) (|Set#Card| (|Set#Intersection| a@@21 b@@17)))))))
 :qid |stdinbpl.272:18|
 :skolemid |45|
 :pattern ( (|Set#Card| (|Set#Difference| a@@21 b@@17)))
)))
(assert (forall ((s@@2 T@U) ) (! (let ((T@@32 (MapType2TypeInv0 (type s@@2))))
 (=> (= (type s@@2) (MapType2Type T@@32 boolType)) (<= 0 (|Set#Card| s@@2))))
 :qid |stdinbpl.215:18|
 :skolemid |22|
 :pattern ( (|Set#Card| s@@2))
)))
(assert (forall ((s@@3 T@U) ) (! (let ((T@@33 (MultiSetTypeInv0 (type s@@3))))
 (=> (= (type s@@3) (MultiSetType T@@33)) (<= 0 (|MultiSet#Card| s@@3))))
 :qid |stdinbpl.323:18|
 :skolemid |57|
 :pattern ( (|MultiSet#Card| s@@3))
)))
(assert (forall ((Heap@@25 T@U) (z@@12 Int) ) (!  (=> (= (type Heap@@25) (MapType0Type RefType)) (and (= (function1 Heap@@25 z@@12) (|function1'| Heap@@25 z@@12)) (dummyFunction (bool_2_U (|function1#triggerStateless| z@@12)))))
 :qid |stdinbpl.465:15|
 :skolemid |86|
 :pattern ( (function1 Heap@@25 z@@12))
)))
(assert (forall ((Heap@@26 T@U) (b_2@@7 Bool) ) (!  (=> (= (type Heap@@26) (MapType0Type RefType)) (and (= (function3 Heap@@26 b_2@@7) (|function3'| Heap@@26 b_2@@7)) (dummyFunction (bool_2_U (|function3#triggerStateless| b_2@@7)))))
 :qid |stdinbpl.569:15|
 :skolemid |94|
 :pattern ( (function3 Heap@@26 b_2@@7))
)))
(assert (forall ((Heap@@27 T@U) (z@@13 Int) ) (!  (=> (= (type Heap@@27) (MapType0Type RefType)) (and (= (function10 Heap@@27 z@@13) (|function10'| Heap@@27 z@@13)) (dummyFunction (bool_2_U (|function10#triggerStateless| z@@13)))))
 :qid |stdinbpl.927:15|
 :skolemid |121|
 :pattern ( (function10 Heap@@27 z@@13))
)))
(assert (forall ((Heap@@28 T@U) (s@@4 T@U) ) (!  (=> (and (= (type Heap@@28) (MapType0Type RefType)) (= (type s@@4) (MapType2Type RefType boolType))) (and (= (function11 Heap@@28 s@@4) (|function11'| Heap@@28 s@@4)) (dummyFunction (bool_2_U (|function11#triggerStateless| s@@4)))))
 :qid |stdinbpl.979:15|
 :skolemid |125|
 :pattern ( (function11 Heap@@28 s@@4))
)))
(assert (forall ((T@@34 T@T) ) (! (= (type (|MultiSet#Empty| T@@34)) (MultiSetType T@@34))
 :qid |funType:MultiSet#Empty|
 :pattern ( (|MultiSet#Empty| T@@34))
)))
(assert (forall ((o@@6 T@U) ) (! (let ((T@@35 (type o@@6)))
(= (|MultiSet#Select| (|MultiSet#Empty| T@@35) o@@6) 0))
 :qid |stdinbpl.328:18|
 :skolemid |58|
 :pattern ( (let ((T@@35 (type o@@6)))
(|MultiSet#Select| (|MultiSet#Empty| T@@35) o@@6)))
)))
(assert (forall ((Heap@@29 T@U) (Mask@@16 T@U) ) (!  (=> (and (and (= (type Heap@@29) (MapType0Type RefType)) (= (type Mask@@16) (MapType1Type RefType realType))) (state Heap@@29 Mask@@16)) (= (|function0'| Heap@@29) (|function0#frame| EmptyFrame)))
 :qid |stdinbpl.424:15|
 :skolemid |84|
 :pattern ( (state Heap@@29 Mask@@16) (|function0'| Heap@@29))
)))
(assert (forall ((Heap@@30 T@U) (Mask@@17 T@U) ) (!  (=> (and (and (= (type Heap@@30) (MapType0Type RefType)) (= (type Mask@@17) (MapType1Type RefType realType))) (state Heap@@30 Mask@@17)) (= (|function9'| Heap@@30) (|function9#frame| EmptyFrame)))
 :qid |stdinbpl.886:15|
 :skolemid |119|
 :pattern ( (state Heap@@30 Mask@@17) (|function9'| Heap@@30))
)))
(assert (forall ((a@@22 T@U) (x@@14 T@U) ) (! (let ((T@@36 (type x@@14)))
 (=> (= (type a@@22) (MapType2Type T@@36 boolType)) (U_2_bool (MapType2Select (|Set#UnionOne| a@@22 x@@14) x@@14))))
 :qid |stdinbpl.231:18|
 :skolemid |30|
 :pattern ( (|Set#UnionOne| a@@22 x@@14))
)))
(assert (forall ((Heap@@31 T@U) (ExhaleHeap@@4 T@U) (Mask@@18 T@U) (pm_f@@1 T@U) ) (! (let ((C@@1 (FieldTypeInv0 (type pm_f@@1))))
 (=> (and (and (and (and (and (= (type Heap@@31) (MapType0Type RefType)) (= (type ExhaleHeap@@4) (MapType0Type RefType))) (= (type Mask@@18) (MapType1Type RefType realType))) (= (type pm_f@@1) (FieldType C@@1 FrameTypeType))) (IdenticalOnKnownLocations Heap@@31 ExhaleHeap@@4 Mask@@18)) (and (HasDirectPerm Mask@@18 null pm_f@@1) (IsPredicateField pm_f@@1))) (forall ((o2 T@U) (f_2@@0 T@U) ) (! (let ((B@@5 (FieldTypeInv1 (type f_2@@0))))
(let ((A@@6 (FieldTypeInv0 (type f_2@@0))))
 (=> (and (and (= (type o2) RefType) (= (type f_2@@0) (FieldType A@@6 B@@5))) (U_2_bool (MapType1Select (MapType0Select Heap@@31 null (PredicateMaskField pm_f@@1)) o2 f_2@@0))) (= (MapType0Select Heap@@31 o2 f_2@@0) (MapType0Select ExhaleHeap@@4 o2 f_2@@0)))))
 :qid |stdinbpl.54:134|
 :skolemid |3|
 :pattern ( (MapType0Select ExhaleHeap@@4 o2 f_2@@0))
))))
 :qid |stdinbpl.52:19|
 :skolemid |4|
 :pattern ( (IdenticalOnKnownLocations Heap@@31 ExhaleHeap@@4 Mask@@18) (IsPredicateField pm_f@@1))
)))
(assert (forall ((Heap@@32 T@U) (ExhaleHeap@@5 T@U) (Mask@@19 T@U) (pm_f@@2 T@U) ) (! (let ((C@@2 (FieldTypeInv0 (type pm_f@@2))))
 (=> (and (and (and (and (and (= (type Heap@@32) (MapType0Type RefType)) (= (type ExhaleHeap@@5) (MapType0Type RefType))) (= (type Mask@@19) (MapType1Type RefType realType))) (= (type pm_f@@2) (FieldType C@@2 FrameTypeType))) (IdenticalOnKnownLocations Heap@@32 ExhaleHeap@@5 Mask@@19)) (and (HasDirectPerm Mask@@19 null pm_f@@2) (IsWandField pm_f@@2))) (forall ((o2@@0 T@U) (f_2@@1 T@U) ) (! (let ((B@@6 (FieldTypeInv1 (type f_2@@1))))
(let ((A@@7 (FieldTypeInv0 (type f_2@@1))))
 (=> (and (and (= (type o2@@0) RefType) (= (type f_2@@1) (FieldType A@@7 B@@6))) (U_2_bool (MapType1Select (MapType0Select Heap@@32 null (WandMaskField pm_f@@2)) o2@@0 f_2@@1))) (= (MapType0Select Heap@@32 o2@@0 f_2@@1) (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1)))))
 :qid |stdinbpl.67:129|
 :skolemid |6|
 :pattern ( (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1))
))))
 :qid |stdinbpl.65:19|
 :skolemid |7|
 :pattern ( (IdenticalOnKnownLocations Heap@@32 ExhaleHeap@@5 Mask@@19) (IsWandField pm_f@@2))
)))
(assert (forall ((a@@23 T@U) (x@@15 T@U) ) (! (let ((T@@37 (type x@@15)))
 (=> (and (= (type a@@23) (MapType2Type T@@37 boolType)) (U_2_bool (MapType2Select a@@23 x@@15))) (= (|Set#Card| (|Set#UnionOne| a@@23 x@@15)) (|Set#Card| a@@23))))
 :qid |stdinbpl.235:18|
 :skolemid |32|
 :pattern ( (|Set#Card| (|Set#UnionOne| a@@23 x@@15)))
)))
(assert (forall ((a@@24 T@U) (x@@16 T@U) ) (! (let ((T@@38 (type x@@16)))
 (=> (= (type a@@24) (MultiSetType T@@38)) (and (> (|MultiSet#Select| (|MultiSet#UnionOne| a@@24 x@@16) x@@16) 0) (> (|MultiSet#Card| (|MultiSet#UnionOne| a@@24 x@@16)) 0))))
 :qid |stdinbpl.347:18|
 :skolemid |66|
 :pattern ( (|MultiSet#UnionOne| a@@24 x@@16))
)))
(assert (forall ((r@@1 T@U) ) (! (= (|Set#Card| (|Set#Singleton| r@@1)) 1)
 :qid |stdinbpl.226:18|
 :skolemid |28|
 :pattern ( (|Set#Card| (|Set#Singleton| r@@1)))
)))
(assert (forall ((Mask@@20 T@U) (o_2@@2 T@U) (f_4@@2 T@U) ) (! (let ((B@@7 (FieldTypeInv1 (type f_4@@2))))
(let ((A@@8 (FieldTypeInv0 (type f_4@@2))))
 (=> (and (and (and (= (type Mask@@20) (MapType1Type RefType realType)) (= (type o_2@@2) RefType)) (= (type f_4@@2) (FieldType A@@8 B@@7))) (GoodMask Mask@@20)) (and (>= (U_2_real (MapType1Select Mask@@20 o_2@@2 f_4@@2)) NoPerm) (=> (and (and (GoodMask Mask@@20) (not (IsPredicateField f_4@@2))) (not (IsWandField f_4@@2))) (<= (U_2_real (MapType1Select Mask@@20 o_2@@2 f_4@@2)) FullPerm))))))
 :qid |stdinbpl.128:22|
 :skolemid |16|
 :pattern ( (GoodMask Mask@@20) (MapType1Select Mask@@20 o_2@@2 f_4@@2))
)))
(assert (forall ((r@@2 T@U) ) (! (U_2_bool (MapType2Select (|Set#Singleton| r@@2) r@@2))
 :qid |stdinbpl.224:18|
 :skolemid |26|
 :pattern ( (|Set#Singleton| r@@2))
)))
(assert (forall ((Heap@@33 T@U) ) (!  (=> (= (type Heap@@33) (MapType0Type RefType)) (dummyFunction (bool_2_U |function0#triggerStateless|)))
 :qid |stdinbpl.417:15|
 :skolemid |83|
 :pattern ( (|function0'| Heap@@33))
)))
(assert (forall ((Heap@@34 T@U) ) (!  (=> (= (type Heap@@34) (MapType0Type RefType)) (dummyFunction (bool_2_U |function9#triggerStateless|)))
 :qid |stdinbpl.879:15|
 :skolemid |118|
 :pattern ( (|function9'| Heap@@34))
)))
(assert (forall ((a@@25 T@U) (b@@18 T@U) ) (! (let ((T@@39 (MapType2TypeInv0 (type a@@25))))
 (=> (and (= (type a@@25) (MapType2Type T@@39 boolType)) (= (type b@@18) (MapType2Type T@@39 boolType))) (= (|Set#Union| a@@25 (|Set#Union| a@@25 b@@18)) (|Set#Union| a@@25 b@@18))))
 :qid |stdinbpl.258:18|
 :skolemid |39|
 :pattern ( (|Set#Union| a@@25 (|Set#Union| a@@25 b@@18)))
)))
(assert (forall ((a@@26 T@U) (b@@19 T@U) ) (! (let ((T@@40 (MapType2TypeInv0 (type a@@26))))
 (=> (and (= (type a@@26) (MapType2Type T@@40 boolType)) (= (type b@@19) (MapType2Type T@@40 boolType))) (= (|Set#Intersection| a@@26 (|Set#Intersection| a@@26 b@@19)) (|Set#Intersection| a@@26 b@@19))))
 :qid |stdinbpl.262:18|
 :skolemid |41|
 :pattern ( (|Set#Intersection| a@@26 (|Set#Intersection| a@@26 b@@19)))
)))
(assert (forall ((a@@27 T@U) (b@@20 T@U) ) (! (let ((T@@41 (MultiSetTypeInv0 (type a@@27))))
 (=> (and (= (type a@@27) (MultiSetType T@@41)) (= (type b@@20) (MultiSetType T@@41))) (= (|MultiSet#Intersection| a@@27 (|MultiSet#Intersection| a@@27 b@@20)) (|MultiSet#Intersection| a@@27 b@@20))))
 :qid |stdinbpl.364:18|
 :skolemid |71|
 :pattern ( (|MultiSet#Intersection| a@@27 (|MultiSet#Intersection| a@@27 b@@20)))
)))
(assert (forall ((s@@5 T@U) ) (! (let ((T@@42 (MultiSetTypeInv0 (type s@@5))))
 (=> (= (type s@@5) (MultiSetType T@@42)) (and (= (= (|MultiSet#Card| s@@5) 0) (= s@@5 (|MultiSet#Empty| T@@42))) (=> (not (= (|MultiSet#Card| s@@5) 0)) (exists ((x@@17 T@U) ) (!  (and (= (type x@@17) T@@42) (< 0 (|MultiSet#Select| s@@5 x@@17)))
 :qid |stdinbpl.331:38|
 :skolemid |59|
 :no-pattern (type x@@17)
 :no-pattern (U_2_int x@@17)
 :no-pattern (U_2_bool x@@17)
))))))
 :qid |stdinbpl.329:18|
 :skolemid |60|
 :pattern ( (|MultiSet#Card| s@@5))
)))
(assert (forall ((r@@3 T@U) (o@@7 T@U) ) (! (let ((T@@43 (type r@@3)))
 (=> (= (type o@@7) T@@43) (and (= (= (|MultiSet#Select| (|MultiSet#Singleton| r@@3) o@@7) 1) (= r@@3 o@@7)) (= (= (|MultiSet#Select| (|MultiSet#Singleton| r@@3) o@@7) 0) (not (= r@@3 o@@7))))))
 :qid |stdinbpl.334:18|
 :skolemid |61|
 :pattern ( (|MultiSet#Select| (|MultiSet#Singleton| r@@3) o@@7))
)))
(assert (forall ((arg0@@44 T@U) ) (! (= (type (FrameFragment arg0@@44)) FrameTypeType)
 :qid |funType:FrameFragment|
 :pattern ( (FrameFragment arg0@@44))
)))
(assert (forall ((Heap@@35 T@U) (Mask@@21 T@U) (s@@6 T@U) ) (!  (=> (and (and (and (= (type Heap@@35) (MapType0Type RefType)) (= (type Mask@@21) (MapType1Type RefType realType))) (= (type s@@6) (MapType2Type RefType boolType))) (state Heap@@35 Mask@@21)) (= (|function11'| Heap@@35 s@@6) (|function11#frame| (FrameFragment (int_2_U (|function11#condqp1| Heap@@35 s@@6))) s@@6)))
 :qid |stdinbpl.996:15|
 :skolemid |128|
 :pattern ( (state Heap@@35 Mask@@21) (|function11'| Heap@@35 s@@6))
)))
(assert (forall ((o@@8 T@U) (f T@U) (Heap@@36 T@U) ) (!  (=> (and (and (and (= (type o@@8) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap@@36) (MapType0Type RefType))) (U_2_bool (MapType0Select Heap@@36 o@@8 $allocated))) (U_2_bool (MapType0Select Heap@@36 (MapType0Select Heap@@36 o@@8 f) $allocated)))
 :qid |stdinbpl.31:15|
 :skolemid |0|
 :pattern ( (MapType0Select Heap@@36 o@@8 f))
)))
(assert (forall ((a@@28 T@U) (b@@21 T@U) (o@@9 T@U) ) (! (let ((T@@44 (type o@@9)))
 (=> (and (= (type a@@28) (MultiSetType T@@44)) (= (type b@@21) (MultiSetType T@@44))) (= (|MultiSet#Select| (|MultiSet#Union| a@@28 b@@21) o@@9) (+ (|MultiSet#Select| a@@28 o@@9) (|MultiSet#Select| b@@21 o@@9)))))
 :qid |stdinbpl.352:18|
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
 :qid |stdinbpl.218:18|
 :skolemid |23|
 :pattern ( (let ((T@@46 (type o@@10)))
(MapType2Select (|Set#Empty| T@@46) o@@10)))
)))
(assert (forall ((r@@4 T@U) ) (! (let ((T@@47 (type r@@4)))
(= (|MultiSet#Singleton| r@@4) (|MultiSet#UnionOne| (|MultiSet#Empty| T@@47) r@@4)))
 :qid |stdinbpl.337:18|
 :skolemid |63|
 :pattern ( (|MultiSet#Singleton| r@@4))
)))
(assert (forall ((a@@29 Int) (b@@22 Int) ) (! (= (<= a@@29 b@@22) (= (|Math#min| a@@29 b@@22) a@@29))
 :qid |stdinbpl.302:15|
 :skolemid |51|
 :pattern ( (|Math#min| a@@29 b@@22))
)))
(assert (forall ((a@@30 Int) (b@@23 Int) ) (! (= (<= b@@23 a@@30) (= (|Math#min| a@@30 b@@23) b@@23))
 :qid |stdinbpl.303:15|
 :skolemid |52|
 :pattern ( (|Math#min| a@@30 b@@23))
)))
(assert (forall ((s@@7 T@U) ) (! (let ((T@@48 (MapType2TypeInv0 (type s@@7))))
 (=> (= (type s@@7) (MapType2Type T@@48 boolType)) (and (= (= (|Set#Card| s@@7) 0) (= s@@7 (|Set#Empty| T@@48))) (=> (not (= (|Set#Card| s@@7) 0)) (exists ((x@@18 T@U) ) (!  (and (= (type x@@18) T@@48) (U_2_bool (MapType2Select s@@7 x@@18)))
 :qid |stdinbpl.221:33|
 :skolemid |24|
 :no-pattern (type x@@18)
 :no-pattern (U_2_int x@@18)
 :no-pattern (U_2_bool x@@18)
))))))
 :qid |stdinbpl.219:18|
 :skolemid |25|
 :pattern ( (|Set#Card| s@@7))
)))
(assert (forall ((Heap@@37 T@U) (o@@11 T@U) (f_3 T@U) (v T@U) ) (! (let ((B@@8 (type v)))
(let ((A@@9 (FieldTypeInv0 (type f_3))))
 (=> (and (and (= (type Heap@@37) (MapType0Type RefType)) (= (type o@@11) RefType)) (= (type f_3) (FieldType A@@9 B@@8))) (succHeap Heap@@37 (MapType0Store Heap@@37 o@@11 f_3 v)))))
 :qid |stdinbpl.78:22|
 :skolemid |9|
 :pattern ( (MapType0Store Heap@@37 o@@11 f_3 v))
)))
(assert (forall ((a@@31 T@U) (b@@24 T@U) ) (! (let ((T@@49 (MapType2TypeInv0 (type a@@31))))
 (=> (and (= (type a@@31) (MapType2Type T@@49 boolType)) (= (type b@@24) (MapType2Type T@@49 boolType))) (= (|Set#Subset| a@@31 b@@24) (forall ((o@@12 T@U) ) (!  (=> (and (= (type o@@12) T@@49) (U_2_bool (MapType2Select a@@31 o@@12))) (U_2_bool (MapType2Select b@@24 o@@12)))
 :qid |stdinbpl.281:32|
 :skolemid |46|
 :pattern ( (MapType2Select a@@31 o@@12))
 :pattern ( (MapType2Select b@@24 o@@12))
)))))
 :qid |stdinbpl.280:17|
 :skolemid |47|
 :pattern ( (|Set#Subset| a@@31 b@@24))
)))
(assert (forall ((a@@32 T@U) (x@@19 T@U) ) (! (let ((T@@50 (type x@@19)))
 (=> (and (= (type a@@32) (MapType2Type T@@50 boolType)) (not (U_2_bool (MapType2Select a@@32 x@@19)))) (= (|Set#Card| (|Set#UnionOne| a@@32 x@@19)) (+ (|Set#Card| a@@32) 1))))
 :qid |stdinbpl.237:18|
 :skolemid |33|
 :pattern ( (|Set#Card| (|Set#UnionOne| a@@32 x@@19)))
)))
(assert (forall ((a@@33 T@U) (b@@25 T@U) (o@@13 T@U) ) (! (let ((T@@51 (type o@@13)))
 (=> (and (= (type a@@33) (MultiSetType T@@51)) (= (type b@@25) (MultiSetType T@@51))) (= (|MultiSet#Select| (|MultiSet#Difference| a@@33 b@@25) o@@13) (|Math#clip| (- (|MultiSet#Select| a@@33 o@@13) (|MultiSet#Select| b@@25 o@@13))))))
 :qid |stdinbpl.369:18|
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
 :qid |stdinbpl.197:25|
 :skolemid |20|
 :pattern ( (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r@@5 u))
)))
(assert (forall ((a@@34 Int) ) (!  (=> (< a@@34 0) (= (|Math#clip| a@@34) 0))
 :qid |stdinbpl.308:15|
 :skolemid |55|
 :pattern ( (|Math#clip| a@@34))
)))
(assert (forall ((Heap@@38 T@U) ) (!  (=> (= (type Heap@@38) (MapType0Type RefType)) (and (= (function0 Heap@@38) (|function0'| Heap@@38)) (dummyFunction (bool_2_U |function0#triggerStateless|))))
 :qid |stdinbpl.413:15|
 :skolemid |82|
 :pattern ( (function0 Heap@@38))
)))
(assert (forall ((Heap@@39 T@U) ) (!  (=> (= (type Heap@@39) (MapType0Type RefType)) (and (= (function9 Heap@@39) (|function9'| Heap@@39)) (dummyFunction (bool_2_U |function9#triggerStateless|))))
 :qid |stdinbpl.875:15|
 :skolemid |117|
 :pattern ( (function9 Heap@@39))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
(assert (forall ((a@@35 T@U) (x@@20 T@U) (o@@14 T@U) ) (! (let ((T@@52 (type x@@20)))
 (=> (and (= (type a@@35) (MultiSetType T@@52)) (= (type o@@14) T@@52)) (= (|MultiSet#Select| (|MultiSet#UnionOne| a@@35 x@@20) o@@14) (ite (= x@@20 o@@14) (+ (|MultiSet#Select| a@@35 o@@14) 1) (|MultiSet#Select| a@@35 o@@14)))))
 :qid |stdinbpl.341:18|
 :skolemid |64|
 :pattern ( (|MultiSet#Select| (|MultiSet#UnionOne| a@@35 x@@20) o@@14))
 :pattern ( (|MultiSet#UnionOne| a@@35 x@@20) (|MultiSet#Select| a@@35 o@@14))
)))
(assert (forall ((a@@36 T@U) (b@@26 T@U) ) (! (let ((T@@53 (MultiSetTypeInv0 (type a@@36))))
 (=> (and (= (type a@@36) (MultiSetType T@@53)) (= (type b@@26) (MultiSetType T@@53))) (= (|MultiSet#Equal| a@@36 b@@26) (forall ((o@@15 T@U) ) (!  (=> (= (type o@@15) T@@53) (= (|MultiSet#Select| a@@36 o@@15) (|MultiSet#Select| b@@26 o@@15)))
 :qid |stdinbpl.387:36|
 :skolemid |77|
 :pattern ( (|MultiSet#Select| a@@36 o@@15))
 :pattern ( (|MultiSet#Select| b@@26 o@@15))
)))))
 :qid |stdinbpl.386:17|
 :skolemid |78|
 :pattern ( (|MultiSet#Equal| a@@36 b@@26))
)))
(assert (forall ((a@@37 T@U) (b@@27 T@U) ) (! (let ((T@@54 (MultiSetTypeInv0 (type a@@37))))
 (=> (and (= (type a@@37) (MultiSetType T@@54)) (= (type b@@27) (MultiSetType T@@54))) (= (|MultiSet#Subset| a@@37 b@@27) (forall ((o@@16 T@U) ) (!  (=> (= (type o@@16) T@@54) (<= (|MultiSet#Select| a@@37 o@@16) (|MultiSet#Select| b@@27 o@@16)))
 :qid |stdinbpl.383:37|
 :skolemid |75|
 :pattern ( (|MultiSet#Select| a@@37 o@@16))
 :pattern ( (|MultiSet#Select| b@@27 o@@16))
)))))
 :qid |stdinbpl.382:17|
 :skolemid |76|
 :pattern ( (|MultiSet#Subset| a@@37 b@@27))
)))
(assert (forall ((a@@38 T@U) (b@@28 T@U) (o@@17 T@U) ) (! (let ((T@@55 (type o@@17)))
 (=> (and (= (type a@@38) (MapType2Type T@@55 boolType)) (= (type b@@28) (MapType2Type T@@55 boolType))) (= (U_2_bool (MapType2Select (|Set#Union| a@@38 b@@28) o@@17))  (or (U_2_bool (MapType2Select a@@38 o@@17)) (U_2_bool (MapType2Select b@@28 o@@17))))))
 :qid |stdinbpl.241:18|
 :skolemid |34|
 :pattern ( (MapType2Select (|Set#Union| a@@38 b@@28) o@@17))
)))
(assert (forall ((Heap@@40 T@U) (y@@10 Int) (z@@14 Int) ) (!  (=> (= (type Heap@@40) (MapType0Type RefType)) (and (= (function2 Heap@@40 y@@10 z@@14) (|function2'| Heap@@40 y@@10 z@@14)) (dummyFunction (bool_2_U (|function2#triggerStateless| y@@10 z@@14)))))
 :qid |stdinbpl.517:15|
 :skolemid |90|
 :pattern ( (function2 Heap@@40 y@@10 z@@14))
)))
(assert (forall ((Heap@@41 T@U) (b_2@@8 Bool) (c@@1 Bool) ) (!  (=> (= (type Heap@@41) (MapType0Type RefType)) (and (= (function4 Heap@@41 b_2@@8 c@@1) (|function4'| Heap@@41 b_2@@8 c@@1)) (dummyFunction (bool_2_U (|function4#triggerStateless| b_2@@8 c@@1)))))
 :qid |stdinbpl.621:15|
 :skolemid |98|
 :pattern ( (function4 Heap@@41 b_2@@8 c@@1))
)))
(assert (forall ((Heap@@42 T@U) (x@@21 Int) (y@@11 Int) ) (!  (=> (= (type Heap@@42) (MapType0Type RefType)) (and (= (function5 Heap@@42 x@@21 y@@11) (|function5'| Heap@@42 x@@21 y@@11)) (dummyFunction (bool_2_U (|function5#triggerStateless| x@@21 y@@11)))))
 :qid |stdinbpl.673:15|
 :skolemid |102|
 :pattern ( (function5 Heap@@42 x@@21 y@@11))
)))
(assert (forall ((Heap@@43 T@U) (z@@15 Int) (w_1@@1 Int) ) (!  (=> (= (type Heap@@43) (MapType0Type RefType)) (and (= (function6 Heap@@43 z@@15 w_1@@1) (|function6'| Heap@@43 z@@15 w_1@@1)) (dummyFunction (bool_2_U (|function6#triggerStateless| z@@15 w_1@@1)))))
 :qid |stdinbpl.717:15|
 :skolemid |105|
 :pattern ( (function6 Heap@@43 z@@15 w_1@@1))
)))
(assert (forall ((Heap@@44 T@U) (b_2@@9 Bool) (z@@16 Int) ) (!  (=> (= (type Heap@@44) (MapType0Type RefType)) (and (= (function7 Heap@@44 b_2@@9 z@@16) (|function7'| Heap@@44 b_2@@9 z@@16)) (dummyFunction (bool_2_U (|function7#triggerStateless| b_2@@9 z@@16)))))
 :qid |stdinbpl.778:15|
 :skolemid |110|
 :pattern ( (function7 Heap@@44 b_2@@9 z@@16))
)))
(assert (forall ((Heap@@45 T@U) (b_2@@10 Bool) (z@@17 Int) ) (!  (=> (= (type Heap@@45) (MapType0Type RefType)) (and (= (function8 Heap@@45 b_2@@10 z@@17) (|function8'| Heap@@45 b_2@@10 z@@17)) (dummyFunction (bool_2_U (|function8#triggerStateless| b_2@@10 z@@17)))))
 :qid |stdinbpl.823:15|
 :skolemid |113|
 :pattern ( (function8 Heap@@45 b_2@@10 z@@17))
)))
(push 1)
(declare-fun ControlFlow (Int Int) Int)
(set-info :boogie-vc-id |function9#definedness|)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 4) true)
))
(check-sat)
(pop 1)
; Valid
(get-info :rlimit)
