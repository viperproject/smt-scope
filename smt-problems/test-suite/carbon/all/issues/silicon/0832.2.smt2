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
(declare-fun |arr#condqp1| (T@U T@U Int) Int)
(declare-fun succHeapTrans (T@U T@U) Bool)
(declare-fun MapType0Type (T@T) T@T)
(declare-fun RefType () T@T)
(declare-fun ArrayDomainTypeType () T@T)
(declare-fun |sk_arr#condqp1| (Int Int) Int)
(declare-fun alen (T@U) Int)
(declare-fun NoPerm () Real)
(declare-fun FullPerm () Real)
(declare-fun MapType0Select (T@U T@U T@U) T@U)
(declare-fun aloc (T@U T@U Int) T@U)
(declare-fun MapType0TypeInv0 (T@T) T@T)
(declare-fun MapType0Store (T@U T@U T@U T@U) T@U)
(declare-fun succHeap (T@U T@U) Bool)
(declare-fun state (T@U T@U) Bool)
(declare-fun MapType1Type (T@T T@T) T@T)
(declare-fun GoodMask (T@U) Bool)
(declare-fun MapType1TypeInv0 (T@T) T@T)
(declare-fun MapType1TypeInv1 (T@T) T@T)
(declare-fun MapType1Select (T@U T@U T@U) T@U)
(declare-fun MapType1Store (T@U T@U T@U T@U) T@U)
(declare-fun arrR (Int T@U Int) T@U)
(declare-fun IsPredicateField (T@U) Bool)
(declare-fun PredicateType_arrRType () T@T)
(declare-fun FrameTypeType () T@T)
(declare-fun |arrR#trigger| (T@U T@U) Bool)
(declare-fun |arrR#everUsed| (T@U) Bool)
(declare-fun getPredWandId (T@U) Int)
(declare-fun arr (T@U Int) T@U)
(declare-fun PredicateType_arrType () T@T)
(declare-fun |aloc'| (T@U T@U Int) T@U)
(declare-fun dummyFunction (T@U) Bool)
(declare-fun |aloc#triggerStateless| (T@U Int) T@U)
(declare-fun |arr#trigger| (T@U T@U) Bool)
(declare-fun |arr#everUsed| (T@U) Bool)
(declare-fun IdenticalOnKnownLocations (T@U T@U T@U) Bool)
(declare-fun null () T@U)
(declare-fun PredicateMaskField (T@U) T@U)
(declare-fun HasDirectPerm (T@U T@U T@U) Bool)
(declare-fun IsWandField (T@U) Bool)
(declare-fun WandMaskField (T@U) T@U)
(declare-fun |aloc#frame| (T@U T@U Int) T@U)
(declare-fun EmptyFrame () T@U)
(declare-fun |arrR#sm| (Int T@U Int) T@U)
(declare-fun |arr#sm| (T@U Int) T@U)
(declare-fun dummyHeap () T@U)
(declare-fun ZeroMask () T@U)
(declare-fun InsidePredicate (T@U T@U T@U T@U) Bool)
(declare-fun sumMask (T@U T@U T@U) Bool)
(declare-fun ConditionalFrame (Real T@U) T@U)
(declare-fun array_loc (T@U Int) T@U)
(declare-fun loc_inv_1 (T@U) T@U)
(declare-fun loc_inv_2 (T@U) Int)
(declare-fun AssumeFunctionsAbove () Int)
(declare-fun |aloc#trigger| (T@U T@U Int) Bool)
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
(assert  (and (and (and (and (and (and (and (and (forall ((arg0@@14 T@T) ) (! (= (Ctor (MapType0Type arg0@@14)) 8)
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
)))) (= (Ctor RefType) 9)) (= (Ctor ArrayDomainTypeType) 10)) (forall ((arg0@@18 T@U) (arg1@@4 T@U) (arg2@@1 Int) ) (! (= (type (aloc arg0@@18 arg1@@4 arg2@@1)) RefType)
 :qid |funType:aloc|
 :pattern ( (aloc arg0@@18 arg1@@4 arg2@@1))
))))
(assert (forall ((Heap2Heap T@U) (Heap1Heap T@U) (a_1 T@U) (n Int) ) (!  (=> (and (and (and (= (type Heap2Heap) (MapType0Type RefType)) (= (type Heap1Heap) (MapType0Type RefType))) (= (type a_1) ArrayDomainTypeType)) (and (=  (and (and (<= 0 (|sk_arr#condqp1| (|arr#condqp1| Heap2Heap a_1 n) (|arr#condqp1| Heap1Heap a_1 n))) (< (|sk_arr#condqp1| (|arr#condqp1| Heap2Heap a_1 n) (|arr#condqp1| Heap1Heap a_1 n)) (alen a_1))) (< NoPerm FullPerm))  (and (and (<= 0 (|sk_arr#condqp1| (|arr#condqp1| Heap2Heap a_1 n) (|arr#condqp1| Heap1Heap a_1 n))) (< (|sk_arr#condqp1| (|arr#condqp1| Heap2Heap a_1 n) (|arr#condqp1| Heap1Heap a_1 n)) (alen a_1))) (< NoPerm FullPerm))) (=> (and (and (<= 0 (|sk_arr#condqp1| (|arr#condqp1| Heap2Heap a_1 n) (|arr#condqp1| Heap1Heap a_1 n))) (< (|sk_arr#condqp1| (|arr#condqp1| Heap2Heap a_1 n) (|arr#condqp1| Heap1Heap a_1 n)) (alen a_1))) (< NoPerm FullPerm)) (= (U_2_int (MapType0Select Heap2Heap (aloc Heap2Heap a_1 (|sk_arr#condqp1| (|arr#condqp1| Heap2Heap a_1 n) (|arr#condqp1| Heap1Heap a_1 n))) vint)) (U_2_int (MapType0Select Heap1Heap (aloc Heap1Heap a_1 (|sk_arr#condqp1| (|arr#condqp1| Heap2Heap a_1 n) (|arr#condqp1| Heap1Heap a_1 n))) vint)))))) (= (|arr#condqp1| Heap2Heap a_1 n) (|arr#condqp1| Heap1Heap a_1 n)))
 :qid |stdinbpl.426:15|
 :skolemid |42|
 :pattern ( (|arr#condqp1| Heap2Heap a_1 n) (|arr#condqp1| Heap1Heap a_1 n) (succHeapTrans Heap2Heap Heap1Heap))
)))
(assert (forall ((Heap0 T@U) (Heap1 T@U) ) (!  (=> (and (and (= (type Heap0) (MapType0Type RefType)) (= (type Heap1) (MapType0Type RefType))) (succHeap Heap0 Heap1)) (succHeapTrans Heap0 Heap1))
 :qid |stdinbpl.88:15|
 :skolemid |11|
 :pattern ( (succHeap Heap0 Heap1))
)))
(assert  (and (and (and (and (and (and (forall ((arg0@@19 T@T) (arg1@@5 T@T) ) (! (= (Ctor (MapType1Type arg0@@19 arg1@@5)) 11)
 :qid |ctor:MapType1Type|
)) (forall ((arg0@@20 T@T) (arg1@@6 T@T) ) (! (= (MapType1TypeInv0 (MapType1Type arg0@@20 arg1@@6)) arg0@@20)
 :qid |typeInv:MapType1TypeInv0|
 :pattern ( (MapType1Type arg0@@20 arg1@@6))
))) (forall ((arg0@@21 T@T) (arg1@@7 T@T) ) (! (= (MapType1TypeInv1 (MapType1Type arg0@@21 arg1@@7)) arg1@@7)
 :qid |typeInv:MapType1TypeInv1|
 :pattern ( (MapType1Type arg0@@21 arg1@@7))
))) (forall ((arg0@@22 T@U) (arg1@@8 T@U) (arg2@@2 T@U) ) (! (let ((aVar1 (MapType1TypeInv1 (type arg0@@22))))
(= (type (MapType1Select arg0@@22 arg1@@8 arg2@@2)) aVar1))
 :qid |funType:MapType1Select|
 :pattern ( (MapType1Select arg0@@22 arg1@@8 arg2@@2))
))) (forall ((arg0@@23 T@U) (arg1@@9 T@U) (arg2@@3 T@U) (arg3@@0 T@U) ) (! (let ((aVar1@@0 (type arg3@@0)))
(let ((aVar0@@0 (type arg1@@9)))
(= (type (MapType1Store arg0@@23 arg1@@9 arg2@@3 arg3@@0)) (MapType1Type aVar0@@0 aVar1@@0))))
 :qid |funType:MapType1Store|
 :pattern ( (MapType1Store arg0@@23 arg1@@9 arg2@@3 arg3@@0))
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
(assert  (and (and (= (Ctor PredicateType_arrRType) 12) (= (Ctor FrameTypeType) 13)) (forall ((arg0@@24 Int) (arg1@@10 T@U) (arg2@@4 Int) ) (! (= (type (arrR arg0@@24 arg1@@10 arg2@@4)) (FieldType PredicateType_arrRType FrameTypeType))
 :qid |funType:arrR|
 :pattern ( (arrR arg0@@24 arg1@@10 arg2@@4))
))))
(assert (forall ((x@@8 Int) (a_1@@0 T@U) (n@@0 Int) ) (!  (=> (= (type a_1@@0) ArrayDomainTypeType) (IsPredicateField (arrR x@@8 a_1@@0 n@@0)))
 :qid |stdinbpl.324:15|
 :skolemid |31|
 :pattern ( (arrR x@@8 a_1@@0 n@@0))
)))
(assert (forall ((Heap@@0 T@U) (x@@9 Int) (a_1@@1 T@U) (n@@1 Int) ) (!  (=> (and (= (type Heap@@0) (MapType0Type RefType)) (= (type a_1@@1) ArrayDomainTypeType)) (|arrR#everUsed| (arrR x@@9 a_1@@1 n@@1)))
 :qid |stdinbpl.343:15|
 :skolemid |35|
 :pattern ( (|arrR#trigger| Heap@@0 (arrR x@@9 a_1@@1 n@@1)))
)))
(assert (forall ((x@@10 Int) (a_1@@2 T@U) (n@@2 Int) ) (!  (=> (= (type a_1@@2) ArrayDomainTypeType) (= (getPredWandId (arrR x@@10 a_1@@2 n@@2)) 0))
 :qid |stdinbpl.328:15|
 :skolemid |32|
 :pattern ( (arrR x@@10 a_1@@2 n@@2))
)))
(assert  (and (= (Ctor PredicateType_arrType) 14) (forall ((arg0@@25 T@U) (arg1@@11 Int) ) (! (= (type (arr arg0@@25 arg1@@11)) (FieldType PredicateType_arrType FrameTypeType))
 :qid |funType:arr|
 :pattern ( (arr arg0@@25 arg1@@11))
))))
(assert (forall ((a_1@@3 T@U) (n@@3 Int) ) (!  (=> (= (type a_1@@3) ArrayDomainTypeType) (IsPredicateField (arr a_1@@3 n@@3)))
 :qid |stdinbpl.396:15|
 :skolemid |37|
 :pattern ( (arr a_1@@3 n@@3))
)))
(assert  (and (forall ((arg0@@26 T@U) (arg1@@12 T@U) (arg2@@5 Int) ) (! (= (type (|aloc'| arg0@@26 arg1@@12 arg2@@5)) RefType)
 :qid |funType:aloc'|
 :pattern ( (|aloc'| arg0@@26 arg1@@12 arg2@@5))
)) (forall ((arg0@@27 T@U) (arg1@@13 Int) ) (! (= (type (|aloc#triggerStateless| arg0@@27 arg1@@13)) RefType)
 :qid |funType:aloc#triggerStateless|
 :pattern ( (|aloc#triggerStateless| arg0@@27 arg1@@13))
))))
(assert (forall ((Heap@@1 T@U) (a_1@@4 T@U) (i Int) ) (!  (=> (and (= (type Heap@@1) (MapType0Type RefType)) (= (type a_1@@4) ArrayDomainTypeType)) (dummyFunction (|aloc#triggerStateless| a_1@@4 i)))
 :qid |stdinbpl.249:15|
 :skolemid |25|
 :pattern ( (|aloc'| Heap@@1 a_1@@4 i))
)))
(assert (forall ((Heap@@2 T@U) (a_1@@5 T@U) (n@@4 Int) ) (!  (=> (and (= (type Heap@@2) (MapType0Type RefType)) (= (type a_1@@5) ArrayDomainTypeType)) (|arr#everUsed| (arr a_1@@5 n@@4)))
 :qid |stdinbpl.415:15|
 :skolemid |41|
 :pattern ( (|arr#trigger| Heap@@2 (arr a_1@@5 n@@4)))
)))
(assert  (and (= (type null) RefType) (forall ((arg0@@28 T@U) ) (! (let ((A (FieldTypeInv0 (type arg0@@28))))
(= (type (PredicateMaskField arg0@@28)) (FieldType A (MapType1Type RefType boolType))))
 :qid |funType:PredicateMaskField|
 :pattern ( (PredicateMaskField arg0@@28))
))))
(assert (forall ((Heap@@3 T@U) (ExhaleHeap T@U) (Mask@@0 T@U) (pm_f T@U) ) (! (let ((C (FieldTypeInv0 (type pm_f))))
 (=> (and (and (and (and (and (= (type Heap@@3) (MapType0Type RefType)) (= (type ExhaleHeap) (MapType0Type RefType))) (= (type Mask@@0) (MapType1Type RefType realType))) (= (type pm_f) (FieldType C FrameTypeType))) (IdenticalOnKnownLocations Heap@@3 ExhaleHeap Mask@@0)) (and (HasDirectPerm Mask@@0 null pm_f) (IsPredicateField pm_f))) (= (MapType0Select Heap@@3 null (PredicateMaskField pm_f)) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))))
 :qid |stdinbpl.47:19|
 :skolemid |2|
 :pattern ( (IdenticalOnKnownLocations Heap@@3 ExhaleHeap Mask@@0) (IsPredicateField pm_f) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))
)))
(assert (forall ((arg0@@29 T@U) ) (! (let ((A@@0 (FieldTypeInv0 (type arg0@@29))))
(= (type (WandMaskField arg0@@29)) (FieldType A@@0 (MapType1Type RefType boolType))))
 :qid |funType:WandMaskField|
 :pattern ( (WandMaskField arg0@@29))
)))
(assert (forall ((Heap@@4 T@U) (ExhaleHeap@@0 T@U) (Mask@@1 T@U) (pm_f@@0 T@U) ) (! (let ((C@@0 (FieldTypeInv0 (type pm_f@@0))))
 (=> (and (and (and (and (and (= (type Heap@@4) (MapType0Type RefType)) (= (type ExhaleHeap@@0) (MapType0Type RefType))) (= (type Mask@@1) (MapType1Type RefType realType))) (= (type pm_f@@0) (FieldType C@@0 FrameTypeType))) (IdenticalOnKnownLocations Heap@@4 ExhaleHeap@@0 Mask@@1)) (and (HasDirectPerm Mask@@1 null pm_f@@0) (IsWandField pm_f@@0))) (= (MapType0Select Heap@@4 null (WandMaskField pm_f@@0)) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))))
 :qid |stdinbpl.60:19|
 :skolemid |5|
 :pattern ( (IdenticalOnKnownLocations Heap@@4 ExhaleHeap@@0 Mask@@1) (IsWandField pm_f@@0) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))
)))
(assert  (and (forall ((arg0@@30 T@U) (arg1@@14 T@U) (arg2@@6 Int) ) (! (= (type (|aloc#frame| arg0@@30 arg1@@14 arg2@@6)) RefType)
 :qid |funType:aloc#frame|
 :pattern ( (|aloc#frame| arg0@@30 arg1@@14 arg2@@6))
)) (= (type EmptyFrame) FrameTypeType)))
(assert (forall ((Heap@@5 T@U) (Mask@@2 T@U) (a_1@@6 T@U) (i@@0 Int) ) (!  (=> (and (and (and (= (type Heap@@5) (MapType0Type RefType)) (= (type Mask@@2) (MapType1Type RefType realType))) (= (type a_1@@6) ArrayDomainTypeType)) (state Heap@@5 Mask@@2)) (= (|aloc'| Heap@@5 a_1@@6 i@@0) (|aloc#frame| EmptyFrame a_1@@6 i@@0)))
 :qid |stdinbpl.262:15|
 :skolemid |27|
 :pattern ( (state Heap@@5 Mask@@2) (|aloc'| Heap@@5 a_1@@6 i@@0))
)))
(assert (forall ((arg0@@31 Int) (arg1@@15 T@U) (arg2@@7 Int) ) (! (= (type (|arrR#sm| arg0@@31 arg1@@15 arg2@@7)) (FieldType PredicateType_arrRType (MapType1Type RefType boolType)))
 :qid |funType:arrR#sm|
 :pattern ( (|arrR#sm| arg0@@31 arg1@@15 arg2@@7))
)))
(assert (forall ((x@@11 Int) (a_1@@7 T@U) (n@@5 Int) ) (!  (=> (= (type a_1@@7) ArrayDomainTypeType) (= (PredicateMaskField (arrR x@@11 a_1@@7 n@@5)) (|arrR#sm| x@@11 a_1@@7 n@@5)))
 :qid |stdinbpl.320:15|
 :skolemid |30|
 :pattern ( (PredicateMaskField (arrR x@@11 a_1@@7 n@@5)))
)))
(assert (forall ((Heap@@6 T@U) (ExhaleHeap@@1 T@U) (Mask@@3 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@6) (MapType0Type RefType)) (= (type ExhaleHeap@@1) (MapType0Type RefType))) (= (type Mask@@3) (MapType1Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@6 ExhaleHeap@@1 Mask@@3)) (U_2_bool (MapType0Select Heap@@6 o_1 $allocated))) (U_2_bool (MapType0Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.73:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@6 ExhaleHeap@@1 Mask@@3) (MapType0Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert (forall ((x@@12 Int) (a_1@@8 T@U) (n@@6 Int) (x2 Int) (a2 T@U) (n2 Int) ) (!  (=> (and (and (= (type a_1@@8) ArrayDomainTypeType) (= (type a2) ArrayDomainTypeType)) (= (arrR x@@12 a_1@@8 n@@6) (arrR x2 a2 n2))) (and (= x@@12 x2) (and (= a_1@@8 a2) (= n@@6 n2))))
 :qid |stdinbpl.334:15|
 :skolemid |33|
 :pattern ( (arrR x@@12 a_1@@8 n@@6) (arrR x2 a2 n2))
)))
(assert (forall ((x@@13 Int) (a_1@@9 T@U) (n@@7 Int) (x2@@0 Int) (a2@@0 T@U) (n2@@0 Int) ) (!  (=> (and (and (= (type a_1@@9) ArrayDomainTypeType) (= (type a2@@0) ArrayDomainTypeType)) (= (|arrR#sm| x@@13 a_1@@9 n@@7) (|arrR#sm| x2@@0 a2@@0 n2@@0))) (and (= x@@13 x2@@0) (and (= a_1@@9 a2@@0) (= n@@7 n2@@0))))
 :qid |stdinbpl.338:15|
 :skolemid |34|
 :pattern ( (|arrR#sm| x@@13 a_1@@9 n@@7) (|arrR#sm| x2@@0 a2@@0 n2@@0))
)))
(assert (forall ((a_1@@10 T@U) ) (!  (=> (= (type a_1@@10) ArrayDomainTypeType) (>= (alen a_1@@10) 0))
 :qid |stdinbpl.225:15|
 :skolemid |23|
 :pattern ( (alen a_1@@10))
)))
(assert (forall ((a_1@@11 T@U) (n@@8 Int) (a2@@1 T@U) (n2@@1 Int) ) (!  (=> (and (and (= (type a_1@@11) ArrayDomainTypeType) (= (type a2@@1) ArrayDomainTypeType)) (= (arr a_1@@11 n@@8) (arr a2@@1 n2@@1))) (and (= a_1@@11 a2@@1) (= n@@8 n2@@1)))
 :qid |stdinbpl.406:15|
 :skolemid |39|
 :pattern ( (arr a_1@@11 n@@8) (arr a2@@1 n2@@1))
)))
(assert (forall ((arg0@@32 T@U) (arg1@@16 Int) ) (! (= (type (|arr#sm| arg0@@32 arg1@@16)) (FieldType PredicateType_arrType (MapType1Type RefType boolType)))
 :qid |funType:arr#sm|
 :pattern ( (|arr#sm| arg0@@32 arg1@@16))
)))
(assert (forall ((a_1@@12 T@U) (n@@9 Int) (a2@@2 T@U) (n2@@2 Int) ) (!  (=> (and (and (= (type a_1@@12) ArrayDomainTypeType) (= (type a2@@2) ArrayDomainTypeType)) (= (|arr#sm| a_1@@12 n@@9) (|arr#sm| a2@@2 n2@@2))) (and (= a_1@@12 a2@@2) (= n@@9 n2@@2)))
 :qid |stdinbpl.410:15|
 :skolemid |40|
 :pattern ( (|arr#sm| a_1@@12 n@@9) (|arr#sm| a2@@2 n2@@2))
)))
(assert (forall ((Heap@@7 T@U) (ExhaleHeap@@2 T@U) (Mask@@4 T@U) (o_1@@0 T@U) (f_2 T@U) ) (! (let ((B@@1 (FieldTypeInv1 (type f_2))))
(let ((A@@1 (FieldTypeInv0 (type f_2))))
 (=> (and (and (and (and (and (and (= (type Heap@@7) (MapType0Type RefType)) (= (type ExhaleHeap@@2) (MapType0Type RefType))) (= (type Mask@@4) (MapType1Type RefType realType))) (= (type o_1@@0) RefType)) (= (type f_2) (FieldType A@@1 B@@1))) (IdenticalOnKnownLocations Heap@@7 ExhaleHeap@@2 Mask@@4)) (HasDirectPerm Mask@@4 o_1@@0 f_2)) (= (MapType0Select Heap@@7 o_1@@0 f_2) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2)))))
 :qid |stdinbpl.42:22|
 :skolemid |1|
 :pattern ( (IdenticalOnKnownLocations Heap@@7 ExhaleHeap@@2 Mask@@4) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2))
)))
(assert  (and (= (type dummyHeap) (MapType0Type RefType)) (= (type ZeroMask) (MapType1Type RefType realType))))
(assert (state dummyHeap ZeroMask))
(assert (forall ((p T@U) (v_1 T@U) (w T@U) ) (! (let ((A@@2 (FieldTypeInv0 (type p))))
 (=> (and (and (= (type p) (FieldType A@@2 FrameTypeType)) (= (type v_1) FrameTypeType)) (= (type w) FrameTypeType)) (not (InsidePredicate p v_1 p w))))
 :qid |stdinbpl.194:19|
 :skolemid |21|
 :pattern ( (InsidePredicate p v_1 p w))
)))
(assert  (not (IsPredicateField vint)))
(assert  (not (IsWandField vint)))
(assert (forall ((Heap@@8 T@U) (ExhaleHeap@@3 T@U) (Mask@@5 T@U) ) (!  (=> (and (and (and (= (type Heap@@8) (MapType0Type RefType)) (= (type ExhaleHeap@@3) (MapType0Type RefType))) (= (type Mask@@5) (MapType1Type RefType realType))) (IdenticalOnKnownLocations Heap@@8 ExhaleHeap@@3 Mask@@5)) (succHeap Heap@@8 ExhaleHeap@@3))
 :qid |stdinbpl.83:15|
 :skolemid |10|
 :pattern ( (IdenticalOnKnownLocations Heap@@8 ExhaleHeap@@3 Mask@@5))
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
(assert (forall ((arg0@@33 Real) (arg1@@17 T@U) ) (! (= (type (ConditionalFrame arg0@@33 arg1@@17)) FrameTypeType)
 :qid |funType:ConditionalFrame|
 :pattern ( (ConditionalFrame arg0@@33 arg1@@17))
)))
(assert (forall ((p@@0 Real) (f_6 T@U) ) (!  (=> (= (type f_6) FrameTypeType) (= (ConditionalFrame p@@0 f_6) (ite (> p@@0 0.0) f_6 EmptyFrame)))
 :qid |stdinbpl.182:15|
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
(assert (forall ((Heap@@9 T@U) (a_1@@13 T@U) (i@@1 Int) ) (!  (=> (and (= (type Heap@@9) (MapType0Type RefType)) (= (type a_1@@13) ArrayDomainTypeType)) (and (= (aloc Heap@@9 a_1@@13 i@@1) (|aloc'| Heap@@9 a_1@@13 i@@1)) (dummyFunction (|aloc#triggerStateless| a_1@@13 i@@1))))
 :qid |stdinbpl.245:15|
 :skolemid |24|
 :pattern ( (aloc Heap@@9 a_1@@13 i@@1))
)))
(assert  (and (forall ((arg0@@34 T@U) (arg1@@18 Int) ) (! (= (type (array_loc arg0@@34 arg1@@18)) RefType)
 :qid |funType:array_loc|
 :pattern ( (array_loc arg0@@34 arg1@@18))
)) (forall ((arg0@@35 T@U) ) (! (= (type (loc_inv_1 arg0@@35)) ArrayDomainTypeType)
 :qid |funType:loc_inv_1|
 :pattern ( (loc_inv_1 arg0@@35))
))))
(assert (forall ((a_1@@14 T@U) (i@@2 Int) ) (!  (=> (= (type a_1@@14) ArrayDomainTypeType) (and (= (loc_inv_1 (array_loc a_1@@14 i@@2)) a_1@@14) (= (loc_inv_2 (array_loc a_1@@14 i@@2)) i@@2)))
 :qid |stdinbpl.219:15|
 :skolemid |22|
 :pattern ( (array_loc a_1@@14 i@@2))
)))
(assert (forall ((o_2@@1 T@U) (f_4@@1 T@U) ) (! (let ((B@@4 (FieldTypeInv1 (type f_4@@1))))
(let ((A@@5 (FieldTypeInv0 (type f_4@@1))))
 (=> (and (= (type o_2@@1) RefType) (= (type f_4@@1) (FieldType A@@5 B@@4))) (= (U_2_real (MapType1Select ZeroMask o_2@@1 f_4@@1)) NoPerm))))
 :qid |stdinbpl.106:22|
 :skolemid |13|
 :pattern ( (MapType1Select ZeroMask o_2@@1 f_4@@1))
)))
(assert (forall ((Heap@@10 T@U) (Mask@@7 T@U) (a_1@@15 T@U) (i@@3 Int) ) (!  (=> (and (and (and (and (= (type Heap@@10) (MapType0Type RefType)) (= (type Mask@@7) (MapType1Type RefType realType))) (= (type a_1@@15) ArrayDomainTypeType)) (and (state Heap@@10 Mask@@7) (< AssumeFunctionsAbove 0))) (and (<= 0 i@@3) (< i@@3 (alen a_1@@15)))) (= (aloc Heap@@10 a_1@@15 i@@3) (array_loc a_1@@15 i@@3)))
 :qid |stdinbpl.255:15|
 :skolemid |26|
 :pattern ( (state Heap@@10 Mask@@7) (aloc Heap@@10 a_1@@15 i@@3))
)))
(assert (forall ((a_1@@16 T@U) (n@@10 Int) ) (!  (=> (= (type a_1@@16) ArrayDomainTypeType) (= (getPredWandId (arr a_1@@16 n@@10)) 1))
 :qid |stdinbpl.400:15|
 :skolemid |38|
 :pattern ( (arr a_1@@16 n@@10))
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
(assert (forall ((o T@U) (f T@U) (Heap@@13 T@U) ) (!  (=> (and (and (and (= (type o) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap@@13) (MapType0Type RefType))) (U_2_bool (MapType0Select Heap@@13 o $allocated))) (U_2_bool (MapType0Select Heap@@13 (MapType0Select Heap@@13 o f) $allocated)))
 :qid |stdinbpl.31:15|
 :skolemid |0|
 :pattern ( (MapType0Select Heap@@13 o f))
)))
(assert (forall ((a_1@@17 T@U) (n@@11 Int) ) (!  (=> (= (type a_1@@17) ArrayDomainTypeType) (= (PredicateMaskField (arr a_1@@17 n@@11)) (|arr#sm| a_1@@17 n@@11)))
 :qid |stdinbpl.392:15|
 :skolemid |36|
 :pattern ( (PredicateMaskField (arr a_1@@17 n@@11)))
)))
(assert (forall ((Heap@@14 T@U) (Mask@@11 T@U) (a_1@@18 T@U) (i@@4 Int) ) (!  (=> (and (and (and (and (= (type Heap@@14) (MapType0Type RefType)) (= (type Mask@@11) (MapType1Type RefType realType))) (= (type a_1@@18) ArrayDomainTypeType)) (and (state Heap@@14 Mask@@11) (or (< AssumeFunctionsAbove 0) (|aloc#trigger| EmptyFrame a_1@@18 i@@4)))) (and (<= 0 i@@4) (< i@@4 (alen a_1@@18)))) (= (loc_inv_1 (|aloc'| Heap@@14 a_1@@18 i@@4)) a_1@@18))
 :qid |stdinbpl.268:15|
 :skolemid |28|
 :pattern ( (state Heap@@14 Mask@@11) (|aloc'| Heap@@14 a_1@@18 i@@4))
)))
(assert (forall ((Heap@@15 T@U) (Mask@@12 T@U) (a_1@@19 T@U) (i@@5 Int) ) (!  (=> (and (and (and (and (= (type Heap@@15) (MapType0Type RefType)) (= (type Mask@@12) (MapType1Type RefType realType))) (= (type a_1@@19) ArrayDomainTypeType)) (and (state Heap@@15 Mask@@12) (or (< AssumeFunctionsAbove 0) (|aloc#trigger| EmptyFrame a_1@@19 i@@5)))) (and (<= 0 i@@5) (< i@@5 (alen a_1@@19)))) (= (loc_inv_2 (|aloc'| Heap@@15 a_1@@19 i@@5)) i@@5))
 :qid |stdinbpl.272:15|
 :skolemid |29|
 :pattern ( (state Heap@@15 Mask@@12) (|aloc'| Heap@@15 a_1@@19 i@@5))
)))
(assert (forall ((Heap@@16 T@U) (o@@0 T@U) (f_3 T@U) (v T@U) ) (! (let ((B@@8 (type v)))
(let ((A@@9 (FieldTypeInv0 (type f_3))))
 (=> (and (and (= (type Heap@@16) (MapType0Type RefType)) (= (type o@@0) RefType)) (= (type f_3) (FieldType A@@9 B@@8))) (succHeap Heap@@16 (MapType0Store Heap@@16 o@@0 f_3 v)))))
 :qid |stdinbpl.78:22|
 :skolemid |9|
 :pattern ( (MapType0Store Heap@@16 o@@0 f_3 v))
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
 :qid |stdinbpl.189:25|
 :skolemid |20|
 :pattern ( (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun UnfoldingMask@1 () T@U)
(declare-fun Heap@@17 () T@U)
(declare-fun x0@@7 () T@U)
(declare-fun Heap@0 () T@U)
(declare-fun Mask@0 () T@U)
(declare-fun UnfoldingMask@0 () T@U)
(declare-fun FrameFragment (T@U) T@U)
(declare-fun j_2 () Int)
(declare-fun UnfoldingMask@3 () T@U)
(declare-fun Heap@2 () T@U)
(declare-fun UnfoldingMask@2 () T@U)
(declare-fun x1@@7 () T@U)
(declare-fun j () Int)
(declare-fun QPMask@1 () T@U)
(declare-fun newPMask@0 () T@U)
(declare-fun Heap@3 () T@U)
(declare-fun newPMask@1 () T@U)
(declare-fun Heap@4 () T@U)
(declare-fun UnfoldingMask@4 () T@U)
(declare-fun perm@0 () Real)
(declare-fun qpRange3 (T@U) Bool)
(declare-fun invRecv3 (T@U) Int)
(declare-fun neverTriggered2 (Int) Bool)
(declare-fun invRecv2 (Int T@U Int) Int)
(declare-fun qpRange2 (Int T@U Int) Bool)
(declare-fun QPMask@0 () T@U)
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (= (type x1@@7) ArrayDomainTypeType) (= (type QPMask@1) (MapType1Type RefType realType))) (= (type Heap@@17) (MapType0Type RefType))) (= (type newPMask@0) (MapType1Type RefType boolType))) (= (type Heap@3) (MapType0Type RefType))) (= (type Mask@0) (MapType1Type RefType realType))) (= (type newPMask@1) (MapType1Type RefType boolType))) (= (type Heap@4) (MapType0Type RefType))) (= (type UnfoldingMask@4) (MapType1Type RefType realType))) (forall ((arg0@@36 T@U) ) (! (= (type (FrameFragment arg0@@36)) FrameTypeType)
 :qid |funType:FrameFragment|
 :pattern ( (FrameFragment arg0@@36))
))) (= (type x0@@7) ArrayDomainTypeType)) (= (type UnfoldingMask@3) (MapType1Type RefType realType))) (= (type Heap@2) (MapType0Type RefType))) (= (type UnfoldingMask@2) (MapType1Type RefType realType))) (= (type UnfoldingMask@1) (MapType1Type RefType realType))) (= (type Heap@0) (MapType0Type RefType))) (= (type UnfoldingMask@0) (MapType1Type RefType realType))) (= (type QPMask@0) (MapType1Type RefType realType))))
(set-info :boogie-vc-id test)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 43) (let ((anon33_Else_correct  (and (=> (= (ControlFlow 0 32) (- 0 33)) (HasDirectPerm UnfoldingMask@1 (aloc Heap@@17 x0@@7 0) vint)) (=> (HasDirectPerm UnfoldingMask@1 (aloc Heap@@17 x0@@7 0) vint) (=> (= Heap@0 (MapType0Store Heap@@17 null (|arrR#sm| 0 x0@@7 10) (MapType1Store (MapType0Select Heap@@17 null (|arrR#sm| 0 x0@@7 10)) (aloc Heap@@17 x0@@7 0) vint (bool_2_U true)))) (=> (and (state Heap@0 Mask@0) (= (ControlFlow 0 32) (- 0 31))) (= (U_2_int (MapType0Select Heap@0 (aloc Heap@0 x0@@7 0) vint)) 0)))))))
(let ((anon33_Then_correct  (=> (= (ControlFlow 0 30) (- 0 29)) (< 0 (alen x0@@7)))))
(let ((anon20_correct  (=> (= UnfoldingMask@0 (MapType1Store Mask@0 null (arrR 0 x0@@7 10) (real_2_U (- (U_2_real (MapType1Select Mask@0 null (arrR 0 x0@@7 10))) FullPerm)))) (=> (and (= (alen x0@@7) 10) (state Heap@@17 UnfoldingMask@0)) (=> (and (and (not (= (aloc Heap@@17 x0@@7 0) null)) (= UnfoldingMask@1 (MapType1Store UnfoldingMask@0 (aloc Heap@@17 x0@@7 0) vint (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@0 (aloc Heap@@17 x0@@7 0) vint)) FullPerm))))) (and (state Heap@@17 UnfoldingMask@1) (state Heap@@17 UnfoldingMask@1))) (and (=> (= (ControlFlow 0 34) 30) anon33_Then_correct) (=> (= (ControlFlow 0 34) 32) anon33_Else_correct)))))))
(let ((anon32_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 37) 34)) anon20_correct)))
(let ((anon32_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 35) (- 0 36)) (<= FullPerm (U_2_real (MapType1Select Mask@0 null (arrR 0 x0@@7 10))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@0 null (arrR 0 x0@@7 10)))) (=> (= (ControlFlow 0 35) 34) anon20_correct))))))
(let ((anon28_Else_correct  (=> (and (and (forall ((j_6 Int) ) (!  (=> (and (<= 0 j_6) (< j_6 10)) (= (U_2_int (MapType0Select Heap@@17 (aloc Heap@@17 x0@@7 j_6) vint)) (* 3 j_6)))
 :qid |stdinbpl.732:20|
 :skolemid |67|
 :pattern ( (|aloc#frame| EmptyFrame x0@@7 j_6))
)) (state Heap@@17 Mask@0)) (and (|arrR#trigger| Heap@@17 (arrR 0 x0@@7 10)) (= (MapType0Select Heap@@17 null (arrR 0 x0@@7 10)) (FrameFragment (MapType0Select Heap@@17 (aloc Heap@@17 x0@@7 0) vint))))) (and (=> (= (ControlFlow 0 38) 35) anon32_Then_correct) (=> (= (ControlFlow 0 38) 37) anon32_Else_correct)))))
(let ((anon31_Then_correct  (and (=> (= (ControlFlow 0 20) (- 0 21)) (<= 0 j_2)) (=> (<= 0 j_2) (=> (= (ControlFlow 0 20) (- 0 19)) (< j_2 (alen x0@@7)))))))
(let ((anon17_correct true))
(let ((anon31_Else_correct  (and (=> (= (ControlFlow 0 22) (- 0 23)) (HasDirectPerm UnfoldingMask@3 (aloc Heap@@17 x0@@7 j_2) vint)) (=> (HasDirectPerm UnfoldingMask@3 (aloc Heap@@17 x0@@7 j_2) vint) (=> (= Heap@2 (MapType0Store Heap@@17 null (|arrR#sm| j_2 x0@@7 10) (MapType1Store (MapType0Select Heap@@17 null (|arrR#sm| j_2 x0@@7 10)) (aloc Heap@@17 x0@@7 j_2) vint (bool_2_U true)))) (=> (and (state Heap@2 Mask@0) (= (ControlFlow 0 22) 17)) anon17_correct))))))
(let ((anon14_correct  (=> (= UnfoldingMask@2 (MapType1Store Mask@0 null (arrR j_2 x0@@7 10) (real_2_U (- (U_2_real (MapType1Select Mask@0 null (arrR j_2 x0@@7 10))) FullPerm)))) (=> (and (and (and (= (alen x0@@7) 10) (<= 0 j_2)) (and (< j_2 10) (state Heap@@17 UnfoldingMask@2))) (and (and (not (= (aloc Heap@@17 x0@@7 j_2) null)) (= UnfoldingMask@3 (MapType1Store UnfoldingMask@2 (aloc Heap@@17 x0@@7 j_2) vint (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@2 (aloc Heap@@17 x0@@7 j_2) vint)) FullPerm))))) (and (state Heap@@17 UnfoldingMask@3) (state Heap@@17 UnfoldingMask@3)))) (and (=> (= (ControlFlow 0 24) 20) anon31_Then_correct) (=> (= (ControlFlow 0 24) 22) anon31_Else_correct))))))
(let ((anon30_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 27) 24)) anon14_correct)))
(let ((anon30_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 25) (- 0 26)) (<= FullPerm (U_2_real (MapType1Select Mask@0 null (arrR j_2 x0@@7 10))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@0 null (arrR j_2 x0@@7 10)))) (=> (= (ControlFlow 0 25) 24) anon14_correct))))))
(let ((anon29_Then_correct  (=> (and (and (<= 0 j_2) (< j_2 10)) (and (|arrR#trigger| Heap@@17 (arrR j_2 x0@@7 10)) (= (MapType0Select Heap@@17 null (arrR j_2 x0@@7 10)) (FrameFragment (MapType0Select Heap@@17 (aloc Heap@@17 x0@@7 j_2) vint))))) (and (=> (= (ControlFlow 0 28) 25) anon30_Then_correct) (=> (= (ControlFlow 0 28) 27) anon30_Else_correct)))))
(let ((anon29_Else_correct  (=> (and (not (and (<= 0 j_2) (< j_2 10))) (= (ControlFlow 0 18) 17)) anon17_correct)))
(let ((anon24_Else_correct  (=> (forall ((j_4 Int) ) (!  (=> (and (<= 0 j_4) (< j_4 10)) (= (U_2_int (MapType0Select Heap@@17 (aloc Heap@@17 x1@@7 j_4) vint)) j_4))
 :qid |stdinbpl.681:20|
 :skolemid |66|
 :pattern ( (|aloc#frame| EmptyFrame x1@@7 j_4))
)) (=> (and (state Heap@@17 Mask@0) (state Heap@@17 Mask@0)) (and (and (=> (= (ControlFlow 0 39) 38) anon28_Else_correct) (=> (= (ControlFlow 0 39) 28) anon29_Then_correct)) (=> (= (ControlFlow 0 39) 18) anon29_Else_correct))))))
(let ((anon27_Then_correct  (and (=> (= (ControlFlow 0 5) (- 0 6)) (<= 0 j)) (=> (<= 0 j) (=> (= (ControlFlow 0 5) (- 0 4)) (< j (alen x1@@7)))))))
(let ((anon9_correct true))
(let ((anon27_Else_correct  (and (=> (= (ControlFlow 0 7) (- 0 8)) (HasDirectPerm QPMask@1 (aloc Heap@@17 x1@@7 j) vint)) (=> (HasDirectPerm QPMask@1 (aloc Heap@@17 x1@@7 j) vint) (=> (forall ((o_4 T@U) (f_7 T@U) ) (! (let ((B@@11 (FieldTypeInv1 (type f_7))))
(let ((A@@12 (FieldTypeInv0 (type f_7))))
 (=> (and (and (= (type o_4) RefType) (= (type f_7) (FieldType A@@12 B@@11))) (U_2_bool (MapType1Select (MapType0Select Heap@@17 null (|arr#sm| x1@@7 10)) o_4 f_7))) (U_2_bool (MapType1Select newPMask@0 o_4 f_7)))))
 :qid |stdinbpl.654:35|
 :skolemid |62|
 :pattern ( (MapType1Select newPMask@0 o_4 f_7))
)) (=> (and (and (and (forall ((i_1_1 Int) ) (!  (=> (and (<= 0 i_1_1) (< i_1_1 (alen x1@@7))) (U_2_bool (MapType1Select newPMask@0 (aloc Heap@@17 x1@@7 i_1_1) vint)))
 :qid |stdinbpl.658:28|
 :skolemid |63|
)) (= Heap@3 (MapType0Store Heap@@17 null (|arr#sm| x1@@7 10) newPMask@0))) (and (state Heap@3 Mask@0) (forall ((o_5 T@U) (f_8 T@U) ) (! (let ((B@@12 (FieldTypeInv1 (type f_8))))
(let ((A@@13 (FieldTypeInv0 (type f_8))))
 (=> (and (and (= (type o_5) RefType) (= (type f_8) (FieldType A@@13 B@@12))) (U_2_bool (MapType1Select (MapType0Select Heap@3 null (|arr#sm| x1@@7 10)) o_5 f_8))) (U_2_bool (MapType1Select newPMask@1 o_5 f_8)))))
 :qid |stdinbpl.668:35|
 :skolemid |64|
 :pattern ( (MapType1Select newPMask@1 o_5 f_8))
)))) (and (and (forall ((i_2 Int) ) (!  (=> (and (<= 0 i_2) (< i_2 (alen x1@@7))) (U_2_bool (MapType1Select newPMask@1 (aloc Heap@3 x1@@7 i_2) vint)))
 :qid |stdinbpl.672:28|
 :skolemid |65|
)) (= Heap@4 (MapType0Store Heap@3 null (|arr#sm| x1@@7 10) newPMask@1))) (and (state Heap@4 Mask@0) (= (ControlFlow 0 7) 2)))) anon9_correct))))))
(let ((anon6_correct  (=> (= UnfoldingMask@4 (MapType1Store Mask@0 null (arr x1@@7 10) (real_2_U (- (U_2_real (MapType1Select Mask@0 null (arr x1@@7 10))) perm@0)))) (=> (and (= (alen x1@@7) 10) (state Heap@@17 UnfoldingMask@4)) (and (=> (= (ControlFlow 0 9) (- 0 11)) (forall ((i@@6 Int) (i_4 Int) ) (!  (=> (and (and (and (and (not (= i@@6 i_4)) (and (<= 0 i@@6) (< i@@6 (alen x1@@7)))) (and (<= 0 i_4) (< i_4 (alen x1@@7)))) (< NoPerm (* FullPerm (/ FullPerm (to_real 2))))) (< NoPerm (* FullPerm (/ FullPerm (to_real 2))))) (not (= (aloc Heap@@17 x1@@7 i@@6) (aloc Heap@@17 x1@@7 i_4))))
 :qid |stdinbpl.598:21|
 :skolemid |55|
))) (=> (forall ((i@@7 Int) (i_4@@0 Int) ) (!  (=> (and (and (and (and (not (= i@@7 i_4@@0)) (and (<= 0 i@@7) (< i@@7 (alen x1@@7)))) (and (<= 0 i_4@@0) (< i_4@@0 (alen x1@@7)))) (< NoPerm (* FullPerm (/ FullPerm (to_real 2))))) (< NoPerm (* FullPerm (/ FullPerm (to_real 2))))) (not (= (aloc Heap@@17 x1@@7 i@@7) (aloc Heap@@17 x1@@7 i_4@@0))))
 :qid |stdinbpl.598:21|
 :skolemid |55|
)) (=> (and (forall ((i@@8 Int) ) (!  (=> (and (and (<= 0 i@@8) (< i@@8 (alen x1@@7))) (< NoPerm (* FullPerm (/ FullPerm (to_real 2))))) (and (qpRange3 (aloc Heap@@17 x1@@7 i@@8)) (= (invRecv3 (aloc Heap@@17 x1@@7 i@@8)) i@@8)))
 :qid |stdinbpl.604:28|
 :skolemid |56|
 :pattern ( (|aloc#frame| EmptyFrame x1@@7 i@@8))
 :pattern ( (|aloc#frame| EmptyFrame x1@@7 i@@8))
)) (forall ((o_3 T@U) ) (!  (=> (= (type o_3) RefType) (=> (and (and (and (<= 0 (invRecv3 o_3)) (< (invRecv3 o_3) (alen x1@@7))) (< NoPerm (* FullPerm (/ FullPerm (to_real 2))))) (qpRange3 o_3)) (= (aloc Heap@@17 x1@@7 (invRecv3 o_3)) o_3)))
 :qid |stdinbpl.608:28|
 :skolemid |57|
 :pattern ( (invRecv3 o_3))
))) (and (=> (= (ControlFlow 0 9) (- 0 10)) (forall ((i@@9 Int) ) (!  (=> (and (<= 0 i@@9) (< i@@9 (alen x1@@7))) (>= (* FullPerm (/ FullPerm (to_real 2))) NoPerm))
 :qid |stdinbpl.614:21|
 :skolemid |58|
 :pattern ( (|aloc#frame| EmptyFrame x1@@7 i@@9))
 :pattern ( (|aloc#frame| EmptyFrame x1@@7 i@@9))
))) (=> (forall ((i@@10 Int) ) (!  (=> (and (<= 0 i@@10) (< i@@10 (alen x1@@7))) (>= (* FullPerm (/ FullPerm (to_real 2))) NoPerm))
 :qid |stdinbpl.614:21|
 :skolemid |58|
 :pattern ( (|aloc#frame| EmptyFrame x1@@7 i@@10))
 :pattern ( (|aloc#frame| EmptyFrame x1@@7 i@@10))
)) (=> (forall ((i@@11 Int) ) (!  (=> (and (and (<= 0 i@@11) (< i@@11 (alen x1@@7))) (> (* FullPerm (/ FullPerm (to_real 2))) NoPerm)) (not (= (aloc Heap@@17 x1@@7 i@@11) null)))
 :qid |stdinbpl.620:28|
 :skolemid |59|
 :pattern ( (|aloc#frame| EmptyFrame x1@@7 i@@11))
 :pattern ( (|aloc#frame| EmptyFrame x1@@7 i@@11))
)) (=> (and (and (forall ((o_3@@0 T@U) ) (!  (=> (= (type o_3@@0) RefType) (and (=> (and (and (and (<= 0 (invRecv3 o_3@@0)) (< (invRecv3 o_3@@0) (alen x1@@7))) (< NoPerm (* FullPerm (/ FullPerm (to_real 2))))) (qpRange3 o_3@@0)) (and (=> (< NoPerm (* FullPerm (/ FullPerm (to_real 2)))) (= (aloc Heap@@17 x1@@7 (invRecv3 o_3@@0)) o_3@@0)) (= (U_2_real (MapType1Select QPMask@1 o_3@@0 vint)) (+ (U_2_real (MapType1Select UnfoldingMask@4 o_3@@0 vint)) (* FullPerm (/ FullPerm (to_real 2))))))) (=> (not (and (and (and (<= 0 (invRecv3 o_3@@0)) (< (invRecv3 o_3@@0) (alen x1@@7))) (< NoPerm (* FullPerm (/ FullPerm (to_real 2))))) (qpRange3 o_3@@0))) (= (U_2_real (MapType1Select QPMask@1 o_3@@0 vint)) (U_2_real (MapType1Select UnfoldingMask@4 o_3@@0 vint))))))
 :qid |stdinbpl.626:28|
 :skolemid |60|
 :pattern ( (MapType1Select QPMask@1 o_3@@0 vint))
)) (forall ((o_3@@1 T@U) (f_5 T@U) ) (! (let ((B@@13 (FieldTypeInv1 (type f_5))))
(let ((A@@14 (FieldTypeInv0 (type f_5))))
 (=> (and (and (= (type o_3@@1) RefType) (= (type f_5) (FieldType A@@14 B@@13))) (not (= f_5 vint))) (= (U_2_real (MapType1Select UnfoldingMask@4 o_3@@1 f_5)) (U_2_real (MapType1Select QPMask@1 o_3@@1 f_5))))))
 :qid |stdinbpl.630:35|
 :skolemid |61|
 :pattern ( (MapType1Select UnfoldingMask@4 o_3@@1 f_5))
 :pattern ( (MapType1Select QPMask@1 o_3@@1 f_5))
))) (and (state Heap@@17 QPMask@1) (state Heap@@17 QPMask@1))) (and (=> (= (ControlFlow 0 9) 5) anon27_Then_correct) (=> (= (ControlFlow 0 9) 7) anon27_Else_correct)))))))))))))
(let ((anon26_Else_correct  (=> (and (= perm@0 NoPerm) (= (ControlFlow 0 14) 9)) anon6_correct)))
(let ((anon26_Then_correct  (=> (not (= perm@0 NoPerm)) (and (=> (= (ControlFlow 0 12) (- 0 13)) (<= perm@0 (U_2_real (MapType1Select Mask@0 null (arr x1@@7 10))))) (=> (<= perm@0 (U_2_real (MapType1Select Mask@0 null (arr x1@@7 10)))) (=> (= (ControlFlow 0 12) 9) anon6_correct))))))
(let ((anon25_Then_correct  (=> (and (and (and (<= 0 j) (< j 10)) (|arr#trigger| Heap@@17 (arr x1@@7 10))) (and (= (MapType0Select Heap@@17 null (arr x1@@7 10)) (FrameFragment (int_2_U (|arr#condqp1| Heap@@17 x1@@7 10)))) (= perm@0 (/ FullPerm (to_real 2))))) (and (=> (= (ControlFlow 0 15) (- 0 16)) (>= perm@0 NoPerm)) (=> (>= perm@0 NoPerm) (and (=> (= (ControlFlow 0 15) 12) anon26_Then_correct) (=> (= (ControlFlow 0 15) 14) anon26_Else_correct)))))))
(let ((anon25_Else_correct  (=> (and (not (and (<= 0 j) (< j 10))) (= (ControlFlow 0 3) 2)) anon9_correct)))
(let ((anon23_Else_correct  (and (=> (= (ControlFlow 0 40) (- 0 41)) (forall ((j_1 Int) (j_1_1 Int) ) (!  (=> (and (and (and (and (not (= j_1 j_1_1)) (and (<= 0 j_1) (< j_1 10))) (and (<= 0 j_1_1) (< j_1_1 10))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (or (not (= j_1 j_1_1)) (not (= x0@@7 x0@@7))))
 :qid |stdinbpl.538:17|
 :skolemid |49|
 :pattern ( (neverTriggered2 j_1) (neverTriggered2 j_1_1))
))) (=> (forall ((j_1@@0 Int) (j_1_1@@0 Int) ) (!  (=> (and (and (and (and (not (= j_1@@0 j_1_1@@0)) (and (<= 0 j_1@@0) (< j_1@@0 10))) (and (<= 0 j_1_1@@0) (< j_1_1@@0 10))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (or (not (= j_1@@0 j_1_1@@0)) (not (= x0@@7 x0@@7))))
 :qid |stdinbpl.538:17|
 :skolemid |49|
 :pattern ( (neverTriggered2 j_1@@0) (neverTriggered2 j_1_1@@0))
)) (=> (forall ((j_1@@1 Int) ) (!  (=> (and (and (<= 0 j_1@@1) (< j_1@@1 10)) (< NoPerm FullPerm)) (and (= (invRecv2 j_1@@1 x0@@7 10) j_1@@1) (qpRange2 j_1@@1 x0@@7 10)))
 :qid |stdinbpl.544:22|
 :skolemid |50|
 :pattern ( (MapType0Select Heap@@17 null (arrR j_1@@1 x0@@7 10)))
 :pattern ( (MapType1Select ZeroMask null (arrR j_1@@1 x0@@7 10)))
 :pattern ( (MapType0Select Heap@@17 null (arrR j_1@@1 x0@@7 10)))
)) (=> (and (forall ((x@@14 Int) (a_1@@20 T@U) (n@@12 Int) ) (!  (=> (= (type a_1@@20) ArrayDomainTypeType) (=> (and (and (and (<= 0 (invRecv2 x@@14 a_1@@20 n@@12)) (< (invRecv2 x@@14 a_1@@20 n@@12) 10)) (< NoPerm FullPerm)) (qpRange2 x@@14 a_1@@20 n@@12)) (and (and (= (invRecv2 x@@14 a_1@@20 n@@12) x@@14) (= x0@@7 a_1@@20)) (= 10 n@@12))))
 :qid |stdinbpl.548:22|
 :skolemid |51|
 :pattern ( (invRecv2 x@@14 a_1@@20 n@@12))
)) (forall ((x@@15 Int) (a_1@@21 T@U) (n@@13 Int) ) (!  (=> (= (type a_1@@21) ArrayDomainTypeType) (=> (and (and (and (<= 0 (invRecv2 x@@15 a_1@@21 n@@13)) (< (invRecv2 x@@15 a_1@@21 n@@13) 10)) (< NoPerm FullPerm)) (qpRange2 x@@15 a_1@@21 n@@13)) (and (=> (< NoPerm FullPerm) (and (and (= (invRecv2 x@@15 a_1@@21 n@@13) x@@15) (= x0@@7 a_1@@21)) (= 10 n@@13))) (= (U_2_real (MapType1Select QPMask@0 null (arrR x@@15 a_1@@21 n@@13))) (+ (U_2_real (MapType1Select ZeroMask null (arrR x@@15 a_1@@21 n@@13))) FullPerm)))))
 :qid |stdinbpl.554:22|
 :skolemid |52|
 :pattern ( (MapType1Select QPMask@0 null (arrR x@@15 a_1@@21 n@@13)))
))) (=> (and (and (and (forall ((o_3@@2 T@U) (f_5@@0 T@U) ) (! (let ((B@@14 (FieldTypeInv1 (type f_5@@0))))
(let ((A@@15 (FieldTypeInv0 (type f_5@@0))))
 (=> (and (and (= (type o_3@@2) RefType) (= (type f_5@@0) (FieldType A@@15 B@@14))) (or (or (not (= o_3@@2 null)) (not (IsPredicateField f_5@@0))) (not (= (getPredWandId f_5@@0) 0)))) (= (U_2_real (MapType1Select ZeroMask o_3@@2 f_5@@0)) (U_2_real (MapType1Select QPMask@0 o_3@@2 f_5@@0))))))
 :qid |stdinbpl.560:29|
 :skolemid |53|
 :pattern ( (MapType1Select ZeroMask o_3@@2 f_5@@0))
 :pattern ( (MapType1Select QPMask@0 o_3@@2 f_5@@0))
)) (forall ((x@@16 Int) (a_1@@22 T@U) (n@@14 Int) ) (!  (=> (and (= (type a_1@@22) ArrayDomainTypeType) (not (and (and (and (<= 0 (invRecv2 x@@16 a_1@@22 n@@14)) (< (invRecv2 x@@16 a_1@@22 n@@14) 10)) (< NoPerm FullPerm)) (qpRange2 x@@16 a_1@@22 n@@14)))) (= (U_2_real (MapType1Select QPMask@0 null (arrR x@@16 a_1@@22 n@@14))) (U_2_real (MapType1Select ZeroMask null (arrR x@@16 a_1@@22 n@@14)))))
 :qid |stdinbpl.564:22|
 :skolemid |54|
 :pattern ( (MapType1Select QPMask@0 null (arrR x@@16 a_1@@22 n@@14)))
))) (and (state Heap@@17 QPMask@0) (state Heap@@17 QPMask@0))) (and (and (= Mask@0 (MapType1Store QPMask@0 null (arr x1@@7 10) (real_2_U (+ (U_2_real (MapType1Select QPMask@0 null (arr x1@@7 10))) FullPerm)))) (state Heap@@17 Mask@0)) (and (state Heap@@17 Mask@0) (state Heap@@17 Mask@0)))) (and (and (=> (= (ControlFlow 0 40) 39) anon24_Else_correct) (=> (= (ControlFlow 0 40) 15) anon25_Then_correct)) (=> (= (ControlFlow 0 40) 3) anon25_Else_correct)))))))))
(let ((anon23_Then_correct true))
(let ((anon0_correct  (=> (and (state Heap@@17 ZeroMask) (= AssumeFunctionsAbove (- 0 1))) (and (=> (= (ControlFlow 0 42) 1) anon23_Then_correct) (=> (= (ControlFlow 0 42) 40) anon23_Else_correct)))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 43) 42) anon0_correct)))
PreconditionGeneratedEntry_correct))))))))))))))))))))))))))))
))
(check-sat)
(pop 1)
; Valid
(get-info :rlimit)
