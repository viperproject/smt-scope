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
(declare-fun globalK$ () Real)
(declare-fun old$methodPermission () T@U)
(declare-fun joinable$ () T@U)
(declare-fun Wand_readonly_for_writeonlylemma$ () T@U)
(declare-fun Wand_readonly_for_writeonlyin_1$ () T@U)
(declare-fun Wand_readonly_for_writeonlyout_1$ () T@U)
(declare-fun Wand_readonly_for_writeonlythis_1$ () T@U)
(declare-fun WandDemox$ () T@U)
(declare-fun old$Wand_readonly_for_writeonlyapply$0 () T@U)
(declare-fun par$Wand_readonly_for_writeonlyapply$this$_3 () T@U)
(declare-fun par$Wand_readonly_for_writeonlyapply$k$ () T@U)
(declare-fun par$Wand_readonly_for_writeonlyWand_readonly_for_writeonly_init$this$_5 () T@U)
(declare-fun par$Wand_readonly_for_writeonlyWand_readonly_for_writeonly_init$k$_1 () T@U)
(declare-fun par$WandDemoWandDemo_init$this$_10 () T@U)
(declare-fun par$WandDemoWandDemo_init$k$_2 () T@U)
(declare-fun par$WandDemoWand_readonly_for_writeonly_lemma_1$this$_11 () T@U)
(declare-fun par$WandDemoWand_readonly_for_writeonly_lemma_1$k$_3 () T@U)
(declare-fun par$WandDemoWand_readonly_for_writeonly_lemma_1$__this_1 () T@U)
(declare-fun par$WandDemoWand_readonly_for_writeonly_lemma_1$__in_1 () T@U)
(declare-fun par$WandDemoWand_readonly_for_writeonly_lemma_1$__out_1 () T@U)
(declare-fun par$WandDemoset_val$this$_12 () T@U)
(declare-fun par$WandDemoset_val$k$_4 () T@U)
(declare-fun par$WandDemoset_val$__v () T@U)
(declare-fun par$WandDemodemo$this$_13 () T@U)
(declare-fun par$WandDemodemo$k$_5 () T@U)
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
(declare-fun state (T@U T@U) Bool)
(declare-fun MapType1Type (T@T T@T) T@T)
(declare-fun GoodMask (T@U) Bool)
(declare-fun MapType1TypeInv0 (T@T) T@T)
(declare-fun MapType1TypeInv1 (T@T) T@T)
(declare-fun MapType1Select (T@U T@U T@U) T@U)
(declare-fun MapType1Store (T@U T@U T@U T@U) T@U)
(declare-fun IdenticalOnKnownLocations (T@U T@U T@U) Bool)
(declare-fun IsPredicateField (T@U) Bool)
(declare-fun null () T@U)
(declare-fun PredicateMaskField (T@U) T@U)
(declare-fun FrameTypeType () T@T)
(declare-fun HasDirectPerm (T@U T@U T@U) Bool)
(declare-fun IsWandField (T@U) Bool)
(declare-fun WandMaskField (T@U) T@U)
(declare-fun Wand_readonly_for_writeonly$MonitorInvariant (T@U) T@U)
(declare-fun PredicateType_Wand_readonly_for_writeonly$MonitorInvariantType () T@T)
(declare-fun Wand_readonly_for_writeonlyvalid_wand$ (T@U) T@U)
(declare-fun PredicateType_Wand_readonly_for_writeonlyvalid_wand$Type () T@T)
(declare-fun WandDemo$MonitorInvariant (T@U) T@U)
(declare-fun PredicateType_WandDemo$MonitorInvariantType () T@T)
(declare-fun WandDemoreadonly$ (T@U) T@U)
(declare-fun PredicateType_WandDemoreadonly$Type () T@T)
(declare-fun WandDemowriteonly$ (T@U) T@U)
(declare-fun PredicateType_WandDemowriteonly$Type () T@T)
(declare-fun |Wand_readonly_for_writeonlyget_in_1$'| (T@U T@U) T@U)
(declare-fun dummyFunction (T@U) Bool)
(declare-fun |Wand_readonly_for_writeonlyget_in_1$#triggerStateless| (T@U) T@U)
(declare-fun |Wand_readonly_for_writeonlyget_out_1$'| (T@U T@U) T@U)
(declare-fun |Wand_readonly_for_writeonlyget_out_1$#triggerStateless| (T@U) T@U)
(declare-fun |WandDemoget$'| (T@U T@U) Int)
(declare-fun |WandDemoget$#triggerStateless| (T@U) Int)
(declare-fun |Wand_readonly_for_writeonly$MonitorInvariant#trigger| (T@U T@U) Bool)
(declare-fun |Wand_readonly_for_writeonly$MonitorInvariant#everUsed| (T@U) Bool)
(declare-fun |Wand_readonly_for_writeonlyvalid_wand$#trigger| (T@U T@U) Bool)
(declare-fun |Wand_readonly_for_writeonlyvalid_wand$#everUsed| (T@U) Bool)
(declare-fun |WandDemo$MonitorInvariant#trigger| (T@U T@U) Bool)
(declare-fun |WandDemo$MonitorInvariant#everUsed| (T@U) Bool)
(declare-fun |WandDemoreadonly$#trigger| (T@U T@U) Bool)
(declare-fun |WandDemoreadonly$#everUsed| (T@U) Bool)
(declare-fun |WandDemowriteonly$#trigger| (T@U T@U) Bool)
(declare-fun |WandDemowriteonly$#everUsed| (T@U) Bool)
(declare-fun NoPerm () Real)
(declare-fun FullPerm () Real)
(declare-fun Wand_readonly_for_writeonlyget_in_1$ (T@U T@U) T@U)
(declare-fun Wand_readonly_for_writeonlyget_out_1$ (T@U T@U) T@U)
(declare-fun WandDemoget$ (T@U T@U) Int)
(declare-fun |Wand_readonly_for_writeonly$MonitorInvariant#sm| (T@U) T@U)
(declare-fun |Wand_readonly_for_writeonlyvalid_wand$#sm| (T@U) T@U)
(declare-fun |WandDemo$MonitorInvariant#sm| (T@U) T@U)
(declare-fun |WandDemoreadonly$#sm| (T@U) T@U)
(declare-fun |WandDemowriteonly$#sm| (T@U) T@U)
(declare-fun dummyHeap () T@U)
(declare-fun ZeroMask () T@U)
(declare-fun InsidePredicate (T@U T@U T@U T@U) Bool)
(declare-fun AssumeFunctionsAbove () Int)
(declare-fun sumMask (T@U T@U T@U) Bool)
(declare-fun ConditionalFrame (Real T@U) T@U)
(declare-fun EmptyFrame () T@U)
(declare-fun getPredWandId (T@U) Int)
(declare-fun |Wand_readonly_for_writeonlyget_in_1$#frame| (T@U T@U) T@U)
(declare-fun |Wand_readonly_for_writeonlyget_out_1$#frame| (T@U T@U) T@U)
(declare-fun |WandDemoget$#frame| (T@U T@U) Int)
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
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (forall ((arg0@@11 T@T) (arg1 T@T) ) (! (= (Ctor (FieldType arg0@@11 arg1)) 6)
 :qid |ctor:FieldType|
)) (forall ((arg0@@12 T@T) (arg1@@0 T@T) ) (! (= (FieldTypeInv0 (FieldType arg0@@12 arg1@@0)) arg0@@12)
 :qid |typeInv:FieldTypeInv0|
 :pattern ( (FieldType arg0@@12 arg1@@0))
))) (forall ((arg0@@13 T@T) (arg1@@1 T@T) ) (! (= (FieldTypeInv1 (FieldType arg0@@13 arg1@@1)) arg1@@1)
 :qid |typeInv:FieldTypeInv1|
 :pattern ( (FieldType arg0@@13 arg1@@1))
))) (= (Ctor NormalFieldType) 7)) (= (type $allocated) (FieldType NormalFieldType boolType))) (= (type old$methodPermission) (FieldType NormalFieldType realType))) (= (type joinable$) (FieldType NormalFieldType boolType))) (= (type Wand_readonly_for_writeonlylemma$) (FieldType NormalFieldType intType))) (= (Ctor RefType) 8)) (= (type Wand_readonly_for_writeonlyin_1$) (FieldType NormalFieldType RefType))) (= (type Wand_readonly_for_writeonlyout_1$) (FieldType NormalFieldType RefType))) (= (type Wand_readonly_for_writeonlythis_1$) (FieldType NormalFieldType RefType))) (= (type WandDemox$) (FieldType NormalFieldType intType))) (= (type old$Wand_readonly_for_writeonlyapply$0) (FieldType NormalFieldType RefType))) (= (type par$Wand_readonly_for_writeonlyapply$this$_3) (FieldType NormalFieldType RefType))) (= (type par$Wand_readonly_for_writeonlyapply$k$) (FieldType NormalFieldType realType))) (= (type par$Wand_readonly_for_writeonlyWand_readonly_for_writeonly_init$this$_5) (FieldType NormalFieldType RefType))) (= (type par$Wand_readonly_for_writeonlyWand_readonly_for_writeonly_init$k$_1) (FieldType NormalFieldType realType))) (= (type par$WandDemoWandDemo_init$this$_10) (FieldType NormalFieldType RefType))) (= (type par$WandDemoWandDemo_init$k$_2) (FieldType NormalFieldType realType))) (= (type par$WandDemoWand_readonly_for_writeonly_lemma_1$this$_11) (FieldType NormalFieldType RefType))) (= (type par$WandDemoWand_readonly_for_writeonly_lemma_1$k$_3) (FieldType NormalFieldType realType))) (= (type par$WandDemoWand_readonly_for_writeonly_lemma_1$__this_1) (FieldType NormalFieldType RefType))) (= (type par$WandDemoWand_readonly_for_writeonly_lemma_1$__in_1) (FieldType NormalFieldType RefType))) (= (type par$WandDemoWand_readonly_for_writeonly_lemma_1$__out_1) (FieldType NormalFieldType RefType))) (= (type par$WandDemoset_val$this$_12) (FieldType NormalFieldType RefType))) (= (type par$WandDemoset_val$k$_4) (FieldType NormalFieldType realType))) (= (type par$WandDemoset_val$__v) (FieldType NormalFieldType intType))) (= (type par$WandDemodemo$this$_13) (FieldType NormalFieldType RefType))) (= (type par$WandDemodemo$k$_5) (FieldType NormalFieldType realType))))
(assert (distinct $allocated (real_2_U globalK$) old$methodPermission joinable$ Wand_readonly_for_writeonlylemma$ Wand_readonly_for_writeonlyin_1$ Wand_readonly_for_writeonlyout_1$ Wand_readonly_for_writeonlythis_1$ WandDemox$ old$Wand_readonly_for_writeonlyapply$0 par$Wand_readonly_for_writeonlyapply$this$_3 par$Wand_readonly_for_writeonlyapply$k$ par$Wand_readonly_for_writeonlyWand_readonly_for_writeonly_init$this$_5 par$Wand_readonly_for_writeonlyWand_readonly_for_writeonly_init$k$_1 par$WandDemoWandDemo_init$this$_10 par$WandDemoWandDemo_init$k$_2 par$WandDemoWand_readonly_for_writeonly_lemma_1$this$_11 par$WandDemoWand_readonly_for_writeonly_lemma_1$k$_3 par$WandDemoWand_readonly_for_writeonly_lemma_1$__this_1 par$WandDemoWand_readonly_for_writeonly_lemma_1$__in_1 par$WandDemoWand_readonly_for_writeonly_lemma_1$__out_1 par$WandDemoset_val$this$_12 par$WandDemoset_val$k$_4 par$WandDemoset_val$__v par$WandDemodemo$this$_13 par$WandDemodemo$k$_5)
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
(assert  (and (and (and (and (and (and (forall ((arg0@@18 T@T) (arg1@@4 T@T) ) (! (= (Ctor (MapType1Type arg0@@18 arg1@@4)) 10)
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
(assert  (and (and (= (Ctor FrameTypeType) 11) (= (type null) RefType)) (forall ((arg0@@23 T@U) ) (! (let ((A (FieldTypeInv0 (type arg0@@23))))
(= (type (PredicateMaskField arg0@@23)) (FieldType A (MapType1Type RefType boolType))))
 :qid |funType:PredicateMaskField|
 :pattern ( (PredicateMaskField arg0@@23))
))))
(assert (forall ((Heap@@0 T@U) (ExhaleHeap T@U) (Mask@@0 T@U) (pm_f T@U) ) (! (let ((C (FieldTypeInv0 (type pm_f))))
 (=> (and (and (and (and (and (= (type Heap@@0) (MapType0Type RefType)) (= (type ExhaleHeap) (MapType0Type RefType))) (= (type Mask@@0) (MapType1Type RefType realType))) (= (type pm_f) (FieldType C FrameTypeType))) (IdenticalOnKnownLocations Heap@@0 ExhaleHeap Mask@@0)) (and (HasDirectPerm Mask@@0 null pm_f) (IsPredicateField pm_f))) (= (MapType0Select Heap@@0 null (PredicateMaskField pm_f)) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))))
 :qid |stdinbpl.47:19|
 :skolemid |2|
 :pattern ( (IdenticalOnKnownLocations Heap@@0 ExhaleHeap Mask@@0) (IsPredicateField pm_f) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))
)))
(assert (forall ((arg0@@24 T@U) ) (! (let ((A@@0 (FieldTypeInv0 (type arg0@@24))))
(= (type (WandMaskField arg0@@24)) (FieldType A@@0 (MapType1Type RefType boolType))))
 :qid |funType:WandMaskField|
 :pattern ( (WandMaskField arg0@@24))
)))
(assert (forall ((Heap@@1 T@U) (ExhaleHeap@@0 T@U) (Mask@@1 T@U) (pm_f@@0 T@U) ) (! (let ((C@@0 (FieldTypeInv0 (type pm_f@@0))))
 (=> (and (and (and (and (and (= (type Heap@@1) (MapType0Type RefType)) (= (type ExhaleHeap@@0) (MapType0Type RefType))) (= (type Mask@@1) (MapType1Type RefType realType))) (= (type pm_f@@0) (FieldType C@@0 FrameTypeType))) (IdenticalOnKnownLocations Heap@@1 ExhaleHeap@@0 Mask@@1)) (and (HasDirectPerm Mask@@1 null pm_f@@0) (IsWandField pm_f@@0))) (= (MapType0Select Heap@@1 null (WandMaskField pm_f@@0)) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))))
 :qid |stdinbpl.60:19|
 :skolemid |5|
 :pattern ( (IdenticalOnKnownLocations Heap@@1 ExhaleHeap@@0 Mask@@1) (IsWandField pm_f@@0) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))
)))
(assert  (and (= (Ctor PredicateType_Wand_readonly_for_writeonly$MonitorInvariantType) 12) (forall ((arg0@@25 T@U) ) (! (= (type (Wand_readonly_for_writeonly$MonitorInvariant arg0@@25)) (FieldType PredicateType_Wand_readonly_for_writeonly$MonitorInvariantType FrameTypeType))
 :qid |funType:Wand_readonly_for_writeonly$MonitorInvariant|
 :pattern ( (Wand_readonly_for_writeonly$MonitorInvariant arg0@@25))
))))
(assert (forall ((this$ T@U) ) (!  (=> (= (type this$) RefType) (IsPredicateField (Wand_readonly_for_writeonly$MonitorInvariant this$)))
 :qid |stdinbpl.623:15|
 :skolemid |35|
 :pattern ( (Wand_readonly_for_writeonly$MonitorInvariant this$))
)))
(assert  (and (= (Ctor PredicateType_Wand_readonly_for_writeonlyvalid_wand$Type) 13) (forall ((arg0@@26 T@U) ) (! (= (type (Wand_readonly_for_writeonlyvalid_wand$ arg0@@26)) (FieldType PredicateType_Wand_readonly_for_writeonlyvalid_wand$Type FrameTypeType))
 :qid |funType:Wand_readonly_for_writeonlyvalid_wand$|
 :pattern ( (Wand_readonly_for_writeonlyvalid_wand$ arg0@@26))
))))
(assert (forall ((this$_4 T@U) ) (!  (=> (= (type this$_4) RefType) (IsPredicateField (Wand_readonly_for_writeonlyvalid_wand$ this$_4)))
 :qid |stdinbpl.672:15|
 :skolemid |41|
 :pattern ( (Wand_readonly_for_writeonlyvalid_wand$ this$_4))
)))
(assert  (and (= (Ctor PredicateType_WandDemo$MonitorInvariantType) 14) (forall ((arg0@@27 T@U) ) (! (= (type (WandDemo$MonitorInvariant arg0@@27)) (FieldType PredicateType_WandDemo$MonitorInvariantType FrameTypeType))
 :qid |funType:WandDemo$MonitorInvariant|
 :pattern ( (WandDemo$MonitorInvariant arg0@@27))
))))
(assert (forall ((this$_6 T@U) ) (!  (=> (= (type this$_6) RefType) (IsPredicateField (WandDemo$MonitorInvariant this$_6)))
 :qid |stdinbpl.788:15|
 :skolemid |47|
 :pattern ( (WandDemo$MonitorInvariant this$_6))
)))
(assert  (and (= (Ctor PredicateType_WandDemoreadonly$Type) 15) (forall ((arg0@@28 T@U) ) (! (= (type (WandDemoreadonly$ arg0@@28)) (FieldType PredicateType_WandDemoreadonly$Type FrameTypeType))
 :qid |funType:WandDemoreadonly$|
 :pattern ( (WandDemoreadonly$ arg0@@28))
))))
(assert (forall ((this$_7 T@U) ) (!  (=> (= (type this$_7) RefType) (IsPredicateField (WandDemoreadonly$ this$_7)))
 :qid |stdinbpl.837:15|
 :skolemid |53|
 :pattern ( (WandDemoreadonly$ this$_7))
)))
(assert  (and (= (Ctor PredicateType_WandDemowriteonly$Type) 16) (forall ((arg0@@29 T@U) ) (! (= (type (WandDemowriteonly$ arg0@@29)) (FieldType PredicateType_WandDemowriteonly$Type FrameTypeType))
 :qid |funType:WandDemowriteonly$|
 :pattern ( (WandDemowriteonly$ arg0@@29))
))))
(assert (forall ((this$_8 T@U) ) (!  (=> (= (type this$_8) RefType) (IsPredicateField (WandDemowriteonly$ this$_8)))
 :qid |stdinbpl.893:15|
 :skolemid |59|
 :pattern ( (WandDemowriteonly$ this$_8))
)))
(assert  (and (forall ((arg0@@30 T@U) (arg1@@9 T@U) ) (! (= (type (|Wand_readonly_for_writeonlyget_in_1$'| arg0@@30 arg1@@9)) RefType)
 :qid |funType:Wand_readonly_for_writeonlyget_in_1$'|
 :pattern ( (|Wand_readonly_for_writeonlyget_in_1$'| arg0@@30 arg1@@9))
)) (forall ((arg0@@31 T@U) ) (! (= (type (|Wand_readonly_for_writeonlyget_in_1$#triggerStateless| arg0@@31)) RefType)
 :qid |funType:Wand_readonly_for_writeonlyget_in_1$#triggerStateless|
 :pattern ( (|Wand_readonly_for_writeonlyget_in_1$#triggerStateless| arg0@@31))
))))
(assert (forall ((Heap@@2 T@U) (this$_1 T@U) ) (!  (=> (and (= (type Heap@@2) (MapType0Type RefType)) (= (type this$_1) RefType)) (dummyFunction (|Wand_readonly_for_writeonlyget_in_1$#triggerStateless| this$_1)))
 :qid |stdinbpl.281:15|
 :skolemid |23|
 :pattern ( (|Wand_readonly_for_writeonlyget_in_1$'| Heap@@2 this$_1))
)))
(assert  (and (forall ((arg0@@32 T@U) (arg1@@10 T@U) ) (! (= (type (|Wand_readonly_for_writeonlyget_out_1$'| arg0@@32 arg1@@10)) RefType)
 :qid |funType:Wand_readonly_for_writeonlyget_out_1$'|
 :pattern ( (|Wand_readonly_for_writeonlyget_out_1$'| arg0@@32 arg1@@10))
)) (forall ((arg0@@33 T@U) ) (! (= (type (|Wand_readonly_for_writeonlyget_out_1$#triggerStateless| arg0@@33)) RefType)
 :qid |funType:Wand_readonly_for_writeonlyget_out_1$#triggerStateless|
 :pattern ( (|Wand_readonly_for_writeonlyget_out_1$#triggerStateless| arg0@@33))
))))
(assert (forall ((Heap@@3 T@U) (this$_2 T@U) ) (!  (=> (and (= (type Heap@@3) (MapType0Type RefType)) (= (type this$_2) RefType)) (dummyFunction (|Wand_readonly_for_writeonlyget_out_1$#triggerStateless| this$_2)))
 :qid |stdinbpl.406:15|
 :skolemid |27|
 :pattern ( (|Wand_readonly_for_writeonlyget_out_1$'| Heap@@3 this$_2))
)))
(assert (forall ((Heap@@4 T@U) (this$_9 T@U) ) (!  (=> (and (= (type Heap@@4) (MapType0Type RefType)) (= (type this$_9) RefType)) (dummyFunction (int_2_U (|WandDemoget$#triggerStateless| this$_9))))
 :qid |stdinbpl.531:15|
 :skolemid |31|
 :pattern ( (|WandDemoget$'| Heap@@4 this$_9))
)))
(assert (forall ((Heap@@5 T@U) (this$@@0 T@U) ) (!  (=> (and (= (type Heap@@5) (MapType0Type RefType)) (= (type this$@@0) RefType)) (|Wand_readonly_for_writeonly$MonitorInvariant#everUsed| (Wand_readonly_for_writeonly$MonitorInvariant this$@@0)))
 :qid |stdinbpl.642:15|
 :skolemid |39|
 :pattern ( (|Wand_readonly_for_writeonly$MonitorInvariant#trigger| Heap@@5 (Wand_readonly_for_writeonly$MonitorInvariant this$@@0)))
)))
(assert (forall ((Heap@@6 T@U) (this$_4@@0 T@U) ) (!  (=> (and (= (type Heap@@6) (MapType0Type RefType)) (= (type this$_4@@0) RefType)) (|Wand_readonly_for_writeonlyvalid_wand$#everUsed| (Wand_readonly_for_writeonlyvalid_wand$ this$_4@@0)))
 :qid |stdinbpl.691:15|
 :skolemid |45|
 :pattern ( (|Wand_readonly_for_writeonlyvalid_wand$#trigger| Heap@@6 (Wand_readonly_for_writeonlyvalid_wand$ this$_4@@0)))
)))
(assert (forall ((Heap@@7 T@U) (this$_6@@0 T@U) ) (!  (=> (and (= (type Heap@@7) (MapType0Type RefType)) (= (type this$_6@@0) RefType)) (|WandDemo$MonitorInvariant#everUsed| (WandDemo$MonitorInvariant this$_6@@0)))
 :qid |stdinbpl.807:15|
 :skolemid |51|
 :pattern ( (|WandDemo$MonitorInvariant#trigger| Heap@@7 (WandDemo$MonitorInvariant this$_6@@0)))
)))
(assert (forall ((Heap@@8 T@U) (this$_7@@0 T@U) ) (!  (=> (and (= (type Heap@@8) (MapType0Type RefType)) (= (type this$_7@@0) RefType)) (|WandDemoreadonly$#everUsed| (WandDemoreadonly$ this$_7@@0)))
 :qid |stdinbpl.856:15|
 :skolemid |57|
 :pattern ( (|WandDemoreadonly$#trigger| Heap@@8 (WandDemoreadonly$ this$_7@@0)))
)))
(assert (forall ((Heap@@9 T@U) (this$_8@@0 T@U) ) (!  (=> (and (= (type Heap@@9) (MapType0Type RefType)) (= (type this$_8@@0) RefType)) (|WandDemowriteonly$#everUsed| (WandDemowriteonly$ this$_8@@0)))
 :qid |stdinbpl.912:15|
 :skolemid |63|
 :pattern ( (|WandDemowriteonly$#trigger| Heap@@9 (WandDemowriteonly$ this$_8@@0)))
)))
(assert (< NoPerm globalK$))
(assert (< globalK$ FullPerm))
(assert (forall ((Heap@@10 T@U) (ExhaleHeap@@1 T@U) (Mask@@2 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@10) (MapType0Type RefType)) (= (type ExhaleHeap@@1) (MapType0Type RefType))) (= (type Mask@@2) (MapType1Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@10 ExhaleHeap@@1 Mask@@2)) (U_2_bool (MapType0Select Heap@@10 o_1 $allocated))) (U_2_bool (MapType0Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.73:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@10 ExhaleHeap@@1 Mask@@2) (MapType0Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert (forall ((arg0@@34 T@U) (arg1@@11 T@U) ) (! (= (type (Wand_readonly_for_writeonlyget_in_1$ arg0@@34 arg1@@11)) RefType)
 :qid |funType:Wand_readonly_for_writeonlyget_in_1$|
 :pattern ( (Wand_readonly_for_writeonlyget_in_1$ arg0@@34 arg1@@11))
)))
(assert (forall ((Heap@@11 T@U) (this$_1@@0 T@U) ) (!  (=> (and (= (type Heap@@11) (MapType0Type RefType)) (= (type this$_1@@0) RefType)) (and (= (Wand_readonly_for_writeonlyget_in_1$ Heap@@11 this$_1@@0) (|Wand_readonly_for_writeonlyget_in_1$'| Heap@@11 this$_1@@0)) (dummyFunction (|Wand_readonly_for_writeonlyget_in_1$#triggerStateless| this$_1@@0))))
 :qid |stdinbpl.277:15|
 :skolemid |22|
 :pattern ( (Wand_readonly_for_writeonlyget_in_1$ Heap@@11 this$_1@@0))
)))
(assert (forall ((arg0@@35 T@U) (arg1@@12 T@U) ) (! (= (type (Wand_readonly_for_writeonlyget_out_1$ arg0@@35 arg1@@12)) RefType)
 :qid |funType:Wand_readonly_for_writeonlyget_out_1$|
 :pattern ( (Wand_readonly_for_writeonlyget_out_1$ arg0@@35 arg1@@12))
)))
(assert (forall ((Heap@@12 T@U) (this$_2@@0 T@U) ) (!  (=> (and (= (type Heap@@12) (MapType0Type RefType)) (= (type this$_2@@0) RefType)) (and (= (Wand_readonly_for_writeonlyget_out_1$ Heap@@12 this$_2@@0) (|Wand_readonly_for_writeonlyget_out_1$'| Heap@@12 this$_2@@0)) (dummyFunction (|Wand_readonly_for_writeonlyget_out_1$#triggerStateless| this$_2@@0))))
 :qid |stdinbpl.402:15|
 :skolemid |26|
 :pattern ( (Wand_readonly_for_writeonlyget_out_1$ Heap@@12 this$_2@@0))
)))
(assert (forall ((Heap@@13 T@U) (this$_9@@0 T@U) ) (!  (=> (and (= (type Heap@@13) (MapType0Type RefType)) (= (type this$_9@@0) RefType)) (and (= (WandDemoget$ Heap@@13 this$_9@@0) (|WandDemoget$'| Heap@@13 this$_9@@0)) (dummyFunction (int_2_U (|WandDemoget$#triggerStateless| this$_9@@0)))))
 :qid |stdinbpl.527:15|
 :skolemid |30|
 :pattern ( (WandDemoget$ Heap@@13 this$_9@@0))
)))
(assert (forall ((this$@@1 T@U) (this$2 T@U) ) (!  (=> (and (and (= (type this$@@1) RefType) (= (type this$2) RefType)) (= (Wand_readonly_for_writeonly$MonitorInvariant this$@@1) (Wand_readonly_for_writeonly$MonitorInvariant this$2))) (= this$@@1 this$2))
 :qid |stdinbpl.633:15|
 :skolemid |37|
 :pattern ( (Wand_readonly_for_writeonly$MonitorInvariant this$@@1) (Wand_readonly_for_writeonly$MonitorInvariant this$2))
)))
(assert (forall ((arg0@@36 T@U) ) (! (= (type (|Wand_readonly_for_writeonly$MonitorInvariant#sm| arg0@@36)) (FieldType PredicateType_Wand_readonly_for_writeonly$MonitorInvariantType (MapType1Type RefType boolType)))
 :qid |funType:Wand_readonly_for_writeonly$MonitorInvariant#sm|
 :pattern ( (|Wand_readonly_for_writeonly$MonitorInvariant#sm| arg0@@36))
)))
(assert (forall ((this$@@2 T@U) (this$2@@0 T@U) ) (!  (=> (and (and (= (type this$@@2) RefType) (= (type this$2@@0) RefType)) (= (|Wand_readonly_for_writeonly$MonitorInvariant#sm| this$@@2) (|Wand_readonly_for_writeonly$MonitorInvariant#sm| this$2@@0))) (= this$@@2 this$2@@0))
 :qid |stdinbpl.637:15|
 :skolemid |38|
 :pattern ( (|Wand_readonly_for_writeonly$MonitorInvariant#sm| this$@@2) (|Wand_readonly_for_writeonly$MonitorInvariant#sm| this$2@@0))
)))
(assert (forall ((this$_4@@1 T@U) (this$_42 T@U) ) (!  (=> (and (and (= (type this$_4@@1) RefType) (= (type this$_42) RefType)) (= (Wand_readonly_for_writeonlyvalid_wand$ this$_4@@1) (Wand_readonly_for_writeonlyvalid_wand$ this$_42))) (= this$_4@@1 this$_42))
 :qid |stdinbpl.682:15|
 :skolemid |43|
 :pattern ( (Wand_readonly_for_writeonlyvalid_wand$ this$_4@@1) (Wand_readonly_for_writeonlyvalid_wand$ this$_42))
)))
(assert (forall ((arg0@@37 T@U) ) (! (= (type (|Wand_readonly_for_writeonlyvalid_wand$#sm| arg0@@37)) (FieldType PredicateType_Wand_readonly_for_writeonlyvalid_wand$Type (MapType1Type RefType boolType)))
 :qid |funType:Wand_readonly_for_writeonlyvalid_wand$#sm|
 :pattern ( (|Wand_readonly_for_writeonlyvalid_wand$#sm| arg0@@37))
)))
(assert (forall ((this$_4@@2 T@U) (this$_42@@0 T@U) ) (!  (=> (and (and (= (type this$_4@@2) RefType) (= (type this$_42@@0) RefType)) (= (|Wand_readonly_for_writeonlyvalid_wand$#sm| this$_4@@2) (|Wand_readonly_for_writeonlyvalid_wand$#sm| this$_42@@0))) (= this$_4@@2 this$_42@@0))
 :qid |stdinbpl.686:15|
 :skolemid |44|
 :pattern ( (|Wand_readonly_for_writeonlyvalid_wand$#sm| this$_4@@2) (|Wand_readonly_for_writeonlyvalid_wand$#sm| this$_42@@0))
)))
(assert (forall ((this$_6@@1 T@U) (this$_62 T@U) ) (!  (=> (and (and (= (type this$_6@@1) RefType) (= (type this$_62) RefType)) (= (WandDemo$MonitorInvariant this$_6@@1) (WandDemo$MonitorInvariant this$_62))) (= this$_6@@1 this$_62))
 :qid |stdinbpl.798:15|
 :skolemid |49|
 :pattern ( (WandDemo$MonitorInvariant this$_6@@1) (WandDemo$MonitorInvariant this$_62))
)))
(assert (forall ((arg0@@38 T@U) ) (! (= (type (|WandDemo$MonitorInvariant#sm| arg0@@38)) (FieldType PredicateType_WandDemo$MonitorInvariantType (MapType1Type RefType boolType)))
 :qid |funType:WandDemo$MonitorInvariant#sm|
 :pattern ( (|WandDemo$MonitorInvariant#sm| arg0@@38))
)))
(assert (forall ((this$_6@@2 T@U) (this$_62@@0 T@U) ) (!  (=> (and (and (= (type this$_6@@2) RefType) (= (type this$_62@@0) RefType)) (= (|WandDemo$MonitorInvariant#sm| this$_6@@2) (|WandDemo$MonitorInvariant#sm| this$_62@@0))) (= this$_6@@2 this$_62@@0))
 :qid |stdinbpl.802:15|
 :skolemid |50|
 :pattern ( (|WandDemo$MonitorInvariant#sm| this$_6@@2) (|WandDemo$MonitorInvariant#sm| this$_62@@0))
)))
(assert (forall ((this$_7@@1 T@U) (this$_72 T@U) ) (!  (=> (and (and (= (type this$_7@@1) RefType) (= (type this$_72) RefType)) (= (WandDemoreadonly$ this$_7@@1) (WandDemoreadonly$ this$_72))) (= this$_7@@1 this$_72))
 :qid |stdinbpl.847:15|
 :skolemid |55|
 :pattern ( (WandDemoreadonly$ this$_7@@1) (WandDemoreadonly$ this$_72))
)))
(assert (forall ((arg0@@39 T@U) ) (! (= (type (|WandDemoreadonly$#sm| arg0@@39)) (FieldType PredicateType_WandDemoreadonly$Type (MapType1Type RefType boolType)))
 :qid |funType:WandDemoreadonly$#sm|
 :pattern ( (|WandDemoreadonly$#sm| arg0@@39))
)))
(assert (forall ((this$_7@@2 T@U) (this$_72@@0 T@U) ) (!  (=> (and (and (= (type this$_7@@2) RefType) (= (type this$_72@@0) RefType)) (= (|WandDemoreadonly$#sm| this$_7@@2) (|WandDemoreadonly$#sm| this$_72@@0))) (= this$_7@@2 this$_72@@0))
 :qid |stdinbpl.851:15|
 :skolemid |56|
 :pattern ( (|WandDemoreadonly$#sm| this$_7@@2) (|WandDemoreadonly$#sm| this$_72@@0))
)))
(assert (forall ((this$_8@@1 T@U) (this$_82 T@U) ) (!  (=> (and (and (= (type this$_8@@1) RefType) (= (type this$_82) RefType)) (= (WandDemowriteonly$ this$_8@@1) (WandDemowriteonly$ this$_82))) (= this$_8@@1 this$_82))
 :qid |stdinbpl.903:15|
 :skolemid |61|
 :pattern ( (WandDemowriteonly$ this$_8@@1) (WandDemowriteonly$ this$_82))
)))
(assert (forall ((arg0@@40 T@U) ) (! (= (type (|WandDemowriteonly$#sm| arg0@@40)) (FieldType PredicateType_WandDemowriteonly$Type (MapType1Type RefType boolType)))
 :qid |funType:WandDemowriteonly$#sm|
 :pattern ( (|WandDemowriteonly$#sm| arg0@@40))
)))
(assert (forall ((this$_8@@2 T@U) (this$_82@@0 T@U) ) (!  (=> (and (and (= (type this$_8@@2) RefType) (= (type this$_82@@0) RefType)) (= (|WandDemowriteonly$#sm| this$_8@@2) (|WandDemowriteonly$#sm| this$_82@@0))) (= this$_8@@2 this$_82@@0))
 :qid |stdinbpl.907:15|
 :skolemid |62|
 :pattern ( (|WandDemowriteonly$#sm| this$_8@@2) (|WandDemowriteonly$#sm| this$_82@@0))
)))
(assert (forall ((Heap@@14 T@U) (ExhaleHeap@@2 T@U) (Mask@@3 T@U) (o_1@@0 T@U) (f_2 T@U) ) (! (let ((B@@1 (FieldTypeInv1 (type f_2))))
(let ((A@@1 (FieldTypeInv0 (type f_2))))
 (=> (and (and (and (and (and (and (= (type Heap@@14) (MapType0Type RefType)) (= (type ExhaleHeap@@2) (MapType0Type RefType))) (= (type Mask@@3) (MapType1Type RefType realType))) (= (type o_1@@0) RefType)) (= (type f_2) (FieldType A@@1 B@@1))) (IdenticalOnKnownLocations Heap@@14 ExhaleHeap@@2 Mask@@3)) (HasDirectPerm Mask@@3 o_1@@0 f_2)) (= (MapType0Select Heap@@14 o_1@@0 f_2) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2)))))
 :qid |stdinbpl.42:22|
 :skolemid |1|
 :pattern ( (IdenticalOnKnownLocations Heap@@14 ExhaleHeap@@2 Mask@@3) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2))
)))
(assert  (and (= (type dummyHeap) (MapType0Type RefType)) (= (type ZeroMask) (MapType1Type RefType realType))))
(assert (state dummyHeap ZeroMask))
(assert (forall ((p T@U) (v_1 T@U) (w T@U) ) (! (let ((A@@2 (FieldTypeInv0 (type p))))
 (=> (and (and (= (type p) (FieldType A@@2 FrameTypeType)) (= (type v_1) FrameTypeType)) (= (type w) FrameTypeType)) (not (InsidePredicate p v_1 p w))))
 :qid |stdinbpl.175:19|
 :skolemid |21|
 :pattern ( (InsidePredicate p v_1 p w))
)))
(assert  (not (IsPredicateField old$methodPermission)))
(assert  (not (IsWandField old$methodPermission)))
(assert  (not (IsPredicateField joinable$)))
(assert  (not (IsWandField joinable$)))
(assert  (not (IsPredicateField Wand_readonly_for_writeonlylemma$)))
(assert  (not (IsWandField Wand_readonly_for_writeonlylemma$)))
(assert  (not (IsPredicateField Wand_readonly_for_writeonlyin_1$)))
(assert  (not (IsWandField Wand_readonly_for_writeonlyin_1$)))
(assert  (not (IsPredicateField Wand_readonly_for_writeonlyout_1$)))
(assert  (not (IsWandField Wand_readonly_for_writeonlyout_1$)))
(assert  (not (IsPredicateField Wand_readonly_for_writeonlythis_1$)))
(assert  (not (IsWandField Wand_readonly_for_writeonlythis_1$)))
(assert  (not (IsPredicateField WandDemox$)))
(assert  (not (IsWandField WandDemox$)))
(assert  (not (IsPredicateField old$Wand_readonly_for_writeonlyapply$0)))
(assert  (not (IsWandField old$Wand_readonly_for_writeonlyapply$0)))
(assert  (not (IsPredicateField par$Wand_readonly_for_writeonlyapply$this$_3)))
(assert  (not (IsWandField par$Wand_readonly_for_writeonlyapply$this$_3)))
(assert  (not (IsPredicateField par$Wand_readonly_for_writeonlyapply$k$)))
(assert  (not (IsWandField par$Wand_readonly_for_writeonlyapply$k$)))
(assert  (not (IsPredicateField par$Wand_readonly_for_writeonlyWand_readonly_for_writeonly_init$this$_5)))
(assert  (not (IsWandField par$Wand_readonly_for_writeonlyWand_readonly_for_writeonly_init$this$_5)))
(assert  (not (IsPredicateField par$Wand_readonly_for_writeonlyWand_readonly_for_writeonly_init$k$_1)))
(assert  (not (IsWandField par$Wand_readonly_for_writeonlyWand_readonly_for_writeonly_init$k$_1)))
(assert  (not (IsPredicateField par$WandDemoWandDemo_init$this$_10)))
(assert  (not (IsWandField par$WandDemoWandDemo_init$this$_10)))
(assert  (not (IsPredicateField par$WandDemoWandDemo_init$k$_2)))
(assert  (not (IsWandField par$WandDemoWandDemo_init$k$_2)))
(assert  (not (IsPredicateField par$WandDemoWand_readonly_for_writeonly_lemma_1$this$_11)))
(assert  (not (IsWandField par$WandDemoWand_readonly_for_writeonly_lemma_1$this$_11)))
(assert  (not (IsPredicateField par$WandDemoWand_readonly_for_writeonly_lemma_1$k$_3)))
(assert  (not (IsWandField par$WandDemoWand_readonly_for_writeonly_lemma_1$k$_3)))
(assert  (not (IsPredicateField par$WandDemoWand_readonly_for_writeonly_lemma_1$__this_1)))
(assert  (not (IsWandField par$WandDemoWand_readonly_for_writeonly_lemma_1$__this_1)))
(assert  (not (IsPredicateField par$WandDemoWand_readonly_for_writeonly_lemma_1$__in_1)))
(assert  (not (IsWandField par$WandDemoWand_readonly_for_writeonly_lemma_1$__in_1)))
(assert  (not (IsPredicateField par$WandDemoWand_readonly_for_writeonly_lemma_1$__out_1)))
(assert  (not (IsWandField par$WandDemoWand_readonly_for_writeonly_lemma_1$__out_1)))
(assert  (not (IsPredicateField par$WandDemoset_val$this$_12)))
(assert  (not (IsWandField par$WandDemoset_val$this$_12)))
(assert  (not (IsPredicateField par$WandDemoset_val$k$_4)))
(assert  (not (IsWandField par$WandDemoset_val$k$_4)))
(assert  (not (IsPredicateField par$WandDemoset_val$__v)))
(assert  (not (IsWandField par$WandDemoset_val$__v)))
(assert  (not (IsPredicateField par$WandDemodemo$this$_13)))
(assert  (not (IsWandField par$WandDemodemo$this$_13)))
(assert  (not (IsPredicateField par$WandDemodemo$k$_5)))
(assert  (not (IsWandField par$WandDemodemo$k$_5)))
(assert (forall ((Heap@@15 T@U) (ExhaleHeap@@3 T@U) (Mask@@4 T@U) ) (!  (=> (and (and (and (= (type Heap@@15) (MapType0Type RefType)) (= (type ExhaleHeap@@3) (MapType0Type RefType))) (= (type Mask@@4) (MapType1Type RefType realType))) (IdenticalOnKnownLocations Heap@@15 ExhaleHeap@@3 Mask@@4)) (succHeap Heap@@15 ExhaleHeap@@3))
 :qid |stdinbpl.83:15|
 :skolemid |10|
 :pattern ( (IdenticalOnKnownLocations Heap@@15 ExhaleHeap@@3 Mask@@4))
)))
(assert (forall ((Heap@@16 T@U) (Mask@@5 T@U) (this$_9@@1 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@16) (MapType0Type RefType)) (= (type Mask@@5) (MapType1Type RefType realType))) (= (type this$_9@@1) RefType)) (and (state Heap@@16 Mask@@5) (< AssumeFunctionsAbove 0))) (not (= this$_9@@1 null))) (= (WandDemoget$ Heap@@16 this$_9@@1) (U_2_int (MapType0Select Heap@@16 this$_9@@1 WandDemox$))))
 :qid |stdinbpl.537:15|
 :skolemid |32|
 :pattern ( (state Heap@@16 Mask@@5) (WandDemoget$ Heap@@16 this$_9@@1))
 :pattern ( (state Heap@@16 Mask@@5) (|WandDemoget$#triggerStateless| this$_9@@1) (|WandDemoreadonly$#trigger| Heap@@16 (WandDemoreadonly$ this$_9@@1)))
)))
(assert (forall ((Heap@@17 T@U) (Mask@@6 T@U) (this$_1@@1 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@17) (MapType0Type RefType)) (= (type Mask@@6) (MapType1Type RefType realType))) (= (type this$_1@@1) RefType)) (and (state Heap@@17 Mask@@6) (< AssumeFunctionsAbove 1))) (not (= this$_1@@1 null))) (= (Wand_readonly_for_writeonlyget_in_1$ Heap@@17 this$_1@@1) (MapType0Select Heap@@17 this$_1@@1 Wand_readonly_for_writeonlyin_1$)))
 :qid |stdinbpl.287:15|
 :skolemid |24|
 :pattern ( (state Heap@@17 Mask@@6) (Wand_readonly_for_writeonlyget_in_1$ Heap@@17 this$_1@@1))
 :pattern ( (state Heap@@17 Mask@@6) (|Wand_readonly_for_writeonlyget_in_1$#triggerStateless| this$_1@@1) (|Wand_readonly_for_writeonlyvalid_wand$#trigger| Heap@@17 (Wand_readonly_for_writeonlyvalid_wand$ this$_1@@1)))
)))
(assert (forall ((Heap@@18 T@U) (Mask@@7 T@U) (this$_2@@1 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@18) (MapType0Type RefType)) (= (type Mask@@7) (MapType1Type RefType realType))) (= (type this$_2@@1) RefType)) (and (state Heap@@18 Mask@@7) (< AssumeFunctionsAbove 2))) (not (= this$_2@@1 null))) (= (Wand_readonly_for_writeonlyget_out_1$ Heap@@18 this$_2@@1) (MapType0Select Heap@@18 this$_2@@1 Wand_readonly_for_writeonlyout_1$)))
 :qid |stdinbpl.412:15|
 :skolemid |28|
 :pattern ( (state Heap@@18 Mask@@7) (Wand_readonly_for_writeonlyget_out_1$ Heap@@18 this$_2@@1))
 :pattern ( (state Heap@@18 Mask@@7) (|Wand_readonly_for_writeonlyget_out_1$#triggerStateless| this$_2@@1) (|Wand_readonly_for_writeonlyvalid_wand$#trigger| Heap@@18 (Wand_readonly_for_writeonlyvalid_wand$ this$_2@@1)))
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
(assert  (and (forall ((arg0@@41 Real) (arg1@@13 T@U) ) (! (= (type (ConditionalFrame arg0@@41 arg1@@13)) FrameTypeType)
 :qid |funType:ConditionalFrame|
 :pattern ( (ConditionalFrame arg0@@41 arg1@@13))
)) (= (type EmptyFrame) FrameTypeType)))
(assert (forall ((p@@0 Real) (f_6 T@U) ) (!  (=> (= (type f_6) FrameTypeType) (= (ConditionalFrame p@@0 f_6) (ite (> p@@0 0.0) f_6 EmptyFrame)))
 :qid |stdinbpl.163:15|
 :skolemid |19|
 :pattern ( (ConditionalFrame p@@0 f_6))
)))
(assert (forall ((Mask@@8 T@U) (o_2@@0 T@U) (f_4@@0 T@U) ) (! (let ((B@@3 (FieldTypeInv1 (type f_4@@0))))
(let ((A@@4 (FieldTypeInv0 (type f_4@@0))))
 (=> (and (and (= (type Mask@@8) (MapType1Type RefType realType)) (= (type o_2@@0) RefType)) (= (type f_4@@0) (FieldType A@@4 B@@3))) (= (HasDirectPerm Mask@@8 o_2@@0 f_4@@0) (> (U_2_real (MapType1Select Mask@@8 o_2@@0 f_4@@0)) NoPerm)))))
 :qid |stdinbpl.133:22|
 :skolemid |17|
 :pattern ( (HasDirectPerm Mask@@8 o_2@@0 f_4@@0))
)))
(assert (forall ((o_2@@1 T@U) (f_4@@1 T@U) ) (! (let ((B@@4 (FieldTypeInv1 (type f_4@@1))))
(let ((A@@5 (FieldTypeInv0 (type f_4@@1))))
 (=> (and (= (type o_2@@1) RefType) (= (type f_4@@1) (FieldType A@@5 B@@4))) (= (U_2_real (MapType1Select ZeroMask o_2@@1 f_4@@1)) NoPerm))))
 :qid |stdinbpl.106:22|
 :skolemid |13|
 :pattern ( (MapType1Select ZeroMask o_2@@1 f_4@@1))
)))
(assert (forall ((Heap@@19 T@U) (ExhaleHeap@@4 T@U) (Mask@@9 T@U) (pm_f@@1 T@U) ) (! (let ((C@@1 (FieldTypeInv0 (type pm_f@@1))))
 (=> (and (and (and (and (and (= (type Heap@@19) (MapType0Type RefType)) (= (type ExhaleHeap@@4) (MapType0Type RefType))) (= (type Mask@@9) (MapType1Type RefType realType))) (= (type pm_f@@1) (FieldType C@@1 FrameTypeType))) (IdenticalOnKnownLocations Heap@@19 ExhaleHeap@@4 Mask@@9)) (and (HasDirectPerm Mask@@9 null pm_f@@1) (IsPredicateField pm_f@@1))) (forall ((o2 T@U) (f_2@@0 T@U) ) (! (let ((B@@5 (FieldTypeInv1 (type f_2@@0))))
(let ((A@@6 (FieldTypeInv0 (type f_2@@0))))
 (=> (and (and (= (type o2) RefType) (= (type f_2@@0) (FieldType A@@6 B@@5))) (U_2_bool (MapType1Select (MapType0Select Heap@@19 null (PredicateMaskField pm_f@@1)) o2 f_2@@0))) (= (MapType0Select Heap@@19 o2 f_2@@0) (MapType0Select ExhaleHeap@@4 o2 f_2@@0)))))
 :qid |stdinbpl.54:134|
 :skolemid |3|
 :pattern ( (MapType0Select ExhaleHeap@@4 o2 f_2@@0))
))))
 :qid |stdinbpl.52:19|
 :skolemid |4|
 :pattern ( (IdenticalOnKnownLocations Heap@@19 ExhaleHeap@@4 Mask@@9) (IsPredicateField pm_f@@1))
)))
(assert (forall ((Heap@@20 T@U) (ExhaleHeap@@5 T@U) (Mask@@10 T@U) (pm_f@@2 T@U) ) (! (let ((C@@2 (FieldTypeInv0 (type pm_f@@2))))
 (=> (and (and (and (and (and (= (type Heap@@20) (MapType0Type RefType)) (= (type ExhaleHeap@@5) (MapType0Type RefType))) (= (type Mask@@10) (MapType1Type RefType realType))) (= (type pm_f@@2) (FieldType C@@2 FrameTypeType))) (IdenticalOnKnownLocations Heap@@20 ExhaleHeap@@5 Mask@@10)) (and (HasDirectPerm Mask@@10 null pm_f@@2) (IsWandField pm_f@@2))) (forall ((o2@@0 T@U) (f_2@@1 T@U) ) (! (let ((B@@6 (FieldTypeInv1 (type f_2@@1))))
(let ((A@@7 (FieldTypeInv0 (type f_2@@1))))
 (=> (and (and (= (type o2@@0) RefType) (= (type f_2@@1) (FieldType A@@7 B@@6))) (U_2_bool (MapType1Select (MapType0Select Heap@@20 null (WandMaskField pm_f@@2)) o2@@0 f_2@@1))) (= (MapType0Select Heap@@20 o2@@0 f_2@@1) (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1)))))
 :qid |stdinbpl.67:129|
 :skolemid |6|
 :pattern ( (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1))
))))
 :qid |stdinbpl.65:19|
 :skolemid |7|
 :pattern ( (IdenticalOnKnownLocations Heap@@20 ExhaleHeap@@5 Mask@@10) (IsWandField pm_f@@2))
)))
(assert (forall ((this$@@3 T@U) ) (!  (=> (= (type this$@@3) RefType) (= (getPredWandId (Wand_readonly_for_writeonly$MonitorInvariant this$@@3)) 0))
 :qid |stdinbpl.627:15|
 :skolemid |36|
 :pattern ( (Wand_readonly_for_writeonly$MonitorInvariant this$@@3))
)))
(assert (forall ((this$_4@@3 T@U) ) (!  (=> (= (type this$_4@@3) RefType) (= (getPredWandId (Wand_readonly_for_writeonlyvalid_wand$ this$_4@@3)) 1))
 :qid |stdinbpl.676:15|
 :skolemid |42|
 :pattern ( (Wand_readonly_for_writeonlyvalid_wand$ this$_4@@3))
)))
(assert (forall ((this$_6@@3 T@U) ) (!  (=> (= (type this$_6@@3) RefType) (= (getPredWandId (WandDemo$MonitorInvariant this$_6@@3)) 2))
 :qid |stdinbpl.792:15|
 :skolemid |48|
 :pattern ( (WandDemo$MonitorInvariant this$_6@@3))
)))
(assert (forall ((this$_7@@3 T@U) ) (!  (=> (= (type this$_7@@3) RefType) (= (getPredWandId (WandDemoreadonly$ this$_7@@3)) 3))
 :qid |stdinbpl.841:15|
 :skolemid |54|
 :pattern ( (WandDemoreadonly$ this$_7@@3))
)))
(assert (forall ((this$_8@@3 T@U) ) (!  (=> (= (type this$_8@@3) RefType) (= (getPredWandId (WandDemowriteonly$ this$_8@@3)) 4))
 :qid |stdinbpl.897:15|
 :skolemid |60|
 :pattern ( (WandDemowriteonly$ this$_8@@3))
)))
(assert (forall ((Mask@@11 T@U) (o_2@@2 T@U) (f_4@@2 T@U) ) (! (let ((B@@7 (FieldTypeInv1 (type f_4@@2))))
(let ((A@@8 (FieldTypeInv0 (type f_4@@2))))
 (=> (and (and (and (= (type Mask@@11) (MapType1Type RefType realType)) (= (type o_2@@2) RefType)) (= (type f_4@@2) (FieldType A@@8 B@@7))) (GoodMask Mask@@11)) (and (>= (U_2_real (MapType1Select Mask@@11 o_2@@2 f_4@@2)) NoPerm) (=> (and (and (GoodMask Mask@@11) (not (IsPredicateField f_4@@2))) (not (IsWandField f_4@@2))) (<= (U_2_real (MapType1Select Mask@@11 o_2@@2 f_4@@2)) FullPerm))))))
 :qid |stdinbpl.128:22|
 :skolemid |16|
 :pattern ( (GoodMask Mask@@11) (MapType1Select Mask@@11 o_2@@2 f_4@@2))
)))
(assert (forall ((arg0@@42 T@U) (arg1@@14 T@U) ) (! (= (type (|Wand_readonly_for_writeonlyget_in_1$#frame| arg0@@42 arg1@@14)) RefType)
 :qid |funType:Wand_readonly_for_writeonlyget_in_1$#frame|
 :pattern ( (|Wand_readonly_for_writeonlyget_in_1$#frame| arg0@@42 arg1@@14))
)))
(assert (forall ((Heap@@21 T@U) (Mask@@12 T@U) (this$_1@@2 T@U) ) (!  (=> (and (and (and (= (type Heap@@21) (MapType0Type RefType)) (= (type Mask@@12) (MapType1Type RefType realType))) (= (type this$_1@@2) RefType)) (state Heap@@21 Mask@@12)) (= (|Wand_readonly_for_writeonlyget_in_1$'| Heap@@21 this$_1@@2) (|Wand_readonly_for_writeonlyget_in_1$#frame| (MapType0Select Heap@@21 null (Wand_readonly_for_writeonlyvalid_wand$ this$_1@@2)) this$_1@@2)))
 :qid |stdinbpl.294:15|
 :skolemid |25|
 :pattern ( (state Heap@@21 Mask@@12) (|Wand_readonly_for_writeonlyget_in_1$'| Heap@@21 this$_1@@2))
)))
(assert (forall ((arg0@@43 T@U) (arg1@@15 T@U) ) (! (= (type (|Wand_readonly_for_writeonlyget_out_1$#frame| arg0@@43 arg1@@15)) RefType)
 :qid |funType:Wand_readonly_for_writeonlyget_out_1$#frame|
 :pattern ( (|Wand_readonly_for_writeonlyget_out_1$#frame| arg0@@43 arg1@@15))
)))
(assert (forall ((Heap@@22 T@U) (Mask@@13 T@U) (this$_2@@2 T@U) ) (!  (=> (and (and (and (= (type Heap@@22) (MapType0Type RefType)) (= (type Mask@@13) (MapType1Type RefType realType))) (= (type this$_2@@2) RefType)) (state Heap@@22 Mask@@13)) (= (|Wand_readonly_for_writeonlyget_out_1$'| Heap@@22 this$_2@@2) (|Wand_readonly_for_writeonlyget_out_1$#frame| (MapType0Select Heap@@22 null (Wand_readonly_for_writeonlyvalid_wand$ this$_2@@2)) this$_2@@2)))
 :qid |stdinbpl.419:15|
 :skolemid |29|
 :pattern ( (state Heap@@22 Mask@@13) (|Wand_readonly_for_writeonlyget_out_1$'| Heap@@22 this$_2@@2))
)))
(assert (forall ((Heap@@23 T@U) (Mask@@14 T@U) (this$_9@@2 T@U) ) (!  (=> (and (and (and (= (type Heap@@23) (MapType0Type RefType)) (= (type Mask@@14) (MapType1Type RefType realType))) (= (type this$_9@@2) RefType)) (state Heap@@23 Mask@@14)) (= (|WandDemoget$'| Heap@@23 this$_9@@2) (|WandDemoget$#frame| (MapType0Select Heap@@23 null (WandDemoreadonly$ this$_9@@2)) this$_9@@2)))
 :qid |stdinbpl.544:15|
 :skolemid |33|
 :pattern ( (state Heap@@23 Mask@@14) (|WandDemoget$'| Heap@@23 this$_9@@2))
)))
(assert (forall ((o T@U) (f T@U) (Heap@@24 T@U) ) (!  (=> (and (and (and (= (type o) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap@@24) (MapType0Type RefType))) (U_2_bool (MapType0Select Heap@@24 o $allocated))) (U_2_bool (MapType0Select Heap@@24 (MapType0Select Heap@@24 o f) $allocated)))
 :qid |stdinbpl.31:15|
 :skolemid |0|
 :pattern ( (MapType0Select Heap@@24 o f))
)))
(assert (forall ((this$@@4 T@U) ) (!  (=> (= (type this$@@4) RefType) (= (PredicateMaskField (Wand_readonly_for_writeonly$MonitorInvariant this$@@4)) (|Wand_readonly_for_writeonly$MonitorInvariant#sm| this$@@4)))
 :qid |stdinbpl.619:15|
 :skolemid |34|
 :pattern ( (PredicateMaskField (Wand_readonly_for_writeonly$MonitorInvariant this$@@4)))
)))
(assert (forall ((this$_4@@4 T@U) ) (!  (=> (= (type this$_4@@4) RefType) (= (PredicateMaskField (Wand_readonly_for_writeonlyvalid_wand$ this$_4@@4)) (|Wand_readonly_for_writeonlyvalid_wand$#sm| this$_4@@4)))
 :qid |stdinbpl.668:15|
 :skolemid |40|
 :pattern ( (PredicateMaskField (Wand_readonly_for_writeonlyvalid_wand$ this$_4@@4)))
)))
(assert (forall ((this$_6@@4 T@U) ) (!  (=> (= (type this$_6@@4) RefType) (= (PredicateMaskField (WandDemo$MonitorInvariant this$_6@@4)) (|WandDemo$MonitorInvariant#sm| this$_6@@4)))
 :qid |stdinbpl.784:15|
 :skolemid |46|
 :pattern ( (PredicateMaskField (WandDemo$MonitorInvariant this$_6@@4)))
)))
(assert (forall ((this$_7@@4 T@U) ) (!  (=> (= (type this$_7@@4) RefType) (= (PredicateMaskField (WandDemoreadonly$ this$_7@@4)) (|WandDemoreadonly$#sm| this$_7@@4)))
 :qid |stdinbpl.833:15|
 :skolemid |52|
 :pattern ( (PredicateMaskField (WandDemoreadonly$ this$_7@@4)))
)))
(assert (forall ((this$_8@@4 T@U) ) (!  (=> (= (type this$_8@@4) RefType) (= (PredicateMaskField (WandDemowriteonly$ this$_8@@4)) (|WandDemowriteonly$#sm| this$_8@@4)))
 :qid |stdinbpl.889:15|
 :skolemid |58|
 :pattern ( (PredicateMaskField (WandDemowriteonly$ this$_8@@4)))
)))
(assert (forall ((Heap@@25 T@U) (o@@0 T@U) (f_3 T@U) (v T@U) ) (! (let ((B@@8 (type v)))
(let ((A@@9 (FieldTypeInv0 (type f_3))))
 (=> (and (and (= (type Heap@@25) (MapType0Type RefType)) (= (type o@@0) RefType)) (= (type f_3) (FieldType A@@9 B@@8))) (succHeap Heap@@25 (MapType0Store Heap@@25 o@@0 f_3 v)))))
 :qid |stdinbpl.78:22|
 :skolemid |9|
 :pattern ( (MapType0Store Heap@@25 o@@0 f_3 v))
)))
(assert (= (type ZeroPMask) (MapType1Type RefType boolType)))
(assert (forall ((o_2@@3 T@U) (f_4@@3 T@U) ) (! (let ((B@@9 (FieldTypeInv1 (type f_4@@3))))
(let ((A@@10 (FieldTypeInv0 (type f_4@@3))))
 (=> (and (= (type o_2@@3) RefType) (= (type f_4@@3) (FieldType A@@10 B@@9))) (not (U_2_bool (MapType1Select ZeroPMask o_2@@3 f_4@@3))))))
 :qid |stdinbpl.112:22|
 :skolemid |14|
 :pattern ( (MapType1Select ZeroPMask o_2@@3 f_4@@3))
)))
(assert (forall ((p@@1 T@U) (v_1@@0 T@U) (q T@U) (w@@0 T@U) (r T@U) (u T@U) ) (! (let ((C@@3 (FieldTypeInv0 (type r))))
(let ((B@@10 (FieldTypeInv0 (type q))))
(let ((A@@11 (FieldTypeInv0 (type p@@1))))
 (=> (and (and (and (and (and (and (= (type p@@1) (FieldType A@@11 FrameTypeType)) (= (type v_1@@0) FrameTypeType)) (= (type q) (FieldType B@@10 FrameTypeType))) (= (type w@@0) FrameTypeType)) (= (type r) (FieldType C@@3 FrameTypeType))) (= (type u) FrameTypeType)) (and (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))) (InsidePredicate p@@1 v_1@@0 r u)))))
 :qid |stdinbpl.170:25|
 :skolemid |20|
 :pattern ( (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun Heap@@26 () T@U)
(declare-fun this$_9@@3 () T@U)
(declare-fun wildcard@0 () Real)
(declare-fun Mask@0 () T@U)
(declare-fun FrameFragment (T@U) T@U)
(declare-fun wildcard@1 () Real)
(declare-fun UnfoldingMask@0 () T@U)
(declare-fun wildcard@2 () Real)
(declare-fun UnfoldingMask@1 () T@U)
(declare-fun wildcard () Real)
(assert  (and (and (and (and (and (= (type Heap@@26) (MapType0Type RefType)) (= (type this$_9@@3) RefType)) (= (type Mask@0) (MapType1Type RefType realType))) (forall ((arg0@@44 T@U) ) (! (= (type (FrameFragment arg0@@44)) FrameTypeType)
 :qid |funType:FrameFragment|
 :pattern ( (FrameFragment arg0@@44))
))) (= (type UnfoldingMask@0) (MapType1Type RefType realType))) (= (type UnfoldingMask@1) (MapType1Type RefType realType))))
(set-info :boogie-vc-id |WandDemoget$#definedness|)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 4) (let ((anon0_correct  (=> (state Heap@@26 ZeroMask) (=> (and (U_2_bool (MapType0Select Heap@@26 this$_9@@3 $allocated)) (= AssumeFunctionsAbove 0)) (=> (and (and (and (not (= this$_9@@3 null)) (state Heap@@26 ZeroMask)) (and (> wildcard@0 NoPerm) (= Mask@0 (MapType1Store ZeroMask null (WandDemoreadonly$ this$_9@@3) (real_2_U (+ (U_2_real (MapType1Select ZeroMask null (WandDemoreadonly$ this$_9@@3))) wildcard@0)))))) (and (and (state Heap@@26 Mask@0) (state Heap@@26 Mask@0)) (and (|WandDemoreadonly$#trigger| Heap@@26 (WandDemoreadonly$ this$_9@@3)) (= (MapType0Select Heap@@26 null (WandDemoreadonly$ this$_9@@3)) (FrameFragment (MapType0Select Heap@@26 this$_9@@3 WandDemox$)))))) (and (=> (= (ControlFlow 0 2) (- 0 3)) (> (U_2_real (MapType1Select Mask@0 null (WandDemoreadonly$ this$_9@@3))) NoPerm)) (=> (> (U_2_real (MapType1Select Mask@0 null (WandDemoreadonly$ this$_9@@3))) NoPerm) (=> (> wildcard@1 NoPerm) (=> (and (and (and (< wildcard@1 (U_2_real (MapType1Select Mask@0 null (WandDemoreadonly$ this$_9@@3)))) (= UnfoldingMask@0 (MapType1Store Mask@0 null (WandDemoreadonly$ this$_9@@3) (real_2_U (- (U_2_real (MapType1Select Mask@0 null (WandDemoreadonly$ this$_9@@3))) wildcard@1))))) (and (> wildcard@2 NoPerm) (not (= this$_9@@3 null)))) (and (and (= UnfoldingMask@1 (MapType1Store UnfoldingMask@0 this$_9@@3 WandDemox$ (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@0 this$_9@@3 WandDemox$)) wildcard@2)))) (state Heap@@26 UnfoldingMask@1)) (and (state Heap@@26 UnfoldingMask@1) (= (ControlFlow 0 2) (- 0 1))))) (HasDirectPerm UnfoldingMask@1 this$_9@@3 WandDemox$))))))))))
(let ((PreconditionGeneratedEntry_correct  (=> (and (and (> wildcard NoPerm) true) (= (ControlFlow 0 4) 2)) anon0_correct)))
PreconditionGeneratedEntry_correct)))
))
(check-sat)
(pop 1)
; Valid
(get-info :rlimit)
