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
(declare-fun vint () T@U)
(declare-fun FieldType (T@T T@T) T@T)
(declare-fun FieldTypeInv0 (T@T) T@T)
(declare-fun FieldTypeInv1 (T@T) T@T)
(declare-fun NormalFieldType () T@T)
(declare-fun succHeap (T@U T@U) Bool)
(declare-fun MapType0Type (T@T) T@T)
(declare-fun RefType () T@T)
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
(declare-fun |aloc'| (T@U T@U Int) T@U)
(declare-fun arrayDomainTypeType () T@T)
(declare-fun dummyFunction (T@U) Bool)
(declare-fun |aloc#triggerStateless| (T@U Int) T@U)
(declare-fun IdenticalOnKnownLocations (T@U T@U T@U) Bool)
(declare-fun IsPredicateField (T@U) Bool)
(declare-fun null () T@U)
(declare-fun PredicateMaskField (T@U) T@U)
(declare-fun FrameTypeType () T@T)
(declare-fun HasDirectPerm (T@U T@U T@U) Bool)
(declare-fun IsWandField (T@U) Bool)
(declare-fun WandMaskField (T@U) T@U)
(declare-fun |aloc#frame| (T@U T@U Int) T@U)
(declare-fun EmptyFrame () T@U)
(declare-fun alen (T@U) Int)
(declare-fun dummyHeap () T@U)
(declare-fun ZeroMask () T@U)
(declare-fun InsidePredicate (T@U T@U T@U T@U) Bool)
(declare-fun sumMask (T@U T@U T@U) Bool)
(declare-fun ConditionalFrame (Real T@U) T@U)
(declare-fun NoPerm () Real)
(declare-fun aloc (T@U T@U Int) T@U)
(declare-fun array_loc (T@U Int) T@U)
(declare-fun loc_inv_1 (T@U) T@U)
(declare-fun loc_inv_2 (T@U) Int)
(declare-fun AssumeFunctionsAbove () Int)
(declare-fun FullPerm () Real)
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
(assert  (and (and (and (and (and (forall ((arg0@@11 T@T) (arg1 T@T) ) (! (= (Ctor (FieldType arg0@@11 arg1)) 6)
 :qid |ctor:FieldType|
)) (forall ((arg0@@12 T@T) (arg1@@0 T@T) ) (! (= (FieldTypeInv0 (FieldType arg0@@12 arg1@@0)) arg0@@12)
 :qid |typeInv:FieldTypeInv0|
 :pattern ( (FieldType arg0@@12 arg1@@0))
))) (forall ((arg0@@13 T@T) (arg1@@1 T@T) ) (! (= (FieldTypeInv1 (FieldType arg0@@13 arg1@@1)) arg1@@1)
 :qid |typeInv:FieldTypeInv1|
 :pattern ( (FieldType arg0@@13 arg1@@1))
))) (= (Ctor NormalFieldType) 7)) (= (type $allocated) (FieldType NormalFieldType boolType))) (= (type vint) (FieldType NormalFieldType intType))))
(assert (distinct $allocated vint)
)
(assert  (and (and (and (and (and (and (forall ((arg0@@14 T@T) ) (! (= (Ctor (MapType0Type arg0@@14)) 8)
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
)))) (= (Ctor RefType) 9)))
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
(assert  (and (and (= (Ctor arrayDomainTypeType) 11) (forall ((arg0@@23 T@U) (arg1@@9 T@U) (arg2@@3 Int) ) (! (= (type (|aloc'| arg0@@23 arg1@@9 arg2@@3)) RefType)
 :qid |funType:aloc'|
 :pattern ( (|aloc'| arg0@@23 arg1@@9 arg2@@3))
))) (forall ((arg0@@24 T@U) (arg1@@10 Int) ) (! (= (type (|aloc#triggerStateless| arg0@@24 arg1@@10)) RefType)
 :qid |funType:aloc#triggerStateless|
 :pattern ( (|aloc#triggerStateless| arg0@@24 arg1@@10))
))))
(assert (forall ((Heap@@0 T@U) (a_3 T@U) (i_2 Int) ) (!  (=> (and (= (type Heap@@0) (MapType0Type RefType)) (= (type a_3) arrayDomainTypeType)) (dummyFunction (|aloc#triggerStateless| a_3 i_2)))
 :qid |stdinbpl.291:15|
 :skolemid |25|
 :pattern ( (|aloc'| Heap@@0 a_3 i_2))
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
(assert  (and (forall ((arg0@@27 T@U) (arg1@@11 T@U) (arg2@@4 Int) ) (! (= (type (|aloc#frame| arg0@@27 arg1@@11 arg2@@4)) RefType)
 :qid |funType:aloc#frame|
 :pattern ( (|aloc#frame| arg0@@27 arg1@@11 arg2@@4))
)) (= (type EmptyFrame) FrameTypeType)))
(assert (forall ((Heap@@3 T@U) (Mask@@2 T@U) (a_3@@0 T@U) (i_2@@0 Int) ) (!  (=> (and (and (and (= (type Heap@@3) (MapType0Type RefType)) (= (type Mask@@2) (MapType1Type RefType realType))) (= (type a_3@@0) arrayDomainTypeType)) (state Heap@@3 Mask@@2)) (= (|aloc'| Heap@@3 a_3@@0 i_2@@0) (|aloc#frame| EmptyFrame a_3@@0 i_2@@0)))
 :qid |stdinbpl.304:15|
 :skolemid |27|
 :pattern ( (state Heap@@3 Mask@@2) (|aloc'| Heap@@3 a_3@@0 i_2@@0))
)))
(assert (forall ((Heap@@4 T@U) (ExhaleHeap@@1 T@U) (Mask@@3 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@4) (MapType0Type RefType)) (= (type ExhaleHeap@@1) (MapType0Type RefType))) (= (type Mask@@3) (MapType1Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@4 ExhaleHeap@@1 Mask@@3)) (U_2_bool (MapType0Select Heap@@4 o_1 $allocated))) (U_2_bool (MapType0Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.73:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@4 ExhaleHeap@@1 Mask@@3) (MapType0Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert (forall ((a_3@@1 T@U) ) (!  (=> (= (type a_3@@1) arrayDomainTypeType) (>= (alen a_3@@1) 0))
 :qid |stdinbpl.267:15|
 :skolemid |23|
 :pattern ( (alen a_3@@1))
)))
(assert (forall ((Heap@@5 T@U) (ExhaleHeap@@2 T@U) (Mask@@4 T@U) (o_1@@0 T@U) (f_2 T@U) ) (! (let ((B@@1 (FieldTypeInv1 (type f_2))))
(let ((A@@1 (FieldTypeInv0 (type f_2))))
 (=> (and (and (and (and (and (and (= (type Heap@@5) (MapType0Type RefType)) (= (type ExhaleHeap@@2) (MapType0Type RefType))) (= (type Mask@@4) (MapType1Type RefType realType))) (= (type o_1@@0) RefType)) (= (type f_2) (FieldType A@@1 B@@1))) (IdenticalOnKnownLocations Heap@@5 ExhaleHeap@@2 Mask@@4)) (HasDirectPerm Mask@@4 o_1@@0 f_2)) (= (MapType0Select Heap@@5 o_1@@0 f_2) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2)))))
 :qid |stdinbpl.42:22|
 :skolemid |1|
 :pattern ( (IdenticalOnKnownLocations Heap@@5 ExhaleHeap@@2 Mask@@4) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2))
)))
(assert  (and (= (type dummyHeap) (MapType0Type RefType)) (= (type ZeroMask) (MapType1Type RefType realType))))
(assert (state dummyHeap ZeroMask))
(assert (forall ((p T@U) (v_1 T@U) (w T@U) ) (! (let ((A@@2 (FieldTypeInv0 (type p))))
 (=> (and (and (= (type p) (FieldType A@@2 FrameTypeType)) (= (type v_1) FrameTypeType)) (= (type w) FrameTypeType)) (not (InsidePredicate p v_1 p w))))
 :qid |stdinbpl.236:19|
 :skolemid |21|
 :pattern ( (InsidePredicate p v_1 p w))
)))
(assert  (not (IsPredicateField vint)))
(assert  (not (IsWandField vint)))
(assert (forall ((Heap@@6 T@U) (ExhaleHeap@@3 T@U) (Mask@@5 T@U) ) (!  (=> (and (and (and (= (type Heap@@6) (MapType0Type RefType)) (= (type ExhaleHeap@@3) (MapType0Type RefType))) (= (type Mask@@5) (MapType1Type RefType realType))) (IdenticalOnKnownLocations Heap@@6 ExhaleHeap@@3 Mask@@5)) (succHeap Heap@@6 ExhaleHeap@@3))
 :qid |stdinbpl.83:15|
 :skolemid |10|
 :pattern ( (IdenticalOnKnownLocations Heap@@6 ExhaleHeap@@3 Mask@@5))
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
(assert (forall ((arg0@@28 Real) (arg1@@12 T@U) ) (! (= (type (ConditionalFrame arg0@@28 arg1@@12)) FrameTypeType)
 :qid |funType:ConditionalFrame|
 :pattern ( (ConditionalFrame arg0@@28 arg1@@12))
)))
(assert (forall ((p@@0 Real) (f_6 T@U) ) (!  (=> (= (type f_6) FrameTypeType) (= (ConditionalFrame p@@0 f_6) (ite (> p@@0 0.0) f_6 EmptyFrame)))
 :qid |stdinbpl.224:15|
 :skolemid |19|
 :pattern ( (ConditionalFrame p@@0 f_6))
)))
(assert (forall ((Mask@@6 T@U) (o_2@@0 T@U) (f_4@@0 T@U) ) (! (let ((B@@3 (FieldTypeInv1 (type f_4@@0))))
(let ((A@@4 (FieldTypeInv0 (type f_4@@0))))
 (=> (and (and (= (type Mask@@6) (MapType1Type RefType realType)) (= (type o_2@@0) RefType)) (= (type f_4@@0) (FieldType A@@4 B@@3))) (= (HasDirectPerm Mask@@6 o_2@@0 f_4@@0) (> (U_2_real (MapType1Select Mask@@6 o_2@@0 f_4@@0)) NoPerm)))))
 :qid |stdinbpl.133:22|
 :skolemid |17|
 :pattern ( (HasDirectPerm Mask@@6 o_2@@0 f_4@@0))
)))
(assert (forall ((arg0@@29 T@U) (arg1@@13 T@U) (arg2@@5 Int) ) (! (= (type (aloc arg0@@29 arg1@@13 arg2@@5)) RefType)
 :qid |funType:aloc|
 :pattern ( (aloc arg0@@29 arg1@@13 arg2@@5))
)))
(assert (forall ((Heap@@7 T@U) (a_3@@2 T@U) (i_2@@1 Int) ) (!  (=> (and (= (type Heap@@7) (MapType0Type RefType)) (= (type a_3@@2) arrayDomainTypeType)) (and (= (aloc Heap@@7 a_3@@2 i_2@@1) (|aloc'| Heap@@7 a_3@@2 i_2@@1)) (dummyFunction (|aloc#triggerStateless| a_3@@2 i_2@@1))))
 :qid |stdinbpl.287:15|
 :skolemid |24|
 :pattern ( (aloc Heap@@7 a_3@@2 i_2@@1))
)))
(assert  (and (forall ((arg0@@30 T@U) (arg1@@14 Int) ) (! (= (type (array_loc arg0@@30 arg1@@14)) RefType)
 :qid |funType:array_loc|
 :pattern ( (array_loc arg0@@30 arg1@@14))
)) (forall ((arg0@@31 T@U) ) (! (= (type (loc_inv_1 arg0@@31)) arrayDomainTypeType)
 :qid |funType:loc_inv_1|
 :pattern ( (loc_inv_1 arg0@@31))
))))
(assert (forall ((a_3@@3 T@U) (i_2@@2 Int) ) (!  (=> (= (type a_3@@3) arrayDomainTypeType) (and (= (loc_inv_1 (array_loc a_3@@3 i_2@@2)) a_3@@3) (= (loc_inv_2 (array_loc a_3@@3 i_2@@2)) i_2@@2)))
 :qid |stdinbpl.261:15|
 :skolemid |22|
 :pattern ( (array_loc a_3@@3 i_2@@2))
)))
(assert (forall ((o_2@@1 T@U) (f_4@@1 T@U) ) (! (let ((B@@4 (FieldTypeInv1 (type f_4@@1))))
(let ((A@@5 (FieldTypeInv0 (type f_4@@1))))
 (=> (and (= (type o_2@@1) RefType) (= (type f_4@@1) (FieldType A@@5 B@@4))) (= (U_2_real (MapType1Select ZeroMask o_2@@1 f_4@@1)) NoPerm))))
 :qid |stdinbpl.106:22|
 :skolemid |13|
 :pattern ( (MapType1Select ZeroMask o_2@@1 f_4@@1))
)))
(assert (forall ((Heap@@8 T@U) (Mask@@7 T@U) (a_3@@4 T@U) (i_2@@3 Int) ) (!  (=> (and (and (and (and (= (type Heap@@8) (MapType0Type RefType)) (= (type Mask@@7) (MapType1Type RefType realType))) (= (type a_3@@4) arrayDomainTypeType)) (and (state Heap@@8 Mask@@7) (< AssumeFunctionsAbove 0))) (and (<= 0 i_2@@3) (< i_2@@3 (alen a_3@@4)))) (= (aloc Heap@@8 a_3@@4 i_2@@3) (array_loc a_3@@4 i_2@@3)))
 :qid |stdinbpl.297:15|
 :skolemid |26|
 :pattern ( (state Heap@@8 Mask@@7) (aloc Heap@@8 a_3@@4 i_2@@3))
)))
(assert (forall ((Heap@@9 T@U) (ExhaleHeap@@4 T@U) (Mask@@8 T@U) (pm_f@@1 T@U) ) (! (let ((C@@1 (FieldTypeInv0 (type pm_f@@1))))
 (=> (and (and (and (and (and (= (type Heap@@9) (MapType0Type RefType)) (= (type ExhaleHeap@@4) (MapType0Type RefType))) (= (type Mask@@8) (MapType1Type RefType realType))) (= (type pm_f@@1) (FieldType C@@1 FrameTypeType))) (IdenticalOnKnownLocations Heap@@9 ExhaleHeap@@4 Mask@@8)) (and (HasDirectPerm Mask@@8 null pm_f@@1) (IsPredicateField pm_f@@1))) (forall ((o2 T@U) (f_2@@0 T@U) ) (! (let ((B@@5 (FieldTypeInv1 (type f_2@@0))))
(let ((A@@6 (FieldTypeInv0 (type f_2@@0))))
 (=> (and (and (= (type o2) RefType) (= (type f_2@@0) (FieldType A@@6 B@@5))) (U_2_bool (MapType1Select (MapType0Select Heap@@9 null (PredicateMaskField pm_f@@1)) o2 f_2@@0))) (= (MapType0Select Heap@@9 o2 f_2@@0) (MapType0Select ExhaleHeap@@4 o2 f_2@@0)))))
 :qid |stdinbpl.54:134|
 :skolemid |3|
 :pattern ( (MapType0Select ExhaleHeap@@4 o2 f_2@@0))
))))
 :qid |stdinbpl.52:19|
 :skolemid |4|
 :pattern ( (IdenticalOnKnownLocations Heap@@9 ExhaleHeap@@4 Mask@@8) (IsPredicateField pm_f@@1))
)))
(assert (forall ((Heap@@10 T@U) (ExhaleHeap@@5 T@U) (Mask@@9 T@U) (pm_f@@2 T@U) ) (! (let ((C@@2 (FieldTypeInv0 (type pm_f@@2))))
 (=> (and (and (and (and (and (= (type Heap@@10) (MapType0Type RefType)) (= (type ExhaleHeap@@5) (MapType0Type RefType))) (= (type Mask@@9) (MapType1Type RefType realType))) (= (type pm_f@@2) (FieldType C@@2 FrameTypeType))) (IdenticalOnKnownLocations Heap@@10 ExhaleHeap@@5 Mask@@9)) (and (HasDirectPerm Mask@@9 null pm_f@@2) (IsWandField pm_f@@2))) (forall ((o2@@0 T@U) (f_2@@1 T@U) ) (! (let ((B@@6 (FieldTypeInv1 (type f_2@@1))))
(let ((A@@7 (FieldTypeInv0 (type f_2@@1))))
 (=> (and (and (= (type o2@@0) RefType) (= (type f_2@@1) (FieldType A@@7 B@@6))) (U_2_bool (MapType1Select (MapType0Select Heap@@10 null (WandMaskField pm_f@@2)) o2@@0 f_2@@1))) (= (MapType0Select Heap@@10 o2@@0 f_2@@1) (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1)))))
 :qid |stdinbpl.67:129|
 :skolemid |6|
 :pattern ( (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1))
))))
 :qid |stdinbpl.65:19|
 :skolemid |7|
 :pattern ( (IdenticalOnKnownLocations Heap@@10 ExhaleHeap@@5 Mask@@9) (IsWandField pm_f@@2))
)))
(assert (forall ((Mask@@10 T@U) (o_2@@2 T@U) (f_4@@2 T@U) ) (! (let ((B@@7 (FieldTypeInv1 (type f_4@@2))))
(let ((A@@8 (FieldTypeInv0 (type f_4@@2))))
 (=> (and (and (and (= (type Mask@@10) (MapType1Type RefType realType)) (= (type o_2@@2) RefType)) (= (type f_4@@2) (FieldType A@@8 B@@7))) (GoodMask Mask@@10)) (and (>= (U_2_real (MapType1Select Mask@@10 o_2@@2 f_4@@2)) NoPerm) (=> (and (and (GoodMask Mask@@10) (not (IsPredicateField f_4@@2))) (not (IsWandField f_4@@2))) (<= (U_2_real (MapType1Select Mask@@10 o_2@@2 f_4@@2)) FullPerm))))))
 :qid |stdinbpl.128:22|
 :skolemid |16|
 :pattern ( (GoodMask Mask@@10) (MapType1Select Mask@@10 o_2@@2 f_4@@2))
)))
(assert (forall ((o T@U) (f T@U) (Heap@@11 T@U) ) (!  (=> (and (and (and (= (type o) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap@@11) (MapType0Type RefType))) (U_2_bool (MapType0Select Heap@@11 o $allocated))) (U_2_bool (MapType0Select Heap@@11 (MapType0Select Heap@@11 o f) $allocated)))
 :qid |stdinbpl.31:15|
 :skolemid |0|
 :pattern ( (MapType0Select Heap@@11 o f))
)))
(assert (forall ((Heap@@12 T@U) (o@@0 T@U) (f_3 T@U) (v T@U) ) (! (let ((B@@8 (type v)))
(let ((A@@9 (FieldTypeInv0 (type f_3))))
 (=> (and (and (= (type Heap@@12) (MapType0Type RefType)) (= (type o@@0) RefType)) (= (type f_3) (FieldType A@@9 B@@8))) (succHeap Heap@@12 (MapType0Store Heap@@12 o@@0 f_3 v)))))
 :qid |stdinbpl.78:22|
 :skolemid |9|
 :pattern ( (MapType0Store Heap@@12 o@@0 f_3 v))
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
 :qid |stdinbpl.231:25|
 :skolemid |20|
 :pattern ( (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun i_15 () Int)
(declare-fun arr1 () T@U)
(declare-fun ExhaleHeap@0 () T@U)
(declare-fun qpRange8 (T@U) Bool)
(declare-fun invRecv8 (T@U) Int)
(declare-fun arr2 () T@U)
(declare-fun qpRange7 (T@U) Bool)
(declare-fun invRecv7 (T@U) Int)
(declare-fun QPMask@15 () T@U)
(declare-fun QPMask@14 () T@U)
(declare-fun i_13 () Int)
(declare-fun qpRange6 (T@U) Bool)
(declare-fun invRecv6 (T@U) Int)
(declare-fun QPMask@4 () T@U)
(declare-fun i_11 () Int)
(declare-fun QPMask@7 () T@U)
(declare-fun qpRange9 (T@U) Bool)
(declare-fun invRecv9 (T@U) Int)
(declare-fun QPMask@5 () T@U)
(declare-fun qpRange10 (T@U) Bool)
(declare-fun invRecv10 (T@U) Int)
(declare-fun QPMask@6 () T@U)
(declare-fun qpRange11 (T@U) Bool)
(declare-fun invRecv11 (T@U) Int)
(declare-fun Heap@@13 () T@U)
(declare-fun QPMask@1 () T@U)
(declare-fun neverTriggered3 (Int) Bool)
(declare-fun qpRange3 (T@U) Bool)
(declare-fun invRecv3 (T@U) Int)
(declare-fun QPMask@2 () T@U)
(declare-fun neverTriggered4 (Int) Bool)
(declare-fun qpRange4 (T@U) Bool)
(declare-fun invRecv4 (T@U) Int)
(declare-fun QPMask@3 () T@U)
(declare-fun neverTriggered5 (Int) Bool)
(declare-fun qpRange5 (T@U) Bool)
(declare-fun invRecv5 (T@U) Int)
(declare-fun i_7 () Int)
(declare-fun qpRange2 (T@U) Bool)
(declare-fun invRecv2 (T@U) Int)
(declare-fun QPMask@0 () T@U)
(declare-fun i_6 () Int)
(declare-fun i_4 () Int)
(declare-fun qpRange1 (T@U) Bool)
(declare-fun invRecv1 (T@U) Int)
(declare-fun i_3 () Int)
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (and (= (type arr1) arrayDomainTypeType) (= (type QPMask@0) (MapType1Type RefType realType))) (= (type Heap@@13) (MapType0Type RefType))) (= (type arr2) arrayDomainTypeType)) (= (type QPMask@1) (MapType1Type RefType realType))) (= (type QPMask@7) (MapType1Type RefType realType))) (= (type ExhaleHeap@0) (MapType0Type RefType))) (= (type QPMask@5) (MapType1Type RefType realType))) (= (type QPMask@6) (MapType1Type RefType realType))) (= (type QPMask@15) (MapType1Type RefType realType))) (= (type QPMask@14) (MapType1Type RefType realType))) (= (type QPMask@4) (MapType1Type RefType realType))) (= (type QPMask@2) (MapType1Type RefType realType))) (= (type QPMask@3) (MapType1Type RefType realType))))
(set-info :boogie-vc-id main)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 113) (let ((anon73_Then_correct  (and (=> (= (ControlFlow 0 87) (- 0 88)) (<= 0 i_15)) (=> (<= 0 i_15) (=> (= (ControlFlow 0 87) (- 0 86)) (< i_15 (alen arr1)))))))
(let ((anon41_correct true))
(let ((anon72_Then_correct  (=> (and (<= 0 i_15) (< i_15 6)) (and (=> (= (ControlFlow 0 89) 87) anon73_Then_correct) (=> (= (ControlFlow 0 89) 84) anon41_correct)))))
(let ((anon72_Else_correct  (=> (and (not (and (<= 0 i_15) (< i_15 6))) (= (ControlFlow 0 85) 84)) anon41_correct)))
(let ((anon71_Else_correct  (and (=> (= (ControlFlow 0 82) (- 0 83)) (forall ((i_16 Int) (i_16_1 Int) ) (!  (=> (and (and (and (and (not (= i_16 i_16_1)) (and (<= 0 i_16) (< i_16 6))) (and (<= 0 i_16_1) (< i_16_1 6))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= (aloc ExhaleHeap@0 arr1 i_16) (aloc ExhaleHeap@0 arr1 i_16_1))))
 :qid |stdinbpl.856:19|
 :skolemid |76|
))) (=> (forall ((i_16@@0 Int) (i_16_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_16@@0 i_16_1@@0)) (and (<= 0 i_16@@0) (< i_16@@0 6))) (and (<= 0 i_16_1@@0) (< i_16_1@@0 6))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= (aloc ExhaleHeap@0 arr1 i_16@@0) (aloc ExhaleHeap@0 arr1 i_16_1@@0))))
 :qid |stdinbpl.856:19|
 :skolemid |76|
)) (=> (forall ((i_16@@1 Int) ) (!  (=> (and (and (<= 0 i_16@@1) (< i_16@@1 6)) (< NoPerm (/ (to_real 1) (to_real 2)))) (and (qpRange8 (aloc ExhaleHeap@0 arr1 i_16@@1)) (= (invRecv8 (aloc ExhaleHeap@0 arr1 i_16@@1)) i_16@@1)))
 :qid |stdinbpl.862:26|
 :skolemid |77|
 :pattern ( (|aloc#frame| EmptyFrame arr1 i_16@@1))
 :pattern ( (MapType0Select ExhaleHeap@0 (|aloc#frame| EmptyFrame arr1 i_16@@1) vint))
)) (=> (and (forall ((o_3 T@U) ) (!  (=> (= (type o_3) RefType) (=> (and (and (and (<= 0 (invRecv8 o_3)) (< (invRecv8 o_3) 6)) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange8 o_3)) (= (aloc ExhaleHeap@0 arr1 (invRecv8 o_3)) o_3)))
 :qid |stdinbpl.866:26|
 :skolemid |78|
 :pattern ( (invRecv8 o_3))
)) (= (ControlFlow 0 82) (- 0 81))) (forall ((i_16@@2 Int) ) (!  (=> (and (<= 0 i_16@@2) (< i_16@@2 6)) (>= (/ (to_real 1) (to_real 2)) NoPerm))
 :qid |stdinbpl.872:19|
 :skolemid |79|
 :pattern ( (|aloc#frame| EmptyFrame arr1 i_16@@2))
 :pattern ( (MapType0Select ExhaleHeap@0 (|aloc#frame| EmptyFrame arr1 i_16@@2) vint))
))))))))
(let ((anon68_Else_correct  (and (=> (= (ControlFlow 0 90) (- 0 92)) (forall ((i_14 Int) (i_14_1 Int) ) (!  (=> (and (and (and (and (not (= i_14 i_14_1)) (and (<= 6 i_14) (< i_14 12))) (and (<= 6 i_14_1) (< i_14_1 12))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= (aloc ExhaleHeap@0 arr2 i_14) (aloc ExhaleHeap@0 arr2 i_14_1))))
 :qid |stdinbpl.796:19|
 :skolemid |69|
))) (=> (forall ((i_14@@0 Int) (i_14_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_14@@0 i_14_1@@0)) (and (<= 6 i_14@@0) (< i_14@@0 12))) (and (<= 6 i_14_1@@0) (< i_14_1@@0 12))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= (aloc ExhaleHeap@0 arr2 i_14@@0) (aloc ExhaleHeap@0 arr2 i_14_1@@0))))
 :qid |stdinbpl.796:19|
 :skolemid |69|
)) (=> (and (forall ((i_14@@1 Int) ) (!  (=> (and (and (<= 6 i_14@@1) (< i_14@@1 12)) (< NoPerm (/ (to_real 1) (to_real 2)))) (and (qpRange7 (aloc ExhaleHeap@0 arr2 i_14@@1)) (= (invRecv7 (aloc ExhaleHeap@0 arr2 i_14@@1)) i_14@@1)))
 :qid |stdinbpl.802:26|
 :skolemid |70|
 :pattern ( (|aloc#frame| EmptyFrame arr2 i_14@@1))
 :pattern ( (MapType0Select ExhaleHeap@0 (|aloc#frame| EmptyFrame arr2 i_14@@1) vint))
)) (forall ((o_3@@0 T@U) ) (!  (=> (= (type o_3@@0) RefType) (=> (and (and (and (<= 6 (invRecv7 o_3@@0)) (< (invRecv7 o_3@@0) 12)) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange7 o_3@@0)) (= (aloc ExhaleHeap@0 arr2 (invRecv7 o_3@@0)) o_3@@0)))
 :qid |stdinbpl.806:26|
 :skolemid |71|
 :pattern ( (invRecv7 o_3@@0))
))) (and (=> (= (ControlFlow 0 90) (- 0 91)) (forall ((i_14@@2 Int) ) (!  (=> (and (<= 6 i_14@@2) (< i_14@@2 12)) (>= (/ (to_real 1) (to_real 2)) NoPerm))
 :qid |stdinbpl.812:19|
 :skolemid |72|
 :pattern ( (|aloc#frame| EmptyFrame arr2 i_14@@2))
 :pattern ( (MapType0Select ExhaleHeap@0 (|aloc#frame| EmptyFrame arr2 i_14@@2) vint))
))) (=> (forall ((i_14@@3 Int) ) (!  (=> (and (<= 6 i_14@@3) (< i_14@@3 12)) (>= (/ (to_real 1) (to_real 2)) NoPerm))
 :qid |stdinbpl.812:19|
 :skolemid |72|
 :pattern ( (|aloc#frame| EmptyFrame arr2 i_14@@3))
 :pattern ( (MapType0Select ExhaleHeap@0 (|aloc#frame| EmptyFrame arr2 i_14@@3) vint))
)) (=> (and (forall ((i_14@@4 Int) ) (!  (=> (and (and (<= 6 i_14@@4) (< i_14@@4 12)) (> (/ (to_real 1) (to_real 2)) NoPerm)) (not (= (aloc ExhaleHeap@0 arr2 i_14@@4) null)))
 :qid |stdinbpl.818:26|
 :skolemid |73|
 :pattern ( (|aloc#frame| EmptyFrame arr2 i_14@@4))
 :pattern ( (MapType0Select ExhaleHeap@0 (|aloc#frame| EmptyFrame arr2 i_14@@4) vint))
)) (forall ((o_3@@1 T@U) ) (!  (=> (= (type o_3@@1) RefType) (and (=> (and (and (and (<= 6 (invRecv7 o_3@@1)) (< (invRecv7 o_3@@1) 12)) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange7 o_3@@1)) (and (=> (< NoPerm (/ (to_real 1) (to_real 2))) (= (aloc ExhaleHeap@0 arr2 (invRecv7 o_3@@1)) o_3@@1)) (= (U_2_real (MapType1Select QPMask@15 o_3@@1 vint)) (+ (U_2_real (MapType1Select QPMask@14 o_3@@1 vint)) (/ (to_real 1) (to_real 2)))))) (=> (not (and (and (and (<= 6 (invRecv7 o_3@@1)) (< (invRecv7 o_3@@1) 12)) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange7 o_3@@1))) (= (U_2_real (MapType1Select QPMask@15 o_3@@1 vint)) (U_2_real (MapType1Select QPMask@14 o_3@@1 vint))))))
 :qid |stdinbpl.824:26|
 :skolemid |74|
 :pattern ( (MapType1Select QPMask@15 o_3@@1 vint))
))) (=> (and (and (forall ((o_3@@2 T@U) (f_5 T@U) ) (! (let ((B@@11 (FieldTypeInv1 (type f_5))))
(let ((A@@12 (FieldTypeInv0 (type f_5))))
 (=> (and (and (= (type o_3@@2) RefType) (= (type f_5) (FieldType A@@12 B@@11))) (not (= f_5 vint))) (= (U_2_real (MapType1Select QPMask@14 o_3@@2 f_5)) (U_2_real (MapType1Select QPMask@15 o_3@@2 f_5))))))
 :qid |stdinbpl.828:33|
 :skolemid |75|
 :pattern ( (MapType1Select QPMask@14 o_3@@2 f_5))
 :pattern ( (MapType1Select QPMask@15 o_3@@2 f_5))
)) (state ExhaleHeap@0 QPMask@15)) (and (state ExhaleHeap@0 QPMask@15) (state ExhaleHeap@0 QPMask@15))) (and (and (=> (= (ControlFlow 0 90) 82) anon71_Else_correct) (=> (= (ControlFlow 0 90) 89) anon72_Then_correct)) (=> (= (ControlFlow 0 90) 85) anon72_Else_correct)))))))))))
(let ((anon70_Then_correct  (and (=> (= (ControlFlow 0 78) (- 0 79)) (<= 0 i_13)) (=> (<= 0 i_13) (=> (= (ControlFlow 0 78) (- 0 77)) (< i_13 (alen arr2)))))))
(let ((anon36_correct true))
(let ((anon69_Then_correct  (=> (and (<= 6 i_13) (< i_13 12)) (and (=> (= (ControlFlow 0 80) 78) anon70_Then_correct) (=> (= (ControlFlow 0 80) 75) anon36_correct)))))
(let ((anon69_Else_correct  (=> (and (not (and (<= 6 i_13) (< i_13 12))) (= (ControlFlow 0 76) 75)) anon36_correct)))
(let ((anon65_Else_correct  (and (=> (= (ControlFlow 0 93) (- 0 94)) (forall ((i_12 Int) (i_12_1 Int) ) (!  (=> (and (and (and (and (not (= i_12 i_12_1)) (and (<= 0 i_12) (< i_12 6))) (and (<= 0 i_12_1) (< i_12_1 6))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (aloc ExhaleHeap@0 arr2 i_12) (aloc ExhaleHeap@0 arr2 i_12_1))))
 :qid |stdinbpl.742:19|
 :skolemid |63|
))) (=> (forall ((i_12@@0 Int) (i_12_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_12@@0 i_12_1@@0)) (and (<= 0 i_12@@0) (< i_12@@0 6))) (and (<= 0 i_12_1@@0) (< i_12_1@@0 6))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (aloc ExhaleHeap@0 arr2 i_12@@0) (aloc ExhaleHeap@0 arr2 i_12_1@@0))))
 :qid |stdinbpl.742:19|
 :skolemid |63|
)) (=> (and (and (and (forall ((i_12@@1 Int) ) (!  (=> (and (and (<= 0 i_12@@1) (< i_12@@1 6)) (< NoPerm FullPerm)) (and (qpRange6 (aloc ExhaleHeap@0 arr2 i_12@@1)) (= (invRecv6 (aloc ExhaleHeap@0 arr2 i_12@@1)) i_12@@1)))
 :qid |stdinbpl.748:26|
 :skolemid |64|
 :pattern ( (|aloc#frame| EmptyFrame arr2 i_12@@1))
 :pattern ( (MapType0Select ExhaleHeap@0 (|aloc#frame| EmptyFrame arr2 i_12@@1) vint))
)) (forall ((o_3@@3 T@U) ) (!  (=> (= (type o_3@@3) RefType) (=> (and (and (and (<= 0 (invRecv6 o_3@@3)) (< (invRecv6 o_3@@3) 6)) (< NoPerm FullPerm)) (qpRange6 o_3@@3)) (= (aloc ExhaleHeap@0 arr2 (invRecv6 o_3@@3)) o_3@@3)))
 :qid |stdinbpl.752:26|
 :skolemid |65|
 :pattern ( (invRecv6 o_3@@3))
))) (and (forall ((i_12@@2 Int) ) (!  (=> (and (<= 0 i_12@@2) (< i_12@@2 6)) (not (= (aloc ExhaleHeap@0 arr2 i_12@@2) null)))
 :qid |stdinbpl.758:26|
 :skolemid |66|
 :pattern ( (|aloc#frame| EmptyFrame arr2 i_12@@2))
 :pattern ( (MapType0Select ExhaleHeap@0 (|aloc#frame| EmptyFrame arr2 i_12@@2) vint))
)) (forall ((o_3@@4 T@U) ) (!  (=> (= (type o_3@@4) RefType) (and (=> (and (and (and (<= 0 (invRecv6 o_3@@4)) (< (invRecv6 o_3@@4) 6)) (< NoPerm FullPerm)) (qpRange6 o_3@@4)) (and (=> (< NoPerm FullPerm) (= (aloc ExhaleHeap@0 arr2 (invRecv6 o_3@@4)) o_3@@4)) (= (U_2_real (MapType1Select QPMask@14 o_3@@4 vint)) (+ (U_2_real (MapType1Select QPMask@4 o_3@@4 vint)) FullPerm)))) (=> (not (and (and (and (<= 0 (invRecv6 o_3@@4)) (< (invRecv6 o_3@@4) 6)) (< NoPerm FullPerm)) (qpRange6 o_3@@4))) (= (U_2_real (MapType1Select QPMask@14 o_3@@4 vint)) (U_2_real (MapType1Select QPMask@4 o_3@@4 vint))))))
 :qid |stdinbpl.764:26|
 :skolemid |67|
 :pattern ( (MapType1Select QPMask@14 o_3@@4 vint))
)))) (and (and (forall ((o_3@@5 T@U) (f_5@@0 T@U) ) (! (let ((B@@12 (FieldTypeInv1 (type f_5@@0))))
(let ((A@@13 (FieldTypeInv0 (type f_5@@0))))
 (=> (and (and (= (type o_3@@5) RefType) (= (type f_5@@0) (FieldType A@@13 B@@12))) (not (= f_5@@0 vint))) (= (U_2_real (MapType1Select QPMask@4 o_3@@5 f_5@@0)) (U_2_real (MapType1Select QPMask@14 o_3@@5 f_5@@0))))))
 :qid |stdinbpl.768:33|
 :skolemid |68|
 :pattern ( (MapType1Select QPMask@4 o_3@@5 f_5@@0))
 :pattern ( (MapType1Select QPMask@14 o_3@@5 f_5@@0))
)) (state ExhaleHeap@0 QPMask@14)) (and (state ExhaleHeap@0 QPMask@14) (state ExhaleHeap@0 QPMask@14)))) (and (and (=> (= (ControlFlow 0 93) 90) anon68_Else_correct) (=> (= (ControlFlow 0 93) 80) anon69_Then_correct)) (=> (= (ControlFlow 0 93) 76) anon69_Else_correct)))))))
(let ((anon67_Then_correct  (and (=> (= (ControlFlow 0 72) (- 0 73)) (<= 0 i_11)) (=> (<= 0 i_11) (=> (= (ControlFlow 0 72) (- 0 71)) (< i_11 (alen arr2)))))))
(let ((anon31_correct true))
(let ((anon66_Then_correct  (=> (and (<= 0 i_11) (< i_11 6)) (and (=> (= (ControlFlow 0 74) 72) anon67_Then_correct) (=> (= (ControlFlow 0 74) 69) anon31_correct)))))
(let ((anon66_Else_correct  (=> (and (not (and (<= 0 i_11) (< i_11 6))) (= (ControlFlow 0 70) 69)) anon31_correct)))
(let ((anon64_Then_correct  (=> (= 0 0) (=> (and (state ExhaleHeap@0 QPMask@4) (state ExhaleHeap@0 QPMask@4)) (and (and (=> (= (ControlFlow 0 95) 93) anon65_Else_correct) (=> (= (ControlFlow 0 95) 74) anon66_Then_correct)) (=> (= (ControlFlow 0 95) 70) anon66_Else_correct))))))
(let ((anon76_Else_correct  (and (=> (= (ControlFlow 0 49) (- 0 60)) (HasDirectPerm QPMask@7 (aloc ExhaleHeap@0 arr2 6) vint)) (=> (HasDirectPerm QPMask@7 (aloc ExhaleHeap@0 arr2 6) vint) (and (=> (= (ControlFlow 0 49) (- 0 59)) (= (U_2_int (MapType0Select ExhaleHeap@0 (aloc ExhaleHeap@0 arr2 6) vint)) (U_2_int (MapType0Select ExhaleHeap@0 (aloc ExhaleHeap@0 arr2 6) vint)))) (=> (= (U_2_int (MapType0Select ExhaleHeap@0 (aloc ExhaleHeap@0 arr2 6) vint)) (U_2_int (MapType0Select ExhaleHeap@0 (aloc ExhaleHeap@0 arr2 6) vint))) (=> (and (state ExhaleHeap@0 QPMask@7) (= (ControlFlow 0 49) (- 0 58))) false)))))))
(let ((anon76_Then_correct  (=> (= (ControlFlow 0 47) (- 0 46)) (< 6 (alen arr2)))))
(let ((anon75_Else_correct  (and (=> (= (ControlFlow 0 61) (- 0 62)) (HasDirectPerm QPMask@7 (aloc ExhaleHeap@0 arr2 6) vint)) (=> (HasDirectPerm QPMask@7 (aloc ExhaleHeap@0 arr2 6) vint) (and (=> (= (ControlFlow 0 61) 47) anon76_Then_correct) (=> (= (ControlFlow 0 61) 49) anon76_Else_correct))))))
(let ((anon75_Then_correct  (=> (= (ControlFlow 0 45) (- 0 44)) (< 6 (alen arr2)))))
(let ((anon74_Then_correct  (=> (state ExhaleHeap@0 ZeroMask) (=> (and (= 0 0) (state ExhaleHeap@0 ZeroMask)) (and (=> (= (ControlFlow 0 63) (- 0 68)) (forall ((i_17 Int) (i_17_1 Int) ) (!  (=> (and (and (and (and (not (= i_17 i_17_1)) (and (<= 0 i_17) (< i_17 6))) (and (<= 0 i_17_1) (< i_17_1 6))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (aloc ExhaleHeap@0 arr2 i_17) (aloc ExhaleHeap@0 arr2 i_17_1))))
 :qid |stdinbpl.910:19|
 :skolemid |83|
))) (=> (forall ((i_17@@0 Int) (i_17_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_17@@0 i_17_1@@0)) (and (<= 0 i_17@@0) (< i_17@@0 6))) (and (<= 0 i_17_1@@0) (< i_17_1@@0 6))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (aloc ExhaleHeap@0 arr2 i_17@@0) (aloc ExhaleHeap@0 arr2 i_17_1@@0))))
 :qid |stdinbpl.910:19|
 :skolemid |83|
)) (=> (forall ((i_17@@1 Int) ) (!  (=> (and (and (<= 0 i_17@@1) (< i_17@@1 6)) (< NoPerm FullPerm)) (and (qpRange9 (aloc ExhaleHeap@0 arr2 i_17@@1)) (= (invRecv9 (aloc ExhaleHeap@0 arr2 i_17@@1)) i_17@@1)))
 :qid |stdinbpl.916:26|
 :skolemid |84|
 :pattern ( (|aloc#frame| EmptyFrame arr2 i_17@@1))
 :pattern ( (MapType0Select ExhaleHeap@0 (|aloc#frame| EmptyFrame arr2 i_17@@1) vint))
)) (=> (and (forall ((o_3@@6 T@U) ) (!  (=> (= (type o_3@@6) RefType) (=> (and (and (and (<= 0 (invRecv9 o_3@@6)) (< (invRecv9 o_3@@6) 6)) (< NoPerm FullPerm)) (qpRange9 o_3@@6)) (= (aloc ExhaleHeap@0 arr2 (invRecv9 o_3@@6)) o_3@@6)))
 :qid |stdinbpl.920:26|
 :skolemid |85|
 :pattern ( (invRecv9 o_3@@6))
)) (forall ((i_17@@2 Int) ) (!  (=> (and (<= 0 i_17@@2) (< i_17@@2 6)) (not (= (aloc ExhaleHeap@0 arr2 i_17@@2) null)))
 :qid |stdinbpl.926:26|
 :skolemid |86|
 :pattern ( (|aloc#frame| EmptyFrame arr2 i_17@@2))
 :pattern ( (MapType0Select ExhaleHeap@0 (|aloc#frame| EmptyFrame arr2 i_17@@2) vint))
))) (=> (and (and (forall ((o_3@@7 T@U) ) (!  (=> (= (type o_3@@7) RefType) (and (=> (and (and (and (<= 0 (invRecv9 o_3@@7)) (< (invRecv9 o_3@@7) 6)) (< NoPerm FullPerm)) (qpRange9 o_3@@7)) (and (=> (< NoPerm FullPerm) (= (aloc ExhaleHeap@0 arr2 (invRecv9 o_3@@7)) o_3@@7)) (= (U_2_real (MapType1Select QPMask@5 o_3@@7 vint)) (+ (U_2_real (MapType1Select ZeroMask o_3@@7 vint)) FullPerm)))) (=> (not (and (and (and (<= 0 (invRecv9 o_3@@7)) (< (invRecv9 o_3@@7) 6)) (< NoPerm FullPerm)) (qpRange9 o_3@@7))) (= (U_2_real (MapType1Select QPMask@5 o_3@@7 vint)) (U_2_real (MapType1Select ZeroMask o_3@@7 vint))))))
 :qid |stdinbpl.932:26|
 :skolemid |87|
 :pattern ( (MapType1Select QPMask@5 o_3@@7 vint))
)) (forall ((o_3@@8 T@U) (f_5@@1 T@U) ) (! (let ((B@@13 (FieldTypeInv1 (type f_5@@1))))
(let ((A@@14 (FieldTypeInv0 (type f_5@@1))))
 (=> (and (and (= (type o_3@@8) RefType) (= (type f_5@@1) (FieldType A@@14 B@@13))) (not (= f_5@@1 vint))) (= (U_2_real (MapType1Select ZeroMask o_3@@8 f_5@@1)) (U_2_real (MapType1Select QPMask@5 o_3@@8 f_5@@1))))))
 :qid |stdinbpl.936:33|
 :skolemid |88|
 :pattern ( (MapType1Select ZeroMask o_3@@8 f_5@@1))
 :pattern ( (MapType1Select QPMask@5 o_3@@8 f_5@@1))
))) (and (state ExhaleHeap@0 QPMask@5) (state ExhaleHeap@0 QPMask@5))) (and (=> (= (ControlFlow 0 63) (- 0 67)) (forall ((i_18 Int) (i_18_1 Int) ) (!  (=> (and (and (and (and (not (= i_18 i_18_1)) (and (<= 6 i_18) (< i_18 12))) (and (<= 6 i_18_1) (< i_18_1 12))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= (aloc ExhaleHeap@0 arr2 i_18) (aloc ExhaleHeap@0 arr2 i_18_1))))
 :qid |stdinbpl.945:19|
 :skolemid |89|
))) (=> (forall ((i_18@@0 Int) (i_18_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_18@@0 i_18_1@@0)) (and (<= 6 i_18@@0) (< i_18@@0 12))) (and (<= 6 i_18_1@@0) (< i_18_1@@0 12))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= (aloc ExhaleHeap@0 arr2 i_18@@0) (aloc ExhaleHeap@0 arr2 i_18_1@@0))))
 :qid |stdinbpl.945:19|
 :skolemid |89|
)) (=> (and (forall ((i_18@@1 Int) ) (!  (=> (and (and (<= 6 i_18@@1) (< i_18@@1 12)) (< NoPerm (/ (to_real 1) (to_real 2)))) (and (qpRange10 (aloc ExhaleHeap@0 arr2 i_18@@1)) (= (invRecv10 (aloc ExhaleHeap@0 arr2 i_18@@1)) i_18@@1)))
 :qid |stdinbpl.951:26|
 :skolemid |90|
 :pattern ( (|aloc#frame| EmptyFrame arr2 i_18@@1))
 :pattern ( (MapType0Select ExhaleHeap@0 (|aloc#frame| EmptyFrame arr2 i_18@@1) vint))
)) (forall ((o_3@@9 T@U) ) (!  (=> (= (type o_3@@9) RefType) (=> (and (and (and (<= 6 (invRecv10 o_3@@9)) (< (invRecv10 o_3@@9) 12)) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange10 o_3@@9)) (= (aloc ExhaleHeap@0 arr2 (invRecv10 o_3@@9)) o_3@@9)))
 :qid |stdinbpl.955:26|
 :skolemid |91|
 :pattern ( (invRecv10 o_3@@9))
))) (and (=> (= (ControlFlow 0 63) (- 0 66)) (forall ((i_18@@2 Int) ) (!  (=> (and (<= 6 i_18@@2) (< i_18@@2 12)) (>= (/ (to_real 1) (to_real 2)) NoPerm))
 :qid |stdinbpl.961:19|
 :skolemid |92|
 :pattern ( (|aloc#frame| EmptyFrame arr2 i_18@@2))
 :pattern ( (MapType0Select ExhaleHeap@0 (|aloc#frame| EmptyFrame arr2 i_18@@2) vint))
))) (=> (forall ((i_18@@3 Int) ) (!  (=> (and (<= 6 i_18@@3) (< i_18@@3 12)) (>= (/ (to_real 1) (to_real 2)) NoPerm))
 :qid |stdinbpl.961:19|
 :skolemid |92|
 :pattern ( (|aloc#frame| EmptyFrame arr2 i_18@@3))
 :pattern ( (MapType0Select ExhaleHeap@0 (|aloc#frame| EmptyFrame arr2 i_18@@3) vint))
)) (=> (forall ((i_18@@4 Int) ) (!  (=> (and (and (<= 6 i_18@@4) (< i_18@@4 12)) (> (/ (to_real 1) (to_real 2)) NoPerm)) (not (= (aloc ExhaleHeap@0 arr2 i_18@@4) null)))
 :qid |stdinbpl.967:26|
 :skolemid |93|
 :pattern ( (|aloc#frame| EmptyFrame arr2 i_18@@4))
 :pattern ( (MapType0Select ExhaleHeap@0 (|aloc#frame| EmptyFrame arr2 i_18@@4) vint))
)) (=> (and (and (forall ((o_3@@10 T@U) ) (!  (=> (= (type o_3@@10) RefType) (and (=> (and (and (and (<= 6 (invRecv10 o_3@@10)) (< (invRecv10 o_3@@10) 12)) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange10 o_3@@10)) (and (=> (< NoPerm (/ (to_real 1) (to_real 2))) (= (aloc ExhaleHeap@0 arr2 (invRecv10 o_3@@10)) o_3@@10)) (= (U_2_real (MapType1Select QPMask@6 o_3@@10 vint)) (+ (U_2_real (MapType1Select QPMask@5 o_3@@10 vint)) (/ (to_real 1) (to_real 2)))))) (=> (not (and (and (and (<= 6 (invRecv10 o_3@@10)) (< (invRecv10 o_3@@10) 12)) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange10 o_3@@10))) (= (U_2_real (MapType1Select QPMask@6 o_3@@10 vint)) (U_2_real (MapType1Select QPMask@5 o_3@@10 vint))))))
 :qid |stdinbpl.973:26|
 :skolemid |94|
 :pattern ( (MapType1Select QPMask@6 o_3@@10 vint))
)) (forall ((o_3@@11 T@U) (f_5@@2 T@U) ) (! (let ((B@@14 (FieldTypeInv1 (type f_5@@2))))
(let ((A@@15 (FieldTypeInv0 (type f_5@@2))))
 (=> (and (and (= (type o_3@@11) RefType) (= (type f_5@@2) (FieldType A@@15 B@@14))) (not (= f_5@@2 vint))) (= (U_2_real (MapType1Select QPMask@5 o_3@@11 f_5@@2)) (U_2_real (MapType1Select QPMask@6 o_3@@11 f_5@@2))))))
 :qid |stdinbpl.977:33|
 :skolemid |95|
 :pattern ( (MapType1Select QPMask@5 o_3@@11 f_5@@2))
 :pattern ( (MapType1Select QPMask@6 o_3@@11 f_5@@2))
))) (and (state ExhaleHeap@0 QPMask@6) (state ExhaleHeap@0 QPMask@6))) (and (=> (= (ControlFlow 0 63) (- 0 65)) (forall ((i_19 Int) (i_19_1 Int) ) (!  (=> (and (and (and (and (not (= i_19 i_19_1)) (and (<= 0 i_19) (< i_19 6))) (and (<= 0 i_19_1) (< i_19_1 6))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= (aloc ExhaleHeap@0 arr1 i_19) (aloc ExhaleHeap@0 arr1 i_19_1))))
 :qid |stdinbpl.986:19|
 :skolemid |96|
))) (=> (forall ((i_19@@0 Int) (i_19_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_19@@0 i_19_1@@0)) (and (<= 0 i_19@@0) (< i_19@@0 6))) (and (<= 0 i_19_1@@0) (< i_19_1@@0 6))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= (aloc ExhaleHeap@0 arr1 i_19@@0) (aloc ExhaleHeap@0 arr1 i_19_1@@0))))
 :qid |stdinbpl.986:19|
 :skolemid |96|
)) (=> (and (forall ((i_19@@1 Int) ) (!  (=> (and (and (<= 0 i_19@@1) (< i_19@@1 6)) (< NoPerm (/ (to_real 1) (to_real 2)))) (and (qpRange11 (aloc ExhaleHeap@0 arr1 i_19@@1)) (= (invRecv11 (aloc ExhaleHeap@0 arr1 i_19@@1)) i_19@@1)))
 :qid |stdinbpl.992:26|
 :skolemid |97|
 :pattern ( (|aloc#frame| EmptyFrame arr1 i_19@@1))
 :pattern ( (MapType0Select ExhaleHeap@0 (|aloc#frame| EmptyFrame arr1 i_19@@1) vint))
)) (forall ((o_3@@12 T@U) ) (!  (=> (= (type o_3@@12) RefType) (=> (and (and (and (<= 0 (invRecv11 o_3@@12)) (< (invRecv11 o_3@@12) 6)) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange11 o_3@@12)) (= (aloc ExhaleHeap@0 arr1 (invRecv11 o_3@@12)) o_3@@12)))
 :qid |stdinbpl.996:26|
 :skolemid |98|
 :pattern ( (invRecv11 o_3@@12))
))) (and (=> (= (ControlFlow 0 63) (- 0 64)) (forall ((i_19@@2 Int) ) (!  (=> (and (<= 0 i_19@@2) (< i_19@@2 6)) (>= (/ (to_real 1) (to_real 2)) NoPerm))
 :qid |stdinbpl.1002:19|
 :skolemid |99|
 :pattern ( (|aloc#frame| EmptyFrame arr1 i_19@@2))
 :pattern ( (MapType0Select ExhaleHeap@0 (|aloc#frame| EmptyFrame arr1 i_19@@2) vint))
))) (=> (forall ((i_19@@3 Int) ) (!  (=> (and (<= 0 i_19@@3) (< i_19@@3 6)) (>= (/ (to_real 1) (to_real 2)) NoPerm))
 :qid |stdinbpl.1002:19|
 :skolemid |99|
 :pattern ( (|aloc#frame| EmptyFrame arr1 i_19@@3))
 :pattern ( (MapType0Select ExhaleHeap@0 (|aloc#frame| EmptyFrame arr1 i_19@@3) vint))
)) (=> (and (forall ((i_19@@4 Int) ) (!  (=> (and (and (<= 0 i_19@@4) (< i_19@@4 6)) (> (/ (to_real 1) (to_real 2)) NoPerm)) (not (= (aloc ExhaleHeap@0 arr1 i_19@@4) null)))
 :qid |stdinbpl.1008:26|
 :skolemid |100|
 :pattern ( (|aloc#frame| EmptyFrame arr1 i_19@@4))
 :pattern ( (MapType0Select ExhaleHeap@0 (|aloc#frame| EmptyFrame arr1 i_19@@4) vint))
)) (forall ((o_3@@13 T@U) ) (!  (=> (= (type o_3@@13) RefType) (and (=> (and (and (and (<= 0 (invRecv11 o_3@@13)) (< (invRecv11 o_3@@13) 6)) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange11 o_3@@13)) (and (=> (< NoPerm (/ (to_real 1) (to_real 2))) (= (aloc ExhaleHeap@0 arr1 (invRecv11 o_3@@13)) o_3@@13)) (= (U_2_real (MapType1Select QPMask@7 o_3@@13 vint)) (+ (U_2_real (MapType1Select QPMask@6 o_3@@13 vint)) (/ (to_real 1) (to_real 2)))))) (=> (not (and (and (and (<= 0 (invRecv11 o_3@@13)) (< (invRecv11 o_3@@13) 6)) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange11 o_3@@13))) (= (U_2_real (MapType1Select QPMask@7 o_3@@13 vint)) (U_2_real (MapType1Select QPMask@6 o_3@@13 vint))))))
 :qid |stdinbpl.1014:26|
 :skolemid |101|
 :pattern ( (MapType1Select QPMask@7 o_3@@13 vint))
))) (=> (and (and (forall ((o_3@@14 T@U) (f_5@@3 T@U) ) (! (let ((B@@15 (FieldTypeInv1 (type f_5@@3))))
(let ((A@@16 (FieldTypeInv0 (type f_5@@3))))
 (=> (and (and (= (type o_3@@14) RefType) (= (type f_5@@3) (FieldType A@@16 B@@15))) (not (= f_5@@3 vint))) (= (U_2_real (MapType1Select QPMask@6 o_3@@14 f_5@@3)) (U_2_real (MapType1Select QPMask@7 o_3@@14 f_5@@3))))))
 :qid |stdinbpl.1018:33|
 :skolemid |102|
 :pattern ( (MapType1Select QPMask@6 o_3@@14 f_5@@3))
 :pattern ( (MapType1Select QPMask@7 o_3@@14 f_5@@3))
)) (state ExhaleHeap@0 QPMask@7)) (and (state ExhaleHeap@0 QPMask@7) (state ExhaleHeap@0 QPMask@7))) (and (=> (= (ControlFlow 0 63) 45) anon75_Then_correct) (=> (= (ControlFlow 0 63) 61) anon75_Else_correct)))))))))))))))))))))))))
(let ((anon74_Else_correct true))
(let ((anon59_Else_correct  (=> (forall ((i_7_1 Int) ) (!  (=> (and (<= 0 i_7_1) (< i_7_1 6)) (= (U_2_int (MapType0Select Heap@@13 (aloc Heap@@13 arr2 i_7_1) vint)) (* 0 (- (U_2_int (MapType0Select Heap@@13 (aloc Heap@@13 arr1 i_7_1) vint)) (U_2_int (MapType0Select Heap@@13 (aloc Heap@@13 arr1 0) vint))))))
 :qid |stdinbpl.556:20|
 :skolemid |42|
 :pattern ( (MapType0Select Heap@@13 (|aloc#frame| EmptyFrame arr2 i_7_1) vint))
)) (=> (and (state Heap@@13 QPMask@1) (state Heap@@13 QPMask@1)) (and (=> (= (ControlFlow 0 96) (- 0 105)) (= 0 0)) (=> (= 0 0) (and (=> (= (ControlFlow 0 96) (- 0 104)) (forall ((i_8 Int) (i_8_1 Int) ) (!  (=> (and (and (and (and (not (= i_8 i_8_1)) (and (<= 0 i_8) (< i_8 6))) (and (<= 0 i_8_1) (< i_8_1 6))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (aloc Heap@@13 arr2 i_8) (aloc Heap@@13 arr2 i_8_1))))
 :qid |stdinbpl.588:21|
 :skolemid |43|
 :pattern ( (neverTriggered3 i_8) (neverTriggered3 i_8_1))
))) (=> (forall ((i_8@@0 Int) (i_8_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_8@@0 i_8_1@@0)) (and (<= 0 i_8@@0) (< i_8@@0 6))) (and (<= 0 i_8_1@@0) (< i_8_1@@0 6))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (aloc Heap@@13 arr2 i_8@@0) (aloc Heap@@13 arr2 i_8_1@@0))))
 :qid |stdinbpl.588:21|
 :skolemid |43|
 :pattern ( (neverTriggered3 i_8@@0) (neverTriggered3 i_8_1@@0))
)) (and (=> (= (ControlFlow 0 96) (- 0 103)) (forall ((i_8@@1 Int) ) (!  (=> (and (<= 0 i_8@@1) (< i_8@@1 6)) (>= (U_2_real (MapType1Select QPMask@1 (aloc Heap@@13 arr2 i_8@@1) vint)) FullPerm))
 :qid |stdinbpl.595:21|
 :skolemid |44|
 :pattern ( (|aloc#frame| EmptyFrame arr2 i_8@@1))
 :pattern ( (MapType0Select Heap@@13 (|aloc#frame| EmptyFrame arr2 i_8@@1) vint))
))) (=> (forall ((i_8@@2 Int) ) (!  (=> (and (<= 0 i_8@@2) (< i_8@@2 6)) (>= (U_2_real (MapType1Select QPMask@1 (aloc Heap@@13 arr2 i_8@@2) vint)) FullPerm))
 :qid |stdinbpl.595:21|
 :skolemid |44|
 :pattern ( (|aloc#frame| EmptyFrame arr2 i_8@@2))
 :pattern ( (MapType0Select Heap@@13 (|aloc#frame| EmptyFrame arr2 i_8@@2) vint))
)) (=> (and (and (forall ((i_8@@3 Int) ) (!  (=> (and (and (<= 0 i_8@@3) (< i_8@@3 6)) (< NoPerm FullPerm)) (and (qpRange3 (aloc Heap@@13 arr2 i_8@@3)) (= (invRecv3 (aloc Heap@@13 arr2 i_8@@3)) i_8@@3)))
 :qid |stdinbpl.601:26|
 :skolemid |45|
 :pattern ( (|aloc#frame| EmptyFrame arr2 i_8@@3))
 :pattern ( (MapType0Select Heap@@13 (|aloc#frame| EmptyFrame arr2 i_8@@3) vint))
)) (forall ((o_3@@15 T@U) ) (!  (=> (= (type o_3@@15) RefType) (=> (and (and (<= 0 (invRecv3 o_3@@15)) (< (invRecv3 o_3@@15) 6)) (and (< NoPerm FullPerm) (qpRange3 o_3@@15))) (= (aloc Heap@@13 arr2 (invRecv3 o_3@@15)) o_3@@15)))
 :qid |stdinbpl.605:26|
 :skolemid |46|
 :pattern ( (invRecv3 o_3@@15))
))) (and (forall ((o_3@@16 T@U) ) (!  (=> (= (type o_3@@16) RefType) (and (=> (and (and (<= 0 (invRecv3 o_3@@16)) (< (invRecv3 o_3@@16) 6)) (and (< NoPerm FullPerm) (qpRange3 o_3@@16))) (and (= (aloc Heap@@13 arr2 (invRecv3 o_3@@16)) o_3@@16) (= (U_2_real (MapType1Select QPMask@2 o_3@@16 vint)) (- (U_2_real (MapType1Select QPMask@1 o_3@@16 vint)) FullPerm)))) (=> (not (and (and (<= 0 (invRecv3 o_3@@16)) (< (invRecv3 o_3@@16) 6)) (and (< NoPerm FullPerm) (qpRange3 o_3@@16)))) (= (U_2_real (MapType1Select QPMask@2 o_3@@16 vint)) (U_2_real (MapType1Select QPMask@1 o_3@@16 vint))))))
 :qid |stdinbpl.611:26|
 :skolemid |47|
 :pattern ( (MapType1Select QPMask@2 o_3@@16 vint))
)) (forall ((o_3@@17 T@U) (f_5@@4 T@U) ) (! (let ((B@@16 (FieldTypeInv1 (type f_5@@4))))
(let ((A@@17 (FieldTypeInv0 (type f_5@@4))))
 (=> (and (and (= (type o_3@@17) RefType) (= (type f_5@@4) (FieldType A@@17 B@@16))) (not (= f_5@@4 vint))) (= (U_2_real (MapType1Select QPMask@1 o_3@@17 f_5@@4)) (U_2_real (MapType1Select QPMask@2 o_3@@17 f_5@@4))))))
 :qid |stdinbpl.617:33|
 :skolemid |48|
 :pattern ( (MapType1Select QPMask@2 o_3@@17 f_5@@4))
)))) (and (=> (= (ControlFlow 0 96) (- 0 102)) (forall ((i_9 Int) ) (!  (=> (and (and (<= 6 i_9) (< i_9 12)) (dummyFunction (MapType0Select Heap@@13 (aloc Heap@@13 arr2 i_9) vint))) (>= (/ (to_real 1) (to_real 2)) NoPerm))
 :qid |stdinbpl.626:21|
 :skolemid |49|
 :pattern ( (|aloc#frame| EmptyFrame arr2 i_9))
 :pattern ( (MapType0Select Heap@@13 (|aloc#frame| EmptyFrame arr2 i_9) vint))
))) (=> (forall ((i_9@@0 Int) ) (!  (=> (and (and (<= 6 i_9@@0) (< i_9@@0 12)) (dummyFunction (MapType0Select Heap@@13 (aloc Heap@@13 arr2 i_9@@0) vint))) (>= (/ (to_real 1) (to_real 2)) NoPerm))
 :qid |stdinbpl.626:21|
 :skolemid |49|
 :pattern ( (|aloc#frame| EmptyFrame arr2 i_9@@0))
 :pattern ( (MapType0Select Heap@@13 (|aloc#frame| EmptyFrame arr2 i_9@@0) vint))
)) (and (=> (= (ControlFlow 0 96) (- 0 101)) (forall ((i_9@@1 Int) (i_9_1 Int) ) (!  (=> (and (and (and (and (not (= i_9@@1 i_9_1)) (and (<= 6 i_9@@1) (< i_9@@1 12))) (and (<= 6 i_9_1) (< i_9_1 12))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= (aloc Heap@@13 arr2 i_9@@1) (aloc Heap@@13 arr2 i_9_1))))
 :qid |stdinbpl.633:21|
 :skolemid |50|
 :pattern ( (neverTriggered4 i_9@@1) (neverTriggered4 i_9_1))
))) (=> (forall ((i_9@@2 Int) (i_9_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_9@@2 i_9_1@@0)) (and (<= 6 i_9@@2) (< i_9@@2 12))) (and (<= 6 i_9_1@@0) (< i_9_1@@0 12))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= (aloc Heap@@13 arr2 i_9@@2) (aloc Heap@@13 arr2 i_9_1@@0))))
 :qid |stdinbpl.633:21|
 :skolemid |50|
 :pattern ( (neverTriggered4 i_9@@2) (neverTriggered4 i_9_1@@0))
)) (and (=> (= (ControlFlow 0 96) (- 0 100)) (forall ((i_9@@3 Int) ) (!  (=> (and (<= 6 i_9@@3) (< i_9@@3 12)) (>= (U_2_real (MapType1Select QPMask@2 (aloc Heap@@13 arr2 i_9@@3) vint)) (/ (to_real 1) (to_real 2))))
 :qid |stdinbpl.640:21|
 :skolemid |51|
 :pattern ( (|aloc#frame| EmptyFrame arr2 i_9@@3))
 :pattern ( (MapType0Select Heap@@13 (|aloc#frame| EmptyFrame arr2 i_9@@3) vint))
))) (=> (forall ((i_9@@4 Int) ) (!  (=> (and (<= 6 i_9@@4) (< i_9@@4 12)) (>= (U_2_real (MapType1Select QPMask@2 (aloc Heap@@13 arr2 i_9@@4) vint)) (/ (to_real 1) (to_real 2))))
 :qid |stdinbpl.640:21|
 :skolemid |51|
 :pattern ( (|aloc#frame| EmptyFrame arr2 i_9@@4))
 :pattern ( (MapType0Select Heap@@13 (|aloc#frame| EmptyFrame arr2 i_9@@4) vint))
)) (=> (and (and (forall ((i_9@@5 Int) ) (!  (=> (and (and (<= 6 i_9@@5) (< i_9@@5 12)) (< NoPerm (/ (to_real 1) (to_real 2)))) (and (qpRange4 (aloc Heap@@13 arr2 i_9@@5)) (= (invRecv4 (aloc Heap@@13 arr2 i_9@@5)) i_9@@5)))
 :qid |stdinbpl.646:26|
 :skolemid |52|
 :pattern ( (|aloc#frame| EmptyFrame arr2 i_9@@5))
 :pattern ( (MapType0Select Heap@@13 (|aloc#frame| EmptyFrame arr2 i_9@@5) vint))
)) (forall ((o_3@@18 T@U) ) (!  (=> (= (type o_3@@18) RefType) (=> (and (and (<= 6 (invRecv4 o_3@@18)) (< (invRecv4 o_3@@18) 12)) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange4 o_3@@18))) (= (aloc Heap@@13 arr2 (invRecv4 o_3@@18)) o_3@@18)))
 :qid |stdinbpl.650:26|
 :skolemid |53|
 :pattern ( (invRecv4 o_3@@18))
))) (and (forall ((o_3@@19 T@U) ) (!  (=> (= (type o_3@@19) RefType) (and (=> (and (and (<= 6 (invRecv4 o_3@@19)) (< (invRecv4 o_3@@19) 12)) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange4 o_3@@19))) (and (= (aloc Heap@@13 arr2 (invRecv4 o_3@@19)) o_3@@19) (= (U_2_real (MapType1Select QPMask@3 o_3@@19 vint)) (- (U_2_real (MapType1Select QPMask@2 o_3@@19 vint)) (/ (to_real 1) (to_real 2)))))) (=> (not (and (and (<= 6 (invRecv4 o_3@@19)) (< (invRecv4 o_3@@19) 12)) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange4 o_3@@19)))) (= (U_2_real (MapType1Select QPMask@3 o_3@@19 vint)) (U_2_real (MapType1Select QPMask@2 o_3@@19 vint))))))
 :qid |stdinbpl.656:26|
 :skolemid |54|
 :pattern ( (MapType1Select QPMask@3 o_3@@19 vint))
)) (forall ((o_3@@20 T@U) (f_5@@5 T@U) ) (! (let ((B@@17 (FieldTypeInv1 (type f_5@@5))))
(let ((A@@18 (FieldTypeInv0 (type f_5@@5))))
 (=> (and (and (= (type o_3@@20) RefType) (= (type f_5@@5) (FieldType A@@18 B@@17))) (not (= f_5@@5 vint))) (= (U_2_real (MapType1Select QPMask@2 o_3@@20 f_5@@5)) (U_2_real (MapType1Select QPMask@3 o_3@@20 f_5@@5))))))
 :qid |stdinbpl.662:33|
 :skolemid |55|
 :pattern ( (MapType1Select QPMask@3 o_3@@20 f_5@@5))
)))) (and (=> (= (ControlFlow 0 96) (- 0 99)) (forall ((i_10 Int) ) (!  (=> (and (and (<= 0 i_10) (< i_10 6)) (dummyFunction (MapType0Select Heap@@13 (aloc Heap@@13 arr1 i_10) vint))) (>= (/ (to_real 1) (to_real 2)) NoPerm))
 :qid |stdinbpl.671:21|
 :skolemid |56|
 :pattern ( (|aloc#frame| EmptyFrame arr1 i_10))
 :pattern ( (MapType0Select Heap@@13 (|aloc#frame| EmptyFrame arr1 i_10) vint))
))) (=> (forall ((i_10@@0 Int) ) (!  (=> (and (and (<= 0 i_10@@0) (< i_10@@0 6)) (dummyFunction (MapType0Select Heap@@13 (aloc Heap@@13 arr1 i_10@@0) vint))) (>= (/ (to_real 1) (to_real 2)) NoPerm))
 :qid |stdinbpl.671:21|
 :skolemid |56|
 :pattern ( (|aloc#frame| EmptyFrame arr1 i_10@@0))
 :pattern ( (MapType0Select Heap@@13 (|aloc#frame| EmptyFrame arr1 i_10@@0) vint))
)) (and (=> (= (ControlFlow 0 96) (- 0 98)) (forall ((i_10@@1 Int) (i_10_1 Int) ) (!  (=> (and (and (and (and (not (= i_10@@1 i_10_1)) (and (<= 0 i_10@@1) (< i_10@@1 6))) (and (<= 0 i_10_1) (< i_10_1 6))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= (aloc Heap@@13 arr1 i_10@@1) (aloc Heap@@13 arr1 i_10_1))))
 :qid |stdinbpl.678:21|
 :skolemid |57|
 :pattern ( (neverTriggered5 i_10@@1) (neverTriggered5 i_10_1))
))) (=> (forall ((i_10@@2 Int) (i_10_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_10@@2 i_10_1@@0)) (and (<= 0 i_10@@2) (< i_10@@2 6))) (and (<= 0 i_10_1@@0) (< i_10_1@@0 6))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= (aloc Heap@@13 arr1 i_10@@2) (aloc Heap@@13 arr1 i_10_1@@0))))
 :qid |stdinbpl.678:21|
 :skolemid |57|
 :pattern ( (neverTriggered5 i_10@@2) (neverTriggered5 i_10_1@@0))
)) (and (=> (= (ControlFlow 0 96) (- 0 97)) (forall ((i_10@@3 Int) ) (!  (=> (and (<= 0 i_10@@3) (< i_10@@3 6)) (>= (U_2_real (MapType1Select QPMask@3 (aloc Heap@@13 arr1 i_10@@3) vint)) (/ (to_real 1) (to_real 2))))
 :qid |stdinbpl.685:21|
 :skolemid |58|
 :pattern ( (|aloc#frame| EmptyFrame arr1 i_10@@3))
 :pattern ( (MapType0Select Heap@@13 (|aloc#frame| EmptyFrame arr1 i_10@@3) vint))
))) (=> (forall ((i_10@@4 Int) ) (!  (=> (and (<= 0 i_10@@4) (< i_10@@4 6)) (>= (U_2_real (MapType1Select QPMask@3 (aloc Heap@@13 arr1 i_10@@4) vint)) (/ (to_real 1) (to_real 2))))
 :qid |stdinbpl.685:21|
 :skolemid |58|
 :pattern ( (|aloc#frame| EmptyFrame arr1 i_10@@4))
 :pattern ( (MapType0Select Heap@@13 (|aloc#frame| EmptyFrame arr1 i_10@@4) vint))
)) (=> (forall ((i_10@@5 Int) ) (!  (=> (and (and (<= 0 i_10@@5) (< i_10@@5 6)) (< NoPerm (/ (to_real 1) (to_real 2)))) (and (qpRange5 (aloc Heap@@13 arr1 i_10@@5)) (= (invRecv5 (aloc Heap@@13 arr1 i_10@@5)) i_10@@5)))
 :qid |stdinbpl.691:26|
 :skolemid |59|
 :pattern ( (|aloc#frame| EmptyFrame arr1 i_10@@5))
 :pattern ( (MapType0Select Heap@@13 (|aloc#frame| EmptyFrame arr1 i_10@@5) vint))
)) (=> (and (and (forall ((o_3@@21 T@U) ) (!  (=> (= (type o_3@@21) RefType) (=> (and (and (<= 0 (invRecv5 o_3@@21)) (< (invRecv5 o_3@@21) 6)) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange5 o_3@@21))) (= (aloc Heap@@13 arr1 (invRecv5 o_3@@21)) o_3@@21)))
 :qid |stdinbpl.695:26|
 :skolemid |60|
 :pattern ( (invRecv5 o_3@@21))
)) (forall ((o_3@@22 T@U) ) (!  (=> (= (type o_3@@22) RefType) (and (=> (and (and (<= 0 (invRecv5 o_3@@22)) (< (invRecv5 o_3@@22) 6)) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange5 o_3@@22))) (and (= (aloc Heap@@13 arr1 (invRecv5 o_3@@22)) o_3@@22) (= (U_2_real (MapType1Select QPMask@4 o_3@@22 vint)) (- (U_2_real (MapType1Select QPMask@3 o_3@@22 vint)) (/ (to_real 1) (to_real 2)))))) (=> (not (and (and (<= 0 (invRecv5 o_3@@22)) (< (invRecv5 o_3@@22) 6)) (and (< NoPerm (/ (to_real 1) (to_real 2))) (qpRange5 o_3@@22)))) (= (U_2_real (MapType1Select QPMask@4 o_3@@22 vint)) (U_2_real (MapType1Select QPMask@3 o_3@@22 vint))))))
 :qid |stdinbpl.701:26|
 :skolemid |61|
 :pattern ( (MapType1Select QPMask@4 o_3@@22 vint))
))) (and (forall ((o_3@@23 T@U) (f_5@@6 T@U) ) (! (let ((B@@18 (FieldTypeInv1 (type f_5@@6))))
(let ((A@@19 (FieldTypeInv0 (type f_5@@6))))
 (=> (and (and (= (type o_3@@23) RefType) (= (type f_5@@6) (FieldType A@@19 B@@18))) (not (= f_5@@6 vint))) (= (U_2_real (MapType1Select QPMask@3 o_3@@23 f_5@@6)) (U_2_real (MapType1Select QPMask@4 o_3@@23 f_5@@6))))))
 :qid |stdinbpl.707:33|
 :skolemid |62|
 :pattern ( (MapType1Select QPMask@4 o_3@@23 f_5@@6))
)) (IdenticalOnKnownLocations Heap@@13 ExhaleHeap@0 QPMask@4))) (and (and (=> (= (ControlFlow 0 96) 95) anon64_Then_correct) (=> (= (ControlFlow 0 96) 63) anon74_Then_correct)) (=> (= (ControlFlow 0 96) 39) anon74_Else_correct))))))))))))))))))))))))))))
(let ((anon63_Then_correct  (=> (= (ControlFlow 0 30) (- 0 29)) (< 0 (alen arr1)))))
(let ((anon62_Then_correct  (and (=> (= (ControlFlow 0 27) (- 0 28)) (<= 0 i_7)) (=> (<= 0 i_7) (=> (= (ControlFlow 0 27) (- 0 26)) (< i_7 (alen arr1)))))))
(let ((anon61_Then_correct  (and (=> (= (ControlFlow 0 24) (- 0 25)) (<= 0 i_7)) (=> (<= 0 i_7) (=> (= (ControlFlow 0 24) (- 0 23)) (< i_7 (alen arr2)))))))
(let ((anon25_correct true))
(let ((anon63_Else_correct  (and (=> (= (ControlFlow 0 31) (- 0 32)) (HasDirectPerm QPMask@1 (aloc Heap@@13 arr1 0) vint)) (=> (HasDirectPerm QPMask@1 (aloc Heap@@13 arr1 0) vint) (=> (= (ControlFlow 0 31) 21) anon25_correct)))))
(let ((anon62_Else_correct  (and (=> (= (ControlFlow 0 33) (- 0 34)) (HasDirectPerm QPMask@1 (aloc Heap@@13 arr1 i_7) vint)) (=> (HasDirectPerm QPMask@1 (aloc Heap@@13 arr1 i_7) vint) (and (=> (= (ControlFlow 0 33) 30) anon63_Then_correct) (=> (= (ControlFlow 0 33) 31) anon63_Else_correct))))))
(let ((anon61_Else_correct  (and (=> (= (ControlFlow 0 35) (- 0 36)) (HasDirectPerm QPMask@1 (aloc Heap@@13 arr2 i_7) vint)) (=> (HasDirectPerm QPMask@1 (aloc Heap@@13 arr2 i_7) vint) (and (=> (= (ControlFlow 0 35) 27) anon62_Then_correct) (=> (= (ControlFlow 0 35) 33) anon62_Else_correct))))))
(let ((anon60_Then_correct  (=> (and (<= 0 i_7) (< i_7 6)) (and (=> (= (ControlFlow 0 37) 24) anon61_Then_correct) (=> (= (ControlFlow 0 37) 35) anon61_Else_correct)))))
(let ((anon60_Else_correct  (=> (and (not (and (<= 0 i_7) (< i_7 6))) (= (ControlFlow 0 22) 21)) anon25_correct)))
(let ((anon56_Else_correct  (and (=> (= (ControlFlow 0 106) (- 0 107)) (forall ((i_5 Int) (i_5_1 Int) ) (!  (=> (and (and (and (and (not (= i_5 i_5_1)) (and (<= 0 i_5) (< i_5 12))) (and (<= 0 i_5_1) (< i_5_1 12))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (aloc Heap@@13 arr2 i_5) (aloc Heap@@13 arr2 i_5_1))))
 :qid |stdinbpl.478:15|
 :skolemid |36|
))) (=> (forall ((i_5@@0 Int) (i_5_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_5@@0 i_5_1@@0)) (and (<= 0 i_5@@0) (< i_5@@0 12))) (and (<= 0 i_5_1@@0) (< i_5_1@@0 12))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (aloc Heap@@13 arr2 i_5@@0) (aloc Heap@@13 arr2 i_5_1@@0))))
 :qid |stdinbpl.478:15|
 :skolemid |36|
)) (=> (and (and (and (forall ((i_5@@1 Int) ) (!  (=> (and (and (<= 0 i_5@@1) (< i_5@@1 12)) (< NoPerm FullPerm)) (and (qpRange2 (aloc Heap@@13 arr2 i_5@@1)) (= (invRecv2 (aloc Heap@@13 arr2 i_5@@1)) i_5@@1)))
 :qid |stdinbpl.484:22|
 :skolemid |37|
 :pattern ( (|aloc#frame| EmptyFrame arr2 i_5@@1))
 :pattern ( (MapType0Select Heap@@13 (|aloc#frame| EmptyFrame arr2 i_5@@1) vint))
)) (forall ((o_3@@24 T@U) ) (!  (=> (= (type o_3@@24) RefType) (=> (and (and (and (<= 0 (invRecv2 o_3@@24)) (< (invRecv2 o_3@@24) 12)) (< NoPerm FullPerm)) (qpRange2 o_3@@24)) (= (aloc Heap@@13 arr2 (invRecv2 o_3@@24)) o_3@@24)))
 :qid |stdinbpl.488:22|
 :skolemid |38|
 :pattern ( (invRecv2 o_3@@24))
))) (and (forall ((i_5@@2 Int) ) (!  (=> (and (<= 0 i_5@@2) (< i_5@@2 12)) (not (= (aloc Heap@@13 arr2 i_5@@2) null)))
 :qid |stdinbpl.494:22|
 :skolemid |39|
 :pattern ( (|aloc#frame| EmptyFrame arr2 i_5@@2))
 :pattern ( (MapType0Select Heap@@13 (|aloc#frame| EmptyFrame arr2 i_5@@2) vint))
)) (forall ((o_3@@25 T@U) ) (!  (=> (= (type o_3@@25) RefType) (and (=> (and (and (and (<= 0 (invRecv2 o_3@@25)) (< (invRecv2 o_3@@25) 12)) (< NoPerm FullPerm)) (qpRange2 o_3@@25)) (and (=> (< NoPerm FullPerm) (= (aloc Heap@@13 arr2 (invRecv2 o_3@@25)) o_3@@25)) (= (U_2_real (MapType1Select QPMask@1 o_3@@25 vint)) (+ (U_2_real (MapType1Select QPMask@0 o_3@@25 vint)) FullPerm)))) (=> (not (and (and (and (<= 0 (invRecv2 o_3@@25)) (< (invRecv2 o_3@@25) 12)) (< NoPerm FullPerm)) (qpRange2 o_3@@25))) (= (U_2_real (MapType1Select QPMask@1 o_3@@25 vint)) (U_2_real (MapType1Select QPMask@0 o_3@@25 vint))))))
 :qid |stdinbpl.500:22|
 :skolemid |40|
 :pattern ( (MapType1Select QPMask@1 o_3@@25 vint))
)))) (and (and (forall ((o_3@@26 T@U) (f_5@@7 T@U) ) (! (let ((B@@19 (FieldTypeInv1 (type f_5@@7))))
(let ((A@@20 (FieldTypeInv0 (type f_5@@7))))
 (=> (and (and (= (type o_3@@26) RefType) (= (type f_5@@7) (FieldType A@@20 B@@19))) (not (= f_5@@7 vint))) (= (U_2_real (MapType1Select QPMask@0 o_3@@26 f_5@@7)) (U_2_real (MapType1Select QPMask@1 o_3@@26 f_5@@7))))))
 :qid |stdinbpl.504:29|
 :skolemid |41|
 :pattern ( (MapType1Select QPMask@0 o_3@@26 f_5@@7))
 :pattern ( (MapType1Select QPMask@1 o_3@@26 f_5@@7))
)) (state Heap@@13 QPMask@1)) (and (state Heap@@13 QPMask@1) (state Heap@@13 QPMask@1)))) (and (and (=> (= (ControlFlow 0 106) 96) anon59_Else_correct) (=> (= (ControlFlow 0 106) 37) anon60_Then_correct)) (=> (= (ControlFlow 0 106) 22) anon60_Else_correct)))))))
(let ((anon58_Then_correct  (and (=> (= (ControlFlow 0 18) (- 0 19)) (<= 0 i_6)) (=> (<= 0 i_6) (=> (= (ControlFlow 0 18) (- 0 17)) (< i_6 (alen arr2)))))))
(let ((anon15_correct true))
(let ((anon57_Then_correct  (=> (and (<= 0 i_6) (< i_6 12)) (and (=> (= (ControlFlow 0 20) 18) anon58_Then_correct) (=> (= (ControlFlow 0 20) 15) anon15_correct)))))
(let ((anon57_Else_correct  (=> (and (not (and (<= 0 i_6) (< i_6 12))) (= (ControlFlow 0 16) 15)) anon15_correct)))
(let ((anon53_Else_correct  (=> (forall ((i_3_1 Int) ) (!  (=> (and (<= 0 i_3_1) (< i_3_1 6)) (= (U_2_int (MapType0Select Heap@@13 (aloc Heap@@13 arr1 i_3_1) vint)) 0))
 :qid |stdinbpl.452:20|
 :skolemid |35|
 :pattern ( (MapType0Select Heap@@13 (|aloc#frame| EmptyFrame arr1 i_3_1) vint))
)) (=> (and (state Heap@@13 QPMask@0) (state Heap@@13 QPMask@0)) (and (and (=> (= (ControlFlow 0 108) 106) anon56_Else_correct) (=> (= (ControlFlow 0 108) 20) anon57_Then_correct)) (=> (= (ControlFlow 0 108) 16) anon57_Else_correct))))))
(let ((anon55_Then_correct  (and (=> (= (ControlFlow 0 10) (- 0 11)) (<= 0 i_4)) (=> (<= 0 i_4) (=> (= (ControlFlow 0 10) (- 0 9)) (< i_4 (alen arr1)))))))
(let ((anon10_correct true))
(let ((anon55_Else_correct  (and (=> (= (ControlFlow 0 12) (- 0 13)) (HasDirectPerm QPMask@0 (aloc Heap@@13 arr1 i_4) vint)) (=> (HasDirectPerm QPMask@0 (aloc Heap@@13 arr1 i_4) vint) (=> (= (ControlFlow 0 12) 7) anon10_correct)))))
(let ((anon54_Then_correct  (=> (and (<= 0 i_4) (< i_4 6)) (and (=> (= (ControlFlow 0 14) 10) anon55_Then_correct) (=> (= (ControlFlow 0 14) 12) anon55_Else_correct)))))
(let ((anon54_Else_correct  (=> (and (not (and (<= 0 i_4) (< i_4 6))) (= (ControlFlow 0 8) 7)) anon10_correct)))
(let ((anon50_Else_correct  (and (=> (= (ControlFlow 0 109) (- 0 111)) (forall ((i_1 Int) (i_1_1 Int) ) (!  (=> (and (and (and (and (not (= i_1 i_1_1)) (and (<= 0 i_1) (< i_1 6))) (and (<= 0 i_1_1) (< i_1_1 6))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= (aloc Heap@@13 arr1 i_1) (aloc Heap@@13 arr1 i_1_1))))
 :qid |stdinbpl.392:15|
 :skolemid |28|
))) (=> (forall ((i_1@@0 Int) (i_1_1@@0 Int) ) (!  (=> (and (and (and (and (not (= i_1@@0 i_1_1@@0)) (and (<= 0 i_1@@0) (< i_1@@0 6))) (and (<= 0 i_1_1@@0) (< i_1_1@@0 6))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (not (= (aloc Heap@@13 arr1 i_1@@0) (aloc Heap@@13 arr1 i_1_1@@0))))
 :qid |stdinbpl.392:15|
 :skolemid |28|
)) (=> (and (forall ((i_1@@1 Int) ) (!  (=> (and (and (<= 0 i_1@@1) (< i_1@@1 6)) (< NoPerm (/ (to_real 1) (to_real 2)))) (and (qpRange1 (aloc Heap@@13 arr1 i_1@@1)) (= (invRecv1 (aloc Heap@@13 arr1 i_1@@1)) i_1@@1)))
 :qid |stdinbpl.398:22|
 :skolemid |29|
 :pattern ( (|aloc#frame| EmptyFrame arr1 i_1@@1))
 :pattern ( (MapType0Select Heap@@13 (|aloc#frame| EmptyFrame arr1 i_1@@1) vint))
)) (forall ((o_3@@27 T@U) ) (!  (=> (= (type o_3@@27) RefType) (=> (and (and (and (<= 0 (invRecv1 o_3@@27)) (< (invRecv1 o_3@@27) 6)) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange1 o_3@@27)) (= (aloc Heap@@13 arr1 (invRecv1 o_3@@27)) o_3@@27)))
 :qid |stdinbpl.402:22|
 :skolemid |30|
 :pattern ( (invRecv1 o_3@@27))
))) (and (=> (= (ControlFlow 0 109) (- 0 110)) (forall ((i_1@@2 Int) ) (!  (=> (and (<= 0 i_1@@2) (< i_1@@2 6)) (>= (/ (to_real 1) (to_real 2)) NoPerm))
 :qid |stdinbpl.408:15|
 :skolemid |31|
 :pattern ( (|aloc#frame| EmptyFrame arr1 i_1@@2))
 :pattern ( (MapType0Select Heap@@13 (|aloc#frame| EmptyFrame arr1 i_1@@2) vint))
))) (=> (forall ((i_1@@3 Int) ) (!  (=> (and (<= 0 i_1@@3) (< i_1@@3 6)) (>= (/ (to_real 1) (to_real 2)) NoPerm))
 :qid |stdinbpl.408:15|
 :skolemid |31|
 :pattern ( (|aloc#frame| EmptyFrame arr1 i_1@@3))
 :pattern ( (MapType0Select Heap@@13 (|aloc#frame| EmptyFrame arr1 i_1@@3) vint))
)) (=> (and (forall ((i_1@@4 Int) ) (!  (=> (and (and (<= 0 i_1@@4) (< i_1@@4 6)) (> (/ (to_real 1) (to_real 2)) NoPerm)) (not (= (aloc Heap@@13 arr1 i_1@@4) null)))
 :qid |stdinbpl.414:22|
 :skolemid |32|
 :pattern ( (|aloc#frame| EmptyFrame arr1 i_1@@4))
 :pattern ( (MapType0Select Heap@@13 (|aloc#frame| EmptyFrame arr1 i_1@@4) vint))
)) (forall ((o_3@@28 T@U) ) (!  (=> (= (type o_3@@28) RefType) (and (=> (and (and (and (<= 0 (invRecv1 o_3@@28)) (< (invRecv1 o_3@@28) 6)) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange1 o_3@@28)) (and (=> (< NoPerm (/ (to_real 1) (to_real 2))) (= (aloc Heap@@13 arr1 (invRecv1 o_3@@28)) o_3@@28)) (= (U_2_real (MapType1Select QPMask@0 o_3@@28 vint)) (+ (U_2_real (MapType1Select ZeroMask o_3@@28 vint)) (/ (to_real 1) (to_real 2)))))) (=> (not (and (and (and (<= 0 (invRecv1 o_3@@28)) (< (invRecv1 o_3@@28) 6)) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange1 o_3@@28))) (= (U_2_real (MapType1Select QPMask@0 o_3@@28 vint)) (U_2_real (MapType1Select ZeroMask o_3@@28 vint))))))
 :qid |stdinbpl.420:22|
 :skolemid |33|
 :pattern ( (MapType1Select QPMask@0 o_3@@28 vint))
))) (=> (and (and (forall ((o_3@@29 T@U) (f_5@@8 T@U) ) (! (let ((B@@20 (FieldTypeInv1 (type f_5@@8))))
(let ((A@@21 (FieldTypeInv0 (type f_5@@8))))
 (=> (and (and (= (type o_3@@29) RefType) (= (type f_5@@8) (FieldType A@@21 B@@20))) (not (= f_5@@8 vint))) (= (U_2_real (MapType1Select ZeroMask o_3@@29 f_5@@8)) (U_2_real (MapType1Select QPMask@0 o_3@@29 f_5@@8))))))
 :qid |stdinbpl.424:29|
 :skolemid |34|
 :pattern ( (MapType1Select ZeroMask o_3@@29 f_5@@8))
 :pattern ( (MapType1Select QPMask@0 o_3@@29 f_5@@8))
)) (state Heap@@13 QPMask@0)) (and (state Heap@@13 QPMask@0) (state Heap@@13 QPMask@0))) (and (and (=> (= (ControlFlow 0 109) 108) anon53_Else_correct) (=> (= (ControlFlow 0 109) 14) anon54_Then_correct)) (=> (= (ControlFlow 0 109) 8) anon54_Else_correct)))))))))))
(let ((anon52_Then_correct  (and (=> (= (ControlFlow 0 4) (- 0 5)) (<= 0 i_3)) (=> (<= 0 i_3) (=> (= (ControlFlow 0 4) (- 0 3)) (< i_3 (alen arr1)))))))
(let ((anon4_correct true))
(let ((anon51_Then_correct  (=> (and (<= 0 i_3) (< i_3 6)) (and (=> (= (ControlFlow 0 6) 4) anon52_Then_correct) (=> (= (ControlFlow 0 6) 1) anon4_correct)))))
(let ((anon51_Else_correct  (=> (and (not (and (<= 0 i_3) (< i_3 6))) (= (ControlFlow 0 2) 1)) anon4_correct)))
(let ((anon0_correct  (=> (state Heap@@13 ZeroMask) (=> (and (= AssumeFunctionsAbove (- 0 1)) (= (alen arr1) 6)) (=> (and (and (state Heap@@13 ZeroMask) (= (alen arr2) 12)) (and (state Heap@@13 ZeroMask) (state Heap@@13 ZeroMask))) (and (and (=> (= (ControlFlow 0 112) 109) anon50_Else_correct) (=> (= (ControlFlow 0 112) 6) anon51_Then_correct)) (=> (= (ControlFlow 0 112) 2) anon51_Else_correct)))))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 113) 112) anon0_correct)))
PreconditionGeneratedEntry_correct)))))))))))))))))))))))))))))))))))))))))))))))))))
))
(check-sat)
(get-info :reason-unknown)
(assert (not (= (ControlFlow 0 49) (- 58))))
(check-sat)
(pop 1)
; Invalid
(get-info :rlimit)
