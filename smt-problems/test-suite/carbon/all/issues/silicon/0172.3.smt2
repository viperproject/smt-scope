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
(declare-fun data () T@U)
(declare-fun next () T@U)
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
(declare-fun LL (T@U Int) T@U)
(declare-fun IsPredicateField (T@U) Bool)
(declare-fun PredicateType_LLType () T@T)
(declare-fun FrameTypeType () T@T)
(declare-fun LL2 (T@U Int) T@U)
(declare-fun PredicateType_LL2Type () T@T)
(declare-fun |LL#trigger| (T@U T@U) Bool)
(declare-fun |LL#everUsed| (T@U) Bool)
(declare-fun |LL2#trigger| (T@U T@U) Bool)
(declare-fun |LL2#everUsed| (T@U) Bool)
(declare-fun IdenticalOnKnownLocations (T@U T@U T@U) Bool)
(declare-fun null () T@U)
(declare-fun PredicateMaskField (T@U) T@U)
(declare-fun HasDirectPerm (T@U T@U T@U) Bool)
(declare-fun IsWandField (T@U) Bool)
(declare-fun WandMaskField (T@U) T@U)
(declare-fun |LL#sm| (T@U Int) T@U)
(declare-fun |LL2#sm| (T@U Int) T@U)
(declare-fun dummyHeap () T@U)
(declare-fun ZeroMask () T@U)
(declare-fun InsidePredicate (T@U T@U T@U T@U) Bool)
(declare-fun sumMask (T@U T@U T@U) Bool)
(declare-fun ConditionalFrame (Real T@U) T@U)
(declare-fun EmptyFrame () T@U)
(declare-fun NoPerm () Real)
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
))) (= (Ctor NormalFieldType) 7)) (= (type $allocated) (FieldType NormalFieldType boolType))) (= (type data) (FieldType NormalFieldType intType))) (= (Ctor RefType) 8)) (= (type next) (FieldType NormalFieldType RefType))))
(assert (distinct $allocated data next)
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
(assert  (and (and (= (Ctor PredicateType_LLType) 11) (= (Ctor FrameTypeType) 12)) (forall ((arg0@@23 T@U) (arg1@@9 Int) ) (! (= (type (LL arg0@@23 arg1@@9)) (FieldType PredicateType_LLType FrameTypeType))
 :qid |funType:LL|
 :pattern ( (LL arg0@@23 arg1@@9))
))))
(assert (forall ((x@@8 T@U) (i Int) ) (!  (=> (= (type x@@8) RefType) (IsPredicateField (LL x@@8 i)))
 :qid |stdinbpl.197:15|
 :skolemid |23|
 :pattern ( (LL x@@8 i))
)))
(assert  (and (= (Ctor PredicateType_LL2Type) 13) (forall ((arg0@@24 T@U) (arg1@@10 Int) ) (! (= (type (LL2 arg0@@24 arg1@@10)) (FieldType PredicateType_LL2Type FrameTypeType))
 :qid |funType:LL2|
 :pattern ( (LL2 arg0@@24 arg1@@10))
))))
(assert (forall ((x@@9 T@U) (i@@0 Int) ) (!  (=> (= (type x@@9) RefType) (IsPredicateField (LL2 x@@9 i@@0)))
 :qid |stdinbpl.774:15|
 :skolemid |47|
 :pattern ( (LL2 x@@9 i@@0))
)))
(assert (forall ((Heap@@0 T@U) (x@@10 T@U) (i@@1 Int) ) (!  (=> (and (= (type Heap@@0) (MapType0Type RefType)) (= (type x@@10) RefType)) (|LL#everUsed| (LL x@@10 i@@1)))
 :qid |stdinbpl.216:15|
 :skolemid |27|
 :pattern ( (|LL#trigger| Heap@@0 (LL x@@10 i@@1)))
)))
(assert (forall ((Heap@@1 T@U) (x@@11 T@U) (i@@2 Int) ) (!  (=> (and (= (type Heap@@1) (MapType0Type RefType)) (= (type x@@11) RefType)) (|LL2#everUsed| (LL2 x@@11 i@@2)))
 :qid |stdinbpl.793:15|
 :skolemid |51|
 :pattern ( (|LL2#trigger| Heap@@1 (LL2 x@@11 i@@2)))
)))
(assert  (and (= (type null) RefType) (forall ((arg0@@25 T@U) ) (! (let ((A (FieldTypeInv0 (type arg0@@25))))
(= (type (PredicateMaskField arg0@@25)) (FieldType A (MapType1Type RefType boolType))))
 :qid |funType:PredicateMaskField|
 :pattern ( (PredicateMaskField arg0@@25))
))))
(assert (forall ((Heap@@2 T@U) (ExhaleHeap T@U) (Mask@@0 T@U) (pm_f T@U) ) (! (let ((C (FieldTypeInv0 (type pm_f))))
 (=> (and (and (and (and (and (= (type Heap@@2) (MapType0Type RefType)) (= (type ExhaleHeap) (MapType0Type RefType))) (= (type Mask@@0) (MapType1Type RefType realType))) (= (type pm_f) (FieldType C FrameTypeType))) (IdenticalOnKnownLocations Heap@@2 ExhaleHeap Mask@@0)) (and (HasDirectPerm Mask@@0 null pm_f) (IsPredicateField pm_f))) (= (MapType0Select Heap@@2 null (PredicateMaskField pm_f)) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))))
 :qid |stdinbpl.47:19|
 :skolemid |2|
 :pattern ( (IdenticalOnKnownLocations Heap@@2 ExhaleHeap Mask@@0) (IsPredicateField pm_f) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))
)))
(assert (forall ((arg0@@26 T@U) ) (! (let ((A@@0 (FieldTypeInv0 (type arg0@@26))))
(= (type (WandMaskField arg0@@26)) (FieldType A@@0 (MapType1Type RefType boolType))))
 :qid |funType:WandMaskField|
 :pattern ( (WandMaskField arg0@@26))
)))
(assert (forall ((Heap@@3 T@U) (ExhaleHeap@@0 T@U) (Mask@@1 T@U) (pm_f@@0 T@U) ) (! (let ((C@@0 (FieldTypeInv0 (type pm_f@@0))))
 (=> (and (and (and (and (and (= (type Heap@@3) (MapType0Type RefType)) (= (type ExhaleHeap@@0) (MapType0Type RefType))) (= (type Mask@@1) (MapType1Type RefType realType))) (= (type pm_f@@0) (FieldType C@@0 FrameTypeType))) (IdenticalOnKnownLocations Heap@@3 ExhaleHeap@@0 Mask@@1)) (and (HasDirectPerm Mask@@1 null pm_f@@0) (IsWandField pm_f@@0))) (= (MapType0Select Heap@@3 null (WandMaskField pm_f@@0)) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))))
 :qid |stdinbpl.60:19|
 :skolemid |5|
 :pattern ( (IdenticalOnKnownLocations Heap@@3 ExhaleHeap@@0 Mask@@1) (IsWandField pm_f@@0) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))
)))
(assert (forall ((Heap@@4 T@U) (ExhaleHeap@@1 T@U) (Mask@@2 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@4) (MapType0Type RefType)) (= (type ExhaleHeap@@1) (MapType0Type RefType))) (= (type Mask@@2) (MapType1Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@4 ExhaleHeap@@1 Mask@@2)) (U_2_bool (MapType0Select Heap@@4 o_1 $allocated))) (U_2_bool (MapType0Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.73:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@4 ExhaleHeap@@1 Mask@@2) (MapType0Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert (forall ((x@@12 T@U) (i@@3 Int) (x2 T@U) (i2 Int) ) (!  (=> (and (and (= (type x@@12) RefType) (= (type x2) RefType)) (= (LL x@@12 i@@3) (LL x2 i2))) (and (= x@@12 x2) (= i@@3 i2)))
 :qid |stdinbpl.207:15|
 :skolemid |25|
 :pattern ( (LL x@@12 i@@3) (LL x2 i2))
)))
(assert (forall ((arg0@@27 T@U) (arg1@@11 Int) ) (! (= (type (|LL#sm| arg0@@27 arg1@@11)) (FieldType PredicateType_LLType (MapType1Type RefType boolType)))
 :qid |funType:LL#sm|
 :pattern ( (|LL#sm| arg0@@27 arg1@@11))
)))
(assert (forall ((x@@13 T@U) (i@@4 Int) (x2@@0 T@U) (i2@@0 Int) ) (!  (=> (and (and (= (type x@@13) RefType) (= (type x2@@0) RefType)) (= (|LL#sm| x@@13 i@@4) (|LL#sm| x2@@0 i2@@0))) (and (= x@@13 x2@@0) (= i@@4 i2@@0)))
 :qid |stdinbpl.211:15|
 :skolemid |26|
 :pattern ( (|LL#sm| x@@13 i@@4) (|LL#sm| x2@@0 i2@@0))
)))
(assert (forall ((x@@14 T@U) (i@@5 Int) (x2@@1 T@U) (i2@@1 Int) ) (!  (=> (and (and (= (type x@@14) RefType) (= (type x2@@1) RefType)) (= (LL2 x@@14 i@@5) (LL2 x2@@1 i2@@1))) (and (= x@@14 x2@@1) (= i@@5 i2@@1)))
 :qid |stdinbpl.784:15|
 :skolemid |49|
 :pattern ( (LL2 x@@14 i@@5) (LL2 x2@@1 i2@@1))
)))
(assert (forall ((arg0@@28 T@U) (arg1@@12 Int) ) (! (= (type (|LL2#sm| arg0@@28 arg1@@12)) (FieldType PredicateType_LL2Type (MapType1Type RefType boolType)))
 :qid |funType:LL2#sm|
 :pattern ( (|LL2#sm| arg0@@28 arg1@@12))
)))
(assert (forall ((x@@15 T@U) (i@@6 Int) (x2@@2 T@U) (i2@@2 Int) ) (!  (=> (and (and (= (type x@@15) RefType) (= (type x2@@2) RefType)) (= (|LL2#sm| x@@15 i@@6) (|LL2#sm| x2@@2 i2@@2))) (and (= x@@15 x2@@2) (= i@@6 i2@@2)))
 :qid |stdinbpl.788:15|
 :skolemid |50|
 :pattern ( (|LL2#sm| x@@15 i@@6) (|LL2#sm| x2@@2 i2@@2))
)))
(assert (forall ((Heap@@5 T@U) (ExhaleHeap@@2 T@U) (Mask@@3 T@U) (o_1@@0 T@U) (f_2 T@U) ) (! (let ((B@@1 (FieldTypeInv1 (type f_2))))
(let ((A@@1 (FieldTypeInv0 (type f_2))))
 (=> (and (and (and (and (and (and (= (type Heap@@5) (MapType0Type RefType)) (= (type ExhaleHeap@@2) (MapType0Type RefType))) (= (type Mask@@3) (MapType1Type RefType realType))) (= (type o_1@@0) RefType)) (= (type f_2) (FieldType A@@1 B@@1))) (IdenticalOnKnownLocations Heap@@5 ExhaleHeap@@2 Mask@@3)) (HasDirectPerm Mask@@3 o_1@@0 f_2)) (= (MapType0Select Heap@@5 o_1@@0 f_2) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2)))))
 :qid |stdinbpl.42:22|
 :skolemid |1|
 :pattern ( (IdenticalOnKnownLocations Heap@@5 ExhaleHeap@@2 Mask@@3) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2))
)))
(assert  (and (= (type dummyHeap) (MapType0Type RefType)) (= (type ZeroMask) (MapType1Type RefType realType))))
(assert (state dummyHeap ZeroMask))
(assert (forall ((p T@U) (v_1 T@U) (w T@U) ) (! (let ((A@@2 (FieldTypeInv0 (type p))))
 (=> (and (and (= (type p) (FieldType A@@2 FrameTypeType)) (= (type v_1) FrameTypeType)) (= (type w) FrameTypeType)) (not (InsidePredicate p v_1 p w))))
 :qid |stdinbpl.170:19|
 :skolemid |21|
 :pattern ( (InsidePredicate p v_1 p w))
)))
(assert  (not (IsPredicateField data)))
(assert  (not (IsWandField data)))
(assert  (not (IsPredicateField next)))
(assert  (not (IsWandField next)))
(assert (forall ((Heap@@6 T@U) (ExhaleHeap@@3 T@U) (Mask@@4 T@U) ) (!  (=> (and (and (and (= (type Heap@@6) (MapType0Type RefType)) (= (type ExhaleHeap@@3) (MapType0Type RefType))) (= (type Mask@@4) (MapType1Type RefType realType))) (IdenticalOnKnownLocations Heap@@6 ExhaleHeap@@3 Mask@@4)) (succHeap Heap@@6 ExhaleHeap@@3))
 :qid |stdinbpl.83:15|
 :skolemid |10|
 :pattern ( (IdenticalOnKnownLocations Heap@@6 ExhaleHeap@@3 Mask@@4))
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
(assert  (and (forall ((arg0@@29 Real) (arg1@@13 T@U) ) (! (= (type (ConditionalFrame arg0@@29 arg1@@13)) FrameTypeType)
 :qid |funType:ConditionalFrame|
 :pattern ( (ConditionalFrame arg0@@29 arg1@@13))
)) (= (type EmptyFrame) FrameTypeType)))
(assert (forall ((p@@0 Real) (f_6 T@U) ) (!  (=> (= (type f_6) FrameTypeType) (= (ConditionalFrame p@@0 f_6) (ite (> p@@0 0.0) f_6 EmptyFrame)))
 :qid |stdinbpl.158:15|
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
(assert (forall ((x@@16 T@U) (i@@7 Int) ) (!  (=> (= (type x@@16) RefType) (= (getPredWandId (LL x@@16 i@@7)) 0))
 :qid |stdinbpl.201:15|
 :skolemid |24|
 :pattern ( (LL x@@16 i@@7))
)))
(assert (forall ((x@@17 T@U) (i@@8 Int) ) (!  (=> (= (type x@@17) RefType) (= (getPredWandId (LL2 x@@17 i@@8)) 1))
 :qid |stdinbpl.778:15|
 :skolemid |48|
 :pattern ( (LL2 x@@17 i@@8))
)))
(assert (forall ((Heap@@7 T@U) (ExhaleHeap@@4 T@U) (Mask@@6 T@U) (pm_f@@1 T@U) ) (! (let ((C@@1 (FieldTypeInv0 (type pm_f@@1))))
 (=> (and (and (and (and (and (= (type Heap@@7) (MapType0Type RefType)) (= (type ExhaleHeap@@4) (MapType0Type RefType))) (= (type Mask@@6) (MapType1Type RefType realType))) (= (type pm_f@@1) (FieldType C@@1 FrameTypeType))) (IdenticalOnKnownLocations Heap@@7 ExhaleHeap@@4 Mask@@6)) (and (HasDirectPerm Mask@@6 null pm_f@@1) (IsPredicateField pm_f@@1))) (forall ((o2 T@U) (f_2@@0 T@U) ) (! (let ((B@@5 (FieldTypeInv1 (type f_2@@0))))
(let ((A@@6 (FieldTypeInv0 (type f_2@@0))))
 (=> (and (and (= (type o2) RefType) (= (type f_2@@0) (FieldType A@@6 B@@5))) (U_2_bool (MapType1Select (MapType0Select Heap@@7 null (PredicateMaskField pm_f@@1)) o2 f_2@@0))) (= (MapType0Select Heap@@7 o2 f_2@@0) (MapType0Select ExhaleHeap@@4 o2 f_2@@0)))))
 :qid |stdinbpl.54:134|
 :skolemid |3|
 :pattern ( (MapType0Select ExhaleHeap@@4 o2 f_2@@0))
))))
 :qid |stdinbpl.52:19|
 :skolemid |4|
 :pattern ( (IdenticalOnKnownLocations Heap@@7 ExhaleHeap@@4 Mask@@6) (IsPredicateField pm_f@@1))
)))
(assert (forall ((Heap@@8 T@U) (ExhaleHeap@@5 T@U) (Mask@@7 T@U) (pm_f@@2 T@U) ) (! (let ((C@@2 (FieldTypeInv0 (type pm_f@@2))))
 (=> (and (and (and (and (and (= (type Heap@@8) (MapType0Type RefType)) (= (type ExhaleHeap@@5) (MapType0Type RefType))) (= (type Mask@@7) (MapType1Type RefType realType))) (= (type pm_f@@2) (FieldType C@@2 FrameTypeType))) (IdenticalOnKnownLocations Heap@@8 ExhaleHeap@@5 Mask@@7)) (and (HasDirectPerm Mask@@7 null pm_f@@2) (IsWandField pm_f@@2))) (forall ((o2@@0 T@U) (f_2@@1 T@U) ) (! (let ((B@@6 (FieldTypeInv1 (type f_2@@1))))
(let ((A@@7 (FieldTypeInv0 (type f_2@@1))))
 (=> (and (and (= (type o2@@0) RefType) (= (type f_2@@1) (FieldType A@@7 B@@6))) (U_2_bool (MapType1Select (MapType0Select Heap@@8 null (WandMaskField pm_f@@2)) o2@@0 f_2@@1))) (= (MapType0Select Heap@@8 o2@@0 f_2@@1) (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1)))))
 :qid |stdinbpl.67:129|
 :skolemid |6|
 :pattern ( (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1))
))))
 :qid |stdinbpl.65:19|
 :skolemid |7|
 :pattern ( (IdenticalOnKnownLocations Heap@@8 ExhaleHeap@@5 Mask@@7) (IsWandField pm_f@@2))
)))
(assert (forall ((Mask@@8 T@U) (o_2@@2 T@U) (f_4@@2 T@U) ) (! (let ((B@@7 (FieldTypeInv1 (type f_4@@2))))
(let ((A@@8 (FieldTypeInv0 (type f_4@@2))))
 (=> (and (and (and (= (type Mask@@8) (MapType1Type RefType realType)) (= (type o_2@@2) RefType)) (= (type f_4@@2) (FieldType A@@8 B@@7))) (GoodMask Mask@@8)) (and (>= (U_2_real (MapType1Select Mask@@8 o_2@@2 f_4@@2)) NoPerm) (=> (and (and (GoodMask Mask@@8) (not (IsPredicateField f_4@@2))) (not (IsWandField f_4@@2))) (<= (U_2_real (MapType1Select Mask@@8 o_2@@2 f_4@@2)) FullPerm))))))
 :qid |stdinbpl.128:22|
 :skolemid |16|
 :pattern ( (GoodMask Mask@@8) (MapType1Select Mask@@8 o_2@@2 f_4@@2))
)))
(assert (forall ((o T@U) (f T@U) (Heap@@9 T@U) ) (!  (=> (and (and (and (= (type o) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap@@9) (MapType0Type RefType))) (U_2_bool (MapType0Select Heap@@9 o $allocated))) (U_2_bool (MapType0Select Heap@@9 (MapType0Select Heap@@9 o f) $allocated)))
 :qid |stdinbpl.31:15|
 :skolemid |0|
 :pattern ( (MapType0Select Heap@@9 o f))
)))
(assert (forall ((x@@18 T@U) (i@@9 Int) ) (!  (=> (= (type x@@18) RefType) (= (PredicateMaskField (LL x@@18 i@@9)) (|LL#sm| x@@18 i@@9)))
 :qid |stdinbpl.193:15|
 :skolemid |22|
 :pattern ( (PredicateMaskField (LL x@@18 i@@9)))
)))
(assert (forall ((x@@19 T@U) (i@@10 Int) ) (!  (=> (= (type x@@19) RefType) (= (PredicateMaskField (LL2 x@@19 i@@10)) (|LL2#sm| x@@19 i@@10)))
 :qid |stdinbpl.770:15|
 :skolemid |46|
 :pattern ( (PredicateMaskField (LL2 x@@19 i@@10)))
)))
(assert (forall ((Heap@@10 T@U) (o@@0 T@U) (f_3 T@U) (v T@U) ) (! (let ((B@@8 (type v)))
(let ((A@@9 (FieldTypeInv0 (type f_3))))
 (=> (and (and (= (type Heap@@10) (MapType0Type RefType)) (= (type o@@0) RefType)) (= (type f_3) (FieldType A@@9 B@@8))) (succHeap Heap@@10 (MapType0Store Heap@@10 o@@0 f_3 v)))))
 :qid |stdinbpl.78:22|
 :skolemid |9|
 :pattern ( (MapType0Store Heap@@10 o@@0 f_3 v))
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
 :qid |stdinbpl.165:25|
 :skolemid |20|
 :pattern ( (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun UnfoldingMask@10 () T@U)
(declare-fun Mask@3 () T@U)
(declare-fun Heap@3 () T@U)
(declare-fun x@@20 () T@U)
(declare-fun i@@11 () Int)
(declare-fun perm@10 () Real)
(declare-fun UnfoldingMask@11 () T@U)
(declare-fun UnfoldingMask@12 () T@U)
(declare-fun perm@11 () Real)
(declare-fun UnfoldingMask@13 () T@U)
(declare-fun UnfoldingMask@14 () T@U)
(declare-fun CombineFrames (T@U T@U) T@U)
(declare-fun FrameFragment (T@U) T@U)
(declare-fun Unfolding1Mask@10 () T@U)
(declare-fun perm@12 () Real)
(declare-fun Unfolding1Mask@11 () T@U)
(declare-fun Unfolding1Mask@12 () T@U)
(declare-fun perm@13 () Real)
(declare-fun Unfolding1Mask@13 () T@U)
(declare-fun Unfolding1Mask@14 () T@U)
(declare-fun Unfolding1Heap@16 () T@U)
(declare-fun Unfolding1Heap@17 () T@U)
(declare-fun Unfolding1Heap@18 () T@U)
(declare-fun newPMask@9 () T@U)
(declare-fun Unfolding1Heap@19 () T@U)
(declare-fun Unfolding1Heap@20 () T@U)
(declare-fun Unfolding1Heap@21 () T@U)
(declare-fun Unfolding1Heap@22 () T@U)
(declare-fun newPMask@10 () T@U)
(declare-fun Unfolding1Heap@23 () T@U)
(declare-fun UnfoldingHeap@16 () T@U)
(declare-fun UnfoldingHeap@17 () T@U)
(declare-fun UnfoldingHeap@18 () T@U)
(declare-fun newPMask@11 () T@U)
(declare-fun UnfoldingHeap@19 () T@U)
(declare-fun Unfolding1Mask@15 () T@U)
(declare-fun perm@14 () Real)
(declare-fun Unfolding1Mask@16 () T@U)
(declare-fun Unfolding1Mask@17 () T@U)
(declare-fun perm@15 () Real)
(declare-fun Unfolding1Mask@18 () T@U)
(declare-fun Unfolding1Mask@19 () T@U)
(declare-fun Unfolding1Heap@24 () T@U)
(declare-fun Unfolding1Heap@25 () T@U)
(declare-fun Unfolding1Heap@26 () T@U)
(declare-fun newPMask@12 () T@U)
(declare-fun Unfolding1Heap@27 () T@U)
(declare-fun Unfolding1Heap@28 () T@U)
(declare-fun Unfolding1Heap@29 () T@U)
(declare-fun Unfolding1Heap@30 () T@U)
(declare-fun newPMask@13 () T@U)
(declare-fun Unfolding1Heap@31 () T@U)
(declare-fun UnfoldingHeap@20 () T@U)
(declare-fun UnfoldingHeap@21 () T@U)
(declare-fun UnfoldingHeap@22 () T@U)
(declare-fun newPMask@14 () T@U)
(declare-fun UnfoldingHeap@23 () T@U)
(declare-fun UnfoldingMask@0 () T@U)
(declare-fun Heap@@11 () T@U)
(declare-fun perm@2 () Real)
(declare-fun UnfoldingMask@1 () T@U)
(declare-fun UnfoldingMask@2 () T@U)
(declare-fun perm@3 () Real)
(declare-fun UnfoldingMask@3 () T@U)
(declare-fun UnfoldingMask@4 () T@U)
(declare-fun Unfolding1Mask@0 () T@U)
(declare-fun perm@4 () Real)
(declare-fun Unfolding1Mask@1 () T@U)
(declare-fun Unfolding1Mask@2 () T@U)
(declare-fun perm@5 () Real)
(declare-fun Unfolding1Mask@3 () T@U)
(declare-fun Unfolding1Mask@4 () T@U)
(declare-fun Unfolding1Heap@0 () T@U)
(declare-fun Unfolding1Heap@1 () T@U)
(declare-fun Unfolding1Heap@2 () T@U)
(declare-fun newPMask@0 () T@U)
(declare-fun Unfolding1Heap@3 () T@U)
(declare-fun Unfolding1Heap@4 () T@U)
(declare-fun Unfolding1Heap@5 () T@U)
(declare-fun Unfolding1Heap@6 () T@U)
(declare-fun newPMask@1 () T@U)
(declare-fun Unfolding1Heap@7 () T@U)
(declare-fun UnfoldingHeap@0 () T@U)
(declare-fun UnfoldingHeap@1 () T@U)
(declare-fun UnfoldingHeap@2 () T@U)
(declare-fun newPMask@2 () T@U)
(declare-fun UnfoldingHeap@3 () T@U)
(declare-fun Unfolding1Mask@5 () T@U)
(declare-fun perm@6 () Real)
(declare-fun Unfolding1Mask@6 () T@U)
(declare-fun Unfolding1Mask@7 () T@U)
(declare-fun perm@7 () Real)
(declare-fun Unfolding1Mask@8 () T@U)
(declare-fun Unfolding1Mask@9 () T@U)
(declare-fun Unfolding1Heap@8 () T@U)
(declare-fun Unfolding1Heap@9 () T@U)
(declare-fun Unfolding1Heap@10 () T@U)
(declare-fun newPMask@3 () T@U)
(declare-fun Unfolding1Heap@11 () T@U)
(declare-fun Unfolding1Heap@12 () T@U)
(declare-fun Unfolding1Heap@13 () T@U)
(declare-fun Unfolding1Heap@14 () T@U)
(declare-fun newPMask@4 () T@U)
(declare-fun Unfolding1Heap@15 () T@U)
(declare-fun UnfoldingHeap@4 () T@U)
(declare-fun UnfoldingHeap@5 () T@U)
(declare-fun UnfoldingHeap@6 () T@U)
(declare-fun newPMask@5 () T@U)
(declare-fun UnfoldingHeap@7 () T@U)
(declare-fun Heap@0 () T@U)
(declare-fun Heap@1 () T@U)
(declare-fun Heap@2 () T@U)
(declare-fun newPMask@6 () T@U)
(declare-fun UnfoldingMask@5 () T@U)
(declare-fun perm@8 () Real)
(declare-fun UnfoldingMask@6 () T@U)
(declare-fun UnfoldingMask@7 () T@U)
(declare-fun perm@9 () Real)
(declare-fun UnfoldingMask@8 () T@U)
(declare-fun UnfoldingMask@9 () T@U)
(declare-fun UnfoldingHeap@8 () T@U)
(declare-fun UnfoldingHeap@9 () T@U)
(declare-fun UnfoldingHeap@10 () T@U)
(declare-fun newPMask@7 () T@U)
(declare-fun UnfoldingHeap@11 () T@U)
(declare-fun UnfoldingHeap@12 () T@U)
(declare-fun UnfoldingHeap@13 () T@U)
(declare-fun UnfoldingHeap@14 () T@U)
(declare-fun newPMask@8 () T@U)
(declare-fun UnfoldingHeap@15 () T@U)
(declare-fun perm@0 () Real)
(declare-fun Mask@0 () T@U)
(declare-fun Mask@1 () T@U)
(declare-fun perm@1 () Real)
(declare-fun Mask@2 () T@U)
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (= (type UnfoldingMask@10) (MapType1Type RefType realType)) (= (type Mask@3) (MapType1Type RefType realType))) (= (type Heap@3) (MapType0Type RefType))) (= (type x@@20) RefType)) (= (type UnfoldingMask@11) (MapType1Type RefType realType))) (= (type UnfoldingMask@12) (MapType1Type RefType realType))) (= (type UnfoldingMask@13) (MapType1Type RefType realType))) (= (type UnfoldingMask@14) (MapType1Type RefType realType))) (forall ((arg0@@30 T@U) (arg1@@14 T@U) ) (! (= (type (CombineFrames arg0@@30 arg1@@14)) FrameTypeType)
 :qid |funType:CombineFrames|
 :pattern ( (CombineFrames arg0@@30 arg1@@14))
))) (forall ((arg0@@31 T@U) ) (! (= (type (FrameFragment arg0@@31)) FrameTypeType)
 :qid |funType:FrameFragment|
 :pattern ( (FrameFragment arg0@@31))
))) (= (type Unfolding1Mask@10) (MapType1Type RefType realType))) (= (type Unfolding1Mask@11) (MapType1Type RefType realType))) (= (type Unfolding1Mask@12) (MapType1Type RefType realType))) (= (type Unfolding1Mask@13) (MapType1Type RefType realType))) (= (type Unfolding1Mask@14) (MapType1Type RefType realType))) (= (type Unfolding1Heap@16) (MapType0Type RefType))) (= (type Unfolding1Heap@17) (MapType0Type RefType))) (= (type Unfolding1Heap@18) (MapType0Type RefType))) (= (type newPMask@9) (MapType1Type RefType boolType))) (= (type Unfolding1Heap@19) (MapType0Type RefType))) (= (type Unfolding1Heap@20) (MapType0Type RefType))) (= (type Unfolding1Heap@21) (MapType0Type RefType))) (= (type Unfolding1Heap@22) (MapType0Type RefType))) (= (type newPMask@10) (MapType1Type RefType boolType))) (= (type Unfolding1Heap@23) (MapType0Type RefType))) (= (type UnfoldingHeap@16) (MapType0Type RefType))) (= (type UnfoldingHeap@17) (MapType0Type RefType))) (= (type UnfoldingHeap@18) (MapType0Type RefType))) (= (type newPMask@11) (MapType1Type RefType boolType))) (= (type UnfoldingHeap@19) (MapType0Type RefType))) (= (type Unfolding1Mask@15) (MapType1Type RefType realType))) (= (type Unfolding1Mask@16) (MapType1Type RefType realType))) (= (type Unfolding1Mask@17) (MapType1Type RefType realType))) (= (type Unfolding1Mask@18) (MapType1Type RefType realType))) (= (type Unfolding1Mask@19) (MapType1Type RefType realType))) (= (type Unfolding1Heap@24) (MapType0Type RefType))) (= (type Unfolding1Heap@25) (MapType0Type RefType))) (= (type Unfolding1Heap@26) (MapType0Type RefType))) (= (type newPMask@12) (MapType1Type RefType boolType))) (= (type Unfolding1Heap@27) (MapType0Type RefType))) (= (type Unfolding1Heap@28) (MapType0Type RefType))) (= (type Unfolding1Heap@29) (MapType0Type RefType))) (= (type Unfolding1Heap@30) (MapType0Type RefType))) (= (type newPMask@13) (MapType1Type RefType boolType))) (= (type Unfolding1Heap@31) (MapType0Type RefType))) (= (type UnfoldingHeap@20) (MapType0Type RefType))) (= (type UnfoldingHeap@21) (MapType0Type RefType))) (= (type UnfoldingHeap@22) (MapType0Type RefType))) (= (type newPMask@14) (MapType1Type RefType boolType))) (= (type UnfoldingHeap@23) (MapType0Type RefType))) (= (type UnfoldingMask@0) (MapType1Type RefType realType))) (= (type Heap@@11) (MapType0Type RefType))) (= (type UnfoldingMask@1) (MapType1Type RefType realType))) (= (type UnfoldingMask@2) (MapType1Type RefType realType))) (= (type UnfoldingMask@3) (MapType1Type RefType realType))) (= (type UnfoldingMask@4) (MapType1Type RefType realType))) (= (type Unfolding1Mask@0) (MapType1Type RefType realType))) (= (type Unfolding1Mask@1) (MapType1Type RefType realType))) (= (type Unfolding1Mask@2) (MapType1Type RefType realType))) (= (type Unfolding1Mask@3) (MapType1Type RefType realType))) (= (type Unfolding1Mask@4) (MapType1Type RefType realType))) (= (type Unfolding1Heap@0) (MapType0Type RefType))) (= (type Unfolding1Heap@1) (MapType0Type RefType))) (= (type Unfolding1Heap@2) (MapType0Type RefType))) (= (type newPMask@0) (MapType1Type RefType boolType))) (= (type Unfolding1Heap@3) (MapType0Type RefType))) (= (type Unfolding1Heap@4) (MapType0Type RefType))) (= (type Unfolding1Heap@5) (MapType0Type RefType))) (= (type Unfolding1Heap@6) (MapType0Type RefType))) (= (type newPMask@1) (MapType1Type RefType boolType))) (= (type Unfolding1Heap@7) (MapType0Type RefType))) (= (type UnfoldingHeap@0) (MapType0Type RefType))) (= (type UnfoldingHeap@1) (MapType0Type RefType))) (= (type UnfoldingHeap@2) (MapType0Type RefType))) (= (type newPMask@2) (MapType1Type RefType boolType))) (= (type UnfoldingHeap@3) (MapType0Type RefType))) (= (type Unfolding1Mask@5) (MapType1Type RefType realType))) (= (type Unfolding1Mask@6) (MapType1Type RefType realType))) (= (type Unfolding1Mask@7) (MapType1Type RefType realType))) (= (type Unfolding1Mask@8) (MapType1Type RefType realType))) (= (type Unfolding1Mask@9) (MapType1Type RefType realType))) (= (type Unfolding1Heap@8) (MapType0Type RefType))) (= (type Unfolding1Heap@9) (MapType0Type RefType))) (= (type Unfolding1Heap@10) (MapType0Type RefType))) (= (type newPMask@3) (MapType1Type RefType boolType))) (= (type Unfolding1Heap@11) (MapType0Type RefType))) (= (type Unfolding1Heap@12) (MapType0Type RefType))) (= (type Unfolding1Heap@13) (MapType0Type RefType))) (= (type Unfolding1Heap@14) (MapType0Type RefType))) (= (type newPMask@4) (MapType1Type RefType boolType))) (= (type Unfolding1Heap@15) (MapType0Type RefType))) (= (type UnfoldingHeap@4) (MapType0Type RefType))) (= (type UnfoldingHeap@5) (MapType0Type RefType))) (= (type UnfoldingHeap@6) (MapType0Type RefType))) (= (type newPMask@5) (MapType1Type RefType boolType))) (= (type UnfoldingHeap@7) (MapType0Type RefType))) (= (type Heap@0) (MapType0Type RefType))) (= (type Heap@1) (MapType0Type RefType))) (= (type Heap@2) (MapType0Type RefType))) (= (type newPMask@6) (MapType1Type RefType boolType))) (= (type UnfoldingMask@5) (MapType1Type RefType realType))) (= (type UnfoldingMask@6) (MapType1Type RefType realType))) (= (type UnfoldingMask@7) (MapType1Type RefType realType))) (= (type UnfoldingMask@8) (MapType1Type RefType realType))) (= (type UnfoldingMask@9) (MapType1Type RefType realType))) (= (type UnfoldingHeap@8) (MapType0Type RefType))) (= (type UnfoldingHeap@9) (MapType0Type RefType))) (= (type UnfoldingHeap@10) (MapType0Type RefType))) (= (type newPMask@7) (MapType1Type RefType boolType))) (= (type UnfoldingHeap@11) (MapType0Type RefType))) (= (type UnfoldingHeap@12) (MapType0Type RefType))) (= (type UnfoldingHeap@13) (MapType0Type RefType))) (= (type UnfoldingHeap@14) (MapType0Type RefType))) (= (type newPMask@8) (MapType1Type RefType boolType))) (= (type UnfoldingHeap@15) (MapType0Type RefType))) (= (type Mask@0) (MapType1Type RefType realType))) (= (type Mask@1) (MapType1Type RefType realType))) (= (type Mask@2) (MapType1Type RefType realType))))
(set-info :boogie-vc-id |LL#definedness|)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 23) (let ((anon4_correct  (=> (and (= UnfoldingMask@10 (MapType1Store Mask@3 null (LL (MapType0Select Heap@3 x@@20 next) (+ i@@11 1)) (real_2_U (- (U_2_real (MapType1Select Mask@3 null (LL (MapType0Select Heap@3 x@@20 next) (+ i@@11 1)))) FullPerm)))) (= perm@10 (/ (to_real 1) (to_real 2)))) (and (=> (= (ControlFlow 0 2) (- 0 4)) (>= perm@10 NoPerm)) (=> (>= perm@10 NoPerm) (=> (=> (> perm@10 NoPerm) (not (= (MapType0Select Heap@3 x@@20 next) null))) (=> (and (= UnfoldingMask@11 (MapType1Store UnfoldingMask@10 (MapType0Select Heap@3 x@@20 next) data (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@10 (MapType0Select Heap@3 x@@20 next) data)) perm@10)))) (state Heap@3 UnfoldingMask@11)) (=> (and (and (not (= (MapType0Select Heap@3 x@@20 next) null)) (= UnfoldingMask@12 (MapType1Store UnfoldingMask@11 (MapType0Select Heap@3 x@@20 next) next (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@11 (MapType0Select Heap@3 x@@20 next) next)) FullPerm))))) (and (state Heap@3 UnfoldingMask@12) (= perm@11 (/ (to_real 1) (to_real 2))))) (and (=> (= (ControlFlow 0 2) (- 0 3)) (>= perm@11 NoPerm)) (=> (>= perm@11 NoPerm) (=> (and (=> (> perm@11 NoPerm) (not (= (MapType0Select Heap@3 (MapType0Select Heap@3 x@@20 next) next) null))) (= UnfoldingMask@13 (MapType1Store UnfoldingMask@12 (MapType0Select Heap@3 (MapType0Select Heap@3 x@@20 next) next) data (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@12 (MapType0Select Heap@3 (MapType0Select Heap@3 x@@20 next) next) data)) perm@11))))) (=> (and (and (state Heap@3 UnfoldingMask@13) (= UnfoldingMask@14 (MapType1Store UnfoldingMask@13 null (LL (MapType0Select Heap@3 (MapType0Select Heap@3 x@@20 next) next) (+ (+ i@@11 1) 1)) (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@13 null (LL (MapType0Select Heap@3 (MapType0Select Heap@3 x@@20 next) next) (+ (+ i@@11 1) 1)))) FullPerm))))) (and (InsidePredicate (LL (MapType0Select Heap@3 x@@20 next) (+ i@@11 1)) (MapType0Select Heap@3 null (LL (MapType0Select Heap@3 x@@20 next) (+ i@@11 1))) (LL (MapType0Select Heap@3 (MapType0Select Heap@3 x@@20 next) next) (+ (+ i@@11 1) 1)) (MapType0Select Heap@3 null (LL (MapType0Select Heap@3 (MapType0Select Heap@3 x@@20 next) next) (+ (+ i@@11 1) 1)))) (state Heap@3 UnfoldingMask@14))) (=> (and (and (and (and (|LL#trigger| Heap@3 (LL (MapType0Select Heap@3 (MapType0Select Heap@3 x@@20 next) next) (+ (+ i@@11 1) 1))) (= (MapType0Select Heap@3 null (LL (MapType0Select Heap@3 (MapType0Select Heap@3 x@@20 next) next) (+ (+ i@@11 1) 1))) (CombineFrames (FrameFragment (MapType0Select Heap@3 (MapType0Select Heap@3 (MapType0Select Heap@3 x@@20 next) next) data)) (CombineFrames (FrameFragment (MapType0Select Heap@3 (MapType0Select Heap@3 (MapType0Select Heap@3 x@@20 next) next) next)) (CombineFrames (FrameFragment (MapType0Select Heap@3 (MapType0Select Heap@3 (MapType0Select Heap@3 (MapType0Select Heap@3 x@@20 next) next) next) data)) (MapType0Select Heap@3 null (LL (MapType0Select Heap@3 (MapType0Select Heap@3 (MapType0Select Heap@3 x@@20 next) next) next) (+ (+ (+ i@@11 1) 1) 1)))))))) (and (= Unfolding1Mask@10 (MapType1Store UnfoldingMask@14 null (LL (MapType0Select Heap@3 (MapType0Select Heap@3 x@@20 next) next) (+ (+ i@@11 1) 1)) (real_2_U (- (U_2_real (MapType1Select UnfoldingMask@14 null (LL (MapType0Select Heap@3 (MapType0Select Heap@3 x@@20 next) next) (+ (+ i@@11 1) 1)))) FullPerm)))) (= perm@12 (/ (to_real 1) (to_real 2))))) (and (and (=> (> perm@12 NoPerm) (not (= (MapType0Select Heap@3 (MapType0Select Heap@3 x@@20 next) next) null))) (= Unfolding1Mask@11 (MapType1Store Unfolding1Mask@10 (MapType0Select Heap@3 (MapType0Select Heap@3 x@@20 next) next) data (real_2_U (+ (U_2_real (MapType1Select Unfolding1Mask@10 (MapType0Select Heap@3 (MapType0Select Heap@3 x@@20 next) next) data)) perm@12))))) (and (state Heap@3 Unfolding1Mask@11) (not (= (MapType0Select Heap@3 (MapType0Select Heap@3 x@@20 next) next) null))))) (and (and (and (= Unfolding1Mask@12 (MapType1Store Unfolding1Mask@11 (MapType0Select Heap@3 (MapType0Select Heap@3 x@@20 next) next) next (real_2_U (+ (U_2_real (MapType1Select Unfolding1Mask@11 (MapType0Select Heap@3 (MapType0Select Heap@3 x@@20 next) next) next)) FullPerm)))) (state Heap@3 Unfolding1Mask@12)) (and (= perm@13 (/ (to_real 1) (to_real 2))) (=> (> perm@13 NoPerm) (not (= (MapType0Select Heap@3 (MapType0Select Heap@3 (MapType0Select Heap@3 x@@20 next) next) next) null))))) (and (and (= Unfolding1Mask@13 (MapType1Store Unfolding1Mask@12 (MapType0Select Heap@3 (MapType0Select Heap@3 (MapType0Select Heap@3 x@@20 next) next) next) data (real_2_U (+ (U_2_real (MapType1Select Unfolding1Mask@12 (MapType0Select Heap@3 (MapType0Select Heap@3 (MapType0Select Heap@3 x@@20 next) next) next) data)) perm@13)))) (state Heap@3 Unfolding1Mask@13)) (and (= Unfolding1Mask@14 (MapType1Store Unfolding1Mask@13 null (LL (MapType0Select Heap@3 (MapType0Select Heap@3 (MapType0Select Heap@3 x@@20 next) next) next) (+ (+ (+ i@@11 1) 1) 1)) (real_2_U (+ (U_2_real (MapType1Select Unfolding1Mask@13 null (LL (MapType0Select Heap@3 (MapType0Select Heap@3 (MapType0Select Heap@3 x@@20 next) next) next) (+ (+ (+ i@@11 1) 1) 1)))) FullPerm)))) (InsidePredicate (LL (MapType0Select Heap@3 (MapType0Select Heap@3 x@@20 next) next) (+ (+ i@@11 1) 1)) (MapType0Select Heap@3 null (LL (MapType0Select Heap@3 (MapType0Select Heap@3 x@@20 next) next) (+ (+ i@@11 1) 1))) (LL (MapType0Select Heap@3 (MapType0Select Heap@3 (MapType0Select Heap@3 x@@20 next) next) next) (+ (+ (+ i@@11 1) 1) 1)) (MapType0Select Heap@3 null (LL (MapType0Select Heap@3 (MapType0Select Heap@3 (MapType0Select Heap@3 x@@20 next) next) next) (+ (+ (+ i@@11 1) 1) 1)))))))) (=> (and (and (and (and (and (and (state Heap@3 Unfolding1Mask@14) (= (U_2_int (MapType0Select Heap@3 (MapType0Select Heap@3 (MapType0Select Heap@3 (MapType0Select Heap@3 x@@20 next) next) next) data)) (+ (+ (+ i@@11 1) 1) 1))) (and (= Unfolding1Heap@16 (MapType0Store Heap@3 null (|LL#sm| (MapType0Select Heap@3 (MapType0Select Heap@3 (MapType0Select Heap@3 x@@20 next) next) next) (+ (+ (+ i@@11 1) 1) 1)) (MapType1Store (MapType0Select Heap@3 null (|LL#sm| (MapType0Select Heap@3 (MapType0Select Heap@3 (MapType0Select Heap@3 x@@20 next) next) next) (+ (+ (+ i@@11 1) 1) 1))) (MapType0Select Heap@3 (MapType0Select Heap@3 (MapType0Select Heap@3 x@@20 next) next) next) data (bool_2_U true)))) (= Unfolding1Heap@17 (MapType0Store Unfolding1Heap@16 null (|LL#sm| (MapType0Select Unfolding1Heap@16 (MapType0Select Unfolding1Heap@16 (MapType0Select Unfolding1Heap@16 x@@20 next) next) next) (+ (+ (+ i@@11 1) 1) 1)) (MapType1Store (MapType0Select Unfolding1Heap@16 null (|LL#sm| (MapType0Select Unfolding1Heap@16 (MapType0Select Unfolding1Heap@16 (MapType0Select Unfolding1Heap@16 x@@20 next) next) next) (+ (+ (+ i@@11 1) 1) 1))) (MapType0Select Unfolding1Heap@16 (MapType0Select Unfolding1Heap@16 (MapType0Select Unfolding1Heap@16 x@@20 next) next) next) next (bool_2_U true)))))) (and (and (= Unfolding1Heap@18 (MapType0Store Unfolding1Heap@17 null (|LL#sm| (MapType0Select Unfolding1Heap@17 (MapType0Select Unfolding1Heap@17 (MapType0Select Unfolding1Heap@17 x@@20 next) next) next) (+ (+ (+ i@@11 1) 1) 1)) (MapType1Store (MapType0Select Unfolding1Heap@17 null (|LL#sm| (MapType0Select Unfolding1Heap@17 (MapType0Select Unfolding1Heap@17 (MapType0Select Unfolding1Heap@17 x@@20 next) next) next) (+ (+ (+ i@@11 1) 1) 1))) (MapType0Select Unfolding1Heap@17 (MapType0Select Unfolding1Heap@17 (MapType0Select Unfolding1Heap@17 (MapType0Select Unfolding1Heap@17 x@@20 next) next) next) next) data (bool_2_U true)))) (forall ((o_12 T@U) (f_16 T@U) ) (! (let ((B@@11 (FieldTypeInv1 (type f_16))))
(let ((A@@12 (FieldTypeInv0 (type f_16))))
 (=> (and (and (= (type o_12) RefType) (= (type f_16) (FieldType A@@12 B@@11))) (or (U_2_bool (MapType1Select (MapType0Select Unfolding1Heap@18 null (|LL#sm| (MapType0Select Unfolding1Heap@18 (MapType0Select Unfolding1Heap@18 (MapType0Select Unfolding1Heap@18 x@@20 next) next) next) (+ (+ (+ i@@11 1) 1) 1))) o_12 f_16)) (U_2_bool (MapType1Select (MapType0Select Unfolding1Heap@18 null (|LL#sm| (MapType0Select Unfolding1Heap@18 (MapType0Select Unfolding1Heap@18 (MapType0Select Unfolding1Heap@18 (MapType0Select Unfolding1Heap@18 x@@20 next) next) next) next) (+ (+ (+ (+ i@@11 1) 1) 1) 1))) o_12 f_16)))) (U_2_bool (MapType1Select newPMask@9 o_12 f_16)))))
 :qid |stdinbpl.589:33|
 :skolemid |37|
 :pattern ( (MapType1Select newPMask@9 o_12 f_16))
))) (and (= Unfolding1Heap@19 (MapType0Store Unfolding1Heap@18 null (|LL#sm| (MapType0Select Unfolding1Heap@18 (MapType0Select Unfolding1Heap@18 (MapType0Select Unfolding1Heap@18 x@@20 next) next) next) (+ (+ (+ i@@11 1) 1) 1)) newPMask@9)) (state Unfolding1Heap@19 Unfolding1Mask@14)))) (and (and (and (= (U_2_int (MapType0Select Unfolding1Heap@19 (MapType0Select Unfolding1Heap@19 (MapType0Select Unfolding1Heap@19 x@@20 next) next) data)) (+ (+ i@@11 1) 1)) (= Unfolding1Heap@20 (MapType0Store Unfolding1Heap@19 null (|LL#sm| (MapType0Select Unfolding1Heap@19 (MapType0Select Unfolding1Heap@19 (MapType0Select Unfolding1Heap@19 x@@20 next) next) next) (+ (+ (+ i@@11 1) 1) 1)) (MapType1Store (MapType0Select Unfolding1Heap@19 null (|LL#sm| (MapType0Select Unfolding1Heap@19 (MapType0Select Unfolding1Heap@19 (MapType0Select Unfolding1Heap@19 x@@20 next) next) next) (+ (+ (+ i@@11 1) 1) 1))) (MapType0Select Unfolding1Heap@19 (MapType0Select Unfolding1Heap@19 (MapType0Select Unfolding1Heap@19 x@@20 next) next) next) data (bool_2_U true))))) (and (= Unfolding1Heap@21 (MapType0Store Unfolding1Heap@20 null (|LL#sm| (MapType0Select Unfolding1Heap@20 (MapType0Select Unfolding1Heap@20 (MapType0Select Unfolding1Heap@20 x@@20 next) next) next) (+ (+ (+ i@@11 1) 1) 1)) (MapType1Store (MapType0Select Unfolding1Heap@20 null (|LL#sm| (MapType0Select Unfolding1Heap@20 (MapType0Select Unfolding1Heap@20 (MapType0Select Unfolding1Heap@20 x@@20 next) next) next) (+ (+ (+ i@@11 1) 1) 1))) (MapType0Select Unfolding1Heap@20 (MapType0Select Unfolding1Heap@20 (MapType0Select Unfolding1Heap@20 x@@20 next) next) next) next (bool_2_U true)))) (= Unfolding1Heap@22 (MapType0Store Unfolding1Heap@21 null (|LL#sm| (MapType0Select Unfolding1Heap@21 (MapType0Select Unfolding1Heap@21 (MapType0Select Unfolding1Heap@21 x@@20 next) next) next) (+ (+ (+ i@@11 1) 1) 1)) (MapType1Store (MapType0Select Unfolding1Heap@21 null (|LL#sm| (MapType0Select Unfolding1Heap@21 (MapType0Select Unfolding1Heap@21 (MapType0Select Unfolding1Heap@21 x@@20 next) next) next) (+ (+ (+ i@@11 1) 1) 1))) (MapType0Select Unfolding1Heap@21 (MapType0Select Unfolding1Heap@21 (MapType0Select Unfolding1Heap@21 (MapType0Select Unfolding1Heap@21 x@@20 next) next) next) next) data (bool_2_U true)))))) (and (and (forall ((o_13 T@U) (f_17 T@U) ) (! (let ((B@@12 (FieldTypeInv1 (type f_17))))
(let ((A@@13 (FieldTypeInv0 (type f_17))))
 (=> (and (and (= (type o_13) RefType) (= (type f_17) (FieldType A@@13 B@@12))) (or (U_2_bool (MapType1Select (MapType0Select Unfolding1Heap@22 null (|LL#sm| (MapType0Select Unfolding1Heap@22 (MapType0Select Unfolding1Heap@22 (MapType0Select Unfolding1Heap@22 x@@20 next) next) next) (+ (+ (+ i@@11 1) 1) 1))) o_13 f_17)) (U_2_bool (MapType1Select (MapType0Select Unfolding1Heap@22 null (|LL#sm| (MapType0Select Unfolding1Heap@22 (MapType0Select Unfolding1Heap@22 (MapType0Select Unfolding1Heap@22 (MapType0Select Unfolding1Heap@22 x@@20 next) next) next) next) (+ (+ (+ (+ i@@11 1) 1) 1) 1))) o_13 f_17)))) (U_2_bool (MapType1Select newPMask@10 o_13 f_17)))))
 :qid |stdinbpl.602:33|
 :skolemid |38|
 :pattern ( (MapType1Select newPMask@10 o_13 f_17))
)) (= Unfolding1Heap@23 (MapType0Store Unfolding1Heap@22 null (|LL#sm| (MapType0Select Unfolding1Heap@22 (MapType0Select Unfolding1Heap@22 (MapType0Select Unfolding1Heap@22 x@@20 next) next) next) (+ (+ (+ i@@11 1) 1) 1)) newPMask@10))) (and (state Unfolding1Heap@23 Unfolding1Mask@14) (state Unfolding1Heap@23 Unfolding1Mask@14))))) (and (and (and (and (= (U_2_int (MapType0Select Heap@3 (MapType0Select Heap@3 (MapType0Select Heap@3 x@@20 next) next) data)) (+ (+ i@@11 1) 1)) (= UnfoldingHeap@16 (MapType0Store Heap@3 null (|LL#sm| (MapType0Select Heap@3 (MapType0Select Heap@3 x@@20 next) next) (+ (+ i@@11 1) 1)) (MapType1Store (MapType0Select Heap@3 null (|LL#sm| (MapType0Select Heap@3 (MapType0Select Heap@3 x@@20 next) next) (+ (+ i@@11 1) 1))) (MapType0Select Heap@3 (MapType0Select Heap@3 x@@20 next) next) data (bool_2_U true))))) (and (= UnfoldingHeap@17 (MapType0Store UnfoldingHeap@16 null (|LL#sm| (MapType0Select UnfoldingHeap@16 (MapType0Select UnfoldingHeap@16 x@@20 next) next) (+ (+ i@@11 1) 1)) (MapType1Store (MapType0Select UnfoldingHeap@16 null (|LL#sm| (MapType0Select UnfoldingHeap@16 (MapType0Select UnfoldingHeap@16 x@@20 next) next) (+ (+ i@@11 1) 1))) (MapType0Select UnfoldingHeap@16 (MapType0Select UnfoldingHeap@16 x@@20 next) next) next (bool_2_U true)))) (= UnfoldingHeap@18 (MapType0Store UnfoldingHeap@17 null (|LL#sm| (MapType0Select UnfoldingHeap@17 (MapType0Select UnfoldingHeap@17 x@@20 next) next) (+ (+ i@@11 1) 1)) (MapType1Store (MapType0Select UnfoldingHeap@17 null (|LL#sm| (MapType0Select UnfoldingHeap@17 (MapType0Select UnfoldingHeap@17 x@@20 next) next) (+ (+ i@@11 1) 1))) (MapType0Select UnfoldingHeap@17 (MapType0Select UnfoldingHeap@17 (MapType0Select UnfoldingHeap@17 x@@20 next) next) next) data (bool_2_U true)))))) (and (and (forall ((o_14 T@U) (f_18 T@U) ) (! (let ((B@@13 (FieldTypeInv1 (type f_18))))
(let ((A@@14 (FieldTypeInv0 (type f_18))))
 (=> (and (and (= (type o_14) RefType) (= (type f_18) (FieldType A@@14 B@@13))) (or (U_2_bool (MapType1Select (MapType0Select UnfoldingHeap@18 null (|LL#sm| (MapType0Select UnfoldingHeap@18 (MapType0Select UnfoldingHeap@18 x@@20 next) next) (+ (+ i@@11 1) 1))) o_14 f_18)) (U_2_bool (MapType1Select (MapType0Select UnfoldingHeap@18 null (|LL#sm| (MapType0Select UnfoldingHeap@18 (MapType0Select UnfoldingHeap@18 (MapType0Select UnfoldingHeap@18 x@@20 next) next) next) (+ (+ (+ i@@11 1) 1) 1))) o_14 f_18)))) (U_2_bool (MapType1Select newPMask@11 o_14 f_18)))))
 :qid |stdinbpl.616:31|
 :skolemid |39|
 :pattern ( (MapType1Select newPMask@11 o_14 f_18))
)) (= UnfoldingHeap@19 (MapType0Store UnfoldingHeap@18 null (|LL#sm| (MapType0Select UnfoldingHeap@18 (MapType0Select UnfoldingHeap@18 x@@20 next) next) (+ (+ i@@11 1) 1)) newPMask@11))) (and (state UnfoldingHeap@19 UnfoldingMask@14) (= (U_2_int (MapType0Select UnfoldingHeap@19 (MapType0Select UnfoldingHeap@19 x@@20 next) data)) (+ i@@11 1))))) (and (and (and (|LL#trigger| UnfoldingHeap@19 (LL (MapType0Select UnfoldingHeap@19 (MapType0Select UnfoldingHeap@19 x@@20 next) next) (+ (+ i@@11 1) 1))) (= (MapType0Select UnfoldingHeap@19 null (LL (MapType0Select UnfoldingHeap@19 (MapType0Select UnfoldingHeap@19 x@@20 next) next) (+ (+ i@@11 1) 1))) (CombineFrames (FrameFragment (MapType0Select UnfoldingHeap@19 (MapType0Select UnfoldingHeap@19 (MapType0Select UnfoldingHeap@19 x@@20 next) next) data)) (CombineFrames (FrameFragment (MapType0Select UnfoldingHeap@19 (MapType0Select UnfoldingHeap@19 (MapType0Select UnfoldingHeap@19 x@@20 next) next) next)) (CombineFrames (FrameFragment (MapType0Select UnfoldingHeap@19 (MapType0Select UnfoldingHeap@19 (MapType0Select UnfoldingHeap@19 (MapType0Select UnfoldingHeap@19 x@@20 next) next) next) data)) (MapType0Select UnfoldingHeap@19 null (LL (MapType0Select UnfoldingHeap@19 (MapType0Select UnfoldingHeap@19 (MapType0Select UnfoldingHeap@19 x@@20 next) next) next) (+ (+ (+ i@@11 1) 1) 1)))))))) (and (= Unfolding1Mask@15 (MapType1Store UnfoldingMask@14 null (LL (MapType0Select UnfoldingHeap@19 (MapType0Select UnfoldingHeap@19 x@@20 next) next) (+ (+ i@@11 1) 1)) (real_2_U (- (U_2_real (MapType1Select UnfoldingMask@14 null (LL (MapType0Select UnfoldingHeap@19 (MapType0Select UnfoldingHeap@19 x@@20 next) next) (+ (+ i@@11 1) 1)))) FullPerm)))) (= perm@14 (/ (to_real 1) (to_real 2))))) (and (and (=> (> perm@14 NoPerm) (not (= (MapType0Select UnfoldingHeap@19 (MapType0Select UnfoldingHeap@19 x@@20 next) next) null))) (= Unfolding1Mask@16 (MapType1Store Unfolding1Mask@15 (MapType0Select UnfoldingHeap@19 (MapType0Select UnfoldingHeap@19 x@@20 next) next) data (real_2_U (+ (U_2_real (MapType1Select Unfolding1Mask@15 (MapType0Select UnfoldingHeap@19 (MapType0Select UnfoldingHeap@19 x@@20 next) next) data)) perm@14))))) (and (state UnfoldingHeap@19 Unfolding1Mask@16) (not (= (MapType0Select UnfoldingHeap@19 (MapType0Select UnfoldingHeap@19 x@@20 next) next) null))))))) (and (and (and (and (and (= Unfolding1Mask@17 (MapType1Store Unfolding1Mask@16 (MapType0Select UnfoldingHeap@19 (MapType0Select UnfoldingHeap@19 x@@20 next) next) next (real_2_U (+ (U_2_real (MapType1Select Unfolding1Mask@16 (MapType0Select UnfoldingHeap@19 (MapType0Select UnfoldingHeap@19 x@@20 next) next) next)) FullPerm)))) (state UnfoldingHeap@19 Unfolding1Mask@17)) (and (= perm@15 (/ (to_real 1) (to_real 2))) (=> (> perm@15 NoPerm) (not (= (MapType0Select UnfoldingHeap@19 (MapType0Select UnfoldingHeap@19 (MapType0Select UnfoldingHeap@19 x@@20 next) next) next) null))))) (and (and (= Unfolding1Mask@18 (MapType1Store Unfolding1Mask@17 (MapType0Select UnfoldingHeap@19 (MapType0Select UnfoldingHeap@19 (MapType0Select UnfoldingHeap@19 x@@20 next) next) next) data (real_2_U (+ (U_2_real (MapType1Select Unfolding1Mask@17 (MapType0Select UnfoldingHeap@19 (MapType0Select UnfoldingHeap@19 (MapType0Select UnfoldingHeap@19 x@@20 next) next) next) data)) perm@15)))) (state UnfoldingHeap@19 Unfolding1Mask@18)) (and (= Unfolding1Mask@19 (MapType1Store Unfolding1Mask@18 null (LL (MapType0Select UnfoldingHeap@19 (MapType0Select UnfoldingHeap@19 (MapType0Select UnfoldingHeap@19 x@@20 next) next) next) (+ (+ (+ i@@11 1) 1) 1)) (real_2_U (+ (U_2_real (MapType1Select Unfolding1Mask@18 null (LL (MapType0Select UnfoldingHeap@19 (MapType0Select UnfoldingHeap@19 (MapType0Select UnfoldingHeap@19 x@@20 next) next) next) (+ (+ (+ i@@11 1) 1) 1)))) FullPerm)))) (InsidePredicate (LL (MapType0Select UnfoldingHeap@19 (MapType0Select UnfoldingHeap@19 x@@20 next) next) (+ (+ i@@11 1) 1)) (MapType0Select UnfoldingHeap@19 null (LL (MapType0Select UnfoldingHeap@19 (MapType0Select UnfoldingHeap@19 x@@20 next) next) (+ (+ i@@11 1) 1))) (LL (MapType0Select UnfoldingHeap@19 (MapType0Select UnfoldingHeap@19 (MapType0Select UnfoldingHeap@19 x@@20 next) next) next) (+ (+ (+ i@@11 1) 1) 1)) (MapType0Select UnfoldingHeap@19 null (LL (MapType0Select UnfoldingHeap@19 (MapType0Select UnfoldingHeap@19 (MapType0Select UnfoldingHeap@19 x@@20 next) next) next) (+ (+ (+ i@@11 1) 1) 1))))))) (and (and (and (state UnfoldingHeap@19 Unfolding1Mask@19) (= (U_2_int (MapType0Select UnfoldingHeap@19 (MapType0Select UnfoldingHeap@19 (MapType0Select UnfoldingHeap@19 (MapType0Select UnfoldingHeap@19 x@@20 next) next) next) data)) (+ (+ (+ i@@11 1) 1) 1))) (and (= Unfolding1Heap@24 (MapType0Store UnfoldingHeap@19 null (|LL#sm| (MapType0Select UnfoldingHeap@19 (MapType0Select UnfoldingHeap@19 (MapType0Select UnfoldingHeap@19 x@@20 next) next) next) (+ (+ (+ i@@11 1) 1) 1)) (MapType1Store (MapType0Select UnfoldingHeap@19 null (|LL#sm| (MapType0Select UnfoldingHeap@19 (MapType0Select UnfoldingHeap@19 (MapType0Select UnfoldingHeap@19 x@@20 next) next) next) (+ (+ (+ i@@11 1) 1) 1))) (MapType0Select UnfoldingHeap@19 (MapType0Select UnfoldingHeap@19 (MapType0Select UnfoldingHeap@19 x@@20 next) next) next) data (bool_2_U true)))) (= Unfolding1Heap@25 (MapType0Store Unfolding1Heap@24 null (|LL#sm| (MapType0Select Unfolding1Heap@24 (MapType0Select Unfolding1Heap@24 (MapType0Select Unfolding1Heap@24 x@@20 next) next) next) (+ (+ (+ i@@11 1) 1) 1)) (MapType1Store (MapType0Select Unfolding1Heap@24 null (|LL#sm| (MapType0Select Unfolding1Heap@24 (MapType0Select Unfolding1Heap@24 (MapType0Select Unfolding1Heap@24 x@@20 next) next) next) (+ (+ (+ i@@11 1) 1) 1))) (MapType0Select Unfolding1Heap@24 (MapType0Select Unfolding1Heap@24 (MapType0Select Unfolding1Heap@24 x@@20 next) next) next) next (bool_2_U true)))))) (and (and (= Unfolding1Heap@26 (MapType0Store Unfolding1Heap@25 null (|LL#sm| (MapType0Select Unfolding1Heap@25 (MapType0Select Unfolding1Heap@25 (MapType0Select Unfolding1Heap@25 x@@20 next) next) next) (+ (+ (+ i@@11 1) 1) 1)) (MapType1Store (MapType0Select Unfolding1Heap@25 null (|LL#sm| (MapType0Select Unfolding1Heap@25 (MapType0Select Unfolding1Heap@25 (MapType0Select Unfolding1Heap@25 x@@20 next) next) next) (+ (+ (+ i@@11 1) 1) 1))) (MapType0Select Unfolding1Heap@25 (MapType0Select Unfolding1Heap@25 (MapType0Select Unfolding1Heap@25 (MapType0Select Unfolding1Heap@25 x@@20 next) next) next) next) data (bool_2_U true)))) (forall ((o_15 T@U) (f_19 T@U) ) (! (let ((B@@14 (FieldTypeInv1 (type f_19))))
(let ((A@@15 (FieldTypeInv0 (type f_19))))
 (=> (and (and (= (type o_15) RefType) (= (type f_19) (FieldType A@@15 B@@14))) (or (U_2_bool (MapType1Select (MapType0Select Unfolding1Heap@26 null (|LL#sm| (MapType0Select Unfolding1Heap@26 (MapType0Select Unfolding1Heap@26 (MapType0Select Unfolding1Heap@26 x@@20 next) next) next) (+ (+ (+ i@@11 1) 1) 1))) o_15 f_19)) (U_2_bool (MapType1Select (MapType0Select Unfolding1Heap@26 null (|LL#sm| (MapType0Select Unfolding1Heap@26 (MapType0Select Unfolding1Heap@26 (MapType0Select Unfolding1Heap@26 (MapType0Select Unfolding1Heap@26 x@@20 next) next) next) next) (+ (+ (+ (+ i@@11 1) 1) 1) 1))) o_15 f_19)))) (U_2_bool (MapType1Select newPMask@12 o_15 f_19)))))
 :qid |stdinbpl.658:33|
 :skolemid |40|
 :pattern ( (MapType1Select newPMask@12 o_15 f_19))
))) (and (= Unfolding1Heap@27 (MapType0Store Unfolding1Heap@26 null (|LL#sm| (MapType0Select Unfolding1Heap@26 (MapType0Select Unfolding1Heap@26 (MapType0Select Unfolding1Heap@26 x@@20 next) next) next) (+ (+ (+ i@@11 1) 1) 1)) newPMask@12)) (state Unfolding1Heap@27 Unfolding1Mask@19))))) (and (and (and (and (= (U_2_int (MapType0Select Unfolding1Heap@27 (MapType0Select Unfolding1Heap@27 (MapType0Select Unfolding1Heap@27 x@@20 next) next) data)) (+ (+ i@@11 1) 1)) (= Unfolding1Heap@28 (MapType0Store Unfolding1Heap@27 null (|LL#sm| (MapType0Select Unfolding1Heap@27 (MapType0Select Unfolding1Heap@27 (MapType0Select Unfolding1Heap@27 x@@20 next) next) next) (+ (+ (+ i@@11 1) 1) 1)) (MapType1Store (MapType0Select Unfolding1Heap@27 null (|LL#sm| (MapType0Select Unfolding1Heap@27 (MapType0Select Unfolding1Heap@27 (MapType0Select Unfolding1Heap@27 x@@20 next) next) next) (+ (+ (+ i@@11 1) 1) 1))) (MapType0Select Unfolding1Heap@27 (MapType0Select Unfolding1Heap@27 (MapType0Select Unfolding1Heap@27 x@@20 next) next) next) data (bool_2_U true))))) (and (= Unfolding1Heap@29 (MapType0Store Unfolding1Heap@28 null (|LL#sm| (MapType0Select Unfolding1Heap@28 (MapType0Select Unfolding1Heap@28 (MapType0Select Unfolding1Heap@28 x@@20 next) next) next) (+ (+ (+ i@@11 1) 1) 1)) (MapType1Store (MapType0Select Unfolding1Heap@28 null (|LL#sm| (MapType0Select Unfolding1Heap@28 (MapType0Select Unfolding1Heap@28 (MapType0Select Unfolding1Heap@28 x@@20 next) next) next) (+ (+ (+ i@@11 1) 1) 1))) (MapType0Select Unfolding1Heap@28 (MapType0Select Unfolding1Heap@28 (MapType0Select Unfolding1Heap@28 x@@20 next) next) next) next (bool_2_U true)))) (= Unfolding1Heap@30 (MapType0Store Unfolding1Heap@29 null (|LL#sm| (MapType0Select Unfolding1Heap@29 (MapType0Select Unfolding1Heap@29 (MapType0Select Unfolding1Heap@29 x@@20 next) next) next) (+ (+ (+ i@@11 1) 1) 1)) (MapType1Store (MapType0Select Unfolding1Heap@29 null (|LL#sm| (MapType0Select Unfolding1Heap@29 (MapType0Select Unfolding1Heap@29 (MapType0Select Unfolding1Heap@29 x@@20 next) next) next) (+ (+ (+ i@@11 1) 1) 1))) (MapType0Select Unfolding1Heap@29 (MapType0Select Unfolding1Heap@29 (MapType0Select Unfolding1Heap@29 (MapType0Select Unfolding1Heap@29 x@@20 next) next) next) next) data (bool_2_U true)))))) (and (and (forall ((o_16 T@U) (f_20 T@U) ) (! (let ((B@@15 (FieldTypeInv1 (type f_20))))
(let ((A@@16 (FieldTypeInv0 (type f_20))))
 (=> (and (and (= (type o_16) RefType) (= (type f_20) (FieldType A@@16 B@@15))) (or (U_2_bool (MapType1Select (MapType0Select Unfolding1Heap@30 null (|LL#sm| (MapType0Select Unfolding1Heap@30 (MapType0Select Unfolding1Heap@30 (MapType0Select Unfolding1Heap@30 x@@20 next) next) next) (+ (+ (+ i@@11 1) 1) 1))) o_16 f_20)) (U_2_bool (MapType1Select (MapType0Select Unfolding1Heap@30 null (|LL#sm| (MapType0Select Unfolding1Heap@30 (MapType0Select Unfolding1Heap@30 (MapType0Select Unfolding1Heap@30 (MapType0Select Unfolding1Heap@30 x@@20 next) next) next) next) (+ (+ (+ (+ i@@11 1) 1) 1) 1))) o_16 f_20)))) (U_2_bool (MapType1Select newPMask@13 o_16 f_20)))))
 :qid |stdinbpl.671:33|
 :skolemid |41|
 :pattern ( (MapType1Select newPMask@13 o_16 f_20))
)) (= Unfolding1Heap@31 (MapType0Store Unfolding1Heap@30 null (|LL#sm| (MapType0Select Unfolding1Heap@30 (MapType0Select Unfolding1Heap@30 (MapType0Select Unfolding1Heap@30 x@@20 next) next) next) (+ (+ (+ i@@11 1) 1) 1)) newPMask@13))) (and (state Unfolding1Heap@31 Unfolding1Mask@19) (state Unfolding1Heap@31 Unfolding1Mask@19)))) (and (and (and (= UnfoldingHeap@20 (MapType0Store UnfoldingHeap@19 null (|LL#sm| (MapType0Select UnfoldingHeap@19 (MapType0Select UnfoldingHeap@19 x@@20 next) next) (+ (+ i@@11 1) 1)) (MapType1Store (MapType0Select UnfoldingHeap@19 null (|LL#sm| (MapType0Select UnfoldingHeap@19 (MapType0Select UnfoldingHeap@19 x@@20 next) next) (+ (+ i@@11 1) 1))) (MapType0Select UnfoldingHeap@19 (MapType0Select UnfoldingHeap@19 x@@20 next) next) data (bool_2_U true)))) (= UnfoldingHeap@21 (MapType0Store UnfoldingHeap@20 null (|LL#sm| (MapType0Select UnfoldingHeap@20 (MapType0Select UnfoldingHeap@20 x@@20 next) next) (+ (+ i@@11 1) 1)) (MapType1Store (MapType0Select UnfoldingHeap@20 null (|LL#sm| (MapType0Select UnfoldingHeap@20 (MapType0Select UnfoldingHeap@20 x@@20 next) next) (+ (+ i@@11 1) 1))) (MapType0Select UnfoldingHeap@20 (MapType0Select UnfoldingHeap@20 x@@20 next) next) next (bool_2_U true))))) (and (= UnfoldingHeap@22 (MapType0Store UnfoldingHeap@21 null (|LL#sm| (MapType0Select UnfoldingHeap@21 (MapType0Select UnfoldingHeap@21 x@@20 next) next) (+ (+ i@@11 1) 1)) (MapType1Store (MapType0Select UnfoldingHeap@21 null (|LL#sm| (MapType0Select UnfoldingHeap@21 (MapType0Select UnfoldingHeap@21 x@@20 next) next) (+ (+ i@@11 1) 1))) (MapType0Select UnfoldingHeap@21 (MapType0Select UnfoldingHeap@21 (MapType0Select UnfoldingHeap@21 x@@20 next) next) next) data (bool_2_U true)))) (forall ((o_17 T@U) (f_21 T@U) ) (! (let ((B@@16 (FieldTypeInv1 (type f_21))))
(let ((A@@17 (FieldTypeInv0 (type f_21))))
 (=> (and (and (= (type o_17) RefType) (= (type f_21) (FieldType A@@17 B@@16))) (or (U_2_bool (MapType1Select (MapType0Select UnfoldingHeap@22 null (|LL#sm| (MapType0Select UnfoldingHeap@22 (MapType0Select UnfoldingHeap@22 x@@20 next) next) (+ (+ i@@11 1) 1))) o_17 f_21)) (U_2_bool (MapType1Select (MapType0Select UnfoldingHeap@22 null (|LL#sm| (MapType0Select UnfoldingHeap@22 (MapType0Select UnfoldingHeap@22 (MapType0Select UnfoldingHeap@22 x@@20 next) next) next) (+ (+ (+ i@@11 1) 1) 1))) o_17 f_21)))) (U_2_bool (MapType1Select newPMask@14 o_17 f_21)))))
 :qid |stdinbpl.684:31|
 :skolemid |42|
 :pattern ( (MapType1Select newPMask@14 o_17 f_21))
)))) (and (and (= UnfoldingHeap@23 (MapType0Store UnfoldingHeap@22 null (|LL#sm| (MapType0Select UnfoldingHeap@22 (MapType0Select UnfoldingHeap@22 x@@20 next) next) (+ (+ i@@11 1) 1)) newPMask@14)) (state UnfoldingHeap@23 UnfoldingMask@14)) (and (state UnfoldingHeap@23 UnfoldingMask@14) (= (ControlFlow 0 2) (- 0 1)))))))) (HasDirectPerm UnfoldingMask@14 x@@20 next)))))))))))))))
(let ((anon6_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 7) 2)) anon4_correct)))
(let ((anon6_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 5) (- 0 6)) (<= FullPerm (U_2_real (MapType1Select Mask@3 null (LL (MapType0Select Heap@3 x@@20 next) (+ i@@11 1)))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@3 null (LL (MapType0Select Heap@3 x@@20 next) (+ i@@11 1))))) (=> (= (ControlFlow 0 5) 2) anon4_correct))))))
(let ((anon2_correct  (=> (and (= UnfoldingMask@0 (MapType1Store Mask@3 null (LL (MapType0Select Heap@@11 x@@20 next) (+ i@@11 1)) (real_2_U (- (U_2_real (MapType1Select Mask@3 null (LL (MapType0Select Heap@@11 x@@20 next) (+ i@@11 1)))) FullPerm)))) (= perm@2 (/ (to_real 1) (to_real 2)))) (and (=> (= (ControlFlow 0 8) (- 0 14)) (>= perm@2 NoPerm)) (=> (>= perm@2 NoPerm) (=> (=> (> perm@2 NoPerm) (not (= (MapType0Select Heap@@11 x@@20 next) null))) (=> (and (= UnfoldingMask@1 (MapType1Store UnfoldingMask@0 (MapType0Select Heap@@11 x@@20 next) data (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@0 (MapType0Select Heap@@11 x@@20 next) data)) perm@2)))) (state Heap@@11 UnfoldingMask@1)) (=> (and (and (not (= (MapType0Select Heap@@11 x@@20 next) null)) (= UnfoldingMask@2 (MapType1Store UnfoldingMask@1 (MapType0Select Heap@@11 x@@20 next) next (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@1 (MapType0Select Heap@@11 x@@20 next) next)) FullPerm))))) (and (state Heap@@11 UnfoldingMask@2) (= perm@3 (/ (to_real 1) (to_real 2))))) (and (=> (= (ControlFlow 0 8) (- 0 13)) (>= perm@3 NoPerm)) (=> (>= perm@3 NoPerm) (=> (=> (> perm@3 NoPerm) (not (= (MapType0Select Heap@@11 (MapType0Select Heap@@11 x@@20 next) next) null))) (=> (and (and (= UnfoldingMask@3 (MapType1Store UnfoldingMask@2 (MapType0Select Heap@@11 (MapType0Select Heap@@11 x@@20 next) next) data (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@2 (MapType0Select Heap@@11 (MapType0Select Heap@@11 x@@20 next) next) data)) perm@3)))) (state Heap@@11 UnfoldingMask@3)) (and (= UnfoldingMask@4 (MapType1Store UnfoldingMask@3 null (LL (MapType0Select Heap@@11 (MapType0Select Heap@@11 x@@20 next) next) (+ (+ i@@11 1) 1)) (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@3 null (LL (MapType0Select Heap@@11 (MapType0Select Heap@@11 x@@20 next) next) (+ (+ i@@11 1) 1)))) FullPerm)))) (InsidePredicate (LL (MapType0Select Heap@@11 x@@20 next) (+ i@@11 1)) (MapType0Select Heap@@11 null (LL (MapType0Select Heap@@11 x@@20 next) (+ i@@11 1))) (LL (MapType0Select Heap@@11 (MapType0Select Heap@@11 x@@20 next) next) (+ (+ i@@11 1) 1)) (MapType0Select Heap@@11 null (LL (MapType0Select Heap@@11 (MapType0Select Heap@@11 x@@20 next) next) (+ (+ i@@11 1) 1)))))) (=> (and (and (and (and (state Heap@@11 UnfoldingMask@4) (|LL#trigger| Heap@@11 (LL (MapType0Select Heap@@11 (MapType0Select Heap@@11 x@@20 next) next) (+ (+ i@@11 1) 1)))) (and (= (MapType0Select Heap@@11 null (LL (MapType0Select Heap@@11 (MapType0Select Heap@@11 x@@20 next) next) (+ (+ i@@11 1) 1))) (CombineFrames (FrameFragment (MapType0Select Heap@@11 (MapType0Select Heap@@11 (MapType0Select Heap@@11 x@@20 next) next) data)) (CombineFrames (FrameFragment (MapType0Select Heap@@11 (MapType0Select Heap@@11 (MapType0Select Heap@@11 x@@20 next) next) next)) (CombineFrames (FrameFragment (MapType0Select Heap@@11 (MapType0Select Heap@@11 (MapType0Select Heap@@11 (MapType0Select Heap@@11 x@@20 next) next) next) data)) (MapType0Select Heap@@11 null (LL (MapType0Select Heap@@11 (MapType0Select Heap@@11 (MapType0Select Heap@@11 x@@20 next) next) next) (+ (+ (+ i@@11 1) 1) 1))))))) (= Unfolding1Mask@0 (MapType1Store UnfoldingMask@4 null (LL (MapType0Select Heap@@11 (MapType0Select Heap@@11 x@@20 next) next) (+ (+ i@@11 1) 1)) (real_2_U (- (U_2_real (MapType1Select UnfoldingMask@4 null (LL (MapType0Select Heap@@11 (MapType0Select Heap@@11 x@@20 next) next) (+ (+ i@@11 1) 1)))) FullPerm)))))) (and (and (= perm@4 (/ (to_real 1) (to_real 2))) (=> (> perm@4 NoPerm) (not (= (MapType0Select Heap@@11 (MapType0Select Heap@@11 x@@20 next) next) null)))) (and (= Unfolding1Mask@1 (MapType1Store Unfolding1Mask@0 (MapType0Select Heap@@11 (MapType0Select Heap@@11 x@@20 next) next) data (real_2_U (+ (U_2_real (MapType1Select Unfolding1Mask@0 (MapType0Select Heap@@11 (MapType0Select Heap@@11 x@@20 next) next) data)) perm@4)))) (state Heap@@11 Unfolding1Mask@1)))) (and (and (and (not (= (MapType0Select Heap@@11 (MapType0Select Heap@@11 x@@20 next) next) null)) (= Unfolding1Mask@2 (MapType1Store Unfolding1Mask@1 (MapType0Select Heap@@11 (MapType0Select Heap@@11 x@@20 next) next) next (real_2_U (+ (U_2_real (MapType1Select Unfolding1Mask@1 (MapType0Select Heap@@11 (MapType0Select Heap@@11 x@@20 next) next) next)) FullPerm))))) (and (state Heap@@11 Unfolding1Mask@2) (= perm@5 (/ (to_real 1) (to_real 2))))) (and (and (=> (> perm@5 NoPerm) (not (= (MapType0Select Heap@@11 (MapType0Select Heap@@11 (MapType0Select Heap@@11 x@@20 next) next) next) null))) (= Unfolding1Mask@3 (MapType1Store Unfolding1Mask@2 (MapType0Select Heap@@11 (MapType0Select Heap@@11 (MapType0Select Heap@@11 x@@20 next) next) next) data (real_2_U (+ (U_2_real (MapType1Select Unfolding1Mask@2 (MapType0Select Heap@@11 (MapType0Select Heap@@11 (MapType0Select Heap@@11 x@@20 next) next) next) data)) perm@5))))) (and (state Heap@@11 Unfolding1Mask@3) (= Unfolding1Mask@4 (MapType1Store Unfolding1Mask@3 null (LL (MapType0Select Heap@@11 (MapType0Select Heap@@11 (MapType0Select Heap@@11 x@@20 next) next) next) (+ (+ (+ i@@11 1) 1) 1)) (real_2_U (+ (U_2_real (MapType1Select Unfolding1Mask@3 null (LL (MapType0Select Heap@@11 (MapType0Select Heap@@11 (MapType0Select Heap@@11 x@@20 next) next) next) (+ (+ (+ i@@11 1) 1) 1)))) FullPerm)))))))) (=> (and (and (and (and (and (and (InsidePredicate (LL (MapType0Select Heap@@11 (MapType0Select Heap@@11 x@@20 next) next) (+ (+ i@@11 1) 1)) (MapType0Select Heap@@11 null (LL (MapType0Select Heap@@11 (MapType0Select Heap@@11 x@@20 next) next) (+ (+ i@@11 1) 1))) (LL (MapType0Select Heap@@11 (MapType0Select Heap@@11 (MapType0Select Heap@@11 x@@20 next) next) next) (+ (+ (+ i@@11 1) 1) 1)) (MapType0Select Heap@@11 null (LL (MapType0Select Heap@@11 (MapType0Select Heap@@11 (MapType0Select Heap@@11 x@@20 next) next) next) (+ (+ (+ i@@11 1) 1) 1)))) (state Heap@@11 Unfolding1Mask@4)) (and (= (U_2_int (MapType0Select Heap@@11 (MapType0Select Heap@@11 (MapType0Select Heap@@11 (MapType0Select Heap@@11 x@@20 next) next) next) data)) (+ (+ (+ i@@11 1) 1) 1)) (= Unfolding1Heap@0 (MapType0Store Heap@@11 null (|LL#sm| (MapType0Select Heap@@11 (MapType0Select Heap@@11 (MapType0Select Heap@@11 x@@20 next) next) next) (+ (+ (+ i@@11 1) 1) 1)) (MapType1Store (MapType0Select Heap@@11 null (|LL#sm| (MapType0Select Heap@@11 (MapType0Select Heap@@11 (MapType0Select Heap@@11 x@@20 next) next) next) (+ (+ (+ i@@11 1) 1) 1))) (MapType0Select Heap@@11 (MapType0Select Heap@@11 (MapType0Select Heap@@11 x@@20 next) next) next) data (bool_2_U true)))))) (and (and (= Unfolding1Heap@1 (MapType0Store Unfolding1Heap@0 null (|LL#sm| (MapType0Select Unfolding1Heap@0 (MapType0Select Unfolding1Heap@0 (MapType0Select Unfolding1Heap@0 x@@20 next) next) next) (+ (+ (+ i@@11 1) 1) 1)) (MapType1Store (MapType0Select Unfolding1Heap@0 null (|LL#sm| (MapType0Select Unfolding1Heap@0 (MapType0Select Unfolding1Heap@0 (MapType0Select Unfolding1Heap@0 x@@20 next) next) next) (+ (+ (+ i@@11 1) 1) 1))) (MapType0Select Unfolding1Heap@0 (MapType0Select Unfolding1Heap@0 (MapType0Select Unfolding1Heap@0 x@@20 next) next) next) next (bool_2_U true)))) (= Unfolding1Heap@2 (MapType0Store Unfolding1Heap@1 null (|LL#sm| (MapType0Select Unfolding1Heap@1 (MapType0Select Unfolding1Heap@1 (MapType0Select Unfolding1Heap@1 x@@20 next) next) next) (+ (+ (+ i@@11 1) 1) 1)) (MapType1Store (MapType0Select Unfolding1Heap@1 null (|LL#sm| (MapType0Select Unfolding1Heap@1 (MapType0Select Unfolding1Heap@1 (MapType0Select Unfolding1Heap@1 x@@20 next) next) next) (+ (+ (+ i@@11 1) 1) 1))) (MapType0Select Unfolding1Heap@1 (MapType0Select Unfolding1Heap@1 (MapType0Select Unfolding1Heap@1 (MapType0Select Unfolding1Heap@1 x@@20 next) next) next) next) data (bool_2_U true))))) (and (forall ((o_3 T@U) (f_7 T@U) ) (! (let ((B@@17 (FieldTypeInv1 (type f_7))))
(let ((A@@18 (FieldTypeInv0 (type f_7))))
 (=> (and (and (= (type o_3) RefType) (= (type f_7) (FieldType A@@18 B@@17))) (or (U_2_bool (MapType1Select (MapType0Select Unfolding1Heap@2 null (|LL#sm| (MapType0Select Unfolding1Heap@2 (MapType0Select Unfolding1Heap@2 (MapType0Select Unfolding1Heap@2 x@@20 next) next) next) (+ (+ (+ i@@11 1) 1) 1))) o_3 f_7)) (U_2_bool (MapType1Select (MapType0Select Unfolding1Heap@2 null (|LL#sm| (MapType0Select Unfolding1Heap@2 (MapType0Select Unfolding1Heap@2 (MapType0Select Unfolding1Heap@2 (MapType0Select Unfolding1Heap@2 x@@20 next) next) next) next) (+ (+ (+ (+ i@@11 1) 1) 1) 1))) o_3 f_7)))) (U_2_bool (MapType1Select newPMask@0 o_3 f_7)))))
 :qid |stdinbpl.337:33|
 :skolemid |28|
 :pattern ( (MapType1Select newPMask@0 o_3 f_7))
)) (= Unfolding1Heap@3 (MapType0Store Unfolding1Heap@2 null (|LL#sm| (MapType0Select Unfolding1Heap@2 (MapType0Select Unfolding1Heap@2 (MapType0Select Unfolding1Heap@2 x@@20 next) next) next) (+ (+ (+ i@@11 1) 1) 1)) newPMask@0))))) (and (and (and (state Unfolding1Heap@3 Unfolding1Mask@4) (= (U_2_int (MapType0Select Unfolding1Heap@3 (MapType0Select Unfolding1Heap@3 (MapType0Select Unfolding1Heap@3 x@@20 next) next) data)) (+ (+ i@@11 1) 1))) (and (= Unfolding1Heap@4 (MapType0Store Unfolding1Heap@3 null (|LL#sm| (MapType0Select Unfolding1Heap@3 (MapType0Select Unfolding1Heap@3 (MapType0Select Unfolding1Heap@3 x@@20 next) next) next) (+ (+ (+ i@@11 1) 1) 1)) (MapType1Store (MapType0Select Unfolding1Heap@3 null (|LL#sm| (MapType0Select Unfolding1Heap@3 (MapType0Select Unfolding1Heap@3 (MapType0Select Unfolding1Heap@3 x@@20 next) next) next) (+ (+ (+ i@@11 1) 1) 1))) (MapType0Select Unfolding1Heap@3 (MapType0Select Unfolding1Heap@3 (MapType0Select Unfolding1Heap@3 x@@20 next) next) next) data (bool_2_U true)))) (= Unfolding1Heap@5 (MapType0Store Unfolding1Heap@4 null (|LL#sm| (MapType0Select Unfolding1Heap@4 (MapType0Select Unfolding1Heap@4 (MapType0Select Unfolding1Heap@4 x@@20 next) next) next) (+ (+ (+ i@@11 1) 1) 1)) (MapType1Store (MapType0Select Unfolding1Heap@4 null (|LL#sm| (MapType0Select Unfolding1Heap@4 (MapType0Select Unfolding1Heap@4 (MapType0Select Unfolding1Heap@4 x@@20 next) next) next) (+ (+ (+ i@@11 1) 1) 1))) (MapType0Select Unfolding1Heap@4 (MapType0Select Unfolding1Heap@4 (MapType0Select Unfolding1Heap@4 x@@20 next) next) next) next (bool_2_U true)))))) (and (and (= Unfolding1Heap@6 (MapType0Store Unfolding1Heap@5 null (|LL#sm| (MapType0Select Unfolding1Heap@5 (MapType0Select Unfolding1Heap@5 (MapType0Select Unfolding1Heap@5 x@@20 next) next) next) (+ (+ (+ i@@11 1) 1) 1)) (MapType1Store (MapType0Select Unfolding1Heap@5 null (|LL#sm| (MapType0Select Unfolding1Heap@5 (MapType0Select Unfolding1Heap@5 (MapType0Select Unfolding1Heap@5 x@@20 next) next) next) (+ (+ (+ i@@11 1) 1) 1))) (MapType0Select Unfolding1Heap@5 (MapType0Select Unfolding1Heap@5 (MapType0Select Unfolding1Heap@5 (MapType0Select Unfolding1Heap@5 x@@20 next) next) next) next) data (bool_2_U true)))) (forall ((o_4 T@U) (f_8 T@U) ) (! (let ((B@@18 (FieldTypeInv1 (type f_8))))
(let ((A@@19 (FieldTypeInv0 (type f_8))))
 (=> (and (and (= (type o_4) RefType) (= (type f_8) (FieldType A@@19 B@@18))) (or (U_2_bool (MapType1Select (MapType0Select Unfolding1Heap@6 null (|LL#sm| (MapType0Select Unfolding1Heap@6 (MapType0Select Unfolding1Heap@6 (MapType0Select Unfolding1Heap@6 x@@20 next) next) next) (+ (+ (+ i@@11 1) 1) 1))) o_4 f_8)) (U_2_bool (MapType1Select (MapType0Select Unfolding1Heap@6 null (|LL#sm| (MapType0Select Unfolding1Heap@6 (MapType0Select Unfolding1Heap@6 (MapType0Select Unfolding1Heap@6 (MapType0Select Unfolding1Heap@6 x@@20 next) next) next) next) (+ (+ (+ (+ i@@11 1) 1) 1) 1))) o_4 f_8)))) (U_2_bool (MapType1Select newPMask@1 o_4 f_8)))))
 :qid |stdinbpl.350:33|
 :skolemid |29|
 :pattern ( (MapType1Select newPMask@1 o_4 f_8))
))) (and (= Unfolding1Heap@7 (MapType0Store Unfolding1Heap@6 null (|LL#sm| (MapType0Select Unfolding1Heap@6 (MapType0Select Unfolding1Heap@6 (MapType0Select Unfolding1Heap@6 x@@20 next) next) next) (+ (+ (+ i@@11 1) 1) 1)) newPMask@1)) (state Unfolding1Heap@7 Unfolding1Mask@4))))) (and (and (and (and (state Unfolding1Heap@7 Unfolding1Mask@4) (= (U_2_int (MapType0Select Heap@@11 (MapType0Select Heap@@11 (MapType0Select Heap@@11 x@@20 next) next) data)) (+ (+ i@@11 1) 1))) (and (= UnfoldingHeap@0 (MapType0Store Heap@@11 null (|LL#sm| (MapType0Select Heap@@11 (MapType0Select Heap@@11 x@@20 next) next) (+ (+ i@@11 1) 1)) (MapType1Store (MapType0Select Heap@@11 null (|LL#sm| (MapType0Select Heap@@11 (MapType0Select Heap@@11 x@@20 next) next) (+ (+ i@@11 1) 1))) (MapType0Select Heap@@11 (MapType0Select Heap@@11 x@@20 next) next) data (bool_2_U true)))) (= UnfoldingHeap@1 (MapType0Store UnfoldingHeap@0 null (|LL#sm| (MapType0Select UnfoldingHeap@0 (MapType0Select UnfoldingHeap@0 x@@20 next) next) (+ (+ i@@11 1) 1)) (MapType1Store (MapType0Select UnfoldingHeap@0 null (|LL#sm| (MapType0Select UnfoldingHeap@0 (MapType0Select UnfoldingHeap@0 x@@20 next) next) (+ (+ i@@11 1) 1))) (MapType0Select UnfoldingHeap@0 (MapType0Select UnfoldingHeap@0 x@@20 next) next) next (bool_2_U true)))))) (and (and (= UnfoldingHeap@2 (MapType0Store UnfoldingHeap@1 null (|LL#sm| (MapType0Select UnfoldingHeap@1 (MapType0Select UnfoldingHeap@1 x@@20 next) next) (+ (+ i@@11 1) 1)) (MapType1Store (MapType0Select UnfoldingHeap@1 null (|LL#sm| (MapType0Select UnfoldingHeap@1 (MapType0Select UnfoldingHeap@1 x@@20 next) next) (+ (+ i@@11 1) 1))) (MapType0Select UnfoldingHeap@1 (MapType0Select UnfoldingHeap@1 (MapType0Select UnfoldingHeap@1 x@@20 next) next) next) data (bool_2_U true)))) (forall ((o_5 T@U) (f_9 T@U) ) (! (let ((B@@19 (FieldTypeInv1 (type f_9))))
(let ((A@@20 (FieldTypeInv0 (type f_9))))
 (=> (and (and (= (type o_5) RefType) (= (type f_9) (FieldType A@@20 B@@19))) (or (U_2_bool (MapType1Select (MapType0Select UnfoldingHeap@2 null (|LL#sm| (MapType0Select UnfoldingHeap@2 (MapType0Select UnfoldingHeap@2 x@@20 next) next) (+ (+ i@@11 1) 1))) o_5 f_9)) (U_2_bool (MapType1Select (MapType0Select UnfoldingHeap@2 null (|LL#sm| (MapType0Select UnfoldingHeap@2 (MapType0Select UnfoldingHeap@2 (MapType0Select UnfoldingHeap@2 x@@20 next) next) next) (+ (+ (+ i@@11 1) 1) 1))) o_5 f_9)))) (U_2_bool (MapType1Select newPMask@2 o_5 f_9)))))
 :qid |stdinbpl.364:31|
 :skolemid |30|
 :pattern ( (MapType1Select newPMask@2 o_5 f_9))
))) (and (= UnfoldingHeap@3 (MapType0Store UnfoldingHeap@2 null (|LL#sm| (MapType0Select UnfoldingHeap@2 (MapType0Select UnfoldingHeap@2 x@@20 next) next) (+ (+ i@@11 1) 1)) newPMask@2)) (state UnfoldingHeap@3 UnfoldingMask@4)))) (and (and (and (= (U_2_int (MapType0Select UnfoldingHeap@3 (MapType0Select UnfoldingHeap@3 x@@20 next) data)) (+ i@@11 1)) (|LL#trigger| UnfoldingHeap@3 (LL (MapType0Select UnfoldingHeap@3 (MapType0Select UnfoldingHeap@3 x@@20 next) next) (+ (+ i@@11 1) 1)))) (and (= (MapType0Select UnfoldingHeap@3 null (LL (MapType0Select UnfoldingHeap@3 (MapType0Select UnfoldingHeap@3 x@@20 next) next) (+ (+ i@@11 1) 1))) (CombineFrames (FrameFragment (MapType0Select UnfoldingHeap@3 (MapType0Select UnfoldingHeap@3 (MapType0Select UnfoldingHeap@3 x@@20 next) next) data)) (CombineFrames (FrameFragment (MapType0Select UnfoldingHeap@3 (MapType0Select UnfoldingHeap@3 (MapType0Select UnfoldingHeap@3 x@@20 next) next) next)) (CombineFrames (FrameFragment (MapType0Select UnfoldingHeap@3 (MapType0Select UnfoldingHeap@3 (MapType0Select UnfoldingHeap@3 (MapType0Select UnfoldingHeap@3 x@@20 next) next) next) data)) (MapType0Select UnfoldingHeap@3 null (LL (MapType0Select UnfoldingHeap@3 (MapType0Select UnfoldingHeap@3 (MapType0Select UnfoldingHeap@3 x@@20 next) next) next) (+ (+ (+ i@@11 1) 1) 1))))))) (= Unfolding1Mask@5 (MapType1Store UnfoldingMask@4 null (LL (MapType0Select UnfoldingHeap@3 (MapType0Select UnfoldingHeap@3 x@@20 next) next) (+ (+ i@@11 1) 1)) (real_2_U (- (U_2_real (MapType1Select UnfoldingMask@4 null (LL (MapType0Select UnfoldingHeap@3 (MapType0Select UnfoldingHeap@3 x@@20 next) next) (+ (+ i@@11 1) 1)))) FullPerm)))))) (and (and (= perm@6 (/ (to_real 1) (to_real 2))) (=> (> perm@6 NoPerm) (not (= (MapType0Select UnfoldingHeap@3 (MapType0Select UnfoldingHeap@3 x@@20 next) next) null)))) (and (= Unfolding1Mask@6 (MapType1Store Unfolding1Mask@5 (MapType0Select UnfoldingHeap@3 (MapType0Select UnfoldingHeap@3 x@@20 next) next) data (real_2_U (+ (U_2_real (MapType1Select Unfolding1Mask@5 (MapType0Select UnfoldingHeap@3 (MapType0Select UnfoldingHeap@3 x@@20 next) next) data)) perm@6)))) (state UnfoldingHeap@3 Unfolding1Mask@6)))))) (and (and (and (and (and (not (= (MapType0Select UnfoldingHeap@3 (MapType0Select UnfoldingHeap@3 x@@20 next) next) null)) (= Unfolding1Mask@7 (MapType1Store Unfolding1Mask@6 (MapType0Select UnfoldingHeap@3 (MapType0Select UnfoldingHeap@3 x@@20 next) next) next (real_2_U (+ (U_2_real (MapType1Select Unfolding1Mask@6 (MapType0Select UnfoldingHeap@3 (MapType0Select UnfoldingHeap@3 x@@20 next) next) next)) FullPerm))))) (and (state UnfoldingHeap@3 Unfolding1Mask@7) (= perm@7 (/ (to_real 1) (to_real 2))))) (and (and (=> (> perm@7 NoPerm) (not (= (MapType0Select UnfoldingHeap@3 (MapType0Select UnfoldingHeap@3 (MapType0Select UnfoldingHeap@3 x@@20 next) next) next) null))) (= Unfolding1Mask@8 (MapType1Store Unfolding1Mask@7 (MapType0Select UnfoldingHeap@3 (MapType0Select UnfoldingHeap@3 (MapType0Select UnfoldingHeap@3 x@@20 next) next) next) data (real_2_U (+ (U_2_real (MapType1Select Unfolding1Mask@7 (MapType0Select UnfoldingHeap@3 (MapType0Select UnfoldingHeap@3 (MapType0Select UnfoldingHeap@3 x@@20 next) next) next) data)) perm@7))))) (and (state UnfoldingHeap@3 Unfolding1Mask@8) (= Unfolding1Mask@9 (MapType1Store Unfolding1Mask@8 null (LL (MapType0Select UnfoldingHeap@3 (MapType0Select UnfoldingHeap@3 (MapType0Select UnfoldingHeap@3 x@@20 next) next) next) (+ (+ (+ i@@11 1) 1) 1)) (real_2_U (+ (U_2_real (MapType1Select Unfolding1Mask@8 null (LL (MapType0Select UnfoldingHeap@3 (MapType0Select UnfoldingHeap@3 (MapType0Select UnfoldingHeap@3 x@@20 next) next) next) (+ (+ (+ i@@11 1) 1) 1)))) FullPerm))))))) (and (and (and (InsidePredicate (LL (MapType0Select UnfoldingHeap@3 (MapType0Select UnfoldingHeap@3 x@@20 next) next) (+ (+ i@@11 1) 1)) (MapType0Select UnfoldingHeap@3 null (LL (MapType0Select UnfoldingHeap@3 (MapType0Select UnfoldingHeap@3 x@@20 next) next) (+ (+ i@@11 1) 1))) (LL (MapType0Select UnfoldingHeap@3 (MapType0Select UnfoldingHeap@3 (MapType0Select UnfoldingHeap@3 x@@20 next) next) next) (+ (+ (+ i@@11 1) 1) 1)) (MapType0Select UnfoldingHeap@3 null (LL (MapType0Select UnfoldingHeap@3 (MapType0Select UnfoldingHeap@3 (MapType0Select UnfoldingHeap@3 x@@20 next) next) next) (+ (+ (+ i@@11 1) 1) 1)))) (state UnfoldingHeap@3 Unfolding1Mask@9)) (and (= (U_2_int (MapType0Select UnfoldingHeap@3 (MapType0Select UnfoldingHeap@3 (MapType0Select UnfoldingHeap@3 (MapType0Select UnfoldingHeap@3 x@@20 next) next) next) data)) (+ (+ (+ i@@11 1) 1) 1)) (= Unfolding1Heap@8 (MapType0Store UnfoldingHeap@3 null (|LL#sm| (MapType0Select UnfoldingHeap@3 (MapType0Select UnfoldingHeap@3 (MapType0Select UnfoldingHeap@3 x@@20 next) next) next) (+ (+ (+ i@@11 1) 1) 1)) (MapType1Store (MapType0Select UnfoldingHeap@3 null (|LL#sm| (MapType0Select UnfoldingHeap@3 (MapType0Select UnfoldingHeap@3 (MapType0Select UnfoldingHeap@3 x@@20 next) next) next) (+ (+ (+ i@@11 1) 1) 1))) (MapType0Select UnfoldingHeap@3 (MapType0Select UnfoldingHeap@3 (MapType0Select UnfoldingHeap@3 x@@20 next) next) next) data (bool_2_U true)))))) (and (and (= Unfolding1Heap@9 (MapType0Store Unfolding1Heap@8 null (|LL#sm| (MapType0Select Unfolding1Heap@8 (MapType0Select Unfolding1Heap@8 (MapType0Select Unfolding1Heap@8 x@@20 next) next) next) (+ (+ (+ i@@11 1) 1) 1)) (MapType1Store (MapType0Select Unfolding1Heap@8 null (|LL#sm| (MapType0Select Unfolding1Heap@8 (MapType0Select Unfolding1Heap@8 (MapType0Select Unfolding1Heap@8 x@@20 next) next) next) (+ (+ (+ i@@11 1) 1) 1))) (MapType0Select Unfolding1Heap@8 (MapType0Select Unfolding1Heap@8 (MapType0Select Unfolding1Heap@8 x@@20 next) next) next) next (bool_2_U true)))) (= Unfolding1Heap@10 (MapType0Store Unfolding1Heap@9 null (|LL#sm| (MapType0Select Unfolding1Heap@9 (MapType0Select Unfolding1Heap@9 (MapType0Select Unfolding1Heap@9 x@@20 next) next) next) (+ (+ (+ i@@11 1) 1) 1)) (MapType1Store (MapType0Select Unfolding1Heap@9 null (|LL#sm| (MapType0Select Unfolding1Heap@9 (MapType0Select Unfolding1Heap@9 (MapType0Select Unfolding1Heap@9 x@@20 next) next) next) (+ (+ (+ i@@11 1) 1) 1))) (MapType0Select Unfolding1Heap@9 (MapType0Select Unfolding1Heap@9 (MapType0Select Unfolding1Heap@9 (MapType0Select Unfolding1Heap@9 x@@20 next) next) next) next) data (bool_2_U true))))) (and (forall ((o_6 T@U) (f_10 T@U) ) (! (let ((B@@20 (FieldTypeInv1 (type f_10))))
(let ((A@@21 (FieldTypeInv0 (type f_10))))
 (=> (and (and (= (type o_6) RefType) (= (type f_10) (FieldType A@@21 B@@20))) (or (U_2_bool (MapType1Select (MapType0Select Unfolding1Heap@10 null (|LL#sm| (MapType0Select Unfolding1Heap@10 (MapType0Select Unfolding1Heap@10 (MapType0Select Unfolding1Heap@10 x@@20 next) next) next) (+ (+ (+ i@@11 1) 1) 1))) o_6 f_10)) (U_2_bool (MapType1Select (MapType0Select Unfolding1Heap@10 null (|LL#sm| (MapType0Select Unfolding1Heap@10 (MapType0Select Unfolding1Heap@10 (MapType0Select Unfolding1Heap@10 (MapType0Select Unfolding1Heap@10 x@@20 next) next) next) next) (+ (+ (+ (+ i@@11 1) 1) 1) 1))) o_6 f_10)))) (U_2_bool (MapType1Select newPMask@3 o_6 f_10)))))
 :qid |stdinbpl.406:33|
 :skolemid |31|
 :pattern ( (MapType1Select newPMask@3 o_6 f_10))
)) (= Unfolding1Heap@11 (MapType0Store Unfolding1Heap@10 null (|LL#sm| (MapType0Select Unfolding1Heap@10 (MapType0Select Unfolding1Heap@10 (MapType0Select Unfolding1Heap@10 x@@20 next) next) next) (+ (+ (+ i@@11 1) 1) 1)) newPMask@3)))))) (and (and (and (and (state Unfolding1Heap@11 Unfolding1Mask@9) (= (U_2_int (MapType0Select Unfolding1Heap@11 (MapType0Select Unfolding1Heap@11 (MapType0Select Unfolding1Heap@11 x@@20 next) next) data)) (+ (+ i@@11 1) 1))) (and (= Unfolding1Heap@12 (MapType0Store Unfolding1Heap@11 null (|LL#sm| (MapType0Select Unfolding1Heap@11 (MapType0Select Unfolding1Heap@11 (MapType0Select Unfolding1Heap@11 x@@20 next) next) next) (+ (+ (+ i@@11 1) 1) 1)) (MapType1Store (MapType0Select Unfolding1Heap@11 null (|LL#sm| (MapType0Select Unfolding1Heap@11 (MapType0Select Unfolding1Heap@11 (MapType0Select Unfolding1Heap@11 x@@20 next) next) next) (+ (+ (+ i@@11 1) 1) 1))) (MapType0Select Unfolding1Heap@11 (MapType0Select Unfolding1Heap@11 (MapType0Select Unfolding1Heap@11 x@@20 next) next) next) data (bool_2_U true)))) (= Unfolding1Heap@13 (MapType0Store Unfolding1Heap@12 null (|LL#sm| (MapType0Select Unfolding1Heap@12 (MapType0Select Unfolding1Heap@12 (MapType0Select Unfolding1Heap@12 x@@20 next) next) next) (+ (+ (+ i@@11 1) 1) 1)) (MapType1Store (MapType0Select Unfolding1Heap@12 null (|LL#sm| (MapType0Select Unfolding1Heap@12 (MapType0Select Unfolding1Heap@12 (MapType0Select Unfolding1Heap@12 x@@20 next) next) next) (+ (+ (+ i@@11 1) 1) 1))) (MapType0Select Unfolding1Heap@12 (MapType0Select Unfolding1Heap@12 (MapType0Select Unfolding1Heap@12 x@@20 next) next) next) next (bool_2_U true)))))) (and (and (= Unfolding1Heap@14 (MapType0Store Unfolding1Heap@13 null (|LL#sm| (MapType0Select Unfolding1Heap@13 (MapType0Select Unfolding1Heap@13 (MapType0Select Unfolding1Heap@13 x@@20 next) next) next) (+ (+ (+ i@@11 1) 1) 1)) (MapType1Store (MapType0Select Unfolding1Heap@13 null (|LL#sm| (MapType0Select Unfolding1Heap@13 (MapType0Select Unfolding1Heap@13 (MapType0Select Unfolding1Heap@13 x@@20 next) next) next) (+ (+ (+ i@@11 1) 1) 1))) (MapType0Select Unfolding1Heap@13 (MapType0Select Unfolding1Heap@13 (MapType0Select Unfolding1Heap@13 (MapType0Select Unfolding1Heap@13 x@@20 next) next) next) next) data (bool_2_U true)))) (forall ((o_7 T@U) (f_11 T@U) ) (! (let ((B@@21 (FieldTypeInv1 (type f_11))))
(let ((A@@22 (FieldTypeInv0 (type f_11))))
 (=> (and (and (= (type o_7) RefType) (= (type f_11) (FieldType A@@22 B@@21))) (or (U_2_bool (MapType1Select (MapType0Select Unfolding1Heap@14 null (|LL#sm| (MapType0Select Unfolding1Heap@14 (MapType0Select Unfolding1Heap@14 (MapType0Select Unfolding1Heap@14 x@@20 next) next) next) (+ (+ (+ i@@11 1) 1) 1))) o_7 f_11)) (U_2_bool (MapType1Select (MapType0Select Unfolding1Heap@14 null (|LL#sm| (MapType0Select Unfolding1Heap@14 (MapType0Select Unfolding1Heap@14 (MapType0Select Unfolding1Heap@14 (MapType0Select Unfolding1Heap@14 x@@20 next) next) next) next) (+ (+ (+ (+ i@@11 1) 1) 1) 1))) o_7 f_11)))) (U_2_bool (MapType1Select newPMask@4 o_7 f_11)))))
 :qid |stdinbpl.419:33|
 :skolemid |32|
 :pattern ( (MapType1Select newPMask@4 o_7 f_11))
))) (and (= Unfolding1Heap@15 (MapType0Store Unfolding1Heap@14 null (|LL#sm| (MapType0Select Unfolding1Heap@14 (MapType0Select Unfolding1Heap@14 (MapType0Select Unfolding1Heap@14 x@@20 next) next) next) (+ (+ (+ i@@11 1) 1) 1)) newPMask@4)) (state Unfolding1Heap@15 Unfolding1Mask@9)))) (and (and (and (state Unfolding1Heap@15 Unfolding1Mask@9) (= UnfoldingHeap@4 (MapType0Store UnfoldingHeap@3 null (|LL#sm| (MapType0Select UnfoldingHeap@3 (MapType0Select UnfoldingHeap@3 x@@20 next) next) (+ (+ i@@11 1) 1)) (MapType1Store (MapType0Select UnfoldingHeap@3 null (|LL#sm| (MapType0Select UnfoldingHeap@3 (MapType0Select UnfoldingHeap@3 x@@20 next) next) (+ (+ i@@11 1) 1))) (MapType0Select UnfoldingHeap@3 (MapType0Select UnfoldingHeap@3 x@@20 next) next) data (bool_2_U true))))) (and (= UnfoldingHeap@5 (MapType0Store UnfoldingHeap@4 null (|LL#sm| (MapType0Select UnfoldingHeap@4 (MapType0Select UnfoldingHeap@4 x@@20 next) next) (+ (+ i@@11 1) 1)) (MapType1Store (MapType0Select UnfoldingHeap@4 null (|LL#sm| (MapType0Select UnfoldingHeap@4 (MapType0Select UnfoldingHeap@4 x@@20 next) next) (+ (+ i@@11 1) 1))) (MapType0Select UnfoldingHeap@4 (MapType0Select UnfoldingHeap@4 x@@20 next) next) next (bool_2_U true)))) (= UnfoldingHeap@6 (MapType0Store UnfoldingHeap@5 null (|LL#sm| (MapType0Select UnfoldingHeap@5 (MapType0Select UnfoldingHeap@5 x@@20 next) next) (+ (+ i@@11 1) 1)) (MapType1Store (MapType0Select UnfoldingHeap@5 null (|LL#sm| (MapType0Select UnfoldingHeap@5 (MapType0Select UnfoldingHeap@5 x@@20 next) next) (+ (+ i@@11 1) 1))) (MapType0Select UnfoldingHeap@5 (MapType0Select UnfoldingHeap@5 (MapType0Select UnfoldingHeap@5 x@@20 next) next) next) data (bool_2_U true)))))) (and (and (forall ((o_8 T@U) (f_12 T@U) ) (! (let ((B@@22 (FieldTypeInv1 (type f_12))))
(let ((A@@23 (FieldTypeInv0 (type f_12))))
 (=> (and (and (= (type o_8) RefType) (= (type f_12) (FieldType A@@23 B@@22))) (or (U_2_bool (MapType1Select (MapType0Select UnfoldingHeap@6 null (|LL#sm| (MapType0Select UnfoldingHeap@6 (MapType0Select UnfoldingHeap@6 x@@20 next) next) (+ (+ i@@11 1) 1))) o_8 f_12)) (U_2_bool (MapType1Select (MapType0Select UnfoldingHeap@6 null (|LL#sm| (MapType0Select UnfoldingHeap@6 (MapType0Select UnfoldingHeap@6 (MapType0Select UnfoldingHeap@6 x@@20 next) next) next) (+ (+ (+ i@@11 1) 1) 1))) o_8 f_12)))) (U_2_bool (MapType1Select newPMask@5 o_8 f_12)))))
 :qid |stdinbpl.432:31|
 :skolemid |33|
 :pattern ( (MapType1Select newPMask@5 o_8 f_12))
)) (= UnfoldingHeap@7 (MapType0Store UnfoldingHeap@6 null (|LL#sm| (MapType0Select UnfoldingHeap@6 (MapType0Select UnfoldingHeap@6 x@@20 next) next) (+ (+ i@@11 1) 1)) newPMask@5))) (and (state UnfoldingHeap@7 UnfoldingMask@4) (state UnfoldingHeap@7 UnfoldingMask@4))))))) (and (=> (= (ControlFlow 0 8) (- 0 12)) (HasDirectPerm UnfoldingMask@4 x@@20 next)) (=> (HasDirectPerm UnfoldingMask@4 x@@20 next) (and (=> (= (ControlFlow 0 8) (- 0 11)) (HasDirectPerm UnfoldingMask@4 x@@20 next)) (=> (HasDirectPerm UnfoldingMask@4 x@@20 next) (and (=> (= (ControlFlow 0 8) (- 0 10)) (HasDirectPerm UnfoldingMask@4 (MapType0Select UnfoldingHeap@7 x@@20 next) data)) (=> (HasDirectPerm UnfoldingMask@4 (MapType0Select UnfoldingHeap@7 x@@20 next) data) (=> (= Heap@0 (MapType0Store Heap@@11 null (|LL#sm| (MapType0Select Heap@@11 x@@20 next) (+ i@@11 1)) (MapType1Store (MapType0Select Heap@@11 null (|LL#sm| (MapType0Select Heap@@11 x@@20 next) (+ i@@11 1))) (MapType0Select Heap@@11 x@@20 next) data (bool_2_U true)))) (=> (and (= Heap@1 (MapType0Store Heap@0 null (|LL#sm| (MapType0Select Heap@0 x@@20 next) (+ i@@11 1)) (MapType1Store (MapType0Select Heap@0 null (|LL#sm| (MapType0Select Heap@0 x@@20 next) (+ i@@11 1))) (MapType0Select Heap@0 x@@20 next) next (bool_2_U true)))) (= Heap@2 (MapType0Store Heap@1 null (|LL#sm| (MapType0Select Heap@1 x@@20 next) (+ i@@11 1)) (MapType1Store (MapType0Select Heap@1 null (|LL#sm| (MapType0Select Heap@1 x@@20 next) (+ i@@11 1))) (MapType0Select Heap@1 (MapType0Select Heap@1 x@@20 next) next) data (bool_2_U true))))) (=> (and (and (forall ((o_9 T@U) (f_13 T@U) ) (! (let ((B@@23 (FieldTypeInv1 (type f_13))))
(let ((A@@24 (FieldTypeInv0 (type f_13))))
 (=> (and (and (= (type o_9) RefType) (= (type f_13) (FieldType A@@24 B@@23))) (or (U_2_bool (MapType1Select (MapType0Select Heap@2 null (|LL#sm| (MapType0Select Heap@2 x@@20 next) (+ i@@11 1))) o_9 f_13)) (U_2_bool (MapType1Select (MapType0Select Heap@2 null (|LL#sm| (MapType0Select Heap@2 (MapType0Select Heap@2 x@@20 next) next) (+ (+ i@@11 1) 1))) o_9 f_13)))) (U_2_bool (MapType1Select newPMask@6 o_9 f_13)))))
 :qid |stdinbpl.451:31|
 :skolemid |34|
 :pattern ( (MapType1Select newPMask@6 o_9 f_13))
)) (= Heap@3 (MapType0Store Heap@2 null (|LL#sm| (MapType0Select Heap@2 x@@20 next) (+ i@@11 1)) newPMask@6))) (and (state Heap@3 Mask@3) (|LL#trigger| Heap@3 (LL (MapType0Select Heap@3 x@@20 next) (+ i@@11 1))))) (=> (and (and (and (and (and (= (MapType0Select Heap@3 null (LL (MapType0Select Heap@3 x@@20 next) (+ i@@11 1))) (CombineFrames (FrameFragment (MapType0Select Heap@3 (MapType0Select Heap@3 x@@20 next) data)) (CombineFrames (FrameFragment (MapType0Select Heap@3 (MapType0Select Heap@3 x@@20 next) next)) (CombineFrames (FrameFragment (MapType0Select Heap@3 (MapType0Select Heap@3 (MapType0Select Heap@3 x@@20 next) next) data)) (MapType0Select Heap@3 null (LL (MapType0Select Heap@3 (MapType0Select Heap@3 x@@20 next) next) (+ (+ i@@11 1) 1))))))) (= UnfoldingMask@5 (MapType1Store Mask@3 null (LL (MapType0Select Heap@3 x@@20 next) (+ i@@11 1)) (real_2_U (- (U_2_real (MapType1Select Mask@3 null (LL (MapType0Select Heap@3 x@@20 next) (+ i@@11 1)))) FullPerm))))) (and (= perm@8 (/ (to_real 1) (to_real 2))) (=> (> perm@8 NoPerm) (not (= (MapType0Select Heap@3 x@@20 next) null))))) (and (and (= UnfoldingMask@6 (MapType1Store UnfoldingMask@5 (MapType0Select Heap@3 x@@20 next) data (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@5 (MapType0Select Heap@3 x@@20 next) data)) perm@8)))) (state Heap@3 UnfoldingMask@6)) (and (not (= (MapType0Select Heap@3 x@@20 next) null)) (= UnfoldingMask@7 (MapType1Store UnfoldingMask@6 (MapType0Select Heap@3 x@@20 next) next (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@6 (MapType0Select Heap@3 x@@20 next) next)) FullPerm))))))) (and (and (and (state Heap@3 UnfoldingMask@7) (= perm@9 (/ (to_real 1) (to_real 2)))) (and (=> (> perm@9 NoPerm) (not (= (MapType0Select Heap@3 (MapType0Select Heap@3 x@@20 next) next) null))) (= UnfoldingMask@8 (MapType1Store UnfoldingMask@7 (MapType0Select Heap@3 (MapType0Select Heap@3 x@@20 next) next) data (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@7 (MapType0Select Heap@3 (MapType0Select Heap@3 x@@20 next) next) data)) perm@9)))))) (and (and (state Heap@3 UnfoldingMask@8) (= UnfoldingMask@9 (MapType1Store UnfoldingMask@8 null (LL (MapType0Select Heap@3 (MapType0Select Heap@3 x@@20 next) next) (+ (+ i@@11 1) 1)) (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@8 null (LL (MapType0Select Heap@3 (MapType0Select Heap@3 x@@20 next) next) (+ (+ i@@11 1) 1)))) FullPerm))))) (and (InsidePredicate (LL (MapType0Select Heap@3 x@@20 next) (+ i@@11 1)) (MapType0Select Heap@3 null (LL (MapType0Select Heap@3 x@@20 next) (+ i@@11 1))) (LL (MapType0Select Heap@3 (MapType0Select Heap@3 x@@20 next) next) (+ (+ i@@11 1) 1)) (MapType0Select Heap@3 null (LL (MapType0Select Heap@3 (MapType0Select Heap@3 x@@20 next) next) (+ (+ i@@11 1) 1)))) (state Heap@3 UnfoldingMask@9))))) (and (and (and (and (= (U_2_int (MapType0Select Heap@3 (MapType0Select Heap@3 (MapType0Select Heap@3 x@@20 next) next) data)) (+ (+ i@@11 1) 1)) (= UnfoldingHeap@8 (MapType0Store Heap@3 null (|LL#sm| (MapType0Select Heap@3 (MapType0Select Heap@3 x@@20 next) next) (+ (+ i@@11 1) 1)) (MapType1Store (MapType0Select Heap@3 null (|LL#sm| (MapType0Select Heap@3 (MapType0Select Heap@3 x@@20 next) next) (+ (+ i@@11 1) 1))) (MapType0Select Heap@3 (MapType0Select Heap@3 x@@20 next) next) data (bool_2_U true))))) (and (= UnfoldingHeap@9 (MapType0Store UnfoldingHeap@8 null (|LL#sm| (MapType0Select UnfoldingHeap@8 (MapType0Select UnfoldingHeap@8 x@@20 next) next) (+ (+ i@@11 1) 1)) (MapType1Store (MapType0Select UnfoldingHeap@8 null (|LL#sm| (MapType0Select UnfoldingHeap@8 (MapType0Select UnfoldingHeap@8 x@@20 next) next) (+ (+ i@@11 1) 1))) (MapType0Select UnfoldingHeap@8 (MapType0Select UnfoldingHeap@8 x@@20 next) next) next (bool_2_U true)))) (= UnfoldingHeap@10 (MapType0Store UnfoldingHeap@9 null (|LL#sm| (MapType0Select UnfoldingHeap@9 (MapType0Select UnfoldingHeap@9 x@@20 next) next) (+ (+ i@@11 1) 1)) (MapType1Store (MapType0Select UnfoldingHeap@9 null (|LL#sm| (MapType0Select UnfoldingHeap@9 (MapType0Select UnfoldingHeap@9 x@@20 next) next) (+ (+ i@@11 1) 1))) (MapType0Select UnfoldingHeap@9 (MapType0Select UnfoldingHeap@9 (MapType0Select UnfoldingHeap@9 x@@20 next) next) next) data (bool_2_U true)))))) (and (and (forall ((o_10 T@U) (f_14 T@U) ) (! (let ((B@@24 (FieldTypeInv1 (type f_14))))
(let ((A@@25 (FieldTypeInv0 (type f_14))))
 (=> (and (and (= (type o_10) RefType) (= (type f_14) (FieldType A@@25 B@@24))) (or (U_2_bool (MapType1Select (MapType0Select UnfoldingHeap@10 null (|LL#sm| (MapType0Select UnfoldingHeap@10 (MapType0Select UnfoldingHeap@10 x@@20 next) next) (+ (+ i@@11 1) 1))) o_10 f_14)) (U_2_bool (MapType1Select (MapType0Select UnfoldingHeap@10 null (|LL#sm| (MapType0Select UnfoldingHeap@10 (MapType0Select UnfoldingHeap@10 (MapType0Select UnfoldingHeap@10 x@@20 next) next) next) (+ (+ (+ i@@11 1) 1) 1))) o_10 f_14)))) (U_2_bool (MapType1Select newPMask@7 o_10 f_14)))))
 :qid |stdinbpl.492:31|
 :skolemid |35|
 :pattern ( (MapType1Select newPMask@7 o_10 f_14))
)) (= UnfoldingHeap@11 (MapType0Store UnfoldingHeap@10 null (|LL#sm| (MapType0Select UnfoldingHeap@10 (MapType0Select UnfoldingHeap@10 x@@20 next) next) (+ (+ i@@11 1) 1)) newPMask@7))) (and (state UnfoldingHeap@11 UnfoldingMask@9) (= (U_2_int (MapType0Select UnfoldingHeap@11 (MapType0Select UnfoldingHeap@11 x@@20 next) data)) (+ i@@11 1))))) (and (and (and (= UnfoldingHeap@12 (MapType0Store UnfoldingHeap@11 null (|LL#sm| (MapType0Select UnfoldingHeap@11 (MapType0Select UnfoldingHeap@11 x@@20 next) next) (+ (+ i@@11 1) 1)) (MapType1Store (MapType0Select UnfoldingHeap@11 null (|LL#sm| (MapType0Select UnfoldingHeap@11 (MapType0Select UnfoldingHeap@11 x@@20 next) next) (+ (+ i@@11 1) 1))) (MapType0Select UnfoldingHeap@11 (MapType0Select UnfoldingHeap@11 x@@20 next) next) data (bool_2_U true)))) (= UnfoldingHeap@13 (MapType0Store UnfoldingHeap@12 null (|LL#sm| (MapType0Select UnfoldingHeap@12 (MapType0Select UnfoldingHeap@12 x@@20 next) next) (+ (+ i@@11 1) 1)) (MapType1Store (MapType0Select UnfoldingHeap@12 null (|LL#sm| (MapType0Select UnfoldingHeap@12 (MapType0Select UnfoldingHeap@12 x@@20 next) next) (+ (+ i@@11 1) 1))) (MapType0Select UnfoldingHeap@12 (MapType0Select UnfoldingHeap@12 x@@20 next) next) next (bool_2_U true))))) (and (= UnfoldingHeap@14 (MapType0Store UnfoldingHeap@13 null (|LL#sm| (MapType0Select UnfoldingHeap@13 (MapType0Select UnfoldingHeap@13 x@@20 next) next) (+ (+ i@@11 1) 1)) (MapType1Store (MapType0Select UnfoldingHeap@13 null (|LL#sm| (MapType0Select UnfoldingHeap@13 (MapType0Select UnfoldingHeap@13 x@@20 next) next) (+ (+ i@@11 1) 1))) (MapType0Select UnfoldingHeap@13 (MapType0Select UnfoldingHeap@13 (MapType0Select UnfoldingHeap@13 x@@20 next) next) next) data (bool_2_U true)))) (forall ((o_11 T@U) (f_15 T@U) ) (! (let ((B@@25 (FieldTypeInv1 (type f_15))))
(let ((A@@26 (FieldTypeInv0 (type f_15))))
 (=> (and (and (= (type o_11) RefType) (= (type f_15) (FieldType A@@26 B@@25))) (or (U_2_bool (MapType1Select (MapType0Select UnfoldingHeap@14 null (|LL#sm| (MapType0Select UnfoldingHeap@14 (MapType0Select UnfoldingHeap@14 x@@20 next) next) (+ (+ i@@11 1) 1))) o_11 f_15)) (U_2_bool (MapType1Select (MapType0Select UnfoldingHeap@14 null (|LL#sm| (MapType0Select UnfoldingHeap@14 (MapType0Select UnfoldingHeap@14 (MapType0Select UnfoldingHeap@14 x@@20 next) next) next) (+ (+ (+ i@@11 1) 1) 1))) o_11 f_15)))) (U_2_bool (MapType1Select newPMask@8 o_11 f_15)))))
 :qid |stdinbpl.505:31|
 :skolemid |36|
 :pattern ( (MapType1Select newPMask@8 o_11 f_15))
)))) (and (and (= UnfoldingHeap@15 (MapType0Store UnfoldingHeap@14 null (|LL#sm| (MapType0Select UnfoldingHeap@14 (MapType0Select UnfoldingHeap@14 x@@20 next) next) (+ (+ i@@11 1) 1)) newPMask@8)) (state UnfoldingHeap@15 UnfoldingMask@9)) (and (state UnfoldingHeap@15 UnfoldingMask@9) (= (U_2_int (MapType0Select Heap@3 (MapType0Select Heap@3 x@@20 next) data)) (+ i@@11 1))))))) (and (=> (= (ControlFlow 0 8) (- 0 9)) (HasDirectPerm Mask@3 x@@20 data)) (=> (HasDirectPerm Mask@3 x@@20 data) (=> (= (U_2_int (MapType0Select Heap@3 x@@20 data)) i@@11) (=> (and (|LL#trigger| Heap@3 (LL (MapType0Select Heap@3 x@@20 next) (+ i@@11 1))) (= (MapType0Select Heap@3 null (LL (MapType0Select Heap@3 x@@20 next) (+ i@@11 1))) (CombineFrames (FrameFragment (MapType0Select Heap@3 (MapType0Select Heap@3 x@@20 next) data)) (CombineFrames (FrameFragment (MapType0Select Heap@3 (MapType0Select Heap@3 x@@20 next) next)) (CombineFrames (FrameFragment (MapType0Select Heap@3 (MapType0Select Heap@3 (MapType0Select Heap@3 x@@20 next) next) data)) (MapType0Select Heap@3 null (LL (MapType0Select Heap@3 (MapType0Select Heap@3 x@@20 next) next) (+ (+ i@@11 1) 1)))))))) (and (=> (= (ControlFlow 0 8) 5) anon6_Then_correct) (=> (= (ControlFlow 0 8) 7) anon6_Else_correct))))))))))))))))))))))))))))))
(let ((anon5_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 17) 8)) anon2_correct)))
(let ((anon5_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 15) (- 0 16)) (<= FullPerm (U_2_real (MapType1Select Mask@3 null (LL (MapType0Select Heap@@11 x@@20 next) (+ i@@11 1)))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@3 null (LL (MapType0Select Heap@@11 x@@20 next) (+ i@@11 1))))) (=> (= (ControlFlow 0 15) 8) anon2_correct))))))
(let ((anon0_correct  (=> (state Heap@@11 ZeroMask) (=> (and (U_2_bool (MapType0Select Heap@@11 x@@20 $allocated)) (= perm@0 (/ (to_real 1) (to_real 2)))) (and (=> (= (ControlFlow 0 18) (- 0 22)) (>= perm@0 NoPerm)) (=> (>= perm@0 NoPerm) (=> (and (=> (> perm@0 NoPerm) (not (= x@@20 null))) (= Mask@0 (MapType1Store ZeroMask x@@20 data (real_2_U (+ (U_2_real (MapType1Select ZeroMask x@@20 data)) perm@0))))) (=> (and (and (state Heap@@11 Mask@0) (not (= x@@20 null))) (and (= Mask@1 (MapType1Store Mask@0 x@@20 next (real_2_U (+ (U_2_real (MapType1Select Mask@0 x@@20 next)) FullPerm)))) (state Heap@@11 Mask@1))) (and (=> (= (ControlFlow 0 18) (- 0 21)) (HasDirectPerm Mask@1 x@@20 next)) (=> (HasDirectPerm Mask@1 x@@20 next) (=> (= perm@1 (/ (to_real 1) (to_real 2))) (and (=> (= (ControlFlow 0 18) (- 0 20)) (>= perm@1 NoPerm)) (=> (>= perm@1 NoPerm) (=> (=> (> perm@1 NoPerm) (not (= (MapType0Select Heap@@11 x@@20 next) null))) (=> (and (= Mask@2 (MapType1Store Mask@1 (MapType0Select Heap@@11 x@@20 next) data (real_2_U (+ (U_2_real (MapType1Select Mask@1 (MapType0Select Heap@@11 x@@20 next) data)) perm@1)))) (state Heap@@11 Mask@2)) (and (=> (= (ControlFlow 0 18) (- 0 19)) (HasDirectPerm Mask@2 x@@20 next)) (=> (HasDirectPerm Mask@2 x@@20 next) (=> (and (and (= Mask@3 (MapType1Store Mask@2 null (LL (MapType0Select Heap@@11 x@@20 next) (+ i@@11 1)) (real_2_U (+ (U_2_real (MapType1Select Mask@2 null (LL (MapType0Select Heap@@11 x@@20 next) (+ i@@11 1)))) FullPerm)))) (state Heap@@11 Mask@3)) (and (|LL#trigger| Heap@@11 (LL (MapType0Select Heap@@11 x@@20 next) (+ i@@11 1))) (= (MapType0Select Heap@@11 null (LL (MapType0Select Heap@@11 x@@20 next) (+ i@@11 1))) (CombineFrames (FrameFragment (MapType0Select Heap@@11 (MapType0Select Heap@@11 x@@20 next) data)) (CombineFrames (FrameFragment (MapType0Select Heap@@11 (MapType0Select Heap@@11 x@@20 next) next)) (CombineFrames (FrameFragment (MapType0Select Heap@@11 (MapType0Select Heap@@11 (MapType0Select Heap@@11 x@@20 next) next) data)) (MapType0Select Heap@@11 null (LL (MapType0Select Heap@@11 (MapType0Select Heap@@11 x@@20 next) next) (+ (+ i@@11 1) 1))))))))) (and (=> (= (ControlFlow 0 18) 15) anon5_Then_correct) (=> (= (ControlFlow 0 18) 17) anon5_Else_correct))))))))))))))))))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 23) 18) anon0_correct)))
PreconditionGeneratedEntry_correct)))))))))
))
(check-sat)
(pop 1)
; Valid
(get-info :rlimit)
