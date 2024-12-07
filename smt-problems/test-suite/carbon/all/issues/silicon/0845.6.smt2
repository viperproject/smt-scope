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
(declare-fun |get0'| (T@U T@U Int Int) Int)
(declare-fun dummyFunction (T@U) Bool)
(declare-fun |get0#triggerStateless| (T@U Int Int) Int)
(declare-fun |get1'| (T@U T@U Int Int) Int)
(declare-fun |get1#triggerStateless| (T@U Int Int) Int)
(declare-fun |hide0#trigger| (T@U T@U) Bool)
(declare-fun |hide0#everUsed| (T@U) Bool)
(declare-fun |hide1#trigger| (T@U T@U) Bool)
(declare-fun |hide1#everUsed| (T@U) Bool)
(declare-fun getPredWandId (T@U) Int)
(declare-fun |aloc'| (T@U T@U Int) T@U)
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
(declare-fun get1 (T@U T@U Int Int) Int)
(declare-fun AssumeFunctionsAbove () Int)
(declare-fun aloc (T@U T@U Int) T@U)
(declare-fun get0 (T@U T@U Int Int) Int)
(declare-fun alen (T@U) Int)
(declare-fun dummyHeap () T@U)
(declare-fun ZeroMask () T@U)
(declare-fun InsidePredicate (T@U T@U T@U T@U) Bool)
(declare-fun sumMask (T@U T@U T@U) Bool)
(declare-fun ConditionalFrame (Real T@U) T@U)
(declare-fun NoPerm () Real)
(declare-fun array_loc (T@U Int) T@U)
(declare-fun loc_inv_1 (T@U) T@U)
(declare-fun loc_inv_2 (T@U) Int)
(declare-fun |get1#trigger| (T@U T@U Int Int) Bool)
(declare-fun |get0#trigger| (T@U T@U Int Int) Bool)
(declare-fun FullPerm () Real)
(declare-fun |get0#frame| (T@U T@U Int Int) Int)
(declare-fun |get1#frame| (T@U T@U Int Int) Int)
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
(assert (forall ((x@@8 T@U) (n Int) (i_2 Int) ) (!  (=> (= (type x@@8) ArrayDomainTypeType) (IsPredicateField (hide0 x@@8 n i_2)))
 :qid |stdinbpl.660:15|
 :skolemid |41|
 :pattern ( (hide0 x@@8 n i_2))
)))
(assert  (and (= (Ctor PredicateType_hide1Type) 14) (forall ((arg0@@24 T@U) (arg1@@10 Int) (arg2@@4 Int) ) (! (= (type (hide1 arg0@@24 arg1@@10 arg2@@4)) (FieldType PredicateType_hide1Type FrameTypeType))
 :qid |funType:hide1|
 :pattern ( (hide1 arg0@@24 arg1@@10 arg2@@4))
))))
(assert (forall ((x@@9 T@U) (n@@0 Int) (i_2@@0 Int) ) (!  (=> (= (type x@@9) ArrayDomainTypeType) (IsPredicateField (hide1 x@@9 n@@0 i_2@@0)))
 :qid |stdinbpl.733:15|
 :skolemid |47|
 :pattern ( (hide1 x@@9 n@@0 i_2@@0))
)))
(assert (forall ((Heap@@0 T@U) (x@@10 T@U) (n@@1 Int) (i_2@@1 Int) ) (!  (=> (and (= (type Heap@@0) (MapType0Type RefType)) (= (type x@@10) ArrayDomainTypeType)) (dummyFunction (int_2_U (|get0#triggerStateless| x@@10 n@@1 i_2@@1))))
 :qid |stdinbpl.245:15|
 :skolemid |25|
 :pattern ( (|get0'| Heap@@0 x@@10 n@@1 i_2@@1))
)))
(assert (forall ((Heap@@1 T@U) (x@@11 T@U) (n@@2 Int) (i_2@@2 Int) ) (!  (=> (and (= (type Heap@@1) (MapType0Type RefType)) (= (type x@@11) ArrayDomainTypeType)) (dummyFunction (int_2_U (|get1#triggerStateless| x@@11 n@@2 i_2@@2))))
 :qid |stdinbpl.414:15|
 :skolemid |30|
 :pattern ( (|get1'| Heap@@1 x@@11 n@@2 i_2@@2))
)))
(assert (forall ((Heap@@2 T@U) (x@@12 T@U) (n@@3 Int) (i_2@@3 Int) ) (!  (=> (and (= (type Heap@@2) (MapType0Type RefType)) (= (type x@@12) ArrayDomainTypeType)) (|hide0#everUsed| (hide0 x@@12 n@@3 i_2@@3)))
 :qid |stdinbpl.679:15|
 :skolemid |45|
 :pattern ( (|hide0#trigger| Heap@@2 (hide0 x@@12 n@@3 i_2@@3)))
)))
(assert (forall ((Heap@@3 T@U) (x@@13 T@U) (n@@4 Int) (i_2@@4 Int) ) (!  (=> (and (= (type Heap@@3) (MapType0Type RefType)) (= (type x@@13) ArrayDomainTypeType)) (|hide1#everUsed| (hide1 x@@13 n@@4 i_2@@4)))
 :qid |stdinbpl.752:15|
 :skolemid |51|
 :pattern ( (|hide1#trigger| Heap@@3 (hide1 x@@13 n@@4 i_2@@4)))
)))
(assert (forall ((x@@14 T@U) (n@@5 Int) (i_2@@5 Int) ) (!  (=> (= (type x@@14) ArrayDomainTypeType) (= (getPredWandId (hide0 x@@14 n@@5 i_2@@5)) 0))
 :qid |stdinbpl.664:15|
 :skolemid |42|
 :pattern ( (hide0 x@@14 n@@5 i_2@@5))
)))
(assert (forall ((x@@15 T@U) (n@@6 Int) (i_2@@6 Int) ) (!  (=> (= (type x@@15) ArrayDomainTypeType) (= (getPredWandId (hide1 x@@15 n@@6 i_2@@6)) 1))
 :qid |stdinbpl.737:15|
 :skolemid |48|
 :pattern ( (hide1 x@@15 n@@6 i_2@@6))
)))
(assert  (and (forall ((arg0@@25 T@U) (arg1@@11 T@U) (arg2@@5 Int) ) (! (= (type (|aloc'| arg0@@25 arg1@@11 arg2@@5)) RefType)
 :qid |funType:aloc'|
 :pattern ( (|aloc'| arg0@@25 arg1@@11 arg2@@5))
)) (forall ((arg0@@26 T@U) (arg1@@12 Int) ) (! (= (type (|aloc#triggerStateless| arg0@@26 arg1@@12)) RefType)
 :qid |funType:aloc#triggerStateless|
 :pattern ( (|aloc#triggerStateless| arg0@@26 arg1@@12))
))))
(assert (forall ((Heap@@4 T@U) (a_3 T@U) (i_2@@7 Int) ) (!  (=> (and (= (type Heap@@4) (MapType0Type RefType)) (= (type a_3) ArrayDomainTypeType)) (dummyFunction (|aloc#triggerStateless| a_3 i_2@@7)))
 :qid |stdinbpl.585:15|
 :skolemid |35|
 :pattern ( (|aloc'| Heap@@4 a_3 i_2@@7))
)))
(assert  (and (= (type null) RefType) (forall ((arg0@@27 T@U) ) (! (let ((A (FieldTypeInv0 (type arg0@@27))))
(= (type (PredicateMaskField arg0@@27)) (FieldType A (MapType1Type RefType boolType))))
 :qid |funType:PredicateMaskField|
 :pattern ( (PredicateMaskField arg0@@27))
))))
(assert (forall ((Heap@@5 T@U) (ExhaleHeap T@U) (Mask@@0 T@U) (pm_f T@U) ) (! (let ((C (FieldTypeInv0 (type pm_f))))
 (=> (and (and (and (and (and (= (type Heap@@5) (MapType0Type RefType)) (= (type ExhaleHeap) (MapType0Type RefType))) (= (type Mask@@0) (MapType1Type RefType realType))) (= (type pm_f) (FieldType C FrameTypeType))) (IdenticalOnKnownLocations Heap@@5 ExhaleHeap Mask@@0)) (and (HasDirectPerm Mask@@0 null pm_f) (IsPredicateField pm_f))) (= (MapType0Select Heap@@5 null (PredicateMaskField pm_f)) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))))
 :qid |stdinbpl.47:19|
 :skolemid |2|
 :pattern ( (IdenticalOnKnownLocations Heap@@5 ExhaleHeap Mask@@0) (IsPredicateField pm_f) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))
)))
(assert (forall ((arg0@@28 T@U) ) (! (let ((A@@0 (FieldTypeInv0 (type arg0@@28))))
(= (type (WandMaskField arg0@@28)) (FieldType A@@0 (MapType1Type RefType boolType))))
 :qid |funType:WandMaskField|
 :pattern ( (WandMaskField arg0@@28))
)))
(assert (forall ((Heap@@6 T@U) (ExhaleHeap@@0 T@U) (Mask@@1 T@U) (pm_f@@0 T@U) ) (! (let ((C@@0 (FieldTypeInv0 (type pm_f@@0))))
 (=> (and (and (and (and (and (= (type Heap@@6) (MapType0Type RefType)) (= (type ExhaleHeap@@0) (MapType0Type RefType))) (= (type Mask@@1) (MapType1Type RefType realType))) (= (type pm_f@@0) (FieldType C@@0 FrameTypeType))) (IdenticalOnKnownLocations Heap@@6 ExhaleHeap@@0 Mask@@1)) (and (HasDirectPerm Mask@@1 null pm_f@@0) (IsWandField pm_f@@0))) (= (MapType0Select Heap@@6 null (WandMaskField pm_f@@0)) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))))
 :qid |stdinbpl.60:19|
 :skolemid |5|
 :pattern ( (IdenticalOnKnownLocations Heap@@6 ExhaleHeap@@0 Mask@@1) (IsWandField pm_f@@0) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))
)))
(assert  (and (forall ((arg0@@29 T@U) (arg1@@13 T@U) (arg2@@6 Int) ) (! (= (type (|aloc#frame| arg0@@29 arg1@@13 arg2@@6)) RefType)
 :qid |funType:aloc#frame|
 :pattern ( (|aloc#frame| arg0@@29 arg1@@13 arg2@@6))
)) (= (type EmptyFrame) FrameTypeType)))
(assert (forall ((Heap@@7 T@U) (Mask@@2 T@U) (a_3@@0 T@U) (i_2@@8 Int) ) (!  (=> (and (and (and (= (type Heap@@7) (MapType0Type RefType)) (= (type Mask@@2) (MapType1Type RefType realType))) (= (type a_3@@0) ArrayDomainTypeType)) (state Heap@@7 Mask@@2)) (= (|aloc'| Heap@@7 a_3@@0 i_2@@8) (|aloc#frame| EmptyFrame a_3@@0 i_2@@8)))
 :qid |stdinbpl.598:15|
 :skolemid |37|
 :pattern ( (state Heap@@7 Mask@@2) (|aloc'| Heap@@7 a_3@@0 i_2@@8))
)))
(assert (forall ((arg0@@30 T@U) (arg1@@14 Int) (arg2@@7 Int) ) (! (= (type (|hide0#sm| arg0@@30 arg1@@14 arg2@@7)) (FieldType PredicateType_hide0Type (MapType1Type RefType boolType)))
 :qid |funType:hide0#sm|
 :pattern ( (|hide0#sm| arg0@@30 arg1@@14 arg2@@7))
)))
(assert (forall ((x@@16 T@U) (n@@7 Int) (i_2@@9 Int) ) (!  (=> (= (type x@@16) ArrayDomainTypeType) (= (PredicateMaskField (hide0 x@@16 n@@7 i_2@@9)) (|hide0#sm| x@@16 n@@7 i_2@@9)))
 :qid |stdinbpl.656:15|
 :skolemid |40|
 :pattern ( (PredicateMaskField (hide0 x@@16 n@@7 i_2@@9)))
)))
(assert (forall ((arg0@@31 T@U) (arg1@@15 Int) (arg2@@8 Int) ) (! (= (type (|hide1#sm| arg0@@31 arg1@@15 arg2@@8)) (FieldType PredicateType_hide1Type (MapType1Type RefType boolType)))
 :qid |funType:hide1#sm|
 :pattern ( (|hide1#sm| arg0@@31 arg1@@15 arg2@@8))
)))
(assert (forall ((x@@17 T@U) (n@@8 Int) (i_2@@10 Int) ) (!  (=> (= (type x@@17) ArrayDomainTypeType) (= (PredicateMaskField (hide1 x@@17 n@@8 i_2@@10)) (|hide1#sm| x@@17 n@@8 i_2@@10)))
 :qid |stdinbpl.729:15|
 :skolemid |46|
 :pattern ( (PredicateMaskField (hide1 x@@17 n@@8 i_2@@10)))
)))
(assert (forall ((arg0@@32 T@U) (arg1@@16 T@U) (arg2@@9 Int) ) (! (= (type (aloc arg0@@32 arg1@@16 arg2@@9)) RefType)
 :qid |funType:aloc|
 :pattern ( (aloc arg0@@32 arg1@@16 arg2@@9))
)))
(assert (forall ((Heap@@8 T@U) (Mask@@3 T@U) (x@@18 T@U) (n@@9 Int) (i_2@@11 Int) ) (!  (=> (and (and (and (and (= (type Heap@@8) (MapType0Type RefType)) (= (type Mask@@3) (MapType1Type RefType realType))) (= (type x@@18) ArrayDomainTypeType)) (and (state Heap@@8 Mask@@3) (< AssumeFunctionsAbove 0))) (and (<= 0 i_2@@11) (< i_2@@11 n@@9))) (= (get1 Heap@@8 x@@18 n@@9 i_2@@11) (U_2_int (MapType0Select Heap@@8 (aloc Heap@@8 x@@18 i_2@@11) vint))))
 :qid |stdinbpl.420:15|
 :skolemid |31|
 :pattern ( (state Heap@@8 Mask@@3) (get1 Heap@@8 x@@18 n@@9 i_2@@11))
 :pattern ( (state Heap@@8 Mask@@3) (|get1#triggerStateless| x@@18 n@@9 i_2@@11) (|hide1#trigger| Heap@@8 (hide1 x@@18 n@@9 i_2@@11)))
)))
(assert (forall ((Heap@@9 T@U) (Mask@@4 T@U) (x@@19 T@U) (n@@10 Int) (i_2@@12 Int) ) (!  (=> (and (and (and (and (= (type Heap@@9) (MapType0Type RefType)) (= (type Mask@@4) (MapType1Type RefType realType))) (= (type x@@19) ArrayDomainTypeType)) (and (state Heap@@9 Mask@@4) (< AssumeFunctionsAbove 1))) (and (<= 0 i_2@@12) (< i_2@@12 n@@10))) (= (get0 Heap@@9 x@@19 n@@10 i_2@@12) (U_2_int (MapType0Select Heap@@9 (aloc Heap@@9 x@@19 i_2@@12) vint))))
 :qid |stdinbpl.251:15|
 :skolemid |26|
 :pattern ( (state Heap@@9 Mask@@4) (get0 Heap@@9 x@@19 n@@10 i_2@@12))
 :pattern ( (state Heap@@9 Mask@@4) (|get0#triggerStateless| x@@19 n@@10 i_2@@12) (|hide0#trigger| Heap@@9 (hide0 x@@19 n@@10 i_2@@12)))
)))
(assert (forall ((Heap@@10 T@U) (ExhaleHeap@@1 T@U) (Mask@@5 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@10) (MapType0Type RefType)) (= (type ExhaleHeap@@1) (MapType0Type RefType))) (= (type Mask@@5) (MapType1Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@10 ExhaleHeap@@1 Mask@@5)) (U_2_bool (MapType0Select Heap@@10 o_1 $allocated))) (U_2_bool (MapType0Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.73:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@10 ExhaleHeap@@1 Mask@@5) (MapType0Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert (forall ((x@@20 T@U) (n@@11 Int) (i_2@@13 Int) (x2 T@U) (n2 Int) (i2 Int) ) (!  (=> (and (and (= (type x@@20) ArrayDomainTypeType) (= (type x2) ArrayDomainTypeType)) (= (hide0 x@@20 n@@11 i_2@@13) (hide0 x2 n2 i2))) (and (= x@@20 x2) (and (= n@@11 n2) (= i_2@@13 i2))))
 :qid |stdinbpl.670:15|
 :skolemid |43|
 :pattern ( (hide0 x@@20 n@@11 i_2@@13) (hide0 x2 n2 i2))
)))
(assert (forall ((x@@21 T@U) (n@@12 Int) (i_2@@14 Int) (x2@@0 T@U) (n2@@0 Int) (i2@@0 Int) ) (!  (=> (and (and (= (type x@@21) ArrayDomainTypeType) (= (type x2@@0) ArrayDomainTypeType)) (= (|hide0#sm| x@@21 n@@12 i_2@@14) (|hide0#sm| x2@@0 n2@@0 i2@@0))) (and (= x@@21 x2@@0) (and (= n@@12 n2@@0) (= i_2@@14 i2@@0))))
 :qid |stdinbpl.674:15|
 :skolemid |44|
 :pattern ( (|hide0#sm| x@@21 n@@12 i_2@@14) (|hide0#sm| x2@@0 n2@@0 i2@@0))
)))
(assert (forall ((x@@22 T@U) (n@@13 Int) (i_2@@15 Int) (x2@@1 T@U) (n2@@1 Int) (i2@@1 Int) ) (!  (=> (and (and (= (type x@@22) ArrayDomainTypeType) (= (type x2@@1) ArrayDomainTypeType)) (= (hide1 x@@22 n@@13 i_2@@15) (hide1 x2@@1 n2@@1 i2@@1))) (and (= x@@22 x2@@1) (and (= n@@13 n2@@1) (= i_2@@15 i2@@1))))
 :qid |stdinbpl.743:15|
 :skolemid |49|
 :pattern ( (hide1 x@@22 n@@13 i_2@@15) (hide1 x2@@1 n2@@1 i2@@1))
)))
(assert (forall ((x@@23 T@U) (n@@14 Int) (i_2@@16 Int) (x2@@2 T@U) (n2@@2 Int) (i2@@2 Int) ) (!  (=> (and (and (= (type x@@23) ArrayDomainTypeType) (= (type x2@@2) ArrayDomainTypeType)) (= (|hide1#sm| x@@23 n@@14 i_2@@16) (|hide1#sm| x2@@2 n2@@2 i2@@2))) (and (= x@@23 x2@@2) (and (= n@@14 n2@@2) (= i_2@@16 i2@@2))))
 :qid |stdinbpl.747:15|
 :skolemid |50|
 :pattern ( (|hide1#sm| x@@23 n@@14 i_2@@16) (|hide1#sm| x2@@2 n2@@2 i2@@2))
)))
(assert (forall ((a_3@@1 T@U) ) (!  (=> (= (type a_3@@1) ArrayDomainTypeType) (>= (alen a_3@@1) 0))
 :qid |stdinbpl.221:15|
 :skolemid |23|
 :pattern ( (alen a_3@@1))
)))
(assert (forall ((Heap@@11 T@U) (ExhaleHeap@@2 T@U) (Mask@@6 T@U) (o_1@@0 T@U) (f_2 T@U) ) (! (let ((B@@1 (FieldTypeInv1 (type f_2))))
(let ((A@@1 (FieldTypeInv0 (type f_2))))
 (=> (and (and (and (and (and (and (= (type Heap@@11) (MapType0Type RefType)) (= (type ExhaleHeap@@2) (MapType0Type RefType))) (= (type Mask@@6) (MapType1Type RefType realType))) (= (type o_1@@0) RefType)) (= (type f_2) (FieldType A@@1 B@@1))) (IdenticalOnKnownLocations Heap@@11 ExhaleHeap@@2 Mask@@6)) (HasDirectPerm Mask@@6 o_1@@0 f_2)) (= (MapType0Select Heap@@11 o_1@@0 f_2) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2)))))
 :qid |stdinbpl.42:22|
 :skolemid |1|
 :pattern ( (IdenticalOnKnownLocations Heap@@11 ExhaleHeap@@2 Mask@@6) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2))
)))
(assert  (and (= (type dummyHeap) (MapType0Type RefType)) (= (type ZeroMask) (MapType1Type RefType realType))))
(assert (state dummyHeap ZeroMask))
(assert (forall ((p T@U) (v_1 T@U) (w T@U) ) (! (let ((A@@2 (FieldTypeInv0 (type p))))
 (=> (and (and (= (type p) (FieldType A@@2 FrameTypeType)) (= (type v_1) FrameTypeType)) (= (type w) FrameTypeType)) (not (InsidePredicate p v_1 p w))))
 :qid |stdinbpl.190:19|
 :skolemid |21|
 :pattern ( (InsidePredicate p v_1 p w))
)))
(assert  (not (IsPredicateField vint)))
(assert  (not (IsWandField vint)))
(assert (forall ((Heap@@12 T@U) (ExhaleHeap@@3 T@U) (Mask@@7 T@U) ) (!  (=> (and (and (and (= (type Heap@@12) (MapType0Type RefType)) (= (type ExhaleHeap@@3) (MapType0Type RefType))) (= (type Mask@@7) (MapType1Type RefType realType))) (IdenticalOnKnownLocations Heap@@12 ExhaleHeap@@3 Mask@@7)) (succHeap Heap@@12 ExhaleHeap@@3))
 :qid |stdinbpl.83:15|
 :skolemid |10|
 :pattern ( (IdenticalOnKnownLocations Heap@@12 ExhaleHeap@@3 Mask@@7))
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
 :qid |stdinbpl.178:15|
 :skolemid |19|
 :pattern ( (ConditionalFrame p@@0 f_6))
)))
(assert (forall ((Mask@@8 T@U) (o_2@@0 T@U) (f_4@@0 T@U) ) (! (let ((B@@3 (FieldTypeInv1 (type f_4@@0))))
(let ((A@@4 (FieldTypeInv0 (type f_4@@0))))
 (=> (and (and (= (type Mask@@8) (MapType1Type RefType realType)) (= (type o_2@@0) RefType)) (= (type f_4@@0) (FieldType A@@4 B@@3))) (= (HasDirectPerm Mask@@8 o_2@@0 f_4@@0) (> (U_2_real (MapType1Select Mask@@8 o_2@@0 f_4@@0)) NoPerm)))))
 :qid |stdinbpl.133:22|
 :skolemid |17|
 :pattern ( (HasDirectPerm Mask@@8 o_2@@0 f_4@@0))
)))
(assert (forall ((Heap@@13 T@U) (a_3@@2 T@U) (i_2@@17 Int) ) (!  (=> (and (= (type Heap@@13) (MapType0Type RefType)) (= (type a_3@@2) ArrayDomainTypeType)) (and (= (aloc Heap@@13 a_3@@2 i_2@@17) (|aloc'| Heap@@13 a_3@@2 i_2@@17)) (dummyFunction (|aloc#triggerStateless| a_3@@2 i_2@@17))))
 :qid |stdinbpl.581:15|
 :skolemid |34|
 :pattern ( (aloc Heap@@13 a_3@@2 i_2@@17))
)))
(assert  (and (forall ((arg0@@34 T@U) (arg1@@18 Int) ) (! (= (type (array_loc arg0@@34 arg1@@18)) RefType)
 :qid |funType:array_loc|
 :pattern ( (array_loc arg0@@34 arg1@@18))
)) (forall ((arg0@@35 T@U) ) (! (= (type (loc_inv_1 arg0@@35)) ArrayDomainTypeType)
 :qid |funType:loc_inv_1|
 :pattern ( (loc_inv_1 arg0@@35))
))))
(assert (forall ((a_3@@3 T@U) (i_2@@18 Int) ) (!  (=> (= (type a_3@@3) ArrayDomainTypeType) (and (= (loc_inv_1 (array_loc a_3@@3 i_2@@18)) a_3@@3) (= (loc_inv_2 (array_loc a_3@@3 i_2@@18)) i_2@@18)))
 :qid |stdinbpl.215:15|
 :skolemid |22|
 :pattern ( (array_loc a_3@@3 i_2@@18))
)))
(assert (forall ((o_2@@1 T@U) (f_4@@1 T@U) ) (! (let ((B@@4 (FieldTypeInv1 (type f_4@@1))))
(let ((A@@5 (FieldTypeInv0 (type f_4@@1))))
 (=> (and (= (type o_2@@1) RefType) (= (type f_4@@1) (FieldType A@@5 B@@4))) (= (U_2_real (MapType1Select ZeroMask o_2@@1 f_4@@1)) NoPerm))))
 :qid |stdinbpl.106:22|
 :skolemid |13|
 :pattern ( (MapType1Select ZeroMask o_2@@1 f_4@@1))
)))
(assert (forall ((Heap@@14 T@U) (Mask@@9 T@U) (a_3@@4 T@U) (i_2@@19 Int) ) (!  (=> (and (and (and (and (= (type Heap@@14) (MapType0Type RefType)) (= (type Mask@@9) (MapType1Type RefType realType))) (= (type a_3@@4) ArrayDomainTypeType)) (and (state Heap@@14 Mask@@9) (< AssumeFunctionsAbove 2))) (and (<= 0 i_2@@19) (< i_2@@19 (alen a_3@@4)))) (= (aloc Heap@@14 a_3@@4 i_2@@19) (array_loc a_3@@4 i_2@@19)))
 :qid |stdinbpl.591:15|
 :skolemid |36|
 :pattern ( (state Heap@@14 Mask@@9) (aloc Heap@@14 a_3@@4 i_2@@19))
)))
(assert (forall ((Heap@@15 T@U) (x@@24 T@U) (n@@15 Int) (i_2@@20 Int) ) (!  (=> (and (= (type Heap@@15) (MapType0Type RefType)) (= (type x@@24) ArrayDomainTypeType)) (and (= (get0 Heap@@15 x@@24 n@@15 i_2@@20) (|get0'| Heap@@15 x@@24 n@@15 i_2@@20)) (dummyFunction (int_2_U (|get0#triggerStateless| x@@24 n@@15 i_2@@20)))))
 :qid |stdinbpl.241:15|
 :skolemid |24|
 :pattern ( (get0 Heap@@15 x@@24 n@@15 i_2@@20))
)))
(assert (forall ((Heap@@16 T@U) (x@@25 T@U) (n@@16 Int) (i_2@@21 Int) ) (!  (=> (and (= (type Heap@@16) (MapType0Type RefType)) (= (type x@@25) ArrayDomainTypeType)) (and (= (get1 Heap@@16 x@@25 n@@16 i_2@@21) (|get1'| Heap@@16 x@@25 n@@16 i_2@@21)) (dummyFunction (int_2_U (|get1#triggerStateless| x@@25 n@@16 i_2@@21)))))
 :qid |stdinbpl.410:15|
 :skolemid |29|
 :pattern ( (get1 Heap@@16 x@@25 n@@16 i_2@@21))
)))
(assert (forall ((Heap@@17 T@U) (Mask@@10 T@U) (x@@26 T@U) (n@@17 Int) (i_2@@22 Int) ) (!  (=> (and (and (and (and (= (type Heap@@17) (MapType0Type RefType)) (= (type Mask@@10) (MapType1Type RefType realType))) (= (type x@@26) ArrayDomainTypeType)) (and (state Heap@@17 Mask@@10) (or (< AssumeFunctionsAbove 0) (|get1#trigger| (MapType0Select Heap@@17 null (hide1 x@@26 n@@17 i_2@@22)) x@@26 n@@17 i_2@@22)))) (and (<= 0 i_2@@22) (< i_2@@22 n@@17))) (= (|get1'| Heap@@17 x@@26 n@@17 i_2@@22) (U_2_int (MapType0Select Heap@@17 (aloc Heap@@17 x@@26 i_2@@22) vint))))
 :qid |stdinbpl.433:15|
 :skolemid |33|
 :pattern ( (state Heap@@17 Mask@@10) (|get1'| Heap@@17 x@@26 n@@17 i_2@@22))
)))
(assert (forall ((Heap@@18 T@U) (Mask@@11 T@U) (x@@27 T@U) (n@@18 Int) (i_2@@23 Int) ) (!  (=> (and (and (and (and (= (type Heap@@18) (MapType0Type RefType)) (= (type Mask@@11) (MapType1Type RefType realType))) (= (type x@@27) ArrayDomainTypeType)) (and (state Heap@@18 Mask@@11) (or (< AssumeFunctionsAbove 1) (|get0#trigger| (MapType0Select Heap@@18 null (hide0 x@@27 n@@18 i_2@@23)) x@@27 n@@18 i_2@@23)))) (and (<= 0 i_2@@23) (< i_2@@23 n@@18))) (= (|get0'| Heap@@18 x@@27 n@@18 i_2@@23) (U_2_int (MapType0Select Heap@@18 (aloc Heap@@18 x@@27 i_2@@23) vint))))
 :qid |stdinbpl.264:15|
 :skolemid |28|
 :pattern ( (state Heap@@18 Mask@@11) (|get0'| Heap@@18 x@@27 n@@18 i_2@@23))
)))
(assert (forall ((Heap@@19 T@U) (ExhaleHeap@@4 T@U) (Mask@@12 T@U) (pm_f@@1 T@U) ) (! (let ((C@@1 (FieldTypeInv0 (type pm_f@@1))))
 (=> (and (and (and (and (and (= (type Heap@@19) (MapType0Type RefType)) (= (type ExhaleHeap@@4) (MapType0Type RefType))) (= (type Mask@@12) (MapType1Type RefType realType))) (= (type pm_f@@1) (FieldType C@@1 FrameTypeType))) (IdenticalOnKnownLocations Heap@@19 ExhaleHeap@@4 Mask@@12)) (and (HasDirectPerm Mask@@12 null pm_f@@1) (IsPredicateField pm_f@@1))) (forall ((o2 T@U) (f_2@@0 T@U) ) (! (let ((B@@5 (FieldTypeInv1 (type f_2@@0))))
(let ((A@@6 (FieldTypeInv0 (type f_2@@0))))
 (=> (and (and (= (type o2) RefType) (= (type f_2@@0) (FieldType A@@6 B@@5))) (U_2_bool (MapType1Select (MapType0Select Heap@@19 null (PredicateMaskField pm_f@@1)) o2 f_2@@0))) (= (MapType0Select Heap@@19 o2 f_2@@0) (MapType0Select ExhaleHeap@@4 o2 f_2@@0)))))
 :qid |stdinbpl.54:134|
 :skolemid |3|
 :pattern ( (MapType0Select ExhaleHeap@@4 o2 f_2@@0))
))))
 :qid |stdinbpl.52:19|
 :skolemid |4|
 :pattern ( (IdenticalOnKnownLocations Heap@@19 ExhaleHeap@@4 Mask@@12) (IsPredicateField pm_f@@1))
)))
(assert (forall ((Heap@@20 T@U) (ExhaleHeap@@5 T@U) (Mask@@13 T@U) (pm_f@@2 T@U) ) (! (let ((C@@2 (FieldTypeInv0 (type pm_f@@2))))
 (=> (and (and (and (and (and (= (type Heap@@20) (MapType0Type RefType)) (= (type ExhaleHeap@@5) (MapType0Type RefType))) (= (type Mask@@13) (MapType1Type RefType realType))) (= (type pm_f@@2) (FieldType C@@2 FrameTypeType))) (IdenticalOnKnownLocations Heap@@20 ExhaleHeap@@5 Mask@@13)) (and (HasDirectPerm Mask@@13 null pm_f@@2) (IsWandField pm_f@@2))) (forall ((o2@@0 T@U) (f_2@@1 T@U) ) (! (let ((B@@6 (FieldTypeInv1 (type f_2@@1))))
(let ((A@@7 (FieldTypeInv0 (type f_2@@1))))
 (=> (and (and (= (type o2@@0) RefType) (= (type f_2@@1) (FieldType A@@7 B@@6))) (U_2_bool (MapType1Select (MapType0Select Heap@@20 null (WandMaskField pm_f@@2)) o2@@0 f_2@@1))) (= (MapType0Select Heap@@20 o2@@0 f_2@@1) (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1)))))
 :qid |stdinbpl.67:129|
 :skolemid |6|
 :pattern ( (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1))
))))
 :qid |stdinbpl.65:19|
 :skolemid |7|
 :pattern ( (IdenticalOnKnownLocations Heap@@20 ExhaleHeap@@5 Mask@@13) (IsWandField pm_f@@2))
)))
(assert (forall ((Mask@@14 T@U) (o_2@@2 T@U) (f_4@@2 T@U) ) (! (let ((B@@7 (FieldTypeInv1 (type f_4@@2))))
(let ((A@@8 (FieldTypeInv0 (type f_4@@2))))
 (=> (and (and (and (= (type Mask@@14) (MapType1Type RefType realType)) (= (type o_2@@2) RefType)) (= (type f_4@@2) (FieldType A@@8 B@@7))) (GoodMask Mask@@14)) (and (>= (U_2_real (MapType1Select Mask@@14 o_2@@2 f_4@@2)) NoPerm) (=> (and (and (GoodMask Mask@@14) (not (IsPredicateField f_4@@2))) (not (IsWandField f_4@@2))) (<= (U_2_real (MapType1Select Mask@@14 o_2@@2 f_4@@2)) FullPerm))))))
 :qid |stdinbpl.128:22|
 :skolemid |16|
 :pattern ( (GoodMask Mask@@14) (MapType1Select Mask@@14 o_2@@2 f_4@@2))
)))
(assert (forall ((o T@U) (f T@U) (Heap@@21 T@U) ) (!  (=> (and (and (and (= (type o) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap@@21) (MapType0Type RefType))) (U_2_bool (MapType0Select Heap@@21 o $allocated))) (U_2_bool (MapType0Select Heap@@21 (MapType0Select Heap@@21 o f) $allocated)))
 :qid |stdinbpl.31:15|
 :skolemid |0|
 :pattern ( (MapType0Select Heap@@21 o f))
)))
(assert (forall ((Heap@@22 T@U) (Mask@@15 T@U) (x@@28 T@U) (n@@19 Int) (i_2@@24 Int) ) (!  (=> (and (and (and (= (type Heap@@22) (MapType0Type RefType)) (= (type Mask@@15) (MapType1Type RefType realType))) (= (type x@@28) ArrayDomainTypeType)) (state Heap@@22 Mask@@15)) (= (|get0'| Heap@@22 x@@28 n@@19 i_2@@24) (|get0#frame| (MapType0Select Heap@@22 null (hide0 x@@28 n@@19 i_2@@24)) x@@28 n@@19 i_2@@24)))
 :qid |stdinbpl.258:15|
 :skolemid |27|
 :pattern ( (state Heap@@22 Mask@@15) (|get0'| Heap@@22 x@@28 n@@19 i_2@@24))
 :pattern ( (state Heap@@22 Mask@@15) (|get0#triggerStateless| x@@28 n@@19 i_2@@24) (|hide0#trigger| Heap@@22 (hide0 x@@28 n@@19 i_2@@24)))
)))
(assert (forall ((Heap@@23 T@U) (Mask@@16 T@U) (x@@29 T@U) (n@@20 Int) (i_2@@25 Int) ) (!  (=> (and (and (and (= (type Heap@@23) (MapType0Type RefType)) (= (type Mask@@16) (MapType1Type RefType realType))) (= (type x@@29) ArrayDomainTypeType)) (state Heap@@23 Mask@@16)) (= (|get1'| Heap@@23 x@@29 n@@20 i_2@@25) (|get1#frame| (MapType0Select Heap@@23 null (hide1 x@@29 n@@20 i_2@@25)) x@@29 n@@20 i_2@@25)))
 :qid |stdinbpl.427:15|
 :skolemid |32|
 :pattern ( (state Heap@@23 Mask@@16) (|get1'| Heap@@23 x@@29 n@@20 i_2@@25))
 :pattern ( (state Heap@@23 Mask@@16) (|get1#triggerStateless| x@@29 n@@20 i_2@@25) (|hide1#trigger| Heap@@23 (hide1 x@@29 n@@20 i_2@@25)))
)))
(assert (forall ((Heap@@24 T@U) (Mask@@17 T@U) (a_3@@5 T@U) (i_2@@26 Int) ) (!  (=> (and (and (and (and (= (type Heap@@24) (MapType0Type RefType)) (= (type Mask@@17) (MapType1Type RefType realType))) (= (type a_3@@5) ArrayDomainTypeType)) (and (state Heap@@24 Mask@@17) (or (< AssumeFunctionsAbove 2) (|aloc#trigger| EmptyFrame a_3@@5 i_2@@26)))) (and (<= 0 i_2@@26) (< i_2@@26 (alen a_3@@5)))) (= (loc_inv_1 (|aloc'| Heap@@24 a_3@@5 i_2@@26)) a_3@@5))
 :qid |stdinbpl.604:15|
 :skolemid |38|
 :pattern ( (state Heap@@24 Mask@@17) (|aloc'| Heap@@24 a_3@@5 i_2@@26))
)))
(assert (forall ((Heap@@25 T@U) (Mask@@18 T@U) (a_3@@6 T@U) (i_2@@27 Int) ) (!  (=> (and (and (and (and (= (type Heap@@25) (MapType0Type RefType)) (= (type Mask@@18) (MapType1Type RefType realType))) (= (type a_3@@6) ArrayDomainTypeType)) (and (state Heap@@25 Mask@@18) (or (< AssumeFunctionsAbove 2) (|aloc#trigger| EmptyFrame a_3@@6 i_2@@27)))) (and (<= 0 i_2@@27) (< i_2@@27 (alen a_3@@6)))) (= (loc_inv_2 (|aloc'| Heap@@25 a_3@@6 i_2@@27)) i_2@@27))
 :qid |stdinbpl.608:15|
 :skolemid |39|
 :pattern ( (state Heap@@25 Mask@@18) (|aloc'| Heap@@25 a_3@@6 i_2@@27))
)))
(assert (forall ((Heap@@26 T@U) (o@@0 T@U) (f_3 T@U) (v T@U) ) (! (let ((B@@8 (type v)))
(let ((A@@9 (FieldTypeInv0 (type f_3))))
 (=> (and (and (= (type Heap@@26) (MapType0Type RefType)) (= (type o@@0) RefType)) (= (type f_3) (FieldType A@@9 B@@8))) (succHeap Heap@@26 (MapType0Store Heap@@26 o@@0 f_3 v)))))
 :qid |stdinbpl.78:22|
 :skolemid |9|
 :pattern ( (MapType0Store Heap@@26 o@@0 f_3 v))
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
 :qid |stdinbpl.185:25|
 :skolemid |20|
 :pattern ( (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun i_2@@28 () Int)
(declare-fun x@@30 () T@U)
(declare-fun Heap@@27 () T@U)
(declare-fun n@@21 () Int)
(assert  (and (= (type x@@30) ArrayDomainTypeType) (= (type Heap@@27) (MapType0Type RefType))))
(set-info :boogie-vc-id |hide1#definedness|)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 6) (let ((anon3_Else_correct true))
(let ((anon3_Then_correct  (and (=> (= (ControlFlow 0 2) (- 0 3)) (<= 0 i_2@@28)) (=> (<= 0 i_2@@28) (=> (= (ControlFlow 0 2) (- 0 1)) (< i_2@@28 (alen x@@30)))))))
(let ((anon0_correct  (=> (state Heap@@27 ZeroMask) (=> (and (= AssumeFunctionsAbove (- 0 1)) (> n@@21 0)) (=> (and (and (>= i_2@@28 0) (< i_2@@28 n@@21)) (and (= (alen x@@30) n@@21) (state Heap@@27 ZeroMask))) (and (=> (= (ControlFlow 0 5) 2) anon3_Then_correct) (=> (= (ControlFlow 0 5) 4) anon3_Else_correct)))))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 6) 5) anon0_correct)))
PreconditionGeneratedEntry_correct)))))
))
(check-sat)
(pop 1)
; Valid
(get-info :rlimit)
