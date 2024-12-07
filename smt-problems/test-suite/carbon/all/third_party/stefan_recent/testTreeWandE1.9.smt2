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
(declare-fun Heap@20 () T@U)
(declare-fun Heap@19 () T@U)
(declare-fun diz@@29 () T@U)
(declare-fun Heap@21 () T@U)
(declare-fun Heap@22 () T@U)
(declare-fun Mask@0 () T@U)
(declare-fun Result@0 () T@U)
(declare-fun newPMask@1 () T@U)
(declare-fun Heap@17 () T@U)
(declare-fun Heap@18 () T@U)
(declare-fun Heap@15 () T@U)
(declare-fun newPMask@0 () T@U)
(declare-fun Heap@16 () T@U)
(declare-fun Heap@12 () T@U)
(declare-fun Heap@13 () T@U)
(declare-fun Heap@14 () T@U)
(declare-fun Heap@@41 () T@U)
(declare-fun UnfoldingMask@23 () T@U)
(declare-fun Heap@0 () T@U)
(declare-fun Heap@1 () T@U)
(declare-fun Heap@2 () T@U)
(declare-fun Heap@3 () T@U)
(declare-fun Heap@4 () T@U)
(declare-fun Heap@5 () T@U)
(declare-fun Heap@6 () T@U)
(declare-fun Heap@7 () T@U)
(declare-fun Heap@8 () T@U)
(declare-fun Heap@9 () T@U)
(declare-fun Heap@10 () T@U)
(declare-fun Heap@11 () T@U)
(declare-fun wildcard@13 () Real)
(declare-fun UnfoldingMask@21 () T@U)
(declare-fun UnfoldingMask@20 () T@U)
(declare-fun wildcard@14 () Real)
(declare-fun UnfoldingMask@22 () T@U)
(declare-fun wildcard@15 () Real)
(declare-fun UnfoldingMask@18 () T@U)
(declare-fun UnfoldingMask@19 () T@U)
(declare-fun UnfoldingMask@16 () T@U)
(declare-fun UnfoldingMask@17 () T@U)
(declare-fun UnfoldingMask@14 () T@U)
(declare-fun UnfoldingMask@13 () T@U)
(declare-fun UnfoldingMask@15 () T@U)
(declare-fun UnfoldingMask@0 () T@U)
(declare-fun wildcard@0 () Real)
(declare-fun UnfoldingMask@1 () T@U)
(declare-fun wildcard@1 () Real)
(declare-fun UnfoldingMask@2 () T@U)
(declare-fun wildcard@2 () Real)
(declare-fun UnfoldingMask@3 () T@U)
(declare-fun wildcard@3 () Real)
(declare-fun UnfoldingMask@4 () T@U)
(declare-fun wildcard@4 () Real)
(declare-fun UnfoldingMask@5 () T@U)
(declare-fun wildcard@5 () Real)
(declare-fun UnfoldingMask@6 () T@U)
(declare-fun wildcard@6 () Real)
(declare-fun UnfoldingMask@7 () T@U)
(declare-fun wildcard@7 () Real)
(declare-fun UnfoldingMask@8 () T@U)
(declare-fun wildcard@8 () Real)
(declare-fun UnfoldingMask@9 () T@U)
(declare-fun wildcard@9 () Real)
(declare-fun UnfoldingMask@10 () T@U)
(declare-fun wildcard@10 () Real)
(declare-fun UnfoldingMask@11 () T@U)
(declare-fun wildcard@11 () Real)
(declare-fun UnfoldingMask@12 () T@U)
(declare-fun wildcard@12 () Real)
(declare-fun CombineFrames (T@U T@U) T@U)
(declare-fun wildcard () Real)
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (= (type Heap@20) (MapType0Type RefType)) (= (type Heap@19) (MapType0Type RefType))) (= (type diz@@29) RefType)) (= (type Heap@21) (MapType0Type RefType))) (= (type Heap@22) (MapType0Type RefType))) (= (type Mask@0) (MapType1Type RefType realType))) (= (type Result@0) RefType)) (= (type Heap@12) (MapType0Type RefType))) (= (type newPMask@1) (MapType1Type RefType boolType))) (= (type Heap@17) (MapType0Type RefType))) (= (type Heap@18) (MapType0Type RefType))) (= (type Heap@15) (MapType0Type RefType))) (= (type newPMask@0) (MapType1Type RefType boolType))) (= (type Heap@16) (MapType0Type RefType))) (= (type Heap@13) (MapType0Type RefType))) (= (type Heap@14) (MapType0Type RefType))) (= (type Heap@@41) (MapType0Type RefType))) (= (type UnfoldingMask@23) (MapType1Type RefType realType))) (= (type Heap@0) (MapType0Type RefType))) (= (type Heap@1) (MapType0Type RefType))) (= (type Heap@2) (MapType0Type RefType))) (= (type Heap@3) (MapType0Type RefType))) (= (type Heap@4) (MapType0Type RefType))) (= (type Heap@5) (MapType0Type RefType))) (= (type Heap@6) (MapType0Type RefType))) (= (type Heap@7) (MapType0Type RefType))) (= (type Heap@8) (MapType0Type RefType))) (= (type Heap@9) (MapType0Type RefType))) (= (type Heap@10) (MapType0Type RefType))) (= (type Heap@11) (MapType0Type RefType))) (= (type UnfoldingMask@21) (MapType1Type RefType realType))) (= (type UnfoldingMask@20) (MapType1Type RefType realType))) (= (type UnfoldingMask@22) (MapType1Type RefType realType))) (= (type UnfoldingMask@13) (MapType1Type RefType realType))) (= (type UnfoldingMask@18) (MapType1Type RefType realType))) (= (type UnfoldingMask@19) (MapType1Type RefType realType))) (= (type UnfoldingMask@17) (MapType1Type RefType realType))) (= (type UnfoldingMask@16) (MapType1Type RefType realType))) (= (type UnfoldingMask@14) (MapType1Type RefType realType))) (= (type UnfoldingMask@15) (MapType1Type RefType realType))) (= (type UnfoldingMask@0) (MapType1Type RefType realType))) (= (type UnfoldingMask@1) (MapType1Type RefType realType))) (= (type UnfoldingMask@2) (MapType1Type RefType realType))) (= (type UnfoldingMask@3) (MapType1Type RefType realType))) (= (type UnfoldingMask@4) (MapType1Type RefType realType))) (= (type UnfoldingMask@5) (MapType1Type RefType realType))) (= (type UnfoldingMask@6) (MapType1Type RefType realType))) (= (type UnfoldingMask@7) (MapType1Type RefType realType))) (= (type UnfoldingMask@8) (MapType1Type RefType realType))) (= (type UnfoldingMask@9) (MapType1Type RefType realType))) (= (type UnfoldingMask@10) (MapType1Type RefType realType))) (= (type UnfoldingMask@11) (MapType1Type RefType realType))) (= (type UnfoldingMask@12) (MapType1Type RefType realType))) (forall ((arg0@@60 T@U) (arg1@@31 T@U) ) (! (= (type (CombineFrames arg0@@60 arg1@@31)) FrameTypeType)
 :qid |funType:CombineFrames|
 :pattern ( (CombineFrames arg0@@60 arg1@@31))
))))
(set-info :boogie-vc-id |Wand_state_contains_for_state_contains__get_out_1#definedness|)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 23) (let ((anon12_correct  (=> (and (= Heap@20 (MapType0Store Heap@19 null (|Wand_state_contains_for_state_contains__valid_wand#sm| diz@@29) (MapType1Store (MapType0Select Heap@19 null (|Wand_state_contains_for_state_contains__valid_wand#sm| diz@@29)) diz@@29 Wand_state_contains_for_state_contains__this_2 (bool_2_U true)))) (= Heap@21 (MapType0Store Heap@20 null (|Wand_state_contains_for_state_contains__valid_wand#sm| diz@@29) (MapType1Store (MapType0Select Heap@20 null (|Wand_state_contains_for_state_contains__valid_wand#sm| diz@@29)) diz@@29 Wand_state_contains_for_state_contains__target_contents_2 (bool_2_U true))))) (=> (and (and (= Heap@22 (MapType0Store Heap@21 null (|Wand_state_contains_for_state_contains__valid_wand#sm| diz@@29) (MapType1Store (MapType0Select Heap@21 null (|Wand_state_contains_for_state_contains__valid_wand#sm| diz@@29)) diz@@29 Wand_state_contains_for_state_contains__top_2 (bool_2_U true)))) (state Heap@22 Mask@0)) (and (= Result@0 (MapType0Select Heap@22 diz@@29 Wand_state_contains_for_state_contains__out_1)) (= (ControlFlow 0 2) (- 0 1)))) (not (= Result@0 null))))))
(let ((anon11_correct  (=> (and (and (forall ((o_8 T@U) (f_12 T@U) ) (! (let ((B@@11 (FieldTypeInv1 (type f_12))))
(let ((A@@12 (FieldTypeInv0 (type f_12))))
 (=> (and (and (= (type o_8) RefType) (= (type f_12) (FieldType A@@12 B@@11))) (or (U_2_bool (MapType1Select (MapType0Select Heap@17 null (|Wand_state_contains_for_state_contains__valid_wand#sm| diz@@29)) o_8 f_12)) (U_2_bool (MapType1Select (MapType0Select Heap@17 null (|Wand_state_contains_for_state_contains__valid_wand#sm| (MapType0Select Heap@17 diz@@29 Wand_state_contains_for_state_contains__wand_1))) o_8 f_12)))) (U_2_bool (MapType1Select newPMask@1 o_8 f_12)))))
 :qid |stdinbpl.1391:33|
 :skolemid |77|
 :pattern ( (MapType1Select newPMask@1 o_8 f_12))
)) (= Heap@18 (MapType0Store Heap@17 null (|Wand_state_contains_for_state_contains__valid_wand#sm| diz@@29) newPMask@1))) (and (= Heap@19 Heap@18) (= (ControlFlow 0 4) 2))) anon12_correct)))
(let ((anon18_Else_correct  (=> (= (MapType0Select Heap@15 (MapType0Select Heap@15 diz@@29 Wand_state_contains_for_state_contains__prev_1) Tree__right) null) (=> (and (= Heap@17 Heap@15) (= (ControlFlow 0 6) 4)) anon11_correct))))
(let ((anon18_Then_correct  (=> (not (= (MapType0Select Heap@15 (MapType0Select Heap@15 diz@@29 Wand_state_contains_for_state_contains__prev_1) Tree__right) null)) (=> (and (and (forall ((o_7 T@U) (f_11 T@U) ) (! (let ((B@@12 (FieldTypeInv1 (type f_11))))
(let ((A@@13 (FieldTypeInv0 (type f_11))))
 (=> (and (and (= (type o_7) RefType) (= (type f_11) (FieldType A@@13 B@@12))) (or (U_2_bool (MapType1Select (MapType0Select Heap@15 null (|Wand_state_contains_for_state_contains__valid_wand#sm| diz@@29)) o_7 f_11)) (U_2_bool (MapType1Select (MapType0Select Heap@15 null (|Tree__state#sm| (MapType0Select Heap@15 (MapType0Select Heap@15 diz@@29 Wand_state_contains_for_state_contains__prev_1) Tree__right))) o_7 f_11)))) (U_2_bool (MapType1Select newPMask@0 o_7 f_11)))))
 :qid |stdinbpl.1384:35|
 :skolemid |76|
 :pattern ( (MapType1Select newPMask@0 o_7 f_11))
)) (= Heap@16 (MapType0Store Heap@15 null (|Wand_state_contains_for_state_contains__valid_wand#sm| diz@@29) newPMask@0))) (and (= Heap@17 Heap@16) (= (ControlFlow 0 5) 4))) anon11_correct))))
(let ((anon17_Then_correct  (=> (and (and (= (U_2_int (MapType0Select Heap@12 diz@@29 Wand_state_contains_for_state_contains__lemma)) 1) (= Heap@13 (MapType0Store Heap@12 null (|Wand_state_contains_for_state_contains__valid_wand#sm| diz@@29) (MapType1Store (MapType0Select Heap@12 null (|Wand_state_contains_for_state_contains__valid_wand#sm| diz@@29)) (MapType0Select Heap@12 diz@@29 Wand_state_contains_for_state_contains__prev_1) Tree__left (bool_2_U true))))) (and (= Heap@14 (MapType0Store Heap@13 null (|Wand_state_contains_for_state_contains__valid_wand#sm| diz@@29) (MapType1Store (MapType0Select Heap@13 null (|Wand_state_contains_for_state_contains__valid_wand#sm| diz@@29)) (MapType0Select Heap@13 diz@@29 Wand_state_contains_for_state_contains__prev_1) Tree__data (bool_2_U true)))) (= Heap@15 (MapType0Store Heap@14 null (|Wand_state_contains_for_state_contains__valid_wand#sm| diz@@29) (MapType1Store (MapType0Select Heap@14 null (|Wand_state_contains_for_state_contains__valid_wand#sm| diz@@29)) (MapType0Select Heap@14 diz@@29 Wand_state_contains_for_state_contains__prev_1) Tree__right (bool_2_U true)))))) (and (=> (= (ControlFlow 0 7) 5) anon18_Then_correct) (=> (= (ControlFlow 0 7) 6) anon18_Else_correct)))))
(let ((anon17_Else_correct  (=> (not (= (U_2_int (MapType0Select Heap@12 diz@@29 Wand_state_contains_for_state_contains__lemma)) 1)) (=> (and (= Heap@19 Heap@12) (= (ControlFlow 0 3) 2)) anon12_correct))))
(let ((anon8_correct  (=> (and (<= (U_2_int (MapType0Select Heap@@41 diz@@29 Wand_state_contains_for_state_contains__lemma)) 2) (state Heap@@41 UnfoldingMask@23)) (and (=> (= (ControlFlow 0 8) (- 0 9)) (HasDirectPerm UnfoldingMask@23 diz@@29 Wand_state_contains_for_state_contains__out_1)) (=> (HasDirectPerm UnfoldingMask@23 diz@@29 Wand_state_contains_for_state_contains__out_1) (=> (= Heap@0 (MapType0Store Heap@@41 null (|Wand_state_contains_for_state_contains__valid_wand#sm| diz@@29) (MapType1Store (MapType0Select Heap@@41 null (|Wand_state_contains_for_state_contains__valid_wand#sm| diz@@29)) diz@@29 Wand_state_contains_for_state_contains__lemma (bool_2_U true)))) (=> (and (and (= Heap@1 (MapType0Store Heap@0 null (|Wand_state_contains_for_state_contains__valid_wand#sm| diz@@29) (MapType1Store (MapType0Select Heap@0 null (|Wand_state_contains_for_state_contains__valid_wand#sm| diz@@29)) diz@@29 Wand_state_contains_for_state_contains__in_1 (bool_2_U true)))) (= Heap@2 (MapType0Store Heap@1 null (|Wand_state_contains_for_state_contains__valid_wand#sm| diz@@29) (MapType1Store (MapType0Select Heap@1 null (|Wand_state_contains_for_state_contains__valid_wand#sm| diz@@29)) diz@@29 Wand_state_contains_for_state_contains__in_1_0 (bool_2_U true))))) (and (= Heap@3 (MapType0Store Heap@2 null (|Wand_state_contains_for_state_contains__valid_wand#sm| diz@@29) (MapType1Store (MapType0Select Heap@2 null (|Wand_state_contains_for_state_contains__valid_wand#sm| diz@@29)) diz@@29 Wand_state_contains_for_state_contains__out_1 (bool_2_U true)))) (= Heap@4 (MapType0Store Heap@3 null (|Wand_state_contains_for_state_contains__valid_wand#sm| diz@@29) (MapType1Store (MapType0Select Heap@3 null (|Wand_state_contains_for_state_contains__valid_wand#sm| diz@@29)) diz@@29 Wand_state_contains_for_state_contains__out_1_0 (bool_2_U true)))))) (=> (and (and (and (= Heap@5 (MapType0Store Heap@4 null (|Wand_state_contains_for_state_contains__valid_wand#sm| diz@@29) (MapType1Store (MapType0Select Heap@4 null (|Wand_state_contains_for_state_contains__valid_wand#sm| diz@@29)) diz@@29 Wand_state_contains_for_state_contains__this_1 (bool_2_U true)))) (= Heap@6 (MapType0Store Heap@5 null (|Wand_state_contains_for_state_contains__valid_wand#sm| diz@@29) (MapType1Store (MapType0Select Heap@5 null (|Wand_state_contains_for_state_contains__valid_wand#sm| diz@@29)) diz@@29 Wand_state_contains_for_state_contains__target_contents_1 (bool_2_U true))))) (and (= Heap@7 (MapType0Store Heap@6 null (|Wand_state_contains_for_state_contains__valid_wand#sm| diz@@29) (MapType1Store (MapType0Select Heap@6 null (|Wand_state_contains_for_state_contains__valid_wand#sm| diz@@29)) diz@@29 Wand_state_contains_for_state_contains__prev_contents_1 (bool_2_U true)))) (= Heap@8 (MapType0Store Heap@7 null (|Wand_state_contains_for_state_contains__valid_wand#sm| diz@@29) (MapType1Store (MapType0Select Heap@7 null (|Wand_state_contains_for_state_contains__valid_wand#sm| diz@@29)) diz@@29 Wand_state_contains_for_state_contains__prev_1 (bool_2_U true)))))) (and (and (= Heap@9 (MapType0Store Heap@8 null (|Wand_state_contains_for_state_contains__valid_wand#sm| diz@@29) (MapType1Store (MapType0Select Heap@8 null (|Wand_state_contains_for_state_contains__valid_wand#sm| diz@@29)) diz@@29 Wand_state_contains_for_state_contains__cur_contents_1 (bool_2_U true)))) (= Heap@10 (MapType0Store Heap@9 null (|Wand_state_contains_for_state_contains__valid_wand#sm| diz@@29) (MapType1Store (MapType0Select Heap@9 null (|Wand_state_contains_for_state_contains__valid_wand#sm| diz@@29)) diz@@29 Wand_state_contains_for_state_contains__top_1 (bool_2_U true))))) (and (= Heap@11 (MapType0Store Heap@10 null (|Wand_state_contains_for_state_contains__valid_wand#sm| diz@@29) (MapType1Store (MapType0Select Heap@10 null (|Wand_state_contains_for_state_contains__valid_wand#sm| diz@@29)) diz@@29 Wand_state_contains_for_state_contains__cur_1 (bool_2_U true)))) (= Heap@12 (MapType0Store Heap@11 null (|Wand_state_contains_for_state_contains__valid_wand#sm| diz@@29) (MapType1Store (MapType0Select Heap@11 null (|Wand_state_contains_for_state_contains__valid_wand#sm| diz@@29)) diz@@29 Wand_state_contains_for_state_contains__wand_1 (bool_2_U true))))))) (and (=> (= (ControlFlow 0 8) 7) anon17_Then_correct) (=> (= (ControlFlow 0 8) 3) anon17_Else_correct))))))))))
(let ((anon16_Else_correct  (=> (and (not (= (U_2_int (MapType0Select Heap@@41 diz@@29 Wand_state_contains_for_state_contains__lemma)) 2)) (= (ControlFlow 0 11) 8)) anon8_correct)))
(let ((anon16_Then_correct  (=> (= (U_2_int (MapType0Select Heap@@41 diz@@29 Wand_state_contains_for_state_contains__lemma)) 2) (=> (and (not (= (MapType0Select Heap@@41 diz@@29 Wand_state_contains_for_state_contains__this_2) null)) (= (MapType0Select Heap@@41 diz@@29 Wand_state_contains_for_state_contains__in_1) (MapType0Select Heap@@41 diz@@29 Wand_state_contains_for_state_contains__top_2))) (=> (and (and (|Seq#Equal| (MapType0Select Heap@@41 diz@@29 Wand_state_contains_for_state_contains__in_1_0) (MapType0Select Heap@@41 diz@@29 Wand_state_contains_for_state_contains__target_contents_2)) (= (MapType0Select Heap@@41 diz@@29 Wand_state_contains_for_state_contains__out_1) (MapType0Select Heap@@41 diz@@29 Wand_state_contains_for_state_contains__top_2))) (and (|Seq#Equal| (MapType0Select Heap@@41 diz@@29 Wand_state_contains_for_state_contains__out_1_0) (MapType0Select Heap@@41 diz@@29 Wand_state_contains_for_state_contains__target_contents_2)) (= (ControlFlow 0 10) 8))) anon8_correct)))))
(let ((anon6_correct  (=> (and (and (> wildcard@13 NoPerm) (not (= diz@@29 null))) (and (= UnfoldingMask@21 (MapType1Store UnfoldingMask@20 diz@@29 Wand_state_contains_for_state_contains__this_2 (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@20 diz@@29 Wand_state_contains_for_state_contains__this_2)) wildcard@13)))) (state Heap@@41 UnfoldingMask@21))) (=> (and (and (and (> wildcard@14 NoPerm) (not (= diz@@29 null))) (and (= UnfoldingMask@22 (MapType1Store UnfoldingMask@21 diz@@29 Wand_state_contains_for_state_contains__target_contents_2 (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@21 diz@@29 Wand_state_contains_for_state_contains__target_contents_2)) wildcard@14)))) (state Heap@@41 UnfoldingMask@22))) (and (and (> wildcard@15 NoPerm) (not (= diz@@29 null))) (and (= UnfoldingMask@23 (MapType1Store UnfoldingMask@22 diz@@29 Wand_state_contains_for_state_contains__top_2 (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@22 diz@@29 Wand_state_contains_for_state_contains__top_2)) wildcard@15)))) (state Heap@@41 UnfoldingMask@23)))) (and (=> (= (ControlFlow 0 12) 10) anon16_Then_correct) (=> (= (ControlFlow 0 12) 11) anon16_Else_correct))))))
(let ((anon5_correct  (=> (= (MapType0Select Heap@@41 (MapType0Select Heap@@41 diz@@29 Wand_state_contains_for_state_contains__prev_1) Tree__left) (MapType0Select Heap@@41 diz@@29 Wand_state_contains_for_state_contains__cur_1)) (=> (and (and (state Heap@@41 UnfoldingMask@18) (|Seq#Equal| (MapType0Select Heap@@41 diz@@29 Wand_state_contains_for_state_contains__prev_contents_1) (|Seq#Append| (|Seq#Append| (MapType0Select Heap@@41 diz@@29 Wand_state_contains_for_state_contains__cur_contents_1) (|Seq#Singleton| (MapType0Select Heap@@41 (MapType0Select Heap@@41 diz@@29 Wand_state_contains_for_state_contains__prev_1) Tree__data))) (Tree__tolist Heap@@41 (MapType0Select Heap@@41 (MapType0Select Heap@@41 diz@@29 Wand_state_contains_for_state_contains__prev_1) Tree__right))))) (and (not (= (MapType0Select Heap@@41 diz@@29 Wand_state_contains_for_state_contains__wand_1) null)) (= UnfoldingMask@19 (MapType1Store UnfoldingMask@18 null (Wand_state_contains_for_state_contains__valid_wand (MapType0Select Heap@@41 diz@@29 Wand_state_contains_for_state_contains__wand_1)) (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@18 null (Wand_state_contains_for_state_contains__valid_wand (MapType0Select Heap@@41 diz@@29 Wand_state_contains_for_state_contains__wand_1)))) FullPerm)))))) (=> (and (and (and (and (InsidePredicate (Wand_state_contains_for_state_contains__valid_wand diz@@29) (MapType0Select Heap@@41 null (Wand_state_contains_for_state_contains__valid_wand diz@@29)) (Wand_state_contains_for_state_contains__valid_wand (MapType0Select Heap@@41 diz@@29 Wand_state_contains_for_state_contains__wand_1)) (MapType0Select Heap@@41 null (Wand_state_contains_for_state_contains__valid_wand (MapType0Select Heap@@41 diz@@29 Wand_state_contains_for_state_contains__wand_1)))) (state Heap@@41 UnfoldingMask@19)) (and (state Heap@@41 UnfoldingMask@19) (= (Wand_state_contains_for_state_contains__get_in_1 Heap@@41 (MapType0Select Heap@@41 diz@@29 Wand_state_contains_for_state_contains__wand_1)) (MapType0Select Heap@@41 diz@@29 Wand_state_contains_for_state_contains__prev_1)))) (and (and (state Heap@@41 UnfoldingMask@19) (|Seq#Equal| (Wand_state_contains_for_state_contains__get_in_1_0 Heap@@41 (MapType0Select Heap@@41 diz@@29 Wand_state_contains_for_state_contains__wand_1)) (|Seq#Drop| (MapType0Select Heap@@41 diz@@29 Wand_state_contains_for_state_contains__prev_contents_1) 1))) (and (state Heap@@41 UnfoldingMask@19) (= (Wand_state_contains_for_state_contains__get_out_1 Heap@@41 (MapType0Select Heap@@41 diz@@29 Wand_state_contains_for_state_contains__wand_1)) (MapType0Select Heap@@41 diz@@29 Wand_state_contains_for_state_contains__top_1))))) (and (and (and (state Heap@@41 UnfoldingMask@19) (|Seq#Equal| (Wand_state_contains_for_state_contains__get_out_1_0 Heap@@41 (MapType0Select Heap@@41 diz@@29 Wand_state_contains_for_state_contains__wand_1)) (MapType0Select Heap@@41 diz@@29 Wand_state_contains_for_state_contains__target_contents_1))) (and (= (MapType0Select Heap@@41 diz@@29 Wand_state_contains_for_state_contains__in_1) (MapType0Select Heap@@41 diz@@29 Wand_state_contains_for_state_contains__cur_1)) (|Seq#Equal| (MapType0Select Heap@@41 diz@@29 Wand_state_contains_for_state_contains__in_1_0) (|Seq#Drop| (MapType0Select Heap@@41 diz@@29 Wand_state_contains_for_state_contains__cur_contents_1) 1)))) (and (and (= (MapType0Select Heap@@41 diz@@29 Wand_state_contains_for_state_contains__out_1) (MapType0Select Heap@@41 diz@@29 Wand_state_contains_for_state_contains__top_1)) (|Seq#Equal| (MapType0Select Heap@@41 diz@@29 Wand_state_contains_for_state_contains__out_1_0) (MapType0Select Heap@@41 diz@@29 Wand_state_contains_for_state_contains__target_contents_1))) (and (= UnfoldingMask@20 UnfoldingMask@19) (= (ControlFlow 0 14) 12))))) anon6_correct)))))
(let ((anon15_Else_correct  (=> (= (MapType0Select Heap@@41 (MapType0Select Heap@@41 diz@@29 Wand_state_contains_for_state_contains__prev_1) Tree__right) null) (=> (and (= UnfoldingMask@18 UnfoldingMask@16) (= (ControlFlow 0 16) 14)) anon5_correct))))
(let ((anon15_Then_correct  (=> (and (not (= (MapType0Select Heap@@41 (MapType0Select Heap@@41 diz@@29 Wand_state_contains_for_state_contains__prev_1) Tree__right) null)) (= UnfoldingMask@17 (MapType1Store UnfoldingMask@16 null (Tree__state (MapType0Select Heap@@41 (MapType0Select Heap@@41 diz@@29 Wand_state_contains_for_state_contains__prev_1) Tree__right)) (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@16 null (Tree__state (MapType0Select Heap@@41 (MapType0Select Heap@@41 diz@@29 Wand_state_contains_for_state_contains__prev_1) Tree__right)))) FullPerm))))) (=> (and (and (InsidePredicate (Wand_state_contains_for_state_contains__valid_wand diz@@29) (MapType0Select Heap@@41 null (Wand_state_contains_for_state_contains__valid_wand diz@@29)) (Tree__state (MapType0Select Heap@@41 (MapType0Select Heap@@41 diz@@29 Wand_state_contains_for_state_contains__prev_1) Tree__right)) (MapType0Select Heap@@41 null (Tree__state (MapType0Select Heap@@41 (MapType0Select Heap@@41 diz@@29 Wand_state_contains_for_state_contains__prev_1) Tree__right)))) (state Heap@@41 UnfoldingMask@17)) (and (= UnfoldingMask@18 UnfoldingMask@17) (= (ControlFlow 0 15) 14))) anon5_correct))))
(let ((anon14_Then_correct  (=> (= (U_2_int (MapType0Select Heap@@41 diz@@29 Wand_state_contains_for_state_contains__lemma)) 1) (=> (and (and (not (= (MapType0Select Heap@@41 diz@@29 Wand_state_contains_for_state_contains__this_1) null)) (> (|Seq#Length| (MapType0Select Heap@@41 diz@@29 Wand_state_contains_for_state_contains__prev_contents_1)) 0)) (and (> (|Seq#Length| (MapType0Select Heap@@41 diz@@29 Wand_state_contains_for_state_contains__cur_contents_1)) 0) (not (= (MapType0Select Heap@@41 diz@@29 Wand_state_contains_for_state_contains__prev_1) null)))) (=> (and (and (and (= UnfoldingMask@14 (MapType1Store UnfoldingMask@13 (MapType0Select Heap@@41 diz@@29 Wand_state_contains_for_state_contains__prev_1) Tree__left (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@13 (MapType0Select Heap@@41 diz@@29 Wand_state_contains_for_state_contains__prev_1) Tree__left)) FullPerm)))) (state Heap@@41 UnfoldingMask@14)) (and (not (= (MapType0Select Heap@@41 diz@@29 Wand_state_contains_for_state_contains__prev_1) null)) (= UnfoldingMask@15 (MapType1Store UnfoldingMask@14 (MapType0Select Heap@@41 diz@@29 Wand_state_contains_for_state_contains__prev_1) Tree__data (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@14 (MapType0Select Heap@@41 diz@@29 Wand_state_contains_for_state_contains__prev_1) Tree__data)) FullPerm)))))) (and (and (state Heap@@41 UnfoldingMask@15) (not (= (MapType0Select Heap@@41 diz@@29 Wand_state_contains_for_state_contains__prev_1) null))) (and (= UnfoldingMask@16 (MapType1Store UnfoldingMask@15 (MapType0Select Heap@@41 diz@@29 Wand_state_contains_for_state_contains__prev_1) Tree__right (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@15 (MapType0Select Heap@@41 diz@@29 Wand_state_contains_for_state_contains__prev_1) Tree__right)) FullPerm)))) (state Heap@@41 UnfoldingMask@16)))) (and (=> (= (ControlFlow 0 17) 15) anon15_Then_correct) (=> (= (ControlFlow 0 17) 16) anon15_Else_correct)))))))
(let ((anon14_Else_correct  (=> (not (= (U_2_int (MapType0Select Heap@@41 diz@@29 Wand_state_contains_for_state_contains__lemma)) 1)) (=> (and (= UnfoldingMask@20 UnfoldingMask@13) (= (ControlFlow 0 13) 12)) anon6_correct))))
(let ((anon2_correct  (=> (and (and (and (= UnfoldingMask@0 (MapType1Store Mask@0 null (Wand_state_contains_for_state_contains__valid_wand diz@@29) (real_2_U (- (U_2_real (MapType1Select Mask@0 null (Wand_state_contains_for_state_contains__valid_wand diz@@29))) FullPerm)))) (> wildcard@0 NoPerm)) (and (not (= diz@@29 null)) (= UnfoldingMask@1 (MapType1Store UnfoldingMask@0 diz@@29 Wand_state_contains_for_state_contains__lemma (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@0 diz@@29 Wand_state_contains_for_state_contains__lemma)) wildcard@0)))))) (and (and (state Heap@@41 UnfoldingMask@1) (<= 1 (U_2_int (MapType0Select Heap@@41 diz@@29 Wand_state_contains_for_state_contains__lemma)))) (and (> wildcard@1 NoPerm) (not (= diz@@29 null))))) (=> (and (and (and (and (= UnfoldingMask@2 (MapType1Store UnfoldingMask@1 diz@@29 Wand_state_contains_for_state_contains__in_1 (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@1 diz@@29 Wand_state_contains_for_state_contains__in_1)) wildcard@1)))) (state Heap@@41 UnfoldingMask@2)) (and (not (= (MapType0Select Heap@@41 diz@@29 Wand_state_contains_for_state_contains__in_1) null)) (> wildcard@2 NoPerm))) (and (and (not (= diz@@29 null)) (= UnfoldingMask@3 (MapType1Store UnfoldingMask@2 diz@@29 Wand_state_contains_for_state_contains__in_1_0 (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@2 diz@@29 Wand_state_contains_for_state_contains__in_1_0)) wildcard@2))))) (and (state Heap@@41 UnfoldingMask@3) (> wildcard@3 NoPerm)))) (and (and (and (not (= diz@@29 null)) (= UnfoldingMask@4 (MapType1Store UnfoldingMask@3 diz@@29 Wand_state_contains_for_state_contains__out_1 (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@3 diz@@29 Wand_state_contains_for_state_contains__out_1)) wildcard@3))))) (and (state Heap@@41 UnfoldingMask@4) (not (= (MapType0Select Heap@@41 diz@@29 Wand_state_contains_for_state_contains__out_1) null)))) (and (and (> wildcard@4 NoPerm) (not (= diz@@29 null))) (and (= UnfoldingMask@5 (MapType1Store UnfoldingMask@4 diz@@29 Wand_state_contains_for_state_contains__out_1_0 (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@4 diz@@29 Wand_state_contains_for_state_contains__out_1_0)) wildcard@4)))) (state Heap@@41 UnfoldingMask@5))))) (=> (and (and (and (and (and (> wildcard@5 NoPerm) (not (= diz@@29 null))) (and (= UnfoldingMask@6 (MapType1Store UnfoldingMask@5 diz@@29 Wand_state_contains_for_state_contains__this_1 (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@5 diz@@29 Wand_state_contains_for_state_contains__this_1)) wildcard@5)))) (state Heap@@41 UnfoldingMask@6))) (and (and (> wildcard@6 NoPerm) (not (= diz@@29 null))) (and (= UnfoldingMask@7 (MapType1Store UnfoldingMask@6 diz@@29 Wand_state_contains_for_state_contains__target_contents_1 (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@6 diz@@29 Wand_state_contains_for_state_contains__target_contents_1)) wildcard@6)))) (state Heap@@41 UnfoldingMask@7)))) (and (and (and (> wildcard@7 NoPerm) (not (= diz@@29 null))) (and (= UnfoldingMask@8 (MapType1Store UnfoldingMask@7 diz@@29 Wand_state_contains_for_state_contains__prev_contents_1 (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@7 diz@@29 Wand_state_contains_for_state_contains__prev_contents_1)) wildcard@7)))) (state Heap@@41 UnfoldingMask@8))) (and (and (> wildcard@8 NoPerm) (not (= diz@@29 null))) (and (= UnfoldingMask@9 (MapType1Store UnfoldingMask@8 diz@@29 Wand_state_contains_for_state_contains__prev_1 (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@8 diz@@29 Wand_state_contains_for_state_contains__prev_1)) wildcard@8)))) (state Heap@@41 UnfoldingMask@9))))) (and (and (and (and (> wildcard@9 NoPerm) (not (= diz@@29 null))) (and (= UnfoldingMask@10 (MapType1Store UnfoldingMask@9 diz@@29 Wand_state_contains_for_state_contains__cur_contents_1 (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@9 diz@@29 Wand_state_contains_for_state_contains__cur_contents_1)) wildcard@9)))) (state Heap@@41 UnfoldingMask@10))) (and (and (> wildcard@10 NoPerm) (not (= diz@@29 null))) (and (= UnfoldingMask@11 (MapType1Store UnfoldingMask@10 diz@@29 Wand_state_contains_for_state_contains__top_1 (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@10 diz@@29 Wand_state_contains_for_state_contains__top_1)) wildcard@10)))) (state Heap@@41 UnfoldingMask@11)))) (and (and (and (> wildcard@11 NoPerm) (not (= diz@@29 null))) (and (= UnfoldingMask@12 (MapType1Store UnfoldingMask@11 diz@@29 Wand_state_contains_for_state_contains__cur_1 (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@11 diz@@29 Wand_state_contains_for_state_contains__cur_1)) wildcard@11)))) (state Heap@@41 UnfoldingMask@12))) (and (and (> wildcard@12 NoPerm) (not (= diz@@29 null))) (and (= UnfoldingMask@13 (MapType1Store UnfoldingMask@12 diz@@29 Wand_state_contains_for_state_contains__wand_1 (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@12 diz@@29 Wand_state_contains_for_state_contains__wand_1)) wildcard@12)))) (state Heap@@41 UnfoldingMask@13)))))) (and (=> (= (ControlFlow 0 18) 17) anon14_Then_correct) (=> (= (ControlFlow 0 18) 13) anon14_Else_correct)))))))
(let ((anon13_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 21) 18)) anon2_correct)))
(let ((anon13_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 19) (- 0 20)) (<= FullPerm (U_2_real (MapType1Select Mask@0 null (Wand_state_contains_for_state_contains__valid_wand diz@@29))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@0 null (Wand_state_contains_for_state_contains__valid_wand diz@@29)))) (=> (= (ControlFlow 0 19) 18) anon2_correct))))))
(let ((anon0_correct  (=> (and (state Heap@@41 ZeroMask) (U_2_bool (MapType0Select Heap@@41 diz@@29 $allocated))) (=> (and (and (and (= AssumeFunctionsAbove 4) (not (= diz@@29 null))) (and (state Heap@@41 ZeroMask) (= Mask@0 (MapType1Store ZeroMask null (Wand_state_contains_for_state_contains__valid_wand diz@@29) (real_2_U (+ (U_2_real (MapType1Select ZeroMask null (Wand_state_contains_for_state_contains__valid_wand diz@@29))) FullPerm)))))) (and (and (state Heap@@41 Mask@0) (state Heap@@41 Mask@0)) (and (|Wand_state_contains_for_state_contains__valid_wand#trigger| Heap@@41 (Wand_state_contains_for_state_contains__valid_wand diz@@29)) (= (MapType0Select Heap@@41 null (Wand_state_contains_for_state_contains__valid_wand diz@@29)) (CombineFrames (FrameFragment (MapType0Select Heap@@41 diz@@29 Wand_state_contains_for_state_contains__lemma)) (CombineFrames (FrameFragment (MapType0Select Heap@@41 diz@@29 Wand_state_contains_for_state_contains__in_1)) (CombineFrames (FrameFragment (MapType0Select Heap@@41 diz@@29 Wand_state_contains_for_state_contains__in_1_0)) (CombineFrames (FrameFragment (MapType0Select Heap@@41 diz@@29 Wand_state_contains_for_state_contains__out_1)) (CombineFrames (FrameFragment (MapType0Select Heap@@41 diz@@29 Wand_state_contains_for_state_contains__out_1_0)) (CombineFrames (FrameFragment (MapType0Select Heap@@41 diz@@29 Wand_state_contains_for_state_contains__this_1)) (CombineFrames (FrameFragment (MapType0Select Heap@@41 diz@@29 Wand_state_contains_for_state_contains__target_contents_1)) (CombineFrames (FrameFragment (MapType0Select Heap@@41 diz@@29 Wand_state_contains_for_state_contains__prev_contents_1)) (CombineFrames (FrameFragment (MapType0Select Heap@@41 diz@@29 Wand_state_contains_for_state_contains__prev_1)) (CombineFrames (FrameFragment (MapType0Select Heap@@41 diz@@29 Wand_state_contains_for_state_contains__cur_contents_1)) (CombineFrames (FrameFragment (MapType0Select Heap@@41 diz@@29 Wand_state_contains_for_state_contains__top_1)) (CombineFrames (FrameFragment (MapType0Select Heap@@41 diz@@29 Wand_state_contains_for_state_contains__cur_1)) (CombineFrames (FrameFragment (MapType0Select Heap@@41 diz@@29 Wand_state_contains_for_state_contains__wand_1)) (CombineFrames (FrameFragment (ite (= (U_2_int (MapType0Select Heap@@41 diz@@29 Wand_state_contains_for_state_contains__lemma)) 1) (CombineFrames (CombineFrames (FrameFragment (MapType0Select Heap@@41 (MapType0Select Heap@@41 diz@@29 Wand_state_contains_for_state_contains__prev_1) Tree__left)) (FrameFragment (MapType0Select Heap@@41 (MapType0Select Heap@@41 diz@@29 Wand_state_contains_for_state_contains__prev_1) Tree__data))) (CombineFrames (CombineFrames (FrameFragment (MapType0Select Heap@@41 (MapType0Select Heap@@41 diz@@29 Wand_state_contains_for_state_contains__prev_1) Tree__right)) (FrameFragment (ite (not (= (MapType0Select Heap@@41 (MapType0Select Heap@@41 diz@@29 Wand_state_contains_for_state_contains__prev_1) Tree__right) null)) (MapType0Select Heap@@41 null (Tree__state (MapType0Select Heap@@41 (MapType0Select Heap@@41 diz@@29 Wand_state_contains_for_state_contains__prev_1) Tree__right))) EmptyFrame))) (MapType0Select Heap@@41 null (Wand_state_contains_for_state_contains__valid_wand (MapType0Select Heap@@41 diz@@29 Wand_state_contains_for_state_contains__wand_1))))) EmptyFrame)) (CombineFrames (FrameFragment (MapType0Select Heap@@41 diz@@29 Wand_state_contains_for_state_contains__this_2)) (CombineFrames (FrameFragment (MapType0Select Heap@@41 diz@@29 Wand_state_contains_for_state_contains__target_contents_2)) (CombineFrames (FrameFragment (MapType0Select Heap@@41 diz@@29 Wand_state_contains_for_state_contains__top_2)) (FrameFragment (ite (= (U_2_int (MapType0Select Heap@@41 diz@@29 Wand_state_contains_for_state_contains__lemma)) 2) EmptyFrame EmptyFrame))))))))))))))))))))))) (and (=> (= (ControlFlow 0 22) 19) anon13_Then_correct) (=> (= (ControlFlow 0 22) 21) anon13_Else_correct))))))
(let ((PreconditionGeneratedEntry_correct  (=> (and (and (> wildcard NoPerm) true) (= (ControlFlow 0 23) 22)) anon0_correct)))
PreconditionGeneratedEntry_correct)))))))))))))))))))))
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
; Valid

(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun PostMask@2 () T@U)
(declare-fun PostMask@1 () T@U)
(declare-fun sys__result () T@U)
(declare-fun PostMask@3 () T@U)
(declare-fun PostHeap@0 () T@U)
(declare-fun Heap@@41 () T@U)
(declare-fun top () T@U)
(declare-fun Mask@0 () T@U)
(declare-fun PostMask@4 () T@U)
(declare-fun PostMask@5 () T@U)
(declare-fun PostMask@0 () T@U)
(declare-fun ExhaleWellDef0Mask@18 () T@U)
(declare-fun Mask@8 () T@U)
(declare-fun __flatten_36@0 () T@U)
(declare-fun ExhaleWellDef0Mask@19 () T@U)
(declare-fun Heap@1 () T@U)
(declare-fun ExhaleWellDef0Mask@20 () T@U)
(declare-fun ExhaleWellDef0Mask@21 () T@U)
(declare-fun AssertMask@3 () T@U)
(declare-fun ExhaleWellDef0Mask@22 () T@U)
(declare-fun ExhaleWellDef0Mask@23 () T@U)
(declare-fun __flatten_76@0 () T@U)
(declare-fun ExhaleWellDef0Mask@24 () T@U)
(declare-fun ExhaleWellDef0Mask@25 () T@U)
(declare-fun ExhaleWellDef0Mask@26 () T@U)
(declare-fun ExhaleWellDef0Mask@27 () T@U)
(declare-fun Mask@114 () T@U)
(declare-fun vwand@1 () T@U)
(declare-fun ExhaleHeap@0 () T@U)
(declare-fun cur_contents@0 () T@U)
(declare-fun cur@0 () T@U)
(declare-fun left@1 () T@U)
(declare-fun Mask@113 () T@U)
(declare-fun Mask@119 () T@U)
(declare-fun Mask@120 () T@U)
(declare-fun Mask@121 () T@U)
(declare-fun Mask@122 () T@U)
(declare-fun Mask@123 () T@U)
(declare-fun Mask@124 () T@U)
(declare-fun Mask@111 () T@U)
(declare-fun Mask@112 () T@U)
(declare-fun Mask@109 () T@U)
(declare-fun Mask@110 () T@U)
(declare-fun Mask@106 () T@U)
(declare-fun Mask@107 () T@U)
(declare-fun Mask@108 () T@U)
(declare-fun Mask@33 () T@U)
(declare-fun Mask@105 () T@U)
(declare-fun Mask@31 () T@U)
(declare-fun Mask@30 () T@U)
(declare-fun Mask@32 () T@U)
(declare-fun Mask@98 () T@U)
(declare-fun Mask@97 () T@U)
(declare-fun __flatten_40@1 () T@U)
(declare-fun ExhaleHeap@8 () T@U)
(declare-fun cur_contents@2 () T@U)
(declare-fun target_contents@0 () T@U)
(declare-fun left@2 () T@U)
(declare-fun Mask@96 () T@U)
(declare-fun Mask@95 () T@U)
(declare-fun Mask@94 () T@U)
(declare-fun Mask@93 () T@U)
(declare-fun Mask@92 () T@U)
(declare-fun Mask@91 () T@U)
(declare-fun Mask@90 () T@U)
(declare-fun Mask@89 () T@U)
(declare-fun Mask@88 () T@U)
(declare-fun Mask@87 () T@U)
(declare-fun Mask@86 () T@U)
(declare-fun Mask@85 () T@U)
(declare-fun Mask@84 () T@U)
(declare-fun Mask@83 () T@U)
(declare-fun Heap@16 () T@U)
(declare-fun arg_in_1_0@0 () T@U)
(declare-fun Mask@82 () T@U)
(declare-fun Mask@81 () T@U)
(declare-fun Mask@80 () T@U)
(declare-fun Mask@79 () T@U)
(declare-fun Mask@78 () T@U)
(declare-fun diz@@29 () T@U)
(declare-fun current_thread_id () Int)
(declare-fun ExhaleWellDef0Mask@12 () T@U)
(declare-fun ExhaleWellDef0Mask@13 () T@U)
(declare-fun __flatten_80@1 () T@U)
(declare-fun cur_contents@1 () T@U)
(declare-fun Mask@99 () T@U)
(declare-fun Mask@100 () T@U)
(declare-fun __flatten_79@1 () T@U)
(declare-fun __flatten_78@1 () T@U)
(declare-fun Mask@101 () T@U)
(declare-fun Mask@102 () T@U)
(declare-fun Mask@103 () T@U)
(declare-fun Mask@104 () T@U)
(declare-fun Mask@76 () T@U)
(declare-fun Mask@77 () T@U)
(declare-fun Mask@74 () T@U)
(declare-fun Mask@75 () T@U)
(declare-fun Mask@72 () T@U)
(declare-fun Mask@71 () T@U)
(declare-fun Mask@73 () T@U)
(declare-fun Heap@15 () T@U)
(declare-fun newVersion@2 () T@U)
(declare-fun Mask@70 () T@U)
(declare-fun Mask@69 () T@U)
(declare-fun CombineFrames (T@U T@U) T@U)
(declare-fun Mask@67 () T@U)
(declare-fun Mask@68 () T@U)
(declare-fun Mask@65 () T@U)
(declare-fun Mask@66 () T@U)
(declare-fun Mask@63 () T@U)
(declare-fun Mask@62 () T@U)
(declare-fun Mask@64 () T@U)
(declare-fun Mask@36 () T@U)
(declare-fun Mask@61 () T@U)
(declare-fun Mask@34 () T@U)
(declare-fun Mask@35 () T@U)
(declare-fun ExhaleWellDef0Mask@0 () T@U)
(declare-fun Mask@60 () T@U)
(declare-fun ExhaleWellDef0Mask@1 () T@U)
(declare-fun ExhaleHeap@1 () T@U)
(declare-fun ExhaleWellDef0Mask@2 () T@U)
(declare-fun ExhaleWellDef0Mask@3 () T@U)
(declare-fun AssertMask@2 () T@U)
(declare-fun Mask@59 () T@U)
(declare-fun Mask@58 () T@U)
(declare-fun Heap@14 () T@U)
(declare-fun Mask@57 () T@U)
(declare-fun ExhaleWellDef0Mask@4 () T@U)
(declare-fun ExhaleWellDef0Mask@5 () T@U)
(declare-fun AssertMask@1 () T@U)
(declare-fun ExhaleWellDef0Mask@6 () T@U)
(declare-fun ExhaleWellDef0Mask@7 () T@U)
(declare-fun ExhaleWellDef0Mask@8 () T@U)
(declare-fun ExhaleWellDef0Mask@9 () T@U)
(declare-fun AssertMask@0 () T@U)
(declare-fun ExhaleWellDef0Mask@10 () T@U)
(declare-fun ExhaleWellDef0Mask@11 () T@U)
(declare-fun Heap@12 () T@U)
(declare-fun newPMask@1 () T@U)
(declare-fun Heap@13 () T@U)
(declare-fun Heap@10 () T@U)
(declare-fun newPMask@0 () T@U)
(declare-fun Heap@11 () T@U)
(declare-fun Heap@8 () T@U)
(declare-fun Heap@7 () T@U)
(declare-fun Heap@9 () T@U)
(declare-fun Heap@4 () T@U)
(declare-fun Heap@5 () T@U)
(declare-fun Heap@6 () T@U)
(declare-fun freshVersion@0 () T@U)
(declare-fun Mask@56 () T@U)
(declare-fun Mask@55 () T@U)
(declare-fun Mask@54 () T@U)
(declare-fun Mask@53 () T@U)
(declare-fun Mask@52 () T@U)
(declare-fun Mask@51 () T@U)
(declare-fun Mask@50 () T@U)
(declare-fun Mask@49 () T@U)
(declare-fun Mask@48 () T@U)
(declare-fun __flatten_41@0 () T@U)
(declare-fun Mask@46 () T@U)
(declare-fun Mask@47 () T@U)
(declare-fun Mask@44 () T@U)
(declare-fun Mask@45 () T@U)
(declare-fun Mask@42 () T@U)
(declare-fun Mask@41 () T@U)
(declare-fun Mask@43 () T@U)
(declare-fun Mask@39 () T@U)
(declare-fun Mask@40 () T@U)
(declare-fun Mask@37 () T@U)
(declare-fun Mask@38 () T@U)
(declare-fun Mask@29 () T@U)
(declare-fun vwand@0 () T@U)
(declare-fun Heap@3 () T@U)
(declare-fun prev@0 () T@U)
(declare-fun __flatten_40@0 () T@U)
(declare-fun left@0 () T@U)
(declare-fun Mask@28 () T@U)
(declare-fun Mask@27 () T@U)
(declare-fun Mask@26 () T@U)
(declare-fun Mask@25 () T@U)
(declare-fun Mask@24 () T@U)
(declare-fun Mask@23 () T@U)
(declare-fun Mask@22 () T@U)
(declare-fun Mask@21 () T@U)
(declare-fun Mask@20 () T@U)
(declare-fun Mask@19 () T@U)
(declare-fun Mask@18 () T@U)
(declare-fun Mask@17 () T@U)
(declare-fun Mask@16 () T@U)
(declare-fun Mask@14 () T@U)
(declare-fun Mask@15 () T@U)
(declare-fun Mask@12 () T@U)
(declare-fun Mask@13 () T@U)
(declare-fun Mask@10 () T@U)
(declare-fun Mask@9 () T@U)
(declare-fun Mask@11 () T@U)
(declare-fun Heap@2 () T@U)
(declare-fun newVersion@1 () T@U)
(declare-fun ExhaleWellDef0Mask@14 () T@U)
(declare-fun ExhaleWellDef0Mask@15 () T@U)
(declare-fun ExhaleWellDef0Mask@16 () T@U)
(declare-fun ExhaleWellDef0Mask@17 () T@U)
(declare-fun Mask@6 () T@U)
(declare-fun Mask@7 () T@U)
(declare-fun Mask@4 () T@U)
(declare-fun Mask@5 () T@U)
(declare-fun Mask@2 () T@U)
(declare-fun Mask@1 () T@U)
(declare-fun Mask@3 () T@U)
(declare-fun Heap@0 () T@U)
(declare-fun newVersion@0 () T@U)
(declare-fun __flatten_77@0 () T@U)
(declare-fun Mask@125 () T@U)
(declare-fun Mask@126 () T@U)
(declare-fun Mask@127 () T@U)
(declare-fun Mask@128 () T@U)
(declare-fun prev () T@U)
(declare-fun vwand () T@U)
(declare-fun left () T@U)
(declare-fun cur () T@U)
(declare-fun __flatten_36 () T@U)
(declare-fun __flatten_40 () T@U)
(declare-fun __flatten_41 () T@U)
(declare-fun __flatten_43 () T@U)
(declare-fun __flatten_82 () T@U)
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (= (type top) RefType) (= (type Mask@128) (MapType1Type RefType realType))) (= (type Mask@0) (MapType1Type RefType realType))) (= (type Mask@127) (MapType1Type RefType realType))) (= (type Mask@126) (MapType1Type RefType realType))) (= (type Mask@125) (MapType1Type RefType realType))) (= (type left@0) RefType)) (= (type ExhaleWellDef0Mask@17) (MapType1Type RefType realType))) (= (type Mask@8) (MapType1Type RefType realType))) (= (type ExhaleWellDef0Mask@16) (MapType1Type RefType realType))) (= (type Heap@1) (MapType0Type RefType))) (= (type ExhaleWellDef0Mask@15) (MapType1Type RefType realType))) (= (type ExhaleWellDef0Mask@14) (MapType1Type RefType realType))) (= (type cur@0) RefType)) (= (type ExhaleWellDef0Mask@11) (MapType1Type RefType realType))) (= (type Mask@57) (MapType1Type RefType realType))) (= (type ExhaleWellDef0Mask@10) (MapType1Type RefType realType))) (= (type ExhaleWellDef0Mask@9) (MapType1Type RefType realType))) (= (type ExhaleWellDef0Mask@8) (MapType1Type RefType realType))) (= (type ExhaleWellDef0Mask@7) (MapType1Type RefType realType))) (= (type ExhaleWellDef0Mask@6) (MapType1Type RefType realType))) (= (type ExhaleWellDef0Mask@5) (MapType1Type RefType realType))) (= (type ExhaleWellDef0Mask@4) (MapType1Type RefType realType))) (= (type ExhaleWellDef0Mask@3) (MapType1Type RefType realType))) (= (type Mask@60) (MapType1Type RefType realType))) (= (type ExhaleWellDef0Mask@2) (MapType1Type RefType realType))) (= (type Heap@@41) (MapType0Type RefType))) (= (type ExhaleHeap@1) (MapType0Type RefType))) (= (type ExhaleWellDef0Mask@1) (MapType1Type RefType realType))) (= (type ExhaleWellDef0Mask@0) (MapType1Type RefType realType))) (= (type AssertMask@2) (MapType1Type RefType realType))) (= (type Mask@59) (MapType1Type RefType realType))) (= (type Mask@58) (MapType1Type RefType realType))) (= (type Heap@14) (MapType0Type RefType))) (= (type vwand@1) RefType)) (= (type cur_contents@0) (SeqType intType))) (= (type AssertMask@1) (MapType1Type RefType realType))) (= (type AssertMask@0) (MapType1Type RefType realType))) (= (type Heap@12) (MapType0Type RefType))) (= (type newPMask@1) (MapType1Type RefType boolType))) (= (type Heap@13) (MapType0Type RefType))) (= (type Heap@10) (MapType0Type RefType))) (= (type newPMask@0) (MapType1Type RefType boolType))) (= (type Heap@11) (MapType0Type RefType))) (= (type Heap@8) (MapType0Type RefType))) (= (type Heap@7) (MapType0Type RefType))) (= (type Heap@9) (MapType0Type RefType))) (= (type Heap@5) (MapType0Type RefType))) (= (type Heap@4) (MapType0Type RefType))) (= (type Heap@6) (MapType0Type RefType))) (= (type freshVersion@0) FrameTypeType)) (= (type Mask@56) (MapType1Type RefType realType))) (forall ((arg0@@60 T@U) (arg1@@31 T@U) ) (! (= (type (CombineFrames arg0@@60 arg1@@31)) FrameTypeType)
 :qid |funType:CombineFrames|
 :pattern ( (CombineFrames arg0@@60 arg1@@31))
))) (= (type Mask@54) (MapType1Type RefType realType))) (= (type Mask@55) (MapType1Type RefType realType))) (= (type Mask@52) (MapType1Type RefType realType))) (= (type Mask@53) (MapType1Type RefType realType))) (= (type Mask@51) (MapType1Type RefType realType))) (= (type Mask@50) (MapType1Type RefType realType))) (= (type Mask@49) (MapType1Type RefType realType))) (= (type ExhaleHeap@0) (MapType0Type RefType))) (= (type Mask@48) (MapType1Type RefType realType))) (= (type left@1) RefType)) (= (type target_contents@0) (SeqType intType))) (= (type __flatten_41@0) RefType)) (= (type Mask@47) (MapType1Type RefType realType))) (= (type Mask@46) (MapType1Type RefType realType))) (= (type Mask@45) (MapType1Type RefType realType))) (= (type Mask@44) (MapType1Type RefType realType))) (= (type Mask@42) (MapType1Type RefType realType))) (= (type Mask@41) (MapType1Type RefType realType))) (= (type Mask@43) (MapType1Type RefType realType))) (= (type Mask@40) (MapType1Type RefType realType))) (= (type Mask@39) (MapType1Type RefType realType))) (= (type Mask@30) (MapType1Type RefType realType))) (= (type Mask@37) (MapType1Type RefType realType))) (= (type Mask@38) (MapType1Type RefType realType))) (= (type Heap@16) (MapType0Type RefType))) (= (type left@2) RefType)) (= (type Mask@104) (MapType1Type RefType realType))) (= (type Mask@78) (MapType1Type RefType realType))) (= (type Mask@103) (MapType1Type RefType realType))) (= (type Mask@102) (MapType1Type RefType realType))) (= (type Mask@101) (MapType1Type RefType realType))) (= (type Mask@100) (MapType1Type RefType realType))) (= (type Mask@99) (MapType1Type RefType realType))) (= (type ExhaleWellDef0Mask@13) (MapType1Type RefType realType))) (= (type ExhaleWellDef0Mask@12) (MapType1Type RefType realType))) (= (type Mask@98) (MapType1Type RefType realType))) (= (type Mask@97) (MapType1Type RefType realType))) (= (type __flatten_40@1) RefType)) (= (type ExhaleHeap@8) (MapType0Type RefType))) (= (type cur_contents@2) (SeqType intType))) (= (type Mask@95) (MapType1Type RefType realType))) (= (type Mask@96) (MapType1Type RefType realType))) (= (type Mask@93) (MapType1Type RefType realType))) (= (type Mask@94) (MapType1Type RefType realType))) (= (type Mask@92) (MapType1Type RefType realType))) (= (type Mask@91) (MapType1Type RefType realType))) (= (type Mask@90) (MapType1Type RefType realType))) (= (type Mask@88) (MapType1Type RefType realType))) (= (type Mask@89) (MapType1Type RefType realType))) (= (type Mask@87) (MapType1Type RefType realType))) (= (type Mask@86) (MapType1Type RefType realType))) (= (type Mask@85) (MapType1Type RefType realType))) (= (type Mask@84) (MapType1Type RefType realType))) (= (type Mask@83) (MapType1Type RefType realType))) (= (type arg_in_1_0@0) (SeqType intType))) (= (type Mask@81) (MapType1Type RefType realType))) (= (type Mask@82) (MapType1Type RefType realType))) (= (type Mask@80) (MapType1Type RefType realType))) (= (type Mask@79) (MapType1Type RefType realType))) (= (type diz@@29) RefType)) (= (type __flatten_80@1) (SeqType intType))) (= (type cur_contents@1) (SeqType intType))) (= (type __flatten_79@1) (SeqType intType))) (= (type __flatten_78@1) (SeqType intType))) (= (type Mask@77) (MapType1Type RefType realType))) (= (type Mask@76) (MapType1Type RefType realType))) (= (type Mask@75) (MapType1Type RefType realType))) (= (type Mask@74) (MapType1Type RefType realType))) (= (type Mask@72) (MapType1Type RefType realType))) (= (type Mask@71) (MapType1Type RefType realType))) (= (type Mask@73) (MapType1Type RefType realType))) (= (type Heap@15) (MapType0Type RefType))) (= (type newVersion@2) FrameTypeType)) (= (type Mask@70) (MapType1Type RefType realType))) (= (type Mask@69) (MapType1Type RefType realType))) (= (type Mask@68) (MapType1Type RefType realType))) (= (type Mask@67) (MapType1Type RefType realType))) (= (type Mask@66) (MapType1Type RefType realType))) (= (type Mask@65) (MapType1Type RefType realType))) (= (type Mask@63) (MapType1Type RefType realType))) (= (type Mask@62) (MapType1Type RefType realType))) (= (type Mask@64) (MapType1Type RefType realType))) (= (type Mask@61) (MapType1Type RefType realType))) (= (type Mask@36) (MapType1Type RefType realType))) (= (type Mask@34) (MapType1Type RefType realType))) (= (type Mask@35) (MapType1Type RefType realType))) (= (type Mask@124) (MapType1Type RefType realType))) (= (type Mask@113) (MapType1Type RefType realType))) (= (type Mask@123) (MapType1Type RefType realType))) (= (type Mask@122) (MapType1Type RefType realType))) (= (type Mask@121) (MapType1Type RefType realType))) (= (type Mask@120) (MapType1Type RefType realType))) (= (type Mask@119) (MapType1Type RefType realType))) (= (type Mask@114) (MapType1Type RefType realType))) (= (type Mask@111) (MapType1Type RefType realType))) (= (type Mask@112) (MapType1Type RefType realType))) (= (type Mask@109) (MapType1Type RefType realType))) (= (type Mask@110) (MapType1Type RefType realType))) (= (type Mask@106) (MapType1Type RefType realType))) (= (type Mask@107) (MapType1Type RefType realType))) (= (type Mask@108) (MapType1Type RefType realType))) (= (type Mask@33) (MapType1Type RefType realType))) (= (type Mask@105) (MapType1Type RefType realType))) (= (type Mask@31) (MapType1Type RefType realType))) (= (type Mask@32) (MapType1Type RefType realType))) (= (type Mask@29) (MapType1Type RefType realType))) (= (type vwand@0) RefType)) (= (type Heap@3) (MapType0Type RefType))) (= (type __flatten_76@0) (SeqType intType))) (= (type prev@0) RefType)) (= (type __flatten_40@0) RefType)) (= (type Mask@27) (MapType1Type RefType realType))) (= (type Mask@28) (MapType1Type RefType realType))) (= (type Mask@25) (MapType1Type RefType realType))) (= (type Mask@26) (MapType1Type RefType realType))) (= (type Mask@24) (MapType1Type RefType realType))) (= (type Mask@23) (MapType1Type RefType realType))) (= (type Mask@22) (MapType1Type RefType realType))) (= (type Mask@20) (MapType1Type RefType realType))) (= (type Mask@21) (MapType1Type RefType realType))) (= (type Mask@19) (MapType1Type RefType realType))) (= (type Mask@18) (MapType1Type RefType realType))) (= (type Mask@17) (MapType1Type RefType realType))) (= (type Mask@16) (MapType1Type RefType realType))) (= (type Mask@15) (MapType1Type RefType realType))) (= (type Mask@14) (MapType1Type RefType realType))) (= (type Mask@13) (MapType1Type RefType realType))) (= (type Mask@12) (MapType1Type RefType realType))) (= (type Mask@10) (MapType1Type RefType realType))) (= (type Mask@9) (MapType1Type RefType realType))) (= (type Mask@11) (MapType1Type RefType realType))) (= (type Heap@2) (MapType0Type RefType))) (= (type newVersion@1) FrameTypeType)) (= (type ExhaleWellDef0Mask@27) (MapType1Type RefType realType))) (= (type ExhaleWellDef0Mask@26) (MapType1Type RefType realType))) (= (type ExhaleWellDef0Mask@25) (MapType1Type RefType realType))) (= (type ExhaleWellDef0Mask@24) (MapType1Type RefType realType))) (= (type ExhaleWellDef0Mask@23) (MapType1Type RefType realType))) (= (type ExhaleWellDef0Mask@22) (MapType1Type RefType realType))) (= (type __flatten_36@0) RefType)) (= (type ExhaleWellDef0Mask@21) (MapType1Type RefType realType))) (= (type ExhaleWellDef0Mask@20) (MapType1Type RefType realType))) (= (type ExhaleWellDef0Mask@19) (MapType1Type RefType realType))) (= (type ExhaleWellDef0Mask@18) (MapType1Type RefType realType))) (= (type AssertMask@3) (MapType1Type RefType realType))) (= (type Mask@7) (MapType1Type RefType realType))) (= (type Mask@6) (MapType1Type RefType realType))) (= (type Mask@5) (MapType1Type RefType realType))) (= (type Mask@4) (MapType1Type RefType realType))) (= (type Mask@2) (MapType1Type RefType realType))) (= (type Mask@1) (MapType1Type RefType realType))) (= (type Mask@3) (MapType1Type RefType realType))) (= (type Heap@0) (MapType0Type RefType))) (= (type newVersion@0) FrameTypeType)) (= (type __flatten_77@0) (SeqType intType))) (= (type prev) RefType)) (= (type vwand) RefType)) (= (type left) RefType)) (= (type cur) RefType)) (= (type __flatten_36) RefType)) (= (type __flatten_40) RefType)) (= (type __flatten_41) RefType)) (= (type __flatten_43) RefType)) (= (type __flatten_82) RefType)) (= (type sys__result) RefType)) (= (type PostMask@5) (MapType1Type RefType realType))) (= (type PostMask@1) (MapType1Type RefType realType))) (= (type PostMask@4) (MapType1Type RefType realType))) (= (type PostHeap@0) (MapType0Type RefType))) (= (type PostMask@3) (MapType1Type RefType realType))) (= (type PostMask@2) (MapType1Type RefType realType))) (= (type PostMask@0) (MapType1Type RefType realType))))
(set-info :boogie-vc-id Tree__del_min)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 605) (let ((anon25_correct true))
(let ((anon24_correct  (=> (= PostMask@2 (MapType1Store PostMask@1 null (Tree__state sys__result) (real_2_U (- (U_2_real (MapType1Select PostMask@1 null (Tree__state sys__result))) FullPerm)))) (=> (and (= PostMask@3 PostMask@2) (= (ControlFlow 0 593) 591)) anon25_correct))))
(let ((anon370_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 596) 593)) anon24_correct)))
(let ((anon370_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 594) (- 0 595)) (<= FullPerm (U_2_real (MapType1Select PostMask@1 null (Tree__state sys__result))))) (=> (<= FullPerm (U_2_real (MapType1Select PostMask@1 null (Tree__state sys__result)))) (=> (= (ControlFlow 0 594) 593) anon24_correct))))))
(let ((anon369_Then_correct  (=> (not (= sys__result null)) (and (=> (= (ControlFlow 0 597) 594) anon370_Then_correct) (=> (= (ControlFlow 0 597) 596) anon370_Else_correct)))))
(let ((anon369_Else_correct  (=> (= sys__result null) (=> (and (= PostMask@3 PostMask@1) (= (ControlFlow 0 592) 591)) anon25_correct))))
(let ((anon27_correct true))
(let ((anon368_Else_correct  (=> (and (Tree__sorted PostHeap@0 sys__result) (= (ControlFlow 0 590) 588)) anon27_correct)))
(let ((anon367_Then_correct  (=> (and (Tree__sorted Heap@@41 top) (state PostHeap@0 PostMask@1)) (and (and (=> (= (ControlFlow 0 598) 590) anon368_Else_correct) (=> (= (ControlFlow 0 598) 597) anon369_Then_correct)) (=> (= (ControlFlow 0 598) 592) anon369_Else_correct)))))
(let ((anon367_Else_correct  (=> (and (not (Tree__sorted Heap@@41 top)) (= (ControlFlow 0 589) 588)) anon27_correct)))
(let ((anon18_correct true))
(let ((anon366_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 586) 582)) anon18_correct)))
(let ((anon366_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 584) (- 0 585)) (<= FullPerm (U_2_real (MapType1Select Mask@0 null (Tree__state top))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@0 null (Tree__state top)))) (=> (= (ControlFlow 0 584) 582) anon18_correct))))))
(let ((anon365_Then_correct  (=> (not (= top null)) (and (=> (= (ControlFlow 0 587) 584) anon366_Then_correct) (=> (= (ControlFlow 0 587) 586) anon366_Else_correct)))))
(let ((anon365_Else_correct  (=> (and (= top null) (= (ControlFlow 0 583) 582)) anon18_correct)))
(let ((anon361_Else_correct  (=> (and (|Seq#Equal| (|Seq#Drop| (Tree__tolist Heap@@41 top) 1) (Tree__tolist PostHeap@0 sys__result)) (state PostHeap@0 PostMask@1)) (and (and (and (=> (= (ControlFlow 0 599) 598) anon367_Then_correct) (=> (= (ControlFlow 0 599) 589) anon367_Else_correct)) (=> (= (ControlFlow 0 599) 587) anon365_Then_correct)) (=> (= (ControlFlow 0 599) 583) anon365_Else_correct)))))
(let ((anon13_correct true))
(let ((anon12_correct  (=> (= PostMask@4 (MapType1Store PostMask@1 null (Tree__state sys__result) (real_2_U (- (U_2_real (MapType1Select PostMask@1 null (Tree__state sys__result))) FullPerm)))) (=> (and (= PostMask@5 PostMask@4) (= (ControlFlow 0 577) 575)) anon13_correct))))
(let ((anon363_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 580) 577)) anon12_correct)))
(let ((anon363_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 578) (- 0 579)) (<= FullPerm (U_2_real (MapType1Select PostMask@1 null (Tree__state sys__result))))) (=> (<= FullPerm (U_2_real (MapType1Select PostMask@1 null (Tree__state sys__result)))) (=> (= (ControlFlow 0 578) 577) anon12_correct))))))
(let ((anon362_Then_correct  (=> (not (= sys__result null)) (and (=> (= (ControlFlow 0 581) 578) anon363_Then_correct) (=> (= (ControlFlow 0 581) 580) anon363_Else_correct)))))
(let ((anon362_Else_correct  (=> (= sys__result null) (=> (and (= PostMask@5 PostMask@1) (= (ControlFlow 0 576) 575)) anon13_correct))))
(let ((anon7_correct true))
(let ((anon360_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 573) 569)) anon7_correct)))
(let ((anon360_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 571) (- 0 572)) (<= FullPerm (U_2_real (MapType1Select Mask@0 null (Tree__state top))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@0 null (Tree__state top)))) (=> (= (ControlFlow 0 571) 569) anon7_correct))))))
(let ((anon359_Then_correct  (=> (not (= top null)) (and (=> (= (ControlFlow 0 574) 571) anon360_Then_correct) (=> (= (ControlFlow 0 574) 573) anon360_Else_correct)))))
(let ((anon359_Else_correct  (=> (and (= top null) (= (ControlFlow 0 570) 569)) anon7_correct)))
(let ((anon3_correct  (=> (and (state PostHeap@0 PostMask@1) (state PostHeap@0 PostMask@1)) (and (and (and (and (=> (= (ControlFlow 0 600) 599) anon361_Else_correct) (=> (= (ControlFlow 0 600) 581) anon362_Then_correct)) (=> (= (ControlFlow 0 600) 576) anon362_Else_correct)) (=> (= (ControlFlow 0 600) 574) anon359_Then_correct)) (=> (= (ControlFlow 0 600) 570) anon359_Else_correct)))))
(let ((anon357_Else_correct  (=> (= sys__result null) (=> (and (= PostMask@1 ZeroMask) (= (ControlFlow 0 602) 600)) anon3_correct))))
(let ((anon357_Then_correct  (=> (not (= sys__result null)) (=> (and (and (= PostMask@0 (MapType1Store ZeroMask null (Tree__state sys__result) (real_2_U (+ (U_2_real (MapType1Select ZeroMask null (Tree__state sys__result))) FullPerm)))) (state PostHeap@0 PostMask@0)) (and (= PostMask@1 PostMask@0) (= (ControlFlow 0 601) 600))) anon3_correct))))
(let ((anon356_Then_correct  (=> (state PostHeap@0 ZeroMask) (and (=> (= (ControlFlow 0 603) 601) anon357_Then_correct) (=> (= (ControlFlow 0 603) 602) anon357_Else_correct)))))
(let ((anon93_correct true))
(let ((anon92_correct  (=> (= ExhaleWellDef0Mask@18 (MapType1Store Mask@8 null (Tree__state __flatten_36@0) (real_2_U (- (U_2_real (MapType1Select Mask@8 null (Tree__state __flatten_36@0))) FullPerm)))) (=> (and (= ExhaleWellDef0Mask@19 ExhaleWellDef0Mask@18) (= (ControlFlow 0 528) 526)) anon93_correct))))
(let ((anon405_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 531) 528)) anon92_correct)))
(let ((anon405_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 529) (- 0 530)) (<= FullPerm (U_2_real (MapType1Select Mask@8 null (Tree__state __flatten_36@0))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@8 null (Tree__state __flatten_36@0)))) (=> (= (ControlFlow 0 529) 528) anon92_correct))))))
(let ((anon404_Then_correct  (=> (not (= __flatten_36@0 null)) (and (=> (= (ControlFlow 0 532) 529) anon405_Then_correct) (=> (= (ControlFlow 0 532) 531) anon405_Else_correct)))))
(let ((anon404_Else_correct  (=> (= __flatten_36@0 null) (=> (and (= ExhaleWellDef0Mask@19 Mask@8) (= (ControlFlow 0 527) 526)) anon93_correct))))
(let ((anon95_correct true))
(let ((anon403_Else_correct  (and (=> (= (ControlFlow 0 524) (- 0 525)) (Tree__sorted Heap@1 __flatten_36@0)) (=> (Tree__sorted Heap@1 __flatten_36@0) (=> (= (ControlFlow 0 524) 522) anon95_correct)))))
(let ((anon402_Then_correct  (=> (Tree__sorted Heap@@41 top) (and (and (=> (= (ControlFlow 0 533) 524) anon403_Else_correct) (=> (= (ControlFlow 0 533) 532) anon404_Then_correct)) (=> (= (ControlFlow 0 533) 527) anon404_Else_correct)))))
(let ((anon402_Else_correct  (=> (and (not (Tree__sorted Heap@@41 top)) (= (ControlFlow 0 523) 522)) anon95_correct)))
(let ((anon86_correct true))
(let ((anon401_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 520) 516)) anon86_correct)))
(let ((anon401_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 518) (- 0 519)) (<= FullPerm (U_2_real (MapType1Select Mask@0 null (Tree__state top))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@0 null (Tree__state top)))) (=> (= (ControlFlow 0 518) 516) anon86_correct))))))
(let ((anon400_Then_correct  (=> (not (= top null)) (and (=> (= (ControlFlow 0 521) 518) anon401_Then_correct) (=> (= (ControlFlow 0 521) 520) anon401_Else_correct)))))
(let ((anon400_Else_correct  (=> (and (= top null) (= (ControlFlow 0 517) 516)) anon86_correct)))
(let ((anon396_Else_correct  (and (=> (= (ControlFlow 0 534) (- 0 535)) (|Seq#Equal| (|Seq#Drop| (Tree__tolist Heap@@41 top) 1) (Tree__tolist Heap@1 __flatten_36@0))) (=> (|Seq#Equal| (|Seq#Drop| (Tree__tolist Heap@@41 top) 1) (Tree__tolist Heap@1 __flatten_36@0)) (and (and (and (=> (= (ControlFlow 0 534) 533) anon402_Then_correct) (=> (= (ControlFlow 0 534) 523) anon402_Else_correct)) (=> (= (ControlFlow 0 534) 521) anon400_Then_correct)) (=> (= (ControlFlow 0 534) 517) anon400_Else_correct))))))
(let ((anon81_correct true))
(let ((anon80_correct  (=> (= ExhaleWellDef0Mask@20 (MapType1Store Mask@8 null (Tree__state __flatten_36@0) (real_2_U (- (U_2_real (MapType1Select Mask@8 null (Tree__state __flatten_36@0))) FullPerm)))) (=> (and (= ExhaleWellDef0Mask@21 ExhaleWellDef0Mask@20) (= (ControlFlow 0 511) 509)) anon81_correct))))
(let ((anon398_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 514) 511)) anon80_correct)))
(let ((anon398_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 512) (- 0 513)) (<= FullPerm (U_2_real (MapType1Select Mask@8 null (Tree__state __flatten_36@0))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@8 null (Tree__state __flatten_36@0)))) (=> (= (ControlFlow 0 512) 511) anon80_correct))))))
(let ((anon397_Then_correct  (=> (not (= __flatten_36@0 null)) (and (=> (= (ControlFlow 0 515) 512) anon398_Then_correct) (=> (= (ControlFlow 0 515) 514) anon398_Else_correct)))))
(let ((anon397_Else_correct  (=> (= __flatten_36@0 null) (=> (and (= ExhaleWellDef0Mask@21 Mask@8) (= (ControlFlow 0 510) 509)) anon81_correct))))
(let ((anon75_correct true))
(let ((anon395_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 507) 503)) anon75_correct)))
(let ((anon395_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 505) (- 0 506)) (<= FullPerm (U_2_real (MapType1Select Mask@0 null (Tree__state top))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@0 null (Tree__state top)))) (=> (= (ControlFlow 0 505) 503) anon75_correct))))))
(let ((anon394_Then_correct  (=> (not (= top null)) (and (=> (= (ControlFlow 0 508) 505) anon395_Then_correct) (=> (= (ControlFlow 0 508) 507) anon395_Else_correct)))))
(let ((anon394_Else_correct  (=> (and (= top null) (= (ControlFlow 0 504) 503)) anon75_correct)))
(let ((anon70_correct  (=> (= AssertMask@3 (MapType1Store Mask@8 null (Tree__state __flatten_36@0) (real_2_U (- (U_2_real (MapType1Select Mask@8 null (Tree__state __flatten_36@0))) FullPerm)))) (and (and (and (and (=> (= (ControlFlow 0 537) 534) anon396_Else_correct) (=> (= (ControlFlow 0 537) 515) anon397_Then_correct)) (=> (= (ControlFlow 0 537) 510) anon397_Else_correct)) (=> (= (ControlFlow 0 537) 508) anon394_Then_correct)) (=> (= (ControlFlow 0 537) 504) anon394_Else_correct)))))
(let ((anon392_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 540) 537)) anon70_correct)))
(let ((anon392_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 538) (- 0 539)) (<= FullPerm (U_2_real (MapType1Select Mask@8 null (Tree__state __flatten_36@0))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@8 null (Tree__state __flatten_36@0)))) (=> (= (ControlFlow 0 538) 537) anon70_correct))))))
(let ((anon391_Then_correct  (=> (not (= __flatten_36@0 null)) (and (=> (= (ControlFlow 0 541) 538) anon392_Then_correct) (=> (= (ControlFlow 0 541) 540) anon392_Else_correct)))))
(let ((anon391_Else_correct  (=> (= __flatten_36@0 null) (and (and (and (and (=> (= (ControlFlow 0 536) 534) anon396_Else_correct) (=> (= (ControlFlow 0 536) 515) anon397_Then_correct)) (=> (= (ControlFlow 0 536) 510) anon397_Else_correct)) (=> (= (ControlFlow 0 536) 508) anon394_Then_correct)) (=> (= (ControlFlow 0 536) 504) anon394_Else_correct)))))
(let ((anon388_Else_correct  (and (=> (= (ControlFlow 0 542) (- 0 544)) (|Seq#Equal| (Tree__tolist Heap@1 (MapType0Select Heap@1 top Tree__left)) (|Seq#Empty| intType))) (=> (|Seq#Equal| (Tree__tolist Heap@1 (MapType0Select Heap@1 top Tree__left)) (|Seq#Empty| intType)) (=> (state Heap@1 Mask@8) (and (=> (= (ControlFlow 0 542) (- 0 543)) (HasDirectPerm Mask@8 top Tree__left)) (=> (HasDirectPerm Mask@8 top Tree__left) (=> (= __flatten_36@0 (MapType0Select Heap@1 top Tree__left)) (=> (and (state Heap@1 Mask@8) (state Heap@1 Mask@8)) (and (=> (= (ControlFlow 0 542) 541) anon391_Then_correct) (=> (= (ControlFlow 0 542) 536) anon391_Else_correct)))))))))))
(let ((anon66_correct true))
(let ((anon65_correct  (=> (= ExhaleWellDef0Mask@22 (MapType1Store Mask@8 null (Tree__state (MapType0Select Heap@1 top Tree__left)) (real_2_U (- (U_2_real (MapType1Select Mask@8 null (Tree__state (MapType0Select Heap@1 top Tree__left)))) FullPerm)))) (=> (and (= ExhaleWellDef0Mask@23 ExhaleWellDef0Mask@22) (= (ControlFlow 0 498) 496)) anon66_correct))))
(let ((anon390_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 501) 498)) anon65_correct)))
(let ((anon390_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 499) (- 0 500)) (<= FullPerm (U_2_real (MapType1Select Mask@8 null (Tree__state (MapType0Select Heap@1 top Tree__left)))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@8 null (Tree__state (MapType0Select Heap@1 top Tree__left))))) (=> (= (ControlFlow 0 499) 498) anon65_correct))))))
(let ((anon389_Then_correct  (=> (not (= (MapType0Select Heap@1 top Tree__left) null)) (and (=> (= (ControlFlow 0 502) 499) anon390_Then_correct) (=> (= (ControlFlow 0 502) 501) anon390_Else_correct)))))
(let ((anon389_Else_correct  (=> (= (MapType0Select Heap@1 top Tree__left) null) (=> (and (= ExhaleWellDef0Mask@23 Mask@8) (= (ControlFlow 0 497) 496)) anon66_correct))))
(let ((anon385_Else_correct  (and (=> (= (ControlFlow 0 545) (- 0 547)) (|Seq#Equal| __flatten_76@0 (|Seq#Append| (|Seq#Append| (Tree__tolist Heap@1 (MapType0Select Heap@1 top Tree__left)) (|Seq#Singleton| (MapType0Select Heap@1 top Tree__data))) (Tree__tolist Heap@1 (MapType0Select Heap@1 top Tree__right))))) (=> (|Seq#Equal| __flatten_76@0 (|Seq#Append| (|Seq#Append| (Tree__tolist Heap@1 (MapType0Select Heap@1 top Tree__left)) (|Seq#Singleton| (MapType0Select Heap@1 top Tree__data))) (Tree__tolist Heap@1 (MapType0Select Heap@1 top Tree__right)))) (=> (state Heap@1 Mask@8) (and (=> (= (ControlFlow 0 545) (- 0 546)) (HasDirectPerm Mask@8 top Tree__left)) (=> (HasDirectPerm Mask@8 top Tree__left) (and (and (=> (= (ControlFlow 0 545) 542) anon388_Else_correct) (=> (= (ControlFlow 0 545) 502) anon389_Then_correct)) (=> (= (ControlFlow 0 545) 497) anon389_Else_correct)))))))))
(let ((anon60_correct true))
(let ((anon59_correct  (=> (= ExhaleWellDef0Mask@24 (MapType1Store Mask@8 null (Tree__state (MapType0Select Heap@1 top Tree__right)) (real_2_U (- (U_2_real (MapType1Select Mask@8 null (Tree__state (MapType0Select Heap@1 top Tree__right)))) FullPerm)))) (=> (and (= ExhaleWellDef0Mask@25 ExhaleWellDef0Mask@24) (= (ControlFlow 0 491) 489)) anon60_correct))))
(let ((anon387_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 494) 491)) anon59_correct)))
(let ((anon387_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 492) (- 0 493)) (<= FullPerm (U_2_real (MapType1Select Mask@8 null (Tree__state (MapType0Select Heap@1 top Tree__right)))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@8 null (Tree__state (MapType0Select Heap@1 top Tree__right))))) (=> (= (ControlFlow 0 492) 491) anon59_correct))))))
(let ((anon386_Then_correct  (=> (not (= (MapType0Select Heap@1 top Tree__right) null)) (and (=> (= (ControlFlow 0 495) 492) anon387_Then_correct) (=> (= (ControlFlow 0 495) 494) anon387_Else_correct)))))
(let ((anon386_Else_correct  (=> (= (MapType0Select Heap@1 top Tree__right) null) (=> (and (= ExhaleWellDef0Mask@25 Mask@8) (= (ControlFlow 0 490) 489)) anon60_correct))))
(let ((anon382_Else_correct  (and (=> (= (ControlFlow 0 548) (- 0 550)) (HasDirectPerm Mask@8 top Tree__data)) (=> (HasDirectPerm Mask@8 top Tree__data) (and (=> (= (ControlFlow 0 548) (- 0 549)) (HasDirectPerm Mask@8 top Tree__right)) (=> (HasDirectPerm Mask@8 top Tree__right) (and (and (=> (= (ControlFlow 0 548) 545) anon385_Else_correct) (=> (= (ControlFlow 0 548) 495) anon386_Then_correct)) (=> (= (ControlFlow 0 548) 490) anon386_Else_correct))))))))
(let ((anon54_correct true))
(let ((anon53_correct  (=> (= ExhaleWellDef0Mask@26 (MapType1Store Mask@8 null (Tree__state (MapType0Select Heap@1 top Tree__left)) (real_2_U (- (U_2_real (MapType1Select Mask@8 null (Tree__state (MapType0Select Heap@1 top Tree__left)))) FullPerm)))) (=> (and (= ExhaleWellDef0Mask@27 ExhaleWellDef0Mask@26) (= (ControlFlow 0 484) 482)) anon54_correct))))
(let ((anon384_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 487) 484)) anon53_correct)))
(let ((anon384_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 485) (- 0 486)) (<= FullPerm (U_2_real (MapType1Select Mask@8 null (Tree__state (MapType0Select Heap@1 top Tree__left)))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@8 null (Tree__state (MapType0Select Heap@1 top Tree__left))))) (=> (= (ControlFlow 0 485) 484) anon53_correct))))))
(let ((anon383_Then_correct  (=> (not (= (MapType0Select Heap@1 top Tree__left) null)) (and (=> (= (ControlFlow 0 488) 485) anon384_Then_correct) (=> (= (ControlFlow 0 488) 487) anon384_Else_correct)))))
(let ((anon383_Else_correct  (=> (= (MapType0Select Heap@1 top Tree__left) null) (=> (and (= ExhaleWellDef0Mask@27 Mask@8) (= (ControlFlow 0 483) 482)) anon54_correct))))
(let ((anon381_Then_correct  (=> (= (MapType0Select Heap@1 top Tree__left) null) (and (=> (= (ControlFlow 0 551) (- 0 552)) (HasDirectPerm Mask@8 top Tree__left)) (=> (HasDirectPerm Mask@8 top Tree__left) (and (and (=> (= (ControlFlow 0 551) 548) anon382_Else_correct) (=> (= (ControlFlow 0 551) 488) anon383_Then_correct)) (=> (= (ControlFlow 0 551) 483) anon383_Else_correct)))))))
(let ((anon170_correct true))
(let ((anon443_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 372) 369)) anon170_correct)))
(let ((anon443_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 370) (- 0 371)) (<= FullPerm (U_2_real (MapType1Select Mask@114 null (Wand_state_contains_for_state_contains__valid_wand vwand@1))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@114 null (Wand_state_contains_for_state_contains__valid_wand vwand@1)))) (=> (= (ControlFlow 0 370) 369) anon170_correct))))))
(let ((anon442_Then_correct  (and (=> (= (ControlFlow 0 373) (- 0 374)) (not (= vwand@1 null))) (=> (not (= vwand@1 null)) (and (=> (= (ControlFlow 0 373) 370) anon443_Then_correct) (=> (= (ControlFlow 0 373) 372) anon443_Else_correct))))))
(let ((anon174_correct true))
(let ((anon445_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 365) 362)) anon174_correct)))
(let ((anon445_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 363) (- 0 364)) (<= FullPerm (U_2_real (MapType1Select Mask@114 null (Wand_state_contains_for_state_contains__valid_wand vwand@1))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@114 null (Wand_state_contains_for_state_contains__valid_wand vwand@1)))) (=> (= (ControlFlow 0 363) 362) anon174_correct))))))
(let ((anon444_Then_correct  (and (=> (= (ControlFlow 0 366) (- 0 367)) (not (= vwand@1 null))) (=> (not (= vwand@1 null)) (and (=> (= (ControlFlow 0 366) 363) anon445_Then_correct) (=> (= (ControlFlow 0 366) 365) anon445_Else_correct))))))
(let ((anon178_correct true))
(let ((anon447_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 358) 355)) anon178_correct)))
(let ((anon447_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 356) (- 0 357)) (<= FullPerm (U_2_real (MapType1Select Mask@114 null (Wand_state_contains_for_state_contains__valid_wand vwand@1))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@114 null (Wand_state_contains_for_state_contains__valid_wand vwand@1)))) (=> (= (ControlFlow 0 356) 355) anon178_correct))))))
(let ((anon446_Then_correct  (and (=> (= (ControlFlow 0 359) (- 0 360)) (not (= vwand@1 null))) (=> (not (= vwand@1 null)) (and (=> (= (ControlFlow 0 359) 356) anon447_Then_correct) (=> (= (ControlFlow 0 359) 358) anon447_Else_correct))))))
(let ((anon182_correct true))
(let ((anon449_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 351) 348)) anon182_correct)))
(let ((anon449_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 349) (- 0 350)) (<= FullPerm (U_2_real (MapType1Select Mask@114 null (Wand_state_contains_for_state_contains__valid_wand vwand@1))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@114 null (Wand_state_contains_for_state_contains__valid_wand vwand@1)))) (=> (= (ControlFlow 0 349) 348) anon182_correct))))))
(let ((anon448_Then_correct  (and (=> (= (ControlFlow 0 352) (- 0 353)) (not (= vwand@1 null))) (=> (not (= vwand@1 null)) (and (=> (= (ControlFlow 0 352) 349) anon449_Then_correct) (=> (= (ControlFlow 0 352) 351) anon449_Else_correct))))))
(let ((anon448_Else_correct true))
(let ((anon446_Else_correct  (=> (= (Wand_state_contains_for_state_contains__get_out_1 ExhaleHeap@0 vwand@1) top) (=> (and (state ExhaleHeap@0 Mask@114) (state ExhaleHeap@0 Mask@114)) (and (=> (= (ControlFlow 0 354) 352) anon448_Then_correct) (=> (= (ControlFlow 0 354) 347) anon448_Else_correct))))))
(let ((anon444_Else_correct  (=> (|Seq#Equal| (Wand_state_contains_for_state_contains__get_in_1_0 ExhaleHeap@0 vwand@1) (|Seq#Drop| cur_contents@0 1)) (=> (and (state ExhaleHeap@0 Mask@114) (state ExhaleHeap@0 Mask@114)) (and (=> (= (ControlFlow 0 361) 359) anon446_Then_correct) (=> (= (ControlFlow 0 361) 354) anon446_Else_correct))))))
(let ((anon442_Else_correct  (=> (= (Wand_state_contains_for_state_contains__get_in_1 ExhaleHeap@0 vwand@1) cur@0) (=> (and (state ExhaleHeap@0 Mask@114) (state ExhaleHeap@0 Mask@114)) (and (=> (= (ControlFlow 0 368) 366) anon444_Then_correct) (=> (= (ControlFlow 0 368) 361) anon444_Else_correct))))))
(let ((anon439_Else_correct  (=> (and (and (and (|Seq#Equal| cur_contents@0 (|Seq#Append| (|Seq#Append| (|Seq#Append| (|Seq#Append| (Tree__tolist ExhaleHeap@0 (MapType0Select ExhaleHeap@0 left@1 Tree__left)) (|Seq#Singleton| (MapType0Select ExhaleHeap@0 left@1 Tree__data))) (Tree__tolist ExhaleHeap@0 (MapType0Select ExhaleHeap@0 left@1 Tree__right))) (|Seq#Singleton| (MapType0Select ExhaleHeap@0 cur@0 Tree__data))) (Tree__tolist ExhaleHeap@0 (MapType0Select ExhaleHeap@0 cur@0 Tree__right)))) (state ExhaleHeap@0 Mask@113)) (and (not (= vwand@1 null)) (state ExhaleHeap@0 Mask@113))) (and (and (= Mask@114 (MapType1Store Mask@113 null (Wand_state_contains_for_state_contains__valid_wand vwand@1) (real_2_U (+ (U_2_real (MapType1Select Mask@113 null (Wand_state_contains_for_state_contains__valid_wand vwand@1))) FullPerm)))) (state ExhaleHeap@0 Mask@114)) (and (state ExhaleHeap@0 Mask@114) (state ExhaleHeap@0 Mask@114)))) (and (=> (= (ControlFlow 0 375) 373) anon442_Then_correct) (=> (= (ControlFlow 0 375) 368) anon442_Else_correct)))))
(let ((anon166_correct true))
(let ((anon165_correct  (=> (= Mask@119 (MapType1Store Mask@113 null (Tree__state (MapType0Select ExhaleHeap@0 cur@0 Tree__right)) (real_2_U (- (U_2_real (MapType1Select Mask@113 null (Tree__state (MapType0Select ExhaleHeap@0 cur@0 Tree__right)))) FullPerm)))) (=> (and (= Mask@120 Mask@119) (= (ControlFlow 0 342) 340)) anon166_correct))))
(let ((anon441_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 345) 342)) anon165_correct)))
(let ((anon441_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 343) (- 0 344)) (<= FullPerm (U_2_real (MapType1Select Mask@113 null (Tree__state (MapType0Select ExhaleHeap@0 cur@0 Tree__right)))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@113 null (Tree__state (MapType0Select ExhaleHeap@0 cur@0 Tree__right))))) (=> (= (ControlFlow 0 343) 342) anon165_correct))))))
(let ((anon440_Then_correct  (=> (not (= (MapType0Select ExhaleHeap@0 cur@0 Tree__right) null)) (and (=> (= (ControlFlow 0 346) 343) anon441_Then_correct) (=> (= (ControlFlow 0 346) 345) anon441_Else_correct)))))
(let ((anon440_Else_correct  (=> (= (MapType0Select ExhaleHeap@0 cur@0 Tree__right) null) (=> (and (= Mask@120 Mask@113) (= (ControlFlow 0 341) 340)) anon166_correct))))
(let ((anon436_Else_correct  (and (=> (= (ControlFlow 0 376) (- 0 378)) (HasDirectPerm Mask@113 cur@0 Tree__data)) (=> (HasDirectPerm Mask@113 cur@0 Tree__data) (and (=> (= (ControlFlow 0 376) (- 0 377)) (HasDirectPerm Mask@113 cur@0 Tree__right)) (=> (HasDirectPerm Mask@113 cur@0 Tree__right) (and (and (=> (= (ControlFlow 0 376) 375) anon439_Else_correct) (=> (= (ControlFlow 0 376) 346) anon440_Then_correct)) (=> (= (ControlFlow 0 376) 341) anon440_Else_correct))))))))
(let ((anon160_correct true))
(let ((anon159_correct  (=> (= Mask@121 (MapType1Store Mask@113 null (Tree__state (MapType0Select ExhaleHeap@0 left@1 Tree__right)) (real_2_U (- (U_2_real (MapType1Select Mask@113 null (Tree__state (MapType0Select ExhaleHeap@0 left@1 Tree__right)))) FullPerm)))) (=> (and (= Mask@122 Mask@121) (= (ControlFlow 0 335) 333)) anon160_correct))))
(let ((anon438_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 338) 335)) anon159_correct)))
(let ((anon438_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 336) (- 0 337)) (<= FullPerm (U_2_real (MapType1Select Mask@113 null (Tree__state (MapType0Select ExhaleHeap@0 left@1 Tree__right)))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@113 null (Tree__state (MapType0Select ExhaleHeap@0 left@1 Tree__right))))) (=> (= (ControlFlow 0 336) 335) anon159_correct))))))
(let ((anon437_Then_correct  (=> (not (= (MapType0Select ExhaleHeap@0 left@1 Tree__right) null)) (and (=> (= (ControlFlow 0 339) 336) anon438_Then_correct) (=> (= (ControlFlow 0 339) 338) anon438_Else_correct)))))
(let ((anon437_Else_correct  (=> (= (MapType0Select ExhaleHeap@0 left@1 Tree__right) null) (=> (and (= Mask@122 Mask@113) (= (ControlFlow 0 334) 333)) anon160_correct))))
(let ((anon433_Else_correct  (and (=> (= (ControlFlow 0 379) (- 0 381)) (HasDirectPerm Mask@113 left@1 Tree__data)) (=> (HasDirectPerm Mask@113 left@1 Tree__data) (and (=> (= (ControlFlow 0 379) (- 0 380)) (HasDirectPerm Mask@113 left@1 Tree__right)) (=> (HasDirectPerm Mask@113 left@1 Tree__right) (and (and (=> (= (ControlFlow 0 379) 376) anon436_Else_correct) (=> (= (ControlFlow 0 379) 339) anon437_Then_correct)) (=> (= (ControlFlow 0 379) 334) anon437_Else_correct))))))))
(let ((anon154_correct true))
(let ((anon153_correct  (=> (= Mask@123 (MapType1Store Mask@113 null (Tree__state (MapType0Select ExhaleHeap@0 left@1 Tree__left)) (real_2_U (- (U_2_real (MapType1Select Mask@113 null (Tree__state (MapType0Select ExhaleHeap@0 left@1 Tree__left)))) FullPerm)))) (=> (and (= Mask@124 Mask@123) (= (ControlFlow 0 328) 326)) anon154_correct))))
(let ((anon435_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 331) 328)) anon153_correct)))
(let ((anon435_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 329) (- 0 330)) (<= FullPerm (U_2_real (MapType1Select Mask@113 null (Tree__state (MapType0Select ExhaleHeap@0 left@1 Tree__left)))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@113 null (Tree__state (MapType0Select ExhaleHeap@0 left@1 Tree__left))))) (=> (= (ControlFlow 0 329) 328) anon153_correct))))))
(let ((anon434_Then_correct  (=> (not (= (MapType0Select ExhaleHeap@0 left@1 Tree__left) null)) (and (=> (= (ControlFlow 0 332) 329) anon435_Then_correct) (=> (= (ControlFlow 0 332) 331) anon435_Else_correct)))))
(let ((anon434_Else_correct  (=> (= (MapType0Select ExhaleHeap@0 left@1 Tree__left) null) (=> (and (= Mask@124 Mask@113) (= (ControlFlow 0 327) 326)) anon154_correct))))
(let ((anon149_correct  (=> (and (state ExhaleHeap@0 Mask@113) (state ExhaleHeap@0 Mask@113)) (and (=> (= (ControlFlow 0 382) (- 0 383)) (HasDirectPerm Mask@113 left@1 Tree__left)) (=> (HasDirectPerm Mask@113 left@1 Tree__left) (and (and (=> (= (ControlFlow 0 382) 379) anon433_Else_correct) (=> (= (ControlFlow 0 382) 332) anon434_Then_correct)) (=> (= (ControlFlow 0 382) 327) anon434_Else_correct)))))))
(let ((anon432_Else_correct  (=> (= (MapType0Select ExhaleHeap@0 left@1 Tree__right) null) (=> (and (= Mask@113 Mask@111) (= (ControlFlow 0 386) 382)) anon149_correct))))
(let ((anon432_Then_correct  (=> (not (= (MapType0Select ExhaleHeap@0 left@1 Tree__right) null)) (and (=> (= (ControlFlow 0 384) (- 0 385)) (HasDirectPerm Mask@111 left@1 Tree__right)) (=> (HasDirectPerm Mask@111 left@1 Tree__right) (=> (and (and (= Mask@112 (MapType1Store Mask@111 null (Tree__state (MapType0Select ExhaleHeap@0 left@1 Tree__right)) (real_2_U (+ (U_2_real (MapType1Select Mask@111 null (Tree__state (MapType0Select ExhaleHeap@0 left@1 Tree__right)))) FullPerm)))) (state ExhaleHeap@0 Mask@112)) (and (= Mask@113 Mask@112) (= (ControlFlow 0 384) 382))) anon149_correct))))))
(let ((anon147_correct  (=> (state ExhaleHeap@0 Mask@111) (and (=> (= (ControlFlow 0 387) (- 0 388)) (HasDirectPerm Mask@111 left@1 Tree__right)) (=> (HasDirectPerm Mask@111 left@1 Tree__right) (and (=> (= (ControlFlow 0 387) 384) anon432_Then_correct) (=> (= (ControlFlow 0 387) 386) anon432_Else_correct)))))))
(let ((anon431_Else_correct  (=> (= (MapType0Select ExhaleHeap@0 left@1 Tree__left) null) (=> (and (= Mask@111 Mask@109) (= (ControlFlow 0 391) 387)) anon147_correct))))
(let ((anon431_Then_correct  (=> (not (= (MapType0Select ExhaleHeap@0 left@1 Tree__left) null)) (and (=> (= (ControlFlow 0 389) (- 0 390)) (HasDirectPerm Mask@109 left@1 Tree__left)) (=> (HasDirectPerm Mask@109 left@1 Tree__left) (=> (and (and (= Mask@110 (MapType1Store Mask@109 null (Tree__state (MapType0Select ExhaleHeap@0 left@1 Tree__left)) (real_2_U (+ (U_2_real (MapType1Select Mask@109 null (Tree__state (MapType0Select ExhaleHeap@0 left@1 Tree__left)))) FullPerm)))) (state ExhaleHeap@0 Mask@110)) (and (= Mask@111 Mask@110) (= (ControlFlow 0 389) 387))) anon147_correct))))))
(let ((anon145_correct  (=> (state ExhaleHeap@0 Mask@106) (=> (and (and (not (= left@1 null)) (= Mask@107 (MapType1Store Mask@106 left@1 Tree__left (real_2_U (+ (U_2_real (MapType1Select Mask@106 left@1 Tree__left)) FullPerm))))) (and (state ExhaleHeap@0 Mask@107) (state ExhaleHeap@0 Mask@107))) (=> (and (and (and (not (= left@1 null)) (= Mask@108 (MapType1Store Mask@107 left@1 Tree__data (real_2_U (+ (U_2_real (MapType1Select Mask@107 left@1 Tree__data)) FullPerm))))) (and (state ExhaleHeap@0 Mask@108) (state ExhaleHeap@0 Mask@108))) (and (and (not (= left@1 null)) (= Mask@109 (MapType1Store Mask@108 left@1 Tree__right (real_2_U (+ (U_2_real (MapType1Select Mask@108 left@1 Tree__right)) FullPerm))))) (and (state ExhaleHeap@0 Mask@109) (state ExhaleHeap@0 Mask@109)))) (and (=> (= (ControlFlow 0 392) (- 0 393)) (HasDirectPerm Mask@109 left@1 Tree__left)) (=> (HasDirectPerm Mask@109 left@1 Tree__left) (and (=> (= (ControlFlow 0 392) 389) anon431_Then_correct) (=> (= (ControlFlow 0 392) 391) anon431_Else_correct)))))))))
(let ((anon430_Else_correct  (=> (= (MapType0Select ExhaleHeap@0 cur@0 Tree__right) null) (=> (and (= Mask@106 Mask@33) (= (ControlFlow 0 396) 392)) anon145_correct))))
(let ((anon430_Then_correct  (=> (not (= (MapType0Select ExhaleHeap@0 cur@0 Tree__right) null)) (and (=> (= (ControlFlow 0 394) (- 0 395)) (HasDirectPerm Mask@33 cur@0 Tree__right)) (=> (HasDirectPerm Mask@33 cur@0 Tree__right) (=> (and (and (= Mask@105 (MapType1Store Mask@33 null (Tree__state (MapType0Select ExhaleHeap@0 cur@0 Tree__right)) (real_2_U (+ (U_2_real (MapType1Select Mask@33 null (Tree__state (MapType0Select ExhaleHeap@0 cur@0 Tree__right)))) FullPerm)))) (state ExhaleHeap@0 Mask@105)) (and (= Mask@106 Mask@105) (= (ControlFlow 0 394) 392))) anon145_correct))))))
(let ((anon429_Then_correct  (=> (and (and (not (= cur@0 null)) (= Mask@31 (MapType1Store Mask@30 cur@0 Tree__left (real_2_U (+ (U_2_real (MapType1Select Mask@30 cur@0 Tree__left)) FullPerm))))) (and (state ExhaleHeap@0 Mask@31) (state ExhaleHeap@0 Mask@31))) (=> (and (and (and (not (= cur@0 null)) (= Mask@32 (MapType1Store Mask@31 cur@0 Tree__data (real_2_U (+ (U_2_real (MapType1Select Mask@31 cur@0 Tree__data)) FullPerm))))) (and (state ExhaleHeap@0 Mask@32) (state ExhaleHeap@0 Mask@32))) (and (and (not (= cur@0 null)) (= Mask@33 (MapType1Store Mask@32 cur@0 Tree__right (real_2_U (+ (U_2_real (MapType1Select Mask@32 cur@0 Tree__right)) FullPerm))))) (and (state ExhaleHeap@0 Mask@33) (state ExhaleHeap@0 Mask@33)))) (and (=> (= (ControlFlow 0 397) (- 0 399)) (HasDirectPerm Mask@33 cur@0 Tree__left)) (=> (HasDirectPerm Mask@33 cur@0 Tree__left) (=> (and (= (MapType0Select ExhaleHeap@0 cur@0 Tree__left) left@1) (state ExhaleHeap@0 Mask@33)) (and (=> (= (ControlFlow 0 397) (- 0 398)) (HasDirectPerm Mask@33 cur@0 Tree__right)) (=> (HasDirectPerm Mask@33 cur@0 Tree__right) (and (=> (= (ControlFlow 0 397) 394) anon430_Then_correct) (=> (= (ControlFlow 0 397) 396) anon430_Else_correct)))))))))))
(let ((anon261_correct  (=> (= Mask@98 (MapType1Store Mask@97 null (Wand_state_contains_for_state_contains__valid_wand __flatten_40@1) (real_2_U (- (U_2_real (MapType1Select Mask@97 null (Wand_state_contains_for_state_contains__valid_wand __flatten_40@1))) FullPerm)))) (and (=> (= (ControlFlow 0 195) (- 0 198)) (= (Wand_state_contains_for_state_contains__get_in_1 ExhaleHeap@8 __flatten_40@1) left@1)) (=> (= (Wand_state_contains_for_state_contains__get_in_1 ExhaleHeap@8 __flatten_40@1) left@1) (and (=> (= (ControlFlow 0 195) (- 0 197)) (|Seq#Equal| (Wand_state_contains_for_state_contains__get_in_1_0 ExhaleHeap@8 __flatten_40@1) (|Seq#Drop| cur_contents@2 1))) (=> (|Seq#Equal| (Wand_state_contains_for_state_contains__get_in_1_0 ExhaleHeap@8 __flatten_40@1) (|Seq#Drop| cur_contents@2 1)) (and (=> (= (ControlFlow 0 195) (- 0 196)) (= (Wand_state_contains_for_state_contains__get_out_1 ExhaleHeap@8 __flatten_40@1) top)) (=> (= (Wand_state_contains_for_state_contains__get_out_1 ExhaleHeap@8 __flatten_40@1) top) (=> (= (ControlFlow 0 195) (- 0 194)) (|Seq#Equal| (Wand_state_contains_for_state_contains__get_out_1_0 ExhaleHeap@8 __flatten_40@1) target_contents@0)))))))))))
(let ((anon488_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 201) 195)) anon261_correct)))
(let ((anon488_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 199) (- 0 200)) (<= FullPerm (U_2_real (MapType1Select Mask@97 null (Wand_state_contains_for_state_contains__valid_wand __flatten_40@1))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@97 null (Wand_state_contains_for_state_contains__valid_wand __flatten_40@1)))) (=> (= (ControlFlow 0 199) 195) anon261_correct))))))
(let ((anon259_correct  (and (=> (= (ControlFlow 0 202) (- 0 204)) (|Seq#Equal| cur_contents@2 (|Seq#Append| (|Seq#Append| (|Seq#Append| (|Seq#Append| (Tree__tolist ExhaleHeap@8 (MapType0Select ExhaleHeap@8 left@2 Tree__left)) (|Seq#Singleton| (MapType0Select ExhaleHeap@8 left@2 Tree__data))) (Tree__tolist ExhaleHeap@8 (MapType0Select ExhaleHeap@8 left@2 Tree__right))) (|Seq#Singleton| (MapType0Select ExhaleHeap@8 left@1 Tree__data))) (Tree__tolist ExhaleHeap@8 (MapType0Select ExhaleHeap@8 left@1 Tree__right))))) (=> (|Seq#Equal| cur_contents@2 (|Seq#Append| (|Seq#Append| (|Seq#Append| (|Seq#Append| (Tree__tolist ExhaleHeap@8 (MapType0Select ExhaleHeap@8 left@2 Tree__left)) (|Seq#Singleton| (MapType0Select ExhaleHeap@8 left@2 Tree__data))) (Tree__tolist ExhaleHeap@8 (MapType0Select ExhaleHeap@8 left@2 Tree__right))) (|Seq#Singleton| (MapType0Select ExhaleHeap@8 left@1 Tree__data))) (Tree__tolist ExhaleHeap@8 (MapType0Select ExhaleHeap@8 left@1 Tree__right)))) (and (=> (= (ControlFlow 0 202) (- 0 203)) (not (= __flatten_40@1 null))) (=> (not (= __flatten_40@1 null)) (and (=> (= (ControlFlow 0 202) 199) anon488_Then_correct) (=> (= (ControlFlow 0 202) 201) anon488_Else_correct))))))))
(let ((anon258_correct  (=> (= Mask@96 (MapType1Store Mask@95 null (Tree__state (MapType0Select ExhaleHeap@8 left@2 Tree__right)) (real_2_U (- (U_2_real (MapType1Select Mask@95 null (Tree__state (MapType0Select ExhaleHeap@8 left@2 Tree__right)))) FullPerm)))) (=> (and (= Mask@97 Mask@96) (= (ControlFlow 0 206) 202)) anon259_correct))))
(let ((anon487_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 209) 206)) anon258_correct)))
(let ((anon487_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 207) (- 0 208)) (<= FullPerm (U_2_real (MapType1Select Mask@95 null (Tree__state (MapType0Select ExhaleHeap@8 left@2 Tree__right)))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@95 null (Tree__state (MapType0Select ExhaleHeap@8 left@2 Tree__right))))) (=> (= (ControlFlow 0 207) 206) anon258_correct))))))
(let ((anon486_Then_correct  (=> (not (= (MapType0Select ExhaleHeap@8 left@2 Tree__right) null)) (and (=> (= (ControlFlow 0 210) 207) anon487_Then_correct) (=> (= (ControlFlow 0 210) 209) anon487_Else_correct)))))
(let ((anon486_Else_correct  (=> (= (MapType0Select ExhaleHeap@8 left@2 Tree__right) null) (=> (and (= Mask@97 Mask@95) (= (ControlFlow 0 205) 202)) anon259_correct))))
(let ((anon254_correct  (=> (and (= Mask@94 (MapType1Store Mask@93 null (Tree__state (MapType0Select ExhaleHeap@8 left@2 Tree__left)) (real_2_U (- (U_2_real (MapType1Select Mask@93 null (Tree__state (MapType0Select ExhaleHeap@8 left@2 Tree__left)))) FullPerm)))) (= Mask@95 Mask@94)) (and (=> (= (ControlFlow 0 212) 210) anon486_Then_correct) (=> (= (ControlFlow 0 212) 205) anon486_Else_correct)))))
(let ((anon485_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 215) 212)) anon254_correct)))
(let ((anon485_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 213) (- 0 214)) (<= FullPerm (U_2_real (MapType1Select Mask@93 null (Tree__state (MapType0Select ExhaleHeap@8 left@2 Tree__left)))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@93 null (Tree__state (MapType0Select ExhaleHeap@8 left@2 Tree__left))))) (=> (= (ControlFlow 0 213) 212) anon254_correct))))))
(let ((anon484_Then_correct  (=> (not (= (MapType0Select ExhaleHeap@8 left@2 Tree__left) null)) (and (=> (= (ControlFlow 0 216) 213) anon485_Then_correct) (=> (= (ControlFlow 0 216) 215) anon485_Else_correct)))))
(let ((anon484_Else_correct  (=> (and (= (MapType0Select ExhaleHeap@8 left@2 Tree__left) null) (= Mask@95 Mask@93)) (and (=> (= (ControlFlow 0 211) 210) anon486_Then_correct) (=> (= (ControlFlow 0 211) 205) anon486_Else_correct)))))
(let ((anon251_correct  (=> (= Mask@93 (MapType1Store Mask@92 left@2 Tree__right (real_2_U (- (U_2_real (MapType1Select Mask@92 left@2 Tree__right)) FullPerm)))) (and (=> (= (ControlFlow 0 217) 216) anon484_Then_correct) (=> (= (ControlFlow 0 217) 211) anon484_Else_correct)))))
(let ((anon483_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 220) 217)) anon251_correct)))
(let ((anon483_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 218) (- 0 219)) (<= FullPerm (U_2_real (MapType1Select Mask@92 left@2 Tree__right)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@92 left@2 Tree__right))) (=> (= (ControlFlow 0 218) 217) anon251_correct))))))
(let ((anon249_correct  (=> (= Mask@92 (MapType1Store Mask@91 left@2 Tree__data (real_2_U (- (U_2_real (MapType1Select Mask@91 left@2 Tree__data)) FullPerm)))) (and (=> (= (ControlFlow 0 221) 218) anon483_Then_correct) (=> (= (ControlFlow 0 221) 220) anon483_Else_correct)))))
(let ((anon482_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 224) 221)) anon249_correct)))
(let ((anon482_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 222) (- 0 223)) (<= FullPerm (U_2_real (MapType1Select Mask@91 left@2 Tree__data)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@91 left@2 Tree__data))) (=> (= (ControlFlow 0 222) 221) anon249_correct))))))
(let ((anon247_correct  (=> (= Mask@91 (MapType1Store Mask@90 left@2 Tree__left (real_2_U (- (U_2_real (MapType1Select Mask@90 left@2 Tree__left)) FullPerm)))) (and (=> (= (ControlFlow 0 225) 222) anon482_Then_correct) (=> (= (ControlFlow 0 225) 224) anon482_Else_correct)))))
(let ((anon481_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 228) 225)) anon247_correct)))
(let ((anon481_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 226) (- 0 227)) (<= FullPerm (U_2_real (MapType1Select Mask@90 left@2 Tree__left)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@90 left@2 Tree__left))) (=> (= (ControlFlow 0 226) 225) anon247_correct))))))
(let ((anon244_correct  (=> (and (= Mask@89 (MapType1Store Mask@88 null (Tree__state (MapType0Select ExhaleHeap@8 left@1 Tree__right)) (real_2_U (- (U_2_real (MapType1Select Mask@88 null (Tree__state (MapType0Select ExhaleHeap@8 left@1 Tree__right)))) FullPerm)))) (= Mask@90 Mask@89)) (and (=> (= (ControlFlow 0 230) 226) anon481_Then_correct) (=> (= (ControlFlow 0 230) 228) anon481_Else_correct)))))
(let ((anon480_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 233) 230)) anon244_correct)))
(let ((anon480_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 231) (- 0 232)) (<= FullPerm (U_2_real (MapType1Select Mask@88 null (Tree__state (MapType0Select ExhaleHeap@8 left@1 Tree__right)))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@88 null (Tree__state (MapType0Select ExhaleHeap@8 left@1 Tree__right))))) (=> (= (ControlFlow 0 231) 230) anon244_correct))))))
(let ((anon479_Then_correct  (=> (not (= (MapType0Select ExhaleHeap@8 left@1 Tree__right) null)) (and (=> (= (ControlFlow 0 234) 231) anon480_Then_correct) (=> (= (ControlFlow 0 234) 233) anon480_Else_correct)))))
(let ((anon479_Else_correct  (=> (and (= (MapType0Select ExhaleHeap@8 left@1 Tree__right) null) (= Mask@90 Mask@88)) (and (=> (= (ControlFlow 0 229) 226) anon481_Then_correct) (=> (= (ControlFlow 0 229) 228) anon481_Else_correct)))))
(let ((anon241_correct  (=> (= Mask@88 (MapType1Store Mask@87 left@1 Tree__right (real_2_U (- (U_2_real (MapType1Select Mask@87 left@1 Tree__right)) FullPerm)))) (and (=> (= (ControlFlow 0 235) (- 0 236)) (= (MapType0Select ExhaleHeap@8 left@1 Tree__left) left@2)) (=> (= (MapType0Select ExhaleHeap@8 left@1 Tree__left) left@2) (and (=> (= (ControlFlow 0 235) 234) anon479_Then_correct) (=> (= (ControlFlow 0 235) 229) anon479_Else_correct)))))))
(let ((anon478_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 239) 235)) anon241_correct)))
(let ((anon478_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 237) (- 0 238)) (<= FullPerm (U_2_real (MapType1Select Mask@87 left@1 Tree__right)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@87 left@1 Tree__right))) (=> (= (ControlFlow 0 237) 235) anon241_correct))))))
(let ((anon239_correct  (=> (= Mask@87 (MapType1Store Mask@86 left@1 Tree__data (real_2_U (- (U_2_real (MapType1Select Mask@86 left@1 Tree__data)) FullPerm)))) (and (=> (= (ControlFlow 0 240) 237) anon478_Then_correct) (=> (= (ControlFlow 0 240) 239) anon478_Else_correct)))))
(let ((anon477_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 243) 240)) anon239_correct)))
(let ((anon477_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 241) (- 0 242)) (<= FullPerm (U_2_real (MapType1Select Mask@86 left@1 Tree__data)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@86 left@1 Tree__data))) (=> (= (ControlFlow 0 241) 240) anon239_correct))))))
(let ((anon237_correct  (=> (= Mask@86 (MapType1Store Mask@85 left@1 Tree__left (real_2_U (- (U_2_real (MapType1Select Mask@85 left@1 Tree__left)) FullPerm)))) (and (=> (= (ControlFlow 0 244) 241) anon477_Then_correct) (=> (= (ControlFlow 0 244) 243) anon477_Else_correct)))))
(let ((anon476_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 247) 244)) anon237_correct)))
(let ((anon476_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 245) (- 0 246)) (<= FullPerm (U_2_real (MapType1Select Mask@85 left@1 Tree__left)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@85 left@1 Tree__left))) (=> (= (ControlFlow 0 245) 244) anon237_correct))))))
(let ((anon235_correct  (=> (= Mask@84 (MapType1Store Mask@83 null (Wand_state_contains_for_state_contains__valid_wand vwand@1) (real_2_U (- (U_2_real (MapType1Select Mask@83 null (Wand_state_contains_for_state_contains__valid_wand vwand@1))) FullPerm)))) (and (=> (= (ControlFlow 0 248) (- 0 258)) (= (Wand_state_contains_for_state_contains__get_in_1 Heap@16 vwand@1) cur@0)) (=> (= (Wand_state_contains_for_state_contains__get_in_1 Heap@16 vwand@1) cur@0) (and (=> (= (ControlFlow 0 248) (- 0 257)) (|Seq#Equal| (Wand_state_contains_for_state_contains__get_in_1_0 Heap@16 vwand@1) (|Seq#Drop| cur_contents@0 1))) (=> (|Seq#Equal| (Wand_state_contains_for_state_contains__get_in_1_0 Heap@16 vwand@1) (|Seq#Drop| cur_contents@0 1)) (and (=> (= (ControlFlow 0 248) (- 0 256)) (= (Wand_state_contains_for_state_contains__get_out_1 Heap@16 vwand@1) top)) (=> (= (Wand_state_contains_for_state_contains__get_out_1 Heap@16 vwand@1) top) (and (=> (= (ControlFlow 0 248) (- 0 255)) (|Seq#Equal| (Wand_state_contains_for_state_contains__get_out_1_0 Heap@16 vwand@1) target_contents@0)) (=> (|Seq#Equal| (Wand_state_contains_for_state_contains__get_out_1_0 Heap@16 vwand@1) target_contents@0) (and (=> (= (ControlFlow 0 248) (- 0 254)) (not (= left@1 null))) (=> (not (= left@1 null)) (and (=> (= (ControlFlow 0 248) (- 0 253)) (= left@1 left@1)) (=> (= left@1 left@1) (and (=> (= (ControlFlow 0 248) (- 0 252)) (|Seq#Equal| arg_in_1_0@0 (|Seq#Drop| cur_contents@2 1))) (=> (|Seq#Equal| arg_in_1_0@0 (|Seq#Drop| cur_contents@2 1)) (and (=> (= (ControlFlow 0 248) (- 0 251)) (not (= top null))) (=> (not (= top null)) (and (=> (= (ControlFlow 0 248) (- 0 250)) (= top top)) (=> (= top top) (and (=> (= (ControlFlow 0 248) (- 0 249)) (|Seq#Equal| target_contents@0 target_contents@0)) (=> (|Seq#Equal| target_contents@0 target_contents@0) (=> (and (and (and (and (IdenticalOnKnownLocations Heap@16 ExhaleHeap@8 Mask@84) (not (= __flatten_40@1 null))) (and (= Mask@85 (MapType1Store Mask@84 null (Wand_state_contains_for_state_contains__valid_wand __flatten_40@1) (real_2_U (+ (U_2_real (MapType1Select Mask@84 null (Wand_state_contains_for_state_contains__valid_wand __flatten_40@1))) FullPerm)))) (state ExhaleHeap@8 Mask@85))) (and (and (state ExhaleHeap@8 Mask@85) (= (Wand_state_contains_for_state_contains__get_in_1 ExhaleHeap@8 __flatten_40@1) left@1)) (and (state ExhaleHeap@8 Mask@85) (|Seq#Equal| (Wand_state_contains_for_state_contains__get_in_1_0 ExhaleHeap@8 __flatten_40@1) arg_in_1_0@0)))) (and (and (and (state ExhaleHeap@8 Mask@85) (= (Wand_state_contains_for_state_contains__get_out_1 ExhaleHeap@8 __flatten_40@1) top)) (and (state ExhaleHeap@8 Mask@85) (|Seq#Equal| (Wand_state_contains_for_state_contains__get_out_1_0 ExhaleHeap@8 __flatten_40@1) target_contents@0))) (and (and (state ExhaleHeap@8 Mask@85) (U_2_bool (MapType0Select ExhaleHeap@8 __flatten_40@1 $allocated))) (and (state ExhaleHeap@8 Mask@85) (state ExhaleHeap@8 Mask@85))))) (and (=> (= (ControlFlow 0 248) 245) anon476_Then_correct) (=> (= (ControlFlow 0 248) 247) anon476_Else_correct))))))))))))))))))))))))))
(let ((anon475_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 261) 248)) anon235_correct)))
(let ((anon475_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 259) (- 0 260)) (<= FullPerm (U_2_real (MapType1Select Mask@83 null (Wand_state_contains_for_state_contains__valid_wand vwand@1))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@83 null (Wand_state_contains_for_state_contains__valid_wand vwand@1)))) (=> (= (ControlFlow 0 259) 248) anon235_correct))))))
(let ((anon233_correct  (and (=> (= (ControlFlow 0 262) (- 0 265)) (= (MapType0Select Heap@16 cur@0 Tree__left) left@1)) (=> (= (MapType0Select Heap@16 cur@0 Tree__left) left@1) (and (=> (= (ControlFlow 0 262) (- 0 264)) (|Seq#Equal| cur_contents@0 (|Seq#Append| (|Seq#Append| cur_contents@2 (|Seq#Singleton| (MapType0Select Heap@16 cur@0 Tree__data))) (Tree__tolist Heap@16 (MapType0Select Heap@16 cur@0 Tree__right))))) (=> (|Seq#Equal| cur_contents@0 (|Seq#Append| (|Seq#Append| cur_contents@2 (|Seq#Singleton| (MapType0Select Heap@16 cur@0 Tree__data))) (Tree__tolist Heap@16 (MapType0Select Heap@16 cur@0 Tree__right)))) (and (=> (= (ControlFlow 0 262) (- 0 263)) (not (= vwand@1 null))) (=> (not (= vwand@1 null)) (and (=> (= (ControlFlow 0 262) 259) anon475_Then_correct) (=> (= (ControlFlow 0 262) 261) anon475_Else_correct))))))))))
(let ((anon232_correct  (=> (= Mask@82 (MapType1Store Mask@81 null (Tree__state (MapType0Select Heap@16 cur@0 Tree__right)) (real_2_U (- (U_2_real (MapType1Select Mask@81 null (Tree__state (MapType0Select Heap@16 cur@0 Tree__right)))) FullPerm)))) (=> (and (= Mask@83 Mask@82) (= (ControlFlow 0 267) 262)) anon233_correct))))
(let ((anon474_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 270) 267)) anon232_correct)))
(let ((anon474_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 268) (- 0 269)) (<= FullPerm (U_2_real (MapType1Select Mask@81 null (Tree__state (MapType0Select Heap@16 cur@0 Tree__right)))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@81 null (Tree__state (MapType0Select Heap@16 cur@0 Tree__right))))) (=> (= (ControlFlow 0 268) 267) anon232_correct))))))
(let ((anon473_Then_correct  (=> (not (= (MapType0Select Heap@16 cur@0 Tree__right) null)) (and (=> (= (ControlFlow 0 271) 268) anon474_Then_correct) (=> (= (ControlFlow 0 271) 270) anon474_Else_correct)))))
(let ((anon473_Else_correct  (=> (= (MapType0Select Heap@16 cur@0 Tree__right) null) (=> (and (= Mask@83 Mask@81) (= (ControlFlow 0 266) 262)) anon233_correct))))
(let ((anon229_correct  (=> (= Mask@81 (MapType1Store Mask@80 cur@0 Tree__right (real_2_U (- (U_2_real (MapType1Select Mask@80 cur@0 Tree__right)) FullPerm)))) (and (=> (= (ControlFlow 0 272) 271) anon473_Then_correct) (=> (= (ControlFlow 0 272) 266) anon473_Else_correct)))))
(let ((anon472_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 275) 272)) anon229_correct)))
(let ((anon472_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 273) (- 0 274)) (<= FullPerm (U_2_real (MapType1Select Mask@80 cur@0 Tree__right)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@80 cur@0 Tree__right))) (=> (= (ControlFlow 0 273) 272) anon229_correct))))))
(let ((anon227_correct  (=> (= Mask@80 (MapType1Store Mask@79 cur@0 Tree__data (real_2_U (- (U_2_real (MapType1Select Mask@79 cur@0 Tree__data)) FullPerm)))) (and (=> (= (ControlFlow 0 276) 273) anon472_Then_correct) (=> (= (ControlFlow 0 276) 275) anon472_Else_correct)))))
(let ((anon471_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 279) 276)) anon227_correct)))
(let ((anon471_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 277) (- 0 278)) (<= FullPerm (U_2_real (MapType1Select Mask@79 cur@0 Tree__data)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@79 cur@0 Tree__data))) (=> (= (ControlFlow 0 277) 276) anon227_correct))))))
(let ((anon225_correct  (=> (= Mask@79 (MapType1Store Mask@78 cur@0 Tree__left (real_2_U (- (U_2_real (MapType1Select Mask@78 cur@0 Tree__left)) FullPerm)))) (and (=> (= (ControlFlow 0 280) 277) anon471_Then_correct) (=> (= (ControlFlow 0 280) 279) anon471_Else_correct)))))
(let ((anon470_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 283) 280)) anon225_correct)))
(let ((anon470_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 281) (- 0 282)) (<= FullPerm (U_2_real (MapType1Select Mask@78 cur@0 Tree__left)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@78 cur@0 Tree__left))) (=> (= (ControlFlow 0 281) 280) anon225_correct))))))
(let ((anon467_Else_correct  (and (=> (= (ControlFlow 0 284) (- 0 290)) (|Seq#Equal| cur_contents@0 (|Seq#Append| (|Seq#Append| cur_contents@2 (|Seq#Singleton| (MapType0Select Heap@16 cur@0 Tree__data))) (Tree__tolist Heap@16 (MapType0Select Heap@16 cur@0 Tree__right))))) (=> (|Seq#Equal| cur_contents@0 (|Seq#Append| (|Seq#Append| cur_contents@2 (|Seq#Singleton| (MapType0Select Heap@16 cur@0 Tree__data))) (Tree__tolist Heap@16 (MapType0Select Heap@16 cur@0 Tree__right)))) (=> (and (state Heap@16 Mask@78) (= arg_in_1_0@0 (|Seq#Drop| cur_contents@2 1))) (and (=> (= (ControlFlow 0 284) (- 0 289)) (not (= diz@@29 null))) (=> (not (= diz@@29 null)) (and (=> (= (ControlFlow 0 284) (- 0 288)) (>= current_thread_id 0)) (=> (>= current_thread_id 0) (and (=> (= (ControlFlow 0 284) (- 0 287)) (not (= diz@@29 null))) (=> (not (= diz@@29 null)) (and (=> (= (ControlFlow 0 284) (- 0 286)) (> (|Seq#Length| cur_contents@0) 0)) (=> (> (|Seq#Length| cur_contents@0) 0) (and (=> (= (ControlFlow 0 284) (- 0 285)) (> (|Seq#Length| cur_contents@2) 0)) (=> (> (|Seq#Length| cur_contents@2) 0) (and (=> (= (ControlFlow 0 284) 281) anon470_Then_correct) (=> (= (ControlFlow 0 284) 283) anon470_Else_correct)))))))))))))))))
(let ((anon222_correct true))
(let ((anon221_correct  (=> (= ExhaleWellDef0Mask@12 (MapType1Store Mask@78 null (Tree__state (MapType0Select Heap@16 cur@0 Tree__right)) (real_2_U (- (U_2_real (MapType1Select Mask@78 null (Tree__state (MapType0Select Heap@16 cur@0 Tree__right)))) FullPerm)))) (=> (and (= ExhaleWellDef0Mask@13 ExhaleWellDef0Mask@12) (= (ControlFlow 0 189) 187)) anon222_correct))))
(let ((anon469_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 192) 189)) anon221_correct)))
(let ((anon469_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 190) (- 0 191)) (<= FullPerm (U_2_real (MapType1Select Mask@78 null (Tree__state (MapType0Select Heap@16 cur@0 Tree__right)))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@78 null (Tree__state (MapType0Select Heap@16 cur@0 Tree__right))))) (=> (= (ControlFlow 0 190) 189) anon221_correct))))))
(let ((anon468_Then_correct  (=> (not (= (MapType0Select Heap@16 cur@0 Tree__right) null)) (and (=> (= (ControlFlow 0 193) 190) anon469_Then_correct) (=> (= (ControlFlow 0 193) 192) anon469_Else_correct)))))
(let ((anon468_Else_correct  (=> (= (MapType0Select Heap@16 cur@0 Tree__right) null) (=> (and (= ExhaleWellDef0Mask@13 Mask@78) (= (ControlFlow 0 188) 187)) anon222_correct))))
(let ((anon464_Else_correct  (=> (= __flatten_80@1 (Tree__tolist Heap@16 (MapType0Select Heap@16 left@1 Tree__right))) (=> (and (state Heap@16 Mask@78) (state Heap@16 Mask@78)) (and (=> (= (ControlFlow 0 291) (- 0 296)) (HasDirectPerm Mask@78 left@1 Tree__data)) (=> (HasDirectPerm Mask@78 left@1 Tree__data) (=> (and (= cur_contents@2 (|Seq#Append| (|Seq#Append| cur_contents@1 (|Seq#Singleton| (MapType0Select Heap@16 left@1 Tree__data))) __flatten_80@1)) (state Heap@16 Mask@78)) (and (=> (= (ControlFlow 0 291) (- 0 295)) (> (|Seq#Length| cur_contents@0) 0)) (=> (> (|Seq#Length| cur_contents@0) 0) (=> (state Heap@16 Mask@78) (and (=> (= (ControlFlow 0 291) (- 0 294)) (> (|Seq#Length| cur_contents@2) 0)) (=> (> (|Seq#Length| cur_contents@2) 0) (=> (state Heap@16 Mask@78) (and (=> (= (ControlFlow 0 291) (- 0 293)) (HasDirectPerm Mask@78 cur@0 Tree__data)) (=> (HasDirectPerm Mask@78 cur@0 Tree__data) (and (=> (= (ControlFlow 0 291) (- 0 292)) (HasDirectPerm Mask@78 cur@0 Tree__right)) (=> (HasDirectPerm Mask@78 cur@0 Tree__right) (and (and (=> (= (ControlFlow 0 291) 284) anon467_Else_correct) (=> (= (ControlFlow 0 291) 193) anon468_Then_correct)) (=> (= (ControlFlow 0 291) 188) anon468_Else_correct)))))))))))))))))))
(let ((anon216_correct true))
(let ((anon215_correct  (=> (= Mask@99 (MapType1Store Mask@78 null (Tree__state (MapType0Select Heap@16 left@1 Tree__right)) (real_2_U (- (U_2_real (MapType1Select Mask@78 null (Tree__state (MapType0Select Heap@16 left@1 Tree__right)))) FullPerm)))) (=> (and (= Mask@100 Mask@99) (= (ControlFlow 0 182) 180)) anon216_correct))))
(let ((anon466_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 185) 182)) anon215_correct)))
(let ((anon466_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 183) (- 0 184)) (<= FullPerm (U_2_real (MapType1Select Mask@78 null (Tree__state (MapType0Select Heap@16 left@1 Tree__right)))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@78 null (Tree__state (MapType0Select Heap@16 left@1 Tree__right))))) (=> (= (ControlFlow 0 183) 182) anon215_correct))))))
(let ((anon465_Then_correct  (=> (not (= (MapType0Select Heap@16 left@1 Tree__right) null)) (and (=> (= (ControlFlow 0 186) 183) anon466_Then_correct) (=> (= (ControlFlow 0 186) 185) anon466_Else_correct)))))
(let ((anon465_Else_correct  (=> (= (MapType0Select Heap@16 left@1 Tree__right) null) (=> (and (= Mask@100 Mask@78) (= (ControlFlow 0 181) 180)) anon216_correct))))
(let ((anon461_Else_correct  (=> (= __flatten_79@1 (Tree__tolist Heap@16 (MapType0Select Heap@16 left@2 Tree__right))) (=> (and (state Heap@16 Mask@78) (state Heap@16 Mask@78)) (and (=> (= (ControlFlow 0 297) (- 0 299)) (HasDirectPerm Mask@78 left@2 Tree__data)) (=> (HasDirectPerm Mask@78 left@2 Tree__data) (=> (and (= cur_contents@1 (|Seq#Append| (|Seq#Append| __flatten_78@1 (|Seq#Singleton| (MapType0Select Heap@16 left@2 Tree__data))) __flatten_79@1)) (state Heap@16 Mask@78)) (and (=> (= (ControlFlow 0 297) (- 0 298)) (HasDirectPerm Mask@78 left@1 Tree__right)) (=> (HasDirectPerm Mask@78 left@1 Tree__right) (and (and (=> (= (ControlFlow 0 297) 291) anon464_Else_correct) (=> (= (ControlFlow 0 297) 186) anon465_Then_correct)) (=> (= (ControlFlow 0 297) 181) anon465_Else_correct)))))))))))
(let ((anon210_correct true))
(let ((anon209_correct  (=> (= Mask@101 (MapType1Store Mask@78 null (Tree__state (MapType0Select Heap@16 left@2 Tree__right)) (real_2_U (- (U_2_real (MapType1Select Mask@78 null (Tree__state (MapType0Select Heap@16 left@2 Tree__right)))) FullPerm)))) (=> (and (= Mask@102 Mask@101) (= (ControlFlow 0 175) 173)) anon210_correct))))
(let ((anon463_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 178) 175)) anon209_correct)))
(let ((anon463_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 176) (- 0 177)) (<= FullPerm (U_2_real (MapType1Select Mask@78 null (Tree__state (MapType0Select Heap@16 left@2 Tree__right)))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@78 null (Tree__state (MapType0Select Heap@16 left@2 Tree__right))))) (=> (= (ControlFlow 0 176) 175) anon209_correct))))))
(let ((anon462_Then_correct  (=> (not (= (MapType0Select Heap@16 left@2 Tree__right) null)) (and (=> (= (ControlFlow 0 179) 176) anon463_Then_correct) (=> (= (ControlFlow 0 179) 178) anon463_Else_correct)))))
(let ((anon462_Else_correct  (=> (= (MapType0Select Heap@16 left@2 Tree__right) null) (=> (and (= Mask@102 Mask@78) (= (ControlFlow 0 174) 173)) anon210_correct))))
(let ((anon458_Else_correct  (=> (= __flatten_78@1 (Tree__tolist Heap@16 (MapType0Select Heap@16 left@2 Tree__left))) (=> (and (state Heap@16 Mask@78) (state Heap@16 Mask@78)) (and (=> (= (ControlFlow 0 300) (- 0 301)) (HasDirectPerm Mask@78 left@2 Tree__right)) (=> (HasDirectPerm Mask@78 left@2 Tree__right) (and (and (=> (= (ControlFlow 0 300) 297) anon461_Else_correct) (=> (= (ControlFlow 0 300) 179) anon462_Then_correct)) (=> (= (ControlFlow 0 300) 174) anon462_Else_correct))))))))
(let ((anon204_correct true))
(let ((anon203_correct  (=> (= Mask@103 (MapType1Store Mask@78 null (Tree__state (MapType0Select Heap@16 left@2 Tree__left)) (real_2_U (- (U_2_real (MapType1Select Mask@78 null (Tree__state (MapType0Select Heap@16 left@2 Tree__left)))) FullPerm)))) (=> (and (= Mask@104 Mask@103) (= (ControlFlow 0 168) 166)) anon204_correct))))
(let ((anon460_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 171) 168)) anon203_correct)))
(let ((anon460_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 169) (- 0 170)) (<= FullPerm (U_2_real (MapType1Select Mask@78 null (Tree__state (MapType0Select Heap@16 left@2 Tree__left)))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@78 null (Tree__state (MapType0Select Heap@16 left@2 Tree__left))))) (=> (= (ControlFlow 0 169) 168) anon203_correct))))))
(let ((anon459_Then_correct  (=> (not (= (MapType0Select Heap@16 left@2 Tree__left) null)) (and (=> (= (ControlFlow 0 172) 169) anon460_Then_correct) (=> (= (ControlFlow 0 172) 171) anon460_Else_correct)))))
(let ((anon459_Else_correct  (=> (= (MapType0Select Heap@16 left@2 Tree__left) null) (=> (and (= Mask@104 Mask@78) (= (ControlFlow 0 167) 166)) anon204_correct))))
(let ((anon199_correct  (=> (and (state Heap@16 Mask@78) (state Heap@16 Mask@78)) (and (=> (= (ControlFlow 0 302) (- 0 303)) (HasDirectPerm Mask@78 left@2 Tree__left)) (=> (HasDirectPerm Mask@78 left@2 Tree__left) (and (and (=> (= (ControlFlow 0 302) 300) anon458_Else_correct) (=> (= (ControlFlow 0 302) 172) anon459_Then_correct)) (=> (= (ControlFlow 0 302) 167) anon459_Else_correct)))))))
(let ((anon457_Else_correct  (=> (= (MapType0Select Heap@16 left@2 Tree__right) null) (=> (and (= Mask@78 Mask@76) (= (ControlFlow 0 305) 302)) anon199_correct))))
(let ((anon457_Then_correct  (=> (and (not (= (MapType0Select Heap@16 left@2 Tree__right) null)) (= Mask@77 (MapType1Store Mask@76 null (Tree__state (MapType0Select Heap@16 left@2 Tree__right)) (real_2_U (+ (U_2_real (MapType1Select Mask@76 null (Tree__state (MapType0Select Heap@16 left@2 Tree__right)))) FullPerm))))) (=> (and (and (InsidePredicate (Tree__state left@2) (MapType0Select Heap@16 null (Tree__state left@2)) (Tree__state (MapType0Select Heap@16 left@2 Tree__right)) (MapType0Select Heap@16 null (Tree__state (MapType0Select Heap@16 left@2 Tree__right)))) (state Heap@16 Mask@77)) (and (= Mask@78 Mask@77) (= (ControlFlow 0 304) 302))) anon199_correct))))
(let ((anon456_Else_correct  (=> (and (= (MapType0Select Heap@16 left@2 Tree__left) null) (= Mask@76 Mask@74)) (and (=> (= (ControlFlow 0 307) 304) anon457_Then_correct) (=> (= (ControlFlow 0 307) 305) anon457_Else_correct)))))
(let ((anon456_Then_correct  (=> (not (= (MapType0Select Heap@16 left@2 Tree__left) null)) (=> (and (and (= Mask@75 (MapType1Store Mask@74 null (Tree__state (MapType0Select Heap@16 left@2 Tree__left)) (real_2_U (+ (U_2_real (MapType1Select Mask@74 null (Tree__state (MapType0Select Heap@16 left@2 Tree__left)))) FullPerm)))) (InsidePredicate (Tree__state left@2) (MapType0Select Heap@16 null (Tree__state left@2)) (Tree__state (MapType0Select Heap@16 left@2 Tree__left)) (MapType0Select Heap@16 null (Tree__state (MapType0Select Heap@16 left@2 Tree__left))))) (and (state Heap@16 Mask@75) (= Mask@76 Mask@75))) (and (=> (= (ControlFlow 0 306) 304) anon457_Then_correct) (=> (= (ControlFlow 0 306) 305) anon457_Else_correct))))))
(let ((anon195_correct  (=> (not (= left@2 null)) (=> (and (and (and (= Mask@72 (MapType1Store Mask@71 left@2 Tree__data (real_2_U (+ (U_2_real (MapType1Select Mask@71 left@2 Tree__data)) FullPerm)))) (state Heap@16 Mask@72)) (and (not (= left@2 null)) (= Mask@73 (MapType1Store Mask@72 left@2 Tree__left (real_2_U (+ (U_2_real (MapType1Select Mask@72 left@2 Tree__left)) FullPerm)))))) (and (and (state Heap@16 Mask@73) (not (= left@2 null))) (and (= Mask@74 (MapType1Store Mask@73 left@2 Tree__right (real_2_U (+ (U_2_real (MapType1Select Mask@73 left@2 Tree__right)) FullPerm)))) (state Heap@16 Mask@74)))) (and (=> (= (ControlFlow 0 308) 306) anon456_Then_correct) (=> (= (ControlFlow 0 308) 307) anon456_Else_correct))))))
(let ((anon455_Else_correct  (=> (HasDirectPerm Mask@71 null (Tree__state left@2)) (=> (and (= Heap@16 ExhaleHeap@0) (= (ControlFlow 0 310) 308)) anon195_correct))))
(let ((anon455_Then_correct  (=> (and (and (not (HasDirectPerm Mask@71 null (Tree__state left@2))) (= Heap@15 (MapType0Store ExhaleHeap@0 null (Tree__state left@2) newVersion@2))) (and (= Heap@16 Heap@15) (= (ControlFlow 0 309) 308))) anon195_correct)))
(let ((anon193_correct  (=> (= Mask@71 (MapType1Store Mask@70 null (Tree__state left@2) (real_2_U (- (U_2_real (MapType1Select Mask@70 null (Tree__state left@2))) FullPerm)))) (and (=> (= (ControlFlow 0 311) 309) anon455_Then_correct) (=> (= (ControlFlow 0 311) 310) anon455_Else_correct)))))
(let ((anon454_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 314) 311)) anon193_correct)))
(let ((anon454_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 312) (- 0 313)) (<= FullPerm (U_2_real (MapType1Select Mask@70 null (Tree__state left@2))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@70 null (Tree__state left@2)))) (=> (= (ControlFlow 0 312) 311) anon193_correct))))))
(let ((anon191_correct  (=> (and (state ExhaleHeap@0 Mask@69) (|Seq#Equal| cur_contents@0 (|Seq#Append| (|Seq#Append| (|Seq#Append| (|Seq#Append| (Tree__tolist ExhaleHeap@0 (MapType0Select ExhaleHeap@0 left@1 Tree__left)) (|Seq#Singleton| (MapType0Select ExhaleHeap@0 left@1 Tree__data))) (Tree__tolist ExhaleHeap@0 (MapType0Select ExhaleHeap@0 left@1 Tree__right))) (|Seq#Singleton| (MapType0Select ExhaleHeap@0 cur@0 Tree__data))) (Tree__tolist ExhaleHeap@0 (MapType0Select ExhaleHeap@0 cur@0 Tree__right))))) (=> (and (and (not (= vwand@1 null)) (= Mask@70 (MapType1Store Mask@69 null (Wand_state_contains_for_state_contains__valid_wand vwand@1) (real_2_U (+ (U_2_real (MapType1Select Mask@69 null (Wand_state_contains_for_state_contains__valid_wand vwand@1))) FullPerm))))) (and (state ExhaleHeap@0 Mask@70) (state ExhaleHeap@0 Mask@70))) (=> (and (and (and (= (Wand_state_contains_for_state_contains__get_in_1 ExhaleHeap@0 vwand@1) cur@0) (state ExhaleHeap@0 Mask@70)) (and (|Seq#Equal| (Wand_state_contains_for_state_contains__get_in_1_0 ExhaleHeap@0 vwand@1) (|Seq#Drop| cur_contents@0 1)) (state ExhaleHeap@0 Mask@70))) (and (and (= (Wand_state_contains_for_state_contains__get_out_1 ExhaleHeap@0 vwand@1) top) (state ExhaleHeap@0 Mask@70)) (and (|Seq#Equal| (Wand_state_contains_for_state_contains__get_out_1_0 ExhaleHeap@0 vwand@1) target_contents@0) (state ExhaleHeap@0 Mask@70)))) (and (=> (= (ControlFlow 0 315) (- 0 317)) (HasDirectPerm Mask@70 left@1 Tree__left)) (=> (HasDirectPerm Mask@70 left@1 Tree__left) (=> (not (= (MapType0Select ExhaleHeap@0 left@1 Tree__left) null)) (=> (and (and (state ExhaleHeap@0 Mask@70) (state ExhaleHeap@0 Mask@70)) (and (state ExhaleHeap@0 Mask@70) (state ExhaleHeap@0 Mask@70))) (and (=> (= (ControlFlow 0 315) (- 0 316)) (HasDirectPerm Mask@70 left@1 Tree__left)) (=> (HasDirectPerm Mask@70 left@1 Tree__left) (=> (and (and (= left@2 (MapType0Select ExhaleHeap@0 left@1 Tree__left)) (state ExhaleHeap@0 Mask@70)) (and (|Tree__state#trigger| ExhaleHeap@0 (Tree__state left@2)) (= (MapType0Select ExhaleHeap@0 null (Tree__state left@2)) (CombineFrames (FrameFragment (MapType0Select ExhaleHeap@0 left@2 Tree__data)) (CombineFrames (FrameFragment (MapType0Select ExhaleHeap@0 left@2 Tree__left)) (CombineFrames (FrameFragment (MapType0Select ExhaleHeap@0 left@2 Tree__right)) (CombineFrames (FrameFragment (ite (not (= (MapType0Select ExhaleHeap@0 left@2 Tree__left) null)) (MapType0Select ExhaleHeap@0 null (Tree__state (MapType0Select ExhaleHeap@0 left@2 Tree__left))) EmptyFrame)) (FrameFragment (ite (not (= (MapType0Select ExhaleHeap@0 left@2 Tree__right) null)) (MapType0Select ExhaleHeap@0 null (Tree__state (MapType0Select ExhaleHeap@0 left@2 Tree__right))) EmptyFrame))))))))) (and (=> (= (ControlFlow 0 315) 312) anon454_Then_correct) (=> (= (ControlFlow 0 315) 314) anon454_Else_correct))))))))))))))
(let ((anon453_Else_correct  (=> (= (MapType0Select ExhaleHeap@0 left@1 Tree__right) null) (=> (and (= Mask@69 Mask@67) (= (ControlFlow 0 319) 315)) anon191_correct))))
(let ((anon453_Then_correct  (=> (not (= (MapType0Select ExhaleHeap@0 left@1 Tree__right) null)) (=> (and (and (= Mask@68 (MapType1Store Mask@67 null (Tree__state (MapType0Select ExhaleHeap@0 left@1 Tree__right)) (real_2_U (+ (U_2_real (MapType1Select Mask@67 null (Tree__state (MapType0Select ExhaleHeap@0 left@1 Tree__right)))) FullPerm)))) (state ExhaleHeap@0 Mask@68)) (and (= Mask@69 Mask@68) (= (ControlFlow 0 318) 315))) anon191_correct))))
(let ((anon452_Else_correct  (=> (and (= (MapType0Select ExhaleHeap@0 left@1 Tree__left) null) (= Mask@67 Mask@65)) (and (=> (= (ControlFlow 0 321) 318) anon453_Then_correct) (=> (= (ControlFlow 0 321) 319) anon453_Else_correct)))))
(let ((anon452_Then_correct  (=> (and (and (not (= (MapType0Select ExhaleHeap@0 left@1 Tree__left) null)) (= Mask@66 (MapType1Store Mask@65 null (Tree__state (MapType0Select ExhaleHeap@0 left@1 Tree__left)) (real_2_U (+ (U_2_real (MapType1Select Mask@65 null (Tree__state (MapType0Select ExhaleHeap@0 left@1 Tree__left)))) FullPerm))))) (and (state ExhaleHeap@0 Mask@66) (= Mask@67 Mask@66))) (and (=> (= (ControlFlow 0 320) 318) anon453_Then_correct) (=> (= (ControlFlow 0 320) 319) anon453_Else_correct)))))
(let ((anon187_correct  (=> (not (= left@1 null)) (=> (and (and (and (= Mask@63 (MapType1Store Mask@62 left@1 Tree__left (real_2_U (+ (U_2_real (MapType1Select Mask@62 left@1 Tree__left)) FullPerm)))) (state ExhaleHeap@0 Mask@63)) (and (not (= left@1 null)) (= Mask@64 (MapType1Store Mask@63 left@1 Tree__data (real_2_U (+ (U_2_real (MapType1Select Mask@63 left@1 Tree__data)) FullPerm)))))) (and (and (state ExhaleHeap@0 Mask@64) (not (= left@1 null))) (and (= Mask@65 (MapType1Store Mask@64 left@1 Tree__right (real_2_U (+ (U_2_real (MapType1Select Mask@64 left@1 Tree__right)) FullPerm)))) (state ExhaleHeap@0 Mask@65)))) (and (=> (= (ControlFlow 0 322) 320) anon452_Then_correct) (=> (= (ControlFlow 0 322) 321) anon452_Else_correct))))))
(let ((anon451_Else_correct  (=> (= (MapType0Select ExhaleHeap@0 cur@0 Tree__right) null) (=> (and (= Mask@62 Mask@36) (= (ControlFlow 0 324) 322)) anon187_correct))))
(let ((anon451_Then_correct  (=> (not (= (MapType0Select ExhaleHeap@0 cur@0 Tree__right) null)) (=> (and (and (= Mask@61 (MapType1Store Mask@36 null (Tree__state (MapType0Select ExhaleHeap@0 cur@0 Tree__right)) (real_2_U (+ (U_2_real (MapType1Select Mask@36 null (Tree__state (MapType0Select ExhaleHeap@0 cur@0 Tree__right)))) FullPerm)))) (state ExhaleHeap@0 Mask@61)) (and (= Mask@62 Mask@61) (= (ControlFlow 0 323) 322))) anon187_correct))))
(let ((anon450_Then_correct  (=> (state ExhaleHeap@0 ZeroMask) (=> (and (not (= cur@0 null)) (= Mask@34 (MapType1Store ZeroMask cur@0 Tree__left (real_2_U (+ (U_2_real (MapType1Select ZeroMask cur@0 Tree__left)) FullPerm))))) (=> (and (and (and (state ExhaleHeap@0 Mask@34) (not (= cur@0 null))) (and (= Mask@35 (MapType1Store Mask@34 cur@0 Tree__data (real_2_U (+ (U_2_real (MapType1Select Mask@34 cur@0 Tree__data)) FullPerm)))) (state ExhaleHeap@0 Mask@35))) (and (and (not (= cur@0 null)) (= Mask@36 (MapType1Store Mask@35 cur@0 Tree__right (real_2_U (+ (U_2_real (MapType1Select Mask@35 cur@0 Tree__right)) FullPerm))))) (and (state ExhaleHeap@0 Mask@36) (= (MapType0Select ExhaleHeap@0 cur@0 Tree__left) left@1)))) (and (=> (= (ControlFlow 0 325) 323) anon451_Then_correct) (=> (= (ControlFlow 0 325) 324) anon451_Else_correct)))))))
(let ((anon346_correct true))
(let ((anon345_correct  (=> (= ExhaleWellDef0Mask@0 (MapType1Store Mask@60 null (Tree__state top) (real_2_U (- (U_2_real (MapType1Select Mask@60 null (Tree__state top))) FullPerm)))) (=> (and (= ExhaleWellDef0Mask@1 ExhaleWellDef0Mask@0) (= (ControlFlow 0 82) 80)) anon346_correct))))
(let ((anon532_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 85) 82)) anon345_correct)))
(let ((anon532_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 83) (- 0 84)) (<= FullPerm (U_2_real (MapType1Select Mask@60 null (Tree__state top))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@60 null (Tree__state top)))) (=> (= (ControlFlow 0 83) 82) anon345_correct))))))
(let ((anon531_Then_correct  (=> (not (= top null)) (and (=> (= (ControlFlow 0 86) 83) anon532_Then_correct) (=> (= (ControlFlow 0 86) 85) anon532_Else_correct)))))
(let ((anon531_Else_correct  (=> (= top null) (=> (and (= ExhaleWellDef0Mask@1 Mask@60) (= (ControlFlow 0 81) 80)) anon346_correct))))
(let ((anon348_correct true))
(let ((anon530_Else_correct  (and (=> (= (ControlFlow 0 78) (- 0 79)) (Tree__sorted ExhaleHeap@1 top)) (=> (Tree__sorted ExhaleHeap@1 top) (=> (= (ControlFlow 0 78) 76) anon348_correct)))))
(let ((anon529_Then_correct  (=> (Tree__sorted Heap@@41 top) (and (and (=> (= (ControlFlow 0 87) 78) anon530_Else_correct) (=> (= (ControlFlow 0 87) 86) anon531_Then_correct)) (=> (= (ControlFlow 0 87) 81) anon531_Else_correct)))))
(let ((anon529_Else_correct  (=> (and (not (Tree__sorted Heap@@41 top)) (= (ControlFlow 0 77) 76)) anon348_correct)))
(let ((anon339_correct true))
(let ((anon528_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 74) 70)) anon339_correct)))
(let ((anon528_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 72) (- 0 73)) (<= FullPerm (U_2_real (MapType1Select Mask@0 null (Tree__state top))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@0 null (Tree__state top)))) (=> (= (ControlFlow 0 72) 70) anon339_correct))))))
(let ((anon527_Then_correct  (=> (not (= top null)) (and (=> (= (ControlFlow 0 75) 72) anon528_Then_correct) (=> (= (ControlFlow 0 75) 74) anon528_Else_correct)))))
(let ((anon527_Else_correct  (=> (and (= top null) (= (ControlFlow 0 71) 70)) anon339_correct)))
(let ((anon523_Else_correct  (and (=> (= (ControlFlow 0 88) (- 0 89)) (|Seq#Equal| (|Seq#Drop| (Tree__tolist Heap@@41 top) 1) (Tree__tolist ExhaleHeap@1 top))) (=> (|Seq#Equal| (|Seq#Drop| (Tree__tolist Heap@@41 top) 1) (Tree__tolist ExhaleHeap@1 top)) (and (and (and (=> (= (ControlFlow 0 88) 87) anon529_Then_correct) (=> (= (ControlFlow 0 88) 77) anon529_Else_correct)) (=> (= (ControlFlow 0 88) 75) anon527_Then_correct)) (=> (= (ControlFlow 0 88) 71) anon527_Else_correct))))))
(let ((anon334_correct true))
(let ((anon333_correct  (=> (= ExhaleWellDef0Mask@2 (MapType1Store Mask@60 null (Tree__state top) (real_2_U (- (U_2_real (MapType1Select Mask@60 null (Tree__state top))) FullPerm)))) (=> (and (= ExhaleWellDef0Mask@3 ExhaleWellDef0Mask@2) (= (ControlFlow 0 65) 63)) anon334_correct))))
(let ((anon525_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 68) 65)) anon333_correct)))
(let ((anon525_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 66) (- 0 67)) (<= FullPerm (U_2_real (MapType1Select Mask@60 null (Tree__state top))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@60 null (Tree__state top)))) (=> (= (ControlFlow 0 66) 65) anon333_correct))))))
(let ((anon524_Then_correct  (=> (not (= top null)) (and (=> (= (ControlFlow 0 69) 66) anon525_Then_correct) (=> (= (ControlFlow 0 69) 68) anon525_Else_correct)))))
(let ((anon524_Else_correct  (=> (= top null) (=> (and (= ExhaleWellDef0Mask@3 Mask@60) (= (ControlFlow 0 64) 63)) anon334_correct))))
(let ((anon328_correct true))
(let ((anon522_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 61) 57)) anon328_correct)))
(let ((anon522_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 59) (- 0 60)) (<= FullPerm (U_2_real (MapType1Select Mask@0 null (Tree__state top))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@0 null (Tree__state top)))) (=> (= (ControlFlow 0 59) 57) anon328_correct))))))
(let ((anon521_Then_correct  (=> (not (= top null)) (and (=> (= (ControlFlow 0 62) 59) anon522_Then_correct) (=> (= (ControlFlow 0 62) 61) anon522_Else_correct)))))
(let ((anon521_Else_correct  (=> (and (= top null) (= (ControlFlow 0 58) 57)) anon328_correct)))
(let ((anon323_correct  (=> (= AssertMask@2 (MapType1Store Mask@60 null (Tree__state top) (real_2_U (- (U_2_real (MapType1Select Mask@60 null (Tree__state top))) FullPerm)))) (and (and (and (and (=> (= (ControlFlow 0 91) 88) anon523_Else_correct) (=> (= (ControlFlow 0 91) 69) anon524_Then_correct)) (=> (= (ControlFlow 0 91) 64) anon524_Else_correct)) (=> (= (ControlFlow 0 91) 62) anon521_Then_correct)) (=> (= (ControlFlow 0 91) 58) anon521_Else_correct)))))
(let ((anon519_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 94) 91)) anon323_correct)))
(let ((anon519_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 92) (- 0 93)) (<= FullPerm (U_2_real (MapType1Select Mask@60 null (Tree__state top))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@60 null (Tree__state top)))) (=> (= (ControlFlow 0 92) 91) anon323_correct))))))
(let ((anon518_Then_correct  (=> (not (= top null)) (and (=> (= (ControlFlow 0 95) 92) anon519_Then_correct) (=> (= (ControlFlow 0 95) 94) anon519_Else_correct)))))
(let ((anon518_Else_correct  (=> (= top null) (and (and (and (and (=> (= (ControlFlow 0 90) 88) anon523_Else_correct) (=> (= (ControlFlow 0 90) 69) anon524_Then_correct)) (=> (= (ControlFlow 0 90) 64) anon524_Else_correct)) (=> (= (ControlFlow 0 90) 62) anon521_Then_correct)) (=> (= (ControlFlow 0 90) 58) anon521_Else_correct)))))
(let ((anon320_correct  (=> (= Mask@59 (MapType1Store Mask@58 null (Tree__state (Wand_state_contains_for_state_contains__get_in_1 Heap@14 vwand@1)) (real_2_U (- (U_2_real (MapType1Select Mask@58 null (Tree__state (Wand_state_contains_for_state_contains__get_in_1 Heap@14 vwand@1)))) FullPerm)))) (and (=> (= (ControlFlow 0 96) (- 0 98)) (|Seq#Equal| (Tree__tolist Heap@14 (Wand_state_contains_for_state_contains__get_in_1 Heap@14 vwand@1)) (Wand_state_contains_for_state_contains__get_in_1_0 Heap@14 vwand@1))) (=> (|Seq#Equal| (Tree__tolist Heap@14 (Wand_state_contains_for_state_contains__get_in_1 Heap@14 vwand@1)) (Wand_state_contains_for_state_contains__get_in_1_0 Heap@14 vwand@1)) (and (=> (= (ControlFlow 0 96) (- 0 97)) (not (= (Wand_state_contains_for_state_contains__get_out_1 Heap@14 vwand@1) null))) (=> (not (= (Wand_state_contains_for_state_contains__get_out_1 Heap@14 vwand@1) null)) (=> (and (IdenticalOnKnownLocations Heap@14 ExhaleHeap@1 Mask@59) (state ExhaleHeap@1 Mask@59)) (=> (and (and (and (= Mask@60 (MapType1Store Mask@59 null (Tree__state (Wand_state_contains_for_state_contains__get_out_1 Heap@14 vwand@1)) (real_2_U (+ (U_2_real (MapType1Select Mask@59 null (Tree__state (Wand_state_contains_for_state_contains__get_out_1 Heap@14 vwand@1)))) FullPerm)))) (state ExhaleHeap@1 Mask@60)) (and (state ExhaleHeap@1 Mask@60) (|Seq#Equal| (Tree__tolist ExhaleHeap@1 (Wand_state_contains_for_state_contains__get_out_1 Heap@14 vwand@1)) (Wand_state_contains_for_state_contains__get_out_1_0 Heap@14 vwand@1)))) (and (and (state ExhaleHeap@1 Mask@60) (state ExhaleHeap@1 Mask@60)) (and (state ExhaleHeap@1 Mask@60) (state ExhaleHeap@1 Mask@60)))) (and (=> (= (ControlFlow 0 96) 95) anon518_Then_correct) (=> (= (ControlFlow 0 96) 90) anon518_Else_correct)))))))))))
(let ((anon517_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 101) 96)) anon320_correct)))
(let ((anon517_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 99) (- 0 100)) (<= FullPerm (U_2_real (MapType1Select Mask@58 null (Tree__state (Wand_state_contains_for_state_contains__get_in_1 Heap@14 vwand@1)))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@58 null (Tree__state (Wand_state_contains_for_state_contains__get_in_1 Heap@14 vwand@1))))) (=> (= (ControlFlow 0 99) 96) anon320_correct))))))
(let ((anon318_correct  (=> (= Mask@58 (MapType1Store Mask@57 null (Wand_state_contains_for_state_contains__valid_wand vwand@1) (real_2_U (- (U_2_real (MapType1Select Mask@57 null (Wand_state_contains_for_state_contains__valid_wand vwand@1))) FullPerm)))) (and (=> (= (ControlFlow 0 102) 99) anon517_Then_correct) (=> (= (ControlFlow 0 102) 101) anon517_Else_correct)))))
(let ((anon516_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 105) 102)) anon318_correct)))
(let ((anon516_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 103) (- 0 104)) (<= FullPerm (U_2_real (MapType1Select Mask@57 null (Wand_state_contains_for_state_contains__valid_wand vwand@1))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@57 null (Wand_state_contains_for_state_contains__valid_wand vwand@1)))) (=> (= (ControlFlow 0 103) 102) anon318_correct))))))
(let ((anon513_Else_correct  (and (=> (= (ControlFlow 0 106) (- 0 109)) (|Seq#Equal| (Tree__tolist Heap@14 cur@0) (|Seq#Drop| cur_contents@0 1))) (=> (|Seq#Equal| (Tree__tolist Heap@14 cur@0) (|Seq#Drop| cur_contents@0 1)) (=> (state Heap@14 Mask@57) (and (=> (= (ControlFlow 0 106) (- 0 108)) (not (= vwand@1 null))) (=> (not (= vwand@1 null)) (and (=> (= (ControlFlow 0 106) (- 0 107)) (>= current_thread_id 0)) (=> (>= current_thread_id 0) (and (=> (= (ControlFlow 0 106) 103) anon516_Then_correct) (=> (= (ControlFlow 0 106) 105) anon516_Else_correct)))))))))))
(let ((anon315_correct true))
(let ((anon314_correct  (=> (= ExhaleWellDef0Mask@4 (MapType1Store Mask@57 null (Tree__state cur@0) (real_2_U (- (U_2_real (MapType1Select Mask@57 null (Tree__state cur@0))) FullPerm)))) (=> (and (= ExhaleWellDef0Mask@5 ExhaleWellDef0Mask@4) (= (ControlFlow 0 52) 50)) anon315_correct))))
(let ((anon515_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 55) 52)) anon314_correct)))
(let ((anon515_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 53) (- 0 54)) (<= FullPerm (U_2_real (MapType1Select Mask@57 null (Tree__state cur@0))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@57 null (Tree__state cur@0)))) (=> (= (ControlFlow 0 53) 52) anon314_correct))))))
(let ((anon514_Then_correct  (=> (not (= cur@0 null)) (and (=> (= (ControlFlow 0 56) 53) anon515_Then_correct) (=> (= (ControlFlow 0 56) 55) anon515_Else_correct)))))
(let ((anon514_Else_correct  (=> (= cur@0 null) (=> (and (= ExhaleWellDef0Mask@5 Mask@57) (= (ControlFlow 0 51) 50)) anon315_correct))))
(let ((anon310_correct  (=> (= AssertMask@1 (MapType1Store Mask@57 null (Tree__state cur@0) (real_2_U (- (U_2_real (MapType1Select Mask@57 null (Tree__state cur@0))) FullPerm)))) (and (and (=> (= (ControlFlow 0 110) 106) anon513_Else_correct) (=> (= (ControlFlow 0 110) 56) anon514_Then_correct)) (=> (= (ControlFlow 0 110) 51) anon514_Else_correct)))))
(let ((anon512_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 113) 110)) anon310_correct)))
(let ((anon512_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 111) (- 0 112)) (<= FullPerm (U_2_real (MapType1Select Mask@57 null (Tree__state cur@0))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@57 null (Tree__state cur@0)))) (=> (= (ControlFlow 0 111) 110) anon310_correct))))))
(let ((anon509_Else_correct  (and (=> (= (ControlFlow 0 114) (- 0 115)) (|Seq#Equal| (Tree__tolist Heap@14 cur@0) (Tree__tolist Heap@14 cur@0))) (=> (|Seq#Equal| (Tree__tolist Heap@14 cur@0) (Tree__tolist Heap@14 cur@0)) (=> (state Heap@14 Mask@57) (and (=> (= (ControlFlow 0 114) 111) anon512_Then_correct) (=> (= (ControlFlow 0 114) 113) anon512_Else_correct)))))))
(let ((anon307_correct true))
(let ((anon306_correct  (=> (= ExhaleWellDef0Mask@6 (MapType1Store Mask@57 null (Tree__state cur@0) (real_2_U (- (U_2_real (MapType1Select Mask@57 null (Tree__state cur@0))) FullPerm)))) (=> (and (= ExhaleWellDef0Mask@7 ExhaleWellDef0Mask@6) (= (ControlFlow 0 45) 43)) anon307_correct))))
(let ((anon511_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 48) 45)) anon306_correct)))
(let ((anon511_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 46) (- 0 47)) (<= FullPerm (U_2_real (MapType1Select Mask@57 null (Tree__state cur@0))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@57 null (Tree__state cur@0)))) (=> (= (ControlFlow 0 46) 45) anon306_correct))))))
(let ((anon510_Then_correct  (=> (not (= cur@0 null)) (and (=> (= (ControlFlow 0 49) 46) anon511_Then_correct) (=> (= (ControlFlow 0 49) 48) anon511_Else_correct)))))
(let ((anon510_Else_correct  (=> (= cur@0 null) (=> (and (= ExhaleWellDef0Mask@7 Mask@57) (= (ControlFlow 0 44) 43)) anon307_correct))))
(let ((anon301_correct true))
(let ((anon300_correct  (=> (= ExhaleWellDef0Mask@8 (MapType1Store Mask@57 null (Tree__state cur@0) (real_2_U (- (U_2_real (MapType1Select Mask@57 null (Tree__state cur@0))) FullPerm)))) (=> (and (= ExhaleWellDef0Mask@9 ExhaleWellDef0Mask@8) (= (ControlFlow 0 38) 36)) anon301_correct))))
(let ((anon508_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 41) 38)) anon300_correct)))
(let ((anon508_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 39) (- 0 40)) (<= FullPerm (U_2_real (MapType1Select Mask@57 null (Tree__state cur@0))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@57 null (Tree__state cur@0)))) (=> (= (ControlFlow 0 39) 38) anon300_correct))))))
(let ((anon507_Then_correct  (=> (not (= cur@0 null)) (and (=> (= (ControlFlow 0 42) 39) anon508_Then_correct) (=> (= (ControlFlow 0 42) 41) anon508_Else_correct)))))
(let ((anon507_Else_correct  (=> (= cur@0 null) (=> (and (= ExhaleWellDef0Mask@9 Mask@57) (= (ControlFlow 0 37) 36)) anon301_correct))))
(let ((anon296_correct  (=> (= AssertMask@0 (MapType1Store Mask@57 null (Tree__state cur@0) (real_2_U (- (U_2_real (MapType1Select Mask@57 null (Tree__state cur@0))) FullPerm)))) (and (and (and (and (=> (= (ControlFlow 0 116) 114) anon509_Else_correct) (=> (= (ControlFlow 0 116) 49) anon510_Then_correct)) (=> (= (ControlFlow 0 116) 44) anon510_Else_correct)) (=> (= (ControlFlow 0 116) 42) anon507_Then_correct)) (=> (= (ControlFlow 0 116) 37) anon507_Else_correct)))))
(let ((anon505_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 119) 116)) anon296_correct)))
(let ((anon505_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 117) (- 0 118)) (<= FullPerm (U_2_real (MapType1Select Mask@57 null (Tree__state cur@0))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@57 null (Tree__state cur@0)))) (=> (= (ControlFlow 0 117) 116) anon296_correct))))))
(let ((anon502_Else_correct  (and (=> (= (ControlFlow 0 120) (- 0 121)) (|Seq#Equal| (Tree__tolist Heap@14 cur@0) (|Seq#Drop| cur_contents@0 1))) (=> (|Seq#Equal| (Tree__tolist Heap@14 cur@0) (|Seq#Drop| cur_contents@0 1)) (=> (state Heap@14 Mask@57) (and (=> (= (ControlFlow 0 120) 117) anon505_Then_correct) (=> (= (ControlFlow 0 120) 119) anon505_Else_correct)))))))
(let ((anon293_correct true))
(let ((anon292_correct  (=> (= ExhaleWellDef0Mask@10 (MapType1Store Mask@57 null (Tree__state cur@0) (real_2_U (- (U_2_real (MapType1Select Mask@57 null (Tree__state cur@0))) FullPerm)))) (=> (and (= ExhaleWellDef0Mask@11 ExhaleWellDef0Mask@10) (= (ControlFlow 0 31) 29)) anon293_correct))))
(let ((anon504_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 34) 31)) anon292_correct)))
(let ((anon504_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 32) (- 0 33)) (<= FullPerm (U_2_real (MapType1Select Mask@57 null (Tree__state cur@0))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@57 null (Tree__state cur@0)))) (=> (= (ControlFlow 0 32) 31) anon292_correct))))))
(let ((anon503_Then_correct  (=> (not (= cur@0 null)) (and (=> (= (ControlFlow 0 35) 32) anon504_Then_correct) (=> (= (ControlFlow 0 35) 34) anon504_Else_correct)))))
(let ((anon503_Else_correct  (=> (= cur@0 null) (=> (and (= ExhaleWellDef0Mask@11 Mask@57) (= (ControlFlow 0 30) 29)) anon293_correct))))
(let ((anon288_correct  (=> (and (state Heap@14 Mask@57) (state Heap@14 Mask@57)) (and (and (=> (= (ControlFlow 0 122) 120) anon502_Else_correct) (=> (= (ControlFlow 0 122) 35) anon503_Then_correct)) (=> (= (ControlFlow 0 122) 30) anon503_Else_correct)))))
(let ((anon501_Else_correct  (=> (= (MapType0Select Heap@12 cur@0 Tree__right) null) (=> (and (= Heap@14 Heap@12) (= (ControlFlow 0 124) 122)) anon288_correct))))
(let ((anon501_Then_correct  (=> (not (= (MapType0Select Heap@12 cur@0 Tree__right) null)) (=> (and (and (forall ((o_20 T@U) (f_24 T@U) ) (! (let ((B@@11 (FieldTypeInv1 (type f_24))))
(let ((A@@12 (FieldTypeInv0 (type f_24))))
 (=> (and (and (= (type o_20) RefType) (= (type f_24) (FieldType A@@12 B@@11))) (or (U_2_bool (MapType1Select (MapType0Select Heap@12 null (|Tree__state#sm| cur@0)) o_20 f_24)) (U_2_bool (MapType1Select (MapType0Select Heap@12 null (|Tree__state#sm| (MapType0Select Heap@12 cur@0 Tree__right))) o_20 f_24)))) (U_2_bool (MapType1Select newPMask@1 o_20 f_24)))))
 :qid |stdinbpl.7640:33|
 :skolemid |119|
 :pattern ( (MapType1Select newPMask@1 o_20 f_24))
)) (= Heap@13 (MapType0Store Heap@12 null (|Tree__state#sm| cur@0) newPMask@1))) (and (= Heap@14 Heap@13) (= (ControlFlow 0 123) 122))) anon288_correct))))
(let ((anon500_Else_correct  (=> (and (= (MapType0Select Heap@10 cur@0 Tree__left) null) (= Heap@12 Heap@10)) (and (=> (= (ControlFlow 0 126) 123) anon501_Then_correct) (=> (= (ControlFlow 0 126) 124) anon501_Else_correct)))))
(let ((anon500_Then_correct  (=> (and (and (not (= (MapType0Select Heap@10 cur@0 Tree__left) null)) (forall ((o_19 T@U) (f_23 T@U) ) (! (let ((B@@12 (FieldTypeInv1 (type f_23))))
(let ((A@@13 (FieldTypeInv0 (type f_23))))
 (=> (and (and (= (type o_19) RefType) (= (type f_23) (FieldType A@@13 B@@12))) (or (U_2_bool (MapType1Select (MapType0Select Heap@10 null (|Tree__state#sm| cur@0)) o_19 f_23)) (U_2_bool (MapType1Select (MapType0Select Heap@10 null (|Tree__state#sm| (MapType0Select Heap@10 cur@0 Tree__left))) o_19 f_23)))) (U_2_bool (MapType1Select newPMask@0 o_19 f_23)))))
 :qid |stdinbpl.7632:33|
 :skolemid |118|
 :pattern ( (MapType1Select newPMask@0 o_19 f_23))
))) (and (= Heap@11 (MapType0Store Heap@10 null (|Tree__state#sm| cur@0) newPMask@0)) (= Heap@12 Heap@11))) (and (=> (= (ControlFlow 0 125) 123) anon501_Then_correct) (=> (= (ControlFlow 0 125) 124) anon501_Else_correct)))))
(let ((anon284_correct  (=> (= Heap@8 (MapType0Store Heap@7 null (|Tree__state#sm| cur@0) (MapType1Store (MapType0Select Heap@7 null (|Tree__state#sm| cur@0)) cur@0 Tree__data (bool_2_U true)))) (=> (and (= Heap@9 (MapType0Store Heap@8 null (|Tree__state#sm| cur@0) (MapType1Store (MapType0Select Heap@8 null (|Tree__state#sm| cur@0)) cur@0 Tree__left (bool_2_U true)))) (= Heap@10 (MapType0Store Heap@9 null (|Tree__state#sm| cur@0) (MapType1Store (MapType0Select Heap@9 null (|Tree__state#sm| cur@0)) cur@0 Tree__right (bool_2_U true))))) (and (=> (= (ControlFlow 0 127) 125) anon500_Then_correct) (=> (= (ControlFlow 0 127) 126) anon500_Else_correct))))))
(let ((anon499_Else_correct  (=> (HasDirectPerm Mask@57 null (Tree__state cur@0)) (=> (and (= Heap@7 Heap@4) (= (ControlFlow 0 129) 127)) anon284_correct))))
(let ((anon499_Then_correct  (=> (not (HasDirectPerm Mask@57 null (Tree__state cur@0))) (=> (and (and (= Heap@5 (MapType0Store Heap@4 null (|Tree__state#sm| cur@0) ZeroPMask)) (= Heap@6 (MapType0Store Heap@5 null (Tree__state cur@0) freshVersion@0))) (and (= Heap@7 Heap@6) (= (ControlFlow 0 128) 127))) anon284_correct))))
(let ((anon282_correct  (=> (= Mask@57 (MapType1Store Mask@56 null (Tree__state cur@0) (real_2_U (+ (U_2_real (MapType1Select Mask@56 null (Tree__state cur@0))) FullPerm)))) (=> (and (and (state Heap@4 Mask@57) (state Heap@4 Mask@57)) (and (|Tree__state#trigger| Heap@4 (Tree__state cur@0)) (= (MapType0Select Heap@4 null (Tree__state cur@0)) (CombineFrames (FrameFragment (MapType0Select Heap@4 cur@0 Tree__data)) (CombineFrames (FrameFragment (MapType0Select Heap@4 cur@0 Tree__left)) (CombineFrames (FrameFragment (MapType0Select Heap@4 cur@0 Tree__right)) (CombineFrames (FrameFragment (ite (not (= (MapType0Select Heap@4 cur@0 Tree__left) null)) (MapType0Select Heap@4 null (Tree__state (MapType0Select Heap@4 cur@0 Tree__left))) EmptyFrame)) (FrameFragment (ite (not (= (MapType0Select Heap@4 cur@0 Tree__right) null)) (MapType0Select Heap@4 null (Tree__state (MapType0Select Heap@4 cur@0 Tree__right))) EmptyFrame))))))))) (and (=> (= (ControlFlow 0 130) 128) anon499_Then_correct) (=> (= (ControlFlow 0 130) 129) anon499_Else_correct))))))
(let ((anon281_correct  (=> (and (and (= Mask@55 (MapType1Store Mask@54 null (Tree__state (MapType0Select Heap@4 cur@0 Tree__right)) (real_2_U (- (U_2_real (MapType1Select Mask@54 null (Tree__state (MapType0Select Heap@4 cur@0 Tree__right)))) FullPerm)))) (InsidePredicate (Tree__state cur@0) (MapType0Select Heap@4 null (Tree__state cur@0)) (Tree__state (MapType0Select Heap@4 cur@0 Tree__right)) (MapType0Select Heap@4 null (Tree__state (MapType0Select Heap@4 cur@0 Tree__right))))) (and (= Mask@56 Mask@55) (= (ControlFlow 0 132) 130))) anon282_correct)))
(let ((anon498_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 135) 132)) anon281_correct)))
(let ((anon498_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 133) (- 0 134)) (<= FullPerm (U_2_real (MapType1Select Mask@54 null (Tree__state (MapType0Select Heap@4 cur@0 Tree__right)))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@54 null (Tree__state (MapType0Select Heap@4 cur@0 Tree__right))))) (=> (= (ControlFlow 0 133) 132) anon281_correct))))))
(let ((anon497_Then_correct  (=> (not (= (MapType0Select Heap@4 cur@0 Tree__right) null)) (and (=> (= (ControlFlow 0 136) 133) anon498_Then_correct) (=> (= (ControlFlow 0 136) 135) anon498_Else_correct)))))
(let ((anon497_Else_correct  (=> (= (MapType0Select Heap@4 cur@0 Tree__right) null) (=> (and (= Mask@56 Mask@54) (= (ControlFlow 0 131) 130)) anon282_correct))))
(let ((anon277_correct  (=> (= Mask@53 (MapType1Store Mask@52 null (Tree__state (MapType0Select Heap@4 cur@0 Tree__left)) (real_2_U (- (U_2_real (MapType1Select Mask@52 null (Tree__state (MapType0Select Heap@4 cur@0 Tree__left)))) FullPerm)))) (=> (and (InsidePredicate (Tree__state cur@0) (MapType0Select Heap@4 null (Tree__state cur@0)) (Tree__state (MapType0Select Heap@4 cur@0 Tree__left)) (MapType0Select Heap@4 null (Tree__state (MapType0Select Heap@4 cur@0 Tree__left)))) (= Mask@54 Mask@53)) (and (=> (= (ControlFlow 0 138) 136) anon497_Then_correct) (=> (= (ControlFlow 0 138) 131) anon497_Else_correct))))))
(let ((anon496_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 141) 138)) anon277_correct)))
(let ((anon496_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 139) (- 0 140)) (<= FullPerm (U_2_real (MapType1Select Mask@52 null (Tree__state (MapType0Select Heap@4 cur@0 Tree__left)))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@52 null (Tree__state (MapType0Select Heap@4 cur@0 Tree__left))))) (=> (= (ControlFlow 0 139) 138) anon277_correct))))))
(let ((anon495_Then_correct  (=> (not (= (MapType0Select Heap@4 cur@0 Tree__left) null)) (and (=> (= (ControlFlow 0 142) 139) anon496_Then_correct) (=> (= (ControlFlow 0 142) 141) anon496_Else_correct)))))
(let ((anon495_Else_correct  (=> (and (= (MapType0Select Heap@4 cur@0 Tree__left) null) (= Mask@54 Mask@52)) (and (=> (= (ControlFlow 0 137) 136) anon497_Then_correct) (=> (= (ControlFlow 0 137) 131) anon497_Else_correct)))))
(let ((anon274_correct  (=> (= Mask@52 (MapType1Store Mask@51 cur@0 Tree__right (real_2_U (- (U_2_real (MapType1Select Mask@51 cur@0 Tree__right)) FullPerm)))) (and (=> (= (ControlFlow 0 143) 142) anon495_Then_correct) (=> (= (ControlFlow 0 143) 137) anon495_Else_correct)))))
(let ((anon494_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 146) 143)) anon274_correct)))
(let ((anon494_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 144) (- 0 145)) (<= FullPerm (U_2_real (MapType1Select Mask@51 cur@0 Tree__right)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@51 cur@0 Tree__right))) (=> (= (ControlFlow 0 144) 143) anon274_correct))))))
(let ((anon272_correct  (=> (= Mask@51 (MapType1Store Mask@50 cur@0 Tree__left (real_2_U (- (U_2_real (MapType1Select Mask@50 cur@0 Tree__left)) FullPerm)))) (and (=> (= (ControlFlow 0 147) 144) anon494_Then_correct) (=> (= (ControlFlow 0 147) 146) anon494_Else_correct)))))
(let ((anon493_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 150) 147)) anon272_correct)))
(let ((anon493_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 148) (- 0 149)) (<= FullPerm (U_2_real (MapType1Select Mask@50 cur@0 Tree__left)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@50 cur@0 Tree__left))) (=> (= (ControlFlow 0 148) 147) anon272_correct))))))
(let ((anon270_correct  (=> (= Mask@50 (MapType1Store Mask@49 cur@0 Tree__data (real_2_U (- (U_2_real (MapType1Select Mask@49 cur@0 Tree__data)) FullPerm)))) (and (=> (= (ControlFlow 0 151) 148) anon493_Then_correct) (=> (= (ControlFlow 0 151) 150) anon493_Else_correct)))))
(let ((anon492_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 154) 151)) anon270_correct)))
(let ((anon492_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 152) (- 0 153)) (<= FullPerm (U_2_real (MapType1Select Mask@49 cur@0 Tree__data)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@49 cur@0 Tree__data))) (=> (= (ControlFlow 0 152) 151) anon270_correct))))))
(let ((anon268_correct  (=> (state ExhaleHeap@0 Mask@48) (=> (and (|Seq#Equal| cur_contents@0 (|Seq#Append| (|Seq#Append| (|Seq#Append| (|Seq#Append| (Tree__tolist ExhaleHeap@0 (MapType0Select ExhaleHeap@0 left@1 Tree__left)) (|Seq#Singleton| (MapType0Select ExhaleHeap@0 left@1 Tree__data))) (Tree__tolist ExhaleHeap@0 (MapType0Select ExhaleHeap@0 left@1 Tree__right))) (|Seq#Singleton| (MapType0Select ExhaleHeap@0 cur@0 Tree__data))) (Tree__tolist ExhaleHeap@0 (MapType0Select ExhaleHeap@0 cur@0 Tree__right)))) (not (= vwand@1 null))) (=> (and (and (= Mask@49 (MapType1Store Mask@48 null (Wand_state_contains_for_state_contains__valid_wand vwand@1) (real_2_U (+ (U_2_real (MapType1Select Mask@48 null (Wand_state_contains_for_state_contains__valid_wand vwand@1))) FullPerm)))) (state ExhaleHeap@0 Mask@49)) (and (state ExhaleHeap@0 Mask@49) (= (Wand_state_contains_for_state_contains__get_in_1 ExhaleHeap@0 vwand@1) cur@0))) (=> (and (and (and (state ExhaleHeap@0 Mask@49) (|Seq#Equal| (Wand_state_contains_for_state_contains__get_in_1_0 ExhaleHeap@0 vwand@1) (|Seq#Drop| cur_contents@0 1))) (and (state ExhaleHeap@0 Mask@49) (= (Wand_state_contains_for_state_contains__get_out_1 ExhaleHeap@0 vwand@1) top))) (and (and (state ExhaleHeap@0 Mask@49) (|Seq#Equal| (Wand_state_contains_for_state_contains__get_out_1_0 ExhaleHeap@0 vwand@1) target_contents@0)) (and (state ExhaleHeap@0 Mask@49) (state ExhaleHeap@0 Mask@49)))) (and (=> (= (ControlFlow 0 155) (- 0 157)) (HasDirectPerm Mask@49 left@1 Tree__right)) (=> (HasDirectPerm Mask@49 left@1 Tree__right) (=> (= __flatten_41@0 (MapType0Select ExhaleHeap@0 left@1 Tree__right)) (=> (and (state ExhaleHeap@0 Mask@49) (state ExhaleHeap@0 Mask@49)) (and (=> (= (ControlFlow 0 155) (- 0 156)) (= FullPerm (U_2_real (MapType1Select Mask@49 cur@0 Tree__left)))) (=> (= FullPerm (U_2_real (MapType1Select Mask@49 cur@0 Tree__left))) (=> (and (= Heap@4 (MapType0Store ExhaleHeap@0 cur@0 Tree__left __flatten_41@0)) (state Heap@4 Mask@49)) (and (=> (= (ControlFlow 0 155) 152) anon492_Then_correct) (=> (= (ControlFlow 0 155) 154) anon492_Else_correct)))))))))))))))
(let ((anon491_Else_correct  (=> (= (MapType0Select ExhaleHeap@0 left@1 Tree__right) null) (=> (and (= Mask@48 Mask@46) (= (ControlFlow 0 159) 155)) anon268_correct))))
(let ((anon491_Then_correct  (=> (not (= (MapType0Select ExhaleHeap@0 left@1 Tree__right) null)) (=> (and (and (= Mask@47 (MapType1Store Mask@46 null (Tree__state (MapType0Select ExhaleHeap@0 left@1 Tree__right)) (real_2_U (+ (U_2_real (MapType1Select Mask@46 null (Tree__state (MapType0Select ExhaleHeap@0 left@1 Tree__right)))) FullPerm)))) (state ExhaleHeap@0 Mask@47)) (and (= Mask@48 Mask@47) (= (ControlFlow 0 158) 155))) anon268_correct))))
(let ((anon490_Else_correct  (=> (and (= (MapType0Select ExhaleHeap@0 left@1 Tree__left) null) (= Mask@46 Mask@44)) (and (=> (= (ControlFlow 0 161) 158) anon491_Then_correct) (=> (= (ControlFlow 0 161) 159) anon491_Else_correct)))))
(let ((anon490_Then_correct  (=> (and (and (not (= (MapType0Select ExhaleHeap@0 left@1 Tree__left) null)) (= Mask@45 (MapType1Store Mask@44 null (Tree__state (MapType0Select ExhaleHeap@0 left@1 Tree__left)) (real_2_U (+ (U_2_real (MapType1Select Mask@44 null (Tree__state (MapType0Select ExhaleHeap@0 left@1 Tree__left)))) FullPerm))))) (and (state ExhaleHeap@0 Mask@45) (= Mask@46 Mask@45))) (and (=> (= (ControlFlow 0 160) 158) anon491_Then_correct) (=> (= (ControlFlow 0 160) 159) anon491_Else_correct)))))
(let ((anon264_correct  (=> (not (= left@1 null)) (=> (and (and (and (= Mask@42 (MapType1Store Mask@41 left@1 Tree__left (real_2_U (+ (U_2_real (MapType1Select Mask@41 left@1 Tree__left)) FullPerm)))) (state ExhaleHeap@0 Mask@42)) (and (not (= left@1 null)) (= Mask@43 (MapType1Store Mask@42 left@1 Tree__data (real_2_U (+ (U_2_real (MapType1Select Mask@42 left@1 Tree__data)) FullPerm)))))) (and (and (state ExhaleHeap@0 Mask@43) (not (= left@1 null))) (and (= Mask@44 (MapType1Store Mask@43 left@1 Tree__right (real_2_U (+ (U_2_real (MapType1Select Mask@43 left@1 Tree__right)) FullPerm)))) (state ExhaleHeap@0 Mask@44)))) (and (=> (= (ControlFlow 0 162) 160) anon490_Then_correct) (=> (= (ControlFlow 0 162) 161) anon490_Else_correct))))))
(let ((anon489_Else_correct  (=> (= (MapType0Select ExhaleHeap@0 cur@0 Tree__right) null) (=> (and (= Mask@41 Mask@39) (= (ControlFlow 0 164) 162)) anon264_correct))))
(let ((anon489_Then_correct  (=> (not (= (MapType0Select ExhaleHeap@0 cur@0 Tree__right) null)) (=> (and (and (= Mask@40 (MapType1Store Mask@39 null (Tree__state (MapType0Select ExhaleHeap@0 cur@0 Tree__right)) (real_2_U (+ (U_2_real (MapType1Select Mask@39 null (Tree__state (MapType0Select ExhaleHeap@0 cur@0 Tree__right)))) FullPerm)))) (state ExhaleHeap@0 Mask@40)) (and (= Mask@41 Mask@40) (= (ControlFlow 0 163) 162))) anon264_correct))))
(let ((anon450_Else_correct  (=> (and (and (not (not (= (MapType0Select ExhaleHeap@0 left@1 Tree__left) null))) (state ExhaleHeap@0 Mask@30)) (and (not (= cur@0 null)) (= Mask@37 (MapType1Store Mask@30 cur@0 Tree__left (real_2_U (+ (U_2_real (MapType1Select Mask@30 cur@0 Tree__left)) FullPerm)))))) (=> (and (and (and (state ExhaleHeap@0 Mask@37) (not (= cur@0 null))) (and (= Mask@38 (MapType1Store Mask@37 cur@0 Tree__data (real_2_U (+ (U_2_real (MapType1Select Mask@37 cur@0 Tree__data)) FullPerm)))) (state ExhaleHeap@0 Mask@38))) (and (and (not (= cur@0 null)) (= Mask@39 (MapType1Store Mask@38 cur@0 Tree__right (real_2_U (+ (U_2_real (MapType1Select Mask@38 cur@0 Tree__right)) FullPerm))))) (and (state ExhaleHeap@0 Mask@39) (= (MapType0Select ExhaleHeap@0 cur@0 Tree__left) left@1)))) (and (=> (= (ControlFlow 0 165) 163) anon489_Then_correct) (=> (= (ControlFlow 0 165) 164) anon489_Else_correct))))))
(let ((anon142_correct  (=> (= Mask@30 (MapType1Store Mask@29 null (Wand_state_contains_for_state_contains__valid_wand vwand@0) (real_2_U (- (U_2_real (MapType1Select Mask@29 null (Wand_state_contains_for_state_contains__valid_wand vwand@0))) FullPerm)))) (and (=> (= (ControlFlow 0 400) (- 0 404)) (= (Wand_state_contains_for_state_contains__get_in_1 Heap@3 vwand@0) top)) (=> (= (Wand_state_contains_for_state_contains__get_in_1 Heap@3 vwand@0) top) (and (=> (= (ControlFlow 0 400) (- 0 403)) (|Seq#Equal| (Wand_state_contains_for_state_contains__get_in_1_0 Heap@3 vwand@0) (|Seq#Drop| __flatten_76@0 1))) (=> (|Seq#Equal| (Wand_state_contains_for_state_contains__get_in_1_0 Heap@3 vwand@0) (|Seq#Drop| __flatten_76@0 1)) (and (=> (= (ControlFlow 0 400) (- 0 402)) (= (Wand_state_contains_for_state_contains__get_out_1 Heap@3 vwand@0) top)) (=> (= (Wand_state_contains_for_state_contains__get_out_1 Heap@3 vwand@0) top) (and (=> (= (ControlFlow 0 400) (- 0 401)) (|Seq#Equal| (Wand_state_contains_for_state_contains__get_out_1_0 Heap@3 vwand@0) target_contents@0)) (=> (|Seq#Equal| (Wand_state_contains_for_state_contains__get_out_1_0 Heap@3 vwand@0) target_contents@0) (=> (and (IdenticalOnKnownLocations Heap@3 ExhaleHeap@0 Mask@30) (U_2_bool (MapType0Select ExhaleHeap@0 vwand@1 $allocated))) (=> (and (and (U_2_bool (MapType0Select ExhaleHeap@0 left@1 $allocated)) (U_2_bool (MapType0Select ExhaleHeap@0 cur@0 $allocated))) (and (U_2_bool (MapType0Select ExhaleHeap@0 prev@0 $allocated)) (U_2_bool (MapType0Select ExhaleHeap@0 __flatten_40@0 $allocated)))) (and (and (=> (= (ControlFlow 0 400) 397) anon429_Then_correct) (=> (= (ControlFlow 0 400) 325) anon450_Then_correct)) (=> (= (ControlFlow 0 400) 165) anon450_Else_correct)))))))))))))))
(let ((anon428_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 407) 400)) anon142_correct)))
(let ((anon428_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 405) (- 0 406)) (<= FullPerm (U_2_real (MapType1Select Mask@29 null (Wand_state_contains_for_state_contains__valid_wand vwand@0))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@29 null (Wand_state_contains_for_state_contains__valid_wand vwand@0)))) (=> (= (ControlFlow 0 405) 400) anon142_correct))))))
(let ((anon140_correct  (and (=> (= (ControlFlow 0 408) (- 0 410)) (|Seq#Equal| __flatten_76@0 (|Seq#Append| (|Seq#Append| (|Seq#Append| (|Seq#Append| (Tree__tolist Heap@3 (MapType0Select Heap@3 left@0 Tree__left)) (|Seq#Singleton| (MapType0Select Heap@3 left@0 Tree__data))) (Tree__tolist Heap@3 (MapType0Select Heap@3 left@0 Tree__right))) (|Seq#Singleton| (MapType0Select Heap@3 top Tree__data))) (Tree__tolist Heap@3 (MapType0Select Heap@3 top Tree__right))))) (=> (|Seq#Equal| __flatten_76@0 (|Seq#Append| (|Seq#Append| (|Seq#Append| (|Seq#Append| (Tree__tolist Heap@3 (MapType0Select Heap@3 left@0 Tree__left)) (|Seq#Singleton| (MapType0Select Heap@3 left@0 Tree__data))) (Tree__tolist Heap@3 (MapType0Select Heap@3 left@0 Tree__right))) (|Seq#Singleton| (MapType0Select Heap@3 top Tree__data))) (Tree__tolist Heap@3 (MapType0Select Heap@3 top Tree__right)))) (and (=> (= (ControlFlow 0 408) (- 0 409)) (not (= vwand@0 null))) (=> (not (= vwand@0 null)) (and (=> (= (ControlFlow 0 408) 405) anon428_Then_correct) (=> (= (ControlFlow 0 408) 407) anon428_Else_correct))))))))
(let ((anon139_correct  (=> (= Mask@28 (MapType1Store Mask@27 null (Tree__state (MapType0Select Heap@3 left@0 Tree__right)) (real_2_U (- (U_2_real (MapType1Select Mask@27 null (Tree__state (MapType0Select Heap@3 left@0 Tree__right)))) FullPerm)))) (=> (and (= Mask@29 Mask@28) (= (ControlFlow 0 412) 408)) anon140_correct))))
(let ((anon427_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 415) 412)) anon139_correct)))
(let ((anon427_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 413) (- 0 414)) (<= FullPerm (U_2_real (MapType1Select Mask@27 null (Tree__state (MapType0Select Heap@3 left@0 Tree__right)))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@27 null (Tree__state (MapType0Select Heap@3 left@0 Tree__right))))) (=> (= (ControlFlow 0 413) 412) anon139_correct))))))
(let ((anon426_Then_correct  (=> (not (= (MapType0Select Heap@3 left@0 Tree__right) null)) (and (=> (= (ControlFlow 0 416) 413) anon427_Then_correct) (=> (= (ControlFlow 0 416) 415) anon427_Else_correct)))))
(let ((anon426_Else_correct  (=> (= (MapType0Select Heap@3 left@0 Tree__right) null) (=> (and (= Mask@29 Mask@27) (= (ControlFlow 0 411) 408)) anon140_correct))))
(let ((anon135_correct  (=> (and (= Mask@26 (MapType1Store Mask@25 null (Tree__state (MapType0Select Heap@3 left@0 Tree__left)) (real_2_U (- (U_2_real (MapType1Select Mask@25 null (Tree__state (MapType0Select Heap@3 left@0 Tree__left)))) FullPerm)))) (= Mask@27 Mask@26)) (and (=> (= (ControlFlow 0 418) 416) anon426_Then_correct) (=> (= (ControlFlow 0 418) 411) anon426_Else_correct)))))
(let ((anon425_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 421) 418)) anon135_correct)))
(let ((anon425_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 419) (- 0 420)) (<= FullPerm (U_2_real (MapType1Select Mask@25 null (Tree__state (MapType0Select Heap@3 left@0 Tree__left)))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@25 null (Tree__state (MapType0Select Heap@3 left@0 Tree__left))))) (=> (= (ControlFlow 0 419) 418) anon135_correct))))))
(let ((anon424_Then_correct  (=> (not (= (MapType0Select Heap@3 left@0 Tree__left) null)) (and (=> (= (ControlFlow 0 422) 419) anon425_Then_correct) (=> (= (ControlFlow 0 422) 421) anon425_Else_correct)))))
(let ((anon424_Else_correct  (=> (and (= (MapType0Select Heap@3 left@0 Tree__left) null) (= Mask@27 Mask@25)) (and (=> (= (ControlFlow 0 417) 416) anon426_Then_correct) (=> (= (ControlFlow 0 417) 411) anon426_Else_correct)))))
(let ((anon132_correct  (=> (= Mask@25 (MapType1Store Mask@24 left@0 Tree__right (real_2_U (- (U_2_real (MapType1Select Mask@24 left@0 Tree__right)) FullPerm)))) (and (=> (= (ControlFlow 0 423) 422) anon424_Then_correct) (=> (= (ControlFlow 0 423) 417) anon424_Else_correct)))))
(let ((anon423_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 426) 423)) anon132_correct)))
(let ((anon423_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 424) (- 0 425)) (<= FullPerm (U_2_real (MapType1Select Mask@24 left@0 Tree__right)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@24 left@0 Tree__right))) (=> (= (ControlFlow 0 424) 423) anon132_correct))))))
(let ((anon130_correct  (=> (= Mask@24 (MapType1Store Mask@23 left@0 Tree__data (real_2_U (- (U_2_real (MapType1Select Mask@23 left@0 Tree__data)) FullPerm)))) (and (=> (= (ControlFlow 0 427) 424) anon423_Then_correct) (=> (= (ControlFlow 0 427) 426) anon423_Else_correct)))))
(let ((anon422_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 430) 427)) anon130_correct)))
(let ((anon422_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 428) (- 0 429)) (<= FullPerm (U_2_real (MapType1Select Mask@23 left@0 Tree__data)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@23 left@0 Tree__data))) (=> (= (ControlFlow 0 428) 427) anon130_correct))))))
(let ((anon128_correct  (=> (= Mask@23 (MapType1Store Mask@22 left@0 Tree__left (real_2_U (- (U_2_real (MapType1Select Mask@22 left@0 Tree__left)) FullPerm)))) (and (=> (= (ControlFlow 0 431) 428) anon422_Then_correct) (=> (= (ControlFlow 0 431) 430) anon422_Else_correct)))))
(let ((anon421_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 434) 431)) anon128_correct)))
(let ((anon421_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 432) (- 0 433)) (<= FullPerm (U_2_real (MapType1Select Mask@22 left@0 Tree__left)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@22 left@0 Tree__left))) (=> (= (ControlFlow 0 432) 431) anon128_correct))))))
(let ((anon125_correct  (=> (and (= Mask@21 (MapType1Store Mask@20 null (Tree__state (MapType0Select Heap@3 top Tree__right)) (real_2_U (- (U_2_real (MapType1Select Mask@20 null (Tree__state (MapType0Select Heap@3 top Tree__right)))) FullPerm)))) (= Mask@22 Mask@21)) (and (=> (= (ControlFlow 0 436) 432) anon421_Then_correct) (=> (= (ControlFlow 0 436) 434) anon421_Else_correct)))))
(let ((anon420_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 439) 436)) anon125_correct)))
(let ((anon420_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 437) (- 0 438)) (<= FullPerm (U_2_real (MapType1Select Mask@20 null (Tree__state (MapType0Select Heap@3 top Tree__right)))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@20 null (Tree__state (MapType0Select Heap@3 top Tree__right))))) (=> (= (ControlFlow 0 437) 436) anon125_correct))))))
(let ((anon419_Then_correct  (=> (not (= (MapType0Select Heap@3 top Tree__right) null)) (and (=> (= (ControlFlow 0 440) 437) anon420_Then_correct) (=> (= (ControlFlow 0 440) 439) anon420_Else_correct)))))
(let ((anon419_Else_correct  (=> (and (= (MapType0Select Heap@3 top Tree__right) null) (= Mask@22 Mask@20)) (and (=> (= (ControlFlow 0 435) 432) anon421_Then_correct) (=> (= (ControlFlow 0 435) 434) anon421_Else_correct)))))
(let ((anon122_correct  (=> (= Mask@20 (MapType1Store Mask@19 top Tree__right (real_2_U (- (U_2_real (MapType1Select Mask@19 top Tree__right)) FullPerm)))) (and (=> (= (ControlFlow 0 441) (- 0 442)) (= (MapType0Select Heap@3 top Tree__left) left@0)) (=> (= (MapType0Select Heap@3 top Tree__left) left@0) (and (=> (= (ControlFlow 0 441) 440) anon419_Then_correct) (=> (= (ControlFlow 0 441) 435) anon419_Else_correct)))))))
(let ((anon418_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 445) 441)) anon122_correct)))
(let ((anon418_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 443) (- 0 444)) (<= FullPerm (U_2_real (MapType1Select Mask@19 top Tree__right)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@19 top Tree__right))) (=> (= (ControlFlow 0 443) 441) anon122_correct))))))
(let ((anon120_correct  (=> (= Mask@19 (MapType1Store Mask@18 top Tree__data (real_2_U (- (U_2_real (MapType1Select Mask@18 top Tree__data)) FullPerm)))) (and (=> (= (ControlFlow 0 446) 443) anon418_Then_correct) (=> (= (ControlFlow 0 446) 445) anon418_Else_correct)))))
(let ((anon417_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 449) 446)) anon120_correct)))
(let ((anon417_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 447) (- 0 448)) (<= FullPerm (U_2_real (MapType1Select Mask@18 top Tree__data)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@18 top Tree__data))) (=> (= (ControlFlow 0 447) 446) anon120_correct))))))
(let ((anon118_correct  (=> (= Mask@18 (MapType1Store Mask@17 top Tree__left (real_2_U (- (U_2_real (MapType1Select Mask@17 top Tree__left)) FullPerm)))) (and (=> (= (ControlFlow 0 450) 447) anon417_Then_correct) (=> (= (ControlFlow 0 450) 449) anon417_Else_correct)))))
(let ((anon416_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 453) 450)) anon118_correct)))
(let ((anon416_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 451) (- 0 452)) (<= FullPerm (U_2_real (MapType1Select Mask@17 top Tree__left)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@17 top Tree__left))) (=> (= (ControlFlow 0 451) 450) anon118_correct))))))
(let ((anon116_correct  (=> (and (state Heap@3 Mask@16) (state Heap@3 Mask@16)) (and (=> (= (ControlFlow 0 454) (- 0 463)) (not (= diz@@29 null))) (=> (not (= diz@@29 null)) (and (=> (= (ControlFlow 0 454) (- 0 462)) (>= current_thread_id 0)) (=> (>= current_thread_id 0) (and (=> (= (ControlFlow 0 454) (- 0 461)) (not (= diz@@29 null))) (=> (not (= diz@@29 null)) (and (=> (= (ControlFlow 0 454) (- 0 460)) (not (= top null))) (=> (not (= top null)) (and (=> (= (ControlFlow 0 454) (- 0 459)) (= top top)) (=> (= top top) (and (=> (= (ControlFlow 0 454) (- 0 458)) (|Seq#Equal| target_contents@0 target_contents@0)) (=> (|Seq#Equal| target_contents@0 target_contents@0) (and (=> (= (ControlFlow 0 454) (- 0 457)) (not (= top null))) (=> (not (= top null)) (and (=> (= (ControlFlow 0 454) (- 0 456)) (= top top)) (=> (= top top) (and (=> (= (ControlFlow 0 454) (- 0 455)) (|Seq#Equal| target_contents@0 target_contents@0)) (=> (|Seq#Equal| target_contents@0 target_contents@0) (=> (and (not (= vwand@0 null)) (= Mask@17 (MapType1Store Mask@16 null (Wand_state_contains_for_state_contains__valid_wand vwand@0) (real_2_U (+ (U_2_real (MapType1Select Mask@16 null (Wand_state_contains_for_state_contains__valid_wand vwand@0))) FullPerm))))) (=> (and (and (state Heap@3 Mask@17) (state Heap@3 Mask@17)) (and (= (Wand_state_contains_for_state_contains__get_in_1 Heap@3 vwand@0) top) (state Heap@3 Mask@17))) (=> (and (and (and (|Seq#Equal| (Wand_state_contains_for_state_contains__get_in_1_0 Heap@3 vwand@0) target_contents@0) (state Heap@3 Mask@17)) (and (= (Wand_state_contains_for_state_contains__get_out_1 Heap@3 vwand@0) top) (state Heap@3 Mask@17))) (and (and (|Seq#Equal| (Wand_state_contains_for_state_contains__get_out_1_0 Heap@3 vwand@0) target_contents@0) (state Heap@3 Mask@17)) (and (U_2_bool (MapType0Select Heap@3 vwand@0 $allocated)) (state Heap@3 Mask@17)))) (and (=> (= (ControlFlow 0 454) 451) anon416_Then_correct) (=> (= (ControlFlow 0 454) 453) anon416_Else_correct))))))))))))))))))))))))))
(let ((anon415_Else_correct  (=> (= (MapType0Select Heap@3 left@0 Tree__right) null) (=> (and (= Mask@16 Mask@14) (= (ControlFlow 0 465) 454)) anon116_correct))))
(let ((anon415_Then_correct  (=> (and (not (= (MapType0Select Heap@3 left@0 Tree__right) null)) (= Mask@15 (MapType1Store Mask@14 null (Tree__state (MapType0Select Heap@3 left@0 Tree__right)) (real_2_U (+ (U_2_real (MapType1Select Mask@14 null (Tree__state (MapType0Select Heap@3 left@0 Tree__right)))) FullPerm))))) (=> (and (and (InsidePredicate (Tree__state left@0) (MapType0Select Heap@3 null (Tree__state left@0)) (Tree__state (MapType0Select Heap@3 left@0 Tree__right)) (MapType0Select Heap@3 null (Tree__state (MapType0Select Heap@3 left@0 Tree__right)))) (state Heap@3 Mask@15)) (and (= Mask@16 Mask@15) (= (ControlFlow 0 464) 454))) anon116_correct))))
(let ((anon414_Else_correct  (=> (and (= (MapType0Select Heap@3 left@0 Tree__left) null) (= Mask@14 Mask@12)) (and (=> (= (ControlFlow 0 467) 464) anon415_Then_correct) (=> (= (ControlFlow 0 467) 465) anon415_Else_correct)))))
(let ((anon414_Then_correct  (=> (not (= (MapType0Select Heap@3 left@0 Tree__left) null)) (=> (and (and (= Mask@13 (MapType1Store Mask@12 null (Tree__state (MapType0Select Heap@3 left@0 Tree__left)) (real_2_U (+ (U_2_real (MapType1Select Mask@12 null (Tree__state (MapType0Select Heap@3 left@0 Tree__left)))) FullPerm)))) (InsidePredicate (Tree__state left@0) (MapType0Select Heap@3 null (Tree__state left@0)) (Tree__state (MapType0Select Heap@3 left@0 Tree__left)) (MapType0Select Heap@3 null (Tree__state (MapType0Select Heap@3 left@0 Tree__left))))) (and (state Heap@3 Mask@13) (= Mask@14 Mask@13))) (and (=> (= (ControlFlow 0 466) 464) anon415_Then_correct) (=> (= (ControlFlow 0 466) 465) anon415_Else_correct))))))
(let ((anon112_correct  (=> (not (= left@0 null)) (=> (and (and (and (= Mask@10 (MapType1Store Mask@9 left@0 Tree__data (real_2_U (+ (U_2_real (MapType1Select Mask@9 left@0 Tree__data)) FullPerm)))) (state Heap@3 Mask@10)) (and (not (= left@0 null)) (= Mask@11 (MapType1Store Mask@10 left@0 Tree__left (real_2_U (+ (U_2_real (MapType1Select Mask@10 left@0 Tree__left)) FullPerm)))))) (and (and (state Heap@3 Mask@11) (not (= left@0 null))) (and (= Mask@12 (MapType1Store Mask@11 left@0 Tree__right (real_2_U (+ (U_2_real (MapType1Select Mask@11 left@0 Tree__right)) FullPerm)))) (state Heap@3 Mask@12)))) (and (=> (= (ControlFlow 0 468) 466) anon414_Then_correct) (=> (= (ControlFlow 0 468) 467) anon414_Else_correct))))))
(let ((anon413_Else_correct  (=> (HasDirectPerm Mask@9 null (Tree__state left@0)) (=> (and (= Heap@3 Heap@1) (= (ControlFlow 0 470) 468)) anon112_correct))))
(let ((anon413_Then_correct  (=> (and (and (not (HasDirectPerm Mask@9 null (Tree__state left@0))) (= Heap@2 (MapType0Store Heap@1 null (Tree__state left@0) newVersion@1))) (and (= Heap@3 Heap@2) (= (ControlFlow 0 469) 468))) anon112_correct)))
(let ((anon110_correct  (=> (= Mask@9 (MapType1Store Mask@8 null (Tree__state left@0) (real_2_U (- (U_2_real (MapType1Select Mask@8 null (Tree__state left@0))) FullPerm)))) (and (=> (= (ControlFlow 0 471) 469) anon413_Then_correct) (=> (= (ControlFlow 0 471) 470) anon413_Else_correct)))))
(let ((anon412_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 474) 471)) anon110_correct)))
(let ((anon412_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 472) (- 0 473)) (<= FullPerm (U_2_real (MapType1Select Mask@8 null (Tree__state left@0))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@8 null (Tree__state left@0)))) (=> (= (ControlFlow 0 472) 471) anon110_correct))))))
(let ((anon409_Else_correct  (and (=> (= (ControlFlow 0 475) (- 0 476)) (|Seq#Equal| __flatten_76@0 (|Seq#Append| (|Seq#Append| (Tree__tolist Heap@1 left@0) (|Seq#Singleton| (MapType0Select Heap@1 top Tree__data))) (Tree__tolist Heap@1 (MapType0Select Heap@1 top Tree__right))))) (=> (|Seq#Equal| __flatten_76@0 (|Seq#Append| (|Seq#Append| (Tree__tolist Heap@1 left@0) (|Seq#Singleton| (MapType0Select Heap@1 top Tree__data))) (Tree__tolist Heap@1 (MapType0Select Heap@1 top Tree__right)))) (=> (state Heap@1 Mask@8) (=> (and (|Tree__state#trigger| Heap@1 (Tree__state left@0)) (= (MapType0Select Heap@1 null (Tree__state left@0)) (CombineFrames (FrameFragment (MapType0Select Heap@1 left@0 Tree__data)) (CombineFrames (FrameFragment (MapType0Select Heap@1 left@0 Tree__left)) (CombineFrames (FrameFragment (MapType0Select Heap@1 left@0 Tree__right)) (CombineFrames (FrameFragment (ite (not (= (MapType0Select Heap@1 left@0 Tree__left) null)) (MapType0Select Heap@1 null (Tree__state (MapType0Select Heap@1 left@0 Tree__left))) EmptyFrame)) (FrameFragment (ite (not (= (MapType0Select Heap@1 left@0 Tree__right) null)) (MapType0Select Heap@1 null (Tree__state (MapType0Select Heap@1 left@0 Tree__right))) EmptyFrame)))))))) (and (=> (= (ControlFlow 0 475) 472) anon412_Then_correct) (=> (= (ControlFlow 0 475) 474) anon412_Else_correct))))))))
(let ((anon107_correct true))
(let ((anon106_correct  (=> (= ExhaleWellDef0Mask@14 (MapType1Store Mask@8 null (Tree__state (MapType0Select Heap@1 top Tree__right)) (real_2_U (- (U_2_real (MapType1Select Mask@8 null (Tree__state (MapType0Select Heap@1 top Tree__right)))) FullPerm)))) (=> (and (= ExhaleWellDef0Mask@15 ExhaleWellDef0Mask@14) (= (ControlFlow 0 24) 22)) anon107_correct))))
(let ((anon411_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 27) 24)) anon106_correct)))
(let ((anon411_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 25) (- 0 26)) (<= FullPerm (U_2_real (MapType1Select Mask@8 null (Tree__state (MapType0Select Heap@1 top Tree__right)))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@8 null (Tree__state (MapType0Select Heap@1 top Tree__right))))) (=> (= (ControlFlow 0 25) 24) anon106_correct))))))
(let ((anon410_Then_correct  (=> (not (= (MapType0Select Heap@1 top Tree__right) null)) (and (=> (= (ControlFlow 0 28) 25) anon411_Then_correct) (=> (= (ControlFlow 0 28) 27) anon411_Else_correct)))))
(let ((anon410_Else_correct  (=> (= (MapType0Select Heap@1 top Tree__right) null) (=> (and (= ExhaleWellDef0Mask@15 Mask@8) (= (ControlFlow 0 23) 22)) anon107_correct))))
(let ((anon406_Else_correct  (and (=> (= (ControlFlow 0 477) (- 0 479)) (HasDirectPerm Mask@8 top Tree__data)) (=> (HasDirectPerm Mask@8 top Tree__data) (and (=> (= (ControlFlow 0 477) (- 0 478)) (HasDirectPerm Mask@8 top Tree__right)) (=> (HasDirectPerm Mask@8 top Tree__right) (and (and (=> (= (ControlFlow 0 477) 475) anon409_Else_correct) (=> (= (ControlFlow 0 477) 28) anon410_Then_correct)) (=> (= (ControlFlow 0 477) 23) anon410_Else_correct))))))))
(let ((anon101_correct true))
(let ((anon100_correct  (=> (= ExhaleWellDef0Mask@16 (MapType1Store Mask@8 null (Tree__state left@0) (real_2_U (- (U_2_real (MapType1Select Mask@8 null (Tree__state left@0))) FullPerm)))) (=> (and (= ExhaleWellDef0Mask@17 ExhaleWellDef0Mask@16) (= (ControlFlow 0 17) 15)) anon101_correct))))
(let ((anon408_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 20) 17)) anon100_correct)))
(let ((anon408_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 18) (- 0 19)) (<= FullPerm (U_2_real (MapType1Select Mask@8 null (Tree__state left@0))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@8 null (Tree__state left@0)))) (=> (= (ControlFlow 0 18) 17) anon100_correct))))))
(let ((anon407_Then_correct  (=> (not (= left@0 null)) (and (=> (= (ControlFlow 0 21) 18) anon408_Then_correct) (=> (= (ControlFlow 0 21) 20) anon408_Else_correct)))))
(let ((anon407_Else_correct  (=> (= left@0 null) (=> (and (= ExhaleWellDef0Mask@17 Mask@8) (= (ControlFlow 0 16) 15)) anon101_correct))))
(let ((anon381_Else_correct  (=> (and (not (= (MapType0Select Heap@1 top Tree__left) null)) (state Heap@1 Mask@8)) (and (=> (= (ControlFlow 0 480) (- 0 481)) (HasDirectPerm Mask@8 top Tree__left)) (=> (HasDirectPerm Mask@8 top Tree__left) (=> (= left@0 (MapType0Select Heap@1 top Tree__left)) (=> (and (state Heap@1 Mask@8) (state Heap@1 Mask@8)) (and (and (=> (= (ControlFlow 0 480) 477) anon406_Else_correct) (=> (= (ControlFlow 0 480) 21) anon407_Then_correct)) (=> (= (ControlFlow 0 480) 16) anon407_Else_correct)))))))))
(let ((anon48_correct  (=> (and (state Heap@1 Mask@8) (state Heap@1 Mask@8)) (and (=> (= (ControlFlow 0 553) (- 0 554)) (HasDirectPerm Mask@8 top Tree__left)) (=> (HasDirectPerm Mask@8 top Tree__left) (and (=> (= (ControlFlow 0 553) 551) anon381_Then_correct) (=> (= (ControlFlow 0 553) 480) anon381_Else_correct)))))))
(let ((anon380_Else_correct  (=> (= (MapType0Select Heap@1 top Tree__right) null) (=> (and (= Mask@8 Mask@6) (= (ControlFlow 0 556) 553)) anon48_correct))))
(let ((anon380_Then_correct  (=> (and (not (= (MapType0Select Heap@1 top Tree__right) null)) (= Mask@7 (MapType1Store Mask@6 null (Tree__state (MapType0Select Heap@1 top Tree__right)) (real_2_U (+ (U_2_real (MapType1Select Mask@6 null (Tree__state (MapType0Select Heap@1 top Tree__right)))) FullPerm))))) (=> (and (and (InsidePredicate (Tree__state top) (MapType0Select Heap@1 null (Tree__state top)) (Tree__state (MapType0Select Heap@1 top Tree__right)) (MapType0Select Heap@1 null (Tree__state (MapType0Select Heap@1 top Tree__right)))) (state Heap@1 Mask@7)) (and (= Mask@8 Mask@7) (= (ControlFlow 0 555) 553))) anon48_correct))))
(let ((anon379_Else_correct  (=> (and (= (MapType0Select Heap@1 top Tree__left) null) (= Mask@6 Mask@4)) (and (=> (= (ControlFlow 0 558) 555) anon380_Then_correct) (=> (= (ControlFlow 0 558) 556) anon380_Else_correct)))))
(let ((anon379_Then_correct  (=> (not (= (MapType0Select Heap@1 top Tree__left) null)) (=> (and (and (= Mask@5 (MapType1Store Mask@4 null (Tree__state (MapType0Select Heap@1 top Tree__left)) (real_2_U (+ (U_2_real (MapType1Select Mask@4 null (Tree__state (MapType0Select Heap@1 top Tree__left)))) FullPerm)))) (InsidePredicate (Tree__state top) (MapType0Select Heap@1 null (Tree__state top)) (Tree__state (MapType0Select Heap@1 top Tree__left)) (MapType0Select Heap@1 null (Tree__state (MapType0Select Heap@1 top Tree__left))))) (and (state Heap@1 Mask@5) (= Mask@6 Mask@5))) (and (=> (= (ControlFlow 0 557) 555) anon380_Then_correct) (=> (= (ControlFlow 0 557) 556) anon380_Else_correct))))))
(let ((anon44_correct  (=> (not (= top null)) (=> (and (and (and (= Mask@2 (MapType1Store Mask@1 top Tree__data (real_2_U (+ (U_2_real (MapType1Select Mask@1 top Tree__data)) FullPerm)))) (state Heap@1 Mask@2)) (and (not (= top null)) (= Mask@3 (MapType1Store Mask@2 top Tree__left (real_2_U (+ (U_2_real (MapType1Select Mask@2 top Tree__left)) FullPerm)))))) (and (and (state Heap@1 Mask@3) (not (= top null))) (and (= Mask@4 (MapType1Store Mask@3 top Tree__right (real_2_U (+ (U_2_real (MapType1Select Mask@3 top Tree__right)) FullPerm)))) (state Heap@1 Mask@4)))) (and (=> (= (ControlFlow 0 559) 557) anon379_Then_correct) (=> (= (ControlFlow 0 559) 558) anon379_Else_correct))))))
(let ((anon378_Else_correct  (=> (HasDirectPerm Mask@1 null (Tree__state top)) (=> (and (= Heap@1 Heap@@41) (= (ControlFlow 0 561) 559)) anon44_correct))))
(let ((anon378_Then_correct  (=> (and (and (not (HasDirectPerm Mask@1 null (Tree__state top))) (= Heap@0 (MapType0Store Heap@@41 null (Tree__state top) newVersion@0))) (and (= Heap@1 Heap@0) (= (ControlFlow 0 560) 559))) anon44_correct)))
(let ((anon42_correct  (=> (= Mask@1 (MapType1Store Mask@0 null (Tree__state top) (real_2_U (- (U_2_real (MapType1Select Mask@0 null (Tree__state top))) FullPerm)))) (and (=> (= (ControlFlow 0 562) 560) anon378_Then_correct) (=> (= (ControlFlow 0 562) 561) anon378_Else_correct)))))
(let ((anon377_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 565) 562)) anon42_correct)))
(let ((anon377_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 563) (- 0 564)) (<= FullPerm (U_2_real (MapType1Select Mask@0 null (Tree__state top))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@0 null (Tree__state top)))) (=> (= (ControlFlow 0 563) 562) anon42_correct))))))
(let ((anon374_Else_correct  (=> (= __flatten_77@0 (Tree__tolist Heap@@41 top)) (=> (and (state Heap@@41 Mask@0) (state Heap@@41 Mask@0)) (=> (and (and (= target_contents@0 (|Seq#Drop| __flatten_77@0 1)) (state Heap@@41 Mask@0)) (and (|Tree__state#trigger| Heap@@41 (Tree__state top)) (= (MapType0Select Heap@@41 null (Tree__state top)) (CombineFrames (FrameFragment (MapType0Select Heap@@41 top Tree__data)) (CombineFrames (FrameFragment (MapType0Select Heap@@41 top Tree__left)) (CombineFrames (FrameFragment (MapType0Select Heap@@41 top Tree__right)) (CombineFrames (FrameFragment (ite (not (= (MapType0Select Heap@@41 top Tree__left) null)) (MapType0Select Heap@@41 null (Tree__state (MapType0Select Heap@@41 top Tree__left))) EmptyFrame)) (FrameFragment (ite (not (= (MapType0Select Heap@@41 top Tree__right) null)) (MapType0Select Heap@@41 null (Tree__state (MapType0Select Heap@@41 top Tree__right))) EmptyFrame))))))))) (and (=> (= (ControlFlow 0 566) 563) anon377_Then_correct) (=> (= (ControlFlow 0 566) 565) anon377_Else_correct)))))))
(let ((anon39_correct true))
(let ((anon38_correct  (=> (= Mask@125 (MapType1Store Mask@0 null (Tree__state top) (real_2_U (- (U_2_real (MapType1Select Mask@0 null (Tree__state top))) FullPerm)))) (=> (and (= Mask@126 Mask@125) (= (ControlFlow 0 10) 8)) anon39_correct))))
(let ((anon376_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 13) 10)) anon38_correct)))
(let ((anon376_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 11) (- 0 12)) (<= FullPerm (U_2_real (MapType1Select Mask@0 null (Tree__state top))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@0 null (Tree__state top)))) (=> (= (ControlFlow 0 11) 10) anon38_correct))))))
(let ((anon375_Then_correct  (=> (not (= top null)) (and (=> (= (ControlFlow 0 14) 11) anon376_Then_correct) (=> (= (ControlFlow 0 14) 13) anon376_Else_correct)))))
(let ((anon375_Else_correct  (=> (= top null) (=> (and (= Mask@126 Mask@0) (= (ControlFlow 0 9) 8)) anon39_correct))))
(let ((anon371_Else_correct  (=> (and (and (= __flatten_76@0 (Tree__tolist Heap@@41 top)) (state Heap@@41 Mask@0)) (and (state Heap@@41 Mask@0) (state Heap@@41 Mask@0))) (and (and (=> (= (ControlFlow 0 567) 566) anon374_Else_correct) (=> (= (ControlFlow 0 567) 14) anon375_Then_correct)) (=> (= (ControlFlow 0 567) 9) anon375_Else_correct)))))
(let ((anon33_correct true))
(let ((anon32_correct  (=> (= Mask@127 (MapType1Store Mask@0 null (Tree__state top) (real_2_U (- (U_2_real (MapType1Select Mask@0 null (Tree__state top))) FullPerm)))) (=> (and (= Mask@128 Mask@127) (= (ControlFlow 0 3) 1)) anon33_correct))))
(let ((anon373_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 6) 3)) anon32_correct)))
(let ((anon373_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 4) (- 0 5)) (<= FullPerm (U_2_real (MapType1Select Mask@0 null (Tree__state top))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@0 null (Tree__state top)))) (=> (= (ControlFlow 0 4) 3) anon32_correct))))))
(let ((anon372_Then_correct  (=> (not (= top null)) (and (=> (= (ControlFlow 0 7) 4) anon373_Then_correct) (=> (= (ControlFlow 0 7) 6) anon373_Else_correct)))))
(let ((anon372_Else_correct  (=> (= top null) (=> (and (= Mask@128 Mask@0) (= (ControlFlow 0 2) 1)) anon33_correct))))
(let ((anon356_Else_correct  (=> (U_2_bool (MapType0Select Heap@@41 prev $allocated)) (=> (and (and (and (U_2_bool (MapType0Select Heap@@41 vwand $allocated)) (U_2_bool (MapType0Select Heap@@41 left $allocated))) (and (U_2_bool (MapType0Select Heap@@41 cur $allocated)) (U_2_bool (MapType0Select Heap@@41 __flatten_36 $allocated)))) (and (and (U_2_bool (MapType0Select Heap@@41 __flatten_40 $allocated)) (U_2_bool (MapType0Select Heap@@41 __flatten_41 $allocated))) (and (U_2_bool (MapType0Select Heap@@41 __flatten_43 $allocated)) (U_2_bool (MapType0Select Heap@@41 __flatten_82 $allocated))))) (and (and (=> (= (ControlFlow 0 568) 567) anon371_Else_correct) (=> (= (ControlFlow 0 568) 7) anon372_Then_correct)) (=> (= (ControlFlow 0 568) 2) anon372_Else_correct))))))
(let ((anon0_correct  (=> (state Heap@@41 ZeroMask) (=> (and (and (= AssumeFunctionsAbove (- 0 1)) (U_2_bool (MapType0Select Heap@@41 diz@@29 $allocated))) (and (U_2_bool (MapType0Select Heap@@41 top $allocated)) (not (= diz@@29 null)))) (=> (and (and (and (state Heap@@41 ZeroMask) (>= current_thread_id 0)) (and (state Heap@@41 ZeroMask) (not (= top null)))) (and (and (state Heap@@41 ZeroMask) (= Mask@0 (MapType1Store ZeroMask null (Tree__state top) (real_2_U (+ (U_2_real (MapType1Select ZeroMask null (Tree__state top))) FullPerm))))) (and (state Heap@@41 Mask@0) (state Heap@@41 Mask@0)))) (and (=> (= (ControlFlow 0 604) 603) anon356_Then_correct) (=> (= (ControlFlow 0 604) 568) anon356_Else_correct)))))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 605) 604) anon0_correct)))
PreconditionGeneratedEntry_correct)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
))
(check-sat)
(get-info :reason-unknown)
(assert (not (= (ControlFlow 0 534) (- 535))))
(check-sat)
(pop 1)
; Invalid
(get-info :rlimit)
