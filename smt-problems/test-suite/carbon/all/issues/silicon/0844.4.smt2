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
(declare-fun hide0 (T@U Int Int) T@U)
(declare-fun ArrayDomainTypeType () T@T)
(declare-fun IsPredicateField (T@U) Bool)
(declare-fun PredicateType_hide0Type () T@T)
(declare-fun FrameTypeType () T@T)
(declare-fun hide1 (T@U Int Int) T@U)
(declare-fun PredicateType_hide1Type () T@T)
(declare-fun |hide0#trigger| (T@U T@U) Bool)
(declare-fun |hide0#everUsed| (T@U) Bool)
(declare-fun |hide1#trigger| (T@U T@U) Bool)
(declare-fun |hide1#everUsed| (T@U) Bool)
(declare-fun getPredWandId (T@U) Int)
(declare-fun |aloc'| (T@U T@U Int) T@U)
(declare-fun dummyFunction (T@U) Bool)
(declare-fun |aloc#triggerStateless| (T@U Int) T@U)
(declare-fun IdenticalOnKnownLocations (T@U T@U T@U) Bool)
(declare-fun null () T@U)
(declare-fun PredicateMaskField (T@U) T@U)
(declare-fun HasDirectPerm (T@U T@U T@U) Bool)
(declare-fun IsWandField (T@U) Bool)
(declare-fun WandMaskField (T@U) T@U)
(declare-fun |aloc#frame| (T@U T@U Int) T@U)
(declare-fun EmptyFrame () T@U)
(declare-fun |hide0#sm| (T@U Int Int) T@U)
(declare-fun |hide1#sm| (T@U Int Int) T@U)
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
(assert  (and (and (and (= (Ctor ArrayDomainTypeType) 11) (= (Ctor PredicateType_hide0Type) 12)) (= (Ctor FrameTypeType) 13)) (forall ((arg0@@23 T@U) (arg1@@9 Int) (arg2@@3 Int) ) (! (= (type (hide0 arg0@@23 arg1@@9 arg2@@3)) (FieldType PredicateType_hide0Type FrameTypeType))
 :qid |funType:hide0|
 :pattern ( (hide0 arg0@@23 arg1@@9 arg2@@3))
))))
(assert (forall ((x@@8 T@U) (n Int) (i_1 Int) ) (!  (=> (= (type x@@8) ArrayDomainTypeType) (IsPredicateField (hide0 x@@8 n i_1)))
 :qid |stdinbpl.321:15|
 :skolemid |31|
 :pattern ( (hide0 x@@8 n i_1))
)))
(assert  (and (= (Ctor PredicateType_hide1Type) 14) (forall ((arg0@@24 T@U) (arg1@@10 Int) (arg2@@4 Int) ) (! (= (type (hide1 arg0@@24 arg1@@10 arg2@@4)) (FieldType PredicateType_hide1Type FrameTypeType))
 :qid |funType:hide1|
 :pattern ( (hide1 arg0@@24 arg1@@10 arg2@@4))
))))
(assert (forall ((x@@9 T@U) (n@@0 Int) (i_1@@0 Int) ) (!  (=> (= (type x@@9) ArrayDomainTypeType) (IsPredicateField (hide1 x@@9 n@@0 i_1@@0)))
 :qid |stdinbpl.394:15|
 :skolemid |37|
 :pattern ( (hide1 x@@9 n@@0 i_1@@0))
)))
(assert (forall ((Heap@@0 T@U) (x@@10 T@U) (n@@1 Int) (i_1@@1 Int) ) (!  (=> (and (= (type Heap@@0) (MapType0Type RefType)) (= (type x@@10) ArrayDomainTypeType)) (|hide0#everUsed| (hide0 x@@10 n@@1 i_1@@1)))
 :qid |stdinbpl.340:15|
 :skolemid |35|
 :pattern ( (|hide0#trigger| Heap@@0 (hide0 x@@10 n@@1 i_1@@1)))
)))
(assert (forall ((Heap@@1 T@U) (x@@11 T@U) (n@@2 Int) (i_1@@2 Int) ) (!  (=> (and (= (type Heap@@1) (MapType0Type RefType)) (= (type x@@11) ArrayDomainTypeType)) (|hide1#everUsed| (hide1 x@@11 n@@2 i_1@@2)))
 :qid |stdinbpl.413:15|
 :skolemid |41|
 :pattern ( (|hide1#trigger| Heap@@1 (hide1 x@@11 n@@2 i_1@@2)))
)))
(assert (forall ((x@@12 T@U) (n@@3 Int) (i_1@@3 Int) ) (!  (=> (= (type x@@12) ArrayDomainTypeType) (= (getPredWandId (hide0 x@@12 n@@3 i_1@@3)) 0))
 :qid |stdinbpl.325:15|
 :skolemid |32|
 :pattern ( (hide0 x@@12 n@@3 i_1@@3))
)))
(assert (forall ((x@@13 T@U) (n@@4 Int) (i_1@@4 Int) ) (!  (=> (= (type x@@13) ArrayDomainTypeType) (= (getPredWandId (hide1 x@@13 n@@4 i_1@@4)) 1))
 :qid |stdinbpl.398:15|
 :skolemid |38|
 :pattern ( (hide1 x@@13 n@@4 i_1@@4))
)))
(assert  (and (forall ((arg0@@25 T@U) (arg1@@11 T@U) (arg2@@5 Int) ) (! (= (type (|aloc'| arg0@@25 arg1@@11 arg2@@5)) RefType)
 :qid |funType:aloc'|
 :pattern ( (|aloc'| arg0@@25 arg1@@11 arg2@@5))
)) (forall ((arg0@@26 T@U) (arg1@@12 Int) ) (! (= (type (|aloc#triggerStateless| arg0@@26 arg1@@12)) RefType)
 :qid |funType:aloc#triggerStateless|
 :pattern ( (|aloc#triggerStateless| arg0@@26 arg1@@12))
))))
(assert (forall ((Heap@@2 T@U) (a_3 T@U) (i_1@@5 Int) ) (!  (=> (and (= (type Heap@@2) (MapType0Type RefType)) (= (type a_3) ArrayDomainTypeType)) (dummyFunction (|aloc#triggerStateless| a_3 i_1@@5)))
 :qid |stdinbpl.246:15|
 :skolemid |25|
 :pattern ( (|aloc'| Heap@@2 a_3 i_1@@5))
)))
(assert  (and (= (type null) RefType) (forall ((arg0@@27 T@U) ) (! (let ((A (FieldTypeInv0 (type arg0@@27))))
(= (type (PredicateMaskField arg0@@27)) (FieldType A (MapType1Type RefType boolType))))
 :qid |funType:PredicateMaskField|
 :pattern ( (PredicateMaskField arg0@@27))
))))
(assert (forall ((Heap@@3 T@U) (ExhaleHeap T@U) (Mask@@0 T@U) (pm_f T@U) ) (! (let ((C (FieldTypeInv0 (type pm_f))))
 (=> (and (and (and (and (and (= (type Heap@@3) (MapType0Type RefType)) (= (type ExhaleHeap) (MapType0Type RefType))) (= (type Mask@@0) (MapType1Type RefType realType))) (= (type pm_f) (FieldType C FrameTypeType))) (IdenticalOnKnownLocations Heap@@3 ExhaleHeap Mask@@0)) (and (HasDirectPerm Mask@@0 null pm_f) (IsPredicateField pm_f))) (= (MapType0Select Heap@@3 null (PredicateMaskField pm_f)) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))))
 :qid |stdinbpl.47:19|
 :skolemid |2|
 :pattern ( (IdenticalOnKnownLocations Heap@@3 ExhaleHeap Mask@@0) (IsPredicateField pm_f) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))
)))
(assert (forall ((arg0@@28 T@U) ) (! (let ((A@@0 (FieldTypeInv0 (type arg0@@28))))
(= (type (WandMaskField arg0@@28)) (FieldType A@@0 (MapType1Type RefType boolType))))
 :qid |funType:WandMaskField|
 :pattern ( (WandMaskField arg0@@28))
)))
(assert (forall ((Heap@@4 T@U) (ExhaleHeap@@0 T@U) (Mask@@1 T@U) (pm_f@@0 T@U) ) (! (let ((C@@0 (FieldTypeInv0 (type pm_f@@0))))
 (=> (and (and (and (and (and (= (type Heap@@4) (MapType0Type RefType)) (= (type ExhaleHeap@@0) (MapType0Type RefType))) (= (type Mask@@1) (MapType1Type RefType realType))) (= (type pm_f@@0) (FieldType C@@0 FrameTypeType))) (IdenticalOnKnownLocations Heap@@4 ExhaleHeap@@0 Mask@@1)) (and (HasDirectPerm Mask@@1 null pm_f@@0) (IsWandField pm_f@@0))) (= (MapType0Select Heap@@4 null (WandMaskField pm_f@@0)) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))))
 :qid |stdinbpl.60:19|
 :skolemid |5|
 :pattern ( (IdenticalOnKnownLocations Heap@@4 ExhaleHeap@@0 Mask@@1) (IsWandField pm_f@@0) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))
)))
(assert  (and (forall ((arg0@@29 T@U) (arg1@@13 T@U) (arg2@@6 Int) ) (! (= (type (|aloc#frame| arg0@@29 arg1@@13 arg2@@6)) RefType)
 :qid |funType:aloc#frame|
 :pattern ( (|aloc#frame| arg0@@29 arg1@@13 arg2@@6))
)) (= (type EmptyFrame) FrameTypeType)))
(assert (forall ((Heap@@5 T@U) (Mask@@2 T@U) (a_3@@0 T@U) (i_1@@6 Int) ) (!  (=> (and (and (and (= (type Heap@@5) (MapType0Type RefType)) (= (type Mask@@2) (MapType1Type RefType realType))) (= (type a_3@@0) ArrayDomainTypeType)) (state Heap@@5 Mask@@2)) (= (|aloc'| Heap@@5 a_3@@0 i_1@@6) (|aloc#frame| EmptyFrame a_3@@0 i_1@@6)))
 :qid |stdinbpl.259:15|
 :skolemid |27|
 :pattern ( (state Heap@@5 Mask@@2) (|aloc'| Heap@@5 a_3@@0 i_1@@6))
)))
(assert (forall ((arg0@@30 T@U) (arg1@@14 Int) (arg2@@7 Int) ) (! (= (type (|hide0#sm| arg0@@30 arg1@@14 arg2@@7)) (FieldType PredicateType_hide0Type (MapType1Type RefType boolType)))
 :qid |funType:hide0#sm|
 :pattern ( (|hide0#sm| arg0@@30 arg1@@14 arg2@@7))
)))
(assert (forall ((x@@14 T@U) (n@@5 Int) (i_1@@7 Int) ) (!  (=> (= (type x@@14) ArrayDomainTypeType) (= (PredicateMaskField (hide0 x@@14 n@@5 i_1@@7)) (|hide0#sm| x@@14 n@@5 i_1@@7)))
 :qid |stdinbpl.317:15|
 :skolemid |30|
 :pattern ( (PredicateMaskField (hide0 x@@14 n@@5 i_1@@7)))
)))
(assert (forall ((arg0@@31 T@U) (arg1@@15 Int) (arg2@@8 Int) ) (! (= (type (|hide1#sm| arg0@@31 arg1@@15 arg2@@8)) (FieldType PredicateType_hide1Type (MapType1Type RefType boolType)))
 :qid |funType:hide1#sm|
 :pattern ( (|hide1#sm| arg0@@31 arg1@@15 arg2@@8))
)))
(assert (forall ((x@@15 T@U) (n@@6 Int) (i_1@@8 Int) ) (!  (=> (= (type x@@15) ArrayDomainTypeType) (= (PredicateMaskField (hide1 x@@15 n@@6 i_1@@8)) (|hide1#sm| x@@15 n@@6 i_1@@8)))
 :qid |stdinbpl.390:15|
 :skolemid |36|
 :pattern ( (PredicateMaskField (hide1 x@@15 n@@6 i_1@@8)))
)))
(assert (forall ((Heap@@6 T@U) (ExhaleHeap@@1 T@U) (Mask@@3 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@6) (MapType0Type RefType)) (= (type ExhaleHeap@@1) (MapType0Type RefType))) (= (type Mask@@3) (MapType1Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@6 ExhaleHeap@@1 Mask@@3)) (U_2_bool (MapType0Select Heap@@6 o_1 $allocated))) (U_2_bool (MapType0Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.73:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@6 ExhaleHeap@@1 Mask@@3) (MapType0Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert (forall ((x@@16 T@U) (n@@7 Int) (i_1@@9 Int) (x2 T@U) (n2 Int) (i2 Int) ) (!  (=> (and (and (= (type x@@16) ArrayDomainTypeType) (= (type x2) ArrayDomainTypeType)) (= (hide0 x@@16 n@@7 i_1@@9) (hide0 x2 n2 i2))) (and (= x@@16 x2) (and (= n@@7 n2) (= i_1@@9 i2))))
 :qid |stdinbpl.331:15|
 :skolemid |33|
 :pattern ( (hide0 x@@16 n@@7 i_1@@9) (hide0 x2 n2 i2))
)))
(assert (forall ((x@@17 T@U) (n@@8 Int) (i_1@@10 Int) (x2@@0 T@U) (n2@@0 Int) (i2@@0 Int) ) (!  (=> (and (and (= (type x@@17) ArrayDomainTypeType) (= (type x2@@0) ArrayDomainTypeType)) (= (|hide0#sm| x@@17 n@@8 i_1@@10) (|hide0#sm| x2@@0 n2@@0 i2@@0))) (and (= x@@17 x2@@0) (and (= n@@8 n2@@0) (= i_1@@10 i2@@0))))
 :qid |stdinbpl.335:15|
 :skolemid |34|
 :pattern ( (|hide0#sm| x@@17 n@@8 i_1@@10) (|hide0#sm| x2@@0 n2@@0 i2@@0))
)))
(assert (forall ((x@@18 T@U) (n@@9 Int) (i_1@@11 Int) (x2@@1 T@U) (n2@@1 Int) (i2@@1 Int) ) (!  (=> (and (and (= (type x@@18) ArrayDomainTypeType) (= (type x2@@1) ArrayDomainTypeType)) (= (hide1 x@@18 n@@9 i_1@@11) (hide1 x2@@1 n2@@1 i2@@1))) (and (= x@@18 x2@@1) (and (= n@@9 n2@@1) (= i_1@@11 i2@@1))))
 :qid |stdinbpl.404:15|
 :skolemid |39|
 :pattern ( (hide1 x@@18 n@@9 i_1@@11) (hide1 x2@@1 n2@@1 i2@@1))
)))
(assert (forall ((x@@19 T@U) (n@@10 Int) (i_1@@12 Int) (x2@@2 T@U) (n2@@2 Int) (i2@@2 Int) ) (!  (=> (and (and (= (type x@@19) ArrayDomainTypeType) (= (type x2@@2) ArrayDomainTypeType)) (= (|hide1#sm| x@@19 n@@10 i_1@@12) (|hide1#sm| x2@@2 n2@@2 i2@@2))) (and (= x@@19 x2@@2) (and (= n@@10 n2@@2) (= i_1@@12 i2@@2))))
 :qid |stdinbpl.408:15|
 :skolemid |40|
 :pattern ( (|hide1#sm| x@@19 n@@10 i_1@@12) (|hide1#sm| x2@@2 n2@@2 i2@@2))
)))
(assert (forall ((a_3@@1 T@U) ) (!  (=> (= (type a_3@@1) ArrayDomainTypeType) (>= (alen a_3@@1) 0))
 :qid |stdinbpl.222:15|
 :skolemid |23|
 :pattern ( (alen a_3@@1))
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
 :qid |stdinbpl.191:19|
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
(assert (forall ((arg0@@32 Real) (arg1@@16 T@U) ) (! (= (type (ConditionalFrame arg0@@32 arg1@@16)) FrameTypeType)
 :qid |funType:ConditionalFrame|
 :pattern ( (ConditionalFrame arg0@@32 arg1@@16))
)))
(assert (forall ((p@@0 Real) (f_6 T@U) ) (!  (=> (= (type f_6) FrameTypeType) (= (ConditionalFrame p@@0 f_6) (ite (> p@@0 0.0) f_6 EmptyFrame)))
 :qid |stdinbpl.179:15|
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
(assert (forall ((arg0@@33 T@U) (arg1@@17 T@U) (arg2@@9 Int) ) (! (= (type (aloc arg0@@33 arg1@@17 arg2@@9)) RefType)
 :qid |funType:aloc|
 :pattern ( (aloc arg0@@33 arg1@@17 arg2@@9))
)))
(assert (forall ((Heap@@9 T@U) (a_3@@2 T@U) (i_1@@13 Int) ) (!  (=> (and (= (type Heap@@9) (MapType0Type RefType)) (= (type a_3@@2) ArrayDomainTypeType)) (and (= (aloc Heap@@9 a_3@@2 i_1@@13) (|aloc'| Heap@@9 a_3@@2 i_1@@13)) (dummyFunction (|aloc#triggerStateless| a_3@@2 i_1@@13))))
 :qid |stdinbpl.242:15|
 :skolemid |24|
 :pattern ( (aloc Heap@@9 a_3@@2 i_1@@13))
)))
(assert  (and (forall ((arg0@@34 T@U) (arg1@@18 Int) ) (! (= (type (array_loc arg0@@34 arg1@@18)) RefType)
 :qid |funType:array_loc|
 :pattern ( (array_loc arg0@@34 arg1@@18))
)) (forall ((arg0@@35 T@U) ) (! (= (type (loc_inv_1 arg0@@35)) ArrayDomainTypeType)
 :qid |funType:loc_inv_1|
 :pattern ( (loc_inv_1 arg0@@35))
))))
(assert (forall ((a_3@@3 T@U) (i_1@@14 Int) ) (!  (=> (= (type a_3@@3) ArrayDomainTypeType) (and (= (loc_inv_1 (array_loc a_3@@3 i_1@@14)) a_3@@3) (= (loc_inv_2 (array_loc a_3@@3 i_1@@14)) i_1@@14)))
 :qid |stdinbpl.216:15|
 :skolemid |22|
 :pattern ( (array_loc a_3@@3 i_1@@14))
)))
(assert (forall ((o_2@@1 T@U) (f_4@@1 T@U) ) (! (let ((B@@4 (FieldTypeInv1 (type f_4@@1))))
(let ((A@@5 (FieldTypeInv0 (type f_4@@1))))
 (=> (and (= (type o_2@@1) RefType) (= (type f_4@@1) (FieldType A@@5 B@@4))) (= (U_2_real (MapType1Select ZeroMask o_2@@1 f_4@@1)) NoPerm))))
 :qid |stdinbpl.106:22|
 :skolemid |13|
 :pattern ( (MapType1Select ZeroMask o_2@@1 f_4@@1))
)))
(assert (forall ((Heap@@10 T@U) (Mask@@7 T@U) (a_3@@4 T@U) (i_1@@15 Int) ) (!  (=> (and (and (and (and (= (type Heap@@10) (MapType0Type RefType)) (= (type Mask@@7) (MapType1Type RefType realType))) (= (type a_3@@4) ArrayDomainTypeType)) (and (state Heap@@10 Mask@@7) (< AssumeFunctionsAbove 0))) (and (<= 0 i_1@@15) (< i_1@@15 (alen a_3@@4)))) (= (aloc Heap@@10 a_3@@4 i_1@@15) (array_loc a_3@@4 i_1@@15)))
 :qid |stdinbpl.252:15|
 :skolemid |26|
 :pattern ( (state Heap@@10 Mask@@7) (aloc Heap@@10 a_3@@4 i_1@@15))
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
(assert (forall ((Heap@@14 T@U) (Mask@@11 T@U) (a_3@@5 T@U) (i_1@@16 Int) ) (!  (=> (and (and (and (and (= (type Heap@@14) (MapType0Type RefType)) (= (type Mask@@11) (MapType1Type RefType realType))) (= (type a_3@@5) ArrayDomainTypeType)) (and (state Heap@@14 Mask@@11) (or (< AssumeFunctionsAbove 0) (|aloc#trigger| EmptyFrame a_3@@5 i_1@@16)))) (and (<= 0 i_1@@16) (< i_1@@16 (alen a_3@@5)))) (= (loc_inv_1 (|aloc'| Heap@@14 a_3@@5 i_1@@16)) a_3@@5))
 :qid |stdinbpl.265:15|
 :skolemid |28|
 :pattern ( (state Heap@@14 Mask@@11) (|aloc'| Heap@@14 a_3@@5 i_1@@16))
)))
(assert (forall ((Heap@@15 T@U) (Mask@@12 T@U) (a_3@@6 T@U) (i_1@@17 Int) ) (!  (=> (and (and (and (and (= (type Heap@@15) (MapType0Type RefType)) (= (type Mask@@12) (MapType1Type RefType realType))) (= (type a_3@@6) ArrayDomainTypeType)) (and (state Heap@@15 Mask@@12) (or (< AssumeFunctionsAbove 0) (|aloc#trigger| EmptyFrame a_3@@6 i_1@@17)))) (and (<= 0 i_1@@17) (< i_1@@17 (alen a_3@@6)))) (= (loc_inv_2 (|aloc'| Heap@@15 a_3@@6 i_1@@17)) i_1@@17))
 :qid |stdinbpl.269:15|
 :skolemid |29|
 :pattern ( (state Heap@@15 Mask@@12) (|aloc'| Heap@@15 a_3@@6 i_1@@17))
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
 :qid |stdinbpl.186:25|
 :skolemid |20|
 :pattern ( (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun j_12 () Int)
(declare-fun n@@11 () Int)
(declare-fun Heap@5 () T@U)
(declare-fun x0@@7 () T@U)
(declare-fun j_3 () Int)
(declare-fun UnfoldingMask@1 () T@U)
(declare-fun Heap@6 () T@U)
(declare-fun Mask@3 () T@U)
(declare-fun Heap@7 () T@U)
(declare-fun UnfoldingMask@0 () T@U)
(declare-fun FrameFragment (T@U) T@U)
(declare-fun Heap@4 () T@U)
(declare-fun x1@@7 () T@U)
(declare-fun i_1@@18 () Int)
(declare-fun Heap@1 () T@U)
(declare-fun Heap@2 () T@U)
(declare-fun Heap@3 () T@U)
(declare-fun freshVersion@0 () T@U)
(declare-fun Mask@2 () T@U)
(declare-fun Mask@1 () T@U)
(declare-fun perm@2 () Real)
(declare-fun perm@3 () Real)
(declare-fun Mask@0 () T@U)
(declare-fun perm@1 () Real)
(declare-fun Heap@@17 () T@U)
(declare-fun Heap@0 () T@U)
(declare-fun newVersion@0 () T@U)
(declare-fun QPMask@1 () T@U)
(declare-fun perm@0 () Real)
(declare-fun j_9 () Int)
(declare-fun j_2 () Int)
(declare-fun UnfoldingMask@3 () T@U)
(declare-fun Heap@8 () T@U)
(declare-fun Heap@9 () T@U)
(declare-fun UnfoldingMask@2 () T@U)
(declare-fun j () Int)
(declare-fun UnfoldingMask@5 () T@U)
(declare-fun Heap@10 () T@U)
(declare-fun Heap@11 () T@U)
(declare-fun UnfoldingMask@4 () T@U)
(declare-fun neverTriggered2 (Int) Bool)
(declare-fun QPMask@0 () T@U)
(declare-fun invRecv2 (T@U Int Int) Int)
(declare-fun qpRange2 (T@U Int Int) Bool)
(declare-fun neverTriggered1 (Int) Bool)
(declare-fun invRecv1 (T@U Int Int) Int)
(declare-fun qpRange1 (T@U Int Int) Bool)
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (= (type x0@@7) ArrayDomainTypeType) (= (type UnfoldingMask@5) (MapType1Type RefType realType))) (= (type Heap@@17) (MapType0Type RefType))) (= (type Heap@10) (MapType0Type RefType))) (= (type QPMask@1) (MapType1Type RefType realType))) (= (type Heap@11) (MapType0Type RefType))) (= (type UnfoldingMask@4) (MapType1Type RefType realType))) (forall ((arg0@@36 T@U) ) (! (= (type (FrameFragment arg0@@36)) FrameTypeType)
 :qid |funType:FrameFragment|
 :pattern ( (FrameFragment arg0@@36))
))) (= (type UnfoldingMask@3) (MapType1Type RefType realType))) (= (type Heap@8) (MapType0Type RefType))) (= (type Heap@9) (MapType0Type RefType))) (= (type UnfoldingMask@2) (MapType1Type RefType realType))) (= (type UnfoldingMask@1) (MapType1Type RefType realType))) (= (type Heap@5) (MapType0Type RefType))) (= (type Heap@6) (MapType0Type RefType))) (= (type Mask@3) (MapType1Type RefType realType))) (= (type Heap@7) (MapType0Type RefType))) (= (type UnfoldingMask@0) (MapType1Type RefType realType))) (= (type Heap@4) (MapType0Type RefType))) (= (type x1@@7) ArrayDomainTypeType)) (= (type Heap@2) (MapType0Type RefType))) (= (type Heap@1) (MapType0Type RefType))) (= (type Heap@3) (MapType0Type RefType))) (= (type freshVersion@0) FrameTypeType)) (= (type Mask@2) (MapType1Type RefType realType))) (= (type Mask@1) (MapType1Type RefType realType))) (= (type Mask@0) (MapType1Type RefType realType))) (= (type Heap@0) (MapType0Type RefType))) (= (type newVersion@0) FrameTypeType)) (= (type QPMask@0) (MapType1Type RefType realType))))
(set-info :boogie-vc-id main1)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 78) (let ((anon43_correct true))
(let ((anon66_Else_correct  (=> (and (not (and (<= 0 j_12) (< j_12 n@@11))) (= (ControlFlow 0 47) 44)) anon43_correct)))
(let ((anon66_Then_correct  (=> (and (<= 0 j_12) (< j_12 n@@11)) (and (=> (= (ControlFlow 0 45) (- 0 46)) (= (U_2_int (MapType0Select Heap@5 (aloc Heap@5 x0@@7 j_12) vint)) 0)) (=> (= (U_2_int (MapType0Select Heap@5 (aloc Heap@5 x0@@7 j_12) vint)) 0) (=> (= (ControlFlow 0 45) 44) anon43_correct))))))
(let ((anon64_Then_correct  (and (=> (= (ControlFlow 0 35) (- 0 36)) (<= 0 j_3)) (=> (<= 0 j_3) (=> (= (ControlFlow 0 35) (- 0 34)) (< j_3 (alen x0@@7)))))))
(let ((anon39_correct true))
(let ((anon64_Else_correct  (and (=> (= (ControlFlow 0 37) (- 0 38)) (HasDirectPerm UnfoldingMask@1 (aloc Heap@5 x0@@7 j_3) vint)) (=> (HasDirectPerm UnfoldingMask@1 (aloc Heap@5 x0@@7 j_3) vint) (=> (= Heap@6 (MapType0Store Heap@5 null (|hide0#sm| x0@@7 n@@11 j_3) (MapType1Store (MapType0Select Heap@5 null (|hide0#sm| x0@@7 n@@11 j_3)) (aloc Heap@5 x0@@7 j_3) vint (bool_2_U true)))) (=> (and (and (state Heap@6 Mask@3) (= Heap@7 (MapType0Store Heap@6 null (|hide0#sm| x0@@7 n@@11 j_3) (MapType1Store (MapType0Select Heap@6 null (|hide0#sm| x0@@7 n@@11 j_3)) (aloc Heap@6 x0@@7 j_3) vint (bool_2_U true))))) (and (state Heap@7 Mask@3) (= (ControlFlow 0 37) 32))) anon39_correct))))))
(let ((anon36_correct  (=> (and (= UnfoldingMask@0 (MapType1Store Mask@3 null (hide0 x0@@7 n@@11 j_3) (real_2_U (- (U_2_real (MapType1Select Mask@3 null (hide0 x0@@7 n@@11 j_3))) FullPerm)))) (> n@@11 0)) (=> (and (and (and (>= j_3 0) (< j_3 n@@11)) (and (= (alen x0@@7) n@@11) (state Heap@5 UnfoldingMask@0))) (and (and (not (= (aloc Heap@5 x0@@7 j_3) null)) (= UnfoldingMask@1 (MapType1Store UnfoldingMask@0 (aloc Heap@5 x0@@7 j_3) vint (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@0 (aloc Heap@5 x0@@7 j_3) vint)) FullPerm))))) (and (state Heap@5 UnfoldingMask@1) (state Heap@5 UnfoldingMask@1)))) (and (=> (= (ControlFlow 0 39) 35) anon64_Then_correct) (=> (= (ControlFlow 0 39) 37) anon64_Else_correct))))))
(let ((anon63_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 42) 39)) anon36_correct)))
(let ((anon63_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 40) (- 0 41)) (<= FullPerm (U_2_real (MapType1Select Mask@3 null (hide0 x0@@7 n@@11 j_3))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@3 null (hide0 x0@@7 n@@11 j_3)))) (=> (= (ControlFlow 0 40) 39) anon36_correct))))))
(let ((anon62_Then_correct  (=> (and (and (<= 0 j_3) (< j_3 n@@11)) (and (|hide0#trigger| Heap@5 (hide0 x0@@7 n@@11 j_3)) (= (MapType0Select Heap@5 null (hide0 x0@@7 n@@11 j_3)) (FrameFragment (MapType0Select Heap@5 (aloc Heap@5 x0@@7 j_3) vint))))) (and (=> (= (ControlFlow 0 43) 40) anon63_Then_correct) (=> (= (ControlFlow 0 43) 42) anon63_Else_correct)))))
(let ((anon62_Else_correct  (=> (and (not (and (<= 0 j_3) (< j_3 n@@11))) (= (ControlFlow 0 33) 32)) anon39_correct)))
(let ((anon65_Else_correct true))
(let ((anon32_correct  (=> (= Heap@5 (MapType0Store Heap@4 null (|hide1#sm| x1@@7 n@@11 i_1@@18) (MapType1Store (MapType0Select Heap@4 null (|hide1#sm| x1@@7 n@@11 i_1@@18)) (aloc Heap@4 x1@@7 i_1@@18) vint (bool_2_U true)))) (=> (and (state Heap@5 Mask@3) (state Heap@5 Mask@3)) (and (and (and (and (=> (= (ControlFlow 0 48) 31) anon65_Else_correct) (=> (= (ControlFlow 0 48) 45) anon66_Then_correct)) (=> (= (ControlFlow 0 48) 47) anon66_Else_correct)) (=> (= (ControlFlow 0 48) 43) anon62_Then_correct)) (=> (= (ControlFlow 0 48) 33) anon62_Else_correct))))))
(let ((anon60_Else_correct  (=> (HasDirectPerm Mask@3 null (hide1 x1@@7 n@@11 i_1@@18)) (=> (and (= Heap@4 Heap@1) (= (ControlFlow 0 50) 48)) anon32_correct))))
(let ((anon60_Then_correct  (=> (not (HasDirectPerm Mask@3 null (hide1 x1@@7 n@@11 i_1@@18))) (=> (and (and (= Heap@2 (MapType0Store Heap@1 null (|hide1#sm| x1@@7 n@@11 i_1@@18) ZeroPMask)) (= Heap@3 (MapType0Store Heap@2 null (hide1 x1@@7 n@@11 i_1@@18) freshVersion@0))) (and (= Heap@4 Heap@3) (= (ControlFlow 0 49) 48))) anon32_correct))))
(let ((anon30_correct  (=> (and (= Mask@2 (MapType1Store Mask@1 (aloc Heap@1 x1@@7 i_1@@18) vint (real_2_U (- (U_2_real (MapType1Select Mask@1 (aloc Heap@1 x1@@7 i_1@@18) vint)) perm@2)))) (= perm@3 (/ (to_real 1) (to_real 2)))) (and (=> (= (ControlFlow 0 51) (- 0 52)) (>= perm@3 NoPerm)) (=> (>= perm@3 NoPerm) (=> (= Mask@3 (MapType1Store Mask@2 null (hide1 x1@@7 n@@11 i_1@@18) (real_2_U (+ (U_2_real (MapType1Select Mask@2 null (hide1 x1@@7 n@@11 i_1@@18))) perm@3)))) (=> (and (and (state Heap@1 Mask@3) (state Heap@1 Mask@3)) (and (|hide1#trigger| Heap@1 (hide1 x1@@7 n@@11 i_1@@18)) (= (MapType0Select Heap@1 null (hide1 x1@@7 n@@11 i_1@@18)) (FrameFragment (MapType0Select Heap@1 (aloc Heap@1 x1@@7 i_1@@18) vint))))) (and (=> (= (ControlFlow 0 51) 49) anon60_Then_correct) (=> (= (ControlFlow 0 51) 50) anon60_Else_correct)))))))))
(let ((anon59_Else_correct  (=> (and (= perm@2 NoPerm) (= (ControlFlow 0 55) 51)) anon30_correct)))
(let ((anon59_Then_correct  (=> (not (= perm@2 NoPerm)) (and (=> (= (ControlFlow 0 53) (- 0 54)) (<= perm@2 (U_2_real (MapType1Select Mask@1 (aloc Heap@1 x1@@7 i_1@@18) vint)))) (=> (<= perm@2 (U_2_real (MapType1Select Mask@1 (aloc Heap@1 x1@@7 i_1@@18) vint))) (=> (= (ControlFlow 0 53) 51) anon30_correct))))))
(let ((anon28_correct  (=> (and (> n@@11 0) (>= i_1@@18 0)) (=> (and (and (< i_1@@18 n@@11) (= (alen x1@@7) n@@11)) (and (state Heap@1 Mask@0) (= perm@1 (* FullPerm (/ (to_real 1) (to_real 2)))))) (and (=> (= (ControlFlow 0 56) (- 0 62)) (>= perm@1 NoPerm)) (=> (>= perm@1 NoPerm) (=> (=> (> perm@1 NoPerm) (not (= (aloc Heap@1 x1@@7 i_1@@18) null))) (=> (and (and (= Mask@1 (MapType1Store Mask@0 (aloc Heap@1 x1@@7 i_1@@18) vint (real_2_U (+ (U_2_real (MapType1Select Mask@0 (aloc Heap@1 x1@@7 i_1@@18) vint)) perm@1)))) (state Heap@1 Mask@1)) (and (state Heap@1 Mask@1) (state Heap@1 Mask@1))) (and (=> (= (ControlFlow 0 56) (- 0 61)) (> n@@11 0)) (=> (> n@@11 0) (and (=> (= (ControlFlow 0 56) (- 0 60)) (>= i_1@@18 0)) (=> (>= i_1@@18 0) (and (=> (= (ControlFlow 0 56) (- 0 59)) (< i_1@@18 n@@11)) (=> (< i_1@@18 n@@11) (and (=> (= (ControlFlow 0 56) (- 0 58)) (= (alen x1@@7) n@@11)) (=> (= (alen x1@@7) n@@11) (=> (= perm@2 (* FullPerm (/ (to_real 1) (to_real 2)))) (and (=> (= (ControlFlow 0 56) (- 0 57)) (>= perm@2 NoPerm)) (=> (>= perm@2 NoPerm) (and (=> (= (ControlFlow 0 56) 53) anon59_Then_correct) (=> (= (ControlFlow 0 56) 55) anon59_Else_correct)))))))))))))))))))))
(let ((anon58_Else_correct  (=> (HasDirectPerm Mask@0 null (hide1 x1@@7 n@@11 i_1@@18)) (=> (and (= Heap@1 Heap@@17) (= (ControlFlow 0 64) 56)) anon28_correct))))
(let ((anon58_Then_correct  (=> (and (and (not (HasDirectPerm Mask@0 null (hide1 x1@@7 n@@11 i_1@@18))) (= Heap@0 (MapType0Store Heap@@17 null (hide1 x1@@7 n@@11 i_1@@18) newVersion@0))) (and (= Heap@1 Heap@0) (= (ControlFlow 0 63) 56))) anon28_correct)))
(let ((anon26_correct  (=> (= Mask@0 (MapType1Store QPMask@1 null (hide1 x1@@7 n@@11 i_1@@18) (real_2_U (- (U_2_real (MapType1Select QPMask@1 null (hide1 x1@@7 n@@11 i_1@@18))) perm@0)))) (and (=> (= (ControlFlow 0 65) 63) anon58_Then_correct) (=> (= (ControlFlow 0 65) 64) anon58_Else_correct)))))
(let ((anon57_Else_correct  (=> (and (= perm@0 NoPerm) (= (ControlFlow 0 68) 65)) anon26_correct)))
(let ((anon57_Then_correct  (=> (not (= perm@0 NoPerm)) (and (=> (= (ControlFlow 0 66) (- 0 67)) (<= perm@0 (U_2_real (MapType1Select QPMask@1 null (hide1 x1@@7 n@@11 i_1@@18))))) (=> (<= perm@0 (U_2_real (MapType1Select QPMask@1 null (hide1 x1@@7 n@@11 i_1@@18)))) (=> (= (ControlFlow 0 66) 65) anon26_correct))))))
(let ((anon55_Else_correct  (=> (forall ((j_10_1 Int) ) (!  (=> (and (<= 0 j_10_1) (< j_10_1 n@@11)) (= (U_2_int (MapType0Select Heap@@17 (aloc Heap@@17 x0@@7 j_10_1) vint)) 0))
 :qid |stdinbpl.711:20|
 :skolemid |56|
 :pattern ( (MapType0Select Heap@@17 null (hide0 x0@@7 n@@11 j_10_1)))
)) (=> (and (and (state Heap@@17 QPMask@1) (|hide1#trigger| Heap@@17 (hide1 x1@@7 n@@11 i_1@@18))) (and (= (MapType0Select Heap@@17 null (hide1 x1@@7 n@@11 i_1@@18)) (FrameFragment (MapType0Select Heap@@17 (aloc Heap@@17 x1@@7 i_1@@18) vint))) (= perm@0 (/ (to_real 1) (to_real 2))))) (and (=> (= (ControlFlow 0 69) (- 0 70)) (>= perm@0 NoPerm)) (=> (>= perm@0 NoPerm) (and (=> (= (ControlFlow 0 69) 66) anon57_Then_correct) (=> (= (ControlFlow 0 69) 68) anon57_Else_correct))))))))
(let ((anon23_correct true))
(let ((anon56_Else_correct  (=> (and (not (and (<= 0 j_9) (< j_9 n@@11))) (= (ControlFlow 0 30) 27)) anon23_correct)))
(let ((anon56_Then_correct  (=> (and (<= 0 j_9) (< j_9 n@@11)) (and (=> (= (ControlFlow 0 28) (- 0 29)) (= (U_2_int (MapType0Select Heap@@17 (aloc Heap@@17 x0@@7 j_9) vint)) 0)) (=> (= (U_2_int (MapType0Select Heap@@17 (aloc Heap@@17 x0@@7 j_9) vint)) 0) (=> (= (ControlFlow 0 28) 27) anon23_correct))))))
(let ((anon54_Then_correct  (and (=> (= (ControlFlow 0 18) (- 0 19)) (<= 0 j_2)) (=> (<= 0 j_2) (=> (= (ControlFlow 0 18) (- 0 17)) (< j_2 (alen x0@@7)))))))
(let ((anon19_correct true))
(let ((anon54_Else_correct  (and (=> (= (ControlFlow 0 20) (- 0 21)) (HasDirectPerm UnfoldingMask@3 (aloc Heap@@17 x0@@7 j_2) vint)) (=> (HasDirectPerm UnfoldingMask@3 (aloc Heap@@17 x0@@7 j_2) vint) (=> (= Heap@8 (MapType0Store Heap@@17 null (|hide0#sm| x0@@7 n@@11 j_2) (MapType1Store (MapType0Select Heap@@17 null (|hide0#sm| x0@@7 n@@11 j_2)) (aloc Heap@@17 x0@@7 j_2) vint (bool_2_U true)))) (=> (and (and (state Heap@8 QPMask@1) (= Heap@9 (MapType0Store Heap@8 null (|hide0#sm| x0@@7 n@@11 j_2) (MapType1Store (MapType0Select Heap@8 null (|hide0#sm| x0@@7 n@@11 j_2)) (aloc Heap@8 x0@@7 j_2) vint (bool_2_U true))))) (and (state Heap@9 QPMask@1) (= (ControlFlow 0 20) 15))) anon19_correct))))))
(let ((anon16_correct  (=> (and (= UnfoldingMask@2 (MapType1Store QPMask@1 null (hide0 x0@@7 n@@11 j_2) (real_2_U (- (U_2_real (MapType1Select QPMask@1 null (hide0 x0@@7 n@@11 j_2))) FullPerm)))) (> n@@11 0)) (=> (and (and (and (>= j_2 0) (< j_2 n@@11)) (and (= (alen x0@@7) n@@11) (state Heap@@17 UnfoldingMask@2))) (and (and (not (= (aloc Heap@@17 x0@@7 j_2) null)) (= UnfoldingMask@3 (MapType1Store UnfoldingMask@2 (aloc Heap@@17 x0@@7 j_2) vint (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@2 (aloc Heap@@17 x0@@7 j_2) vint)) FullPerm))))) (and (state Heap@@17 UnfoldingMask@3) (state Heap@@17 UnfoldingMask@3)))) (and (=> (= (ControlFlow 0 22) 18) anon54_Then_correct) (=> (= (ControlFlow 0 22) 20) anon54_Else_correct))))))
(let ((anon53_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 25) 22)) anon16_correct)))
(let ((anon53_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 23) (- 0 24)) (<= FullPerm (U_2_real (MapType1Select QPMask@1 null (hide0 x0@@7 n@@11 j_2))))) (=> (<= FullPerm (U_2_real (MapType1Select QPMask@1 null (hide0 x0@@7 n@@11 j_2)))) (=> (= (ControlFlow 0 23) 22) anon16_correct))))))
(let ((anon52_Then_correct  (=> (and (and (<= 0 j_2) (< j_2 n@@11)) (and (|hide0#trigger| Heap@@17 (hide0 x0@@7 n@@11 j_2)) (= (MapType0Select Heap@@17 null (hide0 x0@@7 n@@11 j_2)) (FrameFragment (MapType0Select Heap@@17 (aloc Heap@@17 x0@@7 j_2) vint))))) (and (=> (= (ControlFlow 0 26) 23) anon53_Then_correct) (=> (= (ControlFlow 0 26) 25) anon53_Else_correct)))))
(let ((anon52_Else_correct  (=> (and (not (and (<= 0 j_2) (< j_2 n@@11))) (= (ControlFlow 0 16) 15)) anon19_correct)))
(let ((anon47_Else_correct  (=> (forall ((j_7 Int) ) (!  (=> (and (<= 0 j_7) (< j_7 n@@11)) (= (U_2_int (MapType0Select Heap@@17 (aloc Heap@@17 x0@@7 j_7) vint)) 0))
 :qid |stdinbpl.633:20|
 :skolemid |55|
 :pattern ( (MapType0Select Heap@@17 null (hide0 x0@@7 n@@11 j_7)))
)) (=> (and (and (state Heap@@17 QPMask@1) (>= i_1@@18 0)) (and (< i_1@@18 n@@11) (state Heap@@17 QPMask@1))) (and (and (and (and (=> (= (ControlFlow 0 71) 69) anon55_Else_correct) (=> (= (ControlFlow 0 71) 28) anon56_Then_correct)) (=> (= (ControlFlow 0 71) 30) anon56_Else_correct)) (=> (= (ControlFlow 0 71) 26) anon52_Then_correct)) (=> (= (ControlFlow 0 71) 16) anon52_Else_correct))))))
(let ((anon50_Then_correct  (and (=> (= (ControlFlow 0 6) (- 0 7)) (<= 0 j)) (=> (<= 0 j) (=> (= (ControlFlow 0 6) (- 0 5)) (< j (alen x0@@7)))))))
(let ((anon11_correct true))
(let ((anon50_Else_correct  (and (=> (= (ControlFlow 0 8) (- 0 9)) (HasDirectPerm UnfoldingMask@5 (aloc Heap@@17 x0@@7 j) vint)) (=> (HasDirectPerm UnfoldingMask@5 (aloc Heap@@17 x0@@7 j) vint) (=> (= Heap@10 (MapType0Store Heap@@17 null (|hide0#sm| x0@@7 n@@11 j) (MapType1Store (MapType0Select Heap@@17 null (|hide0#sm| x0@@7 n@@11 j)) (aloc Heap@@17 x0@@7 j) vint (bool_2_U true)))) (=> (and (and (state Heap@10 QPMask@1) (= Heap@11 (MapType0Store Heap@10 null (|hide0#sm| x0@@7 n@@11 j) (MapType1Store (MapType0Select Heap@10 null (|hide0#sm| x0@@7 n@@11 j)) (aloc Heap@10 x0@@7 j) vint (bool_2_U true))))) (and (state Heap@11 QPMask@1) (= (ControlFlow 0 8) 3))) anon11_correct))))))
(let ((anon8_correct  (=> (and (= UnfoldingMask@4 (MapType1Store QPMask@1 null (hide0 x0@@7 n@@11 j) (real_2_U (- (U_2_real (MapType1Select QPMask@1 null (hide0 x0@@7 n@@11 j))) FullPerm)))) (> n@@11 0)) (=> (and (and (and (>= j 0) (< j n@@11)) (and (= (alen x0@@7) n@@11) (state Heap@@17 UnfoldingMask@4))) (and (and (not (= (aloc Heap@@17 x0@@7 j) null)) (= UnfoldingMask@5 (MapType1Store UnfoldingMask@4 (aloc Heap@@17 x0@@7 j) vint (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@4 (aloc Heap@@17 x0@@7 j) vint)) FullPerm))))) (and (state Heap@@17 UnfoldingMask@5) (state Heap@@17 UnfoldingMask@5)))) (and (=> (= (ControlFlow 0 10) 6) anon50_Then_correct) (=> (= (ControlFlow 0 10) 8) anon50_Else_correct))))))
(let ((anon49_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 13) 10)) anon8_correct)))
(let ((anon49_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 11) (- 0 12)) (<= FullPerm (U_2_real (MapType1Select QPMask@1 null (hide0 x0@@7 n@@11 j))))) (=> (<= FullPerm (U_2_real (MapType1Select QPMask@1 null (hide0 x0@@7 n@@11 j)))) (=> (= (ControlFlow 0 11) 10) anon8_correct))))))
(let ((anon48_Then_correct  (=> (and (and (<= 0 j) (< j n@@11)) (and (|hide0#trigger| Heap@@17 (hide0 x0@@7 n@@11 j)) (= (MapType0Select Heap@@17 null (hide0 x0@@7 n@@11 j)) (FrameFragment (MapType0Select Heap@@17 (aloc Heap@@17 x0@@7 j) vint))))) (and (=> (= (ControlFlow 0 14) 11) anon49_Then_correct) (=> (= (ControlFlow 0 14) 13) anon49_Else_correct)))))
(let ((anon48_Else_correct  (=> (and (not (and (<= 0 j) (< j n@@11))) (= (ControlFlow 0 4) 3)) anon11_correct)))
(let ((anon46_Else_correct  (and (=> (= (ControlFlow 0 72) (- 0 74)) (forall ((j_4 Int) (j_4_1 Int) ) (!  (=> (and (and (and (and (not (= j_4 j_4_1)) (and (<= 0 j_4) (< j_4 n@@11))) (and (<= 0 j_4_1) (< j_4_1 n@@11))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (or (or (not (= x1@@7 x1@@7)) (not (= n@@11 n@@11))) (not (= j_4 j_4_1))))
 :qid |stdinbpl.543:17|
 :skolemid |48|
 :pattern ( (neverTriggered2 j_4) (neverTriggered2 j_4_1))
))) (=> (forall ((j_4@@0 Int) (j_4_1@@0 Int) ) (!  (=> (and (and (and (and (not (= j_4@@0 j_4_1@@0)) (and (<= 0 j_4@@0) (< j_4@@0 n@@11))) (and (<= 0 j_4_1@@0) (< j_4_1@@0 n@@11))) (< NoPerm (/ (to_real 1) (to_real 2)))) (< NoPerm (/ (to_real 1) (to_real 2)))) (or (or (not (= x1@@7 x1@@7)) (not (= n@@11 n@@11))) (not (= j_4@@0 j_4_1@@0))))
 :qid |stdinbpl.543:17|
 :skolemid |48|
 :pattern ( (neverTriggered2 j_4@@0) (neverTriggered2 j_4_1@@0))
)) (=> (and (forall ((j_4@@1 Int) ) (!  (=> (and (and (<= 0 j_4@@1) (< j_4@@1 n@@11)) (< NoPerm (/ (to_real 1) (to_real 2)))) (and (= (invRecv2 x1@@7 n@@11 j_4@@1) j_4@@1) (qpRange2 x1@@7 n@@11 j_4@@1)))
 :qid |stdinbpl.549:22|
 :skolemid |49|
 :pattern ( (MapType0Select Heap@@17 null (hide1 x1@@7 n@@11 j_4@@1)))
 :pattern ( (MapType1Select QPMask@0 null (hide1 x1@@7 n@@11 j_4@@1)))
 :pattern ( (MapType0Select Heap@@17 null (hide1 x1@@7 n@@11 j_4@@1)))
)) (forall ((x_1 T@U) (n_2_1 Int) (i_2_1 Int) ) (!  (=> (= (type x_1) ArrayDomainTypeType) (=> (and (and (and (<= 0 (invRecv2 x_1 n_2_1 i_2_1)) (< (invRecv2 x_1 n_2_1 i_2_1) n@@11)) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange2 x_1 n_2_1 i_2_1)) (and (and (= x1@@7 x_1) (= n@@11 n_2_1)) (= (invRecv2 x_1 n_2_1 i_2_1) i_2_1))))
 :qid |stdinbpl.553:22|
 :skolemid |50|
 :pattern ( (invRecv2 x_1 n_2_1 i_2_1))
))) (and (=> (= (ControlFlow 0 72) (- 0 73)) (forall ((j_4@@2 Int) ) (!  (=> (and (<= 0 j_4@@2) (< j_4@@2 n@@11)) (>= (/ (to_real 1) (to_real 2)) NoPerm))
 :qid |stdinbpl.559:15|
 :skolemid |51|
 :pattern ( (MapType0Select Heap@@17 null (hide1 x1@@7 n@@11 j_4@@2)))
 :pattern ( (MapType1Select QPMask@0 null (hide1 x1@@7 n@@11 j_4@@2)))
 :pattern ( (MapType0Select Heap@@17 null (hide1 x1@@7 n@@11 j_4@@2)))
))) (=> (forall ((j_4@@3 Int) ) (!  (=> (and (<= 0 j_4@@3) (< j_4@@3 n@@11)) (>= (/ (to_real 1) (to_real 2)) NoPerm))
 :qid |stdinbpl.559:15|
 :skolemid |51|
 :pattern ( (MapType0Select Heap@@17 null (hide1 x1@@7 n@@11 j_4@@3)))
 :pattern ( (MapType1Select QPMask@0 null (hide1 x1@@7 n@@11 j_4@@3)))
 :pattern ( (MapType0Select Heap@@17 null (hide1 x1@@7 n@@11 j_4@@3)))
)) (=> (and (forall ((x_1@@0 T@U) (n_2_1@@0 Int) (i_2_1@@0 Int) ) (!  (=> (= (type x_1@@0) ArrayDomainTypeType) (=> (and (and (and (<= 0 (invRecv2 x_1@@0 n_2_1@@0 i_2_1@@0)) (< (invRecv2 x_1@@0 n_2_1@@0 i_2_1@@0) n@@11)) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange2 x_1@@0 n_2_1@@0 i_2_1@@0)) (and (=> (< NoPerm (/ (to_real 1) (to_real 2))) (and (and (= x1@@7 x_1@@0) (= n@@11 n_2_1@@0)) (= (invRecv2 x_1@@0 n_2_1@@0 i_2_1@@0) i_2_1@@0))) (= (U_2_real (MapType1Select QPMask@1 null (hide1 x_1@@0 n_2_1@@0 i_2_1@@0))) (+ (U_2_real (MapType1Select QPMask@0 null (hide1 x_1@@0 n_2_1@@0 i_2_1@@0))) (/ (to_real 1) (to_real 2)))))))
 :qid |stdinbpl.565:22|
 :skolemid |52|
 :pattern ( (MapType1Select QPMask@1 null (hide1 x_1@@0 n_2_1@@0 i_2_1@@0)))
)) (forall ((o_3 T@U) (f_5 T@U) ) (! (let ((B@@11 (FieldTypeInv1 (type f_5))))
(let ((A@@12 (FieldTypeInv0 (type f_5))))
 (=> (and (and (= (type o_3) RefType) (= (type f_5) (FieldType A@@12 B@@11))) (or (or (not (= o_3 null)) (not (IsPredicateField f_5))) (not (= (getPredWandId f_5) 1)))) (= (U_2_real (MapType1Select QPMask@0 o_3 f_5)) (U_2_real (MapType1Select QPMask@1 o_3 f_5))))))
 :qid |stdinbpl.571:29|
 :skolemid |53|
 :pattern ( (MapType1Select QPMask@0 o_3 f_5))
 :pattern ( (MapType1Select QPMask@1 o_3 f_5))
))) (=> (and (and (forall ((x_1@@1 T@U) (n_2_1@@1 Int) (i_2_1@@1 Int) ) (!  (=> (and (= (type x_1@@1) ArrayDomainTypeType) (not (and (and (and (<= 0 (invRecv2 x_1@@1 n_2_1@@1 i_2_1@@1)) (< (invRecv2 x_1@@1 n_2_1@@1 i_2_1@@1) n@@11)) (< NoPerm (/ (to_real 1) (to_real 2)))) (qpRange2 x_1@@1 n_2_1@@1 i_2_1@@1)))) (= (U_2_real (MapType1Select QPMask@1 null (hide1 x_1@@1 n_2_1@@1 i_2_1@@1))) (U_2_real (MapType1Select QPMask@0 null (hide1 x_1@@1 n_2_1@@1 i_2_1@@1)))))
 :qid |stdinbpl.575:22|
 :skolemid |54|
 :pattern ( (MapType1Select QPMask@1 null (hide1 x_1@@1 n_2_1@@1 i_2_1@@1)))
)) (state Heap@@17 QPMask@1)) (and (state Heap@@17 QPMask@1) (state Heap@@17 QPMask@1))) (and (and (=> (= (ControlFlow 0 72) 71) anon47_Else_correct) (=> (= (ControlFlow 0 72) 14) anon48_Then_correct)) (=> (= (ControlFlow 0 72) 4) anon48_Else_correct)))))))))))
(let ((anon46_Then_correct true))
(let ((anon45_Else_correct  (and (=> (= (ControlFlow 0 75) (- 0 76)) (forall ((j_1 Int) (j_1_1 Int) ) (!  (=> (and (and (and (and (not (= j_1 j_1_1)) (and (<= 0 j_1) (< j_1 n@@11))) (and (<= 0 j_1_1) (< j_1_1 n@@11))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (or (or (not (= x0@@7 x0@@7)) (not (= n@@11 n@@11))) (not (= j_1 j_1_1))))
 :qid |stdinbpl.501:17|
 :skolemid |42|
 :pattern ( (neverTriggered1 j_1) (neverTriggered1 j_1_1))
))) (=> (forall ((j_1@@0 Int) (j_1_1@@0 Int) ) (!  (=> (and (and (and (and (not (= j_1@@0 j_1_1@@0)) (and (<= 0 j_1@@0) (< j_1@@0 n@@11))) (and (<= 0 j_1_1@@0) (< j_1_1@@0 n@@11))) (< NoPerm FullPerm)) (< NoPerm FullPerm)) (or (or (not (= x0@@7 x0@@7)) (not (= n@@11 n@@11))) (not (= j_1@@0 j_1_1@@0))))
 :qid |stdinbpl.501:17|
 :skolemid |42|
 :pattern ( (neverTriggered1 j_1@@0) (neverTriggered1 j_1_1@@0))
)) (=> (forall ((j_1@@1 Int) ) (!  (=> (and (and (<= 0 j_1@@1) (< j_1@@1 n@@11)) (< NoPerm FullPerm)) (and (= (invRecv1 x0@@7 n@@11 j_1@@1) j_1@@1) (qpRange1 x0@@7 n@@11 j_1@@1)))
 :qid |stdinbpl.507:22|
 :skolemid |43|
 :pattern ( (MapType0Select Heap@@17 null (hide0 x0@@7 n@@11 j_1@@1)))
 :pattern ( (MapType1Select ZeroMask null (hide0 x0@@7 n@@11 j_1@@1)))
 :pattern ( (MapType0Select Heap@@17 null (hide0 x0@@7 n@@11 j_1@@1)))
)) (=> (and (forall ((x@@20 T@U) (n_1_1 Int) (i_1_1 Int) ) (!  (=> (= (type x@@20) ArrayDomainTypeType) (=> (and (and (and (<= 0 (invRecv1 x@@20 n_1_1 i_1_1)) (< (invRecv1 x@@20 n_1_1 i_1_1) n@@11)) (< NoPerm FullPerm)) (qpRange1 x@@20 n_1_1 i_1_1)) (and (and (= x0@@7 x@@20) (= n@@11 n_1_1)) (= (invRecv1 x@@20 n_1_1 i_1_1) i_1_1))))
 :qid |stdinbpl.511:22|
 :skolemid |44|
 :pattern ( (invRecv1 x@@20 n_1_1 i_1_1))
)) (forall ((x@@21 T@U) (n_1_1@@0 Int) (i_1_1@@0 Int) ) (!  (=> (= (type x@@21) ArrayDomainTypeType) (=> (and (and (and (<= 0 (invRecv1 x@@21 n_1_1@@0 i_1_1@@0)) (< (invRecv1 x@@21 n_1_1@@0 i_1_1@@0) n@@11)) (< NoPerm FullPerm)) (qpRange1 x@@21 n_1_1@@0 i_1_1@@0)) (and (=> (< NoPerm FullPerm) (and (and (= x0@@7 x@@21) (= n@@11 n_1_1@@0)) (= (invRecv1 x@@21 n_1_1@@0 i_1_1@@0) i_1_1@@0))) (= (U_2_real (MapType1Select QPMask@0 null (hide0 x@@21 n_1_1@@0 i_1_1@@0))) (+ (U_2_real (MapType1Select ZeroMask null (hide0 x@@21 n_1_1@@0 i_1_1@@0))) FullPerm)))))
 :qid |stdinbpl.517:22|
 :skolemid |45|
 :pattern ( (MapType1Select QPMask@0 null (hide0 x@@21 n_1_1@@0 i_1_1@@0)))
))) (=> (and (and (forall ((o_3@@0 T@U) (f_5@@0 T@U) ) (! (let ((B@@12 (FieldTypeInv1 (type f_5@@0))))
(let ((A@@13 (FieldTypeInv0 (type f_5@@0))))
 (=> (and (and (= (type o_3@@0) RefType) (= (type f_5@@0) (FieldType A@@13 B@@12))) (or (or (not (= o_3@@0 null)) (not (IsPredicateField f_5@@0))) (not (= (getPredWandId f_5@@0) 0)))) (= (U_2_real (MapType1Select ZeroMask o_3@@0 f_5@@0)) (U_2_real (MapType1Select QPMask@0 o_3@@0 f_5@@0))))))
 :qid |stdinbpl.523:29|
 :skolemid |46|
 :pattern ( (MapType1Select ZeroMask o_3@@0 f_5@@0))
 :pattern ( (MapType1Select QPMask@0 o_3@@0 f_5@@0))
)) (forall ((x@@22 T@U) (n_1_1@@1 Int) (i_1_1@@1 Int) ) (!  (=> (and (= (type x@@22) ArrayDomainTypeType) (not (and (and (and (<= 0 (invRecv1 x@@22 n_1_1@@1 i_1_1@@1)) (< (invRecv1 x@@22 n_1_1@@1 i_1_1@@1) n@@11)) (< NoPerm FullPerm)) (qpRange1 x@@22 n_1_1@@1 i_1_1@@1)))) (= (U_2_real (MapType1Select QPMask@0 null (hide0 x@@22 n_1_1@@1 i_1_1@@1))) (U_2_real (MapType1Select ZeroMask null (hide0 x@@22 n_1_1@@1 i_1_1@@1)))))
 :qid |stdinbpl.527:22|
 :skolemid |47|
 :pattern ( (MapType1Select QPMask@0 null (hide0 x@@22 n_1_1@@1 i_1_1@@1)))
))) (and (state Heap@@17 QPMask@0) (state Heap@@17 QPMask@0))) (and (=> (= (ControlFlow 0 75) 2) anon46_Then_correct) (=> (= (ControlFlow 0 75) 72) anon46_Else_correct)))))))))
(let ((anon45_Then_correct true))
(let ((anon0_correct  (=> (state Heap@@17 ZeroMask) (=> (and (= AssumeFunctionsAbove (- 0 1)) (not (= x0@@7 x1@@7))) (=> (and (and (state Heap@@17 ZeroMask) (= (alen x0@@7) n@@11)) (and (= (alen x1@@7) n@@11) (state Heap@@17 ZeroMask))) (and (=> (= (ControlFlow 0 77) 1) anon45_Then_correct) (=> (= (ControlFlow 0 77) 75) anon45_Else_correct)))))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 78) 77) anon0_correct)))
PreconditionGeneratedEntry_correct))))))))))))))))))))))))))))))))))))))))))))))))))))
))
(check-sat)
(get-info :reason-unknown)
(assert (not (= (ControlFlow 0 28) (- 29))))
(check-sat)
(get-info :reason-unknown)
(assert (not (= (ControlFlow 0 45) (- 46))))
(check-sat)
(pop 1)
; Invalid
(get-info :rlimit)
