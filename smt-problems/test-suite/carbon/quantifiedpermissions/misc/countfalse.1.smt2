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
(declare-fun |countFalse'| (T@U T@U Int Int) Int)
(declare-fun ArrayDomainTypeType () T@T)
(declare-fun dummyFunction (T@U) Bool)
(declare-fun |countFalse#triggerStateless| (T@U Int Int) Int)
(declare-fun |countFalseX'| (T@U T@U Int) Int)
(declare-fun |countFalseX#triggerStateless| (T@U Int) Int)
(declare-fun IdenticalOnKnownLocations (T@U T@U T@U) Bool)
(declare-fun IsPredicateField (T@U) Bool)
(declare-fun null () T@U)
(declare-fun PredicateMaskField (T@U) T@U)
(declare-fun FrameTypeType () T@T)
(declare-fun HasDirectPerm (T@U T@U T@U) Bool)
(declare-fun IsWandField (T@U) Bool)
(declare-fun WandMaskField (T@U) T@U)
(declare-fun |countFalseX#condqp1| (T@U T@U Int) Int)
(declare-fun |sk_countFalseX#condqp1| (Int Int) Int)
(declare-fun length (T@U) Int)
(declare-fun NoPerm () Real)
(declare-fun FullPerm () Real)
(declare-fun loc (T@U Int) T@U)
(declare-fun dummyHeap () T@U)
(declare-fun ZeroMask () T@U)
(declare-fun InsidePredicate (T@U T@U T@U T@U) Bool)
(declare-fun sumMask (T@U T@U T@U) Bool)
(declare-fun ConditionalFrame (Real T@U) T@U)
(declare-fun EmptyFrame () T@U)
(declare-fun countFalseX (T@U T@U Int) Int)
(declare-fun |countFalseX#frame| (T@U T@U Int) Int)
(declare-fun FrameFragment (T@U) T@U)
(declare-fun first (T@U) T@U)
(declare-fun second (T@U) Int)
(declare-fun countFalse (T@U T@U Int Int) Int)
(declare-fun AssumeFunctionsAbove () Int)
(declare-fun |countFalse#frame| (T@U T@U Int Int) Int)
(declare-fun |countFalse#condqp2| (T@U T@U Int Int) Int)
(declare-fun ZeroPMask () T@U)
(declare-fun |sk_countFalse#condqp2| (Int Int) Int)
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
))) (= (Ctor NormalFieldType) 7)) (= (type $allocated) (FieldType NormalFieldType boolType))) (= (type val) (FieldType NormalFieldType boolType))))
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
(assert (= (Ctor ArrayDomainTypeType) 11))
(assert (forall ((Heap@@0 T@U) (a_3 T@U) (from Int) (to Int) ) (!  (=> (and (= (type Heap@@0) (MapType0Type RefType)) (= (type a_3) ArrayDomainTypeType)) (dummyFunction (int_2_U (|countFalse#triggerStateless| a_3 from to))))
 :qid |stdinbpl.454:15|
 :skolemid |42|
 :pattern ( (|countFalse'| Heap@@0 a_3 from to))
)))
(assert (forall ((Heap@@1 T@U) (a_3@@0 T@U) (from@@0 Int) ) (!  (=> (and (= (type Heap@@1) (MapType0Type RefType)) (= (type a_3@@0) ArrayDomainTypeType)) (dummyFunction (int_2_U (|countFalseX#triggerStateless| a_3@@0 from@@0))))
 :qid |stdinbpl.280:15|
 :skolemid |25|
 :pattern ( (|countFalseX'| Heap@@1 a_3@@0 from@@0))
)))
(assert  (and (and (= (Ctor FrameTypeType) 12) (= (type null) RefType)) (forall ((arg0@@23 T@U) ) (! (let ((A (FieldTypeInv0 (type arg0@@23))))
(= (type (PredicateMaskField arg0@@23)) (FieldType A (MapType1Type RefType boolType))))
 :qid |funType:PredicateMaskField|
 :pattern ( (PredicateMaskField arg0@@23))
))))
(assert (forall ((Heap@@2 T@U) (ExhaleHeap T@U) (Mask@@0 T@U) (pm_f T@U) ) (! (let ((C (FieldTypeInv0 (type pm_f))))
 (=> (and (and (and (and (and (= (type Heap@@2) (MapType0Type RefType)) (= (type ExhaleHeap) (MapType0Type RefType))) (= (type Mask@@0) (MapType1Type RefType realType))) (= (type pm_f) (FieldType C FrameTypeType))) (IdenticalOnKnownLocations Heap@@2 ExhaleHeap Mask@@0)) (and (HasDirectPerm Mask@@0 null pm_f) (IsPredicateField pm_f))) (= (MapType0Select Heap@@2 null (PredicateMaskField pm_f)) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))))
 :qid |stdinbpl.47:19|
 :skolemid |2|
 :pattern ( (IdenticalOnKnownLocations Heap@@2 ExhaleHeap Mask@@0) (IsPredicateField pm_f) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))
)))
(assert (forall ((arg0@@24 T@U) ) (! (let ((A@@0 (FieldTypeInv0 (type arg0@@24))))
(= (type (WandMaskField arg0@@24)) (FieldType A@@0 (MapType1Type RefType boolType))))
 :qid |funType:WandMaskField|
 :pattern ( (WandMaskField arg0@@24))
)))
(assert (forall ((Heap@@3 T@U) (ExhaleHeap@@0 T@U) (Mask@@1 T@U) (pm_f@@0 T@U) ) (! (let ((C@@0 (FieldTypeInv0 (type pm_f@@0))))
 (=> (and (and (and (and (and (= (type Heap@@3) (MapType0Type RefType)) (= (type ExhaleHeap@@0) (MapType0Type RefType))) (= (type Mask@@1) (MapType1Type RefType realType))) (= (type pm_f@@0) (FieldType C@@0 FrameTypeType))) (IdenticalOnKnownLocations Heap@@3 ExhaleHeap@@0 Mask@@1)) (and (HasDirectPerm Mask@@1 null pm_f@@0) (IsWandField pm_f@@0))) (= (MapType0Select Heap@@3 null (WandMaskField pm_f@@0)) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))))
 :qid |stdinbpl.60:19|
 :skolemid |5|
 :pattern ( (IdenticalOnKnownLocations Heap@@3 ExhaleHeap@@0 Mask@@1) (IsWandField pm_f@@0) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))
)))
(assert (forall ((arg0@@25 T@U) (arg1@@9 Int) ) (! (= (type (loc arg0@@25 arg1@@9)) RefType)
 :qid |funType:loc|
 :pattern ( (loc arg0@@25 arg1@@9))
)))
(assert (forall ((Heap2Heap T@U) (Heap1Heap T@U) (a_3@@1 T@U) (from@@1 Int) ) (!  (=> (and (and (and (= (type Heap2Heap) (MapType0Type RefType)) (= (type Heap1Heap) (MapType0Type RefType))) (= (type a_3@@1) ArrayDomainTypeType)) (and (=  (and (and (<= from@@1 (|sk_countFalseX#condqp1| (|countFalseX#condqp1| Heap2Heap a_3@@1 from@@1) (|countFalseX#condqp1| Heap1Heap a_3@@1 from@@1))) (< (|sk_countFalseX#condqp1| (|countFalseX#condqp1| Heap2Heap a_3@@1 from@@1) (|countFalseX#condqp1| Heap1Heap a_3@@1 from@@1)) (length a_3@@1))) (< NoPerm FullPerm))  (and (and (<= from@@1 (|sk_countFalseX#condqp1| (|countFalseX#condqp1| Heap2Heap a_3@@1 from@@1) (|countFalseX#condqp1| Heap1Heap a_3@@1 from@@1))) (< (|sk_countFalseX#condqp1| (|countFalseX#condqp1| Heap2Heap a_3@@1 from@@1) (|countFalseX#condqp1| Heap1Heap a_3@@1 from@@1)) (length a_3@@1))) (< NoPerm FullPerm))) (=> (and (and (<= from@@1 (|sk_countFalseX#condqp1| (|countFalseX#condqp1| Heap2Heap a_3@@1 from@@1) (|countFalseX#condqp1| Heap1Heap a_3@@1 from@@1))) (< (|sk_countFalseX#condqp1| (|countFalseX#condqp1| Heap2Heap a_3@@1 from@@1) (|countFalseX#condqp1| Heap1Heap a_3@@1 from@@1)) (length a_3@@1))) (< NoPerm FullPerm)) (= (U_2_bool (MapType0Select Heap2Heap (loc a_3@@1 (|sk_countFalseX#condqp1| (|countFalseX#condqp1| Heap2Heap a_3@@1 from@@1) (|countFalseX#condqp1| Heap1Heap a_3@@1 from@@1))) val)) (U_2_bool (MapType0Select Heap1Heap (loc a_3@@1 (|sk_countFalseX#condqp1| (|countFalseX#condqp1| Heap2Heap a_3@@1 from@@1) (|countFalseX#condqp1| Heap1Heap a_3@@1 from@@1))) val)))))) (= (|countFalseX#condqp1| Heap2Heap a_3@@1 from@@1) (|countFalseX#condqp1| Heap1Heap a_3@@1 from@@1)))
 :qid |stdinbpl.303:15|
 :skolemid |28|
 :pattern ( (|countFalseX#condqp1| Heap2Heap a_3@@1 from@@1) (|countFalseX#condqp1| Heap1Heap a_3@@1 from@@1) (succHeapTrans Heap2Heap Heap1Heap))
)))
(assert (forall ((Heap@@4 T@U) (ExhaleHeap@@1 T@U) (Mask@@2 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@4) (MapType0Type RefType)) (= (type ExhaleHeap@@1) (MapType0Type RefType))) (= (type Mask@@2) (MapType1Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@4 ExhaleHeap@@1 Mask@@2)) (U_2_bool (MapType0Select Heap@@4 o_1 $allocated))) (U_2_bool (MapType0Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.73:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@4 ExhaleHeap@@1 Mask@@2) (MapType0Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert (forall ((a_3@@2 T@U) ) (!  (=> (= (type a_3@@2) ArrayDomainTypeType) (>= (length a_3@@2) 0))
 :qid |stdinbpl.256:15|
 :skolemid |23|
 :pattern ( (length a_3@@2))
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
 :qid |stdinbpl.225:19|
 :skolemid |21|
 :pattern ( (InsidePredicate p v_1 p w))
)))
(assert  (not (IsPredicateField val)))
(assert  (not (IsWandField val)))
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
(assert  (and (forall ((arg0@@26 Real) (arg1@@10 T@U) ) (! (= (type (ConditionalFrame arg0@@26 arg1@@10)) FrameTypeType)
 :qid |funType:ConditionalFrame|
 :pattern ( (ConditionalFrame arg0@@26 arg1@@10))
)) (= (type EmptyFrame) FrameTypeType)))
(assert (forall ((p@@0 Real) (f_6 T@U) ) (!  (=> (= (type f_6) FrameTypeType) (= (ConditionalFrame p@@0 f_6) (ite (> p@@0 0.0) f_6 EmptyFrame)))
 :qid |stdinbpl.213:15|
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
(assert (forall ((Heap@@7 T@U) (a_3@@3 T@U) (from@@2 Int) ) (!  (=> (and (= (type Heap@@7) (MapType0Type RefType)) (= (type a_3@@3) ArrayDomainTypeType)) (and (= (countFalseX Heap@@7 a_3@@3 from@@2) (|countFalseX'| Heap@@7 a_3@@3 from@@2)) (dummyFunction (int_2_U (|countFalseX#triggerStateless| a_3@@3 from@@2)))))
 :qid |stdinbpl.276:15|
 :skolemid |24|
 :pattern ( (countFalseX Heap@@7 a_3@@3 from@@2))
)))
(assert (forall ((arg0@@27 T@U) ) (! (= (type (FrameFragment arg0@@27)) FrameTypeType)
 :qid |funType:FrameFragment|
 :pattern ( (FrameFragment arg0@@27))
)))
(assert (forall ((Heap@@8 T@U) (Mask@@6 T@U) (a_3@@4 T@U) (from@@3 Int) ) (!  (=> (and (and (and (= (type Heap@@8) (MapType0Type RefType)) (= (type Mask@@6) (MapType1Type RefType realType))) (= (type a_3@@4) ArrayDomainTypeType)) (state Heap@@8 Mask@@6)) (= (|countFalseX'| Heap@@8 a_3@@4 from@@3) (|countFalseX#frame| (FrameFragment (int_2_U (|countFalseX#condqp1| Heap@@8 a_3@@4 from@@3))) a_3@@4 from@@3)))
 :qid |stdinbpl.293:15|
 :skolemid |27|
 :pattern ( (state Heap@@8 Mask@@6) (|countFalseX'| Heap@@8 a_3@@4 from@@3))
)))
(assert (forall ((arg0@@28 T@U) ) (! (= (type (first arg0@@28)) ArrayDomainTypeType)
 :qid |funType:first|
 :pattern ( (first arg0@@28))
)))
(assert (forall ((a_3@@5 T@U) (i_1 Int) ) (!  (=> (= (type a_3@@5) ArrayDomainTypeType) (and (= (first (loc a_3@@5 i_1)) a_3@@5) (= (second (loc a_3@@5 i_1)) i_1)))
 :qid |stdinbpl.250:15|
 :skolemid |22|
 :pattern ( (loc a_3@@5 i_1))
)))
(assert (forall ((o_2@@1 T@U) (f_4@@1 T@U) ) (! (let ((B@@4 (FieldTypeInv1 (type f_4@@1))))
(let ((A@@5 (FieldTypeInv0 (type f_4@@1))))
 (=> (and (= (type o_2@@1) RefType) (= (type f_4@@1) (FieldType A@@5 B@@4))) (= (U_2_real (MapType1Select ZeroMask o_2@@1 f_4@@1)) NoPerm))))
 :qid |stdinbpl.106:22|
 :skolemid |13|
 :pattern ( (MapType1Select ZeroMask o_2@@1 f_4@@1))
)))
(assert (forall ((Heap@@9 T@U) (a_3@@6 T@U) (from@@4 Int) (to@@0 Int) ) (!  (=> (and (= (type Heap@@9) (MapType0Type RefType)) (= (type a_3@@6) ArrayDomainTypeType)) (and (= (countFalse Heap@@9 a_3@@6 from@@4 to@@0) (|countFalse'| Heap@@9 a_3@@6 from@@4 to@@0)) (dummyFunction (int_2_U (|countFalse#triggerStateless| a_3@@6 from@@4 to@@0)))))
 :qid |stdinbpl.450:15|
 :skolemid |41|
 :pattern ( (countFalse Heap@@9 a_3@@6 from@@4 to@@0))
)))
(assert (forall ((Heap@@10 T@U) (Mask@@7 T@U) (a_3@@7 T@U) (from@@5 Int) (to@@1 Int) ) (!  (=> (and (and (and (and (= (type Heap@@10) (MapType0Type RefType)) (= (type Mask@@7) (MapType1Type RefType realType))) (= (type a_3@@7) ArrayDomainTypeType)) (and (state Heap@@10 Mask@@7) (< AssumeFunctionsAbove 0))) (and (<= 0 from@@5) (and (<= from@@5 to@@1) (<= to@@1 (length a_3@@7))))) (= (countFalse Heap@@10 a_3@@7 from@@5 to@@1) (ite (= from@@5 to@@1) 0 (+ (ite (U_2_bool (MapType0Select Heap@@10 (loc a_3@@7 from@@5) val)) 0 1) (|countFalse'| Heap@@10 a_3@@7 (+ from@@5 1) to@@1)))))
 :qid |stdinbpl.460:15|
 :skolemid |43|
 :pattern ( (state Heap@@10 Mask@@7) (countFalse Heap@@10 a_3@@7 from@@5 to@@1))
)))
(assert (forall ((Heap@@11 T@U) (ExhaleHeap@@4 T@U) (Mask@@8 T@U) (pm_f@@1 T@U) ) (! (let ((C@@1 (FieldTypeInv0 (type pm_f@@1))))
 (=> (and (and (and (and (and (= (type Heap@@11) (MapType0Type RefType)) (= (type ExhaleHeap@@4) (MapType0Type RefType))) (= (type Mask@@8) (MapType1Type RefType realType))) (= (type pm_f@@1) (FieldType C@@1 FrameTypeType))) (IdenticalOnKnownLocations Heap@@11 ExhaleHeap@@4 Mask@@8)) (and (HasDirectPerm Mask@@8 null pm_f@@1) (IsPredicateField pm_f@@1))) (forall ((o2 T@U) (f_2@@0 T@U) ) (! (let ((B@@5 (FieldTypeInv1 (type f_2@@0))))
(let ((A@@6 (FieldTypeInv0 (type f_2@@0))))
 (=> (and (and (= (type o2) RefType) (= (type f_2@@0) (FieldType A@@6 B@@5))) (U_2_bool (MapType1Select (MapType0Select Heap@@11 null (PredicateMaskField pm_f@@1)) o2 f_2@@0))) (= (MapType0Select Heap@@11 o2 f_2@@0) (MapType0Select ExhaleHeap@@4 o2 f_2@@0)))))
 :qid |stdinbpl.54:134|
 :skolemid |3|
 :pattern ( (MapType0Select ExhaleHeap@@4 o2 f_2@@0))
))))
 :qid |stdinbpl.52:19|
 :skolemid |4|
 :pattern ( (IdenticalOnKnownLocations Heap@@11 ExhaleHeap@@4 Mask@@8) (IsPredicateField pm_f@@1))
)))
(assert (forall ((Heap@@12 T@U) (ExhaleHeap@@5 T@U) (Mask@@9 T@U) (pm_f@@2 T@U) ) (! (let ((C@@2 (FieldTypeInv0 (type pm_f@@2))))
 (=> (and (and (and (and (and (= (type Heap@@12) (MapType0Type RefType)) (= (type ExhaleHeap@@5) (MapType0Type RefType))) (= (type Mask@@9) (MapType1Type RefType realType))) (= (type pm_f@@2) (FieldType C@@2 FrameTypeType))) (IdenticalOnKnownLocations Heap@@12 ExhaleHeap@@5 Mask@@9)) (and (HasDirectPerm Mask@@9 null pm_f@@2) (IsWandField pm_f@@2))) (forall ((o2@@0 T@U) (f_2@@1 T@U) ) (! (let ((B@@6 (FieldTypeInv1 (type f_2@@1))))
(let ((A@@7 (FieldTypeInv0 (type f_2@@1))))
 (=> (and (and (= (type o2@@0) RefType) (= (type f_2@@1) (FieldType A@@7 B@@6))) (U_2_bool (MapType1Select (MapType0Select Heap@@12 null (WandMaskField pm_f@@2)) o2@@0 f_2@@1))) (= (MapType0Select Heap@@12 o2@@0 f_2@@1) (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1)))))
 :qid |stdinbpl.67:129|
 :skolemid |6|
 :pattern ( (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1))
))))
 :qid |stdinbpl.65:19|
 :skolemid |7|
 :pattern ( (IdenticalOnKnownLocations Heap@@12 ExhaleHeap@@5 Mask@@9) (IsWandField pm_f@@2))
)))
(assert (forall ((Mask@@10 T@U) (o_2@@2 T@U) (f_4@@2 T@U) ) (! (let ((B@@7 (FieldTypeInv1 (type f_4@@2))))
(let ((A@@8 (FieldTypeInv0 (type f_4@@2))))
 (=> (and (and (and (= (type Mask@@10) (MapType1Type RefType realType)) (= (type o_2@@2) RefType)) (= (type f_4@@2) (FieldType A@@8 B@@7))) (GoodMask Mask@@10)) (and (>= (U_2_real (MapType1Select Mask@@10 o_2@@2 f_4@@2)) NoPerm) (=> (and (and (GoodMask Mask@@10) (not (IsPredicateField f_4@@2))) (not (IsWandField f_4@@2))) (<= (U_2_real (MapType1Select Mask@@10 o_2@@2 f_4@@2)) FullPerm))))))
 :qid |stdinbpl.128:22|
 :skolemid |16|
 :pattern ( (GoodMask Mask@@10) (MapType1Select Mask@@10 o_2@@2 f_4@@2))
)))
(assert (forall ((Heap@@13 T@U) (Mask@@11 T@U) (a_3@@8 T@U) (from@@6 Int) (to@@2 Int) ) (!  (=> (and (and (and (= (type Heap@@13) (MapType0Type RefType)) (= (type Mask@@11) (MapType1Type RefType realType))) (= (type a_3@@8) ArrayDomainTypeType)) (state Heap@@13 Mask@@11)) (= (|countFalse'| Heap@@13 a_3@@8 from@@6 to@@2) (|countFalse#frame| (FrameFragment (int_2_U (|countFalse#condqp2| Heap@@13 a_3@@8 from@@6 to@@2))) a_3@@8 from@@6 to@@2)))
 :qid |stdinbpl.467:15|
 :skolemid |44|
 :pattern ( (state Heap@@13 Mask@@11) (|countFalse'| Heap@@13 a_3@@8 from@@6 to@@2))
)))
(assert (forall ((o T@U) (f T@U) (Heap@@14 T@U) ) (!  (=> (and (and (and (= (type o) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap@@14) (MapType0Type RefType))) (U_2_bool (MapType0Select Heap@@14 o $allocated))) (U_2_bool (MapType0Select Heap@@14 (MapType0Select Heap@@14 o f) $allocated)))
 :qid |stdinbpl.31:15|
 :skolemid |0|
 :pattern ( (MapType0Select Heap@@14 o f))
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
(assert (forall ((p@@1 T@U) (v_1@@0 T@U) (q T@U) (w@@0 T@U) (r T@U) (u T@U) ) (! (let ((C@@3 (FieldTypeInv0 (type r))))
(let ((B@@10 (FieldTypeInv0 (type q))))
(let ((A@@11 (FieldTypeInv0 (type p@@1))))
 (=> (and (and (and (and (and (and (= (type p@@1) (FieldType A@@11 FrameTypeType)) (= (type v_1@@0) FrameTypeType)) (= (type q) (FieldType B@@10 FrameTypeType))) (= (type w@@0) FrameTypeType)) (= (type r) (FieldType C@@3 FrameTypeType))) (= (type u) FrameTypeType)) (and (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))) (InsidePredicate p@@1 v_1@@0 r u)))))
 :qid |stdinbpl.220:25|
 :skolemid |20|
 :pattern ( (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))
)))
(assert (forall ((Heap2Heap@@0 T@U) (Heap1Heap@@0 T@U) (a_3@@9 T@U) (from@@7 Int) (to@@3 Int) ) (!  (=> (and (and (and (= (type Heap2Heap@@0) (MapType0Type RefType)) (= (type Heap1Heap@@0) (MapType0Type RefType))) (= (type a_3@@9) ArrayDomainTypeType)) (and (=  (and (and (<= from@@7 (|sk_countFalse#condqp2| (|countFalse#condqp2| Heap2Heap@@0 a_3@@9 from@@7 to@@3) (|countFalse#condqp2| Heap1Heap@@0 a_3@@9 from@@7 to@@3))) (< (|sk_countFalse#condqp2| (|countFalse#condqp2| Heap2Heap@@0 a_3@@9 from@@7 to@@3) (|countFalse#condqp2| Heap1Heap@@0 a_3@@9 from@@7 to@@3)) to@@3)) (< NoPerm FullPerm))  (and (and (<= from@@7 (|sk_countFalse#condqp2| (|countFalse#condqp2| Heap2Heap@@0 a_3@@9 from@@7 to@@3) (|countFalse#condqp2| Heap1Heap@@0 a_3@@9 from@@7 to@@3))) (< (|sk_countFalse#condqp2| (|countFalse#condqp2| Heap2Heap@@0 a_3@@9 from@@7 to@@3) (|countFalse#condqp2| Heap1Heap@@0 a_3@@9 from@@7 to@@3)) to@@3)) (< NoPerm FullPerm))) (=> (and (and (<= from@@7 (|sk_countFalse#condqp2| (|countFalse#condqp2| Heap2Heap@@0 a_3@@9 from@@7 to@@3) (|countFalse#condqp2| Heap1Heap@@0 a_3@@9 from@@7 to@@3))) (< (|sk_countFalse#condqp2| (|countFalse#condqp2| Heap2Heap@@0 a_3@@9 from@@7 to@@3) (|countFalse#condqp2| Heap1Heap@@0 a_3@@9 from@@7 to@@3)) to@@3)) (< NoPerm FullPerm)) (= (U_2_bool (MapType0Select Heap2Heap@@0 (loc a_3@@9 (|sk_countFalse#condqp2| (|countFalse#condqp2| Heap2Heap@@0 a_3@@9 from@@7 to@@3) (|countFalse#condqp2| Heap1Heap@@0 a_3@@9 from@@7 to@@3))) val)) (U_2_bool (MapType0Select Heap1Heap@@0 (loc a_3@@9 (|sk_countFalse#condqp2| (|countFalse#condqp2| Heap2Heap@@0 a_3@@9 from@@7 to@@3) (|countFalse#condqp2| Heap1Heap@@0 a_3@@9 from@@7 to@@3))) val)))))) (= (|countFalse#condqp2| Heap2Heap@@0 a_3@@9 from@@7 to@@3) (|countFalse#condqp2| Heap1Heap@@0 a_3@@9 from@@7 to@@3)))
 :qid |stdinbpl.477:15|
 :skolemid |45|
 :pattern ( (|countFalse#condqp2| Heap2Heap@@0 a_3@@9 from@@7 to@@3) (|countFalse#condqp2| Heap1Heap@@0 a_3@@9 from@@7 to@@3) (succHeapTrans Heap2Heap@@0 Heap1Heap@@0))
)))
(assert (forall ((Heap@@16 T@U) (Mask@@12 T@U) (a_3@@10 T@U) (from@@8 Int) ) (!  (=> (and (and (and (and (= (type Heap@@16) (MapType0Type RefType)) (= (type Mask@@12) (MapType1Type RefType realType))) (= (type a_3@@10) ArrayDomainTypeType)) (and (state Heap@@16 Mask@@12) (< AssumeFunctionsAbove 1))) (and (<= 0 from@@8) (<= from@@8 (length a_3@@10)))) (= (countFalseX Heap@@16 a_3@@10 from@@8) (ite (= from@@8 (length a_3@@10)) 0 (|countFalseX'| Heap@@16 a_3@@10 (+ from@@8 1)))))
 :qid |stdinbpl.286:15|
 :skolemid |26|
 :pattern ( (state Heap@@16 Mask@@12) (countFalseX Heap@@16 a_3@@10 from@@8))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun Heap@@17 () T@U)
(declare-fun a_3@@11 () T@U)
(declare-fun from@@9 () Int)
(declare-fun QPMask@0 () T@U)
(declare-fun neverTriggered10 (Int) Bool)
(declare-fun neverTriggered9 (Int) Bool)
(declare-fun qpRange8 (T@U) Bool)
(declare-fun invRecv8 (T@U) Int)
(assert  (and (and (= (type a_3@@11) ArrayDomainTypeType) (= (type QPMask@0) (MapType1Type RefType realType))) (= (type Heap@@17) (MapType0Type RefType))))
(set-info :boogie-vc-id lemmaFrontXX)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 20) (let ((anon8_correct  (and (=> (= (ControlFlow 0 13) (- 0 14)) (= (countFalseX Heap@@17 a_3@@11 from@@9) (ite (= from@@9 (length a_3@@11)) 0 (countFalseX Heap@@17 a_3@@11 (+ from@@9 1))))) (=> (= (countFalseX Heap@@17 a_3@@11 from@@9) (ite (= from@@9 (length a_3@@11)) 0 (countFalseX Heap@@17 a_3@@11 (+ from@@9 1)))) (=> (and (state Heap@@17 QPMask@0) (= (ControlFlow 0 13) (- 0 12))) false)))))
(let ((anon11_Then_correct  (=> (and (= from@@9 (length a_3@@11)) (= (ControlFlow 0 15) 13)) anon8_correct)))
(let ((anon12_Then_correct  (and (=> (= (ControlFlow 0 8) (- 0 11)) (<= 0 (+ from@@9 1))) (=> (<= 0 (+ from@@9 1)) (and (=> (= (ControlFlow 0 8) (- 0 10)) (<= (+ from@@9 1) (length a_3@@11))) (=> (<= (+ from@@9 1) (length a_3@@11)) (and (=> (= (ControlFlow 0 8) (- 0 9)) (forall ((z_3 Int) (z_3_1 Int) ) (!  (=> (and (and (and (and (not (= z_3 z_3_1)) (and (<= (+ from@@9 1) z_3) (< z_3 (length a_3@@11)))) (and (<= (+ from@@9 1) z_3_1) (< z_3_1 (length a_3@@11)))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (loc a_3@@11 z_3) (loc a_3@@11 z_3_1))))
 :qid |stdinbpl.971:23|
 :skolemid |88|
 :pattern ( (neverTriggered10 z_3) (neverTriggered10 z_3_1))
))) (=> (forall ((z_3@@0 Int) (z_3_1@@0 Int) ) (!  (=> (and (and (and (and (not (= z_3@@0 z_3_1@@0)) (and (<= (+ from@@9 1) z_3@@0) (< z_3@@0 (length a_3@@11)))) (and (<= (+ from@@9 1) z_3_1@@0) (< z_3_1@@0 (length a_3@@11)))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (loc a_3@@11 z_3@@0) (loc a_3@@11 z_3_1@@0))))
 :qid |stdinbpl.971:23|
 :skolemid |88|
 :pattern ( (neverTriggered10 z_3@@0) (neverTriggered10 z_3_1@@0))
)) (=> (= (ControlFlow 0 8) (- 0 7)) (forall ((z_3@@1 Int) ) (!  (=> (and (<= (+ from@@9 1) z_3@@1) (< z_3@@1 (length a_3@@11))) (>= (U_2_real (MapType1Select QPMask@0 (loc a_3@@11 z_3@@1) val)) FullPerm))
 :qid |stdinbpl.978:23|
 :skolemid |89|
 :pattern ( (loc a_3@@11 z_3@@1))
 :pattern ( (loc a_3@@11 z_3@@1))
)))))))))))
(let ((anon11_Else_correct  (=> (not (= from@@9 (length a_3@@11))) (and (=> (= (ControlFlow 0 16) 8) anon12_Then_correct) (=> (= (ControlFlow 0 16) 13) anon8_correct)))))
(let ((anon10_Then_correct  (and (=> (= (ControlFlow 0 3) (- 0 6)) (<= 0 from@@9)) (=> (<= 0 from@@9) (and (=> (= (ControlFlow 0 3) (- 0 5)) (<= from@@9 (length a_3@@11))) (=> (<= from@@9 (length a_3@@11)) (and (=> (= (ControlFlow 0 3) (- 0 4)) (forall ((z_2 Int) (z_2_1 Int) ) (!  (=> (and (and (and (and (not (= z_2 z_2_1)) (and (<= from@@9 z_2) (< z_2 (length a_3@@11)))) (and (<= from@@9 z_2_1) (< z_2_1 (length a_3@@11)))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (loc a_3@@11 z_2) (loc a_3@@11 z_2_1))))
 :qid |stdinbpl.913:21|
 :skolemid |82|
 :pattern ( (neverTriggered9 z_2) (neverTriggered9 z_2_1))
))) (=> (forall ((z_2@@0 Int) (z_2_1@@0 Int) ) (!  (=> (and (and (and (and (not (= z_2@@0 z_2_1@@0)) (and (<= from@@9 z_2@@0) (< z_2@@0 (length a_3@@11)))) (and (<= from@@9 z_2_1@@0) (< z_2_1@@0 (length a_3@@11)))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (loc a_3@@11 z_2@@0) (loc a_3@@11 z_2_1@@0))))
 :qid |stdinbpl.913:21|
 :skolemid |82|
 :pattern ( (neverTriggered9 z_2@@0) (neverTriggered9 z_2_1@@0))
)) (=> (= (ControlFlow 0 3) (- 0 2)) (forall ((z_2@@1 Int) ) (!  (=> (and (<= from@@9 z_2@@1) (< z_2@@1 (length a_3@@11))) (>= (U_2_real (MapType1Select QPMask@0 (loc a_3@@11 z_2@@1) val)) FullPerm))
 :qid |stdinbpl.920:21|
 :skolemid |83|
 :pattern ( (loc a_3@@11 z_2@@1))
 :pattern ( (loc a_3@@11 z_2@@1))
)))))))))))
(let ((anon9_Else_correct  (and (=> (= (ControlFlow 0 17) (- 0 18)) (forall ((z_1 Int) (z_1_1 Int) ) (!  (=> (and (and (and (and (not (= z_1 z_1_1)) (and (<= from@@9 z_1) (< z_1 (length a_3@@11)))) (and (<= from@@9 z_1_1) (< z_1_1 (length a_3@@11)))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (loc a_3@@11 z_1) (loc a_3@@11 z_1_1))))
 :qid |stdinbpl.852:15|
 :skolemid |76|
))) (=> (forall ((z_1@@0 Int) (z_1_1@@0 Int) ) (!  (=> (and (and (and (and (not (= z_1@@0 z_1_1@@0)) (and (<= from@@9 z_1@@0) (< z_1@@0 (length a_3@@11)))) (and (<= from@@9 z_1_1@@0) (< z_1_1@@0 (length a_3@@11)))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (not (= (loc a_3@@11 z_1@@0) (loc a_3@@11 z_1_1@@0))))
 :qid |stdinbpl.852:15|
 :skolemid |76|
)) (=> (forall ((z_1@@1 Int) ) (!  (=> (and (and (<= from@@9 z_1@@1) (< z_1@@1 (length a_3@@11))) (< NoPerm FullPerm)) (and (qpRange8 (loc a_3@@11 z_1@@1)) (= (invRecv8 (loc a_3@@11 z_1@@1)) z_1@@1)))
 :qid |stdinbpl.858:22|
 :skolemid |77|
 :pattern ( (loc a_3@@11 z_1@@1))
 :pattern ( (loc a_3@@11 z_1@@1))
)) (=> (and (forall ((o_3 T@U) ) (!  (=> (= (type o_3) RefType) (=> (and (and (and (<= from@@9 (invRecv8 o_3)) (< (invRecv8 o_3) (length a_3@@11))) (< NoPerm FullPerm)) (qpRange8 o_3)) (= (loc a_3@@11 (invRecv8 o_3)) o_3)))
 :qid |stdinbpl.862:22|
 :skolemid |78|
 :pattern ( (invRecv8 o_3))
)) (forall ((z_1@@2 Int) ) (!  (=> (and (<= from@@9 z_1@@2) (< z_1@@2 (length a_3@@11))) (not (= (loc a_3@@11 z_1@@2) null)))
 :qid |stdinbpl.868:22|
 :skolemid |79|
 :pattern ( (loc a_3@@11 z_1@@2))
 :pattern ( (loc a_3@@11 z_1@@2))
))) (=> (and (and (forall ((o_3@@0 T@U) ) (!  (=> (= (type o_3@@0) RefType) (and (=> (and (and (and (<= from@@9 (invRecv8 o_3@@0)) (< (invRecv8 o_3@@0) (length a_3@@11))) (< NoPerm FullPerm)) (qpRange8 o_3@@0)) (and (=> (< NoPerm FullPerm) (= (loc a_3@@11 (invRecv8 o_3@@0)) o_3@@0)) (= (U_2_real (MapType1Select QPMask@0 o_3@@0 val)) (+ (U_2_real (MapType1Select ZeroMask o_3@@0 val)) FullPerm)))) (=> (not (and (and (and (<= from@@9 (invRecv8 o_3@@0)) (< (invRecv8 o_3@@0) (length a_3@@11))) (< NoPerm FullPerm)) (qpRange8 o_3@@0))) (= (U_2_real (MapType1Select QPMask@0 o_3@@0 val)) (U_2_real (MapType1Select ZeroMask o_3@@0 val))))))
 :qid |stdinbpl.874:22|
 :skolemid |80|
 :pattern ( (MapType1Select QPMask@0 o_3@@0 val))
)) (forall ((o_3@@1 T@U) (f_5 T@U) ) (! (let ((B@@11 (FieldTypeInv1 (type f_5))))
(let ((A@@12 (FieldTypeInv0 (type f_5))))
 (=> (and (and (= (type o_3@@1) RefType) (= (type f_5) (FieldType A@@12 B@@11))) (not (= f_5 val))) (= (U_2_real (MapType1Select ZeroMask o_3@@1 f_5)) (U_2_real (MapType1Select QPMask@0 o_3@@1 f_5))))))
 :qid |stdinbpl.878:29|
 :skolemid |81|
 :pattern ( (MapType1Select ZeroMask o_3@@1 f_5))
 :pattern ( (MapType1Select QPMask@0 o_3@@1 f_5))
))) (and (state Heap@@17 QPMask@0) (state Heap@@17 QPMask@0))) (and (and (=> (= (ControlFlow 0 17) 3) anon10_Then_correct) (=> (= (ControlFlow 0 17) 15) anon11_Then_correct)) (=> (= (ControlFlow 0 17) 16) anon11_Else_correct)))))))))
(let ((anon9_Then_correct true))
(let ((anon0_correct  (=> (state Heap@@17 ZeroMask) (=> (and (and (= AssumeFunctionsAbove (- 0 1)) (<= 0 from@@9)) (and (<= from@@9 (length a_3@@11)) (state Heap@@17 ZeroMask))) (and (=> (= (ControlFlow 0 19) 1) anon9_Then_correct) (=> (= (ControlFlow 0 19) 17) anon9_Else_correct))))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 20) 19) anon0_correct)))
PreconditionGeneratedEntry_correct))))))))))
))
(check-sat)
(get-info :reason-unknown)
(assert (not (= (ControlFlow 0 13) (- 12))))
(check-sat)
(pop 1)
; Invalid
(get-info :rlimit)
