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
(declare-fun g () T@U)
(declare-fun h () T@U)
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
(declare-fun |fun1'| (T@U T@U T@U) Int)
(declare-fun dummyFunction (T@U) Bool)
(declare-fun |fun1#triggerStateless| (T@U T@U) Int)
(declare-fun |fun2'| (T@U T@U T@U) Int)
(declare-fun |fun2#triggerStateless| (T@U T@U) Int)
(declare-fun |fun4'| (T@U T@U T@U) Int)
(declare-fun |fun4#triggerStateless| (T@U T@U) Int)
(declare-fun |fun6'| (T@U Bool T@U) Int)
(declare-fun |fun6#triggerStateless| (Bool T@U) Int)
(declare-fun |er3'| (T@U T@U T@U) Int)
(declare-fun |er3#triggerStateless| (T@U T@U) Int)
(declare-fun IdenticalOnKnownLocations (T@U T@U T@U) Bool)
(declare-fun IsPredicateField (T@U) Bool)
(declare-fun null () T@U)
(declare-fun PredicateMaskField (T@U) T@U)
(declare-fun FrameTypeType () T@T)
(declare-fun HasDirectPerm (T@U T@U T@U) Bool)
(declare-fun IsWandField (T@U) Bool)
(declare-fun WandMaskField (T@U) T@U)
(declare-fun P (T@U) T@U)
(declare-fun PredicateType_PType () T@T)
(declare-fun Q (T@U) T@U)
(declare-fun PredicateType_QType () T@T)
(declare-fun |fun3'| (T@U T@U) Int)
(declare-fun |fun3#triggerStateless| (T@U) Int)
(declare-fun |fun5'| (T@U T@U) Int)
(declare-fun |fun5#triggerStateless| (T@U) Int)
(declare-fun |err1'| (T@U T@U) Int)
(declare-fun |err1#triggerStateless| (T@U) Int)
(declare-fun |err2'| (T@U T@U) Int)
(declare-fun |err2#triggerStateless| (T@U) Int)
(declare-fun |P#trigger| (T@U T@U) Bool)
(declare-fun |P#everUsed| (T@U) Bool)
(declare-fun |Q#trigger| (T@U T@U) Bool)
(declare-fun |Q#everUsed| (T@U) Bool)
(declare-fun fun3 (T@U T@U) Int)
(declare-fun fun5 (T@U T@U) Int)
(declare-fun err1 (T@U T@U) Int)
(declare-fun err2 (T@U T@U) Int)
(declare-fun AssumeFunctionsAbove () Int)
(declare-fun |P#sm| (T@U) T@U)
(declare-fun |Q#sm| (T@U) T@U)
(declare-fun dummyHeap () T@U)
(declare-fun ZeroMask () T@U)
(declare-fun InsidePredicate (T@U T@U T@U T@U) Bool)
(declare-fun |fun6#frame| (T@U Bool T@U) Int)
(declare-fun FrameFragment (T@U) T@U)
(declare-fun EmptyFrame () T@U)
(declare-fun fun1 (T@U T@U T@U) Int)
(declare-fun fun4 (T@U T@U T@U) Int)
(declare-fun fun2 (T@U T@U T@U) Int)
(declare-fun sumMask (T@U T@U T@U) Bool)
(declare-fun ConditionalFrame (Real T@U) T@U)
(declare-fun NoPerm () Real)
(declare-fun fun6 (T@U Bool T@U) Int)
(declare-fun er3 (T@U T@U T@U) Int)
(declare-fun |err1#frame| (T@U T@U) Int)
(declare-fun |fun1#frame| (T@U T@U T@U) Int)
(declare-fun CombineFrames (T@U T@U) T@U)
(declare-fun |fun2#frame| (T@U T@U T@U) Int)
(declare-fun |fun4#frame| (T@U T@U T@U) Int)
(declare-fun |er3#frame| (T@U T@U T@U) Int)
(declare-fun getPredWandId (T@U) Int)
(declare-fun FullPerm () Real)
(declare-fun |fun3#frame| (T@U T@U) Int)
(declare-fun |fun5#frame| (T@U T@U) Int)
(declare-fun |err2#frame| (T@U T@U) Int)
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
(assert  (and (and (and (and (and (and (and (and (forall ((arg0@@11 T@T) (arg1 T@T) ) (! (= (Ctor (FieldType arg0@@11 arg1)) 6)
 :qid |ctor:FieldType|
)) (forall ((arg0@@12 T@T) (arg1@@0 T@T) ) (! (= (FieldTypeInv0 (FieldType arg0@@12 arg1@@0)) arg0@@12)
 :qid |typeInv:FieldTypeInv0|
 :pattern ( (FieldType arg0@@12 arg1@@0))
))) (forall ((arg0@@13 T@T) (arg1@@1 T@T) ) (! (= (FieldTypeInv1 (FieldType arg0@@13 arg1@@1)) arg1@@1)
 :qid |typeInv:FieldTypeInv1|
 :pattern ( (FieldType arg0@@13 arg1@@1))
))) (= (Ctor NormalFieldType) 7)) (= (type $allocated) (FieldType NormalFieldType boolType))) (= (type f_7) (FieldType NormalFieldType intType))) (= (type g) (FieldType NormalFieldType intType))) (= (Ctor RefType) 8)) (= (type h) (FieldType NormalFieldType RefType))))
(assert (distinct $allocated f_7 g h)
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
(assert (forall ((Heap@@0 T@U) (x@@8 T@U) (y@@1 T@U) ) (!  (=> (and (and (= (type Heap@@0) (MapType0Type RefType)) (= (type x@@8) RefType)) (= (type y@@1) RefType)) (dummyFunction (int_2_U (|fun1#triggerStateless| x@@8 y@@1))))
 :qid |stdinbpl.211:15|
 :skolemid |23|
 :pattern ( (|fun1'| Heap@@0 x@@8 y@@1))
)))
(assert (forall ((Heap@@1 T@U) (x@@9 T@U) (y@@2 T@U) ) (!  (=> (and (and (= (type Heap@@1) (MapType0Type RefType)) (= (type x@@9) RefType)) (= (type y@@2) RefType)) (dummyFunction (int_2_U (|fun2#triggerStateless| x@@9 y@@2))))
 :qid |stdinbpl.284:15|
 :skolemid |27|
 :pattern ( (|fun2'| Heap@@1 x@@9 y@@2))
)))
(assert (forall ((Heap@@2 T@U) (x@@10 T@U) (y@@3 T@U) ) (!  (=> (and (and (= (type Heap@@2) (MapType0Type RefType)) (= (type x@@10) RefType)) (= (type y@@3) RefType)) (dummyFunction (int_2_U (|fun4#triggerStateless| x@@10 y@@3))))
 :qid |stdinbpl.444:15|
 :skolemid |35|
 :pattern ( (|fun4'| Heap@@2 x@@10 y@@3))
)))
(assert (forall ((Heap@@3 T@U) (b_2 Bool) (x@@11 T@U) ) (!  (=> (and (= (type Heap@@3) (MapType0Type RefType)) (= (type x@@11) RefType)) (dummyFunction (int_2_U (|fun6#triggerStateless| b_2 x@@11))))
 :qid |stdinbpl.545:15|
 :skolemid |39|
 :pattern ( (|fun6'| Heap@@3 b_2 x@@11))
)))
(assert (forall ((Heap@@4 T@U) (x@@12 T@U) (y@@4 T@U) ) (!  (=> (and (and (= (type Heap@@4) (MapType0Type RefType)) (= (type x@@12) RefType)) (= (type y@@4) RefType)) (dummyFunction (int_2_U (|er3#triggerStateless| x@@12 y@@4))))
 :qid |stdinbpl.869:15|
 :skolemid |55|
 :pattern ( (|er3'| Heap@@4 x@@12 y@@4))
)))
(assert  (and (and (= (Ctor FrameTypeType) 11) (= (type null) RefType)) (forall ((arg0@@23 T@U) ) (! (let ((A (FieldTypeInv0 (type arg0@@23))))
(= (type (PredicateMaskField arg0@@23)) (FieldType A (MapType1Type RefType boolType))))
 :qid |funType:PredicateMaskField|
 :pattern ( (PredicateMaskField arg0@@23))
))))
(assert (forall ((Heap@@5 T@U) (ExhaleHeap T@U) (Mask@@0 T@U) (pm_f T@U) ) (! (let ((C (FieldTypeInv0 (type pm_f))))
 (=> (and (and (and (and (and (= (type Heap@@5) (MapType0Type RefType)) (= (type ExhaleHeap) (MapType0Type RefType))) (= (type Mask@@0) (MapType1Type RefType realType))) (= (type pm_f) (FieldType C FrameTypeType))) (IdenticalOnKnownLocations Heap@@5 ExhaleHeap Mask@@0)) (and (HasDirectPerm Mask@@0 null pm_f) (IsPredicateField pm_f))) (= (MapType0Select Heap@@5 null (PredicateMaskField pm_f)) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))))
 :qid |stdinbpl.47:19|
 :skolemid |2|
 :pattern ( (IdenticalOnKnownLocations Heap@@5 ExhaleHeap Mask@@0) (IsPredicateField pm_f) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))
)))
(assert (forall ((arg0@@24 T@U) ) (! (let ((A@@0 (FieldTypeInv0 (type arg0@@24))))
(= (type (WandMaskField arg0@@24)) (FieldType A@@0 (MapType1Type RefType boolType))))
 :qid |funType:WandMaskField|
 :pattern ( (WandMaskField arg0@@24))
)))
(assert (forall ((Heap@@6 T@U) (ExhaleHeap@@0 T@U) (Mask@@1 T@U) (pm_f@@0 T@U) ) (! (let ((C@@0 (FieldTypeInv0 (type pm_f@@0))))
 (=> (and (and (and (and (and (= (type Heap@@6) (MapType0Type RefType)) (= (type ExhaleHeap@@0) (MapType0Type RefType))) (= (type Mask@@1) (MapType1Type RefType realType))) (= (type pm_f@@0) (FieldType C@@0 FrameTypeType))) (IdenticalOnKnownLocations Heap@@6 ExhaleHeap@@0 Mask@@1)) (and (HasDirectPerm Mask@@1 null pm_f@@0) (IsWandField pm_f@@0))) (= (MapType0Select Heap@@6 null (WandMaskField pm_f@@0)) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))))
 :qid |stdinbpl.60:19|
 :skolemid |5|
 :pattern ( (IdenticalOnKnownLocations Heap@@6 ExhaleHeap@@0 Mask@@1) (IsWandField pm_f@@0) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))
)))
(assert  (and (= (Ctor PredicateType_PType) 12) (forall ((arg0@@25 T@U) ) (! (= (type (P arg0@@25)) (FieldType PredicateType_PType FrameTypeType))
 :qid |funType:P|
 :pattern ( (P arg0@@25))
))))
(assert (forall ((x@@13 T@U) ) (!  (=> (= (type x@@13) RefType) (IsPredicateField (P x@@13)))
 :qid |stdinbpl.940:15|
 :skolemid |59|
 :pattern ( (P x@@13))
)))
(assert  (and (= (Ctor PredicateType_QType) 13) (forall ((arg0@@26 T@U) ) (! (= (type (Q arg0@@26)) (FieldType PredicateType_QType FrameTypeType))
 :qid |funType:Q|
 :pattern ( (Q arg0@@26))
))))
(assert (forall ((x@@14 T@U) ) (!  (=> (= (type x@@14) RefType) (IsPredicateField (Q x@@14)))
 :qid |stdinbpl.994:15|
 :skolemid |65|
 :pattern ( (Q x@@14))
)))
(assert (forall ((Heap@@7 T@U) (x@@15 T@U) ) (!  (=> (and (= (type Heap@@7) (MapType0Type RefType)) (= (type x@@15) RefType)) (dummyFunction (int_2_U (|fun3#triggerStateless| x@@15))))
 :qid |stdinbpl.356:15|
 :skolemid |31|
 :pattern ( (|fun3'| Heap@@7 x@@15))
)))
(assert (forall ((Heap@@8 T@U) (x@@16 T@U) ) (!  (=> (and (= (type Heap@@8) (MapType0Type RefType)) (= (type x@@16) RefType)) (dummyFunction (int_2_U (|fun5#triggerStateless| x@@16))))
 :qid |stdinbpl.613:15|
 :skolemid |43|
 :pattern ( (|fun5'| Heap@@8 x@@16))
)))
(assert (forall ((Heap@@9 T@U) (x@@17 T@U) ) (!  (=> (and (= (type Heap@@9) (MapType0Type RefType)) (= (type x@@17) RefType)) (dummyFunction (int_2_U (|err1#triggerStateless| x@@17))))
 :qid |stdinbpl.724:15|
 :skolemid |47|
 :pattern ( (|err1'| Heap@@9 x@@17))
)))
(assert (forall ((Heap@@10 T@U) (x@@18 T@U) ) (!  (=> (and (= (type Heap@@10) (MapType0Type RefType)) (= (type x@@18) RefType)) (dummyFunction (int_2_U (|err2#triggerStateless| x@@18))))
 :qid |stdinbpl.786:15|
 :skolemid |51|
 :pattern ( (|err2'| Heap@@10 x@@18))
)))
(assert (forall ((Heap@@11 T@U) (x@@19 T@U) ) (!  (=> (and (= (type Heap@@11) (MapType0Type RefType)) (= (type x@@19) RefType)) (|P#everUsed| (P x@@19)))
 :qid |stdinbpl.959:15|
 :skolemid |63|
 :pattern ( (|P#trigger| Heap@@11 (P x@@19)))
)))
(assert (forall ((Heap@@12 T@U) (x@@20 T@U) ) (!  (=> (and (= (type Heap@@12) (MapType0Type RefType)) (= (type x@@20) RefType)) (|Q#everUsed| (Q x@@20)))
 :qid |stdinbpl.1013:15|
 :skolemid |69|
 :pattern ( (|Q#trigger| Heap@@12 (Q x@@20)))
)))
(assert (forall ((Heap@@13 T@U) (ExhaleHeap@@1 T@U) (Mask@@2 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@13) (MapType0Type RefType)) (= (type ExhaleHeap@@1) (MapType0Type RefType))) (= (type Mask@@2) (MapType1Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@13 ExhaleHeap@@1 Mask@@2)) (U_2_bool (MapType0Select Heap@@13 o_1 $allocated))) (U_2_bool (MapType0Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.73:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@13 ExhaleHeap@@1 Mask@@2) (MapType0Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert (forall ((Heap@@14 T@U) (x@@21 T@U) ) (!  (=> (and (= (type Heap@@14) (MapType0Type RefType)) (= (type x@@21) RefType)) (and (= (fun3 Heap@@14 x@@21) (|fun3'| Heap@@14 x@@21)) (dummyFunction (int_2_U (|fun3#triggerStateless| x@@21)))))
 :qid |stdinbpl.352:15|
 :skolemid |30|
 :pattern ( (fun3 Heap@@14 x@@21))
)))
(assert (forall ((Heap@@15 T@U) (x@@22 T@U) ) (!  (=> (and (= (type Heap@@15) (MapType0Type RefType)) (= (type x@@22) RefType)) (and (= (fun5 Heap@@15 x@@22) (|fun5'| Heap@@15 x@@22)) (dummyFunction (int_2_U (|fun5#triggerStateless| x@@22)))))
 :qid |stdinbpl.609:15|
 :skolemid |42|
 :pattern ( (fun5 Heap@@15 x@@22))
)))
(assert (forall ((Heap@@16 T@U) (x@@23 T@U) ) (!  (=> (and (= (type Heap@@16) (MapType0Type RefType)) (= (type x@@23) RefType)) (and (= (err1 Heap@@16 x@@23) (|err1'| Heap@@16 x@@23)) (dummyFunction (int_2_U (|err1#triggerStateless| x@@23)))))
 :qid |stdinbpl.720:15|
 :skolemid |46|
 :pattern ( (err1 Heap@@16 x@@23))
)))
(assert (forall ((Heap@@17 T@U) (x@@24 T@U) ) (!  (=> (and (= (type Heap@@17) (MapType0Type RefType)) (= (type x@@24) RefType)) (and (= (err2 Heap@@17 x@@24) (|err2'| Heap@@17 x@@24)) (dummyFunction (int_2_U (|err2#triggerStateless| x@@24)))))
 :qid |stdinbpl.782:15|
 :skolemid |50|
 :pattern ( (err2 Heap@@17 x@@24))
)))
(assert (forall ((Heap@@18 T@U) (Mask@@3 T@U) (x@@25 T@U) ) (!  (=> (and (and (and (= (type Heap@@18) (MapType0Type RefType)) (= (type Mask@@3) (MapType1Type RefType realType))) (= (type x@@25) RefType)) (and (state Heap@@18 Mask@@3) (< AssumeFunctionsAbove 3))) (= (fun5 Heap@@18 x@@25) (+ (U_2_int (MapType0Select Heap@@18 x@@25 f_7)) (ite (= (MapType0Select Heap@@18 x@@25 h) null) 0 (U_2_int (MapType0Select Heap@@18 (MapType0Select Heap@@18 x@@25 h) g))))))
 :qid |stdinbpl.619:15|
 :skolemid |44|
 :pattern ( (state Heap@@18 Mask@@3) (fun5 Heap@@18 x@@25))
 :pattern ( (state Heap@@18 Mask@@3) (|fun5#triggerStateless| x@@25) (|Q#trigger| Heap@@18 (Q x@@25)))
)))
(assert (forall ((x@@26 T@U) (x2 T@U) ) (!  (=> (and (and (= (type x@@26) RefType) (= (type x2) RefType)) (= (P x@@26) (P x2))) (= x@@26 x2))
 :qid |stdinbpl.950:15|
 :skolemid |61|
 :pattern ( (P x@@26) (P x2))
)))
(assert (forall ((arg0@@27 T@U) ) (! (= (type (|P#sm| arg0@@27)) (FieldType PredicateType_PType (MapType1Type RefType boolType)))
 :qid |funType:P#sm|
 :pattern ( (|P#sm| arg0@@27))
)))
(assert (forall ((x@@27 T@U) (x2@@0 T@U) ) (!  (=> (and (and (= (type x@@27) RefType) (= (type x2@@0) RefType)) (= (|P#sm| x@@27) (|P#sm| x2@@0))) (= x@@27 x2@@0))
 :qid |stdinbpl.954:15|
 :skolemid |62|
 :pattern ( (|P#sm| x@@27) (|P#sm| x2@@0))
)))
(assert (forall ((x@@28 T@U) (x2@@1 T@U) ) (!  (=> (and (and (= (type x@@28) RefType) (= (type x2@@1) RefType)) (= (Q x@@28) (Q x2@@1))) (= x@@28 x2@@1))
 :qid |stdinbpl.1004:15|
 :skolemid |67|
 :pattern ( (Q x@@28) (Q x2@@1))
)))
(assert (forall ((arg0@@28 T@U) ) (! (= (type (|Q#sm| arg0@@28)) (FieldType PredicateType_QType (MapType1Type RefType boolType)))
 :qid |funType:Q#sm|
 :pattern ( (|Q#sm| arg0@@28))
)))
(assert (forall ((x@@29 T@U) (x2@@2 T@U) ) (!  (=> (and (and (= (type x@@29) RefType) (= (type x2@@2) RefType)) (= (|Q#sm| x@@29) (|Q#sm| x2@@2))) (= x@@29 x2@@2))
 :qid |stdinbpl.1008:15|
 :skolemid |68|
 :pattern ( (|Q#sm| x@@29) (|Q#sm| x2@@2))
)))
(assert (forall ((Heap@@19 T@U) (ExhaleHeap@@2 T@U) (Mask@@4 T@U) (o_1@@0 T@U) (f_2 T@U) ) (! (let ((B@@1 (FieldTypeInv1 (type f_2))))
(let ((A@@1 (FieldTypeInv0 (type f_2))))
 (=> (and (and (and (and (and (and (= (type Heap@@19) (MapType0Type RefType)) (= (type ExhaleHeap@@2) (MapType0Type RefType))) (= (type Mask@@4) (MapType1Type RefType realType))) (= (type o_1@@0) RefType)) (= (type f_2) (FieldType A@@1 B@@1))) (IdenticalOnKnownLocations Heap@@19 ExhaleHeap@@2 Mask@@4)) (HasDirectPerm Mask@@4 o_1@@0 f_2)) (= (MapType0Select Heap@@19 o_1@@0 f_2) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2)))))
 :qid |stdinbpl.42:22|
 :skolemid |1|
 :pattern ( (IdenticalOnKnownLocations Heap@@19 ExhaleHeap@@2 Mask@@4) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2))
)))
(assert  (and (= (type dummyHeap) (MapType0Type RefType)) (= (type ZeroMask) (MapType1Type RefType realType))))
(assert (state dummyHeap ZeroMask))
(assert (forall ((p T@U) (v_1 T@U) (w T@U) ) (! (let ((A@@2 (FieldTypeInv0 (type p))))
 (=> (and (and (= (type p) (FieldType A@@2 FrameTypeType)) (= (type v_1) FrameTypeType)) (= (type w) FrameTypeType)) (not (InsidePredicate p v_1 p w))))
 :qid |stdinbpl.181:19|
 :skolemid |21|
 :pattern ( (InsidePredicate p v_1 p w))
)))
(assert  (and (forall ((arg0@@29 T@U) ) (! (= (type (FrameFragment arg0@@29)) FrameTypeType)
 :qid |funType:FrameFragment|
 :pattern ( (FrameFragment arg0@@29))
)) (= (type EmptyFrame) FrameTypeType)))
(assert (forall ((Heap@@20 T@U) (Mask@@5 T@U) (b_2@@0 Bool) (x@@30 T@U) ) (!  (=> (and (and (and (= (type Heap@@20) (MapType0Type RefType)) (= (type Mask@@5) (MapType1Type RefType realType))) (= (type x@@30) RefType)) (state Heap@@20 Mask@@5)) (= (|fun6'| Heap@@20 b_2@@0 x@@30) (|fun6#frame| (FrameFragment (ite b_2@@0 (FrameFragment (MapType0Select Heap@@20 x@@30 f_7)) EmptyFrame)) b_2@@0 x@@30)))
 :qid |stdinbpl.558:15|
 :skolemid |41|
 :pattern ( (state Heap@@20 Mask@@5) (|fun6'| Heap@@20 b_2@@0 x@@30))
)))
(assert (forall ((Heap@@21 T@U) (Mask@@6 T@U) (x@@31 T@U) (y@@5 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@21) (MapType0Type RefType)) (= (type Mask@@6) (MapType1Type RefType realType))) (= (type x@@31) RefType)) (= (type y@@5) RefType)) (and (state Heap@@21 Mask@@6) (< AssumeFunctionsAbove 0))) (= x@@31 y@@5)) (= (fun1 Heap@@21 x@@31 y@@5) (+ (U_2_int (MapType0Select Heap@@21 y@@5 f_7)) (U_2_int (MapType0Select Heap@@21 x@@31 g)))))
 :qid |stdinbpl.217:15|
 :skolemid |24|
 :pattern ( (state Heap@@21 Mask@@6) (fun1 Heap@@21 x@@31 y@@5))
)))
(assert (forall ((Heap@@22 T@U) (Mask@@7 T@U) (x@@32 T@U) (y@@6 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@22) (MapType0Type RefType)) (= (type Mask@@7) (MapType1Type RefType realType))) (= (type x@@32) RefType)) (= (type y@@6) RefType)) (and (state Heap@@22 Mask@@7) (< AssumeFunctionsAbove 1))) (= x@@32 y@@6)) (= (fun4 Heap@@22 x@@32 y@@6) (+ (U_2_int (MapType0Select Heap@@22 y@@6 f_7)) (U_2_int (MapType0Select Heap@@22 y@@6 g)))))
 :qid |stdinbpl.450:15|
 :skolemid |36|
 :pattern ( (state Heap@@22 Mask@@7) (fun4 Heap@@22 x@@32 y@@6))
 :pattern ( (state Heap@@22 Mask@@7) (|fun4#triggerStateless| x@@32 y@@6) (|P#trigger| Heap@@22 (P y@@6)))
)))
(assert (forall ((Heap@@23 T@U) (Mask@@8 T@U) (x@@33 T@U) (y@@7 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@23) (MapType0Type RefType)) (= (type Mask@@8) (MapType1Type RefType realType))) (= (type x@@33) RefType)) (= (type y@@7) RefType)) (and (state Heap@@23 Mask@@8) (< AssumeFunctionsAbove 6))) (= x@@33 y@@7)) (= (fun2 Heap@@23 x@@33 y@@7) (+ (U_2_int (MapType0Select Heap@@23 y@@7 f_7)) (U_2_int (MapType0Select Heap@@23 x@@33 g)))))
 :qid |stdinbpl.290:15|
 :skolemid |28|
 :pattern ( (state Heap@@23 Mask@@8) (fun2 Heap@@23 x@@33 y@@7))
)))
(assert  (not (IsPredicateField f_7)))
(assert  (not (IsWandField f_7)))
(assert  (not (IsPredicateField g)))
(assert  (not (IsWandField g)))
(assert  (not (IsPredicateField h)))
(assert  (not (IsWandField h)))
(assert (forall ((Heap@@24 T@U) (ExhaleHeap@@3 T@U) (Mask@@9 T@U) ) (!  (=> (and (and (and (= (type Heap@@24) (MapType0Type RefType)) (= (type ExhaleHeap@@3) (MapType0Type RefType))) (= (type Mask@@9) (MapType1Type RefType realType))) (IdenticalOnKnownLocations Heap@@24 ExhaleHeap@@3 Mask@@9)) (succHeap Heap@@24 ExhaleHeap@@3))
 :qid |stdinbpl.83:15|
 :skolemid |10|
 :pattern ( (IdenticalOnKnownLocations Heap@@24 ExhaleHeap@@3 Mask@@9))
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
(assert (forall ((arg0@@30 Real) (arg1@@9 T@U) ) (! (= (type (ConditionalFrame arg0@@30 arg1@@9)) FrameTypeType)
 :qid |funType:ConditionalFrame|
 :pattern ( (ConditionalFrame arg0@@30 arg1@@9))
)))
(assert (forall ((p@@0 Real) (f_6 T@U) ) (!  (=> (= (type f_6) FrameTypeType) (= (ConditionalFrame p@@0 f_6) (ite (> p@@0 0.0) f_6 EmptyFrame)))
 :qid |stdinbpl.169:15|
 :skolemid |19|
 :pattern ( (ConditionalFrame p@@0 f_6))
)))
(assert (forall ((Mask@@10 T@U) (o_2@@0 T@U) (f_4@@0 T@U) ) (! (let ((B@@3 (FieldTypeInv1 (type f_4@@0))))
(let ((A@@4 (FieldTypeInv0 (type f_4@@0))))
 (=> (and (and (= (type Mask@@10) (MapType1Type RefType realType)) (= (type o_2@@0) RefType)) (= (type f_4@@0) (FieldType A@@4 B@@3))) (= (HasDirectPerm Mask@@10 o_2@@0 f_4@@0) (> (U_2_real (MapType1Select Mask@@10 o_2@@0 f_4@@0)) NoPerm)))))
 :qid |stdinbpl.133:22|
 :skolemid |17|
 :pattern ( (HasDirectPerm Mask@@10 o_2@@0 f_4@@0))
)))
(assert (forall ((Heap@@25 T@U) (x@@34 T@U) (y@@8 T@U) ) (!  (=> (and (and (= (type Heap@@25) (MapType0Type RefType)) (= (type x@@34) RefType)) (= (type y@@8) RefType)) (and (= (fun1 Heap@@25 x@@34 y@@8) (|fun1'| Heap@@25 x@@34 y@@8)) (dummyFunction (int_2_U (|fun1#triggerStateless| x@@34 y@@8)))))
 :qid |stdinbpl.207:15|
 :skolemid |22|
 :pattern ( (fun1 Heap@@25 x@@34 y@@8))
)))
(assert (forall ((Heap@@26 T@U) (x@@35 T@U) (y@@9 T@U) ) (!  (=> (and (and (= (type Heap@@26) (MapType0Type RefType)) (= (type x@@35) RefType)) (= (type y@@9) RefType)) (and (= (fun2 Heap@@26 x@@35 y@@9) (|fun2'| Heap@@26 x@@35 y@@9)) (dummyFunction (int_2_U (|fun2#triggerStateless| x@@35 y@@9)))))
 :qid |stdinbpl.280:15|
 :skolemid |26|
 :pattern ( (fun2 Heap@@26 x@@35 y@@9))
)))
(assert (forall ((Heap@@27 T@U) (x@@36 T@U) (y@@10 T@U) ) (!  (=> (and (and (= (type Heap@@27) (MapType0Type RefType)) (= (type x@@36) RefType)) (= (type y@@10) RefType)) (and (= (fun4 Heap@@27 x@@36 y@@10) (|fun4'| Heap@@27 x@@36 y@@10)) (dummyFunction (int_2_U (|fun4#triggerStateless| x@@36 y@@10)))))
 :qid |stdinbpl.440:15|
 :skolemid |34|
 :pattern ( (fun4 Heap@@27 x@@36 y@@10))
)))
(assert (forall ((Heap@@28 T@U) (b_2@@1 Bool) (x@@37 T@U) ) (!  (=> (and (= (type Heap@@28) (MapType0Type RefType)) (= (type x@@37) RefType)) (and (= (fun6 Heap@@28 b_2@@1 x@@37) (|fun6'| Heap@@28 b_2@@1 x@@37)) (dummyFunction (int_2_U (|fun6#triggerStateless| b_2@@1 x@@37)))))
 :qid |stdinbpl.541:15|
 :skolemid |38|
 :pattern ( (fun6 Heap@@28 b_2@@1 x@@37))
)))
(assert (forall ((Heap@@29 T@U) (x@@38 T@U) (y@@11 T@U) ) (!  (=> (and (and (= (type Heap@@29) (MapType0Type RefType)) (= (type x@@38) RefType)) (= (type y@@11) RefType)) (and (= (er3 Heap@@29 x@@38 y@@11) (|er3'| Heap@@29 x@@38 y@@11)) (dummyFunction (int_2_U (|er3#triggerStateless| x@@38 y@@11)))))
 :qid |stdinbpl.865:15|
 :skolemid |54|
 :pattern ( (er3 Heap@@29 x@@38 y@@11))
)))
(assert (forall ((Heap@@30 T@U) (Mask@@11 T@U) (x@@39 T@U) ) (!  (=> (and (and (and (= (type Heap@@30) (MapType0Type RefType)) (= (type Mask@@11) (MapType1Type RefType realType))) (= (type x@@39) RefType)) (state Heap@@30 Mask@@11)) (= (|err1'| Heap@@30 x@@39) (|err1#frame| (FrameFragment (MapType0Select Heap@@30 (MapType0Select Heap@@30 x@@39 h) f_7)) x@@39)))
 :qid |stdinbpl.737:15|
 :skolemid |49|
 :pattern ( (state Heap@@30 Mask@@11) (|err1'| Heap@@30 x@@39))
)))
(assert (forall ((o_2@@1 T@U) (f_4@@1 T@U) ) (! (let ((B@@4 (FieldTypeInv1 (type f_4@@1))))
(let ((A@@5 (FieldTypeInv0 (type f_4@@1))))
 (=> (and (= (type o_2@@1) RefType) (= (type f_4@@1) (FieldType A@@5 B@@4))) (= (U_2_real (MapType1Select ZeroMask o_2@@1 f_4@@1)) NoPerm))))
 :qid |stdinbpl.106:22|
 :skolemid |13|
 :pattern ( (MapType1Select ZeroMask o_2@@1 f_4@@1))
)))
(assert (forall ((arg0@@31 T@U) (arg1@@10 T@U) ) (! (= (type (CombineFrames arg0@@31 arg1@@10)) FrameTypeType)
 :qid |funType:CombineFrames|
 :pattern ( (CombineFrames arg0@@31 arg1@@10))
)))
(assert (forall ((Heap@@31 T@U) (Mask@@12 T@U) (x@@40 T@U) (y@@12 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@31) (MapType0Type RefType)) (= (type Mask@@12) (MapType1Type RefType realType))) (= (type x@@40) RefType)) (= (type y@@12) RefType)) (state Heap@@31 Mask@@12)) (= (|fun1'| Heap@@31 x@@40 y@@12) (|fun1#frame| (CombineFrames (FrameFragment (MapType0Select Heap@@31 x@@40 f_7)) (FrameFragment (MapType0Select Heap@@31 y@@12 g))) x@@40 y@@12)))
 :qid |stdinbpl.224:15|
 :skolemid |25|
 :pattern ( (state Heap@@31 Mask@@12) (|fun1'| Heap@@31 x@@40 y@@12))
)))
(assert (forall ((Heap@@32 T@U) (Mask@@13 T@U) (x@@41 T@U) (y@@13 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@32) (MapType0Type RefType)) (= (type Mask@@13) (MapType1Type RefType realType))) (= (type x@@41) RefType)) (= (type y@@13) RefType)) (state Heap@@32 Mask@@13)) (= (|fun2'| Heap@@32 x@@41 y@@13) (|fun2#frame| (CombineFrames (FrameFragment (MapType0Select Heap@@32 x@@41 f_7)) (FrameFragment (MapType0Select Heap@@32 y@@13 g))) x@@41 y@@13)))
 :qid |stdinbpl.297:15|
 :skolemid |29|
 :pattern ( (state Heap@@32 Mask@@13) (|fun2'| Heap@@32 x@@41 y@@13))
)))
(assert (forall ((Heap@@33 T@U) (Mask@@14 T@U) (x@@42 T@U) (y@@14 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@33) (MapType0Type RefType)) (= (type Mask@@14) (MapType1Type RefType realType))) (= (type x@@42) RefType)) (= (type y@@14) RefType)) (state Heap@@33 Mask@@14)) (= (|fun4'| Heap@@33 x@@42 y@@14) (|fun4#frame| (CombineFrames (FrameFragment (MapType0Select Heap@@33 x@@42 f_7)) (MapType0Select Heap@@33 null (P y@@14))) x@@42 y@@14)))
 :qid |stdinbpl.457:15|
 :skolemid |37|
 :pattern ( (state Heap@@33 Mask@@14) (|fun4'| Heap@@33 x@@42 y@@14))
)))
(assert (forall ((Heap@@34 T@U) (Mask@@15 T@U) (x@@43 T@U) (y@@15 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@34) (MapType0Type RefType)) (= (type Mask@@15) (MapType1Type RefType realType))) (= (type x@@43) RefType)) (= (type y@@15) RefType)) (state Heap@@34 Mask@@15)) (= (|er3'| Heap@@34 x@@43 y@@15) (|er3#frame| (CombineFrames (FrameFragment (MapType0Select Heap@@34 x@@43 f_7)) (FrameFragment (MapType0Select Heap@@34 y@@15 g))) x@@43 y@@15)))
 :qid |stdinbpl.882:15|
 :skolemid |57|
 :pattern ( (state Heap@@34 Mask@@15) (|er3'| Heap@@34 x@@43 y@@15))
)))
(assert (forall ((Heap@@35 T@U) (ExhaleHeap@@4 T@U) (Mask@@16 T@U) (pm_f@@1 T@U) ) (! (let ((C@@1 (FieldTypeInv0 (type pm_f@@1))))
 (=> (and (and (and (and (and (= (type Heap@@35) (MapType0Type RefType)) (= (type ExhaleHeap@@4) (MapType0Type RefType))) (= (type Mask@@16) (MapType1Type RefType realType))) (= (type pm_f@@1) (FieldType C@@1 FrameTypeType))) (IdenticalOnKnownLocations Heap@@35 ExhaleHeap@@4 Mask@@16)) (and (HasDirectPerm Mask@@16 null pm_f@@1) (IsPredicateField pm_f@@1))) (forall ((o2 T@U) (f_2@@0 T@U) ) (! (let ((B@@5 (FieldTypeInv1 (type f_2@@0))))
(let ((A@@6 (FieldTypeInv0 (type f_2@@0))))
 (=> (and (and (= (type o2) RefType) (= (type f_2@@0) (FieldType A@@6 B@@5))) (U_2_bool (MapType1Select (MapType0Select Heap@@35 null (PredicateMaskField pm_f@@1)) o2 f_2@@0))) (= (MapType0Select Heap@@35 o2 f_2@@0) (MapType0Select ExhaleHeap@@4 o2 f_2@@0)))))
 :qid |stdinbpl.54:134|
 :skolemid |3|
 :pattern ( (MapType0Select ExhaleHeap@@4 o2 f_2@@0))
))))
 :qid |stdinbpl.52:19|
 :skolemid |4|
 :pattern ( (IdenticalOnKnownLocations Heap@@35 ExhaleHeap@@4 Mask@@16) (IsPredicateField pm_f@@1))
)))
(assert (forall ((Heap@@36 T@U) (ExhaleHeap@@5 T@U) (Mask@@17 T@U) (pm_f@@2 T@U) ) (! (let ((C@@2 (FieldTypeInv0 (type pm_f@@2))))
 (=> (and (and (and (and (and (= (type Heap@@36) (MapType0Type RefType)) (= (type ExhaleHeap@@5) (MapType0Type RefType))) (= (type Mask@@17) (MapType1Type RefType realType))) (= (type pm_f@@2) (FieldType C@@2 FrameTypeType))) (IdenticalOnKnownLocations Heap@@36 ExhaleHeap@@5 Mask@@17)) (and (HasDirectPerm Mask@@17 null pm_f@@2) (IsWandField pm_f@@2))) (forall ((o2@@0 T@U) (f_2@@1 T@U) ) (! (let ((B@@6 (FieldTypeInv1 (type f_2@@1))))
(let ((A@@7 (FieldTypeInv0 (type f_2@@1))))
 (=> (and (and (= (type o2@@0) RefType) (= (type f_2@@1) (FieldType A@@7 B@@6))) (U_2_bool (MapType1Select (MapType0Select Heap@@36 null (WandMaskField pm_f@@2)) o2@@0 f_2@@1))) (= (MapType0Select Heap@@36 o2@@0 f_2@@1) (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1)))))
 :qid |stdinbpl.67:129|
 :skolemid |6|
 :pattern ( (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1))
))))
 :qid |stdinbpl.65:19|
 :skolemid |7|
 :pattern ( (IdenticalOnKnownLocations Heap@@36 ExhaleHeap@@5 Mask@@17) (IsWandField pm_f@@2))
)))
(assert (forall ((Heap@@37 T@U) (Mask@@18 T@U) (b_2@@2 Bool) (x@@44 T@U) ) (!  (=> (and (and (and (= (type Heap@@37) (MapType0Type RefType)) (= (type Mask@@18) (MapType1Type RefType realType))) (= (type x@@44) RefType)) (and (state Heap@@37 Mask@@18) (< AssumeFunctionsAbove 5))) (= (fun6 Heap@@37 b_2@@2 x@@44) (ite b_2@@2 (U_2_int (MapType0Select Heap@@37 x@@44 f_7)) 0)))
 :qid |stdinbpl.551:15|
 :skolemid |40|
 :pattern ( (state Heap@@37 Mask@@18) (fun6 Heap@@37 b_2@@2 x@@44))
)))
(assert (forall ((x@@45 T@U) ) (!  (=> (= (type x@@45) RefType) (= (getPredWandId (P x@@45)) 0))
 :qid |stdinbpl.944:15|
 :skolemid |60|
 :pattern ( (P x@@45))
)))
(assert (forall ((x@@46 T@U) ) (!  (=> (= (type x@@46) RefType) (= (getPredWandId (Q x@@46)) 1))
 :qid |stdinbpl.998:15|
 :skolemid |66|
 :pattern ( (Q x@@46))
)))
(assert (forall ((Mask@@19 T@U) (o_2@@2 T@U) (f_4@@2 T@U) ) (! (let ((B@@7 (FieldTypeInv1 (type f_4@@2))))
(let ((A@@8 (FieldTypeInv0 (type f_4@@2))))
 (=> (and (and (and (= (type Mask@@19) (MapType1Type RefType realType)) (= (type o_2@@2) RefType)) (= (type f_4@@2) (FieldType A@@8 B@@7))) (GoodMask Mask@@19)) (and (>= (U_2_real (MapType1Select Mask@@19 o_2@@2 f_4@@2)) NoPerm) (=> (and (and (GoodMask Mask@@19) (not (IsPredicateField f_4@@2))) (not (IsWandField f_4@@2))) (<= (U_2_real (MapType1Select Mask@@19 o_2@@2 f_4@@2)) FullPerm))))))
 :qid |stdinbpl.128:22|
 :skolemid |16|
 :pattern ( (GoodMask Mask@@19) (MapType1Select Mask@@19 o_2@@2 f_4@@2))
)))
(assert (forall ((Heap@@38 T@U) (Mask@@20 T@U) (x@@47 T@U) ) (!  (=> (and (and (and (= (type Heap@@38) (MapType0Type RefType)) (= (type Mask@@20) (MapType1Type RefType realType))) (= (type x@@47) RefType)) (state Heap@@38 Mask@@20)) (= (|fun3'| Heap@@38 x@@47) (|fun3#frame| (MapType0Select Heap@@38 null (P x@@47)) x@@47)))
 :qid |stdinbpl.369:15|
 :skolemid |33|
 :pattern ( (state Heap@@38 Mask@@20) (|fun3'| Heap@@38 x@@47))
)))
(assert (forall ((Heap@@39 T@U) (Mask@@21 T@U) (x@@48 T@U) ) (!  (=> (and (and (and (= (type Heap@@39) (MapType0Type RefType)) (= (type Mask@@21) (MapType1Type RefType realType))) (= (type x@@48) RefType)) (state Heap@@39 Mask@@21)) (= (|fun5'| Heap@@39 x@@48) (|fun5#frame| (MapType0Select Heap@@39 null (Q x@@48)) x@@48)))
 :qid |stdinbpl.626:15|
 :skolemid |45|
 :pattern ( (state Heap@@39 Mask@@21) (|fun5'| Heap@@39 x@@48))
)))
(assert (forall ((Heap@@40 T@U) (Mask@@22 T@U) (x@@49 T@U) ) (!  (=> (and (and (and (= (type Heap@@40) (MapType0Type RefType)) (= (type Mask@@22) (MapType1Type RefType realType))) (= (type x@@49) RefType)) (state Heap@@40 Mask@@22)) (= (|err2'| Heap@@40 x@@49) (|err2#frame| (FrameFragment (MapType0Select Heap@@40 x@@49 f_7)) x@@49)))
 :qid |stdinbpl.799:15|
 :skolemid |53|
 :pattern ( (state Heap@@40 Mask@@22) (|err2'| Heap@@40 x@@49))
)))
(assert (forall ((o T@U) (f T@U) (Heap@@41 T@U) ) (!  (=> (and (and (and (= (type o) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap@@41) (MapType0Type RefType))) (U_2_bool (MapType0Select Heap@@41 o $allocated))) (U_2_bool (MapType0Select Heap@@41 (MapType0Select Heap@@41 o f) $allocated)))
 :qid |stdinbpl.31:15|
 :skolemid |0|
 :pattern ( (MapType0Select Heap@@41 o f))
)))
(assert (forall ((Heap@@42 T@U) (Mask@@23 T@U) (x@@50 T@U) (y@@16 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@42) (MapType0Type RefType)) (= (type Mask@@23) (MapType1Type RefType realType))) (= (type x@@50) RefType)) (= (type y@@16) RefType)) (and (state Heap@@42 Mask@@23) (< AssumeFunctionsAbove 7))) (= (er3 Heap@@42 x@@50 y@@16) (+ (U_2_int (MapType0Select Heap@@42 y@@16 f_7)) (U_2_int (MapType0Select Heap@@42 x@@50 g)))))
 :qid |stdinbpl.875:15|
 :skolemid |56|
 :pattern ( (state Heap@@42 Mask@@23) (er3 Heap@@42 x@@50 y@@16))
)))
(assert (forall ((x@@51 T@U) ) (!  (=> (= (type x@@51) RefType) (= (PredicateMaskField (P x@@51)) (|P#sm| x@@51)))
 :qid |stdinbpl.936:15|
 :skolemid |58|
 :pattern ( (PredicateMaskField (P x@@51)))
)))
(assert (forall ((x@@52 T@U) ) (!  (=> (= (type x@@52) RefType) (= (PredicateMaskField (Q x@@52)) (|Q#sm| x@@52)))
 :qid |stdinbpl.990:15|
 :skolemid |64|
 :pattern ( (PredicateMaskField (Q x@@52)))
)))
(assert (forall ((Heap@@43 T@U) (o@@0 T@U) (f_3 T@U) (v T@U) ) (! (let ((B@@8 (type v)))
(let ((A@@9 (FieldTypeInv0 (type f_3))))
 (=> (and (and (= (type Heap@@43) (MapType0Type RefType)) (= (type o@@0) RefType)) (= (type f_3) (FieldType A@@9 B@@8))) (succHeap Heap@@43 (MapType0Store Heap@@43 o@@0 f_3 v)))))
 :qid |stdinbpl.78:22|
 :skolemid |9|
 :pattern ( (MapType0Store Heap@@43 o@@0 f_3 v))
)))
(assert (forall ((Heap@@44 T@U) (Mask@@24 T@U) (x@@53 T@U) ) (!  (=> (and (and (and (= (type Heap@@44) (MapType0Type RefType)) (= (type Mask@@24) (MapType1Type RefType realType))) (= (type x@@53) RefType)) (and (state Heap@@44 Mask@@24) (< AssumeFunctionsAbove 4))) (= (fun3 Heap@@44 x@@53) (U_2_int (MapType0Select Heap@@44 x@@53 g))))
 :qid |stdinbpl.362:15|
 :skolemid |32|
 :pattern ( (state Heap@@44 Mask@@24) (fun3 Heap@@44 x@@53))
 :pattern ( (state Heap@@44 Mask@@24) (|fun3#triggerStateless| x@@53) (|P#trigger| Heap@@44 (P x@@53)))
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
 :qid |stdinbpl.176:25|
 :skolemid |20|
 :pattern ( (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))
)))
(assert (forall ((Heap@@45 T@U) (Mask@@25 T@U) (x@@54 T@U) ) (!  (=> (and (and (and (= (type Heap@@45) (MapType0Type RefType)) (= (type Mask@@25) (MapType1Type RefType realType))) (= (type x@@54) RefType)) (and (state Heap@@45 Mask@@25) (< AssumeFunctionsAbove 8))) (= (err1 Heap@@45 x@@54) 0))
 :qid |stdinbpl.730:15|
 :skolemid |48|
 :pattern ( (state Heap@@45 Mask@@25) (err1 Heap@@45 x@@54))
)))
(assert (forall ((Heap@@46 T@U) (Mask@@26 T@U) (x@@55 T@U) ) (!  (=> (and (and (and (and (= (type Heap@@46) (MapType0Type RefType)) (= (type Mask@@26) (MapType1Type RefType realType))) (= (type x@@55) RefType)) (and (state Heap@@46 Mask@@26) (< AssumeFunctionsAbove 2))) (= (err1 Heap@@46 x@@55) 0)) (= (err2 Heap@@46 x@@55) 0))
 :qid |stdinbpl.792:15|
 :skolemid |52|
 :pattern ( (state Heap@@46 Mask@@26) (err2 Heap@@46 x@@55))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun Heap@1 () T@U)
(declare-fun x@@56 () T@U)
(declare-fun Heap@3 () T@U)
(declare-fun Heap@2 () T@U)
(declare-fun Heap@0 () T@U)
(declare-fun Heap@@47 () T@U)
(declare-fun UnfoldingMask@4 () T@U)
(declare-fun UnfoldingMask@2 () T@U)
(declare-fun UnfoldingMask@3 () T@U)
(declare-fun UnfoldingMask@0 () T@U)
(declare-fun Mask@0 () T@U)
(declare-fun UnfoldingMask@1 () T@U)
(assert  (and (and (and (and (and (and (and (and (and (and (and (= (type Heap@1) (MapType0Type RefType)) (= (type x@@56) RefType)) (= (type Heap@2) (MapType0Type RefType))) (= (type Heap@3) (MapType0Type RefType))) (= (type Heap@0) (MapType0Type RefType))) (= (type Heap@@47) (MapType0Type RefType))) (= (type UnfoldingMask@4) (MapType1Type RefType realType))) (= (type UnfoldingMask@3) (MapType1Type RefType realType))) (= (type UnfoldingMask@2) (MapType1Type RefType realType))) (= (type UnfoldingMask@0) (MapType1Type RefType realType))) (= (type Mask@0) (MapType1Type RefType realType))) (= (type UnfoldingMask@1) (MapType1Type RefType realType))))
(set-info :boogie-vc-id |fun5#definedness|)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 19) (let ((anon9_correct true))
(let ((anon13_Else_correct  (=> (= (MapType0Select Heap@1 x@@56 h) null) (=> (and (= Heap@3 Heap@1) (= (ControlFlow 0 3) 1)) anon9_correct))))
(let ((anon13_Then_correct  (=> (and (and (not (= (MapType0Select Heap@1 x@@56 h) null)) (= Heap@2 (MapType0Store Heap@1 null (|Q#sm| x@@56) (MapType1Store (MapType0Select Heap@1 null (|Q#sm| x@@56)) (MapType0Select Heap@1 x@@56 h) g (bool_2_U true))))) (and (= Heap@3 Heap@2) (= (ControlFlow 0 2) 1))) anon9_correct)))
(let ((anon7_correct  (=> (and (= Heap@0 (MapType0Store Heap@@47 null (|Q#sm| x@@56) (MapType1Store (MapType0Select Heap@@47 null (|Q#sm| x@@56)) x@@56 f_7 (bool_2_U true)))) (= Heap@1 (MapType0Store Heap@0 null (|Q#sm| x@@56) (MapType1Store (MapType0Select Heap@0 null (|Q#sm| x@@56)) x@@56 h (bool_2_U true))))) (and (=> (= (ControlFlow 0 4) 2) anon13_Then_correct) (=> (= (ControlFlow 0 4) 3) anon13_Else_correct)))))
(let ((anon12_Else_correct  (=> (not (= (MapType0Select Heap@@47 x@@56 h) null)) (and (=> (= (ControlFlow 0 6) (- 0 8)) (HasDirectPerm UnfoldingMask@4 x@@56 h)) (=> (HasDirectPerm UnfoldingMask@4 x@@56 h) (and (=> (= (ControlFlow 0 6) (- 0 7)) (HasDirectPerm UnfoldingMask@4 (MapType0Select Heap@@47 x@@56 h) g)) (=> (HasDirectPerm UnfoldingMask@4 (MapType0Select Heap@@47 x@@56 h) g) (=> (= (ControlFlow 0 6) 4) anon7_correct))))))))
(let ((anon12_Then_correct  (=> (and (= (MapType0Select Heap@@47 x@@56 h) null) (= (ControlFlow 0 5) 4)) anon7_correct)))
(let ((anon4_correct  (=> (state Heap@@47 UnfoldingMask@4) (and (=> (= (ControlFlow 0 9) (- 0 11)) (HasDirectPerm UnfoldingMask@4 x@@56 f_7)) (=> (HasDirectPerm UnfoldingMask@4 x@@56 f_7) (and (=> (= (ControlFlow 0 9) (- 0 10)) (HasDirectPerm UnfoldingMask@4 x@@56 h)) (=> (HasDirectPerm UnfoldingMask@4 x@@56 h) (and (=> (= (ControlFlow 0 9) 5) anon12_Then_correct) (=> (= (ControlFlow 0 9) 6) anon12_Else_correct)))))))))
(let ((anon11_Else_correct  (=> (= (MapType0Select Heap@@47 x@@56 h) null) (=> (and (= UnfoldingMask@4 UnfoldingMask@2) (= (ControlFlow 0 13) 9)) anon4_correct))))
(let ((anon11_Then_correct  (=> (and (not (= (MapType0Select Heap@@47 x@@56 h) null)) (not (= (MapType0Select Heap@@47 x@@56 h) null))) (=> (and (and (= UnfoldingMask@3 (MapType1Store UnfoldingMask@2 (MapType0Select Heap@@47 x@@56 h) g (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@2 (MapType0Select Heap@@47 x@@56 h) g)) FullPerm)))) (state Heap@@47 UnfoldingMask@3)) (and (= UnfoldingMask@4 UnfoldingMask@3) (= (ControlFlow 0 12) 9))) anon4_correct))))
(let ((anon2_correct  (=> (= UnfoldingMask@0 (MapType1Store Mask@0 null (Q x@@56) (real_2_U (- (U_2_real (MapType1Select Mask@0 null (Q x@@56))) FullPerm)))) (=> (and (not (= x@@56 null)) (= UnfoldingMask@1 (MapType1Store UnfoldingMask@0 x@@56 f_7 (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@0 x@@56 f_7)) FullPerm))))) (=> (and (and (state Heap@@47 UnfoldingMask@1) (not (= x@@56 null))) (and (= UnfoldingMask@2 (MapType1Store UnfoldingMask@1 x@@56 h (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@1 x@@56 h)) FullPerm)))) (state Heap@@47 UnfoldingMask@2))) (and (=> (= (ControlFlow 0 14) 12) anon11_Then_correct) (=> (= (ControlFlow 0 14) 13) anon11_Else_correct)))))))
(let ((anon10_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 17) 14)) anon2_correct)))
(let ((anon10_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 15) (- 0 16)) (<= FullPerm (U_2_real (MapType1Select Mask@0 null (Q x@@56))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@0 null (Q x@@56)))) (=> (= (ControlFlow 0 15) 14) anon2_correct))))))
(let ((anon0_correct  (=> (and (and (and (state Heap@@47 ZeroMask) (U_2_bool (MapType0Select Heap@@47 x@@56 $allocated))) (and (= AssumeFunctionsAbove 3) (= Mask@0 (MapType1Store ZeroMask null (Q x@@56) (real_2_U (+ (U_2_real (MapType1Select ZeroMask null (Q x@@56))) FullPerm)))))) (and (and (state Heap@@47 Mask@0) (state Heap@@47 Mask@0)) (and (|Q#trigger| Heap@@47 (Q x@@56)) (= (MapType0Select Heap@@47 null (Q x@@56)) (CombineFrames (FrameFragment (MapType0Select Heap@@47 x@@56 f_7)) (CombineFrames (FrameFragment (MapType0Select Heap@@47 x@@56 h)) (FrameFragment (ite (not (= (MapType0Select Heap@@47 x@@56 h) null)) (FrameFragment (MapType0Select Heap@@47 (MapType0Select Heap@@47 x@@56 h) g)) EmptyFrame)))))))) (and (=> (= (ControlFlow 0 18) 15) anon10_Then_correct) (=> (= (ControlFlow 0 18) 17) anon10_Else_correct)))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 19) 18) anon0_correct)))
PreconditionGeneratedEntry_correct)))))))))))))))
))
(check-sat)
(pop 1)
; Valid
(get-info :rlimit)
