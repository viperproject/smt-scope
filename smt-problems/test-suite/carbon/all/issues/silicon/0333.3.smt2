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
(declare-fun l () T@U)
(declare-fun r_1 () T@U)
(declare-fun FieldType (T@T T@T) T@T)
(declare-fun FieldTypeInv0 (T@T) T@T)
(declare-fun FieldTypeInv1 (T@T) T@T)
(declare-fun NormalFieldType () T@T)
(declare-fun RefType () T@T)
(declare-fun state (T@U T@U) Bool)
(declare-fun I2 (T@U T@U) Bool)
(declare-fun |I2#triggerStateless| (T@U) Bool)
(declare-fun |I#trigger| (T@U T@U) Bool)
(declare-fun I (T@U) T@U)
(declare-fun MapType0Type (T@T) T@T)
(declare-fun MapType1Type (T@T T@T) T@T)
(declare-fun AssumeFunctionsAbove () Int)
(declare-fun null () T@U)
(declare-fun |I2'| (T@U T@U) Bool)
(declare-fun p (T@U) Bool)
(declare-fun MapType0Select (T@U T@U T@U) T@U)
(declare-fun MapType0TypeInv0 (T@T) T@T)
(declare-fun MapType0Store (T@U T@U T@U T@U) T@U)
(declare-fun MapType1TypeInv0 (T@T) T@T)
(declare-fun MapType1TypeInv1 (T@T) T@T)
(declare-fun MapType1Select (T@U T@U T@U) T@U)
(declare-fun MapType1Store (T@U T@U T@U T@U) T@U)
(declare-fun PredicateType_IType () T@T)
(declare-fun FrameTypeType () T@T)
(declare-fun succHeap (T@U T@U) Bool)
(declare-fun succHeapTrans (T@U T@U) Bool)
(declare-fun GoodMask (T@U) Bool)
(declare-fun IdenticalOnKnownLocations (T@U T@U T@U) Bool)
(declare-fun IsPredicateField (T@U) Bool)
(declare-fun PredicateMaskField (T@U) T@U)
(declare-fun HasDirectPerm (T@U T@U T@U) Bool)
(declare-fun IsWandField (T@U) Bool)
(declare-fun WandMaskField (T@U) T@U)
(declare-fun dummyFunction (T@U) Bool)
(declare-fun |I#everUsed| (T@U) Bool)
(declare-fun |I#sm| (T@U) T@U)
(declare-fun dummyHeap () T@U)
(declare-fun ZeroMask () T@U)
(declare-fun InsidePredicate (T@U T@U T@U T@U) Bool)
(declare-fun sumMask (T@U T@U T@U) Bool)
(declare-fun ConditionalFrame (Real T@U) T@U)
(declare-fun EmptyFrame () T@U)
(declare-fun NoPerm () Real)
(declare-fun |I2#frame| (T@U T@U) Bool)
(declare-fun |p'| (T@U) Bool)
(declare-fun |p#frame| (T@U) Bool)
(declare-fun getPredWandId (T@U) Int)
(declare-fun FullPerm () Real)
(declare-fun |p#triggerStateless| () Bool)
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
))) (= (Ctor NormalFieldType) 7)) (= (type $allocated) (FieldType NormalFieldType boolType))) (= (Ctor RefType) 8)) (= (type l) (FieldType NormalFieldType RefType))) (= (type r_1) (FieldType NormalFieldType RefType))))
(assert (distinct $allocated l r_1)
)
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (forall ((arg0@@14 T@T) ) (! (= (Ctor (MapType0Type arg0@@14)) 9)
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
)))) (forall ((arg0@@18 T@T) (arg1@@4 T@T) ) (! (= (Ctor (MapType1Type arg0@@18 arg1@@4)) 10)
 :qid |ctor:MapType1Type|
))) (forall ((arg0@@19 T@T) (arg1@@5 T@T) ) (! (= (MapType1TypeInv0 (MapType1Type arg0@@19 arg1@@5)) arg0@@19)
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
)))) (= (Ctor PredicateType_IType) 11)) (= (Ctor FrameTypeType) 12)) (forall ((arg0@@23 T@U) ) (! (= (type (I arg0@@23)) (FieldType PredicateType_IType FrameTypeType))
 :qid |funType:I|
 :pattern ( (I arg0@@23))
))) (= (type null) RefType)))
(assert (forall ((Heap T@U) (Mask T@U) (t_1 T@U) ) (!  (=> (and (and (and (= (type Heap) (MapType0Type RefType)) (= (type Mask) (MapType1Type RefType realType))) (= (type t_1) RefType)) (and (state Heap Mask) (< AssumeFunctionsAbove 0))) (= (I2 Heap t_1)  (=> (not (= t_1 null)) (and (|I2'| Heap (ite (p Heap) (MapType0Select Heap t_1 r_1) (MapType0Select Heap t_1 l))) (|I2'| Heap (ite (p Heap) (MapType0Select Heap t_1 l) (MapType0Select Heap t_1 r_1)))))))
 :qid |stdinbpl.247:15|
 :skolemid |27|
 :pattern ( (state Heap Mask) (I2 Heap t_1))
 :pattern ( (state Heap Mask) (|I2#triggerStateless| t_1) (|I#trigger| Heap (I t_1)) (|I#trigger| Heap (I t_1)))
)))
(assert (forall ((Heap0 T@U) (Heap1 T@U) ) (!  (=> (and (and (= (type Heap0) (MapType0Type RefType)) (= (type Heap1) (MapType0Type RefType))) (succHeap Heap0 Heap1)) (succHeapTrans Heap0 Heap1))
 :qid |stdinbpl.88:15|
 :skolemid |11|
 :pattern ( (succHeap Heap0 Heap1))
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
(assert (forall ((arg0@@24 T@U) ) (! (let ((A (FieldTypeInv0 (type arg0@@24))))
(= (type (PredicateMaskField arg0@@24)) (FieldType A (MapType1Type RefType boolType))))
 :qid |funType:PredicateMaskField|
 :pattern ( (PredicateMaskField arg0@@24))
)))
(assert (forall ((Heap@@1 T@U) (ExhaleHeap T@U) (Mask@@1 T@U) (pm_f T@U) ) (! (let ((C (FieldTypeInv0 (type pm_f))))
 (=> (and (and (and (and (and (= (type Heap@@1) (MapType0Type RefType)) (= (type ExhaleHeap) (MapType0Type RefType))) (= (type Mask@@1) (MapType1Type RefType realType))) (= (type pm_f) (FieldType C FrameTypeType))) (IdenticalOnKnownLocations Heap@@1 ExhaleHeap Mask@@1)) (and (HasDirectPerm Mask@@1 null pm_f) (IsPredicateField pm_f))) (= (MapType0Select Heap@@1 null (PredicateMaskField pm_f)) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))))
 :qid |stdinbpl.47:19|
 :skolemid |2|
 :pattern ( (IdenticalOnKnownLocations Heap@@1 ExhaleHeap Mask@@1) (IsPredicateField pm_f) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))
)))
(assert (forall ((arg0@@25 T@U) ) (! (let ((A@@0 (FieldTypeInv0 (type arg0@@25))))
(= (type (WandMaskField arg0@@25)) (FieldType A@@0 (MapType1Type RefType boolType))))
 :qid |funType:WandMaskField|
 :pattern ( (WandMaskField arg0@@25))
)))
(assert (forall ((Heap@@2 T@U) (ExhaleHeap@@0 T@U) (Mask@@2 T@U) (pm_f@@0 T@U) ) (! (let ((C@@0 (FieldTypeInv0 (type pm_f@@0))))
 (=> (and (and (and (and (and (= (type Heap@@2) (MapType0Type RefType)) (= (type ExhaleHeap@@0) (MapType0Type RefType))) (= (type Mask@@2) (MapType1Type RefType realType))) (= (type pm_f@@0) (FieldType C@@0 FrameTypeType))) (IdenticalOnKnownLocations Heap@@2 ExhaleHeap@@0 Mask@@2)) (and (HasDirectPerm Mask@@2 null pm_f@@0) (IsWandField pm_f@@0))) (= (MapType0Select Heap@@2 null (WandMaskField pm_f@@0)) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))))
 :qid |stdinbpl.60:19|
 :skolemid |5|
 :pattern ( (IdenticalOnKnownLocations Heap@@2 ExhaleHeap@@0 Mask@@2) (IsWandField pm_f@@0) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))
)))
(assert (forall ((t_1@@0 T@U) ) (!  (=> (= (type t_1@@0) RefType) (IsPredicateField (I t_1@@0)))
 :qid |stdinbpl.466:15|
 :skolemid |34|
 :pattern ( (I t_1@@0))
)))
(assert (forall ((Heap@@3 T@U) (t_1@@1 T@U) ) (!  (=> (and (= (type Heap@@3) (MapType0Type RefType)) (= (type t_1@@1) RefType)) (dummyFunction (bool_2_U (|I2#triggerStateless| t_1@@1))))
 :qid |stdinbpl.241:15|
 :skolemid |26|
 :pattern ( (|I2'| Heap@@3 t_1@@1))
)))
(assert (forall ((Heap@@4 T@U) (t_1@@2 T@U) ) (!  (=> (and (= (type Heap@@4) (MapType0Type RefType)) (= (type t_1@@2) RefType)) (|I#everUsed| (I t_1@@2)))
 :qid |stdinbpl.485:15|
 :skolemid |38|
 :pattern ( (|I#trigger| Heap@@4 (I t_1@@2)))
)))
(assert (forall ((Heap@@5 T@U) (ExhaleHeap@@1 T@U) (Mask@@3 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@5) (MapType0Type RefType)) (= (type ExhaleHeap@@1) (MapType0Type RefType))) (= (type Mask@@3) (MapType1Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@5 ExhaleHeap@@1 Mask@@3)) (U_2_bool (MapType0Select Heap@@5 o_1 $allocated))) (U_2_bool (MapType0Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.73:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@5 ExhaleHeap@@1 Mask@@3) (MapType0Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert (forall ((t_1@@3 T@U) (t2 T@U) ) (!  (=> (and (and (= (type t_1@@3) RefType) (= (type t2) RefType)) (= (I t_1@@3) (I t2))) (= t_1@@3 t2))
 :qid |stdinbpl.476:15|
 :skolemid |36|
 :pattern ( (I t_1@@3) (I t2))
)))
(assert (forall ((arg0@@26 T@U) ) (! (= (type (|I#sm| arg0@@26)) (FieldType PredicateType_IType (MapType1Type RefType boolType)))
 :qid |funType:I#sm|
 :pattern ( (|I#sm| arg0@@26))
)))
(assert (forall ((t_1@@4 T@U) (t2@@0 T@U) ) (!  (=> (and (and (= (type t_1@@4) RefType) (= (type t2@@0) RefType)) (= (|I#sm| t_1@@4) (|I#sm| t2@@0))) (= t_1@@4 t2@@0))
 :qid |stdinbpl.480:15|
 :skolemid |37|
 :pattern ( (|I#sm| t_1@@4) (|I#sm| t2@@0))
)))
(assert (forall ((Heap@@6 T@U) (ExhaleHeap@@2 T@U) (Mask@@4 T@U) (o_1@@0 T@U) (f_2 T@U) ) (! (let ((B@@1 (FieldTypeInv1 (type f_2))))
(let ((A@@1 (FieldTypeInv0 (type f_2))))
 (=> (and (and (and (and (and (and (= (type Heap@@6) (MapType0Type RefType)) (= (type ExhaleHeap@@2) (MapType0Type RefType))) (= (type Mask@@4) (MapType1Type RefType realType))) (= (type o_1@@0) RefType)) (= (type f_2) (FieldType A@@1 B@@1))) (IdenticalOnKnownLocations Heap@@6 ExhaleHeap@@2 Mask@@4)) (HasDirectPerm Mask@@4 o_1@@0 f_2)) (= (MapType0Select Heap@@6 o_1@@0 f_2) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2)))))
 :qid |stdinbpl.42:22|
 :skolemid |1|
 :pattern ( (IdenticalOnKnownLocations Heap@@6 ExhaleHeap@@2 Mask@@4) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2))
)))
(assert  (and (= (type dummyHeap) (MapType0Type RefType)) (= (type ZeroMask) (MapType1Type RefType realType))))
(assert (state dummyHeap ZeroMask))
(assert (forall ((p@@0 T@U) (v_1 T@U) (w T@U) ) (! (let ((A@@2 (FieldTypeInv0 (type p@@0))))
 (=> (and (and (= (type p@@0) (FieldType A@@2 FrameTypeType)) (= (type v_1) FrameTypeType)) (= (type w) FrameTypeType)) (not (InsidePredicate p@@0 v_1 p@@0 w))))
 :qid |stdinbpl.174:19|
 :skolemid |21|
 :pattern ( (InsidePredicate p@@0 v_1 p@@0 w))
)))
(assert  (not (IsPredicateField l)))
(assert  (not (IsWandField l)))
(assert  (not (IsPredicateField r_1)))
(assert  (not (IsWandField r_1)))
(assert (forall ((Heap@@7 T@U) (ExhaleHeap@@3 T@U) (Mask@@5 T@U) ) (!  (=> (and (and (and (= (type Heap@@7) (MapType0Type RefType)) (= (type ExhaleHeap@@3) (MapType0Type RefType))) (= (type Mask@@5) (MapType1Type RefType realType))) (IdenticalOnKnownLocations Heap@@7 ExhaleHeap@@3 Mask@@5)) (succHeap Heap@@7 ExhaleHeap@@3))
 :qid |stdinbpl.83:15|
 :skolemid |10|
 :pattern ( (IdenticalOnKnownLocations Heap@@7 ExhaleHeap@@3 Mask@@5))
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
(assert  (and (forall ((arg0@@27 Real) (arg1@@9 T@U) ) (! (= (type (ConditionalFrame arg0@@27 arg1@@9)) FrameTypeType)
 :qid |funType:ConditionalFrame|
 :pattern ( (ConditionalFrame arg0@@27 arg1@@9))
)) (= (type EmptyFrame) FrameTypeType)))
(assert (forall ((p@@1 Real) (f_6 T@U) ) (!  (=> (= (type f_6) FrameTypeType) (= (ConditionalFrame p@@1 f_6) (ite (> p@@1 0.0) f_6 EmptyFrame)))
 :qid |stdinbpl.162:15|
 :skolemid |19|
 :pattern ( (ConditionalFrame p@@1 f_6))
)))
(assert (forall ((Mask@@6 T@U) (o_2@@0 T@U) (f_4@@0 T@U) ) (! (let ((B@@3 (FieldTypeInv1 (type f_4@@0))))
(let ((A@@4 (FieldTypeInv0 (type f_4@@0))))
 (=> (and (and (= (type Mask@@6) (MapType1Type RefType realType)) (= (type o_2@@0) RefType)) (= (type f_4@@0) (FieldType A@@4 B@@3))) (= (HasDirectPerm Mask@@6 o_2@@0 f_4@@0) (> (U_2_real (MapType1Select Mask@@6 o_2@@0 f_4@@0)) NoPerm)))))
 :qid |stdinbpl.133:22|
 :skolemid |17|
 :pattern ( (HasDirectPerm Mask@@6 o_2@@0 f_4@@0))
)))
(assert (forall ((o_2@@1 T@U) (f_4@@1 T@U) ) (! (let ((B@@4 (FieldTypeInv1 (type f_4@@1))))
(let ((A@@5 (FieldTypeInv0 (type f_4@@1))))
 (=> (and (= (type o_2@@1) RefType) (= (type f_4@@1) (FieldType A@@5 B@@4))) (= (U_2_real (MapType1Select ZeroMask o_2@@1 f_4@@1)) NoPerm))))
 :qid |stdinbpl.106:22|
 :skolemid |13|
 :pattern ( (MapType1Select ZeroMask o_2@@1 f_4@@1))
)))
(assert (forall ((Heap@@8 T@U) (Mask@@7 T@U) (t_1@@5 T@U) ) (!  (=> (and (and (and (= (type Heap@@8) (MapType0Type RefType)) (= (type Mask@@7) (MapType1Type RefType realType))) (= (type t_1@@5) RefType)) (state Heap@@8 Mask@@7)) (= (|I2'| Heap@@8 t_1@@5) (|I2#frame| (MapType0Select Heap@@8 null (I t_1@@5)) t_1@@5)))
 :qid |stdinbpl.254:15|
 :skolemid |28|
 :pattern ( (state Heap@@8 Mask@@7) (|I2'| Heap@@8 t_1@@5))
 :pattern ( (state Heap@@8 Mask@@7) (|I2#triggerStateless| t_1@@5) (|I#trigger| Heap@@8 (I t_1@@5)) (|I#trigger| Heap@@8 (I t_1@@5)))
)))
(assert (forall ((Heap@@9 T@U) (t_1@@6 T@U) ) (!  (=> (and (= (type Heap@@9) (MapType0Type RefType)) (= (type t_1@@6) RefType)) (and (= (I2 Heap@@9 t_1@@6) (|I2'| Heap@@9 t_1@@6)) (dummyFunction (bool_2_U (|I2#triggerStateless| t_1@@6)))))
 :qid |stdinbpl.237:15|
 :skolemid |25|
 :pattern ( (I2 Heap@@9 t_1@@6))
)))
(assert (forall ((Heap@@10 T@U) (Mask@@8 T@U) ) (!  (=> (and (and (= (type Heap@@10) (MapType0Type RefType)) (= (type Mask@@8) (MapType1Type RefType realType))) (state Heap@@10 Mask@@8)) (= (|p'| Heap@@10) (|p#frame| EmptyFrame)))
 :qid |stdinbpl.208:15|
 :skolemid |24|
 :pattern ( (state Heap@@10 Mask@@8) (|p'| Heap@@10))
)))
(assert (forall ((Heap@@11 T@U) (ExhaleHeap@@4 T@U) (Mask@@9 T@U) (pm_f@@1 T@U) ) (! (let ((C@@1 (FieldTypeInv0 (type pm_f@@1))))
 (=> (and (and (and (and (and (= (type Heap@@11) (MapType0Type RefType)) (= (type ExhaleHeap@@4) (MapType0Type RefType))) (= (type Mask@@9) (MapType1Type RefType realType))) (= (type pm_f@@1) (FieldType C@@1 FrameTypeType))) (IdenticalOnKnownLocations Heap@@11 ExhaleHeap@@4 Mask@@9)) (and (HasDirectPerm Mask@@9 null pm_f@@1) (IsPredicateField pm_f@@1))) (forall ((o2 T@U) (f_2@@0 T@U) ) (! (let ((B@@5 (FieldTypeInv1 (type f_2@@0))))
(let ((A@@6 (FieldTypeInv0 (type f_2@@0))))
 (=> (and (and (= (type o2) RefType) (= (type f_2@@0) (FieldType A@@6 B@@5))) (U_2_bool (MapType1Select (MapType0Select Heap@@11 null (PredicateMaskField pm_f@@1)) o2 f_2@@0))) (= (MapType0Select Heap@@11 o2 f_2@@0) (MapType0Select ExhaleHeap@@4 o2 f_2@@0)))))
 :qid |stdinbpl.54:134|
 :skolemid |3|
 :pattern ( (MapType0Select ExhaleHeap@@4 o2 f_2@@0))
))))
 :qid |stdinbpl.52:19|
 :skolemid |4|
 :pattern ( (IdenticalOnKnownLocations Heap@@11 ExhaleHeap@@4 Mask@@9) (IsPredicateField pm_f@@1))
)))
(assert (forall ((Heap@@12 T@U) (ExhaleHeap@@5 T@U) (Mask@@10 T@U) (pm_f@@2 T@U) ) (! (let ((C@@2 (FieldTypeInv0 (type pm_f@@2))))
 (=> (and (and (and (and (and (= (type Heap@@12) (MapType0Type RefType)) (= (type ExhaleHeap@@5) (MapType0Type RefType))) (= (type Mask@@10) (MapType1Type RefType realType))) (= (type pm_f@@2) (FieldType C@@2 FrameTypeType))) (IdenticalOnKnownLocations Heap@@12 ExhaleHeap@@5 Mask@@10)) (and (HasDirectPerm Mask@@10 null pm_f@@2) (IsWandField pm_f@@2))) (forall ((o2@@0 T@U) (f_2@@1 T@U) ) (! (let ((B@@6 (FieldTypeInv1 (type f_2@@1))))
(let ((A@@7 (FieldTypeInv0 (type f_2@@1))))
 (=> (and (and (= (type o2@@0) RefType) (= (type f_2@@1) (FieldType A@@7 B@@6))) (U_2_bool (MapType1Select (MapType0Select Heap@@12 null (WandMaskField pm_f@@2)) o2@@0 f_2@@1))) (= (MapType0Select Heap@@12 o2@@0 f_2@@1) (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1)))))
 :qid |stdinbpl.67:129|
 :skolemid |6|
 :pattern ( (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1))
))))
 :qid |stdinbpl.65:19|
 :skolemid |7|
 :pattern ( (IdenticalOnKnownLocations Heap@@12 ExhaleHeap@@5 Mask@@10) (IsWandField pm_f@@2))
)))
(assert (forall ((t_1@@7 T@U) ) (!  (=> (= (type t_1@@7) RefType) (= (getPredWandId (I t_1@@7)) 0))
 :qid |stdinbpl.470:15|
 :skolemid |35|
 :pattern ( (I t_1@@7))
)))
(assert (forall ((Mask@@11 T@U) (o_2@@2 T@U) (f_4@@2 T@U) ) (! (let ((B@@7 (FieldTypeInv1 (type f_4@@2))))
(let ((A@@8 (FieldTypeInv0 (type f_4@@2))))
 (=> (and (and (and (= (type Mask@@11) (MapType1Type RefType realType)) (= (type o_2@@2) RefType)) (= (type f_4@@2) (FieldType A@@8 B@@7))) (GoodMask Mask@@11)) (and (>= (U_2_real (MapType1Select Mask@@11 o_2@@2 f_4@@2)) NoPerm) (=> (and (and (GoodMask Mask@@11) (not (IsPredicateField f_4@@2))) (not (IsWandField f_4@@2))) (<= (U_2_real (MapType1Select Mask@@11 o_2@@2 f_4@@2)) FullPerm))))))
 :qid |stdinbpl.128:22|
 :skolemid |16|
 :pattern ( (GoodMask Mask@@11) (MapType1Select Mask@@11 o_2@@2 f_4@@2))
)))
(assert (forall ((Heap@@13 T@U) ) (!  (=> (= (type Heap@@13) (MapType0Type RefType)) (dummyFunction (bool_2_U |p#triggerStateless|)))
 :qid |stdinbpl.201:15|
 :skolemid |23|
 :pattern ( (|p'| Heap@@13))
)))
(assert (forall ((o T@U) (f T@U) (Heap@@14 T@U) ) (!  (=> (and (and (and (= (type o) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap@@14) (MapType0Type RefType))) (U_2_bool (MapType0Select Heap@@14 o $allocated))) (U_2_bool (MapType0Select Heap@@14 (MapType0Select Heap@@14 o f) $allocated)))
 :qid |stdinbpl.31:15|
 :skolemid |0|
 :pattern ( (MapType0Select Heap@@14 o f))
)))
(assert (forall ((t_1@@8 T@U) ) (!  (=> (= (type t_1@@8) RefType) (= (PredicateMaskField (I t_1@@8)) (|I#sm| t_1@@8)))
 :qid |stdinbpl.462:15|
 :skolemid |33|
 :pattern ( (PredicateMaskField (I t_1@@8)))
)))
(assert (forall ((Heap@@15 T@U) (o@@0 T@U) (f_3 T@U) (v T@U) ) (! (let ((B@@8 (type v)))
(let ((A@@9 (FieldTypeInv0 (type f_3))))
 (=> (and (and (= (type Heap@@15) (MapType0Type RefType)) (= (type o@@0) RefType)) (= (type f_3) (FieldType A@@9 B@@8))) (succHeap Heap@@15 (MapType0Store Heap@@15 o@@0 f_3 v)))))
 :qid |stdinbpl.78:22|
 :skolemid |9|
 :pattern ( (MapType0Store Heap@@15 o@@0 f_3 v))
)))
(assert (= (type ZeroPMask) (MapType1Type RefType boolType)))
(assert (forall ((o_2@@3 T@U) (f_4@@3 T@U) ) (! (let ((B@@9 (FieldTypeInv1 (type f_4@@3))))
(let ((A@@10 (FieldTypeInv0 (type f_4@@3))))
 (=> (and (= (type o_2@@3) RefType) (= (type f_4@@3) (FieldType A@@10 B@@9))) (not (U_2_bool (MapType1Select ZeroPMask o_2@@3 f_4@@3))))))
 :qid |stdinbpl.112:22|
 :skolemid |14|
 :pattern ( (MapType1Select ZeroPMask o_2@@3 f_4@@3))
)))
(assert (forall ((p@@2 T@U) (v_1@@0 T@U) (q T@U) (w@@0 T@U) (r T@U) (u T@U) ) (! (let ((C@@3 (FieldTypeInv0 (type r))))
(let ((B@@10 (FieldTypeInv0 (type q))))
(let ((A@@11 (FieldTypeInv0 (type p@@2))))
 (=> (and (and (and (and (and (and (= (type p@@2) (FieldType A@@11 FrameTypeType)) (= (type v_1@@0) FrameTypeType)) (= (type q) (FieldType B@@10 FrameTypeType))) (= (type w@@0) FrameTypeType)) (= (type r) (FieldType C@@3 FrameTypeType))) (= (type u) FrameTypeType)) (and (InsidePredicate p@@2 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))) (InsidePredicate p@@2 v_1@@0 r u)))))
 :qid |stdinbpl.169:25|
 :skolemid |20|
 :pattern ( (InsidePredicate p@@2 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))
)))
(assert (forall ((Heap@@16 T@U) ) (!  (=> (= (type Heap@@16) (MapType0Type RefType)) (and (= (p Heap@@16) (|p'| Heap@@16)) (dummyFunction (bool_2_U |p#triggerStateless|))))
 :qid |stdinbpl.197:15|
 :skolemid |22|
 :pattern ( (p Heap@@16))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun UnfoldingMask@7 () T@U)
(declare-fun up_1@0 () T@U)
(declare-fun dn_1@0 () T@U)
(declare-fun Heap@1 () T@U)
(declare-fun newPMask@2 () T@U)
(declare-fun t_1@@9 () T@U)
(declare-fun Heap@4 () T@U)
(declare-fun newPMask@3 () T@U)
(declare-fun Heap@5 () T@U)
(declare-fun Heap@6 () T@U)
(declare-fun newPMask@0 () T@U)
(declare-fun Heap@2 () T@U)
(declare-fun newPMask@1 () T@U)
(declare-fun Heap@3 () T@U)
(declare-fun Heap@0 () T@U)
(declare-fun Heap@@17 () T@U)
(declare-fun |I2#trigger| (T@U T@U) Bool)
(declare-fun UnfoldingMask@5 () T@U)
(declare-fun UnfoldingMask@2 () T@U)
(declare-fun UnfoldingMask@6 () T@U)
(declare-fun UnfoldingMask@3 () T@U)
(declare-fun UnfoldingMask@4 () T@U)
(declare-fun UnfoldingMask@1 () T@U)
(declare-fun UnfoldingMask@0 () T@U)
(declare-fun Mask@0 () T@U)
(declare-fun FrameFragment (T@U) T@U)
(declare-fun CombineFrames (T@U T@U) T@U)
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (= (type t_1@@9) RefType) (= (type Heap@6) (MapType0Type RefType))) (= (type Heap@@17) (MapType0Type RefType))) (= (type Heap@1) (MapType0Type RefType))) (= (type newPMask@0) (MapType1Type RefType boolType))) (= (type Heap@2) (MapType0Type RefType))) (= (type newPMask@1) (MapType1Type RefType boolType))) (= (type Heap@3) (MapType0Type RefType))) (= (type newPMask@2) (MapType1Type RefType boolType))) (= (type Heap@4) (MapType0Type RefType))) (= (type newPMask@3) (MapType1Type RefType boolType))) (= (type Heap@5) (MapType0Type RefType))) (= (type Heap@0) (MapType0Type RefType))) (= (type UnfoldingMask@7) (MapType1Type RefType realType))) (= (type dn_1@0) RefType)) (= (type up_1@0) RefType)) (= (type UnfoldingMask@0) (MapType1Type RefType realType))) (= (type UnfoldingMask@3) (MapType1Type RefType realType))) (= (type UnfoldingMask@2) (MapType1Type RefType realType))) (= (type UnfoldingMask@4) (MapType1Type RefType realType))) (= (type UnfoldingMask@5) (MapType1Type RefType realType))) (= (type UnfoldingMask@6) (MapType1Type RefType realType))) (= (type UnfoldingMask@1) (MapType1Type RefType realType))) (= (type Mask@0) (MapType1Type RefType realType))) (forall ((arg0@@28 T@U) ) (! (= (type (FrameFragment arg0@@28)) FrameTypeType)
 :qid |funType:FrameFragment|
 :pattern ( (FrameFragment arg0@@28))
))) (forall ((arg0@@29 T@U) (arg1@@10 T@U) ) (! (= (type (CombineFrames arg0@@29 arg1@@10)) FrameTypeType)
 :qid |funType:CombineFrames|
 :pattern ( (CombineFrames arg0@@29 arg1@@10))
))))
(set-info :boogie-vc-id |I2#definedness|)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 42) (let ((anon26_correct true))
(let ((anon45_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 18) 15)) anon26_correct)))
(let ((anon45_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 16) (- 0 17)) (<= FullPerm (U_2_real (MapType1Select UnfoldingMask@7 null (I up_1@0))))) (=> (<= FullPerm (U_2_real (MapType1Select UnfoldingMask@7 null (I up_1@0)))) (=> (= (ControlFlow 0 16) 15) anon26_correct))))))
(let ((anon20_correct true))
(let ((anon42_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 12) 9)) anon20_correct)))
(let ((anon42_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 10) (- 0 11)) (<= FullPerm (U_2_real (MapType1Select UnfoldingMask@7 null (I dn_1@0))))) (=> (<= FullPerm (U_2_real (MapType1Select UnfoldingMask@7 null (I dn_1@0)))) (=> (= (ControlFlow 0 10) 9) anon20_correct))))))
(let ((anon39_Then_correct true))
(let ((anon37_Then_correct true))
(let ((anon32_correct true))
(let ((anon47_Else_correct  (=> (not (p Heap@1)) (=> (and (forall ((o_5 T@U) (f_9 T@U) ) (! (let ((B@@11 (FieldTypeInv1 (type f_9))))
(let ((A@@12 (FieldTypeInv0 (type f_9))))
 (=> (and (and (= (type o_5) RefType) (= (type f_9) (FieldType A@@12 B@@11))) (or (U_2_bool (MapType1Select (MapType0Select Heap@1 null (|I#sm| t_1@@9)) o_5 f_9)) (U_2_bool (MapType1Select (MapType0Select Heap@1 null (|I#sm| (MapType0Select Heap@1 t_1@@9 r_1))) o_5 f_9)))) (U_2_bool (MapType1Select newPMask@2 o_5 f_9)))))
 :qid |stdinbpl.434:35|
 :skolemid |31|
 :pattern ( (MapType1Select newPMask@2 o_5 f_9))
)) (= Heap@4 (MapType0Store Heap@1 null (|I#sm| t_1@@9) newPMask@2))) (=> (and (and (forall ((o_6 T@U) (f_10 T@U) ) (! (let ((B@@12 (FieldTypeInv1 (type f_10))))
(let ((A@@13 (FieldTypeInv0 (type f_10))))
 (=> (and (and (= (type o_6) RefType) (= (type f_10) (FieldType A@@13 B@@12))) (or (U_2_bool (MapType1Select (MapType0Select Heap@4 null (|I#sm| t_1@@9)) o_6 f_10)) (U_2_bool (MapType1Select (MapType0Select Heap@4 null (|I#sm| (MapType0Select Heap@4 t_1@@9 l))) o_6 f_10)))) (U_2_bool (MapType1Select newPMask@3 o_6 f_10)))))
 :qid |stdinbpl.440:35|
 :skolemid |32|
 :pattern ( (MapType1Select newPMask@3 o_6 f_10))
)) (= Heap@5 (MapType0Store Heap@4 null (|I#sm| t_1@@9) newPMask@3))) (and (= Heap@6 Heap@5) (= (ControlFlow 0 4) 1))) anon32_correct)))))
(let ((anon47_Then_correct  (=> (p Heap@1) (=> (and (forall ((o_3 T@U) (f_7 T@U) ) (! (let ((B@@13 (FieldTypeInv1 (type f_7))))
(let ((A@@14 (FieldTypeInv0 (type f_7))))
 (=> (and (and (= (type o_3) RefType) (= (type f_7) (FieldType A@@14 B@@13))) (or (U_2_bool (MapType1Select (MapType0Select Heap@1 null (|I#sm| t_1@@9)) o_3 f_7)) (U_2_bool (MapType1Select (MapType0Select Heap@1 null (|I#sm| (MapType0Select Heap@1 t_1@@9 r_1))) o_3 f_7)))) (U_2_bool (MapType1Select newPMask@0 o_3 f_7)))))
 :qid |stdinbpl.421:35|
 :skolemid |29|
 :pattern ( (MapType1Select newPMask@0 o_3 f_7))
)) (= Heap@2 (MapType0Store Heap@1 null (|I#sm| t_1@@9) newPMask@0))) (=> (and (and (forall ((o_4 T@U) (f_8 T@U) ) (! (let ((B@@14 (FieldTypeInv1 (type f_8))))
(let ((A@@15 (FieldTypeInv0 (type f_8))))
 (=> (and (and (= (type o_4) RefType) (= (type f_8) (FieldType A@@15 B@@14))) (or (U_2_bool (MapType1Select (MapType0Select Heap@2 null (|I#sm| t_1@@9)) o_4 f_8)) (U_2_bool (MapType1Select (MapType0Select Heap@2 null (|I#sm| (MapType0Select Heap@2 t_1@@9 l))) o_4 f_8)))) (U_2_bool (MapType1Select newPMask@1 o_4 f_8)))))
 :qid |stdinbpl.427:35|
 :skolemid |30|
 :pattern ( (MapType1Select newPMask@1 o_4 f_8))
)) (= Heap@3 (MapType0Store Heap@2 null (|I#sm| t_1@@9) newPMask@1))) (and (= Heap@6 Heap@3) (= (ControlFlow 0 3) 1))) anon32_correct)))))
(let ((anon46_Then_correct  (=> (not (= t_1@@9 null)) (=> (and (= Heap@0 (MapType0Store Heap@@17 null (|I#sm| t_1@@9) (MapType1Store (MapType0Select Heap@@17 null (|I#sm| t_1@@9)) t_1@@9 r_1 (bool_2_U true)))) (= Heap@1 (MapType0Store Heap@0 null (|I#sm| t_1@@9) (MapType1Store (MapType0Select Heap@0 null (|I#sm| t_1@@9)) t_1@@9 l (bool_2_U true))))) (and (=> (= (ControlFlow 0 5) 3) anon47_Then_correct) (=> (= (ControlFlow 0 5) 4) anon47_Else_correct))))))
(let ((anon46_Else_correct  (=> (= t_1@@9 null) (=> (and (= Heap@6 Heap@@17) (= (ControlFlow 0 2) 1)) anon32_correct))))
(let ((anon44_Else_correct  (=> (|I2#trigger| (MapType0Select Heap@@17 null (I up_1@0)) up_1@0) (and (=> (= (ControlFlow 0 14) 5) anon46_Then_correct) (=> (= (ControlFlow 0 14) 2) anon46_Else_correct)))))
(let ((anon43_Then_correct  (=> (I2 Heap@@17 dn_1@0) (and (and (=> (= (ControlFlow 0 19) 14) anon44_Else_correct) (=> (= (ControlFlow 0 19) 16) anon45_Then_correct)) (=> (= (ControlFlow 0 19) 18) anon45_Else_correct)))))
(let ((anon43_Else_correct  (=> (not (I2 Heap@@17 dn_1@0)) (and (=> (= (ControlFlow 0 13) 5) anon46_Then_correct) (=> (= (ControlFlow 0 13) 2) anon46_Else_correct)))))
(let ((anon41_Else_correct  (=> (|I2#trigger| (MapType0Select Heap@@17 null (I dn_1@0)) dn_1@0) (and (=> (= (ControlFlow 0 20) 19) anon43_Then_correct) (=> (= (ControlFlow 0 20) 13) anon43_Else_correct)))))
(let ((anon17_correct  (=> (= dn_1@0 (ite (p Heap@@17) (MapType0Select Heap@@17 t_1@@9 r_1) (MapType0Select Heap@@17 t_1@@9 l))) (and (and (=> (= (ControlFlow 0 21) 20) anon41_Else_correct) (=> (= (ControlFlow 0 21) 10) anon42_Then_correct)) (=> (= (ControlFlow 0 21) 12) anon42_Else_correct)))))
(let ((anon40_Else_correct  (=> (not (p Heap@@17)) (and (=> (= (ControlFlow 0 24) (- 0 25)) (HasDirectPerm UnfoldingMask@7 t_1@@9 l)) (=> (HasDirectPerm UnfoldingMask@7 t_1@@9 l) (=> (= (ControlFlow 0 24) 21) anon17_correct))))))
(let ((anon40_Then_correct  (=> (p Heap@@17) (and (=> (= (ControlFlow 0 22) (- 0 23)) (HasDirectPerm UnfoldingMask@7 t_1@@9 r_1)) (=> (HasDirectPerm UnfoldingMask@7 t_1@@9 r_1) (=> (= (ControlFlow 0 22) 21) anon17_correct))))))
(let ((anon12_correct  (=> (= up_1@0 (ite (p Heap@@17) (MapType0Select Heap@@17 t_1@@9 l) (MapType0Select Heap@@17 t_1@@9 r_1))) (and (and (=> (= (ControlFlow 0 26) 8) anon39_Then_correct) (=> (= (ControlFlow 0 26) 22) anon40_Then_correct)) (=> (= (ControlFlow 0 26) 24) anon40_Else_correct)))))
(let ((anon38_Else_correct  (=> (not (p Heap@@17)) (and (=> (= (ControlFlow 0 29) (- 0 30)) (HasDirectPerm UnfoldingMask@7 t_1@@9 r_1)) (=> (HasDirectPerm UnfoldingMask@7 t_1@@9 r_1) (=> (= (ControlFlow 0 29) 26) anon12_correct))))))
(let ((anon38_Then_correct  (=> (p Heap@@17) (and (=> (= (ControlFlow 0 27) (- 0 28)) (HasDirectPerm UnfoldingMask@7 t_1@@9 l)) (=> (HasDirectPerm UnfoldingMask@7 t_1@@9 l) (=> (= (ControlFlow 0 27) 26) anon12_correct))))))
(let ((anon36_Then_correct  (=> (not (= t_1@@9 null)) (and (and (=> (= (ControlFlow 0 31) 7) anon37_Then_correct) (=> (= (ControlFlow 0 31) 27) anon38_Then_correct)) (=> (= (ControlFlow 0 31) 29) anon38_Else_correct)))))
(let ((anon36_Else_correct  (=> (= t_1@@9 null) (and (=> (= (ControlFlow 0 6) 5) anon46_Then_correct) (=> (= (ControlFlow 0 6) 2) anon46_Else_correct)))))
(let ((anon6_correct  (=> (state Heap@@17 UnfoldingMask@7) (and (=> (= (ControlFlow 0 32) 31) anon36_Then_correct) (=> (= (ControlFlow 0 32) 6) anon36_Else_correct)))))
(let ((anon35_Else_correct  (=> (not (p Heap@@17)) (=> (and (and (and (= UnfoldingMask@5 (MapType1Store UnfoldingMask@2 null (I (MapType0Select Heap@@17 t_1@@9 r_1)) (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@2 null (I (MapType0Select Heap@@17 t_1@@9 r_1)))) FullPerm)))) (InsidePredicate (I t_1@@9) (MapType0Select Heap@@17 null (I t_1@@9)) (I (MapType0Select Heap@@17 t_1@@9 r_1)) (MapType0Select Heap@@17 null (I (MapType0Select Heap@@17 t_1@@9 r_1))))) (and (state Heap@@17 UnfoldingMask@5) (= UnfoldingMask@6 (MapType1Store UnfoldingMask@5 null (I (MapType0Select Heap@@17 t_1@@9 l)) (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@5 null (I (MapType0Select Heap@@17 t_1@@9 l)))) FullPerm)))))) (and (and (InsidePredicate (I t_1@@9) (MapType0Select Heap@@17 null (I t_1@@9)) (I (MapType0Select Heap@@17 t_1@@9 l)) (MapType0Select Heap@@17 null (I (MapType0Select Heap@@17 t_1@@9 l)))) (state Heap@@17 UnfoldingMask@6)) (and (= UnfoldingMask@7 UnfoldingMask@6) (= (ControlFlow 0 35) 32)))) anon6_correct))))
(let ((anon35_Then_correct  (=> (p Heap@@17) (=> (and (and (and (= UnfoldingMask@3 (MapType1Store UnfoldingMask@2 null (I (MapType0Select Heap@@17 t_1@@9 r_1)) (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@2 null (I (MapType0Select Heap@@17 t_1@@9 r_1)))) FullPerm)))) (InsidePredicate (I t_1@@9) (MapType0Select Heap@@17 null (I t_1@@9)) (I (MapType0Select Heap@@17 t_1@@9 r_1)) (MapType0Select Heap@@17 null (I (MapType0Select Heap@@17 t_1@@9 r_1))))) (and (state Heap@@17 UnfoldingMask@3) (= UnfoldingMask@4 (MapType1Store UnfoldingMask@3 null (I (MapType0Select Heap@@17 t_1@@9 l)) (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@3 null (I (MapType0Select Heap@@17 t_1@@9 l)))) FullPerm)))))) (and (and (InsidePredicate (I t_1@@9) (MapType0Select Heap@@17 null (I t_1@@9)) (I (MapType0Select Heap@@17 t_1@@9 l)) (MapType0Select Heap@@17 null (I (MapType0Select Heap@@17 t_1@@9 l)))) (state Heap@@17 UnfoldingMask@4)) (and (= UnfoldingMask@7 UnfoldingMask@4) (= (ControlFlow 0 34) 32)))) anon6_correct))))
(let ((anon34_Then_correct  (=> (not (= t_1@@9 null)) (=> (and (not (= t_1@@9 null)) (= UnfoldingMask@1 (MapType1Store UnfoldingMask@0 t_1@@9 r_1 (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@0 t_1@@9 r_1)) FullPerm))))) (=> (and (and (state Heap@@17 UnfoldingMask@1) (not (= t_1@@9 null))) (and (= UnfoldingMask@2 (MapType1Store UnfoldingMask@1 t_1@@9 l (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@1 t_1@@9 l)) FullPerm)))) (state Heap@@17 UnfoldingMask@2))) (and (=> (= (ControlFlow 0 36) 34) anon35_Then_correct) (=> (= (ControlFlow 0 36) 35) anon35_Else_correct)))))))
(let ((anon34_Else_correct  (=> (= t_1@@9 null) (=> (and (= UnfoldingMask@7 UnfoldingMask@0) (= (ControlFlow 0 33) 32)) anon6_correct))))
(let ((anon2_correct  (=> (= UnfoldingMask@0 (MapType1Store Mask@0 null (I t_1@@9) (real_2_U (- (U_2_real (MapType1Select Mask@0 null (I t_1@@9))) FullPerm)))) (and (=> (= (ControlFlow 0 37) 36) anon34_Then_correct) (=> (= (ControlFlow 0 37) 33) anon34_Else_correct)))))
(let ((anon33_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 40) 37)) anon2_correct)))
(let ((anon33_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 38) (- 0 39)) (<= FullPerm (U_2_real (MapType1Select Mask@0 null (I t_1@@9))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@0 null (I t_1@@9)))) (=> (= (ControlFlow 0 38) 37) anon2_correct))))))
(let ((anon0_correct  (=> (and (and (and (state Heap@@17 ZeroMask) (U_2_bool (MapType0Select Heap@@17 t_1@@9 $allocated))) (and (= AssumeFunctionsAbove 0) (= Mask@0 (MapType1Store ZeroMask null (I t_1@@9) (real_2_U (+ (U_2_real (MapType1Select ZeroMask null (I t_1@@9))) FullPerm)))))) (and (and (state Heap@@17 Mask@0) (state Heap@@17 Mask@0)) (and (|I#trigger| Heap@@17 (I t_1@@9)) (= (MapType0Select Heap@@17 null (I t_1@@9)) (FrameFragment (ite (not (= t_1@@9 null)) (CombineFrames (FrameFragment (MapType0Select Heap@@17 t_1@@9 r_1)) (CombineFrames (FrameFragment (MapType0Select Heap@@17 t_1@@9 l)) (FrameFragment (ite (p Heap@@17) (CombineFrames (MapType0Select Heap@@17 null (I (MapType0Select Heap@@17 t_1@@9 r_1))) (MapType0Select Heap@@17 null (I (MapType0Select Heap@@17 t_1@@9 l)))) (CombineFrames (MapType0Select Heap@@17 null (I (MapType0Select Heap@@17 t_1@@9 r_1))) (MapType0Select Heap@@17 null (I (MapType0Select Heap@@17 t_1@@9 l)))))))) EmptyFrame)))))) (and (=> (= (ControlFlow 0 41) 38) anon33_Then_correct) (=> (= (ControlFlow 0 41) 40) anon33_Else_correct)))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 42) 41) anon0_correct)))
PreconditionGeneratedEntry_correct))))))))))))))))))))))))))))))))))))
))
(check-sat)
(pop 1)
; Valid
(get-info :rlimit)
