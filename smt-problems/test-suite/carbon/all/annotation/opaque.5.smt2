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
(declare-fun f_7 () T@U)
(declare-fun FieldType (T@T T@T) T@T)
(declare-fun FieldTypeInv0 (T@T) T@T)
(declare-fun FieldTypeInv1 (T@T) T@T)
(declare-fun NormalFieldType () T@T)
(declare-fun state (T@U T@U) Bool)
(declare-fun |isGreaterOne34'| (T@U T@U) Bool)
(declare-fun MapType0Type (T@T) T@T)
(declare-fun RefType () T@T)
(declare-fun MapType1Type (T@T T@T) T@T)
(declare-fun AssumeFunctionsAbove () Int)
(declare-fun |isGreaterOne34#trigger| (T@U T@U) Bool)
(declare-fun FrameFragment (T@U) T@U)
(declare-fun MapType0Select (T@U T@U T@U) T@U)
(declare-fun MapType0TypeInv0 (T@T) T@T)
(declare-fun MapType0Store (T@U T@U T@U T@U) T@U)
(declare-fun MapType1TypeInv0 (T@T) T@T)
(declare-fun MapType1TypeInv1 (T@T) T@T)
(declare-fun MapType1Select (T@U T@U T@U) T@U)
(declare-fun MapType1Store (T@U T@U T@U T@U) T@U)
(declare-fun FrameTypeType () T@T)
(declare-fun |isGreaterOne2'| (T@U T@U) Bool)
(declare-fun |isGreaterOne2#trigger| (T@U T@U) Bool)
(declare-fun |isGreaterOne35'| (T@U T@U) Bool)
(declare-fun |isGreaterOne35#trigger| (T@U T@U) Bool)
(declare-fun |isGreaterOne22'| (T@U T@U) Bool)
(declare-fun |isGreaterOne22#trigger| (T@U T@U) Bool)
(declare-fun |isGreaterOne3'| (T@U T@U) Bool)
(declare-fun |isGreaterOne3#trigger| (T@U T@U) Bool)
(declare-fun |isGreaterOne32'| (T@U T@U) Bool)
(declare-fun |isGreaterOne32#trigger| (T@U T@U) Bool)
(declare-fun succHeap (T@U T@U) Bool)
(declare-fun succHeapTrans (T@U T@U) Bool)
(declare-fun GoodMask (T@U) Bool)
(declare-fun IdenticalOnKnownLocations (T@U T@U T@U) Bool)
(declare-fun IsPredicateField (T@U) Bool)
(declare-fun null () T@U)
(declare-fun PredicateMaskField (T@U) T@U)
(declare-fun HasDirectPerm (T@U T@U T@U) Bool)
(declare-fun IsWandField (T@U) Bool)
(declare-fun WandMaskField (T@U) T@U)
(declare-fun P (T@U) T@U)
(declare-fun PredicateType_PType () T@T)
(declare-fun |isGreaterOne'| (T@U Int) Bool)
(declare-fun dummyFunction (T@U) Bool)
(declare-fun |isGreaterOne#triggerStateless| (Int) Bool)
(declare-fun |isGreaterOne2#triggerStateless| (T@U) Bool)
(declare-fun |isGreaterOne22#triggerStateless| (T@U) Bool)
(declare-fun |isGreaterOne3#triggerStateless| (T@U) Bool)
(declare-fun |isGreaterOne32#triggerStateless| (T@U) Bool)
(declare-fun |isGreaterOne33'| (T@U T@U) Bool)
(declare-fun |isGreaterOne33#triggerStateless| (T@U) Bool)
(declare-fun |isGreaterOne34#triggerStateless| (T@U) Bool)
(declare-fun |isGreaterOne35#triggerStateless| (T@U) Bool)
(declare-fun |fac1'| (T@U Int) Int)
(declare-fun |fac1#triggerStateless| (Int) Int)
(declare-fun |fac2'| (T@U Int) Int)
(declare-fun |fac2#triggerStateless| (Int) Int)
(declare-fun |fac3'| (T@U Int) Int)
(declare-fun |fac3#triggerStateless| (Int) Int)
(declare-fun |funP'| (T@U T@U) Int)
(declare-fun |funP#triggerStateless| (T@U) Int)
(declare-fun |funP2'| (T@U T@U) Int)
(declare-fun |funP2#triggerStateless| (T@U) Int)
(declare-fun |P#trigger| (T@U T@U) Bool)
(declare-fun |P#everUsed| (T@U) Bool)
(declare-fun fac1 (T@U Int) Int)
(declare-fun fac2 (T@U Int) Int)
(declare-fun fac3 (T@U Int) Int)
(declare-fun funP (T@U T@U) Int)
(declare-fun funP2 (T@U T@U) Int)
(declare-fun isGreaterOne (T@U Int) Bool)
(declare-fun |P#sm| (T@U) T@U)
(declare-fun dummyHeap () T@U)
(declare-fun ZeroMask () T@U)
(declare-fun InsidePredicate (T@U T@U T@U T@U) Bool)
(declare-fun |isGreaterOne33#trigger| (T@U T@U) Bool)
(declare-fun sumMask (T@U T@U T@U) Bool)
(declare-fun isGreaterOne34 (T@U T@U) Bool)
(declare-fun isGreaterOne2 (T@U T@U) Bool)
(declare-fun isGreaterOne35 (T@U T@U) Bool)
(declare-fun isGreaterOne22 (T@U T@U) Bool)
(declare-fun isGreaterOne3 (T@U T@U) Bool)
(declare-fun isGreaterOne32 (T@U T@U) Bool)
(declare-fun ConditionalFrame (Real T@U) T@U)
(declare-fun EmptyFrame () T@U)
(declare-fun NoPerm () Real)
(declare-fun |isGreaterOne#frame| (T@U Int) Bool)
(declare-fun |isGreaterOne#trigger| (T@U Int) Bool)
(declare-fun |isGreaterOne2#frame| (T@U T@U) Bool)
(declare-fun |isGreaterOne22#frame| (T@U T@U) Bool)
(declare-fun |isGreaterOne3#frame| (T@U T@U) Bool)
(declare-fun |isGreaterOne32#frame| (T@U T@U) Bool)
(declare-fun |isGreaterOne33#frame| (T@U T@U) Bool)
(declare-fun |isGreaterOne34#frame| (T@U T@U) Bool)
(declare-fun |isGreaterOne35#frame| (T@U T@U) Bool)
(declare-fun isGreaterOne33 (T@U T@U) Bool)
(declare-fun getPredWandId (T@U) Int)
(declare-fun FullPerm () Real)
(declare-fun |fac1#frame| (T@U Int) Int)
(declare-fun |fac2#frame| (T@U Int) Int)
(declare-fun |fac3#frame| (T@U Int) Int)
(declare-fun |funP#frame| (T@U T@U) Int)
(declare-fun |funP2#frame| (T@U T@U) Int)
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
))) (= (Ctor NormalFieldType) 7)) (= (type $allocated) (FieldType NormalFieldType boolType))) (= (type f_7) (FieldType NormalFieldType intType))))
(assert (distinct $allocated f_7)
)
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (forall ((arg0@@14 T@T) ) (! (= (Ctor (MapType0Type arg0@@14)) 8)
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
)))) (= (Ctor RefType) 9)) (forall ((arg0@@18 T@T) (arg1@@4 T@T) ) (! (= (Ctor (MapType1Type arg0@@18 arg1@@4)) 10)
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
)))) (= (Ctor FrameTypeType) 11)) (forall ((arg0@@23 T@U) ) (! (= (type (FrameFragment arg0@@23)) FrameTypeType)
 :qid |funType:FrameFragment|
 :pattern ( (FrameFragment arg0@@23))
))))
(assert (forall ((Heap T@U) (Mask T@U) (r_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap) (MapType0Type RefType)) (= (type Mask) (MapType1Type RefType realType))) (= (type r_1) RefType)) (and (state Heap Mask) (or (< AssumeFunctionsAbove 1) (|isGreaterOne34#trigger| (FrameFragment (MapType0Select Heap r_1 f_7)) r_1)))) (> (U_2_int (MapType0Select Heap r_1 f_7)) (- 0 38))) (> (U_2_int (MapType0Select Heap r_1 f_7)) 60)) (|isGreaterOne34'| Heap r_1))
 :qid |stdinbpl.802:15|
 :skolemid |58|
 :pattern ( (state Heap Mask) (|isGreaterOne34'| Heap r_1))
)))
(assert (forall ((Heap@@0 T@U) (Mask@@0 T@U) (r_1@@0 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@0) (MapType0Type RefType)) (= (type Mask@@0) (MapType1Type RefType realType))) (= (type r_1@@0) RefType)) (and (state Heap@@0 Mask@@0) (or (< AssumeFunctionsAbove 2) (|isGreaterOne2#trigger| (FrameFragment (MapType0Select Heap@@0 r_1@@0 f_7)) r_1@@0)))) (> (U_2_int (MapType0Select Heap@@0 r_1@@0 f_7)) (- 0 38))) (> (U_2_int (MapType0Select Heap@@0 r_1@@0 f_7)) 60)) (|isGreaterOne2'| Heap@@0 r_1@@0))
 :qid |stdinbpl.297:15|
 :skolemid |31|
 :pattern ( (state Heap@@0 Mask@@0) (|isGreaterOne2'| Heap@@0 r_1@@0))
)))
(assert (forall ((Heap@@1 T@U) (Mask@@1 T@U) (r_1@@1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@1) (MapType0Type RefType)) (= (type Mask@@1) (MapType1Type RefType realType))) (= (type r_1@@1) RefType)) (and (state Heap@@1 Mask@@1) (or (< AssumeFunctionsAbove 3) (|isGreaterOne35#trigger| (FrameFragment (MapType0Select Heap@@1 r_1@@1 f_7)) r_1@@1)))) (> (U_2_int (MapType0Select Heap@@1 r_1@@1 f_7)) (- 0 38))) (> (U_2_int (MapType0Select Heap@@1 r_1@@1 f_7)) 60)) (|isGreaterOne35'| Heap@@1 r_1@@1))
 :qid |stdinbpl.900:15|
 :skolemid |63|
 :pattern ( (state Heap@@1 Mask@@1) (|isGreaterOne35'| Heap@@1 r_1@@1))
)))
(assert (forall ((Heap@@2 T@U) (Mask@@2 T@U) (r_1@@2 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@2) (MapType0Type RefType)) (= (type Mask@@2) (MapType1Type RefType realType))) (= (type r_1@@2) RefType)) (and (state Heap@@2 Mask@@2) (or (< AssumeFunctionsAbove 5) (|isGreaterOne22#trigger| (FrameFragment (MapType0Select Heap@@2 r_1@@2 f_7)) r_1@@2)))) (> (U_2_int (MapType0Select Heap@@2 r_1@@2 f_7)) (- 0 38))) (> (U_2_int (MapType0Select Heap@@2 r_1@@2 f_7)) 60)) (|isGreaterOne22'| Heap@@2 r_1@@2))
 :qid |stdinbpl.395:15|
 :skolemid |36|
 :pattern ( (state Heap@@2 Mask@@2) (|isGreaterOne22'| Heap@@2 r_1@@2))
)))
(assert (forall ((Heap@@3 T@U) (Mask@@3 T@U) (r_1@@3 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@3) (MapType0Type RefType)) (= (type Mask@@3) (MapType1Type RefType realType))) (= (type r_1@@3) RefType)) (and (state Heap@@3 Mask@@3) (or (< AssumeFunctionsAbove 8) (|isGreaterOne3#trigger| (FrameFragment (MapType0Select Heap@@3 r_1@@3 f_7)) r_1@@3)))) (> (U_2_int (MapType0Select Heap@@3 r_1@@3 f_7)) (- 0 38))) (> (U_2_int (MapType0Select Heap@@3 r_1@@3 f_7)) 60)) (|isGreaterOne3'| Heap@@3 r_1@@3))
 :qid |stdinbpl.503:15|
 :skolemid |42|
 :pattern ( (state Heap@@3 Mask@@3) (|isGreaterOne3'| Heap@@3 r_1@@3))
)))
(assert (forall ((Heap@@4 T@U) (Mask@@4 T@U) (r_1@@4 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@4) (MapType0Type RefType)) (= (type Mask@@4) (MapType1Type RefType realType))) (= (type r_1@@4) RefType)) (and (state Heap@@4 Mask@@4) (or (< AssumeFunctionsAbove 11) (|isGreaterOne32#trigger| (FrameFragment (MapType0Select Heap@@4 r_1@@4 f_7)) r_1@@4)))) (> (U_2_int (MapType0Select Heap@@4 r_1@@4 f_7)) (- 0 38))) (> (U_2_int (MapType0Select Heap@@4 r_1@@4 f_7)) 60)) (|isGreaterOne32'| Heap@@4 r_1@@4))
 :qid |stdinbpl.601:15|
 :skolemid |47|
 :pattern ( (state Heap@@4 Mask@@4) (|isGreaterOne32'| Heap@@4 r_1@@4))
)))
(assert (forall ((Heap0 T@U) (Heap1 T@U) ) (!  (=> (and (and (= (type Heap0) (MapType0Type RefType)) (= (type Heap1) (MapType0Type RefType))) (succHeap Heap0 Heap1)) (succHeapTrans Heap0 Heap1))
 :qid |stdinbpl.88:15|
 :skolemid |11|
 :pattern ( (succHeap Heap0 Heap1))
)))
(assert (forall ((Heap@@5 T@U) (Mask@@5 T@U) ) (!  (=> (and (and (= (type Heap@@5) (MapType0Type RefType)) (= (type Mask@@5) (MapType1Type RefType realType))) (state Heap@@5 Mask@@5)) (GoodMask Mask@@5))
 :qid |stdinbpl.124:15|
 :skolemid |15|
 :pattern ( (state Heap@@5 Mask@@5))
)))
(assert (forall ((Heap0@@0 T@U) (Heap1@@0 T@U) (Heap2 T@U) ) (!  (=> (and (and (and (= (type Heap0@@0) (MapType0Type RefType)) (= (type Heap1@@0) (MapType0Type RefType))) (= (type Heap2) (MapType0Type RefType))) (and (succHeapTrans Heap0@@0 Heap1@@0) (succHeap Heap1@@0 Heap2))) (succHeapTrans Heap0@@0 Heap2))
 :qid |stdinbpl.93:15|
 :skolemid |12|
 :pattern ( (succHeapTrans Heap0@@0 Heap1@@0) (succHeap Heap1@@0 Heap2))
)))
(assert  (and (= (type null) RefType) (forall ((arg0@@24 T@U) ) (! (let ((A (FieldTypeInv0 (type arg0@@24))))
(= (type (PredicateMaskField arg0@@24)) (FieldType A (MapType1Type RefType boolType))))
 :qid |funType:PredicateMaskField|
 :pattern ( (PredicateMaskField arg0@@24))
))))
(assert (forall ((Heap@@6 T@U) (ExhaleHeap T@U) (Mask@@6 T@U) (pm_f T@U) ) (! (let ((C (FieldTypeInv0 (type pm_f))))
 (=> (and (and (and (and (and (= (type Heap@@6) (MapType0Type RefType)) (= (type ExhaleHeap) (MapType0Type RefType))) (= (type Mask@@6) (MapType1Type RefType realType))) (= (type pm_f) (FieldType C FrameTypeType))) (IdenticalOnKnownLocations Heap@@6 ExhaleHeap Mask@@6)) (and (HasDirectPerm Mask@@6 null pm_f) (IsPredicateField pm_f))) (= (MapType0Select Heap@@6 null (PredicateMaskField pm_f)) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))))
 :qid |stdinbpl.47:19|
 :skolemid |2|
 :pattern ( (IdenticalOnKnownLocations Heap@@6 ExhaleHeap Mask@@6) (IsPredicateField pm_f) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))
)))
(assert (forall ((arg0@@25 T@U) ) (! (let ((A@@0 (FieldTypeInv0 (type arg0@@25))))
(= (type (WandMaskField arg0@@25)) (FieldType A@@0 (MapType1Type RefType boolType))))
 :qid |funType:WandMaskField|
 :pattern ( (WandMaskField arg0@@25))
)))
(assert (forall ((Heap@@7 T@U) (ExhaleHeap@@0 T@U) (Mask@@7 T@U) (pm_f@@0 T@U) ) (! (let ((C@@0 (FieldTypeInv0 (type pm_f@@0))))
 (=> (and (and (and (and (and (= (type Heap@@7) (MapType0Type RefType)) (= (type ExhaleHeap@@0) (MapType0Type RefType))) (= (type Mask@@7) (MapType1Type RefType realType))) (= (type pm_f@@0) (FieldType C@@0 FrameTypeType))) (IdenticalOnKnownLocations Heap@@7 ExhaleHeap@@0 Mask@@7)) (and (HasDirectPerm Mask@@7 null pm_f@@0) (IsWandField pm_f@@0))) (= (MapType0Select Heap@@7 null (WandMaskField pm_f@@0)) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))))
 :qid |stdinbpl.60:19|
 :skolemid |5|
 :pattern ( (IdenticalOnKnownLocations Heap@@7 ExhaleHeap@@0 Mask@@7) (IsWandField pm_f@@0) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))
)))
(assert (forall ((Heap@@8 T@U) (Mask@@8 T@U) (r_1@@5 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@8) (MapType0Type RefType)) (= (type Mask@@8) (MapType1Type RefType realType))) (= (type r_1@@5) RefType)) (and (state Heap@@8 Mask@@8) (or (< AssumeFunctionsAbove 5) (|isGreaterOne22#trigger| (FrameFragment (MapType0Select Heap@@8 r_1@@5 f_7)) r_1@@5)))) (> (U_2_int (MapType0Select Heap@@8 r_1@@5 f_7)) (- 0 38))) (= (|isGreaterOne22'| Heap@@8 r_1@@5) (> (U_2_int (MapType0Select Heap@@8 r_1@@5 f_7)) 1)))
 :qid |stdinbpl.399:15|
 :skolemid |37|
 :pattern ( (state Heap@@8 Mask@@8) (|isGreaterOne22'| Heap@@8 r_1@@5))
)))
(assert (forall ((Heap@@9 T@U) (Mask@@9 T@U) (r_1@@6 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@9) (MapType0Type RefType)) (= (type Mask@@9) (MapType1Type RefType realType))) (= (type r_1@@6) RefType)) (and (state Heap@@9 Mask@@9) (or (< AssumeFunctionsAbove 11) (|isGreaterOne32#trigger| (FrameFragment (MapType0Select Heap@@9 r_1@@6 f_7)) r_1@@6)))) (> (U_2_int (MapType0Select Heap@@9 r_1@@6 f_7)) (- 0 38))) (= (|isGreaterOne32'| Heap@@9 r_1@@6) (> (U_2_int (MapType0Select Heap@@9 r_1@@6 f_7)) 1)))
 :qid |stdinbpl.605:15|
 :skolemid |48|
 :pattern ( (state Heap@@9 Mask@@9) (|isGreaterOne32'| Heap@@9 r_1@@6))
)))
(assert  (and (= (Ctor PredicateType_PType) 12) (forall ((arg0@@26 T@U) ) (! (= (type (P arg0@@26)) (FieldType PredicateType_PType FrameTypeType))
 :qid |funType:P|
 :pattern ( (P arg0@@26))
))))
(assert (forall ((x@@8 T@U) ) (!  (=> (= (type x@@8) RefType) (IsPredicateField (P x@@8)))
 :qid |stdinbpl.1344:15|
 :skolemid |85|
 :pattern ( (P x@@8))
)))
(assert (forall ((Heap@@10 T@U) (i Int) ) (!  (=> (= (type Heap@@10) (MapType0Type RefType)) (dummyFunction (bool_2_U (|isGreaterOne#triggerStateless| i))))
 :qid |stdinbpl.209:15|
 :skolemid |23|
 :pattern ( (|isGreaterOne'| Heap@@10 i))
)))
(assert (forall ((Heap@@11 T@U) (r_1@@7 T@U) ) (!  (=> (and (= (type Heap@@11) (MapType0Type RefType)) (= (type r_1@@7) RefType)) (dummyFunction (bool_2_U (|isGreaterOne2#triggerStateless| r_1@@7))))
 :qid |stdinbpl.278:15|
 :skolemid |28|
 :pattern ( (|isGreaterOne2'| Heap@@11 r_1@@7))
)))
(assert (forall ((Heap@@12 T@U) (r_1@@8 T@U) ) (!  (=> (and (= (type Heap@@12) (MapType0Type RefType)) (= (type r_1@@8) RefType)) (dummyFunction (bool_2_U (|isGreaterOne22#triggerStateless| r_1@@8))))
 :qid |stdinbpl.376:15|
 :skolemid |33|
 :pattern ( (|isGreaterOne22'| Heap@@12 r_1@@8))
)))
(assert (forall ((Heap@@13 T@U) (r_1@@9 T@U) ) (!  (=> (and (= (type Heap@@13) (MapType0Type RefType)) (= (type r_1@@9) RefType)) (dummyFunction (bool_2_U (|isGreaterOne3#triggerStateless| r_1@@9))))
 :qid |stdinbpl.484:15|
 :skolemid |39|
 :pattern ( (|isGreaterOne3'| Heap@@13 r_1@@9))
)))
(assert (forall ((Heap@@14 T@U) (r_1@@10 T@U) ) (!  (=> (and (= (type Heap@@14) (MapType0Type RefType)) (= (type r_1@@10) RefType)) (dummyFunction (bool_2_U (|isGreaterOne32#triggerStateless| r_1@@10))))
 :qid |stdinbpl.582:15|
 :skolemid |44|
 :pattern ( (|isGreaterOne32'| Heap@@14 r_1@@10))
)))
(assert (forall ((Heap@@15 T@U) (r_1@@11 T@U) ) (!  (=> (and (= (type Heap@@15) (MapType0Type RefType)) (= (type r_1@@11) RefType)) (dummyFunction (bool_2_U (|isGreaterOne33#triggerStateless| r_1@@11))))
 :qid |stdinbpl.690:15|
 :skolemid |50|
 :pattern ( (|isGreaterOne33'| Heap@@15 r_1@@11))
)))
(assert (forall ((Heap@@16 T@U) (r_1@@12 T@U) ) (!  (=> (and (= (type Heap@@16) (MapType0Type RefType)) (= (type r_1@@12) RefType)) (dummyFunction (bool_2_U (|isGreaterOne34#triggerStateless| r_1@@12))))
 :qid |stdinbpl.783:15|
 :skolemid |55|
 :pattern ( (|isGreaterOne34'| Heap@@16 r_1@@12))
)))
(assert (forall ((Heap@@17 T@U) (r_1@@13 T@U) ) (!  (=> (and (= (type Heap@@17) (MapType0Type RefType)) (= (type r_1@@13) RefType)) (dummyFunction (bool_2_U (|isGreaterOne35#triggerStateless| r_1@@13))))
 :qid |stdinbpl.881:15|
 :skolemid |60|
 :pattern ( (|isGreaterOne35'| Heap@@17 r_1@@13))
)))
(assert (forall ((Heap@@18 T@U) (i@@0 Int) ) (!  (=> (= (type Heap@@18) (MapType0Type RefType)) (dummyFunction (int_2_U (|fac1#triggerStateless| i@@0))))
 :qid |stdinbpl.979:15|
 :skolemid |65|
 :pattern ( (|fac1'| Heap@@18 i@@0))
)))
(assert (forall ((Heap@@19 T@U) (i@@1 Int) ) (!  (=> (= (type Heap@@19) (MapType0Type RefType)) (dummyFunction (int_2_U (|fac2#triggerStateless| i@@1))))
 :qid |stdinbpl.1042:15|
 :skolemid |69|
 :pattern ( (|fac2'| Heap@@19 i@@1))
)))
(assert (forall ((Heap@@20 T@U) (i@@2 Int) ) (!  (=> (= (type Heap@@20) (MapType0Type RefType)) (dummyFunction (int_2_U (|fac3#triggerStateless| i@@2))))
 :qid |stdinbpl.1105:15|
 :skolemid |73|
 :pattern ( (|fac3'| Heap@@20 i@@2))
)))
(assert (forall ((Heap@@21 T@U) (x@@9 T@U) ) (!  (=> (and (= (type Heap@@21) (MapType0Type RefType)) (= (type x@@9) RefType)) (dummyFunction (int_2_U (|funP#triggerStateless| x@@9))))
 :qid |stdinbpl.1168:15|
 :skolemid |77|
 :pattern ( (|funP'| Heap@@21 x@@9))
)))
(assert (forall ((Heap@@22 T@U) (x@@10 T@U) ) (!  (=> (and (= (type Heap@@22) (MapType0Type RefType)) (= (type x@@10) RefType)) (dummyFunction (int_2_U (|funP2#triggerStateless| x@@10))))
 :qid |stdinbpl.1256:15|
 :skolemid |81|
 :pattern ( (|funP2'| Heap@@22 x@@10))
)))
(assert (forall ((Heap@@23 T@U) (x@@11 T@U) ) (!  (=> (and (= (type Heap@@23) (MapType0Type RefType)) (= (type x@@11) RefType)) (|P#everUsed| (P x@@11)))
 :qid |stdinbpl.1363:15|
 :skolemid |89|
 :pattern ( (|P#trigger| Heap@@23 (P x@@11)))
)))
(assert (forall ((Heap@@24 T@U) (ExhaleHeap@@1 T@U) (Mask@@10 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@24) (MapType0Type RefType)) (= (type ExhaleHeap@@1) (MapType0Type RefType))) (= (type Mask@@10) (MapType1Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@24 ExhaleHeap@@1 Mask@@10)) (U_2_bool (MapType0Select Heap@@24 o_1 $allocated))) (U_2_bool (MapType0Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.73:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@24 ExhaleHeap@@1 Mask@@10) (MapType0Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert (forall ((Heap@@25 T@U) (i@@3 Int) ) (!  (=> (= (type Heap@@25) (MapType0Type RefType)) (and (= (fac1 Heap@@25 i@@3) (|fac1'| Heap@@25 i@@3)) (dummyFunction (int_2_U (|fac1#triggerStateless| i@@3)))))
 :qid |stdinbpl.975:15|
 :skolemid |64|
 :pattern ( (fac1 Heap@@25 i@@3))
)))
(assert (forall ((Heap@@26 T@U) (i@@4 Int) ) (!  (=> (= (type Heap@@26) (MapType0Type RefType)) (and (= (fac2 Heap@@26 i@@4) (|fac2'| Heap@@26 i@@4)) (dummyFunction (int_2_U (|fac2#triggerStateless| i@@4)))))
 :qid |stdinbpl.1038:15|
 :skolemid |68|
 :pattern ( (fac2 Heap@@26 i@@4))
)))
(assert (forall ((Heap@@27 T@U) (i@@5 Int) ) (!  (=> (= (type Heap@@27) (MapType0Type RefType)) (and (= (fac3 Heap@@27 i@@5) (|fac3'| Heap@@27 i@@5)) (dummyFunction (int_2_U (|fac3#triggerStateless| i@@5)))))
 :qid |stdinbpl.1101:15|
 :skolemid |72|
 :pattern ( (fac3 Heap@@27 i@@5))
)))
(assert (forall ((Heap@@28 T@U) (x@@12 T@U) ) (!  (=> (and (= (type Heap@@28) (MapType0Type RefType)) (= (type x@@12) RefType)) (and (= (funP Heap@@28 x@@12) (|funP'| Heap@@28 x@@12)) (dummyFunction (int_2_U (|funP#triggerStateless| x@@12)))))
 :qid |stdinbpl.1164:15|
 :skolemid |76|
 :pattern ( (funP Heap@@28 x@@12))
)))
(assert (forall ((Heap@@29 T@U) (x@@13 T@U) ) (!  (=> (and (= (type Heap@@29) (MapType0Type RefType)) (= (type x@@13) RefType)) (and (= (funP2 Heap@@29 x@@13) (|funP2'| Heap@@29 x@@13)) (dummyFunction (int_2_U (|funP2#triggerStateless| x@@13)))))
 :qid |stdinbpl.1252:15|
 :skolemid |80|
 :pattern ( (funP2 Heap@@29 x@@13))
)))
(assert (forall ((Heap@@30 T@U) (Mask@@11 T@U) (i@@6 Int) ) (!  (=> (and (and (and (= (type Heap@@30) (MapType0Type RefType)) (= (type Mask@@11) (MapType1Type RefType realType))) (and (state Heap@@30 Mask@@11) (< AssumeFunctionsAbove 12))) (> i@@6 (- 0 60))) (= (isGreaterOne Heap@@30 i@@6) (> i@@6 1)))
 :qid |stdinbpl.215:15|
 :skolemid |24|
 :pattern ( (state Heap@@30 Mask@@11) (isGreaterOne Heap@@30 i@@6))
)))
(assert (forall ((x@@14 T@U) (x2 T@U) ) (!  (=> (and (and (= (type x@@14) RefType) (= (type x2) RefType)) (= (P x@@14) (P x2))) (= x@@14 x2))
 :qid |stdinbpl.1354:15|
 :skolemid |87|
 :pattern ( (P x@@14) (P x2))
)))
(assert (forall ((arg0@@27 T@U) ) (! (= (type (|P#sm| arg0@@27)) (FieldType PredicateType_PType (MapType1Type RefType boolType)))
 :qid |funType:P#sm|
 :pattern ( (|P#sm| arg0@@27))
)))
(assert (forall ((x@@15 T@U) (x2@@0 T@U) ) (!  (=> (and (and (= (type x@@15) RefType) (= (type x2@@0) RefType)) (= (|P#sm| x@@15) (|P#sm| x2@@0))) (= x@@15 x2@@0))
 :qid |stdinbpl.1358:15|
 :skolemid |88|
 :pattern ( (|P#sm| x@@15) (|P#sm| x2@@0))
)))
(assert (forall ((Heap@@31 T@U) (Mask@@12 T@U) (i@@7 Int) ) (!  (=> (and (and (= (type Heap@@31) (MapType0Type RefType)) (= (type Mask@@12) (MapType1Type RefType realType))) (and (state Heap@@31 Mask@@12) (< AssumeFunctionsAbove 4))) (= (fac2 Heap@@31 i@@7) (ite (<= i@@7 1) 1 (* i@@7 (|fac2'| Heap@@31 (- i@@7 1))))))
 :qid |stdinbpl.1048:15|
 :skolemid |70|
 :pattern ( (state Heap@@31 Mask@@12) (fac2 Heap@@31 i@@7))
)))
(assert (forall ((Heap@@32 T@U) (Mask@@13 T@U) (i@@8 Int) ) (!  (=> (and (and (= (type Heap@@32) (MapType0Type RefType)) (= (type Mask@@13) (MapType1Type RefType realType))) (and (state Heap@@32 Mask@@13) (< AssumeFunctionsAbove 9))) (= (fac3 Heap@@32 i@@8) (ite (<= i@@8 1) 1 (* i@@8 (|fac3'| Heap@@32 (- i@@8 1))))))
 :qid |stdinbpl.1111:15|
 :skolemid |74|
 :pattern ( (state Heap@@32 Mask@@13) (fac3 Heap@@32 i@@8))
)))
(assert (forall ((Heap@@33 T@U) (Mask@@14 T@U) (i@@9 Int) ) (!  (=> (and (and (= (type Heap@@33) (MapType0Type RefType)) (= (type Mask@@14) (MapType1Type RefType realType))) (and (state Heap@@33 Mask@@14) (< AssumeFunctionsAbove 10))) (= (fac1 Heap@@33 i@@9) (ite (<= i@@9 1) 1 (* i@@9 (|fac1'| Heap@@33 (- i@@9 1))))))
 :qid |stdinbpl.985:15|
 :skolemid |66|
 :pattern ( (state Heap@@33 Mask@@14) (fac1 Heap@@33 i@@9))
)))
(assert (forall ((Heap@@34 T@U) (ExhaleHeap@@2 T@U) (Mask@@15 T@U) (o_1@@0 T@U) (f_2 T@U) ) (! (let ((B@@1 (FieldTypeInv1 (type f_2))))
(let ((A@@1 (FieldTypeInv0 (type f_2))))
 (=> (and (and (and (and (and (and (= (type Heap@@34) (MapType0Type RefType)) (= (type ExhaleHeap@@2) (MapType0Type RefType))) (= (type Mask@@15) (MapType1Type RefType realType))) (= (type o_1@@0) RefType)) (= (type f_2) (FieldType A@@1 B@@1))) (IdenticalOnKnownLocations Heap@@34 ExhaleHeap@@2 Mask@@15)) (HasDirectPerm Mask@@15 o_1@@0 f_2)) (= (MapType0Select Heap@@34 o_1@@0 f_2) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2)))))
 :qid |stdinbpl.42:22|
 :skolemid |1|
 :pattern ( (IdenticalOnKnownLocations Heap@@34 ExhaleHeap@@2 Mask@@15) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2))
)))
(assert  (and (= (type dummyHeap) (MapType0Type RefType)) (= (type ZeroMask) (MapType1Type RefType realType))))
(assert (state dummyHeap ZeroMask))
(assert (forall ((p T@U) (v_1 T@U) (w T@U) ) (! (let ((A@@2 (FieldTypeInv0 (type p))))
 (=> (and (and (= (type p) (FieldType A@@2 FrameTypeType)) (= (type v_1) FrameTypeType)) (= (type w) FrameTypeType)) (not (InsidePredicate p v_1 p w))))
 :qid |stdinbpl.185:19|
 :skolemid |21|
 :pattern ( (InsidePredicate p v_1 p w))
)))
(assert (forall ((Heap@@35 T@U) (Mask@@16 T@U) (r_1@@14 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@35) (MapType0Type RefType)) (= (type Mask@@16) (MapType1Type RefType realType))) (= (type r_1@@14) RefType)) (and (state Heap@@35 Mask@@16) (or (< AssumeFunctionsAbove 7) (|isGreaterOne33#trigger| (FrameFragment (MapType0Select Heap@@35 r_1@@14 f_7)) r_1@@14)))) (> (U_2_int (MapType0Select Heap@@35 r_1@@14 f_7)) 60)) (|isGreaterOne33'| Heap@@35 r_1@@14))
 :qid |stdinbpl.709:15|
 :skolemid |53|
 :pattern ( (state Heap@@35 Mask@@16) (|isGreaterOne33'| Heap@@35 r_1@@14))
)))
(assert  (not (IsPredicateField f_7)))
(assert  (not (IsWandField f_7)))
(assert (forall ((Heap@@36 T@U) (ExhaleHeap@@3 T@U) (Mask@@17 T@U) ) (!  (=> (and (and (and (= (type Heap@@36) (MapType0Type RefType)) (= (type ExhaleHeap@@3) (MapType0Type RefType))) (= (type Mask@@17) (MapType1Type RefType realType))) (IdenticalOnKnownLocations Heap@@36 ExhaleHeap@@3 Mask@@17)) (succHeap Heap@@36 ExhaleHeap@@3))
 :qid |stdinbpl.83:15|
 :skolemid |10|
 :pattern ( (IdenticalOnKnownLocations Heap@@36 ExhaleHeap@@3 Mask@@17))
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
(assert (forall ((Heap@@37 T@U) (Mask@@18 T@U) (r_1@@15 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@37) (MapType0Type RefType)) (= (type Mask@@18) (MapType1Type RefType realType))) (= (type r_1@@15) RefType)) (and (state Heap@@37 Mask@@18) (< AssumeFunctionsAbove 1))) (> (U_2_int (MapType0Select Heap@@37 r_1@@15 f_7)) (- 0 38))) (= (isGreaterOne34 Heap@@37 r_1@@15) (isGreaterOne Heap@@37 (U_2_int (MapType0Select Heap@@37 r_1@@15 f_7)))))
 :qid |stdinbpl.789:15|
 :skolemid |56|
 :pattern ( (state Heap@@37 Mask@@18) (isGreaterOne34 Heap@@37 r_1@@15))
)))
(assert (forall ((Heap@@38 T@U) (Mask@@19 T@U) (r_1@@16 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@38) (MapType0Type RefType)) (= (type Mask@@19) (MapType1Type RefType realType))) (= (type r_1@@16) RefType)) (and (state Heap@@38 Mask@@19) (< AssumeFunctionsAbove 2))) (> (U_2_int (MapType0Select Heap@@38 r_1@@16 f_7)) (- 0 38))) (= (isGreaterOne2 Heap@@38 r_1@@16) (|isGreaterOne'| Heap@@38 (U_2_int (MapType0Select Heap@@38 r_1@@16 f_7)))))
 :qid |stdinbpl.284:15|
 :skolemid |29|
 :pattern ( (state Heap@@38 Mask@@19) (isGreaterOne2 Heap@@38 r_1@@16))
)))
(assert (forall ((Heap@@39 T@U) (Mask@@20 T@U) (r_1@@17 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@39) (MapType0Type RefType)) (= (type Mask@@20) (MapType1Type RefType realType))) (= (type r_1@@17) RefType)) (and (state Heap@@39 Mask@@20) (< AssumeFunctionsAbove 3))) (> (U_2_int (MapType0Select Heap@@39 r_1@@17 f_7)) (- 0 38))) (= (isGreaterOne35 Heap@@39 r_1@@17) (|isGreaterOne'| Heap@@39 (U_2_int (MapType0Select Heap@@39 r_1@@17 f_7)))))
 :qid |stdinbpl.887:15|
 :skolemid |61|
 :pattern ( (state Heap@@39 Mask@@20) (isGreaterOne35 Heap@@39 r_1@@17))
)))
(assert (forall ((Heap@@40 T@U) (Mask@@21 T@U) (r_1@@18 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@40) (MapType0Type RefType)) (= (type Mask@@21) (MapType1Type RefType realType))) (= (type r_1@@18) RefType)) (and (state Heap@@40 Mask@@21) (< AssumeFunctionsAbove 5))) (> (U_2_int (MapType0Select Heap@@40 r_1@@18 f_7)) (- 0 38))) (= (isGreaterOne22 Heap@@40 r_1@@18) (|isGreaterOne'| Heap@@40 (U_2_int (MapType0Select Heap@@40 r_1@@18 f_7)))))
 :qid |stdinbpl.382:15|
 :skolemid |34|
 :pattern ( (state Heap@@40 Mask@@21) (isGreaterOne22 Heap@@40 r_1@@18))
)))
(assert (forall ((Heap@@41 T@U) (Mask@@22 T@U) (r_1@@19 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@41) (MapType0Type RefType)) (= (type Mask@@22) (MapType1Type RefType realType))) (= (type r_1@@19) RefType)) (and (state Heap@@41 Mask@@22) (< AssumeFunctionsAbove 8))) (> (U_2_int (MapType0Select Heap@@41 r_1@@19 f_7)) (- 0 38))) (= (isGreaterOne3 Heap@@41 r_1@@19) (isGreaterOne Heap@@41 (U_2_int (MapType0Select Heap@@41 r_1@@19 f_7)))))
 :qid |stdinbpl.490:15|
 :skolemid |40|
 :pattern ( (state Heap@@41 Mask@@22) (isGreaterOne3 Heap@@41 r_1@@19))
)))
(assert (forall ((Heap@@42 T@U) (Mask@@23 T@U) (r_1@@20 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@42) (MapType0Type RefType)) (= (type Mask@@23) (MapType1Type RefType realType))) (= (type r_1@@20) RefType)) (and (state Heap@@42 Mask@@23) (< AssumeFunctionsAbove 11))) (> (U_2_int (MapType0Select Heap@@42 r_1@@20 f_7)) (- 0 38))) (= (isGreaterOne32 Heap@@42 r_1@@20) (isGreaterOne Heap@@42 (U_2_int (MapType0Select Heap@@42 r_1@@20 f_7)))))
 :qid |stdinbpl.588:15|
 :skolemid |45|
 :pattern ( (state Heap@@42 Mask@@23) (isGreaterOne32 Heap@@42 r_1@@20))
)))
(assert  (and (forall ((arg0@@28 Real) (arg1@@9 T@U) ) (! (= (type (ConditionalFrame arg0@@28 arg1@@9)) FrameTypeType)
 :qid |funType:ConditionalFrame|
 :pattern ( (ConditionalFrame arg0@@28 arg1@@9))
)) (= (type EmptyFrame) FrameTypeType)))
(assert (forall ((p@@0 Real) (f_6 T@U) ) (!  (=> (= (type f_6) FrameTypeType) (= (ConditionalFrame p@@0 f_6) (ite (> p@@0 0.0) f_6 EmptyFrame)))
 :qid |stdinbpl.173:15|
 :skolemid |19|
 :pattern ( (ConditionalFrame p@@0 f_6))
)))
(assert (forall ((Mask@@24 T@U) (o_2@@0 T@U) (f_4@@0 T@U) ) (! (let ((B@@3 (FieldTypeInv1 (type f_4@@0))))
(let ((A@@4 (FieldTypeInv0 (type f_4@@0))))
 (=> (and (and (= (type Mask@@24) (MapType1Type RefType realType)) (= (type o_2@@0) RefType)) (= (type f_4@@0) (FieldType A@@4 B@@3))) (= (HasDirectPerm Mask@@24 o_2@@0 f_4@@0) (> (U_2_real (MapType1Select Mask@@24 o_2@@0 f_4@@0)) NoPerm)))))
 :qid |stdinbpl.133:22|
 :skolemid |17|
 :pattern ( (HasDirectPerm Mask@@24 o_2@@0 f_4@@0))
)))
(assert (forall ((o_2@@1 T@U) (f_4@@1 T@U) ) (! (let ((B@@4 (FieldTypeInv1 (type f_4@@1))))
(let ((A@@5 (FieldTypeInv0 (type f_4@@1))))
 (=> (and (= (type o_2@@1) RefType) (= (type f_4@@1) (FieldType A@@5 B@@4))) (= (U_2_real (MapType1Select ZeroMask o_2@@1 f_4@@1)) NoPerm))))
 :qid |stdinbpl.106:22|
 :skolemid |13|
 :pattern ( (MapType1Select ZeroMask o_2@@1 f_4@@1))
)))
(assert (forall ((Heap@@43 T@U) (Mask@@25 T@U) (i@@10 Int) ) (!  (=> (and (and (= (type Heap@@43) (MapType0Type RefType)) (= (type Mask@@25) (MapType1Type RefType realType))) (state Heap@@43 Mask@@25)) (= (|isGreaterOne'| Heap@@43 i@@10) (|isGreaterOne#frame| EmptyFrame i@@10)))
 :qid |stdinbpl.222:15|
 :skolemid |25|
 :pattern ( (state Heap@@43 Mask@@25) (|isGreaterOne'| Heap@@43 i@@10))
)))
(assert (forall ((Heap@@44 T@U) (Mask@@26 T@U) (i@@11 Int) ) (!  (=> (and (and (and (and (= (type Heap@@44) (MapType0Type RefType)) (= (type Mask@@26) (MapType1Type RefType realType))) (and (state Heap@@44 Mask@@26) (or (< AssumeFunctionsAbove 12) (|isGreaterOne#trigger| EmptyFrame i@@11)))) (> i@@11 (- 0 60))) (> i@@11 60)) (|isGreaterOne'| Heap@@44 i@@11))
 :qid |stdinbpl.228:15|
 :skolemid |26|
 :pattern ( (state Heap@@44 Mask@@26) (|isGreaterOne'| Heap@@44 i@@11))
)))
(assert (forall ((Heap@@45 T@U) (Mask@@27 T@U) (r_1@@21 T@U) ) (!  (=> (and (and (and (= (type Heap@@45) (MapType0Type RefType)) (= (type Mask@@27) (MapType1Type RefType realType))) (= (type r_1@@21) RefType)) (state Heap@@45 Mask@@27)) (= (|isGreaterOne2'| Heap@@45 r_1@@21) (|isGreaterOne2#frame| (FrameFragment (MapType0Select Heap@@45 r_1@@21 f_7)) r_1@@21)))
 :qid |stdinbpl.291:15|
 :skolemid |30|
 :pattern ( (state Heap@@45 Mask@@27) (|isGreaterOne2'| Heap@@45 r_1@@21))
)))
(assert (forall ((Heap@@46 T@U) (Mask@@28 T@U) (r_1@@22 T@U) ) (!  (=> (and (and (and (= (type Heap@@46) (MapType0Type RefType)) (= (type Mask@@28) (MapType1Type RefType realType))) (= (type r_1@@22) RefType)) (state Heap@@46 Mask@@28)) (= (|isGreaterOne22'| Heap@@46 r_1@@22) (|isGreaterOne22#frame| (FrameFragment (MapType0Select Heap@@46 r_1@@22 f_7)) r_1@@22)))
 :qid |stdinbpl.389:15|
 :skolemid |35|
 :pattern ( (state Heap@@46 Mask@@28) (|isGreaterOne22'| Heap@@46 r_1@@22))
)))
(assert (forall ((Heap@@47 T@U) (Mask@@29 T@U) (r_1@@23 T@U) ) (!  (=> (and (and (and (= (type Heap@@47) (MapType0Type RefType)) (= (type Mask@@29) (MapType1Type RefType realType))) (= (type r_1@@23) RefType)) (state Heap@@47 Mask@@29)) (= (|isGreaterOne3'| Heap@@47 r_1@@23) (|isGreaterOne3#frame| (FrameFragment (MapType0Select Heap@@47 r_1@@23 f_7)) r_1@@23)))
 :qid |stdinbpl.497:15|
 :skolemid |41|
 :pattern ( (state Heap@@47 Mask@@29) (|isGreaterOne3'| Heap@@47 r_1@@23))
)))
(assert (forall ((Heap@@48 T@U) (Mask@@30 T@U) (r_1@@24 T@U) ) (!  (=> (and (and (and (= (type Heap@@48) (MapType0Type RefType)) (= (type Mask@@30) (MapType1Type RefType realType))) (= (type r_1@@24) RefType)) (state Heap@@48 Mask@@30)) (= (|isGreaterOne32'| Heap@@48 r_1@@24) (|isGreaterOne32#frame| (FrameFragment (MapType0Select Heap@@48 r_1@@24 f_7)) r_1@@24)))
 :qid |stdinbpl.595:15|
 :skolemid |46|
 :pattern ( (state Heap@@48 Mask@@30) (|isGreaterOne32'| Heap@@48 r_1@@24))
)))
(assert (forall ((Heap@@49 T@U) (Mask@@31 T@U) (r_1@@25 T@U) ) (!  (=> (and (and (and (= (type Heap@@49) (MapType0Type RefType)) (= (type Mask@@31) (MapType1Type RefType realType))) (= (type r_1@@25) RefType)) (state Heap@@49 Mask@@31)) (= (|isGreaterOne33'| Heap@@49 r_1@@25) (|isGreaterOne33#frame| (FrameFragment (MapType0Select Heap@@49 r_1@@25 f_7)) r_1@@25)))
 :qid |stdinbpl.703:15|
 :skolemid |52|
 :pattern ( (state Heap@@49 Mask@@31) (|isGreaterOne33'| Heap@@49 r_1@@25))
)))
(assert (forall ((Heap@@50 T@U) (Mask@@32 T@U) (r_1@@26 T@U) ) (!  (=> (and (and (and (= (type Heap@@50) (MapType0Type RefType)) (= (type Mask@@32) (MapType1Type RefType realType))) (= (type r_1@@26) RefType)) (state Heap@@50 Mask@@32)) (= (|isGreaterOne34'| Heap@@50 r_1@@26) (|isGreaterOne34#frame| (FrameFragment (MapType0Select Heap@@50 r_1@@26 f_7)) r_1@@26)))
 :qid |stdinbpl.796:15|
 :skolemid |57|
 :pattern ( (state Heap@@50 Mask@@32) (|isGreaterOne34'| Heap@@50 r_1@@26))
)))
(assert (forall ((Heap@@51 T@U) (Mask@@33 T@U) (r_1@@27 T@U) ) (!  (=> (and (and (and (= (type Heap@@51) (MapType0Type RefType)) (= (type Mask@@33) (MapType1Type RefType realType))) (= (type r_1@@27) RefType)) (state Heap@@51 Mask@@33)) (= (|isGreaterOne35'| Heap@@51 r_1@@27) (|isGreaterOne35#frame| (FrameFragment (MapType0Select Heap@@51 r_1@@27 f_7)) r_1@@27)))
 :qid |stdinbpl.894:15|
 :skolemid |62|
 :pattern ( (state Heap@@51 Mask@@33) (|isGreaterOne35'| Heap@@51 r_1@@27))
)))
(assert (forall ((Heap@@52 T@U) (i@@12 Int) ) (!  (=> (= (type Heap@@52) (MapType0Type RefType)) (and (= (isGreaterOne Heap@@52 i@@12) (|isGreaterOne'| Heap@@52 i@@12)) (dummyFunction (bool_2_U (|isGreaterOne#triggerStateless| i@@12)))))
 :qid |stdinbpl.205:15|
 :skolemid |22|
 :pattern ( (isGreaterOne Heap@@52 i@@12))
)))
(assert (forall ((Heap@@53 T@U) (r_1@@28 T@U) ) (!  (=> (and (= (type Heap@@53) (MapType0Type RefType)) (= (type r_1@@28) RefType)) (and (= (isGreaterOne2 Heap@@53 r_1@@28) (|isGreaterOne2'| Heap@@53 r_1@@28)) (dummyFunction (bool_2_U (|isGreaterOne2#triggerStateless| r_1@@28)))))
 :qid |stdinbpl.274:15|
 :skolemid |27|
 :pattern ( (isGreaterOne2 Heap@@53 r_1@@28))
)))
(assert (forall ((Heap@@54 T@U) (r_1@@29 T@U) ) (!  (=> (and (= (type Heap@@54) (MapType0Type RefType)) (= (type r_1@@29) RefType)) (and (= (isGreaterOne22 Heap@@54 r_1@@29) (|isGreaterOne22'| Heap@@54 r_1@@29)) (dummyFunction (bool_2_U (|isGreaterOne22#triggerStateless| r_1@@29)))))
 :qid |stdinbpl.372:15|
 :skolemid |32|
 :pattern ( (isGreaterOne22 Heap@@54 r_1@@29))
)))
(assert (forall ((Heap@@55 T@U) (r_1@@30 T@U) ) (!  (=> (and (= (type Heap@@55) (MapType0Type RefType)) (= (type r_1@@30) RefType)) (and (= (isGreaterOne3 Heap@@55 r_1@@30) (|isGreaterOne3'| Heap@@55 r_1@@30)) (dummyFunction (bool_2_U (|isGreaterOne3#triggerStateless| r_1@@30)))))
 :qid |stdinbpl.480:15|
 :skolemid |38|
 :pattern ( (isGreaterOne3 Heap@@55 r_1@@30))
)))
(assert (forall ((Heap@@56 T@U) (r_1@@31 T@U) ) (!  (=> (and (= (type Heap@@56) (MapType0Type RefType)) (= (type r_1@@31) RefType)) (and (= (isGreaterOne32 Heap@@56 r_1@@31) (|isGreaterOne32'| Heap@@56 r_1@@31)) (dummyFunction (bool_2_U (|isGreaterOne32#triggerStateless| r_1@@31)))))
 :qid |stdinbpl.578:15|
 :skolemid |43|
 :pattern ( (isGreaterOne32 Heap@@56 r_1@@31))
)))
(assert (forall ((Heap@@57 T@U) (r_1@@32 T@U) ) (!  (=> (and (= (type Heap@@57) (MapType0Type RefType)) (= (type r_1@@32) RefType)) (and (= (isGreaterOne33 Heap@@57 r_1@@32) (|isGreaterOne33'| Heap@@57 r_1@@32)) (dummyFunction (bool_2_U (|isGreaterOne33#triggerStateless| r_1@@32)))))
 :qid |stdinbpl.686:15|
 :skolemid |49|
 :pattern ( (isGreaterOne33 Heap@@57 r_1@@32))
)))
(assert (forall ((Heap@@58 T@U) (r_1@@33 T@U) ) (!  (=> (and (= (type Heap@@58) (MapType0Type RefType)) (= (type r_1@@33) RefType)) (and (= (isGreaterOne34 Heap@@58 r_1@@33) (|isGreaterOne34'| Heap@@58 r_1@@33)) (dummyFunction (bool_2_U (|isGreaterOne34#triggerStateless| r_1@@33)))))
 :qid |stdinbpl.779:15|
 :skolemid |54|
 :pattern ( (isGreaterOne34 Heap@@58 r_1@@33))
)))
(assert (forall ((Heap@@59 T@U) (r_1@@34 T@U) ) (!  (=> (and (= (type Heap@@59) (MapType0Type RefType)) (= (type r_1@@34) RefType)) (and (= (isGreaterOne35 Heap@@59 r_1@@34) (|isGreaterOne35'| Heap@@59 r_1@@34)) (dummyFunction (bool_2_U (|isGreaterOne35#triggerStateless| r_1@@34)))))
 :qid |stdinbpl.877:15|
 :skolemid |59|
 :pattern ( (isGreaterOne35 Heap@@59 r_1@@34))
)))
(assert (forall ((Heap@@60 T@U) (ExhaleHeap@@4 T@U) (Mask@@34 T@U) (pm_f@@1 T@U) ) (! (let ((C@@1 (FieldTypeInv0 (type pm_f@@1))))
 (=> (and (and (and (and (and (= (type Heap@@60) (MapType0Type RefType)) (= (type ExhaleHeap@@4) (MapType0Type RefType))) (= (type Mask@@34) (MapType1Type RefType realType))) (= (type pm_f@@1) (FieldType C@@1 FrameTypeType))) (IdenticalOnKnownLocations Heap@@60 ExhaleHeap@@4 Mask@@34)) (and (HasDirectPerm Mask@@34 null pm_f@@1) (IsPredicateField pm_f@@1))) (forall ((o2 T@U) (f_2@@0 T@U) ) (! (let ((B@@5 (FieldTypeInv1 (type f_2@@0))))
(let ((A@@6 (FieldTypeInv0 (type f_2@@0))))
 (=> (and (and (= (type o2) RefType) (= (type f_2@@0) (FieldType A@@6 B@@5))) (U_2_bool (MapType1Select (MapType0Select Heap@@60 null (PredicateMaskField pm_f@@1)) o2 f_2@@0))) (= (MapType0Select Heap@@60 o2 f_2@@0) (MapType0Select ExhaleHeap@@4 o2 f_2@@0)))))
 :qid |stdinbpl.54:134|
 :skolemid |3|
 :pattern ( (MapType0Select ExhaleHeap@@4 o2 f_2@@0))
))))
 :qid |stdinbpl.52:19|
 :skolemid |4|
 :pattern ( (IdenticalOnKnownLocations Heap@@60 ExhaleHeap@@4 Mask@@34) (IsPredicateField pm_f@@1))
)))
(assert (forall ((Heap@@61 T@U) (ExhaleHeap@@5 T@U) (Mask@@35 T@U) (pm_f@@2 T@U) ) (! (let ((C@@2 (FieldTypeInv0 (type pm_f@@2))))
 (=> (and (and (and (and (and (= (type Heap@@61) (MapType0Type RefType)) (= (type ExhaleHeap@@5) (MapType0Type RefType))) (= (type Mask@@35) (MapType1Type RefType realType))) (= (type pm_f@@2) (FieldType C@@2 FrameTypeType))) (IdenticalOnKnownLocations Heap@@61 ExhaleHeap@@5 Mask@@35)) (and (HasDirectPerm Mask@@35 null pm_f@@2) (IsWandField pm_f@@2))) (forall ((o2@@0 T@U) (f_2@@1 T@U) ) (! (let ((B@@6 (FieldTypeInv1 (type f_2@@1))))
(let ((A@@7 (FieldTypeInv0 (type f_2@@1))))
 (=> (and (and (= (type o2@@0) RefType) (= (type f_2@@1) (FieldType A@@7 B@@6))) (U_2_bool (MapType1Select (MapType0Select Heap@@61 null (WandMaskField pm_f@@2)) o2@@0 f_2@@1))) (= (MapType0Select Heap@@61 o2@@0 f_2@@1) (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1)))))
 :qid |stdinbpl.67:129|
 :skolemid |6|
 :pattern ( (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1))
))))
 :qid |stdinbpl.65:19|
 :skolemid |7|
 :pattern ( (IdenticalOnKnownLocations Heap@@61 ExhaleHeap@@5 Mask@@35) (IsWandField pm_f@@2))
)))
(assert (forall ((x@@16 T@U) ) (!  (=> (= (type x@@16) RefType) (= (getPredWandId (P x@@16)) 0))
 :qid |stdinbpl.1348:15|
 :skolemid |86|
 :pattern ( (P x@@16))
)))
(assert (forall ((Mask@@36 T@U) (o_2@@2 T@U) (f_4@@2 T@U) ) (! (let ((B@@7 (FieldTypeInv1 (type f_4@@2))))
(let ((A@@8 (FieldTypeInv0 (type f_4@@2))))
 (=> (and (and (and (= (type Mask@@36) (MapType1Type RefType realType)) (= (type o_2@@2) RefType)) (= (type f_4@@2) (FieldType A@@8 B@@7))) (GoodMask Mask@@36)) (and (>= (U_2_real (MapType1Select Mask@@36 o_2@@2 f_4@@2)) NoPerm) (=> (and (and (GoodMask Mask@@36) (not (IsPredicateField f_4@@2))) (not (IsWandField f_4@@2))) (<= (U_2_real (MapType1Select Mask@@36 o_2@@2 f_4@@2)) FullPerm))))))
 :qid |stdinbpl.128:22|
 :skolemid |16|
 :pattern ( (GoodMask Mask@@36) (MapType1Select Mask@@36 o_2@@2 f_4@@2))
)))
(assert (forall ((Heap@@62 T@U) (Mask@@37 T@U) (i@@13 Int) ) (!  (=> (and (and (= (type Heap@@62) (MapType0Type RefType)) (= (type Mask@@37) (MapType1Type RefType realType))) (state Heap@@62 Mask@@37)) (= (|fac1'| Heap@@62 i@@13) (|fac1#frame| EmptyFrame i@@13)))
 :qid |stdinbpl.992:15|
 :skolemid |67|
 :pattern ( (state Heap@@62 Mask@@37) (|fac1'| Heap@@62 i@@13))
)))
(assert (forall ((Heap@@63 T@U) (Mask@@38 T@U) (i@@14 Int) ) (!  (=> (and (and (= (type Heap@@63) (MapType0Type RefType)) (= (type Mask@@38) (MapType1Type RefType realType))) (state Heap@@63 Mask@@38)) (= (|fac2'| Heap@@63 i@@14) (|fac2#frame| EmptyFrame i@@14)))
 :qid |stdinbpl.1055:15|
 :skolemid |71|
 :pattern ( (state Heap@@63 Mask@@38) (|fac2'| Heap@@63 i@@14))
)))
(assert (forall ((Heap@@64 T@U) (Mask@@39 T@U) (i@@15 Int) ) (!  (=> (and (and (= (type Heap@@64) (MapType0Type RefType)) (= (type Mask@@39) (MapType1Type RefType realType))) (state Heap@@64 Mask@@39)) (= (|fac3'| Heap@@64 i@@15) (|fac3#frame| EmptyFrame i@@15)))
 :qid |stdinbpl.1118:15|
 :skolemid |75|
 :pattern ( (state Heap@@64 Mask@@39) (|fac3'| Heap@@64 i@@15))
)))
(assert (forall ((Heap@@65 T@U) (Mask@@40 T@U) (x@@17 T@U) ) (!  (=> (and (and (and (= (type Heap@@65) (MapType0Type RefType)) (= (type Mask@@40) (MapType1Type RefType realType))) (= (type x@@17) RefType)) (state Heap@@65 Mask@@40)) (= (|funP'| Heap@@65 x@@17) (|funP#frame| (MapType0Select Heap@@65 null (P x@@17)) x@@17)))
 :qid |stdinbpl.1181:15|
 :skolemid |79|
 :pattern ( (state Heap@@65 Mask@@40) (|funP'| Heap@@65 x@@17))
)))
(assert (forall ((Heap@@66 T@U) (Mask@@41 T@U) (x@@18 T@U) ) (!  (=> (and (and (and (= (type Heap@@66) (MapType0Type RefType)) (= (type Mask@@41) (MapType1Type RefType realType))) (= (type x@@18) RefType)) (state Heap@@66 Mask@@41)) (= (|funP2'| Heap@@66 x@@18) (|funP2#frame| (MapType0Select Heap@@66 null (P x@@18)) x@@18)))
 :qid |stdinbpl.1269:15|
 :skolemid |83|
 :pattern ( (state Heap@@66 Mask@@41) (|funP2'| Heap@@66 x@@18))
)))
(assert (forall ((o T@U) (f T@U) (Heap@@67 T@U) ) (!  (=> (and (and (and (= (type o) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap@@67) (MapType0Type RefType))) (U_2_bool (MapType0Select Heap@@67 o $allocated))) (U_2_bool (MapType0Select Heap@@67 (MapType0Select Heap@@67 o f) $allocated)))
 :qid |stdinbpl.31:15|
 :skolemid |0|
 :pattern ( (MapType0Select Heap@@67 o f))
)))
(assert (forall ((x@@19 T@U) ) (!  (=> (= (type x@@19) RefType) (= (PredicateMaskField (P x@@19)) (|P#sm| x@@19)))
 :qid |stdinbpl.1340:15|
 :skolemid |84|
 :pattern ( (PredicateMaskField (P x@@19)))
)))
(assert (forall ((Heap@@68 T@U) (Mask@@42 T@U) (r_1@@35 T@U) ) (!  (=> (and (and (and (= (type Heap@@68) (MapType0Type RefType)) (= (type Mask@@42) (MapType1Type RefType realType))) (= (type r_1@@35) RefType)) (and (state Heap@@68 Mask@@42) (< AssumeFunctionsAbove 7))) (= (isGreaterOne33 Heap@@68 r_1@@35) (isGreaterOne Heap@@68 (U_2_int (MapType0Select Heap@@68 r_1@@35 f_7)))))
 :qid |stdinbpl.696:15|
 :skolemid |51|
 :pattern ( (state Heap@@68 Mask@@42) (isGreaterOne33 Heap@@68 r_1@@35))
)))
(assert (forall ((Heap@@69 T@U) (o@@0 T@U) (f_3 T@U) (v T@U) ) (! (let ((B@@8 (type v)))
(let ((A@@9 (FieldTypeInv0 (type f_3))))
 (=> (and (and (= (type Heap@@69) (MapType0Type RefType)) (= (type o@@0) RefType)) (= (type f_3) (FieldType A@@9 B@@8))) (succHeap Heap@@69 (MapType0Store Heap@@69 o@@0 f_3 v)))))
 :qid |stdinbpl.78:22|
 :skolemid |9|
 :pattern ( (MapType0Store Heap@@69 o@@0 f_3 v))
)))
(assert (forall ((Heap@@70 T@U) (Mask@@43 T@U) (x@@20 T@U) ) (!  (=> (and (and (and (= (type Heap@@70) (MapType0Type RefType)) (= (type Mask@@43) (MapType1Type RefType realType))) (= (type x@@20) RefType)) (and (state Heap@@70 Mask@@43) (< AssumeFunctionsAbove 0))) (= (funP2 Heap@@70 x@@20) (U_2_int (MapType0Select Heap@@70 x@@20 f_7))))
 :qid |stdinbpl.1262:15|
 :skolemid |82|
 :pattern ( (state Heap@@70 Mask@@43) (funP2 Heap@@70 x@@20))
 :pattern ( (state Heap@@70 Mask@@43) (|funP2#triggerStateless| x@@20) (|P#trigger| Heap@@70 (P x@@20)))
)))
(assert (forall ((Heap@@71 T@U) (Mask@@44 T@U) (x@@21 T@U) ) (!  (=> (and (and (and (= (type Heap@@71) (MapType0Type RefType)) (= (type Mask@@44) (MapType1Type RefType realType))) (= (type x@@21) RefType)) (and (state Heap@@71 Mask@@44) (< AssumeFunctionsAbove 6))) (= (funP Heap@@71 x@@21) (U_2_int (MapType0Select Heap@@71 x@@21 f_7))))
 :qid |stdinbpl.1174:15|
 :skolemid |78|
 :pattern ( (state Heap@@71 Mask@@44) (funP Heap@@71 x@@21))
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
 :qid |stdinbpl.180:25|
 :skolemid |20|
 :pattern ( (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun Heap@@72 () T@U)
(declare-fun r_1@@36 () T@U)
(declare-fun Result@0 () Bool)
(declare-fun Mask@0 () T@U)
(assert  (and (and (= (type Heap@@72) (MapType0Type RefType)) (= (type r_1@@36) RefType)) (= (type Mask@0) (MapType1Type RefType realType))))
(set-info :boogie-vc-id |isGreaterOne35#definedness|)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 11) (let ((anon5_Else_correct true))
(let ((anon5_Then_correct  (=> (and (> (U_2_int (MapType0Select Heap@@72 r_1@@36 f_7)) 60) (= (ControlFlow 0 4) (- 0 3))) Result@0)))
(let ((anon4_Else_correct  (=> (= Result@0 (|isGreaterOne'| Heap@@72 (U_2_int (MapType0Select Heap@@72 r_1@@36 f_7)))) (and (=> (= (ControlFlow 0 6) (- 0 7)) (HasDirectPerm Mask@0 r_1@@36 f_7)) (=> (HasDirectPerm Mask@0 r_1@@36 f_7) (and (=> (= (ControlFlow 0 6) 4) anon5_Then_correct) (=> (= (ControlFlow 0 6) 5) anon5_Else_correct)))))))
(let ((anon4_Then_correct  (=> (= (ControlFlow 0 2) (- 0 1)) (> (U_2_int (MapType0Select Heap@@72 r_1@@36 f_7)) (- 0 60)))))
(let ((anon0_correct  (=> (and (state Heap@@72 ZeroMask) (U_2_bool (MapType0Select Heap@@72 r_1@@36 $allocated))) (=> (and (and (= AssumeFunctionsAbove 3) (not (= r_1@@36 null))) (and (= Mask@0 (MapType1Store ZeroMask r_1@@36 f_7 (real_2_U (+ (U_2_real (MapType1Select ZeroMask r_1@@36 f_7)) FullPerm)))) (state Heap@@72 Mask@0))) (and (=> (= (ControlFlow 0 8) (- 0 10)) (HasDirectPerm Mask@0 r_1@@36 f_7)) (=> (HasDirectPerm Mask@0 r_1@@36 f_7) (=> (and (> (U_2_int (MapType0Select Heap@@72 r_1@@36 f_7)) (- 0 38)) (state Heap@@72 Mask@0)) (and (=> (= (ControlFlow 0 8) (- 0 9)) (HasDirectPerm Mask@0 r_1@@36 f_7)) (=> (HasDirectPerm Mask@0 r_1@@36 f_7) (and (=> (= (ControlFlow 0 8) 2) anon4_Then_correct) (=> (= (ControlFlow 0 8) 6) anon4_Else_correct)))))))))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 11) 8) anon0_correct)))
PreconditionGeneratedEntry_correct)))))))
))
(check-sat)
(pop 1)
; Valid
(get-info :rlimit)
(reset)
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
(declare-fun f_7 () T@U)
(declare-fun FieldType (T@T T@T) T@T)
(declare-fun FieldTypeInv0 (T@T) T@T)
(declare-fun FieldTypeInv1 (T@T) T@T)
(declare-fun NormalFieldType () T@T)
(declare-fun state (T@U T@U) Bool)
(declare-fun |isGreaterOne34'| (T@U T@U) Bool)
(declare-fun MapType0Type (T@T) T@T)
(declare-fun RefType () T@T)
(declare-fun MapType1Type (T@T T@T) T@T)
(declare-fun AssumeFunctionsAbove () Int)
(declare-fun |isGreaterOne34#trigger| (T@U T@U) Bool)
(declare-fun FrameFragment (T@U) T@U)
(declare-fun MapType0Select (T@U T@U T@U) T@U)
(declare-fun MapType0TypeInv0 (T@T) T@T)
(declare-fun MapType0Store (T@U T@U T@U T@U) T@U)
(declare-fun MapType1TypeInv0 (T@T) T@T)
(declare-fun MapType1TypeInv1 (T@T) T@T)
(declare-fun MapType1Select (T@U T@U T@U) T@U)
(declare-fun MapType1Store (T@U T@U T@U T@U) T@U)
(declare-fun FrameTypeType () T@T)
(declare-fun |isGreaterOne2'| (T@U T@U) Bool)
(declare-fun |isGreaterOne2#trigger| (T@U T@U) Bool)
(declare-fun |isGreaterOne35'| (T@U T@U) Bool)
(declare-fun |isGreaterOne35#trigger| (T@U T@U) Bool)
(declare-fun |isGreaterOne22'| (T@U T@U) Bool)
(declare-fun |isGreaterOne22#trigger| (T@U T@U) Bool)
(declare-fun |isGreaterOne3'| (T@U T@U) Bool)
(declare-fun |isGreaterOne3#trigger| (T@U T@U) Bool)
(declare-fun |isGreaterOne32'| (T@U T@U) Bool)
(declare-fun |isGreaterOne32#trigger| (T@U T@U) Bool)
(declare-fun succHeap (T@U T@U) Bool)
(declare-fun succHeapTrans (T@U T@U) Bool)
(declare-fun GoodMask (T@U) Bool)
(declare-fun IdenticalOnKnownLocations (T@U T@U T@U) Bool)
(declare-fun IsPredicateField (T@U) Bool)
(declare-fun null () T@U)
(declare-fun PredicateMaskField (T@U) T@U)
(declare-fun HasDirectPerm (T@U T@U T@U) Bool)
(declare-fun IsWandField (T@U) Bool)
(declare-fun WandMaskField (T@U) T@U)
(declare-fun P (T@U) T@U)
(declare-fun PredicateType_PType () T@T)
(declare-fun |isGreaterOne'| (T@U Int) Bool)
(declare-fun dummyFunction (T@U) Bool)
(declare-fun |isGreaterOne#triggerStateless| (Int) Bool)
(declare-fun |isGreaterOne2#triggerStateless| (T@U) Bool)
(declare-fun |isGreaterOne22#triggerStateless| (T@U) Bool)
(declare-fun |isGreaterOne3#triggerStateless| (T@U) Bool)
(declare-fun |isGreaterOne32#triggerStateless| (T@U) Bool)
(declare-fun |isGreaterOne33'| (T@U T@U) Bool)
(declare-fun |isGreaterOne33#triggerStateless| (T@U) Bool)
(declare-fun |isGreaterOne34#triggerStateless| (T@U) Bool)
(declare-fun |isGreaterOne35#triggerStateless| (T@U) Bool)
(declare-fun |fac1'| (T@U Int) Int)
(declare-fun |fac1#triggerStateless| (Int) Int)
(declare-fun |fac2'| (T@U Int) Int)
(declare-fun |fac2#triggerStateless| (Int) Int)
(declare-fun |fac3'| (T@U Int) Int)
(declare-fun |fac3#triggerStateless| (Int) Int)
(declare-fun |funP'| (T@U T@U) Int)
(declare-fun |funP#triggerStateless| (T@U) Int)
(declare-fun |funP2'| (T@U T@U) Int)
(declare-fun |funP2#triggerStateless| (T@U) Int)
(declare-fun |P#trigger| (T@U T@U) Bool)
(declare-fun |P#everUsed| (T@U) Bool)
(declare-fun fac1 (T@U Int) Int)
(declare-fun fac2 (T@U Int) Int)
(declare-fun fac3 (T@U Int) Int)
(declare-fun funP (T@U T@U) Int)
(declare-fun funP2 (T@U T@U) Int)
(declare-fun isGreaterOne (T@U Int) Bool)
(declare-fun |P#sm| (T@U) T@U)
(declare-fun dummyHeap () T@U)
(declare-fun ZeroMask () T@U)
(declare-fun InsidePredicate (T@U T@U T@U T@U) Bool)
(declare-fun |isGreaterOne33#trigger| (T@U T@U) Bool)
(declare-fun sumMask (T@U T@U T@U) Bool)
(declare-fun isGreaterOne34 (T@U T@U) Bool)
(declare-fun isGreaterOne2 (T@U T@U) Bool)
(declare-fun isGreaterOne35 (T@U T@U) Bool)
(declare-fun isGreaterOne22 (T@U T@U) Bool)
(declare-fun isGreaterOne3 (T@U T@U) Bool)
(declare-fun isGreaterOne32 (T@U T@U) Bool)
(declare-fun ConditionalFrame (Real T@U) T@U)
(declare-fun EmptyFrame () T@U)
(declare-fun NoPerm () Real)
(declare-fun |isGreaterOne#frame| (T@U Int) Bool)
(declare-fun |isGreaterOne#trigger| (T@U Int) Bool)
(declare-fun |isGreaterOne2#frame| (T@U T@U) Bool)
(declare-fun |isGreaterOne22#frame| (T@U T@U) Bool)
(declare-fun |isGreaterOne3#frame| (T@U T@U) Bool)
(declare-fun |isGreaterOne32#frame| (T@U T@U) Bool)
(declare-fun |isGreaterOne33#frame| (T@U T@U) Bool)
(declare-fun |isGreaterOne34#frame| (T@U T@U) Bool)
(declare-fun |isGreaterOne35#frame| (T@U T@U) Bool)
(declare-fun isGreaterOne33 (T@U T@U) Bool)
(declare-fun getPredWandId (T@U) Int)
(declare-fun FullPerm () Real)
(declare-fun |fac1#frame| (T@U Int) Int)
(declare-fun |fac2#frame| (T@U Int) Int)
(declare-fun |fac3#frame| (T@U Int) Int)
(declare-fun |funP#frame| (T@U T@U) Int)
(declare-fun |funP2#frame| (T@U T@U) Int)
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
))) (= (Ctor NormalFieldType) 7)) (= (type $allocated) (FieldType NormalFieldType boolType))) (= (type f_7) (FieldType NormalFieldType intType))))
(assert (distinct $allocated f_7)
)
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (forall ((arg0@@14 T@T) ) (! (= (Ctor (MapType0Type arg0@@14)) 8)
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
)))) (= (Ctor RefType) 9)) (forall ((arg0@@18 T@T) (arg1@@4 T@T) ) (! (= (Ctor (MapType1Type arg0@@18 arg1@@4)) 10)
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
)))) (= (Ctor FrameTypeType) 11)) (forall ((arg0@@23 T@U) ) (! (= (type (FrameFragment arg0@@23)) FrameTypeType)
 :qid |funType:FrameFragment|
 :pattern ( (FrameFragment arg0@@23))
))))
(assert (forall ((Heap T@U) (Mask T@U) (r_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap) (MapType0Type RefType)) (= (type Mask) (MapType1Type RefType realType))) (= (type r_1) RefType)) (and (state Heap Mask) (or (< AssumeFunctionsAbove 1) (|isGreaterOne34#trigger| (FrameFragment (MapType0Select Heap r_1 f_7)) r_1)))) (> (U_2_int (MapType0Select Heap r_1 f_7)) (- 0 38))) (> (U_2_int (MapType0Select Heap r_1 f_7)) 60)) (|isGreaterOne34'| Heap r_1))
 :qid |stdinbpl.802:15|
 :skolemid |58|
 :pattern ( (state Heap Mask) (|isGreaterOne34'| Heap r_1))
)))
(assert (forall ((Heap@@0 T@U) (Mask@@0 T@U) (r_1@@0 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@0) (MapType0Type RefType)) (= (type Mask@@0) (MapType1Type RefType realType))) (= (type r_1@@0) RefType)) (and (state Heap@@0 Mask@@0) (or (< AssumeFunctionsAbove 2) (|isGreaterOne2#trigger| (FrameFragment (MapType0Select Heap@@0 r_1@@0 f_7)) r_1@@0)))) (> (U_2_int (MapType0Select Heap@@0 r_1@@0 f_7)) (- 0 38))) (> (U_2_int (MapType0Select Heap@@0 r_1@@0 f_7)) 60)) (|isGreaterOne2'| Heap@@0 r_1@@0))
 :qid |stdinbpl.297:15|
 :skolemid |31|
 :pattern ( (state Heap@@0 Mask@@0) (|isGreaterOne2'| Heap@@0 r_1@@0))
)))
(assert (forall ((Heap@@1 T@U) (Mask@@1 T@U) (r_1@@1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@1) (MapType0Type RefType)) (= (type Mask@@1) (MapType1Type RefType realType))) (= (type r_1@@1) RefType)) (and (state Heap@@1 Mask@@1) (or (< AssumeFunctionsAbove 3) (|isGreaterOne35#trigger| (FrameFragment (MapType0Select Heap@@1 r_1@@1 f_7)) r_1@@1)))) (> (U_2_int (MapType0Select Heap@@1 r_1@@1 f_7)) (- 0 38))) (> (U_2_int (MapType0Select Heap@@1 r_1@@1 f_7)) 60)) (|isGreaterOne35'| Heap@@1 r_1@@1))
 :qid |stdinbpl.900:15|
 :skolemid |63|
 :pattern ( (state Heap@@1 Mask@@1) (|isGreaterOne35'| Heap@@1 r_1@@1))
)))
(assert (forall ((Heap@@2 T@U) (Mask@@2 T@U) (r_1@@2 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@2) (MapType0Type RefType)) (= (type Mask@@2) (MapType1Type RefType realType))) (= (type r_1@@2) RefType)) (and (state Heap@@2 Mask@@2) (or (< AssumeFunctionsAbove 5) (|isGreaterOne22#trigger| (FrameFragment (MapType0Select Heap@@2 r_1@@2 f_7)) r_1@@2)))) (> (U_2_int (MapType0Select Heap@@2 r_1@@2 f_7)) (- 0 38))) (> (U_2_int (MapType0Select Heap@@2 r_1@@2 f_7)) 60)) (|isGreaterOne22'| Heap@@2 r_1@@2))
 :qid |stdinbpl.395:15|
 :skolemid |36|
 :pattern ( (state Heap@@2 Mask@@2) (|isGreaterOne22'| Heap@@2 r_1@@2))
)))
(assert (forall ((Heap@@3 T@U) (Mask@@3 T@U) (r_1@@3 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@3) (MapType0Type RefType)) (= (type Mask@@3) (MapType1Type RefType realType))) (= (type r_1@@3) RefType)) (and (state Heap@@3 Mask@@3) (or (< AssumeFunctionsAbove 8) (|isGreaterOne3#trigger| (FrameFragment (MapType0Select Heap@@3 r_1@@3 f_7)) r_1@@3)))) (> (U_2_int (MapType0Select Heap@@3 r_1@@3 f_7)) (- 0 38))) (> (U_2_int (MapType0Select Heap@@3 r_1@@3 f_7)) 60)) (|isGreaterOne3'| Heap@@3 r_1@@3))
 :qid |stdinbpl.503:15|
 :skolemid |42|
 :pattern ( (state Heap@@3 Mask@@3) (|isGreaterOne3'| Heap@@3 r_1@@3))
)))
(assert (forall ((Heap@@4 T@U) (Mask@@4 T@U) (r_1@@4 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@4) (MapType0Type RefType)) (= (type Mask@@4) (MapType1Type RefType realType))) (= (type r_1@@4) RefType)) (and (state Heap@@4 Mask@@4) (or (< AssumeFunctionsAbove 11) (|isGreaterOne32#trigger| (FrameFragment (MapType0Select Heap@@4 r_1@@4 f_7)) r_1@@4)))) (> (U_2_int (MapType0Select Heap@@4 r_1@@4 f_7)) (- 0 38))) (> (U_2_int (MapType0Select Heap@@4 r_1@@4 f_7)) 60)) (|isGreaterOne32'| Heap@@4 r_1@@4))
 :qid |stdinbpl.601:15|
 :skolemid |47|
 :pattern ( (state Heap@@4 Mask@@4) (|isGreaterOne32'| Heap@@4 r_1@@4))
)))
(assert (forall ((Heap0 T@U) (Heap1 T@U) ) (!  (=> (and (and (= (type Heap0) (MapType0Type RefType)) (= (type Heap1) (MapType0Type RefType))) (succHeap Heap0 Heap1)) (succHeapTrans Heap0 Heap1))
 :qid |stdinbpl.88:15|
 :skolemid |11|
 :pattern ( (succHeap Heap0 Heap1))
)))
(assert (forall ((Heap@@5 T@U) (Mask@@5 T@U) ) (!  (=> (and (and (= (type Heap@@5) (MapType0Type RefType)) (= (type Mask@@5) (MapType1Type RefType realType))) (state Heap@@5 Mask@@5)) (GoodMask Mask@@5))
 :qid |stdinbpl.124:15|
 :skolemid |15|
 :pattern ( (state Heap@@5 Mask@@5))
)))
(assert (forall ((Heap0@@0 T@U) (Heap1@@0 T@U) (Heap2 T@U) ) (!  (=> (and (and (and (= (type Heap0@@0) (MapType0Type RefType)) (= (type Heap1@@0) (MapType0Type RefType))) (= (type Heap2) (MapType0Type RefType))) (and (succHeapTrans Heap0@@0 Heap1@@0) (succHeap Heap1@@0 Heap2))) (succHeapTrans Heap0@@0 Heap2))
 :qid |stdinbpl.93:15|
 :skolemid |12|
 :pattern ( (succHeapTrans Heap0@@0 Heap1@@0) (succHeap Heap1@@0 Heap2))
)))
(assert  (and (= (type null) RefType) (forall ((arg0@@24 T@U) ) (! (let ((A (FieldTypeInv0 (type arg0@@24))))
(= (type (PredicateMaskField arg0@@24)) (FieldType A (MapType1Type RefType boolType))))
 :qid |funType:PredicateMaskField|
 :pattern ( (PredicateMaskField arg0@@24))
))))
(assert (forall ((Heap@@6 T@U) (ExhaleHeap T@U) (Mask@@6 T@U) (pm_f T@U) ) (! (let ((C (FieldTypeInv0 (type pm_f))))
 (=> (and (and (and (and (and (= (type Heap@@6) (MapType0Type RefType)) (= (type ExhaleHeap) (MapType0Type RefType))) (= (type Mask@@6) (MapType1Type RefType realType))) (= (type pm_f) (FieldType C FrameTypeType))) (IdenticalOnKnownLocations Heap@@6 ExhaleHeap Mask@@6)) (and (HasDirectPerm Mask@@6 null pm_f) (IsPredicateField pm_f))) (= (MapType0Select Heap@@6 null (PredicateMaskField pm_f)) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))))
 :qid |stdinbpl.47:19|
 :skolemid |2|
 :pattern ( (IdenticalOnKnownLocations Heap@@6 ExhaleHeap Mask@@6) (IsPredicateField pm_f) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))
)))
(assert (forall ((arg0@@25 T@U) ) (! (let ((A@@0 (FieldTypeInv0 (type arg0@@25))))
(= (type (WandMaskField arg0@@25)) (FieldType A@@0 (MapType1Type RefType boolType))))
 :qid |funType:WandMaskField|
 :pattern ( (WandMaskField arg0@@25))
)))
(assert (forall ((Heap@@7 T@U) (ExhaleHeap@@0 T@U) (Mask@@7 T@U) (pm_f@@0 T@U) ) (! (let ((C@@0 (FieldTypeInv0 (type pm_f@@0))))
 (=> (and (and (and (and (and (= (type Heap@@7) (MapType0Type RefType)) (= (type ExhaleHeap@@0) (MapType0Type RefType))) (= (type Mask@@7) (MapType1Type RefType realType))) (= (type pm_f@@0) (FieldType C@@0 FrameTypeType))) (IdenticalOnKnownLocations Heap@@7 ExhaleHeap@@0 Mask@@7)) (and (HasDirectPerm Mask@@7 null pm_f@@0) (IsWandField pm_f@@0))) (= (MapType0Select Heap@@7 null (WandMaskField pm_f@@0)) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))))
 :qid |stdinbpl.60:19|
 :skolemid |5|
 :pattern ( (IdenticalOnKnownLocations Heap@@7 ExhaleHeap@@0 Mask@@7) (IsWandField pm_f@@0) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))
)))
(assert (forall ((Heap@@8 T@U) (Mask@@8 T@U) (r_1@@5 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@8) (MapType0Type RefType)) (= (type Mask@@8) (MapType1Type RefType realType))) (= (type r_1@@5) RefType)) (and (state Heap@@8 Mask@@8) (or (< AssumeFunctionsAbove 5) (|isGreaterOne22#trigger| (FrameFragment (MapType0Select Heap@@8 r_1@@5 f_7)) r_1@@5)))) (> (U_2_int (MapType0Select Heap@@8 r_1@@5 f_7)) (- 0 38))) (= (|isGreaterOne22'| Heap@@8 r_1@@5) (> (U_2_int (MapType0Select Heap@@8 r_1@@5 f_7)) 1)))
 :qid |stdinbpl.399:15|
 :skolemid |37|
 :pattern ( (state Heap@@8 Mask@@8) (|isGreaterOne22'| Heap@@8 r_1@@5))
)))
(assert (forall ((Heap@@9 T@U) (Mask@@9 T@U) (r_1@@6 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@9) (MapType0Type RefType)) (= (type Mask@@9) (MapType1Type RefType realType))) (= (type r_1@@6) RefType)) (and (state Heap@@9 Mask@@9) (or (< AssumeFunctionsAbove 11) (|isGreaterOne32#trigger| (FrameFragment (MapType0Select Heap@@9 r_1@@6 f_7)) r_1@@6)))) (> (U_2_int (MapType0Select Heap@@9 r_1@@6 f_7)) (- 0 38))) (= (|isGreaterOne32'| Heap@@9 r_1@@6) (> (U_2_int (MapType0Select Heap@@9 r_1@@6 f_7)) 1)))
 :qid |stdinbpl.605:15|
 :skolemid |48|
 :pattern ( (state Heap@@9 Mask@@9) (|isGreaterOne32'| Heap@@9 r_1@@6))
)))
(assert  (and (= (Ctor PredicateType_PType) 12) (forall ((arg0@@26 T@U) ) (! (= (type (P arg0@@26)) (FieldType PredicateType_PType FrameTypeType))
 :qid |funType:P|
 :pattern ( (P arg0@@26))
))))
(assert (forall ((x@@8 T@U) ) (!  (=> (= (type x@@8) RefType) (IsPredicateField (P x@@8)))
 :qid |stdinbpl.1344:15|
 :skolemid |85|
 :pattern ( (P x@@8))
)))
(assert (forall ((Heap@@10 T@U) (i Int) ) (!  (=> (= (type Heap@@10) (MapType0Type RefType)) (dummyFunction (bool_2_U (|isGreaterOne#triggerStateless| i))))
 :qid |stdinbpl.209:15|
 :skolemid |23|
 :pattern ( (|isGreaterOne'| Heap@@10 i))
)))
(assert (forall ((Heap@@11 T@U) (r_1@@7 T@U) ) (!  (=> (and (= (type Heap@@11) (MapType0Type RefType)) (= (type r_1@@7) RefType)) (dummyFunction (bool_2_U (|isGreaterOne2#triggerStateless| r_1@@7))))
 :qid |stdinbpl.278:15|
 :skolemid |28|
 :pattern ( (|isGreaterOne2'| Heap@@11 r_1@@7))
)))
(assert (forall ((Heap@@12 T@U) (r_1@@8 T@U) ) (!  (=> (and (= (type Heap@@12) (MapType0Type RefType)) (= (type r_1@@8) RefType)) (dummyFunction (bool_2_U (|isGreaterOne22#triggerStateless| r_1@@8))))
 :qid |stdinbpl.376:15|
 :skolemid |33|
 :pattern ( (|isGreaterOne22'| Heap@@12 r_1@@8))
)))
(assert (forall ((Heap@@13 T@U) (r_1@@9 T@U) ) (!  (=> (and (= (type Heap@@13) (MapType0Type RefType)) (= (type r_1@@9) RefType)) (dummyFunction (bool_2_U (|isGreaterOne3#triggerStateless| r_1@@9))))
 :qid |stdinbpl.484:15|
 :skolemid |39|
 :pattern ( (|isGreaterOne3'| Heap@@13 r_1@@9))
)))
(assert (forall ((Heap@@14 T@U) (r_1@@10 T@U) ) (!  (=> (and (= (type Heap@@14) (MapType0Type RefType)) (= (type r_1@@10) RefType)) (dummyFunction (bool_2_U (|isGreaterOne32#triggerStateless| r_1@@10))))
 :qid |stdinbpl.582:15|
 :skolemid |44|
 :pattern ( (|isGreaterOne32'| Heap@@14 r_1@@10))
)))
(assert (forall ((Heap@@15 T@U) (r_1@@11 T@U) ) (!  (=> (and (= (type Heap@@15) (MapType0Type RefType)) (= (type r_1@@11) RefType)) (dummyFunction (bool_2_U (|isGreaterOne33#triggerStateless| r_1@@11))))
 :qid |stdinbpl.690:15|
 :skolemid |50|
 :pattern ( (|isGreaterOne33'| Heap@@15 r_1@@11))
)))
(assert (forall ((Heap@@16 T@U) (r_1@@12 T@U) ) (!  (=> (and (= (type Heap@@16) (MapType0Type RefType)) (= (type r_1@@12) RefType)) (dummyFunction (bool_2_U (|isGreaterOne34#triggerStateless| r_1@@12))))
 :qid |stdinbpl.783:15|
 :skolemid |55|
 :pattern ( (|isGreaterOne34'| Heap@@16 r_1@@12))
)))
(assert (forall ((Heap@@17 T@U) (r_1@@13 T@U) ) (!  (=> (and (= (type Heap@@17) (MapType0Type RefType)) (= (type r_1@@13) RefType)) (dummyFunction (bool_2_U (|isGreaterOne35#triggerStateless| r_1@@13))))
 :qid |stdinbpl.881:15|
 :skolemid |60|
 :pattern ( (|isGreaterOne35'| Heap@@17 r_1@@13))
)))
(assert (forall ((Heap@@18 T@U) (i@@0 Int) ) (!  (=> (= (type Heap@@18) (MapType0Type RefType)) (dummyFunction (int_2_U (|fac1#triggerStateless| i@@0))))
 :qid |stdinbpl.979:15|
 :skolemid |65|
 :pattern ( (|fac1'| Heap@@18 i@@0))
)))
(assert (forall ((Heap@@19 T@U) (i@@1 Int) ) (!  (=> (= (type Heap@@19) (MapType0Type RefType)) (dummyFunction (int_2_U (|fac2#triggerStateless| i@@1))))
 :qid |stdinbpl.1042:15|
 :skolemid |69|
 :pattern ( (|fac2'| Heap@@19 i@@1))
)))
(assert (forall ((Heap@@20 T@U) (i@@2 Int) ) (!  (=> (= (type Heap@@20) (MapType0Type RefType)) (dummyFunction (int_2_U (|fac3#triggerStateless| i@@2))))
 :qid |stdinbpl.1105:15|
 :skolemid |73|
 :pattern ( (|fac3'| Heap@@20 i@@2))
)))
(assert (forall ((Heap@@21 T@U) (x@@9 T@U) ) (!  (=> (and (= (type Heap@@21) (MapType0Type RefType)) (= (type x@@9) RefType)) (dummyFunction (int_2_U (|funP#triggerStateless| x@@9))))
 :qid |stdinbpl.1168:15|
 :skolemid |77|
 :pattern ( (|funP'| Heap@@21 x@@9))
)))
(assert (forall ((Heap@@22 T@U) (x@@10 T@U) ) (!  (=> (and (= (type Heap@@22) (MapType0Type RefType)) (= (type x@@10) RefType)) (dummyFunction (int_2_U (|funP2#triggerStateless| x@@10))))
 :qid |stdinbpl.1256:15|
 :skolemid |81|
 :pattern ( (|funP2'| Heap@@22 x@@10))
)))
(assert (forall ((Heap@@23 T@U) (x@@11 T@U) ) (!  (=> (and (= (type Heap@@23) (MapType0Type RefType)) (= (type x@@11) RefType)) (|P#everUsed| (P x@@11)))
 :qid |stdinbpl.1363:15|
 :skolemid |89|
 :pattern ( (|P#trigger| Heap@@23 (P x@@11)))
)))
(assert (forall ((Heap@@24 T@U) (ExhaleHeap@@1 T@U) (Mask@@10 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@24) (MapType0Type RefType)) (= (type ExhaleHeap@@1) (MapType0Type RefType))) (= (type Mask@@10) (MapType1Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@24 ExhaleHeap@@1 Mask@@10)) (U_2_bool (MapType0Select Heap@@24 o_1 $allocated))) (U_2_bool (MapType0Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.73:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@24 ExhaleHeap@@1 Mask@@10) (MapType0Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert (forall ((Heap@@25 T@U) (i@@3 Int) ) (!  (=> (= (type Heap@@25) (MapType0Type RefType)) (and (= (fac1 Heap@@25 i@@3) (|fac1'| Heap@@25 i@@3)) (dummyFunction (int_2_U (|fac1#triggerStateless| i@@3)))))
 :qid |stdinbpl.975:15|
 :skolemid |64|
 :pattern ( (fac1 Heap@@25 i@@3))
)))
(assert (forall ((Heap@@26 T@U) (i@@4 Int) ) (!  (=> (= (type Heap@@26) (MapType0Type RefType)) (and (= (fac2 Heap@@26 i@@4) (|fac2'| Heap@@26 i@@4)) (dummyFunction (int_2_U (|fac2#triggerStateless| i@@4)))))
 :qid |stdinbpl.1038:15|
 :skolemid |68|
 :pattern ( (fac2 Heap@@26 i@@4))
)))
(assert (forall ((Heap@@27 T@U) (i@@5 Int) ) (!  (=> (= (type Heap@@27) (MapType0Type RefType)) (and (= (fac3 Heap@@27 i@@5) (|fac3'| Heap@@27 i@@5)) (dummyFunction (int_2_U (|fac3#triggerStateless| i@@5)))))
 :qid |stdinbpl.1101:15|
 :skolemid |72|
 :pattern ( (fac3 Heap@@27 i@@5))
)))
(assert (forall ((Heap@@28 T@U) (x@@12 T@U) ) (!  (=> (and (= (type Heap@@28) (MapType0Type RefType)) (= (type x@@12) RefType)) (and (= (funP Heap@@28 x@@12) (|funP'| Heap@@28 x@@12)) (dummyFunction (int_2_U (|funP#triggerStateless| x@@12)))))
 :qid |stdinbpl.1164:15|
 :skolemid |76|
 :pattern ( (funP Heap@@28 x@@12))
)))
(assert (forall ((Heap@@29 T@U) (x@@13 T@U) ) (!  (=> (and (= (type Heap@@29) (MapType0Type RefType)) (= (type x@@13) RefType)) (and (= (funP2 Heap@@29 x@@13) (|funP2'| Heap@@29 x@@13)) (dummyFunction (int_2_U (|funP2#triggerStateless| x@@13)))))
 :qid |stdinbpl.1252:15|
 :skolemid |80|
 :pattern ( (funP2 Heap@@29 x@@13))
)))
(assert (forall ((Heap@@30 T@U) (Mask@@11 T@U) (i@@6 Int) ) (!  (=> (and (and (and (= (type Heap@@30) (MapType0Type RefType)) (= (type Mask@@11) (MapType1Type RefType realType))) (and (state Heap@@30 Mask@@11) (< AssumeFunctionsAbove 12))) (> i@@6 (- 0 60))) (= (isGreaterOne Heap@@30 i@@6) (> i@@6 1)))
 :qid |stdinbpl.215:15|
 :skolemid |24|
 :pattern ( (state Heap@@30 Mask@@11) (isGreaterOne Heap@@30 i@@6))
)))
(assert (forall ((x@@14 T@U) (x2 T@U) ) (!  (=> (and (and (= (type x@@14) RefType) (= (type x2) RefType)) (= (P x@@14) (P x2))) (= x@@14 x2))
 :qid |stdinbpl.1354:15|
 :skolemid |87|
 :pattern ( (P x@@14) (P x2))
)))
(assert (forall ((arg0@@27 T@U) ) (! (= (type (|P#sm| arg0@@27)) (FieldType PredicateType_PType (MapType1Type RefType boolType)))
 :qid |funType:P#sm|
 :pattern ( (|P#sm| arg0@@27))
)))
(assert (forall ((x@@15 T@U) (x2@@0 T@U) ) (!  (=> (and (and (= (type x@@15) RefType) (= (type x2@@0) RefType)) (= (|P#sm| x@@15) (|P#sm| x2@@0))) (= x@@15 x2@@0))
 :qid |stdinbpl.1358:15|
 :skolemid |88|
 :pattern ( (|P#sm| x@@15) (|P#sm| x2@@0))
)))
(assert (forall ((Heap@@31 T@U) (Mask@@12 T@U) (i@@7 Int) ) (!  (=> (and (and (= (type Heap@@31) (MapType0Type RefType)) (= (type Mask@@12) (MapType1Type RefType realType))) (and (state Heap@@31 Mask@@12) (< AssumeFunctionsAbove 4))) (= (fac2 Heap@@31 i@@7) (ite (<= i@@7 1) 1 (* i@@7 (|fac2'| Heap@@31 (- i@@7 1))))))
 :qid |stdinbpl.1048:15|
 :skolemid |70|
 :pattern ( (state Heap@@31 Mask@@12) (fac2 Heap@@31 i@@7))
)))
(assert (forall ((Heap@@32 T@U) (Mask@@13 T@U) (i@@8 Int) ) (!  (=> (and (and (= (type Heap@@32) (MapType0Type RefType)) (= (type Mask@@13) (MapType1Type RefType realType))) (and (state Heap@@32 Mask@@13) (< AssumeFunctionsAbove 9))) (= (fac3 Heap@@32 i@@8) (ite (<= i@@8 1) 1 (* i@@8 (|fac3'| Heap@@32 (- i@@8 1))))))
 :qid |stdinbpl.1111:15|
 :skolemid |74|
 :pattern ( (state Heap@@32 Mask@@13) (fac3 Heap@@32 i@@8))
)))
(assert (forall ((Heap@@33 T@U) (Mask@@14 T@U) (i@@9 Int) ) (!  (=> (and (and (= (type Heap@@33) (MapType0Type RefType)) (= (type Mask@@14) (MapType1Type RefType realType))) (and (state Heap@@33 Mask@@14) (< AssumeFunctionsAbove 10))) (= (fac1 Heap@@33 i@@9) (ite (<= i@@9 1) 1 (* i@@9 (|fac1'| Heap@@33 (- i@@9 1))))))
 :qid |stdinbpl.985:15|
 :skolemid |66|
 :pattern ( (state Heap@@33 Mask@@14) (fac1 Heap@@33 i@@9))
)))
(assert (forall ((Heap@@34 T@U) (ExhaleHeap@@2 T@U) (Mask@@15 T@U) (o_1@@0 T@U) (f_2 T@U) ) (! (let ((B@@1 (FieldTypeInv1 (type f_2))))
(let ((A@@1 (FieldTypeInv0 (type f_2))))
 (=> (and (and (and (and (and (and (= (type Heap@@34) (MapType0Type RefType)) (= (type ExhaleHeap@@2) (MapType0Type RefType))) (= (type Mask@@15) (MapType1Type RefType realType))) (= (type o_1@@0) RefType)) (= (type f_2) (FieldType A@@1 B@@1))) (IdenticalOnKnownLocations Heap@@34 ExhaleHeap@@2 Mask@@15)) (HasDirectPerm Mask@@15 o_1@@0 f_2)) (= (MapType0Select Heap@@34 o_1@@0 f_2) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2)))))
 :qid |stdinbpl.42:22|
 :skolemid |1|
 :pattern ( (IdenticalOnKnownLocations Heap@@34 ExhaleHeap@@2 Mask@@15) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2))
)))
(assert  (and (= (type dummyHeap) (MapType0Type RefType)) (= (type ZeroMask) (MapType1Type RefType realType))))
(assert (state dummyHeap ZeroMask))
(assert (forall ((p T@U) (v_1 T@U) (w T@U) ) (! (let ((A@@2 (FieldTypeInv0 (type p))))
 (=> (and (and (= (type p) (FieldType A@@2 FrameTypeType)) (= (type v_1) FrameTypeType)) (= (type w) FrameTypeType)) (not (InsidePredicate p v_1 p w))))
 :qid |stdinbpl.185:19|
 :skolemid |21|
 :pattern ( (InsidePredicate p v_1 p w))
)))
(assert (forall ((Heap@@35 T@U) (Mask@@16 T@U) (r_1@@14 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@35) (MapType0Type RefType)) (= (type Mask@@16) (MapType1Type RefType realType))) (= (type r_1@@14) RefType)) (and (state Heap@@35 Mask@@16) (or (< AssumeFunctionsAbove 7) (|isGreaterOne33#trigger| (FrameFragment (MapType0Select Heap@@35 r_1@@14 f_7)) r_1@@14)))) (> (U_2_int (MapType0Select Heap@@35 r_1@@14 f_7)) 60)) (|isGreaterOne33'| Heap@@35 r_1@@14))
 :qid |stdinbpl.709:15|
 :skolemid |53|
 :pattern ( (state Heap@@35 Mask@@16) (|isGreaterOne33'| Heap@@35 r_1@@14))
)))
(assert  (not (IsPredicateField f_7)))
(assert  (not (IsWandField f_7)))
(assert (forall ((Heap@@36 T@U) (ExhaleHeap@@3 T@U) (Mask@@17 T@U) ) (!  (=> (and (and (and (= (type Heap@@36) (MapType0Type RefType)) (= (type ExhaleHeap@@3) (MapType0Type RefType))) (= (type Mask@@17) (MapType1Type RefType realType))) (IdenticalOnKnownLocations Heap@@36 ExhaleHeap@@3 Mask@@17)) (succHeap Heap@@36 ExhaleHeap@@3))
 :qid |stdinbpl.83:15|
 :skolemid |10|
 :pattern ( (IdenticalOnKnownLocations Heap@@36 ExhaleHeap@@3 Mask@@17))
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
(assert (forall ((Heap@@37 T@U) (Mask@@18 T@U) (r_1@@15 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@37) (MapType0Type RefType)) (= (type Mask@@18) (MapType1Type RefType realType))) (= (type r_1@@15) RefType)) (and (state Heap@@37 Mask@@18) (< AssumeFunctionsAbove 1))) (> (U_2_int (MapType0Select Heap@@37 r_1@@15 f_7)) (- 0 38))) (= (isGreaterOne34 Heap@@37 r_1@@15) (isGreaterOne Heap@@37 (U_2_int (MapType0Select Heap@@37 r_1@@15 f_7)))))
 :qid |stdinbpl.789:15|
 :skolemid |56|
 :pattern ( (state Heap@@37 Mask@@18) (isGreaterOne34 Heap@@37 r_1@@15))
)))
(assert (forall ((Heap@@38 T@U) (Mask@@19 T@U) (r_1@@16 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@38) (MapType0Type RefType)) (= (type Mask@@19) (MapType1Type RefType realType))) (= (type r_1@@16) RefType)) (and (state Heap@@38 Mask@@19) (< AssumeFunctionsAbove 2))) (> (U_2_int (MapType0Select Heap@@38 r_1@@16 f_7)) (- 0 38))) (= (isGreaterOne2 Heap@@38 r_1@@16) (|isGreaterOne'| Heap@@38 (U_2_int (MapType0Select Heap@@38 r_1@@16 f_7)))))
 :qid |stdinbpl.284:15|
 :skolemid |29|
 :pattern ( (state Heap@@38 Mask@@19) (isGreaterOne2 Heap@@38 r_1@@16))
)))
(assert (forall ((Heap@@39 T@U) (Mask@@20 T@U) (r_1@@17 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@39) (MapType0Type RefType)) (= (type Mask@@20) (MapType1Type RefType realType))) (= (type r_1@@17) RefType)) (and (state Heap@@39 Mask@@20) (< AssumeFunctionsAbove 3))) (> (U_2_int (MapType0Select Heap@@39 r_1@@17 f_7)) (- 0 38))) (= (isGreaterOne35 Heap@@39 r_1@@17) (|isGreaterOne'| Heap@@39 (U_2_int (MapType0Select Heap@@39 r_1@@17 f_7)))))
 :qid |stdinbpl.887:15|
 :skolemid |61|
 :pattern ( (state Heap@@39 Mask@@20) (isGreaterOne35 Heap@@39 r_1@@17))
)))
(assert (forall ((Heap@@40 T@U) (Mask@@21 T@U) (r_1@@18 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@40) (MapType0Type RefType)) (= (type Mask@@21) (MapType1Type RefType realType))) (= (type r_1@@18) RefType)) (and (state Heap@@40 Mask@@21) (< AssumeFunctionsAbove 5))) (> (U_2_int (MapType0Select Heap@@40 r_1@@18 f_7)) (- 0 38))) (= (isGreaterOne22 Heap@@40 r_1@@18) (|isGreaterOne'| Heap@@40 (U_2_int (MapType0Select Heap@@40 r_1@@18 f_7)))))
 :qid |stdinbpl.382:15|
 :skolemid |34|
 :pattern ( (state Heap@@40 Mask@@21) (isGreaterOne22 Heap@@40 r_1@@18))
)))
(assert (forall ((Heap@@41 T@U) (Mask@@22 T@U) (r_1@@19 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@41) (MapType0Type RefType)) (= (type Mask@@22) (MapType1Type RefType realType))) (= (type r_1@@19) RefType)) (and (state Heap@@41 Mask@@22) (< AssumeFunctionsAbove 8))) (> (U_2_int (MapType0Select Heap@@41 r_1@@19 f_7)) (- 0 38))) (= (isGreaterOne3 Heap@@41 r_1@@19) (isGreaterOne Heap@@41 (U_2_int (MapType0Select Heap@@41 r_1@@19 f_7)))))
 :qid |stdinbpl.490:15|
 :skolemid |40|
 :pattern ( (state Heap@@41 Mask@@22) (isGreaterOne3 Heap@@41 r_1@@19))
)))
(assert (forall ((Heap@@42 T@U) (Mask@@23 T@U) (r_1@@20 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@42) (MapType0Type RefType)) (= (type Mask@@23) (MapType1Type RefType realType))) (= (type r_1@@20) RefType)) (and (state Heap@@42 Mask@@23) (< AssumeFunctionsAbove 11))) (> (U_2_int (MapType0Select Heap@@42 r_1@@20 f_7)) (- 0 38))) (= (isGreaterOne32 Heap@@42 r_1@@20) (isGreaterOne Heap@@42 (U_2_int (MapType0Select Heap@@42 r_1@@20 f_7)))))
 :qid |stdinbpl.588:15|
 :skolemid |45|
 :pattern ( (state Heap@@42 Mask@@23) (isGreaterOne32 Heap@@42 r_1@@20))
)))
(assert  (and (forall ((arg0@@28 Real) (arg1@@9 T@U) ) (! (= (type (ConditionalFrame arg0@@28 arg1@@9)) FrameTypeType)
 :qid |funType:ConditionalFrame|
 :pattern ( (ConditionalFrame arg0@@28 arg1@@9))
)) (= (type EmptyFrame) FrameTypeType)))
(assert (forall ((p@@0 Real) (f_6 T@U) ) (!  (=> (= (type f_6) FrameTypeType) (= (ConditionalFrame p@@0 f_6) (ite (> p@@0 0.0) f_6 EmptyFrame)))
 :qid |stdinbpl.173:15|
 :skolemid |19|
 :pattern ( (ConditionalFrame p@@0 f_6))
)))
(assert (forall ((Mask@@24 T@U) (o_2@@0 T@U) (f_4@@0 T@U) ) (! (let ((B@@3 (FieldTypeInv1 (type f_4@@0))))
(let ((A@@4 (FieldTypeInv0 (type f_4@@0))))
 (=> (and (and (= (type Mask@@24) (MapType1Type RefType realType)) (= (type o_2@@0) RefType)) (= (type f_4@@0) (FieldType A@@4 B@@3))) (= (HasDirectPerm Mask@@24 o_2@@0 f_4@@0) (> (U_2_real (MapType1Select Mask@@24 o_2@@0 f_4@@0)) NoPerm)))))
 :qid |stdinbpl.133:22|
 :skolemid |17|
 :pattern ( (HasDirectPerm Mask@@24 o_2@@0 f_4@@0))
)))
(assert (forall ((o_2@@1 T@U) (f_4@@1 T@U) ) (! (let ((B@@4 (FieldTypeInv1 (type f_4@@1))))
(let ((A@@5 (FieldTypeInv0 (type f_4@@1))))
 (=> (and (= (type o_2@@1) RefType) (= (type f_4@@1) (FieldType A@@5 B@@4))) (= (U_2_real (MapType1Select ZeroMask o_2@@1 f_4@@1)) NoPerm))))
 :qid |stdinbpl.106:22|
 :skolemid |13|
 :pattern ( (MapType1Select ZeroMask o_2@@1 f_4@@1))
)))
(assert (forall ((Heap@@43 T@U) (Mask@@25 T@U) (i@@10 Int) ) (!  (=> (and (and (= (type Heap@@43) (MapType0Type RefType)) (= (type Mask@@25) (MapType1Type RefType realType))) (state Heap@@43 Mask@@25)) (= (|isGreaterOne'| Heap@@43 i@@10) (|isGreaterOne#frame| EmptyFrame i@@10)))
 :qid |stdinbpl.222:15|
 :skolemid |25|
 :pattern ( (state Heap@@43 Mask@@25) (|isGreaterOne'| Heap@@43 i@@10))
)))
(assert (forall ((Heap@@44 T@U) (Mask@@26 T@U) (i@@11 Int) ) (!  (=> (and (and (and (and (= (type Heap@@44) (MapType0Type RefType)) (= (type Mask@@26) (MapType1Type RefType realType))) (and (state Heap@@44 Mask@@26) (or (< AssumeFunctionsAbove 12) (|isGreaterOne#trigger| EmptyFrame i@@11)))) (> i@@11 (- 0 60))) (> i@@11 60)) (|isGreaterOne'| Heap@@44 i@@11))
 :qid |stdinbpl.228:15|
 :skolemid |26|
 :pattern ( (state Heap@@44 Mask@@26) (|isGreaterOne'| Heap@@44 i@@11))
)))
(assert (forall ((Heap@@45 T@U) (Mask@@27 T@U) (r_1@@21 T@U) ) (!  (=> (and (and (and (= (type Heap@@45) (MapType0Type RefType)) (= (type Mask@@27) (MapType1Type RefType realType))) (= (type r_1@@21) RefType)) (state Heap@@45 Mask@@27)) (= (|isGreaterOne2'| Heap@@45 r_1@@21) (|isGreaterOne2#frame| (FrameFragment (MapType0Select Heap@@45 r_1@@21 f_7)) r_1@@21)))
 :qid |stdinbpl.291:15|
 :skolemid |30|
 :pattern ( (state Heap@@45 Mask@@27) (|isGreaterOne2'| Heap@@45 r_1@@21))
)))
(assert (forall ((Heap@@46 T@U) (Mask@@28 T@U) (r_1@@22 T@U) ) (!  (=> (and (and (and (= (type Heap@@46) (MapType0Type RefType)) (= (type Mask@@28) (MapType1Type RefType realType))) (= (type r_1@@22) RefType)) (state Heap@@46 Mask@@28)) (= (|isGreaterOne22'| Heap@@46 r_1@@22) (|isGreaterOne22#frame| (FrameFragment (MapType0Select Heap@@46 r_1@@22 f_7)) r_1@@22)))
 :qid |stdinbpl.389:15|
 :skolemid |35|
 :pattern ( (state Heap@@46 Mask@@28) (|isGreaterOne22'| Heap@@46 r_1@@22))
)))
(assert (forall ((Heap@@47 T@U) (Mask@@29 T@U) (r_1@@23 T@U) ) (!  (=> (and (and (and (= (type Heap@@47) (MapType0Type RefType)) (= (type Mask@@29) (MapType1Type RefType realType))) (= (type r_1@@23) RefType)) (state Heap@@47 Mask@@29)) (= (|isGreaterOne3'| Heap@@47 r_1@@23) (|isGreaterOne3#frame| (FrameFragment (MapType0Select Heap@@47 r_1@@23 f_7)) r_1@@23)))
 :qid |stdinbpl.497:15|
 :skolemid |41|
 :pattern ( (state Heap@@47 Mask@@29) (|isGreaterOne3'| Heap@@47 r_1@@23))
)))
(assert (forall ((Heap@@48 T@U) (Mask@@30 T@U) (r_1@@24 T@U) ) (!  (=> (and (and (and (= (type Heap@@48) (MapType0Type RefType)) (= (type Mask@@30) (MapType1Type RefType realType))) (= (type r_1@@24) RefType)) (state Heap@@48 Mask@@30)) (= (|isGreaterOne32'| Heap@@48 r_1@@24) (|isGreaterOne32#frame| (FrameFragment (MapType0Select Heap@@48 r_1@@24 f_7)) r_1@@24)))
 :qid |stdinbpl.595:15|
 :skolemid |46|
 :pattern ( (state Heap@@48 Mask@@30) (|isGreaterOne32'| Heap@@48 r_1@@24))
)))
(assert (forall ((Heap@@49 T@U) (Mask@@31 T@U) (r_1@@25 T@U) ) (!  (=> (and (and (and (= (type Heap@@49) (MapType0Type RefType)) (= (type Mask@@31) (MapType1Type RefType realType))) (= (type r_1@@25) RefType)) (state Heap@@49 Mask@@31)) (= (|isGreaterOne33'| Heap@@49 r_1@@25) (|isGreaterOne33#frame| (FrameFragment (MapType0Select Heap@@49 r_1@@25 f_7)) r_1@@25)))
 :qid |stdinbpl.703:15|
 :skolemid |52|
 :pattern ( (state Heap@@49 Mask@@31) (|isGreaterOne33'| Heap@@49 r_1@@25))
)))
(assert (forall ((Heap@@50 T@U) (Mask@@32 T@U) (r_1@@26 T@U) ) (!  (=> (and (and (and (= (type Heap@@50) (MapType0Type RefType)) (= (type Mask@@32) (MapType1Type RefType realType))) (= (type r_1@@26) RefType)) (state Heap@@50 Mask@@32)) (= (|isGreaterOne34'| Heap@@50 r_1@@26) (|isGreaterOne34#frame| (FrameFragment (MapType0Select Heap@@50 r_1@@26 f_7)) r_1@@26)))
 :qid |stdinbpl.796:15|
 :skolemid |57|
 :pattern ( (state Heap@@50 Mask@@32) (|isGreaterOne34'| Heap@@50 r_1@@26))
)))
(assert (forall ((Heap@@51 T@U) (Mask@@33 T@U) (r_1@@27 T@U) ) (!  (=> (and (and (and (= (type Heap@@51) (MapType0Type RefType)) (= (type Mask@@33) (MapType1Type RefType realType))) (= (type r_1@@27) RefType)) (state Heap@@51 Mask@@33)) (= (|isGreaterOne35'| Heap@@51 r_1@@27) (|isGreaterOne35#frame| (FrameFragment (MapType0Select Heap@@51 r_1@@27 f_7)) r_1@@27)))
 :qid |stdinbpl.894:15|
 :skolemid |62|
 :pattern ( (state Heap@@51 Mask@@33) (|isGreaterOne35'| Heap@@51 r_1@@27))
)))
(assert (forall ((Heap@@52 T@U) (i@@12 Int) ) (!  (=> (= (type Heap@@52) (MapType0Type RefType)) (and (= (isGreaterOne Heap@@52 i@@12) (|isGreaterOne'| Heap@@52 i@@12)) (dummyFunction (bool_2_U (|isGreaterOne#triggerStateless| i@@12)))))
 :qid |stdinbpl.205:15|
 :skolemid |22|
 :pattern ( (isGreaterOne Heap@@52 i@@12))
)))
(assert (forall ((Heap@@53 T@U) (r_1@@28 T@U) ) (!  (=> (and (= (type Heap@@53) (MapType0Type RefType)) (= (type r_1@@28) RefType)) (and (= (isGreaterOne2 Heap@@53 r_1@@28) (|isGreaterOne2'| Heap@@53 r_1@@28)) (dummyFunction (bool_2_U (|isGreaterOne2#triggerStateless| r_1@@28)))))
 :qid |stdinbpl.274:15|
 :skolemid |27|
 :pattern ( (isGreaterOne2 Heap@@53 r_1@@28))
)))
(assert (forall ((Heap@@54 T@U) (r_1@@29 T@U) ) (!  (=> (and (= (type Heap@@54) (MapType0Type RefType)) (= (type r_1@@29) RefType)) (and (= (isGreaterOne22 Heap@@54 r_1@@29) (|isGreaterOne22'| Heap@@54 r_1@@29)) (dummyFunction (bool_2_U (|isGreaterOne22#triggerStateless| r_1@@29)))))
 :qid |stdinbpl.372:15|
 :skolemid |32|
 :pattern ( (isGreaterOne22 Heap@@54 r_1@@29))
)))
(assert (forall ((Heap@@55 T@U) (r_1@@30 T@U) ) (!  (=> (and (= (type Heap@@55) (MapType0Type RefType)) (= (type r_1@@30) RefType)) (and (= (isGreaterOne3 Heap@@55 r_1@@30) (|isGreaterOne3'| Heap@@55 r_1@@30)) (dummyFunction (bool_2_U (|isGreaterOne3#triggerStateless| r_1@@30)))))
 :qid |stdinbpl.480:15|
 :skolemid |38|
 :pattern ( (isGreaterOne3 Heap@@55 r_1@@30))
)))
(assert (forall ((Heap@@56 T@U) (r_1@@31 T@U) ) (!  (=> (and (= (type Heap@@56) (MapType0Type RefType)) (= (type r_1@@31) RefType)) (and (= (isGreaterOne32 Heap@@56 r_1@@31) (|isGreaterOne32'| Heap@@56 r_1@@31)) (dummyFunction (bool_2_U (|isGreaterOne32#triggerStateless| r_1@@31)))))
 :qid |stdinbpl.578:15|
 :skolemid |43|
 :pattern ( (isGreaterOne32 Heap@@56 r_1@@31))
)))
(assert (forall ((Heap@@57 T@U) (r_1@@32 T@U) ) (!  (=> (and (= (type Heap@@57) (MapType0Type RefType)) (= (type r_1@@32) RefType)) (and (= (isGreaterOne33 Heap@@57 r_1@@32) (|isGreaterOne33'| Heap@@57 r_1@@32)) (dummyFunction (bool_2_U (|isGreaterOne33#triggerStateless| r_1@@32)))))
 :qid |stdinbpl.686:15|
 :skolemid |49|
 :pattern ( (isGreaterOne33 Heap@@57 r_1@@32))
)))
(assert (forall ((Heap@@58 T@U) (r_1@@33 T@U) ) (!  (=> (and (= (type Heap@@58) (MapType0Type RefType)) (= (type r_1@@33) RefType)) (and (= (isGreaterOne34 Heap@@58 r_1@@33) (|isGreaterOne34'| Heap@@58 r_1@@33)) (dummyFunction (bool_2_U (|isGreaterOne34#triggerStateless| r_1@@33)))))
 :qid |stdinbpl.779:15|
 :skolemid |54|
 :pattern ( (isGreaterOne34 Heap@@58 r_1@@33))
)))
(assert (forall ((Heap@@59 T@U) (r_1@@34 T@U) ) (!  (=> (and (= (type Heap@@59) (MapType0Type RefType)) (= (type r_1@@34) RefType)) (and (= (isGreaterOne35 Heap@@59 r_1@@34) (|isGreaterOne35'| Heap@@59 r_1@@34)) (dummyFunction (bool_2_U (|isGreaterOne35#triggerStateless| r_1@@34)))))
 :qid |stdinbpl.877:15|
 :skolemid |59|
 :pattern ( (isGreaterOne35 Heap@@59 r_1@@34))
)))
(assert (forall ((Heap@@60 T@U) (ExhaleHeap@@4 T@U) (Mask@@34 T@U) (pm_f@@1 T@U) ) (! (let ((C@@1 (FieldTypeInv0 (type pm_f@@1))))
 (=> (and (and (and (and (and (= (type Heap@@60) (MapType0Type RefType)) (= (type ExhaleHeap@@4) (MapType0Type RefType))) (= (type Mask@@34) (MapType1Type RefType realType))) (= (type pm_f@@1) (FieldType C@@1 FrameTypeType))) (IdenticalOnKnownLocations Heap@@60 ExhaleHeap@@4 Mask@@34)) (and (HasDirectPerm Mask@@34 null pm_f@@1) (IsPredicateField pm_f@@1))) (forall ((o2 T@U) (f_2@@0 T@U) ) (! (let ((B@@5 (FieldTypeInv1 (type f_2@@0))))
(let ((A@@6 (FieldTypeInv0 (type f_2@@0))))
 (=> (and (and (= (type o2) RefType) (= (type f_2@@0) (FieldType A@@6 B@@5))) (U_2_bool (MapType1Select (MapType0Select Heap@@60 null (PredicateMaskField pm_f@@1)) o2 f_2@@0))) (= (MapType0Select Heap@@60 o2 f_2@@0) (MapType0Select ExhaleHeap@@4 o2 f_2@@0)))))
 :qid |stdinbpl.54:134|
 :skolemid |3|
 :pattern ( (MapType0Select ExhaleHeap@@4 o2 f_2@@0))
))))
 :qid |stdinbpl.52:19|
 :skolemid |4|
 :pattern ( (IdenticalOnKnownLocations Heap@@60 ExhaleHeap@@4 Mask@@34) (IsPredicateField pm_f@@1))
)))
(assert (forall ((Heap@@61 T@U) (ExhaleHeap@@5 T@U) (Mask@@35 T@U) (pm_f@@2 T@U) ) (! (let ((C@@2 (FieldTypeInv0 (type pm_f@@2))))
 (=> (and (and (and (and (and (= (type Heap@@61) (MapType0Type RefType)) (= (type ExhaleHeap@@5) (MapType0Type RefType))) (= (type Mask@@35) (MapType1Type RefType realType))) (= (type pm_f@@2) (FieldType C@@2 FrameTypeType))) (IdenticalOnKnownLocations Heap@@61 ExhaleHeap@@5 Mask@@35)) (and (HasDirectPerm Mask@@35 null pm_f@@2) (IsWandField pm_f@@2))) (forall ((o2@@0 T@U) (f_2@@1 T@U) ) (! (let ((B@@6 (FieldTypeInv1 (type f_2@@1))))
(let ((A@@7 (FieldTypeInv0 (type f_2@@1))))
 (=> (and (and (= (type o2@@0) RefType) (= (type f_2@@1) (FieldType A@@7 B@@6))) (U_2_bool (MapType1Select (MapType0Select Heap@@61 null (WandMaskField pm_f@@2)) o2@@0 f_2@@1))) (= (MapType0Select Heap@@61 o2@@0 f_2@@1) (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1)))))
 :qid |stdinbpl.67:129|
 :skolemid |6|
 :pattern ( (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1))
))))
 :qid |stdinbpl.65:19|
 :skolemid |7|
 :pattern ( (IdenticalOnKnownLocations Heap@@61 ExhaleHeap@@5 Mask@@35) (IsWandField pm_f@@2))
)))
(assert (forall ((x@@16 T@U) ) (!  (=> (= (type x@@16) RefType) (= (getPredWandId (P x@@16)) 0))
 :qid |stdinbpl.1348:15|
 :skolemid |86|
 :pattern ( (P x@@16))
)))
(assert (forall ((Mask@@36 T@U) (o_2@@2 T@U) (f_4@@2 T@U) ) (! (let ((B@@7 (FieldTypeInv1 (type f_4@@2))))
(let ((A@@8 (FieldTypeInv0 (type f_4@@2))))
 (=> (and (and (and (= (type Mask@@36) (MapType1Type RefType realType)) (= (type o_2@@2) RefType)) (= (type f_4@@2) (FieldType A@@8 B@@7))) (GoodMask Mask@@36)) (and (>= (U_2_real (MapType1Select Mask@@36 o_2@@2 f_4@@2)) NoPerm) (=> (and (and (GoodMask Mask@@36) (not (IsPredicateField f_4@@2))) (not (IsWandField f_4@@2))) (<= (U_2_real (MapType1Select Mask@@36 o_2@@2 f_4@@2)) FullPerm))))))
 :qid |stdinbpl.128:22|
 :skolemid |16|
 :pattern ( (GoodMask Mask@@36) (MapType1Select Mask@@36 o_2@@2 f_4@@2))
)))
(assert (forall ((Heap@@62 T@U) (Mask@@37 T@U) (i@@13 Int) ) (!  (=> (and (and (= (type Heap@@62) (MapType0Type RefType)) (= (type Mask@@37) (MapType1Type RefType realType))) (state Heap@@62 Mask@@37)) (= (|fac1'| Heap@@62 i@@13) (|fac1#frame| EmptyFrame i@@13)))
 :qid |stdinbpl.992:15|
 :skolemid |67|
 :pattern ( (state Heap@@62 Mask@@37) (|fac1'| Heap@@62 i@@13))
)))
(assert (forall ((Heap@@63 T@U) (Mask@@38 T@U) (i@@14 Int) ) (!  (=> (and (and (= (type Heap@@63) (MapType0Type RefType)) (= (type Mask@@38) (MapType1Type RefType realType))) (state Heap@@63 Mask@@38)) (= (|fac2'| Heap@@63 i@@14) (|fac2#frame| EmptyFrame i@@14)))
 :qid |stdinbpl.1055:15|
 :skolemid |71|
 :pattern ( (state Heap@@63 Mask@@38) (|fac2'| Heap@@63 i@@14))
)))
(assert (forall ((Heap@@64 T@U) (Mask@@39 T@U) (i@@15 Int) ) (!  (=> (and (and (= (type Heap@@64) (MapType0Type RefType)) (= (type Mask@@39) (MapType1Type RefType realType))) (state Heap@@64 Mask@@39)) (= (|fac3'| Heap@@64 i@@15) (|fac3#frame| EmptyFrame i@@15)))
 :qid |stdinbpl.1118:15|
 :skolemid |75|
 :pattern ( (state Heap@@64 Mask@@39) (|fac3'| Heap@@64 i@@15))
)))
(assert (forall ((Heap@@65 T@U) (Mask@@40 T@U) (x@@17 T@U) ) (!  (=> (and (and (and (= (type Heap@@65) (MapType0Type RefType)) (= (type Mask@@40) (MapType1Type RefType realType))) (= (type x@@17) RefType)) (state Heap@@65 Mask@@40)) (= (|funP'| Heap@@65 x@@17) (|funP#frame| (MapType0Select Heap@@65 null (P x@@17)) x@@17)))
 :qid |stdinbpl.1181:15|
 :skolemid |79|
 :pattern ( (state Heap@@65 Mask@@40) (|funP'| Heap@@65 x@@17))
)))
(assert (forall ((Heap@@66 T@U) (Mask@@41 T@U) (x@@18 T@U) ) (!  (=> (and (and (and (= (type Heap@@66) (MapType0Type RefType)) (= (type Mask@@41) (MapType1Type RefType realType))) (= (type x@@18) RefType)) (state Heap@@66 Mask@@41)) (= (|funP2'| Heap@@66 x@@18) (|funP2#frame| (MapType0Select Heap@@66 null (P x@@18)) x@@18)))
 :qid |stdinbpl.1269:15|
 :skolemid |83|
 :pattern ( (state Heap@@66 Mask@@41) (|funP2'| Heap@@66 x@@18))
)))
(assert (forall ((o T@U) (f T@U) (Heap@@67 T@U) ) (!  (=> (and (and (and (= (type o) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap@@67) (MapType0Type RefType))) (U_2_bool (MapType0Select Heap@@67 o $allocated))) (U_2_bool (MapType0Select Heap@@67 (MapType0Select Heap@@67 o f) $allocated)))
 :qid |stdinbpl.31:15|
 :skolemid |0|
 :pattern ( (MapType0Select Heap@@67 o f))
)))
(assert (forall ((x@@19 T@U) ) (!  (=> (= (type x@@19) RefType) (= (PredicateMaskField (P x@@19)) (|P#sm| x@@19)))
 :qid |stdinbpl.1340:15|
 :skolemid |84|
 :pattern ( (PredicateMaskField (P x@@19)))
)))
(assert (forall ((Heap@@68 T@U) (Mask@@42 T@U) (r_1@@35 T@U) ) (!  (=> (and (and (and (= (type Heap@@68) (MapType0Type RefType)) (= (type Mask@@42) (MapType1Type RefType realType))) (= (type r_1@@35) RefType)) (and (state Heap@@68 Mask@@42) (< AssumeFunctionsAbove 7))) (= (isGreaterOne33 Heap@@68 r_1@@35) (isGreaterOne Heap@@68 (U_2_int (MapType0Select Heap@@68 r_1@@35 f_7)))))
 :qid |stdinbpl.696:15|
 :skolemid |51|
 :pattern ( (state Heap@@68 Mask@@42) (isGreaterOne33 Heap@@68 r_1@@35))
)))
(assert (forall ((Heap@@69 T@U) (o@@0 T@U) (f_3 T@U) (v T@U) ) (! (let ((B@@8 (type v)))
(let ((A@@9 (FieldTypeInv0 (type f_3))))
 (=> (and (and (= (type Heap@@69) (MapType0Type RefType)) (= (type o@@0) RefType)) (= (type f_3) (FieldType A@@9 B@@8))) (succHeap Heap@@69 (MapType0Store Heap@@69 o@@0 f_3 v)))))
 :qid |stdinbpl.78:22|
 :skolemid |9|
 :pattern ( (MapType0Store Heap@@69 o@@0 f_3 v))
)))
(assert (forall ((Heap@@70 T@U) (Mask@@43 T@U) (x@@20 T@U) ) (!  (=> (and (and (and (= (type Heap@@70) (MapType0Type RefType)) (= (type Mask@@43) (MapType1Type RefType realType))) (= (type x@@20) RefType)) (and (state Heap@@70 Mask@@43) (< AssumeFunctionsAbove 0))) (= (funP2 Heap@@70 x@@20) (U_2_int (MapType0Select Heap@@70 x@@20 f_7))))
 :qid |stdinbpl.1262:15|
 :skolemid |82|
 :pattern ( (state Heap@@70 Mask@@43) (funP2 Heap@@70 x@@20))
 :pattern ( (state Heap@@70 Mask@@43) (|funP2#triggerStateless| x@@20) (|P#trigger| Heap@@70 (P x@@20)))
)))
(assert (forall ((Heap@@71 T@U) (Mask@@44 T@U) (x@@21 T@U) ) (!  (=> (and (and (and (= (type Heap@@71) (MapType0Type RefType)) (= (type Mask@@44) (MapType1Type RefType realType))) (= (type x@@21) RefType)) (and (state Heap@@71 Mask@@44) (< AssumeFunctionsAbove 6))) (= (funP Heap@@71 x@@21) (U_2_int (MapType0Select Heap@@71 x@@21 f_7))))
 :qid |stdinbpl.1174:15|
 :skolemid |78|
 :pattern ( (state Heap@@71 Mask@@44) (funP Heap@@71 x@@21))
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
 :qid |stdinbpl.180:25|
 :skolemid |20|
 :pattern ( (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
; Valid

(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun tmp@0 () Bool)
(declare-fun Heap@@72 () T@U)
(assert (= (type Heap@@72) (MapType0Type RefType)))
(set-info :boogie-vc-id mPost2)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 5) (let ((anon3_Else_correct  (=> (= tmp@0 (isGreaterOne Heap@@72 70)) (=> (and (state Heap@@72 ZeroMask) (= (ControlFlow 0 3) (- 0 2))) tmp@0))))
(let ((anon3_Then_correct true))
(let ((anon0_correct  (=> (and (state Heap@@72 ZeroMask) (= AssumeFunctionsAbove (- 0 1))) (and (=> (= (ControlFlow 0 4) 1) anon3_Then_correct) (=> (= (ControlFlow 0 4) 3) anon3_Else_correct)))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 5) 4) anon0_correct)))
PreconditionGeneratedEntry_correct)))))
))
(check-sat)
(pop 1)
; Valid
(get-info :rlimit)
(reset)
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
(declare-fun f_7 () T@U)
(declare-fun FieldType (T@T T@T) T@T)
(declare-fun FieldTypeInv0 (T@T) T@T)
(declare-fun FieldTypeInv1 (T@T) T@T)
(declare-fun NormalFieldType () T@T)
(declare-fun state (T@U T@U) Bool)
(declare-fun |isGreaterOne34'| (T@U T@U) Bool)
(declare-fun MapType0Type (T@T) T@T)
(declare-fun RefType () T@T)
(declare-fun MapType1Type (T@T T@T) T@T)
(declare-fun AssumeFunctionsAbove () Int)
(declare-fun |isGreaterOne34#trigger| (T@U T@U) Bool)
(declare-fun FrameFragment (T@U) T@U)
(declare-fun MapType0Select (T@U T@U T@U) T@U)
(declare-fun MapType0TypeInv0 (T@T) T@T)
(declare-fun MapType0Store (T@U T@U T@U T@U) T@U)
(declare-fun MapType1TypeInv0 (T@T) T@T)
(declare-fun MapType1TypeInv1 (T@T) T@T)
(declare-fun MapType1Select (T@U T@U T@U) T@U)
(declare-fun MapType1Store (T@U T@U T@U T@U) T@U)
(declare-fun FrameTypeType () T@T)
(declare-fun |isGreaterOne2'| (T@U T@U) Bool)
(declare-fun |isGreaterOne2#trigger| (T@U T@U) Bool)
(declare-fun |isGreaterOne35'| (T@U T@U) Bool)
(declare-fun |isGreaterOne35#trigger| (T@U T@U) Bool)
(declare-fun |isGreaterOne22'| (T@U T@U) Bool)
(declare-fun |isGreaterOne22#trigger| (T@U T@U) Bool)
(declare-fun |isGreaterOne3'| (T@U T@U) Bool)
(declare-fun |isGreaterOne3#trigger| (T@U T@U) Bool)
(declare-fun |isGreaterOne32'| (T@U T@U) Bool)
(declare-fun |isGreaterOne32#trigger| (T@U T@U) Bool)
(declare-fun succHeap (T@U T@U) Bool)
(declare-fun succHeapTrans (T@U T@U) Bool)
(declare-fun GoodMask (T@U) Bool)
(declare-fun IdenticalOnKnownLocations (T@U T@U T@U) Bool)
(declare-fun IsPredicateField (T@U) Bool)
(declare-fun null () T@U)
(declare-fun PredicateMaskField (T@U) T@U)
(declare-fun HasDirectPerm (T@U T@U T@U) Bool)
(declare-fun IsWandField (T@U) Bool)
(declare-fun WandMaskField (T@U) T@U)
(declare-fun P (T@U) T@U)
(declare-fun PredicateType_PType () T@T)
(declare-fun |isGreaterOne'| (T@U Int) Bool)
(declare-fun dummyFunction (T@U) Bool)
(declare-fun |isGreaterOne#triggerStateless| (Int) Bool)
(declare-fun |isGreaterOne2#triggerStateless| (T@U) Bool)
(declare-fun |isGreaterOne22#triggerStateless| (T@U) Bool)
(declare-fun |isGreaterOne3#triggerStateless| (T@U) Bool)
(declare-fun |isGreaterOne32#triggerStateless| (T@U) Bool)
(declare-fun |isGreaterOne33'| (T@U T@U) Bool)
(declare-fun |isGreaterOne33#triggerStateless| (T@U) Bool)
(declare-fun |isGreaterOne34#triggerStateless| (T@U) Bool)
(declare-fun |isGreaterOne35#triggerStateless| (T@U) Bool)
(declare-fun |fac1'| (T@U Int) Int)
(declare-fun |fac1#triggerStateless| (Int) Int)
(declare-fun |fac2'| (T@U Int) Int)
(declare-fun |fac2#triggerStateless| (Int) Int)
(declare-fun |fac3'| (T@U Int) Int)
(declare-fun |fac3#triggerStateless| (Int) Int)
(declare-fun |funP'| (T@U T@U) Int)
(declare-fun |funP#triggerStateless| (T@U) Int)
(declare-fun |funP2'| (T@U T@U) Int)
(declare-fun |funP2#triggerStateless| (T@U) Int)
(declare-fun |P#trigger| (T@U T@U) Bool)
(declare-fun |P#everUsed| (T@U) Bool)
(declare-fun fac1 (T@U Int) Int)
(declare-fun fac2 (T@U Int) Int)
(declare-fun fac3 (T@U Int) Int)
(declare-fun funP (T@U T@U) Int)
(declare-fun funP2 (T@U T@U) Int)
(declare-fun isGreaterOne (T@U Int) Bool)
(declare-fun |P#sm| (T@U) T@U)
(declare-fun dummyHeap () T@U)
(declare-fun ZeroMask () T@U)
(declare-fun InsidePredicate (T@U T@U T@U T@U) Bool)
(declare-fun |isGreaterOne33#trigger| (T@U T@U) Bool)
(declare-fun sumMask (T@U T@U T@U) Bool)
(declare-fun isGreaterOne34 (T@U T@U) Bool)
(declare-fun isGreaterOne2 (T@U T@U) Bool)
(declare-fun isGreaterOne35 (T@U T@U) Bool)
(declare-fun isGreaterOne22 (T@U T@U) Bool)
(declare-fun isGreaterOne3 (T@U T@U) Bool)
(declare-fun isGreaterOne32 (T@U T@U) Bool)
(declare-fun ConditionalFrame (Real T@U) T@U)
(declare-fun EmptyFrame () T@U)
(declare-fun NoPerm () Real)
(declare-fun |isGreaterOne#frame| (T@U Int) Bool)
(declare-fun |isGreaterOne#trigger| (T@U Int) Bool)
(declare-fun |isGreaterOne2#frame| (T@U T@U) Bool)
(declare-fun |isGreaterOne22#frame| (T@U T@U) Bool)
(declare-fun |isGreaterOne3#frame| (T@U T@U) Bool)
(declare-fun |isGreaterOne32#frame| (T@U T@U) Bool)
(declare-fun |isGreaterOne33#frame| (T@U T@U) Bool)
(declare-fun |isGreaterOne34#frame| (T@U T@U) Bool)
(declare-fun |isGreaterOne35#frame| (T@U T@U) Bool)
(declare-fun isGreaterOne33 (T@U T@U) Bool)
(declare-fun getPredWandId (T@U) Int)
(declare-fun FullPerm () Real)
(declare-fun |fac1#frame| (T@U Int) Int)
(declare-fun |fac2#frame| (T@U Int) Int)
(declare-fun |fac3#frame| (T@U Int) Int)
(declare-fun |funP#frame| (T@U T@U) Int)
(declare-fun |funP2#frame| (T@U T@U) Int)
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
))) (= (Ctor NormalFieldType) 7)) (= (type $allocated) (FieldType NormalFieldType boolType))) (= (type f_7) (FieldType NormalFieldType intType))))
(assert (distinct $allocated f_7)
)
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (forall ((arg0@@14 T@T) ) (! (= (Ctor (MapType0Type arg0@@14)) 8)
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
)))) (= (Ctor RefType) 9)) (forall ((arg0@@18 T@T) (arg1@@4 T@T) ) (! (= (Ctor (MapType1Type arg0@@18 arg1@@4)) 10)
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
)))) (= (Ctor FrameTypeType) 11)) (forall ((arg0@@23 T@U) ) (! (= (type (FrameFragment arg0@@23)) FrameTypeType)
 :qid |funType:FrameFragment|
 :pattern ( (FrameFragment arg0@@23))
))))
(assert (forall ((Heap T@U) (Mask T@U) (r_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap) (MapType0Type RefType)) (= (type Mask) (MapType1Type RefType realType))) (= (type r_1) RefType)) (and (state Heap Mask) (or (< AssumeFunctionsAbove 1) (|isGreaterOne34#trigger| (FrameFragment (MapType0Select Heap r_1 f_7)) r_1)))) (> (U_2_int (MapType0Select Heap r_1 f_7)) (- 0 38))) (> (U_2_int (MapType0Select Heap r_1 f_7)) 60)) (|isGreaterOne34'| Heap r_1))
 :qid |stdinbpl.802:15|
 :skolemid |58|
 :pattern ( (state Heap Mask) (|isGreaterOne34'| Heap r_1))
)))
(assert (forall ((Heap@@0 T@U) (Mask@@0 T@U) (r_1@@0 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@0) (MapType0Type RefType)) (= (type Mask@@0) (MapType1Type RefType realType))) (= (type r_1@@0) RefType)) (and (state Heap@@0 Mask@@0) (or (< AssumeFunctionsAbove 2) (|isGreaterOne2#trigger| (FrameFragment (MapType0Select Heap@@0 r_1@@0 f_7)) r_1@@0)))) (> (U_2_int (MapType0Select Heap@@0 r_1@@0 f_7)) (- 0 38))) (> (U_2_int (MapType0Select Heap@@0 r_1@@0 f_7)) 60)) (|isGreaterOne2'| Heap@@0 r_1@@0))
 :qid |stdinbpl.297:15|
 :skolemid |31|
 :pattern ( (state Heap@@0 Mask@@0) (|isGreaterOne2'| Heap@@0 r_1@@0))
)))
(assert (forall ((Heap@@1 T@U) (Mask@@1 T@U) (r_1@@1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@1) (MapType0Type RefType)) (= (type Mask@@1) (MapType1Type RefType realType))) (= (type r_1@@1) RefType)) (and (state Heap@@1 Mask@@1) (or (< AssumeFunctionsAbove 3) (|isGreaterOne35#trigger| (FrameFragment (MapType0Select Heap@@1 r_1@@1 f_7)) r_1@@1)))) (> (U_2_int (MapType0Select Heap@@1 r_1@@1 f_7)) (- 0 38))) (> (U_2_int (MapType0Select Heap@@1 r_1@@1 f_7)) 60)) (|isGreaterOne35'| Heap@@1 r_1@@1))
 :qid |stdinbpl.900:15|
 :skolemid |63|
 :pattern ( (state Heap@@1 Mask@@1) (|isGreaterOne35'| Heap@@1 r_1@@1))
)))
(assert (forall ((Heap@@2 T@U) (Mask@@2 T@U) (r_1@@2 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@2) (MapType0Type RefType)) (= (type Mask@@2) (MapType1Type RefType realType))) (= (type r_1@@2) RefType)) (and (state Heap@@2 Mask@@2) (or (< AssumeFunctionsAbove 5) (|isGreaterOne22#trigger| (FrameFragment (MapType0Select Heap@@2 r_1@@2 f_7)) r_1@@2)))) (> (U_2_int (MapType0Select Heap@@2 r_1@@2 f_7)) (- 0 38))) (> (U_2_int (MapType0Select Heap@@2 r_1@@2 f_7)) 60)) (|isGreaterOne22'| Heap@@2 r_1@@2))
 :qid |stdinbpl.395:15|
 :skolemid |36|
 :pattern ( (state Heap@@2 Mask@@2) (|isGreaterOne22'| Heap@@2 r_1@@2))
)))
(assert (forall ((Heap@@3 T@U) (Mask@@3 T@U) (r_1@@3 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@3) (MapType0Type RefType)) (= (type Mask@@3) (MapType1Type RefType realType))) (= (type r_1@@3) RefType)) (and (state Heap@@3 Mask@@3) (or (< AssumeFunctionsAbove 8) (|isGreaterOne3#trigger| (FrameFragment (MapType0Select Heap@@3 r_1@@3 f_7)) r_1@@3)))) (> (U_2_int (MapType0Select Heap@@3 r_1@@3 f_7)) (- 0 38))) (> (U_2_int (MapType0Select Heap@@3 r_1@@3 f_7)) 60)) (|isGreaterOne3'| Heap@@3 r_1@@3))
 :qid |stdinbpl.503:15|
 :skolemid |42|
 :pattern ( (state Heap@@3 Mask@@3) (|isGreaterOne3'| Heap@@3 r_1@@3))
)))
(assert (forall ((Heap@@4 T@U) (Mask@@4 T@U) (r_1@@4 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@4) (MapType0Type RefType)) (= (type Mask@@4) (MapType1Type RefType realType))) (= (type r_1@@4) RefType)) (and (state Heap@@4 Mask@@4) (or (< AssumeFunctionsAbove 11) (|isGreaterOne32#trigger| (FrameFragment (MapType0Select Heap@@4 r_1@@4 f_7)) r_1@@4)))) (> (U_2_int (MapType0Select Heap@@4 r_1@@4 f_7)) (- 0 38))) (> (U_2_int (MapType0Select Heap@@4 r_1@@4 f_7)) 60)) (|isGreaterOne32'| Heap@@4 r_1@@4))
 :qid |stdinbpl.601:15|
 :skolemid |47|
 :pattern ( (state Heap@@4 Mask@@4) (|isGreaterOne32'| Heap@@4 r_1@@4))
)))
(assert (forall ((Heap0 T@U) (Heap1 T@U) ) (!  (=> (and (and (= (type Heap0) (MapType0Type RefType)) (= (type Heap1) (MapType0Type RefType))) (succHeap Heap0 Heap1)) (succHeapTrans Heap0 Heap1))
 :qid |stdinbpl.88:15|
 :skolemid |11|
 :pattern ( (succHeap Heap0 Heap1))
)))
(assert (forall ((Heap@@5 T@U) (Mask@@5 T@U) ) (!  (=> (and (and (= (type Heap@@5) (MapType0Type RefType)) (= (type Mask@@5) (MapType1Type RefType realType))) (state Heap@@5 Mask@@5)) (GoodMask Mask@@5))
 :qid |stdinbpl.124:15|
 :skolemid |15|
 :pattern ( (state Heap@@5 Mask@@5))
)))
(assert (forall ((Heap0@@0 T@U) (Heap1@@0 T@U) (Heap2 T@U) ) (!  (=> (and (and (and (= (type Heap0@@0) (MapType0Type RefType)) (= (type Heap1@@0) (MapType0Type RefType))) (= (type Heap2) (MapType0Type RefType))) (and (succHeapTrans Heap0@@0 Heap1@@0) (succHeap Heap1@@0 Heap2))) (succHeapTrans Heap0@@0 Heap2))
 :qid |stdinbpl.93:15|
 :skolemid |12|
 :pattern ( (succHeapTrans Heap0@@0 Heap1@@0) (succHeap Heap1@@0 Heap2))
)))
(assert  (and (= (type null) RefType) (forall ((arg0@@24 T@U) ) (! (let ((A (FieldTypeInv0 (type arg0@@24))))
(= (type (PredicateMaskField arg0@@24)) (FieldType A (MapType1Type RefType boolType))))
 :qid |funType:PredicateMaskField|
 :pattern ( (PredicateMaskField arg0@@24))
))))
(assert (forall ((Heap@@6 T@U) (ExhaleHeap T@U) (Mask@@6 T@U) (pm_f T@U) ) (! (let ((C (FieldTypeInv0 (type pm_f))))
 (=> (and (and (and (and (and (= (type Heap@@6) (MapType0Type RefType)) (= (type ExhaleHeap) (MapType0Type RefType))) (= (type Mask@@6) (MapType1Type RefType realType))) (= (type pm_f) (FieldType C FrameTypeType))) (IdenticalOnKnownLocations Heap@@6 ExhaleHeap Mask@@6)) (and (HasDirectPerm Mask@@6 null pm_f) (IsPredicateField pm_f))) (= (MapType0Select Heap@@6 null (PredicateMaskField pm_f)) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))))
 :qid |stdinbpl.47:19|
 :skolemid |2|
 :pattern ( (IdenticalOnKnownLocations Heap@@6 ExhaleHeap Mask@@6) (IsPredicateField pm_f) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))
)))
(assert (forall ((arg0@@25 T@U) ) (! (let ((A@@0 (FieldTypeInv0 (type arg0@@25))))
(= (type (WandMaskField arg0@@25)) (FieldType A@@0 (MapType1Type RefType boolType))))
 :qid |funType:WandMaskField|
 :pattern ( (WandMaskField arg0@@25))
)))
(assert (forall ((Heap@@7 T@U) (ExhaleHeap@@0 T@U) (Mask@@7 T@U) (pm_f@@0 T@U) ) (! (let ((C@@0 (FieldTypeInv0 (type pm_f@@0))))
 (=> (and (and (and (and (and (= (type Heap@@7) (MapType0Type RefType)) (= (type ExhaleHeap@@0) (MapType0Type RefType))) (= (type Mask@@7) (MapType1Type RefType realType))) (= (type pm_f@@0) (FieldType C@@0 FrameTypeType))) (IdenticalOnKnownLocations Heap@@7 ExhaleHeap@@0 Mask@@7)) (and (HasDirectPerm Mask@@7 null pm_f@@0) (IsWandField pm_f@@0))) (= (MapType0Select Heap@@7 null (WandMaskField pm_f@@0)) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))))
 :qid |stdinbpl.60:19|
 :skolemid |5|
 :pattern ( (IdenticalOnKnownLocations Heap@@7 ExhaleHeap@@0 Mask@@7) (IsWandField pm_f@@0) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))
)))
(assert (forall ((Heap@@8 T@U) (Mask@@8 T@U) (r_1@@5 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@8) (MapType0Type RefType)) (= (type Mask@@8) (MapType1Type RefType realType))) (= (type r_1@@5) RefType)) (and (state Heap@@8 Mask@@8) (or (< AssumeFunctionsAbove 5) (|isGreaterOne22#trigger| (FrameFragment (MapType0Select Heap@@8 r_1@@5 f_7)) r_1@@5)))) (> (U_2_int (MapType0Select Heap@@8 r_1@@5 f_7)) (- 0 38))) (= (|isGreaterOne22'| Heap@@8 r_1@@5) (> (U_2_int (MapType0Select Heap@@8 r_1@@5 f_7)) 1)))
 :qid |stdinbpl.399:15|
 :skolemid |37|
 :pattern ( (state Heap@@8 Mask@@8) (|isGreaterOne22'| Heap@@8 r_1@@5))
)))
(assert (forall ((Heap@@9 T@U) (Mask@@9 T@U) (r_1@@6 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@9) (MapType0Type RefType)) (= (type Mask@@9) (MapType1Type RefType realType))) (= (type r_1@@6) RefType)) (and (state Heap@@9 Mask@@9) (or (< AssumeFunctionsAbove 11) (|isGreaterOne32#trigger| (FrameFragment (MapType0Select Heap@@9 r_1@@6 f_7)) r_1@@6)))) (> (U_2_int (MapType0Select Heap@@9 r_1@@6 f_7)) (- 0 38))) (= (|isGreaterOne32'| Heap@@9 r_1@@6) (> (U_2_int (MapType0Select Heap@@9 r_1@@6 f_7)) 1)))
 :qid |stdinbpl.605:15|
 :skolemid |48|
 :pattern ( (state Heap@@9 Mask@@9) (|isGreaterOne32'| Heap@@9 r_1@@6))
)))
(assert  (and (= (Ctor PredicateType_PType) 12) (forall ((arg0@@26 T@U) ) (! (= (type (P arg0@@26)) (FieldType PredicateType_PType FrameTypeType))
 :qid |funType:P|
 :pattern ( (P arg0@@26))
))))
(assert (forall ((x@@8 T@U) ) (!  (=> (= (type x@@8) RefType) (IsPredicateField (P x@@8)))
 :qid |stdinbpl.1344:15|
 :skolemid |85|
 :pattern ( (P x@@8))
)))
(assert (forall ((Heap@@10 T@U) (i Int) ) (!  (=> (= (type Heap@@10) (MapType0Type RefType)) (dummyFunction (bool_2_U (|isGreaterOne#triggerStateless| i))))
 :qid |stdinbpl.209:15|
 :skolemid |23|
 :pattern ( (|isGreaterOne'| Heap@@10 i))
)))
(assert (forall ((Heap@@11 T@U) (r_1@@7 T@U) ) (!  (=> (and (= (type Heap@@11) (MapType0Type RefType)) (= (type r_1@@7) RefType)) (dummyFunction (bool_2_U (|isGreaterOne2#triggerStateless| r_1@@7))))
 :qid |stdinbpl.278:15|
 :skolemid |28|
 :pattern ( (|isGreaterOne2'| Heap@@11 r_1@@7))
)))
(assert (forall ((Heap@@12 T@U) (r_1@@8 T@U) ) (!  (=> (and (= (type Heap@@12) (MapType0Type RefType)) (= (type r_1@@8) RefType)) (dummyFunction (bool_2_U (|isGreaterOne22#triggerStateless| r_1@@8))))
 :qid |stdinbpl.376:15|
 :skolemid |33|
 :pattern ( (|isGreaterOne22'| Heap@@12 r_1@@8))
)))
(assert (forall ((Heap@@13 T@U) (r_1@@9 T@U) ) (!  (=> (and (= (type Heap@@13) (MapType0Type RefType)) (= (type r_1@@9) RefType)) (dummyFunction (bool_2_U (|isGreaterOne3#triggerStateless| r_1@@9))))
 :qid |stdinbpl.484:15|
 :skolemid |39|
 :pattern ( (|isGreaterOne3'| Heap@@13 r_1@@9))
)))
(assert (forall ((Heap@@14 T@U) (r_1@@10 T@U) ) (!  (=> (and (= (type Heap@@14) (MapType0Type RefType)) (= (type r_1@@10) RefType)) (dummyFunction (bool_2_U (|isGreaterOne32#triggerStateless| r_1@@10))))
 :qid |stdinbpl.582:15|
 :skolemid |44|
 :pattern ( (|isGreaterOne32'| Heap@@14 r_1@@10))
)))
(assert (forall ((Heap@@15 T@U) (r_1@@11 T@U) ) (!  (=> (and (= (type Heap@@15) (MapType0Type RefType)) (= (type r_1@@11) RefType)) (dummyFunction (bool_2_U (|isGreaterOne33#triggerStateless| r_1@@11))))
 :qid |stdinbpl.690:15|
 :skolemid |50|
 :pattern ( (|isGreaterOne33'| Heap@@15 r_1@@11))
)))
(assert (forall ((Heap@@16 T@U) (r_1@@12 T@U) ) (!  (=> (and (= (type Heap@@16) (MapType0Type RefType)) (= (type r_1@@12) RefType)) (dummyFunction (bool_2_U (|isGreaterOne34#triggerStateless| r_1@@12))))
 :qid |stdinbpl.783:15|
 :skolemid |55|
 :pattern ( (|isGreaterOne34'| Heap@@16 r_1@@12))
)))
(assert (forall ((Heap@@17 T@U) (r_1@@13 T@U) ) (!  (=> (and (= (type Heap@@17) (MapType0Type RefType)) (= (type r_1@@13) RefType)) (dummyFunction (bool_2_U (|isGreaterOne35#triggerStateless| r_1@@13))))
 :qid |stdinbpl.881:15|
 :skolemid |60|
 :pattern ( (|isGreaterOne35'| Heap@@17 r_1@@13))
)))
(assert (forall ((Heap@@18 T@U) (i@@0 Int) ) (!  (=> (= (type Heap@@18) (MapType0Type RefType)) (dummyFunction (int_2_U (|fac1#triggerStateless| i@@0))))
 :qid |stdinbpl.979:15|
 :skolemid |65|
 :pattern ( (|fac1'| Heap@@18 i@@0))
)))
(assert (forall ((Heap@@19 T@U) (i@@1 Int) ) (!  (=> (= (type Heap@@19) (MapType0Type RefType)) (dummyFunction (int_2_U (|fac2#triggerStateless| i@@1))))
 :qid |stdinbpl.1042:15|
 :skolemid |69|
 :pattern ( (|fac2'| Heap@@19 i@@1))
)))
(assert (forall ((Heap@@20 T@U) (i@@2 Int) ) (!  (=> (= (type Heap@@20) (MapType0Type RefType)) (dummyFunction (int_2_U (|fac3#triggerStateless| i@@2))))
 :qid |stdinbpl.1105:15|
 :skolemid |73|
 :pattern ( (|fac3'| Heap@@20 i@@2))
)))
(assert (forall ((Heap@@21 T@U) (x@@9 T@U) ) (!  (=> (and (= (type Heap@@21) (MapType0Type RefType)) (= (type x@@9) RefType)) (dummyFunction (int_2_U (|funP#triggerStateless| x@@9))))
 :qid |stdinbpl.1168:15|
 :skolemid |77|
 :pattern ( (|funP'| Heap@@21 x@@9))
)))
(assert (forall ((Heap@@22 T@U) (x@@10 T@U) ) (!  (=> (and (= (type Heap@@22) (MapType0Type RefType)) (= (type x@@10) RefType)) (dummyFunction (int_2_U (|funP2#triggerStateless| x@@10))))
 :qid |stdinbpl.1256:15|
 :skolemid |81|
 :pattern ( (|funP2'| Heap@@22 x@@10))
)))
(assert (forall ((Heap@@23 T@U) (x@@11 T@U) ) (!  (=> (and (= (type Heap@@23) (MapType0Type RefType)) (= (type x@@11) RefType)) (|P#everUsed| (P x@@11)))
 :qid |stdinbpl.1363:15|
 :skolemid |89|
 :pattern ( (|P#trigger| Heap@@23 (P x@@11)))
)))
(assert (forall ((Heap@@24 T@U) (ExhaleHeap@@1 T@U) (Mask@@10 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@24) (MapType0Type RefType)) (= (type ExhaleHeap@@1) (MapType0Type RefType))) (= (type Mask@@10) (MapType1Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@24 ExhaleHeap@@1 Mask@@10)) (U_2_bool (MapType0Select Heap@@24 o_1 $allocated))) (U_2_bool (MapType0Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.73:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@24 ExhaleHeap@@1 Mask@@10) (MapType0Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert (forall ((Heap@@25 T@U) (i@@3 Int) ) (!  (=> (= (type Heap@@25) (MapType0Type RefType)) (and (= (fac1 Heap@@25 i@@3) (|fac1'| Heap@@25 i@@3)) (dummyFunction (int_2_U (|fac1#triggerStateless| i@@3)))))
 :qid |stdinbpl.975:15|
 :skolemid |64|
 :pattern ( (fac1 Heap@@25 i@@3))
)))
(assert (forall ((Heap@@26 T@U) (i@@4 Int) ) (!  (=> (= (type Heap@@26) (MapType0Type RefType)) (and (= (fac2 Heap@@26 i@@4) (|fac2'| Heap@@26 i@@4)) (dummyFunction (int_2_U (|fac2#triggerStateless| i@@4)))))
 :qid |stdinbpl.1038:15|
 :skolemid |68|
 :pattern ( (fac2 Heap@@26 i@@4))
)))
(assert (forall ((Heap@@27 T@U) (i@@5 Int) ) (!  (=> (= (type Heap@@27) (MapType0Type RefType)) (and (= (fac3 Heap@@27 i@@5) (|fac3'| Heap@@27 i@@5)) (dummyFunction (int_2_U (|fac3#triggerStateless| i@@5)))))
 :qid |stdinbpl.1101:15|
 :skolemid |72|
 :pattern ( (fac3 Heap@@27 i@@5))
)))
(assert (forall ((Heap@@28 T@U) (x@@12 T@U) ) (!  (=> (and (= (type Heap@@28) (MapType0Type RefType)) (= (type x@@12) RefType)) (and (= (funP Heap@@28 x@@12) (|funP'| Heap@@28 x@@12)) (dummyFunction (int_2_U (|funP#triggerStateless| x@@12)))))
 :qid |stdinbpl.1164:15|
 :skolemid |76|
 :pattern ( (funP Heap@@28 x@@12))
)))
(assert (forall ((Heap@@29 T@U) (x@@13 T@U) ) (!  (=> (and (= (type Heap@@29) (MapType0Type RefType)) (= (type x@@13) RefType)) (and (= (funP2 Heap@@29 x@@13) (|funP2'| Heap@@29 x@@13)) (dummyFunction (int_2_U (|funP2#triggerStateless| x@@13)))))
 :qid |stdinbpl.1252:15|
 :skolemid |80|
 :pattern ( (funP2 Heap@@29 x@@13))
)))
(assert (forall ((Heap@@30 T@U) (Mask@@11 T@U) (i@@6 Int) ) (!  (=> (and (and (and (= (type Heap@@30) (MapType0Type RefType)) (= (type Mask@@11) (MapType1Type RefType realType))) (and (state Heap@@30 Mask@@11) (< AssumeFunctionsAbove 12))) (> i@@6 (- 0 60))) (= (isGreaterOne Heap@@30 i@@6) (> i@@6 1)))
 :qid |stdinbpl.215:15|
 :skolemid |24|
 :pattern ( (state Heap@@30 Mask@@11) (isGreaterOne Heap@@30 i@@6))
)))
(assert (forall ((x@@14 T@U) (x2 T@U) ) (!  (=> (and (and (= (type x@@14) RefType) (= (type x2) RefType)) (= (P x@@14) (P x2))) (= x@@14 x2))
 :qid |stdinbpl.1354:15|
 :skolemid |87|
 :pattern ( (P x@@14) (P x2))
)))
(assert (forall ((arg0@@27 T@U) ) (! (= (type (|P#sm| arg0@@27)) (FieldType PredicateType_PType (MapType1Type RefType boolType)))
 :qid |funType:P#sm|
 :pattern ( (|P#sm| arg0@@27))
)))
(assert (forall ((x@@15 T@U) (x2@@0 T@U) ) (!  (=> (and (and (= (type x@@15) RefType) (= (type x2@@0) RefType)) (= (|P#sm| x@@15) (|P#sm| x2@@0))) (= x@@15 x2@@0))
 :qid |stdinbpl.1358:15|
 :skolemid |88|
 :pattern ( (|P#sm| x@@15) (|P#sm| x2@@0))
)))
(assert (forall ((Heap@@31 T@U) (Mask@@12 T@U) (i@@7 Int) ) (!  (=> (and (and (= (type Heap@@31) (MapType0Type RefType)) (= (type Mask@@12) (MapType1Type RefType realType))) (and (state Heap@@31 Mask@@12) (< AssumeFunctionsAbove 4))) (= (fac2 Heap@@31 i@@7) (ite (<= i@@7 1) 1 (* i@@7 (|fac2'| Heap@@31 (- i@@7 1))))))
 :qid |stdinbpl.1048:15|
 :skolemid |70|
 :pattern ( (state Heap@@31 Mask@@12) (fac2 Heap@@31 i@@7))
)))
(assert (forall ((Heap@@32 T@U) (Mask@@13 T@U) (i@@8 Int) ) (!  (=> (and (and (= (type Heap@@32) (MapType0Type RefType)) (= (type Mask@@13) (MapType1Type RefType realType))) (and (state Heap@@32 Mask@@13) (< AssumeFunctionsAbove 9))) (= (fac3 Heap@@32 i@@8) (ite (<= i@@8 1) 1 (* i@@8 (|fac3'| Heap@@32 (- i@@8 1))))))
 :qid |stdinbpl.1111:15|
 :skolemid |74|
 :pattern ( (state Heap@@32 Mask@@13) (fac3 Heap@@32 i@@8))
)))
(assert (forall ((Heap@@33 T@U) (Mask@@14 T@U) (i@@9 Int) ) (!  (=> (and (and (= (type Heap@@33) (MapType0Type RefType)) (= (type Mask@@14) (MapType1Type RefType realType))) (and (state Heap@@33 Mask@@14) (< AssumeFunctionsAbove 10))) (= (fac1 Heap@@33 i@@9) (ite (<= i@@9 1) 1 (* i@@9 (|fac1'| Heap@@33 (- i@@9 1))))))
 :qid |stdinbpl.985:15|
 :skolemid |66|
 :pattern ( (state Heap@@33 Mask@@14) (fac1 Heap@@33 i@@9))
)))
(assert (forall ((Heap@@34 T@U) (ExhaleHeap@@2 T@U) (Mask@@15 T@U) (o_1@@0 T@U) (f_2 T@U) ) (! (let ((B@@1 (FieldTypeInv1 (type f_2))))
(let ((A@@1 (FieldTypeInv0 (type f_2))))
 (=> (and (and (and (and (and (and (= (type Heap@@34) (MapType0Type RefType)) (= (type ExhaleHeap@@2) (MapType0Type RefType))) (= (type Mask@@15) (MapType1Type RefType realType))) (= (type o_1@@0) RefType)) (= (type f_2) (FieldType A@@1 B@@1))) (IdenticalOnKnownLocations Heap@@34 ExhaleHeap@@2 Mask@@15)) (HasDirectPerm Mask@@15 o_1@@0 f_2)) (= (MapType0Select Heap@@34 o_1@@0 f_2) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2)))))
 :qid |stdinbpl.42:22|
 :skolemid |1|
 :pattern ( (IdenticalOnKnownLocations Heap@@34 ExhaleHeap@@2 Mask@@15) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2))
)))
(assert  (and (= (type dummyHeap) (MapType0Type RefType)) (= (type ZeroMask) (MapType1Type RefType realType))))
(assert (state dummyHeap ZeroMask))
(assert (forall ((p T@U) (v_1 T@U) (w T@U) ) (! (let ((A@@2 (FieldTypeInv0 (type p))))
 (=> (and (and (= (type p) (FieldType A@@2 FrameTypeType)) (= (type v_1) FrameTypeType)) (= (type w) FrameTypeType)) (not (InsidePredicate p v_1 p w))))
 :qid |stdinbpl.185:19|
 :skolemid |21|
 :pattern ( (InsidePredicate p v_1 p w))
)))
(assert (forall ((Heap@@35 T@U) (Mask@@16 T@U) (r_1@@14 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@35) (MapType0Type RefType)) (= (type Mask@@16) (MapType1Type RefType realType))) (= (type r_1@@14) RefType)) (and (state Heap@@35 Mask@@16) (or (< AssumeFunctionsAbove 7) (|isGreaterOne33#trigger| (FrameFragment (MapType0Select Heap@@35 r_1@@14 f_7)) r_1@@14)))) (> (U_2_int (MapType0Select Heap@@35 r_1@@14 f_7)) 60)) (|isGreaterOne33'| Heap@@35 r_1@@14))
 :qid |stdinbpl.709:15|
 :skolemid |53|
 :pattern ( (state Heap@@35 Mask@@16) (|isGreaterOne33'| Heap@@35 r_1@@14))
)))
(assert  (not (IsPredicateField f_7)))
(assert  (not (IsWandField f_7)))
(assert (forall ((Heap@@36 T@U) (ExhaleHeap@@3 T@U) (Mask@@17 T@U) ) (!  (=> (and (and (and (= (type Heap@@36) (MapType0Type RefType)) (= (type ExhaleHeap@@3) (MapType0Type RefType))) (= (type Mask@@17) (MapType1Type RefType realType))) (IdenticalOnKnownLocations Heap@@36 ExhaleHeap@@3 Mask@@17)) (succHeap Heap@@36 ExhaleHeap@@3))
 :qid |stdinbpl.83:15|
 :skolemid |10|
 :pattern ( (IdenticalOnKnownLocations Heap@@36 ExhaleHeap@@3 Mask@@17))
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
(assert (forall ((Heap@@37 T@U) (Mask@@18 T@U) (r_1@@15 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@37) (MapType0Type RefType)) (= (type Mask@@18) (MapType1Type RefType realType))) (= (type r_1@@15) RefType)) (and (state Heap@@37 Mask@@18) (< AssumeFunctionsAbove 1))) (> (U_2_int (MapType0Select Heap@@37 r_1@@15 f_7)) (- 0 38))) (= (isGreaterOne34 Heap@@37 r_1@@15) (isGreaterOne Heap@@37 (U_2_int (MapType0Select Heap@@37 r_1@@15 f_7)))))
 :qid |stdinbpl.789:15|
 :skolemid |56|
 :pattern ( (state Heap@@37 Mask@@18) (isGreaterOne34 Heap@@37 r_1@@15))
)))
(assert (forall ((Heap@@38 T@U) (Mask@@19 T@U) (r_1@@16 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@38) (MapType0Type RefType)) (= (type Mask@@19) (MapType1Type RefType realType))) (= (type r_1@@16) RefType)) (and (state Heap@@38 Mask@@19) (< AssumeFunctionsAbove 2))) (> (U_2_int (MapType0Select Heap@@38 r_1@@16 f_7)) (- 0 38))) (= (isGreaterOne2 Heap@@38 r_1@@16) (|isGreaterOne'| Heap@@38 (U_2_int (MapType0Select Heap@@38 r_1@@16 f_7)))))
 :qid |stdinbpl.284:15|
 :skolemid |29|
 :pattern ( (state Heap@@38 Mask@@19) (isGreaterOne2 Heap@@38 r_1@@16))
)))
(assert (forall ((Heap@@39 T@U) (Mask@@20 T@U) (r_1@@17 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@39) (MapType0Type RefType)) (= (type Mask@@20) (MapType1Type RefType realType))) (= (type r_1@@17) RefType)) (and (state Heap@@39 Mask@@20) (< AssumeFunctionsAbove 3))) (> (U_2_int (MapType0Select Heap@@39 r_1@@17 f_7)) (- 0 38))) (= (isGreaterOne35 Heap@@39 r_1@@17) (|isGreaterOne'| Heap@@39 (U_2_int (MapType0Select Heap@@39 r_1@@17 f_7)))))
 :qid |stdinbpl.887:15|
 :skolemid |61|
 :pattern ( (state Heap@@39 Mask@@20) (isGreaterOne35 Heap@@39 r_1@@17))
)))
(assert (forall ((Heap@@40 T@U) (Mask@@21 T@U) (r_1@@18 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@40) (MapType0Type RefType)) (= (type Mask@@21) (MapType1Type RefType realType))) (= (type r_1@@18) RefType)) (and (state Heap@@40 Mask@@21) (< AssumeFunctionsAbove 5))) (> (U_2_int (MapType0Select Heap@@40 r_1@@18 f_7)) (- 0 38))) (= (isGreaterOne22 Heap@@40 r_1@@18) (|isGreaterOne'| Heap@@40 (U_2_int (MapType0Select Heap@@40 r_1@@18 f_7)))))
 :qid |stdinbpl.382:15|
 :skolemid |34|
 :pattern ( (state Heap@@40 Mask@@21) (isGreaterOne22 Heap@@40 r_1@@18))
)))
(assert (forall ((Heap@@41 T@U) (Mask@@22 T@U) (r_1@@19 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@41) (MapType0Type RefType)) (= (type Mask@@22) (MapType1Type RefType realType))) (= (type r_1@@19) RefType)) (and (state Heap@@41 Mask@@22) (< AssumeFunctionsAbove 8))) (> (U_2_int (MapType0Select Heap@@41 r_1@@19 f_7)) (- 0 38))) (= (isGreaterOne3 Heap@@41 r_1@@19) (isGreaterOne Heap@@41 (U_2_int (MapType0Select Heap@@41 r_1@@19 f_7)))))
 :qid |stdinbpl.490:15|
 :skolemid |40|
 :pattern ( (state Heap@@41 Mask@@22) (isGreaterOne3 Heap@@41 r_1@@19))
)))
(assert (forall ((Heap@@42 T@U) (Mask@@23 T@U) (r_1@@20 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@42) (MapType0Type RefType)) (= (type Mask@@23) (MapType1Type RefType realType))) (= (type r_1@@20) RefType)) (and (state Heap@@42 Mask@@23) (< AssumeFunctionsAbove 11))) (> (U_2_int (MapType0Select Heap@@42 r_1@@20 f_7)) (- 0 38))) (= (isGreaterOne32 Heap@@42 r_1@@20) (isGreaterOne Heap@@42 (U_2_int (MapType0Select Heap@@42 r_1@@20 f_7)))))
 :qid |stdinbpl.588:15|
 :skolemid |45|
 :pattern ( (state Heap@@42 Mask@@23) (isGreaterOne32 Heap@@42 r_1@@20))
)))
(assert  (and (forall ((arg0@@28 Real) (arg1@@9 T@U) ) (! (= (type (ConditionalFrame arg0@@28 arg1@@9)) FrameTypeType)
 :qid |funType:ConditionalFrame|
 :pattern ( (ConditionalFrame arg0@@28 arg1@@9))
)) (= (type EmptyFrame) FrameTypeType)))
(assert (forall ((p@@0 Real) (f_6 T@U) ) (!  (=> (= (type f_6) FrameTypeType) (= (ConditionalFrame p@@0 f_6) (ite (> p@@0 0.0) f_6 EmptyFrame)))
 :qid |stdinbpl.173:15|
 :skolemid |19|
 :pattern ( (ConditionalFrame p@@0 f_6))
)))
(assert (forall ((Mask@@24 T@U) (o_2@@0 T@U) (f_4@@0 T@U) ) (! (let ((B@@3 (FieldTypeInv1 (type f_4@@0))))
(let ((A@@4 (FieldTypeInv0 (type f_4@@0))))
 (=> (and (and (= (type Mask@@24) (MapType1Type RefType realType)) (= (type o_2@@0) RefType)) (= (type f_4@@0) (FieldType A@@4 B@@3))) (= (HasDirectPerm Mask@@24 o_2@@0 f_4@@0) (> (U_2_real (MapType1Select Mask@@24 o_2@@0 f_4@@0)) NoPerm)))))
 :qid |stdinbpl.133:22|
 :skolemid |17|
 :pattern ( (HasDirectPerm Mask@@24 o_2@@0 f_4@@0))
)))
(assert (forall ((o_2@@1 T@U) (f_4@@1 T@U) ) (! (let ((B@@4 (FieldTypeInv1 (type f_4@@1))))
(let ((A@@5 (FieldTypeInv0 (type f_4@@1))))
 (=> (and (= (type o_2@@1) RefType) (= (type f_4@@1) (FieldType A@@5 B@@4))) (= (U_2_real (MapType1Select ZeroMask o_2@@1 f_4@@1)) NoPerm))))
 :qid |stdinbpl.106:22|
 :skolemid |13|
 :pattern ( (MapType1Select ZeroMask o_2@@1 f_4@@1))
)))
(assert (forall ((Heap@@43 T@U) (Mask@@25 T@U) (i@@10 Int) ) (!  (=> (and (and (= (type Heap@@43) (MapType0Type RefType)) (= (type Mask@@25) (MapType1Type RefType realType))) (state Heap@@43 Mask@@25)) (= (|isGreaterOne'| Heap@@43 i@@10) (|isGreaterOne#frame| EmptyFrame i@@10)))
 :qid |stdinbpl.222:15|
 :skolemid |25|
 :pattern ( (state Heap@@43 Mask@@25) (|isGreaterOne'| Heap@@43 i@@10))
)))
(assert (forall ((Heap@@44 T@U) (Mask@@26 T@U) (i@@11 Int) ) (!  (=> (and (and (and (and (= (type Heap@@44) (MapType0Type RefType)) (= (type Mask@@26) (MapType1Type RefType realType))) (and (state Heap@@44 Mask@@26) (or (< AssumeFunctionsAbove 12) (|isGreaterOne#trigger| EmptyFrame i@@11)))) (> i@@11 (- 0 60))) (> i@@11 60)) (|isGreaterOne'| Heap@@44 i@@11))
 :qid |stdinbpl.228:15|
 :skolemid |26|
 :pattern ( (state Heap@@44 Mask@@26) (|isGreaterOne'| Heap@@44 i@@11))
)))
(assert (forall ((Heap@@45 T@U) (Mask@@27 T@U) (r_1@@21 T@U) ) (!  (=> (and (and (and (= (type Heap@@45) (MapType0Type RefType)) (= (type Mask@@27) (MapType1Type RefType realType))) (= (type r_1@@21) RefType)) (state Heap@@45 Mask@@27)) (= (|isGreaterOne2'| Heap@@45 r_1@@21) (|isGreaterOne2#frame| (FrameFragment (MapType0Select Heap@@45 r_1@@21 f_7)) r_1@@21)))
 :qid |stdinbpl.291:15|
 :skolemid |30|
 :pattern ( (state Heap@@45 Mask@@27) (|isGreaterOne2'| Heap@@45 r_1@@21))
)))
(assert (forall ((Heap@@46 T@U) (Mask@@28 T@U) (r_1@@22 T@U) ) (!  (=> (and (and (and (= (type Heap@@46) (MapType0Type RefType)) (= (type Mask@@28) (MapType1Type RefType realType))) (= (type r_1@@22) RefType)) (state Heap@@46 Mask@@28)) (= (|isGreaterOne22'| Heap@@46 r_1@@22) (|isGreaterOne22#frame| (FrameFragment (MapType0Select Heap@@46 r_1@@22 f_7)) r_1@@22)))
 :qid |stdinbpl.389:15|
 :skolemid |35|
 :pattern ( (state Heap@@46 Mask@@28) (|isGreaterOne22'| Heap@@46 r_1@@22))
)))
(assert (forall ((Heap@@47 T@U) (Mask@@29 T@U) (r_1@@23 T@U) ) (!  (=> (and (and (and (= (type Heap@@47) (MapType0Type RefType)) (= (type Mask@@29) (MapType1Type RefType realType))) (= (type r_1@@23) RefType)) (state Heap@@47 Mask@@29)) (= (|isGreaterOne3'| Heap@@47 r_1@@23) (|isGreaterOne3#frame| (FrameFragment (MapType0Select Heap@@47 r_1@@23 f_7)) r_1@@23)))
 :qid |stdinbpl.497:15|
 :skolemid |41|
 :pattern ( (state Heap@@47 Mask@@29) (|isGreaterOne3'| Heap@@47 r_1@@23))
)))
(assert (forall ((Heap@@48 T@U) (Mask@@30 T@U) (r_1@@24 T@U) ) (!  (=> (and (and (and (= (type Heap@@48) (MapType0Type RefType)) (= (type Mask@@30) (MapType1Type RefType realType))) (= (type r_1@@24) RefType)) (state Heap@@48 Mask@@30)) (= (|isGreaterOne32'| Heap@@48 r_1@@24) (|isGreaterOne32#frame| (FrameFragment (MapType0Select Heap@@48 r_1@@24 f_7)) r_1@@24)))
 :qid |stdinbpl.595:15|
 :skolemid |46|
 :pattern ( (state Heap@@48 Mask@@30) (|isGreaterOne32'| Heap@@48 r_1@@24))
)))
(assert (forall ((Heap@@49 T@U) (Mask@@31 T@U) (r_1@@25 T@U) ) (!  (=> (and (and (and (= (type Heap@@49) (MapType0Type RefType)) (= (type Mask@@31) (MapType1Type RefType realType))) (= (type r_1@@25) RefType)) (state Heap@@49 Mask@@31)) (= (|isGreaterOne33'| Heap@@49 r_1@@25) (|isGreaterOne33#frame| (FrameFragment (MapType0Select Heap@@49 r_1@@25 f_7)) r_1@@25)))
 :qid |stdinbpl.703:15|
 :skolemid |52|
 :pattern ( (state Heap@@49 Mask@@31) (|isGreaterOne33'| Heap@@49 r_1@@25))
)))
(assert (forall ((Heap@@50 T@U) (Mask@@32 T@U) (r_1@@26 T@U) ) (!  (=> (and (and (and (= (type Heap@@50) (MapType0Type RefType)) (= (type Mask@@32) (MapType1Type RefType realType))) (= (type r_1@@26) RefType)) (state Heap@@50 Mask@@32)) (= (|isGreaterOne34'| Heap@@50 r_1@@26) (|isGreaterOne34#frame| (FrameFragment (MapType0Select Heap@@50 r_1@@26 f_7)) r_1@@26)))
 :qid |stdinbpl.796:15|
 :skolemid |57|
 :pattern ( (state Heap@@50 Mask@@32) (|isGreaterOne34'| Heap@@50 r_1@@26))
)))
(assert (forall ((Heap@@51 T@U) (Mask@@33 T@U) (r_1@@27 T@U) ) (!  (=> (and (and (and (= (type Heap@@51) (MapType0Type RefType)) (= (type Mask@@33) (MapType1Type RefType realType))) (= (type r_1@@27) RefType)) (state Heap@@51 Mask@@33)) (= (|isGreaterOne35'| Heap@@51 r_1@@27) (|isGreaterOne35#frame| (FrameFragment (MapType0Select Heap@@51 r_1@@27 f_7)) r_1@@27)))
 :qid |stdinbpl.894:15|
 :skolemid |62|
 :pattern ( (state Heap@@51 Mask@@33) (|isGreaterOne35'| Heap@@51 r_1@@27))
)))
(assert (forall ((Heap@@52 T@U) (i@@12 Int) ) (!  (=> (= (type Heap@@52) (MapType0Type RefType)) (and (= (isGreaterOne Heap@@52 i@@12) (|isGreaterOne'| Heap@@52 i@@12)) (dummyFunction (bool_2_U (|isGreaterOne#triggerStateless| i@@12)))))
 :qid |stdinbpl.205:15|
 :skolemid |22|
 :pattern ( (isGreaterOne Heap@@52 i@@12))
)))
(assert (forall ((Heap@@53 T@U) (r_1@@28 T@U) ) (!  (=> (and (= (type Heap@@53) (MapType0Type RefType)) (= (type r_1@@28) RefType)) (and (= (isGreaterOne2 Heap@@53 r_1@@28) (|isGreaterOne2'| Heap@@53 r_1@@28)) (dummyFunction (bool_2_U (|isGreaterOne2#triggerStateless| r_1@@28)))))
 :qid |stdinbpl.274:15|
 :skolemid |27|
 :pattern ( (isGreaterOne2 Heap@@53 r_1@@28))
)))
(assert (forall ((Heap@@54 T@U) (r_1@@29 T@U) ) (!  (=> (and (= (type Heap@@54) (MapType0Type RefType)) (= (type r_1@@29) RefType)) (and (= (isGreaterOne22 Heap@@54 r_1@@29) (|isGreaterOne22'| Heap@@54 r_1@@29)) (dummyFunction (bool_2_U (|isGreaterOne22#triggerStateless| r_1@@29)))))
 :qid |stdinbpl.372:15|
 :skolemid |32|
 :pattern ( (isGreaterOne22 Heap@@54 r_1@@29))
)))
(assert (forall ((Heap@@55 T@U) (r_1@@30 T@U) ) (!  (=> (and (= (type Heap@@55) (MapType0Type RefType)) (= (type r_1@@30) RefType)) (and (= (isGreaterOne3 Heap@@55 r_1@@30) (|isGreaterOne3'| Heap@@55 r_1@@30)) (dummyFunction (bool_2_U (|isGreaterOne3#triggerStateless| r_1@@30)))))
 :qid |stdinbpl.480:15|
 :skolemid |38|
 :pattern ( (isGreaterOne3 Heap@@55 r_1@@30))
)))
(assert (forall ((Heap@@56 T@U) (r_1@@31 T@U) ) (!  (=> (and (= (type Heap@@56) (MapType0Type RefType)) (= (type r_1@@31) RefType)) (and (= (isGreaterOne32 Heap@@56 r_1@@31) (|isGreaterOne32'| Heap@@56 r_1@@31)) (dummyFunction (bool_2_U (|isGreaterOne32#triggerStateless| r_1@@31)))))
 :qid |stdinbpl.578:15|
 :skolemid |43|
 :pattern ( (isGreaterOne32 Heap@@56 r_1@@31))
)))
(assert (forall ((Heap@@57 T@U) (r_1@@32 T@U) ) (!  (=> (and (= (type Heap@@57) (MapType0Type RefType)) (= (type r_1@@32) RefType)) (and (= (isGreaterOne33 Heap@@57 r_1@@32) (|isGreaterOne33'| Heap@@57 r_1@@32)) (dummyFunction (bool_2_U (|isGreaterOne33#triggerStateless| r_1@@32)))))
 :qid |stdinbpl.686:15|
 :skolemid |49|
 :pattern ( (isGreaterOne33 Heap@@57 r_1@@32))
)))
(assert (forall ((Heap@@58 T@U) (r_1@@33 T@U) ) (!  (=> (and (= (type Heap@@58) (MapType0Type RefType)) (= (type r_1@@33) RefType)) (and (= (isGreaterOne34 Heap@@58 r_1@@33) (|isGreaterOne34'| Heap@@58 r_1@@33)) (dummyFunction (bool_2_U (|isGreaterOne34#triggerStateless| r_1@@33)))))
 :qid |stdinbpl.779:15|
 :skolemid |54|
 :pattern ( (isGreaterOne34 Heap@@58 r_1@@33))
)))
(assert (forall ((Heap@@59 T@U) (r_1@@34 T@U) ) (!  (=> (and (= (type Heap@@59) (MapType0Type RefType)) (= (type r_1@@34) RefType)) (and (= (isGreaterOne35 Heap@@59 r_1@@34) (|isGreaterOne35'| Heap@@59 r_1@@34)) (dummyFunction (bool_2_U (|isGreaterOne35#triggerStateless| r_1@@34)))))
 :qid |stdinbpl.877:15|
 :skolemid |59|
 :pattern ( (isGreaterOne35 Heap@@59 r_1@@34))
)))
(assert (forall ((Heap@@60 T@U) (ExhaleHeap@@4 T@U) (Mask@@34 T@U) (pm_f@@1 T@U) ) (! (let ((C@@1 (FieldTypeInv0 (type pm_f@@1))))
 (=> (and (and (and (and (and (= (type Heap@@60) (MapType0Type RefType)) (= (type ExhaleHeap@@4) (MapType0Type RefType))) (= (type Mask@@34) (MapType1Type RefType realType))) (= (type pm_f@@1) (FieldType C@@1 FrameTypeType))) (IdenticalOnKnownLocations Heap@@60 ExhaleHeap@@4 Mask@@34)) (and (HasDirectPerm Mask@@34 null pm_f@@1) (IsPredicateField pm_f@@1))) (forall ((o2 T@U) (f_2@@0 T@U) ) (! (let ((B@@5 (FieldTypeInv1 (type f_2@@0))))
(let ((A@@6 (FieldTypeInv0 (type f_2@@0))))
 (=> (and (and (= (type o2) RefType) (= (type f_2@@0) (FieldType A@@6 B@@5))) (U_2_bool (MapType1Select (MapType0Select Heap@@60 null (PredicateMaskField pm_f@@1)) o2 f_2@@0))) (= (MapType0Select Heap@@60 o2 f_2@@0) (MapType0Select ExhaleHeap@@4 o2 f_2@@0)))))
 :qid |stdinbpl.54:134|
 :skolemid |3|
 :pattern ( (MapType0Select ExhaleHeap@@4 o2 f_2@@0))
))))
 :qid |stdinbpl.52:19|
 :skolemid |4|
 :pattern ( (IdenticalOnKnownLocations Heap@@60 ExhaleHeap@@4 Mask@@34) (IsPredicateField pm_f@@1))
)))
(assert (forall ((Heap@@61 T@U) (ExhaleHeap@@5 T@U) (Mask@@35 T@U) (pm_f@@2 T@U) ) (! (let ((C@@2 (FieldTypeInv0 (type pm_f@@2))))
 (=> (and (and (and (and (and (= (type Heap@@61) (MapType0Type RefType)) (= (type ExhaleHeap@@5) (MapType0Type RefType))) (= (type Mask@@35) (MapType1Type RefType realType))) (= (type pm_f@@2) (FieldType C@@2 FrameTypeType))) (IdenticalOnKnownLocations Heap@@61 ExhaleHeap@@5 Mask@@35)) (and (HasDirectPerm Mask@@35 null pm_f@@2) (IsWandField pm_f@@2))) (forall ((o2@@0 T@U) (f_2@@1 T@U) ) (! (let ((B@@6 (FieldTypeInv1 (type f_2@@1))))
(let ((A@@7 (FieldTypeInv0 (type f_2@@1))))
 (=> (and (and (= (type o2@@0) RefType) (= (type f_2@@1) (FieldType A@@7 B@@6))) (U_2_bool (MapType1Select (MapType0Select Heap@@61 null (WandMaskField pm_f@@2)) o2@@0 f_2@@1))) (= (MapType0Select Heap@@61 o2@@0 f_2@@1) (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1)))))
 :qid |stdinbpl.67:129|
 :skolemid |6|
 :pattern ( (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1))
))))
 :qid |stdinbpl.65:19|
 :skolemid |7|
 :pattern ( (IdenticalOnKnownLocations Heap@@61 ExhaleHeap@@5 Mask@@35) (IsWandField pm_f@@2))
)))
(assert (forall ((x@@16 T@U) ) (!  (=> (= (type x@@16) RefType) (= (getPredWandId (P x@@16)) 0))
 :qid |stdinbpl.1348:15|
 :skolemid |86|
 :pattern ( (P x@@16))
)))
(assert (forall ((Mask@@36 T@U) (o_2@@2 T@U) (f_4@@2 T@U) ) (! (let ((B@@7 (FieldTypeInv1 (type f_4@@2))))
(let ((A@@8 (FieldTypeInv0 (type f_4@@2))))
 (=> (and (and (and (= (type Mask@@36) (MapType1Type RefType realType)) (= (type o_2@@2) RefType)) (= (type f_4@@2) (FieldType A@@8 B@@7))) (GoodMask Mask@@36)) (and (>= (U_2_real (MapType1Select Mask@@36 o_2@@2 f_4@@2)) NoPerm) (=> (and (and (GoodMask Mask@@36) (not (IsPredicateField f_4@@2))) (not (IsWandField f_4@@2))) (<= (U_2_real (MapType1Select Mask@@36 o_2@@2 f_4@@2)) FullPerm))))))
 :qid |stdinbpl.128:22|
 :skolemid |16|
 :pattern ( (GoodMask Mask@@36) (MapType1Select Mask@@36 o_2@@2 f_4@@2))
)))
(assert (forall ((Heap@@62 T@U) (Mask@@37 T@U) (i@@13 Int) ) (!  (=> (and (and (= (type Heap@@62) (MapType0Type RefType)) (= (type Mask@@37) (MapType1Type RefType realType))) (state Heap@@62 Mask@@37)) (= (|fac1'| Heap@@62 i@@13) (|fac1#frame| EmptyFrame i@@13)))
 :qid |stdinbpl.992:15|
 :skolemid |67|
 :pattern ( (state Heap@@62 Mask@@37) (|fac1'| Heap@@62 i@@13))
)))
(assert (forall ((Heap@@63 T@U) (Mask@@38 T@U) (i@@14 Int) ) (!  (=> (and (and (= (type Heap@@63) (MapType0Type RefType)) (= (type Mask@@38) (MapType1Type RefType realType))) (state Heap@@63 Mask@@38)) (= (|fac2'| Heap@@63 i@@14) (|fac2#frame| EmptyFrame i@@14)))
 :qid |stdinbpl.1055:15|
 :skolemid |71|
 :pattern ( (state Heap@@63 Mask@@38) (|fac2'| Heap@@63 i@@14))
)))
(assert (forall ((Heap@@64 T@U) (Mask@@39 T@U) (i@@15 Int) ) (!  (=> (and (and (= (type Heap@@64) (MapType0Type RefType)) (= (type Mask@@39) (MapType1Type RefType realType))) (state Heap@@64 Mask@@39)) (= (|fac3'| Heap@@64 i@@15) (|fac3#frame| EmptyFrame i@@15)))
 :qid |stdinbpl.1118:15|
 :skolemid |75|
 :pattern ( (state Heap@@64 Mask@@39) (|fac3'| Heap@@64 i@@15))
)))
(assert (forall ((Heap@@65 T@U) (Mask@@40 T@U) (x@@17 T@U) ) (!  (=> (and (and (and (= (type Heap@@65) (MapType0Type RefType)) (= (type Mask@@40) (MapType1Type RefType realType))) (= (type x@@17) RefType)) (state Heap@@65 Mask@@40)) (= (|funP'| Heap@@65 x@@17) (|funP#frame| (MapType0Select Heap@@65 null (P x@@17)) x@@17)))
 :qid |stdinbpl.1181:15|
 :skolemid |79|
 :pattern ( (state Heap@@65 Mask@@40) (|funP'| Heap@@65 x@@17))
)))
(assert (forall ((Heap@@66 T@U) (Mask@@41 T@U) (x@@18 T@U) ) (!  (=> (and (and (and (= (type Heap@@66) (MapType0Type RefType)) (= (type Mask@@41) (MapType1Type RefType realType))) (= (type x@@18) RefType)) (state Heap@@66 Mask@@41)) (= (|funP2'| Heap@@66 x@@18) (|funP2#frame| (MapType0Select Heap@@66 null (P x@@18)) x@@18)))
 :qid |stdinbpl.1269:15|
 :skolemid |83|
 :pattern ( (state Heap@@66 Mask@@41) (|funP2'| Heap@@66 x@@18))
)))
(assert (forall ((o T@U) (f T@U) (Heap@@67 T@U) ) (!  (=> (and (and (and (= (type o) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap@@67) (MapType0Type RefType))) (U_2_bool (MapType0Select Heap@@67 o $allocated))) (U_2_bool (MapType0Select Heap@@67 (MapType0Select Heap@@67 o f) $allocated)))
 :qid |stdinbpl.31:15|
 :skolemid |0|
 :pattern ( (MapType0Select Heap@@67 o f))
)))
(assert (forall ((x@@19 T@U) ) (!  (=> (= (type x@@19) RefType) (= (PredicateMaskField (P x@@19)) (|P#sm| x@@19)))
 :qid |stdinbpl.1340:15|
 :skolemid |84|
 :pattern ( (PredicateMaskField (P x@@19)))
)))
(assert (forall ((Heap@@68 T@U) (Mask@@42 T@U) (r_1@@35 T@U) ) (!  (=> (and (and (and (= (type Heap@@68) (MapType0Type RefType)) (= (type Mask@@42) (MapType1Type RefType realType))) (= (type r_1@@35) RefType)) (and (state Heap@@68 Mask@@42) (< AssumeFunctionsAbove 7))) (= (isGreaterOne33 Heap@@68 r_1@@35) (isGreaterOne Heap@@68 (U_2_int (MapType0Select Heap@@68 r_1@@35 f_7)))))
 :qid |stdinbpl.696:15|
 :skolemid |51|
 :pattern ( (state Heap@@68 Mask@@42) (isGreaterOne33 Heap@@68 r_1@@35))
)))
(assert (forall ((Heap@@69 T@U) (o@@0 T@U) (f_3 T@U) (v T@U) ) (! (let ((B@@8 (type v)))
(let ((A@@9 (FieldTypeInv0 (type f_3))))
 (=> (and (and (= (type Heap@@69) (MapType0Type RefType)) (= (type o@@0) RefType)) (= (type f_3) (FieldType A@@9 B@@8))) (succHeap Heap@@69 (MapType0Store Heap@@69 o@@0 f_3 v)))))
 :qid |stdinbpl.78:22|
 :skolemid |9|
 :pattern ( (MapType0Store Heap@@69 o@@0 f_3 v))
)))
(assert (forall ((Heap@@70 T@U) (Mask@@43 T@U) (x@@20 T@U) ) (!  (=> (and (and (and (= (type Heap@@70) (MapType0Type RefType)) (= (type Mask@@43) (MapType1Type RefType realType))) (= (type x@@20) RefType)) (and (state Heap@@70 Mask@@43) (< AssumeFunctionsAbove 0))) (= (funP2 Heap@@70 x@@20) (U_2_int (MapType0Select Heap@@70 x@@20 f_7))))
 :qid |stdinbpl.1262:15|
 :skolemid |82|
 :pattern ( (state Heap@@70 Mask@@43) (funP2 Heap@@70 x@@20))
 :pattern ( (state Heap@@70 Mask@@43) (|funP2#triggerStateless| x@@20) (|P#trigger| Heap@@70 (P x@@20)))
)))
(assert (forall ((Heap@@71 T@U) (Mask@@44 T@U) (x@@21 T@U) ) (!  (=> (and (and (and (= (type Heap@@71) (MapType0Type RefType)) (= (type Mask@@44) (MapType1Type RefType realType))) (= (type x@@21) RefType)) (and (state Heap@@71 Mask@@44) (< AssumeFunctionsAbove 6))) (= (funP Heap@@71 x@@21) (U_2_int (MapType0Select Heap@@71 x@@21 f_7))))
 :qid |stdinbpl.1174:15|
 :skolemid |78|
 :pattern ( (state Heap@@71 Mask@@44) (funP Heap@@71 x@@21))
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
 :qid |stdinbpl.180:25|
 :skolemid |20|
 :pattern ( (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
; Valid

(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun Heap@@72 () T@U)
(declare-fun j () Int)
(assert (= (type Heap@@72) (MapType0Type RefType)))
(set-info :boogie-vc-id mProveOpaque)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 10) (let ((anon6_Else_correct  (and (=> (= (ControlFlow 0 6) (- 0 7)) (|isGreaterOne'| Heap@@72 j)) (=> (|isGreaterOne'| Heap@@72 j) (=> (and (state Heap@@72 ZeroMask) (= (ControlFlow 0 6) (- 0 5))) false)))))
(let ((anon6_Then_correct  (=> (= (ControlFlow 0 4) (- 0 3)) (> j (- 0 60)))))
(let ((anon5_Else_correct  (=> (isGreaterOne Heap@@72 j) (=> (and (state Heap@@72 ZeroMask) (state Heap@@72 ZeroMask)) (and (=> (= (ControlFlow 0 8) 4) anon6_Then_correct) (=> (= (ControlFlow 0 8) 6) anon6_Else_correct))))))
(let ((anon5_Then_correct  (=> (= (ControlFlow 0 2) (- 0 1)) (> j (- 0 60)))))
(let ((anon0_correct  (=> (state Heap@@72 ZeroMask) (=> (and (and (= AssumeFunctionsAbove (- 0 1)) (> j (- 0 40))) (and (state Heap@@72 ZeroMask) (state Heap@@72 ZeroMask))) (and (=> (= (ControlFlow 0 9) 2) anon5_Then_correct) (=> (= (ControlFlow 0 9) 8) anon5_Else_correct))))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 10) 9) anon0_correct)))
PreconditionGeneratedEntry_correct)))))))
))
(check-sat)
(get-info :reason-unknown)
(assert (not (= (ControlFlow 0 6) (- 5))))
(check-sat)
(pop 1)
; Invalid
(get-info :rlimit)
(reset)
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
(declare-fun f_7 () T@U)
(declare-fun FieldType (T@T T@T) T@T)
(declare-fun FieldTypeInv0 (T@T) T@T)
(declare-fun FieldTypeInv1 (T@T) T@T)
(declare-fun NormalFieldType () T@T)
(declare-fun state (T@U T@U) Bool)
(declare-fun |isGreaterOne34'| (T@U T@U) Bool)
(declare-fun MapType0Type (T@T) T@T)
(declare-fun RefType () T@T)
(declare-fun MapType1Type (T@T T@T) T@T)
(declare-fun AssumeFunctionsAbove () Int)
(declare-fun |isGreaterOne34#trigger| (T@U T@U) Bool)
(declare-fun FrameFragment (T@U) T@U)
(declare-fun MapType0Select (T@U T@U T@U) T@U)
(declare-fun MapType0TypeInv0 (T@T) T@T)
(declare-fun MapType0Store (T@U T@U T@U T@U) T@U)
(declare-fun MapType1TypeInv0 (T@T) T@T)
(declare-fun MapType1TypeInv1 (T@T) T@T)
(declare-fun MapType1Select (T@U T@U T@U) T@U)
(declare-fun MapType1Store (T@U T@U T@U T@U) T@U)
(declare-fun FrameTypeType () T@T)
(declare-fun |isGreaterOne2'| (T@U T@U) Bool)
(declare-fun |isGreaterOne2#trigger| (T@U T@U) Bool)
(declare-fun |isGreaterOne35'| (T@U T@U) Bool)
(declare-fun |isGreaterOne35#trigger| (T@U T@U) Bool)
(declare-fun |isGreaterOne22'| (T@U T@U) Bool)
(declare-fun |isGreaterOne22#trigger| (T@U T@U) Bool)
(declare-fun |isGreaterOne3'| (T@U T@U) Bool)
(declare-fun |isGreaterOne3#trigger| (T@U T@U) Bool)
(declare-fun |isGreaterOne32'| (T@U T@U) Bool)
(declare-fun |isGreaterOne32#trigger| (T@U T@U) Bool)
(declare-fun succHeap (T@U T@U) Bool)
(declare-fun succHeapTrans (T@U T@U) Bool)
(declare-fun GoodMask (T@U) Bool)
(declare-fun IdenticalOnKnownLocations (T@U T@U T@U) Bool)
(declare-fun IsPredicateField (T@U) Bool)
(declare-fun null () T@U)
(declare-fun PredicateMaskField (T@U) T@U)
(declare-fun HasDirectPerm (T@U T@U T@U) Bool)
(declare-fun IsWandField (T@U) Bool)
(declare-fun WandMaskField (T@U) T@U)
(declare-fun P (T@U) T@U)
(declare-fun PredicateType_PType () T@T)
(declare-fun |isGreaterOne'| (T@U Int) Bool)
(declare-fun dummyFunction (T@U) Bool)
(declare-fun |isGreaterOne#triggerStateless| (Int) Bool)
(declare-fun |isGreaterOne2#triggerStateless| (T@U) Bool)
(declare-fun |isGreaterOne22#triggerStateless| (T@U) Bool)
(declare-fun |isGreaterOne3#triggerStateless| (T@U) Bool)
(declare-fun |isGreaterOne32#triggerStateless| (T@U) Bool)
(declare-fun |isGreaterOne33'| (T@U T@U) Bool)
(declare-fun |isGreaterOne33#triggerStateless| (T@U) Bool)
(declare-fun |isGreaterOne34#triggerStateless| (T@U) Bool)
(declare-fun |isGreaterOne35#triggerStateless| (T@U) Bool)
(declare-fun |fac1'| (T@U Int) Int)
(declare-fun |fac1#triggerStateless| (Int) Int)
(declare-fun |fac2'| (T@U Int) Int)
(declare-fun |fac2#triggerStateless| (Int) Int)
(declare-fun |fac3'| (T@U Int) Int)
(declare-fun |fac3#triggerStateless| (Int) Int)
(declare-fun |funP'| (T@U T@U) Int)
(declare-fun |funP#triggerStateless| (T@U) Int)
(declare-fun |funP2'| (T@U T@U) Int)
(declare-fun |funP2#triggerStateless| (T@U) Int)
(declare-fun |P#trigger| (T@U T@U) Bool)
(declare-fun |P#everUsed| (T@U) Bool)
(declare-fun fac1 (T@U Int) Int)
(declare-fun fac2 (T@U Int) Int)
(declare-fun fac3 (T@U Int) Int)
(declare-fun funP (T@U T@U) Int)
(declare-fun funP2 (T@U T@U) Int)
(declare-fun isGreaterOne (T@U Int) Bool)
(declare-fun |P#sm| (T@U) T@U)
(declare-fun dummyHeap () T@U)
(declare-fun ZeroMask () T@U)
(declare-fun InsidePredicate (T@U T@U T@U T@U) Bool)
(declare-fun |isGreaterOne33#trigger| (T@U T@U) Bool)
(declare-fun sumMask (T@U T@U T@U) Bool)
(declare-fun isGreaterOne34 (T@U T@U) Bool)
(declare-fun isGreaterOne2 (T@U T@U) Bool)
(declare-fun isGreaterOne35 (T@U T@U) Bool)
(declare-fun isGreaterOne22 (T@U T@U) Bool)
(declare-fun isGreaterOne3 (T@U T@U) Bool)
(declare-fun isGreaterOne32 (T@U T@U) Bool)
(declare-fun ConditionalFrame (Real T@U) T@U)
(declare-fun EmptyFrame () T@U)
(declare-fun NoPerm () Real)
(declare-fun |isGreaterOne#frame| (T@U Int) Bool)
(declare-fun |isGreaterOne#trigger| (T@U Int) Bool)
(declare-fun |isGreaterOne2#frame| (T@U T@U) Bool)
(declare-fun |isGreaterOne22#frame| (T@U T@U) Bool)
(declare-fun |isGreaterOne3#frame| (T@U T@U) Bool)
(declare-fun |isGreaterOne32#frame| (T@U T@U) Bool)
(declare-fun |isGreaterOne33#frame| (T@U T@U) Bool)
(declare-fun |isGreaterOne34#frame| (T@U T@U) Bool)
(declare-fun |isGreaterOne35#frame| (T@U T@U) Bool)
(declare-fun isGreaterOne33 (T@U T@U) Bool)
(declare-fun getPredWandId (T@U) Int)
(declare-fun FullPerm () Real)
(declare-fun |fac1#frame| (T@U Int) Int)
(declare-fun |fac2#frame| (T@U Int) Int)
(declare-fun |fac3#frame| (T@U Int) Int)
(declare-fun |funP#frame| (T@U T@U) Int)
(declare-fun |funP2#frame| (T@U T@U) Int)
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
))) (= (Ctor NormalFieldType) 7)) (= (type $allocated) (FieldType NormalFieldType boolType))) (= (type f_7) (FieldType NormalFieldType intType))))
(assert (distinct $allocated f_7)
)
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (forall ((arg0@@14 T@T) ) (! (= (Ctor (MapType0Type arg0@@14)) 8)
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
)))) (= (Ctor RefType) 9)) (forall ((arg0@@18 T@T) (arg1@@4 T@T) ) (! (= (Ctor (MapType1Type arg0@@18 arg1@@4)) 10)
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
)))) (= (Ctor FrameTypeType) 11)) (forall ((arg0@@23 T@U) ) (! (= (type (FrameFragment arg0@@23)) FrameTypeType)
 :qid |funType:FrameFragment|
 :pattern ( (FrameFragment arg0@@23))
))))
(assert (forall ((Heap T@U) (Mask T@U) (r_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap) (MapType0Type RefType)) (= (type Mask) (MapType1Type RefType realType))) (= (type r_1) RefType)) (and (state Heap Mask) (or (< AssumeFunctionsAbove 1) (|isGreaterOne34#trigger| (FrameFragment (MapType0Select Heap r_1 f_7)) r_1)))) (> (U_2_int (MapType0Select Heap r_1 f_7)) (- 0 38))) (> (U_2_int (MapType0Select Heap r_1 f_7)) 60)) (|isGreaterOne34'| Heap r_1))
 :qid |stdinbpl.802:15|
 :skolemid |58|
 :pattern ( (state Heap Mask) (|isGreaterOne34'| Heap r_1))
)))
(assert (forall ((Heap@@0 T@U) (Mask@@0 T@U) (r_1@@0 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@0) (MapType0Type RefType)) (= (type Mask@@0) (MapType1Type RefType realType))) (= (type r_1@@0) RefType)) (and (state Heap@@0 Mask@@0) (or (< AssumeFunctionsAbove 2) (|isGreaterOne2#trigger| (FrameFragment (MapType0Select Heap@@0 r_1@@0 f_7)) r_1@@0)))) (> (U_2_int (MapType0Select Heap@@0 r_1@@0 f_7)) (- 0 38))) (> (U_2_int (MapType0Select Heap@@0 r_1@@0 f_7)) 60)) (|isGreaterOne2'| Heap@@0 r_1@@0))
 :qid |stdinbpl.297:15|
 :skolemid |31|
 :pattern ( (state Heap@@0 Mask@@0) (|isGreaterOne2'| Heap@@0 r_1@@0))
)))
(assert (forall ((Heap@@1 T@U) (Mask@@1 T@U) (r_1@@1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@1) (MapType0Type RefType)) (= (type Mask@@1) (MapType1Type RefType realType))) (= (type r_1@@1) RefType)) (and (state Heap@@1 Mask@@1) (or (< AssumeFunctionsAbove 3) (|isGreaterOne35#trigger| (FrameFragment (MapType0Select Heap@@1 r_1@@1 f_7)) r_1@@1)))) (> (U_2_int (MapType0Select Heap@@1 r_1@@1 f_7)) (- 0 38))) (> (U_2_int (MapType0Select Heap@@1 r_1@@1 f_7)) 60)) (|isGreaterOne35'| Heap@@1 r_1@@1))
 :qid |stdinbpl.900:15|
 :skolemid |63|
 :pattern ( (state Heap@@1 Mask@@1) (|isGreaterOne35'| Heap@@1 r_1@@1))
)))
(assert (forall ((Heap@@2 T@U) (Mask@@2 T@U) (r_1@@2 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@2) (MapType0Type RefType)) (= (type Mask@@2) (MapType1Type RefType realType))) (= (type r_1@@2) RefType)) (and (state Heap@@2 Mask@@2) (or (< AssumeFunctionsAbove 5) (|isGreaterOne22#trigger| (FrameFragment (MapType0Select Heap@@2 r_1@@2 f_7)) r_1@@2)))) (> (U_2_int (MapType0Select Heap@@2 r_1@@2 f_7)) (- 0 38))) (> (U_2_int (MapType0Select Heap@@2 r_1@@2 f_7)) 60)) (|isGreaterOne22'| Heap@@2 r_1@@2))
 :qid |stdinbpl.395:15|
 :skolemid |36|
 :pattern ( (state Heap@@2 Mask@@2) (|isGreaterOne22'| Heap@@2 r_1@@2))
)))
(assert (forall ((Heap@@3 T@U) (Mask@@3 T@U) (r_1@@3 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@3) (MapType0Type RefType)) (= (type Mask@@3) (MapType1Type RefType realType))) (= (type r_1@@3) RefType)) (and (state Heap@@3 Mask@@3) (or (< AssumeFunctionsAbove 8) (|isGreaterOne3#trigger| (FrameFragment (MapType0Select Heap@@3 r_1@@3 f_7)) r_1@@3)))) (> (U_2_int (MapType0Select Heap@@3 r_1@@3 f_7)) (- 0 38))) (> (U_2_int (MapType0Select Heap@@3 r_1@@3 f_7)) 60)) (|isGreaterOne3'| Heap@@3 r_1@@3))
 :qid |stdinbpl.503:15|
 :skolemid |42|
 :pattern ( (state Heap@@3 Mask@@3) (|isGreaterOne3'| Heap@@3 r_1@@3))
)))
(assert (forall ((Heap@@4 T@U) (Mask@@4 T@U) (r_1@@4 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@4) (MapType0Type RefType)) (= (type Mask@@4) (MapType1Type RefType realType))) (= (type r_1@@4) RefType)) (and (state Heap@@4 Mask@@4) (or (< AssumeFunctionsAbove 11) (|isGreaterOne32#trigger| (FrameFragment (MapType0Select Heap@@4 r_1@@4 f_7)) r_1@@4)))) (> (U_2_int (MapType0Select Heap@@4 r_1@@4 f_7)) (- 0 38))) (> (U_2_int (MapType0Select Heap@@4 r_1@@4 f_7)) 60)) (|isGreaterOne32'| Heap@@4 r_1@@4))
 :qid |stdinbpl.601:15|
 :skolemid |47|
 :pattern ( (state Heap@@4 Mask@@4) (|isGreaterOne32'| Heap@@4 r_1@@4))
)))
(assert (forall ((Heap0 T@U) (Heap1 T@U) ) (!  (=> (and (and (= (type Heap0) (MapType0Type RefType)) (= (type Heap1) (MapType0Type RefType))) (succHeap Heap0 Heap1)) (succHeapTrans Heap0 Heap1))
 :qid |stdinbpl.88:15|
 :skolemid |11|
 :pattern ( (succHeap Heap0 Heap1))
)))
(assert (forall ((Heap@@5 T@U) (Mask@@5 T@U) ) (!  (=> (and (and (= (type Heap@@5) (MapType0Type RefType)) (= (type Mask@@5) (MapType1Type RefType realType))) (state Heap@@5 Mask@@5)) (GoodMask Mask@@5))
 :qid |stdinbpl.124:15|
 :skolemid |15|
 :pattern ( (state Heap@@5 Mask@@5))
)))
(assert (forall ((Heap0@@0 T@U) (Heap1@@0 T@U) (Heap2 T@U) ) (!  (=> (and (and (and (= (type Heap0@@0) (MapType0Type RefType)) (= (type Heap1@@0) (MapType0Type RefType))) (= (type Heap2) (MapType0Type RefType))) (and (succHeapTrans Heap0@@0 Heap1@@0) (succHeap Heap1@@0 Heap2))) (succHeapTrans Heap0@@0 Heap2))
 :qid |stdinbpl.93:15|
 :skolemid |12|
 :pattern ( (succHeapTrans Heap0@@0 Heap1@@0) (succHeap Heap1@@0 Heap2))
)))
(assert  (and (= (type null) RefType) (forall ((arg0@@24 T@U) ) (! (let ((A (FieldTypeInv0 (type arg0@@24))))
(= (type (PredicateMaskField arg0@@24)) (FieldType A (MapType1Type RefType boolType))))
 :qid |funType:PredicateMaskField|
 :pattern ( (PredicateMaskField arg0@@24))
))))
(assert (forall ((Heap@@6 T@U) (ExhaleHeap T@U) (Mask@@6 T@U) (pm_f T@U) ) (! (let ((C (FieldTypeInv0 (type pm_f))))
 (=> (and (and (and (and (and (= (type Heap@@6) (MapType0Type RefType)) (= (type ExhaleHeap) (MapType0Type RefType))) (= (type Mask@@6) (MapType1Type RefType realType))) (= (type pm_f) (FieldType C FrameTypeType))) (IdenticalOnKnownLocations Heap@@6 ExhaleHeap Mask@@6)) (and (HasDirectPerm Mask@@6 null pm_f) (IsPredicateField pm_f))) (= (MapType0Select Heap@@6 null (PredicateMaskField pm_f)) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))))
 :qid |stdinbpl.47:19|
 :skolemid |2|
 :pattern ( (IdenticalOnKnownLocations Heap@@6 ExhaleHeap Mask@@6) (IsPredicateField pm_f) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))
)))
(assert (forall ((arg0@@25 T@U) ) (! (let ((A@@0 (FieldTypeInv0 (type arg0@@25))))
(= (type (WandMaskField arg0@@25)) (FieldType A@@0 (MapType1Type RefType boolType))))
 :qid |funType:WandMaskField|
 :pattern ( (WandMaskField arg0@@25))
)))
(assert (forall ((Heap@@7 T@U) (ExhaleHeap@@0 T@U) (Mask@@7 T@U) (pm_f@@0 T@U) ) (! (let ((C@@0 (FieldTypeInv0 (type pm_f@@0))))
 (=> (and (and (and (and (and (= (type Heap@@7) (MapType0Type RefType)) (= (type ExhaleHeap@@0) (MapType0Type RefType))) (= (type Mask@@7) (MapType1Type RefType realType))) (= (type pm_f@@0) (FieldType C@@0 FrameTypeType))) (IdenticalOnKnownLocations Heap@@7 ExhaleHeap@@0 Mask@@7)) (and (HasDirectPerm Mask@@7 null pm_f@@0) (IsWandField pm_f@@0))) (= (MapType0Select Heap@@7 null (WandMaskField pm_f@@0)) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))))
 :qid |stdinbpl.60:19|
 :skolemid |5|
 :pattern ( (IdenticalOnKnownLocations Heap@@7 ExhaleHeap@@0 Mask@@7) (IsWandField pm_f@@0) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))
)))
(assert (forall ((Heap@@8 T@U) (Mask@@8 T@U) (r_1@@5 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@8) (MapType0Type RefType)) (= (type Mask@@8) (MapType1Type RefType realType))) (= (type r_1@@5) RefType)) (and (state Heap@@8 Mask@@8) (or (< AssumeFunctionsAbove 5) (|isGreaterOne22#trigger| (FrameFragment (MapType0Select Heap@@8 r_1@@5 f_7)) r_1@@5)))) (> (U_2_int (MapType0Select Heap@@8 r_1@@5 f_7)) (- 0 38))) (= (|isGreaterOne22'| Heap@@8 r_1@@5) (> (U_2_int (MapType0Select Heap@@8 r_1@@5 f_7)) 1)))
 :qid |stdinbpl.399:15|
 :skolemid |37|
 :pattern ( (state Heap@@8 Mask@@8) (|isGreaterOne22'| Heap@@8 r_1@@5))
)))
(assert (forall ((Heap@@9 T@U) (Mask@@9 T@U) (r_1@@6 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@9) (MapType0Type RefType)) (= (type Mask@@9) (MapType1Type RefType realType))) (= (type r_1@@6) RefType)) (and (state Heap@@9 Mask@@9) (or (< AssumeFunctionsAbove 11) (|isGreaterOne32#trigger| (FrameFragment (MapType0Select Heap@@9 r_1@@6 f_7)) r_1@@6)))) (> (U_2_int (MapType0Select Heap@@9 r_1@@6 f_7)) (- 0 38))) (= (|isGreaterOne32'| Heap@@9 r_1@@6) (> (U_2_int (MapType0Select Heap@@9 r_1@@6 f_7)) 1)))
 :qid |stdinbpl.605:15|
 :skolemid |48|
 :pattern ( (state Heap@@9 Mask@@9) (|isGreaterOne32'| Heap@@9 r_1@@6))
)))
(assert  (and (= (Ctor PredicateType_PType) 12) (forall ((arg0@@26 T@U) ) (! (= (type (P arg0@@26)) (FieldType PredicateType_PType FrameTypeType))
 :qid |funType:P|
 :pattern ( (P arg0@@26))
))))
(assert (forall ((x@@8 T@U) ) (!  (=> (= (type x@@8) RefType) (IsPredicateField (P x@@8)))
 :qid |stdinbpl.1344:15|
 :skolemid |85|
 :pattern ( (P x@@8))
)))
(assert (forall ((Heap@@10 T@U) (i Int) ) (!  (=> (= (type Heap@@10) (MapType0Type RefType)) (dummyFunction (bool_2_U (|isGreaterOne#triggerStateless| i))))
 :qid |stdinbpl.209:15|
 :skolemid |23|
 :pattern ( (|isGreaterOne'| Heap@@10 i))
)))
(assert (forall ((Heap@@11 T@U) (r_1@@7 T@U) ) (!  (=> (and (= (type Heap@@11) (MapType0Type RefType)) (= (type r_1@@7) RefType)) (dummyFunction (bool_2_U (|isGreaterOne2#triggerStateless| r_1@@7))))
 :qid |stdinbpl.278:15|
 :skolemid |28|
 :pattern ( (|isGreaterOne2'| Heap@@11 r_1@@7))
)))
(assert (forall ((Heap@@12 T@U) (r_1@@8 T@U) ) (!  (=> (and (= (type Heap@@12) (MapType0Type RefType)) (= (type r_1@@8) RefType)) (dummyFunction (bool_2_U (|isGreaterOne22#triggerStateless| r_1@@8))))
 :qid |stdinbpl.376:15|
 :skolemid |33|
 :pattern ( (|isGreaterOne22'| Heap@@12 r_1@@8))
)))
(assert (forall ((Heap@@13 T@U) (r_1@@9 T@U) ) (!  (=> (and (= (type Heap@@13) (MapType0Type RefType)) (= (type r_1@@9) RefType)) (dummyFunction (bool_2_U (|isGreaterOne3#triggerStateless| r_1@@9))))
 :qid |stdinbpl.484:15|
 :skolemid |39|
 :pattern ( (|isGreaterOne3'| Heap@@13 r_1@@9))
)))
(assert (forall ((Heap@@14 T@U) (r_1@@10 T@U) ) (!  (=> (and (= (type Heap@@14) (MapType0Type RefType)) (= (type r_1@@10) RefType)) (dummyFunction (bool_2_U (|isGreaterOne32#triggerStateless| r_1@@10))))
 :qid |stdinbpl.582:15|
 :skolemid |44|
 :pattern ( (|isGreaterOne32'| Heap@@14 r_1@@10))
)))
(assert (forall ((Heap@@15 T@U) (r_1@@11 T@U) ) (!  (=> (and (= (type Heap@@15) (MapType0Type RefType)) (= (type r_1@@11) RefType)) (dummyFunction (bool_2_U (|isGreaterOne33#triggerStateless| r_1@@11))))
 :qid |stdinbpl.690:15|
 :skolemid |50|
 :pattern ( (|isGreaterOne33'| Heap@@15 r_1@@11))
)))
(assert (forall ((Heap@@16 T@U) (r_1@@12 T@U) ) (!  (=> (and (= (type Heap@@16) (MapType0Type RefType)) (= (type r_1@@12) RefType)) (dummyFunction (bool_2_U (|isGreaterOne34#triggerStateless| r_1@@12))))
 :qid |stdinbpl.783:15|
 :skolemid |55|
 :pattern ( (|isGreaterOne34'| Heap@@16 r_1@@12))
)))
(assert (forall ((Heap@@17 T@U) (r_1@@13 T@U) ) (!  (=> (and (= (type Heap@@17) (MapType0Type RefType)) (= (type r_1@@13) RefType)) (dummyFunction (bool_2_U (|isGreaterOne35#triggerStateless| r_1@@13))))
 :qid |stdinbpl.881:15|
 :skolemid |60|
 :pattern ( (|isGreaterOne35'| Heap@@17 r_1@@13))
)))
(assert (forall ((Heap@@18 T@U) (i@@0 Int) ) (!  (=> (= (type Heap@@18) (MapType0Type RefType)) (dummyFunction (int_2_U (|fac1#triggerStateless| i@@0))))
 :qid |stdinbpl.979:15|
 :skolemid |65|
 :pattern ( (|fac1'| Heap@@18 i@@0))
)))
(assert (forall ((Heap@@19 T@U) (i@@1 Int) ) (!  (=> (= (type Heap@@19) (MapType0Type RefType)) (dummyFunction (int_2_U (|fac2#triggerStateless| i@@1))))
 :qid |stdinbpl.1042:15|
 :skolemid |69|
 :pattern ( (|fac2'| Heap@@19 i@@1))
)))
(assert (forall ((Heap@@20 T@U) (i@@2 Int) ) (!  (=> (= (type Heap@@20) (MapType0Type RefType)) (dummyFunction (int_2_U (|fac3#triggerStateless| i@@2))))
 :qid |stdinbpl.1105:15|
 :skolemid |73|
 :pattern ( (|fac3'| Heap@@20 i@@2))
)))
(assert (forall ((Heap@@21 T@U) (x@@9 T@U) ) (!  (=> (and (= (type Heap@@21) (MapType0Type RefType)) (= (type x@@9) RefType)) (dummyFunction (int_2_U (|funP#triggerStateless| x@@9))))
 :qid |stdinbpl.1168:15|
 :skolemid |77|
 :pattern ( (|funP'| Heap@@21 x@@9))
)))
(assert (forall ((Heap@@22 T@U) (x@@10 T@U) ) (!  (=> (and (= (type Heap@@22) (MapType0Type RefType)) (= (type x@@10) RefType)) (dummyFunction (int_2_U (|funP2#triggerStateless| x@@10))))
 :qid |stdinbpl.1256:15|
 :skolemid |81|
 :pattern ( (|funP2'| Heap@@22 x@@10))
)))
(assert (forall ((Heap@@23 T@U) (x@@11 T@U) ) (!  (=> (and (= (type Heap@@23) (MapType0Type RefType)) (= (type x@@11) RefType)) (|P#everUsed| (P x@@11)))
 :qid |stdinbpl.1363:15|
 :skolemid |89|
 :pattern ( (|P#trigger| Heap@@23 (P x@@11)))
)))
(assert (forall ((Heap@@24 T@U) (ExhaleHeap@@1 T@U) (Mask@@10 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@24) (MapType0Type RefType)) (= (type ExhaleHeap@@1) (MapType0Type RefType))) (= (type Mask@@10) (MapType1Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@24 ExhaleHeap@@1 Mask@@10)) (U_2_bool (MapType0Select Heap@@24 o_1 $allocated))) (U_2_bool (MapType0Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.73:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@24 ExhaleHeap@@1 Mask@@10) (MapType0Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert (forall ((Heap@@25 T@U) (i@@3 Int) ) (!  (=> (= (type Heap@@25) (MapType0Type RefType)) (and (= (fac1 Heap@@25 i@@3) (|fac1'| Heap@@25 i@@3)) (dummyFunction (int_2_U (|fac1#triggerStateless| i@@3)))))
 :qid |stdinbpl.975:15|
 :skolemid |64|
 :pattern ( (fac1 Heap@@25 i@@3))
)))
(assert (forall ((Heap@@26 T@U) (i@@4 Int) ) (!  (=> (= (type Heap@@26) (MapType0Type RefType)) (and (= (fac2 Heap@@26 i@@4) (|fac2'| Heap@@26 i@@4)) (dummyFunction (int_2_U (|fac2#triggerStateless| i@@4)))))
 :qid |stdinbpl.1038:15|
 :skolemid |68|
 :pattern ( (fac2 Heap@@26 i@@4))
)))
(assert (forall ((Heap@@27 T@U) (i@@5 Int) ) (!  (=> (= (type Heap@@27) (MapType0Type RefType)) (and (= (fac3 Heap@@27 i@@5) (|fac3'| Heap@@27 i@@5)) (dummyFunction (int_2_U (|fac3#triggerStateless| i@@5)))))
 :qid |stdinbpl.1101:15|
 :skolemid |72|
 :pattern ( (fac3 Heap@@27 i@@5))
)))
(assert (forall ((Heap@@28 T@U) (x@@12 T@U) ) (!  (=> (and (= (type Heap@@28) (MapType0Type RefType)) (= (type x@@12) RefType)) (and (= (funP Heap@@28 x@@12) (|funP'| Heap@@28 x@@12)) (dummyFunction (int_2_U (|funP#triggerStateless| x@@12)))))
 :qid |stdinbpl.1164:15|
 :skolemid |76|
 :pattern ( (funP Heap@@28 x@@12))
)))
(assert (forall ((Heap@@29 T@U) (x@@13 T@U) ) (!  (=> (and (= (type Heap@@29) (MapType0Type RefType)) (= (type x@@13) RefType)) (and (= (funP2 Heap@@29 x@@13) (|funP2'| Heap@@29 x@@13)) (dummyFunction (int_2_U (|funP2#triggerStateless| x@@13)))))
 :qid |stdinbpl.1252:15|
 :skolemid |80|
 :pattern ( (funP2 Heap@@29 x@@13))
)))
(assert (forall ((Heap@@30 T@U) (Mask@@11 T@U) (i@@6 Int) ) (!  (=> (and (and (and (= (type Heap@@30) (MapType0Type RefType)) (= (type Mask@@11) (MapType1Type RefType realType))) (and (state Heap@@30 Mask@@11) (< AssumeFunctionsAbove 12))) (> i@@6 (- 0 60))) (= (isGreaterOne Heap@@30 i@@6) (> i@@6 1)))
 :qid |stdinbpl.215:15|
 :skolemid |24|
 :pattern ( (state Heap@@30 Mask@@11) (isGreaterOne Heap@@30 i@@6))
)))
(assert (forall ((x@@14 T@U) (x2 T@U) ) (!  (=> (and (and (= (type x@@14) RefType) (= (type x2) RefType)) (= (P x@@14) (P x2))) (= x@@14 x2))
 :qid |stdinbpl.1354:15|
 :skolemid |87|
 :pattern ( (P x@@14) (P x2))
)))
(assert (forall ((arg0@@27 T@U) ) (! (= (type (|P#sm| arg0@@27)) (FieldType PredicateType_PType (MapType1Type RefType boolType)))
 :qid |funType:P#sm|
 :pattern ( (|P#sm| arg0@@27))
)))
(assert (forall ((x@@15 T@U) (x2@@0 T@U) ) (!  (=> (and (and (= (type x@@15) RefType) (= (type x2@@0) RefType)) (= (|P#sm| x@@15) (|P#sm| x2@@0))) (= x@@15 x2@@0))
 :qid |stdinbpl.1358:15|
 :skolemid |88|
 :pattern ( (|P#sm| x@@15) (|P#sm| x2@@0))
)))
(assert (forall ((Heap@@31 T@U) (Mask@@12 T@U) (i@@7 Int) ) (!  (=> (and (and (= (type Heap@@31) (MapType0Type RefType)) (= (type Mask@@12) (MapType1Type RefType realType))) (and (state Heap@@31 Mask@@12) (< AssumeFunctionsAbove 4))) (= (fac2 Heap@@31 i@@7) (ite (<= i@@7 1) 1 (* i@@7 (|fac2'| Heap@@31 (- i@@7 1))))))
 :qid |stdinbpl.1048:15|
 :skolemid |70|
 :pattern ( (state Heap@@31 Mask@@12) (fac2 Heap@@31 i@@7))
)))
(assert (forall ((Heap@@32 T@U) (Mask@@13 T@U) (i@@8 Int) ) (!  (=> (and (and (= (type Heap@@32) (MapType0Type RefType)) (= (type Mask@@13) (MapType1Type RefType realType))) (and (state Heap@@32 Mask@@13) (< AssumeFunctionsAbove 9))) (= (fac3 Heap@@32 i@@8) (ite (<= i@@8 1) 1 (* i@@8 (|fac3'| Heap@@32 (- i@@8 1))))))
 :qid |stdinbpl.1111:15|
 :skolemid |74|
 :pattern ( (state Heap@@32 Mask@@13) (fac3 Heap@@32 i@@8))
)))
(assert (forall ((Heap@@33 T@U) (Mask@@14 T@U) (i@@9 Int) ) (!  (=> (and (and (= (type Heap@@33) (MapType0Type RefType)) (= (type Mask@@14) (MapType1Type RefType realType))) (and (state Heap@@33 Mask@@14) (< AssumeFunctionsAbove 10))) (= (fac1 Heap@@33 i@@9) (ite (<= i@@9 1) 1 (* i@@9 (|fac1'| Heap@@33 (- i@@9 1))))))
 :qid |stdinbpl.985:15|
 :skolemid |66|
 :pattern ( (state Heap@@33 Mask@@14) (fac1 Heap@@33 i@@9))
)))
(assert (forall ((Heap@@34 T@U) (ExhaleHeap@@2 T@U) (Mask@@15 T@U) (o_1@@0 T@U) (f_2 T@U) ) (! (let ((B@@1 (FieldTypeInv1 (type f_2))))
(let ((A@@1 (FieldTypeInv0 (type f_2))))
 (=> (and (and (and (and (and (and (= (type Heap@@34) (MapType0Type RefType)) (= (type ExhaleHeap@@2) (MapType0Type RefType))) (= (type Mask@@15) (MapType1Type RefType realType))) (= (type o_1@@0) RefType)) (= (type f_2) (FieldType A@@1 B@@1))) (IdenticalOnKnownLocations Heap@@34 ExhaleHeap@@2 Mask@@15)) (HasDirectPerm Mask@@15 o_1@@0 f_2)) (= (MapType0Select Heap@@34 o_1@@0 f_2) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2)))))
 :qid |stdinbpl.42:22|
 :skolemid |1|
 :pattern ( (IdenticalOnKnownLocations Heap@@34 ExhaleHeap@@2 Mask@@15) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2))
)))
(assert  (and (= (type dummyHeap) (MapType0Type RefType)) (= (type ZeroMask) (MapType1Type RefType realType))))
(assert (state dummyHeap ZeroMask))
(assert (forall ((p T@U) (v_1 T@U) (w T@U) ) (! (let ((A@@2 (FieldTypeInv0 (type p))))
 (=> (and (and (= (type p) (FieldType A@@2 FrameTypeType)) (= (type v_1) FrameTypeType)) (= (type w) FrameTypeType)) (not (InsidePredicate p v_1 p w))))
 :qid |stdinbpl.185:19|
 :skolemid |21|
 :pattern ( (InsidePredicate p v_1 p w))
)))
(assert (forall ((Heap@@35 T@U) (Mask@@16 T@U) (r_1@@14 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@35) (MapType0Type RefType)) (= (type Mask@@16) (MapType1Type RefType realType))) (= (type r_1@@14) RefType)) (and (state Heap@@35 Mask@@16) (or (< AssumeFunctionsAbove 7) (|isGreaterOne33#trigger| (FrameFragment (MapType0Select Heap@@35 r_1@@14 f_7)) r_1@@14)))) (> (U_2_int (MapType0Select Heap@@35 r_1@@14 f_7)) 60)) (|isGreaterOne33'| Heap@@35 r_1@@14))
 :qid |stdinbpl.709:15|
 :skolemid |53|
 :pattern ( (state Heap@@35 Mask@@16) (|isGreaterOne33'| Heap@@35 r_1@@14))
)))
(assert  (not (IsPredicateField f_7)))
(assert  (not (IsWandField f_7)))
(assert (forall ((Heap@@36 T@U) (ExhaleHeap@@3 T@U) (Mask@@17 T@U) ) (!  (=> (and (and (and (= (type Heap@@36) (MapType0Type RefType)) (= (type ExhaleHeap@@3) (MapType0Type RefType))) (= (type Mask@@17) (MapType1Type RefType realType))) (IdenticalOnKnownLocations Heap@@36 ExhaleHeap@@3 Mask@@17)) (succHeap Heap@@36 ExhaleHeap@@3))
 :qid |stdinbpl.83:15|
 :skolemid |10|
 :pattern ( (IdenticalOnKnownLocations Heap@@36 ExhaleHeap@@3 Mask@@17))
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
(assert (forall ((Heap@@37 T@U) (Mask@@18 T@U) (r_1@@15 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@37) (MapType0Type RefType)) (= (type Mask@@18) (MapType1Type RefType realType))) (= (type r_1@@15) RefType)) (and (state Heap@@37 Mask@@18) (< AssumeFunctionsAbove 1))) (> (U_2_int (MapType0Select Heap@@37 r_1@@15 f_7)) (- 0 38))) (= (isGreaterOne34 Heap@@37 r_1@@15) (isGreaterOne Heap@@37 (U_2_int (MapType0Select Heap@@37 r_1@@15 f_7)))))
 :qid |stdinbpl.789:15|
 :skolemid |56|
 :pattern ( (state Heap@@37 Mask@@18) (isGreaterOne34 Heap@@37 r_1@@15))
)))
(assert (forall ((Heap@@38 T@U) (Mask@@19 T@U) (r_1@@16 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@38) (MapType0Type RefType)) (= (type Mask@@19) (MapType1Type RefType realType))) (= (type r_1@@16) RefType)) (and (state Heap@@38 Mask@@19) (< AssumeFunctionsAbove 2))) (> (U_2_int (MapType0Select Heap@@38 r_1@@16 f_7)) (- 0 38))) (= (isGreaterOne2 Heap@@38 r_1@@16) (|isGreaterOne'| Heap@@38 (U_2_int (MapType0Select Heap@@38 r_1@@16 f_7)))))
 :qid |stdinbpl.284:15|
 :skolemid |29|
 :pattern ( (state Heap@@38 Mask@@19) (isGreaterOne2 Heap@@38 r_1@@16))
)))
(assert (forall ((Heap@@39 T@U) (Mask@@20 T@U) (r_1@@17 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@39) (MapType0Type RefType)) (= (type Mask@@20) (MapType1Type RefType realType))) (= (type r_1@@17) RefType)) (and (state Heap@@39 Mask@@20) (< AssumeFunctionsAbove 3))) (> (U_2_int (MapType0Select Heap@@39 r_1@@17 f_7)) (- 0 38))) (= (isGreaterOne35 Heap@@39 r_1@@17) (|isGreaterOne'| Heap@@39 (U_2_int (MapType0Select Heap@@39 r_1@@17 f_7)))))
 :qid |stdinbpl.887:15|
 :skolemid |61|
 :pattern ( (state Heap@@39 Mask@@20) (isGreaterOne35 Heap@@39 r_1@@17))
)))
(assert (forall ((Heap@@40 T@U) (Mask@@21 T@U) (r_1@@18 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@40) (MapType0Type RefType)) (= (type Mask@@21) (MapType1Type RefType realType))) (= (type r_1@@18) RefType)) (and (state Heap@@40 Mask@@21) (< AssumeFunctionsAbove 5))) (> (U_2_int (MapType0Select Heap@@40 r_1@@18 f_7)) (- 0 38))) (= (isGreaterOne22 Heap@@40 r_1@@18) (|isGreaterOne'| Heap@@40 (U_2_int (MapType0Select Heap@@40 r_1@@18 f_7)))))
 :qid |stdinbpl.382:15|
 :skolemid |34|
 :pattern ( (state Heap@@40 Mask@@21) (isGreaterOne22 Heap@@40 r_1@@18))
)))
(assert (forall ((Heap@@41 T@U) (Mask@@22 T@U) (r_1@@19 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@41) (MapType0Type RefType)) (= (type Mask@@22) (MapType1Type RefType realType))) (= (type r_1@@19) RefType)) (and (state Heap@@41 Mask@@22) (< AssumeFunctionsAbove 8))) (> (U_2_int (MapType0Select Heap@@41 r_1@@19 f_7)) (- 0 38))) (= (isGreaterOne3 Heap@@41 r_1@@19) (isGreaterOne Heap@@41 (U_2_int (MapType0Select Heap@@41 r_1@@19 f_7)))))
 :qid |stdinbpl.490:15|
 :skolemid |40|
 :pattern ( (state Heap@@41 Mask@@22) (isGreaterOne3 Heap@@41 r_1@@19))
)))
(assert (forall ((Heap@@42 T@U) (Mask@@23 T@U) (r_1@@20 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@42) (MapType0Type RefType)) (= (type Mask@@23) (MapType1Type RefType realType))) (= (type r_1@@20) RefType)) (and (state Heap@@42 Mask@@23) (< AssumeFunctionsAbove 11))) (> (U_2_int (MapType0Select Heap@@42 r_1@@20 f_7)) (- 0 38))) (= (isGreaterOne32 Heap@@42 r_1@@20) (isGreaterOne Heap@@42 (U_2_int (MapType0Select Heap@@42 r_1@@20 f_7)))))
 :qid |stdinbpl.588:15|
 :skolemid |45|
 :pattern ( (state Heap@@42 Mask@@23) (isGreaterOne32 Heap@@42 r_1@@20))
)))
(assert  (and (forall ((arg0@@28 Real) (arg1@@9 T@U) ) (! (= (type (ConditionalFrame arg0@@28 arg1@@9)) FrameTypeType)
 :qid |funType:ConditionalFrame|
 :pattern ( (ConditionalFrame arg0@@28 arg1@@9))
)) (= (type EmptyFrame) FrameTypeType)))
(assert (forall ((p@@0 Real) (f_6 T@U) ) (!  (=> (= (type f_6) FrameTypeType) (= (ConditionalFrame p@@0 f_6) (ite (> p@@0 0.0) f_6 EmptyFrame)))
 :qid |stdinbpl.173:15|
 :skolemid |19|
 :pattern ( (ConditionalFrame p@@0 f_6))
)))
(assert (forall ((Mask@@24 T@U) (o_2@@0 T@U) (f_4@@0 T@U) ) (! (let ((B@@3 (FieldTypeInv1 (type f_4@@0))))
(let ((A@@4 (FieldTypeInv0 (type f_4@@0))))
 (=> (and (and (= (type Mask@@24) (MapType1Type RefType realType)) (= (type o_2@@0) RefType)) (= (type f_4@@0) (FieldType A@@4 B@@3))) (= (HasDirectPerm Mask@@24 o_2@@0 f_4@@0) (> (U_2_real (MapType1Select Mask@@24 o_2@@0 f_4@@0)) NoPerm)))))
 :qid |stdinbpl.133:22|
 :skolemid |17|
 :pattern ( (HasDirectPerm Mask@@24 o_2@@0 f_4@@0))
)))
(assert (forall ((o_2@@1 T@U) (f_4@@1 T@U) ) (! (let ((B@@4 (FieldTypeInv1 (type f_4@@1))))
(let ((A@@5 (FieldTypeInv0 (type f_4@@1))))
 (=> (and (= (type o_2@@1) RefType) (= (type f_4@@1) (FieldType A@@5 B@@4))) (= (U_2_real (MapType1Select ZeroMask o_2@@1 f_4@@1)) NoPerm))))
 :qid |stdinbpl.106:22|
 :skolemid |13|
 :pattern ( (MapType1Select ZeroMask o_2@@1 f_4@@1))
)))
(assert (forall ((Heap@@43 T@U) (Mask@@25 T@U) (i@@10 Int) ) (!  (=> (and (and (= (type Heap@@43) (MapType0Type RefType)) (= (type Mask@@25) (MapType1Type RefType realType))) (state Heap@@43 Mask@@25)) (= (|isGreaterOne'| Heap@@43 i@@10) (|isGreaterOne#frame| EmptyFrame i@@10)))
 :qid |stdinbpl.222:15|
 :skolemid |25|
 :pattern ( (state Heap@@43 Mask@@25) (|isGreaterOne'| Heap@@43 i@@10))
)))
(assert (forall ((Heap@@44 T@U) (Mask@@26 T@U) (i@@11 Int) ) (!  (=> (and (and (and (and (= (type Heap@@44) (MapType0Type RefType)) (= (type Mask@@26) (MapType1Type RefType realType))) (and (state Heap@@44 Mask@@26) (or (< AssumeFunctionsAbove 12) (|isGreaterOne#trigger| EmptyFrame i@@11)))) (> i@@11 (- 0 60))) (> i@@11 60)) (|isGreaterOne'| Heap@@44 i@@11))
 :qid |stdinbpl.228:15|
 :skolemid |26|
 :pattern ( (state Heap@@44 Mask@@26) (|isGreaterOne'| Heap@@44 i@@11))
)))
(assert (forall ((Heap@@45 T@U) (Mask@@27 T@U) (r_1@@21 T@U) ) (!  (=> (and (and (and (= (type Heap@@45) (MapType0Type RefType)) (= (type Mask@@27) (MapType1Type RefType realType))) (= (type r_1@@21) RefType)) (state Heap@@45 Mask@@27)) (= (|isGreaterOne2'| Heap@@45 r_1@@21) (|isGreaterOne2#frame| (FrameFragment (MapType0Select Heap@@45 r_1@@21 f_7)) r_1@@21)))
 :qid |stdinbpl.291:15|
 :skolemid |30|
 :pattern ( (state Heap@@45 Mask@@27) (|isGreaterOne2'| Heap@@45 r_1@@21))
)))
(assert (forall ((Heap@@46 T@U) (Mask@@28 T@U) (r_1@@22 T@U) ) (!  (=> (and (and (and (= (type Heap@@46) (MapType0Type RefType)) (= (type Mask@@28) (MapType1Type RefType realType))) (= (type r_1@@22) RefType)) (state Heap@@46 Mask@@28)) (= (|isGreaterOne22'| Heap@@46 r_1@@22) (|isGreaterOne22#frame| (FrameFragment (MapType0Select Heap@@46 r_1@@22 f_7)) r_1@@22)))
 :qid |stdinbpl.389:15|
 :skolemid |35|
 :pattern ( (state Heap@@46 Mask@@28) (|isGreaterOne22'| Heap@@46 r_1@@22))
)))
(assert (forall ((Heap@@47 T@U) (Mask@@29 T@U) (r_1@@23 T@U) ) (!  (=> (and (and (and (= (type Heap@@47) (MapType0Type RefType)) (= (type Mask@@29) (MapType1Type RefType realType))) (= (type r_1@@23) RefType)) (state Heap@@47 Mask@@29)) (= (|isGreaterOne3'| Heap@@47 r_1@@23) (|isGreaterOne3#frame| (FrameFragment (MapType0Select Heap@@47 r_1@@23 f_7)) r_1@@23)))
 :qid |stdinbpl.497:15|
 :skolemid |41|
 :pattern ( (state Heap@@47 Mask@@29) (|isGreaterOne3'| Heap@@47 r_1@@23))
)))
(assert (forall ((Heap@@48 T@U) (Mask@@30 T@U) (r_1@@24 T@U) ) (!  (=> (and (and (and (= (type Heap@@48) (MapType0Type RefType)) (= (type Mask@@30) (MapType1Type RefType realType))) (= (type r_1@@24) RefType)) (state Heap@@48 Mask@@30)) (= (|isGreaterOne32'| Heap@@48 r_1@@24) (|isGreaterOne32#frame| (FrameFragment (MapType0Select Heap@@48 r_1@@24 f_7)) r_1@@24)))
 :qid |stdinbpl.595:15|
 :skolemid |46|
 :pattern ( (state Heap@@48 Mask@@30) (|isGreaterOne32'| Heap@@48 r_1@@24))
)))
(assert (forall ((Heap@@49 T@U) (Mask@@31 T@U) (r_1@@25 T@U) ) (!  (=> (and (and (and (= (type Heap@@49) (MapType0Type RefType)) (= (type Mask@@31) (MapType1Type RefType realType))) (= (type r_1@@25) RefType)) (state Heap@@49 Mask@@31)) (= (|isGreaterOne33'| Heap@@49 r_1@@25) (|isGreaterOne33#frame| (FrameFragment (MapType0Select Heap@@49 r_1@@25 f_7)) r_1@@25)))
 :qid |stdinbpl.703:15|
 :skolemid |52|
 :pattern ( (state Heap@@49 Mask@@31) (|isGreaterOne33'| Heap@@49 r_1@@25))
)))
(assert (forall ((Heap@@50 T@U) (Mask@@32 T@U) (r_1@@26 T@U) ) (!  (=> (and (and (and (= (type Heap@@50) (MapType0Type RefType)) (= (type Mask@@32) (MapType1Type RefType realType))) (= (type r_1@@26) RefType)) (state Heap@@50 Mask@@32)) (= (|isGreaterOne34'| Heap@@50 r_1@@26) (|isGreaterOne34#frame| (FrameFragment (MapType0Select Heap@@50 r_1@@26 f_7)) r_1@@26)))
 :qid |stdinbpl.796:15|
 :skolemid |57|
 :pattern ( (state Heap@@50 Mask@@32) (|isGreaterOne34'| Heap@@50 r_1@@26))
)))
(assert (forall ((Heap@@51 T@U) (Mask@@33 T@U) (r_1@@27 T@U) ) (!  (=> (and (and (and (= (type Heap@@51) (MapType0Type RefType)) (= (type Mask@@33) (MapType1Type RefType realType))) (= (type r_1@@27) RefType)) (state Heap@@51 Mask@@33)) (= (|isGreaterOne35'| Heap@@51 r_1@@27) (|isGreaterOne35#frame| (FrameFragment (MapType0Select Heap@@51 r_1@@27 f_7)) r_1@@27)))
 :qid |stdinbpl.894:15|
 :skolemid |62|
 :pattern ( (state Heap@@51 Mask@@33) (|isGreaterOne35'| Heap@@51 r_1@@27))
)))
(assert (forall ((Heap@@52 T@U) (i@@12 Int) ) (!  (=> (= (type Heap@@52) (MapType0Type RefType)) (and (= (isGreaterOne Heap@@52 i@@12) (|isGreaterOne'| Heap@@52 i@@12)) (dummyFunction (bool_2_U (|isGreaterOne#triggerStateless| i@@12)))))
 :qid |stdinbpl.205:15|
 :skolemid |22|
 :pattern ( (isGreaterOne Heap@@52 i@@12))
)))
(assert (forall ((Heap@@53 T@U) (r_1@@28 T@U) ) (!  (=> (and (= (type Heap@@53) (MapType0Type RefType)) (= (type r_1@@28) RefType)) (and (= (isGreaterOne2 Heap@@53 r_1@@28) (|isGreaterOne2'| Heap@@53 r_1@@28)) (dummyFunction (bool_2_U (|isGreaterOne2#triggerStateless| r_1@@28)))))
 :qid |stdinbpl.274:15|
 :skolemid |27|
 :pattern ( (isGreaterOne2 Heap@@53 r_1@@28))
)))
(assert (forall ((Heap@@54 T@U) (r_1@@29 T@U) ) (!  (=> (and (= (type Heap@@54) (MapType0Type RefType)) (= (type r_1@@29) RefType)) (and (= (isGreaterOne22 Heap@@54 r_1@@29) (|isGreaterOne22'| Heap@@54 r_1@@29)) (dummyFunction (bool_2_U (|isGreaterOne22#triggerStateless| r_1@@29)))))
 :qid |stdinbpl.372:15|
 :skolemid |32|
 :pattern ( (isGreaterOne22 Heap@@54 r_1@@29))
)))
(assert (forall ((Heap@@55 T@U) (r_1@@30 T@U) ) (!  (=> (and (= (type Heap@@55) (MapType0Type RefType)) (= (type r_1@@30) RefType)) (and (= (isGreaterOne3 Heap@@55 r_1@@30) (|isGreaterOne3'| Heap@@55 r_1@@30)) (dummyFunction (bool_2_U (|isGreaterOne3#triggerStateless| r_1@@30)))))
 :qid |stdinbpl.480:15|
 :skolemid |38|
 :pattern ( (isGreaterOne3 Heap@@55 r_1@@30))
)))
(assert (forall ((Heap@@56 T@U) (r_1@@31 T@U) ) (!  (=> (and (= (type Heap@@56) (MapType0Type RefType)) (= (type r_1@@31) RefType)) (and (= (isGreaterOne32 Heap@@56 r_1@@31) (|isGreaterOne32'| Heap@@56 r_1@@31)) (dummyFunction (bool_2_U (|isGreaterOne32#triggerStateless| r_1@@31)))))
 :qid |stdinbpl.578:15|
 :skolemid |43|
 :pattern ( (isGreaterOne32 Heap@@56 r_1@@31))
)))
(assert (forall ((Heap@@57 T@U) (r_1@@32 T@U) ) (!  (=> (and (= (type Heap@@57) (MapType0Type RefType)) (= (type r_1@@32) RefType)) (and (= (isGreaterOne33 Heap@@57 r_1@@32) (|isGreaterOne33'| Heap@@57 r_1@@32)) (dummyFunction (bool_2_U (|isGreaterOne33#triggerStateless| r_1@@32)))))
 :qid |stdinbpl.686:15|
 :skolemid |49|
 :pattern ( (isGreaterOne33 Heap@@57 r_1@@32))
)))
(assert (forall ((Heap@@58 T@U) (r_1@@33 T@U) ) (!  (=> (and (= (type Heap@@58) (MapType0Type RefType)) (= (type r_1@@33) RefType)) (and (= (isGreaterOne34 Heap@@58 r_1@@33) (|isGreaterOne34'| Heap@@58 r_1@@33)) (dummyFunction (bool_2_U (|isGreaterOne34#triggerStateless| r_1@@33)))))
 :qid |stdinbpl.779:15|
 :skolemid |54|
 :pattern ( (isGreaterOne34 Heap@@58 r_1@@33))
)))
(assert (forall ((Heap@@59 T@U) (r_1@@34 T@U) ) (!  (=> (and (= (type Heap@@59) (MapType0Type RefType)) (= (type r_1@@34) RefType)) (and (= (isGreaterOne35 Heap@@59 r_1@@34) (|isGreaterOne35'| Heap@@59 r_1@@34)) (dummyFunction (bool_2_U (|isGreaterOne35#triggerStateless| r_1@@34)))))
 :qid |stdinbpl.877:15|
 :skolemid |59|
 :pattern ( (isGreaterOne35 Heap@@59 r_1@@34))
)))
(assert (forall ((Heap@@60 T@U) (ExhaleHeap@@4 T@U) (Mask@@34 T@U) (pm_f@@1 T@U) ) (! (let ((C@@1 (FieldTypeInv0 (type pm_f@@1))))
 (=> (and (and (and (and (and (= (type Heap@@60) (MapType0Type RefType)) (= (type ExhaleHeap@@4) (MapType0Type RefType))) (= (type Mask@@34) (MapType1Type RefType realType))) (= (type pm_f@@1) (FieldType C@@1 FrameTypeType))) (IdenticalOnKnownLocations Heap@@60 ExhaleHeap@@4 Mask@@34)) (and (HasDirectPerm Mask@@34 null pm_f@@1) (IsPredicateField pm_f@@1))) (forall ((o2 T@U) (f_2@@0 T@U) ) (! (let ((B@@5 (FieldTypeInv1 (type f_2@@0))))
(let ((A@@6 (FieldTypeInv0 (type f_2@@0))))
 (=> (and (and (= (type o2) RefType) (= (type f_2@@0) (FieldType A@@6 B@@5))) (U_2_bool (MapType1Select (MapType0Select Heap@@60 null (PredicateMaskField pm_f@@1)) o2 f_2@@0))) (= (MapType0Select Heap@@60 o2 f_2@@0) (MapType0Select ExhaleHeap@@4 o2 f_2@@0)))))
 :qid |stdinbpl.54:134|
 :skolemid |3|
 :pattern ( (MapType0Select ExhaleHeap@@4 o2 f_2@@0))
))))
 :qid |stdinbpl.52:19|
 :skolemid |4|
 :pattern ( (IdenticalOnKnownLocations Heap@@60 ExhaleHeap@@4 Mask@@34) (IsPredicateField pm_f@@1))
)))
(assert (forall ((Heap@@61 T@U) (ExhaleHeap@@5 T@U) (Mask@@35 T@U) (pm_f@@2 T@U) ) (! (let ((C@@2 (FieldTypeInv0 (type pm_f@@2))))
 (=> (and (and (and (and (and (= (type Heap@@61) (MapType0Type RefType)) (= (type ExhaleHeap@@5) (MapType0Type RefType))) (= (type Mask@@35) (MapType1Type RefType realType))) (= (type pm_f@@2) (FieldType C@@2 FrameTypeType))) (IdenticalOnKnownLocations Heap@@61 ExhaleHeap@@5 Mask@@35)) (and (HasDirectPerm Mask@@35 null pm_f@@2) (IsWandField pm_f@@2))) (forall ((o2@@0 T@U) (f_2@@1 T@U) ) (! (let ((B@@6 (FieldTypeInv1 (type f_2@@1))))
(let ((A@@7 (FieldTypeInv0 (type f_2@@1))))
 (=> (and (and (= (type o2@@0) RefType) (= (type f_2@@1) (FieldType A@@7 B@@6))) (U_2_bool (MapType1Select (MapType0Select Heap@@61 null (WandMaskField pm_f@@2)) o2@@0 f_2@@1))) (= (MapType0Select Heap@@61 o2@@0 f_2@@1) (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1)))))
 :qid |stdinbpl.67:129|
 :skolemid |6|
 :pattern ( (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1))
))))
 :qid |stdinbpl.65:19|
 :skolemid |7|
 :pattern ( (IdenticalOnKnownLocations Heap@@61 ExhaleHeap@@5 Mask@@35) (IsWandField pm_f@@2))
)))
(assert (forall ((x@@16 T@U) ) (!  (=> (= (type x@@16) RefType) (= (getPredWandId (P x@@16)) 0))
 :qid |stdinbpl.1348:15|
 :skolemid |86|
 :pattern ( (P x@@16))
)))
(assert (forall ((Mask@@36 T@U) (o_2@@2 T@U) (f_4@@2 T@U) ) (! (let ((B@@7 (FieldTypeInv1 (type f_4@@2))))
(let ((A@@8 (FieldTypeInv0 (type f_4@@2))))
 (=> (and (and (and (= (type Mask@@36) (MapType1Type RefType realType)) (= (type o_2@@2) RefType)) (= (type f_4@@2) (FieldType A@@8 B@@7))) (GoodMask Mask@@36)) (and (>= (U_2_real (MapType1Select Mask@@36 o_2@@2 f_4@@2)) NoPerm) (=> (and (and (GoodMask Mask@@36) (not (IsPredicateField f_4@@2))) (not (IsWandField f_4@@2))) (<= (U_2_real (MapType1Select Mask@@36 o_2@@2 f_4@@2)) FullPerm))))))
 :qid |stdinbpl.128:22|
 :skolemid |16|
 :pattern ( (GoodMask Mask@@36) (MapType1Select Mask@@36 o_2@@2 f_4@@2))
)))
(assert (forall ((Heap@@62 T@U) (Mask@@37 T@U) (i@@13 Int) ) (!  (=> (and (and (= (type Heap@@62) (MapType0Type RefType)) (= (type Mask@@37) (MapType1Type RefType realType))) (state Heap@@62 Mask@@37)) (= (|fac1'| Heap@@62 i@@13) (|fac1#frame| EmptyFrame i@@13)))
 :qid |stdinbpl.992:15|
 :skolemid |67|
 :pattern ( (state Heap@@62 Mask@@37) (|fac1'| Heap@@62 i@@13))
)))
(assert (forall ((Heap@@63 T@U) (Mask@@38 T@U) (i@@14 Int) ) (!  (=> (and (and (= (type Heap@@63) (MapType0Type RefType)) (= (type Mask@@38) (MapType1Type RefType realType))) (state Heap@@63 Mask@@38)) (= (|fac2'| Heap@@63 i@@14) (|fac2#frame| EmptyFrame i@@14)))
 :qid |stdinbpl.1055:15|
 :skolemid |71|
 :pattern ( (state Heap@@63 Mask@@38) (|fac2'| Heap@@63 i@@14))
)))
(assert (forall ((Heap@@64 T@U) (Mask@@39 T@U) (i@@15 Int) ) (!  (=> (and (and (= (type Heap@@64) (MapType0Type RefType)) (= (type Mask@@39) (MapType1Type RefType realType))) (state Heap@@64 Mask@@39)) (= (|fac3'| Heap@@64 i@@15) (|fac3#frame| EmptyFrame i@@15)))
 :qid |stdinbpl.1118:15|
 :skolemid |75|
 :pattern ( (state Heap@@64 Mask@@39) (|fac3'| Heap@@64 i@@15))
)))
(assert (forall ((Heap@@65 T@U) (Mask@@40 T@U) (x@@17 T@U) ) (!  (=> (and (and (and (= (type Heap@@65) (MapType0Type RefType)) (= (type Mask@@40) (MapType1Type RefType realType))) (= (type x@@17) RefType)) (state Heap@@65 Mask@@40)) (= (|funP'| Heap@@65 x@@17) (|funP#frame| (MapType0Select Heap@@65 null (P x@@17)) x@@17)))
 :qid |stdinbpl.1181:15|
 :skolemid |79|
 :pattern ( (state Heap@@65 Mask@@40) (|funP'| Heap@@65 x@@17))
)))
(assert (forall ((Heap@@66 T@U) (Mask@@41 T@U) (x@@18 T@U) ) (!  (=> (and (and (and (= (type Heap@@66) (MapType0Type RefType)) (= (type Mask@@41) (MapType1Type RefType realType))) (= (type x@@18) RefType)) (state Heap@@66 Mask@@41)) (= (|funP2'| Heap@@66 x@@18) (|funP2#frame| (MapType0Select Heap@@66 null (P x@@18)) x@@18)))
 :qid |stdinbpl.1269:15|
 :skolemid |83|
 :pattern ( (state Heap@@66 Mask@@41) (|funP2'| Heap@@66 x@@18))
)))
(assert (forall ((o T@U) (f T@U) (Heap@@67 T@U) ) (!  (=> (and (and (and (= (type o) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap@@67) (MapType0Type RefType))) (U_2_bool (MapType0Select Heap@@67 o $allocated))) (U_2_bool (MapType0Select Heap@@67 (MapType0Select Heap@@67 o f) $allocated)))
 :qid |stdinbpl.31:15|
 :skolemid |0|
 :pattern ( (MapType0Select Heap@@67 o f))
)))
(assert (forall ((x@@19 T@U) ) (!  (=> (= (type x@@19) RefType) (= (PredicateMaskField (P x@@19)) (|P#sm| x@@19)))
 :qid |stdinbpl.1340:15|
 :skolemid |84|
 :pattern ( (PredicateMaskField (P x@@19)))
)))
(assert (forall ((Heap@@68 T@U) (Mask@@42 T@U) (r_1@@35 T@U) ) (!  (=> (and (and (and (= (type Heap@@68) (MapType0Type RefType)) (= (type Mask@@42) (MapType1Type RefType realType))) (= (type r_1@@35) RefType)) (and (state Heap@@68 Mask@@42) (< AssumeFunctionsAbove 7))) (= (isGreaterOne33 Heap@@68 r_1@@35) (isGreaterOne Heap@@68 (U_2_int (MapType0Select Heap@@68 r_1@@35 f_7)))))
 :qid |stdinbpl.696:15|
 :skolemid |51|
 :pattern ( (state Heap@@68 Mask@@42) (isGreaterOne33 Heap@@68 r_1@@35))
)))
(assert (forall ((Heap@@69 T@U) (o@@0 T@U) (f_3 T@U) (v T@U) ) (! (let ((B@@8 (type v)))
(let ((A@@9 (FieldTypeInv0 (type f_3))))
 (=> (and (and (= (type Heap@@69) (MapType0Type RefType)) (= (type o@@0) RefType)) (= (type f_3) (FieldType A@@9 B@@8))) (succHeap Heap@@69 (MapType0Store Heap@@69 o@@0 f_3 v)))))
 :qid |stdinbpl.78:22|
 :skolemid |9|
 :pattern ( (MapType0Store Heap@@69 o@@0 f_3 v))
)))
(assert (forall ((Heap@@70 T@U) (Mask@@43 T@U) (x@@20 T@U) ) (!  (=> (and (and (and (= (type Heap@@70) (MapType0Type RefType)) (= (type Mask@@43) (MapType1Type RefType realType))) (= (type x@@20) RefType)) (and (state Heap@@70 Mask@@43) (< AssumeFunctionsAbove 0))) (= (funP2 Heap@@70 x@@20) (U_2_int (MapType0Select Heap@@70 x@@20 f_7))))
 :qid |stdinbpl.1262:15|
 :skolemid |82|
 :pattern ( (state Heap@@70 Mask@@43) (funP2 Heap@@70 x@@20))
 :pattern ( (state Heap@@70 Mask@@43) (|funP2#triggerStateless| x@@20) (|P#trigger| Heap@@70 (P x@@20)))
)))
(assert (forall ((Heap@@71 T@U) (Mask@@44 T@U) (x@@21 T@U) ) (!  (=> (and (and (and (= (type Heap@@71) (MapType0Type RefType)) (= (type Mask@@44) (MapType1Type RefType realType))) (= (type x@@21) RefType)) (and (state Heap@@71 Mask@@44) (< AssumeFunctionsAbove 6))) (= (funP Heap@@71 x@@21) (U_2_int (MapType0Select Heap@@71 x@@21 f_7))))
 :qid |stdinbpl.1174:15|
 :skolemid |78|
 :pattern ( (state Heap@@71 Mask@@44) (funP Heap@@71 x@@21))
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
 :qid |stdinbpl.180:25|
 :skolemid |20|
 :pattern ( (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
; Invalid

(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun tmp@0 () Int)
(declare-fun Heap@@72 () T@U)
(assert (= (type Heap@@72) (MapType0Type RefType)))
(set-info :boogie-vc-id mFac3_4)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 10) (let ((anon9_Else_correct  (=> (= (ControlFlow 0 5) (- 0 4)) (= tmp@0 (* 6 (|fac3'| Heap@@72 1))))))
(let ((anon9_Then_correct true))
(let ((anon8_Else_correct  (and (=> (= (ControlFlow 0 6) (- 0 7)) (= tmp@0 (* 3 (|fac3'| Heap@@72 2)))) (=> (= tmp@0 (* 3 (|fac3'| Heap@@72 2))) (=> (state Heap@@72 ZeroMask) (and (=> (= (ControlFlow 0 6) 3) anon9_Then_correct) (=> (= (ControlFlow 0 6) 5) anon9_Else_correct)))))))
(let ((anon8_Then_correct true))
(let ((anon7_Else_correct  (=> (and (= tmp@0 (fac3 Heap@@72 3)) (state Heap@@72 ZeroMask)) (and (=> (= (ControlFlow 0 8) 2) anon8_Then_correct) (=> (= (ControlFlow 0 8) 6) anon8_Else_correct)))))
(let ((anon7_Then_correct true))
(let ((anon0_correct  (=> (and (state Heap@@72 ZeroMask) (= AssumeFunctionsAbove (- 0 1))) (and (=> (= (ControlFlow 0 9) 1) anon7_Then_correct) (=> (= (ControlFlow 0 9) 8) anon7_Else_correct)))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 10) 9) anon0_correct)))
PreconditionGeneratedEntry_correct)))))))))
))
(check-sat)
(get-info :reason-unknown)
(assert (not (= (ControlFlow 0 5) (- 4))))
(check-sat)
(pop 1)
; Invalid
(get-info :rlimit)
