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
(declare-fun WandMaskField (T@U) T@U)
(declare-fun |wand_2#ft| (T@U Real T@U Int T@U Real T@U Int) T@U)
(declare-fun |wand_2#sm| (T@U Real T@U Int T@U Real T@U Int) T@U)
(declare-fun MapType0Type (T@T T@T) T@T)
(declare-fun MapType0TypeInv0 (T@T) T@T)
(declare-fun MapType0TypeInv1 (T@T) T@T)
(declare-fun MapType0Select (T@U T@U T@U) T@U)
(declare-fun MapType0Store (T@U T@U T@U T@U) T@U)
(declare-fun WandType_wand_2Type () T@T)
(declare-fun FrameTypeType () T@T)
(declare-fun succHeap (T@U T@U) Bool)
(declare-fun MapType1Type (T@T) T@T)
(declare-fun succHeapTrans (T@U T@U) Bool)
(declare-fun MapType1TypeInv0 (T@T) T@T)
(declare-fun MapType1Select (T@U T@U T@U) T@U)
(declare-fun MapType1Store (T@U T@U T@U T@U) T@U)
(declare-fun wand_6 (T@U Real T@U Real) T@U)
(declare-fun getPredWandId (T@U) Int)
(declare-fun WandType_wand_6Type () T@T)
(declare-fun state (T@U T@U) Bool)
(declare-fun GoodMask (T@U) Bool)
(declare-fun wand_4 (Bool T@U Real) T@U)
(declare-fun IsWandField (T@U) Bool)
(declare-fun WandType_wand_4Type () T@T)
(declare-fun |wand_4#ft| (Bool T@U Real) T@U)
(declare-fun IsPredicateField (T@U) Bool)
(declare-fun wand_1 (Bool Bool) T@U)
(declare-fun WandType_wand_1Type () T@T)
(declare-fun |wand_1#ft| (Bool Bool) T@U)
(declare-fun IdenticalOnKnownLocations (T@U T@U T@U) Bool)
(declare-fun null () T@U)
(declare-fun PredicateMaskField (T@U) T@U)
(declare-fun HasDirectPerm (T@U T@U T@U) Bool)
(declare-fun Emp (T@U) T@U)
(declare-fun PredicateType_EmpType () T@T)
(declare-fun P (T@U) T@U)
(declare-fun PredicateType_PType () T@T)
(declare-fun Q (T@U) T@U)
(declare-fun PredicateType_QType () T@T)
(declare-fun |Emp#trigger| (T@U T@U) Bool)
(declare-fun |Emp#everUsed| (T@U) Bool)
(declare-fun |P#trigger| (T@U T@U) Bool)
(declare-fun |P#everUsed| (T@U) Bool)
(declare-fun |Q#trigger| (T@U T@U) Bool)
(declare-fun |Q#everUsed| (T@U) Bool)
(declare-fun |wand_5#ft| (T@U Real T@U Real T@U Real) T@U)
(declare-fun |wand_5#sm| (T@U Real T@U Real T@U Real) T@U)
(declare-fun WandType_wand_5Type () T@T)
(declare-fun |wand#ft| (T@U Real T@U Real T@U Int) T@U)
(declare-fun |wand#sm| (T@U Real T@U Real T@U Int) T@U)
(declare-fun WandType_wandType () T@T)
(declare-fun |wand_4#sm| (Bool T@U Real) T@U)
(declare-fun wand_3 (Bool T@U Real T@U Real) T@U)
(declare-fun WandType_wand_3Type () T@T)
(declare-fun |Emp#sm| (T@U) T@U)
(declare-fun |P#sm| (T@U) T@U)
(declare-fun |Q#sm| (T@U) T@U)
(declare-fun wand_2 (T@U Real T@U Int T@U Real T@U Int) T@U)
(declare-fun dummyHeap () T@U)
(declare-fun ZeroMask () T@U)
(declare-fun InsidePredicate (T@U T@U T@U T@U) Bool)
(declare-fun |wand_3#ft| (Bool T@U Real T@U Real) T@U)
(declare-fun sumMask (T@U T@U T@U) Bool)
(declare-fun |wand_6#ft| (T@U Real T@U Real) T@U)
(declare-fun wand_5 (T@U Real T@U Real T@U Real) T@U)
(declare-fun wand (T@U Real T@U Real T@U Int) T@U)
(declare-fun ConditionalFrame (Real T@U) T@U)
(declare-fun EmptyFrame () T@U)
(declare-fun NoPerm () Real)
(declare-fun |wand_6#sm| (T@U Real T@U Real) T@U)
(declare-fun |wand_3#sm| (Bool T@U Real T@U Real) T@U)
(declare-fun FullPerm () Real)
(declare-fun |wand_1#sm| (Bool Bool) T@U)
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
(assert  (and (and (and (and (and (and (and (and (and (and (and (forall ((arg0@@14 T@T) (arg1@@2 T@T) ) (! (= (Ctor (MapType0Type arg0@@14 arg1@@2)) 9)
 :qid |ctor:MapType0Type|
)) (forall ((arg0@@15 T@T) (arg1@@3 T@T) ) (! (= (MapType0TypeInv0 (MapType0Type arg0@@15 arg1@@3)) arg0@@15)
 :qid |typeInv:MapType0TypeInv0|
 :pattern ( (MapType0Type arg0@@15 arg1@@3))
))) (forall ((arg0@@16 T@T) (arg1@@4 T@T) ) (! (= (MapType0TypeInv1 (MapType0Type arg0@@16 arg1@@4)) arg1@@4)
 :qid |typeInv:MapType0TypeInv1|
 :pattern ( (MapType0Type arg0@@16 arg1@@4))
))) (forall ((arg0@@17 T@U) (arg1@@5 T@U) (arg2 T@U) ) (! (let ((aVar1 (MapType0TypeInv1 (type arg0@@17))))
(= (type (MapType0Select arg0@@17 arg1@@5 arg2)) aVar1))
 :qid |funType:MapType0Select|
 :pattern ( (MapType0Select arg0@@17 arg1@@5 arg2))
))) (forall ((arg0@@18 T@U) (arg1@@6 T@U) (arg2@@0 T@U) (arg3 T@U) ) (! (let ((aVar1@@0 (type arg3)))
(let ((aVar0 (type arg1@@6)))
(= (type (MapType0Store arg0@@18 arg1@@6 arg2@@0 arg3)) (MapType0Type aVar0 aVar1@@0))))
 :qid |funType:MapType0Store|
 :pattern ( (MapType0Store arg0@@18 arg1@@6 arg2@@0 arg3))
))) (forall ((m T@U) (x0 T@U) (x1 T@U) (val T@U) ) (! (let ((aVar1@@1 (MapType0TypeInv1 (type m))))
 (=> (= (type val) aVar1@@1) (= (MapType0Select (MapType0Store m x0 x1 val) x0 x1) val)))
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
)))) (forall ((arg0@@19 T@U) ) (! (let ((A (FieldTypeInv0 (type arg0@@19))))
(= (type (WandMaskField arg0@@19)) (FieldType A (MapType0Type RefType boolType))))
 :qid |funType:WandMaskField|
 :pattern ( (WandMaskField arg0@@19))
))) (= (Ctor WandType_wand_2Type) 10)) (= (Ctor FrameTypeType) 11)) (forall ((arg0@@20 T@U) (arg1@@7 Real) (arg2@@1 T@U) (arg3@@0 Int) (arg4 T@U) (arg5 Real) (arg6 T@U) (arg7 Int) ) (! (= (type (|wand_2#ft| arg0@@20 arg1@@7 arg2@@1 arg3@@0 arg4 arg5 arg6 arg7)) (FieldType WandType_wand_2Type FrameTypeType))
 :qid |funType:wand_2#ft|
 :pattern ( (|wand_2#ft| arg0@@20 arg1@@7 arg2@@1 arg3@@0 arg4 arg5 arg6 arg7))
))) (forall ((arg0@@21 T@U) (arg1@@8 Real) (arg2@@2 T@U) (arg3@@1 Int) (arg4@@0 T@U) (arg5@@0 Real) (arg6@@0 T@U) (arg7@@0 Int) ) (! (= (type (|wand_2#sm| arg0@@21 arg1@@8 arg2@@2 arg3@@1 arg4@@0 arg5@@0 arg6@@0 arg7@@0)) (FieldType WandType_wand_2Type (MapType0Type RefType boolType)))
 :qid |funType:wand_2#sm|
 :pattern ( (|wand_2#sm| arg0@@21 arg1@@8 arg2@@2 arg3@@1 arg4@@0 arg5@@0 arg6@@0 arg7@@0))
))))
(assert (forall ((arg1@@9 T@U) (arg2@@3 Real) (arg3@@2 T@U) (arg4@@1 Int) (arg5@@1 T@U) (arg6@@1 Real) (arg7@@1 T@U) (arg8 Int) ) (!  (=> (and (and (and (= (type arg1@@9) RefType) (= (type arg3@@2) RefType)) (= (type arg5@@1) RefType)) (= (type arg7@@1) RefType)) (= (|wand_2#sm| arg1@@9 arg2@@3 arg3@@2 arg4@@1 arg5@@1 arg6@@1 arg7@@1 arg8) (WandMaskField (|wand_2#ft| arg1@@9 arg2@@3 arg3@@2 arg4@@1 arg5@@1 arg6@@1 arg7@@1 arg8))))
 :qid |stdinbpl.295:15|
 :skolemid |47|
 :pattern ( (WandMaskField (|wand_2#ft| arg1@@9 arg2@@3 arg3@@2 arg4@@1 arg5@@1 arg6@@1 arg7@@1 arg8)))
)))
(assert  (and (and (and (and (and (forall ((arg0@@22 T@T) ) (! (= (Ctor (MapType1Type arg0@@22)) 12)
 :qid |ctor:MapType1Type|
)) (forall ((arg0@@23 T@T) ) (! (= (MapType1TypeInv0 (MapType1Type arg0@@23)) arg0@@23)
 :qid |typeInv:MapType1TypeInv0|
 :pattern ( (MapType1Type arg0@@23))
))) (forall ((arg0@@24 T@U) (arg1@@10 T@U) (arg2@@4 T@U) ) (! (let ((B (FieldTypeInv1 (type arg2@@4))))
(= (type (MapType1Select arg0@@24 arg1@@10 arg2@@4)) B))
 :qid |funType:MapType1Select|
 :pattern ( (MapType1Select arg0@@24 arg1@@10 arg2@@4))
))) (forall ((arg0@@25 T@U) (arg1@@11 T@U) (arg2@@5 T@U) (arg3@@3 T@U) ) (! (let ((aVar0@@0 (type arg1@@11)))
(= (type (MapType1Store arg0@@25 arg1@@11 arg2@@5 arg3@@3)) (MapType1Type aVar0@@0)))
 :qid |funType:MapType1Store|
 :pattern ( (MapType1Store arg0@@25 arg1@@11 arg2@@5 arg3@@3))
))) (forall ((m@@3 T@U) (x0@@3 T@U) (x1@@3 T@U) (val@@3 T@U) ) (! (let ((B@@0 (FieldTypeInv1 (type x1@@3))))
 (=> (= (type val@@3) B@@0) (= (MapType1Select (MapType1Store m@@3 x0@@3 x1@@3 val@@3) x0@@3 x1@@3) val@@3)))
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
(assert (forall ((Heap0 T@U) (Heap1 T@U) ) (!  (=> (and (and (= (type Heap0) (MapType1Type RefType)) (= (type Heap1) (MapType1Type RefType))) (succHeap Heap0 Heap1)) (succHeapTrans Heap0 Heap1))
 :qid |stdinbpl.88:15|
 :skolemid |11|
 :pattern ( (succHeap Heap0 Heap1))
)))
(assert  (and (= (Ctor WandType_wand_6Type) 13) (forall ((arg0@@26 T@U) (arg1@@12 Real) (arg2@@6 T@U) (arg3@@4 Real) ) (! (= (type (wand_6 arg0@@26 arg1@@12 arg2@@6 arg3@@4)) (FieldType WandType_wand_6Type intType))
 :qid |funType:wand_6|
 :pattern ( (wand_6 arg0@@26 arg1@@12 arg2@@6 arg3@@4))
))))
(assert (forall ((arg1@@13 T@U) (arg2@@7 Real) (arg3@@5 T@U) (arg4@@2 Real) ) (!  (=> (and (= (type arg1@@13) RefType) (= (type arg3@@5) RefType)) (= (getPredWandId (wand_6 arg1@@13 arg2@@7 arg3@@5 arg4@@2)) 3))
 :qid |stdinbpl.203:15|
 :skolemid |27|
 :pattern ( (wand_6 arg1@@13 arg2@@7 arg3@@5 arg4@@2))
)))
(assert (forall ((Heap T@U) (Mask T@U) ) (!  (=> (and (and (= (type Heap) (MapType1Type RefType)) (= (type Mask) (MapType0Type RefType realType))) (state Heap Mask)) (GoodMask Mask))
 :qid |stdinbpl.124:15|
 :skolemid |15|
 :pattern ( (state Heap Mask))
)))
(assert (forall ((Heap0@@0 T@U) (Heap1@@0 T@U) (Heap2 T@U) ) (!  (=> (and (and (and (= (type Heap0@@0) (MapType1Type RefType)) (= (type Heap1@@0) (MapType1Type RefType))) (= (type Heap2) (MapType1Type RefType))) (and (succHeapTrans Heap0@@0 Heap1@@0) (succHeap Heap1@@0 Heap2))) (succHeapTrans Heap0@@0 Heap2))
 :qid |stdinbpl.93:15|
 :skolemid |12|
 :pattern ( (succHeapTrans Heap0@@0 Heap1@@0) (succHeap Heap1@@0 Heap2))
)))
(assert  (and (= (Ctor WandType_wand_4Type) 14) (forall ((arg0@@27 Bool) (arg1@@14 T@U) (arg2@@8 Real) ) (! (= (type (wand_4 arg0@@27 arg1@@14 arg2@@8)) (FieldType WandType_wand_4Type intType))
 :qid |funType:wand_4|
 :pattern ( (wand_4 arg0@@27 arg1@@14 arg2@@8))
))))
(assert (forall ((arg1@@15 Bool) (arg2@@9 T@U) (arg3@@6 Real) ) (!  (=> (= (type arg2@@9) RefType) (IsWandField (wand_4 arg1@@15 arg2@@9 arg3@@6)))
 :qid |stdinbpl.247:15|
 :skolemid |36|
 :pattern ( (wand_4 arg1@@15 arg2@@9 arg3@@6))
)))
(assert (forall ((arg0@@28 Bool) (arg1@@16 T@U) (arg2@@10 Real) ) (! (= (type (|wand_4#ft| arg0@@28 arg1@@16 arg2@@10)) (FieldType WandType_wand_4Type FrameTypeType))
 :qid |funType:wand_4#ft|
 :pattern ( (|wand_4#ft| arg0@@28 arg1@@16 arg2@@10))
)))
(assert (forall ((arg1@@17 Bool) (arg2@@11 T@U) (arg3@@7 Real) ) (!  (=> (= (type arg2@@11) RefType) (IsWandField (|wand_4#ft| arg1@@17 arg2@@11 arg3@@7)))
 :qid |stdinbpl.251:15|
 :skolemid |37|
 :pattern ( (|wand_4#ft| arg1@@17 arg2@@11 arg3@@7))
)))
(assert (forall ((arg1@@18 Bool) (arg2@@12 T@U) (arg3@@8 Real) ) (!  (=> (= (type arg2@@12) RefType) (= (getPredWandId (wand_4 arg1@@18 arg2@@12 arg3@@8)) 5))
 :qid |stdinbpl.267:15|
 :skolemid |41|
 :pattern ( (wand_4 arg1@@18 arg2@@12 arg3@@8))
)))
(assert (forall ((arg1@@19 Bool) (arg2@@13 T@U) (arg3@@9 Real) ) (!  (=> (= (type arg2@@13) RefType) (not (IsPredicateField (wand_4 arg1@@19 arg2@@13 arg3@@9))))
 :qid |stdinbpl.255:15|
 :skolemid |38|
 :pattern ( (wand_4 arg1@@19 arg2@@13 arg3@@9))
)))
(assert (forall ((arg1@@20 Bool) (arg2@@14 T@U) (arg3@@10 Real) ) (!  (=> (= (type arg2@@14) RefType) (not (IsPredicateField (|wand_4#ft| arg1@@20 arg2@@14 arg3@@10))))
 :qid |stdinbpl.259:15|
 :skolemid |39|
 :pattern ( (|wand_4#ft| arg1@@20 arg2@@14 arg3@@10))
)))
(assert  (and (= (Ctor WandType_wand_1Type) 15) (forall ((arg0@@29 Bool) (arg1@@21 Bool) ) (! (= (type (wand_1 arg0@@29 arg1@@21)) (FieldType WandType_wand_1Type intType))
 :qid |funType:wand_1|
 :pattern ( (wand_1 arg0@@29 arg1@@21))
))))
(assert (forall ((arg1@@22 Bool) (arg2@@15 Bool) ) (! (IsWandField (wand_1 arg1@@22 arg2@@15))
 :qid |stdinbpl.375:15|
 :skolemid |64|
 :pattern ( (wand_1 arg1@@22 arg2@@15))
)))
(assert (forall ((arg0@@30 Bool) (arg1@@23 Bool) ) (! (= (type (|wand_1#ft| arg0@@30 arg1@@23)) (FieldType WandType_wand_1Type FrameTypeType))
 :qid |funType:wand_1#ft|
 :pattern ( (|wand_1#ft| arg0@@30 arg1@@23))
)))
(assert (forall ((arg1@@24 Bool) (arg2@@16 Bool) ) (! (IsWandField (|wand_1#ft| arg1@@24 arg2@@16))
 :qid |stdinbpl.379:15|
 :skolemid |65|
 :pattern ( (|wand_1#ft| arg1@@24 arg2@@16))
)))
(assert  (and (= (type null) RefType) (forall ((arg0@@31 T@U) ) (! (let ((A@@0 (FieldTypeInv0 (type arg0@@31))))
(= (type (PredicateMaskField arg0@@31)) (FieldType A@@0 (MapType0Type RefType boolType))))
 :qid |funType:PredicateMaskField|
 :pattern ( (PredicateMaskField arg0@@31))
))))
(assert (forall ((Heap@@0 T@U) (ExhaleHeap T@U) (Mask@@0 T@U) (pm_f T@U) ) (! (let ((C (FieldTypeInv0 (type pm_f))))
 (=> (and (and (and (and (and (= (type Heap@@0) (MapType1Type RefType)) (= (type ExhaleHeap) (MapType1Type RefType))) (= (type Mask@@0) (MapType0Type RefType realType))) (= (type pm_f) (FieldType C FrameTypeType))) (IdenticalOnKnownLocations Heap@@0 ExhaleHeap Mask@@0)) (and (HasDirectPerm Mask@@0 null pm_f) (IsPredicateField pm_f))) (= (MapType1Select Heap@@0 null (PredicateMaskField pm_f)) (MapType1Select ExhaleHeap null (PredicateMaskField pm_f)))))
 :qid |stdinbpl.47:19|
 :skolemid |2|
 :pattern ( (IdenticalOnKnownLocations Heap@@0 ExhaleHeap Mask@@0) (IsPredicateField pm_f) (MapType1Select ExhaleHeap null (PredicateMaskField pm_f)))
)))
(assert (forall ((Heap@@1 T@U) (ExhaleHeap@@0 T@U) (Mask@@1 T@U) (pm_f@@0 T@U) ) (! (let ((C@@0 (FieldTypeInv0 (type pm_f@@0))))
 (=> (and (and (and (and (and (= (type Heap@@1) (MapType1Type RefType)) (= (type ExhaleHeap@@0) (MapType1Type RefType))) (= (type Mask@@1) (MapType0Type RefType realType))) (= (type pm_f@@0) (FieldType C@@0 FrameTypeType))) (IdenticalOnKnownLocations Heap@@1 ExhaleHeap@@0 Mask@@1)) (and (HasDirectPerm Mask@@1 null pm_f@@0) (IsWandField pm_f@@0))) (= (MapType1Select Heap@@1 null (WandMaskField pm_f@@0)) (MapType1Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))))
 :qid |stdinbpl.60:19|
 :skolemid |5|
 :pattern ( (IdenticalOnKnownLocations Heap@@1 ExhaleHeap@@0 Mask@@1) (IsWandField pm_f@@0) (MapType1Select ExhaleHeap@@0 null (WandMaskField pm_f@@0)))
)))
(assert (forall ((arg1@@25 Bool) (arg2@@17 Bool) ) (!  (not (IsPredicateField (wand_1 arg1@@25 arg2@@17)))
 :qid |stdinbpl.383:15|
 :skolemid |66|
 :pattern ( (wand_1 arg1@@25 arg2@@17))
)))
(assert (forall ((arg1@@26 Bool) (arg2@@18 Bool) ) (!  (not (IsPredicateField (|wand_1#ft| arg1@@26 arg2@@18)))
 :qid |stdinbpl.387:15|
 :skolemid |67|
 :pattern ( (|wand_1#ft| arg1@@26 arg2@@18))
)))
(assert  (and (= (Ctor PredicateType_EmpType) 16) (forall ((arg0@@32 T@U) ) (! (= (type (Emp arg0@@32)) (FieldType PredicateType_EmpType FrameTypeType))
 :qid |funType:Emp|
 :pattern ( (Emp arg0@@32))
))))
(assert (forall ((l T@U) ) (!  (=> (= (type l) RefType) (IsPredicateField (Emp l)))
 :qid |stdinbpl.429:15|
 :skolemid |72|
 :pattern ( (Emp l))
)))
(assert  (and (= (Ctor PredicateType_PType) 17) (forall ((arg0@@33 T@U) ) (! (= (type (P arg0@@33)) (FieldType PredicateType_PType FrameTypeType))
 :qid |funType:P|
 :pattern ( (P arg0@@33))
))))
(assert (forall ((x@@8 T@U) ) (!  (=> (= (type x@@8) RefType) (IsPredicateField (P x@@8)))
 :qid |stdinbpl.477:15|
 :skolemid |78|
 :pattern ( (P x@@8))
)))
(assert  (and (= (Ctor PredicateType_QType) 18) (forall ((arg0@@34 T@U) ) (! (= (type (Q arg0@@34)) (FieldType PredicateType_QType FrameTypeType))
 :qid |funType:Q|
 :pattern ( (Q arg0@@34))
))))
(assert (forall ((x@@9 T@U) ) (!  (=> (= (type x@@9) RefType) (IsPredicateField (Q x@@9)))
 :qid |stdinbpl.550:15|
 :skolemid |84|
 :pattern ( (Q x@@9))
)))
(assert (forall ((Heap@@2 T@U) (l@@0 T@U) ) (!  (=> (and (= (type Heap@@2) (MapType1Type RefType)) (= (type l@@0) RefType)) (|Emp#everUsed| (Emp l@@0)))
 :qid |stdinbpl.448:15|
 :skolemid |76|
 :pattern ( (|Emp#trigger| Heap@@2 (Emp l@@0)))
)))
(assert (forall ((Heap@@3 T@U) (x@@10 T@U) ) (!  (=> (and (= (type Heap@@3) (MapType1Type RefType)) (= (type x@@10) RefType)) (|P#everUsed| (P x@@10)))
 :qid |stdinbpl.496:15|
 :skolemid |82|
 :pattern ( (|P#trigger| Heap@@3 (P x@@10)))
)))
(assert (forall ((Heap@@4 T@U) (x@@11 T@U) ) (!  (=> (and (= (type Heap@@4) (MapType1Type RefType)) (= (type x@@11) RefType)) (|Q#everUsed| (Q x@@11)))
 :qid |stdinbpl.569:15|
 :skolemid |88|
 :pattern ( (|Q#trigger| Heap@@4 (Q x@@11)))
)))
(assert  (and (and (= (Ctor WandType_wand_5Type) 19) (forall ((arg0@@35 T@U) (arg1@@27 Real) (arg2@@19 T@U) (arg3@@11 Real) (arg4@@3 T@U) (arg5@@2 Real) ) (! (= (type (|wand_5#ft| arg0@@35 arg1@@27 arg2@@19 arg3@@11 arg4@@3 arg5@@2)) (FieldType WandType_wand_5Type FrameTypeType))
 :qid |funType:wand_5#ft|
 :pattern ( (|wand_5#ft| arg0@@35 arg1@@27 arg2@@19 arg3@@11 arg4@@3 arg5@@2))
))) (forall ((arg0@@36 T@U) (arg1@@28 Real) (arg2@@20 T@U) (arg3@@12 Real) (arg4@@4 T@U) (arg5@@3 Real) ) (! (= (type (|wand_5#sm| arg0@@36 arg1@@28 arg2@@20 arg3@@12 arg4@@4 arg5@@3)) (FieldType WandType_wand_5Type (MapType0Type RefType boolType)))
 :qid |funType:wand_5#sm|
 :pattern ( (|wand_5#sm| arg0@@36 arg1@@28 arg2@@20 arg3@@12 arg4@@4 arg5@@3))
))))
(assert (forall ((arg1@@29 T@U) (arg2@@21 Real) (arg3@@13 T@U) (arg4@@5 Real) (arg5@@4 T@U) (arg6@@2 Real) ) (!  (=> (and (and (= (type arg1@@29) RefType) (= (type arg3@@13) RefType)) (= (type arg5@@4) RefType)) (= (|wand_5#sm| arg1@@29 arg2@@21 arg3@@13 arg4@@5 arg5@@4 arg6@@2) (WandMaskField (|wand_5#ft| arg1@@29 arg2@@21 arg3@@13 arg4@@5 arg5@@4 arg6@@2))))
 :qid |stdinbpl.231:15|
 :skolemid |33|
 :pattern ( (WandMaskField (|wand_5#ft| arg1@@29 arg2@@21 arg3@@13 arg4@@5 arg5@@4 arg6@@2)))
)))
(assert  (and (and (= (Ctor WandType_wandType) 20) (forall ((arg0@@37 T@U) (arg1@@30 Real) (arg2@@22 T@U) (arg3@@14 Real) (arg4@@6 T@U) (arg5@@5 Int) ) (! (= (type (|wand#ft| arg0@@37 arg1@@30 arg2@@22 arg3@@14 arg4@@6 arg5@@5)) (FieldType WandType_wandType FrameTypeType))
 :qid |funType:wand#ft|
 :pattern ( (|wand#ft| arg0@@37 arg1@@30 arg2@@22 arg3@@14 arg4@@6 arg5@@5))
))) (forall ((arg0@@38 T@U) (arg1@@31 Real) (arg2@@23 T@U) (arg3@@15 Real) (arg4@@7 T@U) (arg5@@6 Int) ) (! (= (type (|wand#sm| arg0@@38 arg1@@31 arg2@@23 arg3@@15 arg4@@7 arg5@@6)) (FieldType WandType_wandType (MapType0Type RefType boolType)))
 :qid |funType:wand#sm|
 :pattern ( (|wand#sm| arg0@@38 arg1@@31 arg2@@23 arg3@@15 arg4@@7 arg5@@6))
))))
(assert (forall ((arg1@@32 T@U) (arg2@@24 Real) (arg3@@16 T@U) (arg4@@8 Real) (arg5@@7 T@U) (arg6@@3 Int) ) (!  (=> (and (and (= (type arg1@@32) RefType) (= (type arg3@@16) RefType)) (= (type arg5@@7) RefType)) (= (|wand#sm| arg1@@32 arg2@@24 arg3@@16 arg4@@8 arg5@@7 arg6@@3) (WandMaskField (|wand#ft| arg1@@32 arg2@@24 arg3@@16 arg4@@8 arg5@@7 arg6@@3))))
 :qid |stdinbpl.327:15|
 :skolemid |54|
 :pattern ( (WandMaskField (|wand#ft| arg1@@32 arg2@@24 arg3@@16 arg4@@8 arg5@@7 arg6@@3)))
)))
(assert (forall ((arg0@@39 Bool) (arg1@@33 T@U) (arg2@@25 Real) ) (! (= (type (|wand_4#sm| arg0@@39 arg1@@33 arg2@@25)) (FieldType WandType_wand_4Type (MapType0Type RefType boolType)))
 :qid |funType:wand_4#sm|
 :pattern ( (|wand_4#sm| arg0@@39 arg1@@33 arg2@@25))
)))
(assert (forall ((arg1@@34 Bool) (arg2@@26 T@U) (arg3@@17 Real) ) (!  (=> (= (type arg2@@26) RefType) (= (|wand_4#sm| arg1@@34 arg2@@26 arg3@@17) (WandMaskField (|wand_4#ft| arg1@@34 arg2@@26 arg3@@17))))
 :qid |stdinbpl.263:15|
 :skolemid |40|
 :pattern ( (WandMaskField (|wand_4#ft| arg1@@34 arg2@@26 arg3@@17)))
)))
(assert (forall ((Heap@@5 T@U) (ExhaleHeap@@1 T@U) (Mask@@2 T@U) (o_1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@5) (MapType1Type RefType)) (= (type ExhaleHeap@@1) (MapType1Type RefType))) (= (type Mask@@2) (MapType0Type RefType realType))) (= (type o_1) RefType)) (IdenticalOnKnownLocations Heap@@5 ExhaleHeap@@1 Mask@@2)) (U_2_bool (MapType1Select Heap@@5 o_1 $allocated))) (U_2_bool (MapType1Select ExhaleHeap@@1 o_1 $allocated)))
 :qid |stdinbpl.73:15|
 :skolemid |8|
 :pattern ( (IdenticalOnKnownLocations Heap@@5 ExhaleHeap@@1 Mask@@2) (MapType1Select ExhaleHeap@@1 o_1 $allocated))
)))
(assert  (and (= (Ctor WandType_wand_3Type) 21) (forall ((arg0@@40 Bool) (arg1@@35 T@U) (arg2@@27 Real) (arg3@@18 T@U) (arg4@@9 Real) ) (! (= (type (wand_3 arg0@@40 arg1@@35 arg2@@27 arg3@@18 arg4@@9)) (FieldType WandType_wand_3Type intType))
 :qid |funType:wand_3|
 :pattern ( (wand_3 arg0@@40 arg1@@35 arg2@@27 arg3@@18 arg4@@9))
))))
(assert (forall ((arg1@@36 Bool) (arg2@@28 T@U) (arg3@@19 Real) (arg4@@10 T@U) (arg5@@8 Real) ) (!  (=> (and (= (type arg2@@28) RefType) (= (type arg4@@10) RefType)) (= (getPredWandId (wand_3 arg1@@36 arg2@@28 arg3@@19 arg4@@10 arg5@@8)) 8))
 :qid |stdinbpl.363:15|
 :skolemid |62|
 :pattern ( (wand_3 arg1@@36 arg2@@28 arg3@@19 arg4@@10 arg5@@8))
)))
(assert (forall ((l@@1 T@U) (l2 T@U) ) (!  (=> (and (and (= (type l@@1) RefType) (= (type l2) RefType)) (= (Emp l@@1) (Emp l2))) (= l@@1 l2))
 :qid |stdinbpl.439:15|
 :skolemid |74|
 :pattern ( (Emp l@@1) (Emp l2))
)))
(assert (forall ((arg0@@41 T@U) ) (! (= (type (|Emp#sm| arg0@@41)) (FieldType PredicateType_EmpType (MapType0Type RefType boolType)))
 :qid |funType:Emp#sm|
 :pattern ( (|Emp#sm| arg0@@41))
)))
(assert (forall ((l@@2 T@U) (l2@@0 T@U) ) (!  (=> (and (and (= (type l@@2) RefType) (= (type l2@@0) RefType)) (= (|Emp#sm| l@@2) (|Emp#sm| l2@@0))) (= l@@2 l2@@0))
 :qid |stdinbpl.443:15|
 :skolemid |75|
 :pattern ( (|Emp#sm| l@@2) (|Emp#sm| l2@@0))
)))
(assert (forall ((x@@12 T@U) (x2 T@U) ) (!  (=> (and (and (= (type x@@12) RefType) (= (type x2) RefType)) (= (P x@@12) (P x2))) (= x@@12 x2))
 :qid |stdinbpl.487:15|
 :skolemid |80|
 :pattern ( (P x@@12) (P x2))
)))
(assert (forall ((arg0@@42 T@U) ) (! (= (type (|P#sm| arg0@@42)) (FieldType PredicateType_PType (MapType0Type RefType boolType)))
 :qid |funType:P#sm|
 :pattern ( (|P#sm| arg0@@42))
)))
(assert (forall ((x@@13 T@U) (x2@@0 T@U) ) (!  (=> (and (and (= (type x@@13) RefType) (= (type x2@@0) RefType)) (= (|P#sm| x@@13) (|P#sm| x2@@0))) (= x@@13 x2@@0))
 :qid |stdinbpl.491:15|
 :skolemid |81|
 :pattern ( (|P#sm| x@@13) (|P#sm| x2@@0))
)))
(assert (forall ((x@@14 T@U) (x2@@1 T@U) ) (!  (=> (and (and (= (type x@@14) RefType) (= (type x2@@1) RefType)) (= (Q x@@14) (Q x2@@1))) (= x@@14 x2@@1))
 :qid |stdinbpl.560:15|
 :skolemid |86|
 :pattern ( (Q x@@14) (Q x2@@1))
)))
(assert (forall ((arg0@@43 T@U) ) (! (= (type (|Q#sm| arg0@@43)) (FieldType PredicateType_QType (MapType0Type RefType boolType)))
 :qid |funType:Q#sm|
 :pattern ( (|Q#sm| arg0@@43))
)))
(assert (forall ((x@@15 T@U) (x2@@2 T@U) ) (!  (=> (and (and (= (type x@@15) RefType) (= (type x2@@2) RefType)) (= (|Q#sm| x@@15) (|Q#sm| x2@@2))) (= x@@15 x2@@2))
 :qid |stdinbpl.564:15|
 :skolemid |87|
 :pattern ( (|Q#sm| x@@15) (|Q#sm| x2@@2))
)))
(assert (forall ((arg0@@44 T@U) (arg1@@37 Real) (arg2@@29 T@U) (arg3@@20 Int) (arg4@@11 T@U) (arg5@@9 Real) (arg6@@4 T@U) (arg7@@2 Int) ) (! (= (type (wand_2 arg0@@44 arg1@@37 arg2@@29 arg3@@20 arg4@@11 arg5@@9 arg6@@4 arg7@@2)) (FieldType WandType_wand_2Type intType))
 :qid |funType:wand_2|
 :pattern ( (wand_2 arg0@@44 arg1@@37 arg2@@29 arg3@@20 arg4@@11 arg5@@9 arg6@@4 arg7@@2))
)))
(assert (forall ((arg1@@38 T@U) (arg2@@30 Real) (arg3@@21 T@U) (arg4@@12 Int) (arg5@@10 T@U) (arg6@@5 Real) (arg7@@3 T@U) (arg8@@0 Int) ) (!  (=> (and (and (and (= (type arg1@@38) RefType) (= (type arg3@@21) RefType)) (= (type arg5@@10) RefType)) (= (type arg7@@3) RefType)) (IsWandField (wand_2 arg1@@38 arg2@@30 arg3@@21 arg4@@12 arg5@@10 arg6@@5 arg7@@3 arg8@@0)))
 :qid |stdinbpl.279:15|
 :skolemid |43|
 :pattern ( (wand_2 arg1@@38 arg2@@30 arg3@@21 arg4@@12 arg5@@10 arg6@@5 arg7@@3 arg8@@0))
)))
(assert (forall ((arg1@@39 T@U) (arg2@@31 Real) (arg3@@22 T@U) (arg4@@13 Int) (arg5@@11 T@U) (arg6@@6 Real) (arg7@@4 T@U) (arg8@@1 Int) ) (!  (=> (and (and (and (= (type arg1@@39) RefType) (= (type arg3@@22) RefType)) (= (type arg5@@11) RefType)) (= (type arg7@@4) RefType)) (IsWandField (|wand_2#ft| arg1@@39 arg2@@31 arg3@@22 arg4@@13 arg5@@11 arg6@@6 arg7@@4 arg8@@1)))
 :qid |stdinbpl.283:15|
 :skolemid |44|
 :pattern ( (|wand_2#ft| arg1@@39 arg2@@31 arg3@@22 arg4@@13 arg5@@11 arg6@@6 arg7@@4 arg8@@1))
)))
(assert (forall ((Heap@@6 T@U) (ExhaleHeap@@2 T@U) (Mask@@3 T@U) (o_1@@0 T@U) (f_2 T@U) ) (! (let ((B@@1 (FieldTypeInv1 (type f_2))))
(let ((A@@1 (FieldTypeInv0 (type f_2))))
 (=> (and (and (and (and (and (and (= (type Heap@@6) (MapType1Type RefType)) (= (type ExhaleHeap@@2) (MapType1Type RefType))) (= (type Mask@@3) (MapType0Type RefType realType))) (= (type o_1@@0) RefType)) (= (type f_2) (FieldType A@@1 B@@1))) (IdenticalOnKnownLocations Heap@@6 ExhaleHeap@@2 Mask@@3)) (HasDirectPerm Mask@@3 o_1@@0 f_2)) (= (MapType1Select Heap@@6 o_1@@0 f_2) (MapType1Select ExhaleHeap@@2 o_1@@0 f_2)))))
 :qid |stdinbpl.42:22|
 :skolemid |1|
 :pattern ( (IdenticalOnKnownLocations Heap@@6 ExhaleHeap@@2 Mask@@3) (MapType1Select ExhaleHeap@@2 o_1@@0 f_2))
)))
(assert (forall ((arg1@@40 T@U) (arg2@@32 Real) (arg3@@23 T@U) (arg4@@14 Int) (arg5@@12 T@U) (arg6@@7 Real) (arg7@@5 T@U) (arg8@@2 Int) ) (!  (=> (and (and (and (= (type arg1@@40) RefType) (= (type arg3@@23) RefType)) (= (type arg5@@12) RefType)) (= (type arg7@@5) RefType)) (not (IsPredicateField (wand_2 arg1@@40 arg2@@32 arg3@@23 arg4@@14 arg5@@12 arg6@@7 arg7@@5 arg8@@2))))
 :qid |stdinbpl.287:15|
 :skolemid |45|
 :pattern ( (wand_2 arg1@@40 arg2@@32 arg3@@23 arg4@@14 arg5@@12 arg6@@7 arg7@@5 arg8@@2))
)))
(assert (forall ((arg1@@41 T@U) (arg2@@33 Real) (arg3@@24 T@U) (arg4@@15 Int) (arg5@@13 T@U) (arg6@@8 Real) (arg7@@6 T@U) (arg8@@3 Int) ) (!  (=> (and (and (and (= (type arg1@@41) RefType) (= (type arg3@@24) RefType)) (= (type arg5@@13) RefType)) (= (type arg7@@6) RefType)) (not (IsPredicateField (|wand_2#ft| arg1@@41 arg2@@33 arg3@@24 arg4@@15 arg5@@13 arg6@@8 arg7@@6 arg8@@3))))
 :qid |stdinbpl.291:15|
 :skolemid |46|
 :pattern ( (|wand_2#ft| arg1@@41 arg2@@33 arg3@@24 arg4@@15 arg5@@13 arg6@@8 arg7@@6 arg8@@3))
)))
(assert  (and (= (type dummyHeap) (MapType1Type RefType)) (= (type ZeroMask) (MapType0Type RefType realType))))
(assert (state dummyHeap ZeroMask))
(assert (forall ((p T@U) (v_1 T@U) (w T@U) ) (! (let ((A@@2 (FieldTypeInv0 (type p))))
 (=> (and (and (= (type p) (FieldType A@@2 FrameTypeType)) (= (type v_1) FrameTypeType)) (= (type w) FrameTypeType)) (not (InsidePredicate p v_1 p w))))
 :qid |stdinbpl.170:19|
 :skolemid |21|
 :pattern ( (InsidePredicate p v_1 p w))
)))
(assert (forall ((arg1@@42 Bool) (arg2@@34 T@U) (arg3@@25 Real) (arg4@@16 T@U) (arg5@@14 Real) ) (!  (=> (and (= (type arg2@@34) RefType) (= (type arg4@@16) RefType)) (IsWandField (wand_3 arg1@@42 arg2@@34 arg3@@25 arg4@@16 arg5@@14)))
 :qid |stdinbpl.343:15|
 :skolemid |57|
 :pattern ( (wand_3 arg1@@42 arg2@@34 arg3@@25 arg4@@16 arg5@@14))
)))
(assert (forall ((arg0@@45 Bool) (arg1@@43 T@U) (arg2@@35 Real) (arg3@@26 T@U) (arg4@@17 Real) ) (! (= (type (|wand_3#ft| arg0@@45 arg1@@43 arg2@@35 arg3@@26 arg4@@17)) (FieldType WandType_wand_3Type FrameTypeType))
 :qid |funType:wand_3#ft|
 :pattern ( (|wand_3#ft| arg0@@45 arg1@@43 arg2@@35 arg3@@26 arg4@@17))
)))
(assert (forall ((arg1@@44 Bool) (arg2@@36 T@U) (arg3@@27 Real) (arg4@@18 T@U) (arg5@@15 Real) ) (!  (=> (and (= (type arg2@@36) RefType) (= (type arg4@@18) RefType)) (IsWandField (|wand_3#ft| arg1@@44 arg2@@36 arg3@@27 arg4@@18 arg5@@15)))
 :qid |stdinbpl.347:15|
 :skolemid |58|
 :pattern ( (|wand_3#ft| arg1@@44 arg2@@36 arg3@@27 arg4@@18 arg5@@15))
)))
(assert  (not (IsPredicateField f_7)))
(assert  (not (IsWandField f_7)))
(assert  (not (IsPredicateField g)))
(assert  (not (IsWandField g)))
(assert  (not (IsPredicateField h)))
(assert  (not (IsWandField h)))
(assert (forall ((Heap@@7 T@U) (ExhaleHeap@@3 T@U) (Mask@@4 T@U) ) (!  (=> (and (and (and (= (type Heap@@7) (MapType1Type RefType)) (= (type ExhaleHeap@@3) (MapType1Type RefType))) (= (type Mask@@4) (MapType0Type RefType realType))) (IdenticalOnKnownLocations Heap@@7 ExhaleHeap@@3 Mask@@4)) (succHeap Heap@@7 ExhaleHeap@@3))
 :qid |stdinbpl.83:15|
 :skolemid |10|
 :pattern ( (IdenticalOnKnownLocations Heap@@7 ExhaleHeap@@3 Mask@@4))
)))
(assert (forall ((arg1@@45 Bool) (arg2@@37 T@U) (arg3@@28 Real) (arg4@@19 T@U) (arg5@@16 Real) ) (!  (=> (and (= (type arg2@@37) RefType) (= (type arg4@@19) RefType)) (not (IsPredicateField (wand_3 arg1@@45 arg2@@37 arg3@@28 arg4@@19 arg5@@16))))
 :qid |stdinbpl.351:15|
 :skolemid |59|
 :pattern ( (wand_3 arg1@@45 arg2@@37 arg3@@28 arg4@@19 arg5@@16))
)))
(assert (forall ((arg1@@46 Bool) (arg2@@38 T@U) (arg3@@29 Real) (arg4@@20 T@U) (arg5@@17 Real) ) (!  (=> (and (= (type arg2@@38) RefType) (= (type arg4@@20) RefType)) (not (IsPredicateField (|wand_3#ft| arg1@@46 arg2@@38 arg3@@29 arg4@@20 arg5@@17))))
 :qid |stdinbpl.355:15|
 :skolemid |60|
 :pattern ( (|wand_3#ft| arg1@@46 arg2@@38 arg3@@29 arg4@@20 arg5@@17))
)))
(assert (forall ((ResultMask T@U) (SummandMask1 T@U) (SummandMask2 T@U) (o_2 T@U) (f_4 T@U) ) (! (let ((B@@2 (FieldTypeInv1 (type f_4))))
(let ((A@@3 (FieldTypeInv0 (type f_4))))
 (=> (and (and (and (and (and (= (type ResultMask) (MapType0Type RefType realType)) (= (type SummandMask1) (MapType0Type RefType realType))) (= (type SummandMask2) (MapType0Type RefType realType))) (= (type o_2) RefType)) (= (type f_4) (FieldType A@@3 B@@2))) (sumMask ResultMask SummandMask1 SummandMask2)) (= (U_2_real (MapType0Select ResultMask o_2 f_4)) (+ (U_2_real (MapType0Select SummandMask1 o_2 f_4)) (U_2_real (MapType0Select SummandMask2 o_2 f_4)))))))
 :qid |stdinbpl.138:22|
 :skolemid |18|
 :pattern ( (sumMask ResultMask SummandMask1 SummandMask2) (MapType0Select ResultMask o_2 f_4))
 :pattern ( (sumMask ResultMask SummandMask1 SummandMask2) (MapType0Select SummandMask1 o_2 f_4))
 :pattern ( (sumMask ResultMask SummandMask1 SummandMask2) (MapType0Select SummandMask2 o_2 f_4))
)))
(assert (forall ((arg1@@47 T@U) (arg2@@39 Real) (arg3@@30 T@U) (arg4@@21 Real) ) (!  (=> (and (= (type arg1@@47) RefType) (= (type arg3@@30) RefType)) (IsWandField (wand_6 arg1@@47 arg2@@39 arg3@@30 arg4@@21)))
 :qid |stdinbpl.183:15|
 :skolemid |22|
 :pattern ( (wand_6 arg1@@47 arg2@@39 arg3@@30 arg4@@21))
)))
(assert (forall ((arg0@@46 T@U) (arg1@@48 Real) (arg2@@40 T@U) (arg3@@31 Real) ) (! (= (type (|wand_6#ft| arg0@@46 arg1@@48 arg2@@40 arg3@@31)) (FieldType WandType_wand_6Type FrameTypeType))
 :qid |funType:wand_6#ft|
 :pattern ( (|wand_6#ft| arg0@@46 arg1@@48 arg2@@40 arg3@@31))
)))
(assert (forall ((arg1@@49 T@U) (arg2@@41 Real) (arg3@@32 T@U) (arg4@@22 Real) ) (!  (=> (and (= (type arg1@@49) RefType) (= (type arg3@@32) RefType)) (IsWandField (|wand_6#ft| arg1@@49 arg2@@41 arg3@@32 arg4@@22)))
 :qid |stdinbpl.187:15|
 :skolemid |23|
 :pattern ( (|wand_6#ft| arg1@@49 arg2@@41 arg3@@32 arg4@@22))
)))
(assert (forall ((arg0@@47 T@U) (arg1@@50 Real) (arg2@@42 T@U) (arg3@@33 Real) (arg4@@23 T@U) (arg5@@18 Real) ) (! (= (type (wand_5 arg0@@47 arg1@@50 arg2@@42 arg3@@33 arg4@@23 arg5@@18)) (FieldType WandType_wand_5Type intType))
 :qid |funType:wand_5|
 :pattern ( (wand_5 arg0@@47 arg1@@50 arg2@@42 arg3@@33 arg4@@23 arg5@@18))
)))
(assert (forall ((arg1@@51 T@U) (arg2@@43 Real) (arg3@@34 T@U) (arg4@@24 Real) (arg5@@19 T@U) (arg6@@9 Real) (arg1_2 T@U) (arg2_2 Real) (arg3_2 T@U) (arg4_2 Real) (arg5_2 T@U) (arg6_2 Real) ) (!  (=> (and (and (and (and (and (and (= (type arg1@@51) RefType) (= (type arg3@@34) RefType)) (= (type arg5@@19) RefType)) (= (type arg1_2) RefType)) (= (type arg3_2) RefType)) (= (type arg5_2) RefType)) (= (wand_5 arg1@@51 arg2@@43 arg3@@34 arg4@@24 arg5@@19 arg6@@9) (wand_5 arg1_2 arg2_2 arg3_2 arg4_2 arg5_2 arg6_2))) (and (= arg1@@51 arg1_2) (and (= arg2@@43 arg2_2) (and (= arg3@@34 arg3_2) (and (= arg4@@24 arg4_2) (and (= arg5@@19 arg5_2) (= arg6@@9 arg6_2)))))))
 :qid |stdinbpl.239:15|
 :skolemid |35|
 :pattern ( (wand_5 arg1@@51 arg2@@43 arg3@@34 arg4@@24 arg5@@19 arg6@@9) (wand_5 arg1_2 arg2_2 arg3_2 arg4_2 arg5_2 arg6_2))
)))
(assert (forall ((arg0@@48 T@U) (arg1@@52 Real) (arg2@@44 T@U) (arg3@@35 Real) (arg4@@25 T@U) (arg5@@20 Int) ) (! (= (type (wand arg0@@48 arg1@@52 arg2@@44 arg3@@35 arg4@@25 arg5@@20)) (FieldType WandType_wandType intType))
 :qid |funType:wand|
 :pattern ( (wand arg0@@48 arg1@@52 arg2@@44 arg3@@35 arg4@@25 arg5@@20))
)))
(assert (forall ((arg1@@53 T@U) (arg2@@45 Real) (arg3@@36 T@U) (arg4@@26 Real) (arg5@@21 T@U) (arg6@@10 Int) (arg1_2@@0 T@U) (arg2_2@@0 Real) (arg3_2@@0 T@U) (arg4_2@@0 Real) (arg5_2@@0 T@U) (arg6_2@@0 Int) ) (!  (=> (and (and (and (and (and (and (= (type arg1@@53) RefType) (= (type arg3@@36) RefType)) (= (type arg5@@21) RefType)) (= (type arg1_2@@0) RefType)) (= (type arg3_2@@0) RefType)) (= (type arg5_2@@0) RefType)) (= (wand arg1@@53 arg2@@45 arg3@@36 arg4@@26 arg5@@21 arg6@@10) (wand arg1_2@@0 arg2_2@@0 arg3_2@@0 arg4_2@@0 arg5_2@@0 arg6_2@@0))) (and (= arg1@@53 arg1_2@@0) (and (= arg2@@45 arg2_2@@0) (and (= arg3@@36 arg3_2@@0) (and (= arg4@@26 arg4_2@@0) (and (= arg5@@21 arg5_2@@0) (= arg6@@10 arg6_2@@0)))))))
 :qid |stdinbpl.335:15|
 :skolemid |56|
 :pattern ( (wand arg1@@53 arg2@@45 arg3@@36 arg4@@26 arg5@@21 arg6@@10) (wand arg1_2@@0 arg2_2@@0 arg3_2@@0 arg4_2@@0 arg5_2@@0 arg6_2@@0))
)))
(assert  (and (forall ((arg0@@49 Real) (arg1@@54 T@U) ) (! (= (type (ConditionalFrame arg0@@49 arg1@@54)) FrameTypeType)
 :qid |funType:ConditionalFrame|
 :pattern ( (ConditionalFrame arg0@@49 arg1@@54))
)) (= (type EmptyFrame) FrameTypeType)))
(assert (forall ((p@@0 Real) (f_6 T@U) ) (!  (=> (= (type f_6) FrameTypeType) (= (ConditionalFrame p@@0 f_6) (ite (> p@@0 0.0) f_6 EmptyFrame)))
 :qid |stdinbpl.158:15|
 :skolemid |19|
 :pattern ( (ConditionalFrame p@@0 f_6))
)))
(assert (forall ((arg1@@55 T@U) (arg2@@46 Real) (arg3@@37 T@U) (arg4@@27 Real) ) (!  (=> (and (= (type arg1@@55) RefType) (= (type arg3@@37) RefType)) (not (IsPredicateField (wand_6 arg1@@55 arg2@@46 arg3@@37 arg4@@27))))
 :qid |stdinbpl.191:15|
 :skolemid |24|
 :pattern ( (wand_6 arg1@@55 arg2@@46 arg3@@37 arg4@@27))
)))
(assert (forall ((arg1@@56 T@U) (arg2@@47 Real) (arg3@@38 T@U) (arg4@@28 Real) ) (!  (=> (and (= (type arg1@@56) RefType) (= (type arg3@@38) RefType)) (not (IsPredicateField (|wand_6#ft| arg1@@56 arg2@@47 arg3@@38 arg4@@28))))
 :qid |stdinbpl.195:15|
 :skolemid |25|
 :pattern ( (|wand_6#ft| arg1@@56 arg2@@47 arg3@@38 arg4@@28))
)))
(assert (forall ((Mask@@5 T@U) (o_2@@0 T@U) (f_4@@0 T@U) ) (! (let ((B@@3 (FieldTypeInv1 (type f_4@@0))))
(let ((A@@4 (FieldTypeInv0 (type f_4@@0))))
 (=> (and (and (= (type Mask@@5) (MapType0Type RefType realType)) (= (type o_2@@0) RefType)) (= (type f_4@@0) (FieldType A@@4 B@@3))) (= (HasDirectPerm Mask@@5 o_2@@0 f_4@@0) (> (U_2_real (MapType0Select Mask@@5 o_2@@0 f_4@@0)) NoPerm)))))
 :qid |stdinbpl.133:22|
 :skolemid |17|
 :pattern ( (HasDirectPerm Mask@@5 o_2@@0 f_4@@0))
)))
(assert (forall ((arg0@@50 T@U) (arg1@@57 Real) (arg2@@48 T@U) (arg3@@39 Real) ) (! (= (type (|wand_6#sm| arg0@@50 arg1@@57 arg2@@48 arg3@@39)) (FieldType WandType_wand_6Type (MapType0Type RefType boolType)))
 :qid |funType:wand_6#sm|
 :pattern ( (|wand_6#sm| arg0@@50 arg1@@57 arg2@@48 arg3@@39))
)))
(assert (forall ((arg1@@58 T@U) (arg2@@49 Real) (arg3@@40 T@U) (arg4@@29 Real) ) (!  (=> (and (= (type arg1@@58) RefType) (= (type arg3@@40) RefType)) (= (|wand_6#sm| arg1@@58 arg2@@49 arg3@@40 arg4@@29) (WandMaskField (|wand_6#ft| arg1@@58 arg2@@49 arg3@@40 arg4@@29))))
 :qid |stdinbpl.199:15|
 :skolemid |26|
 :pattern ( (WandMaskField (|wand_6#ft| arg1@@58 arg2@@49 arg3@@40 arg4@@29)))
)))
(assert (forall ((arg1@@59 T@U) (arg2@@50 Real) (arg3@@41 T@U) (arg4@@30 Real) (arg5@@22 T@U) (arg6@@11 Real) ) (!  (=> (and (and (= (type arg1@@59) RefType) (= (type arg3@@41) RefType)) (= (type arg5@@22) RefType)) (= (getPredWandId (wand_5 arg1@@59 arg2@@50 arg3@@41 arg4@@30 arg5@@22 arg6@@11)) 4))
 :qid |stdinbpl.235:15|
 :skolemid |34|
 :pattern ( (wand_5 arg1@@59 arg2@@50 arg3@@41 arg4@@30 arg5@@22 arg6@@11))
)))
(assert (forall ((arg1@@60 T@U) (arg2@@51 Real) (arg3@@42 T@U) (arg4@@31 Real) (arg5@@23 T@U) (arg6@@12 Int) ) (!  (=> (and (and (= (type arg1@@60) RefType) (= (type arg3@@42) RefType)) (= (type arg5@@23) RefType)) (= (getPredWandId (wand arg1@@60 arg2@@51 arg3@@42 arg4@@31 arg5@@23 arg6@@12)) 7))
 :qid |stdinbpl.331:15|
 :skolemid |55|
 :pattern ( (wand arg1@@60 arg2@@51 arg3@@42 arg4@@31 arg5@@23 arg6@@12))
)))
(assert (forall ((o_2@@1 T@U) (f_4@@1 T@U) ) (! (let ((B@@4 (FieldTypeInv1 (type f_4@@1))))
(let ((A@@5 (FieldTypeInv0 (type f_4@@1))))
 (=> (and (= (type o_2@@1) RefType) (= (type f_4@@1) (FieldType A@@5 B@@4))) (= (U_2_real (MapType0Select ZeroMask o_2@@1 f_4@@1)) NoPerm))))
 :qid |stdinbpl.106:22|
 :skolemid |13|
 :pattern ( (MapType0Select ZeroMask o_2@@1 f_4@@1))
)))
(assert (forall ((arg1@@61 T@U) (arg2@@52 Real) (arg3@@43 T@U) (arg4@@32 Int) (arg5@@24 T@U) (arg6@@13 Real) (arg7@@7 T@U) (arg8@@4 Int) (arg1_2@@1 T@U) (arg2_2@@1 Real) (arg3_2@@1 T@U) (arg4_2@@1 Int) (arg5_2@@1 T@U) (arg6_2@@1 Real) (arg7_2 T@U) (arg8_2 Int) ) (!  (=> (and (and (and (and (and (and (and (and (= (type arg1@@61) RefType) (= (type arg3@@43) RefType)) (= (type arg5@@24) RefType)) (= (type arg7@@7) RefType)) (= (type arg1_2@@1) RefType)) (= (type arg3_2@@1) RefType)) (= (type arg5_2@@1) RefType)) (= (type arg7_2) RefType)) (= (wand_2 arg1@@61 arg2@@52 arg3@@43 arg4@@32 arg5@@24 arg6@@13 arg7@@7 arg8@@4) (wand_2 arg1_2@@1 arg2_2@@1 arg3_2@@1 arg4_2@@1 arg5_2@@1 arg6_2@@1 arg7_2 arg8_2))) (and (= arg1@@61 arg1_2@@1) (and (= arg2@@52 arg2_2@@1) (and (= arg3@@43 arg3_2@@1) (and (= arg4@@32 arg4_2@@1) (and (= arg5@@24 arg5_2@@1) (and (= arg6@@13 arg6_2@@1) (and (= arg7@@7 arg7_2) (= arg8@@4 arg8_2)))))))))
 :qid |stdinbpl.303:15|
 :skolemid |49|
 :pattern ( (wand_2 arg1@@61 arg2@@52 arg3@@43 arg4@@32 arg5@@24 arg6@@13 arg7@@7 arg8@@4) (wand_2 arg1_2@@1 arg2_2@@1 arg3_2@@1 arg4_2@@1 arg5_2@@1 arg6_2@@1 arg7_2 arg8_2))
)))
(assert (forall ((arg1@@62 Bool) (arg2@@53 T@U) (arg3@@44 Real) (arg4@@33 T@U) (arg5@@25 Real) (arg1_2@@2 Bool) (arg2_2@@2 T@U) (arg3_2@@2 Real) (arg4_2@@2 T@U) (arg5_2@@2 Real) ) (!  (=> (and (and (and (and (= (type arg2@@53) RefType) (= (type arg4@@33) RefType)) (= (type arg2_2@@2) RefType)) (= (type arg4_2@@2) RefType)) (= (wand_3 arg1@@62 arg2@@53 arg3@@44 arg4@@33 arg5@@25) (wand_3 arg1_2@@2 arg2_2@@2 arg3_2@@2 arg4_2@@2 arg5_2@@2))) (and (= arg1@@62 arg1_2@@2) (and (= arg2@@53 arg2_2@@2) (and (= arg3@@44 arg3_2@@2) (and (= arg4@@33 arg4_2@@2) (= arg5@@25 arg5_2@@2))))))
 :qid |stdinbpl.367:15|
 :skolemid |63|
 :pattern ( (wand_3 arg1@@62 arg2@@53 arg3@@44 arg4@@33 arg5@@25) (wand_3 arg1_2@@2 arg2_2@@2 arg3_2@@2 arg4_2@@2 arg5_2@@2))
)))
(assert (forall ((arg1@@63 T@U) (arg2@@54 Real) (arg3@@45 T@U) (arg4@@34 Real) (arg5@@26 T@U) (arg6@@14 Real) ) (!  (=> (and (and (= (type arg1@@63) RefType) (= (type arg3@@45) RefType)) (= (type arg5@@26) RefType)) (IsWandField (wand_5 arg1@@63 arg2@@54 arg3@@45 arg4@@34 arg5@@26 arg6@@14)))
 :qid |stdinbpl.215:15|
 :skolemid |29|
 :pattern ( (wand_5 arg1@@63 arg2@@54 arg3@@45 arg4@@34 arg5@@26 arg6@@14))
)))
(assert (forall ((arg1@@64 T@U) (arg2@@55 Real) (arg3@@46 T@U) (arg4@@35 Real) (arg5@@27 T@U) (arg6@@15 Real) ) (!  (=> (and (and (= (type arg1@@64) RefType) (= (type arg3@@46) RefType)) (= (type arg5@@27) RefType)) (IsWandField (|wand_5#ft| arg1@@64 arg2@@55 arg3@@46 arg4@@35 arg5@@27 arg6@@15)))
 :qid |stdinbpl.219:15|
 :skolemid |30|
 :pattern ( (|wand_5#ft| arg1@@64 arg2@@55 arg3@@46 arg4@@35 arg5@@27 arg6@@15))
)))
(assert (forall ((arg1@@65 T@U) (arg2@@56 Real) (arg3@@47 T@U) (arg4@@36 Real) (arg5@@28 T@U) (arg6@@16 Int) ) (!  (=> (and (and (= (type arg1@@65) RefType) (= (type arg3@@47) RefType)) (= (type arg5@@28) RefType)) (IsWandField (wand arg1@@65 arg2@@56 arg3@@47 arg4@@36 arg5@@28 arg6@@16)))
 :qid |stdinbpl.311:15|
 :skolemid |50|
 :pattern ( (wand arg1@@65 arg2@@56 arg3@@47 arg4@@36 arg5@@28 arg6@@16))
)))
(assert (forall ((arg1@@66 T@U) (arg2@@57 Real) (arg3@@48 T@U) (arg4@@37 Real) (arg5@@29 T@U) (arg6@@17 Int) ) (!  (=> (and (and (= (type arg1@@66) RefType) (= (type arg3@@48) RefType)) (= (type arg5@@29) RefType)) (IsWandField (|wand#ft| arg1@@66 arg2@@57 arg3@@48 arg4@@37 arg5@@29 arg6@@17)))
 :qid |stdinbpl.315:15|
 :skolemid |51|
 :pattern ( (|wand#ft| arg1@@66 arg2@@57 arg3@@48 arg4@@37 arg5@@29 arg6@@17))
)))
(assert (forall ((arg1@@67 T@U) (arg2@@58 Real) (arg3@@49 T@U) (arg4@@38 Real) (arg5@@30 T@U) (arg6@@18 Real) ) (!  (=> (and (and (= (type arg1@@67) RefType) (= (type arg3@@49) RefType)) (= (type arg5@@30) RefType)) (not (IsPredicateField (wand_5 arg1@@67 arg2@@58 arg3@@49 arg4@@38 arg5@@30 arg6@@18))))
 :qid |stdinbpl.223:15|
 :skolemid |31|
 :pattern ( (wand_5 arg1@@67 arg2@@58 arg3@@49 arg4@@38 arg5@@30 arg6@@18))
)))
(assert (forall ((arg1@@68 T@U) (arg2@@59 Real) (arg3@@50 T@U) (arg4@@39 Real) (arg5@@31 T@U) (arg6@@19 Real) ) (!  (=> (and (and (= (type arg1@@68) RefType) (= (type arg3@@50) RefType)) (= (type arg5@@31) RefType)) (not (IsPredicateField (|wand_5#ft| arg1@@68 arg2@@59 arg3@@50 arg4@@39 arg5@@31 arg6@@19))))
 :qid |stdinbpl.227:15|
 :skolemid |32|
 :pattern ( (|wand_5#ft| arg1@@68 arg2@@59 arg3@@50 arg4@@39 arg5@@31 arg6@@19))
)))
(assert (forall ((arg1@@69 T@U) (arg2@@60 Real) (arg3@@51 T@U) (arg4@@40 Real) (arg5@@32 T@U) (arg6@@20 Int) ) (!  (=> (and (and (= (type arg1@@69) RefType) (= (type arg3@@51) RefType)) (= (type arg5@@32) RefType)) (not (IsPredicateField (wand arg1@@69 arg2@@60 arg3@@51 arg4@@40 arg5@@32 arg6@@20))))
 :qid |stdinbpl.319:15|
 :skolemid |52|
 :pattern ( (wand arg1@@69 arg2@@60 arg3@@51 arg4@@40 arg5@@32 arg6@@20))
)))
(assert (forall ((arg1@@70 T@U) (arg2@@61 Real) (arg3@@52 T@U) (arg4@@41 Real) (arg5@@33 T@U) (arg6@@21 Int) ) (!  (=> (and (and (= (type arg1@@70) RefType) (= (type arg3@@52) RefType)) (= (type arg5@@33) RefType)) (not (IsPredicateField (|wand#ft| arg1@@70 arg2@@61 arg3@@52 arg4@@41 arg5@@33 arg6@@21))))
 :qid |stdinbpl.323:15|
 :skolemid |53|
 :pattern ( (|wand#ft| arg1@@70 arg2@@61 arg3@@52 arg4@@41 arg5@@33 arg6@@21))
)))
(assert (forall ((arg0@@51 Bool) (arg1@@71 T@U) (arg2@@62 Real) (arg3@@53 T@U) (arg4@@42 Real) ) (! (= (type (|wand_3#sm| arg0@@51 arg1@@71 arg2@@62 arg3@@53 arg4@@42)) (FieldType WandType_wand_3Type (MapType0Type RefType boolType)))
 :qid |funType:wand_3#sm|
 :pattern ( (|wand_3#sm| arg0@@51 arg1@@71 arg2@@62 arg3@@53 arg4@@42))
)))
(assert (forall ((arg1@@72 Bool) (arg2@@63 T@U) (arg3@@54 Real) (arg4@@43 T@U) (arg5@@34 Real) ) (!  (=> (and (= (type arg2@@63) RefType) (= (type arg4@@43) RefType)) (= (|wand_3#sm| arg1@@72 arg2@@63 arg3@@54 arg4@@43 arg5@@34) (WandMaskField (|wand_3#ft| arg1@@72 arg2@@63 arg3@@54 arg4@@43 arg5@@34))))
 :qid |stdinbpl.359:15|
 :skolemid |61|
 :pattern ( (WandMaskField (|wand_3#ft| arg1@@72 arg2@@63 arg3@@54 arg4@@43 arg5@@34)))
)))
(assert (forall ((arg1@@73 Bool) (arg2@@64 Bool) (arg1_2@@3 Bool) (arg2_2@@3 Bool) ) (!  (=> (= (wand_1 arg1@@73 arg2@@64) (wand_1 arg1_2@@3 arg2_2@@3)) (and (= arg1@@73 arg1_2@@3) (= arg2@@64 arg2_2@@3)))
 :qid |stdinbpl.399:15|
 :skolemid |70|
 :pattern ( (wand_1 arg1@@73 arg2@@64) (wand_1 arg1_2@@3 arg2_2@@3))
)))
(assert (forall ((arg1@@74 T@U) (arg2@@65 Real) (arg3@@55 T@U) (arg4@@44 Int) (arg5@@35 T@U) (arg6@@22 Real) (arg7@@8 T@U) (arg8@@5 Int) ) (!  (=> (and (and (and (= (type arg1@@74) RefType) (= (type arg3@@55) RefType)) (= (type arg5@@35) RefType)) (= (type arg7@@8) RefType)) (= (getPredWandId (wand_2 arg1@@74 arg2@@65 arg3@@55 arg4@@44 arg5@@35 arg6@@22 arg7@@8 arg8@@5)) 6))
 :qid |stdinbpl.299:15|
 :skolemid |48|
 :pattern ( (wand_2 arg1@@74 arg2@@65 arg3@@55 arg4@@44 arg5@@35 arg6@@22 arg7@@8 arg8@@5))
)))
(assert (forall ((arg1@@75 Bool) (arg2@@66 T@U) (arg3@@56 Real) (arg1_2@@4 Bool) (arg2_2@@4 T@U) (arg3_2@@3 Real) ) (!  (=> (and (and (= (type arg2@@66) RefType) (= (type arg2_2@@4) RefType)) (= (wand_4 arg1@@75 arg2@@66 arg3@@56) (wand_4 arg1_2@@4 arg2_2@@4 arg3_2@@3))) (and (= arg1@@75 arg1_2@@4) (and (= arg2@@66 arg2_2@@4) (= arg3@@56 arg3_2@@3))))
 :qid |stdinbpl.271:15|
 :skolemid |42|
 :pattern ( (wand_4 arg1@@75 arg2@@66 arg3@@56) (wand_4 arg1_2@@4 arg2_2@@4 arg3_2@@3))
)))
(assert (forall ((arg1@@76 Bool) (arg2@@67 Bool) ) (! (= (getPredWandId (wand_1 arg1@@76 arg2@@67)) 9)
 :qid |stdinbpl.395:15|
 :skolemid |69|
 :pattern ( (wand_1 arg1@@76 arg2@@67))
)))
(assert (forall ((Heap@@8 T@U) (ExhaleHeap@@4 T@U) (Mask@@6 T@U) (pm_f@@1 T@U) ) (! (let ((C@@1 (FieldTypeInv0 (type pm_f@@1))))
 (=> (and (and (and (and (and (= (type Heap@@8) (MapType1Type RefType)) (= (type ExhaleHeap@@4) (MapType1Type RefType))) (= (type Mask@@6) (MapType0Type RefType realType))) (= (type pm_f@@1) (FieldType C@@1 FrameTypeType))) (IdenticalOnKnownLocations Heap@@8 ExhaleHeap@@4 Mask@@6)) (and (HasDirectPerm Mask@@6 null pm_f@@1) (IsPredicateField pm_f@@1))) (forall ((o2 T@U) (f_2@@0 T@U) ) (! (let ((B@@5 (FieldTypeInv1 (type f_2@@0))))
(let ((A@@6 (FieldTypeInv0 (type f_2@@0))))
 (=> (and (and (= (type o2) RefType) (= (type f_2@@0) (FieldType A@@6 B@@5))) (U_2_bool (MapType0Select (MapType1Select Heap@@8 null (PredicateMaskField pm_f@@1)) o2 f_2@@0))) (= (MapType1Select Heap@@8 o2 f_2@@0) (MapType1Select ExhaleHeap@@4 o2 f_2@@0)))))
 :qid |stdinbpl.54:134|
 :skolemid |3|
 :pattern ( (MapType1Select ExhaleHeap@@4 o2 f_2@@0))
))))
 :qid |stdinbpl.52:19|
 :skolemid |4|
 :pattern ( (IdenticalOnKnownLocations Heap@@8 ExhaleHeap@@4 Mask@@6) (IsPredicateField pm_f@@1))
)))
(assert (forall ((Heap@@9 T@U) (ExhaleHeap@@5 T@U) (Mask@@7 T@U) (pm_f@@2 T@U) ) (! (let ((C@@2 (FieldTypeInv0 (type pm_f@@2))))
 (=> (and (and (and (and (and (= (type Heap@@9) (MapType1Type RefType)) (= (type ExhaleHeap@@5) (MapType1Type RefType))) (= (type Mask@@7) (MapType0Type RefType realType))) (= (type pm_f@@2) (FieldType C@@2 FrameTypeType))) (IdenticalOnKnownLocations Heap@@9 ExhaleHeap@@5 Mask@@7)) (and (HasDirectPerm Mask@@7 null pm_f@@2) (IsWandField pm_f@@2))) (forall ((o2@@0 T@U) (f_2@@1 T@U) ) (! (let ((B@@6 (FieldTypeInv1 (type f_2@@1))))
(let ((A@@7 (FieldTypeInv0 (type f_2@@1))))
 (=> (and (and (= (type o2@@0) RefType) (= (type f_2@@1) (FieldType A@@7 B@@6))) (U_2_bool (MapType0Select (MapType1Select Heap@@9 null (WandMaskField pm_f@@2)) o2@@0 f_2@@1))) (= (MapType1Select Heap@@9 o2@@0 f_2@@1) (MapType1Select ExhaleHeap@@5 o2@@0 f_2@@1)))))
 :qid |stdinbpl.67:129|
 :skolemid |6|
 :pattern ( (MapType1Select ExhaleHeap@@5 o2@@0 f_2@@1))
))))
 :qid |stdinbpl.65:19|
 :skolemid |7|
 :pattern ( (IdenticalOnKnownLocations Heap@@9 ExhaleHeap@@5 Mask@@7) (IsWandField pm_f@@2))
)))
(assert (forall ((l@@3 T@U) ) (!  (=> (= (type l@@3) RefType) (= (getPredWandId (Emp l@@3)) 0))
 :qid |stdinbpl.433:15|
 :skolemid |73|
 :pattern ( (Emp l@@3))
)))
(assert (forall ((x@@16 T@U) ) (!  (=> (= (type x@@16) RefType) (= (getPredWandId (P x@@16)) 1))
 :qid |stdinbpl.481:15|
 :skolemid |79|
 :pattern ( (P x@@16))
)))
(assert (forall ((x@@17 T@U) ) (!  (=> (= (type x@@17) RefType) (= (getPredWandId (Q x@@17)) 2))
 :qid |stdinbpl.554:15|
 :skolemid |85|
 :pattern ( (Q x@@17))
)))
(assert (forall ((Mask@@8 T@U) (o_2@@2 T@U) (f_4@@2 T@U) ) (! (let ((B@@7 (FieldTypeInv1 (type f_4@@2))))
(let ((A@@8 (FieldTypeInv0 (type f_4@@2))))
 (=> (and (and (and (= (type Mask@@8) (MapType0Type RefType realType)) (= (type o_2@@2) RefType)) (= (type f_4@@2) (FieldType A@@8 B@@7))) (GoodMask Mask@@8)) (and (>= (U_2_real (MapType0Select Mask@@8 o_2@@2 f_4@@2)) NoPerm) (=> (and (and (GoodMask Mask@@8) (not (IsPredicateField f_4@@2))) (not (IsWandField f_4@@2))) (<= (U_2_real (MapType0Select Mask@@8 o_2@@2 f_4@@2)) FullPerm))))))
 :qid |stdinbpl.128:22|
 :skolemid |16|
 :pattern ( (GoodMask Mask@@8) (MapType0Select Mask@@8 o_2@@2 f_4@@2))
)))
(assert (forall ((o T@U) (f T@U) (Heap@@10 T@U) ) (!  (=> (and (and (and (= (type o) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap@@10) (MapType1Type RefType))) (U_2_bool (MapType1Select Heap@@10 o $allocated))) (U_2_bool (MapType1Select Heap@@10 (MapType1Select Heap@@10 o f) $allocated)))
 :qid |stdinbpl.31:15|
 :skolemid |0|
 :pattern ( (MapType1Select Heap@@10 o f))
)))
(assert (forall ((arg0@@52 Bool) (arg1@@77 Bool) ) (! (= (type (|wand_1#sm| arg0@@52 arg1@@77)) (FieldType WandType_wand_1Type (MapType0Type RefType boolType)))
 :qid |funType:wand_1#sm|
 :pattern ( (|wand_1#sm| arg0@@52 arg1@@77))
)))
(assert (forall ((arg1@@78 Bool) (arg2@@68 Bool) ) (! (= (|wand_1#sm| arg1@@78 arg2@@68) (WandMaskField (|wand_1#ft| arg1@@78 arg2@@68)))
 :qid |stdinbpl.391:15|
 :skolemid |68|
 :pattern ( (WandMaskField (|wand_1#ft| arg1@@78 arg2@@68)))
)))
(assert (forall ((l@@4 T@U) ) (!  (=> (= (type l@@4) RefType) (= (PredicateMaskField (Emp l@@4)) (|Emp#sm| l@@4)))
 :qid |stdinbpl.425:15|
 :skolemid |71|
 :pattern ( (PredicateMaskField (Emp l@@4)))
)))
(assert (forall ((x@@18 T@U) ) (!  (=> (= (type x@@18) RefType) (= (PredicateMaskField (P x@@18)) (|P#sm| x@@18)))
 :qid |stdinbpl.473:15|
 :skolemid |77|
 :pattern ( (PredicateMaskField (P x@@18)))
)))
(assert (forall ((x@@19 T@U) ) (!  (=> (= (type x@@19) RefType) (= (PredicateMaskField (Q x@@19)) (|Q#sm| x@@19)))
 :qid |stdinbpl.546:15|
 :skolemid |83|
 :pattern ( (PredicateMaskField (Q x@@19)))
)))
(assert (forall ((Heap@@11 T@U) (o@@0 T@U) (f_3 T@U) (v T@U) ) (! (let ((B@@8 (type v)))
(let ((A@@9 (FieldTypeInv0 (type f_3))))
 (=> (and (and (= (type Heap@@11) (MapType1Type RefType)) (= (type o@@0) RefType)) (= (type f_3) (FieldType A@@9 B@@8))) (succHeap Heap@@11 (MapType1Store Heap@@11 o@@0 f_3 v)))))
 :qid |stdinbpl.78:22|
 :skolemid |9|
 :pattern ( (MapType1Store Heap@@11 o@@0 f_3 v))
)))
(assert (= (type ZeroPMask) (MapType0Type RefType boolType)))
(assert (forall ((o_2@@3 T@U) (f_4@@3 T@U) ) (! (let ((B@@9 (FieldTypeInv1 (type f_4@@3))))
(let ((A@@10 (FieldTypeInv0 (type f_4@@3))))
 (=> (and (= (type o_2@@3) RefType) (= (type f_4@@3) (FieldType A@@10 B@@9))) (not (U_2_bool (MapType0Select ZeroPMask o_2@@3 f_4@@3))))))
 :qid |stdinbpl.112:22|
 :skolemid |14|
 :pattern ( (MapType0Select ZeroPMask o_2@@3 f_4@@3))
)))
(assert (forall ((p@@1 T@U) (v_1@@0 T@U) (q T@U) (w@@0 T@U) (r T@U) (u T@U) ) (! (let ((C@@3 (FieldTypeInv0 (type r))))
(let ((B@@10 (FieldTypeInv0 (type q))))
(let ((A@@11 (FieldTypeInv0 (type p@@1))))
 (=> (and (and (and (and (and (and (= (type p@@1) (FieldType A@@11 FrameTypeType)) (= (type v_1@@0) FrameTypeType)) (= (type q) (FieldType B@@10 FrameTypeType))) (= (type w@@0) FrameTypeType)) (= (type r) (FieldType C@@3 FrameTypeType))) (= (type u) FrameTypeType)) (and (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))) (InsidePredicate p@@1 v_1@@0 r u)))))
 :qid |stdinbpl.165:25|
 :skolemid |20|
 :pattern ( (InsidePredicate p@@1 v_1@@0 q w@@0) (InsidePredicate q w@@0 r u))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
(assert (forall ((arg1@@79 T@U) (arg2@@69 Real) (arg3@@57 T@U) (arg4@@45 Real) (arg1_2@@5 T@U) (arg2_2@@5 Real) (arg3_2@@4 T@U) (arg4_2@@3 Real) ) (!  (=> (and (and (and (and (= (type arg1@@79) RefType) (= (type arg3@@57) RefType)) (= (type arg1_2@@5) RefType)) (= (type arg3_2@@4) RefType)) (= (wand_6 arg1@@79 arg2@@69 arg3@@57 arg4@@45) (wand_6 arg1_2@@5 arg2_2@@5 arg3_2@@4 arg4_2@@3))) (and (= arg1@@79 arg1_2@@5) (and (= arg2@@69 arg2_2@@5) (and (= arg3@@57 arg3_2@@4) (= arg4@@45 arg4_2@@3)))))
 :qid |stdinbpl.207:15|
 :skolemid |28|
 :pattern ( (wand_6 arg1@@79 arg2@@69 arg3@@57 arg4@@45) (wand_6 arg1_2@@5 arg2_2@@5 arg3_2@@4 arg4_2@@3))
)))
(push 1)
(declare-fun ControlFlow (Int Int) Int)
(declare-fun b_17@26 () Bool)
(declare-fun b_22@12 () Bool)
(declare-fun neededTransfer@15 () Real)
(declare-fun Used_12Mask@7 () T@U)
(declare-fun arg_2@0 () T@U)
(declare-fun initNeededTransfer@3 () Real)
(declare-fun takeTransfer@7 () Real)
(declare-fun neededTransfer@13 () Real)
(declare-fun Heap@9 () T@U)
(declare-fun Heap@7 () T@U)
(declare-fun Mask@9 () T@U)
(declare-fun Mask@7 () T@U)
(declare-fun b_22@9 () Bool)
(declare-fun Used_12Mask@5 () T@U)
(declare-fun neededTransfer@14 () Real)
(declare-fun Used_12Mask@6 () T@U)
(declare-fun b_22@10 () Bool)
(declare-fun Used_12Heap@0 () T@U)
(declare-fun TempMask@3 () T@U)
(declare-fun b_22@11 () Bool)
(declare-fun Mask@8 () T@U)
(declare-fun newPMask@1 () T@U)
(declare-fun l@@5 () T@U)
(declare-fun Heap@8 () T@U)
(declare-fun maskTransfer@7 () Real)
(declare-fun takeTransfer@6 () Real)
(declare-fun Used_12Mask@3 () T@U)
(declare-fun b_22@6 () Bool)
(declare-fun neededTransfer@12 () Real)
(declare-fun Used_12Mask@4 () T@U)
(declare-fun b_22@7 () Bool)
(declare-fun TempMask@2 () T@U)
(declare-fun b_22@8 () Bool)
(declare-fun Ops_5Heap@5 () T@U)
(declare-fun Ops_5Mask@13 () T@U)
(declare-fun Ops_5Mask@12 () T@U)
(declare-fun maskTransfer@6 () Real)
(declare-fun Result_7Heap () T@U)
(declare-fun Result_7Mask () T@U)
(declare-fun b_17@25 () Bool)
(declare-fun neededTransfer@11 () Real)
(declare-fun initNeededTransfer@2 () Real)
(declare-fun b_23@0 () Bool)
(declare-fun b_23@1 () Bool)
(declare-fun b_23@2 () Bool)
(declare-fun b_23@3 () Bool)
(declare-fun b_23@4 () Bool)
(declare-fun takeTransfer@5 () Real)
(declare-fun neededTransfer@9 () Real)
(declare-fun Mask@5 () T@U)
(declare-fun Heap@5 () T@U)
(declare-fun b_22@3 () Bool)
(declare-fun Used_12Mask@1 () T@U)
(declare-fun neededTransfer@10 () Real)
(declare-fun Used_12Mask@2 () T@U)
(declare-fun b_22@4 () Bool)
(declare-fun b_22@5 () Bool)
(declare-fun Mask@6 () T@U)
(declare-fun Heap@6 () T@U)
(declare-fun maskTransfer@5 () Real)
(declare-fun takeTransfer@4 () Real)
(declare-fun Ops_5Mask@10 () T@U)
(declare-fun b_22@0 () Bool)
(declare-fun neededTransfer@8 () Real)
(declare-fun Used_12Mask@0 () T@U)
(declare-fun b_22@1 () Bool)
(declare-fun b_22@2 () Bool)
(declare-fun Ops_5Mask@11 () T@U)
(declare-fun maskTransfer@4 () Real)
(declare-fun b_22 () Bool)
(declare-fun Ops_5Heap@4 () T@U)
(declare-fun Ops_5Heap@3 () T@U)
(declare-fun Ops_5Mask@9 () T@U)
(declare-fun b_17@24 () Bool)
(declare-fun b_17@23 () Bool)
(declare-fun Heap@4 () T@U)
(declare-fun Mask@4 () T@U)
(declare-fun Ops_5Heap@0 () T@U)
(declare-fun Ops_5Heap@1 () T@U)
(declare-fun Ops_5Heap@2 () T@U)
(declare-fun freshVersion@0 () T@U)
(declare-fun b_17@19 () Bool)
(declare-fun b_20@6 () Bool)
(declare-fun Result_6Heap () T@U)
(declare-fun b_17@20 () Bool)
(declare-fun b_17@21 () Bool)
(declare-fun Used_11Heap@0 () T@U)
(declare-fun Ops_5Mask@8 () T@U)
(declare-fun b_17@22 () Bool)
(declare-fun FrameFragment (T@U) T@U)
(declare-fun Result_6Mask () T@U)
(declare-fun b_17@16 () Bool)
(declare-fun neededTransfer@7 () Real)
(declare-fun Used_11Mask@3 () T@U)
(declare-fun rcvLocal@0 () T@U)
(declare-fun initNeededTransfer@1 () Real)
(declare-fun b_21@0 () Bool)
(declare-fun b_21@1 () Bool)
(declare-fun b_21@2 () Bool)
(declare-fun b_21@3 () Bool)
(declare-fun b_21@4 () Bool)
(declare-fun b_17@17 () Bool)
(declare-fun b_17@18 () Bool)
(declare-fun takeTransfer@3 () Real)
(declare-fun Mask@2 () T@U)
(declare-fun neededTransfer@5 () Real)
(declare-fun Heap@2 () T@U)
(declare-fun b_20@3 () Bool)
(declare-fun Used_11Mask@1 () T@U)
(declare-fun neededTransfer@6 () Real)
(declare-fun Used_11Mask@2 () T@U)
(declare-fun b_20@4 () Bool)
(declare-fun b_20@5 () Bool)
(declare-fun Mask@3 () T@U)
(declare-fun Heap@3 () T@U)
(declare-fun maskTransfer@3 () Real)
(declare-fun takeTransfer@2 () Real)
(declare-fun Ops_5Mask@6 () T@U)
(declare-fun b_20@0 () Bool)
(declare-fun neededTransfer@4 () Real)
(declare-fun Used_11Mask@0 () T@U)
(declare-fun b_20@1 () Bool)
(declare-fun b_20@2 () Bool)
(declare-fun Ops_5Mask@7 () T@U)
(declare-fun maskTransfer@2 () Real)
(declare-fun b_20 () Bool)
(declare-fun b_17@4 () Bool)
(declare-fun b_18@6 () Bool)
(declare-fun neededTransfer@3 () Real)
(declare-fun Used_10Mask@3 () T@U)
(declare-fun initNeededTransfer@0 () Real)
(declare-fun b_19@0 () Bool)
(declare-fun b_19@1 () Bool)
(declare-fun Result_5Heap () T@U)
(declare-fun Result_5Mask () T@U)
(declare-fun b_19@2 () Bool)
(declare-fun Ops_5Mask@3 () T@U)
(declare-fun b_19@3 () Bool)
(declare-fun Used_10Heap@0 () T@U)
(declare-fun b_19@4 () Bool)
(declare-fun b_17@5 () Bool)
(declare-fun b_17@6 () Bool)
(declare-fun b_17@7 () Bool)
(declare-fun b_17@8 () Bool)
(declare-fun Ops_5Mask@4 () T@U)
(declare-fun b_17@9 () Bool)
(declare-fun b_17@10 () Bool)
(declare-fun b_17@11 () Bool)
(declare-fun Ops_5Mask@5 () T@U)
(declare-fun b_17@12 () Bool)
(declare-fun b_17@13 () Bool)
(declare-fun b_17@14 () Bool)
(declare-fun b_17@15 () Bool)
(declare-fun Mask@1 () T@U)
(declare-fun Heap@1 () T@U)
(declare-fun takeTransfer@1 () Real)
(declare-fun neededTransfer@1 () Real)
(declare-fun b_18@3 () Bool)
(declare-fun Used_10Mask@1 () T@U)
(declare-fun Heap@@12 () T@U)
(declare-fun neededTransfer@2 () Real)
(declare-fun Used_10Mask@2 () T@U)
(declare-fun b_18@4 () Bool)
(declare-fun TempMask@1 () T@U)
(declare-fun b_18@5 () Bool)
(declare-fun Mask@0 () T@U)
(declare-fun newPMask@0 () T@U)
(declare-fun Heap@0 () T@U)
(declare-fun maskTransfer@1 () Real)
(declare-fun takeTransfer@0 () Real)
(declare-fun Ops_5Mask@1 () T@U)
(declare-fun b_18@0 () Bool)
(declare-fun neededTransfer@0 () Real)
(declare-fun Used_10Mask@0 () T@U)
(declare-fun b_18@1 () Bool)
(declare-fun TempMask@0 () T@U)
(declare-fun b_18@2 () Bool)
(declare-fun Ops_5Mask@2 () T@U)
(declare-fun maskTransfer@0 () Real)
(declare-fun CombineFrames (T@U T@U) T@U)
(declare-fun b_18 () Bool)
(declare-fun b_17@3 () Bool)
(declare-fun b_17@2 () Bool)
(declare-fun b_17@0 () Bool)
(declare-fun Ops_5Mask@0 () T@U)
(declare-fun b_17@1 () Bool)
(declare-fun b_17 () Bool)
(declare-fun b_16@0 () Bool)
(declare-fun b_16 () Bool)
(declare-fun Used_9Heap@0 () T@U)
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (= (type Used_12Mask@7) (MapType0Type RefType realType)) (= (type arg_2@0) RefType)) (= (type Heap@9) (MapType1Type RefType))) (= (type Heap@7) (MapType1Type RefType))) (= (type Mask@9) (MapType0Type RefType realType))) (= (type Mask@7) (MapType0Type RefType realType))) (= (type Used_12Mask@5) (MapType0Type RefType realType))) (= (type Used_12Mask@6) (MapType0Type RefType realType))) (= (type Used_12Heap@0) (MapType1Type RefType))) (= (type TempMask@3) (MapType0Type RefType realType))) (= (type Mask@8) (MapType0Type RefType realType))) (= (type newPMask@1) (MapType0Type RefType boolType))) (= (type l@@5) RefType)) (= (type Heap@8) (MapType1Type RefType))) (= (type Used_12Mask@3) (MapType0Type RefType realType))) (= (type Used_12Mask@4) (MapType0Type RefType realType))) (= (type TempMask@2) (MapType0Type RefType realType))) (= (type Ops_5Heap@5) (MapType1Type RefType))) (= (type Ops_5Mask@13) (MapType0Type RefType realType))) (= (type Ops_5Mask@12) (MapType0Type RefType realType))) (= (type Result_7Heap) (MapType1Type RefType))) (= (type Result_7Mask) (MapType0Type RefType realType))) (= (type Mask@5) (MapType0Type RefType realType))) (= (type Heap@5) (MapType1Type RefType))) (= (type Used_12Mask@1) (MapType0Type RefType realType))) (= (type Used_12Mask@2) (MapType0Type RefType realType))) (= (type Mask@6) (MapType0Type RefType realType))) (= (type Heap@6) (MapType1Type RefType))) (= (type Ops_5Mask@10) (MapType0Type RefType realType))) (= (type Used_12Mask@0) (MapType0Type RefType realType))) (= (type Ops_5Mask@11) (MapType0Type RefType realType))) (= (type Ops_5Heap@0) (MapType1Type RefType))) (= (type Heap@2) (MapType1Type RefType))) (= (type Mask@2) (MapType0Type RefType realType))) (= (type Ops_5Mask@6) (MapType0Type RefType realType))) (= (type Ops_5Heap@4) (MapType1Type RefType))) (= (type Ops_5Heap@3) (MapType1Type RefType))) (= (type Ops_5Mask@9) (MapType0Type RefType realType))) (= (type Heap@4) (MapType1Type RefType))) (= (type Mask@4) (MapType0Type RefType realType))) (= (type Ops_5Heap@1) (MapType1Type RefType))) (= (type Ops_5Heap@2) (MapType1Type RefType))) (= (type freshVersion@0) FrameTypeType)) (= (type Result_6Heap) (MapType1Type RefType))) (= (type Used_11Heap@0) (MapType1Type RefType))) (= (type Ops_5Mask@8) (MapType0Type RefType realType))) (forall ((arg0@@53 T@U) ) (! (= (type (FrameFragment arg0@@53)) FrameTypeType)
 :qid |funType:FrameFragment|
 :pattern ( (FrameFragment arg0@@53))
))) (= (type Result_6Mask) (MapType0Type RefType realType))) (= (type Used_11Mask@3) (MapType0Type RefType realType))) (= (type rcvLocal@0) RefType)) (= (type Used_11Mask@1) (MapType0Type RefType realType))) (= (type Used_11Mask@2) (MapType0Type RefType realType))) (= (type Mask@3) (MapType0Type RefType realType))) (= (type Heap@3) (MapType1Type RefType))) (= (type Used_11Mask@0) (MapType0Type RefType realType))) (= (type Ops_5Mask@7) (MapType0Type RefType realType))) (= (type Ops_5Mask@1) (MapType0Type RefType realType))) (= (type Heap@@12) (MapType1Type RefType))) (= (type Used_10Mask@3) (MapType0Type RefType realType))) (= (type Result_5Heap) (MapType1Type RefType))) (= (type Result_5Mask) (MapType0Type RefType realType))) (= (type Ops_5Mask@3) (MapType0Type RefType realType))) (= (type Used_10Heap@0) (MapType1Type RefType))) (= (type Ops_5Mask@4) (MapType0Type RefType realType))) (= (type Ops_5Mask@5) (MapType0Type RefType realType))) (= (type Mask@1) (MapType0Type RefType realType))) (= (type Heap@1) (MapType1Type RefType))) (= (type Used_10Mask@1) (MapType0Type RefType realType))) (= (type Used_10Mask@2) (MapType0Type RefType realType))) (= (type TempMask@1) (MapType0Type RefType realType))) (= (type Mask@0) (MapType0Type RefType realType))) (= (type newPMask@0) (MapType0Type RefType boolType))) (= (type Heap@0) (MapType1Type RefType))) (= (type Used_10Mask@0) (MapType0Type RefType realType))) (= (type TempMask@0) (MapType0Type RefType realType))) (= (type Ops_5Mask@2) (MapType0Type RefType realType))) (forall ((arg0@@54 T@U) (arg1@@80 T@U) ) (! (= (type (CombineFrames arg0@@54 arg1@@80)) FrameTypeType)
 :qid |funType:CombineFrames|
 :pattern ( (CombineFrames arg0@@54 arg1@@80))
))) (= (type Ops_5Mask@0) (MapType0Type RefType realType))) (= (type Used_9Heap@0) (MapType1Type RefType))))
(set-info :boogie-vc-id test04)
(set-option :timeout 0)
(set-option :rlimit 0)
(assert (not
 (=> (= (ControlFlow 0 0) 97) (let ((anon67_correct  (=> (= (ControlFlow 0 2) (- 0 1)) (=> (and (and b_17@26 b_17@26) b_22@12) (and (= neededTransfer@15 0.0) (= (U_2_real (MapType0Select Used_12Mask@7 null (Q arg_2@0))) initNeededTransfer@3))))))
(let ((anon102_Else_correct  (=> (>= 0.0 takeTransfer@7) (=> (and (= neededTransfer@15 neededTransfer@13) (= Heap@9 Heap@7)) (=> (and (and (= Mask@9 Mask@7) (= b_22@12 b_22@9)) (and (= Used_12Mask@7 Used_12Mask@5) (= (ControlFlow 0 5) 2))) anon67_correct)))))
(let ((anon102_Then_correct  (=> (> takeTransfer@7 0.0) (=> (and (= neededTransfer@14 (- neededTransfer@13 takeTransfer@7)) (= Used_12Mask@6 (MapType0Store Used_12Mask@5 null (Q arg_2@0) (real_2_U (+ (U_2_real (MapType0Select Used_12Mask@5 null (Q arg_2@0))) takeTransfer@7))))) (=> (and (and (= b_22@10  (and b_22@9 (state Used_12Heap@0 Used_12Mask@6))) (= TempMask@3 (MapType0Store ZeroMask null (Q arg_2@0) (real_2_U FullPerm)))) (and (= b_22@11  (and b_22@10 (IdenticalOnKnownLocations Heap@7 Used_12Heap@0 TempMask@3))) (= Mask@8 (MapType0Store Mask@7 null (Q arg_2@0) (real_2_U (- (U_2_real (MapType0Select Mask@7 null (Q arg_2@0))) takeTransfer@7)))))) (=> (and (and (and (forall ((o_5 T@U) (f_10 T@U) ) (! (let ((B@@11 (FieldTypeInv1 (type f_10))))
(let ((A@@12 (FieldTypeInv0 (type f_10))))
 (=> (and (and (= (type o_5) RefType) (= (type f_10) (FieldType A@@12 B@@11))) (or (U_2_bool (MapType0Select (MapType1Select Heap@7 null (|wand_5#sm| l@@5 FullPerm l@@5 FullPerm l@@5 FullPerm)) o_5 f_10)) (U_2_bool (MapType0Select (MapType1Select Heap@7 null (|Q#sm| (MapType1Select Heap@7 l@@5 h))) o_5 f_10)))) (U_2_bool (MapType0Select newPMask@1 o_5 f_10)))))
 :qid |stdinbpl.1898:35|
 :skolemid |91|
 :pattern ( (MapType0Select newPMask@1 o_5 f_10))
)) (= Heap@8 (MapType1Store Heap@7 null (|wand_5#sm| l@@5 FullPerm l@@5 FullPerm l@@5 FullPerm) newPMask@1))) (and (= neededTransfer@15 neededTransfer@14) (= Heap@9 Heap@8))) (and (and (= Mask@9 Mask@8) (= b_22@12 b_22@11)) (and (= Used_12Mask@7 Used_12Mask@6) (= (ControlFlow 0 4) 2)))) anon67_correct))))))
(let ((anon101_Else_correct  (=> (and (< maskTransfer@7 neededTransfer@13) (= takeTransfer@7 maskTransfer@7)) (and (=> (= (ControlFlow 0 7) 4) anon102_Then_correct) (=> (= (ControlFlow 0 7) 5) anon102_Else_correct)))))
(let ((anon101_Then_correct  (=> (and (<= neededTransfer@13 maskTransfer@7) (= takeTransfer@7 neededTransfer@13)) (and (=> (= (ControlFlow 0 6) 4) anon102_Then_correct) (=> (= (ControlFlow 0 6) 5) anon102_Else_correct)))))
(let ((anon100_Then_correct  (=> (and (and (and (and (and b_17@26 b_17@26) b_22@9) true) (> neededTransfer@13 0.0)) (= maskTransfer@7 (U_2_real (MapType0Select Mask@7 null (Q arg_2@0))))) (and (=> (= (ControlFlow 0 8) 6) anon101_Then_correct) (=> (= (ControlFlow 0 8) 7) anon101_Else_correct)))))
(let ((anon100_Else_correct  (=> (not (and (and (and (and b_17@26 b_17@26) b_22@9) true) (> neededTransfer@13 0.0))) (=> (and (= neededTransfer@15 neededTransfer@13) (= Heap@9 Heap@7)) (=> (and (and (= Mask@9 Mask@7) (= b_22@12 b_22@9)) (and (= Used_12Mask@7 Used_12Mask@5) (= (ControlFlow 0 3) 2))) anon67_correct)))))
(let ((anon99_Else_correct  (=> (and (and (>= 0.0 takeTransfer@6) (= Used_12Mask@5 Used_12Mask@3)) (and (= b_22@9 b_22@6) (= neededTransfer@13 FullPerm))) (and (=> (= (ControlFlow 0 11) 8) anon100_Then_correct) (=> (= (ControlFlow 0 11) 3) anon100_Else_correct)))))
(let ((anon99_Then_correct  (=> (and (> takeTransfer@6 0.0) (= neededTransfer@12 (- FullPerm takeTransfer@6))) (=> (and (and (and (= Used_12Mask@4 (MapType0Store Used_12Mask@3 null (Q arg_2@0) (real_2_U (+ (U_2_real (MapType0Select Used_12Mask@3 null (Q arg_2@0))) takeTransfer@6)))) (= b_22@7  (and b_22@6 (state Used_12Heap@0 Used_12Mask@4)))) (and (= TempMask@2 (MapType0Store ZeroMask null (Q arg_2@0) (real_2_U FullPerm))) (= b_22@8  (and b_22@7 (IdenticalOnKnownLocations Ops_5Heap@5 Used_12Heap@0 TempMask@2))))) (and (and (= Ops_5Mask@13 (MapType0Store Ops_5Mask@12 null (Q arg_2@0) (real_2_U (- (U_2_real (MapType0Select Ops_5Mask@12 null (Q arg_2@0))) takeTransfer@6)))) (= Used_12Mask@5 Used_12Mask@4)) (and (= b_22@9 b_22@8) (= neededTransfer@13 neededTransfer@12)))) (and (=> (= (ControlFlow 0 10) 8) anon100_Then_correct) (=> (= (ControlFlow 0 10) 3) anon100_Else_correct))))))
(let ((anon98_Else_correct  (=> (and (< maskTransfer@6 FullPerm) (= takeTransfer@6 maskTransfer@6)) (and (=> (= (ControlFlow 0 13) 10) anon99_Then_correct) (=> (= (ControlFlow 0 13) 11) anon99_Else_correct)))))
(let ((anon98_Then_correct  (=> (and (<= FullPerm maskTransfer@6) (= takeTransfer@6 FullPerm)) (and (=> (= (ControlFlow 0 12) 10) anon99_Then_correct) (=> (= (ControlFlow 0 12) 11) anon99_Else_correct)))))
(let ((anon97_Then_correct  (=> (and (and (and (and (and b_17@26 b_17@26) b_22@6) true) (> FullPerm 0.0)) (= maskTransfer@6 (U_2_real (MapType0Select Ops_5Mask@12 null (Q arg_2@0))))) (and (=> (= (ControlFlow 0 14) 12) anon98_Then_correct) (=> (= (ControlFlow 0 14) 13) anon98_Else_correct)))))
(let ((anon97_Else_correct  (=> (and (and (not (and (and (and (and b_17@26 b_17@26) b_22@6) true) (> FullPerm 0.0))) (= Used_12Mask@5 Used_12Mask@3)) (and (= b_22@9 b_22@6) (= neededTransfer@13 FullPerm))) (and (=> (= (ControlFlow 0 9) 8) anon100_Then_correct) (=> (= (ControlFlow 0 9) 3) anon100_Else_correct)))))
(let ((anon55_correct  (=> (and (= arg_2@0 (MapType1Select Result_7Heap l@@5 h)) (= initNeededTransfer@3 (+ (U_2_real (MapType0Select Used_12Mask@3 null (Q arg_2@0))) FullPerm))) (and (=> (= (ControlFlow 0 15) (- 0 16)) (>= FullPerm 0.0)) (=> (>= FullPerm 0.0) (and (=> (= (ControlFlow 0 15) 14) anon97_Then_correct) (=> (= (ControlFlow 0 15) 9) anon97_Else_correct)))))))
(let ((anon96_Else_correct  (=> (and (not b_17@26) (= (ControlFlow 0 20) 15)) anon55_correct)))
(let ((anon96_Then_correct  (=> b_17@26 (and (=> (= (ControlFlow 0 18) (- 0 19)) (HasDirectPerm Result_7Mask l@@5 h)) (=> (HasDirectPerm Result_7Mask l@@5 h) (=> (= (ControlFlow 0 18) 15) anon55_correct))))))
(let ((anon95_Then_correct  (=> (and (and b_17@26 b_17@26) b_22@6) (and (=> (= (ControlFlow 0 21) 18) anon96_Then_correct) (=> (= (ControlFlow 0 21) 20) anon96_Else_correct)))))
(let ((anon95_Else_correct  (=> (and (not (and (and b_17@26 b_17@26) b_22@6)) (= (ControlFlow 0 17) 15)) anon55_correct)))
(let ((anon52_correct  (and (=> (= (ControlFlow 0 22) (- 0 23)) (=> (and (and b_17@25 b_17@25) b_22@6) (and (= neededTransfer@11 0.0) (= (U_2_real (MapType0Select Used_12Mask@3 l@@5 h)) initNeededTransfer@2)))) (=> (=> (and (and b_17@25 b_17@25) b_22@6) (and (= neededTransfer@11 0.0) (= (U_2_real (MapType0Select Used_12Mask@3 l@@5 h)) initNeededTransfer@2))) (=> (and (= b_23@0  (and b_17@25 b_22@6)) (= b_23@1  (and b_23@0 (state Result_7Heap Result_7Mask)))) (=> (and (and (= b_23@2  (and b_23@1 (sumMask Result_7Mask Ops_5Mask@12 Used_12Mask@3))) (= b_23@3  (and (and b_23@2 (IdenticalOnKnownLocations Ops_5Heap@5 Result_7Heap Ops_5Mask@12)) (IdenticalOnKnownLocations Used_12Heap@0 Result_7Heap Used_12Mask@3)))) (and (= b_23@4  (and b_23@3 (state Result_7Heap Result_7Mask))) (= b_17@26  (and b_17@25 b_23@4)))) (and (=> (= (ControlFlow 0 22) 21) anon95_Then_correct) (=> (= (ControlFlow 0 22) 17) anon95_Else_correct))))))))
(let ((anon94_Else_correct  (=> (>= 0.0 takeTransfer@5) (=> (and (= neededTransfer@11 neededTransfer@9) (= Mask@7 Mask@5)) (=> (and (and (= Heap@7 Heap@5) (= b_22@6 b_22@3)) (and (= Used_12Mask@3 Used_12Mask@1) (= (ControlFlow 0 26) 22))) anon52_correct)))))
(let ((anon94_Then_correct  (=> (> takeTransfer@5 0.0) (=> (and (and (= neededTransfer@10 (- neededTransfer@9 takeTransfer@5)) (= Used_12Mask@2 (MapType0Store Used_12Mask@1 l@@5 h (real_2_U (+ (U_2_real (MapType0Select Used_12Mask@1 l@@5 h)) takeTransfer@5))))) (and (= b_22@4  (and b_22@3 (state Used_12Heap@0 Used_12Mask@2))) (= b_22@5  (and b_22@4 (= (MapType1Select Heap@5 l@@5 h) (MapType1Select Used_12Heap@0 l@@5 h)))))) (=> (and (and (and (= Mask@6 (MapType0Store Mask@5 l@@5 h (real_2_U (- (U_2_real (MapType0Select Mask@5 l@@5 h)) takeTransfer@5)))) (= Heap@6 (MapType1Store Heap@5 null (|wand_5#sm| l@@5 FullPerm l@@5 FullPerm l@@5 FullPerm) (MapType0Store (MapType1Select Heap@5 null (|wand_5#sm| l@@5 FullPerm l@@5 FullPerm l@@5 FullPerm)) l@@5 h (bool_2_U true))))) (and (= neededTransfer@11 neededTransfer@10) (= Mask@7 Mask@6))) (and (and (= Heap@7 Heap@6) (= b_22@6 b_22@5)) (and (= Used_12Mask@3 Used_12Mask@2) (= (ControlFlow 0 25) 22)))) anon52_correct)))))
(let ((anon93_Else_correct  (=> (and (< maskTransfer@5 neededTransfer@9) (= takeTransfer@5 maskTransfer@5)) (and (=> (= (ControlFlow 0 28) 25) anon94_Then_correct) (=> (= (ControlFlow 0 28) 26) anon94_Else_correct)))))
(let ((anon93_Then_correct  (=> (and (<= neededTransfer@9 maskTransfer@5) (= takeTransfer@5 neededTransfer@9)) (and (=> (= (ControlFlow 0 27) 25) anon94_Then_correct) (=> (= (ControlFlow 0 27) 26) anon94_Else_correct)))))
(let ((anon92_Then_correct  (=> (and (and (and (and (and b_17@25 b_17@25) b_22@3) true) (> neededTransfer@9 0.0)) (= maskTransfer@5 (U_2_real (MapType0Select Mask@5 l@@5 h)))) (and (=> (= (ControlFlow 0 29) 27) anon93_Then_correct) (=> (= (ControlFlow 0 29) 28) anon93_Else_correct)))))
(let ((anon92_Else_correct  (=> (not (and (and (and (and b_17@25 b_17@25) b_22@3) true) (> neededTransfer@9 0.0))) (=> (and (= neededTransfer@11 neededTransfer@9) (= Mask@7 Mask@5)) (=> (and (and (= Heap@7 Heap@5) (= b_22@6 b_22@3)) (and (= Used_12Mask@3 Used_12Mask@1) (= (ControlFlow 0 24) 22))) anon52_correct)))))
(let ((anon91_Else_correct  (=> (>= 0.0 takeTransfer@4) (=> (and (and (= Ops_5Mask@12 Ops_5Mask@10) (= Used_12Mask@1 ZeroMask)) (and (= b_22@3 b_22@0) (= neededTransfer@9 FullPerm))) (and (=> (= (ControlFlow 0 32) 29) anon92_Then_correct) (=> (= (ControlFlow 0 32) 24) anon92_Else_correct))))))
(let ((anon91_Then_correct  (=> (and (> takeTransfer@4 0.0) (= neededTransfer@8 (- FullPerm takeTransfer@4))) (=> (and (and (and (= Used_12Mask@0 (MapType0Store ZeroMask l@@5 h (real_2_U (+ (U_2_real (MapType0Select ZeroMask l@@5 h)) takeTransfer@4)))) (= b_22@1  (and b_22@0 (state Used_12Heap@0 Used_12Mask@0)))) (and (= b_22@2  (and b_22@1 (= (MapType1Select Ops_5Heap@5 l@@5 h) (MapType1Select Used_12Heap@0 l@@5 h)))) (= Ops_5Mask@11 (MapType0Store Ops_5Mask@10 l@@5 h (real_2_U (- (U_2_real (MapType0Select Ops_5Mask@10 l@@5 h)) takeTransfer@4)))))) (and (and (= Ops_5Mask@12 Ops_5Mask@11) (= Used_12Mask@1 Used_12Mask@0)) (and (= b_22@3 b_22@2) (= neededTransfer@9 neededTransfer@8)))) (and (=> (= (ControlFlow 0 31) 29) anon92_Then_correct) (=> (= (ControlFlow 0 31) 24) anon92_Else_correct))))))
(let ((anon90_Else_correct  (=> (and (< maskTransfer@4 FullPerm) (= takeTransfer@4 maskTransfer@4)) (and (=> (= (ControlFlow 0 34) 31) anon91_Then_correct) (=> (= (ControlFlow 0 34) 32) anon91_Else_correct)))))
(let ((anon90_Then_correct  (=> (and (<= FullPerm maskTransfer@4) (= takeTransfer@4 FullPerm)) (and (=> (= (ControlFlow 0 33) 31) anon91_Then_correct) (=> (= (ControlFlow 0 33) 32) anon91_Else_correct)))))
(let ((anon89_Then_correct  (=> (and (and (and (and (and b_17@25 b_17@25) b_22@0) true) (> FullPerm 0.0)) (= maskTransfer@4 (U_2_real (MapType0Select Ops_5Mask@10 l@@5 h)))) (and (=> (= (ControlFlow 0 35) 33) anon90_Then_correct) (=> (= (ControlFlow 0 35) 34) anon90_Else_correct)))))
(let ((anon89_Else_correct  (=> (not (and (and (and (and b_17@25 b_17@25) b_22@0) true) (> FullPerm 0.0))) (=> (and (and (= Ops_5Mask@12 Ops_5Mask@10) (= Used_12Mask@1 ZeroMask)) (and (= b_22@3 b_22@0) (= neededTransfer@9 FullPerm))) (and (=> (= (ControlFlow 0 30) 29) anon92_Then_correct) (=> (= (ControlFlow 0 30) 24) anon92_Else_correct))))))
(let ((anon40_correct  (=> (and (= b_22@0  (and b_22 (state Used_12Heap@0 ZeroMask))) (= initNeededTransfer@2 (+ (U_2_real (MapType0Select ZeroMask l@@5 h)) FullPerm))) (and (=> (= (ControlFlow 0 36) (- 0 37)) (>= FullPerm 0.0)) (=> (>= FullPerm 0.0) (and (=> (= (ControlFlow 0 36) 35) anon89_Then_correct) (=> (= (ControlFlow 0 36) 30) anon89_Else_correct)))))))
(let ((anon39_correct  (=> (= Ops_5Heap@4 (MapType1Store Ops_5Heap@3 null (|Q#sm| (MapType1Select Ops_5Heap@3 l@@5 h)) (MapType0Store (MapType1Select Ops_5Heap@3 null (|Q#sm| (MapType1Select Ops_5Heap@3 l@@5 h))) (MapType1Select Ops_5Heap@3 l@@5 h) h (bool_2_U true)))) (=> (and (and (and (state Ops_5Heap@4 Ops_5Mask@9) (= b_17@24  (and b_17@23 (state Ops_5Heap@4 Ops_5Mask@9)))) (and (= Ops_5Heap@5 Ops_5Heap@4) (= b_17@25 b_17@24))) (and (and (= Heap@5 Heap@4) (= Mask@5 Mask@4)) (and (= Ops_5Mask@10 Ops_5Mask@9) (= (ControlFlow 0 39) 36)))) anon40_correct))))
(let ((anon88_Else_correct  (=> (HasDirectPerm Ops_5Mask@9 null (Q (MapType1Select Ops_5Heap@0 l@@5 h))) (=> (and (= Ops_5Heap@3 Ops_5Heap@0) (= (ControlFlow 0 41) 39)) anon39_correct))))
(let ((anon88_Then_correct  (=> (not (HasDirectPerm Ops_5Mask@9 null (Q (MapType1Select Ops_5Heap@0 l@@5 h)))) (=> (and (and (= Ops_5Heap@1 (MapType1Store Ops_5Heap@0 null (|Q#sm| (MapType1Select Ops_5Heap@0 l@@5 h)) ZeroPMask)) (= Ops_5Heap@2 (MapType1Store Ops_5Heap@1 null (Q (MapType1Select Ops_5Heap@1 l@@5 h)) freshVersion@0))) (and (= Ops_5Heap@3 Ops_5Heap@2) (= (ControlFlow 0 40) 39))) anon39_correct))))
(let ((anon37_correct  (and (=> (= (ControlFlow 0 42) (- 0 43)) (=> (and b_17@19 b_20@6) (not (= (MapType1Select Result_6Heap (MapType1Select Result_6Heap l@@5 h) h) null)))) (=> (=> (and b_17@19 b_20@6) (not (= (MapType1Select Result_6Heap (MapType1Select Result_6Heap l@@5 h) h) null))) (=> (= b_17@20  (and b_17@19 b_20@6)) (=> (and (= b_17@21  (and b_17@20 (= Used_11Heap@0 Ops_5Heap@0))) (= Ops_5Mask@9 (MapType0Store Ops_5Mask@8 null (Q (MapType1Select Ops_5Heap@0 l@@5 h)) (real_2_U (+ (U_2_real (MapType0Select Ops_5Mask@8 null (Q (MapType1Select Ops_5Heap@0 l@@5 h)))) FullPerm))))) (=> (and (and (= b_17@22  (and b_17@21 (state Ops_5Heap@0 Ops_5Mask@9))) (= b_17@23  (and b_17@22 (state Ops_5Heap@0 Ops_5Mask@9)))) (and (|Q#trigger| Ops_5Heap@0 (Q (MapType1Select Ops_5Heap@0 l@@5 h))) (= (MapType1Select Ops_5Heap@0 null (Q (MapType1Select Ops_5Heap@0 l@@5 h))) (FrameFragment (MapType1Select Ops_5Heap@0 (MapType1Select Result_6Heap l@@5 h) h))))) (and (=> (= (ControlFlow 0 42) 40) anon88_Then_correct) (=> (= (ControlFlow 0 42) 41) anon88_Else_correct)))))))))
(let ((anon87_Else_correct  (=> (and (not b_17@19) (= (ControlFlow 0 48) 42)) anon37_correct)))
(let ((anon87_Then_correct  (=> b_17@19 (and (=> (= (ControlFlow 0 45) (- 0 47)) (HasDirectPerm Result_6Mask l@@5 h)) (=> (HasDirectPerm Result_6Mask l@@5 h) (and (=> (= (ControlFlow 0 45) (- 0 46)) (HasDirectPerm Result_6Mask (MapType1Select Result_6Heap l@@5 h) h)) (=> (HasDirectPerm Result_6Mask (MapType1Select Result_6Heap l@@5 h) h) (=> (= (ControlFlow 0 45) 42) anon37_correct))))))))
(let ((anon86_Then_correct  (=> (and b_17@19 b_20@6) (and (=> (= (ControlFlow 0 49) 45) anon87_Then_correct) (=> (= (ControlFlow 0 49) 48) anon87_Else_correct)))))
(let ((anon86_Else_correct  (=> (and (not (and b_17@19 b_20@6)) (= (ControlFlow 0 44) 42)) anon37_correct)))
(let ((anon34_correct  (and (=> (= (ControlFlow 0 50) (- 0 51)) (=> (and b_17@16 b_20@6) (and (= neededTransfer@7 0.0) (= (U_2_real (MapType0Select Used_11Mask@3 rcvLocal@0 h)) initNeededTransfer@1)))) (=> (=> (and b_17@16 b_20@6) (and (= neededTransfer@7 0.0) (= (U_2_real (MapType0Select Used_11Mask@3 rcvLocal@0 h)) initNeededTransfer@1))) (=> (and (and (and (= b_21@0  (and b_17@16 b_20@6)) (= b_21@1  (and b_21@0 (state Result_6Heap Result_6Mask)))) (and (= b_21@2  (and b_21@1 (sumMask Result_6Mask Ops_5Mask@8 Used_11Mask@3))) (= b_21@3  (and (and b_21@2 (IdenticalOnKnownLocations Ops_5Heap@0 Result_6Heap Ops_5Mask@8)) (IdenticalOnKnownLocations Used_11Heap@0 Result_6Heap Used_11Mask@3))))) (and (and (= b_21@4  (and b_21@3 (state Result_6Heap Result_6Mask))) (= b_17@17  (and b_17@16 b_21@4))) (and (= b_17@18  (and b_17@17 b_20@6)) (= b_17@19  (and b_17@18 (= Used_11Heap@0 Ops_5Heap@0)))))) (and (=> (= (ControlFlow 0 50) 49) anon86_Then_correct) (=> (= (ControlFlow 0 50) 44) anon86_Else_correct)))))))
(let ((anon85_Else_correct  (=> (>= 0.0 takeTransfer@3) (=> (and (= Mask@4 Mask@2) (= neededTransfer@7 neededTransfer@5)) (=> (and (and (= Heap@4 Heap@2) (= b_20@6 b_20@3)) (and (= Used_11Mask@3 Used_11Mask@1) (= (ControlFlow 0 54) 50))) anon34_correct)))))
(let ((anon85_Then_correct  (=> (> takeTransfer@3 0.0) (=> (and (and (= neededTransfer@6 (- neededTransfer@5 takeTransfer@3)) (= Used_11Mask@2 (MapType0Store Used_11Mask@1 rcvLocal@0 h (real_2_U (+ (U_2_real (MapType0Select Used_11Mask@1 rcvLocal@0 h)) takeTransfer@3))))) (and (= b_20@4  (and b_20@3 (state Used_11Heap@0 Used_11Mask@2))) (= b_20@5  (and b_20@4 (= (MapType1Select Heap@2 rcvLocal@0 h) (MapType1Select Used_11Heap@0 rcvLocal@0 h)))))) (=> (and (and (and (= Mask@3 (MapType0Store Mask@2 rcvLocal@0 h (real_2_U (- (U_2_real (MapType0Select Mask@2 rcvLocal@0 h)) takeTransfer@3)))) (= Heap@3 (MapType1Store Heap@2 null (|wand_5#sm| l@@5 FullPerm l@@5 FullPerm l@@5 FullPerm) (MapType0Store (MapType1Select Heap@2 null (|wand_5#sm| l@@5 FullPerm l@@5 FullPerm l@@5 FullPerm)) (MapType1Select Heap@2 l@@5 h) h (bool_2_U true))))) (and (= Mask@4 Mask@3) (= neededTransfer@7 neededTransfer@6))) (and (and (= Heap@4 Heap@3) (= b_20@6 b_20@5)) (and (= Used_11Mask@3 Used_11Mask@2) (= (ControlFlow 0 53) 50)))) anon34_correct)))))
(let ((anon84_Else_correct  (=> (and (< maskTransfer@3 neededTransfer@5) (= takeTransfer@3 maskTransfer@3)) (and (=> (= (ControlFlow 0 56) 53) anon85_Then_correct) (=> (= (ControlFlow 0 56) 54) anon85_Else_correct)))))
(let ((anon84_Then_correct  (=> (and (<= neededTransfer@5 maskTransfer@3) (= takeTransfer@3 neededTransfer@5)) (and (=> (= (ControlFlow 0 55) 53) anon85_Then_correct) (=> (= (ControlFlow 0 55) 54) anon85_Else_correct)))))
(let ((anon83_Then_correct  (=> (and (and (and (and b_17@16 b_20@3) true) (> neededTransfer@5 0.0)) (= maskTransfer@3 (U_2_real (MapType0Select Mask@2 rcvLocal@0 h)))) (and (=> (= (ControlFlow 0 57) 55) anon84_Then_correct) (=> (= (ControlFlow 0 57) 56) anon84_Else_correct)))))
(let ((anon83_Else_correct  (=> (not (and (and (and b_17@16 b_20@3) true) (> neededTransfer@5 0.0))) (=> (and (= Mask@4 Mask@2) (= neededTransfer@7 neededTransfer@5)) (=> (and (and (= Heap@4 Heap@2) (= b_20@6 b_20@3)) (and (= Used_11Mask@3 Used_11Mask@1) (= (ControlFlow 0 52) 50))) anon34_correct)))))
(let ((anon82_Else_correct  (=> (>= 0.0 takeTransfer@2) (=> (and (and (= Ops_5Mask@8 Ops_5Mask@6) (= Used_11Mask@1 ZeroMask)) (and (= b_20@3 b_20@0) (= neededTransfer@5 FullPerm))) (and (=> (= (ControlFlow 0 60) 57) anon83_Then_correct) (=> (= (ControlFlow 0 60) 52) anon83_Else_correct))))))
(let ((anon82_Then_correct  (=> (and (> takeTransfer@2 0.0) (= neededTransfer@4 (- FullPerm takeTransfer@2))) (=> (and (and (and (= Used_11Mask@0 (MapType0Store ZeroMask rcvLocal@0 h (real_2_U (+ (U_2_real (MapType0Select ZeroMask rcvLocal@0 h)) takeTransfer@2)))) (= b_20@1  (and b_20@0 (state Used_11Heap@0 Used_11Mask@0)))) (and (= b_20@2  (and b_20@1 (= (MapType1Select Ops_5Heap@0 rcvLocal@0 h) (MapType1Select Used_11Heap@0 rcvLocal@0 h)))) (= Ops_5Mask@7 (MapType0Store Ops_5Mask@6 rcvLocal@0 h (real_2_U (- (U_2_real (MapType0Select Ops_5Mask@6 rcvLocal@0 h)) takeTransfer@2)))))) (and (and (= Ops_5Mask@8 Ops_5Mask@7) (= Used_11Mask@1 Used_11Mask@0)) (and (= b_20@3 b_20@2) (= neededTransfer@5 neededTransfer@4)))) (and (=> (= (ControlFlow 0 59) 57) anon83_Then_correct) (=> (= (ControlFlow 0 59) 52) anon83_Else_correct))))))
(let ((anon81_Else_correct  (=> (and (< maskTransfer@2 FullPerm) (= takeTransfer@2 maskTransfer@2)) (and (=> (= (ControlFlow 0 62) 59) anon82_Then_correct) (=> (= (ControlFlow 0 62) 60) anon82_Else_correct)))))
(let ((anon81_Then_correct  (=> (and (<= FullPerm maskTransfer@2) (= takeTransfer@2 FullPerm)) (and (=> (= (ControlFlow 0 61) 59) anon82_Then_correct) (=> (= (ControlFlow 0 61) 60) anon82_Else_correct)))))
(let ((anon80_Then_correct  (=> (and (and (and (and b_17@16 b_20@0) true) (> FullPerm 0.0)) (= maskTransfer@2 (U_2_real (MapType0Select Ops_5Mask@6 rcvLocal@0 h)))) (and (=> (= (ControlFlow 0 63) 61) anon81_Then_correct) (=> (= (ControlFlow 0 63) 62) anon81_Else_correct)))))
(let ((anon80_Else_correct  (=> (not (and (and (and b_17@16 b_20@0) true) (> FullPerm 0.0))) (=> (and (and (= Ops_5Mask@8 Ops_5Mask@6) (= Used_11Mask@1 ZeroMask)) (and (= b_20@3 b_20@0) (= neededTransfer@5 FullPerm))) (and (=> (= (ControlFlow 0 58) 57) anon83_Then_correct) (=> (= (ControlFlow 0 58) 52) anon83_Else_correct))))))
(let ((anon22_correct  (=> (and (= rcvLocal@0 (MapType1Select Ops_5Heap@0 l@@5 h)) (= initNeededTransfer@1 (+ (U_2_real (MapType0Select ZeroMask rcvLocal@0 h)) FullPerm))) (and (=> (= (ControlFlow 0 64) (- 0 65)) (>= FullPerm 0.0)) (=> (>= FullPerm 0.0) (and (=> (= (ControlFlow 0 64) 63) anon80_Then_correct) (=> (= (ControlFlow 0 64) 58) anon80_Else_correct)))))))
(let ((anon79_Else_correct  (=> (and (not b_17@16) (= (ControlFlow 0 69) 64)) anon22_correct)))
(let ((anon79_Then_correct  (=> b_17@16 (and (=> (= (ControlFlow 0 67) (- 0 68)) (HasDirectPerm Ops_5Mask@6 l@@5 h)) (=> (HasDirectPerm Ops_5Mask@6 l@@5 h) (=> (= (ControlFlow 0 67) 64) anon22_correct))))))
(let ((anon78_Then_correct  (=> (and b_17@16 b_20@0) (and (=> (= (ControlFlow 0 70) 67) anon79_Then_correct) (=> (= (ControlFlow 0 70) 69) anon79_Else_correct)))))
(let ((anon78_Else_correct  (=> (and (not (and b_17@16 b_20@0)) (= (ControlFlow 0 66) 64)) anon22_correct)))
(let ((anon19_correct  (=> (= b_20@0  (and b_20 (state Used_11Heap@0 ZeroMask))) (and (=> (= (ControlFlow 0 71) 70) anon78_Then_correct) (=> (= (ControlFlow 0 71) 66) anon78_Else_correct)))))
(let ((anon77_Else_correct  (=> (and (not b_17@16) (= (ControlFlow 0 74) 71)) anon19_correct)))
(let ((anon77_Then_correct  (=> b_17@16 (and (=> (= (ControlFlow 0 72) (- 0 73)) (HasDirectPerm Ops_5Mask@6 l@@5 h)) (=> (HasDirectPerm Ops_5Mask@6 l@@5 h) (=> (= (ControlFlow 0 72) 71) anon19_correct))))))
(let ((anon76_Then_correct  (=> b_17@16 (and (=> (= (ControlFlow 0 75) 72) anon77_Then_correct) (=> (= (ControlFlow 0 75) 74) anon77_Else_correct)))))
(let ((anon76_Else_correct  (=> (not b_17@16) (=> (and (= Ops_5Heap@5 Ops_5Heap@0) (= b_17@25 b_17@16)) (=> (and (and (= Heap@5 Heap@2) (= Mask@5 Mask@2)) (and (= Ops_5Mask@10 Ops_5Mask@6) (= (ControlFlow 0 38) 36))) anon40_correct)))))
(let ((anon15_correct  (and (=> (= (ControlFlow 0 77) (- 0 78)) (=> (and b_17@4 b_18@6) (and (= neededTransfer@3 0.0) (= (U_2_real (MapType0Select Used_10Mask@3 null (P l@@5))) initNeededTransfer@0)))) (=> (=> (and b_17@4 b_18@6) (and (= neededTransfer@3 0.0) (= (U_2_real (MapType0Select Used_10Mask@3 null (P l@@5))) initNeededTransfer@0))) (=> (and (= b_19@0  (and b_17@4 b_18@6)) (= b_19@1  (and b_19@0 (state Result_5Heap Result_5Mask)))) (=> (and (and (= b_19@2  (and b_19@1 (sumMask Result_5Mask Ops_5Mask@3 Used_10Mask@3))) (= b_19@3  (and (and b_19@2 (IdenticalOnKnownLocations Ops_5Heap@0 Result_5Heap Ops_5Mask@3)) (IdenticalOnKnownLocations Used_10Heap@0 Result_5Heap Used_10Mask@3)))) (and (= b_19@4  (and b_19@3 (state Result_5Heap Result_5Mask))) (= b_17@5  (and b_17@4 b_19@4)))) (=> (and (and (and (and (= b_17@6  (and b_17@5 b_18@6)) (= b_17@7  (and b_17@6 (= Used_10Heap@0 Ops_5Heap@0)))) (and (= b_17@8  (and b_17@7 (not (= l@@5 null)))) (= Ops_5Mask@4 (MapType0Store Ops_5Mask@3 l@@5 h (real_2_U (+ (U_2_real (MapType0Select Ops_5Mask@3 l@@5 h)) FullPerm)))))) (and (and (= b_17@9  (and b_17@8 (state Ops_5Heap@0 Ops_5Mask@4))) (= b_17@10  (and b_17@9 (not (= (MapType1Select Ops_5Heap@0 l@@5 h) null))))) (and (= b_17@11  (and b_17@10 (not (= (MapType1Select Ops_5Heap@0 l@@5 h) null)))) (= Ops_5Mask@5 (MapType0Store Ops_5Mask@4 (MapType1Select Ops_5Heap@0 l@@5 h) h (real_2_U (+ (U_2_real (MapType0Select Ops_5Mask@4 (MapType1Select Ops_5Heap@0 l@@5 h) h)) FullPerm))))))) (and (and (and (= b_17@12  (and b_17@11 (state Ops_5Heap@0 Ops_5Mask@5))) (= b_17@13  (and b_17@12 (not (= (MapType1Select Ops_5Heap@0 (MapType1Select Ops_5Heap@0 l@@5 h) h) null))))) (and (= b_17@14  (and b_17@13 (state Ops_5Heap@0 Ops_5Mask@5))) (= b_17@15  (and b_17@14 (state Ops_5Heap@0 Ops_5Mask@5))))) (and (and (= b_17@16 b_17@15) (= Mask@2 Mask@1)) (and (= Ops_5Mask@6 Ops_5Mask@5) (= Heap@2 Heap@1))))) (and (=> (= (ControlFlow 0 77) 75) anon76_Then_correct) (=> (= (ControlFlow 0 77) 38) anon76_Else_correct)))))))))
(let ((anon75_Else_correct  (=> (>= 0.0 takeTransfer@1) (=> (and (= Mask@1 ZeroMask) (= neededTransfer@3 neededTransfer@1)) (=> (and (and (= b_18@6 b_18@3) (= Used_10Mask@3 Used_10Mask@1)) (and (= Heap@1 Heap@@12) (= (ControlFlow 0 81) 77))) anon15_correct)))))
(let ((anon75_Then_correct  (=> (> takeTransfer@1 0.0) (=> (and (= neededTransfer@2 (- neededTransfer@1 takeTransfer@1)) (= Used_10Mask@2 (MapType0Store Used_10Mask@1 null (P l@@5) (real_2_U (+ (U_2_real (MapType0Select Used_10Mask@1 null (P l@@5))) takeTransfer@1))))) (=> (and (and (= b_18@4  (and b_18@3 (state Used_10Heap@0 Used_10Mask@2))) (= TempMask@1 (MapType0Store ZeroMask null (P l@@5) (real_2_U FullPerm)))) (and (= b_18@5  (and b_18@4 (IdenticalOnKnownLocations Heap@@12 Used_10Heap@0 TempMask@1))) (= Mask@0 (MapType0Store ZeroMask null (P l@@5) (real_2_U (- (U_2_real (MapType0Select ZeroMask null (P l@@5))) takeTransfer@1)))))) (=> (and (and (and (forall ((o_4 T@U) (f_9 T@U) ) (! (let ((B@@12 (FieldTypeInv1 (type f_9))))
(let ((A@@13 (FieldTypeInv0 (type f_9))))
 (=> (and (and (= (type o_4) RefType) (= (type f_9) (FieldType A@@13 B@@12))) (or (U_2_bool (MapType0Select (MapType1Select Heap@@12 null (|wand_5#sm| l@@5 FullPerm l@@5 FullPerm l@@5 FullPerm)) o_4 f_9)) (U_2_bool (MapType0Select (MapType1Select Heap@@12 null (|P#sm| l@@5)) o_4 f_9)))) (U_2_bool (MapType0Select newPMask@0 o_4 f_9)))))
 :qid |stdinbpl.1632:39|
 :skolemid |90|
 :pattern ( (MapType0Select newPMask@0 o_4 f_9))
)) (= Heap@0 (MapType1Store Heap@@12 null (|wand_5#sm| l@@5 FullPerm l@@5 FullPerm l@@5 FullPerm) newPMask@0))) (and (= Mask@1 Mask@0) (= neededTransfer@3 neededTransfer@2))) (and (and (= b_18@6 b_18@5) (= Used_10Mask@3 Used_10Mask@2)) (and (= Heap@1 Heap@0) (= (ControlFlow 0 80) 77)))) anon15_correct))))))
(let ((anon74_Else_correct  (=> (and (< maskTransfer@1 neededTransfer@1) (= takeTransfer@1 maskTransfer@1)) (and (=> (= (ControlFlow 0 83) 80) anon75_Then_correct) (=> (= (ControlFlow 0 83) 81) anon75_Else_correct)))))
(let ((anon74_Then_correct  (=> (and (<= neededTransfer@1 maskTransfer@1) (= takeTransfer@1 neededTransfer@1)) (and (=> (= (ControlFlow 0 82) 80) anon75_Then_correct) (=> (= (ControlFlow 0 82) 81) anon75_Else_correct)))))
(let ((anon73_Then_correct  (=> (and (and (and (and b_17@4 b_18@3) true) (> neededTransfer@1 0.0)) (= maskTransfer@1 (U_2_real (MapType0Select ZeroMask null (P l@@5))))) (and (=> (= (ControlFlow 0 84) 82) anon74_Then_correct) (=> (= (ControlFlow 0 84) 83) anon74_Else_correct)))))
(let ((anon73_Else_correct  (=> (not (and (and (and b_17@4 b_18@3) true) (> neededTransfer@1 0.0))) (=> (and (= Mask@1 ZeroMask) (= neededTransfer@3 neededTransfer@1)) (=> (and (and (= b_18@6 b_18@3) (= Used_10Mask@3 Used_10Mask@1)) (and (= Heap@1 Heap@@12) (= (ControlFlow 0 79) 77))) anon15_correct)))))
(let ((anon72_Else_correct  (=> (>= 0.0 takeTransfer@0) (=> (and (and (= Ops_5Mask@3 Ops_5Mask@1) (= Used_10Mask@1 ZeroMask)) (and (= b_18@3 b_18@0) (= neededTransfer@1 FullPerm))) (and (=> (= (ControlFlow 0 87) 84) anon73_Then_correct) (=> (= (ControlFlow 0 87) 79) anon73_Else_correct))))))
(let ((anon72_Then_correct  (=> (> takeTransfer@0 0.0) (=> (and (= neededTransfer@0 (- FullPerm takeTransfer@0)) (= Used_10Mask@0 (MapType0Store ZeroMask null (P l@@5) (real_2_U (+ (U_2_real (MapType0Select ZeroMask null (P l@@5))) takeTransfer@0))))) (=> (and (and (and (= b_18@1  (and b_18@0 (state Used_10Heap@0 Used_10Mask@0))) (= TempMask@0 (MapType0Store ZeroMask null (P l@@5) (real_2_U FullPerm)))) (and (= b_18@2  (and b_18@1 (IdenticalOnKnownLocations Ops_5Heap@0 Used_10Heap@0 TempMask@0))) (= Ops_5Mask@2 (MapType0Store Ops_5Mask@1 null (P l@@5) (real_2_U (- (U_2_real (MapType0Select Ops_5Mask@1 null (P l@@5))) takeTransfer@0)))))) (and (and (= Ops_5Mask@3 Ops_5Mask@2) (= Used_10Mask@1 Used_10Mask@0)) (and (= b_18@3 b_18@2) (= neededTransfer@1 neededTransfer@0)))) (and (=> (= (ControlFlow 0 86) 84) anon73_Then_correct) (=> (= (ControlFlow 0 86) 79) anon73_Else_correct)))))))
(let ((anon71_Else_correct  (=> (and (< maskTransfer@0 FullPerm) (= takeTransfer@0 maskTransfer@0)) (and (=> (= (ControlFlow 0 89) 86) anon72_Then_correct) (=> (= (ControlFlow 0 89) 87) anon72_Else_correct)))))
(let ((anon71_Then_correct  (=> (and (<= FullPerm maskTransfer@0) (= takeTransfer@0 FullPerm)) (and (=> (= (ControlFlow 0 88) 86) anon72_Then_correct) (=> (= (ControlFlow 0 88) 87) anon72_Else_correct)))))
(let ((anon70_Then_correct  (=> (and (and (and (and b_17@4 b_18@0) true) (> FullPerm 0.0)) (= maskTransfer@0 (U_2_real (MapType0Select Ops_5Mask@1 null (P l@@5))))) (and (=> (= (ControlFlow 0 90) 88) anon71_Then_correct) (=> (= (ControlFlow 0 90) 89) anon71_Else_correct)))))
(let ((anon70_Else_correct  (=> (not (and (and (and b_17@4 b_18@0) true) (> FullPerm 0.0))) (=> (and (and (= Ops_5Mask@3 Ops_5Mask@1) (= Used_10Mask@1 ZeroMask)) (and (= b_18@3 b_18@0) (= neededTransfer@1 FullPerm))) (and (=> (= (ControlFlow 0 85) 84) anon73_Then_correct) (=> (= (ControlFlow 0 85) 79) anon73_Else_correct))))))
(let ((anon69_Then_correct  (=> b_17@4 (=> (and (and (|P#trigger| Ops_5Heap@0 (P l@@5)) (= (MapType1Select Ops_5Heap@0 null (P l@@5)) (CombineFrames (FrameFragment (MapType1Select Ops_5Heap@0 l@@5 h)) (FrameFragment (MapType1Select Ops_5Heap@0 (MapType1Select Ops_5Heap@0 l@@5 h) h))))) (and (= b_18@0  (and b_18 (state Used_10Heap@0 ZeroMask))) (= initNeededTransfer@0 (+ (U_2_real (MapType0Select ZeroMask null (P l@@5))) FullPerm)))) (and (=> (= (ControlFlow 0 91) (- 0 92)) (>= FullPerm 0.0)) (=> (>= FullPerm 0.0) (and (=> (= (ControlFlow 0 91) 90) anon70_Then_correct) (=> (= (ControlFlow 0 91) 85) anon70_Else_correct))))))))
(let ((anon69_Else_correct  (=> (not b_17@4) (=> (and (and (= b_17@16 b_17@4) (= Mask@2 ZeroMask)) (and (= Ops_5Mask@6 Ops_5Mask@1) (= Heap@2 Heap@@12))) (and (=> (= (ControlFlow 0 76) 75) anon76_Then_correct) (=> (= (ControlFlow 0 76) 38) anon76_Else_correct))))))
(let ((anon2_correct  (=> (and (= b_17@3  (and b_17@2 (state Ops_5Heap@0 Ops_5Mask@1))) (= b_17@4  (and b_17@3 (state Ops_5Heap@0 Ops_5Mask@1)))) (and (=> (= (ControlFlow 0 93) 91) anon69_Then_correct) (=> (= (ControlFlow 0 93) 76) anon69_Else_correct)))))
(let ((anon68_Else_correct  (=> (and (and (not b_17@0) (= Ops_5Mask@1 ZeroMask)) (and (= b_17@2 b_17@0) (= (ControlFlow 0 95) 93))) anon2_correct)))
(let ((anon68_Then_correct  (=> (and b_17@0 (= Ops_5Mask@0 (MapType0Store ZeroMask null (P l@@5) (real_2_U (+ (U_2_real (MapType0Select ZeroMask null (P l@@5))) FullPerm))))) (=> (and (and (= b_17@1  (and b_17@0 (state Ops_5Heap@0 Ops_5Mask@0))) (= Ops_5Mask@1 Ops_5Mask@0)) (and (= b_17@2 b_17@1) (= (ControlFlow 0 94) 93))) anon2_correct))))
(let ((anon0_correct  (=> (and (and (state Heap@@12 ZeroMask) (U_2_bool (MapType1Select Heap@@12 l@@5 $allocated))) (and (= b_17@0  (and b_17 (state Ops_5Heap@0 ZeroMask))) (= b_16@0  (and b_16 (state Used_9Heap@0 ZeroMask))))) (and (=> (= (ControlFlow 0 96) 94) anon68_Then_correct) (=> (= (ControlFlow 0 96) 95) anon68_Else_correct)))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 97) 96) anon0_correct)))
PreconditionGeneratedEntry_correct))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
))
(check-sat)
(pop 1)
; Valid
(get-info :rlimit)
