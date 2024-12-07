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
(declare-fun g () T@U)
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
(declare-fun IdenticalOnKnownLocations (T@U T@U T@U) Bool)
(declare-fun IsPredicateField (T@U) Bool)
(declare-fun null () T@U)
(declare-fun PredicateMaskField (T@U) T@U)
(declare-fun FrameTypeType () T@T)
(declare-fun HasDirectPerm (T@U T@U T@U) Bool)
(declare-fun IsWandField (T@U) Bool)
(declare-fun WandMaskField (T@U) T@U)
(declare-fun Single (T@U) T@U)
(declare-fun PredicateType_SingleType () T@T)
(declare-fun |sum'| (T@U T@U) Int)
(declare-fun dummyFunction (T@U) Bool)
(declare-fun |sum#triggerStateless| (T@U) Int)
(declare-fun |Single#trigger| (T@U T@U) Bool)
(declare-fun |Single#everUsed| (T@U) Bool)
(declare-fun sum (T@U T@U) Int)
(declare-fun wand (Bool T@U Real T@U Int) T@U)
(declare-fun getPredWandId (T@U) Int)
(declare-fun WandType_wandType () T@T)
(declare-fun wand_1 (Bool T@U Real T@U Int) T@U)
(declare-fun WandType_wand_1Type () T@T)
(declare-fun wand_2 (Bool T@U Real T@U Real) T@U)
(declare-fun WandType_wand_2Type () T@T)
(declare-fun |Single#sm| (T@U) T@U)
(declare-fun dummyHeap () T@U)
(declare-fun ZeroMask () T@U)
(declare-fun InsidePredicate (T@U T@U T@U T@U) Bool)
(declare-fun |wand#ft| (Bool T@U Real T@U Int) T@U)
(declare-fun |wand_1#ft| (Bool T@U Real T@U Int) T@U)
(declare-fun |wand_2#ft| (Bool T@U Real T@U Real) T@U)
(declare-fun sumMask (T@U T@U T@U) Bool)
(declare-fun ConditionalFrame (Real T@U) T@U)
(declare-fun EmptyFrame () T@U)
(declare-fun NoPerm () Real)
(declare-fun |wand#sm| (Bool T@U Real T@U Int) T@U)
(declare-fun |wand_1#sm| (Bool T@U Real T@U Int) T@U)
(declare-fun |wand_2#sm| (Bool T@U Real T@U Real) T@U)
(declare-fun FullPerm () Real)
(declare-fun |sum#frame| (T@U T@U) Int)
(declare-fun AssumeFunctionsAbove () Int)
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
(assert  (and (and (and (and (and (and (forall ((arg0@@11 T@T) (arg1 T@T) ) (! (= (Ctor (FieldType arg0@@11 arg1)) 6)
 :qid |ctor:FieldType|
)) (forall ((arg0@@12 T@T) (arg1@@0 T@T) ) (! (= (FieldTypeInv0 (FieldType arg0@@12 arg1@@0)) arg0@@12)
 :qid |typeInv:FieldTypeInv0|
 :pattern ( (FieldType arg0@@12 arg1@@0))
))) (forall ((arg0@@13 T@T) (arg1@@1 T@T) ) (! (= (FieldTypeInv1 (FieldType arg0@@13 arg1@@1)) arg1@@1)
 :qid |typeInv:FieldTypeInv1|
 :pattern ( (FieldType arg0@@13 arg1@@1))
))) (= (Ctor NormalFieldType) 7)) (= (type $allocated) (FieldType NormalFieldType boolType))) (= (type f_7) (FieldType NormalFieldType intType))) (= (type g) (FieldType NormalFieldType intType))))
(assert (distinct $allocated f_7 g)
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
(assert  (and (= (Ctor PredicateType_SingleType) 12) (forall ((arg0@@25 T@U) ) (! (= (type (Single arg0@@25)) (FieldType PredicateType_SingleType FrameTypeType))
 :qid |funType:Single|
 :pattern ( (Single arg0@@25))
))))
(assert (forall ((this T@U) ) (!  (=> (= (type this) RefType) (IsPredicateField (Single this)))
 :qid |stdinbpl.389:15|
 :skolemid |48|
 :pattern ( (Single this))
)))
(assert (forall ((Heap@@2 T@U) (p_1 T@U) ) (!  (=> (and (= (type Heap@@2) (MapType0Type RefType)) (= (type p_1) RefType)) (dummyFunction (int_2_U (|sum#triggerStateless| p_1))))
 :qid |stdinbpl.301:15|
 :skolemid |44|
 :pattern ( (|sum'| Heap@@2 p_1))
)))
(assert (forall ((Heap@@3 T@U) (this@@0 T@U) ) (!  (=> (and (= (type Heap@@3) (MapType0Type RefType)) (= (type this@@0) RefType)) (|Single#everUsed| (Single this@@0)))
 :qid |stdinbpl.408:15|
 :skolemid |52|
 :pattern ( (|Single#trigger| Heap@@3 (Single this@@0)))
)))
(assert (forall ((Heap@@4 T@U) (ExhaleHeap@@1 T@U) (Mask@@2 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@4) (MapType0Type RefType)) (= (type ExhaleHeap@@1) (MapType0Type RefType))) (= (type Mask@@2) (MapType1Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@4 ExhaleHeap@@1 Mask@@2)) (U_2_bool (MapType0Select Heap@@4 o_1 $allocated))) (U_2_bool (MapType0Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.73:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@4 ExhaleHeap@@1 Mask@@2) (MapType0Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert (forall ((Heap@@5 T@U) (p_1@@0 T@U) ) (!  (=> (and (= (type Heap@@5) (MapType0Type RefType)) (= (type p_1@@0) RefType)) (and (= (sum Heap@@5 p_1@@0) (|sum'| Heap@@5 p_1@@0)) (dummyFunction (int_2_U (|sum#triggerStateless| p_1@@0)))))
 :qid |stdinbpl.297:15|
 :skolemid |43|
 :pattern ( (sum Heap@@5 p_1@@0))
)))
(assert  (and (= (Ctor WandType_wandType) 13) (forall ((arg0@@26 Bool) (arg1@@9 T@U) (arg2@@3 Real) (arg3@@1 T@U) (arg4 Int) ) (! (= (type (wand arg0@@26 arg1@@9 arg2@@3 arg3@@1 arg4)) (FieldType WandType_wandType intType))
 :qid |funType:wand|
 :pattern ( (wand arg0@@26 arg1@@9 arg2@@3 arg3@@1 arg4))
))))
(assert (forall ((arg1@@10 Bool) (arg2@@4 T@U) (arg3@@2 Real) (arg4@@0 T@U) (arg5 Int) ) (!  (=> (and (= (type arg2@@4) RefType) (= (type arg4@@0) RefType)) (= (getPredWandId (wand arg1@@10 arg2@@4 arg3@@2 arg4@@0 arg5)) 1))
 :qid |stdinbpl.206:15|
 :skolemid |27|
 :pattern ( (wand arg1@@10 arg2@@4 arg3@@2 arg4@@0 arg5))
)))
(assert  (and (= (Ctor WandType_wand_1Type) 14) (forall ((arg0@@27 Bool) (arg1@@11 T@U) (arg2@@5 Real) (arg3@@3 T@U) (arg4@@1 Int) ) (! (= (type (wand_1 arg0@@27 arg1@@11 arg2@@5 arg3@@3 arg4@@1)) (FieldType WandType_wand_1Type intType))
 :qid |funType:wand_1|
 :pattern ( (wand_1 arg0@@27 arg1@@11 arg2@@5 arg3@@3 arg4@@1))
))))
(assert (forall ((arg1@@12 Bool) (arg2@@6 T@U) (arg3@@4 Real) (arg4@@2 T@U) (arg5@@0 Int) ) (!  (=> (and (= (type arg2@@6) RefType) (= (type arg4@@2) RefType)) (= (getPredWandId (wand_1 arg1@@12 arg2@@6 arg3@@4 arg4@@2 arg5@@0)) 2))
 :qid |stdinbpl.238:15|
 :skolemid |34|
 :pattern ( (wand_1 arg1@@12 arg2@@6 arg3@@4 arg4@@2 arg5@@0))
)))
(assert  (and (= (Ctor WandType_wand_2Type) 15) (forall ((arg0@@28 Bool) (arg1@@13 T@U) (arg2@@7 Real) (arg3@@5 T@U) (arg4@@3 Real) ) (! (= (type (wand_2 arg0@@28 arg1@@13 arg2@@7 arg3@@5 arg4@@3)) (FieldType WandType_wand_2Type intType))
 :qid |funType:wand_2|
 :pattern ( (wand_2 arg0@@28 arg1@@13 arg2@@7 arg3@@5 arg4@@3))
))))
(assert (forall ((arg1@@14 Bool) (arg2@@8 T@U) (arg3@@6 Real) (arg4@@4 T@U) (arg5@@1 Real) ) (!  (=> (and (= (type arg2@@8) RefType) (= (type arg4@@4) RefType)) (= (getPredWandId (wand_2 arg1@@14 arg2@@8 arg3@@6 arg4@@4 arg5@@1)) 3))
 :qid |stdinbpl.270:15|
 :skolemid |41|
 :pattern ( (wand_2 arg1@@14 arg2@@8 arg3@@6 arg4@@4 arg5@@1))
)))
(assert (forall ((this@@1 T@U) (this2 T@U) ) (!  (=> (and (and (= (type this@@1) RefType) (= (type this2) RefType)) (= (Single this@@1) (Single this2))) (= this@@1 this2))
 :qid |stdinbpl.399:15|
 :skolemid |50|
 :pattern ( (Single this@@1) (Single this2))
)))
(assert (forall ((arg0@@29 T@U) ) (! (= (type (|Single#sm| arg0@@29)) (FieldType PredicateType_SingleType (MapType1Type RefType boolType)))
 :qid |funType:Single#sm|
 :pattern ( (|Single#sm| arg0@@29))
)))
(assert (forall ((this@@2 T@U) (this2@@0 T@U) ) (!  (=> (and (and (= (type this@@2) RefType) (= (type this2@@0) RefType)) (= (|Single#sm| this@@2) (|Single#sm| this2@@0))) (= this@@2 this2@@0))
 :qid |stdinbpl.403:15|
 :skolemid |51|
 :pattern ( (|Single#sm| this@@2) (|Single#sm| this2@@0))
)))
(assert (forall ((Heap@@6 T@U) (ExhaleHeap@@2 T@U) (Mask@@3 T@U) (o_1@@0 T@U) (f_2 T@U) ) (! (let ((B@@1 (FieldTypeInv1 (type f_2))))
(let ((A@@1 (FieldTypeInv0 (type f_2))))
 (=> (and (and (and (and (and (and (= (type Heap@@6) (MapType0Type RefType)) (= (type ExhaleHeap@@2) (MapType0Type RefType))) (= (type Mask@@3) (MapType1Type RefType realType))) (= (type o_1@@0) RefType)) (= (type f_2) (FieldType A@@1 B@@1))) (IdenticalOnKnownLocations Heap@@6 ExhaleHeap@@2 Mask@@3)) (HasDirectPerm Mask@@3 o_1@@0 f_2)) (= (MapType0Select Heap@@6 o_1@@0 f_2) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2)))))
 :qid |stdinbpl.42:22|
 :skolemid |1|
 :pattern ( (IdenticalOnKnownLocations Heap@@6 ExhaleHeap@@2 Mask@@3) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2))
)))
(assert  (and (= (type dummyHeap) (MapType0Type RefType)) (= (type ZeroMask) (MapType1Type RefType realType))))
(assert (state dummyHeap ZeroMask))
(assert (forall ((p T@U) (v_1 T@U) (w T@U) ) (! (let ((A@@2 (FieldTypeInv0 (type p))))
 (=> (and (and (= (type p) (FieldType A@@2 FrameTypeType)) (= (type v_1) FrameTypeType)) (= (type w) FrameTypeType)) (not (InsidePredicate p v_1 p w))))
 :qid |stdinbpl.173:19|
 :skolemid |21|
 :pattern ( (InsidePredicate p v_1 p w))
)))
(assert (forall ((arg1@@15 Bool) (arg2@@9 T@U) (arg3@@7 Real) (arg4@@5 T@U) (arg5@@2 Int) ) (!  (=> (and (= (type arg2@@9) RefType) (= (type arg4@@5) RefType)) (IsWandField (wand arg1@@15 arg2@@9 arg3@@7 arg4@@5 arg5@@2)))
 :qid |stdinbpl.186:15|
 :skolemid |22|
 :pattern ( (wand arg1@@15 arg2@@9 arg3@@7 arg4@@5 arg5@@2))
)))
(assert (forall ((arg0@@30 Bool) (arg1@@16 T@U) (arg2@@10 Real) (arg3@@8 T@U) (arg4@@6 Int) ) (! (= (type (|wand#ft| arg0@@30 arg1@@16 arg2@@10 arg3@@8 arg4@@6)) (FieldType WandType_wandType FrameTypeType))
 :qid |funType:wand#ft|
 :pattern ( (|wand#ft| arg0@@30 arg1@@16 arg2@@10 arg3@@8 arg4@@6))
)))
(assert (forall ((arg1@@17 Bool) (arg2@@11 T@U) (arg3@@9 Real) (arg4@@7 T@U) (arg5@@3 Int) ) (!  (=> (and (= (type arg2@@11) RefType) (= (type arg4@@7) RefType)) (IsWandField (|wand#ft| arg1@@17 arg2@@11 arg3@@9 arg4@@7 arg5@@3)))
 :qid |stdinbpl.190:15|
 :skolemid |23|
 :pattern ( (|wand#ft| arg1@@17 arg2@@11 arg3@@9 arg4@@7 arg5@@3))
)))
(assert (forall ((arg1@@18 Bool) (arg2@@12 T@U) (arg3@@10 Real) (arg4@@8 T@U) (arg5@@4 Int) ) (!  (=> (and (= (type arg2@@12) RefType) (= (type arg4@@8) RefType)) (IsWandField (wand_1 arg1@@18 arg2@@12 arg3@@10 arg4@@8 arg5@@4)))
 :qid |stdinbpl.218:15|
 :skolemid |29|
 :pattern ( (wand_1 arg1@@18 arg2@@12 arg3@@10 arg4@@8 arg5@@4))
)))
(assert (forall ((arg0@@31 Bool) (arg1@@19 T@U) (arg2@@13 Real) (arg3@@11 T@U) (arg4@@9 Int) ) (! (= (type (|wand_1#ft| arg0@@31 arg1@@19 arg2@@13 arg3@@11 arg4@@9)) (FieldType WandType_wand_1Type FrameTypeType))
 :qid |funType:wand_1#ft|
 :pattern ( (|wand_1#ft| arg0@@31 arg1@@19 arg2@@13 arg3@@11 arg4@@9))
)))
(assert (forall ((arg1@@20 Bool) (arg2@@14 T@U) (arg3@@12 Real) (arg4@@10 T@U) (arg5@@5 Int) ) (!  (=> (and (= (type arg2@@14) RefType) (= (type arg4@@10) RefType)) (IsWandField (|wand_1#ft| arg1@@20 arg2@@14 arg3@@12 arg4@@10 arg5@@5)))
 :qid |stdinbpl.222:15|
 :skolemid |30|
 :pattern ( (|wand_1#ft| arg1@@20 arg2@@14 arg3@@12 arg4@@10 arg5@@5))
)))
(assert (forall ((arg1@@21 Bool) (arg2@@15 T@U) (arg3@@13 Real) (arg4@@11 T@U) (arg5@@6 Real) ) (!  (=> (and (= (type arg2@@15) RefType) (= (type arg4@@11) RefType)) (IsWandField (wand_2 arg1@@21 arg2@@15 arg3@@13 arg4@@11 arg5@@6)))
 :qid |stdinbpl.250:15|
 :skolemid |36|
 :pattern ( (wand_2 arg1@@21 arg2@@15 arg3@@13 arg4@@11 arg5@@6))
)))
(assert (forall ((arg0@@32 Bool) (arg1@@22 T@U) (arg2@@16 Real) (arg3@@14 T@U) (arg4@@12 Real) ) (! (= (type (|wand_2#ft| arg0@@32 arg1@@22 arg2@@16 arg3@@14 arg4@@12)) (FieldType WandType_wand_2Type FrameTypeType))
 :qid |funType:wand_2#ft|
 :pattern ( (|wand_2#ft| arg0@@32 arg1@@22 arg2@@16 arg3@@14 arg4@@12))
)))
(assert (forall ((arg1@@23 Bool) (arg2@@17 T@U) (arg3@@15 Real) (arg4@@13 T@U) (arg5@@7 Real) ) (!  (=> (and (= (type arg2@@17) RefType) (= (type arg4@@13) RefType)) (IsWandField (|wand_2#ft| arg1@@23 arg2@@17 arg3@@15 arg4@@13 arg5@@7)))
 :qid |stdinbpl.254:15|
 :skolemid |37|
 :pattern ( (|wand_2#ft| arg1@@23 arg2@@17 arg3@@15 arg4@@13 arg5@@7))
)))
(assert  (not (IsPredicateField f_7)))
(assert  (not (IsWandField f_7)))
(assert  (not (IsPredicateField g)))
(assert  (not (IsWandField g)))
(assert (forall ((Heap@@7 T@U) (ExhaleHeap@@3 T@U) (Mask@@4 T@U) ) (!  (=> (and (and (and (= (type Heap@@7) (MapType0Type RefType)) (= (type ExhaleHeap@@3) (MapType0Type RefType))) (= (type Mask@@4) (MapType1Type RefType realType))) (IdenticalOnKnownLocations Heap@@7 ExhaleHeap@@3 Mask@@4)) (succHeap Heap@@7 ExhaleHeap@@3))
 :qid |stdinbpl.83:15|
 :skolemid |10|
 :pattern ( (IdenticalOnKnownLocations Heap@@7 ExhaleHeap@@3 Mask@@4))
)))
(assert (forall ((arg1@@24 Bool) (arg2@@18 T@U) (arg3@@16 Real) (arg4@@14 T@U) (arg5@@8 Int) ) (!  (=> (and (= (type arg2@@18) RefType) (= (type arg4@@14) RefType)) (not (IsPredicateField (wand arg1@@24 arg2@@18 arg3@@16 arg4@@14 arg5@@8))))
 :qid |stdinbpl.194:15|
 :skolemid |24|
 :pattern ( (wand arg1@@24 arg2@@18 arg3@@16 arg4@@14 arg5@@8))
)))
(assert (forall ((arg1@@25 Bool) (arg2@@19 T@U) (arg3@@17 Real) (arg4@@15 T@U) (arg5@@9 Int) ) (!  (=> (and (= (type arg2@@19) RefType) (= (type arg4@@15) RefType)) (not (IsPredicateField (|wand#ft| arg1@@25 arg2@@19 arg3@@17 arg4@@15 arg5@@9))))
 :qid |stdinbpl.198:15|
 :skolemid |25|
 :pattern ( (|wand#ft| arg1@@25 arg2@@19 arg3@@17 arg4@@15 arg5@@9))
)))
(assert (forall ((arg1@@26 Bool) (arg2@@20 T@U) (arg3@@18 Real) (arg4@@16 T@U) (arg5@@10 Int) ) (!  (=> (and (= (type arg2@@20) RefType) (= (type arg4@@16) RefType)) (not (IsPredicateField (wand_1 arg1@@26 arg2@@20 arg3@@18 arg4@@16 arg5@@10))))
 :qid |stdinbpl.226:15|
 :skolemid |31|
 :pattern ( (wand_1 arg1@@26 arg2@@20 arg3@@18 arg4@@16 arg5@@10))
)))
(assert (forall ((arg1@@27 Bool) (arg2@@21 T@U) (arg3@@19 Real) (arg4@@17 T@U) (arg5@@11 Int) ) (!  (=> (and (= (type arg2@@21) RefType) (= (type arg4@@17) RefType)) (not (IsPredicateField (|wand_1#ft| arg1@@27 arg2@@21 arg3@@19 arg4@@17 arg5@@11))))
 :qid |stdinbpl.230:15|
 :skolemid |32|
 :pattern ( (|wand_1#ft| arg1@@27 arg2@@21 arg3@@19 arg4@@17 arg5@@11))
)))
(assert (forall ((arg1@@28 Bool) (arg2@@22 T@U) (arg3@@20 Real) (arg4@@18 T@U) (arg5@@12 Real) ) (!  (=> (and (= (type arg2@@22) RefType) (= (type arg4@@18) RefType)) (not (IsPredicateField (wand_2 arg1@@28 arg2@@22 arg3@@20 arg4@@18 arg5@@12))))
 :qid |stdinbpl.258:15|
 :skolemid |38|
 :pattern ( (wand_2 arg1@@28 arg2@@22 arg3@@20 arg4@@18 arg5@@12))
)))
(assert (forall ((arg1@@29 Bool) (arg2@@23 T@U) (arg3@@21 Real) (arg4@@19 T@U) (arg5@@13 Real) ) (!  (=> (and (= (type arg2@@23) RefType) (= (type arg4@@19) RefType)) (not (IsPredicateField (|wand_2#ft| arg1@@29 arg2@@23 arg3@@21 arg4@@19 arg5@@13))))
 :qid |stdinbpl.262:15|
 :skolemid |39|
 :pattern ( (|wand_2#ft| arg1@@29 arg2@@23 arg3@@21 arg4@@19 arg5@@13))
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
(assert  (and (forall ((arg0@@33 Real) (arg1@@30 T@U) ) (! (= (type (ConditionalFrame arg0@@33 arg1@@30)) FrameTypeType)
 :qid |funType:ConditionalFrame|
 :pattern ( (ConditionalFrame arg0@@33 arg1@@30))
)) (= (type EmptyFrame) FrameTypeType)))
(assert (forall ((p@@0 Real) (f_6 T@U) ) (!  (=> (= (type f_6) FrameTypeType) (= (ConditionalFrame p@@0 f_6) (ite (> p@@0 0.0) f_6 EmptyFrame)))
 :qid |stdinbpl.161:15|
 :skolemid |19|
 :pattern ( (ConditionalFrame p@@0 f_6))
)))
(assert (forall ((Mask@@5 T@U) (o_2@@0 T@U) (f_4@@0 T@U) ) (! (let ((B@@3 (FieldTypeInv1 (type f_4@@0))))
(let ((A@@4 (FieldTypeInv0 (type f_4@@0))))
 (=> (and (and (= (type Mask@@5) (MapType1Type RefType realType)) (= (type o_2@@0) RefType)) (= (type f_4@@0) (FieldType A@@4 B@@3))) (= (HasDirectPerm Mask@@5 o_2@@0 f_4@@0) (> (U_2_real (MapType1Select Mask@@5 o_2@@0 f_4@@0)) NoPerm)))))
 :qid |stdinbpl.133:22|
 :skolemid |17|
 :pattern ( (HasDirectPerm Mask@@5 o_2@@0 f_4@@0))
)))
(assert (forall ((o_2@@1 T@U) (f_4@@1 T@U) ) (! (let ((B@@4 (FieldTypeInv1 (type f_4@@1))))
(let ((A@@5 (FieldTypeInv0 (type f_4@@1))))
 (=> (and (= (type o_2@@1) RefType) (= (type f_4@@1) (FieldType A@@5 B@@4))) (= (U_2_real (MapType1Select ZeroMask o_2@@1 f_4@@1)) NoPerm))))
 :qid |stdinbpl.106:22|
 :skolemid |13|
 :pattern ( (MapType1Select ZeroMask o_2@@1 f_4@@1))
)))
(assert (forall ((arg1@@31 Bool) (arg2@@24 T@U) (arg3@@22 Real) (arg4@@20 T@U) (arg5@@14 Int) (arg1_2 Bool) (arg2_2 T@U) (arg3_2 Real) (arg4_2 T@U) (arg5_2 Int) ) (!  (=> (and (and (and (and (= (type arg2@@24) RefType) (= (type arg4@@20) RefType)) (= (type arg2_2) RefType)) (= (type arg4_2) RefType)) (= (wand arg1@@31 arg2@@24 arg3@@22 arg4@@20 arg5@@14) (wand arg1_2 arg2_2 arg3_2 arg4_2 arg5_2))) (and (= arg1@@31 arg1_2) (and (= arg2@@24 arg2_2) (and (= arg3@@22 arg3_2) (and (= arg4@@20 arg4_2) (= arg5@@14 arg5_2))))))
 :qid |stdinbpl.210:15|
 :skolemid |28|
 :pattern ( (wand arg1@@31 arg2@@24 arg3@@22 arg4@@20 arg5@@14) (wand arg1_2 arg2_2 arg3_2 arg4_2 arg5_2))
)))
(assert (forall ((arg1@@32 Bool) (arg2@@25 T@U) (arg3@@23 Real) (arg4@@21 T@U) (arg5@@15 Int) (arg1_2@@0 Bool) (arg2_2@@0 T@U) (arg3_2@@0 Real) (arg4_2@@0 T@U) (arg5_2@@0 Int) ) (!  (=> (and (and (and (and (= (type arg2@@25) RefType) (= (type arg4@@21) RefType)) (= (type arg2_2@@0) RefType)) (= (type arg4_2@@0) RefType)) (= (wand_1 arg1@@32 arg2@@25 arg3@@23 arg4@@21 arg5@@15) (wand_1 arg1_2@@0 arg2_2@@0 arg3_2@@0 arg4_2@@0 arg5_2@@0))) (and (= arg1@@32 arg1_2@@0) (and (= arg2@@25 arg2_2@@0) (and (= arg3@@23 arg3_2@@0) (and (= arg4@@21 arg4_2@@0) (= arg5@@15 arg5_2@@0))))))
 :qid |stdinbpl.242:15|
 :skolemid |35|
 :pattern ( (wand_1 arg1@@32 arg2@@25 arg3@@23 arg4@@21 arg5@@15) (wand_1 arg1_2@@0 arg2_2@@0 arg3_2@@0 arg4_2@@0 arg5_2@@0))
)))
(assert (forall ((arg1@@33 Bool) (arg2@@26 T@U) (arg3@@24 Real) (arg4@@22 T@U) (arg5@@16 Real) (arg1_2@@1 Bool) (arg2_2@@1 T@U) (arg3_2@@1 Real) (arg4_2@@1 T@U) (arg5_2@@1 Real) ) (!  (=> (and (and (and (and (= (type arg2@@26) RefType) (= (type arg4@@22) RefType)) (= (type arg2_2@@1) RefType)) (= (type arg4_2@@1) RefType)) (= (wand_2 arg1@@33 arg2@@26 arg3@@24 arg4@@22 arg5@@16) (wand_2 arg1_2@@1 arg2_2@@1 arg3_2@@1 arg4_2@@1 arg5_2@@1))) (and (= arg1@@33 arg1_2@@1) (and (= arg2@@26 arg2_2@@1) (and (= arg3@@24 arg3_2@@1) (and (= arg4@@22 arg4_2@@1) (= arg5@@16 arg5_2@@1))))))
 :qid |stdinbpl.274:15|
 :skolemid |42|
 :pattern ( (wand_2 arg1@@33 arg2@@26 arg3@@24 arg4@@22 arg5@@16) (wand_2 arg1_2@@1 arg2_2@@1 arg3_2@@1 arg4_2@@1 arg5_2@@1))
)))
(assert (forall ((arg0@@34 Bool) (arg1@@34 T@U) (arg2@@27 Real) (arg3@@25 T@U) (arg4@@23 Int) ) (! (= (type (|wand#sm| arg0@@34 arg1@@34 arg2@@27 arg3@@25 arg4@@23)) (FieldType WandType_wandType (MapType1Type RefType boolType)))
 :qid |funType:wand#sm|
 :pattern ( (|wand#sm| arg0@@34 arg1@@34 arg2@@27 arg3@@25 arg4@@23))
)))
(assert (forall ((arg1@@35 Bool) (arg2@@28 T@U) (arg3@@26 Real) (arg4@@24 T@U) (arg5@@17 Int) ) (!  (=> (and (= (type arg2@@28) RefType) (= (type arg4@@24) RefType)) (= (|wand#sm| arg1@@35 arg2@@28 arg3@@26 arg4@@24 arg5@@17) (WandMaskField (|wand#ft| arg1@@35 arg2@@28 arg3@@26 arg4@@24 arg5@@17))))
 :qid |stdinbpl.202:15|
 :skolemid |26|
 :pattern ( (WandMaskField (|wand#ft| arg1@@35 arg2@@28 arg3@@26 arg4@@24 arg5@@17)))
)))
(assert (forall ((arg0@@35 Bool) (arg1@@36 T@U) (arg2@@29 Real) (arg3@@27 T@U) (arg4@@25 Int) ) (! (= (type (|wand_1#sm| arg0@@35 arg1@@36 arg2@@29 arg3@@27 arg4@@25)) (FieldType WandType_wand_1Type (MapType1Type RefType boolType)))
 :qid |funType:wand_1#sm|
 :pattern ( (|wand_1#sm| arg0@@35 arg1@@36 arg2@@29 arg3@@27 arg4@@25))
)))
(assert (forall ((arg1@@37 Bool) (arg2@@30 T@U) (arg3@@28 Real) (arg4@@26 T@U) (arg5@@18 Int) ) (!  (=> (and (= (type arg2@@30) RefType) (= (type arg4@@26) RefType)) (= (|wand_1#sm| arg1@@37 arg2@@30 arg3@@28 arg4@@26 arg5@@18) (WandMaskField (|wand_1#ft| arg1@@37 arg2@@30 arg3@@28 arg4@@26 arg5@@18))))
 :qid |stdinbpl.234:15|
 :skolemid |33|
 :pattern ( (WandMaskField (|wand_1#ft| arg1@@37 arg2@@30 arg3@@28 arg4@@26 arg5@@18)))
)))
(assert (forall ((arg0@@36 Bool) (arg1@@38 T@U) (arg2@@31 Real) (arg3@@29 T@U) (arg4@@27 Real) ) (! (= (type (|wand_2#sm| arg0@@36 arg1@@38 arg2@@31 arg3@@29 arg4@@27)) (FieldType WandType_wand_2Type (MapType1Type RefType boolType)))
 :qid |funType:wand_2#sm|
 :pattern ( (|wand_2#sm| arg0@@36 arg1@@38 arg2@@31 arg3@@29 arg4@@27))
)))
(assert (forall ((arg1@@39 Bool) (arg2@@32 T@U) (arg3@@30 Real) (arg4@@28 T@U) (arg5@@19 Real) ) (!  (=> (and (= (type arg2@@32) RefType) (= (type arg4@@28) RefType)) (= (|wand_2#sm| arg1@@39 arg2@@32 arg3@@30 arg4@@28 arg5@@19) (WandMaskField (|wand_2#ft| arg1@@39 arg2@@32 arg3@@30 arg4@@28 arg5@@19))))
 :qid |stdinbpl.266:15|
 :skolemid |40|
 :pattern ( (WandMaskField (|wand_2#ft| arg1@@39 arg2@@32 arg3@@30 arg4@@28 arg5@@19)))
)))
(assert (forall ((Heap@@8 T@U) (ExhaleHeap@@4 T@U) (Mask@@6 T@U) (pm_f@@1 T@U) ) (! (let ((C@@1 (FieldTypeInv0 (type pm_f@@1))))
 (=> (and (and (and (and (and (= (type Heap@@8) (MapType0Type RefType)) (= (type ExhaleHeap@@4) (MapType0Type RefType))) (= (type Mask@@6) (MapType1Type RefType realType))) (= (type pm_f@@1) (FieldType C@@1 FrameTypeType))) (IdenticalOnKnownLocations Heap@@8 ExhaleHeap@@4 Mask@@6)) (and (HasDirectPerm Mask@@6 null pm_f@@1) (IsPredicateField pm_f@@1))) (forall ((o2 T@U) (f_2@@0 T@U) ) (! (let ((B@@5 (FieldTypeInv1 (type f_2@@0))))
(let ((A@@6 (FieldTypeInv0 (type f_2@@0))))
 (=> (and (and (= (type o2) RefType) (= (type f_2@@0) (FieldType A@@6 B@@5))) (U_2_bool (MapType1Select (MapType0Select Heap@@8 null (PredicateMaskField pm_f@@1)) o2 f_2@@0))) (= (MapType0Select Heap@@8 o2 f_2@@0) (MapType0Select ExhaleHeap@@4 o2 f_2@@0)))))
 :qid |stdinbpl.54:134|
 :skolemid |3|
 :pattern ( (MapType0Select ExhaleHeap@@4 o2 f_2@@0))
))))
 :qid |stdinbpl.52:19|
 :skolemid |4|
 :pattern ( (IdenticalOnKnownLocations Heap@@8 ExhaleHeap@@4 Mask@@6) (IsPredicateField pm_f@@1))
)))
(assert (forall ((Heap@@9 T@U) (ExhaleHeap@@5 T@U) (Mask@@7 T@U) (pm_f@@2 T@U) ) (! (let ((C@@2 (FieldTypeInv0 (type pm_f@@2))))
 (=> (and (and (and (and (and (= (type Heap@@9) (MapType0Type RefType)) (= (type ExhaleHeap@@5) (MapType0Type RefType))) (= (type Mask@@7) (MapType1Type RefType realType))) (= (type pm_f@@2) (FieldType C@@2 FrameTypeType))) (IdenticalOnKnownLocations Heap@@9 ExhaleHeap@@5 Mask@@7)) (and (HasDirectPerm Mask@@7 null pm_f@@2) (IsWandField pm_f@@2))) (forall ((o2@@0 T@U) (f_2@@1 T@U) ) (! (let ((B@@6 (FieldTypeInv1 (type f_2@@1))))
(let ((A@@7 (FieldTypeInv0 (type f_2@@1))))
 (=> (and (and (= (type o2@@0) RefType) (= (type f_2@@1) (FieldType A@@7 B@@6))) (U_2_bool (MapType1Select (MapType0Select Heap@@9 null (WandMaskField pm_f@@2)) o2@@0 f_2@@1))) (= (MapType0Select Heap@@9 o2@@0 f_2@@1) (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1)))))
 :qid |stdinbpl.67:129|
 :skolemid |6|
 :pattern ( (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1))
))))
 :qid |stdinbpl.65:19|
 :skolemid |7|
 :pattern ( (IdenticalOnKnownLocations Heap@@9 ExhaleHeap@@5 Mask@@7) (IsWandField pm_f@@2))
)))
(assert (forall ((this@@3 T@U) ) (!  (=> (= (type this@@3) RefType) (= (getPredWandId (Single this@@3)) 0))
 :qid |stdinbpl.393:15|
 :skolemid |49|
 :pattern ( (Single this@@3))
)))
(assert (forall ((Mask@@8 T@U) (o_2@@2 T@U) (f_4@@2 T@U) ) (! (let ((B@@7 (FieldTypeInv1 (type f_4@@2))))
(let ((A@@8 (FieldTypeInv0 (type f_4@@2))))
 (=> (and (and (and (= (type Mask@@8) (MapType1Type RefType realType)) (= (type o_2@@2) RefType)) (= (type f_4@@2) (FieldType A@@8 B@@7))) (GoodMask Mask@@8)) (and (>= (U_2_real (MapType1Select Mask@@8 o_2@@2 f_4@@2)) NoPerm) (=> (and (and (GoodMask Mask@@8) (not (IsPredicateField f_4@@2))) (not (IsWandField f_4@@2))) (<= (U_2_real (MapType1Select Mask@@8 o_2@@2 f_4@@2)) FullPerm))))))
 :qid |stdinbpl.128:22|
 :skolemid |16|
 :pattern ( (GoodMask Mask@@8) (MapType1Select Mask@@8 o_2@@2 f_4@@2))
)))
(assert (forall ((Heap@@10 T@U) (Mask@@9 T@U) (p_1@@1 T@U) ) (!  (=> (and (and (and (= (type Heap@@10) (MapType0Type RefType)) (= (type Mask@@9) (MapType1Type RefType realType))) (= (type p_1@@1) RefType)) (state Heap@@10 Mask@@9)) (= (|sum'| Heap@@10 p_1@@1) (|sum#frame| (MapType0Select Heap@@10 null (Single p_1@@1)) p_1@@1)))
 :qid |stdinbpl.314:15|
 :skolemid |46|
 :pattern ( (state Heap@@10 Mask@@9) (|sum'| Heap@@10 p_1@@1))
)))
(assert (forall ((o T@U) (f T@U) (Heap@@11 T@U) ) (!  (=> (and (and (and (= (type o) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap@@11) (MapType0Type RefType))) (U_2_bool (MapType0Select Heap@@11 o $allocated))) (U_2_bool (MapType0Select Heap@@11 (MapType0Select Heap@@11 o f) $allocated)))
 :qid |stdinbpl.31:15|
 :skolemid |0|
 :pattern ( (MapType0Select Heap@@11 o f))
)))
(assert (forall ((this@@4 T@U) ) (!  (=> (= (type this@@4) RefType) (= (PredicateMaskField (Single this@@4)) (|Single#sm| this@@4)))
 :qid |stdinbpl.385:15|
 :skolemid |47|
 :pattern ( (PredicateMaskField (Single this@@4)))
)))
(assert (forall ((Heap@@12 T@U) (o@@0 T@U) (f_3 T@U) (v T@U) ) (! (let ((B@@8 (type v)))
(let ((A@@9 (FieldTypeInv0 (type f_3))))
 (=> (and (and (= (type Heap@@12) (MapType0Type RefType)) (= (type o@@0) RefType)) (= (type f_3) (FieldType A@@9 B@@8))) (succHeap Heap@@12 (MapType0Store Heap@@12 o@@0 f_3 v)))))
 :qid |stdinbpl.78:22|
 :skolemid |9|
 :pattern ( (MapType0Store Heap@@12 o@@0 f_3 v))
)))
(assert (forall ((Heap@@13 T@U) (Mask@@10 T@U) (p_1@@2 T@U) ) (!  (=> (and (and (and (= (type Heap@@13) (MapType0Type RefType)) (= (type Mask@@10) (MapType1Type RefType realType))) (= (type p_1@@2) RefType)) (and (state Heap@@13 Mask@@10) (< AssumeFunctionsAbove 0))) (= (sum Heap@@13 p_1@@2) (U_2_int (MapType0Select Heap@@13 p_1@@2 f_7))))
 :qid |stdinbpl.307:15|
 :skolemid |45|
 :pattern ( (state Heap@@13 Mask@@10) (sum Heap@@13 p_1@@2))
 :pattern ( (state Heap@@13 Mask@@10) (|sum#triggerStateless| p_1@@2) (|Single#trigger| Heap@@13 (Single p_1@@2)))
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
 :qid |stdinbpl.168:25|
 :skolemid |20|
 :pattern ( (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun Result_4Mask () T@U)
(declare-fun xs () T@U)
(declare-fun b_7@18 () Bool)
(declare-fun b_12@6 () Bool)
(declare-fun Result_4Heap () T@U)
(declare-fun Heap@7 () T@U)
(declare-fun Mask@8 () T@U)
(declare-fun Mask@9 () T@U)
(declare-fun b_7@17 () Bool)
(declare-fun neededTransfer@11 () Real)
(declare-fun Used_6Mask@3 () T@U)
(declare-fun initNeededTransfer@2 () Real)
(declare-fun b_13@0 () Bool)
(declare-fun b_13@1 () Bool)
(declare-fun b_13@2 () Bool)
(declare-fun Ops_3Mask@9 () T@U)
(declare-fun b_13@3 () Bool)
(declare-fun Ops_3Heap@5 () T@U)
(declare-fun Used_6Heap@0 () T@U)
(declare-fun b_13@4 () Bool)
(declare-fun takeTransfer@5 () Real)
(declare-fun Heap@5 () T@U)
(declare-fun neededTransfer@9 () Real)
(declare-fun Mask@6 () T@U)
(declare-fun b_12@3 () Bool)
(declare-fun Used_6Mask@1 () T@U)
(declare-fun neededTransfer@10 () Real)
(declare-fun Used_6Mask@2 () T@U)
(declare-fun b_12@4 () Bool)
(declare-fun TempMask@3 () T@U)
(declare-fun b_12@5 () Bool)
(declare-fun Mask@7 () T@U)
(declare-fun newPMask@1 () T@U)
(declare-fun Heap@6 () T@U)
(declare-fun maskTransfer@5 () Real)
(declare-fun takeTransfer@4 () Real)
(declare-fun Ops_3Mask@7 () T@U)
(declare-fun b_12@0 () Bool)
(declare-fun neededTransfer@8 () Real)
(declare-fun Used_6Mask@0 () T@U)
(declare-fun b_12@1 () Bool)
(declare-fun TempMask@2 () T@U)
(declare-fun b_12@2 () Bool)
(declare-fun Ops_3Mask@8 () T@U)
(declare-fun maskTransfer@4 () Real)
(declare-fun b_12 () Bool)
(declare-fun Ops_3Heap@4 () T@U)
(declare-fun Ops_3Heap@3 () T@U)
(declare-fun Ops_3Mask@6 () T@U)
(declare-fun b_7@16 () Bool)
(declare-fun b_7@15 () Bool)
(declare-fun Heap@4 () T@U)
(declare-fun Mask@5 () T@U)
(declare-fun Ops_3Heap@0 () T@U)
(declare-fun Ops_3Heap@1 () T@U)
(declare-fun Ops_3Heap@2 () T@U)
(declare-fun freshVersion@0 () T@U)
(declare-fun b_7@10 () Bool)
(declare-fun b_10@6 () Bool)
(declare-fun neededTransfer@7 () Real)
(declare-fun Used_5Mask@3 () T@U)
(declare-fun initNeededTransfer@1 () Real)
(declare-fun b_11@0 () Bool)
(declare-fun b_11@1 () Bool)
(declare-fun Result_3Heap () T@U)
(declare-fun Result_3Mask () T@U)
(declare-fun b_11@2 () Bool)
(declare-fun Ops_3Mask@5 () T@U)
(declare-fun b_11@3 () Bool)
(declare-fun Used_5Heap@0 () T@U)
(declare-fun b_11@4 () Bool)
(declare-fun b_7@11 () Bool)
(declare-fun b_7@12 () Bool)
(declare-fun b_7@13 () Bool)
(declare-fun b_7@14 () Bool)
(declare-fun FrameFragment (T@U) T@U)
(declare-fun takeTransfer@3 () Real)
(declare-fun Mask@3 () T@U)
(declare-fun Heap@2 () T@U)
(declare-fun neededTransfer@5 () Real)
(declare-fun b_10@3 () Bool)
(declare-fun Used_5Mask@1 () T@U)
(declare-fun neededTransfer@6 () Real)
(declare-fun Used_5Mask@2 () T@U)
(declare-fun b_10@4 () Bool)
(declare-fun b_10@5 () Bool)
(declare-fun Mask@4 () T@U)
(declare-fun Heap@3 () T@U)
(declare-fun maskTransfer@3 () Real)
(declare-fun takeTransfer@2 () Real)
(declare-fun Ops_3Mask@3 () T@U)
(declare-fun b_10@0 () Bool)
(declare-fun neededTransfer@4 () Real)
(declare-fun Used_5Mask@0 () T@U)
(declare-fun b_10@1 () Bool)
(declare-fun b_10@2 () Bool)
(declare-fun Ops_3Mask@4 () T@U)
(declare-fun maskTransfer@2 () Real)
(declare-fun b_10 () Bool)
(declare-fun b_7@2 () Bool)
(declare-fun b_8@6 () Bool)
(declare-fun neededTransfer@3 () Real)
(declare-fun Used_4Mask@3 () T@U)
(declare-fun initNeededTransfer@0 () Real)
(declare-fun b_9@0 () Bool)
(declare-fun b_9@1 () Bool)
(declare-fun Result_2Heap () T@U)
(declare-fun Result_2Mask () T@U)
(declare-fun b_9@2 () Bool)
(declare-fun Ops_3Mask@1 () T@U)
(declare-fun b_9@3 () Bool)
(declare-fun Used_4Heap@0 () T@U)
(declare-fun b_9@4 () Bool)
(declare-fun b_7@3 () Bool)
(declare-fun b_7@4 () Bool)
(declare-fun b_7@5 () Bool)
(declare-fun b_7@6 () Bool)
(declare-fun Ops_3Mask@2 () T@U)
(declare-fun b_7@7 () Bool)
(declare-fun b_7@8 () Bool)
(declare-fun b_7@9 () Bool)
(declare-fun Mask@2 () T@U)
(declare-fun Heap@1 () T@U)
(declare-fun takeTransfer@1 () Real)
(declare-fun Mask@0 () T@U)
(declare-fun neededTransfer@1 () Real)
(declare-fun b_8@3 () Bool)
(declare-fun Used_4Mask@1 () T@U)
(declare-fun Heap@@14 () T@U)
(declare-fun neededTransfer@2 () Real)
(declare-fun Used_4Mask@2 () T@U)
(declare-fun b_8@4 () Bool)
(declare-fun TempMask@1 () T@U)
(declare-fun b_8@5 () Bool)
(declare-fun Mask@1 () T@U)
(declare-fun newPMask@0 () T@U)
(declare-fun Heap@0 () T@U)
(declare-fun maskTransfer@1 () Real)
(declare-fun takeTransfer@0 () Real)
(declare-fun b_8@0 () Bool)
(declare-fun neededTransfer@0 () Real)
(declare-fun Used_4Mask@0 () T@U)
(declare-fun b_8@1 () Bool)
(declare-fun TempMask@0 () T@U)
(declare-fun b_8@2 () Bool)
(declare-fun Ops_3Mask@0 () T@U)
(declare-fun maskTransfer@0 () Real)
(declare-fun b_8 () Bool)
(declare-fun b_7@1 () Bool)
(declare-fun b_7@0 () Bool)
(declare-fun b_7 () Bool)
(declare-fun b_6@0 () Bool)
(declare-fun b_6 () Bool)
(declare-fun Used_3Heap@0 () T@U)
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (= (type Mask@0) (MapType1Type RefType realType)) (= (type xs) RefType)) (= (type Result_4Heap) (MapType0Type RefType))) (= (type Heap@7) (MapType0Type RefType))) (= (type Mask@8) (MapType1Type RefType realType))) (= (type Mask@9) (MapType1Type RefType realType))) (= (type Result_4Mask) (MapType1Type RefType realType))) (= (type Used_6Mask@3) (MapType1Type RefType realType))) (= (type Ops_3Mask@9) (MapType1Type RefType realType))) (= (type Ops_3Heap@5) (MapType0Type RefType))) (= (type Used_6Heap@0) (MapType0Type RefType))) (= (type Heap@5) (MapType0Type RefType))) (= (type Mask@6) (MapType1Type RefType realType))) (= (type Used_6Mask@1) (MapType1Type RefType realType))) (= (type Used_6Mask@2) (MapType1Type RefType realType))) (= (type TempMask@3) (MapType1Type RefType realType))) (= (type Mask@7) (MapType1Type RefType realType))) (= (type newPMask@1) (MapType1Type RefType boolType))) (= (type Heap@6) (MapType0Type RefType))) (= (type Ops_3Mask@7) (MapType1Type RefType realType))) (= (type Used_6Mask@0) (MapType1Type RefType realType))) (= (type TempMask@2) (MapType1Type RefType realType))) (= (type Ops_3Mask@8) (MapType1Type RefType realType))) (= (type Ops_3Heap@0) (MapType0Type RefType))) (= (type Heap@2) (MapType0Type RefType))) (= (type Mask@3) (MapType1Type RefType realType))) (= (type Ops_3Mask@3) (MapType1Type RefType realType))) (= (type Ops_3Heap@4) (MapType0Type RefType))) (= (type Ops_3Heap@3) (MapType0Type RefType))) (= (type Ops_3Mask@6) (MapType1Type RefType realType))) (= (type Heap@4) (MapType0Type RefType))) (= (type Mask@5) (MapType1Type RefType realType))) (= (type Ops_3Heap@1) (MapType0Type RefType))) (= (type Ops_3Heap@2) (MapType0Type RefType))) (= (type freshVersion@0) FrameTypeType)) (= (type Used_5Mask@3) (MapType1Type RefType realType))) (= (type Result_3Heap) (MapType0Type RefType))) (= (type Result_3Mask) (MapType1Type RefType realType))) (= (type Ops_3Mask@5) (MapType1Type RefType realType))) (= (type Used_5Heap@0) (MapType0Type RefType))) (forall ((arg0@@37 T@U) ) (! (= (type (FrameFragment arg0@@37)) FrameTypeType)
 :qid |funType:FrameFragment|
 :pattern ( (FrameFragment arg0@@37))
))) (= (type Used_5Mask@1) (MapType1Type RefType realType))) (= (type Used_5Mask@2) (MapType1Type RefType realType))) (= (type Mask@4) (MapType1Type RefType realType))) (= (type Heap@3) (MapType0Type RefType))) (= (type Used_5Mask@0) (MapType1Type RefType realType))) (= (type Ops_3Mask@4) (MapType1Type RefType realType))) (= (type Heap@@14) (MapType0Type RefType))) (= (type Used_4Mask@3) (MapType1Type RefType realType))) (= (type Result_2Heap) (MapType0Type RefType))) (= (type Result_2Mask) (MapType1Type RefType realType))) (= (type Ops_3Mask@1) (MapType1Type RefType realType))) (= (type Used_4Heap@0) (MapType0Type RefType))) (= (type Ops_3Mask@2) (MapType1Type RefType realType))) (= (type Mask@2) (MapType1Type RefType realType))) (= (type Heap@1) (MapType0Type RefType))) (= (type Used_4Mask@1) (MapType1Type RefType realType))) (= (type Used_4Mask@2) (MapType1Type RefType realType))) (= (type TempMask@1) (MapType1Type RefType realType))) (= (type Mask@1) (MapType1Type RefType realType))) (= (type newPMask@0) (MapType1Type RefType boolType))) (= (type Heap@0) (MapType0Type RefType))) (= (type Used_4Mask@0) (MapType1Type RefType realType))) (= (type TempMask@0) (MapType1Type RefType realType))) (= (type Ops_3Mask@0) (MapType1Type RefType realType))) (= (type Used_3Heap@0) (MapType0Type RefType))))
(set-info :boogie-vc-id t02)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 74) (let ((anon53_correct true))
(let ((anon82_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 13) 10)) anon53_correct)))
(let ((anon82_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 11) (- 0 12)) (<= FullPerm (U_2_real (MapType1Select Result_4Mask null (Single xs))))) (=> (<= FullPerm (U_2_real (MapType1Select Result_4Mask null (Single xs)))) (=> (= (ControlFlow 0 11) 10) anon53_correct))))))
(let ((anon54_correct  (and (=> (= (ControlFlow 0 6) (- 0 7)) (=> (and (and b_7@18 b_7@18) b_12@6) (= (sum Result_4Heap xs) 3))) (=> (=> (and (and b_7@18 b_7@18) b_12@6) (= (sum Result_4Heap xs) 3)) (=> (and (state Heap@7 Mask@8) (= Mask@9 (MapType1Store Mask@8 null (wand_1 true xs FullPerm xs 3) (real_2_U (+ (U_2_real (MapType1Select Mask@8 null (wand_1 true xs FullPerm xs 3))) FullPerm))))) (=> (and (and (state Heap@7 Mask@9) (state Heap@7 Mask@9)) (and (state Heap@7 Mask@9) (= (ControlFlow 0 6) (- 0 5)))) false))))))
(let ((anon80_Then_correct  (=> b_7@18 (and (and (=> (= (ControlFlow 0 14) 6) anon54_correct) (=> (= (ControlFlow 0 14) 11) anon82_Then_correct)) (=> (= (ControlFlow 0 14) 13) anon82_Else_correct)))))
(let ((anon80_Else_correct  (=> (and (not b_7@18) (= (ControlFlow 0 9) 6)) anon54_correct)))
(let ((anon79_Then_correct  (=> (and (and b_7@18 b_7@18) b_12@6) (and (=> (= (ControlFlow 0 15) 14) anon80_Then_correct) (=> (= (ControlFlow 0 15) 9) anon80_Else_correct)))))
(let ((anon79_Else_correct  (=> (and (not (and (and b_7@18 b_7@18) b_12@6)) (= (ControlFlow 0 8) 6)) anon54_correct)))
(let ((anon48_correct  (and (=> (= (ControlFlow 0 16) (- 0 17)) (=> (and (and b_7@17 b_7@17) b_12@6) (and (= neededTransfer@11 0.0) (= (U_2_real (MapType1Select Used_6Mask@3 null (Single xs))) initNeededTransfer@2)))) (=> (=> (and (and b_7@17 b_7@17) b_12@6) (and (= neededTransfer@11 0.0) (= (U_2_real (MapType1Select Used_6Mask@3 null (Single xs))) initNeededTransfer@2))) (=> (and (= b_13@0  (and b_7@17 b_12@6)) (= b_13@1  (and b_13@0 (state Result_4Heap Result_4Mask)))) (=> (and (and (= b_13@2  (and b_13@1 (sumMask Result_4Mask Ops_3Mask@9 Used_6Mask@3))) (= b_13@3  (and (and b_13@2 (IdenticalOnKnownLocations Ops_3Heap@5 Result_4Heap Ops_3Mask@9)) (IdenticalOnKnownLocations Used_6Heap@0 Result_4Heap Used_6Mask@3)))) (and (= b_13@4  (and b_13@3 (state Result_4Heap Result_4Mask))) (= b_7@18  (and b_7@17 b_13@4)))) (and (=> (= (ControlFlow 0 16) 15) anon79_Then_correct) (=> (= (ControlFlow 0 16) 8) anon79_Else_correct))))))))
(let ((anon78_Else_correct  (=> (>= 0.0 takeTransfer@5) (=> (and (= Heap@7 Heap@5) (= neededTransfer@11 neededTransfer@9)) (=> (and (and (= Mask@8 Mask@6) (= b_12@6 b_12@3)) (and (= Used_6Mask@3 Used_6Mask@1) (= (ControlFlow 0 20) 16))) anon48_correct)))))
(let ((anon78_Then_correct  (=> (> takeTransfer@5 0.0) (=> (and (= neededTransfer@10 (- neededTransfer@9 takeTransfer@5)) (= Used_6Mask@2 (MapType1Store Used_6Mask@1 null (Single xs) (real_2_U (+ (U_2_real (MapType1Select Used_6Mask@1 null (Single xs))) takeTransfer@5))))) (=> (and (and (= b_12@4  (and b_12@3 (state Used_6Heap@0 Used_6Mask@2))) (= TempMask@3 (MapType1Store ZeroMask null (Single xs) (real_2_U FullPerm)))) (and (= b_12@5  (and b_12@4 (IdenticalOnKnownLocations Heap@5 Used_6Heap@0 TempMask@3))) (= Mask@7 (MapType1Store Mask@6 null (Single xs) (real_2_U (- (U_2_real (MapType1Select Mask@6 null (Single xs))) takeTransfer@5)))))) (=> (and (and (and (forall ((o_5 T@U) (f_10 T@U) ) (! (let ((B@@11 (FieldTypeInv1 (type f_10))))
(let ((A@@12 (FieldTypeInv0 (type f_10))))
 (=> (and (and (= (type o_5) RefType) (= (type f_10) (FieldType A@@12 B@@11))) (or (U_2_bool (MapType1Select (MapType0Select Heap@5 null (|wand_1#sm| true xs FullPerm xs 3)) o_5 f_10)) (U_2_bool (MapType1Select (MapType0Select Heap@5 null (|Single#sm| xs)) o_5 f_10)))) (U_2_bool (MapType1Select newPMask@1 o_5 f_10)))))
 :qid |stdinbpl.1080:35|
 :skolemid |55|
 :pattern ( (MapType1Select newPMask@1 o_5 f_10))
)) (= Heap@6 (MapType0Store Heap@5 null (|wand_1#sm| true xs FullPerm xs 3) newPMask@1))) (and (= Heap@7 Heap@6) (= neededTransfer@11 neededTransfer@10))) (and (and (= Mask@8 Mask@7) (= b_12@6 b_12@5)) (and (= Used_6Mask@3 Used_6Mask@2) (= (ControlFlow 0 19) 16)))) anon48_correct))))))
(let ((anon77_Else_correct  (=> (and (< maskTransfer@5 neededTransfer@9) (= takeTransfer@5 maskTransfer@5)) (and (=> (= (ControlFlow 0 22) 19) anon78_Then_correct) (=> (= (ControlFlow 0 22) 20) anon78_Else_correct)))))
(let ((anon77_Then_correct  (=> (and (<= neededTransfer@9 maskTransfer@5) (= takeTransfer@5 neededTransfer@9)) (and (=> (= (ControlFlow 0 21) 19) anon78_Then_correct) (=> (= (ControlFlow 0 21) 20) anon78_Else_correct)))))
(let ((anon76_Then_correct  (=> (and (and (and (and (and b_7@17 b_7@17) b_12@3) true) (> neededTransfer@9 0.0)) (= maskTransfer@5 (U_2_real (MapType1Select Mask@6 null (Single xs))))) (and (=> (= (ControlFlow 0 23) 21) anon77_Then_correct) (=> (= (ControlFlow 0 23) 22) anon77_Else_correct)))))
(let ((anon76_Else_correct  (=> (not (and (and (and (and b_7@17 b_7@17) b_12@3) true) (> neededTransfer@9 0.0))) (=> (and (= Heap@7 Heap@5) (= neededTransfer@11 neededTransfer@9)) (=> (and (and (= Mask@8 Mask@6) (= b_12@6 b_12@3)) (and (= Used_6Mask@3 Used_6Mask@1) (= (ControlFlow 0 18) 16))) anon48_correct)))))
(let ((anon75_Else_correct  (=> (>= 0.0 takeTransfer@4) (=> (and (and (= Ops_3Mask@9 Ops_3Mask@7) (= Used_6Mask@1 ZeroMask)) (and (= b_12@3 b_12@0) (= neededTransfer@9 FullPerm))) (and (=> (= (ControlFlow 0 26) 23) anon76_Then_correct) (=> (= (ControlFlow 0 26) 18) anon76_Else_correct))))))
(let ((anon75_Then_correct  (=> (> takeTransfer@4 0.0) (=> (and (= neededTransfer@8 (- FullPerm takeTransfer@4)) (= Used_6Mask@0 (MapType1Store ZeroMask null (Single xs) (real_2_U (+ (U_2_real (MapType1Select ZeroMask null (Single xs))) takeTransfer@4))))) (=> (and (and (and (= b_12@1  (and b_12@0 (state Used_6Heap@0 Used_6Mask@0))) (= TempMask@2 (MapType1Store ZeroMask null (Single xs) (real_2_U FullPerm)))) (and (= b_12@2  (and b_12@1 (IdenticalOnKnownLocations Ops_3Heap@5 Used_6Heap@0 TempMask@2))) (= Ops_3Mask@8 (MapType1Store Ops_3Mask@7 null (Single xs) (real_2_U (- (U_2_real (MapType1Select Ops_3Mask@7 null (Single xs))) takeTransfer@4)))))) (and (and (= Ops_3Mask@9 Ops_3Mask@8) (= Used_6Mask@1 Used_6Mask@0)) (and (= b_12@3 b_12@2) (= neededTransfer@9 neededTransfer@8)))) (and (=> (= (ControlFlow 0 25) 23) anon76_Then_correct) (=> (= (ControlFlow 0 25) 18) anon76_Else_correct)))))))
(let ((anon74_Else_correct  (=> (and (< maskTransfer@4 FullPerm) (= takeTransfer@4 maskTransfer@4)) (and (=> (= (ControlFlow 0 28) 25) anon75_Then_correct) (=> (= (ControlFlow 0 28) 26) anon75_Else_correct)))))
(let ((anon74_Then_correct  (=> (and (<= FullPerm maskTransfer@4) (= takeTransfer@4 FullPerm)) (and (=> (= (ControlFlow 0 27) 25) anon75_Then_correct) (=> (= (ControlFlow 0 27) 26) anon75_Else_correct)))))
(let ((anon73_Then_correct  (=> (and (and (and (and (and b_7@17 b_7@17) b_12@0) true) (> FullPerm 0.0)) (= maskTransfer@4 (U_2_real (MapType1Select Ops_3Mask@7 null (Single xs))))) (and (=> (= (ControlFlow 0 29) 27) anon74_Then_correct) (=> (= (ControlFlow 0 29) 28) anon74_Else_correct)))))
(let ((anon73_Else_correct  (=> (not (and (and (and (and b_7@17 b_7@17) b_12@0) true) (> FullPerm 0.0))) (=> (and (and (= Ops_3Mask@9 Ops_3Mask@7) (= Used_6Mask@1 ZeroMask)) (and (= b_12@3 b_12@0) (= neededTransfer@9 FullPerm))) (and (=> (= (ControlFlow 0 24) 23) anon76_Then_correct) (=> (= (ControlFlow 0 24) 18) anon76_Else_correct))))))
(let ((anon36_correct  (=> (and (= b_12@0  (and b_12 (state Used_6Heap@0 ZeroMask))) (= initNeededTransfer@2 (+ (U_2_real (MapType1Select ZeroMask null (Single xs))) FullPerm))) (and (=> (= (ControlFlow 0 30) (- 0 31)) (>= FullPerm 0.0)) (=> (>= FullPerm 0.0) (and (=> (= (ControlFlow 0 30) 29) anon73_Then_correct) (=> (= (ControlFlow 0 30) 24) anon73_Else_correct)))))))
(let ((anon35_correct  (=> (= Ops_3Heap@4 (MapType0Store Ops_3Heap@3 null (|Single#sm| xs) (MapType1Store (MapType0Select Ops_3Heap@3 null (|Single#sm| xs)) xs f_7 (bool_2_U true)))) (=> (and (and (and (state Ops_3Heap@4 Ops_3Mask@6) (= b_7@16  (and b_7@15 (state Ops_3Heap@4 Ops_3Mask@6)))) (and (= Ops_3Heap@5 Ops_3Heap@4) (= b_7@17 b_7@16))) (and (and (= Heap@5 Heap@4) (= Mask@6 Mask@5)) (and (= Ops_3Mask@7 Ops_3Mask@6) (= (ControlFlow 0 33) 30)))) anon36_correct))))
(let ((anon72_Else_correct  (=> (HasDirectPerm Ops_3Mask@6 null (Single xs)) (=> (and (= Ops_3Heap@3 Ops_3Heap@0) (= (ControlFlow 0 35) 33)) anon35_correct))))
(let ((anon72_Then_correct  (=> (not (HasDirectPerm Ops_3Mask@6 null (Single xs))) (=> (and (and (= Ops_3Heap@1 (MapType0Store Ops_3Heap@0 null (|Single#sm| xs) ZeroPMask)) (= Ops_3Heap@2 (MapType0Store Ops_3Heap@1 null (Single xs) freshVersion@0))) (and (= Ops_3Heap@3 Ops_3Heap@2) (= (ControlFlow 0 34) 33))) anon35_correct))))
(let ((anon33_correct  (and (=> (= (ControlFlow 0 36) (- 0 37)) (=> (and b_7@10 b_10@6) (and (= neededTransfer@7 0.0) (= (U_2_real (MapType1Select Used_5Mask@3 xs f_7)) initNeededTransfer@1)))) (=> (=> (and b_7@10 b_10@6) (and (= neededTransfer@7 0.0) (= (U_2_real (MapType1Select Used_5Mask@3 xs f_7)) initNeededTransfer@1))) (=> (= b_11@0  (and b_7@10 b_10@6)) (=> (and (and (= b_11@1  (and b_11@0 (state Result_3Heap Result_3Mask))) (= b_11@2  (and b_11@1 (sumMask Result_3Mask Ops_3Mask@5 Used_5Mask@3)))) (and (= b_11@3  (and (and b_11@2 (IdenticalOnKnownLocations Ops_3Heap@0 Result_3Heap Ops_3Mask@5)) (IdenticalOnKnownLocations Used_5Heap@0 Result_3Heap Used_5Mask@3))) (= b_11@4  (and b_11@3 (state Result_3Heap Result_3Mask))))) (=> (and (and (and (= b_7@11  (and b_7@10 b_11@4)) (= b_7@12  (and b_7@11 b_10@6))) (and (= b_7@13  (and b_7@12 (= Used_5Heap@0 Ops_3Heap@0))) (= Ops_3Mask@6 (MapType1Store Ops_3Mask@5 null (Single xs) (real_2_U (+ (U_2_real (MapType1Select Ops_3Mask@5 null (Single xs))) FullPerm)))))) (and (and (= b_7@14  (and b_7@13 (state Ops_3Heap@0 Ops_3Mask@6))) (= b_7@15  (and b_7@14 (state Ops_3Heap@0 Ops_3Mask@6)))) (and (|Single#trigger| Ops_3Heap@0 (Single xs)) (= (MapType0Select Ops_3Heap@0 null (Single xs)) (FrameFragment (MapType0Select Ops_3Heap@0 xs f_7)))))) (and (=> (= (ControlFlow 0 36) 34) anon72_Then_correct) (=> (= (ControlFlow 0 36) 35) anon72_Else_correct)))))))))
(let ((anon71_Else_correct  (=> (>= 0.0 takeTransfer@3) (=> (and (= Mask@5 Mask@3) (= Heap@4 Heap@2)) (=> (and (and (= neededTransfer@7 neededTransfer@5) (= b_10@6 b_10@3)) (and (= Used_5Mask@3 Used_5Mask@1) (= (ControlFlow 0 40) 36))) anon33_correct)))))
(let ((anon71_Then_correct  (=> (> takeTransfer@3 0.0) (=> (and (and (= neededTransfer@6 (- neededTransfer@5 takeTransfer@3)) (= Used_5Mask@2 (MapType1Store Used_5Mask@1 xs f_7 (real_2_U (+ (U_2_real (MapType1Select Used_5Mask@1 xs f_7)) takeTransfer@3))))) (and (= b_10@4  (and b_10@3 (state Used_5Heap@0 Used_5Mask@2))) (= b_10@5  (and b_10@4 (= (U_2_int (MapType0Select Heap@2 xs f_7)) (U_2_int (MapType0Select Used_5Heap@0 xs f_7))))))) (=> (and (and (and (= Mask@4 (MapType1Store Mask@3 xs f_7 (real_2_U (- (U_2_real (MapType1Select Mask@3 xs f_7)) takeTransfer@3)))) (= Heap@3 (MapType0Store Heap@2 null (|wand_1#sm| true xs FullPerm xs 3) (MapType1Store (MapType0Select Heap@2 null (|wand_1#sm| true xs FullPerm xs 3)) xs f_7 (bool_2_U true))))) (and (= Mask@5 Mask@4) (= Heap@4 Heap@3))) (and (and (= neededTransfer@7 neededTransfer@6) (= b_10@6 b_10@5)) (and (= Used_5Mask@3 Used_5Mask@2) (= (ControlFlow 0 39) 36)))) anon33_correct)))))
(let ((anon70_Else_correct  (=> (and (< maskTransfer@3 neededTransfer@5) (= takeTransfer@3 maskTransfer@3)) (and (=> (= (ControlFlow 0 42) 39) anon71_Then_correct) (=> (= (ControlFlow 0 42) 40) anon71_Else_correct)))))
(let ((anon70_Then_correct  (=> (and (<= neededTransfer@5 maskTransfer@3) (= takeTransfer@3 neededTransfer@5)) (and (=> (= (ControlFlow 0 41) 39) anon71_Then_correct) (=> (= (ControlFlow 0 41) 40) anon71_Else_correct)))))
(let ((anon69_Then_correct  (=> (and (and (and (and b_7@10 b_10@3) true) (> neededTransfer@5 0.0)) (= maskTransfer@3 (U_2_real (MapType1Select Mask@3 xs f_7)))) (and (=> (= (ControlFlow 0 43) 41) anon70_Then_correct) (=> (= (ControlFlow 0 43) 42) anon70_Else_correct)))))
(let ((anon69_Else_correct  (=> (not (and (and (and b_7@10 b_10@3) true) (> neededTransfer@5 0.0))) (=> (and (= Mask@5 Mask@3) (= Heap@4 Heap@2)) (=> (and (and (= neededTransfer@7 neededTransfer@5) (= b_10@6 b_10@3)) (and (= Used_5Mask@3 Used_5Mask@1) (= (ControlFlow 0 38) 36))) anon33_correct)))))
(let ((anon68_Else_correct  (=> (>= 0.0 takeTransfer@2) (=> (and (and (= Ops_3Mask@5 Ops_3Mask@3) (= Used_5Mask@1 ZeroMask)) (and (= b_10@3 b_10@0) (= neededTransfer@5 FullPerm))) (and (=> (= (ControlFlow 0 46) 43) anon69_Then_correct) (=> (= (ControlFlow 0 46) 38) anon69_Else_correct))))))
(let ((anon68_Then_correct  (=> (and (> takeTransfer@2 0.0) (= neededTransfer@4 (- FullPerm takeTransfer@2))) (=> (and (and (and (= Used_5Mask@0 (MapType1Store ZeroMask xs f_7 (real_2_U (+ (U_2_real (MapType1Select ZeroMask xs f_7)) takeTransfer@2)))) (= b_10@1  (and b_10@0 (state Used_5Heap@0 Used_5Mask@0)))) (and (= b_10@2  (and b_10@1 (= (U_2_int (MapType0Select Ops_3Heap@0 xs f_7)) (U_2_int (MapType0Select Used_5Heap@0 xs f_7))))) (= Ops_3Mask@4 (MapType1Store Ops_3Mask@3 xs f_7 (real_2_U (- (U_2_real (MapType1Select Ops_3Mask@3 xs f_7)) takeTransfer@2)))))) (and (and (= Ops_3Mask@5 Ops_3Mask@4) (= Used_5Mask@1 Used_5Mask@0)) (and (= b_10@3 b_10@2) (= neededTransfer@5 neededTransfer@4)))) (and (=> (= (ControlFlow 0 45) 43) anon69_Then_correct) (=> (= (ControlFlow 0 45) 38) anon69_Else_correct))))))
(let ((anon67_Else_correct  (=> (and (< maskTransfer@2 FullPerm) (= takeTransfer@2 maskTransfer@2)) (and (=> (= (ControlFlow 0 48) 45) anon68_Then_correct) (=> (= (ControlFlow 0 48) 46) anon68_Else_correct)))))
(let ((anon67_Then_correct  (=> (and (<= FullPerm maskTransfer@2) (= takeTransfer@2 FullPerm)) (and (=> (= (ControlFlow 0 47) 45) anon68_Then_correct) (=> (= (ControlFlow 0 47) 46) anon68_Else_correct)))))
(let ((anon66_Then_correct  (=> (and (and (and (and b_7@10 b_10@0) true) (> FullPerm 0.0)) (= maskTransfer@2 (U_2_real (MapType1Select Ops_3Mask@3 xs f_7)))) (and (=> (= (ControlFlow 0 49) 47) anon67_Then_correct) (=> (= (ControlFlow 0 49) 48) anon67_Else_correct)))))
(let ((anon66_Else_correct  (=> (not (and (and (and b_7@10 b_10@0) true) (> FullPerm 0.0))) (=> (and (and (= Ops_3Mask@5 Ops_3Mask@3) (= Used_5Mask@1 ZeroMask)) (and (= b_10@3 b_10@0) (= neededTransfer@5 FullPerm))) (and (=> (= (ControlFlow 0 44) 43) anon69_Then_correct) (=> (= (ControlFlow 0 44) 38) anon69_Else_correct))))))
(let ((anon65_Then_correct  (=> b_7@10 (=> (and (= b_10@0  (and b_10 (state Used_5Heap@0 ZeroMask))) (= initNeededTransfer@1 (+ (U_2_real (MapType1Select ZeroMask xs f_7)) FullPerm))) (and (=> (= (ControlFlow 0 50) (- 0 51)) (>= FullPerm 0.0)) (=> (>= FullPerm 0.0) (and (=> (= (ControlFlow 0 50) 49) anon66_Then_correct) (=> (= (ControlFlow 0 50) 44) anon66_Else_correct))))))))
(let ((anon65_Else_correct  (=> (not b_7@10) (=> (and (= Ops_3Heap@5 Ops_3Heap@0) (= b_7@17 b_7@10)) (=> (and (and (= Heap@5 Heap@2) (= Mask@6 Mask@3)) (and (= Ops_3Mask@7 Ops_3Mask@3) (= (ControlFlow 0 32) 30))) anon36_correct)))))
(let ((anon19_correct  (and (=> (= (ControlFlow 0 53) (- 0 54)) (=> (and b_7@2 b_8@6) (and (= neededTransfer@3 0.0) (= (U_2_real (MapType1Select Used_4Mask@3 null (Single xs))) initNeededTransfer@0)))) (=> (=> (and b_7@2 b_8@6) (and (= neededTransfer@3 0.0) (= (U_2_real (MapType1Select Used_4Mask@3 null (Single xs))) initNeededTransfer@0))) (=> (= b_9@0  (and b_7@2 b_8@6)) (=> (and (and (and (and (= b_9@1  (and b_9@0 (state Result_2Heap Result_2Mask))) (= b_9@2  (and b_9@1 (sumMask Result_2Mask Ops_3Mask@1 Used_4Mask@3)))) (and (= b_9@3  (and (and b_9@2 (IdenticalOnKnownLocations Ops_3Heap@0 Result_2Heap Ops_3Mask@1)) (IdenticalOnKnownLocations Used_4Heap@0 Result_2Heap Used_4Mask@3))) (= b_9@4  (and b_9@3 (state Result_2Heap Result_2Mask))))) (and (and (= b_7@3  (and b_7@2 b_9@4)) (= b_7@4  (and b_7@3 b_8@6))) (and (= b_7@5  (and b_7@4 (= Used_4Heap@0 Ops_3Heap@0))) (= b_7@6  (and b_7@5 (not (= xs null))))))) (and (and (and (= Ops_3Mask@2 (MapType1Store Ops_3Mask@1 xs f_7 (real_2_U (+ (U_2_real (MapType1Select Ops_3Mask@1 xs f_7)) FullPerm)))) (= b_7@7  (and b_7@6 (state Ops_3Heap@0 Ops_3Mask@2)))) (and (= b_7@8  (and b_7@7 (state Ops_3Heap@0 Ops_3Mask@2))) (= b_7@9  (and b_7@8 (state Ops_3Heap@0 Ops_3Mask@2))))) (and (and (= b_7@10 b_7@9) (= Mask@3 Mask@2)) (and (= Ops_3Mask@3 Ops_3Mask@2) (= Heap@2 Heap@1))))) (and (=> (= (ControlFlow 0 53) 50) anon65_Then_correct) (=> (= (ControlFlow 0 53) 32) anon65_Else_correct))))))))
(let ((anon64_Else_correct  (=> (>= 0.0 takeTransfer@1) (=> (and (= Mask@2 Mask@0) (= neededTransfer@3 neededTransfer@1)) (=> (and (and (= b_8@6 b_8@3) (= Used_4Mask@3 Used_4Mask@1)) (and (= Heap@1 Heap@@14) (= (ControlFlow 0 57) 53))) anon19_correct)))))
(let ((anon64_Then_correct  (=> (> takeTransfer@1 0.0) (=> (and (= neededTransfer@2 (- neededTransfer@1 takeTransfer@1)) (= Used_4Mask@2 (MapType1Store Used_4Mask@1 null (Single xs) (real_2_U (+ (U_2_real (MapType1Select Used_4Mask@1 null (Single xs))) takeTransfer@1))))) (=> (and (and (= b_8@4  (and b_8@3 (state Used_4Heap@0 Used_4Mask@2))) (= TempMask@1 (MapType1Store ZeroMask null (Single xs) (real_2_U FullPerm)))) (and (= b_8@5  (and b_8@4 (IdenticalOnKnownLocations Heap@@14 Used_4Heap@0 TempMask@1))) (= Mask@1 (MapType1Store Mask@0 null (Single xs) (real_2_U (- (U_2_real (MapType1Select Mask@0 null (Single xs))) takeTransfer@1)))))) (=> (and (and (and (forall ((o_4 T@U) (f_9 T@U) ) (! (let ((B@@12 (FieldTypeInv1 (type f_9))))
(let ((A@@13 (FieldTypeInv0 (type f_9))))
 (=> (and (and (= (type o_4) RefType) (= (type f_9) (FieldType A@@13 B@@12))) (or (U_2_bool (MapType1Select (MapType0Select Heap@@14 null (|wand_1#sm| true xs FullPerm xs 3)) o_4 f_9)) (U_2_bool (MapType1Select (MapType0Select Heap@@14 null (|Single#sm| xs)) o_4 f_9)))) (U_2_bool (MapType1Select newPMask@0 o_4 f_9)))))
 :qid |stdinbpl.918:39|
 :skolemid |54|
 :pattern ( (MapType1Select newPMask@0 o_4 f_9))
)) (= Heap@0 (MapType0Store Heap@@14 null (|wand_1#sm| true xs FullPerm xs 3) newPMask@0))) (and (= Mask@2 Mask@1) (= neededTransfer@3 neededTransfer@2))) (and (and (= b_8@6 b_8@5) (= Used_4Mask@3 Used_4Mask@2)) (and (= Heap@1 Heap@0) (= (ControlFlow 0 56) 53)))) anon19_correct))))))
(let ((anon63_Else_correct  (=> (and (< maskTransfer@1 neededTransfer@1) (= takeTransfer@1 maskTransfer@1)) (and (=> (= (ControlFlow 0 59) 56) anon64_Then_correct) (=> (= (ControlFlow 0 59) 57) anon64_Else_correct)))))
(let ((anon63_Then_correct  (=> (and (<= neededTransfer@1 maskTransfer@1) (= takeTransfer@1 neededTransfer@1)) (and (=> (= (ControlFlow 0 58) 56) anon64_Then_correct) (=> (= (ControlFlow 0 58) 57) anon64_Else_correct)))))
(let ((anon62_Then_correct  (=> (and (and (and (and b_7@2 b_8@3) true) (> neededTransfer@1 0.0)) (= maskTransfer@1 (U_2_real (MapType1Select Mask@0 null (Single xs))))) (and (=> (= (ControlFlow 0 60) 58) anon63_Then_correct) (=> (= (ControlFlow 0 60) 59) anon63_Else_correct)))))
(let ((anon62_Else_correct  (=> (not (and (and (and b_7@2 b_8@3) true) (> neededTransfer@1 0.0))) (=> (and (= Mask@2 Mask@0) (= neededTransfer@3 neededTransfer@1)) (=> (and (and (= b_8@6 b_8@3) (= Used_4Mask@3 Used_4Mask@1)) (and (= Heap@1 Heap@@14) (= (ControlFlow 0 55) 53))) anon19_correct)))))
(let ((anon61_Else_correct  (=> (>= 0.0 takeTransfer@0) (=> (and (and (= Ops_3Mask@1 ZeroMask) (= Used_4Mask@1 ZeroMask)) (and (= b_8@3 b_8@0) (= neededTransfer@1 FullPerm))) (and (=> (= (ControlFlow 0 63) 60) anon62_Then_correct) (=> (= (ControlFlow 0 63) 55) anon62_Else_correct))))))
(let ((anon61_Then_correct  (=> (> takeTransfer@0 0.0) (=> (and (= neededTransfer@0 (- FullPerm takeTransfer@0)) (= Used_4Mask@0 (MapType1Store ZeroMask null (Single xs) (real_2_U (+ (U_2_real (MapType1Select ZeroMask null (Single xs))) takeTransfer@0))))) (=> (and (and (and (= b_8@1  (and b_8@0 (state Used_4Heap@0 Used_4Mask@0))) (= TempMask@0 (MapType1Store ZeroMask null (Single xs) (real_2_U FullPerm)))) (and (= b_8@2  (and b_8@1 (IdenticalOnKnownLocations Ops_3Heap@0 Used_4Heap@0 TempMask@0))) (= Ops_3Mask@0 (MapType1Store ZeroMask null (Single xs) (real_2_U (- (U_2_real (MapType1Select ZeroMask null (Single xs))) takeTransfer@0)))))) (and (and (= Ops_3Mask@1 Ops_3Mask@0) (= Used_4Mask@1 Used_4Mask@0)) (and (= b_8@3 b_8@2) (= neededTransfer@1 neededTransfer@0)))) (and (=> (= (ControlFlow 0 62) 60) anon62_Then_correct) (=> (= (ControlFlow 0 62) 55) anon62_Else_correct)))))))
(let ((anon60_Else_correct  (=> (and (< maskTransfer@0 FullPerm) (= takeTransfer@0 maskTransfer@0)) (and (=> (= (ControlFlow 0 65) 62) anon61_Then_correct) (=> (= (ControlFlow 0 65) 63) anon61_Else_correct)))))
(let ((anon60_Then_correct  (=> (and (<= FullPerm maskTransfer@0) (= takeTransfer@0 FullPerm)) (and (=> (= (ControlFlow 0 64) 62) anon61_Then_correct) (=> (= (ControlFlow 0 64) 63) anon61_Else_correct)))))
(let ((anon59_Then_correct  (=> (and (and (and (and b_7@2 b_8@0) true) (> FullPerm 0.0)) (= maskTransfer@0 (U_2_real (MapType1Select ZeroMask null (Single xs))))) (and (=> (= (ControlFlow 0 66) 64) anon60_Then_correct) (=> (= (ControlFlow 0 66) 65) anon60_Else_correct)))))
(let ((anon59_Else_correct  (=> (not (and (and (and b_7@2 b_8@0) true) (> FullPerm 0.0))) (=> (and (and (= Ops_3Mask@1 ZeroMask) (= Used_4Mask@1 ZeroMask)) (and (= b_8@3 b_8@0) (= neededTransfer@1 FullPerm))) (and (=> (= (ControlFlow 0 61) 60) anon62_Then_correct) (=> (= (ControlFlow 0 61) 55) anon62_Else_correct))))))
(let ((anon58_Then_correct  (=> b_7@2 (=> (and (and (|Single#trigger| Ops_3Heap@0 (Single xs)) (= (MapType0Select Ops_3Heap@0 null (Single xs)) (FrameFragment (MapType0Select Ops_3Heap@0 xs f_7)))) (and (= b_8@0  (and b_8 (state Used_4Heap@0 ZeroMask))) (= initNeededTransfer@0 (+ (U_2_real (MapType1Select ZeroMask null (Single xs))) FullPerm)))) (and (=> (= (ControlFlow 0 67) (- 0 68)) (>= FullPerm 0.0)) (=> (>= FullPerm 0.0) (and (=> (= (ControlFlow 0 67) 66) anon59_Then_correct) (=> (= (ControlFlow 0 67) 61) anon59_Else_correct))))))))
(let ((anon58_Else_correct  (=> (not b_7@2) (=> (and (and (= b_7@10 b_7@2) (= Mask@3 Mask@0)) (and (= Ops_3Mask@3 ZeroMask) (= Heap@2 Heap@@14))) (and (=> (= (ControlFlow 0 52) 50) anon65_Then_correct) (=> (= (ControlFlow 0 52) 32) anon65_Else_correct))))))
(let ((anon6_correct  (=> (and (= b_7@1  (and b_7@0 (state Ops_3Heap@0 ZeroMask))) (= b_7@2  (and b_7@1 (state Ops_3Heap@0 ZeroMask)))) (and (=> (= (ControlFlow 0 69) 67) anon58_Then_correct) (=> (= (ControlFlow 0 69) 52) anon58_Else_correct)))))
(let ((anon57_Else_correct  (=> (and (not b_7@0) (= (ControlFlow 0 71) 69)) anon6_correct)))
(let ((anon57_Then_correct  (=> (and b_7@0 (= (ControlFlow 0 70) 69)) anon6_correct)))
(let ((anon55_Else_correct  (=> (= (sum Heap@@14 xs) 3) (=> (and (and (state Heap@@14 Mask@0) (state Heap@@14 Mask@0)) (and (= b_7@0  (and b_7 (state Ops_3Heap@0 ZeroMask))) (= b_6@0  (and b_6 (state Used_3Heap@0 ZeroMask))))) (and (=> (= (ControlFlow 0 72) 70) anon57_Then_correct) (=> (= (ControlFlow 0 72) 71) anon57_Else_correct))))))
(let ((anon3_correct true))
(let ((anon56_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 4) 1)) anon3_correct)))
(let ((anon56_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 2) (- 0 3)) (<= FullPerm (U_2_real (MapType1Select Mask@0 null (Single xs))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@0 null (Single xs)))) (=> (= (ControlFlow 0 2) 1) anon3_correct))))))
(let ((anon0_correct  (=> (state Heap@@14 ZeroMask) (=> (and (= AssumeFunctionsAbove (- 0 1)) (U_2_bool (MapType0Select Heap@@14 xs $allocated))) (=> (and (and (= Mask@0 (MapType1Store ZeroMask null (Single xs) (real_2_U (+ (U_2_real (MapType1Select ZeroMask null (Single xs))) FullPerm)))) (state Heap@@14 Mask@0)) (and (state Heap@@14 Mask@0) (state Heap@@14 Mask@0))) (and (and (=> (= (ControlFlow 0 73) 72) anon55_Else_correct) (=> (= (ControlFlow 0 73) 2) anon56_Then_correct)) (=> (= (ControlFlow 0 73) 4) anon56_Else_correct)))))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 74) 73) anon0_correct)))
PreconditionGeneratedEntry_correct)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
))
(check-sat)
(get-info :reason-unknown)
(assert (not (= (ControlFlow 0 6) (- 5))))
(check-sat)
(pop 1)
; Invalid
(get-info :rlimit)
