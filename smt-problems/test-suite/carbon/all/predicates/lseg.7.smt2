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
(declare-fun next () T@U)
(declare-fun value () T@U)
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
(declare-fun |length'| (T@U T@U T@U) Int)
(declare-fun MapType1Type (T@T T@T) T@T)
(declare-fun AssumeFunctionsAbove () Int)
(declare-fun |length#trigger| (T@U T@U T@U) Bool)
(declare-fun null () T@U)
(declare-fun lseg (T@U T@U) T@U)
(declare-fun MapType1TypeInv0 (T@T) T@T)
(declare-fun MapType1TypeInv1 (T@T) T@T)
(declare-fun MapType1Select (T@U T@U T@U) T@U)
(declare-fun MapType1Store (T@U T@U T@U T@U) T@U)
(declare-fun PredicateType_lsegType () T@T)
(declare-fun FrameTypeType () T@T)
(declare-fun GoodMask (T@U) Bool)
(declare-fun |get'| (T@U T@U Int T@U) Int)
(declare-fun dummyFunction (T@U) Bool)
(declare-fun |get#triggerStateless| (T@U Int T@U) Int)
(declare-fun IsPredicateField (T@U) Bool)
(declare-fun |length#triggerStateless| (T@U T@U) Int)
(declare-fun |lseg#trigger| (T@U T@U) Bool)
(declare-fun |lseg#everUsed| (T@U) Bool)
(declare-fun IdenticalOnKnownLocations (T@U T@U T@U) Bool)
(declare-fun PredicateMaskField (T@U) T@U)
(declare-fun HasDirectPerm (T@U T@U T@U) Bool)
(declare-fun IsWandField (T@U) Bool)
(declare-fun WandMaskField (T@U) T@U)
(declare-fun |lseg#sm| (T@U T@U) T@U)
(declare-fun |length#frame| (T@U T@U T@U) Int)
(declare-fun dummyHeap () T@U)
(declare-fun ZeroMask () T@U)
(declare-fun InsidePredicate (T@U T@U T@U T@U) Bool)
(declare-fun sumMask (T@U T@U T@U) Bool)
(declare-fun ConditionalFrame (Real T@U) T@U)
(declare-fun EmptyFrame () T@U)
(declare-fun NoPerm () Real)
(declare-fun length (T@U T@U T@U) Int)
(declare-fun |get#frame| (T@U T@U Int T@U) Int)
(declare-fun get (T@U T@U Int T@U) Int)
(declare-fun getPredWandId (T@U) Int)
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
(assert  (and (and (and (and (and (and (and (forall ((arg0@@11 T@T) (arg1 T@T) ) (! (= (Ctor (FieldType arg0@@11 arg1)) 6)
 :qid |ctor:FieldType|
)) (forall ((arg0@@12 T@T) (arg1@@0 T@T) ) (! (= (FieldTypeInv0 (FieldType arg0@@12 arg1@@0)) arg0@@12)
 :qid |typeInv:FieldTypeInv0|
 :pattern ( (FieldType arg0@@12 arg1@@0))
))) (forall ((arg0@@13 T@T) (arg1@@1 T@T) ) (! (= (FieldTypeInv1 (FieldType arg0@@13 arg1@@1)) arg1@@1)
 :qid |typeInv:FieldTypeInv1|
 :pattern ( (FieldType arg0@@13 arg1@@1))
))) (= (Ctor NormalFieldType) 7)) (= (type $allocated) (FieldType NormalFieldType boolType))) (= (Ctor RefType) 8)) (= (type next) (FieldType NormalFieldType RefType))) (= (type value) (FieldType NormalFieldType intType))))
(assert (distinct $allocated next value)
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
(assert  (and (and (and (and (and (and (and (and (and (and (forall ((arg0@@18 T@T) (arg1@@4 T@T) ) (! (= (Ctor (MapType1Type arg0@@18 arg1@@4)) 10)
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
)))) (= (type null) RefType)) (= (Ctor PredicateType_lsegType) 11)) (= (Ctor FrameTypeType) 12)) (forall ((arg0@@23 T@U) (arg1@@9 T@U) ) (! (= (type (lseg arg0@@23 arg1@@9)) (FieldType PredicateType_lsegType FrameTypeType))
 :qid |funType:lseg|
 :pattern ( (lseg arg0@@23 arg1@@9))
))))
(assert (forall ((Heap T@U) (Mask T@U) (this T@U) (end T@U) ) (!  (=> (and (and (and (and (= (type Heap) (MapType0Type RefType)) (= (type Mask) (MapType1Type RefType realType))) (= (type this) RefType)) (= (type end) RefType)) (and (state Heap Mask) (or (< AssumeFunctionsAbove 1) (|length#trigger| (MapType0Select Heap null (lseg this end)) this end)))) (> (|length'| Heap this end) 0))
 :qid |stdinbpl.385:15|
 :skolemid |31|
 :pattern ( (state Heap Mask) (|length'| Heap this end))
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
(assert (forall ((Heap@@1 T@U) (this@@0 T@U) (i Int) (end@@0 T@U) ) (!  (=> (and (and (= (type Heap@@1) (MapType0Type RefType)) (= (type this@@0) RefType)) (= (type end@@0) RefType)) (dummyFunction (int_2_U (|get#triggerStateless| this@@0 i end@@0))))
 :qid |stdinbpl.201:15|
 :skolemid |23|
 :pattern ( (|get'| Heap@@1 this@@0 i end@@0))
)))
(assert (forall ((this@@1 T@U) (end@@1 T@U) ) (!  (=> (and (= (type this@@1) RefType) (= (type end@@1) RefType)) (IsPredicateField (lseg this@@1 end@@1)))
 :qid |stdinbpl.516:15|
 :skolemid |34|
 :pattern ( (lseg this@@1 end@@1))
)))
(assert (forall ((Heap@@2 T@U) (this@@2 T@U) (end@@2 T@U) ) (!  (=> (and (and (= (type Heap@@2) (MapType0Type RefType)) (= (type this@@2) RefType)) (= (type end@@2) RefType)) (dummyFunction (int_2_U (|length#triggerStateless| this@@2 end@@2))))
 :qid |stdinbpl.366:15|
 :skolemid |28|
 :pattern ( (|length'| Heap@@2 this@@2 end@@2))
)))
(assert (forall ((Heap@@3 T@U) (this@@3 T@U) (end@@3 T@U) ) (!  (=> (and (and (= (type Heap@@3) (MapType0Type RefType)) (= (type this@@3) RefType)) (= (type end@@3) RefType)) (|lseg#everUsed| (lseg this@@3 end@@3)))
 :qid |stdinbpl.535:15|
 :skolemid |38|
 :pattern ( (|lseg#trigger| Heap@@3 (lseg this@@3 end@@3)))
)))
(assert (forall ((arg0@@24 T@U) ) (! (let ((A (FieldTypeInv0 (type arg0@@24))))
(= (type (PredicateMaskField arg0@@24)) (FieldType A (MapType1Type RefType boolType))))
 :qid |funType:PredicateMaskField|
 :pattern ( (PredicateMaskField arg0@@24))
)))
(assert (forall ((Heap@@4 T@U) (ExhaleHeap T@U) (Mask@@1 T@U) (pm_f T@U) ) (! (let ((C (FieldTypeInv0 (type pm_f))))
 (=> (and (and (and (and (and (= (type Heap@@4) (MapType0Type RefType)) (= (type ExhaleHeap) (MapType0Type RefType))) (= (type Mask@@1) (MapType1Type RefType realType))) (= (type pm_f) (FieldType C FrameTypeType))) (IdenticalOnKnownLocations Heap@@4 ExhaleHeap Mask@@1)) (and (HasDirectPerm Mask@@1 null pm_f) (IsPredicateField pm_f))) (= (MapType0Select Heap@@4 null (PredicateMaskField pm_f)) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))))
 :qid |stdinbpl.47:19|
 :skolemid |2|
 :pattern ( (IdenticalOnKnownLocations Heap@@4 ExhaleHeap Mask@@1) (IsPredicateField pm_f) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))
)))
(assert (forall ((arg0@@25 T@U) ) (! (let ((A@@0 (FieldTypeInv0 (type arg0@@25))))
(= (type (WandMaskField arg0@@25)) (FieldType A@@0 (MapType1Type RefType boolType))))
 :qid |funType:WandMaskField|
 :pattern ( (WandMaskField arg0@@25))
)))
(assert (forall ((Heap@@5 T@U) (ExhaleHeap@@0 T@U) (Mask@@2 T@U) (pm_f@@0 T@U) ) (! (let ((C@@0 (FieldTypeInv0 (type pm_f@@0))))
 (=> (and (and (and (and (and (= (type Heap@@5) (MapType0Type RefType)) (= (type ExhaleHeap@@0) (MapType0Type RefType))) (= (type Mask@@2) (MapType1Type RefType realType))) (= (type pm_f@@0) (FieldType C@@0 FrameTypeType))) (IdenticalOnKnownLocations Heap@@5 ExhaleHeap@@0 Mask@@2)) (and (HasDirectPerm Mask@@2 null pm_f@@0) (IsWandField pm_f@@0))) (= (MapType0Select Heap@@5 null (WandMaskField pm_f@@0)) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))))
 :qid |stdinbpl.60:19|
 :skolemid |5|
 :pattern ( (IdenticalOnKnownLocations Heap@@5 ExhaleHeap@@0 Mask@@2) (IsWandField pm_f@@0) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))
)))
(assert (forall ((Heap@@6 T@U) (ExhaleHeap@@1 T@U) (Mask@@3 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@6) (MapType0Type RefType)) (= (type ExhaleHeap@@1) (MapType0Type RefType))) (= (type Mask@@3) (MapType1Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@6 ExhaleHeap@@1 Mask@@3)) (U_2_bool (MapType0Select Heap@@6 o_1 $allocated))) (U_2_bool (MapType0Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.73:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@6 ExhaleHeap@@1 Mask@@3) (MapType0Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert (forall ((this@@4 T@U) (end@@4 T@U) (this2 T@U) (end2 T@U) ) (!  (=> (and (and (and (and (= (type this@@4) RefType) (= (type end@@4) RefType)) (= (type this2) RefType)) (= (type end2) RefType)) (= (lseg this@@4 end@@4) (lseg this2 end2))) (and (= this@@4 this2) (= end@@4 end2)))
 :qid |stdinbpl.526:15|
 :skolemid |36|
 :pattern ( (lseg this@@4 end@@4) (lseg this2 end2))
)))
(assert (forall ((arg0@@26 T@U) (arg1@@10 T@U) ) (! (= (type (|lseg#sm| arg0@@26 arg1@@10)) (FieldType PredicateType_lsegType (MapType1Type RefType boolType)))
 :qid |funType:lseg#sm|
 :pattern ( (|lseg#sm| arg0@@26 arg1@@10))
)))
(assert (forall ((this@@5 T@U) (end@@5 T@U) (this2@@0 T@U) (end2@@0 T@U) ) (!  (=> (and (and (and (and (= (type this@@5) RefType) (= (type end@@5) RefType)) (= (type this2@@0) RefType)) (= (type end2@@0) RefType)) (= (|lseg#sm| this@@5 end@@5) (|lseg#sm| this2@@0 end2@@0))) (and (= this@@5 this2@@0) (= end@@5 end2@@0)))
 :qid |stdinbpl.530:15|
 :skolemid |37|
 :pattern ( (|lseg#sm| this@@5 end@@5) (|lseg#sm| this2@@0 end2@@0))
)))
(assert (forall ((Heap@@7 T@U) (Mask@@4 T@U) (this@@6 T@U) (end@@6 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@7) (MapType0Type RefType)) (= (type Mask@@4) (MapType1Type RefType realType))) (= (type this@@6) RefType)) (= (type end@@6) RefType)) (state Heap@@7 Mask@@4)) (= (|length'| Heap@@7 this@@6 end@@6) (|length#frame| (MapType0Select Heap@@7 null (lseg this@@6 end@@6)) this@@6 end@@6)))
 :qid |stdinbpl.379:15|
 :skolemid |30|
 :pattern ( (state Heap@@7 Mask@@4) (|length'| Heap@@7 this@@6 end@@6))
 :pattern ( (state Heap@@7 Mask@@4) (|length#triggerStateless| this@@6 end@@6) (|lseg#trigger| Heap@@7 (lseg this@@6 end@@6)))
)))
(assert (forall ((Heap@@8 T@U) (ExhaleHeap@@2 T@U) (Mask@@5 T@U) (o_1@@0 T@U) (f_2 T@U) ) (! (let ((B@@1 (FieldTypeInv1 (type f_2))))
(let ((A@@1 (FieldTypeInv0 (type f_2))))
 (=> (and (and (and (and (and (and (= (type Heap@@8) (MapType0Type RefType)) (= (type ExhaleHeap@@2) (MapType0Type RefType))) (= (type Mask@@5) (MapType1Type RefType realType))) (= (type o_1@@0) RefType)) (= (type f_2) (FieldType A@@1 B@@1))) (IdenticalOnKnownLocations Heap@@8 ExhaleHeap@@2 Mask@@5)) (HasDirectPerm Mask@@5 o_1@@0 f_2)) (= (MapType0Select Heap@@8 o_1@@0 f_2) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2)))))
 :qid |stdinbpl.42:22|
 :skolemid |1|
 :pattern ( (IdenticalOnKnownLocations Heap@@8 ExhaleHeap@@2 Mask@@5) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2))
)))
(assert  (and (= (type dummyHeap) (MapType0Type RefType)) (= (type ZeroMask) (MapType1Type RefType realType))))
(assert (state dummyHeap ZeroMask))
(assert (forall ((p T@U) (v_1 T@U) (w T@U) ) (! (let ((A@@2 (FieldTypeInv0 (type p))))
 (=> (and (and (= (type p) (FieldType A@@2 FrameTypeType)) (= (type v_1) FrameTypeType)) (= (type w) FrameTypeType)) (not (InsidePredicate p v_1 p w))))
 :qid |stdinbpl.174:19|
 :skolemid |21|
 :pattern ( (InsidePredicate p v_1 p w))
)))
(assert  (not (IsPredicateField next)))
(assert  (not (IsWandField next)))
(assert  (not (IsPredicateField value)))
(assert  (not (IsWandField value)))
(assert (forall ((Heap@@9 T@U) (ExhaleHeap@@3 T@U) (Mask@@6 T@U) ) (!  (=> (and (and (and (= (type Heap@@9) (MapType0Type RefType)) (= (type ExhaleHeap@@3) (MapType0Type RefType))) (= (type Mask@@6) (MapType1Type RefType realType))) (IdenticalOnKnownLocations Heap@@9 ExhaleHeap@@3 Mask@@6)) (succHeap Heap@@9 ExhaleHeap@@3))
 :qid |stdinbpl.83:15|
 :skolemid |10|
 :pattern ( (IdenticalOnKnownLocations Heap@@9 ExhaleHeap@@3 Mask@@6))
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
(assert  (and (forall ((arg0@@27 Real) (arg1@@11 T@U) ) (! (= (type (ConditionalFrame arg0@@27 arg1@@11)) FrameTypeType)
 :qid |funType:ConditionalFrame|
 :pattern ( (ConditionalFrame arg0@@27 arg1@@11))
)) (= (type EmptyFrame) FrameTypeType)))
(assert (forall ((p@@0 Real) (f_6 T@U) ) (!  (=> (= (type f_6) FrameTypeType) (= (ConditionalFrame p@@0 f_6) (ite (> p@@0 0.0) f_6 EmptyFrame)))
 :qid |stdinbpl.162:15|
 :skolemid |19|
 :pattern ( (ConditionalFrame p@@0 f_6))
)))
(assert (forall ((Mask@@7 T@U) (o_2@@0 T@U) (f_4@@0 T@U) ) (! (let ((B@@3 (FieldTypeInv1 (type f_4@@0))))
(let ((A@@4 (FieldTypeInv0 (type f_4@@0))))
 (=> (and (and (= (type Mask@@7) (MapType1Type RefType realType)) (= (type o_2@@0) RefType)) (= (type f_4@@0) (FieldType A@@4 B@@3))) (= (HasDirectPerm Mask@@7 o_2@@0 f_4@@0) (> (U_2_real (MapType1Select Mask@@7 o_2@@0 f_4@@0)) NoPerm)))))
 :qid |stdinbpl.133:22|
 :skolemid |17|
 :pattern ( (HasDirectPerm Mask@@7 o_2@@0 f_4@@0))
)))
(assert (forall ((Heap@@10 T@U) (this@@7 T@U) (end@@7 T@U) ) (!  (=> (and (and (= (type Heap@@10) (MapType0Type RefType)) (= (type this@@7) RefType)) (= (type end@@7) RefType)) (and (= (length Heap@@10 this@@7 end@@7) (|length'| Heap@@10 this@@7 end@@7)) (dummyFunction (int_2_U (|length#triggerStateless| this@@7 end@@7)))))
 :qid |stdinbpl.362:15|
 :skolemid |27|
 :pattern ( (length Heap@@10 this@@7 end@@7))
)))
(assert (forall ((o_2@@1 T@U) (f_4@@1 T@U) ) (! (let ((B@@4 (FieldTypeInv1 (type f_4@@1))))
(let ((A@@5 (FieldTypeInv0 (type f_4@@1))))
 (=> (and (= (type o_2@@1) RefType) (= (type f_4@@1) (FieldType A@@5 B@@4))) (= (U_2_real (MapType1Select ZeroMask o_2@@1 f_4@@1)) NoPerm))))
 :qid |stdinbpl.106:22|
 :skolemid |13|
 :pattern ( (MapType1Select ZeroMask o_2@@1 f_4@@1))
)))
(assert (forall ((Heap@@11 T@U) (Mask@@8 T@U) (this@@8 T@U) (i@@0 Int) (end@@8 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@11) (MapType0Type RefType)) (= (type Mask@@8) (MapType1Type RefType realType))) (= (type this@@8) RefType)) (= (type end@@8) RefType)) (state Heap@@11 Mask@@8)) (= (|get'| Heap@@11 this@@8 i@@0 end@@8) (|get#frame| (MapType0Select Heap@@11 null (lseg this@@8 end@@8)) this@@8 i@@0 end@@8)))
 :qid |stdinbpl.214:15|
 :skolemid |25|
 :pattern ( (state Heap@@11 Mask@@8) (|get'| Heap@@11 this@@8 i@@0 end@@8))
 :pattern ( (state Heap@@11 Mask@@8) (|get#triggerStateless| this@@8 i@@0 end@@8) (|lseg#trigger| Heap@@11 (lseg this@@8 end@@8)))
)))
(assert (forall ((Heap@@12 T@U) (this@@9 T@U) (i@@1 Int) (end@@9 T@U) ) (!  (=> (and (and (= (type Heap@@12) (MapType0Type RefType)) (= (type this@@9) RefType)) (= (type end@@9) RefType)) (and (= (get Heap@@12 this@@9 i@@1 end@@9) (|get'| Heap@@12 this@@9 i@@1 end@@9)) (dummyFunction (int_2_U (|get#triggerStateless| this@@9 i@@1 end@@9)))))
 :qid |stdinbpl.197:15|
 :skolemid |22|
 :pattern ( (get Heap@@12 this@@9 i@@1 end@@9))
)))
(assert (forall ((this@@10 T@U) (end@@10 T@U) ) (!  (=> (and (= (type this@@10) RefType) (= (type end@@10) RefType)) (= (getPredWandId (lseg this@@10 end@@10)) 0))
 :qid |stdinbpl.520:15|
 :skolemid |35|
 :pattern ( (lseg this@@10 end@@10))
)))
(assert (forall ((Heap@@13 T@U) (ExhaleHeap@@4 T@U) (Mask@@9 T@U) (pm_f@@1 T@U) ) (! (let ((C@@1 (FieldTypeInv0 (type pm_f@@1))))
 (=> (and (and (and (and (and (= (type Heap@@13) (MapType0Type RefType)) (= (type ExhaleHeap@@4) (MapType0Type RefType))) (= (type Mask@@9) (MapType1Type RefType realType))) (= (type pm_f@@1) (FieldType C@@1 FrameTypeType))) (IdenticalOnKnownLocations Heap@@13 ExhaleHeap@@4 Mask@@9)) (and (HasDirectPerm Mask@@9 null pm_f@@1) (IsPredicateField pm_f@@1))) (forall ((o2 T@U) (f_2@@0 T@U) ) (! (let ((B@@5 (FieldTypeInv1 (type f_2@@0))))
(let ((A@@6 (FieldTypeInv0 (type f_2@@0))))
 (=> (and (and (= (type o2) RefType) (= (type f_2@@0) (FieldType A@@6 B@@5))) (U_2_bool (MapType1Select (MapType0Select Heap@@13 null (PredicateMaskField pm_f@@1)) o2 f_2@@0))) (= (MapType0Select Heap@@13 o2 f_2@@0) (MapType0Select ExhaleHeap@@4 o2 f_2@@0)))))
 :qid |stdinbpl.54:134|
 :skolemid |3|
 :pattern ( (MapType0Select ExhaleHeap@@4 o2 f_2@@0))
))))
 :qid |stdinbpl.52:19|
 :skolemid |4|
 :pattern ( (IdenticalOnKnownLocations Heap@@13 ExhaleHeap@@4 Mask@@9) (IsPredicateField pm_f@@1))
)))
(assert (forall ((Heap@@14 T@U) (ExhaleHeap@@5 T@U) (Mask@@10 T@U) (pm_f@@2 T@U) ) (! (let ((C@@2 (FieldTypeInv0 (type pm_f@@2))))
 (=> (and (and (and (and (and (= (type Heap@@14) (MapType0Type RefType)) (= (type ExhaleHeap@@5) (MapType0Type RefType))) (= (type Mask@@10) (MapType1Type RefType realType))) (= (type pm_f@@2) (FieldType C@@2 FrameTypeType))) (IdenticalOnKnownLocations Heap@@14 ExhaleHeap@@5 Mask@@10)) (and (HasDirectPerm Mask@@10 null pm_f@@2) (IsWandField pm_f@@2))) (forall ((o2@@0 T@U) (f_2@@1 T@U) ) (! (let ((B@@6 (FieldTypeInv1 (type f_2@@1))))
(let ((A@@7 (FieldTypeInv0 (type f_2@@1))))
 (=> (and (and (= (type o2@@0) RefType) (= (type f_2@@1) (FieldType A@@7 B@@6))) (U_2_bool (MapType1Select (MapType0Select Heap@@14 null (WandMaskField pm_f@@2)) o2@@0 f_2@@1))) (= (MapType0Select Heap@@14 o2@@0 f_2@@1) (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1)))))
 :qid |stdinbpl.67:129|
 :skolemid |6|
 :pattern ( (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1))
))))
 :qid |stdinbpl.65:19|
 :skolemid |7|
 :pattern ( (IdenticalOnKnownLocations Heap@@14 ExhaleHeap@@5 Mask@@10) (IsWandField pm_f@@2))
)))
(assert (forall ((Mask@@11 T@U) (o_2@@2 T@U) (f_4@@2 T@U) ) (! (let ((B@@7 (FieldTypeInv1 (type f_4@@2))))
(let ((A@@8 (FieldTypeInv0 (type f_4@@2))))
 (=> (and (and (and (= (type Mask@@11) (MapType1Type RefType realType)) (= (type o_2@@2) RefType)) (= (type f_4@@2) (FieldType A@@8 B@@7))) (GoodMask Mask@@11)) (and (>= (U_2_real (MapType1Select Mask@@11 o_2@@2 f_4@@2)) NoPerm) (=> (and (and (GoodMask Mask@@11) (not (IsPredicateField f_4@@2))) (not (IsWandField f_4@@2))) (<= (U_2_real (MapType1Select Mask@@11 o_2@@2 f_4@@2)) FullPerm))))))
 :qid |stdinbpl.128:22|
 :skolemid |16|
 :pattern ( (GoodMask Mask@@11) (MapType1Select Mask@@11 o_2@@2 f_4@@2))
)))
(assert (forall ((o T@U) (f T@U) (Heap@@15 T@U) ) (!  (=> (and (and (and (= (type o) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap@@15) (MapType0Type RefType))) (U_2_bool (MapType0Select Heap@@15 o $allocated))) (U_2_bool (MapType0Select Heap@@15 (MapType0Select Heap@@15 o f) $allocated)))
 :qid |stdinbpl.31:15|
 :skolemid |0|
 :pattern ( (MapType0Select Heap@@15 o f))
)))
(assert (forall ((this@@11 T@U) (end@@11 T@U) ) (!  (=> (and (= (type this@@11) RefType) (= (type end@@11) RefType)) (= (PredicateMaskField (lseg this@@11 end@@11)) (|lseg#sm| this@@11 end@@11)))
 :qid |stdinbpl.512:15|
 :skolemid |33|
 :pattern ( (PredicateMaskField (lseg this@@11 end@@11)))
)))
(assert (forall ((Heap@@16 T@U) (Mask@@12 T@U) (this@@12 T@U) (i@@2 Int) (end@@12 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@16) (MapType0Type RefType)) (= (type Mask@@12) (MapType1Type RefType realType))) (= (type this@@12) RefType)) (= (type end@@12) RefType)) (and (state Heap@@16 Mask@@12) (< AssumeFunctionsAbove 0))) (and (<= 0 i@@2) (< i@@2 (length Heap@@16 this@@12 end@@12)))) (= (get Heap@@16 this@@12 i@@2 end@@12) (ite (= i@@2 0) (U_2_int (MapType0Select Heap@@16 this@@12 value)) (|get'| Heap@@16 (MapType0Select Heap@@16 this@@12 next) (- i@@2 1) end@@12))))
 :qid |stdinbpl.207:15|
 :skolemid |24|
 :pattern ( (state Heap@@16 Mask@@12) (get Heap@@16 this@@12 i@@2 end@@12))
 :pattern ( (state Heap@@16 Mask@@12) (|get#triggerStateless| this@@12 i@@2 end@@12) (|lseg#trigger| Heap@@16 (lseg this@@12 end@@12)))
)))
(assert (forall ((Heap@@17 T@U) (Mask@@13 T@U) (this@@13 T@U) (end@@13 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@17) (MapType0Type RefType)) (= (type Mask@@13) (MapType1Type RefType realType))) (= (type this@@13) RefType)) (= (type end@@13) RefType)) (and (state Heap@@17 Mask@@13) (< AssumeFunctionsAbove 1))) (= (length Heap@@17 this@@13 end@@13) (ite (= (MapType0Select Heap@@17 this@@13 next) end@@13) 1 (+ 1 (|length'| Heap@@17 (MapType0Select Heap@@17 this@@13 next) end@@13)))))
 :qid |stdinbpl.372:15|
 :skolemid |29|
 :pattern ( (state Heap@@17 Mask@@13) (length Heap@@17 this@@13 end@@13))
 :pattern ( (state Heap@@17 Mask@@13) (|length#triggerStateless| this@@13 end@@13) (|lseg#trigger| Heap@@17 (lseg this@@13 end@@13)))
)))
(assert (forall ((Heap@@18 T@U) (o@@0 T@U) (f_3 T@U) (v T@U) ) (! (let ((B@@8 (type v)))
(let ((A@@9 (FieldTypeInv0 (type f_3))))
 (=> (and (and (= (type Heap@@18) (MapType0Type RefType)) (= (type o@@0) RefType)) (= (type f_3) (FieldType A@@9 B@@8))) (succHeap Heap@@18 (MapType0Store Heap@@18 o@@0 f_3 v)))))
 :qid |stdinbpl.78:22|
 :skolemid |9|
 :pattern ( (MapType0Store Heap@@18 o@@0 f_3 v))
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
 :qid |stdinbpl.169:25|
 :skolemid |20|
 :pattern ( (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun PostMask@1 () T@U)
(declare-fun PostMask@0 () T@U)
(declare-fun this@@14 () T@U)
(declare-fun end@@14 () T@U)
(declare-fun PostHeap@0 () T@U)
(declare-fun Heap@@19 () T@U)
(declare-fun Mask@0 () T@U)
(declare-fun i_1 () Int)
(declare-fun PostMask@3 () T@U)
(declare-fun i_2 () Int)
(declare-fun Heap@20 () T@U)
(declare-fun val@@7 () Int)
(declare-fun Mask@21 () T@U)
(declare-fun Mask@20 () T@U)
(declare-fun Heap@18 () T@U)
(declare-fun newPMask@1 () T@U)
(declare-fun Heap@19 () T@U)
(declare-fun Heap@17 () T@U)
(declare-fun Heap@16 () T@U)
(declare-fun Heap@13 () T@U)
(declare-fun Heap@14 () T@U)
(declare-fun Heap@15 () T@U)
(declare-fun freshVersion@1 () T@U)
(declare-fun Mask@19 () T@U)
(declare-fun CombineFrames (T@U T@U) T@U)
(declare-fun FrameFragment (T@U) T@U)
(declare-fun Mask@18 () T@U)
(declare-fun Mask@17 () T@U)
(declare-fun Mask@16 () T@U)
(declare-fun Mask@15 () T@U)
(declare-fun Heap@12 () T@U)
(declare-fun Mask@14 () T@U)
(declare-fun Heap@10 () T@U)
(declare-fun freshObj@0 () T@U)
(declare-fun newPMask@0 () T@U)
(declare-fun Heap@11 () T@U)
(declare-fun Heap@9 () T@U)
(declare-fun Heap@8 () T@U)
(declare-fun Heap@5 () T@U)
(declare-fun Heap@6 () T@U)
(declare-fun Heap@7 () T@U)
(declare-fun freshVersion@0 () T@U)
(declare-fun Mask@13 () T@U)
(declare-fun Mask@12 () T@U)
(declare-fun Mask@11 () T@U)
(declare-fun Mask@10 () T@U)
(declare-fun Mask@7 () T@U)
(declare-fun Heap@1 () T@U)
(declare-fun Heap@2 () T@U)
(declare-fun Mask@6 () T@U)
(declare-fun Mask@5 () T@U)
(declare-fun Heap@3 () T@U)
(declare-fun Heap@4 () T@U)
(declare-fun Mask@8 () T@U)
(declare-fun arg_this@0 () T@U)
(declare-fun ExhaleHeap@0 () T@U)
(declare-fun Mask@9 () T@U)
(declare-fun Mask@3 () T@U)
(declare-fun Mask@4 () T@U)
(declare-fun Mask@2 () T@U)
(declare-fun Mask@1 () T@U)
(declare-fun Heap@0 () T@U)
(declare-fun newVersion@0 () T@U)
(declare-fun n () T@U)
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (= (type Heap@@19) (MapType0Type RefType)) (= (type this@@14) RefType)) (= (type end@@14) RefType)) (= (type Heap@20) (MapType0Type RefType))) (= (type Mask@21) (MapType1Type RefType realType))) (= (type Mask@20) (MapType1Type RefType realType))) (= (type Heap@18) (MapType0Type RefType))) (= (type newPMask@1) (MapType1Type RefType boolType))) (= (type Heap@19) (MapType0Type RefType))) (= (type Heap@17) (MapType0Type RefType))) (= (type Heap@16) (MapType0Type RefType))) (= (type Heap@14) (MapType0Type RefType))) (= (type Heap@13) (MapType0Type RefType))) (= (type Heap@15) (MapType0Type RefType))) (= (type freshVersion@1) FrameTypeType)) (= (type Mask@19) (MapType1Type RefType realType))) (forall ((arg0@@28 T@U) (arg1@@12 T@U) ) (! (= (type (CombineFrames arg0@@28 arg1@@12)) FrameTypeType)
 :qid |funType:CombineFrames|
 :pattern ( (CombineFrames arg0@@28 arg1@@12))
))) (forall ((arg0@@29 T@U) ) (! (= (type (FrameFragment arg0@@29)) FrameTypeType)
 :qid |funType:FrameFragment|
 :pattern ( (FrameFragment arg0@@29))
))) (= (type Mask@17) (MapType1Type RefType realType))) (= (type Mask@18) (MapType1Type RefType realType))) (= (type Mask@16) (MapType1Type RefType realType))) (= (type Mask@15) (MapType1Type RefType realType))) (= (type Mask@8) (MapType1Type RefType realType))) (= (type Mask@5) (MapType1Type RefType realType))) (= (type arg_this@0) RefType)) (= (type Heap@1) (MapType0Type RefType))) (= (type ExhaleHeap@0) (MapType0Type RefType))) (= (type Mask@9) (MapType1Type RefType realType))) (= (type Heap@12) (MapType0Type RefType))) (= (type Mask@14) (MapType1Type RefType realType))) (= (type Heap@10) (MapType0Type RefType))) (= (type freshObj@0) RefType)) (= (type newPMask@0) (MapType1Type RefType boolType))) (= (type Heap@11) (MapType0Type RefType))) (= (type Heap@9) (MapType0Type RefType))) (= (type Heap@8) (MapType0Type RefType))) (= (type Heap@6) (MapType0Type RefType))) (= (type Heap@5) (MapType0Type RefType))) (= (type Heap@7) (MapType0Type RefType))) (= (type freshVersion@0) FrameTypeType)) (= (type Mask@13) (MapType1Type RefType realType))) (= (type Mask@11) (MapType1Type RefType realType))) (= (type Mask@12) (MapType1Type RefType realType))) (= (type Mask@10) (MapType1Type RefType realType))) (= (type Mask@7) (MapType1Type RefType realType))) (= (type Heap@2) (MapType0Type RefType))) (= (type Mask@6) (MapType1Type RefType realType))) (= (type Heap@3) (MapType0Type RefType))) (= (type Heap@4) (MapType0Type RefType))) (= (type Mask@4) (MapType1Type RefType realType))) (= (type Mask@3) (MapType1Type RefType realType))) (= (type Mask@2) (MapType1Type RefType realType))) (= (type Mask@1) (MapType1Type RefType realType))) (= (type Heap@0) (MapType0Type RefType))) (= (type newVersion@0) FrameTypeType)) (= (type Mask@0) (MapType1Type RefType realType))) (= (type n) RefType)) (= (type PostMask@0) (MapType1Type RefType realType))) (= (type PostMask@3) (MapType1Type RefType realType))) (= (type PostHeap@0) (MapType0Type RefType))) (= (type PostMask@1) (MapType1Type RefType realType))))
(set-info :boogie-vc-id addAtEnd)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 123) (let ((anon32_correct  (=> (= PostMask@1 (MapType1Store PostMask@0 null (lseg this@@14 end@@14) (real_2_U (- (U_2_real (MapType1Select PostMask@0 null (lseg this@@14 end@@14))) FullPerm)))) (and (=> (= (ControlFlow 0 114) (- 0 115)) (<= 0 (- (length PostHeap@0 this@@14 end@@14) 1))) (=> (<= 0 (- (length PostHeap@0 this@@14 end@@14) 1)) (=> (= (ControlFlow 0 114) (- 0 113)) (< (- (length PostHeap@0 this@@14 end@@14) 1) (length PostHeap@0 this@@14 end@@14))))))))
(let ((anon93_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 118) 114)) anon32_correct)))
(let ((anon93_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 116) (- 0 117)) (<= FullPerm (U_2_real (MapType1Select PostMask@0 null (lseg this@@14 end@@14))))) (=> (<= FullPerm (U_2_real (MapType1Select PostMask@0 null (lseg this@@14 end@@14)))) (=> (= (ControlFlow 0 116) 114) anon32_correct))))))
(let ((anon28_correct true))
(let ((anon91_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 112) 109)) anon28_correct)))
(let ((anon91_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 110) (- 0 111)) (<= FullPerm (U_2_real (MapType1Select PostMask@0 null (lseg this@@14 end@@14))))) (=> (<= FullPerm (U_2_real (MapType1Select PostMask@0 null (lseg this@@14 end@@14)))) (=> (= (ControlFlow 0 110) 109) anon28_correct))))))
(let ((anon92_Else_correct true))
(let ((anon81_Else_correct  (=> (forall ((i_1_1 Int) ) (!  (=> (and (<= 0 i_1_1) (< i_1_1 (length Heap@@19 this@@14 end@@14))) (= (get PostHeap@0 this@@14 i_1_1 end@@14) (get Heap@@19 this@@14 i_1_1 end@@14)))
 :qid |stdinbpl.1231:20|
 :skolemid |43|
 :pattern ( (|get#frame| (MapType0Select Heap@@19 null (lseg this@@14 end@@14)) this@@14 i_1_1 end@@14))
)) (=> (and (state PostHeap@0 PostMask@0) (state PostHeap@0 PostMask@0)) (and (and (and (and (=> (= (ControlFlow 0 119) 108) anon92_Else_correct) (=> (= (ControlFlow 0 119) 116) anon93_Then_correct)) (=> (= (ControlFlow 0 119) 118) anon93_Else_correct)) (=> (= (ControlFlow 0 119) 110) anon91_Then_correct)) (=> (= (ControlFlow 0 119) 112) anon91_Else_correct))))))
(let ((anon14_correct true))
(let ((anon84_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 106) 103)) anon14_correct)))
(let ((anon84_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 104) (- 0 105)) (<= FullPerm (U_2_real (MapType1Select Mask@0 null (lseg this@@14 end@@14))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@0 null (lseg this@@14 end@@14)))) (=> (= (ControlFlow 0 104) 103) anon14_correct))))))
(let ((anon23_correct  (and (=> (= (ControlFlow 0 96) (- 0 97)) (<= 0 i_1)) (=> (<= 0 i_1) (=> (= (ControlFlow 0 96) (- 0 95)) (< i_1 (length Heap@@19 this@@14 end@@14)))))))
(let ((anon89_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 100) 96)) anon23_correct)))
(let ((anon89_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 98) (- 0 99)) (<= FullPerm (U_2_real (MapType1Select Mask@0 null (lseg this@@14 end@@14))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@0 null (lseg this@@14 end@@14)))) (=> (= (ControlFlow 0 98) 96) anon23_correct))))))
(let ((anon19_correct  (=> (= PostMask@3 (MapType1Store PostMask@0 null (lseg this@@14 end@@14) (real_2_U (- (U_2_real (MapType1Select PostMask@0 null (lseg this@@14 end@@14))) FullPerm)))) (and (=> (= (ControlFlow 0 90) (- 0 91)) (<= 0 i_1)) (=> (<= 0 i_1) (=> (= (ControlFlow 0 90) (- 0 89)) (< i_1 (length PostHeap@0 this@@14 end@@14))))))))
(let ((anon87_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 94) 90)) anon19_correct)))
(let ((anon87_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 92) (- 0 93)) (<= FullPerm (U_2_real (MapType1Select PostMask@0 null (lseg this@@14 end@@14))))) (=> (<= FullPerm (U_2_real (MapType1Select PostMask@0 null (lseg this@@14 end@@14)))) (=> (= (ControlFlow 0 92) 90) anon19_correct))))))
(let ((anon24_correct true))
(let ((anon85_Then_correct  (=> (and (<= 0 i_1) (< i_1 (length Heap@@19 this@@14 end@@14))) (and (and (and (and (=> (= (ControlFlow 0 101) 87) anon24_correct) (=> (= (ControlFlow 0 101) 98) anon89_Then_correct)) (=> (= (ControlFlow 0 101) 100) anon89_Else_correct)) (=> (= (ControlFlow 0 101) 92) anon87_Then_correct)) (=> (= (ControlFlow 0 101) 94) anon87_Else_correct)))))
(let ((anon85_Else_correct  (=> (and (not (and (<= 0 i_1) (< i_1 (length Heap@@19 this@@14 end@@14)))) (= (ControlFlow 0 88) 87)) anon24_correct)))
(let ((anon82_Then_correct  (=> (<= 0 i_1) (and (and (and (=> (= (ControlFlow 0 107) 101) anon85_Then_correct) (=> (= (ControlFlow 0 107) 88) anon85_Else_correct)) (=> (= (ControlFlow 0 107) 104) anon84_Then_correct)) (=> (= (ControlFlow 0 107) 106) anon84_Else_correct)))))
(let ((anon82_Else_correct  (=> (< i_1 0) (and (=> (= (ControlFlow 0 102) 101) anon85_Then_correct) (=> (= (ControlFlow 0 102) 88) anon85_Else_correct)))))
(let ((anon79_Else_correct  (=> (= (length PostHeap@0 this@@14 end@@14) (+ (length Heap@@19 this@@14 end@@14) 1)) (=> (and (state PostHeap@0 PostMask@0) (state PostHeap@0 PostMask@0)) (and (and (=> (= (ControlFlow 0 120) 119) anon81_Else_correct) (=> (= (ControlFlow 0 120) 107) anon82_Then_correct)) (=> (= (ControlFlow 0 120) 102) anon82_Else_correct))))))
(let ((anon8_correct true))
(let ((anon80_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 86) 83)) anon8_correct)))
(let ((anon80_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 84) (- 0 85)) (<= FullPerm (U_2_real (MapType1Select Mask@0 null (lseg this@@14 end@@14))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@0 null (lseg this@@14 end@@14)))) (=> (= (ControlFlow 0 84) 83) anon8_correct))))))
(let ((anon4_correct true))
(let ((anon78_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 82) 79)) anon4_correct)))
(let ((anon78_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 80) (- 0 81)) (<= FullPerm (U_2_real (MapType1Select PostMask@0 null (lseg this@@14 end@@14))))) (=> (<= FullPerm (U_2_real (MapType1Select PostMask@0 null (lseg this@@14 end@@14)))) (=> (= (ControlFlow 0 80) 79) anon4_correct))))))
(let ((anon76_Then_correct  (=> (state PostHeap@0 ZeroMask) (=> (and (and (= PostMask@0 (MapType1Store ZeroMask null (lseg this@@14 end@@14) (real_2_U (+ (U_2_real (MapType1Select ZeroMask null (lseg this@@14 end@@14))) FullPerm)))) (state PostHeap@0 PostMask@0)) (and (state PostHeap@0 PostMask@0) (state PostHeap@0 PostMask@0))) (and (and (and (and (=> (= (ControlFlow 0 121) 120) anon79_Else_correct) (=> (= (ControlFlow 0 121) 84) anon80_Then_correct)) (=> (= (ControlFlow 0 121) 86) anon80_Else_correct)) (=> (= (ControlFlow 0 121) 80) anon78_Then_correct)) (=> (= (ControlFlow 0 121) 82) anon78_Else_correct))))))
(let ((anon74_correct true))
(let ((anon113_Else_correct  (=> (and (not (and (<= 0 i_2) (< i_2 (length Heap@@19 this@@14 end@@14)))) (= (ControlFlow 0 6) 3)) anon74_correct)))
(let ((anon113_Then_correct  (=> (and (<= 0 i_2) (< i_2 (length Heap@@19 this@@14 end@@14))) (and (=> (= (ControlFlow 0 4) (- 0 5)) (= (get Heap@20 this@@14 i_2 end@@14) (get Heap@@19 this@@14 i_2 end@@14))) (=> (= (get Heap@20 this@@14 i_2 end@@14) (get Heap@@19 this@@14 i_2 end@@14)) (=> (= (ControlFlow 0 4) 3) anon74_correct))))))
(let ((anon112_Else_correct  (=> (and (forall ((i_3_1 Int) ) (!  (=> (and (<= 0 i_3_1) (< i_3_1 (length Heap@@19 this@@14 end@@14))) (= (get Heap@20 this@@14 i_3_1 end@@14) (get Heap@@19 this@@14 i_3_1 end@@14)))
 :qid |stdinbpl.1521:20|
 :skolemid |47|
 :pattern ( (|get#frame| (MapType0Select Heap@@19 null (lseg this@@14 end@@14)) this@@14 i_3_1 end@@14))
)) (= (ControlFlow 0 2) (- 0 1))) (= (get Heap@20 this@@14 (- (length Heap@20 this@@14 end@@14) 1) end@@14) val@@7))))
(let ((anon71_correct  (=> (= Mask@21 (MapType1Store Mask@20 null (lseg this@@14 end@@14) (real_2_U (- (U_2_real (MapType1Select Mask@20 null (lseg this@@14 end@@14))) FullPerm)))) (and (=> (= (ControlFlow 0 7) (- 0 8)) (= (length Heap@20 this@@14 end@@14) (+ (length Heap@@19 this@@14 end@@14) 1))) (=> (= (length Heap@20 this@@14 end@@14) (+ (length Heap@@19 this@@14 end@@14) 1)) (and (and (=> (= (ControlFlow 0 7) 2) anon112_Else_correct) (=> (= (ControlFlow 0 7) 4) anon113_Then_correct)) (=> (= (ControlFlow 0 7) 6) anon113_Else_correct)))))))
(let ((anon111_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 11) 7)) anon71_correct)))
(let ((anon111_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 9) (- 0 10)) (<= FullPerm (U_2_real (MapType1Select Mask@20 null (lseg this@@14 end@@14))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@20 null (lseg this@@14 end@@14)))) (=> (= (ControlFlow 0 9) 7) anon71_correct))))))
(let ((anon69_correct  (=> (and (state Heap@20 Mask@20) (state Heap@20 Mask@20)) (and (=> (= (ControlFlow 0 12) 9) anon111_Then_correct) (=> (= (ControlFlow 0 12) 11) anon111_Else_correct)))))
(let ((anon110_Else_correct  (=> (= (MapType0Select Heap@18 this@@14 next) end@@14) (=> (and (= Heap@20 Heap@18) (= (ControlFlow 0 14) 12)) anon69_correct))))
(let ((anon110_Then_correct  (=> (not (= (MapType0Select Heap@18 this@@14 next) end@@14)) (=> (and (and (forall ((o_10 T@U) (f_14 T@U) ) (! (let ((B@@11 (FieldTypeInv1 (type f_14))))
(let ((A@@12 (FieldTypeInv0 (type f_14))))
 (=> (and (and (= (type o_10) RefType) (= (type f_14) (FieldType A@@12 B@@11))) (or (U_2_bool (MapType1Select (MapType0Select Heap@18 null (|lseg#sm| this@@14 end@@14)) o_10 f_14)) (U_2_bool (MapType1Select (MapType0Select Heap@18 null (|lseg#sm| (MapType0Select Heap@18 this@@14 next) end@@14)) o_10 f_14)))) (U_2_bool (MapType1Select newPMask@1 o_10 f_14)))))
 :qid |stdinbpl.1494:29|
 :skolemid |46|
 :pattern ( (MapType1Select newPMask@1 o_10 f_14))
)) (= Heap@19 (MapType0Store Heap@18 null (|lseg#sm| this@@14 end@@14) newPMask@1))) (and (= Heap@20 Heap@19) (= (ControlFlow 0 13) 12))) anon69_correct))))
(let ((anon67_correct  (=> (and (= Heap@17 (MapType0Store Heap@16 null (|lseg#sm| this@@14 end@@14) (MapType1Store (MapType0Select Heap@16 null (|lseg#sm| this@@14 end@@14)) this@@14 value (bool_2_U true)))) (= Heap@18 (MapType0Store Heap@17 null (|lseg#sm| this@@14 end@@14) (MapType1Store (MapType0Select Heap@17 null (|lseg#sm| this@@14 end@@14)) this@@14 next (bool_2_U true))))) (and (=> (= (ControlFlow 0 15) 13) anon110_Then_correct) (=> (= (ControlFlow 0 15) 14) anon110_Else_correct)))))
(let ((anon109_Else_correct  (=> (HasDirectPerm Mask@20 null (lseg this@@14 end@@14)) (=> (and (= Heap@16 Heap@13) (= (ControlFlow 0 17) 15)) anon67_correct))))
(let ((anon109_Then_correct  (=> (not (HasDirectPerm Mask@20 null (lseg this@@14 end@@14))) (=> (and (and (= Heap@14 (MapType0Store Heap@13 null (|lseg#sm| this@@14 end@@14) ZeroPMask)) (= Heap@15 (MapType0Store Heap@14 null (lseg this@@14 end@@14) freshVersion@1))) (and (= Heap@16 Heap@15) (= (ControlFlow 0 16) 15))) anon67_correct))))
(let ((anon65_correct  (=> (= Mask@20 (MapType1Store Mask@19 null (lseg this@@14 end@@14) (real_2_U (+ (U_2_real (MapType1Select Mask@19 null (lseg this@@14 end@@14))) FullPerm)))) (=> (and (and (state Heap@13 Mask@20) (state Heap@13 Mask@20)) (and (|lseg#trigger| Heap@13 (lseg this@@14 end@@14)) (= (MapType0Select Heap@13 null (lseg this@@14 end@@14)) (CombineFrames (FrameFragment (MapType0Select Heap@13 this@@14 value)) (CombineFrames (FrameFragment (MapType0Select Heap@13 this@@14 next)) (FrameFragment (ite (not (= (MapType0Select Heap@13 this@@14 next) end@@14)) (MapType0Select Heap@13 null (lseg (MapType0Select Heap@13 this@@14 next) end@@14)) EmptyFrame))))))) (and (=> (= (ControlFlow 0 18) 16) anon109_Then_correct) (=> (= (ControlFlow 0 18) 17) anon109_Else_correct))))))
(let ((anon64_correct  (=> (and (and (= Mask@18 (MapType1Store Mask@17 null (lseg (MapType0Select Heap@13 this@@14 next) end@@14) (real_2_U (- (U_2_real (MapType1Select Mask@17 null (lseg (MapType0Select Heap@13 this@@14 next) end@@14))) FullPerm)))) (InsidePredicate (lseg this@@14 end@@14) (MapType0Select Heap@13 null (lseg this@@14 end@@14)) (lseg (MapType0Select Heap@13 this@@14 next) end@@14) (MapType0Select Heap@13 null (lseg (MapType0Select Heap@13 this@@14 next) end@@14)))) (and (= Mask@19 Mask@18) (= (ControlFlow 0 20) 18))) anon65_correct)))
(let ((anon108_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 23) 20)) anon64_correct)))
(let ((anon108_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 21) (- 0 22)) (<= FullPerm (U_2_real (MapType1Select Mask@17 null (lseg (MapType0Select Heap@13 this@@14 next) end@@14))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@17 null (lseg (MapType0Select Heap@13 this@@14 next) end@@14)))) (=> (= (ControlFlow 0 21) 20) anon64_correct))))))
(let ((anon107_Then_correct  (=> (not (= (MapType0Select Heap@13 this@@14 next) end@@14)) (and (=> (= (ControlFlow 0 24) (- 0 25)) (not (= (MapType0Select Heap@13 this@@14 next) null))) (=> (not (= (MapType0Select Heap@13 this@@14 next) null)) (and (=> (= (ControlFlow 0 24) 21) anon108_Then_correct) (=> (= (ControlFlow 0 24) 23) anon108_Else_correct)))))))
(let ((anon107_Else_correct  (=> (= (MapType0Select Heap@13 this@@14 next) end@@14) (=> (and (= Mask@19 Mask@17) (= (ControlFlow 0 19) 18)) anon65_correct))))
(let ((anon61_correct  (=> (= Mask@17 (MapType1Store Mask@16 this@@14 next (real_2_U (- (U_2_real (MapType1Select Mask@16 this@@14 next)) FullPerm)))) (and (=> (= (ControlFlow 0 26) 24) anon107_Then_correct) (=> (= (ControlFlow 0 26) 19) anon107_Else_correct)))))
(let ((anon106_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 29) 26)) anon61_correct)))
(let ((anon106_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 27) (- 0 28)) (<= FullPerm (U_2_real (MapType1Select Mask@16 this@@14 next)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@16 this@@14 next))) (=> (= (ControlFlow 0 27) 26) anon61_correct))))))
(let ((anon59_correct  (=> (= Mask@16 (MapType1Store Mask@15 this@@14 value (real_2_U (- (U_2_real (MapType1Select Mask@15 this@@14 value)) FullPerm)))) (and (=> (= (ControlFlow 0 30) 27) anon106_Then_correct) (=> (= (ControlFlow 0 30) 29) anon106_Else_correct)))))
(let ((anon105_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 33) 30)) anon59_correct)))
(let ((anon105_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 31) (- 0 32)) (<= FullPerm (U_2_real (MapType1Select Mask@15 this@@14 value)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@15 this@@14 value))) (=> (= (ControlFlow 0 31) 30) anon59_correct))))))
(let ((anon57_correct  (=> (state Heap@13 Mask@15) (and (=> (= (ControlFlow 0 34) 31) anon105_Then_correct) (=> (= (ControlFlow 0 34) 33) anon105_Else_correct)))))
(let ((anon53_correct  (=> (state Heap@12 Mask@14) (=> (and (and (state Heap@12 Mask@14) (= Heap@13 Heap@12)) (and (= Mask@15 Mask@14) (= (ControlFlow 0 41) 34))) anon57_correct))))
(let ((anon103_Else_correct  (=> (= (MapType0Select Heap@10 freshObj@0 next) end@@14) (=> (and (= Heap@12 Heap@10) (= (ControlFlow 0 43) 41)) anon53_correct))))
(let ((anon103_Then_correct  (=> (not (= (MapType0Select Heap@10 freshObj@0 next) end@@14)) (=> (and (and (forall ((o_9 T@U) (f_13 T@U) ) (! (let ((B@@12 (FieldTypeInv1 (type f_13))))
(let ((A@@13 (FieldTypeInv0 (type f_13))))
 (=> (and (and (= (type o_9) RefType) (= (type f_13) (FieldType A@@13 B@@12))) (or (U_2_bool (MapType1Select (MapType0Select Heap@10 null (|lseg#sm| freshObj@0 end@@14)) o_9 f_13)) (U_2_bool (MapType1Select (MapType0Select Heap@10 null (|lseg#sm| (MapType0Select Heap@10 freshObj@0 next) end@@14)) o_9 f_13)))) (U_2_bool (MapType1Select newPMask@0 o_9 f_13)))))
 :qid |stdinbpl.1400:33|
 :skolemid |44|
 :pattern ( (MapType1Select newPMask@0 o_9 f_13))
)) (= Heap@11 (MapType0Store Heap@10 null (|lseg#sm| freshObj@0 end@@14) newPMask@0))) (and (= Heap@12 Heap@11) (= (ControlFlow 0 42) 41))) anon53_correct))))
(let ((anon51_correct  (=> (and (= Heap@9 (MapType0Store Heap@8 null (|lseg#sm| freshObj@0 end@@14) (MapType1Store (MapType0Select Heap@8 null (|lseg#sm| freshObj@0 end@@14)) freshObj@0 value (bool_2_U true)))) (= Heap@10 (MapType0Store Heap@9 null (|lseg#sm| freshObj@0 end@@14) (MapType1Store (MapType0Select Heap@9 null (|lseg#sm| freshObj@0 end@@14)) freshObj@0 next (bool_2_U true))))) (and (=> (= (ControlFlow 0 44) 42) anon103_Then_correct) (=> (= (ControlFlow 0 44) 43) anon103_Else_correct)))))
(let ((anon102_Else_correct  (=> (HasDirectPerm Mask@14 null (lseg freshObj@0 end@@14)) (=> (and (= Heap@8 Heap@5) (= (ControlFlow 0 46) 44)) anon51_correct))))
(let ((anon102_Then_correct  (=> (not (HasDirectPerm Mask@14 null (lseg freshObj@0 end@@14))) (=> (and (and (= Heap@6 (MapType0Store Heap@5 null (|lseg#sm| freshObj@0 end@@14) ZeroPMask)) (= Heap@7 (MapType0Store Heap@6 null (lseg freshObj@0 end@@14) freshVersion@0))) (and (= Heap@8 Heap@7) (= (ControlFlow 0 45) 44))) anon51_correct))))
(let ((anon49_correct  (=> (= Mask@14 (MapType1Store Mask@13 null (lseg freshObj@0 end@@14) (real_2_U (+ (U_2_real (MapType1Select Mask@13 null (lseg freshObj@0 end@@14))) FullPerm)))) (=> (and (and (state Heap@5 Mask@14) (state Heap@5 Mask@14)) (and (|lseg#trigger| Heap@5 (lseg freshObj@0 end@@14)) (= (MapType0Select Heap@5 null (lseg freshObj@0 end@@14)) (CombineFrames (FrameFragment (MapType0Select Heap@5 freshObj@0 value)) (CombineFrames (FrameFragment (MapType0Select Heap@5 freshObj@0 next)) (FrameFragment (ite (not (= (MapType0Select Heap@5 freshObj@0 next) end@@14)) (MapType0Select Heap@5 null (lseg (MapType0Select Heap@5 freshObj@0 next) end@@14)) EmptyFrame))))))) (and (=> (= (ControlFlow 0 47) 45) anon102_Then_correct) (=> (= (ControlFlow 0 47) 46) anon102_Else_correct))))))
(let ((anon48_correct  (=> (and (and (= Mask@12 (MapType1Store Mask@11 null (lseg (MapType0Select Heap@5 freshObj@0 next) end@@14) (real_2_U (- (U_2_real (MapType1Select Mask@11 null (lseg (MapType0Select Heap@5 freshObj@0 next) end@@14))) FullPerm)))) (InsidePredicate (lseg freshObj@0 end@@14) (MapType0Select Heap@5 null (lseg freshObj@0 end@@14)) (lseg (MapType0Select Heap@5 freshObj@0 next) end@@14) (MapType0Select Heap@5 null (lseg (MapType0Select Heap@5 freshObj@0 next) end@@14)))) (and (= Mask@13 Mask@12) (= (ControlFlow 0 49) 47))) anon49_correct)))
(let ((anon101_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 52) 49)) anon48_correct)))
(let ((anon101_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 50) (- 0 51)) (<= FullPerm (U_2_real (MapType1Select Mask@11 null (lseg (MapType0Select Heap@5 freshObj@0 next) end@@14))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@11 null (lseg (MapType0Select Heap@5 freshObj@0 next) end@@14)))) (=> (= (ControlFlow 0 50) 49) anon48_correct))))))
(let ((anon100_Then_correct  (=> (not (= (MapType0Select Heap@5 freshObj@0 next) end@@14)) (and (=> (= (ControlFlow 0 53) (- 0 54)) (not (= (MapType0Select Heap@5 freshObj@0 next) null))) (=> (not (= (MapType0Select Heap@5 freshObj@0 next) null)) (and (=> (= (ControlFlow 0 53) 50) anon101_Then_correct) (=> (= (ControlFlow 0 53) 52) anon101_Else_correct)))))))
(let ((anon100_Else_correct  (=> (= (MapType0Select Heap@5 freshObj@0 next) end@@14) (=> (and (= Mask@13 Mask@11) (= (ControlFlow 0 48) 47)) anon49_correct))))
(let ((anon45_correct  (=> (= Mask@11 (MapType1Store Mask@10 freshObj@0 next (real_2_U (- (U_2_real (MapType1Select Mask@10 freshObj@0 next)) FullPerm)))) (and (=> (= (ControlFlow 0 55) 53) anon100_Then_correct) (=> (= (ControlFlow 0 55) 48) anon100_Else_correct)))))
(let ((anon99_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 58) 55)) anon45_correct)))
(let ((anon99_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 56) (- 0 57)) (<= FullPerm (U_2_real (MapType1Select Mask@10 freshObj@0 next)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@10 freshObj@0 next))) (=> (= (ControlFlow 0 56) 55) anon45_correct))))))
(let ((anon43_correct  (=> (= Mask@10 (MapType1Store Mask@7 freshObj@0 value (real_2_U (- (U_2_real (MapType1Select Mask@7 freshObj@0 value)) FullPerm)))) (and (=> (= (ControlFlow 0 59) 56) anon99_Then_correct) (=> (= (ControlFlow 0 59) 58) anon99_Else_correct)))))
(let ((anon98_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 62) 59)) anon43_correct)))
(let ((anon98_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 60) (- 0 61)) (<= FullPerm (U_2_real (MapType1Select Mask@7 freshObj@0 value)))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@7 freshObj@0 value))) (=> (= (ControlFlow 0 60) 59) anon43_correct))))))
(let ((anon97_Then_correct  (=> (= (MapType0Select Heap@1 this@@14 next) end@@14) (=> (and (not (= freshObj@0 null)) (not (U_2_bool (MapType0Select Heap@1 freshObj@0 $allocated)))) (=> (and (and (= Heap@2 (MapType0Store Heap@1 freshObj@0 $allocated (bool_2_U true))) (= Mask@6 (MapType1Store Mask@5 freshObj@0 next (real_2_U (+ (U_2_real (MapType1Select Mask@5 freshObj@0 next)) FullPerm))))) (and (= Mask@7 (MapType1Store Mask@6 freshObj@0 value (real_2_U (+ (U_2_real (MapType1Select Mask@6 freshObj@0 value)) FullPerm)))) (state Heap@2 Mask@7))) (and (=> (= (ControlFlow 0 63) (- 0 66)) (= FullPerm (U_2_real (MapType1Select Mask@7 freshObj@0 next)))) (=> (= FullPerm (U_2_real (MapType1Select Mask@7 freshObj@0 next))) (=> (and (= Heap@3 (MapType0Store Heap@2 freshObj@0 next end@@14)) (state Heap@3 Mask@7)) (and (=> (= (ControlFlow 0 63) (- 0 65)) (= FullPerm (U_2_real (MapType1Select Mask@7 freshObj@0 value)))) (=> (= FullPerm (U_2_real (MapType1Select Mask@7 freshObj@0 value))) (=> (and (= Heap@4 (MapType0Store Heap@3 freshObj@0 value (int_2_U val@@7))) (state Heap@4 Mask@7)) (and (=> (= (ControlFlow 0 63) (- 0 64)) (= FullPerm (U_2_real (MapType1Select Mask@7 this@@14 next)))) (=> (= FullPerm (U_2_real (MapType1Select Mask@7 this@@14 next))) (=> (and (= Heap@5 (MapType0Store Heap@4 this@@14 next freshObj@0)) (state Heap@5 Mask@7)) (and (=> (= (ControlFlow 0 63) 60) anon98_Then_correct) (=> (= (ControlFlow 0 63) 62) anon98_Else_correct))))))))))))))))
(let ((anon56_correct  (=> (= Mask@8 (MapType1Store Mask@5 null (lseg arg_this@0 end@@14) (real_2_U (- (U_2_real (MapType1Select Mask@5 null (lseg arg_this@0 end@@14))) FullPerm)))) (=> (and (IdenticalOnKnownLocations Heap@1 ExhaleHeap@0 Mask@8) (= Mask@9 (MapType1Store Mask@8 null (lseg arg_this@0 end@@14) (real_2_U (+ (U_2_real (MapType1Select Mask@8 null (lseg arg_this@0 end@@14))) FullPerm))))) (=> (and (and (state ExhaleHeap@0 Mask@9) (state ExhaleHeap@0 Mask@9)) (and (= (length ExhaleHeap@0 arg_this@0 end@@14) (+ (length Heap@1 arg_this@0 end@@14) 1)) (state ExhaleHeap@0 Mask@9))) (=> (and (and (and (forall ((i_4 Int) ) (!  (=> (and (<= 0 i_4) (< i_4 (length Heap@1 arg_this@0 end@@14))) (= (get ExhaleHeap@0 arg_this@0 i_4 end@@14) (get Heap@1 arg_this@0 i_4 end@@14)))
 :qid |stdinbpl.1440:26|
 :skolemid |45|
 :pattern ( (|get#frame| (MapType0Select Heap@1 null (lseg arg_this@0 end@@14)) arg_this@0 i_4 end@@14))
)) (state ExhaleHeap@0 Mask@9)) (and (= (get ExhaleHeap@0 arg_this@0 (- (length ExhaleHeap@0 arg_this@0 end@@14) 1) end@@14) val@@7) (state ExhaleHeap@0 Mask@9))) (and (and (state ExhaleHeap@0 Mask@9) (= Heap@13 ExhaleHeap@0)) (and (= Mask@15 Mask@9) (= (ControlFlow 0 35) 34)))) anon57_correct))))))
(let ((anon104_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 38) 35)) anon56_correct)))
(let ((anon104_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 36) (- 0 37)) (<= FullPerm (U_2_real (MapType1Select Mask@5 null (lseg arg_this@0 end@@14))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@5 null (lseg arg_this@0 end@@14)))) (=> (= (ControlFlow 0 36) 35) anon56_correct))))))
(let ((anon97_Else_correct  (=> (not (= (MapType0Select Heap@1 this@@14 next) end@@14)) (and (=> (= (ControlFlow 0 39) (- 0 40)) (HasDirectPerm Mask@5 this@@14 next)) (=> (HasDirectPerm Mask@5 this@@14 next) (=> (= arg_this@0 (MapType0Select Heap@1 this@@14 next)) (and (=> (= (ControlFlow 0 39) 36) anon104_Then_correct) (=> (= (ControlFlow 0 39) 38) anon104_Else_correct))))))))
(let ((anon40_correct  (=> (and (state Heap@1 Mask@5) (state Heap@1 Mask@5)) (and (=> (= (ControlFlow 0 67) (- 0 68)) (HasDirectPerm Mask@5 this@@14 next)) (=> (HasDirectPerm Mask@5 this@@14 next) (and (=> (= (ControlFlow 0 67) 63) anon97_Then_correct) (=> (= (ControlFlow 0 67) 39) anon97_Else_correct)))))))
(let ((anon96_Else_correct  (=> (= (MapType0Select Heap@1 this@@14 next) end@@14) (=> (and (= Mask@5 Mask@3) (= (ControlFlow 0 70) 67)) anon40_correct))))
(let ((anon96_Then_correct  (=> (not (= (MapType0Select Heap@1 this@@14 next) end@@14)) (=> (and (not (= (MapType0Select Heap@1 this@@14 next) null)) (= Mask@4 (MapType1Store Mask@3 null (lseg (MapType0Select Heap@1 this@@14 next) end@@14) (real_2_U (+ (U_2_real (MapType1Select Mask@3 null (lseg (MapType0Select Heap@1 this@@14 next) end@@14))) FullPerm))))) (=> (and (and (InsidePredicate (lseg this@@14 end@@14) (MapType0Select Heap@1 null (lseg this@@14 end@@14)) (lseg (MapType0Select Heap@1 this@@14 next) end@@14) (MapType0Select Heap@1 null (lseg (MapType0Select Heap@1 this@@14 next) end@@14))) (state Heap@1 Mask@4)) (and (= Mask@5 Mask@4) (= (ControlFlow 0 69) 67))) anon40_correct)))))
(let ((anon38_correct  (=> (and (not (= this@@14 null)) (= Mask@2 (MapType1Store Mask@1 this@@14 value (real_2_U (+ (U_2_real (MapType1Select Mask@1 this@@14 value)) FullPerm))))) (=> (and (and (state Heap@1 Mask@2) (not (= this@@14 null))) (and (= Mask@3 (MapType1Store Mask@2 this@@14 next (real_2_U (+ (U_2_real (MapType1Select Mask@2 this@@14 next)) FullPerm)))) (state Heap@1 Mask@3))) (and (=> (= (ControlFlow 0 71) 69) anon96_Then_correct) (=> (= (ControlFlow 0 71) 70) anon96_Else_correct))))))
(let ((anon95_Else_correct  (=> (HasDirectPerm Mask@1 null (lseg this@@14 end@@14)) (=> (and (= Heap@1 Heap@@19) (= (ControlFlow 0 73) 71)) anon38_correct))))
(let ((anon95_Then_correct  (=> (and (and (not (HasDirectPerm Mask@1 null (lseg this@@14 end@@14))) (= Heap@0 (MapType0Store Heap@@19 null (lseg this@@14 end@@14) newVersion@0))) (and (= Heap@1 Heap@0) (= (ControlFlow 0 72) 71))) anon38_correct)))
(let ((anon36_correct  (=> (= Mask@1 (MapType1Store Mask@0 null (lseg this@@14 end@@14) (real_2_U (- (U_2_real (MapType1Select Mask@0 null (lseg this@@14 end@@14))) FullPerm)))) (and (=> (= (ControlFlow 0 74) 72) anon95_Then_correct) (=> (= (ControlFlow 0 74) 73) anon95_Else_correct)))))
(let ((anon94_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 77) 74)) anon36_correct)))
(let ((anon94_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 75) (- 0 76)) (<= FullPerm (U_2_real (MapType1Select Mask@0 null (lseg this@@14 end@@14))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@0 null (lseg this@@14 end@@14)))) (=> (= (ControlFlow 0 75) 74) anon36_correct))))))
(let ((anon76_Else_correct  (=> (U_2_bool (MapType0Select Heap@@19 n $allocated)) (=> (and (|lseg#trigger| Heap@@19 (lseg this@@14 end@@14)) (= (MapType0Select Heap@@19 null (lseg this@@14 end@@14)) (CombineFrames (FrameFragment (MapType0Select Heap@@19 this@@14 value)) (CombineFrames (FrameFragment (MapType0Select Heap@@19 this@@14 next)) (FrameFragment (ite (not (= (MapType0Select Heap@@19 this@@14 next) end@@14)) (MapType0Select Heap@@19 null (lseg (MapType0Select Heap@@19 this@@14 next) end@@14)) EmptyFrame)))))) (and (=> (= (ControlFlow 0 78) 75) anon94_Then_correct) (=> (= (ControlFlow 0 78) 77) anon94_Else_correct))))))
(let ((anon0_correct  (=> (state Heap@@19 ZeroMask) (=> (and (= AssumeFunctionsAbove (- 0 1)) (U_2_bool (MapType0Select Heap@@19 this@@14 $allocated))) (=> (and (and (U_2_bool (MapType0Select Heap@@19 end@@14 $allocated)) (= Mask@0 (MapType1Store ZeroMask null (lseg this@@14 end@@14) (real_2_U (+ (U_2_real (MapType1Select ZeroMask null (lseg this@@14 end@@14))) FullPerm))))) (and (state Heap@@19 Mask@0) (state Heap@@19 Mask@0))) (and (=> (= (ControlFlow 0 122) 121) anon76_Then_correct) (=> (= (ControlFlow 0 122) 78) anon76_Else_correct)))))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 123) 122) anon0_correct)))
PreconditionGeneratedEntry_correct))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
))
(check-sat)
(pop 1)
; Valid
(get-info :rlimit)
