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
(declare-fun len (T@U) Int)
(declare-fun IArrayDomainTypeType () T@T)
(declare-fun dummyHeap () T@U)
(declare-fun ZeroMask () T@U)
(declare-fun InsidePredicate (T@U T@U T@U T@U) Bool)
(declare-fun sumMask (T@U T@U T@U) Bool)
(declare-fun ConditionalFrame (Real T@U) T@U)
(declare-fun EmptyFrame () T@U)
(declare-fun NoPerm () Real)
(declare-fun loc (T@U Int) T@U)
(declare-fun first (T@U) T@U)
(declare-fun second (T@U) Int)
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
(assert (= (Ctor IArrayDomainTypeType) 12))
(assert (forall ((a_3 T@U) ) (!  (=> (= (type a_3) IArrayDomainTypeType) (>= (len a_3) 0))
 :qid |stdinbpl.237:15|
 :skolemid |23|
 :pattern ( (len a_3))
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
 :qid |stdinbpl.206:19|
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
 :qid |stdinbpl.194:15|
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
)) (forall ((arg0@@27 T@U) ) (! (= (type (first arg0@@27)) IArrayDomainTypeType)
 :qid |funType:first|
 :pattern ( (first arg0@@27))
))))
(assert (forall ((a_3@@0 T@U) (i_1 Int) ) (!  (=> (= (type a_3@@0) IArrayDomainTypeType) (and (= (first (loc a_3@@0 i_1)) a_3@@0) (= (second (loc a_3@@0 i_1)) i_1)))
 :qid |stdinbpl.231:15|
 :skolemid |22|
 :pattern ( (loc a_3@@0 i_1))
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
 :qid |stdinbpl.201:25|
 :skolemid |20|
 :pattern ( (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun i_3 () Int)
(declare-fun a_3@@1 () T@U)
(declare-fun QPMask@7 () T@U)
(declare-fun PostHeap@0 () T@U)
(declare-fun key () Int)
(declare-fun index () Int)
(declare-fun Heap@@9 () T@U)
(declare-fun j$1 () Int)
(declare-fun QPMask@0 () T@U)
(declare-fun qpRange2 (T@U) Bool)
(declare-fun invRecv2 (T@U) Int)
(declare-fun i_6 () Int)
(declare-fun high@0 () Int)
(declare-fun i_11 () Int)
(declare-fun low@2 () Int)
(declare-fun high@2 () Int)
(declare-fun ExhaleHeap@0 () T@U)
(declare-fun index@3 () Int)
(declare-fun j$3_5 () Int)
(declare-fun QPMask@2 () T@U)
(declare-fun neverTriggered7 (Int) Bool)
(declare-fun qpRange7 (T@U) Bool)
(declare-fun invRecv7 (T@U) Int)
(declare-fun QPMask@5 () T@U)
(declare-fun low@0 () Int)
(declare-fun mid@0 () Int)
(declare-fun index@2 () Int)
(declare-fun index@1 () Int)
(declare-fun low@1 () Int)
(declare-fun high@1 () Int)
(declare-fun qpRange6 (T@U) Bool)
(declare-fun invRecv6 (T@U) Int)
(declare-fun i_4_1 () Int)
(declare-fun j$1_2 () Int)
(declare-fun QPMask@3 () T@U)
(declare-fun neverTriggered3 (Int) Bool)
(declare-fun qpRange3 (T@U) Bool)
(declare-fun invRecv3 (T@U) Int)
(declare-fun QPMask@4 () T@U)
(declare-fun QPMask@1 () T@U)
(declare-fun qpRange8 (T@U) Bool)
(declare-fun invRecv8 (T@U) Int)
(declare-fun i_4 () Int)
(declare-fun QPMask@6 () T@U)
(declare-fun j$3_1 () Int)
(declare-fun qpRange5 (T@U) Bool)
(declare-fun invRecv5 (T@U) Int)
(declare-fun index@0 () Int)
(declare-fun j$3 () Int)
(declare-fun neverTriggered4 (Int) Bool)
(declare-fun qpRange4 (T@U) Bool)
(declare-fun invRecv4 (T@U) Int)
(declare-fun i_2 () Int)
(declare-fun j () Int)
(declare-fun qpRange1 (T@U) Bool)
(declare-fun invRecv1 (T@U) Int)
(assert  (and (and (and (and (and (and (and (and (and (and (and (= (type a_3@@1) IArrayDomainTypeType) (= (type QPMask@0) (MapType1Type RefType realType))) (= (type Heap@@9) (MapType0Type RefType))) (= (type QPMask@6) (MapType1Type RefType realType))) (= (type ExhaleHeap@0) (MapType0Type RefType))) (= (type QPMask@1) (MapType1Type RefType realType))) (= (type QPMask@3) (MapType1Type RefType realType))) (= (type QPMask@4) (MapType1Type RefType realType))) (= (type QPMask@2) (MapType1Type RefType realType))) (= (type QPMask@5) (MapType1Type RefType realType))) (= (type QPMask@7) (MapType1Type RefType realType))) (= (type PostHeap@0) (MapType0Type RefType))))
(set-info :boogie-vc-id binary_search)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 147) (let ((anon19_correct true))
(let ((anon101_Else_correct  (=> (and (not (and (<= 0 i_3) (< i_3 (len a_3@@1)))) (= (ControlFlow 0 133) 130)) anon19_correct)))
(let ((anon101_Then_correct  (=> (and (<= 0 i_3) (< i_3 (len a_3@@1))) (and (=> (= (ControlFlow 0 131) (- 0 132)) (HasDirectPerm QPMask@7 (loc a_3@@1 i_3) val)) (=> (HasDirectPerm QPMask@7 (loc a_3@@1 i_3) val) (=> (= (ControlFlow 0 131) 130) anon19_correct))))))
(let ((anon21_correct true))
(let ((anon100_Else_correct  (=> (and (forall ((i_3_1 Int) ) (!  (=> (and (<= 0 i_3_1) (< i_3_1 (len a_3@@1))) (not (= (U_2_int (MapType0Select PostHeap@0 (loc a_3@@1 i_3_1) val)) key)))
 :qid |stdinbpl.431:22|
 :skolemid |38|
 :pattern ( (loc a_3@@1 i_3_1))
)) (= (ControlFlow 0 129) 127)) anon21_correct)))
(let ((anon99_Then_correct  (=> (= (- 0 1) index) (and (and (=> (= (ControlFlow 0 134) 129) anon100_Else_correct) (=> (= (ControlFlow 0 134) 131) anon101_Then_correct)) (=> (= (ControlFlow 0 134) 133) anon101_Else_correct)))))
(let ((anon99_Else_correct  (=> (and (not (= (- 0 1) index)) (= (ControlFlow 0 128) 127)) anon21_correct)))
(let ((anon15_correct  (=> (state PostHeap@0 QPMask@7) (and (=> (= (ControlFlow 0 135) 134) anon99_Then_correct) (=> (= (ControlFlow 0 135) 128) anon99_Else_correct)))))
(let ((anon98_Else_correct  (=> (and (< index 0) (= (ControlFlow 0 138) 135)) anon15_correct)))
(let ((anon98_Then_correct  (=> (<= 0 index) (and (=> (= (ControlFlow 0 136) (- 0 137)) (HasDirectPerm QPMask@7 (loc a_3@@1 index) val)) (=> (HasDirectPerm QPMask@7 (loc a_3@@1 index) val) (=> (and (= (U_2_int (MapType0Select PostHeap@0 (loc a_3@@1 index) val)) key) (= (ControlFlow 0 136) 135)) anon15_correct))))))
(let ((anon96_Else_correct  (=> (forall ((j$1_1 Int) ) (!  (=> (and (<= 0 j$1_1) (< j$1_1 (len a_3@@1))) (= (U_2_int (MapType0Select PostHeap@0 (loc a_3@@1 j$1_1) val)) (U_2_int (MapType0Select Heap@@9 (loc a_3@@1 j$1_1) val))))
 :qid |stdinbpl.405:20|
 :skolemid |37|
 :pattern ( (loc a_3@@1 j$1_1))
)) (=> (and (and (state PostHeap@0 QPMask@7) (<= (- 0 1) index)) (and (< index (len a_3@@1)) (state PostHeap@0 QPMask@7))) (and (=> (= (ControlFlow 0 139) 136) anon98_Then_correct) (=> (= (ControlFlow 0 139) 138) anon98_Else_correct))))))
(let ((anon12_correct true))
(let ((anon97_Else_correct  (=> (and (not (and (<= 0 j$1) (< j$1 (len a_3@@1)))) (= (ControlFlow 0 126) 122)) anon12_correct)))
(let ((anon97_Then_correct  (=> (and (<= 0 j$1) (< j$1 (len a_3@@1))) (and (=> (= (ControlFlow 0 123) (- 0 125)) (HasDirectPerm QPMask@7 (loc a_3@@1 j$1) val)) (=> (HasDirectPerm QPMask@7 (loc a_3@@1 j$1) val) (and (=> (= (ControlFlow 0 123) (- 0 124)) (HasDirectPerm QPMask@0 (loc a_3@@1 j$1) val)) (=> (HasDirectPerm QPMask@0 (loc a_3@@1 j$1) val) (=> (= (ControlFlow 0 123) 122) anon12_correct))))))))
(let ((anon95_Else_correct  (and (=> (= (ControlFlow 0 140) (- 0 141)) (forall ((j$0_1 Int) (j$0_1_1 Int) ) (!  (=> (and (and (and (and (not (= j$0_1 j$0_1_1)) (and (<= 0 j$0_1) (< j$0_1 (len a_3@@1)))) (and (<= 0 j$0_1_1) (< j$0_1_1 (len a_3@@1)))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (loc a_3@@1 j$0_1) (loc a_3@@1 j$0_1_1))))
 :qid |stdinbpl.362:15|
 :skolemid |31|
))) (=> (forall ((j$0_1@@0 Int) (j$0_1_1@@0 Int) ) (!  (=> (and (and (and (and (not (= j$0_1@@0 j$0_1_1@@0)) (and (<= 0 j$0_1@@0) (< j$0_1@@0 (len a_3@@1)))) (and (<= 0 j$0_1_1@@0) (< j$0_1_1@@0 (len a_3@@1)))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (loc a_3@@1 j$0_1@@0) (loc a_3@@1 j$0_1_1@@0))))
 :qid |stdinbpl.362:15|
 :skolemid |31|
)) (=> (and (forall ((j$0_1@@1 Int) ) (!  (=> (and (and (<= 0 j$0_1@@1) (< j$0_1@@1 (len a_3@@1))) (< NoPerm FullPerm)) (and (qpRange2 (loc a_3@@1 j$0_1@@1)) (= (invRecv2 (loc a_3@@1 j$0_1@@1)) j$0_1@@1)))
 :qid |stdinbpl.368:22|
 :skolemid |32|
 :pattern ( (loc a_3@@1 j$0_1@@1))
 :pattern ( (loc a_3@@1 j$0_1@@1))
)) (forall ((o_3 T@U) ) (!  (=> (= (type o_3) RefType) (=> (and (and (and (<= 0 (invRecv2 o_3)) (< (invRecv2 o_3) (len a_3@@1))) (< NoPerm FullPerm)) (qpRange2 o_3)) (= (loc a_3@@1 (invRecv2 o_3)) o_3)))
 :qid |stdinbpl.372:22|
 :skolemid |33|
 :pattern ( (invRecv2 o_3))
))) (=> (and (and (forall ((j$0_1@@2 Int) ) (!  (=> (and (<= 0 j$0_1@@2) (< j$0_1@@2 (len a_3@@1))) (not (= (loc a_3@@1 j$0_1@@2) null)))
 :qid |stdinbpl.378:22|
 :skolemid |34|
 :pattern ( (loc a_3@@1 j$0_1@@2))
 :pattern ( (loc a_3@@1 j$0_1@@2))
)) (forall ((o_3@@0 T@U) ) (!  (=> (= (type o_3@@0) RefType) (and (=> (and (and (and (<= 0 (invRecv2 o_3@@0)) (< (invRecv2 o_3@@0) (len a_3@@1))) (< NoPerm FullPerm)) (qpRange2 o_3@@0)) (and (=> (< NoPerm FullPerm) (= (loc a_3@@1 (invRecv2 o_3@@0)) o_3@@0)) (= (U_2_real (MapType1Select QPMask@7 o_3@@0 val)) (+ (U_2_real (MapType1Select ZeroMask o_3@@0 val)) FullPerm)))) (=> (not (and (and (and (<= 0 (invRecv2 o_3@@0)) (< (invRecv2 o_3@@0) (len a_3@@1))) (< NoPerm FullPerm)) (qpRange2 o_3@@0))) (= (U_2_real (MapType1Select QPMask@7 o_3@@0 val)) (U_2_real (MapType1Select ZeroMask o_3@@0 val))))))
 :qid |stdinbpl.384:22|
 :skolemid |35|
 :pattern ( (MapType1Select QPMask@7 o_3@@0 val))
))) (and (forall ((o_3@@1 T@U) (f_5 T@U) ) (! (let ((B@@11 (FieldTypeInv1 (type f_5))))
(let ((A@@12 (FieldTypeInv0 (type f_5))))
 (=> (and (and (= (type o_3@@1) RefType) (= (type f_5) (FieldType A@@12 B@@11))) (not (= f_5 val))) (= (U_2_real (MapType1Select ZeroMask o_3@@1 f_5)) (U_2_real (MapType1Select QPMask@7 o_3@@1 f_5))))))
 :qid |stdinbpl.388:29|
 :skolemid |36|
 :pattern ( (MapType1Select ZeroMask o_3@@1 f_5))
 :pattern ( (MapType1Select QPMask@7 o_3@@1 f_5))
)) (state PostHeap@0 QPMask@7))) (and (and (=> (= (ControlFlow 0 140) 139) anon96_Else_correct) (=> (= (ControlFlow 0 140) 123) anon97_Then_correct)) (=> (= (ControlFlow 0 140) 126) anon97_Else_correct))))))))
(let ((anon95_Then_correct true))
(let ((anon94_Then_correct  (=> (state PostHeap@0 ZeroMask) (and (=> (= (ControlFlow 0 142) 121) anon95_Then_correct) (=> (= (ControlFlow 0 142) 140) anon95_Else_correct)))))
(let ((anon30_correct true))
(let ((anon106_Else_correct  (=> (and (not (and (<= 0 i_6) (and (< i_6 (len a_3@@1)) (not (and (<= 0 i_6) (< i_6 high@0)))))) (= (ControlFlow 0 112) 109)) anon30_correct)))
(let ((anon106_Then_correct  (=> (and (<= 0 i_6) (and (< i_6 (len a_3@@1)) (not (and (<= 0 i_6) (< i_6 high@0))))) (and (=> (= (ControlFlow 0 110) (- 0 111)) (not (= (U_2_int (MapType0Select Heap@@9 (loc a_3@@1 i_6) val)) key))) (=> (not (= (U_2_int (MapType0Select Heap@@9 (loc a_3@@1 i_6) val)) key)) (=> (= (ControlFlow 0 110) 109) anon30_correct))))))
(let ((anon69_correct true))
(let ((anon125_Else_correct  (=> (and (not (and (<= 0 i_11) (and (< i_11 (len a_3@@1)) (not (and (<= low@2 i_11) (< i_11 high@2)))))) (= (ControlFlow 0 76) 73)) anon69_correct)))
(let ((anon125_Then_correct  (=> (and (<= 0 i_11) (and (< i_11 (len a_3@@1)) (not (and (<= low@2 i_11) (< i_11 high@2))))) (and (=> (= (ControlFlow 0 74) (- 0 75)) (not (= (U_2_int (MapType0Select ExhaleHeap@0 (loc a_3@@1 i_11) val)) key))) (=> (not (= (U_2_int (MapType0Select ExhaleHeap@0 (loc a_3@@1 i_11) val)) key)) (=> (= (ControlFlow 0 74) 73) anon69_correct))))))
(let ((anon73_correct true))
(let ((anon126_Else_correct  (=> (and (< index@3 0) (= (ControlFlow 0 67) 64)) anon73_correct)))
(let ((anon126_Then_correct  (=> (<= 0 index@3) (and (=> (= (ControlFlow 0 65) (- 0 66)) (= (U_2_int (MapType0Select ExhaleHeap@0 (loc a_3@@1 index@3) val)) key)) (=> (= (U_2_int (MapType0Select ExhaleHeap@0 (loc a_3@@1 index@3) val)) key) (=> (= (ControlFlow 0 65) 64) anon73_correct))))))
(let ((anon71_correct  (and (=> (= (ControlFlow 0 68) (- 0 70)) (<= (- 0 1) index@3)) (=> (<= (- 0 1) index@3) (and (=> (= (ControlFlow 0 68) (- 0 69)) (< index@3 (len a_3@@1))) (=> (< index@3 (len a_3@@1)) (and (=> (= (ControlFlow 0 68) 65) anon126_Then_correct) (=> (= (ControlFlow 0 68) 67) anon126_Else_correct))))))))
(let ((anon124_Else_correct  (=> (and (forall ((i_12_1 Int) ) (!  (=> (and (<= 0 i_12_1) (and (< i_12_1 (len a_3@@1)) (not (and (<= low@2 i_12_1) (< i_12_1 high@2))))) (not (= (U_2_int (MapType0Select ExhaleHeap@0 (loc a_3@@1 i_12_1) val)) key)))
 :qid |stdinbpl.813:26|
 :skolemid |70|
 :pattern ( (loc a_3@@1 i_12_1))
)) (= (ControlFlow 0 72) 68)) anon71_correct)))
(let ((anon123_Then_correct  (=> (= index@3 (- 0 1)) (and (and (=> (= (ControlFlow 0 77) 72) anon124_Else_correct) (=> (= (ControlFlow 0 77) 74) anon125_Then_correct)) (=> (= (ControlFlow 0 77) 76) anon125_Else_correct)))))
(let ((anon123_Else_correct  (=> (and (not (= index@3 (- 0 1))) (= (ControlFlow 0 71) 68)) anon71_correct)))
(let ((anon121_Else_correct  (=> (forall ((j$3_6_1 Int) ) (!  (=> (and (<= 0 j$3_6_1) (< j$3_6_1 (len a_3@@1))) (= (U_2_int (MapType0Select ExhaleHeap@0 (loc a_3@@1 j$3_6_1) val)) (U_2_int (MapType0Select Heap@@9 (loc a_3@@1 j$3_6_1) val))))
 :qid |stdinbpl.795:24|
 :skolemid |69|
 :pattern ( (loc a_3@@1 j$3_6_1))
)) (and (=> (= (ControlFlow 0 78) (- 0 81)) (<= 0 low@2)) (=> (<= 0 low@2) (and (=> (= (ControlFlow 0 78) (- 0 80)) (<= low@2 high@2)) (=> (<= low@2 high@2) (and (=> (= (ControlFlow 0 78) (- 0 79)) (<= high@2 (len a_3@@1))) (=> (<= high@2 (len a_3@@1)) (and (=> (= (ControlFlow 0 78) 77) anon123_Then_correct) (=> (= (ControlFlow 0 78) 71) anon123_Else_correct)))))))))))
(let ((anon64_correct true))
(let ((anon122_Else_correct  (=> (and (not (and (<= 0 j$3_5) (< j$3_5 (len a_3@@1)))) (= (ControlFlow 0 63) 60)) anon64_correct)))
(let ((anon122_Then_correct  (=> (and (<= 0 j$3_5) (< j$3_5 (len a_3@@1))) (and (=> (= (ControlFlow 0 61) (- 0 62)) (= (U_2_int (MapType0Select ExhaleHeap@0 (loc a_3@@1 j$3_5) val)) (U_2_int (MapType0Select Heap@@9 (loc a_3@@1 j$3_5) val)))) (=> (= (U_2_int (MapType0Select ExhaleHeap@0 (loc a_3@@1 j$3_5) val)) (U_2_int (MapType0Select Heap@@9 (loc a_3@@1 j$3_5) val))) (=> (= (ControlFlow 0 61) 60) anon64_correct))))))
(let ((anon61_correct  (=> (state ExhaleHeap@0 QPMask@2) (and (=> (= (ControlFlow 0 82) (- 0 84)) (forall ((j$2_4 Int) (j$2_4_1 Int) ) (!  (=> (and (and (and (and (not (= j$2_4 j$2_4_1)) (and (<= 0 j$2_4) (< j$2_4 (len a_3@@1)))) (and (<= 0 j$2_4_1) (< j$2_4_1 (len a_3@@1)))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (loc a_3@@1 j$2_4) (loc a_3@@1 j$2_4_1))))
 :qid |stdinbpl.754:21|
 :skolemid |63|
 :pattern ( (neverTriggered7 j$2_4) (neverTriggered7 j$2_4_1))
))) (=> (forall ((j$2_4@@0 Int) (j$2_4_1@@0 Int) ) (!  (=> (and (and (and (and (not (= j$2_4@@0 j$2_4_1@@0)) (and (<= 0 j$2_4@@0) (< j$2_4@@0 (len a_3@@1)))) (and (<= 0 j$2_4_1@@0) (< j$2_4_1@@0 (len a_3@@1)))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (loc a_3@@1 j$2_4@@0) (loc a_3@@1 j$2_4_1@@0))))
 :qid |stdinbpl.754:21|
 :skolemid |63|
 :pattern ( (neverTriggered7 j$2_4@@0) (neverTriggered7 j$2_4_1@@0))
)) (and (=> (= (ControlFlow 0 82) (- 0 83)) (forall ((j$2_4@@1 Int) ) (!  (=> (and (<= 0 j$2_4@@1) (< j$2_4@@1 (len a_3@@1))) (>= (U_2_real (MapType1Select QPMask@2 (loc a_3@@1 j$2_4@@1) val)) FullPerm))
 :qid |stdinbpl.761:21|
 :skolemid |64|
 :pattern ( (loc a_3@@1 j$2_4@@1))
 :pattern ( (loc a_3@@1 j$2_4@@1))
))) (=> (forall ((j$2_4@@2 Int) ) (!  (=> (and (<= 0 j$2_4@@2) (< j$2_4@@2 (len a_3@@1))) (>= (U_2_real (MapType1Select QPMask@2 (loc a_3@@1 j$2_4@@2) val)) FullPerm))
 :qid |stdinbpl.761:21|
 :skolemid |64|
 :pattern ( (loc a_3@@1 j$2_4@@2))
 :pattern ( (loc a_3@@1 j$2_4@@2))
)) (=> (and (and (forall ((j$2_4@@3 Int) ) (!  (=> (and (and (<= 0 j$2_4@@3) (< j$2_4@@3 (len a_3@@1))) (< NoPerm FullPerm)) (and (qpRange7 (loc a_3@@1 j$2_4@@3)) (= (invRecv7 (loc a_3@@1 j$2_4@@3)) j$2_4@@3)))
 :qid |stdinbpl.767:26|
 :skolemid |65|
 :pattern ( (loc a_3@@1 j$2_4@@3))
 :pattern ( (loc a_3@@1 j$2_4@@3))
)) (forall ((o_3@@2 T@U) ) (!  (=> (= (type o_3@@2) RefType) (=> (and (and (<= 0 (invRecv7 o_3@@2)) (< (invRecv7 o_3@@2) (len a_3@@1))) (and (< NoPerm FullPerm) (qpRange7 o_3@@2))) (= (loc a_3@@1 (invRecv7 o_3@@2)) o_3@@2)))
 :qid |stdinbpl.771:26|
 :skolemid |66|
 :pattern ( (invRecv7 o_3@@2))
))) (and (forall ((o_3@@3 T@U) ) (!  (=> (= (type o_3@@3) RefType) (and (=> (and (and (<= 0 (invRecv7 o_3@@3)) (< (invRecv7 o_3@@3) (len a_3@@1))) (and (< NoPerm FullPerm) (qpRange7 o_3@@3))) (and (= (loc a_3@@1 (invRecv7 o_3@@3)) o_3@@3) (= (U_2_real (MapType1Select QPMask@5 o_3@@3 val)) (- (U_2_real (MapType1Select QPMask@2 o_3@@3 val)) FullPerm)))) (=> (not (and (and (<= 0 (invRecv7 o_3@@3)) (< (invRecv7 o_3@@3) (len a_3@@1))) (and (< NoPerm FullPerm) (qpRange7 o_3@@3)))) (= (U_2_real (MapType1Select QPMask@5 o_3@@3 val)) (U_2_real (MapType1Select QPMask@2 o_3@@3 val))))))
 :qid |stdinbpl.777:26|
 :skolemid |67|
 :pattern ( (MapType1Select QPMask@5 o_3@@3 val))
)) (forall ((o_3@@4 T@U) (f_5@@0 T@U) ) (! (let ((B@@12 (FieldTypeInv1 (type f_5@@0))))
(let ((A@@13 (FieldTypeInv0 (type f_5@@0))))
 (=> (and (and (= (type o_3@@4) RefType) (= (type f_5@@0) (FieldType A@@13 B@@12))) (not (= f_5@@0 val))) (= (U_2_real (MapType1Select QPMask@2 o_3@@4 f_5@@0)) (U_2_real (MapType1Select QPMask@5 o_3@@4 f_5@@0))))))
 :qid |stdinbpl.783:33|
 :skolemid |68|
 :pattern ( (MapType1Select QPMask@5 o_3@@4 f_5@@0))
)))) (and (and (=> (= (ControlFlow 0 82) 78) anon121_Else_correct) (=> (= (ControlFlow 0 82) 61) anon122_Then_correct)) (=> (= (ControlFlow 0 82) 63) anon122_Else_correct))))))))))
(let ((anon60_correct  (=> (state ExhaleHeap@0 QPMask@2) (=> (and (and (= low@2 low@0) (= high@2 mid@0)) (and (= index@3 index@2) (= (ControlFlow 0 86) 82))) anon61_correct))))
(let ((anon120_Else_correct  (=> (<= (U_2_int (MapType0Select ExhaleHeap@0 (loc a_3@@1 mid@0) val)) key) (=> (and (and (state ExhaleHeap@0 QPMask@2) (state ExhaleHeap@0 QPMask@2)) (and (= index@2 mid@0) (= (ControlFlow 0 88) 86))) anon60_correct))))
(let ((anon120_Then_correct  (=> (and (and (< key (U_2_int (MapType0Select ExhaleHeap@0 (loc a_3@@1 mid@0) val))) (state ExhaleHeap@0 QPMask@2)) (and (= index@2 index@1) (= (ControlFlow 0 87) 86))) anon60_correct)))
(let ((anon119_Else_correct  (=> (<= key (U_2_int (MapType0Select ExhaleHeap@0 (loc a_3@@1 mid@0) val))) (and (=> (= (ControlFlow 0 89) (- 0 90)) (HasDirectPerm QPMask@2 (loc a_3@@1 mid@0) val)) (=> (HasDirectPerm QPMask@2 (loc a_3@@1 mid@0) val) (and (=> (= (ControlFlow 0 89) 87) anon120_Then_correct) (=> (= (ControlFlow 0 89) 88) anon120_Else_correct)))))))
(let ((anon119_Then_correct  (=> (< (U_2_int (MapType0Select ExhaleHeap@0 (loc a_3@@1 mid@0) val)) key) (=> (and (= low@1 (+ mid@0 1)) (state ExhaleHeap@0 QPMask@2)) (=> (and (and (= low@2 low@1) (= high@2 high@1)) (and (= index@3 index@1) (= (ControlFlow 0 85) 82))) anon61_correct)))))
(let ((anon55_correct  (=> (state ExhaleHeap@0 QPMask@2) (=> (and (and (< low@0 high@1) (state ExhaleHeap@0 QPMask@2)) (and (= mid@0 (div (+ low@0 high@1) 2)) (state ExhaleHeap@0 QPMask@2))) (and (=> (= (ControlFlow 0 91) (- 0 92)) (HasDirectPerm QPMask@2 (loc a_3@@1 mid@0) val)) (=> (HasDirectPerm QPMask@2 (loc a_3@@1 mid@0) val) (and (=> (= (ControlFlow 0 91) 85) anon119_Then_correct) (=> (= (ControlFlow 0 91) 89) anon119_Else_correct))))))))
(let ((anon118_Else_correct  (=> (and (< index@1 0) (= (ControlFlow 0 94) 91)) anon55_correct)))
(let ((anon118_Then_correct  (=> (<= 0 index@1) (=> (and (= (U_2_int (MapType0Select ExhaleHeap@0 (loc a_3@@1 index@1) val)) key) (= (ControlFlow 0 93) 91)) anon55_correct))))
(let ((anon53_correct  (=> (and (<= (- 0 1) index@1) (< index@1 (len a_3@@1))) (and (=> (= (ControlFlow 0 95) 93) anon118_Then_correct) (=> (= (ControlFlow 0 95) 94) anon118_Else_correct)))))
(let ((anon117_Else_correct  (=> (and (not (= index@1 (- 0 1))) (= (ControlFlow 0 97) 95)) anon53_correct)))
(let ((anon117_Then_correct  (=> (= index@1 (- 0 1)) (=> (and (forall ((i_10 Int) ) (!  (=> (and (<= 0 i_10) (and (< i_10 (len a_3@@1)) (not (and (<= low@0 i_10) (< i_10 high@1))))) (not (= (U_2_int (MapType0Select ExhaleHeap@0 (loc a_3@@1 i_10) val)) key)))
 :qid |stdinbpl.688:26|
 :skolemid |62|
 :pattern ( (loc a_3@@1 i_10))
)) (= (ControlFlow 0 96) 95)) anon53_correct))))
(let ((anon116_Then_correct  (=> (state ExhaleHeap@0 ZeroMask) (and (=> (= (ControlFlow 0 98) (- 0 99)) (forall ((j$2_3 Int) (j$2_3_1 Int) ) (!  (=> (and (and (and (and (not (= j$2_3 j$2_3_1)) (and (<= 0 j$2_3) (< j$2_3 (len a_3@@1)))) (and (<= 0 j$2_3_1) (< j$2_3_1 (len a_3@@1)))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (loc a_3@@1 j$2_3) (loc a_3@@1 j$2_3_1))))
 :qid |stdinbpl.648:19|
 :skolemid |55|
))) (=> (forall ((j$2_3@@0 Int) (j$2_3_1@@0 Int) ) (!  (=> (and (and (and (and (not (= j$2_3@@0 j$2_3_1@@0)) (and (<= 0 j$2_3@@0) (< j$2_3@@0 (len a_3@@1)))) (and (<= 0 j$2_3_1@@0) (< j$2_3_1@@0 (len a_3@@1)))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (loc a_3@@1 j$2_3@@0) (loc a_3@@1 j$2_3_1@@0))))
 :qid |stdinbpl.648:19|
 :skolemid |55|
)) (=> (and (forall ((j$2_3@@1 Int) ) (!  (=> (and (and (<= 0 j$2_3@@1) (< j$2_3@@1 (len a_3@@1))) (< NoPerm FullPerm)) (and (qpRange6 (loc a_3@@1 j$2_3@@1)) (= (invRecv6 (loc a_3@@1 j$2_3@@1)) j$2_3@@1)))
 :qid |stdinbpl.654:26|
 :skolemid |56|
 :pattern ( (loc a_3@@1 j$2_3@@1))
 :pattern ( (loc a_3@@1 j$2_3@@1))
)) (forall ((o_3@@5 T@U) ) (!  (=> (= (type o_3@@5) RefType) (=> (and (and (and (<= 0 (invRecv6 o_3@@5)) (< (invRecv6 o_3@@5) (len a_3@@1))) (< NoPerm FullPerm)) (qpRange6 o_3@@5)) (= (loc a_3@@1 (invRecv6 o_3@@5)) o_3@@5)))
 :qid |stdinbpl.658:26|
 :skolemid |57|
 :pattern ( (invRecv6 o_3@@5))
))) (=> (and (and (and (forall ((j$2_3@@2 Int) ) (!  (=> (and (<= 0 j$2_3@@2) (< j$2_3@@2 (len a_3@@1))) (not (= (loc a_3@@1 j$2_3@@2) null)))
 :qid |stdinbpl.664:26|
 :skolemid |58|
 :pattern ( (loc a_3@@1 j$2_3@@2))
 :pattern ( (loc a_3@@1 j$2_3@@2))
)) (forall ((o_3@@6 T@U) ) (!  (=> (= (type o_3@@6) RefType) (and (=> (and (and (and (<= 0 (invRecv6 o_3@@6)) (< (invRecv6 o_3@@6) (len a_3@@1))) (< NoPerm FullPerm)) (qpRange6 o_3@@6)) (and (=> (< NoPerm FullPerm) (= (loc a_3@@1 (invRecv6 o_3@@6)) o_3@@6)) (= (U_2_real (MapType1Select QPMask@2 o_3@@6 val)) (+ (U_2_real (MapType1Select ZeroMask o_3@@6 val)) FullPerm)))) (=> (not (and (and (and (<= 0 (invRecv6 o_3@@6)) (< (invRecv6 o_3@@6) (len a_3@@1))) (< NoPerm FullPerm)) (qpRange6 o_3@@6))) (= (U_2_real (MapType1Select QPMask@2 o_3@@6 val)) (U_2_real (MapType1Select ZeroMask o_3@@6 val))))))
 :qid |stdinbpl.670:26|
 :skolemid |59|
 :pattern ( (MapType1Select QPMask@2 o_3@@6 val))
))) (and (forall ((o_3@@7 T@U) (f_5@@1 T@U) ) (! (let ((B@@13 (FieldTypeInv1 (type f_5@@1))))
(let ((A@@14 (FieldTypeInv0 (type f_5@@1))))
 (=> (and (and (= (type o_3@@7) RefType) (= (type f_5@@1) (FieldType A@@14 B@@13))) (not (= f_5@@1 val))) (= (U_2_real (MapType1Select ZeroMask o_3@@7 f_5@@1)) (U_2_real (MapType1Select QPMask@2 o_3@@7 f_5@@1))))))
 :qid |stdinbpl.674:33|
 :skolemid |60|
 :pattern ( (MapType1Select ZeroMask o_3@@7 f_5@@1))
 :pattern ( (MapType1Select QPMask@2 o_3@@7 f_5@@1))
)) (state ExhaleHeap@0 QPMask@2))) (and (and (forall ((j$3_4 Int) ) (!  (=> (and (<= 0 j$3_4) (< j$3_4 (len a_3@@1))) (= (U_2_int (MapType0Select ExhaleHeap@0 (loc a_3@@1 j$3_4) val)) (U_2_int (MapType0Select Heap@@9 (loc a_3@@1 j$3_4) val))))
 :qid |stdinbpl.680:24|
 :skolemid |61|
 :pattern ( (loc a_3@@1 j$3_4))
)) (<= 0 low@0)) (and (<= low@0 high@1) (<= high@1 (len a_3@@1))))) (and (=> (= (ControlFlow 0 98) 96) anon117_Then_correct) (=> (= (ControlFlow 0 98) 97) anon117_Else_correct)))))))))
(let ((anon88_correct true))
(let ((anon134_Else_correct  (=> (and (not (and (<= 0 i_4_1) (< i_4_1 (len a_3@@1)))) (= (ControlFlow 0 42) 39)) anon88_correct)))
(let ((anon134_Then_correct  (=> (and (<= 0 i_4_1) (< i_4_1 (len a_3@@1))) (and (=> (= (ControlFlow 0 40) (- 0 41)) (not (= (U_2_int (MapType0Select ExhaleHeap@0 (loc a_3@@1 i_4_1) val)) key))) (=> (not (= (U_2_int (MapType0Select ExhaleHeap@0 (loc a_3@@1 i_4_1) val)) key)) (=> (= (ControlFlow 0 40) 39) anon88_correct))))))
(let ((anon90_correct true))
(let ((anon133_Else_correct  (=> (and (forall ((i_5_1 Int) ) (!  (=> (and (<= 0 i_5_1) (< i_5_1 (len a_3@@1))) (not (= (U_2_int (MapType0Select ExhaleHeap@0 (loc a_3@@1 i_5_1) val)) key)))
 :qid |stdinbpl.963:22|
 :skolemid |86|
 :pattern ( (loc a_3@@1 i_5_1))
)) (= (ControlFlow 0 38) 36)) anon90_correct)))
(let ((anon132_Then_correct  (=> (= (- 0 1) index@1) (and (and (=> (= (ControlFlow 0 43) 38) anon133_Else_correct) (=> (= (ControlFlow 0 43) 40) anon134_Then_correct)) (=> (= (ControlFlow 0 43) 42) anon134_Else_correct)))))
(let ((anon132_Else_correct  (=> (and (not (= (- 0 1) index@1)) (= (ControlFlow 0 37) 36)) anon90_correct)))
(let ((anon131_Else_correct  (=> (< index@1 0) (and (=> (= (ControlFlow 0 46) 43) anon132_Then_correct) (=> (= (ControlFlow 0 46) 37) anon132_Else_correct)))))
(let ((anon131_Then_correct  (=> (<= 0 index@1) (and (=> (= (ControlFlow 0 44) (- 0 45)) (= (U_2_int (MapType0Select ExhaleHeap@0 (loc a_3@@1 index@1) val)) key)) (=> (= (U_2_int (MapType0Select ExhaleHeap@0 (loc a_3@@1 index@1) val)) key) (and (=> (= (ControlFlow 0 44) 43) anon132_Then_correct) (=> (= (ControlFlow 0 44) 37) anon132_Else_correct)))))))
(let ((anon129_Else_correct  (=> (forall ((j$1_3_1 Int) ) (!  (=> (and (<= 0 j$1_3_1) (< j$1_3_1 (len a_3@@1))) (= (U_2_int (MapType0Select ExhaleHeap@0 (loc a_3@@1 j$1_3_1) val)) (U_2_int (MapType0Select Heap@@9 (loc a_3@@1 j$1_3_1) val))))
 :qid |stdinbpl.943:20|
 :skolemid |85|
 :pattern ( (loc a_3@@1 j$1_3_1))
)) (and (=> (= (ControlFlow 0 47) (- 0 49)) (<= (- 0 1) index@1)) (=> (<= (- 0 1) index@1) (and (=> (= (ControlFlow 0 47) (- 0 48)) (< index@1 (len a_3@@1))) (=> (< index@1 (len a_3@@1)) (and (=> (= (ControlFlow 0 47) 44) anon131_Then_correct) (=> (= (ControlFlow 0 47) 46) anon131_Else_correct)))))))))
(let ((anon81_correct true))
(let ((anon130_Else_correct  (=> (and (not (and (<= 0 j$1_2) (< j$1_2 (len a_3@@1)))) (= (ControlFlow 0 35) 32)) anon81_correct)))
(let ((anon130_Then_correct  (=> (and (<= 0 j$1_2) (< j$1_2 (len a_3@@1))) (and (=> (= (ControlFlow 0 33) (- 0 34)) (= (U_2_int (MapType0Select ExhaleHeap@0 (loc a_3@@1 j$1_2) val)) (U_2_int (MapType0Select Heap@@9 (loc a_3@@1 j$1_2) val)))) (=> (= (U_2_int (MapType0Select ExhaleHeap@0 (loc a_3@@1 j$1_2) val)) (U_2_int (MapType0Select Heap@@9 (loc a_3@@1 j$1_2) val))) (=> (= (ControlFlow 0 33) 32) anon81_correct))))))
(let ((anon78_correct  (=> (and (state ExhaleHeap@0 QPMask@3) (state ExhaleHeap@0 QPMask@3)) (and (=> (= (ControlFlow 0 50) (- 0 52)) (forall ((j$0_2 Int) (j$0_2_1 Int) ) (!  (=> (and (and (and (and (not (= j$0_2 j$0_2_1)) (and (<= 0 j$0_2) (< j$0_2 (len a_3@@1)))) (and (<= 0 j$0_2_1) (< j$0_2_1 (len a_3@@1)))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (loc a_3@@1 j$0_2) (loc a_3@@1 j$0_2_1))))
 :qid |stdinbpl.902:17|
 :skolemid |79|
 :pattern ( (neverTriggered3 j$0_2) (neverTriggered3 j$0_2_1))
))) (=> (forall ((j$0_2@@0 Int) (j$0_2_1@@0 Int) ) (!  (=> (and (and (and (and (not (= j$0_2@@0 j$0_2_1@@0)) (and (<= 0 j$0_2@@0) (< j$0_2@@0 (len a_3@@1)))) (and (<= 0 j$0_2_1@@0) (< j$0_2_1@@0 (len a_3@@1)))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (loc a_3@@1 j$0_2@@0) (loc a_3@@1 j$0_2_1@@0))))
 :qid |stdinbpl.902:17|
 :skolemid |79|
 :pattern ( (neverTriggered3 j$0_2@@0) (neverTriggered3 j$0_2_1@@0))
)) (and (=> (= (ControlFlow 0 50) (- 0 51)) (forall ((j$0_2@@1 Int) ) (!  (=> (and (<= 0 j$0_2@@1) (< j$0_2@@1 (len a_3@@1))) (>= (U_2_real (MapType1Select QPMask@3 (loc a_3@@1 j$0_2@@1) val)) FullPerm))
 :qid |stdinbpl.909:17|
 :skolemid |80|
 :pattern ( (loc a_3@@1 j$0_2@@1))
 :pattern ( (loc a_3@@1 j$0_2@@1))
))) (=> (forall ((j$0_2@@2 Int) ) (!  (=> (and (<= 0 j$0_2@@2) (< j$0_2@@2 (len a_3@@1))) (>= (U_2_real (MapType1Select QPMask@3 (loc a_3@@1 j$0_2@@2) val)) FullPerm))
 :qid |stdinbpl.909:17|
 :skolemid |80|
 :pattern ( (loc a_3@@1 j$0_2@@2))
 :pattern ( (loc a_3@@1 j$0_2@@2))
)) (=> (and (and (forall ((j$0_2@@3 Int) ) (!  (=> (and (and (<= 0 j$0_2@@3) (< j$0_2@@3 (len a_3@@1))) (< NoPerm FullPerm)) (and (qpRange3 (loc a_3@@1 j$0_2@@3)) (= (invRecv3 (loc a_3@@1 j$0_2@@3)) j$0_2@@3)))
 :qid |stdinbpl.915:22|
 :skolemid |81|
 :pattern ( (loc a_3@@1 j$0_2@@3))
 :pattern ( (loc a_3@@1 j$0_2@@3))
)) (forall ((o_3@@8 T@U) ) (!  (=> (= (type o_3@@8) RefType) (=> (and (and (<= 0 (invRecv3 o_3@@8)) (< (invRecv3 o_3@@8) (len a_3@@1))) (and (< NoPerm FullPerm) (qpRange3 o_3@@8))) (= (loc a_3@@1 (invRecv3 o_3@@8)) o_3@@8)))
 :qid |stdinbpl.919:22|
 :skolemid |82|
 :pattern ( (invRecv3 o_3@@8))
))) (and (forall ((o_3@@9 T@U) ) (!  (=> (= (type o_3@@9) RefType) (and (=> (and (and (<= 0 (invRecv3 o_3@@9)) (< (invRecv3 o_3@@9) (len a_3@@1))) (and (< NoPerm FullPerm) (qpRange3 o_3@@9))) (and (= (loc a_3@@1 (invRecv3 o_3@@9)) o_3@@9) (= (U_2_real (MapType1Select QPMask@4 o_3@@9 val)) (- (U_2_real (MapType1Select QPMask@3 o_3@@9 val)) FullPerm)))) (=> (not (and (and (<= 0 (invRecv3 o_3@@9)) (< (invRecv3 o_3@@9) (len a_3@@1))) (and (< NoPerm FullPerm) (qpRange3 o_3@@9)))) (= (U_2_real (MapType1Select QPMask@4 o_3@@9 val)) (U_2_real (MapType1Select QPMask@3 o_3@@9 val))))))
 :qid |stdinbpl.925:22|
 :skolemid |83|
 :pattern ( (MapType1Select QPMask@4 o_3@@9 val))
)) (forall ((o_3@@10 T@U) (f_5@@2 T@U) ) (! (let ((B@@14 (FieldTypeInv1 (type f_5@@2))))
(let ((A@@15 (FieldTypeInv0 (type f_5@@2))))
 (=> (and (and (= (type o_3@@10) RefType) (= (type f_5@@2) (FieldType A@@15 B@@14))) (not (= f_5@@2 val))) (= (U_2_real (MapType1Select QPMask@3 o_3@@10 f_5@@2)) (U_2_real (MapType1Select QPMask@4 o_3@@10 f_5@@2))))))
 :qid |stdinbpl.931:29|
 :skolemid |84|
 :pattern ( (MapType1Select QPMask@4 o_3@@10 f_5@@2))
)))) (and (and (=> (= (ControlFlow 0 50) 47) anon129_Else_correct) (=> (= (ControlFlow 0 50) 33) anon130_Then_correct)) (=> (= (ControlFlow 0 50) 35) anon130_Else_correct))))))))))
(let ((anon128_Else_correct  (=> (and (< index@1 0) (= (ControlFlow 0 54) 50)) anon78_correct)))
(let ((anon128_Then_correct  (=> (<= 0 index@1) (=> (and (= (U_2_int (MapType0Select ExhaleHeap@0 (loc a_3@@1 index@1) val)) key) (= (ControlFlow 0 53) 50)) anon78_correct))))
(let ((anon76_correct  (=> (and (<= (- 0 1) index@1) (< index@1 (len a_3@@1))) (and (=> (= (ControlFlow 0 55) 53) anon128_Then_correct) (=> (= (ControlFlow 0 55) 54) anon128_Else_correct)))))
(let ((anon127_Else_correct  (=> (and (not (= index@1 (- 0 1))) (= (ControlFlow 0 57) 55)) anon76_correct)))
(let ((anon127_Then_correct  (=> (= index@1 (- 0 1)) (=> (and (forall ((i_13 Int) ) (!  (=> (and (<= 0 i_13) (and (< i_13 (len a_3@@1)) (not (and (<= low@0 i_13) (< i_13 high@1))))) (not (= (U_2_int (MapType0Select ExhaleHeap@0 (loc a_3@@1 i_13) val)) key)))
 :qid |stdinbpl.879:24|
 :skolemid |78|
 :pattern ( (loc a_3@@1 i_13))
)) (= (ControlFlow 0 56) 55)) anon76_correct))))
(let ((anon116_Else_correct  (=> (and (not (< low@0 high@1)) (state ExhaleHeap@0 QPMask@1)) (and (=> (= (ControlFlow 0 58) (- 0 59)) (forall ((j$2_5 Int) (j$2_5_1 Int) ) (!  (=> (and (and (and (and (not (= j$2_5 j$2_5_1)) (and (<= 0 j$2_5) (< j$2_5 (len a_3@@1)))) (and (<= 0 j$2_5_1) (< j$2_5_1 (len a_3@@1)))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (loc a_3@@1 j$2_5) (loc a_3@@1 j$2_5_1))))
 :qid |stdinbpl.839:17|
 :skolemid |71|
))) (=> (forall ((j$2_5@@0 Int) (j$2_5_1@@0 Int) ) (!  (=> (and (and (and (and (not (= j$2_5@@0 j$2_5_1@@0)) (and (<= 0 j$2_5@@0) (< j$2_5@@0 (len a_3@@1)))) (and (<= 0 j$2_5_1@@0) (< j$2_5_1@@0 (len a_3@@1)))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (loc a_3@@1 j$2_5@@0) (loc a_3@@1 j$2_5_1@@0))))
 :qid |stdinbpl.839:17|
 :skolemid |71|
)) (=> (and (forall ((j$2_5@@1 Int) ) (!  (=> (and (and (<= 0 j$2_5@@1) (< j$2_5@@1 (len a_3@@1))) (< NoPerm FullPerm)) (and (qpRange8 (loc a_3@@1 j$2_5@@1)) (= (invRecv8 (loc a_3@@1 j$2_5@@1)) j$2_5@@1)))
 :qid |stdinbpl.845:24|
 :skolemid |72|
 :pattern ( (loc a_3@@1 j$2_5@@1))
 :pattern ( (loc a_3@@1 j$2_5@@1))
)) (forall ((o_3@@11 T@U) ) (!  (=> (= (type o_3@@11) RefType) (=> (and (and (and (<= 0 (invRecv8 o_3@@11)) (< (invRecv8 o_3@@11) (len a_3@@1))) (< NoPerm FullPerm)) (qpRange8 o_3@@11)) (= (loc a_3@@1 (invRecv8 o_3@@11)) o_3@@11)))
 :qid |stdinbpl.849:24|
 :skolemid |73|
 :pattern ( (invRecv8 o_3@@11))
))) (=> (and (and (and (forall ((j$2_5@@2 Int) ) (!  (=> (and (<= 0 j$2_5@@2) (< j$2_5@@2 (len a_3@@1))) (not (= (loc a_3@@1 j$2_5@@2) null)))
 :qid |stdinbpl.855:24|
 :skolemid |74|
 :pattern ( (loc a_3@@1 j$2_5@@2))
 :pattern ( (loc a_3@@1 j$2_5@@2))
)) (forall ((o_3@@12 T@U) ) (!  (=> (= (type o_3@@12) RefType) (and (=> (and (and (and (<= 0 (invRecv8 o_3@@12)) (< (invRecv8 o_3@@12) (len a_3@@1))) (< NoPerm FullPerm)) (qpRange8 o_3@@12)) (and (=> (< NoPerm FullPerm) (= (loc a_3@@1 (invRecv8 o_3@@12)) o_3@@12)) (= (U_2_real (MapType1Select QPMask@3 o_3@@12 val)) (+ (U_2_real (MapType1Select QPMask@1 o_3@@12 val)) FullPerm)))) (=> (not (and (and (and (<= 0 (invRecv8 o_3@@12)) (< (invRecv8 o_3@@12) (len a_3@@1))) (< NoPerm FullPerm)) (qpRange8 o_3@@12))) (= (U_2_real (MapType1Select QPMask@3 o_3@@12 val)) (U_2_real (MapType1Select QPMask@1 o_3@@12 val))))))
 :qid |stdinbpl.861:24|
 :skolemid |75|
 :pattern ( (MapType1Select QPMask@3 o_3@@12 val))
))) (and (forall ((o_3@@13 T@U) (f_5@@3 T@U) ) (! (let ((B@@15 (FieldTypeInv1 (type f_5@@3))))
(let ((A@@16 (FieldTypeInv0 (type f_5@@3))))
 (=> (and (and (= (type o_3@@13) RefType) (= (type f_5@@3) (FieldType A@@16 B@@15))) (not (= f_5@@3 val))) (= (U_2_real (MapType1Select QPMask@1 o_3@@13 f_5@@3)) (U_2_real (MapType1Select QPMask@3 o_3@@13 f_5@@3))))))
 :qid |stdinbpl.865:31|
 :skolemid |76|
 :pattern ( (MapType1Select QPMask@1 o_3@@13 f_5@@3))
 :pattern ( (MapType1Select QPMask@3 o_3@@13 f_5@@3))
)) (state ExhaleHeap@0 QPMask@3))) (and (and (forall ((j$3_7 Int) ) (!  (=> (and (<= 0 j$3_7) (< j$3_7 (len a_3@@1))) (= (U_2_int (MapType0Select ExhaleHeap@0 (loc a_3@@1 j$3_7) val)) (U_2_int (MapType0Select Heap@@9 (loc a_3@@1 j$3_7) val))))
 :qid |stdinbpl.871:22|
 :skolemid |77|
 :pattern ( (loc a_3@@1 j$3_7))
)) (<= 0 low@0)) (and (<= low@0 high@1) (<= high@1 (len a_3@@1))))) (and (=> (= (ControlFlow 0 58) 56) anon127_Then_correct) (=> (= (ControlFlow 0 58) 57) anon127_Else_correct)))))))))
(let ((anon45_correct true))
(let ((anon114_Else_correct  (=> (and (not (and (<= 0 i_4) (and (< i_4 (len a_3@@1)) (not (and (<= low@0 i_4) (< i_4 high@1)))))) (= (ControlFlow 0 27) 24)) anon45_correct)))
(let ((anon114_Then_correct  (=> (and (<= 0 i_4) (and (< i_4 (len a_3@@1)) (not (and (<= low@0 i_4) (< i_4 high@1))))) (and (=> (= (ControlFlow 0 25) (- 0 26)) (HasDirectPerm QPMask@6 (loc a_3@@1 i_4) val)) (=> (HasDirectPerm QPMask@6 (loc a_3@@1 i_4) val) (=> (= (ControlFlow 0 25) 24) anon45_correct))))))
(let ((anon49_correct true))
(let ((anon115_Else_correct  (=> (and (< index@1 0) (= (ControlFlow 0 20) 17)) anon49_correct)))
(let ((anon115_Then_correct  (=> (<= 0 index@1) (and (=> (= (ControlFlow 0 18) (- 0 19)) (HasDirectPerm QPMask@6 (loc a_3@@1 index@1) val)) (=> (HasDirectPerm QPMask@6 (loc a_3@@1 index@1) val) (=> (and (= (U_2_int (MapType0Select ExhaleHeap@0 (loc a_3@@1 index@1) val)) key) (= (ControlFlow 0 18) 17)) anon49_correct))))))
(let ((anon47_correct  (=> (and (and (state ExhaleHeap@0 QPMask@6) (<= (- 0 1) index@1)) (and (< index@1 (len a_3@@1)) (state ExhaleHeap@0 QPMask@6))) (and (=> (= (ControlFlow 0 21) 18) anon115_Then_correct) (=> (= (ControlFlow 0 21) 20) anon115_Else_correct)))))
(let ((anon113_Else_correct  (=> (and (forall ((i_9 Int) ) (!  (=> (and (<= 0 i_9) (and (< i_9 (len a_3@@1)) (not (and (<= low@0 i_9) (< i_9 high@1))))) (not (= (U_2_int (MapType0Select ExhaleHeap@0 (loc a_3@@1 i_9) val)) key)))
 :qid |stdinbpl.618:26|
 :skolemid |54|
 :pattern ( (loc a_3@@1 i_9))
)) (= (ControlFlow 0 23) 21)) anon47_correct)))
(let ((anon112_Then_correct  (=> (= index@1 (- 0 1)) (and (and (=> (= (ControlFlow 0 28) 23) anon113_Else_correct) (=> (= (ControlFlow 0 28) 25) anon114_Then_correct)) (=> (= (ControlFlow 0 28) 27) anon114_Else_correct)))))
(let ((anon112_Else_correct  (=> (and (not (= index@1 (- 0 1))) (= (ControlFlow 0 22) 21)) anon47_correct)))
(let ((anon110_Else_correct  (=> (and (forall ((j$3_3 Int) ) (!  (=> (and (<= 0 j$3_3) (< j$3_3 (len a_3@@1))) (= (U_2_int (MapType0Select ExhaleHeap@0 (loc a_3@@1 j$3_3) val)) (U_2_int (MapType0Select Heap@@9 (loc a_3@@1 j$3_3) val))))
 :qid |stdinbpl.599:24|
 :skolemid |53|
 :pattern ( (loc a_3@@1 j$3_3))
)) (state ExhaleHeap@0 QPMask@6)) (=> (and (and (<= 0 low@0) (<= low@0 high@1)) (and (<= high@1 (len a_3@@1)) (state ExhaleHeap@0 QPMask@6))) (and (=> (= (ControlFlow 0 29) 28) anon112_Then_correct) (=> (= (ControlFlow 0 29) 22) anon112_Else_correct))))))
(let ((anon40_correct true))
(let ((anon111_Else_correct  (=> (and (not (and (<= 0 j$3_1) (< j$3_1 (len a_3@@1)))) (= (ControlFlow 0 16) 12)) anon40_correct)))
(let ((anon111_Then_correct  (=> (and (<= 0 j$3_1) (< j$3_1 (len a_3@@1))) (and (=> (= (ControlFlow 0 13) (- 0 15)) (HasDirectPerm QPMask@6 (loc a_3@@1 j$3_1) val)) (=> (HasDirectPerm QPMask@6 (loc a_3@@1 j$3_1) val) (and (=> (= (ControlFlow 0 13) (- 0 14)) (HasDirectPerm QPMask@0 (loc a_3@@1 j$3_1) val)) (=> (HasDirectPerm QPMask@0 (loc a_3@@1 j$3_1) val) (=> (= (ControlFlow 0 13) 12) anon40_correct))))))))
(let ((anon109_Else_correct  (and (=> (= (ControlFlow 0 30) (- 0 31)) (forall ((j$2_2 Int) (j$2_2_1 Int) ) (!  (=> (and (and (and (and (not (= j$2_2 j$2_2_1)) (and (<= 0 j$2_2) (< j$2_2 (len a_3@@1)))) (and (<= 0 j$2_2_1) (< j$2_2_1 (len a_3@@1)))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (loc a_3@@1 j$2_2) (loc a_3@@1 j$2_2_1))))
 :qid |stdinbpl.556:19|
 :skolemid |47|
))) (=> (forall ((j$2_2@@0 Int) (j$2_2_1@@0 Int) ) (!  (=> (and (and (and (and (not (= j$2_2@@0 j$2_2_1@@0)) (and (<= 0 j$2_2@@0) (< j$2_2@@0 (len a_3@@1)))) (and (<= 0 j$2_2_1@@0) (< j$2_2_1@@0 (len a_3@@1)))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (loc a_3@@1 j$2_2@@0) (loc a_3@@1 j$2_2_1@@0))))
 :qid |stdinbpl.556:19|
 :skolemid |47|
)) (=> (and (forall ((j$2_2@@1 Int) ) (!  (=> (and (and (<= 0 j$2_2@@1) (< j$2_2@@1 (len a_3@@1))) (< NoPerm FullPerm)) (and (qpRange5 (loc a_3@@1 j$2_2@@1)) (= (invRecv5 (loc a_3@@1 j$2_2@@1)) j$2_2@@1)))
 :qid |stdinbpl.562:26|
 :skolemid |48|
 :pattern ( (loc a_3@@1 j$2_2@@1))
 :pattern ( (loc a_3@@1 j$2_2@@1))
)) (forall ((o_3@@14 T@U) ) (!  (=> (= (type o_3@@14) RefType) (=> (and (and (and (<= 0 (invRecv5 o_3@@14)) (< (invRecv5 o_3@@14) (len a_3@@1))) (< NoPerm FullPerm)) (qpRange5 o_3@@14)) (= (loc a_3@@1 (invRecv5 o_3@@14)) o_3@@14)))
 :qid |stdinbpl.566:26|
 :skolemid |49|
 :pattern ( (invRecv5 o_3@@14))
))) (=> (and (and (forall ((j$2_2@@2 Int) ) (!  (=> (and (<= 0 j$2_2@@2) (< j$2_2@@2 (len a_3@@1))) (not (= (loc a_3@@1 j$2_2@@2) null)))
 :qid |stdinbpl.572:26|
 :skolemid |50|
 :pattern ( (loc a_3@@1 j$2_2@@2))
 :pattern ( (loc a_3@@1 j$2_2@@2))
)) (forall ((o_3@@15 T@U) ) (!  (=> (= (type o_3@@15) RefType) (and (=> (and (and (and (<= 0 (invRecv5 o_3@@15)) (< (invRecv5 o_3@@15) (len a_3@@1))) (< NoPerm FullPerm)) (qpRange5 o_3@@15)) (and (=> (< NoPerm FullPerm) (= (loc a_3@@1 (invRecv5 o_3@@15)) o_3@@15)) (= (U_2_real (MapType1Select QPMask@6 o_3@@15 val)) (+ (U_2_real (MapType1Select QPMask@1 o_3@@15 val)) FullPerm)))) (=> (not (and (and (and (<= 0 (invRecv5 o_3@@15)) (< (invRecv5 o_3@@15) (len a_3@@1))) (< NoPerm FullPerm)) (qpRange5 o_3@@15))) (= (U_2_real (MapType1Select QPMask@6 o_3@@15 val)) (U_2_real (MapType1Select QPMask@1 o_3@@15 val))))))
 :qid |stdinbpl.578:26|
 :skolemid |51|
 :pattern ( (MapType1Select QPMask@6 o_3@@15 val))
))) (and (forall ((o_3@@16 T@U) (f_5@@4 T@U) ) (! (let ((B@@16 (FieldTypeInv1 (type f_5@@4))))
(let ((A@@17 (FieldTypeInv0 (type f_5@@4))))
 (=> (and (and (= (type o_3@@16) RefType) (= (type f_5@@4) (FieldType A@@17 B@@16))) (not (= f_5@@4 val))) (= (U_2_real (MapType1Select QPMask@1 o_3@@16 f_5@@4)) (U_2_real (MapType1Select QPMask@6 o_3@@16 f_5@@4))))))
 :qid |stdinbpl.582:33|
 :skolemid |52|
 :pattern ( (MapType1Select QPMask@1 o_3@@16 f_5@@4))
 :pattern ( (MapType1Select QPMask@6 o_3@@16 f_5@@4))
)) (state ExhaleHeap@0 QPMask@6))) (and (and (=> (= (ControlFlow 0 30) 29) anon110_Else_correct) (=> (= (ControlFlow 0 30) 13) anon111_Then_correct)) (=> (= (ControlFlow 0 30) 16) anon111_Else_correct))))))))
(let ((anon109_Then_correct true))
(let ((anon34_correct  (=> (IdenticalOnKnownLocations Heap@@9 ExhaleHeap@0 QPMask@1) (and (and (and (=> (= (ControlFlow 0 100) 98) anon116_Then_correct) (=> (= (ControlFlow 0 100) 58) anon116_Else_correct)) (=> (= (ControlFlow 0 100) 11) anon109_Then_correct)) (=> (= (ControlFlow 0 100) 30) anon109_Else_correct)))))
(let ((anon107_Else_correct  (=> (and (< index@0 0) (= (ControlFlow 0 103) 100)) anon34_correct)))
(let ((anon107_Then_correct  (=> (<= 0 index@0) (and (=> (= (ControlFlow 0 101) (- 0 102)) (= (U_2_int (MapType0Select Heap@@9 (loc a_3@@1 index@0) val)) key)) (=> (= (U_2_int (MapType0Select Heap@@9 (loc a_3@@1 index@0) val)) key) (=> (= (ControlFlow 0 101) 100) anon34_correct))))))
(let ((anon32_correct  (and (=> (= (ControlFlow 0 104) (- 0 106)) (<= (- 0 1) index@0)) (=> (<= (- 0 1) index@0) (and (=> (= (ControlFlow 0 104) (- 0 105)) (< index@0 (len a_3@@1))) (=> (< index@0 (len a_3@@1)) (and (=> (= (ControlFlow 0 104) 101) anon107_Then_correct) (=> (= (ControlFlow 0 104) 103) anon107_Else_correct))))))))
(let ((anon105_Else_correct  (=> (and (forall ((i_7_1 Int) ) (!  (=> (and (<= 0 i_7_1) (and (< i_7_1 (len a_3@@1)) (not (and (<= 0 i_7_1) (< i_7_1 high@0))))) (not (= (U_2_int (MapType0Select Heap@@9 (loc a_3@@1 i_7_1) val)) key)))
 :qid |stdinbpl.526:26|
 :skolemid |46|
 :pattern ( (loc a_3@@1 i_7_1))
)) (= (ControlFlow 0 108) 104)) anon32_correct)))
(let ((anon104_Then_correct  (=> (= index@0 (- 0 1)) (and (and (=> (= (ControlFlow 0 113) 108) anon105_Else_correct) (=> (= (ControlFlow 0 113) 110) anon106_Then_correct)) (=> (= (ControlFlow 0 113) 112) anon106_Else_correct)))))
(let ((anon104_Else_correct  (=> (and (not (= index@0 (- 0 1))) (= (ControlFlow 0 107) 104)) anon32_correct)))
(let ((anon102_Else_correct  (=> (forall ((j$3_1_1 Int) ) (!  (=> (and (<= 0 j$3_1_1) (< j$3_1_1 (len a_3@@1))) (= (U_2_int (MapType0Select Heap@@9 (loc a_3@@1 j$3_1_1) val)) (U_2_int (MapType0Select Heap@@9 (loc a_3@@1 j$3_1_1) val))))
 :qid |stdinbpl.508:24|
 :skolemid |45|
 :pattern ( (loc a_3@@1 j$3_1_1))
)) (and (=> (= (ControlFlow 0 114) (- 0 117)) (<= 0 0)) (=> (<= 0 0) (and (=> (= (ControlFlow 0 114) (- 0 116)) (<= 0 high@0)) (=> (<= 0 high@0) (and (=> (= (ControlFlow 0 114) (- 0 115)) (<= high@0 (len a_3@@1))) (=> (<= high@0 (len a_3@@1)) (and (=> (= (ControlFlow 0 114) 113) anon104_Then_correct) (=> (= (ControlFlow 0 114) 107) anon104_Else_correct)))))))))))
(let ((anon25_correct true))
(let ((anon103_Else_correct  (=> (and (not (and (<= 0 j$3) (< j$3 (len a_3@@1)))) (= (ControlFlow 0 10) 7)) anon25_correct)))
(let ((anon103_Then_correct  (=> (and (<= 0 j$3) (< j$3 (len a_3@@1))) (and (=> (= (ControlFlow 0 8) (- 0 9)) (= (U_2_int (MapType0Select Heap@@9 (loc a_3@@1 j$3) val)) (U_2_int (MapType0Select Heap@@9 (loc a_3@@1 j$3) val)))) (=> (= (U_2_int (MapType0Select Heap@@9 (loc a_3@@1 j$3) val)) (U_2_int (MapType0Select Heap@@9 (loc a_3@@1 j$3) val))) (=> (= (ControlFlow 0 8) 7) anon25_correct))))))
(let ((anon94_Else_correct  (=> (state Heap@@9 QPMask@0) (=> (and (and (= high@0 (len a_3@@1)) (state Heap@@9 QPMask@0)) (and (= index@0 (- 0 1)) (state Heap@@9 QPMask@0))) (and (=> (= (ControlFlow 0 118) (- 0 120)) (forall ((j$2 Int) (j$2_1 Int) ) (!  (=> (and (and (and (and (not (= j$2 j$2_1)) (and (<= 0 j$2) (< j$2 (len a_3@@1)))) (and (<= 0 j$2_1) (< j$2_1 (len a_3@@1)))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (loc a_3@@1 j$2) (loc a_3@@1 j$2_1))))
 :qid |stdinbpl.467:21|
 :skolemid |39|
 :pattern ( (neverTriggered4 j$2) (neverTriggered4 j$2_1))
))) (=> (forall ((j$2@@0 Int) (j$2_1@@0 Int) ) (!  (=> (and (and (and (and (not (= j$2@@0 j$2_1@@0)) (and (<= 0 j$2@@0) (< j$2@@0 (len a_3@@1)))) (and (<= 0 j$2_1@@0) (< j$2_1@@0 (len a_3@@1)))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (loc a_3@@1 j$2@@0) (loc a_3@@1 j$2_1@@0))))
 :qid |stdinbpl.467:21|
 :skolemid |39|
 :pattern ( (neverTriggered4 j$2@@0) (neverTriggered4 j$2_1@@0))
)) (and (=> (= (ControlFlow 0 118) (- 0 119)) (forall ((j$2@@1 Int) ) (!  (=> (and (<= 0 j$2@@1) (< j$2@@1 (len a_3@@1))) (>= (U_2_real (MapType1Select QPMask@0 (loc a_3@@1 j$2@@1) val)) FullPerm))
 :qid |stdinbpl.474:21|
 :skolemid |40|
 :pattern ( (loc a_3@@1 j$2@@1))
 :pattern ( (loc a_3@@1 j$2@@1))
))) (=> (forall ((j$2@@2 Int) ) (!  (=> (and (<= 0 j$2@@2) (< j$2@@2 (len a_3@@1))) (>= (U_2_real (MapType1Select QPMask@0 (loc a_3@@1 j$2@@2) val)) FullPerm))
 :qid |stdinbpl.474:21|
 :skolemid |40|
 :pattern ( (loc a_3@@1 j$2@@2))
 :pattern ( (loc a_3@@1 j$2@@2))
)) (=> (and (and (forall ((j$2@@3 Int) ) (!  (=> (and (and (<= 0 j$2@@3) (< j$2@@3 (len a_3@@1))) (< NoPerm FullPerm)) (and (qpRange4 (loc a_3@@1 j$2@@3)) (= (invRecv4 (loc a_3@@1 j$2@@3)) j$2@@3)))
 :qid |stdinbpl.480:26|
 :skolemid |41|
 :pattern ( (loc a_3@@1 j$2@@3))
 :pattern ( (loc a_3@@1 j$2@@3))
)) (forall ((o_3@@17 T@U) ) (!  (=> (= (type o_3@@17) RefType) (=> (and (and (<= 0 (invRecv4 o_3@@17)) (< (invRecv4 o_3@@17) (len a_3@@1))) (and (< NoPerm FullPerm) (qpRange4 o_3@@17))) (= (loc a_3@@1 (invRecv4 o_3@@17)) o_3@@17)))
 :qid |stdinbpl.484:26|
 :skolemid |42|
 :pattern ( (invRecv4 o_3@@17))
))) (and (forall ((o_3@@18 T@U) ) (!  (=> (= (type o_3@@18) RefType) (and (=> (and (and (<= 0 (invRecv4 o_3@@18)) (< (invRecv4 o_3@@18) (len a_3@@1))) (and (< NoPerm FullPerm) (qpRange4 o_3@@18))) (and (= (loc a_3@@1 (invRecv4 o_3@@18)) o_3@@18) (= (U_2_real (MapType1Select QPMask@1 o_3@@18 val)) (- (U_2_real (MapType1Select QPMask@0 o_3@@18 val)) FullPerm)))) (=> (not (and (and (<= 0 (invRecv4 o_3@@18)) (< (invRecv4 o_3@@18) (len a_3@@1))) (and (< NoPerm FullPerm) (qpRange4 o_3@@18)))) (= (U_2_real (MapType1Select QPMask@1 o_3@@18 val)) (U_2_real (MapType1Select QPMask@0 o_3@@18 val))))))
 :qid |stdinbpl.490:26|
 :skolemid |43|
 :pattern ( (MapType1Select QPMask@1 o_3@@18 val))
)) (forall ((o_3@@19 T@U) (f_5@@5 T@U) ) (! (let ((B@@17 (FieldTypeInv1 (type f_5@@5))))
(let ((A@@18 (FieldTypeInv0 (type f_5@@5))))
 (=> (and (and (= (type o_3@@19) RefType) (= (type f_5@@5) (FieldType A@@18 B@@17))) (not (= f_5@@5 val))) (= (U_2_real (MapType1Select QPMask@0 o_3@@19 f_5@@5)) (U_2_real (MapType1Select QPMask@1 o_3@@19 f_5@@5))))))
 :qid |stdinbpl.496:33|
 :skolemid |44|
 :pattern ( (MapType1Select QPMask@1 o_3@@19 f_5@@5))
)))) (and (and (=> (= (ControlFlow 0 118) 114) anon102_Else_correct) (=> (= (ControlFlow 0 118) 8) anon103_Then_correct)) (=> (= (ControlFlow 0 118) 10) anon103_Else_correct)))))))))))
(let ((anon92_Else_correct  (=> (and (forall ((i_1_1 Int) (j_3 Int) ) (!  (=> (and (<= 0 i_1_1) (and (< j_3 (len a_3@@1)) (< i_1_1 j_3))) (< (U_2_int (MapType0Select Heap@@9 (loc a_3@@1 i_1_1) val)) (U_2_int (MapType0Select Heap@@9 (loc a_3@@1 j_3) val))))
 :qid |stdinbpl.339:20|
 :skolemid |30|
 :pattern ( (loc a_3@@1 i_1_1) (loc a_3@@1 j_3))
)) (state Heap@@9 QPMask@0)) (and (=> (= (ControlFlow 0 143) 142) anon94_Then_correct) (=> (= (ControlFlow 0 143) 118) anon94_Else_correct)))))
(let ((anon5_correct true))
(let ((anon93_Else_correct  (=> (and (not (and (<= 0 i_2) (and (< j (len a_3@@1)) (< i_2 j)))) (= (ControlFlow 0 6) 2)) anon5_correct)))
(let ((anon93_Then_correct  (=> (and (<= 0 i_2) (and (< j (len a_3@@1)) (< i_2 j))) (and (=> (= (ControlFlow 0 3) (- 0 5)) (HasDirectPerm QPMask@0 (loc a_3@@1 i_2) val)) (=> (HasDirectPerm QPMask@0 (loc a_3@@1 i_2) val) (and (=> (= (ControlFlow 0 3) (- 0 4)) (HasDirectPerm QPMask@0 (loc a_3@@1 j) val)) (=> (HasDirectPerm QPMask@0 (loc a_3@@1 j) val) (=> (= (ControlFlow 0 3) 2) anon5_correct))))))))
(let ((anon91_Else_correct  (and (=> (= (ControlFlow 0 144) (- 0 145)) (forall ((j_1 Int) (j_1_1 Int) ) (!  (=> (and (and (and (and (not (= j_1 j_1_1)) (and (<= 0 j_1) (< j_1 (len a_3@@1)))) (and (<= 0 j_1_1) (< j_1_1 (len a_3@@1)))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (loc a_3@@1 j_1) (loc a_3@@1 j_1_1))))
 :qid |stdinbpl.295:15|
 :skolemid |24|
))) (=> (forall ((j_1@@0 Int) (j_1_1@@0 Int) ) (!  (=> (and (and (and (and (not (= j_1@@0 j_1_1@@0)) (and (<= 0 j_1@@0) (< j_1@@0 (len a_3@@1)))) (and (<= 0 j_1_1@@0) (< j_1_1@@0 (len a_3@@1)))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (loc a_3@@1 j_1@@0) (loc a_3@@1 j_1_1@@0))))
 :qid |stdinbpl.295:15|
 :skolemid |24|
)) (=> (forall ((j_1@@1 Int) ) (!  (=> (and (and (<= 0 j_1@@1) (< j_1@@1 (len a_3@@1))) (< NoPerm FullPerm)) (and (qpRange1 (loc a_3@@1 j_1@@1)) (= (invRecv1 (loc a_3@@1 j_1@@1)) j_1@@1)))
 :qid |stdinbpl.301:22|
 :skolemid |25|
 :pattern ( (loc a_3@@1 j_1@@1))
 :pattern ( (loc a_3@@1 j_1@@1))
)) (=> (and (forall ((o_3@@20 T@U) ) (!  (=> (= (type o_3@@20) RefType) (=> (and (and (and (<= 0 (invRecv1 o_3@@20)) (< (invRecv1 o_3@@20) (len a_3@@1))) (< NoPerm FullPerm)) (qpRange1 o_3@@20)) (= (loc a_3@@1 (invRecv1 o_3@@20)) o_3@@20)))
 :qid |stdinbpl.305:22|
 :skolemid |26|
 :pattern ( (invRecv1 o_3@@20))
)) (forall ((j_1@@2 Int) ) (!  (=> (and (<= 0 j_1@@2) (< j_1@@2 (len a_3@@1))) (not (= (loc a_3@@1 j_1@@2) null)))
 :qid |stdinbpl.311:22|
 :skolemid |27|
 :pattern ( (loc a_3@@1 j_1@@2))
 :pattern ( (loc a_3@@1 j_1@@2))
))) (=> (and (and (forall ((o_3@@21 T@U) ) (!  (=> (= (type o_3@@21) RefType) (and (=> (and (and (and (<= 0 (invRecv1 o_3@@21)) (< (invRecv1 o_3@@21) (len a_3@@1))) (< NoPerm FullPerm)) (qpRange1 o_3@@21)) (and (=> (< NoPerm FullPerm) (= (loc a_3@@1 (invRecv1 o_3@@21)) o_3@@21)) (= (U_2_real (MapType1Select QPMask@0 o_3@@21 val)) (+ (U_2_real (MapType1Select ZeroMask o_3@@21 val)) FullPerm)))) (=> (not (and (and (and (<= 0 (invRecv1 o_3@@21)) (< (invRecv1 o_3@@21) (len a_3@@1))) (< NoPerm FullPerm)) (qpRange1 o_3@@21))) (= (U_2_real (MapType1Select QPMask@0 o_3@@21 val)) (U_2_real (MapType1Select ZeroMask o_3@@21 val))))))
 :qid |stdinbpl.317:22|
 :skolemid |28|
 :pattern ( (MapType1Select QPMask@0 o_3@@21 val))
)) (forall ((o_3@@22 T@U) (f_5@@6 T@U) ) (! (let ((B@@18 (FieldTypeInv1 (type f_5@@6))))
(let ((A@@19 (FieldTypeInv0 (type f_5@@6))))
 (=> (and (and (= (type o_3@@22) RefType) (= (type f_5@@6) (FieldType A@@19 B@@18))) (not (= f_5@@6 val))) (= (U_2_real (MapType1Select ZeroMask o_3@@22 f_5@@6)) (U_2_real (MapType1Select QPMask@0 o_3@@22 f_5@@6))))))
 :qid |stdinbpl.321:29|
 :skolemid |29|
 :pattern ( (MapType1Select ZeroMask o_3@@22 f_5@@6))
 :pattern ( (MapType1Select QPMask@0 o_3@@22 f_5@@6))
))) (and (state Heap@@9 QPMask@0) (state Heap@@9 QPMask@0))) (and (and (=> (= (ControlFlow 0 144) 143) anon92_Else_correct) (=> (= (ControlFlow 0 144) 3) anon93_Then_correct)) (=> (= (ControlFlow 0 144) 6) anon93_Else_correct)))))))))
(let ((anon91_Then_correct true))
(let ((anon0_correct  (=> (state Heap@@9 ZeroMask) (and (=> (= (ControlFlow 0 146) 1) anon91_Then_correct) (=> (= (ControlFlow 0 146) 144) anon91_Else_correct)))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 147) 146) anon0_correct)))
PreconditionGeneratedEntry_correct))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
))
(check-sat)
(pop 1)
; Valid
(get-info :rlimit)
