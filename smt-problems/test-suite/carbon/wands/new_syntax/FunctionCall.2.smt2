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
(declare-fun succHeap (T@U T@U) Bool)
(declare-fun MapType0Type (T@T) T@T)
(declare-fun RefType () T@T)
(declare-fun succHeapTrans (T@U T@U) Bool)
(declare-fun MapType0TypeInv0 (T@T) T@T)
(declare-fun MapType0Select (T@U T@U T@U) T@U)
(declare-fun MapType0Store (T@U T@U T@U T@U) T@U)
(declare-fun wand (T@U Real T@U Real T@U Int T@U Real T@U Int) T@U)
(declare-fun IsWandField (T@U) Bool)
(declare-fun WandType_wandType () T@T)
(declare-fun |wand#ft| (T@U Real T@U Real T@U Int T@U Real T@U Int) T@U)
(declare-fun FrameTypeType () T@T)
(declare-fun WandMaskField (T@U) T@U)
(declare-fun |wand#sm| (T@U Real T@U Real T@U Int T@U Real T@U Int) T@U)
(declare-fun MapType1Type (T@T T@T) T@T)
(declare-fun MapType1TypeInv0 (T@T) T@T)
(declare-fun MapType1TypeInv1 (T@T) T@T)
(declare-fun MapType1Select (T@U T@U T@U) T@U)
(declare-fun MapType1Store (T@U T@U T@U T@U) T@U)
(declare-fun IsPredicateField (T@U) Bool)
(declare-fun state (T@U T@U) Bool)
(declare-fun GoodMask (T@U) Bool)
(declare-fun IdenticalOnKnownLocations (T@U T@U T@U) Bool)
(declare-fun null () T@U)
(declare-fun PredicateMaskField (T@U) T@U)
(declare-fun HasDirectPerm (T@U T@U T@U) Bool)
(declare-fun Cell (T@U) T@U)
(declare-fun PredicateType_CellType () T@T)
(declare-fun |getAndTransform'| (T@U T@U) Int)
(declare-fun dummyFunction (T@U) Bool)
(declare-fun |getAndTransform#triggerStateless| (T@U) Int)
(declare-fun |Cell#trigger| (T@U T@U) Bool)
(declare-fun |Cell#everUsed| (T@U) Bool)
(declare-fun getAndTransform (T@U T@U) Int)
(declare-fun wand_1 (Bool T@U Real T@U Int) T@U)
(declare-fun getPredWandId (T@U) Int)
(declare-fun WandType_wand_1Type () T@T)
(declare-fun |Cell#sm| (T@U) T@U)
(declare-fun dummyHeap () T@U)
(declare-fun ZeroMask () T@U)
(declare-fun InsidePredicate (T@U T@U T@U T@U) Bool)
(declare-fun |wand_1#ft| (Bool T@U Real T@U Int) T@U)
(declare-fun sumMask (T@U T@U T@U) Bool)
(declare-fun ConditionalFrame (Real T@U) T@U)
(declare-fun EmptyFrame () T@U)
(declare-fun AssumeFunctionsAbove () Int)
(declare-fun NoPerm () Real)
(declare-fun |wand_1#sm| (Bool T@U Real T@U Int) T@U)
(declare-fun FullPerm () Real)
(declare-fun |getAndTransform#frame| (T@U T@U) Int)
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
(assert  (and (= (Ctor WandType_wandType) 10) (forall ((arg0@@18 T@U) (arg1@@4 Real) (arg2@@1 T@U) (arg3@@0 Real) (arg4 T@U) (arg5 Int) (arg6 T@U) (arg7 Real) (arg8 T@U) (arg9 Int) ) (! (= (type (wand arg0@@18 arg1@@4 arg2@@1 arg3@@0 arg4 arg5 arg6 arg7 arg8 arg9)) (FieldType WandType_wandType intType))
 :qid |funType:wand|
 :pattern ( (wand arg0@@18 arg1@@4 arg2@@1 arg3@@0 arg4 arg5 arg6 arg7 arg8 arg9))
))))
(assert (forall ((arg1@@5 T@U) (arg2@@2 Real) (arg3@@1 T@U) (arg4@@0 Real) (arg5@@0 T@U) (arg6@@0 Int) (arg7@@0 T@U) (arg8@@0 Real) (arg9@@0 T@U) (arg10 Int) ) (!  (=> (and (and (and (and (= (type arg1@@5) RefType) (= (type arg3@@1) RefType)) (= (type arg5@@0) RefType)) (= (type arg7@@0) RefType)) (= (type arg9@@0) RefType)) (IsWandField (wand arg1@@5 arg2@@2 arg3@@1 arg4@@0 arg5@@0 arg6@@0 arg7@@0 arg8@@0 arg9@@0 arg10)))
 :qid |stdinbpl.186:15|
 :skolemid |22|
 :pattern ( (wand arg1@@5 arg2@@2 arg3@@1 arg4@@0 arg5@@0 arg6@@0 arg7@@0 arg8@@0 arg9@@0 arg10))
)))
(assert  (and (= (Ctor FrameTypeType) 11) (forall ((arg0@@19 T@U) (arg1@@6 Real) (arg2@@3 T@U) (arg3@@2 Real) (arg4@@1 T@U) (arg5@@1 Int) (arg6@@1 T@U) (arg7@@1 Real) (arg8@@1 T@U) (arg9@@1 Int) ) (! (= (type (|wand#ft| arg0@@19 arg1@@6 arg2@@3 arg3@@2 arg4@@1 arg5@@1 arg6@@1 arg7@@1 arg8@@1 arg9@@1)) (FieldType WandType_wandType FrameTypeType))
 :qid |funType:wand#ft|
 :pattern ( (|wand#ft| arg0@@19 arg1@@6 arg2@@3 arg3@@2 arg4@@1 arg5@@1 arg6@@1 arg7@@1 arg8@@1 arg9@@1))
))))
(assert (forall ((arg1@@7 T@U) (arg2@@4 Real) (arg3@@3 T@U) (arg4@@2 Real) (arg5@@2 T@U) (arg6@@2 Int) (arg7@@2 T@U) (arg8@@2 Real) (arg9@@2 T@U) (arg10@@0 Int) ) (!  (=> (and (and (and (and (= (type arg1@@7) RefType) (= (type arg3@@3) RefType)) (= (type arg5@@2) RefType)) (= (type arg7@@2) RefType)) (= (type arg9@@2) RefType)) (IsWandField (|wand#ft| arg1@@7 arg2@@4 arg3@@3 arg4@@2 arg5@@2 arg6@@2 arg7@@2 arg8@@2 arg9@@2 arg10@@0)))
 :qid |stdinbpl.190:15|
 :skolemid |23|
 :pattern ( (|wand#ft| arg1@@7 arg2@@4 arg3@@3 arg4@@2 arg5@@2 arg6@@2 arg7@@2 arg8@@2 arg9@@2 arg10@@0))
)))
(assert  (and (and (and (and (and (and (and (and (forall ((arg0@@20 T@T) (arg1@@8 T@T) ) (! (= (Ctor (MapType1Type arg0@@20 arg1@@8)) 12)
 :qid |ctor:MapType1Type|
)) (forall ((arg0@@21 T@T) (arg1@@9 T@T) ) (! (= (MapType1TypeInv0 (MapType1Type arg0@@21 arg1@@9)) arg0@@21)
 :qid |typeInv:MapType1TypeInv0|
 :pattern ( (MapType1Type arg0@@21 arg1@@9))
))) (forall ((arg0@@22 T@T) (arg1@@10 T@T) ) (! (= (MapType1TypeInv1 (MapType1Type arg0@@22 arg1@@10)) arg1@@10)
 :qid |typeInv:MapType1TypeInv1|
 :pattern ( (MapType1Type arg0@@22 arg1@@10))
))) (forall ((arg0@@23 T@U) (arg1@@11 T@U) (arg2@@5 T@U) ) (! (let ((aVar1 (MapType1TypeInv1 (type arg0@@23))))
(= (type (MapType1Select arg0@@23 arg1@@11 arg2@@5)) aVar1))
 :qid |funType:MapType1Select|
 :pattern ( (MapType1Select arg0@@23 arg1@@11 arg2@@5))
))) (forall ((arg0@@24 T@U) (arg1@@12 T@U) (arg2@@6 T@U) (arg3@@4 T@U) ) (! (let ((aVar1@@0 (type arg3@@4)))
(let ((aVar0@@0 (type arg1@@12)))
(= (type (MapType1Store arg0@@24 arg1@@12 arg2@@6 arg3@@4)) (MapType1Type aVar0@@0 aVar1@@0))))
 :qid |funType:MapType1Store|
 :pattern ( (MapType1Store arg0@@24 arg1@@12 arg2@@6 arg3@@4))
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
)))) (forall ((arg0@@25 T@U) ) (! (let ((A (FieldTypeInv0 (type arg0@@25))))
(= (type (WandMaskField arg0@@25)) (FieldType A (MapType1Type RefType boolType))))
 :qid |funType:WandMaskField|
 :pattern ( (WandMaskField arg0@@25))
))) (forall ((arg0@@26 T@U) (arg1@@13 Real) (arg2@@7 T@U) (arg3@@5 Real) (arg4@@3 T@U) (arg5@@3 Int) (arg6@@3 T@U) (arg7@@3 Real) (arg8@@3 T@U) (arg9@@3 Int) ) (! (= (type (|wand#sm| arg0@@26 arg1@@13 arg2@@7 arg3@@5 arg4@@3 arg5@@3 arg6@@3 arg7@@3 arg8@@3 arg9@@3)) (FieldType WandType_wandType (MapType1Type RefType boolType)))
 :qid |funType:wand#sm|
 :pattern ( (|wand#sm| arg0@@26 arg1@@13 arg2@@7 arg3@@5 arg4@@3 arg5@@3 arg6@@3 arg7@@3 arg8@@3 arg9@@3))
))))
(assert (forall ((arg1@@14 T@U) (arg2@@8 Real) (arg3@@6 T@U) (arg4@@4 Real) (arg5@@4 T@U) (arg6@@4 Int) (arg7@@4 T@U) (arg8@@4 Real) (arg9@@4 T@U) (arg10@@1 Int) ) (!  (=> (and (and (and (and (= (type arg1@@14) RefType) (= (type arg3@@6) RefType)) (= (type arg5@@4) RefType)) (= (type arg7@@4) RefType)) (= (type arg9@@4) RefType)) (= (|wand#sm| arg1@@14 arg2@@8 arg3@@6 arg4@@4 arg5@@4 arg6@@4 arg7@@4 arg8@@4 arg9@@4 arg10@@1) (WandMaskField (|wand#ft| arg1@@14 arg2@@8 arg3@@6 arg4@@4 arg5@@4 arg6@@4 arg7@@4 arg8@@4 arg9@@4 arg10@@1))))
 :qid |stdinbpl.202:15|
 :skolemid |26|
 :pattern ( (WandMaskField (|wand#ft| arg1@@14 arg2@@8 arg3@@6 arg4@@4 arg5@@4 arg6@@4 arg7@@4 arg8@@4 arg9@@4 arg10@@1)))
)))
(assert (forall ((arg1@@15 T@U) (arg2@@9 Real) (arg3@@7 T@U) (arg4@@5 Real) (arg5@@5 T@U) (arg6@@5 Int) (arg7@@5 T@U) (arg8@@5 Real) (arg9@@5 T@U) (arg10@@2 Int) ) (!  (=> (and (and (and (and (= (type arg1@@15) RefType) (= (type arg3@@7) RefType)) (= (type arg5@@5) RefType)) (= (type arg7@@5) RefType)) (= (type arg9@@5) RefType)) (not (IsPredicateField (wand arg1@@15 arg2@@9 arg3@@7 arg4@@5 arg5@@5 arg6@@5 arg7@@5 arg8@@5 arg9@@5 arg10@@2))))
 :qid |stdinbpl.194:15|
 :skolemid |24|
 :pattern ( (wand arg1@@15 arg2@@9 arg3@@7 arg4@@5 arg5@@5 arg6@@5 arg7@@5 arg8@@5 arg9@@5 arg10@@2))
)))
(assert (forall ((arg1@@16 T@U) (arg2@@10 Real) (arg3@@8 T@U) (arg4@@6 Real) (arg5@@6 T@U) (arg6@@6 Int) (arg7@@6 T@U) (arg8@@6 Real) (arg9@@6 T@U) (arg10@@3 Int) ) (!  (=> (and (and (and (and (= (type arg1@@16) RefType) (= (type arg3@@8) RefType)) (= (type arg5@@6) RefType)) (= (type arg7@@6) RefType)) (= (type arg9@@6) RefType)) (not (IsPredicateField (|wand#ft| arg1@@16 arg2@@10 arg3@@8 arg4@@6 arg5@@6 arg6@@6 arg7@@6 arg8@@6 arg9@@6 arg10@@3))))
 :qid |stdinbpl.198:15|
 :skolemid |25|
 :pattern ( (|wand#ft| arg1@@16 arg2@@10 arg3@@8 arg4@@6 arg5@@6 arg6@@6 arg7@@6 arg8@@6 arg9@@6 arg10@@3))
)))
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
(assert  (and (= (type null) RefType) (forall ((arg0@@27 T@U) ) (! (let ((A@@0 (FieldTypeInv0 (type arg0@@27))))
(= (type (PredicateMaskField arg0@@27)) (FieldType A@@0 (MapType1Type RefType boolType))))
 :qid |funType:PredicateMaskField|
 :pattern ( (PredicateMaskField arg0@@27))
))))
(assert (forall ((Heap@@0 T@U) (ExhaleHeap T@U) (Mask@@0 T@U) (pm_f T@U) ) (! (let ((C (FieldTypeInv0 (type pm_f))))
 (=> (and (and (and (and (and (= (type Heap@@0) (MapType0Type RefType)) (= (type ExhaleHeap) (MapType0Type RefType))) (= (type Mask@@0) (MapType1Type RefType realType))) (= (type pm_f) (FieldType C FrameTypeType))) (IdenticalOnKnownLocations Heap@@0 ExhaleHeap Mask@@0)) (and (HasDirectPerm Mask@@0 null pm_f) (IsPredicateField pm_f))) (= (MapType0Select Heap@@0 null (PredicateMaskField pm_f)) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))))
 :qid |stdinbpl.47:19|
 :skolemid |2|
 :pattern ( (IdenticalOnKnownLocations Heap@@0 ExhaleHeap Mask@@0) (IsPredicateField pm_f) (MapType0Select ExhaleHeap null (PredicateMaskField pm_f)))
)))
(assert (forall ((Heap@@1 T@U) (ExhaleHeap@@0 T@U) (Mask@@1 T@U) (pm_f@@0 T@U) ) (! (let ((C@@0 (FieldTypeInv0 (type pm_f@@0))))
 (=> (and (and (and (and (and (= (type Heap@@1) (MapType0Type RefType)) (= (type ExhaleHeap@@0) (MapType0Type RefType))) (= (type Mask@@1) (MapType1Type RefType realType))) (= (type pm_f@@0) (FieldType C@@0 FrameTypeType))) (IdenticalOnKnownLocations Heap@@1 ExhaleHeap@@0 Mask@@1)) (and (HasDirectPerm Mask@@1 null pm_f@@0) (IsWandField pm_f@@0))) (= (MapType0Select Heap@@1 null (WandMaskField pm_f@@0)) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))))
 :qid |stdinbpl.60:19|
 :skolemid |5|
 :pattern ( (IdenticalOnKnownLocations Heap@@1 ExhaleHeap@@0 Mask@@1) (IsWandField pm_f@@0) (MapType0Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))
)))
(assert  (and (= (Ctor PredicateType_CellType) 13) (forall ((arg0@@28 T@U) ) (! (= (type (Cell arg0@@28)) (FieldType PredicateType_CellType FrameTypeType))
 :qid |funType:Cell|
 :pattern ( (Cell arg0@@28))
))))
(assert (forall ((x@@8 T@U) ) (!  (=> (= (type x@@8) RefType) (IsPredicateField (Cell x@@8)))
 :qid |stdinbpl.354:15|
 :skolemid |41|
 :pattern ( (Cell x@@8))
)))
(assert (forall ((Heap@@2 T@U) (x@@9 T@U) ) (!  (=> (and (= (type Heap@@2) (MapType0Type RefType)) (= (type x@@9) RefType)) (dummyFunction (int_2_U (|getAndTransform#triggerStateless| x@@9))))
 :qid |stdinbpl.266:15|
 :skolemid |37|
 :pattern ( (|getAndTransform'| Heap@@2 x@@9))
)))
(assert (forall ((Heap@@3 T@U) (x@@10 T@U) ) (!  (=> (and (= (type Heap@@3) (MapType0Type RefType)) (= (type x@@10) RefType)) (|Cell#everUsed| (Cell x@@10)))
 :qid |stdinbpl.373:15|
 :skolemid |45|
 :pattern ( (|Cell#trigger| Heap@@3 (Cell x@@10)))
)))
(assert (forall ((Heap@@4 T@U) (ExhaleHeap@@1 T@U) (Mask@@2 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@4) (MapType0Type RefType)) (= (type ExhaleHeap@@1) (MapType0Type RefType))) (= (type Mask@@2) (MapType1Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@4 ExhaleHeap@@1 Mask@@2)) (U_2_bool (MapType0Select Heap@@4 o_1 $allocated))) (U_2_bool (MapType0Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.73:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@4 ExhaleHeap@@1 Mask@@2) (MapType0Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert (forall ((Heap@@5 T@U) (x@@11 T@U) ) (!  (=> (and (= (type Heap@@5) (MapType0Type RefType)) (= (type x@@11) RefType)) (and (= (getAndTransform Heap@@5 x@@11) (|getAndTransform'| Heap@@5 x@@11)) (dummyFunction (int_2_U (|getAndTransform#triggerStateless| x@@11)))))
 :qid |stdinbpl.262:15|
 :skolemid |36|
 :pattern ( (getAndTransform Heap@@5 x@@11))
)))
(assert  (and (= (Ctor WandType_wand_1Type) 14) (forall ((arg0@@29 Bool) (arg1@@17 T@U) (arg2@@11 Real) (arg3@@9 T@U) (arg4@@7 Int) ) (! (= (type (wand_1 arg0@@29 arg1@@17 arg2@@11 arg3@@9 arg4@@7)) (FieldType WandType_wand_1Type intType))
 :qid |funType:wand_1|
 :pattern ( (wand_1 arg0@@29 arg1@@17 arg2@@11 arg3@@9 arg4@@7))
))))
(assert (forall ((arg1@@18 Bool) (arg2@@12 T@U) (arg3@@10 Real) (arg4@@8 T@U) (arg5@@7 Int) ) (!  (=> (and (= (type arg2@@12) RefType) (= (type arg4@@8) RefType)) (= (getPredWandId (wand_1 arg1@@18 arg2@@12 arg3@@10 arg4@@8 arg5@@7)) 2))
 :qid |stdinbpl.238:15|
 :skolemid |34|
 :pattern ( (wand_1 arg1@@18 arg2@@12 arg3@@10 arg4@@8 arg5@@7))
)))
(assert (forall ((x@@12 T@U) (x2 T@U) ) (!  (=> (and (and (= (type x@@12) RefType) (= (type x2) RefType)) (= (Cell x@@12) (Cell x2))) (= x@@12 x2))
 :qid |stdinbpl.364:15|
 :skolemid |43|
 :pattern ( (Cell x@@12) (Cell x2))
)))
(assert (forall ((arg0@@30 T@U) ) (! (= (type (|Cell#sm| arg0@@30)) (FieldType PredicateType_CellType (MapType1Type RefType boolType)))
 :qid |funType:Cell#sm|
 :pattern ( (|Cell#sm| arg0@@30))
)))
(assert (forall ((x@@13 T@U) (x2@@0 T@U) ) (!  (=> (and (and (= (type x@@13) RefType) (= (type x2@@0) RefType)) (= (|Cell#sm| x@@13) (|Cell#sm| x2@@0))) (= x@@13 x2@@0))
 :qid |stdinbpl.368:15|
 :skolemid |44|
 :pattern ( (|Cell#sm| x@@13) (|Cell#sm| x2@@0))
)))
(assert (forall ((Heap@@6 T@U) (ExhaleHeap@@2 T@U) (Mask@@3 T@U) (o_1@@0 T@U) (f_2 T@U) ) (! (let ((B@@1 (FieldTypeInv1 (type f_2))))
(let ((A@@1 (FieldTypeInv0 (type f_2))))
 (=> (and (and (and (and (and (and (= (type Heap@@6) (MapType0Type RefType)) (= (type ExhaleHeap@@2) (MapType0Type RefType))) (= (type Mask@@3) (MapType1Type RefType realType))) (= (type o_1@@0) RefType)) (= (type f_2) (FieldType A@@1 B@@1))) (IdenticalOnKnownLocations Heap@@6 ExhaleHeap@@2 Mask@@3)) (HasDirectPerm Mask@@3 o_1@@0 f_2)) (= (MapType0Select Heap@@6 o_1@@0 f_2) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2)))))
 :qid |stdinbpl.42:22|
 :skolemid |1|
 :pattern ( (IdenticalOnKnownLocations Heap@@6 ExhaleHeap@@2 Mask@@3) (MapType0Select ExhaleHeap@@2 o_1@@0 f_2))
)))
(assert  (and (= (type dummyHeap) (MapType0Type RefType)) (= (type ZeroMask) (MapType1Type RefType realType))))
(assert (state dummyHeap ZeroMask))
(assert (forall ((p T@U) (v_1 T@U) (w T@U) ) (! (let ((A@@2 (FieldTypeInv0 (type p))))
 (=> (and (and (= (type p) (FieldType A@@2 FrameTypeType)) (= (type v_1) FrameTypeType)) (= (type w) FrameTypeType)) (not (InsidePredicate p v_1 p w))))
 :qid |stdinbpl.173:19|
 :skolemid |21|
 :pattern ( (InsidePredicate p v_1 p w))
)))
(assert (forall ((arg1@@19 Bool) (arg2@@13 T@U) (arg3@@11 Real) (arg4@@9 T@U) (arg5@@8 Int) ) (!  (=> (and (= (type arg2@@13) RefType) (= (type arg4@@9) RefType)) (IsWandField (wand_1 arg1@@19 arg2@@13 arg3@@11 arg4@@9 arg5@@8)))
 :qid |stdinbpl.218:15|
 :skolemid |29|
 :pattern ( (wand_1 arg1@@19 arg2@@13 arg3@@11 arg4@@9 arg5@@8))
)))
(assert (forall ((arg0@@31 Bool) (arg1@@20 T@U) (arg2@@14 Real) (arg3@@12 T@U) (arg4@@10 Int) ) (! (= (type (|wand_1#ft| arg0@@31 arg1@@20 arg2@@14 arg3@@12 arg4@@10)) (FieldType WandType_wand_1Type FrameTypeType))
 :qid |funType:wand_1#ft|
 :pattern ( (|wand_1#ft| arg0@@31 arg1@@20 arg2@@14 arg3@@12 arg4@@10))
)))
(assert (forall ((arg1@@21 Bool) (arg2@@15 T@U) (arg3@@13 Real) (arg4@@11 T@U) (arg5@@9 Int) ) (!  (=> (and (= (type arg2@@15) RefType) (= (type arg4@@11) RefType)) (IsWandField (|wand_1#ft| arg1@@21 arg2@@15 arg3@@13 arg4@@11 arg5@@9)))
 :qid |stdinbpl.222:15|
 :skolemid |30|
 :pattern ( (|wand_1#ft| arg1@@21 arg2@@15 arg3@@13 arg4@@11 arg5@@9))
)))
(assert  (not (IsPredicateField f_7)))
(assert  (not (IsWandField f_7)))
(assert (forall ((Heap@@7 T@U) (ExhaleHeap@@3 T@U) (Mask@@4 T@U) ) (!  (=> (and (and (and (= (type Heap@@7) (MapType0Type RefType)) (= (type ExhaleHeap@@3) (MapType0Type RefType))) (= (type Mask@@4) (MapType1Type RefType realType))) (IdenticalOnKnownLocations Heap@@7 ExhaleHeap@@3 Mask@@4)) (succHeap Heap@@7 ExhaleHeap@@3))
 :qid |stdinbpl.83:15|
 :skolemid |10|
 :pattern ( (IdenticalOnKnownLocations Heap@@7 ExhaleHeap@@3 Mask@@4))
)))
(assert (forall ((arg1@@22 Bool) (arg2@@16 T@U) (arg3@@14 Real) (arg4@@12 T@U) (arg5@@10 Int) ) (!  (=> (and (= (type arg2@@16) RefType) (= (type arg4@@12) RefType)) (not (IsPredicateField (wand_1 arg1@@22 arg2@@16 arg3@@14 arg4@@12 arg5@@10))))
 :qid |stdinbpl.226:15|
 :skolemid |31|
 :pattern ( (wand_1 arg1@@22 arg2@@16 arg3@@14 arg4@@12 arg5@@10))
)))
(assert (forall ((arg1@@23 Bool) (arg2@@17 T@U) (arg3@@15 Real) (arg4@@13 T@U) (arg5@@11 Int) ) (!  (=> (and (= (type arg2@@17) RefType) (= (type arg4@@13) RefType)) (not (IsPredicateField (|wand_1#ft| arg1@@23 arg2@@17 arg3@@15 arg4@@13 arg5@@11))))
 :qid |stdinbpl.230:15|
 :skolemid |32|
 :pattern ( (|wand_1#ft| arg1@@23 arg2@@17 arg3@@15 arg4@@13 arg5@@11))
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
(assert  (and (forall ((arg0@@32 Real) (arg1@@24 T@U) ) (! (= (type (ConditionalFrame arg0@@32 arg1@@24)) FrameTypeType)
 :qid |funType:ConditionalFrame|
 :pattern ( (ConditionalFrame arg0@@32 arg1@@24))
)) (= (type EmptyFrame) FrameTypeType)))
(assert (forall ((p@@0 Real) (f_6 T@U) ) (!  (=> (= (type f_6) FrameTypeType) (= (ConditionalFrame p@@0 f_6) (ite (> p@@0 0.0) f_6 EmptyFrame)))
 :qid |stdinbpl.161:15|
 :skolemid |19|
 :pattern ( (ConditionalFrame p@@0 f_6))
)))
(assert (forall ((Heap@@8 T@U) (Mask@@5 T@U) (x@@14 T@U) ) (!  (=> (and (and (and (= (type Heap@@8) (MapType0Type RefType)) (= (type Mask@@5) (MapType1Type RefType realType))) (= (type x@@14) RefType)) (and (state Heap@@8 Mask@@5) (< AssumeFunctionsAbove 0))) (= (getAndTransform Heap@@8 x@@14) (+ (U_2_int (MapType0Select Heap@@8 x@@14 f_7)) 2)))
 :qid |stdinbpl.272:15|
 :skolemid |38|
 :pattern ( (state Heap@@8 Mask@@5) (getAndTransform Heap@@8 x@@14))
 :pattern ( (state Heap@@8 Mask@@5) (|getAndTransform#triggerStateless| x@@14) (|Cell#trigger| Heap@@8 (Cell x@@14)))
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
(assert (forall ((arg1@@25 T@U) (arg2@@18 Real) (arg3@@16 T@U) (arg4@@14 Real) (arg5@@12 T@U) (arg6@@7 Int) (arg7@@7 T@U) (arg8@@7 Real) (arg9@@7 T@U) (arg10@@4 Int) (arg1_2 T@U) (arg2_2 Real) (arg3_2 T@U) (arg4_2 Real) (arg5_2 T@U) (arg6_2 Int) (arg7_2 T@U) (arg8_2 Real) (arg9_2 T@U) (arg10_2 Int) ) (!  (=> (and (and (and (and (and (and (and (and (and (and (= (type arg1@@25) RefType) (= (type arg3@@16) RefType)) (= (type arg5@@12) RefType)) (= (type arg7@@7) RefType)) (= (type arg9@@7) RefType)) (= (type arg1_2) RefType)) (= (type arg3_2) RefType)) (= (type arg5_2) RefType)) (= (type arg7_2) RefType)) (= (type arg9_2) RefType)) (= (wand arg1@@25 arg2@@18 arg3@@16 arg4@@14 arg5@@12 arg6@@7 arg7@@7 arg8@@7 arg9@@7 arg10@@4) (wand arg1_2 arg2_2 arg3_2 arg4_2 arg5_2 arg6_2 arg7_2 arg8_2 arg9_2 arg10_2))) (and (= arg1@@25 arg1_2) (and (= arg2@@18 arg2_2) (and (= arg3@@16 arg3_2) (and (= arg4@@14 arg4_2) (and (= arg5@@12 arg5_2) (and (= arg6@@7 arg6_2) (and (= arg7@@7 arg7_2) (and (= arg8@@7 arg8_2) (and (= arg9@@7 arg9_2) (= arg10@@4 arg10_2)))))))))))
 :qid |stdinbpl.210:15|
 :skolemid |28|
 :pattern ( (wand arg1@@25 arg2@@18 arg3@@16 arg4@@14 arg5@@12 arg6@@7 arg7@@7 arg8@@7 arg9@@7 arg10@@4) (wand arg1_2 arg2_2 arg3_2 arg4_2 arg5_2 arg6_2 arg7_2 arg8_2 arg9_2 arg10_2))
)))
(assert (forall ((arg1@@26 Bool) (arg2@@19 T@U) (arg3@@17 Real) (arg4@@15 T@U) (arg5@@13 Int) (arg1_2@@0 Bool) (arg2_2@@0 T@U) (arg3_2@@0 Real) (arg4_2@@0 T@U) (arg5_2@@0 Int) ) (!  (=> (and (and (and (and (= (type arg2@@19) RefType) (= (type arg4@@15) RefType)) (= (type arg2_2@@0) RefType)) (= (type arg4_2@@0) RefType)) (= (wand_1 arg1@@26 arg2@@19 arg3@@17 arg4@@15 arg5@@13) (wand_1 arg1_2@@0 arg2_2@@0 arg3_2@@0 arg4_2@@0 arg5_2@@0))) (and (= arg1@@26 arg1_2@@0) (and (= arg2@@19 arg2_2@@0) (and (= arg3@@17 arg3_2@@0) (and (= arg4@@15 arg4_2@@0) (= arg5@@13 arg5_2@@0))))))
 :qid |stdinbpl.242:15|
 :skolemid |35|
 :pattern ( (wand_1 arg1@@26 arg2@@19 arg3@@17 arg4@@15 arg5@@13) (wand_1 arg1_2@@0 arg2_2@@0 arg3_2@@0 arg4_2@@0 arg5_2@@0))
)))
(assert (forall ((arg0@@33 Bool) (arg1@@27 T@U) (arg2@@20 Real) (arg3@@18 T@U) (arg4@@16 Int) ) (! (= (type (|wand_1#sm| arg0@@33 arg1@@27 arg2@@20 arg3@@18 arg4@@16)) (FieldType WandType_wand_1Type (MapType1Type RefType boolType)))
 :qid |funType:wand_1#sm|
 :pattern ( (|wand_1#sm| arg0@@33 arg1@@27 arg2@@20 arg3@@18 arg4@@16))
)))
(assert (forall ((arg1@@28 Bool) (arg2@@21 T@U) (arg3@@19 Real) (arg4@@17 T@U) (arg5@@14 Int) ) (!  (=> (and (= (type arg2@@21) RefType) (= (type arg4@@17) RefType)) (= (|wand_1#sm| arg1@@28 arg2@@21 arg3@@19 arg4@@17 arg5@@14) (WandMaskField (|wand_1#ft| arg1@@28 arg2@@21 arg3@@19 arg4@@17 arg5@@14))))
 :qid |stdinbpl.234:15|
 :skolemid |33|
 :pattern ( (WandMaskField (|wand_1#ft| arg1@@28 arg2@@21 arg3@@19 arg4@@17 arg5@@14)))
)))
(assert (forall ((Heap@@9 T@U) (ExhaleHeap@@4 T@U) (Mask@@7 T@U) (pm_f@@1 T@U) ) (! (let ((C@@1 (FieldTypeInv0 (type pm_f@@1))))
 (=> (and (and (and (and (and (= (type Heap@@9) (MapType0Type RefType)) (= (type ExhaleHeap@@4) (MapType0Type RefType))) (= (type Mask@@7) (MapType1Type RefType realType))) (= (type pm_f@@1) (FieldType C@@1 FrameTypeType))) (IdenticalOnKnownLocations Heap@@9 ExhaleHeap@@4 Mask@@7)) (and (HasDirectPerm Mask@@7 null pm_f@@1) (IsPredicateField pm_f@@1))) (forall ((o2 T@U) (f_2@@0 T@U) ) (! (let ((B@@5 (FieldTypeInv1 (type f_2@@0))))
(let ((A@@6 (FieldTypeInv0 (type f_2@@0))))
 (=> (and (and (= (type o2) RefType) (= (type f_2@@0) (FieldType A@@6 B@@5))) (U_2_bool (MapType1Select (MapType0Select Heap@@9 null (PredicateMaskField pm_f@@1)) o2 f_2@@0))) (= (MapType0Select Heap@@9 o2 f_2@@0) (MapType0Select ExhaleHeap@@4 o2 f_2@@0)))))
 :qid |stdinbpl.54:134|
 :skolemid |3|
 :pattern ( (MapType0Select ExhaleHeap@@4 o2 f_2@@0))
))))
 :qid |stdinbpl.52:19|
 :skolemid |4|
 :pattern ( (IdenticalOnKnownLocations Heap@@9 ExhaleHeap@@4 Mask@@7) (IsPredicateField pm_f@@1))
)))
(assert (forall ((Heap@@10 T@U) (ExhaleHeap@@5 T@U) (Mask@@8 T@U) (pm_f@@2 T@U) ) (! (let ((C@@2 (FieldTypeInv0 (type pm_f@@2))))
 (=> (and (and (and (and (and (= (type Heap@@10) (MapType0Type RefType)) (= (type ExhaleHeap@@5) (MapType0Type RefType))) (= (type Mask@@8) (MapType1Type RefType realType))) (= (type pm_f@@2) (FieldType C@@2 FrameTypeType))) (IdenticalOnKnownLocations Heap@@10 ExhaleHeap@@5 Mask@@8)) (and (HasDirectPerm Mask@@8 null pm_f@@2) (IsWandField pm_f@@2))) (forall ((o2@@0 T@U) (f_2@@1 T@U) ) (! (let ((B@@6 (FieldTypeInv1 (type f_2@@1))))
(let ((A@@7 (FieldTypeInv0 (type f_2@@1))))
 (=> (and (and (= (type o2@@0) RefType) (= (type f_2@@1) (FieldType A@@7 B@@6))) (U_2_bool (MapType1Select (MapType0Select Heap@@10 null (WandMaskField pm_f@@2)) o2@@0 f_2@@1))) (= (MapType0Select Heap@@10 o2@@0 f_2@@1) (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1)))))
 :qid |stdinbpl.67:129|
 :skolemid |6|
 :pattern ( (MapType0Select ExhaleHeap@@5 o2@@0 f_2@@1))
))))
 :qid |stdinbpl.65:19|
 :skolemid |7|
 :pattern ( (IdenticalOnKnownLocations Heap@@10 ExhaleHeap@@5 Mask@@8) (IsWandField pm_f@@2))
)))
(assert (forall ((x@@15 T@U) ) (!  (=> (= (type x@@15) RefType) (= (getPredWandId (Cell x@@15)) 0))
 :qid |stdinbpl.358:15|
 :skolemid |42|
 :pattern ( (Cell x@@15))
)))
(assert (forall ((Mask@@9 T@U) (o_2@@2 T@U) (f_4@@2 T@U) ) (! (let ((B@@7 (FieldTypeInv1 (type f_4@@2))))
(let ((A@@8 (FieldTypeInv0 (type f_4@@2))))
 (=> (and (and (and (= (type Mask@@9) (MapType1Type RefType realType)) (= (type o_2@@2) RefType)) (= (type f_4@@2) (FieldType A@@8 B@@7))) (GoodMask Mask@@9)) (and (>= (U_2_real (MapType1Select Mask@@9 o_2@@2 f_4@@2)) NoPerm) (=> (and (and (GoodMask Mask@@9) (not (IsPredicateField f_4@@2))) (not (IsWandField f_4@@2))) (<= (U_2_real (MapType1Select Mask@@9 o_2@@2 f_4@@2)) FullPerm))))))
 :qid |stdinbpl.128:22|
 :skolemid |16|
 :pattern ( (GoodMask Mask@@9) (MapType1Select Mask@@9 o_2@@2 f_4@@2))
)))
(assert (forall ((Heap@@11 T@U) (Mask@@10 T@U) (x@@16 T@U) ) (!  (=> (and (and (and (= (type Heap@@11) (MapType0Type RefType)) (= (type Mask@@10) (MapType1Type RefType realType))) (= (type x@@16) RefType)) (state Heap@@11 Mask@@10)) (= (|getAndTransform'| Heap@@11 x@@16) (|getAndTransform#frame| (MapType0Select Heap@@11 null (Cell x@@16)) x@@16)))
 :qid |stdinbpl.279:15|
 :skolemid |39|
 :pattern ( (state Heap@@11 Mask@@10) (|getAndTransform'| Heap@@11 x@@16))
)))
(assert (forall ((o T@U) (f T@U) (Heap@@12 T@U) ) (!  (=> (and (and (and (= (type o) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap@@12) (MapType0Type RefType))) (U_2_bool (MapType0Select Heap@@12 o $allocated))) (U_2_bool (MapType0Select Heap@@12 (MapType0Select Heap@@12 o f) $allocated)))
 :qid |stdinbpl.31:15|
 :skolemid |0|
 :pattern ( (MapType0Select Heap@@12 o f))
)))
(assert (forall ((x@@17 T@U) ) (!  (=> (= (type x@@17) RefType) (= (PredicateMaskField (Cell x@@17)) (|Cell#sm| x@@17)))
 :qid |stdinbpl.350:15|
 :skolemid |40|
 :pattern ( (PredicateMaskField (Cell x@@17)))
)))
(assert (forall ((Heap@@13 T@U) (o@@0 T@U) (f_3 T@U) (v T@U) ) (! (let ((B@@8 (type v)))
(let ((A@@9 (FieldTypeInv0 (type f_3))))
 (=> (and (and (= (type Heap@@13) (MapType0Type RefType)) (= (type o@@0) RefType)) (= (type f_3) (FieldType A@@9 B@@8))) (succHeap Heap@@13 (MapType0Store Heap@@13 o@@0 f_3 v)))))
 :qid |stdinbpl.78:22|
 :skolemid |9|
 :pattern ( (MapType0Store Heap@@13 o@@0 f_3 v))
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
 :qid |stdinbpl.168:25|
 :skolemid |20|
 :pattern ( (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
(assert (forall ((arg1@@29 T@U) (arg2@@22 Real) (arg3@@20 T@U) (arg4@@18 Real) (arg5@@15 T@U) (arg6@@8 Int) (arg7@@8 T@U) (arg8@@8 Real) (arg9@@8 T@U) (arg10@@5 Int) ) (!  (=> (and (and (and (and (= (type arg1@@29) RefType) (= (type arg3@@20) RefType)) (= (type arg5@@15) RefType)) (= (type arg7@@8) RefType)) (= (type arg9@@8) RefType)) (= (getPredWandId (wand arg1@@29 arg2@@22 arg3@@20 arg4@@18 arg5@@15 arg6@@8 arg7@@8 arg8@@8 arg9@@8 arg10@@5)) 1))
 :qid |stdinbpl.206:15|
 :skolemid |27|
 :pattern ( (wand arg1@@29 arg2@@22 arg3@@20 arg4@@18 arg5@@15 arg6@@8 arg7@@8 arg8@@8 arg9@@8 arg10@@5))
)))
(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun Ops_1Mask@2 () T@U)
(declare-fun x@@18 () T@U)
(declare-fun ResultMask@@0 () T@U)
(declare-fun Mask@3 () T@U)
(declare-fun b_1_1@25 () Bool)
(declare-fun b_3@6 () Bool)
(declare-fun ResultHeap () T@U)
(declare-fun Heap@1 () T@U)
(declare-fun Mask@2 () T@U)
(declare-fun b_1_1@24 () Bool)
(declare-fun neededTransfer@3 () Real)
(declare-fun Used_2Mask@3 () T@U)
(declare-fun initNeededTransfer@0 () Real)
(declare-fun b_4@0 () Bool)
(declare-fun b_4@1 () Bool)
(declare-fun b_4@2 () Bool)
(declare-fun Ops_1Mask@4 () T@U)
(declare-fun b_4@3 () Bool)
(declare-fun Ops_1Heap@4 () T@U)
(declare-fun Used_2Heap@0 () T@U)
(declare-fun b_4@4 () Bool)
(declare-fun takeTransfer@1 () Real)
(declare-fun Mask@0 () T@U)
(declare-fun neededTransfer@1 () Real)
(declare-fun b_3@3 () Bool)
(declare-fun Used_2Mask@1 () T@U)
(declare-fun Heap@@14 () T@U)
(declare-fun neededTransfer@2 () Real)
(declare-fun Used_2Mask@2 () T@U)
(declare-fun b_3@4 () Bool)
(declare-fun TempMask@1 () T@U)
(declare-fun b_3@5 () Bool)
(declare-fun Mask@1 () T@U)
(declare-fun newPMask@0 () T@U)
(declare-fun Heap@0 () T@U)
(declare-fun maskTransfer@1 () Real)
(declare-fun takeTransfer@0 () Real)
(declare-fun b_3@0 () Bool)
(declare-fun neededTransfer@0 () Real)
(declare-fun Used_2Mask@0 () T@U)
(declare-fun b_3@1 () Bool)
(declare-fun TempMask@0 () T@U)
(declare-fun b_3@2 () Bool)
(declare-fun Ops_1Mask@3 () T@U)
(declare-fun maskTransfer@0 () Real)
(declare-fun b_3 () Bool)
(declare-fun b_1_1@23 () Bool)
(declare-fun b_1_1@22 () Bool)
(declare-fun b_1_1@19 () Bool)
(declare-fun b_2_1@0 () Bool)
(declare-fun b_2_1 () Bool)
(declare-fun Used_1Heap@0 () T@U)
(declare-fun b_1_1@20 () Bool)
(declare-fun b_1_1@21 () Bool)
(declare-fun b_1_1@18 () Bool)
(declare-fun b_1_1@17 () Bool)
(declare-fun b_1_1@10 () Bool)
(declare-fun b_1_1@9 () Bool)
(declare-fun Ops_1Heap@2 () T@U)
(declare-fun b_1_1@11 () Bool)
(declare-fun FrameFragment (T@U) T@U)
(declare-fun UnfoldingMask@2 () T@U)
(declare-fun Ops_1Mask@1 () T@U)
(declare-fun b_1_1@12 () Bool)
(declare-fun UnfoldingMask@3 () T@U)
(declare-fun b_1_1@13 () Bool)
(declare-fun b_1_1@14 () Bool)
(declare-fun b_1_1@15 () Bool)
(declare-fun Ops_1Heap@3 () T@U)
(declare-fun b_1_1@16 () Bool)
(declare-fun UnfoldingMask@0 () T@U)
(declare-fun b_1_1@5 () Bool)
(declare-fun b_1_1@4 () Bool)
(declare-fun UnfoldingMask@1 () T@U)
(declare-fun b_1_1@6 () Bool)
(declare-fun Ops_1Heap@0 () T@U)
(declare-fun b_1_1@7 () Bool)
(declare-fun Ops_1Heap@1 () T@U)
(declare-fun b_1_1@8 () Bool)
(declare-fun b_1_1@2 () Bool)
(declare-fun b_1_1@3 () Bool)
(declare-fun b_1_1@0 () Bool)
(declare-fun Ops_1Mask@0 () T@U)
(declare-fun b_1_1@1 () Bool)
(declare-fun b_1_1 () Bool)
(declare-fun b_2@0 () Bool)
(declare-fun b_2 () Bool)
(declare-fun UsedHeap@0 () T@U)
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (= (type Mask@3) (MapType1Type RefType realType)) (= (type x@@18) RefType)) (= (type ResultHeap) (MapType0Type RefType))) (= (type Heap@1) (MapType0Type RefType))) (= (type Mask@2) (MapType1Type RefType realType))) (= (type ResultMask@@0) (MapType1Type RefType realType))) (= (type Used_2Mask@3) (MapType1Type RefType realType))) (= (type Ops_1Mask@4) (MapType1Type RefType realType))) (= (type Ops_1Heap@4) (MapType0Type RefType))) (= (type Used_2Heap@0) (MapType0Type RefType))) (= (type Mask@0) (MapType1Type RefType realType))) (= (type Used_2Mask@1) (MapType1Type RefType realType))) (= (type Heap@@14) (MapType0Type RefType))) (= (type Used_2Mask@2) (MapType1Type RefType realType))) (= (type TempMask@1) (MapType1Type RefType realType))) (= (type Mask@1) (MapType1Type RefType realType))) (= (type newPMask@0) (MapType1Type RefType boolType))) (= (type Heap@0) (MapType0Type RefType))) (= (type Ops_1Mask@2) (MapType1Type RefType realType))) (= (type Used_2Mask@0) (MapType1Type RefType realType))) (= (type TempMask@0) (MapType1Type RefType realType))) (= (type Ops_1Mask@3) (MapType1Type RefType realType))) (= (type Used_1Heap@0) (MapType0Type RefType))) (= (type Ops_1Heap@0) (MapType0Type RefType))) (= (type Ops_1Mask@1) (MapType1Type RefType realType))) (= (type Ops_1Heap@2) (MapType0Type RefType))) (forall ((arg0@@34 T@U) ) (! (= (type (FrameFragment arg0@@34)) FrameTypeType)
 :qid |funType:FrameFragment|
 :pattern ( (FrameFragment arg0@@34))
))) (= (type UnfoldingMask@2) (MapType1Type RefType realType))) (= (type UnfoldingMask@3) (MapType1Type RefType realType))) (= (type Ops_1Heap@3) (MapType0Type RefType))) (= (type UnfoldingMask@0) (MapType1Type RefType realType))) (= (type UnfoldingMask@1) (MapType1Type RefType realType))) (= (type Ops_1Heap@1) (MapType0Type RefType))) (= (type Ops_1Mask@0) (MapType1Type RefType realType))) (= (type UsedHeap@0) (MapType0Type RefType))))
(set-info :boogie-vc-id test0)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 61) (let ((anon16_correct true))
(let ((anon50_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 41) 38)) anon16_correct)))
(let ((anon50_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 39) (- 0 40)) (<= FullPerm (U_2_real (MapType1Select Ops_1Mask@2 null (Cell x@@18))))) (=> (<= FullPerm (U_2_real (MapType1Select Ops_1Mask@2 null (Cell x@@18)))) (=> (= (ControlFlow 0 39) 38) anon16_correct))))))
(let ((anon37_correct true))
(let ((anon61_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 13) 10)) anon37_correct)))
(let ((anon61_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 11) (- 0 12)) (<= FullPerm (U_2_real (MapType1Select ResultMask@@0 null (Cell x@@18))))) (=> (<= FullPerm (U_2_real (MapType1Select ResultMask@@0 null (Cell x@@18)))) (=> (= (ControlFlow 0 11) 10) anon37_correct))))))
(let ((anon40_correct true))
(let ((anon62_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 5) 2)) anon40_correct)))
(let ((anon62_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 3) (- 0 4)) (<= FullPerm (U_2_real (MapType1Select Mask@3 null (Cell x@@18))))) (=> (<= FullPerm (U_2_real (MapType1Select Mask@3 null (Cell x@@18)))) (=> (= (ControlFlow 0 3) 2) anon40_correct))))))
(let ((anon38_correct  (and (=> (= (ControlFlow 0 6) (- 0 7)) (=> (and (and b_1_1@25 b_1_1@25) b_3@6) (= (getAndTransform ResultHeap x@@18) 2))) (=> (=> (and (and b_1_1@25 b_1_1@25) b_3@6) (= (getAndTransform ResultHeap x@@18) 2)) (=> (state Heap@1 Mask@2) (=> (and (and (= Mask@3 (MapType1Store Mask@2 null (wand x@@18 FullPerm x@@18 FullPerm x@@18 0 x@@18 FullPerm x@@18 2) (real_2_U (+ (U_2_real (MapType1Select Mask@2 null (wand x@@18 FullPerm x@@18 FullPerm x@@18 0 x@@18 FullPerm x@@18 2))) FullPerm)))) (state Heap@1 Mask@3)) (and (state Heap@1 Mask@3) (state Heap@1 Mask@3))) (and (=> (= (ControlFlow 0 6) 3) anon62_Then_correct) (=> (= (ControlFlow 0 6) 5) anon62_Else_correct))))))))
(let ((anon59_Then_correct  (=> b_1_1@25 (and (and (=> (= (ControlFlow 0 14) 6) anon38_correct) (=> (= (ControlFlow 0 14) 11) anon61_Then_correct)) (=> (= (ControlFlow 0 14) 13) anon61_Else_correct)))))
(let ((anon59_Else_correct  (=> (and (not b_1_1@25) (= (ControlFlow 0 9) 6)) anon38_correct)))
(let ((anon58_Then_correct  (=> (and (and b_1_1@25 b_1_1@25) b_3@6) (and (=> (= (ControlFlow 0 15) 14) anon59_Then_correct) (=> (= (ControlFlow 0 15) 9) anon59_Else_correct)))))
(let ((anon58_Else_correct  (=> (and (not (and (and b_1_1@25 b_1_1@25) b_3@6)) (= (ControlFlow 0 8) 6)) anon38_correct)))
(let ((anon32_correct  (and (=> (= (ControlFlow 0 16) (- 0 17)) (=> (and (and b_1_1@24 b_1_1@24) b_3@6) (and (= neededTransfer@3 0.0) (= (U_2_real (MapType1Select Used_2Mask@3 null (Cell x@@18))) initNeededTransfer@0)))) (=> (=> (and (and b_1_1@24 b_1_1@24) b_3@6) (and (= neededTransfer@3 0.0) (= (U_2_real (MapType1Select Used_2Mask@3 null (Cell x@@18))) initNeededTransfer@0))) (=> (and (= b_4@0  (and b_1_1@24 b_3@6)) (= b_4@1  (and b_4@0 (state ResultHeap ResultMask@@0)))) (=> (and (and (= b_4@2  (and b_4@1 (sumMask ResultMask@@0 Ops_1Mask@4 Used_2Mask@3))) (= b_4@3  (and (and b_4@2 (IdenticalOnKnownLocations Ops_1Heap@4 ResultHeap Ops_1Mask@4)) (IdenticalOnKnownLocations Used_2Heap@0 ResultHeap Used_2Mask@3)))) (and (= b_4@4  (and b_4@3 (state ResultHeap ResultMask@@0))) (= b_1_1@25  (and b_1_1@24 b_4@4)))) (and (=> (= (ControlFlow 0 16) 15) anon58_Then_correct) (=> (= (ControlFlow 0 16) 8) anon58_Else_correct))))))))
(let ((anon57_Else_correct  (=> (>= 0.0 takeTransfer@1) (=> (and (= Mask@2 Mask@0) (= neededTransfer@3 neededTransfer@1)) (=> (and (and (= b_3@6 b_3@3) (= Used_2Mask@3 Used_2Mask@1)) (and (= Heap@1 Heap@@14) (= (ControlFlow 0 20) 16))) anon32_correct)))))
(let ((anon57_Then_correct  (=> (> takeTransfer@1 0.0) (=> (and (= neededTransfer@2 (- neededTransfer@1 takeTransfer@1)) (= Used_2Mask@2 (MapType1Store Used_2Mask@1 null (Cell x@@18) (real_2_U (+ (U_2_real (MapType1Select Used_2Mask@1 null (Cell x@@18))) takeTransfer@1))))) (=> (and (and (= b_3@4  (and b_3@3 (state Used_2Heap@0 Used_2Mask@2))) (= TempMask@1 (MapType1Store ZeroMask null (Cell x@@18) (real_2_U FullPerm)))) (and (= b_3@5  (and b_3@4 (IdenticalOnKnownLocations Heap@@14 Used_2Heap@0 TempMask@1))) (= Mask@1 (MapType1Store Mask@0 null (Cell x@@18) (real_2_U (- (U_2_real (MapType1Select Mask@0 null (Cell x@@18))) takeTransfer@1)))))) (=> (and (and (and (forall ((o_3 T@U) (f_8 T@U) ) (! (let ((B@@11 (FieldTypeInv1 (type f_8))))
(let ((A@@12 (FieldTypeInv0 (type f_8))))
 (=> (and (and (= (type o_3) RefType) (= (type f_8) (FieldType A@@12 B@@11))) (or (U_2_bool (MapType1Select (MapType0Select Heap@@14 null (|wand#sm| x@@18 FullPerm x@@18 FullPerm x@@18 0 x@@18 FullPerm x@@18 2)) o_3 f_8)) (U_2_bool (MapType1Select (MapType0Select Heap@@14 null (|Cell#sm| x@@18)) o_3 f_8)))) (U_2_bool (MapType1Select newPMask@0 o_3 f_8)))))
 :qid |stdinbpl.642:35|
 :skolemid |46|
 :pattern ( (MapType1Select newPMask@0 o_3 f_8))
)) (= Heap@0 (MapType0Store Heap@@14 null (|wand#sm| x@@18 FullPerm x@@18 FullPerm x@@18 0 x@@18 FullPerm x@@18 2) newPMask@0))) (and (= Mask@2 Mask@1) (= neededTransfer@3 neededTransfer@2))) (and (and (= b_3@6 b_3@5) (= Used_2Mask@3 Used_2Mask@2)) (and (= Heap@1 Heap@0) (= (ControlFlow 0 19) 16)))) anon32_correct))))))
(let ((anon56_Else_correct  (=> (and (< maskTransfer@1 neededTransfer@1) (= takeTransfer@1 maskTransfer@1)) (and (=> (= (ControlFlow 0 22) 19) anon57_Then_correct) (=> (= (ControlFlow 0 22) 20) anon57_Else_correct)))))
(let ((anon56_Then_correct  (=> (and (<= neededTransfer@1 maskTransfer@1) (= takeTransfer@1 neededTransfer@1)) (and (=> (= (ControlFlow 0 21) 19) anon57_Then_correct) (=> (= (ControlFlow 0 21) 20) anon57_Else_correct)))))
(let ((anon55_Then_correct  (=> (and (and (and (and (and b_1_1@24 b_1_1@24) b_3@3) true) (> neededTransfer@1 0.0)) (= maskTransfer@1 (U_2_real (MapType1Select Mask@0 null (Cell x@@18))))) (and (=> (= (ControlFlow 0 23) 21) anon56_Then_correct) (=> (= (ControlFlow 0 23) 22) anon56_Else_correct)))))
(let ((anon55_Else_correct  (=> (not (and (and (and (and b_1_1@24 b_1_1@24) b_3@3) true) (> neededTransfer@1 0.0))) (=> (and (= Mask@2 Mask@0) (= neededTransfer@3 neededTransfer@1)) (=> (and (and (= b_3@6 b_3@3) (= Used_2Mask@3 Used_2Mask@1)) (and (= Heap@1 Heap@@14) (= (ControlFlow 0 18) 16))) anon32_correct)))))
(let ((anon54_Else_correct  (=> (>= 0.0 takeTransfer@0) (=> (and (and (= Ops_1Mask@4 Ops_1Mask@2) (= Used_2Mask@1 ZeroMask)) (and (= b_3@3 b_3@0) (= neededTransfer@1 FullPerm))) (and (=> (= (ControlFlow 0 26) 23) anon55_Then_correct) (=> (= (ControlFlow 0 26) 18) anon55_Else_correct))))))
(let ((anon54_Then_correct  (=> (> takeTransfer@0 0.0) (=> (and (= neededTransfer@0 (- FullPerm takeTransfer@0)) (= Used_2Mask@0 (MapType1Store ZeroMask null (Cell x@@18) (real_2_U (+ (U_2_real (MapType1Select ZeroMask null (Cell x@@18))) takeTransfer@0))))) (=> (and (and (and (= b_3@1  (and b_3@0 (state Used_2Heap@0 Used_2Mask@0))) (= TempMask@0 (MapType1Store ZeroMask null (Cell x@@18) (real_2_U FullPerm)))) (and (= b_3@2  (and b_3@1 (IdenticalOnKnownLocations Ops_1Heap@4 Used_2Heap@0 TempMask@0))) (= Ops_1Mask@3 (MapType1Store Ops_1Mask@2 null (Cell x@@18) (real_2_U (- (U_2_real (MapType1Select Ops_1Mask@2 null (Cell x@@18))) takeTransfer@0)))))) (and (and (= Ops_1Mask@4 Ops_1Mask@3) (= Used_2Mask@1 Used_2Mask@0)) (and (= b_3@3 b_3@2) (= neededTransfer@1 neededTransfer@0)))) (and (=> (= (ControlFlow 0 25) 23) anon55_Then_correct) (=> (= (ControlFlow 0 25) 18) anon55_Else_correct)))))))
(let ((anon53_Else_correct  (=> (and (< maskTransfer@0 FullPerm) (= takeTransfer@0 maskTransfer@0)) (and (=> (= (ControlFlow 0 28) 25) anon54_Then_correct) (=> (= (ControlFlow 0 28) 26) anon54_Else_correct)))))
(let ((anon53_Then_correct  (=> (and (<= FullPerm maskTransfer@0) (= takeTransfer@0 FullPerm)) (and (=> (= (ControlFlow 0 27) 25) anon54_Then_correct) (=> (= (ControlFlow 0 27) 26) anon54_Else_correct)))))
(let ((anon52_Then_correct  (=> (and (and (and (and (and b_1_1@24 b_1_1@24) b_3@0) true) (> FullPerm 0.0)) (= maskTransfer@0 (U_2_real (MapType1Select Ops_1Mask@2 null (Cell x@@18))))) (and (=> (= (ControlFlow 0 29) 27) anon53_Then_correct) (=> (= (ControlFlow 0 29) 28) anon53_Else_correct)))))
(let ((anon52_Else_correct  (=> (not (and (and (and (and b_1_1@24 b_1_1@24) b_3@0) true) (> FullPerm 0.0))) (=> (and (and (= Ops_1Mask@4 Ops_1Mask@2) (= Used_2Mask@1 ZeroMask)) (and (= b_3@3 b_3@0) (= neededTransfer@1 FullPerm))) (and (=> (= (ControlFlow 0 24) 23) anon55_Then_correct) (=> (= (ControlFlow 0 24) 18) anon55_Else_correct))))))
(let ((anon20_correct  (=> (and (= b_3@0  (and b_3 (state Used_2Heap@0 ZeroMask))) (= initNeededTransfer@0 (+ (U_2_real (MapType1Select ZeroMask null (Cell x@@18))) FullPerm))) (and (=> (= (ControlFlow 0 30) (- 0 31)) (>= FullPerm 0.0)) (=> (>= FullPerm 0.0) (and (=> (= (ControlFlow 0 30) 29) anon52_Then_correct) (=> (= (ControlFlow 0 30) 24) anon52_Else_correct)))))))
(let ((anon19_correct  (=> (= b_1_1@23  (and b_1_1@22 (state Ops_1Heap@4 Ops_1Mask@2))) (=> (and (= b_1_1@24 b_1_1@23) (= (ControlFlow 0 33) 30)) anon20_correct))))
(let ((anon51_Else_correct  (=> (not (=> b_1_1@19 (not (= (getAndTransform Ops_1Heap@4 x@@18) 2)))) (=> (and (= b_1_1@22 b_1_1@19) (= (ControlFlow 0 36) 33)) anon19_correct))))
(let ((anon51_Then_correct  (=> (and (=> b_1_1@19 (not (= (getAndTransform Ops_1Heap@4 x@@18) 2))) (= b_2_1@0  (and b_2_1 (state Used_1Heap@0 ZeroMask)))) (and (=> (= (ControlFlow 0 34) (- 0 35)) (=> (and b_1_1@19 b_2_1@0) false)) (=> (=> (and b_1_1@19 b_2_1@0) false) (=> (and (and (= b_1_1@20  (and b_1_1@19 b_2_1@0)) (= b_1_1@21  (and b_1_1@20 (state Ops_1Heap@4 Ops_1Mask@2)))) (and (= b_1_1@22 b_1_1@21) (= (ControlFlow 0 34) 33))) anon19_correct))))))
(let ((anon48_Then_correct  (=> b_1_1@19 (and (and (and (=> (= (ControlFlow 0 42) 34) anon51_Then_correct) (=> (= (ControlFlow 0 42) 36) anon51_Else_correct)) (=> (= (ControlFlow 0 42) 39) anon50_Then_correct)) (=> (= (ControlFlow 0 42) 41) anon50_Else_correct)))))
(let ((anon48_Else_correct  (=> (not b_1_1@19) (and (=> (= (ControlFlow 0 37) 34) anon51_Then_correct) (=> (= (ControlFlow 0 37) 36) anon51_Else_correct)))))
(let ((anon47_Then_correct  (=> b_1_1@19 (and (=> (= (ControlFlow 0 43) 42) anon48_Then_correct) (=> (= (ControlFlow 0 43) 37) anon48_Else_correct)))))
(let ((anon47_Else_correct  (=> (not b_1_1@19) (=> (and (= b_1_1@24 b_1_1@19) (= (ControlFlow 0 32) 30)) anon20_correct))))
(let ((anon11_correct  (=> (and (= b_1_1@18  (and b_1_1@17 (state Ops_1Heap@4 Ops_1Mask@2))) (= b_1_1@19  (and b_1_1@18 (state Ops_1Heap@4 Ops_1Mask@2)))) (and (=> (= (ControlFlow 0 44) 43) anon47_Then_correct) (=> (= (ControlFlow 0 44) 32) anon47_Else_correct)))))
(let ((anon10_correct  (=> (and (= b_1_1@10  (and b_1_1@9 (|Cell#trigger| Ops_1Heap@2 (Cell x@@18)))) (= b_1_1@11  (and b_1_1@10 (= (MapType0Select Ops_1Heap@2 null (Cell x@@18)) (FrameFragment (MapType0Select Ops_1Heap@2 x@@18 f_7)))))) (=> (and (and (= UnfoldingMask@2 (MapType1Store Ops_1Mask@1 null (Cell x@@18) (real_2_U (- (U_2_real (MapType1Select Ops_1Mask@1 null (Cell x@@18))) FullPerm)))) (= b_1_1@12  (and b_1_1@11 (not (= x@@18 null))))) (and (= UnfoldingMask@3 (MapType1Store UnfoldingMask@2 x@@18 f_7 (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@2 x@@18 f_7)) FullPerm)))) (= b_1_1@13  (and b_1_1@12 (state Ops_1Heap@2 UnfoldingMask@3))))) (=> (and (and (and (= b_1_1@14  (and b_1_1@13 (state Ops_1Heap@2 UnfoldingMask@3))) (= b_1_1@15  (and b_1_1@14 (= (U_2_int (MapType0Select Ops_1Heap@2 x@@18 f_7)) 0)))) (and (= Ops_1Heap@3 (MapType0Store Ops_1Heap@2 null (|Cell#sm| x@@18) (MapType1Store (MapType0Select Ops_1Heap@2 null (|Cell#sm| x@@18)) x@@18 f_7 (bool_2_U true)))) (= b_1_1@16  (and b_1_1@15 (state Ops_1Heap@3 Ops_1Mask@1))))) (and (and (= b_1_1@17 b_1_1@16) (= Ops_1Mask@2 Ops_1Mask@1)) (and (= Ops_1Heap@4 Ops_1Heap@3) (= (ControlFlow 0 47) 44)))) anon11_correct)))))
(let ((anon9_correct  (=> (= UnfoldingMask@0 (MapType1Store Ops_1Mask@1 null (Cell x@@18) (real_2_U (- (U_2_real (MapType1Select Ops_1Mask@1 null (Cell x@@18))) FullPerm)))) (=> (and (and (= b_1_1@5  (and b_1_1@4 (not (= x@@18 null)))) (= UnfoldingMask@1 (MapType1Store UnfoldingMask@0 x@@18 f_7 (real_2_U (+ (U_2_real (MapType1Select UnfoldingMask@0 x@@18 f_7)) FullPerm))))) (and (= b_1_1@6  (and b_1_1@5 (state Ops_1Heap@0 UnfoldingMask@1))) (= b_1_1@7  (and b_1_1@6 (state Ops_1Heap@0 UnfoldingMask@1))))) (and (=> (= (ControlFlow 0 49) (- 0 50)) (HasDirectPerm UnfoldingMask@1 x@@18 f_7)) (=> (HasDirectPerm UnfoldingMask@1 x@@18 f_7) (=> (= Ops_1Heap@1 (MapType0Store Ops_1Heap@0 null (|Cell#sm| x@@18) (MapType1Store (MapType0Select Ops_1Heap@0 null (|Cell#sm| x@@18)) x@@18 f_7 (bool_2_U true)))) (=> (and (and (= b_1_1@8  (and b_1_1@7 (state Ops_1Heap@1 Ops_1Mask@1))) (= Ops_1Heap@2 Ops_1Heap@1)) (and (= b_1_1@9 b_1_1@8) (= (ControlFlow 0 49) 47))) anon10_correct))))))))
(let ((anon46_Else_correct  (=> (and (= FullPerm NoPerm) (= (ControlFlow 0 53) 49)) anon9_correct)))
(let ((anon46_Then_correct  (=> (not (= FullPerm NoPerm)) (and (=> (= (ControlFlow 0 51) (- 0 52)) (<= FullPerm (U_2_real (MapType1Select Ops_1Mask@1 null (Cell x@@18))))) (=> (<= FullPerm (U_2_real (MapType1Select Ops_1Mask@1 null (Cell x@@18)))) (=> (= (ControlFlow 0 51) 49) anon9_correct))))))
(let ((anon45_Then_correct  (=> b_1_1@2 (=> (and (= b_1_1@3  (and b_1_1@2 (|Cell#trigger| Ops_1Heap@0 (Cell x@@18)))) (= b_1_1@4  (and b_1_1@3 (= (MapType0Select Ops_1Heap@0 null (Cell x@@18)) (FrameFragment (MapType0Select Ops_1Heap@0 x@@18 f_7)))))) (and (=> (= (ControlFlow 0 54) 51) anon46_Then_correct) (=> (= (ControlFlow 0 54) 53) anon46_Else_correct))))))
(let ((anon45_Else_correct  (=> (and (and (not b_1_1@2) (= Ops_1Heap@2 Ops_1Heap@0)) (and (= b_1_1@9 b_1_1@2) (= (ControlFlow 0 48) 47))) anon10_correct)))
(let ((anon44_Then_correct  (=> b_1_1@2 (and (=> (= (ControlFlow 0 55) 54) anon45_Then_correct) (=> (= (ControlFlow 0 55) 48) anon45_Else_correct)))))
(let ((anon44_Else_correct  (=> (not b_1_1@2) (=> (and (and (= b_1_1@17 b_1_1@2) (= Ops_1Mask@2 Ops_1Mask@1)) (and (= Ops_1Heap@4 Ops_1Heap@0) (= (ControlFlow 0 46) 44))) anon11_correct))))
(let ((anon43_Else_correct  (=> (not b_1_1@0) (=> (and (= Ops_1Mask@1 ZeroMask) (= b_1_1@2 b_1_1@0)) (and (=> (= (ControlFlow 0 57) 55) anon44_Then_correct) (=> (= (ControlFlow 0 57) 46) anon44_Else_correct))))))
(let ((anon43_Then_correct  (=> b_1_1@0 (=> (and (and (= Ops_1Mask@0 (MapType1Store ZeroMask null (Cell x@@18) (real_2_U (+ (U_2_real (MapType1Select ZeroMask null (Cell x@@18))) FullPerm)))) (= b_1_1@1  (and b_1_1@0 (state Ops_1Heap@0 Ops_1Mask@0)))) (and (= Ops_1Mask@1 Ops_1Mask@0) (= b_1_1@2 b_1_1@1))) (and (=> (= (ControlFlow 0 56) 55) anon44_Then_correct) (=> (= (ControlFlow 0 56) 46) anon44_Else_correct))))))
(let ((anon42_Then_correct  (=> b_1_1@0 (and (=> (= (ControlFlow 0 58) 56) anon43_Then_correct) (=> (= (ControlFlow 0 58) 57) anon43_Else_correct)))))
(let ((anon42_Else_correct  (=> (not b_1_1@0) (=> (and (and (= b_1_1@17 b_1_1@0) (= Ops_1Mask@2 ZeroMask)) (and (= Ops_1Heap@4 Ops_1Heap@0) (= (ControlFlow 0 45) 44))) anon11_correct))))
(let ((anon41_Else_correct  (=> (and (= b_1_1@0  (and b_1_1 (state Ops_1Heap@0 ZeroMask))) (= b_2@0  (and b_2 (state UsedHeap@0 ZeroMask)))) (and (=> (= (ControlFlow 0 59) 58) anon42_Then_correct) (=> (= (ControlFlow 0 59) 45) anon42_Else_correct)))))
(let ((anon41_Then_correct true))
(let ((anon0_correct  (=> (and (state Heap@@14 ZeroMask) (= AssumeFunctionsAbove (- 0 1))) (=> (and (and (U_2_bool (MapType0Select Heap@@14 x@@18 $allocated)) (= Mask@0 (MapType1Store ZeroMask null (Cell x@@18) (real_2_U (+ (U_2_real (MapType1Select ZeroMask null (Cell x@@18))) FullPerm))))) (and (state Heap@@14 Mask@0) (state Heap@@14 Mask@0))) (and (=> (= (ControlFlow 0 60) 1) anon41_Then_correct) (=> (= (ControlFlow 0 60) 59) anon41_Else_correct))))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 61) 60) anon0_correct)))
PreconditionGeneratedEntry_correct)))))))))))))))))))))))))))))))))))))))))))))))))))))
))
(check-sat)
(pop 1)
; Valid
(get-info :rlimit)
