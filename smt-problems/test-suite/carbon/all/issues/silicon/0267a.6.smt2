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
(declare-fun vbool () T@U)
(declare-fun vint () T@U)
(declare-fun FieldType (T@T T@T) T@T)
(declare-fun FieldTypeInv0 (T@T) T@T)
(declare-fun FieldTypeInv1 (T@T) T@T)
(declare-fun NormalFieldType () T@T)
(declare-fun PyTypeDomainTypeType () T@T)
(declare-fun state (T@U T@U) Bool)
(declare-fun SO_MANY_GLOBAL_VARS (T@U) T@U)
(declare-fun MapType0Type (T@T) T@T)
(declare-fun RefType () T@T)
(declare-fun MapType1Type (T@T T@T) T@T)
(declare-fun AssumeFunctionsAbove () Int)
(declare-fun bool___unbox__ (T@U T@U) Bool)
(declare-fun ANOTHER_GLOBAL_VAR (T@U) T@U)
(declare-fun OTHER_GLOBAL_VAR (T@U) T@U)
(declare-fun __prim__int___box__ (T@U Int) T@U)
(declare-fun MapType0TypeInv0 (T@T) T@T)
(declare-fun MapType0Select (T@U T@U T@U) T@U)
(declare-fun MapType0Store (T@U T@U T@U T@U) T@U)
(declare-fun MapType1TypeInv0 (T@T) T@T)
(declare-fun MapType1TypeInv1 (T@T) T@T)
(declare-fun MapType1Select (T@U T@U T@U) T@U)
(declare-fun MapType1Store (T@U T@U T@U T@U) T@U)
(declare-fun __prim__bool___box__ (T@U Bool) T@U)
(declare-fun succHeap (T@U T@U) Bool)
(declare-fun succHeapTrans (T@U T@U) Bool)
(declare-fun GoodMask (T@U) Bool)
(declare-fun IdenticalOnKnownLocations (T@U T@U T@U) Bool)
(declare-fun IsPredicateField (T@U) Bool)
(declare-fun null () T@U)
(declare-fun PredicateMaskField (T@U) T@U)
(declare-fun FrameTypeType () T@T)
(declare-fun HasDirectPerm (T@U T@U T@U) Bool)
(declare-fun IsWandField (T@U) Bool)
(declare-fun WandMaskField (T@U) T@U)
(declare-fun |__prim__int___box__'| (T@U Int) T@U)
(declare-fun dummyFunction (T@U) Bool)
(declare-fun |__prim__int___box__#triggerStateless| (Int) T@U)
(declare-fun |int___unbox__'| (T@U T@U) Int)
(declare-fun |int___unbox__#triggerStateless| (T@U) Int)
(declare-fun |__prim__bool___box__'| (T@U Bool) T@U)
(declare-fun |__prim__bool___box__#triggerStateless| (Bool) T@U)
(declare-fun |bool___unbox__'| (T@U T@U) Bool)
(declare-fun |bool___unbox__#triggerStateless| (T@U) Bool)
(declare-fun |__prim__bool___box__#trigger| (T@U Bool) Bool)
(declare-fun EmptyFrame () T@U)
(declare-fun int___unbox__ (T@U T@U) Int)
(declare-fun |SO_MANY_GLOBAL_VARS'| (T@U) T@U)
(declare-fun |SO_MANY_GLOBAL_VARS#trigger| (T@U) Bool)
(declare-fun |ANOTHER_GLOBAL_VAR'| (T@U) T@U)
(declare-fun |ANOTHER_GLOBAL_VAR#trigger| (T@U) Bool)
(declare-fun issubtype (T@U T@U) Bool)
(declare-fun typeof (T@U) T@U)
(declare-fun dummyHeap () T@U)
(declare-fun ZeroMask () T@U)
(declare-fun InsidePredicate (T@U T@U T@U T@U) Bool)
(declare-fun sumMask (T@U T@U T@U) Bool)
(declare-fun ConditionalFrame (Real T@U) T@U)
(declare-fun |OTHER_GLOBAL_VAR'| (T@U) T@U)
(declare-fun |OTHER_GLOBAL_VAR#triggerStateless| () T@U)
(declare-fun |ANOTHER_GLOBAL_VAR#triggerStateless| () T@U)
(declare-fun |SO_MANY_GLOBAL_VARS#triggerStateless| () T@U)
(declare-fun NoPerm () Real)
(declare-fun |bool___unbox__#frame| (T@U T@U) Bool)
(declare-fun FullPerm () Real)
(declare-fun |__prim__int___box__#frame| (T@U Int) T@U)
(declare-fun |int___unbox__#frame| (T@U T@U) Int)
(declare-fun |__prim__bool___box__#frame| (T@U Bool) T@U)
(declare-fun |OTHER_GLOBAL_VAR#frame| (T@U) T@U)
(declare-fun |ANOTHER_GLOBAL_VAR#frame| (T@U) T@U)
(declare-fun |SO_MANY_GLOBAL_VARS#frame| (T@U) T@U)
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
))) (= (Ctor NormalFieldType) 7)) (= (type $allocated) (FieldType NormalFieldType boolType))) (= (Ctor PyTypeDomainTypeType) 8)) (= (type vbool) PyTypeDomainTypeType)) (= (type vint) PyTypeDomainTypeType)))
(assert (distinct $allocated vbool vint)
)
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (forall ((arg0@@14 T@T) ) (! (= (Ctor (MapType0Type arg0@@14)) 9)
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
)))) (= (Ctor RefType) 10)) (forall ((arg0@@18 T@T) (arg1@@4 T@T) ) (! (= (Ctor (MapType1Type arg0@@18 arg1@@4)) 11)
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
)))) (forall ((arg0@@23 T@U) ) (! (= (type (SO_MANY_GLOBAL_VARS arg0@@23)) RefType)
 :qid |funType:SO_MANY_GLOBAL_VARS|
 :pattern ( (SO_MANY_GLOBAL_VARS arg0@@23))
))) (forall ((arg0@@24 T@U) ) (! (= (type (ANOTHER_GLOBAL_VAR arg0@@24)) RefType)
 :qid |funType:ANOTHER_GLOBAL_VAR|
 :pattern ( (ANOTHER_GLOBAL_VAR arg0@@24))
))) (forall ((arg0@@25 T@U) ) (! (= (type (OTHER_GLOBAL_VAR arg0@@25)) RefType)
 :qid |funType:OTHER_GLOBAL_VAR|
 :pattern ( (OTHER_GLOBAL_VAR arg0@@25))
))) (forall ((arg0@@26 T@U) (arg1@@9 Int) ) (! (= (type (__prim__int___box__ arg0@@26 arg1@@9)) RefType)
 :qid |funType:__prim__int___box__|
 :pattern ( (__prim__int___box__ arg0@@26 arg1@@9))
))))
(assert (forall ((Heap T@U) (Mask T@U) ) (!  (=> (and (and (= (type Heap) (MapType0Type RefType)) (= (type Mask) (MapType1Type RefType realType))) (and (state Heap Mask) (< AssumeFunctionsAbove 0))) (= (SO_MANY_GLOBAL_VARS Heap) (ite (bool___unbox__ Heap (ANOTHER_GLOBAL_VAR Heap)) (OTHER_GLOBAL_VAR Heap) (__prim__int___box__ Heap 44))))
 :qid |stdinbpl.343:15|
 :skolemid |33|
 :pattern ( (state Heap Mask) (SO_MANY_GLOBAL_VARS Heap))
)))
(assert (forall ((arg0@@27 T@U) (arg1@@10 Bool) ) (! (= (type (__prim__bool___box__ arg0@@27 arg1@@10)) RefType)
 :qid |funType:__prim__bool___box__|
 :pattern ( (__prim__bool___box__ arg0@@27 arg1@@10))
)))
(assert (forall ((Heap@@0 T@U) (Mask@@0 T@U) ) (!  (=> (and (and (= (type Heap@@0) (MapType0Type RefType)) (= (type Mask@@0) (MapType1Type RefType realType))) (and (state Heap@@0 Mask@@0) (< AssumeFunctionsAbove 1))) (= (ANOTHER_GLOBAL_VAR Heap@@0) (__prim__bool___box__ Heap@@0 true)))
 :qid |stdinbpl.260:15|
 :skolemid |27|
 :pattern ( (state Heap@@0 Mask@@0) (ANOTHER_GLOBAL_VAR Heap@@0))
)))
(assert (forall ((Heap0 T@U) (Heap1 T@U) ) (!  (=> (and (and (= (type Heap0) (MapType0Type RefType)) (= (type Heap1) (MapType0Type RefType))) (succHeap Heap0 Heap1)) (succHeapTrans Heap0 Heap1))
 :qid |stdinbpl.88:15|
 :skolemid |11|
 :pattern ( (succHeap Heap0 Heap1))
)))
(assert (forall ((Heap@@1 T@U) (Mask@@1 T@U) ) (!  (=> (and (and (= (type Heap@@1) (MapType0Type RefType)) (= (type Mask@@1) (MapType1Type RefType realType))) (state Heap@@1 Mask@@1)) (GoodMask Mask@@1))
 :qid |stdinbpl.124:15|
 :skolemid |15|
 :pattern ( (state Heap@@1 Mask@@1))
)))
(assert (forall ((Heap0@@0 T@U) (Heap1@@0 T@U) (Heap2 T@U) ) (!  (=> (and (and (and (= (type Heap0@@0) (MapType0Type RefType)) (= (type Heap1@@0) (MapType0Type RefType))) (= (type Heap2) (MapType0Type RefType))) (and (succHeapTrans Heap0@@0 Heap1@@0) (succHeap Heap1@@0 Heap2))) (succHeapTrans Heap0@@0 Heap2))
 :qid |stdinbpl.93:15|
 :skolemid |12|
 :pattern ( (succHeapTrans Heap0@@0 Heap1@@0) (succHeap Heap1@@0 Heap2))
)))
(assert  (and (and (= (Ctor FrameTypeType) 12) (= (type null) RefType)) (forall ((arg0@@28 T@U) ) (! (let ((A (FieldTypeInv0 (type arg0@@28))))
(= (type (PredicateMaskField arg0@@28)) (FieldType A (MapType1Type RefType boolType))))
 :qid |funType:PredicateMaskField|
 :pattern ( (PredicateMaskField arg0@@28))
))))
(assert (forall ((Heap@@2 T@U) (ExhaleHeap T@U) (Mask@@2 T@U) (pm_f T@U) ) (! (let ((C (FieldTypeInv0 (type pm_f))))
 (=> (and (and (and (and (and (= (type Heap@@2) (MapType0Type RefType)) (= (type ExhaleHeap) (MapType0Type RefType))) (= (type Mask@@2) (MapType1Type RefType realType))) (= (type pm_f) (FieldType C FrameTypeType))) (IdenticalOnKnownLocations Heap@@2 ExhaleHeap Mask@@2)) (and (HasDirectPerm Mask@@2 null pm_f) (IsPredicateField pm_f))) (= (MapType0Select Heap@@2 null (PredicateMaskField pm_f)) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))))
 :qid |stdinbpl.47:19|
 :skolemid |2|
 :pattern ( (IdenticalOnKnownLocations Heap@@2 ExhaleHeap Mask@@2) (IsPredicateField pm_f) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))
)))
(assert (forall ((arg0@@29 T@U) ) (! (let ((A@@0 (FieldTypeInv0 (type arg0@@29))))
(= (type (WandMaskField arg0@@29)) (FieldType A@@0 (MapType1Type RefType boolType))))
 :qid |funType:WandMaskField|
 :pattern ( (WandMaskField arg0@@29))
)))
(assert (forall ((Heap@@3 T@U) (ExhaleHeap@@0 T@U) (Mask@@3 T@U) (pm_f@@0 T@U) ) (! (let ((C@@0 (FieldTypeInv0 (type pm_f@@0))))
 (=> (and (and (and (and (and (= (type Heap@@3) (MapType0Type RefType)) (= (type ExhaleHeap@@0) (MapType0Type RefType))) (= (type Mask@@3) (MapType1Type RefType realType))) (= (type pm_f@@0) (FieldType C@@0 FrameTypeType))) (IdenticalOnKnownLocations Heap@@3 ExhaleHeap@@0 Mask@@3)) (and (HasDirectPerm Mask@@3 null pm_f@@0) (IsWandField pm_f@@0))) (= (MapType0Select Heap@@3 null (WandMaskField pm_f@@0)) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))))
 :qid |stdinbpl.60:19|
 :skolemid |5|
 :pattern ( (IdenticalOnKnownLocations Heap@@3 ExhaleHeap@@0 Mask@@3) (IsWandField pm_f@@0) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))
)))
(assert  (and (forall ((arg0@@30 T@U) (arg1@@11 Int) ) (! (= (type (|__prim__int___box__'| arg0@@30 arg1@@11)) RefType)
 :qid |funType:__prim__int___box__'|
 :pattern ( (|__prim__int___box__'| arg0@@30 arg1@@11))
)) (forall ((arg0@@31 Int) ) (! (= (type (|__prim__int___box__#triggerStateless| arg0@@31)) RefType)
 :qid |funType:__prim__int___box__#triggerStateless|
 :pattern ( (|__prim__int___box__#triggerStateless| arg0@@31))
))))
(assert (forall ((Heap@@4 T@U) (prim Int) ) (!  (=> (= (type Heap@@4) (MapType0Type RefType)) (dummyFunction (|__prim__int___box__#triggerStateless| prim)))
 :qid |stdinbpl.450:15|
 :skolemid |38|
 :pattern ( (|__prim__int___box__'| Heap@@4 prim))
)))
(assert (forall ((Heap@@5 T@U) (box T@U) ) (!  (=> (and (= (type Heap@@5) (MapType0Type RefType)) (= (type box) RefType)) (dummyFunction (int_2_U (|int___unbox__#triggerStateless| box))))
 :qid |stdinbpl.490:15|
 :skolemid |41|
 :pattern ( (|int___unbox__'| Heap@@5 box))
)))
(assert  (and (forall ((arg0@@32 T@U) (arg1@@12 Bool) ) (! (= (type (|__prim__bool___box__'| arg0@@32 arg1@@12)) RefType)
 :qid |funType:__prim__bool___box__'|
 :pattern ( (|__prim__bool___box__'| arg0@@32 arg1@@12))
)) (forall ((arg0@@33 Bool) ) (! (= (type (|__prim__bool___box__#triggerStateless| arg0@@33)) RefType)
 :qid |funType:__prim__bool___box__#triggerStateless|
 :pattern ( (|__prim__bool___box__#triggerStateless| arg0@@33))
))))
(assert (forall ((Heap@@6 T@U) (prim@@0 Bool) ) (!  (=> (= (type Heap@@6) (MapType0Type RefType)) (dummyFunction (|__prim__bool___box__#triggerStateless| prim@@0)))
 :qid |stdinbpl.531:15|
 :skolemid |44|
 :pattern ( (|__prim__bool___box__'| Heap@@6 prim@@0))
)))
(assert (forall ((Heap@@7 T@U) (box@@0 T@U) ) (!  (=> (and (= (type Heap@@7) (MapType0Type RefType)) (= (type box@@0) RefType)) (dummyFunction (bool_2_U (|bool___unbox__#triggerStateless| box@@0))))
 :qid |stdinbpl.607:15|
 :skolemid |50|
 :pattern ( (|bool___unbox__'| Heap@@7 box@@0))
)))
(assert (= (type EmptyFrame) FrameTypeType))
(assert (forall ((Heap@@8 T@U) (Mask@@4 T@U) (prim@@1 Bool) ) (!  (=> (and (and (= (type Heap@@8) (MapType0Type RefType)) (= (type Mask@@4) (MapType1Type RefType realType))) (and (state Heap@@8 Mask@@4) (or (< AssumeFunctionsAbove 4) (|__prim__bool___box__#trigger| EmptyFrame prim@@1)))) (= (bool___unbox__ Heap@@8 (|__prim__bool___box__'| Heap@@8 prim@@1)) prim@@1))
 :qid |stdinbpl.548:15|
 :skolemid |47|
 :pattern ( (state Heap@@8 Mask@@4) (|__prim__bool___box__'| Heap@@8 prim@@1))
)))
(assert (forall ((Heap@@9 T@U) (ExhaleHeap@@1 T@U) (Mask@@5 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@9) (MapType0Type RefType)) (= (type ExhaleHeap@@1) (MapType0Type RefType))) (= (type Mask@@5) (MapType1Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@9 ExhaleHeap@@1 Mask@@5)) (U_2_bool (MapType0Select Heap@@9 o_1 $allocated))) (U_2_bool (MapType0Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.73:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@9 ExhaleHeap@@1 Mask@@5) (MapType0Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert (forall ((Heap@@10 T@U) (prim@@2 Int) ) (!  (=> (= (type Heap@@10) (MapType0Type RefType)) (and (= (__prim__int___box__ Heap@@10 prim@@2) (|__prim__int___box__'| Heap@@10 prim@@2)) (dummyFunction (|__prim__int___box__#triggerStateless| prim@@2))))
 :qid |stdinbpl.446:15|
 :skolemid |37|
 :pattern ( (__prim__int___box__ Heap@@10 prim@@2))
)))
(assert (forall ((Heap@@11 T@U) (box@@1 T@U) ) (!  (=> (and (= (type Heap@@11) (MapType0Type RefType)) (= (type box@@1) RefType)) (and (= (int___unbox__ Heap@@11 box@@1) (|int___unbox__'| Heap@@11 box@@1)) (dummyFunction (int_2_U (|int___unbox__#triggerStateless| box@@1)))))
 :qid |stdinbpl.486:15|
 :skolemid |40|
 :pattern ( (int___unbox__ Heap@@11 box@@1))
)))
(assert (forall ((Heap@@12 T@U) (prim@@3 Bool) ) (!  (=> (= (type Heap@@12) (MapType0Type RefType)) (and (= (__prim__bool___box__ Heap@@12 prim@@3) (|__prim__bool___box__'| Heap@@12 prim@@3)) (dummyFunction (|__prim__bool___box__#triggerStateless| prim@@3))))
 :qid |stdinbpl.527:15|
 :skolemid |43|
 :pattern ( (__prim__bool___box__ Heap@@12 prim@@3))
)))
(assert (forall ((arg0@@34 T@U) ) (! (= (type (|SO_MANY_GLOBAL_VARS'| arg0@@34)) RefType)
 :qid |funType:SO_MANY_GLOBAL_VARS'|
 :pattern ( (|SO_MANY_GLOBAL_VARS'| arg0@@34))
)))
(assert (forall ((Heap@@13 T@U) (Mask@@6 T@U) ) (!  (=> (and (and (= (type Heap@@13) (MapType0Type RefType)) (= (type Mask@@6) (MapType1Type RefType realType))) (and (state Heap@@13 Mask@@6) (or (< AssumeFunctionsAbove 0) (|SO_MANY_GLOBAL_VARS#trigger| EmptyFrame)))) (= (|SO_MANY_GLOBAL_VARS'| Heap@@13) (ite (bool___unbox__ Heap@@13 (ANOTHER_GLOBAL_VAR Heap@@13)) (OTHER_GLOBAL_VAR Heap@@13) (__prim__int___box__ Heap@@13 44))))
 :qid |stdinbpl.360:15|
 :skolemid |36|
 :pattern ( (state Heap@@13 Mask@@6) (|SO_MANY_GLOBAL_VARS'| Heap@@13))
)))
(assert (forall ((arg0@@35 T@U) ) (! (= (type (|ANOTHER_GLOBAL_VAR'| arg0@@35)) RefType)
 :qid |funType:ANOTHER_GLOBAL_VAR'|
 :pattern ( (|ANOTHER_GLOBAL_VAR'| arg0@@35))
)))
(assert (forall ((Heap@@14 T@U) (Mask@@7 T@U) ) (!  (=> (and (and (= (type Heap@@14) (MapType0Type RefType)) (= (type Mask@@7) (MapType1Type RefType realType))) (and (state Heap@@14 Mask@@7) (or (< AssumeFunctionsAbove 1) (|ANOTHER_GLOBAL_VAR#trigger| EmptyFrame)))) (= (|ANOTHER_GLOBAL_VAR'| Heap@@14) (__prim__bool___box__ Heap@@14 true)))
 :qid |stdinbpl.277:15|
 :skolemid |30|
 :pattern ( (state Heap@@14 Mask@@7) (|ANOTHER_GLOBAL_VAR'| Heap@@14))
)))
(assert (forall ((Heap@@15 T@U) (ExhaleHeap@@2 T@U) (Mask@@8 T@U) (o_1@@0 T@U) (f_2 T@U) ) (! (let ((B@@1 (FieldTypeInv1 (type f_2))))
(let ((A@@1 (FieldTypeInv0 (type f_2))))
 (=> (and (and (and (and (and (and (= (type Heap@@15) (MapType0Type RefType)) (= (type ExhaleHeap@@2) (MapType0Type RefType))) (= (type Mask@@8) (MapType1Type RefType realType))) (= (type o_1@@0) RefType)) (= (type f_2) (FieldType A@@1 B@@1))) (IdenticalOnKnownLocations Heap@@15 ExhaleHeap@@2 Mask@@8)) (HasDirectPerm Mask@@8 o_1@@0 f_2)) (= (MapType0Select Heap@@15 o_1@@0 f_2) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2)))))
 :qid |stdinbpl.42:22|
 :skolemid |1|
 :pattern ( (IdenticalOnKnownLocations Heap@@15 ExhaleHeap@@2 Mask@@8) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2))
)))
(assert (forall ((arg0@@36 T@U) ) (! (= (type (typeof arg0@@36)) PyTypeDomainTypeType)
 :qid |funType:typeof|
 :pattern ( (typeof arg0@@36))
)))
(assert (forall ((Heap@@16 T@U) (Mask@@9 T@U) ) (!  (=> (and (and (= (type Heap@@16) (MapType0Type RefType)) (= (type Mask@@9) (MapType1Type RefType realType))) (and (state Heap@@16 Mask@@9) (or (< AssumeFunctionsAbove 0) (|SO_MANY_GLOBAL_VARS#trigger| EmptyFrame)))) (issubtype (typeof (|SO_MANY_GLOBAL_VARS'| Heap@@16)) vint))
 :qid |stdinbpl.356:15|
 :skolemid |35|
 :pattern ( (state Heap@@16 Mask@@9) (|SO_MANY_GLOBAL_VARS'| Heap@@16))
)))
(assert (forall ((Heap@@17 T@U) (Mask@@10 T@U) ) (!  (=> (and (and (= (type Heap@@17) (MapType0Type RefType)) (= (type Mask@@10) (MapType1Type RefType realType))) (and (state Heap@@17 Mask@@10) (or (< AssumeFunctionsAbove 1) (|ANOTHER_GLOBAL_VAR#trigger| EmptyFrame)))) (issubtype (typeof (|ANOTHER_GLOBAL_VAR'| Heap@@17)) vbool))
 :qid |stdinbpl.273:15|
 :skolemid |29|
 :pattern ( (state Heap@@17 Mask@@10) (|ANOTHER_GLOBAL_VAR'| Heap@@17))
)))
(assert  (and (= (type dummyHeap) (MapType0Type RefType)) (= (type ZeroMask) (MapType1Type RefType realType))))
(assert (state dummyHeap ZeroMask))
(assert (forall ((p T@U) (v_1 T@U) (w T@U) ) (! (let ((A@@2 (FieldTypeInv0 (type p))))
 (=> (and (and (= (type p) (FieldType A@@2 FrameTypeType)) (= (type v_1) FrameTypeType)) (= (type w) FrameTypeType)) (not (InsidePredicate p v_1 p w))))
 :qid |stdinbpl.179:19|
 :skolemid |21|
 :pattern ( (InsidePredicate p v_1 p w))
)))
(assert (forall ((Heap@@18 T@U) (ExhaleHeap@@3 T@U) (Mask@@11 T@U) ) (!  (=> (and (and (and (= (type Heap@@18) (MapType0Type RefType)) (= (type ExhaleHeap@@3) (MapType0Type RefType))) (= (type Mask@@11) (MapType1Type RefType realType))) (IdenticalOnKnownLocations Heap@@18 ExhaleHeap@@3 Mask@@11)) (succHeap Heap@@18 ExhaleHeap@@3))
 :qid |stdinbpl.83:15|
 :skolemid |10|
 :pattern ( (IdenticalOnKnownLocations Heap@@18 ExhaleHeap@@3 Mask@@11))
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
(assert (forall ((arg0@@37 Real) (arg1@@13 T@U) ) (! (= (type (ConditionalFrame arg0@@37 arg1@@13)) FrameTypeType)
 :qid |funType:ConditionalFrame|
 :pattern ( (ConditionalFrame arg0@@37 arg1@@13))
)))
(assert (forall ((p@@0 Real) (f_6 T@U) ) (!  (=> (= (type f_6) FrameTypeType) (= (ConditionalFrame p@@0 f_6) (ite (> p@@0 0.0) f_6 EmptyFrame)))
 :qid |stdinbpl.167:15|
 :skolemid |19|
 :pattern ( (ConditionalFrame p@@0 f_6))
)))
(assert  (and (forall ((arg0@@38 T@U) ) (! (= (type (|OTHER_GLOBAL_VAR'| arg0@@38)) RefType)
 :qid |funType:OTHER_GLOBAL_VAR'|
 :pattern ( (|OTHER_GLOBAL_VAR'| arg0@@38))
)) (= (type |OTHER_GLOBAL_VAR#triggerStateless|) RefType)))
(assert (forall ((Heap@@19 T@U) ) (!  (=> (= (type Heap@@19) (MapType0Type RefType)) (and (= (OTHER_GLOBAL_VAR Heap@@19) (|OTHER_GLOBAL_VAR'| Heap@@19)) (dummyFunction |OTHER_GLOBAL_VAR#triggerStateless|)))
 :qid |stdinbpl.210:15|
 :skolemid |22|
 :pattern ( (OTHER_GLOBAL_VAR Heap@@19))
)))
(assert (= (type |ANOTHER_GLOBAL_VAR#triggerStateless|) RefType))
(assert (forall ((Heap@@20 T@U) ) (!  (=> (= (type Heap@@20) (MapType0Type RefType)) (and (= (ANOTHER_GLOBAL_VAR Heap@@20) (|ANOTHER_GLOBAL_VAR'| Heap@@20)) (dummyFunction |ANOTHER_GLOBAL_VAR#triggerStateless|)))
 :qid |stdinbpl.250:15|
 :skolemid |25|
 :pattern ( (ANOTHER_GLOBAL_VAR Heap@@20))
)))
(assert (= (type |SO_MANY_GLOBAL_VARS#triggerStateless|) RefType))
(assert (forall ((Heap@@21 T@U) ) (!  (=> (= (type Heap@@21) (MapType0Type RefType)) (and (= (SO_MANY_GLOBAL_VARS Heap@@21) (|SO_MANY_GLOBAL_VARS'| Heap@@21)) (dummyFunction |SO_MANY_GLOBAL_VARS#triggerStateless|)))
 :qid |stdinbpl.333:15|
 :skolemid |31|
 :pattern ( (SO_MANY_GLOBAL_VARS Heap@@21))
)))
(assert (forall ((Mask@@12 T@U) (o_2@@0 T@U) (f_4@@0 T@U) ) (! (let ((B@@3 (FieldTypeInv1 (type f_4@@0))))
(let ((A@@4 (FieldTypeInv0 (type f_4@@0))))
 (=> (and (and (= (type Mask@@12) (MapType1Type RefType realType)) (= (type o_2@@0) RefType)) (= (type f_4@@0) (FieldType A@@4 B@@3))) (= (HasDirectPerm Mask@@12 o_2@@0 f_4@@0) (> (U_2_real (MapType1Select Mask@@12 o_2@@0 f_4@@0)) NoPerm)))))
 :qid |stdinbpl.133:22|
 :skolemid |17|
 :pattern ( (HasDirectPerm Mask@@12 o_2@@0 f_4@@0))
)))
(assert (forall ((o_2@@1 T@U) (f_4@@1 T@U) ) (! (let ((B@@4 (FieldTypeInv1 (type f_4@@1))))
(let ((A@@5 (FieldTypeInv0 (type f_4@@1))))
 (=> (and (= (type o_2@@1) RefType) (= (type f_4@@1) (FieldType A@@5 B@@4))) (= (U_2_real (MapType1Select ZeroMask o_2@@1 f_4@@1)) NoPerm))))
 :qid |stdinbpl.106:22|
 :skolemid |13|
 :pattern ( (MapType1Select ZeroMask o_2@@1 f_4@@1))
)))
(assert (forall ((Heap@@22 T@U) (Mask@@13 T@U) (box@@2 T@U) ) (!  (=> (and (and (and (= (type Heap@@22) (MapType0Type RefType)) (= (type Mask@@13) (MapType1Type RefType realType))) (= (type box@@2) RefType)) (state Heap@@22 Mask@@13)) (= (|bool___unbox__'| Heap@@22 box@@2) (|bool___unbox__#frame| EmptyFrame box@@2)))
 :qid |stdinbpl.614:15|
 :skolemid |51|
 :pattern ( (state Heap@@22 Mask@@13) (|bool___unbox__'| Heap@@22 box@@2))
)))
(assert (forall ((Heap@@23 T@U) (box@@3 T@U) ) (!  (=> (and (= (type Heap@@23) (MapType0Type RefType)) (= (type box@@3) RefType)) (and (= (bool___unbox__ Heap@@23 box@@3) (|bool___unbox__'| Heap@@23 box@@3)) (dummyFunction (bool_2_U (|bool___unbox__#triggerStateless| box@@3)))))
 :qid |stdinbpl.603:15|
 :skolemid |49|
 :pattern ( (bool___unbox__ Heap@@23 box@@3))
)))
(assert (forall ((Heap@@24 T@U) (Mask@@14 T@U) (prim@@4 Bool) ) (!  (=> (and (and (= (type Heap@@24) (MapType0Type RefType)) (= (type Mask@@14) (MapType1Type RefType realType))) (and (state Heap@@24 Mask@@14) (or (< AssumeFunctionsAbove 4) (|__prim__bool___box__#trigger| EmptyFrame prim@@4)))) (= (int___unbox__ Heap@@24 (|__prim__bool___box__'| Heap@@24 prim@@4)) (ite prim@@4 1 0)))
 :qid |stdinbpl.552:15|
 :skolemid |48|
 :pattern ( (state Heap@@24 Mask@@14) (|__prim__bool___box__'| Heap@@24 prim@@4))
)))
(assert (forall ((Heap@@25 T@U) (ExhaleHeap@@4 T@U) (Mask@@15 T@U) (pm_f@@1 T@U) ) (! (let ((C@@1 (FieldTypeInv0 (type pm_f@@1))))
 (=> (and (and (and (and (and (= (type Heap@@25) (MapType0Type RefType)) (= (type ExhaleHeap@@4) (MapType0Type RefType))) (= (type Mask@@15) (MapType1Type RefType realType))) (= (type pm_f@@1) (FieldType C@@1 FrameTypeType))) (IdenticalOnKnownLocations Heap@@25 ExhaleHeap@@4 Mask@@15)) (and (HasDirectPerm Mask@@15 null pm_f@@1) (IsPredicateField pm_f@@1))) (forall ((o2 T@U) (f_2@@0 T@U) ) (! (let ((B@@5 (FieldTypeInv1 (type f_2@@0))))
(let ((A@@6 (FieldTypeInv0 (type f_2@@0))))
 (=> (and (and (= (type o2) RefType) (= (type f_2@@0) (FieldType A@@6 B@@5))) (U_2_bool (MapType1Select (MapType0Select Heap@@25 null (PredicateMaskField pm_f@@1)) o2 f_2@@0))) (= (MapType0Select Heap@@25 o2 f_2@@0) (MapType0Select ExhaleHeap@@4 o2 f_2@@0)))))
 :qid |stdinbpl.54:134|
 :skolemid |3|
 :pattern ( (MapType0Select ExhaleHeap@@4 o2 f_2@@0))
))))
 :qid |stdinbpl.52:19|
 :skolemid |4|
 :pattern ( (IdenticalOnKnownLocations Heap@@25 ExhaleHeap@@4 Mask@@15) (IsPredicateField pm_f@@1))
)))
(assert (forall ((Heap@@26 T@U) (ExhaleHeap@@5 T@U) (Mask@@16 T@U) (pm_f@@2 T@U) ) (! (let ((C@@2 (FieldTypeInv0 (type pm_f@@2))))
 (=> (and (and (and (and (and (= (type Heap@@26) (MapType0Type RefType)) (= (type ExhaleHeap@@5) (MapType0Type RefType))) (= (type Mask@@16) (MapType1Type RefType realType))) (= (type pm_f@@2) (FieldType C@@2 FrameTypeType))) (IdenticalOnKnownLocations Heap@@26 ExhaleHeap@@5 Mask@@16)) (and (HasDirectPerm Mask@@16 null pm_f@@2) (IsWandField pm_f@@2))) (forall ((o2@@0 T@U) (f_2@@1 T@U) ) (! (let ((B@@6 (FieldTypeInv1 (type f_2@@1))))
(let ((A@@7 (FieldTypeInv0 (type f_2@@1))))
 (=> (and (and (= (type o2@@0) RefType) (= (type f_2@@1) (FieldType A@@7 B@@6))) (U_2_bool (MapType1Select (MapType0Select Heap@@26 null (WandMaskField pm_f@@2)) o2@@0 f_2@@1))) (= (MapType0Select Heap@@26 o2@@0 f_2@@1) (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1)))))
 :qid |stdinbpl.67:129|
 :skolemid |6|
 :pattern ( (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1))
))))
 :qid |stdinbpl.65:19|
 :skolemid |7|
 :pattern ( (IdenticalOnKnownLocations Heap@@26 ExhaleHeap@@5 Mask@@16) (IsWandField pm_f@@2))
)))
(assert (forall ((Mask@@17 T@U) (o_2@@2 T@U) (f_4@@2 T@U) ) (! (let ((B@@7 (FieldTypeInv1 (type f_4@@2))))
(let ((A@@8 (FieldTypeInv0 (type f_4@@2))))
 (=> (and (and (and (= (type Mask@@17) (MapType1Type RefType realType)) (= (type o_2@@2) RefType)) (= (type f_4@@2) (FieldType A@@8 B@@7))) (GoodMask Mask@@17)) (and (>= (U_2_real (MapType1Select Mask@@17 o_2@@2 f_4@@2)) NoPerm) (=> (and (and (GoodMask Mask@@17) (not (IsPredicateField f_4@@2))) (not (IsWandField f_4@@2))) (<= (U_2_real (MapType1Select Mask@@17 o_2@@2 f_4@@2)) FullPerm))))))
 :qid |stdinbpl.128:22|
 :skolemid |16|
 :pattern ( (GoodMask Mask@@17) (MapType1Select Mask@@17 o_2@@2 f_4@@2))
)))
(assert (forall ((arg0@@39 T@U) (arg1@@14 Int) ) (! (= (type (|__prim__int___box__#frame| arg0@@39 arg1@@14)) RefType)
 :qid |funType:__prim__int___box__#frame|
 :pattern ( (|__prim__int___box__#frame| arg0@@39 arg1@@14))
)))
(assert (forall ((Heap@@27 T@U) (Mask@@18 T@U) (prim@@5 Int) ) (!  (=> (and (and (= (type Heap@@27) (MapType0Type RefType)) (= (type Mask@@18) (MapType1Type RefType realType))) (state Heap@@27 Mask@@18)) (= (|__prim__int___box__'| Heap@@27 prim@@5) (|__prim__int___box__#frame| EmptyFrame prim@@5)))
 :qid |stdinbpl.457:15|
 :skolemid |39|
 :pattern ( (state Heap@@27 Mask@@18) (|__prim__int___box__'| Heap@@27 prim@@5))
)))
(assert (forall ((Heap@@28 T@U) (Mask@@19 T@U) (box@@4 T@U) ) (!  (=> (and (and (and (= (type Heap@@28) (MapType0Type RefType)) (= (type Mask@@19) (MapType1Type RefType realType))) (= (type box@@4) RefType)) (state Heap@@28 Mask@@19)) (= (|int___unbox__'| Heap@@28 box@@4) (|int___unbox__#frame| EmptyFrame box@@4)))
 :qid |stdinbpl.497:15|
 :skolemid |42|
 :pattern ( (state Heap@@28 Mask@@19) (|int___unbox__'| Heap@@28 box@@4))
)))
(assert (forall ((arg0@@40 T@U) (arg1@@15 Bool) ) (! (= (type (|__prim__bool___box__#frame| arg0@@40 arg1@@15)) RefType)
 :qid |funType:__prim__bool___box__#frame|
 :pattern ( (|__prim__bool___box__#frame| arg0@@40 arg1@@15))
)))
(assert (forall ((Heap@@29 T@U) (Mask@@20 T@U) (prim@@6 Bool) ) (!  (=> (and (and (= (type Heap@@29) (MapType0Type RefType)) (= (type Mask@@20) (MapType1Type RefType realType))) (state Heap@@29 Mask@@20)) (= (|__prim__bool___box__'| Heap@@29 prim@@6) (|__prim__bool___box__#frame| EmptyFrame prim@@6)))
 :qid |stdinbpl.538:15|
 :skolemid |45|
 :pattern ( (state Heap@@29 Mask@@20) (|__prim__bool___box__'| Heap@@29 prim@@6))
)))
(assert (forall ((Heap@@30 T@U) ) (!  (=> (= (type Heap@@30) (MapType0Type RefType)) (dummyFunction |OTHER_GLOBAL_VAR#triggerStateless|))
 :qid |stdinbpl.214:15|
 :skolemid |23|
 :pattern ( (|OTHER_GLOBAL_VAR'| Heap@@30))
)))
(assert (forall ((Heap@@31 T@U) ) (!  (=> (= (type Heap@@31) (MapType0Type RefType)) (dummyFunction |ANOTHER_GLOBAL_VAR#triggerStateless|))
 :qid |stdinbpl.254:15|
 :skolemid |26|
 :pattern ( (|ANOTHER_GLOBAL_VAR'| Heap@@31))
)))
(assert (forall ((Heap@@32 T@U) ) (!  (=> (= (type Heap@@32) (MapType0Type RefType)) (dummyFunction |SO_MANY_GLOBAL_VARS#triggerStateless|))
 :qid |stdinbpl.337:15|
 :skolemid |32|
 :pattern ( (|SO_MANY_GLOBAL_VARS'| Heap@@32))
)))
(assert (forall ((o T@U) (f T@U) (Heap@@33 T@U) ) (!  (=> (and (and (and (= (type o) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap@@33) (MapType0Type RefType))) (U_2_bool (MapType0Select Heap@@33 o $allocated))) (U_2_bool (MapType0Select Heap@@33 (MapType0Select Heap@@33 o f) $allocated)))
 :qid |stdinbpl.31:15|
 :skolemid |0|
 :pattern ( (MapType0Select Heap@@33 o f))
)))
(assert (forall ((arg0@@41 T@U) ) (! (= (type (|OTHER_GLOBAL_VAR#frame| arg0@@41)) RefType)
 :qid |funType:OTHER_GLOBAL_VAR#frame|
 :pattern ( (|OTHER_GLOBAL_VAR#frame| arg0@@41))
)))
(assert (forall ((Heap@@34 T@U) (Mask@@21 T@U) ) (!  (=> (and (and (= (type Heap@@34) (MapType0Type RefType)) (= (type Mask@@21) (MapType1Type RefType realType))) (state Heap@@34 Mask@@21)) (= (|OTHER_GLOBAL_VAR'| Heap@@34) (|OTHER_GLOBAL_VAR#frame| EmptyFrame)))
 :qid |stdinbpl.221:15|
 :skolemid |24|
 :pattern ( (state Heap@@34 Mask@@21) (|OTHER_GLOBAL_VAR'| Heap@@34))
)))
(assert (forall ((arg0@@42 T@U) ) (! (= (type (|ANOTHER_GLOBAL_VAR#frame| arg0@@42)) RefType)
 :qid |funType:ANOTHER_GLOBAL_VAR#frame|
 :pattern ( (|ANOTHER_GLOBAL_VAR#frame| arg0@@42))
)))
(assert (forall ((Heap@@35 T@U) (Mask@@22 T@U) ) (!  (=> (and (and (= (type Heap@@35) (MapType0Type RefType)) (= (type Mask@@22) (MapType1Type RefType realType))) (state Heap@@35 Mask@@22)) (= (|ANOTHER_GLOBAL_VAR'| Heap@@35) (|ANOTHER_GLOBAL_VAR#frame| EmptyFrame)))
 :qid |stdinbpl.267:15|
 :skolemid |28|
 :pattern ( (state Heap@@35 Mask@@22) (|ANOTHER_GLOBAL_VAR'| Heap@@35))
)))
(assert (forall ((arg0@@43 T@U) ) (! (= (type (|SO_MANY_GLOBAL_VARS#frame| arg0@@43)) RefType)
 :qid |funType:SO_MANY_GLOBAL_VARS#frame|
 :pattern ( (|SO_MANY_GLOBAL_VARS#frame| arg0@@43))
)))
(assert (forall ((Heap@@36 T@U) (Mask@@23 T@U) ) (!  (=> (and (and (= (type Heap@@36) (MapType0Type RefType)) (= (type Mask@@23) (MapType1Type RefType realType))) (state Heap@@36 Mask@@23)) (= (|SO_MANY_GLOBAL_VARS'| Heap@@36) (|SO_MANY_GLOBAL_VARS#frame| EmptyFrame)))
 :qid |stdinbpl.350:15|
 :skolemid |34|
 :pattern ( (state Heap@@36 Mask@@23) (|SO_MANY_GLOBAL_VARS'| Heap@@36))
)))
(assert (forall ((Heap@@37 T@U) (o@@0 T@U) (f_3 T@U) (v T@U) ) (! (let ((B@@8 (type v)))
(let ((A@@9 (FieldTypeInv0 (type f_3))))
 (=> (and (and (= (type Heap@@37) (MapType0Type RefType)) (= (type o@@0) RefType)) (= (type f_3) (FieldType A@@9 B@@8))) (succHeap Heap@@37 (MapType0Store Heap@@37 o@@0 f_3 v)))))
 :qid |stdinbpl.78:22|
 :skolemid |9|
 :pattern ( (MapType0Store Heap@@37 o@@0 f_3 v))
)))
(assert (forall ((Heap@@38 T@U) (Mask@@24 T@U) (prim@@7 Bool) ) (!  (=> (and (and (= (type Heap@@38) (MapType0Type RefType)) (= (type Mask@@24) (MapType1Type RefType realType))) (and (state Heap@@38 Mask@@24) (or (< AssumeFunctionsAbove 4) (|__prim__bool___box__#trigger| EmptyFrame prim@@7)))) (= (typeof (|__prim__bool___box__'| Heap@@38 prim@@7)) vbool))
 :qid |stdinbpl.544:15|
 :skolemid |46|
 :pattern ( (state Heap@@38 Mask@@24) (|__prim__bool___box__'| Heap@@38 prim@@7))
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
 :qid |stdinbpl.174:25|
 :skolemid |20|
 :pattern ( (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
(push 1)
(declare-fun ControlFlow (Int Int) Int)
(set-info :boogie-vc-id |OTHER_GLOBAL_VAR#definedness|)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 2) true)
))
(check-sat)
(pop 1)
; Valid
(get-info :rlimit)
