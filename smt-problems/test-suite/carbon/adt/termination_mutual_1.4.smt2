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
(declare-fun succHeap (T@U T@U) Bool)
(declare-fun MapType0Type (T@T) T@T)
(declare-fun RefType () T@T)
(declare-fun succHeapTrans (T@U T@U) Bool)
(declare-fun MapType0TypeInv0 (T@T) T@T)
(declare-fun FieldType (T@T T@T) T@T)
(declare-fun FieldTypeInv0 (T@T) T@T)
(declare-fun FieldTypeInv1 (T@T) T@T)
(declare-fun MapType0Select (T@U T@U T@U) T@U)
(declare-fun MapType0Store (T@U T@U T@U T@U) T@U)
(declare-fun bounded (T@U) Bool)
(declare-fun List1DomainTypeType () T@T)
(declare-fun List2DomainTypeType () T@T)
(declare-fun MList1DomainTypeType () T@T)
(declare-fun MList2DomainTypeType () T@T)
(declare-fun Triple1DomainTypeType () T@T)
(declare-fun Triple2DomainTypeType () T@T)
(declare-fun Triple3DomainTypeType () T@T)
(declare-fun state (T@U T@U) Bool)
(declare-fun len2Bad (T@U T@U) Int)
(declare-fun MapType1Type (T@T T@T) T@T)
(declare-fun AssumeFunctionsAbove () Int)
(declare-fun Empty () T@U)
(declare-fun |len2Bad'| (T@U T@U) Int)
(declare-fun MapType1TypeInv0 (T@T) T@T)
(declare-fun MapType1TypeInv1 (T@T) T@T)
(declare-fun MapType1Select (T@U T@U T@U) T@U)
(declare-fun MapType1Store (T@U T@U T@U T@U) T@U)
(declare-fun GoodMask (T@U) Bool)
(declare-fun IdenticalOnKnownLocations (T@U T@U T@U) Bool)
(declare-fun IsPredicateField (T@U) Bool)
(declare-fun null () T@U)
(declare-fun PredicateMaskField (T@U) T@U)
(declare-fun FrameTypeType () T@T)
(declare-fun HasDirectPerm (T@U T@U T@U) Bool)
(declare-fun IsWandField (T@U) Bool)
(declare-fun WandMaskField (T@U) T@U)
(declare-fun len1 (T@U T@U) Int)
(declare-fun get_List1_l (T@U) T@U)
(declare-fun |len1'| (T@U T@U) Int)
(declare-fun get_List2_l (T@U) T@U)
(declare-fun |len2'| (T@U T@U) Int)
(declare-fun dummyFunction (T@U) Bool)
(declare-fun |len2#triggerStateless| (T@U) Int)
(declare-fun |len2Bad#triggerStateless| (T@U) Int)
(declare-fun |len1#triggerStateless| (T@U) Int)
(declare-fun |len1Bad'| (T@U T@U) Int)
(declare-fun |len1Bad#triggerStateless| (T@U) Int)
(declare-fun |mlen2'| (T@U T@U) Int)
(declare-fun |mlen2#triggerStateless| (T@U) Int)
(declare-fun |tripleLen1'| (T@U T@U) Int)
(declare-fun |tripleLen1#triggerStateless| (T@U) Int)
(declare-fun |tripleLen2'| (T@U T@U) Int)
(declare-fun |tripleLen2#triggerStateless| (T@U) Int)
(declare-fun |tripleLen3'| (T@U T@U) Int)
(declare-fun |tripleLen3#triggerStateless| (T@U) Int)
(declare-fun |tripleLen1Bad'| (T@U T@U) Int)
(declare-fun |tripleLen1Bad#triggerStateless| (T@U) Int)
(declare-fun |tripleLen2Bad'| (T@U T@U) Int)
(declare-fun |tripleLen2Bad#triggerStateless| (T@U) Int)
(declare-fun |tripleLen3Bad'| (T@U T@U) Int)
(declare-fun |tripleLen3Bad#triggerStateless| (T@U) Int)
(declare-fun tripleLen1Bad (T@U T@U) Int)
(declare-fun Triple3_tag (T@U) Int)
(declare-fun get_Triple2_x (T@U) T@U)
(declare-fun get_Triple1_x (T@U) T@U)
(declare-fun List2_tag (T@U) Int)
(declare-fun get_List2_x (T@U) Int)
(declare-fun NonEmpty (Int T@U) T@U)
(declare-fun MList2_tag (T@U) Int)
(declare-fun get_MList2_y (T@U) Int)
(declare-fun get_MList2_l (T@U) T@U)
(declare-fun MEmpty () T@U)
(declare-fun MNonEmpty (Int T@U) T@U)
(declare-fun get_Triple3_i (T@U) Int)
(declare-fun triple3 (T@U) T@U)
(declare-fun get_Triple3_x (T@U) T@U)
(declare-fun nil (Int) T@U)
(declare-fun RList1 (Int T@U) T@U)
(declare-fun decreasing (T@U T@U) Bool)
(declare-fun MRList1 (Int T@U) T@U)
(declare-fun $allocated () T@U)
(declare-fun NormalFieldType () T@T)
(declare-fun len2 (T@U T@U) Int)
(declare-fun len1Bad (T@U T@U) Int)
(declare-fun mlen2 (T@U T@U) Int)
(declare-fun tripleLen1 (T@U T@U) Int)
(declare-fun tripleLen2 (T@U T@U) Int)
(declare-fun tripleLen3 (T@U T@U) Int)
(declare-fun tripleLen2Bad (T@U T@U) Int)
(declare-fun tripleLen3Bad (T@U T@U) Int)
(declare-fun get_MList1_y (T@U) T@U)
(declare-fun dummyHeap () T@U)
(declare-fun ZeroMask () T@U)
(declare-fun triple1 (T@U) T@U)
(declare-fun triple2 (T@U) T@U)
(declare-fun InsidePredicate (T@U T@U T@U T@U) Bool)
(declare-fun List1_tag (T@U) Int)
(declare-fun get_List1_x (T@U) Int)
(declare-fun MList1_tag (T@U) Int)
(declare-fun get_MList1_x (T@U) Int)
(declare-fun sumMask (T@U T@U T@U) Bool)
(declare-fun ConditionalFrame (Real T@U) T@U)
(declare-fun EmptyFrame () T@U)
(declare-fun NoPerm () Real)
(declare-fun FullPerm () Real)
(declare-fun |len2#frame| (T@U T@U) Int)
(declare-fun |len2Bad#frame| (T@U T@U) Int)
(declare-fun |len1#frame| (T@U T@U) Int)
(declare-fun |len1Bad#frame| (T@U T@U) Int)
(declare-fun |mlen2#frame| (T@U T@U) Int)
(declare-fun |tripleLen1#frame| (T@U T@U) Int)
(declare-fun |tripleLen2#frame| (T@U T@U) Int)
(declare-fun |tripleLen3#frame| (T@U T@U) Int)
(declare-fun |tripleLen1Bad#frame| (T@U T@U) Int)
(declare-fun |tripleLen2Bad#frame| (T@U T@U) Int)
(declare-fun |tripleLen3Bad#frame| (T@U T@U) Int)
(declare-fun Triple1_tag (T@U) Int)
(declare-fun Triple2_tag (T@U) Int)
(declare-fun ZeroPMask () T@U)
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
(assert  (and (and (and (and (and (and (and (and (and (forall ((arg0@@11 T@T) ) (! (= (Ctor (MapType0Type arg0@@11)) 6)
 :qid |ctor:MapType0Type|
)) (forall ((arg0@@12 T@T) ) (! (= (MapType0TypeInv0 (MapType0Type arg0@@12)) arg0@@12)
 :qid |typeInv:MapType0TypeInv0|
 :pattern ( (MapType0Type arg0@@12))
))) (forall ((arg0@@13 T@T) (arg1 T@T) ) (! (= (Ctor (FieldType arg0@@13 arg1)) 7)
 :qid |ctor:FieldType|
))) (forall ((arg0@@14 T@T) (arg1@@0 T@T) ) (! (= (FieldTypeInv0 (FieldType arg0@@14 arg1@@0)) arg0@@14)
 :qid |typeInv:FieldTypeInv0|
 :pattern ( (FieldType arg0@@14 arg1@@0))
))) (forall ((arg0@@15 T@T) (arg1@@1 T@T) ) (! (= (FieldTypeInv1 (FieldType arg0@@15 arg1@@1)) arg1@@1)
 :qid |typeInv:FieldTypeInv1|
 :pattern ( (FieldType arg0@@15 arg1@@1))
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
)))) (= (Ctor RefType) 8)))
(assert (forall ((Heap0 T@U) (Heap1 T@U) ) (!  (=> (and (and (= (type Heap0) (MapType0Type RefType)) (= (type Heap1) (MapType0Type RefType))) (succHeap Heap0 Heap1)) (succHeapTrans Heap0 Heap1))
 :qid |stdinbpl.88:15|
 :skolemid |11|
 :pattern ( (succHeap Heap0 Heap1))
)))
(assert (= (Ctor List1DomainTypeType) 9))
(assert (forall ((x_1 T@U) ) (!  (=> (= (type x_1) List1DomainTypeType) (bounded x_1))
 :qid |stdinbpl.264:15|
 :skolemid |28|
 :pattern ( (bounded x_1))
)))
(assert (= (Ctor List2DomainTypeType) 10))
(assert (forall ((x_1@@0 T@U) ) (!  (=> (= (type x_1@@0) List2DomainTypeType) (bounded x_1@@0))
 :qid |stdinbpl.341:15|
 :skolemid |35|
 :pattern ( (bounded x_1@@0))
)))
(assert (= (Ctor MList1DomainTypeType) 11))
(assert (forall ((x_1@@1 T@U) ) (!  (=> (= (type x_1@@1) MList1DomainTypeType) (bounded x_1@@1))
 :qid |stdinbpl.409:15|
 :skolemid |42|
 :pattern ( (bounded x_1@@1))
)))
(assert (= (Ctor MList2DomainTypeType) 12))
(assert (forall ((x_1@@2 T@U) ) (!  (=> (= (type x_1@@2) MList2DomainTypeType) (bounded x_1@@2))
 :qid |stdinbpl.486:15|
 :skolemid |49|
 :pattern ( (bounded x_1@@2))
)))
(assert (= (Ctor Triple1DomainTypeType) 13))
(assert (forall ((x_1@@3 T@U) ) (!  (=> (= (type x_1@@3) Triple1DomainTypeType) (bounded x_1@@3))
 :qid |stdinbpl.545:15|
 :skolemid |55|
 :pattern ( (bounded x_1@@3))
)))
(assert (= (Ctor Triple2DomainTypeType) 14))
(assert (forall ((x_1@@4 T@U) ) (!  (=> (= (type x_1@@4) Triple2DomainTypeType) (bounded x_1@@4))
 :qid |stdinbpl.604:15|
 :skolemid |61|
 :pattern ( (bounded x_1@@4))
)))
(assert (= (Ctor Triple3DomainTypeType) 15))
(assert (forall ((x_1@@5 T@U) ) (!  (=> (= (type x_1@@5) Triple3DomainTypeType) (bounded x_1@@5))
 :qid |stdinbpl.684:15|
 :skolemid |69|
 :pattern ( (bounded x_1@@5))
)))
(assert  (and (and (and (and (and (and (and (forall ((arg0@@18 T@T) (arg1@@4 T@T) ) (! (= (Ctor (MapType1Type arg0@@18 arg1@@4)) 16)
 :qid |ctor:MapType1Type|
)) (forall ((arg0@@19 T@T) (arg1@@5 T@T) ) (! (= (MapType1TypeInv0 (MapType1Type arg0@@19 arg1@@5)) arg0@@19)
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
)))) (= (type Empty) List2DomainTypeType)))
(assert (forall ((Heap T@U) (Mask T@U) (l_1 T@U) ) (!  (=> (and (and (and (= (type Heap) (MapType0Type RefType)) (= (type Mask) (MapType1Type RefType realType))) (= (type l_1) List2DomainTypeType)) (and (state Heap Mask) (< AssumeFunctionsAbove 0))) (= (len2Bad Heap l_1) (ite (= l_1 Empty) 0 (+ 1 (|len2Bad'| Heap l_1)))))
 :qid |stdinbpl.769:15|
 :skolemid |76|
 :pattern ( (state Heap Mask) (len2Bad Heap l_1))
)))
(assert (forall ((Heap@@0 T@U) (Mask@@0 T@U) ) (!  (=> (and (and (= (type Heap@@0) (MapType0Type RefType)) (= (type Mask@@0) (MapType1Type RefType realType))) (state Heap@@0 Mask@@0)) (GoodMask Mask@@0))
 :qid |stdinbpl.124:15|
 :skolemid |15|
 :pattern ( (state Heap@@0 Mask@@0))
)))
(assert (forall ((Heap0@@0 T@U) (Heap1@@0 T@U) (Heap2 T@U) ) (!  (=> (and (and (and (= (type Heap0@@0) (MapType0Type RefType)) (= (type Heap1@@0) (MapType0Type RefType))) (= (type Heap2) (MapType0Type RefType))) (and (succHeapTrans Heap0@@0 Heap1@@0) (succHeap Heap1@@0 Heap2))) (succHeapTrans Heap0@@0 Heap2))
 :qid |stdinbpl.93:15|
 :skolemid |12|
 :pattern ( (succHeapTrans Heap0@@0 Heap1@@0) (succHeap Heap1@@0 Heap2))
)))
(assert  (and (and (= (Ctor FrameTypeType) 17) (= (type null) RefType)) (forall ((arg0@@23 T@U) ) (! (let ((A (FieldTypeInv0 (type arg0@@23))))
(= (type (PredicateMaskField arg0@@23)) (FieldType A (MapType1Type RefType boolType))))
 :qid |funType:PredicateMaskField|
 :pattern ( (PredicateMaskField arg0@@23))
))))
(assert (forall ((Heap@@1 T@U) (ExhaleHeap T@U) (Mask@@1 T@U) (pm_f T@U) ) (! (let ((C (FieldTypeInv0 (type pm_f))))
 (=> (and (and (and (and (and (= (type Heap@@1) (MapType0Type RefType)) (= (type ExhaleHeap) (MapType0Type RefType))) (= (type Mask@@1) (MapType1Type RefType realType))) (= (type pm_f) (FieldType C FrameTypeType))) (IdenticalOnKnownLocations Heap@@1 ExhaleHeap Mask@@1)) (and (HasDirectPerm Mask@@1 null pm_f) (IsPredicateField pm_f))) (= (MapType0Select Heap@@1 null (PredicateMaskField pm_f)) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))))
 :qid |stdinbpl.47:19|
 :skolemid |2|
 :pattern ( (IdenticalOnKnownLocations Heap@@1 ExhaleHeap Mask@@1) (IsPredicateField pm_f) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))
)))
(assert (forall ((arg0@@24 T@U) ) (! (let ((A@@0 (FieldTypeInv0 (type arg0@@24))))
(= (type (WandMaskField arg0@@24)) (FieldType A@@0 (MapType1Type RefType boolType))))
 :qid |funType:WandMaskField|
 :pattern ( (WandMaskField arg0@@24))
)))
(assert (forall ((Heap@@2 T@U) (ExhaleHeap@@0 T@U) (Mask@@2 T@U) (pm_f@@0 T@U) ) (! (let ((C@@0 (FieldTypeInv0 (type pm_f@@0))))
 (=> (and (and (and (and (and (= (type Heap@@2) (MapType0Type RefType)) (= (type ExhaleHeap@@0) (MapType0Type RefType))) (= (type Mask@@2) (MapType1Type RefType realType))) (= (type pm_f@@0) (FieldType C@@0 FrameTypeType))) (IdenticalOnKnownLocations Heap@@2 ExhaleHeap@@0 Mask@@2)) (and (HasDirectPerm Mask@@2 null pm_f@@0) (IsWandField pm_f@@0))) (= (MapType0Select Heap@@2 null (WandMaskField pm_f@@0)) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))))
 :qid |stdinbpl.60:19|
 :skolemid |5|
 :pattern ( (IdenticalOnKnownLocations Heap@@2 ExhaleHeap@@0 Mask@@2) (IsWandField pm_f@@0) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))
)))
(assert  (and (forall ((arg0@@25 T@U) ) (! (= (type (get_List1_l arg0@@25)) List2DomainTypeType)
 :qid |funType:get_List1_l|
 :pattern ( (get_List1_l arg0@@25))
)) (forall ((arg0@@26 T@U) ) (! (= (type (get_List2_l arg0@@26)) List1DomainTypeType)
 :qid |funType:get_List2_l|
 :pattern ( (get_List2_l arg0@@26))
))))
(assert (forall ((Heap@@3 T@U) (Mask@@3 T@U) (l_1@@0 T@U) ) (!  (=> (and (and (and (= (type Heap@@3) (MapType0Type RefType)) (= (type Mask@@3) (MapType1Type RefType realType))) (= (type l_1@@0) List1DomainTypeType)) (and (state Heap@@3 Mask@@3) (< AssumeFunctionsAbove 9))) (= (len1 Heap@@3 l_1@@0) (ite (= (get_List1_l l_1@@0) Empty) 0 (+ 1 (|len1'| Heap@@3 (get_List2_l (get_List1_l l_1@@0)))))))
 :qid |stdinbpl.832:15|
 :skolemid |80|
 :pattern ( (state Heap@@3 Mask@@3) (len1 Heap@@3 l_1@@0))
)))
(assert (forall ((Heap@@4 T@U) (l_1@@1 T@U) ) (!  (=> (and (= (type Heap@@4) (MapType0Type RefType)) (= (type l_1@@1) List2DomainTypeType)) (dummyFunction (int_2_U (|len2#triggerStateless| l_1@@1))))
 :qid |stdinbpl.700:15|
 :skolemid |71|
 :pattern ( (|len2'| Heap@@4 l_1@@1))
)))
(assert (forall ((Heap@@5 T@U) (l_1@@2 T@U) ) (!  (=> (and (= (type Heap@@5) (MapType0Type RefType)) (= (type l_1@@2) List2DomainTypeType)) (dummyFunction (int_2_U (|len2Bad#triggerStateless| l_1@@2))))
 :qid |stdinbpl.763:15|
 :skolemid |75|
 :pattern ( (|len2Bad'| Heap@@5 l_1@@2))
)))
(assert (forall ((Heap@@6 T@U) (l_1@@3 T@U) ) (!  (=> (and (= (type Heap@@6) (MapType0Type RefType)) (= (type l_1@@3) List1DomainTypeType)) (dummyFunction (int_2_U (|len1#triggerStateless| l_1@@3))))
 :qid |stdinbpl.826:15|
 :skolemid |79|
 :pattern ( (|len1'| Heap@@6 l_1@@3))
)))
(assert (forall ((Heap@@7 T@U) (l_1@@4 T@U) ) (!  (=> (and (= (type Heap@@7) (MapType0Type RefType)) (= (type l_1@@4) List1DomainTypeType)) (dummyFunction (int_2_U (|len1Bad#triggerStateless| l_1@@4))))
 :qid |stdinbpl.889:15|
 :skolemid |83|
 :pattern ( (|len1Bad'| Heap@@7 l_1@@4))
)))
(assert (forall ((Heap@@8 T@U) (l_1@@5 T@U) ) (!  (=> (and (= (type Heap@@8) (MapType0Type RefType)) (= (type l_1@@5) MList2DomainTypeType)) (dummyFunction (int_2_U (|mlen2#triggerStateless| l_1@@5))))
 :qid |stdinbpl.952:15|
 :skolemid |87|
 :pattern ( (|mlen2'| Heap@@8 l_1@@5))
)))
(assert (forall ((Heap@@9 T@U) (t_2 T@U) ) (!  (=> (and (= (type Heap@@9) (MapType0Type RefType)) (= (type t_2) Triple1DomainTypeType)) (dummyFunction (int_2_U (|tripleLen1#triggerStateless| t_2))))
 :qid |stdinbpl.1015:15|
 :skolemid |91|
 :pattern ( (|tripleLen1'| Heap@@9 t_2))
)))
(assert (forall ((Heap@@10 T@U) (t_2@@0 T@U) ) (!  (=> (and (= (type Heap@@10) (MapType0Type RefType)) (= (type t_2@@0) Triple2DomainTypeType)) (dummyFunction (int_2_U (|tripleLen2#triggerStateless| t_2@@0))))
 :qid |stdinbpl.1078:15|
 :skolemid |95|
 :pattern ( (|tripleLen2'| Heap@@10 t_2@@0))
)))
(assert (forall ((Heap@@11 T@U) (t_2@@1 T@U) ) (!  (=> (and (= (type Heap@@11) (MapType0Type RefType)) (= (type t_2@@1) Triple3DomainTypeType)) (dummyFunction (int_2_U (|tripleLen3#triggerStateless| t_2@@1))))
 :qid |stdinbpl.1141:15|
 :skolemid |99|
 :pattern ( (|tripleLen3'| Heap@@11 t_2@@1))
)))
(assert (forall ((Heap@@12 T@U) (t_2@@2 T@U) ) (!  (=> (and (= (type Heap@@12) (MapType0Type RefType)) (= (type t_2@@2) Triple1DomainTypeType)) (dummyFunction (int_2_U (|tripleLen1Bad#triggerStateless| t_2@@2))))
 :qid |stdinbpl.1204:15|
 :skolemid |103|
 :pattern ( (|tripleLen1Bad'| Heap@@12 t_2@@2))
)))
(assert (forall ((Heap@@13 T@U) (t_2@@3 T@U) ) (!  (=> (and (= (type Heap@@13) (MapType0Type RefType)) (= (type t_2@@3) Triple2DomainTypeType)) (dummyFunction (int_2_U (|tripleLen2Bad#triggerStateless| t_2@@3))))
 :qid |stdinbpl.1267:15|
 :skolemid |107|
 :pattern ( (|tripleLen2Bad'| Heap@@13 t_2@@3))
)))
(assert (forall ((Heap@@14 T@U) (t_2@@4 T@U) ) (!  (=> (and (= (type Heap@@14) (MapType0Type RefType)) (= (type t_2@@4) Triple3DomainTypeType)) (dummyFunction (int_2_U (|tripleLen3Bad#triggerStateless| t_2@@4))))
 :qid |stdinbpl.1330:15|
 :skolemid |111|
 :pattern ( (|tripleLen3Bad'| Heap@@14 t_2@@4))
)))
(assert  (and (forall ((arg0@@27 T@U) ) (! (= (type (get_Triple2_x arg0@@27)) Triple3DomainTypeType)
 :qid |funType:get_Triple2_x|
 :pattern ( (get_Triple2_x arg0@@27))
)) (forall ((arg0@@28 T@U) ) (! (= (type (get_Triple1_x arg0@@28)) Triple2DomainTypeType)
 :qid |funType:get_Triple1_x|
 :pattern ( (get_Triple1_x arg0@@28))
))))
(assert (forall ((Heap@@15 T@U) (Mask@@4 T@U) (t_2@@5 T@U) ) (!  (=> (and (and (and (= (type Heap@@15) (MapType0Type RefType)) (= (type Mask@@4) (MapType1Type RefType realType))) (= (type t_2@@5) Triple1DomainTypeType)) (and (state Heap@@15 Mask@@4) (< AssumeFunctionsAbove 6))) (= (tripleLen1Bad Heap@@15 t_2@@5) (+ 2 (ite (= (Triple3_tag (get_Triple2_x (get_Triple1_x t_2@@5))) 0) 0 (|tripleLen1Bad'| Heap@@15 t_2@@5)))))
 :qid |stdinbpl.1210:15|
 :skolemid |104|
 :pattern ( (state Heap@@15 Mask@@4) (tripleLen1Bad Heap@@15 t_2@@5))
)))
(assert (forall ((arg0@@29 Int) (arg1@@9 T@U) ) (! (= (type (NonEmpty arg0@@29 arg1@@9)) List2DomainTypeType)
 :qid |funType:NonEmpty|
 :pattern ( (NonEmpty arg0@@29 arg1@@9))
)))
(assert (forall ((t_2@@6 T@U) ) (!  (=> (= (type t_2@@6) List2DomainTypeType) (or (= t_2@@6 Empty) (= t_2@@6 (NonEmpty (get_List2_x t_2@@6) (get_List2_l t_2@@6)))))
 :qid |stdinbpl.313:15|
 :skolemid |32|
 :pattern ( (List2_tag t_2@@6))
 :pattern ( (get_List2_x t_2@@6))
 :pattern ( (get_List2_l t_2@@6))
)))
(assert  (and (and (forall ((arg0@@30 T@U) ) (! (= (type (get_MList2_l arg0@@30)) MList1DomainTypeType)
 :qid |funType:get_MList2_l|
 :pattern ( (get_MList2_l arg0@@30))
)) (= (type MEmpty) MList2DomainTypeType)) (forall ((arg0@@31 Int) (arg1@@10 T@U) ) (! (= (type (MNonEmpty arg0@@31 arg1@@10)) MList2DomainTypeType)
 :qid |funType:MNonEmpty|
 :pattern ( (MNonEmpty arg0@@31 arg1@@10))
))))
(assert (forall ((t_2@@7 T@U) ) (!  (=> (= (type t_2@@7) MList2DomainTypeType) (or (= t_2@@7 MEmpty) (= t_2@@7 (MNonEmpty (get_MList2_y t_2@@7) (get_MList2_l t_2@@7)))))
 :qid |stdinbpl.458:15|
 :skolemid |46|
 :pattern ( (MList2_tag t_2@@7))
 :pattern ( (get_MList2_y t_2@@7))
 :pattern ( (get_MList2_l t_2@@7))
)))
(assert  (and (and (forall ((arg0@@32 T@U) ) (! (= (type (triple3 arg0@@32)) Triple3DomainTypeType)
 :qid |funType:triple3|
 :pattern ( (triple3 arg0@@32))
)) (forall ((arg0@@33 T@U) ) (! (= (type (get_Triple3_x arg0@@33)) Triple1DomainTypeType)
 :qid |funType:get_Triple3_x|
 :pattern ( (get_Triple3_x arg0@@33))
))) (forall ((arg0@@34 Int) ) (! (= (type (nil arg0@@34)) Triple3DomainTypeType)
 :qid |funType:nil|
 :pattern ( (nil arg0@@34))
))))
(assert (forall ((t_2@@8 T@U) ) (!  (=> (= (type t_2@@8) Triple3DomainTypeType) (or (= t_2@@8 (triple3 (get_Triple3_x t_2@@8))) (= t_2@@8 (nil (get_Triple3_i t_2@@8)))))
 :qid |stdinbpl.656:15|
 :skolemid |66|
 :pattern ( (Triple3_tag t_2@@8))
 :pattern ( (get_Triple3_i t_2@@8))
)))
(assert (forall ((arg0@@35 Int) (arg1@@11 T@U) ) (! (= (type (RList1 arg0@@35 arg1@@11)) List1DomainTypeType)
 :qid |funType:RList1|
 :pattern ( (RList1 arg0@@35 arg1@@11))
)))
(assert (forall ((l_1_1 T@U) (x_0 Int) (x_1@@6 Int) ) (!  (=> (= (type l_1_1) List1DomainTypeType) (decreasing l_1_1 (RList1 x_1@@6 (NonEmpty x_0 l_1_1))))
 :qid |stdinbpl.252:15|
 :skolemid |26|
 :pattern ( (RList1 x_1@@6 (NonEmpty x_0 l_1_1)))
)))
(assert (forall ((l_1_1@@0 T@U) (x_0@@0 Int) (x_1@@7 Int) ) (!  (=> (= (type l_1_1@@0) List2DomainTypeType) (decreasing l_1_1@@0 (NonEmpty x_1@@7 (RList1 x_0@@0 l_1_1@@0))))
 :qid |stdinbpl.329:15|
 :skolemid |33|
 :pattern ( (NonEmpty x_1@@7 (RList1 x_0@@0 l_1_1@@0)))
)))
(assert (forall ((arg0@@36 Int) (arg1@@12 T@U) ) (! (= (type (MRList1 arg0@@36 arg1@@12)) MList1DomainTypeType)
 :qid |funType:MRList1|
 :pattern ( (MRList1 arg0@@36 arg1@@12))
)))
(assert (forall ((l_1_1@@1 T@U) (y_0 Int) (x_1@@8 Int) ) (!  (=> (= (type l_1_1@@1) MList1DomainTypeType) (decreasing l_1_1@@1 (MRList1 x_1@@8 (MNonEmpty y_0 l_1_1@@1))))
 :qid |stdinbpl.397:15|
 :skolemid |40|
 :pattern ( (MRList1 x_1@@8 (MNonEmpty y_0 l_1_1@@1)))
)))
(assert (forall ((y_1_1 T@U) (x_0@@1 Int) (y_1 Int) ) (!  (=> (= (type y_1_1) MList2DomainTypeType) (decreasing y_1_1 (MNonEmpty y_1 (MRList1 x_0@@1 y_1_1))))
 :qid |stdinbpl.474:15|
 :skolemid |47|
 :pattern ( (MNonEmpty y_1 (MRList1 x_0@@1 y_1_1)))
)))
(assert  (and (= (Ctor NormalFieldType) 18) (= (type $allocated) (FieldType NormalFieldType boolType))))
(assert (forall ((Heap@@16 T@U) (ExhaleHeap@@1 T@U) (Mask@@5 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@16) (MapType0Type RefType)) (= (type ExhaleHeap@@1) (MapType0Type RefType))) (= (type Mask@@5) (MapType1Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@16 ExhaleHeap@@1 Mask@@5)) (U_2_bool (MapType0Select Heap@@16 o_1 $allocated))) (U_2_bool (MapType0Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.73:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@16 ExhaleHeap@@1 Mask@@5) (MapType0Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert (forall ((Heap@@17 T@U) (l_1@@6 T@U) ) (!  (=> (and (= (type Heap@@17) (MapType0Type RefType)) (= (type l_1@@6) List2DomainTypeType)) (and (= (len2 Heap@@17 l_1@@6) (|len2'| Heap@@17 l_1@@6)) (dummyFunction (int_2_U (|len2#triggerStateless| l_1@@6)))))
 :qid |stdinbpl.696:15|
 :skolemid |70|
 :pattern ( (len2 Heap@@17 l_1@@6))
)))
(assert (forall ((Heap@@18 T@U) (l_1@@7 T@U) ) (!  (=> (and (= (type Heap@@18) (MapType0Type RefType)) (= (type l_1@@7) List2DomainTypeType)) (and (= (len2Bad Heap@@18 l_1@@7) (|len2Bad'| Heap@@18 l_1@@7)) (dummyFunction (int_2_U (|len2Bad#triggerStateless| l_1@@7)))))
 :qid |stdinbpl.759:15|
 :skolemid |74|
 :pattern ( (len2Bad Heap@@18 l_1@@7))
)))
(assert (forall ((Heap@@19 T@U) (l_1@@8 T@U) ) (!  (=> (and (= (type Heap@@19) (MapType0Type RefType)) (= (type l_1@@8) List1DomainTypeType)) (and (= (len1 Heap@@19 l_1@@8) (|len1'| Heap@@19 l_1@@8)) (dummyFunction (int_2_U (|len1#triggerStateless| l_1@@8)))))
 :qid |stdinbpl.822:15|
 :skolemid |78|
 :pattern ( (len1 Heap@@19 l_1@@8))
)))
(assert (forall ((Heap@@20 T@U) (l_1@@9 T@U) ) (!  (=> (and (= (type Heap@@20) (MapType0Type RefType)) (= (type l_1@@9) List1DomainTypeType)) (and (= (len1Bad Heap@@20 l_1@@9) (|len1Bad'| Heap@@20 l_1@@9)) (dummyFunction (int_2_U (|len1Bad#triggerStateless| l_1@@9)))))
 :qid |stdinbpl.885:15|
 :skolemid |82|
 :pattern ( (len1Bad Heap@@20 l_1@@9))
)))
(assert (forall ((Heap@@21 T@U) (l_1@@10 T@U) ) (!  (=> (and (= (type Heap@@21) (MapType0Type RefType)) (= (type l_1@@10) MList2DomainTypeType)) (and (= (mlen2 Heap@@21 l_1@@10) (|mlen2'| Heap@@21 l_1@@10)) (dummyFunction (int_2_U (|mlen2#triggerStateless| l_1@@10)))))
 :qid |stdinbpl.948:15|
 :skolemid |86|
 :pattern ( (mlen2 Heap@@21 l_1@@10))
)))
(assert (forall ((Heap@@22 T@U) (t_2@@9 T@U) ) (!  (=> (and (= (type Heap@@22) (MapType0Type RefType)) (= (type t_2@@9) Triple1DomainTypeType)) (and (= (tripleLen1 Heap@@22 t_2@@9) (|tripleLen1'| Heap@@22 t_2@@9)) (dummyFunction (int_2_U (|tripleLen1#triggerStateless| t_2@@9)))))
 :qid |stdinbpl.1011:15|
 :skolemid |90|
 :pattern ( (tripleLen1 Heap@@22 t_2@@9))
)))
(assert (forall ((Heap@@23 T@U) (t_2@@10 T@U) ) (!  (=> (and (= (type Heap@@23) (MapType0Type RefType)) (= (type t_2@@10) Triple2DomainTypeType)) (and (= (tripleLen2 Heap@@23 t_2@@10) (|tripleLen2'| Heap@@23 t_2@@10)) (dummyFunction (int_2_U (|tripleLen2#triggerStateless| t_2@@10)))))
 :qid |stdinbpl.1074:15|
 :skolemid |94|
 :pattern ( (tripleLen2 Heap@@23 t_2@@10))
)))
(assert (forall ((Heap@@24 T@U) (t_2@@11 T@U) ) (!  (=> (and (= (type Heap@@24) (MapType0Type RefType)) (= (type t_2@@11) Triple3DomainTypeType)) (and (= (tripleLen3 Heap@@24 t_2@@11) (|tripleLen3'| Heap@@24 t_2@@11)) (dummyFunction (int_2_U (|tripleLen3#triggerStateless| t_2@@11)))))
 :qid |stdinbpl.1137:15|
 :skolemid |98|
 :pattern ( (tripleLen3 Heap@@24 t_2@@11))
)))
(assert (forall ((Heap@@25 T@U) (t_2@@12 T@U) ) (!  (=> (and (= (type Heap@@25) (MapType0Type RefType)) (= (type t_2@@12) Triple1DomainTypeType)) (and (= (tripleLen1Bad Heap@@25 t_2@@12) (|tripleLen1Bad'| Heap@@25 t_2@@12)) (dummyFunction (int_2_U (|tripleLen1Bad#triggerStateless| t_2@@12)))))
 :qid |stdinbpl.1200:15|
 :skolemid |102|
 :pattern ( (tripleLen1Bad Heap@@25 t_2@@12))
)))
(assert (forall ((Heap@@26 T@U) (t_2@@13 T@U) ) (!  (=> (and (= (type Heap@@26) (MapType0Type RefType)) (= (type t_2@@13) Triple2DomainTypeType)) (and (= (tripleLen2Bad Heap@@26 t_2@@13) (|tripleLen2Bad'| Heap@@26 t_2@@13)) (dummyFunction (int_2_U (|tripleLen2Bad#triggerStateless| t_2@@13)))))
 :qid |stdinbpl.1263:15|
 :skolemid |106|
 :pattern ( (tripleLen2Bad Heap@@26 t_2@@13))
)))
(assert (forall ((Heap@@27 T@U) (t_2@@14 T@U) ) (!  (=> (and (= (type Heap@@27) (MapType0Type RefType)) (= (type t_2@@14) Triple3DomainTypeType)) (and (= (tripleLen3Bad Heap@@27 t_2@@14) (|tripleLen3Bad'| Heap@@27 t_2@@14)) (dummyFunction (int_2_U (|tripleLen3Bad#triggerStateless| t_2@@14)))))
 :qid |stdinbpl.1326:15|
 :skolemid |110|
 :pattern ( (tripleLen3Bad Heap@@27 t_2@@14))
)))
(assert (forall ((Heap@@28 T@U) (Mask@@6 T@U) (l_1@@11 T@U) ) (!  (=> (and (and (and (= (type Heap@@28) (MapType0Type RefType)) (= (type Mask@@6) (MapType1Type RefType realType))) (= (type l_1@@11) List2DomainTypeType)) (and (state Heap@@28 Mask@@6) (< AssumeFunctionsAbove 5))) (= (len2 Heap@@28 l_1@@11) (ite (= l_1@@11 Empty) 0 (+ 1 (|len2'| Heap@@28 (get_List1_l (get_List2_l l_1@@11)))))))
 :qid |stdinbpl.706:15|
 :skolemid |72|
 :pattern ( (state Heap@@28 Mask@@6) (len2 Heap@@28 l_1@@11))
)))
(assert (forall ((arg0@@37 T@U) ) (! (= (type (get_MList1_y arg0@@37)) MList2DomainTypeType)
 :qid |funType:get_MList1_y|
 :pattern ( (get_MList1_y arg0@@37))
)))
(assert (forall ((Heap@@29 T@U) (Mask@@7 T@U) (l_1@@12 T@U) ) (!  (=> (and (and (and (= (type Heap@@29) (MapType0Type RefType)) (= (type Mask@@7) (MapType1Type RefType realType))) (= (type l_1@@12) MList2DomainTypeType)) (and (state Heap@@29 Mask@@7) (< AssumeFunctionsAbove 7))) (= (mlen2 Heap@@29 l_1@@12) (ite (= l_1@@12 MEmpty) 0 (+ 1 (|mlen2'| Heap@@29 (get_MList1_y (get_MList2_l l_1@@12)))))))
 :qid |stdinbpl.958:15|
 :skolemid |88|
 :pattern ( (state Heap@@29 Mask@@7) (mlen2 Heap@@29 l_1@@12))
)))
(assert (forall ((Heap@@30 T@U) (Mask@@8 T@U) (t_2@@15 T@U) ) (!  (=> (and (and (and (= (type Heap@@30) (MapType0Type RefType)) (= (type Mask@@8) (MapType1Type RefType realType))) (= (type t_2@@15) Triple2DomainTypeType)) (and (state Heap@@30 Mask@@8) (< AssumeFunctionsAbove 1))) (= (tripleLen2 Heap@@30 t_2@@15) (+ 1 (ite (= (Triple3_tag (get_Triple2_x t_2@@15)) 0) 0 (+ 1 (|tripleLen2'| Heap@@30 (get_Triple1_x (get_Triple3_x (get_Triple2_x t_2@@15)))))))))
 :qid |stdinbpl.1084:15|
 :skolemid |96|
 :pattern ( (state Heap@@30 Mask@@8) (tripleLen2 Heap@@30 t_2@@15))
)))
(assert (= (List2_tag Empty) 0))
(assert (= (MList2_tag MEmpty) 0))
(assert (forall ((Heap@@31 T@U) (ExhaleHeap@@2 T@U) (Mask@@9 T@U) (o_1@@0 T@U) (f_2 T@U) ) (! (let ((B@@1 (FieldTypeInv1 (type f_2))))
(let ((A@@1 (FieldTypeInv0 (type f_2))))
 (=> (and (and (and (and (and (and (= (type Heap@@31) (MapType0Type RefType)) (= (type ExhaleHeap@@2) (MapType0Type RefType))) (= (type Mask@@9) (MapType1Type RefType realType))) (= (type o_1@@0) RefType)) (= (type f_2) (FieldType A@@1 B@@1))) (IdenticalOnKnownLocations Heap@@31 ExhaleHeap@@2 Mask@@9)) (HasDirectPerm Mask@@9 o_1@@0 f_2)) (= (MapType0Select Heap@@31 o_1@@0 f_2) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2)))))
 :qid |stdinbpl.42:22|
 :skolemid |1|
 :pattern ( (IdenticalOnKnownLocations Heap@@31 ExhaleHeap@@2 Mask@@9) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2))
)))
(assert  (and (= (type dummyHeap) (MapType0Type RefType)) (= (type ZeroMask) (MapType1Type RefType realType))))
(assert (state dummyHeap ZeroMask))
(assert  (and (forall ((arg0@@38 T@U) ) (! (= (type (triple1 arg0@@38)) Triple1DomainTypeType)
 :qid |funType:triple1|
 :pattern ( (triple1 arg0@@38))
)) (forall ((arg0@@39 T@U) ) (! (= (type (triple2 arg0@@39)) Triple2DomainTypeType)
 :qid |funType:triple2|
 :pattern ( (triple2 arg0@@39))
))))
(assert (forall ((x_2 T@U) ) (!  (=> (= (type x_2) Triple1DomainTypeType) (decreasing x_2 (triple1 (triple2 (triple3 x_2)))))
 :qid |stdinbpl.533:15|
 :skolemid |53|
 :pattern ( (triple1 (triple2 (triple3 x_2))))
)))
(assert (forall ((x_2@@0 T@U) ) (!  (=> (= (type x_2@@0) Triple2DomainTypeType) (decreasing x_2@@0 (triple2 (triple3 (triple1 x_2@@0)))))
 :qid |stdinbpl.592:15|
 :skolemid |59|
 :pattern ( (triple2 (triple3 (triple1 x_2@@0))))
)))
(assert (forall ((x_2@@1 T@U) ) (!  (=> (= (type x_2@@1) Triple3DomainTypeType) (decreasing x_2@@1 (triple3 (triple1 (triple2 x_2@@1)))))
 :qid |stdinbpl.669:15|
 :skolemid |67|
 :pattern ( (triple3 (triple1 (triple2 x_2@@1))))
)))
(assert (forall ((p T@U) (v_1 T@U) (w T@U) ) (! (let ((A@@2 (FieldTypeInv0 (type p))))
 (=> (and (and (= (type p) (FieldType A@@2 FrameTypeType)) (= (type v_1) FrameTypeType)) (= (type w) FrameTypeType)) (not (InsidePredicate p v_1 p w))))
 :qid |stdinbpl.183:19|
 :skolemid |21|
 :pattern ( (InsidePredicate p v_1 p w))
)))
(assert (forall ((Heap@@32 T@U) (ExhaleHeap@@3 T@U) (Mask@@10 T@U) ) (!  (=> (and (and (and (= (type Heap@@32) (MapType0Type RefType)) (= (type ExhaleHeap@@3) (MapType0Type RefType))) (= (type Mask@@10) (MapType1Type RefType realType))) (IdenticalOnKnownLocations Heap@@32 ExhaleHeap@@3 Mask@@10)) (succHeap Heap@@32 ExhaleHeap@@3))
 :qid |stdinbpl.83:15|
 :skolemid |10|
 :pattern ( (IdenticalOnKnownLocations Heap@@32 ExhaleHeap@@3 Mask@@10))
)))
(assert (forall ((t_2@@16 T@U) ) (!  (=> (= (type t_2@@16) List1DomainTypeType) (= t_2@@16 (RList1 (get_List1_x t_2@@16) (get_List1_l t_2@@16))))
 :qid |stdinbpl.239:15|
 :skolemid |25|
 :pattern ( (List1_tag t_2@@16))
 :pattern ( (get_List1_x t_2@@16))
 :pattern ( (get_List1_l t_2@@16))
)))
(assert (forall ((t_2@@17 T@U) ) (!  (=> (= (type t_2@@17) MList1DomainTypeType) (= t_2@@17 (MRList1 (get_MList1_x t_2@@17) (get_MList1_y t_2@@17))))
 :qid |stdinbpl.384:15|
 :skolemid |39|
 :pattern ( (MList1_tag t_2@@17))
 :pattern ( (get_MList1_x t_2@@17))
 :pattern ( (get_MList1_y t_2@@17))
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
(assert  (and (forall ((arg0@@40 Real) (arg1@@13 T@U) ) (! (= (type (ConditionalFrame arg0@@40 arg1@@13)) FrameTypeType)
 :qid |funType:ConditionalFrame|
 :pattern ( (ConditionalFrame arg0@@40 arg1@@13))
)) (= (type EmptyFrame) FrameTypeType)))
(assert (forall ((p@@0 Real) (f_6 T@U) ) (!  (=> (= (type f_6) FrameTypeType) (= (ConditionalFrame p@@0 f_6) (ite (> p@@0 0.0) f_6 EmptyFrame)))
 :qid |stdinbpl.171:15|
 :skolemid |19|
 :pattern ( (ConditionalFrame p@@0 f_6))
)))
(assert (forall ((Mask@@11 T@U) (o_2@@0 T@U) (f_4@@0 T@U) ) (! (let ((B@@3 (FieldTypeInv1 (type f_4@@0))))
(let ((A@@4 (FieldTypeInv0 (type f_4@@0))))
 (=> (and (and (= (type Mask@@11) (MapType1Type RefType realType)) (= (type o_2@@0) RefType)) (= (type f_4@@0) (FieldType A@@4 B@@3))) (= (HasDirectPerm Mask@@11 o_2@@0 f_4@@0) (> (U_2_real (MapType1Select Mask@@11 o_2@@0 f_4@@0)) NoPerm)))))
 :qid |stdinbpl.133:22|
 :skolemid |17|
 :pattern ( (HasDirectPerm Mask@@11 o_2@@0 f_4@@0))
)))
(assert (forall ((Heap@@33 T@U) (Mask@@12 T@U) (t_2@@18 T@U) ) (!  (=> (and (and (and (= (type Heap@@33) (MapType0Type RefType)) (= (type Mask@@12) (MapType1Type RefType realType))) (= (type t_2@@18) Triple1DomainTypeType)) (and (state Heap@@33 Mask@@12) (< AssumeFunctionsAbove 8))) (= (tripleLen1 Heap@@33 t_2@@18) (+ 2 (ite (= (Triple3_tag (get_Triple2_x (get_Triple1_x t_2@@18))) 0) 0 (|tripleLen1'| Heap@@33 (get_Triple3_x (get_Triple2_x (get_Triple1_x t_2@@18))))))))
 :qid |stdinbpl.1021:15|
 :skolemid |92|
 :pattern ( (state Heap@@33 Mask@@12) (tripleLen1 Heap@@33 t_2@@18))
)))
(assert (forall ((Heap@@34 T@U) (Mask@@13 T@U) (t_2@@19 T@U) ) (!  (=> (and (and (and (= (type Heap@@34) (MapType0Type RefType)) (= (type Mask@@13) (MapType1Type RefType realType))) (= (type t_2@@19) Triple3DomainTypeType)) (and (state Heap@@34 Mask@@13) (< AssumeFunctionsAbove 10))) (= (tripleLen3Bad Heap@@34 t_2@@19) (ite (= (Triple3_tag t_2@@19) 0) 0 (+ 3 (|tripleLen3Bad'| Heap@@34 t_2@@19)))))
 :qid |stdinbpl.1336:15|
 :skolemid |112|
 :pattern ( (state Heap@@34 Mask@@13) (tripleLen3Bad Heap@@34 t_2@@19))
)))
(assert (forall ((o_2@@1 T@U) (f_4@@1 T@U) ) (! (let ((B@@4 (FieldTypeInv1 (type f_4@@1))))
(let ((A@@5 (FieldTypeInv0 (type f_4@@1))))
 (=> (and (= (type o_2@@1) RefType) (= (type f_4@@1) (FieldType A@@5 B@@4))) (= (U_2_real (MapType1Select ZeroMask o_2@@1 f_4@@1)) NoPerm))))
 :qid |stdinbpl.106:22|
 :skolemid |13|
 :pattern ( (MapType1Select ZeroMask o_2@@1 f_4@@1))
)))
(assert (forall ((Heap@@35 T@U) (ExhaleHeap@@4 T@U) (Mask@@14 T@U) (pm_f@@1 T@U) ) (! (let ((C@@1 (FieldTypeInv0 (type pm_f@@1))))
 (=> (and (and (and (and (and (= (type Heap@@35) (MapType0Type RefType)) (= (type ExhaleHeap@@4) (MapType0Type RefType))) (= (type Mask@@14) (MapType1Type RefType realType))) (= (type pm_f@@1) (FieldType C@@1 FrameTypeType))) (IdenticalOnKnownLocations Heap@@35 ExhaleHeap@@4 Mask@@14)) (and (HasDirectPerm Mask@@14 null pm_f@@1) (IsPredicateField pm_f@@1))) (forall ((o2 T@U) (f_2@@0 T@U) ) (! (let ((B@@5 (FieldTypeInv1 (type f_2@@0))))
(let ((A@@6 (FieldTypeInv0 (type f_2@@0))))
 (=> (and (and (= (type o2) RefType) (= (type f_2@@0) (FieldType A@@6 B@@5))) (U_2_bool (MapType1Select (MapType0Select Heap@@35 null (PredicateMaskField pm_f@@1)) o2 f_2@@0))) (= (MapType0Select Heap@@35 o2 f_2@@0) (MapType0Select ExhaleHeap@@4 o2 f_2@@0)))))
 :qid |stdinbpl.54:134|
 :skolemid |3|
 :pattern ( (MapType0Select ExhaleHeap@@4 o2 f_2@@0))
))))
 :qid |stdinbpl.52:19|
 :skolemid |4|
 :pattern ( (IdenticalOnKnownLocations Heap@@35 ExhaleHeap@@4 Mask@@14) (IsPredicateField pm_f@@1))
)))
(assert (forall ((Heap@@36 T@U) (ExhaleHeap@@5 T@U) (Mask@@15 T@U) (pm_f@@2 T@U) ) (! (let ((C@@2 (FieldTypeInv0 (type pm_f@@2))))
 (=> (and (and (and (and (and (= (type Heap@@36) (MapType0Type RefType)) (= (type ExhaleHeap@@5) (MapType0Type RefType))) (= (type Mask@@15) (MapType1Type RefType realType))) (= (type pm_f@@2) (FieldType C@@2 FrameTypeType))) (IdenticalOnKnownLocations Heap@@36 ExhaleHeap@@5 Mask@@15)) (and (HasDirectPerm Mask@@15 null pm_f@@2) (IsWandField pm_f@@2))) (forall ((o2@@0 T@U) (f_2@@1 T@U) ) (! (let ((B@@6 (FieldTypeInv1 (type f_2@@1))))
(let ((A@@7 (FieldTypeInv0 (type f_2@@1))))
 (=> (and (and (= (type o2@@0) RefType) (= (type f_2@@1) (FieldType A@@7 B@@6))) (U_2_bool (MapType1Select (MapType0Select Heap@@36 null (WandMaskField pm_f@@2)) o2@@0 f_2@@1))) (= (MapType0Select Heap@@36 o2@@0 f_2@@1) (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1)))))
 :qid |stdinbpl.67:129|
 :skolemid |6|
 :pattern ( (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1))
))))
 :qid |stdinbpl.65:19|
 :skolemid |7|
 :pattern ( (IdenticalOnKnownLocations Heap@@36 ExhaleHeap@@5 Mask@@15) (IsWandField pm_f@@2))
)))
(assert (forall ((Mask@@16 T@U) (o_2@@2 T@U) (f_4@@2 T@U) ) (! (let ((B@@7 (FieldTypeInv1 (type f_4@@2))))
(let ((A@@8 (FieldTypeInv0 (type f_4@@2))))
 (=> (and (and (and (= (type Mask@@16) (MapType1Type RefType realType)) (= (type o_2@@2) RefType)) (= (type f_4@@2) (FieldType A@@8 B@@7))) (GoodMask Mask@@16)) (and (>= (U_2_real (MapType1Select Mask@@16 o_2@@2 f_4@@2)) NoPerm) (=> (and (and (GoodMask Mask@@16) (not (IsPredicateField f_4@@2))) (not (IsWandField f_4@@2))) (<= (U_2_real (MapType1Select Mask@@16 o_2@@2 f_4@@2)) FullPerm))))))
 :qid |stdinbpl.128:22|
 :skolemid |16|
 :pattern ( (GoodMask Mask@@16) (MapType1Select Mask@@16 o_2@@2 f_4@@2))
)))
(assert (forall ((Heap@@37 T@U) (Mask@@17 T@U) (l_1@@13 T@U) ) (!  (=> (and (and (and (= (type Heap@@37) (MapType0Type RefType)) (= (type Mask@@17) (MapType1Type RefType realType))) (= (type l_1@@13) List2DomainTypeType)) (state Heap@@37 Mask@@17)) (= (|len2'| Heap@@37 l_1@@13) (|len2#frame| EmptyFrame l_1@@13)))
 :qid |stdinbpl.713:15|
 :skolemid |73|
 :pattern ( (state Heap@@37 Mask@@17) (|len2'| Heap@@37 l_1@@13))
)))
(assert (forall ((Heap@@38 T@U) (Mask@@18 T@U) (l_1@@14 T@U) ) (!  (=> (and (and (and (= (type Heap@@38) (MapType0Type RefType)) (= (type Mask@@18) (MapType1Type RefType realType))) (= (type l_1@@14) List2DomainTypeType)) (state Heap@@38 Mask@@18)) (= (|len2Bad'| Heap@@38 l_1@@14) (|len2Bad#frame| EmptyFrame l_1@@14)))
 :qid |stdinbpl.776:15|
 :skolemid |77|
 :pattern ( (state Heap@@38 Mask@@18) (|len2Bad'| Heap@@38 l_1@@14))
)))
(assert (forall ((Heap@@39 T@U) (Mask@@19 T@U) (l_1@@15 T@U) ) (!  (=> (and (and (and (= (type Heap@@39) (MapType0Type RefType)) (= (type Mask@@19) (MapType1Type RefType realType))) (= (type l_1@@15) List1DomainTypeType)) (state Heap@@39 Mask@@19)) (= (|len1'| Heap@@39 l_1@@15) (|len1#frame| EmptyFrame l_1@@15)))
 :qid |stdinbpl.839:15|
 :skolemid |81|
 :pattern ( (state Heap@@39 Mask@@19) (|len1'| Heap@@39 l_1@@15))
)))
(assert (forall ((Heap@@40 T@U) (Mask@@20 T@U) (l_1@@16 T@U) ) (!  (=> (and (and (and (= (type Heap@@40) (MapType0Type RefType)) (= (type Mask@@20) (MapType1Type RefType realType))) (= (type l_1@@16) List1DomainTypeType)) (state Heap@@40 Mask@@20)) (= (|len1Bad'| Heap@@40 l_1@@16) (|len1Bad#frame| EmptyFrame l_1@@16)))
 :qid |stdinbpl.902:15|
 :skolemid |85|
 :pattern ( (state Heap@@40 Mask@@20) (|len1Bad'| Heap@@40 l_1@@16))
)))
(assert (forall ((Heap@@41 T@U) (Mask@@21 T@U) (l_1@@17 T@U) ) (!  (=> (and (and (and (= (type Heap@@41) (MapType0Type RefType)) (= (type Mask@@21) (MapType1Type RefType realType))) (= (type l_1@@17) MList2DomainTypeType)) (state Heap@@41 Mask@@21)) (= (|mlen2'| Heap@@41 l_1@@17) (|mlen2#frame| EmptyFrame l_1@@17)))
 :qid |stdinbpl.965:15|
 :skolemid |89|
 :pattern ( (state Heap@@41 Mask@@21) (|mlen2'| Heap@@41 l_1@@17))
)))
(assert (forall ((Heap@@42 T@U) (Mask@@22 T@U) (t_2@@20 T@U) ) (!  (=> (and (and (and (= (type Heap@@42) (MapType0Type RefType)) (= (type Mask@@22) (MapType1Type RefType realType))) (= (type t_2@@20) Triple1DomainTypeType)) (state Heap@@42 Mask@@22)) (= (|tripleLen1'| Heap@@42 t_2@@20) (|tripleLen1#frame| EmptyFrame t_2@@20)))
 :qid |stdinbpl.1028:15|
 :skolemid |93|
 :pattern ( (state Heap@@42 Mask@@22) (|tripleLen1'| Heap@@42 t_2@@20))
)))
(assert (forall ((Heap@@43 T@U) (Mask@@23 T@U) (t_2@@21 T@U) ) (!  (=> (and (and (and (= (type Heap@@43) (MapType0Type RefType)) (= (type Mask@@23) (MapType1Type RefType realType))) (= (type t_2@@21) Triple2DomainTypeType)) (state Heap@@43 Mask@@23)) (= (|tripleLen2'| Heap@@43 t_2@@21) (|tripleLen2#frame| EmptyFrame t_2@@21)))
 :qid |stdinbpl.1091:15|
 :skolemid |97|
 :pattern ( (state Heap@@43 Mask@@23) (|tripleLen2'| Heap@@43 t_2@@21))
)))
(assert (forall ((Heap@@44 T@U) (Mask@@24 T@U) (t_2@@22 T@U) ) (!  (=> (and (and (and (= (type Heap@@44) (MapType0Type RefType)) (= (type Mask@@24) (MapType1Type RefType realType))) (= (type t_2@@22) Triple3DomainTypeType)) (state Heap@@44 Mask@@24)) (= (|tripleLen3'| Heap@@44 t_2@@22) (|tripleLen3#frame| EmptyFrame t_2@@22)))
 :qid |stdinbpl.1154:15|
 :skolemid |101|
 :pattern ( (state Heap@@44 Mask@@24) (|tripleLen3'| Heap@@44 t_2@@22))
)))
(assert (forall ((Heap@@45 T@U) (Mask@@25 T@U) (t_2@@23 T@U) ) (!  (=> (and (and (and (= (type Heap@@45) (MapType0Type RefType)) (= (type Mask@@25) (MapType1Type RefType realType))) (= (type t_2@@23) Triple1DomainTypeType)) (state Heap@@45 Mask@@25)) (= (|tripleLen1Bad'| Heap@@45 t_2@@23) (|tripleLen1Bad#frame| EmptyFrame t_2@@23)))
 :qid |stdinbpl.1217:15|
 :skolemid |105|
 :pattern ( (state Heap@@45 Mask@@25) (|tripleLen1Bad'| Heap@@45 t_2@@23))
)))
(assert (forall ((Heap@@46 T@U) (Mask@@26 T@U) (t_2@@24 T@U) ) (!  (=> (and (and (and (= (type Heap@@46) (MapType0Type RefType)) (= (type Mask@@26) (MapType1Type RefType realType))) (= (type t_2@@24) Triple2DomainTypeType)) (state Heap@@46 Mask@@26)) (= (|tripleLen2Bad'| Heap@@46 t_2@@24) (|tripleLen2Bad#frame| EmptyFrame t_2@@24)))
 :qid |stdinbpl.1280:15|
 :skolemid |109|
 :pattern ( (state Heap@@46 Mask@@26) (|tripleLen2Bad'| Heap@@46 t_2@@24))
)))
(assert (forall ((Heap@@47 T@U) (Mask@@27 T@U) (t_2@@25 T@U) ) (!  (=> (and (and (and (= (type Heap@@47) (MapType0Type RefType)) (= (type Mask@@27) (MapType1Type RefType realType))) (= (type t_2@@25) Triple3DomainTypeType)) (state Heap@@47 Mask@@27)) (= (|tripleLen3Bad'| Heap@@47 t_2@@25) (|tripleLen3Bad#frame| EmptyFrame t_2@@25)))
 :qid |stdinbpl.1343:15|
 :skolemid |113|
 :pattern ( (state Heap@@47 Mask@@27) (|tripleLen3Bad'| Heap@@47 t_2@@25))
)))
(assert (forall ((o T@U) (f T@U) (Heap@@48 T@U) ) (!  (=> (and (and (and (= (type o) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap@@48) (MapType0Type RefType))) (U_2_bool (MapType0Select Heap@@48 o $allocated))) (U_2_bool (MapType0Select Heap@@48 (MapType0Select Heap@@48 o f) $allocated)))
 :qid |stdinbpl.31:15|
 :skolemid |0|
 :pattern ( (MapType0Select Heap@@48 o f))
)))
(assert (forall ((x_1@@9 Int) (l_1@@18 T@U) ) (!  (=> (= (type l_1@@18) List2DomainTypeType) (= x_1@@9 (get_List1_x (RList1 x_1@@9 l_1@@18))))
 :qid |stdinbpl.221:15|
 :skolemid |22|
 :pattern ( (RList1 x_1@@9 l_1@@18))
)))
(assert (forall ((x_1@@10 Int) (l_1@@19 T@U) ) (!  (=> (= (type l_1@@19) List2DomainTypeType) (= l_1@@19 (get_List1_l (RList1 x_1@@10 l_1@@19))))
 :qid |stdinbpl.227:15|
 :skolemid |23|
 :pattern ( (RList1 x_1@@10 l_1@@19))
)))
(assert (forall ((x_1@@11 Int) (l_1@@20 T@U) ) (!  (=> (= (type l_1@@20) List1DomainTypeType) (= x_1@@11 (get_List2_x (NonEmpty x_1@@11 l_1@@20))))
 :qid |stdinbpl.292:15|
 :skolemid |29|
 :pattern ( (NonEmpty x_1@@11 l_1@@20))
)))
(assert (forall ((x_1@@12 Int) (l_1@@21 T@U) ) (!  (=> (= (type l_1@@21) List1DomainTypeType) (= l_1@@21 (get_List2_l (NonEmpty x_1@@12 l_1@@21))))
 :qid |stdinbpl.298:15|
 :skolemid |30|
 :pattern ( (NonEmpty x_1@@12 l_1@@21))
)))
(assert (forall ((x_1@@13 Int) (y_1@@0 T@U) ) (!  (=> (= (type y_1@@0) MList2DomainTypeType) (= x_1@@13 (get_MList1_x (MRList1 x_1@@13 y_1@@0))))
 :qid |stdinbpl.366:15|
 :skolemid |36|
 :pattern ( (MRList1 x_1@@13 y_1@@0))
)))
(assert (forall ((x_1@@14 Int) (y_1@@1 T@U) ) (!  (=> (= (type y_1@@1) MList2DomainTypeType) (= y_1@@1 (get_MList1_y (MRList1 x_1@@14 y_1@@1))))
 :qid |stdinbpl.372:15|
 :skolemid |37|
 :pattern ( (MRList1 x_1@@14 y_1@@1))
)))
(assert (forall ((y_1@@2 Int) (l_1@@22 T@U) ) (!  (=> (= (type l_1@@22) MList1DomainTypeType) (= y_1@@2 (get_MList2_y (MNonEmpty y_1@@2 l_1@@22))))
 :qid |stdinbpl.437:15|
 :skolemid |43|
 :pattern ( (MNonEmpty y_1@@2 l_1@@22))
)))
(assert (forall ((y_1@@3 Int) (l_1@@23 T@U) ) (!  (=> (= (type l_1@@23) MList1DomainTypeType) (= l_1@@23 (get_MList2_l (MNonEmpty y_1@@3 l_1@@23))))
 :qid |stdinbpl.443:15|
 :skolemid |44|
 :pattern ( (MNonEmpty y_1@@3 l_1@@23))
)))
(assert (forall ((x_1@@15 T@U) ) (!  (=> (= (type x_1@@15) Triple2DomainTypeType) (= x_1@@15 (get_Triple1_x (triple1 x_1@@15))))
 :qid |stdinbpl.508:15|
 :skolemid |50|
 :pattern ( (triple1 x_1@@15))
)))
(assert (forall ((t_2@@26 T@U) ) (!  (=> (= (type t_2@@26) Triple1DomainTypeType) (= t_2@@26 (triple1 (get_Triple1_x t_2@@26))))
 :qid |stdinbpl.520:15|
 :skolemid |52|
 :pattern ( (Triple1_tag t_2@@26))
 :pattern ( (get_Triple1_x t_2@@26))
)))
(assert (forall ((x_1@@16 T@U) ) (!  (=> (= (type x_1@@16) Triple3DomainTypeType) (= x_1@@16 (get_Triple2_x (triple2 x_1@@16))))
 :qid |stdinbpl.567:15|
 :skolemid |56|
 :pattern ( (triple2 x_1@@16))
)))
(assert (forall ((t_2@@27 T@U) ) (!  (=> (= (type t_2@@27) Triple2DomainTypeType) (= t_2@@27 (triple2 (get_Triple2_x t_2@@27))))
 :qid |stdinbpl.579:15|
 :skolemid |58|
 :pattern ( (Triple2_tag t_2@@27))
 :pattern ( (get_Triple2_x t_2@@27))
)))
(assert (forall ((x_1@@17 T@U) ) (!  (=> (= (type x_1@@17) Triple1DomainTypeType) (= x_1@@17 (get_Triple3_x (triple3 x_1@@17))))
 :qid |stdinbpl.632:15|
 :skolemid |62|
 :pattern ( (triple3 x_1@@17))
)))
(assert (forall ((i_1 Int) ) (! (= i_1 (get_Triple3_i (nil i_1)))
 :qid |stdinbpl.638:15|
 :skolemid |63|
 :pattern ( (nil i_1))
)))
(assert (forall ((Heap@@49 T@U) (o@@0 T@U) (f_3 T@U) (v T@U) ) (! (let ((B@@8 (type v)))
(let ((A@@9 (FieldTypeInv0 (type f_3))))
 (=> (and (and (= (type Heap@@49) (MapType0Type RefType)) (= (type o@@0) RefType)) (= (type f_3) (FieldType A@@9 B@@8))) (succHeap Heap@@49 (MapType0Store Heap@@49 o@@0 f_3 v)))))
 :qid |stdinbpl.78:22|
 :skolemid |9|
 :pattern ( (MapType0Store Heap@@49 o@@0 f_3 v))
)))
(assert (forall ((Heap@@50 T@U) (Mask@@28 T@U) (l_1@@24 T@U) ) (!  (=> (and (and (and (= (type Heap@@50) (MapType0Type RefType)) (= (type Mask@@28) (MapType1Type RefType realType))) (= (type l_1@@24) List1DomainTypeType)) (and (state Heap@@50 Mask@@28) (< AssumeFunctionsAbove 3))) (= (len1Bad Heap@@50 l_1@@24) (ite (= (get_List1_l l_1@@24) Empty) 0 (+ 1 (|len1Bad'| Heap@@50 l_1@@24)))))
 :qid |stdinbpl.895:15|
 :skolemid |84|
 :pattern ( (state Heap@@50 Mask@@28) (len1Bad Heap@@50 l_1@@24))
)))
(assert (= (type ZeroPMask) (MapType1Type RefType boolType)))
(assert (forall ((o_2@@3 T@U) (f_4@@3 T@U) ) (! (let ((B@@9 (FieldTypeInv1 (type f_4@@3))))
(let ((A@@10 (FieldTypeInv0 (type f_4@@3))))
 (=> (and (= (type o_2@@3) RefType) (= (type f_4@@3) (FieldType A@@10 B@@9))) (not (U_2_bool (MapType1Select ZeroPMask o_2@@3 f_4@@3))))))
 :qid |stdinbpl.112:22|
 :skolemid |14|
 :pattern ( (MapType1Select ZeroPMask o_2@@3 f_4@@3))
)))
(assert (forall ((x_1@@18 Int) (l_1@@25 T@U) ) (!  (=> (= (type l_1@@25) List2DomainTypeType) (= (List1_tag (RList1 x_1@@18 l_1@@25)) 0))
 :qid |stdinbpl.233:15|
 :skolemid |24|
 :pattern ( (RList1 x_1@@18 l_1@@25))
)))
(assert (forall ((x_1@@19 Int) (y_1@@4 T@U) ) (!  (=> (= (type y_1@@4) MList2DomainTypeType) (= (MList1_tag (MRList1 x_1@@19 y_1@@4)) 0))
 :qid |stdinbpl.378:15|
 :skolemid |38|
 :pattern ( (MRList1 x_1@@19 y_1@@4))
)))
(assert (forall ((x_1@@20 Int) (l_1@@26 T@U) ) (!  (=> (= (type l_1@@26) List1DomainTypeType) (= (List2_tag (NonEmpty x_1@@20 l_1@@26)) 1))
 :qid |stdinbpl.307:15|
 :skolemid |31|
 :pattern ( (NonEmpty x_1@@20 l_1@@26))
)))
(assert (forall ((y_1@@5 Int) (l_1@@27 T@U) ) (!  (=> (= (type l_1@@27) MList1DomainTypeType) (= (MList2_tag (MNonEmpty y_1@@5 l_1@@27)) 1))
 :qid |stdinbpl.452:15|
 :skolemid |45|
 :pattern ( (MNonEmpty y_1@@5 l_1@@27))
)))
(assert (forall ((Heap@@51 T@U) (Mask@@29 T@U) (t_2@@28 T@U) ) (!  (=> (and (and (and (= (type Heap@@51) (MapType0Type RefType)) (= (type Mask@@29) (MapType1Type RefType realType))) (= (type t_2@@28) Triple3DomainTypeType)) (and (state Heap@@51 Mask@@29) (< AssumeFunctionsAbove 4))) (= (tripleLen3 Heap@@51 t_2@@28) (ite (= (Triple3_tag t_2@@28) 0) 0 (+ 3 (|tripleLen3'| Heap@@51 (get_Triple2_x (get_Triple1_x (get_Triple3_x t_2@@28))))))))
 :qid |stdinbpl.1147:15|
 :skolemid |100|
 :pattern ( (state Heap@@51 Mask@@29) (tripleLen3 Heap@@51 t_2@@28))
)))
(assert (forall ((p@@1 T@U) (v_1@@0 T@U) (q T@U) (w@@0 T@U) (r T@U) (u T@U) ) (! (let ((C@@3 (FieldTypeInv0 (type r))))
(let ((B@@10 (FieldTypeInv0 (type q))))
(let ((A@@11 (FieldTypeInv0 (type p@@1))))
 (=> (and (and (and (and (and (and (= (type p@@1) (FieldType A@@11 FrameTypeType)) (= (type v_1@@0) FrameTypeType)) (= (type q) (FieldType B@@10 FrameTypeType))) (= (type w@@0) FrameTypeType)) (= (type r) (FieldType C@@3 FrameTypeType))) (= (type u) FrameTypeType)) (and (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))) (InsidePredicate p@@1 v_1@@0 r u)))))
 :qid |stdinbpl.178:25|
 :skolemid |20|
 :pattern ( (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))
)))
(assert (forall ((x_1@@21 T@U) ) (!  (=> (= (type x_1@@21) Triple2DomainTypeType) (= (Triple1_tag (triple1 x_1@@21)) 0))
 :qid |stdinbpl.514:15|
 :skolemid |51|
 :pattern ( (triple1 x_1@@21))
)))
(assert (forall ((x_1@@22 T@U) ) (!  (=> (= (type x_1@@22) Triple3DomainTypeType) (= (Triple2_tag (triple2 x_1@@22)) 0))
 :qid |stdinbpl.573:15|
 :skolemid |57|
 :pattern ( (triple2 x_1@@22))
)))
(assert (forall ((i_1@@0 Int) ) (! (= (Triple3_tag (nil i_1@@0)) 0)
 :qid |stdinbpl.650:15|
 :skolemid |65|
 :pattern ( (nil i_1@@0))
)))
(assert (forall ((x_1@@23 T@U) ) (!  (=> (= (type x_1@@23) Triple1DomainTypeType) (= (Triple3_tag (triple3 x_1@@23)) 1))
 :qid |stdinbpl.644:15|
 :skolemid |64|
 :pattern ( (triple3 x_1@@23))
)))
(assert (forall ((Heap@@52 T@U) (Mask@@30 T@U) (t_2@@29 T@U) ) (!  (=> (and (and (and (= (type Heap@@52) (MapType0Type RefType)) (= (type Mask@@30) (MapType1Type RefType realType))) (= (type t_2@@29) Triple2DomainTypeType)) (and (state Heap@@52 Mask@@30) (< AssumeFunctionsAbove 2))) (= (tripleLen2Bad Heap@@52 t_2@@29) (+ 1 (ite (= (Triple3_tag (get_Triple2_x t_2@@29)) 0) 0 (+ 1 (|tripleLen2Bad'| Heap@@52 t_2@@29))))))
 :qid |stdinbpl.1273:15|
 :skolemid |108|
 :pattern ( (state Heap@@52 Mask@@30) (tripleLen2Bad Heap@@52 t_2@@29))
)))
(assert (forall ((v1 T@U) (v2 T@U) (v3 T@U) ) (!  (=> (and (and (and (= (type v1) List1DomainTypeType) (= (type v2) List1DomainTypeType)) (= (type v3) List1DomainTypeType)) (and (decreasing v1 v2) (decreasing v2 v3))) (decreasing v1 v3))
 :qid |stdinbpl.258:15|
 :skolemid |27|
 :pattern ( (decreasing v1 v2) (decreasing v2 v3))
)))
(assert (forall ((v1@@0 T@U) (v2@@0 T@U) (v3@@0 T@U) ) (!  (=> (and (and (and (= (type v1@@0) List2DomainTypeType) (= (type v2@@0) List2DomainTypeType)) (= (type v3@@0) List2DomainTypeType)) (and (decreasing v1@@0 v2@@0) (decreasing v2@@0 v3@@0))) (decreasing v1@@0 v3@@0))
 :qid |stdinbpl.335:15|
 :skolemid |34|
 :pattern ( (decreasing v1@@0 v2@@0) (decreasing v2@@0 v3@@0))
)))
(assert (forall ((v1@@1 T@U) (v2@@1 T@U) (v3@@1 T@U) ) (!  (=> (and (and (and (= (type v1@@1) MList1DomainTypeType) (= (type v2@@1) MList1DomainTypeType)) (= (type v3@@1) MList1DomainTypeType)) (and (decreasing v1@@1 v2@@1) (decreasing v2@@1 v3@@1))) (decreasing v1@@1 v3@@1))
 :qid |stdinbpl.403:15|
 :skolemid |41|
 :pattern ( (decreasing v1@@1 v2@@1) (decreasing v2@@1 v3@@1))
)))
(assert (forall ((v1@@2 T@U) (v2@@2 T@U) (v3@@2 T@U) ) (!  (=> (and (and (and (= (type v1@@2) MList2DomainTypeType) (= (type v2@@2) MList2DomainTypeType)) (= (type v3@@2) MList2DomainTypeType)) (and (decreasing v1@@2 v2@@2) (decreasing v2@@2 v3@@2))) (decreasing v1@@2 v3@@2))
 :qid |stdinbpl.480:15|
 :skolemid |48|
 :pattern ( (decreasing v1@@2 v2@@2) (decreasing v2@@2 v3@@2))
)))
(assert (forall ((v1@@3 T@U) (v2@@3 T@U) (v3@@3 T@U) ) (!  (=> (and (and (and (= (type v1@@3) Triple1DomainTypeType) (= (type v2@@3) Triple1DomainTypeType)) (= (type v3@@3) Triple1DomainTypeType)) (and (decreasing v1@@3 v2@@3) (decreasing v2@@3 v3@@3))) (decreasing v1@@3 v3@@3))
 :qid |stdinbpl.539:15|
 :skolemid |54|
 :pattern ( (decreasing v1@@3 v2@@3) (decreasing v2@@3 v3@@3))
)))
(assert (forall ((v1@@4 T@U) (v2@@4 T@U) (v3@@4 T@U) ) (!  (=> (and (and (and (= (type v1@@4) Triple2DomainTypeType) (= (type v2@@4) Triple2DomainTypeType)) (= (type v3@@4) Triple2DomainTypeType)) (and (decreasing v1@@4 v2@@4) (decreasing v2@@4 v3@@4))) (decreasing v1@@4 v3@@4))
 :qid |stdinbpl.598:15|
 :skolemid |60|
 :pattern ( (decreasing v1@@4 v2@@4) (decreasing v2@@4 v3@@4))
)))
(assert (forall ((v1@@5 T@U) (v2@@5 T@U) (v3@@5 T@U) ) (!  (=> (and (and (and (= (type v1@@5) Triple3DomainTypeType) (= (type v2@@5) Triple3DomainTypeType)) (= (type v3@@5) Triple3DomainTypeType)) (and (decreasing v1@@5 v2@@5) (decreasing v2@@5 v3@@5))) (decreasing v1@@5 v3@@5))
 :qid |stdinbpl.678:15|
 :skolemid |68|
 :pattern ( (decreasing v1@@5 v2@@5) (decreasing v2@@5 v3@@5))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun l_1@@28 () T@U)
(declare-fun Heap@@53 () T@U)
(assert  (and (= (type l_1@@28) List2DomainTypeType) (= (type Heap@@53) (MapType0Type RefType))))
(set-info :boogie-vc-id len2_termination_proof)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 7) (let ((anon3_correct true))
(let ((anon4_Else_correct  (=> (not (= l_1@@28 Empty)) (and (=> (= (ControlFlow 0 3) (- 0 5)) (decreasing (get_List1_l (get_List2_l l_1@@28)) l_1@@28)) (=> (decreasing (get_List1_l (get_List2_l l_1@@28)) l_1@@28) (and (=> (= (ControlFlow 0 3) (- 0 4)) (bounded l_1@@28)) (=> (bounded l_1@@28) (=> (and (state Heap@@53 ZeroMask) (= (ControlFlow 0 3) 1)) anon3_correct))))))))
(let ((anon4_Then_correct  (=> (and (= l_1@@28 Empty) (= (ControlFlow 0 2) 1)) anon3_correct)))
(let ((anon0_correct  (=> (and (state Heap@@53 ZeroMask) (= AssumeFunctionsAbove (- 0 1))) (and (=> (= (ControlFlow 0 6) 2) anon4_Then_correct) (=> (= (ControlFlow 0 6) 3) anon4_Else_correct)))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 7) 6) anon0_correct)))
PreconditionGeneratedEntry_correct))))))
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
(declare-fun succHeap (T@U T@U) Bool)
(declare-fun MapType0Type (T@T) T@T)
(declare-fun RefType () T@T)
(declare-fun succHeapTrans (T@U T@U) Bool)
(declare-fun MapType0TypeInv0 (T@T) T@T)
(declare-fun FieldType (T@T T@T) T@T)
(declare-fun FieldTypeInv0 (T@T) T@T)
(declare-fun FieldTypeInv1 (T@T) T@T)
(declare-fun MapType0Select (T@U T@U T@U) T@U)
(declare-fun MapType0Store (T@U T@U T@U T@U) T@U)
(declare-fun bounded (T@U) Bool)
(declare-fun List1DomainTypeType () T@T)
(declare-fun List2DomainTypeType () T@T)
(declare-fun MList1DomainTypeType () T@T)
(declare-fun MList2DomainTypeType () T@T)
(declare-fun Triple1DomainTypeType () T@T)
(declare-fun Triple2DomainTypeType () T@T)
(declare-fun Triple3DomainTypeType () T@T)
(declare-fun state (T@U T@U) Bool)
(declare-fun len2Bad (T@U T@U) Int)
(declare-fun MapType1Type (T@T T@T) T@T)
(declare-fun AssumeFunctionsAbove () Int)
(declare-fun Empty () T@U)
(declare-fun |len2Bad'| (T@U T@U) Int)
(declare-fun MapType1TypeInv0 (T@T) T@T)
(declare-fun MapType1TypeInv1 (T@T) T@T)
(declare-fun MapType1Select (T@U T@U T@U) T@U)
(declare-fun MapType1Store (T@U T@U T@U T@U) T@U)
(declare-fun GoodMask (T@U) Bool)
(declare-fun IdenticalOnKnownLocations (T@U T@U T@U) Bool)
(declare-fun IsPredicateField (T@U) Bool)
(declare-fun null () T@U)
(declare-fun PredicateMaskField (T@U) T@U)
(declare-fun FrameTypeType () T@T)
(declare-fun HasDirectPerm (T@U T@U T@U) Bool)
(declare-fun IsWandField (T@U) Bool)
(declare-fun WandMaskField (T@U) T@U)
(declare-fun len1 (T@U T@U) Int)
(declare-fun get_List1_l (T@U) T@U)
(declare-fun |len1'| (T@U T@U) Int)
(declare-fun get_List2_l (T@U) T@U)
(declare-fun |len2'| (T@U T@U) Int)
(declare-fun dummyFunction (T@U) Bool)
(declare-fun |len2#triggerStateless| (T@U) Int)
(declare-fun |len2Bad#triggerStateless| (T@U) Int)
(declare-fun |len1#triggerStateless| (T@U) Int)
(declare-fun |len1Bad'| (T@U T@U) Int)
(declare-fun |len1Bad#triggerStateless| (T@U) Int)
(declare-fun |mlen2'| (T@U T@U) Int)
(declare-fun |mlen2#triggerStateless| (T@U) Int)
(declare-fun |tripleLen1'| (T@U T@U) Int)
(declare-fun |tripleLen1#triggerStateless| (T@U) Int)
(declare-fun |tripleLen2'| (T@U T@U) Int)
(declare-fun |tripleLen2#triggerStateless| (T@U) Int)
(declare-fun |tripleLen3'| (T@U T@U) Int)
(declare-fun |tripleLen3#triggerStateless| (T@U) Int)
(declare-fun |tripleLen1Bad'| (T@U T@U) Int)
(declare-fun |tripleLen1Bad#triggerStateless| (T@U) Int)
(declare-fun |tripleLen2Bad'| (T@U T@U) Int)
(declare-fun |tripleLen2Bad#triggerStateless| (T@U) Int)
(declare-fun |tripleLen3Bad'| (T@U T@U) Int)
(declare-fun |tripleLen3Bad#triggerStateless| (T@U) Int)
(declare-fun tripleLen1Bad (T@U T@U) Int)
(declare-fun Triple3_tag (T@U) Int)
(declare-fun get_Triple2_x (T@U) T@U)
(declare-fun get_Triple1_x (T@U) T@U)
(declare-fun List2_tag (T@U) Int)
(declare-fun get_List2_x (T@U) Int)
(declare-fun NonEmpty (Int T@U) T@U)
(declare-fun MList2_tag (T@U) Int)
(declare-fun get_MList2_y (T@U) Int)
(declare-fun get_MList2_l (T@U) T@U)
(declare-fun MEmpty () T@U)
(declare-fun MNonEmpty (Int T@U) T@U)
(declare-fun get_Triple3_i (T@U) Int)
(declare-fun triple3 (T@U) T@U)
(declare-fun get_Triple3_x (T@U) T@U)
(declare-fun nil (Int) T@U)
(declare-fun RList1 (Int T@U) T@U)
(declare-fun decreasing (T@U T@U) Bool)
(declare-fun MRList1 (Int T@U) T@U)
(declare-fun $allocated () T@U)
(declare-fun NormalFieldType () T@T)
(declare-fun len2 (T@U T@U) Int)
(declare-fun len1Bad (T@U T@U) Int)
(declare-fun mlen2 (T@U T@U) Int)
(declare-fun tripleLen1 (T@U T@U) Int)
(declare-fun tripleLen2 (T@U T@U) Int)
(declare-fun tripleLen3 (T@U T@U) Int)
(declare-fun tripleLen2Bad (T@U T@U) Int)
(declare-fun tripleLen3Bad (T@U T@U) Int)
(declare-fun get_MList1_y (T@U) T@U)
(declare-fun dummyHeap () T@U)
(declare-fun ZeroMask () T@U)
(declare-fun triple1 (T@U) T@U)
(declare-fun triple2 (T@U) T@U)
(declare-fun InsidePredicate (T@U T@U T@U T@U) Bool)
(declare-fun List1_tag (T@U) Int)
(declare-fun get_List1_x (T@U) Int)
(declare-fun MList1_tag (T@U) Int)
(declare-fun get_MList1_x (T@U) Int)
(declare-fun sumMask (T@U T@U T@U) Bool)
(declare-fun ConditionalFrame (Real T@U) T@U)
(declare-fun EmptyFrame () T@U)
(declare-fun NoPerm () Real)
(declare-fun FullPerm () Real)
(declare-fun |len2#frame| (T@U T@U) Int)
(declare-fun |len2Bad#frame| (T@U T@U) Int)
(declare-fun |len1#frame| (T@U T@U) Int)
(declare-fun |len1Bad#frame| (T@U T@U) Int)
(declare-fun |mlen2#frame| (T@U T@U) Int)
(declare-fun |tripleLen1#frame| (T@U T@U) Int)
(declare-fun |tripleLen2#frame| (T@U T@U) Int)
(declare-fun |tripleLen3#frame| (T@U T@U) Int)
(declare-fun |tripleLen1Bad#frame| (T@U T@U) Int)
(declare-fun |tripleLen2Bad#frame| (T@U T@U) Int)
(declare-fun |tripleLen3Bad#frame| (T@U T@U) Int)
(declare-fun Triple1_tag (T@U) Int)
(declare-fun Triple2_tag (T@U) Int)
(declare-fun ZeroPMask () T@U)
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
(assert  (and (and (and (and (and (and (and (and (and (forall ((arg0@@11 T@T) ) (! (= (Ctor (MapType0Type arg0@@11)) 6)
 :qid |ctor:MapType0Type|
)) (forall ((arg0@@12 T@T) ) (! (= (MapType0TypeInv0 (MapType0Type arg0@@12)) arg0@@12)
 :qid |typeInv:MapType0TypeInv0|
 :pattern ( (MapType0Type arg0@@12))
))) (forall ((arg0@@13 T@T) (arg1 T@T) ) (! (= (Ctor (FieldType arg0@@13 arg1)) 7)
 :qid |ctor:FieldType|
))) (forall ((arg0@@14 T@T) (arg1@@0 T@T) ) (! (= (FieldTypeInv0 (FieldType arg0@@14 arg1@@0)) arg0@@14)
 :qid |typeInv:FieldTypeInv0|
 :pattern ( (FieldType arg0@@14 arg1@@0))
))) (forall ((arg0@@15 T@T) (arg1@@1 T@T) ) (! (= (FieldTypeInv1 (FieldType arg0@@15 arg1@@1)) arg1@@1)
 :qid |typeInv:FieldTypeInv1|
 :pattern ( (FieldType arg0@@15 arg1@@1))
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
)))) (= (Ctor RefType) 8)))
(assert (forall ((Heap0 T@U) (Heap1 T@U) ) (!  (=> (and (and (= (type Heap0) (MapType0Type RefType)) (= (type Heap1) (MapType0Type RefType))) (succHeap Heap0 Heap1)) (succHeapTrans Heap0 Heap1))
 :qid |stdinbpl.88:15|
 :skolemid |11|
 :pattern ( (succHeap Heap0 Heap1))
)))
(assert (= (Ctor List1DomainTypeType) 9))
(assert (forall ((x_1 T@U) ) (!  (=> (= (type x_1) List1DomainTypeType) (bounded x_1))
 :qid |stdinbpl.264:15|
 :skolemid |28|
 :pattern ( (bounded x_1))
)))
(assert (= (Ctor List2DomainTypeType) 10))
(assert (forall ((x_1@@0 T@U) ) (!  (=> (= (type x_1@@0) List2DomainTypeType) (bounded x_1@@0))
 :qid |stdinbpl.341:15|
 :skolemid |35|
 :pattern ( (bounded x_1@@0))
)))
(assert (= (Ctor MList1DomainTypeType) 11))
(assert (forall ((x_1@@1 T@U) ) (!  (=> (= (type x_1@@1) MList1DomainTypeType) (bounded x_1@@1))
 :qid |stdinbpl.409:15|
 :skolemid |42|
 :pattern ( (bounded x_1@@1))
)))
(assert (= (Ctor MList2DomainTypeType) 12))
(assert (forall ((x_1@@2 T@U) ) (!  (=> (= (type x_1@@2) MList2DomainTypeType) (bounded x_1@@2))
 :qid |stdinbpl.486:15|
 :skolemid |49|
 :pattern ( (bounded x_1@@2))
)))
(assert (= (Ctor Triple1DomainTypeType) 13))
(assert (forall ((x_1@@3 T@U) ) (!  (=> (= (type x_1@@3) Triple1DomainTypeType) (bounded x_1@@3))
 :qid |stdinbpl.545:15|
 :skolemid |55|
 :pattern ( (bounded x_1@@3))
)))
(assert (= (Ctor Triple2DomainTypeType) 14))
(assert (forall ((x_1@@4 T@U) ) (!  (=> (= (type x_1@@4) Triple2DomainTypeType) (bounded x_1@@4))
 :qid |stdinbpl.604:15|
 :skolemid |61|
 :pattern ( (bounded x_1@@4))
)))
(assert (= (Ctor Triple3DomainTypeType) 15))
(assert (forall ((x_1@@5 T@U) ) (!  (=> (= (type x_1@@5) Triple3DomainTypeType) (bounded x_1@@5))
 :qid |stdinbpl.684:15|
 :skolemid |69|
 :pattern ( (bounded x_1@@5))
)))
(assert  (and (and (and (and (and (and (and (forall ((arg0@@18 T@T) (arg1@@4 T@T) ) (! (= (Ctor (MapType1Type arg0@@18 arg1@@4)) 16)
 :qid |ctor:MapType1Type|
)) (forall ((arg0@@19 T@T) (arg1@@5 T@T) ) (! (= (MapType1TypeInv0 (MapType1Type arg0@@19 arg1@@5)) arg0@@19)
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
)))) (= (type Empty) List2DomainTypeType)))
(assert (forall ((Heap T@U) (Mask T@U) (l_1 T@U) ) (!  (=> (and (and (and (= (type Heap) (MapType0Type RefType)) (= (type Mask) (MapType1Type RefType realType))) (= (type l_1) List2DomainTypeType)) (and (state Heap Mask) (< AssumeFunctionsAbove 0))) (= (len2Bad Heap l_1) (ite (= l_1 Empty) 0 (+ 1 (|len2Bad'| Heap l_1)))))
 :qid |stdinbpl.769:15|
 :skolemid |76|
 :pattern ( (state Heap Mask) (len2Bad Heap l_1))
)))
(assert (forall ((Heap@@0 T@U) (Mask@@0 T@U) ) (!  (=> (and (and (= (type Heap@@0) (MapType0Type RefType)) (= (type Mask@@0) (MapType1Type RefType realType))) (state Heap@@0 Mask@@0)) (GoodMask Mask@@0))
 :qid |stdinbpl.124:15|
 :skolemid |15|
 :pattern ( (state Heap@@0 Mask@@0))
)))
(assert (forall ((Heap0@@0 T@U) (Heap1@@0 T@U) (Heap2 T@U) ) (!  (=> (and (and (and (= (type Heap0@@0) (MapType0Type RefType)) (= (type Heap1@@0) (MapType0Type RefType))) (= (type Heap2) (MapType0Type RefType))) (and (succHeapTrans Heap0@@0 Heap1@@0) (succHeap Heap1@@0 Heap2))) (succHeapTrans Heap0@@0 Heap2))
 :qid |stdinbpl.93:15|
 :skolemid |12|
 :pattern ( (succHeapTrans Heap0@@0 Heap1@@0) (succHeap Heap1@@0 Heap2))
)))
(assert  (and (and (= (Ctor FrameTypeType) 17) (= (type null) RefType)) (forall ((arg0@@23 T@U) ) (! (let ((A (FieldTypeInv0 (type arg0@@23))))
(= (type (PredicateMaskField arg0@@23)) (FieldType A (MapType1Type RefType boolType))))
 :qid |funType:PredicateMaskField|
 :pattern ( (PredicateMaskField arg0@@23))
))))
(assert (forall ((Heap@@1 T@U) (ExhaleHeap T@U) (Mask@@1 T@U) (pm_f T@U) ) (! (let ((C (FieldTypeInv0 (type pm_f))))
 (=> (and (and (and (and (and (= (type Heap@@1) (MapType0Type RefType)) (= (type ExhaleHeap) (MapType0Type RefType))) (= (type Mask@@1) (MapType1Type RefType realType))) (= (type pm_f) (FieldType C FrameTypeType))) (IdenticalOnKnownLocations Heap@@1 ExhaleHeap Mask@@1)) (and (HasDirectPerm Mask@@1 null pm_f) (IsPredicateField pm_f))) (= (MapType0Select Heap@@1 null (PredicateMaskField pm_f)) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))))
 :qid |stdinbpl.47:19|
 :skolemid |2|
 :pattern ( (IdenticalOnKnownLocations Heap@@1 ExhaleHeap Mask@@1) (IsPredicateField pm_f) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))
)))
(assert (forall ((arg0@@24 T@U) ) (! (let ((A@@0 (FieldTypeInv0 (type arg0@@24))))
(= (type (WandMaskField arg0@@24)) (FieldType A@@0 (MapType1Type RefType boolType))))
 :qid |funType:WandMaskField|
 :pattern ( (WandMaskField arg0@@24))
)))
(assert (forall ((Heap@@2 T@U) (ExhaleHeap@@0 T@U) (Mask@@2 T@U) (pm_f@@0 T@U) ) (! (let ((C@@0 (FieldTypeInv0 (type pm_f@@0))))
 (=> (and (and (and (and (and (= (type Heap@@2) (MapType0Type RefType)) (= (type ExhaleHeap@@0) (MapType0Type RefType))) (= (type Mask@@2) (MapType1Type RefType realType))) (= (type pm_f@@0) (FieldType C@@0 FrameTypeType))) (IdenticalOnKnownLocations Heap@@2 ExhaleHeap@@0 Mask@@2)) (and (HasDirectPerm Mask@@2 null pm_f@@0) (IsWandField pm_f@@0))) (= (MapType0Select Heap@@2 null (WandMaskField pm_f@@0)) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))))
 :qid |stdinbpl.60:19|
 :skolemid |5|
 :pattern ( (IdenticalOnKnownLocations Heap@@2 ExhaleHeap@@0 Mask@@2) (IsWandField pm_f@@0) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))
)))
(assert  (and (forall ((arg0@@25 T@U) ) (! (= (type (get_List1_l arg0@@25)) List2DomainTypeType)
 :qid |funType:get_List1_l|
 :pattern ( (get_List1_l arg0@@25))
)) (forall ((arg0@@26 T@U) ) (! (= (type (get_List2_l arg0@@26)) List1DomainTypeType)
 :qid |funType:get_List2_l|
 :pattern ( (get_List2_l arg0@@26))
))))
(assert (forall ((Heap@@3 T@U) (Mask@@3 T@U) (l_1@@0 T@U) ) (!  (=> (and (and (and (= (type Heap@@3) (MapType0Type RefType)) (= (type Mask@@3) (MapType1Type RefType realType))) (= (type l_1@@0) List1DomainTypeType)) (and (state Heap@@3 Mask@@3) (< AssumeFunctionsAbove 9))) (= (len1 Heap@@3 l_1@@0) (ite (= (get_List1_l l_1@@0) Empty) 0 (+ 1 (|len1'| Heap@@3 (get_List2_l (get_List1_l l_1@@0)))))))
 :qid |stdinbpl.832:15|
 :skolemid |80|
 :pattern ( (state Heap@@3 Mask@@3) (len1 Heap@@3 l_1@@0))
)))
(assert (forall ((Heap@@4 T@U) (l_1@@1 T@U) ) (!  (=> (and (= (type Heap@@4) (MapType0Type RefType)) (= (type l_1@@1) List2DomainTypeType)) (dummyFunction (int_2_U (|len2#triggerStateless| l_1@@1))))
 :qid |stdinbpl.700:15|
 :skolemid |71|
 :pattern ( (|len2'| Heap@@4 l_1@@1))
)))
(assert (forall ((Heap@@5 T@U) (l_1@@2 T@U) ) (!  (=> (and (= (type Heap@@5) (MapType0Type RefType)) (= (type l_1@@2) List2DomainTypeType)) (dummyFunction (int_2_U (|len2Bad#triggerStateless| l_1@@2))))
 :qid |stdinbpl.763:15|
 :skolemid |75|
 :pattern ( (|len2Bad'| Heap@@5 l_1@@2))
)))
(assert (forall ((Heap@@6 T@U) (l_1@@3 T@U) ) (!  (=> (and (= (type Heap@@6) (MapType0Type RefType)) (= (type l_1@@3) List1DomainTypeType)) (dummyFunction (int_2_U (|len1#triggerStateless| l_1@@3))))
 :qid |stdinbpl.826:15|
 :skolemid |79|
 :pattern ( (|len1'| Heap@@6 l_1@@3))
)))
(assert (forall ((Heap@@7 T@U) (l_1@@4 T@U) ) (!  (=> (and (= (type Heap@@7) (MapType0Type RefType)) (= (type l_1@@4) List1DomainTypeType)) (dummyFunction (int_2_U (|len1Bad#triggerStateless| l_1@@4))))
 :qid |stdinbpl.889:15|
 :skolemid |83|
 :pattern ( (|len1Bad'| Heap@@7 l_1@@4))
)))
(assert (forall ((Heap@@8 T@U) (l_1@@5 T@U) ) (!  (=> (and (= (type Heap@@8) (MapType0Type RefType)) (= (type l_1@@5) MList2DomainTypeType)) (dummyFunction (int_2_U (|mlen2#triggerStateless| l_1@@5))))
 :qid |stdinbpl.952:15|
 :skolemid |87|
 :pattern ( (|mlen2'| Heap@@8 l_1@@5))
)))
(assert (forall ((Heap@@9 T@U) (t_2 T@U) ) (!  (=> (and (= (type Heap@@9) (MapType0Type RefType)) (= (type t_2) Triple1DomainTypeType)) (dummyFunction (int_2_U (|tripleLen1#triggerStateless| t_2))))
 :qid |stdinbpl.1015:15|
 :skolemid |91|
 :pattern ( (|tripleLen1'| Heap@@9 t_2))
)))
(assert (forall ((Heap@@10 T@U) (t_2@@0 T@U) ) (!  (=> (and (= (type Heap@@10) (MapType0Type RefType)) (= (type t_2@@0) Triple2DomainTypeType)) (dummyFunction (int_2_U (|tripleLen2#triggerStateless| t_2@@0))))
 :qid |stdinbpl.1078:15|
 :skolemid |95|
 :pattern ( (|tripleLen2'| Heap@@10 t_2@@0))
)))
(assert (forall ((Heap@@11 T@U) (t_2@@1 T@U) ) (!  (=> (and (= (type Heap@@11) (MapType0Type RefType)) (= (type t_2@@1) Triple3DomainTypeType)) (dummyFunction (int_2_U (|tripleLen3#triggerStateless| t_2@@1))))
 :qid |stdinbpl.1141:15|
 :skolemid |99|
 :pattern ( (|tripleLen3'| Heap@@11 t_2@@1))
)))
(assert (forall ((Heap@@12 T@U) (t_2@@2 T@U) ) (!  (=> (and (= (type Heap@@12) (MapType0Type RefType)) (= (type t_2@@2) Triple1DomainTypeType)) (dummyFunction (int_2_U (|tripleLen1Bad#triggerStateless| t_2@@2))))
 :qid |stdinbpl.1204:15|
 :skolemid |103|
 :pattern ( (|tripleLen1Bad'| Heap@@12 t_2@@2))
)))
(assert (forall ((Heap@@13 T@U) (t_2@@3 T@U) ) (!  (=> (and (= (type Heap@@13) (MapType0Type RefType)) (= (type t_2@@3) Triple2DomainTypeType)) (dummyFunction (int_2_U (|tripleLen2Bad#triggerStateless| t_2@@3))))
 :qid |stdinbpl.1267:15|
 :skolemid |107|
 :pattern ( (|tripleLen2Bad'| Heap@@13 t_2@@3))
)))
(assert (forall ((Heap@@14 T@U) (t_2@@4 T@U) ) (!  (=> (and (= (type Heap@@14) (MapType0Type RefType)) (= (type t_2@@4) Triple3DomainTypeType)) (dummyFunction (int_2_U (|tripleLen3Bad#triggerStateless| t_2@@4))))
 :qid |stdinbpl.1330:15|
 :skolemid |111|
 :pattern ( (|tripleLen3Bad'| Heap@@14 t_2@@4))
)))
(assert  (and (forall ((arg0@@27 T@U) ) (! (= (type (get_Triple2_x arg0@@27)) Triple3DomainTypeType)
 :qid |funType:get_Triple2_x|
 :pattern ( (get_Triple2_x arg0@@27))
)) (forall ((arg0@@28 T@U) ) (! (= (type (get_Triple1_x arg0@@28)) Triple2DomainTypeType)
 :qid |funType:get_Triple1_x|
 :pattern ( (get_Triple1_x arg0@@28))
))))
(assert (forall ((Heap@@15 T@U) (Mask@@4 T@U) (t_2@@5 T@U) ) (!  (=> (and (and (and (= (type Heap@@15) (MapType0Type RefType)) (= (type Mask@@4) (MapType1Type RefType realType))) (= (type t_2@@5) Triple1DomainTypeType)) (and (state Heap@@15 Mask@@4) (< AssumeFunctionsAbove 6))) (= (tripleLen1Bad Heap@@15 t_2@@5) (+ 2 (ite (= (Triple3_tag (get_Triple2_x (get_Triple1_x t_2@@5))) 0) 0 (|tripleLen1Bad'| Heap@@15 t_2@@5)))))
 :qid |stdinbpl.1210:15|
 :skolemid |104|
 :pattern ( (state Heap@@15 Mask@@4) (tripleLen1Bad Heap@@15 t_2@@5))
)))
(assert (forall ((arg0@@29 Int) (arg1@@9 T@U) ) (! (= (type (NonEmpty arg0@@29 arg1@@9)) List2DomainTypeType)
 :qid |funType:NonEmpty|
 :pattern ( (NonEmpty arg0@@29 arg1@@9))
)))
(assert (forall ((t_2@@6 T@U) ) (!  (=> (= (type t_2@@6) List2DomainTypeType) (or (= t_2@@6 Empty) (= t_2@@6 (NonEmpty (get_List2_x t_2@@6) (get_List2_l t_2@@6)))))
 :qid |stdinbpl.313:15|
 :skolemid |32|
 :pattern ( (List2_tag t_2@@6))
 :pattern ( (get_List2_x t_2@@6))
 :pattern ( (get_List2_l t_2@@6))
)))
(assert  (and (and (forall ((arg0@@30 T@U) ) (! (= (type (get_MList2_l arg0@@30)) MList1DomainTypeType)
 :qid |funType:get_MList2_l|
 :pattern ( (get_MList2_l arg0@@30))
)) (= (type MEmpty) MList2DomainTypeType)) (forall ((arg0@@31 Int) (arg1@@10 T@U) ) (! (= (type (MNonEmpty arg0@@31 arg1@@10)) MList2DomainTypeType)
 :qid |funType:MNonEmpty|
 :pattern ( (MNonEmpty arg0@@31 arg1@@10))
))))
(assert (forall ((t_2@@7 T@U) ) (!  (=> (= (type t_2@@7) MList2DomainTypeType) (or (= t_2@@7 MEmpty) (= t_2@@7 (MNonEmpty (get_MList2_y t_2@@7) (get_MList2_l t_2@@7)))))
 :qid |stdinbpl.458:15|
 :skolemid |46|
 :pattern ( (MList2_tag t_2@@7))
 :pattern ( (get_MList2_y t_2@@7))
 :pattern ( (get_MList2_l t_2@@7))
)))
(assert  (and (and (forall ((arg0@@32 T@U) ) (! (= (type (triple3 arg0@@32)) Triple3DomainTypeType)
 :qid |funType:triple3|
 :pattern ( (triple3 arg0@@32))
)) (forall ((arg0@@33 T@U) ) (! (= (type (get_Triple3_x arg0@@33)) Triple1DomainTypeType)
 :qid |funType:get_Triple3_x|
 :pattern ( (get_Triple3_x arg0@@33))
))) (forall ((arg0@@34 Int) ) (! (= (type (nil arg0@@34)) Triple3DomainTypeType)
 :qid |funType:nil|
 :pattern ( (nil arg0@@34))
))))
(assert (forall ((t_2@@8 T@U) ) (!  (=> (= (type t_2@@8) Triple3DomainTypeType) (or (= t_2@@8 (triple3 (get_Triple3_x t_2@@8))) (= t_2@@8 (nil (get_Triple3_i t_2@@8)))))
 :qid |stdinbpl.656:15|
 :skolemid |66|
 :pattern ( (Triple3_tag t_2@@8))
 :pattern ( (get_Triple3_i t_2@@8))
)))
(assert (forall ((arg0@@35 Int) (arg1@@11 T@U) ) (! (= (type (RList1 arg0@@35 arg1@@11)) List1DomainTypeType)
 :qid |funType:RList1|
 :pattern ( (RList1 arg0@@35 arg1@@11))
)))
(assert (forall ((l_1_1 T@U) (x_0 Int) (x_1@@6 Int) ) (!  (=> (= (type l_1_1) List1DomainTypeType) (decreasing l_1_1 (RList1 x_1@@6 (NonEmpty x_0 l_1_1))))
 :qid |stdinbpl.252:15|
 :skolemid |26|
 :pattern ( (RList1 x_1@@6 (NonEmpty x_0 l_1_1)))
)))
(assert (forall ((l_1_1@@0 T@U) (x_0@@0 Int) (x_1@@7 Int) ) (!  (=> (= (type l_1_1@@0) List2DomainTypeType) (decreasing l_1_1@@0 (NonEmpty x_1@@7 (RList1 x_0@@0 l_1_1@@0))))
 :qid |stdinbpl.329:15|
 :skolemid |33|
 :pattern ( (NonEmpty x_1@@7 (RList1 x_0@@0 l_1_1@@0)))
)))
(assert (forall ((arg0@@36 Int) (arg1@@12 T@U) ) (! (= (type (MRList1 arg0@@36 arg1@@12)) MList1DomainTypeType)
 :qid |funType:MRList1|
 :pattern ( (MRList1 arg0@@36 arg1@@12))
)))
(assert (forall ((l_1_1@@1 T@U) (y_0 Int) (x_1@@8 Int) ) (!  (=> (= (type l_1_1@@1) MList1DomainTypeType) (decreasing l_1_1@@1 (MRList1 x_1@@8 (MNonEmpty y_0 l_1_1@@1))))
 :qid |stdinbpl.397:15|
 :skolemid |40|
 :pattern ( (MRList1 x_1@@8 (MNonEmpty y_0 l_1_1@@1)))
)))
(assert (forall ((y_1_1 T@U) (x_0@@1 Int) (y_1 Int) ) (!  (=> (= (type y_1_1) MList2DomainTypeType) (decreasing y_1_1 (MNonEmpty y_1 (MRList1 x_0@@1 y_1_1))))
 :qid |stdinbpl.474:15|
 :skolemid |47|
 :pattern ( (MNonEmpty y_1 (MRList1 x_0@@1 y_1_1)))
)))
(assert  (and (= (Ctor NormalFieldType) 18) (= (type $allocated) (FieldType NormalFieldType boolType))))
(assert (forall ((Heap@@16 T@U) (ExhaleHeap@@1 T@U) (Mask@@5 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@16) (MapType0Type RefType)) (= (type ExhaleHeap@@1) (MapType0Type RefType))) (= (type Mask@@5) (MapType1Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@16 ExhaleHeap@@1 Mask@@5)) (U_2_bool (MapType0Select Heap@@16 o_1 $allocated))) (U_2_bool (MapType0Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.73:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@16 ExhaleHeap@@1 Mask@@5) (MapType0Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert (forall ((Heap@@17 T@U) (l_1@@6 T@U) ) (!  (=> (and (= (type Heap@@17) (MapType0Type RefType)) (= (type l_1@@6) List2DomainTypeType)) (and (= (len2 Heap@@17 l_1@@6) (|len2'| Heap@@17 l_1@@6)) (dummyFunction (int_2_U (|len2#triggerStateless| l_1@@6)))))
 :qid |stdinbpl.696:15|
 :skolemid |70|
 :pattern ( (len2 Heap@@17 l_1@@6))
)))
(assert (forall ((Heap@@18 T@U) (l_1@@7 T@U) ) (!  (=> (and (= (type Heap@@18) (MapType0Type RefType)) (= (type l_1@@7) List2DomainTypeType)) (and (= (len2Bad Heap@@18 l_1@@7) (|len2Bad'| Heap@@18 l_1@@7)) (dummyFunction (int_2_U (|len2Bad#triggerStateless| l_1@@7)))))
 :qid |stdinbpl.759:15|
 :skolemid |74|
 :pattern ( (len2Bad Heap@@18 l_1@@7))
)))
(assert (forall ((Heap@@19 T@U) (l_1@@8 T@U) ) (!  (=> (and (= (type Heap@@19) (MapType0Type RefType)) (= (type l_1@@8) List1DomainTypeType)) (and (= (len1 Heap@@19 l_1@@8) (|len1'| Heap@@19 l_1@@8)) (dummyFunction (int_2_U (|len1#triggerStateless| l_1@@8)))))
 :qid |stdinbpl.822:15|
 :skolemid |78|
 :pattern ( (len1 Heap@@19 l_1@@8))
)))
(assert (forall ((Heap@@20 T@U) (l_1@@9 T@U) ) (!  (=> (and (= (type Heap@@20) (MapType0Type RefType)) (= (type l_1@@9) List1DomainTypeType)) (and (= (len1Bad Heap@@20 l_1@@9) (|len1Bad'| Heap@@20 l_1@@9)) (dummyFunction (int_2_U (|len1Bad#triggerStateless| l_1@@9)))))
 :qid |stdinbpl.885:15|
 :skolemid |82|
 :pattern ( (len1Bad Heap@@20 l_1@@9))
)))
(assert (forall ((Heap@@21 T@U) (l_1@@10 T@U) ) (!  (=> (and (= (type Heap@@21) (MapType0Type RefType)) (= (type l_1@@10) MList2DomainTypeType)) (and (= (mlen2 Heap@@21 l_1@@10) (|mlen2'| Heap@@21 l_1@@10)) (dummyFunction (int_2_U (|mlen2#triggerStateless| l_1@@10)))))
 :qid |stdinbpl.948:15|
 :skolemid |86|
 :pattern ( (mlen2 Heap@@21 l_1@@10))
)))
(assert (forall ((Heap@@22 T@U) (t_2@@9 T@U) ) (!  (=> (and (= (type Heap@@22) (MapType0Type RefType)) (= (type t_2@@9) Triple1DomainTypeType)) (and (= (tripleLen1 Heap@@22 t_2@@9) (|tripleLen1'| Heap@@22 t_2@@9)) (dummyFunction (int_2_U (|tripleLen1#triggerStateless| t_2@@9)))))
 :qid |stdinbpl.1011:15|
 :skolemid |90|
 :pattern ( (tripleLen1 Heap@@22 t_2@@9))
)))
(assert (forall ((Heap@@23 T@U) (t_2@@10 T@U) ) (!  (=> (and (= (type Heap@@23) (MapType0Type RefType)) (= (type t_2@@10) Triple2DomainTypeType)) (and (= (tripleLen2 Heap@@23 t_2@@10) (|tripleLen2'| Heap@@23 t_2@@10)) (dummyFunction (int_2_U (|tripleLen2#triggerStateless| t_2@@10)))))
 :qid |stdinbpl.1074:15|
 :skolemid |94|
 :pattern ( (tripleLen2 Heap@@23 t_2@@10))
)))
(assert (forall ((Heap@@24 T@U) (t_2@@11 T@U) ) (!  (=> (and (= (type Heap@@24) (MapType0Type RefType)) (= (type t_2@@11) Triple3DomainTypeType)) (and (= (tripleLen3 Heap@@24 t_2@@11) (|tripleLen3'| Heap@@24 t_2@@11)) (dummyFunction (int_2_U (|tripleLen3#triggerStateless| t_2@@11)))))
 :qid |stdinbpl.1137:15|
 :skolemid |98|
 :pattern ( (tripleLen3 Heap@@24 t_2@@11))
)))
(assert (forall ((Heap@@25 T@U) (t_2@@12 T@U) ) (!  (=> (and (= (type Heap@@25) (MapType0Type RefType)) (= (type t_2@@12) Triple1DomainTypeType)) (and (= (tripleLen1Bad Heap@@25 t_2@@12) (|tripleLen1Bad'| Heap@@25 t_2@@12)) (dummyFunction (int_2_U (|tripleLen1Bad#triggerStateless| t_2@@12)))))
 :qid |stdinbpl.1200:15|
 :skolemid |102|
 :pattern ( (tripleLen1Bad Heap@@25 t_2@@12))
)))
(assert (forall ((Heap@@26 T@U) (t_2@@13 T@U) ) (!  (=> (and (= (type Heap@@26) (MapType0Type RefType)) (= (type t_2@@13) Triple2DomainTypeType)) (and (= (tripleLen2Bad Heap@@26 t_2@@13) (|tripleLen2Bad'| Heap@@26 t_2@@13)) (dummyFunction (int_2_U (|tripleLen2Bad#triggerStateless| t_2@@13)))))
 :qid |stdinbpl.1263:15|
 :skolemid |106|
 :pattern ( (tripleLen2Bad Heap@@26 t_2@@13))
)))
(assert (forall ((Heap@@27 T@U) (t_2@@14 T@U) ) (!  (=> (and (= (type Heap@@27) (MapType0Type RefType)) (= (type t_2@@14) Triple3DomainTypeType)) (and (= (tripleLen3Bad Heap@@27 t_2@@14) (|tripleLen3Bad'| Heap@@27 t_2@@14)) (dummyFunction (int_2_U (|tripleLen3Bad#triggerStateless| t_2@@14)))))
 :qid |stdinbpl.1326:15|
 :skolemid |110|
 :pattern ( (tripleLen3Bad Heap@@27 t_2@@14))
)))
(assert (forall ((Heap@@28 T@U) (Mask@@6 T@U) (l_1@@11 T@U) ) (!  (=> (and (and (and (= (type Heap@@28) (MapType0Type RefType)) (= (type Mask@@6) (MapType1Type RefType realType))) (= (type l_1@@11) List2DomainTypeType)) (and (state Heap@@28 Mask@@6) (< AssumeFunctionsAbove 5))) (= (len2 Heap@@28 l_1@@11) (ite (= l_1@@11 Empty) 0 (+ 1 (|len2'| Heap@@28 (get_List1_l (get_List2_l l_1@@11)))))))
 :qid |stdinbpl.706:15|
 :skolemid |72|
 :pattern ( (state Heap@@28 Mask@@6) (len2 Heap@@28 l_1@@11))
)))
(assert (forall ((arg0@@37 T@U) ) (! (= (type (get_MList1_y arg0@@37)) MList2DomainTypeType)
 :qid |funType:get_MList1_y|
 :pattern ( (get_MList1_y arg0@@37))
)))
(assert (forall ((Heap@@29 T@U) (Mask@@7 T@U) (l_1@@12 T@U) ) (!  (=> (and (and (and (= (type Heap@@29) (MapType0Type RefType)) (= (type Mask@@7) (MapType1Type RefType realType))) (= (type l_1@@12) MList2DomainTypeType)) (and (state Heap@@29 Mask@@7) (< AssumeFunctionsAbove 7))) (= (mlen2 Heap@@29 l_1@@12) (ite (= l_1@@12 MEmpty) 0 (+ 1 (|mlen2'| Heap@@29 (get_MList1_y (get_MList2_l l_1@@12)))))))
 :qid |stdinbpl.958:15|
 :skolemid |88|
 :pattern ( (state Heap@@29 Mask@@7) (mlen2 Heap@@29 l_1@@12))
)))
(assert (forall ((Heap@@30 T@U) (Mask@@8 T@U) (t_2@@15 T@U) ) (!  (=> (and (and (and (= (type Heap@@30) (MapType0Type RefType)) (= (type Mask@@8) (MapType1Type RefType realType))) (= (type t_2@@15) Triple2DomainTypeType)) (and (state Heap@@30 Mask@@8) (< AssumeFunctionsAbove 1))) (= (tripleLen2 Heap@@30 t_2@@15) (+ 1 (ite (= (Triple3_tag (get_Triple2_x t_2@@15)) 0) 0 (+ 1 (|tripleLen2'| Heap@@30 (get_Triple1_x (get_Triple3_x (get_Triple2_x t_2@@15)))))))))
 :qid |stdinbpl.1084:15|
 :skolemid |96|
 :pattern ( (state Heap@@30 Mask@@8) (tripleLen2 Heap@@30 t_2@@15))
)))
(assert (= (List2_tag Empty) 0))
(assert (= (MList2_tag MEmpty) 0))
(assert (forall ((Heap@@31 T@U) (ExhaleHeap@@2 T@U) (Mask@@9 T@U) (o_1@@0 T@U) (f_2 T@U) ) (! (let ((B@@1 (FieldTypeInv1 (type f_2))))
(let ((A@@1 (FieldTypeInv0 (type f_2))))
 (=> (and (and (and (and (and (and (= (type Heap@@31) (MapType0Type RefType)) (= (type ExhaleHeap@@2) (MapType0Type RefType))) (= (type Mask@@9) (MapType1Type RefType realType))) (= (type o_1@@0) RefType)) (= (type f_2) (FieldType A@@1 B@@1))) (IdenticalOnKnownLocations Heap@@31 ExhaleHeap@@2 Mask@@9)) (HasDirectPerm Mask@@9 o_1@@0 f_2)) (= (MapType0Select Heap@@31 o_1@@0 f_2) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2)))))
 :qid |stdinbpl.42:22|
 :skolemid |1|
 :pattern ( (IdenticalOnKnownLocations Heap@@31 ExhaleHeap@@2 Mask@@9) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2))
)))
(assert  (and (= (type dummyHeap) (MapType0Type RefType)) (= (type ZeroMask) (MapType1Type RefType realType))))
(assert (state dummyHeap ZeroMask))
(assert  (and (forall ((arg0@@38 T@U) ) (! (= (type (triple1 arg0@@38)) Triple1DomainTypeType)
 :qid |funType:triple1|
 :pattern ( (triple1 arg0@@38))
)) (forall ((arg0@@39 T@U) ) (! (= (type (triple2 arg0@@39)) Triple2DomainTypeType)
 :qid |funType:triple2|
 :pattern ( (triple2 arg0@@39))
))))
(assert (forall ((x_2 T@U) ) (!  (=> (= (type x_2) Triple1DomainTypeType) (decreasing x_2 (triple1 (triple2 (triple3 x_2)))))
 :qid |stdinbpl.533:15|
 :skolemid |53|
 :pattern ( (triple1 (triple2 (triple3 x_2))))
)))
(assert (forall ((x_2@@0 T@U) ) (!  (=> (= (type x_2@@0) Triple2DomainTypeType) (decreasing x_2@@0 (triple2 (triple3 (triple1 x_2@@0)))))
 :qid |stdinbpl.592:15|
 :skolemid |59|
 :pattern ( (triple2 (triple3 (triple1 x_2@@0))))
)))
(assert (forall ((x_2@@1 T@U) ) (!  (=> (= (type x_2@@1) Triple3DomainTypeType) (decreasing x_2@@1 (triple3 (triple1 (triple2 x_2@@1)))))
 :qid |stdinbpl.669:15|
 :skolemid |67|
 :pattern ( (triple3 (triple1 (triple2 x_2@@1))))
)))
(assert (forall ((p T@U) (v_1 T@U) (w T@U) ) (! (let ((A@@2 (FieldTypeInv0 (type p))))
 (=> (and (and (= (type p) (FieldType A@@2 FrameTypeType)) (= (type v_1) FrameTypeType)) (= (type w) FrameTypeType)) (not (InsidePredicate p v_1 p w))))
 :qid |stdinbpl.183:19|
 :skolemid |21|
 :pattern ( (InsidePredicate p v_1 p w))
)))
(assert (forall ((Heap@@32 T@U) (ExhaleHeap@@3 T@U) (Mask@@10 T@U) ) (!  (=> (and (and (and (= (type Heap@@32) (MapType0Type RefType)) (= (type ExhaleHeap@@3) (MapType0Type RefType))) (= (type Mask@@10) (MapType1Type RefType realType))) (IdenticalOnKnownLocations Heap@@32 ExhaleHeap@@3 Mask@@10)) (succHeap Heap@@32 ExhaleHeap@@3))
 :qid |stdinbpl.83:15|
 :skolemid |10|
 :pattern ( (IdenticalOnKnownLocations Heap@@32 ExhaleHeap@@3 Mask@@10))
)))
(assert (forall ((t_2@@16 T@U) ) (!  (=> (= (type t_2@@16) List1DomainTypeType) (= t_2@@16 (RList1 (get_List1_x t_2@@16) (get_List1_l t_2@@16))))
 :qid |stdinbpl.239:15|
 :skolemid |25|
 :pattern ( (List1_tag t_2@@16))
 :pattern ( (get_List1_x t_2@@16))
 :pattern ( (get_List1_l t_2@@16))
)))
(assert (forall ((t_2@@17 T@U) ) (!  (=> (= (type t_2@@17) MList1DomainTypeType) (= t_2@@17 (MRList1 (get_MList1_x t_2@@17) (get_MList1_y t_2@@17))))
 :qid |stdinbpl.384:15|
 :skolemid |39|
 :pattern ( (MList1_tag t_2@@17))
 :pattern ( (get_MList1_x t_2@@17))
 :pattern ( (get_MList1_y t_2@@17))
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
(assert  (and (forall ((arg0@@40 Real) (arg1@@13 T@U) ) (! (= (type (ConditionalFrame arg0@@40 arg1@@13)) FrameTypeType)
 :qid |funType:ConditionalFrame|
 :pattern ( (ConditionalFrame arg0@@40 arg1@@13))
)) (= (type EmptyFrame) FrameTypeType)))
(assert (forall ((p@@0 Real) (f_6 T@U) ) (!  (=> (= (type f_6) FrameTypeType) (= (ConditionalFrame p@@0 f_6) (ite (> p@@0 0.0) f_6 EmptyFrame)))
 :qid |stdinbpl.171:15|
 :skolemid |19|
 :pattern ( (ConditionalFrame p@@0 f_6))
)))
(assert (forall ((Mask@@11 T@U) (o_2@@0 T@U) (f_4@@0 T@U) ) (! (let ((B@@3 (FieldTypeInv1 (type f_4@@0))))
(let ((A@@4 (FieldTypeInv0 (type f_4@@0))))
 (=> (and (and (= (type Mask@@11) (MapType1Type RefType realType)) (= (type o_2@@0) RefType)) (= (type f_4@@0) (FieldType A@@4 B@@3))) (= (HasDirectPerm Mask@@11 o_2@@0 f_4@@0) (> (U_2_real (MapType1Select Mask@@11 o_2@@0 f_4@@0)) NoPerm)))))
 :qid |stdinbpl.133:22|
 :skolemid |17|
 :pattern ( (HasDirectPerm Mask@@11 o_2@@0 f_4@@0))
)))
(assert (forall ((Heap@@33 T@U) (Mask@@12 T@U) (t_2@@18 T@U) ) (!  (=> (and (and (and (= (type Heap@@33) (MapType0Type RefType)) (= (type Mask@@12) (MapType1Type RefType realType))) (= (type t_2@@18) Triple1DomainTypeType)) (and (state Heap@@33 Mask@@12) (< AssumeFunctionsAbove 8))) (= (tripleLen1 Heap@@33 t_2@@18) (+ 2 (ite (= (Triple3_tag (get_Triple2_x (get_Triple1_x t_2@@18))) 0) 0 (|tripleLen1'| Heap@@33 (get_Triple3_x (get_Triple2_x (get_Triple1_x t_2@@18))))))))
 :qid |stdinbpl.1021:15|
 :skolemid |92|
 :pattern ( (state Heap@@33 Mask@@12) (tripleLen1 Heap@@33 t_2@@18))
)))
(assert (forall ((Heap@@34 T@U) (Mask@@13 T@U) (t_2@@19 T@U) ) (!  (=> (and (and (and (= (type Heap@@34) (MapType0Type RefType)) (= (type Mask@@13) (MapType1Type RefType realType))) (= (type t_2@@19) Triple3DomainTypeType)) (and (state Heap@@34 Mask@@13) (< AssumeFunctionsAbove 10))) (= (tripleLen3Bad Heap@@34 t_2@@19) (ite (= (Triple3_tag t_2@@19) 0) 0 (+ 3 (|tripleLen3Bad'| Heap@@34 t_2@@19)))))
 :qid |stdinbpl.1336:15|
 :skolemid |112|
 :pattern ( (state Heap@@34 Mask@@13) (tripleLen3Bad Heap@@34 t_2@@19))
)))
(assert (forall ((o_2@@1 T@U) (f_4@@1 T@U) ) (! (let ((B@@4 (FieldTypeInv1 (type f_4@@1))))
(let ((A@@5 (FieldTypeInv0 (type f_4@@1))))
 (=> (and (= (type o_2@@1) RefType) (= (type f_4@@1) (FieldType A@@5 B@@4))) (= (U_2_real (MapType1Select ZeroMask o_2@@1 f_4@@1)) NoPerm))))
 :qid |stdinbpl.106:22|
 :skolemid |13|
 :pattern ( (MapType1Select ZeroMask o_2@@1 f_4@@1))
)))
(assert (forall ((Heap@@35 T@U) (ExhaleHeap@@4 T@U) (Mask@@14 T@U) (pm_f@@1 T@U) ) (! (let ((C@@1 (FieldTypeInv0 (type pm_f@@1))))
 (=> (and (and (and (and (and (= (type Heap@@35) (MapType0Type RefType)) (= (type ExhaleHeap@@4) (MapType0Type RefType))) (= (type Mask@@14) (MapType1Type RefType realType))) (= (type pm_f@@1) (FieldType C@@1 FrameTypeType))) (IdenticalOnKnownLocations Heap@@35 ExhaleHeap@@4 Mask@@14)) (and (HasDirectPerm Mask@@14 null pm_f@@1) (IsPredicateField pm_f@@1))) (forall ((o2 T@U) (f_2@@0 T@U) ) (! (let ((B@@5 (FieldTypeInv1 (type f_2@@0))))
(let ((A@@6 (FieldTypeInv0 (type f_2@@0))))
 (=> (and (and (= (type o2) RefType) (= (type f_2@@0) (FieldType A@@6 B@@5))) (U_2_bool (MapType1Select (MapType0Select Heap@@35 null (PredicateMaskField pm_f@@1)) o2 f_2@@0))) (= (MapType0Select Heap@@35 o2 f_2@@0) (MapType0Select ExhaleHeap@@4 o2 f_2@@0)))))
 :qid |stdinbpl.54:134|
 :skolemid |3|
 :pattern ( (MapType0Select ExhaleHeap@@4 o2 f_2@@0))
))))
 :qid |stdinbpl.52:19|
 :skolemid |4|
 :pattern ( (IdenticalOnKnownLocations Heap@@35 ExhaleHeap@@4 Mask@@14) (IsPredicateField pm_f@@1))
)))
(assert (forall ((Heap@@36 T@U) (ExhaleHeap@@5 T@U) (Mask@@15 T@U) (pm_f@@2 T@U) ) (! (let ((C@@2 (FieldTypeInv0 (type pm_f@@2))))
 (=> (and (and (and (and (and (= (type Heap@@36) (MapType0Type RefType)) (= (type ExhaleHeap@@5) (MapType0Type RefType))) (= (type Mask@@15) (MapType1Type RefType realType))) (= (type pm_f@@2) (FieldType C@@2 FrameTypeType))) (IdenticalOnKnownLocations Heap@@36 ExhaleHeap@@5 Mask@@15)) (and (HasDirectPerm Mask@@15 null pm_f@@2) (IsWandField pm_f@@2))) (forall ((o2@@0 T@U) (f_2@@1 T@U) ) (! (let ((B@@6 (FieldTypeInv1 (type f_2@@1))))
(let ((A@@7 (FieldTypeInv0 (type f_2@@1))))
 (=> (and (and (= (type o2@@0) RefType) (= (type f_2@@1) (FieldType A@@7 B@@6))) (U_2_bool (MapType1Select (MapType0Select Heap@@36 null (WandMaskField pm_f@@2)) o2@@0 f_2@@1))) (= (MapType0Select Heap@@36 o2@@0 f_2@@1) (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1)))))
 :qid |stdinbpl.67:129|
 :skolemid |6|
 :pattern ( (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1))
))))
 :qid |stdinbpl.65:19|
 :skolemid |7|
 :pattern ( (IdenticalOnKnownLocations Heap@@36 ExhaleHeap@@5 Mask@@15) (IsWandField pm_f@@2))
)))
(assert (forall ((Mask@@16 T@U) (o_2@@2 T@U) (f_4@@2 T@U) ) (! (let ((B@@7 (FieldTypeInv1 (type f_4@@2))))
(let ((A@@8 (FieldTypeInv0 (type f_4@@2))))
 (=> (and (and (and (= (type Mask@@16) (MapType1Type RefType realType)) (= (type o_2@@2) RefType)) (= (type f_4@@2) (FieldType A@@8 B@@7))) (GoodMask Mask@@16)) (and (>= (U_2_real (MapType1Select Mask@@16 o_2@@2 f_4@@2)) NoPerm) (=> (and (and (GoodMask Mask@@16) (not (IsPredicateField f_4@@2))) (not (IsWandField f_4@@2))) (<= (U_2_real (MapType1Select Mask@@16 o_2@@2 f_4@@2)) FullPerm))))))
 :qid |stdinbpl.128:22|
 :skolemid |16|
 :pattern ( (GoodMask Mask@@16) (MapType1Select Mask@@16 o_2@@2 f_4@@2))
)))
(assert (forall ((Heap@@37 T@U) (Mask@@17 T@U) (l_1@@13 T@U) ) (!  (=> (and (and (and (= (type Heap@@37) (MapType0Type RefType)) (= (type Mask@@17) (MapType1Type RefType realType))) (= (type l_1@@13) List2DomainTypeType)) (state Heap@@37 Mask@@17)) (= (|len2'| Heap@@37 l_1@@13) (|len2#frame| EmptyFrame l_1@@13)))
 :qid |stdinbpl.713:15|
 :skolemid |73|
 :pattern ( (state Heap@@37 Mask@@17) (|len2'| Heap@@37 l_1@@13))
)))
(assert (forall ((Heap@@38 T@U) (Mask@@18 T@U) (l_1@@14 T@U) ) (!  (=> (and (and (and (= (type Heap@@38) (MapType0Type RefType)) (= (type Mask@@18) (MapType1Type RefType realType))) (= (type l_1@@14) List2DomainTypeType)) (state Heap@@38 Mask@@18)) (= (|len2Bad'| Heap@@38 l_1@@14) (|len2Bad#frame| EmptyFrame l_1@@14)))
 :qid |stdinbpl.776:15|
 :skolemid |77|
 :pattern ( (state Heap@@38 Mask@@18) (|len2Bad'| Heap@@38 l_1@@14))
)))
(assert (forall ((Heap@@39 T@U) (Mask@@19 T@U) (l_1@@15 T@U) ) (!  (=> (and (and (and (= (type Heap@@39) (MapType0Type RefType)) (= (type Mask@@19) (MapType1Type RefType realType))) (= (type l_1@@15) List1DomainTypeType)) (state Heap@@39 Mask@@19)) (= (|len1'| Heap@@39 l_1@@15) (|len1#frame| EmptyFrame l_1@@15)))
 :qid |stdinbpl.839:15|
 :skolemid |81|
 :pattern ( (state Heap@@39 Mask@@19) (|len1'| Heap@@39 l_1@@15))
)))
(assert (forall ((Heap@@40 T@U) (Mask@@20 T@U) (l_1@@16 T@U) ) (!  (=> (and (and (and (= (type Heap@@40) (MapType0Type RefType)) (= (type Mask@@20) (MapType1Type RefType realType))) (= (type l_1@@16) List1DomainTypeType)) (state Heap@@40 Mask@@20)) (= (|len1Bad'| Heap@@40 l_1@@16) (|len1Bad#frame| EmptyFrame l_1@@16)))
 :qid |stdinbpl.902:15|
 :skolemid |85|
 :pattern ( (state Heap@@40 Mask@@20) (|len1Bad'| Heap@@40 l_1@@16))
)))
(assert (forall ((Heap@@41 T@U) (Mask@@21 T@U) (l_1@@17 T@U) ) (!  (=> (and (and (and (= (type Heap@@41) (MapType0Type RefType)) (= (type Mask@@21) (MapType1Type RefType realType))) (= (type l_1@@17) MList2DomainTypeType)) (state Heap@@41 Mask@@21)) (= (|mlen2'| Heap@@41 l_1@@17) (|mlen2#frame| EmptyFrame l_1@@17)))
 :qid |stdinbpl.965:15|
 :skolemid |89|
 :pattern ( (state Heap@@41 Mask@@21) (|mlen2'| Heap@@41 l_1@@17))
)))
(assert (forall ((Heap@@42 T@U) (Mask@@22 T@U) (t_2@@20 T@U) ) (!  (=> (and (and (and (= (type Heap@@42) (MapType0Type RefType)) (= (type Mask@@22) (MapType1Type RefType realType))) (= (type t_2@@20) Triple1DomainTypeType)) (state Heap@@42 Mask@@22)) (= (|tripleLen1'| Heap@@42 t_2@@20) (|tripleLen1#frame| EmptyFrame t_2@@20)))
 :qid |stdinbpl.1028:15|
 :skolemid |93|
 :pattern ( (state Heap@@42 Mask@@22) (|tripleLen1'| Heap@@42 t_2@@20))
)))
(assert (forall ((Heap@@43 T@U) (Mask@@23 T@U) (t_2@@21 T@U) ) (!  (=> (and (and (and (= (type Heap@@43) (MapType0Type RefType)) (= (type Mask@@23) (MapType1Type RefType realType))) (= (type t_2@@21) Triple2DomainTypeType)) (state Heap@@43 Mask@@23)) (= (|tripleLen2'| Heap@@43 t_2@@21) (|tripleLen2#frame| EmptyFrame t_2@@21)))
 :qid |stdinbpl.1091:15|
 :skolemid |97|
 :pattern ( (state Heap@@43 Mask@@23) (|tripleLen2'| Heap@@43 t_2@@21))
)))
(assert (forall ((Heap@@44 T@U) (Mask@@24 T@U) (t_2@@22 T@U) ) (!  (=> (and (and (and (= (type Heap@@44) (MapType0Type RefType)) (= (type Mask@@24) (MapType1Type RefType realType))) (= (type t_2@@22) Triple3DomainTypeType)) (state Heap@@44 Mask@@24)) (= (|tripleLen3'| Heap@@44 t_2@@22) (|tripleLen3#frame| EmptyFrame t_2@@22)))
 :qid |stdinbpl.1154:15|
 :skolemid |101|
 :pattern ( (state Heap@@44 Mask@@24) (|tripleLen3'| Heap@@44 t_2@@22))
)))
(assert (forall ((Heap@@45 T@U) (Mask@@25 T@U) (t_2@@23 T@U) ) (!  (=> (and (and (and (= (type Heap@@45) (MapType0Type RefType)) (= (type Mask@@25) (MapType1Type RefType realType))) (= (type t_2@@23) Triple1DomainTypeType)) (state Heap@@45 Mask@@25)) (= (|tripleLen1Bad'| Heap@@45 t_2@@23) (|tripleLen1Bad#frame| EmptyFrame t_2@@23)))
 :qid |stdinbpl.1217:15|
 :skolemid |105|
 :pattern ( (state Heap@@45 Mask@@25) (|tripleLen1Bad'| Heap@@45 t_2@@23))
)))
(assert (forall ((Heap@@46 T@U) (Mask@@26 T@U) (t_2@@24 T@U) ) (!  (=> (and (and (and (= (type Heap@@46) (MapType0Type RefType)) (= (type Mask@@26) (MapType1Type RefType realType))) (= (type t_2@@24) Triple2DomainTypeType)) (state Heap@@46 Mask@@26)) (= (|tripleLen2Bad'| Heap@@46 t_2@@24) (|tripleLen2Bad#frame| EmptyFrame t_2@@24)))
 :qid |stdinbpl.1280:15|
 :skolemid |109|
 :pattern ( (state Heap@@46 Mask@@26) (|tripleLen2Bad'| Heap@@46 t_2@@24))
)))
(assert (forall ((Heap@@47 T@U) (Mask@@27 T@U) (t_2@@25 T@U) ) (!  (=> (and (and (and (= (type Heap@@47) (MapType0Type RefType)) (= (type Mask@@27) (MapType1Type RefType realType))) (= (type t_2@@25) Triple3DomainTypeType)) (state Heap@@47 Mask@@27)) (= (|tripleLen3Bad'| Heap@@47 t_2@@25) (|tripleLen3Bad#frame| EmptyFrame t_2@@25)))
 :qid |stdinbpl.1343:15|
 :skolemid |113|
 :pattern ( (state Heap@@47 Mask@@27) (|tripleLen3Bad'| Heap@@47 t_2@@25))
)))
(assert (forall ((o T@U) (f T@U) (Heap@@48 T@U) ) (!  (=> (and (and (and (= (type o) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap@@48) (MapType0Type RefType))) (U_2_bool (MapType0Select Heap@@48 o $allocated))) (U_2_bool (MapType0Select Heap@@48 (MapType0Select Heap@@48 o f) $allocated)))
 :qid |stdinbpl.31:15|
 :skolemid |0|
 :pattern ( (MapType0Select Heap@@48 o f))
)))
(assert (forall ((x_1@@9 Int) (l_1@@18 T@U) ) (!  (=> (= (type l_1@@18) List2DomainTypeType) (= x_1@@9 (get_List1_x (RList1 x_1@@9 l_1@@18))))
 :qid |stdinbpl.221:15|
 :skolemid |22|
 :pattern ( (RList1 x_1@@9 l_1@@18))
)))
(assert (forall ((x_1@@10 Int) (l_1@@19 T@U) ) (!  (=> (= (type l_1@@19) List2DomainTypeType) (= l_1@@19 (get_List1_l (RList1 x_1@@10 l_1@@19))))
 :qid |stdinbpl.227:15|
 :skolemid |23|
 :pattern ( (RList1 x_1@@10 l_1@@19))
)))
(assert (forall ((x_1@@11 Int) (l_1@@20 T@U) ) (!  (=> (= (type l_1@@20) List1DomainTypeType) (= x_1@@11 (get_List2_x (NonEmpty x_1@@11 l_1@@20))))
 :qid |stdinbpl.292:15|
 :skolemid |29|
 :pattern ( (NonEmpty x_1@@11 l_1@@20))
)))
(assert (forall ((x_1@@12 Int) (l_1@@21 T@U) ) (!  (=> (= (type l_1@@21) List1DomainTypeType) (= l_1@@21 (get_List2_l (NonEmpty x_1@@12 l_1@@21))))
 :qid |stdinbpl.298:15|
 :skolemid |30|
 :pattern ( (NonEmpty x_1@@12 l_1@@21))
)))
(assert (forall ((x_1@@13 Int) (y_1@@0 T@U) ) (!  (=> (= (type y_1@@0) MList2DomainTypeType) (= x_1@@13 (get_MList1_x (MRList1 x_1@@13 y_1@@0))))
 :qid |stdinbpl.366:15|
 :skolemid |36|
 :pattern ( (MRList1 x_1@@13 y_1@@0))
)))
(assert (forall ((x_1@@14 Int) (y_1@@1 T@U) ) (!  (=> (= (type y_1@@1) MList2DomainTypeType) (= y_1@@1 (get_MList1_y (MRList1 x_1@@14 y_1@@1))))
 :qid |stdinbpl.372:15|
 :skolemid |37|
 :pattern ( (MRList1 x_1@@14 y_1@@1))
)))
(assert (forall ((y_1@@2 Int) (l_1@@22 T@U) ) (!  (=> (= (type l_1@@22) MList1DomainTypeType) (= y_1@@2 (get_MList2_y (MNonEmpty y_1@@2 l_1@@22))))
 :qid |stdinbpl.437:15|
 :skolemid |43|
 :pattern ( (MNonEmpty y_1@@2 l_1@@22))
)))
(assert (forall ((y_1@@3 Int) (l_1@@23 T@U) ) (!  (=> (= (type l_1@@23) MList1DomainTypeType) (= l_1@@23 (get_MList2_l (MNonEmpty y_1@@3 l_1@@23))))
 :qid |stdinbpl.443:15|
 :skolemid |44|
 :pattern ( (MNonEmpty y_1@@3 l_1@@23))
)))
(assert (forall ((x_1@@15 T@U) ) (!  (=> (= (type x_1@@15) Triple2DomainTypeType) (= x_1@@15 (get_Triple1_x (triple1 x_1@@15))))
 :qid |stdinbpl.508:15|
 :skolemid |50|
 :pattern ( (triple1 x_1@@15))
)))
(assert (forall ((t_2@@26 T@U) ) (!  (=> (= (type t_2@@26) Triple1DomainTypeType) (= t_2@@26 (triple1 (get_Triple1_x t_2@@26))))
 :qid |stdinbpl.520:15|
 :skolemid |52|
 :pattern ( (Triple1_tag t_2@@26))
 :pattern ( (get_Triple1_x t_2@@26))
)))
(assert (forall ((x_1@@16 T@U) ) (!  (=> (= (type x_1@@16) Triple3DomainTypeType) (= x_1@@16 (get_Triple2_x (triple2 x_1@@16))))
 :qid |stdinbpl.567:15|
 :skolemid |56|
 :pattern ( (triple2 x_1@@16))
)))
(assert (forall ((t_2@@27 T@U) ) (!  (=> (= (type t_2@@27) Triple2DomainTypeType) (= t_2@@27 (triple2 (get_Triple2_x t_2@@27))))
 :qid |stdinbpl.579:15|
 :skolemid |58|
 :pattern ( (Triple2_tag t_2@@27))
 :pattern ( (get_Triple2_x t_2@@27))
)))
(assert (forall ((x_1@@17 T@U) ) (!  (=> (= (type x_1@@17) Triple1DomainTypeType) (= x_1@@17 (get_Triple3_x (triple3 x_1@@17))))
 :qid |stdinbpl.632:15|
 :skolemid |62|
 :pattern ( (triple3 x_1@@17))
)))
(assert (forall ((i_1 Int) ) (! (= i_1 (get_Triple3_i (nil i_1)))
 :qid |stdinbpl.638:15|
 :skolemid |63|
 :pattern ( (nil i_1))
)))
(assert (forall ((Heap@@49 T@U) (o@@0 T@U) (f_3 T@U) (v T@U) ) (! (let ((B@@8 (type v)))
(let ((A@@9 (FieldTypeInv0 (type f_3))))
 (=> (and (and (= (type Heap@@49) (MapType0Type RefType)) (= (type o@@0) RefType)) (= (type f_3) (FieldType A@@9 B@@8))) (succHeap Heap@@49 (MapType0Store Heap@@49 o@@0 f_3 v)))))
 :qid |stdinbpl.78:22|
 :skolemid |9|
 :pattern ( (MapType0Store Heap@@49 o@@0 f_3 v))
)))
(assert (forall ((Heap@@50 T@U) (Mask@@28 T@U) (l_1@@24 T@U) ) (!  (=> (and (and (and (= (type Heap@@50) (MapType0Type RefType)) (= (type Mask@@28) (MapType1Type RefType realType))) (= (type l_1@@24) List1DomainTypeType)) (and (state Heap@@50 Mask@@28) (< AssumeFunctionsAbove 3))) (= (len1Bad Heap@@50 l_1@@24) (ite (= (get_List1_l l_1@@24) Empty) 0 (+ 1 (|len1Bad'| Heap@@50 l_1@@24)))))
 :qid |stdinbpl.895:15|
 :skolemid |84|
 :pattern ( (state Heap@@50 Mask@@28) (len1Bad Heap@@50 l_1@@24))
)))
(assert (= (type ZeroPMask) (MapType1Type RefType boolType)))
(assert (forall ((o_2@@3 T@U) (f_4@@3 T@U) ) (! (let ((B@@9 (FieldTypeInv1 (type f_4@@3))))
(let ((A@@10 (FieldTypeInv0 (type f_4@@3))))
 (=> (and (= (type o_2@@3) RefType) (= (type f_4@@3) (FieldType A@@10 B@@9))) (not (U_2_bool (MapType1Select ZeroPMask o_2@@3 f_4@@3))))))
 :qid |stdinbpl.112:22|
 :skolemid |14|
 :pattern ( (MapType1Select ZeroPMask o_2@@3 f_4@@3))
)))
(assert (forall ((x_1@@18 Int) (l_1@@25 T@U) ) (!  (=> (= (type l_1@@25) List2DomainTypeType) (= (List1_tag (RList1 x_1@@18 l_1@@25)) 0))
 :qid |stdinbpl.233:15|
 :skolemid |24|
 :pattern ( (RList1 x_1@@18 l_1@@25))
)))
(assert (forall ((x_1@@19 Int) (y_1@@4 T@U) ) (!  (=> (= (type y_1@@4) MList2DomainTypeType) (= (MList1_tag (MRList1 x_1@@19 y_1@@4)) 0))
 :qid |stdinbpl.378:15|
 :skolemid |38|
 :pattern ( (MRList1 x_1@@19 y_1@@4))
)))
(assert (forall ((x_1@@20 Int) (l_1@@26 T@U) ) (!  (=> (= (type l_1@@26) List1DomainTypeType) (= (List2_tag (NonEmpty x_1@@20 l_1@@26)) 1))
 :qid |stdinbpl.307:15|
 :skolemid |31|
 :pattern ( (NonEmpty x_1@@20 l_1@@26))
)))
(assert (forall ((y_1@@5 Int) (l_1@@27 T@U) ) (!  (=> (= (type l_1@@27) MList1DomainTypeType) (= (MList2_tag (MNonEmpty y_1@@5 l_1@@27)) 1))
 :qid |stdinbpl.452:15|
 :skolemid |45|
 :pattern ( (MNonEmpty y_1@@5 l_1@@27))
)))
(assert (forall ((Heap@@51 T@U) (Mask@@29 T@U) (t_2@@28 T@U) ) (!  (=> (and (and (and (= (type Heap@@51) (MapType0Type RefType)) (= (type Mask@@29) (MapType1Type RefType realType))) (= (type t_2@@28) Triple3DomainTypeType)) (and (state Heap@@51 Mask@@29) (< AssumeFunctionsAbove 4))) (= (tripleLen3 Heap@@51 t_2@@28) (ite (= (Triple3_tag t_2@@28) 0) 0 (+ 3 (|tripleLen3'| Heap@@51 (get_Triple2_x (get_Triple1_x (get_Triple3_x t_2@@28))))))))
 :qid |stdinbpl.1147:15|
 :skolemid |100|
 :pattern ( (state Heap@@51 Mask@@29) (tripleLen3 Heap@@51 t_2@@28))
)))
(assert (forall ((p@@1 T@U) (v_1@@0 T@U) (q T@U) (w@@0 T@U) (r T@U) (u T@U) ) (! (let ((C@@3 (FieldTypeInv0 (type r))))
(let ((B@@10 (FieldTypeInv0 (type q))))
(let ((A@@11 (FieldTypeInv0 (type p@@1))))
 (=> (and (and (and (and (and (and (= (type p@@1) (FieldType A@@11 FrameTypeType)) (= (type v_1@@0) FrameTypeType)) (= (type q) (FieldType B@@10 FrameTypeType))) (= (type w@@0) FrameTypeType)) (= (type r) (FieldType C@@3 FrameTypeType))) (= (type u) FrameTypeType)) (and (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))) (InsidePredicate p@@1 v_1@@0 r u)))))
 :qid |stdinbpl.178:25|
 :skolemid |20|
 :pattern ( (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))
)))
(assert (forall ((x_1@@21 T@U) ) (!  (=> (= (type x_1@@21) Triple2DomainTypeType) (= (Triple1_tag (triple1 x_1@@21)) 0))
 :qid |stdinbpl.514:15|
 :skolemid |51|
 :pattern ( (triple1 x_1@@21))
)))
(assert (forall ((x_1@@22 T@U) ) (!  (=> (= (type x_1@@22) Triple3DomainTypeType) (= (Triple2_tag (triple2 x_1@@22)) 0))
 :qid |stdinbpl.573:15|
 :skolemid |57|
 :pattern ( (triple2 x_1@@22))
)))
(assert (forall ((i_1@@0 Int) ) (! (= (Triple3_tag (nil i_1@@0)) 0)
 :qid |stdinbpl.650:15|
 :skolemid |65|
 :pattern ( (nil i_1@@0))
)))
(assert (forall ((x_1@@23 T@U) ) (!  (=> (= (type x_1@@23) Triple1DomainTypeType) (= (Triple3_tag (triple3 x_1@@23)) 1))
 :qid |stdinbpl.644:15|
 :skolemid |64|
 :pattern ( (triple3 x_1@@23))
)))
(assert (forall ((Heap@@52 T@U) (Mask@@30 T@U) (t_2@@29 T@U) ) (!  (=> (and (and (and (= (type Heap@@52) (MapType0Type RefType)) (= (type Mask@@30) (MapType1Type RefType realType))) (= (type t_2@@29) Triple2DomainTypeType)) (and (state Heap@@52 Mask@@30) (< AssumeFunctionsAbove 2))) (= (tripleLen2Bad Heap@@52 t_2@@29) (+ 1 (ite (= (Triple3_tag (get_Triple2_x t_2@@29)) 0) 0 (+ 1 (|tripleLen2Bad'| Heap@@52 t_2@@29))))))
 :qid |stdinbpl.1273:15|
 :skolemid |108|
 :pattern ( (state Heap@@52 Mask@@30) (tripleLen2Bad Heap@@52 t_2@@29))
)))
(assert (forall ((v1 T@U) (v2 T@U) (v3 T@U) ) (!  (=> (and (and (and (= (type v1) List1DomainTypeType) (= (type v2) List1DomainTypeType)) (= (type v3) List1DomainTypeType)) (and (decreasing v1 v2) (decreasing v2 v3))) (decreasing v1 v3))
 :qid |stdinbpl.258:15|
 :skolemid |27|
 :pattern ( (decreasing v1 v2) (decreasing v2 v3))
)))
(assert (forall ((v1@@0 T@U) (v2@@0 T@U) (v3@@0 T@U) ) (!  (=> (and (and (and (= (type v1@@0) List2DomainTypeType) (= (type v2@@0) List2DomainTypeType)) (= (type v3@@0) List2DomainTypeType)) (and (decreasing v1@@0 v2@@0) (decreasing v2@@0 v3@@0))) (decreasing v1@@0 v3@@0))
 :qid |stdinbpl.335:15|
 :skolemid |34|
 :pattern ( (decreasing v1@@0 v2@@0) (decreasing v2@@0 v3@@0))
)))
(assert (forall ((v1@@1 T@U) (v2@@1 T@U) (v3@@1 T@U) ) (!  (=> (and (and (and (= (type v1@@1) MList1DomainTypeType) (= (type v2@@1) MList1DomainTypeType)) (= (type v3@@1) MList1DomainTypeType)) (and (decreasing v1@@1 v2@@1) (decreasing v2@@1 v3@@1))) (decreasing v1@@1 v3@@1))
 :qid |stdinbpl.403:15|
 :skolemid |41|
 :pattern ( (decreasing v1@@1 v2@@1) (decreasing v2@@1 v3@@1))
)))
(assert (forall ((v1@@2 T@U) (v2@@2 T@U) (v3@@2 T@U) ) (!  (=> (and (and (and (= (type v1@@2) MList2DomainTypeType) (= (type v2@@2) MList2DomainTypeType)) (= (type v3@@2) MList2DomainTypeType)) (and (decreasing v1@@2 v2@@2) (decreasing v2@@2 v3@@2))) (decreasing v1@@2 v3@@2))
 :qid |stdinbpl.480:15|
 :skolemid |48|
 :pattern ( (decreasing v1@@2 v2@@2) (decreasing v2@@2 v3@@2))
)))
(assert (forall ((v1@@3 T@U) (v2@@3 T@U) (v3@@3 T@U) ) (!  (=> (and (and (and (= (type v1@@3) Triple1DomainTypeType) (= (type v2@@3) Triple1DomainTypeType)) (= (type v3@@3) Triple1DomainTypeType)) (and (decreasing v1@@3 v2@@3) (decreasing v2@@3 v3@@3))) (decreasing v1@@3 v3@@3))
 :qid |stdinbpl.539:15|
 :skolemid |54|
 :pattern ( (decreasing v1@@3 v2@@3) (decreasing v2@@3 v3@@3))
)))
(assert (forall ((v1@@4 T@U) (v2@@4 T@U) (v3@@4 T@U) ) (!  (=> (and (and (and (= (type v1@@4) Triple2DomainTypeType) (= (type v2@@4) Triple2DomainTypeType)) (= (type v3@@4) Triple2DomainTypeType)) (and (decreasing v1@@4 v2@@4) (decreasing v2@@4 v3@@4))) (decreasing v1@@4 v3@@4))
 :qid |stdinbpl.598:15|
 :skolemid |60|
 :pattern ( (decreasing v1@@4 v2@@4) (decreasing v2@@4 v3@@4))
)))
(assert (forall ((v1@@5 T@U) (v2@@5 T@U) (v3@@5 T@U) ) (!  (=> (and (and (and (= (type v1@@5) Triple3DomainTypeType) (= (type v2@@5) Triple3DomainTypeType)) (= (type v3@@5) Triple3DomainTypeType)) (and (decreasing v1@@5 v2@@5) (decreasing v2@@5 v3@@5))) (decreasing v1@@5 v3@@5))
 :qid |stdinbpl.678:15|
 :skolemid |68|
 :pattern ( (decreasing v1@@5 v2@@5) (decreasing v2@@5 v3@@5))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
; Valid

(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun t_2@@30 () T@U)
(declare-fun Heap@@53 () T@U)
(assert  (and (= (type t_2@@30) Triple2DomainTypeType) (= (type Heap@@53) (MapType0Type RefType))))
(set-info :boogie-vc-id tripleLen2_termination_proof)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 7) (let ((anon3_correct true))
(let ((anon4_Else_correct  (=> (not (= (Triple3_tag (get_Triple2_x t_2@@30)) 0)) (and (=> (= (ControlFlow 0 3) (- 0 5)) (decreasing (get_Triple1_x (get_Triple3_x (get_Triple2_x t_2@@30))) t_2@@30)) (=> (decreasing (get_Triple1_x (get_Triple3_x (get_Triple2_x t_2@@30))) t_2@@30) (and (=> (= (ControlFlow 0 3) (- 0 4)) (bounded t_2@@30)) (=> (bounded t_2@@30) (=> (and (state Heap@@53 ZeroMask) (= (ControlFlow 0 3) 1)) anon3_correct))))))))
(let ((anon4_Then_correct  (=> (and (= (Triple3_tag (get_Triple2_x t_2@@30)) 0) (= (ControlFlow 0 2) 1)) anon3_correct)))
(let ((anon0_correct  (=> (and (state Heap@@53 ZeroMask) (= AssumeFunctionsAbove (- 0 1))) (and (=> (= (ControlFlow 0 6) 2) anon4_Then_correct) (=> (= (ControlFlow 0 6) 3) anon4_Else_correct)))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 7) 6) anon0_correct)))
PreconditionGeneratedEntry_correct))))))
))
(check-sat)
(pop 1)
; Valid
(get-info :rlimit)
