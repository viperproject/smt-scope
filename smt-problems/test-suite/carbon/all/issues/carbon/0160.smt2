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
(declare-fun val () T@U)
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
(declare-fun length (T@U) Int)
(declare-fun ArrayDomainTypeType () T@T)
(declare-fun dummyHeap () T@U)
(declare-fun ZeroMask () T@U)
(declare-fun InsidePredicate (T@U T@U T@U T@U) Bool)
(declare-fun sumMask (T@U T@U T@U) Bool)
(declare-fun ConditionalFrame (Real T@U) T@U)
(declare-fun EmptyFrame () T@U)
(declare-fun NoPerm () Real)
(declare-fun loc (T@U Int) T@U)
(declare-fun ref_to_array (T@U) T@U)
(declare-fun ref_to_index (T@U) Int)
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
))) (= (Ctor NormalFieldType) 7)) (= (type $allocated) (FieldType NormalFieldType boolType))) (= (type val) (FieldType NormalFieldType intType))))
(assert (distinct $allocated val)
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
))) (forall ((m T@U) (x0 T@U) (x1 T@U) (val@@0 T@U) ) (! (let ((B@@0 (FieldTypeInv1 (type x1))))
 (=> (= (type val@@0) B@@0) (= (MapType0Select (MapType0Store m x0 x1 val@@0) x0 x1) val@@0)))
 :qid |mapAx0:MapType0Select|
 :weight 0
))) (and (and (forall ((val@@1 T@U) (m@@0 T@U) (x0@@0 T@U) (x1@@0 T@U) (y0 T@U) (y1 T@U) ) (!  (or (= x0@@0 y0) (= (MapType0Select (MapType0Store m@@0 x0@@0 x1@@0 val@@1) y0 y1) (MapType0Select m@@0 y0 y1)))
 :qid |mapAx1:MapType0Select:0|
 :weight 0
)) (forall ((val@@2 T@U) (m@@1 T@U) (x0@@1 T@U) (x1@@1 T@U) (y0@@0 T@U) (y1@@0 T@U) ) (!  (or (= x1@@1 y1@@0) (= (MapType0Select (MapType0Store m@@1 x0@@1 x1@@1 val@@2) y0@@0 y1@@0) (MapType0Select m@@1 y0@@0 y1@@0)))
 :qid |mapAx1:MapType0Select:1|
 :weight 0
))) (forall ((val@@3 T@U) (m@@2 T@U) (x0@@2 T@U) (x1@@2 T@U) (y0@@1 T@U) (y1@@1 T@U) ) (!  (or true (= (MapType0Select (MapType0Store m@@2 x0@@2 x1@@2 val@@3) y0@@1 y1@@1) (MapType0Select m@@2 y0@@1 y1@@1)))
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
))) (forall ((m@@3 T@U) (x0@@3 T@U) (x1@@3 T@U) (val@@4 T@U) ) (! (let ((aVar1@@1 (MapType1TypeInv1 (type m@@3))))
 (=> (= (type val@@4) aVar1@@1) (= (MapType1Select (MapType1Store m@@3 x0@@3 x1@@3 val@@4) x0@@3 x1@@3) val@@4)))
 :qid |mapAx0:MapType1Select|
 :weight 0
))) (and (and (forall ((val@@5 T@U) (m@@4 T@U) (x0@@4 T@U) (x1@@4 T@U) (y0@@2 T@U) (y1@@2 T@U) ) (!  (or (= x0@@4 y0@@2) (= (MapType1Select (MapType1Store m@@4 x0@@4 x1@@4 val@@5) y0@@2 y1@@2) (MapType1Select m@@4 y0@@2 y1@@2)))
 :qid |mapAx1:MapType1Select:0|
 :weight 0
)) (forall ((val@@6 T@U) (m@@5 T@U) (x0@@5 T@U) (x1@@5 T@U) (y0@@3 T@U) (y1@@3 T@U) ) (!  (or (= x1@@5 y1@@3) (= (MapType1Select (MapType1Store m@@5 x0@@5 x1@@5 val@@6) y0@@3 y1@@3) (MapType1Select m@@5 y0@@3 y1@@3)))
 :qid |mapAx1:MapType1Select:1|
 :weight 0
))) (forall ((val@@7 T@U) (m@@6 T@U) (x0@@6 T@U) (x1@@6 T@U) (y0@@4 T@U) (y1@@4 T@U) ) (!  (or true (= (MapType1Select (MapType1Store m@@6 x0@@6 x1@@6 val@@7) y0@@4 y1@@4) (MapType1Select m@@6 y0@@4 y1@@4)))
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
(assert (forall ((Heap@@2 T@U) (ExhaleHeap@@1 T@U) (Mask@@2 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@2) (MapType0Type RefType)) (= (type ExhaleHeap@@1) (MapType0Type RefType))) (= (type Mask@@2) (MapType1Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@2 ExhaleHeap@@1 Mask@@2)) (U_2_bool (MapType0Select Heap@@2 o_1 $allocated))) (U_2_bool (MapType0Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.73:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@2 ExhaleHeap@@1 Mask@@2) (MapType0Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert (= (Ctor ArrayDomainTypeType) 12))
(assert (forall ((a_3 T@U) ) (!  (=> (= (type a_3) ArrayDomainTypeType) (>= (length a_3) 0))
 :qid |stdinbpl.231:15|
 :skolemid |23|
 :pattern ( (length a_3))
)))
(assert (forall ((Heap@@3 T@U) (ExhaleHeap@@2 T@U) (Mask@@3 T@U) (o_1@@0 T@U) (f_2 T@U) ) (! (let ((B@@1 (FieldTypeInv1 (type f_2))))
(let ((A@@1 (FieldTypeInv0 (type f_2))))
 (=> (and (and (and (and (and (and (= (type Heap@@3) (MapType0Type RefType)) (= (type ExhaleHeap@@2) (MapType0Type RefType))) (= (type Mask@@3) (MapType1Type RefType realType))) (= (type o_1@@0) RefType)) (= (type f_2) (FieldType A@@1 B@@1))) (IdenticalOnKnownLocations Heap@@3 ExhaleHeap@@2 Mask@@3)) (HasDirectPerm Mask@@3 o_1@@0 f_2)) (= (MapType0Select Heap@@3 o_1@@0 f_2) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2)))))
 :qid |stdinbpl.42:22|
 :skolemid |1|
 :pattern ( (IdenticalOnKnownLocations Heap@@3 ExhaleHeap@@2 Mask@@3) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2))
)))
(assert  (and (= (type dummyHeap) (MapType0Type RefType)) (= (type ZeroMask) (MapType1Type RefType realType))))
(assert (state dummyHeap ZeroMask))
(assert (forall ((p T@U) (v_1 T@U) (w T@U) ) (! (let ((A@@2 (FieldTypeInv0 (type p))))
 (=> (and (and (= (type p) (FieldType A@@2 FrameTypeType)) (= (type v_1) FrameTypeType)) (= (type w) FrameTypeType)) (not (InsidePredicate p v_1 p w))))
 :qid |stdinbpl.200:19|
 :skolemid |21|
 :pattern ( (InsidePredicate p v_1 p w))
)))
(assert  (not (IsPredicateField val)))
(assert  (not (IsWandField val)))
(assert (forall ((Heap@@4 T@U) (ExhaleHeap@@3 T@U) (Mask@@4 T@U) ) (!  (=> (and (and (and (= (type Heap@@4) (MapType0Type RefType)) (= (type ExhaleHeap@@3) (MapType0Type RefType))) (= (type Mask@@4) (MapType1Type RefType realType))) (IdenticalOnKnownLocations Heap@@4 ExhaleHeap@@3 Mask@@4)) (succHeap Heap@@4 ExhaleHeap@@3))
 :qid |stdinbpl.83:15|
 :skolemid |10|
 :pattern ( (IdenticalOnKnownLocations Heap@@4 ExhaleHeap@@3 Mask@@4))
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
(assert  (and (forall ((arg0@@25 Real) (arg1@@9 T@U) ) (! (= (type (ConditionalFrame arg0@@25 arg1@@9)) FrameTypeType)
 :qid |funType:ConditionalFrame|
 :pattern ( (ConditionalFrame arg0@@25 arg1@@9))
)) (= (type EmptyFrame) FrameTypeType)))
(assert (forall ((p@@0 Real) (f_6 T@U) ) (!  (=> (= (type f_6) FrameTypeType) (= (ConditionalFrame p@@0 f_6) (ite (> p@@0 0.0) f_6 EmptyFrame)))
 :qid |stdinbpl.188:15|
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
(assert  (and (forall ((arg0@@26 T@U) (arg1@@10 Int) ) (! (= (type (loc arg0@@26 arg1@@10)) RefType)
 :qid |funType:loc|
 :pattern ( (loc arg0@@26 arg1@@10))
)) (forall ((arg0@@27 T@U) ) (! (= (type (ref_to_array arg0@@27)) ArrayDomainTypeType)
 :qid |funType:ref_to_array|
 :pattern ( (ref_to_array arg0@@27))
))))
(assert (forall ((a_3@@0 T@U) (i_3 Int) ) (!  (=> (= (type a_3@@0) ArrayDomainTypeType) (and (= (ref_to_array (loc a_3@@0 i_3)) a_3@@0) (= (ref_to_index (loc a_3@@0 i_3)) i_3)))
 :qid |stdinbpl.225:15|
 :skolemid |22|
 :pattern ( (loc a_3@@0 i_3))
)))
(assert (forall ((o_2@@1 T@U) (f_4@@1 T@U) ) (! (let ((B@@4 (FieldTypeInv1 (type f_4@@1))))
(let ((A@@5 (FieldTypeInv0 (type f_4@@1))))
 (=> (and (= (type o_2@@1) RefType) (= (type f_4@@1) (FieldType A@@5 B@@4))) (= (U_2_real (MapType1Select ZeroMask o_2@@1 f_4@@1)) NoPerm))))
 :qid |stdinbpl.106:22|
 :skolemid |13|
 :pattern ( (MapType1Select ZeroMask o_2@@1 f_4@@1))
)))
(assert (forall ((Heap@@5 T@U) (ExhaleHeap@@4 T@U) (Mask@@6 T@U) (pm_f@@1 T@U) ) (! (let ((C@@1 (FieldTypeInv0 (type pm_f@@1))))
 (=> (and (and (and (and (and (= (type Heap@@5) (MapType0Type RefType)) (= (type ExhaleHeap@@4) (MapType0Type RefType))) (= (type Mask@@6) (MapType1Type RefType realType))) (= (type pm_f@@1) (FieldType C@@1 FrameTypeType))) (IdenticalOnKnownLocations Heap@@5 ExhaleHeap@@4 Mask@@6)) (and (HasDirectPerm Mask@@6 null pm_f@@1) (IsPredicateField pm_f@@1))) (forall ((o2 T@U) (f_2@@0 T@U) ) (! (let ((B@@5 (FieldTypeInv1 (type f_2@@0))))
(let ((A@@6 (FieldTypeInv0 (type f_2@@0))))
 (=> (and (and (= (type o2) RefType) (= (type f_2@@0) (FieldType A@@6 B@@5))) (U_2_bool (MapType1Select (MapType0Select Heap@@5 null (PredicateMaskField pm_f@@1)) o2 f_2@@0))) (= (MapType0Select Heap@@5 o2 f_2@@0) (MapType0Select ExhaleHeap@@4 o2 f_2@@0)))))
 :qid |stdinbpl.54:134|
 :skolemid |3|
 :pattern ( (MapType0Select ExhaleHeap@@4 o2 f_2@@0))
))))
 :qid |stdinbpl.52:19|
 :skolemid |4|
 :pattern ( (IdenticalOnKnownLocations Heap@@5 ExhaleHeap@@4 Mask@@6) (IsPredicateField pm_f@@1))
)))
(assert (forall ((Heap@@6 T@U) (ExhaleHeap@@5 T@U) (Mask@@7 T@U) (pm_f@@2 T@U) ) (! (let ((C@@2 (FieldTypeInv0 (type pm_f@@2))))
 (=> (and (and (and (and (and (= (type Heap@@6) (MapType0Type RefType)) (= (type ExhaleHeap@@5) (MapType0Type RefType))) (= (type Mask@@7) (MapType1Type RefType realType))) (= (type pm_f@@2) (FieldType C@@2 FrameTypeType))) (IdenticalOnKnownLocations Heap@@6 ExhaleHeap@@5 Mask@@7)) (and (HasDirectPerm Mask@@7 null pm_f@@2) (IsWandField pm_f@@2))) (forall ((o2@@0 T@U) (f_2@@1 T@U) ) (! (let ((B@@6 (FieldTypeInv1 (type f_2@@1))))
(let ((A@@7 (FieldTypeInv0 (type f_2@@1))))
 (=> (and (and (= (type o2@@0) RefType) (= (type f_2@@1) (FieldType A@@7 B@@6))) (U_2_bool (MapType1Select (MapType0Select Heap@@6 null (WandMaskField pm_f@@2)) o2@@0 f_2@@1))) (= (MapType0Select Heap@@6 o2@@0 f_2@@1) (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1)))))
 :qid |stdinbpl.67:129|
 :skolemid |6|
 :pattern ( (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1))
))))
 :qid |stdinbpl.65:19|
 :skolemid |7|
 :pattern ( (IdenticalOnKnownLocations Heap@@6 ExhaleHeap@@5 Mask@@7) (IsWandField pm_f@@2))
)))
(assert (forall ((Mask@@8 T@U) (o_2@@2 T@U) (f_4@@2 T@U) ) (! (let ((B@@7 (FieldTypeInv1 (type f_4@@2))))
(let ((A@@8 (FieldTypeInv0 (type f_4@@2))))
 (=> (and (and (and (= (type Mask@@8) (MapType1Type RefType realType)) (= (type o_2@@2) RefType)) (= (type f_4@@2) (FieldType A@@8 B@@7))) (GoodMask Mask@@8)) (and (>= (U_2_real (MapType1Select Mask@@8 o_2@@2 f_4@@2)) NoPerm) (=> (and (and (GoodMask Mask@@8) (not (IsPredicateField f_4@@2))) (not (IsWandField f_4@@2))) (<= (U_2_real (MapType1Select Mask@@8 o_2@@2 f_4@@2)) FullPerm))))))
 :qid |stdinbpl.128:22|
 :skolemid |16|
 :pattern ( (GoodMask Mask@@8) (MapType1Select Mask@@8 o_2@@2 f_4@@2))
)))
(assert (forall ((o T@U) (f T@U) (Heap@@7 T@U) ) (!  (=> (and (and (and (= (type o) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap@@7) (MapType0Type RefType))) (U_2_bool (MapType0Select Heap@@7 o $allocated))) (U_2_bool (MapType0Select Heap@@7 (MapType0Select Heap@@7 o f) $allocated)))
 :qid |stdinbpl.31:15|
 :skolemid |0|
 :pattern ( (MapType0Select Heap@@7 o f))
)))
(assert (forall ((Heap@@8 T@U) (o@@0 T@U) (f_3 T@U) (v T@U) ) (! (let ((B@@8 (type v)))
(let ((A@@9 (FieldTypeInv0 (type f_3))))
 (=> (and (and (= (type Heap@@8) (MapType0Type RefType)) (= (type o@@0) RefType)) (= (type f_3) (FieldType A@@9 B@@8))) (succHeap Heap@@8 (MapType0Store Heap@@8 o@@0 f_3 v)))))
 :qid |stdinbpl.78:22|
 :skolemid |9|
 :pattern ( (MapType0Store Heap@@8 o@@0 f_3 v))
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
 :qid |stdinbpl.195:25|
 :skolemid |20|
 :pattern ( (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun arr1 () T@U)
(declare-fun qpRange3 (T@U) Bool)
(declare-fun invRecv3 (T@U) Int)
(declare-fun t_1@0 () Int)
(declare-fun ExhaleHeap@0 () T@U)
(declare-fun QPMask@1 () T@U)
(declare-fun qpRange6 (T@U) Bool)
(declare-fun invRecv6 (T@U) Int)
(declare-fun qpRange4 (T@U) Bool)
(declare-fun invRecv4 (T@U) Int)
(declare-fun QPMask@2 () T@U)
(declare-fun Heap@0 () T@U)
(declare-fun arr2 () T@U)
(declare-fun Heap@1 () T@U)
(declare-fun t_1@1 () Int)
(declare-fun dummyFunction (T@U) Bool)
(declare-fun neverTriggered5 (Int) Bool)
(declare-fun qpRange5 (T@U) Bool)
(declare-fun invRecv5 (T@U) Int)
(declare-fun QPMask@3 () T@U)
(declare-fun qpRange1 (T@U) Bool)
(declare-fun invRecv1 (T@U) Int)
(declare-fun QPMask@0 () T@U)
(declare-fun Heap@@9 () T@U)
(declare-fun neverTriggered2 (Int) Bool)
(declare-fun qpRange2 (T@U) Bool)
(declare-fun invRecv2 (T@U) Int)
(assert  (and (and (and (and (and (and (and (and (and (= (type ExhaleHeap@0) (MapType0Type RefType)) (= (type arr1) ArrayDomainTypeType)) (= (type QPMask@2) (MapType1Type RefType realType))) (= (type Heap@0) (MapType0Type RefType))) (= (type arr2) ArrayDomainTypeType)) (= (type Heap@1) (MapType0Type RefType))) (= (type QPMask@3) (MapType1Type RefType realType))) (= (type QPMask@1) (MapType1Type RefType realType))) (= (type QPMask@0) (MapType1Type RefType realType))) (= (type Heap@@9) (MapType0Type RefType))))
(set-info :boogie-vc-id multiple_arrays)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 28) (let ((anon11_Else_correct  (and (=> (= (ControlFlow 0 17) (- 0 18)) (forall ((i_4 Int) (i_4_1 Int) ) (!  (=> (and (and (not (= i_4 i_4_1)) (< NoPerm (ite  (and (<= 0 i_4) (< i_4 10)) FullPerm NoPerm))) (< NoPerm (ite  (and (<= 0 i_4_1) (< i_4_1 10)) FullPerm NoPerm))) (not (= (loc arr1 i_4) (loc arr1 i_4_1))))
 :qid |stdinbpl.396:19|
 :skolemid |38|
))) (=> (forall ((i_4@@0 Int) (i_4_1@@0 Int) ) (!  (=> (and (and (not (= i_4@@0 i_4_1@@0)) (< NoPerm (ite  (and (<= 0 i_4@@0) (< i_4@@0 10)) FullPerm NoPerm))) (< NoPerm (ite  (and (<= 0 i_4_1@@0) (< i_4_1@@0 10)) FullPerm NoPerm))) (not (= (loc arr1 i_4@@0) (loc arr1 i_4_1@@0))))
 :qid |stdinbpl.396:19|
 :skolemid |38|
)) (=> (forall ((i_4@@1 Int) ) (!  (=> (< NoPerm (ite  (and (<= 0 i_4@@1) (< i_4@@1 10)) FullPerm NoPerm)) (and (qpRange3 (loc arr1 i_4@@1)) (= (invRecv3 (loc arr1 i_4@@1)) i_4@@1)))
 :qid |stdinbpl.402:26|
 :skolemid |39|
 :pattern ( (loc arr1 i_4@@1))
 :pattern ( (loc arr1 i_4@@1))
)) (=> (and (forall ((o_3 T@U) ) (!  (=> (= (type o_3) RefType) (=> (and (< NoPerm (ite  (and (<= 0 (invRecv3 o_3)) (< (invRecv3 o_3) 10)) FullPerm NoPerm)) (qpRange3 o_3)) (= (loc arr1 (invRecv3 o_3)) o_3)))
 :qid |stdinbpl.406:26|
 :skolemid |40|
 :pattern ( (invRecv3 o_3))
)) (= (ControlFlow 0 17) (- 0 16))) (forall ((i_4@@2 Int) ) (! (>= (ite  (and (<= 0 i_4@@2) (< i_4@@2 10)) FullPerm NoPerm) NoPerm)
 :qid |stdinbpl.412:19|
 :skolemid |41|
 :pattern ( (loc arr1 i_4@@2))
 :pattern ( (loc arr1 i_4@@2))
))))))))
(let ((anon11_Then_correct true))
(let ((anon12_Else_correct  (=> (and (not (< t_1@0 10)) (state ExhaleHeap@0 QPMask@1)) (and (=> (= (ControlFlow 0 13) (- 0 14)) (forall ((i_7 Int) (i_7_1 Int) ) (!  (=> (and (and (not (= i_7 i_7_1)) (< NoPerm (ite  (and (<= 0 i_7) (< i_7 10)) FullPerm NoPerm))) (< NoPerm (ite  (and (<= 0 i_7_1) (< i_7_1 10)) FullPerm NoPerm))) (not (= (loc arr1 i_7) (loc arr1 i_7_1))))
 :qid |stdinbpl.578:17|
 :skolemid |59|
))) (=> (forall ((i_7@@0 Int) (i_7_1@@0 Int) ) (!  (=> (and (and (not (= i_7@@0 i_7_1@@0)) (< NoPerm (ite  (and (<= 0 i_7@@0) (< i_7@@0 10)) FullPerm NoPerm))) (< NoPerm (ite  (and (<= 0 i_7_1@@0) (< i_7_1@@0 10)) FullPerm NoPerm))) (not (= (loc arr1 i_7@@0) (loc arr1 i_7_1@@0))))
 :qid |stdinbpl.578:17|
 :skolemid |59|
)) (=> (forall ((i_7@@1 Int) ) (!  (=> (< NoPerm (ite  (and (<= 0 i_7@@1) (< i_7@@1 10)) FullPerm NoPerm)) (and (qpRange6 (loc arr1 i_7@@1)) (= (invRecv6 (loc arr1 i_7@@1)) i_7@@1)))
 :qid |stdinbpl.584:24|
 :skolemid |60|
 :pattern ( (loc arr1 i_7@@1))
 :pattern ( (loc arr1 i_7@@1))
)) (=> (and (forall ((o_3@@0 T@U) ) (!  (=> (= (type o_3@@0) RefType) (=> (and (< NoPerm (ite  (and (<= 0 (invRecv6 o_3@@0)) (< (invRecv6 o_3@@0) 10)) FullPerm NoPerm)) (qpRange6 o_3@@0)) (= (loc arr1 (invRecv6 o_3@@0)) o_3@@0)))
 :qid |stdinbpl.588:24|
 :skolemid |61|
 :pattern ( (invRecv6 o_3@@0))
)) (= (ControlFlow 0 13) (- 0 12))) (forall ((i_7@@2 Int) ) (! (>= (ite  (and (<= 0 i_7@@2) (< i_7@@2 10)) FullPerm NoPerm) NoPerm)
 :qid |stdinbpl.594:17|
 :skolemid |62|
 :pattern ( (loc arr1 i_7@@2))
 :pattern ( (loc arr1 i_7@@2))
)))))))))
(let ((anon12_Then_correct  (=> (state ExhaleHeap@0 ZeroMask) (and (=> (= (ControlFlow 0 3) (- 0 11)) (forall ((i_5 Int) (i_5_1 Int) ) (!  (=> (and (and (not (= i_5 i_5_1)) (< NoPerm (ite  (and (<= 0 i_5) (< i_5 10)) FullPerm NoPerm))) (< NoPerm (ite  (and (<= 0 i_5_1) (< i_5_1 10)) FullPerm NoPerm))) (not (= (loc arr1 i_5) (loc arr1 i_5_1))))
 :qid |stdinbpl.451:19|
 :skolemid |45|
))) (=> (forall ((i_5@@0 Int) (i_5_1@@0 Int) ) (!  (=> (and (and (not (= i_5@@0 i_5_1@@0)) (< NoPerm (ite  (and (<= 0 i_5@@0) (< i_5@@0 10)) FullPerm NoPerm))) (< NoPerm (ite  (and (<= 0 i_5_1@@0) (< i_5_1@@0 10)) FullPerm NoPerm))) (not (= (loc arr1 i_5@@0) (loc arr1 i_5_1@@0))))
 :qid |stdinbpl.451:19|
 :skolemid |45|
)) (=> (and (forall ((i_5@@1 Int) ) (!  (=> (< NoPerm (ite  (and (<= 0 i_5@@1) (< i_5@@1 10)) FullPerm NoPerm)) (and (qpRange4 (loc arr1 i_5@@1)) (= (invRecv4 (loc arr1 i_5@@1)) i_5@@1)))
 :qid |stdinbpl.457:26|
 :skolemid |46|
 :pattern ( (loc arr1 i_5@@1))
 :pattern ( (loc arr1 i_5@@1))
)) (forall ((o_3@@1 T@U) ) (!  (=> (= (type o_3@@1) RefType) (=> (and (< NoPerm (ite  (and (<= 0 (invRecv4 o_3@@1)) (< (invRecv4 o_3@@1) 10)) FullPerm NoPerm)) (qpRange4 o_3@@1)) (= (loc arr1 (invRecv4 o_3@@1)) o_3@@1)))
 :qid |stdinbpl.461:26|
 :skolemid |47|
 :pattern ( (invRecv4 o_3@@1))
))) (and (=> (= (ControlFlow 0 3) (- 0 10)) (forall ((i_5@@2 Int) ) (! (>= (ite  (and (<= 0 i_5@@2) (< i_5@@2 10)) FullPerm NoPerm) NoPerm)
 :qid |stdinbpl.467:19|
 :skolemid |48|
 :pattern ( (loc arr1 i_5@@2))
 :pattern ( (loc arr1 i_5@@2))
))) (=> (forall ((i_5@@3 Int) ) (! (>= (ite  (and (<= 0 i_5@@3) (< i_5@@3 10)) FullPerm NoPerm) NoPerm)
 :qid |stdinbpl.467:19|
 :skolemid |48|
 :pattern ( (loc arr1 i_5@@3))
 :pattern ( (loc arr1 i_5@@3))
)) (=> (forall ((i_5@@4 Int) ) (!  (=> (> (ite  (and (<= 0 i_5@@4) (< i_5@@4 10)) FullPerm NoPerm) NoPerm) (not (= (loc arr1 i_5@@4) null)))
 :qid |stdinbpl.473:26|
 :skolemid |49|
 :pattern ( (loc arr1 i_5@@4))
 :pattern ( (loc arr1 i_5@@4))
)) (=> (and (and (and (forall ((o_3@@2 T@U) ) (!  (=> (= (type o_3@@2) RefType) (and (=> (and (< NoPerm (ite  (and (<= 0 (invRecv4 o_3@@2)) (< (invRecv4 o_3@@2) 10)) FullPerm NoPerm)) (qpRange4 o_3@@2)) (and (=> (< NoPerm (ite  (and (<= 0 (invRecv4 o_3@@2)) (< (invRecv4 o_3@@2) 10)) FullPerm NoPerm)) (= (loc arr1 (invRecv4 o_3@@2)) o_3@@2)) (= (U_2_real (MapType1Select QPMask@2 o_3@@2 val)) (+ (U_2_real (MapType1Select ZeroMask o_3@@2 val)) (ite  (and (<= 0 (invRecv4 o_3@@2)) (< (invRecv4 o_3@@2) 10)) FullPerm NoPerm))))) (=> (not (and (< NoPerm (ite  (and (<= 0 (invRecv4 o_3@@2)) (< (invRecv4 o_3@@2) 10)) FullPerm NoPerm)) (qpRange4 o_3@@2))) (= (U_2_real (MapType1Select QPMask@2 o_3@@2 val)) (U_2_real (MapType1Select ZeroMask o_3@@2 val))))))
 :qid |stdinbpl.479:26|
 :skolemid |50|
 :pattern ( (MapType1Select QPMask@2 o_3@@2 val))
)) (forall ((o_3@@3 T@U) (f_5 T@U) ) (! (let ((B@@11 (FieldTypeInv1 (type f_5))))
(let ((A@@12 (FieldTypeInv0 (type f_5))))
 (=> (and (and (= (type o_3@@3) RefType) (= (type f_5) (FieldType A@@12 B@@11))) (not (= f_5 val))) (= (U_2_real (MapType1Select ZeroMask o_3@@3 f_5)) (U_2_real (MapType1Select QPMask@2 o_3@@3 f_5))))))
 :qid |stdinbpl.483:33|
 :skolemid |51|
 :pattern ( (MapType1Select ZeroMask o_3@@3 f_5))
 :pattern ( (MapType1Select QPMask@2 o_3@@3 f_5))
))) (and (state ExhaleHeap@0 QPMask@2) (<= 0 t_1@0))) (and (and (<= t_1@0 10) (state ExhaleHeap@0 QPMask@2)) (and (< t_1@0 10) (state ExhaleHeap@0 QPMask@2)))) (and (=> (= (ControlFlow 0 3) (- 0 9)) (= FullPerm (U_2_real (MapType1Select QPMask@2 (loc arr1 t_1@0) val)))) (=> (= FullPerm (U_2_real (MapType1Select QPMask@2 (loc arr1 t_1@0) val))) (=> (and (= Heap@0 (MapType0Store ExhaleHeap@0 (loc arr1 t_1@0) val (int_2_U 0))) (state Heap@0 QPMask@2)) (and (=> (= (ControlFlow 0 3) (- 0 8)) (= FullPerm (U_2_real (MapType1Select QPMask@2 (loc arr2 t_1@0) val)))) (=> (= FullPerm (U_2_real (MapType1Select QPMask@2 (loc arr2 t_1@0) val))) (=> (and (and (= Heap@1 (MapType0Store Heap@0 (loc arr2 t_1@0) val (int_2_U 0))) (state Heap@1 QPMask@2)) (and (= t_1@1 (+ t_1@0 1)) (state Heap@1 QPMask@2))) (and (=> (= (ControlFlow 0 3) (- 0 7)) (forall ((i_6 Int) ) (!  (=> (dummyFunction (MapType0Select Heap@1 (loc arr1 i_6) val)) (>= (ite  (and (<= 0 i_6) (< i_6 10)) FullPerm NoPerm) NoPerm))
 :qid |stdinbpl.520:21|
 :skolemid |52|
 :pattern ( (loc arr1 i_6))
 :pattern ( (loc arr1 i_6))
))) (=> (forall ((i_6@@0 Int) ) (!  (=> (dummyFunction (MapType0Select Heap@1 (loc arr1 i_6@@0) val)) (>= (ite  (and (<= 0 i_6@@0) (< i_6@@0 10)) FullPerm NoPerm) NoPerm))
 :qid |stdinbpl.520:21|
 :skolemid |52|
 :pattern ( (loc arr1 i_6@@0))
 :pattern ( (loc arr1 i_6@@0))
)) (and (=> (= (ControlFlow 0 3) (- 0 6)) (forall ((i_6@@1 Int) (i_6_1 Int) ) (!  (=> (and (and (not (= i_6@@1 i_6_1)) (< NoPerm (ite  (and (<= 0 i_6@@1) (< i_6@@1 10)) FullPerm NoPerm))) (< NoPerm (ite  (and (<= 0 i_6_1) (< i_6_1 10)) FullPerm NoPerm))) (not (= (loc arr1 i_6@@1) (loc arr1 i_6_1))))
 :qid |stdinbpl.527:21|
 :skolemid |53|
 :pattern ( (neverTriggered5 i_6@@1) (neverTriggered5 i_6_1))
))) (=> (forall ((i_6@@2 Int) (i_6_1@@0 Int) ) (!  (=> (and (and (not (= i_6@@2 i_6_1@@0)) (< NoPerm (ite  (and (<= 0 i_6@@2) (< i_6@@2 10)) FullPerm NoPerm))) (< NoPerm (ite  (and (<= 0 i_6_1@@0) (< i_6_1@@0 10)) FullPerm NoPerm))) (not (= (loc arr1 i_6@@2) (loc arr1 i_6_1@@0))))
 :qid |stdinbpl.527:21|
 :skolemid |53|
 :pattern ( (neverTriggered5 i_6@@2) (neverTriggered5 i_6_1@@0))
)) (and (=> (= (ControlFlow 0 3) (- 0 5)) (forall ((i_6@@3 Int) ) (! (>= (U_2_real (MapType1Select QPMask@2 (loc arr1 i_6@@3) val)) (ite  (and (<= 0 i_6@@3) (< i_6@@3 10)) FullPerm NoPerm))
 :qid |stdinbpl.534:21|
 :skolemid |54|
 :pattern ( (loc arr1 i_6@@3))
 :pattern ( (loc arr1 i_6@@3))
))) (=> (forall ((i_6@@4 Int) ) (! (>= (U_2_real (MapType1Select QPMask@2 (loc arr1 i_6@@4) val)) (ite  (and (<= 0 i_6@@4) (< i_6@@4 10)) FullPerm NoPerm))
 :qid |stdinbpl.534:21|
 :skolemid |54|
 :pattern ( (loc arr1 i_6@@4))
 :pattern ( (loc arr1 i_6@@4))
)) (=> (and (and (forall ((i_6@@5 Int) ) (!  (=> (< NoPerm (ite  (and (<= 0 i_6@@5) (< i_6@@5 10)) FullPerm NoPerm)) (and (qpRange5 (loc arr1 i_6@@5)) (= (invRecv5 (loc arr1 i_6@@5)) i_6@@5)))
 :qid |stdinbpl.540:26|
 :skolemid |55|
 :pattern ( (loc arr1 i_6@@5))
 :pattern ( (loc arr1 i_6@@5))
)) (forall ((o_3@@4 T@U) ) (!  (=> (= (type o_3@@4) RefType) (=> (and (< NoPerm (ite  (and (<= 0 (invRecv5 o_3@@4)) (< (invRecv5 o_3@@4) 10)) FullPerm NoPerm)) (qpRange5 o_3@@4)) (= (loc arr1 (invRecv5 o_3@@4)) o_3@@4)))
 :qid |stdinbpl.544:26|
 :skolemid |56|
 :pattern ( (invRecv5 o_3@@4))
))) (and (forall ((o_3@@5 T@U) ) (!  (=> (= (type o_3@@5) RefType) (and (=> (and (< NoPerm (ite  (and (<= 0 (invRecv5 o_3@@5)) (< (invRecv5 o_3@@5) 10)) FullPerm NoPerm)) (qpRange5 o_3@@5)) (and (= (loc arr1 (invRecv5 o_3@@5)) o_3@@5) (= (U_2_real (MapType1Select QPMask@3 o_3@@5 val)) (- (U_2_real (MapType1Select QPMask@2 o_3@@5 val)) (ite  (and (<= 0 (invRecv5 o_3@@5)) (< (invRecv5 o_3@@5) 10)) FullPerm NoPerm))))) (=> (not (and (< NoPerm (ite  (and (<= 0 (invRecv5 o_3@@5)) (< (invRecv5 o_3@@5) 10)) FullPerm NoPerm)) (qpRange5 o_3@@5))) (= (U_2_real (MapType1Select QPMask@3 o_3@@5 val)) (U_2_real (MapType1Select QPMask@2 o_3@@5 val))))))
 :qid |stdinbpl.550:26|
 :skolemid |57|
 :pattern ( (MapType1Select QPMask@3 o_3@@5 val))
)) (forall ((o_3@@6 T@U) (f_5@@0 T@U) ) (! (let ((B@@12 (FieldTypeInv1 (type f_5@@0))))
(let ((A@@13 (FieldTypeInv0 (type f_5@@0))))
 (=> (and (and (= (type o_3@@6) RefType) (= (type f_5@@0) (FieldType A@@13 B@@12))) (not (= f_5@@0 val))) (= (U_2_real (MapType1Select QPMask@2 o_3@@6 f_5@@0)) (U_2_real (MapType1Select QPMask@3 o_3@@6 f_5@@0))))))
 :qid |stdinbpl.556:33|
 :skolemid |58|
 :pattern ( (MapType1Select QPMask@3 o_3@@6 f_5@@0))
)))) (and (=> (= (ControlFlow 0 3) (- 0 4)) (<= 0 t_1@1)) (=> (<= 0 t_1@1) (=> (= (ControlFlow 0 3) (- 0 2)) (<= t_1@1 10)))))))))))))))))))))))))))
(let ((anon9_Else_correct  (and (=> (= (ControlFlow 0 19) (- 0 26)) (forall ((i_1 Int) (i_1_1 Int) ) (!  (=> (and (and (not (= i_1 i_1_1)) (< NoPerm (ite  (and (<= 0 i_1) (< i_1 10)) FullPerm NoPerm))) (< NoPerm (ite  (and (<= 0 i_1_1) (< i_1_1 10)) FullPerm NoPerm))) (not (= (loc arr1 i_1) (loc arr1 i_1_1))))
 :qid |stdinbpl.273:15|
 :skolemid |24|
))) (=> (forall ((i_1@@0 Int) (i_1_1@@0 Int) ) (!  (=> (and (and (not (= i_1@@0 i_1_1@@0)) (< NoPerm (ite  (and (<= 0 i_1@@0) (< i_1@@0 10)) FullPerm NoPerm))) (< NoPerm (ite  (and (<= 0 i_1_1@@0) (< i_1_1@@0 10)) FullPerm NoPerm))) (not (= (loc arr1 i_1@@0) (loc arr1 i_1_1@@0))))
 :qid |stdinbpl.273:15|
 :skolemid |24|
)) (=> (and (forall ((i_1@@1 Int) ) (!  (=> (< NoPerm (ite  (and (<= 0 i_1@@1) (< i_1@@1 10)) FullPerm NoPerm)) (and (qpRange1 (loc arr1 i_1@@1)) (= (invRecv1 (loc arr1 i_1@@1)) i_1@@1)))
 :qid |stdinbpl.279:22|
 :skolemid |25|
 :pattern ( (loc arr1 i_1@@1))
 :pattern ( (loc arr1 i_1@@1))
)) (forall ((o_3@@7 T@U) ) (!  (=> (= (type o_3@@7) RefType) (=> (and (< NoPerm (ite  (and (<= 0 (invRecv1 o_3@@7)) (< (invRecv1 o_3@@7) 10)) FullPerm NoPerm)) (qpRange1 o_3@@7)) (= (loc arr1 (invRecv1 o_3@@7)) o_3@@7)))
 :qid |stdinbpl.283:22|
 :skolemid |26|
 :pattern ( (invRecv1 o_3@@7))
))) (and (=> (= (ControlFlow 0 19) (- 0 25)) (forall ((i_1@@2 Int) ) (! (>= (ite  (and (<= 0 i_1@@2) (< i_1@@2 10)) FullPerm NoPerm) NoPerm)
 :qid |stdinbpl.289:15|
 :skolemid |27|
 :pattern ( (loc arr1 i_1@@2))
 :pattern ( (loc arr1 i_1@@2))
))) (=> (forall ((i_1@@3 Int) ) (! (>= (ite  (and (<= 0 i_1@@3) (< i_1@@3 10)) FullPerm NoPerm) NoPerm)
 :qid |stdinbpl.289:15|
 :skolemid |27|
 :pattern ( (loc arr1 i_1@@3))
 :pattern ( (loc arr1 i_1@@3))
)) (=> (and (forall ((i_1@@4 Int) ) (!  (=> (> (ite  (and (<= 0 i_1@@4) (< i_1@@4 10)) FullPerm NoPerm) NoPerm) (not (= (loc arr1 i_1@@4) null)))
 :qid |stdinbpl.295:22|
 :skolemid |28|
 :pattern ( (loc arr1 i_1@@4))
 :pattern ( (loc arr1 i_1@@4))
)) (forall ((o_3@@8 T@U) ) (!  (=> (= (type o_3@@8) RefType) (and (=> (and (< NoPerm (ite  (and (<= 0 (invRecv1 o_3@@8)) (< (invRecv1 o_3@@8) 10)) FullPerm NoPerm)) (qpRange1 o_3@@8)) (and (=> (< NoPerm (ite  (and (<= 0 (invRecv1 o_3@@8)) (< (invRecv1 o_3@@8) 10)) FullPerm NoPerm)) (= (loc arr1 (invRecv1 o_3@@8)) o_3@@8)) (= (U_2_real (MapType1Select QPMask@0 o_3@@8 val)) (+ (U_2_real (MapType1Select ZeroMask o_3@@8 val)) (ite  (and (<= 0 (invRecv1 o_3@@8)) (< (invRecv1 o_3@@8) 10)) FullPerm NoPerm))))) (=> (not (and (< NoPerm (ite  (and (<= 0 (invRecv1 o_3@@8)) (< (invRecv1 o_3@@8) 10)) FullPerm NoPerm)) (qpRange1 o_3@@8))) (= (U_2_real (MapType1Select QPMask@0 o_3@@8 val)) (U_2_real (MapType1Select ZeroMask o_3@@8 val))))))
 :qid |stdinbpl.301:22|
 :skolemid |29|
 :pattern ( (MapType1Select QPMask@0 o_3@@8 val))
))) (=> (and (and (forall ((o_3@@9 T@U) (f_5@@1 T@U) ) (! (let ((B@@13 (FieldTypeInv1 (type f_5@@1))))
(let ((A@@14 (FieldTypeInv0 (type f_5@@1))))
 (=> (and (and (= (type o_3@@9) RefType) (= (type f_5@@1) (FieldType A@@14 B@@13))) (not (= f_5@@1 val))) (= (U_2_real (MapType1Select ZeroMask o_3@@9 f_5@@1)) (U_2_real (MapType1Select QPMask@0 o_3@@9 f_5@@1))))))
 :qid |stdinbpl.305:29|
 :skolemid |30|
 :pattern ( (MapType1Select ZeroMask o_3@@9 f_5@@1))
 :pattern ( (MapType1Select QPMask@0 o_3@@9 f_5@@1))
)) (state Heap@@9 QPMask@0)) (and (state Heap@@9 QPMask@0) (state Heap@@9 QPMask@0))) (and (=> (= (ControlFlow 0 19) (- 0 24)) (forall ((i_2 Int) ) (!  (=> (dummyFunction (MapType0Select Heap@@9 (loc arr1 i_2) val)) (>= (ite  (and (<= 0 i_2) (< i_2 10)) FullPerm NoPerm) NoPerm))
 :qid |stdinbpl.334:21|
 :skolemid |31|
 :pattern ( (loc arr1 i_2))
 :pattern ( (loc arr1 i_2))
))) (=> (forall ((i_2@@0 Int) ) (!  (=> (dummyFunction (MapType0Select Heap@@9 (loc arr1 i_2@@0) val)) (>= (ite  (and (<= 0 i_2@@0) (< i_2@@0 10)) FullPerm NoPerm) NoPerm))
 :qid |stdinbpl.334:21|
 :skolemid |31|
 :pattern ( (loc arr1 i_2@@0))
 :pattern ( (loc arr1 i_2@@0))
)) (and (=> (= (ControlFlow 0 19) (- 0 23)) (forall ((i_2@@1 Int) (i_2_1 Int) ) (!  (=> (and (and (not (= i_2@@1 i_2_1)) (< NoPerm (ite  (and (<= 0 i_2@@1) (< i_2@@1 10)) FullPerm NoPerm))) (< NoPerm (ite  (and (<= 0 i_2_1) (< i_2_1 10)) FullPerm NoPerm))) (not (= (loc arr1 i_2@@1) (loc arr1 i_2_1))))
 :qid |stdinbpl.341:21|
 :skolemid |32|
 :pattern ( (neverTriggered2 i_2@@1) (neverTriggered2 i_2_1))
))) (=> (forall ((i_2@@2 Int) (i_2_1@@0 Int) ) (!  (=> (and (and (not (= i_2@@2 i_2_1@@0)) (< NoPerm (ite  (and (<= 0 i_2@@2) (< i_2@@2 10)) FullPerm NoPerm))) (< NoPerm (ite  (and (<= 0 i_2_1@@0) (< i_2_1@@0 10)) FullPerm NoPerm))) (not (= (loc arr1 i_2@@2) (loc arr1 i_2_1@@0))))
 :qid |stdinbpl.341:21|
 :skolemid |32|
 :pattern ( (neverTriggered2 i_2@@2) (neverTriggered2 i_2_1@@0))
)) (and (=> (= (ControlFlow 0 19) (- 0 22)) (forall ((i_2@@3 Int) ) (! (>= (U_2_real (MapType1Select QPMask@0 (loc arr1 i_2@@3) val)) (ite  (and (<= 0 i_2@@3) (< i_2@@3 10)) FullPerm NoPerm))
 :qid |stdinbpl.348:21|
 :skolemid |33|
 :pattern ( (loc arr1 i_2@@3))
 :pattern ( (loc arr1 i_2@@3))
))) (=> (forall ((i_2@@4 Int) ) (! (>= (U_2_real (MapType1Select QPMask@0 (loc arr1 i_2@@4) val)) (ite  (and (<= 0 i_2@@4) (< i_2@@4 10)) FullPerm NoPerm))
 :qid |stdinbpl.348:21|
 :skolemid |33|
 :pattern ( (loc arr1 i_2@@4))
 :pattern ( (loc arr1 i_2@@4))
)) (=> (and (and (forall ((i_2@@5 Int) ) (!  (=> (< NoPerm (ite  (and (<= 0 i_2@@5) (< i_2@@5 10)) FullPerm NoPerm)) (and (qpRange2 (loc arr1 i_2@@5)) (= (invRecv2 (loc arr1 i_2@@5)) i_2@@5)))
 :qid |stdinbpl.354:26|
 :skolemid |34|
 :pattern ( (loc arr1 i_2@@5))
 :pattern ( (loc arr1 i_2@@5))
)) (forall ((o_3@@10 T@U) ) (!  (=> (= (type o_3@@10) RefType) (=> (and (< NoPerm (ite  (and (<= 0 (invRecv2 o_3@@10)) (< (invRecv2 o_3@@10) 10)) FullPerm NoPerm)) (qpRange2 o_3@@10)) (= (loc arr1 (invRecv2 o_3@@10)) o_3@@10)))
 :qid |stdinbpl.358:26|
 :skolemid |35|
 :pattern ( (invRecv2 o_3@@10))
))) (and (forall ((o_3@@11 T@U) ) (!  (=> (= (type o_3@@11) RefType) (and (=> (and (< NoPerm (ite  (and (<= 0 (invRecv2 o_3@@11)) (< (invRecv2 o_3@@11) 10)) FullPerm NoPerm)) (qpRange2 o_3@@11)) (and (= (loc arr1 (invRecv2 o_3@@11)) o_3@@11) (= (U_2_real (MapType1Select QPMask@1 o_3@@11 val)) (- (U_2_real (MapType1Select QPMask@0 o_3@@11 val)) (ite  (and (<= 0 (invRecv2 o_3@@11)) (< (invRecv2 o_3@@11) 10)) FullPerm NoPerm))))) (=> (not (and (< NoPerm (ite  (and (<= 0 (invRecv2 o_3@@11)) (< (invRecv2 o_3@@11) 10)) FullPerm NoPerm)) (qpRange2 o_3@@11))) (= (U_2_real (MapType1Select QPMask@1 o_3@@11 val)) (U_2_real (MapType1Select QPMask@0 o_3@@11 val))))))
 :qid |stdinbpl.364:26|
 :skolemid |36|
 :pattern ( (MapType1Select QPMask@1 o_3@@11 val))
)) (forall ((o_3@@12 T@U) (f_5@@2 T@U) ) (! (let ((B@@14 (FieldTypeInv1 (type f_5@@2))))
(let ((A@@15 (FieldTypeInv0 (type f_5@@2))))
 (=> (and (and (= (type o_3@@12) RefType) (= (type f_5@@2) (FieldType A@@15 B@@14))) (not (= f_5@@2 val))) (= (U_2_real (MapType1Select QPMask@0 o_3@@12 f_5@@2)) (U_2_real (MapType1Select QPMask@1 o_3@@12 f_5@@2))))))
 :qid |stdinbpl.370:33|
 :skolemid |37|
 :pattern ( (MapType1Select QPMask@1 o_3@@12 f_5@@2))
)))) (and (=> (= (ControlFlow 0 19) (- 0 21)) (<= 0 0)) (=> (<= 0 0) (and (=> (= (ControlFlow 0 19) (- 0 20)) (<= 0 10)) (=> (<= 0 10) (=> (IdenticalOnKnownLocations Heap@@9 ExhaleHeap@0 QPMask@1) (and (and (and (=> (= (ControlFlow 0 19) 3) anon12_Then_correct) (=> (= (ControlFlow 0 19) 13) anon12_Else_correct)) (=> (= (ControlFlow 0 19) 15) anon11_Then_correct)) (=> (= (ControlFlow 0 19) 17) anon11_Else_correct)))))))))))))))))))))))
(let ((anon9_Then_correct true))
(let ((anon0_correct  (=> (state Heap@@9 ZeroMask) (and (=> (= (ControlFlow 0 27) 1) anon9_Then_correct) (=> (= (ControlFlow 0 27) 19) anon9_Else_correct)))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 28) 27) anon0_correct)))
PreconditionGeneratedEntry_correct)))))))))
))
(check-sat)
(get-info :reason-unknown)
(assert (not (= (ControlFlow 0 3) (- 8))))
(check-sat)
(pop 1)
; Invalid
(get-info :rlimit)
