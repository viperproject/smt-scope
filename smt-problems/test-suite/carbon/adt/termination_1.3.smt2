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
(declare-fun IntListDomainTypeType () T@T)
(declare-fun ListDomainTypeTypeInv0 (T@T) T@T)
(declare-fun ListDomainTypeType (T@T) T@T)
(declare-fun PairDomainTypeTypeInv1 (T@T) T@T)
(declare-fun PairDomainTypeTypeInv0 (T@T) T@T)
(declare-fun PairDomainTypeType (T@T T@T) T@T)
(declare-fun DListDomainTypeTypeInv1 (T@T) T@T)
(declare-fun DListDomainTypeTypeInv0 (T@T) T@T)
(declare-fun DListDomainTypeType (T@T T@T) T@T)
(declare-fun state (T@U T@U) Bool)
(declare-fun MapType1Type (T@T T@T) T@T)
(declare-fun GoodMask (T@U) Bool)
(declare-fun MapType1TypeInv0 (T@T) T@T)
(declare-fun MapType1TypeInv1 (T@T) T@T)
(declare-fun MapType1Select (T@U T@U T@U) T@U)
(declare-fun MapType1Store (T@U T@U T@U T@U) T@U)
(declare-fun DCons (T@U T@U T@U) T@U)
(declare-fun decreasing (T@U T@U) Bool)
(declare-fun |lenBad'| (T@U T@U T@U) Int)
(declare-fun ValDomainTypeType () T@T)
(declare-fun dummyFunction (T@U) Bool)
(declare-fun |lenBad#triggerStateless| (T@U T@U) Int)
(declare-fun |ilenBad'| (T@U T@U Int) Int)
(declare-fun |ilenBad#triggerStateless| (T@U Int) Int)
(declare-fun IdenticalOnKnownLocations (T@U T@U T@U) Bool)
(declare-fun IsPredicateField (T@U) Bool)
(declare-fun null () T@U)
(declare-fun PredicateMaskField (T@U) T@U)
(declare-fun FrameTypeType () T@T)
(declare-fun HasDirectPerm (T@U T@U T@U) Bool)
(declare-fun IsWandField (T@U) Bool)
(declare-fun WandMaskField (T@U) T@U)
(declare-fun ICons (Int T@U) T@U)
(declare-fun Cons (T@U T@U) T@U)
(declare-fun |lenBad#frame| (T@U T@U T@U) Int)
(declare-fun EmptyFrame () T@U)
(declare-fun |ilenBad#frame| (T@U T@U Int) Int)
(declare-fun |len'| (T@U T@U) Int)
(declare-fun |len#triggerStateless| (T@U) Int)
(declare-fun |len2'| (T@U T@U) Int)
(declare-fun |len2#triggerStateless| (T@U) Int)
(declare-fun |lenBad2'| (T@U T@U) Int)
(declare-fun |lenBad2#triggerStateless| (T@U) Int)
(declare-fun |ilen'| (T@U T@U) Int)
(declare-fun |ilen#triggerStateless| (T@U) Int)
(declare-fun |ilen2'| (T@U T@U) Int)
(declare-fun |ilen2#triggerStateless| (T@U) Int)
(declare-fun |stupidFunc'| (T@U T@U) T@U)
(declare-fun |stupidFunc#triggerStateless| (T@U) T@U)
(declare-fun |dlen'| (T@U T@U) Int)
(declare-fun |dlen#triggerStateless| (T@U) Int)
(declare-fun |dlenBad'| (T@U T@U) Int)
(declare-fun |dlenBad#triggerStateless| (T@U) Int)
(declare-fun IntList_tag (T@U) Int)
(declare-fun get_IntList_ivalue (T@U) Int)
(declare-fun get_IntList_itail (T@U) T@U)
(declare-fun INil () T@U)
(declare-fun List_tag (T@U) Int)
(declare-fun get_List_value (T@U) T@U)
(declare-fun get_List_tail (T@U) T@U)
(declare-fun Nil (T@T) T@U)
(declare-fun AssumeFunctionsAbove () Int)
(declare-fun |len2#trigger| (T@U T@U) Bool)
(declare-fun |dlenBad#trigger| (T@U T@U) Bool)
(declare-fun |ilen#trigger| (T@U T@U) Bool)
(declare-fun |dlen#trigger| (T@U T@U) Bool)
(declare-fun |lenBad2#trigger| (T@U T@U) Bool)
(declare-fun |ilen2#trigger| (T@U T@U) Bool)
(declare-fun |len#trigger| (T@U T@U) Bool)
(declare-fun $allocated () T@U)
(declare-fun NormalFieldType () T@T)
(declare-fun len (T@U T@U) Int)
(declare-fun len2 (T@U T@U) Int)
(declare-fun lenBad2 (T@U T@U) Int)
(declare-fun ilen (T@U T@U) Int)
(declare-fun ilen2 (T@U T@U) Int)
(declare-fun stupidFunc (T@U T@U) T@U)
(declare-fun dlen (T@U T@U) Int)
(declare-fun dlenBad (T@U T@U) Int)
(declare-fun DList_tag (T@U) Int)
(declare-fun dummyHeap () T@U)
(declare-fun ZeroMask () T@U)
(declare-fun InsidePredicate (T@U T@U T@U T@U) Bool)
(declare-fun Pair_tag (T@U) Int)
(declare-fun get_Pair_fst (T@U) T@U)
(declare-fun get_Pair_snd (T@U) T@U)
(declare-fun pair (T@U T@U) T@U)
(declare-fun sumMask (T@U T@U T@U) Bool)
(declare-fun get_DList_dvalue1 (T@U) T@U)
(declare-fun get_DList_dvalue2 (T@U) T@U)
(declare-fun get_DList_dtail (T@U) T@U)
(declare-fun DNil (T@T T@T) T@U)
(declare-fun ConditionalFrame (Real T@U) T@U)
(declare-fun NoPerm () Real)
(declare-fun lenBad (T@U T@U T@U) Int)
(declare-fun ilenBad (T@U T@U Int) Int)
(declare-fun FullPerm () Real)
(declare-fun |len#frame| (T@U T@U) Int)
(declare-fun |len2#frame| (T@U T@U) Int)
(declare-fun |lenBad2#frame| (T@U T@U) Int)
(declare-fun |ilen#frame| (T@U T@U) Int)
(declare-fun |ilen2#frame| (T@U T@U) Int)
(declare-fun |stupidFunc#frame| (T@U T@U) T@U)
(declare-fun |dlen#frame| (T@U T@U) Int)
(declare-fun |dlenBad#frame| (T@U T@U) Int)
(declare-fun ZeroPMask () T@U)
(declare-fun |ilenBad#trigger| (T@U T@U Int) Bool)
(declare-fun |lenBad#trigger| (T@U T@U T@U) Bool)
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
(assert (= (Ctor IntListDomainTypeType) 9))
(assert (forall ((x@@8 T@U) ) (!  (=> (= (type x@@8) IntListDomainTypeType) (bounded x@@8))
 :qid |stdinbpl.359:15|
 :skolemid |36|
 :pattern ( (bounded x@@8))
)))
(assert  (and (forall ((arg0@@18 T@T) ) (! (= (Ctor (ListDomainTypeType arg0@@18)) 10)
 :qid |ctor:ListDomainTypeType|
)) (forall ((arg0@@19 T@T) ) (! (= (ListDomainTypeTypeInv0 (ListDomainTypeType arg0@@19)) arg0@@19)
 :qid |typeInv:ListDomainTypeTypeInv0|
 :pattern ( (ListDomainTypeType arg0@@19))
))))
(assert (forall ((x@@9 T@U) ) (! (let ((V (ListDomainTypeTypeInv0 (type x@@9))))
 (=> (= (type x@@9) (ListDomainTypeType V)) (bounded x@@9)))
 :qid |stdinbpl.282:19|
 :skolemid |29|
 :pattern ( (bounded x@@9))
)))
(assert  (and (and (forall ((arg0@@20 T@T) (arg1@@4 T@T) ) (! (= (Ctor (PairDomainTypeType arg0@@20 arg1@@4)) 11)
 :qid |ctor:PairDomainTypeType|
)) (forall ((arg0@@21 T@T) (arg1@@5 T@T) ) (! (= (PairDomainTypeTypeInv0 (PairDomainTypeType arg0@@21 arg1@@5)) arg0@@21)
 :qid |typeInv:PairDomainTypeTypeInv0|
 :pattern ( (PairDomainTypeType arg0@@21 arg1@@5))
))) (forall ((arg0@@22 T@T) (arg1@@6 T@T) ) (! (= (PairDomainTypeTypeInv1 (PairDomainTypeType arg0@@22 arg1@@6)) arg1@@6)
 :qid |typeInv:PairDomainTypeTypeInv1|
 :pattern ( (PairDomainTypeType arg0@@22 arg1@@6))
))))
(assert (forall ((x@@10 T@U) ) (! (let ((V@@0 (PairDomainTypeTypeInv1 (type x@@10))))
(let ((T (PairDomainTypeTypeInv0 (type x@@10))))
 (=> (= (type x@@10) (PairDomainTypeType T V@@0)) (bounded x@@10))))
 :qid |stdinbpl.424:22|
 :skolemid |42|
 :pattern ( (bounded x@@10))
)))
(assert  (and (and (forall ((arg0@@23 T@T) (arg1@@7 T@T) ) (! (= (Ctor (DListDomainTypeType arg0@@23 arg1@@7)) 12)
 :qid |ctor:DListDomainTypeType|
)) (forall ((arg0@@24 T@T) (arg1@@8 T@T) ) (! (= (DListDomainTypeTypeInv0 (DListDomainTypeType arg0@@24 arg1@@8)) arg0@@24)
 :qid |typeInv:DListDomainTypeTypeInv0|
 :pattern ( (DListDomainTypeType arg0@@24 arg1@@8))
))) (forall ((arg0@@25 T@T) (arg1@@9 T@T) ) (! (= (DListDomainTypeTypeInv1 (DListDomainTypeType arg0@@25 arg1@@9)) arg1@@9)
 :qid |typeInv:DListDomainTypeTypeInv1|
 :pattern ( (DListDomainTypeType arg0@@25 arg1@@9))
))))
(assert (forall ((x@@11 T@U) ) (! (let ((T@@0 (DListDomainTypeTypeInv1 (type x@@11))))
(let ((V@@1 (DListDomainTypeTypeInv0 (type x@@11))))
 (=> (= (type x@@11) (DListDomainTypeType V@@1 T@@0)) (bounded x@@11))))
 :qid |stdinbpl.513:22|
 :skolemid |51|
 :pattern ( (bounded x@@11))
)))
(assert  (and (and (and (and (and (and (forall ((arg0@@26 T@T) (arg1@@10 T@T) ) (! (= (Ctor (MapType1Type arg0@@26 arg1@@10)) 13)
 :qid |ctor:MapType1Type|
)) (forall ((arg0@@27 T@T) (arg1@@11 T@T) ) (! (= (MapType1TypeInv0 (MapType1Type arg0@@27 arg1@@11)) arg0@@27)
 :qid |typeInv:MapType1TypeInv0|
 :pattern ( (MapType1Type arg0@@27 arg1@@11))
))) (forall ((arg0@@28 T@T) (arg1@@12 T@T) ) (! (= (MapType1TypeInv1 (MapType1Type arg0@@28 arg1@@12)) arg1@@12)
 :qid |typeInv:MapType1TypeInv1|
 :pattern ( (MapType1Type arg0@@28 arg1@@12))
))) (forall ((arg0@@29 T@U) (arg1@@13 T@U) (arg2@@1 T@U) ) (! (let ((aVar1 (MapType1TypeInv1 (type arg0@@29))))
(= (type (MapType1Select arg0@@29 arg1@@13 arg2@@1)) aVar1))
 :qid |funType:MapType1Select|
 :pattern ( (MapType1Select arg0@@29 arg1@@13 arg2@@1))
))) (forall ((arg0@@30 T@U) (arg1@@14 T@U) (arg2@@2 T@U) (arg3@@0 T@U) ) (! (let ((aVar1@@0 (type arg3@@0)))
(let ((aVar0@@0 (type arg1@@14)))
(= (type (MapType1Store arg0@@30 arg1@@14 arg2@@2 arg3@@0)) (MapType1Type aVar0@@0 aVar1@@0))))
 :qid |funType:MapType1Store|
 :pattern ( (MapType1Store arg0@@30 arg1@@14 arg2@@2 arg3@@0))
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
(assert (forall ((arg0@@31 T@U) (arg1@@15 T@U) (arg2@@3 T@U) ) (! (let ((T@@1 (type arg1@@15)))
(let ((V@@2 (type arg0@@31)))
(= (type (DCons arg0@@31 arg1@@15 arg2@@3)) (DListDomainTypeType V@@2 T@@1))))
 :qid |funType:DCons|
 :pattern ( (DCons arg0@@31 arg1@@15 arg2@@3))
)))
(assert (forall ((dtail_0 T@U) (dvalue1_1 T@U) (dvalue2_1 T@U) ) (! (let ((T@@2 (type dvalue2_1)))
(let ((V@@3 (type dvalue1_1)))
 (=> (= (type dtail_0) (DListDomainTypeType V@@3 T@@2)) (decreasing dtail_0 (DCons dvalue1_1 dvalue2_1 dtail_0)))))
 :qid |stdinbpl.501:22|
 :skolemid |49|
 :pattern ( (DCons dvalue1_1 dvalue2_1 dtail_0))
)))
(assert (= (Ctor ValDomainTypeType) 14))
(assert (forall ((Heap@@0 T@U) (l T@U) (v_2 T@U) ) (!  (=> (and (and (= (type Heap@@0) (MapType0Type RefType)) (= (type l) (ListDomainTypeType ValDomainTypeType))) (= (type v_2) ValDomainTypeType)) (dummyFunction (int_2_U (|lenBad#triggerStateless| l v_2))))
 :qid |stdinbpl.686:15|
 :skolemid |63|
 :pattern ( (|lenBad'| Heap@@0 l v_2))
)))
(assert (forall ((Heap@@1 T@U) (l@@0 T@U) (v_2@@0 Int) ) (!  (=> (and (= (type Heap@@1) (MapType0Type RefType)) (= (type l@@0) IntListDomainTypeType)) (dummyFunction (int_2_U (|ilenBad#triggerStateless| l@@0 v_2@@0))))
 :qid |stdinbpl.991:15|
 :skolemid |83|
 :pattern ( (|ilenBad'| Heap@@1 l@@0 v_2@@0))
)))
(assert  (and (and (= (Ctor FrameTypeType) 15) (= (type null) RefType)) (forall ((arg0@@32 T@U) ) (! (let ((A (FieldTypeInv0 (type arg0@@32))))
(= (type (PredicateMaskField arg0@@32)) (FieldType A (MapType1Type RefType boolType))))
 :qid |funType:PredicateMaskField|
 :pattern ( (PredicateMaskField arg0@@32))
))))
(assert (forall ((Heap@@2 T@U) (ExhaleHeap T@U) (Mask@@0 T@U) (pm_f T@U) ) (! (let ((C (FieldTypeInv0 (type pm_f))))
 (=> (and (and (and (and (and (= (type Heap@@2) (MapType0Type RefType)) (= (type ExhaleHeap) (MapType0Type RefType))) (= (type Mask@@0) (MapType1Type RefType realType))) (= (type pm_f) (FieldType C FrameTypeType))) (IdenticalOnKnownLocations Heap@@2 ExhaleHeap Mask@@0)) (and (HasDirectPerm Mask@@0 null pm_f) (IsPredicateField pm_f))) (= (MapType0Select Heap@@2 null (PredicateMaskField pm_f)) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))))
 :qid |stdinbpl.47:19|
 :skolemid |2|
 :pattern ( (IdenticalOnKnownLocations Heap@@2 ExhaleHeap Mask@@0) (IsPredicateField pm_f) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))
)))
(assert (forall ((arg0@@33 T@U) ) (! (let ((A@@0 (FieldTypeInv0 (type arg0@@33))))
(= (type (WandMaskField arg0@@33)) (FieldType A@@0 (MapType1Type RefType boolType))))
 :qid |funType:WandMaskField|
 :pattern ( (WandMaskField arg0@@33))
)))
(assert (forall ((Heap@@3 T@U) (ExhaleHeap@@0 T@U) (Mask@@1 T@U) (pm_f@@0 T@U) ) (! (let ((C@@0 (FieldTypeInv0 (type pm_f@@0))))
 (=> (and (and (and (and (and (= (type Heap@@3) (MapType0Type RefType)) (= (type ExhaleHeap@@0) (MapType0Type RefType))) (= (type Mask@@1) (MapType1Type RefType realType))) (= (type pm_f@@0) (FieldType C@@0 FrameTypeType))) (IdenticalOnKnownLocations Heap@@3 ExhaleHeap@@0 Mask@@1)) (and (HasDirectPerm Mask@@1 null pm_f@@0) (IsWandField pm_f@@0))) (= (MapType0Select Heap@@3 null (WandMaskField pm_f@@0)) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))))
 :qid |stdinbpl.60:19|
 :skolemid |5|
 :pattern ( (IdenticalOnKnownLocations Heap@@3 ExhaleHeap@@0 Mask@@1) (IsWandField pm_f@@0) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))
)))
(assert (forall ((arg0@@34 Int) (arg1@@16 T@U) ) (! (= (type (ICons arg0@@34 arg1@@16)) IntListDomainTypeType)
 :qid |funType:ICons|
 :pattern ( (ICons arg0@@34 arg1@@16))
)))
(assert (forall ((itail_0 T@U) (ivalue_1 Int) ) (!  (=> (= (type itail_0) IntListDomainTypeType) (decreasing itail_0 (ICons ivalue_1 itail_0)))
 :qid |stdinbpl.347:15|
 :skolemid |34|
 :pattern ( (ICons ivalue_1 itail_0))
)))
(assert (forall ((arg0@@35 T@U) (arg1@@17 T@U) ) (! (let ((V@@4 (type arg0@@35)))
(= (type (Cons arg0@@35 arg1@@17)) (ListDomainTypeType V@@4)))
 :qid |funType:Cons|
 :pattern ( (Cons arg0@@35 arg1@@17))
)))
(assert (forall ((tail_0 T@U) (value_1 T@U) ) (! (let ((V@@5 (type value_1)))
 (=> (= (type tail_0) (ListDomainTypeType V@@5)) (decreasing tail_0 (Cons value_1 tail_0))))
 :qid |stdinbpl.270:19|
 :skolemid |27|
 :pattern ( (Cons value_1 tail_0))
)))
(assert (= (type EmptyFrame) FrameTypeType))
(assert (forall ((Heap@@4 T@U) (Mask@@2 T@U) (l@@1 T@U) (v_2@@1 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@4) (MapType0Type RefType)) (= (type Mask@@2) (MapType1Type RefType realType))) (= (type l@@1) (ListDomainTypeType ValDomainTypeType))) (= (type v_2@@1) ValDomainTypeType)) (state Heap@@4 Mask@@2)) (= (|lenBad'| Heap@@4 l@@1 v_2@@1) (|lenBad#frame| EmptyFrame l@@1 v_2@@1)))
 :qid |stdinbpl.699:15|
 :skolemid |65|
 :pattern ( (state Heap@@4 Mask@@2) (|lenBad'| Heap@@4 l@@1 v_2@@1))
)))
(assert (forall ((Heap@@5 T@U) (Mask@@3 T@U) (l@@2 T@U) (v_2@@2 Int) ) (!  (=> (and (and (and (= (type Heap@@5) (MapType0Type RefType)) (= (type Mask@@3) (MapType1Type RefType realType))) (= (type l@@2) IntListDomainTypeType)) (state Heap@@5 Mask@@3)) (= (|ilenBad'| Heap@@5 l@@2 v_2@@2) (|ilenBad#frame| EmptyFrame l@@2 v_2@@2)))
 :qid |stdinbpl.1004:15|
 :skolemid |85|
 :pattern ( (state Heap@@5 Mask@@3) (|ilenBad'| Heap@@5 l@@2 v_2@@2))
)))
(assert (forall ((Heap@@6 T@U) (l@@3 T@U) ) (!  (=> (and (= (type Heap@@6) (MapType0Type RefType)) (= (type l@@3) (ListDomainTypeType ValDomainTypeType))) (dummyFunction (int_2_U (|len#triggerStateless| l@@3))))
 :qid |stdinbpl.529:15|
 :skolemid |53|
 :pattern ( (|len'| Heap@@6 l@@3))
)))
(assert (forall ((Heap@@7 T@U) (l@@4 T@U) ) (!  (=> (and (= (type Heap@@7) (MapType0Type RefType)) (= (type l@@4) (ListDomainTypeType ValDomainTypeType))) (dummyFunction (int_2_U (|len2#triggerStateless| l@@4))))
 :qid |stdinbpl.606:15|
 :skolemid |58|
 :pattern ( (|len2'| Heap@@7 l@@4))
)))
(assert (forall ((Heap@@8 T@U) (l@@5 T@U) ) (!  (=> (and (= (type Heap@@8) (MapType0Type RefType)) (= (type l@@5) (ListDomainTypeType ValDomainTypeType))) (dummyFunction (int_2_U (|lenBad2#triggerStateless| l@@5))))
 :qid |stdinbpl.760:15|
 :skolemid |68|
 :pattern ( (|lenBad2'| Heap@@8 l@@5))
)))
(assert (forall ((Heap@@9 T@U) (l@@6 T@U) ) (!  (=> (and (= (type Heap@@9) (MapType0Type RefType)) (= (type l@@6) IntListDomainTypeType)) (dummyFunction (int_2_U (|ilen#triggerStateless| l@@6))))
 :qid |stdinbpl.834:15|
 :skolemid |73|
 :pattern ( (|ilen'| Heap@@9 l@@6))
)))
(assert (forall ((Heap@@10 T@U) (l@@7 T@U) ) (!  (=> (and (= (type Heap@@10) (MapType0Type RefType)) (= (type l@@7) IntListDomainTypeType)) (dummyFunction (int_2_U (|ilen2#triggerStateless| l@@7))))
 :qid |stdinbpl.911:15|
 :skolemid |78|
 :pattern ( (|ilen2'| Heap@@10 l@@7))
)))
(assert  (and (forall ((arg0@@36 T@U) (arg1@@18 T@U) ) (! (= (type (|stupidFunc'| arg0@@36 arg1@@18)) ValDomainTypeType)
 :qid |funType:stupidFunc'|
 :pattern ( (|stupidFunc'| arg0@@36 arg1@@18))
)) (forall ((arg0@@37 T@U) ) (! (= (type (|stupidFunc#triggerStateless| arg0@@37)) ValDomainTypeType)
 :qid |funType:stupidFunc#triggerStateless|
 :pattern ( (|stupidFunc#triggerStateless| arg0@@37))
))))
(assert (forall ((Heap@@11 T@U) (p_1 T@U) ) (!  (=> (and (= (type Heap@@11) (MapType0Type RefType)) (= (type p_1) (PairDomainTypeType intType ValDomainTypeType))) (dummyFunction (|stupidFunc#triggerStateless| p_1)))
 :qid |stdinbpl.1065:15|
 :skolemid |88|
 :pattern ( (|stupidFunc'| Heap@@11 p_1))
)))
(assert (forall ((Heap@@12 T@U) (l@@8 T@U) ) (!  (=> (and (= (type Heap@@12) (MapType0Type RefType)) (= (type l@@8) (DListDomainTypeType intType ValDomainTypeType))) (dummyFunction (int_2_U (|dlen#triggerStateless| l@@8))))
 :qid |stdinbpl.1125:15|
 :skolemid |92|
 :pattern ( (|dlen'| Heap@@12 l@@8))
)))
(assert (forall ((Heap@@13 T@U) (l@@9 T@U) ) (!  (=> (and (= (type Heap@@13) (MapType0Type RefType)) (= (type l@@9) (DListDomainTypeType intType ValDomainTypeType))) (dummyFunction (int_2_U (|dlenBad#triggerStateless| l@@9))))
 :qid |stdinbpl.1202:15|
 :skolemid |97|
 :pattern ( (|dlenBad'| Heap@@13 l@@9))
)))
(assert  (and (forall ((arg0@@38 T@U) ) (! (= (type (get_IntList_itail arg0@@38)) IntListDomainTypeType)
 :qid |funType:get_IntList_itail|
 :pattern ( (get_IntList_itail arg0@@38))
)) (= (type INil) IntListDomainTypeType)))
(assert (forall ((t_2 T@U) ) (!  (=> (= (type t_2) IntListDomainTypeType) (or (= t_2 INil) (= t_2 (ICons (get_IntList_ivalue t_2) (get_IntList_itail t_2)))))
 :qid |stdinbpl.331:15|
 :skolemid |33|
 :pattern ( (IntList_tag t_2))
 :pattern ( (get_IntList_ivalue t_2))
 :pattern ( (get_IntList_itail t_2))
)))
(assert  (and (and (forall ((arg0@@39 T@U) ) (! (let ((V@@6 (ListDomainTypeTypeInv0 (type arg0@@39))))
(= (type (get_List_value arg0@@39)) V@@6))
 :qid |funType:get_List_value|
 :pattern ( (get_List_value arg0@@39))
)) (forall ((arg0@@40 T@U) ) (! (let ((V@@7 (ListDomainTypeTypeInv0 (type arg0@@40))))
(= (type (get_List_tail arg0@@40)) (ListDomainTypeType V@@7)))
 :qid |funType:get_List_tail|
 :pattern ( (get_List_tail arg0@@40))
))) (forall ((V@@8 T@T) ) (! (= (type (Nil V@@8)) (ListDomainTypeType V@@8))
 :qid |funType:Nil|
 :pattern ( (Nil V@@8))
))))
(assert (forall ((t_2@@0 T@U) ) (! (let ((V@@9 (ListDomainTypeTypeInv0 (type t_2@@0))))
 (=> (= (type t_2@@0) (ListDomainTypeType V@@9)) (or (= t_2@@0 (Nil V@@9)) (= t_2@@0 (Cons (get_List_value t_2@@0) (get_List_tail t_2@@0))))))
 :qid |stdinbpl.254:19|
 :skolemid |26|
 :pattern ( (List_tag t_2@@0))
 :pattern ( (get_List_value t_2@@0))
 :pattern ( (get_List_tail t_2@@0))
)))
(assert (forall ((Heap@@14 T@U) (Mask@@4 T@U) (l@@10 T@U) ) (!  (=> (and (and (and (= (type Heap@@14) (MapType0Type RefType)) (= (type Mask@@4) (MapType1Type RefType realType))) (= (type l@@10) (ListDomainTypeType ValDomainTypeType))) (and (state Heap@@14 Mask@@4) (or (< AssumeFunctionsAbove 0) (|len2#trigger| EmptyFrame l@@10)))) (>= (|len2'| Heap@@14 l@@10) 0))
 :qid |stdinbpl.625:15|
 :skolemid |61|
 :pattern ( (state Heap@@14 Mask@@4) (|len2'| Heap@@14 l@@10))
)))
(assert (forall ((Heap@@15 T@U) (Mask@@5 T@U) (l@@11 T@U) ) (!  (=> (and (and (and (= (type Heap@@15) (MapType0Type RefType)) (= (type Mask@@5) (MapType1Type RefType realType))) (= (type l@@11) (DListDomainTypeType intType ValDomainTypeType))) (and (state Heap@@15 Mask@@5) (or (< AssumeFunctionsAbove 1) (|dlenBad#trigger| EmptyFrame l@@11)))) (>= (|dlenBad'| Heap@@15 l@@11) 0))
 :qid |stdinbpl.1221:15|
 :skolemid |100|
 :pattern ( (state Heap@@15 Mask@@5) (|dlenBad'| Heap@@15 l@@11))
)))
(assert (forall ((Heap@@16 T@U) (Mask@@6 T@U) (l@@12 T@U) ) (!  (=> (and (and (and (= (type Heap@@16) (MapType0Type RefType)) (= (type Mask@@6) (MapType1Type RefType realType))) (= (type l@@12) IntListDomainTypeType)) (and (state Heap@@16 Mask@@6) (or (< AssumeFunctionsAbove 2) (|ilen#trigger| EmptyFrame l@@12)))) (>= (|ilen'| Heap@@16 l@@12) 0))
 :qid |stdinbpl.853:15|
 :skolemid |76|
 :pattern ( (state Heap@@16 Mask@@6) (|ilen'| Heap@@16 l@@12))
)))
(assert (forall ((Heap@@17 T@U) (Mask@@7 T@U) (l@@13 T@U) ) (!  (=> (and (and (and (= (type Heap@@17) (MapType0Type RefType)) (= (type Mask@@7) (MapType1Type RefType realType))) (= (type l@@13) (DListDomainTypeType intType ValDomainTypeType))) (and (state Heap@@17 Mask@@7) (or (< AssumeFunctionsAbove 4) (|dlen#trigger| EmptyFrame l@@13)))) (>= (|dlen'| Heap@@17 l@@13) 0))
 :qid |stdinbpl.1144:15|
 :skolemid |95|
 :pattern ( (state Heap@@17 Mask@@7) (|dlen'| Heap@@17 l@@13))
)))
(assert (forall ((Heap@@18 T@U) (Mask@@8 T@U) (l@@14 T@U) ) (!  (=> (and (and (and (= (type Heap@@18) (MapType0Type RefType)) (= (type Mask@@8) (MapType1Type RefType realType))) (= (type l@@14) (ListDomainTypeType ValDomainTypeType))) (and (state Heap@@18 Mask@@8) (or (< AssumeFunctionsAbove 5) (|lenBad2#trigger| EmptyFrame l@@14)))) (>= (|lenBad2'| Heap@@18 l@@14) 0))
 :qid |stdinbpl.779:15|
 :skolemid |71|
 :pattern ( (state Heap@@18 Mask@@8) (|lenBad2'| Heap@@18 l@@14))
)))
(assert (forall ((Heap@@19 T@U) (Mask@@9 T@U) (l@@15 T@U) ) (!  (=> (and (and (and (= (type Heap@@19) (MapType0Type RefType)) (= (type Mask@@9) (MapType1Type RefType realType))) (= (type l@@15) IntListDomainTypeType)) (and (state Heap@@19 Mask@@9) (or (< AssumeFunctionsAbove 7) (|ilen2#trigger| EmptyFrame l@@15)))) (>= (|ilen2'| Heap@@19 l@@15) 0))
 :qid |stdinbpl.930:15|
 :skolemid |81|
 :pattern ( (state Heap@@19 Mask@@9) (|ilen2'| Heap@@19 l@@15))
)))
(assert (forall ((Heap@@20 T@U) (Mask@@10 T@U) (l@@16 T@U) ) (!  (=> (and (and (and (= (type Heap@@20) (MapType0Type RefType)) (= (type Mask@@10) (MapType1Type RefType realType))) (= (type l@@16) (ListDomainTypeType ValDomainTypeType))) (and (state Heap@@20 Mask@@10) (or (< AssumeFunctionsAbove 8) (|len#trigger| EmptyFrame l@@16)))) (>= (|len'| Heap@@20 l@@16) 0))
 :qid |stdinbpl.548:15|
 :skolemid |56|
 :pattern ( (state Heap@@20 Mask@@10) (|len'| Heap@@20 l@@16))
)))
(assert  (and (= (Ctor NormalFieldType) 16) (= (type $allocated) (FieldType NormalFieldType boolType))))
(assert (forall ((Heap@@21 T@U) (ExhaleHeap@@1 T@U) (Mask@@11 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@21) (MapType0Type RefType)) (= (type ExhaleHeap@@1) (MapType0Type RefType))) (= (type Mask@@11) (MapType1Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@21 ExhaleHeap@@1 Mask@@11)) (U_2_bool (MapType0Select Heap@@21 o_1 $allocated))) (U_2_bool (MapType0Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.73:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@21 ExhaleHeap@@1 Mask@@11) (MapType0Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert (forall ((Heap@@22 T@U) (l@@17 T@U) ) (!  (=> (and (= (type Heap@@22) (MapType0Type RefType)) (= (type l@@17) (ListDomainTypeType ValDomainTypeType))) (and (= (len Heap@@22 l@@17) (|len'| Heap@@22 l@@17)) (dummyFunction (int_2_U (|len#triggerStateless| l@@17)))))
 :qid |stdinbpl.525:15|
 :skolemid |52|
 :pattern ( (len Heap@@22 l@@17))
)))
(assert (forall ((Heap@@23 T@U) (l@@18 T@U) ) (!  (=> (and (= (type Heap@@23) (MapType0Type RefType)) (= (type l@@18) (ListDomainTypeType ValDomainTypeType))) (and (= (len2 Heap@@23 l@@18) (|len2'| Heap@@23 l@@18)) (dummyFunction (int_2_U (|len2#triggerStateless| l@@18)))))
 :qid |stdinbpl.602:15|
 :skolemid |57|
 :pattern ( (len2 Heap@@23 l@@18))
)))
(assert (forall ((Heap@@24 T@U) (l@@19 T@U) ) (!  (=> (and (= (type Heap@@24) (MapType0Type RefType)) (= (type l@@19) (ListDomainTypeType ValDomainTypeType))) (and (= (lenBad2 Heap@@24 l@@19) (|lenBad2'| Heap@@24 l@@19)) (dummyFunction (int_2_U (|lenBad2#triggerStateless| l@@19)))))
 :qid |stdinbpl.756:15|
 :skolemid |67|
 :pattern ( (lenBad2 Heap@@24 l@@19))
)))
(assert (forall ((Heap@@25 T@U) (l@@20 T@U) ) (!  (=> (and (= (type Heap@@25) (MapType0Type RefType)) (= (type l@@20) IntListDomainTypeType)) (and (= (ilen Heap@@25 l@@20) (|ilen'| Heap@@25 l@@20)) (dummyFunction (int_2_U (|ilen#triggerStateless| l@@20)))))
 :qid |stdinbpl.830:15|
 :skolemid |72|
 :pattern ( (ilen Heap@@25 l@@20))
)))
(assert (forall ((Heap@@26 T@U) (l@@21 T@U) ) (!  (=> (and (= (type Heap@@26) (MapType0Type RefType)) (= (type l@@21) IntListDomainTypeType)) (and (= (ilen2 Heap@@26 l@@21) (|ilen2'| Heap@@26 l@@21)) (dummyFunction (int_2_U (|ilen2#triggerStateless| l@@21)))))
 :qid |stdinbpl.907:15|
 :skolemid |77|
 :pattern ( (ilen2 Heap@@26 l@@21))
)))
(assert (forall ((arg0@@41 T@U) (arg1@@19 T@U) ) (! (= (type (stupidFunc arg0@@41 arg1@@19)) ValDomainTypeType)
 :qid |funType:stupidFunc|
 :pattern ( (stupidFunc arg0@@41 arg1@@19))
)))
(assert (forall ((Heap@@27 T@U) (p_1@@0 T@U) ) (!  (=> (and (= (type Heap@@27) (MapType0Type RefType)) (= (type p_1@@0) (PairDomainTypeType intType ValDomainTypeType))) (and (= (stupidFunc Heap@@27 p_1@@0) (|stupidFunc'| Heap@@27 p_1@@0)) (dummyFunction (|stupidFunc#triggerStateless| p_1@@0))))
 :qid |stdinbpl.1061:15|
 :skolemid |87|
 :pattern ( (stupidFunc Heap@@27 p_1@@0))
)))
(assert (forall ((Heap@@28 T@U) (l@@22 T@U) ) (!  (=> (and (= (type Heap@@28) (MapType0Type RefType)) (= (type l@@22) (DListDomainTypeType intType ValDomainTypeType))) (and (= (dlen Heap@@28 l@@22) (|dlen'| Heap@@28 l@@22)) (dummyFunction (int_2_U (|dlen#triggerStateless| l@@22)))))
 :qid |stdinbpl.1121:15|
 :skolemid |91|
 :pattern ( (dlen Heap@@28 l@@22))
)))
(assert (forall ((Heap@@29 T@U) (l@@23 T@U) ) (!  (=> (and (= (type Heap@@29) (MapType0Type RefType)) (= (type l@@23) (DListDomainTypeType intType ValDomainTypeType))) (and (= (dlenBad Heap@@29 l@@23) (|dlenBad'| Heap@@29 l@@23)) (dummyFunction (int_2_U (|dlenBad#triggerStateless| l@@23)))))
 :qid |stdinbpl.1198:15|
 :skolemid |96|
 :pattern ( (dlenBad Heap@@29 l@@23))
)))
(assert (forall ((dvalue1_1@@0 T@U) (dvalue2_1@@0 T@U) (dtail_1 T@U) ) (! (let ((T@@3 (type dvalue2_1@@0)))
(let ((V@@10 (type dvalue1_1@@0)))
 (=> (= (type dtail_1) (DListDomainTypeType V@@10 T@@3)) (= (DList_tag (DCons dvalue1_1@@0 dvalue2_1@@0 dtail_1)) 0))))
 :qid |stdinbpl.479:22|
 :skolemid |47|
 :pattern ( (DCons dvalue1_1@@0 dvalue2_1@@0 dtail_1))
)))
(assert (= (IntList_tag INil) 1))
(assert (forall ((Heap@@30 T@U) (ExhaleHeap@@2 T@U) (Mask@@12 T@U) (o_1@@0 T@U) (f_2 T@U) ) (! (let ((B@@1 (FieldTypeInv1 (type f_2))))
(let ((A@@1 (FieldTypeInv0 (type f_2))))
 (=> (and (and (and (and (and (and (= (type Heap@@30) (MapType0Type RefType)) (= (type ExhaleHeap@@2) (MapType0Type RefType))) (= (type Mask@@12) (MapType1Type RefType realType))) (= (type o_1@@0) RefType)) (= (type f_2) (FieldType A@@1 B@@1))) (IdenticalOnKnownLocations Heap@@30 ExhaleHeap@@2 Mask@@12)) (HasDirectPerm Mask@@12 o_1@@0 f_2)) (= (MapType0Select Heap@@30 o_1@@0 f_2) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2)))))
 :qid |stdinbpl.42:22|
 :skolemid |1|
 :pattern ( (IdenticalOnKnownLocations Heap@@30 ExhaleHeap@@2 Mask@@12) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2))
)))
(assert  (and (= (type dummyHeap) (MapType0Type RefType)) (= (type ZeroMask) (MapType1Type RefType realType))))
(assert (state dummyHeap ZeroMask))
(assert (forall ((p T@U) (v_1 T@U) (w T@U) ) (! (let ((A@@2 (FieldTypeInv0 (type p))))
 (=> (and (and (= (type p) (FieldType A@@2 FrameTypeType)) (= (type v_1) FrameTypeType)) (= (type w) FrameTypeType)) (not (InsidePredicate p v_1 p w))))
 :qid |stdinbpl.182:19|
 :skolemid |21|
 :pattern ( (InsidePredicate p v_1 p w))
)))
(assert (forall ((Heap@@31 T@U) (ExhaleHeap@@3 T@U) (Mask@@13 T@U) ) (!  (=> (and (and (and (= (type Heap@@31) (MapType0Type RefType)) (= (type ExhaleHeap@@3) (MapType0Type RefType))) (= (type Mask@@13) (MapType1Type RefType realType))) (IdenticalOnKnownLocations Heap@@31 ExhaleHeap@@3 Mask@@13)) (succHeap Heap@@31 ExhaleHeap@@3))
 :qid |stdinbpl.83:15|
 :skolemid |10|
 :pattern ( (IdenticalOnKnownLocations Heap@@31 ExhaleHeap@@3 Mask@@13))
)))
(assert  (and (and (forall ((arg0@@42 T@U) ) (! (let ((T@@4 (PairDomainTypeTypeInv0 (type arg0@@42))))
(= (type (get_Pair_fst arg0@@42)) T@@4))
 :qid |funType:get_Pair_fst|
 :pattern ( (get_Pair_fst arg0@@42))
)) (forall ((arg0@@43 T@U) ) (! (let ((V@@11 (PairDomainTypeTypeInv1 (type arg0@@43))))
(= (type (get_Pair_snd arg0@@43)) V@@11))
 :qid |funType:get_Pair_snd|
 :pattern ( (get_Pair_snd arg0@@43))
))) (forall ((arg0@@44 T@U) (arg1@@20 T@U) ) (! (let ((V@@12 (type arg1@@20)))
(let ((T@@5 (type arg0@@44)))
(= (type (pair arg0@@44 arg1@@20)) (PairDomainTypeType T@@5 V@@12))))
 :qid |funType:pair|
 :pattern ( (pair arg0@@44 arg1@@20))
))))
(assert (forall ((t_2@@1 T@U) ) (! (let ((V@@13 (PairDomainTypeTypeInv1 (type t_2@@1))))
(let ((T@@6 (PairDomainTypeTypeInv0 (type t_2@@1))))
 (=> (= (type t_2@@1) (PairDomainTypeType T@@6 V@@13)) (= t_2@@1 (pair (get_Pair_fst t_2@@1) (get_Pair_snd t_2@@1))))))
 :qid |stdinbpl.402:22|
 :skolemid |40|
 :pattern ( (Pair_tag t_2@@1))
 :pattern ( (get_Pair_fst t_2@@1))
 :pattern ( (get_Pair_snd t_2@@1))
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
(assert  (and (and (and (forall ((arg0@@45 T@U) ) (! (let ((V@@14 (DListDomainTypeTypeInv0 (type arg0@@45))))
(= (type (get_DList_dvalue1 arg0@@45)) V@@14))
 :qid |funType:get_DList_dvalue1|
 :pattern ( (get_DList_dvalue1 arg0@@45))
)) (forall ((arg0@@46 T@U) ) (! (let ((T@@7 (DListDomainTypeTypeInv1 (type arg0@@46))))
(= (type (get_DList_dvalue2 arg0@@46)) T@@7))
 :qid |funType:get_DList_dvalue2|
 :pattern ( (get_DList_dvalue2 arg0@@46))
))) (forall ((arg0@@47 T@U) ) (! (let ((T@@8 (DListDomainTypeTypeInv1 (type arg0@@47))))
(let ((V@@15 (DListDomainTypeTypeInv0 (type arg0@@47))))
(= (type (get_DList_dtail arg0@@47)) (DListDomainTypeType V@@15 T@@8))))
 :qid |funType:get_DList_dtail|
 :pattern ( (get_DList_dtail arg0@@47))
))) (forall ((V@@16 T@T) (T@@9 T@T) ) (! (= (type (DNil V@@16 T@@9)) (DListDomainTypeType V@@16 T@@9))
 :qid |funType:DNil|
 :pattern ( (DNil V@@16 T@@9))
))))
(assert (forall ((t_2@@2 T@U) ) (! (let ((T@@10 (DListDomainTypeTypeInv1 (type t_2@@2))))
(let ((V@@17 (DListDomainTypeTypeInv0 (type t_2@@2))))
 (=> (= (type t_2@@2) (DListDomainTypeType V@@17 T@@10)) (or (= t_2@@2 (DNil V@@17 T@@10)) (= t_2@@2 (DCons (get_DList_dvalue1 t_2@@2) (get_DList_dvalue2 t_2@@2) (get_DList_dtail t_2@@2)))))))
 :qid |stdinbpl.485:22|
 :skolemid |48|
 :pattern ( (DList_tag t_2@@2))
 :pattern ( (get_DList_dvalue1 t_2@@2))
 :pattern ( (get_DList_dvalue2 t_2@@2))
 :pattern ( (get_DList_dtail t_2@@2))
)))
(assert (forall ((arg0@@48 Real) (arg1@@21 T@U) ) (! (= (type (ConditionalFrame arg0@@48 arg1@@21)) FrameTypeType)
 :qid |funType:ConditionalFrame|
 :pattern ( (ConditionalFrame arg0@@48 arg1@@21))
)))
(assert (forall ((p@@0 Real) (f_6 T@U) ) (!  (=> (= (type f_6) FrameTypeType) (= (ConditionalFrame p@@0 f_6) (ite (> p@@0 0.0) f_6 EmptyFrame)))
 :qid |stdinbpl.170:15|
 :skolemid |19|
 :pattern ( (ConditionalFrame p@@0 f_6))
)))
(assert (forall ((Mask@@14 T@U) (o_2@@0 T@U) (f_4@@0 T@U) ) (! (let ((B@@3 (FieldTypeInv1 (type f_4@@0))))
(let ((A@@4 (FieldTypeInv0 (type f_4@@0))))
 (=> (and (and (= (type Mask@@14) (MapType1Type RefType realType)) (= (type o_2@@0) RefType)) (= (type f_4@@0) (FieldType A@@4 B@@3))) (= (HasDirectPerm Mask@@14 o_2@@0 f_4@@0) (> (U_2_real (MapType1Select Mask@@14 o_2@@0 f_4@@0)) NoPerm)))))
 :qid |stdinbpl.133:22|
 :skolemid |17|
 :pattern ( (HasDirectPerm Mask@@14 o_2@@0 f_4@@0))
)))
(assert (forall ((Heap@@32 T@U) (l@@24 T@U) (v_2@@3 T@U) ) (!  (=> (and (and (= (type Heap@@32) (MapType0Type RefType)) (= (type l@@24) (ListDomainTypeType ValDomainTypeType))) (= (type v_2@@3) ValDomainTypeType)) (and (= (lenBad Heap@@32 l@@24 v_2@@3) (|lenBad'| Heap@@32 l@@24 v_2@@3)) (dummyFunction (int_2_U (|lenBad#triggerStateless| l@@24 v_2@@3)))))
 :qid |stdinbpl.682:15|
 :skolemid |62|
 :pattern ( (lenBad Heap@@32 l@@24 v_2@@3))
)))
(assert (forall ((Heap@@33 T@U) (l@@25 T@U) (v_2@@4 Int) ) (!  (=> (and (= (type Heap@@33) (MapType0Type RefType)) (= (type l@@25) IntListDomainTypeType)) (and (= (ilenBad Heap@@33 l@@25 v_2@@4) (|ilenBad'| Heap@@33 l@@25 v_2@@4)) (dummyFunction (int_2_U (|ilenBad#triggerStateless| l@@25 v_2@@4)))))
 :qid |stdinbpl.987:15|
 :skolemid |82|
 :pattern ( (ilenBad Heap@@33 l@@25 v_2@@4))
)))
(assert (forall ((Heap@@34 T@U) (Mask@@15 T@U) (l@@26 T@U) ) (!  (=> (and (and (and (= (type Heap@@34) (MapType0Type RefType)) (= (type Mask@@15) (MapType1Type RefType realType))) (= (type l@@26) (ListDomainTypeType ValDomainTypeType))) (and (state Heap@@34 Mask@@15) (< AssumeFunctionsAbove 0))) (= (len2 Heap@@34 l@@26) (ite (= (List_tag l@@26) 1) 0 (ite (= (List_tag (get_List_tail l@@26)) 1) 1 (+ 2 (|len2'| Heap@@34 (get_List_tail (get_List_tail l@@26))))))))
 :qid |stdinbpl.612:15|
 :skolemid |59|
 :pattern ( (state Heap@@34 Mask@@15) (len2 Heap@@34 l@@26))
)))
(assert (forall ((Heap@@35 T@U) (Mask@@16 T@U) (l@@27 T@U) ) (!  (=> (and (and (and (= (type Heap@@35) (MapType0Type RefType)) (= (type Mask@@16) (MapType1Type RefType realType))) (= (type l@@27) IntListDomainTypeType)) (and (state Heap@@35 Mask@@16) (< AssumeFunctionsAbove 7))) (= (ilen2 Heap@@35 l@@27) (ite (= (IntList_tag l@@27) 1) 0 (ite (= (IntList_tag (get_IntList_itail l@@27)) 1) 1 (+ 2 (|ilen2'| Heap@@35 (get_IntList_itail (get_IntList_itail l@@27))))))))
 :qid |stdinbpl.917:15|
 :skolemid |79|
 :pattern ( (state Heap@@35 Mask@@16) (ilen2 Heap@@35 l@@27))
)))
(assert (forall ((Heap@@36 T@U) (Mask@@17 T@U) (l@@28 T@U) ) (!  (=> (and (and (and (= (type Heap@@36) (MapType0Type RefType)) (= (type Mask@@17) (MapType1Type RefType realType))) (= (type l@@28) (DListDomainTypeType intType ValDomainTypeType))) (and (state Heap@@36 Mask@@17) (< AssumeFunctionsAbove 1))) (= (dlenBad Heap@@36 l@@28) (ite (= (DList_tag l@@28) 1) 0 (+ 1 (|dlenBad'| Heap@@36 l@@28)))))
 :qid |stdinbpl.1208:15|
 :skolemid |98|
 :pattern ( (state Heap@@36 Mask@@17) (dlenBad Heap@@36 l@@28))
)))
(assert (forall ((o_2@@1 T@U) (f_4@@1 T@U) ) (! (let ((B@@4 (FieldTypeInv1 (type f_4@@1))))
(let ((A@@5 (FieldTypeInv0 (type f_4@@1))))
 (=> (and (= (type o_2@@1) RefType) (= (type f_4@@1) (FieldType A@@5 B@@4))) (= (U_2_real (MapType1Select ZeroMask o_2@@1 f_4@@1)) NoPerm))))
 :qid |stdinbpl.106:22|
 :skolemid |13|
 :pattern ( (MapType1Select ZeroMask o_2@@1 f_4@@1))
)))
(assert (forall ((Heap@@37 T@U) (Mask@@18 T@U) (l@@29 T@U) ) (!  (=> (and (and (and (= (type Heap@@37) (MapType0Type RefType)) (= (type Mask@@18) (MapType1Type RefType realType))) (= (type l@@29) (ListDomainTypeType ValDomainTypeType))) (and (state Heap@@37 Mask@@18) (< AssumeFunctionsAbove 5))) (= (lenBad2 Heap@@37 l@@29) (+ 1 (|lenBad2'| Heap@@37 l@@29))))
 :qid |stdinbpl.766:15|
 :skolemid |69|
 :pattern ( (state Heap@@37 Mask@@18) (lenBad2 Heap@@37 l@@29))
)))
(assert (forall ((Heap@@38 T@U) (Mask@@19 T@U) (l@@30 T@U) ) (!  (=> (and (and (and (= (type Heap@@38) (MapType0Type RefType)) (= (type Mask@@19) (MapType1Type RefType realType))) (= (type l@@30) IntListDomainTypeType)) (and (state Heap@@38 Mask@@19) (< AssumeFunctionsAbove 2))) (= (ilen Heap@@38 l@@30) (ite (= (IntList_tag l@@30) 1) 0 (+ 1 (|ilen'| Heap@@38 (get_IntList_itail l@@30))))))
 :qid |stdinbpl.840:15|
 :skolemid |74|
 :pattern ( (state Heap@@38 Mask@@19) (ilen Heap@@38 l@@30))
)))
(assert (forall ((Heap@@39 T@U) (Mask@@20 T@U) (l@@31 T@U) ) (!  (=> (and (and (and (= (type Heap@@39) (MapType0Type RefType)) (= (type Mask@@20) (MapType1Type RefType realType))) (= (type l@@31) (DListDomainTypeType intType ValDomainTypeType))) (and (state Heap@@39 Mask@@20) (< AssumeFunctionsAbove 4))) (= (dlen Heap@@39 l@@31) (ite (= (DList_tag l@@31) 1) 0 (+ 1 (|dlen'| Heap@@39 (get_DList_dtail l@@31))))))
 :qid |stdinbpl.1131:15|
 :skolemid |93|
 :pattern ( (state Heap@@39 Mask@@20) (dlen Heap@@39 l@@31))
)))
(assert (forall ((Heap@@40 T@U) (Mask@@21 T@U) (l@@32 T@U) ) (!  (=> (and (and (and (= (type Heap@@40) (MapType0Type RefType)) (= (type Mask@@21) (MapType1Type RefType realType))) (= (type l@@32) (ListDomainTypeType ValDomainTypeType))) (and (state Heap@@40 Mask@@21) (< AssumeFunctionsAbove 8))) (= (len Heap@@40 l@@32) (ite (= (List_tag l@@32) 1) 0 (+ 1 (|len'| Heap@@40 (get_List_tail l@@32))))))
 :qid |stdinbpl.535:15|
 :skolemid |54|
 :pattern ( (state Heap@@40 Mask@@21) (len Heap@@40 l@@32))
)))
(assert (forall ((Heap@@41 T@U) (Mask@@22 T@U) (l@@33 T@U) (v_2@@5 Int) ) (!  (=> (and (and (and (= (type Heap@@41) (MapType0Type RefType)) (= (type Mask@@22) (MapType1Type RefType realType))) (= (type l@@33) IntListDomainTypeType)) (and (state Heap@@41 Mask@@22) (< AssumeFunctionsAbove 3))) (= (ilenBad Heap@@41 l@@33 v_2@@5) (|ilenBad'| Heap@@41 (ICons v_2@@5 INil) v_2@@5)))
 :qid |stdinbpl.997:15|
 :skolemid |84|
 :pattern ( (state Heap@@41 Mask@@22) (ilenBad Heap@@41 l@@33 v_2@@5))
)))
(assert (forall ((Heap@@42 T@U) (Mask@@23 T@U) (l@@34 T@U) (v_2@@6 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@42) (MapType0Type RefType)) (= (type Mask@@23) (MapType1Type RefType realType))) (= (type l@@34) (ListDomainTypeType ValDomainTypeType))) (= (type v_2@@6) ValDomainTypeType)) (and (state Heap@@42 Mask@@23) (< AssumeFunctionsAbove 9))) (= (lenBad Heap@@42 l@@34 v_2@@6) (|lenBad'| Heap@@42 (Cons v_2@@6 (Nil ValDomainTypeType)) v_2@@6)))
 :qid |stdinbpl.692:15|
 :skolemid |64|
 :pattern ( (state Heap@@42 Mask@@23) (lenBad Heap@@42 l@@34 v_2@@6))
)))
(assert (forall ((Heap@@43 T@U) (ExhaleHeap@@4 T@U) (Mask@@24 T@U) (pm_f@@1 T@U) ) (! (let ((C@@1 (FieldTypeInv0 (type pm_f@@1))))
 (=> (and (and (and (and (and (= (type Heap@@43) (MapType0Type RefType)) (= (type ExhaleHeap@@4) (MapType0Type RefType))) (= (type Mask@@24) (MapType1Type RefType realType))) (= (type pm_f@@1) (FieldType C@@1 FrameTypeType))) (IdenticalOnKnownLocations Heap@@43 ExhaleHeap@@4 Mask@@24)) (and (HasDirectPerm Mask@@24 null pm_f@@1) (IsPredicateField pm_f@@1))) (forall ((o2 T@U) (f_2@@0 T@U) ) (! (let ((B@@5 (FieldTypeInv1 (type f_2@@0))))
(let ((A@@6 (FieldTypeInv0 (type f_2@@0))))
 (=> (and (and (= (type o2) RefType) (= (type f_2@@0) (FieldType A@@6 B@@5))) (U_2_bool (MapType1Select (MapType0Select Heap@@43 null (PredicateMaskField pm_f@@1)) o2 f_2@@0))) (= (MapType0Select Heap@@43 o2 f_2@@0) (MapType0Select ExhaleHeap@@4 o2 f_2@@0)))))
 :qid |stdinbpl.54:134|
 :skolemid |3|
 :pattern ( (MapType0Select ExhaleHeap@@4 o2 f_2@@0))
))))
 :qid |stdinbpl.52:19|
 :skolemid |4|
 :pattern ( (IdenticalOnKnownLocations Heap@@43 ExhaleHeap@@4 Mask@@24) (IsPredicateField pm_f@@1))
)))
(assert (forall ((Heap@@44 T@U) (ExhaleHeap@@5 T@U) (Mask@@25 T@U) (pm_f@@2 T@U) ) (! (let ((C@@2 (FieldTypeInv0 (type pm_f@@2))))
 (=> (and (and (and (and (and (= (type Heap@@44) (MapType0Type RefType)) (= (type ExhaleHeap@@5) (MapType0Type RefType))) (= (type Mask@@25) (MapType1Type RefType realType))) (= (type pm_f@@2) (FieldType C@@2 FrameTypeType))) (IdenticalOnKnownLocations Heap@@44 ExhaleHeap@@5 Mask@@25)) (and (HasDirectPerm Mask@@25 null pm_f@@2) (IsWandField pm_f@@2))) (forall ((o2@@0 T@U) (f_2@@1 T@U) ) (! (let ((B@@6 (FieldTypeInv1 (type f_2@@1))))
(let ((A@@7 (FieldTypeInv0 (type f_2@@1))))
 (=> (and (and (= (type o2@@0) RefType) (= (type f_2@@1) (FieldType A@@7 B@@6))) (U_2_bool (MapType1Select (MapType0Select Heap@@44 null (WandMaskField pm_f@@2)) o2@@0 f_2@@1))) (= (MapType0Select Heap@@44 o2@@0 f_2@@1) (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1)))))
 :qid |stdinbpl.67:129|
 :skolemid |6|
 :pattern ( (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1))
))))
 :qid |stdinbpl.65:19|
 :skolemid |7|
 :pattern ( (IdenticalOnKnownLocations Heap@@44 ExhaleHeap@@5 Mask@@25) (IsWandField pm_f@@2))
)))
(assert (forall ((Mask@@26 T@U) (o_2@@2 T@U) (f_4@@2 T@U) ) (! (let ((B@@7 (FieldTypeInv1 (type f_4@@2))))
(let ((A@@8 (FieldTypeInv0 (type f_4@@2))))
 (=> (and (and (and (= (type Mask@@26) (MapType1Type RefType realType)) (= (type o_2@@2) RefType)) (= (type f_4@@2) (FieldType A@@8 B@@7))) (GoodMask Mask@@26)) (and (>= (U_2_real (MapType1Select Mask@@26 o_2@@2 f_4@@2)) NoPerm) (=> (and (and (GoodMask Mask@@26) (not (IsPredicateField f_4@@2))) (not (IsWandField f_4@@2))) (<= (U_2_real (MapType1Select Mask@@26 o_2@@2 f_4@@2)) FullPerm))))))
 :qid |stdinbpl.128:22|
 :skolemid |16|
 :pattern ( (GoodMask Mask@@26) (MapType1Select Mask@@26 o_2@@2 f_4@@2))
)))
(assert (forall ((Heap@@45 T@U) (Mask@@27 T@U) (l@@35 T@U) ) (!  (=> (and (and (and (= (type Heap@@45) (MapType0Type RefType)) (= (type Mask@@27) (MapType1Type RefType realType))) (= (type l@@35) (ListDomainTypeType ValDomainTypeType))) (state Heap@@45 Mask@@27)) (= (|len'| Heap@@45 l@@35) (|len#frame| EmptyFrame l@@35)))
 :qid |stdinbpl.542:15|
 :skolemid |55|
 :pattern ( (state Heap@@45 Mask@@27) (|len'| Heap@@45 l@@35))
)))
(assert (forall ((Heap@@46 T@U) (Mask@@28 T@U) (l@@36 T@U) ) (!  (=> (and (and (and (= (type Heap@@46) (MapType0Type RefType)) (= (type Mask@@28) (MapType1Type RefType realType))) (= (type l@@36) (ListDomainTypeType ValDomainTypeType))) (state Heap@@46 Mask@@28)) (= (|len2'| Heap@@46 l@@36) (|len2#frame| EmptyFrame l@@36)))
 :qid |stdinbpl.619:15|
 :skolemid |60|
 :pattern ( (state Heap@@46 Mask@@28) (|len2'| Heap@@46 l@@36))
)))
(assert (forall ((Heap@@47 T@U) (Mask@@29 T@U) (l@@37 T@U) ) (!  (=> (and (and (and (= (type Heap@@47) (MapType0Type RefType)) (= (type Mask@@29) (MapType1Type RefType realType))) (= (type l@@37) (ListDomainTypeType ValDomainTypeType))) (state Heap@@47 Mask@@29)) (= (|lenBad2'| Heap@@47 l@@37) (|lenBad2#frame| EmptyFrame l@@37)))
 :qid |stdinbpl.773:15|
 :skolemid |70|
 :pattern ( (state Heap@@47 Mask@@29) (|lenBad2'| Heap@@47 l@@37))
)))
(assert (forall ((Heap@@48 T@U) (Mask@@30 T@U) (l@@38 T@U) ) (!  (=> (and (and (and (= (type Heap@@48) (MapType0Type RefType)) (= (type Mask@@30) (MapType1Type RefType realType))) (= (type l@@38) IntListDomainTypeType)) (state Heap@@48 Mask@@30)) (= (|ilen'| Heap@@48 l@@38) (|ilen#frame| EmptyFrame l@@38)))
 :qid |stdinbpl.847:15|
 :skolemid |75|
 :pattern ( (state Heap@@48 Mask@@30) (|ilen'| Heap@@48 l@@38))
)))
(assert (forall ((Heap@@49 T@U) (Mask@@31 T@U) (l@@39 T@U) ) (!  (=> (and (and (and (= (type Heap@@49) (MapType0Type RefType)) (= (type Mask@@31) (MapType1Type RefType realType))) (= (type l@@39) IntListDomainTypeType)) (state Heap@@49 Mask@@31)) (= (|ilen2'| Heap@@49 l@@39) (|ilen2#frame| EmptyFrame l@@39)))
 :qid |stdinbpl.924:15|
 :skolemid |80|
 :pattern ( (state Heap@@49 Mask@@31) (|ilen2'| Heap@@49 l@@39))
)))
(assert (forall ((arg0@@49 T@U) (arg1@@22 T@U) ) (! (= (type (|stupidFunc#frame| arg0@@49 arg1@@22)) ValDomainTypeType)
 :qid |funType:stupidFunc#frame|
 :pattern ( (|stupidFunc#frame| arg0@@49 arg1@@22))
)))
(assert (forall ((Heap@@50 T@U) (Mask@@32 T@U) (p_1@@1 T@U) ) (!  (=> (and (and (and (= (type Heap@@50) (MapType0Type RefType)) (= (type Mask@@32) (MapType1Type RefType realType))) (= (type p_1@@1) (PairDomainTypeType intType ValDomainTypeType))) (state Heap@@50 Mask@@32)) (= (|stupidFunc'| Heap@@50 p_1@@1) (|stupidFunc#frame| EmptyFrame p_1@@1)))
 :qid |stdinbpl.1078:15|
 :skolemid |90|
 :pattern ( (state Heap@@50 Mask@@32) (|stupidFunc'| Heap@@50 p_1@@1))
)))
(assert (forall ((Heap@@51 T@U) (Mask@@33 T@U) (l@@40 T@U) ) (!  (=> (and (and (and (= (type Heap@@51) (MapType0Type RefType)) (= (type Mask@@33) (MapType1Type RefType realType))) (= (type l@@40) (DListDomainTypeType intType ValDomainTypeType))) (state Heap@@51 Mask@@33)) (= (|dlen'| Heap@@51 l@@40) (|dlen#frame| EmptyFrame l@@40)))
 :qid |stdinbpl.1138:15|
 :skolemid |94|
 :pattern ( (state Heap@@51 Mask@@33) (|dlen'| Heap@@51 l@@40))
)))
(assert (forall ((Heap@@52 T@U) (Mask@@34 T@U) (l@@41 T@U) ) (!  (=> (and (and (and (= (type Heap@@52) (MapType0Type RefType)) (= (type Mask@@34) (MapType1Type RefType realType))) (= (type l@@41) (DListDomainTypeType intType ValDomainTypeType))) (state Heap@@52 Mask@@34)) (= (|dlenBad'| Heap@@52 l@@41) (|dlenBad#frame| EmptyFrame l@@41)))
 :qid |stdinbpl.1215:15|
 :skolemid |99|
 :pattern ( (state Heap@@52 Mask@@34) (|dlenBad'| Heap@@52 l@@41))
)))
(assert (forall ((o T@U) (f T@U) (Heap@@53 T@U) ) (!  (=> (and (and (and (= (type o) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap@@53) (MapType0Type RefType))) (U_2_bool (MapType0Select Heap@@53 o $allocated))) (U_2_bool (MapType0Select Heap@@53 (MapType0Select Heap@@53 o f) $allocated)))
 :qid |stdinbpl.31:15|
 :skolemid |0|
 :pattern ( (MapType0Select Heap@@53 o f))
)))
(assert (forall ((dvalue1_1@@1 T@U) (dvalue2_1@@1 T@U) (dtail_1@@0 T@U) ) (! (let ((T@@11 (type dvalue2_1@@1)))
(let ((V@@18 (type dvalue1_1@@1)))
 (=> (= (type dtail_1@@0) (DListDomainTypeType V@@18 T@@11)) (= dvalue1_1@@1 (get_DList_dvalue1 (DCons dvalue1_1@@1 dvalue2_1@@1 dtail_1@@0))))))
 :qid |stdinbpl.455:22|
 :skolemid |43|
 :pattern ( (DCons dvalue1_1@@1 dvalue2_1@@1 dtail_1@@0))
)))
(assert (forall ((dvalue1_1@@2 T@U) (dvalue2_1@@2 T@U) (dtail_1@@1 T@U) ) (! (let ((T@@12 (type dvalue2_1@@2)))
(let ((V@@19 (type dvalue1_1@@2)))
 (=> (= (type dtail_1@@1) (DListDomainTypeType V@@19 T@@12)) (= dvalue2_1@@2 (get_DList_dvalue2 (DCons dvalue1_1@@2 dvalue2_1@@2 dtail_1@@1))))))
 :qid |stdinbpl.461:22|
 :skolemid |44|
 :pattern ( (DCons dvalue1_1@@2 dvalue2_1@@2 dtail_1@@1))
)))
(assert (forall ((dvalue1_1@@3 T@U) (dvalue2_1@@3 T@U) (dtail_1@@2 T@U) ) (! (let ((T@@13 (type dvalue2_1@@3)))
(let ((V@@20 (type dvalue1_1@@3)))
 (=> (= (type dtail_1@@2) (DListDomainTypeType V@@20 T@@13)) (= dtail_1@@2 (get_DList_dtail (DCons dvalue1_1@@3 dvalue2_1@@3 dtail_1@@2))))))
 :qid |stdinbpl.467:22|
 :skolemid |45|
 :pattern ( (DCons dvalue1_1@@3 dvalue2_1@@3 dtail_1@@2))
)))
(assert (forall ((ivalue_1@@0 Int) (itail_1 T@U) ) (!  (=> (= (type itail_1) IntListDomainTypeType) (= ivalue_1@@0 (get_IntList_ivalue (ICons ivalue_1@@0 itail_1))))
 :qid |stdinbpl.310:15|
 :skolemid |30|
 :pattern ( (ICons ivalue_1@@0 itail_1))
)))
(assert (forall ((ivalue_1@@1 Int) (itail_1@@0 T@U) ) (!  (=> (= (type itail_1@@0) IntListDomainTypeType) (= itail_1@@0 (get_IntList_itail (ICons ivalue_1@@1 itail_1@@0))))
 :qid |stdinbpl.316:15|
 :skolemid |31|
 :pattern ( (ICons ivalue_1@@1 itail_1@@0))
)))
(assert (forall ((value_1@@0 T@U) (tail_1 T@U) ) (! (let ((V@@21 (type value_1@@0)))
 (=> (= (type tail_1) (ListDomainTypeType V@@21)) (= value_1@@0 (get_List_value (Cons value_1@@0 tail_1)))))
 :qid |stdinbpl.230:19|
 :skolemid |22|
 :pattern ( (Cons value_1@@0 tail_1))
)))
(assert (forall ((value_1@@1 T@U) (tail_1@@0 T@U) ) (! (let ((V@@22 (type value_1@@1)))
 (=> (= (type tail_1@@0) (ListDomainTypeType V@@22)) (= tail_1@@0 (get_List_tail (Cons value_1@@1 tail_1@@0)))))
 :qid |stdinbpl.236:19|
 :skolemid |23|
 :pattern ( (Cons value_1@@1 tail_1@@0))
)))
(assert (forall ((fst_1 T@U) (snd_1 T@U) ) (! (= fst_1 (get_Pair_fst (pair fst_1 snd_1)))
 :qid |stdinbpl.384:22|
 :skolemid |37|
 :pattern ( (pair fst_1 snd_1))
)))
(assert (forall ((fst_1@@0 T@U) (snd_1@@0 T@U) ) (! (= snd_1@@0 (get_Pair_snd (pair fst_1@@0 snd_1@@0)))
 :qid |stdinbpl.390:22|
 :skolemid |38|
 :pattern ( (pair fst_1@@0 snd_1@@0))
)))
(assert (forall ((Heap@@54 T@U) (o@@0 T@U) (f_3 T@U) (v T@U) ) (! (let ((B@@8 (type v)))
(let ((A@@9 (FieldTypeInv0 (type f_3))))
 (=> (and (and (= (type Heap@@54) (MapType0Type RefType)) (= (type o@@0) RefType)) (= (type f_3) (FieldType A@@9 B@@8))) (succHeap Heap@@54 (MapType0Store Heap@@54 o@@0 f_3 v)))))
 :qid |stdinbpl.78:22|
 :skolemid |9|
 :pattern ( (MapType0Store Heap@@54 o@@0 f_3 v))
)))
(assert (= (type ZeroPMask) (MapType1Type RefType boolType)))
(assert (forall ((o_2@@3 T@U) (f_4@@3 T@U) ) (! (let ((B@@9 (FieldTypeInv1 (type f_4@@3))))
(let ((A@@10 (FieldTypeInv0 (type f_4@@3))))
 (=> (and (= (type o_2@@3) RefType) (= (type f_4@@3) (FieldType A@@10 B@@9))) (not (U_2_bool (MapType1Select ZeroPMask o_2@@3 f_4@@3))))))
 :qid |stdinbpl.112:22|
 :skolemid |14|
 :pattern ( (MapType1Select ZeroPMask o_2@@3 f_4@@3))
)))
(assert (forall ((ivalue_1@@2 Int) (itail_1@@1 T@U) ) (!  (=> (= (type itail_1@@1) IntListDomainTypeType) (= (IntList_tag (ICons ivalue_1@@2 itail_1@@1)) 0))
 :qid |stdinbpl.325:15|
 :skolemid |32|
 :pattern ( (ICons ivalue_1@@2 itail_1@@1))
)))
(assert (forall ((value_1@@2 T@U) (tail_1@@1 T@U) ) (! (let ((V@@23 (type value_1@@2)))
 (=> (= (type tail_1@@1) (ListDomainTypeType V@@23)) (= (List_tag (Cons value_1@@2 tail_1@@1)) 0)))
 :qid |stdinbpl.248:19|
 :skolemid |25|
 :pattern ( (Cons value_1@@2 tail_1@@1))
)))
(assert (forall ((fst_1@@1 T@U) (snd_1@@1 T@U) ) (! (= (Pair_tag (pair fst_1@@1 snd_1@@1)) 0)
 :qid |stdinbpl.396:22|
 :skolemid |39|
 :pattern ( (pair fst_1@@1 snd_1@@1))
)))
(assert (forall ((p@@1 T@U) (v_1@@0 T@U) (q T@U) (w@@0 T@U) (r T@U) (u T@U) ) (! (let ((C@@3 (FieldTypeInv0 (type r))))
(let ((B@@10 (FieldTypeInv0 (type q))))
(let ((A@@11 (FieldTypeInv0 (type p@@1))))
 (=> (and (and (and (and (and (and (= (type p@@1) (FieldType A@@11 FrameTypeType)) (= (type v_1@@0) FrameTypeType)) (= (type q) (FieldType B@@10 FrameTypeType))) (= (type w@@0) FrameTypeType)) (= (type r) (FieldType C@@3 FrameTypeType))) (= (type u) FrameTypeType)) (and (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))) (InsidePredicate p@@1 v_1@@0 r u)))))
 :qid |stdinbpl.177:25|
 :skolemid |20|
 :pattern ( (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))
)))
(assert (forall ((V@@24 T@T) ) (! (= (List_tag (Nil V@@24)) 1)
 :skolemid |24|
)))
(assert (forall ((V@@25 T@T) (T@@14 T@T) ) (! (= (DList_tag (DNil V@@25 T@@14)) 1)
 :skolemid |46|
)))
(assert (forall ((v1 T@U) (v2 T@U) (v3 T@U) ) (!  (=> (and (and (and (= (type v1) IntListDomainTypeType) (= (type v2) IntListDomainTypeType)) (= (type v3) IntListDomainTypeType)) (and (decreasing v1 v2) (decreasing v2 v3))) (decreasing v1 v3))
 :qid |stdinbpl.353:15|
 :skolemid |35|
 :pattern ( (decreasing v1 v2) (decreasing v2 v3))
)))
(assert (forall ((v1@@0 T@U) (v2@@0 T@U) (v3@@0 T@U) ) (! (let ((V@@26 (ListDomainTypeTypeInv0 (type v1@@0))))
 (=> (and (and (and (= (type v1@@0) (ListDomainTypeType V@@26)) (= (type v2@@0) (ListDomainTypeType V@@26))) (= (type v3@@0) (ListDomainTypeType V@@26))) (and (decreasing v1@@0 v2@@0) (decreasing v2@@0 v3@@0))) (decreasing v1@@0 v3@@0)))
 :qid |stdinbpl.276:19|
 :skolemid |28|
 :pattern ( (decreasing v1@@0 v2@@0) (decreasing v2@@0 v3@@0))
)))
(assert (forall ((v1@@1 T@U) (v2@@1 T@U) (v3@@1 T@U) ) (! (let ((V@@27 (PairDomainTypeTypeInv1 (type v1@@1))))
(let ((T@@15 (PairDomainTypeTypeInv0 (type v1@@1))))
 (=> (and (and (and (= (type v1@@1) (PairDomainTypeType T@@15 V@@27)) (= (type v2@@1) (PairDomainTypeType T@@15 V@@27))) (= (type v3@@1) (PairDomainTypeType T@@15 V@@27))) (and (decreasing v1@@1 v2@@1) (decreasing v2@@1 v3@@1))) (decreasing v1@@1 v3@@1))))
 :qid |stdinbpl.418:22|
 :skolemid |41|
 :pattern ( (decreasing v1@@1 v2@@1) (decreasing v2@@1 v3@@1))
)))
(assert (forall ((v1@@2 T@U) (v2@@2 T@U) (v3@@2 T@U) ) (! (let ((T@@16 (DListDomainTypeTypeInv1 (type v1@@2))))
(let ((V@@28 (DListDomainTypeTypeInv0 (type v1@@2))))
 (=> (and (and (and (= (type v1@@2) (DListDomainTypeType V@@28 T@@16)) (= (type v2@@2) (DListDomainTypeType V@@28 T@@16))) (= (type v3@@2) (DListDomainTypeType V@@28 T@@16))) (and (decreasing v1@@2 v2@@2) (decreasing v2@@2 v3@@2))) (decreasing v1@@2 v3@@2))))
 :qid |stdinbpl.507:22|
 :skolemid |50|
 :pattern ( (decreasing v1@@2 v2@@2) (decreasing v2@@2 v3@@2))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
(assert (forall ((Heap@@55 T@U) (Mask@@35 T@U) (l@@42 T@U) (v_2@@7 Int) ) (!  (=> (and (and (and (= (type Heap@@55) (MapType0Type RefType)) (= (type Mask@@35) (MapType1Type RefType realType))) (= (type l@@42) IntListDomainTypeType)) (and (state Heap@@55 Mask@@35) (or (< AssumeFunctionsAbove 3) (|ilenBad#trigger| EmptyFrame l@@42 v_2@@7)))) (>= (|ilenBad'| Heap@@55 l@@42 v_2@@7) 0))
 :qid |stdinbpl.1010:15|
 :skolemid |86|
 :pattern ( (state Heap@@55 Mask@@35) (|ilenBad'| Heap@@55 l@@42 v_2@@7))
)))
(assert (forall ((Heap@@56 T@U) (Mask@@36 T@U) (l@@43 T@U) (v_2@@8 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@56) (MapType0Type RefType)) (= (type Mask@@36) (MapType1Type RefType realType))) (= (type l@@43) (ListDomainTypeType ValDomainTypeType))) (= (type v_2@@8) ValDomainTypeType)) (and (state Heap@@56 Mask@@36) (or (< AssumeFunctionsAbove 9) (|lenBad#trigger| EmptyFrame l@@43 v_2@@8)))) (>= (|lenBad'| Heap@@56 l@@43 v_2@@8) 0))
 :qid |stdinbpl.705:15|
 :skolemid |66|
 :pattern ( (state Heap@@56 Mask@@36) (|lenBad'| Heap@@56 l@@43 v_2@@8))
)))
(assert (forall ((Heap@@57 T@U) (Mask@@37 T@U) (p_1@@2 T@U) ) (!  (=> (and (and (and (= (type Heap@@57) (MapType0Type RefType)) (= (type Mask@@37) (MapType1Type RefType realType))) (= (type p_1@@2) (PairDomainTypeType intType ValDomainTypeType))) (and (state Heap@@57 Mask@@37) (< AssumeFunctionsAbove 6))) (= (stupidFunc Heap@@57 p_1@@2) (|stupidFunc'| Heap@@57 p_1@@2)))
 :qid |stdinbpl.1071:15|
 :skolemid |89|
 :pattern ( (state Heap@@57 Mask@@37) (stupidFunc Heap@@57 p_1@@2))
)))
(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun v_2@@9 () Int)
(declare-fun Result@0 () Int)
(declare-fun Heap@@58 () T@U)
(assert (= (type Heap@@58) (MapType0Type RefType)))
(set-info :boogie-vc-id |ilenBad#definedness|)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 5) (let ((anon4_Else_correct  (=> (|ilenBad#trigger| EmptyFrame (ICons v_2@@9 INil) v_2@@9) (=> (and (= Result@0 (ilenBad Heap@@58 (ICons v_2@@9 INil) v_2@@9)) (= (ControlFlow 0 3) (- 0 2))) (>= Result@0 0)))))
(let ((anon4_Then_correct true))
(let ((anon0_correct  (=> (and (state Heap@@58 ZeroMask) (= AssumeFunctionsAbove 3)) (and (=> (= (ControlFlow 0 4) 1) anon4_Then_correct) (=> (= (ControlFlow 0 4) 3) anon4_Else_correct)))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 5) 4) anon0_correct)))
PreconditionGeneratedEntry_correct)))))
))
(check-sat)
(pop 1)
; Valid
(get-info :rlimit)
