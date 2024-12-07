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
(declare-fun Wand_list_for_list__lemma () T@U)
(declare-fun Wand_list_for_list__in_1 () T@U)
(declare-fun Wand_list_for_list__in_1_0 () T@U)
(declare-fun Wand_list_for_list__out_1 () T@U)
(declare-fun Wand_list_for_list__out_1_0 () T@U)
(declare-fun Wand_list_for_list__this_1 () T@U)
(declare-fun Wand_list_for_list__L2_1 () T@U)
(declare-fun Wand_list_for_list__tmp_suffix_1 () T@U)
(declare-fun Wand_list_for_list__L1_1 () T@U)
(declare-fun Wand_list_for_list__tmp_1 () T@U)
(declare-fun Wand_list_for_list__suffix_1 () T@U)
(declare-fun Wand_list_for_list__cursor_1 () T@U)
(declare-fun Wand_list_for_list__wand_1 () T@U)
(declare-fun Wand_list_for_list__this_2 () T@U)
(declare-fun Wand_list_for_list__L2_2 () T@U)
(declare-fun Wand_list_for_list__L1_2 () T@U)
(declare-fun List__val () T@U)
(declare-fun List__next () T@U)
(declare-fun FieldType (T@T T@T) T@T)
(declare-fun FieldTypeInv0 (T@T) T@T)
(declare-fun FieldTypeInv1 (T@T) T@T)
(declare-fun NormalFieldType () T@T)
(declare-fun RefType () T@T)
(declare-fun SeqType (T@T) T@T)
(declare-fun SeqTypeInv0 (T@T) T@T)
(declare-fun |Seq#Length| (T@U) Int)
(declare-fun |Seq#Drop| (T@U Int) T@U)
(declare-fun succHeap (T@U T@U) Bool)
(declare-fun MapType0Type (T@T) T@T)
(declare-fun succHeapTrans (T@U T@U) Bool)
(declare-fun MapType0TypeInv0 (T@T) T@T)
(declare-fun MapType0Select (T@U T@U T@U) T@U)
(declare-fun MapType0Store (T@U T@U T@U T@U) T@U)
(declare-fun state (T@U T@U) Bool)
(declare-fun MapType1Type (T@T T@T) T@T)
(declare-fun GoodMask (T@U) Bool)
(declare-fun MapType1TypeInv0 (T@T) T@T)
(declare-fun MapType1TypeInv1 (T@T) T@T)
(declare-fun MapType1Select (T@U T@U T@U) T@U)
(declare-fun MapType1Store (T@U T@U T@U T@U) T@U)
(declare-fun |Seq#Index| (T@U Int) T@U)
(declare-fun |Seq#Sub| (Int Int) Int)
(declare-fun |Seq#Add| (Int Int) Int)
(declare-fun IdenticalOnKnownLocations (T@U T@U T@U) Bool)
(declare-fun IsPredicateField (T@U) Bool)
(declare-fun null () T@U)
(declare-fun PredicateMaskField (T@U) T@U)
(declare-fun FrameTypeType () T@T)
(declare-fun HasDirectPerm (T@U T@U T@U) Bool)
(declare-fun IsWandField (T@U) Bool)
(declare-fun WandMaskField (T@U) T@U)
(declare-fun Wand_list_for_list__valid_wand (T@U) T@U)
(declare-fun PredicateType_Wand_list_for_list__valid_wandType () T@T)
(declare-fun List__state (T@U) T@U)
(declare-fun PredicateType_List__stateType () T@T)
(declare-fun |Wand_list_for_list__get_in_1'| (T@U T@U) T@U)
(declare-fun dummyFunction (T@U) Bool)
(declare-fun |Wand_list_for_list__get_in_1#triggerStateless| (T@U) T@U)
(declare-fun |Wand_list_for_list__get_in_1_0'| (T@U T@U) T@U)
(declare-fun |Wand_list_for_list__get_in_1_0#triggerStateless| (T@U) T@U)
(declare-fun |Wand_list_for_list__get_out_1'| (T@U T@U) T@U)
(declare-fun |Wand_list_for_list__get_out_1#triggerStateless| (T@U) T@U)
(declare-fun |Wand_list_for_list__get_out_1_0'| (T@U T@U) T@U)
(declare-fun |Wand_list_for_list__get_out_1_0#triggerStateless| (T@U) T@U)
(declare-fun |List__contents'| (T@U T@U) T@U)
(declare-fun |List__contents#triggerStateless| (T@U) T@U)
(declare-fun |List__get_next'| (T@U T@U) T@U)
(declare-fun |List__get_next#triggerStateless| (T@U) T@U)
(declare-fun |Wand_list_for_list__valid_wand#trigger| (T@U T@U) Bool)
(declare-fun |Wand_list_for_list__valid_wand#everUsed| (T@U) Bool)
(declare-fun |List__state#trigger| (T@U T@U) Bool)
(declare-fun |List__state#everUsed| (T@U) Bool)
(declare-fun |Seq#Update| (T@U Int T@U) T@U)
(declare-fun |Seq#Take| (T@U Int) T@U)
(declare-fun |Seq#Contains| (T@U T@U) Bool)
(declare-fun |Seq#Range| (Int Int) T@U)
(declare-fun |Seq#Skolem| (T@U T@U) Int)
(declare-fun Wand_list_for_list__get_in_1 (T@U T@U) T@U)
(declare-fun Wand_list_for_list__get_in_1_0 (T@U T@U) T@U)
(declare-fun Wand_list_for_list__get_out_1 (T@U T@U) T@U)
(declare-fun Wand_list_for_list__get_out_1_0 (T@U T@U) T@U)
(declare-fun List__contents (T@U T@U) T@U)
(declare-fun List__get_next (T@U T@U) T@U)
(declare-fun |Seq#Singleton| (T@U) T@U)
(declare-fun |Wand_list_for_list__valid_wand#sm| (T@U) T@U)
(declare-fun |List__state#sm| (T@U) T@U)
(declare-fun |Seq#Empty| (T@T) T@U)
(declare-fun dummyHeap () T@U)
(declare-fun ZeroMask () T@U)
(declare-fun InsidePredicate (T@U T@U T@U T@U) Bool)
(declare-fun |Seq#Append| (T@U T@U) T@U)
(declare-fun AssumeFunctionsAbove () Int)
(declare-fun sumMask (T@U T@U T@U) Bool)
(declare-fun ConditionalFrame (Real T@U) T@U)
(declare-fun EmptyFrame () T@U)
(declare-fun NoPerm () Real)
(declare-fun |Wand_list_for_list__get_in_1#trigger| (T@U T@U) Bool)
(declare-fun |Wand_list_for_list__get_out_1#trigger| (T@U T@U) Bool)
(declare-fun |Seq#Equal| (T@U T@U) Bool)
(declare-fun |Seq#ContainsTrigger| (T@U T@U) Bool)
(declare-fun getPredWandId (T@U) Int)
(declare-fun FullPerm () Real)
(declare-fun |Wand_list_for_list__get_in_1#frame| (T@U T@U) T@U)
(declare-fun |Wand_list_for_list__get_in_1_0#frame| (T@U T@U) T@U)
(declare-fun |Wand_list_for_list__get_out_1#frame| (T@U T@U) T@U)
(declare-fun |Wand_list_for_list__get_out_1_0#frame| (T@U T@U) T@U)
(declare-fun |List__contents#frame| (T@U T@U) T@U)
(declare-fun |List__get_next#frame| (T@U T@U) T@U)
(declare-fun ZeroPMask () T@U)
(declare-fun |Seq#SkolemDiff| (T@U T@U) Int)
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
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (forall ((arg0@@11 T@T) (arg1 T@T) ) (! (= (Ctor (FieldType arg0@@11 arg1)) 6)
 :qid |ctor:FieldType|
)) (forall ((arg0@@12 T@T) (arg1@@0 T@T) ) (! (= (FieldTypeInv0 (FieldType arg0@@12 arg1@@0)) arg0@@12)
 :qid |typeInv:FieldTypeInv0|
 :pattern ( (FieldType arg0@@12 arg1@@0))
))) (forall ((arg0@@13 T@T) (arg1@@1 T@T) ) (! (= (FieldTypeInv1 (FieldType arg0@@13 arg1@@1)) arg1@@1)
 :qid |typeInv:FieldTypeInv1|
 :pattern ( (FieldType arg0@@13 arg1@@1))
))) (= (Ctor NormalFieldType) 7)) (= (type $allocated) (FieldType NormalFieldType boolType))) (= (type Wand_list_for_list__lemma) (FieldType NormalFieldType intType))) (= (Ctor RefType) 8)) (= (type Wand_list_for_list__in_1) (FieldType NormalFieldType RefType))) (forall ((arg0@@14 T@T) ) (! (= (Ctor (SeqType arg0@@14)) 9)
 :qid |ctor:SeqType|
))) (forall ((arg0@@15 T@T) ) (! (= (SeqTypeInv0 (SeqType arg0@@15)) arg0@@15)
 :qid |typeInv:SeqTypeInv0|
 :pattern ( (SeqType arg0@@15))
))) (= (type Wand_list_for_list__in_1_0) (FieldType NormalFieldType (SeqType intType)))) (= (type Wand_list_for_list__out_1) (FieldType NormalFieldType RefType))) (= (type Wand_list_for_list__out_1_0) (FieldType NormalFieldType (SeqType intType)))) (= (type Wand_list_for_list__this_1) (FieldType NormalFieldType RefType))) (= (type Wand_list_for_list__L2_1) (FieldType NormalFieldType (SeqType intType)))) (= (type Wand_list_for_list__tmp_suffix_1) (FieldType NormalFieldType (SeqType intType)))) (= (type Wand_list_for_list__L1_1) (FieldType NormalFieldType (SeqType intType)))) (= (type Wand_list_for_list__tmp_1) (FieldType NormalFieldType RefType))) (= (type Wand_list_for_list__suffix_1) (FieldType NormalFieldType (SeqType intType)))) (= (type Wand_list_for_list__cursor_1) (FieldType NormalFieldType RefType))) (= (type Wand_list_for_list__wand_1) (FieldType NormalFieldType RefType))) (= (type Wand_list_for_list__this_2) (FieldType NormalFieldType RefType))) (= (type Wand_list_for_list__L2_2) (FieldType NormalFieldType (SeqType intType)))) (= (type Wand_list_for_list__L1_2) (FieldType NormalFieldType (SeqType intType)))) (= (type List__val) (FieldType NormalFieldType intType))) (= (type List__next) (FieldType NormalFieldType RefType))))
(assert (distinct $allocated Wand_list_for_list__lemma Wand_list_for_list__in_1 Wand_list_for_list__in_1_0 Wand_list_for_list__out_1 Wand_list_for_list__out_1_0 Wand_list_for_list__this_1 Wand_list_for_list__L2_1 Wand_list_for_list__tmp_suffix_1 Wand_list_for_list__L1_1 Wand_list_for_list__tmp_1 Wand_list_for_list__suffix_1 Wand_list_for_list__cursor_1 Wand_list_for_list__wand_1 Wand_list_for_list__this_2 Wand_list_for_list__L2_2 Wand_list_for_list__L1_2 List__val List__next)
)
(assert (forall ((arg0@@16 T@U) (arg1@@2 Int) ) (! (let ((T (SeqTypeInv0 (type arg0@@16))))
(= (type (|Seq#Drop| arg0@@16 arg1@@2)) (SeqType T)))
 :qid |funType:Seq#Drop|
 :pattern ( (|Seq#Drop| arg0@@16 arg1@@2))
)))
(assert (forall ((s T@U) (n Int) ) (! (let ((T@@0 (SeqTypeInv0 (type s))))
 (=> (= (type s) (SeqType T@@0)) (and (=> (<= 0 n) (and (=> (<= n (|Seq#Length| s)) (= (|Seq#Length| (|Seq#Drop| s n)) (- (|Seq#Length| s) n))) (=> (< (|Seq#Length| s) n) (= (|Seq#Length| (|Seq#Drop| s n)) 0)))) (=> (< n 0) (= (|Seq#Length| (|Seq#Drop| s n)) (|Seq#Length| s))))))
 :qid |stdinbpl.279:18|
 :skolemid |38|
 :pattern ( (|Seq#Length| (|Seq#Drop| s n)))
 :pattern ( (|Seq#Length| s) (|Seq#Drop| s n))
)))
(assert  (and (and (and (and (and (forall ((arg0@@17 T@T) ) (! (= (Ctor (MapType0Type arg0@@17)) 10)
 :qid |ctor:MapType0Type|
)) (forall ((arg0@@18 T@T) ) (! (= (MapType0TypeInv0 (MapType0Type arg0@@18)) arg0@@18)
 :qid |typeInv:MapType0TypeInv0|
 :pattern ( (MapType0Type arg0@@18))
))) (forall ((arg0@@19 T@U) (arg1@@3 T@U) (arg2 T@U) ) (! (let ((B (FieldTypeInv1 (type arg2))))
(= (type (MapType0Select arg0@@19 arg1@@3 arg2)) B))
 :qid |funType:MapType0Select|
 :pattern ( (MapType0Select arg0@@19 arg1@@3 arg2))
))) (forall ((arg0@@20 T@U) (arg1@@4 T@U) (arg2@@0 T@U) (arg3 T@U) ) (! (let ((aVar0 (type arg1@@4)))
(= (type (MapType0Store arg0@@20 arg1@@4 arg2@@0 arg3)) (MapType0Type aVar0)))
 :qid |funType:MapType0Store|
 :pattern ( (MapType0Store arg0@@20 arg1@@4 arg2@@0 arg3))
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
(assert  (and (and (and (and (and (and (forall ((arg0@@21 T@T) (arg1@@5 T@T) ) (! (= (Ctor (MapType1Type arg0@@21 arg1@@5)) 11)
 :qid |ctor:MapType1Type|
)) (forall ((arg0@@22 T@T) (arg1@@6 T@T) ) (! (= (MapType1TypeInv0 (MapType1Type arg0@@22 arg1@@6)) arg0@@22)
 :qid |typeInv:MapType1TypeInv0|
 :pattern ( (MapType1Type arg0@@22 arg1@@6))
))) (forall ((arg0@@23 T@T) (arg1@@7 T@T) ) (! (= (MapType1TypeInv1 (MapType1Type arg0@@23 arg1@@7)) arg1@@7)
 :qid |typeInv:MapType1TypeInv1|
 :pattern ( (MapType1Type arg0@@23 arg1@@7))
))) (forall ((arg0@@24 T@U) (arg1@@8 T@U) (arg2@@1 T@U) ) (! (let ((aVar1 (MapType1TypeInv1 (type arg0@@24))))
(= (type (MapType1Select arg0@@24 arg1@@8 arg2@@1)) aVar1))
 :qid |funType:MapType1Select|
 :pattern ( (MapType1Select arg0@@24 arg1@@8 arg2@@1))
))) (forall ((arg0@@25 T@U) (arg1@@9 T@U) (arg2@@2 T@U) (arg3@@0 T@U) ) (! (let ((aVar1@@0 (type arg3@@0)))
(let ((aVar0@@0 (type arg1@@9)))
(= (type (MapType1Store arg0@@25 arg1@@9 arg2@@2 arg3@@0)) (MapType1Type aVar0@@0 aVar1@@0))))
 :qid |funType:MapType1Store|
 :pattern ( (MapType1Store arg0@@25 arg1@@9 arg2@@2 arg3@@0))
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
(assert (forall ((arg0@@26 T@U) (arg1@@10 Int) ) (! (let ((T@@1 (SeqTypeInv0 (type arg0@@26))))
(= (type (|Seq#Index| arg0@@26 arg1@@10)) T@@1))
 :qid |funType:Seq#Index|
 :pattern ( (|Seq#Index| arg0@@26 arg1@@10))
)))
(assert (forall ((s@@0 T@U) (n@@0 Int) (j Int) ) (! (let ((T@@2 (SeqTypeInv0 (type s@@0))))
 (=> (= (type s@@0) (SeqType T@@2)) (=> (and (and (< 0 n@@0) (<= 0 j)) (< j (- (|Seq#Length| s@@0) n@@0))) (and (= (|Seq#Sub| (|Seq#Add| j n@@0) n@@0) j) (= (|Seq#Index| (|Seq#Drop| s@@0 n@@0) j) (|Seq#Index| s@@0 (|Seq#Add| j n@@0)))))))
 :qid |stdinbpl.300:18|
 :skolemid |39|
 :pattern ( (|Seq#Index| (|Seq#Drop| s@@0 n@@0) j))
)))
(assert  (and (and (= (Ctor FrameTypeType) 12) (= (type null) RefType)) (forall ((arg0@@27 T@U) ) (! (let ((A (FieldTypeInv0 (type arg0@@27))))
(= (type (PredicateMaskField arg0@@27)) (FieldType A (MapType1Type RefType boolType))))
 :qid |funType:PredicateMaskField|
 :pattern ( (PredicateMaskField arg0@@27))
))))
(assert (forall ((Heap@@0 T@U) (ExhaleHeap T@U) (Mask@@0 T@U) (pm_f T@U) ) (! (let ((C (FieldTypeInv0 (type pm_f))))
 (=> (and (and (and (and (and (= (type Heap@@0) (MapType0Type RefType)) (= (type ExhaleHeap) (MapType0Type RefType))) (= (type Mask@@0) (MapType1Type RefType realType))) (= (type pm_f) (FieldType C FrameTypeType))) (IdenticalOnKnownLocations Heap@@0 ExhaleHeap Mask@@0)) (and (HasDirectPerm Mask@@0 null pm_f) (IsPredicateField pm_f))) (= (MapType0Select Heap@@0 null (PredicateMaskField pm_f)) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))))
 :qid |stdinbpl.47:19|
 :skolemid |2|
 :pattern ( (IdenticalOnKnownLocations Heap@@0 ExhaleHeap Mask@@0) (IsPredicateField pm_f) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))
)))
(assert (forall ((arg0@@28 T@U) ) (! (let ((A@@0 (FieldTypeInv0 (type arg0@@28))))
(= (type (WandMaskField arg0@@28)) (FieldType A@@0 (MapType1Type RefType boolType))))
 :qid |funType:WandMaskField|
 :pattern ( (WandMaskField arg0@@28))
)))
(assert (forall ((Heap@@1 T@U) (ExhaleHeap@@0 T@U) (Mask@@1 T@U) (pm_f@@0 T@U) ) (! (let ((C@@0 (FieldTypeInv0 (type pm_f@@0))))
 (=> (and (and (and (and (and (= (type Heap@@1) (MapType0Type RefType)) (= (type ExhaleHeap@@0) (MapType0Type RefType))) (= (type Mask@@1) (MapType1Type RefType realType))) (= (type pm_f@@0) (FieldType C@@0 FrameTypeType))) (IdenticalOnKnownLocations Heap@@1 ExhaleHeap@@0 Mask@@1)) (and (HasDirectPerm Mask@@1 null pm_f@@0) (IsWandField pm_f@@0))) (= (MapType0Select Heap@@1 null (WandMaskField pm_f@@0)) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))))
 :qid |stdinbpl.60:19|
 :skolemid |5|
 :pattern ( (IdenticalOnKnownLocations Heap@@1 ExhaleHeap@@0 Mask@@1) (IsWandField pm_f@@0) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))
)))
(assert  (and (= (Ctor PredicateType_Wand_list_for_list__valid_wandType) 13) (forall ((arg0@@29 T@U) ) (! (= (type (Wand_list_for_list__valid_wand arg0@@29)) (FieldType PredicateType_Wand_list_for_list__valid_wandType FrameTypeType))
 :qid |funType:Wand_list_for_list__valid_wand|
 :pattern ( (Wand_list_for_list__valid_wand arg0@@29))
))))
(assert (forall ((diz T@U) ) (!  (=> (= (type diz) RefType) (IsPredicateField (Wand_list_for_list__valid_wand diz)))
 :qid |stdinbpl.1839:15|
 :skolemid |91|
 :pattern ( (Wand_list_for_list__valid_wand diz))
)))
(assert  (and (= (Ctor PredicateType_List__stateType) 14) (forall ((arg0@@30 T@U) ) (! (= (type (List__state arg0@@30)) (FieldType PredicateType_List__stateType FrameTypeType))
 :qid |funType:List__state|
 :pattern ( (List__state arg0@@30))
))))
(assert (forall ((diz@@0 T@U) ) (!  (=> (= (type diz@@0) RefType) (IsPredicateField (List__state diz@@0)))
 :qid |stdinbpl.2239:15|
 :skolemid |97|
 :pattern ( (List__state diz@@0))
)))
(assert  (and (forall ((arg0@@31 T@U) (arg1@@11 T@U) ) (! (= (type (|Wand_list_for_list__get_in_1'| arg0@@31 arg1@@11)) RefType)
 :qid |funType:Wand_list_for_list__get_in_1'|
 :pattern ( (|Wand_list_for_list__get_in_1'| arg0@@31 arg1@@11))
)) (forall ((arg0@@32 T@U) ) (! (= (type (|Wand_list_for_list__get_in_1#triggerStateless| arg0@@32)) RefType)
 :qid |funType:Wand_list_for_list__get_in_1#triggerStateless|
 :pattern ( (|Wand_list_for_list__get_in_1#triggerStateless| arg0@@32))
))))
(assert (forall ((Heap@@2 T@U) (diz@@1 T@U) ) (!  (=> (and (= (type Heap@@2) (MapType0Type RefType)) (= (type diz@@1) RefType)) (dummyFunction (|Wand_list_for_list__get_in_1#triggerStateless| diz@@1)))
 :qid |stdinbpl.615:15|
 :skolemid |59|
 :pattern ( (|Wand_list_for_list__get_in_1'| Heap@@2 diz@@1))
)))
(assert  (and (forall ((arg0@@33 T@U) (arg1@@12 T@U) ) (! (= (type (|Wand_list_for_list__get_in_1_0'| arg0@@33 arg1@@12)) (SeqType intType))
 :qid |funType:Wand_list_for_list__get_in_1_0'|
 :pattern ( (|Wand_list_for_list__get_in_1_0'| arg0@@33 arg1@@12))
)) (forall ((arg0@@34 T@U) ) (! (= (type (|Wand_list_for_list__get_in_1_0#triggerStateless| arg0@@34)) (SeqType intType))
 :qid |funType:Wand_list_for_list__get_in_1_0#triggerStateless|
 :pattern ( (|Wand_list_for_list__get_in_1_0#triggerStateless| arg0@@34))
))))
(assert (forall ((Heap@@3 T@U) (diz@@2 T@U) ) (!  (=> (and (= (type Heap@@3) (MapType0Type RefType)) (= (type diz@@2) RefType)) (dummyFunction (|Wand_list_for_list__get_in_1_0#triggerStateless| diz@@2)))
 :qid |stdinbpl.863:15|
 :skolemid |65|
 :pattern ( (|Wand_list_for_list__get_in_1_0'| Heap@@3 diz@@2))
)))
(assert  (and (forall ((arg0@@35 T@U) (arg1@@13 T@U) ) (! (= (type (|Wand_list_for_list__get_out_1'| arg0@@35 arg1@@13)) RefType)
 :qid |funType:Wand_list_for_list__get_out_1'|
 :pattern ( (|Wand_list_for_list__get_out_1'| arg0@@35 arg1@@13))
)) (forall ((arg0@@36 T@U) ) (! (= (type (|Wand_list_for_list__get_out_1#triggerStateless| arg0@@36)) RefType)
 :qid |funType:Wand_list_for_list__get_out_1#triggerStateless|
 :pattern ( (|Wand_list_for_list__get_out_1#triggerStateless| arg0@@36))
))))
(assert (forall ((Heap@@4 T@U) (diz@@3 T@U) ) (!  (=> (and (= (type Heap@@4) (MapType0Type RefType)) (= (type diz@@3) RefType)) (dummyFunction (|Wand_list_for_list__get_out_1#triggerStateless| diz@@3)))
 :qid |stdinbpl.1099:15|
 :skolemid |70|
 :pattern ( (|Wand_list_for_list__get_out_1'| Heap@@4 diz@@3))
)))
(assert  (and (forall ((arg0@@37 T@U) (arg1@@14 T@U) ) (! (= (type (|Wand_list_for_list__get_out_1_0'| arg0@@37 arg1@@14)) (SeqType intType))
 :qid |funType:Wand_list_for_list__get_out_1_0'|
 :pattern ( (|Wand_list_for_list__get_out_1_0'| arg0@@37 arg1@@14))
)) (forall ((arg0@@38 T@U) ) (! (= (type (|Wand_list_for_list__get_out_1_0#triggerStateless| arg0@@38)) (SeqType intType))
 :qid |funType:Wand_list_for_list__get_out_1_0#triggerStateless|
 :pattern ( (|Wand_list_for_list__get_out_1_0#triggerStateless| arg0@@38))
))))
(assert (forall ((Heap@@5 T@U) (diz@@4 T@U) ) (!  (=> (and (= (type Heap@@5) (MapType0Type RefType)) (= (type diz@@4) RefType)) (dummyFunction (|Wand_list_for_list__get_out_1_0#triggerStateless| diz@@4)))
 :qid |stdinbpl.1347:15|
 :skolemid |76|
 :pattern ( (|Wand_list_for_list__get_out_1_0'| Heap@@5 diz@@4))
)))
(assert  (and (forall ((arg0@@39 T@U) (arg1@@15 T@U) ) (! (= (type (|List__contents'| arg0@@39 arg1@@15)) (SeqType intType))
 :qid |funType:List__contents'|
 :pattern ( (|List__contents'| arg0@@39 arg1@@15))
)) (forall ((arg0@@40 T@U) ) (! (= (type (|List__contents#triggerStateless| arg0@@40)) (SeqType intType))
 :qid |funType:List__contents#triggerStateless|
 :pattern ( (|List__contents#triggerStateless| arg0@@40))
))))
(assert (forall ((Heap@@6 T@U) (diz@@5 T@U) ) (!  (=> (and (= (type Heap@@6) (MapType0Type RefType)) (= (type diz@@5) RefType)) (dummyFunction (|List__contents#triggerStateless| diz@@5)))
 :qid |stdinbpl.1583:15|
 :skolemid |81|
 :pattern ( (|List__contents'| Heap@@6 diz@@5))
)))
(assert  (and (forall ((arg0@@41 T@U) (arg1@@16 T@U) ) (! (= (type (|List__get_next'| arg0@@41 arg1@@16)) RefType)
 :qid |funType:List__get_next'|
 :pattern ( (|List__get_next'| arg0@@41 arg1@@16))
)) (forall ((arg0@@42 T@U) ) (! (= (type (|List__get_next#triggerStateless| arg0@@42)) RefType)
 :qid |funType:List__get_next#triggerStateless|
 :pattern ( (|List__get_next#triggerStateless| arg0@@42))
))))
(assert (forall ((Heap@@7 T@U) (diz@@6 T@U) ) (!  (=> (and (= (type Heap@@7) (MapType0Type RefType)) (= (type diz@@6) RefType)) (dummyFunction (|List__get_next#triggerStateless| diz@@6)))
 :qid |stdinbpl.1727:15|
 :skolemid |86|
 :pattern ( (|List__get_next'| Heap@@7 diz@@6))
)))
(assert (forall ((Heap@@8 T@U) (diz@@7 T@U) ) (!  (=> (and (= (type Heap@@8) (MapType0Type RefType)) (= (type diz@@7) RefType)) (|Wand_list_for_list__valid_wand#everUsed| (Wand_list_for_list__valid_wand diz@@7)))
 :qid |stdinbpl.1858:15|
 :skolemid |95|
 :pattern ( (|Wand_list_for_list__valid_wand#trigger| Heap@@8 (Wand_list_for_list__valid_wand diz@@7)))
)))
(assert (forall ((Heap@@9 T@U) (diz@@8 T@U) ) (!  (=> (and (= (type Heap@@9) (MapType0Type RefType)) (= (type diz@@8) RefType)) (|List__state#everUsed| (List__state diz@@8)))
 :qid |stdinbpl.2258:15|
 :skolemid |101|
 :pattern ( (|List__state#trigger| Heap@@9 (List__state diz@@8)))
)))
(assert (forall ((arg0@@43 T@U) (arg1@@17 Int) (arg2@@3 T@U) ) (! (let ((T@@3 (type arg2@@3)))
(= (type (|Seq#Update| arg0@@43 arg1@@17 arg2@@3)) (SeqType T@@3)))
 :qid |funType:Seq#Update|
 :pattern ( (|Seq#Update| arg0@@43 arg1@@17 arg2@@3))
)))
(assert (forall ((s@@1 T@U) (i Int) (v T@U) (n@@1 Int) ) (! (let ((T@@4 (type v)))
 (=> (= (type s@@1) (SeqType T@@4)) (=> (and (<= 0 n@@1) (< n@@1 (|Seq#Length| s@@1))) (and (=> (= i n@@1) (= (|Seq#Index| (|Seq#Update| s@@1 i v) n@@1) v)) (=> (not (= i n@@1)) (= (|Seq#Index| (|Seq#Update| s@@1 i v) n@@1) (|Seq#Index| s@@1 n@@1)))))))
 :qid |stdinbpl.255:18|
 :skolemid |35|
 :pattern ( (|Seq#Index| (|Seq#Update| s@@1 i v) n@@1))
 :pattern ( (|Seq#Index| s@@1 n@@1) (|Seq#Update| s@@1 i v))
)))
(assert (forall ((arg0@@44 T@U) (arg1@@18 Int) ) (! (let ((T@@5 (SeqTypeInv0 (type arg0@@44))))
(= (type (|Seq#Take| arg0@@44 arg1@@18)) (SeqType T@@5)))
 :qid |funType:Seq#Take|
 :pattern ( (|Seq#Take| arg0@@44 arg1@@18))
)))
(assert (forall ((s@@2 T@U) (n@@2 Int) ) (! (let ((T@@6 (SeqTypeInv0 (type s@@2))))
 (=> (= (type s@@2) (SeqType T@@6)) (and (=> (<= 0 n@@2) (and (=> (<= n@@2 (|Seq#Length| s@@2)) (= (|Seq#Length| (|Seq#Take| s@@2 n@@2)) n@@2)) (=> (< (|Seq#Length| s@@2) n@@2) (= (|Seq#Length| (|Seq#Take| s@@2 n@@2)) (|Seq#Length| s@@2))))) (=> (< n@@2 0) (= (|Seq#Length| (|Seq#Take| s@@2 n@@2)) 0)))))
 :qid |stdinbpl.266:18|
 :skolemid |36|
 :pattern ( (|Seq#Length| (|Seq#Take| s@@2 n@@2)))
 :pattern ( (|Seq#Take| s@@2 n@@2) (|Seq#Length| s@@2))
)))
(assert (forall ((arg0@@45 Int) (arg1@@19 Int) ) (! (= (type (|Seq#Range| arg0@@45 arg1@@19)) (SeqType intType))
 :qid |funType:Seq#Range|
 :pattern ( (|Seq#Range| arg0@@45 arg1@@19))
)))
(assert (forall ((q@min Int) (q@max Int) (v@@0 T@U) ) (!  (=> (= (type v@@0) intType) (= (|Seq#Contains| (|Seq#Range| q@min q@max) v@@0)  (and (<= q@min (U_2_int v@@0)) (< (U_2_int v@@0) q@max))))
 :qid |stdinbpl.539:15|
 :skolemid |57|
 :pattern ( (|Seq#Contains| (|Seq#Range| q@min q@max) v@@0))
)))
(assert (forall ((s@@3 T@U) (x@@8 T@U) ) (! (let ((T@@7 (type x@@8)))
 (=> (and (= (type s@@3) (SeqType T@@7)) (|Seq#Contains| s@@3 x@@8)) (and (and (<= 0 (|Seq#Skolem| s@@3 x@@8)) (< (|Seq#Skolem| s@@3 x@@8) (|Seq#Length| s@@3))) (= (|Seq#Index| s@@3 (|Seq#Skolem| s@@3 x@@8)) x@@8))))
 :qid |stdinbpl.397:18|
 :skolemid |47|
 :pattern ( (|Seq#Contains| s@@3 x@@8))
)))
(assert (forall ((Heap@@10 T@U) (ExhaleHeap@@1 T@U) (Mask@@2 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@10) (MapType0Type RefType)) (= (type ExhaleHeap@@1) (MapType0Type RefType))) (= (type Mask@@2) (MapType1Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@10 ExhaleHeap@@1 Mask@@2)) (U_2_bool (MapType0Select Heap@@10 o_1 $allocated))) (U_2_bool (MapType0Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.73:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@10 ExhaleHeap@@1 Mask@@2) (MapType0Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert (forall ((arg0@@46 T@U) (arg1@@20 T@U) ) (! (= (type (Wand_list_for_list__get_in_1 arg0@@46 arg1@@20)) RefType)
 :qid |funType:Wand_list_for_list__get_in_1|
 :pattern ( (Wand_list_for_list__get_in_1 arg0@@46 arg1@@20))
)))
(assert (forall ((Heap@@11 T@U) (diz@@9 T@U) ) (!  (=> (and (= (type Heap@@11) (MapType0Type RefType)) (= (type diz@@9) RefType)) (and (= (Wand_list_for_list__get_in_1 Heap@@11 diz@@9) (|Wand_list_for_list__get_in_1'| Heap@@11 diz@@9)) (dummyFunction (|Wand_list_for_list__get_in_1#triggerStateless| diz@@9))))
 :qid |stdinbpl.611:15|
 :skolemid |58|
 :pattern ( (Wand_list_for_list__get_in_1 Heap@@11 diz@@9))
)))
(assert (forall ((arg0@@47 T@U) (arg1@@21 T@U) ) (! (= (type (Wand_list_for_list__get_in_1_0 arg0@@47 arg1@@21)) (SeqType intType))
 :qid |funType:Wand_list_for_list__get_in_1_0|
 :pattern ( (Wand_list_for_list__get_in_1_0 arg0@@47 arg1@@21))
)))
(assert (forall ((Heap@@12 T@U) (diz@@10 T@U) ) (!  (=> (and (= (type Heap@@12) (MapType0Type RefType)) (= (type diz@@10) RefType)) (and (= (Wand_list_for_list__get_in_1_0 Heap@@12 diz@@10) (|Wand_list_for_list__get_in_1_0'| Heap@@12 diz@@10)) (dummyFunction (|Wand_list_for_list__get_in_1_0#triggerStateless| diz@@10))))
 :qid |stdinbpl.859:15|
 :skolemid |64|
 :pattern ( (Wand_list_for_list__get_in_1_0 Heap@@12 diz@@10))
)))
(assert (forall ((arg0@@48 T@U) (arg1@@22 T@U) ) (! (= (type (Wand_list_for_list__get_out_1 arg0@@48 arg1@@22)) RefType)
 :qid |funType:Wand_list_for_list__get_out_1|
 :pattern ( (Wand_list_for_list__get_out_1 arg0@@48 arg1@@22))
)))
(assert (forall ((Heap@@13 T@U) (diz@@11 T@U) ) (!  (=> (and (= (type Heap@@13) (MapType0Type RefType)) (= (type diz@@11) RefType)) (and (= (Wand_list_for_list__get_out_1 Heap@@13 diz@@11) (|Wand_list_for_list__get_out_1'| Heap@@13 diz@@11)) (dummyFunction (|Wand_list_for_list__get_out_1#triggerStateless| diz@@11))))
 :qid |stdinbpl.1095:15|
 :skolemid |69|
 :pattern ( (Wand_list_for_list__get_out_1 Heap@@13 diz@@11))
)))
(assert (forall ((arg0@@49 T@U) (arg1@@23 T@U) ) (! (= (type (Wand_list_for_list__get_out_1_0 arg0@@49 arg1@@23)) (SeqType intType))
 :qid |funType:Wand_list_for_list__get_out_1_0|
 :pattern ( (Wand_list_for_list__get_out_1_0 arg0@@49 arg1@@23))
)))
(assert (forall ((Heap@@14 T@U) (diz@@12 T@U) ) (!  (=> (and (= (type Heap@@14) (MapType0Type RefType)) (= (type diz@@12) RefType)) (and (= (Wand_list_for_list__get_out_1_0 Heap@@14 diz@@12) (|Wand_list_for_list__get_out_1_0'| Heap@@14 diz@@12)) (dummyFunction (|Wand_list_for_list__get_out_1_0#triggerStateless| diz@@12))))
 :qid |stdinbpl.1343:15|
 :skolemid |75|
 :pattern ( (Wand_list_for_list__get_out_1_0 Heap@@14 diz@@12))
)))
(assert (forall ((arg0@@50 T@U) (arg1@@24 T@U) ) (! (= (type (List__contents arg0@@50 arg1@@24)) (SeqType intType))
 :qid |funType:List__contents|
 :pattern ( (List__contents arg0@@50 arg1@@24))
)))
(assert (forall ((Heap@@15 T@U) (diz@@13 T@U) ) (!  (=> (and (= (type Heap@@15) (MapType0Type RefType)) (= (type diz@@13) RefType)) (and (= (List__contents Heap@@15 diz@@13) (|List__contents'| Heap@@15 diz@@13)) (dummyFunction (|List__contents#triggerStateless| diz@@13))))
 :qid |stdinbpl.1579:15|
 :skolemid |80|
 :pattern ( (List__contents Heap@@15 diz@@13))
)))
(assert (forall ((arg0@@51 T@U) (arg1@@25 T@U) ) (! (= (type (List__get_next arg0@@51 arg1@@25)) RefType)
 :qid |funType:List__get_next|
 :pattern ( (List__get_next arg0@@51 arg1@@25))
)))
(assert (forall ((Heap@@16 T@U) (diz@@14 T@U) ) (!  (=> (and (= (type Heap@@16) (MapType0Type RefType)) (= (type diz@@14) RefType)) (and (= (List__get_next Heap@@16 diz@@14) (|List__get_next'| Heap@@16 diz@@14)) (dummyFunction (|List__get_next#triggerStateless| diz@@14))))
 :qid |stdinbpl.1723:15|
 :skolemid |85|
 :pattern ( (List__get_next Heap@@16 diz@@14))
)))
(assert (forall ((s@@4 T@U) (n@@3 Int) ) (! (let ((T@@8 (SeqTypeInv0 (type s@@4))))
 (=> (and (= (type s@@4) (SeqType T@@8)) (<= n@@3 0)) (= (|Seq#Drop| s@@4 n@@3) s@@4)))
 :qid |stdinbpl.381:18|
 :skolemid |45|
 :pattern ( (|Seq#Drop| s@@4 n@@3))
)))
(assert (forall ((i@@0 Int) (j@@0 Int) ) (! (= (|Seq#Sub| i@@0 j@@0) (- i@@0 j@@0))
 :qid |stdinbpl.235:15|
 :skolemid |30|
 :pattern ( (|Seq#Sub| i@@0 j@@0))
)))
(assert (forall ((i@@1 Int) (j@@1 Int) ) (! (= (|Seq#Add| i@@1 j@@1) (+ i@@1 j@@1))
 :qid |stdinbpl.233:15|
 :skolemid |29|
 :pattern ( (|Seq#Add| i@@1 j@@1))
)))
(assert (forall ((arg0@@52 T@U) ) (! (let ((T@@9 (type arg0@@52)))
(= (type (|Seq#Singleton| arg0@@52)) (SeqType T@@9)))
 :qid |funType:Seq#Singleton|
 :pattern ( (|Seq#Singleton| arg0@@52))
)))
(assert (forall ((x@@9 T@U) (y@@1 T@U) ) (! (let ((T@@10 (type x@@9)))
 (=> (= (type y@@1) T@@10) (= (|Seq#Contains| (|Seq#Singleton| x@@9) y@@1) (= x@@9 y@@1))))
 :qid |stdinbpl.522:18|
 :skolemid |54|
 :pattern ( (|Seq#Contains| (|Seq#Singleton| x@@9) y@@1))
)))
(assert (forall ((s@@5 T@U) (n@@4 Int) (j@@2 Int) ) (! (let ((T@@11 (SeqTypeInv0 (type s@@5))))
 (=> (= (type s@@5) (SeqType T@@11)) (=> (and (and (<= 0 j@@2) (< j@@2 n@@4)) (< j@@2 (|Seq#Length| s@@5))) (= (|Seq#Index| (|Seq#Take| s@@5 n@@4) j@@2) (|Seq#Index| s@@5 j@@2)))))
 :qid |stdinbpl.274:18|
 :skolemid |37|
 :pattern ( (|Seq#Index| (|Seq#Take| s@@5 n@@4) j@@2))
 :pattern ( (|Seq#Index| s@@5 j@@2) (|Seq#Take| s@@5 n@@4))
)))
(assert (forall ((diz@@15 T@U) (diz2 T@U) ) (!  (=> (and (and (= (type diz@@15) RefType) (= (type diz2) RefType)) (= (Wand_list_for_list__valid_wand diz@@15) (Wand_list_for_list__valid_wand diz2))) (= diz@@15 diz2))
 :qid |stdinbpl.1849:15|
 :skolemid |93|
 :pattern ( (Wand_list_for_list__valid_wand diz@@15) (Wand_list_for_list__valid_wand diz2))
)))
(assert (forall ((arg0@@53 T@U) ) (! (= (type (|Wand_list_for_list__valid_wand#sm| arg0@@53)) (FieldType PredicateType_Wand_list_for_list__valid_wandType (MapType1Type RefType boolType)))
 :qid |funType:Wand_list_for_list__valid_wand#sm|
 :pattern ( (|Wand_list_for_list__valid_wand#sm| arg0@@53))
)))
(assert (forall ((diz@@16 T@U) (diz2@@0 T@U) ) (!  (=> (and (and (= (type diz@@16) RefType) (= (type diz2@@0) RefType)) (= (|Wand_list_for_list__valid_wand#sm| diz@@16) (|Wand_list_for_list__valid_wand#sm| diz2@@0))) (= diz@@16 diz2@@0))
 :qid |stdinbpl.1853:15|
 :skolemid |94|
 :pattern ( (|Wand_list_for_list__valid_wand#sm| diz@@16) (|Wand_list_for_list__valid_wand#sm| diz2@@0))
)))
(assert (forall ((diz@@17 T@U) (diz2@@1 T@U) ) (!  (=> (and (and (= (type diz@@17) RefType) (= (type diz2@@1) RefType)) (= (List__state diz@@17) (List__state diz2@@1))) (= diz@@17 diz2@@1))
 :qid |stdinbpl.2249:15|
 :skolemid |99|
 :pattern ( (List__state diz@@17) (List__state diz2@@1))
)))
(assert (forall ((arg0@@54 T@U) ) (! (= (type (|List__state#sm| arg0@@54)) (FieldType PredicateType_List__stateType (MapType1Type RefType boolType)))
 :qid |funType:List__state#sm|
 :pattern ( (|List__state#sm| arg0@@54))
)))
(assert (forall ((diz@@18 T@U) (diz2@@2 T@U) ) (!  (=> (and (and (= (type diz@@18) RefType) (= (type diz2@@2) RefType)) (= (|List__state#sm| diz@@18) (|List__state#sm| diz2@@2))) (= diz@@18 diz2@@2))
 :qid |stdinbpl.2253:15|
 :skolemid |100|
 :pattern ( (|List__state#sm| diz@@18) (|List__state#sm| diz2@@2))
)))
(assert (forall ((Heap@@17 T@U) (ExhaleHeap@@2 T@U) (Mask@@3 T@U) (o_1@@0 T@U) (f_2 T@U) ) (! (let ((B@@1 (FieldTypeInv1 (type f_2))))
(let ((A@@1 (FieldTypeInv0 (type f_2))))
 (=> (and (and (and (and (and (and (= (type Heap@@17) (MapType0Type RefType)) (= (type ExhaleHeap@@2) (MapType0Type RefType))) (= (type Mask@@3) (MapType1Type RefType realType))) (= (type o_1@@0) RefType)) (= (type f_2) (FieldType A@@1 B@@1))) (IdenticalOnKnownLocations Heap@@17 ExhaleHeap@@2 Mask@@3)) (HasDirectPerm Mask@@3 o_1@@0 f_2)) (= (MapType0Select Heap@@17 o_1@@0 f_2) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2)))))
 :qid |stdinbpl.42:22|
 :skolemid |1|
 :pattern ( (IdenticalOnKnownLocations Heap@@17 ExhaleHeap@@2 Mask@@3) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2))
)))
(assert (forall ((T@@12 T@T) ) (! (= (type (|Seq#Empty| T@@12)) (SeqType T@@12))
 :qid |funType:Seq#Empty|
 :pattern ( (|Seq#Empty| T@@12))
)))
(assert (forall ((T@@13 T@T) ) (! (= (|Seq#Length| (|Seq#Empty| T@@13)) 0)
 :skolemid |23|
)))
(assert  (and (= (type dummyHeap) (MapType0Type RefType)) (= (type ZeroMask) (MapType1Type RefType realType))))
(assert (state dummyHeap ZeroMask))
(assert (forall ((p T@U) (v_1 T@U) (w T@U) ) (! (let ((A@@2 (FieldTypeInv0 (type p))))
 (=> (and (and (= (type p) (FieldType A@@2 FrameTypeType)) (= (type v_1) FrameTypeType)) (= (type w) FrameTypeType)) (not (InsidePredicate p v_1 p w))))
 :qid |stdinbpl.178:19|
 :skolemid |21|
 :pattern ( (InsidePredicate p v_1 p w))
)))
(assert (forall ((arg0@@55 T@U) (arg1@@26 T@U) ) (! (let ((T@@14 (SeqTypeInv0 (type arg0@@55))))
(= (type (|Seq#Append| arg0@@55 arg1@@26)) (SeqType T@@14)))
 :qid |funType:Seq#Append|
 :pattern ( (|Seq#Append| arg0@@55 arg1@@26))
)))
(assert (forall ((s0 T@U) (s1 T@U) (n@@5 Int) ) (! (let ((T@@15 (SeqTypeInv0 (type s0))))
 (=> (and (= (type s0) (SeqType T@@15)) (= (type s1) (SeqType T@@15))) (=> (and (and (and (not (= s0 (|Seq#Empty| T@@15))) (not (= s1 (|Seq#Empty| T@@15)))) (<= (|Seq#Length| s0) n@@5)) (< n@@5 (|Seq#Length| (|Seq#Append| s0 s1)))) (and (= (|Seq#Add| (|Seq#Sub| n@@5 (|Seq#Length| s0)) (|Seq#Length| s0)) n@@5) (= (|Seq#Index| (|Seq#Append| s0 s1) n@@5) (|Seq#Index| s1 (|Seq#Sub| n@@5 (|Seq#Length| s0))))))))
 :qid |stdinbpl.246:18|
 :skolemid |32|
 :pattern ( (|Seq#Index| (|Seq#Append| s0 s1) n@@5))
)))
(assert  (not (IsPredicateField Wand_list_for_list__lemma)))
(assert  (not (IsWandField Wand_list_for_list__lemma)))
(assert  (not (IsPredicateField Wand_list_for_list__in_1)))
(assert  (not (IsWandField Wand_list_for_list__in_1)))
(assert  (not (IsPredicateField Wand_list_for_list__in_1_0)))
(assert  (not (IsWandField Wand_list_for_list__in_1_0)))
(assert  (not (IsPredicateField Wand_list_for_list__out_1)))
(assert  (not (IsWandField Wand_list_for_list__out_1)))
(assert  (not (IsPredicateField Wand_list_for_list__out_1_0)))
(assert  (not (IsWandField Wand_list_for_list__out_1_0)))
(assert  (not (IsPredicateField Wand_list_for_list__this_1)))
(assert  (not (IsWandField Wand_list_for_list__this_1)))
(assert  (not (IsPredicateField Wand_list_for_list__L2_1)))
(assert  (not (IsWandField Wand_list_for_list__L2_1)))
(assert  (not (IsPredicateField Wand_list_for_list__tmp_suffix_1)))
(assert  (not (IsWandField Wand_list_for_list__tmp_suffix_1)))
(assert  (not (IsPredicateField Wand_list_for_list__L1_1)))
(assert  (not (IsWandField Wand_list_for_list__L1_1)))
(assert  (not (IsPredicateField Wand_list_for_list__tmp_1)))
(assert  (not (IsWandField Wand_list_for_list__tmp_1)))
(assert  (not (IsPredicateField Wand_list_for_list__suffix_1)))
(assert  (not (IsWandField Wand_list_for_list__suffix_1)))
(assert  (not (IsPredicateField Wand_list_for_list__cursor_1)))
(assert  (not (IsWandField Wand_list_for_list__cursor_1)))
(assert  (not (IsPredicateField Wand_list_for_list__wand_1)))
(assert  (not (IsWandField Wand_list_for_list__wand_1)))
(assert  (not (IsPredicateField Wand_list_for_list__this_2)))
(assert  (not (IsWandField Wand_list_for_list__this_2)))
(assert  (not (IsPredicateField Wand_list_for_list__L2_2)))
(assert  (not (IsWandField Wand_list_for_list__L2_2)))
(assert  (not (IsPredicateField Wand_list_for_list__L1_2)))
(assert  (not (IsWandField Wand_list_for_list__L1_2)))
(assert  (not (IsPredicateField List__val)))
(assert  (not (IsWandField List__val)))
(assert  (not (IsPredicateField List__next)))
(assert  (not (IsWandField List__next)))
(assert (forall ((Heap@@18 T@U) (ExhaleHeap@@3 T@U) (Mask@@4 T@U) ) (!  (=> (and (and (and (= (type Heap@@18) (MapType0Type RefType)) (= (type ExhaleHeap@@3) (MapType0Type RefType))) (= (type Mask@@4) (MapType1Type RefType realType))) (IdenticalOnKnownLocations Heap@@18 ExhaleHeap@@3 Mask@@4)) (succHeap Heap@@18 ExhaleHeap@@3))
 :qid |stdinbpl.83:15|
 :skolemid |10|
 :pattern ( (IdenticalOnKnownLocations Heap@@18 ExhaleHeap@@3 Mask@@4))
)))
(assert (forall ((Heap@@19 T@U) (Mask@@5 T@U) (diz@@19 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@19) (MapType0Type RefType)) (= (type Mask@@5) (MapType1Type RefType realType))) (= (type diz@@19) RefType)) (and (state Heap@@19 Mask@@5) (< AssumeFunctionsAbove 0))) (not (= diz@@19 null))) (= (Wand_list_for_list__get_in_1_0 Heap@@19 diz@@19) (MapType0Select Heap@@19 diz@@19 Wand_list_for_list__in_1_0)))
 :qid |stdinbpl.869:15|
 :skolemid |66|
 :pattern ( (state Heap@@19 Mask@@5) (Wand_list_for_list__get_in_1_0 Heap@@19 diz@@19))
 :pattern ( (state Heap@@19 Mask@@5) (|Wand_list_for_list__get_in_1_0#triggerStateless| diz@@19) (|Wand_list_for_list__valid_wand#trigger| Heap@@19 (Wand_list_for_list__valid_wand diz@@19)))
)))
(assert (forall ((Heap@@20 T@U) (Mask@@6 T@U) (diz@@20 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@20) (MapType0Type RefType)) (= (type Mask@@6) (MapType1Type RefType realType))) (= (type diz@@20) RefType)) (and (state Heap@@20 Mask@@6) (< AssumeFunctionsAbove 1))) (not (= diz@@20 null))) (= (Wand_list_for_list__get_in_1 Heap@@20 diz@@20) (MapType0Select Heap@@20 diz@@20 Wand_list_for_list__in_1)))
 :qid |stdinbpl.621:15|
 :skolemid |60|
 :pattern ( (state Heap@@20 Mask@@6) (Wand_list_for_list__get_in_1 Heap@@20 diz@@20))
 :pattern ( (state Heap@@20 Mask@@6) (|Wand_list_for_list__get_in_1#triggerStateless| diz@@20) (|Wand_list_for_list__valid_wand#trigger| Heap@@20 (Wand_list_for_list__valid_wand diz@@20)))
)))
(assert (forall ((Heap@@21 T@U) (Mask@@7 T@U) (diz@@21 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@21) (MapType0Type RefType)) (= (type Mask@@7) (MapType1Type RefType realType))) (= (type diz@@21) RefType)) (and (state Heap@@21 Mask@@7) (< AssumeFunctionsAbove 2))) (not (= diz@@21 null))) (= (List__get_next Heap@@21 diz@@21) (MapType0Select Heap@@21 diz@@21 List__next)))
 :qid |stdinbpl.1733:15|
 :skolemid |87|
 :pattern ( (state Heap@@21 Mask@@7) (List__get_next Heap@@21 diz@@21))
 :pattern ( (state Heap@@21 Mask@@7) (|List__get_next#triggerStateless| diz@@21) (|List__state#trigger| Heap@@21 (List__state diz@@21)))
)))
(assert (forall ((Heap@@22 T@U) (Mask@@8 T@U) (diz@@22 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@22) (MapType0Type RefType)) (= (type Mask@@8) (MapType1Type RefType realType))) (= (type diz@@22) RefType)) (and (state Heap@@22 Mask@@8) (< AssumeFunctionsAbove 3))) (not (= diz@@22 null))) (= (Wand_list_for_list__get_out_1 Heap@@22 diz@@22) (MapType0Select Heap@@22 diz@@22 Wand_list_for_list__out_1)))
 :qid |stdinbpl.1105:15|
 :skolemid |71|
 :pattern ( (state Heap@@22 Mask@@8) (Wand_list_for_list__get_out_1 Heap@@22 diz@@22))
 :pattern ( (state Heap@@22 Mask@@8) (|Wand_list_for_list__get_out_1#triggerStateless| diz@@22) (|Wand_list_for_list__valid_wand#trigger| Heap@@22 (Wand_list_for_list__valid_wand diz@@22)))
)))
(assert (forall ((Heap@@23 T@U) (Mask@@9 T@U) (diz@@23 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@23) (MapType0Type RefType)) (= (type Mask@@9) (MapType1Type RefType realType))) (= (type diz@@23) RefType)) (and (state Heap@@23 Mask@@9) (< AssumeFunctionsAbove 4))) (not (= diz@@23 null))) (= (Wand_list_for_list__get_out_1_0 Heap@@23 diz@@23) (MapType0Select Heap@@23 diz@@23 Wand_list_for_list__out_1_0)))
 :qid |stdinbpl.1353:15|
 :skolemid |77|
 :pattern ( (state Heap@@23 Mask@@9) (Wand_list_for_list__get_out_1_0 Heap@@23 diz@@23))
 :pattern ( (state Heap@@23 Mask@@9) (|Wand_list_for_list__get_out_1_0#triggerStateless| diz@@23) (|Wand_list_for_list__valid_wand#trigger| Heap@@23 (Wand_list_for_list__valid_wand diz@@23)))
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
(assert  (and (forall ((arg0@@56 Real) (arg1@@27 T@U) ) (! (= (type (ConditionalFrame arg0@@56 arg1@@27)) FrameTypeType)
 :qid |funType:ConditionalFrame|
 :pattern ( (ConditionalFrame arg0@@56 arg1@@27))
)) (= (type EmptyFrame) FrameTypeType)))
(assert (forall ((p@@0 Real) (f_6 T@U) ) (!  (=> (= (type f_6) FrameTypeType) (= (ConditionalFrame p@@0 f_6) (ite (> p@@0 0.0) f_6 EmptyFrame)))
 :qid |stdinbpl.166:15|
 :skolemid |19|
 :pattern ( (ConditionalFrame p@@0 f_6))
)))
(assert (forall ((q@min@@0 Int) (q@max@@0 Int) (j@@3 Int) ) (!  (=> (and (<= 0 j@@3) (< j@@3 (- q@max@@0 q@min@@0))) (= (U_2_int (|Seq#Index| (|Seq#Range| q@min@@0 q@max@@0) j@@3)) (+ q@min@@0 j@@3)))
 :qid |stdinbpl.537:15|
 :skolemid |56|
 :pattern ( (|Seq#Index| (|Seq#Range| q@min@@0 q@max@@0) j@@3))
)))
(assert (forall ((Mask@@10 T@U) (o_2@@0 T@U) (f_4@@0 T@U) ) (! (let ((B@@3 (FieldTypeInv1 (type f_4@@0))))
(let ((A@@4 (FieldTypeInv0 (type f_4@@0))))
 (=> (and (and (= (type Mask@@10) (MapType1Type RefType realType)) (= (type o_2@@0) RefType)) (= (type f_4@@0) (FieldType A@@4 B@@3))) (= (HasDirectPerm Mask@@10 o_2@@0 f_4@@0) (> (U_2_real (MapType1Select Mask@@10 o_2@@0 f_4@@0)) NoPerm)))))
 :qid |stdinbpl.133:22|
 :skolemid |17|
 :pattern ( (HasDirectPerm Mask@@10 o_2@@0 f_4@@0))
)))
(assert (forall ((s0@@0 T@U) (s1@@0 T@U) ) (! (let ((T@@16 (SeqTypeInv0 (type s0@@0))))
 (=> (and (and (= (type s0@@0) (SeqType T@@16)) (= (type s1@@0) (SeqType T@@16))) (and (not (= s0@@0 (|Seq#Empty| T@@16))) (not (= s1@@0 (|Seq#Empty| T@@16))))) (= (|Seq#Length| (|Seq#Append| s0@@0 s1@@0)) (+ (|Seq#Length| s0@@0) (|Seq#Length| s1@@0)))))
 :qid |stdinbpl.215:18|
 :skolemid |26|
 :pattern ( (|Seq#Length| (|Seq#Append| s0@@0 s1@@0)))
)))
(assert (forall ((s@@6 T@U) (t T@U) (n@@6 Int) ) (! (let ((T@@17 (SeqTypeInv0 (type s@@6))))
 (=> (and (and (= (type s@@6) (SeqType T@@17)) (= (type t) (SeqType T@@17))) (and (> n@@6 0) (> n@@6 (|Seq#Length| s@@6)))) (and (= (|Seq#Add| (|Seq#Sub| n@@6 (|Seq#Length| s@@6)) (|Seq#Length| s@@6)) n@@6) (= (|Seq#Drop| (|Seq#Append| s@@6 t) n@@6) (|Seq#Drop| t (|Seq#Sub| n@@6 (|Seq#Length| s@@6)))))))
 :qid |stdinbpl.371:18|
 :skolemid |44|
 :pattern ( (|Seq#Drop| (|Seq#Append| s@@6 t) n@@6))
)))
(assert (forall ((Heap@@24 T@U) (Mask@@11 T@U) (diz@@24 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@24) (MapType0Type RefType)) (= (type Mask@@11) (MapType1Type RefType realType))) (= (type diz@@24) RefType)) (and (state Heap@@24 Mask@@11) (< AssumeFunctionsAbove 5))) (not (= diz@@24 null))) (= (List__contents Heap@@24 diz@@24) (ite (= (MapType0Select Heap@@24 diz@@24 List__next) null) (|Seq#Singleton| (MapType0Select Heap@@24 diz@@24 List__val)) (|Seq#Append| (|Seq#Singleton| (MapType0Select Heap@@24 diz@@24 List__val)) (|List__contents'| Heap@@24 (MapType0Select Heap@@24 diz@@24 List__next))))))
 :qid |stdinbpl.1589:15|
 :skolemid |82|
 :pattern ( (state Heap@@24 Mask@@11) (List__contents Heap@@24 diz@@24))
 :pattern ( (state Heap@@24 Mask@@11) (|List__contents#triggerStateless| diz@@24) (|List__state#trigger| Heap@@24 (List__state diz@@24)))
)))
(assert (forall ((o_2@@1 T@U) (f_4@@1 T@U) ) (! (let ((B@@4 (FieldTypeInv1 (type f_4@@1))))
(let ((A@@5 (FieldTypeInv0 (type f_4@@1))))
 (=> (and (= (type o_2@@1) RefType) (= (type f_4@@1) (FieldType A@@5 B@@4))) (= (U_2_real (MapType1Select ZeroMask o_2@@1 f_4@@1)) NoPerm))))
 :qid |stdinbpl.106:22|
 :skolemid |13|
 :pattern ( (MapType1Select ZeroMask o_2@@1 f_4@@1))
)))
(assert (forall ((s@@7 T@U) (t@@0 T@U) (n@@7 Int) ) (! (let ((T@@18 (SeqTypeInv0 (type s@@7))))
 (=> (and (and (= (type s@@7) (SeqType T@@18)) (= (type t@@0) (SeqType T@@18))) (and (> n@@7 0) (> n@@7 (|Seq#Length| s@@7)))) (and (= (|Seq#Add| (|Seq#Sub| n@@7 (|Seq#Length| s@@7)) (|Seq#Length| s@@7)) n@@7) (= (|Seq#Take| (|Seq#Append| s@@7 t@@0) n@@7) (|Seq#Append| s@@7 (|Seq#Take| t@@0 (|Seq#Sub| n@@7 (|Seq#Length| s@@7))))))))
 :qid |stdinbpl.358:18|
 :skolemid |42|
 :pattern ( (|Seq#Take| (|Seq#Append| s@@7 t@@0) n@@7))
)))
(assert (forall ((q@min@@1 Int) (q@max@@1 Int) ) (!  (and (=> (< q@min@@1 q@max@@1) (= (|Seq#Length| (|Seq#Range| q@min@@1 q@max@@1)) (- q@max@@1 q@min@@1))) (=> (<= q@max@@1 q@min@@1) (= (|Seq#Length| (|Seq#Range| q@min@@1 q@max@@1)) 0)))
 :qid |stdinbpl.536:15|
 :skolemid |55|
 :pattern ( (|Seq#Length| (|Seq#Range| q@min@@1 q@max@@1)))
)))
(assert (forall ((Heap@@25 T@U) (Mask@@12 T@U) (diz@@25 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@25) (MapType0Type RefType)) (= (type Mask@@12) (MapType1Type RefType realType))) (= (type diz@@25) RefType)) (and (state Heap@@25 Mask@@12) (or (< AssumeFunctionsAbove 1) (|Wand_list_for_list__get_in_1#trigger| (MapType0Select Heap@@25 null (Wand_list_for_list__valid_wand diz@@25)) diz@@25)))) (not (= diz@@25 null))) (not (= (|Wand_list_for_list__get_in_1'| Heap@@25 diz@@25) null)))
 :qid |stdinbpl.634:15|
 :skolemid |62|
 :pattern ( (state Heap@@25 Mask@@12) (|Wand_list_for_list__get_in_1'| Heap@@25 diz@@25))
)))
(assert (forall ((Heap@@26 T@U) (Mask@@13 T@U) (diz@@26 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@26) (MapType0Type RefType)) (= (type Mask@@13) (MapType1Type RefType realType))) (= (type diz@@26) RefType)) (and (state Heap@@26 Mask@@13) (or (< AssumeFunctionsAbove 3) (|Wand_list_for_list__get_out_1#trigger| (MapType0Select Heap@@26 null (Wand_list_for_list__valid_wand diz@@26)) diz@@26)))) (not (= diz@@26 null))) (not (= (|Wand_list_for_list__get_out_1'| Heap@@26 diz@@26) null)))
 :qid |stdinbpl.1118:15|
 :skolemid |73|
 :pattern ( (state Heap@@26 Mask@@13) (|Wand_list_for_list__get_out_1'| Heap@@26 diz@@26))
)))
(assert (forall ((a T@U) (b T@U) ) (! (let ((T@@19 (SeqTypeInv0 (type a))))
 (=> (and (and (= (type a) (SeqType T@@19)) (= (type b) (SeqType T@@19))) (|Seq#Equal| a b)) (= a b)))
 :qid |stdinbpl.509:18|
 :skolemid |53|
 :pattern ( (|Seq#Equal| a b))
)))
(assert (forall ((s@@8 T@U) (i@@2 Int) ) (! (let ((T@@20 (SeqTypeInv0 (type s@@8))))
 (=> (= (type s@@8) (SeqType T@@20)) (=> (and (<= 0 i@@2) (< i@@2 (|Seq#Length| s@@8))) (|Seq#ContainsTrigger| s@@8 (|Seq#Index| s@@8 i@@2)))))
 :qid |stdinbpl.402:18|
 :skolemid |49|
 :pattern ( (|Seq#Index| s@@8 i@@2))
)))
(assert (forall ((s0@@1 T@U) (s1@@1 T@U) ) (! (let ((T@@21 (SeqTypeInv0 (type s0@@1))))
 (=> (and (= (type s0@@1) (SeqType T@@21)) (= (type s1@@1) (SeqType T@@21))) (and (=> (= s0@@1 (|Seq#Empty| T@@21)) (= (|Seq#Append| s0@@1 s1@@1) s1@@1)) (=> (= s1@@1 (|Seq#Empty| T@@21)) (= (|Seq#Append| s0@@1 s1@@1) s0@@1)))))
 :qid |stdinbpl.221:18|
 :skolemid |27|
 :pattern ( (|Seq#Append| s0@@1 s1@@1))
)))
(assert (forall ((t@@1 T@U) ) (! (= (|Seq#Index| (|Seq#Singleton| t@@1) 0) t@@1)
 :qid |stdinbpl.225:18|
 :skolemid |28|
 :pattern ( (|Seq#Singleton| t@@1))
)))
(assert (forall ((s@@9 T@U) ) (! (let ((T@@22 (SeqTypeInv0 (type s@@9))))
 (=> (= (type s@@9) (SeqType T@@22)) (<= 0 (|Seq#Length| s@@9))))
 :qid |stdinbpl.204:18|
 :skolemid |22|
 :pattern ( (|Seq#Length| s@@9))
)))
(assert (forall ((s0@@2 T@U) (s1@@2 T@U) ) (! (let ((T@@23 (SeqTypeInv0 (type s0@@2))))
 (=> (and (and (= (type s0@@2) (SeqType T@@23)) (= (type s1@@2) (SeqType T@@23))) (|Seq#Equal| s0@@2 s1@@2)) (and (= (|Seq#Length| s0@@2) (|Seq#Length| s1@@2)) (forall ((j@@4 Int) ) (!  (=> (and (<= 0 j@@4) (< j@@4 (|Seq#Length| s0@@2))) (= (|Seq#Index| s0@@2 j@@4) (|Seq#Index| s1@@2 j@@4)))
 :qid |stdinbpl.499:13|
 :skolemid |50|
 :pattern ( (|Seq#Index| s0@@2 j@@4))
 :pattern ( (|Seq#Index| s1@@2 j@@4))
)))))
 :qid |stdinbpl.496:18|
 :skolemid |51|
 :pattern ( (|Seq#Equal| s0@@2 s1@@2))
)))
(assert (forall ((Heap@@27 T@U) (ExhaleHeap@@4 T@U) (Mask@@14 T@U) (pm_f@@1 T@U) ) (! (let ((C@@1 (FieldTypeInv0 (type pm_f@@1))))
 (=> (and (and (and (and (and (= (type Heap@@27) (MapType0Type RefType)) (= (type ExhaleHeap@@4) (MapType0Type RefType))) (= (type Mask@@14) (MapType1Type RefType realType))) (= (type pm_f@@1) (FieldType C@@1 FrameTypeType))) (IdenticalOnKnownLocations Heap@@27 ExhaleHeap@@4 Mask@@14)) (and (HasDirectPerm Mask@@14 null pm_f@@1) (IsPredicateField pm_f@@1))) (forall ((o2 T@U) (f_2@@0 T@U) ) (! (let ((B@@5 (FieldTypeInv1 (type f_2@@0))))
(let ((A@@6 (FieldTypeInv0 (type f_2@@0))))
 (=> (and (and (= (type o2) RefType) (= (type f_2@@0) (FieldType A@@6 B@@5))) (U_2_bool (MapType1Select (MapType0Select Heap@@27 null (PredicateMaskField pm_f@@1)) o2 f_2@@0))) (= (MapType0Select Heap@@27 o2 f_2@@0) (MapType0Select ExhaleHeap@@4 o2 f_2@@0)))))
 :qid |stdinbpl.54:134|
 :skolemid |3|
 :pattern ( (MapType0Select ExhaleHeap@@4 o2 f_2@@0))
))))
 :qid |stdinbpl.52:19|
 :skolemid |4|
 :pattern ( (IdenticalOnKnownLocations Heap@@27 ExhaleHeap@@4 Mask@@14) (IsPredicateField pm_f@@1))
)))
(assert (forall ((Heap@@28 T@U) (ExhaleHeap@@5 T@U) (Mask@@15 T@U) (pm_f@@2 T@U) ) (! (let ((C@@2 (FieldTypeInv0 (type pm_f@@2))))
 (=> (and (and (and (and (and (= (type Heap@@28) (MapType0Type RefType)) (= (type ExhaleHeap@@5) (MapType0Type RefType))) (= (type Mask@@15) (MapType1Type RefType realType))) (= (type pm_f@@2) (FieldType C@@2 FrameTypeType))) (IdenticalOnKnownLocations Heap@@28 ExhaleHeap@@5 Mask@@15)) (and (HasDirectPerm Mask@@15 null pm_f@@2) (IsWandField pm_f@@2))) (forall ((o2@@0 T@U) (f_2@@1 T@U) ) (! (let ((B@@6 (FieldTypeInv1 (type f_2@@1))))
(let ((A@@7 (FieldTypeInv0 (type f_2@@1))))
 (=> (and (and (= (type o2@@0) RefType) (= (type f_2@@1) (FieldType A@@7 B@@6))) (U_2_bool (MapType1Select (MapType0Select Heap@@28 null (WandMaskField pm_f@@2)) o2@@0 f_2@@1))) (= (MapType0Select Heap@@28 o2@@0 f_2@@1) (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1)))))
 :qid |stdinbpl.67:129|
 :skolemid |6|
 :pattern ( (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1))
))))
 :qid |stdinbpl.65:19|
 :skolemid |7|
 :pattern ( (IdenticalOnKnownLocations Heap@@28 ExhaleHeap@@5 Mask@@15) (IsWandField pm_f@@2))
)))
(assert (forall ((diz@@27 T@U) ) (!  (=> (= (type diz@@27) RefType) (= (getPredWandId (Wand_list_for_list__valid_wand diz@@27)) 0))
 :qid |stdinbpl.1843:15|
 :skolemid |92|
 :pattern ( (Wand_list_for_list__valid_wand diz@@27))
)))
(assert (forall ((diz@@28 T@U) ) (!  (=> (= (type diz@@28) RefType) (= (getPredWandId (List__state diz@@28)) 1))
 :qid |stdinbpl.2243:15|
 :skolemid |98|
 :pattern ( (List__state diz@@28))
)))
(assert (forall ((t@@2 T@U) ) (! (= (|Seq#Length| (|Seq#Singleton| t@@2)) 1)
 :qid |stdinbpl.212:18|
 :skolemid |25|
 :pattern ( (|Seq#Singleton| t@@2))
)))
(assert (forall ((Mask@@16 T@U) (o_2@@2 T@U) (f_4@@2 T@U) ) (! (let ((B@@7 (FieldTypeInv1 (type f_4@@2))))
(let ((A@@8 (FieldTypeInv0 (type f_4@@2))))
 (=> (and (and (and (= (type Mask@@16) (MapType1Type RefType realType)) (= (type o_2@@2) RefType)) (= (type f_4@@2) (FieldType A@@8 B@@7))) (GoodMask Mask@@16)) (and (>= (U_2_real (MapType1Select Mask@@16 o_2@@2 f_4@@2)) NoPerm) (=> (and (and (GoodMask Mask@@16) (not (IsPredicateField f_4@@2))) (not (IsWandField f_4@@2))) (<= (U_2_real (MapType1Select Mask@@16 o_2@@2 f_4@@2)) FullPerm))))))
 :qid |stdinbpl.128:22|
 :skolemid |16|
 :pattern ( (GoodMask Mask@@16) (MapType1Select Mask@@16 o_2@@2 f_4@@2))
)))
(assert (forall ((arg0@@57 T@U) (arg1@@28 T@U) ) (! (= (type (|Wand_list_for_list__get_in_1#frame| arg0@@57 arg1@@28)) RefType)
 :qid |funType:Wand_list_for_list__get_in_1#frame|
 :pattern ( (|Wand_list_for_list__get_in_1#frame| arg0@@57 arg1@@28))
)))
(assert (forall ((Heap@@29 T@U) (Mask@@17 T@U) (diz@@29 T@U) ) (!  (=> (and (and (and (= (type Heap@@29) (MapType0Type RefType)) (= (type Mask@@17) (MapType1Type RefType realType))) (= (type diz@@29) RefType)) (state Heap@@29 Mask@@17)) (= (|Wand_list_for_list__get_in_1'| Heap@@29 diz@@29) (|Wand_list_for_list__get_in_1#frame| (MapType0Select Heap@@29 null (Wand_list_for_list__valid_wand diz@@29)) diz@@29)))
 :qid |stdinbpl.628:15|
 :skolemid |61|
 :pattern ( (state Heap@@29 Mask@@17) (|Wand_list_for_list__get_in_1'| Heap@@29 diz@@29))
)))
(assert (forall ((arg0@@58 T@U) (arg1@@29 T@U) ) (! (= (type (|Wand_list_for_list__get_in_1_0#frame| arg0@@58 arg1@@29)) (SeqType intType))
 :qid |funType:Wand_list_for_list__get_in_1_0#frame|
 :pattern ( (|Wand_list_for_list__get_in_1_0#frame| arg0@@58 arg1@@29))
)))
(assert (forall ((Heap@@30 T@U) (Mask@@18 T@U) (diz@@30 T@U) ) (!  (=> (and (and (and (= (type Heap@@30) (MapType0Type RefType)) (= (type Mask@@18) (MapType1Type RefType realType))) (= (type diz@@30) RefType)) (state Heap@@30 Mask@@18)) (= (|Wand_list_for_list__get_in_1_0'| Heap@@30 diz@@30) (|Wand_list_for_list__get_in_1_0#frame| (MapType0Select Heap@@30 null (Wand_list_for_list__valid_wand diz@@30)) diz@@30)))
 :qid |stdinbpl.876:15|
 :skolemid |67|
 :pattern ( (state Heap@@30 Mask@@18) (|Wand_list_for_list__get_in_1_0'| Heap@@30 diz@@30))
)))
(assert (forall ((arg0@@59 T@U) (arg1@@30 T@U) ) (! (= (type (|Wand_list_for_list__get_out_1#frame| arg0@@59 arg1@@30)) RefType)
 :qid |funType:Wand_list_for_list__get_out_1#frame|
 :pattern ( (|Wand_list_for_list__get_out_1#frame| arg0@@59 arg1@@30))
)))
(assert (forall ((Heap@@31 T@U) (Mask@@19 T@U) (diz@@31 T@U) ) (!  (=> (and (and (and (= (type Heap@@31) (MapType0Type RefType)) (= (type Mask@@19) (MapType1Type RefType realType))) (= (type diz@@31) RefType)) (state Heap@@31 Mask@@19)) (= (|Wand_list_for_list__get_out_1'| Heap@@31 diz@@31) (|Wand_list_for_list__get_out_1#frame| (MapType0Select Heap@@31 null (Wand_list_for_list__valid_wand diz@@31)) diz@@31)))
 :qid |stdinbpl.1112:15|
 :skolemid |72|
 :pattern ( (state Heap@@31 Mask@@19) (|Wand_list_for_list__get_out_1'| Heap@@31 diz@@31))
)))
(assert (forall ((arg0@@60 T@U) (arg1@@31 T@U) ) (! (= (type (|Wand_list_for_list__get_out_1_0#frame| arg0@@60 arg1@@31)) (SeqType intType))
 :qid |funType:Wand_list_for_list__get_out_1_0#frame|
 :pattern ( (|Wand_list_for_list__get_out_1_0#frame| arg0@@60 arg1@@31))
)))
(assert (forall ((Heap@@32 T@U) (Mask@@20 T@U) (diz@@32 T@U) ) (!  (=> (and (and (and (= (type Heap@@32) (MapType0Type RefType)) (= (type Mask@@20) (MapType1Type RefType realType))) (= (type diz@@32) RefType)) (state Heap@@32 Mask@@20)) (= (|Wand_list_for_list__get_out_1_0'| Heap@@32 diz@@32) (|Wand_list_for_list__get_out_1_0#frame| (MapType0Select Heap@@32 null (Wand_list_for_list__valid_wand diz@@32)) diz@@32)))
 :qid |stdinbpl.1360:15|
 :skolemid |78|
 :pattern ( (state Heap@@32 Mask@@20) (|Wand_list_for_list__get_out_1_0'| Heap@@32 diz@@32))
)))
(assert (forall ((arg0@@61 T@U) (arg1@@32 T@U) ) (! (= (type (|List__contents#frame| arg0@@61 arg1@@32)) (SeqType intType))
 :qid |funType:List__contents#frame|
 :pattern ( (|List__contents#frame| arg0@@61 arg1@@32))
)))
(assert (forall ((Heap@@33 T@U) (Mask@@21 T@U) (diz@@33 T@U) ) (!  (=> (and (and (and (= (type Heap@@33) (MapType0Type RefType)) (= (type Mask@@21) (MapType1Type RefType realType))) (= (type diz@@33) RefType)) (state Heap@@33 Mask@@21)) (= (|List__contents'| Heap@@33 diz@@33) (|List__contents#frame| (MapType0Select Heap@@33 null (List__state diz@@33)) diz@@33)))
 :qid |stdinbpl.1596:15|
 :skolemid |83|
 :pattern ( (state Heap@@33 Mask@@21) (|List__contents'| Heap@@33 diz@@33))
 :pattern ( (state Heap@@33 Mask@@21) (|List__contents#triggerStateless| diz@@33) (|List__state#trigger| Heap@@33 (List__state diz@@33)))
)))
(assert (forall ((arg0@@62 T@U) (arg1@@33 T@U) ) (! (= (type (|List__get_next#frame| arg0@@62 arg1@@33)) RefType)
 :qid |funType:List__get_next#frame|
 :pattern ( (|List__get_next#frame| arg0@@62 arg1@@33))
)))
(assert (forall ((Heap@@34 T@U) (Mask@@22 T@U) (diz@@34 T@U) ) (!  (=> (and (and (and (= (type Heap@@34) (MapType0Type RefType)) (= (type Mask@@22) (MapType1Type RefType realType))) (= (type diz@@34) RefType)) (state Heap@@34 Mask@@22)) (= (|List__get_next'| Heap@@34 diz@@34) (|List__get_next#frame| (MapType0Select Heap@@34 null (List__state diz@@34)) diz@@34)))
 :qid |stdinbpl.1740:15|
 :skolemid |88|
 :pattern ( (state Heap@@34 Mask@@22) (|List__get_next'| Heap@@34 diz@@34))
)))
(assert (forall ((o T@U) (f T@U) (Heap@@35 T@U) ) (!  (=> (and (and (and (= (type o) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap@@35) (MapType0Type RefType))) (U_2_bool (MapType0Select Heap@@35 o $allocated))) (U_2_bool (MapType0Select Heap@@35 (MapType0Select Heap@@35 o f) $allocated)))
 :qid |stdinbpl.31:15|
 :skolemid |0|
 :pattern ( (MapType0Select Heap@@35 o f))
)))
(assert (forall ((s@@10 T@U) (t@@3 T@U) (n@@8 Int) ) (! (let ((T@@24 (SeqTypeInv0 (type s@@10))))
 (=> (and (and (= (type s@@10) (SeqType T@@24)) (= (type t@@3) (SeqType T@@24))) (and (< 0 n@@8) (<= n@@8 (|Seq#Length| s@@10)))) (= (|Seq#Take| (|Seq#Append| s@@10 t@@3) n@@8) (|Seq#Take| s@@10 n@@8))))
 :qid |stdinbpl.354:18|
 :skolemid |41|
 :pattern ( (|Seq#Take| (|Seq#Append| s@@10 t@@3) n@@8))
)))
(assert (forall ((s@@11 T@U) (i@@3 Int) (v@@1 T@U) ) (! (let ((T@@25 (type v@@1)))
 (=> (= (type s@@11) (SeqType T@@25)) (=> (and (<= 0 i@@3) (< i@@3 (|Seq#Length| s@@11))) (= (|Seq#Length| (|Seq#Update| s@@11 i@@3 v@@1)) (|Seq#Length| s@@11)))))
 :qid |stdinbpl.253:18|
 :skolemid |34|
 :pattern ( (|Seq#Length| (|Seq#Update| s@@11 i@@3 v@@1)))
 :pattern ( (|Seq#Length| s@@11) (|Seq#Update| s@@11 i@@3 v@@1))
)))
(assert (forall ((diz@@35 T@U) ) (!  (=> (= (type diz@@35) RefType) (= (PredicateMaskField (Wand_list_for_list__valid_wand diz@@35)) (|Wand_list_for_list__valid_wand#sm| diz@@35)))
 :qid |stdinbpl.1835:15|
 :skolemid |90|
 :pattern ( (PredicateMaskField (Wand_list_for_list__valid_wand diz@@35)))
)))
(assert (forall ((diz@@36 T@U) ) (!  (=> (= (type diz@@36) RefType) (= (PredicateMaskField (List__state diz@@36)) (|List__state#sm| diz@@36)))
 :qid |stdinbpl.2235:15|
 :skolemid |96|
 :pattern ( (PredicateMaskField (List__state diz@@36)))
)))
(assert (forall ((s@@12 T@U) (t@@4 T@U) (n@@9 Int) ) (! (let ((T@@26 (SeqTypeInv0 (type s@@12))))
 (=> (and (and (= (type s@@12) (SeqType T@@26)) (= (type t@@4) (SeqType T@@26))) (and (< 0 n@@9) (<= n@@9 (|Seq#Length| s@@12)))) (= (|Seq#Drop| (|Seq#Append| s@@12 t@@4) n@@9) (|Seq#Append| (|Seq#Drop| s@@12 n@@9) t@@4))))
 :qid |stdinbpl.367:18|
 :skolemid |43|
 :pattern ( (|Seq#Drop| (|Seq#Append| s@@12 t@@4) n@@9))
)))
(assert (forall ((s@@13 T@U) (n@@10 Int) (i@@4 Int) ) (! (let ((T@@27 (SeqTypeInv0 (type s@@13))))
 (=> (= (type s@@13) (SeqType T@@27)) (=> (and (and (< 0 n@@10) (<= n@@10 i@@4)) (< i@@4 (|Seq#Length| s@@13))) (and (= (|Seq#Add| (|Seq#Sub| i@@4 n@@10) n@@10) i@@4) (= (|Seq#Index| (|Seq#Drop| s@@13 n@@10) (|Seq#Sub| i@@4 n@@10)) (|Seq#Index| s@@13 i@@4))))))
 :qid |stdinbpl.304:18|
 :skolemid |40|
 :pattern ( (|Seq#Drop| s@@13 n@@10) (|Seq#Index| s@@13 i@@4))
)))
(assert (forall ((s0@@3 T@U) (s1@@3 T@U) (n@@11 Int) ) (! (let ((T@@28 (SeqTypeInv0 (type s0@@3))))
 (=> (and (= (type s0@@3) (SeqType T@@28)) (= (type s1@@3) (SeqType T@@28))) (=> (and (and (and (not (= s0@@3 (|Seq#Empty| T@@28))) (not (= s1@@3 (|Seq#Empty| T@@28)))) (<= 0 n@@11)) (< n@@11 (|Seq#Length| s0@@3))) (= (|Seq#Index| (|Seq#Append| s0@@3 s1@@3) n@@11) (|Seq#Index| s0@@3 n@@11)))))
 :qid |stdinbpl.244:18|
 :skolemid |31|
 :pattern ( (|Seq#Index| (|Seq#Append| s0@@3 s1@@3) n@@11))
 :pattern ( (|Seq#Index| s0@@3 n@@11) (|Seq#Append| s0@@3 s1@@3))
)))
(assert (forall ((Heap@@36 T@U) (o@@0 T@U) (f_3 T@U) (v@@2 T@U) ) (! (let ((B@@8 (type v@@2)))
(let ((A@@9 (FieldTypeInv0 (type f_3))))
 (=> (and (and (= (type Heap@@36) (MapType0Type RefType)) (= (type o@@0) RefType)) (= (type f_3) (FieldType A@@9 B@@8))) (succHeap Heap@@36 (MapType0Store Heap@@36 o@@0 f_3 v@@2)))))
 :qid |stdinbpl.78:22|
 :skolemid |9|
 :pattern ( (MapType0Store Heap@@36 o@@0 f_3 v@@2))
)))
(assert (forall ((s0@@4 T@U) (s1@@4 T@U) (m@@7 Int) ) (! (let ((T@@29 (SeqTypeInv0 (type s0@@4))))
 (=> (and (= (type s0@@4) (SeqType T@@29)) (= (type s1@@4) (SeqType T@@29))) (=> (and (and (and (not (= s0@@4 (|Seq#Empty| T@@29))) (not (= s1@@4 (|Seq#Empty| T@@29)))) (<= 0 m@@7)) (< m@@7 (|Seq#Length| s1@@4))) (and (= (|Seq#Sub| (|Seq#Add| m@@7 (|Seq#Length| s0@@4)) (|Seq#Length| s0@@4)) m@@7) (= (|Seq#Index| (|Seq#Append| s0@@4 s1@@4) (|Seq#Add| m@@7 (|Seq#Length| s0@@4))) (|Seq#Index| s1@@4 m@@7))))))
 :qid |stdinbpl.249:18|
 :skolemid |33|
 :pattern ( (|Seq#Index| s1@@4 m@@7) (|Seq#Append| s0@@4 s1@@4))
)))
(assert (= (type ZeroPMask) (MapType1Type RefType boolType)))
(assert (forall ((o_2@@3 T@U) (f_4@@3 T@U) ) (! (let ((B@@9 (FieldTypeInv1 (type f_4@@3))))
(let ((A@@10 (FieldTypeInv0 (type f_4@@3))))
 (=> (and (= (type o_2@@3) RefType) (= (type f_4@@3) (FieldType A@@10 B@@9))) (not (U_2_bool (MapType1Select ZeroPMask o_2@@3 f_4@@3))))))
 :qid |stdinbpl.112:22|
 :skolemid |14|
 :pattern ( (MapType1Select ZeroPMask o_2@@3 f_4@@3))
)))
(assert (forall ((s@@14 T@U) (x@@10 T@U) (i@@5 Int) ) (! (let ((T@@30 (type x@@10)))
 (=> (= (type s@@14) (SeqType T@@30)) (=> (and (and (<= 0 i@@5) (< i@@5 (|Seq#Length| s@@14))) (= (|Seq#Index| s@@14 i@@5) x@@10)) (|Seq#Contains| s@@14 x@@10))))
 :qid |stdinbpl.400:18|
 :skolemid |48|
 :pattern ( (|Seq#Contains| s@@14 x@@10) (|Seq#Index| s@@14 i@@5))
)))
(assert (forall ((s0@@5 T@U) (s1@@5 T@U) ) (! (let ((T@@31 (SeqTypeInv0 (type s0@@5))))
 (=> (and (= (type s0@@5) (SeqType T@@31)) (= (type s1@@5) (SeqType T@@31))) (or (or (and (= s0@@5 s1@@5) (|Seq#Equal| s0@@5 s1@@5)) (and (and (not (= s0@@5 s1@@5)) (not (|Seq#Equal| s0@@5 s1@@5))) (not (= (|Seq#Length| s0@@5) (|Seq#Length| s1@@5))))) (and (and (and (and (and (and (not (= s0@@5 s1@@5)) (not (|Seq#Equal| s0@@5 s1@@5))) (= (|Seq#Length| s0@@5) (|Seq#Length| s1@@5))) (= (|Seq#SkolemDiff| s0@@5 s1@@5) (|Seq#SkolemDiff| s1@@5 s0@@5))) (<= 0 (|Seq#SkolemDiff| s0@@5 s1@@5))) (< (|Seq#SkolemDiff| s0@@5 s1@@5) (|Seq#Length| s0@@5))) (not (= (|Seq#Index| s0@@5 (|Seq#SkolemDiff| s0@@5 s1@@5)) (|Seq#Index| s1@@5 (|Seq#SkolemDiff| s0@@5 s1@@5))))))))
 :qid |stdinbpl.504:18|
 :skolemid |52|
 :pattern ( (|Seq#Equal| s0@@5 s1@@5))
)))
(assert (forall ((p@@1 T@U) (v_1@@0 T@U) (q T@U) (w@@0 T@U) (r T@U) (u T@U) ) (! (let ((C@@3 (FieldTypeInv0 (type r))))
(let ((B@@10 (FieldTypeInv0 (type q))))
(let ((A@@11 (FieldTypeInv0 (type p@@1))))
 (=> (and (and (and (and (and (and (= (type p@@1) (FieldType A@@11 FrameTypeType)) (= (type v_1@@0) FrameTypeType)) (= (type q) (FieldType B@@10 FrameTypeType))) (= (type w@@0) FrameTypeType)) (= (type r) (FieldType C@@3 FrameTypeType))) (= (type u) FrameTypeType)) (and (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))) (InsidePredicate p@@1 v_1@@0 r u)))))
 :qid |stdinbpl.173:25|
 :skolemid |20|
 :pattern ( (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))
)))
(assert (forall ((s@@15 T@U) ) (! (let ((T@@32 (SeqTypeInv0 (type s@@15))))
 (=> (and (= (type s@@15) (SeqType T@@32)) (= (|Seq#Length| s@@15) 0)) (= s@@15 (|Seq#Empty| T@@32))))
 :qid |stdinbpl.208:18|
 :skolemid |24|
 :pattern ( (|Seq#Length| s@@15))
)))
(assert (forall ((s@@16 T@U) (n@@12 Int) ) (! (let ((T@@33 (SeqTypeInv0 (type s@@16))))
 (=> (and (= (type s@@16) (SeqType T@@33)) (<= n@@12 0)) (= (|Seq#Take| s@@16 n@@12) (|Seq#Empty| T@@33))))
 :qid |stdinbpl.383:18|
 :skolemid |46|
 :pattern ( (|Seq#Take| s@@16 n@@12))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun Mask@0 () T@U)
(declare-fun diz@@37 () T@U)
(declare-fun Mask@1 () T@U)
(declare-fun l () T@U)
(declare-fun PostMask@0 () T@U)
(declare-fun PostHeap@0 () T@U)
(declare-fun Mask@6 () T@U)
(declare-fun Heap@1 () T@U)
(declare-fun Mask@16 () T@U)
(declare-fun Mask@15 () T@U)
(declare-fun Heap@10 () T@U)
(declare-fun L1 () T@U)
(declare-fun L2 () T@U)
(declare-fun Heap@8 () T@U)
(declare-fun newPMask@0 () T@U)
(declare-fun Heap@9 () T@U)
(declare-fun Heap@7 () T@U)
(declare-fun Heap@6 () T@U)
(declare-fun Heap@3 () T@U)
(declare-fun Heap@4 () T@U)
(declare-fun Heap@5 () T@U)
(declare-fun freshVersion@0 () T@U)
(declare-fun Mask@14 () T@U)
(declare-fun CombineFrames (T@U T@U) T@U)
(declare-fun FrameFragment (T@U) T@U)
(declare-fun Mask@13 () T@U)
(declare-fun Mask@12 () T@U)
(declare-fun Mask@11 () T@U)
(declare-fun Mask@10 () T@U)
(declare-fun Mask@8 () T@U)
(declare-fun Mask@7 () T@U)
(declare-fun ExhaleHeap@0 () T@U)
(declare-fun Mask@9 () T@U)
(declare-fun arg_diz@0 () T@U)
(declare-fun __flatten_56@0 () T@U)
(declare-fun current_thread_id () Int)
(declare-fun Heap@2 () T@U)
(declare-fun Mask@4 () T@U)
(declare-fun Mask@5 () T@U)
(declare-fun Mask@3 () T@U)
(declare-fun Mask@2 () T@U)
(declare-fun Heap@@37 () T@U)
(declare-fun Heap@0 () T@U)
(declare-fun newVersion@0 () T@U)
(declare-fun __flatten_12 () T@U)
(declare-fun __flatten_55 () T@U)
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (= (type Mask@16) (MapType1Type RefType realType)) (= (type Mask@15) (MapType1Type RefType realType))) (= (type diz@@37) RefType)) (= (type Heap@10) (MapType0Type RefType))) (= (type L1) (SeqType intType))) (= (type L2) (SeqType intType))) (= (type Heap@8) (MapType0Type RefType))) (= (type newPMask@0) (MapType1Type RefType boolType))) (= (type Heap@9) (MapType0Type RefType))) (= (type Heap@7) (MapType0Type RefType))) (= (type Heap@6) (MapType0Type RefType))) (= (type Heap@4) (MapType0Type RefType))) (= (type Heap@3) (MapType0Type RefType))) (= (type Heap@5) (MapType0Type RefType))) (= (type freshVersion@0) FrameTypeType)) (= (type Mask@14) (MapType1Type RefType realType))) (forall ((arg0@@63 T@U) (arg1@@34 T@U) ) (! (= (type (CombineFrames arg0@@63 arg1@@34)) FrameTypeType)
 :qid |funType:CombineFrames|
 :pattern ( (CombineFrames arg0@@63 arg1@@34))
))) (forall ((arg0@@64 T@U) ) (! (= (type (FrameFragment arg0@@64)) FrameTypeType)
 :qid |funType:FrameFragment|
 :pattern ( (FrameFragment arg0@@64))
))) (= (type Mask@12) (MapType1Type RefType realType))) (= (type Mask@13) (MapType1Type RefType realType))) (= (type Mask@11) (MapType1Type RefType realType))) (= (type Mask@10) (MapType1Type RefType realType))) (= (type Heap@1) (MapType0Type RefType))) (= (type Mask@6) (MapType1Type RefType realType))) (= (type Heap@2) (MapType0Type RefType))) (= (type l) RefType)) (= (type Mask@8) (MapType1Type RefType realType))) (= (type Mask@7) (MapType1Type RefType realType))) (= (type ExhaleHeap@0) (MapType0Type RefType))) (= (type Mask@9) (MapType1Type RefType realType))) (= (type arg_diz@0) RefType)) (= (type __flatten_56@0) (SeqType intType))) (= (type Mask@5) (MapType1Type RefType realType))) (= (type Mask@4) (MapType1Type RefType realType))) (= (type Mask@3) (MapType1Type RefType realType))) (= (type Mask@2) (MapType1Type RefType realType))) (= (type Heap@0) (MapType0Type RefType))) (= (type Heap@@37) (MapType0Type RefType))) (= (type newVersion@0) FrameTypeType)) (= (type Mask@1) (MapType1Type RefType realType))) (= (type __flatten_12) RefType)) (= (type __flatten_55) RefType)) (= (type PostMask@0) (MapType1Type RefType realType))) (= (type PostHeap@0) (MapType0Type RefType))) (= (type Mask@0) (MapType1Type RefType realType))))
(set-info :boogie-vc-id List__append_rec)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 88) (let ((anon3_correct true))
(let ((anon47_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 84) 81)) anon3_correct)))
(let ((anon47_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 82) (- 0 83)) (<= FullPerm (U_2_real (MapType1Select Mask@0 null (List__state diz@@37))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@0 null (List__state diz@@37)))) (=> (= (ControlFlow 0 82) 81) anon3_correct))))))
(let ((anon46_Then_correct  (and (=> (= (ControlFlow 0 85) (- 0 86)) (not (= diz@@37 null))) (=> (not (= diz@@37 null)) (and (=> (= (ControlFlow 0 85) 82) anon47_Then_correct) (=> (= (ControlFlow 0 85) 84) anon47_Else_correct))))))
(let ((anon7_correct true))
(let ((anon49_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 77) 74)) anon7_correct)))
(let ((anon49_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 75) (- 0 76)) (<= FullPerm (U_2_real (MapType1Select Mask@1 null (List__state l))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@1 null (List__state l)))) (=> (= (ControlFlow 0 75) 74) anon7_correct))))))
(let ((anon48_Then_correct  (and (=> (= (ControlFlow 0 78) (- 0 79)) (not (= l null))) (=> (not (= l null)) (and (=> (= (ControlFlow 0 78) 75) anon49_Then_correct) (=> (= (ControlFlow 0 78) 77) anon49_Else_correct))))))
(let ((anon12_correct true))
(let ((anon52_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 69) 66)) anon12_correct)))
(let ((anon52_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 67) (- 0 68)) (<= FullPerm (U_2_real (MapType1Select PostMask@0 null (List__state diz@@37))))) (=> (<= FullPerm (U_2_real (MapType1Select PostMask@0 null (List__state diz@@37)))) (=> (= (ControlFlow 0 67) 66) anon12_correct))))))
(let ((anon51_Then_correct  (and (=> (= (ControlFlow 0 70) (- 0 71)) (not (= diz@@37 null))) (=> (not (= diz@@37 null)) (and (=> (= (ControlFlow 0 70) 67) anon52_Then_correct) (=> (= (ControlFlow 0 70) 69) anon52_Else_correct))))))
(let ((anon51_Else_correct true))
(let ((anon50_Then_correct  (=> (state PostHeap@0 ZeroMask) (=> (and (and (= PostMask@0 (MapType1Store ZeroMask null (List__state diz@@37) (real_2_U (+ (U_2_real (MapType1Select ZeroMask null (List__state diz@@37))) FullPerm)))) (state PostHeap@0 PostMask@0)) (and (state PostHeap@0 PostMask@0) (state PostHeap@0 PostMask@0))) (and (=> (= (ControlFlow 0 72) 70) anon51_Then_correct) (=> (= (ControlFlow 0 72) 65) anon51_Else_correct))))))
(let ((anon25_correct true))
(let ((anon58_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 48) 45)) anon25_correct)))
(let ((anon58_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 46) (- 0 47)) (<= FullPerm (U_2_real (MapType1Select Mask@6 null (List__state (MapType0Select Heap@1 diz@@37 List__next)))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@6 null (List__state (MapType0Select Heap@1 diz@@37 List__next))))) (=> (= (ControlFlow 0 46) 45) anon25_correct))))))
(let ((anon57_Then_correct  (and (=> (= (ControlFlow 0 49) (- 0 50)) (not (= (MapType0Select Heap@1 diz@@37 List__next) null))) (=> (not (= (MapType0Select Heap@1 diz@@37 List__next) null)) (and (=> (= (ControlFlow 0 49) 46) anon58_Then_correct) (=> (= (ControlFlow 0 49) 48) anon58_Else_correct))))))
(let ((anon45_correct  (=> (and (= Mask@16 (MapType1Store Mask@15 null (List__state diz@@37) (real_2_U (- (U_2_real (MapType1Select Mask@15 null (List__state diz@@37))) FullPerm)))) (= (ControlFlow 0 2) (- 0 1))) (|Seq#Equal| (List__contents Heap@10 diz@@37) (|Seq#Append| L1 L2)))))
(let ((anon67_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 5) 2)) anon45_correct)))
(let ((anon67_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 3) (- 0 4)) (<= FullPerm (U_2_real (MapType1Select Mask@15 null (List__state diz@@37))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@15 null (List__state diz@@37)))) (=> (= (ControlFlow 0 3) 2) anon45_correct))))))
(let ((anon43_correct  (=> (and (state Heap@10 Mask@15) (state Heap@10 Mask@15)) (and (=> (= (ControlFlow 0 6) 3) anon67_Then_correct) (=> (= (ControlFlow 0 6) 5) anon67_Else_correct)))))
(let ((anon66_Else_correct  (=> (= (MapType0Select Heap@8 diz@@37 List__next) null) (=> (and (= Heap@10 Heap@8) (= (ControlFlow 0 8) 6)) anon43_correct))))
(let ((anon66_Then_correct  (=> (not (= (MapType0Select Heap@8 diz@@37 List__next) null)) (=> (and (and (forall ((o_11 T@U) (f_15 T@U) ) (! (let ((B@@11 (FieldTypeInv1 (type f_15))))
(let ((A@@12 (FieldTypeInv0 (type f_15))))
 (=> (and (and (= (type o_11) RefType) (= (type f_15) (FieldType A@@12 B@@11))) (or (U_2_bool (MapType1Select (MapType0Select Heap@8 null (|List__state#sm| diz@@37)) o_11 f_15)) (U_2_bool (MapType1Select (MapType0Select Heap@8 null (|List__state#sm| (MapType0Select Heap@8 diz@@37 List__next))) o_11 f_15)))) (U_2_bool (MapType1Select newPMask@0 o_11 f_15)))))
 :qid |stdinbpl.4353:29|
 :skolemid |104|
 :pattern ( (MapType1Select newPMask@0 o_11 f_15))
)) (= Heap@9 (MapType0Store Heap@8 null (|List__state#sm| diz@@37) newPMask@0))) (and (= Heap@10 Heap@9) (= (ControlFlow 0 7) 6))) anon43_correct))))
(let ((anon41_correct  (=> (and (= Heap@7 (MapType0Store Heap@6 null (|List__state#sm| diz@@37) (MapType1Store (MapType0Select Heap@6 null (|List__state#sm| diz@@37)) diz@@37 List__val (bool_2_U true)))) (= Heap@8 (MapType0Store Heap@7 null (|List__state#sm| diz@@37) (MapType1Store (MapType0Select Heap@7 null (|List__state#sm| diz@@37)) diz@@37 List__next (bool_2_U true))))) (and (=> (= (ControlFlow 0 9) 7) anon66_Then_correct) (=> (= (ControlFlow 0 9) 8) anon66_Else_correct)))))
(let ((anon65_Else_correct  (=> (HasDirectPerm Mask@15 null (List__state diz@@37)) (=> (and (= Heap@6 Heap@3) (= (ControlFlow 0 11) 9)) anon41_correct))))
(let ((anon65_Then_correct  (=> (not (HasDirectPerm Mask@15 null (List__state diz@@37))) (=> (and (and (= Heap@4 (MapType0Store Heap@3 null (|List__state#sm| diz@@37) ZeroPMask)) (= Heap@5 (MapType0Store Heap@4 null (List__state diz@@37) freshVersion@0))) (and (= Heap@6 Heap@5) (= (ControlFlow 0 10) 9))) anon41_correct))))
(let ((anon39_correct  (=> (= Mask@15 (MapType1Store Mask@14 null (List__state diz@@37) (real_2_U (+ (U_2_real (MapType1Select Mask@14 null (List__state diz@@37))) FullPerm)))) (=> (and (and (state Heap@3 Mask@15) (state Heap@3 Mask@15)) (and (|List__state#trigger| Heap@3 (List__state diz@@37)) (= (MapType0Select Heap@3 null (List__state diz@@37)) (CombineFrames (FrameFragment (MapType0Select Heap@3 diz@@37 List__val)) (CombineFrames (FrameFragment (MapType0Select Heap@3 diz@@37 List__next)) (FrameFragment (ite (not (= (MapType0Select Heap@3 diz@@37 List__next) null)) (MapType0Select Heap@3 null (List__state (MapType0Select Heap@3 diz@@37 List__next))) EmptyFrame))))))) (and (=> (= (ControlFlow 0 12) 10) anon65_Then_correct) (=> (= (ControlFlow 0 12) 11) anon65_Else_correct))))))
(let ((anon38_correct  (=> (and (and (= Mask@13 (MapType1Store Mask@12 null (List__state (MapType0Select Heap@3 diz@@37 List__next)) (real_2_U (- (U_2_real (MapType1Select Mask@12 null (List__state (MapType0Select Heap@3 diz@@37 List__next)))) FullPerm)))) (InsidePredicate (List__state diz@@37) (MapType0Select Heap@3 null (List__state diz@@37)) (List__state (MapType0Select Heap@3 diz@@37 List__next)) (MapType0Select Heap@3 null (List__state (MapType0Select Heap@3 diz@@37 List__next))))) (and (= Mask@14 Mask@13) (= (ControlFlow 0 14) 12))) anon39_correct)))
(let ((anon64_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 17) 14)) anon38_correct)))
(let ((anon64_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 15) (- 0 16)) (<= FullPerm (U_2_real (MapType1Select Mask@12 null (List__state (MapType0Select Heap@3 diz@@37 List__next)))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@12 null (List__state (MapType0Select Heap@3 diz@@37 List__next))))) (=> (= (ControlFlow 0 15) 14) anon38_correct))))))
(let ((anon63_Then_correct  (=> (not (= (MapType0Select Heap@3 diz@@37 List__next) null)) (and (=> (= (ControlFlow 0 18) 15) anon64_Then_correct) (=> (= (ControlFlow 0 18) 17) anon64_Else_correct)))))
(let ((anon63_Else_correct  (=> (= (MapType0Select Heap@3 diz@@37 List__next) null) (=> (and (= Mask@14 Mask@12) (= (ControlFlow 0 13) 12)) anon39_correct))))
(let ((anon35_correct  (=> (= Mask@12 (MapType1Store Mask@11 diz@@37 List__next (real_2_U (- (U_2_real (MapType1Select Mask@11 diz@@37 List__next)) FullPerm)))) (and (=> (= (ControlFlow 0 19) 18) anon63_Then_correct) (=> (= (ControlFlow 0 19) 13) anon63_Else_correct)))))
(let ((anon62_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 22) 19)) anon35_correct)))
(let ((anon62_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 20) (- 0 21)) (<= FullPerm (U_2_real (MapType1Select Mask@11 diz@@37 List__next)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@11 diz@@37 List__next))) (=> (= (ControlFlow 0 20) 19) anon35_correct))))))
(let ((anon33_correct  (=> (= Mask@11 (MapType1Store Mask@10 diz@@37 List__val (real_2_U (- (U_2_real (MapType1Select Mask@10 diz@@37 List__val)) FullPerm)))) (and (=> (= (ControlFlow 0 23) 20) anon62_Then_correct) (=> (= (ControlFlow 0 23) 22) anon62_Else_correct)))))
(let ((anon61_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 26) 23)) anon33_correct)))
(let ((anon61_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 24) (- 0 25)) (<= FullPerm (U_2_real (MapType1Select Mask@10 diz@@37 List__val)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@10 diz@@37 List__val))) (=> (= (ControlFlow 0 24) 23) anon33_correct))))))
(let ((anon31_correct  (=> (state Heap@3 Mask@10) (and (=> (= (ControlFlow 0 27) 24) anon61_Then_correct) (=> (= (ControlFlow 0 27) 26) anon61_Else_correct)))))
(let ((anon30_correct  (=> (= Mask@8 (MapType1Store Mask@7 null (List__state l) (real_2_U (- (U_2_real (MapType1Select Mask@7 null (List__state l))) FullPerm)))) (and (=> (= (ControlFlow 0 30) (- 0 31)) (|Seq#Equal| (List__contents Heap@1 l) L2)) (=> (|Seq#Equal| (List__contents Heap@1 l) L2) (=> (and (IdenticalOnKnownLocations Heap@1 ExhaleHeap@0 Mask@8) (= Mask@9 (MapType1Store Mask@8 null (List__state arg_diz@0) (real_2_U (+ (U_2_real (MapType1Select Mask@8 null (List__state arg_diz@0))) FullPerm))))) (=> (and (and (and (state ExhaleHeap@0 Mask@9) (state ExhaleHeap@0 Mask@9)) (and (|Seq#Equal| (List__contents ExhaleHeap@0 arg_diz@0) (|Seq#Append| __flatten_56@0 L2)) (state ExhaleHeap@0 Mask@9))) (and (and (state ExhaleHeap@0 Mask@9) (= Mask@10 Mask@9)) (and (= Heap@3 ExhaleHeap@0) (= (ControlFlow 0 30) 27)))) anon31_correct)))))))
(let ((anon60_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 34) 30)) anon30_correct)))
(let ((anon60_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 32) (- 0 33)) (<= FullPerm (U_2_real (MapType1Select Mask@7 null (List__state l))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@7 null (List__state l)))) (=> (= (ControlFlow 0 32) 30) anon30_correct))))))
(let ((anon28_correct  (=> (= Mask@7 (MapType1Store Mask@6 null (List__state arg_diz@0) (real_2_U (- (U_2_real (MapType1Select Mask@6 null (List__state arg_diz@0))) FullPerm)))) (and (=> (= (ControlFlow 0 35) (- 0 37)) (|Seq#Equal| (List__contents Heap@1 arg_diz@0) __flatten_56@0)) (=> (|Seq#Equal| (List__contents Heap@1 arg_diz@0) __flatten_56@0) (and (=> (= (ControlFlow 0 35) (- 0 36)) (not (= l null))) (=> (not (= l null)) (and (=> (= (ControlFlow 0 35) 32) anon60_Then_correct) (=> (= (ControlFlow 0 35) 34) anon60_Else_correct)))))))))
(let ((anon59_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 40) 35)) anon28_correct)))
(let ((anon59_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 38) (- 0 39)) (<= FullPerm (U_2_real (MapType1Select Mask@6 null (List__state arg_diz@0))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@6 null (List__state arg_diz@0)))) (=> (= (ControlFlow 0 38) 35) anon28_correct))))))
(let ((anon57_Else_correct  (=> (and (= __flatten_56@0 (List__contents Heap@1 (MapType0Select Heap@1 diz@@37 List__next))) (state Heap@1 Mask@6)) (and (=> (= (ControlFlow 0 41) (- 0 44)) (HasDirectPerm Mask@6 diz@@37 List__next)) (=> (HasDirectPerm Mask@6 diz@@37 List__next) (=> (= arg_diz@0 (MapType0Select Heap@1 diz@@37 List__next)) (and (=> (= (ControlFlow 0 41) (- 0 43)) (not (= arg_diz@0 null))) (=> (not (= arg_diz@0 null)) (and (=> (= (ControlFlow 0 41) (- 0 42)) (>= current_thread_id 0)) (=> (>= current_thread_id 0) (and (=> (= (ControlFlow 0 41) 38) anon59_Then_correct) (=> (= (ControlFlow 0 41) 40) anon59_Else_correct))))))))))))
(let ((anon56_Else_correct  (=> (not (= (MapType0Select Heap@1 diz@@37 List__next) null)) (and (=> (= (ControlFlow 0 51) (- 0 52)) (HasDirectPerm Mask@6 diz@@37 List__next)) (=> (HasDirectPerm Mask@6 diz@@37 List__next) (and (=> (= (ControlFlow 0 51) 49) anon57_Then_correct) (=> (= (ControlFlow 0 51) 41) anon57_Else_correct)))))))
(let ((anon56_Then_correct  (=> (= (MapType0Select Heap@1 diz@@37 List__next) null) (=> (and (state Heap@1 Mask@6) (state Heap@1 Mask@6)) (and (=> (= (ControlFlow 0 28) (- 0 29)) (= FullPerm (U_2_real (MapType1Select Mask@6 diz@@37 List__next)))) (=> (= FullPerm (U_2_real (MapType1Select Mask@6 diz@@37 List__next))) (=> (= Heap@2 (MapType0Store Heap@1 diz@@37 List__next l)) (=> (and (and (state Heap@2 Mask@6) (= Mask@10 Mask@6)) (and (= Heap@3 Heap@2) (= (ControlFlow 0 28) 27))) anon31_correct))))))))
(let ((anon20_correct  (=> (and (state Heap@1 Mask@6) (state Heap@1 Mask@6)) (and (=> (= (ControlFlow 0 53) (- 0 54)) (HasDirectPerm Mask@6 diz@@37 List__next)) (=> (HasDirectPerm Mask@6 diz@@37 List__next) (and (=> (= (ControlFlow 0 53) 28) anon56_Then_correct) (=> (= (ControlFlow 0 53) 51) anon56_Else_correct)))))))
(let ((anon55_Else_correct  (=> (= (MapType0Select Heap@1 diz@@37 List__next) null) (=> (and (= Mask@6 Mask@4) (= (ControlFlow 0 56) 53)) anon20_correct))))
(let ((anon55_Then_correct  (=> (and (not (= (MapType0Select Heap@1 diz@@37 List__next) null)) (= Mask@5 (MapType1Store Mask@4 null (List__state (MapType0Select Heap@1 diz@@37 List__next)) (real_2_U (+ (U_2_real (MapType1Select Mask@4 null (List__state (MapType0Select Heap@1 diz@@37 List__next)))) FullPerm))))) (=> (and (and (InsidePredicate (List__state diz@@37) (MapType0Select Heap@1 null (List__state diz@@37)) (List__state (MapType0Select Heap@1 diz@@37 List__next)) (MapType0Select Heap@1 null (List__state (MapType0Select Heap@1 diz@@37 List__next)))) (state Heap@1 Mask@5)) (and (= Mask@6 Mask@5) (= (ControlFlow 0 55) 53))) anon20_correct))))
(let ((anon18_correct  (=> (and (not (= diz@@37 null)) (= Mask@3 (MapType1Store Mask@2 diz@@37 List__val (real_2_U (+ (U_2_real (MapType1Select Mask@2 diz@@37 List__val)) FullPerm))))) (=> (and (and (state Heap@1 Mask@3) (not (= diz@@37 null))) (and (= Mask@4 (MapType1Store Mask@3 diz@@37 List__next (real_2_U (+ (U_2_real (MapType1Select Mask@3 diz@@37 List__next)) FullPerm)))) (state Heap@1 Mask@4))) (and (=> (= (ControlFlow 0 57) 55) anon55_Then_correct) (=> (= (ControlFlow 0 57) 56) anon55_Else_correct))))))
(let ((anon54_Else_correct  (=> (HasDirectPerm Mask@2 null (List__state diz@@37)) (=> (and (= Heap@1 Heap@@37) (= (ControlFlow 0 59) 57)) anon18_correct))))
(let ((anon54_Then_correct  (=> (and (and (not (HasDirectPerm Mask@2 null (List__state diz@@37))) (= Heap@0 (MapType0Store Heap@@37 null (List__state diz@@37) newVersion@0))) (and (= Heap@1 Heap@0) (= (ControlFlow 0 58) 57))) anon18_correct)))
(let ((anon16_correct  (=> (= Mask@2 (MapType1Store Mask@1 null (List__state diz@@37) (real_2_U (- (U_2_real (MapType1Select Mask@1 null (List__state diz@@37))) FullPerm)))) (and (=> (= (ControlFlow 0 60) 58) anon54_Then_correct) (=> (= (ControlFlow 0 60) 59) anon54_Else_correct)))))
(let ((anon53_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 63) 60)) anon16_correct)))
(let ((anon53_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 61) (- 0 62)) (<= FullPerm (U_2_real (MapType1Select Mask@1 null (List__state diz@@37))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@1 null (List__state diz@@37)))) (=> (= (ControlFlow 0 61) 60) anon16_correct))))))
(let ((anon50_Else_correct  (=> (and (and (U_2_bool (MapType0Select Heap@@37 __flatten_12 $allocated)) (U_2_bool (MapType0Select Heap@@37 __flatten_55 $allocated))) (and (|List__state#trigger| Heap@@37 (List__state diz@@37)) (= (MapType0Select Heap@@37 null (List__state diz@@37)) (CombineFrames (FrameFragment (MapType0Select Heap@@37 diz@@37 List__val)) (CombineFrames (FrameFragment (MapType0Select Heap@@37 diz@@37 List__next)) (FrameFragment (ite (not (= (MapType0Select Heap@@37 diz@@37 List__next) null)) (MapType0Select Heap@@37 null (List__state (MapType0Select Heap@@37 diz@@37 List__next))) EmptyFrame))))))) (and (=> (= (ControlFlow 0 64) 61) anon53_Then_correct) (=> (= (ControlFlow 0 64) 63) anon53_Else_correct)))))
(let ((anon48_Else_correct  (=> (and (|Seq#Equal| (List__contents Heap@@37 l) L2) (state Heap@@37 Mask@1)) (and (=> (= (ControlFlow 0 73) 72) anon50_Then_correct) (=> (= (ControlFlow 0 73) 64) anon50_Else_correct)))))
(let ((anon46_Else_correct  (=> (and (and (and (|Seq#Equal| (List__contents Heap@@37 diz@@37) L1) (state Heap@@37 Mask@0)) (and (not (= l null)) (state Heap@@37 Mask@0))) (and (and (= Mask@1 (MapType1Store Mask@0 null (List__state l) (real_2_U (+ (U_2_real (MapType1Select Mask@0 null (List__state l))) FullPerm)))) (state Heap@@37 Mask@1)) (and (state Heap@@37 Mask@1) (state Heap@@37 Mask@1)))) (and (=> (= (ControlFlow 0 80) 78) anon48_Then_correct) (=> (= (ControlFlow 0 80) 73) anon48_Else_correct)))))
(let ((anon0_correct  (=> (and (and (state Heap@@37 ZeroMask) (= AssumeFunctionsAbove (- 0 1))) (and (U_2_bool (MapType0Select Heap@@37 diz@@37 $allocated)) (U_2_bool (MapType0Select Heap@@37 l $allocated)))) (=> (and (and (and (not (= diz@@37 null)) (state Heap@@37 ZeroMask)) (and (>= current_thread_id 0) (state Heap@@37 ZeroMask))) (and (and (= Mask@0 (MapType1Store ZeroMask null (List__state diz@@37) (real_2_U (+ (U_2_real (MapType1Select ZeroMask null (List__state diz@@37))) FullPerm)))) (state Heap@@37 Mask@0)) (and (state Heap@@37 Mask@0) (state Heap@@37 Mask@0)))) (and (=> (= (ControlFlow 0 87) 85) anon46_Then_correct) (=> (= (ControlFlow 0 87) 80) anon46_Else_correct))))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 88) 87) anon0_correct)))
PreconditionGeneratedEntry_correct))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
))
(check-sat)
(pop 1)
; Valid
(get-info :rlimit)
