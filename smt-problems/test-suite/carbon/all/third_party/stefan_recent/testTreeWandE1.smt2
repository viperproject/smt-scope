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
(declare-fun Mask@5 () T@U)
(declare-fun wand_1 () T@U)
(declare-fun PostMask@0 () T@U)
(declare-fun sys__result () T@U)
(declare-fun PostHeap@0 () T@U)
(declare-fun out_1 () T@U)
(declare-fun in_1_0 () T@U)
(declare-fun in_1 () T@U)
(declare-fun Mask@45 () T@U)
(declare-fun __flatten_9@0 () T@U)
(declare-fun Heap@38 () T@U)
(declare-fun out_1_0 () T@U)
(declare-fun AssertMask@0 () T@U)
(declare-fun Heap@36 () T@U)
(declare-fun Heap@35 () T@U)
(declare-fun Heap@37 () T@U)
(declare-fun newPMask@1 () T@U)
(declare-fun Heap@33 () T@U)
(declare-fun Heap@34 () T@U)
(declare-fun Heap@31 () T@U)
(declare-fun newPMask@0 () T@U)
(declare-fun Heap@32 () T@U)
(declare-fun Heap@28 () T@U)
(declare-fun Heap@29 () T@U)
(declare-fun Heap@30 () T@U)
(declare-fun Heap@16 () T@U)
(declare-fun Heap@15 () T@U)
(declare-fun Heap@17 () T@U)
(declare-fun Heap@18 () T@U)
(declare-fun Heap@19 () T@U)
(declare-fun Heap@20 () T@U)
(declare-fun Heap@21 () T@U)
(declare-fun Heap@22 () T@U)
(declare-fun Heap@23 () T@U)
(declare-fun Heap@24 () T@U)
(declare-fun Heap@25 () T@U)
(declare-fun Heap@26 () T@U)
(declare-fun Heap@27 () T@U)
(declare-fun Heap@12 () T@U)
(declare-fun Heap@13 () T@U)
(declare-fun Heap@14 () T@U)
(declare-fun freshVersion@0 () T@U)
(declare-fun Mask@44 () T@U)
(declare-fun CombineFrames (T@U T@U) T@U)
(declare-fun Mask@41 () T@U)
(declare-fun wildcard@13 () Real)
(declare-fun Mask@42 () T@U)
(declare-fun wildcard@14 () Real)
(declare-fun Mask@43 () T@U)
(declare-fun wildcard@15 () Real)
(declare-fun Mask@40 () T@U)
(declare-fun Mask@39 () T@U)
(declare-fun Mask@38 () T@U)
(declare-fun Mask@37 () T@U)
(declare-fun Mask@36 () T@U)
(declare-fun Mask@35 () T@U)
(declare-fun Mask@34 () T@U)
(declare-fun Heap@@41 () T@U)
(declare-fun vwand () T@U)
(declare-fun __flatten_9 () T@U)
(declare-fun __flatten_11 () T@U)
(declare-fun __flatten_14 () T@U)
(declare-fun __flatten_16 () T@U)
(declare-fun __flatten_17 () T@U)
(declare-fun __flatten_18 () T@U)
(declare-fun __flatten_19 () T@U)
(declare-fun __flatten_21 () T@U)
(declare-fun __flatten_23 () T@U)
(declare-fun __flatten_55 () T@U)
(declare-fun __flatten_58 () T@U)
(declare-fun __flatten_60 () T@U)
(declare-fun __flatten_61 () T@U)
(declare-fun __flatten_62 () T@U)
(declare-fun __flatten_63 () T@U)
(declare-fun __flatten_65 () T@U)
(declare-fun current_thread_id () Int)
(declare-fun Mask@6 () T@U)
(declare-fun Mask@7 () T@U)
(declare-fun Mask@8 () T@U)
(declare-fun Mask@9 () T@U)
(declare-fun Mask@10 () T@U)
(declare-fun Mask@11 () T@U)
(declare-fun Mask@12 () T@U)
(declare-fun Mask@13 () T@U)
(declare-fun Mask@14 () T@U)
(declare-fun Mask@15 () T@U)
(declare-fun Mask@16 () T@U)
(declare-fun Mask@17 () T@U)
(declare-fun Mask@18 () T@U)
(declare-fun Mask@19 () T@U)
(declare-fun Mask@20 () T@U)
(declare-fun Mask@21 () T@U)
(declare-fun Heap@0 () T@U)
(declare-fun Heap@1 () T@U)
(declare-fun this_1 () T@U)
(declare-fun Heap@2 () T@U)
(declare-fun target_contents_1 () T@U)
(declare-fun Heap@3 () T@U)
(declare-fun prev_contents_1 () T@U)
(declare-fun Heap@4 () T@U)
(declare-fun prev_1 () T@U)
(declare-fun Heap@5 () T@U)
(declare-fun cur_contents_1 () T@U)
(declare-fun Heap@6 () T@U)
(declare-fun top_1 () T@U)
(declare-fun Heap@7 () T@U)
(declare-fun cur_1 () T@U)
(declare-fun Heap@8 () T@U)
(declare-fun Heap@9 () T@U)
(declare-fun Heap@10 () T@U)
(declare-fun Heap@11 () T@U)
(declare-fun wildcard@0 () Real)
(declare-fun Mask@22 () T@U)
(declare-fun wildcard@1 () Real)
(declare-fun Mask@23 () T@U)
(declare-fun wildcard@2 () Real)
(declare-fun Mask@24 () T@U)
(declare-fun wildcard@3 () Real)
(declare-fun Mask@25 () T@U)
(declare-fun wildcard@4 () Real)
(declare-fun Mask@26 () T@U)
(declare-fun wildcard@5 () Real)
(declare-fun Mask@27 () T@U)
(declare-fun wildcard@6 () Real)
(declare-fun Mask@28 () T@U)
(declare-fun wildcard@7 () Real)
(declare-fun Mask@29 () T@U)
(declare-fun wildcard@8 () Real)
(declare-fun Mask@30 () T@U)
(declare-fun wildcard@9 () Real)
(declare-fun Mask@31 () T@U)
(declare-fun wildcard@10 () Real)
(declare-fun Mask@32 () T@U)
(declare-fun wildcard@11 () Real)
(declare-fun Mask@33 () T@U)
(declare-fun wildcard@12 () Real)
(declare-fun Mask@4 () T@U)
(declare-fun Mask@50 () T@U)
(declare-fun Mask@51 () T@U)
(declare-fun Mask@2 () T@U)
(declare-fun Mask@3 () T@U)
(declare-fun diz@@29 () T@U)
(declare-fun Mask@0 () T@U)
(declare-fun Mask@1 () T@U)
(declare-fun wildcard () Real)
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (= (type Heap@@41) (MapType0Type RefType)) (= (type prev_1) RefType)) (= (type Mask@51) (MapType1Type RefType realType))) (= (type Mask@4) (MapType1Type RefType realType))) (= (type Mask@50) (MapType1Type RefType realType))) (= (type Heap@38) (MapType0Type RefType))) (= (type __flatten_9@0) RefType)) (= (type out_1_0) (SeqType intType))) (= (type Mask@45) (MapType1Type RefType realType))) (= (type out_1) RefType)) (= (type in_1_0) (SeqType intType))) (= (type in_1) RefType)) (= (type AssertMask@0) (MapType1Type RefType realType))) (= (type Heap@36) (MapType0Type RefType))) (= (type Heap@35) (MapType0Type RefType))) (= (type Heap@37) (MapType0Type RefType))) (= (type Heap@28) (MapType0Type RefType))) (= (type newPMask@1) (MapType1Type RefType boolType))) (= (type Heap@33) (MapType0Type RefType))) (= (type Heap@34) (MapType0Type RefType))) (= (type Heap@31) (MapType0Type RefType))) (= (type newPMask@0) (MapType1Type RefType boolType))) (= (type Heap@32) (MapType0Type RefType))) (= (type Heap@29) (MapType0Type RefType))) (= (type Heap@30) (MapType0Type RefType))) (= (type Heap@16) (MapType0Type RefType))) (= (type Heap@15) (MapType0Type RefType))) (= (type Heap@17) (MapType0Type RefType))) (= (type Heap@18) (MapType0Type RefType))) (= (type Heap@19) (MapType0Type RefType))) (= (type Heap@20) (MapType0Type RefType))) (= (type Heap@21) (MapType0Type RefType))) (= (type Heap@22) (MapType0Type RefType))) (= (type Heap@23) (MapType0Type RefType))) (= (type Heap@24) (MapType0Type RefType))) (= (type Heap@25) (MapType0Type RefType))) (= (type Heap@26) (MapType0Type RefType))) (= (type Heap@27) (MapType0Type RefType))) (= (type Heap@13) (MapType0Type RefType))) (= (type Heap@12) (MapType0Type RefType))) (= (type Heap@14) (MapType0Type RefType))) (= (type freshVersion@0) FrameTypeType)) (= (type Mask@44) (MapType1Type RefType realType))) (forall ((arg0@@60 T@U) (arg1@@31 T@U) ) (! (= (type (CombineFrames arg0@@60 arg1@@31)) FrameTypeType)
 :qid |funType:CombineFrames|
 :pattern ( (CombineFrames arg0@@60 arg1@@31))
))) (= (type Mask@41) (MapType1Type RefType realType))) (= (type Mask@42) (MapType1Type RefType realType))) (= (type Mask@43) (MapType1Type RefType realType))) (= (type Mask@34) (MapType1Type RefType realType))) (= (type Mask@40) (MapType1Type RefType realType))) (= (type Mask@39) (MapType1Type RefType realType))) (= (type Mask@37) (MapType1Type RefType realType))) (= (type Mask@38) (MapType1Type RefType realType))) (= (type Mask@36) (MapType1Type RefType realType))) (= (type Mask@35) (MapType1Type RefType realType))) (= (type vwand) RefType)) (= (type __flatten_9) RefType)) (= (type __flatten_11) RefType)) (= (type __flatten_14) RefType)) (= (type __flatten_16) RefType)) (= (type __flatten_17) RefType)) (= (type __flatten_18) RefType)) (= (type __flatten_19) RefType)) (= (type __flatten_21) RefType)) (= (type __flatten_23) RefType)) (= (type __flatten_55) RefType)) (= (type __flatten_58) RefType)) (= (type __flatten_60) RefType)) (= (type __flatten_61) RefType)) (= (type __flatten_62) RefType)) (= (type __flatten_63) RefType)) (= (type __flatten_65) RefType)) (= (type Mask@6) (MapType1Type RefType realType))) (= (type Mask@5) (MapType1Type RefType realType))) (= (type Mask@7) (MapType1Type RefType realType))) (= (type Mask@8) (MapType1Type RefType realType))) (= (type Mask@9) (MapType1Type RefType realType))) (= (type Mask@10) (MapType1Type RefType realType))) (= (type Mask@11) (MapType1Type RefType realType))) (= (type Mask@12) (MapType1Type RefType realType))) (= (type Mask@13) (MapType1Type RefType realType))) (= (type Mask@14) (MapType1Type RefType realType))) (= (type Mask@15) (MapType1Type RefType realType))) (= (type Mask@16) (MapType1Type RefType realType))) (= (type Mask@17) (MapType1Type RefType realType))) (= (type Mask@18) (MapType1Type RefType realType))) (= (type Mask@19) (MapType1Type RefType realType))) (= (type Mask@20) (MapType1Type RefType realType))) (= (type Mask@21) (MapType1Type RefType realType))) (= (type Heap@0) (MapType0Type RefType))) (= (type Heap@1) (MapType0Type RefType))) (= (type this_1) RefType)) (= (type Heap@2) (MapType0Type RefType))) (= (type target_contents_1) (SeqType intType))) (= (type Heap@3) (MapType0Type RefType))) (= (type prev_contents_1) (SeqType intType))) (= (type Heap@4) (MapType0Type RefType))) (= (type Heap@5) (MapType0Type RefType))) (= (type cur_contents_1) (SeqType intType))) (= (type Heap@6) (MapType0Type RefType))) (= (type top_1) RefType)) (= (type Heap@7) (MapType0Type RefType))) (= (type cur_1) RefType)) (= (type Heap@8) (MapType0Type RefType))) (= (type wand_1) RefType)) (= (type Heap@9) (MapType0Type RefType))) (= (type Heap@10) (MapType0Type RefType))) (= (type Heap@11) (MapType0Type RefType))) (= (type Mask@22) (MapType1Type RefType realType))) (= (type Mask@23) (MapType1Type RefType realType))) (= (type Mask@24) (MapType1Type RefType realType))) (= (type Mask@25) (MapType1Type RefType realType))) (= (type Mask@26) (MapType1Type RefType realType))) (= (type Mask@27) (MapType1Type RefType realType))) (= (type Mask@28) (MapType1Type RefType realType))) (= (type Mask@29) (MapType1Type RefType realType))) (= (type Mask@30) (MapType1Type RefType realType))) (= (type Mask@31) (MapType1Type RefType realType))) (= (type Mask@32) (MapType1Type RefType realType))) (= (type Mask@33) (MapType1Type RefType realType))) (= (type PostMask@0) (MapType1Type RefType realType))) (= (type sys__result) RefType)) (= (type PostHeap@0) (MapType0Type RefType))) (= (type Mask@2) (MapType1Type RefType realType))) (= (type Mask@3) (MapType1Type RefType realType))) (= (type diz@@29) RefType)) (= (type Mask@0) (MapType1Type RefType realType))) (= (type Mask@1) (MapType1Type RefType realType))))
(set-info :boogie-vc-id Tree__Wand_state_contains_for_state_contains_lemma_1)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 205) (let ((anon11_correct true))
(let ((anon90_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 192) 189)) anon11_correct)))
(let ((anon90_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 190) (- 0 191)) (<= FullPerm (U_2_real (MapType1Select Mask@5 null (Wand_state_contains_for_state_contains__valid_wand wand_1))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@5 null (Wand_state_contains_for_state_contains__valid_wand wand_1)))) (=> (= (ControlFlow 0 190) 189) anon11_correct))))))
(let ((anon89_Then_correct  (and (=> (= (ControlFlow 0 193) (- 0 194)) (not (= wand_1 null))) (=> (not (= wand_1 null)) (and (=> (= (ControlFlow 0 193) 190) anon90_Then_correct) (=> (= (ControlFlow 0 193) 192) anon90_Else_correct))))))
(let ((anon15_correct true))
(let ((anon92_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 185) 182)) anon15_correct)))
(let ((anon92_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 183) (- 0 184)) (<= FullPerm (U_2_real (MapType1Select Mask@5 null (Wand_state_contains_for_state_contains__valid_wand wand_1))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@5 null (Wand_state_contains_for_state_contains__valid_wand wand_1)))) (=> (= (ControlFlow 0 183) 182) anon15_correct))))))
(let ((anon91_Then_correct  (and (=> (= (ControlFlow 0 186) (- 0 187)) (not (= wand_1 null))) (=> (not (= wand_1 null)) (and (=> (= (ControlFlow 0 186) 183) anon92_Then_correct) (=> (= (ControlFlow 0 186) 185) anon92_Else_correct))))))
(let ((anon19_correct true))
(let ((anon94_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 178) 175)) anon19_correct)))
(let ((anon94_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 176) (- 0 177)) (<= FullPerm (U_2_real (MapType1Select Mask@5 null (Wand_state_contains_for_state_contains__valid_wand wand_1))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@5 null (Wand_state_contains_for_state_contains__valid_wand wand_1)))) (=> (= (ControlFlow 0 176) 175) anon19_correct))))))
(let ((anon93_Then_correct  (and (=> (= (ControlFlow 0 179) (- 0 180)) (not (= wand_1 null))) (=> (not (= wand_1 null)) (and (=> (= (ControlFlow 0 179) 176) anon94_Then_correct) (=> (= (ControlFlow 0 179) 178) anon94_Else_correct))))))
(let ((anon23_correct true))
(let ((anon96_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 171) 168)) anon23_correct)))
(let ((anon96_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 169) (- 0 170)) (<= FullPerm (U_2_real (MapType1Select Mask@5 null (Wand_state_contains_for_state_contains__valid_wand wand_1))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@5 null (Wand_state_contains_for_state_contains__valid_wand wand_1)))) (=> (= (ControlFlow 0 169) 168) anon23_correct))))))
(let ((anon95_Then_correct  (and (=> (= (ControlFlow 0 172) (- 0 173)) (not (= wand_1 null))) (=> (not (= wand_1 null)) (and (=> (= (ControlFlow 0 172) 169) anon96_Then_correct) (=> (= (ControlFlow 0 172) 171) anon96_Else_correct))))))
(let ((anon28_correct true))
(let ((anon99_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 163) 160)) anon28_correct)))
(let ((anon99_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 161) (- 0 162)) (<= FullPerm (U_2_real (MapType1Select PostMask@0 null (Wand_state_contains_for_state_contains__valid_wand sys__result))))) (=> (<= FullPerm (U_2_real (MapType1Select PostMask@0 null (Wand_state_contains_for_state_contains__valid_wand sys__result)))) (=> (= (ControlFlow 0 161) 160) anon28_correct))))))
(let ((anon98_Then_correct  (and (=> (= (ControlFlow 0 164) (- 0 165)) (not (= sys__result null))) (=> (not (= sys__result null)) (and (=> (= (ControlFlow 0 164) 161) anon99_Then_correct) (=> (= (ControlFlow 0 164) 163) anon99_Else_correct))))))
(let ((anon32_correct true))
(let ((anon101_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 156) 153)) anon32_correct)))
(let ((anon101_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 154) (- 0 155)) (<= FullPerm (U_2_real (MapType1Select PostMask@0 null (Wand_state_contains_for_state_contains__valid_wand sys__result))))) (=> (<= FullPerm (U_2_real (MapType1Select PostMask@0 null (Wand_state_contains_for_state_contains__valid_wand sys__result)))) (=> (= (ControlFlow 0 154) 153) anon32_correct))))))
(let ((anon100_Then_correct  (and (=> (= (ControlFlow 0 157) (- 0 158)) (not (= sys__result null))) (=> (not (= sys__result null)) (and (=> (= (ControlFlow 0 157) 154) anon101_Then_correct) (=> (= (ControlFlow 0 157) 156) anon101_Else_correct))))))
(let ((anon36_correct true))
(let ((anon103_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 149) 146)) anon36_correct)))
(let ((anon103_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 147) (- 0 148)) (<= FullPerm (U_2_real (MapType1Select PostMask@0 null (Wand_state_contains_for_state_contains__valid_wand sys__result))))) (=> (<= FullPerm (U_2_real (MapType1Select PostMask@0 null (Wand_state_contains_for_state_contains__valid_wand sys__result)))) (=> (= (ControlFlow 0 147) 146) anon36_correct))))))
(let ((anon102_Then_correct  (and (=> (= (ControlFlow 0 150) (- 0 151)) (not (= sys__result null))) (=> (not (= sys__result null)) (and (=> (= (ControlFlow 0 150) 147) anon103_Then_correct) (=> (= (ControlFlow 0 150) 149) anon103_Else_correct))))))
(let ((anon40_correct true))
(let ((anon105_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 142) 139)) anon40_correct)))
(let ((anon105_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 140) (- 0 141)) (<= FullPerm (U_2_real (MapType1Select PostMask@0 null (Wand_state_contains_for_state_contains__valid_wand sys__result))))) (=> (<= FullPerm (U_2_real (MapType1Select PostMask@0 null (Wand_state_contains_for_state_contains__valid_wand sys__result)))) (=> (= (ControlFlow 0 140) 139) anon40_correct))))))
(let ((anon104_Then_correct  (and (=> (= (ControlFlow 0 143) (- 0 144)) (not (= sys__result null))) (=> (not (= sys__result null)) (and (=> (= (ControlFlow 0 143) 140) anon105_Then_correct) (=> (= (ControlFlow 0 143) 142) anon105_Else_correct))))))
(let ((anon104_Else_correct true))
(let ((anon102_Else_correct  (=> (= (Wand_state_contains_for_state_contains__get_out_1 PostHeap@0 sys__result) out_1) (=> (and (state PostHeap@0 PostMask@0) (state PostHeap@0 PostMask@0)) (and (=> (= (ControlFlow 0 145) 143) anon104_Then_correct) (=> (= (ControlFlow 0 145) 138) anon104_Else_correct))))))
(let ((anon100_Else_correct  (=> (|Seq#Equal| (Wand_state_contains_for_state_contains__get_in_1_0 PostHeap@0 sys__result) in_1_0) (=> (and (state PostHeap@0 PostMask@0) (state PostHeap@0 PostMask@0)) (and (=> (= (ControlFlow 0 152) 150) anon102_Then_correct) (=> (= (ControlFlow 0 152) 145) anon102_Else_correct))))))
(let ((anon98_Else_correct  (=> (= (Wand_state_contains_for_state_contains__get_in_1 PostHeap@0 sys__result) in_1) (=> (and (state PostHeap@0 PostMask@0) (state PostHeap@0 PostMask@0)) (and (=> (= (ControlFlow 0 159) 157) anon100_Then_correct) (=> (= (ControlFlow 0 159) 152) anon100_Else_correct))))))
(let ((anon97_Then_correct  (=> (state PostHeap@0 ZeroMask) (=> (and (not (= sys__result null)) (state PostHeap@0 ZeroMask)) (=> (and (and (= PostMask@0 (MapType1Store ZeroMask null (Wand_state_contains_for_state_contains__valid_wand sys__result) (real_2_U (+ (U_2_real (MapType1Select ZeroMask null (Wand_state_contains_for_state_contains__valid_wand sys__result))) FullPerm)))) (state PostHeap@0 PostMask@0)) (and (state PostHeap@0 PostMask@0) (state PostHeap@0 PostMask@0))) (and (=> (= (ControlFlow 0 166) 164) anon98_Then_correct) (=> (= (ControlFlow 0 166) 159) anon98_Else_correct)))))))
(let ((anon69_correct true))
(let ((anon119_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 38) 35)) anon69_correct)))
(let ((anon119_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 36) (- 0 37)) (<= FullPerm (U_2_real (MapType1Select Mask@45 null (Wand_state_contains_for_state_contains__valid_wand __flatten_9@0))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@45 null (Wand_state_contains_for_state_contains__valid_wand __flatten_9@0)))) (=> (= (ControlFlow 0 36) 35) anon69_correct))))))
(let ((anon118_Then_correct  (and (=> (= (ControlFlow 0 39) (- 0 40)) (not (= __flatten_9@0 null))) (=> (not (= __flatten_9@0 null)) (and (=> (= (ControlFlow 0 39) 36) anon119_Then_correct) (=> (= (ControlFlow 0 39) 38) anon119_Else_correct))))))
(let ((anon73_correct true))
(let ((anon121_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 30) 27)) anon73_correct)))
(let ((anon121_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 28) (- 0 29)) (<= FullPerm (U_2_real (MapType1Select Mask@45 null (Wand_state_contains_for_state_contains__valid_wand __flatten_9@0))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@45 null (Wand_state_contains_for_state_contains__valid_wand __flatten_9@0)))) (=> (= (ControlFlow 0 28) 27) anon73_correct))))))
(let ((anon120_Then_correct  (and (=> (= (ControlFlow 0 31) (- 0 32)) (not (= __flatten_9@0 null))) (=> (not (= __flatten_9@0 null)) (and (=> (= (ControlFlow 0 31) 28) anon121_Then_correct) (=> (= (ControlFlow 0 31) 30) anon121_Else_correct))))))
(let ((anon77_correct true))
(let ((anon123_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 22) 19)) anon77_correct)))
(let ((anon123_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 20) (- 0 21)) (<= FullPerm (U_2_real (MapType1Select Mask@45 null (Wand_state_contains_for_state_contains__valid_wand __flatten_9@0))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@45 null (Wand_state_contains_for_state_contains__valid_wand __flatten_9@0)))) (=> (= (ControlFlow 0 20) 19) anon77_correct))))))
(let ((anon122_Then_correct  (and (=> (= (ControlFlow 0 23) (- 0 24)) (not (= __flatten_9@0 null))) (=> (not (= __flatten_9@0 null)) (and (=> (= (ControlFlow 0 23) 20) anon123_Then_correct) (=> (= (ControlFlow 0 23) 22) anon123_Else_correct))))))
(let ((anon81_correct true))
(let ((anon125_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 14) 11)) anon81_correct)))
(let ((anon125_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 12) (- 0 13)) (<= FullPerm (U_2_real (MapType1Select Mask@45 null (Wand_state_contains_for_state_contains__valid_wand __flatten_9@0))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@45 null (Wand_state_contains_for_state_contains__valid_wand __flatten_9@0)))) (=> (= (ControlFlow 0 12) 11) anon81_correct))))))
(let ((anon124_Then_correct  (and (=> (= (ControlFlow 0 15) (- 0 16)) (not (= __flatten_9@0 null))) (=> (not (= __flatten_9@0 null)) (and (=> (= (ControlFlow 0 15) 12) anon125_Then_correct) (=> (= (ControlFlow 0 15) 14) anon125_Else_correct))))))
(let ((anon124_Else_correct  (=> (= (ControlFlow 0 9) (- 0 10)) (|Seq#Equal| (Wand_state_contains_for_state_contains__get_out_1_0 Heap@38 __flatten_9@0) out_1_0))))
(let ((anon122_Else_correct  (and (=> (= (ControlFlow 0 17) (- 0 18)) (= (Wand_state_contains_for_state_contains__get_out_1 Heap@38 __flatten_9@0) out_1)) (=> (= (Wand_state_contains_for_state_contains__get_out_1 Heap@38 __flatten_9@0) out_1) (and (=> (= (ControlFlow 0 17) 15) anon124_Then_correct) (=> (= (ControlFlow 0 17) 9) anon124_Else_correct))))))
(let ((anon120_Else_correct  (and (=> (= (ControlFlow 0 25) (- 0 26)) (|Seq#Equal| (Wand_state_contains_for_state_contains__get_in_1_0 Heap@38 __flatten_9@0) in_1_0)) (=> (|Seq#Equal| (Wand_state_contains_for_state_contains__get_in_1_0 Heap@38 __flatten_9@0) in_1_0) (and (=> (= (ControlFlow 0 25) 23) anon122_Then_correct) (=> (= (ControlFlow 0 25) 17) anon122_Else_correct))))))
(let ((anon118_Else_correct  (and (=> (= (ControlFlow 0 33) (- 0 34)) (= (Wand_state_contains_for_state_contains__get_in_1 Heap@38 __flatten_9@0) in_1)) (=> (= (Wand_state_contains_for_state_contains__get_in_1 Heap@38 __flatten_9@0) in_1) (and (=> (= (ControlFlow 0 33) 31) anon120_Then_correct) (=> (= (ControlFlow 0 33) 25) anon120_Else_correct))))))
(let ((anon66_correct  (=> (= AssertMask@0 (MapType1Store Mask@45 null (Wand_state_contains_for_state_contains__valid_wand __flatten_9@0) (real_2_U (- (U_2_real (MapType1Select Mask@45 null (Wand_state_contains_for_state_contains__valid_wand __flatten_9@0))) FullPerm)))) (and (=> (= (ControlFlow 0 41) 39) anon118_Then_correct) (=> (= (ControlFlow 0 41) 33) anon118_Else_correct)))))
(let ((anon117_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 44) 41)) anon66_correct)))
(let ((anon117_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 42) (- 0 43)) (<= FullPerm (U_2_real (MapType1Select Mask@45 null (Wand_state_contains_for_state_contains__valid_wand __flatten_9@0))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@45 null (Wand_state_contains_for_state_contains__valid_wand __flatten_9@0)))) (=> (= (ControlFlow 0 42) 41) anon66_correct))))))
(let ((anon64_correct  (=> (= Heap@36 (MapType0Store Heap@35 null (|Wand_state_contains_for_state_contains__valid_wand#sm| __flatten_9@0) (MapType1Store (MapType0Select Heap@35 null (|Wand_state_contains_for_state_contains__valid_wand#sm| __flatten_9@0)) __flatten_9@0 Wand_state_contains_for_state_contains__this_2 (bool_2_U true)))) (=> (and (= Heap@37 (MapType0Store Heap@36 null (|Wand_state_contains_for_state_contains__valid_wand#sm| __flatten_9@0) (MapType1Store (MapType0Select Heap@36 null (|Wand_state_contains_for_state_contains__valid_wand#sm| __flatten_9@0)) __flatten_9@0 Wand_state_contains_for_state_contains__target_contents_2 (bool_2_U true)))) (= Heap@38 (MapType0Store Heap@37 null (|Wand_state_contains_for_state_contains__valid_wand#sm| __flatten_9@0) (MapType1Store (MapType0Select Heap@37 null (|Wand_state_contains_for_state_contains__valid_wand#sm| __flatten_9@0)) __flatten_9@0 Wand_state_contains_for_state_contains__top_2 (bool_2_U true))))) (=> (and (and (state Heap@38 Mask@45) (state Heap@38 Mask@45)) (and (state Heap@38 Mask@45) (state Heap@38 Mask@45))) (and (=> (= (ControlFlow 0 45) (- 0 46)) (not (= __flatten_9@0 null))) (=> (not (= __flatten_9@0 null)) (and (=> (= (ControlFlow 0 45) 42) anon117_Then_correct) (=> (= (ControlFlow 0 45) 44) anon117_Else_correct)))))))))
(let ((anon63_correct  (=> (and (and (forall ((o_16 T@U) (f_20 T@U) ) (! (let ((B@@11 (FieldTypeInv1 (type f_20))))
(let ((A@@12 (FieldTypeInv0 (type f_20))))
 (=> (and (and (= (type o_16) RefType) (= (type f_20) (FieldType A@@12 B@@11))) (or (U_2_bool (MapType1Select (MapType0Select Heap@33 null (|Wand_state_contains_for_state_contains__valid_wand#sm| __flatten_9@0)) o_16 f_20)) (U_2_bool (MapType1Select (MapType0Select Heap@33 null (|Wand_state_contains_for_state_contains__valid_wand#sm| (MapType0Select Heap@33 __flatten_9@0 Wand_state_contains_for_state_contains__wand_1))) o_16 f_20)))) (U_2_bool (MapType1Select newPMask@1 o_16 f_20)))))
 :qid |stdinbpl.5018:29|
 :skolemid |115|
 :pattern ( (MapType1Select newPMask@1 o_16 f_20))
)) (= Heap@34 (MapType0Store Heap@33 null (|Wand_state_contains_for_state_contains__valid_wand#sm| __flatten_9@0) newPMask@1))) (and (= Heap@35 Heap@34) (= (ControlFlow 0 48) 45))) anon64_correct)))
(let ((anon116_Else_correct  (=> (= (MapType0Select Heap@31 (MapType0Select Heap@31 __flatten_9@0 Wand_state_contains_for_state_contains__prev_1) Tree__right) null) (=> (and (= Heap@33 Heap@31) (= (ControlFlow 0 50) 48)) anon63_correct))))
(let ((anon116_Then_correct  (=> (not (= (MapType0Select Heap@31 (MapType0Select Heap@31 __flatten_9@0 Wand_state_contains_for_state_contains__prev_1) Tree__right) null)) (=> (and (and (forall ((o_15 T@U) (f_19 T@U) ) (! (let ((B@@12 (FieldTypeInv1 (type f_19))))
(let ((A@@13 (FieldTypeInv0 (type f_19))))
 (=> (and (and (= (type o_15) RefType) (= (type f_19) (FieldType A@@13 B@@12))) (or (U_2_bool (MapType1Select (MapType0Select Heap@31 null (|Wand_state_contains_for_state_contains__valid_wand#sm| __flatten_9@0)) o_15 f_19)) (U_2_bool (MapType1Select (MapType0Select Heap@31 null (|Tree__state#sm| (MapType0Select Heap@31 (MapType0Select Heap@31 __flatten_9@0 Wand_state_contains_for_state_contains__prev_1) Tree__right))) o_15 f_19)))) (U_2_bool (MapType1Select newPMask@0 o_15 f_19)))))
 :qid |stdinbpl.5011:31|
 :skolemid |114|
 :pattern ( (MapType1Select newPMask@0 o_15 f_19))
)) (= Heap@32 (MapType0Store Heap@31 null (|Wand_state_contains_for_state_contains__valid_wand#sm| __flatten_9@0) newPMask@0))) (and (= Heap@33 Heap@32) (= (ControlFlow 0 49) 48))) anon63_correct))))
(let ((anon115_Then_correct  (=> (and (and (= (U_2_int (MapType0Select Heap@28 __flatten_9@0 Wand_state_contains_for_state_contains__lemma)) 1) (= Heap@29 (MapType0Store Heap@28 null (|Wand_state_contains_for_state_contains__valid_wand#sm| __flatten_9@0) (MapType1Store (MapType0Select Heap@28 null (|Wand_state_contains_for_state_contains__valid_wand#sm| __flatten_9@0)) (MapType0Select Heap@28 __flatten_9@0 Wand_state_contains_for_state_contains__prev_1) Tree__left (bool_2_U true))))) (and (= Heap@30 (MapType0Store Heap@29 null (|Wand_state_contains_for_state_contains__valid_wand#sm| __flatten_9@0) (MapType1Store (MapType0Select Heap@29 null (|Wand_state_contains_for_state_contains__valid_wand#sm| __flatten_9@0)) (MapType0Select Heap@29 __flatten_9@0 Wand_state_contains_for_state_contains__prev_1) Tree__data (bool_2_U true)))) (= Heap@31 (MapType0Store Heap@30 null (|Wand_state_contains_for_state_contains__valid_wand#sm| __flatten_9@0) (MapType1Store (MapType0Select Heap@30 null (|Wand_state_contains_for_state_contains__valid_wand#sm| __flatten_9@0)) (MapType0Select Heap@30 __flatten_9@0 Wand_state_contains_for_state_contains__prev_1) Tree__right (bool_2_U true)))))) (and (=> (= (ControlFlow 0 51) 49) anon116_Then_correct) (=> (= (ControlFlow 0 51) 50) anon116_Else_correct)))))
(let ((anon115_Else_correct  (=> (not (= (U_2_int (MapType0Select Heap@28 __flatten_9@0 Wand_state_contains_for_state_contains__lemma)) 1)) (=> (and (= Heap@35 Heap@28) (= (ControlFlow 0 47) 45)) anon64_correct))))
(let ((anon60_correct  (=> (= Heap@16 (MapType0Store Heap@15 null (|Wand_state_contains_for_state_contains__valid_wand#sm| __flatten_9@0) (MapType1Store (MapType0Select Heap@15 null (|Wand_state_contains_for_state_contains__valid_wand#sm| __flatten_9@0)) __flatten_9@0 Wand_state_contains_for_state_contains__lemma (bool_2_U true)))) (=> (and (and (= Heap@17 (MapType0Store Heap@16 null (|Wand_state_contains_for_state_contains__valid_wand#sm| __flatten_9@0) (MapType1Store (MapType0Select Heap@16 null (|Wand_state_contains_for_state_contains__valid_wand#sm| __flatten_9@0)) __flatten_9@0 Wand_state_contains_for_state_contains__in_1 (bool_2_U true)))) (= Heap@18 (MapType0Store Heap@17 null (|Wand_state_contains_for_state_contains__valid_wand#sm| __flatten_9@0) (MapType1Store (MapType0Select Heap@17 null (|Wand_state_contains_for_state_contains__valid_wand#sm| __flatten_9@0)) __flatten_9@0 Wand_state_contains_for_state_contains__in_1_0 (bool_2_U true))))) (and (= Heap@19 (MapType0Store Heap@18 null (|Wand_state_contains_for_state_contains__valid_wand#sm| __flatten_9@0) (MapType1Store (MapType0Select Heap@18 null (|Wand_state_contains_for_state_contains__valid_wand#sm| __flatten_9@0)) __flatten_9@0 Wand_state_contains_for_state_contains__out_1 (bool_2_U true)))) (= Heap@20 (MapType0Store Heap@19 null (|Wand_state_contains_for_state_contains__valid_wand#sm| __flatten_9@0) (MapType1Store (MapType0Select Heap@19 null (|Wand_state_contains_for_state_contains__valid_wand#sm| __flatten_9@0)) __flatten_9@0 Wand_state_contains_for_state_contains__out_1_0 (bool_2_U true)))))) (=> (and (and (and (= Heap@21 (MapType0Store Heap@20 null (|Wand_state_contains_for_state_contains__valid_wand#sm| __flatten_9@0) (MapType1Store (MapType0Select Heap@20 null (|Wand_state_contains_for_state_contains__valid_wand#sm| __flatten_9@0)) __flatten_9@0 Wand_state_contains_for_state_contains__this_1 (bool_2_U true)))) (= Heap@22 (MapType0Store Heap@21 null (|Wand_state_contains_for_state_contains__valid_wand#sm| __flatten_9@0) (MapType1Store (MapType0Select Heap@21 null (|Wand_state_contains_for_state_contains__valid_wand#sm| __flatten_9@0)) __flatten_9@0 Wand_state_contains_for_state_contains__target_contents_1 (bool_2_U true))))) (and (= Heap@23 (MapType0Store Heap@22 null (|Wand_state_contains_for_state_contains__valid_wand#sm| __flatten_9@0) (MapType1Store (MapType0Select Heap@22 null (|Wand_state_contains_for_state_contains__valid_wand#sm| __flatten_9@0)) __flatten_9@0 Wand_state_contains_for_state_contains__prev_contents_1 (bool_2_U true)))) (= Heap@24 (MapType0Store Heap@23 null (|Wand_state_contains_for_state_contains__valid_wand#sm| __flatten_9@0) (MapType1Store (MapType0Select Heap@23 null (|Wand_state_contains_for_state_contains__valid_wand#sm| __flatten_9@0)) __flatten_9@0 Wand_state_contains_for_state_contains__prev_1 (bool_2_U true)))))) (and (and (= Heap@25 (MapType0Store Heap@24 null (|Wand_state_contains_for_state_contains__valid_wand#sm| __flatten_9@0) (MapType1Store (MapType0Select Heap@24 null (|Wand_state_contains_for_state_contains__valid_wand#sm| __flatten_9@0)) __flatten_9@0 Wand_state_contains_for_state_contains__cur_contents_1 (bool_2_U true)))) (= Heap@26 (MapType0Store Heap@25 null (|Wand_state_contains_for_state_contains__valid_wand#sm| __flatten_9@0) (MapType1Store (MapType0Select Heap@25 null (|Wand_state_contains_for_state_contains__valid_wand#sm| __flatten_9@0)) __flatten_9@0 Wand_state_contains_for_state_contains__top_1 (bool_2_U true))))) (and (= Heap@27 (MapType0Store Heap@26 null (|Wand_state_contains_for_state_contains__valid_wand#sm| __flatten_9@0) (MapType1Store (MapType0Select Heap@26 null (|Wand_state_contains_for_state_contains__valid_wand#sm| __flatten_9@0)) __flatten_9@0 Wand_state_contains_for_state_contains__cur_1 (bool_2_U true)))) (= Heap@28 (MapType0Store Heap@27 null (|Wand_state_contains_for_state_contains__valid_wand#sm| __flatten_9@0) (MapType1Store (MapType0Select Heap@27 null (|Wand_state_contains_for_state_contains__valid_wand#sm| __flatten_9@0)) __flatten_9@0 Wand_state_contains_for_state_contains__wand_1 (bool_2_U true))))))) (and (=> (= (ControlFlow 0 52) 51) anon115_Then_correct) (=> (= (ControlFlow 0 52) 47) anon115_Else_correct)))))))
(let ((anon114_Else_correct  (=> (HasDirectPerm Mask@45 null (Wand_state_contains_for_state_contains__valid_wand __flatten_9@0)) (=> (and (= Heap@15 Heap@12) (= (ControlFlow 0 54) 52)) anon60_correct))))
(let ((anon114_Then_correct  (=> (not (HasDirectPerm Mask@45 null (Wand_state_contains_for_state_contains__valid_wand __flatten_9@0))) (=> (and (and (= Heap@13 (MapType0Store Heap@12 null (|Wand_state_contains_for_state_contains__valid_wand#sm| __flatten_9@0) ZeroPMask)) (= Heap@14 (MapType0Store Heap@13 null (Wand_state_contains_for_state_contains__valid_wand __flatten_9@0) freshVersion@0))) (and (= Heap@15 Heap@14) (= (ControlFlow 0 53) 52))) anon60_correct))))
(let ((anon58_correct  (and (=> (= (ControlFlow 0 55) (- 0 56)) (<= (U_2_int (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__lemma)) 2)) (=> (<= (U_2_int (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__lemma)) 2) (=> (= Mask@45 (MapType1Store Mask@44 null (Wand_state_contains_for_state_contains__valid_wand __flatten_9@0) (real_2_U (+ (U_2_real (MapType1Select Mask@44 null (Wand_state_contains_for_state_contains__valid_wand __flatten_9@0))) FullPerm)))) (=> (and (and (state Heap@12 Mask@45) (state Heap@12 Mask@45)) (and (|Wand_state_contains_for_state_contains__valid_wand#trigger| Heap@12 (Wand_state_contains_for_state_contains__valid_wand __flatten_9@0)) (= (MapType0Select Heap@12 null (Wand_state_contains_for_state_contains__valid_wand __flatten_9@0)) (CombineFrames (FrameFragment (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__lemma)) (CombineFrames (FrameFragment (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__in_1)) (CombineFrames (FrameFragment (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__in_1_0)) (CombineFrames (FrameFragment (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__out_1)) (CombineFrames (FrameFragment (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__out_1_0)) (CombineFrames (FrameFragment (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__this_1)) (CombineFrames (FrameFragment (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__target_contents_1)) (CombineFrames (FrameFragment (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__prev_contents_1)) (CombineFrames (FrameFragment (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__prev_1)) (CombineFrames (FrameFragment (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__cur_contents_1)) (CombineFrames (FrameFragment (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__top_1)) (CombineFrames (FrameFragment (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__cur_1)) (CombineFrames (FrameFragment (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__wand_1)) (CombineFrames (FrameFragment (ite (= (U_2_int (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__lemma)) 1) (CombineFrames (CombineFrames (FrameFragment (MapType0Select Heap@12 (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__prev_1) Tree__left)) (FrameFragment (MapType0Select Heap@12 (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__prev_1) Tree__data))) (CombineFrames (CombineFrames (FrameFragment (MapType0Select Heap@12 (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__prev_1) Tree__right)) (FrameFragment (ite (not (= (MapType0Select Heap@12 (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__prev_1) Tree__right) null)) (MapType0Select Heap@12 null (Tree__state (MapType0Select Heap@12 (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__prev_1) Tree__right))) EmptyFrame))) (MapType0Select Heap@12 null (Wand_state_contains_for_state_contains__valid_wand (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__wand_1))))) EmptyFrame)) (CombineFrames (FrameFragment (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__this_2)) (CombineFrames (FrameFragment (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__target_contents_2)) (CombineFrames (FrameFragment (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__top_2)) (FrameFragment (ite (= (U_2_int (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__lemma)) 2) EmptyFrame EmptyFrame)))))))))))))))))))))) (and (=> (= (ControlFlow 0 55) 53) anon114_Then_correct) (=> (= (ControlFlow 0 55) 54) anon114_Else_correct))))))))
(let ((anon113_Else_correct  (=> (and (not (= (U_2_int (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__lemma)) 2)) (= (ControlFlow 0 63) 55)) anon58_correct)))
(let ((anon113_Then_correct  (=> (= (U_2_int (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__lemma)) 2) (and (=> (= (ControlFlow 0 57) (- 0 62)) (not (= (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__this_2) null))) (=> (not (= (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__this_2) null)) (and (=> (= (ControlFlow 0 57) (- 0 61)) (= (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__in_1) (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__top_2))) (=> (= (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__in_1) (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__top_2)) (and (=> (= (ControlFlow 0 57) (- 0 60)) (|Seq#Equal| (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__in_1_0) (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__target_contents_2))) (=> (|Seq#Equal| (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__in_1_0) (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__target_contents_2)) (and (=> (= (ControlFlow 0 57) (- 0 59)) (= (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__out_1) (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__top_2))) (=> (= (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__out_1) (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__top_2)) (and (=> (= (ControlFlow 0 57) (- 0 58)) (|Seq#Equal| (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__out_1_0) (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__target_contents_2))) (=> (|Seq#Equal| (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__out_1_0) (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__target_contents_2)) (=> (= (ControlFlow 0 57) 55) anon58_correct))))))))))))))
(let ((anon56_correct  (and (=> (= (ControlFlow 0 64) (- 0 67)) (> (U_2_real (MapType1Select Mask@41 __flatten_9@0 Wand_state_contains_for_state_contains__this_2)) NoPerm)) (=> (> (U_2_real (MapType1Select Mask@41 __flatten_9@0 Wand_state_contains_for_state_contains__this_2)) NoPerm) (=> (> wildcard@13 NoPerm) (=> (and (< wildcard@13 (U_2_real (MapType1Select Mask@41 __flatten_9@0 Wand_state_contains_for_state_contains__this_2))) (= Mask@42 (MapType1Store Mask@41 __flatten_9@0 Wand_state_contains_for_state_contains__this_2 (real_2_U (- (U_2_real (MapType1Select Mask@41 __flatten_9@0 Wand_state_contains_for_state_contains__this_2)) wildcard@13))))) (and (=> (= (ControlFlow 0 64) (- 0 66)) (> (U_2_real (MapType1Select Mask@42 __flatten_9@0 Wand_state_contains_for_state_contains__target_contents_2)) NoPerm)) (=> (> (U_2_real (MapType1Select Mask@42 __flatten_9@0 Wand_state_contains_for_state_contains__target_contents_2)) NoPerm) (=> (> wildcard@14 NoPerm) (=> (and (< wildcard@14 (U_2_real (MapType1Select Mask@42 __flatten_9@0 Wand_state_contains_for_state_contains__target_contents_2))) (= Mask@43 (MapType1Store Mask@42 __flatten_9@0 Wand_state_contains_for_state_contains__target_contents_2 (real_2_U (- (U_2_real (MapType1Select Mask@42 __flatten_9@0 Wand_state_contains_for_state_contains__target_contents_2)) wildcard@14))))) (and (=> (= (ControlFlow 0 64) (- 0 65)) (> (U_2_real (MapType1Select Mask@43 __flatten_9@0 Wand_state_contains_for_state_contains__top_2)) NoPerm)) (=> (> (U_2_real (MapType1Select Mask@43 __flatten_9@0 Wand_state_contains_for_state_contains__top_2)) NoPerm) (=> (> wildcard@15 NoPerm) (=> (and (< wildcard@15 (U_2_real (MapType1Select Mask@43 __flatten_9@0 Wand_state_contains_for_state_contains__top_2))) (= Mask@44 (MapType1Store Mask@43 __flatten_9@0 Wand_state_contains_for_state_contains__top_2 (real_2_U (- (U_2_real (MapType1Select Mask@43 __flatten_9@0 Wand_state_contains_for_state_contains__top_2)) wildcard@15))))) (and (=> (= (ControlFlow 0 64) 57) anon113_Then_correct) (=> (= (ControlFlow 0 64) 63) anon113_Else_correct))))))))))))))))
(let ((anon55_correct  (=> (and (= Mask@40 (MapType1Store Mask@39 null (Wand_state_contains_for_state_contains__valid_wand (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__wand_1)) (real_2_U (- (U_2_real (MapType1Select Mask@39 null (Wand_state_contains_for_state_contains__valid_wand (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__wand_1)))) FullPerm)))) (InsidePredicate (Wand_state_contains_for_state_contains__valid_wand __flatten_9@0) (MapType0Select Heap@12 null (Wand_state_contains_for_state_contains__valid_wand __flatten_9@0)) (Wand_state_contains_for_state_contains__valid_wand (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__wand_1)) (MapType0Select Heap@12 null (Wand_state_contains_for_state_contains__valid_wand (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__wand_1))))) (and (=> (= (ControlFlow 0 69) (- 0 77)) (= (Wand_state_contains_for_state_contains__get_in_1 Heap@12 (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__wand_1)) (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__prev_1))) (=> (= (Wand_state_contains_for_state_contains__get_in_1 Heap@12 (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__wand_1)) (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__prev_1)) (and (=> (= (ControlFlow 0 69) (- 0 76)) (|Seq#Equal| (Wand_state_contains_for_state_contains__get_in_1_0 Heap@12 (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__wand_1)) (|Seq#Drop| (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__prev_contents_1) 1))) (=> (|Seq#Equal| (Wand_state_contains_for_state_contains__get_in_1_0 Heap@12 (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__wand_1)) (|Seq#Drop| (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__prev_contents_1) 1)) (and (=> (= (ControlFlow 0 69) (- 0 75)) (= (Wand_state_contains_for_state_contains__get_out_1 Heap@12 (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__wand_1)) (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__top_1))) (=> (= (Wand_state_contains_for_state_contains__get_out_1 Heap@12 (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__wand_1)) (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__top_1)) (and (=> (= (ControlFlow 0 69) (- 0 74)) (|Seq#Equal| (Wand_state_contains_for_state_contains__get_out_1_0 Heap@12 (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__wand_1)) (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__target_contents_1))) (=> (|Seq#Equal| (Wand_state_contains_for_state_contains__get_out_1_0 Heap@12 (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__wand_1)) (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__target_contents_1)) (and (=> (= (ControlFlow 0 69) (- 0 73)) (= (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__in_1) (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__cur_1))) (=> (= (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__in_1) (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__cur_1)) (and (=> (= (ControlFlow 0 69) (- 0 72)) (|Seq#Equal| (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__in_1_0) (|Seq#Drop| (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__cur_contents_1) 1))) (=> (|Seq#Equal| (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__in_1_0) (|Seq#Drop| (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__cur_contents_1) 1)) (and (=> (= (ControlFlow 0 69) (- 0 71)) (= (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__out_1) (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__top_1))) (=> (= (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__out_1) (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__top_1)) (and (=> (= (ControlFlow 0 69) (- 0 70)) (|Seq#Equal| (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__out_1_0) (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__target_contents_1))) (=> (|Seq#Equal| (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__out_1_0) (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__target_contents_1)) (=> (and (= Mask@41 Mask@40) (= (ControlFlow 0 69) 64)) anon56_correct))))))))))))))))))))
(let ((anon112_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 80) 69)) anon55_correct)))
(let ((anon112_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 78) (- 0 79)) (<= FullPerm (U_2_real (MapType1Select Mask@39 null (Wand_state_contains_for_state_contains__valid_wand (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__wand_1)))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@39 null (Wand_state_contains_for_state_contains__valid_wand (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__wand_1))))) (=> (= (ControlFlow 0 78) 69) anon55_correct))))))
(let ((anon53_correct  (and (=> (= (ControlFlow 0 81) (- 0 84)) (= (MapType0Select Heap@12 (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__prev_1) Tree__left) (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__cur_1))) (=> (= (MapType0Select Heap@12 (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__prev_1) Tree__left) (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__cur_1)) (and (=> (= (ControlFlow 0 81) (- 0 83)) (|Seq#Equal| (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__prev_contents_1) (|Seq#Append| (|Seq#Append| (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__cur_contents_1) (|Seq#Singleton| (MapType0Select Heap@12 (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__prev_1) Tree__data))) (Tree__tolist Heap@12 (MapType0Select Heap@12 (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__prev_1) Tree__right))))) (=> (|Seq#Equal| (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__prev_contents_1) (|Seq#Append| (|Seq#Append| (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__cur_contents_1) (|Seq#Singleton| (MapType0Select Heap@12 (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__prev_1) Tree__data))) (Tree__tolist Heap@12 (MapType0Select Heap@12 (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__prev_1) Tree__right)))) (and (=> (= (ControlFlow 0 81) (- 0 82)) (not (= (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__wand_1) null))) (=> (not (= (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__wand_1) null)) (and (=> (= (ControlFlow 0 81) 78) anon112_Then_correct) (=> (= (ControlFlow 0 81) 80) anon112_Else_correct))))))))))
(let ((anon52_correct  (=> (and (and (= Mask@38 (MapType1Store Mask@37 null (Tree__state (MapType0Select Heap@12 (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__prev_1) Tree__right)) (real_2_U (- (U_2_real (MapType1Select Mask@37 null (Tree__state (MapType0Select Heap@12 (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__prev_1) Tree__right)))) FullPerm)))) (InsidePredicate (Wand_state_contains_for_state_contains__valid_wand __flatten_9@0) (MapType0Select Heap@12 null (Wand_state_contains_for_state_contains__valid_wand __flatten_9@0)) (Tree__state (MapType0Select Heap@12 (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__prev_1) Tree__right)) (MapType0Select Heap@12 null (Tree__state (MapType0Select Heap@12 (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__prev_1) Tree__right))))) (and (= Mask@39 Mask@38) (= (ControlFlow 0 86) 81))) anon53_correct)))
(let ((anon111_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 89) 86)) anon52_correct)))
(let ((anon111_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 87) (- 0 88)) (<= FullPerm (U_2_real (MapType1Select Mask@37 null (Tree__state (MapType0Select Heap@12 (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__prev_1) Tree__right)))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@37 null (Tree__state (MapType0Select Heap@12 (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__prev_1) Tree__right))))) (=> (= (ControlFlow 0 87) 86) anon52_correct))))))
(let ((anon110_Then_correct  (=> (not (= (MapType0Select Heap@12 (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__prev_1) Tree__right) null)) (and (=> (= (ControlFlow 0 90) 87) anon111_Then_correct) (=> (= (ControlFlow 0 90) 89) anon111_Else_correct)))))
(let ((anon110_Else_correct  (=> (= (MapType0Select Heap@12 (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__prev_1) Tree__right) null) (=> (and (= Mask@39 Mask@37) (= (ControlFlow 0 85) 81)) anon53_correct))))
(let ((anon49_correct  (=> (= Mask@37 (MapType1Store Mask@36 (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__prev_1) Tree__right (real_2_U (- (U_2_real (MapType1Select Mask@36 (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__prev_1) Tree__right)) FullPerm)))) (and (=> (= (ControlFlow 0 91) 90) anon110_Then_correct) (=> (= (ControlFlow 0 91) 85) anon110_Else_correct)))))
(let ((anon109_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 94) 91)) anon49_correct)))
(let ((anon109_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 92) (- 0 93)) (<= FullPerm (U_2_real (MapType1Select Mask@36 (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__prev_1) Tree__right)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@36 (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__prev_1) Tree__right))) (=> (= (ControlFlow 0 92) 91) anon49_correct))))))
(let ((anon47_correct  (=> (= Mask@36 (MapType1Store Mask@35 (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__prev_1) Tree__data (real_2_U (- (U_2_real (MapType1Select Mask@35 (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__prev_1) Tree__data)) FullPerm)))) (and (=> (= (ControlFlow 0 95) 92) anon109_Then_correct) (=> (= (ControlFlow 0 95) 94) anon109_Else_correct)))))
(let ((anon108_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 98) 95)) anon47_correct)))
(let ((anon108_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 96) (- 0 97)) (<= FullPerm (U_2_real (MapType1Select Mask@35 (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__prev_1) Tree__data)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@35 (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__prev_1) Tree__data))) (=> (= (ControlFlow 0 96) 95) anon47_correct))))))
(let ((anon45_correct  (=> (= Mask@35 (MapType1Store Mask@34 (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__prev_1) Tree__left (real_2_U (- (U_2_real (MapType1Select Mask@34 (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__prev_1) Tree__left)) FullPerm)))) (and (=> (= (ControlFlow 0 99) 96) anon108_Then_correct) (=> (= (ControlFlow 0 99) 98) anon108_Else_correct)))))
(let ((anon107_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 102) 99)) anon45_correct)))
(let ((anon107_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 100) (- 0 101)) (<= FullPerm (U_2_real (MapType1Select Mask@34 (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__prev_1) Tree__left)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@34 (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__prev_1) Tree__left))) (=> (= (ControlFlow 0 100) 99) anon45_correct))))))
(let ((anon106_Then_correct  (=> (= (U_2_int (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__lemma)) 1) (and (=> (= (ControlFlow 0 103) (- 0 106)) (not (= (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__this_1) null))) (=> (not (= (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__this_1) null)) (and (=> (= (ControlFlow 0 103) (- 0 105)) (> (|Seq#Length| (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__prev_contents_1)) 0)) (=> (> (|Seq#Length| (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__prev_contents_1)) 0) (and (=> (= (ControlFlow 0 103) (- 0 104)) (> (|Seq#Length| (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__cur_contents_1)) 0)) (=> (> (|Seq#Length| (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__cur_contents_1)) 0) (and (=> (= (ControlFlow 0 103) 100) anon107_Then_correct) (=> (= (ControlFlow 0 103) 102) anon107_Else_correct)))))))))))
(let ((anon106_Else_correct  (=> (not (= (U_2_int (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__lemma)) 1)) (=> (and (= Mask@41 Mask@34) (= (ControlFlow 0 68) 64)) anon56_correct))))
(let ((anon97_Else_correct  (=> (U_2_bool (MapType0Select Heap@@41 vwand $allocated)) (=> (and (and (and (and (U_2_bool (MapType0Select Heap@@41 __flatten_9 $allocated)) (U_2_bool (MapType0Select Heap@@41 __flatten_11 $allocated))) (and (U_2_bool (MapType0Select Heap@@41 __flatten_14 $allocated)) (U_2_bool (MapType0Select Heap@@41 __flatten_16 $allocated)))) (and (and (U_2_bool (MapType0Select Heap@@41 __flatten_17 $allocated)) (U_2_bool (MapType0Select Heap@@41 __flatten_18 $allocated))) (and (U_2_bool (MapType0Select Heap@@41 __flatten_19 $allocated)) (U_2_bool (MapType0Select Heap@@41 __flatten_21 $allocated))))) (and (and (and (U_2_bool (MapType0Select Heap@@41 __flatten_23 $allocated)) (U_2_bool (MapType0Select Heap@@41 __flatten_55 $allocated))) (and (U_2_bool (MapType0Select Heap@@41 __flatten_58 $allocated)) (U_2_bool (MapType0Select Heap@@41 __flatten_60 $allocated)))) (and (and (U_2_bool (MapType0Select Heap@@41 __flatten_61 $allocated)) (U_2_bool (MapType0Select Heap@@41 __flatten_62 $allocated))) (and (U_2_bool (MapType0Select Heap@@41 __flatten_63 $allocated)) (U_2_bool (MapType0Select Heap@@41 __flatten_65 $allocated)))))) (and (=> (= (ControlFlow 0 107) (- 0 137)) (>= current_thread_id 0)) (=> (>= current_thread_id 0) (=> (not (= __flatten_9@0 null)) (=> (and (not (= __flatten_9@0 null)) (= Mask@6 (MapType1Store Mask@5 __flatten_9@0 Wand_state_contains_for_state_contains__lemma (real_2_U (+ (U_2_real (MapType1Select Mask@5 __flatten_9@0 Wand_state_contains_for_state_contains__lemma)) FullPerm))))) (=> (and (and (state Heap@@41 Mask@6) (= (U_2_int (MapType0Select Heap@@41 __flatten_9@0 Wand_state_contains_for_state_contains__lemma)) 0)) (and (not (= __flatten_9@0 null)) (= Mask@7 (MapType1Store Mask@6 __flatten_9@0 Wand_state_contains_for_state_contains__in_1 (real_2_U (+ (U_2_real (MapType1Select Mask@6 __flatten_9@0 Wand_state_contains_for_state_contains__in_1)) FullPerm)))))) (=> (and (and (and (and (and (and (state Heap@@41 Mask@7) (= (MapType0Select Heap@@41 __flatten_9@0 Wand_state_contains_for_state_contains__in_1) null)) (and (not (= __flatten_9@0 null)) (= Mask@8 (MapType1Store Mask@7 __flatten_9@0 Wand_state_contains_for_state_contains__in_1_0 (real_2_U (+ (U_2_real (MapType1Select Mask@7 __flatten_9@0 Wand_state_contains_for_state_contains__in_1_0)) FullPerm)))))) (and (and (state Heap@@41 Mask@8) (|Seq#Equal| (MapType0Select Heap@@41 __flatten_9@0 Wand_state_contains_for_state_contains__in_1_0) (|Seq#Empty| intType))) (and (not (= __flatten_9@0 null)) (= Mask@9 (MapType1Store Mask@8 __flatten_9@0 Wand_state_contains_for_state_contains__out_1 (real_2_U (+ (U_2_real (MapType1Select Mask@8 __flatten_9@0 Wand_state_contains_for_state_contains__out_1)) FullPerm))))))) (and (and (and (state Heap@@41 Mask@9) (= (MapType0Select Heap@@41 __flatten_9@0 Wand_state_contains_for_state_contains__out_1) null)) (and (not (= __flatten_9@0 null)) (= Mask@10 (MapType1Store Mask@9 __flatten_9@0 Wand_state_contains_for_state_contains__out_1_0 (real_2_U (+ (U_2_real (MapType1Select Mask@9 __flatten_9@0 Wand_state_contains_for_state_contains__out_1_0)) FullPerm)))))) (and (and (state Heap@@41 Mask@10) (|Seq#Equal| (MapType0Select Heap@@41 __flatten_9@0 Wand_state_contains_for_state_contains__out_1_0) (|Seq#Empty| intType))) (and (not (= __flatten_9@0 null)) (= Mask@11 (MapType1Store Mask@10 __flatten_9@0 Wand_state_contains_for_state_contains__this_1 (real_2_U (+ (U_2_real (MapType1Select Mask@10 __flatten_9@0 Wand_state_contains_for_state_contains__this_1)) FullPerm)))))))) (and (and (and (and (state Heap@@41 Mask@11) (= (MapType0Select Heap@@41 __flatten_9@0 Wand_state_contains_for_state_contains__this_1) null)) (and (not (= __flatten_9@0 null)) (= Mask@12 (MapType1Store Mask@11 __flatten_9@0 Wand_state_contains_for_state_contains__target_contents_1 (real_2_U (+ (U_2_real (MapType1Select Mask@11 __flatten_9@0 Wand_state_contains_for_state_contains__target_contents_1)) FullPerm)))))) (and (and (state Heap@@41 Mask@12) (|Seq#Equal| (MapType0Select Heap@@41 __flatten_9@0 Wand_state_contains_for_state_contains__target_contents_1) (|Seq#Empty| intType))) (and (not (= __flatten_9@0 null)) (= Mask@13 (MapType1Store Mask@12 __flatten_9@0 Wand_state_contains_for_state_contains__prev_contents_1 (real_2_U (+ (U_2_real (MapType1Select Mask@12 __flatten_9@0 Wand_state_contains_for_state_contains__prev_contents_1)) FullPerm))))))) (and (and (and (state Heap@@41 Mask@13) (|Seq#Equal| (MapType0Select Heap@@41 __flatten_9@0 Wand_state_contains_for_state_contains__prev_contents_1) (|Seq#Empty| intType))) (and (not (= __flatten_9@0 null)) (= Mask@14 (MapType1Store Mask@13 __flatten_9@0 Wand_state_contains_for_state_contains__prev_1 (real_2_U (+ (U_2_real (MapType1Select Mask@13 __flatten_9@0 Wand_state_contains_for_state_contains__prev_1)) FullPerm)))))) (and (and (state Heap@@41 Mask@14) (= (MapType0Select Heap@@41 __flatten_9@0 Wand_state_contains_for_state_contains__prev_1) null)) (and (not (= __flatten_9@0 null)) (= Mask@15 (MapType1Store Mask@14 __flatten_9@0 Wand_state_contains_for_state_contains__cur_contents_1 (real_2_U (+ (U_2_real (MapType1Select Mask@14 __flatten_9@0 Wand_state_contains_for_state_contains__cur_contents_1)) FullPerm))))))))) (and (and (and (and (and (state Heap@@41 Mask@15) (|Seq#Equal| (MapType0Select Heap@@41 __flatten_9@0 Wand_state_contains_for_state_contains__cur_contents_1) (|Seq#Empty| intType))) (and (not (= __flatten_9@0 null)) (= Mask@16 (MapType1Store Mask@15 __flatten_9@0 Wand_state_contains_for_state_contains__top_1 (real_2_U (+ (U_2_real (MapType1Select Mask@15 __flatten_9@0 Wand_state_contains_for_state_contains__top_1)) FullPerm)))))) (and (and (state Heap@@41 Mask@16) (= (MapType0Select Heap@@41 __flatten_9@0 Wand_state_contains_for_state_contains__top_1) null)) (and (not (= __flatten_9@0 null)) (= Mask@17 (MapType1Store Mask@16 __flatten_9@0 Wand_state_contains_for_state_contains__cur_1 (real_2_U (+ (U_2_real (MapType1Select Mask@16 __flatten_9@0 Wand_state_contains_for_state_contains__cur_1)) FullPerm))))))) (and (and (and (state Heap@@41 Mask@17) (= (MapType0Select Heap@@41 __flatten_9@0 Wand_state_contains_for_state_contains__cur_1) null)) (and (not (= __flatten_9@0 null)) (= Mask@18 (MapType1Store Mask@17 __flatten_9@0 Wand_state_contains_for_state_contains__wand_1 (real_2_U (+ (U_2_real (MapType1Select Mask@17 __flatten_9@0 Wand_state_contains_for_state_contains__wand_1)) FullPerm)))))) (and (and (state Heap@@41 Mask@18) (= (MapType0Select Heap@@41 __flatten_9@0 Wand_state_contains_for_state_contains__wand_1) null)) (and (not (= __flatten_9@0 null)) (= Mask@19 (MapType1Store Mask@18 __flatten_9@0 Wand_state_contains_for_state_contains__this_2 (real_2_U (+ (U_2_real (MapType1Select Mask@18 __flatten_9@0 Wand_state_contains_for_state_contains__this_2)) FullPerm)))))))) (and (and (and (and (state Heap@@41 Mask@19) (= (MapType0Select Heap@@41 __flatten_9@0 Wand_state_contains_for_state_contains__this_2) null)) (and (not (= __flatten_9@0 null)) (= Mask@20 (MapType1Store Mask@19 __flatten_9@0 Wand_state_contains_for_state_contains__target_contents_2 (real_2_U (+ (U_2_real (MapType1Select Mask@19 __flatten_9@0 Wand_state_contains_for_state_contains__target_contents_2)) FullPerm)))))) (and (and (state Heap@@41 Mask@20) (|Seq#Equal| (MapType0Select Heap@@41 __flatten_9@0 Wand_state_contains_for_state_contains__target_contents_2) (|Seq#Empty| intType))) (and (not (= __flatten_9@0 null)) (= Mask@21 (MapType1Store Mask@20 __flatten_9@0 Wand_state_contains_for_state_contains__top_2 (real_2_U (+ (U_2_real (MapType1Select Mask@20 __flatten_9@0 Wand_state_contains_for_state_contains__top_2)) FullPerm))))))) (and (and (and (state Heap@@41 Mask@21) (= (MapType0Select Heap@@41 __flatten_9@0 Wand_state_contains_for_state_contains__top_2) null)) (and (state Heap@@41 Mask@21) (U_2_bool (MapType0Select Heap@@41 __flatten_9@0 $allocated)))) (and (and (state Heap@@41 Mask@21) (state Heap@@41 Mask@21)) (and (state Heap@@41 Mask@21) (state Heap@@41 Mask@21))))))) (and (=> (= (ControlFlow 0 107) (- 0 136)) (= FullPerm (U_2_real (MapType1Select Mask@21 __flatten_9@0 Wand_state_contains_for_state_contains__lemma)))) (=> (= FullPerm (U_2_real (MapType1Select Mask@21 __flatten_9@0 Wand_state_contains_for_state_contains__lemma))) (=> (and (and (= Heap@0 (MapType0Store Heap@@41 __flatten_9@0 Wand_state_contains_for_state_contains__lemma (int_2_U 1))) (state Heap@0 Mask@21)) (and (state Heap@0 Mask@21) (state Heap@0 Mask@21))) (and (=> (= (ControlFlow 0 107) (- 0 135)) (= FullPerm (U_2_real (MapType1Select Mask@21 __flatten_9@0 Wand_state_contains_for_state_contains__this_1)))) (=> (= FullPerm (U_2_real (MapType1Select Mask@21 __flatten_9@0 Wand_state_contains_for_state_contains__this_1))) (=> (and (and (= Heap@1 (MapType0Store Heap@0 __flatten_9@0 Wand_state_contains_for_state_contains__this_1 this_1)) (state Heap@1 Mask@21)) (and (state Heap@1 Mask@21) (state Heap@1 Mask@21))) (and (=> (= (ControlFlow 0 107) (- 0 134)) (= FullPerm (U_2_real (MapType1Select Mask@21 __flatten_9@0 Wand_state_contains_for_state_contains__target_contents_1)))) (=> (= FullPerm (U_2_real (MapType1Select Mask@21 __flatten_9@0 Wand_state_contains_for_state_contains__target_contents_1))) (=> (and (and (= Heap@2 (MapType0Store Heap@1 __flatten_9@0 Wand_state_contains_for_state_contains__target_contents_1 target_contents_1)) (state Heap@2 Mask@21)) (and (state Heap@2 Mask@21) (state Heap@2 Mask@21))) (and (=> (= (ControlFlow 0 107) (- 0 133)) (= FullPerm (U_2_real (MapType1Select Mask@21 __flatten_9@0 Wand_state_contains_for_state_contains__prev_contents_1)))) (=> (= FullPerm (U_2_real (MapType1Select Mask@21 __flatten_9@0 Wand_state_contains_for_state_contains__prev_contents_1))) (=> (and (and (= Heap@3 (MapType0Store Heap@2 __flatten_9@0 Wand_state_contains_for_state_contains__prev_contents_1 prev_contents_1)) (state Heap@3 Mask@21)) (and (state Heap@3 Mask@21) (state Heap@3 Mask@21))) (and (=> (= (ControlFlow 0 107) (- 0 132)) (= FullPerm (U_2_real (MapType1Select Mask@21 __flatten_9@0 Wand_state_contains_for_state_contains__prev_1)))) (=> (= FullPerm (U_2_real (MapType1Select Mask@21 __flatten_9@0 Wand_state_contains_for_state_contains__prev_1))) (=> (and (and (= Heap@4 (MapType0Store Heap@3 __flatten_9@0 Wand_state_contains_for_state_contains__prev_1 prev_1)) (state Heap@4 Mask@21)) (and (state Heap@4 Mask@21) (state Heap@4 Mask@21))) (and (=> (= (ControlFlow 0 107) (- 0 131)) (= FullPerm (U_2_real (MapType1Select Mask@21 __flatten_9@0 Wand_state_contains_for_state_contains__cur_contents_1)))) (=> (= FullPerm (U_2_real (MapType1Select Mask@21 __flatten_9@0 Wand_state_contains_for_state_contains__cur_contents_1))) (=> (and (and (= Heap@5 (MapType0Store Heap@4 __flatten_9@0 Wand_state_contains_for_state_contains__cur_contents_1 cur_contents_1)) (state Heap@5 Mask@21)) (and (state Heap@5 Mask@21) (state Heap@5 Mask@21))) (and (=> (= (ControlFlow 0 107) (- 0 130)) (= FullPerm (U_2_real (MapType1Select Mask@21 __flatten_9@0 Wand_state_contains_for_state_contains__top_1)))) (=> (= FullPerm (U_2_real (MapType1Select Mask@21 __flatten_9@0 Wand_state_contains_for_state_contains__top_1))) (=> (and (and (= Heap@6 (MapType0Store Heap@5 __flatten_9@0 Wand_state_contains_for_state_contains__top_1 top_1)) (state Heap@6 Mask@21)) (and (state Heap@6 Mask@21) (state Heap@6 Mask@21))) (and (=> (= (ControlFlow 0 107) (- 0 129)) (= FullPerm (U_2_real (MapType1Select Mask@21 __flatten_9@0 Wand_state_contains_for_state_contains__cur_1)))) (=> (= FullPerm (U_2_real (MapType1Select Mask@21 __flatten_9@0 Wand_state_contains_for_state_contains__cur_1))) (=> (and (and (= Heap@7 (MapType0Store Heap@6 __flatten_9@0 Wand_state_contains_for_state_contains__cur_1 cur_1)) (state Heap@7 Mask@21)) (and (state Heap@7 Mask@21) (state Heap@7 Mask@21))) (and (=> (= (ControlFlow 0 107) (- 0 128)) (= FullPerm (U_2_real (MapType1Select Mask@21 __flatten_9@0 Wand_state_contains_for_state_contains__wand_1)))) (=> (= FullPerm (U_2_real (MapType1Select Mask@21 __flatten_9@0 Wand_state_contains_for_state_contains__wand_1))) (=> (and (and (= Heap@8 (MapType0Store Heap@7 __flatten_9@0 Wand_state_contains_for_state_contains__wand_1 wand_1)) (state Heap@8 Mask@21)) (and (state Heap@8 Mask@21) (state Heap@8 Mask@21))) (and (=> (= (ControlFlow 0 107) (- 0 127)) (= FullPerm (U_2_real (MapType1Select Mask@21 __flatten_9@0 Wand_state_contains_for_state_contains__in_1)))) (=> (= FullPerm (U_2_real (MapType1Select Mask@21 __flatten_9@0 Wand_state_contains_for_state_contains__in_1))) (=> (and (and (= Heap@9 (MapType0Store Heap@8 __flatten_9@0 Wand_state_contains_for_state_contains__in_1 in_1)) (state Heap@9 Mask@21)) (and (state Heap@9 Mask@21) (state Heap@9 Mask@21))) (and (=> (= (ControlFlow 0 107) (- 0 126)) (= FullPerm (U_2_real (MapType1Select Mask@21 __flatten_9@0 Wand_state_contains_for_state_contains__in_1_0)))) (=> (= FullPerm (U_2_real (MapType1Select Mask@21 __flatten_9@0 Wand_state_contains_for_state_contains__in_1_0))) (=> (and (and (= Heap@10 (MapType0Store Heap@9 __flatten_9@0 Wand_state_contains_for_state_contains__in_1_0 in_1_0)) (state Heap@10 Mask@21)) (and (state Heap@10 Mask@21) (state Heap@10 Mask@21))) (and (=> (= (ControlFlow 0 107) (- 0 125)) (= FullPerm (U_2_real (MapType1Select Mask@21 __flatten_9@0 Wand_state_contains_for_state_contains__out_1)))) (=> (= FullPerm (U_2_real (MapType1Select Mask@21 __flatten_9@0 Wand_state_contains_for_state_contains__out_1))) (=> (and (and (= Heap@11 (MapType0Store Heap@10 __flatten_9@0 Wand_state_contains_for_state_contains__out_1 out_1)) (state Heap@11 Mask@21)) (and (state Heap@11 Mask@21) (state Heap@11 Mask@21))) (and (=> (= (ControlFlow 0 107) (- 0 124)) (= FullPerm (U_2_real (MapType1Select Mask@21 __flatten_9@0 Wand_state_contains_for_state_contains__out_1_0)))) (=> (= FullPerm (U_2_real (MapType1Select Mask@21 __flatten_9@0 Wand_state_contains_for_state_contains__out_1_0))) (=> (and (= Heap@12 (MapType0Store Heap@11 __flatten_9@0 Wand_state_contains_for_state_contains__out_1_0 out_1_0)) (state Heap@12 Mask@21)) (and (=> (= (ControlFlow 0 107) (- 0 123)) (> (U_2_real (MapType1Select Mask@21 __flatten_9@0 Wand_state_contains_for_state_contains__lemma)) NoPerm)) (=> (> (U_2_real (MapType1Select Mask@21 __flatten_9@0 Wand_state_contains_for_state_contains__lemma)) NoPerm) (=> (> wildcard@0 NoPerm) (=> (and (< wildcard@0 (U_2_real (MapType1Select Mask@21 __flatten_9@0 Wand_state_contains_for_state_contains__lemma))) (= Mask@22 (MapType1Store Mask@21 __flatten_9@0 Wand_state_contains_for_state_contains__lemma (real_2_U (- (U_2_real (MapType1Select Mask@21 __flatten_9@0 Wand_state_contains_for_state_contains__lemma)) wildcard@0))))) (and (=> (= (ControlFlow 0 107) (- 0 122)) (<= 1 (U_2_int (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__lemma)))) (=> (<= 1 (U_2_int (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__lemma))) (and (=> (= (ControlFlow 0 107) (- 0 121)) (> (U_2_real (MapType1Select Mask@22 __flatten_9@0 Wand_state_contains_for_state_contains__in_1)) NoPerm)) (=> (> (U_2_real (MapType1Select Mask@22 __flatten_9@0 Wand_state_contains_for_state_contains__in_1)) NoPerm) (=> (> wildcard@1 NoPerm) (=> (and (< wildcard@1 (U_2_real (MapType1Select Mask@22 __flatten_9@0 Wand_state_contains_for_state_contains__in_1))) (= Mask@23 (MapType1Store Mask@22 __flatten_9@0 Wand_state_contains_for_state_contains__in_1 (real_2_U (- (U_2_real (MapType1Select Mask@22 __flatten_9@0 Wand_state_contains_for_state_contains__in_1)) wildcard@1))))) (and (=> (= (ControlFlow 0 107) (- 0 120)) (not (= (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__in_1) null))) (=> (not (= (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__in_1) null)) (and (=> (= (ControlFlow 0 107) (- 0 119)) (> (U_2_real (MapType1Select Mask@23 __flatten_9@0 Wand_state_contains_for_state_contains__in_1_0)) NoPerm)) (=> (> (U_2_real (MapType1Select Mask@23 __flatten_9@0 Wand_state_contains_for_state_contains__in_1_0)) NoPerm) (=> (> wildcard@2 NoPerm) (=> (and (< wildcard@2 (U_2_real (MapType1Select Mask@23 __flatten_9@0 Wand_state_contains_for_state_contains__in_1_0))) (= Mask@24 (MapType1Store Mask@23 __flatten_9@0 Wand_state_contains_for_state_contains__in_1_0 (real_2_U (- (U_2_real (MapType1Select Mask@23 __flatten_9@0 Wand_state_contains_for_state_contains__in_1_0)) wildcard@2))))) (and (=> (= (ControlFlow 0 107) (- 0 118)) (> (U_2_real (MapType1Select Mask@24 __flatten_9@0 Wand_state_contains_for_state_contains__out_1)) NoPerm)) (=> (> (U_2_real (MapType1Select Mask@24 __flatten_9@0 Wand_state_contains_for_state_contains__out_1)) NoPerm) (=> (> wildcard@3 NoPerm) (=> (and (< wildcard@3 (U_2_real (MapType1Select Mask@24 __flatten_9@0 Wand_state_contains_for_state_contains__out_1))) (= Mask@25 (MapType1Store Mask@24 __flatten_9@0 Wand_state_contains_for_state_contains__out_1 (real_2_U (- (U_2_real (MapType1Select Mask@24 __flatten_9@0 Wand_state_contains_for_state_contains__out_1)) wildcard@3))))) (and (=> (= (ControlFlow 0 107) (- 0 117)) (not (= (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__out_1) null))) (=> (not (= (MapType0Select Heap@12 __flatten_9@0 Wand_state_contains_for_state_contains__out_1) null)) (and (=> (= (ControlFlow 0 107) (- 0 116)) (> (U_2_real (MapType1Select Mask@25 __flatten_9@0 Wand_state_contains_for_state_contains__out_1_0)) NoPerm)) (=> (> (U_2_real (MapType1Select Mask@25 __flatten_9@0 Wand_state_contains_for_state_contains__out_1_0)) NoPerm) (=> (> wildcard@4 NoPerm) (=> (and (< wildcard@4 (U_2_real (MapType1Select Mask@25 __flatten_9@0 Wand_state_contains_for_state_contains__out_1_0))) (= Mask@26 (MapType1Store Mask@25 __flatten_9@0 Wand_state_contains_for_state_contains__out_1_0 (real_2_U (- (U_2_real (MapType1Select Mask@25 __flatten_9@0 Wand_state_contains_for_state_contains__out_1_0)) wildcard@4))))) (and (=> (= (ControlFlow 0 107) (- 0 115)) (> (U_2_real (MapType1Select Mask@26 __flatten_9@0 Wand_state_contains_for_state_contains__this_1)) NoPerm)) (=> (> (U_2_real (MapType1Select Mask@26 __flatten_9@0 Wand_state_contains_for_state_contains__this_1)) NoPerm) (=> (> wildcard@5 NoPerm) (=> (and (< wildcard@5 (U_2_real (MapType1Select Mask@26 __flatten_9@0 Wand_state_contains_for_state_contains__this_1))) (= Mask@27 (MapType1Store Mask@26 __flatten_9@0 Wand_state_contains_for_state_contains__this_1 (real_2_U (- (U_2_real (MapType1Select Mask@26 __flatten_9@0 Wand_state_contains_for_state_contains__this_1)) wildcard@5))))) (and (=> (= (ControlFlow 0 107) (- 0 114)) (> (U_2_real (MapType1Select Mask@27 __flatten_9@0 Wand_state_contains_for_state_contains__target_contents_1)) NoPerm)) (=> (> (U_2_real (MapType1Select Mask@27 __flatten_9@0 Wand_state_contains_for_state_contains__target_contents_1)) NoPerm) (=> (> wildcard@6 NoPerm) (=> (and (< wildcard@6 (U_2_real (MapType1Select Mask@27 __flatten_9@0 Wand_state_contains_for_state_contains__target_contents_1))) (= Mask@28 (MapType1Store Mask@27 __flatten_9@0 Wand_state_contains_for_state_contains__target_contents_1 (real_2_U (- (U_2_real (MapType1Select Mask@27 __flatten_9@0 Wand_state_contains_for_state_contains__target_contents_1)) wildcard@6))))) (and (=> (= (ControlFlow 0 107) (- 0 113)) (> (U_2_real (MapType1Select Mask@28 __flatten_9@0 Wand_state_contains_for_state_contains__prev_contents_1)) NoPerm)) (=> (> (U_2_real (MapType1Select Mask@28 __flatten_9@0 Wand_state_contains_for_state_contains__prev_contents_1)) NoPerm) (=> (> wildcard@7 NoPerm) (=> (and (< wildcard@7 (U_2_real (MapType1Select Mask@28 __flatten_9@0 Wand_state_contains_for_state_contains__prev_contents_1))) (= Mask@29 (MapType1Store Mask@28 __flatten_9@0 Wand_state_contains_for_state_contains__prev_contents_1 (real_2_U (- (U_2_real (MapType1Select Mask@28 __flatten_9@0 Wand_state_contains_for_state_contains__prev_contents_1)) wildcard@7))))) (and (=> (= (ControlFlow 0 107) (- 0 112)) (> (U_2_real (MapType1Select Mask@29 __flatten_9@0 Wand_state_contains_for_state_contains__prev_1)) NoPerm)) (=> (> (U_2_real (MapType1Select Mask@29 __flatten_9@0 Wand_state_contains_for_state_contains__prev_1)) NoPerm) (=> (> wildcard@8 NoPerm) (=> (and (< wildcard@8 (U_2_real (MapType1Select Mask@29 __flatten_9@0 Wand_state_contains_for_state_contains__prev_1))) (= Mask@30 (MapType1Store Mask@29 __flatten_9@0 Wand_state_contains_for_state_contains__prev_1 (real_2_U (- (U_2_real (MapType1Select Mask@29 __flatten_9@0 Wand_state_contains_for_state_contains__prev_1)) wildcard@8))))) (and (=> (= (ControlFlow 0 107) (- 0 111)) (> (U_2_real (MapType1Select Mask@30 __flatten_9@0 Wand_state_contains_for_state_contains__cur_contents_1)) NoPerm)) (=> (> (U_2_real (MapType1Select Mask@30 __flatten_9@0 Wand_state_contains_for_state_contains__cur_contents_1)) NoPerm) (=> (> wildcard@9 NoPerm) (=> (and (< wildcard@9 (U_2_real (MapType1Select Mask@30 __flatten_9@0 Wand_state_contains_for_state_contains__cur_contents_1))) (= Mask@31 (MapType1Store Mask@30 __flatten_9@0 Wand_state_contains_for_state_contains__cur_contents_1 (real_2_U (- (U_2_real (MapType1Select Mask@30 __flatten_9@0 Wand_state_contains_for_state_contains__cur_contents_1)) wildcard@9))))) (and (=> (= (ControlFlow 0 107) (- 0 110)) (> (U_2_real (MapType1Select Mask@31 __flatten_9@0 Wand_state_contains_for_state_contains__top_1)) NoPerm)) (=> (> (U_2_real (MapType1Select Mask@31 __flatten_9@0 Wand_state_contains_for_state_contains__top_1)) NoPerm) (=> (> wildcard@10 NoPerm) (=> (and (< wildcard@10 (U_2_real (MapType1Select Mask@31 __flatten_9@0 Wand_state_contains_for_state_contains__top_1))) (= Mask@32 (MapType1Store Mask@31 __flatten_9@0 Wand_state_contains_for_state_contains__top_1 (real_2_U (- (U_2_real (MapType1Select Mask@31 __flatten_9@0 Wand_state_contains_for_state_contains__top_1)) wildcard@10))))) (and (=> (= (ControlFlow 0 107) (- 0 109)) (> (U_2_real (MapType1Select Mask@32 __flatten_9@0 Wand_state_contains_for_state_contains__cur_1)) NoPerm)) (=> (> (U_2_real (MapType1Select Mask@32 __flatten_9@0 Wand_state_contains_for_state_contains__cur_1)) NoPerm) (=> (> wildcard@11 NoPerm) (=> (and (< wildcard@11 (U_2_real (MapType1Select Mask@32 __flatten_9@0 Wand_state_contains_for_state_contains__cur_1))) (= Mask@33 (MapType1Store Mask@32 __flatten_9@0 Wand_state_contains_for_state_contains__cur_1 (real_2_U (- (U_2_real (MapType1Select Mask@32 __flatten_9@0 Wand_state_contains_for_state_contains__cur_1)) wildcard@11))))) (and (=> (= (ControlFlow 0 107) (- 0 108)) (> (U_2_real (MapType1Select Mask@33 __flatten_9@0 Wand_state_contains_for_state_contains__wand_1)) NoPerm)) (=> (> (U_2_real (MapType1Select Mask@33 __flatten_9@0 Wand_state_contains_for_state_contains__wand_1)) NoPerm) (=> (> wildcard@12 NoPerm) (=> (and (< wildcard@12 (U_2_real (MapType1Select Mask@33 __flatten_9@0 Wand_state_contains_for_state_contains__wand_1))) (= Mask@34 (MapType1Store Mask@33 __flatten_9@0 Wand_state_contains_for_state_contains__wand_1 (real_2_U (- (U_2_real (MapType1Select Mask@33 __flatten_9@0 Wand_state_contains_for_state_contains__wand_1)) wildcard@12))))) (and (=> (= (ControlFlow 0 107) 103) anon106_Then_correct) (=> (= (ControlFlow 0 107) 68) anon106_Else_correct)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
(let ((anon95_Else_correct  (=> (and (|Seq#Equal| (Wand_state_contains_for_state_contains__get_out_1_0 Heap@@41 wand_1) target_contents_1) (state Heap@@41 Mask@5)) (=> (and (and (not (= in_1 null)) (state Heap@@41 Mask@5)) (and (= in_1 cur_1) (state Heap@@41 Mask@5))) (=> (and (and (and (|Seq#Equal| in_1_0 (|Seq#Drop| cur_contents_1 1)) (state Heap@@41 Mask@5)) (and (not (= out_1 null)) (state Heap@@41 Mask@5))) (and (and (= out_1 top_1) (state Heap@@41 Mask@5)) (and (|Seq#Equal| out_1_0 target_contents_1) (state Heap@@41 Mask@5)))) (and (=> (= (ControlFlow 0 167) 166) anon97_Then_correct) (=> (= (ControlFlow 0 167) 107) anon97_Else_correct)))))))
(let ((anon93_Else_correct  (=> (= (Wand_state_contains_for_state_contains__get_out_1 Heap@@41 wand_1) top_1) (=> (and (state Heap@@41 Mask@5) (state Heap@@41 Mask@5)) (and (=> (= (ControlFlow 0 174) 172) anon95_Then_correct) (=> (= (ControlFlow 0 174) 167) anon95_Else_correct))))))
(let ((anon91_Else_correct  (=> (|Seq#Equal| (Wand_state_contains_for_state_contains__get_in_1_0 Heap@@41 wand_1) (|Seq#Drop| prev_contents_1 1)) (=> (and (state Heap@@41 Mask@5) (state Heap@@41 Mask@5)) (and (=> (= (ControlFlow 0 181) 179) anon93_Then_correct) (=> (= (ControlFlow 0 181) 174) anon93_Else_correct))))))
(let ((anon89_Else_correct  (=> (= (Wand_state_contains_for_state_contains__get_in_1 Heap@@41 wand_1) prev_1) (=> (and (state Heap@@41 Mask@5) (state Heap@@41 Mask@5)) (and (=> (= (ControlFlow 0 188) 186) anon91_Then_correct) (=> (= (ControlFlow 0 188) 181) anon91_Else_correct))))))
(let ((anon86_Else_correct  (=> (and (and (and (|Seq#Equal| prev_contents_1 (|Seq#Append| (|Seq#Append| cur_contents_1 (|Seq#Singleton| (MapType0Select Heap@@41 prev_1 Tree__data))) (Tree__tolist Heap@@41 (MapType0Select Heap@@41 prev_1 Tree__right)))) (state Heap@@41 Mask@4)) (and (not (= wand_1 null)) (state Heap@@41 Mask@4))) (and (and (= Mask@5 (MapType1Store Mask@4 null (Wand_state_contains_for_state_contains__valid_wand wand_1) (real_2_U (+ (U_2_real (MapType1Select Mask@4 null (Wand_state_contains_for_state_contains__valid_wand wand_1))) FullPerm)))) (state Heap@@41 Mask@5)) (and (state Heap@@41 Mask@5) (state Heap@@41 Mask@5)))) (and (=> (= (ControlFlow 0 195) 193) anon89_Then_correct) (=> (= (ControlFlow 0 195) 188) anon89_Else_correct)))))
(let ((anon7_correct true))
(let ((anon6_correct  (=> (= Mask@50 (MapType1Store Mask@4 null (Tree__state (MapType0Select Heap@@41 prev_1 Tree__right)) (real_2_U (- (U_2_real (MapType1Select Mask@4 null (Tree__state (MapType0Select Heap@@41 prev_1 Tree__right)))) FullPerm)))) (=> (and (= Mask@51 Mask@50) (= (ControlFlow 0 3) 1)) anon7_correct))))
(let ((anon88_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 6) 3)) anon6_correct)))
(let ((anon88_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 4) (- 0 5)) (<= FullPerm (U_2_real (MapType1Select Mask@4 null (Tree__state (MapType0Select Heap@@41 prev_1 Tree__right)))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@4 null (Tree__state (MapType0Select Heap@@41 prev_1 Tree__right))))) (=> (= (ControlFlow 0 4) 3) anon6_correct))))))
(let ((anon87_Then_correct  (=> (not (= (MapType0Select Heap@@41 prev_1 Tree__right) null)) (and (=> (= (ControlFlow 0 7) 4) anon88_Then_correct) (=> (= (ControlFlow 0 7) 6) anon88_Else_correct)))))
(let ((anon87_Else_correct  (=> (= (MapType0Select Heap@@41 prev_1 Tree__right) null) (=> (and (= Mask@51 Mask@4) (= (ControlFlow 0 2) 1)) anon7_correct))))
(let ((anon2_correct  (=> (state Heap@@41 Mask@4) (and (=> (= (ControlFlow 0 196) (- 0 199)) (HasDirectPerm Mask@4 prev_1 Tree__left)) (=> (HasDirectPerm Mask@4 prev_1 Tree__left) (=> (= (MapType0Select Heap@@41 prev_1 Tree__left) cur_1) (=> (and (state Heap@@41 Mask@4) (state Heap@@41 Mask@4)) (and (=> (= (ControlFlow 0 196) (- 0 198)) (HasDirectPerm Mask@4 prev_1 Tree__data)) (=> (HasDirectPerm Mask@4 prev_1 Tree__data) (and (=> (= (ControlFlow 0 196) (- 0 197)) (HasDirectPerm Mask@4 prev_1 Tree__right)) (=> (HasDirectPerm Mask@4 prev_1 Tree__right) (and (and (=> (= (ControlFlow 0 196) 195) anon86_Else_correct) (=> (= (ControlFlow 0 196) 7) anon87_Then_correct)) (=> (= (ControlFlow 0 196) 2) anon87_Else_correct)))))))))))))
(let ((anon85_Else_correct  (=> (= (MapType0Select Heap@@41 prev_1 Tree__right) null) (=> (and (= Mask@4 Mask@2) (= (ControlFlow 0 202) 196)) anon2_correct))))
(let ((anon85_Then_correct  (=> (not (= (MapType0Select Heap@@41 prev_1 Tree__right) null)) (and (=> (= (ControlFlow 0 200) (- 0 201)) (HasDirectPerm Mask@2 prev_1 Tree__right)) (=> (HasDirectPerm Mask@2 prev_1 Tree__right) (=> (and (and (= Mask@3 (MapType1Store Mask@2 null (Tree__state (MapType0Select Heap@@41 prev_1 Tree__right)) (real_2_U (+ (U_2_real (MapType1Select Mask@2 null (Tree__state (MapType0Select Heap@@41 prev_1 Tree__right)))) FullPerm)))) (state Heap@@41 Mask@3)) (and (= Mask@4 Mask@3) (= (ControlFlow 0 200) 196))) anon2_correct))))))
(let ((anon0_correct  (=> (and (and (and (and (and (state Heap@@41 ZeroMask) (= AssumeFunctionsAbove (- 0 1))) (and (U_2_bool (MapType0Select Heap@@41 diz@@29 $allocated)) (U_2_bool (MapType0Select Heap@@41 this_1 $allocated)))) (and (and (U_2_bool (MapType0Select Heap@@41 prev_1 $allocated)) (U_2_bool (MapType0Select Heap@@41 top_1 $allocated))) (and (U_2_bool (MapType0Select Heap@@41 cur_1 $allocated)) (U_2_bool (MapType0Select Heap@@41 wand_1 $allocated))))) (and (and (and (U_2_bool (MapType0Select Heap@@41 in_1 $allocated)) (U_2_bool (MapType0Select Heap@@41 out_1 $allocated))) (and (not (= diz@@29 null)) (state Heap@@41 ZeroMask))) (and (and (>= current_thread_id 0) (state Heap@@41 ZeroMask)) (and (not (= this_1 null)) (state Heap@@41 ZeroMask))))) (and (and (and (and (> (|Seq#Length| prev_contents_1) 0) (state Heap@@41 ZeroMask)) (and (> (|Seq#Length| cur_contents_1) 0) (state Heap@@41 ZeroMask))) (and (and (not (= prev_1 null)) (= Mask@0 (MapType1Store ZeroMask prev_1 Tree__left (real_2_U (+ (U_2_real (MapType1Select ZeroMask prev_1 Tree__left)) FullPerm))))) (and (state Heap@@41 Mask@0) (state Heap@@41 Mask@0)))) (and (and (and (not (= prev_1 null)) (= Mask@1 (MapType1Store Mask@0 prev_1 Tree__data (real_2_U (+ (U_2_real (MapType1Select Mask@0 prev_1 Tree__data)) FullPerm))))) (and (state Heap@@41 Mask@1) (state Heap@@41 Mask@1))) (and (and (not (= prev_1 null)) (= Mask@2 (MapType1Store Mask@1 prev_1 Tree__right (real_2_U (+ (U_2_real (MapType1Select Mask@1 prev_1 Tree__right)) FullPerm))))) (and (state Heap@@41 Mask@2) (state Heap@@41 Mask@2)))))) (and (=> (= (ControlFlow 0 203) (- 0 204)) (HasDirectPerm Mask@2 prev_1 Tree__right)) (=> (HasDirectPerm Mask@2 prev_1 Tree__right) (and (=> (= (ControlFlow 0 203) 200) anon85_Then_correct) (=> (= (ControlFlow 0 203) 202) anon85_Else_correct)))))))
(let ((PreconditionGeneratedEntry_correct  (=> (and (and (> wildcard NoPerm) true) (= (ControlFlow 0 205) 203)) anon0_correct)))
PreconditionGeneratedEntry_correct)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
))
(check-sat)
(pop 1)
; Valid
(get-info :rlimit)
