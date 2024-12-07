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
(declare-fun Wand_state_contains_for_state_contains__lemma () T@U)
(declare-fun Wand_state_contains_for_state_contains__in_1 () T@U)
(declare-fun Wand_state_contains_for_state_contains__in_1_0 () T@U)
(declare-fun Wand_state_contains_for_state_contains__out_1 () T@U)
(declare-fun Wand_state_contains_for_state_contains__out_1_0 () T@U)
(declare-fun Wand_state_contains_for_state_contains__this_1 () T@U)
(declare-fun Wand_state_contains_for_state_contains__target_contents_1 () T@U)
(declare-fun Wand_state_contains_for_state_contains__prev_contents_1 () T@U)
(declare-fun Wand_state_contains_for_state_contains__prev_1 () T@U)
(declare-fun Wand_state_contains_for_state_contains__cur_contents_1 () T@U)
(declare-fun Wand_state_contains_for_state_contains__top_1 () T@U)
(declare-fun Wand_state_contains_for_state_contains__cur_1 () T@U)
(declare-fun Wand_state_contains_for_state_contains__wand_1 () T@U)
(declare-fun Wand_state_contains_for_state_contains__this_2 () T@U)
(declare-fun Wand_state_contains_for_state_contains__target_contents_2 () T@U)
(declare-fun Wand_state_contains_for_state_contains__top_2 () T@U)
(declare-fun Tree__data () T@U)
(declare-fun Tree__left () T@U)
(declare-fun Tree__right () T@U)
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
(declare-fun Tree__tolist (T@U T@U) T@U)
(declare-fun |Tree__tolist#triggerStateless| (T@U) T@U)
(declare-fun |Tree__state#trigger| (T@U T@U) Bool)
(declare-fun Tree__state (T@U) T@U)
(declare-fun AssumeFunctionsAbove () Int)
(declare-fun null () T@U)
(declare-fun |Seq#Empty| (T@T) T@U)
(declare-fun |Seq#Append| (T@U T@U) T@U)
(declare-fun |Tree__tolist'| (T@U T@U) T@U)
(declare-fun |Seq#Singleton| (T@U) T@U)
(declare-fun PredicateType_Tree__stateType () T@T)
(declare-fun FrameTypeType () T@T)
(declare-fun |Seq#Index| (T@U Int) T@U)
(declare-fun |Seq#Sub| (Int Int) Int)
(declare-fun |Seq#Add| (Int Int) Int)
(declare-fun IdenticalOnKnownLocations (T@U T@U T@U) Bool)
(declare-fun IsPredicateField (T@U) Bool)
(declare-fun PredicateMaskField (T@U) T@U)
(declare-fun HasDirectPerm (T@U T@U T@U) Bool)
(declare-fun IsWandField (T@U) Bool)
(declare-fun WandMaskField (T@U) T@U)
(declare-fun Wand_state_contains_for_state_contains__valid_wand (T@U) T@U)
(declare-fun PredicateType_Wand_state_contains_for_state_contains__valid_wandType () T@T)
(declare-fun |Wand_state_contains_for_state_contains__get_in_1'| (T@U T@U) T@U)
(declare-fun dummyFunction (T@U) Bool)
(declare-fun |Wand_state_contains_for_state_contains__get_in_1#triggerStateless| (T@U) T@U)
(declare-fun |Wand_state_contains_for_state_contains__get_in_1_0'| (T@U T@U) T@U)
(declare-fun |Wand_state_contains_for_state_contains__get_in_1_0#triggerStateless| (T@U) T@U)
(declare-fun |Wand_state_contains_for_state_contains__get_out_1'| (T@U T@U) T@U)
(declare-fun |Wand_state_contains_for_state_contains__get_out_1#triggerStateless| (T@U) T@U)
(declare-fun |Wand_state_contains_for_state_contains__get_out_1_0'| (T@U T@U) T@U)
(declare-fun |Wand_state_contains_for_state_contains__get_out_1_0#triggerStateless| (T@U) T@U)
(declare-fun |Tree__sorted_list'| (T@U T@U) Bool)
(declare-fun |Tree__sorted_list#triggerStateless| (T@U) Bool)
(declare-fun |Tree__sorted'| (T@U T@U) Bool)
(declare-fun |Tree__sorted#triggerStateless| (T@U) Bool)
(declare-fun |Wand_state_contains_for_state_contains__valid_wand#trigger| (T@U T@U) Bool)
(declare-fun |Wand_state_contains_for_state_contains__valid_wand#everUsed| (T@U) Bool)
(declare-fun |Tree__state#everUsed| (T@U) Bool)
(declare-fun |Seq#Update| (T@U Int T@U) T@U)
(declare-fun |Seq#Take| (T@U Int) T@U)
(declare-fun |Seq#Contains| (T@U T@U) Bool)
(declare-fun |Seq#Range| (Int Int) T@U)
(declare-fun |Seq#Skolem| (T@U T@U) Int)
(declare-fun Wand_state_contains_for_state_contains__get_in_1 (T@U T@U) T@U)
(declare-fun Wand_state_contains_for_state_contains__get_in_1_0 (T@U T@U) T@U)
(declare-fun Wand_state_contains_for_state_contains__get_out_1 (T@U T@U) T@U)
(declare-fun Wand_state_contains_for_state_contains__get_out_1_0 (T@U T@U) T@U)
(declare-fun |Wand_state_contains_for_state_contains__valid_wand#sm| (T@U) T@U)
(declare-fun |Tree__state#sm| (T@U) T@U)
(declare-fun dummyHeap () T@U)
(declare-fun ZeroMask () T@U)
(declare-fun InsidePredicate (T@U T@U T@U T@U) Bool)
(declare-fun |Tree__sorted#frame| (T@U T@U) Bool)
(declare-fun FrameFragment (T@U) T@U)
(declare-fun EmptyFrame () T@U)
(declare-fun sumMask (T@U T@U T@U) Bool)
(declare-fun ConditionalFrame (Real T@U) T@U)
(declare-fun |Tree__tolist#frame| (T@U T@U) T@U)
(declare-fun NoPerm () Real)
(declare-fun |Wand_state_contains_for_state_contains__get_in_1#trigger| (T@U T@U) Bool)
(declare-fun |Wand_state_contains_for_state_contains__get_out_1#trigger| (T@U T@U) Bool)
(declare-fun |Seq#Equal| (T@U T@U) Bool)
(declare-fun |Tree__sorted_list#frame| (T@U T@U) Bool)
(declare-fun |Seq#ContainsTrigger| (T@U T@U) Bool)
(declare-fun Tree__sorted_list (T@U T@U) Bool)
(declare-fun Tree__sorted (T@U T@U) Bool)
(declare-fun getPredWandId (T@U) Int)
(declare-fun FullPerm () Real)
(declare-fun |Wand_state_contains_for_state_contains__get_in_1#frame| (T@U T@U) T@U)
(declare-fun |Wand_state_contains_for_state_contains__get_in_1_0#frame| (T@U T@U) T@U)
(declare-fun |Wand_state_contains_for_state_contains__get_out_1#frame| (T@U T@U) T@U)
(declare-fun |Wand_state_contains_for_state_contains__get_out_1_0#frame| (T@U T@U) T@U)
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
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (forall ((arg0@@11 T@T) (arg1 T@T) ) (! (= (Ctor (FieldType arg0@@11 arg1)) 6)
 :qid |ctor:FieldType|
)) (forall ((arg0@@12 T@T) (arg1@@0 T@T) ) (! (= (FieldTypeInv0 (FieldType arg0@@12 arg1@@0)) arg0@@12)
 :qid |typeInv:FieldTypeInv0|
 :pattern ( (FieldType arg0@@12 arg1@@0))
))) (forall ((arg0@@13 T@T) (arg1@@1 T@T) ) (! (= (FieldTypeInv1 (FieldType arg0@@13 arg1@@1)) arg1@@1)
 :qid |typeInv:FieldTypeInv1|
 :pattern ( (FieldType arg0@@13 arg1@@1))
))) (= (Ctor NormalFieldType) 7)) (= (type $allocated) (FieldType NormalFieldType boolType))) (= (type Wand_state_contains_for_state_contains__lemma) (FieldType NormalFieldType intType))) (= (Ctor RefType) 8)) (= (type Wand_state_contains_for_state_contains__in_1) (FieldType NormalFieldType RefType))) (forall ((arg0@@14 T@T) ) (! (= (Ctor (SeqType arg0@@14)) 9)
 :qid |ctor:SeqType|
))) (forall ((arg0@@15 T@T) ) (! (= (SeqTypeInv0 (SeqType arg0@@15)) arg0@@15)
 :qid |typeInv:SeqTypeInv0|
 :pattern ( (SeqType arg0@@15))
))) (= (type Wand_state_contains_for_state_contains__in_1_0) (FieldType NormalFieldType (SeqType intType)))) (= (type Wand_state_contains_for_state_contains__out_1) (FieldType NormalFieldType RefType))) (= (type Wand_state_contains_for_state_contains__out_1_0) (FieldType NormalFieldType (SeqType intType)))) (= (type Wand_state_contains_for_state_contains__this_1) (FieldType NormalFieldType RefType))) (= (type Wand_state_contains_for_state_contains__target_contents_1) (FieldType NormalFieldType (SeqType intType)))) (= (type Wand_state_contains_for_state_contains__prev_contents_1) (FieldType NormalFieldType (SeqType intType)))) (= (type Wand_state_contains_for_state_contains__prev_1) (FieldType NormalFieldType RefType))) (= (type Wand_state_contains_for_state_contains__cur_contents_1) (FieldType NormalFieldType (SeqType intType)))) (= (type Wand_state_contains_for_state_contains__top_1) (FieldType NormalFieldType RefType))) (= (type Wand_state_contains_for_state_contains__cur_1) (FieldType NormalFieldType RefType))) (= (type Wand_state_contains_for_state_contains__wand_1) (FieldType NormalFieldType RefType))) (= (type Wand_state_contains_for_state_contains__this_2) (FieldType NormalFieldType RefType))) (= (type Wand_state_contains_for_state_contains__target_contents_2) (FieldType NormalFieldType (SeqType intType)))) (= (type Wand_state_contains_for_state_contains__top_2) (FieldType NormalFieldType RefType))) (= (type Tree__data) (FieldType NormalFieldType intType))) (= (type Tree__left) (FieldType NormalFieldType RefType))) (= (type Tree__right) (FieldType NormalFieldType RefType))))
(assert (distinct $allocated Wand_state_contains_for_state_contains__lemma Wand_state_contains_for_state_contains__in_1 Wand_state_contains_for_state_contains__in_1_0 Wand_state_contains_for_state_contains__out_1 Wand_state_contains_for_state_contains__out_1_0 Wand_state_contains_for_state_contains__this_1 Wand_state_contains_for_state_contains__target_contents_1 Wand_state_contains_for_state_contains__prev_contents_1 Wand_state_contains_for_state_contains__prev_1 Wand_state_contains_for_state_contains__cur_contents_1 Wand_state_contains_for_state_contains__top_1 Wand_state_contains_for_state_contains__cur_1 Wand_state_contains_for_state_contains__wand_1 Wand_state_contains_for_state_contains__this_2 Wand_state_contains_for_state_contains__target_contents_2 Wand_state_contains_for_state_contains__top_2 Tree__data Tree__left Tree__right)
)
(assert (forall ((arg0@@16 T@U) (arg1@@2 Int) ) (! (let ((T (SeqTypeInv0 (type arg0@@16))))
(= (type (|Seq#Drop| arg0@@16 arg1@@2)) (SeqType T)))
 :qid |funType:Seq#Drop|
 :pattern ( (|Seq#Drop| arg0@@16 arg1@@2))
)))
(assert (forall ((s T@U) (n Int) ) (! (let ((T@@0 (SeqTypeInv0 (type s))))
 (=> (= (type s) (SeqType T@@0)) (and (=> (<= 0 n) (and (=> (<= n (|Seq#Length| s)) (= (|Seq#Length| (|Seq#Drop| s n)) (- (|Seq#Length| s) n))) (=> (< (|Seq#Length| s) n) (= (|Seq#Length| (|Seq#Drop| s n)) 0)))) (=> (< n 0) (= (|Seq#Length| (|Seq#Drop| s n)) (|Seq#Length| s))))))
 :qid |stdinbpl.280:18|
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
(assert  (and (and (and (and (and (and (and (and (and (forall ((arg0@@26 T@U) (arg1@@10 T@U) ) (! (= (type (Tree__tolist arg0@@26 arg1@@10)) (SeqType intType))
 :qid |funType:Tree__tolist|
 :pattern ( (Tree__tolist arg0@@26 arg1@@10))
)) (forall ((arg0@@27 T@U) ) (! (= (type (|Tree__tolist#triggerStateless| arg0@@27)) (SeqType intType))
 :qid |funType:Tree__tolist#triggerStateless|
 :pattern ( (|Tree__tolist#triggerStateless| arg0@@27))
))) (= (Ctor PredicateType_Tree__stateType) 12)) (= (Ctor FrameTypeType) 13)) (forall ((arg0@@28 T@U) ) (! (= (type (Tree__state arg0@@28)) (FieldType PredicateType_Tree__stateType FrameTypeType))
 :qid |funType:Tree__state|
 :pattern ( (Tree__state arg0@@28))
))) (= (type null) RefType)) (forall ((T@@1 T@T) ) (! (= (type (|Seq#Empty| T@@1)) (SeqType T@@1))
 :qid |funType:Seq#Empty|
 :pattern ( (|Seq#Empty| T@@1))
))) (forall ((arg0@@29 T@U) (arg1@@11 T@U) ) (! (let ((T@@2 (SeqTypeInv0 (type arg0@@29))))
(= (type (|Seq#Append| arg0@@29 arg1@@11)) (SeqType T@@2)))
 :qid |funType:Seq#Append|
 :pattern ( (|Seq#Append| arg0@@29 arg1@@11))
))) (forall ((arg0@@30 T@U) (arg1@@12 T@U) ) (! (= (type (|Tree__tolist'| arg0@@30 arg1@@12)) (SeqType intType))
 :qid |funType:Tree__tolist'|
 :pattern ( (|Tree__tolist'| arg0@@30 arg1@@12))
))) (forall ((arg0@@31 T@U) ) (! (let ((T@@3 (type arg0@@31)))
(= (type (|Seq#Singleton| arg0@@31)) (SeqType T@@3)))
 :qid |funType:Seq#Singleton|
 :pattern ( (|Seq#Singleton| arg0@@31))
))))
(assert (forall ((Heap@@0 T@U) (Mask@@0 T@U) (t_1 T@U) ) (!  (=> (and (and (and (= (type Heap@@0) (MapType0Type RefType)) (= (type Mask@@0) (MapType1Type RefType realType))) (= (type t_1) RefType)) (and (state Heap@@0 Mask@@0) (< AssumeFunctionsAbove 6))) (= (Tree__tolist Heap@@0 t_1) (ite (= t_1 null) (|Seq#Empty| intType) (|Seq#Append| (|Seq#Append| (|Tree__tolist'| Heap@@0 (MapType0Select Heap@@0 t_1 Tree__left)) (|Seq#Singleton| (MapType0Select Heap@@0 t_1 Tree__data))) (|Tree__tolist'| Heap@@0 (MapType0Select Heap@@0 t_1 Tree__right))))))
 :qid |stdinbpl.1689:15|
 :skolemid |86|
 :pattern ( (state Heap@@0 Mask@@0) (Tree__tolist Heap@@0 t_1))
 :pattern ( (state Heap@@0 Mask@@0) (|Tree__tolist#triggerStateless| t_1) (|Tree__state#trigger| Heap@@0 (Tree__state t_1)) (|Tree__state#trigger| Heap@@0 (Tree__state t_1)))
)))
(assert (forall ((arg0@@32 T@U) (arg1@@13 Int) ) (! (let ((T@@4 (SeqTypeInv0 (type arg0@@32))))
(= (type (|Seq#Index| arg0@@32 arg1@@13)) T@@4))
 :qid |funType:Seq#Index|
 :pattern ( (|Seq#Index| arg0@@32 arg1@@13))
)))
(assert (forall ((s@@0 T@U) (n@@0 Int) (j Int) ) (! (let ((T@@5 (SeqTypeInv0 (type s@@0))))
 (=> (= (type s@@0) (SeqType T@@5)) (=> (and (and (< 0 n@@0) (<= 0 j)) (< j (- (|Seq#Length| s@@0) n@@0))) (and (= (|Seq#Sub| (|Seq#Add| j n@@0) n@@0) j) (= (|Seq#Index| (|Seq#Drop| s@@0 n@@0) j) (|Seq#Index| s@@0 (|Seq#Add| j n@@0)))))))
 :qid |stdinbpl.301:18|
 :skolemid |39|
 :pattern ( (|Seq#Index| (|Seq#Drop| s@@0 n@@0) j))
)))
(assert (forall ((arg0@@33 T@U) ) (! (let ((A (FieldTypeInv0 (type arg0@@33))))
(= (type (PredicateMaskField arg0@@33)) (FieldType A (MapType1Type RefType boolType))))
 :qid |funType:PredicateMaskField|
 :pattern ( (PredicateMaskField arg0@@33))
)))
(assert (forall ((Heap@@1 T@U) (ExhaleHeap T@U) (Mask@@1 T@U) (pm_f T@U) ) (! (let ((C (FieldTypeInv0 (type pm_f))))
 (=> (and (and (and (and (and (= (type Heap@@1) (MapType0Type RefType)) (= (type ExhaleHeap) (MapType0Type RefType))) (= (type Mask@@1) (MapType1Type RefType realType))) (= (type pm_f) (FieldType C FrameTypeType))) (IdenticalOnKnownLocations Heap@@1 ExhaleHeap Mask@@1)) (and (HasDirectPerm Mask@@1 null pm_f) (IsPredicateField pm_f))) (= (MapType0Select Heap@@1 null (PredicateMaskField pm_f)) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))))
 :qid |stdinbpl.47:19|
 :skolemid |2|
 :pattern ( (IdenticalOnKnownLocations Heap@@1 ExhaleHeap Mask@@1) (IsPredicateField pm_f) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))
)))
(assert (forall ((arg0@@34 T@U) ) (! (let ((A@@0 (FieldTypeInv0 (type arg0@@34))))
(= (type (WandMaskField arg0@@34)) (FieldType A@@0 (MapType1Type RefType boolType))))
 :qid |funType:WandMaskField|
 :pattern ( (WandMaskField arg0@@34))
)))
(assert (forall ((Heap@@2 T@U) (ExhaleHeap@@0 T@U) (Mask@@2 T@U) (pm_f@@0 T@U) ) (! (let ((C@@0 (FieldTypeInv0 (type pm_f@@0))))
 (=> (and (and (and (and (and (= (type Heap@@2) (MapType0Type RefType)) (= (type ExhaleHeap@@0) (MapType0Type RefType))) (= (type Mask@@2) (MapType1Type RefType realType))) (= (type pm_f@@0) (FieldType C@@0 FrameTypeType))) (IdenticalOnKnownLocations Heap@@2 ExhaleHeap@@0 Mask@@2)) (and (HasDirectPerm Mask@@2 null pm_f@@0) (IsWandField pm_f@@0))) (= (MapType0Select Heap@@2 null (WandMaskField pm_f@@0)) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))))
 :qid |stdinbpl.60:19|
 :skolemid |5|
 :pattern ( (IdenticalOnKnownLocations Heap@@2 ExhaleHeap@@0 Mask@@2) (IsWandField pm_f@@0) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))
)))
(assert  (and (= (Ctor PredicateType_Wand_state_contains_for_state_contains__valid_wandType) 14) (forall ((arg0@@35 T@U) ) (! (= (type (Wand_state_contains_for_state_contains__valid_wand arg0@@35)) (FieldType PredicateType_Wand_state_contains_for_state_contains__valid_wandType FrameTypeType))
 :qid |funType:Wand_state_contains_for_state_contains__valid_wand|
 :pattern ( (Wand_state_contains_for_state_contains__valid_wand arg0@@35))
))))
(assert (forall ((diz T@U) ) (!  (=> (= (type diz) RefType) (IsPredicateField (Wand_state_contains_for_state_contains__valid_wand diz)))
 :qid |stdinbpl.2031:15|
 :skolemid |101|
 :pattern ( (Wand_state_contains_for_state_contains__valid_wand diz))
)))
(assert (forall ((diz@@0 T@U) ) (!  (=> (= (type diz@@0) RefType) (IsPredicateField (Tree__state diz@@0)))
 :qid |stdinbpl.2478:15|
 :skolemid |107|
 :pattern ( (Tree__state diz@@0))
)))
(assert  (and (forall ((arg0@@36 T@U) (arg1@@14 T@U) ) (! (= (type (|Wand_state_contains_for_state_contains__get_in_1'| arg0@@36 arg1@@14)) RefType)
 :qid |funType:Wand_state_contains_for_state_contains__get_in_1'|
 :pattern ( (|Wand_state_contains_for_state_contains__get_in_1'| arg0@@36 arg1@@14))
)) (forall ((arg0@@37 T@U) ) (! (= (type (|Wand_state_contains_for_state_contains__get_in_1#triggerStateless| arg0@@37)) RefType)
 :qid |funType:Wand_state_contains_for_state_contains__get_in_1#triggerStateless|
 :pattern ( (|Wand_state_contains_for_state_contains__get_in_1#triggerStateless| arg0@@37))
))))
(assert (forall ((Heap@@3 T@U) (diz@@1 T@U) ) (!  (=> (and (= (type Heap@@3) (MapType0Type RefType)) (= (type diz@@1) RefType)) (dummyFunction (|Wand_state_contains_for_state_contains__get_in_1#triggerStateless| diz@@1)))
 :qid |stdinbpl.619:15|
 :skolemid |59|
 :pattern ( (|Wand_state_contains_for_state_contains__get_in_1'| Heap@@3 diz@@1))
)))
(assert  (and (forall ((arg0@@38 T@U) (arg1@@15 T@U) ) (! (= (type (|Wand_state_contains_for_state_contains__get_in_1_0'| arg0@@38 arg1@@15)) (SeqType intType))
 :qid |funType:Wand_state_contains_for_state_contains__get_in_1_0'|
 :pattern ( (|Wand_state_contains_for_state_contains__get_in_1_0'| arg0@@38 arg1@@15))
)) (forall ((arg0@@39 T@U) ) (! (= (type (|Wand_state_contains_for_state_contains__get_in_1_0#triggerStateless| arg0@@39)) (SeqType intType))
 :qid |funType:Wand_state_contains_for_state_contains__get_in_1_0#triggerStateless|
 :pattern ( (|Wand_state_contains_for_state_contains__get_in_1_0#triggerStateless| arg0@@39))
))))
(assert (forall ((Heap@@4 T@U) (diz@@2 T@U) ) (!  (=> (and (= (type Heap@@4) (MapType0Type RefType)) (= (type diz@@2) RefType)) (dummyFunction (|Wand_state_contains_for_state_contains__get_in_1_0#triggerStateless| diz@@2)))
 :qid |stdinbpl.891:15|
 :skolemid |66|
 :pattern ( (|Wand_state_contains_for_state_contains__get_in_1_0'| Heap@@4 diz@@2))
)))
(assert  (and (forall ((arg0@@40 T@U) (arg1@@16 T@U) ) (! (= (type (|Wand_state_contains_for_state_contains__get_out_1'| arg0@@40 arg1@@16)) RefType)
 :qid |funType:Wand_state_contains_for_state_contains__get_out_1'|
 :pattern ( (|Wand_state_contains_for_state_contains__get_out_1'| arg0@@40 arg1@@16))
)) (forall ((arg0@@41 T@U) ) (! (= (type (|Wand_state_contains_for_state_contains__get_out_1#triggerStateless| arg0@@41)) RefType)
 :qid |funType:Wand_state_contains_for_state_contains__get_out_1#triggerStateless|
 :pattern ( (|Wand_state_contains_for_state_contains__get_out_1#triggerStateless| arg0@@41))
))))
(assert (forall ((Heap@@5 T@U) (diz@@3 T@U) ) (!  (=> (and (= (type Heap@@5) (MapType0Type RefType)) (= (type diz@@3) RefType)) (dummyFunction (|Wand_state_contains_for_state_contains__get_out_1#triggerStateless| diz@@3)))
 :qid |stdinbpl.1151:15|
 :skolemid |72|
 :pattern ( (|Wand_state_contains_for_state_contains__get_out_1'| Heap@@5 diz@@3))
)))
(assert  (and (forall ((arg0@@42 T@U) (arg1@@17 T@U) ) (! (= (type (|Wand_state_contains_for_state_contains__get_out_1_0'| arg0@@42 arg1@@17)) (SeqType intType))
 :qid |funType:Wand_state_contains_for_state_contains__get_out_1_0'|
 :pattern ( (|Wand_state_contains_for_state_contains__get_out_1_0'| arg0@@42 arg1@@17))
)) (forall ((arg0@@43 T@U) ) (! (= (type (|Wand_state_contains_for_state_contains__get_out_1_0#triggerStateless| arg0@@43)) (SeqType intType))
 :qid |funType:Wand_state_contains_for_state_contains__get_out_1_0#triggerStateless|
 :pattern ( (|Wand_state_contains_for_state_contains__get_out_1_0#triggerStateless| arg0@@43))
))))
(assert (forall ((Heap@@6 T@U) (diz@@4 T@U) ) (!  (=> (and (= (type Heap@@6) (MapType0Type RefType)) (= (type diz@@4) RefType)) (dummyFunction (|Wand_state_contains_for_state_contains__get_out_1_0#triggerStateless| diz@@4)))
 :qid |stdinbpl.1423:15|
 :skolemid |79|
 :pattern ( (|Wand_state_contains_for_state_contains__get_out_1_0'| Heap@@6 diz@@4))
)))
(assert (forall ((Heap@@7 T@U) (t_1@@0 T@U) ) (!  (=> (and (= (type Heap@@7) (MapType0Type RefType)) (= (type t_1@@0) RefType)) (dummyFunction (|Tree__tolist#triggerStateless| t_1@@0)))
 :qid |stdinbpl.1683:15|
 :skolemid |85|
 :pattern ( (|Tree__tolist'| Heap@@7 t_1@@0))
)))
(assert (forall ((Heap@@8 T@U) (s@@1 T@U) ) (!  (=> (and (= (type Heap@@8) (MapType0Type RefType)) (= (type s@@1) (SeqType intType))) (dummyFunction (bool_2_U (|Tree__sorted_list#triggerStateless| s@@1))))
 :qid |stdinbpl.1868:15|
 :skolemid |91|
 :pattern ( (|Tree__sorted_list'| Heap@@8 s@@1))
)))
(assert (forall ((Heap@@9 T@U) (t_1@@1 T@U) ) (!  (=> (and (= (type Heap@@9) (MapType0Type RefType)) (= (type t_1@@1) RefType)) (dummyFunction (bool_2_U (|Tree__sorted#triggerStateless| t_1@@1))))
 :qid |stdinbpl.1942:15|
 :skolemid |97|
 :pattern ( (|Tree__sorted'| Heap@@9 t_1@@1))
)))
(assert (forall ((Heap@@10 T@U) (diz@@5 T@U) ) (!  (=> (and (= (type Heap@@10) (MapType0Type RefType)) (= (type diz@@5) RefType)) (|Wand_state_contains_for_state_contains__valid_wand#everUsed| (Wand_state_contains_for_state_contains__valid_wand diz@@5)))
 :qid |stdinbpl.2050:15|
 :skolemid |105|
 :pattern ( (|Wand_state_contains_for_state_contains__valid_wand#trigger| Heap@@10 (Wand_state_contains_for_state_contains__valid_wand diz@@5)))
)))
(assert (forall ((Heap@@11 T@U) (diz@@6 T@U) ) (!  (=> (and (= (type Heap@@11) (MapType0Type RefType)) (= (type diz@@6) RefType)) (|Tree__state#everUsed| (Tree__state diz@@6)))
 :qid |stdinbpl.2497:15|
 :skolemid |111|
 :pattern ( (|Tree__state#trigger| Heap@@11 (Tree__state diz@@6)))
)))
(assert (forall ((arg0@@44 T@U) (arg1@@18 Int) (arg2@@3 T@U) ) (! (let ((T@@6 (type arg2@@3)))
(= (type (|Seq#Update| arg0@@44 arg1@@18 arg2@@3)) (SeqType T@@6)))
 :qid |funType:Seq#Update|
 :pattern ( (|Seq#Update| arg0@@44 arg1@@18 arg2@@3))
)))
(assert (forall ((s@@2 T@U) (i Int) (v T@U) (n@@1 Int) ) (! (let ((T@@7 (type v)))
 (=> (= (type s@@2) (SeqType T@@7)) (=> (and (<= 0 n@@1) (< n@@1 (|Seq#Length| s@@2))) (and (=> (= i n@@1) (= (|Seq#Index| (|Seq#Update| s@@2 i v) n@@1) v)) (=> (not (= i n@@1)) (= (|Seq#Index| (|Seq#Update| s@@2 i v) n@@1) (|Seq#Index| s@@2 n@@1)))))))
 :qid |stdinbpl.256:18|
 :skolemid |35|
 :pattern ( (|Seq#Index| (|Seq#Update| s@@2 i v) n@@1))
 :pattern ( (|Seq#Index| s@@2 n@@1) (|Seq#Update| s@@2 i v))
)))
(assert (forall ((arg0@@45 T@U) (arg1@@19 Int) ) (! (let ((T@@8 (SeqTypeInv0 (type arg0@@45))))
(= (type (|Seq#Take| arg0@@45 arg1@@19)) (SeqType T@@8)))
 :qid |funType:Seq#Take|
 :pattern ( (|Seq#Take| arg0@@45 arg1@@19))
)))
(assert (forall ((s@@3 T@U) (n@@2 Int) ) (! (let ((T@@9 (SeqTypeInv0 (type s@@3))))
 (=> (= (type s@@3) (SeqType T@@9)) (and (=> (<= 0 n@@2) (and (=> (<= n@@2 (|Seq#Length| s@@3)) (= (|Seq#Length| (|Seq#Take| s@@3 n@@2)) n@@2)) (=> (< (|Seq#Length| s@@3) n@@2) (= (|Seq#Length| (|Seq#Take| s@@3 n@@2)) (|Seq#Length| s@@3))))) (=> (< n@@2 0) (= (|Seq#Length| (|Seq#Take| s@@3 n@@2)) 0)))))
 :qid |stdinbpl.267:18|
 :skolemid |36|
 :pattern ( (|Seq#Length| (|Seq#Take| s@@3 n@@2)))
 :pattern ( (|Seq#Take| s@@3 n@@2) (|Seq#Length| s@@3))
)))
(assert (forall ((arg0@@46 Int) (arg1@@20 Int) ) (! (= (type (|Seq#Range| arg0@@46 arg1@@20)) (SeqType intType))
 :qid |funType:Seq#Range|
 :pattern ( (|Seq#Range| arg0@@46 arg1@@20))
)))
(assert (forall ((q@min Int) (q@max Int) (v@@0 T@U) ) (!  (=> (= (type v@@0) intType) (= (|Seq#Contains| (|Seq#Range| q@min q@max) v@@0)  (and (<= q@min (U_2_int v@@0)) (< (U_2_int v@@0) q@max))))
 :qid |stdinbpl.540:15|
 :skolemid |57|
 :pattern ( (|Seq#Contains| (|Seq#Range| q@min q@max) v@@0))
)))
(assert (forall ((s@@4 T@U) (x@@8 T@U) ) (! (let ((T@@10 (type x@@8)))
 (=> (and (= (type s@@4) (SeqType T@@10)) (|Seq#Contains| s@@4 x@@8)) (and (and (<= 0 (|Seq#Skolem| s@@4 x@@8)) (< (|Seq#Skolem| s@@4 x@@8) (|Seq#Length| s@@4))) (= (|Seq#Index| s@@4 (|Seq#Skolem| s@@4 x@@8)) x@@8))))
 :qid |stdinbpl.398:18|
 :skolemid |47|
 :pattern ( (|Seq#Contains| s@@4 x@@8))
)))
(assert (forall ((Heap@@12 T@U) (ExhaleHeap@@1 T@U) (Mask@@3 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@12) (MapType0Type RefType)) (= (type ExhaleHeap@@1) (MapType0Type RefType))) (= (type Mask@@3) (MapType1Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@12 ExhaleHeap@@1 Mask@@3)) (U_2_bool (MapType0Select Heap@@12 o_1 $allocated))) (U_2_bool (MapType0Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.73:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@12 ExhaleHeap@@1 Mask@@3) (MapType0Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert (forall ((arg0@@47 T@U) (arg1@@21 T@U) ) (! (= (type (Wand_state_contains_for_state_contains__get_in_1 arg0@@47 arg1@@21)) RefType)
 :qid |funType:Wand_state_contains_for_state_contains__get_in_1|
 :pattern ( (Wand_state_contains_for_state_contains__get_in_1 arg0@@47 arg1@@21))
)))
(assert (forall ((Heap@@13 T@U) (diz@@7 T@U) ) (!  (=> (and (= (type Heap@@13) (MapType0Type RefType)) (= (type diz@@7) RefType)) (and (= (Wand_state_contains_for_state_contains__get_in_1 Heap@@13 diz@@7) (|Wand_state_contains_for_state_contains__get_in_1'| Heap@@13 diz@@7)) (dummyFunction (|Wand_state_contains_for_state_contains__get_in_1#triggerStateless| diz@@7))))
 :qid |stdinbpl.615:15|
 :skolemid |58|
 :pattern ( (Wand_state_contains_for_state_contains__get_in_1 Heap@@13 diz@@7))
)))
(assert (forall ((arg0@@48 T@U) (arg1@@22 T@U) ) (! (= (type (Wand_state_contains_for_state_contains__get_in_1_0 arg0@@48 arg1@@22)) (SeqType intType))
 :qid |funType:Wand_state_contains_for_state_contains__get_in_1_0|
 :pattern ( (Wand_state_contains_for_state_contains__get_in_1_0 arg0@@48 arg1@@22))
)))
(assert (forall ((Heap@@14 T@U) (diz@@8 T@U) ) (!  (=> (and (= (type Heap@@14) (MapType0Type RefType)) (= (type diz@@8) RefType)) (and (= (Wand_state_contains_for_state_contains__get_in_1_0 Heap@@14 diz@@8) (|Wand_state_contains_for_state_contains__get_in_1_0'| Heap@@14 diz@@8)) (dummyFunction (|Wand_state_contains_for_state_contains__get_in_1_0#triggerStateless| diz@@8))))
 :qid |stdinbpl.887:15|
 :skolemid |65|
 :pattern ( (Wand_state_contains_for_state_contains__get_in_1_0 Heap@@14 diz@@8))
)))
(assert (forall ((arg0@@49 T@U) (arg1@@23 T@U) ) (! (= (type (Wand_state_contains_for_state_contains__get_out_1 arg0@@49 arg1@@23)) RefType)
 :qid |funType:Wand_state_contains_for_state_contains__get_out_1|
 :pattern ( (Wand_state_contains_for_state_contains__get_out_1 arg0@@49 arg1@@23))
)))
(assert (forall ((Heap@@15 T@U) (diz@@9 T@U) ) (!  (=> (and (= (type Heap@@15) (MapType0Type RefType)) (= (type diz@@9) RefType)) (and (= (Wand_state_contains_for_state_contains__get_out_1 Heap@@15 diz@@9) (|Wand_state_contains_for_state_contains__get_out_1'| Heap@@15 diz@@9)) (dummyFunction (|Wand_state_contains_for_state_contains__get_out_1#triggerStateless| diz@@9))))
 :qid |stdinbpl.1147:15|
 :skolemid |71|
 :pattern ( (Wand_state_contains_for_state_contains__get_out_1 Heap@@15 diz@@9))
)))
(assert (forall ((arg0@@50 T@U) (arg1@@24 T@U) ) (! (= (type (Wand_state_contains_for_state_contains__get_out_1_0 arg0@@50 arg1@@24)) (SeqType intType))
 :qid |funType:Wand_state_contains_for_state_contains__get_out_1_0|
 :pattern ( (Wand_state_contains_for_state_contains__get_out_1_0 arg0@@50 arg1@@24))
)))
(assert (forall ((Heap@@16 T@U) (diz@@10 T@U) ) (!  (=> (and (= (type Heap@@16) (MapType0Type RefType)) (= (type diz@@10) RefType)) (and (= (Wand_state_contains_for_state_contains__get_out_1_0 Heap@@16 diz@@10) (|Wand_state_contains_for_state_contains__get_out_1_0'| Heap@@16 diz@@10)) (dummyFunction (|Wand_state_contains_for_state_contains__get_out_1_0#triggerStateless| diz@@10))))
 :qid |stdinbpl.1419:15|
 :skolemid |78|
 :pattern ( (Wand_state_contains_for_state_contains__get_out_1_0 Heap@@16 diz@@10))
)))
(assert (forall ((Heap@@17 T@U) (t_1@@2 T@U) ) (!  (=> (and (= (type Heap@@17) (MapType0Type RefType)) (= (type t_1@@2) RefType)) (and (= (Tree__tolist Heap@@17 t_1@@2) (|Tree__tolist'| Heap@@17 t_1@@2)) (dummyFunction (|Tree__tolist#triggerStateless| t_1@@2))))
 :qid |stdinbpl.1679:15|
 :skolemid |84|
 :pattern ( (Tree__tolist Heap@@17 t_1@@2))
)))
(assert (forall ((s@@5 T@U) (n@@3 Int) ) (! (let ((T@@11 (SeqTypeInv0 (type s@@5))))
 (=> (and (= (type s@@5) (SeqType T@@11)) (<= n@@3 0)) (= (|Seq#Drop| s@@5 n@@3) s@@5)))
 :qid |stdinbpl.382:18|
 :skolemid |45|
 :pattern ( (|Seq#Drop| s@@5 n@@3))
)))
(assert (forall ((i@@0 Int) (j@@0 Int) ) (! (= (|Seq#Sub| i@@0 j@@0) (- i@@0 j@@0))
 :qid |stdinbpl.236:15|
 :skolemid |30|
 :pattern ( (|Seq#Sub| i@@0 j@@0))
)))
(assert (forall ((i@@1 Int) (j@@1 Int) ) (! (= (|Seq#Add| i@@1 j@@1) (+ i@@1 j@@1))
 :qid |stdinbpl.234:15|
 :skolemid |29|
 :pattern ( (|Seq#Add| i@@1 j@@1))
)))
(assert (forall ((x@@9 T@U) (y@@1 T@U) ) (! (let ((T@@12 (type x@@9)))
 (=> (= (type y@@1) T@@12) (= (|Seq#Contains| (|Seq#Singleton| x@@9) y@@1) (= x@@9 y@@1))))
 :qid |stdinbpl.523:18|
 :skolemid |54|
 :pattern ( (|Seq#Contains| (|Seq#Singleton| x@@9) y@@1))
)))
(assert (forall ((s@@6 T@U) (n@@4 Int) (j@@2 Int) ) (! (let ((T@@13 (SeqTypeInv0 (type s@@6))))
 (=> (= (type s@@6) (SeqType T@@13)) (=> (and (and (<= 0 j@@2) (< j@@2 n@@4)) (< j@@2 (|Seq#Length| s@@6))) (= (|Seq#Index| (|Seq#Take| s@@6 n@@4) j@@2) (|Seq#Index| s@@6 j@@2)))))
 :qid |stdinbpl.275:18|
 :skolemid |37|
 :pattern ( (|Seq#Index| (|Seq#Take| s@@6 n@@4) j@@2))
 :pattern ( (|Seq#Index| s@@6 j@@2) (|Seq#Take| s@@6 n@@4))
)))
(assert (forall ((diz@@11 T@U) (diz2 T@U) ) (!  (=> (and (and (= (type diz@@11) RefType) (= (type diz2) RefType)) (= (Wand_state_contains_for_state_contains__valid_wand diz@@11) (Wand_state_contains_for_state_contains__valid_wand diz2))) (= diz@@11 diz2))
 :qid |stdinbpl.2041:15|
 :skolemid |103|
 :pattern ( (Wand_state_contains_for_state_contains__valid_wand diz@@11) (Wand_state_contains_for_state_contains__valid_wand diz2))
)))
(assert (forall ((arg0@@51 T@U) ) (! (= (type (|Wand_state_contains_for_state_contains__valid_wand#sm| arg0@@51)) (FieldType PredicateType_Wand_state_contains_for_state_contains__valid_wandType (MapType1Type RefType boolType)))
 :qid |funType:Wand_state_contains_for_state_contains__valid_wand#sm|
 :pattern ( (|Wand_state_contains_for_state_contains__valid_wand#sm| arg0@@51))
)))
(assert (forall ((diz@@12 T@U) (diz2@@0 T@U) ) (!  (=> (and (and (= (type diz@@12) RefType) (= (type diz2@@0) RefType)) (= (|Wand_state_contains_for_state_contains__valid_wand#sm| diz@@12) (|Wand_state_contains_for_state_contains__valid_wand#sm| diz2@@0))) (= diz@@12 diz2@@0))
 :qid |stdinbpl.2045:15|
 :skolemid |104|
 :pattern ( (|Wand_state_contains_for_state_contains__valid_wand#sm| diz@@12) (|Wand_state_contains_for_state_contains__valid_wand#sm| diz2@@0))
)))
(assert (forall ((diz@@13 T@U) (diz2@@1 T@U) ) (!  (=> (and (and (= (type diz@@13) RefType) (= (type diz2@@1) RefType)) (= (Tree__state diz@@13) (Tree__state diz2@@1))) (= diz@@13 diz2@@1))
 :qid |stdinbpl.2488:15|
 :skolemid |109|
 :pattern ( (Tree__state diz@@13) (Tree__state diz2@@1))
)))
(assert (forall ((arg0@@52 T@U) ) (! (= (type (|Tree__state#sm| arg0@@52)) (FieldType PredicateType_Tree__stateType (MapType1Type RefType boolType)))
 :qid |funType:Tree__state#sm|
 :pattern ( (|Tree__state#sm| arg0@@52))
)))
(assert (forall ((diz@@14 T@U) (diz2@@2 T@U) ) (!  (=> (and (and (= (type diz@@14) RefType) (= (type diz2@@2) RefType)) (= (|Tree__state#sm| diz@@14) (|Tree__state#sm| diz2@@2))) (= diz@@14 diz2@@2))
 :qid |stdinbpl.2492:15|
 :skolemid |110|
 :pattern ( (|Tree__state#sm| diz@@14) (|Tree__state#sm| diz2@@2))
)))
(assert (forall ((Heap@@18 T@U) (ExhaleHeap@@2 T@U) (Mask@@4 T@U) (o_1@@0 T@U) (f_2 T@U) ) (! (let ((B@@1 (FieldTypeInv1 (type f_2))))
(let ((A@@1 (FieldTypeInv0 (type f_2))))
 (=> (and (and (and (and (and (and (= (type Heap@@18) (MapType0Type RefType)) (= (type ExhaleHeap@@2) (MapType0Type RefType))) (= (type Mask@@4) (MapType1Type RefType realType))) (= (type o_1@@0) RefType)) (= (type f_2) (FieldType A@@1 B@@1))) (IdenticalOnKnownLocations Heap@@18 ExhaleHeap@@2 Mask@@4)) (HasDirectPerm Mask@@4 o_1@@0 f_2)) (= (MapType0Select Heap@@18 o_1@@0 f_2) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2)))))
 :qid |stdinbpl.42:22|
 :skolemid |1|
 :pattern ( (IdenticalOnKnownLocations Heap@@18 ExhaleHeap@@2 Mask@@4) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2))
)))
(assert (forall ((T@@14 T@T) ) (! (= (|Seq#Length| (|Seq#Empty| T@@14)) 0)
 :skolemid |23|
)))
(assert  (and (= (type dummyHeap) (MapType0Type RefType)) (= (type ZeroMask) (MapType1Type RefType realType))))
(assert (state dummyHeap ZeroMask))
(assert (forall ((p T@U) (v_1 T@U) (w T@U) ) (! (let ((A@@2 (FieldTypeInv0 (type p))))
 (=> (and (and (= (type p) (FieldType A@@2 FrameTypeType)) (= (type v_1) FrameTypeType)) (= (type w) FrameTypeType)) (not (InsidePredicate p v_1 p w))))
 :qid |stdinbpl.179:19|
 :skolemid |21|
 :pattern ( (InsidePredicate p v_1 p w))
)))
(assert (forall ((s0 T@U) (s1 T@U) (n@@5 Int) ) (! (let ((T@@15 (SeqTypeInv0 (type s0))))
 (=> (and (= (type s0) (SeqType T@@15)) (= (type s1) (SeqType T@@15))) (=> (and (and (and (not (= s0 (|Seq#Empty| T@@15))) (not (= s1 (|Seq#Empty| T@@15)))) (<= (|Seq#Length| s0) n@@5)) (< n@@5 (|Seq#Length| (|Seq#Append| s0 s1)))) (and (= (|Seq#Add| (|Seq#Sub| n@@5 (|Seq#Length| s0)) (|Seq#Length| s0)) n@@5) (= (|Seq#Index| (|Seq#Append| s0 s1) n@@5) (|Seq#Index| s1 (|Seq#Sub| n@@5 (|Seq#Length| s0))))))))
 :qid |stdinbpl.247:18|
 :skolemid |32|
 :pattern ( (|Seq#Index| (|Seq#Append| s0 s1) n@@5))
)))
(assert  (and (forall ((arg0@@53 T@U) ) (! (= (type (FrameFragment arg0@@53)) FrameTypeType)
 :qid |funType:FrameFragment|
 :pattern ( (FrameFragment arg0@@53))
)) (= (type EmptyFrame) FrameTypeType)))
(assert (forall ((Heap@@19 T@U) (Mask@@5 T@U) (t_1@@3 T@U) ) (!  (=> (and (and (and (= (type Heap@@19) (MapType0Type RefType)) (= (type Mask@@5) (MapType1Type RefType realType))) (= (type t_1@@3) RefType)) (state Heap@@19 Mask@@5)) (= (|Tree__sorted'| Heap@@19 t_1@@3) (|Tree__sorted#frame| (FrameFragment (ite (not (= t_1@@3 null)) (MapType0Select Heap@@19 null (Tree__state t_1@@3)) EmptyFrame)) t_1@@3)))
 :qid |stdinbpl.1955:15|
 :skolemid |99|
 :pattern ( (state Heap@@19 Mask@@5) (|Tree__sorted'| Heap@@19 t_1@@3))
)))
(assert  (not (IsPredicateField Wand_state_contains_for_state_contains__lemma)))
(assert  (not (IsWandField Wand_state_contains_for_state_contains__lemma)))
(assert  (not (IsPredicateField Wand_state_contains_for_state_contains__in_1)))
(assert  (not (IsWandField Wand_state_contains_for_state_contains__in_1)))
(assert  (not (IsPredicateField Wand_state_contains_for_state_contains__in_1_0)))
(assert  (not (IsWandField Wand_state_contains_for_state_contains__in_1_0)))
(assert  (not (IsPredicateField Wand_state_contains_for_state_contains__out_1)))
(assert  (not (IsWandField Wand_state_contains_for_state_contains__out_1)))
(assert  (not (IsPredicateField Wand_state_contains_for_state_contains__out_1_0)))
(assert  (not (IsWandField Wand_state_contains_for_state_contains__out_1_0)))
(assert  (not (IsPredicateField Wand_state_contains_for_state_contains__this_1)))
(assert  (not (IsWandField Wand_state_contains_for_state_contains__this_1)))
(assert  (not (IsPredicateField Wand_state_contains_for_state_contains__target_contents_1)))
(assert  (not (IsWandField Wand_state_contains_for_state_contains__target_contents_1)))
(assert  (not (IsPredicateField Wand_state_contains_for_state_contains__prev_contents_1)))
(assert  (not (IsWandField Wand_state_contains_for_state_contains__prev_contents_1)))
(assert  (not (IsPredicateField Wand_state_contains_for_state_contains__prev_1)))
(assert  (not (IsWandField Wand_state_contains_for_state_contains__prev_1)))
(assert  (not (IsPredicateField Wand_state_contains_for_state_contains__cur_contents_1)))
(assert  (not (IsWandField Wand_state_contains_for_state_contains__cur_contents_1)))
(assert  (not (IsPredicateField Wand_state_contains_for_state_contains__top_1)))
(assert  (not (IsWandField Wand_state_contains_for_state_contains__top_1)))
(assert  (not (IsPredicateField Wand_state_contains_for_state_contains__cur_1)))
(assert  (not (IsWandField Wand_state_contains_for_state_contains__cur_1)))
(assert  (not (IsPredicateField Wand_state_contains_for_state_contains__wand_1)))
(assert  (not (IsWandField Wand_state_contains_for_state_contains__wand_1)))
(assert  (not (IsPredicateField Wand_state_contains_for_state_contains__this_2)))
(assert  (not (IsWandField Wand_state_contains_for_state_contains__this_2)))
(assert  (not (IsPredicateField Wand_state_contains_for_state_contains__target_contents_2)))
(assert  (not (IsWandField Wand_state_contains_for_state_contains__target_contents_2)))
(assert  (not (IsPredicateField Wand_state_contains_for_state_contains__top_2)))
(assert  (not (IsWandField Wand_state_contains_for_state_contains__top_2)))
(assert  (not (IsPredicateField Tree__data)))
(assert  (not (IsWandField Tree__data)))
(assert  (not (IsPredicateField Tree__left)))
(assert  (not (IsWandField Tree__left)))
(assert  (not (IsPredicateField Tree__right)))
(assert  (not (IsWandField Tree__right)))
(assert (forall ((Heap@@20 T@U) (ExhaleHeap@@3 T@U) (Mask@@6 T@U) ) (!  (=> (and (and (and (= (type Heap@@20) (MapType0Type RefType)) (= (type ExhaleHeap@@3) (MapType0Type RefType))) (= (type Mask@@6) (MapType1Type RefType realType))) (IdenticalOnKnownLocations Heap@@20 ExhaleHeap@@3 Mask@@6)) (succHeap Heap@@20 ExhaleHeap@@3))
 :qid |stdinbpl.83:15|
 :skolemid |10|
 :pattern ( (IdenticalOnKnownLocations Heap@@20 ExhaleHeap@@3 Mask@@6))
)))
(assert (forall ((Heap@@21 T@U) (Mask@@7 T@U) (diz@@15 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@21) (MapType0Type RefType)) (= (type Mask@@7) (MapType1Type RefType realType))) (= (type diz@@15) RefType)) (and (state Heap@@21 Mask@@7) (< AssumeFunctionsAbove 1))) (not (= diz@@15 null))) (= (Wand_state_contains_for_state_contains__get_in_1 Heap@@21 diz@@15) (MapType0Select Heap@@21 diz@@15 Wand_state_contains_for_state_contains__in_1)))
 :qid |stdinbpl.625:15|
 :skolemid |60|
 :pattern ( (state Heap@@21 Mask@@7) (Wand_state_contains_for_state_contains__get_in_1 Heap@@21 diz@@15))
 :pattern ( (state Heap@@21 Mask@@7) (|Wand_state_contains_for_state_contains__get_in_1#triggerStateless| diz@@15) (|Wand_state_contains_for_state_contains__valid_wand#trigger| Heap@@21 (Wand_state_contains_for_state_contains__valid_wand diz@@15)))
)))
(assert (forall ((Heap@@22 T@U) (Mask@@8 T@U) (diz@@16 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@22) (MapType0Type RefType)) (= (type Mask@@8) (MapType1Type RefType realType))) (= (type diz@@16) RefType)) (and (state Heap@@22 Mask@@8) (< AssumeFunctionsAbove 2))) (not (= diz@@16 null))) (= (Wand_state_contains_for_state_contains__get_in_1_0 Heap@@22 diz@@16) (MapType0Select Heap@@22 diz@@16 Wand_state_contains_for_state_contains__in_1_0)))
 :qid |stdinbpl.897:15|
 :skolemid |67|
 :pattern ( (state Heap@@22 Mask@@8) (Wand_state_contains_for_state_contains__get_in_1_0 Heap@@22 diz@@16))
 :pattern ( (state Heap@@22 Mask@@8) (|Wand_state_contains_for_state_contains__get_in_1_0#triggerStateless| diz@@16) (|Wand_state_contains_for_state_contains__valid_wand#trigger| Heap@@22 (Wand_state_contains_for_state_contains__valid_wand diz@@16)))
)))
(assert (forall ((Heap@@23 T@U) (Mask@@9 T@U) (diz@@17 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@23) (MapType0Type RefType)) (= (type Mask@@9) (MapType1Type RefType realType))) (= (type diz@@17) RefType)) (and (state Heap@@23 Mask@@9) (< AssumeFunctionsAbove 3))) (not (= diz@@17 null))) (= (Wand_state_contains_for_state_contains__get_out_1_0 Heap@@23 diz@@17) (MapType0Select Heap@@23 diz@@17 Wand_state_contains_for_state_contains__out_1_0)))
 :qid |stdinbpl.1429:15|
 :skolemid |80|
 :pattern ( (state Heap@@23 Mask@@9) (Wand_state_contains_for_state_contains__get_out_1_0 Heap@@23 diz@@17))
 :pattern ( (state Heap@@23 Mask@@9) (|Wand_state_contains_for_state_contains__get_out_1_0#triggerStateless| diz@@17) (|Wand_state_contains_for_state_contains__valid_wand#trigger| Heap@@23 (Wand_state_contains_for_state_contains__valid_wand diz@@17)))
)))
(assert (forall ((Heap@@24 T@U) (Mask@@10 T@U) (diz@@18 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@24) (MapType0Type RefType)) (= (type Mask@@10) (MapType1Type RefType realType))) (= (type diz@@18) RefType)) (and (state Heap@@24 Mask@@10) (< AssumeFunctionsAbove 4))) (not (= diz@@18 null))) (= (Wand_state_contains_for_state_contains__get_out_1 Heap@@24 diz@@18) (MapType0Select Heap@@24 diz@@18 Wand_state_contains_for_state_contains__out_1)))
 :qid |stdinbpl.1157:15|
 :skolemid |73|
 :pattern ( (state Heap@@24 Mask@@10) (Wand_state_contains_for_state_contains__get_out_1 Heap@@24 diz@@18))
 :pattern ( (state Heap@@24 Mask@@10) (|Wand_state_contains_for_state_contains__get_out_1#triggerStateless| diz@@18) (|Wand_state_contains_for_state_contains__valid_wand#trigger| Heap@@24 (Wand_state_contains_for_state_contains__valid_wand diz@@18)))
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
(assert (forall ((arg0@@54 Real) (arg1@@25 T@U) ) (! (= (type (ConditionalFrame arg0@@54 arg1@@25)) FrameTypeType)
 :qid |funType:ConditionalFrame|
 :pattern ( (ConditionalFrame arg0@@54 arg1@@25))
)))
(assert (forall ((p@@0 Real) (f_6 T@U) ) (!  (=> (= (type f_6) FrameTypeType) (= (ConditionalFrame p@@0 f_6) (ite (> p@@0 0.0) f_6 EmptyFrame)))
 :qid |stdinbpl.167:15|
 :skolemid |19|
 :pattern ( (ConditionalFrame p@@0 f_6))
)))
(assert (forall ((q@min@@0 Int) (q@max@@0 Int) (j@@3 Int) ) (!  (=> (and (<= 0 j@@3) (< j@@3 (- q@max@@0 q@min@@0))) (= (U_2_int (|Seq#Index| (|Seq#Range| q@min@@0 q@max@@0) j@@3)) (+ q@min@@0 j@@3)))
 :qid |stdinbpl.538:15|
 :skolemid |56|
 :pattern ( (|Seq#Index| (|Seq#Range| q@min@@0 q@max@@0) j@@3))
)))
(assert (forall ((arg0@@55 T@U) (arg1@@26 T@U) ) (! (= (type (|Tree__tolist#frame| arg0@@55 arg1@@26)) (SeqType intType))
 :qid |funType:Tree__tolist#frame|
 :pattern ( (|Tree__tolist#frame| arg0@@55 arg1@@26))
)))
(assert (forall ((Heap@@25 T@U) (Mask@@11 T@U) (t_1@@4 T@U) ) (!  (=> (and (and (and (= (type Heap@@25) (MapType0Type RefType)) (= (type Mask@@11) (MapType1Type RefType realType))) (= (type t_1@@4) RefType)) (state Heap@@25 Mask@@11)) (= (|Tree__tolist'| Heap@@25 t_1@@4) (|Tree__tolist#frame| (FrameFragment (ite (not (= t_1@@4 null)) (MapType0Select Heap@@25 null (Tree__state t_1@@4)) EmptyFrame)) t_1@@4)))
 :qid |stdinbpl.1696:15|
 :skolemid |87|
 :pattern ( (state Heap@@25 Mask@@11) (|Tree__tolist'| Heap@@25 t_1@@4))
 :pattern ( (state Heap@@25 Mask@@11) (|Tree__tolist#triggerStateless| t_1@@4) (|Tree__state#trigger| Heap@@25 (Tree__state t_1@@4)) (|Tree__state#trigger| Heap@@25 (Tree__state t_1@@4)))
)))
(assert (forall ((Mask@@12 T@U) (o_2@@0 T@U) (f_4@@0 T@U) ) (! (let ((B@@3 (FieldTypeInv1 (type f_4@@0))))
(let ((A@@4 (FieldTypeInv0 (type f_4@@0))))
 (=> (and (and (= (type Mask@@12) (MapType1Type RefType realType)) (= (type o_2@@0) RefType)) (= (type f_4@@0) (FieldType A@@4 B@@3))) (= (HasDirectPerm Mask@@12 o_2@@0 f_4@@0) (> (U_2_real (MapType1Select Mask@@12 o_2@@0 f_4@@0)) NoPerm)))))
 :qid |stdinbpl.133:22|
 :skolemid |17|
 :pattern ( (HasDirectPerm Mask@@12 o_2@@0 f_4@@0))
)))
(assert (forall ((s0@@0 T@U) (s1@@0 T@U) ) (! (let ((T@@16 (SeqTypeInv0 (type s0@@0))))
 (=> (and (and (= (type s0@@0) (SeqType T@@16)) (= (type s1@@0) (SeqType T@@16))) (and (not (= s0@@0 (|Seq#Empty| T@@16))) (not (= s1@@0 (|Seq#Empty| T@@16))))) (= (|Seq#Length| (|Seq#Append| s0@@0 s1@@0)) (+ (|Seq#Length| s0@@0) (|Seq#Length| s1@@0)))))
 :qid |stdinbpl.216:18|
 :skolemid |26|
 :pattern ( (|Seq#Length| (|Seq#Append| s0@@0 s1@@0)))
)))
(assert (forall ((s@@7 T@U) (t T@U) (n@@6 Int) ) (! (let ((T@@17 (SeqTypeInv0 (type s@@7))))
 (=> (and (and (= (type s@@7) (SeqType T@@17)) (= (type t) (SeqType T@@17))) (and (> n@@6 0) (> n@@6 (|Seq#Length| s@@7)))) (and (= (|Seq#Add| (|Seq#Sub| n@@6 (|Seq#Length| s@@7)) (|Seq#Length| s@@7)) n@@6) (= (|Seq#Drop| (|Seq#Append| s@@7 t) n@@6) (|Seq#Drop| t (|Seq#Sub| n@@6 (|Seq#Length| s@@7)))))))
 :qid |stdinbpl.372:18|
 :skolemid |44|
 :pattern ( (|Seq#Drop| (|Seq#Append| s@@7 t) n@@6))
)))
(assert (forall ((o_2@@1 T@U) (f_4@@1 T@U) ) (! (let ((B@@4 (FieldTypeInv1 (type f_4@@1))))
(let ((A@@5 (FieldTypeInv0 (type f_4@@1))))
 (=> (and (= (type o_2@@1) RefType) (= (type f_4@@1) (FieldType A@@5 B@@4))) (= (U_2_real (MapType1Select ZeroMask o_2@@1 f_4@@1)) NoPerm))))
 :qid |stdinbpl.106:22|
 :skolemid |13|
 :pattern ( (MapType1Select ZeroMask o_2@@1 f_4@@1))
)))
(assert (forall ((s@@8 T@U) (t@@0 T@U) (n@@7 Int) ) (! (let ((T@@18 (SeqTypeInv0 (type s@@8))))
 (=> (and (and (= (type s@@8) (SeqType T@@18)) (= (type t@@0) (SeqType T@@18))) (and (> n@@7 0) (> n@@7 (|Seq#Length| s@@8)))) (and (= (|Seq#Add| (|Seq#Sub| n@@7 (|Seq#Length| s@@8)) (|Seq#Length| s@@8)) n@@7) (= (|Seq#Take| (|Seq#Append| s@@8 t@@0) n@@7) (|Seq#Append| s@@8 (|Seq#Take| t@@0 (|Seq#Sub| n@@7 (|Seq#Length| s@@8))))))))
 :qid |stdinbpl.359:18|
 :skolemid |42|
 :pattern ( (|Seq#Take| (|Seq#Append| s@@8 t@@0) n@@7))
)))
(assert (forall ((q@min@@1 Int) (q@max@@1 Int) ) (!  (and (=> (< q@min@@1 q@max@@1) (= (|Seq#Length| (|Seq#Range| q@min@@1 q@max@@1)) (- q@max@@1 q@min@@1))) (=> (<= q@max@@1 q@min@@1) (= (|Seq#Length| (|Seq#Range| q@min@@1 q@max@@1)) 0)))
 :qid |stdinbpl.537:15|
 :skolemid |55|
 :pattern ( (|Seq#Length| (|Seq#Range| q@min@@1 q@max@@1)))
)))
(assert (forall ((Heap@@26 T@U) (Mask@@13 T@U) (diz@@19 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@26) (MapType0Type RefType)) (= (type Mask@@13) (MapType1Type RefType realType))) (= (type diz@@19) RefType)) (and (state Heap@@26 Mask@@13) (or (< AssumeFunctionsAbove 1) (|Wand_state_contains_for_state_contains__get_in_1#trigger| (MapType0Select Heap@@26 null (Wand_state_contains_for_state_contains__valid_wand diz@@19)) diz@@19)))) (not (= diz@@19 null))) (not (= (|Wand_state_contains_for_state_contains__get_in_1'| Heap@@26 diz@@19) null)))
 :qid |stdinbpl.638:15|
 :skolemid |62|
 :pattern ( (state Heap@@26 Mask@@13) (|Wand_state_contains_for_state_contains__get_in_1'| Heap@@26 diz@@19))
)))
(assert (forall ((Heap@@27 T@U) (Mask@@14 T@U) (diz@@20 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@27) (MapType0Type RefType)) (= (type Mask@@14) (MapType1Type RefType realType))) (= (type diz@@20) RefType)) (and (state Heap@@27 Mask@@14) (or (< AssumeFunctionsAbove 4) (|Wand_state_contains_for_state_contains__get_out_1#trigger| (MapType0Select Heap@@27 null (Wand_state_contains_for_state_contains__valid_wand diz@@20)) diz@@20)))) (not (= diz@@20 null))) (not (= (|Wand_state_contains_for_state_contains__get_out_1'| Heap@@27 diz@@20) null)))
 :qid |stdinbpl.1170:15|
 :skolemid |75|
 :pattern ( (state Heap@@27 Mask@@14) (|Wand_state_contains_for_state_contains__get_out_1'| Heap@@27 diz@@20))
)))
(assert (forall ((a T@U) (b T@U) ) (! (let ((T@@19 (SeqTypeInv0 (type a))))
 (=> (and (and (= (type a) (SeqType T@@19)) (= (type b) (SeqType T@@19))) (|Seq#Equal| a b)) (= a b)))
 :qid |stdinbpl.510:18|
 :skolemid |53|
 :pattern ( (|Seq#Equal| a b))
)))
(assert (forall ((Heap@@28 T@U) (Mask@@15 T@U) (s@@9 T@U) ) (!  (=> (and (and (and (= (type Heap@@28) (MapType0Type RefType)) (= (type Mask@@15) (MapType1Type RefType realType))) (= (type s@@9) (SeqType intType))) (state Heap@@28 Mask@@15)) (= (|Tree__sorted_list'| Heap@@28 s@@9) (|Tree__sorted_list#frame| EmptyFrame s@@9)))
 :qid |stdinbpl.1884:15|
 :skolemid |94|
 :pattern ( (state Heap@@28 Mask@@15) (|Tree__sorted_list'| Heap@@28 s@@9))
)))
(assert (forall ((s@@10 T@U) (i@@2 Int) ) (! (let ((T@@20 (SeqTypeInv0 (type s@@10))))
 (=> (= (type s@@10) (SeqType T@@20)) (=> (and (<= 0 i@@2) (< i@@2 (|Seq#Length| s@@10))) (|Seq#ContainsTrigger| s@@10 (|Seq#Index| s@@10 i@@2)))))
 :qid |stdinbpl.403:18|
 :skolemid |49|
 :pattern ( (|Seq#Index| s@@10 i@@2))
)))
(assert (forall ((s0@@1 T@U) (s1@@1 T@U) ) (! (let ((T@@21 (SeqTypeInv0 (type s0@@1))))
 (=> (and (= (type s0@@1) (SeqType T@@21)) (= (type s1@@1) (SeqType T@@21))) (and (=> (= s0@@1 (|Seq#Empty| T@@21)) (= (|Seq#Append| s0@@1 s1@@1) s1@@1)) (=> (= s1@@1 (|Seq#Empty| T@@21)) (= (|Seq#Append| s0@@1 s1@@1) s0@@1)))))
 :qid |stdinbpl.222:18|
 :skolemid |27|
 :pattern ( (|Seq#Append| s0@@1 s1@@1))
)))
(assert (forall ((t@@1 T@U) ) (! (= (|Seq#Index| (|Seq#Singleton| t@@1) 0) t@@1)
 :qid |stdinbpl.226:18|
 :skolemid |28|
 :pattern ( (|Seq#Singleton| t@@1))
)))
(assert (forall ((s@@11 T@U) ) (! (let ((T@@22 (SeqTypeInv0 (type s@@11))))
 (=> (= (type s@@11) (SeqType T@@22)) (<= 0 (|Seq#Length| s@@11))))
 :qid |stdinbpl.205:18|
 :skolemid |22|
 :pattern ( (|Seq#Length| s@@11))
)))
(assert (forall ((Heap@@29 T@U) (s@@12 T@U) ) (!  (=> (and (= (type Heap@@29) (MapType0Type RefType)) (= (type s@@12) (SeqType intType))) (and (= (Tree__sorted_list Heap@@29 s@@12) (|Tree__sorted_list'| Heap@@29 s@@12)) (dummyFunction (bool_2_U (|Tree__sorted_list#triggerStateless| s@@12)))))
 :qid |stdinbpl.1864:15|
 :skolemid |90|
 :pattern ( (Tree__sorted_list Heap@@29 s@@12))
)))
(assert (forall ((Heap@@30 T@U) (t_1@@5 T@U) ) (!  (=> (and (= (type Heap@@30) (MapType0Type RefType)) (= (type t_1@@5) RefType)) (and (= (Tree__sorted Heap@@30 t_1@@5) (|Tree__sorted'| Heap@@30 t_1@@5)) (dummyFunction (bool_2_U (|Tree__sorted#triggerStateless| t_1@@5)))))
 :qid |stdinbpl.1938:15|
 :skolemid |96|
 :pattern ( (Tree__sorted Heap@@30 t_1@@5))
)))
(assert (forall ((s0@@2 T@U) (s1@@2 T@U) ) (! (let ((T@@23 (SeqTypeInv0 (type s0@@2))))
 (=> (and (and (= (type s0@@2) (SeqType T@@23)) (= (type s1@@2) (SeqType T@@23))) (|Seq#Equal| s0@@2 s1@@2)) (and (= (|Seq#Length| s0@@2) (|Seq#Length| s1@@2)) (forall ((j@@4 Int) ) (!  (=> (and (<= 0 j@@4) (< j@@4 (|Seq#Length| s0@@2))) (= (|Seq#Index| s0@@2 j@@4) (|Seq#Index| s1@@2 j@@4)))
 :qid |stdinbpl.500:13|
 :skolemid |50|
 :pattern ( (|Seq#Index| s0@@2 j@@4))
 :pattern ( (|Seq#Index| s1@@2 j@@4))
)))))
 :qid |stdinbpl.497:18|
 :skolemid |51|
 :pattern ( (|Seq#Equal| s0@@2 s1@@2))
)))
(assert (forall ((Heap@@31 T@U) (ExhaleHeap@@4 T@U) (Mask@@16 T@U) (pm_f@@1 T@U) ) (! (let ((C@@1 (FieldTypeInv0 (type pm_f@@1))))
 (=> (and (and (and (and (and (= (type Heap@@31) (MapType0Type RefType)) (= (type ExhaleHeap@@4) (MapType0Type RefType))) (= (type Mask@@16) (MapType1Type RefType realType))) (= (type pm_f@@1) (FieldType C@@1 FrameTypeType))) (IdenticalOnKnownLocations Heap@@31 ExhaleHeap@@4 Mask@@16)) (and (HasDirectPerm Mask@@16 null pm_f@@1) (IsPredicateField pm_f@@1))) (forall ((o2 T@U) (f_2@@0 T@U) ) (! (let ((B@@5 (FieldTypeInv1 (type f_2@@0))))
(let ((A@@6 (FieldTypeInv0 (type f_2@@0))))
 (=> (and (and (= (type o2) RefType) (= (type f_2@@0) (FieldType A@@6 B@@5))) (U_2_bool (MapType1Select (MapType0Select Heap@@31 null (PredicateMaskField pm_f@@1)) o2 f_2@@0))) (= (MapType0Select Heap@@31 o2 f_2@@0) (MapType0Select ExhaleHeap@@4 o2 f_2@@0)))))
 :qid |stdinbpl.54:134|
 :skolemid |3|
 :pattern ( (MapType0Select ExhaleHeap@@4 o2 f_2@@0))
))))
 :qid |stdinbpl.52:19|
 :skolemid |4|
 :pattern ( (IdenticalOnKnownLocations Heap@@31 ExhaleHeap@@4 Mask@@16) (IsPredicateField pm_f@@1))
)))
(assert (forall ((Heap@@32 T@U) (ExhaleHeap@@5 T@U) (Mask@@17 T@U) (pm_f@@2 T@U) ) (! (let ((C@@2 (FieldTypeInv0 (type pm_f@@2))))
 (=> (and (and (and (and (and (= (type Heap@@32) (MapType0Type RefType)) (= (type ExhaleHeap@@5) (MapType0Type RefType))) (= (type Mask@@17) (MapType1Type RefType realType))) (= (type pm_f@@2) (FieldType C@@2 FrameTypeType))) (IdenticalOnKnownLocations Heap@@32 ExhaleHeap@@5 Mask@@17)) (and (HasDirectPerm Mask@@17 null pm_f@@2) (IsWandField pm_f@@2))) (forall ((o2@@0 T@U) (f_2@@1 T@U) ) (! (let ((B@@6 (FieldTypeInv1 (type f_2@@1))))
(let ((A@@7 (FieldTypeInv0 (type f_2@@1))))
 (=> (and (and (= (type o2@@0) RefType) (= (type f_2@@1) (FieldType A@@7 B@@6))) (U_2_bool (MapType1Select (MapType0Select Heap@@32 null (WandMaskField pm_f@@2)) o2@@0 f_2@@1))) (= (MapType0Select Heap@@32 o2@@0 f_2@@1) (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1)))))
 :qid |stdinbpl.67:129|
 :skolemid |6|
 :pattern ( (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1))
))))
 :qid |stdinbpl.65:19|
 :skolemid |7|
 :pattern ( (IdenticalOnKnownLocations Heap@@32 ExhaleHeap@@5 Mask@@17) (IsWandField pm_f@@2))
)))
(assert (forall ((diz@@21 T@U) ) (!  (=> (= (type diz@@21) RefType) (= (getPredWandId (Wand_state_contains_for_state_contains__valid_wand diz@@21)) 0))
 :qid |stdinbpl.2035:15|
 :skolemid |102|
 :pattern ( (Wand_state_contains_for_state_contains__valid_wand diz@@21))
)))
(assert (forall ((diz@@22 T@U) ) (!  (=> (= (type diz@@22) RefType) (= (getPredWandId (Tree__state diz@@22)) 1))
 :qid |stdinbpl.2482:15|
 :skolemid |108|
 :pattern ( (Tree__state diz@@22))
)))
(assert (forall ((t@@2 T@U) ) (! (= (|Seq#Length| (|Seq#Singleton| t@@2)) 1)
 :qid |stdinbpl.213:18|
 :skolemid |25|
 :pattern ( (|Seq#Singleton| t@@2))
)))
(assert (forall ((Mask@@18 T@U) (o_2@@2 T@U) (f_4@@2 T@U) ) (! (let ((B@@7 (FieldTypeInv1 (type f_4@@2))))
(let ((A@@8 (FieldTypeInv0 (type f_4@@2))))
 (=> (and (and (and (= (type Mask@@18) (MapType1Type RefType realType)) (= (type o_2@@2) RefType)) (= (type f_4@@2) (FieldType A@@8 B@@7))) (GoodMask Mask@@18)) (and (>= (U_2_real (MapType1Select Mask@@18 o_2@@2 f_4@@2)) NoPerm) (=> (and (and (GoodMask Mask@@18) (not (IsPredicateField f_4@@2))) (not (IsWandField f_4@@2))) (<= (U_2_real (MapType1Select Mask@@18 o_2@@2 f_4@@2)) FullPerm))))))
 :qid |stdinbpl.128:22|
 :skolemid |16|
 :pattern ( (GoodMask Mask@@18) (MapType1Select Mask@@18 o_2@@2 f_4@@2))
)))
(assert (forall ((arg0@@56 T@U) (arg1@@27 T@U) ) (! (= (type (|Wand_state_contains_for_state_contains__get_in_1#frame| arg0@@56 arg1@@27)) RefType)
 :qid |funType:Wand_state_contains_for_state_contains__get_in_1#frame|
 :pattern ( (|Wand_state_contains_for_state_contains__get_in_1#frame| arg0@@56 arg1@@27))
)))
(assert (forall ((Heap@@33 T@U) (Mask@@19 T@U) (diz@@23 T@U) ) (!  (=> (and (and (and (= (type Heap@@33) (MapType0Type RefType)) (= (type Mask@@19) (MapType1Type RefType realType))) (= (type diz@@23) RefType)) (state Heap@@33 Mask@@19)) (= (|Wand_state_contains_for_state_contains__get_in_1'| Heap@@33 diz@@23) (|Wand_state_contains_for_state_contains__get_in_1#frame| (MapType0Select Heap@@33 null (Wand_state_contains_for_state_contains__valid_wand diz@@23)) diz@@23)))
 :qid |stdinbpl.632:15|
 :skolemid |61|
 :pattern ( (state Heap@@33 Mask@@19) (|Wand_state_contains_for_state_contains__get_in_1'| Heap@@33 diz@@23))
)))
(assert (forall ((arg0@@57 T@U) (arg1@@28 T@U) ) (! (= (type (|Wand_state_contains_for_state_contains__get_in_1_0#frame| arg0@@57 arg1@@28)) (SeqType intType))
 :qid |funType:Wand_state_contains_for_state_contains__get_in_1_0#frame|
 :pattern ( (|Wand_state_contains_for_state_contains__get_in_1_0#frame| arg0@@57 arg1@@28))
)))
(assert (forall ((Heap@@34 T@U) (Mask@@20 T@U) (diz@@24 T@U) ) (!  (=> (and (and (and (= (type Heap@@34) (MapType0Type RefType)) (= (type Mask@@20) (MapType1Type RefType realType))) (= (type diz@@24) RefType)) (state Heap@@34 Mask@@20)) (= (|Wand_state_contains_for_state_contains__get_in_1_0'| Heap@@34 diz@@24) (|Wand_state_contains_for_state_contains__get_in_1_0#frame| (MapType0Select Heap@@34 null (Wand_state_contains_for_state_contains__valid_wand diz@@24)) diz@@24)))
 :qid |stdinbpl.904:15|
 :skolemid |68|
 :pattern ( (state Heap@@34 Mask@@20) (|Wand_state_contains_for_state_contains__get_in_1_0'| Heap@@34 diz@@24))
)))
(assert (forall ((arg0@@58 T@U) (arg1@@29 T@U) ) (! (= (type (|Wand_state_contains_for_state_contains__get_out_1#frame| arg0@@58 arg1@@29)) RefType)
 :qid |funType:Wand_state_contains_for_state_contains__get_out_1#frame|
 :pattern ( (|Wand_state_contains_for_state_contains__get_out_1#frame| arg0@@58 arg1@@29))
)))
(assert (forall ((Heap@@35 T@U) (Mask@@21 T@U) (diz@@25 T@U) ) (!  (=> (and (and (and (= (type Heap@@35) (MapType0Type RefType)) (= (type Mask@@21) (MapType1Type RefType realType))) (= (type diz@@25) RefType)) (state Heap@@35 Mask@@21)) (= (|Wand_state_contains_for_state_contains__get_out_1'| Heap@@35 diz@@25) (|Wand_state_contains_for_state_contains__get_out_1#frame| (MapType0Select Heap@@35 null (Wand_state_contains_for_state_contains__valid_wand diz@@25)) diz@@25)))
 :qid |stdinbpl.1164:15|
 :skolemid |74|
 :pattern ( (state Heap@@35 Mask@@21) (|Wand_state_contains_for_state_contains__get_out_1'| Heap@@35 diz@@25))
)))
(assert (forall ((arg0@@59 T@U) (arg1@@30 T@U) ) (! (= (type (|Wand_state_contains_for_state_contains__get_out_1_0#frame| arg0@@59 arg1@@30)) (SeqType intType))
 :qid |funType:Wand_state_contains_for_state_contains__get_out_1_0#frame|
 :pattern ( (|Wand_state_contains_for_state_contains__get_out_1_0#frame| arg0@@59 arg1@@30))
)))
(assert (forall ((Heap@@36 T@U) (Mask@@22 T@U) (diz@@26 T@U) ) (!  (=> (and (and (and (= (type Heap@@36) (MapType0Type RefType)) (= (type Mask@@22) (MapType1Type RefType realType))) (= (type diz@@26) RefType)) (state Heap@@36 Mask@@22)) (= (|Wand_state_contains_for_state_contains__get_out_1_0'| Heap@@36 diz@@26) (|Wand_state_contains_for_state_contains__get_out_1_0#frame| (MapType0Select Heap@@36 null (Wand_state_contains_for_state_contains__valid_wand diz@@26)) diz@@26)))
 :qid |stdinbpl.1436:15|
 :skolemid |81|
 :pattern ( (state Heap@@36 Mask@@22) (|Wand_state_contains_for_state_contains__get_out_1_0'| Heap@@36 diz@@26))
)))
(assert (forall ((o T@U) (f T@U) (Heap@@37 T@U) ) (!  (=> (and (and (and (= (type o) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap@@37) (MapType0Type RefType))) (U_2_bool (MapType0Select Heap@@37 o $allocated))) (U_2_bool (MapType0Select Heap@@37 (MapType0Select Heap@@37 o f) $allocated)))
 :qid |stdinbpl.31:15|
 :skolemid |0|
 :pattern ( (MapType0Select Heap@@37 o f))
)))
(assert (forall ((s@@13 T@U) (t@@3 T@U) (n@@8 Int) ) (! (let ((T@@24 (SeqTypeInv0 (type s@@13))))
 (=> (and (and (= (type s@@13) (SeqType T@@24)) (= (type t@@3) (SeqType T@@24))) (and (< 0 n@@8) (<= n@@8 (|Seq#Length| s@@13)))) (= (|Seq#Take| (|Seq#Append| s@@13 t@@3) n@@8) (|Seq#Take| s@@13 n@@8))))
 :qid |stdinbpl.355:18|
 :skolemid |41|
 :pattern ( (|Seq#Take| (|Seq#Append| s@@13 t@@3) n@@8))
)))
(assert (forall ((s@@14 T@U) (i@@3 Int) (v@@1 T@U) ) (! (let ((T@@25 (type v@@1)))
 (=> (= (type s@@14) (SeqType T@@25)) (=> (and (<= 0 i@@3) (< i@@3 (|Seq#Length| s@@14))) (= (|Seq#Length| (|Seq#Update| s@@14 i@@3 v@@1)) (|Seq#Length| s@@14)))))
 :qid |stdinbpl.254:18|
 :skolemid |34|
 :pattern ( (|Seq#Length| (|Seq#Update| s@@14 i@@3 v@@1)))
 :pattern ( (|Seq#Length| s@@14) (|Seq#Update| s@@14 i@@3 v@@1))
)))
(assert (forall ((diz@@27 T@U) ) (!  (=> (= (type diz@@27) RefType) (= (PredicateMaskField (Wand_state_contains_for_state_contains__valid_wand diz@@27)) (|Wand_state_contains_for_state_contains__valid_wand#sm| diz@@27)))
 :qid |stdinbpl.2027:15|
 :skolemid |100|
 :pattern ( (PredicateMaskField (Wand_state_contains_for_state_contains__valid_wand diz@@27)))
)))
(assert (forall ((diz@@28 T@U) ) (!  (=> (= (type diz@@28) RefType) (= (PredicateMaskField (Tree__state diz@@28)) (|Tree__state#sm| diz@@28)))
 :qid |stdinbpl.2474:15|
 :skolemid |106|
 :pattern ( (PredicateMaskField (Tree__state diz@@28)))
)))
(assert (forall ((s@@15 T@U) (t@@4 T@U) (n@@9 Int) ) (! (let ((T@@26 (SeqTypeInv0 (type s@@15))))
 (=> (and (and (= (type s@@15) (SeqType T@@26)) (= (type t@@4) (SeqType T@@26))) (and (< 0 n@@9) (<= n@@9 (|Seq#Length| s@@15)))) (= (|Seq#Drop| (|Seq#Append| s@@15 t@@4) n@@9) (|Seq#Append| (|Seq#Drop| s@@15 n@@9) t@@4))))
 :qid |stdinbpl.368:18|
 :skolemid |43|
 :pattern ( (|Seq#Drop| (|Seq#Append| s@@15 t@@4) n@@9))
)))
(assert (forall ((s@@16 T@U) (n@@10 Int) (i@@4 Int) ) (! (let ((T@@27 (SeqTypeInv0 (type s@@16))))
 (=> (= (type s@@16) (SeqType T@@27)) (=> (and (and (< 0 n@@10) (<= n@@10 i@@4)) (< i@@4 (|Seq#Length| s@@16))) (and (= (|Seq#Add| (|Seq#Sub| i@@4 n@@10) n@@10) i@@4) (= (|Seq#Index| (|Seq#Drop| s@@16 n@@10) (|Seq#Sub| i@@4 n@@10)) (|Seq#Index| s@@16 i@@4))))))
 :qid |stdinbpl.305:18|
 :skolemid |40|
 :pattern ( (|Seq#Drop| s@@16 n@@10) (|Seq#Index| s@@16 i@@4))
)))
(assert (forall ((s0@@3 T@U) (s1@@3 T@U) (n@@11 Int) ) (! (let ((T@@28 (SeqTypeInv0 (type s0@@3))))
 (=> (and (= (type s0@@3) (SeqType T@@28)) (= (type s1@@3) (SeqType T@@28))) (=> (and (and (and (not (= s0@@3 (|Seq#Empty| T@@28))) (not (= s1@@3 (|Seq#Empty| T@@28)))) (<= 0 n@@11)) (< n@@11 (|Seq#Length| s0@@3))) (= (|Seq#Index| (|Seq#Append| s0@@3 s1@@3) n@@11) (|Seq#Index| s0@@3 n@@11)))))
 :qid |stdinbpl.245:18|
 :skolemid |31|
 :pattern ( (|Seq#Index| (|Seq#Append| s0@@3 s1@@3) n@@11))
 :pattern ( (|Seq#Index| s0@@3 n@@11) (|Seq#Append| s0@@3 s1@@3))
)))
(assert (forall ((Heap@@38 T@U) (o@@0 T@U) (f_3 T@U) (v@@2 T@U) ) (! (let ((B@@8 (type v@@2)))
(let ((A@@9 (FieldTypeInv0 (type f_3))))
 (=> (and (and (= (type Heap@@38) (MapType0Type RefType)) (= (type o@@0) RefType)) (= (type f_3) (FieldType A@@9 B@@8))) (succHeap Heap@@38 (MapType0Store Heap@@38 o@@0 f_3 v@@2)))))
 :qid |stdinbpl.78:22|
 :skolemid |9|
 :pattern ( (MapType0Store Heap@@38 o@@0 f_3 v@@2))
)))
(assert (forall ((Heap@@39 T@U) (Mask@@23 T@U) (s@@17 T@U) ) (!  (=> (and (and (and (= (type Heap@@39) (MapType0Type RefType)) (= (type Mask@@23) (MapType1Type RefType realType))) (= (type s@@17) (SeqType intType))) (and (state Heap@@39 Mask@@23) (< AssumeFunctionsAbove 5))) (= (Tree__sorted_list Heap@@39 s@@17) (forall ((i@@5 Int) (j@@5 Int) ) (!  (=> (and (<= 1 i@@5) (and (< i@@5 j@@5) (< j@@5 (|Seq#Length| s@@17)))) (<= (U_2_int (|Seq#Index| s@@17 i@@5)) (U_2_int (|Seq#Index| s@@17 j@@5))))
 :qid |stdinbpl.1876:91|
 :skolemid |92|
 :pattern ( (|Seq#Index| s@@17 i@@5) (|Seq#Index| s@@17 j@@5))
))))
 :qid |stdinbpl.1874:15|
 :skolemid |93|
 :pattern ( (state Heap@@39 Mask@@23) (Tree__sorted_list Heap@@39 s@@17))
)))
(assert (forall ((s0@@4 T@U) (s1@@4 T@U) (m@@7 Int) ) (! (let ((T@@29 (SeqTypeInv0 (type s0@@4))))
 (=> (and (= (type s0@@4) (SeqType T@@29)) (= (type s1@@4) (SeqType T@@29))) (=> (and (and (and (not (= s0@@4 (|Seq#Empty| T@@29))) (not (= s1@@4 (|Seq#Empty| T@@29)))) (<= 0 m@@7)) (< m@@7 (|Seq#Length| s1@@4))) (and (= (|Seq#Sub| (|Seq#Add| m@@7 (|Seq#Length| s0@@4)) (|Seq#Length| s0@@4)) m@@7) (= (|Seq#Index| (|Seq#Append| s0@@4 s1@@4) (|Seq#Add| m@@7 (|Seq#Length| s0@@4))) (|Seq#Index| s1@@4 m@@7))))))
 :qid |stdinbpl.250:18|
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
(assert (forall ((s@@18 T@U) (x@@10 T@U) (i@@6 Int) ) (! (let ((T@@30 (type x@@10)))
 (=> (= (type s@@18) (SeqType T@@30)) (=> (and (and (<= 0 i@@6) (< i@@6 (|Seq#Length| s@@18))) (= (|Seq#Index| s@@18 i@@6) x@@10)) (|Seq#Contains| s@@18 x@@10))))
 :qid |stdinbpl.401:18|
 :skolemid |48|
 :pattern ( (|Seq#Contains| s@@18 x@@10) (|Seq#Index| s@@18 i@@6))
)))
(assert (forall ((s0@@5 T@U) (s1@@5 T@U) ) (! (let ((T@@31 (SeqTypeInv0 (type s0@@5))))
 (=> (and (= (type s0@@5) (SeqType T@@31)) (= (type s1@@5) (SeqType T@@31))) (or (or (and (= s0@@5 s1@@5) (|Seq#Equal| s0@@5 s1@@5)) (and (and (not (= s0@@5 s1@@5)) (not (|Seq#Equal| s0@@5 s1@@5))) (not (= (|Seq#Length| s0@@5) (|Seq#Length| s1@@5))))) (and (and (and (and (and (and (not (= s0@@5 s1@@5)) (not (|Seq#Equal| s0@@5 s1@@5))) (= (|Seq#Length| s0@@5) (|Seq#Length| s1@@5))) (= (|Seq#SkolemDiff| s0@@5 s1@@5) (|Seq#SkolemDiff| s1@@5 s0@@5))) (<= 0 (|Seq#SkolemDiff| s0@@5 s1@@5))) (< (|Seq#SkolemDiff| s0@@5 s1@@5) (|Seq#Length| s0@@5))) (not (= (|Seq#Index| s0@@5 (|Seq#SkolemDiff| s0@@5 s1@@5)) (|Seq#Index| s1@@5 (|Seq#SkolemDiff| s0@@5 s1@@5))))))))
 :qid |stdinbpl.505:18|
 :skolemid |52|
 :pattern ( (|Seq#Equal| s0@@5 s1@@5))
)))
(assert (forall ((p@@1 T@U) (v_1@@0 T@U) (q T@U) (w@@0 T@U) (r T@U) (u T@U) ) (! (let ((C@@3 (FieldTypeInv0 (type r))))
(let ((B@@10 (FieldTypeInv0 (type q))))
(let ((A@@11 (FieldTypeInv0 (type p@@1))))
 (=> (and (and (and (and (and (and (= (type p@@1) (FieldType A@@11 FrameTypeType)) (= (type v_1@@0) FrameTypeType)) (= (type q) (FieldType B@@10 FrameTypeType))) (= (type w@@0) FrameTypeType)) (= (type r) (FieldType C@@3 FrameTypeType))) (= (type u) FrameTypeType)) (and (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))) (InsidePredicate p@@1 v_1@@0 r u)))))
 :qid |stdinbpl.174:25|
 :skolemid |20|
 :pattern ( (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))
)))
(assert (forall ((s@@19 T@U) ) (! (let ((T@@32 (SeqTypeInv0 (type s@@19))))
 (=> (and (= (type s@@19) (SeqType T@@32)) (= (|Seq#Length| s@@19) 0)) (= s@@19 (|Seq#Empty| T@@32))))
 :qid |stdinbpl.209:18|
 :skolemid |24|
 :pattern ( (|Seq#Length| s@@19))
)))
(assert (forall ((s@@20 T@U) (n@@12 Int) ) (! (let ((T@@33 (SeqTypeInv0 (type s@@20))))
 (=> (and (= (type s@@20) (SeqType T@@33)) (<= n@@12 0)) (= (|Seq#Take| s@@20 n@@12) (|Seq#Empty| T@@33))))
 :qid |stdinbpl.384:18|
 :skolemid |46|
 :pattern ( (|Seq#Take| s@@20 n@@12))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
(assert (forall ((Heap@@40 T@U) (Mask@@24 T@U) (t_1@@6 T@U) ) (!  (=> (and (and (and (= (type Heap@@40) (MapType0Type RefType)) (= (type Mask@@24) (MapType1Type RefType realType))) (= (type t_1@@6) RefType)) (and (state Heap@@40 Mask@@24) (< AssumeFunctionsAbove 0))) (= (Tree__sorted Heap@@40 t_1@@6) (Tree__sorted_list Heap@@40 (Tree__tolist Heap@@40 t_1@@6))))
 :qid |stdinbpl.1948:15|
 :skolemid |98|
 :pattern ( (state Heap@@40 Mask@@24) (Tree__sorted Heap@@40 t_1@@6))
)))
(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun Mask@0 () T@U)
(declare-fun diz@@29 () T@U)
(declare-fun Mask@1 () T@U)
(declare-fun PostMask@1 () T@U)
(declare-fun PostMask@0 () T@U)
(declare-fun Heap@@41 () T@U)
(declare-fun PostMask@2 () T@U)
(declare-fun PostHeap@0 () T@U)
(declare-fun ExhaleWellDef0Mask@2 () T@U)
(declare-fun Mask@37 () T@U)
(declare-fun ExhaleWellDef0Mask@3 () T@U)
(declare-fun ExhaleHeap@2 () T@U)
(declare-fun AssertMask@2 () T@U)
(declare-fun Mask@36 () T@U)
(declare-fun Mask@35 () T@U)
(declare-fun Heap@11 () T@U)
(declare-fun arg_diz@0 () T@U)
(declare-fun Mask@34 () T@U)
(declare-fun current_thread_id () Int)
(declare-fun ExhaleWellDef0Mask@4 () T@U)
(declare-fun ExhaleWellDef0Mask@5 () T@U)
(declare-fun AssertMask@1 () T@U)
(declare-fun Heap@9 () T@U)
(declare-fun newPMask@1 () T@U)
(declare-fun Heap@10 () T@U)
(declare-fun Heap@7 () T@U)
(declare-fun newPMask@0 () T@U)
(declare-fun Heap@8 () T@U)
(declare-fun Heap@5 () T@U)
(declare-fun Heap@4 () T@U)
(declare-fun Heap@6 () T@U)
(declare-fun Heap@1 () T@U)
(declare-fun Heap@2 () T@U)
(declare-fun Heap@3 () T@U)
(declare-fun freshVersion@0 () T@U)
(declare-fun Mask@33 () T@U)
(declare-fun CombineFrames (T@U T@U) T@U)
(declare-fun Mask@32 () T@U)
(declare-fun Mask@31 () T@U)
(declare-fun Mask@30 () T@U)
(declare-fun Mask@29 () T@U)
(declare-fun Mask@28 () T@U)
(declare-fun Mask@27 () T@U)
(declare-fun Mask@25 () T@U)
(declare-fun ExhaleWellDef0Mask@0 () T@U)
(declare-fun ExhaleWellDef0Mask@1 () T@U)
(declare-fun AssertMask@0 () T@U)
(declare-fun Mask@26 () T@U)
(declare-fun wildcard@13 () Real)
(declare-fun Mask@23 () T@U)
(declare-fun Mask@22 () T@U)
(declare-fun wildcard@14 () Real)
(declare-fun Mask@24 () T@U)
(declare-fun wildcard@15 () Real)
(declare-fun Mask@20 () T@U)
(declare-fun Mask@21 () T@U)
(declare-fun Mask@18 () T@U)
(declare-fun Mask@19 () T@U)
(declare-fun Mask@16 () T@U)
(declare-fun Mask@15 () T@U)
(declare-fun Mask@17 () T@U)
(declare-fun wildcard@0 () Real)
(declare-fun Mask@3 () T@U)
(declare-fun Mask@2 () T@U)
(declare-fun wildcard@1 () Real)
(declare-fun Mask@4 () T@U)
(declare-fun wildcard@2 () Real)
(declare-fun Mask@5 () T@U)
(declare-fun wildcard@3 () Real)
(declare-fun Mask@6 () T@U)
(declare-fun wildcard@4 () Real)
(declare-fun Mask@7 () T@U)
(declare-fun wildcard@5 () Real)
(declare-fun Mask@8 () T@U)
(declare-fun wildcard@6 () Real)
(declare-fun Mask@9 () T@U)
(declare-fun wildcard@7 () Real)
(declare-fun Mask@10 () T@U)
(declare-fun wildcard@8 () Real)
(declare-fun Mask@11 () T@U)
(declare-fun wildcard@9 () Real)
(declare-fun Mask@12 () T@U)
(declare-fun wildcard@10 () Real)
(declare-fun Mask@13 () T@U)
(declare-fun wildcard@11 () Real)
(declare-fun Mask@14 () T@U)
(declare-fun wildcard@12 () Real)
(declare-fun Heap@0 () T@U)
(declare-fun newVersion@0 () T@U)
(declare-fun Mask@40 () T@U)
(declare-fun Mask@41 () T@U)
(declare-fun wildcard () Real)
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (= (type Heap@@41) (MapType0Type RefType)) (= (type diz@@29) RefType)) (= (type Mask@41) (MapType1Type RefType realType))) (= (type Mask@1) (MapType1Type RefType realType))) (= (type Mask@40) (MapType1Type RefType realType))) (= (type Mask@26) (MapType1Type RefType realType))) (= (type Mask@25) (MapType1Type RefType realType))) (= (type Heap@1) (MapType0Type RefType))) (= (type ExhaleWellDef0Mask@1) (MapType1Type RefType realType))) (= (type ExhaleWellDef0Mask@0) (MapType1Type RefType realType))) (= (type AssertMask@0) (MapType1Type RefType realType))) (= (type Heap@11) (MapType0Type RefType))) (= (type ExhaleWellDef0Mask@5) (MapType1Type RefType realType))) (= (type Mask@34) (MapType1Type RefType realType))) (= (type ExhaleWellDef0Mask@4) (MapType1Type RefType realType))) (= (type ExhaleHeap@2) (MapType0Type RefType))) (= (type ExhaleWellDef0Mask@3) (MapType1Type RefType realType))) (= (type Mask@37) (MapType1Type RefType realType))) (= (type ExhaleWellDef0Mask@2) (MapType1Type RefType realType))) (= (type AssertMask@2) (MapType1Type RefType realType))) (= (type Mask@36) (MapType1Type RefType realType))) (= (type Mask@35) (MapType1Type RefType realType))) (= (type arg_diz@0) RefType)) (= (type AssertMask@1) (MapType1Type RefType realType))) (= (type Heap@9) (MapType0Type RefType))) (= (type newPMask@1) (MapType1Type RefType boolType))) (= (type Heap@10) (MapType0Type RefType))) (= (type Heap@7) (MapType0Type RefType))) (= (type newPMask@0) (MapType1Type RefType boolType))) (= (type Heap@8) (MapType0Type RefType))) (= (type Heap@5) (MapType0Type RefType))) (= (type Heap@4) (MapType0Type RefType))) (= (type Heap@6) (MapType0Type RefType))) (= (type Heap@2) (MapType0Type RefType))) (= (type Heap@3) (MapType0Type RefType))) (= (type freshVersion@0) FrameTypeType)) (= (type Mask@33) (MapType1Type RefType realType))) (forall ((arg0@@60 T@U) (arg1@@31 T@U) ) (! (= (type (CombineFrames arg0@@60 arg1@@31)) FrameTypeType)
 :qid |funType:CombineFrames|
 :pattern ( (CombineFrames arg0@@60 arg1@@31))
))) (= (type Mask@31) (MapType1Type RefType realType))) (= (type Mask@32) (MapType1Type RefType realType))) (= (type Mask@29) (MapType1Type RefType realType))) (= (type Mask@30) (MapType1Type RefType realType))) (= (type Mask@28) (MapType1Type RefType realType))) (= (type Mask@27) (MapType1Type RefType realType))) (= (type Mask@23) (MapType1Type RefType realType))) (= (type Mask@22) (MapType1Type RefType realType))) (= (type Mask@24) (MapType1Type RefType realType))) (= (type Mask@15) (MapType1Type RefType realType))) (= (type Mask@20) (MapType1Type RefType realType))) (= (type Mask@21) (MapType1Type RefType realType))) (= (type Mask@19) (MapType1Type RefType realType))) (= (type Mask@18) (MapType1Type RefType realType))) (= (type Mask@16) (MapType1Type RefType realType))) (= (type Mask@17) (MapType1Type RefType realType))) (= (type Mask@3) (MapType1Type RefType realType))) (= (type Mask@2) (MapType1Type RefType realType))) (= (type Mask@4) (MapType1Type RefType realType))) (= (type Mask@5) (MapType1Type RefType realType))) (= (type Mask@6) (MapType1Type RefType realType))) (= (type Mask@7) (MapType1Type RefType realType))) (= (type Mask@8) (MapType1Type RefType realType))) (= (type Mask@9) (MapType1Type RefType realType))) (= (type Mask@10) (MapType1Type RefType realType))) (= (type Mask@11) (MapType1Type RefType realType))) (= (type Mask@12) (MapType1Type RefType realType))) (= (type Mask@13) (MapType1Type RefType realType))) (= (type Mask@14) (MapType1Type RefType realType))) (= (type Heap@0) (MapType0Type RefType))) (= (type newVersion@0) FrameTypeType)) (= (type PostMask@2) (MapType1Type RefType realType))) (= (type PostMask@0) (MapType1Type RefType realType))) (= (type PostMask@1) (MapType1Type RefType realType))) (= (type PostHeap@0) (MapType0Type RefType))) (= (type Mask@0) (MapType1Type RefType realType))))
(set-info :boogie-vc-id Wand_state_contains_for_state_contains___apply)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 217) (let ((anon3_correct true))
(let ((anon133_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 213) 210)) anon3_correct)))
(let ((anon133_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 211) (- 0 212)) (<= FullPerm (U_2_real (MapType1Select Mask@0 null (Wand_state_contains_for_state_contains__valid_wand diz@@29))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@0 null (Wand_state_contains_for_state_contains__valid_wand diz@@29)))) (=> (= (ControlFlow 0 211) 210) anon3_correct))))))
(let ((anon132_Then_correct  (and (=> (= (ControlFlow 0 214) (- 0 215)) (not (= diz@@29 null))) (=> (not (= diz@@29 null)) (and (=> (= (ControlFlow 0 214) 211) anon133_Then_correct) (=> (= (ControlFlow 0 214) 213) anon133_Else_correct))))))
(let ((anon7_correct true))
(let ((anon135_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 206) 203)) anon7_correct)))
(let ((anon135_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 204) (- 0 205)) (<= FullPerm (U_2_real (MapType1Select Mask@1 null (Wand_state_contains_for_state_contains__valid_wand diz@@29))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@1 null (Wand_state_contains_for_state_contains__valid_wand diz@@29)))) (=> (= (ControlFlow 0 204) 203) anon7_correct))))))
(let ((anon134_Then_correct  (and (=> (= (ControlFlow 0 207) (- 0 208)) (not (= diz@@29 null))) (=> (not (= diz@@29 null)) (and (=> (= (ControlFlow 0 207) 204) anon135_Then_correct) (=> (= (ControlFlow 0 207) 206) anon135_Else_correct))))))
(let ((anon17_correct true))
(let ((anon140_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 200) 197)) anon17_correct)))
(let ((anon140_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 198) (- 0 199)) (<= FullPerm (U_2_real (MapType1Select Mask@1 null (Wand_state_contains_for_state_contains__valid_wand diz@@29))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@1 null (Wand_state_contains_for_state_contains__valid_wand diz@@29)))) (=> (= (ControlFlow 0 198) 197) anon17_correct))))))
(let ((anon139_Then_correct  (and (=> (= (ControlFlow 0 201) (- 0 202)) (not (= diz@@29 null))) (=> (not (= diz@@29 null)) (and (=> (= (ControlFlow 0 201) 198) anon140_Then_correct) (=> (= (ControlFlow 0 201) 200) anon140_Else_correct))))))
(let ((anon21_correct true))
(let ((anon142_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 193) 190)) anon21_correct)))
(let ((anon142_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 191) (- 0 192)) (<= FullPerm (U_2_real (MapType1Select Mask@1 null (Wand_state_contains_for_state_contains__valid_wand diz@@29))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@1 null (Wand_state_contains_for_state_contains__valid_wand diz@@29)))) (=> (= (ControlFlow 0 191) 190) anon21_correct))))))
(let ((anon141_Then_correct  (and (=> (= (ControlFlow 0 194) (- 0 195)) (not (= diz@@29 null))) (=> (not (= diz@@29 null)) (and (=> (= (ControlFlow 0 194) 191) anon142_Then_correct) (=> (= (ControlFlow 0 194) 193) anon142_Else_correct))))))
(let ((anon26_correct true))
(let ((anon145_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 185) 182)) anon26_correct)))
(let ((anon145_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 183) (- 0 184)) (<= FullPerm (U_2_real (MapType1Select Mask@1 null (Wand_state_contains_for_state_contains__valid_wand diz@@29))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@1 null (Wand_state_contains_for_state_contains__valid_wand diz@@29)))) (=> (= (ControlFlow 0 183) 182) anon26_correct))))))
(let ((anon144_Then_correct  (and (=> (= (ControlFlow 0 186) (- 0 187)) (not (= diz@@29 null))) (=> (not (= diz@@29 null)) (and (=> (= (ControlFlow 0 186) 183) anon145_Then_correct) (=> (= (ControlFlow 0 186) 185) anon145_Else_correct))))))
(let ((anon30_correct true))
(let ((anon147_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 178) 175)) anon30_correct)))
(let ((anon147_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 176) (- 0 177)) (<= FullPerm (U_2_real (MapType1Select Mask@1 null (Wand_state_contains_for_state_contains__valid_wand diz@@29))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@1 null (Wand_state_contains_for_state_contains__valid_wand diz@@29)))) (=> (= (ControlFlow 0 176) 175) anon30_correct))))))
(let ((anon146_Then_correct  (and (=> (= (ControlFlow 0 179) (- 0 180)) (not (= diz@@29 null))) (=> (not (= diz@@29 null)) (and (=> (= (ControlFlow 0 179) 176) anon147_Then_correct) (=> (= (ControlFlow 0 179) 178) anon147_Else_correct))))))
(let ((anon40_correct true))
(let ((anon152_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 172) 169)) anon40_correct)))
(let ((anon152_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 170) (- 0 171)) (<= FullPerm (U_2_real (MapType1Select Mask@1 null (Wand_state_contains_for_state_contains__valid_wand diz@@29))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@1 null (Wand_state_contains_for_state_contains__valid_wand diz@@29)))) (=> (= (ControlFlow 0 170) 169) anon40_correct))))))
(let ((anon151_Then_correct  (and (=> (= (ControlFlow 0 173) (- 0 174)) (not (= diz@@29 null))) (=> (not (= diz@@29 null)) (and (=> (= (ControlFlow 0 173) 170) anon152_Then_correct) (=> (= (ControlFlow 0 173) 172) anon152_Else_correct))))))
(let ((anon36_correct true))
(let ((anon35_correct  (=> (= PostMask@1 (MapType1Store PostMask@0 null (Tree__state (Wand_state_contains_for_state_contains__get_out_1 Heap@@41 diz@@29)) (real_2_U (- (U_2_real (MapType1Select PostMask@0 null (Tree__state (Wand_state_contains_for_state_contains__get_out_1 Heap@@41 diz@@29)))) FullPerm)))) (=> (and (= PostMask@2 PostMask@1) (= (ControlFlow 0 164) 162)) anon36_correct))))
(let ((anon150_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 167) 164)) anon35_correct)))
(let ((anon150_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 165) (- 0 166)) (<= FullPerm (U_2_real (MapType1Select PostMask@0 null (Tree__state (Wand_state_contains_for_state_contains__get_out_1 Heap@@41 diz@@29)))))) (=> (<= FullPerm (U_2_real (MapType1Select PostMask@0 null (Tree__state (Wand_state_contains_for_state_contains__get_out_1 Heap@@41 diz@@29))))) (=> (= (ControlFlow 0 165) 164) anon35_correct))))))
(let ((anon149_Then_correct  (=> (not (= (Wand_state_contains_for_state_contains__get_out_1 Heap@@41 diz@@29) null)) (and (=> (= (ControlFlow 0 168) 165) anon150_Then_correct) (=> (= (ControlFlow 0 168) 167) anon150_Else_correct)))))
(let ((anon149_Else_correct  (=> (= (Wand_state_contains_for_state_contains__get_out_1 Heap@@41 diz@@29) null) (=> (and (= PostMask@2 PostMask@0) (= (ControlFlow 0 163) 162)) anon36_correct))))
(let ((anon151_Else_correct true))
(let ((anon144_Else_correct  (=> (and (and (= PostMask@0 (MapType1Store ZeroMask null (Tree__state (Wand_state_contains_for_state_contains__get_out_1 Heap@@41 diz@@29)) (real_2_U (+ (U_2_real (MapType1Select ZeroMask null (Tree__state (Wand_state_contains_for_state_contains__get_out_1 Heap@@41 diz@@29)))) FullPerm)))) (state PostHeap@0 PostMask@0)) (and (state PostHeap@0 PostMask@0) (state PostHeap@0 PostMask@0))) (and (and (and (and (=> (= (ControlFlow 0 181) 179) anon146_Then_correct) (=> (= (ControlFlow 0 181) 173) anon151_Then_correct)) (=> (= (ControlFlow 0 181) 161) anon151_Else_correct)) (=> (= (ControlFlow 0 181) 168) anon149_Then_correct)) (=> (= (ControlFlow 0 181) 163) anon149_Else_correct)))))
(let ((anon143_Then_correct  (=> (and (state PostHeap@0 ZeroMask) (state PostHeap@0 ZeroMask)) (and (=> (= (ControlFlow 0 188) 186) anon144_Then_correct) (=> (= (ControlFlow 0 188) 181) anon144_Else_correct)))))
(let ((anon88_correct true))
(let ((anon176_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 83) 80)) anon88_correct)))
(let ((anon176_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 81) (- 0 82)) (<= FullPerm (U_2_real (MapType1Select Mask@1 null (Wand_state_contains_for_state_contains__valid_wand diz@@29))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@1 null (Wand_state_contains_for_state_contains__valid_wand diz@@29)))) (=> (= (ControlFlow 0 81) 80) anon88_correct))))))
(let ((anon175_Then_correct  (and (=> (= (ControlFlow 0 84) (- 0 85)) (not (= diz@@29 null))) (=> (not (= diz@@29 null)) (and (=> (= (ControlFlow 0 84) 81) anon176_Then_correct) (=> (= (ControlFlow 0 84) 83) anon176_Else_correct))))))
(let ((anon94_correct true))
(let ((anon179_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 73) 70)) anon94_correct)))
(let ((anon179_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 71) (- 0 72)) (<= FullPerm (U_2_real (MapType1Select Mask@1 null (Wand_state_contains_for_state_contains__valid_wand diz@@29))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@1 null (Wand_state_contains_for_state_contains__valid_wand diz@@29)))) (=> (= (ControlFlow 0 71) 70) anon94_correct))))))
(let ((anon178_Then_correct  (and (=> (= (ControlFlow 0 74) (- 0 75)) (not (= diz@@29 null))) (=> (not (= diz@@29 null)) (and (=> (= (ControlFlow 0 74) 71) anon179_Then_correct) (=> (= (ControlFlow 0 74) 73) anon179_Else_correct))))))
(let ((anon104_correct true))
(let ((anon184_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 67) 64)) anon104_correct)))
(let ((anon184_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 65) (- 0 66)) (<= FullPerm (U_2_real (MapType1Select Mask@1 null (Wand_state_contains_for_state_contains__valid_wand diz@@29))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@1 null (Wand_state_contains_for_state_contains__valid_wand diz@@29)))) (=> (= (ControlFlow 0 65) 64) anon104_correct))))))
(let ((anon183_Then_correct  (and (=> (= (ControlFlow 0 68) (- 0 69)) (not (= diz@@29 null))) (=> (not (= diz@@29 null)) (and (=> (= (ControlFlow 0 68) 65) anon184_Then_correct) (=> (= (ControlFlow 0 68) 67) anon184_Else_correct))))))
(let ((anon100_correct true))
(let ((anon99_correct  (=> (= ExhaleWellDef0Mask@2 (MapType1Store Mask@37 null (Tree__state (Wand_state_contains_for_state_contains__get_out_1 Heap@@41 diz@@29)) (real_2_U (- (U_2_real (MapType1Select Mask@37 null (Tree__state (Wand_state_contains_for_state_contains__get_out_1 Heap@@41 diz@@29)))) FullPerm)))) (=> (and (= ExhaleWellDef0Mask@3 ExhaleWellDef0Mask@2) (= (ControlFlow 0 59) 57)) anon100_correct))))
(let ((anon182_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 62) 59)) anon99_correct)))
(let ((anon182_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 60) (- 0 61)) (<= FullPerm (U_2_real (MapType1Select Mask@37 null (Tree__state (Wand_state_contains_for_state_contains__get_out_1 Heap@@41 diz@@29)))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@37 null (Tree__state (Wand_state_contains_for_state_contains__get_out_1 Heap@@41 diz@@29))))) (=> (= (ControlFlow 0 60) 59) anon99_correct))))))
(let ((anon181_Then_correct  (=> (not (= (Wand_state_contains_for_state_contains__get_out_1 Heap@@41 diz@@29) null)) (and (=> (= (ControlFlow 0 63) 60) anon182_Then_correct) (=> (= (ControlFlow 0 63) 62) anon182_Else_correct)))))
(let ((anon181_Else_correct  (=> (= (Wand_state_contains_for_state_contains__get_out_1 Heap@@41 diz@@29) null) (=> (and (= ExhaleWellDef0Mask@3 Mask@37) (= (ControlFlow 0 58) 57)) anon100_correct))))
(let ((anon183_Else_correct  (=> (= (ControlFlow 0 56) (- 0 55)) (|Seq#Equal| (Tree__tolist ExhaleHeap@2 (Wand_state_contains_for_state_contains__get_out_1 Heap@@41 diz@@29)) (Wand_state_contains_for_state_contains__get_out_1_0 Heap@@41 diz@@29)))))
(let ((anon91_correct  (=> (= AssertMask@2 (MapType1Store Mask@37 null (Tree__state (Wand_state_contains_for_state_contains__get_out_1 Heap@@41 diz@@29)) (real_2_U (- (U_2_real (MapType1Select Mask@37 null (Tree__state (Wand_state_contains_for_state_contains__get_out_1 Heap@@41 diz@@29)))) FullPerm)))) (and (and (and (and (=> (= (ControlFlow 0 76) 74) anon178_Then_correct) (=> (= (ControlFlow 0 76) 68) anon183_Then_correct)) (=> (= (ControlFlow 0 76) 56) anon183_Else_correct)) (=> (= (ControlFlow 0 76) 63) anon181_Then_correct)) (=> (= (ControlFlow 0 76) 58) anon181_Else_correct)))))
(let ((anon177_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 79) 76)) anon91_correct)))
(let ((anon177_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 77) (- 0 78)) (<= FullPerm (U_2_real (MapType1Select Mask@37 null (Tree__state (Wand_state_contains_for_state_contains__get_out_1 Heap@@41 diz@@29)))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@37 null (Tree__state (Wand_state_contains_for_state_contains__get_out_1 Heap@@41 diz@@29))))) (=> (= (ControlFlow 0 77) 76) anon91_correct))))))
(let ((anon85_correct  (=> (= Mask@36 (MapType1Store Mask@35 null (Tree__state (Wand_state_contains_for_state_contains__get_in_1 Heap@11 arg_diz@0)) (real_2_U (- (U_2_real (MapType1Select Mask@35 null (Tree__state (Wand_state_contains_for_state_contains__get_in_1 Heap@11 arg_diz@0)))) FullPerm)))) (and (=> (= (ControlFlow 0 86) (- 0 88)) (|Seq#Equal| (Tree__tolist Heap@11 (Wand_state_contains_for_state_contains__get_in_1 Heap@11 arg_diz@0)) (Wand_state_contains_for_state_contains__get_in_1_0 Heap@11 arg_diz@0))) (=> (|Seq#Equal| (Tree__tolist Heap@11 (Wand_state_contains_for_state_contains__get_in_1 Heap@11 arg_diz@0)) (Wand_state_contains_for_state_contains__get_in_1_0 Heap@11 arg_diz@0)) (and (=> (= (ControlFlow 0 86) (- 0 87)) (not (= (Wand_state_contains_for_state_contains__get_out_1 Heap@11 arg_diz@0) null))) (=> (not (= (Wand_state_contains_for_state_contains__get_out_1 Heap@11 arg_diz@0) null)) (=> (and (and (and (IdenticalOnKnownLocations Heap@11 ExhaleHeap@2 Mask@36) (state ExhaleHeap@2 Mask@36)) (and (= Mask@37 (MapType1Store Mask@36 null (Tree__state (Wand_state_contains_for_state_contains__get_out_1 Heap@11 arg_diz@0)) (real_2_U (+ (U_2_real (MapType1Select Mask@36 null (Tree__state (Wand_state_contains_for_state_contains__get_out_1 Heap@11 arg_diz@0)))) FullPerm)))) (state ExhaleHeap@2 Mask@37))) (and (and (state ExhaleHeap@2 Mask@37) (|Seq#Equal| (Tree__tolist ExhaleHeap@2 (Wand_state_contains_for_state_contains__get_out_1 Heap@11 arg_diz@0)) (Wand_state_contains_for_state_contains__get_out_1_0 Heap@11 arg_diz@0))) (and (state ExhaleHeap@2 Mask@37) (state ExhaleHeap@2 Mask@37)))) (and (and (=> (= (ControlFlow 0 86) 84) anon175_Then_correct) (=> (= (ControlFlow 0 86) 77) anon177_Then_correct)) (=> (= (ControlFlow 0 86) 79) anon177_Else_correct))))))))))
(let ((anon174_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 91) 86)) anon85_correct)))
(let ((anon174_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 89) (- 0 90)) (<= FullPerm (U_2_real (MapType1Select Mask@35 null (Tree__state (Wand_state_contains_for_state_contains__get_in_1 Heap@11 arg_diz@0)))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@35 null (Tree__state (Wand_state_contains_for_state_contains__get_in_1 Heap@11 arg_diz@0))))) (=> (= (ControlFlow 0 89) 86) anon85_correct))))))
(let ((anon83_correct  (=> (= Mask@35 (MapType1Store Mask@34 null (Wand_state_contains_for_state_contains__valid_wand arg_diz@0) (real_2_U (- (U_2_real (MapType1Select Mask@34 null (Wand_state_contains_for_state_contains__valid_wand arg_diz@0))) FullPerm)))) (and (=> (= (ControlFlow 0 92) 89) anon174_Then_correct) (=> (= (ControlFlow 0 92) 91) anon174_Else_correct)))))
(let ((anon173_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 95) 92)) anon83_correct)))
(let ((anon173_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 93) (- 0 94)) (<= FullPerm (U_2_real (MapType1Select Mask@34 null (Wand_state_contains_for_state_contains__valid_wand arg_diz@0))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@34 null (Wand_state_contains_for_state_contains__valid_wand arg_diz@0)))) (=> (= (ControlFlow 0 93) 92) anon83_correct))))))
(let ((anon170_Else_correct  (and (=> (= (ControlFlow 0 96) (- 0 101)) (HasDirectPerm Mask@34 diz@@29 Wand_state_contains_for_state_contains__prev_contents_1)) (=> (HasDirectPerm Mask@34 diz@@29 Wand_state_contains_for_state_contains__prev_contents_1) (and (=> (= (ControlFlow 0 96) (- 0 100)) (|Seq#Equal| (Tree__tolist Heap@11 (MapType0Select Heap@11 diz@@29 Wand_state_contains_for_state_contains__prev_1)) (|Seq#Drop| (MapType0Select Heap@11 diz@@29 Wand_state_contains_for_state_contains__prev_contents_1) 1))) (=> (|Seq#Equal| (Tree__tolist Heap@11 (MapType0Select Heap@11 diz@@29 Wand_state_contains_for_state_contains__prev_1)) (|Seq#Drop| (MapType0Select Heap@11 diz@@29 Wand_state_contains_for_state_contains__prev_contents_1) 1)) (=> (state Heap@11 Mask@34) (and (=> (= (ControlFlow 0 96) (- 0 99)) (HasDirectPerm Mask@34 diz@@29 Wand_state_contains_for_state_contains__wand_1)) (=> (HasDirectPerm Mask@34 diz@@29 Wand_state_contains_for_state_contains__wand_1) (=> (= arg_diz@0 (MapType0Select Heap@11 diz@@29 Wand_state_contains_for_state_contains__wand_1)) (and (=> (= (ControlFlow 0 96) (- 0 98)) (not (= arg_diz@0 null))) (=> (not (= arg_diz@0 null)) (and (=> (= (ControlFlow 0 96) (- 0 97)) (>= current_thread_id 0)) (=> (>= current_thread_id 0) (and (=> (= (ControlFlow 0 96) 93) anon173_Then_correct) (=> (= (ControlFlow 0 96) 95) anon173_Else_correct))))))))))))))))
(let ((anon80_correct true))
(let ((anon79_correct  (=> (= ExhaleWellDef0Mask@4 (MapType1Store Mask@34 null (Tree__state (MapType0Select Heap@11 diz@@29 Wand_state_contains_for_state_contains__prev_1)) (real_2_U (- (U_2_real (MapType1Select Mask@34 null (Tree__state (MapType0Select Heap@11 diz@@29 Wand_state_contains_for_state_contains__prev_1)))) FullPerm)))) (=> (and (= ExhaleWellDef0Mask@5 ExhaleWellDef0Mask@4) (= (ControlFlow 0 50) 48)) anon80_correct))))
(let ((anon172_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 53) 50)) anon79_correct)))
(let ((anon172_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 51) (- 0 52)) (<= FullPerm (U_2_real (MapType1Select Mask@34 null (Tree__state (MapType0Select Heap@11 diz@@29 Wand_state_contains_for_state_contains__prev_1)))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@34 null (Tree__state (MapType0Select Heap@11 diz@@29 Wand_state_contains_for_state_contains__prev_1))))) (=> (= (ControlFlow 0 51) 50) anon79_correct))))))
(let ((anon171_Then_correct  (=> (not (= (MapType0Select Heap@11 diz@@29 Wand_state_contains_for_state_contains__prev_1) null)) (and (=> (= (ControlFlow 0 54) 51) anon172_Then_correct) (=> (= (ControlFlow 0 54) 53) anon172_Else_correct)))))
(let ((anon171_Else_correct  (=> (= (MapType0Select Heap@11 diz@@29 Wand_state_contains_for_state_contains__prev_1) null) (=> (and (= ExhaleWellDef0Mask@5 Mask@34) (= (ControlFlow 0 49) 48)) anon80_correct))))
(let ((anon75_correct  (=> (= AssertMask@1 (MapType1Store Mask@34 null (Tree__state (MapType0Select Heap@11 diz@@29 Wand_state_contains_for_state_contains__prev_1)) (real_2_U (- (U_2_real (MapType1Select Mask@34 null (Tree__state (MapType0Select Heap@11 diz@@29 Wand_state_contains_for_state_contains__prev_1)))) FullPerm)))) (and (=> (= (ControlFlow 0 102) (- 0 103)) (HasDirectPerm Mask@34 diz@@29 Wand_state_contains_for_state_contains__prev_1)) (=> (HasDirectPerm Mask@34 diz@@29 Wand_state_contains_for_state_contains__prev_1) (and (and (=> (= (ControlFlow 0 102) 96) anon170_Else_correct) (=> (= (ControlFlow 0 102) 54) anon171_Then_correct)) (=> (= (ControlFlow 0 102) 49) anon171_Else_correct)))))))
(let ((anon169_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 106) 102)) anon75_correct)))
(let ((anon169_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 104) (- 0 105)) (<= FullPerm (U_2_real (MapType1Select Mask@34 null (Tree__state (MapType0Select Heap@11 diz@@29 Wand_state_contains_for_state_contains__prev_1)))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@34 null (Tree__state (MapType0Select Heap@11 diz@@29 Wand_state_contains_for_state_contains__prev_1))))) (=> (= (ControlFlow 0 104) 102) anon75_correct))))))
(let ((anon73_correct  (=> (and (state Heap@11 Mask@34) (state Heap@11 Mask@34)) (and (=> (= (ControlFlow 0 107) (- 0 108)) (HasDirectPerm Mask@34 diz@@29 Wand_state_contains_for_state_contains__prev_1)) (=> (HasDirectPerm Mask@34 diz@@29 Wand_state_contains_for_state_contains__prev_1) (and (=> (= (ControlFlow 0 107) 104) anon169_Then_correct) (=> (= (ControlFlow 0 107) 106) anon169_Else_correct)))))))
(let ((anon168_Else_correct  (=> (= (MapType0Select Heap@9 (MapType0Select Heap@9 diz@@29 Wand_state_contains_for_state_contains__prev_1) Tree__right) null) (=> (and (= Heap@11 Heap@9) (= (ControlFlow 0 110) 107)) anon73_correct))))
(let ((anon168_Then_correct  (=> (not (= (MapType0Select Heap@9 (MapType0Select Heap@9 diz@@29 Wand_state_contains_for_state_contains__prev_1) Tree__right) null)) (=> (and (and (forall ((o_14 T@U) (f_18 T@U) ) (! (let ((B@@11 (FieldTypeInv1 (type f_18))))
(let ((A@@12 (FieldTypeInv0 (type f_18))))
 (=> (and (and (= (type o_14) RefType) (= (type f_18) (FieldType A@@12 B@@11))) (or (U_2_bool (MapType1Select (MapType0Select Heap@9 null (|Tree__state#sm| (MapType0Select Heap@9 diz@@29 Wand_state_contains_for_state_contains__prev_1))) o_14 f_18)) (U_2_bool (MapType1Select (MapType0Select Heap@9 null (|Tree__state#sm| (MapType0Select Heap@9 (MapType0Select Heap@9 diz@@29 Wand_state_contains_for_state_contains__prev_1) Tree__right))) o_14 f_18)))) (U_2_bool (MapType1Select newPMask@1 o_14 f_18)))))
 :qid |stdinbpl.3038:33|
 :skolemid |113|
 :pattern ( (MapType1Select newPMask@1 o_14 f_18))
)) (= Heap@10 (MapType0Store Heap@9 null (|Tree__state#sm| (MapType0Select Heap@9 diz@@29 Wand_state_contains_for_state_contains__prev_1)) newPMask@1))) (and (= Heap@11 Heap@10) (= (ControlFlow 0 109) 107))) anon73_correct))))
(let ((anon167_Else_correct  (=> (and (= (MapType0Select Heap@7 (MapType0Select Heap@7 diz@@29 Wand_state_contains_for_state_contains__prev_1) Tree__left) null) (= Heap@9 Heap@7)) (and (=> (= (ControlFlow 0 112) 109) anon168_Then_correct) (=> (= (ControlFlow 0 112) 110) anon168_Else_correct)))))
(let ((anon167_Then_correct  (=> (and (and (not (= (MapType0Select Heap@7 (MapType0Select Heap@7 diz@@29 Wand_state_contains_for_state_contains__prev_1) Tree__left) null)) (forall ((o_13 T@U) (f_17 T@U) ) (! (let ((B@@12 (FieldTypeInv1 (type f_17))))
(let ((A@@13 (FieldTypeInv0 (type f_17))))
 (=> (and (and (= (type o_13) RefType) (= (type f_17) (FieldType A@@13 B@@12))) (or (U_2_bool (MapType1Select (MapType0Select Heap@7 null (|Tree__state#sm| (MapType0Select Heap@7 diz@@29 Wand_state_contains_for_state_contains__prev_1))) o_13 f_17)) (U_2_bool (MapType1Select (MapType0Select Heap@7 null (|Tree__state#sm| (MapType0Select Heap@7 (MapType0Select Heap@7 diz@@29 Wand_state_contains_for_state_contains__prev_1) Tree__left))) o_13 f_17)))) (U_2_bool (MapType1Select newPMask@0 o_13 f_17)))))
 :qid |stdinbpl.3030:33|
 :skolemid |112|
 :pattern ( (MapType1Select newPMask@0 o_13 f_17))
))) (and (= Heap@8 (MapType0Store Heap@7 null (|Tree__state#sm| (MapType0Select Heap@7 diz@@29 Wand_state_contains_for_state_contains__prev_1)) newPMask@0)) (= Heap@9 Heap@8))) (and (=> (= (ControlFlow 0 111) 109) anon168_Then_correct) (=> (= (ControlFlow 0 111) 110) anon168_Else_correct)))))
(let ((anon69_correct  (=> (= Heap@5 (MapType0Store Heap@4 null (|Tree__state#sm| (MapType0Select Heap@4 diz@@29 Wand_state_contains_for_state_contains__prev_1)) (MapType1Store (MapType0Select Heap@4 null (|Tree__state#sm| (MapType0Select Heap@4 diz@@29 Wand_state_contains_for_state_contains__prev_1))) (MapType0Select Heap@4 diz@@29 Wand_state_contains_for_state_contains__prev_1) Tree__data (bool_2_U true)))) (=> (and (= Heap@6 (MapType0Store Heap@5 null (|Tree__state#sm| (MapType0Select Heap@5 diz@@29 Wand_state_contains_for_state_contains__prev_1)) (MapType1Store (MapType0Select Heap@5 null (|Tree__state#sm| (MapType0Select Heap@5 diz@@29 Wand_state_contains_for_state_contains__prev_1))) (MapType0Select Heap@5 diz@@29 Wand_state_contains_for_state_contains__prev_1) Tree__left (bool_2_U true)))) (= Heap@7 (MapType0Store Heap@6 null (|Tree__state#sm| (MapType0Select Heap@6 diz@@29 Wand_state_contains_for_state_contains__prev_1)) (MapType1Store (MapType0Select Heap@6 null (|Tree__state#sm| (MapType0Select Heap@6 diz@@29 Wand_state_contains_for_state_contains__prev_1))) (MapType0Select Heap@6 diz@@29 Wand_state_contains_for_state_contains__prev_1) Tree__right (bool_2_U true))))) (and (=> (= (ControlFlow 0 113) 111) anon167_Then_correct) (=> (= (ControlFlow 0 113) 112) anon167_Else_correct))))))
(let ((anon166_Else_correct  (=> (HasDirectPerm Mask@34 null (Tree__state (MapType0Select Heap@1 diz@@29 Wand_state_contains_for_state_contains__prev_1))) (=> (and (= Heap@4 Heap@1) (= (ControlFlow 0 115) 113)) anon69_correct))))
(let ((anon166_Then_correct  (=> (not (HasDirectPerm Mask@34 null (Tree__state (MapType0Select Heap@1 diz@@29 Wand_state_contains_for_state_contains__prev_1)))) (=> (and (and (= Heap@2 (MapType0Store Heap@1 null (|Tree__state#sm| (MapType0Select Heap@1 diz@@29 Wand_state_contains_for_state_contains__prev_1)) ZeroPMask)) (= Heap@3 (MapType0Store Heap@2 null (Tree__state (MapType0Select Heap@2 diz@@29 Wand_state_contains_for_state_contains__prev_1)) freshVersion@0))) (and (= Heap@4 Heap@3) (= (ControlFlow 0 114) 113))) anon69_correct))))
(let ((anon67_correct  (=> (= Mask@34 (MapType1Store Mask@33 null (Tree__state (MapType0Select Heap@1 diz@@29 Wand_state_contains_for_state_contains__prev_1)) (real_2_U (+ (U_2_real (MapType1Select Mask@33 null (Tree__state (MapType0Select Heap@1 diz@@29 Wand_state_contains_for_state_contains__prev_1)))) FullPerm)))) (=> (and (and (state Heap@1 Mask@34) (state Heap@1 Mask@34)) (and (|Tree__state#trigger| Heap@1 (Tree__state (MapType0Select Heap@1 diz@@29 Wand_state_contains_for_state_contains__prev_1))) (= (MapType0Select Heap@1 null (Tree__state (MapType0Select Heap@1 diz@@29 Wand_state_contains_for_state_contains__prev_1))) (CombineFrames (FrameFragment (MapType0Select Heap@1 (MapType0Select Heap@1 diz@@29 Wand_state_contains_for_state_contains__prev_1) Tree__data)) (CombineFrames (FrameFragment (MapType0Select Heap@1 (MapType0Select Heap@1 diz@@29 Wand_state_contains_for_state_contains__prev_1) Tree__left)) (CombineFrames (FrameFragment (MapType0Select Heap@1 (MapType0Select Heap@1 diz@@29 Wand_state_contains_for_state_contains__prev_1) Tree__right)) (CombineFrames (FrameFragment (ite (not (= (MapType0Select Heap@1 (MapType0Select Heap@1 diz@@29 Wand_state_contains_for_state_contains__prev_1) Tree__left) null)) (MapType0Select Heap@1 null (Tree__state (MapType0Select Heap@1 (MapType0Select Heap@1 diz@@29 Wand_state_contains_for_state_contains__prev_1) Tree__left))) EmptyFrame)) (FrameFragment (ite (not (= (MapType0Select Heap@1 (MapType0Select Heap@1 diz@@29 Wand_state_contains_for_state_contains__prev_1) Tree__right) null)) (MapType0Select Heap@1 null (Tree__state (MapType0Select Heap@1 (MapType0Select Heap@1 diz@@29 Wand_state_contains_for_state_contains__prev_1) Tree__right))) EmptyFrame))))))))) (and (=> (= (ControlFlow 0 116) 114) anon166_Then_correct) (=> (= (ControlFlow 0 116) 115) anon166_Else_correct))))))
(let ((anon66_correct  (=> (and (and (= Mask@32 (MapType1Store Mask@31 null (Tree__state (MapType0Select Heap@1 (MapType0Select Heap@1 diz@@29 Wand_state_contains_for_state_contains__prev_1) Tree__right)) (real_2_U (- (U_2_real (MapType1Select Mask@31 null (Tree__state (MapType0Select Heap@1 (MapType0Select Heap@1 diz@@29 Wand_state_contains_for_state_contains__prev_1) Tree__right)))) FullPerm)))) (InsidePredicate (Tree__state (MapType0Select Heap@1 diz@@29 Wand_state_contains_for_state_contains__prev_1)) (MapType0Select Heap@1 null (Tree__state (MapType0Select Heap@1 diz@@29 Wand_state_contains_for_state_contains__prev_1))) (Tree__state (MapType0Select Heap@1 (MapType0Select Heap@1 diz@@29 Wand_state_contains_for_state_contains__prev_1) Tree__right)) (MapType0Select Heap@1 null (Tree__state (MapType0Select Heap@1 (MapType0Select Heap@1 diz@@29 Wand_state_contains_for_state_contains__prev_1) Tree__right))))) (and (= Mask@33 Mask@32) (= (ControlFlow 0 118) 116))) anon67_correct)))
(let ((anon165_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 121) 118)) anon66_correct)))
(let ((anon165_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 119) (- 0 120)) (<= FullPerm (U_2_real (MapType1Select Mask@31 null (Tree__state (MapType0Select Heap@1 (MapType0Select Heap@1 diz@@29 Wand_state_contains_for_state_contains__prev_1) Tree__right)))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@31 null (Tree__state (MapType0Select Heap@1 (MapType0Select Heap@1 diz@@29 Wand_state_contains_for_state_contains__prev_1) Tree__right))))) (=> (= (ControlFlow 0 119) 118) anon66_correct))))))
(let ((anon164_Then_correct  (=> (not (= (MapType0Select Heap@1 (MapType0Select Heap@1 diz@@29 Wand_state_contains_for_state_contains__prev_1) Tree__right) null)) (and (=> (= (ControlFlow 0 122) 119) anon165_Then_correct) (=> (= (ControlFlow 0 122) 121) anon165_Else_correct)))))
(let ((anon164_Else_correct  (=> (= (MapType0Select Heap@1 (MapType0Select Heap@1 diz@@29 Wand_state_contains_for_state_contains__prev_1) Tree__right) null) (=> (and (= Mask@33 Mask@31) (= (ControlFlow 0 117) 116)) anon67_correct))))
(let ((anon62_correct  (=> (= Mask@30 (MapType1Store Mask@29 null (Tree__state (MapType0Select Heap@1 (MapType0Select Heap@1 diz@@29 Wand_state_contains_for_state_contains__prev_1) Tree__left)) (real_2_U (- (U_2_real (MapType1Select Mask@29 null (Tree__state (MapType0Select Heap@1 (MapType0Select Heap@1 diz@@29 Wand_state_contains_for_state_contains__prev_1) Tree__left)))) FullPerm)))) (=> (and (InsidePredicate (Tree__state (MapType0Select Heap@1 diz@@29 Wand_state_contains_for_state_contains__prev_1)) (MapType0Select Heap@1 null (Tree__state (MapType0Select Heap@1 diz@@29 Wand_state_contains_for_state_contains__prev_1))) (Tree__state (MapType0Select Heap@1 (MapType0Select Heap@1 diz@@29 Wand_state_contains_for_state_contains__prev_1) Tree__left)) (MapType0Select Heap@1 null (Tree__state (MapType0Select Heap@1 (MapType0Select Heap@1 diz@@29 Wand_state_contains_for_state_contains__prev_1) Tree__left)))) (= Mask@31 Mask@30)) (and (=> (= (ControlFlow 0 124) 122) anon164_Then_correct) (=> (= (ControlFlow 0 124) 117) anon164_Else_correct))))))
(let ((anon163_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 127) 124)) anon62_correct)))
(let ((anon163_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 125) (- 0 126)) (<= FullPerm (U_2_real (MapType1Select Mask@29 null (Tree__state (MapType0Select Heap@1 (MapType0Select Heap@1 diz@@29 Wand_state_contains_for_state_contains__prev_1) Tree__left)))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@29 null (Tree__state (MapType0Select Heap@1 (MapType0Select Heap@1 diz@@29 Wand_state_contains_for_state_contains__prev_1) Tree__left))))) (=> (= (ControlFlow 0 125) 124) anon62_correct))))))
(let ((anon162_Then_correct  (=> (not (= (MapType0Select Heap@1 (MapType0Select Heap@1 diz@@29 Wand_state_contains_for_state_contains__prev_1) Tree__left) null)) (and (=> (= (ControlFlow 0 128) 125) anon163_Then_correct) (=> (= (ControlFlow 0 128) 127) anon163_Else_correct)))))
(let ((anon162_Else_correct  (=> (and (= (MapType0Select Heap@1 (MapType0Select Heap@1 diz@@29 Wand_state_contains_for_state_contains__prev_1) Tree__left) null) (= Mask@31 Mask@29)) (and (=> (= (ControlFlow 0 123) 122) anon164_Then_correct) (=> (= (ControlFlow 0 123) 117) anon164_Else_correct)))))
(let ((anon59_correct  (=> (= Mask@29 (MapType1Store Mask@28 (MapType0Select Heap@1 diz@@29 Wand_state_contains_for_state_contains__prev_1) Tree__right (real_2_U (- (U_2_real (MapType1Select Mask@28 (MapType0Select Heap@1 diz@@29 Wand_state_contains_for_state_contains__prev_1) Tree__right)) FullPerm)))) (and (=> (= (ControlFlow 0 129) 128) anon162_Then_correct) (=> (= (ControlFlow 0 129) 123) anon162_Else_correct)))))
(let ((anon161_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 132) 129)) anon59_correct)))
(let ((anon161_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 130) (- 0 131)) (<= FullPerm (U_2_real (MapType1Select Mask@28 (MapType0Select Heap@1 diz@@29 Wand_state_contains_for_state_contains__prev_1) Tree__right)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@28 (MapType0Select Heap@1 diz@@29 Wand_state_contains_for_state_contains__prev_1) Tree__right))) (=> (= (ControlFlow 0 130) 129) anon59_correct))))))
(let ((anon57_correct  (=> (= Mask@28 (MapType1Store Mask@27 (MapType0Select Heap@1 diz@@29 Wand_state_contains_for_state_contains__prev_1) Tree__left (real_2_U (- (U_2_real (MapType1Select Mask@27 (MapType0Select Heap@1 diz@@29 Wand_state_contains_for_state_contains__prev_1) Tree__left)) FullPerm)))) (and (=> (= (ControlFlow 0 133) 130) anon161_Then_correct) (=> (= (ControlFlow 0 133) 132) anon161_Else_correct)))))
(let ((anon160_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 136) 133)) anon57_correct)))
(let ((anon160_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 134) (- 0 135)) (<= FullPerm (U_2_real (MapType1Select Mask@27 (MapType0Select Heap@1 diz@@29 Wand_state_contains_for_state_contains__prev_1) Tree__left)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@27 (MapType0Select Heap@1 diz@@29 Wand_state_contains_for_state_contains__prev_1) Tree__left))) (=> (= (ControlFlow 0 134) 133) anon57_correct))))))
(let ((anon55_correct  (=> (= Mask@27 (MapType1Store Mask@25 (MapType0Select Heap@1 diz@@29 Wand_state_contains_for_state_contains__prev_1) Tree__data (real_2_U (- (U_2_real (MapType1Select Mask@25 (MapType0Select Heap@1 diz@@29 Wand_state_contains_for_state_contains__prev_1) Tree__data)) FullPerm)))) (and (=> (= (ControlFlow 0 137) 134) anon160_Then_correct) (=> (= (ControlFlow 0 137) 136) anon160_Else_correct)))))
(let ((anon159_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 140) 137)) anon55_correct)))
(let ((anon159_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 138) (- 0 139)) (<= FullPerm (U_2_real (MapType1Select Mask@25 (MapType0Select Heap@1 diz@@29 Wand_state_contains_for_state_contains__prev_1) Tree__data)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@25 (MapType0Select Heap@1 diz@@29 Wand_state_contains_for_state_contains__prev_1) Tree__data))) (=> (= (ControlFlow 0 138) 137) anon55_correct))))))
(let ((anon158_Then_correct  (=> (= (U_2_int (MapType0Select Heap@1 diz@@29 Wand_state_contains_for_state_contains__lemma)) 1) (and (=> (= (ControlFlow 0 141) (- 0 142)) (HasDirectPerm Mask@25 diz@@29 Wand_state_contains_for_state_contains__prev_1)) (=> (HasDirectPerm Mask@25 diz@@29 Wand_state_contains_for_state_contains__prev_1) (and (=> (= (ControlFlow 0 141) 138) anon159_Then_correct) (=> (= (ControlFlow 0 141) 140) anon159_Else_correct)))))))
(let ((anon110_correct true))
(let ((anon187_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 42) 39)) anon110_correct)))
(let ((anon187_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 40) (- 0 41)) (<= FullPerm (U_2_real (MapType1Select Mask@1 null (Wand_state_contains_for_state_contains__valid_wand diz@@29))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@1 null (Wand_state_contains_for_state_contains__valid_wand diz@@29)))) (=> (= (ControlFlow 0 40) 39) anon110_correct))))))
(let ((anon186_Then_correct  (and (=> (= (ControlFlow 0 43) (- 0 44)) (not (= diz@@29 null))) (=> (not (= diz@@29 null)) (and (=> (= (ControlFlow 0 43) 40) anon187_Then_correct) (=> (= (ControlFlow 0 43) 42) anon187_Else_correct))))))
(let ((anon116_correct true))
(let ((anon190_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 32) 29)) anon116_correct)))
(let ((anon190_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 30) (- 0 31)) (<= FullPerm (U_2_real (MapType1Select Mask@1 null (Wand_state_contains_for_state_contains__valid_wand diz@@29))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@1 null (Wand_state_contains_for_state_contains__valid_wand diz@@29)))) (=> (= (ControlFlow 0 30) 29) anon116_correct))))))
(let ((anon189_Then_correct  (and (=> (= (ControlFlow 0 33) (- 0 34)) (not (= diz@@29 null))) (=> (not (= diz@@29 null)) (and (=> (= (ControlFlow 0 33) 30) anon190_Then_correct) (=> (= (ControlFlow 0 33) 32) anon190_Else_correct))))))
(let ((anon126_correct true))
(let ((anon195_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 26) 23)) anon126_correct)))
(let ((anon195_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 24) (- 0 25)) (<= FullPerm (U_2_real (MapType1Select Mask@1 null (Wand_state_contains_for_state_contains__valid_wand diz@@29))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@1 null (Wand_state_contains_for_state_contains__valid_wand diz@@29)))) (=> (= (ControlFlow 0 24) 23) anon126_correct))))))
(let ((anon194_Then_correct  (and (=> (= (ControlFlow 0 27) (- 0 28)) (not (= diz@@29 null))) (=> (not (= diz@@29 null)) (and (=> (= (ControlFlow 0 27) 24) anon195_Then_correct) (=> (= (ControlFlow 0 27) 26) anon195_Else_correct))))))
(let ((anon122_correct true))
(let ((anon121_correct  (=> (= ExhaleWellDef0Mask@0 (MapType1Store Mask@25 null (Tree__state (Wand_state_contains_for_state_contains__get_out_1 Heap@@41 diz@@29)) (real_2_U (- (U_2_real (MapType1Select Mask@25 null (Tree__state (Wand_state_contains_for_state_contains__get_out_1 Heap@@41 diz@@29)))) FullPerm)))) (=> (and (= ExhaleWellDef0Mask@1 ExhaleWellDef0Mask@0) (= (ControlFlow 0 18) 16)) anon122_correct))))
(let ((anon193_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 21) 18)) anon121_correct)))
(let ((anon193_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 19) (- 0 20)) (<= FullPerm (U_2_real (MapType1Select Mask@25 null (Tree__state (Wand_state_contains_for_state_contains__get_out_1 Heap@@41 diz@@29)))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@25 null (Tree__state (Wand_state_contains_for_state_contains__get_out_1 Heap@@41 diz@@29))))) (=> (= (ControlFlow 0 19) 18) anon121_correct))))))
(let ((anon192_Then_correct  (=> (not (= (Wand_state_contains_for_state_contains__get_out_1 Heap@@41 diz@@29) null)) (and (=> (= (ControlFlow 0 22) 19) anon193_Then_correct) (=> (= (ControlFlow 0 22) 21) anon193_Else_correct)))))
(let ((anon192_Else_correct  (=> (= (Wand_state_contains_for_state_contains__get_out_1 Heap@@41 diz@@29) null) (=> (and (= ExhaleWellDef0Mask@1 Mask@25) (= (ControlFlow 0 17) 16)) anon122_correct))))
(let ((anon194_Else_correct  (=> (= (ControlFlow 0 15) (- 0 14)) (|Seq#Equal| (Tree__tolist Heap@1 (Wand_state_contains_for_state_contains__get_out_1 Heap@@41 diz@@29)) (Wand_state_contains_for_state_contains__get_out_1_0 Heap@@41 diz@@29)))))
(let ((anon113_correct  (=> (= AssertMask@0 (MapType1Store Mask@25 null (Tree__state (Wand_state_contains_for_state_contains__get_out_1 Heap@@41 diz@@29)) (real_2_U (- (U_2_real (MapType1Select Mask@25 null (Tree__state (Wand_state_contains_for_state_contains__get_out_1 Heap@@41 diz@@29)))) FullPerm)))) (and (and (and (and (=> (= (ControlFlow 0 35) 33) anon189_Then_correct) (=> (= (ControlFlow 0 35) 27) anon194_Then_correct)) (=> (= (ControlFlow 0 35) 15) anon194_Else_correct)) (=> (= (ControlFlow 0 35) 22) anon192_Then_correct)) (=> (= (ControlFlow 0 35) 17) anon192_Else_correct)))))
(let ((anon188_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 38) 35)) anon113_correct)))
(let ((anon188_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 36) (- 0 37)) (<= FullPerm (U_2_real (MapType1Select Mask@25 null (Tree__state (Wand_state_contains_for_state_contains__get_out_1 Heap@@41 diz@@29)))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@25 null (Tree__state (Wand_state_contains_for_state_contains__get_out_1 Heap@@41 diz@@29))))) (=> (= (ControlFlow 0 36) 35) anon113_correct))))))
(let ((anon185_Then_correct  (=> (= (U_2_int (MapType0Select Heap@1 diz@@29 Wand_state_contains_for_state_contains__lemma)) 2) (and (and (=> (= (ControlFlow 0 45) 43) anon186_Then_correct) (=> (= (ControlFlow 0 45) 36) anon188_Then_correct)) (=> (= (ControlFlow 0 45) 38) anon188_Else_correct)))))
(let ((anon131_correct  (=> (and (= Mask@26 (MapType1Store Mask@25 null (Tree__state (Wand_state_contains_for_state_contains__get_out_1 Heap@@41 diz@@29)) (real_2_U (- (U_2_real (MapType1Select Mask@25 null (Tree__state (Wand_state_contains_for_state_contains__get_out_1 Heap@@41 diz@@29)))) FullPerm)))) (= (ControlFlow 0 9) (- 0 8))) (|Seq#Equal| (Tree__tolist Heap@1 (Wand_state_contains_for_state_contains__get_out_1 Heap@@41 diz@@29)) (Wand_state_contains_for_state_contains__get_out_1_0 Heap@@41 diz@@29)))))
(let ((anon196_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 12) 9)) anon131_correct)))
(let ((anon196_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 10) (- 0 11)) (<= FullPerm (U_2_real (MapType1Select Mask@25 null (Tree__state (Wand_state_contains_for_state_contains__get_out_1 Heap@@41 diz@@29)))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@25 null (Tree__state (Wand_state_contains_for_state_contains__get_out_1 Heap@@41 diz@@29))))) (=> (= (ControlFlow 0 10) 9) anon131_correct))))))
(let ((anon185_Else_correct  (=> (not (= (U_2_int (MapType0Select Heap@1 diz@@29 Wand_state_contains_for_state_contains__lemma)) 2)) (=> (and (state Heap@1 Mask@25) (state Heap@1 Mask@25)) (and (=> (= (ControlFlow 0 13) 10) anon196_Then_correct) (=> (= (ControlFlow 0 13) 12) anon196_Else_correct))))))
(let ((anon158_Else_correct  (=> (not (= (U_2_int (MapType0Select Heap@1 diz@@29 Wand_state_contains_for_state_contains__lemma)) 1)) (and (=> (= (ControlFlow 0 46) (- 0 47)) (HasDirectPerm Mask@25 diz@@29 Wand_state_contains_for_state_contains__lemma)) (=> (HasDirectPerm Mask@25 diz@@29 Wand_state_contains_for_state_contains__lemma) (and (=> (= (ControlFlow 0 46) 45) anon185_Then_correct) (=> (= (ControlFlow 0 46) 13) anon185_Else_correct)))))))
(let ((anon52_correct  (=> (<= (U_2_int (MapType0Select Heap@1 diz@@29 Wand_state_contains_for_state_contains__lemma)) 2) (=> (and (state Heap@1 Mask@25) (state Heap@1 Mask@25)) (and (=> (= (ControlFlow 0 143) (- 0 144)) (HasDirectPerm Mask@25 diz@@29 Wand_state_contains_for_state_contains__lemma)) (=> (HasDirectPerm Mask@25 diz@@29 Wand_state_contains_for_state_contains__lemma) (and (=> (= (ControlFlow 0 143) 141) anon158_Then_correct) (=> (= (ControlFlow 0 143) 46) anon158_Else_correct))))))))
(let ((anon157_Else_correct  (=> (and (not (= (U_2_int (MapType0Select Heap@1 diz@@29 Wand_state_contains_for_state_contains__lemma)) 2)) (= (ControlFlow 0 146) 143)) anon52_correct)))
(let ((anon157_Then_correct  (=> (= (U_2_int (MapType0Select Heap@1 diz@@29 Wand_state_contains_for_state_contains__lemma)) 2) (=> (and (not (= (MapType0Select Heap@1 diz@@29 Wand_state_contains_for_state_contains__this_2) null)) (= (MapType0Select Heap@1 diz@@29 Wand_state_contains_for_state_contains__in_1) (MapType0Select Heap@1 diz@@29 Wand_state_contains_for_state_contains__top_2))) (=> (and (and (|Seq#Equal| (MapType0Select Heap@1 diz@@29 Wand_state_contains_for_state_contains__in_1_0) (MapType0Select Heap@1 diz@@29 Wand_state_contains_for_state_contains__target_contents_2)) (= (MapType0Select Heap@1 diz@@29 Wand_state_contains_for_state_contains__out_1) (MapType0Select Heap@1 diz@@29 Wand_state_contains_for_state_contains__top_2))) (and (|Seq#Equal| (MapType0Select Heap@1 diz@@29 Wand_state_contains_for_state_contains__out_1_0) (MapType0Select Heap@1 diz@@29 Wand_state_contains_for_state_contains__target_contents_2)) (= (ControlFlow 0 145) 143))) anon52_correct)))))
(let ((anon50_correct  (=> (and (and (> wildcard@13 NoPerm) (not (= diz@@29 null))) (and (= Mask@23 (MapType1Store Mask@22 diz@@29 Wand_state_contains_for_state_contains__this_2 (real_2_U (+ (U_2_real (MapType1Select Mask@22 diz@@29 Wand_state_contains_for_state_contains__this_2)) wildcard@13)))) (state Heap@1 Mask@23))) (=> (and (and (and (> wildcard@14 NoPerm) (not (= diz@@29 null))) (and (= Mask@24 (MapType1Store Mask@23 diz@@29 Wand_state_contains_for_state_contains__target_contents_2 (real_2_U (+ (U_2_real (MapType1Select Mask@23 diz@@29 Wand_state_contains_for_state_contains__target_contents_2)) wildcard@14)))) (state Heap@1 Mask@24))) (and (and (> wildcard@15 NoPerm) (not (= diz@@29 null))) (and (= Mask@25 (MapType1Store Mask@24 diz@@29 Wand_state_contains_for_state_contains__top_2 (real_2_U (+ (U_2_real (MapType1Select Mask@24 diz@@29 Wand_state_contains_for_state_contains__top_2)) wildcard@15)))) (state Heap@1 Mask@25)))) (and (=> (= (ControlFlow 0 147) 145) anon157_Then_correct) (=> (= (ControlFlow 0 147) 146) anon157_Else_correct))))))
(let ((anon49_correct  (=> (= (MapType0Select Heap@1 (MapType0Select Heap@1 diz@@29 Wand_state_contains_for_state_contains__prev_1) Tree__left) (MapType0Select Heap@1 diz@@29 Wand_state_contains_for_state_contains__cur_1)) (=> (and (and (state Heap@1 Mask@20) (|Seq#Equal| (MapType0Select Heap@1 diz@@29 Wand_state_contains_for_state_contains__prev_contents_1) (|Seq#Append| (|Seq#Append| (MapType0Select Heap@1 diz@@29 Wand_state_contains_for_state_contains__cur_contents_1) (|Seq#Singleton| (MapType0Select Heap@1 (MapType0Select Heap@1 diz@@29 Wand_state_contains_for_state_contains__prev_1) Tree__data))) (Tree__tolist Heap@1 (MapType0Select Heap@1 (MapType0Select Heap@1 diz@@29 Wand_state_contains_for_state_contains__prev_1) Tree__right))))) (and (not (= (MapType0Select Heap@1 diz@@29 Wand_state_contains_for_state_contains__wand_1) null)) (= Mask@21 (MapType1Store Mask@20 null (Wand_state_contains_for_state_contains__valid_wand (MapType0Select Heap@1 diz@@29 Wand_state_contains_for_state_contains__wand_1)) (real_2_U (+ (U_2_real (MapType1Select Mask@20 null (Wand_state_contains_for_state_contains__valid_wand (MapType0Select Heap@1 diz@@29 Wand_state_contains_for_state_contains__wand_1)))) FullPerm)))))) (=> (and (and (and (and (InsidePredicate (Wand_state_contains_for_state_contains__valid_wand diz@@29) (MapType0Select Heap@1 null (Wand_state_contains_for_state_contains__valid_wand diz@@29)) (Wand_state_contains_for_state_contains__valid_wand (MapType0Select Heap@1 diz@@29 Wand_state_contains_for_state_contains__wand_1)) (MapType0Select Heap@1 null (Wand_state_contains_for_state_contains__valid_wand (MapType0Select Heap@1 diz@@29 Wand_state_contains_for_state_contains__wand_1)))) (state Heap@1 Mask@21)) (and (state Heap@1 Mask@21) (= (Wand_state_contains_for_state_contains__get_in_1 Heap@1 (MapType0Select Heap@1 diz@@29 Wand_state_contains_for_state_contains__wand_1)) (MapType0Select Heap@1 diz@@29 Wand_state_contains_for_state_contains__prev_1)))) (and (and (state Heap@1 Mask@21) (|Seq#Equal| (Wand_state_contains_for_state_contains__get_in_1_0 Heap@1 (MapType0Select Heap@1 diz@@29 Wand_state_contains_for_state_contains__wand_1)) (|Seq#Drop| (MapType0Select Heap@1 diz@@29 Wand_state_contains_for_state_contains__prev_contents_1) 1))) (and (state Heap@1 Mask@21) (= (Wand_state_contains_for_state_contains__get_out_1 Heap@1 (MapType0Select Heap@1 diz@@29 Wand_state_contains_for_state_contains__wand_1)) (MapType0Select Heap@1 diz@@29 Wand_state_contains_for_state_contains__top_1))))) (and (and (and (state Heap@1 Mask@21) (|Seq#Equal| (Wand_state_contains_for_state_contains__get_out_1_0 Heap@1 (MapType0Select Heap@1 diz@@29 Wand_state_contains_for_state_contains__wand_1)) (MapType0Select Heap@1 diz@@29 Wand_state_contains_for_state_contains__target_contents_1))) (and (= (MapType0Select Heap@1 diz@@29 Wand_state_contains_for_state_contains__in_1) (MapType0Select Heap@1 diz@@29 Wand_state_contains_for_state_contains__cur_1)) (|Seq#Equal| (MapType0Select Heap@1 diz@@29 Wand_state_contains_for_state_contains__in_1_0) (|Seq#Drop| (MapType0Select Heap@1 diz@@29 Wand_state_contains_for_state_contains__cur_contents_1) 1)))) (and (and (= (MapType0Select Heap@1 diz@@29 Wand_state_contains_for_state_contains__out_1) (MapType0Select Heap@1 diz@@29 Wand_state_contains_for_state_contains__top_1)) (|Seq#Equal| (MapType0Select Heap@1 diz@@29 Wand_state_contains_for_state_contains__out_1_0) (MapType0Select Heap@1 diz@@29 Wand_state_contains_for_state_contains__target_contents_1))) (and (= Mask@22 Mask@21) (= (ControlFlow 0 149) 147))))) anon50_correct)))))
(let ((anon156_Else_correct  (=> (= (MapType0Select Heap@1 (MapType0Select Heap@1 diz@@29 Wand_state_contains_for_state_contains__prev_1) Tree__right) null) (=> (and (= Mask@20 Mask@18) (= (ControlFlow 0 151) 149)) anon49_correct))))
(let ((anon156_Then_correct  (=> (and (not (= (MapType0Select Heap@1 (MapType0Select Heap@1 diz@@29 Wand_state_contains_for_state_contains__prev_1) Tree__right) null)) (= Mask@19 (MapType1Store Mask@18 null (Tree__state (MapType0Select Heap@1 (MapType0Select Heap@1 diz@@29 Wand_state_contains_for_state_contains__prev_1) Tree__right)) (real_2_U (+ (U_2_real (MapType1Select Mask@18 null (Tree__state (MapType0Select Heap@1 (MapType0Select Heap@1 diz@@29 Wand_state_contains_for_state_contains__prev_1) Tree__right)))) FullPerm))))) (=> (and (and (InsidePredicate (Wand_state_contains_for_state_contains__valid_wand diz@@29) (MapType0Select Heap@1 null (Wand_state_contains_for_state_contains__valid_wand diz@@29)) (Tree__state (MapType0Select Heap@1 (MapType0Select Heap@1 diz@@29 Wand_state_contains_for_state_contains__prev_1) Tree__right)) (MapType0Select Heap@1 null (Tree__state (MapType0Select Heap@1 (MapType0Select Heap@1 diz@@29 Wand_state_contains_for_state_contains__prev_1) Tree__right)))) (state Heap@1 Mask@19)) (and (= Mask@20 Mask@19) (= (ControlFlow 0 150) 149))) anon49_correct))))
(let ((anon155_Then_correct  (=> (= (U_2_int (MapType0Select Heap@1 diz@@29 Wand_state_contains_for_state_contains__lemma)) 1) (=> (and (and (not (= (MapType0Select Heap@1 diz@@29 Wand_state_contains_for_state_contains__this_1) null)) (> (|Seq#Length| (MapType0Select Heap@1 diz@@29 Wand_state_contains_for_state_contains__prev_contents_1)) 0)) (and (> (|Seq#Length| (MapType0Select Heap@1 diz@@29 Wand_state_contains_for_state_contains__cur_contents_1)) 0) (not (= (MapType0Select Heap@1 diz@@29 Wand_state_contains_for_state_contains__prev_1) null)))) (=> (and (and (and (= Mask@16 (MapType1Store Mask@15 (MapType0Select Heap@1 diz@@29 Wand_state_contains_for_state_contains__prev_1) Tree__left (real_2_U (+ (U_2_real (MapType1Select Mask@15 (MapType0Select Heap@1 diz@@29 Wand_state_contains_for_state_contains__prev_1) Tree__left)) FullPerm)))) (state Heap@1 Mask@16)) (and (not (= (MapType0Select Heap@1 diz@@29 Wand_state_contains_for_state_contains__prev_1) null)) (= Mask@17 (MapType1Store Mask@16 (MapType0Select Heap@1 diz@@29 Wand_state_contains_for_state_contains__prev_1) Tree__data (real_2_U (+ (U_2_real (MapType1Select Mask@16 (MapType0Select Heap@1 diz@@29 Wand_state_contains_for_state_contains__prev_1) Tree__data)) FullPerm)))))) (and (and (state Heap@1 Mask@17) (not (= (MapType0Select Heap@1 diz@@29 Wand_state_contains_for_state_contains__prev_1) null))) (and (= Mask@18 (MapType1Store Mask@17 (MapType0Select Heap@1 diz@@29 Wand_state_contains_for_state_contains__prev_1) Tree__right (real_2_U (+ (U_2_real (MapType1Select Mask@17 (MapType0Select Heap@1 diz@@29 Wand_state_contains_for_state_contains__prev_1) Tree__right)) FullPerm)))) (state Heap@1 Mask@18)))) (and (=> (= (ControlFlow 0 152) 150) anon156_Then_correct) (=> (= (ControlFlow 0 152) 151) anon156_Else_correct)))))))
(let ((anon155_Else_correct  (=> (not (= (U_2_int (MapType0Select Heap@1 diz@@29 Wand_state_contains_for_state_contains__lemma)) 1)) (=> (and (= Mask@22 Mask@15) (= (ControlFlow 0 148) 147)) anon50_correct))))
(let ((anon46_correct  (=> (> wildcard@0 NoPerm) (=> (and (not (= diz@@29 null)) (= Mask@3 (MapType1Store Mask@2 diz@@29 Wand_state_contains_for_state_contains__lemma (real_2_U (+ (U_2_real (MapType1Select Mask@2 diz@@29 Wand_state_contains_for_state_contains__lemma)) wildcard@0))))) (=> (and (and (state Heap@1 Mask@3) (<= 1 (U_2_int (MapType0Select Heap@1 diz@@29 Wand_state_contains_for_state_contains__lemma)))) (and (> wildcard@1 NoPerm) (not (= diz@@29 null)))) (=> (and (and (and (and (= Mask@4 (MapType1Store Mask@3 diz@@29 Wand_state_contains_for_state_contains__in_1 (real_2_U (+ (U_2_real (MapType1Select Mask@3 diz@@29 Wand_state_contains_for_state_contains__in_1)) wildcard@1)))) (state Heap@1 Mask@4)) (and (not (= (MapType0Select Heap@1 diz@@29 Wand_state_contains_for_state_contains__in_1) null)) (> wildcard@2 NoPerm))) (and (and (not (= diz@@29 null)) (= Mask@5 (MapType1Store Mask@4 diz@@29 Wand_state_contains_for_state_contains__in_1_0 (real_2_U (+ (U_2_real (MapType1Select Mask@4 diz@@29 Wand_state_contains_for_state_contains__in_1_0)) wildcard@2))))) (and (state Heap@1 Mask@5) (> wildcard@3 NoPerm)))) (and (and (and (not (= diz@@29 null)) (= Mask@6 (MapType1Store Mask@5 diz@@29 Wand_state_contains_for_state_contains__out_1 (real_2_U (+ (U_2_real (MapType1Select Mask@5 diz@@29 Wand_state_contains_for_state_contains__out_1)) wildcard@3))))) (and (state Heap@1 Mask@6) (not (= (MapType0Select Heap@1 diz@@29 Wand_state_contains_for_state_contains__out_1) null)))) (and (and (> wildcard@4 NoPerm) (not (= diz@@29 null))) (and (= Mask@7 (MapType1Store Mask@6 diz@@29 Wand_state_contains_for_state_contains__out_1_0 (real_2_U (+ (U_2_real (MapType1Select Mask@6 diz@@29 Wand_state_contains_for_state_contains__out_1_0)) wildcard@4)))) (state Heap@1 Mask@7))))) (=> (and (and (and (and (and (> wildcard@5 NoPerm) (not (= diz@@29 null))) (and (= Mask@8 (MapType1Store Mask@7 diz@@29 Wand_state_contains_for_state_contains__this_1 (real_2_U (+ (U_2_real (MapType1Select Mask@7 diz@@29 Wand_state_contains_for_state_contains__this_1)) wildcard@5)))) (state Heap@1 Mask@8))) (and (and (> wildcard@6 NoPerm) (not (= diz@@29 null))) (and (= Mask@9 (MapType1Store Mask@8 diz@@29 Wand_state_contains_for_state_contains__target_contents_1 (real_2_U (+ (U_2_real (MapType1Select Mask@8 diz@@29 Wand_state_contains_for_state_contains__target_contents_1)) wildcard@6)))) (state Heap@1 Mask@9)))) (and (and (and (> wildcard@7 NoPerm) (not (= diz@@29 null))) (and (= Mask@10 (MapType1Store Mask@9 diz@@29 Wand_state_contains_for_state_contains__prev_contents_1 (real_2_U (+ (U_2_real (MapType1Select Mask@9 diz@@29 Wand_state_contains_for_state_contains__prev_contents_1)) wildcard@7)))) (state Heap@1 Mask@10))) (and (and (> wildcard@8 NoPerm) (not (= diz@@29 null))) (and (= Mask@11 (MapType1Store Mask@10 diz@@29 Wand_state_contains_for_state_contains__prev_1 (real_2_U (+ (U_2_real (MapType1Select Mask@10 diz@@29 Wand_state_contains_for_state_contains__prev_1)) wildcard@8)))) (state Heap@1 Mask@11))))) (and (and (and (and (> wildcard@9 NoPerm) (not (= diz@@29 null))) (and (= Mask@12 (MapType1Store Mask@11 diz@@29 Wand_state_contains_for_state_contains__cur_contents_1 (real_2_U (+ (U_2_real (MapType1Select Mask@11 diz@@29 Wand_state_contains_for_state_contains__cur_contents_1)) wildcard@9)))) (state Heap@1 Mask@12))) (and (and (> wildcard@10 NoPerm) (not (= diz@@29 null))) (and (= Mask@13 (MapType1Store Mask@12 diz@@29 Wand_state_contains_for_state_contains__top_1 (real_2_U (+ (U_2_real (MapType1Select Mask@12 diz@@29 Wand_state_contains_for_state_contains__top_1)) wildcard@10)))) (state Heap@1 Mask@13)))) (and (and (and (> wildcard@11 NoPerm) (not (= diz@@29 null))) (and (= Mask@14 (MapType1Store Mask@13 diz@@29 Wand_state_contains_for_state_contains__cur_1 (real_2_U (+ (U_2_real (MapType1Select Mask@13 diz@@29 Wand_state_contains_for_state_contains__cur_1)) wildcard@11)))) (state Heap@1 Mask@14))) (and (and (> wildcard@12 NoPerm) (not (= diz@@29 null))) (and (= Mask@15 (MapType1Store Mask@14 diz@@29 Wand_state_contains_for_state_contains__wand_1 (real_2_U (+ (U_2_real (MapType1Select Mask@14 diz@@29 Wand_state_contains_for_state_contains__wand_1)) wildcard@12)))) (state Heap@1 Mask@15)))))) (and (=> (= (ControlFlow 0 153) 152) anon155_Then_correct) (=> (= (ControlFlow 0 153) 148) anon155_Else_correct)))))))))
(let ((anon154_Else_correct  (=> (HasDirectPerm Mask@2 null (Wand_state_contains_for_state_contains__valid_wand diz@@29)) (=> (and (= Heap@1 Heap@@41) (= (ControlFlow 0 155) 153)) anon46_correct))))
(let ((anon154_Then_correct  (=> (and (and (not (HasDirectPerm Mask@2 null (Wand_state_contains_for_state_contains__valid_wand diz@@29))) (= Heap@0 (MapType0Store Heap@@41 null (Wand_state_contains_for_state_contains__valid_wand diz@@29) newVersion@0))) (and (= Heap@1 Heap@0) (= (ControlFlow 0 154) 153))) anon46_correct)))
(let ((anon44_correct  (=> (= Mask@2 (MapType1Store Mask@1 null (Wand_state_contains_for_state_contains__valid_wand diz@@29) (real_2_U (- (U_2_real (MapType1Select Mask@1 null (Wand_state_contains_for_state_contains__valid_wand diz@@29))) FullPerm)))) (and (=> (= (ControlFlow 0 156) 154) anon154_Then_correct) (=> (= (ControlFlow 0 156) 155) anon154_Else_correct)))))
(let ((anon153_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 159) 156)) anon44_correct)))
(let ((anon153_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 157) (- 0 158)) (<= FullPerm (U_2_real (MapType1Select Mask@1 null (Wand_state_contains_for_state_contains__valid_wand diz@@29))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@1 null (Wand_state_contains_for_state_contains__valid_wand diz@@29)))) (=> (= (ControlFlow 0 157) 156) anon44_correct))))))
(let ((anon143_Else_correct  (=> (and (|Wand_state_contains_for_state_contains__valid_wand#trigger| Heap@@41 (Wand_state_contains_for_state_contains__valid_wand diz@@29)) (= (MapType0Select Heap@@41 null (Wand_state_contains_for_state_contains__valid_wand diz@@29)) (CombineFrames (FrameFragment (MapType0Select Heap@@41 diz@@29 Wand_state_contains_for_state_contains__lemma)) (CombineFrames (FrameFragment (MapType0Select Heap@@41 diz@@29 Wand_state_contains_for_state_contains__in_1)) (CombineFrames (FrameFragment (MapType0Select Heap@@41 diz@@29 Wand_state_contains_for_state_contains__in_1_0)) (CombineFrames (FrameFragment (MapType0Select Heap@@41 diz@@29 Wand_state_contains_for_state_contains__out_1)) (CombineFrames (FrameFragment (MapType0Select Heap@@41 diz@@29 Wand_state_contains_for_state_contains__out_1_0)) (CombineFrames (FrameFragment (MapType0Select Heap@@41 diz@@29 Wand_state_contains_for_state_contains__this_1)) (CombineFrames (FrameFragment (MapType0Select Heap@@41 diz@@29 Wand_state_contains_for_state_contains__target_contents_1)) (CombineFrames (FrameFragment (MapType0Select Heap@@41 diz@@29 Wand_state_contains_for_state_contains__prev_contents_1)) (CombineFrames (FrameFragment (MapType0Select Heap@@41 diz@@29 Wand_state_contains_for_state_contains__prev_1)) (CombineFrames (FrameFragment (MapType0Select Heap@@41 diz@@29 Wand_state_contains_for_state_contains__cur_contents_1)) (CombineFrames (FrameFragment (MapType0Select Heap@@41 diz@@29 Wand_state_contains_for_state_contains__top_1)) (CombineFrames (FrameFragment (MapType0Select Heap@@41 diz@@29 Wand_state_contains_for_state_contains__cur_1)) (CombineFrames (FrameFragment (MapType0Select Heap@@41 diz@@29 Wand_state_contains_for_state_contains__wand_1)) (CombineFrames (FrameFragment (ite (= (U_2_int (MapType0Select Heap@@41 diz@@29 Wand_state_contains_for_state_contains__lemma)) 1) (CombineFrames (CombineFrames (FrameFragment (MapType0Select Heap@@41 (MapType0Select Heap@@41 diz@@29 Wand_state_contains_for_state_contains__prev_1) Tree__left)) (FrameFragment (MapType0Select Heap@@41 (MapType0Select Heap@@41 diz@@29 Wand_state_contains_for_state_contains__prev_1) Tree__data))) (CombineFrames (CombineFrames (FrameFragment (MapType0Select Heap@@41 (MapType0Select Heap@@41 diz@@29 Wand_state_contains_for_state_contains__prev_1) Tree__right)) (FrameFragment (ite (not (= (MapType0Select Heap@@41 (MapType0Select Heap@@41 diz@@29 Wand_state_contains_for_state_contains__prev_1) Tree__right) null)) (MapType0Select Heap@@41 null (Tree__state (MapType0Select Heap@@41 (MapType0Select Heap@@41 diz@@29 Wand_state_contains_for_state_contains__prev_1) Tree__right))) EmptyFrame))) (MapType0Select Heap@@41 null (Wand_state_contains_for_state_contains__valid_wand (MapType0Select Heap@@41 diz@@29 Wand_state_contains_for_state_contains__wand_1))))) EmptyFrame)) (CombineFrames (FrameFragment (MapType0Select Heap@@41 diz@@29 Wand_state_contains_for_state_contains__this_2)) (CombineFrames (FrameFragment (MapType0Select Heap@@41 diz@@29 Wand_state_contains_for_state_contains__target_contents_2)) (CombineFrames (FrameFragment (MapType0Select Heap@@41 diz@@29 Wand_state_contains_for_state_contains__top_2)) (FrameFragment (ite (= (U_2_int (MapType0Select Heap@@41 diz@@29 Wand_state_contains_for_state_contains__lemma)) 2) EmptyFrame EmptyFrame))))))))))))))))))))) (and (=> (= (ControlFlow 0 160) 157) anon153_Then_correct) (=> (= (ControlFlow 0 160) 159) anon153_Else_correct)))))
(let ((anon141_Else_correct  (=> (and (not (= (Wand_state_contains_for_state_contains__get_out_1 Heap@@41 diz@@29) null)) (state Heap@@41 Mask@1)) (and (=> (= (ControlFlow 0 189) 188) anon143_Then_correct) (=> (= (ControlFlow 0 189) 160) anon143_Else_correct)))))
(let ((anon139_Else_correct  (=> (|Seq#Equal| (Tree__tolist Heap@@41 (Wand_state_contains_for_state_contains__get_in_1 Heap@@41 diz@@29)) (Wand_state_contains_for_state_contains__get_in_1_0 Heap@@41 diz@@29)) (=> (and (state Heap@@41 Mask@1) (state Heap@@41 Mask@1)) (and (=> (= (ControlFlow 0 196) 194) anon141_Then_correct) (=> (= (ControlFlow 0 196) 189) anon141_Else_correct))))))
(let ((anon13_correct true))
(let ((anon12_correct  (=> (= Mask@40 (MapType1Store Mask@1 null (Tree__state (Wand_state_contains_for_state_contains__get_in_1 Heap@@41 diz@@29)) (real_2_U (- (U_2_real (MapType1Select Mask@1 null (Tree__state (Wand_state_contains_for_state_contains__get_in_1 Heap@@41 diz@@29)))) FullPerm)))) (=> (and (= Mask@41 Mask@40) (= (ControlFlow 0 3) 1)) anon13_correct))))
(let ((anon138_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 6) 3)) anon12_correct)))
(let ((anon138_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 4) (- 0 5)) (<= FullPerm (U_2_real (MapType1Select Mask@1 null (Tree__state (Wand_state_contains_for_state_contains__get_in_1 Heap@@41 diz@@29)))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@1 null (Tree__state (Wand_state_contains_for_state_contains__get_in_1 Heap@@41 diz@@29))))) (=> (= (ControlFlow 0 4) 3) anon12_correct))))))
(let ((anon137_Then_correct  (=> (not (= (Wand_state_contains_for_state_contains__get_in_1 Heap@@41 diz@@29) null)) (and (=> (= (ControlFlow 0 7) 4) anon138_Then_correct) (=> (= (ControlFlow 0 7) 6) anon138_Else_correct)))))
(let ((anon137_Else_correct  (=> (= (Wand_state_contains_for_state_contains__get_in_1 Heap@@41 diz@@29) null) (=> (and (= Mask@41 Mask@1) (= (ControlFlow 0 2) 1)) anon13_correct))))
(let ((anon132_Else_correct  (=> (and (and (= Mask@1 (MapType1Store Mask@0 null (Tree__state (Wand_state_contains_for_state_contains__get_in_1 Heap@@41 diz@@29)) (real_2_U (+ (U_2_real (MapType1Select Mask@0 null (Tree__state (Wand_state_contains_for_state_contains__get_in_1 Heap@@41 diz@@29)))) FullPerm)))) (state Heap@@41 Mask@1)) (and (state Heap@@41 Mask@1) (state Heap@@41 Mask@1))) (and (and (and (and (=> (= (ControlFlow 0 209) 207) anon134_Then_correct) (=> (= (ControlFlow 0 209) 201) anon139_Then_correct)) (=> (= (ControlFlow 0 209) 196) anon139_Else_correct)) (=> (= (ControlFlow 0 209) 7) anon137_Then_correct)) (=> (= (ControlFlow 0 209) 2) anon137_Else_correct)))))
(let ((anon0_correct  (=> (state Heap@@41 ZeroMask) (=> (and (= AssumeFunctionsAbove (- 0 1)) (U_2_bool (MapType0Select Heap@@41 diz@@29 $allocated))) (=> (and (and (and (not (= diz@@29 null)) (state Heap@@41 ZeroMask)) (and (>= current_thread_id 0) (state Heap@@41 ZeroMask))) (and (and (= Mask@0 (MapType1Store ZeroMask null (Wand_state_contains_for_state_contains__valid_wand diz@@29) (real_2_U (+ (U_2_real (MapType1Select ZeroMask null (Wand_state_contains_for_state_contains__valid_wand diz@@29))) FullPerm)))) (state Heap@@41 Mask@0)) (and (state Heap@@41 Mask@0) (state Heap@@41 Mask@0)))) (and (=> (= (ControlFlow 0 216) 214) anon132_Then_correct) (=> (= (ControlFlow 0 216) 209) anon132_Else_correct)))))))
(let ((PreconditionGeneratedEntry_correct  (=> (and (and (> wildcard NoPerm) true) (= (ControlFlow 0 217) 216)) anon0_correct)))
PreconditionGeneratedEntry_correct))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
))
(check-sat)
(pop 1)
; Valid
(get-info :rlimit)
