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
(declare-fun state (T@U T@U) Bool)
(declare-fun MapType1Type (T@T T@T) T@T)
(declare-fun GoodMask (T@U) Bool)
(declare-fun MapType1TypeInv0 (T@T) T@T)
(declare-fun MapType1TypeInv1 (T@T) T@T)
(declare-fun MapType1Select (T@U T@U T@U) T@U)
(declare-fun MapType1Store (T@U T@U T@U T@U) T@U)
(declare-fun |lenBad'| (T@U T@U T@U) Int)
(declare-fun ListDomainTypeType (T@T) T@T)
(declare-fun ValDomainTypeType () T@T)
(declare-fun dummyFunction (T@U) Bool)
(declare-fun |lenBad#triggerStateless| (T@U T@U) Int)
(declare-fun ListDomainTypeTypeInv0 (T@T) T@T)
(declare-fun IdenticalOnKnownLocations (T@U T@U T@U) Bool)
(declare-fun IsPredicateField (T@U) Bool)
(declare-fun null () T@U)
(declare-fun PredicateMaskField (T@U) T@U)
(declare-fun FrameTypeType () T@T)
(declare-fun HasDirectPerm (T@U T@U T@U) Bool)
(declare-fun IsWandField (T@U) Bool)
(declare-fun WandMaskField (T@U) T@U)
(declare-fun |lenBad#frame| (T@U T@U T@U) Int)
(declare-fun EmptyFrame () T@U)
(declare-fun |len'| (T@U T@U) Int)
(declare-fun |len#triggerStateless| (T@U) Int)
(declare-fun |len2'| (T@U T@U) Int)
(declare-fun |len2#triggerStateless| (T@U) Int)
(declare-fun |lenBad2'| (T@U T@U) Int)
(declare-fun |lenBad2#triggerStateless| (T@U) Int)
(declare-fun List_tag (T@U) Int)
(declare-fun get_List_value (T@U) T@U)
(declare-fun get_List_tail (T@U) T@U)
(declare-fun Nil (T@T) T@U)
(declare-fun Cons (T@U T@U) T@U)
(declare-fun AssumeFunctionsAbove () Int)
(declare-fun |lenBad2#trigger| (T@U T@U) Bool)
(declare-fun |len2#trigger| (T@U T@U) Bool)
(declare-fun |len#trigger| (T@U T@U) Bool)
(declare-fun $allocated () T@U)
(declare-fun NormalFieldType () T@T)
(declare-fun len (T@U T@U) Int)
(declare-fun len2 (T@U T@U) Int)
(declare-fun lenBad2 (T@U T@U) Int)
(declare-fun dummyHeap () T@U)
(declare-fun ZeroMask () T@U)
(declare-fun InsidePredicate (T@U T@U T@U T@U) Bool)
(declare-fun sumMask (T@U T@U T@U) Bool)
(declare-fun ConditionalFrame (Real T@U) T@U)
(declare-fun NoPerm () Real)
(declare-fun lenBad (T@U T@U T@U) Int)
(declare-fun FullPerm () Real)
(declare-fun |len#frame| (T@U T@U) Int)
(declare-fun |len2#frame| (T@U T@U) Int)
(declare-fun |lenBad2#frame| (T@U T@U) Int)
(declare-fun ZeroPMask () T@U)
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
(assert  (and (and (and (and (and (and (forall ((arg0@@18 T@T) (arg1@@4 T@T) ) (! (= (Ctor (MapType1Type arg0@@18 arg1@@4)) 9)
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
(assert  (and (and (forall ((arg0@@23 T@T) ) (! (= (Ctor (ListDomainTypeType arg0@@23)) 10)
 :qid |ctor:ListDomainTypeType|
)) (forall ((arg0@@24 T@T) ) (! (= (ListDomainTypeTypeInv0 (ListDomainTypeType arg0@@24)) arg0@@24)
 :qid |typeInv:ListDomainTypeTypeInv0|
 :pattern ( (ListDomainTypeType arg0@@24))
))) (= (Ctor ValDomainTypeType) 11)))
(assert (forall ((Heap@@0 T@U) (l T@U) (v_2 T@U) ) (!  (=> (and (and (= (type Heap@@0) (MapType0Type RefType)) (= (type l) (ListDomainTypeType ValDomainTypeType))) (= (type v_2) ValDomainTypeType)) (dummyFunction (int_2_U (|lenBad#triggerStateless| l v_2))))
 :qid |stdinbpl.428:15|
 :skolemid |38|
 :pattern ( (|lenBad'| Heap@@0 l v_2))
)))
(assert  (and (and (= (Ctor FrameTypeType) 12) (= (type null) RefType)) (forall ((arg0@@25 T@U) ) (! (let ((A (FieldTypeInv0 (type arg0@@25))))
(= (type (PredicateMaskField arg0@@25)) (FieldType A (MapType1Type RefType boolType))))
 :qid |funType:PredicateMaskField|
 :pattern ( (PredicateMaskField arg0@@25))
))))
(assert (forall ((Heap@@1 T@U) (ExhaleHeap T@U) (Mask@@0 T@U) (pm_f T@U) ) (! (let ((C (FieldTypeInv0 (type pm_f))))
 (=> (and (and (and (and (and (= (type Heap@@1) (MapType0Type RefType)) (= (type ExhaleHeap) (MapType0Type RefType))) (= (type Mask@@0) (MapType1Type RefType realType))) (= (type pm_f) (FieldType C FrameTypeType))) (IdenticalOnKnownLocations Heap@@1 ExhaleHeap Mask@@0)) (and (HasDirectPerm Mask@@0 null pm_f) (IsPredicateField pm_f))) (= (MapType0Select Heap@@1 null (PredicateMaskField pm_f)) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))))
 :qid |stdinbpl.47:19|
 :skolemid |2|
 :pattern ( (IdenticalOnKnownLocations Heap@@1 ExhaleHeap Mask@@0) (IsPredicateField pm_f) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))
)))
(assert (forall ((arg0@@26 T@U) ) (! (let ((A@@0 (FieldTypeInv0 (type arg0@@26))))
(= (type (WandMaskField arg0@@26)) (FieldType A@@0 (MapType1Type RefType boolType))))
 :qid |funType:WandMaskField|
 :pattern ( (WandMaskField arg0@@26))
)))
(assert (forall ((Heap@@2 T@U) (ExhaleHeap@@0 T@U) (Mask@@1 T@U) (pm_f@@0 T@U) ) (! (let ((C@@0 (FieldTypeInv0 (type pm_f@@0))))
 (=> (and (and (and (and (and (= (type Heap@@2) (MapType0Type RefType)) (= (type ExhaleHeap@@0) (MapType0Type RefType))) (= (type Mask@@1) (MapType1Type RefType realType))) (= (type pm_f@@0) (FieldType C@@0 FrameTypeType))) (IdenticalOnKnownLocations Heap@@2 ExhaleHeap@@0 Mask@@1)) (and (HasDirectPerm Mask@@1 null pm_f@@0) (IsWandField pm_f@@0))) (= (MapType0Select Heap@@2 null (WandMaskField pm_f@@0)) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))))
 :qid |stdinbpl.60:19|
 :skolemid |5|
 :pattern ( (IdenticalOnKnownLocations Heap@@2 ExhaleHeap@@0 Mask@@1) (IsWandField pm_f@@0) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))
)))
(assert (= (type EmptyFrame) FrameTypeType))
(assert (forall ((Heap@@3 T@U) (Mask@@2 T@U) (l@@0 T@U) (v_2@@0 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@3) (MapType0Type RefType)) (= (type Mask@@2) (MapType1Type RefType realType))) (= (type l@@0) (ListDomainTypeType ValDomainTypeType))) (= (type v_2@@0) ValDomainTypeType)) (state Heap@@3 Mask@@2)) (= (|lenBad'| Heap@@3 l@@0 v_2@@0) (|lenBad#frame| EmptyFrame l@@0 v_2@@0)))
 :qid |stdinbpl.441:15|
 :skolemid |40|
 :pattern ( (state Heap@@3 Mask@@2) (|lenBad'| Heap@@3 l@@0 v_2@@0))
)))
(assert (forall ((Heap@@4 T@U) (l@@1 T@U) ) (!  (=> (and (= (type Heap@@4) (MapType0Type RefType)) (= (type l@@1) (ListDomainTypeType ValDomainTypeType))) (dummyFunction (int_2_U (|len#triggerStateless| l@@1))))
 :qid |stdinbpl.271:15|
 :skolemid |28|
 :pattern ( (|len'| Heap@@4 l@@1))
)))
(assert (forall ((Heap@@5 T@U) (l@@2 T@U) ) (!  (=> (and (= (type Heap@@5) (MapType0Type RefType)) (= (type l@@2) (ListDomainTypeType ValDomainTypeType))) (dummyFunction (int_2_U (|len2#triggerStateless| l@@2))))
 :qid |stdinbpl.348:15|
 :skolemid |33|
 :pattern ( (|len2'| Heap@@5 l@@2))
)))
(assert (forall ((Heap@@6 T@U) (l@@3 T@U) ) (!  (=> (and (= (type Heap@@6) (MapType0Type RefType)) (= (type l@@3) (ListDomainTypeType ValDomainTypeType))) (dummyFunction (int_2_U (|lenBad2#triggerStateless| l@@3))))
 :qid |stdinbpl.502:15|
 :skolemid |43|
 :pattern ( (|lenBad2'| Heap@@6 l@@3))
)))
(assert  (and (and (and (forall ((arg0@@27 T@U) ) (! (let ((V (ListDomainTypeTypeInv0 (type arg0@@27))))
(= (type (get_List_value arg0@@27)) V))
 :qid |funType:get_List_value|
 :pattern ( (get_List_value arg0@@27))
)) (forall ((arg0@@28 T@U) ) (! (let ((V@@0 (ListDomainTypeTypeInv0 (type arg0@@28))))
(= (type (get_List_tail arg0@@28)) (ListDomainTypeType V@@0)))
 :qid |funType:get_List_tail|
 :pattern ( (get_List_tail arg0@@28))
))) (forall ((V@@1 T@T) ) (! (= (type (Nil V@@1)) (ListDomainTypeType V@@1))
 :qid |funType:Nil|
 :pattern ( (Nil V@@1))
))) (forall ((arg0@@29 T@U) (arg1@@9 T@U) ) (! (let ((V@@2 (type arg0@@29)))
(= (type (Cons arg0@@29 arg1@@9)) (ListDomainTypeType V@@2)))
 :qid |funType:Cons|
 :pattern ( (Cons arg0@@29 arg1@@9))
))))
(assert (forall ((t_2 T@U) ) (! (let ((V@@3 (ListDomainTypeTypeInv0 (type t_2))))
 (=> (= (type t_2) (ListDomainTypeType V@@3)) (or (= t_2 (Nil V@@3)) (= t_2 (Cons (get_List_value t_2) (get_List_tail t_2))))))
 :qid |stdinbpl.255:19|
 :skolemid |26|
 :pattern ( (List_tag t_2))
 :pattern ( (get_List_value t_2))
 :pattern ( (get_List_tail t_2))
)))
(assert (forall ((Heap@@7 T@U) (Mask@@3 T@U) (l@@4 T@U) ) (!  (=> (and (and (and (= (type Heap@@7) (MapType0Type RefType)) (= (type Mask@@3) (MapType1Type RefType realType))) (= (type l@@4) (ListDomainTypeType ValDomainTypeType))) (and (state Heap@@7 Mask@@3) (or (< AssumeFunctionsAbove 0) (|lenBad2#trigger| EmptyFrame l@@4)))) (>= (|lenBad2'| Heap@@7 l@@4) 0))
 :qid |stdinbpl.521:15|
 :skolemid |46|
 :pattern ( (state Heap@@7 Mask@@3) (|lenBad2'| Heap@@7 l@@4))
)))
(assert (forall ((Heap@@8 T@U) (Mask@@4 T@U) (l@@5 T@U) ) (!  (=> (and (and (and (= (type Heap@@8) (MapType0Type RefType)) (= (type Mask@@4) (MapType1Type RefType realType))) (= (type l@@5) (ListDomainTypeType ValDomainTypeType))) (and (state Heap@@8 Mask@@4) (or (< AssumeFunctionsAbove 1) (|len2#trigger| EmptyFrame l@@5)))) (>= (|len2'| Heap@@8 l@@5) 0))
 :qid |stdinbpl.367:15|
 :skolemid |36|
 :pattern ( (state Heap@@8 Mask@@4) (|len2'| Heap@@8 l@@5))
)))
(assert (forall ((Heap@@9 T@U) (Mask@@5 T@U) (l@@6 T@U) ) (!  (=> (and (and (and (= (type Heap@@9) (MapType0Type RefType)) (= (type Mask@@5) (MapType1Type RefType realType))) (= (type l@@6) (ListDomainTypeType ValDomainTypeType))) (and (state Heap@@9 Mask@@5) (or (< AssumeFunctionsAbove 2) (|len#trigger| EmptyFrame l@@6)))) (>= (|len'| Heap@@9 l@@6) 0))
 :qid |stdinbpl.290:15|
 :skolemid |31|
 :pattern ( (state Heap@@9 Mask@@5) (|len'| Heap@@9 l@@6))
)))
(assert  (and (= (Ctor NormalFieldType) 13) (= (type $allocated) (FieldType NormalFieldType boolType))))
(assert (forall ((Heap@@10 T@U) (ExhaleHeap@@1 T@U) (Mask@@6 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@10) (MapType0Type RefType)) (= (type ExhaleHeap@@1) (MapType0Type RefType))) (= (type Mask@@6) (MapType1Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@10 ExhaleHeap@@1 Mask@@6)) (U_2_bool (MapType0Select Heap@@10 o_1 $allocated))) (U_2_bool (MapType0Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.73:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@10 ExhaleHeap@@1 Mask@@6) (MapType0Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert (forall ((Heap@@11 T@U) (l@@7 T@U) ) (!  (=> (and (= (type Heap@@11) (MapType0Type RefType)) (= (type l@@7) (ListDomainTypeType ValDomainTypeType))) (and (= (len Heap@@11 l@@7) (|len'| Heap@@11 l@@7)) (dummyFunction (int_2_U (|len#triggerStateless| l@@7)))))
 :qid |stdinbpl.267:15|
 :skolemid |27|
 :pattern ( (len Heap@@11 l@@7))
)))
(assert (forall ((Heap@@12 T@U) (l@@8 T@U) ) (!  (=> (and (= (type Heap@@12) (MapType0Type RefType)) (= (type l@@8) (ListDomainTypeType ValDomainTypeType))) (and (= (len2 Heap@@12 l@@8) (|len2'| Heap@@12 l@@8)) (dummyFunction (int_2_U (|len2#triggerStateless| l@@8)))))
 :qid |stdinbpl.344:15|
 :skolemid |32|
 :pattern ( (len2 Heap@@12 l@@8))
)))
(assert (forall ((Heap@@13 T@U) (l@@9 T@U) ) (!  (=> (and (= (type Heap@@13) (MapType0Type RefType)) (= (type l@@9) (ListDomainTypeType ValDomainTypeType))) (and (= (lenBad2 Heap@@13 l@@9) (|lenBad2'| Heap@@13 l@@9)) (dummyFunction (int_2_U (|lenBad2#triggerStateless| l@@9)))))
 :qid |stdinbpl.498:15|
 :skolemid |42|
 :pattern ( (lenBad2 Heap@@13 l@@9))
)))
(assert (forall ((Heap@@14 T@U) (ExhaleHeap@@2 T@U) (Mask@@7 T@U) (o_1@@0 T@U) (f_2 T@U) ) (! (let ((B@@1 (FieldTypeInv1 (type f_2))))
(let ((A@@1 (FieldTypeInv0 (type f_2))))
 (=> (and (and (and (and (and (and (= (type Heap@@14) (MapType0Type RefType)) (= (type ExhaleHeap@@2) (MapType0Type RefType))) (= (type Mask@@7) (MapType1Type RefType realType))) (= (type o_1@@0) RefType)) (= (type f_2) (FieldType A@@1 B@@1))) (IdenticalOnKnownLocations Heap@@14 ExhaleHeap@@2 Mask@@7)) (HasDirectPerm Mask@@7 o_1@@0 f_2)) (= (MapType0Select Heap@@14 o_1@@0 f_2) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2)))))
 :qid |stdinbpl.42:22|
 :skolemid |1|
 :pattern ( (IdenticalOnKnownLocations Heap@@14 ExhaleHeap@@2 Mask@@7) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2))
)))
(assert  (and (= (type dummyHeap) (MapType0Type RefType)) (= (type ZeroMask) (MapType1Type RefType realType))))
(assert (state dummyHeap ZeroMask))
(assert (forall ((p T@U) (v_1 T@U) (w T@U) ) (! (let ((A@@2 (FieldTypeInv0 (type p))))
 (=> (and (and (= (type p) (FieldType A@@2 FrameTypeType)) (= (type v_1) FrameTypeType)) (= (type w) FrameTypeType)) (not (InsidePredicate p v_1 p w))))
 :qid |stdinbpl.176:19|
 :skolemid |21|
 :pattern ( (InsidePredicate p v_1 p w))
)))
(assert (forall ((Heap@@15 T@U) (ExhaleHeap@@3 T@U) (Mask@@8 T@U) ) (!  (=> (and (and (and (= (type Heap@@15) (MapType0Type RefType)) (= (type ExhaleHeap@@3) (MapType0Type RefType))) (= (type Mask@@8) (MapType1Type RefType realType))) (IdenticalOnKnownLocations Heap@@15 ExhaleHeap@@3 Mask@@8)) (succHeap Heap@@15 ExhaleHeap@@3))
 :qid |stdinbpl.83:15|
 :skolemid |10|
 :pattern ( (IdenticalOnKnownLocations Heap@@15 ExhaleHeap@@3 Mask@@8))
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
(assert (forall ((arg0@@30 Real) (arg1@@10 T@U) ) (! (= (type (ConditionalFrame arg0@@30 arg1@@10)) FrameTypeType)
 :qid |funType:ConditionalFrame|
 :pattern ( (ConditionalFrame arg0@@30 arg1@@10))
)))
(assert (forall ((p@@0 Real) (f_6 T@U) ) (!  (=> (= (type f_6) FrameTypeType) (= (ConditionalFrame p@@0 f_6) (ite (> p@@0 0.0) f_6 EmptyFrame)))
 :qid |stdinbpl.164:15|
 :skolemid |19|
 :pattern ( (ConditionalFrame p@@0 f_6))
)))
(assert (forall ((Mask@@9 T@U) (o_2@@0 T@U) (f_4@@0 T@U) ) (! (let ((B@@3 (FieldTypeInv1 (type f_4@@0))))
(let ((A@@4 (FieldTypeInv0 (type f_4@@0))))
 (=> (and (and (= (type Mask@@9) (MapType1Type RefType realType)) (= (type o_2@@0) RefType)) (= (type f_4@@0) (FieldType A@@4 B@@3))) (= (HasDirectPerm Mask@@9 o_2@@0 f_4@@0) (> (U_2_real (MapType1Select Mask@@9 o_2@@0 f_4@@0)) NoPerm)))))
 :qid |stdinbpl.133:22|
 :skolemid |17|
 :pattern ( (HasDirectPerm Mask@@9 o_2@@0 f_4@@0))
)))
(assert (forall ((Heap@@16 T@U) (l@@10 T@U) (v_2@@1 T@U) ) (!  (=> (and (and (= (type Heap@@16) (MapType0Type RefType)) (= (type l@@10) (ListDomainTypeType ValDomainTypeType))) (= (type v_2@@1) ValDomainTypeType)) (and (= (lenBad Heap@@16 l@@10 v_2@@1) (|lenBad'| Heap@@16 l@@10 v_2@@1)) (dummyFunction (int_2_U (|lenBad#triggerStateless| l@@10 v_2@@1)))))
 :qid |stdinbpl.424:15|
 :skolemid |37|
 :pattern ( (lenBad Heap@@16 l@@10 v_2@@1))
)))
(assert (forall ((Heap@@17 T@U) (Mask@@10 T@U) (l@@11 T@U) ) (!  (=> (and (and (and (= (type Heap@@17) (MapType0Type RefType)) (= (type Mask@@10) (MapType1Type RefType realType))) (= (type l@@11) (ListDomainTypeType ValDomainTypeType))) (and (state Heap@@17 Mask@@10) (< AssumeFunctionsAbove 1))) (= (len2 Heap@@17 l@@11) (ite (= (List_tag l@@11) 1) 0 (ite (= (List_tag (get_List_tail l@@11)) 1) 1 (+ 2 (|len2'| Heap@@17 (get_List_tail (get_List_tail l@@11))))))))
 :qid |stdinbpl.354:15|
 :skolemid |34|
 :pattern ( (state Heap@@17 Mask@@10) (len2 Heap@@17 l@@11))
)))
(assert (forall ((o_2@@1 T@U) (f_4@@1 T@U) ) (! (let ((B@@4 (FieldTypeInv1 (type f_4@@1))))
(let ((A@@5 (FieldTypeInv0 (type f_4@@1))))
 (=> (and (= (type o_2@@1) RefType) (= (type f_4@@1) (FieldType A@@5 B@@4))) (= (U_2_real (MapType1Select ZeroMask o_2@@1 f_4@@1)) NoPerm))))
 :qid |stdinbpl.106:22|
 :skolemid |13|
 :pattern ( (MapType1Select ZeroMask o_2@@1 f_4@@1))
)))
(assert (forall ((Heap@@18 T@U) (Mask@@11 T@U) (l@@12 T@U) ) (!  (=> (and (and (and (= (type Heap@@18) (MapType0Type RefType)) (= (type Mask@@11) (MapType1Type RefType realType))) (= (type l@@12) (ListDomainTypeType ValDomainTypeType))) (and (state Heap@@18 Mask@@11) (< AssumeFunctionsAbove 0))) (= (lenBad2 Heap@@18 l@@12) (+ 1 (|lenBad2'| Heap@@18 l@@12))))
 :qid |stdinbpl.508:15|
 :skolemid |44|
 :pattern ( (state Heap@@18 Mask@@11) (lenBad2 Heap@@18 l@@12))
)))
(assert (forall ((Heap@@19 T@U) (Mask@@12 T@U) (l@@13 T@U) ) (!  (=> (and (and (and (= (type Heap@@19) (MapType0Type RefType)) (= (type Mask@@12) (MapType1Type RefType realType))) (= (type l@@13) (ListDomainTypeType ValDomainTypeType))) (and (state Heap@@19 Mask@@12) (< AssumeFunctionsAbove 2))) (= (len Heap@@19 l@@13) (ite (= (List_tag l@@13) 1) 0 (+ 1 (|len'| Heap@@19 (get_List_tail l@@13))))))
 :qid |stdinbpl.277:15|
 :skolemid |29|
 :pattern ( (state Heap@@19 Mask@@12) (len Heap@@19 l@@13))
)))
(assert (forall ((Heap@@20 T@U) (Mask@@13 T@U) (l@@14 T@U) (v_2@@2 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@20) (MapType0Type RefType)) (= (type Mask@@13) (MapType1Type RefType realType))) (= (type l@@14) (ListDomainTypeType ValDomainTypeType))) (= (type v_2@@2) ValDomainTypeType)) (and (state Heap@@20 Mask@@13) (< AssumeFunctionsAbove 3))) (= (lenBad Heap@@20 l@@14 v_2@@2) (|lenBad'| Heap@@20 (Cons v_2@@2 (Nil ValDomainTypeType)) v_2@@2)))
 :qid |stdinbpl.434:15|
 :skolemid |39|
 :pattern ( (state Heap@@20 Mask@@13) (lenBad Heap@@20 l@@14 v_2@@2))
)))
(assert (forall ((Heap@@21 T@U) (ExhaleHeap@@4 T@U) (Mask@@14 T@U) (pm_f@@1 T@U) ) (! (let ((C@@1 (FieldTypeInv0 (type pm_f@@1))))
 (=> (and (and (and (and (and (= (type Heap@@21) (MapType0Type RefType)) (= (type ExhaleHeap@@4) (MapType0Type RefType))) (= (type Mask@@14) (MapType1Type RefType realType))) (= (type pm_f@@1) (FieldType C@@1 FrameTypeType))) (IdenticalOnKnownLocations Heap@@21 ExhaleHeap@@4 Mask@@14)) (and (HasDirectPerm Mask@@14 null pm_f@@1) (IsPredicateField pm_f@@1))) (forall ((o2 T@U) (f_2@@0 T@U) ) (! (let ((B@@5 (FieldTypeInv1 (type f_2@@0))))
(let ((A@@6 (FieldTypeInv0 (type f_2@@0))))
 (=> (and (and (= (type o2) RefType) (= (type f_2@@0) (FieldType A@@6 B@@5))) (U_2_bool (MapType1Select (MapType0Select Heap@@21 null (PredicateMaskField pm_f@@1)) o2 f_2@@0))) (= (MapType0Select Heap@@21 o2 f_2@@0) (MapType0Select ExhaleHeap@@4 o2 f_2@@0)))))
 :qid |stdinbpl.54:134|
 :skolemid |3|
 :pattern ( (MapType0Select ExhaleHeap@@4 o2 f_2@@0))
))))
 :qid |stdinbpl.52:19|
 :skolemid |4|
 :pattern ( (IdenticalOnKnownLocations Heap@@21 ExhaleHeap@@4 Mask@@14) (IsPredicateField pm_f@@1))
)))
(assert (forall ((Heap@@22 T@U) (ExhaleHeap@@5 T@U) (Mask@@15 T@U) (pm_f@@2 T@U) ) (! (let ((C@@2 (FieldTypeInv0 (type pm_f@@2))))
 (=> (and (and (and (and (and (= (type Heap@@22) (MapType0Type RefType)) (= (type ExhaleHeap@@5) (MapType0Type RefType))) (= (type Mask@@15) (MapType1Type RefType realType))) (= (type pm_f@@2) (FieldType C@@2 FrameTypeType))) (IdenticalOnKnownLocations Heap@@22 ExhaleHeap@@5 Mask@@15)) (and (HasDirectPerm Mask@@15 null pm_f@@2) (IsWandField pm_f@@2))) (forall ((o2@@0 T@U) (f_2@@1 T@U) ) (! (let ((B@@6 (FieldTypeInv1 (type f_2@@1))))
(let ((A@@7 (FieldTypeInv0 (type f_2@@1))))
 (=> (and (and (= (type o2@@0) RefType) (= (type f_2@@1) (FieldType A@@7 B@@6))) (U_2_bool (MapType1Select (MapType0Select Heap@@22 null (WandMaskField pm_f@@2)) o2@@0 f_2@@1))) (= (MapType0Select Heap@@22 o2@@0 f_2@@1) (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1)))))
 :qid |stdinbpl.67:129|
 :skolemid |6|
 :pattern ( (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1))
))))
 :qid |stdinbpl.65:19|
 :skolemid |7|
 :pattern ( (IdenticalOnKnownLocations Heap@@22 ExhaleHeap@@5 Mask@@15) (IsWandField pm_f@@2))
)))
(assert (forall ((Mask@@16 T@U) (o_2@@2 T@U) (f_4@@2 T@U) ) (! (let ((B@@7 (FieldTypeInv1 (type f_4@@2))))
(let ((A@@8 (FieldTypeInv0 (type f_4@@2))))
 (=> (and (and (and (= (type Mask@@16) (MapType1Type RefType realType)) (= (type o_2@@2) RefType)) (= (type f_4@@2) (FieldType A@@8 B@@7))) (GoodMask Mask@@16)) (and (>= (U_2_real (MapType1Select Mask@@16 o_2@@2 f_4@@2)) NoPerm) (=> (and (and (GoodMask Mask@@16) (not (IsPredicateField f_4@@2))) (not (IsWandField f_4@@2))) (<= (U_2_real (MapType1Select Mask@@16 o_2@@2 f_4@@2)) FullPerm))))))
 :qid |stdinbpl.128:22|
 :skolemid |16|
 :pattern ( (GoodMask Mask@@16) (MapType1Select Mask@@16 o_2@@2 f_4@@2))
)))
(assert (forall ((Heap@@23 T@U) (Mask@@17 T@U) (l@@15 T@U) ) (!  (=> (and (and (and (= (type Heap@@23) (MapType0Type RefType)) (= (type Mask@@17) (MapType1Type RefType realType))) (= (type l@@15) (ListDomainTypeType ValDomainTypeType))) (state Heap@@23 Mask@@17)) (= (|len'| Heap@@23 l@@15) (|len#frame| EmptyFrame l@@15)))
 :qid |stdinbpl.284:15|
 :skolemid |30|
 :pattern ( (state Heap@@23 Mask@@17) (|len'| Heap@@23 l@@15))
)))
(assert (forall ((Heap@@24 T@U) (Mask@@18 T@U) (l@@16 T@U) ) (!  (=> (and (and (and (= (type Heap@@24) (MapType0Type RefType)) (= (type Mask@@18) (MapType1Type RefType realType))) (= (type l@@16) (ListDomainTypeType ValDomainTypeType))) (state Heap@@24 Mask@@18)) (= (|len2'| Heap@@24 l@@16) (|len2#frame| EmptyFrame l@@16)))
 :qid |stdinbpl.361:15|
 :skolemid |35|
 :pattern ( (state Heap@@24 Mask@@18) (|len2'| Heap@@24 l@@16))
)))
(assert (forall ((Heap@@25 T@U) (Mask@@19 T@U) (l@@17 T@U) ) (!  (=> (and (and (and (= (type Heap@@25) (MapType0Type RefType)) (= (type Mask@@19) (MapType1Type RefType realType))) (= (type l@@17) (ListDomainTypeType ValDomainTypeType))) (state Heap@@25 Mask@@19)) (= (|lenBad2'| Heap@@25 l@@17) (|lenBad2#frame| EmptyFrame l@@17)))
 :qid |stdinbpl.515:15|
 :skolemid |45|
 :pattern ( (state Heap@@25 Mask@@19) (|lenBad2'| Heap@@25 l@@17))
)))
(assert (forall ((o T@U) (f T@U) (Heap@@26 T@U) ) (!  (=> (and (and (and (= (type o) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap@@26) (MapType0Type RefType))) (U_2_bool (MapType0Select Heap@@26 o $allocated))) (U_2_bool (MapType0Select Heap@@26 (MapType0Select Heap@@26 o f) $allocated)))
 :qid |stdinbpl.31:15|
 :skolemid |0|
 :pattern ( (MapType0Select Heap@@26 o f))
)))
(assert (forall ((value_1 T@U) (tail_1 T@U) ) (! (let ((V@@4 (type value_1)))
 (=> (= (type tail_1) (ListDomainTypeType V@@4)) (= value_1 (get_List_value (Cons value_1 tail_1)))))
 :qid |stdinbpl.231:19|
 :skolemid |22|
 :pattern ( (Cons value_1 tail_1))
)))
(assert (forall ((value_1@@0 T@U) (tail_1@@0 T@U) ) (! (let ((V@@5 (type value_1@@0)))
 (=> (= (type tail_1@@0) (ListDomainTypeType V@@5)) (= tail_1@@0 (get_List_tail (Cons value_1@@0 tail_1@@0)))))
 :qid |stdinbpl.237:19|
 :skolemid |23|
 :pattern ( (Cons value_1@@0 tail_1@@0))
)))
(assert (forall ((Heap@@27 T@U) (o@@0 T@U) (f_3 T@U) (v T@U) ) (! (let ((B@@8 (type v)))
(let ((A@@9 (FieldTypeInv0 (type f_3))))
 (=> (and (and (= (type Heap@@27) (MapType0Type RefType)) (= (type o@@0) RefType)) (= (type f_3) (FieldType A@@9 B@@8))) (succHeap Heap@@27 (MapType0Store Heap@@27 o@@0 f_3 v)))))
 :qid |stdinbpl.78:22|
 :skolemid |9|
 :pattern ( (MapType0Store Heap@@27 o@@0 f_3 v))
)))
(assert (= (type ZeroPMask) (MapType1Type RefType boolType)))
(assert (forall ((o_2@@3 T@U) (f_4@@3 T@U) ) (! (let ((B@@9 (FieldTypeInv1 (type f_4@@3))))
(let ((A@@10 (FieldTypeInv0 (type f_4@@3))))
 (=> (and (= (type o_2@@3) RefType) (= (type f_4@@3) (FieldType A@@10 B@@9))) (not (U_2_bool (MapType1Select ZeroPMask o_2@@3 f_4@@3))))))
 :qid |stdinbpl.112:22|
 :skolemid |14|
 :pattern ( (MapType1Select ZeroPMask o_2@@3 f_4@@3))
)))
(assert (forall ((value_1@@1 T@U) (tail_1@@1 T@U) ) (! (let ((V@@6 (type value_1@@1)))
 (=> (= (type tail_1@@1) (ListDomainTypeType V@@6)) (= (List_tag (Cons value_1@@1 tail_1@@1)) 0)))
 :qid |stdinbpl.249:19|
 :skolemid |25|
 :pattern ( (Cons value_1@@1 tail_1@@1))
)))
(assert (forall ((p@@1 T@U) (v_1@@0 T@U) (q T@U) (w@@0 T@U) (r T@U) (u T@U) ) (! (let ((C@@3 (FieldTypeInv0 (type r))))
(let ((B@@10 (FieldTypeInv0 (type q))))
(let ((A@@11 (FieldTypeInv0 (type p@@1))))
 (=> (and (and (and (and (and (and (= (type p@@1) (FieldType A@@11 FrameTypeType)) (= (type v_1@@0) FrameTypeType)) (= (type q) (FieldType B@@10 FrameTypeType))) (= (type w@@0) FrameTypeType)) (= (type r) (FieldType C@@3 FrameTypeType))) (= (type u) FrameTypeType)) (and (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))) (InsidePredicate p@@1 v_1@@0 r u)))))
 :qid |stdinbpl.171:25|
 :skolemid |20|
 :pattern ( (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))
)))
(assert (forall ((V@@7 T@T) ) (! (= (List_tag (Nil V@@7)) 1)
 :skolemid |24|
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
(assert (forall ((Heap@@28 T@U) (Mask@@20 T@U) (l@@18 T@U) (v_2@@3 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@28) (MapType0Type RefType)) (= (type Mask@@20) (MapType1Type RefType realType))) (= (type l@@18) (ListDomainTypeType ValDomainTypeType))) (= (type v_2@@3) ValDomainTypeType)) (and (state Heap@@28 Mask@@20) (or (< AssumeFunctionsAbove 3) (|lenBad#trigger| EmptyFrame l@@18 v_2@@3)))) (>= (|lenBad'| Heap@@28 l@@18 v_2@@3) 0))
 :qid |stdinbpl.447:15|
 :skolemid |41|
 :pattern ( (state Heap@@28 Mask@@20) (|lenBad'| Heap@@28 l@@18 v_2@@3))
)))
(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun v_2@@4 () T@U)
(declare-fun Result@0 () Int)
(declare-fun Heap@@29 () T@U)
(assert  (and (= (type v_2@@4) ValDomainTypeType) (= (type Heap@@29) (MapType0Type RefType))))
(set-info :boogie-vc-id |lenBad#definedness|)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 5) (let ((anon4_Else_correct  (=> (|lenBad#trigger| EmptyFrame (Cons v_2@@4 (Nil ValDomainTypeType)) v_2@@4) (=> (and (= Result@0 (lenBad Heap@@29 (Cons v_2@@4 (Nil ValDomainTypeType)) v_2@@4)) (= (ControlFlow 0 3) (- 0 2))) (>= Result@0 0)))))
(let ((anon4_Then_correct true))
(let ((anon0_correct  (=> (and (state Heap@@29 ZeroMask) (= AssumeFunctionsAbove 3)) (and (=> (= (ControlFlow 0 4) 1) anon4_Then_correct) (=> (= (ControlFlow 0 4) 3) anon4_Else_correct)))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 5) 4) anon0_correct)))
PreconditionGeneratedEntry_correct)))))
))
(check-sat)
(pop 1)
; Valid
(get-info :rlimit)
