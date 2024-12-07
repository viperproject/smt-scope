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
(declare-fun |f6'| (T@U T@U Int) Int)
(declare-fun dummyFunction (T@U) Bool)
(declare-fun |f6#triggerStateless| (T@U Int) Int)
(declare-fun IdenticalOnKnownLocations (T@U T@U T@U) Bool)
(declare-fun IsPredicateField (T@U) Bool)
(declare-fun null () T@U)
(declare-fun PredicateMaskField (T@U) T@U)
(declare-fun FrameTypeType () T@T)
(declare-fun HasDirectPerm (T@U T@U T@U) Bool)
(declare-fun IsWandField (T@U) Bool)
(declare-fun WandMaskField (T@U) T@U)
(declare-fun list (T@U) T@U)
(declare-fun PredicateType_listType () T@T)
(declare-fun |f1'| (T@U Int) Int)
(declare-fun |f1#triggerStateless| (Int) Int)
(declare-fun |f3'| (T@U Int) Int)
(declare-fun |f3#triggerStateless| (Int) Int)
(declare-fun |f4'| (T@U Int) Int)
(declare-fun |f4#triggerStateless| (Int) Int)
(declare-fun |f5'| (T@U Int) Int)
(declare-fun |f5#triggerStateless| (Int) Int)
(declare-fun |f7'| (T@U Int) Bool)
(declare-fun |f7#triggerStateless| (Int) Bool)
(declare-fun |list#trigger| (T@U T@U) Bool)
(declare-fun |list#everUsed| (T@U) Bool)
(declare-fun f1 (T@U Int) Int)
(declare-fun f3 (T@U Int) Int)
(declare-fun f4 (T@U Int) Int)
(declare-fun f5 (T@U Int) Int)
(declare-fun decreasing (T@U T@U) Bool)
(declare-fun |list#sm| (T@U) T@U)
(declare-fun dummyHeap () T@U)
(declare-fun ZeroMask () T@U)
(declare-fun InsidePredicate (T@U T@U T@U T@U) Bool)
(declare-fun sumMask (T@U T@U T@U) Bool)
(declare-fun f6 (T@U T@U Int) Int)
(declare-fun AssumeFunctionsAbove () Int)
(declare-fun f7 (T@U Int) Bool)
(declare-fun ConditionalFrame (Real T@U) T@U)
(declare-fun EmptyFrame () T@U)
(declare-fun NoPerm () Real)
(declare-fun |f7#trigger| (T@U Int) Bool)
(declare-fun bounded (T@U) Bool)
(declare-fun |f7#frame| (T@U Int) Bool)
(declare-fun getPredWandId (T@U) Int)
(declare-fun FullPerm () Real)
(declare-fun |f1#frame| (T@U Int) Int)
(declare-fun |f3#frame| (T@U Int) Int)
(declare-fun |f4#frame| (T@U Int) Int)
(declare-fun |f5#frame| (T@U Int) Int)
(declare-fun ZeroPMask () T@U)
(declare-fun |f6#frame| (T@U T@U Int) Int)
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
))) (= (Ctor NormalFieldType) 7)) (= (type $allocated) (FieldType NormalFieldType boolType))) (= (Ctor RefType) 8)) (= (type next) (FieldType NormalFieldType RefType))))
(assert (distinct $allocated next)
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
(assert (forall ((Heap@@0 T@U) (xs T@U) (x@@8 Int) ) (!  (=> (and (= (type Heap@@0) (MapType0Type RefType)) (= (type xs) RefType)) (dummyFunction (int_2_U (|f6#triggerStateless| xs x@@8))))
 :qid |stdinbpl.484:15|
 :skolemid |41|
 :pattern ( (|f6'| Heap@@0 xs x@@8))
)))
(assert  (and (and (= (Ctor FrameTypeType) 11) (= (type null) RefType)) (forall ((arg0@@23 T@U) ) (! (let ((A (FieldTypeInv0 (type arg0@@23))))
(= (type (PredicateMaskField arg0@@23)) (FieldType A (MapType1Type RefType boolType))))
 :qid |funType:PredicateMaskField|
 :pattern ( (PredicateMaskField arg0@@23))
))))
(assert (forall ((Heap@@1 T@U) (ExhaleHeap T@U) (Mask@@0 T@U) (pm_f T@U) ) (! (let ((C (FieldTypeInv0 (type pm_f))))
 (=> (and (and (and (and (and (= (type Heap@@1) (MapType0Type RefType)) (= (type ExhaleHeap) (MapType0Type RefType))) (= (type Mask@@0) (MapType1Type RefType realType))) (= (type pm_f) (FieldType C FrameTypeType))) (IdenticalOnKnownLocations Heap@@1 ExhaleHeap Mask@@0)) (and (HasDirectPerm Mask@@0 null pm_f) (IsPredicateField pm_f))) (= (MapType0Select Heap@@1 null (PredicateMaskField pm_f)) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))))
 :qid |stdinbpl.47:19|
 :skolemid |2|
 :pattern ( (IdenticalOnKnownLocations Heap@@1 ExhaleHeap Mask@@0) (IsPredicateField pm_f) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))
)))
(assert (forall ((arg0@@24 T@U) ) (! (let ((A@@0 (FieldTypeInv0 (type arg0@@24))))
(= (type (WandMaskField arg0@@24)) (FieldType A@@0 (MapType1Type RefType boolType))))
 :qid |funType:WandMaskField|
 :pattern ( (WandMaskField arg0@@24))
)))
(assert (forall ((Heap@@2 T@U) (ExhaleHeap@@0 T@U) (Mask@@1 T@U) (pm_f@@0 T@U) ) (! (let ((C@@0 (FieldTypeInv0 (type pm_f@@0))))
 (=> (and (and (and (and (and (= (type Heap@@2) (MapType0Type RefType)) (= (type ExhaleHeap@@0) (MapType0Type RefType))) (= (type Mask@@1) (MapType1Type RefType realType))) (= (type pm_f@@0) (FieldType C@@0 FrameTypeType))) (IdenticalOnKnownLocations Heap@@2 ExhaleHeap@@0 Mask@@1)) (and (HasDirectPerm Mask@@1 null pm_f@@0) (IsWandField pm_f@@0))) (= (MapType0Select Heap@@2 null (WandMaskField pm_f@@0)) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))))
 :qid |stdinbpl.60:19|
 :skolemid |5|
 :pattern ( (IdenticalOnKnownLocations Heap@@2 ExhaleHeap@@0 Mask@@1) (IsWandField pm_f@@0) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))
)))
(assert  (and (= (Ctor PredicateType_listType) 12) (forall ((arg0@@25 T@U) ) (! (= (type (list arg0@@25)) (FieldType PredicateType_listType FrameTypeType))
 :qid |funType:list|
 :pattern ( (list arg0@@25))
))))
(assert (forall ((xs@@0 T@U) ) (!  (=> (= (type xs@@0) RefType) (IsPredicateField (list xs@@0)))
 :qid |stdinbpl.633:15|
 :skolemid |49|
 :pattern ( (list xs@@0))
)))
(assert (forall ((Heap@@3 T@U) (i Int) ) (!  (=> (= (type Heap@@3) (MapType0Type RefType)) (dummyFunction (int_2_U (|f1#triggerStateless| i))))
 :qid |stdinbpl.234:15|
 :skolemid |25|
 :pattern ( (|f1'| Heap@@3 i))
)))
(assert (forall ((Heap@@4 T@U) (i@@0 Int) ) (!  (=> (= (type Heap@@4) (MapType0Type RefType)) (dummyFunction (int_2_U (|f3#triggerStateless| i@@0))))
 :qid |stdinbpl.337:15|
 :skolemid |29|
 :pattern ( (|f3'| Heap@@4 i@@0))
)))
(assert (forall ((Heap@@5 T@U) (i@@1 Int) ) (!  (=> (= (type Heap@@5) (MapType0Type RefType)) (dummyFunction (int_2_U (|f4#triggerStateless| i@@1))))
 :qid |stdinbpl.386:15|
 :skolemid |33|
 :pattern ( (|f4'| Heap@@5 i@@1))
)))
(assert (forall ((Heap@@6 T@U) (i@@2 Int) ) (!  (=> (= (type Heap@@6) (MapType0Type RefType)) (dummyFunction (int_2_U (|f5#triggerStateless| i@@2))))
 :qid |stdinbpl.435:15|
 :skolemid |37|
 :pattern ( (|f5'| Heap@@6 i@@2))
)))
(assert (forall ((Heap@@7 T@U) (y@@1 Int) ) (!  (=> (= (type Heap@@7) (MapType0Type RefType)) (dummyFunction (bool_2_U (|f7#triggerStateless| y@@1))))
 :qid |stdinbpl.583:15|
 :skolemid |45|
 :pattern ( (|f7'| Heap@@7 y@@1))
)))
(assert (forall ((Heap@@8 T@U) (xs@@1 T@U) ) (!  (=> (and (= (type Heap@@8) (MapType0Type RefType)) (= (type xs@@1) RefType)) (|list#everUsed| (list xs@@1)))
 :qid |stdinbpl.652:15|
 :skolemid |53|
 :pattern ( (|list#trigger| Heap@@8 (list xs@@1)))
)))
(assert (forall ((Heap@@9 T@U) (ExhaleHeap@@1 T@U) (Mask@@2 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@9) (MapType0Type RefType)) (= (type ExhaleHeap@@1) (MapType0Type RefType))) (= (type Mask@@2) (MapType1Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@9 ExhaleHeap@@1 Mask@@2)) (U_2_bool (MapType0Select Heap@@9 o_1 $allocated))) (U_2_bool (MapType0Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.73:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@9 ExhaleHeap@@1 Mask@@2) (MapType0Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert (forall ((Heap@@10 T@U) (i@@3 Int) ) (!  (=> (= (type Heap@@10) (MapType0Type RefType)) (and (= (f1 Heap@@10 i@@3) (|f1'| Heap@@10 i@@3)) (dummyFunction (int_2_U (|f1#triggerStateless| i@@3)))))
 :qid |stdinbpl.230:15|
 :skolemid |24|
 :pattern ( (f1 Heap@@10 i@@3))
)))
(assert (forall ((Heap@@11 T@U) (i@@4 Int) ) (!  (=> (= (type Heap@@11) (MapType0Type RefType)) (and (= (f3 Heap@@11 i@@4) (|f3'| Heap@@11 i@@4)) (dummyFunction (int_2_U (|f3#triggerStateless| i@@4)))))
 :qid |stdinbpl.333:15|
 :skolemid |28|
 :pattern ( (f3 Heap@@11 i@@4))
)))
(assert (forall ((Heap@@12 T@U) (i@@5 Int) ) (!  (=> (= (type Heap@@12) (MapType0Type RefType)) (and (= (f4 Heap@@12 i@@5) (|f4'| Heap@@12 i@@5)) (dummyFunction (int_2_U (|f4#triggerStateless| i@@5)))))
 :qid |stdinbpl.382:15|
 :skolemid |32|
 :pattern ( (f4 Heap@@12 i@@5))
)))
(assert (forall ((Heap@@13 T@U) (i@@6 Int) ) (!  (=> (= (type Heap@@13) (MapType0Type RefType)) (and (= (f5 Heap@@13 i@@6) (|f5'| Heap@@13 i@@6)) (dummyFunction (int_2_U (|f5#triggerStateless| i@@6)))))
 :qid |stdinbpl.431:15|
 :skolemid |36|
 :pattern ( (f5 Heap@@13 i@@6))
)))
(assert (forall ((int1 T@U) (int2 T@U) ) (!  (=> (and (and (= (type int1) intType) (= (type int2) intType)) (< (U_2_int int1) (U_2_int int2))) (decreasing int1 int2))
 :qid |stdinbpl.191:15|
 :skolemid |22|
 :pattern ( (decreasing int1 int2))
)))
(assert (forall ((xs@@2 T@U) (xs2 T@U) ) (!  (=> (and (and (= (type xs@@2) RefType) (= (type xs2) RefType)) (= (list xs@@2) (list xs2))) (= xs@@2 xs2))
 :qid |stdinbpl.643:15|
 :skolemid |51|
 :pattern ( (list xs@@2) (list xs2))
)))
(assert (forall ((arg0@@26 T@U) ) (! (= (type (|list#sm| arg0@@26)) (FieldType PredicateType_listType (MapType1Type RefType boolType)))
 :qid |funType:list#sm|
 :pattern ( (|list#sm| arg0@@26))
)))
(assert (forall ((xs@@3 T@U) (xs2@@0 T@U) ) (!  (=> (and (and (= (type xs@@3) RefType) (= (type xs2@@0) RefType)) (= (|list#sm| xs@@3) (|list#sm| xs2@@0))) (= xs@@3 xs2@@0))
 :qid |stdinbpl.647:15|
 :skolemid |52|
 :pattern ( (|list#sm| xs@@3) (|list#sm| xs2@@0))
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
 :qid |stdinbpl.178:19|
 :skolemid |21|
 :pattern ( (InsidePredicate p v_1 p w))
)))
(assert  (not (IsPredicateField next)))
(assert  (not (IsWandField next)))
(assert (forall ((Heap@@15 T@U) (ExhaleHeap@@3 T@U) (Mask@@4 T@U) ) (!  (=> (and (and (and (= (type Heap@@15) (MapType0Type RefType)) (= (type ExhaleHeap@@3) (MapType0Type RefType))) (= (type Mask@@4) (MapType1Type RefType realType))) (IdenticalOnKnownLocations Heap@@15 ExhaleHeap@@3 Mask@@4)) (succHeap Heap@@15 ExhaleHeap@@3))
 :qid |stdinbpl.83:15|
 :skolemid |10|
 :pattern ( (IdenticalOnKnownLocations Heap@@15 ExhaleHeap@@3 Mask@@4))
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
(assert (forall ((Heap@@16 T@U) (Mask@@5 T@U) (xs@@4 T@U) (x@@9 Int) ) (!  (=> (and (and (and (and (= (type Heap@@16) (MapType0Type RefType)) (= (type Mask@@5) (MapType1Type RefType realType))) (= (type xs@@4) RefType)) (and (state Heap@@16 Mask@@5) (< AssumeFunctionsAbove 1))) (and (>= x@@9 0) (f7 Heap@@16 x@@9))) (= (f6 Heap@@16 xs@@4 x@@9) (ite (not (= x@@9 0)) (|f6'| Heap@@16 xs@@4 (- x@@9 1)) x@@9)))
 :qid |stdinbpl.490:15|
 :skolemid |42|
 :pattern ( (state Heap@@16 Mask@@5) (f6 Heap@@16 xs@@4 x@@9))
)))
(assert  (and (forall ((arg0@@27 Real) (arg1@@9 T@U) ) (! (= (type (ConditionalFrame arg0@@27 arg1@@9)) FrameTypeType)
 :qid |funType:ConditionalFrame|
 :pattern ( (ConditionalFrame arg0@@27 arg1@@9))
)) (= (type EmptyFrame) FrameTypeType)))
(assert (forall ((p@@0 Real) (f_6 T@U) ) (!  (=> (= (type f_6) FrameTypeType) (= (ConditionalFrame p@@0 f_6) (ite (> p@@0 0.0) f_6 EmptyFrame)))
 :qid |stdinbpl.166:15|
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
(assert (forall ((Heap@@17 T@U) (xs@@5 T@U) (x@@10 Int) ) (!  (=> (and (= (type Heap@@17) (MapType0Type RefType)) (= (type xs@@5) RefType)) (and (= (f6 Heap@@17 xs@@5 x@@10) (|f6'| Heap@@17 xs@@5 x@@10)) (dummyFunction (int_2_U (|f6#triggerStateless| xs@@5 x@@10)))))
 :qid |stdinbpl.480:15|
 :skolemid |40|
 :pattern ( (f6 Heap@@17 xs@@5 x@@10))
)))
(assert (forall ((Heap@@18 T@U) (Mask@@7 T@U) (i@@7 Int) ) (!  (=> (and (and (and (= (type Heap@@18) (MapType0Type RefType)) (= (type Mask@@7) (MapType1Type RefType realType))) (and (state Heap@@18 Mask@@7) (< AssumeFunctionsAbove 2))) (>= i@@7 0)) (= (f1 Heap@@18 i@@7) (ite (< i@@7 10) 1 (ite  (or (< (|f1'| Heap@@18 (- i@@7 1)) 4) (< (|f1'| Heap@@18 (- i@@7 3)) 6)) 1 (|f1'| Heap@@18 (- i@@7 1))))))
 :qid |stdinbpl.240:15|
 :skolemid |26|
 :pattern ( (state Heap@@18 Mask@@7) (f1 Heap@@18 i@@7))
)))
(assert (forall ((o_2@@1 T@U) (f_4@@1 T@U) ) (! (let ((B@@4 (FieldTypeInv1 (type f_4@@1))))
(let ((A@@5 (FieldTypeInv0 (type f_4@@1))))
 (=> (and (= (type o_2@@1) RefType) (= (type f_4@@1) (FieldType A@@5 B@@4))) (= (U_2_real (MapType1Select ZeroMask o_2@@1 f_4@@1)) NoPerm))))
 :qid |stdinbpl.106:22|
 :skolemid |13|
 :pattern ( (MapType1Select ZeroMask o_2@@1 f_4@@1))
)))
(assert (forall ((Heap@@19 T@U) (Mask@@8 T@U) (y@@2 Int) ) (!  (=> (and (and (= (type Heap@@19) (MapType0Type RefType)) (= (type Mask@@8) (MapType1Type RefType realType))) (and (state Heap@@19 Mask@@8) (or (< AssumeFunctionsAbove 5) (|f7#trigger| EmptyFrame y@@2)))) (|f7'| Heap@@19 y@@2))
 :qid |stdinbpl.596:15|
 :skolemid |47|
 :pattern ( (state Heap@@19 Mask@@8) (|f7'| Heap@@19 y@@2))
)))
(assert (forall ((int1@@0 T@U) ) (!  (=> (and (= (type int1@@0) intType) (>= (U_2_int int1@@0) 0)) (bounded int1@@0))
 :qid |stdinbpl.197:15|
 :skolemid |23|
 :pattern ( (bounded int1@@0))
)))
(assert (forall ((Heap@@20 T@U) (Mask@@9 T@U) (y@@3 Int) ) (!  (=> (and (and (= (type Heap@@20) (MapType0Type RefType)) (= (type Mask@@9) (MapType1Type RefType realType))) (state Heap@@20 Mask@@9)) (= (|f7'| Heap@@20 y@@3) (|f7#frame| EmptyFrame y@@3)))
 :qid |stdinbpl.590:15|
 :skolemid |46|
 :pattern ( (state Heap@@20 Mask@@9) (|f7'| Heap@@20 y@@3))
)))
(assert (forall ((Heap@@21 T@U) (y@@4 Int) ) (!  (=> (= (type Heap@@21) (MapType0Type RefType)) (and (= (f7 Heap@@21 y@@4) (|f7'| Heap@@21 y@@4)) (dummyFunction (bool_2_U (|f7#triggerStateless| y@@4)))))
 :qid |stdinbpl.579:15|
 :skolemid |44|
 :pattern ( (f7 Heap@@21 y@@4))
)))
(assert (forall ((Heap@@22 T@U) (ExhaleHeap@@4 T@U) (Mask@@10 T@U) (pm_f@@1 T@U) ) (! (let ((C@@1 (FieldTypeInv0 (type pm_f@@1))))
 (=> (and (and (and (and (and (= (type Heap@@22) (MapType0Type RefType)) (= (type ExhaleHeap@@4) (MapType0Type RefType))) (= (type Mask@@10) (MapType1Type RefType realType))) (= (type pm_f@@1) (FieldType C@@1 FrameTypeType))) (IdenticalOnKnownLocations Heap@@22 ExhaleHeap@@4 Mask@@10)) (and (HasDirectPerm Mask@@10 null pm_f@@1) (IsPredicateField pm_f@@1))) (forall ((o2 T@U) (f_2@@0 T@U) ) (! (let ((B@@5 (FieldTypeInv1 (type f_2@@0))))
(let ((A@@6 (FieldTypeInv0 (type f_2@@0))))
 (=> (and (and (= (type o2) RefType) (= (type f_2@@0) (FieldType A@@6 B@@5))) (U_2_bool (MapType1Select (MapType0Select Heap@@22 null (PredicateMaskField pm_f@@1)) o2 f_2@@0))) (= (MapType0Select Heap@@22 o2 f_2@@0) (MapType0Select ExhaleHeap@@4 o2 f_2@@0)))))
 :qid |stdinbpl.54:134|
 :skolemid |3|
 :pattern ( (MapType0Select ExhaleHeap@@4 o2 f_2@@0))
))))
 :qid |stdinbpl.52:19|
 :skolemid |4|
 :pattern ( (IdenticalOnKnownLocations Heap@@22 ExhaleHeap@@4 Mask@@10) (IsPredicateField pm_f@@1))
)))
(assert (forall ((Heap@@23 T@U) (ExhaleHeap@@5 T@U) (Mask@@11 T@U) (pm_f@@2 T@U) ) (! (let ((C@@2 (FieldTypeInv0 (type pm_f@@2))))
 (=> (and (and (and (and (and (= (type Heap@@23) (MapType0Type RefType)) (= (type ExhaleHeap@@5) (MapType0Type RefType))) (= (type Mask@@11) (MapType1Type RefType realType))) (= (type pm_f@@2) (FieldType C@@2 FrameTypeType))) (IdenticalOnKnownLocations Heap@@23 ExhaleHeap@@5 Mask@@11)) (and (HasDirectPerm Mask@@11 null pm_f@@2) (IsWandField pm_f@@2))) (forall ((o2@@0 T@U) (f_2@@1 T@U) ) (! (let ((B@@6 (FieldTypeInv1 (type f_2@@1))))
(let ((A@@7 (FieldTypeInv0 (type f_2@@1))))
 (=> (and (and (= (type o2@@0) RefType) (= (type f_2@@1) (FieldType A@@7 B@@6))) (U_2_bool (MapType1Select (MapType0Select Heap@@23 null (WandMaskField pm_f@@2)) o2@@0 f_2@@1))) (= (MapType0Select Heap@@23 o2@@0 f_2@@1) (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1)))))
 :qid |stdinbpl.67:129|
 :skolemid |6|
 :pattern ( (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1))
))))
 :qid |stdinbpl.65:19|
 :skolemid |7|
 :pattern ( (IdenticalOnKnownLocations Heap@@23 ExhaleHeap@@5 Mask@@11) (IsWandField pm_f@@2))
)))
(assert (forall ((xs@@6 T@U) ) (!  (=> (= (type xs@@6) RefType) (= (getPredWandId (list xs@@6)) 0))
 :qid |stdinbpl.637:15|
 :skolemid |50|
 :pattern ( (list xs@@6))
)))
(assert (forall ((Mask@@12 T@U) (o_2@@2 T@U) (f_4@@2 T@U) ) (! (let ((B@@7 (FieldTypeInv1 (type f_4@@2))))
(let ((A@@8 (FieldTypeInv0 (type f_4@@2))))
 (=> (and (and (and (= (type Mask@@12) (MapType1Type RefType realType)) (= (type o_2@@2) RefType)) (= (type f_4@@2) (FieldType A@@8 B@@7))) (GoodMask Mask@@12)) (and (>= (U_2_real (MapType1Select Mask@@12 o_2@@2 f_4@@2)) NoPerm) (=> (and (and (GoodMask Mask@@12) (not (IsPredicateField f_4@@2))) (not (IsWandField f_4@@2))) (<= (U_2_real (MapType1Select Mask@@12 o_2@@2 f_4@@2)) FullPerm))))))
 :qid |stdinbpl.128:22|
 :skolemid |16|
 :pattern ( (GoodMask Mask@@12) (MapType1Select Mask@@12 o_2@@2 f_4@@2))
)))
(assert (forall ((Heap@@24 T@U) (Mask@@13 T@U) (i@@8 Int) ) (!  (=> (and (and (= (type Heap@@24) (MapType0Type RefType)) (= (type Mask@@13) (MapType1Type RefType realType))) (state Heap@@24 Mask@@13)) (= (|f1'| Heap@@24 i@@8) (|f1#frame| EmptyFrame i@@8)))
 :qid |stdinbpl.247:15|
 :skolemid |27|
 :pattern ( (state Heap@@24 Mask@@13) (|f1'| Heap@@24 i@@8))
)))
(assert (forall ((Heap@@25 T@U) (Mask@@14 T@U) (i@@9 Int) ) (!  (=> (and (and (= (type Heap@@25) (MapType0Type RefType)) (= (type Mask@@14) (MapType1Type RefType realType))) (state Heap@@25 Mask@@14)) (= (|f3'| Heap@@25 i@@9) (|f3#frame| EmptyFrame i@@9)))
 :qid |stdinbpl.350:15|
 :skolemid |31|
 :pattern ( (state Heap@@25 Mask@@14) (|f3'| Heap@@25 i@@9))
)))
(assert (forall ((Heap@@26 T@U) (Mask@@15 T@U) (i@@10 Int) ) (!  (=> (and (and (= (type Heap@@26) (MapType0Type RefType)) (= (type Mask@@15) (MapType1Type RefType realType))) (state Heap@@26 Mask@@15)) (= (|f4'| Heap@@26 i@@10) (|f4#frame| EmptyFrame i@@10)))
 :qid |stdinbpl.399:15|
 :skolemid |35|
 :pattern ( (state Heap@@26 Mask@@15) (|f4'| Heap@@26 i@@10))
)))
(assert (forall ((Heap@@27 T@U) (Mask@@16 T@U) (i@@11 Int) ) (!  (=> (and (and (= (type Heap@@27) (MapType0Type RefType)) (= (type Mask@@16) (MapType1Type RefType realType))) (state Heap@@27 Mask@@16)) (= (|f5'| Heap@@27 i@@11) (|f5#frame| EmptyFrame i@@11)))
 :qid |stdinbpl.448:15|
 :skolemid |39|
 :pattern ( (state Heap@@27 Mask@@16) (|f5'| Heap@@27 i@@11))
)))
(assert (forall ((o T@U) (f T@U) (Heap@@28 T@U) ) (!  (=> (and (and (and (= (type o) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap@@28) (MapType0Type RefType))) (U_2_bool (MapType0Select Heap@@28 o $allocated))) (U_2_bool (MapType0Select Heap@@28 (MapType0Select Heap@@28 o f) $allocated)))
 :qid |stdinbpl.31:15|
 :skolemid |0|
 :pattern ( (MapType0Select Heap@@28 o f))
)))
(assert (forall ((xs@@7 T@U) ) (!  (=> (= (type xs@@7) RefType) (= (PredicateMaskField (list xs@@7)) (|list#sm| xs@@7)))
 :qid |stdinbpl.629:15|
 :skolemid |48|
 :pattern ( (PredicateMaskField (list xs@@7)))
)))
(assert (forall ((Heap@@29 T@U) (o@@0 T@U) (f_3 T@U) (v T@U) ) (! (let ((B@@8 (type v)))
(let ((A@@9 (FieldTypeInv0 (type f_3))))
 (=> (and (and (= (type Heap@@29) (MapType0Type RefType)) (= (type o@@0) RefType)) (= (type f_3) (FieldType A@@9 B@@8))) (succHeap Heap@@29 (MapType0Store Heap@@29 o@@0 f_3 v)))))
 :qid |stdinbpl.78:22|
 :skolemid |9|
 :pattern ( (MapType0Store Heap@@29 o@@0 f_3 v))
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
 :qid |stdinbpl.173:25|
 :skolemid |20|
 :pattern ( (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))
)))
(assert (forall ((Heap@@30 T@U) (Mask@@17 T@U) (xs@@8 T@U) (x@@11 Int) ) (!  (=> (and (and (and (= (type Heap@@30) (MapType0Type RefType)) (= (type Mask@@17) (MapType1Type RefType realType))) (= (type xs@@8) RefType)) (state Heap@@30 Mask@@17)) (= (|f6'| Heap@@30 xs@@8 x@@11) (|f6#frame| (MapType0Select Heap@@30 null (list xs@@8)) xs@@8 x@@11)))
 :qid |stdinbpl.497:15|
 :skolemid |43|
 :pattern ( (state Heap@@30 Mask@@17) (|f6'| Heap@@30 xs@@8 x@@11))
)))
(assert (forall ((Heap@@31 T@U) (Mask@@18 T@U) (i@@12 Int) ) (!  (=> (and (and (= (type Heap@@31) (MapType0Type RefType)) (= (type Mask@@18) (MapType1Type RefType realType))) (and (state Heap@@31 Mask@@18) (< AssumeFunctionsAbove 0))) (= (f5 Heap@@31 i@@12) 7))
 :qid |stdinbpl.441:15|
 :skolemid |38|
 :pattern ( (state Heap@@31 Mask@@18) (f5 Heap@@31 i@@12))
)))
(assert (forall ((Heap@@32 T@U) (Mask@@19 T@U) (i@@13 Int) ) (!  (=> (and (and (= (type Heap@@32) (MapType0Type RefType)) (= (type Mask@@19) (MapType1Type RefType realType))) (and (state Heap@@32 Mask@@19) (< AssumeFunctionsAbove 3))) (= (f3 Heap@@32 i@@13) 1))
 :qid |stdinbpl.343:15|
 :skolemid |30|
 :pattern ( (state Heap@@32 Mask@@19) (f3 Heap@@32 i@@13))
)))
(assert (forall ((Heap@@33 T@U) (Mask@@20 T@U) (i@@14 Int) ) (!  (=> (and (and (= (type Heap@@33) (MapType0Type RefType)) (= (type Mask@@20) (MapType1Type RefType realType))) (and (state Heap@@33 Mask@@20) (< AssumeFunctionsAbove 4))) (= (f4 Heap@@33 i@@14) 1))
 :qid |stdinbpl.392:15|
 :skolemid |34|
 :pattern ( (state Heap@@33 Mask@@20) (f4 Heap@@33 i@@14))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun i@@15 () Int)
(declare-fun Heap@@34 () T@U)
(assert (= (type Heap@@34) (MapType0Type RefType)))
(set-info :boogie-vc-id f1_termination_proof)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 25) (let ((anon21_Then_correct  (=> (= (ControlFlow 0 14) (- 0 13)) (>= (- i@@15 3) 0))))
(let ((anon15_correct true))
(let ((anon14_correct  (=> (and (state Heap@@34 ZeroMask) (= (ControlFlow 0 7) 5)) anon15_correct)))
(let ((anon22_Else_correct  (=> (not (or (< (f1 Heap@@34 (- i@@15 1)) 4) (< (f1 Heap@@34 (- i@@15 3)) 6))) (and (=> (= (ControlFlow 0 9) (- 0 11)) (decreasing (int_2_U (- i@@15 1)) (int_2_U i@@15))) (=> (decreasing (int_2_U (- i@@15 1)) (int_2_U i@@15)) (and (=> (= (ControlFlow 0 9) (- 0 10)) (bounded (int_2_U i@@15))) (=> (bounded (int_2_U i@@15)) (=> (and (state Heap@@34 ZeroMask) (= (ControlFlow 0 9) 7)) anon14_correct))))))))
(let ((anon22_Then_correct  (=> (and (or (< (f1 Heap@@34 (- i@@15 1)) 4) (< (f1 Heap@@34 (- i@@15 3)) 6)) (= (ControlFlow 0 8) 7)) anon14_correct)))
(let ((anon20_Then_correct  (=> (not (< (f1 Heap@@34 (- i@@15 1)) 4)) (and (and (=> (= (ControlFlow 0 15) 14) anon21_Then_correct) (=> (= (ControlFlow 0 15) 8) anon22_Then_correct)) (=> (= (ControlFlow 0 15) 9) anon22_Else_correct)))))
(let ((anon20_Else_correct  (=> (< (f1 Heap@@34 (- i@@15 1)) 4) (and (=> (= (ControlFlow 0 12) 8) anon22_Then_correct) (=> (= (ControlFlow 0 12) 9) anon22_Else_correct)))))
(let ((anon16_Then_correct  (=> (and (< i@@15 10) (= (ControlFlow 0 6) 5)) anon15_correct)))
(let ((anon19_Then_correct  (=> (= (ControlFlow 0 4) (- 0 3)) (>= (- i@@15 1) 0))))
(let ((anon6_correct  (=> (state Heap@@34 ZeroMask) (and (and (=> (= (ControlFlow 0 16) 4) anon19_Then_correct) (=> (= (ControlFlow 0 16) 15) anon20_Then_correct)) (=> (= (ControlFlow 0 16) 12) anon20_Else_correct)))))
(let ((anon18_Else_correct  (=> (and (> 4 (f1 Heap@@34 (- i@@15 1))) (= (ControlFlow 0 20) 16)) anon6_correct)))
(let ((anon18_Then_correct  (=> (>= (f1 Heap@@34 (- i@@15 1)) 4) (and (=> (= (ControlFlow 0 17) (- 0 19)) (decreasing (int_2_U (- i@@15 3)) (int_2_U i@@15))) (=> (decreasing (int_2_U (- i@@15 3)) (int_2_U i@@15)) (and (=> (= (ControlFlow 0 17) (- 0 18)) (bounded (int_2_U i@@15))) (=> (bounded (int_2_U i@@15)) (=> (and (state Heap@@34 ZeroMask) (= (ControlFlow 0 17) 16)) anon6_correct))))))))
(let ((anon17_Then_correct  (=> (= (ControlFlow 0 2) (- 0 1)) (>= (- i@@15 1) 0))))
(let ((anon16_Else_correct  (=> (<= 10 i@@15) (and (=> (= (ControlFlow 0 21) (- 0 23)) (decreasing (int_2_U (- i@@15 1)) (int_2_U i@@15))) (=> (decreasing (int_2_U (- i@@15 1)) (int_2_U i@@15)) (and (=> (= (ControlFlow 0 21) (- 0 22)) (bounded (int_2_U i@@15))) (=> (bounded (int_2_U i@@15)) (=> (state Heap@@34 ZeroMask) (and (and (=> (= (ControlFlow 0 21) 2) anon17_Then_correct) (=> (= (ControlFlow 0 21) 17) anon18_Then_correct)) (=> (= (ControlFlow 0 21) 20) anon18_Else_correct))))))))))
(let ((anon0_correct  (=> (and (and (state Heap@@34 ZeroMask) (= AssumeFunctionsAbove (- 0 1))) (and (>= i@@15 0) (state Heap@@34 ZeroMask))) (and (=> (= (ControlFlow 0 24) 6) anon16_Then_correct) (=> (= (ControlFlow 0 24) 21) anon16_Else_correct)))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 25) 24) anon0_correct)))
PreconditionGeneratedEntry_correct)))))))))))))))))
))
(check-sat)
(pop 1)
; Valid
(get-info :rlimit)
